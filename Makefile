all:

install:
	mkdir -p $(DESTDIR)/usr/share/backgrounds/pika
	cp --no-preserve=mode,ownership -r \
		wallpapers/* \
		$(DESTDIR)/usr/share/backgrounds/pika/
	pika-wallpapers.xml usr/share/gnome-background-properties/

uninstall:
	-rm -rf $(DESTDIR)/usr/share/backgrounds/pika
