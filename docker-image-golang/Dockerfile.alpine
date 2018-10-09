FROM golang:alpine

COPY ./packages /

RUN apk add -U git \
    && go get -u $(cat /packages)
