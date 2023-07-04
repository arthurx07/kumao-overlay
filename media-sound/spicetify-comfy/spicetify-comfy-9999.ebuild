# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Stay comfy while listening to music"
HOMEPAGE="https://github.com/Comfy-Themes/Spicetify"
EGIT_REPO_URI="https://github.com/Comfy-Themes/Spicetify.git"

LICENSE="WTFPL-2"
SLOT="0"

RDEPEND="media-sound/spicetify-cli"
DEPEND="${RDEPEND}"

src_install() {
	insinto usr/share/spicetify-cli/Themes
	doins -r Comfy
	insinto usr/share/spicetify-cli/Extensions
	doins Comfy/{theme.js,theme.script.js}

	rm -r "${D}"/usr/share/spicetify-cli/Themes/Comfy/{theme.js,theme.script.js}
	dodoc README.md
}
