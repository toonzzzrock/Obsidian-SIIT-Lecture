---
title: "Packet Delay and Loss"
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

# Packet Delay and Loss

- Packets queue in router buffers, waiting for turn for transmission
	- queue length grows when **arrival rate** to link exceeds **output link capacity**
- Packet loss occurs when **memory** to hold queued packets fills up
	- loss packet may be retransmitted by previous node, by source end system, or not at all

![[Pasted image 20260214152445.png]]

use `traceroute` to measure delay by probing each router by 3 packets and measures time intervals between transmission and reply

## Throughput
- Throughput rate (bits/time) at which bits are being sent from sender to receiver
	- **Instantaneous:** rate at given point in time
	- **Average:** rate over long period of time
	![[Pasted image 20260214153025.png]]
