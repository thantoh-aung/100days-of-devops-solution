# Day-094 Terraform AWS VPC Provisioning
This document outlines the steps and Terraform configuration required to create an AWS VPC named xfusion-vpc in the us-east-1 region.

## 🛠️ Prerequisites
Terraform: Must be installed and configured.

AWS CLI: Must be installed and configured with credentials that have permissions to create VPCs in us-east-1.

Working Directory: The Terraform configuration file must be placed in /home/bob/terraform.

## 🏗️ Terraform Configuration (/home/bob/terraform/main.tf)

in terminal 
```bash
cd /home/bob/terraform
terraform init
terraform plan
terraform apply --auto-approve