---
title: Vector space
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

# Vector space

## Definition

> [!definition]
> A vector space is ordered pair $(V, F)$ where $V$ is a set and $F$ is a field, together with two operations:
> - Vector addition: $+: V \times V \to V$
> - Scalar multiplication: $\cdot: F \times V \to V$
> 
> Such that the following properties hold:
> - $(V, +)$ is an [[Group theory#^d9eb2a|Abelian group]]. Here, $0$ is the additive identity.
> - Scalar multiplication is distributive over vector addition: $a \cdot (v + w) = a \cdot v + a \cdot w$ for all $a \in F$ and $v, w \in V$.
> - Scalar multiplication is distributive over field addition: $(a + b) \cdot v = a \cdot v + b \cdot v$ for all $a, b \in F$ and $v \in V$.
> - Scalar multiplication is associative: $(a \cdot b) \cdot v = a \cdot (b \cdot v)$ for all $a, b \in F$ and $v \in V$.
> - Scalar multiplication by the multiplicative identity of the field is the identity operation on the vector space: $1 \cdot v = v$ for all $v \in V$.

## Examples


> [!example]
> - The set of real numbers $\mathbb{R}^n$ with standard addition and scalar multiplication is a vector space.
> - The set of $n \times m$ matrices over a field is a vector space.
> - The set of polynomials of degree at most $n$ is a vector space.

## Subspaces

> [!definition]
> A subspace of a vector space $V$ is a subset $U$ of $V$ that is itself a vector space with the operations of vector addition and scalar multiplication inherited from $V$. The subspace is denoted by $U \subset V$.

### Examples

- The set of all polynomials of degree at most $n$ is a subspace of the vector space of all polynomials.
- $\mathbb{R}^n$ is a subspace of $\mathbb{C}^n$
### Span

> [!definition]
> The span of a set of vectors $\{v_1, v_2, \ldots, v_n\}$ is the set of all linear combinations of the vectors. It is denoted by $\text{span}(v_1, v_2, \ldots, v_n)$.
#### Linear combinations
> [!definition]
> A linear combination of a set of vectors $\{v_1, v_2, \ldots, v_n\}$ is $$\sum_{i=1}^n \lambda_i v_i$$ where $\lambda_i$ are scalars.
### Basis

> [!definition]
> A basis of a vector space $V$ is a set of linearly independent vectors that span $V$. 
> 

> [!important]
> - A basis is a minimal set of vectors that can represent all vectors in the vector space.
 >- A basis is a maximal set of linearly independent vectors.
#### Linear independence
> [!definition]
> A set of vectors $\{v_1, v_2, \ldots, v_n\}$ is linearly independent if the only solution to the equation $$\sum_{i=1}^n \lambda_i v_i = 0$$ is $\lambda_i = 0$ for all $i$.

^3301e0

### Dimension

> [!definition]
> The dimension of a vector space $V$ is the number of vectors in a basis of $V$. It is denoted by $\dim(V)$.
## Linear transformations

> [!definition]
> A linear transformation $\mathcal{T}: V \to W$ between two vector spaces $V$ and $W$ is a function that preserves vector addition and scalar multiplication. It satisfies the following properties:
> - $\mathcal{T}(u + v) = \mathcal{T}(u) + \mathcal{T}(v)$ for all $u, v \in V$.
> - $\mathcal{T}(a \cdot v) = a \cdot \mathcal{T}(v)$ for all $a \in F$ and $v \in V$.

### Kernel

> [!definition]
> The kernel of a linear transformation $\mathcal{T}: V \to W$ is the set of all vectors in $V$ that are mapped to the zero vector in $W$. It is denoted by $\ker(\mathcal{T})$.

### Image

> [!definition]
> The image of a linear transformation $\mathcal{T}: V \to W$ is the set of all vectors in $W$ that are the result of applying $\mathcal{T}$ to some vector in $V$. It is denoted by $\text{im}(\mathcal{T})$.

