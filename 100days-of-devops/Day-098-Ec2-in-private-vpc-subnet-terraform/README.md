# Day-098 DevOps Lab: Private VPC, Subnet, and EC2 Instance
## Lab Overview

In this lab, the DevOps team is tasked with creating a private AWS Virtual Private Cloud (VPC) with a subnet and provisioning an EC2 instance within this isolated environment. The setup ensures secure communication among resources inside the VPC while preventing external access.

## Objectives

Create a Private VPC

VPC name: datacenter-priv-vpc

CIDR block: 10.0.0.0/16

Create a Subnet

Subnet name: datacenter-priv-subnet

CIDR block: 10.0.1.0/24

Disable auto-assign public IPs

Launch an EC2 Instance

Instance name: datacenter-priv-ec2

Instance type: t2.micro

Place the instance inside the private subnet

Configure security group to allow access only from the VPC CIDR block

Use Terraform

main.tf: provisions VPC, subnet, EC2 instance

variables.tf: contains variables

KKE_VPC_CIDR

KKE_SUBNET_CIDR

outputs.tf: outputs resource names

KKE_vpc_name

KKE_subnet_name

KKE_ec2_private

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