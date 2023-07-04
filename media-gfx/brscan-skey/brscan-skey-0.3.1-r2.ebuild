# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm

DESCRIPTION="Brother scan key tool"
HOMEPAGE="http://brother.com"
SRC_URI="amd64? ( https://download.brother.com/welcome/dlf006650/${P}-2.x86_64.rpm )
			x86? ( https://download.brother.com/welcome/dlf006649/${P}-2.i386.rpm )"

LICENSE="" # Brother EULA
SLOT="0"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}

src_install() {
	cp -r * "${D}" || die "installing data failed"
	dosym opt/brother/scanner/brscan-skey/brscan-skey usr/bin/brscan-skey
}
