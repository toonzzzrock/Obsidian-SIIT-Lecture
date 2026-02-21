---
title: "network security"
created_date: "2026-01-30"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# network security

## packet sniffer
- in broadcast media (like wifi), anyone can capture packets
- promiscuous network interface reads/records all packets passing by

## IP spoofing
- attacker sends packets with a forged source IP address

## Denial of Service (DoS) attack
- flood a target with traffic to overload it
- Distributed DoS (DDoS): use many compromised systems to launch the attack

# Lines of Defense
- Authentication: verify user identity (passwords, biometrics)
- Confidentiality: encrypt data to prevent unauthorized access
- Integrity: ensure data is not altered during transmission (checksums, hashes)
- Access restrictions: password-protected networks
- Firewalls: middleboxes in access and core networks
	- off-by-default: block all incoming traffic unless explicitly allowed
	- detectingreacting to DOS attack