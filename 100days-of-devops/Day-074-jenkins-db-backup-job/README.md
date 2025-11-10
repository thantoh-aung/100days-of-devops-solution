# Jenkins Database Backup Lab
### Objective

Automate the backup of the kodekloud_db01 database on the Database Server in Stratos Datacenter using Jenkins. The backup should be stored on the Backup Server under /home/clint/db_backups and the job should run periodically every 10 minutes.

### Prerequisites

Jenkins installed and running.

Jenkins plugins installed:

SSH Agent

### Credentials Plugin

Access to the following servers:

Database Server: stdb01

Backup Server: stbkp01

SSH keys configured for passwordless authentication:

From Jenkins user to stdb01 (peter)

From stdb01 to stbkp01 (clint)

## Jenkins Job Setup
### Step 1: Access Jenkins

Click on the Jenkins button on the top bar to access the Jenkins UI.

Login using credentials:

Username: admin

Password: Adm!n321

### Step 2: Create a Job

Click New Item.

Enter database-backup as the job name.

Select Freestyle Project and click OK.

### Step 3: Configure Job Parameters

String Parameters:

DB_NAME → default: kodekloud_db01

DB_USER → default: kodekloud_roy

Password Parameter:

DB_PASS → default: asdfgdsd

### Step 4: Configure Build Triggers

Check Build periodically.

Set the schedule as:
```bash
*/10 * * * *
```

This runs the job every 10 minutes.

Step 5: Configure Build Environment

Check SSH Agent.

Select the credentials you configured for the peter user to connect to stdb01.

### Step 6: Add Build Steps

Choose Execute Shell.

Add the following shell script:
```bash
#!/bin/bash


# Define dump file name
FILE_PATH="/tmp/db_$(date +%F).sql"

# Take database dump from stdb01
ssh -o StrictHostKeyChecking=no -t peter@stdb01 \
"mysqldump -u ${DB_USER} -p${DB_PASS} ${DB_NAME} > ${FILE_PATH}"

# Copy the dump to the Backup Server
scp -o StrictHostKeyChecking=no peter@stdb01:${FILE_PATH} clint@stbkp01:/home/clint/db_backups/
```

### Step 7: Save and Test

Click Save.

Click Build Now to test the job manually.

Verify:

The database dump exists on stdb01 as /tmp/db_YYYY-MM-DD.sql.

The file is copied to /home/clint/db_backups on stbkp01.

### Step 8: Notes

If plugins were installed, Jenkins may require a restart. Refresh the UI if it appears stuck.

For web UI tasks, take screenshots or record your steps using a tool like loom.com
.

Always verify known_hosts and SSH key setup to avoid Host key verification failed errors.

### Step 9: Automation Verification

Check that the job runs every 10 minutes.

Confirm backups are consistently generated and copied to the backup server