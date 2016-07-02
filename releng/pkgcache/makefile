PACARG=
PKGDEST=$(shell pwd)/pkg
REPO="archisopkgcache"
FETCH=PKGDEST=$(PKGDEST) pacaur $(PACARG) --cachedir=$(PKGDEST) --foreign -Sw
STORE=repo-add pkg/$(REPO).db.tar.gz $(shell find pkg -name '*.pkg.tar*')

store:
	$(STORE)
symlink:
	ln -svf "$(shell pwd)/pkg/" "/tmp/$(REPO)"
bootloader:
	$(FETCH) syslinux
base:
	$(FETCH) base
base-devel:
	$(FETCH) base-devel
packages.both:
	$(FETCH) $$(cat ../packages.both)
packages.i686:
	$(FETCH) $$(cat ../packages.i686)
packages.x86_64:
	$(FETCH) $$(cat ../packages.x86_64)
packages.video:
	$(FETCH) $$(cat ../packages.video)
clear:
	rm pkg/* #this should not expand to dotfiles
