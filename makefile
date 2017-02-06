###############
# galayko.xyz #
###############

export GALAYKO_DOCKER_SITE = docker.galayko.xyz/ngalayko/ners-sitesite

all: local docker containers deploy

local:
	sudo apt-get install -y ansible docker 

docker: 
	ansible-playbook docker.yaml 

deploy: 
	ansible-playbook site.yaml 

containers: container-site

#== Containers ==#
container-site:
	docker build -t ${GALAYKO_DOCKER_SITE} ./containers/site
	docker push ${GALAYKO_DOCKER_SITE}
