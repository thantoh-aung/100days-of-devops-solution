# Day-070 Jenkins User Management and Authorization Setup
📘 Task Overview

The Nautilus DevOps team wants to configure user access control on their Jenkins server. The goal is to create a new user, assign specific permissions using the Project-based Matrix Authorization Strategy, and ensure secure access by limiting permissions for anonymous users.

## ⚙️ Task Requirements
### 1. Access Jenkins UI

Click the Jenkins button on the top bar to open the Jenkins web interface.

Log in using the credentials:

Username: admin
Password: Adm!n321

### 2. Create a New User

Navigate to: Manage Jenkins → Users → Create User

Enter the following details:

Username: mark

Password: YchZHRcLkL

Full name: Mark

Click Create User to finalize.

### 3. Configure Authorization Strategy

Go to Manage Jenkins → Configure Global Security

Under Authorization, select:

Project-based Matrix Authorization Strategy

### 4. Assign Permissions
For admin user:

Ensure the admin user retains all permissions, especially Overall → Administer.

For mark user:

Grant only Overall → Read permission.

For the existing Jenkins job, assign Read access only (no SCM, Agent, or other permissions).

For Anonymous users:

Remove all permissions to prevent unauthorized access.

### 5. Save and Apply Configuration

Click Save to apply all permission changes.

🔁 Plugin Installation (if required)

If the Project-based Matrix Authorization Strategy plugin is missing:

Go to Manage Jenkins → Plugins → Available.

Search for and install Matrix Authorization Strategy Plugin.

After installation, select:

Restart Jenkins when installation is complete and no jobs are running.


Wait for the Jenkins login page to reappear before continuing.