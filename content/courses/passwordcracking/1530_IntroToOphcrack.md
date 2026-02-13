---
title: PC1530 - Intro to Ophcrack
subtitle: Using Rainbow Tables to Demonstrate Precomputed Passwords
date: 2026-02-08
lastmod: 2026-02-13
tags: [Lessons, PasswordCracking]
draft: false
---
An introductory lesson to Ophcrack. This lesson covers the basics of rainbow tables, how to install them, using them to crack unsalted LM and NTLM hashes.

<!--more-->
## Prerequisites ##
[PC1010 - Intro to Password Cracking](/courses/passwordcracking1010/1010_introtopasswordcracking)  
**Optional:** Torrent (for downloading all the rainbow tables at once)  

## Disclaimer ##
The content of this course is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Topics Covered ##
* What is Ophcrack?
* What Are Rainbow Tables?
* Navigating Ophcrack
* Cracking Windows Hashes
* Why Rainbow Tables Fail Against Modern Systems

---

# What is OphCrack? #
#### From [kali.org](https://www.kali.org/tools/ophcrack/)
"Ophcrack is a Windows password cracker based on a time-memory trade-off using rainbow tables. This is a new variant of Hellman’s original trade-off, with better performance. It recovers 99.9% of alphanumeric passwords in seconds."

Ophcrack is primarily used on older LM and NTLM hashes (Windows Vista, XP, and 7), therefore it is not extremely relevent today.

## Installing Ophcrack ##
Debian/Ubuntu/Kali: `sudo apt insatll ophcrack`  
Arch: `sudo pacman -S ophcrack`  
Brew: `brew install ophcrack`  

---

# What are Rainbow Tables? #
Rainbow tables are precomputed tables of hashes that can be used to reverse hash functions. Instead of hashing a wordlist and then comparing the hash, the passwords are already solved for. Imagine having a really large spreadsheet of password-hash combinations that you can CTRL-F. The tradeoff for rainbow tables' speed comes in storage, in which larger tables can take up terrabytes of space.

## Downloading Rainbow Tables ##
The best place to get rainbow tables is from [Ophcrack's website.](https://ophcrack.sourceforge.io/tables.php) The larger tables require torrent, but this course will only use `Vista Proba Free`

--- 
# Using Ophcrack #
Using Ophcrack comes down to 4 steps
1. Installing the rainbow tables
2. Acquiring hashes
3. Loading the hashes
4. Cracking the hashes

## Using Ophcrack - Installing the Rainbow Tables ##
1. Select the "Tables" button at the top of the screen
2. Select the table you want to add
3. Press install
4. Define the filepath of the table directory, then press "Choose"
5. The circle next to the table should turn green. If it doesn't, highlight the table, then press the green "Enable" circle
![Putting the tables into Ophcrack](/assets/img/CoursePics/PasswordCracking/Ophcrack_InstallingTables2.png)

## Using Ophcrack - Acquiring Hashes ##
We will not be covering acquiring NT, LM, and NTLM hashes in this lesson, but they can be found through:
* SAM databases
* NTLM hash generators  

For this lesson, use these hashes acquired from a PWDUMP file:
```
admin:1000:aad3b435b51404eeaad3b435b51404ee:58a478135a93ac3bf058a5ea0e8fdb71:::
sales:1001:aad3b435b51404eeaad3b435b51404ee:e6f80a6cbf0607a00ad93f85542c2802:::
intern:1002:aad3b435b51404eeaad3b435b51404ee:a3a685f89364d4a5182b028fbe79ac38:::
analyst:1003:aad3b435b51404eeaad3b435b51404ee:78282df43299d748e53ea745932e5fd0:::
backup:1004:aad3b435b51404eeaad3b435b51404ee:becedb42ec3c5c7f965255338be4453c:::
```

## Using Ophcrack - Load the Hashes ##
1. Select "Load" at the top of the screen
2. Select one of the 4 options:
  * Single Hash - Just one Hash
  * PWDUMP file - A collection of Hashes
  * Session file - Load a previous session
  * Encrypted SAM - Extracted from Windows SAM database
![Selecting one of the Options](/assets/img/CoursePics/PasswordCracking/Ophcrack_LoadFile2.png)
3. Either paste the single hash or choose the directory of the file
4. Press "Open" or "OK"
5. All the Hashes should populate the screen
## Using Ophcrack - Crack Hashes ##
1. Press the "Crack" button at the top of the screen
2. Wait
3. Congrats! You should now have some passwords!
![Cracking the Hashes](/assets/img/CoursePics/PasswordCracking/Ophcrack_Cracked.png)
