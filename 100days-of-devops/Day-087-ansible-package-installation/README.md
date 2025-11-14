# Day-087 Ansible Package Installation Lab
## Objective

The Nautilus Application Development team needs specific packages installed on all application servers in the Stratos Datacenter. Since Ansible is already used for automation, your task is to install the zip package on all app servers using an Ansible playbook.

## Requirements

Create an inventory file at:
/home/thor/playbook/inventory

Create a playbook at:
/home/thor/playbook/playbook.yml

The playbook must install the zip package on all app servers.

The playbook must be runnable using:
ansible-playbook -i inventory playbook.yml

The user thor should be able to execute it without extra arguments.

### Steps Performed
```bash
#1. Created directory and inventory file

#Logged into the jump host and created the required files:

cd /home/thor/playbook
touch inventory

#2. Added all app servers to the inventory

#Content of inventory:

[app_servers]
stapp01 ansible_host=172.16.238.10 ansible_user=tony ansible_ssh_pass=Ir0nM@n
stapp02 ansible_host=172.16.238.11 ansible_user=steve ansible_ssh_pass=Am3ric@
stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_ssh_pass=BigGr33n

#3. Verified connectivity

#Used Ansible ping module to confirm connection to all servers:

ansible all -m ping -i inventory


#All servers returned pong, confirming successful SSH communication.

#4. Created the Ansible playbook

touch playbook.yml


#Content of playbook.yml:

---
- name: install zip package on app servers
  hosts: app_servers
  become: true
  tasks:
    - name: install zip
      yum:
        name: zip
        state: present

#5. Ran the playbook

ansible-playbook -i inventory playbook.yml


