# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..12} )

inherit git-r3 distutils-r1

DESCRIPTION="Send and receive files between two devices, securely."
HOMEPAGE="https://github.com/arthurx07/encrypted-file-transfer"
EGIT_REPO_URI="https://github.com/arthurx07/${PN}.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-lang/python-exec[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/tftpy[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile(){
	:
}

src_install(){
	dobin alice.py bob.py
	dodoc LICENSE README.md
}
