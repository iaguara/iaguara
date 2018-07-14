project = mysql
containerName = $(project).iaguara
imageName = $(project):5.7
volumeName = $(project)-data.iaguara

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)
	- docker volume rm -f $(volumeName)

volume:
	- docker volume create $(volumeName)

run: volume
	docker run -d --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v /tmp:/tmp \
		-v $(volumeName):/var/lib/mysql \
		-e MYSQL_ROOT_PASSWORD=root \
		-e MYSQL_DATABASE=$(MYSQL_DATABASE) \
		-e MYSQL_USER=$(MYSQL_USER) \
		-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
		$(imageName)
