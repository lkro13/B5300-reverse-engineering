# How-To: Flash the firmware

This tutorial explains how to flash your SPI flash ROM chip with a new `firmware.bin`.

## Important!

> 🛑 **Important!** 🛑 Make sure you've got a verified working backup of your original .bin before overwriting it!

## Instructions

~~WIP...~~

# Flashing

reattach the probe like before and run the follow command

```bash
sudo flashrom --programmer ch341a_spi -w <new firmware>
```

power on your device to check the result

*This section is written with the help of winraid forums*
