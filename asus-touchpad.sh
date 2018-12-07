#!/bin/sh
[ -f /usr/share/acpi-support/state-funcs ] || exit 0 

. /usr/share/acpi-support/power-funcs

getXconsole

getTouchDeviceId()
{
    # extract the device id for the supplied touch device name
    xinput list | sed -nr "s|.*$1.*id=([0-9]+).*|\1|p"
}

ENABLEPROP="Device Enabled"
# Get the xinput device number and enabling property for the touchpad
XINPUTNUM=$(getTouchDeviceId "PS/2 Elantech Touchpad")

# if we failed to get an input, exit
[ -z "$XINPUTNUM" ] && exit 1

# get the current state of the touchpad
TPSTATUS=$(xinput list-props $XINPUTNUM | awk "/$ENABLEPROP/ { print \$NF }")

# if getting the status failed, exit
[ -z "$TPSTATUS" ] && exit 1

if [ $TPSTATUS = 0 ]; then
   xinput set-int-prop $XINPUTNUM "$ENABLEPROP" 8 1
else
   xinput set-int-prop $XINPUTNUM "$ENABLEPROP" 8 0
fi
