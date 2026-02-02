---
title: Intro to Password Cracking w/ Hashcat
subtitle: Using Hashcat to Show The Importance of Strong Passwords
date: 2026-01-21
tags: [Presentations, 101]
draft: false
---

I taught the Intro to Cybersecurity class about some basic password cracking using Hashcat. Using basic knowledge of password hashes and common attack types, the students cracked both my MD5 and SHA1 hashlists by utilizing dictionary and brute force attacks.
<!--more-->
Using some of the framework from my [ShellFire](/projects/shellfire) project, I set up 15 different VNC users for the students to safely play around with Hashcat, my personal favorite tool for password cracking.

*I've since updated this post after the presentation to cover all the different types of Hashcat attacks*

## Disclaimer ##
The content of this post is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Topics Covered ##
* What is Password Cracking?
* About Hashes
* What is Hashcat?
* Types of Attacks
* How to Crack Hashes

## What is Password Cracking?
Password cracking, also known as password recovery, is when a plaintext password is discovered through using tools on a password hash.

## About Hashes
**What are they?** [Generator](https://www.browserling.com/tools/all-hashes)
* Turns messages into a fixed length digest
	* Imagine chewing up food and spitting it out
* Different than encryption
	* Can't be undone
* Used for integrity checks and passwords
* Many different algorithms of various mathematical complexity

![Example Hashes](/assets/img/BlogPosts/PasswordCracking/ExampleHashes.png)

## About Hashes
**How are they cracked?**
* Since hashes can't be reversed, we can't just use a decoding tool like CyberChef to decrypt
* Words are hashed first, then compared to the hashes we've obtained

![How Hashes Crack](/assets/img/BlogPosts/PasswordCracking/HowHashesCrack.png)

## What is Hashcat?
#### From [kali.org](https://www.kali.org/tools/hashcat/)
**World’s fastest and most advanced password recovery utility**  
Hashcat supports five unique modes of attack for over 300 highly-optimized hashing algorithms. hashcat currently supports CPUs, GPUs, and other hardware accelerators on Linux, and has facilities to help enable distributed password cracking.

---

## 5 Types of Attacks
There are 5 different types of password attacks that Hashcat supports:
* Dictionary
* Combinator
* Brute Force / Mask
* Hybrid
* Association

## Types of Attacks - Dictionary
* The fastest attack type, most people start with this one
* Takes a wordlist as an input, hashes each individual word, and then compares it to the hash
* [rockyou.txt](https://weakpass.com/wordlists/rockyou.txt) is a common wordlist used to start password cracking
	* Contains 14.3 million passwords obtained from the 2009 RockYou data breach
	* Real passwords by real people, and humans are known to have weak passwords
	* Far better than a brute force if the password is on the list

## Types of Attacks - Combinator
* Similar to a dictionary attack, but for multiple wordlists
* Takes each permutation of the 2 wordlists
* `adj.txt` + `fruits.txt` would result in:
  * rottenapple
  * rottenbanana
  * ripeapple
  * ripebanana

## Types of Attacks - Brute Force / Mask
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

## Types of Attacks - Hybrid
* A hybrid attack combines the dictionary and brute force attacks
* Generally used to append/prepend numbers or special characters to wordlists
* `fruit.txt` + `?d?d`
  * apple00
  * apple01
  * ...
  * grape98
  * grape99

## Types of Attacks - Association
* *I still don't understand how this attack works, and I've never had to use it*
* *I'll update this post once I know what this attack does, but it looks like it could be useful for slow hashes and salts*

---
## How to Crack Hashes - Prerequisites
* Acquired hashes
  * On Linux machines hashes are found in the `/etc/shadow` directory 
  * Windows machines put them in the SAM database as a registry hive
  * JohnTheRipper has tools that can be used to get hashes from password protected files
  * Check out [Network Hacking](/post/2026-02-02-networkhacking101) for acquiring WiFi hashes acquired during the 4-way handshake
* Knowledge of the Hashes
	* Identify the type of hash with [hashes.com](https://hashes.com/en/tools/hash_identifier)
	* Identify the hashcat attack mode with [example hashes](https://hashcat.net/wiki/doku.php?id=example_hashes)
* Wordlists for dictionary/combinator/hybrid attacks

## How to Crack Hashes - Hashcat
* Identify the **[hash mode](https://hashcat.net/wiki/doku.php?id=example_hashes)** for each of the hashes

| Hash Mode | Name | Example Hash |
| ------- | ---- | ------------ |
| 0 | MD5 | bbea6f690be59732119bf93d45feb818 |
| 100 | SHA1 | fafacad008a3d3a34278cd05e61fdd3da64790d4 |
| 1000 | NTLM | 938C6B926DC1FF02C6C03AB5F6A6487B |

* Identify the **attack type** to be used

| Attack: | Dictionary | Combinator | Brute Force / Mask | Hybrid | Association |
| ------- | ---------- | ---------- | ------------------ | ------ | ----------- |
| Value:   | 0          | 1          | 3                  | 6/7    | 9           |

* Dictionary attack format:
  * `hashcat -m {Hashmode} -a 0 {hashfile} {file.dict}`
	* rockyou.txt is in `/usr/share/wordlists/rockyou.txt`
* Combinator attack format:
  * `hashcat -m {Hashmode} -a 1 {hashfile} {file1.dict}{file2.dict}`
* Brute Force attack format:
  * `hashcat -m {Hashmode} -a 3 {hashfile} {mask}`
    * `?d`igits, `?u`ppercase, `?l`owercase, `?s`pecial, `?a`ll
* Hybrid attack (append) format:
  * `hashcat -m {Hashmode} -a 6 {hashfile} {file.dict}{mask}`
* Hybrid attack (prepend) format:
  * `hashcat -m {Hashmode} -a 7 {hashfile} {mask}{file.dict}`
* Association attack format:
  * `hashcat -m {Hashmode} -a 9 {hashfile} {file.dict}`
* Show found passwords by adding `--show` to the previous command

## What We Can Learn #
* Use strong, non-dictionary-word passwords or long passphrases
	* Password managers are great
* Keep password length at least 12 characters
	* Long passwords are significantly harder to brute force
* Use MFA wherever possible
	* Even if your password does get hacked, hackers still can't get in
