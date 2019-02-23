NODE_VERSION ?= 10
project = node
date = $(shell date +%s)
imageName = iaguara/$(project)$(NODE_VERSION)
defaultContainerName = $(project)-$(date)
volumeName = $(project)$(NODE_VERSION)-data

CONTAINER_NAME ?= $(defaultContainerName)

stop:
	- docker container stop $(CONTAINER_NAME).iaguara

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build --build-arg NODE_VERSION=$(NODE_VERSION) -t $(imageName) .

volume:
	- docker volume create $(volumeName)

run: volume
	docker run -it --rm \
		--network iaguara \
		--name $(CONTAINER_NAME).iaguara \
		-h $(CONTAINER_NAME).iaguara \
		-v /tmp:/tmp \
		-v ${HOST_HOME}/.ssh:/root/.ssh \
		-v $(volumeName):/usr/local \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		-w ${PWD} \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
