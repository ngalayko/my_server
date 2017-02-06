###############
# galayko.xyz #
###############

export URL = docker.galayko.xyz

export GALAYKO_DOCKER_SITE =${URL}/ngalayko/site

all: local docker containers deploy

local:
	sudo apt-get install -y ansible docker 

docker: 
	ansible-playbook -i inventory/default docker.yaml 

deploy: 
	ansible-playbook -i inventory/default site.yaml 

containers: container-site

#== Containers ==#

container-site:
	docker build -t ${GALAYKO_DOCKER_SITE} ./containers/site
	docker push ${GALAYKO_DOCKER_SITE} 
