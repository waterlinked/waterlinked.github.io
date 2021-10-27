# Warnings

Warnings that you might experience will using UGPS.

| Message | Solution |
|---------|----------|
| No external depth received. Is it being sent correctly? | The Underwater GPS is not receiving the depth of the Locator from the ROV. This normally means software on the ROV is not working correctly. Details on how the depth is sent to the system can be found [here](../integration/api.md#providing-depth-to-system-when-using-locator-a1). |
| No signal from Locator-U1. Have you selected the correct channel? | Verify that the Locator-U1 is powered on and that it has GPS lock (See [LED signals](../../locators/locator-u1.md#led-signals) ). Verify that the same channel is selected on the settings page and the Locator rotary switch. Verify that the Locator and Receivers are in the water |
| Missing GPS lock/position. Please provide me with an unobstructed view of the sky | The Underwater GPS needs GPS lock for time sync purposes. Move the Topside to another location where it has better view of the sky. |
| Locator-D1 not detected. Please verify connection. | Locator-D1 selected but not detected by the Master-D1. Verify connection. |
| Receiver N not detected. Please verify connection. | Receiver N is not detected by the Master-D1. Verify connection. |
| External satellite position is required but not received. | External position is selected, but not received via the [API](http://demo.waterlinked.com/swagger/#/external/external#SetMaster). Typically this is an external software not started or not working. |
| External orientation is required but not received. | External orientation is selected, but not received via the [API](http://demo.waterlinked.com/swagger/#/external/external#SetMaster). Typically this is an external software not started or not working. |
| IMU is not calibrated: position will not be accurate. Please rotate the kit to calibrate or use external orientation source. | See [IMU calibration](../hardware.md#imu-calibration) for details on how calibrate. |
| GPS has no position, please provide me with an unobstructed view of the sky. | The Underwater GPS needs GPS lock for time sync proposes. Move the Topside to another location where it has better view of the sky. |
