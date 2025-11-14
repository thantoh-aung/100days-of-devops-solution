# Day-088 Ansible Blockinfile Module
### Lab Goal

The Nautilus DevOps team wants to install and configure a basic httpd web server on all application servers in the Stratos Datacenter using Ansible. They also want to deploy a simple HTML page using the blockinfile module.

Your task is to create an Ansible playbook that performs the full setup automatically.

### ✅ steps

1. Location of Inventory file is already provided at:

 /home/thor/ansible/inventory
 
Create the playbook at:

  /home/thor/ansible

2. What the Playbook Must Do

Using Ansible, automate the following on all app servers:

a. Install httpd package

Use the yum module to ensure:

httpd is installed

b. Start and enable httpd service

Use the service module:

state: started
enabled: yes

c. Create /var/www/html/index.html using blockinfile

Use the blockinfile module to insert the following content:

Welcome to XfusionCorp!

This is  Nautilus sample file, created using Ansible!

Please do not modify this file manually!

d. File ownership and permissions

Ensure:

owner: apache
group: apache
mode: 0644

❗ Important Rules

Do NOT use any custom markers in blockinfile.

The playbook must run exactly like this:

ansible-playbook -i inventory playbook.yml

```bash
cd /home/thor/ansible/
ls -lah
touch playbook.yml
vi playbook.yml

#✅ Validation
ansible-playbook -i inventory playbook.yml
```