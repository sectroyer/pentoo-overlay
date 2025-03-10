# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="A Frida based tool that traces usage of the JNI API in Android apps."
HOMEPAGE="https://github.com/chame1eon/jnitrace"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="test"

RDEPEND=">=dev-python/frida-python-14.0.5[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/hexdump[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
