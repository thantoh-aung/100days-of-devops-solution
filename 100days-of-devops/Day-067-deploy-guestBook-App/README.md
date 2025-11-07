# Day-067 Guestbook Application Deployment on Kubernetes
🧩 Overview

This lab demonstrates how to deploy a three-tier Guestbook application on a Kubernetes cluster.
It includes Redis Master, Redis Slaves, and a Frontend Web Application.
The setup uses Deployments, Services, Resource Requests, and Environment Variables to ensure scalability and high availability.

🏗️ Architecture

The application consists of three tiers:

Back-end Tier

Redis Master

Redis Slaves

Front-end Tier

PHP web frontend that interacts with Redis

⚙️ Lab Requirements
🧱 Back-End Tier
1. Redis Master

Deployment name: redis-master

Replicas: 1

Container name: master-redis-nautilus

Image: redis

Resources:

CPU: 100m

Memory: 100Mi

Container port: 6379

Service: redis-master (port 6379)

2. Redis Slave

Deployment name: redis-slave

Replicas: 2

Container name: slave-redis-nautilus

Image: gcr.io/google_samples/gb-redisslave:v3

Resources:

CPU: 100m

Memory: 100Mi

Environment variable:

GET_HOSTS_FROM=dns

Container port: 6379

Service: redis-slave (port 6379)

💻 Front-End Tier
3. Frontend

Deployment name: frontend

Replicas: 3

Container name: php-redis-nautilus

Image:
gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff

Resources:

CPU: 100m

Memory: 100Mi

Environment variable:

GET_HOSTS_FROM=dns

Container port: 80

Service:

Name: frontend

Type: NodePort

Port: 80

NodePort: 30009

🧠 Step-by-Step Implementation
## 1️.Redis Master Deployment and Service
```bash 
##Create the deployment:
kubectl create deploy redis-master -r 1 --image=redis --dry-run=client -o yaml > master.yaml
##Edit the deployment
vi master.yaml
#Apply and expose it:
kubectl apply -f master.yaml
kubectl expose deploy redis-master --name=redis-master --port=6379
```

## 2️⃣ Redis Slave Deployment and Service
```bash
kubectl create deploy redis-slave -r 2 --image=gcr.io/google_samples/gb-redisslave:v3 --dry-run=client -o yaml > slave.yaml
##Edit the deployment
vi slave.yaml
#Apply and expose it:
kubectl apply -f slave.yaml
kubectl expose deploy redis-slave --name=redis-slave --port=6379
```

## 3️⃣ Frontend Deployment and Service

```bash
kubectl create deploy frontend -r 3 --image=gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff --dry-run=client -o yaml > front.yaml
#Edit the deployment
vi front.yaml
#Apply and expose it:
kubectl apply -f front.yaml
kubectl expose deploy frontend --name=frontend --type=NodePort --port=80
```
## Edit the NodePort to 30009
```bash
kubectl edit svc frontent

#Change this section:

ports:
 - port: 80
   targetPort: 80
   nodePort: 30009 

#✅ Verify the Setup
kubectl get deploy
kubectl get svc
```
## Access the Guestbook App

Once everything is running, click the “App” button in your Kubernetes environment
or open your Node IP with port 30009: