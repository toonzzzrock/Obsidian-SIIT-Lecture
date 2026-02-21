---
title: "TCP"
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

# TCP

reliable, byte stream-oriented transport protocol

- server process must first be running
- server created socket for client
- client create socket to IP address, port number
![[Pasted image 20260216170033.png]]-
## Multiplexing
- demultiplexing using 4-tuple: 
	- source IP
	- source [[port]]
	- destination IP
	- destination [[port]]

## Connection
### Open
TCP 3-way handshake
1. Initiating client requests a client-to-server: client send SYN
2. The server acknowledges and requests a server-to-client: server send SYN, ACK
3. The initiating client acknowledges the server to client: client send ACK
![[Pasted image 20260216163606.png]]
### Closing a TCP connection
- client/server each close their side of connection by send TCP segment with FIN bit = 1
- respond to received FIN with FIN, ACK
- TCP connection is closed when both sides have received ACK for their FIN
![[Pasted image 20260216165324.png]]

## Socket
![[Pasted image 20260216021829.png]]
### TCP Server 
![[Pasted image 20260216021835.png]]
### TCP client 
![[Pasted image 20260216021843.png]]


## Fast Retransmit

- Receiver sends duplicate ACKs if it receives out-of-order segments (indicating a segment may
- Sender retransmits a segment if it receives 3 ACKs for the same data (duplicate ACKs)

![[Pasted image 20260216165812.png]]

## Flow Control

- If network layer delivers data faster than application layer can read, receiver's buffer may overflow
- TCP uses flow control to prevent overflow: sender limits amount of data in transit
- Receiver advertises available buffer space (receiver window) to sender in `rwnd` (receive window) field in TCP header
- sender limits amount of unACKed dita to received `rwnd` 
![[Pasted image 20260216172232.png]]
![[Pasted image 20260216170155.png]]

![[Congestion Control#End-end congestion control]]

