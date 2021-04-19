# Settings

![settings](../../img/settings_g2.png)

## Locator setup

In this section you choose which locator you are using with the system and on which channel it is sending. The Water Linked default channel is 2 and this is the best channel for long distance operation. If using the Locator-U1 the channel needs to macth the rotary switch at the back of the U1. Channel overveiw can be found [here](../../channels.md).

!!! warning
    If you are using the Locator-A1, you need to provid depth information to the topside unit. Description on how to do this is found [here](api.md#providing-depth-to-system-when-using-locator-a1).


## Topside Setup

In this section you have the option to choose which GPS and IMU source you are going to use. We strongly advise to use static or external GPS when operation allow for it. Because the master-D1 electronics has a standard GPS receiver it has a standard deviation of around 2-3 meters.

How to input external GPS and IMU with the API is decribed [here](api.md).

## User preferences

In the user preferences section you can select the unit of measurments you want to use. We support both Metric and Imperial. You can also select if you want a dummy boat to be displayed on the map pages and the receiver configuration page.
