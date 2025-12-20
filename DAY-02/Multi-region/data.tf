# Mumbai AMI
data "aws_ami" "amazon_linux_mumbai" {
  provider    = aws.mumbai
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# Hyderabad AMI
data "aws_ami" "amazon_linux_hyderabad" {
  provider    = aws.hyderabad
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
