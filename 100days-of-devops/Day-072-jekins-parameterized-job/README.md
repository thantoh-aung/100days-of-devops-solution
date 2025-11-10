# Day-072 Jenkins Parameterized Job — Basic Build Test (Nautilus DevOps)
📘 Overview

This lab introduces the basics of parameterized Jenkins builds.
A new DevOps Engineer has joined the Nautilus team, and this exercise is designed to help test and demonstrate how Jenkins handles parameterized jobs using both String and Choice parameters.

🧩 Objective

Create and test a Jenkins job named parameterized-job that accepts user parameters and echoes them during the build process.

## 🪜 Step-by-Step Instructions
1. Access Jenkins

Click the Jenkins button on the top navigation bar.

Log in with the credentials:

Username: admin

Password: Adm!n321

## 2. Create a New Jenkins Job

From the Jenkins dashboard, click “New Item”.

Enter the job name: parameterized-job.

Select “Freestyle project”, then click OK.

## 3. Configure Parameters

On the configuration page, check “This project is parameterized.”

Add the following parameters:

🧾 String Parameter

Name: Stage

Default Value: Build

Description: Stage name for the pipeline.

🧾 Choice Parameter

Name: env

Choices (each on a new line):

Development
Staging
Production


Description: Select the environment for this build.

## 4. Configure Build Steps

Scroll to the Build section.

Click Add build step → Execute shell.

Enter the following shell commands:

echo "Stage Parameter: $Stage"
echo "Environment Parameter: $env"


Click Save.

## 5. Test the Jenkins Job

Navigate to Jenkins Dashboard → parameterized-job.

Click “Build with Parameters.”

Enter:

Stage: (leave default Build or modify as needed)

env: Select Development

Click Build.

✅ Expected Output in Console:

Stage Parameter: Build
Environment Parameter: Development

🧩 Notes

Plugin Installation:

If the “This project is parameterized” option is missing, install the Parameterized Trigger Plugin or Build Parameters Plugin.

After installation, select “Restart Jenkins when installation is complete and no jobs are running.”

Jenkins UI Refresh:

After Jenkins restarts, refresh your browser to reload the interface.

Documentation:

Capture screenshots of your:

Job configuration

Parameters

Console output after successful build

Optionally, use Loom.com
 to record your screen for submission or review.

🧾 Example Console Output
Started by user admin
Running as SYSTEM
[parameterized-job] $ /bin/bash
Stage Parameter: Build
Environment Parameter: Development
Finished: SUCCESS
