---
title: "State Diagram"
created_date: "2026-02-20"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> Shows how a single object behaves across many cases.

# State Diagram

![[Pasted image 20260220192825.png]]
![[Pasted image 20260220193040.png]]
![[Pasted image 20260220202727.png]]
- Syntax for a transition label is: state1 `event [guard] / action` state2
- Not all events cause state transition, some events are ignored in some states.

## Internal Transition
![[Pasted image 20260220203629.png]]
![[Pasted image 20260220203720.png]]
## Not the same with Self-transition
![[Pasted image 20260220210257.png]]
![[Pasted image 20260220210300.png]]
When trigger `question-received` in self-transition, the state will exit and re-entry again, trigger both `exit` action and `entry` action.

## Events
- `CallEvent`: an event that occurs when an operation is called.
	- `go-up(floor)`
	- `go-down(floor)`
- `SignalEvent`: an event that occurs when a signal is received.
	- `floor-reached(floor)`
- `ChangeEvent`: an event that occurs when a condition becomes true.
	- `when(...)`
- `TimeEvent`: an event that occurs at a specific time or after a certain duration.
	- `after(...)`

## Convert to [[Class Diagram]]

![[Pasted image 20260220212258.png]]
![[Pasted image 20260220204328.png]]
