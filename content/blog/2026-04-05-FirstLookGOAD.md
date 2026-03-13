---
title: "Learning BloodHound w/ GOAD"
subtitle: "Makes Me Feel Like A Kid In A Candy Shop"
date: 2026-04-05
#lastmod: 2026-03-10
tags: [GOAD, Pwning]
draft: true
---
About 2 months ago, we held a homelab night for the cybersecurity club. I brought in our most active homelab Discord members, and everyone talked about their labs, some of the things they're running, and more. It was a good event, but there was one thing that really stuck out to me. Game of Active Directory.

<!--more-->
After the event, I talked to my friend, [Breyden Summers](https://Breydensummers.github.io), about GOAD. For those of you that don't know, GOAD is a Windows Active Directory environment developed to practice penetration testing skills. Think about it as the DVWA of Windows servers. There's a few different levels to it, and after hearing his recommendation, I thought I would give it a shot. 

# Setting Up The Environment #
There's lot's of ways to set up GOAD. On both Windows and Linux, there's support for Virtualbox, VMWare, Proxmox, AWS, and more. I opted to use Virtualbox on Kali Linux, and I had a spare laptop sitting around with enough resources to handle everything just fine. I booted up Kali, followed the documentation, and in a few hours had my laptop fan screaming in the background. Everything was set up.

I'd be lying if I said I didn't run into issues. All of them were my fault though. Don't delete any VMs, and if you do, go to your home directory, delete both the GOAD and Virtualbox VMs directory, then clone the repo again and run the installer script. I kept running into issues where it didn't like having the same name as another VM, but this fixed it.

I also wanted to change the octet that the VMs were running on. The installer script did not seem to like that at all. I decided the default was fine for now, as the purpose of this was to learn AD, not fight setup for hours.

# GOAD Schema and Goals #
The documentation gives us images of the network schema, and gives a lot of information about the users. Because this was my first time working with this environment and AD in general, I really got to stretch my limits, and learned a lot through hitting my head on a wall.

![Full GOAD Schema](/assets/img/BlogPosts/FirstGOAD/GOAD_schema.png)

My goals were pretty simple:
* Obtain initial access
  * I need to start somewhere
* Pivot to all of the machines
  * Total domination
* Get at least one domain admin credential from each machine
  * The more the better
* Gain enough knowledge to do the NHA (Ninja Hacker Academy)
  * The next level up, with security enabled and no schema

# The Tools I Used #
Scanning and Recon
* Bash
* Nmap

Notes, Mapping, and Diagrams
* Obsidian
## Scanning and Recon ##
The first thing I did was run a quick ping sweep to get the ip addresses of each device on the network. Using Bash:
```bash
for i in $(seq 254); do ping -c1 -W1 192.168.56.${i} & done | grep icmp
``` 
This revealed 5 devices:
```bash
64 bytes from 192.168.56.1: icmp_seq=1 ttl=64 time=0.029 ms
64 bytes from 192.168.56.10: icmp_seq=1 ttl=128 time=0.119 ms
64 bytes from 192.168.56.11: icmp_seq=1 ttl=128 time=0.157 ms
64 bytes from 192.168.56.12: icmp_seq=1 ttl=128 time=0.130 ms
64 bytes from 192.168.56.100: icmp_seq=1 ttl=255 time=0.034 ms
```
Running the ping sweep but saving the IPs as a text file:
```bash
for i in $(seq 254); do ping 192.168.56.${i} -c1 -W1 & done | grep icmp | cut -d ' ' -f 4 | cut -d ':' -f 1 > ips.txt
```
Using Nmap on this IP list, scanning all ports and checking the service versions
```bash
nmap -iL ips.txt -sV -p-
```
