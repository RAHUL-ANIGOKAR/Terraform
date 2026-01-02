provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-lock-at-s3-demo-12345"
}

resource "aws_s3_bucket" "demo" {
  bucket = "rahul-devops-demo-bucket-12345"
}