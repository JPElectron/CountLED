# CountLED

Used in conjunction with the Velleman K8063 to keep count of anything, the display is updated via command-line parameters.

Tested on Windows XP, Server 2003, Vista, Server 2008, Windows 7

A scripted install/uninstall is not included with this software.

## Installation

1) Ensure this prerequisite is installed: Microsoft .NET Framework 2.0 SP2

http://www.microsoft.com/en-us/download/details.aspx?id=1639

2) Extract the contents of the .zip file
3) Modify count.ini as indicated below

## .ini Settings

ComPort=COM1

Serial port that the K8063 is connected to

Digits=2

Number of LED units (minimum of 1 / normally 2, which is one K8063 kit / maximum of 255)

[1]  or  [1][2]  or  [1][2][3][4][5]...

## Usage

Digits should be addressed from left to right looking at the front of the display, starting with 1

Run count.exe -U to up the display by 1

List of accepted parameters...

-U = Counts Up by 1

-D = Counts Down by 1

-B = Blanks every digit (off) but keeps the last count number

-E = Sends the error display of an _ (underscore) to every digit

-R = Resets every digit (all reperform the power-on self test, followed by ID display, followed by off)

-LO or -HI = Sets the brightness across all digits (remembered until reset or power off)

No argument = Every digit displays a 0 (zero) and the count is reset to start from 0

If the number that should be displayed exceeds the number of digits attached, all digits will display _ (underscore) indicating an error, until the number falls back under the number of digits attached.

## Related Links

Velleman K8063 manufacturer site - http://www.vellemanusa.com/us/enu/product/view/?id=522041

One K8063 kit includes 2 digits and is available from...

QualityKits - https://store.qkits.com/electronic-kits/led-and-lcd-clock-kits/velleman-k8063-2-digit-led-display-kit-with-serial-interface.html

Amazon - https://www.amazon.com/Velleman-K8063-MODULAR-INTERFACE-PACKAGE/dp/B001IRV6LQ

## License

GPL does not allow you to link GPL-licensed components with other proprietary software (unless you publish as GPL too).

GPL does not allow you to modify the GPL code and make the changes proprietary, so you cannot use GPL code in your non-GPL projects.

If you wish to integrate this software into your commercial software package, or you are a corporate entity with more than 10 employees, then you should obtain a per-instance license, or a site-wide license, from http://jpelectron.com/purchase.html

For all other use cases please consider: <a href='https://ko-fi.com/C0C54S4JF' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi2.png?v=2' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

[End of Line]
