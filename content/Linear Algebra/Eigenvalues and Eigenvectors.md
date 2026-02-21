---
title: Eigenvalues and Eigenvectors
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

# Eigenvalues and Eigenvectors

## Definition

> [!definition] Eigenvalues and Eigenvectors
> Let $A$ be a square matrix. A scalar $\lambda$ is called an **eigenvalue** of $A$ if there exists a nonzero vector $v$ such that $Av = \lambda v$. Such a vector $v$ is called an **eigenvector** corresponding to the eigenvalue $\lambda$.

> [!definition]
> characteristic polynomial of $A$ is $p(\lambda) = \text{det}\left(A - \lambda I \right)$ where $I$ is the identity matrix. The roots of this polynomial are the eigenvalues of $A$. And the eigenvectors are the solutions to the equation $\left(A - \lambda I \right)v = 0$ which is called the characteristic equation.

> [!definition] Multiplicity of the eigenvalue
> The [[Polynomial equation#^5795e9|multiplicity]] of an eigenvalue $\lambda$ in characteristic equation is called the algebraic multiplicity of the eigenvalue denoted by $m(\lambda)$.

> [!definition] Eigenspace
> The set of all eigenvectors $(v_1, v_2, \ldots, v_n)$corresponding to the eigenvalue $\lambda$ is called the eigenspace of $\lambda$ denoted by $E_\lambda = \text{span}(v_1, v_2, \ldots, v_n)$.


> [!definition] Geometric Multiplicity of Eigenvalue
> The dimension of the eigenspace of an eigenvalue $\lambda$ is called the geometric multiplicity of $\lambda$. It is denoted by $g(\lambda) = \text{dim}(E_\lambda)$.

> [!theorem] Algebraic and Geometric Multiplicity of the Eigenvalue
> $m(\lambda) \geq g(\lambda)$.


> [!theorem] Linearly independent in Eigenvectors 
> Eigenvectors corresponding to distinct eigenvalues are linearly independent.

## Diagonalization

> [!definition] Diagonalizable Matrix
> A square matrix $A$ is called diagonalizable if there exists an invertible matrix $P$ such that $P^{-1}AP = D$ where $D$ is a diagonal matrix. The matrix $P$ is called the matrix of eigenvectors of $A$ and $D$ is the diagonal matrix of eigenvalues of $A$.


