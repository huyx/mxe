# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtpurchasing
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 7804a111043d0e8d6d81a0d0ae465ce2c36eca73f2774ccb5fa7be8670211672
$(PKG)_SUBDIR    = $(subst qtbase,qtpurchasing,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtpurchasing,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtpurchasing,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase qtdeclarative

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
