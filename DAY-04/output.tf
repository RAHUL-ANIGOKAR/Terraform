output "public-ip-address" {
  value = aws_instance.example_at_tf.public_ip
}

output "instance_type" {
  value = aws_instance.example_at_tf.instance_type
}