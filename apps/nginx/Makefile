project = nginx
containerName = $(project).iaguara
imageName = $(project)
rootfs = ${HOST_IAGUARA_HOME}/projects/$(project)/rootfs

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

volume:
	- docker create \
			--name www-html.iaguara \
			-v ${HOST_HOME}/workspace/www/html:/var/www/html \
			tianon/true

run: volume
	docker run -d --rm \
		--network iaguara \
		--name $(containerName) \
		-p 80:80 \
		-h $(containerName) \
		-v /tmp:/tmp \
		-v /tmp/nginx/log:/var/log/nginx \
		-v $(rootfs)/etc/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
		--volumes-from data.iaguara \
		--volumes-from www-html.iaguara \
		$(imageName) \
		$(RUN_COMMAND)
