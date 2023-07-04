# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="Pure Python TFTP library"
HOMEPAGE="
	https://github.com/msoulier/tftpy
	https://pypi.org/project/tftpy/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-lang/python-exec[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

src_compile(){
	python setup.py build
}

src_test(){
	make test PY=python
}

src_install(){
	python setup.py install --root="$D" -O1 --skip-build
	mv "$D/usr/bin/tftpy_client"{.py,}
	mv "$D/usr/bin/tftpy_server"{.py,}
	dodoc LICENSE README
}
