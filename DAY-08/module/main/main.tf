resource "aws_instance" "demo_instance" {
  ami = var.aws_instance_id
  instance_type = var.instance_type
  key_name = var.Key_name
}