# Day-090 Ansible ACL & File Creation Lab
### Objective

The Nautilus DevOps team needs to create specific files on all application servers in the Stratos Datacenter and assign Access Control Lists (ACLs) so that only the required users or groups have additional permissions. All tasks must be automated using Ansible.

This README describes the playbook created to meet these requirements.

Playbook Requirements

You must:

Create a playbook named /home/thor/ansible/playbook.yml on the jump host.

Use the existing inventory file located in the same directory.

Perform the following tasks:

### App Server 1 – stapp01

Create the file: /opt/dba/blog.txt

Set ACL:

etype: group

entity: tony

permissions: r

### App Server 2 – stapp02

Create the file: /opt/dba/story.txt

Set ACL:

etype: user

entity: steve

permissions: rw

App Server 3 – stapp03

Create the file: /opt/dba/media.txt

Set ACL:

etype: group

entity: banner

permissions: rw

### Playbook Details

The playbook uses:

The file module to create empty files.

The acl module to assign ACL permissions.

A variable dictionary (acl_data) to map each host to its required parameters.

ansible_hostname for dynamic host identification.

### How to Run the Playbook

From the jump host:
```bash
cd /home/thor/ansible
touch playbook.yml
vi playbook.yml
ansible-playbook -i inventory playbook.yml
```