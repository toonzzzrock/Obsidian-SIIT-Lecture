---
title: "UDP"
created_date: "2026-02-16"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# UDP

- unreliable datagram
- best-effort service
	- may be lost 
	- delivered out-of-order
- connectionless
	- no handshakes between client and server
	- each segment handled independently
	- send with IP destination and port to
- Use by [[DNS]], [[DASH]], SNMP

> [!note]
> - **Fast:** no RTT delay (connection establishment)
> - **Simple:** no state
> - **Small:** Header size
> - **No congestion control**

![[Pasted image 20260216123647.png]]
### UDP server
![[Pasted image 20260216021642.png]]
### UDP client
![[Pasted image 20260216021650.png]]

## Multiplexing
- demultiplexing using 2-tuple: 
	- destination IP
	- destination [[port]]