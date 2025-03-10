# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Utility functions for OsmocomBB, OpenBSC and related projects"
HOMEPAGE="http://bb.osmocom.org/trac/wiki/libosmocore"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.osmocom.org/${PN}.git"
	KEYWORDS=""
else
#	SRC_URI="http://cgit.osmocom.org/cgit/libosmocore/snapshot/${P}.tar.bz2"
	SRC_URI="https://github.com/osmocom/libosmocore/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-2 LGPL-3"
SLOT="0"
IUSE="pcsc-lite"

RDEPEND="virtual/libusb:1
	net-misc/lksctp-tools
	sys-libs/talloc
	pcsc-lite? ( sys-apps/pcsc-lite )"

DEPEND="${RDEPEND}
	app-doc/doxygen
"

PATCHES=( "${FILESDIR}/${PN}-0.6.0-automake-1.13.patch" )

src_prepare() {
	default_src_prepare
	# set correct version in pkgconfig files
	sed -i "s/UNKNOWN/${PV}/" git-version-gen || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable pcsc-lite pcsc)
}
