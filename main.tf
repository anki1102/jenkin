provider "aws" {
  region = var.aws_region
<<<<<<< HEAD
}
=======
 }
>>>>>>> 7c3e74e0e893188e8108b9d4766bc1f5d37d5b23

resource "aws_vpc" "jenkin_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jenkin_vpc.id
}

resource "aws_subnet" "jenkin_subnet" {
  vpc_id     = aws_vpc.jenkin_vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.jenkin_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta-subnet1" {
  subnet_id = aws_subnet.jenkin_subnet.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_security_group" "jenkin_sg" {
  name_prefix = "jenkin_sg"
  vpc_id      = aws_vpc.jenkin_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "CICDInstance" {
  count         = 3
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = "ankitdev"
  subnet_id     = aws_subnet.jenkin_subnet.id
  vpc_security_group_ids = [aws_security_group.jenkin_sg.id]
  tags = {
    Name = "My jenkin launch Instance" 
  }
}
