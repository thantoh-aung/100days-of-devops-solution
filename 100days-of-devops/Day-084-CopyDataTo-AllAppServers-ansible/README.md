# Day–084 Ansible Playbook to Copy Data to All Application Servers
### Objective

The Nautilus DevOps team needed to automate file distribution across all application servers in the Stratos Datacenter using Ansible.
This lab involved creating an inventory file and an Ansible playbook that copies a specific file from the jump host to all managed nodes (application servers).

### Task Requirements

Inventory File

Path: /home/thor/ansible/inventory

Must include all three application servers as managed nodes.

Playbook File

Path: /home/thor/ansible/playbook.yml

Must copy the file /usr/src/itadmin/index.html from the jump host to all application servers.

Destination path on each app server: /opt/itadmin/

Validation Command

ansible-playbook -i inventory playbook.yml


The playbook must run successfully without additional arguments.
```bash

#1. Navigate to the Ansible directory:
cd /home/thor/ansible

#2. Create and configure the inventory file:
touch inventory
vi inventory


#Final inventory content:

[app_servers]
stapp01 ansible_host=172.16.238.10 ansible_user=tony ansible_password='Ir0nM@n' ansible_ssh_common_args='-o StrictHostKeyChecking=no'
stapp02 ansible_host=172.16.238.11 ansible_user=steve ansible_password='Am3ric@' ansible_ssh_common_args='-o StrictHostKeyChecking=no'
stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_password='BigGr33n' ansible_ssh_common_args='-o StrictHostKeyChecking=no'

#3. Verify Ansible connectivity:
ansible all -m ping -i inventory

#4. Create and edit the playbook:
touch playbook.yml
vi playbook.yml

#5. Final Playbook Content:
---
- name: Copy Data
  hosts: all
  become: true
  tasks:
    - name: Copy Data to app server
      copy:
        src: /usr/src/itadmin/index.html
        dest: /opt/itadmin/
        remote_src: false

#6. Execute the playbook:
ansible-playbook -i inventory playbook.yml