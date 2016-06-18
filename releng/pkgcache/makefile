FETCH=PACMAN=pacaur PKGDEST=$(shell pwd)/pkg pacaur --foreign -Sw
STORE=repo-add pkg/cache.db.tar.gz pkg/*


base:
	$(FETCH) base
	$(STORE)
base-devel:
	$(FETCH) base-devel
	$(STORE)
packages.both:
	$(FETCH) $$(cat ../packages.both)
	$(STORE)
packages.i686:
	$(FETCH) $$(cat ../packages.i686)
	$(STORE)
packages.x86_64:
	$(FETCH) $$(cat ../packages.x86_64)
	$(STORE)
packages.video:
	$(FETCH) $$(cat ../packages.video)
	$(STORE)
