# Day-093 Ansible Lab: Conditional File Copy (when statement)
## 🎯 Objective
The objective of this lab was to utilize Ansible's when conditional statements to control which specific tasks execute on which specific server, even when the play is targeted at all hosts. This exercise demonstrates a core Ansible feature for precise, host-specific configuration management within a single playbook.

## 📋 Requirements Fulfilled (Conditional Logic)
The single playbook (playbook.yml) was executed against all application servers (stapp01, stapp02, stapp03). Using the ansible_nodename gathered fact, the following file copies were executed and configured:

### For App Server 1 (stapp01.stratos.xfusioncorp.com):

Action: Copy the file /usr/src/dba/blog.txt from the jump host.

Destination: /opt/dba/blog.txt

Ownership: Set user and group owner to tony.

Permissions: Set file permissions to 0644.

### For App Server 2 (stapp02.stratos.xfusioncorp.com):

Action: Copy the file /usr/src/dba/story.txt from the jump host.

Destination: /opt/dba/story.txt

Ownership: Set user and group owner to steve.

Permissions: Set file permissions to 0644.

### For App Server 3 (stapp03.stratos.xfusioncorp.com):

Action: Copy the file /usr/src/dba/media.txt from the jump host.

Destination: /opt/dba/media.txt

Ownership: Set user and group owner to banner.

Permissions: Set file permissions to 0644.

## 🛠️ Implementation Details
```bash
cd ansible
touch playbook.yml
vi playbook.yml
ansible-playbook -i inventory playbook.yml