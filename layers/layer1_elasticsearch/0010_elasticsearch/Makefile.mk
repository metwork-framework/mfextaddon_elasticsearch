include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=elasticsearch
export VERSION=8.18.1
export EXTENSION=tar.gz
export CHECKTYPE=MD5
export CHECKSUM=6711a4cd1385902912a636f2b824bcdd
DESCRIPTION=\
Elasticsearch is a distributed, RESTful search and analytics engine
WEBSITE=https://www.elastic.co/products/elasticsearch
LICENSE=Apache

#elasticsearch is a wrapper (available in PATH) on the true elasticsearch (not available in PATH)

all:: $(PREFIX)/opt/elasticsearch/bin/elasticsearch
$(PREFIX)/opt/elasticsearch/bin/elasticsearch:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) download uncompress
	rm -Rf $(PREFIX)/opt/elasticsearch
	mkdir -p $(PREFIX)/opt
	cd build && cp -Rf $(NAME)-$(VERSION) $(PREFIX)/opt/elasticsearch
	mkdir -p $(PREFIX)/bin
	cp elasticsearch $(PREFIX)/bin
	#Remove jdk and modules/x-pack-ml for a lighter rpm
	rm -rf $(PREFIX)/opt/elasticsearch/jdk
	rm -rf $(PREFIX)/opt/elasticsearch/modules/x-pack-ml
