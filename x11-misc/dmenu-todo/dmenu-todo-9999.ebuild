# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="dmenu interface to add/remove todos in a simple text file"
HOMEPAGE="https://github.com/aliceh75/todo-dmenu"
EGIT_REPO_URI="https://github.com/aliceh75/todo-dmenu.git"

LICENSE=""
SLOT="0"

DEPEND="x11-misc/dmenu sys-apps/sed sys-apps/gawk sys-apps/grep"
RDEPEND="${DEPEND}"

src_install() {
	newbin todo-dmenu todo
	dodoc README.md
}
