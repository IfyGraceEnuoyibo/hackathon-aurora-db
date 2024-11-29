terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "aurora-database/root-state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}