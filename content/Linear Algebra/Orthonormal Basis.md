---
title: Orthonormal Basis
created_date: 2024-11-23
tags: 
relates: 
source: 
status: To_process
Note_types:
  - Permanent_note
---
> [!summary]
> 

# Orthonormal Basis

## Definition

> [!definition]
> An **orthonormal basis** for a vector space $V$ is a basis $\{v_1, v_2, \ldots, v_n\}$ such that $$\langle v_i, v_j \rangle = \begin{cases} 1 & \text{if } i = j \\ 0 & \text{if } i \neq j \end{cases}$$ where $\langle \cdot, \cdot \rangle$ is the inner product on $V$.

> [!theorem] Linearly Dependent in Orthonormal Basis
> If $V$ is a vector space with an orthonormal basis $\{v_1, v_2, \ldots, v_n\}$, then it is [[Vector space#^3301e0|linearly independent]] 

## Properties

> [!theorem]
> Let $V$ be a vector space with an orthonormal basis $\{v_1, v_2, \ldots, v_n\}$. Then, for any vector $v \in V$, the vector $v$ can be expressed as $$v = \sum_{i=1}^n \langle v, v_i \rangle v_i$$

## Projections

> [!definition]
> Let $V$ be a vector space and the $H$ be a subspace of $V$ with an orthonormal basis $\{v_1, v_2, \ldots, v_n\}$. The projection of a vector $v \in V$ onto $H$ is given by $$\text{proj}_H(v) = \sum_{i=1}^n \langle v, v_i \rangle v_i$$

## Orthogonal Complementb

> [!definition]
> Let $V$ be a vector space and $W$ be a subspace of $V$. The **orthogonal complement** of $W$ is the set of all vectors in $V$ that are orthogonal to every vector in $W$. It is denoted by $W^\perp$. $$W^\perp = \{v \in V : \langle v, w \rangle = 0, \forall w \in W\}$$

### Example How to Find Orthogonal Complement

Let $V = \mathbb{R}^3$ and $W = \text{span}\{(1, 1, 0), (1, 0, 1)\}$. The orthogonal complement of $W$ is given by $W^\perp = \{v \in \mathbb{R}^3 : \langle v, w \rangle = 0, \forall w \in W\}$. 

1. Let $v = (x, y, z) \in W^\perp$ and $w_1 = (1, 1, 0)$, $w_2 = (1, 0, 1) \in W$. Then, $\langle v, w_1 \rangle = 0$ and $\langle v, w_2 \rangle = 0$. This gives the system of equations $x + y = 0$ and $x + z = 0$.
2. The solution to the system is $V = \text{span}\{(1, 0, 0), (0, 1, -1)\}$.
3. Therefore, $W^\perp = \text{span}\{(1, 0, 0), (0, 1, -1)\}$.


> [!theorem]
> Let $V$ be a vector space and $W \subset V$ be a subspace with an orthonormal basis $\{v_1, v_2, \ldots, v_n\}$. Then,
> 1. $W^\perp \subset V$
> 2. $W \cap W^\perp = \{\vec{0}\}$
> 4. $(W^\perp)^\perp = W$
> 5. $\dim(W) + \dim(W^\perp) = \dim(V)$

> [!theorem]
> Let $V$ be a vector space. We can write $V = W \oplus W^\perp$ or $v = \text{proj}_W(v) + \text{proj}_{W^\perp}(v)$ for any vector $v \in V$

> [!theorem] Orthogonal Completment of Nullspace
> $$\text{ker}(A)^\perp = R_A$$ and $$\text{ker}(A^T) = C_A$$


## Gramm-Schmidt Orthogonalization

> [!definition]
> The **Gramm-Schmidt orthogonalization** process takes a set of linearly independent vectors $\{v_1, v_2, \ldots, v_n\}$ and produces an orthonormal basis $\{u_1, u_2, \ldots, u_n\}$ for the subspace spanned by the original vectors.

### Procedure

1. Set $u_1 = \frac{v_1}{\|v_1\|}$
2. For $i = 2, 3, \ldots, n$
	1. set $$u_i = v_i - \sum_{j=1}^{i-1} \langle v_i, u_j \rangle u_j$$
	2. set $$u_i = \frac{u_i}{\|u_i\|}$$
### Example

Consider the vectors $v_1 = (1, 1, 0)$, $v_2 = (1, 0, 1)$, and $v_3 = (0, 1, 1)$ in $\mathbb{R}^3$. The Gramm-Schmidt orthogonalization process produces the orthonormal basis $\{u_1, u_2, u_3\}$ as follows:

1. Set $u_1 = \frac{v_1}{\|v_1\|} = \frac{(1, 1, 0)}{\sqrt{2}} = \left(\frac{1}{\sqrt{2}}, \frac{1}{\sqrt{2}}, 0\right)$
2. Set $u_2 = v_2 - \langle v_2, u_1 \rangle u_1 = (1, 0, 1) - \left(\frac{1}{\sqrt{2}}, \frac{1}{\sqrt{2}}, 0\right) = \left(\frac{1}{\sqrt{2}}, -\frac{1}{\sqrt{2}}, 1\right)$
3. Set $u_2 = \frac{u_2}{\|u_2\|} = \left(\frac{1}{2\sqrt{2}}, -\frac{1}{2\sqrt{2}}, \frac{1}{2}\right)$
4. Set $u_3 = v_3 - \langle v_3, u_1 \rangle u_1 - \langle v_3, u_2 \rangle u_2 = (0, 1, 1) - \left(\frac{1}{\sqrt{2}}, \frac{1}{\sqrt{2}}, 0\right) - \left(\frac{1}{2\sqrt{2}}, -\frac{1}{2\sqrt{2}}, \frac{1}{2}\right) = \left(-\frac{1}{2\sqrt{2}}, \frac{1}{2\sqrt{2}}, \frac{1}{2}\right)$
5. Set $u_3 = \frac{u_3}{\|u_3\|} = \left(-\frac{1}{2}, \frac{1}{2}, \frac{1}{2}\right)$

The orthonormal basis is $\left\{\left(\frac{1}{\sqrt{2}}, \frac{1}{\sqrt{2}}, 0\right), \left(\frac{1}{2\sqrt{2}}, -\frac{1}{2\sqrt{2}}, \frac{1}{2}\right), \left(-\frac{1}{2}, \frac{1}{2}, \frac{1}{2}\right)\right\}$


