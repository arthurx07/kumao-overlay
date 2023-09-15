# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Print selected pixel's color value in RGB."
HOMEPAGE="https://github.com/Jack12816/colorpicker"
EGIT_REPO_URI="https://github.com/Jack12816/colorpicker.git"

LICENSE=""
SLOT="0"

DEPEND="x11-libs/libXcomposite x11-libs/libX11 x11-libs/libXfixes gui-libs/gtk x11-libs/gdk-pixbuf"
RDEPEND="${DEPEND}"

src_install() {
	dobin colorpicker
}
