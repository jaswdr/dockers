FROM golang

COPY ./packages /

RUN apt-get install -y git \
    && go get -u $(cat /packages)
