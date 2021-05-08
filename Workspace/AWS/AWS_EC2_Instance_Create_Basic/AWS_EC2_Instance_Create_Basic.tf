provider "aws" {
  region = "ap-south-1"
  access_key = "Your Access Key"
  secret_key = "Your Secret Key"
}

resource "aws_instance" "MyRedhatOS"{
  ami = "ami-0a9d27a9f4f5c0efc"
  instance_type = "t2.micro"
  tags = {
    Name = "MyOS"
  }
}

output "Instance1_Details"{
    value = aws_instance.MyRedhatOS
}
