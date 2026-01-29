---
title: Homelab
subtitle: The rack of theseus
date: 2024-12-25
tags: [projects, current]
#bigimg: [{src: "/img/triangle.jpg", desc: "Triangle"}, {src: "/img/sphere.jpg", desc: "Sphere"}, {src: "/img/hexagon.jpg", desc: "Hexagon"}]
---
Like every good network nerd, I've got a homelab. From learning about firewall rules, to slapping an ungodly amount of raspberry pis together, the homelab is a great place to [destroy, build, destroy](https://www.youtube.com/watch?v=qBYd2mXIu6c).
<!--more-->
# Main Rack #
* GeekPi RackMate T2
  * 12U of AWESOME 10" fun
* Azulle Byte4 mini PC
  * OpnSense Router
* Mokerlink 8 port unmanaged POE switch
  * Someone please make a 2.5G POE 120W Budget 12 port switch that fits in the 10 inch racks. I'll buy it immediately.
* Intel NUC mini PC
  * Arch Linux
  * Syncthing Hub
  * Hosting this website
* Tripp Lite 600VA UPS
  * Fits nicely in the bottom of the rack
* Zyxel NWA50AX Pro
  * Shoutout to [Sloraris](https://sloraris.dev/) for hooking me up with this
* GeeekPi 2U Lockable Drawer
  * Nice to keep long cables organized and hold my USB drives
* GeekPi 7.84 inch Touch Screen Monitor

# CyberLab Rack #
Just something for me to put all the Raspberry Pis on. Something tells me that giving all the cybersecurity students root access to their own docker containers should not occur on my main network.
* GeeekPi RackMate T1
* Raspberry Pi 5 8GB (3x)
  * Kubernetes Cluster
  * Docker Running [ShellFire](/projects/shellfire)
* Raspberry Pi 4 8GB (2x)
  * Also part of the Kubernetes Cluster
  * Also running ShellFire
