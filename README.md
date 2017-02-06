## Setting up full server with docker containers using ansible

# Requirements
* You should have SSL certificates on the remote server, use [Let's Encrypt](https://letsencrypt.org/) for easy install
* You should be able to access remote server via ssh
* Make sure docker.site.url leads to localhost:5000 (that's docker-registry port)
* [Docker](https://www.docker.com/)
* [Ansible](https://www.ansible.com/)

# Usage
Just `make` it
