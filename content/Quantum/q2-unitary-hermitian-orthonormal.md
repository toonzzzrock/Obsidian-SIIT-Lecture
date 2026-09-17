<!-- #ruleok: gate names X, Y, Z, S, H are exact technical terms, not emphasis -->

# Question 2: Unitary Matrix (Hermitian and Orthonormal)

Source: Chapter 01, slides 4, 9, 12, 19, 22. Flagged by the instructor as challenging.

**Course-specific definition (slide 22).** This course calls a matrix $A$ **unitary** only when it satisfies *two* separate conditions *at the same time*:

$$
\text{Hermitian: } A^{\dagger} = A
\qquad\text{and}\qquad
\text{orthonormal: } A^{\dagger}A = I \;(\text{equivalently } A^{-1} = A^{\dagger}).
$$

Here $A^{\dagger}$ denotes the conjugate transpose of $A$ (transpose the matrix, then complex-conjugate every entry). Substituting $A^{\dagger}=A$ into $A^{\dagger}A = I$ gives $AA = I$, so every course-unitary matrix satisfies $A^2 = I$.

This is *stricter* than the usual textbook definition of "unitary," which only asks for $A^{\dagger}A = I$. In this course, a matrix that is orthonormal but **not** Hermitian is a separate, weaker category — it is still a valid reversible gate, but it is *not* called "unitary" here. Keep this distinction in mind for every problem below: always check Hermitian and orthonormal **separately**, then combine the two results.

---

## Why questions (Q&A)

### Q1. Why does $A$ need to be Hermitian before $v^{\dagger} A v$ is guaranteed real, and why does that matter physically?

**Setup.** In quantum mechanics, a measurable physical quantity (an "observable") is represented by a matrix $A$, and the expected value of measuring it on a state $v$ is $v^{\dagger} A v$.

**Step 1 — why Hermiticity forces a real quadratic form.** The spectral theorem says a Hermitian matrix ($A^{\dagger}=A$) always has:
- real eigenvalues, and
- an orthogonal basis of eigenvectors.

Because of this, $v^{\dagger}Av$ can be rewritten as a weighted sum of these real eigenvalues, with non-negative real weights $|c_i|^2$ coming from expanding $v$ in the eigenbasis. A sum of real numbers weighted by non-negative real numbers is itself real. So $v^{\dagger}Av \in \mathbb{R}$ for *every* complex vector $v$, precisely *because* $A$ is Hermitian.

**Step 2 — why this matters physically.** An expectation value is something you could in principle measure with a lab instrument and average over many trials — it has to come out as an ordinary real number, never a complex one. If $A$ were not Hermitian, $v^{\dagger}Av$ could have a nonzero imaginary part, and there would be no physical reading it could correspond to. So "Hermitian" is exactly the algebraic condition that makes a matrix a legitimate observable.

---

### Q2. Why is orthonormality ($A^{\dagger}A=I$) what makes a matrix a valid *gate*, while course-unitarity is a strictly narrower extra requirement on top of that?

**Step 1 — what a gate is required to do.** A quantum gate must take every normalized state to another normalized state, and it must be reversible (time evolution of an isolated system can always be run backward). Both of these requirements are captured by one equation:

$$
A^{\dagger}A = I.
$$

This says $A$ preserves inner products, hence norms, for every vector — so normalized states stay normalized. It also immediately gives the inverse for free: $A^{-1} = A^{\dagger}$, so undoing the gate is always possible.

**Step 2 — orthonormal alone is already enough.** Nothing more is needed to qualify as a valid gate. For example, $S = \mathrm{diag}(1,i)$ satisfies $S^{\dagger}S = I$ (checked in Math Q2 below), so $S$ is a perfectly good, physically realizable gate — even though it fails the extra Hermitian condition.

**Step 3 — why "course-unitary" is strictly narrower.** The course additionally calls a matrix "unitary" only when it is *also* Hermitian. This is an extra property that most valid reversible gates simply do not have. So every course-unitary matrix is a valid gate, but not every valid gate is course-unitary — orthonormality is the necessary-and-sufficient condition for being a gate at all; Hermiticity is an optional bonus property some gates happen to have.

---

### Q3. Why is every course-unitary gate automatically self-inverse, while a merely orthonormal gate is not?

**Step 1 — the algebra.** Course-unitary means both conditions hold simultaneously:

$$
A^{\dagger} = A \qquad\text{and}\qquad A^{\dagger}A = I.
$$

Substitute the first equation into the second, replacing $A^{\dagger}$ with $A$:

$$
A \cdot A = I \quad\Longrightarrow\quad A^2 = I.
$$

$A^2=I$ means applying $A$ twice in a row is exactly the same as doing nothing — $A$ is its own inverse.

**Step 2 — why this matches the gates highlighted in Chapter 03.** $X$, $Y$, $Z$, $H$, controlled-NOT, $CZ$, and swap are all shown (Math Q3–Q4 below) to be Hermitian *and* orthonormal at once, i.e. course-unitary — and that is exactly why the course repeatedly calls them "self-inverse": apply any of them twice and you are back where you started.

**Step 3 — the counterexample.** $S = \mathrm{diag}(1,i)$ is orthonormal ($S^{\dagger}S=I$, so it is a valid gate) but is *not* Hermitian ($S^{\dagger} = \mathrm{diag}(1,-i) \neq S$). Since the Hermitian half of the argument fails, $AA=I$ does not follow, and indeed

$$
S\,S\,|1\rangle = i \cdot i \,|1\rangle = -|1\rangle \neq |1\rangle.
$$

Applying $S$ twice does *not* return $|1\rangle$ unchanged — it flips its sign. This matches the slide's own remark that "$SS$ is equivalent to sign flipping" rather than $SS=I$.

---

### Q4. Why does multiplying a state by a global phase $\mathrm{cis}(\theta) = e^{i\theta}$ leave every measurement probability unchanged?

**Step 1 — expand the inner product.** Write out $\langle e^{i\theta}\psi \,|\, e^{i\theta}\psi\rangle$ directly using the rule that conjugating a scalar pulled out of a bra flips the sign of its exponent:

$$
\langle e^{i\theta}\psi \,|\, e^{i\theta}\psi\rangle
= \overline{e^{i\theta}}\, e^{i\theta} \,\langle\psi|\psi\rangle
= e^{-i\theta} e^{i\theta} \,\langle\psi|\psi\rangle
= e^{0}\,\langle\psi|\psi\rangle
= \langle\psi|\psi\rangle,
$$

since any pure phase factor has modulus $|e^{i\theta}| = 1$, i.e. $e^{-i\theta}e^{i\theta} = 1$ for every real $\theta$.

**Step 2 — why every measurement probability is unaffected too.** A measurement probability for basis outcome $|b\rangle$ is $|\langle b|\psi\rangle|^2$. Replacing $|\psi\rangle$ with $e^{i\theta}|\psi\rangle$ multiplies the amplitude $\langle b|\psi\rangle$ by the same phase $e^{i\theta}$, and

$$
\left|e^{i\theta}\langle b|\psi\rangle\right|^2 = |e^{i\theta}|^2\,\left|\langle b|\psi\rangle\right|^2 = \left|\langle b|\psi\rangle\right|^2.
$$

So no measurement outcome, on any basis, can ever tell $|\psi\rangle$ apart from $e^{i\theta}|\psi\rangle$.

**Why this matters.** This is exactly why global phase is dropped when counting the *physical* degrees of freedom of a state (see Question 1, Math Q1): two state vectors that differ only by an overall $e^{i\theta}$ factor represent the same physical state.

---

### Q5. Why is orthonormality — not the stronger course-unitary condition — the necessary *and* sufficient condition for a matrix to represent a valid, reversible gate?

**Necessity.** Any physical evolution of an isolated quantum system must:
1. preserve total probability (a state of norm 1 must evolve into a state of norm 1), and
2. be invertible (physical time evolution can always, in principle, be run backward).

Norm preservation plus invertibility together force exactly $A^{\dagger}A = I$ — this *is* the definition of orthonormality. Nothing about Hermiticity is required to derive this.

**Sufficiency.** Conversely, given any $A$ with $A^{\dagger}A = I$: $A$ maps the unit sphere in $\mathbb{C}^2$ (or $\mathbb{C}^{2^n}$ for $n$ qubits) bijectively onto itself, and $A^{\dagger}$ is a ready-made inverse that undoes it exactly. That is everything required of a gate — no more, no less.

**Conclusion.** Hermiticity (and therefore course-unitarity) is an *extra* property that some gates happen to have, not a requirement for being a valid gate. $S$, $T$, and $P(\theta)$ are all valid, physically realizable gates despite failing Hermiticity.

---

### Q6. Why does the orthonormality check use $\overline{a(j)} \cdot a(k)$ (the conjugated dot product) rather than a plain real dot product $a(j)\cdot a(k)$?

**Step 1 — what the inner product needs to guarantee.** The quantum inner product between two complex vectors is *defined* as

$$
\langle u | v \rangle = \overline{u}\cdot v = \sum_i \overline{u_i}\,v_i.
$$

The reason for the conjugation is that it forces $\langle u|u\rangle = \sum_i \overline{u_i}u_i = \sum_i |u_i|^2$, which is always a real, non-negative number — exactly the squared norm you need for a valid probability interpretation.

**Step 2 — why the plain dot product fails.** Without conjugation, $u\cdot u = \sum_i u_i^2$ is generally a *complex* number when the $u_i$ are complex (for instance $u=(1,i)$ gives $u\cdot u = 1 + i^2 = 0$, which is not even the correct squared norm of $2$). A quantity like this has no meaning as an overlap probability, so it cannot be what orthonormality is checked against — only the conjugated form $\overline{a(j)}\cdot a(k)$ correctly measures whether two columns are orthogonal (result $0$) and unit length (result $1$ when $j=k$).

---

## Math questions (Q&A)

Each problem below follows the same three-part method: (1) check Hermitian, (2) check orthonormal, (3) combine the two to decide course-unitarity. Work through every arithmetic step explicitly — do not skip the intermediate matrix multiplication.

### Q1. Is $A = \begin{pmatrix}1 & i \\ -i & 1\end{pmatrix}$ Hermitian? Orthonormal? Course-unitary?

**Step 1 — check Hermitian.** Take the conjugate transpose $A^{\dagger}$: first transpose,

$$
A^{T} = \begin{pmatrix}1 & -i \\ i & 1\end{pmatrix},
$$

then conjugate every entry:

$$
A^{\dagger} = \begin{pmatrix}1 & i \\ -i & 1\end{pmatrix} = A.
$$

Since $A^{\dagger} = A$, **$A$ is Hermitian**.

**Step 2 — check orthonormal.** We need $A^{\dagger}A$. Since $A$ is Hermitian, $A^{\dagger}=A$, so this is simply $A^2$. Multiply it out entry by entry:

$$
(1,1):\; 1\cdot 1 + i\cdot(-i) = 1 - i^2 = 1+1 = 2.
$$
$$
(1,2):\; 1\cdot i + i\cdot 1 = 2i.
$$
$$
(2,1):\; -i\cdot 1 + 1\cdot(-i) = -2i.
$$
$$
(2,2):\; -i\cdot i + 1\cdot 1 = -i^2 + 1 = 1+1 = 2.
$$

So

$$
A^2 = \begin{pmatrix}2 & 2i \\ -2i & 2\end{pmatrix} = 2A \neq I.
$$

**$A$ is not orthonormal.**

**Step 3 — combine.** Course-unitary requires *both* conditions. Hermitian holds but orthonormal fails, so **$A$ is not course-unitary**.

**Independent sanity check (eigenvalues).** For a matrix to be orthonormal, every eigenvalue must have modulus 1. Here $\operatorname{trace}(A) = 1+1 = 2$ and $\det(A) = 1\cdot 1 - i\cdot(-i) = 1 - 1 = 0$, so the eigenvalues solve $\lambda^2 - 2\lambda = 0$, giving $\lambda = 0$ and $\lambda=2$. Neither has modulus 1, which independently confirms $A$ cannot be orthonormal — consistent with Step 2.

---

### Q2. Is the phase gate $S = \begin{pmatrix}1&0\\0&i\end{pmatrix}$ Hermitian? Orthonormal? Course-unitary?

**Step 1 — check Hermitian.** $S$ is diagonal, so transposing changes nothing. Conjugating each entry gives

$$
S^{\dagger} = \begin{pmatrix}1 & 0 \\ 0 & -i\end{pmatrix}.
$$

Compare to $S$ itself: the $(2,2)$ entry flipped from $i$ to $-i$, so $S^{\dagger}\neq S$. **$S$ is not Hermitian.**

**Step 2 — check orthonormal.** Multiply $S^{\dagger}S$:

$$
S^{\dagger}S = \begin{pmatrix}1&0\\0&-i\end{pmatrix}\begin{pmatrix}1&0\\0&i\end{pmatrix} = \begin{pmatrix}1\cdot 1 & 0\\ 0 & (-i)(i)\end{pmatrix} = \begin{pmatrix}1&0\\0&1\end{pmatrix} = I.
$$

**$S$ is orthonormal.**

**Step 3 — combine.** Orthonormal holds but Hermitian fails, so **$S$ is not course-unitary**. It is still a perfectly valid, physically realizable, reversible gate — it is simply not in the narrower "unitary" category this course reserves for the Hermitian-and-orthonormal intersection, unlike $X$, $Y$, $Z$ below.

---

### Q3. Check the Pauli gates $X = \begin{pmatrix}0&1\\1&0\end{pmatrix}$ and $Y = \begin{pmatrix}0&-i\\i&0\end{pmatrix}$ for Hermitian, orthonormal, and course-unitary.

**$X$, Step 1 — Hermitian.** Transposing $X$ gives $\begin{pmatrix}0&1\\1&0\end{pmatrix}$, unchanged (it is already symmetric), and conjugating does nothing since every entry is real. So $X^{\dagger}=X$: **Hermitian.**

**$X$, Step 2 — orthonormal.**

$$
X^{\dagger}X = X^2 = \begin{pmatrix}0&1\\1&0\end{pmatrix}\begin{pmatrix}0&1\\1&0\end{pmatrix} = \begin{pmatrix}1&0\\0&1\end{pmatrix} = I.
$$

**Orthonormal.**

**$X$, Step 3 — combine.** Both hold, so **$X$ is course-unitary.**

**$Y$, Step 1 — Hermitian.** Transpose: $\begin{pmatrix}0&i\\-i&0\end{pmatrix}$. Conjugate each entry: $\begin{pmatrix}0&-i\\i&0\end{pmatrix} = Y$. So $Y^{\dagger}=Y$: **Hermitian.**

**$Y$, Step 2 — orthonormal.** Multiply entry by entry:

$$
(1,1):\; 0\cdot 0 + (-i)(i) = -i^2 = 1.
$$
$$
(2,2):\; i\cdot(-i) + 0\cdot 0 = -i^2 = 1.
$$

Off-diagonal entries both work out to $0$, so $Y^{\dagger}Y = I$: **orthonormal.**

**$Y$, Step 3 — combine.** Both hold, so **$Y$ is course-unitary.**

**Connection to Why Q3.** Both $X$ and $Y$ being course-unitary is exactly why they are self-inverse: $X^2=Y^2=I$, unlike $S$ from Q2, which is orthonormal but not Hermitian and therefore not self-inverse.

---

### Q4. Check whether the columns of $A = \begin{pmatrix}1&i\\-i&1\end{pmatrix}$ from Q1 are orthonormal, using the conjugated dot product directly on the columns.

**Step 1 — name the columns.** $a_1 = (1,-i)$, $a_2=(i,1)$.

**Step 2 — check orthogonality.** Compute $\overline{a_1}\cdot a_2$:

$$
\overline{a_1}\cdot a_2 = \overline{1}\cdot i + \overline{(-i)}\cdot 1 = i + i\cdot 1 = i + i = 2i.
$$

This is not $0$, so **the columns are not orthogonal.**

**Step 3 — check unit length.** Compute $\overline{a_1}\cdot a_1$:

$$
\overline{a_1}\cdot a_1 = |1|^2 + |-i|^2 = 1+1 = 2 \neq 1.
$$

**The columns are not even unit length.**

**Conclusion.** Both requirements of orthonormality (orthogonal columns, unit-length columns) fail. This gives a second, independent confirmation that $A$ is not orthonormal, agreeing with the eigenvalue argument at the end of Q1.

---

### Q5. Given $|\psi\rangle = \cos(\pi/6)\,|0\rangle + \sin(\pi/6)\,e^{i\pi/3}\,|1\rangle$, compute $\langle\psi|\psi\rangle$ directly, then compute $\langle e^{i\pi/4}\psi \,|\, e^{i\pi/4}\psi\rangle$ and confirm the two match.

**Step 1 — compute $\langle\psi|\psi\rangle$ directly.**

$$
\langle\psi|\psi\rangle = \left|\cos\tfrac{\pi}{6}\right|^2 + \left|\sin\tfrac{\pi}{6}\,e^{i\pi/3}\right|^2 = \cos^2\tfrac{\pi}{6} + \sin^2\tfrac{\pi}{6}\cdot\left|e^{i\pi/3}\right|^2.
$$

Since $\left|e^{i\pi/3}\right| = 1$, this reduces to $\cos^2\tfrac{\pi}{6} + \sin^2\tfrac{\pi}{6} = 1$ by the Pythagorean identity.

$$
\langle\psi|\psi\rangle = 1.
$$

**Step 2 — form the globally-phased state.**

$$
e^{i\pi/4}|\psi\rangle = e^{i\pi/4}\cos\tfrac{\pi}{6}\,|0\rangle + e^{i\pi/4}\sin\tfrac{\pi}{6}\,e^{i\pi/3}\,|1\rangle.
$$

**Step 3 — compute its norm squared.**

$$
\left\langle e^{i\pi/4}\psi \,\middle|\, e^{i\pi/4}\psi\right\rangle
= \left|e^{i\pi/4}\cos\tfrac{\pi}{6}\right|^2 + \left|e^{i\pi/4}\sin\tfrac{\pi}{6}\,e^{i\pi/3}\right|^2
= \cos^2\tfrac{\pi}{6} + \sin^2\tfrac{\pi}{6} = 1,
$$

because every factor of the form $\left|e^{i(\cdots)}\right|$ equals $1$, regardless of what phase angle sits inside the exponent.

**Conclusion.** Both computations give exactly $1$. This is a direct numerical confirmation of the general argument in Why Q4: multiplying a state by a global phase changes nothing about its norm.

---

### Q6. Let $M = \begin{pmatrix}\alpha&\beta\\\gamma&\delta\end{pmatrix}$ satisfy $M=M^{\dagger}$ (Hermitian) and $M^{\dagger}M=I$ (orthonormal) simultaneously — i.e. $M$ is course-unitary — as required by the generalized rotation-gate construction on Chapter 04 slide 12. Using $Y$ as a concrete instance of $M$, verify both conditions and state why $Y$ qualifies while $S$ (from Q2) does not.

**Step 1 — recall the construction.** Chapter 04 slide 12 defines a generalized rotation gate

$$
R_M(\theta) = \cos\!\left(\tfrac{\theta}{2}\right) I - i\sin\!\left(\tfrac{\theta}{2}\right) M,
$$

and requires $M$ to be course-unitary for $R_M(\theta)$ to come out orthonormal (a valid gate) for every real $\theta$.

**Step 2 — check $Y$ against both conditions.** Q3 above already showed $Y^{\dagger}=Y$ (Hermitian) and $Y^{\dagger}Y=I$ (orthonormal), holding simultaneously. So $Y$ *is* course-unitary, and is a legal choice: $M=Y$ can be plugged directly into $R_M(\theta)$.

**Step 3 — check $S$ against both conditions.** Q2 above showed $S^{\dagger}S=I$ (orthonormal) but $S^{\dagger}\neq S$ (not Hermitian). $S$ fails the Hermitian half of course-unitarity, so it does **not** qualify as an $M$ for this construction.

**Conclusion.** Only matrices in the intersection of Hermitian *and* orthonormal — such as the Pauli matrices $X$, $Y$, $Z$ — can serve as the generator $M$ of a generalized rotation gate. Being merely orthonormal, as $S$ is, is not enough.
