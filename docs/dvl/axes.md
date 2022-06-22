# Axes

For both the DVL-A50 and the DVL-A125.

## Body frame

The body frame axes of the DVL are as follows:

* X axis is pointing forward (LED is forward, cable backward)
* Y axis is pointing right
* Z axis is pointing down (mounting holes are up, transducers are down)

By default, the velocities outputted by the DVL are in this frame, and the axes align at time zero with those of the DVL's [frame](../dead-reckoning#frame) for dead reckoning.

## Vehicle frame

The DVL can be mounted at an angle to the forward direction of a vehicle to which it is attached.

To be precise, the clockwise angle θ in degrees around the Z axis (i.e. in the X-Y plane) from the forward axis of the vehicle to the forward axis of the DVL can be entered as a 'mounting rotation offset' in the [GUI](../gui/configuration), or via the TCP or serial [protocols](../dvl-protocol/).

The DVL will then output data in the vehicle frame obtained by rotating the [DVL body frame](#body-frame) anti-clockwise around the Z-axis by θ  degrees: the X-axis of the velocities outputted by the DVL will be aligned with the forward axis of the vehicle, and, at time zero, the X-axis of the DVL's [frame](../dead-reckoning#frame) for dead reckoning will be aligned with the forward axis of the vehicle.

For example:

* If the DVL is mounted back-to-front (cable aligned with the forward axis of the vehicle), the mounting rotation offset should be set to 180 degrees.

* If the DVL is mounted with the LED at 90 degrees clockwise from the forward axis of the vehicle, the mounting rotation offset should be set to 90 degrees.
