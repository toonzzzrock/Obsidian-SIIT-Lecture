<!-- #ruleok: gate acronyms P, T, S, H, X, CNOT, RY are exact technical terms, not emphasis -->
# Question 7: Non-Clifford Gates (State Initialization with Clifford and Non-Clifford Gates)
Source: Chapter 04, slides 6-8, 11-16

Task type for every problem below: you are given a target quantum state that a Clifford-only circuit cannot reach, and you must draw a circuit using both Clifford gates ($H$, $S$, Pauli $X/Y/Z$, controlled-NOT) and at least one non-Clifford gate ($P(\lambda)$, $T$, or a continuous-angle rotation $R_Y(\theta)$) that prepares it from the all-zero basis state, then verify by tracing forward.

---

## Problem 1: $\dfrac{|0\rangle + e^{i\pi/4}|1\rangle}{\sqrt2}$, single qubit

Circuit:
```
q0: |0> --H--T--
```

**Step 1 (start).** $|0\rangle$.

**Step 2 (after $H$).** $\dfrac{1}{\sqrt2}\left(|0\rangle+|1\rangle\right)$.

**Step 3 (after $T$).** $T = \mathrm{diag}\!\left(1, e^{i\pi/4}\right)$ multiplies the $|1\rangle$ amplitude by $e^{i\pi/4}$, leaving the $|0\rangle$ amplitude untouched.

$$
\frac{1}{\sqrt2}\left(|0\rangle+e^{i\pi/4}|1\rangle\right),
$$

the target state.

**Why Clifford alone cannot do this.** $H$ alone only ever produces real, equal-weight superpositions with phase $0$ or $\pi$ between the two terms; $T$ is what supplies the $\pi/4$ relative phase that neither $H$ nor $S$ (which only offers multiples of $\pi/2$) can produce.

---

## Problem 2: $\dfrac{|00\rangle + e^{i\pi/4}|11\rangle}{\sqrt2}$, two qubits

Circuit:
```
q0: |0> --H--*-----
             |
q1: |0> -----X--T--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$, the Bell state.

**Step 4 (after $T$ on q1).** The $|00\rangle$ term has $q1=|0\rangle$ and is untouched; the $|11\rangle$ term has $q1=|1\rangle$ and picks up $e^{i\pi/4}$.

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle+e^{i\pi/4}|11\rangle\right),
$$

the target state.

---

## Problem 3: $\cos(\pi/8)|0\rangle + \sin(\pi/8)|1\rangle$, single qubit, arbitrary rotation angle

Circuit:
```
q0: |0> --RY(pi/4)--
```

**Step 1 (start).** $|0\rangle$.

**Step 2 (after $R_Y(\pi/4)$).**

$$
R_Y(\theta)|0\rangle = \cos\!\left(\tfrac{\theta}{2}\right)|0\rangle + \sin\!\left(\tfrac{\theta}{2}\right)|1\rangle
$$

for any real $\theta$; substituting $\theta=\pi/4$:

$$
\cos\!\left(\tfrac{\pi}{8}\right)|0\rangle + \sin\!\left(\tfrac{\pi}{8}\right)|1\rangle,
$$

the target state, directly in one gate.

**Why this needs a non-Clifford gate.** Clifford single-qubit gates only ever reach the six stabilizer states ($|0\rangle$, $|1\rangle$, $|+\rangle$, $|-\rangle$, $|{+i}\rangle$, $|{-i}\rangle$); $\pi/8$ is not one of the fixed Clifford angles (multiples of $\pi/2$), so only a continuously parameterized rotation gate like $R_Y$ can land exactly here.

---

## Problem 4: $\dfrac{|000\rangle + e^{i\pi/4}|111\rangle}{\sqrt2}$, GHZ state with a non-Clifford phase

Circuit:
```
q0: |0> --H--*-----*-----
             |     |
q1: |0> -----X-----|-----
                    |
q2: |0> ------------X--T--
```

**Step 1 (start).** $|000\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|000\rangle+|100\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1).** $\dfrac{1}{\sqrt2}\left(|000\rangle+|110\rangle\right)$.

**Step 4 (after controlled-NOT, control q0, target q2).** $\dfrac{1}{\sqrt2}\left(|000\rangle+|111\rangle\right)$, the ordinary GHZ state.

**Step 5 (after $T$ on q2).** The $|000\rangle$ term has $q2=|0\rangle$ and is untouched; the $|111\rangle$ term has $q2=|1\rangle$ and picks up $e^{i\pi/4}$.

**Final state.**

$$
\frac{1}{\sqrt2}\left(|000\rangle+e^{i\pi/4}|111\rangle\right),
$$

the target state.

---

## Problem 5: $\dfrac{|0\rangle + e^{i\pi/8}|1\rangle}{\sqrt2}$, single qubit, general phase gate $P(\lambda)$

Circuit:
```
q0: |0> --H--P(pi/8)--
```

**Step 1 (start).** $|0\rangle$.

**Step 2 (after $H$).** $\dfrac{1}{\sqrt2}\left(|0\rangle+|1\rangle\right)$.

**Step 3 (after $P(\pi/8)$).** $P(\lambda) = \mathrm{diag}\!\left(1,e^{i\lambda}\right)$ multiplies the $|1\rangle$ amplitude by $e^{i\pi/8}$, leaving $|0\rangle$ untouched.

**Final state.**

$$
\frac{1}{\sqrt2}\left(|0\rangle+e^{i\pi/8}|1\rangle\right),
$$

the target state. This is the same construction as Problem 1 but with an arbitrary angle $\lambda = \pi/8$ instead of the fixed $T = P(\pi/4)$, showing $T$ is just one fixed instance of the more general $P(\lambda)$ family.

---

## Problem 6: $\cos(\pi/8)|00\rangle + \sin(\pi/8)|11\rangle$, a non-maximally-entangled two-qubit state

Circuit:
```
q0: |0> --RY(pi/4)--*--
                     |
q1: |0> -------------X--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $R_Y(\pi/4)$ on q0).** $\cos(\pi/8)|0\rangle + \sin(\pi/8)|1\rangle$ on q0, tensor $|0\rangle$ on q1.

$$
\cos(\pi/8)|00\rangle + \sin(\pi/8)|10\rangle.
$$

**Step 3 (after controlled-NOT, control q0, target q1).** The $|10\rangle$ term has control $1$, so q1 flips: $\sin(\pi/8)|11\rangle$; the $|00\rangle$ term has control $0$ and is untouched: $\cos(\pi/8)|00\rangle$.

**Final state.**

$$
\cos(\pi/8)|00\rangle + \sin(\pi/8)|11\rangle,
$$

the target state.

**Why this needs a non-Clifford gate.** Clifford gates ($H$, controlled-NOT) alone only ever reach the maximally-entangled Bell states, with equal weight $1/\sqrt2$ on both terms; reaching an unequal weighting like $\cos(\pi/8)$ versus $\sin(\pi/8)$ requires a continuously variable rotation angle before the entangling controlled-NOT.

---

## Problem 7: Bell pair on q0,q1 tensor a non-Clifford single-qubit state on q2

Target: $\dfrac{|00\rangle+|11\rangle}{\sqrt2}$ (qubits 0,1) $\otimes$ $\left(\cos(\pi/8)|0\rangle+\sin(\pi/8)|1\rangle\right)$ (qubit 2).

Circuit:
```
q0: |0> --H--*----------------
             |
q1: |0> -----X----------------
q2: |0> --RY(pi/4)-------------
```

**Step 1, structural observation.** q0,q1 and q2 share no gate, so they can be traced independently and combined at the end by a tensor product, the same reasoning used for parallel sub-circuits in Question 5.

**Step 2, q0,q1 branch.** After $H$ then controlled-NOT: $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$, the ordinary Bell state.

**Step 3, q2 branch.** After $R_Y(\pi/4)$: $\cos(\pi/8)|0\rangle + \sin(\pi/8)|1\rangle$.

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)_{01} \otimes \left(\cos(\pi/8)|0\rangle+\sin(\pi/8)|1\rangle\right)_2,
$$

the target state. The Bell pair needed only Clifford gates; only the q2 register needed the non-Clifford rotation.

---

## Problem 8: $\dfrac{|0\rangle + e^{i3\pi/4}|1\rangle}{\sqrt2}$, composing a Clifford phase gate with a non-Clifford phase gate

Circuit:
```
q0: |0> --H--S--T--
```

**Step 1 (start).** $|0\rangle$.

**Step 2 (after $H$).** $\dfrac{1}{\sqrt2}\left(|0\rangle+|1\rangle\right)$.

**Step 3 (after $S$).** $S = \mathrm{diag}(1,i)$ multiplies the $|1\rangle$ amplitude by $i = e^{i\pi/2}$, leaving $|0\rangle$ untouched.

$$
\frac{1}{\sqrt2}\left(|0\rangle+e^{i\pi/2}|1\rangle\right).
$$

**Step 4 (after $T$).** $T$ multiplies the $|1\rangle$ amplitude by $e^{i\pi/4}$ again, and phases on the same amplitude add:

$$
e^{i\pi/2}\cdot e^{i\pi/4} = e^{i(\pi/2+\pi/4)} = e^{i3\pi/4}.
$$

**Final state.**

$$
\frac{1}{\sqrt2}\left(|0\rangle+e^{i3\pi/4}|1\rangle\right),
$$

the target state.

**Why this matters.** This shows a Clifford phase gate ($S$, angle $\pi/2$) and a non-Clifford phase gate ($T$, angle $\pi/4$) applied to the same qubit combine by adding their angles, since both are diagonal in the same basis and commute with each other. The same $3\pi/4$ target could equally well have been reached by a single $P(3\pi/4)$ in place of $S$ and $T$ together.
