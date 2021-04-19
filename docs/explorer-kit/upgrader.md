# Software update

As of software release 2.1.0 the system automaticly checks for updates when the host computer is connected to internet. If you have the latest release you will see a green checkmark as shown below. An exclamation mark will indicate if a newer release is available.

![sw_version](../img/sw_version.png)

A software update package (.wlup file) includes all files required to update the system. The software package is encrypted and will only work for the Chip ID it is generated for. The Chip ID can be found in the About tab of the GUI.

## Update process

Please select the update process that is best suited to you:

* If the Underwater GPS GUI is visible to you on [http://192.168.2.94](http://192.168.2.94) please use the [Update with static IP](#update-using-static-ip).
* If the Underwater GPS GUI is not shown when using the link above, please use the [Update with DHCP](#update-using-dhcp).

!!! warning
    The software upgrade will clear the receiver configuration, settings and POIs. Make sure to save the information you need before upgrading.

### Download software package

To get the latest software package for your kit:

* Download directly from the "About" page of the Underwater GPS GUI
* Alternatively: Go to [update.waterlinked.com](http://update.waterlinked.com) and enter the Chip ID of your kit.

### Update using static IP

This procedure works if you have haven't changed the jumpers on the Master-D1, you have set up a static IP address on your computer and you are able to see the gui on [http://192.168.2.94](http://192.168.2.94).

| Step | Description          |                      |
| -    | :------------------- | :------------------- |
| 1    | Download the software package (.wlup) for your kit | [Download software package](#download-software-package) |
| 2    | Power off the system |  |
| 3    | Connect the upgrade plug included in the kit or connect GPIO0 to ground using a jumper cable | ![upgrade_plug](../img/upgrade_plug.jpg)  ![upgrade_jumper](/../img/upgrade_jumper.jpg) |
| 4    | Power on the system |  |
| 6    | Go to web gui [http://192.168.2.94](http://192.168.2.94) | If you see a blank or partly broken page, try to clean browser cache by pressing Ctrl-F5 or opening the page in "Private"/"Incognito" mode |
| 7    | Remove the upgade plug or the jumper grounding GP0. |  |
| 8    | Click “Browse file” and select correct <>.wlup file |  |
| 9    | Wait for update process to complete |  |
| 10    | When the update process is complete and successful, the system will automatically reboot to standard mode | If process fails, please try again |
| 11   | Verify that the SW version has updated by going to the web gui [http://192.168.2.94](http://192.168.2.94) | If you see a blank or partly broken page, try to clean browser cache by pressing Ctrl-F5 or opening the page in "Private"/"Incognito" mode |
| 12   | Upgrade process complete | Celebrate with your favorite beverage |


### Update using DHCP

This procedure works if you don't know how to set a static IP address on your computer.

| Step | Description          |                      |
| -    | :------------------- | :------------------- |
| 1    | Download the software package (.wlup) for your kit | [Download software package](#download-software-package) |
| 2    | Power off the system |  |
| 3    | Set Master-D1 to DHCP Server. (Remember original setting) | See [network settings](hardware.md) |
| 4    | Connect a network cable directly from your computer to the Master-D1 | |
| 5    | Configure the network on your computer to get IP address from DHCP  | (this is default on most computers, so if you haven't set a static ip you're good) |
| 6    | Connect the upgrade plug included in the kit or connect GPIO0 to ground using a jumper cable | ![upgrade_plug](../img/upgrade_plug.jpg)  ![upgrade_jumper](/../img/upgrade_jumper.jpg) |
| 7    | Power on the system |  |
| 8    | Go to web GUI [http://192.168.0.1](http://192.168.0.1) | If you see a blank or partly broken page, try to clean browser cache by pressing Ctrl-F5 or opening the page in "Private"/"Incognito" mode |
| 9    | Remove the grounding of GP0. |  |
| 10    | Click “Browse file” and select correct <>.wlup file |  |
| 11    | Wait for update process to complete |  |
| 12    | When the update process is complete and successful, the system will automatically reboot to standard mode | If process fails, please try again |
| 13   | Verify that the SW version has updated by going to the web gui [http://192.168.0.1](http://192.168.0.1) | If you see a blank or partly broken page, try to clean browser cache by pressing Ctrl-F5 or opening the page in "Private"/"Incognito" mode |
| 14   | Reset network settings to original setting from step 2 | See [network settings](hardware.md). |
| 15   | Upgrade process complete | Celebrate with your favorite beverage |
