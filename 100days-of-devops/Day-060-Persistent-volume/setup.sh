#!/bin/bash

# --- Kubernetes Deployment Script for Day 060 ---
# This script applies the four required YAML manifests in the correct order:
# PV -> PVC -> Pod -> Service.

#"1. Applying Persistent Volume (PV)..."
vi pv.yaml
kubectl apply -f pv.yaml

#"2. Applying Persistent Volume Claim (PVC)..."
vi pvc.yaml
kubectl apply -f pvc.yaml

#"3. Applying Application Pod..."
vi pod.yaml
kubectl apply -f pod.yaml

# You may add a wait here in a real script, but for simplicity, we'll continue
#"4. Applying NodePort Service..."
vi service.yaml
kubectl apply -f service.yaml

echo "--- Deployment Complete ---"
echo "Check status with: kubectl get all"
echo "Service is exposed on NodePort 30008."