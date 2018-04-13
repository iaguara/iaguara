project = gradle8
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = iaguara/$(project)

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

cache:
	- docker volume create --name $(project).cache

run: cache
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v /tmp:/tmp \
		-v ${HOME}/.ssh:/root/.ssh \
		-v $(project).cache:/home/gradle/.gradle \
		-v ${HOST_HOME}/.m2:/home/gradle/.m2 \
		-w ${PWD} \
		--volumes-from data.iaguara \
		$(imageName) \
		$(RUN_COMMAND)
