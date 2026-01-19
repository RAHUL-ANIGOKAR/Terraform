provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://13.204.254.74:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "2584a160-160b-8248-4b03-b2cb0c366bdd"
      secret_id = "09093844-5cdd-03c3-4bb0-adb0f1988c60"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}   


resource "aws_instance" "demo-ec2" {
  ami = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  key_name = "instance-key"

  tags = {
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
}