---
title: "port"
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

# port
- logical construct that identifies a specific process or service on a host 

## Port Numbers 

| port group            | range       | description                                                                                                                                                                                                                                                        |
| --------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Well-know Ports       | 0-1023      | - common/popular services<br>- common server applications, so clients easily identify the associated service required                                                                                                                                              |
| Registered Ports      | 1024-49151  | - Requesting entity to use with specific processes/applications assigned by IANA.<br>- Every developers to know exactly where to send data.<br>- e.g. Cisco has registered port 1812 for RADIUS server authentication process, Microsoft SQL Server has port 1433. |
| Private/Dynamic Ports | 49152-65535 | - Client' OS assign port numbers dynamically when a connection to a service is initiated.<br>- To identify the client application during communication<br>- e.g. each tab in a browser has its own dynamic port assigned to                                        |
 