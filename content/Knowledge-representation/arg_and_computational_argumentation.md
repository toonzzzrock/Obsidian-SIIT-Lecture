# Arguments & Propositions in Natural Language, and Computational Argumentation

Cropped from full_02.md (Sections 1 and 6).

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

# Section 6: Computational Argumentation Frameworks (Dung, Semantics, Proofs, & ASPIC+)

---

### Detailed Theory & Concepts to Read First

This section builds every definition up from scratch, with a small toy graph worked step by step for each concept. Read it top to bottom; each definition reuses the vocabulary from the one before it.

#### 0. Setup: what a framework is
An abstract argumentation framework is a directed graph $\mathcal{F} = (AR, Att)$:
* $AR$ = the set of arguments (think of them as opaque boxes — you don't care what's inside them, only who attacks whom).
* $Att \subseteq AR \times AR$ = the attack relation. $(X, Y) \in Att$ reads "$X$ attacks $Y$", drawn as an arrow $X \to Y$.

**Running example (used for every definition below):** $AR = \{A, B, C\}$, $Att = \{(A,B), (B,C), (C,A)\}$ — a directed 3-cycle: $A \to B \to C \to A$.

```
      A ----------> B
      ^             |
       \           /
        \-- C <---/
```

#### 1. Conflict-free — "no infighting inside the set"
A set $S \subseteq AR$ is **conflict-free** iff no member of $S$ attacks another member of $S$:
$$S \text{ is conflict-free} \iff \forall X, Y \in S,\; (X,Y) \notin Att$$
Plain-English check: pick every pair of arguments inside $S$ (including a member against itself); if any pair has an arrow between them, $S$ fails.

*Worked example on the 3-cycle:*
* $\{A, B\}$: is $(A,B) \in Att$? Yes. **Not conflict-free.**
* $\{A, C\}$: is $(C,A) \in Att$? Yes. **Not conflict-free.**
* $\{A\}$: no pair to check (only one element, and $(A,A) \notin Att$). **Conflict-free.**
* $\{A, B, C\}$: already fails via $(A,B)$. **Not conflict-free.**
* $\emptyset$: vacuously true (no pairs exist). **Conflict-free.**

So the full list of conflict-free subsets of the 3-cycle is $\{\emptyset, \{A\}, \{B\}, \{C\}\}$ — every singleton survives, but no pair does, because the graph is a complete cycle where every argument attacks exactly one other.

#### 2. Defense — "does the set fight back for its members?"
$S$ **defends** an argument $X$ iff, for every attacker $Y$ of $X$, some member of $S$ attacks $Y$ back:
$$S \text{ defends } X \iff \forall Y \text{ with } (Y,X) \in Att,\; \exists Z \in S \text{ such that } (Z,Y) \in Att$$
Plain-English check: list every arrow pointing *into* $X$. For each one, does $S$ contain something that shoots back at the attacker? If $X$ has zero attackers, $S$ defends it automatically (vacuous truth — nothing to defend against).

*Worked example:* Does $\{B\}$ defend $A$?
* $A$'s only attacker is $C$ (since $(C,A) \in Att$).
* Does $B$ attack $C$? Yes, $(B,C) \in Att$.
* So $\{B\}$ **does defend** $A$.

Does $\{B\}$ defend $B$ itself?
* $B$'s only attacker is $A$.
* Does $B$ attack $A$? No — $B$ only attacks $C$.
* So $\{B\}$ **does not defend** $B$.

This "defends itself" check is exactly what the next definition needs.

**Characteristic function $f$.** Package "everything $S$ defends" into one function:
$$f(S) = \{X \in AR \mid S \text{ defends } X\}$$
*Worked example:* $f(\{B\}) = \{A\}$ (from above; $B$ does **not** defend $B$ or $C$ — check $C$: its attacker is $B$, and $B$ does not attack itself, so $C$ is undefended by $\{B\}$).

#### 3. Admissible extension — "conflict-free, and defends everyone inside it"
$$S \text{ is admissible} \iff S \text{ is conflict-free AND } S \subseteq f(S)$$
Plain-English recipe for checking a candidate $S$:
1. Conflict-free check (Section 1).
2. For **every** $X \in S$, find $X$'s attackers and confirm some member of $S$ attacks each attacker back (Section 2).
If both hold, $S$ is admissible.

*Worked example: is $\{A\}$ admissible on the 3-cycle?*
1. Conflict-free: yes (single element, no self-attack).
2. Does $\{A\}$ defend $A$? $A$'s attacker is $C$. Does $A$ attack $C$? No — $A$ only attacks $B$. **$A$ is not defended.**
So $\{A\}$ **fails** step 2 — not admissible. By the exact same argument, $\{B\}$ and $\{C\}$ also fail (each one's sole attacker is the *other* cycle member, which it does not itself attack — you can check $\{B\}$ against $f(\{B\})=\{A\}$ above: $B \notin f(\{B\})$, so $\{B\} \not\subseteq f(\{B\})$). Only $\emptyset$ survives ($\emptyset$ is trivially conflict-free and vacuously defends nothing), so **the only admissible extension of the 3-cycle is $\emptyset$.**

*A second example where an admissible set is non-trivial:* $AR=\{X,Y,Z\}$, $Att=\{(X,Y),(Y,Z)\}$ (a chain, not a cycle: $X$ attacks $Y$, $Y$ attacks $Z$, nothing attacks $X$).

```
X ----------> Y ----------> Z
(unattacked)
```

* Try $S=\{X,Z\}$. Conflict-free? $(X,Z) \notin Att$ and $(Z,X) \notin Att$, so yes.
* Does $S$ defend $X$? $X$ has no attackers, so yes (vacuous).
* Does $S$ defend $Z$? $Z$'s attacker is $Y$. Does $X \in S$ attack $Y$? Yes, $(X,Y) \in Att$. So $Z$ is defended.
* Both members defended, conflict-free ⇒ **$\{X,Z\}$ is admissible.**

This is the standard pattern: an unattacked argument ($X$) defends the argument two steps downstream ($Z$) by attacking the thing attacking it ($Y$) — "the enemy of my enemy is defended by me."

#### 4. Admissibly accepted — "wins under at least one admissible reading"
An argument $X$ is **admissibly accepted** iff it belongs to *at least one* admissible extension (any one is enough — you don't need agreement across all of them).

*Worked example (chain $X \to Y \to Z$ above):* admissible extensions are $\{\emptyset, \{X\}, \{X,Z\}\}$ (check $\{X\}$ alone: conflict-free, defends $X$ vacuously — admissible too, just not maximal). $X$ and $Z$ are both admissibly accepted (they appear in $\{X,Z\}$). $Y$ never appears in any admissible extension (its only possible defender against $X$ would have to attack $X$, and nothing does) — $Y$ is **not** admissibly accepted.

*On the 3-cycle:* the only admissible extension is $\emptyset$, so **no argument is admissibly accepted** — every argument in a pure cycle is "unresolved."

#### 5. Grounded extension ($GE$) — the unique, most cautious verdict

**Theorem (existence and uniqueness).** For any framework $\mathcal{F}=(AR,Att)$, the characteristic function $f$ is monotonic (if $S_1 \subseteq S_2$ then $f(S_1) \subseteq f(S_2)$ — defending is easier to keep, never lost, as $S$ grows). By the Knaster–Tarski fixed-point theorem, a monotonic function on the powerset lattice $(2^{AR}, \subseteq)$ has a **unique least fixed point**. That least fixed point is defined to be the grounded extension $GE$, and it is always admissible (proved in Example 6.3 below).

**Step-by-step algorithm to compute $GE$ (iterate $f$ from the bottom):**
$$f^0(\emptyset) = \emptyset,\quad f^1(\emptyset) = f(\emptyset),\quad f^{k+1}(\emptyset) = f(f^k(\emptyset)),\quad GE = \bigcup_{k=0}^{\infty} f^k(\emptyset)$$
In plain terms: start from nothing defended ($\emptyset$). At each round, add every argument that the *current* set defends. Repeat until the set stops growing (a fixed point) — that final set is $GE$. Intuition: round 0 always captures the arguments with **zero attackers** (they are trivially defended by anything, including $\emptyset$); round 1 adds arguments whose *only* attackers are already defeated by round-0 arguments; and so on, one "layer" of the graph at a time.

*Fully worked example — a 4-argument layered graph.* $AR=\{D,C,B,A\}$, $Att=\{(D,C),(C,B),(B,A)\}$ (a chain $D \to C \to B \to A$, $D$ has no attackers).

```
   D ----------> C ----------> B ----------> A
(unattacked)
 [in GE]        [not in GE]   [in GE]       [not in GE]
```
($D$ enters at round 1 since it has no attackers. $B$ enters at round 2 since $D$ defeats $B$'s attacker $C$. $C$ never enters: its sole attacker $D$ survives (nothing defeats $D$), so $C$ stays legitimately attacked. $A$ never enters either: its sole attacker $B$ is never itself defeated from inside the growing set, since nothing in $\{D,B\}$ attacks $B$.)

| Round $k$ | $f^k(\emptyset)$ | Reasoning for each new member |
|---|---|---|
| 0 | $\emptyset$ | starting point by definition |
| 1 | $\{D\}$ | $D$ has no attackers ⇒ defended vacuously by $\emptyset$ |
| 2 | $\{D, B\}$ | $B$'s only attacker is $C$; is $C$ attacked by $f^1(\emptyset)=\{D\}$? Yes, $(D,C)\in Att$ ⇒ $B$ now defended. ($C$ itself is not added: $C$'s attacker is $D$, and nothing in $\{D\}$ attacks $D$.) |
| 3 | $\{D, B\}$ | check $A$: its attacker is $B$; is $B$ attacked by $f^2(\emptyset)=\{D,B\}$? No — nothing attacks $B$ from inside $\{D,B\}$ (only $C$ attacks $B$, and $C \notin \{D,B\}$). No new members. |

Round 3 equals round 2 ⇒ fixed point reached ⇒ $GE = \{D, B\}$. Reading it off the chain: unattacked arguments ($D$) are always in $GE$; the argument two steps away ($B$) is defended by $D$; the arguments in between/downstream of a defended attacker ($C$, $A$) are excluded because their sole attacker is never itself defeated by $GE$.

*Worked example on the 3-cycle:* $f^0(\emptyset)=\emptyset$. $f^1(\emptyset)=f(\emptyset)$: does $\emptyset$ defend $A$? $A$'s attacker is $C$; $\emptyset$ attacks nothing, so no. Same for $B, C$ by symmetry. So $f^1(\emptyset)=\emptyset$ — already a fixed point. $GE=\emptyset$. (This matches Section 3: the only admissible set was $\emptyset$, and $GE$ is always itself admissible, so with only one admissible candidate available, $GE$ has to be it.)

**Groundedly accepted:** $X$ is groundedly accepted iff $X \in GE$. Since $GE$ is unique, this is a single, unambiguous, "skeptical" verdict — unlike admissible acceptance, there's no "accepted under one reading but not another."

#### 6. Preferred extension — the maximal, most credulous verdicts

**Theorem (existence).** Every admissible set is contained in some maximal admissible set — i.e. preferred extensions always exist (proof sketch: the union of a chain of admissible sets is itself admissible, so Zorn's lemma applies; in the small finite graphs seen in this course you can just enumerate). A framework can have **one, many, or (in infinite frameworks) infinitely many** preferred extensions.

**Step-by-step procedure to find them by hand (finite graphs):**
1. List all conflict-free subsets of $AR$.
2. Filter to the admissible ones (defends every member — Section 3's checklist).
3. Keep only the admissible sets that are not a strict subset of another admissible set — those maximal ones are the preferred extensions.

*Worked example — mutual attack (the case where grounded and preferred diverge):* $AR=\{A,B\}$, $Att=\{(A,B),(B,A)\}$.

```
A <==========> B
   (mutual attack)
```

1. Conflict-free subsets: $\emptyset, \{A\}, \{B\}$ ($\{A,B\}$ fails, both arrows present).
2. Admissible check: $\{A\}$ — $A$'s attacker is $B$; does $A$ attack $B$? Yes ⇒ defended ⇒ admissible. $\{B\}$ is admissible by the mirror argument. $\emptyset$ is trivially admissible.
3. Maximal ones: $\{A\}$ and $\{B\}$ are each maximal (neither is a subset of the other, and $\{A,B\}$ itself isn't even conflict-free so it's not a candidate).

**Preferred extensions: $\{A\}$ and $\{B\}$** — two different "credulous" resolutions, each internally consistent, each picking a side. Meanwhile $GE=\emptyset$ (round 0: neither $A$ nor $B$ has zero attackers, so nothing enters at round 1) — the "skeptical" grounded semantics refuses to commit to either side, while preferred semantics offers both possible commitments separately. This is the core conceptual difference: **grounded = the unique cautious core; preferred = every maximal credulous stance, and there can be more than one.**

*Relationship to the running 3-cycle:* the only admissible set was $\emptyset$, and it's trivially the only maximal one too, so the 3-cycle has exactly one preferred extension, $\emptyset$, same as its grounded extension. (Odd cycles are a case where preferred and grounded coincide, both empty; even cycles behave like the mutual-attack example, splitting into multiple preferred extensions — see the 4-node self-loop and 2-cycle cases worked in Example 6.1–6.2 and 6.4 below.)

#### 7. Stable extension — recap
A conflict-free set $S$ is **stable** iff it attacks every argument outside it:
$$\forall Y \in AR \setminus S,\; \exists X \in S \text{ such that } (X,Y) \in Att$$
Every stable extension is preferred (and hence admissible), but not every preferred extension is stable — the 3-cycle example above has a preferred extension $\emptyset$ that is *not* stable, since $\emptyset$ attacks nothing while $A,B,C$ all remain outside it unattacked. (Odd cycles are the textbook case of "no stable extension exists.")

#### 8. Acceptance status — summary table

| Status | Definition | On the mutual-attack example $\{A,B\}, Att=\{(A,B),(B,A)\}$ |
|---|---|---|
| Admissibly accepted | in *some* admissible extension | $A$: yes (in $\{A\}$). $B$: yes (in $\{B\}$). |
| Groundedly accepted | in the (unique) $GE$ | $A$: no. $B$: no. ($GE=\emptyset$) |
| Credulously accepted (preferred) | in *some* preferred extension | same as admissible here: $A$ yes, $B$ yes |
| Skeptically accepted (preferred) | in *every* preferred extension | $A$: no. $B$: no. (each preferred extension picks only one of them) |

Reading the table: admissible/credulous acceptance is the loosest test ("could this argument win under some consistent stance?"), grounded/skeptical acceptance is the strictest ("does every reasonable stance agree on this?").

#### 9. Structured Argumentation (ASPIC+)
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

## Verification Checklist (Argumentation)

* [ ] **Dung Semantics:**
  * Is every admissible set **strictly conflict-free**?
  * Does the grounded extension contain **only** arguments defended from the base of unattacked nodes?
