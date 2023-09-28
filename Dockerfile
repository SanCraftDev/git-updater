FROM alpine:3.18.4
RUN apk add --no-cache ca-certificates tzdata tini git && \
    git config --global --add safe.directory /src

WORKDIR /src
ENV GIT_DIR=/src/.git
ENTRYPOINT ["tini", "--", "sh", "-c", "while true; do (find /src/.git -name *.lock -delete && git fetch origin && git reset --hard origin && sleep 30) || exit 1; done || exit 1"]
HEALTHCHECK CMD (rm -rf /src/.git/index.lock && git fetch origin > /dev/null 2>&1 && git reset --hard origin > /dev/null 2>&1) || exit 1
