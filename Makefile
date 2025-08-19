DIREXTENSIONS = ~/.password-store/.extensions

all:
	@echo "make install to install"
	@echo ""
	@echo "dependencies:"
	@echo "	termux"
	@echo "	OpenKeyChain"
	@echo "	pass"

install:
	@install -v -m 0755 okc-insert.bash "$(DIREXTENSIONS)/okc-insert.bash"
	@install -v -m 0755 okc-get.bash "$(DIREXTENSIONS)/okc-get.bash"
	@install -v -m 0755 okc-id.bash "$(DIREXTENSIONS)/okc-id.bash"

uninstall:
	@rm "$(DIREXTENSIONS)/okc-insert.bash" "$(DIREXTENSIONS)/okc-get.bash" "$(DIREXTENSIONS)/okc-id.bash"

.PHONY: install uninstall
