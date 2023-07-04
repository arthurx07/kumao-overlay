# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{4..12} )

inherit git-r3 distutils-r1 desktop

DESCRIPTION="Open multi-site list manager for Unix-like systems."
HOMEPAGE="https://github.com/z411/trackma"
EGIT_REPO_URI="https://github.com/z411/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="+ncurses cli gtk inotify qt5 +mpv"
REQUIRED_USE="|| ( cli gtk ncurses qt5 )"

DEPEND="ncurses? ( dev-python/urwid )
		gtk? (
		dev-python/pygobject
		dev-python/pydbus
		dev-python/pycairo
		dev-python/pillow
		)
		qt5? (
		dev-python/PyQt5[gui,widgets]
		dev-python/pillow
		)"
RDEPEND="sys-process/lsof
			inotify? ( || ( dev-python/pyinotify ) )
			mpv? ( mpv-plugin/mpv-mpris dev-python/dbus-python )
			${DEPEND}"
BDEPEND="dev-python/setuptools"

python_configure_all() {
	if ! use qt5; then
		sed -i -e '/trackma-qt/d' "${S}/pyproject.toml" || die
		rm -R "${S}/trackma/ui/qt" || die
	fi
	if ! use gtk; then
		sed -i -e '/trackma-gtk/d' "${S}/pyproject.toml" || die
		rm -R "${S}/trackma/ui/gtk" || die
	fi
	if ! use ncurses; then
		sed -i -e '/trackma-curses/d' "${S}/pyproject.toml" || die
		rm "${S}/trackma/ui/curses.py" || die
	fi
	if ! use cli; then
		sed -i -e '/trackma.ui.cli:main/d' "${S}/pyproject.toml" || die
		rm "${S}/trackma/ui/cli.py" || die
	fi
}

python_install_all() {
	distutils-r1_python_install_all
	newicon "${S}/trackma/data/icon.png" trackma.png
	use cli && make_desktop_entry "${PN}" "${PN^} (cli)" "${PN}" "Network" "Terminal=true"
	use ncurses && make_desktop_entry "${PN}-curses" "${PN^} (ncurses)" "${PN}" "Network" "Terminal=true"
	use gtk && make_desktop_entry "${PN}-gtk" "${PN^} (gtk3)" "${PN}" "Network" "StartupWMClass=trackma-gtk3"
	use qt5 && make_desktop_entry "${PN}-qt" "${PN^} (qt5)" "${PN}" "Network" "StartupWMClass=trackma-qt5"
}

pkg_postinst() {
	elog "For more features copy trackma/hooks into your $XDG_CONFIG_HOME/trackma/hooks. Optionally install dev-python/pypresence for discord rich presence."
}
