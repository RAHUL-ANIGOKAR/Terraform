output "public_id" {
  value = aws_instance.demo-ec2-aws_instance.public_ip
}

output "Sg" {
  value = aws_vpc.demo-aws_vpc.default_security_group_id
}