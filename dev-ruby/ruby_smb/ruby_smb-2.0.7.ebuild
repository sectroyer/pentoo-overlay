# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="pure Ruby implementation of the SMB Protocol Family"
HOMEPAGE="https://github.com/rapid7/ruby_smb"

LICENSE="BSD"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/bindata:*
	dev-ruby/openssl-ccm
	dev-ruby/openssl-cmac
	dev-ruby/rubyntlm
	dev-ruby/windows_error"

all_ruby_prepare() {
	sed -i -e '/simple[Cc]ov/d' -e '/coveralls/d' spec/spec_helper.rb
	sed -i -e '/[Ss]imple[Cc]ov/,/end/d' \
		-e '/[Cc]overalls/,/end/d' spec/spec_helper.rb
	sed -i '/TRAVIS/d' spec/spec_helper.rb
	sed -i -e '1irequire "rubyntlm"; require "time"' spec/spec_helper.rb
}
