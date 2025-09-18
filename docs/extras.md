# Config file

> note that there is apprently a way to get the config file without dumping the firmware however I cannot do that with my headunit
>
> also note that this may only applied to my headunit only

A config file is located under apps folder, this file you can change how the device behave as well as override default settings.

# config.ini

> i have 2 config file for some reason? I cannot tell why there is 2 tho `config.ini` and `config+9707.ini`

if you disliked the way when the reverse camera is on the audio is muted you can change the following setting

`bBackOff=0`

this disable the mute but it still lower the volume and I unfortunately cannot figure you a way to not mute and lower volume

the other options you will have to explore yourself as for some odd reason most of the options does nothing for me ?

### `[video]`

if you planed on experimenting the config file and have the reverse line set, you can change the config file so it is the default

the layout is something like this

```
	1x,y----			---2x,y
    /                          \
   /------                ------\
  /                              \
3x,y                             4x,y                   
```

here is the default config
```
backLinePoint1X=480 
backLinePoint1Y=188 

backLinePoint2X=1178
backLinePoint2Y=188 

backLinePoint3X=353
backLinePoint3Y=326 

backLinePoint4X=1342
backLinePoint4Y=326 
```

# Boot image

You can set the boot image even if your device does not have the menu to do so (or empty like mine)

Prepare a image in jpg non-progressive the same resolution as your device screen

if you need help you can use the image in `minfs/res/stalogo1.jpg` (or similar named file) to make yours

finally name the image as `stalogo.jpg`

# Setting / updating config/boot image

grab a sd card or usb drive (depands on your headunit) create a folder called `update` and copy your `config.ini`/`stalogo.jpg` into it

power on your device and plug in the drive, it will show a prompt and restart itself with the changes you made

> Note that doing this **will** override the default config, even if you factory reset it. The only way to restore the unit back to factory state is by flashing the rom you have dumped.