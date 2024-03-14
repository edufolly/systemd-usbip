# Systemd unit for automounting usb devices over usbip

This is shamelessly ripped from 
[furbrain systemd-usbip](https://github.com/furbrain/systemd-usbip)

## Installation

To install the systemd unit, run `sudo make install` in the source
directory, which will place the support scripts into `/usr/bin` and the
systemd unit into `/etc/systemd/system`.

## Service `usbipd`

```shell
sudo systemctl daemon-reload
```

To enable the usbipd at boot, run:

```shell
sudo systemctl enable usbipd
```

To start immediately:

```shell
sudo systemctl start usbipd
```

## Configuration

Create one or files in `/etc/usbip-devices` named `<device_name>.conf`.
These files **must** contain the following configuration keys:

- `USB_IDVENDOR` -- Vendor ID.
- `USB_IDPRODUCT` -- Product ID.

For example, to share a device with vendor:product 2357:012d, create a file
called `/etc/usbip-devices/wifi.conf`

```
USB_IDVENDOR=2357
USB_IDPRODUCT=012d
```

To enable the device at boot, run:

```shell
sudo systemctl enable usbip-device@wifi
```

To share the device immediately:

```shell
sudo systemctl start usbip-device@wifi
```

To stop sharing it:

```shell
sudo systemctl stop usbip-device@wifi
```
