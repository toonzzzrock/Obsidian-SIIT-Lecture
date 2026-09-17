<!-- #ruleok: gate acronyms X, Y, Z, H, S, CNOT are exact technical terms, not emphasis -->
# Question 6: Clifford Gates (Step-by-Step Tracing of Quantum States)
Source: Chapter 03, slides 3, 7-12, 28, 30-34, 38-39, 43-44

Task type for every problem below: you are given a circuit diagram, and you must find the quantum state after every single gate, one step at a time, ending at the final state.

---

## Problem 1
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

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right).
$$

---

## Problem 2
Circuit:
```
q0: |0> --H--Z--*--
                |
q1: |0> --------X--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 3 (after $Z$ on q0).** $Z$ multiplies the amplitude by $-1$ whenever q0 is $|1\rangle$; the $|10\rangle$ term picks up $-1$, the $|00\rangle$ term is untouched.

$$
\frac{1}{\sqrt2}\left(|00\rangle-|10\rangle\right).
$$

**Step 4 (after controlled-NOT, control q0, target q1).** The $|10\rangle$ term (carrying coefficient $-1/\sqrt2$) has control $1$, so its target flips: $-|11\rangle$; the $|00\rangle$ term is untouched.

$$
\frac{1}{\sqrt2}\left(|00\rangle-|11\rangle\right).
$$

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle-|11\rangle\right).
$$

---

## Problem 3
Circuit:
```
q0: |0> --H--S--*--
                |
q1: |0> --------X--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 3 (after $S$ on q0).** $S = \mathrm{diag}(1,i)$ multiplies the amplitude by $i$ whenever q0 is $|1\rangle$; the $|10\rangle$ term picks up $i$, the $|00\rangle$ term is untouched.

$$
\frac{1}{\sqrt2}\left(|00\rangle+i|10\rangle\right).
$$

**Step 4 (after controlled-NOT, control q0, target q1).** The $|10\rangle$ term (coefficient $i/\sqrt2$) has control $1$, so its target flips: $i|11\rangle$; the $|00\rangle$ term is untouched.

$$
\frac{1}{\sqrt2}\left(|00\rangle+i|11\rangle\right).
$$

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle+i|11\rangle\right).
$$

This shows a relative phase picked up before entangling survives inside the entangled state.

---

## Problem 4
Circuit:
```
q0: |0> -----H--*--x--
                 |  |
q1: |0> --X------Z--x--
```
(here the `x--x` column denotes swap between q0 and q1, and the `*--Z` column is controlled-Z between q0 and q1)

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $X$ on q1).** $|01\rangle$.

**Step 3 (after $H$ on q0).** q0 goes from $|0\rangle$ to $\dfrac{|0\rangle+|1\rangle}{\sqrt2}$, q1 stays $|1\rangle$.

$$
\frac{1}{\sqrt2}\left(|01\rangle+|11\rangle\right).
$$

**Step 4 (after $CZ$, between q0 and q1).** $CZ$ multiplies the amplitude by $-1$ only when both qubits are $|1\rangle$; the $|11\rangle$ term qualifies and picks up $-1$, the $|01\rangle$ term (q0 $=0$) is untouched.

$$
\frac{1}{\sqrt2}\left(|01\rangle-|11\rangle\right).
$$

**Step 5 (after swap on q0,q1).** Swap exchanges the two digits in each term: $|01\rangle\to|10\rangle$, $|11\rangle\to|11\rangle$ (symmetric, unchanged).

$$
\frac{1}{\sqrt2}\left(|10\rangle-|11\rangle\right) = \frac{1}{\sqrt2}|1\rangle \otimes \left(|0\rangle-|1\rangle\right),
$$

an unentangled product state.

**Final state.**

$$
\frac{1}{\sqrt2}\left(|10\rangle-|11\rangle\right) = |1\rangle \otimes |-\rangle.
$$

---

## Problem 5
Circuit:
```
q0: |0> --H--*--------
             |
q1: |0> -----X--*-----
                |
q2: |0> --------X-----
```

**Step 1 (start).** $|000\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|000\rangle+|100\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1).** The $|100\rangle$ term has control (q0) equal to $1$, so q1 flips: $\dfrac{1}{\sqrt2}\left(|000\rangle+|110\rangle\right)$.

**Step 4 (after controlled-NOT, control q1, target q2).** The $|110\rangle$ term now has control (q1) equal to $1$, so q2 flips: $\dfrac{1}{\sqrt2}\left(|000\rangle+|111\rangle\right)$. The $|000\rangle$ term has $q1=0$, untouched.

**Final state.**

$$
\frac{1}{\sqrt2}\left(|000\rangle+|111\rangle\right),
$$

the GHZ state, built here by a chain of controlled-NOT gates (q0 controls q1, q1 controls q2) rather than fanning out directly from q0.

---

## Problem 6
Circuit:
```
q0: |0> --H--*-----
             |
q1: |0> -----X--Z--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right)$.

**Step 4 (after $Z$ on q1).** $Z$ multiplies the amplitude by $-1$ whenever q1 is $|1\rangle$; the $|11\rangle$ term picks up $-1$, $|00\rangle$ is untouched.

$$
\frac{1}{\sqrt2}\left(|00\rangle-|11\rangle\right).
$$

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle-|11\rangle\right).
$$

**Comparison to Problem 2.** Both circuits ($Z$ on q0 before entangling, versus $Z$ on q1 after entangling) reach the exact same final state, because after the controlled-NOT the only term with a $|1\rangle$ on either wire is $|11\rangle$, so a $Z$ on either wire lands on the same term.

---

## Problem 7
Circuit:
```
q0: |0> --H--S--S--
```

**Step 1 (start).** $|0\rangle$.

**Step 2 (after $H$).** $\dfrac{1}{\sqrt2}\left(|0\rangle+|1\rangle\right)$.

**Step 3 (after first $S$).** $S$ multiplies the $|1\rangle$ amplitude by $i$.

$$
\frac{1}{\sqrt2}\left(|0\rangle+i|1\rangle\right).
$$

**Step 4 (after second $S$).** $S$ multiplies the $|1\rangle$ amplitude by $i$ again: $i \cdot i = -1$.

$$
\frac{1}{\sqrt2}\left(|0\rangle-|1\rangle\right).
$$

**Final state.**

$$
\frac{1}{\sqrt2}\left(|0\rangle-|1\rangle\right) = |-\rangle.
$$

This confirms $S$ applied twice equals $Z$ (i.e. $SS=Z$, since $Z|+\rangle = |-\rangle$ directly), but only becomes visible once the qubit already has a nonzero $|1\rangle$ amplitude to act on. Applying $SS$ to a bare $|0\rangle$ would leave it at $|0\rangle$ with no visible effect at all, since $S$ never touches the $|0\rangle$ amplitude.

---

## Problem 8
Circuit:
```
q0: |0> --*--H--*--
          |     |
q1: |0> --X-----X--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after first controlled-NOT, control q0, target q1).** Control q0 is $|0\rangle$, so nothing changes.

$$
|00\rangle.
$$

**Step 3 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$.

**Step 4 (after second controlled-NOT, control q0, target q1).** The $|10\rangle$ term has control $1$, so q1 flips:

$$
\frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right).
$$

**Final state.**

$$
\frac{1}{\sqrt2}\left(|00\rangle+|11\rangle\right).
$$

**Lesson.** The first controlled-NOT in this circuit was a no-op (its control qubit was still $|0\rangle$ at that point in the trace), so only the last two gates actually determined the outcome. Always check the control's actual value at each step rather than assuming a gate has an effect just because it is drawn on the circuit.
