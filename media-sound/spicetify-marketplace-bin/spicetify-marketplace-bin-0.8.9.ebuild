# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="spicetify-marketplace"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Download extensions and themes directly from Spicetify"
HOMEPAGE="https://github.com/spicetify/spicetify-marketplace"
SRC_URI="https://github.com/spicetify/${MY_PN}/releases/download/v${PV}/${MY_PN}.zip -> ${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-sound/spicetify-cli"
DEPEND="${RDEPEND}"
BDEPEND="app-arch/unzip"

S="${WORKDIR}/spicetify-marketplace-dist"

src_install() {
	insinto usr/share/spicetify-cli/CustomApps/marketplace
	doins *
}
