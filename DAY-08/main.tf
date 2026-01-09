provider "aws" {
  region = "ap-south-1"
}

variable "aws-region" {
  description = "AWS Region"
}

variable "aws_instance_id" {
  description = "AWS AMI"
}

variable "instance_type" {
  description = "Instance type"
  type = map(string)

  default = {
    "dev" = "t3.micro"
    "stage" = "t3.small"
    "prod" = "c7i-flex.large"
  }
}

variable "Key_name" {
  description = "Pem key"
}

module "ec2" {
  source = "./module/main"
  aws_instance_id = var.aws_instance_id   
  aws-region = var.aws-region
  instance_type = lookup(var.instance_type, terraform.workspace , "t3.micro")
  Key_name = var.Key_name
}