#################
# galayko.rocks #
#################

export DRONE_HOST = drone.galayko.rocks
export DRONE_SECRET = $$(env LC_CTYPE=C LC_ALL=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 32)
export DRONE_GITHUB_CLIENT = # client id HERE
export DRONE_GITHUB_SECRET = # client secret here 

all: server drone

server:  
	ansible-playbook -i inventory/default server.yaml 

drone:
	ansible-playbook -i inventory/default drone.yaml

