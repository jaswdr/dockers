.PHONY : golang alpine

VENDOR=jaschweder
PROJECT=golang
DOCKER=docker

all : golang alpine

golang :
	$(DOCKER) build --pull -t $(VENDOR)/$(PROJECT):latest .

alpine :
	$(DOCKER) build --pull -t $(VENDOR)/$(PROJECT):alpine -f Dockerfile.alpine .
