REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Rules.mk

$(VERSION_INC): $(VERSION_SRC)
	/bin/grep 'VERSION.*=' $(VERSION_SRC) > $@
 
build:

install:: typical-modulefile-install
	for V in $(VERSION) $(EXTRA_MODULE_VERSIONS); do \
	  perl -pi -e 's#CUDAVER#$(CUDAVER)#g;' \
	      $(ROOT)/$(PKGROOT)/$$V; \
	done

clean::
	rm -f $(VERSION_INC)
