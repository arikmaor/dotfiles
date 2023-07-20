#!/bin/bash

if [[ -e "/dev/input/by-id/usb-Ducky_Ducky_One2_Mini_RGB_DK-V1.09-201006-event-kbd" ]]; then
    kmonad /home/arik/dotfiles/kmonad/ducky-one.kbd
fi
