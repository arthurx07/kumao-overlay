# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Flameshot interface to dmenu"
HOMEPAGE="https://codeberg.org/mehrad/dmenu_shot"
EGIT_REPO_URI="https://codeberg.org/mehrad/dmenu_shot.git"

LICENSE="WTFPL-2"
SLOT="0"

DEPEND="media-gfx/flameshot x11-misc/dmenu media-gfx/imagemagick x11-misc/xclip x11-misc/xdotool dev-build/make app-shells/bash"
RDEPEND="${DEPEND}"

src_test() {
	make check
}

src_install() {
	newbin dmenu_shot.sh dshot
	dodoc README.md
}
