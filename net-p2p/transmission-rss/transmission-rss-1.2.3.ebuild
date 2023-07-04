# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby26 ruby27 ruby30 ruby31"
RUBY_FAKEGEM_EXTRADOC="README.md $PN.conf.example"

inherit ruby-fakegem

DESCRIPTION="Adds torrents from RSS feeds to Transmission web frontend"
HOMEPAGE="https://github.com/nning/transmission-rss"

LICENSE="GPL-3"
KEYWORDS="amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "dev-ruby/rss dev-ruby/rb-inotify dev-ruby/open_uri_redirections"
