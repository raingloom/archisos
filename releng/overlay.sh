#!/bin/bash
mount -t overlay overlay -o upperdir=airootfs-hi,lowerdir=airootfs-lo,workdir=airootfs-wo airootfs
