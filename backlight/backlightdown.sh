#!/bin/bash

CURRENTBRIGHT=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
MAXBRIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)
BRIGHTSTEPS=$(expr $MAXBRIGHT / 20)

echo $(expr $CURRENTBRIGHT - $BRIGHTSTEPS) > /sys/class/backlight/intel_backlight/brightness

echo - > /sys/class/backlight/intel_backlight/brightness
