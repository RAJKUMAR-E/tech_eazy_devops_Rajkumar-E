provider "aws" {
  region = var.aws_region
}

data "aws_key_pair" "loki_key" {
  key_name = "loki-prod-key"
}

resource "aws_instance" "loki_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.loki_key.key_name

  tags = {
    Name = var.name_tag
  }
}

resource "aws_security_group" "ssh_access" {
  name        = "loki-ssh-access"
  description = "Allow SSH from GitHub Actions"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


