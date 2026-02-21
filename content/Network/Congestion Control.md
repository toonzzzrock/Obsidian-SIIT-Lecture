---
title: "Congestion Control"
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

# Congestion Control

Congestion is when too many sources sending too much data too fast for network to handle
- **Throughput** can never exceed capacity
- **Delay** increases as capacity approached
- **Loss/Retransmission** decreases effective throughput
- **Un-needed deplicates** further decreases effective throughput

![[Pasted image 20260216170625.png]]![[Pasted image 20260216170709.png]]

## End-end congestion control
- no explicit feedback from network
- congestion **inferred** from observed loss/delay
- used in [[TCP]]
![[Pasted image 20260216172258.png]]
$$\text{TCP rate} = \frac{\text{cwnd}}{\text{RTT}} \space \text{ byte/s}$$
- TCP sender limits $\text{LastByteSent}- \text{LastByteACMed} \le\text{cwnd}$
- $\text{cwnd}$ is dynamically adjusted based on perceived congestion level

### AIMD
> [!note]
> **Additive Increase:** increase sending rate by 1 maximum segment
> **Multiplicative Decrease:**cut sending rate in half at each loss event
> ![[Pasted image 20260216172812.png]]

- Senders can increase sending rate until packet loss occurs, then decrease sending rate on loss event.

#### Slow Start
when connection begins, increase rate exponentially until first loss event
![[Pasted image 20260216172925.png]]

#### Back to linear scale
Switch back to linear when `cwnd` gets to half of its value before timeout (determined by `ssthresh` slow start threshold)
![[Pasted image 20260216173221.png]]

#### React to Loss
> [!note]
> - TCP Tahoe = Loss via Timeout
> - TCP Reno  = Loss via Triple Duplicate ACK

![[Pasted image 20260216173420.png]]

- When loss detected by triple duplicate ACK (**TCP Reno**)
	- no wait for timeout ([[TCP#Fast Retransmit]])
	- `cwnd` is cut in half window then [[Congestion Control#AIMD|grows linearly]]
- When loss detected by tiemout (**TCP tahoe**)
	- `cwnd` is cut to 1 MSS (Maximum segment size-- the size of largest segment TCP can send)
	- enter [[TCP]] [[Congestion Control#Slow Start]]

### TCP CUBIC
- to probe for usable bandwidth![[Pasted image 20260216221140.png]]
- $W_{\text{max}}$: sending rate at which congestion loss was detected
![[Pasted image 20260216221945.png]]
$$W(t) = C(t-K)^3 + W_{\text{max}}$$
	
- $C$ the larger the $C$, the more aggressive the increase in sending rate
- $K$ is the time when $W(t) = W_{\text{max}}$
	- **Concave Growth (Before K)**: When the current time is far from **K**, the window increases rapidly to regain lost throughput. As the time approaches **K**, the increments become smaller and more cautious to avoid overshooting network capacity.
	- **Convex Probing (After K)**: Once the time surpasses **K**, the function flips, and the window begins to grow more aggressively again to "probe" for new available bandwidth.

### Delay-based TCP congestion control
- $$\text{measured throughput} = \frac{\text{\# bytessent in last RTT interval}}{\text{RTT}_{\text{measured}}}$$
- $\text{RTT}_{\text{min}}$: minimum observed RTT (uncongested path)
- uncongested throughput with congestion window `cwnd` is $\frac{\text{cwnd}}{\text{RTT}_{\text{min}}}$ 
- if measured throughput close to uncongested throughput:
	- increase `cwnd` linearly
- if measured throughput significantly less than uncongested throughput:
	- decrease `cwnd` linearly

## Network-assisted congestion control
-routers provide direct feedback to sending/receiving hosts with flows passing through congested router
- used in DECbit+, [[TCP]] ECN
### Explicit Congestion Notification
- router sets ECN bit in packet header to indicate congestion (`ToS` field)
- sender reduces sending rate when receives ACK with ECN bit set
- Using both IP header (`ECN` bit) and TCP header(`C`,`E` bit)

![[Pasted image 20260216224338.png]]