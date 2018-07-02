PYTHON_VERSION ?= 3
project = python
date = $(shell date +%s)
imageName = python:$(PYTHON_VERSION)-alpine
defaultContainerName = $(project)-$(date)

CONTAINER_NAME ?= $(defaultContainerName)

stop:
	- docker container stop $(CONTAINER_NAME).iaguara

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build --build-arg PYTHON_VERSION=$(PYTHON_VERSION) -t $(imageName) .

volume:
	- docker volume create $(project)$(PYTHON_VERSION)-usr-local

run: volume
	docker run -it --rm \
		--network iaguara \
		--name $(CONTAINER_NAME).iaguara \
		-h $(CONTAINER_NAME).iaguara \
		-v /tmp:/tmp \
		-v ${HOST_HOME}/.ssh:/root/.ssh \
		-v $(project)$(PYTHON_VERSION)-usr-local:/usr/local \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		-w ${PWD} \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
