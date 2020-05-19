#!/bin/bash

cd /compile/source/linux-rpi

for i in `cat /compile/doc/rpi/misc.64b/options/docker-options-mod.txt`; do
  echo $i
  ./scripts/config -m $i
done

for i in `cat /compile/doc/rpi/misc.64b/options/docker-options-yes.txt`; do
  echo $i
  ./scripts/config -e $i
done