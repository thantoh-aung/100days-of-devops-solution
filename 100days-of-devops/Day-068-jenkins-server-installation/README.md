# Jenkins Installation and Configuration Lab
🏢 Scenario

The DevOps team at xFusionCorp Industries is setting up a CI/CD pipeline infrastructure using Jenkins as the central automation server. Your task is to install, configure, and run Jenkins on the jenkins server using yum only.

⚙️ Task Requirements
1️⃣ Install Jenkins using yum

Install Jenkins on the jenkins server using the yum package manager only.

Start the Jenkins service after installation.

If the Jenkins service fails to start due to timeout, troubleshoot it using journalctl -xeu jenkins.service.

## Commands:
```bash
# Switch to root user (from jump host)
ssh root@jenkins

# Install Java (required for Jenkins)
yum install -y java-11-openjdk

# Add Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
yum install -y jenkins

# Enable and start Jenkins service
systemctl enable --now jenkins

# Check service status
systemctl status jenkins
```
## 2️⃣ Configure Jenkins Admin User

Once Jenkins is running:

Open Jenkins UI — click the “Jenkins” button in the top bar .

### Retrieve the initial admin password:
```bash
cat /var/lib/jenkins/secrets/initialAdminPassword
```
### Complete the web setup wizard:

Install suggested plugins

Create first admin user with the following details:

Username: theadmin

Password: Adm!n321

Full name: Yousuf

Email: yousuf@jenkins.stratos.xfusioncorp.com

Save and finish the setup. Jenkins will redirect you to the dashboard.