# Axes

For both the DVL-A50 and the DVL-A125.

Velocities and dead reckoning output uses the vehicle frame. By default the vehicle frame is the same as the body frame, but can be adjusted to allow flexible mounting on the vehicle.


<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 89">
  <defs>
    <marker id="leftarrowhead" markerWidth="6" markerHeight="6" refX="3" refY="3" orient="auto">
      <polygon points="6 0, 0 3, 6 6 " />
    </marker>
    <marker id="rightarrowhead" markerWidth="6" markerHeight="6" refX="3" refY="3" orient="auto">
      <polygon points="0 0, 6 3, 0 6 " />
    </marker>
  </defs>
  <text text-anchor="middle" x="30" y="5" font-size="0.3em">Body frame</text>
  <text text-anchor="middle" x="30" y="25" font-size="0.275em">x (Forward)</text>
  <text text-anchor="left" x="60" y="55" font-size="0.275em" alignment-baseline="middle">y (Right)</text>
  <line stroke="black" stroke-width="0.5" marker-start="url(#leftarrowhead)" x1="30" y1="30" x2="30" y2="80"/>
  <line stroke="black" stroke-width="0.5" marker-end="url(#rightarrowhead)" x1="5" y1="55" x2="55" y2="55"/>
  <text text-anchor="left" x="32" y="50" font-size="0.275em" alignment-baseline="middle">z (Down)</text>
  <text text-anchor="middle" x="140" y="5" font-size="0.3em">Vehicle frame</text>
  <text text-anchor="middle" x="140" y="25" font-size="0.275em">x (Vehicle)</text>
  <text text-anchor="left" x="170" y="55" font-size="0.275em" alignment-baseline="middle">y (Vehicle)</text>
  <line stroke="black" stroke-width="0.5" marker-start="url(#leftarrowhead)" x1="140" y1="30" x2="140" y2="80"/>
  <line stroke="black" stroke-width="0.5" marker-end="url(#rightarrowhead)" x1="115" y1="55" x2="165" y2="55"/>
  <g transform="rotate(30, 140, 55)">
  <line stroke="black" stroke-width="0.5" marker-start="url(#leftarrowhead)" x1="140" y1="30" x2="140" y2="80"/>
  <line stroke="black" stroke-width="0.5" marker-end="url(#rightarrowhead)" x1="115" y1="55" x2="165" y2="55"/>
  <text text-anchor="middle" x="150" y="27.5" font-size="0.275em">x (Body)</text>
  <text text-anchor="left" x="160" y="50" font-size="0.275em" alignment-baseline="middle">y (Body)</text>
  </g>
  <text text-anchor="left" x="142" y="42.5" font-size="0.275em" alignment-baseline="middle">θ</text>
  <path d="M 140 45 a 4 4 0 0 1 4.5 2" fill="none" stroke="black" stroke-width="0.5"/>
  <!--- the path above gives an arc-ish figure but i have no idea how to do this properly -->
</svg>


## Body frame

The body frame axes of the DVL are as follows:

* X axis is pointing forward (LED is forward, cable backward)
* Y axis is pointing right
* Z axis is pointing down (mounting holes are up, transducers are down)

By default, the body frame and vehicle frame is the same and align with the DVL's [frame](../dead-reckoning#frame) for dead reckoning.

## Vehicle frame

The DVL can be mounted at an angle to the forward direction of a vehicle to which it is attached.

To be precise, the clockwise angle θ in degrees around the Z axis (i.e. in the X-Y plane) from the forward axis of the vehicle to the forward axis of the DVL can be entered as a 'mounting rotation offset' in the [GUI](../gui/configuration), or via the TCP or serial [protocols](../dvl-protocol/).

The DVL will then output data in the vehicle frame obtained by rotating the [DVL body frame](#body-frame) anti-clockwise around the Z-axis by θ  degrees: the X-axis of the velocities outputted by the DVL will be aligned with the forward axis of the vehicle, and, at time zero, the X-axis of the DVL's [frame](../dead-reckoning#frame) for dead reckoning will be aligned with the forward axis of the vehicle.

For example:

* If the DVL is mounted back-to-front (cable aligned with the forward axis of the vehicle), the mounting rotation offset should be set to 180 degrees.

* If the DVL is mounted with the LED at 90 degrees clockwise from the forward axis of the vehicle, the mounting rotation offset should be set to 90 degrees.
