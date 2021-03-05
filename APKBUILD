# Maintainer: Triptixx <triptixx@loxoo.net>

repo="glibc-apk"
pkgname="glibc"
pkgver="$GLIBC_VER"
pkgrel="0"
pkgdesc="GNU C Library compatibility layer"
arch="x86_64"
options="!check"
url="https://github.com/triptixx/glibc-apk"
license="LGPL"
source="glibc-bin-${pkgver}.tar.gz
nsswitch.conf
ld.so.conf"
subpackages="${pkgname}-bin ${pkgname}-dev ${pkgname}-i18n:i18n:noarch"
triggers="${pkgname}-bin.trigger=/lib:/usr/lib:${PREFIX_DIR}/lib"

package() {
    mkdir -p "${pkgdir}/lib" "${pkgdir}/lib64" "${pkgdir}/etc" \
        "${pkgdir}${PREFIX_DIR}/lib/locale"

    cp -a "${srcdir}/usr" "$pkgdir"
    cp "${srcdir}/ld.so.conf" "${pkgdir}${PREFIX_DIR}/etc/ld.so.conf"
    cp "${srcdir}/nsswitch.conf" "${pkgdir}/etc/nsswitch.conf"

    rm -rf "${pkgdir}${PREFIX_DIR}/etc/rpc" "${pkgdir}${PREFIX_DIR}/bin" "${pkgdir}${PREFIX_DIR}/sbin" \
        "${pkgdir}${PREFIX_DIR}/lib/gconv" "${pkgdir}${PREFIX_DIR}/lib/getconf" "${pkgdir}${PREFIX_DIR}/lib/audit" \
        "${pkgdir}${PREFIX_DIR}/share" "${pkgdir}${PREFIX_DIR}/var" "${pkgdir}${PREFIX_DIR}/lib/ld-linux-x86-64.so.2"

    ln -s "${PREFIX_DIR}/lib/ld-${pkgver}.so" "${pkgdir}${PREFIX_DIR}/lib/ld-linux-x86-64.so.2"
    ln -s "${PREFIX_DIR}/lib/ld-linux-x86-64.so.2" "${pkgdir}/lib/ld-linux-x86-64.so.2"
    ln -s "${PREFIX_DIR}/etc/ld.so.cache" "${pkgdir}/etc/ld.so.cache"
}

bin() {
    depends="$pkgname libgcc"

    mkdir -p "${subpkgdir}${PREFIX_DIR}"

    cp -a "${srcdir}${PREFIX_DIR}/bin" "${subpkgdir}${PREFIX_DIR}"
    cp -a "${srcdir}${PREFIX_DIR}/sbin" "${subpkgdir}${PREFIX_DIR}"
}

i18n() {
    depends="${pkgname}-bin"

    mkdir -p "${subpkgdir}${PREFIX_DIR}"

    cp -a "${srcdir}${PREFIX_DIR}/share" "${subpkgdir}${PREFIX_DIR}"
}
