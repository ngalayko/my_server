###############
# galayko.xyz #
###############

all: ansible docker

ansible:
	sudo apt-get install ansible -y

docker: 
	 ansible-playbook docker.yaml 

