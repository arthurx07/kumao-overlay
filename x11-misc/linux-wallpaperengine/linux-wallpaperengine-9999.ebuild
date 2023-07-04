# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="An attempt to make wallpaper engine wallpapers compatible with Linux"
HOMEPAGE="https://github.com/Almamu/linux-wallpaperengine"
EGIT_REPO_URI="https://github.com/Almamu/${PN}.git"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	>=virtual/opengl-2.1
	app-arch/lz4
	sys-libs/zlib
	media-libs/libsdl
	media-video/ffmpeg
	x11-base/xorg-server
	x11-libs/libXxf86vm
	x11-apps/xrandr
	>=media-libs/glfw-3
	media-libs/glm
	media-libs/glew
	media-libs/freeglut
	media-libs/freeimage
	media-video/mpv
	media-libs/libpulse
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cmake_src_install
	mv "${D}"/usr/bin/{linux-wallpaperengine,wallengine} || die
}

pkg_postinst() {
	elog "Move assets directory to /usr/share/${PN}/assets"
}
