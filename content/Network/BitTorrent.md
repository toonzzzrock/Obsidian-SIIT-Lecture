---
title: "BitTorrent"
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

# BitTorrent

- file divided into 256Kb chunks
- peers in torrent send/receive file chunks

![[Pasted image 20260215232142.png]]

## Distribution
- Peer joining torrent:
	- has no chunks, but will **accumulate them over time** from other peers
	- registers with tracker to get list of peers, connects to subset of peers (neighbors)
- While downloading, peer uploads chunks to other peers.
- **Churn:** peers may come and go

### Requesting File
- At any time, a peer may request a chunk from a neighbor.
- Periodically, peer asks each peer for list of chunks that they have.
- Peer requests missing chunks from peers, rarest first

### Sending File: tit-for-tat
- Peer sends chunks to those 4 peers currently sending the peer chunks at highest rate (choke others) reevaluate every 10 seconds
- every 30 secs: randomly select another peer, starts sending chunks (optimistically unchoke)