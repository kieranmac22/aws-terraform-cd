# This is an assignment using Terraform and AWS

This Terraform project sets up a highly available MySQL RDS and a cluster of EC2 instances on AWS to support a large ecommerce website.

# Table of Contents

- Prerequisites
- Getting Started
- Configuration Directory
- Outputs
- Author

## Prerequisites
- Terraform installed 
- AWS CLI configured with valid credentials
- Git repo cloned

## Getting Started
1. Clone this repository.
2. Navigate to the project directory.
3. Run `terraform init` to initialize the project.
4. Run `terraform apply` to deploy the infrastructure.
Note: This is setup with smaller infrastructure for testing purposes.

## Configuration Structure
- main.tf: Contains the main Terraform configuration.
- ec2.tf: Contains the configurations for EC2 instances.
- rds.tf: Contains the configurations for the RDS instance.
- network.tf: Contains network-related configurations.
- README.md: Standard Readme file with instructions. 
- ssl.tf: Contains the configurations for the SSL.
- variables.tf: Defines variables used in the configuration.
- test.txt: Contains extra notes and information.
- security.tf: - Contains the configurations for Security Groups.
- output.tf: - Contains information about the resources created.
- terraform.log: Contains a log output. 

## Outputs

## Author
Kieran McStay
kieranmcstay31@gmail.com


