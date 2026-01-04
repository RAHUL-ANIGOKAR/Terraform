resource "aws_vpc" "demo-aws_vpc" {
    cidr_block = var.cidr_block
}

resource "aws_subnet" "demo-subnet" {
  vpc_id = aws_vpc.demo-aws_vpc.id
  cidr_block = var.cidr_for_subnet
  availability_zone = var.availability_zone_for_sb
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "demo-igw" {
    vpc_id = aws_vpc.demo-aws_vpc.id
}

resource "aws_route_table" "demo-rt" {
  vpc_id = aws_vpc.demo-aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
  }
}

resource "aws_route_table_association" "demo-asc" {
  subnet_id = aws_subnet.demo-subnet.id
  route_table_id = aws_route_table.demo-rt.id
}

resource "aws_security_group" "webSG" {
  name = "demo-Sg"  
  vpc_id = aws_vpc.demo-aws_vpc.id

    ingress {
        description = "HTTP from VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "WEB-SG"
    }
}

resource "aws_instance" "demo-ec2-aws_instance" {
  ami = var.ami-id
  instance_type = var.instance_type
  key_name =   var.Key_Pair
  vpc_security_group_ids = [aws_security_group.webSG.id]  
  subnet_id = aws_subnet.demo-subnet.id
  tags = {
    Name = "EC2-at-ubuntu"
  }
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("C:/Users/user/instance-key.pem")
    host = self.public_ip
  }
 provisioner "file" {
  source      = "app.py"
  destination = "/home/ubuntu/app.py"
}

provisioner "remote-exec" {
  inline = [
    "echo 'Hello from Ubuntu'",
    "sudo apt update -y",
    "sudo apt install -y python3 python3-venv",
    "cd /home/ubuntu",
    "python3 -m venv venv",
    "venv/bin/pip install flask",
    "nohup venv/bin/python /home/ubuntu/app.py > app.log 2>&1 &"
  ]
}
}

