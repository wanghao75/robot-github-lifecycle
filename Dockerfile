FROM golang:1.16.3 as BUILDER

MAINTAINER zengchen1024<chenzeng765@gmail.com>

# build binary
WORKDIR /go/src/github.com/opensourceways/robot-github-lifecycle
COPY . .
RUN GO111MODULE=on CGO_ENABLED=0 go build -a -o robot-github-lifecycle .

# copy binary config and utils
FROM alpine:3.14
COPY  --from=BUILDER /go/src/github.com/opensourceways/robot-github-lifecycle/robot-github-lifecycle /opt/app/robot-github-lifecycle

ENTRYPOINT ["/opt/app/robot-github-label"]
