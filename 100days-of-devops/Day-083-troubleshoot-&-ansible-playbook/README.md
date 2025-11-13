# Day-083 Ansible Playbook Completion (Create Empty File on App Server 3)
### Objective

The Nautilus DevOps team had an unfinished Ansible setup on the jump host.
The goal was to:

Fix the existing Ansible inventory file, ensuring it connects to App Server 3 in the Stratos Datacenter.

Create a new Ansible playbook that creates an empty file /tmp/file.txt on that server.

Task Requirements

Inventory file: /home/thor/ansible/inventory

Playbook file: /home/thor/ansible/playbook.yml

Target host: App Server 3 (hostname: stapp03)

Playbook validation command:

ansible-playbook -i inventory playbook.yml

### Steps Performed
```bash
#1. Navigate to the Ansible directory:
cd /home/thor/ansible

#2. Update the inventory file:
vi inventory


#Final Content:

stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_password='BigGr33n' ansible_ssh_common_args='-o StrictHostKeyChecking=no'

#3. Verify connectivity to App Server 3:
ansible all -m ping -i inventory


#Output:

stapp03 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}


#✅ Connection confirmed — inventory setup is correct.

#4. Create the Ansible playbook:
touch /home/thor/ansible/playbook.yml
vi playbook.yml


#Final Playbook Content:

- name: Create Empty File
  hosts: stapp03
  tasks:
    - name: Creating file /tmp/file.txt using file module
      file:
        path: /tmp/file.txt
        state: touch

#5. Run the playbook:
ansible-playbook -i inventory playbook.yml