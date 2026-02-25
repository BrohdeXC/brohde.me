---
title: PwnHound
subtitle: Man's best deauth-sniffing friend
date: 2025-09-14
tags: [projects, raspberrypi, python, current]
#bigimg: [{src: "/img/triangle.jpg", desc: "Triangle"}, {src: "/img/sphere.jpg", desc: "Sphere"}, {src: "/img/hexagon.jpg", desc: "Hexagon"}]
---
``` THIS IS A WORK IN PROGRESS, CHECK BACK FOR UPDATES ```

When I first started getting into cybersecurity, I stumbled across the [Pwnagotchi](https://pwnagotchi.ai/), a handheld device used for hacking that captures the 4 way handshake when some victim device connects to a wifi network. These captures can be analyzed and used to crack wifi passwords. I built one about a week later and fell in love with the form factor, the little avatar, and learning more about network security. 
<!--more-->
As I used it more, I stumbled across the deauthentication mode and wanted to know more. I found out something important: **Deauth attacks are illegal on devices you don't own.** It got me thinking, "Could I build a counterpart to the Pwnagotchi to catch bad actors?"

Check out the latest progress on [my GitHub](https://github.com/BrohdeXC/PwnHound)

## Things You'll Need ##
* [Raspberry Pi Zero 2 WH](https://www.amazon.com/Raspberry-Pi-Zero-2-WH/dp/B0DB2JBD9C)
* [4 Port USB Hub Hat](https://www.amazon.com/dp/B083KMNR36)
* [Waveshare 2.13" E-paper Hat](https://www.amazon.com/dp/B0D22JJ18B)
* [Panda Wireless PAU0B](https://www.amazon.com/dp/B08NPX2X4Z)
* [MicroSD Card](https://www.amazon.com/dp/B07XDCZ9J3)
* [PiSugar UPS](https://www.amazon.com/Portable-Pwnagotchi-Raspberry-Accessories-handhold/dp/B097RC8KLQ?s=electronics) (Optional)
* My Custom Case (Coming Soon)

## Flashing the MicroSD
Using the [Raspberry Pi Imager](https://www.raspberrypi.com/software/), flash the MicroSD card with *Raspberry Pi OS Lite (64-bit)* (We won't need a DE here)
Once it's finished, eject it safely from the computer and put it into the slot on the Raspberry Pi. Now we can put everything together.

QOL Tip: Set up networking in the imager so that you can use SSH as soon as you turn it on.

## Assembly
Putting Pwnhound together is pretty straightforward. Put the USB Hat onto the Pi using the GPIO headers, attach the display to that (also GPIO Headers), and then attach the battery if available. Put the whole device into a case to keep it from getting squished in a bag, and then attach the WiFi adapter to one of the USB ports.

## Connecting and Installing PwnHound ##
SSH into the Pi and follow my GitHub documentation.

## Using PwnHound ##
Take the dog for a walk! Occasionally you'll see deauth frames and the MAC address show up on the display. Not all of them are malicious, sometimes networks will just deauth clients. The key here is to find repeat offenders, and I plan to implement filtering for it in the future.

## To Be Continued... ##
