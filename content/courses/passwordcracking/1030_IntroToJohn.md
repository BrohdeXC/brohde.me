---
title: Password Cracking 1030
subtitle: Intro to John the Ripper
date: 2026-02-03
# lastmod: 2026-02-11
tags: [Lessons, PasswordCracking]
draft: false
---
An introductiory lesson to JohnTheRipper. This lesson covers the wordlist, single crack, and incremental attack modes.

<!--more-->
## Prerequisites ##
Familiarity with the command line and Linux commands  
[PC1010 - Intro to Password Cracking](/courses/passwordcracking/1010_introtopasswordcracking)

## Disclaimer ##
The content of this course is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Topics Covered ##
* What is JohnTheRipper?
* John Attack Modes
* Cracking Passwords
* Viewing Cracked Passwords

# What is JohnTheRipper? #
#### From [kali.org](https://www.kali.org/tools/john/)
"John the Ripper is a tool designed to help systems administrators to find weak (easy to guess or crack through brute force) passwords, and even automatically mail users warning them about it, if it is desired."  

## Installing John ##
Debian/Ubuntu/Kali: `sudo apt install john`  
Arch: `sudo pacman -S john`  
Brew: `brew install john`  

##
