# Serial Interface

The modem utilizes either a 3V3 UART or RS422 for interfacing. Users can operate the modem in different modes, configure communication channels, and retrieve diagnostic data via this serial interface. A half-duplex serial communication protocol, encompassing the following configuration, is implemented by the modem:

- Baud rate: 9600 bps
- Data bits: 8 bits per transfer
- Stop bits: 1 stop bit
- Parity: None

## Operational Modes

The modem provides two operational modes: transparent serial mode and diagnostic mode.

In transparent serial mode, the modem processes two bytes of data per transmission. Upon receipt of a packet, it transmits two bytes of received data using the chosen serial protocol (OEM, Standard or Extended). Each transmission lasts approximately 1.6 seconds, as determined by the acoustic wave duration. The lack of TX buffering implies that attempting to input more than 2-bytes of data during a single transmission will lead to irretrievable packet loss, e.g. if four bytes of data are sent, only the first two bytes will be transmitted, and the remaining two bytes will be discarded.

In contrast, diagnostic mode offers an in-depth report over the chosen serial communication, containing:

- A Transport Block (TB) that holds received data (16-bit).
- Bit Error Rate (BER, 8-bit).
- Signal Power (8-bit).
- Noise Power (8-bit).
- Packet Valid status indicating a successful LDPC decoder and CRC operation (16-bit).
- Packet Invalid status showing an unsuccessful CRC check despite LDPC decoding (8-bit).
- Firmware revision, represented as a Git commit hash (8-bit).
- Time since power-up, measured in 10 ms increments (24-bit).
- FPGA chip id (16-bit).
- Hardware revision (2-bit).
- Communication channel (1-12, 4-bit).
- TB Valid status to verify if the first TB is new (1-bit).
- TX-complete status to confirm a completed transmission (1-bit).
- Diagnostic mode (1-bit, on/off).

<!-- 
- Power level (2-bits, level 1 to 4), default is level 4.) 
-->   

A diagnostic report is triggered under the following conditions:

1. Receipt of a new packet, setting the TB Valid bit to ‘1’.
2. Completion of a transmission, setting the TX Complete bit to ‘1’.
3. After 4 seconds have passed since the last report was dispatched.

To optimize packet transmission and identify the receipt of new data, the TX-complete and TB Valid bits can be utilized while interpreting the report. Like in transparent serial mode, the modem in diagnostic mode also lacks TX buffering, therefore, accepting only 2-bytes of data for each transmission and discarding the remaining data.

Reports can also be requested in the transparent serial mode, with further details provided in subsequent sections.

## Quickstart guide
By default, each modem is preprogrammed to operate in the transparent serial mode and communicate on channel 1. For a quick setup with two modems, simply connect the modems and initiate communication.

## Settings interface

Users can access or modify three parameters in the modem:

1. Communication channels.
2. Operation mode.
3. Report request.
<!--
4. Power Level 
-->

 
The procedure for accessing these parameters is detailed in the following sections.

### Communication channel command

The modem offers 12 communication channels. Two modems can only interact if they operate on the same channel. To set the channel, users must send two "c" characters through the serial interface, separated by a one-second interval. Following the transmission of both characters, users can choose the desired channel by transmitting a single character ranging from 1 to c within 2 seconds.

The table below provides an overview of the available channels:

| **Channel** | **Character** | **HEX-Value** |
| :---------- | :------------ | :------------ |
| 1           | "1"           | 0x31          |
| 2           | "2"           | 0x32          |
| 3           | "3"           | 0x33          |
| 4           | "4"           | 0x34          |
| 5           | "5"           | 0x35          |
| 6           | "6"           | 0x36          |
| 7           | "7"           | 0x37          |
| 8           | "8"           | 0x38          |
| 9           | "9"           | 0x39          |
| 10          | "a"           | 0x61          |
| 11          | "b"           | 0x62          |
| 12          | "c"           | 0x63          |

For instance, to configure the modem to communicate on channel 11 via the UART interface, follow these steps:

1. Transmit a single "c" (0x63) character over UART.
2. Allow a one-second interval to pass.
3. Send another "c" (0x63) character over UART.
4. Wait for less than 2 seconds / transmit immediately.
5. Send a single "b" (0x62) character.

### Setting operational mode command

To toggle between the diagnostic mode and transparent serial mode, users are required to send two "m" characters with a one-second interval between them.
<!--
### Setting power level
This works in the same way as setting the channel, except you have to send the character “l” (small L) (0x6C). Also the user will only have 4 levels to choose from. 

Following is a table showing the available power levels:

| **Power Level** | **Character** | **HEX-Value** | **Average Transmit Power consumption(mW)** | **Typical Maximum Range (m)** |
| :-------------- | :------------ | :------------ | :----------------------------------------- | :---------------------------- |
| 1               | "1"           | 0x31          | 390                                        | 300                           |
| 2               | "2"           | 0x32          | 555                                        | 600                           |
| 3               | "3"           | 0x33          | 790                                        | 900                           |
| 4 (Default)     | "4"           | 0x34          | 1105                                       | 1000                          |

**NOTE:** Maximum range can only be achieved in good conditions with low noise and a clear path between the modems.

Following is an example of how to set the modem to power level 3:

1. 	Transmit a single “l” (0x6C) character over UART.
2. 	Allow a one-second interval to pass.
3. 	Send another “l” (0x6C) character over UART.
4.	Wait for less than 2 seconds /transmit immediately.
5. 	Send a single “3” (0x33) character over UART.
-->
### Request report command

In both diagnostic and transparent serial modes, a report request can be initiated at any time by transmitting two "r" characters spaced one second apart. Following this request, the modem will generate the required report.

## Packet structure of report

The structure of a report is as follows:

| **Byte (bit)** | **Field**           | **Description**                                                                                |
| :------------- | :------------------ | :--------------------------------------------------------------------------------------------- |
| 0 (0:7)        | START_OF_FRAME (SOF)| “$”                                                                                            |
| 1:2 (0:15)     | TB                  | Transport block containing received data.                                                      |
| 3 (0:7)        | BER                 | Bit error rate                                                                                 |
| 4 (0:7)        | SIGNAL_POWER        | Relative Signal Power (See warning below)                                                      |
| 5 (0:7)        | NOISE_POWER         | Relative Noise Power  (See warning below)                                                      |
| 6:7 (0:15)     | PACKET_VALID        | Packet valid, CRC successful                                                                   |
| 8 (0:7)        | PACKET_INVALID      | Packet invalid, CRC failed                                                                     |
| 9 (0:7)        | GIT_REV             | Firmware revision                                                                              |
| 10:12 (0:23)   | TIME_FROM_BOOT      | Time since power up / boot in 10 ms (1 = 10 ms, 2 = 20 ms, etc.)                               |
| 13:14 (0:15)   | CHIP_ID             | FPGA chip id                                                                                   |
| 15 (0:1)       | HW_REV              | Hardware revision                                                                              |
| 15 (2:5)       | CHANNEL             | Communication channel (1-12)                                                                   |
| 15 (6)         | TB_VALID            | Transport block valid, used to determine if the transport block in byte 1:2 is new             |
| 15 (7)         | TX_COMPLETE         | Used to inform that a transmission is complete                                                 |
| 16 (0)         | DIAGNOSTIC_MODE     | Will send a report over UART at 4-second intervals or when new data is transmitted or received |
| 16 (1)         | RESERVED            | Reserved                                                                                       |
| 16 (4:7)       | RESERVED            | Reserved                                                                                       |
| 17 (0:7)       | END_OF_FRAME (EOF)  | New line (“\n”)                                                                                |

<!--| 16 (2:3)       | POWER_LEVEL         | Level to transmit signal acoustically (0 = Level 4, 1 = level 3, 2 = level 2 and 4 = level)    | -->

!!! Warning
    **Signal Power:** This value represents the strength of the signal received by the modem when it is decoding a data packet. It ranges from 0 to 255, where 255 is the strongest signal (ideal conditions), and lower values indicate weaker signals. Importantly, when the modem is idle and not decoding or sending data, the signal power will represent the background noise, known as the "noise floor." This is because the modem is not detecting any signal during idle periods.

    **Noise Power:** This value represents the background noise in the environment. When the modem is idle, the noise power and signal power will be the same, both representing the noise floor. During packet decoding, the noise power may increase due to interference, energy leakage, or other environmental factors, but this will only be noticeable when data is being processed. The signal power should always exceed the noise power when data of sufficient quality is being received for decoding.

    **Summary:** It's essential to note that when the modem is idle, the signal power and noise power will be identical, representing the noise floor. Therefore, you cannot directly compare these values when the modem is idle. To assess the environment, store the noise power while the modem is idle (as the noise floor) and compare it with the signal power during packet decoding. A higher signal power compared to the stored noise floor indicates a better communication setup and environment. 

As previously mentioned, in diagnostic mode, reports are dispatched at 4-second intervals or when new data is transmitted or received. The following Python code is an example of a report parser:

```python
def decode_packet(packet: bytes) -> Optional[Dict[str, Any]]:
   """
   Decode a packet received from the modem.


   Parameters
   ----------
   packet : bytes
       The raw packet received from the modem. The packet should be 18 bytes long and start with
        '$' (0x24) and end with '\n' (0x0A).


   Returns
   -------
   Optional[Dict[str, Any]]
       A dictionary with decoded values if the packet is valid, None otherwise.


   """
   if len(packet) != 18 or packet[0] != '$' or packet[-1] != '\n':
       return None


   # The 128-bit data excluding the SOF and EOF characters
   data = packet[1:17]

   decoded = struct.unpack("<HBBBHBBBBBHBB", data)


   decoded_dict = {
       "TR_BLOCK": decoded[0],
       "BER": decoded[1],
       "SIGNAL_POWER": decoded[2],
       "NOISE_POWER": decoded[3],
       "PACKET_VALID": decoded[4],
       "PACKET_INVALID": decoded[5],
       "GIT_REV": decoded[6].to_bytes(1, "little"),
       "TIME": (decoded[9] << 16) | (decoded[8] << 8) | decoded[7],
       "CHIP_ID": decoded[10],
       "HW_REV": (decoded[11] & 0b00000011),
       "CHANNEL": (decoded[11] & 0b00111100) >> 2,
       "TB_VALID": (decoded[11] & 0b01000000) >> 6,
       "TX_COMPLETE": (decoded[11] & 0b10000000) >> 7,
       "DIAGNOSTIC_MODE": (decoded[12] & 0b00000001),
       #"LEVEL": (decoded[12] & 0b00001100) >> 2, Not in use
   }


   return decoded_dict
```

## Ensuring successful transmission and optimising

In the diagnostic mode, a report is transmitted immediately after the completion of a transmission. To optimise the transmission baud rate, users can buffer data and transmit two bytes whenever a high TX-complete bit is received. This method guarantees efficient and continuous data transmission. In the transparent serial mode, successful transmission is ensured by sending two bytes and waiting for more than 1.6 seconds before transmitting the next two bytes.

## Flash memory considerations
Setting modem mode and channel results in a flash write operation. Thus ensure that the modem is not powered off during this operation. The modem will not respond to any commands during this time. The flash write operation takes approximately 1 second to complete.

