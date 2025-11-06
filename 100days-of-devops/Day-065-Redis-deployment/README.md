#  Redis Deployment on Kubernetes

## 📘 Scenario

The Nautilus DevOps team observed performance issues in one of their deployed applications. After several investigations, the team decided to integrate an in-memory caching utility for the database service.
They chose Redis for its simplicity and efficiency.

As a test, the team wants to deploy Redis on the Kubernetes cluster before moving it to production.

## Create the ConfigMap
```bash
kubectl create configmap my-redis-config --from-literal=redis-config="maxmemory 2mb"
```
### Verification
``` bash
kubectl get configmap
kubectl describe configmap my-redis-config
```

## Create Deployment YAML
```bash 
kubectl create deployment redis-deployment --image=redis:alpine -r 1 --dry-run=client -o yaml > deploy.yaml

# edit the file
vi deploy.yaml

```
## Apply the Deployment
``` bash
kubectl apply -f deploy.yaml
```
## Verify Deployment and Pod Status
```bash 
kubectl get deploy
kubectl get pods
```