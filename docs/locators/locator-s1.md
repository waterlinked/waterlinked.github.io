# Locator-S1

## Description

The Locator-S1 carries an internal GPS based time sync module. Because of this, the S1 does not require tether integration for top-side communication. It only requires external power 10-18V to be provided from the underwater device.

Some Locator-S1 attributes can be configured using an integrated UART (3V3) interface. This configuration is optional and not required for normal operation. Before deployment in water, the Locator-S1 needs to achieve a GPS lock. The integrated status-LED shows the condition of the GPS lock. Once the Locator-S1 has lock it can operate for approximately 6 hours befor needing resync with GPS.

!!! note
    The default channel for Locator-S1 is 17 on boot.

Locator-S1 supports channel 16,17 and 18. Channel overveiw can be found [here](../channels.md).

As the Locator-S1 does not carry its own depth sensor, the depth needs to be provided from the underwater vehicle (ROV etc.) to the topside Master-D1 using the software API. Example of how to perform this can be found [here](../explorer-kit/gui/api.md#providing-depth-to-system-when-using-locator-a1s1).

## LED Signals

* No green light: Power is off and the unit is **not ready** for diving.

* Flashing green light (once a second): Searching for GPS lock. The unit is **not ready** to dive.

* Fixed green light: GPS lock is acheived. The unit is ready to dive.

* Flashing green light (slow): GPS lock has been acheived but lost. The unit is ready to dive.


## Wiring interface

The tables below shows the pinning of the S1 interface.

| Interface           | Color |
| :------------------ | :-- |
| Positive (10-18V) | Orange  |
| Negative | Orange/White   |
| UART RX | Brown  |
| UART TX | Brown/White   |

## Terminal Interface

The Locator-S1 has a simple 3.3 volt UART interface which is used to change the channel of the locator.

| Settings           | Value |
| :------------------ | :-- |
| Baud rate | 9600  |
| Data parity stop | 8N1   |
| Flow control | None  |

## Dimensions

![s1_dimensions](../img/s1_dimensions.png)

[Datasheet](https://www.waterlinked.com/datasheets/locator-s1/)
