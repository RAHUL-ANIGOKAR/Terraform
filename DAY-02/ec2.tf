resource "aws_instance" "demo_ec2" {
  ami                     = "ami-02b8269d5e85954ef"
  instance_type           = "t3.micro"
  key_name = "instance-key"
  security_groups = ["launch-wizard-1"]

  tags = {
    Name = "Ec2_aws_Terraform"
  }
}