# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig

DESCRIPTION="This program provides a scroll back buffer for a terminal like st."
HOMEPAGE="https://tools.suckless.org/scroll/"
SRC_URI="https://dl.suckless.org/tools/${P}.tar.gz"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="savedconfig"

PATCHES=( "${FILESDIR}/${P}-typo.patch" )

src_prepare() {
	default
	restore_config config.h
}

src_install() {
	dobin scroll
	dodoc README
	save_config config.h
}
