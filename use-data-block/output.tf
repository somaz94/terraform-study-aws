# output.tf

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.ec2.id
}

output "public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.ec2.public_ip
  sensitive   = true
}

output "security_group_id" {
  description = "The ID of the created security group"
  value       = aws_security_group.allow_ssh.id
}

output "security_group_ingress_rules" {
  description = "The ingress rules of the created security group"
  value       = aws_security_group.allow_ssh.ingress
}
