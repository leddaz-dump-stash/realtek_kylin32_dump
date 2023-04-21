#!/system/bin/sh

# This script will setup a simple HID keyboard gadget via ConfigFS.
# In order to use it, you must have kernel >= 3.19 and configfs enabled
# when the kernel was compiled (it usually is).

# variables and strings
MANUFACTURER="FlatFrog"                                           #  manufacturer attribute
SERIAL="0"                                                        #  device serial number
IDPRODUCT="0x0047"                                                #  hex product ID, issued by USB Group
IDVENDOR="0x25b5"                                                 #  hex vendor ID, assigned by USB Group
PRODUCT="PS-TK75P-20P1-M3-0047"                                   #  cleartext product description
CONFIG_NAME="FlatFrog touch screen"                               #  name of this configuration
MAX_POWER_MA=120                                                  #  max power this configuration can consume in mA
PROTOCOL=2                                                        #  2 for mouse. see usb spec
SUBCLASS=0                                                        #  it seems either 1 or 0 works, dunno why
REPORT_LENGTH=36                                                  #  number of bytes per report
DESCRIPTOR=/system/etc/report_descriptor                          #  binary blob of report descriptor, see HID class spec
UDC="98020000.dwc3_drd"                                           #  name of the UDC driver to use (found in /sys/class/udc/)   

# Mouse report descriptor
REPORT_LENGTH1=6
DESCRIPTOR1=/system/etc/report_descriptor1

cd /config/usb_gadget/g1/
echo $IDPRODUCT > idProduct
echo $IDVENDOR > idVendor
echo $SERIAL > strings/0x409/serialnumber
echo $MANUFACTURER > strings/0x409/manufacturer
echo $PRODUCT > strings/0x409/product

echo $CONFIG_NAME > configs/b.1/strings/0x409/configuration

## Create touch screen function
mkdir -p functions/hid.usb0
echo $PROTOCOL > functions/hid.usb0/protocol
echo $SUBCLASS > functions/hid.usb0/subclass
cat  $DESCRIPTOR > functions/hid.usb0/report_desc
echo $REPORT_LENGTH > functions/hid.usb0/report_length
ln -s functions/hid.usb0 configs/b.1

## Create mouse function
mkdir -p functions/hid.usb1
echo $PROTOCOL > functions/hid.usb1/protocol
echo $SUBCLASS > functions/hid.usb1/subclass
cat  $DESCRIPTOR1 > functions/hid.usb1/report_desc
echo $REPORT_LENGTH1 > functions/hid.usb1/report_length
ln -s functions/hid.usb1 configs/b.1

## Enabling the gadget
echo $UDC > UDC
