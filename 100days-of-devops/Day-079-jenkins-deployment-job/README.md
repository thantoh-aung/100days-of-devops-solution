# Day-079 App Deployment Automation using Jenkins
###📘 Overview

The Nautilus DevOps team has automated the deployment process for their web application using Jenkins. The goal is to trigger an automatic deployment whenever a developer pushes new changes to the master branch of the Gitea repository.

This project ensures that the latest version of the app is automatically deployed to the Storage Server under /var/www/html, which is shared among all application servers.

### 🧩 Lab Objectives

Install and configure httpd to run on port 8080 on all application servers.

Set up a Jenkins job that automatically triggers deployment upon a Git push to the master branch.

Ensure auto-deployment of updated code to the /var/www/html directory on the Storage Server.

Verify that the deployed web page displays the updated message:

“Welcome to the xFusionCorp Industries”

### ⚙️ Environment Details
Component	Credentials	Notes
Jenkins UI	Username: admin
Password: Adm!n321	Access via Jenkins button
Gitea UI	Username: sarah
Password: Sarah_pass123	Repository name: web
Storage Server	User: sarah	Repository already cloned under /home/sarah/web

### 🪜 Steps to Complete the Lab
### Step 1: Configure HTTPD on App Servers

SSH into each App Server.

Install Apache using YUM:
```bash
sudo yum install httpd -y


##Update the configuration to serve on port 8080:

sudo sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf


#Enable and start the service:

sudo systemctl enable httpd
sudo systemctl start httpd
```
### Step 2: Configure Jenkins Job

Log in to Jenkins UI (admin / Adm!n321).

Create a Freestyle Project named nautilus-app-deployment.

Under Source Code Management:

Choose Git.

Repository URL:

http://<Gitea-URL>/sarah/web.git


Branch to build:

*/master


Add credentials if needed (use sarah’s credentials).

Under Build Triggers:

Enable: ✅ Build when a change is pushed to Gitea/SCM (requires Git/Gitea plugin).

Under Build Steps, add an Execute Shell script:

echo "Starting deployment for Nautilus App"
ssh -o StrictHostKeyChecking=no sarah@<Storage-Server-IP> << 'EOF'
sudo chown -R sarah:sarah /var/www/html
cd /home/sarah/web
git pull origin master
sudo cp -r * /var/www/html/
EOF
echo "Deployment completed successfully!"


Save the job.

### Step 3: Test Auto Deployment

SSH into the Storage Server as sarah:

ssh sarah@<Storage-Server-IP>
cd ~/web


Edit index.html:
```bash
echo "Welcome to the xFusionCorp Industries" > index.html
git add index.html
git commit -m "Updated homepage text"
git push origin master
```

The Jenkins job should trigger automatically and deploy the updated code.

### Step 4: Verification

Visit the app URL:

https://<LBR-URL>/


The page should display:

Welcome to the xFusionCorp Industries

Confirm that it does not open under a subdirectory like /web.

### 🧠 Notes & Recommendations

Ensure Jenkins has SSH access to the Storage Server.

Set proper permissions for /var/www/html:

sudo chown -R sarah:sarah /var/www/html


Install required plugins in Jenkins:

Git Plugin

Gitea Plugin

SSH Agent Plugin

Restart Jenkins after plugin installation if prompted.

Always test the Jenkins job multiple times to confirm consistent success.

