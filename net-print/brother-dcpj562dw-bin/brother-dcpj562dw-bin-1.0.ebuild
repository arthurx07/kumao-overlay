# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm

DESCRIPTION="Driver for the Brother DCP-J562DW wifi multifunctional printer"
HOMEPAGE="https://www.brother.es/"
SRC_URI="https://download.brother.com/welcome/dlf102102/dcpj562dwcupswrapper-1.0.0-0.i386.rpm
			https://download.brother.com/welcome/dlf102101/dcpj562dwlpr-1.0.0-0.i386.rpm"
# original script: https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.3-1.gz

LICENSE="" # Brother EULA
SLOT="0"
KEYWORDS="~amd64"
IUSE="+scanner"

DEPEND="
	net-print/cups
	scanner? ( media-gfx/brscan4 media-gfx/brscan-skey )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	keepdir /var/spool/lpd
	cp -r "${S}"/* "${D}/" || die
	dodir usr/share/cups/model/Brother/
	cp "${D}/opt/brother/Printers/dcpj562dw/cupswrapper/brother_dcpj562dw_printer_en.ppd" \
		"${D}/usr/share/cups/model/Brother/"

	# keepdir $D/usr/lib64/cups/filter
	# cp $S/usr/lib64/cups/filter/brother_lpdwrapper_dcpj562dw $D/usr/libexec/cups/filter/
}

pkg_postinst() {
	elog "Run as root to install printer:"
	elog "lpadmin -p DCPJ562DW -E -v usb:/dev/usb/lp0 -P /usr/share/cups/model/Brother/brother_dcpj562dw_printer_en.ppd && lpadmin -p DCPJ562DW -v socket://<IP address> -E"
	elog "Configure scanner using one of the following commands:"
	elog "- using hostname:   brsaneconfig4 -a name=DCP-J562DW model=DCP-J562DW nodename=<hostname>"
	elog "- using IP address: brsaneconfig4 -a name=DCP-J562DW model=DCP-J562DW ip=<IP address>"
}
