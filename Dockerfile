FROM golang:1.11.1-alpine3.8
MAINTAINER vincent wuwenxiong@shoplazza.com
COPY / /opt
WORKDIR /opt
RUN go build

FROM alpine:3.8
COPY --from=0 /opt/gitlab-ci-build-on-merge-request .
CMD ["/gitlab-ci-build-on-merge-request"]

EXPOSE 8080
