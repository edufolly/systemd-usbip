bindir=/usr/bin
sysconfdir=/etc
unitdir=$(sysconfdir)/systemd/system

UNITS = \
	usbipd.service \
	usbip-device@.service

SCRIPTS = \
	configure-usbip-device.sh \
	remove-usbip-device.sh

all:

install: install-scripts install-units
	mkdir -p $(sysconfdir)/usbip-devices

install-scripts: $(SCRIPTS)
	mkdir -p $(bindir)
	for s in $(SCRIPTS); do \
		install -m 755 $$s $(bindir)/$${s%.sh}; \
	done

install-units: $(UNITS)
	mkdir -p $(unitdir)
	for u in $(UNITS); do \
		install -m 600 $$u $(unitdir); \
	done
