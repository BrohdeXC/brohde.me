---
title: PC1030 - Intro to John the Ripper
subtitle: Intro to John the Ripper
date: 2026-02-03
# lastmod: 2026-02-11
tags: [Lessons, PasswordCracking]
draft: false
---
An introductiory lesson to JohnTheRipper. This lesson covers the wordlist, single crack, incremental, and mask attack modes.

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

---

# What is JohnTheRipper? #
#### From [kali.org](https://www.kali.org/tools/john/)
"John the Ripper is a tool designed to help systems administrators to find weak (easy to guess or crack through brute force) passwords, and even automatically mail users warning them about it, if it is desired."  

## Installing John ##
John has 2 versions, Core and Jumbo. I recommend the Jumbo version because it has support for many more hash formats and the mask attack mode.  
Debian/Ubuntu/Kali: `sudo apt install john`  
Arch: `sudo pacman -S john`  
Brew: `brew install john`  

---

# Types of Attacks
There are 4 basic JtR modes that we'll be covering:
1. Wordlist
2. Incremental
3. Mask
4. Single Crack

## Types of Attacks – Wordlist Mode
* The fastest attack type, most people start with this one
* Takes a wordlist as an input, hashes each individual word, and then compares it to the hash
* [rockyou.txt](https://weakpass.com/wordlists/rockyou.txt) is a common wordlist used to start password cracking
	* Contains 14.3 million passwords obtained from the 2009 RockYou data breach
	* Real passwords by real people, and humans are known to have weak passwords
	* Far better than a brute force if the password is on the list
* `--wordlist={wordlist.txt}`

## Types of Attacks – Incremental Mode
* Similar to a typical brute force mask attack
* Starts at ?a
  * Goes until you get a password
* `--incremental:{mode}`
  * `Lower` - Lowercase letters
  * `Alpha` - Uppsercase letters
  * `Digits` - zero through tem
  * `Alnum` - Alphanumberic characters

## Types of Attacks – Mask Mode
* Only supported in Jumbo mode
* Allows you to define wildcard spaces to try
* Useful for years, passwords ending with special characters, and more
* The flag `--mask=?d?d?l?l` uses all passwords from 00aa to 99zz
* The flag `--mask={wordlist}?s` uses the wordlist with all special characters appended to it
* `?w` can be used to put a word in the middle of a mask
  * Useful for complex masks and incrementation
  * `john -w={wordlist} --mask="?s?w?d?d"`
    * Starts with a special character
    * Adds a word from the wordlist
    * Adds 2 more digits after

## Types of Attacks – Single Crack Mode
* One of John's strongest features
* Applies comon variations to existing user information to generate passwords
* Great to start with if it seems likely that the username will be similar to the password
* Use this one if you have a the `/etc/shadow` file or are doing a password audit.
  * use `unshadow` to combine the passwd and shadow files
* `--single`

---

# How to Crack Hashes w/ John
Cracking hashes with JtR can be broken up into 5 steps:
1. Obtain Hashes
2. Determine the Type of Hash
3. Crack Hashes
4. Re-evaluate and Repeat

## Step 1 – Obtain Hashes
**This lesson will not cover acquiring hashes.** I will be going into depth on acquiring hashes in Password Cracking 2010. For this lesson, download and extract this file for hashes and dictionaries.  
[Download PC1030.7z](/assets/files/PasswordCracking/PC1030.7z)  
Contains:
* pebbleyou.txt (1/4 the size of rockyou.txt)
* hashes.txt (6 hashes)
* passwd.txt (from `/etc/passwd`)
* shadow.txt (from `/etc/shadow`)

#### Checksums:  ####
MD5: ` `  
SHA256: ` `  

## Step 2 – Determine the Type of Hash
*John will usually autodetect the type of hash being uses, if you get an error, try using these commands*

* `john --list=formats` Allows you to see all the formats available
* `john --format={format} {hashes.txt}` Allows you to force a format

Since your hashes are MD5, John will typically detect automatically.

## Step 3 – Crack Hashes

### Hashes 1 and 2
* The first 2 hashes are found using a **Dictionary** attack
* Since the hash mode is MD5, it should be auto detected
  * If it's not, we can still define it with `--format=Raw-MD5`
* `john --wordlist=pebbleyou.txt --format=Raw-MD5 hashes.txt`

### Hashes 3 and 4
* 3 and 4 are found using a **Hybrid Mask** attack with the word "hacker" and a year on either side
* `john --mask="hacker?d?d?d?d" --format=Raw-MD5 hashes.txt`
* `john --mask="?d?d?d?dhacker" --format=Raw-MD5 hashes.txt`

### Hashes 5 and 6
* Hashes 5 and 6 are found with an **Incremental** attack
* These two could take a few minutes depending on the hardware you're running
* `john --incremental hashes.txt`

### Hashes 7 and 8
* The last 2 hashes are found using the **Single Crack** attack
* Use the `unshadow` command to combine the passwd and shadow files
  * `unshadow passwd.txt shadow.txt > hashes_crypt.txt`
* Since these are yescrypt hashes pulled from a Kali Linux box, we have to define it
* `john --single --format="crypt" hashes_crypt.txt`

## Step 4 - Re-evaluate and Repeat
By now, all the passwords should have been discovered!  
We can check this by running `john --show {hash_file}` to show the cracked hashes.
**Hashes 1-6**
```
?:1zxcvbnmasdfghjkl
?:mozzarellapizzahut
?:hacker2002
?:9001hacker
?:al3ts5
?:c362s1
```
**Hashes 7-8**
```
logger:logger13579
hacker:2048hacker
```
Harder passwords might require multiple attempts of different masks, wordlists, and combinations to get it right. If those don't work, it might be worth looking into custom rules, which we'll cover in PC2030!
