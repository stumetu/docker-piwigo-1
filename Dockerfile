FROM debian:bullseye-slim

LABEL MAINTAINER="Mathieu Ruellan <mathieu.ruellan@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

ARG PIWIGO_VERSION="13.6.0"

RUN apt update -y \
     && apt install -yy \
            apache2 \
            libapache2-mod-php \
            php-gd \
            php-curl \
            php-mysql \
            php-mbstring \
            php-xml \
            php-imagick \
            dcraw \
            mediainfo \
            ffmpeg\
            imagemagick \
            wget \
            unzip \
            exiftool \
     && php_version=$(php -r 'echo phpversion();') \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN php -v > php_version.txt
    cat ./php_version.txt
EXPOSE 80
