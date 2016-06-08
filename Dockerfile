FROM farmdrop/base-images:base

RUN curl -sSL "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2" | \
      $(cd /usr/local/bin && tar jxf - --strip-components=2 phantomjs-2.1.1-linux-x86_64/bin/phantomjs)

# Install node 4.x from nodesource PPA
RUN apt-get update -qq \
      && apt-get install --no-install-recommends -y apt-transport-https \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*
RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo 'deb https://deb.nodesource.com/node_4.x jessie main' > /etc/apt/sources.list.d/nodesource.list
RUN echo 'deb-src https://deb.nodesource.com/node_4.x jessie main' >> /etc/apt/sources.list.d/nodesource.list

RUN apt-get update -qq \
      && apt-get install --no-install-recommends --fix-missing -y \
        bzip2 \
        libfreetype6 \
        libfontconfig \
        nodejs \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*
