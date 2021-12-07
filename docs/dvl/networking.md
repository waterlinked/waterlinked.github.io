# Networking

The DVL has several services available over ethernet:

* [Multicast DNS](#multicast-dns-mdns) (mDNS) for easy discovery
* Web [GUI](../gui/dashboard), providing a visualisation of the data outputted by the DVL, as well as configuration, [updating of software](../sw-update), diagnostics, and more.
* TCP [data stream](#tcp-data-stream)
* [Software updates](../sw-update)

## Network configuration

### Multicast DNS (mDNS)

The DVL runs a DHCP client which will attempt to obtain an IP address from a DHCP server (e.g. in a router) on the same network, and supports mDNS: the mDNS name of the DVL is `waterlinked-dvl`. On a computer which supports mDNS, one can then simply access the web [GUI](../gui/dashboard) at [http://waterlinked-dvl](http://waterlinked-dvl).

!!! note
    If no DHCP server is available on the network, it is recommended to use the [fallback IP](#fallback-ip) or  configure a [static IP address](#via-the-gui), as the DVL can spend up to 5 minutes searching for a DHCP server.

### Fallback IP

The DVL will always be available with the static IP address: **192.168.194.95**. To be able to connect to the DVL using it:

* Connect an ethernet cable directly from the DVL to your computer.
* For an/the ethernet interface of your computer, configure it to have a static IP address in the same subnet as 192.168.194.95, e.g. 192.168.194.90 or anything else of the form 192.168.194.xxx if using a subnet of the form 255.255.255.0 (aka 192.168.194.0/24).
* Activate the ethernet interface of your computer which you configured in the previous step.
* In a web browser, open http://192.168.194.95 to access the web [GUI](../gui/dashboard).

### Via the GUI

The IP address of the DVL can be configured in two ways via the web [GUI](../gui/dashboard):

* DCHP client: an IP address is obtained from a DHCP server (e.g. in a router) on the same network, as in the discussion of [mDNS](#multicast-dns-mdns) above.
* Static: equip the DVL with a certain static IP address.

After the IP configuration of the DVL is modified, the DVL needs to be rebooted for the settings take effect.

!!! Note
	The boot time, i.e. the time it takes from the DVL receives power until it starts operating normally, will depend upon the IP configuration. Using the [fallback IP](#fallback-ip), the boot time can be as much as 1 min 30 sec, whilst it can be as low as 20 sec with a static IP.

## TCP data stream

The DVL can output data and receive commands over Transmission Control Protocol (TCP). A TCP server is available on port **16171** which outputs the latest data to all connected clients, and which listens to commands from any of these connected clients. See the DVL's TCP [protocol](./dvl-protocol.md#ethernet-protocol-tcp).
