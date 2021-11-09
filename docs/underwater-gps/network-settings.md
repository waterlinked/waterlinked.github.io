# Network Settings

## WiFi

The local Underwater GPS WiFi is configured as:

|            |               |
| ---------- | :------------ |
| Mode     : | Access Point  |
| SSID     : | UnderwaterGPS |
| Password : | waterlinked   |
| Security : | WPA2-Personal | 

Once connected to the UnderwaterGPS WiFi the GUI is available on: [http://192.168.7.1/](http://192.168.7.1/)

## Ethernet

At power-up, the Master-D1 reads the IP switch settings. The ethernet network mode depends on the switch position.

| Network mode             | Direction            | IP switch position |
| ------------------------ | :------------------- | :------------------- |
| Configurable             | UP                   | ![](../img/IP_switch_configurable.png) |
| Static IP 192.168.2.94   | DOWN                 | ![](../img/IP_switch_static_192.png) |


!!! note
    The host computer connected to the topside unit needs to have an IP-address on the same subnet as set on the Master-D1.
    For example: If the IP address of the UGPS is 192.168.2.94 the host computer needs to be configured to a different 192.168.2.x address e.g. 192.168.2.100.