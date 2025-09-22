provider "aws" {
  region = "ap-south-1"
}

# Key Pair (assumes loki-prod-key already exists in AWS)
data "aws_key_pair" "loki_key" {
  key_name = "loki-prod-key"
}

# Security Group for SSH
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow SSH from anywhere"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-server-sg"
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = "t3.micro"
  key_name                    = data.aws_key_pair.loki_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "web-server"
  }
}

# Lookup Amazon Linux 2023 AMI (kernel 6.1, x86_64)
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}





