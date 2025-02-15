FROM ubuntu:22.04

WORKDIR /php

RUN apt-get update && apt-get install -y \
    pkg-config build-essential autoconf bison re2c \
    libxml2-dev libsqlite3-dev git curl wget \
    libonig-dev libcurl4-openssl-dev libreadline-dev \
    libssl-dev libzip-dev

RUN git clone https://github.com/php/php-src.git && \
    cd php-src && \
    git checkout php-8.4.0RC3 && \
    ./buildconf --force && \
    ./configure --enable-debug && \
    make -j$(nproc)
