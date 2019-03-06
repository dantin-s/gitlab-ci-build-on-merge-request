FROM golang:1.11.1-alpine3.8
MAINTAINER vincent wuwenxiong@shoplazza.com
COPY / /opt
WORKDIR /opt
RUN go build -o /opt/gitlab-ci-build-on-merge-request

FROM alpine:3.8
COPY --from=0 /opt/gitlab-ci-build-on-merge-request .
RUN echo "http://mirrors.aliyun.com/alpine/v3.8/main" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.8/community" >> /etc/apk/repositories
RUN apk add --no-cache curl
CMD ["/gitlab-ci-build-on-merge-request"]

EXPOSE 8080
