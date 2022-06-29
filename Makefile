# Makefile of printer driver
# Belfaux, July-August 2004 -- Nicolas Boichat
# Adapted from Samsung ML-85P driver by Rildo Pragana

CC=gcc
CFLAGS=-O2 -g -Wall -Wextra
RELEASE=0.1
DESTDIR=
PREFIX=/usr
BINDIR=$(PREFIX)/bin
DATADIR=$(PREFIX)/share

all: capt

capt: capt.c Makefile
	${CC} ${INCLUDE} ${CFLAGS} capt.c -o capt

install: all
	install -d $(DESTDIR)$(BINDIR)
	install -s -m a=rx capt $(DESTDIR)$(BINDIR)
	install -m a=rx capt-print $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(DATADIR)/cups/model/
	install -m a=r ppd/Canon-LBP-810-capt.ppd $(DESTDIR)$(DATADIR)/cups/model

clean:
	rm -f capt

package: clean
	rm -f *~ ppd/*~
	cp -a ../code ../capt-${RELEASE}
	tar cvfz ../capt-${RELEASE}.tar.gz ../capt-${RELEASE}
