output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.loki_ec2.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.loki.public_ip
}
