---
title: Learning Linux Mini-CTF
subtitle: Building My First CTF
date: 2026-01-28
# lastmod: 2026-02-03
tags: [Club, Linux]
draft: false
---
The Intro to Cybersecurity Class this week is learning how to use Linux. Since it's still the beginning of the semester, it would be a good idea to have the club review their Linux commands as well. I put together a mini-CTF for the club meeting for students to hone in on their terminal knowledge. From changing directory to steganography, I hid 20 flag in a zip file for everyone to find.
<!--more-->

## Overview 
Most of the students of the cybersecurity club have had some knowledge of Linux, this meeting wasn't so much "what it is" as it was "how to use it". We talked about various ways to set up Linux on systems on different types of machines and covered some of the basic commands that they should expect to use. 

## Getting Linux Terminal Commands
**Windows:** install WSL (Windows Subsystem for Linux)
  * Powershell > `wsl --install`
  * Click on the little drop down at the top of the powershell window and select one of the Linux distributions

**Mac:** install brew
  * Most of the basic commands used are available on Mac, but for commands that aren't on your system, you'll need [Homebrew](https://brew.sh/) 
  
**Linux:** you're already here!

## Installing Tools 
* I am assuming that you are using the *apt* package manager
* `sudo apt update`
  * Updates packages and syncs local packages to online repositories
* `sudo apt install {package_name}`
  * Installs a new package
* `sudo apt remove {package_name}`
  * Removes an installed package

## Special Characters
`*` (asterisk) - A wildcard character
  * Matches any number of characters
  * "filename*.txt" matches filename1.txt filenamehello.txt, etc.
  * "filename*.txt" would **not** match filename1.png because they are file types
    
`|` (pipe) - Redirects output from the left side of the pipe to the command on the right side
  * `echo "helloworld" | base64` would send the output "helloworld" to the base64 command to encode it. 
  * The output is `aGVsbG93b3JsZAo=`
  
`>` (right angle bracket) - Redirects the output of the command on the left to the file on the right
  * `echo "helloworld" > out.txt` would overwrite the contents of  "out.txt" are as "helloworld"
  * `echo "helloworld" >> out.txt` would append "helloworld" to the last line of "out.txt"

## Basic Linux Commands
`man {command}`
* Shows detailed information and options for the command
* `man grep` - Shows help for the grep command

`ls or ls {directory}`
* Lists files and directories in the directory. 
* Uses the current directory when none is given
* Use `ls -a` or just `la` to show hidden files as well

`tree or tree {path}`
* Lists files and directories under the directory
* Uses the current directory when none is given

`cd {directory}`
* Navigates you to the directory
* `cd Downloads` - Puts you in the Downloads directory.

`mv {filename} {new_name}`
* Renames (or moves) the file
* `mv old_file.txt new_file.txt` - Renames old_file.txt to new_file.txt

`cp {filename} {destination}`
* Copies the file to the destination directory and name
* `cp file.txt /Downloads/file.txt` - Copies file.txt into the Downloads directory

`cat {filename}`
* Prints the contents of the file

`grep “{query}”`
* Prints all lines of the input that contain your query
* `cat file.txt | grep “secret”` - looks for the string "secret" within file.txt 

`file {filename}`
* Shows what type the file is (e.g. TXT, JPG, etc) and information about it

`rev`
* Reverses the input text
* `echo "hello" | rev` - outputs "olleh"

`strings`
* Gets the human-readable text from the input
* `cat file.bin | strings` - outputs all unicode characters from file.bin

## Download the CTF!
[Download Link](/assets/files/LinuxCTF.7z)

MD5: `0ff3b69c66c6bd5a171c6d0cdfda8a07`

SHA256: `fa40ec3147b76c940d7fbf0df5b50056d41c35df4e65126317ce187972a956e`

## SOCLinuxCTF
```
README.md
Welcome to the SOC Learning-Linux CTF!
There are 20 flags hidden throughout this directory, your goal is to find them all!
All flags follow this structure: ClubCTF{5f4dcc3b5aa765d61d8327deb882cf99} 
They all use VALID HEXADECIMAL format

You will be testing your Linux terminal knowledge in many ways here. From simply reading a file to password protected zip folders, you will likely need to do research in order to find all the flags!

Hint: Some of the files might have information that can help out on other flags

Good Luck!
```

What the students don't know is that the hexadecimal values are MD5 hashes for the final secret password.

## SPOILERS: Where To Find The Flags ##
```
flag01.txt - ls/cat - root directory
.flag02.txt - ls -la - hidden file in root directory
flag03.txt - ls -la - hidden directory in root directory
.flag04.txt - tree -a - LONG directory traversal
flag 0 5.txt - escape chars - careful-naming
flag06.jpg - file/mv - rename files with wrong filetype
flag07.txt - 7z x nested.7z - Unzip a 7z archive
flag08.txt - grep - grep for the flag in loreum ipsum
flag09.part* - cat / > / >> - cat out all parts of the file and paste into new file
flag10.txt - base64 - encodes the flag in base64
flag11.py - grep - hidden in a code comment
flag12.bin - strings - hidden in the strings of the binary
flag13.txt - rev - reversed base64 text
flag14.txt* - unicode - zero width chars
flag15.json - jq - json parsing
flag16.zip - unzip / john - password protected zip files
corrupt17.zip - 7z x - Fix a corrupted zip file. 7zip is pretty good about extracting anyways
flag18.png - steghide - Hidden file using steganography **hiddenmessage** 
flag19.txt - hexadecimal - Which one is actually valid hex?
flag20.jpg - finale - Steghide, password protected zips, zip2john, 1337haxorz, sheer awesomeness, !!!secret!!!
```

# Improvements For Next Time
I asked some of the students who completed all of the challenges what they would have liked to seen done differently and I got this feedback:
* Add in exiftool on some of the image challenges
* Reverse engineering a Python script
* Solving challenges with awk/sed
