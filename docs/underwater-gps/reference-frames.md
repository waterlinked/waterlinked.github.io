# Reference frames

UGPS G2 outputs positions in two reference frames: a _global_ frame and an _acoustic_ frame. The position in the global frame is obtained by combining the position in the acoustic frame with global GPS data and orientation data from the topside unit's built-in GPS antenna and IMU.

![reference_systems](../../img/reference_systems_g2.png)

## Global frame

The positions of the global frame are in terms of latitude and longitude, as defined by the WGS 84 standard. The _Map position_ tab in the _Position_ panel of the GUI plots this position.

## Acoustic frame

The x-axis of the acoustic frame is defined by the 'Forward' direction of the topside housing (indicated by a label on the lid, as shown in the figure below). The y-axes and z-axes are defined to be 'east' and 'down' respectively in relation to this x-axis.<br><br>

![reference_system_pelicase](../../img/reference_system_pelicase_g2.png)

<br>

The default origin is a point on the topside housing, but can be taken to be anywhere: it is entirely defined by the positioning of the antenna/receivers with respect to it. If using an antenna, it may help intuitively to take the origin to be the base of the antenna, which can be achieved by setting both *Distance to topside housing* fields to 0 under *Baseline -> Antenna configuration -> Advanced settings*.

!!! Note
    The axes of the acoustic frame in the first version of UGPS, the [Explorer Kit](../../explorer-kit/quickstart), were slightly different: it was the y-axis which was aligned with the forward direction of the topside housing, and the x-axis which was to the 'east' of this.
