# Modem-M64

## Description

The Modem M64 is a two-way half-duplex 64bps acoustic modem with a robust and user configurable data link.

The M64 sets a new market standard with its record-breaking physical size, low power requirement and cost. All this combined with a very useful technical specification, the M64 opens new possibilities for underwater communication in both existing and new areas.

## Key specifications

* Two-way communication

* 64 bit per second net data link, both ways

* Latency 1.5 – 2.5 sec

* 200 meter range

## LED Signals

* No green light: Power is off.

* Flashing green light (every 3 seconds): Modem is trying to pair with another modem.

* Fixed green light: Modem has sync with another modem. The LED will blink each time it receives a packet from the other modem (once a second).


## Wiring interface

The tables below shows the pinning of the Modem-M64 interface.

| Interface           | Color |
| :------------------ | :-- |
| Positive (10-18V) | Orange  |
| Negative/Ground | Orange/White   |
| UART RX | Brown  |
| UART TX | Brown/White   |

## Terminal Interface

The Modem-M64 has a 3.3 volt UART interface.

| Settings           | Value |
| :------------------ | :-- |
| Baud rate | 115200  |
| Data parity stop | 8N1   |
| Flow control | None  |

## Channels

Modem M64 supports channels 1-7. Channel overveiw can be found [here](../channels.md).

## Libraries and code examples

Example code and libraries that can be used to communicate with the modem on the terminal interface:

* [Python](https://github.com/waterlinked/modem-python)

## Dimensions

![modem_m64_dimensions](../img/modem_m64_dimensions.png)
