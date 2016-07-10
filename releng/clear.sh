#!/bin/bash
set -e
sudo find work -exec umount '{}' \; 2> /dev/null
rm -rv work
