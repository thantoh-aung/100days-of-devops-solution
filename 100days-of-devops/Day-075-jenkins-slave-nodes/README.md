# Day-075 Jenkins Multi-Node Agent Setup Lab

This document outlines the configuration and troubleshooting steps for connecting a Jenkins Controller to three separate application servers, establishing them as permanent build agents (nodes) using SSH credentials.

### 🚀 Objective

The primary goal of this lab was to successfully configure three dedicated build agents on the application servers (stapp01, stapp02, and stapp03) to distribute the build workload away from the Jenkins Controller.

### 🏗️ Architecture Summary

Jenkins Node Name

Remote Host

SSH User

SSH Credential ID

Remote Directory

Verification Strategy

App_server_1

stapp01

tony

tony

/home/tony/jenkins

Non-verifying

App_server_2

stapp02

steve

steve

/home/steve/jenkins

Non-verifying

App_server_3

stapp03

banner

banner

/home/banner/jenkins

Non-verifying

### ✅ Prerequisites (Remote Servers)

Before configuring the nodes in Jenkins, the following steps were executed on all three application servers via the jump host.

Java Installation: Java 17 (OpenJDK) was installed on all three servers to run the Jenkins agent JAR.

# Example for stapp01
ssh tony@stapp01 sudo yum install -y java-17-openjdk


Remote Work Directory: A dedicated directory was created for the Jenkins agent to store its workspace files.

# Example for stapp02
ssh steve@stapp02 mkdir -p /home/steve/jenkins


⚙️ Jenkins Configuration Steps

1. SSH Credential Setup

Navigate to Manage Jenkins > Manage Credentials.

Add a new global credential of type "SSH Username with Private Key" for each of the three remote users (tony, steve, banner).

Ensure the ID field matches the username (tony, steve, or banner) for clarity.

Provide the respective SSH private key content (e.g., the private key for tony@stapp01).

2. Agent Node Creation

Navigate to Manage Jenkins > Nodes.

Select New Node and create a Permanent Agent for each application server.

Field

Value (Example for stapp02)

Name

App_server_2

Remote Root Directory

/home/steve/jenkins

Host

stapp02

Credentials

Select the steve SSH credential

Launch method

Launch agent via SSH

3. Connection Troubleshooting (Host Key Verification)

The initial connection attempt failed due to a missing known_hosts file. This was resolved by adjusting the Host Key Verification Strategy.

In the Node Configuration page for each agent, scroll down to the Host Key Verification Strategy.

Change the setting to Non-verifying Verification Strategy.

This setting allows Jenkins to connect without checking the remote host's SSH fingerprint, resolving the immediate connection failure and allowing the agents to successfully launch.

🏁 Conclusion

With the remote servers prepared and the Jenkins configuration set, all three agents (App_server_1, App_server_2, an