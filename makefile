#################
# galayko.rocks #
#################

export URL = docker.galayko.rocks
export GALAYKO_DOCKER_SITE = ${URL}/site
export GALAYKO_DOCKER_LAST.FM_TO_VK = ${URL}/last.fm_to_vk
export GALAYKO_DOCKER_VK_SAVED_PHOTO_ORIGIN = ${URL}/vk_saved_photo_origin

all: containers deploy

server: 
	ansible-playbook -i inventory/default server.yaml 

deploy: 
	ansible-playbook -i inventory/default deploy.yaml 

containers: container-site container-stats container-last-fm containers-vk-photo

#== Containers ==#

container-site:
	-git clone git@github.com:ngalayko/Syte2.git ./containers/site
	docker build -t ${GALAYKO_DOCKER_SITE} ./containers/site
	docker push ${GALAYKO_DOCKER_SITE} 

container-last-fm:
	-git clone git@github.com:ngalayko/last.fm_to_VK.git ./containers/last.fm_to_vk
	docker build -t ${GALAYKO_DOCKER_LAST.FM_TO_VK} ./containers/last.fm_to_vk
	docker push ${GALAYKO_DOCKER_LAST.FM_TO_VK}

containers-vk-photo:
	-git clone git@github.com:ngalayko/vk_saved_photo_origin.git ./containers/vk_saved_photo_origin
	docker build -t ${GALAYKO_DOCKER_VK_SAVED_PHOTO_ORIGIN} ./containers/vk_saved_photo_origin
	docker push ${GALAYKO_DOCKER_VK_SAVED_PHOTO_ORIGIN}
