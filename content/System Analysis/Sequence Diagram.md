---
title: "Sequence Diagram"
created_date: "2026-02-20"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> How the system should do it 

# Sequence Diagram

![[Pasted image 20260220191659.png]]
![[Pasted image 20260220191941.png]]
- **iteration:** doing something repeatedly (until a condition is satisfied)
- **self-called:** an object sends a message to itself, which is represented by an arrow that loops back to the same lifeline. This is used to model recursive behavior or when an object needs to perform an operation on itself.
- **guard condition:** a boolean expression that must be true for a message to be sent or an interaction to occur. It is typically enclosed in square brackets `[]` and placed near the message or interaction it governs. If the guard condition evaluates to false, the message will not be sent, and the interaction will not occur.

## Object Notation:
- `object name: class name`
	- tom : Student
- `: class name`
	- : Student
- `object name`
	- tom
## Message Notation:
![[Pasted image 20260220195038.png]]
- **Call:** synchronous call (the caller waits for the called operation to finish before continuing)
- **send:** asynchronous call (the caller continues without waiting for the called operation to finish)
- **return:** dashed line with an open arrowhead, indicating the return of control from the called operation to the caller, often accompanied by a return value or result.
- `<<create>>` : create an instance of a class
- `<<destroy>>` : destroy an instance of a class

![[Pasted image 20260220195359.png]]

## Alternative Flow
![[Pasted image 20260220195242.png]]
## Frame
> [!note]
> frame can also be nested 

![[Pasted image 20260220195418.png]]
- **loop:** loop until the condition is satisfied

![[Pasted image 20260220195440.png]]
- **opt:** if the condition is satisfied, then execute the enclosed interactions; otherwise, skip them.

![[Pasted image 20260220195507.png]]
- **alt:** represents alternative paths in the interaction. It consists of multiple sections, each with a guard condition that determines which path to take based on the evaluation of the conditions. Only one section will be executed, depending on which guard condition evaluates to true.