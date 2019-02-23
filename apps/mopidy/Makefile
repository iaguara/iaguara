project = mopidy
containerName = $(project).iaguara
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
		--volumes-from dotfiles.iaguara \
		--device /dev/snd \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
