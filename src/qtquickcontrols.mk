# This file is part of MXE.
# See index.html for further information.

PKG             := qtquickcontrols
$(PKG)_IGNORE   :=
$(PKG)_CHECKSUM := ba3ee14cfc68ee368a18505bf315fa30e52c78ad
$(PKG)_SUBDIR   := $(PKG)-opensource-src-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-opensource-src-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://download.qt-project.org/snapshots/qt/5.1/$($(PKG)_VERSION)/backups/2013-06-14-57/submodules/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc qtdeclarative

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef