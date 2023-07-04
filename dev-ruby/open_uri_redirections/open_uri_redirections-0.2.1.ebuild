# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby26 ruby27 ruby30 ruby31"
RUBY_FAKEGEM_EXTRADOC="LICENSE.txt README.md"

inherit ruby-fakegem

DESCRIPTION="OpenURI patch to allow redirections between HTTP and HTTPS"
HOMEPAGE="https://github.com/open-uri-redirections/open_uri_redirections"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"

ruby_add_bdepend "dev-ruby/rake dev-ruby/rspec dev-ruby/fakeweb"
