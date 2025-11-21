# Day-100 EC2 Instance with CloudWatch Alarm
## Lab Overview

The DevOps team is tasked with provisioning an EC2 instance for an application and monitoring its CPU utilization using CloudWatch. An SNS topic is used to send notifications if CPU usage exceeds a specified threshold.

## Objectives

### Launch EC2 Instance

Name: datacenter-ec2

AMI: ami-0c02fb55956c7d316 (Ubuntu)

Instance type: t2.micro

### Create CloudWatch Alarm

Name: datacenter-alarm

Metric: CPUUtilization

Statistic: Average

Threshold: ≥ 90% for 1 consecutive 5-minute period

Alarm Actions: Send notification to SNS topic datacenter-sns-topic

### Use Terraform

main.tf: provisions EC2 instance and CloudWatch alarm

outputs.tf: outputs resource names

KKE_instance_name → EC2 instance name

KKE_alarm_name → CloudWatch alarm name

## Steps
```bash
#Open Terraform Working Directory

cd /home/bob/terraform


#Initialize Terraform

terraform init


#Validate Configuration

terraform validate


#Apply Configuration

terraform apply -auto-approve


#Check Plan

terraform plan


#Ensure output shows: No changes. Your infrastructure matches the configuration.