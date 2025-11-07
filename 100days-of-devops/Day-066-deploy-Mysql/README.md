# Day-066 MySQL Deployment on Kubernetes

## 📘 Overview

This lab demonstrates how to deploy a MySQL database on a Kubernetes cluster using Persistent Volumes, Secrets, and Environment Variables for secure and persistent data management.
The task was designed as part of a DevOps hands-on challenge for the Nautilus project.

🧩 Lab Requirements

Persistent Storage:

Create a PersistentVolume (PV) named mysql-pv with a capacity of 250Mi.

Create a PersistentVolumeClaim (PVC) named mysql-pv-claim requesting 250Mi.

Deployment:

Create a Deployment named mysql-deployment.

Use a MySQL image (e.g., mysql:latest).

Mount the PersistentVolume at /var/lib/mysql.

Service:

Expose MySQL using a NodePort service named mysql.

Set the nodePort to 30007.

Secrets:

Create three secrets:

mysql-root-pass → key: password, value: YUIidhb667

mysql-user-pass → keys: username=kodekloud_roy, password=BruCStnMT5

mysql-db-url → key: database, value: kodekloud_db7

Environment Variables:

MYSQL_ROOT_PASSWORD → from secret mysql-root-pass, key password

MYSQL_DATABASE → from secret mysql-db-url, key database

MYSQL_USER → from secret mysql-user-pass, key username

MYSQL_PASSWORD → from secret mysql-user-pass, key password

## ⚙️ Step-by-Step Implementation
```bash

## 1. Create Secrets
kubectl create secret generic mysql-root-pass \
  --from-literal=password="YUIidhb667"

kubectl create secret generic mysql-user-pass \
  --from-literal=username="kodekloud_roy" \
  --from-literal=password="BruCStnMT5"

kubectl create secret generic mysql-db-url \
  --from-literal=database="kodekloud_db7"

## Create Persistent Volume , Claim and deployment
vi mysql.yaml
kubectl apply -f mysql.yaml

## Expose MySQL as a Service
kubectl expose deployment mysql-deployment \
  --name=mysql --type=NodePort

## Edit the service to set nodePort: 30007: and verify deployment
kubectl edit svc mysql

kubectl get pods
kubectl get svc

## Test MySQL Connection
kubectl exec -it mysql-deployment-58cf56c87d-5j5vx -- bash
## Then connect to MySQL:
mysql -u root -p
Enter password: YUIidhb667
```
