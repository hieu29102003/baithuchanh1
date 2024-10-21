
# Hướng dẫn sử dụng AWS với Terraform

## Giới thiệu

Terraform là một công cụ mã hóa hạ tầng cho phép bạn định nghĩa và cung cấp hạ tầng bằng mã. Hướng dẫn này sẽ hướng dẫn bạn cách sử dụng Terraform với AWS.

## Yêu cầu

- Tài khoản AWS
- Terraform đã được cài đặt (phiên bản 0.12 trở lên)
- AWS CLI đã được cài đặt và cấu hình

## Cài đặt Terraform

1. Tải xuống Terraform từ [trang chính thức](https://www.terraform.io/downloads.html).
2. Giải nén file tải về và di chuyển tệp Terraform vào thư mục PATH của bạn (ví dụ: `C:\Program Files\Terraform`).

## Cài đặt AWS CLI

1. Tải xuống AWS CLI từ [đây](https://aws.amazon.com/cli/).
2. Cài đặt AWS CLI theo hướng dẫn trên trang.
3. Mở terminal và chạy lệnh sau để cấu hình AWS CLI:

Nhập Access Key, Secret Key, Region và định dạng đầu ra theo yêu cầu.

Tạo file cấu hình Terraform
Tạo một thư mục mới cho dự án Terraform:


provider "aws" {
  region = "us-east-1"  # Thay đổi theo vùng bạn muốn
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Thay đổi theo AMI của bạn
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
Khởi tạo Terraform
Chạy lệnh sau để khởi tạo Terraform:

Sao chépterraform init
Kiểm tra kế hoạch triển khai
Trước khi triển khai, bạn có thể kiểm tra kế hoạch bằng lệnh:


terraform plan
Triển khai tài nguyên
Để triển khai tài nguyên, chạy lệnh:


terraform apply
Nhập yes khi được yêu cầu xác nhận.

Xóa tài nguyên
Khi bạn không còn cần tài nguyên nữa, bạn có thể xóa chúng bằng lệnh:


terraform destroy
Nhập yes để xác nhận.

Tài liệu tham khảo
Terraform Documentation
AWS Provider Documentation
