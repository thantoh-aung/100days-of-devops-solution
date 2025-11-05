# Day-061 Kubernetes Secret Volume Mount Lab

This solution demonstrates how to consume a Generic Secret and mount it as a file inside a Kubernetes Pod using a volume. This is essential for securely providing sensitive configuration data to applications.

#  Lab Objective
To create a generic Secret named ecommerce from a local file, and then deploy a Pod that mounts this Secret under the path /opt/games.