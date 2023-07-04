# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Symbols-only fonts from nerd fonts"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/raw/v${PV}/10-nerd-font-symbols.conf -> ${P}-10-nerd-font-symbols.conf
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/NerdFontsSymbolsOnly.tar.xz \
		-> ${P}-NerdFontsSymbolsOnly.tar.xz"

LICENSE="CC-BY-4.0 MIT OFL-1.1 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
FONT_CONF=( "${S}/10-nerd-font-symbols.conf" )

src_unpack() {
	cp "${DISTDIR}/${P}-10-nerd-font-symbols.conf" "${S}/10-nerd-font-symbols.conf" || die
	default
}

pkg_postinst() {
	elog "Enable 10-nerd-font-symbols.conf with eselect fontconfig"
}
