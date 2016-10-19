FROM ruby:2.3.1-slim

ENV LANG C.UTF-8

RUN apt-get update -qq && \
      apt-get install --no-install-recommends --fix-missing -y \
      build-essential \
      cmake \
      git \
      locales \
      nodejs \
      pkg-config \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN gem update --system 2.6.6
RUN gem install bundler -v '1.12.5'
