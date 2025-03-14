# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qt5-build

DESCRIPTION="Serial port abstraction library for the Qt5 framework"

if [[ ${QT5_BUILD_TYPE} == release ]]; then
	KEYWORDS="amd64 arm arm64 ~hppa ppc ppc64 ~riscv ~sparc x86"
fi

IUSE=""

DEPEND="
	=dev-qt/qtcore-${QT5_PV}*
	virtual/libudev:=
"
RDEPEND="${DEPEND}"

#this is an unacceptable hack due to some broken handling,
#https://bugs.gentoo.org/673532
src_prepare() {
	# make sure we link against libudev
	sed -i -e 's/:qtConfig(libudev)//' \
		-e 's/$$QMAKE_LIBS_LIBUDEV/-ludev/' \
		src/serialport/serialport-lib.pri || die

	qt5-build_src_prepare
}
