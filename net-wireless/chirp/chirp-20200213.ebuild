# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1 xdg-utils ${SCM}

DESCRIPTION="Free open-source tool for programming your amateur radio"
HOMEPAGE="http://chirp.danplanet.com"

RESTRICT="test"
if [[ ${PV} == "99999999" ]] ; then
	inherit mercurial
	EHG_REPO_URI="http://d-rats.com/hg/chirp.hg"
	KEYWORDS=""
else
	#python3 brach: http://d-rats.com/hg/hgwebdir.cgi/chirp.hg/shortlog/68534f20c141
	HASH_COMMIT="68534f20c141"
#	SRC_URI="http://trac.${PN}.danplanet.com/${PN}_daily/daily-${PV}/${PN}-daily-${PV}.tar.gz"
	SRC_URI="http://d-rats.com/hg/hgwebdir.cgi/chirp.hg/archive/${HASH_COMMIT}.tar.gz -> ${P}.tar.gz"

#python3 branch is broken
#	KEYWORDS="~amd64 ~x86"

	S="${WORKDIR}/${PN}-hg-${HASH_COMMIT}"
fi
LICENSE="GPL-3"
SLOT="0"
IUSE="radioreference"

DEPEND="${PYTHON_DEPS}
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-libs/libxml2[python]
	dev-python/suds[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	radioreference? ( dev-python/suds[${PYTHON_USEDEP}] )"

src_prepare() {
	sed -i -e "/share\/doc\/chirp/d" setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	pushd tests > /dev/null
	"${PYTHON}" run_tests || die
	popd > /dev/null
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
