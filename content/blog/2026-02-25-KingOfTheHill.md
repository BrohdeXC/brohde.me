---
title: King of the Hill
subtitle: Building CTF Challenges For This Week's Club Event
date: 2026-02-24
# lastmod: 2026-02-03
tags: [Club]
draft: false
---
For Cybersecurity club this week, we built a knockout-style CTF to run for the hour. This is meant to be a warmup to get people excited about competing in NCL and the In-House CTF we're hosting in March. I'm primarily focused on creating password cracking and network challenges, and I'll talk about my process in building those out, as well as any other challenges I make.

<!--more-->
![KingOfTheHill](/assets/img/Projects/CTFs/KOTH.png)
# The CTF Itself #
The point system of this CTF was pretty straightforward. Instead of just getting points for capturing the flag, points would accumulate based on how long you have the flag before other teams capture it. Once other teams start getting the flag from the same challenge, the points would be split across the teams until every team has gotten the flag. At that point, it would no longer generate points. 

Since our club meetings are only an hour long each week, I needed to keep the difficulty in the easy to medium level range.

The point breakdown for a group of 4 teams would look like this:
| Who Has The Flag | Team 1 | Team 2 | Team 3 | Team 4 |
| :------------: | :------: | :-----: | :------: | :------: |
| Team 1 | 100% / min | 0% / min | 0% / min | 0% / min |
| 1 and 3 | 50% / min | 0% / min | 50% / min | 0% / min |
| 1, 3, and 4 | 33% / min | 0% / min | 33% / min | 33% / min |
| Everyone | 0% / min | 0% / min | 0% / min | 0% / min |


# Building My Challenges # 
The categories that I'm most comfortable building challenges in are password cracking, cryptography, and OSINT. However, I'm quite interested in network log analysis and am going to be attempting to create some challenges in that category as well.

## Password Cracking ##
Password cracking speed depends on a couple factors: 
* Hardware being used
* The type of hash being cracked
* Wordlist length  

What makes creating these challenges hard is that I need to balance these things for any sort of hardware that the competitors are using. I built my PC for password cracking, but I need to take into account the people using a raspberry pi. The goal of making these challenges was to make passwords complex enough to not be brute forced in the time frame, but fast enough that low end computers could do it within that same time.

My process for creating password cracking challenges typically goes like this:
* Easy: Dictionary or Combinator attack
* Medium: Hybrid attacks / Rainbow tables
* Hard: Complex rulesets and custom wordlist building

Since I didn't need to deal with hard challenges for building this CTF, I worked within the easy and medium ranges. I avoided rainbow tables for this one, because I don't expect anyone to have the tables downloaded beforehand for an hour long challenge. I like to start with the narrative when I create challenges, it helps keep the passwords in a similar format. 

Once I had an idea of the type of challenges and a story for each one, I generated hashes. Typically I work with unsalted MD5 or NTLM hashes, but that can get predicatable so I changed it up a little bit. I just have to make sure the students really paid attention during my password cracking lecture.

The easy challenge I called `Retro`, and each of the users are named after the pac-man ghosts except for the admin, which the player will submit. Being an easy challenge, I wanted to give them something that they could piece together and figure out with a simple hybrid mask attack that could be figured out by the ghost's accounts.

For the medium challenge, I was inspired by an old CTF challenge I did where we were given a bunch of Pokemon names. I wanted to switch it up a little bit and go with another childhood toy I used to have: Bakugan, which is why I named this challenge `Spring Powered Magnet Balls`. This challenge required some custom wordlist building on the player's end, but shouldn't require any complex rulesets. 

After I created the challenges, I needed to test them to make sure that they would work in a decent time frame. Once I did that and verified the challenges were good, I saved the hashes and the prompts and worked on the next challenge.

## Network Log Analysis ##
Since I had never really made any network challenges before this one. I wasn't sure where to start. In previous CTFs, I was almost always given a pcap file and asked questions about it. I figured the best way to go about this would be to start a packet capture in my test lab, and then send a file from one device to another. 

After trying that, I quickly found SCP to be a problem because it uses SSH. Who would have guessed that security was secure? I opted for a docker container that would host OWASP Juice Shop and then I could follow the traffic on that. However I quickly remembered that I am not a web exploitation guy (yet) and after looking through the traffic of my sad Juice Shop, I decided scapy would be the better tool for me.

Scapy is super cool because it allows us to craft packets that we can inject into the network. This makes it super easy for me to hide things in the network without setting up a bunch of infrastructure. It's been a while since I used this tool, so I have to refresh on a lot of documentation. By the way, the open source intelligence flаg is ᴜsᴜ(opnsrcmstr), but don't copy-paste it, because I used cryllic variations and other symbols in order to avoid control-find. The format of this f1ag is all uppercase, with curly brackets instead of parentheses.

My medium challenge is what some people would consider evil. The title is `007 - NoTimeTo!Die`. Scapy makes some light work out of this, but it's a beautiful challenge. I built out a script that would let me input some string and it sends it out as individual packets as a spoofed IP. This was probably my favorite challenge to make for this CTF. I had a good time learning how to use Scapy for it.

The easy challenge I called `DigNSlookup`. Neither of those tools were helpful to the challenge, but I did spam them a lot in creating noise for the pcap. Again, I used Scapy to send a packet that would gather the information that I wanted. In hindsight, I could have just used Dig for the same information, but I'm determined to getting better at Scapy because I think it's super cool.

## OSINT ##
My favorite kind of challenges for OSINT are GeoGuesser style. Unfortunately I did not have enough time to fly somewhere, take pictures, add timestamps, and make people use shadows to find the location. However, I have hidden a flag somewhere on my website. Maybe it's in this post? Maybe it's in my courses? Maybe I hid it in one of my password cracking labs? It isn't USU{NOT-THE-FLAG}, but I thought it would be funny to put that here as a red herring. 

I would love to find the Google Street View car some day just to have a massive banner with a CTF flag on it. Wouldn't that be so cool to send your friends on a CTF to find your location only to find out that it was a flag all along? Maybe some day. 

Anyways, OSINT is pretty cool, I only really made the one challenge posted somewhere on this website, so there isn't much to talk about in this section.

## Cryptography ##
Steganography is one of my favorite forms of cryptography. The idea of hiding a chunk of data in an image is really cool to me. I decided that I would make 3 separate cryptography challenges. Steganography, a cipher, and something using Cyberchef's advanced features. I've never really had the opportunity to use some of the more complex Cyberchef operations in a CTF, so I wanted to try and build one out for the students to try!

For the first challenge, `MusicMan` I opted for a Cipher. Given that I've played music my whole life, I wanted to build something that would go good with that. I saved the file as a PNG, so maybe I'll throw off some people a little bit as they search for steganography or metadata.

The next challenge was the actual steganography. `NoProblemCTF` was nothing too complex, just hiding some data in a file. Not terribly exciting, but good knowledge to know. Obviously, I had to hide the data in a meme that I made. For those of you that want to see it, here it is:
![NoProblemCTF](/assets/img/Projects/CTFs/NoProblemCTF.jpg)

The last challenge, `Colors`, was where I really got to play with some new stuff. Looking into CyberChef and a bunch of its tools, I realized quickly that there is a LOT of options. Honestly, it was a bit overwhelming to go through these, but I found something that I think is fun. However, it took me too long to realize that a screenshot would destroy the alpha of the RGBA values. I got rid of the alphas because if they caused problems for me, they would probably cause problems for the students. The goal was to give something that was just vague enough that students that caught on would have it done fast, but could waste time otherwise.

# Overall Thoughts #
Overall, I had lots of fun creating these challenges. Some of them got me to try out new tools like Gimp, and others refreshed me on tools I haven't used in a while like Scapy. I think after making these network Challenges, I might have a new favorite category... Nah, password cracking will always have a special place in my heart. I'm looking forward to making new challenges for the In-House CTF this March. We'll be bringing a couple more people on to help build that one, so hopefully we'll see more logging and forensics challenges!
