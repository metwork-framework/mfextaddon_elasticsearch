include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=elasticsearch
export VERSION=7.17.16
export EXTENSION=tar.gz
export CHECKTYPE=MD5
export CHECKSUM=4663e7224e6ef5719c1fdfe3f34db487
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
