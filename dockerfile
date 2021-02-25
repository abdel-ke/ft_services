FROM alpine:3.12.3
RUN apk update
RUN apk add nginx
RUN apk upgrade