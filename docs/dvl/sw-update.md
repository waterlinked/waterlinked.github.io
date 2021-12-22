# Software updates

It is recommended to always run the latest DVL software where possible. The latest software can be obtained [automatically](#automatic-software-update) or [manually](#offline-software-update).

!!! Warning
	The DVL can overheat if its software is updated whilst it is out of water, which can lead to structural damage and subsequent hardware failure. Placing it in a bucket of water, for example, should ensure sufficient cooling.


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
* Navigate to http://[IP_ADDRESS_OF_THE_DVL]:9000 in a web browser.
* Select 'Manual upload' and then upload the downloaded `.wlup` file.
