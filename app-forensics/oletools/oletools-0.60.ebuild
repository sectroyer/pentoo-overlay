# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="A python tools to analyze MS OLE2 files and MS Office documents"
HOMEPAGE="https://github.com/decalage2/oletools"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

KEYWORDS="amd64 ~arm64 x86"
LICENSE="GPL-2 BSD-2 MIT"
SLOT="0"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
	dev-python/pyparsing[${PYTHON_USEDEP}]
	>=dev-python/olefile-0.46[${PYTHON_USEDEP}]
	dev-python/easygui[${PYTHON_USEDEP}]
	dev-python/colorclass[${PYTHON_USEDEP}]
	dev-python/msoffcrypto-tool[${PYTHON_USEDEP}]
	dev-python/pcodedmp[${PYTHON_USEDEP}]
"

RESTRICT="test"
