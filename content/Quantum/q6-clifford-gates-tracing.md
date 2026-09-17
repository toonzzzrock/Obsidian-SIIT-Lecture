<!-- #ruleok: gate acronyms X, Y, Z, H, S, CNOT, CZ are exact technical terms, not emphasis -->
# Question 6: Clifford Gates (Step-by-Step Tracing of Quantum States)
Source: Chapter 03, slides 3, 7-12, 28, 30-34, 38-39, 43-44

Task type for every problem below: you are given a circuit diagram, and you must find the quantum state after every single gate, one step at a time, ending at the final state.

## Problem 1
Circuit:
```
q0: |0> --H--*--
             |
q1: |0> -----X--
```
Step 1 (start): |00>.
Step 2 (after H on q0): (1/sqrt2)(|00>+|10>).
Step 3 (after controlled-NOT, control q0, target q1): the |10> term has control 1, so its target flips 0 -> 1, giving |11>; the |00> term has control 0 and is untouched. State: (1/sqrt2)(|00>+|11>).
Final state: (1/sqrt2)(|00>+|11>).

## Problem 2
Circuit:
```
q0: |0> --H--Z--*--
                |
q1: |0> --------X--
```
Step 1 (start): |00>.
Step 2 (after H on q0): (1/sqrt2)(|00>+|10>).
Step 3 (after Z on q0): Z multiplies the amplitude by -1 whenever q0 is |1>; the |10> term picks up -1, the |00> term is untouched. State: (1/sqrt2)(|00>-|10>).
Step 4 (after controlled-NOT, control q0, target q1): the |10> term (carrying coefficient -1/sqrt2) has control 1, so its target flips: -|11>; the |00> term is untouched. State: (1/sqrt2)(|00>-|11>).
Final state: (1/sqrt2)(|00>-|11>).

## Problem 3
Circuit:
```
q0: |0> --H--S--*--
                |
q1: |0> --------X--
```
Step 1 (start): |00>.
Step 2 (after H on q0): (1/sqrt2)(|00>+|10>).
Step 3 (after S on q0): S = diag(1,i) multiplies the amplitude by i whenever q0 is |1>; the |10> term picks up i, the |00> term is untouched. State: (1/sqrt2)(|00>+i|10>).
Step 4 (after controlled-NOT, control q0, target q1): the |10> term (coefficient i/sqrt2) has control 1, so its target flips: i|11>; the |00> term is untouched. State: (1/sqrt2)(|00>+i|11>).
Final state: (1/sqrt2)(|00>+i|11>). This shows a relative phase picked up before entangling survives inside the entangled state.

## Problem 4
Circuit:
```
q0: |0> -----H--*--x--
                 |  |
q1: |0> --X------Z--x--
```
(here x-x on the last column denotes swap between q0 and q1, and the * -- Z column is controlled-Z between q0 and q1)
Step 1 (start): |00>.
Step 2 (after X on q1): |01>.
Step 3 (after H on q0): q0 goes from |0> to (|0>+|1>)/sqrt2, q1 stays |1>. State: (1/sqrt2)(|01>+|11>).
Step 4 (after CZ, control/target q0,q1): CZ multiplies the amplitude by -1 only when both qubits are |1>; the |11> term qualifies and picks up -1, the |01> term (q0=0) is untouched. State: (1/sqrt2)(|01>-|11>).
Step 5 (after swap on q0,q1): swap exchanges the two digits in each term: |01> -> |10>, |11> -> |11> (symmetric, unchanged). State: (1/sqrt2)(|10>-|11>) = (1/sqrt2)|1> tensor (|0>-|1>), an unentangled product state.
Final state: (1/sqrt2)(|10>-|11>), equal to |1> tensor |->.

## Problem 5
Circuit:
```
q0: |0> --H--*--------
             |
q1: |0> -----X--*-----
                |
q2: |0> --------X-----
```
Step 1 (start): |000>.
Step 2 (after H on q0): (1/sqrt2)(|000>+|100>).
Step 3 (after controlled-NOT, control q0, target q1): the |100> term has control (q0) equal to 1, so q1 flips: (1/sqrt2)(|000>+|110>).
Step 4 (after controlled-NOT, control q1, target q2): the |110> term now has control (q1) equal to 1, so q2 flips: (1/sqrt2)(|000>+|111>). The |000> term has q1 = 0, untouched.
Final state: (1/sqrt2)(|000>+|111>), the GHZ state, built here by a chain of controlled-NOT gates (q0 controls q1, q1 controls q2) rather than fanning out directly from q0.

## Problem 6
Circuit:
```
q0: |0> --H--*-----
             |
q1: |0> -----X--Z--
```
Step 1 (start): |00>.
Step 2 (after H on q0): (1/sqrt2)(|00>+|10>).
Step 3 (after controlled-NOT, control q0, target q1): (1/sqrt2)(|00>+|11>).
Step 4 (after Z on q1): Z multiplies the amplitude by -1 whenever q1 is |1>; the |11> term picks up -1, |00> is untouched. State: (1/sqrt2)(|00>-|11>).
Final state: (1/sqrt2)(|00>-|11>). Compare to Problem 2: both circuits (Z on q0 before entangling, versus Z on q1 after entangling) reach the exact same final state, because after the controlled-NOT the only term with a |1> on either wire is |11>, so a Z on either wire lands on the same term.

## Problem 7
Circuit:
```
q0: |0> --H--S--S--
```
Step 1 (start): |0>.
Step 2 (after H): (1/sqrt2)(|0>+|1>).
Step 3 (after first S): S multiplies the |1> amplitude by i: (1/sqrt2)(|0>+i|1>).
Step 4 (after second S): S multiplies the |1> amplitude by i again: i * i = -1, so (1/sqrt2)(|0>-|1>).
Final state: (1/sqrt2)(|0>-|1>) = |->. This confirms S applied twice equals Z (SS = Z, since Z|+> = |-> directly), but only becomes visible once the qubit already has a nonzero |1> amplitude to act on; applying SS to a bare |0> would leave it at |0> with no visible effect at all, since S never touches the |0> amplitude.

## Problem 8
Circuit:
```
q0: |0> --*--H--*--
          |     |
q1: |0> --X-----X--
```
Step 1 (start): |00>.
Step 2 (after first controlled-NOT, control q0, target q1): control q0 is |0>, so nothing changes. State: |00>.
Step 3 (after H on q0): (1/sqrt2)(|00>+|10>).
Step 4 (after second controlled-NOT, control q0, target q1): the |10> term has control 1, so q1 flips: (1/sqrt2)(|00>+|11>).
Final state: (1/sqrt2)(|00>+|11>). The first controlled-NOT in this circuit was a no-op (its control qubit was still |0> at that point in the trace), so only the last two gates actually determined the outcome; always check the control's actual value at each step rather than assuming a gate has an effect just because it is drawn on the circuit.
