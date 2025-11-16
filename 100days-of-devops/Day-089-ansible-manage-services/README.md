# Day-089 Ansible Manage Services
### Objective

The Nautilus DevOps team must automate package installation and service management on all application servers using Ansible. Developers have requested HTTPD to be installed and enabled on all app servers. Your task is to create and run an Ansible playbook from the jump host to complete this configuration.

### Requirements

Create an Ansible playbook at:

/home/thor/ansible/playbook.yml


Configure the playbook to:

Install the httpd package on all app servers.

Start and enable the httpd service.

Use the existing inventory file located at:

/home/thor/ansible/inventory


Ensure user thor can run the playbook without extra arguments.

Validation will run:

ansible-playbook -i inventory playbook.yml


So the playbook must work exactly with this command.

Directory Structure
/home/thor/ansible/
 ├── inventory
 └── playbook.yml

### Step-by-Step Instructions
```bash
#1. Navigate to the Ansible folder
cd /home/thor/ansible/

#2. Create the playbook file
touch playbook.yml

#3. Edit the playbook
vi playbook.yml

#4. Insert the following Ansible playbook
---
- name: install and configure httpd
  hosts: all
  become: yes

  tasks:
    - name: install httpd
      yum:
        name: httpd
        state: present

    - name: start and enable httpd
      service:
        name: httpd
        state: started
        enabled: yes

#5. Run the playbook
ansible-playbook -i inventory playbook.yml
```