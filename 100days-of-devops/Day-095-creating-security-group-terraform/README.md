# Day-095 Terraform AWS Security Group Lab (Revised)

This lab guides you through the process of using Terraform to provision an AWS Security Group with specific inbound rules. The configuration is split between main.tf and provider.tf for organizational purposes.

## 🎯 Goal
Create an AWS Security Group named xfusion-sg in the us-east-1 region with the following security rules:

HTTP (Port 80): Allowed from any IP address (0.0.0.0/0).

SSH (Port 22): Allowed from any IP address (0.0.0.0/0).

### 📂 File Structure
Your Terraform working directory (/home/bob/terraform) contains:

provider.tf: Defines the AWS provider and sets the region to us-east-1.

main.tf: Defines the aws_security_group resource and its ingress/egress rules.

## 💻 Execution Steps (Simple List)
Follow these steps in the terminal within the /home/bob/terraform directory:
```bash
#1. Initialize Terraform:

 terraform init

#Purpose: Downloads the AWS provider plugin.

#2. Review the Execution Plan:

 terraform plan

#Purpose: Shows exactly what resources will be created.

#3. Apply the Configuration:

 terraform apply

#Purpose: Creates the security group in AWS. (Type yes when prompted.)

#4. Clean Up (Destroy):

 terraform destroy

#Purpose: Removes the security group from AWS when the lab is finished. (Type yes when prompted.)