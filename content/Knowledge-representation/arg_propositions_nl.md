# Arguments & Propositions in Natural Language

Covers official course Modules 2-3 ("Arguments in NL", "Propositions in NL" incl. categorical/Venn logic). Module 5 (proof systems: Fitch/INDO/Resolution) is deliberately excluded. Originally cropped from full_02.md Section 1; Section 2 (Categorical Logic) was added later from the Module 3 lecture PDF to close a gap. Companion file: computational_argumentation.md covers "Logics and Computational Argumentation" (Module 4 + ASPIC+).

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

This section is still part of "Propositions in Natural Language" (arguments built from categorical sentences like "All $S$ are $P$"), not a separate topic — it is the natural-language-proposition machinery for testing whether an *argument* made of categorical sentences is deductive.

---

### Detailed Theory & Concepts to Read First

#### 1. The Four Standard Forms of Categorical Propositions
Every standard categorical proposition relates a **Subject term ($S$)** to a **Predicate term ($P$)**:

| Type | Form Name | Standard Notation | Set Relation | Venn Diagram Marking |
| :---: | :---: | :---: | :---: | :---: |
| **A** | Universal Affirmative | All $S$ are $P$ | $S \subseteq P \iff S \setminus P = \emptyset$ | **Shade** region $S \setminus P$ |
| **E** | Universal Negative | No $S$ are $P$ | $S \cap P = \emptyset$ | **Shade** region $S \cap P$ |
| **I** | Particular Affirmative | Some $S$ are $P$ | $S \cap P \neq \emptyset$ | Asterisk ($*$) in region $S \cap P$ |
| **O** | Particular Negative | Some $S$ are not $P$ | $S \setminus P \neq \emptyset$ | Asterisk ($*$) in region $S \setminus P$ |

* **Shading rule:** a shaded region is asserted **empty** — nothing lives there.
* **Asterisk rule:** an asterisk asserts **existence** — at least one thing lives there.

#### 2. Three-Circle Venn Diagram: the 7 regions
A categorical syllogism has three terms: the **Minor term $S$** (subject of the conclusion), the **Major term $P$** (predicate of the conclusion), and the **Middle term $M$** (appears in both premises, never in the conclusion). Three overlapping circles cut the plane into 7 labelled regions (the 8th "outside all three circles" region is never referenced by a syllogism, so it is left unlabelled):

```
        Circle S              Circle P
       /--------\           /--------\
      /    R1    \         /    R3    \
     |  (S only)   \--R2--/  (P only)  |
     |             / S∩P \             |
      \    R4     |  R6   |    R5     /
       \  (S∩M)    \S∩P∩M/  (P∩M)    /
        \-----------+---+-----------/
                     |R7 |
                      \M/
                  (M only)
```

| Region | Set expression | Plain description |
|---|---|---|
| $R_1$ | $S \cap \bar P \cap \bar M$ | $S$ only |
| $R_2$ | $S \cap P \cap \bar M$ | $S$ and $P$, not $M$ |
| $R_3$ | $\bar S \cap P \cap \bar M$ | $P$ only |
| $R_4$ | $S \cap \bar P \cap M$ | $S$ and $M$, not $P$ |
| $R_5$ | $\bar S \cap P \cap M$ | $P$ and $M$, not $S$ |
| $R_6$ | $S \cap P \cap M$ | all three (center) |
| $R_7$ | $\bar S \cap \bar P \cap M$ | $M$ only |

Two useful composite regions you will shade/mark as a pair whenever a premise mentions only two of the three terms: $S \cap M = R_4 \cup R_6$, and $P \cap M = R_5 \cup R_6$, and $S \setminus P = R_1 \cup R_4$, and $S \cap P = R_2 \cup R_6$.

#### 3. Execution Rules to Test a Syllogism
1. **Universal first:** always diagram the universal premises (A/E — shading) before the particular ones (I/O — asterisks). Shading first tells you which half of a split region is already forbidden, so the asterisk has only one legal place left.
2. **Border-line rule:** if a particular premise's region is split into two sub-regions and **neither** half is shaded, you cannot tell which half the entity is in — place the asterisk **on the boundary line** between them (this is the diagram's way of saying "undetermined").
3. **Inspection test:** once both premises are drawn, check whether the conclusion is already forced.
   * Conclusion is A/E (claims a region empty) $\implies$ check that region is **completely shaded**.
   * Conclusion is I/O (claims a region nonempty) $\implies$ check there is an asterisk **strictly inside** that region (an asterisk sitting on a border does not count — it only says "somewhere in one of two places," not "definitely here").
   * If the diagram forces the conclusion, the syllogism is **deductive (valid)**; otherwise it is **not deductive (invalid)** — the premises are consistent with the conclusion being false.

---

### Worked Examples with In-Depth Explanations

#### Example 2.1: Step-by-Step Syllogism Validity Proofs

##### 2.1.1: "No $P$ is $M$. Some $S$ is $M$. Therefore, some $S$ is not $P$."
1. **Diagram premise 1 ("No $P$ is $M$", an E-proposition):** $P \cap M$ must be empty, i.e. $R_5 \cup R_6 = \emptyset$. **Shade $R_5$ and $R_6$.**
2. **Diagram premise 2 ("Some $S$ is $M$", an I-proposition):** $S \cap M \neq \emptyset$, i.e. an entity lives in $R_4 \cup R_6$. But $R_6$ was just shaded (forbidden) by step 1, so the entity cannot be there. **Place the asterisk unconditionally in $R_4$** (no border-line ambiguity, since $R_6$ is ruled out).
3. **Inspect the conclusion ("Some $S$ is not $P$", an O-proposition):** this needs an asterisk strictly inside $S \setminus P = R_1 \cup R_4$. $R_4$ has an unconditional asterisk from step 2, and $R_4 \subseteq S \setminus P$.
4. **Verdict:** the diagram already forces the conclusion $\implies$ **deductive (valid)**.

##### 2.1.2: "All $M$ is $P$. No $S$ is $M$. Therefore, no $S$ is $P$."
1. **Diagram premise 1 ("All $M$ is $P$", an A-proposition):** the part of $M$ outside $P$ must be empty, i.e. $R_4 \cup R_7 = \emptyset$. **Shade $R_4$ and $R_7$.**
2. **Diagram premise 2 ("No $S$ is $M$", an E-proposition):** $S \cap M = \emptyset$, i.e. $R_4 \cup R_6 = \emptyset$. $R_4$ is already shaded, so this premise adds the new requirement **shade $R_6$** too.
3. **Inspect the conclusion ("No $S$ is $P$", an E-proposition):** this needs the whole of $S \cap P = R_2 \cup R_6$ to be shaded. $R_6$ is shaded (step 2), but **$R_2$ was never touched by either premise — it is still open.**
4. **Verdict:** the diagram does *not* force the conclusion (an entity could still legally sit in $R_2$: an $S$ that is $P$ but not $M$) $\implies$ **not deductive (invalid)**. This is exactly the classic case people mistake for valid — the premises talk about $M$, but the conclusion talks about $S$ and $P$ directly, and nothing forbids an $S \cap P$ pair that bypasses $M$ entirely.

#### Example 2.2: Reading a Given (Already-Drawn) Venn Diagram
*Given diagram state:* $R_2$ is shaded (so $S \cap P \cap \bar M = \emptyset$); there is an asterisk in $R_1$ (unconditional, $S$ only); there is an asterisk in $R_6$ (unconditional, $S \cap P \cap M$).

* **"Some $S$ is not $P$"?** Check $S \setminus P = R_1 \cup R_4$ for an unconditional asterisk. $R_1$ has one. **Yes, this follows.**
* **"No $S$ is $P$"?** Check whether $S \cap P = R_2 \cup R_6$ is entirely shaded. $R_2$ is shaded, but $R_6$ has an asterisk (so it is definitely **not** empty). **No, this does not follow** — in fact the diagram proves the opposite ("some $S$ is $P$", via the $R_6$ asterisk).
* **"All $S$ is $M$"?** Check whether $S \setminus M = R_1 \cup R_2$ is entirely shaded. $R_2$ is shaded, but $R_1$ has an unconditional asterisk, meaning an $S$ exists **outside** $M$. **No, this does not follow.**

---
## Verification Checklist (Arguments & Propositions in NL)

* [ ] **Categorical Syllogisms (Venn diagrams):**
  * Universal premises (A/E) diagrammed **before** particular ones (I/O)?
  * Any asterisk that lands on a border double-checked against the "strictly inside" rule before reading off the conclusion?
