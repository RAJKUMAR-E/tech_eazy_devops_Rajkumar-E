variable "aws_region" {
  description = "AWS region to deploy EC2"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2 in ap-south-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "name_tag" {
  description = "Name tag for EC2 instance"
  type        = string
  default     = "loki-EC2"
}

variable "availability_zone" {
  default     = "ap-south-1a"
  description = "AZ for default subnet selection"
}

variable "key_name" {
  default     = "loki-prod-key"
  description = "Name of the existing EC2 key pair"
}

