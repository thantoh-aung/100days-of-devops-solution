# Day-086 Ansible Ping Module Usage – Nautilus DevOps Project
### 🧾 Task Description

The Nautilus DevOps team is preparing to test several Ansible playbooks on various app servers within the Stratos Datacenter (DC).
Before running the playbooks, a password-less SSH connection must be established between the Ansible controller (Jump Host) and all Ansible managed nodes (App Servers).

You have been assigned to complete the SSH setup and verify connectivity.

### 🧠 Requirements
### 1. Environment Details

Jump Host (Controller):
Used to run Ansible playbooks.
User: thor

Managed Nodes (App Servers):

stapp01 (User: tony)

stapp02 (User: steve)

stapp03 (User: banner)
```bash
#2. Inventory Setup

#An inventory file already exists at: /home/thor/ansible/inventory
vi /home/thor/ansible/inventory

#You must ensure it contains the correct Ansible connection details for each app server.

#✅ Example inventory configuration:

stapp01 ansible_host=172.16.238.10 ansible_user=tony ansible_ssh_pass=Ir0nM@n
stapp02 ansible_host=172.16.238.11 ansible_user=steve ansible_ssh_pass=Am3ric@
stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_ssh_pass=BigGr33n

#3. Verify SSH Connectivity

#Once the inventory is configured properly, test connectivity using the ping module:

ansible all -m ping -i /home/thor/ansible/inventory