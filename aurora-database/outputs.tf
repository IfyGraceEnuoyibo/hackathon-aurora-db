output "aurora_endpoint" {
  description = "The endpoint of the Aurora cluster"
  value       = module.aurora.aurora_endpoint
}

output "aurora_security_group_id" {
  description = "The ID of the Aurora security group"
  value       = module.network.aurora_security_group_id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.network.private_subnet_ids
}