# ⚙️ Ansible Lab: HTTPD Role Refactoring with Jinja2 Templating

## 🎯 Objective

The goal of this lab was to update an existing Ansible role for `httpd` to dynamically generate the `/var/www/html/index.html` file using a **Jinja2 template**. This template must use the `inventory_hostname` variable to personalize the content for each server. Additionally, the playbook was updated to execute this role specifically on **App Server 3 (`stapp03`)**.

---

## 📋 Implementation Steps

The following files were created and modified to meet all requirements:

### 1. `playbook.yml` Update (Requirement a)

The playbook was updated to target only **`stapp03`** and run the existing `httpd` role.

* **Location:** `/home/thor/ansible/playbook.yml`
* **Content:**
    ```yaml
    ---
    - name: Deploy httpd role on stapp03
      hosts: stapp03
      become: yes
      roles:
        - httpd
    ```

### 2. Jinja2 Template Creation (Requirement b)

A template file was created to dynamically insert the server's name using the `{{ inventory_hostname }}` variable.

* **Location:** `/home/thor/ansible/role/httpd/templates/index.html.j2`
* **Content:**
    ```jinja2
    This file was created using Ansible on {{ inventory_hostname }}
    ```

### 3. Role Tasks Update (Requirement c & d)

The main tasks file for the `httpd` role was updated to include a new task using the **`template`** module. This task copies the template, sets the file permissions to `0644`, and correctly sets the owner/group to the connecting sudo user using the **`ansible_user`** variable.

* **Location:** `/home/thor/ansible/role/httpd/tasks/main.yml`
* **Content (Relevant Template Task Added):**
    ```yaml
    # ... existing tasks for install and service start ...

    - name: Create index.html by using template
      template:
        src: index.html.j2
        dest: /var/www/html/index.html
        mode: '0644'
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
    ```

---

## ✅ Results and Verification

The playbook was executed successfully, resolving an initial YAML syntax error:

### Execution Command

```bash
ansible-playbook -i inventory playbook.yml