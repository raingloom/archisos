PACARG=
ADDPKG=
PKGDEST=$(shell pwd)/pkg
REPO=archisopkgcache
PACCMD=PKGDEST='$(PKGDEST)' pacaur --dbpath='$(shell pwd)/db' --logfile=/dev/null --cachedir='$(PKGDEST)' --foreign --config='$(shell pwd)/../pacman.conf' $(PACARG)
FETCH=$(PACCMD) -Sw
STORE=repo-add 'pkg/$(REPO).db.tar.gz' $(shell find pkg -name '*.pkg.tar*')

addpkg: #for single package, use only for correcting failed downloads
	$(FETCH) $(ADDPKG)
paccmd:
	$(PACCMD)
dbupdate:
	$(PACCMD) -Syy
store:
	$(STORE)
symlink: #used pacman.conf takes global paths, so we have to symlink this to a suitable global path
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
dbclear:
	sudo rm -r db/*
pkgclear:
	rm pkg/* #this should not expand to dotfiles
dirs:
	mkdir -p pkg db
