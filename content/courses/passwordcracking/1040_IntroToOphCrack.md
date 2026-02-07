---
title: Password Cracking 1040
subtitle: Intro to OphCrack
date: 2026-02-03
# lastmod: 2026-02-11
tags: [Lessons, PasswordCracking]
draft: false
---
An introductory lesson to OphCrack. This lesson covers the basics of rainbow tables, how to install them, and their usage.

<!--more-->
## Prerequisites: ##
[PC1010 - Intro to Password Cracking](/courses/passwordcracking1010/1010_introtopasswordcracking)  
**Optional:** Torrent (for downloading all the rainbow tables at once)  

## Disclaimer ##
The content of this post is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Topics Covered ##
* What is OphCrack?
* What are Rainbow Tables?
* Cracking Passwords

# What is OphCrack? #
#### From [kali.org](https://www.kali.org/tools/ophcrack/)
"Ophcrack is a Windows password cracker based on a time-memory trade-off using rainbow tables. This is a new variant of Hellman’s original trade-off, with better performance. It recovers 99.9% of alphanumeric passwords in seconds."

It is primarily used on older NTLM hashes, therefore it is not extremely relevent today.

## Installing Ophcrack ##
Debian/Ubuntu/Kali: `sudo apt insatll ophcrack`  
Arch: `sudo pacman -S ophcrack`  
Brew: `brew install ophcrack`  

##
