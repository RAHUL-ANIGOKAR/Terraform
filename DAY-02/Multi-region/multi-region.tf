# EC2 in Mumbai (ap-south-1)
resource "aws_instance" "mumbai_ec2" {
  provider      = aws.mumbai
  ami           = data.aws_ami.amazon_linux_mumbai.id
  instance_type = "t3.micro"
  key_name      = "instance-key-mumbai"

  vpc_security_group_ids = ["sg-0e4c939636bd0b74c"]

  tags = {
    Name   = "EC2-Mumbai"
    Region = "ap-south-1"
  }
}

# EC2 in Hyderabad (ap-south-2)
resource "aws_instance" "hyderabad_ec2" {
  provider      = aws.hyderabad
  ami           = data.aws_ami.amazon_linux_hyderabad.id
  instance_type = "t3.micro"
  key_name      = "instance-key-hyderabad"

  vpc_security_group_ids = ["sg-0e4c939636bd0b74c"]

  tags = {
    Name   = "EC2-Hyderabad"
    Region = "ap-south-2"
  }
}
