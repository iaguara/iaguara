NODE_VERSION ?= 8
project = node
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = iaguara/$(project)$(NODE_VERSION)

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build --build-arg NODE_VERSION=$(NODE_VERSION) -t $(imageName) .

volume:
	- docker volume create $(project)$(NODE_VERSION)-lib
	- docker volume create $(project)$(NODE_VERSION)-bin

run: volume
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v /tmp:/tmp \
		-v ${HOST_HOME}/.ssh:/root/.ssh \
		-v $(project)$(NODE_VERSION)-lib:/usr/local/lib/node_modules \
		-v $(project)$(NODE_VERSION)-bin:/usr/local/bin \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		-w ${PWD} \
		$(imageName) \
		$(RUN_COMMAND)
