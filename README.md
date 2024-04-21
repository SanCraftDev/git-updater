# git-updates

## How to use?

If you want to have always the newest copy of a repo (for example of a static website) on your disk you can use this compose file:

```yaml
services:
  git-repo:
    container_name: git-updater-git-repo
    image: zoeyvid/git-updater:latest
    restart: always
    network_mode: bridge
    volumes:
      - "/path/to/git-repo:/src"
    environment:
      - "TZ=Europe/Berlin"
    user: 1000:1000
```

make sure to change /path/to/git-repo and to user ids to match the correct user, you can also use root
