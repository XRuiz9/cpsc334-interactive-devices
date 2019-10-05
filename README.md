# First Aid

I made this interactive device for module 2 of the Creative Embedded Systems class of Fall 2019. This piece is called First Aid and is about how taking care of oneself is a cyclical process. It's not always clear what you need to do feel better, and you never know how long it'll be until your not feeling so great. Howvever, with practice you can get better at taking care of yourself, or at the very least this cardboard baby!

![First Aid Enclosures](https://github.com/XRuiz9/cpsc334-interactive-devices/blob/master/IMG_6787.JPG)

## Install It Yourself!

In order to replicate this device you'll need the following:

- A Raspberry Pi (I used the 3B+)
- An ESP32 Development Board
- A bread board
- A switch, button, and joystick
- A number of wires
- A Kuman 5" Resistive Touch Screen
- A power cable (Either Micro-USB to USB-B or Micro-USB to AC Adapter)
- A bluetooth speaker
- A 3.5 mm audio cable
- Enclosures of your choice to hide the cables (optional)

You can either run the program manual once you've downloaded the git repository or you can make it run on boot. Either way you'll need to run this code to make sure you have Processing for pi on your device:
> curl https://processing.org/download/install-arm.sh | sudo sh

You'll also want to make sure that you download the "Minim" Library in Processing as this handles all the audio in the program.
Then to make it run on boot, you'll want to make sure that you run

> sudo nano /etc/xdg/lxsession/LXDE-pi/autostart

And add the following lines:

> sleep(50)

> @python PATH_TO_start.py_IN_FIRST_AID_FOLDER


(the start.py file associated with it is already in the git repository)

Once you do this the program should run automatically once you connect to a source of power.
