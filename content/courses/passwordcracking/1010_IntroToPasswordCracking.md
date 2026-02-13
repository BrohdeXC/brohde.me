---
title: PC1010 - Intro to Password Cracking
subtitle: Password Cracking Theory and the Importance of Strong Passwords
date: 2026-02-03
lastmod: 2026-02-03
tags: [Lessons, PasswordCracking]
draft: false
---
An introductory lesson for password cracking. This lesson covers the idea behind using hashes, how they are cracked, and various types of password attacks.
<!--more-->

## Disclaimer ##
The content of this course is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Topics Covered ##
* What is Password Cracking?
* About Hashes
* What is Hashcat?
* Types of Attacks
* How to Crack Hashes

# What is Password Cracking?
Password cracking, also known as password recovery, is when a plaintext password is discovered through using tools on a password hash. I like to differentiate "password cracking" as a subgroup of "password hacking", where password hashes are extracted and evaluated offline. 

# About Hashes
### What are they? ### 
* Turns messages into a fixed length digest
	* Imagine chewing up food and spitting it out
* Different than encryption
	* Can't be undone
* Used for integrity checks
	* A hashed file will always return the same hash every time. 
	* "Password" will **always** return "29f33cab54c2a8858885b95d8fbb7ff1" for MD5, given that it is unsalted. (Modern systems add a unique "salt" so the same password produces different hashes)
  * When you download a file, compare it to the hash to make sure that the file was not tampered with or corrupted in transit
* Used for passwords 
  * Another layer of security, if a website gets compromised, the hacker has a bunch of hashes instead of the plaintext passwords
* Many different algorithms of various mathematical complexity
  * Some older algorithms are prone to collisions, where 2 different pieces of data result in the same hash
* Check out this [generator by Browserling](https://www.browserling.com/tools/all-hashes) to see a variety of hashes!

![Example Hashes](/assets/img/BlogPosts/PasswordCracking/ExampleHashes.png)

### How are they cracked? ###
* Since hashes can't be reversed, we can't just use a decoding tool like CyberChef to decrypt them
* Wordlists are hashed first, line by line, then compared to the hashes we've obtained

![How Hashes Crack](/assets/img/BlogPosts/PasswordCracking/HowHashesCrack.png)

# Types of Attacks #
There are various types of attacks used for Password Cracking:
* Brute-Force / Mask
* Dictionary
* Hybrid / Rule-Based
* Rainbow Tables

## Brute-Force / Mask ##
* The most computationally expensive type, typically used when all other methods have failed
* Tries every single combination of letters, numbers, and special characters
* Even just 5 lowercase letters requires 11.8 million (26^5) permutations
	* aaaaa
	* aaaab
	* ...
	* zzzzz
* Masks just append/prepend a brute force to a word (i.e. `apple?l?l?l`)
  * appleaaa
  * appleaab
  * ...
  * applezzz

## Dictionary ##
* One of the fastest and most effective attack types
* Most people start with this one
* Takes a wordlist as an input, hashes each individual word, and then compares it to the hash
* [rockyou.txt](https://weakpass.com/wordlists/rockyou.txt) is a common wordlist used to start password cracking
	* Contains 14.3 million passwords obtained from the 2009 RockYou data breach
	* Real passwords by real people, and humans are known to have weak passwords
	* Far better than a brute force if the password is on the list

## Hybrid / Rule-Based ##
* Hybrid and rule-based attacks apply predictable additions or substitutions to the wordlists
* Based on how humans tweak their passwords
  * 1337speak
  * Character substitutions
  * Special characters slapped on the end

## Rainbow Tables ##
* Precomputed hashes
  * Basically a CTRL-F for hashes
* Trades compute power for file storage
* Only works on unsalted hashes, which makes it ineffective against most modern systems

## What We Can Learn #
* Length > Complexity
  * For human-chosen passwords, a long passphrase will be better than a password with modifications to it
  * Long passwords are significantly harder to brute force
* Use MFA wherever possible
	* Even if your password does get hacked, hackers still can't get in without your second factor

**The goal of defenders is not to make cracking impossible, but rather to make it computationally impractical**
