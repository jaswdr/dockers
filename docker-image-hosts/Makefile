.PHONY: docker

DOCKER_IMAGE=jaschweder/hosts

default: docker

docker:
	docker build -t $(DOCKER_IMAGE) .

run:
	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock $(DOCKER_IMAGE)

sh:
	docker run -it --rm -v $(PWD):/hosts -v /var/run/docker.sock:/var/run/docker.sock -w /hosts $(DOCKER_IMAGE) bash
