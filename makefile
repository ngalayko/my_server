#################
# galayko.rocks #
#################

export URL = docker.galayko.rocks
export DOCKER_NGINX = ${URL}/nginx

all: containers deploy

server:  
	ansible-playbook -i inventory/default server.yaml 

