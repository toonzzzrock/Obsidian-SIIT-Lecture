---
title: Ring theory
created_date: 2024-11-21
tags: 
relates:
  - "[[Polynomial Ring]]"
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Ring theory

> [!definition]
> A ring is an ordered tuple $(R, +, \cdot)$ where $R$ is a set and $+$ and $\cdot$ are binary operations on $R$ such that:
> - $(R, +)$ is an [[Group theory#^d9eb2a|Abelian group]].
> - $\cdot$ is associative: $(a \cdot b) \cdot c = a \cdot (b \cdot c)$ for all $a, b, c \in R$.
> - The distributive laws hold: $a \cdot (b + c) = a \cdot b + a \cdot c$ and $(a + b) \cdot c = a \cdot c + b \cdot c$ for all $a, b, c \in R$.

> [!note]
> - A ring is a not necessarily commutative group. Hence, the multiplication operation may not be commutative.

## Types of rings

### Commutative ring

> [!definition]
> A commutative ring is a ring where the multiplication operation is commutative, i.e., $a \cdot b = b \cdot a$ for all $a, b \in R$.

#### Examples
- The set of integers $\mathbb{Z}$ under addition and multiplication is a commutative ring.
- The set of rational numbers $\mathbb{Q}$ under addition and multiplication is a commutative ring.
### Non-commutative ring

> [!definition]
> A non-commutative ring is a ring where the multiplication operation is not commutative, i.e., $a \cdot b \neq b \cdot a$ for some $a, b \in R$.

#### Examples
- The set of $n \times n$ matrices over a field is a non-commutative ring.
- The set of quaternions is a non-commutative ring.
### Finite ring

> [!definition]
> A finite ring is a ring with a finite number of elements.

#### Examples
- The ring of integers modulo $n$ is a finite ring.
- The ring of $n \times n$ matrices over a field is a finite ring.
### Infinite ring

> [!definition]
> An infinite ring is a ring with an infinite number of elements.

#### Examples
- The ring of integers $\mathbb{Z}$ is an infinite ring.
- The ring of polynomials over a field is an infinite ring.
### Ring with identity

> [!definition]
> A ring with identity is a ring that has a multiplicative identity element, denoted by $1$.

#### Examples
- The set of integers $\mathbb{Z}$ under addition and multiplication is a ring with identity.
- The set of real numbers $\mathbb{R}$ under addition and multiplication is a ring with identity.
### Ring without identity (Rng)

> [!definition]
> A ring without identity is a ring that does not have a multiplicative identity element.

#### Examples
- The set of even integers under addition and multiplication is a ring without identity.
- The set of $n \times n$ matrices over a field is a ring without identity.
### Polynomial ring

> [!definition]
> Let a ordered tuple $(R, +, \cdot)$ be a ring. A polynomial ring is a ring formed by polynomials over the ring $R$.
> 
 A polynomial, denoted by $f(x)$, is a formal expression of the form $$f(x) = a_n x^n + a_{n-1} x^{n-1} + \ldots + a_1 x + a_0$$ where $a_i \in R$ and $n$ is a non-negative integer. The set of all polynomials in the variable $x$ with coefficients in the ring $R$ forms a polynomial ring denoted by $R[x]$.

^d6f265

#### Examples
- The ring of polynomials with coefficients in $\mathbb{Z}$ is a polynomial ring.
- The ring of polynomials with coefficients in a $n \times n$ matrix ring is a polynomial ring.