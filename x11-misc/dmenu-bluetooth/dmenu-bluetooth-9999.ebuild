# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Bluetoothctl interface to dmenu"
HOMEPAGE="https://github.com/Layerex/dmenu-bluetooth"
EGIT_REPO_URI="https://github.com/Layerex/${PN}.git"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="x11-misc/dmenu net-wireless/bluez"
DEPEND="${RDEPEND}"

src_install() {
	newbin dmenu-bluetooth dbluetooth
	dodoc README.md
}
