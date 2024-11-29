output "aurora_endpoint" {
  description = "The endpoint of the Aurora cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "aurora_reader_endpoint" {
  description = "The reader endpoint of the Aurora cluster (for read operations)"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "aurora_instance_endpoints" {
  description = "The endpoints of the Aurora instances (for debugging or direct connection)"
  value       = [for instance in aws_rds_cluster_instance.aurora_instance : instance.endpoint]
}