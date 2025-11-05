# Day-060-Kubernetes-PV-PVC-Service

##  Challenge Goal
The objective was to deploy a highly available web application on a Kubernetes cluster, ensuring its web content is persistent. This required manually provisioning a Persistent Volume (PV), claiming it (PVC), deploying an application Pod that uses the claim, and exposing the Pod via a NodePort Service.

##  Solution Logic

1.  **Persistent Volume (PV):** Manually created a PV (`pv-devops`) with `3Gi` storage and `Retain` policy, linking it to a `hostPath` on the cluster node.
2.  **Persistent Volume Claim (PVC):** Created a PVC (`pvc-devops`) requesting `3Gi` of storage, which successfully transitioned the PV status to `Bound`.
3.  **Pod Creation (`pod-devops`):** Deployed an Nginx Pod using the label `app: devops-app`. The PVC was mounted to the web server's document root (`/usr/share/nginx/html`) to ensure any content created inside is persisted.
    * *(Note: I encountered an error trying to apply changes to the running Pod, confirming that many critical fields (like `securityContext`) cannot be modified on a running Pod. I fixed this by deleting and recreating the Pod.)*
4.  **Service Exposure (`web-devops`):** Created a `NodePort` Service to expose the Pod publicly. I specifically set the `nodePort` to **30008**.
5.  **Verification:** Entered the Pod to create content (`index.html`) and then confirmed external access using `curl` via the Node's IP and the NodePort (30008).

##  Commands and Verification Steps

### Setup (PV, PVC, Pod)
```bash
# 1. Apply Persistent Volume
k apply -f pv.yaml
k get pv # Status should be 'Available'

# 2. Apply Persistent Volume Claim
k apply -f pvc.yaml
k get pvc # Status should be 'Bound'

# 3. Apply Pod (Initial Creation)
k apply -f pod.yaml
k get po # Wait until status is 'Running'

# 4. Correcting Pod Changes (My Troubleshooting Step)
# Since Pod updates are restricted, I deleted and recreated the pod after my first attempt.
k delete pod pod-devops
k apply -f pod.yaml