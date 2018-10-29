VERSIONS = wheezy jessie stretch buster trusty xenial bionic

IMAGE_NAME = dpirotte/fpm-cookery

default: build

dockerfiles: $(addprefix dockerfile-,$(VERSIONS))

dockerfile-%:
	mkdir -p $* && sed "s/%%VERSION%%/$*/" Dockerfile.template > $*/Dockerfile

build: $(addprefix build-,$(VERSIONS))

build-%:
	docker build -t ${IMAGE_NAME}:$* $*

TEST_TIMEOUT_SECONDS = 120

GOSS_PATH = .tmp/goss
DGOSS_PATH = .tmp/dgoss

test-%: test_deps
	@env \
		GOSS_PATH=${GOSS_PATH} \
		GOSS_VARS="goss_vars.yaml" \
		GOSS_OPTS="--color" \
		${DGOSS_PATH} run ${IMAGE_NAME}:$* sleep ${TEST_TIMEOUT_SECONDS}
test: $(addprefix test-,$(VERSIONS))

.PHONY: test_deps
test_deps: ${GOSS_PATH} ${DGOSS_PATH}

${GOSS_PATH}:
	@mkdir -p .tmp
	@curl -fsSL https://github.com/aelsabbahy/goss/releases/download/v0.3.6/goss-linux-amd64 -o ${GOSS_PATH}
	@chmod +rx ${GOSS_PATH}

${DGOSS_PATH}:
	@mkdir -p .tmp
	@curl -fsSL https://raw.githubusercontent.com/aelsabbahy/goss/v0.3.6/extras/dgoss/dgoss -o ${DGOSS_PATH}
	@chmod +rx ${DGOSS_PATH}

