<!-- #ruleok: gate acronyms X, Y, Z, H, S, CNOT, CZ, GHZ are exact technical terms, not emphasis -->
# Question 5: Quantum Algorithms (State Initialization with Clifford Gates)
Source: Chapter 03, slides 3, 7-12, 28, 30-34, 38-39, 43-44. Flagged by the instructor as challenging.

Task type for every problem below: you are given a target quantum state, and you must draw a circuit built only from Clifford gates (H, S, Pauli X/Y/Z, controlled-NOT, CZ, swap) that prepares it starting from the all-zero computational basis state, then verify by tracing the circuit forward.

## Problem 1: Bell state (|00> + |11>) / sqrt(2)
Circuit:
```
q0: |0> --H--*--
             |
q1: |0> -----X--
```
Trace: start |00>. After H on q0: (1/sqrt2)(|00>+|10>). After controlled-NOT (control q0, target q1): the |10> term has control 1, so its target flips 0 -> 1, giving |11>; the |00> term has control 0 and is untouched. Final: (1/sqrt2)(|00>+|11>), the target state.

## Problem 2: (|01> - |10>) / sqrt(2)
Circuit:
```
q0: |0> --H--*--X-------
             |
q1: |0> -----X----Z-----
```
Trace: start |00>. After H (q0): (1/sqrt2)(|00>+|10>). After controlled-NOT (control q0, target q1): (1/sqrt2)(|00>+|11>). After X on q0: X flips the first digit of both terms, |00> -> |10> and |11> -> |01>, giving (1/sqrt2)(|10>+|01>). After Z on q1: Z multiplies the amplitude by -1 whenever q1 is |1>; the |01> term has q1 = 1, so it picks up -1, while |10> has q1 = 0 and is untouched: (1/sqrt2)(|10> - |01>) = -(1/sqrt2)(|01> - |10>). This is the target state up to an overall global phase of -1, which is unobservable.

## Problem 3: GHZ state (|000> + |111>) / sqrt(2)
Circuit:
```
q0: |0> --H--*-----*--
             |     |
q1: |0> -----X-----|--
                    |
q2: |0> ------------X--
```
Trace: start |000>. After H (q0): (1/sqrt2)(|000>+|100>). After controlled-NOT (control q0, target q1): the |100> term has control 1, flipping q1: (1/sqrt2)(|000>+|110>). After controlled-NOT (control q0, target q2): the |110> term still has control (q0) equal to 1, flipping q2: (1/sqrt2)(|000>+|111>), the target state.

## Problem 4: |-> = (|0> - |1>) / sqrt(2), single qubit
Circuit:
```
q0: |0> --X--H--
```
Trace: start |0>. After X: |1>. After H: H|1> = (|0>-|1>)/sqrt(2), the target state (using H's own state mapping H|1> = |-> directly, no extra sign gate needed since X placed the qubit at |1> before Hadamard mixes it).

## Problem 5: two independent Bell pairs, 4 qubits: (|00>+|11>)/sqrt(2) tensor (|00>+|11>)/sqrt(2)
Circuit:
```
q0: |0> --H--*----------
             |
q1: |0> -----X----------
q2: |0> --H-------*-----
                   |
q3: |0> -----------X----
```
Trace: the two pairs (q0,q1) and (q2,q3) never interact, so they can be traced independently and then combined by a tensor product. After H on q0 and q2: (1/2)(|00>+|10>)_{01} tensor (|00>+|10>)_{23} (writing each pair's own 2-qubit amplitude vector). After controlled-NOT(q0,q1): pair 01 becomes (1/sqrt2)(|00>+|11>). After controlled-NOT(q2,q3): pair 23 becomes (1/sqrt2)(|00>+|11>). Final: (1/sqrt2)(|00>+|11>)_{01} tensor (1/sqrt2)(|00>+|11>)_{23}, two independent Bell pairs, exactly the target.

## Problem 6: (|00> - |11>) / sqrt(2)
Circuit:
```
q0: |0> --H--*--Z--
             |
q1: |0> -----X-----
```
Trace: start |00>. After H (q0): (1/sqrt2)(|00>+|10>). After controlled-NOT: (1/sqrt2)(|00>+|11>). After Z on q0: Z multiplies the amplitude by -1 whenever q0 is |1>; the |11> term has q0 = 1, so it picks up -1, while |00> is untouched: (1/sqrt2)(|00> - |11>), the target state exactly, no global phase needed.

## Problem 7: (|01> + |10>) / sqrt(2)
Circuit:
```
q0: |0> --H--*--X--
             |
q1: |0> -----X-----
```
Trace: start |00>. After H (q0): (1/sqrt2)(|00>+|10>). After controlled-NOT: (1/sqrt2)(|00>+|11>). After X on q0: X flips the first digit of both terms, |00> -> |10> and |11> -> |01>: (1/sqrt2)(|10>+|01>) = (1/sqrt2)(|01>+|10>), the target state directly, no sign fix needed (unlike Problem 2, where the target had a minus sign).

## Problem 8: a 3-qubit product state, Bell pair on q0,q1 tensor |-> on q2
Target: (|00>+|11>)/sqrt(2) (qubits 0,1) tensor (|0>-|1>)/sqrt(2) (qubit 2).
Circuit:
```
q0: |0> --H--*-----------
             |
q1: |0> -----X-----------
q2: |0> --X-----H--------
```
Trace: q0,q1 and q2 never interact (no shared gate), so they can be prepared in parallel and traced independently, exactly the same reasoning as Problem 5's tensor composition. Qubits 0,1: H then controlled-NOT gives (1/sqrt2)(|00>+|11>), by Problem 1. Qubit 2: X then H gives (|0>-|1>)/sqrt(2), by Problem 4. Combining by tensor product: the full 3-qubit state is (1/sqrt2)(|00>+|11>)_{01} tensor (1/sqrt2)(|0>-|1>)_2, the target state. This illustrates that independent registers can be initialized by circuits that share no gates and can be reasoned about (and drawn) as separate sub-circuits running in parallel.
