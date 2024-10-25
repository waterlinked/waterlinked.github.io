# Dashboard

Both the DVL-A50 and the DVL-A125 have a web-based GUI. In your favorite web browser, simply navigate to the DVL's [IP address](../../networking).

The default page is a dashboard which provides a summary and visualisation of both the velocity and [dead reckoning](../../dead-reckoning) data outputted by the DVL, as well as an indication of current status.

## Screenshot


![](../../img/dvl_gui_dashboard.png)

## Dashboard Parameters

### Doppler Velocity
Parameter                               |Description
----------------------------------------|---------------------------------------------------------------------
Speed                                   | Combined speed from x, y, z velocities.
Altitude                                | Distance from seabed to DVL (unless beams blocked by something else).
Figure of merit (See note below)        | Maximum uncertainty of measurement given in m/s.
Ping rate                               | Rate at which data velocity is being outputted (depends on velocity).
Velocity valid                          | Indicates if the velocity is valid to be used.

!!! Note
	Figure of merit (FOM) represent the maximum possible uncertainty and indicates the largest potential error in the measured speed from our DVL. This value is derived from the covariance matrix, which identifies the direction with the highest uncertainty in the sensor data. It provides a worst-case error margin. The maximum amount by which the actual speed may differ from the measured speed due to various factors from environment such as acoustic noise from other sources.

    <!-- Users can use this figure of merit to assess the reliability of the speed measurements and determine whether the level of uncertainty meets their application requirements. This value allows for better decision-making and operational planning, ensuring that even in the most challenging conditions, the DVL operates within predictable error limits.  -->

### Dead reckoning
Parameter                               |Description
----------------------------------------|------------------------------------------------------------------------------------------------------------------------
Speed                                   | Speeds in x,y,z(Downward) directions with FOM that is the Euclidean norm of the standard deviations for each direction. 
Position                                | Calculated position with FOM that is the Euclidean norm of the standard deviations for each direction. 
Roll, pitch, Yaw                        | Orientation from the gyro.

### Horizontal velocity
Graphical indication of the horizontal direction of speed.

## Vertical velocity
Graphical indication of the vertical velocity.

## Map controls

Button                                  |Description
----------------------------------------|-----------------------------------------------------------------
+/-/[ ]                                 |Zoom and fullscreen controls
![](../../img/dvl_gui_icon_arrow.png)   | Center map to dvl position
![](../../img/dvl_gui_icon_reset.png)   | Reset calculated position and start position tracking from zero.
...                                     |More
                                        |Set trail length
                                        |Set grid size
                                        |Calibrate gyro
