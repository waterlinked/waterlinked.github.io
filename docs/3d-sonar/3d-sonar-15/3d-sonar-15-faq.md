# Sonar 3D-15 FAQ

Below are some frequently asked questions about the Sonar 3D-15. Click on a question in the table of content to the right or simply scroll down to read the FAQ's. 

---

## 1. What is the maximum depth rating of the Sonar 3D-15?
The Sonar 3D-15 is rated for depths up to 300 m, ensuring reliable performance in a wide range of underwater environments.

---

## 2. What kind of power supply is recommended?
We recommend using a power supply capable of delivering 60 W peak (surge) at 10–30 V. For optimal performance, a 20 V or higher supply is preferred.

---

## 3. Does the Sonar 3D-15 have a thermal shutdown mechanism?
Yes. The Sonar 3D-15 includes an internal thermal shutdown to prevent damage to its electronics. You will receive a warning in both the GUI and the API if the internal temperature reaches 50 °C, indicating that the unit will shut down at 55 °C if it continues to heat up.

**Recommended action:**  
- Once you see the overheat warning (50 °C), immediately place the Sonar 3D-15 in water or use another method to cool it down.  
- If the temperature reaches 55 °C, the Sonar 3D-15 will shut down to prevent permanent damage and not restart before it reaches 50°C again.

---

## 4. What are the default network settings of the Sonar 3D-15?
By default, the Sonar 3D-15 uses **DHCP** (Dynamic Host Configuration Protocol). This means it attempts to get an IP address automatically from a DHCP server on your network.

However, the Sonar 3D-15 is always accessible via its **fallback IP** `192.168.194.96`, even if no DHCP server is present. To use the fallback IP, configure your computer's network interface to an IP address in the `192.168.194.x` range (e.g., `192.168.194.100`) with a netmask of `255.255.255.0`.

### Can I disable DHCP and set a static IP?
Yes, you can disable DHCP in the config settings in the GUI and specify a custom static IP address. This is helpful if you need a fixed IP in your networking environment.

---

## 5. Is any software installation required to operate the Sonar 3D-15?
No, there is no software installation needed. Once connected and powered on, you can access the Sonar 3D-15’s built-in GUI through a standard web browser. This allows you to operate and configure the sonar without installing any additional software.

### What if I need custom integration?
For advanced integrations, you can use the Sonar 3D-15’s API to develop custom solutions. This requires some programming knowledge but enables control and automation of the Sonar 3D-15’s functionality from your custom system.

---