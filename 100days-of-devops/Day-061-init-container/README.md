# Day-061-Kubernetes-Init-Container

##  Challenge Goal
To demonstrate the use of Kubernetes Init Containers for prerequisite setup tasks. The goal was to deploy a Pod whose main container depends on a configuration file created by an Init Container, proving the sequential execution model.

## Solution Logic 
Init Containers run to completion *before* the main containers are started. This model is perfect for setup, configuration, and precondition checks.

1.  **Shared Volume:** An `emptyDir` Volume named `ic-volume-devops` was defined in the Pod's spec. This provides a temporary, shared filesystem accessible by both the Init and Main containers at the mount path `/ic`.
2.  **Init Container (`ic-msg-devops`):** This container ran a simple `echo` command to write the required string into the `/ic/news` file. It must complete successfully before proceeding.
3.  **Main Container (`ic-main-devops`):** This container started only after the Init Container exited successfully. Its job was to continuously read the file that the Init Container had placed in the shared `/ic` directory, confirming the setup was successful.

##  Commands Executed (Verification)

The solution was deployed using the YAML manifest (`init.yaml`).

```bash
# 1. Apply the Deployment manifest
kubectl apply -f init.yaml

# 2. Check the Deployment and Pod status
kubectl get deploy ic-deploy-devops
kubectl get po

# 3. View the logs from the main container to confirm it is reading the file.
# The log output confirms the Init Container successfully created the file 
# before the main container started.
kubectl logs <pod-name> -c ic-main-devops