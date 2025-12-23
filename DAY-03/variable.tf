variable "region" {
  description = "AWS REGION"
  type = string
  default = "ap-south-1"
}

variable "instance_type" {
    description = "Type of Instance to be created"
    type = string
    default = "t3.micro"
}

variable "ami_id" {
    description = "Ami Id"
    type = string
    default = "ami-02b8269d5e85954ef"
}

variable "Key_value"{
    description = "Pem key"
    type = string
    default = "instance-key"
}