# Comprehensive Exam Study & Preparation Guide: Formal Logic & Computational Argumentation

---

## Table of Contents
1. [Section 1: Natural Language Logic & Argument Analysis](#section-1-natural-language-logic--argument-analysis)
2. [Section 2: Categorical Logic & Syllogistic Venn Diagrams](#section-2-categorical-logic--syllogistic-venn-diagrams)
3. [Section 3: Propositional Logic Semantics, Modeling & Connectives](#section-3-propositional-logic-semantics-modeling--connectives)
4. [Section 4: Formal Propositional Proof Systems (Fitch, INDO, & Resolution)](#section-4-formal-propositional-proof-systems-fitch-indo--resolution)
5. [Section 5: Semantic Countermodels & Meta-Logical Proofs](#section-5-semantic-countermodels--meta-logical-proofs)
6. [Section 6: Computational Argumentation Frameworks (Dung, Semantics, Proofs, & ASPIC+)](#section-6-computational-argumentation-frameworks-dung-semantics-proofs--aspic)

---

# Section 1: Natural Language Logic & Argument Analysis

---

### Detailed Theory & Concepts to Read First

#### 1. What Constitutes an Argument?
An **argument** in formal logic is not a dispute or disagreement. It is a structured group of declarative statements consisting of:
1. **Premises (Reasons / Evidence):** One or more statements that set forth reasons, evidence, or grounds.
2. **Conclusion:** Exactly one statement that is claimed to follow from, be supported by, or be implied by the premises.

#### 2. Recognizing Non-Arguments
A passage is **not** an argument if it lacks an inferential claim (the claim that one statement proves another):
* **Conditional Statements ("If $P$, then $Q$"):** A conditional statement expresses a single hypothetical relation between antecedent and consequent. Neither $P$ nor $Q$ is asserted as an actual fact. *Unless* accompanied by an asserted premise that satisfies the antecedent or denies the consequent, a solitary conditional is not an argument.
* **Recommendations / Advice / Exhortations:** Simply suggesting what someone should do without providing supportive factual evidence (e.g., *"You ought to get your house inspected"*) is not an argument.
* **Temporal / Causal Explanations:** Explanations account for *why* an accepted event happened (e.g., *"The storm broke because the pressure dropped"*), rather than proving *that* it happened.
* **Mere Conjunctions / Descriptive Reports:** Merely conjoining related factual statements with *"and"* or reporting a chronology of events without inference does not constitute an argument.

#### 3. Deductive vs. Inductive Arguments
* **Deductive Argument:** An argument where the arguer claims that it is **impossible** for the premises to be true while the conclusion is false. If the logic holds, the truth of the premises strictly guarantees the truth of the conclusion.
* **Inductive Argument:** An argument where the arguer claims only that the premises make the conclusion **probable** or **likely**, but not strictly certain. Inductive arguments include empirical generalizations, arguments by analogy, predictions, and appeals to authority.

#### 4. Suppressed (Implicit) Premises — Enthymemes
In natural language, speakers frequently omit premises that they assume are obvious, common knowledge, or accepted definitions. An argument with an unstated premise or conclusion is called an **enthymeme**.
To make an informal argument **deductively valid**, you must supply the minimal, logically necessary **suppressed premise** that bridges the gap between the stated premise and the conclusion.

#### 5. Nuances of Natural Language Logic
* **Boolean Conjunction vs. Relational "And":** The English word *"and"* is a propositional conjunction ($A \land B$) only when the sentence can be decomposed into two complete, independent sentences that can be evaluated for truth separately without altering the original meaning. If *"and"* connects individuals who participate jointly in a relational predicate (e.g., *"live together"*, *"played tennis together"*, *"are a couple"*), it cannot be split into a conjunction of propositions.
* **Propositional Negation ($\neg S$):** Expressing a sentence as $\neg S$ requires identifying the positive declarative kernel $S$ such that $\neg S$ is true if and only if $S$ is false. Beware of scope ambiguities:
  * Modal verbs: *"You may not go"* generally negates permission ($\neg[\text{permitted to go}]$).
  * Idiomatic phrases: *"I cannot recommend him too highly"* has an ambiguous scope: it can mean *"It is impossible to praise him sufficiently"* (high praise) or $\neg[\text{I can recommend him highly}]$ (low praise).
  * Universal/Existential interactions: *"All of his friends are not students"* in standard logic is ambiguous between $\forall x (F(x) \to \neg S(x))$ ("No friends are students") and $\neg \forall x (F(x) \to S(x)) \equiv \exists x (F(x) \land \neg S(x))$ ("Not all friends are students").

---

### Worked Examples with In-Depth Explanations

#### Example 1.1: Argument vs. Non-Argument Identification

##### 1.1.1: "Charles went bald, and most men go bald."
* **Answer:** **Not an argument.**
* **Explanation:** This is a compound declarative sentence joined by *"and"*. Neither statement acts as evidence to establish the truth of the other; it merely reports two independent observations.

##### 1.1.2: "Toward evening, clouds formed and the sky grew darker; then the storm broke."
* **Answer:** **Not an argument.**
* **Explanation:** This is a chronological, temporal narrative describing a sequence of events over time. The word *"then"* marks a temporal progression, not a logical inference.

##### 1.1.3: "If public education fails to improve the quality of instruction in both primary and secondary schools, then it is likely that it will lose additional students to the private sector in the years ahead."
* **Answer:** **Not an argument.**
* **Explanation:** This is a single conditional proposition of the form *"If $P$, then $Q$"*. The speaker does not assert that public education *has* failed, nor do they assert as an established fact that it *will* lose students.

##### 1.1.4: "Joe quit, because his boss was giving him so much grief."
* **Answer:** **An argument.**
* **Standard Form:**
  * Premise: Joe's boss was giving him so much grief.
  * Conclusion: Therefore, Joe quit.
* **Explanation:** The premise provides the causal reason offered to justify or substantiate the claim of why Joe quit.

---

#### Example 1.2: Classifying Arguments as Deductive or Inductive

##### 1.2.1: "Amoco, Exxon, and Texaco are all listed on the New York Stock Exchange. It must be the case that all major American oil companies are listed on the New York Stock Exchange."
* **Answer:** **Inductive.**
* **Explanation:** The argument moves from specific, finite instances (three observed oil companies) to a universal generalization encompassing *all* major American oil companies. Even though the word *"must"* is used, the reasoning is an inductive generalization; the truth of the premises does not guarantee that every unexamined major company is listed.

##### 1.2.2: "The longer a pendulum is, the longer it takes to swing. Therefore, when the pendulum of a clock is lengthened, the clock slows down."
* **Answer:** **Deductive.**
* **Explanation:** The conclusion follows by mathematical necessity from the physics relationship stated in the premise: if a lengthened pendulum takes more time to complete a swing, the period increases, which means the clock completes fewer cycles per hour, directly entailing that the clock slows down.

##### 1.2.3: "If Alexander the Great died from typhoid fever, then he became infected in India. Alexander the Great did die from typhoid fever. Therefore, he became infected in India."
* **Answer:** **Deductive.**
* **Explanation:** This argument adheres to the strict formal deductive rule of inference **Modus Ponens** ($P \to Q, P \vdash Q$). The validity depends on the structural form, leaving zero possibility for false conclusions given true premises.

---

#### Example 1.3: Supplying Suppressed Premises (Enthymemes)

##### 1.3.1: "You should drink raw cow’s milk, because it is natural and not processed."
* **Missing Premise Analysis:** The stated premise asserts a property of raw cow's milk: *"It is natural and not processed."* The conclusion recommends an action: *"You should drink raw cow's milk."* The logical link between the property and the normative recommendation is missing.
* **Complete Standard Form:**
  1. Stated Premise: Raw cow's milk is natural and not processed.
  2. **Suppressed Premise:** You should drink any milk (or beverage) that is natural and not processed.
  * $\therefore$ Conclusion: You should drink raw cow's milk.

##### 1.3.2: "$\triangle ABC$ is an equilateral triangle because it is an isosceles triangle and $\angle B = 60^\circ$."
* **Missing Premise Analysis:** Stated premises: $\triangle ABC$ has two equal sides/angles, and one angle is $60^\circ$. The conclusion asserts all three sides/angles are equal.
* **Complete Standard Form:**
  1. Stated Premise: $\triangle ABC$ is an isosceles triangle.
  2. Stated Premise: $\angle B = 60^\circ$.
  3. **Suppressed Premise (Geometric Axiom):** In Euclidean geometry, the sum of internal angles of any triangle is $180^\circ$ ($\angle A + \angle B + \angle C = 180^\circ$).
  4. **Suppressed Premise (Definition):** If an isosceles triangle has an angle of $60^\circ$, all three of its angles are equal to $60^\circ$, which makes it an equilateral triangle.
  * $\therefore$ Conclusion: $\triangle ABC$ is an equilateral triangle.

##### 1.3.3: "This language is not a regular language since otherwise the language $\{a^n b^n \mid n \in \mathbb{N}\}$ is regular as well."
* **Complete Standard Form:**
  1. Stated Premise: If this language were regular, then the language $L = \{a^n b^n \mid n \in \mathbb{N}\}$ would be regular.
  2. **Suppressed Premise (Formal Language Fact):** The language $L = \{a^n b^n \mid n \in \mathbb{N}\}$ is not regular (proven via the Pumping Lemma).
  * $\therefore$ Conclusion: This language is not a regular language (by Modus Tollens).

---

#### Example 1.4: Propositional Conjunctions vs. Relational Predicates
*Determine whether the word "and" expresses a propositional conjunction ($A \land B$):*

1. **"Susan and Alex are Americans."**
   * **Answer:** **Yes, it is a conjunction.**
   * **Explanation:** This can be decomposed into: *"Susan is an American"* $\land$ *"Alex is an American"*. The truth values are completely independent.
2. **"Susan and Alex live together."**
   * **Answer:** **No, it is not a conjunction.**
   * **Explanation:** *"Together"* is a relational predicate between Susan and Alex. Splitting this into *"Susan lives together"* and *"Alex lives together"* is ungrammatical and nonsense.
3. **"A Catholic priest married John and Mary."**
   * **Answer:** **No, it is not a conjunction.**
   * **Explanation:** The priest performed a single joint ceremony uniting both parties. It does not mean the priest married John, and the priest married Mary.

---

# Section 2: Categorical Logic & Syllogistic Venn Diagrams

---

### Detailed Theory & Concepts to Read First

#### 1. The Four Standard Forms of Categorical Propositions
Every standard categorical proposition relates a **Subject term ($S$)** to a **Predicate term ($P$)**:

| Type | Form Name | Standard Notation | Set Relation | Venn Diagram Shading / Marking |
| :---: | :---: | :---: | :---: | :---: |
| **A** | Universal Affirmative | All $S$ are $P$ | $S \subseteq P \iff S \setminus P = \emptyset$ | **Shade out** region $S \setminus P$ (region 1) |
| **E** | Universal Negative | No $S$ are $P$ | $S \cap P = \emptyset$ | **Shade out** region $S \cap P$ (region 2) |
| **I** | Particular Affirmative | Some $S$ are $P$ | $S \cap P \neq \emptyset$ | Place an asterisk ($*$) in region $S \cap P$ |
| **O** | Particular Negative | Some $S$ are not $P$ | $S \setminus P \neq \emptyset$ | Place an asterisk ($*$) in region $S \setminus P$ |

* **Shading Rule:** Shading an area signifies that the area is **empty** (contains no members).
* **Asterisk ($*$) Rule:** An asterisk asserts the **existence** of at least one entity in that region.

#### 2. Three-Circle Venn Diagram Partitioning
A categorical syllogism contains three terms:
* **$S$ (Minor Term):** Subject of the conclusion.
* **$P$ (Major Term):** Predicate of the conclusion.
* **$M$ (Middle Term):** Appears in both premises, but never in the conclusion.

```
                  Circle S           Circle P
                 /---------\       /---------\
                /     1     \     /     3     \
               |   S only    \---/   P only    |
               |             / 2 \             |
                \     4     / S∩P \     5     /
                 \---------+-------+---------/
                           |   7   |
                            \S∩P∩M/
                      \      \---/      /
                       \   6   |   8   /
                        \ S∩M  |  P∩M /
                         \-----+-----/
                          \    M    /
                           \-------/
                            Circle M
```

The 8 mutually exclusive regions are:
1. Region 1: $S \cap \overline{P} \cap \overline{M}$ ($S$ only)
2. Region 2: $S \cap P \cap \overline{M}$
3. Region 3: $\overline{S} \cap P \cap \overline{M}$ ($P$ only)
4. Region 4: $S \cap \overline{P} \cap M$
5. Region 5: $\overline{S} \cap P \cap M$
6. Region 6: $S \cap \overline{P} \cap M$ (Wait, looking at the center: Region 7 is $S \cap P \cap M$)
7. Region 7: $S \cap P \cap M$ (The central intersection of all three sets)
8. Region 8: $\overline{S} \cap \overline{P} \cap M$ ($M$ only)

#### 3. Execution Rules to Test Syllogisms
1. **Rule of Universal Priority:** Always diagram **universal premises (A and E)** before existential ones. Shading an entire region simplifies where an existential mark ($*$) may legally land.
2. **Rule of the Border Line:** When placing an asterisk for a particular premise (I or O), if an area is divided into two sub-regions and neither sub-region is shaded out, you **must place the asterisk directly on the boundary line** between the two sub-regions. This signifies that logic cannot confirm which of the two sub-compartments holds the entity.
3. **The Inspection Test:** Once both premises are completely drawn, **stop**. Inspect whether the conclusion is already unconditionally visible:
   * If the conclusion asserts a region is empty (A or E), check if that region is **completely shaded**.
   * If the conclusion asserts an entity exists (I or O), check if there is an asterisk situated **entirely inside** the required region (an asterisk on a border does not count as unconditionally inside).
   * If the diagram already forces the conclusion, the syllogism is **deductive (valid)**; if not, it is **invalid**.

---

### Worked Examples with In-Depth Explanations

#### Example 2.1: Detailed Syllogism Validity Proofs

##### 2.1.1: Test Argument:
$$\text{Premise 1: } \text{No } P \text{ is } M$$
$$\text{Premise 2: } \text{Some } S \text{ is } M$$
$$\therefore \text{Some } S \text{ is not } P$$

* **Step 1: Diagram Premise 1 ("No $P$ is $M$"):**
  * This is an **E-proposition**. The intersection $P \cap M$ must be completely empty.
  * **Action:** Completely shade Region 5 ($\overline{S} \cap P \cap M$) and Region 7 ($S \cap P \cap M$).
* **Step 2: Diagram Premise 2 ("Some $S$ is $M$"):**
  * This is an **I-proposition**. It asserts that an entity exists in $S \cap M$.
  * $S \cap M$ consists of two subregions: Region 4 ($S \cap M \cap \overline{P}$) and Region 7 ($S \cap M \cap P$).
  * Notice that Region 7 was already **shaded out** in Step 1.
  * Therefore, the entity cannot exist in Region 7. The asterisk must be placed exclusively in **Region 4**.
* **Step 3: Inspect the Conclusion ("Some $S$ is not $P$"):**
  * This **O-proposition** claims there is an asterisk inside the set $S$ that lies outside the set $P$ (i.e., inside $S \setminus P$, which comprises Regions 1 and 4).
  * We look at the diagram: Region 4 contains an unconditional asterisk. Region 4 is inside $S$ and strictly outside $P$.
* **Conclusion:** The argument is **Deductive (Valid)**.

---

##### 2.1.2: Test Argument:
$$\text{Premise 1: } \text{All } M \text{ is } P$$
$$\text{Premise 2: } \text{No } S \text{ is } M$$
$$\therefore \text{No } S \text{ is } P$$

* **Step 1: Diagram Premise 1 ("All $M$ is $P$"):**
  * Universal affirmative (A). The part of $M$ outside $P$ must be empty.
  * **Action:** Shade Region 4 ($S \cap M \cap \overline{P}$) and Region 8 ($\overline{S} \cap M \cap \overline{P}$).
* **Step 2: Diagram Premise 2 ("No $S$ is $M$"):**
  * Universal negative (E). The intersection $S \cap M$ must be empty.
  * $S \cap M$ consists of Region 4 and Region 7. Region 4 is already shaded.
  * **Action:** Shade Region 7 ($S \cap P \cap M$).
* **Step 3: Inspect the Conclusion ("No $S$ is $P$"):**
  * The conclusion requires that the entire intersection $S \cap P$ be empty (i.e., Region 2 and Region 7 must both be completely shaded).
  * We examine the diagram: Region 7 is shaded, but **Region 2 ($S \cap P \cap \overline{M}$) remains completely open/unshaded**.
  * The premises do not eliminate the possibility of an object being both $S$ and $P$ outside $M$.
* **Conclusion:** The argument is **Not Deductive (Invalid)**.

---

#### Example 2.2: Reading and Interpreting Given Venn Diagrams

```
                       S                   P
                    /-----\             /-----\
                   /   *   \           /       \
                  |    1    \---#####-/    3    |
                  |          /   2   \          |
                   \   4    / ####### \    5    /
                    \------+---+-------+-------/
                           | 7 |   8   |
                            \-/       /
                             \   6   /
                              \-----/
                                 M
```
*(Diagram specification: Region 2 and the entire circle $P$ outside $M$ are examined; assume Region 2 is shaded, an asterisk $*$ is in Region 1, and an asterisk $*$ is in Region 7).*

* **Analysis of Inferences:**
  * **Can we infer "Some $S$ is not $P$"?**
    * Yes: Region 1 has an asterisk, which is inside $S$ and strictly outside $P$.
  * **Can we infer "No $S$ is $P$"?**
    * No: There is an asterisk in Region 7, which belongs to both $S$ and $P$.
  * **Can we infer "All $S$ is $M$"?**
    * No: Region 1 contains an asterisk, which is an $S$ that is outside $M$.

---

# Section 3: Propositional Logic Semantics, Modeling & Connectives

---

### Detailed Theory & Concepts to Read First

#### 1. Truth Semantics and Model Sets
Let $\mathcal{I}$ be the set of all possible interpretations (truth assignments) over a set of propositional variables.
For any formula $\phi$, let:
$$M(\phi) = \{ i \in \mathcal{I} \mid i \models \phi \}$$
* $\phi$ is **valid (tautology)** $\iff M(\phi) = \mathcal{I}$.
* $\phi$ is **satisfiable** $\iff M(\phi) \neq \emptyset$.
* $\phi$ is **contingent** $\iff \emptyset \subset M(\phi) \subset \mathcal{I}$ (true in at least one row, false in at least one row).
* $\phi$ is **unsatisfiable (contradiction)** $\iff M(\phi) = \emptyset$.

#### 2. Logical Entailment ($\Delta \models \phi$)
A set of premises $\Delta = \{\psi_1, \dots, \psi_k\}$ **logically entails** a conclusion $\phi$ if and only if every truth assignment that makes all sentences in $\Delta$ true also makes $\phi$ true:
$$M(\Delta) = \bigcap_{j=1}^k M(\psi_j) \subseteq M(\phi)$$
If there exists even a single assignment $i$ such that $i \in M(\Delta)$ but $i \notin M(\phi)$, then $\Delta \not\models \phi$.

#### 3. Systematic Modeling of Combinatorial Problems as SAT
When translating real-world constraints into propositional logic:
* **At-least-one constraint:** For a variable requiring at least one of options $\{x_1, x_2, \dots, x_k\}$, write:
  $$x_1 \lor x_2 \lor \dots \lor x_k$$
* **At-most-one constraint:** To prevent multiple options from being true simultaneously, write pairwise mutual exclusion clauses:
  $$\bigwedge_{1 \le a < b \le k} (\neg x_a \lor \neg x_b)$$
* **Exactly-one constraint:** The conjunction of "at least one" and "at most one".
* **Conflict / Incompatibility constraint:** If option $x$ and option $y$ cannot both occur:
  $$\neg(x \land y) \equiv \neg x \lor \neg y$$

---

### Worked Examples with In-Depth Explanations

#### Example 3.1: Contingency and Validity Proofs

##### 3.1.1: Determine whether $(\neg p \lor \neg q) \to \neg p$ is valid, contingent, or unsatisfiable.
* **Truth Table Construction:**

| $p$ | $q$ | $\neg p$ | $\neg q$ | $\neg p \lor \neg q$ | $(\neg p \lor \neg q) \to \neg p$ |
| :-: | :-: | :------: | :------: | :------------------: | :-------------------------------: |
|  1  |  1  |    0     |    0     |          0           |               **1**               |
|  1  |  0  |    0     |    1     |          1           |               **0**               |
|  0  |  1  |    1     |    0     |          1           |               **1**               |
|  0  |  0  |    1     |    1     |          1           |               **1**               |

* **Explanation:** In row 2 ($p=1, q=0$), the antecedent $(\neg p \lor \neg q)$ is $1$, but the consequent $\neg p$ is $0$, making the conditional evaluate to $0$. In all other rows, it evaluates to $1$.
* **Classification:** Because it takes both truth values across different assignments, the formula is **contingent**.

---

##### 3.1.2: Determine whether $((p \to q) \lor (q \to p))$ is valid, contingent, or unsatisfiable.
* **Algebraic Semantic Proof:**
  * Recall that $p \to q \equiv \neg p \lor q$ and $q \to p \equiv \neg q \lor p$.
  * Thus:
    $$(p \to q) \lor (q \to p) \equiv (\neg p \lor q) \lor (\neg q \lor p) \equiv (\neg p \lor p) \lor (\neg q \lor q) \equiv 1 \lor 1 \equiv 1$$
* **Explanation:** Under every possible assignment, at least one of the implications must be true.
* **Classification:** The formula is **valid** (tautology).

---

#### Example 3.2: Complete Exam Timetabling Modeling as SAT

**Scenario:** We must schedule final exams for four courses: $\{c_1, c_2, c_3, c_4\}$ across two time slots: $\{m \text{ (morning)}, a \text{ (afternoon)}\}$.
Conflicts (students enrolled in both courses) exist on the edges of a 4-cycle:
$$(c_1, c_2), \quad (c_2, c_3), \quad (c_3, c_4), \quad (c_4, c_1)$$

```
             c1 ---------------- c2
              |                   |
              |                   |
             c4 ---------------- c3
```

##### Step 1: Define the Propositional Signature
For each course $c \in \{c_1, c_2, c_3, c_4\}$ and slot $t \in \{m, a\}$, create a boolean variable $c\text{-}t$.
$$\text{Variables} = \{c_1\text{-}m, c_1\text{-}a, c_2\text{-}m, c_2\text{-}a, c_3\text{-}m, c_3\text{-}a, c_4\text{-}m, c_4\text{-}a\}$$

##### Step 2: Formulate the Course Assignment Constraints ($F_{\text{assign}}$)
Each course must be assigned to **exactly one** slot:
1. $c_1$: $(c_1\text{-}m \lor c_1\text{-}a) \land (\neg c_1\text{-}m \lor \neg c_1\text{-}a)$
2. $c_2$: $(c_2\text{-}m \lor c_2\text{-}a) \land (\neg c_2\text{-}m \lor \neg c_2\text{-}a)$
3. $c_3$: $(c_3\text{-}m \lor c_3\text{-}a) \land (\neg c_3\text{-}m \lor \neg c_3\text{-}a)$
4. $c_4$: $(c_4\text{-}m \lor c_4\text{-}a) \land (\neg c_4\text{-}m \lor \neg c_4\text{-}a)$

##### Step 3: Formulate Conflict Constraints ($F_{\text{conflict}}$)
Two conflicting courses cannot be scheduled in the same time slot:
* For edge $(c_1, c_2)$:
  $(\neg c_1\text{-}m \lor \neg c_2\text{-}m) \land (\neg c_1\text{-}a \lor \neg c_2\text{-}a)$
* For edge $(c_2, c_3)$:
  $(\neg c_2\text{-}m \lor \neg c_3\text{-}m) \land (\neg c_2\text{-}a \lor \neg c_3\text{-}a)$
* For edge $(c_3, c_4)$:
  $(\neg c_3\text{-}m \lor \neg c_4\text{-}m) \land (\neg c_3\text{-}a \lor \neg c_4\text{-}a)$
* For edge $(c_4, c_1)$:
  $(\neg c_4\text{-}m \lor \neg c_1\text{-}m) \land (\neg c_4\text{-}a \lor \neg c_1\text{-}a)$

##### Step 4: Full Propositional Sentence
$$F = F_{\text{assign}} \land F_{\text{conflict}}$$

##### Step 5: Enumerate All Valid Solutions (Satisfying Assignments)
Graph 2-coloring on an even cycle has chromatic number $\chi = 2$, yielding exactly 2 solutions:
* **Solution 1:**
  $$c_1\text{-}m = 1, \quad c_3\text{-}m = 1, \quad c_2\text{-}a = 1, \quad c_4\text{-}a = 1$$
  (All others 0).
* **Solution 2:**
  $$c_1\text{-}a = 1, \quad c_3\text{-}a = 1, \quad c_2\text{-}m = 1, \quad c_4\text{-}m = 1$$
  (All others 0).

---

# Section 4: Formal Propositional Proof Systems (Fitch, INDO, & Resolution)

---

### Detailed Theory & Concepts to Read First

#### 1. Fitch-Style Natural Deduction
A Fitch proof organizes derivations into vertical subproofs denoted by bars:
* **Subproof Opening:** An assumption is introduced to test an antecedent or derive a contradiction.
* **Scope Lines:** Statements inside an indentation bar are accessible only within that specific scope.
* **Core Rules of Inference:**
  * **Implication Elimination ($\to E$ / Modus Ponens):** From $\phi \to \psi$ and $\phi$, derive $\psi$.
  * **Implication Introduction ($\to I$):** If by assuming $\phi$ as a subproof header you derive $\psi$, close the subproof and derive $\phi \to \psi$.
  * **Negation Introduction ($\neg I$ / RAA):** If by assuming $\phi$ you derive a contradiction (e.g., both $\psi$ and $\neg \psi$), derive $\neg \phi$.
  * **Reiteration ($R$):** Any formula active in an outer scope may be copied into an active inner subproof.
  * **Or-Elimination ($\lor E$ / Proof by Cases):** From $\phi \lor \psi$, $\phi \to \chi$, and $\psi \to \chi$, derive $\chi$.

#### 2. The Systematic INDO Clausal Transformation Procedure
Every propositional knowledge base can be reduced to a canonical set of CNF clauses via 4 deterministic stages:

```
[ Formula ] ---> [ I: Implications Out ] ---> [ N: Negations In ] ---> [ D: Distribution ] ---> [ O: Operators Out ] ---> [ Clausal Form ]
```

* **Stage I (Implications Out):**
  * $A \to B \implies \neg A \lor B$
  * $A \leftarrow B \implies A \lor \neg B$
  * $A \leftrightarrow B \implies (\neg A \lor B) \land (\neg B \lor A)$
* **Stage N (Negations In - De Morgan & Double Negation):**
  * $\neg(A \land B) \implies \neg A \lor \neg B$
  * $\neg(A \lor B) \implies \neg A \land \neg B$
  * $\neg(\neg A) \implies A$
* **Stage D (Distribution):**
  * Distribute disjunction over conjunction: $A \lor (B \land C) \implies (A \lor B) \land (A \lor C)$.
  * Associativity: $A \lor (B \lor C) \implies A \lor B \lor C$.
* **Stage O (Operators Out):**
  * Replace the outer conjunction symbols with commas to form a set of clauses:
    $$(L_1 \lor L_2) \land (L_3 \lor L_4 \lor L_5) \implies \{ \{L_1, L_2\}, \{L_3, L_4, L_5\} \}$$

#### 3. Propositional Resolution Refutation
Resolution is a sound and complete refutation system operating on clauses.
* **Resolution Inference Rule:**
  $$\frac{\{C_1, \ell\}, \quad \{C_2, \neg \ell\}}{\{C_1 \cup C_2\}}$$
  Where $\ell$ and $\neg \ell$ are complementary literals. The resulting clause is the **resolvent**.
* **Proving $\Delta \models \phi$:**
  1. Convert all premises in $\Delta$ into a set of clauses $\mathcal{S}_\Delta$.
  2. Negate the goal formula: $\neg \phi$. Convert $\neg \phi$ into a set of clauses $\mathcal{S}_{\neg \phi}$.
  3. Form the unified clausal set: $\mathcal{S} = \mathcal{S}_\Delta \cup \mathcal{S}_{\neg \phi}$.
  4. Systematically resolve pairs of clauses containing complementary literals.
  5. If the **empty clause $\{\}$ (or $\square$)** is derived, the set is unsatisfiable, which proves $\Delta \models \phi$.

---

### Worked Examples with In-Depth Explanations

#### Example 4.1: Complex Fitch Proofs

##### 4.1.1: Prove that $\vdash p \to (q \to p)$ is valid.
```
| 1.  p                  Assumption
| | 2.  q                Assumption
| | 3.  p                Reiteration: 1
| 4.  q -> p             Implication Introduction: 2, 3
5.  p -> (q -> p)        Implication Introduction: 1, 4
```
* **Explanation:** We assume $p$ at level 1. Within this assumption, we open a second assumption $q$ at level 2. We reiterate $p$ inside level 2. Discharging the inner assumption gives $q \to p$. Discharging the outer assumption gives the final theorem $p \to (q \to p)$.

---

##### 4.1.2: Prove $p \to r$ from premises $\{p \to q, \; q \leftrightarrow r\}$.
```
1.  p -> q               Premise
2.  q <-> r              Premise
3.  q -> r               Biconditional Elimination: 2
| 4.  p                  Assumption
| 5.  q                  Implication Elimination (Modus Ponens): 1, 4
| 6.  r                  Implication Elimination (Modus Ponens): 3, 5
7.  p -> r               Implication Introduction: 4, 6
```
* **Explanation:** Premise 2 unrolls into two directional implications: $q \to r$ and $r \to q$. We select $q \to r$ at line 3. To prove the conditional $p \to r$, we assume $p$ at line 4. Modus Ponens on line 1 and 4 yields $q$. Modus Ponens on line 3 and 5 yields $r$. Discharging the subproof yields $p \to r$.

---

#### Example 4.2: Step-by-Step INDO Clausal Conversions

##### 4.2.1: Convert $(r \land s) \leftarrow (p \lor q \lor k)$ into clausal form.
* **Step I (Implications Out):**
  Recall that $A \leftarrow B \equiv A \lor \neg B$. Here $A = (r \land s)$ and $B = (p \lor q \lor k)$:
  $$(r \land s) \lor \neg(p \lor q \lor k)$$
* **Step N (Negations In):**
  Apply De Morgan's laws to push $\neg$ across the disjunction:
  $$(r \land s) \lor (\neg p \land \neg q \land \neg k)$$
* **Step D (Distribution):**
  Let $X = (\neg p \land \neg q \land \neg k)$. We distribute $X$ over $(r \land s)$:
  $$(r \lor X) \land (s \lor X)$$
  Now expand $X$ back into each conjunct:
  * First conjunct: $r \lor (\neg p \land \neg q \land \neg k) \equiv (r \lor \neg p) \land (r \lor \neg q) \land (r \lor \neg k)$
  * Second conjunct: $s \lor (\neg p \land \neg q \land \neg k) \equiv (s \lor \neg p) \land (s \lor \neg q) \land (s \lor \neg k)$
  Multiplying out gives 6 conjuncts in CNF:
  $$(r \lor \neg p) \land (r \lor \neg q) \land (r \lor \neg k) \land (s \lor \neg p) \land (s \lor \neg q) \land (s \lor \neg k)$$
* **Step O (Clausal Set Output):**
  $$\{ \{\neg p, r\}, \; \{\neg q, r\}, \; \{\neg k, r\}, \; \{\neg p, s\}, \; \{\neg q, s\}, \; \{\neg k, s\} \}$$

---

##### 4.2.2: Convert $(p \lor q \lor r) \to q$ into clausal form.
* **Step I (Implications Out):**
  $$\neg(p \lor q \lor r) \lor q$$
* **Step N (Negations In):**
  $$(\neg p \land \neg q \land \neg r) \lor q$$
* **Step D (Distribution):**
  Distribute $q$ over each conjunct:
  $$(\neg p \lor q) \land (\neg q \lor q) \land (\neg r \lor q)$$
* **Step O (Clausal Set Output):**
  $$\{ \{\neg p, q\}, \; \{\neg q, q\}, \; \{\neg r, q\} \}$$
  *(Note: $\{\neg q, q\}$ is a tautology and can be pruned during optimization, but strictly following INDO retains all clauses).*

---

#### Example 4.3: Resolution Refutation Proofs

##### 4.3.1: Derive the Empty Clause from:
$$\Delta = \{ \{p, q, k\}, \; \{\neg p, r\}, \; \{\neg p, \neg r\}, \; \{p, \neg q\}, \; \{\neg k, l\}, \; \{\neg l\} \}$$

* **Resolution Refutation Table:**

| Step Number | Generated Clause | Parent Clause 1 | Parent Clause 2 | Resolved Atom |
| :---: | :---: | :---: | :---: | :---: |
| 1 | $\{p, q, k\}$ | Premise | — | — |
| 2 | $\{\neg p, r\}$ | Premise | — | — |
| 3 | $\{\neg p, \neg r\}$ | Premise | — | — |
| 4 | $\{p, \neg q\}$ | Premise | — | — |
| 5 | $\{\neg k, l\}$ | Premise | — | — |
| 6 | $\{\neg l\}$ | Premise | — | — |
| 7 | $\{\neg k\}$ | Clause 5 | Clause 6 | $l$ |
| 8 | $\{p, q\}$ | Clause 1 | Clause 7 | $k$ |
| 9 | $\{p\}$ | Clause 4 | Clause 8 | $q$ |
| 10 | $\{\neg p\}$ | Clause 2 | Clause 3 | $r$ |
| **11** | **$\{\}$ (Empty Clause)** | **Clause 9** | **Clause 10** | **$p$** |

* **Conclusion:** The empty clause is derived. $\Delta$ is unsatisfiable.

---

# Section 5: Semantic Countermodels & Meta-Logical Proofs

---

### Detailed Theory & Concepts to Read First

#### 1. Constructing Countermodels for Invalid Arguments
To prove that an argument is **not deductive**, you do not use proof rules. Instead, you construct an explicit **semantic valuation (truth assignment)** $v$ that serves as a counterexample:
1. Identify the conclusion. Set its truth value to **False**: $v(\text{Conclusion}) = 0$.
2. For a conditional conclusion $A \to B$, setting $v(A \to B) = 0$ forces $v(A) = 1$ and $v(B) = 0$.
3. For a disjunctive conclusion $A \lor B$, setting $v(A \lor B) = 0$ forces $v(A) = 0$ and $v(B) = 0$.
4. Substitute these fixed truth values back into all premises.
5. Solve for remaining variables to ensure **every single premise evaluates to True ($1$)**.
6. If such an assignment exists, it forms a **countermodel**, proving the argument is not deductive.

#### 2. Meta-Theoretic Proofs by Contradiction
When an argument contains generalized schema expressions (with arbitrary $k, l, m, n$ conjunctions and disjunctions), you cannot build a finite truth table. Instead, you write a **meta-logical proof by contradiction**:
1. Assume the argument is invalid $\implies$ there exists a truth assignment $v$ where all premises evaluate to $1$ and the conclusion evaluates to $0$.
2. Deconstruct the false conclusion:
   * A conditional $P_{\text{big}} \to Q_{\text{big}} = 0$ strictly means $v(P_{\text{big}}) = 1$ and $v(Q_{\text{big}}) = 0$.
   * Conjunction $P_1 \land \dots \land P_k = 1 \implies v(P_i) = 1$ for all $i$.
   * Disjunction $Q_1 \lor \dots \lor Q_l = 0 \implies v(Q_j) = 0$ for all $j$.
3. Partition the proof into exhaustive cases based on connecting linking variables (e.g., $P_1 \leftrightarrow S_1$).
4. Show that each case forces at least one premise to evaluate to $0$.
5. Conclude that no such assignment exists, meaning the argument schema is valid.

---

### Worked Examples with In-Depth Explanations

#### Example 5.1: Finding Countermodels for Non-Deductive Arguments

##### 5.1.1: Evaluate:
$$\text{Premise 1: } q \to r$$
$$\therefore \text{Conclusion: } p \to (q \lor r)$$

* **Step 1: Make the conclusion False:**
  $$v(p \to (q \lor r)) = \text{False} \iff v(p) = \text{True} \quad \text{and} \quad v(q \lor r) = \text{False}$$
  $$v(q \lor r) = \text{False} \iff v(q) = \text{False} \quad \text{and} \quad v(r) = \text{False}$$
* **Step 2: Check Premise 1 with these values:**
  Premise 1 is $q \to r$.
  Substitute $v(q) = \text{False}$ and $v(r) = \text{False}$:
  $$v(q \to r) = \text{False} \to \text{False} = \text{True}$$
  Premise 1 is satisfied.
* **Countermodel:**
  $$\{ p \mapsto \text{True}, \; q \mapsto \text{False}, \; r \mapsto \text{False} \}$$
* **Conclusion:** The argument is **not deductive**.

---

##### 5.1.2: Evaluate:
$$\text{Premise 1: } p \to (q \lor r)$$
$$\therefore \text{Conclusion: } p \to r$$

* **Step 1: Force Conclusion to be False:**
  $$v(p \to r) = \text{False} \implies v(p) = \text{True}, \quad v(r) = \text{False}$$
* **Step 2: Force Premise 1 to be True:**
  $$v(p \to (q \lor r)) = \text{True}$$
  Since $v(p) = \text{True}$, we must have $v(q \lor r) = \text{True}$.
  Since $v(r) = \text{False}$, this requires $v(q) = \text{True}$.
* **Countermodel:**
  $$\{ p \mapsto \text{True}, \; q \mapsto \text{True}, \; r \mapsto \text{False} \}$$
  Under this assignment, Premise 1 evaluates to $\text{True} \to (\text{True} \lor \text{False}) = \text{True}$, while the conclusion evaluates to $\text{True} \to \text{False} = \text{False}$.
* **Conclusion:** The argument is **not deductive**.

---

#### Example 5.2: Rigorous Meta-Proof of Deductive Validity

##### Problem Statement:
Prove deductively that the following schema holds for any positive integers $k, l, m, n$:
$$\text{Premise 1: } P_1 \land \dots \land P_k \to Q_1 \lor \dots \lor Q_l$$
$$\text{Premise 2: } R_1 \land \dots \land R_m \to S_1 \lor \dots \lor S_n$$
$$\therefore P_1 \land \dots \land P_k \land R_1 \land \dots \land R_m \to Q_1 \lor \dots \lor Q_l \lor S_1 \lor \dots \lor S_n$$

##### Proof:
1. Assume for contradiction that the argument is **not** deductive.
2. Then there exists a truth valuation $v$ that satisfies both premises ($v(\text{Premise 1}) = 1$ and $v(\text{Premise 2}) = 1$), but makes the conclusion **False**:
   $$v\Big( (P_1 \land \dots \land P_k \land R_1 \land \dots \land R_m) \to (Q_1 \lor \dots \lor Q_l \lor S_1 \lor \dots \lor S_n) \Big) = 0$$
3. By truth semantics of implication, this requires:
   * **Antecedent is True:**
     $$v(P_1 \land \dots \land P_k \land R_1 \land \dots \land R_m) = 1$$
     $$\implies v(P_1) = \dots = v(P_k) = 1 \quad \text{and} \quad v(R_1) = \dots = v(R_m) = 1$$
   * **Consequent is False:**
     $$v(Q_1 \lor \dots \lor Q_l \lor S_1 \lor \dots \lor S_n) = 0$$
     $$\implies v(Q_1) = \dots = v(Q_l) = 0 \quad \text{and} \quad v(S_1) = \dots = v(S_n) = 0$$
4. Now, evaluate Premise 1 under $v$:
   * Its antecedent is $P_1 \land \dots \land P_k$. Since $v(P_i) = 1$ for all $i \in \{1, \dots, k\}$, the antecedent is $1$.
   * Its consequent is $Q_1 \lor \dots \lor Q_l$. Since $v(Q_j) = 0$ for all $j \in \{1, \dots, l\}$, the consequent is $0$.
   * Therefore, $v(\text{Premise 1}) = 1 \to 0 = 0$.
5. This directly contradicts our initial condition that $v(\text{Premise 1}) = 1$.
6. Therefore, no such falsifying assignment $v$ exists. The argument is **deductive**. $\blacksquare$

---

# Section 6: Computational Argumentation Frameworks (Dung, Semantics, Proofs, & ASPIC+)

---

### Detailed Theory & Concepts to Read First

#### 1. Dung's Abstract Argumentation Semantics
Let $\mathcal{F} = (AR, Att)$ be an abstract argumentation framework where $AR$ is a set of arguments and $Att \subseteq AR \times AR$ is the attack relation.
* Let $S \subseteq AR$:
  * $S$ is **conflict-free** iff $\forall A, B \in S, \; (A, B) \notin Att$.
  * $S$ **defends** $A \in AR$ iff $\forall B \in AR$ such that $(B, A) \in Att$, $\exists C \in S$ such that $(C, B) \in Att$.
  * Characteristic Function $f: 2^{AR} \to 2^{AR}$:
    $$f(S) = \{ A \in AR \mid S \text{ defends } A \}$$
* **Admissible Extension:** Conflict-free and $S \subseteq f(S)$ (defends every argument it contains).
* **Complete Extension:** Conflict-free and $S = f(S)$ (defends all its elements and contains all elements it defends).
* **Grounded Extension ($GE$):** The least fixed point of $f$. It is unique and can be obtained by computing:
  $$f^0(\emptyset) = \emptyset, \quad f^1(\emptyset) = f(\emptyset), \quad f^{k+1}(\emptyset) = f(f^k(\emptyset)), \quad GE = \bigcup_{k=0}^\infty f^k(\emptyset)$$
* **Preferred Extension:** A maximal (with respect to set inclusion $\subseteq$) admissible extension.
* **Stable Extension:** A conflict-free set $S$ that attacks every argument not in $S$:
  $$\forall Y \in AR \setminus S, \; \exists X \in S \text{ such that } (X, Y) \in Att$$

#### 2. Acceptance Status of Arguments
* **Admissibly Accepted:** An argument $A$ is admissibly accepted iff $A$ belongs to **at least one** admissible extension.
* **Groundedly Accepted:** An argument $A$ is groundedly accepted iff $A \in GE$.

#### 3. Structured Argumentation (ASPIC+)
Unlike abstract frameworks where arguments are atomic black boxes, structured argumentation systems (like ASPIC+) build arguments from:
* **Premises / Axioms:** Facts $\mathcal{K}_p$ (ordinary premises that can be attacked) and $\mathcal{K}_n$ (axioms that cannot be attacked).
* **Defeasible Rules ($\Rightarrow$):** Rules that create presumptive conclusions subject to defeat.
* **Strict Rules ($\rightarrow$):** Deductive inference rules that cannot be defeated.
* **Three Modes of Attack:**
  1. **Undermining:** Attacking an ordinary defeasible premise.
  2. **Rebutting:** Attacking the defeasible conclusion of another argument by deriving its contrary.
  3. **Undercutting:** Attacking the applicability of a defeasible rule itself by asserting that the rule's inference is invalid in this case.

---

### Worked Examples with In-Depth Explanations

#### Example 6.1: Step-by-Step Graph Computations

##### 6.1.1: 3-Cycle Framework
Let $AR = \{A_1, A_2, A_3\}$ and $Att = \{(A_1, A_2), (A_2, A_3), (A_3, A_1)\}$.

```
             A1 ----------> A2
              ^             |
               \           /
                \-- A3 <--/
```

* **Step 1: Conflict-free sets:**
  * Singletons: $\{A_1\}, \{A_2\}, \{A_3\}$ are conflict-free.
  * Pairs: $(A_1, A_2) \in Att \implies \{A_1, A_2\}$ has conflict. Similarly, $\{A_2, A_3\}$ and $\{A_1, A_3\}$ have conflicts.
  * $\emptyset$ is conflict-free.
  * List: $\emptyset, \{A_1\}, \{A_2\}, \{A_3\}$.
* **Step 2: Check admissibility for singletons:**
  * For $\{A_1\}$: Attacked by $A_3$. To defend against $A_3$, $\{A_1\}$ must contain an argument that attacks $A_3$. The only attacker of $A_3$ is $A_2$, but $A_2 \notin \{A_1\}$. Hence, $\{A_1\}$ **cannot defend itself**.
  * By symmetry, $\{A_2\}$ and $\{A_3\}$ also fail to defend themselves.
  * For $\emptyset$: Defends all its elements vacuously.
  * **All Admissible Extensions:** $\{\emptyset\}$.
* **Step 3: Compute $GE$:**
  * $f^1(\emptyset)$: Arguments with zero attackers. Every node has an incoming attack edge.
  * $f^1(\emptyset) = \emptyset \implies GE = \emptyset$.
* **Step 4: Acceptance Status:**
  * Admissibly accepted: **None**.
  * Groundedly accepted: **None**.

---

##### 6.1.2: Asymmetric 4-Node Graph with Self-Loop
Let $AR = \{A_1, A_2, A_3, A_4\}$ and $Att = \{(A_2, A_1), (A_1, A_3), (A_2, A_2)\}$.

```
             (A2 self-loop)
               |
               v
              A1 ----------> A3          A4 (isolated)
```

* **Step 1: Evaluate Isolated Node $A_4$:**
  $A_4$ has no incoming and no outgoing attacks. It is completely unconstrained.
* **Step 2: Evaluate $A_2$:**
  $(A_2, A_2) \in Att$. $A_2$ attacks itself, so $A_2$ can **never** belong to any conflict-free or admissible set.
* **Step 3: Evaluate $A_1$:**
  $A_1$ is attacked by $A_2$. Can any conflict-free set defend $A_1$?
  The only attacker of $A_2$ is $A_2$ itself. But $A_2$ cannot be in any conflict-free set.
  Thus, no conflict-free set can ever defend $A_1$ against $A_2$.
  Therefore, $A_1$ can **never** belong to any admissible extension!
* **Step 4: Evaluate $A_3$:**
  $A_3$ is attacked by $A_1$. Can $A_3$ be defended?
  To defend $A_3$, a set must contain an attacker of $A_1$, which is $A_2$.
  Since $A_2$ cannot be in any conflict-free set, no conflict-free set can defend $A_3$.
  Thus, $A_3$ can never belong to any admissible extension.
* **Step 5: Admissible Extensions:**
  Since $A_1, A_2, A_3$ can never be defended by an admissible set, only $A_4$ remains.
  $A_4$ has no attackers, so it defends itself vacuously.
  Admissible extensions:
  $$\emptyset, \quad \{A_4\}$$
* **Step 6: Number of Admissibly Accepted Arguments:**
  Only $A_4$ belongs to an admissible extension.
  **Answer:** Exactly **1** argument ($A_4$).

---

#### Example 6.2: Infinite Frameworks and Counting Admissible Sets

##### Problem Statement:
Let $\mathcal{F} = (AR, Att)$ be an infinite framework where:
$$AR = \{A_0, A_1, A_2, A_3, \dots \} = \{A_i \mid i \in \mathbb{N}\}$$
$$Att = \{(A_{i+1}, A_i) \mid i \ge 0\}$$

```
... ------> A4 ------> A3 ------> A2 ------> A1 ------> A0
```

*Determine how many admissible extensions $\mathcal{F}$ has.*

##### Step-by-Step Analysis:
1. **Understand Attacks:** Each $A_i$ is attacked by $A_{i+1}$. There are no base nodes (every node has an incoming attack from the next higher index).
2. **Examine Finite Sets:**
   * Consider any non-empty finite set $S \subset AR$.
   * Let $A_m$ be the argument in $S$ with the **maximum index** $m$.
   * $A_m$ is attacked by $A_{m+1}$.
   * To defend $A_m$, $S$ must contain an argument that attacks $A_{m+1}$.
   * The only argument that attacks $A_{m+1}$ is $A_{m+2}$.
   * But $m+2 > m$, which contradicts the assumption that $m$ was the maximum index in $S$!
   * Therefore, **no non-empty finite set can ever be admissible**.
3. **Examine Infinite Sets:**
   * Can an infinite set defend itself?
   * To defend $A_0$, we must include $A_2$ (attacks $A_1$).
   * To defend $A_2$, we must include $A_4$ (attacks $A_3$).
   * By induction, the infinite set of all even indices is:
     $$S_{\text{even}} = \{A_0, A_2, A_4, A_6, \dots \} = \{A_{2k} \mid k \in \mathbb{N}\}$$
   * **Is $S_{\text{even}}$ conflict-free?**
     Yes, because $(A_i, A_j) \in Att \iff i = j+1$, which requires one even and one odd index. Since $S_{\text{even}}$ contains only even numbers, no two elements can attack each other.
   * **Does $S_{\text{even}}$ defend all its elements?**
     For every $A_{2k} \in S_{\text{even}}$, its sole attacker is $A_{2k+1}$.
     The argument $A_{2k+2} \in S_{\text{even}}$ directly attacks $A_{2k+1}$.
     Therefore, $S_{\text{even}}$ defends every element it contains!
   * Thus, $S_{\text{even}}$ is an **admissible extension**.
4. **What about odd indices?**
   * Consider $S_{\text{odd}} = \{A_1, A_3, A_5, \dots \} = \{A_{2k+1} \mid k \in \mathbb{N}\}$.
   * Every $A_{2k+1}$ is attacked by $A_{2k+2}$, which in turn is attacked by $A_{2k+3} \in S_{\text{odd}}$.
   * $S_{\text{odd}}$ is conflict-free and defends all its elements.
   * Thus, $S_{\text{odd}}$ is also an **admissible extension**!
5. **What about shifted infinite sets?**
   * Notice that for any fixed $m \ge 0$, the set:
     $$S_m = \{A_{m + 2k} \mid k \in \mathbb{N}\}$$
     is conflict-free and defends all its elements.
   * For each starting integer $m$, we get an admissible set (with $S_0 = S_{\text{even}}$ and $S_1 = S_{\text{odd}}$, $S_2 \subset S_0$, etc.).
   * Since there are infinitely many such subsets (and $\emptyset$), the framework has **infinitely many admissible extensions**.
* **Exam Multiple Choice Conclusion:** Select **"None of the above"** (if the given choices are 1, 2, 3, 4).

---

#### Example 6.3: Formal Mathematical Proof of the Grounded Soundness Lemma

##### Theorem:
In any abstract argumentation framework $\mathcal{F} = (AR, Att)$, if $A \in AR$ is attacked by the grounded extension $GE$, then $A$ cannot belong to any admissible extension.

##### Complete Inductive Proof:
Let $GE = \bigcup_{i=0}^\infty f^i(\emptyset)$, where $f^0(\emptyset) = \emptyset$ and $f^{i+1}(\emptyset) = f(f^i(\emptyset))$.

**Core Lemma:** If $E$ is an admissible extension, then for all integers $i \ge 0$, $E$ does not attack any argument in $f^i(\emptyset)$ (i.e., there do not exist $X \in E$ and $Y \in f^i(\emptyset)$ such that $(X, Y) \in Att$).

* **Proof of Lemma by Mathematical Induction on $i$:**
  * **Base Case ($i = 0$):**
    $f^0(\emptyset) = \emptyset$. Since $\emptyset$ contains no elements, $E$ cannot attack any argument in $f^0(\emptyset)$. The claim holds vacuously.
  * **Inductive Hypothesis ($i = k$):**
    Assume that $E$ does not attack any argument in $f^k(\emptyset)$.
  * **Inductive Step ($i = k + 1$):**
    We must show that $E$ does not attack any argument in $f^{k+1}(\emptyset)$.
    Suppose for contradiction that $E$ does attack some argument $Y \in f^{k+1}(\emptyset)$.
    1. This means there exists some $X \in E$ such that $(X, Y) \in Att$.
    2. Recall that $f^{k+1}(\emptyset) = f(f^k(\emptyset))$. By definition of the characteristic function $f$, the set $f^k(\emptyset)$ defends $Y$ against all incoming attacks.
    3. Because $(X, Y) \in Att$, $f^k(\emptyset)$ must defend $Y$ against $X$.
    4. Therefore, there must exist some argument $Z \in f^k(\emptyset)$ such that $(Z, X) \in Att$ (i.e., $Z$ attacks $X$).
    5. Now look at $E$: $E$ is an admissible extension, and $X \in E$.
    6. By definition of admissibility, $E$ must defend all of its elements against all attacks.
    7. Since $Z$ attacks $X \in E$, $E$ must attack $Z$.
    8. But $Z \in f^k(\emptyset)$! This implies that $E$ attacks an argument in $f^k(\emptyset)$.
    9. This directly contradicts the Induction Hypothesis that $E$ does not attack any argument in $f^k(\emptyset)$.
    10. Hence, the assumption that $E$ attacks an argument in $f^{k+1}(\emptyset)$ must be false.
    By mathematical induction, the Lemma is proven for all $i \ge 0$.

* **Completing the Main Theorem:**
  1. Suppose an argument $A \in AR$ is attacked by some argument $G \in GE$.
  2. Because $GE = \bigcup_{i=0}^\infty f^i(\emptyset)$, there exists a finite integer $m$ such that $G \in f^m(\emptyset)$.
  3. Now suppose for contradiction that $A$ belongs to an admissible extension $E$ ($A \in E$).
  4. Since $G$ attacks $A \in E$, and $E$ is an admissible extension, $E$ must defend $A$ against $G$.
  5. Defending $A$ against $G$ requires that $E$ attack $G$.
  6. But $G \in f^m(\emptyset)$, which means $E$ attacks an argument in $f^m(\emptyset)$.
  7. This contradicts our proven Lemma!
  8. Therefore, $A$ cannot belong to any admissible extension. $\blacksquare$

---

#### Example 6.4: The Barber Paradox as an Argumentation Framework

##### Problem Setup:
In a town, the barber shaves all persons, and only those persons, who do not shave themselves.
* **Argument A:** Assume the barber shaves himself. The rule says the barber shaves only those who do not shave themselves $\implies$ the barber does not shave himself.
* **Argument B:** Assume the barber does not shave himself. The rule says the barber shaves all those who do not shave themselves $\implies$ the barber shaves himself.

##### Formal Analysis:
1. **Standard Form Translation:**
   * **Argument A:**
     * Premise 1: If person $X$ shaves himself, the barber does not shave $X$.
     * Premise 2 (Assumption): The barber shaves himself.
     * $\therefore$ Conclusion: The barber does not shave himself.
   * **Argument B:**
     * Premise 1: If person $X$ does not shave himself, the barber shaves $X$.
     * Premise 2 (Assumption): The barber does not shave himself.
     * $\therefore$ Conclusion: The barber shaves himself.
2. **Identification of Attacks:**
   * **Rebutting Attacks:**
     * The conclusion of $A$ ("The barber does not shave himself") directly contradicts the conclusion of $B$ ("The barber shaves himself").
     * Hence, $A$ and $B$ **mutually rebut** each other: $(A, B) \in Att$ and $(B, A) \in Att$.
   * **Undermining Attacks:**
     * The conclusion of $A$ ("The barber does not shave himself") directly contradicts Premise 2 of $A$ itself ("The barber shaves himself").
     * Thus, $A$ contradicts its own starting premise $\implies$ **$A$ undermines itself** ($(A, A) \in Att$).
     * The conclusion of $B$ ("The barber shaves himself") directly contradicts Premise 2 of $B$ itself ("The barber does not shave himself").
     * Thus, **$B$ undermines itself** ($(B, B) \in Att$).
3. **Resulting Argumentation Framework:**
   $$AR = \{A, B\}$$
   $$Att = \{(A, A), \; (A, B), \; (B, A), \; (B, B)\}$$
4. **Semantics Evaluation:**
   * Neither $A$ nor $B$ can belong to any conflict-free set because both are self-attacking.
   * The only conflict-free set is $\emptyset$.
   * Admissible extensions: $\{\emptyset\}$.
   * Grounded extension: $GE = \emptyset$.
   * Preferred extensions: $\{\emptyset\}$.
   * Stable extensions: **None** ($\emptyset$ does not attack $A$ or $B$).

---

## Final Exam Synthesis & Verification Checklist

Before submitting an exam script, verify solutions against these mathematical invariants:

* [ ] **Syllogisms:** Did you shade universal premises **before** placing existential asterisks? Did you place asterisks on **border lines** whenever subregions are unshaded?
* [ ] **SAT Modeling:** Did you include **both** the "at least one" clause ($x_1 \lor x_2$) **and** the "at most one" clause $(\neg x_1 \lor \neg x_2)$ for each course or entity?
* [ ] **Fitch Deduction:** Did you double-check that all assumptions opened inside subproofs are **closed** before concluding the final formula?
* [ ] **INDO:** Did you push negations all the way inside literals before distributing disjunctions over conjunctions?
* [ ] **Resolution:** Did you remember that resolving $\{p\}$ and $\{\neg p\}$ yields the **empty clause $\{\}$** and confirms validity by refuting the negated goal?
* [ ] **Dung Semantics:**
  * Is every admissible set **strictly conflict-free**?
  * Does the grounded extension contain **only** arguments defended from the base of unattacked nodes?
  * Remember: A self-attacking node $(A, A) \in Att$ can **never** be in any conflict-free set, admissible extension, or stable extension!