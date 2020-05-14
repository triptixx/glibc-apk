[actions]: https://github.com/triptixx/glibc-apk/actions

# [glibc-apk]
[![Build Status](https://github.com/triptixx/glibc-apk/workflows/glibc-apk/badge.svg)][actions]
[![x86_64](https://img.shields.io/badge/x86__64-supported-brightgreen.svg)[actions]

## Usage

```shell
docker run -d \
    --name=srvfilebrowser \
    --restart=unless-stopped \
    --hostname=srvfilebrowser \
    -p 8080:8080 \
    -e ROOT_DIR=/srv \
    -v $PWD/data:/data \
    -v $PWD/srv:/srv \
    loxoo/filebrowser
```

## Environment

- `$SUID`                - User ID to run as. _default: `953`_
- `$SGID`                - Group ID to run as. _default: `900`_
- `$ROOT_DIR`            - Root to prepend to relative paths. _default: `.`_
- `$TZ`                  - Timezone. _optional_

## Volume

- `/data`                - Database path.

## Network

- `8080/tcp`             - Port to listen on.
