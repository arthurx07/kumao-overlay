# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="ncurses countdown timer based on xorg62's tty-clock"
HOMEPAGE="https://github.com/mbarbar/ttytimer"
EGIT_REPO_URI="https://github.com/mbarbar/ttytimer"

LICENSE="" # project doesn't has any license
SLOT="0"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_compile() {
	make ttytimer TOOT=no
}

src_install(){
	newbin ttytimer tty-timer
	dodoc README.md
}
