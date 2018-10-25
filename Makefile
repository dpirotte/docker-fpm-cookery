VERSIONS = wheezy jessie stretch buster trusty xenial bionic

default: build

dockerfiles: $(addprefix dockerfile-,$(VERSIONS))

dockerfile-%:
	mkdir -p $* && sed "s/%%VERSION%%/$*/" Dockerfile.template > $*/Dockerfile

build: $(addprefix build-,$(VERSIONS))

build-%:
	docker build -t dpirotte/fpm-cookery:$* $*
