#!/bin/sh
mkdir -p airootfs/etc/skel
cp -rvT $@ /etc/skel airootfs/etc/skel
