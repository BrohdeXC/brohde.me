---
title: Network Hacking for Security
subtitle: Offensive Thinking for Defending Your World
date: 2026-02-02
tags: [Presentations, 101]
draft: false
---

I was asked to give a 5 minute presentation on the basics of network hacking for the Intro to Cybersecurity class. The goal was to demonstrate the importance of thinking like an attacker in order to defend yourself.
<!--more-->
## Disclaimer ##
The content of this post is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Let Me Tell You A Story

* I was visiting my in-laws for their Thanksgiving celebrations
* I recognized when I had connected to their WiFi network that it was running WPA2
* I asked if I could try and break into their network
* They said yes
* I did. 
* How? Just like this:

## Recon

* The first thing we need is to know the network name and security protocol
* This can be found in WiFi settings if you are connected to the network
* Other tools can view all the networks, signal strength, and more

![Network Scan](/assets/img/BlogPosts/NetworkHacking/NetworkScan.png)

## Getting a Handshake
* Networks perform a 4-way handshake when connecting devices
	* We are trying to capture data before it gets encrypted
* WPA/WPA2 are vulnerable to Deauthentication attacks
	* Client devices get kicked from the network, and the handshake is captured upon rejoin
* I used a Pwnagotchi to get the pcap file as a device reconnected to the network

![wireshark](/assets/img/BlogPosts/NetworkHacking/wireshark_4way.png)

## Extracting the Hash
* Using tools such as hcxpcapng allows us to extract the password hash from a pcap file
* Referencing Hashcat's [example hashes](https://hashcat.net/wiki/doku.php?id=example_hashes), we find the hash mode to be 22000

![hcxpcapngtool](/assets/img/BlogPosts/NetworkHacking/hcxpcapng.png)

## Cracking Hashes
* Using Hashcat, run various attacks until we crack the password
	* `hashcat -m 22000 -a 0 hash.hc22000 rockyou.txt`
	* `hashcat -m 22000 -a 3 hash.hc22000 {mask}`
* We find the password to be `aggies#1` and can log in

![Hashcat](/assets/img/BlogPosts/NetworkHacking/hashcat.png)

## Poking Around the Network
* We scan all of the devices on the network to see what endpoints are open
* Now the attacker knows what doors to try

![Nmap](/assets/img/BlogPosts/NetworkHacking/nmap.png)

## What Now?
* An attacker would start working on those open services
	* Check system versions for known vulnerabilities and exploits
	* Try login pages, mail servers, SSH, etc. 
	* Looking for any sort of data/destruction that they can get their hands on

## How We Can Think Like An Attacker for Security
* Assume your network will be targeted
  * Attackers scan everything
* Eliminate "easy wins"
  * Weak WiFi passwords
  * Default credentials
  * Outdated firmware and software
* Reduce attack surface
  * Disable unused services
  * Close unnecessary ports
  * Segment networks with VLANs
* Monitor how an attacker scouts
  * Log connections and authentication attempts
  * Watch for deauth attacks, repeated failures, unusual scans
* **Test yourself before someone else does**
  * Run your own scans (Nmap, Wireshark, Nessus)
  * Test password strength and policies

### Attackers use our assumptions against us. Thinking like them lets us reduce those assumptions
