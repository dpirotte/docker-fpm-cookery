FROM buildpack-deps:bionic

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  bundler \
  ruby \
  ruby-dev \
  unzip \
&& rm -rf /var/lib/apt/lists/*

RUN gem install fpm fpm-cookery --no-rdoc --no-ri
