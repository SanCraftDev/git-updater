FROM alpine:3.17.2
RUN apk upgrade --no-cache && \
    apk add --no-cache ca-certificates wget tzdata git && \
    git config --global --add safe.directory /src

ENV GIT_DIR=/src/.git
WORKDIR /src
ENTRYPOINT while true; do (git fetch origin && git reset --hard origin && sleep 30) || exit 1; done || exit 1
HEALTHCHECK CMD (git fetch origin && git reset --hard origin) || exit 1
