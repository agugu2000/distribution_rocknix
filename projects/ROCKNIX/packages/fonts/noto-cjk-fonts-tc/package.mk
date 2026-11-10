# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="noto-cjk-fonts-tc"
PKG_VERSION="523d033d6cb47f4a80c58a35753646f5c3608a78"
PKG_LICENSE="OFL-1.1"
PKG_SITE="https://github.com/notofonts/noto-cjk"
PKG_URL="${PKG_SITE}/raw/${PKG_VERSION}/Sans/OTF/TraditionalChinese/NotoSansCJKtc-Regular.otf"
PKG_SHA256="dce08bd4fd91aa8aa76ed8fea4b694c2dfb8550f67871e326843212ddbeb88b4"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Noto Sans CJK TC, the font RetroArch uses for its traditional Chinese menu"
# The url is a bare font file, so there is no archive name to take the source
# name from. Pin it, the unpack and install steps below refer to it by name.
PKG_SOURCE_NAME="NotoSansCJKtc-Regular.otf"
PKG_TOOLCHAIN="manual"

# Only the complete Regular weight is fetched. The variable TTF in the same
# release is not used: its default instance is Thin and RetroArch does not set
# a variation axis, so the text would come out far lighter than everything
# around it.
unpack() {
  mkdir -p ${PKG_BUILD}
  cp ${SOURCES}/${PKG_NAME}/${PKG_SOURCE_NAME} ${PKG_BUILD}/
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/fonts/truetype/noto
  cp ${PKG_BUILD}/NotoSansCJKtc-Regular.otf ${INSTALL}/usr/share/fonts/truetype/noto/
  mkdir -p ${INSTALL}/usr/share/licenses/${PKG_NAME}
  cp ${PKG_DIR}/LICENCE ${INSTALL}/usr/share/licenses/${PKG_NAME}/
}
