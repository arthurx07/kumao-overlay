# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..12} )

inherit git-r3 distutils-r1

DESCRIPTION="Generate and change color-schemes on the fly."
HOMEPAGE="https://github.com/dylanaraps/pywal"
EGIT_REPO_URI="https://github.com/dylanaraps/${PN}.git"

LICENSE="MIT"
SLOT="0"

DEPEND="
	sys-process/procps
	media-gfx/imagemagick
	|| ( media-gfx/feh x11-misc/nitrogen x11-misc/hsetroot )
	"
RDEPEND="${DEPEND}"
