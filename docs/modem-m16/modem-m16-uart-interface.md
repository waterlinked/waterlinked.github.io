# Serial Interface

This document describes how to configure and operate the underwater modem via its serial interface. The modem can be controlled using a 3.3V UART or RS422 connection, offering two primary operational modes (transparent serial and diagnostic), various power levels, and user-selectable communication channels.

---

## Firmware Release Notes

Below is a summary of the new features introduced in this release:

| **FW release (ASCII/HEX)** | **Description**                                              |
|:--------------------------:|:-------------------------------------------------------------|
| **o/6f**                   | Initial firmware release                                     |
| **V/56**                   | Added power-level configuration for extended battery runtime |

---

## Serial Interface Overview

The modem implements a half-duplex serial protocol with the following default configuration:

- **Baud rate:** 9600 bps  
- **Data bits:** 8  
- **Stop bits:** 1  
- **Parity:** None  

Users can switch between **3.3V TTL UART** or **RS422** for physical interfacing. Through this serial link, you can:

- Set operational modes  
- Change communication channels  
- Request diagnostic reports  
- Adjust power levels for transmission range/power consumption  

---

## Operational Modes

The modem supports two main operational modes:

1. **Transparent Serial Mode**  
   - Processes and transmits only **2 bytes** of data per packet.  
   - Each transmission takes ~1.6 seconds (acoustic wave duration).  
   - Data beyond the first 2 bytes in a transmission is discarded.

2. **Diagnostic Mode**  
   - Sends detailed status reports, including:  
     - Transport Block (TB)  
     - Bit Error Rate (BER)  
     - Signal & Noise Power  
     - LDPC/CRC Validity  
     - Firmware Revision  
     - Time Since Power-Up  
     - FPGA Chip ID, Hardware Revision  
     - Communication Channel  
     - TX-Complete Status  
     - Power Level Setting  
   - Still limited to **2 bytes** of payload per transmission (discarding any additional data).  
   - Reports are triggered automatically when:
     1. A new packet is received (TB Valid bit is set)  
     2. A transmission completes (TX Complete bit is set)  
     3. 4 seconds have elapsed since the last report  

!!! note
    You can also request a **diagnostic report** while in transparent mode. See the [Request Report Command](#request-report-command) section.

---

## Quickstart Guide

By default:

- **Operational Mode:** Transparent serial mode  
- **Communication Channel:** 1  

For a simple point-to-point setup with two modems:  
1. Connect each modem (via UART or RS422).  
2. Ensure both are set to the same **channel** (default is 1).  
3. Begin sending data; the modems will relay up to 2 bytes each ~1.6 seconds.

---

## Settings Interface

You can configure the modem by issuing commands over the serial link. Four user-configurable parameters are available:

1. **Communication Channel**  
2. **Operation Mode**  
3. **Report Request**  
4. **Power Level**

Each configuration command requires sending specific characters with a 1-second pause between them, followed by a character that selects the new value. Refer to the relevant section below.

---

### Communication Channel Command

The modem can operate on **12 channels** (1 to 12). Two modems must share the same channel to communicate.

**Procedure:**

1. Send `"c"` (0x63).  
2. Wait **1 second**.  
3. Send another `"c"` (0x63).  
4. Within **2 seconds**, send **one character** (`"1"`–`"c"`) to set the desired channel.

| **Channel** | **Character** | **HEX-Value** |
|:----------:|:-------------:|:-------------:|
| 1          | "1"           | 0x31          |
| 2          | "2"           | 0x32          |
| 3          | "3"           | 0x33          |
| 4          | "4"           | 0x34          |
| 5          | "5"           | 0x35          |
| 6          | "6"           | 0x36          |
| 7          | "7"           | 0x37          |
| 8          | "8"           | 0x38          |
| 9          | "9"           | 0x39          |
| 10         | "a"           | 0x61          |
| 11         | "b"           | 0x62          |
| 12         | "c"           | 0x63          |

**Example (Channel 11):**
1. Send `"c"`  
2. Wait 1 second  
3. Send `"c"` again  
4. Within 2 seconds, send `"b"` (0x62)  

---

### Setting Operational Mode

To toggle between **diagnostic mode** and **transparent serial mode**:

1. Send `"m"` (0x6D).  
2. Wait **1 second**.  
3. Send `"m"` again.  

The modem will switch modes (e.g., if you were in transparent mode, it will switch to diagnostic).

---

### Setting Power Level

To adjust the modem’s power level (1–4):

1. Send `"l"` (0x6C).  
2. Wait **1 second**.  
3. Send `"l"` again.  
4. Within 2 seconds, send one character (`"1"`, `"2"`, `"3"`, or `"4"`).

| **Power Level** | **Character** | **HEX-Value** | **Avg. TX Power (mW)** | **Typical Max Range (m)** |
|:--------------:|:-------------:|:-------------:|:----------------------:|:-------------------------:|
| 1              | "1"           | 0x31          | 390                    | 300                       |
| 2              | "2"           | 0x32          | 555                    | 600                       |
| 3              | "3"           | 0x33          | 790                    | 900                       |
| 4 (Default)    | "4"           | 0x34          | 1105                   | 1000                      |

!!! note
    Maximum range is highly dependent on environmental factors, including noise levels and line-of-sight conditions between modems.

**Example (Set Power Level 3):**
1. Send `"l"` (0x6C).  
2. Wait 1 second.  
3. Send `"l"` (0x6C) again.  
4. Within 2 seconds, send `"3"` (0x33).  

---

### Request Report Command

In **both** diagnostic and transparent modes, you can request a report at any time:

1. Send `"r"` (0x72).  
2. Wait **1 second**.  
3. Send `"r"` (0x72) again.

The modem will immediately generate a diagnostic report.

---

## Packet Structure of the Diagnostic Report

When in diagnostic mode (or upon a report request in transparent mode), the modem sends an **18-byte** report. The byte layout is:

| **Byte (bit)** | **Field**              | **Description**                                                                                 |
|:--------------:|:-----------------------|:-----------------------------------------------------------------------------------------------:|
| 0 (0:7)        | `START_OF_FRAME (SOF)` | “$” (0x24)                                                                                      |
| 1:2 (0:15)     | `TB`                   | Transport block containing 2 bytes of received data.                                            |
| 3 (0:7)        | `BER`                  | Bit error rate                                                                                  |
| 4 (0:7)        | `SIGNAL_POWER`         | Relative signal power (0–255)                                                                   |
| 5 (0:7)        | `NOISE_POWER`          | Relative noise power (0–255)                                                                    |
| 6:7 (0:15)     | `PACKET_VALID`         | Indicates packet integrity: LDPC decode + CRC successful                                        |
| 8 (0:7)        | `PACKET_INVALID`       | CRC check failed                                                                                |
| 9 (0:7)        | `GIT_REV`              | Firmware revision (Git commit hash, 8-bit)                                                      |
| 10:12 (0:23)   | `TIME_FROM_BOOT`       | Time since power-up in 10 ms increments                                                         |
| 13:14 (0:15)   | `CHIP_ID`              | FPGA chip ID                                                                                    |
| 15 (0:1)       | `HW_REV`               | Hardware revision (2 bits)                                                                      |
| 15 (2:5)       | `CHANNEL`              | Active communication channel (1–12)                                                             |
| 15 (6)         | `TB_VALID`             | Transport block valid bit; indicates new TB data                                               |
| 15 (7)         | `TX_COMPLETE`          | Indicates that a transmission has finished                                                      |
| 16 (0)         | `DIAGNOSTIC_MODE`      | 1 if in diagnostic mode; 0 otherwise                                                            |
| 16 (1)         | `RESERVED`             | Reserved bit                                                                                    |
| 16 (2:3)       | `POWER_LEVEL`          | Current power level (0 = L4, 1 = L3, 2 = L2, 3 = L1)                                             |
| 16 (4:7)       | `RESERVED`             | Reserved bits                                                                                   |
| 17 (0:7)       | `END_OF_FRAME (EOF)`   | New line (“\n”)                                                                                 |

!!! warning
    **Signal Power & Noise Power**  
    - Both range from 0 to 255.  
    - When the modem is idle (not transmitting or receiving), **Signal Power** reflects the background noise floor, which should match **Noise Power**.  
    - **During** packet decoding, `SIGNAL_POWER` should be **greater** than `NOISE_POWER` for a successful decode.

    **Practical Tip**  
    - Record the Noise Power while idle as your baseline (noise floor).  
    - Compare that with Signal Power during active communication.  
    - The bigger the gap, the better the link quality.

---

### Example Python Report Parser

```python
def decode_packet(packet: bytes) -> Optional[Dict[str, Any]]:
    """
    Decode a packet received from the modem.

    Parameters
    ----------
    packet : bytes
        The raw packet (18 bytes) starting with '$' (0x24) and ending with '\n' (0x0A).

    Returns
    -------
    Optional[Dict[str, Any]]
        A dictionary with decoded values if valid, or None otherwise.
    """
    if len(packet) != 18 or packet[0] != ord('$') or packet[-1] != ord('\n'):
        return None

    # The 16 bytes after the '$' and before the '\n'
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
        "HW_REV": decoded[11] & 0b00000011,
        "CHANNEL": (decoded[11] & 0b00111100) >> 2,
        "TB_VALID": (decoded[11] & 0b01000000) >> 6,
        "TX_COMPLETE": (decoded[11] & 0b10000000) >> 7,
        "DIAGNOSTIC_MODE": decoded[12] & 0b00000001,
        "LEVEL": (decoded[12] & 0b00001100) >> 2,
    }

    return decoded_dict
```

## Ensuring Successful Transmission & Optimization

### Diagnostic Mode
A report is sent immediately after each transmission.  
Monitor the **TX_COMPLETE** bit in the report to know when the modem is ready for the next 2-byte packet. This approach maximizes overall throughput.

### Transparent Serial Mode
Send 2 bytes, then wait at least **1.6 seconds** (the transmission duration) before sending the next 2 bytes to avoid data loss.

---

## Flash Memory Considerations
Changing the **modem mode**, **channel**, or **power level** initiates a **flash write operation**, which takes about **1 second**. During this time:

- The modem will **not respond** to commands.  
- **Do not power off** the modem to avoid corrupting settings.

Once the flash write completes, the modem resumes normal operation with the updated configuration.
