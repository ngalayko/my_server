###############
# galayko.xyz #
###############

export URL = docker.galayko.xyz
export GALAYKO_DOCKER_SITE = ${URL}/ngalayko/site
export GALAYKO_DOCKER_STATS = ${URL}/ngalayko/stats

all: containers deploy

server: 
	ansible-playbook -i inventory/default server.yaml 

deploy: 
	ansible-playbook -i inventory/default deploy.yaml 

containers: container-site container-stats

#== Containers ==#

container-site:
	docker build -t ${GALAYKO_DOCKER_SITE} ./containers/site
	docker push ${GALAYKO_DOCKER_SITE} 

container-stats:
	docker build -t ${GALAYKO_DOCKER_STATS} ./containers/stats
	docker push ${GALAYKO_DOCKER_STATS}
