# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="Pulseaudio command line mixer"
HOMEPAGE="https://github.com/cdemoulins/pamixer"
EGIT_REPO_URI="https://github.com/cdemoulins/${PN}.git"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="media-libs/libpulse"
DEPEND="${RDEPEND}"
BDEPEND="dev-libs/cxxopts"
