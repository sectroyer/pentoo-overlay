# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby26 ruby27"

inherit ruby-fakegem

DESCRIPTION="Adds Grape style patterns to Mustermman"
HOMEPAGE="https://github.com/ruby-grape/mustermann-grape"

KEYWORDS="amd64 ~arm64 ~x86"
LICENSE="MIT"
SLOT="0"

ruby_add_rdepend "
	>=dev-ruby/mustermann-1.0.0
"
