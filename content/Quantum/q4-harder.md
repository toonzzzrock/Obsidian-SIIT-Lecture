<!-- #ruleok: gate acronyms X, Y, Z, H, S, T, CNOT, SWAP, CZ are exact technical terms, not emphasis -->
# Question 4 (Harder): Quantum Operators (Translating a State Mapping to a Matrix)
Source: Chapter 02, slides 3-4, 7-9, 19, 21, 27, 32-33; Chapter 03, slides 11, 38-39; Chapter 04, slides 11-16

These problems go beyond the base Question 4 set: mappings where information is deliberately incomplete and must be recovered from orthonormality, mappings on 3 qubits with genuinely entangling truth tables, mappings given between two non-computational bases at once, and a mapping given as a symbolic formula rather than concrete numbers.

---

## Problem 1: recovering a missing output from orthonormality alone

Given: on a single qubit, only one output is specified,

$$
|0\rangle \;\to\; \frac{1}{\sqrt3}|0\rangle + \sqrt{\frac{2}{3}}\,|1\rangle,
$$

and you are told the unknown operator $U$ is orthonormal (a valid gate). Find $U|1\rangle$, then assemble the full matrix $U$.

**Step 1, what orthonormality forces.** $U^{\dagger}U=I$ means the columns of $U$ must form an orthonormal set. Column 0 is already fixed as $\left(\tfrac{1}{\sqrt3},\,\sqrt{\tfrac23}\right)$; this has norm

$$
\left(\tfrac{1}{\sqrt3}\right)^2 + \left(\sqrt{\tfrac23}\right)^2 = \tfrac13+\tfrac23 = 1,
$$

so it is already a valid unit vector. Column 1 must be a unit vector **orthogonal** to column 0, since distinct columns of an orthonormal matrix must have zero overlap.

**Step 2, find a vector orthogonal to column 0.** In $\mathbb{C}^2$, a real vector orthogonal to $\left(\tfrac{1}{\sqrt3},\sqrt{\tfrac23}\right)$ is obtained by swapping the two entries and flipping one sign:

$$
\left(-\sqrt{\tfrac23},\,\tfrac{1}{\sqrt3}\right).
$$

Check orthogonality directly:

$$
\tfrac{1}{\sqrt3}\left(-\sqrt{\tfrac23}\right) + \sqrt{\tfrac23}\cdot\tfrac{1}{\sqrt3} = -\frac{\sqrt2}{3} + \frac{\sqrt2}{3} = 0. \quad\checkmark
$$

Its norm is $\tfrac23+\tfrac13=1$, so it is already unit length.

**Step 3, the phase freedom.** This orthogonal unit vector is only determined up to an overall phase $e^{i\gamma}$ — multiplying it by any $e^{i\gamma}$ keeps it unit length and orthogonal to column 0. Nothing in the problem statement fixes $\gamma$, so we take the simplest choice $\gamma=0$ (a real solution). A different piece of information (e.g. a stated Hermiticity requirement, or a second constraint on $U|1\rangle$) would be needed to pin down $\gamma$ uniquely.

**Step 4, assemble.**

$$
U|1\rangle = -\sqrt{\tfrac23}\,|0\rangle + \tfrac{1}{\sqrt3}|1\rangle,
\qquad
U = \begin{pmatrix}\tfrac{1}{\sqrt3} & -\sqrt{\tfrac23}\\[4pt] \sqrt{\tfrac23} & \tfrac{1}{\sqrt3}\end{pmatrix}.
$$

**Step 5, verify.** Both columns are unit length and mutually orthogonal (Steps 1-2), so $U^{\dagger}U=I$ by construction. This $U$ has the form $\begin{pmatrix}\cos\alpha & -\sin\alpha\\ \sin\alpha & \cos\alpha\end{pmatrix}$ with $\cos\alpha = \tfrac{1}{\sqrt3}$, i.e. it is a real rotation matrix, matching the $R_Y(\theta)$ family from chapter 04 slide 14 with $\theta = 2\alpha$.

---

## Problem 2: the Toffoli gate's full $8\times8$ matrix from its truth table

Given, on 3 qubits: $|x,y,z\rangle \to |x,\,y,\,z \oplus (x\wedge y)\rangle$ (the target bit flips only when both control bits $x,y$ are $1$).

**Step 1, write out all 8 images.** Using the ordering $|x,y,z\rangle$ with $z$ the target:

$$
|000\rangle\to|000\rangle,\; |001\rangle\to|001\rangle,\; |010\rangle\to|010\rangle,\; |011\rangle\to|011\rangle,
$$
$$
|100\rangle\to|100\rangle,\; |101\rangle\to|101\rangle,\; |110\rangle\to|111\rangle,\; |111\rangle\to|110\rangle.
$$

Only the last two rows change: $x=y=1$ toggles $z$.

**Step 2, write the outer-product sum.** Six terms are identity-like ($|v\rangle\langle v|$ for the six untouched basis states) plus two swapped terms:

$$
U = \sum_{v \neq 110,111} |v\rangle\langle v| \;+\; |111\rangle\langle 110| + |110\rangle\langle 111|.
$$

**Step 3, place entries.** Order the basis by index $4x+2y+z$, positions $0$–$7$. Every position keeps a $1$ on the diagonal except positions $6$ ($110$) and $7$ ($111$), which swap:

$$
U = \begin{pmatrix}
1&0&0&0&0&0&0&0\\
0&1&0&0&0&0&0&0\\
0&0&1&0&0&0&0&0\\
0&0&0&1&0&0&0&0\\
0&0&0&0&1&0&0&0\\
0&0&0&0&0&1&0&0\\
0&0&0&0&0&0&0&1\\
0&0&0&0&0&0&1&0
\end{pmatrix}.
$$

**Step 4, verify.** This is a permutation matrix (exactly one $1$ per row and column), so $U^{\dagger}U=I$ automatically. This is the Toffoli gate, and it is non-Clifford (Question 7, Math Q6) precisely because it cannot be decomposed as a product of one- and two-qubit Clifford gates, even though the matrix itself is a simple $0/1$ permutation.

---

## Problem 3: iSWAP from its mapping (entangling, complex-valued, not a plain permutation)

Given: $|00\rangle\to|00\rangle$, $|01\rangle\to i|10\rangle$, $|10\rangle\to i|01\rangle$, $|11\rangle\to|11\rangle$.

**Step 1, write the outer-product sum.**

$$
U = |00\rangle\langle 00| + i|10\rangle\langle 01| + i|01\rangle\langle 10| + |11\rangle\langle 11|.
$$

**Step 2, place columns.** Column 0 ($\langle 00|$): $(1,0,0,0)$. Column 1 ($\langle 01|$): image is $i|10\rangle$, so $(0,0,i,0)$. Column 2 ($\langle 10|$): image is $i|01\rangle$, so $(0,i,0,0)$. Column 3 ($\langle 11|$): $(0,0,0,1)$.

**Step 3, assemble.**

$$
U = \begin{pmatrix}1&0&0&0\\0&0&i&0\\0&i&0&0\\0&0&0&1\end{pmatrix}.
$$

**Step 4, verify.** Each column has exactly one nonzero entry, of modulus $|i|=1$ or $|1|=1$, and the nonzero entries of distinct columns sit in distinct rows (row $0$, row $2$, row $1$, row $3$ respectively), so all columns are mutually orthogonal and unit length: $U^{\dagger}U=I$. Valid. Unlike Problem 2, this mapping genuinely entangles the computational basis states $|01\rangle,|10\rangle$ into each other with an extra factor of $i$, rather than merely permuting bit strings unchanged in value.

---

## Problem 4: change of basis between the Bell basis and the computational basis

Given, following the standard Bell-measurement convention: $|\Phi^+\rangle \to |00\rangle$, $|\Phi^-\rangle \to |01\rangle$, $|\Psi^+\rangle \to |10\rangle$, $|\Psi^-\rangle \to |11\rangle$, where

$$
|\Phi^{\pm}\rangle = \frac{|00\rangle\pm|11\rangle}{\sqrt2}, \qquad |\Psi^{\pm}\rangle = \frac{|01\rangle\pm|10\rangle}{\sqrt2}.
$$

Unlike every problem in the base Question 4 file, **each input ket here is itself a two-term superposition**, so every bra in the outer-product sum expands into two pieces before columns can be read off.

**Step 1, expand every bra.**

$$
\langle\Phi^+| = \tfrac{1}{\sqrt2}(\langle00|+\langle11|), \quad
\langle\Phi^-| = \tfrac{1}{\sqrt2}(\langle00|-\langle11|),
$$
$$
\langle\Psi^+| = \tfrac{1}{\sqrt2}(\langle01|+\langle10|), \quad
\langle\Psi^-| = \tfrac{1}{\sqrt2}(\langle01|-\langle10|).
$$

**Step 2, write the outer-product sum and distribute.**

$$
U = |00\rangle\langle\Phi^+| + |01\rangle\langle\Phi^-| + |10\rangle\langle\Psi^+| + |11\rangle\langle\Psi^-|
$$
$$
= \tfrac{1}{\sqrt2}|00\rangle\big(\langle00|+\langle11|\big) + \tfrac{1}{\sqrt2}|01\rangle\big(\langle00|-\langle11|\big) + \tfrac{1}{\sqrt2}|10\rangle\big(\langle01|+\langle10|\big) + \tfrac{1}{\sqrt2}|11\rangle\big(\langle01|-\langle10|\big).
$$

**Step 3, collect by input basis ket (column) rather than by term.** Column $\langle00|$ receives a contribution from the first two terms: $\tfrac{1}{\sqrt2}|00\rangle$ and $\tfrac{1}{\sqrt2}|01\rangle$, so

$$
\text{col}_{00} = \left(\tfrac{1}{\sqrt2},\,\tfrac{1}{\sqrt2},\,0,\,0\right).
$$

Column $\langle11|$ receives $\tfrac{1}{\sqrt2}|00\rangle$ and $-\tfrac{1}{\sqrt2}|01\rangle$:

$$
\text{col}_{11} = \left(\tfrac{1}{\sqrt2},\,-\tfrac{1}{\sqrt2},\,0,\,0\right).
$$

Column $\langle01|$ receives $\tfrac{1}{\sqrt2}|10\rangle$ and $\tfrac{1}{\sqrt2}|11\rangle$:

$$
\text{col}_{01} = \left(0,\,0,\,\tfrac{1}{\sqrt2},\,\tfrac{1}{\sqrt2}\right).
$$

Column $\langle10|$ receives $\tfrac{1}{\sqrt2}|10\rangle$ and $-\tfrac{1}{\sqrt2}|11\rangle$:

$$
\text{col}_{10} = \left(0,\,0,\,\tfrac{1}{\sqrt2},\,-\tfrac{1}{\sqrt2}\right).
$$

**Step 4, assemble in the standard column order $\{00,01,10,11\}$.**

$$
U = \frac{1}{\sqrt2}\begin{pmatrix}1&0&0&1\\1&0&0&-1\\0&1&1&0\\0&1&-1&0\end{pmatrix}.
$$

**Step 5, verify orthonormality directly.** $\text{col}_{00}\cdot\text{col}_{00} = \tfrac12+\tfrac12=1$; $\text{col}_{00}\cdot\text{col}_{11} = \tfrac12-\tfrac12=0$; $\text{col}_{01}\cdot\text{col}_{10} = \tfrac12-\tfrac12=0$; all cross terms between $\{00,11\}$-columns and $\{01,10\}$-columns vanish automatically since they have disjoint nonzero rows. So $U^{\dagger}U=I$. Valid. This $U$ is exactly the Bell-basis-to-computational-basis change-of-basis matrix.

---

## Problem 5: a symbolic mapping, deriving $R_Z(\theta)$ as a formula and connecting it to $P(\lambda)$

Given, as a formula in the real parameter $\theta$ rather than concrete numbers:

$$
|0\rangle \to e^{-i\theta/2}|0\rangle, \qquad |1\rangle \to e^{i\theta/2}|1\rangle.
$$

**Step 1, write the outer-product sum.**

$$
U(\theta) = e^{-i\theta/2}|0\rangle\langle0| + e^{i\theta/2}|1\rangle\langle1|.
$$

**Step 2, assemble.**

$$
U(\theta) = \begin{pmatrix}e^{-i\theta/2} & 0\\ 0 & e^{i\theta/2}\end{pmatrix} = R_Z(\theta).
$$

**Step 3, verify orthonormality for every $\theta$.** $U(\theta)^{\dagger}U(\theta)$ has diagonal entries $e^{i\theta/2}e^{-i\theta/2}=1$ and $e^{-i\theta/2}e^{i\theta/2}=1$, with off-diagonal entries $0$, so $U(\theta)^{\dagger}U(\theta)=I$ for every real $\theta$: a whole one-parameter family of valid gates, not a single matrix.

**Step 4, connect to $P(\lambda)$ by factoring out a global phase.** Factor $e^{-i\theta/2}$ out of both diagonal entries:

$$
R_Z(\theta) = e^{-i\theta/2}\begin{pmatrix}1 & 0\\ 0 & e^{i\theta}\end{pmatrix} = e^{-i\theta/2}\,P(\theta).
$$

**Step 5, check the factoring is correct entry by entry.** $(1,1)$ entry: $e^{-i\theta/2}\cdot 1 = e^{-i\theta/2}$, matching $U(\theta)$'s $(1,1)$ entry directly. $(2,2)$ entry: $e^{-i\theta/2}\cdot e^{i\theta} = e^{i\theta/2}$, matching $U(\theta)$'s $(2,2)$ entry. Both match exactly.

**Conclusion.** $R_Z(\theta)$ and $P(\theta)$ act identically on any state up to the *global* phase factor $e^{-i\theta/2}$, so they are physically indistinguishable in isolation (Question 2, Why Q4) even though their matrices differ — but that global-phase factor stops being ignorable the moment $R_Z$ or $P$ is used as the *controlled* version of itself inside a larger circuit, since a controlled gate cannot discard a phase that only appears on one branch of the control.
