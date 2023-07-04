# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A  browser-independent address  bar  with bookmark  support"
HOMEPAGE="https://efe.kim/files/scripts/dmenu_websearch"
SRC_URI="https://efe.kim/files/scripts/dmenu_websearch -> ${PN}.sh"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND="x11-misc/dmenu x11-misc/xdotool sys-apps/util-linux x11-apps/xprop x11-apps/setxkbmap sys-apps/coreutils net-misc/curl sys-apps/sed"
RDEPEND="${DEPEND}"

S=${WORKDIR}

PATCHES=(
	"${FILESDIR}/${PN}-dmenu_websearch.patch"
)

src_unpack(){
	cp "${DISTDIR}"/${PN}.sh "${WORKDIR}"/dmenu_websearch || die
}

src_install(){
	newbin dmenu_websearch dwebsearch
}
