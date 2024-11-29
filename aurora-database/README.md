# Aurora PostgreSQL with Terraform

This project sets up an AWS Aurora PostgreSQL database with Terraform, including the required schemas and CI/CD pipeline for automation.

## Features

- **Terraform Modules**: Modular design for Aurora, network, and schema initialization.
- **Schema Setup**: Automatically initializes schemas and tables.
- **Testing**: Scripts to test database connectivity and data integrity.
- **CI/CD**: Automated pipeline using GitHub Actions.

## Folder Structure

Refer to the repository structure for details on files and modules.

## Usage

1. **Initialize Terraform**:
   ```bash
   terraform init
