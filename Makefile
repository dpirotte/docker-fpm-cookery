VERSIONS = wheezy jessie stretch trusty xenial

default: build

dockerfiles: $(addprefix dockerfile-,$(VERSIONS))

dockerfile-%:
	mkdir -p $* && sed "s/%%VERSION%%/$*/" Dockerfile.template > $*/Dockerfile

build: $(addprefix build-,$(VERSIONS))

build-%:
	docker build -t dpirotte/fpm-cookery:$* $*
