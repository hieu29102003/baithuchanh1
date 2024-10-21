provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}
module "nat" {
  source           = "./modules/NAT"
  public_subnet_id = module.vpc.public_subnet_id

}
module "route_table" {
  source            = "./modules/route_table"
  vpc_id            = module.vpc.vpc_id
  gateway_id        = module.vpc.internet_gateway_id
  public_subnet_id  = module.vpc.public_subnet_id
  nat_gateway_id    = module.nat.nat_gateway_id
  private_subnet_id = module.vpc.private_subnet_id
}



module "security_groups" {
  source                  = "./modules/SCG"
  vpc_id                  = module.vpc.vpc_id
  allowed_ip              = var.allowed_ip 
}


module "ec2" {
  source                  = "./modules/EC2"
  ami                     = var.ami
  instance_type           = var.instance_type
  public_subnet_id        = module.vpc.public_subnet_id
  private_subnet_id       = module.vpc.private_subnet_id
  public_security_group   = module.security_groups.public_security_group_id
  private_security_group  = module.security_groups.private_security_group_id
}