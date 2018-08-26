project = pandoc
imageName = iaguara/$(project)
defaultContainerName = $(project)

CONTAINER_NAME ?= $(defaultContainerName)

stop:
	- docker container stop $(CONTAINER_NAME).iaguara

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

run:
	docker run -it --rm \
		--network iaguara \
		--name $(CONTAINER_NAME).iaguara \
		-h $(CONTAINER_NAME).iaguara \
		-v /tmp:/tmp \
		-v ${HOST_HOME}/.ssh:/root/.ssh \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		-w ${PWD} \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
