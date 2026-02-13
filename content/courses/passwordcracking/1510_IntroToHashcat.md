---
title: PC1510 - Intro to Hashcat
# subtitle: 
date: 2026-02-04
lastmod: 2026-02-12
tags: [Lessons, PasswordCracking]
draft: false
---
An introductory lesson to Hashcat. This lesson will cover the usage of the dictionary, combinator, brute force, and hybrid attack modes
<!--more-->
## Prerequisites ##
Familiarity with the command line and Linux commands  
[PC1010 - Intro to Password Cracking](/courses/passwordcracking/1010_introtopasswordcracking)

## Disclaimer ##
The content of this course is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Topics Covered ##
* What is Hashcat?
* Hashcat Attack Modes
* Cracking Passwords
* Viewing Cracked Passwords

---

# What is Hashcat? #
#### From [kali.org](https://www.kali.org/tools/hashcat/)
"**World’s fastest and most advanced password recovery utility**  
Hashcat supports five unique modes of attack for over 300 highly-optimized hashing algorithms. Hashcat currently supports CPUs, GPUs, and other hardware accelerators on Linux, and has facilities to help enable distributed password cracking."

## Installing Hashcat ##
Debian/Ubuntu/Kali: `sudo apt install hashcat`  
Arch: `sudo pacman -S hashcat`  
Brew: `brew install hashcat`

---

# Types of Attacks #
There are 5 different types of password attacks that Hashcat supports:
1. Dictionary
2. Combinator
3. Brute Force / Mask
4. Hybrid
5. Association

## Types of Attacks - Dictionary ##
* The fastest attack type, most people start with this one
* Takes a wordlist as an input, hashes each individual word, and then compares it to the hash
* [rockyou.txt](https://weakpass.com/wordlists/rockyou.txt) is a common wordlist used to start password cracking
	* Contains 14.3 million passwords obtained from the 2009 RockYou data breach
	* Real passwords by real people, and humans are known to have weak passwords
	* Far better than a brute force if the password is on the list

## Types of Attacks - Combinator ##
* Similar to a dictionary attack, but for multiple wordlists
* Takes each permutation of the 2 wordlists
* `adj.txt` + `fruits.txt` would result in:
  * rottenapple
  * rottenbanana
  * ripeapple
  * ripebanana

## Types of Attacks - Brute Force / Mask ##
* The slowest attack type, typically used when all other methods have failed
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

## Types of Attacks - Hybrid ##
* A hybrid attack combines the dictionary and brute force attacks
* Generally used to append/prepend numbers or special characters to wordlists
* `fruit.txt` + `?d?d`
  * apple00
  * apple01
  * ...
  * grape98
  * grape99

## Types of Attacks - Association ##
* *This type of attack is more useful for slow hashes and salts, attempting to correlate usernames or known values with passwords*
* *We'll revisit this type of attack with more advanced password cracking*

---

# How to Crack Hashes #
Cracking hashes can be broken up into 5 steps:
1. Obtain hashes
2. Identify the hash ID (also known as hash mode)
3. Declare the attack mode
4. Crack hashes
5. Re-evaluate and repeat

## How to Crack Hashes - Obtain Hashes ##
**This lesson will not cover acquiring hashes.** I will be going into depth on acquiring hashes in Password Cracking 2010. For this lesson, download and extract this file for hashes and dictionaries.  

[Download PC1020.7z](/assets/files/PasswordCracking/PC1020.7z)  
* pebbleyou.txt (1/4 the size of rockyou.txt)
* colors.txt (25 colors)
* fruit.txt (25 fruits)
* hashes.txt (8 hashes)

#### PC1020.7z Checksums:  ####
MD5: `59b83bd6dec3cc2360842f3b28544192`  
SHA256: `cac5d19a9439efdf8d0e8278de8230e9fc1b9660fabb4072be512463cb98dd75`  

## How to Crack Hashes - Identify the Hash Mode ##
Use [hashes.com](https://hashes.com/en/tools/hash_identifier) to identify what kind of hash we are working with.  
The hashes should all be identified as `MD5`  
![HashIdentifier](/assets/img/CoursePics/PasswordCracking/HashIdentifier.png)

Once you know the type of hash, find the Hash Mode by using [Hashcat's example hashes](https://hashcat.net/wiki/doku.php?id=example_hashes)

| Hash-Mode | Name | Example Hash |
| --------- | ---- | ------------ |
| 0 | MD5 | bbea6f690be59732119bf93d45feb818 |
| 100 | SHA1 | fafacad008a3d3a34278cd05e61fdd3da64790d4 |
| 1000 | NTLM | 938C6B926DC1FF02C6C03AB5F6A6487B |  

Since the hashes are using MD5, Hash Mode `0` will be used and denoted by the `-m` flag.  

## How to Crack Hashes - Declare the Attack Mode ##
The Hashcat *attack mode* is the type of attack being performed on the hashes.  
It is declared with the `-a` flag.
| Attack | Dictionary | Combinator | Brute Force / Mask | Hybrid | Association |
| ------- | ---------- | ---------- | ------------------ | ------ | ----------- |
| Value   | 0          | 1          | 3                  | 6/7    | 9           |

Each attack would be formatted like this:
* **Dictionary:**
  * `hashcat -m {Hash_ID} -a 0 {hashfile} {file.dict}`

* **Combinator:**
  * `hashcat -m {Hash_ID} -a 1 {hashfile} {file1.dict} {file2.dict}`
  
* **Brute Force:**
  * `hashcat -m {Hash_ID} -a 3 {hashfile} {word (optional)}{mask}`
    * `?d`igits, `?u`ppercase, `?l`owercase, `?s`pecial, `?a`ll

* **Hybrid (append):**
  * `hashcat -m {Hash_ID} -a 6 {hashfile} {file.dict}{mask}`

* **Hybrid (prepend):**
  * `hashcat -m {Hash_ID} -a 7 {hashfile} {mask}{file.dict}`

* **Association:**
  * `hashcat -m {Hash_ID} -a 9 {hashfile} {file.dict}`

## How to Crack Hashes - Crack Hashes ##
### Hashes 1 and 2 ###
* To get the first 2 hashes, we're going to perform a **Dictionary** attack
* Remember that the Hash Mode was `0` for MD5
* The Attack Mode for a dictionary attack is also `0`
* `hashcat -m 0 -a 0 hashes.txt pebbleyou.txt`
### Hashes 3 and 4 ###
* To get the 3rd and 4th hashes, we're going to do a **Combinator** attack
* The Attack Mode for combinator is `1`
* `hashcat -m 0 -a 1 hashes.txt colors.txt fruit.txt`
### Hashes 5 and 6 ###
* 5 and 6 are both a **Brute Force / Mask** attack
* The Attack Mode is `3`
* They use the word "hacker" and 4 digits
* `hashcat -m 0 -a 3 hashes.txt "hacker?d?d?d?d"`
* `hashcat -m 0 -a 3 hashes.txt "?d?d?d?dhacker"`

### Hashes 7 and 8 ###
* The last 2 hashes are **Hybrid** attacks
* If the mask is after the dictionary, the Attack Mode is `6`
* If the mask is before the dictionary, the Attack Mode is `7`
* `hashcat -m 0 -a 6 hashes.txt colors.txt "?a"`
* `hashcat -m 0 -a 7 hashes.txt "?a" fruit.txt`

## How to Crack Hashes - Re-evaluate and Repeat ##
By now, all the passwords should have been discovered! We can check this by running one of our previous commands with `--show` at the end!  
`hashcat -m 0 -a 0 hashes.txt pebbleyou.txt --show`  

![Cracked Hashes](/assets/img/CoursePics/PasswordCracking/Hashcat_CrackedHashes.png)  
Harder passwords might require multiple attempts of different masks, wordlists, and combinations to get it right. Every hash can theoretically be cracked, it's just a matter of time (sometimes trillions of years) before we get them!

---
## Lab Course: [PC1515 - Hashcat Lab](/courses/passwordcracking/1515_hashcatlab)
## Next Topic: [PC1520 - Intro to John The Ripper](/courses/passwordcracking/1520_introtojohn)
