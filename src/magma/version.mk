ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

CUDAVERSION=cuda
ifneq ("$(ROLLOPTS)", "$(subst cuda=,,$(ROLLOPTS))")
  CUDAVERSION = $(subst cuda=,,$(filter cuda=%,$(ROLLOPTS)))
endif

NAME           = sdsc-magma_$(COMPILERNAME)
VERSION        = 2.2.0
RELEASE        = 0
PKGROOT        = /opt/magma/$(COMPILERNAME)

SRC_SUBDIR     = magma

SOURCE_NAME    = magma
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
