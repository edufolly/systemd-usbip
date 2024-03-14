#!/bin/sh
BUS_ID=`/usr/bin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
for bus in $BUS_ID
do
  /usr/bin/usbip unbind --$bus
done
