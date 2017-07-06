CUDAVER=cuda
ifneq ("$(ROLLOPTS)", "$(subst cuda=,,$(ROLLOPTS))")
  CUDAVER = $(subst cuda=,,$(filter cuda=%,$(ROLLOPTS)))
endif

NAME       = sdsc-magma-roll-test
VERSION    = 1
RELEASE    = 0
PKGROOT    = /root/rolltests

RPM.EXTRAS = AutoReq:No
