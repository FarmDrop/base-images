FROM ruby:2.2.4-slim

ENV LANG C.UTF-8

# Install curl and ability to install from PPAs
RUN apt-get update -qq && \
      apt-get install --no-install-recommends --fix-missing -y \
      apt-transport-https \
      build-essential \
      bzip2 \
      cmake \
      curl \
      git \
      libfreetype6 \
      libfontconfig \
      locales \
      nodejs \
      pkg-config \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN curl -sSL "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2" | \
      $(cd /usr/local/bin && tar jxf - --strip-components=2 phantomjs-1.9.7-linux-x86_64/bin/phantomjs)

# Install node 4.x from nodesource PPA
RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo 'deb https://deb.nodesource.com/node_4.x jessie main' > /etc/apt/sources.list.d/nodesource.list
RUN echo 'deb-src https://deb.nodesource.com/node_4.x jessie main' >> /etc/apt/sources.list.d/nodesource.list

RUN apt-get update -qq && \
      apt-get install --no-install-recommends --fix-missing -y \
      nodejs \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN gem update --system 2.6.10
RUN gem install bundler -v 1.13.7
RUN bundle config github.https true
