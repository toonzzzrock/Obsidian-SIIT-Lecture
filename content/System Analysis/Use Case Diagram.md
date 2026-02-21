---
title: "Use Case Diagram"
created_date: "2026-02-20"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> A use case describes what a system does but it doesn't specify how it does it. 

# Use Case Diagram
![[Pasted image 20260220172541.png]]


![[Pasted image 20260220172513.png]]


## Use Case Description

![[Pasted image 20260220172413.png]]

Has 2 types:
- Main flow events:
	- Customer enter valid PIN number and login successfully.
- Exceptional flow:
	- Customer cancel a transaction.
	- Customer enters an invalid PIN number.

## Use Case Format 
```
Use Case UC1: ...
Level: User-level goal

Primary Actor: Cashier
Preconditions:
	- ...
	  
Stakeholders and their Interests:
[person...] wants ...
[person...] wants ...
...
Main Success Scenario:
1. [person...] do ...
2. [person...] do ...
   
Extensions (oralternatives):
a*. At any time, system fails: ...
   1 [do what]
   2 [do what]
3a. what if ...
   1 [do what]
   2 [do what]
3b. what if ...
   1 [do what]
   2 [do what]
3-6a. what if ...
   1 [do what]
   2 [do what]
...
Sepcial Requirements:
	- Touch screen uI on a large flat panel monitor. Text must be visible from 1 meter....
	  ...
Technology and Data Variations
3a. ...
3b. ...
7a. ...
7b. ...

Frequency of Occurrence:
- Could be nearly continuous.
  
Open Issues:
- Should we support ...
   
```