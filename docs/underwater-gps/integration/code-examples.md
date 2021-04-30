# Code examples

Water Linked has writen some code examples on how to use the HTTP API that comes with the topside.
All of the code examples which use the API can be found [here](https://github.com/waterlinked/examples).


Make sure you have completed the installation of the requirements found [here](./api.md) before starting.

## Providing depth to system when using Locator-A1
Download the python script [here](https://github.com/waterlinked/examples).

Then open a terminal window in the dictionary where the files are saved and run the command:
```
python externaldepth.py -d DEPTH_OF_LOCATOR -t TEMP_OF_WATER -u URL_OF_KIT -r REPETITION_RATE
```

* DEPTH_OF_LOCATOR: Is the current depth of the Locator.
* TEMP_OF_WATER: Is the temperature of the water where the Locator is operating in.
* URL_OF_KIT: Is the url of the kit. Usually: "http://192.168.2.94"
* REPETITION_RATE: If you want to repate the sending of depth it is the delay between each sending in seconds.
