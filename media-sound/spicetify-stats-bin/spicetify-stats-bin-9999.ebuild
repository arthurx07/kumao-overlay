# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Spicetify custom app which shows your top artists, tracks, genres."
HOMEPAGE="https://github.com/harbassan/spicetify-stats"
EGIT_REPO_URI="https://github.com/harbassan/spicetify-stats.git"
EGIT_BRANCH="dist"

LICENSE=""
SLOT="0"

DEPEND="media-sound/spicetify-cli"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/spicetify-cli/CustomApps/stats
	doins *
}
