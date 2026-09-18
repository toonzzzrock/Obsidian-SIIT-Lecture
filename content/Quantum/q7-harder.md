<!-- #ruleok: gate acronyms P, T, S, H, X, CNOT, RY, SWAP are exact technical terms, not emphasis -->
# Question 7 (Harder): Non-Clifford Gates (State Initialization with Clifford and Non-Clifford Gates)
Source: Chapter 04, slides 6-8, 11-16; Chapter 03, slides 38-39

These problems go beyond the base Question 7 set: targets that need *both* a non-uniform amplitude and a relative phase at once, a genuine two-qubit controlled-phase primitive (not just a single-qubit non-Clifford gate riding on one entangled branch), multiple independent non-Clifford corrections combining on the same term, and a non-Clifford target reached only after a connectivity-forced swap network.

---

## Problem 1: a fully general single-qubit target, both amplitude weight and relative phase at once, $\cos(\pi/5)|0\rangle + \sin(\pi/5)\,e^{i\pi/6}|1\rangle$

Circuit:
```
q0: |0> --RY(2pi/5)--P(pi/6)--
```

**Step 1 (start).** $|0\rangle$.

**Step 2 (after $R_Y(2\pi/5)$).** Using the general rule $R_Y(\theta)|0\rangle = \cos(\theta/2)|0\rangle+\sin(\theta/2)|1\rangle$ with $\theta=2\pi/5$:

$$
\cos\!\left(\tfrac{\pi}{5}\right)|0\rangle + \sin\!\left(\tfrac{\pi}{5}\right)|1\rangle.
$$

**Step 3 (after $P(\pi/6)$).** $P(\lambda)=\mathrm{diag}(1,e^{i\lambda})$ multiplies only the $|1\rangle$ amplitude, leaving $|0\rangle$ untouched:

$$
\cos\!\left(\tfrac{\pi}{5}\right)|0\rangle + \sin\!\left(\tfrac{\pi}{5}\right)e^{i\pi/6}|1\rangle,
$$

the target state exactly.

**Why this is harder than any base-file single-qubit problem.** Every single-qubit problem in the base Question 7 file used *either* an $R_Y$ for the weight *or* a $P$/$T$ for the phase, never both together. This is the fully general point on the Bloch sphere: $R_Y$ fixes the polar angle $\theta$ (here $2\pi/5$, giving weight $\cos(\pi/5),\sin(\pi/5)$), and $P$ separately fixes the azimuthal angle $\phi$ (here $\pi/6$) — the two parameters are set by two independent gates, in that order, and neither alone reaches the target.

---

## Problem 2: a genuine two-qubit controlled-phase gate, $\dfrac{|00\rangle+|01\rangle+|10\rangle+e^{i\pi/4}|11\rangle}{2}$

Circuit:
```
q0: |0> --H--*----------
             |
q1: |0> --H--P(pi/4)----
```
(the controlled box denotes a controlled-phase gate: it multiplies the amplitude by $e^{i\pi/4}$ only on the term where *both* q0 and q1 are $|1\rangle$, and leaves every other term untouched — unlike a plain $P(\pi/4)$ or $T$ sitting on a single wire, which would touch every term where *that one* qubit is $|1\rangle$, regardless of the other qubit's value)

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $H$ on both q0 and q1).**

$$
\frac12\left(|00\rangle+|01\rangle+|10\rangle+|11\rangle\right).
$$

**Step 3 (after the controlled-phase gate).** Only the $|11\rangle$ term has both control and target equal to $1$, so only it picks up $e^{i\pi/4}$; the other three terms ($|00\rangle,|01\rangle,|10\rangle$) each have at least one qubit at $|0\rangle$ and are untouched.

$$
\frac12\left(|00\rangle+|01\rangle+|10\rangle+e^{i\pi/4}|11\rangle\right),
$$

the target state.

**Why a single-wire $T$ or $P$ cannot do this.** Placing a $T$ on q1 alone, for instance, would multiply *both* $|01\rangle$ and $|11\rangle$ by $e^{i\pi/4}$ (every term with q1$=1$), giving $\tfrac12\left(|00\rangle+e^{i\pi/4}|01\rangle+|10\rangle+e^{i\pi/4}|11\rangle\right)$, which is a different state entirely. Reaching a phase on *only* the joint $|11\rangle$ term requires the two-qubit controlled-phase primitive, contrasted directly with every base-file problem where a single-wire $T$ or $P$ was always enough because the entangling controlled-NOT had already collapsed the superposition down to exactly two terms.

---

## Problem 3: two independent non-Clifford corrections landing on the same joint term, $\dfrac{|000\rangle + i\,|111\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*-----*--------
             |     |
q1: |0> -----X-----|--T-----
                    |
q2: |0> ------------X--T----
```

**Step 1 (start).** $|000\rangle$.

**Step 2 (after $H$ on q0, then controlled-NOT q0$\to$q1, then controlled-NOT q0$\to$q2).** As in Problem 4 of the base Question 7 file, this builds the ordinary GHZ state:

$$
\frac{1}{\sqrt2}\left(|000\rangle+|111\rangle\right).
$$

**Step 3 (after $T$ on q1).** The $|111\rangle$ term has q1$=1$, so it picks up $e^{i\pi/4}$; $|000\rangle$ has q1$=0$ and is untouched.

$$
\frac{1}{\sqrt2}\left(|000\rangle+e^{i\pi/4}|111\rangle\right).
$$

**Step 4 (after $T$ on q2).** The $|111\rangle$ term (now carrying $e^{i\pi/4}/\sqrt2$) has q2$=1$ too, so it picks up a *second* factor of $e^{i\pi/4}$; $|000\rangle$ is again untouched, since it has q2$=0$.

$$
e^{i\pi/4}\cdot e^{i\pi/4} = e^{i\pi/2} = i, \qquad\Rightarrow\qquad \frac{1}{\sqrt2}\left(|000\rangle + i\,|111\rangle\right),
$$

the target state.

**Why this is harder.** Two separate $T$ gates, on two separate qubits, both land their phase on the *same* joint term $|111\rangle$ because both of those qubits happen to be $1$ only in that term. The angles add ($\pi/4+\pi/4=\pi/2$), exactly as in Problem 8 of the base file, but here the two contributions come from two different physical qubits rather than two gates in sequence on one qubit, so it is easy to mistakenly place a $T$ where it would also touch the $|000\rangle$ branch (e.g. a $T$ on a qubit that is $0$ in one term and $1$ in the other only for terms other than $|111\rangle$) and get the wrong state; here the check that both target qubits are $1$ *only* in the $|111\rangle$ term is essential.

---

## Problem 4: non-uniform entanglement weight *and* a relative phase together, $\cos(\pi/6)|00\rangle + \sin(\pi/6)\,e^{i\pi/3}|11\rangle$

Circuit:
```
q0: |0> --RY(pi/3)--*----------
                     |
q1: |0> -------------X--P(pi/3)--
```

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $R_Y(\pi/3)$ on q0).** $\cos(\pi/6)|0\rangle+\sin(\pi/6)|1\rangle$ on q0, tensor $|0\rangle$ on q1:

$$
\cos\!\left(\tfrac{\pi}{6}\right)|00\rangle + \sin\!\left(\tfrac{\pi}{6}\right)|10\rangle.
$$

**Step 3 (after controlled-NOT, control q0, target q1).** The $|10\rangle$ term has control $1$, so q1 flips: $\sin(\pi/6)|11\rangle$; the $|00\rangle$ term has control $0$ and is untouched.

$$
\cos\!\left(\tfrac{\pi}{6}\right)|00\rangle + \sin\!\left(\tfrac{\pi}{6}\right)|11\rangle.
$$

**Step 4 (after $P(\pi/3)$ on q1).** Only the $|11\rangle$ term has q1$=1$, so it alone picks up $e^{i\pi/3}$; the $|00\rangle$ term has q1$=0$ and is untouched.

$$
\cos\!\left(\tfrac{\pi}{6}\right)|00\rangle + \sin\!\left(\tfrac{\pi}{6}\right)e^{i\pi/3}|11\rangle,
$$

the target state exactly.

**Why this is harder than Problem 6 of the base file.** The base file's non-maximally-entangled example only fixed the *weight* ratio between the two terms with a single $R_Y$; here the *phase* of the second term must independently be fixed to $e^{i\pi/3}$ as well, requiring a third gate ($P$) placed *after* the entangling controlled-NOT so that it lands only on the branch that needs the phase, combining the techniques of Problems 1 and 6 of the base file into one circuit.

---

## Problem 5: connectivity-constrained non-Clifford state, $\dfrac{|000\rangle + e^{i\pi/4}|101\rangle}{\sqrt2}$, entangling non-adjacent qubits q0 and q2 with only nearest-neighbor gates available

Hardware constraint: 2-qubit gates only between adjacent wires $(q0,q1)$ and $(q1,q2)$.

Circuit:
```
q0: |0> --H--*--x-----------
             |  |
q1: |0> -----X--x-----------
                             
q2: |0> --------------T-----
```
(read carefully: the `x--x` denotes swap between q1 and q2, drawn as occupying q1's column and reaching across to q2)

**Step 1 (start).** $|000\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|000\rangle+|100\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1 — an allowed adjacent gate).** $\dfrac{1}{\sqrt2}\left(|000\rangle+|110\rangle\right)$, an ordinary Bell pair sitting on the adjacent pair q0,q1.

**Step 4 (after swap between q1 and q2 — also an allowed adjacent gate).** Swap exchanges the values on wires q1,q2 in every term: $|000\rangle$ unaffected; $|110\rangle$ becomes $|101\rangle$ ($q1{=}1,q2{=}0\to q1{=}0,q2{=}1$).

$$
\frac{1}{\sqrt2}\left(|000\rangle+|101\rangle\right),
$$

the entangling partner of q0 has now been physically relocated from q1 onto q2, with q1 back at $|0\rangle$.

**Step 5 (after $T$ on q2).** The $|101\rangle$ term has q2$=1$, so it picks up $e^{i\pi/4}$; $|000\rangle$ has q2$=0$ and is untouched.

$$
\frac{1}{\sqrt2}\left(|000\rangle+e^{i\pi/4}|101\rangle\right),
$$

the target state, with q0 and q2 entangled (carrying the non-Clifford phase) and q1 disentangled at $|0\rangle$.

**Why this is harder.** This combines the swap-network routing technique of Problem 3 in the harder Question 5 file with a non-Clifford phase correction, and the correction must be applied after the swap has finished relocating the entanglement. Applying the $T$ to q2 before the swap would do nothing, since q2 is still $|0\rangle$ in both terms at that point. Applying it to q1 after the swap would also do nothing, since q1 has already been vacated back to $|0\rangle$ in both terms. The order of routing versus phase correction matters here in a way no base-file problem tested.

---

## Problem 6: phase kickback, target: $\dfrac{|0\rangle+e^{i\pi/4}|1\rangle}{\sqrt2}\Big|_0 \otimes |1\rangle_1$, built by kicking a non-Clifford phase from the target qubit back onto the control

**Notation reminder.** A subscript like $|\chi\rangle_x$ or $(\cdots)\big|_x$ just labels which physical qubit that factor belongs to; it carries no extra meaning beyond "this piece of the tensor product lives on qubit $x$." It only becomes necessary to write once a multi-qubit state has been split into separate factors, since at that point you need a way to say which wire each factor is describing.

Circuit:
```
q0: |0> --H--*----------
             |
q1: |0> --X--P(pi/4)----
```

**What phase kickback is, in plain terms.** Normally, a gate applied to qubit A, controlled by qubit B, is expected to change qubit A and leave qubit B alone. Phase kickback is the surprising opposite: qubit A (the target) does not change at all, and qubit B (the control) is the one that picks up a phase. This happens precisely when the target is already sitting in an eigenstate of the gate being controlled.

**Why an eigenstate causes this.** A state $|\chi\rangle$ is an eigenstate of a gate $U$ if $U|\chi\rangle = e^{i\theta}|\chi\rangle$: applying $U$ does not move $|\chi\rangle$ to a different state at all, it can only multiply it by the number $e^{i\theta}$. For $P(\lambda)=\mathrm{diag}(1,e^{i\lambda})$, the state $|1\rangle$ is exactly such an eigenstate, since $P(\lambda)|1\rangle = e^{i\lambda}|1\rangle$ by direct inspection of the matrix (the $|1\rangle$ row of $P(\lambda)$ is just $e^{i\lambda}$).

Now consider a controlled-$P(\lambda)$ gate acting on $|+\rangle_0\otimes|1\rangle_1$, with q0 as control and q1 (already prepared in the eigenstate $|1\rangle$) as target:

- on the branch where q0$=0$, the control is off, so the gate does not fire at all, and q1 stays $|1\rangle$;
- on the branch where q0$=1$, the control is on, so the gate fires on q1. But q1 is $|1\rangle$, an eigenstate of $P(\lambda)$, so the gate cannot send it anywhere else. All it can do is multiply that entire branch by the eigenvalue $e^{i\lambda}$.

So the net effect of the whole gate is: the "q0$=1$" branch gets multiplied by $e^{i\lambda}$, and the "q0$=0$" branch does not. That is exactly what applying $P(\lambda)$ directly *to q0* would look like. The phase that conceptually belongs to the target, because it came from the target's eigenvalue, ends up stamped onto the control instead, since the target itself had nowhere else to go. This is phase kickback, and it is the core mechanism behind quantum phase estimation and the oracle construction used in Grover's algorithm.

**Step 1 (start).** $|00\rangle$.

**Step 2 (after $X$ on q1).** $|01\rangle$, q1 now holds the eigenstate $|1\rangle$.

**Step 3 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00\rangle+|10\rangle\right)$ on q0, tensor $|1\rangle$ on q1 throughout:

$$
\frac{1}{\sqrt2}\left(|01\rangle+|11\rangle\right).
$$

**Step 4 (after controlled-$P(\pi/4)$, control q0, target q1).** The $|01\rangle$ term has control (q0) $=0$, so the controlled gate is off and it is untouched. The $|11\rangle$ term has control $=1$, so the gate fires: it multiplies the amplitude by $e^{i\pi/4}$, the eigenvalue picked up by target q1$=|1\rangle$, while q1 itself stays exactly $|1\rangle$, unchanged.

$$
\frac{1}{\sqrt2}\left(|01\rangle + e^{i\pi/4}|11\rangle\right).
$$

**Step 5, factor out q1.** Every term still has q1$=|1\rangle$, so the state has not become entangled at all. It factors back apart:

$$
\frac{1}{\sqrt2}\left(|01\rangle + e^{i\pi/4}|11\rangle\right) = \left(\frac{|0\rangle+e^{i\pi/4}|1\rangle}{\sqrt2}\right)_0 \otimes |1\rangle_1,
$$

the target state.

**Why this is different from every other problem in this file.** In Problems 1 through 5, the non-Clifford gate always sits directly on the qubit whose amplitude is being changed. Here the $P(\pi/4)$ gate is physically applied to q1, yet q1 ends the circuit completely unchanged at $|1\rangle$; it is q0, the control, that ends up carrying the non-Clifford phase, purely because the target happened to already be an eigenstate of the gate being controlled. Contrast this directly with Problem 2 of this file, where the controlled-phase gate genuinely entangles the two qubits because neither input qubit was prepared as an eigenstate of the phase gate beforehand. Kickback only produces this clean, unentangled result because the target was deliberately set to an eigenstate first.
