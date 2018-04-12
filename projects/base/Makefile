project = base

stop:
	- docker container stop iaguara/$(project)

remove: stop
	- docker image rm -f iaguara/$(project)

build: remove
	docker build -t iaguara/$(project) .

ls:
	@echo
	@docker image ls | grep -E "^(REPOSITORY|iaguara)"
	@echo
	@docker container ls | grep -E "(^CONTAINER|iaguara)"
	@echo
	@echo

clean:
	- docker rm -f $(project).iaguara
	- docker rm -f data.iaguara
	- docker rm -f dotfiles.iaguara

network:
	- docker network create \
			--driver bridge \
			--subnet 172.66.1.0/24 \
			iaguara

data:
	- docker create \
			--name data.iaguara \
			-v ${HOME}/workdir:/data \
			tianon/true

dotfiles:
	- docker create \
			--name dotfiles.iaguara \
			-v /root \
			iaguara/dotfiles

run: data dotfiles network
	docker run -it --rm --privileged \
		--name $(project).iaguara \
		--network iaguara \
		-h "iaguara" \
		-p 2200:22 \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /tmp:/tmp \
		-v ${HOME}/.ssh:/root/.ssh \
		-v ${IAGUARA_HOME}:/iaguara \
		-e HOST_HOME="${HOME}" \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		iaguara/$(project) \
		$(RUN_COMMAND) $(GITHUB_USERS)

start:
	RUN_COMMAND=start $(MAKE) run
