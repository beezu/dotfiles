#!/bin/bash

BRIGHTSTEPS=20 #number of button presses to go from min to max, must divide evenly into MAXBRIGHT
CURRENTBRIGHT=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
MAXBRIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)
BRIGHTINTERVAL=$(expr $MAXBRIGHT / $BRIGHTSTEPS)

if [ "$(expr $CURRENTBRIGHT - $BRIGHTINTERVAL)" -lt "$BRIGHTINTERVAL" ]
then
  echo $BRIGHTINTERVAL > /sys/class/backlight/intel_backlight/brightness
else
  echo $(expr $CURRENTBRIGHT - $BRIGHTINTERVAL) > /sys/class/backlight/intel_backlight/brightness
fi
