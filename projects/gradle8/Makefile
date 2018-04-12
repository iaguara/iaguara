project = gradle8
date = $(shell date +%s)

stop:
	- docker container stop iaguara/$(project)

remove: stop
	- docker image rm -f iaguara/$(project)

build: remove
	docker build -t iaguara/$(project) .

cache:
	- docker volume create --name gradle8-cache.iaguara

run: cache
	docker run -it --rm \
		--network iaguara \
		--name "$(project)-$(date).iaguara" \
		-h "$(project)-$(date).iaguara" \
		-v /tmp:/tmp \
		-v ${HOME}/.ssh:/root/.ssh \
		-v gradle8-cache.iaguara:/home/gradle/.gradle \
		-v ${HOST_HOME}/.m2:/home/gradle/.m2 \
		-w ${PWD} \
		--volumes-from data.iaguara \
		iaguara/$(project) \
		$(RUN_COMMAND)
