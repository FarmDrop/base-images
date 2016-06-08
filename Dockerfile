FROM farmdrop/base-images:base

RUN apt-get update -qq && \
      apt-get install --no-install-recommends --fix-missing -y \
      file \
      libcurl4-openssl-dev \
      libpq-dev \
      libqtwebkit-dev \
      postgresql-client \
      qt4-qmake \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*
