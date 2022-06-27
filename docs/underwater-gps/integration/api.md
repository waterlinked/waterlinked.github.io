# API

The Underwater GPS G2 system comes with an easy-to-use software HTTP API. Through the API you can, amongst other things:

* Read acoustic and global position data

* Read GPS and IMU raw data

* Read and set POIs

* Set configuration parameters

See [demo.waterlinked.com/swagger](http://demo.waterlinked.com/swagger) for the details of the API.

## Interaction

Any programming language can be used to interact with the API. We have examples in both [Python](https://github.com/waterlinked/examples) and [Go](https://github.com/waterlinked/ugps-nmea-go), which currently cover, for instance:

* Sending of locator depth when using the [Locator A1](../locators/locator-a1.md) (see the script `externaldepth.py`).
* Sending in of satellite GPS data (positioning and/or heading) from an external GPS receiver (see the script `nmeainput.py` or its [Go analogue](https://github.com/waterlinked/ugps-nmea-go))
* Export of tracks to a GPX file (see the script `tracklog.py`)
* Output of the positions calculated by the UGPS G2 system in NMEA format (see the Python script `nmeaoutput.py` or its [Go analogue](https://github.com/waterlinked/ugps-nmea-go))
