# Day-080 Jenkins Chained Builds — Apache Service Restart Automation
### 📘 Objective

The DevOps team at Nautilus has decided to automate the restart of Apache services on all application servers only when a deployment completes successfully. To achieve this, Jenkins chained builds are implemented — where one job handles deployment and another manages service restarts.

### ⚙️ Environment Details

Jenkins UI: Accessible from the top bar
Username: admin
Password: Adm!n321

Gitea (Git) UI: Accessible on port 8090
Username: sarah
Password: Sarah_pass123
Repository: web

Shared Directory:
/var/www/html on all app servers is a shared directory mounted from the Storage Server.

Apache Status: Already installed and configured on all app servers.

## 🧱 Task Breakdown
### 1️⃣ Job 1 — nautilus-app-deployment

Purpose:
To deploy the latest changes from the web repository to the shared Apache document root (/var/www/html).

Configuration Steps:

Create a Freestyle Project named nautilus-app-deployment.

Under Source Code Management, select Git and configure:

Repository URL: /var/www/html (already a local git repo tracking origin web repo)

Branch: master

Under Build Triggers, you can manually build or connect to the Git webhook if available.

(Optional) Under Build Environment, select “Delete workspace before build starts” to ensure clean builds.

Under Build Steps, add:
```bash
ssh -0 StrictHostKeyChecking=no natasha@ststor01
cd /var/www/html
sudo git checkout master
sudo git pull origin master
echo "Deployment completed successfully!"
```

Post-build Action:

Add "Build other projects".

Specify downstream project: manage-services.

Select Trigger only if build is stable.

### 2️⃣ Job 2 — manage-services

Purpose:
To restart Apache (httpd) service on all app servers only when the deployment job succeeds.

Configuration Steps:

Create another Freestyle Project named manage-services.

Under Build Triggers, check:

✅ “Build after other projects are built”

Specify nautilus-app-deployment as the upstream project.

Choose Trigger only if build is stable.

Add a Build Step → Execute Shell:
```bash
 ssh -o StrictHostKeyChecking=no tony@ststapp01 "sudo systemctl restart httpd"
 ssh -o StrictHostKeyChecking=no steve@ststapp02 "sudo systemctl restart httpd"
 ssh -o StrictHostKeyChecking=no banner@ststapp03 "sudo systemctl restart httpd"
```


Save the job configuration.

### 🚀 Validation

Trigger the nautilus-app-deployment job manually or by pushing a change to the web repository.

Once it completes successfully, verify that the manage-services job runs automatically.

Access the Load Balancer URL from the App button on the top bar:

https://<LBR-URL>


You should see the latest deployed web content (no subdirectory like /web).

### 🧩 Notes & Recommendations

If any Jenkins plugins are missing, install them from Manage Jenkins → Plugin Manager → Available Plugins.

After installation, select “Restart Jenkins when installation is complete and no jobs are running.”

If Jenkins UI hangs after restart, refresh your browser.

Ensure the Jenkins user has proper SSH access or uses sudo for remote commands.

Validate by running the deployment job multiple times — it should pass consistently.

Take screenshots or record your screen (using Loom or similar) for review if needed.