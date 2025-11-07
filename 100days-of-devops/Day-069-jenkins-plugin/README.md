# Jenkins Plugin Installation Lab
🏢 Scenario

The Nautilus DevOps team has recently set up a Jenkins server and plans to use it for various CI/CD jobs.
Before proceeding, they need to install a few essential plugins that will be required in most of their pipelines.

⚙️ Task Overview
Objective:

Access the Jenkins web interface, log in using the given credentials, and install the Git and GitLab plugins.

🧭 Steps to Complete the Task
## 1️⃣ Access Jenkins Web UI

Click the “Jenkins” button on the top navigation bar in your lab environment
(or open in your browser at http://jenkins-server:8080
)

Log in using the credentials:

Username: admin
Password: Adm!n321

## 2️⃣ Install Required Plugins

From the Jenkins dashboard, go to:

Manage Jenkins → Plugins → Available Plugins


In the search box, type:

Git

GitLab

Check the boxes next to Git Plugin and GitLab Plugin.

Click Install without restart (or Install and restart if needed).

## 3️⃣ Restart Jenkins (if prompted)

Once installation completes, Jenkins may ask for a restart.
Choose:

Restart Jenkins when installation is complete and no jobs are running


Wait patiently for Jenkins to restart — it will automatically bring you back to the login page.

## 4️⃣ Verify Installation

After Jenkins restarts and you log in again:

Go to:

Manage Jenkins → Plugins → Installed Plugins


Confirm that:

✅ Git Plugin

✅ GitLab Plugin
are listed under the Installed tab.