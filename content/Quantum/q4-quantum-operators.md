<!-- #ruleok: gate acronyms X, Y, Z, H, S, T, CNOT, SWAP, CZ are exact technical terms, not emphasis -->
# Question 4: Quantum Operators (Translating a State Mapping to a Matrix)
Source: Chapter 02, slides 3-4, 7-9, 19, 21, 27, 32-33

Task type for every problem below: you are given a state mapping (where each input basis ket goes), and you must construct the operator matrix $U$. Method for every problem, per chapter 02 slides 7-9:

1. Write $U$ as an outer-product sum: $U = \sum_k |{\text{output}_k}\rangle\langle{\text{input}_k}|$.
2. Take the adjoint (conjugate transpose) of each input ket to form its bra. Forgetting this step is the single most common mistake (slide 8's explicit warning).
3. Expand each bra in the $|0\rangle,|1\rangle,\ldots$ basis and collect terms of the form $|j\rangle\langle k|$; each such term contributes its coefficient to row $j$, column $k$ of the matrix (Trick 1).
4. Assemble the full matrix and verify it is orthonormal ($U^{\dagger}U = I$), which is what makes it a physically valid, reversible gate.

---

## Problem 1: NOT gate from its mapping
Given: $|0\rangle \to |1\rangle$, $|1\rangle \to |0\rangle$.

**Step 1, write the outer-product sum.**

$$
U = |1\rangle\langle 0| + |0\rangle\langle 1|.
$$

**Step 2, place columns (Trick 1).** The image of $|0\rangle$ becomes column 0, the image of $|1\rangle$ becomes column 1.

$$
\text{column } 0 = \begin{pmatrix}0\\1\end{pmatrix} \;(\text{coefficients of } |0\rangle,|1\rangle \text{ in the image of }|0\rangle,\text{ which is }|1\rangle),
$$
$$
\text{column } 1 = \begin{pmatrix}1\\0\end{pmatrix} \;(\text{image of }|1\rangle,\text{ which is }|0\rangle).
$$

**Step 3, assemble.**

$$
U = \begin{pmatrix}0&1\\1&0\end{pmatrix}.
$$

**Step 4, verify orthonormality.**

$$
U^{\dagger}U = \begin{pmatrix}0&1\\1&0\end{pmatrix}\begin{pmatrix}0&1\\1&0\end{pmatrix} = \begin{pmatrix}1&0\\0&1\end{pmatrix} = I. \quad\text{Valid.}
$$

This is the Pauli $X$ / NOT gate.

---

## Problem 2: Hadamard gate from its mapping (chapter 02 slide 8's worked example)
Given: $|0\rangle \to \dfrac{|0\rangle+|1\rangle}{\sqrt2}$, $|1\rangle \to \dfrac{|0\rangle-|1\rangle}{\sqrt2}$.

**Step 1, write the outer-product sum.**

$$
U = \frac{|0\rangle+|1\rangle}{\sqrt2}\langle 0| + \frac{|0\rangle-|1\rangle}{\sqrt2}\langle 1|.
$$

Since $|0\rangle$ and $|1\rangle$ are the plain standard basis, their bras $\langle 0|,\langle 1|$ need no extra phase work, only the transpose.

**Step 2, place columns.**

$$
\text{column } 0 = \begin{pmatrix}1/\sqrt2\\1/\sqrt2\end{pmatrix}, \qquad \text{column } 1 = \begin{pmatrix}1/\sqrt2\\-1/\sqrt2\end{pmatrix}.
$$

**Step 3, assemble.**

$$
U = \frac{1}{\sqrt2}\begin{pmatrix}1&1\\1&-1\end{pmatrix}.
$$

**Step 4, verify.**

$$
U^{\dagger}U = \frac12\begin{pmatrix}1&1\\1&-1\end{pmatrix}\begin{pmatrix}1&1\\1&-1\end{pmatrix} = \frac12\begin{pmatrix}2&0\\0&2\end{pmatrix} = I. \quad\text{Valid.}
$$

This is the Hadamard gate $H$.

---

## Problem 3: complex-phase input basis (chapter 02 slide 9's worked example)
Given: $e^{i\pi/4}|0\rangle \to |1\rangle$, $e^{-i\pi/4}|1\rangle \to |0\rangle$. Here the input kets themselves carry a phase, so the adjoint step (Step 2 of the method) is not optional.

**Step 1, take the adjoint of each input ket.** The input kets are $e^{i\pi/4}|0\rangle$ and $e^{-i\pi/4}|1\rangle$. Their bras (conjugate transpose, which flips the sign of the phase) are $e^{-i\pi/4}\langle 0|$ and $e^{i\pi/4}\langle 1|$.

**Step 2, write the outer-product sum.**

$$
U = |1\rangle\left(e^{-i\pi/4}\langle 0|\right) + |0\rangle\left(e^{i\pi/4}\langle 1|\right) = e^{-i\pi/4}|1\rangle\langle 0| + e^{i\pi/4}|0\rangle\langle 1|.
$$

**Step 3, place columns.** Column 0 (multiplies $\langle 0|$): row 1 gets $e^{-i\pi/4}$, row 0 gets $0$. Column 1 (multiplies $\langle 1|$): row 0 gets $e^{i\pi/4}$, row 1 gets $0$.

$$
U = \begin{pmatrix}0 & e^{i\pi/4}\\ e^{-i\pi/4} & 0\end{pmatrix}.
$$

**Step 4, verify.** The $(1,1)$ entry of $U^{\dagger}U$ is $e^{-i\pi/4}\cdot e^{i\pi/4} = e^{0} = 1$, and the $(2,2)$ entry is $e^{i\pi/4}\cdot e^{-i\pi/4} = 1$; off-diagonal entries are $0$. So $U^{\dagger}U = I$. Valid.

**Why the adjoint step cannot be skipped.** If you had skipped the adjoint and used $e^{i\pi/4}|1\rangle\langle 0| + e^{-i\pi/4}|0\rangle\langle 1|$ instead, $U^{\dagger}U$ would still equal $I$ (this particular case is symmetric), but the resulting matrix would map $|0\rangle$ to $e^{i\pi/4}|1\rangle$ instead of $|1\rangle$, which does not match the stated mapping at all. This is exactly the failure mode slide 8's warning is protecting against.

---

## Problem 4: controlled-NOT from its mapping (chapter 02 slide 32's worked example)
Given: $|00\rangle\to|00\rangle$, $|01\rangle\to|01\rangle$, $|10\rangle\to|11\rangle$, $|11\rangle\to|10\rangle$.

**Step 1, write the outer-product sum.**

$$
U = |00\rangle\langle 00| + |01\rangle\langle 01| + |11\rangle\langle 10| + |10\rangle\langle 11|.
$$

**Step 2, place entries.** Using basis order $\{|00\rangle,|01\rangle,|10\rangle,|11\rangle\}$ indexed $0,1,2,3$: $|00\rangle\langle 00|$ places a $1$ at $(\text{row }0,\text{col }0)$; $|01\rangle\langle 01|$ at $(1,1)$; $|11\rangle\langle 10|$ at $(3,2)$; $|10\rangle\langle 11|$ at $(2,3)$.

**Step 3, assemble.**

$$
U = \begin{pmatrix}1&0&0&0\\0&1&0&0\\0&0&0&1\\0&0&1&0\end{pmatrix}.
$$

**Step 4, verify.** Each row and column has exactly one $1$, so $U^{\dagger}U = I$ automatically (a permutation matrix is always orthonormal).

This is controlled-NOT (control = wire 1, target = wire 2), matching chapter 03 slide 11's matrix exactly.

---

## Problem 5: swap gate from its mapping (chapter 02 slide 33's worked example)
Given: $|00\rangle\to|00\rangle$, $|01\rangle\to|10\rangle$, $|10\rangle\to|01\rangle$, $|11\rangle\to|11\rangle$.

**Step 1, write the outer-product sum.**

$$
U = |00\rangle\langle 00| + |10\rangle\langle 01| + |01\rangle\langle 10| + |11\rangle\langle 11|.
$$

**Step 2, place entries.** $|00\rangle\langle 00|$ at $(0,0)$; $|10\rangle\langle 01|$ at $(2,1)$; $|01\rangle\langle 10|$ at $(1,2)$; $|11\rangle\langle 11|$ at $(3,3)$.

**Step 3, assemble.**

$$
U = \begin{pmatrix}1&0&0&0\\0&0&1&0\\0&1&0&0\\0&0&0&1\end{pmatrix}.
$$

**Step 4, verify.** Again a permutation matrix, so $U^{\dagger}U = I$ automatically.

This is swap, matching chapter 03 slide 38's matrix.

---

## Problem 6: non-standard input basis $|+\rangle, |-\rangle$
Given: $|+\rangle \to |1\rangle$, $|-\rangle \to |0\rangle$, where $|+\rangle = \dfrac{|0\rangle+|1\rangle}{\sqrt2}$ and $|-\rangle = \dfrac{|0\rangle-|1\rangle}{\sqrt2}$.

**Step 1, write the outer-product sum.**

$$
U = |1\rangle\langle{+}| + |0\rangle\langle{-}|.
$$

**Step 2, expand the bras.** Since $|+\rangle,|-\rangle$ are real, $\langle{+}| = \dfrac{1}{\sqrt2}(\langle 0|+\langle 1|)$ and $\langle{-}| = \dfrac{1}{\sqrt2}(\langle 0|-\langle 1|)$.

**Step 3, substitute and collect terms.**

$$
U = \frac{1}{\sqrt2}|1\rangle(\langle 0|+\langle 1|) + \frac{1}{\sqrt2}|0\rangle(\langle 0|-\langle 1|)
= \frac{1}{\sqrt2}|1\rangle\langle 0| + \frac{1}{\sqrt2}|1\rangle\langle 1| + \frac{1}{\sqrt2}|0\rangle\langle 0| - \frac{1}{\sqrt2}|0\rangle\langle 1|.
$$

Collecting by row and column: row0col0 $= 1/\sqrt2$, row0col1 $= -1/\sqrt2$, row1col0 $= 1/\sqrt2$, row1col1 $= 1/\sqrt2$.

**Step 4, assemble.**

$$
U = \frac{1}{\sqrt2}\begin{pmatrix}1&-1\\1&1\end{pmatrix}.
$$

**Step 5, verify.**

$$
U^{\dagger}U = \frac12\begin{pmatrix}1&1\\-1&1\end{pmatrix}\begin{pmatrix}1&-1\\1&1\end{pmatrix} = \frac12\begin{pmatrix}1+1 & -1+1\\-1+1 & 1+1\end{pmatrix} = \frac12\begin{pmatrix}2&0\\0&2\end{pmatrix} = I. \quad\text{Valid.}
$$

**Step 6, check against the mapping directly.**

$$
U|+\rangle = U\begin{pmatrix}1/\sqrt2\\1/\sqrt2\end{pmatrix} = \begin{pmatrix}1/2-1/2\\1/2+1/2\end{pmatrix} = \begin{pmatrix}0\\1\end{pmatrix} = |1\rangle, \quad\text{correct.}
$$
$$
U|-\rangle = U\begin{pmatrix}1/\sqrt2\\-1/\sqrt2\end{pmatrix} = \begin{pmatrix}1/2+1/2\\1/2-1/2\end{pmatrix} = \begin{pmatrix}1\\0\end{pmatrix} = |0\rangle, \quad\text{correct.}
$$

Comparing to the rotation-gate table (chapter 04 slide 14), $U = R_Y(\pi/2)$.

---

## Problem 7: Pauli $Y$ from its mapping
Given: $|0\rangle \to i|1\rangle$, $|1\rangle \to -i|0\rangle$.

**Step 1, write the outer-product sum.**

$$
U = i|1\rangle\langle 0| + (-i)|0\rangle\langle 1|.
$$

**Step 2, place columns.**

$$
\text{column }0 = \begin{pmatrix}0\\i\end{pmatrix}, \qquad \text{column }1 = \begin{pmatrix}-i\\0\end{pmatrix}.
$$

**Step 3, assemble.**

$$
U = \begin{pmatrix}0&-i\\i&0\end{pmatrix}.
$$

**Step 4, verify.** The $(1,1)$ entry of $U^{\dagger}U$ is $0\cdot 0 + (-i)(i) = -i^2 = 1$; the $(2,2)$ entry is $i\cdot(-i) + 0\cdot 0 = 1$; off-diagonal entries are $0$. So $U^{\dagger}U = I$. Valid.

This is the Pauli $Y$ gate.

---

## Problem 8: augmented operator on a 3-qubit register
Given, following chapter 03 slide 34's augmentation notation: on 3 qubits, an operator acts as plain $X$ only on qubit 3, leaving qubits 1 and 2 completely untouched, for every value of qubits 1 and 2. In slide notation this is

$$
X^{(3)}_3 = \sum_{x,y\in\{0,1\}} \Big(|x,y,1\rangle\langle x,y,0| + |x,y,0\rangle\langle x,y,1|\Big).
$$

**Step 1, choose a basis ordering.** Rather than writing four separate outer-product terms (one per $x,y$ pair) and merging them by hand, use the block structure directly. Order the 8-dimensional basis by the index $4x+2y+z$ ($z$ is qubit 3, the least significant bit): $|000\rangle,|001\rangle,|010\rangle,|011\rangle,|100\rangle,|101\rangle,|110\rangle,|111\rangle$ at positions $0$ through $7$.

**Step 2, identify the pattern.** The mapping only ever flips the last bit $z$, and never touches $x$ or $y$, so it is a permutation that swaps each consecutive pair:

$$
(0,1),\; (2,3),\; (4,5),\; (6,7): \qquad |000\rangle \leftrightarrow |001\rangle,\; |010\rangle \leftrightarrow |011\rangle,\; |100\rangle \leftrightarrow |101\rangle,\; |110\rangle \leftrightarrow |111\rangle.
$$

**Step 3, assemble as a block-diagonal matrix.** This is a block-diagonal $8\times8$ matrix made of four copies of the $2\times2$ $X$ block along the diagonal (one $2\times2$ block per fixed $(x,y)$ pair):

$$
X^{(3)}_3 = X \oplus X \oplus X \oplus X, \qquad X = \begin{pmatrix}0&1\\1&0\end{pmatrix},
$$

where $\oplus$ denotes block-diagonal placement.

**Why this matches the course pattern.** This matches chapter 03 slide 34's examples ($X^{(3)}_3$, $Z^{(3)}_2$, $H^{(3)}_1$, controlled-NOT$^{(4)}_{1,3}$), where a single-qubit or two-qubit gate is embedded into a larger register by leaving every other qubit as an identity block.

**Step 4, verify.** It is also a valid gate: each $2\times2$ block on the diagonal is orthonormal, so the full block-diagonal matrix is orthonormal too.
