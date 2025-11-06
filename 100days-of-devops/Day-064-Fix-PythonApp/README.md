#  Day-064 Python Flask App Deployment Fix on Kubernetes

##  Lab Scenario

One of the DevOps engineers tried to deploy a **Python Flask** app on a Kubernetes cluster.  
However, the application wasn’t running due to a misconfiguration.  
Our task is to **fix the issues** and ensure the application is **accessible on the specified NodePort**.

---

##  Lab Requirements

- **Deployment name:** `python-deployment-nautilus`  
- **Image:** `poroko/flask-demo-appimage`
- **Service name:** `python-service-nautilus`
- **NodePort:** `32345`
- **TargetPort:** Flask app’s default port (`5000`)
- **Cluster:** Pre-configured on the jump host
- **Goal:** Application should be running and accessible on NodePort 32345

---

## 🧾 Step-by-Step Execution

### 🔹 Step 1: Verify Deployment,Pod and Service

```bash
k get deploy
k get po
k get svc
```
## Step 2: Describe the Deployment
```bash
k describe deploy python-deployment-nautilus
```

## Step 3: Edit Deployment to Fix Image Name

```bash 
 k edit deploy python-deployment-nautilus
 ```
 ### ✅ Change the image line:
 ```bash
 containers:
  - name: python-container-nautilus
    image: poroko/flask-demo-appimage
```

## Step 4: Verify Deployment Rollout and Check Pod status

```bash
k get deply
k get po
```

## Step 5: Verify Existing Service

```bash
k get svc
```

## 🔹 Step 6: Edit the Service Configuration

```bash
k edit svc python-service-nautilus
```
### ✅ Modify ports section as below:

``` bash
ports:
  - port: 5000
    targetPort: 5000
    nodePort: 32345
```

## Step 7: Verify Service After Edit
 
 ```bash
 k get svc
 ```

## Step 8: Final Verification

```bash
curl http://<NodeIP>:32345
```