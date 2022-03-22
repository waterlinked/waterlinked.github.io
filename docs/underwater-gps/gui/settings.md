# Settings

![settings](../../img/settings_g2.png)

## Locator setup

Select the type of locator ([U1](../../locators/locator-u1), [A1](../../locators/locator-a1), or [D1](../../locators/locator-d1)) which you are using, and which [channel](#channel-overview) you wish to use.

!!! Note
    If using the [U1](../../locators/locator-u1) locator, the channel must match the rotary switch at the back of the U1 (screw the lid completely off to access the switch).

!!! Note
    If using the [A1](../../locators/locator-a1) locator, the depth of the locator must be inputted by means of the UGPS [API](../../integration/api).

## Channel overview

The frequency bands of the available channels are as follows. Lower frequency typically corresponds to greater range due to less acoustic absorption, though there are other factors involved: if you experience issues with signal quality (low RSSI or high NSD), try a different channel.

| From (kHz) | To (kHz) | Channel |
|-------|-------|------|
| 31.25 | 62.5  | 1 |
| 62.5  | 93.75 | 2 |
| 93.75 | 125.0 | 3 |
| 125.0 | 156.5 | 4 |
| 156.5 | 187.0 | 5 |
| 187.0 | 218.5 | 6 |
| 218.5 | 250.0 | 7 |

!!! Tip
    Typically, NSD (_Noise spectral density_, displayed in the [Diagnostic](../diagnostic) pane of the GUI) is around -100 dBm (in the units of version 3.3.0 or later of the software; 15 nV/sqrt(Hz) in the units of earlier software versions), or a little higher or lower. If it is much higher than this, it is likely that there is acoustic interference in the chosen channel, and a different channel should be tried.

    Note in particular that acoustic devices quite commonly operate at frequencies lying in Channel 1.

!!! Tip
    If the NSD values are normal, signal quality is mainly indicated by the RSSI values (_Received signal strength indicator_, displayed in the [Diagnostic](../diagnostic) pane of the GUI). As long as the RSSI values are not too far below the NSD values, the signal strength should be at usable levels.

    The UGPS system uses advanced signal processing techniques and can work even with rather weak signals, but an RSSI of -125 dBm or so (in the units of version 3.3.0 or later of the software; -45 dBnW in the units of earlier software versions) is around the lowest possible for an NSD of roughly -100 dBm.

    Typically one can expect a decrease in signal strength of around 6 dB for each doubling of distance due to spherical spreading, plus a little more due to additional absorption.

## Topside setup

For best performance, we recommend input heading data, and also global GPS data, from an external device, via the UGPS [API](../../integration/api), as such a device will likely be more accurate than the topside unit's built-in GPS receiver and IMU. If your deployment of the system allows for static GPS and/or heading values can be used, this is even better, but would typically necessitate that the topside unit is on land.

Since version 3.3.0 of the software, the heading of the topside unit must periodically be set (only the gyrometer of the built-in IMU will be used, not the magnetometer). It can be done manually (using an analogue compass, or mobile phone, etc), but we recommend if possible to input from an external device.

## User preferences

Select whether to use metric or imperial units, and/or if you would like a dummy boat to be displayed on the map and receiver configuration pages.
