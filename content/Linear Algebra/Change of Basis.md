---
title: Change of Basis
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

# Change of Basis

## Transition Matrix

> [!definition]
> Let $V$ be a vector space with two bases $B = \{v_1, v_2, \ldots, v_n\}$ and $B' = \{v'_1, v'_2, \ldots, v'_n\}$. The transition matrix $P_{B',B}$ from $B$ to $B'$ is the matrix whose columns are the coordinates of the vectors in $B'$ with respect to $B$. 

To convert from the basis $B$ to the basis $B'$, we multiply the transition matrix $P_{B',B}$ with the coordinates of the vector in the basis $B$: $$[v]_{B'} = P_{B',B}[v]_{B}$$and the inverse transformation is given by $$[v]_{B} = P_{B',B}^{-1}[v]_{B'}$$ ($P_{B',B}$ is invertible if and only if $B$ and $B'$ are linearly independent).

> [!theorem]
> Let $V$ be a vector space with bases  $B = \{v_1, v_2, \ldots, v_n\}$. Then, the transition matrix $P_{B_S,B}$ from the $B$ to standard basis $B_S$ is the matrix whose columns are the coordinates of the vectors in $B$ with respect to the standard basis. $$P_{B_S,B} = \begin{bmatrix} [v_1]_{B_S} & [v_2]_{B_S} & \ldots & [v_n]_{B_S} \end{bmatrix}$$

> [!theorem]
> Let $V$ be a vector space with bases $B$ and $B'$, and $P_{B',B}$ be the transition matrix from $B$ to $B'$. Then, the $$P_{B,B'} = P_{B_S, B'} \cdot P_{B,B_S}$$ where $B_S$ is the standard basis of $V$.
 


## Standard Basis Example

Consider the vector space $\mathbb{R}^2$ with the standard basis $B' = \{(1,0), (0,1)\}$ and the basis $B = \{(1,1), (1,-1)\}$. The transition matrix $P_{B',B}$ is 
$$
P_{B',B} = \begin{bmatrix} 1 & 1 \\ 1 & -1 \end{bmatrix}
$$
To convert a vector $v = (2,3)$ from the basis $B$ to the basis $B'$, we multiply the transition matrix with the coordinates of $v$ in the basis $B$:
$$
\begin{bmatrix} 5 \\ -1 \end{bmatrix} = P_{B',B}\begin{bmatrix} 2 \\ 3 \end{bmatrix}
$$

And to convert back from the basis $B'$ to the basis $B$, we multiply the inverse of the transition matrix with the coordinates of $v$ in the basis $B'$:
$$
\begin{bmatrix} 2 \\ 3 \end{bmatrix} = P_{B',B}^{-1}\begin{bmatrix} 5 \\ -1 \end{bmatrix}
$$

## Non-Standard basis Example

Consider the vector space $\mathbb{R}^2$ with the basis $B' = \{(1,0), (1,1)\}$ and the basis $B = \{(1,1), (1,-1)\}$. The transition matrix $P_{B_S,B}$ is $$P_{B_S,B'} = \begin{bmatrix} 1 & 1 \\ 0 & 1 \end{bmatrix}$$ and $P_{B_S,B}$ is $$P_{B_S,B} = \begin{bmatrix} 1 & 1 \\ 1 & -1 \end{bmatrix}$$
The transition matrix $P_{B',B}$ is then given by $$P_{B',B} = P_{B_s,B'}^{-1} \cdot P_{B_S,B} = \begin{bmatrix} 1 & -1 \\ 0 & 1 \end{bmatrix} \cdot \begin{bmatrix} 1 & 1 \\ 1 & -1 \end{bmatrix} = \begin{bmatrix} 0 & 2 \\ 1 & -1 \end{bmatrix}$$