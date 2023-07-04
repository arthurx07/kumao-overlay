# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby26 ruby27 ruby30 ruby31"
RUBY_FAKEGEM_EXTRADOC="LICENSE.txt README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Ruby test helper for injecting fake responses to web requests"
HOMEPAGE="https://github.com/chrisk/fakeweb"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"

ruby_add_bdepend "dev-ruby/mocha"
