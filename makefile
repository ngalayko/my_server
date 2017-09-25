#################
# galayko.rocks #
#################

export DRONE_HOST = drone.galayko.rocks
export DRONE_SECRET = $$(env LC_CTYPE=C LC_ALL=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 32)
export DRONE_GITHUB_CLIENT = GITHUB_CLIENT_ID 
export DRONE_GITHUB_SECRET = GITHUB_CLIENT_SECRET

all: server services 

server:  
	ansible-playbook -i inventory/default server.yaml 

drone:
	ansible-playbook -i inventory/default drone.yaml

services: 
	ansible-playbook -i inventory/default services.yaml

