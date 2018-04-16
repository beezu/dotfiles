#!/bin/bash

sudo tee -a /etc/systemd/hddled.service << EOF
[Unit]
After=network.service

[Service]
ExecStart=/usr/local/bin/hddled.sh

[Install]
WantedBy=default.target
EOF

sudo tee -a /usr/local/bin/hddled.sh << EOF
#!/bin/bash

# Check interval seconds
CHECKINTERVAL=0.2

# console
CONSOLE=/dev/console

#indicator to use [caps, num, scroll]
INDICATOR=caps

getVmstat() {
    cat /proc/vmstat|egrep "pgpgin|pgpgout"  
}
#turn led on
function led_on()
{
    setleds -L +${INDICATOR} < ${CONSOLE}
}
#turn led off
function led_off()
{
    setleds -L -${INDICATOR} < ${CONSOLE}
}
# initialise variables
NEW=$(getVmstat)
OLD=$(getVmstat)
## 
while [ 1 ] ; do
  sleep $CHECKINTERVAL # slowdown a bit
  # get status 
  NEW=$(getVmstat)
   #compare  state
  if [ "$NEW" = "$OLD" ]; then  
    led_off ## no change, led off
  else
    led_on  ## change, led on
  fi
  OLD=$NEW  
done
EOF

sudo chmod 744 /usr/local/bin/hddled.sh
sudo chmod 664 /etc/systemd/system/hddled.service
systemctl daemon-reload
systemctl enable hddled.service
systemctl start hddled.service
