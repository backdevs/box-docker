FROM php:8.1.21-cli-alpine

# This was the latest version at the time of the initial release of this image.
# To find out the latest version, please check the versions.json file.
ARG BOX_VERSION=4.3.8
ENV BOX_VERSION=${BOX_VERSION}

ARG COMPOSER_VERSION=2.5.5
ENV COMPOSER_VERSION=${COMPOSER_VERSION}

COPY docker-entrypoint.sh /docker-entrypoint.sh

COPY conf.d/box.overrides.ini ${PHP_INI_DIR}/conf.d/box-overrides.ini

RUN apk add --no-cache --virtual .runtime-deps \
      libzip-dev \
      openssl \
      curl \
      git \
      tini \
    && docker-php-ext-install \
      zip \
      bz2 \
    && docker-php-source delete \
    && curl -Lf \
      -o /usr/bin/composer \
      "https://github.com/composer/composer/releases/download/${COMPOSER_VERSION}/composer.phar" \
    && curl -Lf \
      -o /usr/bin/box \
      "https://github.com/box-project/box/releases/download/${BOX_VERSION}/box.phar" \
    && chmod +x /usr/bin/composer /usr/bin/box

WORKDIR /app

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["box"]
