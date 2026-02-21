---
title: Group theory
created_date: 2024-11-21
tags: 
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Group theory


> [!definition]
> A group is a set $G$ equipped with a binary operation $*$ that satisfies the following axioms:
> - Closure: For all $a, b \in G$, $a*b \in G$.
> - Associativity: For all $a, b, c \in G$, $(a*b)*c = a*(b*c)$.
> - Identity element: There exists an element $e \in G$ such that for all $a \in G$, $a*e = e*a = a$.
> - Inverse element: For all $a \in G$, there exists an element $a^{-1} \in G$ such that $a*a^{-1} = a^{-1}*a = e$.

## Introduction

Group theory is the study of group, which is a fundamental algebraic structure. Groups are used to study symmetry, geometry. This is used in define an abstract elements of symmetry, which is a group of transformations that preserve the structure of an object. 


## Abelian groups

An Abelian group, also known as a commutative group, is a group in which the binary operation is commutative, i.e., $a*b = b*a$ for all $a, b \in G$. Abelian groups play a crucial role in algebra and have many interesting properties.

> [!definition]
> An abelian group is a group $G$ in which the binary operation is commutative, i.e., $a*b = b*a$ for all $a, b \in G$.

^d9eb2a


## Exmaples
### Examples of groups

> [!example]+
> - The set of integers $\mathbb{Z}$ under addition is a group.
> - The set of non-zero rational numbers $\mathbb{Q}^*$ under multiplication is a group. (except 0 as it does not have an inverse)
> - The set of $n \times n$ invertible matrices under matrix multiplication is a group.
> - The set of symmetries of a square is a group with operators being rotation and reflection.

### Example of proof

> [!example]
> Prove that the set of integers $\mathbb{Z}$ under addition is a group.
> - Closure: For all $a, b \in \mathbb{Z}$, $a+b \in \mathbb{Z}$. (Sum of two integers is an integer)
> - Associativity: For all $a, b, c \in \mathbb{Z}$, $(a+b)+c = a+(b+c)$. (Addition is associative)
> - Identity element: The identity element is 0, as $a+0 = 0+a = a$ for all $a \in \mathbb{Z}$.
> - Inverse element: For all $a \in \mathbb{Z}$, the inverse element is $-a$, as $a+(-a) = (-a)+a = 0$.

