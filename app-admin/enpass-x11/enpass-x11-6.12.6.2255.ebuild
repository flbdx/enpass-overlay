# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

MY_PN="enpass"
DESCRIPTION="A cross-platform, complete password management solution."
HOMEPAGE="https://www.enpass.io"
SRC_URI="https://apt.enpass.io/pool/main/e/${MY_PN}/${MY_PN}_${PV}_amd64.deb"

LICENSE="SINEW-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
# Distribution is restricted by the legal notice
RESTRICT="bindist mirror"

DEPEND="!app-admin/enpass"
RDEPEND="
	app-arch/xz-utils
	dev-libs/glib:2
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/libglvnd
	net-libs/libpsl
	net-misc/curl
	sys-apps/dbus
	sys-apps/util-linux
	sys-libs/zlib
	sys-process/lsof
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libXScrnSaver
	x11-libs/pango
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-wm"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /opt/enpass
	doins -r opt/enpass/.
	fperms +x /opt/enpass/Enpass
	fperms +x /opt/enpass/importer_enpass
	fperms +x /opt/enpass/wifisyncserver_bin
	dosym ../../opt/enpass/Enpass /usr/bin/Enpass

	insinto /usr/share/mime/packages
	doins usr/share/mime/packages/application-enpass.xml

	domenu usr/share/applications/enpass.desktop

	gzip -d usr/share/doc/enpass/changelog.gz
	dodoc usr/share/doc/enpass/changelog

	local size
	for size in 16 22 24 32 48 ; do
		doicon -c status -s ${size} usr/share/icons/hicolor/${size}x${size}/status/enpass-status.png
		doicon -c status -s ${size} usr/share/icons/hicolor/${size}x${size}/status/enpass-status-dark.png
	done
	for size in 16 24 32 48 64 96 128 256; do
		doicon -s ${size} usr/share/icons/hicolor/${size}x${size}/apps/enpass.png
	done
}
