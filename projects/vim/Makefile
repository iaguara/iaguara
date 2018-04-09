project = vim

stop:
	- docker container stop iaguara/$(project)

remove: stop
	- docker image rm -f iaguara/$(project)

build: remove
	docker build -t iaguara/$(project) .

run:
	docker run -it --rm \
		--name $(project).iaguara \
		--network iaguara \
		-h "$(project).iaguara" \
		-v /tmp:/tmp \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		iaguara/$(project)
