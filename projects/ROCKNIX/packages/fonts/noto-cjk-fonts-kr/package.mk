# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="noto-cjk-fonts-kr"
PKG_VERSION="523d033d6cb47f4a80c58a35753646f5c3608a78"
PKG_LICENSE="OFL-1.1"
PKG_SITE="https://github.com/notofonts/noto-cjk"
PKG_URL="${PKG_SITE}/raw/${PKG_VERSION}/Sans/OTF/Korean/NotoSansCJKkr-Regular.otf"
PKG_SHA256="6bcb2a0703aa137e874fc2dffa85f6c21ba9a67fa329e81b8c801663af7e992a"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Noto Sans CJK KR, the font RetroArch uses for its Korean menu"
# The url is a bare font file, so there is no archive name to take the source
# name from. Pin it, the unpack and install steps below refer to it by name.
PKG_SOURCE_NAME="NotoSansCJKkr-Regular.otf"
PKG_TOOLCHAIN="manual"

# Only the complete Regular weight is fetched. The variable TTF in the same
# release is no use here: its default instance is Thin and RetroArch does not
# set a variation axis.
unpack() {
  mkdir -p ${PKG_BUILD}
  cp ${SOURCES}/${PKG_NAME}/${PKG_SOURCE_NAME} ${PKG_BUILD}/
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/fonts/truetype/noto
  cp ${PKG_BUILD}/NotoSansCJKkr-Regular.otf ${INSTALL}/usr/share/fonts/truetype/noto/
  mkdir -p ${INSTALL}/usr/share/licenses/${PKG_NAME}
  cp ${PKG_DIR}/LICENCE ${INSTALL}/usr/share/licenses/${PKG_NAME}/
}
