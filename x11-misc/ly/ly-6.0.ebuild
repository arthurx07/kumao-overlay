# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="display manager with console UI"
HOMEPAGE="https://github.com/nullgemm/ly"
EGIT_REPO_URI="https://github.com/fairyglade/${PN}.git"
EGIT_COMMIT="1c2be475ad09af18e632609c779d508e7fb866f9"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="+openrc runit systemd"

DEPEND="sys-libs/pam
		x11-libs/libxcb
		x11-base/xorg-server
		x11-apps/xauth
		sys-apps/util-linux
		sys-libs/ncurses"
RDEPEND="${DEPEND}
		openrc? ( sys-apps/openrc )
		runit? ( sys-process/runit )
		systemd? ( sys-apps/systemd )"

src_install(){
	default
	use openrc && emake DESTDIR="${D}" install installopenrc
	use runit && emake DESTDIR="${D}" install installrunit
	use systemd && emake DESTDIR="${D}" install installsystemd
}
