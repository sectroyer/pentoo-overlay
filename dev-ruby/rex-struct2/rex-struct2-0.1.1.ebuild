# Copyright 1999-2017 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby26 ruby27"
#RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Ruby Exploitation(Rex) library for generating/manipulating C-Style structs"
HOMEPAGE="https://rubygems.org/gems/rex-struct2"

LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

# doesn't seem to actually run any tests
RESTRICT=test
