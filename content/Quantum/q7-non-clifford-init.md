<!-- #ruleok: gate acronyms P, T, S, H, X, CNOT, RY are exact technical terms, not emphasis -->
# Question 7: Non-Clifford Gates (State Initialization with Clifford and Non-Clifford Gates)
Source: Chapter 04, slides 6-8, 11-16

Task type for every problem below: you are given a target quantum state that a Clifford-only circuit cannot reach, and you must draw a circuit using both Clifford gates (H, S, Pauli X/Y/Z, controlled-NOT) and at least one non-Clifford gate (P(lambda), T, or a continuous-angle rotation RY(theta)) that prepares it from the all-zero basis state, then verify by tracing forward.

## Problem 1: (|0> + e^{i pi/4}|1>) / sqrt2, single qubit
Circuit:
```
q0: |0> --H--T--
```
Step 1 (start): |0>.
Step 2 (after H): (1/sqrt2)(|0>+|1>).
Step 3 (after T): T = diag(1, e^{i pi/4}) multiplies the |1> amplitude by e^{i pi/4}, leaving the |0> amplitude untouched: (1/sqrt2)(|0> + e^{i pi/4}|1>), the target state.
Why Clifford alone cannot do this: H alone only ever produces real, equal-weight superpositions with phase 0 or pi between the two terms; T is what supplies the pi/4 relative phase that neither H nor S (which only offers multiples of pi/2) can produce.

## Problem 2: (|00> + e^{i pi/4}|11>) / sqrt2, two qubits
Circuit:
```
q0: |0> --H--*-----
             |
q1: |0> -----X--T--
```
Step 1 (start): |00>.
Step 2 (after H on q0): (1/sqrt2)(|00>+|10>).
Step 3 (after controlled-NOT, control q0, target q1): (1/sqrt2)(|00>+|11>), the Bell state.
Step 4 (after T on q1): the |00> term has q1 = |0> and is untouched; the |11> term has q1 = |1> and picks up e^{i pi/4}. State: (1/sqrt2)(|00> + e^{i pi/4}|11>), the target state.

## Problem 3: cos(pi/8)|0> + sin(pi/8)|1>, single qubit, arbitrary rotation angle
Circuit:
```
q0: |0> --RY(pi/4)--
```
Step 1 (start): |0>.
Step 2 (after RY(pi/4)): RY(theta)|0> = cos(theta/2)|0> + sin(theta/2)|1> for any real theta; substituting theta = pi/4 gives cos(pi/8)|0> + sin(pi/8)|1>, the target state directly in one gate.
Why this needs a non-Clifford gate: Clifford single-qubit gates only ever reach the six stabilizer states (|0>, |1>, |+>, |->, |+i>, |-i>); pi/8 is not one of the fixed Clifford angles (multiples of pi/2), so only a continuously parameterized rotation gate like RY can land exactly here.

## Problem 4: (|000> + e^{i pi/4}|111>) / sqrt2, GHZ state with a non-Clifford phase
Circuit:
```
q0: |0> --H--*-----*-----
             |     |
q1: |0> -----X-----|-----
                    |
q2: |0> ------------X--T--
```
Step 1 (start): |000>.
Step 2 (after H on q0): (1/sqrt2)(|000>+|100>).
Step 3 (after controlled-NOT, control q0, target q1): (1/sqrt2)(|000>+|110>).
Step 4 (after controlled-NOT, control q0, target q2): (1/sqrt2)(|000>+|111>), the ordinary GHZ state.
Step 5 (after T on q2): the |000> term has q2 = |0> and is untouched; the |111> term has q2 = |1> and picks up e^{i pi/4}. State: (1/sqrt2)(|000> + e^{i pi/4}|111>), the target state.

## Problem 5: (|0> + e^{i pi/8}|1>) / sqrt2, single qubit, general phase gate P(lambda)
Circuit:
```
q0: |0> --H--P(pi/8)--
```
Step 1 (start): |0>.
Step 2 (after H): (1/sqrt2)(|0>+|1>).
Step 3 (after P(pi/8)): P(lambda) = diag(1, e^{i lambda}) multiplies the |1> amplitude by e^{i pi/8}, leaving |0> untouched: (1/sqrt2)(|0> + e^{i pi/8}|1>), the target state. This is the same construction as Problem 1 but with an arbitrary angle lambda = pi/8 instead of the fixed T = P(pi/4), showing T is just one fixed instance of the more general P(lambda) family.

## Problem 6: cos(pi/8)|00> + sin(pi/8)|11>, a non-maximally-entangled two-qubit state
Circuit:
```
q0: |0> --RY(pi/4)--*--
                     |
q1: |0> -------------X--
```
Step 1 (start): |00>.
Step 2 (after RY(pi/4) on q0): cos(pi/8)|0> + sin(pi/8)|1>, tensor |0> on q1: cos(pi/8)|00> + sin(pi/8)|10>.
Step 3 (after controlled-NOT, control q0, target q1): the |10> term has control 1, so q1 flips: sin(pi/8)|11>; the |00> term has control 0 and is untouched: cos(pi/8)|00>. State: cos(pi/8)|00> + sin(pi/8)|11>, the target state.
Why this needs a non-Clifford gate: Clifford gates (H, controlled-NOT) alone only ever reach the maximally-entangled Bell states, with equal weight (1/sqrt2) on both terms; reaching an unequal weighting like cos(pi/8) versus sin(pi/8) requires a continuously variable rotation angle before the entangling controlled-NOT.

## Problem 7: Bell pair on q0,q1 tensor a non-Clifford single-qubit state on q2
Target: (|00>+|11>)/sqrt2 (qubits 0,1) tensor (cos(pi/8)|0>+sin(pi/8)|1>) (qubit 2).
Circuit:
```
q0: |0> --H--*----------------
             |
q1: |0> -----X----------------
q2: |0> --RY(pi/4)-------------
```
Step 1 (start): |000>.
Step 2: q0,q1 and q2 share no gate, so they can be traced independently and combined at the end by a tensor product, the same reasoning used for parallel sub-circuits in Question 5.
Step 3 (q0,q1 branch, after H then controlled-NOT): (1/sqrt2)(|00>+|11>), the ordinary Bell state.
Step 4 (q2 branch, after RY(pi/4)): cos(pi/8)|0> + sin(pi/8)|1>.
Final state: (1/sqrt2)(|00>+|11>)_{01} tensor (cos(pi/8)|0>+sin(pi/8)|1>)_2, the target state. The Bell pair needed only Clifford gates; only the q2 register needed the non-Clifford rotation.

## Problem 8: (|0> + e^{i 3pi/4}|1>) / sqrt2, composing a Clifford phase gate with a non-Clifford phase gate
Circuit:
```
q0: |0> --H--S--T--
```
Step 1 (start): |0>.
Step 2 (after H): (1/sqrt2)(|0>+|1>).
Step 3 (after S): S = diag(1,i) multiplies the |1> amplitude by i = e^{i pi/2}, leaving |0> untouched: (1/sqrt2)(|0> + e^{i pi/2}|1>).
Step 4 (after T): T multiplies the |1> amplitude by e^{i pi/4} again, and phases on the same amplitude add: e^{i pi/2} times e^{i pi/4} = e^{i(pi/2+pi/4)} = e^{i 3pi/4}. State: (1/sqrt2)(|0> + e^{i 3pi/4}|1>), the target state.
This shows a Clifford phase gate (S, angle pi/2) and a non-Clifford phase gate (T, angle pi/4) applied to the same qubit combine by simply adding their angles, since both are diagonal in the same basis and commute with each other; the same 3pi/4 target could equally well have been reached by a single P(3pi/4) in place of S and T together.
