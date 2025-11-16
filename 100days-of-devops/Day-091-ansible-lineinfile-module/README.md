# 🚀 Ansible Lab: HTTPD Web Server Deployment

## 🎯 Objective

The primary goal of this lab is to demonstrate the deployment, configuration, and management of the **httpd** web server on multiple application servers (`stapp01`, `stapp02`, `stapp03`) within the Stratos DC, using an Ansible playbook.

---

## 📋 Requirements Fulfilled

The Ansible playbook (`playbook.yml`) successfully performed the following tasks on all targeted hosts:

1.  **Installation:** Installed the **`httpd`** package.
2.  **Service Management:** Ensured the **`httpd`** service is **started** and **enabled** to run at boot.
3.  **Content Deployment (Base):** Created the file `/var/www/html/index.html` with the initial content:
    > This is a Nautilus sample file, created using Ansible!
4.  **Content Modification (Top Line):** Added the specific line of content at the very **top** of `/var/www/html/index.html`:
    > Welcome to Nautilus Group!
5.  **Ownership:** Set the user and group owner of `/var/www/html/index.html` to **`apache`**.
6.  **Permissions:** Set the permissions of `/var/www/html/index.html` to **`0644`** (`-rw-r--r--`).

---

## 📁 Files and Commands

### 1. `inventory` File

The inventory file (located at `/home/thor/ansible/inventory`) defines the target group for the application servers:

```bash
cd /home/thor/ansible/
touch playbook.yml
vi playbook.yml
ansible-playbook -i inventory playbook.yml

#to check attribures and content
ssh tony@stapp01
ls -lah /var/www/html/index.html
# Output: -rw-r--r-- 1 apache apache 81 ... /var/www/html/index.html

cat /var/www/html/index.html
# Output:
# Welcome to Nautilus Group!
# This is a Nautilus sample file, created using Ansible!
```