 # Day-078 Deployment Pipeline (Conditional Branch Deployment)
This document outlines the configuration and execution of the Jenkins pipeline job designed to conditionally deploy the static website code from the web_app Gitea repository to the Nautilus App Servers via the Storage Server.

### 🔑 Access and Environment Details
Service Credentials
Jenkins: Username: admin, Password: Adm!n321

Gitea: Username: sarah, Password: Sarah_pass123

Gitea Repository: web_app (under user sarah)

Jenkins Agent Configuration
Node Name: Storage Server

Label: ststor01

Remote Root Directory: /var/www/html (This is where the web_app repository is already cloned and serves as the App Server document root).

### Deployment Environment
App Servers: Apache is installed and running on port 8080.

Deployment Goal: Code must load on the main URL (https://<LBR-URL>) without any sub-directory in the URL path.

### 🛠️ Pipeline Job Specification
Job Details
Job Name: nautilus-webapp-job (Must be a standard Pipeline job).

Agent: Must run on the agent labeled ststor01.

Stage: Must contain a single, case-sensitive stage named Deploy.

Pipeline Parameters
The job is configured to be parameterized:

Parameter Name: BRANCH (String type)

### Conditional Logic:

If BRANCH is passed as master, the master branch is deployed.

If BRANCH is passed as feature, the feature branch is deployed.

### 💻 Pipeline Script (Jenkinsfile)
The provided script correctly handles the conditional checkout and pull operations directly in the deployment location (/var/www/html). Since the code is cloned directly into the document root, no additional copy step is required, fulfilling the requirement to avoid a sub-directory in the final URL.


```bash 
Groovy
pipeline {
    // Defines the Jenkins agent to run the job
    agent { label 'ststor01'}
    
    // Defines the string parameter to select the branch
    parameters {
        string(name: 'BRANCH', defaultValue: 'master', description: 'BRANCH name')
    }
    
    // Defines the single mandatory stage
    stages {
        stage('Deploy') {
            steps {
                script{
                    echo 'Starting Deployment'
                    
                    // Conditional deployment logic based on the BRANCH parameter
                    if (params.BRANCH == 'master'){
                        echo 'Deploy on master branch'
                        sh '''
                        # Change directory to the document root where the repo is cloned
                        cd /var/www/html
                        git fetch origin
                        # Checkout the master branch
                        git checkout master
                        # Pull the latest changes for master
                        git pull origin master
                        '''
                    }else if(params.BRANCH== 'feature'){
                        echo 'Deploy on feature branch'
                        sh '''
                        # Change directory to the document root where the repo is cloned
                        cd /var/www/html
                        git fetch origin
                        # Checkout the feature branch
                        git checkout feature
                        # Pull the latest changes for feature
                        git pull origin feature
                        '''
                    }else{ 
                        echo 'Invalid BRANCH parameter provided. Doing nothing.'}
                        
                    echo 'Finishing Deployment'
                }
            }
        }
    }
}
```

 ### ✅ Verification Steps
Run the Job: Execute the nautilus-webapp-job and select the desired branch (master or feature) for the BRANCH parameter.

Check Console Output: Confirm the correct branch checkout and pull commands were executed successfully.

Validate Deployment: Click the App button (LBR-URL) and ensure the latest content from the deployed branch is visible at the main root URL (e.g., https://<LBR-URL>).