output "aurora_endpoint" {
  description = "The endpoint of the Aurora cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "aurora_writer_instance" {
  description = "The writer instance endpoint of the Aurora cluster"
  value       = aws_rds_cluster_instance.aurora_instance[0].address
}