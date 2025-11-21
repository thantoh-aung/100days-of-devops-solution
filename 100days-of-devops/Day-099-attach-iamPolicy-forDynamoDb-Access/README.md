# Day-099 Secure DynamoDB with IAM Access
## Lab Overview

The DevOps team is tasked with provisioning a secure DynamoDB table and implementing fine-grained access control using IAM. The goal is to allow read-only access to trusted AWS services while preventing unauthorized access.

## Objectives

Create a DynamoDB Table

Table name: nautilus-table

Minimal configuration

Create an IAM Role

Role name: nautilus-role

This role will be allowed to access the DynamoDB table

Create an IAM Policy

Policy name: nautilus-readonly-policy

Grants read-only access (GetItem, Scan, Query) to the specific DynamoDB table

Attach the policy to the IAM role

Use Terraform

main.tf: provisions DynamoDB table, IAM role, and IAM policy

variables.tf: defines variables

KKE_TABLE_NAME

KKE_ROLE_NAME

KKE_POLICY_NAME

terraform.tfvars: defines actual variable values

outputs.tf: outputs key resource names

kke_dynamodb_table

kke_iam_role_name

kke_iam_policy_name

### Steps

Open Terraform Working Directory
```bash
cd /home/bob/terraform


#Initialize Terraform

terraform init


#Validate Configuration

terraform validate


#Apply Configuration

terraform apply -auto-approve


#Check Plan

terraform plan


#Ensure it shows: No changes. Your infrastructure matches the configuration.