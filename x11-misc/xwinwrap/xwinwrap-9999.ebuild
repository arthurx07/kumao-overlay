# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="X11 Window in desktop enviroment background"
HOMEPAGE="https://github.com/mmhobi7/xwinwrap"
EGIT_REPO_URI="https://github.com/mmhobi7/${PN}.git"

LICENSE="HPND"
SLOT="0"

DEPEND="
	x11-base/xorg-server
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrender
	x11-base/xorg-proto
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/local//' Makefile
	default
}
