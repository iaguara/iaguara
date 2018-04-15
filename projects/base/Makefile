project = base
containerName = $(project).iaguara
imageName = iaguara/$(project)

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

ls:
	@echo
	@docker image ls | grep -E "^(REPOSITORY|iaguara)"
	@echo
	@docker container ls | grep -E "(^CONTAINER|iaguara)"
	@echo
	@echo

clean:
	- docker rm -f $(containerName)
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
			-v ${HOME}/workspace:/data \
			tianon/true

dotfiles:
	- docker create \
			--name dotfiles.iaguara \
			-v /root \
			iaguara/dotfiles

run: data dotfiles network
	docker run -it --rm --privileged \
		--name $(containerName) \
		--network iaguara \
		-h iaguara \
		-p 2200:22 \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /tmp:/tmp \
		-v ${HOME}/.ssh:/root/.ssh \
		-v ${IAGUARA_HOME}:/iaguara \
		-e HOST_HOME="${HOME}" \
		-e HOST_IAGUARA_HOME="${IAGUARA_HOME}" \
		-e COLUMNS=`tput cols` -e LINES=`tput lines` \
		--volumes-from data.iaguara \
		--volumes-from dotfiles.iaguara \
		$(imageName) \
		$(RUN_COMMAND) $(GITHUB_USERS)

start:
	RUN_COMMAND=start $(MAKE) run
