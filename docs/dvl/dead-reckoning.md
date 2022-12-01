## Introduction

The DVL-A50 and DVL-A125 run a dead reckoning algorithm which estimates the orientation and position of the DVL. This uses both the velocities which the DVL calculates and its integrated IMU (Inertial Measurement Unit).

## Starting dead reckoning

1. Calibrate the gyroscope by pressing *More -> Calibrate gyro* in the [GUI](../gui/dashboard) whilst the DVL is stationary.
2. Click the 'Reset' button ![](../img/dvl_gui_icon_reset.png) in the [GUI](../gui/dashboard), or send a reset command over the TCP or serial [protocol](../dvl-protocol).

Failure to perform gyro calibration will result in less accurate dead reckoning.

## Frame

The position, speed, and roll, pitch, and yaw angles outputted by the dead reckoning algorithm are with respect to the frame defined at time zero (the time of the last reset, or else at start up) by the axes of the [body frame](../axes#body-frame) of the DVL, or the [vehicle frame](../axes#vehicle-frame) if a mounting rotation offset is set.

## Speed and position

The speed and position of the DVL are calculated by integration of its acceleration, corrected by the velocity it calculates by means of its acoustic signal processing. A Kalman filter is used; the [roll, pitch, and yaw angles](#orientation) outputted by the DVL are also part of the input.

When the DVL fails in its determination of velocity, speed and position are predicted only by acceleration. This will result in large errors, indicated by an increase in the figure of merit (FOM), which is an estimated standard deviation of the position in the X-Y plane.

!!! note
    When the DVL is powered on in the air, its position will drift significantly. This should be ignored, and dead reckoning should be [started](#starting-dead-reckoning) in water when ready.

The position of the DVL can be viewed in the GUI [dashboard](../gui/dashboard/) or be fetched by [API](../dvl-protocol/#dead-reckoning-report).

## Orientation

The calculation of the orientation of the DVL is based upon the accelerometer and gyroscope measurements of its IMU. The orientation is represented by roll, pitch, and yaw angles, and can be viewed in the GUI [dashboard](../gui/dashboard/) or be fetched by [API](../dvl-protocol/#dead-reckoning-report).

- Roll is a rotation around the X axis of the DVL
- Pitch is a rotation around the Y axis of the DVL
- Yaw is a rotation around the Z axis of the DVL

For orientation to function correctly, the DVL must be deployed in accordance with its [axis conventions](../axes).

!!! note
    A small tilt in the DVL mounting, though it will result in almost no position error with respect to the X and Y axes, may lead a significant error with respect to the Z axis. This change will be a projection of the true horizontal position onto the Z axis. For example, when the DVL is mounted with 5&#176; tilt and the horizontal displacement of the DVL is 100m since last reset, the total displayed distance in the X, Y plane will be 99.6 m, and the Z position will be &pm;9 m.

When dead reckoning is [reset](#starting-dead-reckoning), the roll, pitch, and yaw angles are set to zero.

## Yaw drift

!!! note
    The yaw angle may experience drift. This drift can be decreased to 0.1-0.3&#176 per minute by [calibration](#starting-dead-reckoning) of the gyroscope.

