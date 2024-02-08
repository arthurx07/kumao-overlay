# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg
MY_PV="mainline-${PV/./-}"
CPP_HTTPLIB_SHA="a609330e4c6374f741d3b369269f7848255e1954" # required for cpp-httplib CMakeLists.txt
DISCORD_RPC_SHA="20cc99aeffa08a4834f156b6ab49ed68618cf94a"
_DYNARMIC_SHA="ca0e264f4f962e29baa23a3282ce484625866b98" # "dyn" is a reserved prefix
MBEDTLS_SHA="8c88150ca139e06aa2aae8349df8292a88148ea1"
NX_TZDB_VERSION="221202"
SIMPLEINI_SHA="382ddbb4b92c0b26aa1b32cefba2002119a5b1f2" # required for simpleini CMakeLists.txt
SIRIT_SHA="ab75463999f4f3291976b079d42d52ee91eebf3f"
# CPP_JWT_SHA="10ef5735d842b31025f1257ae78899f50a40fb14"
# SDL_SHA="031912c4b6c5db80b443f04aa56fec3e4e645153"

DESCRIPTION="Nintendo Switch emulator"
HOMEPAGE="https://yuzu-emu.org/ https://github.com/yuzu-emu/yuzu-mainline"
SRC_URI="https://github.com/yuzu-emu/yuzu-mainline/archive/${MY_PV}.tar.gz -> ${P}.tar.gz
	https://github.com/yhirose/cpp-httplib/archive/${CPP_HTTPLIB_SHA}.tar.gz \
		-> ${PN}-cpp-httplib-${CPP_HTTPLIB_SHA:0:7}.tar.gz
	https://github.com/yuzu-emu/discord-rpc/archive/${DISCORD_RPC_SHA}.tar.gz \
		-> ${PN}-discord-rrpc-${DISCORD_RPC_SHA}.tar.gz
	https://github.com/MerryMage/dynarmic/archive/${_DYNARMIC_SHA}.tar.gz -> ${PN}-dynarmic-${_DYNARMIC_SHA:0:7}.tar.gz
	https://github.com/yuzu-emu/mbedtls/archive/${MBEDTLS_SHA}.tar.gz -> ${PN}-mbedtls-${MBEDTLS_SHA:0:7}.tar.gz
	https://github.com/lat9nq/tzdb_to_nx/archive/${NX_TZDB_VERSION}/${NX_TZDB_VERSION}.zip \
		-> ${PN}-nx_tzdb-${NX_TZDB_VERSION}.zip
	https://github.com/brofield/simpleini/archive/${SIMPLEINI_SHA}.tar.gz \
		-> ${PN}-simpleini-${SIMPLEINI_SHA}.tar.gz
	https://github.com/yuzu-emu/sirit/archive/${SIRIT_SHA}.tar.gz -> ${PN}-sirit-${SIRIT_SHA:0:7}.tar.gz"
	# https://github.com/arun11299/cpp-jwt/archive/${CPP_JWT_SHA}.tar.gz -> ${PN}-cpp-jwt-${CPP_JWT_SHA:0:7}.tar.gz
	# https://github.com/libsdl-org/SDL/archive/${SDL_SHA}.tar.gz -> ${PN}-sdl-${SDL_SHA:0:7}.tar.gz

LICENSE="BSD GPL-2 GPL-2+ LGPL-2.1" # || ( Apache-2.0 GPL-2+) 0BSD GPL-2+ ISC MIT
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="compatibility-reporting +webservice +cubeb +qt5 sdl webengine vaapi +discord"
REQUIRED_USE="|| ( qt5 sdl ) compatibility-reporting? ( webservice ) "

DEPEND="
	>=dev-libs/xbyak-6.03:=
	dev-libs/vulkan-memory-allocator:=
	>=dev-util/vulkan-utility-libraries-1.3.274:=
	>=app-arch/zstd-1.5.0
	>=dev-libs/inih-52
	>=dev-libs/libfmt-9.1.0:=
	>=dev-libs/openssl-1.1.1:=
	>=media-video/ffmpeg-4.3:=
	>=net-libs/enet-1.3:=
	app-arch/lz4:=
	>=dev-libs/boost-1.79.0:=[context]
	>=media-libs/opus-1.3
	>=sys-libs/zlib-1.2
	|| ( sys-libs/libunwind sys-libs/llvm-libunwind )
	virtual/libusb:=
	cubeb? ( media-libs/cubeb )
	qt5? (
		>=dev-qt/qtcore-5.15:5
		>=dev-qt/qtdbus-5.15:5
		>=dev-qt/qtgui-5.15:5
		>=dev-qt/qtmultimedia-5.15:5
		>=dev-qt/qtwidgets-5.15:5
	)
	webengine? ( >=dev-qt/qtwebengine-5.15:5 )
	webservice? ( >=dev-cpp/cpp-httplib-0.12 >=dev-cpp/cpp-jwt-1.4 )
	discord? ( >=dev-cpp/cpp-httplib-0.12 )
	vaapi? ( media-libs/libva )
	sdl? ( >=media-libs/libsdl2-2.26.4 )
	" # dev-libs/libzip (?)
RDEPEND="${DEPEND}
	>=media-libs/vulkan-loader-1.3.274
"
BDEPEND="
	app-arch/unzip
	>=dev-cpp/nlohmann_json-3.8.0
	dev-cpp/robin-map
	dev-util/glslang
	>=dev-util/vulkan-headers-1.3.274
	dev-util/spirv-headers
"

S="${WORKDIR}/${PN}-mainline-${MY_PV}"

PATCHES=(
	"${FILESDIR}/${PN}-6858-disable-collecttoolinginfo.patch"
)

# pkg_setup() {
# 	wget -t 1 --timeout=15 -O "${T}/compatibility_list.json" https://api.yuzu-emu.org/gamedb/ ||
# 		rm -f "${T}/compatibility_list.json"
# }

src_prepare() {
	rm .gitmodules || die
	rmdir "${S}/externals/"{dynarmic,mbedtls,sirit,cpp-httplib,SDL,discord-rpc,simpleini} || die # cpp-jwt,cpp-httplib,SDL
	mv "${WORKDIR}/dynarmic-${_DYNARMIC_SHA}" "${S}/externals/dynarmic" || die
	mv "${WORKDIR}/sirit-${SIRIT_SHA}" "${S}/externals/sirit" || die
	if use webservice; then
		mv "${WORKDIR}/cpp-httplib-${CPP_HTTPLIB_SHA}" "${S}/externals/cpp-httplib" || die
	fi
	if use discord; then
		sed -e ''
		mv "${WORKDIR}/cpp-httplib-${CPP_HTTPLIB_SHA}" "${S}/externals/cpp-httplib" || die
		mv "${WORKDIR}/discord-rpc-${DISCORD_RPC_SHA}" "${S}/externals/discord-rpc"
	fi
	# mv "${WORKDIR}/SDL-${SDL_SHA}" "${S}/externals/SDL" || die
	# mv "${WORKDIR}/cpp-jwt-${CPP_JWT_SHA}" "${S}/externals/cpp-jwt" || die
	mv "${WORKDIR}/mbedtls-${MBEDTLS_SHA}" "${S}/externals/mbedtls" || die
	mv "${WORKDIR}/simpleini-${SIMPLEINI_SHA}" "${S}/externals/simpleini" || die
	mkdir -p "${S}_build/externals/nx_tzdb" || die
	cp "${DISTDIR}/${PN}-nx_tzdb-${NX_TZDB_VERSION}.zip" \
		"${S}_build/externals/nx_tzdb/${NX_TZDB_VERSION}.zip" || die
	mv "${WORKDIR}/zoneinfo" "${S}_build/externals/nx_tzdb/nx_tzdb/" || die

	sed -e 's/find_package(Boost .*/find_package(Boost 1.71 COMPONENTS context REQUIRED)/' \
		-i src/common/CMakeLists.txt || die
	sed -e '/enable_testing.*/d' \
		-e 's/add_subdirectory(externals\/SPIRV-Headers.*/find_package(SPIRV-Headers REQUIRED)/' \
		-i externals/sirit/CMakeLists.txt || die
	sed -e '/-Werror=missing-declarations/d' -i src/CMakeLists.txt || die
	sed -e '/-Werror=unused/d' -i src/CMakeLists.txt || die # clang-16, 03, LTO failed on 2023-09-09
	sed -e '/-Werror=all/d' -i src/CMakeLists.txt || die # clang-16, 03, LTO failed on 2023-09-09
	sed -re 's/(find_package\(Vulkan ).*/\1)/' \
		-e 's/VulkanMemoryAllocator/VulkanMemoryAllocator REQUIRED/' -i CMakeLists.txt || die
	sed -re 's/set\(CAN_BUILD_NX_TZDB.*/set(CAN_BUILD_NX_TZDB false)/' \
		-i externals/nx_tzdb/CMakeLists.txt || die

	sed -e '/httplib::httplib/d' -i src/yuzu/CMakeLists.txt || die ## maybe httplib::httplib is not needed with discord-rpc, maybe yes :)

	cmake_src_prepare

	# mkdir -p "${BUILD_DIR}/dist/compatibility_list" || die
	# if ! [ -f "${T}/compatibility_list.json" ]; then
	# 	einfo 'Using fallback compatibility list'
	# 	gunzip < "${FILESDIR}/${PN}-fallback-compat.json.gz" > "${T}/compatibility_list.json" || die
	# fi
	# mv -f "${T}/compatibility_list.json" \ "${BUILD_DIR}/dist/compatibility_list/compatibility_list.json" || die # don't know why it fails
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_FULLNAME="${MY_PV}"
		# Libraries are private and rely on circular dependency resolution. (?)
		-DBUILD_SHARED_LIBS=OFF # dynarmic (?)
		-DENABLE_COMPATIBILITY_LIST_DOWNLOAD=OFF
		"-DENABLE_CUBEB=$(usex cubeb)"
		"-DENABLE_WEB_SERVICE=$(usex webservice)"
		"-DENABLE_SDL2=$(usex sdl)"
		-DGIT_BRANCH="${PN}"
		-DGIT_DESC="${PV}"
		-DGIT_REV="${PV}"
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON
		"-DUSE_DISCORD_PRESENCE=$(usex discord)"
		-DYUZU_DOWNLOAD_TIME_ZONE_DATA=OFF
		"-DYUZU_ENABLE_COMPATIBILITY_REPORTING=$(usex compatibility-reporting)"
		-DYUZU_TESTS=OFF
		-DYUZU_USE_EXTERNAL_SDL2=OFF # previously set as ON
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF
		-DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF
		-DYUZU_USE_QT_MULTIMEDIA=OFF
		"-DYUZU_USE_QT_WEB_ENGINE=$(usex webengine)"
		-DYUZU_USE_FASTER_LD=OFF
		# Added from previous ebuild
		-DENABLE_LIBUSB=ON
		"-DENABLE_QT=$(usex qt5)"
		"-DENABLE_QT_TRANSLATION=$(usex qt5)"
		-Wno-dev
	)

	cmake_src_configure
}
