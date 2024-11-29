terraform {
  required_version = ">= 1.5.0"
}

module "network" {
  source          = "./modules/network"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  environment     = var.environment
}

module "aurora" {
  source                 = "./modules/aurora"
  cluster_identifier     = "aurora-${var.environment}"
  master_username        = var.db_username
  master_password        = var.db_password
  engine_version         = "13.9"
  instance_class         = "db.r6g.large"
  vpc_id                 = module.network.vpc_id
  subnet_ids             = module.network.private_subnet_ids
  secret_name            = var.secret_name
  backup_retention_days  = 7
  enable_performance_insights = true
  environment            = var.environment
}

# output "aurora_endpoint" {
#   value = module.aurora.aurora_endpoint
# }

# output "aurora_security_group_id" {
#   value = module.network.aurora_security_group_id
# }
