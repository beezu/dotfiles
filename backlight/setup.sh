#!/bin/bash

#copies scripts to /usr/local/bin
sudo cp -v backlightdown.sh /usr/local/bin/
sudo cp -v backlightup.sh /usr/local/bin/

#copies acpi files to /etc/acpi/events
sudo cp -v brightdown /etc/acpi/events
sudo cp -v brightup /etc/acpi/events

#sets permissions for scripts
sudo chown root:root -Rv /usr/local/bin/backlightdown.sh
sudo chown root:root -Rv /usr/local/bin/backlightup.sh
sudo chmod 744 -Rv /usr/local/bin/backlightdown.sh
sudo chmod 744 -Rv /usr/local/bin/backlightup.sh

#sets permissions for acpi events
sudo chown root:root -Rv /etc/acpi/events/brightdown
sudo chown root:root -Rv /etc/acpi/events/brightup
sudo chmod 644 -Rv /etc/acpi/events/brightdown
sudo chmod 644 -Rv /etc/acpi/events/brightup

#restarts acpid to allow modifications to take effect
sudo systemctl restart acpid.service
