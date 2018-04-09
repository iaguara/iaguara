project = dotfiles

stop:
	- docker container stop iaguara/$(project)

remove: stop
	- docker image rm -f iaguara/$(project)

build: remove
	docker build -t iaguara/$(project) .

