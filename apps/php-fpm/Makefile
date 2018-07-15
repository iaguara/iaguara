project = php-fpm
containerName = $(project).iaguara
imageName = $(project)
rootfs = ${HOST_IA_HOME}/projects/$(project)/rootfs

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

volume:
	- docker create \
			--name www-html.iaguara \
			-v ${HOST_HOME}/workspace/www/html:/var/www/html \
			tianon/true

run: volume
	docker run -d --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v /tmp:/tmp \
		-v $(rootfs)/usr/local/etc/php/conf.d/custom.ini:/usr/local/etc/php/conf.d/custom.ini \
		--volumes-from data.iaguara \
		--volumes-from www-html.iaguara \
		$(imageName) \
		$(RUN_COMMAND)
