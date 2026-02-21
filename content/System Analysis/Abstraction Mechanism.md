---
title: "Abstraction Mechanism"
created_date: "2026-02-20"
tags: []
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Abstraction Mechanism

Abstraction is the process of simplifying complex systems by focusing on the essential features while ignoring the irrelevant details. It allows us to manage complexity and understand systems at different levels of detail.

## Classification abstraction
- group similar objects into classes based on shared attributes or behaviors. This helps in organizing and categorizing information, making it easier to understand and manage.
- `is instant of` relation between an instant and a concept
![[Pasted image 20260220161803.png]]
## Aggregation 
- Defines a new class from a set of classes that represent its component parts
- `is part of` relation between a concept and its components
![[Pasted image 20260220161813.png]]
## Generalization
- Defines a new class from a set of classes that share common attributes or behaviors, but also have their own unique features. The new class is more general than the original classes and can be used to represent a broader range of objects or concepts.
- `is subclass of` relation between a concept and its generalization
![[Pasted image 20260220161824.png]]
## Asociation
- Defines a relationship between two or more classes based on their interactions or dependencies. It represents how objects of one class are connected to objects of another class, allowing us to model the relationships and interactions between different entities in a system.
- `is associated with` relation between two concepts
![[Pasted image 20260220161955.png]]