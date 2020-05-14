[actions]: https://github.com/triptixx/glibc-apk/actions
[repo]: https://github.com/triptixx/glibc-apk

# [glibc-apk][repo]
[![Build Status](https://github.com/triptixx/glibc-apk/workflows/glibc-apk/badge.svg)][actions]
[![x86_64](https://img.shields.io/badge/x86__64-supported-brightgreen.svg)][repo]

This is the [GNU C Library](https://gnu.org/software/libc/) as a Alpine Linux package to run binaries linked against `glibc`. This package utilizes a custom built glibc binary based on the vanilla glibc source.

## Releases

See the [releases page](https://github.com/triptixx/glibc-apk/releases) for the latest download links. If you are using tools like `localedef` you will need the `glibc-bin` and `glibc-i18n` packages in addition to the `glibc` package.

## Installing

The current installation method for these packages is to pull them in using `wget` or `curl` and install the local file with `apk`:

```shell
wget -q -O /etc/apk/keys/glibc-apk.rsa.pub https://github.com/triptixx/glibc-apk/blob/master/glibc-apk.rsa.pub
https://github.com/triptixx/glibc-apk/releases/download/v2.31/glibc-2.31-r0.apk
apk add glibc-2.31-r0.apk
```

## Locales

You will need to generate your locale if you would like to use a specific one for your glibc application. You can do this by installing the `glibc-i18n` package and generating a locale using the `localedef` binary. An example for en_US.UTF-8 would be:

```shell
wget https://github.com/triptixx/glibc-apk/releases/download/v2.31/glibc-bin-2.31-r0.apk
wget https://github.com/triptixx/glibc-apk/releases/download/v2.31/glibc-i18n-2.31-r0.apk
apk add glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk
/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
```
