---
title: "SMTP protocol"
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

# SMTP protocol

- **SMTP**: Simple Mail Transfer Protocol
  - Protocol for sending email messages between mail servers
  - Uses TCP port 25 (or 587 for submission)
  - Client-server model (client initiates connection to server)
  - Commands (ASCII text) and responses (status code and phrase)
	  - e.g., HELO, MAIL FROM, RCPT TO, DATA
  - Supports authentication and encryption (e.g., STARTTLS)

3 phases of transfer:
- SMTP handshaking
- SMTP transfer of messages
- SMTP connection closing
![[Pasted image 20260215005040.png]]
## Command Example
![[Pasted image 20260215005122.png]]

## Retrieving email protocols
- **SMTP:** delivery/storage of e-mail messages to receiver's server
	- port 25, 587 (TLS)
- **IMAP:** messages stored on server
	- provides retrieval, deletion, folders of stored messages on server
	- port 143, 993 (TLS)
- **HTTP:** gmail, Hotmail, Yahoo, etc.
	- provides web-based interface on top of STMP (to send), IMAP (or POP) to retrieve e-mail messages
- **POP 3:** for server when user wants to have access only using one device