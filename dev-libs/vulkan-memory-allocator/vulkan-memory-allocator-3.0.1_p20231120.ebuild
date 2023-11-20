# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake
SHA="5e43c795daf43dd09398d8307212e85025215052"

DESCRIPTION="Easy to integrate Vulkan memory allocation library"
HOMEPAGE="https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator"
SRC_URI="https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/vulkan-loader"
RDEPEND="${DEPEND}"

S="${WORKDIR}/VulkanMemoryAllocator-${SHA}"
