# Day-073 Jenkins Log Collection Job (copy-logs)
Overview

The DevOps team at xFusionCorp Industries is setting up a centralized logging management system.
While that is under development, the team needs to periodically collect Apache logs from one of the application servers for analysis and troubleshooting.

To automate this process, a Jenkins job named copy-logs is configured to run every 8 minutes.
This job copies the Apache access and error logs from App Server 2 to a designated location on the Storage Server.

Objective

Create and configure a Jenkins job that:

Runs automatically every 8 minutes.

Copies both access_log and error_log from App Server 2.

Transfers logs to /usr/src/security on the Storage Server.

Server Details
Server Type	Hostname	User	Key Path / Connection
Jenkins Server	ststor01	natasha	Local Jenkins Job execution
App Server 2	stapp02	steve	SSH key-based access from Jenkins
Setup Steps
## 1. Jenkins Access

Open Jenkins UI from the top bar.

Login using:

Username: admin
Password: Adm!n321

## 2. Create Jenkins Job

Click "New Item"

Enter: copy-logs

Select Freestyle Project

Click OK

## 3. Configure Build Triggers

In the job configuration:

Scroll to "Build Triggers"

Check "Build periodically"

Add the cron expression:

*/8 * * * *


This runs the job every 8 minutes.

## 4. Configure Build Steps

Under Build → Execute shell, add the following command:

scp /var/log/httpd/access_log /var/log/httpd/error_log natasha@ststor01:/usr/src/security


✅ This command:

Connects from App Server 2 (stapp02)

Copies Apache logs to Storage Server (ststor01)

Stores them in /usr/src/security

## 5. SSH Configuration

To allow passwordless log transfer:

Generate SSH keys on App Server 2 (steve user):

ssh-keygen


Copy the public key to Storage Server (natasha user):

ssh-copy-id natasha@ststor01


Test the connection:

ssh natasha@ststor01 "hostname"


✅ It should connect without asking for a password.

## 6. Verify File Transfer

Manually test once before Jenkins runs automatically:

scp /var/log/httpd/access_log /var/log/httpd/error_log natasha@ststor01:/usr/src/security


If successful, Jenkins will also perform this transfer automatically every 8 minutes.

## 7. Optional: Plugin Setup

If Jenkins shows errors or requires remote SSH build steps:

Go to Manage Jenkins → Manage Plugins → Available tab

Install:

SSH Agent Plugin

Publish Over SSH Plugin

After installation, click “Restart Jenkins when installation is complete and no jobs are running.”

Refresh the Jenkins UI if it becomes unresponsive.

## 8. Validation

To confirm everything works:

Wait 8 minutes for the scheduled job to trigger.

SSH into Storage Server:

ssh natasha@ststor01


Check log files:

ls -l /usr/src/security


You should see:

access_log
error_log

