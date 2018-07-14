project = wp-cli
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = wordpress:cli
volumeName = $(project)-data.iaguara

remove:
	- docker image rm -f $(imageName)
	- docker volume rm -f $(volumeName)

volume:
	- docker volume create $(volumeName)

run: volume
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v /tmp:/tmp \
		-v $(volumeName):/root/.wp-cli \
		--volumes-from data.iaguara \
		-w ${PWD} \
		-u root \
		$(imageName) \
		$(RUN_COMMAND)
