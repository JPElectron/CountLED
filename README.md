# CountLED
Used in conjunction with the Velleman K8063 to keep count of anything, the display is updated via command-line parameters.

Tested on Windows XP, Server 2003, Vista, Server 2008, Windows 7

A scripted install/uninstall is not included with this software.

<b>Installation:</b>

1) Ensure this prerequisite is installed: Microsoft .NET Framework 2.0 SP2

http://www.microsoft.com/en-us/download/details.aspx?id=1639

2) Extract the contents of the .zip file
3) Modify count.ini as indicated below

<b>.ini Settings:</b>

ComPort=COM1

Serial port that the K8063 is connected to

Digits=2

Number of LED units (minimum of 1 / normally 2, which is one K8063 kit / maximum of 255)

[1]  or  [1][2]  or  [1][2][3][4][5]...

<b>Usage:</b>

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

<b>Related Links:</b>

Velleman K8063 manufacturer site - http://www.vellemanusa.com/us/enu/product/view/?id=522041

One K8063 kit includes 2 digits and is available from...

QualityKits - https://store.qkits.com/electronic-kits/led-and-lcd-clock-kits/velleman-k8063-2-digit-led-display-kit-with-serial-interface.html

Amazon - https://www.amazon.com/Velleman-K8063-MODULAR-INTERFACE-PACKAGE/dp/B001IRV6LQ
