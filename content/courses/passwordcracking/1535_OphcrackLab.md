---
title: PC1525 - John Lab
#subtitle: John the Ripper Lab
date: 2026-02-09
lastmod: 2026-02-13
tags: [Labs, PasswordCracking]
draft: true
---

<!--more-->
## Prerequisites ##
Familiarity with the command line and Linux commands  
[PC1010 - Intro to Password Cracking](/courses/passwordcracking/1010_introtopasswordcracking)

## Disclaimer ##
The content of this lab is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Resources Required ##
* Text editor
* `John`
* `unshadow`
* pebbleyou.txt (rockyou.txt will work too)

## Lab Prompt ##
GamersLair has undergone a security breach and now they are asking you to conduct a security assessment. They've got everything from TCGs to DND. Try and figure out the different club passwords!  

[Download PC1035.7z](/assets/files/PasswordCracking/PC1035.7z)  
* pebbleyou.txt (1/4 the size of rockyou.txt)
* hashes1.txt (10 hashes)
* hashes2.txt (10 hashes)
* hashes3.txt (5 hashes)
* passwd.txt (from `/etc/passwd`)
* shadow.txt (from `/etc/shadow`)

#### PC1035.7z Checksums:  ####
MD5: `76869bc0220a83dfb80e9ebfa691b576`  
SHA256: `ef8c70e705d68115fbd98778423e3bce9b153d12aae96f0ec18d4bfa4f28c43a`


## Answer Key ##
hashes1.txt
```bash
?:charizard_25
?:cyndaquil2
?:watersquirtle
?:pikapikachuuu
?:snorlax3
?:150990mewtwo
?:zapdos_rox!
?:geodude5!
?:chikorita39
?:totodile2
```
hashes2.txt
```bash
?:bard5994
?:paladin1000
?:1988ranger
?:3201druid
?:wizard2312
?:barbarian1205
?:fighter4623
?:4641rogue
?:3210monk
?:7263cleric
```
hashes3.txt
```bash
?:p4cman
?:s0nic
?:ga1aga
?:mar1o
?:p0ng
```
hashes_crypt.txt
```bash
Haxston:haxalot357
```

## Commands ##
hashes1.txt - SHA256 - Dictionary attack w/ pebbleyou.txt  
`john --format=Raw-SHA256 --wordlist=pebbleyou.txt hashes1.txt`

hashes2.txt - SHA256 - Hybrid Mask attack w/ [DND Base Classes](https://www.d20srd.org/indexes/classes.htm) + ?d?d?d?d  
`john --format=Raw-SHA256 -w=DND.txt --mask="?w?d?d?d?d" hashes2.txt`  
`john --format=Raw-SHA256 -w=DND.txt --mask="?d?d?d?d?w" hashes2.txt`

hashes3.txt - MD5 - Incremental attack  
`john --format=Raw-MD5 --incremental hashes3.txt`

hashes_crypt.txt - Crypt - Single Crack attack  
`unshadow passwd.txt shadow.txt > hashes_crypt.txt`  
`john --format=Crypt --single hashes3.txt`
