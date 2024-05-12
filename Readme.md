# HTC HD7 ROMHDR Reversing

## ROMHDR

The ROMHDR located in NK.bin of WP7 for HD7, with values in little-endian format:

```hex
8E EF 01 40 // dllfirst
00 F0 03 40 // dlllast
00 00 50 80 // physfirst
88 96 96 80 // physlast
4B 00 00 00 // nummods (no TOC entry after ROMHDR)
00 A0 96 80 // ulRAMStart
00 F0 9A 80 // ulRAMFree
00 00 A0 87 // ulRAMEnd
04 00 00 00 // ulCopyEntries
B8 9F 59 80 // ulCopyOffset
00 00 00 00 // ulProfileLen
00 00 00 00 // ulProfileOffset
00 00 00 00 // numfiles
00 00 00 00 // ulKernelFlags
80 80 80 80 // ulFSRamPercent
00 00 00 00 // ulDrivglobStart
00 00 00 00 // ulDrivglobLen
C2 01       // usCPUType
02 00       // usMiscFlags
20 10 50 80 // pExtensions
00 00 00 00 // ulTrackingStart
00 00 00 00 // ulTrackingLen
```

## Framebuffer

Framebuffer location can be read from MDP fb reg, which is the same across all qsd8k devices. For HTC HD7, the Framebuffer is at `0x2e744000`.

## GPIO Layout

Max GPIO number is unknown so far; the GPIOs differ from other HTC qsd8k devices.

### GPIO List

- 29: Some display thing; after it's disabled, the screen turns blank.
- 32: Flashlight
- 100: Vibration
- 101 or 102: Seems to be panel backlight enable.

[Here](example.com) is a picture of the internals of HTC HD7.
