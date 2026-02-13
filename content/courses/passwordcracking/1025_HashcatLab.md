---
title: PC1025 - Hashcat Lab
# subtitle: Hashcat Lab
date: 2026-02-06
lastmod: 2026-02-13
tags: [Labs, PasswordCracking]
draft: false
---

<!--more-->
## Prerequisites ##
[PC1010 - Intro to Password Cracking](/courses/passwordcracking/1010_introtopasswordcracking)  
[PC1020 - Intro to Hashcat](/courses/passwordcracking/1020_introtohashcat)  

## Disclaimer ##
The content of this lab is for educational use only. I do not condone the use of information from this post for illegal or unethical purposes. 
Use this information only with explicit permission from the owner of the data. **Don't be a Script Kiddie**

## Resources Required ##
* Text editor
* Hashcat
* pebbleyou.txt (rockyou.txt will work too)

## Lab Prompt ##
We conducted security assessments on 3 of the company departments. With each one, we were able to extract some hashes for various user accounts. Each department has different policies for setting passwords. Find the patterns and crack all the passwords!  

[Download PC1025.7z](/assets/files/PasswordCracking/PC1025.7z)  
* pebbleyou.txt (1/4 the size of rockyou.txt)
* hashes1.txt (5 hashes)
* hashes2.txt (10 hashes)
* hashes3.txt (10 hashes)

#### PC1025.7z Checksums:  ####
MD5: `38be75cb50e46ae0df8e5f2bc035b367`  
SHA256: `63c65eb239f0624c6efaae2d6c19d9e89fa281666a46afdc2172eaedd38cdc2e`  

**hashes1.txt** 
```bash
d5cec0a4dab34d51eaa57c97adf7a3262c43a2f1c17369ceb11b40e06714f087
f1da9421394e4892f3ed37287493ec319f321d23c1fa6c4dba10fbdda95186a3
becedec1e34ba27a9684af85e6e49c5e4e5124520b6ba059820f8b4bb60c328f
3684ef64d82e08cf5cac8c8a206498b67d12971a8721a5519a0e2c9d2f3ee151
d0a5e64798ce47fddd565cbe02e22ffeda835dd819b15528dd62e80e45328a75
```

**hashes2.txt** 
```bash
1d06f250bea546b9862fab4751a6f056
12169d5a079252c9ba59973f163c4018
46eb1366c2330cf43708fac464ee621a
bbdc19c246e4af6b5de0398200f0b273
b15e08431a9f6b953990f683e62e1f5b
d4afdff6af559ae2a90718d33884328c
4a57e052a5d3249d90fb1236be483250
c71e16bc1cb82eafb1a71c3568fcb630
ffebea881107ff35c46a96b69f037105
4c4f00ea90364c4b288090b1855de5f7
```
**hashes3.txt** 
```bash
013c17dfad9f7825409dd056dcf5e23f
20f016fb1b49fc30be42b16681095894
92bd80147f593124b29284f5f86a1a33
2053e189fc090b28a82dafe5170034dc
3645dd1e88f1a094bac6d77e1ef78e98
5117c5256fa5bba0cee2b3e808b095f6
c858e99573c8a1002d05aedd999bde60
b4bc74022136b55bc2292808cc262f1a
fcc0d3f957606f61aeb8448e449509e5
89049e99c4fd6a21863b430f0ccae5ee
```

## Solutions ##
hashes1.txt - SHA256 - Dictionary attack w/ pebbleyou.txt  
`hashcat -m 1400 -a 0 hashes1.txt pebbleyou.txt`
```bash
d5cec0a4dab34d51eaa57c97adf7a3262c43a2f1c17369ceb11b40e06714f087:secureme123
f1da9421394e4892f3ed37287493ec319f321d23c1fa6c4dba10fbdda95186a3:catlovermeme
becedec1e34ba27a9684af85e6e49c5e4e5124520b6ba059820f8b4bb60c328f:securityadmin284650
3684ef64d82e08cf5cac8c8a206498b67d12971a8721a5519a0e2c9d2f3ee151:mypasswordistooshort
d0a5e64798ce47fddd565cbe02e22ffeda835dd819b15528dd62e80e45328a75:loveredbull
```
hashes2.txt - MD5 - Hybrid attack w/ [names](https://github.com/dominictarr/random-name/blob/master/first-names.txt) + year  
`hashcat -m 0 -a 6 hashes2.txt names.txt '?d?d?d?d'`
```bash
1d06f250bea546b9862fab4751a6f056:Steve1951
12169d5a079252c9ba59973f163c4018:Mary1976
46eb1366c2330cf43708fac464ee621a:Joseph1980
bbdc19c246e4af6b5de0398200f0b273:Susan1907
6ce49fd8e5e059c355a0a019f8f14278:Tommy1999
d4afdff6af559ae2a90718d33884328c:Sarah2002
9cb621e35b09f87e7374dd48186df478:Alex1970
c71e16bc1cb82eafb1a71c3568fcb630:Emily1965
974b867bf05847d75352159ff4955aa9:Frank1984
4c4f00ea90364c4b288090b1855de5f7:Ashley2008
```
hashes3.txt - MD5 - Combinator attack w/ [colors](https://gist.github.com/mordka/c65affdefccb7264efff77b836b5e717) + [animals](https://gist.github.com/atduskgreg/3cf8ef48cb0d29cf151bedad81553a54)  
`hashcat -m 0 -a 1 hashes3.txt colors.txt animals.txt`

```bash
013c17dfad9f7825409dd056dcf5e23f:greencow
20f016fb1b49fc30be42b16681095894:redgoose
92bd80147f593124b29284f5f86a1a33:pinksquirrel
2053e189fc090b28a82dafe5170034dc:pinkpony
3645dd1e88f1a094bac6d77e1ef78e98:bluedog
5117c5256fa5bba0cee2b3e808b095f6:yellowpony
c858e99573c8a1002d05aedd999bde60:orangebison
b4bc74022136b55bc2292808cc262f1a:indigofrog
fcc0d3f957606f61aeb8448e449509e5:whitefox
89049e99c4fd6a21863b430f0ccae5ee:bluecat
```
