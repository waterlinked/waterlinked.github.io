# Software update

To get the best performance of your Water Linked product it is recommended to always run the latest software. The update GUI can automatically check if a new software version is available.

Products currently supported for updates:

| Product                     | GUI Link |
| --------------------------- | :--- |
| DVL-A50                     | [http://waterlinked-dvl:9000/](http://waterlinked-dvl:9000/) |
| Underwater GPS G2           | [http://waterlinked-ugps:9000/](http://waterlinked-ugps:9000/) |
| Underwater GPS Explorer Kit | See [Explorer Kit Software Update ](../explorer-kit/upgrader/) |

## Automatic software update

The easiest way of checking if a new version is available is to connect the product to the internet and let the upgrade GUI automatically check for a new version:

* Connect the Water Linked products ethernet to a network where the internet is available and make sure the products network configuration allows access to the internet.
* Go to http://[IP_ADDRESS]:9000.
* The update GUI will automatically check if there is a new version available and allow installation of new update with a single click.

## Offline software update

If you are unable to connect your Water Linked product to the internet, offline software update is available. The process is:

* Find the current version and chipid in the the "about" section of the web gui.
* Manually download an update package (.wlup) from the [update server](https://update.waterlinked.com/) using the chipid.
* Verify if the version downloaded is newer than the currently running version.
* Go to http://[IP_ADDRESS]:9000.
* Select "manual upload" and then upload the downloaded file.