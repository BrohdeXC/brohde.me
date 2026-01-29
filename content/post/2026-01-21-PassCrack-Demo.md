---
title: Intro to Password Cracking
subtitle: Using Hashcat to Show The Importance of Strong Passwords
date: 2026-01-21
tags: [Presentations]
draft: false
---

I taught the Intro to Cybersecurity class about some basic password cracking using Hashcat. Using basic knowledge of password hashes and common attack types, the students cracked both my MD5 and SHA1 hashlists by utilizing dictionary and brute force attacks.
<!--more-->
Using some of the framework from my [ShellFire](/projects/shellfire) project, I set up 15 different user accounts for the students to play around with Hashcat, my personal favorite tool for password cracking.

## Topics Covered ##
* What is Password Cracking?
* About Hashes
* What is Hashcat?
* Types of Attacks
* How to Crack Hashes

## What is Password Cracking?
Simply put, taking a password hash and using it along with some tools to find a plaintext password. 

## About Hashes
**What are they?** [Generator](https://www.browserling.com/tools/all-hashes)
* Turns messages into a fixed length digest
	* Imagine chewing up food and spitting it out
* Different than encryption
	* Can't be undone
* Used for integrity checks and passwords
* Many different algorithms

## About Hashes
**How are they cracked?**
* Since hashes can't be reversed, we can't just use a decoding tool like CyberChef to decrypt
* Words are hashed first, then compared to the hashes we've obtained

## What is Hashcat?
#### From [kali.org](https://www.kali.org/tools/hashcat/)
**World’s fastest and most advanced password recovery utility**  
Hashcat supports five unique modes of attack for over 300 highly-optimized hashing algorithms. hashcat currently supports CPUs, GPUs, and other hardware accelerators on Linux, and has facilities to help enable distributed password cracking.

We'll be covering 2 of the 5 types of attacks today.

## Types of Attacks - Brute Force
* The slowest attack type
* Tries every single combination of letters, numbers, and special characters
* Even just 5 lowercase letters requires 11.8 million (26^5) permutations
	* aaaaa
	* aaaab
	* ...
	* zzzzz

## Types of Attacks - Dictionary
* The fastest attack type
* Takes a wordlist as an input, hashes each individual word, and then compares it to the hash
* [rockyou.txt](https://weakpass.com/wordlists/rockyou.txt) is a common one and the one that we'll be using for the lab
	* Contains 14.3 million passwords obtained from the 2009 RockYou data breach
	* Real passwords by real people, far better than a brute force

## How to Crack Hashes - Prerequisites
* You need hashes, but I won't cover acquiring them today
* Knowledge of the Hashes
	* Identify the type of hash with [hashes.com](https://hashes.com/en/tools/hash_identifier)
	* Identify the hashcat attack mode with [example hashes](https://hashcat.net/wiki/doku.php?id=example_hashes)
* Wordlists for dictionary attacks

## How to Crack Hashes - Hashcat
* Identify the **attack mode** for the hash files
* Identify the **attack type** that you want to use for a dictionary / brute force attack
* Hashcat dictionary attacks are formatted as:
  * `hashcat -m {mode} -a 0 {hashfile} {dictionaryfile}`
	* rockyou.txt is in `/usr/share/wordlists/rockyou.txt`
* Hashcat brute force attacks are formatted as:
  * `hashcat -m {mode} -a 3 {hashfile} ?d?u?l?s?a`
  * `d`igits, `u`ppercase, `l`owercase, `s`pecial, `a`ll
* Show found passwords by adding `--show` to the previous command

## What We Can Learn #
* Use strong, non-dictionary-word passwords or long passphrases
	* Password managers are great
* Keep password length at least 12 characters
	* Significantly harder to brute force
* Use MFA wherever possible
	* Even if your password does get hacked, hackers still can't get in
