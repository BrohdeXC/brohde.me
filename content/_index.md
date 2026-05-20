---

---

<section class="hero">
  <div class="terminal-line">
      <span class="prompt">root@brohde:~#</span>
      <span id="rotating-text"></span>
      <span class="cursor">█</span>
      <p></p>
      <p>I break systems to understand them.</p> 
      <p></p>
      <p>I study penetration testing, wireless security, attack surfaces, and offensive tool development. I look at packets on the wire, how systems communicate, and how assumptions are an exploitable weakness.</p>
      <p></p>
      <p>I'm particularly interested in offensive skills involving wireless networks: WPA protocols, packet injection, wireless assessments, and Wi-Fi engineering.</p>
      <p></p>
      <p>I love teaching the skills that I learn to others, which is why I'm developing a <a href="/courses/passwordcracking/syllabus">password cracking course.</a></p>
      <p></p>
      <p>Check out my latest <a href="/blog/2026-04-30-graduation">blog post</a> and my latest  <a href="/projects/shellfire">project!</a></p>
      <p>Also watch my latest YouTube video!</p>
      <iframe width="100%" height="320" src="https://www.youtube.com/embed/Mt9D6AqybYg?si=IQJskxpoaNpJ9hC3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
  </div>
</section>

<script>
const phrases = [
    "Brute forcing directories...",
    "Checking robots.txt...",
    "Heating print nozzle...",
    "Drinking Red Bull...",
    "Trying Harder...",
    "hashcat -m 22000 -a 0 wpa2_hash.txt /usr/share/wordlists/rockyou.txt",
    "Enumerating websites...",
    "Fighting BurpSuite...",
    "Looking for flags...",
    "aircrack-ng -w /usr/share/wordlists/rockyou.txt capture.pcap",
    "gobuster -dir -u http://brohde.me -w common.txt",
    "Investigating who's in my VM...",
    "$P34K1NG 1N 1337...",
    "....................",
    "Utilizing GPU for Hashcat...",
    "Searching through GitHub for leaked credentials...",
    "Using the credentials I found to log in...", 
    "%7BHTTP%2DHEADERS%7D",
    "Waiting on 3D prints...",
    "Eating cold pizza...",
    "Breaking assumptions...",
    "--help",
    "Cracking passwords...",
    "Understanding thy Enemy...",
    "Reading 'The Cuckoo's Egg'",
    "Leveling print bed...",
    "--script=http-enum",
    "1337ness",
    "3.1415926535897932384626433",
    "onesixtyone 192.168.10.0/24",
    "53... It's always DNS",
    "%7D",
    "Drinking another Red Bull...",
    "nmap -sS -p 80,443 brohde.me --script=http-enum",
    "Modeling in SolidWorks...",
    "01010100 01110010 01111001 00100000 01001000 01100001 01110010 01100100 01100101 01110010",
    "whoami",
    "Checking Discord...",
    "sudo pacman -S john",
    "Yet another Red Bull...",
    "Studying Galois Theory..."
];

let phraseIndex = 0;
let charIndex = 0;
let deleting = false;

const textElement = document.getElementById("rotating-text");

function typeEffect() {
    const current = phrases[phraseIndex];

    if (!deleting) {
        textElement.textContent = current.substring(0, charIndex++);
        if (charIndex > current.length) {
            deleting = true;
            setTimeout(typeEffect, 1400);
            return;
        }
    } else {
        textElement.textContent = current.substring(0, charIndex--);
        if (charIndex < 0) {
            deleting = false;
            phraseIndex = (phraseIndex + 1) % phrases.length;
        }
    }

    setTimeout(typeEffect, deleting ? 35 : 75);
}

typeEffect();
</script>
