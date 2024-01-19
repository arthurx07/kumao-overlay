# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Opensource, compact, and material-designed cursor set"
HOMEPAGE="https://github.com/ful1e5/Bibata_Cursor"
SRC_URI="https://github.com/ful1e5/Bibata_Cursor/releases/download/v${PV}/Bibata.tar.xz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+modern-ice original-ice modern-amber original-amber modern-classic original-classic"

RDEPEND="x11-libs/libXcursor"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/cursors/xorg-x11
	use modern-ice && doins -r Bibata-Modern-Ice
	use original-ice && doins -r Bibata-Original-Ice
	use modern-amber && doins -r Bibata-Modern-Amber
	use original-amber && doins -r Bibata-Original-Amber
	use modern-classic && doins -r Bibata-Modern-Classic
	use original-classic && doins -r Bibata-Original-Classic
}
