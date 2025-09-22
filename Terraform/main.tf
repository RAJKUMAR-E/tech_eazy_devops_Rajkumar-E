provider "aws" {
  region = var.aws_region
}

data "aws_key_pair" "loki_key" {
  key_name = "loki-prod-key"
}

resource "aws_instance" "loki_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.name_tag
  }
}




