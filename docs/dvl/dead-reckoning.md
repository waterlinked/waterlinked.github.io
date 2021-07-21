## Introduction

The DVL-A50 and DVL-A125 has integrated IMU (Inertial Measurement Unit). The DVL runs dead reckoning algorithm which estimates orientation and position of the DVL. The current implementation is a beta release of the algorithm.

## Orientation

The orientation of the DVL is calculated based on the accelerometer and gyro measurements along three axes. The orientation is represented by roll, pitch and yaw angles. The orientation can be viewed in a [map](../gui/dashboard/) or be read from the [API](../dvl-protocol/#local-position).

- roll is a rotation around X axis of the DVL
- pitch is a rotation around Y axis of the DVL
- yaw is a rotation around Z axis of the DVL

For the DVL axes orientation see [details](../dvl-a50-details/).
For orientation to function correctly, it is expected that DVL is oriented with Z axis pointing downwards and X and Y axes being horizontal. 
!!! note
    A small tilt in the DVL mounting will result in almost no position error along X and Y axes, but change of position in Z-axis (Down direction) may look significant. This change will be the projection of the true horizontal positon onto Z axis of the DVL. For example, when the DVL is mounted with 5&#176; tilt and the horizontal displacement of the DVL is 100 m since last reset, the total displayed distance in X, Y direction will be 99.6 m and the Down position will be &pm;9 m. 

When the reset button ![](../img/dvl_gui_icon_reset.png) is pressed in the [map](../gui/dashboard/#map-controlls). The current angles are set to zero, this instant orientation in the Earth related reference frame is further used as a reference coordinate system, for the output orientation angles, speed and position. 

!!! note
    Yaw angle may experience drift. The drift can be decreased down to 0.1-0.3&#176 per minute after compensation for gyro bias. This is done by pressing **Calibrate gyro** in the [map](../gui/dashboard/#map-controlls).

## Speed and Position

The speed and position are calcualted by the integration of the acceleration corrected by the measured speed. The displayed speed and position corresponds to the Earth related reference frame which is defined by the DVL orientation when the reset button ![](../img/dvl_gui_icon_reset.png) was pressed last time. 

When the DVL fails to measure velocity with the use of transducers, position is predicted only by acceleration. This will result in large position error which will be indicated by increase of the figure of merit (FOM). FOM represents estimated standard deviation of the position in the XY plane.

!!! note
    When the DVL is powered on in the air, the resulting position will drift significantly and should be ignored. The reset ![](../img/dvl_gui_icon_reset.png) should be pressed in the [map](../gui/dashboard/#map-controlls) before start of each dead reckoning.

The position can be viewed in a [map](../gui/dashboard/) or be read from the [API](../dvl-protocol/#local-position)
