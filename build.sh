#!/bin/sh -xe

for f in *.adb; do
    gnatmake $f;
done;
