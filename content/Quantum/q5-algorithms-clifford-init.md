<!-- #ruleok: gate acronyms X, Y, Z, H, S, CNOT, CZ, GHZ are exact technical terms, not emphasis -->
# Question 5: Quantum Algorithms (State Initialization with Clifford Gates)
Source: Chapter 03, slides 3, 7-12, 28, 30-34, 38-39, 43-44. Flagged by the instructor as challenging.

Task type for every problem below: you are given a target quantum state, and you must draw a circuit built only from Clifford gates ($H$, $S$, Pauli $X/Y/Z$, controlled-NOT, $CZ$, swap) that prepares it starting from the all-zero computational basis state, then verify by tracing the circuit forward, one gate at a time.

---

## Problem 1: Bell state $\dfrac{|00\rangle + |11\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*--
             |
q1: |0> -----X--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).**

$$
\frac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right).
$$

**Step 3 (after controlled-NOT, control q0, target q1).** The $|10\rangle$ term has control $1$, so its target flips $0\to1$, giving $|11\rangle$; the $|00\rangle$ term has control $0$ and is untouched.

$$
\frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right).
$$

**Final state**, matching the target exactly.

---

## Problem 2: $\dfrac{|01\rangle - |10\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*--X-------
             |
q1: |0> -----X----Z-----
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$.

**Step 4 (after $X$ on q0).** $X$ flips the first digit of both terms: $|00\rangle \to |10\rangle$ and $|11\rangle\to|01\rangle$.

$$
\frac{1}{\sqrt2}\left(|10\rangle+|01\rangle\right).
$$

**Step 5 (after $Z$ on q1).** $Z$ multiplies the amplitude by $-1$ whenever q1 is $|1\rangle$; the $|01\rangle$ term has $q1=1$, so it picks up $-1$, while $|10\rangle$ has $q1=0$ and is untouched.

$$
\frac{1}{\sqrt2}\left(|10\rangle - |01\rangle\right) = -\frac{1}{\sqrt2}\left(|01\rangle - |10\rangle\right).
$$

**Conclusion.** This is the target state up to an overall global phase of $-1$, which is unobservable (Question 2, Why Q4).

---

## Problem 3: GHZ state $\dfrac{|000\rangle + |111\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*-----*--
             |     |
q1: |0> -----X-----|--
                    |
q2: |0> ------------X--
```

**Step 1 (start).** $|000\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|000\rangle+|100\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1).** The $|100\rangle$ term has control $1$, flipping q1: $\dfrac{1}{\sqrt2}\left(|000\rangle+|110\rangle\right)$.

**Step 4 (after controlled-NOT, control q0, target q2).** The $|110\rangle$ term still has control (q0) equal to $1$, flipping q2:

$$
\frac{1}{\sqrt2}\left(|000\rangle+|111\rangle\right),
$$

the target state.

---

## Problem 4: $|-\rangle = \dfrac{|0\rangle - |1\rangle}{\sqrt2}$, single qubit

Circuit:
```
q0: |0> --X--H--
```

**Step 1 (start).** $|0\rangle$.

**Step 2 (after $X$).** $|1\rangle$.

**Step 3 (after $H$).** Using $H$'s own state mapping directly ($H|1\rangle = |-\rangle$):

$$
H|1\rangle = \frac{|0\rangle-|1\rangle}{\sqrt2},
$$

the target state, no extra sign gate needed since $X$ placed the qubit at $|1\rangle$ before Hadamard mixes it.

---

## Problem 5: two independent Bell pairs, 4 qubits, $\dfrac{|00\rangle+|11\rangle}{\sqrt2} \otimes \dfrac{|00\rangle+|11\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*----------
             |
q1: |0> -----X----------
q2: |0> --H-------*-----
                   |
q3: |0> -----------X----
```

**Step 1, structural observation.** The two pairs $(q0,q1)$ and $(q2,q3)$ never interact, so they can be traced independently and then combined by a tensor product.

**Step 2 (after $H$ on q0 and q2).**

$$
\frac{1}{2}\left(|00\rangle+|10\rangle\right)_{01} \otimes \left(|00\rangle+|10\rangle\right)_{23}
$$

(writing each pair's own 2-qubit amplitude vector).

**Step 3 (after controlled-NOT(q0,q1)).** Pair 01 becomes $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$.

**Step 4 (after controlled-NOT(q2,q3)).** Pair 23 becomes $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$.

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)_{01} \otimes \frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)_{23},
$$

two independent Bell pairs, exactly the target.

---

## Problem 6: $\dfrac{|00\rangle - |11\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*--Z--
             |
q1: |0> -----X-----
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 3 (after controlled-NOT).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$.

**Step 4 (after $Z$ on q0).** $Z$ multiplies the amplitude by $-1$ whenever q0 is $|1\rangle$; the $|11\rangle$ term has $q0=1$, so it picks up $-1$, while $|00\rangle$ is untouched.

$$
\frac{1}{\sqrt2}\left(|00\rangle - |11\rangle\right),
$$

the target state exactly, no global phase needed.

---

## Problem 7: $\dfrac{|01\rangle + |10\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*--X--
             |
q1: |0> -----X-----
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 3 (after controlled-NOT).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$.

**Step 4 (after $X$ on q0).** $X$ flips the first digit of both terms: $|00\rangle\to|10\rangle$ and $|11\rangle\to|01\rangle$.

$$
\frac{1}{\sqrt2}\left(|10\rangle+|01\rangle\right) = \frac{1}{\sqrt2}\left(|01\rangle+|10\rangle\right),
$$

the target state directly, no sign fix needed (unlike Problem 2, where the target had a minus sign).

---

## Problem 8: a 3-qubit product state, Bell pair on q0,q1 tensor $|-\rangle$ on q2

Target: $\dfrac{|00\rangle+|11\rangle}{\sqrt2}$ (qubits 0,1) $\otimes$ $\dfrac{|0\rangle-|1\rangle}{\sqrt2}$ (qubit 2).

Circuit:
```
q0: |0> --H--*-----------
             |
q1: |0> -----X-----------
q2: |0> --X-----H--------
```

**Step 1, structural observation.** q0,q1 and q2 never interact (no shared gate), so they can be prepared in parallel and traced independently, exactly the same reasoning as Problem 5's tensor composition.

**Step 2, qubits 0,1.** $H$ then controlled-NOT gives $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$, by Problem 1.

**Step 3, qubit 2.** $X$ then $H$ gives $\dfrac{|0\rangle-|1\rangle}{\sqrt2}$, by Problem 4.

**Final state, combining by tensor product.**

$$
\frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)_{01} \otimes \frac{|0\rangle-|1\rangle}{\sqrt2}\Big|_2,
$$

the target state. This illustrates that independent registers can be initialized by circuits that share no gates, and can be reasoned about (and drawn) as separate sub-circuits running in parallel.
