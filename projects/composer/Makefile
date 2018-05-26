project = composer
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = $(project)

remove:
	- docker image rm -f $(imageName)

run:
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v /tmp:/tmp \
		--volumes-from data.iaguara \
		-w ${PWD} \
		$(imageName) \
		$(RUN_COMMAND)
