**Q1: Do I need to calibrate the IMU each time I power on the DVL?**

**A1:** No. If you use the latest software revision it will be saved in memory.

**Q2: Will the temperature effect the IMU?**

**A2:** Yes, the IMU will perform different under different temperatures then what it was calibrated at.

**Q3: Why does the yaw angle change rapidly?**

**A3:** Yaw angle in the DVL GUI seems to increase or otherwise change rapidly
This is likely due to the DVL's gyrometer not having being calibrated. See the following for more on the calibration.

[Calibrate the IMU](dead-reckoning.md#starting-dead-reckoning)

If only the velocity output of the DVL is required, this can be ignored, as the yaw angle is not used in the velocity algorithms. It is only if the DVL's dead reckoning functionality will be used that the yaw angle is relevant and calibration is needed.

**Q4: Can we test/operate the DVL in air?**

**A4:** You will **not** be able to get valid velocity measurements in air. It is possible to power the DVL while out of the water for a short period of time, but the DVL will warm up relatively quickly, and if possible we recommend to avoid this.

A great setup to work with the DVL in a lab is to keep it submerged in a small bucket of water.

We know that it may be impractical to completely avoid using the DVL in air when it is mounted. An option is to disable the acoustics of the DVL when it is out of the air, which will slow down the heating up. There is an option for this in the DVL GUI under 'Configuration'.

If you do use the DVL in air, we strongly recommend to make sure that the software is on version 2.0.8 or higher, as the DVL will then shut down if it reaches a too high temperature.

**Q5: What is the connector on the DVL?**

**A5:** How to connect to the DVL over ethernet or serial

The DVL A50/A125 is supplied with cable tail which has an interface board attached, containing an ethernet connector allowing you to simply plug an ethernet cable to connect to your computer. The interface board also allows for serial output: from Revision 4, there is a Micro-USB port, and one can simply plug in a USB cable from it to your computer. In earlier revisions, the interface board contains a UART interface which can be soldered too.

The interface can be removed when the DVL is mounted permanently on a vehicle, in which case the wiring interface should be referred to, allowing set-up of ethernet and/or serial as required. Water Linked does not provide a connector for this purpose.

**Q6: Can the DVL be used as an ADCP?**

**A6:** No. The algorithms in the DVL are specifically designed to work with reflections from the sea floor. An ADCP relies on reflections from particles in the water at different depths, which would require slightly different treatment.

**Q7: DVL looses connection?**

**A7:** If, for example when testing the DVL in a bucket, the DVL periodically loses connection (i.e. some data is received but then connection is lost, and this pattern repeats), the most likely explanation is insufficient power/current being supplied to the DVL. Please try a power supply with a higher voltage and current capability (i.e. 18V with up to 2A draw, or 24V with up to 1.5A draw, or similar).

It can also be a sign of a bad connection. If the DVL has been working properly until it suddenly start loosing connection it is recommended to check the cable for damage and the termination of the DVL to your ROV computer. 

**Q8: What is the Source level (dB re 1 μPa @ 1 m)?**

**A8:** The transmit source level have a maximum of 200 dB.

**Q9: Can the DVL overheat?**

**A9:** The DVL has a thermal shutdown to prevent temperatures that can damage the DVL. The DVL will give a warning that it will soon do a thermal shutdown. Please see [Protocol](dvl-protocol.md). It will shutdown at 55℃ and when it reaches below 50℃ it will automatically turn it self on an continue where it left off before the shutdown.  It will continue in a loop with shutdown and rebooting if the overheating issue is not addressed. 