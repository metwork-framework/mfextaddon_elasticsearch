include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=elasticsearch
export VERSION=7.15.1
export EXTENSION=tar.gz
export CHECKTYPE=MD5
export CHECKSUM=b41aeeafdd2dbf61db842bc7a017dfeb
DESCRIPTION=\
Elasticsearch is a distributed, RESTful search and analytics engine
WEBSITE=https://www.elastic.co/products/elasticsearch
LICENSE=Apache

#We provide a link to ES binary in the path ($(PREFIX)/bin/elasticsearch), but it can't be used
#directly, the binary to use is $(PREFIX)/opt/elasticsearch/bin/elasticsearch
#The full path to this binary is also provided by environnement variable ES_BINARY

all:: $(PREFIX)/opt/elasticsearch/bin/elasticsearch
$(PREFIX)/opt/elasticsearch/bin/elasticsearch:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) download uncompress
	rm -Rf $(PREFIX)/opt/elasticsearch
	mkdir -p $(PREFIX)/opt
	cd build && cp -Rf $(NAME)-$(VERSION) $(PREFIX)/opt/elasticsearch
	mkdir -p $(PREFIX)/bin
	cd $(PREFIX)/bin && ln -s ../opt/elasticsearch/bin/elasticsearch elasticsearch

