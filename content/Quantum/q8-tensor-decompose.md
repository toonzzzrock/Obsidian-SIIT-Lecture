<!-- #ruleok: gate acronyms H, X are exact technical terms, not emphasis -->
# Question 8: Tensor Decomposition (Given a State, Factor Out Its Product Structure)
Source: Chapter 01, slides 27-33 (tensor product); Chapter 03, slides 3, 28-34 (entanglement)

Task type for every problem below: you are given a multi-qubit state written as a sum of computational-basis terms, and you must determine whether it factors into a tensor product of smaller (single- or multi-qubit) states, and if so, find the factors explicitly with a full derivation; if not, prove that it cannot factor. Ordered easiest to hardest.

---

## Problem 1 (easy): $|\psi\rangle = |10\rangle$

**Step 1, read off the bit string.** $|10\rangle$ is already written as a single computational basis term, with q0 in position $1$ and q1 in position $0$.

**Step 2, factor directly.** A computational basis state on multiple qubits is, by definition, the tensor product of each qubit's own basis state:

$$
|10\rangle = |1\rangle_0 \otimes |0\rangle_1.
$$

**Why this is the easiest case.** No superposition is present at all, so there is nothing to combine or separate; identifying the factors is just reading each digit's position.

---

## Problem 2 (easy): $|\psi\rangle = \dfrac{|00\rangle+|01\rangle+|10\rangle+|11\rangle}{2}$

**Step 1, guess the ansatz.** Try writing the state as $\left(a|0\rangle+b|1\rangle\right)_0 \otimes \left(c|0\rangle+d|1\rangle\right)_1 = ac\,|00\rangle + ad\,|01\rangle + bc\,|10\rangle + bd\,|11\rangle$, and match coefficients against the target, which has every amplitude equal to $\tfrac12$:

$$
ac = ad = bc = bd = \frac12.
$$

**Step 2, solve.** From $ac=ad$, either $a=0$ (ruled out since $ac\neq0$) or $c=d$. Similarly from $ac=bc$, either $c=0$ (ruled out) or $a=b$. So $a=b$ and $c=d$; substituting into $ac=\tfrac12$ with normalization $a^2+b^2=1 \Rightarrow 2a^2=1 \Rightarrow a=\tfrac{1}{\sqrt2}$, and likewise $c=\tfrac{1}{\sqrt2}$.

**Step 3, identify the factors.**

$$
a=b=c=d=\frac{1}{\sqrt2} \quad\Rightarrow\quad |\psi\rangle = \frac{|0\rangle+|1\rangle}{\sqrt2}\Big|_0 \otimes \frac{|0\rangle+|1\rangle}{\sqrt2}\Big|_1 = |+\rangle_0 \otimes |+\rangle_1.
$$

**Step 4, sanity check.** $|+\rangle\otimes|+\rangle = \tfrac12(|0\rangle+|1\rangle)\otimes(|0\rangle+|1\rangle) = \tfrac12(|00\rangle+|01\rangle+|10\rangle+|11\rangle)$, matching the target exactly.

---

## Problem 3 (easy-medium): $|\psi\rangle = \dfrac{|00\rangle-|01\rangle+|10\rangle-|11\rangle}{2}$

**Step 1, look for a pattern by fixing q0 and varying q1.** Group the four terms by the value of q0:

$$
|\psi\rangle = \frac12\Big[|0\rangle_0\otimes\big(|0\rangle-|1\rangle\big)_1\Big] + \frac12\Big[|1\rangle_0\otimes\big(|0\rangle-|1\rangle\big)_1\Big].
$$

**Step 2, notice the q1 factor is identical in both groups.** Both groups carry the same q1 factor $\left(|0\rangle-|1\rangle\right)$, so it can be pulled outside as a common tensor factor:

$$
|\psi\rangle = \frac{1}{\sqrt2}\Big(|0\rangle_0+|1\rangle_0\Big) \otimes \frac{1}{\sqrt2}\Big(|0\rangle_1-|1\rangle_1\Big).
$$

**Step 3, identify the factors.**

$$
|\psi\rangle = |+\rangle_0 \otimes |-\rangle_1.
$$

**Step 4, verify by expanding back.** $|+\rangle\otimes|-\rangle = \tfrac12(|0\rangle+|1\rangle)(|0\rangle-|1\rangle) = \tfrac12(|00\rangle-|01\rangle+|10\rangle-|11\rangle)$, matching the target.

**Lesson.** The general test used here is: write the amplitude of $|x_1x_2\rangle$ as a function of the two bits, and check whether it splits as a product $f(x_1)\,g(x_2)$ of a function of $x_1$ alone times a function of $x_2$ alone. Here amplitude$(x_1,x_2) = \tfrac12(-1)^{x_2}$, which is independent of $x_1$ (so $f(x_1)=\tfrac{1}{\sqrt2}$ constant) and depends only on $x_2$ through $(-1)^{x_2}$ (so $g(x_2)=\tfrac{1}{\sqrt2}(-1)^{x_2}$) — the product-form test that the remaining problems all rely on.

---

## Problem 4 (medium): prove $|\Phi^+\rangle = \dfrac{|00\rangle+|11\rangle}{\sqrt2}$ does **not** factor

**Step 1, set up the ansatz and try to match coefficients.** Suppose, for contradiction, that

$$
|\Phi^+\rangle = \left(a|0\rangle+b|1\rangle\right)_0 \otimes \left(c|0\rangle+d|1\rangle\right)_1 = ac\,|00\rangle+ad\,|01\rangle+bc\,|10\rangle+bd\,|11\rangle.
$$

Matching against $\dfrac{1}{\sqrt2}|00\rangle + 0\cdot|01\rangle + 0\cdot|10\rangle + \dfrac{1}{\sqrt2}|11\rangle$ requires

$$
ac=\frac{1}{\sqrt2}, \qquad ad=0, \qquad bc=0, \qquad bd=\frac{1}{\sqrt2}.
$$

**Step 2, derive a contradiction.** From $ac=\tfrac{1}{\sqrt2}\neq0$: both $a\neq0$ and $c\neq0$. From $ad=0$ and $a\neq0$: it must be $d=0$. But then $bd = b\cdot0 = 0$, which contradicts $bd=\tfrac{1}{\sqrt2}\neq0$.

**Step 3, conclude.** No choice of $a,b,c,d$ can satisfy all four equations simultaneously, so no single-qubit states $|\phi\rangle_0,|\chi\rangle_1$ exist with $|\Phi^+\rangle=|\phi\rangle_0\otimes|\chi\rangle_1$. The Bell state is genuinely entangled, not just written in an unfamiliar form.

**Why the Problem 1–3 method fails here on purpose.** The product-form test from Problem 3 asks whether amplitude$(x_1,x_2)=f(x_1)g(x_2)$; here amplitude$(0,0)=\tfrac{1}{\sqrt2}$ and amplitude$(1,1)=\tfrac{1}{\sqrt2}$ are both nonzero while amplitude$(0,1)=$ amplitude$(1,0)=0$. If a product form existed, $f(0)g(0)\neq0$ and $f(1)g(1)\neq0$ force $f(0),f(1),g(0),g(1)$ all nonzero, which in turn forces $f(0)g(1)\neq0$, contradicting amplitude$(0,1)=0$. The zero/nonzero pattern itself already rules out separability before any algebra.

---

## Problem 5 (medium-hard): $|\psi\rangle = \dfrac{|000\rangle+|001\rangle+|110\rangle+|111\rangle}{2}$, partial factorization (2 qubits entangled, 1 free)

**Step 1, apply the product-form test to the third qubit against the rest.** Write amplitude$(x_1x_2,x_3)$ and check whether it depends on $x_3$ at all. Listing all four nonzero terms: $000,001,110,111$ all carry coefficient $\tfrac12$, and for both values of $x_3$ ($0$ and $1$) the *same* pair of $(x_1,x_2)$ values appear ($00$ and $11$). So the amplitude does not depend on $x_3$ beyond an overall constant, meaning q2 (the third qubit) factors out.

**Step 2, split off q2.**

$$
|\psi\rangle = \frac{1}{\sqrt2}\Big(|00\rangle+|11\rangle\Big)_{01} \otimes \frac{1}{\sqrt2}\Big(|0\rangle+|1\rangle\Big)_{2}.
$$

**Step 3, identify the factors.**

$$
|\psi\rangle = |\Phi^+\rangle_{01} \otimes |+\rangle_2.
$$

**Step 4, verify by expanding back.** $\dfrac{1}{\sqrt2}(|00\rangle+|11\rangle)\otimes\dfrac{1}{\sqrt2}(|0\rangle+|1\rangle) = \dfrac12(|000\rangle+|001\rangle+|110\rangle+|111\rangle)$, matching the target.

**Step 5, check that the remaining piece really cannot be split further.** By Problem 4, $|\Phi^+\rangle_{01}$ itself does not factor into $|\phi\rangle_0\otimes|\chi\rangle_1$; so the fullest possible factorization of this 3-qubit state is exactly two pieces, $\{q0,q1\}$ entangled together and $q2$ free, not three independent single-qubit factors.

**Lesson.** Factorization is not all-or-nothing on more than 2 qubits: a state can be *partially* separable, splitting into an entangled block plus one or more free qubits, and the product-form test must be applied one candidate qubit at a time to find the finest valid split.

---

## Problem 6 (hard): $|\psi\rangle = \dfrac{|000\rangle+i|011\rangle+|100\rangle+i|111\rangle}{2}$, partial factorization with a complex phase, different qubit grouping

**Step 1, test each qubit as a candidate to split off.** Group the four terms by the pair $(x_2,x_3)$: terms with $(x_2,x_3)=(0,0)$ are $000,100$ (coefficient $\tfrac12$, both values of $x_1$ present); terms with $(x_2,x_3)=(1,1)$ are $011,111$ (coefficient $\tfrac{i}{2}$, again both values of $x_1$ present); no terms have $(x_2,x_3)=(0,1)$ or $(1,0)$. Since $x_1$ ranges freely over both values for each fixed $(x_2,x_3)$, with the *same* coefficient in both cases, $q0$ (the $x_1$ qubit) factors out.

**Step 2, split off q0.**

$$
|\psi\rangle = \frac{1}{\sqrt2}\Big(|0\rangle+|1\rangle\Big)_0 \otimes \frac{1}{\sqrt2}\Big(|00\rangle+i|11\rangle\Big)_{12}.
$$

**Step 3, identify the factors.**

$$
|\psi\rangle = |+\rangle_0 \otimes \frac{|00\rangle+i|11\rangle}{\sqrt2}\Big|_{12}.
$$

**Step 4, verify by expanding back.** $\dfrac{1}{\sqrt2}(|0\rangle+|1\rangle)\otimes\dfrac{1}{\sqrt2}(|00\rangle+i|11\rangle) = \dfrac12\big(|000\rangle+i|011\rangle+|100\rangle+i|111\rangle\big)$, matching the target.

**Step 5, check the remaining 2-qubit piece for further factorization.** $\dfrac{|00\rangle+i|11\rangle}{\sqrt2}$ has the same zero/nonzero amplitude pattern as the Bell state in Problem 4 (only the $00$ and $11$ terms are populated, $01$ and $10$ are both zero), so the identical contradiction argument applies: any attempted product $\left(a|0\rangle+b|1\rangle\right)\otimes\left(c|0\rangle+d|1\rangle\right)$ forces $ad=0=bc$ while $ac,bd\neq0$, which is impossible. So $\{q1,q2\}$ stay entangled; only $q0$ separates.

**Why this is harder than Problem 5.** The complex coefficient $i$ on half the terms must be tracked through the grouping step without disturbing the conclusion (it multiplies both remaining terms consistently, so it does not block factorization on its own), and the qubit that separates out ($q0$, the first digit) is not adjacent to how the terms were listed, requiring the solver to actively search across groupings rather than immediately spotting an already-adjacent repeated block as in Problem 5.

---

## Problem 7 (very hard): prove the GHZ state $|\psi\rangle = \dfrac{|000\rangle+|111\rangle}{\sqrt2}$ has **no** nontrivial factorization at all, across every possible split

**Step 1, test the split $\{q0\}\;|\;\{q1,q2\}$.** Suppose $|\psi\rangle = \left(a|0\rangle+b|1\rangle\right)_0 \otimes |\chi\rangle_{12}$ for some 2-qubit state $|\chi\rangle$. Expand:

$$
a|0\rangle_0\otimes|\chi\rangle_{12} + b|1\rangle_0\otimes|\chi\rangle_{12} \;\overset{!}{=}\; \frac{1}{\sqrt2}|0\rangle_0\otimes|00\rangle_{12} + \frac{1}{\sqrt2}|1\rangle_0\otimes|11\rangle_{12}.
$$

Since $|0\rangle_0$ and $|1\rangle_0$ are linearly independent, the coefficients multiplying each of them must match separately:

$$
a\,|\chi\rangle = \frac{1}{\sqrt2}|00\rangle, \qquad b\,|\chi\rangle = \frac{1}{\sqrt2}|11\rangle.
$$

**Step 2, derive the contradiction.** A valid GHZ decomposition needs both $a\neq0$ and $b\neq0$ (otherwise $|\psi\rangle$ would collapse to a single term, which it is not). With $a\neq0$, the first equation gives $|\chi\rangle = \dfrac{1}{a\sqrt2}|00\rangle$, i.e. $|\chi\rangle$ is proportional to $|00\rangle$. With $b\neq0$, the second equation gives $|\chi\rangle$ proportional to $|11\rangle$ instead. But $|00\rangle$ and $|11\rangle$ are linearly independent vectors, so no single $|\chi\rangle$ can be proportional to both at once. Contradiction; this split is impossible.

**Step 3, note the argument is symmetric under relabeling.** Nothing in Step 1–2 depended on which qubit was singled out; the identical argument with $q1$ or $q2$ playing the role of the singled-out qubit produces the identical contradiction (the roles of $|00\rangle,|11\rangle$ are simply replaced by the corresponding two-bit strings on the other pair). So the splits $\{q1\}|\{q0,q2\}$ and $\{q2\}|\{q0,q1\}$ fail for the same reason.

**Step 4, rule out full separation into three single-qubit factors.** A full factorization $|\phi\rangle_0\otimes|\chi\rangle_1\otimes|\omega\rangle_2$ is a special case of the split tested in Step 1 (with $|\chi\rangle_{12}=|\chi\rangle_1\otimes|\omega\rangle_2$), so it is already ruled out by the same contradiction.

**Conclusion.** Unlike Problems 5 and 6, where one qubit could always be peeled off leaving a smaller entangled block, the GHZ state admits no nontrivial tensor factorization whatsoever: every one of its three qubits is entangled with the other two, and there is no bipartition of the register across which the state splits.
