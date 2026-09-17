# Formal Logic and Computational Argumentation: Comprehensive Exam Preparation Guide

---

## Module 1: Abstract Argumentation Frameworks (Dung's Semantics & Formal Proofs)

An **Argumentation Framework (AF)** is a pair $\mathcal{F} = (AR, Att)$, where:

- $AR$ is a set of arguments.
- $Att \subseteq AR \times AR$ is a binary attack relation. If $(A, B) \in Att$, we say "$A$ attacks $B$".

### 1. Fundamental Semantic Definitions

Let $S \subseteq AR$:

- **Conflict-Free**: $S$ is conflict-free if there do not exist $A, B \in S$ such that $(A, B) \in Att$.
- **Defense (Acceptability)**: An argument $A \in AR$ is **defended by $S$** (or acceptable with respect to $S$) if for every $B \in AR$ such that $(B, A) \in Att$, there exists some $C \in S$ such that $(C, B) \in Att$.
- **Characteristic Function**: $f: 2^{AR} \to 2^{AR}$ is defined as:
  $$f(S) = \{ X \in AR \mid S \text{ defends } X \}$$
- **Admissible Extension**: A conflict-free set $S$ is an admissible extension if $S \subseteq f(S)$ (i.e., $S$ defends all of its elements).
- **Complete Extension**: A conflict-free set $S$ is a complete extension if $S = f(S)$ (i.e., it defends all its elements and contains all elements it defends).
- **Grounded Extension ($GE$)**: The least fixed point of $f$, which coincides with the smallest complete extension (under set inclusion):
  $$GE = \bigcup_{k \ge 0} f^k(\emptyset), \quad \text{where } f^0(\emptyset) = \emptyset \text{ and } f^{k+1}(\emptyset) = f(f^k(\emptyset))$$
- **Preferred Extension**: A maximal (with respect to set inclusion) admissible extension.
- **Stable Extension**: A conflict-free set $S$ such that for every $Y \in AR \setminus S$, there exists $X \in S$ such that $(X, Y) \in Att$ (i.e., $S$ attacks every argument not in $S$).
  - _Note:_ Every stable extension is preferred and complete, but a framework may have **no** stable extensions.

---

### 2. Concrete Graph Analysis and Computation

#### Example 1: Cyclic & Odd-Length Attack Graphs

**Problem:** Let $AR = \{A_0, A_1, A_2\}$ with $Att = \{(A_1, A_0), (A_2, A_1), (A_0, A_2), (A_2, A_2)\}$.

- **Graph Topology:** $A_2$ is self-attacking ($(A_2, A_2)$) and attacks $A_1$. $A_1$ attacks $A_0$. $A_0$ attacks $A_2$.
- **Step 1: Conflict-free sets:**
  - Self-attacking nodes cannot belong to any conflict-free set $\implies A_2 \notin S$.
  - Since $(A_1, A_0) \in Att$, $\{A_0, A_1\}$ has a conflict.
  - Conflict-free sets: $\emptyset, \{A_0\}, \{A_1\}$.
- **Step 2: Check admissibility:**
  - For $\{A_0\}$: Attacked by $A_1$. Does $\{A_0\}$ defend itself against $A_1$? It needs an element that attacks $A_1$. Only $A_2$ attacks $A_1$, but $A_2 \notin \{A_0\}$. Hence, $\{A_0\}$ is **not admissible**.
  - For $\{A_1\}$: Attacked by $A_2$. To defend against $A_2$, it needs an argument attacking $A_2$ (which is $A_0$ or $A_2$). Neither is in $\{A_1\}$. Hence, $\{A_1\}$ is **not admissible**.
  - For $\emptyset$: Trivially conflict-free and defends all its elements (vacuously).
  - **All Admissible Sets:** $\{\emptyset\}$.
- **Step 3: Grounded Extension ($GE$):**
  - $f^0(\emptyset) = \emptyset$.
  - Arguments with no attackers: None ($A_0$ is attacked by $A_1$, $A_1$ by $A_2$, $A_2$ by $A_0$ and $A_2$).
  - $f(\emptyset) = \emptyset \implies GE = \emptyset$.
- **Acceptance:** Admissibly accepted = None; Groundedly accepted = None.

---

#### Example 2: Computing $GE$ on Infinite Frameworks via Iterative Fixed-Point

**Problem:** Consider the infinite argumentation framework $\mathcal{F} = (AR, Att)$ where:
$$AR = \{A, D\} \cup \{B_n \mid n \ge 1\} \cup \{C_n \mid n \ge 1\}$$
$$Att = \{(B_n, A), (A, B_n) \mid n \ge 1\} \cup \{(C_n, B_n) \mid n \ge 1\} \cup \{(D, C_n) \mid n \ge 1\}$$

```
          A <--------> B_n <-------- C_n <-------- D
```

**Step-by-step Computation of $GE$:**

1. **Base Iteration ($k=1$):**
   $$f^1(\emptyset) = \{ X \in AR \mid X \text{ has no attackers} \}$$
   - $A$ is attacked by each $B_n$.
   - Each $B_n$ is attacked by $A$ and $C_n$.
   - Each $C_n$ is attacked by $D$.
   - $D$ has **no incoming attacks**.
     $$\implies f^1(\emptyset) = \{D\}$$
2. **Second Iteration ($k=2$):**
   $$f^2(\emptyset) = f(\{D\}) = \{ X \in AR \mid \{D\} \text{ defends } X \}$$
   - Check $C_n$: Attacked by $D$. $\{D\}$ does not defend $C_n$.
   - Check $B_n$: Attacked by $C_n$ and $A$. $\{D\}$ attacks $C_n$, so $\{D\}$ defends $B_n$ against $C_n$. **However**, $B_n$ is also attacked by $A$. Does $\{D\}$ attack $A$? No, $(D, A) \notin Att$. Thus, $\{D\}$ **fails to defend** $B_n$ against $A$.
   - Check $A$: Attacked by each $B_n$. $\{D\}$ does not attack any $B_n$.
   - Hence, no new arguments are defended:
     $$f^2(\emptyset) = \{D\}$$
3. **Convergence:**
   Since $f^2(\emptyset) = f^1(\emptyset) = \{D\}$, the iterative chain terminates:
   $$GE = \{D\}$$

---

### 3. Formal Mathematical Proofs in Argumentation Theory

#### Theorem 1: Mutually Attacking Arguments Cannot Both Belong to the Grounded Extension

**Statement:** In any argumentation framework $\mathcal{F} = (AR, Att)$, if $A, B \in AR$ and $(A, B) \in Att$, then it is impossible that both $A \in GE$ and $B \in GE$.

**Proof:**

1. By definition, the grounded extension $GE$ is the least complete extension of $\mathcal{F}$.
2. Every complete extension is, by definition, an admissible set.
3. Every admissible set is, by definition, **conflict-free**.
4. Suppose for contradiction that both $A \in GE$ and $B \in GE$.
5. Since $(A, B) \in Att$, the set $\{A, B\} \subseteq GE$ contains an internal attack, which means $GE$ is not conflict-free.
6. This directly contradicts the fact that $GE$ is conflict-free.
7. Therefore, $\{A, B\} \not\subseteq GE$. $\blacksquare$

---

#### Theorem 2: Grounded Attack Excludes Admissible Acceptance

**Statement:** If an argument $A \in AR$ is attacked by some argument in $GE$, then $A$ cannot belong to any admissible extension $E$.

**Proof by Mathematical Induction:**
Let $GE = \bigcup_{i=0}^\infty f^i(\emptyset)$, where $f^0(\emptyset) = \emptyset$ and $f^{i+1}(\emptyset) = f(f^i(\emptyset))$.

**Lemma:** If $E$ is an admissible extension, then for all $i \ge 0$, $E$ does not attack any argument in $f^i(\emptyset)$.

- **Base Case ($i = 0$):**
  $f^0(\emptyset) = \emptyset$. Since the empty set contains no elements, $E$ cannot attack any argument in $f^0(\emptyset)$. Holds trivially.

- **Induction Hypothesis ($i = k$):**
  Assume $E$ does not attack any argument in $f^k(\emptyset)$.

- **Inductive Step ($i = k + 1$):**
  Suppose for contradiction that $E$ attacks some argument $Y \in f^{k+1}(\emptyset)$.
  1. By definition of the characteristic function, $f^{k+1}(\emptyset) = f(f^k(\emptyset))$, which means $f^k(\emptyset)$ defends $Y$ against all attackers.
  2. Since $E$ attacks $Y$, there exists an argument $X \in E$ such that $(X, Y) \in Att$.
  3. Because $f^k(\emptyset)$ defends $Y$, there must exist some $Z \in f^k(\emptyset)$ such that $(Z, X) \in Att$ (i.e., $f^k(\emptyset)$ attacks $X$).
  4. But $X \in E$, so $Z \in f^k(\emptyset)$ attacks an element of $E$.
  5. By definition of admissibility, $E$ must defend itself against all attacks. Since $Z$ attacks $X \in E$, $E$ must attack $Z$.
  6. But $Z \in f^k(\emptyset)$, meaning $E$ attacks an argument in $f^k(\emptyset)$.
  7. This contradicts our Induction Hypothesis that $E$ does not attack any element in $f^k(\emptyset)$.
  8. Hence, $E$ cannot attack any element in $f^{k+1}(\emptyset)$.

- **Conclusion of the Main Theorem:**
  Suppose $A \in AR$ is attacked by some argument $G \in GE$. Since $GE = \bigcup_{i=0}^\infty f^i(\emptyset)$, $G \in f^m(\emptyset)$ for some finite $m \ge 1$.
  If $A$ belonged to an admissible extension $E$, then to defend $A \in E$ against the attacker $G$, $E$ would have to attack $G$.
  However, by our Lemma, no admissible extension can attack any element of $f^m(\emptyset)$.
  This contradiction implies $A$ cannot belong to any admissible extension. $\blacksquare$

---

#### Theorem 3: The Grounded Extension is Admissible

**Statement:** Let $\mathcal{F} = (AR, Att)$ be an argumentation framework and $GE = \bigcup_{k \ge 0} f^k(\emptyset)$. Then $GE$ is an admissible extension.

**Proof:**
We must show two properties: (1) $GE$ is conflict-free, and (2) $GE \subseteq f(GE)$ (it defends all its elements).

1. **Conflict-freeness:**
   We show by induction on $k$ that each $S_k = f^k(\emptyset)$ is conflict-free and does not attack itself.
   - $S_0 = \emptyset$ is conflict-free.
   - Assume $S_k$ is conflict-free and does not attack any element of $S_k$.
   - If an element $X \in f(S_k) \setminus S_k$ is attacked by an element $Y \in S_k$, then because $S_k$ defends $X$, $S_k$ must attack $Y$, contradicting the hypothesis that $S_k$ has no internal attacks.
   - Thus, by induction, no $S_k$ contains any conflicts, and hence their monotone union $GE$ is conflict-free.

2. **Self-Defense ($GE \subseteq f(GE)$):**
   - Let $X \in GE$. Then $X \in f^k(\emptyset)$ for some $k \ge 1$.
   - By definition, $f^k(\emptyset) = f(f^{k-1}(\emptyset))$, which means $f^{k-1}(\emptyset)$ defends $X$.
   - Since $f^{k-1}(\emptyset) \subseteq GE$, any attack on $X$ is countered by an argument in $f^{k-1}(\emptyset) \subseteq GE$.
   - Thus, $GE$ defends $X$.
   - Since this holds for all $X \in GE$, $GE \subseteq f(GE)$.

Because $GE$ is conflict-free and defends all its elements, $GE$ is an admissible extension. $\blacksquare$

---

### 4. Structured Argumentation (ASPIC+ & Attack Classifications)

In structured argumentation (e.g., ASPIC+), arguments have internal premises and inferential rules:

- **Undermining:** An attack directed at an ordinary **premise** of another argument.
- **Rebutting:** An attack directed at the **conclusion** of another argument (or intermediate conclusion derived via a defeasible rule).
- **Undercutting:** An attack directed at the **applicability of a defeasible rule** itself (asserting that the rule does not apply in this specific context).

#### Example: ASPIC+ Evaluation with Preferences

- **Premises:** $\text{vaccinated}(\text{bob})$, $\text{fromRedZone}(\text{bob})$
- **Defeasible Rules:**
  - $r_1: \text{fromRedZone}(X), \text{vaccinated}(X) \Rightarrow \text{quarantine}(X)$
  - $r_2: \text{vaccinated}(X) \Rightarrow \neg\text{quarantine}(X)$
- **Rule Preference:** $r_2 < r_1$ ($r_1$ has strictly higher priority than $r_2$).
- **Contrariness:** $\text{quarantine}(X)$ and $\neg\text{quarantine}(X)$ are contraries.

**Argument Derivation:**

- Argument $A_1$ (using $r_1$): Supports conclusion $\text{quarantine}(\text{bob})$.
- Argument $A_2$ (using $r_2$): Supports conclusion $\neg\text{quarantine}(\text{bob})$.

**Attack Evaluation:**

- Both arguments have contradictory conclusions $\implies$ mutual potential rebutting attack.
- **Preference Resolution:** Because $r_2 < r_1$, the rule supporting $A_1$ is strictly preferred to $r_2$.
- Therefore, the attack from $A_2$ onto $A_1$ is overridden and fails, while the attack from $A_1$ onto $A_2$ succeeds.
- In the resulting framework: $Att = \{(A_1, A_2)\}$.
- $A_1$ is unattacked $\implies GE = \{A_1\}$.
- **Conclusion:** The proposition $\text{quarantine}(\text{bob})$ is **accepted**.

---

## Module 2: Propositional Logic — Semantics, Satisfiability, and Modeling

### 1. Classification of Formulas

Let $\phi$ be a propositional formula:

- **Valid (Tautology):** $\phi$ is true under **all** possible truth assignments ($M(\phi) = \mathcal{I}$).
- **Satisfiable:** $\phi$ is true under **at least one** truth assignment ($|M(\phi)| \ge 1$).
- **Contingent:** $\phi$ is true under at least one assignment, and false under at least one assignment ($1 \le |M(\phi)| < |\mathcal{I}|$).
- **Unsatisfiable (Contradiction):** $\phi$ is false under **all** possible truth assignments ($M(\phi) = \emptyset$).

#### Rigorous Truth-Table Classifications

1. **Evaluate: $(( \neg p \to q) \to (\neg q \to p)) \land (p \lor q)$**
   - $\neg p \to q \equiv p \lor q$.
   - $\neg q \to p \equiv q \lor p \equiv p \lor q$.
   - The subformula $(\neg p \to q) \to (\neg q \to p)$ becomes $(p \lor q) \to (p \lor q)$, which is a **tautology** (always $1$).
   - The full formula is $1 \land (p \lor q) \equiv p \lor q$.
   - Because $p \lor q$ is true for assignments $(1,1), (1,0), (0,1)$ and false for $(0,0)$, it is **contingent**.

2. **Evaluate: $(p \to (p \to r)) \to (p \to r)$**
   - Let $X = (p \to r)$. The formula has the shape:
     $$(p \to X) \to X$$
   - Notice that $p \to X \equiv p \to (p \to r) \equiv (p \land p) \to r \equiv p \to r \equiv X$.
   - The expression reduces to $X \to X$, which is always true ($1$).
   - Therefore, the sentence is **valid**.

---

### 2. Modeling Real-World Combinatorial Problems as SAT

#### The Exam Timetabling SAT Formulation

**Problem:** Schedule 4 courses: $css434, css444, its341, its441$.

- Available time slots: Morning ($m$), Afternoon ($a$).
- Conflict graph edges: Course pairs that cannot share the same slot:
  - $(css434, css444)$
  - $(css434, its341)$
  - $(css444, its441)$
  - $(its341, its441)$

```
         css434 ----------- its341
           |                  |
           |                  |
           |                  |
         css444 ----------- its441
```

**Propositional Variables:**
Let $C\text{-}t$ denote course $C$ scheduled in time slot $t \in \{m, a\}$.
Signature:
$$\{ c434\text{-}m, c434\text{-}a, c444\text{-}m, c444\text{-}a, i341\text{-}m, i341\text{-}a, i441\text{-}m, i441\text{-}a \}$$

**Formula Formulation $F = F_{\text{assign}} \land F_{\text{conflict}}$:**

1. **Slot Assignment Constraints (Each course gets exactly one slot):**
   For each course $C$:
   $$(C\text{-}m \lor C\text{-}a) \land (\neg C\text{-}m \lor \neg C\text{-}a)$$
   Which simplifies logically to $C\text{-}m \leftrightarrow \neg C\text{-}a$.

2. **Conflict Constraints (Adjacent courses cannot share the same slot):**
   For each edge $(C_1, C_2)$ in the conflict graph:
   $$\neg(C_1\text{-}m \land C_2\text{-}m) \land \neg(C_1\text{-}a \land C_2\text{-}a)$$
   Equivalently:
   $$(\neg C_1\text{-}m \lor \neg C_2\text{-}m) \land (\neg C_1\text{-}a \lor \neg C_2\text{-}a)$$

**Listing All Satisfying Truth Assignments (Graph 2-Coloring):**
The conflict graph is an even cycle $C_4$:
$$css434 - css444 - its441 - its341 - css434$$
A cycle of length 4 is bipartite, admitting exactly 2 valid colorings using 2 colors:

- **Solution 1:**
  - Morning ($m$): $css434, its441 = \text{True}$; Afternoon ($a$): $\text{False}$
  - Afternoon ($a$): $css444, its341 = \text{True}$; Morning ($m$): $\text{False}$
- **Solution 2:**
  - Morning ($m$): $css444, its341 = \text{True}$; Afternoon ($a$): $\text{False}$
  - Afternoon ($a$): $css434, its441 = \text{True}$; Morning ($m$): $\text{False}$

---

### 3. Reductive Equivalence using $\{\neg, \to\}$ Only

Using the equivalences $A \lor B \equiv \neg A \to B$ and $A \land B \equiv \neg(A \to \neg B)$:

- **Rewrite $p \lor q \lor r$:**
  $$p \lor q \lor r \equiv (p \lor q) \lor r \equiv (\neg p \to q) \lor r \equiv \neg(\neg p \to q) \to r$$

- **Rewrite $r \land k$:**
  $$r \land k \equiv \neg(\neg r \lor \neg k) \equiv \neg(r \to \neg k)$$

- **Rewrite $(p \lor r) \to (q \lor s)$:**
  $$p \lor r \equiv \neg p \to r, \quad q \lor s \equiv \neg q \to s$$
  $$\implies (\neg p \to r) \to (\neg q \to s)$$

---

## Module 3: Propositional Proof Systems (Formal Deduction & Meta-Logic)

---

### 1. Semantic Countermodels (Disproving Deductive Validity)

An argument with premises $\Delta$ and conclusion $\phi$ is **not deductive** if and only if there exists a truth assignment $v$ such that:
$$v(\psi) = \text{True for every } \psi \in \Delta, \quad \text{and} \quad v(\phi) = \text{False}$$

#### Example

**Argument:**
$$k \land p \to q$$
$$m \land r \to k \lor p \lor q$$
$$\therefore m \land r \to q$$

**Goal:** Find a truth assignment making both premises $\text{True}$ and the conclusion $\text{False}$.

1. **Force conclusion to be False:**
   $$v(m \land r \to q) = \text{False} \implies v(m \land r) = \text{True} \text{ and } v(q) = \text{False}$$
   $$\implies v(m) = \text{True}, \quad v(r) = \text{True}, \quad v(q) = \text{False}$$
2. **Satisfy Premise 1:**
   $$v(k \land p \to q) = \text{True}$$
   Since $v(q) = \text{False}$, we must ensure $v(k \land p) = \text{False}$.
   This requires that not both $k$ and $p$ are true.
3. **Satisfy Premise 2:**
   $$v(m \land r \to k \lor p \lor q) = \text{True}$$
   Since $v(m \land r) = \text{True}$, the consequent must be True:
   $$v(k \lor p \lor q) = \text{True}$$
   Since $v(q) = \text{False}$, we need $v(k \lor p) = \text{True}$.
4. **Solve the constraints:**
   - $v(k \lor p) = \text{True}$
   - $v(k \land p) = \text{False}$
     Setting $v(k) = \text{True}$ and $v(p) = \text{False}$ satisfies both conditions.

**Countermodel:**
$$\{ m \mapsto \text{True}, \; r \mapsto \text{True}, \; q \mapsto \text{False}, \; k \mapsto \text{True}, \; p \mapsto \text{False} \}$$
_Conclusion is invalid._

---

### 2. Meta-Theoretic Proofs for Generalized Propositional Schemas

#### Theorem (Resolution Pattern Over Disjunctions and Conjunctions)

**Statement:** Prove that the following argument schema is deductive:
$$\text{Premise 1: } P_1 \leftrightarrow S_1$$
$$\text{Premise 2: } P_1 \land P_2 \land \dots \land P_k \to Q_1 \lor \dots \lor Q_l$$
$$\text{Premise 3: } R_1 \land \dots \land R_m \to S_1 \lor S_2 \lor \dots \lor S_n$$
$$\therefore P_2 \land \dots \land P_k \land R_1 \land \dots \land R_m \to Q_1 \lor \dots \lor Q_l \lor S_2 \lor \dots \lor S_n$$

**Direct Semantic Proof:**
Assume for contradiction that the argument is **not** deductive. Then there exists a truth assignment $v$ under which:

1. **Premise 1 is True:** $v(P_1 \leftrightarrow S_1) = \text{True} \implies v(P_1) = v(S_1)$.
2. **Premise 2 is True:** $v(P_1 \land \dots \land P_k \to Q_1 \lor \dots \lor Q_l) = \text{True}$.
3. **Premise 3 is True:** $v(R_1 \land \dots \land R_m \to S_1 \lor \dots \lor S_n) = \text{True}$.
4. **The Conclusion is False:**
   $$v\Big( (P_2 \land \dots \land P_k \land R_1 \land \dots \land R_m) \to (Q_1 \lor \dots \lor Q_l \lor S_2 \lor \dots \lor S_n) \Big) = \text{False}$$

By the truth definition of implication, a false conditional implies:

- The antecedent is **True**:
  $$v(P_2 \land \dots \land P_k \land R_1 \land \dots \land R_m) = \text{True}$$
  $$\implies v(P_2) = \dots = v(P_k) = \text{True} \quad \text{and} \quad v(R_1) = \dots = v(R_m) = \text{True}$$
- The consequent is **False**:
  $$v(Q_1 \lor \dots \lor Q_l \lor S_2 \lor \dots \lor S_n) = \text{False}$$
  $$\implies v(Q_1) = \dots = v(Q_l) = \text{False} \quad \text{and} \quad v(S_2) = \dots = v(S_n) = \text{False}$$

Now, examine the truth value of $P_1$ under assignment $v$. Because $v(P_1 \leftrightarrow S_1) = \text{True}$, we have two cases:

- **Case 1: $v(P_1) = \text{True}$ and $v(S_1) = \text{True}$.**
  - Consider Premise 2:
    Its antecedent is $P_1 \land P_2 \land \dots \land P_k$.
    Since $v(P_1) = \text{True}$ and $v(P_2 \land \dots \land P_k) = \text{True}$, the entire antecedent is **True**.
    Its consequent is $Q_1 \lor \dots \lor Q_l$, which is **False**.
    Thus, Premise 2 evaluates to $\text{True} \to \text{False}$, which is **False**.
    This contradicts the assumption that Premise 2 is True.

- **Case 2: $v(P_1) = \text{False}$ and $v(S_1) = \text{False}$.**
  - Consider Premise 3:
    Its antecedent is $R_1 \land \dots \land R_m$, which is **True**.
    Its consequent is $S_1 \lor S_2 \lor \dots \lor S_n$.
    Since $v(S_1) = \text{False}$ and $v(S_2 \lor \dots \lor S_n) = \text{False}$, the consequent is **False**.
    Thus, Premise 3 evaluates to $\text{True} \to \text{False}$, which is **False**.
    This contradicts the assumption that Premise 3 is True.

In both exhaustive cases, a premise is violated. Therefore, no assignment can make the premises true while making the conclusion false. The argument schema is **deductive**. $\blacksquare$

---

### 3. Fitch Natural Deduction Proofs

#### Proof 1: Transposition $(\neg q \to \neg p \text{ from } p \to q)$

```
1.  p -> q               Premise
| 2.  ~q                 Assumption
| | 3.  p                Assumption
| | 4.  q                Implication Elimination (Modus Ponens): 1, 3
| | 5.  ~q               Reiteration: 2
| 6.  p -> ~q            Implication Introduction: 3, 5
| 7.  ~p                 Negation Introduction: 1, 6  [or RAA with 4, 5]
8.  ~q -> ~p             Implication Introduction: 2, 7
```

#### Proof 2: Law of Double Negation ($\neg\neg p \text{ from } p$)

```
1.  p                    Premise
| 2.  ~p                 Assumption
| 3.  p                  Reiteration: 1
4.  ~p -> p              Implication Introduction: 2, 3
| 5.  ~p                 Assumption
6.  ~p -> ~p             Implication Introduction: 5, 5
7.  ~~p                  Negation Introduction: 4, 6
```

---

### 4. Clausal Form Conversion (The INDO Procedure)

The INDO procedure transforms any arbitrary propositional formula into Conjunctive Normal Form (CNF / Set of Clauses):

1. **I - Implications Out:** Eliminate $\to, \leftrightarrow, \leftarrow$ using:
   - $A \to B \equiv \neg A \lor B$
   - $A \leftarrow B \equiv A \lor \neg B$
   - $A \leftrightarrow B \equiv (\neg A \lor B) \land (\neg B \lor A)$
2. **N - Negations In:** Push $\neg$ inwards using De Morgan's laws and Double Negation:
   - $\neg(A \land B) \equiv \neg A \lor \neg B$
   - $\neg(A \lor B) \equiv \neg A \land \neg B$
   - $\neg\neg A \equiv A$
3. **D - Distribution:** Distribute $\lor$ over $\land$ to achieve CNF:
   - $A \lor (B \land C) \equiv (A \lor B) \land (A \lor C)$
4. **O - Operators / Clauses:** Convert conjunctions of disjunctions into a set of set clauses:
   - $(L_{1,1} \lor \dots \lor L_{1,k}) \land \dots \implies \{ \{L_{1,1}, \dots, L_{1,k}\}, \dots \}$

#### Step-by-Step Conversion Walkthrough

**Target:** Convert $(q \land r) \leftrightarrow r$

- **Step I (Implications Out):**
  $$((q \land r) \to r) \land (r \to (q \land r))$$
  $$(\neg(q \land r) \lor r) \land (\neg r \lor (q \land r))$$
- **Step N (Negations In):**
  $$(\neg q \lor \neg r \lor r) \land (\neg r \lor (q \land r))$$
- **Step D (Distribution):**
  The first disjunct $(\neg q \lor \neg r \lor r)$ is already a clause. Distribute $\neg r$ over $(q \land r)$:
  $$(\neg r \lor q) \land (\neg r \lor r)$$
  Combine both parts:
  $$(\neg q \lor \neg r \lor r) \land (q \lor \neg r) \land (r \lor \neg r)$$
- **Step O (Clausal Set Output):**
  $$\{ \{\neg q, \neg r, r\}, \; \{q, \neg r\}, \; \{r, \neg r\} \}$$

---

### 5. Propositional Resolution Refutation

To prove that $\Delta \models \phi$:

1. Convert each sentence in $\Delta$ into clausal form.
2. Negate the goal formula ($\neg \phi$) and convert it into clausal form.
3. Apply the **Resolution Rule**:
   $$\frac{\{C_1, L\}, \quad \{C_2, \neg L\}}{\{C_1, C_2\}}$$
4. Derive the empty clause $\{\}$ (contradiction).

#### Complete Resolution Proof Walkthrough

**Premises:**

- $P_1: \omega \to p \implies \{\neg \omega, p\}$
- $P_2: \neg \omega \to (q \to p) \equiv \omega \lor \neg q \lor p \implies \{\omega, \neg q, p\}$

**Goal:**
$$\phi = (p \to (q \land \omega)) \to ((\neg \omega \land \neg p) \lor q)$$

**Clausal Form of $\neg \phi$:**
$$\neg \phi = \neg\Big( \neg(p \to (q \land \omega)) \lor ((\neg \omega \land \neg p) \lor q) \Big)$$
Using Step N:
$$(p \to (q \land \omega)) \land \neg(\neg \omega \land \neg p) \land \neg q$$
$$(\neg p \lor (q \land \omega)) \land (\omega \lor p) \land \neg q$$
Distributing:
$$(\neg p \lor q) \land (\neg p \lor \omega) \land (\omega \lor p) \land \neg q$$
Clausal clauses from $\neg \phi$:
$$\{\neg p, q\}, \quad \{\neg p, \omega\}, \quad \{\omega, p\}, \quad \{\neg q\}$$

**Resolution Refutation Trace Table:**

| Step | Clause                    | Derivation / Justification      |
| :--- | :------------------------ | :------------------------------ |
| 1    | $\{\neg \omega, p\}$      | Premise 1                       |
| 2    | $\{\omega, \neg q, p\}$   | Premise 2                       |
| 3    | $\{\neg p, q\}$           | From $\neg \phi$                |
| 4    | $\{\neg p, \omega\}$      | From $\neg \phi$                |
| 5    | $\{\omega, p\}$           | From $\neg \phi$                |
| 6    | $\{\neg q\}$              | From $\neg \phi$                |
| 7    | $\{\neg p\}$              | Resolve 3 and 6 on $q$          |
| 8    | $\{\neg \omega\}$         | Resolve 1 and 7 on $p$          |
| 9    | $\{\omega\}$              | Resolve 4 and 5 on $p$          |
| 10   | **$\{\}$ (Empty Clause)** | **Resolve 8 and 9 on $\omega$** |

$\therefore$ The refutation succeeds; the empty clause is derived; $\Delta \models \phi$ is verified.

---

## Module 4: Categorical Logic & Syllogistic Venn Diagrams

Categorical logic evaluates arguments based on relations between classes (sets).

### 1. Standard Form Categorical Propositions

| Type  |         Form         |            Meaning            |             Venn Representation              |
| :---: | :------------------: | :---------------------------: | :------------------------------------------: |
| **A** |   All $S$ are $P$    |        $S \subseteq P$        |     Shade region $S \setminus P$ (empty)     |
| **E** |    No $S$ are $P$    |    $S \cap P = \emptyset$     |       Shade region $S \cap P$ (empty)        |
| **I** |   Some $S$ are $P$   |   $S \cap P \ne \emptyset$    |   Place a star ($*$) in region $S \cap P$    |
| **O** | Some $S$ are not $P$ | $S \setminus P \ne \emptyset$ | Place a star ($*$) in region $S \setminus P$ |

---

### 2. Venn Diagram Decision Method for Syllogisms

To evaluate a three-term categorical syllogism with terms $S, P, M$:

1. Draw three intersecting circles representing $S$, $P$, and $M$.
2. **Always diagram universal premises first** (A or E) by shading the impossible regions.
3. **Diagram existential premises next** (I or O) by placing an $*$ in the designated area. If an area contains two unshaded sections, place the $*$ on the border between them unless constrained to a single region.
4. **Inspect the diagram:** Check whether the diagram already portrays the conclusion without adding any additional marks. If yes, the argument is **valid/deductive**; otherwise, it is **invalid/not deductive**.

#### Case Study A: Syllogism 1

- **Premise 1:** All $M$ is $P$. (Shade region $M \setminus P$).
- **Premise 2:** No $S$ is $M$. (Shade region $S \cap M$).
- **Conclusion:** No $S$ is $P$. (Requires region $S \cap P$ to be shaded).
- **Evaluation:**
  Shading $M \setminus P$ and $S \cap M$ leaves the region $(S \cap P) \setminus M$ completely unshaded and open.
  The diagram does **not** force $S \cap P$ to be empty.
- **Result:** **Not Deductive (Invalid)**.

#### Case Study B: Syllogism 2

- **Premise 1:** No $P$ is $M$. (Shade region $P \cap M$).
- **Premise 2:** Some $S$ is $M$. (Place $*$ in $S \cap M$).
- **Conclusion:** Some $S$ is not $P$. (Requires an $*$ in $S \setminus P$).
- **Evaluation:**
  Region $S \cap M$ consists of two subregions: $(S \cap M \cap P)$ and $(S \cap M \setminus P)$.
  Because Premise 1 shaded $P \cap M$, the subregion $(S \cap M \cap P)$ is shaded out (impossible).
  Therefore, the $*$ for Premise 2 must go into $(S \cap M \setminus P)$.
  Since this subregion is entirely inside $S$ and strictly outside $P$, there is an $*$ in $S \setminus P$.
- **Result:** **Deductive (Valid)**.

---

### 3. Reading and Interpreting Complex Venn Diagrams

```
         S                     P
      /-----\               /-----\
     /   *   \             /       \
    |   (S\   \---#####---|   (P\   |
    |  (P U M)) \ #P \ M# /   (S U M))
     \         / \#######/         /
      \-------/---\-----/-\-------/
             /     \ * /   \
            | (S∩M\ |   |   |
            |   P)  |   |   |
             \     /     \ /
              \---/-------/
                 /         \
                |     M     |
                 \---------/
```

When interpreting an existing Venn diagram with markings:

1. **Empty Regions (Cross-hatched / Shaded):** Assert universal negatives ($E$) or universal affirmatives ($A$) about non-existence.
   - If $(P \setminus M)$ is shaded: "Every $P$ is $M$" ($P \subseteq M$).
   - If $(S \setminus M)$ is shaded: "Every $S$ is $M$" ($S \subseteq M$).
2. **Stars ($*$):** Assert existential statements ($I$ or $O$).
   - An $*$ inside $(S \cap M \cap P)$ confirms: "Some $S$ is both $P$ and $M$."
   - An $*$ inside $(S \setminus (P \cup M))$ confirms: "Some $S$ is neither $P$ nor $M$."
3. **Invalid Inferences:** An inference is invalid if the diagram allows for counterexamples (unshaded regions without stars where entities may or may not exist). For instance, an $*$ inside $(S \cap M)$ does **not** imply that _all_ $S$ is $M$ unless the entire remainder of $S$ is shaded.

---

## Quick-Reference Formula Sheet for the Exam

```
+-----------------------------------------------------------------------------------------------+
| ARGUMENTATION FRAMEWORKS:                                                                     |
| * S is conflict-free: NO A, B in S have (A, B) in Att                                         |
| * S defends X: For ALL Y with (Y, X) in Att, THERE IS Z in S with (Z, Y) in Att               |
| * S is admissible: conflict-free AND S defends ALL elements X in S                            |
| * S is complete: conflict-free AND S = { X | S defends X }                                    |
| * Grounded Ext: LEAST complete extension = union_{k >= 0} f^k(empty)                          |
| * S is stable: conflict-free AND S attacks EVERY argument X not in S                          |
+-----------------------------------------------------------------------------------------------+
| PROPOSITIONAL INDO PROCEDURE:                                                                 |
| 1. I: Eliminate ->, <->, <-   |  A -> B = ~A \/ B    |  A <-> B = (~A \/ B) /\ (~B \/ A)      |
| 2. N: Push ~ inwards          | ~(A \/ B) = ~A /\ ~B |  ~(A /\ B) = ~A \/ ~B                  |
| 3. D: Distribute \/ over /\   | A \/ (B /\ C) = (A \/ B) /\ (A \/ C)                          |
| 4. O: Collect into clauses    | (L1 \/ L2) /\ (L3 \/ L4) = { {L1, L2}, {L3, L4} }             |
+-----------------------------------------------------------------------------------------------+
| RESOLUTION RULE:                                                                              |
|               { C1,  L }   and   { C2, ~L }  ===>  { C1, C2 }                                 |
| Empty clause {} derived ===> Formula is UNSATISFIABLE ===> Entailment HOLDS                  |
+-----------------------------------------------------------------------------------------------+
```
