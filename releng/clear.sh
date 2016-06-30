#!/bin/bash
set -e
find work -exec umount -R '{}' \; | grep --invert-match -e 'not mounted$'
rm -rv work
