# Networking Sonar 3D-15

The Sonar 3D-15 has several services available over ethernet:

* [Multicast DNS](#multicast-dns-mdns) (mDNS) for easy discovery
* Web [GUI](3d-sonar-15-gui.md), providing a visualization of the data collected by the Sonar 3D-15, as well as configuration, [updating of software](3d-sonar-15-software-update.md) and more.
* UDP Multicast and Unicast [data stream](#udp-multicast-and-unicast)
* [Software updates](3d-sonar-15-software-update.md)


## Network configuration

### Multicast DNS (mDNS)

The Sonar 3D-15 runs a DHCP client which will attempt to obtain an IP address from a DHCP server (e.g. in a router) on the same network, and supports mDNS: the mDNS name of the Sonar 3D-15 is `waterlinked-sonar`. On a computer which supports mDNS, one can then simply access the web [GUI](3d-sonar-15-gui.md) at [http://waterlinked-sonar](http://waterlinked-sonar).

!!! note
    If no DHCP server is available on the network, it is recommended to use the [fallback IP](#fallback-ip) or  configure a [static IP address](#via-the-gui), as the Sonar 3D-15 can spend up to 5 minutes searching for a DHCP server.

### Fallback IP

The Sonar 3D-15 will always be available with the static IP address: **192.168.194.96**. To be able to connect to the Sonar 3D-15 using it:

* Connect an ethernet cable directly from the Sonar 3D-15 to your computer.
* For an/the ethernet interface of your computer, configure it to have a static IP address in the same subnet as 192.168.194.96, (e.g. 192.168.194.90) or anything else of the form 192.168.194.xxx if using a subnet of the form 255.255.255.0 (aka 192.168.194.0/24).
* Activate the ethernet interface of your computer which you configured in the previous step.
* In a web browser, open http://192.168.194.96 to access the web [GUI](3d-sonar-15-gui.md).

### User set IP 

The IP address of the Sonar 3D-15 can be configured in two ways via the web [GUI](3d-sonar-15-gui.md):

* DCHP client: an IP address is obtained from a DHCP server (e.g. in a router) on the same network, as in the discussion of [mDNS](#multicast-dns-mdns) above.
* Static: equip the Sonar 3D-15 with a certain static IP address.

After the IP configuration of the Sonar 3D-15 is modified, the Sonar 3D-15 needs to be rebooted for the settings take effect.

!!! Note
    The boot time, i.e. the time it takes from the Sonar 3D-15 receives power until it starts operating normally, will depend upon the IP configuration. Using the [fallback IP](#fallback-ip), the boot time can be as much as 1 min 30 sec, whilst it can be as low as 20 sec with a static IP.

## UDP multicast and unicast

By default, the Sonar 3D-15 uses **UDP Multicast** (`224.0.0.96:4747`), so any device on the local network can receive data without knowing the sonar’s IP. You can also configure **UDP Unicast** to send data to a specific IP/port, allowing routing outside the local network (but losing multicast discoverability).


