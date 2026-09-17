<!-- #ruleok: gate acronyms X, Y, Z, H, S, T, CNOT, SWAP, CZ are exact technical terms, not emphasis -->
# Question 4: Quantum Operators (Translating a State Mapping to a Matrix)
Source: Chapter 02, slides 3-4, 7-9, 19, 21, 27, 32-33

Task type for every problem below: you are given a state mapping (where each input basis ket goes), and you must construct the operator matrix U. Method for every problem, per chapter 02 slides 7-9:
1. Write U as an outer-product sum: U = sum over k of |output_k> <input_k|.
2. Take the adjoint (conjugate transpose) of each input ket to form its bra; forgetting this step is the single most common mistake (slide 8's explicit warning).
3. Expand each bra in the |0>,|1>,... basis and collect terms of the form |j><k|; each such term contributes its coefficient to row j, column k of the matrix (Trick 1).
4. Assemble the full matrix and verify it is orthonormal (U*U = I), which is what makes it a physically valid, reversible gate.

## Problem 1: NOT gate from its mapping
Given: |0> -> |1>, |1> -> |0>.

Solution.
U = |1><0| + |0><1|.
Column placement (Trick 1): the image of |0> becomes column 0, the image of |1> becomes column 1.
Column 0 = (0,1) (coefficients of |0>,|1> in the image of |0>, which is |1>).
Column 1 = (1,0) (image of |1>, which is |0>).
U = [[0,1],[1,0]].
Verify orthonormality: U*U = [[0,1],[1,0]][[0,1],[1,0]] = [[1,0],[0,1]] = I. Valid.
This is the Pauli X / NOT gate.

## Problem 2: Hadamard gate from its mapping (chapter 02 slide 8's worked example)
Given: |0> -> (|0>+|1>)/sqrt(2), |1> -> (|0>-|1>)/sqrt(2).

Solution.
U = ((|0>+|1>)/sqrt2) <0| + ((|0>-|1>)/sqrt2) <1|.
Since |0> and |1> are the plain standard basis, their bras <0|, <1| need no extra phase work, only the transpose.
Column 0 = (1/sqrt2, 1/sqrt2). Column 1 = (1/sqrt2, -1/sqrt2).
U = (1/sqrt2) [[1,1],[1,-1]].
Verify: U*U = (1/2)[[1,1],[1,-1]][[1,1],[1,-1]] = (1/2)[[2,0],[0,2]] = I. Valid.
This is the Hadamard gate H.

## Problem 3: complex-phase input basis (chapter 02 slide 9's worked example)
Given: cis(pi/4)|0> -> |1>, cis(-pi/4)|1> -> |0>. Here the input kets themselves carry a phase, so the adjoint step (step 2) is not optional.

Solution.
The input kets are cis(pi/4)|0> and cis(-pi/4)|1>. Their bras (conjugate transpose, which flips the sign of the phase) are cis(-pi/4)<0| and cis(pi/4)<1|.
U = |1> (cis(-pi/4)<0|) + |0> (cis(pi/4)<1|) = cis(-pi/4)|1><0| + cis(pi/4)|0><1|.
Column 0 (multiplies <0|): row 1 gets cis(-pi/4), row 0 gets 0.
Column 1 (multiplies <1|): row 0 gets cis(pi/4), row 1 gets 0.
U = [[0, cis(pi/4)],[cis(-pi/4), 0]].
Verify: U*U has (1,1) entry cis(-pi/4)*cis(pi/4) = cis(0) = 1, and (2,2) entry cis(pi/4)*cis(-pi/4) = 1, off-diagonal entries 0. So U*U = I. Valid.
If you had skipped the adjoint and used cis(pi/4)|1><0| + cis(-pi/4)|0><1| instead, U*U would still equal I (this particular case is symmetric), but the resulting matrix would map |0> to cis(pi/4)|1> instead of |1>, which does not match the stated mapping at all. This is exactly the failure mode the slide's warning is protecting against.

## Problem 4: controlled-NOT from its mapping (chapter 02 slide 32's worked example)
Given: |00> -> |00>, |01> -> |01>, |10> -> |11>, |11> -> |10>.

Solution.
U = |00><00| + |01><01| + |11><10| + |10><11|.
Using basis order {|00>,|01>,|10>,|11>} indexed 0,1,2,3: |00><00| places a 1 at (row0,col0); |01><01| at (row1,col1); |11><10| at (row3,col2); |10><11| at (row2,col3).
U = [[1,0,0,0],[0,1,0,0],[0,0,0,1],[0,0,1,0]].
Verify: each row and column has exactly one 1, so U*U = I automatically (a permutation matrix is always orthonormal).
This is controlled-NOT (control = wire 1, target = wire 2), matching chapter 03 slide 11's matrix exactly.

## Problem 5: swap gate from its mapping (chapter 02 slide 33's worked example)
Given: |00> -> |00>, |01> -> |10>, |10> -> |01>, |11> -> |11>.

Solution.
U = |00><00| + |10><01| + |01><10| + |11><11|.
Placement: |00><00| at (0,0); |10><01| at (2,1); |01><10| at (1,2); |11><11| at (3,3).
U = [[1,0,0,0],[0,0,1,0],[0,1,0,0],[0,0,0,1]].
Verify: again a permutation matrix, so U*U = I automatically.
This is swap, matching chapter 03 slide 38's matrix.

## Problem 6: non-standard input basis (|+>, |->)
Given: |+> -> |1>, |-> -> |0>, where |+> = (|0>+|1>)/sqrt2 and |-> = (|0>-|1>)/sqrt2.

Solution.
U = |1><+| + |0><-|.
Since |+>,|-> are real, <+| = (1/sqrt2)(<0|+<1|) and <-| = (1/sqrt2)(<0|-<1|).
U = (1/sqrt2)|1>(<0|+<1|) + (1/sqrt2)|0>(<0|-<1|) = (1/sqrt2)|1><0| + (1/sqrt2)|1><1| + (1/sqrt2)|0><0| - (1/sqrt2)|0><1|.
Collecting: row0col0 = 1/sqrt2, row0col1 = -1/sqrt2, row1col0 = 1/sqrt2, row1col1 = 1/sqrt2.
U = (1/sqrt2)[[1,-1],[1,1]].
Verify: U*U = (1/2)[[1,1],[-1,1]][[1,-1],[1,1]] = (1/2)[[1+1, -1+1],[-1+1,1+1]] = (1/2)[[2,0],[0,2]] = I. Valid.
Check against the mapping directly: U|+> = U(1/sqrt2,1/sqrt2) = (1/2 - 1/2, 1/2 + 1/2) = (0,1) = |1>, correct. U|-> = U(1/sqrt2,-1/sqrt2) = (1/2+1/2, 1/2-1/2) = (1,0) = |0>, correct.
Comparing to the rotation-gate table (chapter 04 slide 14), U = RY(pi/2).

## Problem 7: Pauli Y from its mapping
Given: |0> -> i|1>, |1> -> -i|0>.

Solution.
U = i|1><0| + (-i)|0><1|.
Column 0 = (0, i). Column 1 = (-i, 0).
U = [[0,-i],[i,0]].
Verify: U*U: (1,1) entry = 0*0 + (-i)(i) = -i^2 = 1; (2,2) entry = i*(-i) + 0*0 = 1; off-diagonal entries 0. U*U = I. Valid.
This is the Pauli Y gate.

## Problem 8: augmented operator on a 3-qubit register
Given, following chapter 03 slide 34's augmentation notation: on 3 qubits, an operator acts as plain X only on qubit 3, leaving qubits 1 and 2 completely untouched, for every value of qubits 1 and 2. In slide notation this is X^(3)_3 = |x,y,1><x,y,0| + |x,y,0><x,y,1| summed implicitly over all x,y in {0,1}.

Solution.
Rather than writing four separate outer-product terms (one per x,y pair) and merging them by hand, use the block structure directly. Order the 8-dimensional basis by the index 4x+2y+z (z is qubit 3, the least significant bit): |000>,|001>,|010>,|011>,|100>,|101>,|110>,|111> at positions 0 through 7.
The mapping only ever flips the last bit z, and never touches x or y, so it is a permutation that swaps each consecutive pair (0,1), (2,3), (4,5), (6,7): |000><->|001>, |010><->|011>, |100><->|101>, |110><->|111>.
This is a block-diagonal 8x8 matrix made of four copies of the 2x2 X block along the diagonal (one 2x2 X block per fixed (x,y) pair):
X^(3)_3 = X (+) X (+) X (+) X, where (+) denotes block-diagonal placement, each 2x2 block equal to [[0,1],[1,0]].
This matches chapter 03 slide 34's examples (X^(3)_3, Z^(3)_2, H^(3)_1, controlled-NOT^(4)_{1,3}), where a single-qubit or two-qubit gate is embedded into a larger register by leaving every other qubit as an identity block. It is also a valid gate: each 2x2 block on the diagonal is orthonormal, so the full block-diagonal matrix is orthonormal too.
