#!/bin/bash

# --- Kubernetes Deployment Script for Init Container Challenge ---

# "Applying Init Container Deployment: ic-deploy-devops"
kubectl apply -f init.yaml

# "--- Deployment Applied ---"
 kubectl get deploy ic-deploy-devops"