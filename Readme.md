# HTC HD7 ROMHDR Reversing

## ROMHDR

The ROMHDR located in NK.bin of WP7 for HD7, with values in little-endian format:

```hex
8E EF 01 40
00 F0 03 40
00 00 50 80
88 96 96 80
4B 00 00 00
00 A0 96 80
00 F0 9A 80
00 00 A0 87
04 00 00 00
B8 9F 59 80
00 00 00 00
00 00 00 00
26 00 00 00
02 00 00 00
04 00 00 00
00 00 00 00
00 00 00 00
C2 01
02 00
20 10 50 80
00 00 00 00
00 00 00 00
```

Converted to big endian to be readable hex values, also applied the comments from HD2's CRT0.s to know which value is which in romhdr

```hex
40 01 EF 8E // dllfirst
40 03 F0 00 // dlllast
80 50 00 00 // physfirst
80 96 96 88 // physlast
00 00 00 4B // nummods (no TOCentry after ROMHDR)
80 96 A0 00 // ulRAMStart
80 9A F0 00 // ulRAMFree
87 A0 00 00 // ulRAMEnd
00 00 00 04 // ulCopyEntries
80 59 9F B8 // ulCopyOffset
00 00 00 00 // ulProfileLen
00 00 00 00 // ulProfileOffset
00 00 00 00 // numfiles
00 00 00 00 // ulKernelFlags
80 80 80 80 // ulFSRamPercent
00 00 00 00 // ulDrivglobStart
00 00 00 00 // ulDrivglobLen
C2 01 // usCPUType
00 02 // usMiscFlags
80 50 10 20 // pExtensions
00 00 00 00 // ulTrackingStart
```

## Framebuffer

Framebuffer location can be read from MDP FB reg, which is the same across all QSD8k devices. For HTC HD7, the Framebuffer is at `0x2e744000`.

## GPIO Layout

Max GPIO number is 164; the GPIOs differ from other HTC qsd8k devices.

### GPIO List

- 29: Some display thing; after it's disabled, the screen turns blank. This GPIO could be LCD_RSTz, as shown in the [HTC Desire board support header file](https://github.com/snq-/bravo-kernel/blob/2.6.32-froyo/arch/arm/mach-msm/board-bravo.h#L143).
- 32: Flashlight
- 41: Volumedown button, its configured as pulldown so if button is pressed GPIO is LOW
- 42: Power button, its configured as pulldown so if button is pressed GPIO is LOW
- 90: Camera button, its configured as pulldown so if button is pressed GPIO is LOW
- 94: Volumeup button, its configured as pulldown so if button is pressed GPIO is LOW
- 100: Vibration
- 101 or 102: Seems to be panel backlight enable.

## Board View

The board seems to be almost identical, if not identical to other HTC QSD8k devices.

| Top View                             | Bottom View                          |
| ------------------------------------ | ------------------------------------ |
| <img src="https://github.com/halal-beef/HTC-HD7-Internals/blob/main/20240521_085601.jpg" width="350">                                  | <img src="https://github.com/halal-beef/HTC-HD7-Internals/blob/main/20240521_085544.jpg" width="350">                  |
