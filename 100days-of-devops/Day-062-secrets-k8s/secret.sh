#!/bin/bash
set -e

SECRET_FILE="/opt/ecommerce.txt"
SECRET_NAME="ecommerce"
POD_NAME="secret-nautilus"
POD_YAML="secret.yaml"

## " Starting Kubernetes Secret Deployment Lab"
 # 1. Check for source file (assuming it exists based on lab)

 cd /opt
 ls -lah

# 2. Create the Generic Secret

kubectl create secret generic "$SECRET_NAME" --from-file="$SECRET_FILE" 

# 3. Deploy the Pod

k run "POD_NAME" --image=fedora:latest --dry-run=client -o yaml > "$POD_YAML"


# 4. Apply the Pod YAML with Secret volume mount

kubectl apply -f "$POD_YAML"

# Wait for the Pod to be ready

kubectl get secret,po "$SECRET_NAME" "$POD_NAME"

# 5. Verification Step

kubectl exec -it $POD_NAME -c secret-container-nautilus -- bash
 ls /opt/games"
