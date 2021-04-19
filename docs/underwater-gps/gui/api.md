# API

The Underwater GPS system comes with an easy-to-use software API. This API uses a HTTP-based scheme to interact with the system. Through the API you can among others:

* Read acoustic and global position data

* Read GPS and IMU raw data

* Read and set POIs

* Set configuration settings

See [demo.waterlinked.com/swagger](http://demo.waterlinked.com/swagger) for more information.

Beacuse the API is based on HTTP and it is possible to use multiple different programing languages to interface it. In our examples on Github we use Python 2.7. How to install the requirements needed when using the API with Python is explained below.

## How to install requirements needed to use Water Linked API examples

When starting to use the Water Linked software API you need to make sure you have all the requriments installed. First install Python 2.7 and pip:

* Windows: [Guide](https://github.com/BurntSushi/nfldb/wiki/Python-&-pip-Windows-installation)
* Mac: It should be preinstalled. Check by using these command:
```
python2 -V
pip -V
```
* Linux: It should be preinstalled. Check by using these command:
```
python2 --version
pip --version
```
Next you need to download/clone our repository which is found on [Github](https://github.com/waterlinked/examples). Then you open a terminal in the directory where you saved the files and install the required Python packages using this command:

* Windows:
```
python -m pip install -r requirements.txt
```

* Linux and Mac:
```
pip install -r requirements.txt
```
Once this is done you are ready to start interfacing the API.

Example code which use the API can be found [here](https://github.com/waterlinked/examples).

## Providing depth to system when using Locator-A1

Make sure you have completed the installation of the requirements found above. Then open a terminal window in the dictionary where the files are saved and run the command:
```
python externaldepth.py -d DEPTH_OF_LOCATOR -t TEMP_OF_WATER -u URL_OF_KIT -r REPETITION_RATE
```

* DEPTH_OF_LOCATOR: Is the current depth of the Locator.
* TEMP_OF_WATER: Is the temperature of the water where the Locator is operating in.
* URL_OF_KIT: Is the url of the kit. Usually: "http://192.168.2.94"
* REPETITION_RATE: If you want to repate the sending of depth it is the delay between each sending in seconds.
