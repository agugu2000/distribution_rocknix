# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024 ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="rocknix-meta"
PKG_VERSION="0.9"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/AveyondFly/console_mod_res"
PKG_URL="https://github.com/AveyondFly/console_mod_res/releases/download/v${PKG_VERSION}/rocknix_meta.tar.gz"
PKG_DEPENDS_TARGET="toolchain ppsspp-sa drastic_adv-sa"
PKG_TOOLCHAIN="manual"
PKG_LONGDESC="Meta package for ROCKNIX custom resources."

makeinstall_target() {
  mkdir -p ${INSTALL}
  tar -xzf ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz -C ${INSTALL} --strip-components=1

  # v0.9 meta unpacks 8M Alibaba PuHuiTi 2.0 over the Inter ozone faces that
  # retroarch-assets installs. English only needs Inter, Chinese and Korean
  # come from the assets/pkg symlinks, so drop these two.
  rm -f ${INSTALL}/usr/share/retroarch-assets/ozone/regular.ttf
  rm -f ${INSTALL}/usr/share/retroarch-assets/ozone/bold.ttf

  # DejaVuSansMono.ttf and ppsspp/assets/Roboto-Condensed.ttf in the same
  # tarball are both 9668256 bytes, the same YaHei CJK face with the names
  # changed. Not mono, not Roboto, other code still opens them by name.
  cp -rf ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
  chmod +x ${INSTALL}/usr/bin/adckeys.sh ${INSTALL}/usr/bin/adckeys_new.py

  LAYOUT_URL="https://github.com/AveyondFly/console_mod_res/releases/download/v0.9/commander-baidupcs.tar.gz"
  wget -O ${PKG_BUILD}/commander-baidupcs.tar.gz "${LAYOUT_URL}"
  mkdir -p ${INSTALL}/usr/config/
  tar -xzf ${PKG_BUILD}/commander-baidupcs.tar.gz -C ${INSTALL}/usr/config/
}
