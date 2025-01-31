# DVL FAQ

Below are some frequently asked questions about the DVL. Click on a question in the table of contents to the right or simply scroll down to read the FAQs.

---

## 1. Do I need to calibrate the IMU each time I power on the DVL?

No. If you use the software version 2.4.5 or later, the calibration is saved in memory.

---

## 2. Will the temperature affect the IMU?

Yes. The IMU will perform differently under temperatures that differ significantly from the conditions at which it was calibrated.

---

## 3. Why does the yaw angle change rapidly?

Yaw angle in the DVL GUI may increase or otherwise change rapidly if the DVL’s gyro has not been calibrated or temperature changes.  
Please see the following for more on calibration: [Calibrate the IMU](dead-reckoning.md#starting-dead-reckoning)

!!! Note
    If only the velocity output of the DVL is required, you can ignore changes in yaw angle. The yaw angle is only relevant (and thus calibration is needed) if the DVL’s dead reckoning functionality is used.

---

## 4. Can we test/operate the DVL in air?

You will **not** be able to get valid velocity measurements in air.  
It is possible to power the DVL out of the water for a short time, but the DVL warms up quickly. If possible, we recommend avoiding this.

A great setup for lab work is to keep the DVL submerged in a small bucket of water.

We realize it may be impractical to avoid air usage altogether when the DVL is mounted. One option is to disable the DVL’s acoustics while it is out of water to reduce heating. This option is available under **Configuration** in the DVL GUI.

!!! Note
    If you do use the DVL in air, we strongly recommend running software version 2.0.8 or higher, which allows the DVL to shut down safely if it reaches a critical temperature.

---

## 5. What is the connector on the DVL?

The DVL A50/A125 is supplied with a cable tail that includes an interface board containing:

- An Ethernet connector, allowing a direct plug-and-play link to your computer.
- A Micro-USB port (Revision 4 I/O card), enabling USB output. Simply plug a USB cable from the DVL to your computer.

Earlier revisions have a UART interface on the board, which can be soldered to for serial connections.

The interface board can be removed for permanent mounting on a vehicle. Refer to the wiring interface documentation for setting up Ethernet and/or serial connections as needed. Water Linked does not provide a specific connector for this purpose.

---

## 6. Can the DVL be used as an ADCP?

No. The DVL’s algorithms are specifically designed to track reflections from the seafloor. An ADCP requires measuring reflections from water-borne particles at various depths, which uses a different processing approach.

---

## 7. Why does the DVL lose connection?

If you notice periodic data dropouts or lost connections, there are a few common causes to consider:

1. **Insufficient Power**  

    If the DVL is not receiving enough power, you may see periodic dropouts.  

    - Try using a power supply with higher voltage/current (for instance, 18V at up to 2A or 24V at up to 1.5A).

2. **Poor Physical Connection**  

    - If the DVL was previously functioning but suddenly loses connection, inspect cables, connectors, and any terminations on the ROV or topside computer.

3. **Thermal Shutdown**  

    - To protect the DVL from damage due to overheating, it may shut down automatically. This will result in a lost connection until it cools and restarts.

---

## 8. What is the Source level (dB re 1 μPa @ 1 m)?

The maximum transmit source level is 200 dB.

---

## 9. Can the DVL overheat?

Yes. The DVL has a thermal shutdown to avoid damage. It will issue a warning before shutting down at 55℃. Once it cools below 50℃, it automatically restarts. If the overheating issue is not addressed, it may repeat this shutdown/restart cycle.

For more details, see [Protocol](dvl-protocol.md).

---

## 10. What is the latency when using the API over Ethernet?

When sending commands over TCP, the average latency is around 4 ms, with a standard deviation of 2 ms. The maximum observed latency is 13 ms.

---

## 11. Does the DVL have an RS-232 interface?

No. The DVL does **not** support RS-232. It only provides a TTL (3.3V) UART interface, which is inherently incompatible with RS-232. If RS-232 is required, you will need an external level converter.

---

## 12. What is the velocity output frequency?

The velocity output frequency varies with altitude.  
- At lower altitudes (close to the seafloor), the DVL can reach an update frequency of **15 Hz**.  
- At higher altitudes, it typically operates between **2–4 Hz**.

For more details, see [Range mode](dvl-protocol.md#range-mode-configuration). In **Auto mode**, the DVL automatically selects the range mode it deems optimal.

---

## 13. Will the DVL work over a soft seabed, such as sand?

Yes, the DVL can operate over soft bottoms. However, softer seabeds absorb more acoustic energy, which reduces the maximum altitude at which the DVL can reliably track. The degree of range reduction varies from environment to environment and may require on-site testing to determine.

---