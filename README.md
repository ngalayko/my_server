## Setting up server with docker containers using ansible

# Requirements
* You should have SSL certificates on the remote server, use [Let's Encrypt](https://letsencrypt.org/) for easy install
* You should be able to access remote server via ssh
* Make sure docker.site.url leads to localhost:5000
* [Docker](https://www.docker.com/)
* [Ansible](https://www.ansible.com/)

# Usage
`make server` to set up server envyroment 

`make` for deploy

# TODO
* nginx container
* let's encrypt container
