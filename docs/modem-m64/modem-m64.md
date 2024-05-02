# Modem-M64

The Modem-M64 is retired and no longer available for sale.

## Description

The Modem M64 is a two-way half-duplex 64bps acoustic modem with a robust and user configurable data link.

The M64 sets a new market standard with its record-breaking physical size, low power requirement and cost. All this combined with a very useful technical specification, the M64 opens new possibilities for underwater communication in both existing and new areas.

## LED Signals

* No green light: Power is off.

* Flashing green light (every 3 seconds): Modem is trying to pair with another modem.

* Fixed green light: Modem has sync with another modem. The LED will blink each time it receives a packet from the other modem (once a second).


## Wiring interface

The tables below shows the pinning of the Modem-M64 interface. Depending on which cable type is used, the power wires may have different colors.

| Interface           | Color (Belden) | Color (4TP1P) |
| :------------------ | :------------- | :------------ |
| Positive (10-18V)   | Orange         | Red |
| Negative/Ground     | Orange/White   | Black |
| UART RX             | Brown          | Brown |
| UART TX             | Brown/White    | Brown/White |

!!! Note
	Power must be applied to the power terminals before applying voltage to UART pins

## Terminal Interface

The Modem-M64 has a 3.3 volt UART interface.

| Settings           | Value |
| :------------------ | :-- |
| Baud rate | 115200  |
| Data parity stop | 8N1   |
| Flow control | None  |

## Channels

Modem M64 supports channels 1-7.

| From (kHz) | To (kHz) | Channels using this frequency band |
|-------|------|------|
| 31.25 | 62.25 | 1 |
| 62.25 | 93.75 | 2 (16) |
| 93.75 | 125.00 | 3 (16) |
| 125.00 | 156.00 |  4 (17) |
| 156.00 | 187.00 | 5 (17) |
| 187.00 | 218.00 | 6 (18) |
| 218.00 | 250.00 | 7 (18) |

Please note that the Underwater GPS Explorer kit channels 16, 17, 18 overlaps and all channels overlaps with Underwater GPS G2.

## Libraries and code examples

Example code and libraries that can be used to communicate with the modem on the terminal interface:

* [Python](https://github.com/waterlinked/modem-python)

## Dimensions

![modem_m64_dimensions](../img/modem_m64_dimensions.png)

