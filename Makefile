build_image:
	@echo "building docker image...."
	docker build -t hello-world-gin .
	@echo "done"

up_build: build_image
	@echo "stopping and removing containers"
	docker stop $$(docker ps -a -q) && docker container rm $$(docker ps -aq) || echo "continue"
	@echo "done"
	@echo "starting image"
	docker run --name hello-gin -d -p 8080:8080 hello-world-gin
	@echo "done"

deletecontainers:
	docker stop $$(docker ps -a -q) && docker container rm $$(docker ps -aq) || echo "continue"