#!/bin/bash
cd `dirname $0`
cd pkgcache
make PACARG="--noedit --noconfirm" dirs symlink dbclear pkgclear dbupdate base base-devel bootloader packages.both store
cd ..
sudo ./overlay.sh
sudo ./rebuild.sh $@
