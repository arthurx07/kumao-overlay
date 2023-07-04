# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Simple and efficient CLI pomodoro timer written in C++ "
HOMEPAGE="https://github.com/aorumbayev/pomodor_cpp"
EGIT_REPO_URI="https://github.com/aorumbayev/pomodor_cpp.git"

LICENSE="MIT"
SLOT="0"

DEPEND="sys-libs/ncurses[tinfo]"
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCXX) ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -std=c++11 -lncurses -ltinfo\
		-o ${PN} pomodor_cpp/ao_tty_timer_controller.cpp || die
}

src_install(){
	dobin ${PN}
	dodoc LICENSE README.md
}
