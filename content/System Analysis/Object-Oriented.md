---
title: "Object-Oriented"
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

# Object-Oriented

## Object
> [!note]
> We see only opertions, state is hidden to us 

an object is an entity which:
- has state
- has operations
- has identity

## Encapsulation
- Encapsulation is the principle of *hiding the internal details* of an object and exposing only the necessary information and operations to the outside world. It allows us to protect the integrity of an object's state and control access to its data and behavior.
## Association
- **Static relation:** relations that exist over a long period.
- **Dynamic relation:** one object sends a stimulus to another object.

## Generalization/Inheritance
> [!note]
> Subclass inherits:
> - the operations
> - operation descriptions
> - information structure
- Generalization is the process of creating a new class (called a subclass) that inherits the properties and behaviors of an existing class (called a superclass). The subclass can also have its own unique properties and behaviors, allowing for specialization and extension of the superclass.
### Overriding
- Overriding is the ability of a subclass to provide a specific implementation of a method that is already defined in its superclass. 
- When a method in a subclass has the same name and signature as a method in the superclass, the subclass's method will be called instead of the superclass's method when invoked on an instance of the subclass. 

### Polymorphism
- Polymorphism is the ability of different classes to be treated as instances of the same class through a common interface.
```java
```java
class Animal {
  public void animalSound() {
    System.out.println("The animal makes a sound");
  }
}

class Pig extends Animal {
  public void animalSound() {
    System.out.println("The pig says: wee wee");
  }
}

class Dog extends Animal {
  public void animalSound() {
    System.out.println("The dog says: bow wow");
  }
}
```
![[Pasted image 20260220165337.png]] 
## Overloading
- Overloading is the ability to define multiple methods with the same name but different parameters within the same class.
- The correct method to call is determined at compile time based on the number and types of the arguments passed to the method.