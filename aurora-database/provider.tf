provider "aws" {
  region = "us-east-1"
}

provider "postgresql" {
  host     = module.aurora.aurora_endpoint
  port     = 5432
  username = var.db_username
  password = var.db_password
  sslmode  = "require"
}