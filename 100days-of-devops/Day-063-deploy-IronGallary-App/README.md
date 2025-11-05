# 🧩 Day-063 Iron Gallery Kubernetes Deployment

## 🚀 Project Overview
The Nautilus DevOps team is deploying the **Iron Gallery** app (frontend) and **Iron DB** (database) on a Kubernetes cluster.  
This README documents the entire deployment process including namespaces, deployments, services, resource limits, volumes, and environment variables.

---

##  1. Create Namespace

```bash
kubectl create namespace iron-namespace-xfusion
kubectl get ns
```
##  2. Create Iron Gallery Deployment

```bash
kubectl create deploy iron-gallery-deployment-xfusion 
  --image=kodekloud/irongallery:2.0 
  -r 1 -n iron-namespace-xfusion 
  --dry-run=client -o yaml > iron-gallery-deploy.yaml
```

## Apply and Verify

```bash
vi deploy-gallary.yaml
kubectl apply -f iron-gallery-deploy.yaml
kubectl get deploy -n iron-namespace-xfusion
kubectl get pods -n iron-namespace-xfusion
```

## 3. Create Iron DB Deployment

```bash
kubectl create deploy iron-db-deployment-xfusion --image=kodekloudirondb:2.0  -r 1 -n iron-namespace-xfusion --dry-run=client -o yaml > iron-db-deploy.yaml
```
## Apply and Verify

```bash 
vi deploy-db.yaml
kubectl apply -f iron-db-deploy.yaml
kubectl get deploy -n iron-namespace-xfusion
kubectl get pods -n iron-namespace-xfusion
```

## 4. Create and Aply IronDB service(ClusterIP)
```bash
vi svc.db.yaml
kubectl apply -f iron-db-service.yaml
kubectl get svc -n iron-namespace-xfusion
```
##  Create and Aply Iron Gallery Service (NodePort)

```bash
vi svc-gallary.yaml
kubectl apply -f iron-gallery-service.yaml
kubectl get svc -n iron-namespace-xfusion
```
## ✅ 5. Verification
```bash
kubectl get all -n iron-namespace-xfusion
```
