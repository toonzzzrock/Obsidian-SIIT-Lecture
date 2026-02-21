---
title: WAN switching methods
created_date: 2025-09-21
tags: []
relates:
source:
  - https://youtu.be/G7n8thqwO2c
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# WAN switching methods
**switching methods** are the _ways a network moves traffic from a source to a destination through intermediate switches/routers_, including how resources on each hop are **reserved or shared**.
## Circuit Switching
- a dedicated end-to-end path is established before data flows; capacity is reserved for you until you hang up (time slots or wavelengths are reserved)
- E.g. traditional telephone network
- circuit means channel to communicate.
- correct order of data.

### How it work
- Each call circuit occupies fix time-slots using copper lines.


## Packet Switching 
- Data is split into packets that are forwarded node to node; each packet have it own path to the destination; Hence the order of arrival is not well-order.
- 
- *Internet's Default model* with router:
	- Routers make **per-packet** decisions (best-effort)
	- when you are idle, others can use the link
- Different to Circuit switching:
	- no session/ channel is established prior to data transfer.

### Frame Relay
- **virtual-circuit packet-switched**
- give you logical circuits (PVCs) across their cloud
- we can connect across WAN and share bandwidth with other people securely,