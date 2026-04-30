---
title: In-House CTF 2026
subtitle: Getting the Students to Show Off Their Skills
date: 2026-03-05
# lastmod: 2026-
tags: [Club]
draft: false
---
In the cybersecurity club, we have a tradition that the board members would put together a CTF for the students to play every spring semester. What made this different from the [King of the Hill](/blog/2026-02-25-kingofthehill) is that this event runs for the entire week, has more teams, and more complex challenges. This was my experience with building out some of those challenges. 

<!--more--># 

# Building My Challenges
I was mostly in charge of Password Cracking, Networks, and Cryptography. I also built out a couple challenges for Forensics, OSINT, and some others. The order of this post is the order that I started each category, but I definitely hopped around a bunch when it seemed appropriate 

## Cryptography ##
I was most excited to build out the crypto challenges first this CTF. I came across a screenshot from over a year ago of a cipher that I wanted to try. `Tweet Tweet` is a pretty straightforward challenge once you know what you are looking at, just a simple substitution cipher. The challenge with it is that I photoshopped the code onto an image to make it less obvious. It also doesn't allow for copy and paste, so anyone solving the question will need to have a careful eye to avoid getting the challenge incorrect. This challenge got me to mess around with some new tools in GIMP, such as the magic wand tool. 

The next challenge, `Toaster Strudels`, was inspired by a video that I stumbled across on YouTube. After messing around with the tool to make the challenge, I managed to create a pretty sweet [beat](https://strudel.cc/#Ly8gRHJ1bXMgKCMgb2ggZGV0ZXJtaW5lcyByb3cpCiQ6IHNvdW5kKGAKWy0gIC0gIC0gIC0gXSBbLSAgb2gqMSAgLSAgIC0gXSwgCltoaCAtICBoaCAtIF0gW2hoIC0gIGhoIC0gXSwKW2JkIC0gIGJkIC0gXSBbYmQgLSAgYmQgYmQgXQpgKS5iYW5rKCJ0cjkwOSIpLmdhaW4oLjYpLl9waWFub3JvbGwoKQovLyBDaG9yZHMKJDogbm90ZShgCjxbRTMgRTMgRTMgRDNdLzQsIApbQzMgQzMgRGIzIEMzXS80LApbQTMgRzMgQTMgQTNdLzQ%2BCmApLnNvdW5kKCJzYXd0b290aCIpLmRlbGF5KC4yKS5nYWluKC41KS5fcGlhbm9yb2xsKCkKCi8vIEhhcm1vbnkgCiQ6IG5vdGUoIjxbODMgNzkgNjcgLSBdIDxbODMgNzggNzEgLSBdIFstIDc2IDg2IDc2XT4%2BKjIiKS5zb3VuZCgic2F3dG9vdGgiKS5nYWluKC41KS5fcGlhbm9yb2xsKCkKCg%3D%3D). It took me way too long to figure out the chords. I haven't messed around with music theory in a long time, so I hope that I was able to make something at least somewhat not-ear-destroying. This was my first time using any sort of Java-style programming, and it was definitely a first for coding music. I do like the program, and perhaps I'll use it to create some soundtracks for my game dev era if that ever happens.

## Password Cracking ##
After having my fun with cryptography, it was time to go where I really shine: password cracking. The first challenge, `Queen's Greatest Hits`, was pretty easy to make. As you can imagine, I took inspiration from the band Queen, and I used some of their hit songs as passwords found on the rockyou wordlist. There wasn't anything complex about this one, as it was meant to be an easy challenge to solve in a couple minutes.

The next password cracking challenge I made, `3FA`, gets to be tedious, much like MFA. I have an /etc/shadow password on an encrypted pdf, which is then encrypted in a zip file. The purpose of this challenge was to really drive home the capabilities of John, being able to extract hashes, and crack some niche ones that hashcat doesn't support. I also covered both dictionary and combinator attacks. I ranked this one at medium difficulty, hoping that my hard challenge would really test the limits of my students' password cracking abilities.

My hardest password cracking challenge I called `Firewall Rules`. I provided the students with a pcap file and told them to find the password of a specific WiFi Network. Using some craf

## Networks ##
I had the most fun building out the network challenges for this in-house. My easy challenge was pretty similar to the one I used for the King of the Hill, just some easy message that can be found in some bytes of the packet

My medium challenge I called `Always Other Options`. Those of you that know might already see where this is going. I used scapy to inject some packets into the network to match the DHCP server on my network, a keen eye will notice that something is off with the options, and should be able to piece together the flag. I had a blast learning about all the different types of options available as I picked a few to modify.

The hard network challenge was inspired by a challenge that I did in a CTF last year. `NetDoctor` takes a bunch of data, splices it up across hundreds of packets, reverses the text, and the students get to solve it! This type of challenge was the one that I had the most fun solving last year, so I wanted to see if I could make a similar challenge myself.

## OSINT ##
The easy OSINT challenge was pretty straightforward. `We` shows a picture taken from on top of a building and I asked the students to identify which building it was. A reverse image lookup should be able to give enough information to figure this out. The picture is in Paris, and "We" is a play on "Oui". 

The medium challenge, `CA`, was the hardest for me to make of the OSINT challenges. The main problem I had was coming up with a challenge that wouldn't be too hard, but not too easy. Had I thought about this sooner, I would have liked to have some modifications to my website and had them use Wayback Machine to solve. However, I was not that prepared and instead I asked them to find the root CA for my website. I think understanding how CA's work is important, so it will at the very least give them an understanding of that topic. 

My hard OSINT challenge, `Monster Hunter: Part 1` was very Bellingcat, some people would say. While I was out on my work trip over spring break, I took pictures of different cans of Monster at different times of the day. Students needed to use the timestamps of the photos along with the shadows of the objects to figure out what city I was at. This challenge was fun to make, except for the fact that Mother Nature was stressing me out with clouds and rain every day except the last.

`Monster Hunter: Part 2`, continues off of part 1 where I provided an image mid air during the flight home and asked the students to figure out what seat I was on in the plane. Using public plane data, they were able to find what flight I was on, find a seatmap, and determine from the picture which seat I was in. The biggest issue I had with this one was the majority of flight trackers make you pay for their advanced subscription if the flight was a week in the past. Fortunately this particular route used the same type of plane every day, so I was able to redirect students to that after

# The CTF
The CTF went pretty well, but not without it's problems. We found that our scoring system needed to be updated, because it very quickly became a KOTH battle of who could stay up later at night to submit the flag, rather than primarily solving challenges. We also had an instance of some people breaking our rules. We were monitoring the scoreboard late at night and saw a "tester" team join, brute force a bunch of attempts on my Monster Hunter challenges, and then submit the flag on the normal account. 

There was a problem though. Our logging system wasn't good enough to get any IP addresses of submissions, but we at least knew what team did it because I intended for the challenges to take a good 10-15 minutes at least in between them. The rest of the CTF was us trying to figure out how to be fair to other players while giving an adequate punishment to the individual on the team. Eventually, we got everything sorted out and were all able to still have a good time.

# Next Year
* Update the logging system to focus more on solving the challenges
* KOTH aspect should only be a minor point bonus
* Improve logging
* More clarity on what version of the challenge is active. Many people resubmitted an old flag
