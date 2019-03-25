project = git
imageName = iaguara/$(project)

remove:
	- docker image rm -f $(imageName)

build: remove
	docker build \
		-t $(imageName) \
		.

