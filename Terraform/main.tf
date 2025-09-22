provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "loki_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.name_tag
  }
}
