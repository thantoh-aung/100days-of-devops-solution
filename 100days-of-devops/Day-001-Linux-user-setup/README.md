# Day-001-Non-Interactive-User-Setup

##  Challenge Goal
Create a system user named `mark` on App Server 2 with a non-interactive shell to accommodate the requirements of a new backup agent tool.

##  Solution Logic
A non-interactive shell prevents a user from logging in and executing commands interactively via SSH or console. This is a security best practice for service accounts.
A common practice is to set the user's shell to '/sbin/nologin' or '/usr/sbin/nologin'.

##  Commands 

1.  **Connect App Server 2:**
    ```bash
    ssh steve@stapp02
    ```

2.  **Create user 'mark' with  non-interactive shell:**
    ```bash
    sudo useradd -s /sbin/nologin mark
    ```

3.  **Verification the shell was set:**
    ```bash
    grep mark /etc/passwd
    ```
    # Expected Output: mark:x:1003:1003::/home/mark:/sbin/nologin
   