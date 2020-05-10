#!/bin/bash

set -exo pipefail

wget -O- "https://ftp.gnu.org/gnu/glibc/glibc-${GLIBC_VER}.tar.gz" | tar -xz -C /

"/glibc-${GLIBC_VER}/configure" \
    --prefix="$PREFIX_DIR" \
    --libdir="${PREFIX_DIR}/lib" \
    --libexecdir="${PREFIX_DIR}/lib" \
    --enable-multi-arch \
    --enable-stack-protector=strong
make -j$(nproc)
make install

find "$PREFIX_DIR" -exec sh -c 'file "{}" | grep -q ELF && strip --strip-debug "{}"' \;
tar --dereference --hard-dereference -zc -f "glibc-bin-${GLIBC_VER}.tar.gz" "$PREFIX_DIR"