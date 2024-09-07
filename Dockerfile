# syntax=docker/dockerfile:labs
FROM alpine:3.20.3
RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates tzdata tini git && \
    git config --global --add safe.directory /src

WORKDIR /src
ENV GIT_DIR=/src/.git
ENTRYPOINT ["tini", "--", "sh", "-c", "while true; do (find /src/.git -name '*.lock' -exec rm -vf {} +; git fetch origin; git reset --hard origin; sleep 30); done"]
