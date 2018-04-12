project = node8
date = $(shell date +%s)

stop:
	- docker container stop iaguara/$(project)

remove: stop
	- docker image rm -f iaguara/$(project)

build: remove
	docker build -t iaguara/$(project) .

run:
	docker run -it --rm \
		--network iaguara \
		--name "$(project)-$(date).iaguara" \
		-h "$(project)-$(date).iaguara" \
		-v /tmp:/tmp \
		-v ${HOME}/.ssh:/root/.ssh \
		-w ${PWD} \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		iaguara/$(project) \
		$(RUN_COMMAND)
