VERSIONS = wheezy jessie stretch trusty xenial

default: images

dockerfiles: $(addprefix dockerfile-,$(VERSIONS))

dockerfile-%:
	mkdir -p $* && sed "s/%%VERSION%%/$*/" Dockerfile.template > $*/Dockerfile

images: $(addprefix debian-,$(VERSIONS))

debian-%:
	docker build -t dpirotte/fpm-cookery:$* $*
