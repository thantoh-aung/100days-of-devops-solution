# Day-071 Jenkins Job for Package Installation — Stratos Datacenter (Nautilus Infrastructure)
📘 Overview

This lab demonstrates how to automate package installation on the storage server within the Stratos Datacenter using Jenkins.
The Nautilus DevOps team has deployed a new Jenkins server and configured it to perform remote installation tasks through a parameterized Jenkins job.

## ⚙️ Task Details
Objective

Create a Jenkins job named install-packages that installs a package on the storage server based on a user-provided parameter.

🪜 Step-by-Step Instructions
### 1. Access Jenkins

Click the Jenkins button in the top navigation bar.

Log in using the following credentials:

Username: admin

Password: Adm!n321

### 2. Create a New Jenkins Job

Click “New Item” on the Jenkins dashboard.

Enter the job name: install-packages

Select “Freestyle project”, then click OK.

### 3. Configure Job Parameters

In the job configuration page, check “This project is parameterized.”

Click Add Parameter → String Parameter

Set the following:

Name: PACKAGE

Default Value: (optional, e.g., httpd)

Description: Specify the package to install on the storage server.

### 4. Add Build Step

Click “Add build step → Execute shell.”

Add the following shell command to install the specified package:

ssh -o StrictHostKeyChecking=no storage_server "sudo yum install -y $PACKAGE"


🔹 Replace storage_server with the correct hostname or IP of the storage server in your environment.

Click Save.

### 5. Install Required Plugins

If SSH functionality or parameterized builds are not available:

Go to Manage Jenkins → Plugins → Available plugins.

Install necessary plugins such as:

SSH Plugin

Parameterized Trigger Plugin (if needed)

After installation, click “Restart Jenkins when installation is complete and no jobs are running.”

### 6. Test the Jenkins Job

Go back to the Jenkins Dashboard → install-packages

Click Build with Parameters

Enter a package name (e.g., git, vim, or httpd)

Click Build

✅ Expected Result: Jenkins should successfully connect to the storage server and install the specified package without manual intervention.