# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

MY_COMMIT="c314193cc9de483142a65d81ee1517a703bd1851"

DESCRIPTION="Information gathering tool designed for extracting metadata of public documents"
HOMEPAGE="https://github.com/enjoy-digital/litex"
SRC_URI="https://github.com/enjoy-digital/litex/archive/${MY_COMMIT}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

RDEPEND="dev-python/pyserial"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${PN}-${MY_COMMIT}
