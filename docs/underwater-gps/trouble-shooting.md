# Trouble shooting

If you are experiencing issues with the Underwater GPS look at the following points to help you trouble shoot.

## Resolving errors

The top right corner of the GUI shows error messages from the Underwater GPS. Positioning will not work until they are resolved. The table below describes the error messages and how to solve the problem.

| Message | Solition |
|---------|----------|
| No external depth received. Is it being sent correctly? | The Underwater GPS is not receiving the depth of the Locator from the ROV. This normally means software on the ROV is not working correctly. Details on how the depth is sent to the system can be found [here](gui/api.md#providing-depth-to-system-when-using-locator-a1s1). |
| No signal from Locator-U1. Have you selected the correct channel? | Verify that the Locator-U1 is powered on and that it has GPS lock (See [LED signals](../locators/locator-u1.md#led-signals) ). Verify that the same channel is selected on the settings page and the Locator rotaty switch. Verify that the Locator and Receivers are in the water |
| Missing GPS lock/position. Please provide me with an unobstructed view of the sky | The Underwater GPS needs GPS lock for time sync purposes. Move the Topside to another location where it has better view of the sky. |
| Locator-D1 not detected. Please verify connection. | Locator-D1 selected but not detected by the Master-D1. Verify connection. |
| Receiver N not detected. Please verify connection. | Receiver N is not detected by the Master-D1. Verify connection. |
| External satellite position is required but not received. | External position is selected, but not received via the [API](http://demo.waterlinked.com/swagger/#/external/external#SetMaster). Typically this is an external software not started or not working. |
| External orientation is required but not received. | External orientation is selected, but not received via the [API](http://demo.waterlinked.com/swagger/#/external/external#SetMaster). Typically this is an external software not started or not working. |
| IMU is not calibrated: position will not be accurate. Please rotate the kit to calibrate or use external orientation source. | See [IMU calibration](hardware.md#imu-calibration) for details on how calibrate. |
| GPS has no position, please provide me with an unobstructed view of the sky. | The Underwater GPS needs GPS lock for time sync porpuses. Move the Topside to another location where it has better view of the sky. |

## Network setup

* Are you able to see the Underwater GPS GUI?
* Are you connected to the UnderwaterGPS WiFi?
* What is the setting of the switch for configuring ethernet network?
* If the switch is set to a static IP: Have you configured a static IP for your computer?
* Are you connecting directly to the Master-D1 or is your computer on the same network?

## Generic

* Are you running the latest software version?
* Are there any warnings displayed in the GUI?

## Receiver setup

* Are the Receivers connected to the correct ports (numbered 1-4) on the Topside?
* Have you measured the distances to the Recivers correctly and are the distances matching the measurements in the Receiver setup of the GUI?
* Is the search range matching the operational area?
* If Receivers are on a line, have you limited the search area to one side of the "line"?
* Try lift Receiver 1 out of the water and verify that Receiver 1 has a flat signal in the diagnostic view. Repeat for the other Receivers. This helps verify that you have connected correctly.

## Settings

* Have you selected the correct channel when using Locator-U1?
* If you are statinary: Have you selected a static position for the GPS and IMU?
* If you are moving: Have you selected on-board (or external) GPS and IMU?

## Diagnostic page

* Is there signal from all of the Receivers?
* Is there a significant peek in the signal for each Receiver?
* Is there noise from a nearby echo sounder which is causing acoustic interference? Such interference can be seen in the diagnostic view. See [diagnostic explanation](gui/diagnostic.md) for more details.
