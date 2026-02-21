---
title: "File Distribution"
created_date: "2026-02-15"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# File Distribution

![[Pasted image 20260215225344.png]]
- $F$: The size of the file to be distributed (in bits).
- $N$: The number of peers (clients) that need to receive a copy of the file. 
- $u_{s}$​: The **upload capacity** of the server (bits per second). 
- $d_{i}​$: The **download capacity** of the $i$-th peer.
- $u_{i}$: The **upload capacity** of the $i$-th peer. 
- $d_{min}​$: The minimum download capacity among all peers ($\min\{d_{1}​,d_{2}​,...,d_{n}​\}$).

## [[Client-Server]] Distribution Formula

In a client-server architecture, the server must send a separate copy of the file to every one of the $N$ peers. The distribution time ($D_{c−s}$​) is limited by two main bottlenecks:
$$D_{c-s} \geq \max\left\{\frac{NF}{u_{s}}, \frac{F}{d_{\min}}\right\}$$
- $\frac{NF}{u_{s}}$ (Server Bottleneck): The server transmit $N$ copies of file size $F$ with upload rate $u_{s}$.
- $\frac{F}{d_{\min}}$ (Client Bottleneck): Each individual client must download one full copy of $F$ when the peer with the slowest download rate ($d_{min}$).

## [[Peer-to-peer (p2p)]] Distribution Formula

In P2P distribution, peers can redistribute chunks of the file to one another. The distribution time ($D_{P2P}$)is limited by 3 factors:
$$D_{P2P} \geq \max\left\{\frac{F}{u_{s}}, \frac{F}{d_{\min}}, \frac{NF}{u_{s} + \sum_{i=1}^{N} u_{i}}\right\}$$
- $\frac{F}{u_{s}}$ (Server Bottleneck): The server must upload at least one copy of the file to the network, so the peers can begin sharing it.
- $\frac{F}{d_{\min}}$ (Peer Bottleneck): Each peer must download one full copy of the file from the network, so the peer with the slowest download rate ($d_{min}$) limits the distribution time.
- $\frac{NF}{u_{s} + \sum_{i=1}^{N} u_{i}}$ (Aggregate Upload Bottleneck): The total upload capacity of the server and all peers must be sufficient to distribute $N$ copies of the file. This term accounts for the fact that peers can share the load of uploading the file.

![[Pasted image 20260215231832.png]]