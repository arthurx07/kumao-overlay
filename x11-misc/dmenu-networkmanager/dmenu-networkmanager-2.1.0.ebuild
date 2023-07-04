# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..12} )
inherit desktop python-r1

DESCRIPTION="Control networkmanager via dmenu"
HOMEPAGE="https://github.com/firecat53/networkmanager-dmenu"
SRC_URI="https://github.com/firecat53/networkmanager-dmenu/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+dmenu rofi"
REQUIRED_USE="^^ ( dmenu rofi ) ${PYTHON_REQUIRED_USE}"

DEPEND="
	net-misc/networkmanager
	dmenu? ( x11-misc/dmenu )
	rofi? ( x11-misc/rofi )
	dev-python/pygobject
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/"networkmanager-dmenu"-${PV}"

src_install() {
	newbin networkmanager_dmenu dnetworkmanager
	domenu networkmanager_dmenu.desktop
	dodoc README.md config.ini.example
	elog "Now you need to configure the package."
	elog "Configuration guide: https://github.com/firecat53/networkmanager-dmenu#installation"
}
