# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DISTUTILS_USE_SETUPTOOLS=bdepend
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="A scanner that helps identifying issues in Drupal, SilverStripe, and Wordpress"
HOMEPAGE="https://github.com/droope/droopescan"
KEYWORDS="~amd64 ~x86"
SRC_URI="https://github.com/droope/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="=dev-python/cement-2*[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pystache[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		dev-python/mock
		dev-python/nose
		dev-python/responses
		dev-python/lxml
		dev-python/beautifulsoup4
		dev-python/coverage
		dev-python/wheel
		dev-python/retrying
	)"
