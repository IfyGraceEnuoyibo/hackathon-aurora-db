resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "aurora-postgresql"
  engine_version          = var.engine_version
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_days
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnets.name
  enable_performance_insights = var.enable_performance_insights
  tags = {
    Environment = var.environment
  }
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count              = 2
  identifier         = "${var.cluster_identifier}-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = var.instance_class
  engine             = "aurora-postgresql"
}

# Security Group for Aurora
resource "aws_security_group" "aurora_sg" {
  name        = "${var.cluster_identifier}-sg"
  description = "Security group for Aurora cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_identifier}-sg"
  }
}

# Subnet Group for Aurora
resource "aws_db_subnet_group" "aurora_subnets" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.cluster_identifier}-subnet-group"
  }
}