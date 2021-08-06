## Introduction

The DVL-A50 and DVL-A125 have an integrated IMU (Inertial Measurement Unit). The DVL runs a dead reckoning algorithm which estimates the orientation and position of the DVL. The current implementation is a beta release of the algorithm.

## Orientation

The orientation of the DVL is calculated based on its accelerometer and gyro measurements along three axes oriented as marked on the DVL, or as described in the [Axis conventions](../dvl-a50-details) section of the manual. The orientation is represented by roll, pitch and yaw angles, and can be viewed in the [dashboard map](../gui/dashboard/) or be fetched by [API](../dvl-protocol/#local-position).

- Roll is a rotation around the X axis of the DVL
- Pitch is a rotation around the Y axis of the DVL
- Yaw is a rotation around the Z axis of the DVL

For orientation to function correctly, the DVL must be deployed with the same orientation as is marked upon it or as described in the [Axis conventions](../dvl-a50-details) section of the manual, namely with the Z axis pointing downwards and X and Y axes being horizontal.

!!! note
    A small tilt in the DVL mounting will result in almost no position error along X and Y axes, but there may be a significant change along the Z axis. This change will be a projection of the true horizontal position onto the Z axis. For example, when the DVL is mounted with 5&#176; tilt and the horizontal displacement of the DVL is 100m since last reset, the total displayed distance in the X, Y plane will be 99.6 m, and the Z position will be &pm;9 m.

When the reset button ![](../img/dvl_gui_icon_reset.png) is pressed in the [dashboard map](../gui/dashboard/#map-controlls), the angles are set to zero, and the orientation of the DVL at this instant in the Earth-related (NED) reference frame is used thereafter as the reference coordinate system for the outputted speed, position, and orientation angles.

!!! note
    The yaw angle may experience drift. This drift can be decreased to 0.1-0.3&#176 per minute after compensation for gyro bias by pressing **Calibrate gyro** in the [dashboard map](../gui/dashboard/#map-controlls).

## Velocity and Position

The velocity and position of the DVL are calculated by integration of its acceleration, corrected by its measured velocity. The displayed velocity and position are with respect to the Earth-related reference frame, defined, as described above, by the DVL orientation when the reset button ![](../img/dvl_gui_icon_reset.png) was last pressed, or else at start up.

When the DVL fails in its measuring of velocity, the position is predicted only by acceleration. This will result in a large error in position, indicated by increase in the figure of merit (FOM). The FOM is an estimated standard deviation of the position in the XY plane.

!!! note
    When the DVL is powered on in the air, its position will drift significantly. This should be ignored. The reset button ![](../img/dvl_gui_icon_reset.png) should be pressed in the [dashboard map](../gui/dashboard/#map-controlls) at the start of each dead reckoning.

The position of the DVL can be viewed in the [dashboard map](../gui/dashboard/) or be fetched by [API](../dvl-protocol/#local-position).
