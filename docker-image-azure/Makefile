DOCKER_IMAGE="jaschweder/azure"
DOCKER_RUN=docker run \
		   -it \
		   --rm \
		   --privileged \
		   -v $(HOME)/.ssh:/root/.ssh \
		   -v $(HOME)/.azure:/root/.azure \
		   -v $(HOME)/.docker:/root/.docker \
		   -v /var/run/docker.sock:/var/run/docker.sock $(DOCKER_IMAGE)

default : build

build :
	docker build -t $(DOCKER_IMAGE) .

run :
	$(DOCKER_RUN)

sh :
	$(DOCKER_RUN) bash
