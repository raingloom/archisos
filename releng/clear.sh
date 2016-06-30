#!/bin/bash
set -e
find work -exec umount -R '{}' \;
rm -rv work
