project = vim

stop:
	docker container stop iaguara/$(project) 2>/dev/null

remove: stop
	docker image rm -f iaguara/$(project) 2>/dev/null

build: remove
	docker build -t iaguara/$(project) .

run:
	docker run -it --rm \
		--name $(project).iaguara \
		--network iaguara \
		-h "$(project).iaguara" \
		-v /tmp:/tmp \
		-v ${HOME}/.ssh:/root/.ssh \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		iaguara/$(project)
