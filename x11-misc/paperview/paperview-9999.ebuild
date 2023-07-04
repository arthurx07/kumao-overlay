# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A high performance X11 animated wallpaper setter"
HOMEPAGE="https://github.com/glouw/paperview"
EGIT_REPO_URI="https://github.com/glouw/${PN}.git"

LICENSE="MIT"
SLOT="0"

DEPEND="media-libs/libsdl2"
RDEPEND="${DEPEND}"

pkg_postinst() {
	elog "Known Issues: Picom, Compton (and possibly other compositors) seem to already write to the base root X11 window which may overwrite the render done by paperview."
}
