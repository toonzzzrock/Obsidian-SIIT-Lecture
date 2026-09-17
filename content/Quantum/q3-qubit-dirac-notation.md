# Question 3: Quantum Information (Qubit String and Dirac's Notation)
Source: Chapter 02, slides 3-4, 7-9, 19, 21, 27, 32-33

## Why questions (Q&A)

### Q1. Why does a system of $n$ qubits need a state vector of size $2^n$ rather than just $n$ numbers, unlike $n$ classical bits?

**Step 1, the classical case.** $n$ classical bits each hold one independent value (0 or 1), and nothing more. Listing those $n$ values fully describes the whole register: $n$ numbers, no more needed.

**Step 2, the quantum case.** $n$ qubits, in contrast, can be in a superposition over every joint assignment of the $n$ bits at once. Each of the $2^n$ possible basis strings

$$
|x_1 x_2 \cdots x_n\rangle, \qquad x_i \in \{0,1\}
$$

can carry its own complex amplitude, independently of every other basis string. Describing the general state requires listing one complex amplitude per basis string, that is $2^n$ complex numbers in total.

**Step 3, why this is not just "n qubits, n numbers".** The register is not a list of $n$ separately-described qubit states; it is a single joint vector living in a $2^n$-dimensional space. This is the same $2^n$ dimension counted from a different angle in Question 1, Math Q1, where it was used to count physical degrees of freedom.

---

### Q2. Why is Dirac (bra-ket) notation useful compared to writing out full column vectors every time?

**Reason 1, direct labeling.** $|01\rangle$ names the basis vector by its bit pattern directly. The reader immediately sees which classical string an amplitude belongs to, with no need to cross-reference a numeric position index in a long column vector.

**Reason 2, algebraic manipulations stay compact.** Bra-ket notation lets the inner product $\langle\phi|\psi\rangle$, the tensor product $|a\rangle\otimes|b\rangle$, and the adjoint of an operator all be written and manipulated as short algebraic expressions on labels, rather than as index-by-index sums over long vectors or matrices.

**Reason 3, this scales.** This compactness matters increasingly as the qubit count grows: at just 4 qubits a column vector already has $2^4=16$ entries, and at 10 qubits it has $2^{10}=1024$ entries. Dirac notation stays exactly as readable at any qubit count, because it never requires writing out the full vector.

---

### Q3. Why does the bra $\langle\psi|$ correspond to the conjugate transpose of $|\psi\rangle$, rather than a plain transpose?

**Step 1, what $\langle\psi|\psi\rangle$ needs to be.** The pairing $\langle\psi|\psi\rangle$ must equal the sum of squared magnitudes of the amplitudes,

$$
\langle\psi|\psi\rangle = \sum_i |c_i|^2,
$$

which has to be a real, non-negative number, because it is used directly as (or normalized into) a probability.

**Step 2, why a plain transpose fails.** If $\langle\psi|$ were only the plain transpose of $|\psi\rangle$ (transposed, but not conjugated), then

$$
\langle\psi|\psi\rangle \;\text{(plain transpose version)} = \sum_i c_i^2,
$$

which is generally a complex number whenever the amplitudes $c_i$ are complex, and it cannot be interpreted as a probability at all.

**Step 3, why conjugation fixes this.** Conjugating each amplitude when forming the bra is what forces

$$
\langle\psi|\psi\rangle = \sum_i \overline{c_i}\,c_i = \sum_i |c_i|^2 \;\geq 0,
$$

a real, non-negative number for every state $|\psi\rangle$, with no exceptions. That is why the bra must be the conjugate transpose, not the plain transpose.

---

### Q4. Why does the ordering of qubits in a tensor-product string such as $|x_1 x_2 x_3 x_4\rangle$ matter for applying a gate to a specific wire?

**Step 1, the labeling convention.** Each position in the string is tied to a specific physical wire by convention: position 1 is wire 1, position 2 is wire 2, and so on. A single-qubit gate "applied to wire $k$" acts only on the factor sitting at position $k$ in the tensor product, and leaves every other position untouched (acts as identity there).

**Step 2, what would break without a fixed convention.** If the position-to-wire labeling were not fixed, there would be no clear way to say which physical qubit a gate refers to. This matters for every gate that names specific wires: $H$ applied "to wire 2" needs to know clearly which factor is wire 2; a controlled-NOT's control and target wires need to be distinguishable; and a swap gate explicitly exchanges two named positions (e.g. wires 2 and 3), which only makes sense if positions map to wires consistently.

**Conclusion.** The fixed position-to-wire convention is what makes "apply this gate to this wire" a well-defined instruction at all, for both single-qubit and multi-qubit gates.

---

### Q5. Why is normalization (norm 1) required for a physically valid qubit string, and what would an unnormalized state imply?

**Step 1, where probabilities come from.** Measurement probabilities are computed as $|c_i|^2$ for each basis outcome $i$. For this to form a valid probability distribution, the probabilities across all outcomes must sum to exactly 1:

$$
\sum_i |c_i|^2 = \langle\psi|\psi\rangle = 1.
$$

**Step 2, what happens if this fails.** An unnormalized vector (where $\langle\psi|\psi\rangle \neq 1$) would give a total probability different from 1, either more than certainty or less than certainty, neither of which is a valid probability distribution over measurement outcomes.

**Step 3, the practical fix.** In practice, an unnormalized vector is rescaled by dividing by its norm before being treated as a physical state:

$$
|\psi_{\text{normalized}}\rangle = \frac{|\psi\rangle}{\sqrt{\langle\psi|\psi\rangle}}.
$$

Math Q5 below works through this rescaling on a concrete example.

---

### Q6. Why is a multi-qubit basis state such as $|01\rangle$ written as the tensor product $|0\rangle\otimes|1\rangle$ rather than the sum $|0\rangle+|1\rangle$?

**Step 1, what $|0\rangle\otimes|1\rangle$ represents.** The tensor product represents two separate qubits jointly, each in one definite value: the first qubit is 0, the second is 1. This is exactly what a basis state of the joint 4-dimensional two-qubit space must look like, one definite combined configuration.

**Step 2, what $|0\rangle+|1\rangle$ represents instead.** This notation describes a single qubit in an (unnormalized) superposition of being 0 or 1, a completely different physical situation: one qubit with two possible outcomes, not two qubits each with one definite outcome.

**Step 3, why the two cannot be interchanged.** These are states of systems of different sizes, one qubit versus two qubits, so the sum notation cannot stand in for the two-qubit basis label. Superposition ($+$) and joint composition ($\otimes$) are separate operations: $+$ combines different possible amplitudes of the same system, while $\otimes$ combines separate systems into one larger joint system.

---

## Math questions (Q&A)

### Q1. Write $|01\rangle$ and $|10\rangle$ as tensor products and as 4-dimensional column vectors in the ordered basis $\{|00\rangle,|01\rangle,|10\rangle,|11\rangle\}$.

**$|01\rangle$:**

$$
|01\rangle = |0\rangle\otimes|1\rangle = \begin{pmatrix}1\\0\end{pmatrix}\otimes\begin{pmatrix}0\\1\end{pmatrix} = \begin{pmatrix}1\cdot 0\\ 1\cdot 1\\ 0\cdot 0\\ 0\cdot 1\end{pmatrix} = \begin{pmatrix}0\\1\\0\\0\end{pmatrix}.
$$

**$|10\rangle$:**

$$
|10\rangle = |1\rangle\otimes|0\rangle = \begin{pmatrix}0\\1\end{pmatrix}\otimes\begin{pmatrix}1\\0\end{pmatrix} = \begin{pmatrix}0\cdot 1\\ 0\cdot 0\\ 1\cdot 1\\ 1\cdot 0\end{pmatrix} = \begin{pmatrix}0\\0\\1\\0\end{pmatrix}.
$$

**Reading the pattern.** $|01\rangle$ is the second standard basis vector (index 1, counting from 0) and $|10\rangle$ is the third (index 2). This matches the binary value of the two-bit label, read as a base-2 index: $01_2 = 1$, $10_2 = 2$.

---

### Q2. A 3-qubit register is in state $|101\rangle$. Write the corresponding 8-dimensional standard basis column vector.

**Step 1, convert the label to an index.** Interpret $101$ as a binary number, most significant bit first:

$$
1\cdot 4 + 0\cdot 2 + 1\cdot 1 = 5 \quad (\text{0-indexed}).
$$

**Step 2, build the vector.** An 8-dimensional basis vector has a single $1$ at the position given by that index, and $0$ everywhere else. Positions $0$ through $7$ correspond, in order, to $|000\rangle$ through $|111\rangle$, so position $5$ is $|101\rangle$:

$$
|101\rangle = (0,0,0,0,0,1,0,0).
$$

---

### Q3. Compute $\langle\phi|\psi\rangle$ for $|\phi\rangle = |01\rangle$ and $|\psi\rangle = \dfrac{|00\rangle+|11\rangle}{\sqrt{2}}$.

**Step 1, write both states as column vectors.**

$$
\phi = (0,1,0,0), \qquad \psi = \left(\tfrac{1}{\sqrt2},\,0,\,0,\,\tfrac{1}{\sqrt2}\right).
$$

**Step 2, apply the conjugated dot product.** Since all entries here are real, conjugation does not change them, and

$$
\langle\phi|\psi\rangle = \overline{\phi}\cdot\psi = 0\cdot\tfrac{1}{\sqrt2} + 1\cdot 0 + 0\cdot 0 + 0\cdot\tfrac{1}{\sqrt2} = 0.
$$

**Interpretation.** The two states are orthogonal. $|01\rangle$ has zero overlap with the Bell state $\dfrac{|00\rangle+|11\rangle}{\sqrt2}$, because the Bell state has no $|01\rangle$ component at all, only $|00\rangle$ and $|11\rangle$ appear in it.

---

### Q4. Given the 4-qubit string $|x_1x_2x_3x_4\rangle = |0110\rangle$, state which wire each digit corresponds to, then give the resulting string after a swap gate is applied to wires 2 and 3.

**Step 1, map positions to wires.**

$$
\text{position 1} \to \text{wire 1} \to \text{value } 0,\qquad
\text{position 2} \to \text{wire 2} \to \text{value } 1,
$$
$$
\text{position 3} \to \text{wire 3} \to \text{value } 1,\qquad
\text{position 4} \to \text{wire 4} \to \text{value } 0.
$$

**Step 2, apply swap(2,3).** Swap exchanges the values held on wires 2 and 3. Here both wires already hold the same value ($1$ and $1$), so exchanging them changes nothing:

$$
|0110\rangle \;\xrightarrow{\;\text{swap}(2,3)\;}\; |0110\rangle.
$$

**A worked contrast (to show swap does something in the general case).** If instead the starting string had been $|0100\rangle$ (wire 2 value $1$, wire 3 value $0$, different values from each other), applying swap(2,3) would exchange them and give $|0010\rangle$, the second and third digits trade places. The example in this problem happened to have matching values, which is why nothing visibly changed.

---

### Q5. Normalize the unnormalized vector $v = 3|0\rangle + 4i|1\rangle$.

**Step 1, compute the norm.**

$$
\|v\| = \sqrt{|3|^2 + |4i|^2} = \sqrt{9+16} = \sqrt{25} = 5.
$$

**Step 2, divide every amplitude by the norm.**

$$
v_{\text{normalized}} = \frac{v}{5} = \frac{3}{5}|0\rangle + \frac{4i}{5}|1\rangle.
$$

**Step 3, check the result is normalized.**

$$
\left|\tfrac{3}{5}\right|^2 + \left|\tfrac{4i}{5}\right|^2 = \tfrac{9}{25} + \tfrac{16}{25} = \tfrac{25}{25} = 1.
$$

The rescaled vector has norm exactly $1$, confirming it is now a valid, physically meaningful qubit string.

---

### Q6. Expand $|\psi\rangle = (a|0\rangle + b|1\rangle)\otimes(c|0\rangle + d|1\rangle)$ into the four-term computational-basis expansion, and give the coefficient of each basis ket.

**Step 1, distribute the tensor product over both sums**, using that $\otimes$ distributes over addition on each side independently:

$$
|\psi\rangle = ac\,|00\rangle + ad\,|01\rangle + bc\,|10\rangle + bd\,|11\rangle.
$$

**Step 2, read off the coefficients.**

$$
\text{coeff. of }|00\rangle = ac,\qquad
\text{coeff. of }|01\rangle = ad,\qquad
\text{coeff. of }|10\rangle = bc,\qquad
\text{coeff. of }|11\rangle = bd.
$$

**Step 3, normalization check.** Suppose each factor is separately normalized, i.e. $|a|^2+|b|^2=1$ and $|c|^2+|d|^2=1$. Then

$$
|ac|^2+|ad|^2+|bc|^2+|bd|^2 = (|a|^2+|b|^2)(|c|^2+|d|^2) = 1\cdot 1 = 1.
$$

So a tensor product of two normalized single-qubit states is automatically a normalized two-qubit state, no extra rescaling step is ever needed when combining independently-normalized registers.

---

### Q7. Simplify $\langle\,\mathrm{cis}(\theta)\,\psi \mid \mathrm{cis}(\theta)\,\psi\,\rangle$ step by step, using Dirac-notation rules for conjugation and linearity.

**Step 1, write out what the ket means.** The ket $\mathrm{cis}(\theta)|\psi\rangle$ is shorthand for the vector $e^{i\theta}|\psi\rangle$.

**Step 2, form the corresponding bra.** The bra is the conjugate transpose, so pulling the scalar $e^{i\theta}$ out of a ket and into a bra conjugates it:

$$
\langle\,e^{i\theta}\psi\,| = \overline{e^{i\theta}}\,\langle\psi| = e^{-i\theta}\langle\psi|,
$$

because conjugation of a scalar factor flips the sign of its phase exponent.

**Step 3, combine bra and ket.**

$$
\langle\,e^{i\theta}\psi \mid e^{i\theta}\psi\,\rangle
= \left(e^{-i\theta}\langle\psi|\right)\left(e^{i\theta}|\psi\rangle\right)
= e^{-i\theta}e^{i\theta}\,\langle\psi|\psi\rangle.
$$

**Step 4, simplify the phase factors.**

$$
e^{-i\theta}e^{i\theta} = e^{0} = 1,
$$

so

$$
\langle\,e^{i\theta}\psi \mid e^{i\theta}\psi\,\rangle = \langle\psi|\psi\rangle.
$$

**Conclusion.** The two phase factors cancel exactly, leaving the original norm untouched. This matches, symbolically this time rather than by direct numerical computation, the global-phase invariance already verified by direct computation in Question 2, Math Q5.
