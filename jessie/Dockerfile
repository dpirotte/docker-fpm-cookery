FROM buildpack-deps:jessie

RUN apt-get -yqq update

RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
  ruby \
  ruby-dev \
  unzip \
  ;

RUN gem install fpm fpm-cookery --no-rdoc --no-ri

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
