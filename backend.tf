terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Hackathon-ify"

    workspaces {
      name = "hackathon-aurora-db"
    }
  }
}