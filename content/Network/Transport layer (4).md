---
title: "Transport layer (4)"
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

# Transport layer (4)
- 2 Protocals:
	- [[TCP]]
	- [[UDP]]



## Reliable Data Transfer
- unidirectional data transfer (control info flow both directions)
- Finite State Machines
![[Pasted image 20260216124241.png]]

### rdt1.0 
> [!note]
> reliable transfer over a reliable channel

- no bit errors
- no loss of packets
![[Pasted image 20260216124941.png]]

### rdt2.
> [!note]
> Channel with bit errors
> 

- channel may flip bits in packet
	- checksum to detect bit errors
- Recovery Methods: Sender sends one packt, then waits for receiver response
	- **acknowledgements (ACKs):** receiver tells sender that packet received OK 
	- **negative acknowledgements (NACKs):**  receiver tells sender that packet received with errors, then sender **retransmits** packet on receipt of NAK.

![[Pasted image 20260216125228.png]]
![[Pasted image 20260216125318.png]]

> [!warning] Flaw
> If ACK/NAK corrupted, sender doesn't know what happened, yet can't retransmit as it possible duplicate. Fix in rdt2.1

### rdt2.1

- In case that ACK/NAK corrupted, sender retransmits packet, but receiver discards duplicate packets.
- To handling duplicates, sender send with sequence number and receiver discards duplicate packets

#### Sender
- send with sequence number added to packet
- 2 sequence of (0,1) will suffice
![[Pasted image 20260216130422.png]]
#### Receiver
- check if received packet is dublicate
![[Pasted image 20260216130527.png]]
### rdt2.2

> [!note]
> a NAK-free protocol used in [[TCP]]

- Instead of NAK, receiver sends ACK for last packet received OK (with sequence number)
- Duplicate ACK at sender indicates that packet or ACK corrupted, so sender retransmits current packet.
#### Sender
![[Pasted image 20260216131008.png]]
#### Receiver
![[Pasted image 20260216131025.png]]

### rdt3.0
> [!note]
> channels with errors and loss


> [!warning] performance issue
> ![[Pasted image 20260216131654.png]] 



Sender waits reasonable amount of time for ACK
- Retransmits if no ACK received in this time
- if packet (or ACK) delayed:
	- retransmission will be duplicate-check sequence number and discaard
	- receiver specify sequence of packet being ACKed
- use countdown timer to interrupt after reasonable amount of time

![[Pasted image 20260216131521.png]]
![[Pasted image 20260216131542.png]]

#### Example

![[Pasted image 20260216131549.png]]
![[Pasted image 20260216131620.png]]


### rdt3.1

> [!note]
> pipelined protocols operation

- **pipelining:** sender allows multiple "in-flight" yet-to-be-ACKed packets
	- Range of sequence numbers must be increased
	- Buffering at sender and/or receiver

![[Pasted image 20260216131939.png]] ![[Pasted image 20260216131946.png]]
#### Go-Back-N (no buffer at receiver)
 
- sender
	- can have up to N unACKed packets in pipeling
	- ignore duplicate ACKs
	- timeout (n): retransmit packet n and all higher sequence number packets in window
- receiver
	- send ACK for correctly-received packet so far with highest in-order sequence number
	- on receipt of out-of-order packet
		- discard
		- re-ACK packet with highest in-order sequence number

![[Pasted image 20260216132132.png]]

#### Selective Repeat (Buffer at receiver)
- sender:
	- times-out/retransmits individually for unACKed packets
	- sender window: N consecutive sequence number
- receiver
	- individually ACKes all correctly received packets

![[Pasted image 20260216133519.png]]