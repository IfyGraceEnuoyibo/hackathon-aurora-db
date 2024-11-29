output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private_subnet[*].id
}

output "aurora_security_group_id" {
  description = "ID of the security group for Aurora"
  value       = aws_security_group.aurora_sg.id
}