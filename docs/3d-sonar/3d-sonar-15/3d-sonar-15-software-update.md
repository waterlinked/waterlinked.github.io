# Software Updates

Keeping your Sonar 3D-15 up to date is highly recommended. You can update the software [automatically](#automatic-software-update) or [manually (offline)](#offline-software-update). Release notes for each version are available in the device’s [GUI](../gui/dashboard) and in the [GUI demo](https://dvl.demo.waterlinked.com/#/about).

!!! warning
    **Thermal protection is disabled during software upgrades.**  
    Make sure the Sonar 3D-15 is submerged in water (or otherwise cooled) throughout the update to prevent overheating.

---

## Automatic Software Update

1. **Connect to the Internet**  
   Connect the Sonar 3D-15’s Ethernet interface (via the I/O card) to a network with internet access.  
   
!!! Note
    If you are using a personal computer, you may need to bridge your computer’s network interfaces (e.g., Wi-Fi to Ethernet) so that the Sonar 3D-15 can reach the internet.

2. **Access the Sonar GUI**  
   In your web browser, go to:  http://[IP_ADDRESS_OF_THE_SONAR]:9000


3. **Check and Install**  
The GUI automatically checks for new software versions. If an update is found, follow the on-screen instructions to install it.

---

## Offline Software Update

1. **Get Current Version and Chip ID**  
In the Sonar GUI, select “Menu → About” to note the current software version and the **Chip ID**.

2. **Download the Update Package**  
Visit the [update server](https://update.waterlinked.com/) to locate the correct `.wlup` file for your Sonar’s Chip ID. Confirm that the downloaded version is newer than your current version.

3. **Set System Time (If Needed)**  
If you encounter an error (e.g., `Failed: Error upgrading: resize: non-zero exit code: exit status 1`), you must set the system time:
- Open the Sonar GUI and select **Configuration** → **Advanced configuration**.  
- Under **System time configuration**, choose **Manual time** and click **Set manual time**.

4. **Upload the Update File**  
Return to: http://[IP_ADDRESS_OF_THE_SONAR]:9000
Select **Software upgrade**, choose **Manual upload**, and then upload the `.wlup` file.

5. **Complete the Upgrade**  
Wait for the Sonar to finish applying the update. Keep it submerged to avoid overheating.  
After completion, the Sonar 3D-15 will reboot with the new software version.

---

If you have any questions or run into issues, please consult the release notes  and check out the [Sonar 3D-15 FAQ](../3d-sonar-15/3d-sonar-15-faq.md) or contact our support team.

