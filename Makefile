DOCKER_REPO = dpirotte/fpm-cookery
VERSIONS = wheezy jessie stretch trusty xenial

export DOCKER_REPO

default: build

build: $(addprefix build-,$(VERSIONS))

build-%:
	env IMAGE_TAG=$* bash hooks/build
