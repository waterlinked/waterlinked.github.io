# Software updates

It is recommended to always run the latest UGPS G2 software where possible. The latest software can be obtained [automatically](#automatic-software-update) or [manually](#offline-software-update).

## Automatic software update

The G2's [GUI](../gui/position) automatically checks and indicates if a new software version is available.

* [Connect](../network-settings) the G2 topside unit over ethernet or wifi to a network connected to the internet. If on a personal computer, it may be necessary to make a network bridge between a network interface which has access to the internet and the interface through which the G2 topside is connected.
* Go to http://[IP_ADDRESS_OF_THE_G2_TOPSIDE]:9000 in a web browser.
* The GUI will automatically check if there is a new version available, and if so, initiate installation of it with a single click.

## Offline software update

If it is not possible to connect the G2 topside to the internet, one can proceed as follows.

* Find the current version and chip ID of the G2 topside unit at *Menu -> About* in the [GUI](../gui/position).
* Manually download an update package (`.wlup`) from the [update server](https://update.waterlinked.com/) using the chip ID.
* Verify if the downloaded version is newer than the currently running version.
* Navigate to http://[IP_ADDRESS_OF_THE_G2_TOPSIDE]:9000 in a web browser.
* Select 'Manual upload' and then upload the downloaded `.wlup` file.
