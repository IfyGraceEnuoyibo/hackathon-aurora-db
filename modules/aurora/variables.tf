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
  type = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Aurora cluster"
  type = list(string)
  default = [ "subnet-096a9cf11a7e08433", "subnet-050d88f53c87c3bcb" ]
}

variable "secret_name" {
  description = "Name of the AWS Secrets Manager secret"
}

variable "enable_performance_insights" {
  description = "Enable performance insights for Aurora"
  type = bool
  default = true
}

variable "environment" {
  description = "Deployment environment (dev or prod)"
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access the Aurora cluster"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "performance_insights_kms_key_id" {
  description = "The KMS key ID used to encrypt Performance Insights data"
  type        = string
  default     = null  # Use null if not explicitly providing a KMS key
}
