DESTDIR =

prefix       = /usr
sbindir      = $(prefix)/sbin
datadir      = $(prefix)/share
pkgdatadir   = $(datadir)/tks-config

INSTALL      = install
INSTALL_DATA = $(INSTALL) -m 644

CONFFILES = \
	conf/pam_mount.conf.xml \
	conf/smb.conf \
	conf/environment
all:
install:
	$(INSTALL) -d $(DESTDIR)$(sbindir)
	for f in tks-rechner-setup home-tks-bo-cleanup tks.gdm ; do \
		$(INSTALL) $$f $(DESTDIR)$(sbindir) ; \
	done
	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)
	for conffile in $(CONFFILES) ; do \
		$(INSTALL_DATA) $$conffile $(DESTDIR)$(pkgdatadir); \
	done
	$(INSTALL) -d $(DESTDIR)/etc
	$(INSTALL) -d $(DESTDIR)/etc/systemd
	$(INSTALL_DATA) conf/logind.conf $(DESTDIR)/etc/systemd/system/systemd-logind.service.d/
	$(INSTALL) -d $(DESTDIR)/etc/systemd/system
	$(INSTALL_DATA) conf/gdm3.service $(DESTDIR)/etc/systemd/system/gdm.service.d
	$(INSTALL) -d $(DESTDIR)/usr/share/glib-2.0/schemas
	$(INSTALL_DATA) conf/99_tks.gschema.override $(DESTDIR)/usr/share/glib-2.0/schemas
clean:
	$(RM) *~ */*~
distclean: clean
