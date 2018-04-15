project = vim
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = iaguara/$(project)

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

run:
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v /tmp:/tmp \
		-v ${HOST_IAGUARA_HOME}:/iaguara \
		-w ${PWD} \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		$(imageName) \
		$(RUN_COMMAND)
