variable "aws_region" {
  description = "Region on AWS"
  type = string
}

variable "ami_id" {
  description = "AMI ID for the aws instance"
  type = string
}

variable "instance_type" {
  description = "Type of Instance"
  type = string
}

variable "Key_value" {
  description = "Pem Key"
  type = string
}

variable "security_group" {
  description = "IN and OUT Bound Rules"
  type = list(string)
}

variable "SubNet_Id" {
  description = "SUBNET"
  type = string
}