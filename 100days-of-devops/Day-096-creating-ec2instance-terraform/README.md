# Day-096 Terraform AWS EC2 Instance Provisioning Readme
This document outlines the steps and Terraform configuration required to provision an AWS EC2 instance named datacenter-ec2 as part of the Nautilus DevOps team's cloud migration strategy.

## 📋 Prerequisites
Before running the Terraform configuration, ensure you have:

Terraform installed and configured.

AWS CLI installed and configured with the necessary credentials (access key, secret key, and region set) to interact with your AWS account.

## 📁 Working Directory and File
The Terraform configuration file must be created in the specified working directory:

Working Directory: /home/bob/terraform

## Configuration File: main.tf

🛠️ Terraform Configuration (main.tf)
### get rsa public key
```bash
ssh-keygen -t rsa -f devops-kp
``` 
The main.tf file will contain the following configuration to meet all the requirements.



## 🏃 Execution Steps
Follow these steps in the /home/bob/terraform directory to provision the infrastructure:

Initialize Terraform: Download the necessary provider plugins.

```Bash

terraform init
```
Review the Plan: Check what actions Terraform will take before applying.

```Bash

terraform plan
```
Apply the Configuration: Execute the plan to create the AWS resources.

```Bash

terraform apply --auto-approve