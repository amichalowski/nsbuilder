#!/bin/bash

./scripts/set-version.sh
qmake
make clean
make

if [ $? -eq 0 ]; then
	rm -rf release
	mkdir release
	cp nsbuilder nsbuilder_pl.qm release/
	cp release nsbuilder1-`cat SVN_VERSION_FILE`-linux64-bin
	zip pack/nsbuilder1-`cat SVN_VERSION_FILE`-linux64-bin.zip release/*
fi