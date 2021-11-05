## Water Linked DVL protocol

This document describes the Water Linked DVL protocols (serial and ethernet).

## Terminology

* DVL - Doppler Velocity Log - Hydro-acoustic unit which uses acoustic beams to measure distance to bottom surface and the velocity which the unit is moving across the surface.
* ACK - Acknowledgement. The command issued was successful.
* NAK - Negative acknowledgement. The command issued failed.

## Version

This document describes protocol version 2.0.x (major.minor.patch)

The protocol versioning follows semantic versioning in that:

- MAJOR version increments represent incompatible API changes
- MINOR version increments represent added functionality in a backwards-compatible manner
- PATCH version increments represent backwards-compatible bug fixes

## Serial Protocol

### Overview

The serial communication format is 115200 8-N-1 (no hardware flow control).

Packets sent to and received from the DVL start with a `w` and end with LF or CR+LF. The packet format is:

| Start byte | Direction        | Command  | Options (0 to many)  | Checksum | End byte       |
|------------|------------------|----------|----------------------|----------|----------------|
| `w`        | `c` or `r`       | `x`      | `,[option]`          | `*xx`    | `\n` or `\r\n` |

Direction is command (`c`) for commands issued to the DVL and the DVL replies with direction set to response (`r`).
The commands can be sent as a string or entered one char at a time from a terminal.

The protocol can support Water Linked DVLs with different feature sets.
To support any Water Linked DVL the connection procedure is to:

- Get protocol version. Verify that the major version number is 2.
- Get product detail. Verify product type is dvl.

!!!note
    Checksum is optional when sending commands to the DVL. The DVL always returns a checksum. The checksum algorithm
    is CRC-8 and it is formatted as a hexadecimal number using 2 lower-case charaters (ex: `*c3`). See [below](#checksum) for details.

### Commands

Commands in the table are shown **without** the checksum for readability.

| Command | Description | Response | Description |
|---------|-------------|----------|-------------|
| `wcv`   | Get protocol version | `wrv,`*[major],[minor],[patch]* | Protocol version. eg: `wrv,2.1.0` |
| `wcw`   | Get product detail | `wrw,`*[name]*,*[version]*,*[chipID]*,*[IP address]* | Where type is dvl, name is product name, version is software version, chip ID is the chip ID and _optionally_ the IP address if connected to DHCP server: eg: `wrw,dvl-a50,1.4.0,0xfedcba98765432` or `wrw,dvl-a50,1.4.0,0xfedcba98765432,10.11.12.140` |
|         |             |          |              |
|         |             | `wrx,`*[details below]* | Velocities measured. See details below |
|         |             | `wr?` | Malformed request: Response when packet cannot be understood |
|         |             | `wr!` | Malformed request: Packet does not match the given checksum |

### Velocity report

A velocity report is outputted after each measurement has been completed. The expected update rate varies depending on the altitude, but will be in the range 2-26 Hz.

The X, Y, Z axes are with respect to the body frame of the DVL, oriented as marked on the DVL, and as summarised in the section [Axis conventions](../dvl-a50-details/#axis-conventions) of this manual.

The report is in the following format:
`wrx,`*[time],[vx],[vy],[vz],[fom],[altitude],[valid],[status]*

| Variable | Description |
|----------|-------------|
| time | Milliseconds since last velocity report (ms) |
| vx | Measured velocity in x direction (m/s) |
| vy | Measured velocity in y direction (m/s) |
| vz | Measured velocity in z direction (m/s) |
| fom | Figure of merit, a measure of the accuracy of the measured velocities  (m/s) |
| altitude | Measured altitude to the bottom (m) |
| valid | If valid is "y", the DVL has lock on the bottom and the altitude and velocities are valid (y/n) |
| status | 0 for normal operation, 1 for high temperature warning |

Example where velocities are valid:

```
wrx,112.83,0.007,0.017,0.006,0.000,0.93,y,0*d2
wrx,140.43,0.008,0.021,0.012,0.000,0.92,y,0*b7
wrx,118.47,0.009,0.020,0.013,0.000,0.92,y,0*54
```

Example where velocities and altitude are not valid and a high temperature warning occurs:

```
wrx,1075.51,0.000,0.000,0.000,2.707,-1.00,n,1*04
wrx,1249.29,0.000,0.000,0.000,2.707,-1.00,n,1*6a
wrx,1164.94,0.000,0.000,0.000,2.707,-1.00,n,1*39
```

### Transducer report

A transducer report is outputted after each measurement has been completed. The expected update rate varies depending on the altitude and will be in the range is from 2-26 Hz.

The report provides the distances measured from each transducer, in the following format:
`wrt,`*[dist_1],[dist_2],[dist_3],[dist_4]*

| Variable | Description |
|----------|-------------|
| dist_1 | Measured distance to bottom from transducer 1 (m) |
| dist_2 | Measured distance to bottom from transducer 2 (m) |
| dist_3 | Measured distance to bottom from transducer 3 (m) |
| dist_4 | Measured distance to bottom from transducer 4 (m) |

Example where all distances are valid:

```
wrt,15.00,15.20,14.90,14.20*b1
wrt,14.90,15.10,14.80,14.10*ac
```

Example where distance is not valid for transducer 4:

```
wrt,14.90,15.10,14.80,-1.00*53
wrt,15.00,15.20,14.90,-1.00*71
```

### Dead reckoning position report

A local position report outputs the current position of the DVL as calculated by [dead reckoning](../dead-reckoning). The expected update rate is 5 Hz. The orientation of the DVL in terms of roll, pitch and yaw angles is included along with the position.

The position and orientation data is all in an Earth-related (NED) reference frame defined by the position of the X, Y, Z axes of the DVL upon the last pressing of the reset button ![](../img/dvl_gui_icon_reset.png) in the dashboard, as described in the [Orientation](../dead-reckoning/#orientation) section of the manual page on the DVL's dead reckoning.

The format is:
`wrp,`*[time_stamp],[x],[y],[z],[pos_std],[roll],[pitch],[yaw],[status]*

Variable    | Description
------------|-------------
time_stamp  | Time stamp (milliseconds since last press of reset button)
x           | Distance in X direction (m)
y           | Distance in Y direction (m)
z           | Distance in downward direction (m)
pos_std     | Standard deviation (Figure of merit) for position
roll        | Rotation around X axis
pitch       | Rotation around Y axis
yaw         | Rotation around Z axis (heading)
status      | Reports if there are any issues with the DVL. 0 means no errors |

Example where position is valid:

```
wrp,49056.809,0.41,0.15,1.23,0.4,53.9,13.0,19.3,0*de
wrp,49057.269,0.39,0.18,1.23,0.4,53.9,13.0,19.3,0*e2
```

Example where position is not valid:

```
wrp,49056.809,0.41,0.15,1.23,0.4,53.9,13.0,19.3,1*d9
wrp,49057.269,0.39,0.18,1.23,0.4,53.9,13.0,19.3,1*e5
```

### Checksum

The checksum algorithm is CRC-8 (Polynomal: 0x07, Init: 0x00, RefIn/RefOut: false, XorOut: 0x00, Check: 0xf4).
Checksum is formatted as a hexadecimal number using 2 lower-case charaters (ex: `*c3`).

Compatible implementations:

* Python 3: [crcmod](https://pypi.org/project/crcmod/) `crcmod.predefined.mkPredefinedCrcFun("crc-8")`
* Golang: [github.com/sigurn/crc8](github.com/sigurn/crc8) `crc8.MakeTable(crc8.CRC8)`

Example for how to verify checksum using Python 3 and [crcmod](https://pypi.org/project/crcmod/):

```
crc = crcmod.predefined.mkPredefinedCrcFun("crc-8")
sentence = b"wrx,1164.94,0.000,0.000,0.000,2.707,-1.00,n,1*39"
data, checksum = sentence.split(b"*")

if crc(data) == int(checksum, 16):
    print("CRC valid")
else:
    print("CRC invalid")
```

The [crcmod](https://pypi.org/project/crcmod/) python package can generate code in other languages. Here is an example (subject to the [MIT License](https://opensource.org/licenses/MIT)) for C which should be straightforward to adapt to other languages.

```
static const uint8_t lookup_table[256] = {
    0x00U,0x07U,0x0EU,0x09U,0x1CU,0x1BU,0x12U,0x15U,
    0x38U,0x3FU,0x36U,0x31U,0x24U,0x23U,0x2AU,0x2DU,
    0x70U,0x77U,0x7EU,0x79U,0x6CU,0x6BU,0x62U,0x65U,
    0x48U,0x4FU,0x46U,0x41U,0x54U,0x53U,0x5AU,0x5DU,
    0xE0U,0xE7U,0xEEU,0xE9U,0xFCU,0xFBU,0xF2U,0xF5U,
    0xD8U,0xDFU,0xD6U,0xD1U,0xC4U,0xC3U,0xCAU,0xCDU,
    0x90U,0x97U,0x9EU,0x99U,0x8CU,0x8BU,0x82U,0x85U,
    0xA8U,0xAFU,0xA6U,0xA1U,0xB4U,0xB3U,0xBAU,0xBDU,
    0xC7U,0xC0U,0xC9U,0xCEU,0xDBU,0xDCU,0xD5U,0xD2U,
    0xFFU,0xF8U,0xF1U,0xF6U,0xE3U,0xE4U,0xEDU,0xEAU,
    0xB7U,0xB0U,0xB9U,0xBEU,0xABU,0xACU,0xA5U,0xA2U,
    0x8FU,0x88U,0x81U,0x86U,0x93U,0x94U,0x9DU,0x9AU,
    0x27U,0x20U,0x29U,0x2EU,0x3BU,0x3CU,0x35U,0x32U,
    0x1FU,0x18U,0x11U,0x16U,0x03U,0x04U,0x0DU,0x0AU,
    0x57U,0x50U,0x59U,0x5EU,0x4BU,0x4CU,0x45U,0x42U,
    0x6FU,0x68U,0x61U,0x66U,0x73U,0x74U,0x7DU,0x7AU,
    0x89U,0x8EU,0x87U,0x80U,0x95U,0x92U,0x9BU,0x9CU,
    0xB1U,0xB6U,0xBFU,0xB8U,0xADU,0xAAU,0xA3U,0xA4U,
    0xF9U,0xFEU,0xF7U,0xF0U,0xE5U,0xE2U,0xEBU,0xECU,
    0xC1U,0xC6U,0xCFU,0xC8U,0xDDU,0xDAU,0xD3U,0xD4U,
    0x69U,0x6EU,0x67U,0x60U,0x75U,0x72U,0x7BU,0x7CU,
    0x51U,0x56U,0x5FU,0x58U,0x4DU,0x4AU,0x43U,0x44U,
    0x19U,0x1EU,0x17U,0x10U,0x05U,0x02U,0x0BU,0x0CU,
    0x21U,0x26U,0x2FU,0x28U,0x3DU,0x3AU,0x33U,0x34U,
    0x4EU,0x49U,0x40U,0x47U,0x52U,0x55U,0x5CU,0x5BU,
    0x76U,0x71U,0x78U,0x7FU,0x6AU,0x6DU,0x64U,0x63U,
    0x3EU,0x39U,0x30U,0x37U,0x22U,0x25U,0x2CU,0x2BU,
    0x06U,0x01U,0x08U,0x0FU,0x1AU,0x1DU,0x14U,0x13U,
    0xAEU,0xA9U,0xA0U,0xA7U,0xB2U,0xB5U,0xBCU,0xBBU,
    0x96U,0x91U,0x98U,0x9FU,0x8AU,0x8DU,0x84U,0x83U,
    0xDEU,0xD9U,0xD0U,0xD7U,0xC2U,0xC5U,0xCCU,0xCBU,
    0xE6U,0xE1U,0xE8U,0xEFU,0xFAU,0xFDU,0xF4U,0xF3U,
};

uint8_t crc8(uint8_t *message, int message_length) {
    uint8_t checksum = 0;
    while (message_length > 0) {
        checksum = lookup_table[*message ^ checksum];
        message++;
        message_length--;
    }
    return checksum;
}
```

## Ethernet protocol (TCP)

### Overview

The DVL supports sending velocity, transducer, and position updates using the Transmission Control Protocol (TCP). The DVL runs a TCP server on port 16171.

The format of each packet is JSON.

### Velocity and transducer report

A velocity and transducer report is outputted after each measurement has been completed. The expected update rate varies depending on the altitude, but will be in the range 2-26 Hz.

The X, Y, Z axes are with respect to the body frame of the DVL, oriented as marked on the DVL, and as summarised in the section [Axis conventions](../dvl-a50-details/#axis-conventions) of this manual.

The messages are delimited by newline.

| Variable | Description |
|----------|-------------|
| time | Milliseconds since last velocity report (ms) |
| vx | Measured velocity in x direction (m/s) |
| vy | Measured velocity in y direction (m/s) |
| vz | Measured velocity in z direction (m/s) |
| fom | Figure of merit, a measure of the accuracy of the measured velocities  (m/s) |
| altitude | Measured altitude to the bottom  (m) |
| transducers | Is a list containing information from each transducer: [id, velocity, distance, rssi, nsd, beam_valid] |
| velocity_valid | If valid is true the DVL has lock on the bottom and the altitude and velocities are valid (true/false) |
| status | Reports if there are any issues with the DVL. 0 means no errors |
| format | Format type and version for the velocity report , eg "json_v2"|
| type | Report type. For velocity report it will be "velocity" |

Example of TCP report (indented for legibility)

```
{
  "time": 170.52674865722656,
  "vx": -0.00563613697886467,
  "vy": -0.007631152402609587,
  "vz": -0.007641898933798075,
  "fom": 0.001959984190762043,
  "altitude": 0.6173566579818726,
  "transducers": [
    {
      "id": 0,
      "velocity": -0.007625679485499859,
      "distance": 0.6769760251045227,
      "rssi": 38.66838836669922,
      "nsd": 18.295578002929688,
      "beam_valid": true
    },
    {
      "id": 1,
      "velocity": -0.0034413286484777927,
      "distance": 0.6769760251045227,
      "rssi": 35.403541564941406,
      "nsd": 19.518909454345703,
      "beam_valid": true
    },
    {
      "id": 2,
      "velocity": -0.006717036943882704,
      "distance": 0.6653040051460266,
      "rssi": 41.03888702392578,
      "nsd": 20.25017738342285,
      "beam_valid": true
    },
    {
      "id": 3,
      "velocity": -0.01045388076454401,
      "distance": 0.6536320447921753,
      "rssi": 31.09071922302246,
      "nsd": 17.366933822631836,
      "beam_valid": true
    }
  ],
  "velocity_valid": true,
  "status": 0,
  "format": "json_v1",
  "type": "velocity"
}
```

### Dead reckoning position report

A local position report outputs the current position of the DVL as calculated by [dead reckoning](../dead-reckoning). The expected update rate is 5 Hz. The orientation of the DVL in terms of roll, pitch and yaw angles is included along with the position.

The position and orientation data is all in an Earth-related (NED) reference frame defined by the position of the X, Y, Z axes of the DVL upon the last pressing of the reset button ![](../img/dvl_gui_icon_reset.png) in the dashboard, as described in the [Orientation](../dead-reckoning/#orientation) section of the manual page on the DVL's dead reckoning.


Variable    | Description
------------|-------------
ts          | Time stamp (milliseconds since last press of reset button)
x           | Distance in X direction (m)
y           | Distance in Y direction (m)
z           | Distance in downward direction (m)
std         | Standard deviation (Figure of merit) for position
roll        | Rotation around X axis
pitch       | Rotation around Y axis
yaw         | Rotation around Z axis (heading)
type        | Report type: "position_local"
status      | Reports if there are any issues with the DVL. 0 means no errors
format      | Format type and version for the position report, e.g. "json_v2"


Example of position report.

```
{
  "ts": 49056.809,
  "x": 12.43563613697886467,
  "y": 64.617631152402609587,
  "z": 1.767641898933798075,
  "std": 0.001959984190762043,
  "roll": 0.6173566579818726,
  "pitch": 0.6173566579818726,
  "yaw": 0.6173566579818726,
  "type": "position_local",
  "status": 0,
  "format": "json_v2"
}

```
