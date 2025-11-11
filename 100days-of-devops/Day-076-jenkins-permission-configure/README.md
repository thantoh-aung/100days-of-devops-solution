# Day-076 Jenkins Job Permission Configuration — xFusionCorp Industries
🧾 Task Overview

xFusionCorp Industries has onboarded new developers who need controlled access to existing Jenkins jobs. The DevOps team is responsible for configuring the necessary permissions using Jenkins’ Matrix Authorization Strategy.

This document outlines the steps performed to grant access permissions to specific Jenkins users for the “Packages” job.

🔐 Credentials
Role	Username	Password
Admin (Jenkins)	admin	Adm!n321
Developer 1	sam	sam@pass12345
Developer 2	rohan	rohan@pass12345
🎯 Objective

Configure access permissions on the Packages job for two users (sam and rohan) as per the following requirements:

User	Permissions
sam	build, configure, read
rohan	build, cancel, configure, read, update, tag

Note: Ensure “Inherit permissions from parent ACL” is selected under the inheritance strategy.

⚙️ Steps to Complete the Task
### 1. Log in to Jenkins

Navigate to the Jenkins URL using the top bar link in the lab environment.

Log in with:

Username: admin
Password: Adm!n321

### 2. Verify Existing Job and Users

Confirm that the Jenkins job “Packages” exists.

Go to Manage Jenkins → Security → Manage Users and verify the users:

sam

rohan

### 3. Enable Project-Based Matrix Authorization Strategy

Go to Manage Jenkins → Configure Global Security.

Under Authorization, ensure Project-based Matrix Authorization Strategy is enabled.

Save the configuration.

### 4. Open the “Packages” Job Configuration

From the Jenkins Dashboard, click on Packages.

Select Configure from the left sidebar.

### 5. Configure Job Permissions

Scroll down to the Project-based Matrix Authorization Strategy section.

Check the box for Inherit permissions from parent ACL.

Add users sam and rohan if not already listed.

Grant permissions as follows:

For sam

✅ Build

✅ Configure

✅ Read

For rohan

✅ Build

✅ Cancel

✅ Configure

✅ Read

✅ Update

✅ Tag

Click Save.

### 6. (Optional) Install or Update Plugins

If the Matrix Authorization Strategy or related plugins are missing:

Go to Manage Jenkins → Plugins → Available.

Search for and install the plugin:

Matrix Authorization Strategy

Once installation completes, click Restart Jenkins when installation is complete and no jobs are running.

Refresh the page after Jenkins restarts.

### 7. Verification

Log out and log in as sam:

Verify access to Packages job.

Confirm Build, Configure, and Read options are available.

Log out and log in as rohan:

Verify Build, Cancel, Configure, Read, Update, and Tag options are available.