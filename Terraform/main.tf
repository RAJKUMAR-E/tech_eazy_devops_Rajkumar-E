provider "aws" {
  region     = "us-west-2"
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY_ID"
}

resource "aws_security_group" "ssh_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
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

resource "aws_instance" "demo" {
  ami                    = "ami-04e914639d0cca79a" # Update AMI for your region and needs
  instance_type          = "t2.micro"
  key_name               = "your_key_pair"         # Existing AWS EC2 key pair name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  tags = {
    Name = "TerraformDemoEC2"
  }
}
