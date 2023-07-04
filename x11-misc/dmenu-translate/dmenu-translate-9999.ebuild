# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Quick text translation with dmenu"
HOMEPAGE="https://github.com/NikitaIvanovV/dmenu-translate"
EGIT_REPO_URI="https://github.com/NikitaIvanovV/${PN}.git"

LICENSE="MIT"
SLOT="0"

DEPEND="x11-misc/dmenu app-i18n/translate-shell x11-misc/xclip x11-libs/libnotify"
RDEPEND="${DEPEND}"

src_install() {
	newbin dmenu-translate dtranslate
	dodoc README.md LICENSE
}
