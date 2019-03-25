project = base
containerName = $(project).iaguara
imageName = iaguara/$(project)

stop:
	- docker container stop $(shell docker ps -q)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

bootstrap:
	iaguara alpine build
	iaguara git build
	iaguara docker build
	iaguara base build
	iaguara base run

clean: stop
	- docker container rm -f $(shell docker ps -aq --filter=name=iaguara)
	- docker image rm -f $(shell docker images -q --filter=dangling=true)
	- docker image rm -f $(shell docker images -q "iaguara/*")

ls:
	@echo
	@docker images "iaguara/*"
	@echo
	@docker ps -a --filter=name=iaguara
	@echo
	@echo

network:
	- docker network create \
		--driver bridge \
		--subnet 172.66.1.0/24 \
		--gateway 172.66.1.254 \
		iaguara

dns: network
	- docker run -d --rm \
		--name dns.iaguara \
		--network iaguara \
		--ip 172.66.1.1 \
		--cap-add=NET_ADMIN \
		andyshinn/dnsmasq:2.78 \
		--cache-size=0 --no-negcache \
		--neg-ttl=0 --max-ttl=0 \
		--server=8.8.8.8 --server=8.8.4.4

dataVol:
	- docker create \
		--name data-vol.iaguara \
		-v $(IA_DATA):/data \
		tianon/true

homeVol:
	- docker create \
		--name home-vol.iaguara \
		-v $(HOST_HOME):/oka \
		tianon/true

tmpVol:
	- docker create \
		--name tmp-vol.iaguara \
		-v /tmp:/tmp \
		tianon/true

allVol: dataVol homeVol tmpVol

run: allVol dns
	docker run -it --rm --privileged \
		--name $(containerName) \
		--network iaguara \
		--ip 172.66.1.2 \
		-h iaguara \
		-p 2200:22 \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--volumes-from data-vol.iaguara \
		--volumes-from home-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		-e HOST_HOME \
		-e IA_UID \
		-e IA_GID \
		-e IA_DOCKER_GID \
		-e COLUMNS \
		-e LINES \
		$(imageName) \
		$(RUN_COMMAND) $(GITHUB_USERS)

start:
	RUN_COMMAND=start $(MAKE) run
