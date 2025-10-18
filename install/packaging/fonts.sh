#!/bin/bash

mkdir -p ~/.local/share/fonts
cp ~/.local/share/moonarch/config/moonarch.ttf ~/.local/share/fonts/
fc-cache
