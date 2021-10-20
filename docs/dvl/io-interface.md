# Overview

The IO Interface provides simple means of connection to the Water Linked DVLs. It provides magnetics for the ethernet connection and utilizes the Molex Micro-Fit 3.0 power connector which is standard for Water Linked products.

There currently exists three revisions of the IO Interface. Revision 2 and 3 are electrically identical. Revision 4 has an integrated USB-to-UART interface and a micro USB port.

## Revision 4

![IO_Interface_rev4](../img/WL-31014-4_IO_Interface_connections.png)

Dimensions: 50.6 x 47 x 18.6 mm (Width x Height x Thickness)

| Connector           | Function   | Comment |
| ------------------- | :--------- | :------ |
| RJ45 (8P8C)         | Ethernet   | 10/100 BASE-T |
| Micro USB           | Serial     | FTDI based |
| Molex Micro-Fit 3.0 | Power      | 10 - 30 VDC |
| 2x Ø1.5mm pads      | Alt. power | Fits [Würth 691137710002](https://octopart.com/691137710002-w%C3%BCrth+elektronik-78871135) |

## Revision 3

![IO_Interface_rev3](../img/WL-31014-3_IO_Interface_connections.png)

Dimensions: 40 x 42 x 18.6 mm (Width x Height x Thickness)

| Connector           | Function   | Comment |
| ------------------- | :--------- | :------ |
| RJ45 (8P8C)         | Ethernet   | 10/100 BASE-T |
| 3x1 header          | Serial     | TX, RX, GND |
| Molex Micro-Fit 3.0 | Power      | 10 - 30 VDC |
| 2x Ø1.5mm pads      | Alt. power | Fits [Würth 691137710002](https://octopart.com/691137710002-w%C3%BCrth+elektronik-78871135) |

## Revision 2

![IO_Interface_rev2](../img/WL-31014-2_IO_Interface_connections.png)

Dimensions: 30.6 mm x 50 x 18.6 mm (Width x Height x Thickness)

| Connector           | Function   | Comment |
| ------------------- | :--------- | :------ |
| RJ45 (8P8C)         | Ethernet   | 10/100 BASE-T |
| 3x1 header          | Serial     | TX, RX, GND |
| Molex Micro-Fit 3.0 | Power      | 10 - 30 VDC |
| 2x Ø1.5mm pads      | Alt. power |  |

!!! Note
	The Molex Micro-Fit 3.0 on revision 2 is prone to damage by excessive sideways force. Take care not the yank the power cable when connected.
