<!-- #ruleok: gate acronyms X, Y, Z, H, S, CNOT, CZ, SWAP, GHZ are exact technical terms, not emphasis -->
# Question 5 (Harder): Quantum Algorithms (State Initialization with Clifford Gates)
Source: Chapter 03, slides 3, 7-12, 28, 30-34, 38-39, 43-44

These problems go beyond the base Question 5 set: graph states built from many overlapping $CZ$ gates, longer phase-bookkeeping chains on more qubits, and circuits constrained to nearest-neighbor connectivity, forcing a genuine swap network instead of a direct controlled-NOT.

---

## Problem 1: the 3-qubit triangle graph state (every pair connected by $CZ$)

Target: apply $H$ to all three qubits, then a $CZ$ between every pair $(0,1)$, $(1,2)$, $(0,2)$ — a complete graph on 3 vertices.

Circuit:
```
q0: |0> --H--*-----*-----
             |     |
q1: |0> --H--Z--*--|-----
                |  |
q2: |0> --H-----Z--Z-----
```

**Step 1, why term-by-term tracing does not scale here.** With three overlapping $CZ$ gates touching all $2^3=8$ basis terms, listing each term's fate one $CZ$ at a time (as in Question 6) is slow and error-prone. Instead use the standard graph-state shortcut: after $H^{\otimes3}$ the state is an equal-weight sum over all bit strings, and each $CZ(i,j)$ multiplies the amplitude of a term by $-1$ exactly when both bits $x_i,x_j$ are $1$ — so its net effect is just to add $x_ix_j$ to a running exponent.

**Step 2, after $H^{\otimes3}$.**

$$
\frac{1}{2\sqrt2}\sum_{x_1,x_2,x_3\in\{0,1\}}|x_1x_2x_3\rangle.
$$

**Step 3, accumulate the phase exponent from all three $CZ$ gates.** $CZ(0,1)$ contributes $x_1x_2$, $CZ(1,2)$ contributes $x_2x_3$, $CZ(0,2)$ contributes $x_1x_3$ (using 1-indexed bit labels matching the qubit order $q0,q1,q2\to x_1,x_2,x_3$):

$$
|\psi\rangle = \frac{1}{2\sqrt2}\sum_{x_1,x_2,x_3} (-1)^{x_1x_2+x_2x_3+x_1x_3}\,|x_1x_2x_3\rangle.
$$

**Step 4, evaluate the sign on each of the 8 terms.**

$$
\begin{array}{c|c|c}
x_1x_2x_3 & x_1x_2+x_2x_3+x_1x_3 & \text{sign}\\\hline
000 & 0 & +\\
001 & 0 & +\\
010 & 0 & +\\
100 & 0 & +\\
011 & 0+1+0=1 & -\\
101 & 0+0+1=1 & -\\
110 & 1+0+0=1 & -\\
111 & 1+1+1=3 & -
\end{array}
$$

**Final state.**

$$
\frac{1}{2\sqrt2}\left(|000\rangle+|001\rangle+|010\rangle+|100\rangle-|011\rangle-|101\rangle-|110\rangle-|111\rangle\right).
$$

**Why this is harder than any base-file problem.** Every one of the 8 basis terms is now populated with an independently determined sign fixed by *three* overlapping two-qubit gates acting on the same three wires, rather than a single controlled-NOT chain that only ever touches two terms at a time.

---

## Problem 2: a 5-qubit GHZ state with a combined non-trivial global phase, $\dfrac{|00000\rangle - i\,|11111\rangle}{\sqrt2}$

Circuit:
```
q0: |0> --H--*--*--*--*----------
             |  |  |  |
q1: |0> -----X--|--|--|--Z-------
                |  |  |
q2: |0> --------X--|--|----------
                   |  |
q3: |0> -----------X--|----------
                      |
q4: |0> --------------X--S-------
```

**Step 1 (start).** $|00000\rangle$.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|00000\rangle+|10000\rangle\right)$.

**Step 3 (after controlled-NOT from q0 to each of q1, q2, q3, q4 in turn).** Every one of the four controlled-NOTs has control q0, which is still $|1\rangle$ on the second term at the moment each fires, so each flips its target in turn:

$$
\frac{1}{\sqrt2}\left(|00000\rangle+|11111\rangle\right),
$$

the 5-qubit GHZ state.

**Step 4 (after $S$ on q4).** $S=\mathrm{diag}(1,i)$ multiplies the amplitude by $i$ whenever q4 is $|1\rangle$; the $|11111\rangle$ term has q4$=1$ and picks up $i$, while $|00000\rangle$ is untouched.

$$
\frac{1}{\sqrt2}\left(|00000\rangle + i\,|11111\rangle\right).
$$

**Step 5 (after $Z$ on q1).** $Z$ multiplies the amplitude by $-1$ whenever q1 is $|1\rangle$; the $|11111\rangle$ term (carrying coefficient $i/\sqrt2$) has q1$=1$, so its coefficient becomes $i\cdot(-1) = -i$, while $|00000\rangle$ is untouched.

$$
\frac{1}{\sqrt2}\left(|00000\rangle - i\,|11111\rangle\right),
$$

the target state.

**Why this is harder.** Reaching a target relative phase of $-i$ requires *combining* two different single-qubit Clifford phase corrections ($S$ contributing $i$, $Z$ contributing $-1$) applied on two different qubits, both of which only act on the shared $|11111\rangle$ branch. Careless bookkeeping (applying them in the wrong place, or on the $|00000\rangle$ branch by mistake) silently produces the wrong global phase, whereas every base-file GHZ problem only ever needed a single phase correction.

---

## Problem 3: nearest-neighbor connectivity, Bell pair on non-adjacent qubits q0 and q3 via a swap network

Hardware constraint: 2-qubit gates are only physically available between adjacent wires, $(q0,q1)$, $(q1,q2)$, $(q2,q3)$. Target: $\dfrac{|0000\rangle+|1001\rangle}{\sqrt2}$, i.e. q0 and q3 entangled as a Bell pair, q1 and q2 left at $|0\rangle$.

Circuit:
```
q0: |0> --H--*--------------
             |
q1: |0> -----X--x-----------
                |
q2: |0> --------x--x--------
                   |
q3: |0> --------------x-----
```
(the `x--x` columns denote swap; the second swap is between q2 and q3)

**Step 1, why controlled-NOT(q0,q3) directly is not available.** The problem restricts 2-qubit gates to adjacent pairs, so entanglement must first be created locally, then physically *moved* along the register using swap gates, exactly the technique used for connectivity-limited hardware.

**Step 2 (after $H$ on q0).** $\dfrac{1}{\sqrt2}\left(|0000\rangle+|1000\rangle\right)$.

**Step 3 (after controlled-NOT, control q0, target q1).** $\dfrac{1}{\sqrt2}\left(|0000\rangle+|1100\rangle\right)$, an ordinary adjacent Bell pair on q0,q1.

**Step 4 (after swap between q1 and q2).** Swap exchanges the values sitting on wires $q1,q2$ in every term: $|0000\rangle$ is unaffected ($0,0\to0,0$); $|1100\rangle$ becomes $|1010\rangle$ ($q1{=}1,q2{=}0 \to q1{=}0,q2{=}1$).

$$
\frac{1}{\sqrt2}\left(|0000\rangle+|1010\rangle\right).
$$

**Step 5 (after swap between q2 and q3).** $|0000\rangle$ unaffected; $|1010\rangle$ becomes $|1001\rangle$ ($q2{=}1,q3{=}0\to q2{=}0,q3{=}1$).

$$
\frac{1}{\sqrt2}\left(|0000\rangle+|1001\rangle\right),
$$

the target state: q0 and q3 hold the Bell correlation, q1 and q2 are back to $|0\rangle$, disentangled.

**Why this is harder.** Every base-file problem allowed any wire to interact with any other wire directly; here the connectivity constraint forces two extra swap gates purely to *relocate* an entangled partner across the register, a genuinely different (and more error-prone) kind of circuit design than picking the right gate sequence on a fully-connected register.

---

## Problem 4: merging two independent Bell pairs into one 4-term entangled cluster with a single connecting $CZ$

Target: starting from two ordinary Bell pairs, $(q0,q1)$ and $(q2,q3)$, apply one $CZ$ between $q1$ and $q2$ to link them.

Circuit:
```
q0: |0> --H--*-----------
             |
q1: |0> -----X--*--------
                |
q2: |0> --H-----Z--------
                   
q3: |0> -----------*-----
                    |
(continued)  q2 --Z--(already shown above), q3 unused by CZ, paired via its own CNOT below
```

To keep the diagram unambiguous, draw it as two clearly separated stages:

```
Stage A (build the two Bell pairs):
q0: |0> --H--*--------
             |
q1: |0> -----X--------
q2: |0> --H--------*--
                    |
q3: |0> ------------X--

Stage B (connect them):
q1: ----*--
        |
q2: ----Z--
```

**Step 1 (after Stage A).** Each pair independently becomes a Bell state, by Problem 1 of the base Question 5 file:

$$
\frac{1}{2}\left(|00\rangle+|11\rangle\right)_{01} \otimes \left(|00\rangle+|11\rangle\right)_{23} = \frac12\big(|0000\rangle+|0011\rangle+|1100\rangle+|1111\rangle\big).
$$

**Step 2, apply $CZ$ between q1 and q2 to every one of the 4 terms.** $CZ$ multiplies a term's amplitude by $-1$ exactly when both q1 and q2 are $1$ in that term; read off $(x_1,x_2)$ for each term:

$$
\begin{array}{c|c|c}
\text{term} & (x_1,x_2) & \text{sign}\\\hline
|0000\rangle & (0,0) & +\\
|0011\rangle & (0,1) & +\\
|1100\rangle & (1,0) & +\\
|1111\rangle & (1,1) & -
\end{array}
$$

**Final state.**

$$
\frac12\left(|0000\rangle+|0011\rangle+|1100\rangle-|1111\rangle\right).
$$

**Why this is harder.** This is a genuine 4-term entangled state on 4 qubits (not reducible to a tensor product of two 2-term Bell pairs any more, since the connecting $CZ$ correlates all four qubits together), yet it is built by composing two small, independently-verifiable circuits (Stage A, checked against Problem 5 of the base file) with one extra linking gate — the harder skill is tracking how a single additional gate changes *all four* amplitudes of an already-entangled multi-qubit state at once, rather than building the state gate-by-gate from scratch.
