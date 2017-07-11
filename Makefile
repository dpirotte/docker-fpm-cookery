DEBIAN_VERSIONS = wheezy jessie stretch

default: images

dockerfiles: $(addprefix dockerfile-,$(DEBIAN_VERSIONS))

dockerfile-%:
	sed "s/%%VERSION%%/$*/" Dockerfile.template > $*/Dockerfile

images: $(addprefix debian-,$(DEBIAN_VERSIONS))

debian-%:
	docker build -t dpirotte/fpm-cookery:$* $*
