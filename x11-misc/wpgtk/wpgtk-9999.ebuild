# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..12} )

inherit git-r3 distutils-r1

DESCRIPTION="A colorscheme, wallpaper and template manager for *nix"
HOMEPAGE="https://github.com/deviantfero/wpgtk"
EGIT_REPO_URI="https://github.com/deviantfero/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
IUSE="+livereload"

RDEPEND="
	|| ( media-gfx/feh x11-misc/nitrogen x11-misc/hsetroot )
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	x11-misc/pywal
	livereload? ( x11-misc/xsettingsd )
	"
DEPEND="${RDEPEND}"

pkg_postinst() {
	elog "Install x11-themes/gtk-engines-murrine for a better looking gtk+ theme"
	ewarn "Installs configuration to /usr/etc by default, doesn't follow FHS standards"
}
