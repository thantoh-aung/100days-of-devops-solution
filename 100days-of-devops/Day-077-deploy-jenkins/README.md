# Day-077 Deploy Jenkins Pipeline

This document outlines the steps required to configure a Jenkins pipeline job to deploy the static website code from the web_app Gitea repository to the Nautilus App Servers via the Storage Server.

## Task Breakdown
The overall task involves three main components:

Preparation: Install necessary Jenkins plugins (if required) and configure the Storage Server as a Jenkins agent (slave node).

Job Creation: Create a new Jenkins Pipeline job named devops-webapp-job.

Deployment: Configure the pipeline to pull the latest code from the Gitea repository to the Storage Server's deployment path.

🛠️ Configuration Steps
### 1. Jenkins Agent Configuration (Storage Server)
The Storage Server must be configured as a Jenkins Agent to execute the deployment steps.

Node Name: Storage Server

Label: ststor01

Remote Root Directory: /var/www/html

Note: Ensure that necessary plugins (e.g., SSH Agent and Git) are installed. If any plugins are installed or updated, restart Jenkins as per the note.

### 2. Jenkins Pipeline Job Creation
Create a new pipeline job with the following specifications:

Job Name: devops-webapp-job (Must be a standard Pipeline, not a Multibranch pipeline).

Pipeline Definition: Use the Pipeline script to define the deployment process.

### 3. Pipeline Script (Jenkinsfile)
The pipeline must connect to Gitea, pull the latest code, and deploy it to the specified location.

Agent: The job must run on the configured agent.

Stage: It must contain a single stage named Deploy (case-sensitive).

Deployment Location: /var/www/html on the Storage Server.

Since the web_app repository is already cloned at /var/www/html on the Storage Server, the deployment step primarily involves pulling the latest changes to this existing clone.

Example Pipeline Script:
Groovy
```bash
pipeline {
    // 1. Specify the Jenkins agent to run the job
    agent {
        label 'ststor01'
    }
    
    // 2. Define environment variables for clarity (optional but recommended)
    environment {
        // Gitea details
        GIT_URL = 'http://<GITEA-SERVER-IP>/sarah/web_app.git'
        // Credential ID for 'sarah' user (must be configured in Jenkins)
        GIT_CREDENTIAL_ID = 'gitea-sarah-credentials' 
    }

    stages {
        // 3. Define the mandatory single stage
        stage('Deploy') {
            steps {
                // Change directory to the existing git repository clone on the agent
                dir('/var/www/html/web_app') {
                    // Use git to pull the latest changes
                    script {
                        // Ensure the Git tool is available and use the 'withCredentials' block 
                        // if the pull requires authentication (it usually does for a Gitea repo)
                        // If SSH keys are used, use the 'sshagent' step instead.
                        
                        // Assuming the git repo is set up to pull without needing 
                        // to re-clone the entire repository, just pull the updates.
                        // NOTE: You might need to check out the repo using the Git SCM block
                        // or clone it inside the workspace if the existing clone is not
                        // correctly set up to be updated by Jenkins.
                        
                        // If the existing /var/www/html/web_app clone needs to be updated:
                        sh 'git pull origin master'
                    }
                }
                
                // IMPORTANT: The requirement states the content should be loading on the main URL 
                // (e.g., https://<LBR-URL>), which implies the web root should be 
                // /var/www/html, not /var/www/html/web_app.
                // The code must be moved/copied from the repository sub-directory into the parent directory.
                
                // Copy the contents of the 'web_app' sub-directory to the main document root
                sh 'cp -r /var/www/html/web_app/* /var/www/html/'
                sh 'rm -rf /var/www/html/web_app/.*' // Remove hidden files like .git from the root if copied
            }
        }
    }
}
```
### 4. Deployment Verification
The code is deployed to /var/www/html on the Storage Server.

This location is mounted to the document root of the App Servers.

Apache is running on port 8080 on all App Servers.

Verify the changes by clicking the App button to access the Load Balancer URL.

The content must load on the root URL (https://<LBR-URL>) without a sub-directory.