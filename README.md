# AWS Aurora PostgreSQL Database with Terraform

This repository provides a complete infrastructure as code (IaC) solution to deploy a scalable, resilient, and production-ready **AWS Aurora PostgreSQL** database using **Terraform**. The solution includes network setup, database schema initialization, observability, security configurations, and a CI/CD pipeline using GitHub Actions.

---

## Features

1. **Database Infrastructure**:
   - Creates an **Aurora PostgreSQL** cluster with HA (High Availability) and multi-AZ deployment.
   - Supports production and non-production environments.
   - Encrypted connections using SSL/TLS.

2. **Schema Initialization**:
   - Automatically sets up the following tables:
     - `payee`: Stores user details.
     - `transactions`: Stores transaction data.
     - `fraud_scores`: Stores fraud detection scores.

3. **Networking**:
   - Configures a VPC with public and private subnets.
   - Sets up security groups to restrict database access.

4. **Security**:
   - Secrets stored securely in **AWS Secrets Manager**.
   - IAM roles for least privilege access.
   - Enforces encrypted communication between services.

5. **Observability**:
   - Enables **AWS CloudWatch** for performance metrics and logging.
   - Supports Performance Insights for Aurora.

6. **CI/CD Pipeline**:
   - Automates infrastructure deployment and testing using GitHub Actions.
   - Includes validation, plan, apply, and schema initialization steps.

---

## Folder Structure

```plaintext
hackathon-aurora-db/
├── .github/
│   └── workflows/
│       └── terraform-pipeline.yml      # GitHub Actions workflow for CI/CD
├── environments/
│   ├── dev.tfvars                      # Environment variables for dev
│   ├── prod.tfvars                     # Environment variables for prod
├── modules/
│   ├── aurora/
│   │   ├── main.tf                     # Aurora database module
│   │   ├── variables.tf                # Input variables for Aurora
│   │   ├── outputs.tf                  # Outputs for Aurora
│   │   └── README.md                   # Documentation for Aurora module
│   ├── network/
│   │   ├── main.tf                     # Networking module
│   │   ├── variables.tf                # Input variables for network
│   │   ├── outputs.tf                  # Outputs for network
│   │   └── README.md                   # Documentation for network module
├── schemas/
│   ├── create_schema.sql               # SQL script to create tables
│   ├── init_schema.sh                  # Shell script to initialize schema
├── test/
│   ├── test_connectivity.sh            # Script to test database connectivity
│   ├── test_data_integrity.sh          # Script to validate schema and data
├── .gitignore                          # Files to ignore in Git
├── README.md                           # Main project documentation
├── main.tf                             # Root Terraform file
├── variables.tf                        # Variables for root module
├── outputs.tf                          # Outputs for root module
├── backend.tf                          # Terraform backend configuration
├── provider.tf                         # Provider configuration
└── versions.tf                         # Terraform version and provider constraints
```
## Setup and Usage

1. ** Prerequisites ** :
Terraform: Install Terraform (v1.5.0 or later).
AWS CLI: Install and configure AWS CLI.
GitHub Secrets:
ENVIRONMENT: Environment to deploy (dev or prod).
TF_VAR_db_username: Master username for Aurora.
TF_VAR_db_password: Master password for Aurora.
TF_VAR_secret_name: Name of the secret in AWS Secrets Manager.

2. **Clone the Repository**
```
git clone https://github.com/IfyGraceEnuoyibo/hackathon-aurora-db.git
cd hackathon-aurora-db
```

3. ** Initilize Terraform**
```
terraform init
```

4. **Deploy the Infrastructure**
## Dev Environment
```
terraform apply -var-file="environments/dev.tfvars" -auto-approve
```
## Prod Environment
```
terraform apply -var-file="environments/prod.tfvars" -auto-approve
```

5. ** Initialize the Schema
## Run the schema initialization script:
```
./schemas/init_schema.sh
```

6. ** Test the Setup**
## Test Database Connectivity
```
./test/test_connectivity.sh
```

## Test Schema and Data
```
./test/test_data_integrity.sh
```

## CI/CD Pipeline
Workflow
The GitHub Actions pipeline (```.github/workflows/terraform-pipeline.yml```) automates:

**Terraform Validation**: Validates the syntax of Terraform files.
**Terraform Plan**: Generates an execution plan for infrastructure changes.
**Terraform Apply**: Deploys the infrastructure.
**Schema Initialization**: Initializes the database schema.
**Testing**: Runs connectivity and data integrity tests.

## Modules
1. **Aurora Module**
Manages the AWS Aurora PostgreSQL database.

**Inputs**:

cluster_identifier: Identifier for the cluster.
master_username: Master username.
master_password: Master password.
engine_version: Aurora PostgreSQL version.
instance_class: Instance class for Aurora instances.
subnet_ids: List of subnet IDs for the cluster.

**Outputs**:

aurora_endpoint: Aurora cluster endpoint.

. **Network Module**
Sets up VPC, subnets, and security groups.

**Inputs**:

cidr_block: CIDR block for the VPC.
public_subnets: Public subnet CIDRs.
private_subnets: Private subnet CIDRs.
Outputs:

vpc_id: VPC ID.
public_subnet_ids: IDs of public subnets.
private_subnet_ids: IDs of private subnets.

**Schema**
The database contains the following tables:

Payee Table:

user_id: Primary key.
email: Email address.
name: Name of the user.
phone_number: Phone number.
Transactions Table:

transaction_id: Primary key.
user_id: Foreign key referencing payee.
transaction_amount: Amount of the transaction.
merchant: Merchant name.
country: Transaction country.
status: Transaction status.
Fraud Scores Table:

score_id: Primary key.
transaction_id: Foreign key referencing transactions.
user_id: Foreign key referencing payee.
fraud_score: Numeric score.
risk_level: Risk level of the transaction.

**Testing**
Infrastructure Validation
Run terraform validate to check the syntax.

**Database Tests**
Connectivity: Validate database connection using test_connectivity.sh.
Schema and Data: Validate schema creation and data insertion using test_data_integrity.sh.

## Best Practices
Security:

Store sensitive information in AWS Secrets Manager.
Restrict access to the Aurora cluster using security groups.

Resiliency:

Enable multi-AZ for high availability.
Use backup retention to ensure data recovery.
Observability:

Enable CloudWatch metrics and Performance Insights.