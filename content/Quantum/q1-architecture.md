# Question 1: Quantum Computing and Its Computing Architecture
Source: Chapter 00, slides 7-32

## Why questions (Q&A)

### Q1. Why does classical transistor scaling (Moore's law) fail to keep delivering exponential speedup, and why is this used to motivate quantum computing?

**Step 1, the physical wall.** Transistor density scaling runs into physical limits around the few-nanometer node: quantum tunneling through gate oxides, heat dissipation per unit area, and lithography cost all stop improving at the historical exponential rate.

**Step 2, the mismatch with problem difficulty.** Classical compute-per-dollar growth is flattening, even as some problems (factoring, quantum chemistry simulation, unstructured search) have classical cost that itself grows exponentially in the problem size $n$.

**Step 3, where the quantum resource comes from instead.** Quantum architectures do not rely on packing more transistors. They get their exponential resource, the $2^n$-dimensional state space of $n$ qubits, from adding qubits linearly:

$$
n \text{ qubits} \;\longrightarrow\; \dim(\text{state space}) = 2^n.
$$

So the motivation is structural (a different scaling law entirely), not a continuation of fabrication trends.

---

### Q2. Why is a quantum algorithm staged as preparation, then computation, then measurement, and why must measurement come last?

**Step 1, which stages are reversible.** Only preparation and computation are unitary and reversible. Measurement is a projective, non-unitary operation that collapses superposition and destroys the phase relationships between amplitudes.

**Step 2, why phase relationships must survive.** Interference, the mechanism that produces a speedup, needs those phase relationships to survive across the whole computation. Measuring early would throw away exactly the information later gates need in order to interfere constructively toward the correct answer.

**Step 3, why the non-reversible step is deferred.** The non-reversible step is deferred to the end. (Mid-circuit measurement is used only in specific protocols, such as error-correction syndrome extraction, where the measured qubit is not carrying the answer, so collapsing it early costs nothing.)

---

### Q3. Why does superposition alone not give a computational advantage without interference?

**Step 1, what a bare superposition gives you.** A uniform superposition over $2^n$ basis states, if measured immediately, returns one uniformly random $n$-bit string, no better than a classical random guess.

**Step 2, where the advantage comes from.** The advantage comes from the gate sequence shaping the amplitudes so that:
- paths leading to wrong answers cancel (destructive interference), and
- paths leading to the correct answer reinforce (constructive interference),

before the final measurement.

**Conclusion.** Superposition supplies the many parallel amplitudes; interference is what turns them into a biased, useful probability distribution.

---

### Q4. Why does measurement collapse a superposition, and why is this irreversible while unitary computation is reversible?

**Step 1, the algebraic reason measurement has no inverse.** A projective measurement operator is a rank-reducing projection onto an eigenspace of the observable. Many distinct input states can map to the same post-measurement outcome, so the map has no inverse.

**Step 2, why a unitary gate is different.** A unitary gate $U$ satisfies $U^{-1} = U^{\dagger}$, so every unitary step can be undone exactly and no information about the input is lost.

**Conclusion.** Measurement is the one place in the pipeline where information is discarded (turned into a single classical outcome) rather than merely transformed.

---

### Q5. Why is a quantum computer not just a faster classical computer? Which architectural phenomenon does each pipeline stage rely on?

**Preparation** typically uses superposition, and often entanglement (via multi-qubit gates such as a controlled-NOT), to spread the state across many basis components at once.

**Computation** uses unitary gates to steer relative phases, maintaining superposition while building up interference patterns.

**Measurement** is where interference becomes observable, as a skewed probability distribution over outcomes rather than a single definite classical value.

**Conclusion.** None of these three ingredients (superposition, entanglement, interference) has a classical analogue that scales the same way, so raw clock speed is not the relevant point of comparison.

---

### Q6. Why do real quantum devices need error correction while the idealized circuit model in the slides does not mention it?

**Step 1, the physical source of error.** Physical qubits decohere (lose their quantum state to the environment) on a timescale set by $T_1/T_2$, and each physical gate has a nonzero error rate (commonly $10^{-3}$ to $10^{-2}$ for current hardware).

**Step 2, the consequence for circuit depth.** Without correction, circuit depth is bounded by how many gates can run before accumulated error makes the output useless.

**Step 3, what error correction buys back.** Quantum error correction encodes one logical qubit across many physical qubits, so that errors can be detected and corrected without collapsing the encoded information.

**Why the idealized model skips this.** The idealized circuit model in an introductory chapter assumes perfect gates and infinite coherence time, so this overhead layer is out of scope there.

---

### Q7. Why is quantum parallelism fundamentally different from multi-core classical parallelism?

**Step 1, the classical picture.** A multi-core machine runs $N$ independent registers, each holding its own classical value, and produces $N$ separate outputs at once. The resource cost scales linearly with $N$.

**Step 2, the quantum picture.** A superposition over $2^n$ basis states is a single register in one exponentially large joint state. There are not $2^n$ separate physical copies computing independently, and a measurement yields exactly one sample, not $2^n$ answers.

**Conclusion.** Extracting a useful global property (not just one random sample) requires the interference-based algorithm design described in Why Q3, not just having many amplitude terms present at once.

---

## Math questions (Q&A)

### Q1. How many real parameters describe a general (normalized, up to global phase) state of $n=3$ qubits, versus a classical probability distribution over 3 bits?

**Step 1, count the raw complex parameters.** A 3-qubit state vector lives in $\mathbb{C}^8$, so it has 8 complex amplitudes, which is 16 real numbers.

**Step 2, subtract the physical constraints.**
- Normalization ($\sum_i |c_i|^2 = 1$) removes one real degree of freedom.
- Global phase is physically unobservable (Question 2, Why Q4), removing one more.

$$
16 - 1 - 1 = 14 \text{ real parameters}.
$$

**Step 3, the classical comparison.** A classical distribution over $2^3=8$ outcomes has 8 probabilities constrained to sum to 1:

$$
8 - 1 = 7 \text{ real parameters}.
$$

**Conclusion.** The quantum state carries roughly twice as many free real parameters as the classical distribution over the same number of basis labels ($14$ versus $7$).

---

### Q2. For $n=10$ qubits, compare the number of gates needed to prepare an equal superposition of all basis states with the number of classical function evaluations needed to check every input.

**Step 1, the quantum preparation cost.** Preparing $|+\rangle^{\otimes 10}$ from $|0\ldots0\rangle$ takes exactly 10 Hadamard gates, one per qubit, since $H|0\rangle = |+\rangle$ and the qubits are independent at that point.

**Step 2, the classical enumeration cost.** A classical algorithm that needs to inspect $f(x)$ for every $x \in \{0,1\}^{10}$ needs

$$
2^{10} = 1024 \text{ evaluations}.
$$

**Step 3, the gap.** The gate count for preparation grows linearly (10), while the classical exploration cost grows exponentially (1024).

**Caveat.** This gap is why preparation is cheap. It says nothing yet about the cost of extracting a useful answer, which depends on the interference structure of the rest of the circuit (Why Q3 above).

---

### Q3. Trace the three-stage pipeline for a 2-qubit circuit that starts at $|00\rangle$, applies $H$ to qubit 1, applies a controlled-NOT (control qubit 1, target qubit 2), and then measures both qubits. Give the state after each stage and the measurement probabilities.

**Preparation.** Start at $|00\rangle = (1,0,0,0)$ in the ordered basis $\{|00\rangle,|01\rangle,|10\rangle,|11\rangle\}$.

**Computation, step 1 ($H$ on qubit 1).**

$$
\frac{1}{\sqrt2}\left(|00\rangle + |10\rangle\right) = (0.7071,\,0,\,0.7071,\,0).
$$

**Computation, step 2 (controlled-NOT, control 1, target 2).** The $|10\rangle$ term has control $=1$, so its target flips:

$$
\frac{1}{\sqrt2}\left(|00\rangle + |11\rangle\right) = (0.7071,\,0,\,0,\,0.7071),
$$

the Bell state.

**Measurement.**

$$
P(00) = |0.7071|^2 = 0.5, \qquad P(11) = |0.7071|^2 = 0.5, \qquad P(01) = P(10) = 0.
$$

Only $00$ or $11$ can ever be observed, each with probability one half.

---

### Q4. A qubit is prepared in $|+\rangle = \dfrac{|0\rangle+|1\rangle}{\sqrt2}$ and measured in the computational basis. Compute the Shannon entropy of the outcome distribution before and after the measurement, and interpret the drop.

**Step 1, entropy before measurement.** The outcome distribution is $P(0)=P(1)=1/2$, so

$$
H = -\tfrac12\log_2\tfrac12 - \tfrac12\log_2\tfrac12 = 1 \text{ bit},
$$

the uncertainty about the eventual classical outcome.

**Step 2, entropy after measurement.** A single measurement produces a definite classical bit (say $0$), so the post-measurement entropy about that already-obtained outcome is

$$
H_{\text{after}} = 0 \text{ bits}.
$$

**Interpretation.** The 1 bit of uncertainty was resolved by the measurement, and the qubit's superposition (which carried more than 1 bit of continuous amplitude/phase information before collapse) is gone; only the 1 classical bit survives.

---

### Q5. Compare classical linear search and Grover's quantum search for an unsorted list of $N=16$ items with one marked item: give the expected number of classical queries and the number of Grover iterations.

**Step 1, classical cost.** Classical unstructured search needs, on average,

$$
\frac{N}{2} = \frac{16}{2} = 8 \text{ queries}
$$

(worst case $N=16$).

**Step 2, Grover's cost.** Grover's algorithm needs approximately

$$
\frac{\pi}{4}\sqrt{N} = \frac{\pi}{4}\sqrt{16} = \frac{\pi}{4}\cdot 4 = \pi \approx 3.14,
$$

so 3 iterations in practice.

**Conclusion.** This is a quadratic reduction (8 versus about 3), a different and smaller gap than the linear-versus-exponential comparison in Math Q2, which was for full enumeration rather than search for one marked item.

---

### Q6. (Chapter 00 slide 9's worked example, reproduced.) Convert the decimal integer 30 to its 5-bit binary representation using the slide's method of repeatedly subtracting the closest power of 2.

**Step 1.** Closest power of 2 not exceeding 30 is $2^4=16$: $30-16=14$, digit at $2^4$ is $1$.

**Step 2.** Closest power not exceeding 14 is $2^3=8$: $14-8=6$, digit at $2^3$ is $1$.

**Step 3.** Closest power not exceeding 6 is $2^2=4$: $6-4=2$, digit at $2^2$ is $1$.

**Step 4.** Closest power not exceeding 2 is $2^1=2$: $2-2=0$, digit at $2^1$ is $1$.

**Step 5.** Remainder is $0$, so digit at $2^0$ is $0$.

**Assembling the digits**, reading from $2^4$ down to $2^0$:

$$
30 = 1\cdot 2^4 + 1\cdot 2^3 + 1\cdot 2^2 + 1\cdot 2^1 + 0\cdot 2^0 = 11110_2,
$$

matching $B(30) = 11110_2$ from the slide.

---

### Q7. (Chapter 00 slide 24's worked example, reproduced.) Derive the NOT gate matrix $X$ from its state mapping $|0\rangle \to |1\rangle$, $|1\rangle \to |0\rangle$ using the outer-product construction, then verify against matrix-vector multiplication on $a|0\rangle+b|1\rangle$.

**Step 1, build the outer-product sum.**

$$
X = |1\rangle\langle 0| + |0\rangle\langle 1|.
$$

**Step 2, expand each outer product as a matrix.**

$$
|1\rangle\langle 0| = \begin{pmatrix}0\\1\end{pmatrix}\begin{pmatrix}1&0\end{pmatrix} = \begin{pmatrix}0&0\\1&0\end{pmatrix},
\qquad
|0\rangle\langle 1| = \begin{pmatrix}1\\0\end{pmatrix}\begin{pmatrix}0&1\end{pmatrix} = \begin{pmatrix}0&1\\0&0\end{pmatrix}.
$$

**Step 3, add them.**

$$
X = \begin{pmatrix}0&0\\1&0\end{pmatrix} + \begin{pmatrix}0&1\\0&0\end{pmatrix} = \begin{pmatrix}0&1\\1&0\end{pmatrix},
$$

matching the slide's derivation.

**Verification 1, by matrix multiplication.**

$$
X\begin{pmatrix}a\\b\end{pmatrix} = \begin{pmatrix}0&1\\1&0\end{pmatrix}\begin{pmatrix}a\\b\end{pmatrix} = \begin{pmatrix}0a+1b\\1a+0b\end{pmatrix} = \begin{pmatrix}b\\a\end{pmatrix}.
$$

**Verification 2, by linearity on the state mapping.**

$$
X(a|0\rangle+b|1\rangle) = a(X|0\rangle) + b(X|1\rangle) = a|1\rangle + b|0\rangle = b|0\rangle + a|1\rangle,
$$

the same $(b,a)$ result written in Dirac notation.

**Conclusion.** The outer-product matrix and the linear state-mapping expansion agree exactly, as the slide's side-by-side comparison shows.
