# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="retire your mouse. "
HOMEPAGE="https://www.semicomplete.com/projects/keynav/"
EGIT_REPO_URI="https://github.com/jordansissel/keynav.git"

LICENSE="BSD"
SLOT="0"

DEPEND="x11-misc/xdotool x11-libs/libXinerama x11-base/xorg-server"
RDEPEND="${DEPEND}"
BDEPEND="dev-libs/glib"
