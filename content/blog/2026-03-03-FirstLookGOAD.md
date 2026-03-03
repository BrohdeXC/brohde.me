---
title: "My First Look at GOAD"
subtitle: "If I Hate Windows So Much, Why Not Break It?"
date: 2026-03-03
lastmod: 2026-03-04
tags: [GOAD]
draft: true
---
I despise Windows. I really do. Ever since I switched to Linux from Windows, I've pushed it out of my mind. But a few weeks ago, we held a homelab night for the cybersecurity club. I brought in our most active homelab Discord members, and everyone talked about their labs, some of the things they're running, and more. It was a good event, but there was one thing that really stuck out to me. Game of Active Directory.

<!--more-->
After the event, I talked to my friend, [Breyden Summers](https://Breydensummers.github.io), about GOAD. For those of you that don't know, GOAD is a Windows Active Directory environment developed to practice penetration testing skills. Think about it as the DVWA of windows servers. There's a few different levels to it, and after hearing his recommendation, I thought I would give it a shot. 

# Setting Up The Environment #
There's lot's of ways to set up GOAD. On both Windows and Linux, there's support for Virtualbox, VMWare, Proxmox, AWS, and more. I opted to use Virtualbox on Kali Linux, and I had a spare laptop sitting around with enough resources to handle everything just fine. I booted up Kali, followed the documentation, and in a few hours had my laptop fan screaming in the background. Everything was set up.

I'd be lying if I said I didn't run into issues. All of them were my fault though. Don't delete any VMs, and if you do, go to your home directory, delete both the GOAD and Virtualbox VMs directory, then clone the repo again and run the installer script. I kept running into issues where it didn't like having the same name as another VM, but this fixed it.

I also wanted to change the octet that the VMs were running on. The installer script did not seem to like that at all. I decided the default was fine for now, as the purpose of this was to learn AD, not fight setup for hours.

# GOAD Schema and Goals #
The documentation gives us images of the network schema, and gives a lot of information about the users. Because this is my first time working with this environment and AD in general, I'll be looking a lot of things up, referring to the writeup when necessary. 

![Full GOAD Schema](/assets/img/BlogPosts/FirstGOAD/GOAD_schema.png)

My goals were pretty simple:
* Recon and Scanning
  * Find all of those users
* Obtain initial access
  * I need to start somewhere
* Pivot to all of the machines
  * Total domination
* Get at least one domain admin credential from each machine
  * The more the better
* Gain enough knowledge to do the NHA (Ninja Hacker Academy)
  * The next level up, with security enabled and no schema
