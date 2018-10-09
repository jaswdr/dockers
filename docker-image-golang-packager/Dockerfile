FROM golang

RUN apt-get update -y \
    && apt-get install -y \
     zip \
     git \
     gcc-arm-linux-gnueabi \
     gcc-mingw-w64-i686

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
