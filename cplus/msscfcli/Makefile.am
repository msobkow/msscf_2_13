MAJOR_VERSION=2

MINOR_VERSION=13

BUILD_NUMBER=11182

RELEASE=$(MAJOR_VERSION).$(MINOR_VERSION).$(BUILD_NUMBER)

SUB_RELEASE=$(MAJOR_VERSION).$(MINOR_VERSION)

MAIN_RELEASE=$(MAJOR_VERSION)

DEPDIR=debug

LT_OBJDIR=.libs

BIN=$(prefix)/bin/msobkow/$(MAJOR_VERSION).0.$(MINOR_VERSION)

bindir=$(prefix)/bin/msobkow/$(MAJOR_VERSION).0.$(MINOR_VERSION)

bin_PROGRAMS = msscfcli

msscfcli_SOURCES = msscfcli.cpp

msscfcli_LDFLAGS= -l:libcfbamcustmsscf.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfbamcustxmlloader.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfbammsscf.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfbamram.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfbamsaxloader.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfbam.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfintsaxloader.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfint.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfsecsaxloader.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfsec.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcfcore.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -l:libcflib.so.$(MAJOR_VERSION).0.$(MINOR_VERSION) -lmpfr -lxerces-c -luuid -lstdc++fs

msscfcli_CXXFLAGS= -I$(top_srcdir) -I$(prefix)/include/msobkow/$(MAJOR_VERSION).0.$(MINOR_VERSION) -I$(prefix)/include/msobkow/$(MAJOR_VERSION).0.$(MINOR_VERSION)

ACLOCAL_AMFLAGS= -Im4
