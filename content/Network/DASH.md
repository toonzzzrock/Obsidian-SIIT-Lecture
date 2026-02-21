---
title: "DASH"
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

# DASH

**DASH**, which stands for **Dynamic Adaptive Streaming over HTTP**, is a video streaming technology designed to handle the challenges of varying network conditions and different device capabilities. It allows video to be streamed smoothly by adjusting the quality in real-time based on the available bandwidth.

**Server:**
- divides video file into multiple **chunk**
- each chunks encoded at multiple different **rates**
- each file has different coding rates (e.g., 300Kbps, 700Kbps, 1Mbps, etc.)
- Files replicated in various [[Content Distribution Network  (CDN)]]
- **manifest file**: provides URLs for different chunks

**Client:**
> [!note] 3W
> client intelligently determines
> - **when** to request chunk (buffer optimize)
> - **what** encoding rate to request (bandwidth optimize)
> - **where** to request chunk (CDN optimize)

- estimates [[File Distribution|server-to-client bandidth]]
- request chunk with the highest rate that is less than estimated bandwidth
- if bandwidth changes, client can request different rate chunk for next chunk

![[Pasted image 20260216001117.png]]