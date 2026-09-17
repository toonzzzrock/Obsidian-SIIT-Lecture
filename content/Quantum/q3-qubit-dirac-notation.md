# Question 3: Quantum Information (Qubit String and Dirac's Notation)
Source: Chapter 02, slides 3-4, 7-9, 19, 21, 27, 32-33

## Why questions (Q&A)

**Q1. Why does a system of n qubits need a state vector of size 2^n rather than n numbers, unlike n classical bits?**
A. n classical bits each hold one independent value, so n numbers fully describe the register. n qubits, however, can be in a superposition over every joint assignment of the n bits at once, and each of the 2^n basis strings |x1...xn> can carry its own complex amplitude. Describing the general state requires one amplitude per basis string, 2^n complex numbers total, because the register is not a list of n independent qubit states but one joint vector in a 2^n-dimensional space (this is the same 2^n dimension counted from a different angle in Question 1, Math Q1).

**Q2. Why is Dirac (bra-ket) notation useful compared to writing full column vectors every time?**
A. |01> names the basis vector by its bit pattern directly, so the reader sees which classical string an amplitude belongs to without cross-referencing a position index in a long column. Bra-ket notation also makes the inner product <phi|psi>, the tensor product |a>⊗|b>, and the adjoint of an operator all read as algebraic manipulations of labels, which stays compact and readable even at 4 or more qubits where a column vector would already have 16 or more entries.

**Q3. Why does the bra <psi| correspond to the conjugate transpose of |psi> rather than a plain transpose?**
A. The bra-ket pairing <psi|psi> must equal the squared norm sum |c_i|^2, a real, non-negative number usable as a probability. If <psi| were only the plain transpose of |psi> (no conjugation), then <psi|psi> would be sum c_i^2, which is generally complex for complex amplitudes and could not be interpreted as a probability. Conjugating each amplitude when forming the bra is what forces <psi|psi> to be real and non-negative for every state.

**Q4. Why does the ordering of qubits in a tensor-product string such as |x1 x2 x3 x4> matter for applying a gate to a specific wire?**
A. Each position in the string is tied to a specific physical wire by convention (position 1 is wire 1, and so on), and a single-qubit gate applied "to wire k" acts only on that position's factor in the tensor product, leaving the others as identity. If the labeling convention were not fixed, there would be no unambiguous way to say which physical qubit a gate like H or a controlled-NOT's control or target refers to, and multi-qubit gates such as swap explicitly exchange two named positions rather than any two qubits.

**Q5. Why is normalization (norm 1) required for a physically valid qubit string, and what would an unnormalized state imply?**
A. Measurement probabilities are computed as |c_i|^2 for each basis outcome, and a valid probability distribution must sum to 1 over all outcomes, which is exactly <psi|psi> = sum |c_i|^2 = 1. An unnormalized vector would give total probability different from 1 (either more or less than certainty), which is not a valid probability distribution; in practice, an unnormalized vector is rescaled by dividing by its norm before it is treated as a physical state (Math Q2 below works this rescaling explicitly).

**Q6. Why is a multi-qubit basis state such as |01> written as the tensor product |0>⊗|1> rather than a sum |0> + |1>?**
A. |0>⊗|1> represents two qubits jointly in one definite combined configuration (first qubit is 0, second is 1), which is what a basis state of the joint 4-dimensional space must be. |0> + |1> instead describes one single qubit in an (unnormalized) superposition of being 0 or 1. These are states of systems of different sizes (one qubit versus two), so the sum notation cannot stand in for the two-qubit basis label; superposition and joint composition are separate operations (+ combines amplitudes of the same system, ⊗ combines separate systems).

## Math questions (Q&A)

**Q1. Write |01> and |10> as tensor products and as 4-dimensional column vectors in the ordered basis {|00>,|01>,|10>,|11>}.**
A. |01> = |0> ⊗ |1> = (1,0) ⊗ (0,1) = (1*0, 1*1, 0*0, 0*1) = (0,1,0,0).
|10> = |1> ⊗ |0> = (0,1) ⊗ (1,0) = (0*1, 0*0, 1*1, 1*0) = (0,0,1,0).
So |01> is the second standard basis vector and |10> is the third, matching the binary value of the two-bit label read as a base-2 index (01 = 1, 10 = 2).

**Q2. A 3-qubit register is in state |101>. Write the corresponding 8-dimensional standard basis column vector.**
A. Interpreting 101 in binary gives the index 1*4 + 0*2 + 1*1 = 5 (0-indexed). The vector has a single 1 in position 5 (0-indexed: positions 0 through 7 correspond to |000> through |111>), and 0 everywhere else: (0,0,0,0,0,1,0,0).

**Q3. Compute <phi|psi> for |phi> = |01> and |psi> = (|00> + |11>) / sqrt(2).**
A. In column form, phi = (0,1,0,0) and psi = (1/sqrt2, 0, 0, 1/sqrt2). <phi|psi> = conj(phi) . psi = 0*(1/sqrt2) + 1*0 + 0*0 + 0*(1/sqrt2) = 0. The two states are orthogonal: |01> has zero overlap with the Bell state (|00>+|11>)/sqrt(2), since the Bell state has no |01> component at all.

**Q4. Given the 4-qubit string |x1 x2 x3 x4> = |0110>, state which wire each digit corresponds to, then give the resulting string after a swap gate is applied to wires 2 and 3.**
A. Position 1 -> wire 1 -> value 0. Position 2 -> wire 2 -> value 1. Position 3 -> wire 3 -> value 1. Position 4 -> wire 4 -> value 0. Applying swap to wires 2 and 3 exchanges their values (1 and 1), which in this particular case happen to be equal, so the string is unchanged: |0110> -> |0110>. (If instead the starting values on wires 2 and 3 had been different, e.g. |0100>, swap(2,3) would give |0010>, since the second and third digits are exchanged.)

**Q5. Normalize the unnormalized vector v = 3|0> + 4i|1>.**
A. Norm: ||v|| = sqrt(|3|^2 + |4i|^2) = sqrt(9 + 16) = sqrt(25) = 5. Normalized state: v / 5 = (3/5)|0> + (4i/5)|1>. Check: |3/5|^2 + |4i/5|^2 = 9/25 + 16/25 = 25/25 = 1, confirming this is now a valid qubit string.

**Q6. Expand |psi> = (a|0> + b|1>) ⊗ (c|0> + d|1>) into the four-term computational-basis expansion and give the coefficient of each basis ket.**
A. Distributing the tensor product over both sums: |psi> = ac |00> + ad |01> + bc |10> + bd |11>. Coefficient of |00> is ac, of |01> is ad, of |10> is bc, of |11> is bd. As a normalization check, if |a|^2+|b|^2 = 1 and |c|^2+|d|^2 = 1 (each factor separately normalized), then |ac|^2+|ad|^2+|bc|^2+|bd|^2 = (|a|^2+|b|^2)(|c|^2+|d|^2) = 1, so the product state is automatically normalized.

**Q7. Simplify <cis(theta) psi | cis(theta) psi> step by step using Dirac notation rules for conjugation and linearity.**
A. The ket cis(theta)|psi> means the vector e^{i theta}|psi>. The corresponding bra is the conjugate transpose, <cis(theta) psi| = conj(e^{i theta}) <psi| = e^{-i theta} <psi|, because conjugation of a scalar factor pulled out of a bra flips the sign of its phase. So <cis(theta) psi | cis(theta) psi> = e^{-i theta} <psi| e^{i theta} |psi> = e^{-i theta} e^{i theta} <psi|psi> = e^{0} <psi|psi> = <psi|psi>. The two phase factors cancel exactly, matching the global-phase invariance proved by direct computation in Question 2, Math Q5.
