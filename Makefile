PREFIX = /usr/local
FORTUNES = $(shell find /usr -type d -regex '.*fortunes?' -print -quit)

mao.dat:
	strfile mao

.PHONY: install
install: mao.dat
	sudo install -m 644 mao mao.dat $(FORTUNES)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	sudo install -m 755 maotd $(DESTDIR)$(PREFIX)/bin

.PHONY: uninstall
	rm -f $(FORTUNES)/mao*
	rm -f $(DESTDIR)$(PREFIX)/bin/maotd

.PHONY: clean
clean: mao.dat
	rm mao.dat
