variable "aws-region" {
  description = "AWS REGION"
  type = string
}

variable "cidr_block" {
  description = "CIDR FOR VPC"
  type = string
}

variable "cidr_for_subnet" {
  description = "CIDR FOR SUBNET"
  type = string
}

variable "availability_zone_for_sb" {
  description = "AZ for Subnet"
  type = string
}

variable "ami-id" {
  description = "AMI ID"
  type = string
}

variable "instance_type" {
  description = "Instance type"
  type = string
}

variable "Key_Pair" {
  description = "Pem Key"
  type = string
}

