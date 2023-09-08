# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Warning! This package disables network-sandbox when emerging.
# yarn connects to internet on: install (to download dependencies) and build (to download electron)

EAPI=8

DESCRIPTION="Manga reader and library manager for the desktop"
HOMEPAGE="https://houdoku.org/"
SRC_URI="https://github.com/xgi/houdoku/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

BDEPEND="sys-apps/yarn"

src_unpack(){
	default
	cd "${S}"/; yarn install || die "Yarn module installation failed"
}

src_compile(){
	yarn build || die "Build failed"
	"${S}"/node_modules/.bin/electron-builder build --linux --x64 --publish never || die "Bundling failed"
}

src_install() {
	insinto opt/"${PN}"
	doins -r release/linux-unpacked/.
	chmod 755 "${D}/opt/${PN}/${PN}" || die
	dosym "${EPREFIX}/opt/${PN}/${PN}" "${EPREFIX}/usr/bin/${PN}"
	dodoc README.md
}

pkg_postinst() {
	ewarn "Warning! This package disables network-sandbox when emerging."
}
