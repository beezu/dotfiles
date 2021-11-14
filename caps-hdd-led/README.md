# Caps Lock LED - HDD Activity Indicator
This is a simple way to make your caps lock key's LED indicator into a hard drive activity light. If you like to disable caps lock on a built in laptop keyboard, this can serve as a good use of that LED. You can execute it manually when you want it, or you can set it up as a service in systemd.

This has been tested in Ubuntu and Arch, you may have to tweak things for other distros though.

If you would like to change the check interval (currently set to every 0.2 seconds), edit the file "hddled.sh" and change the `CHECKINTERVAL` value to suit your needs. You can also tweak the `INDICATOR` variable if you would like to use a different LED, such as Numlock or Scroll lock.

#Usage
The file "capsled.sh" will perform the full setup for you if you want this to run as a systemd service, on startup. cd to this "caps-hdd-led" directory after cloning, then run `sh capsled.sh` to install. The command will ask for sudo access when needed, and will put everything in the proper places, with the proper permissions, and will enable the service to run on boot for you.
