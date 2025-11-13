# Day-085 Ansible File Creation Lab – Nautilus DevOps Project
### 🧾 Task Description

The Nautilus DevOps team is testing various Ansible modules on servers in the Stratos Datacenter (DC). Their current goal is to automate the creation of files on multiple remote application servers using Ansible.

Your task is to create a playbook that ensures a blank file is created with specific permissions and ownership on all application servers.

### 🧠 Requirements

Follow the steps below carefully:
```bash
#1. Inventory Setup

#Create an inventory file at:

touch ~/playbook/inventory
cd ~/playbook/
vi inventory


#Add all app servers (e.g., stapp01, stapp02, stapp03) under a group called app_servers.

#Example inventory:

[app_servers]
stapp01 ansible_host=<IP_or_hostname> ansible_user=tony
stapp02 ansible_host=<IP_or_hostname> ansible_user=steve
stapp03 ansible_host=<IP_or_hostname> ansible_user=banner

# Verify Ansible connectivity:
ansible all -m ping -i inventory

#2. Playbook Creation

#Create a playbook file at:

touch ~/playbook/playbook.yml
vi ~/playbook/playbook.yml



#The playbook should:

#Target all servers in the app_servers group.

#Create a blank file /usr/src/appdata.txt.

#Set file permissions to 0777.

#Set ownership according to the connecting user (tony, steve, banner).

#3. Expected Playbook Example
---
- name: create a blank file
  hosts: app_servers
  become: true
  tasks:
    - name: create a blank file /usr/src/appdata.txt
      file:
        path: /usr/src/appdata.txt
        state: touch
        mode: '0777'
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"

#4. Run and Verify

#Execute the playbook using:

ansible-playbook -i inventory playbook.yml