# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit git-r3 distutils-r1

DESCRIPTION="download nyaa.si torrents from the cli."
HOMEPAGE="https://github.com/arthurx07/nyaa-scraper"
EGIT_REPO_URI="https://github.com/arthurx07/${PN}.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-lang/python-exec[${PYTHON_USEDEP}] dev-python/beautifulsoup4[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

src_compile() {
	:
}

src_install() {
	dobin nyaa-scraper
	dobin nyaa-rss-show
	dodoc LICENSE README.md
}
