resource "aws_instance" "example_at_tf" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.Key_value
  vpc_security_group_ids = var.security_group
  subnet_id = var.SubNet_Id

  tags = {
    Name = "EC2_at_DEVOPS"
  }
}