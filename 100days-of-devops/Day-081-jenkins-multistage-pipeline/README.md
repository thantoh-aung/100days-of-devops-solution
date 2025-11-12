# Day-081 Jenkins Pipeline Deployment — xFusionCorp Industries Static Website
### 📘 Objective

The development team of xFusionCorp Industries is building a new static website. The DevOps team needs to automate the deployment and testing of this website across the Nautilus App Servers using a Jenkins pipeline.

This lab demonstrates how to create a Jenkins Pipeline with Deploy and Test stages to ensure smooth and verifiable deployment.

### ⚙️ Environment Details
🔹 Jenkins Access

URL: Click on the Jenkins button on the top bar

Username: admin

Password: Adm!n321

🔹 Gitea Access

URL: Click on the Gitea button on the top bar (Port 8090)

Username: sarah

Password: Sarah_pass123

Repository: sarah/web

🔹 Servers & Directories

Repository is already cloned on the Storage Server under:

/var/www/html


This directory is mounted to the App Servers’ document root, so deployment updates automatically reflect across all App Servers.

Apache is already installed and running on port 8080 on all App Servers.

## 🧱 Task Summary
### 1️⃣ Update Web Content

On the Storage Server, open the repository directory:
```bash
cd /var/www/html


#Edit the file:

vi index.html


#Replace its content with:

Welcome to xFusionCorp Industries
```

Commit and push the changes:

git add index.html
git commit -m "Updated homepage message"
git push origin master

### 2️⃣ Create Jenkins Pipeline Job

Create a Pipeline (not Multibranch) job named deploy-job.

Pipeline Name:
deploy-job

Type:

Pipeline (Freestyle jobs or Multibranch jobs are not allowed)

## 🧩 Jenkins Pipeline Configuration
🧠 Script Overview

The pipeline has two stages — Deploy and Test.

### ✅ Full Jenkinsfile (Declarative Pipeline)

```bash
pipeline {
    agent any

    stages {
        stage('Deploy') {
            steps {
                script {
                    // Run git pull on the storage server
                    sh '''
                        sshpass -p "Bl@kW" ssh -o StrictHostKeyChecking=no natasha@stsotr01 "cd /var/www/html && git pull origin master"
                    '''
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Get HTTP response code
                    def response_code = sh(script: 'curl -s -o /dev/null -w "%{http_code}" http://stlb01:8091', returnStdout: true).trim()

                    if (response_code != '200') {
                        error("App not working after deployment. HTTP Code ${response_code}")
                    } else {
                        echo "✅ App is working fine (HTTP ${response_code})"
                    }
                }
            }
        }
    }
}
```

### Validation Steps

Run the deploy-job pipeline from Jenkins.

Verify that both stages complete successfully.

Open the App URL in a browser:

http://stlb01:8091


Ensure the webpage displays:

Welcome to xFusionCorp Industries


✅ No subdirectory like /web should appear in the URL.