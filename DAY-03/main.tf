resource "aws_instance" "demo-ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.Key_value
  tags = {
    Name = "EC2-at-AWS"
  }
}