---
title: "Windows Sockets Model"
created_date: "2026-02-14"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Windows Sockets Model
![[Pasted image 20260214155728.png]]

## Process Communicating
- **Process**: program running within a host. 
	- **client process:** process that *initiates* communication.
	- **server process:** process that *waits* to be contacted.
- Within **same host**: Communicate using **inter-process communication**.
- **Different hosts**: Communicate by exchanging **messages**.

![[Pasted image 20260214160546.png]]
- **Sockets**: The "door" through which a process sends/receives messages. It is the interface between the application process and the transport layer protocol (TCP/UDP).
	- 2 sockets involved: one on each side.

## Addressing Processes
- Host device has unique 32-bit address, however many process can run on same host, so we need to *identify* which process to send message to.
- Identifier includes both **IP address** and **port numbers** on host.
- Example Port numbers:
	- HTTP server: 80
	- Mail server: 25
- To send HTTP message to `siit.tu.ac.th` web server:
	- IP Address: 128.119.245.12
	- Port number: 80
![[Pasted image 20260214162300.png]]