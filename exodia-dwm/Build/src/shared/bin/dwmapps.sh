#!/usr/bin/env bash

## Launch Applications

if [[ "$1" == "--file" ]]; then
	thunar
elif [[ "$1" == "--editor" ]]; then
	geany
elif [[ "$1" == "--web" ]]; then
	firefox
fi
