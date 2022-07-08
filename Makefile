.POSIX:

PREFIX = /usr/local
CC = gcc

dwmblocks: dwmblocks.o
	$(CC) dwmblocks.o -lX11 -o dwmblocks
dwmblocks.o: dwmblocks.c config.h
	$(CC) -c dwmblocks.c
clean:
	rm -f *.o *.gch dwmblocks
	rm -rf /home/$(SUDO_USER)/.local/bin/statusbar
install: dwmblocks
	mkdir -p $(DESTDIR)$(PREFIX)/bin 
	cp -f dwmblocks $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dwmblocks
	cp -r scripts /home/$(SUDO_USER)/.local/bin/statusbar
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks
	rm -rf /home/$(SUDO_USER)/.local/bin/statusbar 

.PHONY: clean install uninstall
