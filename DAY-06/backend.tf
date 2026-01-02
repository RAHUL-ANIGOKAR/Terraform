 terraform {
   backend "s3" {
     bucket = "tf-lock-at-s3-demo-12345"
     key    = "rahuldevops/terraform.tfstate"
     region = "ap-south-1"
   }
 }
