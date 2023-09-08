# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module optfeature

DESCRIPTION="Command-line tool to customize Spotify client"
HOMEPAGE="https://spicetify.app"
SRC_URI="https://github.com/spicetify/spicetify-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://github.com/arthurx07/kumao-overlay/raw/main/media-sound/${PN}/${P}-deps.tar.xz"

LICENSE="LGPL-2.1 MIT Apache-2.0 BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=media-sound/spotify-1.2.8"
RDEPEND="${DEPEND}"

src_compile() {
	ego build -ldflags="-X 'main.version=${PV}'" -o spicetify
}

src_install() {
	insinto usr/share/${PN}/
	doins -r {CustomApps,Extensions,Themes,jsHelper,css-map.json,globals.d.ts,spicetify}
	dodoc README.md

	dosym usr/share/${PN}/spicetify usr/bin/spicetify
}

pkg_postinst() {
	optfeature "Comfy theme" media-sound/spicetify-comfy
	optfeature "Spicetify marketplace" media-sound/spicetify-marketplace-bin
	optfeature "Spotify stats" media-sound/spicetify-stats-bin
}
