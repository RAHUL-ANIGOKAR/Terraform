provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "demo_ec2" {
  ami                     = "ami-02b8269d5e85954ef"
  instance_type           = "t3.micro"
  key_name = "instance-key"

  tags = {
    Name = "Ec2_at_Terraform"
  }
}