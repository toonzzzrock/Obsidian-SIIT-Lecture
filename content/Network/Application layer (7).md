---
title: Application layer (7)
created_date: 2025-08-08
tags: []
relates:
  - "[[Transport Services]]"
source:
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Application layer (7)

- Programs that run on different end systems
- communicate over network
## Layer protocol defines:
- Types of messages exchanged
	- Request, response
- Message syntax (format)
    - Fields, how fields are delineated
- Message semantics (meaning of fields)
	- Meaning of information in fields
- Rules
	- for when and how processes send and respond to messages
- Open protocols
	- Defined in RFCs, everyone can implement them
	- [[Web and HTTP]], [[E-mail, SMTP, IMAP]], [[DNS]]
- Proprietary protocols
	- Defined by a single organization, only that organization can implement them
    - Skype, Facebook messenger

## Paradigm
### Client-server paradigm
#### Server:
- always-on host
- permanent IP address (fixed)
- in data centers
#### Clients:
- communicate with the server
- Have dynamic IP address
- Do not communicate directly with each other
- HTTP, IMAP, FTP

### Peer-peer Architecture
- No always-on server
- Arbitrary end systems (peers) communicate directly.   
- **Self-scalability**: New peers bring new service capacity as well as new service demands.
- **Challenges**: Harder to manage, less secure
- BitTorrent, P2P file sharing