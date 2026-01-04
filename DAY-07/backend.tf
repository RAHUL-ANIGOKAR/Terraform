terraform {
    backend "s3" {
      bucket = "my-s2-demo-bucket"
      key = "main/terraform.tfstate"
      region = "ap-south-1"
    }
}