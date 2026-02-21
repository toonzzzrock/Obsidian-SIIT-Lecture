---
title: Matrix Space
created_date: 2024-11-22
tags: 
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Matrix Space

## Definition

> [!definition]
> 


### Properties

- Matrix Space is a vector space over a field of matrices. 
- The set of all $m \times n$ matrices with entries in a field $F$ is a vector space over $F$.
- The zero matrix is the additive identity.
- The additive inverse of a matrix is the matrix with all its entries negated.
- Scalar multiplication is defined by multiplying each entry of the matrix by the scalar.
- Matrix addition is defined by adding corresponding entries of the matrices.
## Basis

> [!definition]
> A basis of a vector space $V$ is a set of linearly independent vectors that span $V$.


## Dimension

> [!definition]
> The **dimension** of a vector space is the number of vectors in any basis for the space. The dimension of the vector space $V$ is denoted by $\dim(V)$.
## Null Space

> [!definition]
> The null space of a matrix $A$ is the vector space construct using set of all vectors $x$ such that $Ax = 0$ . It is denoted by $\text{null}(A)$ or $\text{ker}(A)$.

> [!definition]
> The nullity of a matrix $A$ is the dimension of the null space of $A$. It is denoted by $\text{nullity}(A)$ or $\text{dim}(\text{ker}(A))$.
## Column Space
> [!definition]
> The column space of a matrix $A$ is the vector space construct using set of all linear combinations of the columns of $A$ $\left( \text{span}(c_1, c_2, \ldots, c_n) \right)$. It is denoted by $C_A$.

> [!remark]
> $C_A$ is a subspace of $\mathbb{R}^m$.

> [!remark]
> $C_A = \{y : \forall x, Ax = y\}$. This means that it is subspace of the result for the system of linear equations $Ax = y$.
## Row Space

> [!definition]
> The row space of a matrix $A$ is the vector space construct using set of all linear combinations of the rows of $A$ $\left( \text{span}(r_1, r_2, \ldots, r_m) \right)$. It is denoted by $R_A$.

> [!remark]
> $R_A$ is a subspace of $\mathbb{R}^n$.


> [!theorem]
> $C_A = R_{A^T}$ and $R_A = C_{A^T}$ and $\text{dim}(C_A) = \text{dim}(R_A)$.
## Rank

> [!definition]
> The rank of a matrix $A$ is the dimension of its column space. It is denoted by $\text{rank}(A)$.

> [!remark]
> The rank of a matrix is the maximum number of linearly independent rows or columns in the matrix.

> [!theorem]
> $\text{rank}(A) = \text{rank}(A^T)$.

### Rank-Nullity Theorem

> [!theorem]
> $\text{rank}(A) + \text{nullity}(A) = n$ and $\text{rank}(A^T) + \text{nullity}(A^T) = m$.
