# Software updates

It is recommended to always run the latest DVL software where possible. The latest software can be obtained [automatically](#automatic-software-update) or [manually](#offline-software-update).

The release notes for each release is available in the [GUI](../gui/dashboard) and also in the [GUI demo](https://dvl.demo.waterlinked.com/#/about).

!!! Warning
	During the software upgrade, the thermal protection feature is turned off. To prevent the DVL from overheating, it is important to submerge the DVL in water throughout the update process.”


## Automatic software update

The DVL's [GUI](../gui/dashboard) automatically checks and indicates if a new software version is available.

* Connect the DVL over ethernet to a network connected to the internet. If on a personal computer, it may be necessary to make a network bridge between a network interface (such as wifi) which has access to the internet and the ethernet interface through which the DVL is connected.
* Go to http://[IP_ADDRESS_OF_THE_DVL]:9000 in a web browser.
* The GUI will automatically check if there is a new version available, and if so, initiate installation of it with a single click.

## Offline software update

If it is not possible to connect the DVL to the internet, one can proceed as follows.

* Find the current version and chip ID of the DVL at *Menu -> About* in the [GUI](../gui/dashboard).
* Manually download an update package (`.wlup`) from the [update server](https://update.waterlinked.com/) using the chip ID.
* Verify if the downloaded version is newer than the currently running version.
* Set system time as shown below.
* Navigate to http://[IP_ADDRESS_OF_THE_DVL]:9000 in a web browser.
* Select 'Manual upload' and then upload the downloaded `.wlup` file.

### Failure during upgrade (set system time)

When performing an offline software upgrade it the following error might occur: `Failed: Error upgrading: resize: non-zero exit code: exit status 1`. This error is resolved by setting the system time before performing an upgrade. Proceed as follows.

* Go to DVL GUI and click on "Configuration" in left menu
* Open "Advanced configuration" menu
* Scroll to "System time configuration"
* Select "Manual time" in "System time source" and click "Set manual time"
* Click on "About" in left menu and click "Software upgrade"
* Perform upgrade again
