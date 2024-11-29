variable "cluster_identifier" {
  description = "The identifier for the Aurora cluster"
}

variable "master_username" {
  description = "The master username for the Aurora cluster"
}

variable "master_password" {
  description = "The master password for the Aurora cluster"
}

variable "engine_version" {
  description = "The engine version for Aurora PostgreSQL"
}

variable "instance_class" {
  description = "Instance class for Aurora instances"
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
}

variable "vpc_id" {
  description = "VPC ID for the Aurora cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Aurora cluster"
}

variable "secret_name" {
  description = "Name of the AWS Secrets Manager secret"
}

variable "enable_performance_insights" {
  description = "Enable performance insights for Aurora"
}

variable "environment" {
  description = "Deployment environment (dev or prod)"
}
