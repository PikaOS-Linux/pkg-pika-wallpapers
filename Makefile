all:

install:
	mkdir -p $(DESTDIR)/usr/share/backgrounds/pika
	cp --no-preserve=mode,ownership -r \
		wallpapers/* \
		$(DESTDIR)/usr/share/backgrounds/pika/
	mkdir -p $(DESTDIR)/usr/share/gnome-background-properties/
	cp pika-wallpapers.xml $(DESTDIR)/usr/share/gnome-background-properties/

uninstall:
	-rm -rf $(DESTDIR)/usr/share/backgrounds/pika
	-rm -rf $(DESTDIR)/usr/share/gnome-background-properties/pika-wallpapers.xml
