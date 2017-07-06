PACKAGE     = magma
CATEGORY    = applications

ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

MODULE_LOAD_LAMMPS_CUDA = $(call MODULE_LOAD_PACKAGE, $(CUDAVERSION), CUDAHOME)
DESCRIBE_LAMMPS_CUDA = echo built with cuda $(call GET_MODULE_VERSION, $(CUDAVERSION))


CUDAVER=cuda
ifneq ("$(ROLLOPTS)", "$(subst cuda=,,$(ROLLOPTS))")
  CUDAVER = $(subst cuda=,,$(filter cuda=%,$(ROLLOPTS)))
endif

NAME        = sdsc-$(PACKAGE)_$(COMPILERNAME)-modules


NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
