# Day-082 Ansible Inventory and Playbook Test (App Server 3)
### Objective

The Nautilus DevOps team is testing Ansible playbooks on various servers within the Stratos Datacenter.
This task involves creating an Ansible inventory file and verifying that a provided playbook can be executed successfully on App Server 3.

### Task Details

Create an Ansible inventory file at:

/home/thor/playbook/inventory


Inventory Type:
The file must be in INI format.

Include App Server 3 in the inventory with the correct variables for Ansible connectivity.

Ensure hostname correctness:
Use the naming convention stapp03 as per the Nautilus internal wiki.

Validation Command:
The playbook should run successfully using:

ansible-playbook -i inventory playbook.yml

Steps Performed

Navigate to the playbook directory:

cd /home/thor/playbook

```bash
#Created the inventory file:

touch inventory


#Edited the inventory file:

vi inventory


#Content:

[app_servers]
stapp03 ansible_user=banner ansible_password='BigGr33n' ansible_host=172.16.238.12 ansible_connection=ssh ansible_port=22


#Verified Ansible connectivity:

ansible all -m ping -i inventory


#Output:

stapp03 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}


#Checked playbook contents:

cat playbook.yml


#Content:

---
- hosts: all
  become: yes
  become_user: root
  tasks:
    - name: Install httpd package    
      yum: 
        name: httpd 
        state: installed
    
    - name: Start service httpd
      service:
        name: httpd
        state: started


#Executed the playbook:

ansible-playbook -i inventory playbook.yml


#First Run Output (changes applied):

PLAY RECAP
stapp03 : ok=3 changed=2 unreachable=0 failed=0


#Second Run Output (idempotent):

PLAY RECAP
stapp03 : ok=3 changed=0 unreachable=0 failed=0