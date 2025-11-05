#!/bin/bash

# --- Kubernetes Deployment Script for Init Container Challenge ---

echo "Applying Init Container Deployment: ic-deploy-devops"
kubectl apply -f init.yaml

echo "--- Deployment Applied ---"
echo "Check status with: kubectl get deploy ic-deploy-devops"