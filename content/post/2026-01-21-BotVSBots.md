---
title: BOT vs Bots
subtitle: Hacking Robots With the Baddies of Tech
date: 2026-01-21
tags: [Club]
draft: false
---

The [Cybersecurity Club's](https://huntsman.usu.edu/clubs/soc) collaboration event with the [Baddies of Tech Club](https://huntsman.usu.edu/clubs/bot). We taught beginner cybersecurity topics, introduced some common website vulnerabilities, and exploited a few of them by hacking robots.
<!--more-->
This event was one that we had been talking about doing for months. We were worried about doing something beginner friendly enough for those that had never touched cyber, yet complex enough that the more knowledgable students wouldn't be bored. It worked out far better than we could have expected!
## Intro to Cybersecurity - Why should we care?
Everyone has data that they want to keep private. From SSNs, to bank records, to photos, we don't want all that available for just anyone to grab! This is why, for keeping it simple, we defined cybersecurity as "Data Security". 
We talked about the 2025 OWASP Top 10, a list of the most common website vulnerabilities. For the robot hacking, we focused mostly on *insecure design* and *injection*.
## Insecure Design ##
Many programmers just want something that works, but fewer think about how someone wants to make sure that it doesn't. Insecure design can be found throughout programs in various ways:
* **Information exposure** - Comments and pages that shouldn't be visible, are. 
* **Client side validation** - Users of the website can change information that affects the server
* **Poor sanitation** - Leading us to the next vulnerability
## Injection ##
Injection is when someone intentionally inputs something that the program doens't handle properly. There's quite a few different types of injection attacks
* **Code injection** - Attackers insert and execute malicious code by exploiting improper handling of untrusted input
* **SQL injection** - Malicious SQL statements are inserted into an application to manipulate a database in ways that they shouldn't
* **Command injection** - Attackers execute system commands on a host by injection them through vulnerable application inputs
* **Cross-Site Scripting** - Malicious scripts are injected into trusted websites and executed in user's browsers
## Hacking the Robots ##
The code and design for the robots can be found [here](https://github.com/SammyBJames/Battle-Bot)
The challenge was simple: By the end of the hour, get into the robot's login page, escalate to admin, and then race the other robot to the top of the classroom. 
We broke the challenge out into 3 parts that the students would have to learn more about as they went:
1. Information Exposure 
2. Insecure Design
3. SQLInjection
2 teams were formed, and the hacking began. 

Although we had around 40 to 50 people in the room, no one was left out. The students that caught on to things quicker were happy to teach the rest of their team before moving on. Checking in every few minutes, both teams were figuring out information before I could even give them the hints. With about 10 minutes left of club. A robot moved and immediately drove into a wall. The inputs queue up when you spam them, and in excitement of getting into the admin page, the first robot was turned over turtle. The team reset and worked their way up the ramp to the top of the room. 

Only a few minutes later, the second bot was moving as well, not by one of the Cybersecurity Club members, but BOT! They had worked with SQL before and had done SQL injections, so it was just a matter of changing the formatting to work for SQLite. Both teams had successfully hacked into the robots and got them racing to the top of the class right as club wrapped up.
## What Can We Learn By Hacking Robots? ##
* Keep information exposure to a minimum - If you don't want other people seeing it, don't have it anywhere to be found
* User server side as much as possible - Clients should never be able to make modifications to a page
* Sanitize your inputs - Make sure that escape characters are accounted for

Thanks so much to the Baddies of Tech for doing this collaboration with us! It was such an awesome event, and lots of my club members expressed how much fun they had!
