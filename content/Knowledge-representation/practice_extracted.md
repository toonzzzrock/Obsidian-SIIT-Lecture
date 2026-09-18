# Practice Questions: Arguments & Propositions in NL, and Computational Argumentation

Extracted from `practices/*.pdf` (via `tmp/txt/mt_mid_term_practice_*.txt`), filtered to the two topics
covered in `arg_and_computational_argumentation.md`. Each question keeps its original wording, answer,
and a worked explanation.

Note: the mt-number tags used in `full_03.md`'s answer key do not line up with the physical practice
file suffixes — verified by grep. Argumentation-framework content actually lives in
`mt_mid_term_practice_4/5/7.txt` (not `_1.txt`), and the barber-paradox question is in
`mt_mid_term_practice_6.txt`. Sections below are tagged by the file the question was read from.

---

# Part 1: Arguments & Propositions in Natural Language

## mt1 (mid term practice 1.pdf)

### Q1 (4 marks) — Fill in the blanks
"The statements that make up an argument are divided into one or more premises and one and only one conclusion. The premises are the statements that set forth the reasons or evidence, and the conclusion is the statement that is claimed to follow from the premises."

**Answer:** premises (reasons/evidence) and conclusion (what is claimed to follow).
**Explanation:** Basic definitional recall — an argument is a set of premises offered in support of a single conclusion.

### Q2 (4 marks) — Mark reason (R) and conclusion (C)
(a) Since R(the good, according to Plato, is that which furthers a person's real interests), it follows that C(in any given case when the good is known, men will seek it).
(b) The fact that C1-R2(there was never a land bridge between Australia and mainland Asia) is evidenced by R1(the animal species in the two areas are very different). C2(Asian placental mammals and Australian marsupial mammals have not been in contact in the last several million years).
(c) C(Women of the working class... should not have more than two children at most). R(The average working man can support no more and the average working woman can take care of no more in decent fashion).
(d) Many people believe a dark tan is attractive and healthy, but mounting evidence indicates C(too much sun can lead to health problems). One noticeable effect is R(premature aging of the skin... it plays a role in skin cancer).

**Answer:** as marked above (note (b) is a two-step chain: R1 supports C1, which in turn acts as R2 for C2).
**Explanation:** Standard premise/conclusion tagging; (b) illustrates a sub-argument (an intermediate conclusion reused as a premise).

### Q3 (4 marks) — Extract main conclusion from editorial text
(a) [team-sports/children's fitness passage]. **Answer:** "Our inappropriate concept of team sports causes the health and fitness problem of our children" (or weaker: "Our concept of team sports is inappropriate").
(b) [elective cesarean section passage]. **Answer:** "Elective cesarean section should be restrained."
**Explanation:** The conclusion is often unstated/must be rephrased from the editorial's overall thrust rather than lifted verbatim — a hallmark of real-world (non-standard-form) arguments.

### Q4 (4 marks) — Which passages are arguments; identify conclusion
(a) "If public education fails... then it is likely..." — **Answer:** Not an argument (conditional sentence).
(b) "It is strongly recommended that you have your house inspected..." — **Answer:** Not an argument (a recommendation).
(c) "Mosquito bites are not always... some mosquitoes carry West Nile virus..." — **Answer:** An argument; conclusion = "Mosquito bites are not always the harmless little irritations."
(d) "Young people at universities study to achieve knowledge and not to learn a trade..." — **Answer:** An argument; conclusion = "Young people at universities should study to learn a trade" (misprint aside, note it argues the reverse rhetorically).
**Explanation:** A conditional ("if...then") asserts no categorical claim, so it is not itself an argument; a recommendation with no supporting reason is likewise not an argument. Premise indicators ("for example", implicit reason clauses) mark the true arguments.

### Q5 (4 marks) — Deductive or inductive?
(a) Amoco/Exxon/Texaco all listed → "all major American oil companies are listed" — **Answer:** Inductive.
(b) Longer pendulum swings slower → lengthened clock pendulum slows the clock — **Answer:** Deductive.
(c) Cholesterol is endogenous → manufactured inside the body — **Answer:** Inductive (no penalty if answered Deductive).
(d) If Alexander died of typhoid, he was infected in India; he did die of typhoid; therefore infected in India — **Answer:** Deductive.
**Explanation:** (a) generalizes from three examples to "all," a non-water-tight inductive leap. (b) and (d) instantiate a universal/conditional rule with certainty, so the conclusion follows necessarily. (c) is graded leniently because "endogenous" almost analytically means "manufactured inside," blurring the deductive/inductive line — this is the practice's flagged ambiguous case.

---

## mt2 (mid term practice 2.pdf)

### Q1 — Is it an argument?
1.1 "Charles went bald, and most men go bald." **Answer:** Not an argument.
1.2 "Toward evening, clouds formed and the sky grew darker; then the storm broke." **Answer:** Not an argument.
1.3 "The hour is up, so you must hand in your exams." **Answer:** An argument.
**Explanation:** 1.1/1.2 are plain conjunctions/narrations of events ("and," "then") with no premise offered in support of a conclusion. 1.3 has the inference indicator "so," marking a genuine premise→conclusion structure.

### Q2 — Extract main conclusion from editorial
2.1 Burglary passage (pry marks on rear door, mud near threshold; both doors found open). **Answer:** "The thief entered through the rear door and left through the front."
2.2 Stephen Hawking / Big Bang order passage. **Answer:** "The condition of the universe at the instant of the Big Bang was more highly ordered than it is today."
2.3 Graphical method for solving equations passage. **Answer:** "The graphical method for solving a system of equations is an approximation."
**Explanation:** Same skill as mt1 Q3 — locate the claim the rest of the passage is offered as evidence for, even when it is stated mid-passage ("It must be the case that...") or requires paraphrase.

---

## mt3 (mid term practice 3.pdf)

### Q1 — Identify argument + standard form
1.1 "Since Chicago is north of Boston, and Boston is north of Charleston, Chicago is north of Charleston." **Answer:** An argument.
```
Chicago is north of Boston
Boston is north of Charleston
∴ Chicago is north of Charleston
```
1.2 "Joe quit, because his boss was giving him so much grief." **Answer:** An argument.
```
His boss was giving him so much grief
∴ Joe quit
```
1.3 "Witches float because witches are made of wood, and wood floats." **Answer:** An argument.
```
Witches are made of wood
Wood floats
∴ Witches float
```
1.4 "Both houses of Congress may pass a bill, but the president may still veto it." **Answer:** Not an argument.
**Explanation:** 1.1–1.3 all contain the indicator "because"/"since" linking reasons to a claim. 1.4 is a plain conjunction of two independent facts joined by "but" — no premise supports the other, so it is not an argument (a conjunction, not an inference).

### Q2 — Suppressed premises, standard form
2.1 "In The Netherlands the electrical outlets are above floor level because of flooding danger."
```
(1) In countries where flooding is a danger, it is safer to place electrical outlets above floor level. (suppressed)
(2) Flooding is a danger in the Netherlands.
∴ In the Netherlands the electrical outlets are above floor level.
```
2.2 "Mercury is a liquid at room temperature and hence this pound of mercury would be liquid in this room."
```
(1) Mercury is a liquid at room temperature.
(2) This room is at room temperature. (suppressed)
∴ This pound of mercury would be liquid in this room.
```
2.3 "Joe is not a freshman because he studies in Bangkadi campus."
```
(1) Joe studies in Bangkadi campus.
(2) Freshmen study in Bangkadi campus. (suppressed, as given in source)
∴ Joe is not a freshman.
```
2.4 "In some situations, in order to uphold his oath, the President of the U.S. may have to take immediate action."
```
(1) The President of the U.S. takes an oath to ensure the security of the U.S. (suppressed)
(2) Some situations might require immediate action to ensure the security of the U.S. (suppressed)
∴ In some situations, in order to uphold his oath, the President of the U.S. may have to take immediate action.
```
**Explanation:** Each stated argument is incomplete as written; a bridging premise (enthymeme) must be supplied to connect the given premise to the conclusion. Note on 2.3: the source's suppressed premise as written doesn't validly yield the conclusion — the logically correct suppressed premise would be "students who study in Bangkadi campus are not freshmen" (derived correction); the source's own wording is kept above for fidelity.

### Q3 — Extract 2+ arguments from text, using argument-map hints (answers blank in source, **derived**)
3.1 "Health insurance companies should not cover treatment in complementary medicine unless the promised effect and its medical benefit have been concretely proven. Yet this proof is lacking in most cases. Patients do often report relief of their complaints after such treatments. But as long as it is unclear as to how this works, the funds should rather be spent on therapies where one knows with certainty."

**Answer (derived):**
```
Arg 1: (1) Coverage requires concrete proof of effect/benefit.
       (2) Such proof is lacking for complementary medicine in most cases.
       ∴ Health insurance should not cover complementary medicine.

Arg 2: (1) It is unclear how such treatments work (= proof is lacking).
       ∴ Funds should rather be spent on therapies where one knows with certainty.
```
"Patients often report relief" functions as a counter-consideration that undermines premise (2)/(1) above but is outweighed ("But...").

3.2 "...there are programmes...not worth the licensing fee... Nevertheless, everybody should contribute to the funding of the public broadcasters in equal measure, for we need general and independent media. After all we want to get our view of the world neither through the lens of the government nor through that of rich media entrepreneurs."

**Answer (derived):**
```
Arg 1: (1) We need general and independent media.
       ∴ Everybody should contribute to funding public broadcasters in equal measure.

Arg 2: (1) We want our view of the world neither through the government's lens nor rich media entrepreneurs' lens.
       ∴ We need general and independent media.  [sub-argument: its conclusion = premise (1) of Arg 1]
```
"Some programmes are not worth the fee" is a conceded counter-consideration ("nevertheless") that would attack Arg 1's conclusion but is overridden.
**Explanation:** Editorial passages typically chain a sub-argument (Arg 2) whose conclusion becomes a premise of the main argument (Arg 1), plus a conceded objection the author dismisses.

---

## mt5 (mid term practice 5.pdf)

### Q1 (3 marks) — Which sentence is an argument?
(a) Charles went bald, and most men go bald. (b) Charles went bald, like most men. (c) I have been busy since Tuesday. (d) I am busy, since my teacher assigned lots of homework. (e) My roommate likes to ski, and so do I.
**Answer:** (d).
**Explanation:** "since" here is a reason-marker (causal/inferential), not a time-marker as in (c) ("since Tuesday" = temporal). (a),(b),(e) are conjunctions/comparisons with no premise-conclusion link.

### Q2 (3 marks) — Which sentence is NOT an argument?
(a) He apologized, so you should forgive him. (b) He apologized. Accordingly, you should forgive him. (c) Since he apologized, you should forgive him. (d) If he apologized, you should forgive him. (e) He apologized. As a result, you should forgive him.
**Answer:** (d).
**Explanation:** (d) is a conditional — it asserts no categorical premise, only a hypothetical link, so it doesn't constitute an argument, unlike (a),(b),(c),(e) which all assert "he apologized" as a premise using indicators (so/accordingly/since/as a result).

### Q3 (3 marks) — Odd one out
(a) I am tall so I am good at sport. (b) I am tall, as a result I am good at sport. (c) Because I am tall, I am good at sport. (d) I am tall since I am good at sport. (e) I am good at sport since I am tall.
**Answer:** (e), per verified key.
**Explanation:** (a),(b),(c) all state premise="tall" → conclusion="good at sport" in premise-first order. (e) states the same premise/conclusion pair but with the conclusion stated first ("I am good at sport since I am tall"), i.e. reversed surface order from the others, making it the structural odd one out.

### Q4 (3 marks) — Which argument is deductive?
(a) It flies since it is a bird and birds usually fly. (b) ...birds can fly. (c) ...I never see a bird that cannot fly. (d) ...all birds fly. (e) It flies since it is a bird.
**Answer:** (d).
**Explanation:** Only (d) contains a universally quantified premise ("all birds fly"), making the inference water-tight/necessary. (a)-(c) hedge with "usually," "can," or an inductive generalization from observation; (e) is missing the general premise entirely.

### Q5 (3 marks) — Which sentence cannot be a conjunction of two simpler sentences?
(a) Miranda and Nick ate at home. (b) Miranda and Nick played tennis. (c) A Catholic priest married John and Mary. (d) Fred had pie and ice cream for dessert. (e) Jane speaks French and English.
**Answer:** (c).
**Explanation:** (a),(d),(e) split cleanly into two independent atomic facts. (b) can be read distributively too. (c) is relational — "married" denotes a single joint act; it cannot be decomposed into "a priest married John" ∧ "a priest married Mary" without changing the meaning, so "and" functions as a relational predicate connective, not propositional conjunction.

---

## mt6 (mid term practice 6.pdf)

### Q1 (10 marks) — Does the proposition have the form ¬S?
(a) "You may not go to the meeting." **Answer:** Yes; S = "you are allowed to go to the meeting" (or S = "you cannot skip the meeting").
(b) "I cannot recommend him too highly." **Answer:** Yes (low-recommendation reading); S = "I can recommend him highly".
(c) "He never thought he'd go to the Himalayas." **Answer:** Yes (second reading); S = "He thought he'd go to the Himalayas".
(d) "I have not done all questions." **Answer:** Yes; S = "I have done all questions".
(e) "No smoking section available." **Answer:** Yes (first reading); S = "there is a smoking section".
**Explanation:** These sentences are ambiguous because negation can scope over different constituents ("not" + quantifier/adverb interacting with "all", "too", "never") — isolate a clean, unambiguous S such that the sentence reads as its plain propositional negation ¬S under one disambiguated reading.

### Q2 (10 marks) — Best categorical form for NL propositions
(a) "My friends are the only ones who care." **Answer:** "No S are P" where S = people who aren't my friends, P = people who care.
(b) "Everything that is cheap is no good." **Answer:** "All S are P" (S=cheap things, P=no-good things) or equivalently "No S are P" (S=cheap things, P=good things).
(c) "Some things that are cheap are not good." **Answer:** "Some S are P" where S = cheap things, P = no-good things.
(d) "Only seniors may take this course." **Answer:** "All S are P" (S = students who may take this course, P = seniors) or "No S are P" (S = non-seniors, P = students who may take this course).
(e) "Somebody does not love you." **Answer:** "Some S are not P" where S = people, P = you-lovers.
**Explanation:** "Only" and "the only ones" invert the natural subject/predicate reading of NL quantified claims; correctly identifying S and P requires paraphrasing before mapping onto standard categorical form.

### Q3 (10 marks) — Suppressed premises for deductive validity
(a) "A fetus is a human being and hence abortion is illegal."
```
A fetus is a human being
Abortion kills a fetus (suppressed)
∴ Abortion kills a human being
Killing a human being is illegal (suppressed)
∴ Abortion is illegal
```
(b) Mathematical induction proof of 0+1+...+n = n(n+1)/2.
**Answer:** Suppressed premise = the Mathematical Induction Principle itself: "For any property P, if P holds for 0, and (if P holds for m then P holds for m+1), then P holds for every natural number."
(c) "This language is not regular since otherwise {aⁿbⁿ | n∈N} is regular as well."
**Answer:** Suppressed premises: "If this language is regular, then so is {aⁿbⁿ}" and "{aⁿbⁿ} is not regular."
**Explanation:** All three are enthymemes relying on a general rule (a legal principle, an induction schema, a closure-property fact) that is never stated but is required to make the stated inference go through validly.

### Q4 (10 marks) — Form arguments and identify attacks
KB: r1: Alice, Bob, or Cr is not innocent (disjunction). r2: presumption of innocence if not proven guilty. r3: Alice not proven guilty. r4: Bob not proven guilty. r5: newborns always innocent. r6: Cr is a newborn.
```
C  = r5, r6           ∴ Cr is innocent
A  = r3, r2            ∴ Alice is presumably innocent
B  = r4, r2            ∴ Bob is presumably innocent
A' = r1, B, C          ∴ Alice is not innocent
B' = r1, A, C          ∴ Bob is not innocent
```
**Answer:** A and A' rebut each other (contradictory conclusions: "Alice is innocent" vs "Alice is not innocent"); B and B' rebut each other likewise.
**Explanation:** A rebutting attack occurs when two arguments' conclusions directly contradict each other, as opposed to undermining (attacking a premise) or undercutting (attacking the inferential link itself).

### Q5 (10 marks) — Barber paradox arguments
"A barber shaves all those, and those only, who do not shave themselves." Argument A assumes the barber shaves himself and derives that he doesn't; Argument B assumes he doesn't and derives that he does.
```
A = (1) If X shaves himself, the barber does not shave X.
    (2) The barber shaves himself. (assumption)
    ∴ The barber does not shave the barber.
B = (1) If X does not shave himself, the barber shaves X.
    (2) The barber does not shave himself. (assumption)
    ∴ The barber shaves the barber.
```
**Answer:** Both A and B are deductive. A and B rebut each other (contradictory conclusions). A also undermines itself, since its conclusion contradicts its own premise (2); likewise B undermines itself. So the framework has four attacks: (A,A), (A,B), (B,B), (B,A).
**Explanation:** This illustrates undermining as a self-attack: when an argument's own conclusion is inconsistent with one of its assumed premises, the argument attacks (undermines) itself, on top of the ordinary rebutting attack between A and B — this is the paradox's formal signature. (This example doubles as computational-argumentation content — see the AR/Att framework it induces in Part 2.)

---

# Part 2: Computational Argumentation

## mt5 (mid term practice 5.pdf)

### Q9 (5 marks) — full mutual 3-cycle
F=(AR,Att), AR={A1,A2,A3}, Att={(A1,A2),(A1,A3),(A2,A1),(A2,A3),(A3,A1),(A3,A2)} (every argument attacks the other two). Which statement is **not** correct? (a) No arguments are groundedly acceptable. (b) A1,A2,A3 are all admissibly acceptable. (c) There are three admissible extensions. (d) ∅ is an admissible extension. (e) ∅ is the grounded extension.

**Answer:** (c)

**Explanation:** Conflict-free sets: ∅,{A1},{A2},{A3} (any 2-element set has a mutual attack). Each singleton {Ai} attacks both of its attackers (since Ai attacks the other two), so all three singletons are admissible ⇒ admissible extensions = {∅,{A1},{A2},{A3}}, i.e. **four**, not three, making (c) false. f(∅)=∅ since every Ai has attackers, so GE=∅ ⇒ (a),(d),(e) true; each Ai lies in an admissible set ⇒ (b) true.

### Q10 (5 marks) — directed 3-cycle
AR={A1,A2,A3}, Att={(A1,A2),(A2,A3),(A3,A1)}. Which statement is not correct?

**Answer:** (b)

**Explanation:** No self-attacks, so all singletons are conflict-free. {A1}: A1's only attacker is A3; A1 does not attack A3, so A1 is undefended ⇒ {A1} not admissible. By symmetry {A2},{A3} also fail. So admissible extensions = {∅} only, hence no argument is admissibly acceptable — (b) "A1,A2,A3 are all admissibly acceptable" is false. f(∅)=∅ (each has one attacker) ⇒ GE=∅, matching (a),(d),(e).

### Q11 — AR={A1,A2,A3,A4}
Att={(A2,A1),(A1,A3),(A2,A2)}. How many arguments are admissibly acceptable? (a) 0 (b) 1 (c) 2 (d) 3 (e) 4

**Answer:** (b) 1

**Explanation:** A2 self-attacks, so no conflict-free set contains A2 ⇒ A2 is never usable as a defender. A1's only attacker is A2, which can never be counter-attacked (nothing attacks A2 except itself) ⇒ A1 can never be defended. A3's only attacker is A1, which is itself undefendable ⇒ A3 also never defended. A4 has no attackers, so {A4} is trivially admissible. Only A4 is admissibly acceptable ⇒ count = 1.

### Q12 — infinite backward chain
AR={A0,A1,A2,…}, Att={(Ai+1,Ai) | i=0,1,2,…} (each Ai is attacked by Ai+1). How many admissible extensions does F have? (a) 1 (b) 2 (c) 3 (d) 4 (e) none of the above

**Answer:** (e)

**Explanation (derived):** For any finite set of arguments, the top-index element is always left undefended (its attacker is never countered), so no finite non-empty subset is admissible. However, for each starting index n≥0, the infinite set Sₙ={An, An+2, An+4, …} is admissible: every Aₖ∈Sₙ is attacked only by Ak+1, and Ak+2∈Sₙ attacks Ak+1, so every member is defended, and Sₙ is conflict-free (no even-offset pair attacks another). This gives one admissible extension per starting index n=0,1,2,… plus ∅ — countably infinitely many admissible extensions, so the count is neither 1,2,3 nor 4 ⇒ answer (e).

### Q13 / Q14 — ASPIC+ quarantine(bob)
"Explain in natural language what knowledge is represented by the following ASPIC+ argumentation theory. Explain whether one should accept the proposition quarantine(bob) by constructing possible arguments and evaluate their acceptabilities."

**Answer:** (the underlying strict/defeasible rule set was presented as a diagram/image in the PDF and was not captured by text extraction — cannot be filled in without the source figure)

**Explanation (general method):** build all strict/defeasible arguments from the rule base, identify rebutting (contradictory conclusions from defeasible rules), undermining (attacking a defeasible premise), and undercutting (attacking a defeasible rule's applicability) attacks, form the resulting AF, and evaluate `quarantine(bob)` under admissible/grounded semantics.

### Q15 — GE is admissible (proof)
"Let F=(AR,Att) be an argumentation framework; f:2^AR→2^AR where f(S)={X∈AR | S defends X}; and GE = f(∅) ∪ f²(∅) ∪ f³(∅) ∪ … . Prove that GE is an admissible extension of F."

**Answer:** GE is conflict-free and self-defending, hence admissible.

**Explanation:**
1. *Stages:* f⁰(∅)=∅ ⊆ f¹(∅) ⊆ f²(∅) ⊆ … since f is monotonic on (2^AR,⊆), so GE = ⋃ᵢ fⁱ(∅) is well-defined.
2. *Conflict-free (induction on stage):* f⁰(∅)=∅ is conflict-free. Assume fⁱ(∅) is conflict-free. Suppose X,Y∈fⁱ⁺¹(∅) attack each other, say (X,Y)∈Att. Since Y∈f(fⁱ(∅)), fⁱ(∅) defends Y, i.e. fⁱ(∅) attacks every attacker of Y, so some Z∈fⁱ(∅) attacks X. But X∈fⁱ⁺¹(∅)=f(fⁱ(∅)) means fⁱ(∅) also defends X, i.e. fⁱ(∅) attacks Z. Then Z and its attacker both lie in fⁱ(∅), contradicting the inductive hypothesis. Hence fⁱ⁺¹(∅) is conflict-free for all i, and GE is conflict-free.
3. *Self-defending:* let X∈GE, so X∈fⁱ(∅) for some i, meaning fⁱ⁻¹(∅) defends X. Since fⁱ⁻¹(∅)⊆GE, GE also attacks every attacker of X, so GE defends X.
4. Conflict-free + self-defending ⇒ GE is admissible. ∎

---

## mt4 (mid term practice 4.pdf, answer-key excerpt)

### Q17 — two arguments A, B (statement truncated in source)

**Answer:** conflict-free = {∅,{A},{B}}; admissible = {∅,{A},{B}}; GE = ∅; admissibly accepted: A, B; groundedly accepted: none.

**Explanation:** Consistent with a mutual-attack AF (Att={(A,B),(B,A)}): both singletons defend themselves against their sole attacker, so both are admissible individually, but f(∅)=∅ since both are attacked and neither is unattacked, giving GE=∅.

### Q18 — AR={A0,A1,A2}, Att={(A1,A0),(A2,A1),(A0,A2),(A2,A2)}

**Answer:** conflict-free = {∅,{A0},{A1}}; admissible = {∅}; GE = ∅; nobody admissibly or groundedly accepted.

**Explanation:** A2 self-attacks, so no set containing A2 is conflict-free. {A0}: attacker A1, need something attacking A1; only A2 attacks A1, but A2 is unusable ⇒ A0 undefended. {A1}: attacker A2 (self-attacking, still an attacker); need something in the set attacking A2; nothing does ⇒ A1 undefended. So only ∅ is admissible, giving GE=∅ and no accepted arguments under either semantics.

### Q19 — AR={A0,A1,A2,A3}, Att={(A1,A0),(A2,A1),(A0,A2),(A3,A2)}

**Answer:** conflict-free = {∅,{A0},{A1},{A2},{A3},{A0,A3},{A1,A3}}; admissible = {∅,{A3},{A1,A3}}; GE={A1,A3}; admissibly and groundedly accepted: A1, A3.

**Explanation:** A3 has no attackers ⇒ {A3} trivially admissible, and f(∅)={A3}. f({A3})={A3,A1} since A1's only attacker A2 is attacked by A3. f²(∅)={A1,A3} is a fixed point ⇒ GE={A1,A3}, also the unique maximal admissible extension (A0, A2 remain excluded since their attackers A1, A0 respectively are never fully countered).

### Q20 — AR={A0,A1,A2}, Att={(A1,A0),(A2,A0),(A1,A2),(A2,A1)} ("double cycle")

**Answer:** conflict-free = {∅,{A0},{A1},{A2}}; admissible = {∅,{A1},{A2}}; GE = ∅; admissibly accepted: A1, A2; groundedly accepted: none.

**Explanation:** A1 and A2 mutually attack and each also attacks A0. {A1}: attacker A2, and A1 attacks A2 back ⇒ defended, so {A1} admissible; symmetric for {A2}. {A0}: attackers A1,A2, but A0 attacks neither ⇒ undefended, not admissible. f(∅)=∅ (every argument has an attacker) ⇒ GE=∅.

---

## mt7 (mid term practice 7.pdf)

### Q5 — knowledge base to arguments
KB: d1 "Students are normally not married", d2 "Students are normally young adults", s1 "Young adults are adults", d3 "Adults are normally married", e1 "Alex is a student". (a) Form all arguments A1={e1,d1 ∴ Alex is not married}, A2={e1,d2 ∴ Alex is a young adult}, A3={A2,s1 ∴ Alex is an adult}, A4={A3,d3 ∴ Alex is married}. (b) Identify attack relationships (rebutting/undermining/undercutting).

**Answer:** A1 and A4 rebut each other (contradictory conclusions "not married" vs "married").

**Explanation:** Since d1 and d3 are conflicting defeasible rules producing contradictory conclusions via A1 vs A4, this is a rebutting attack (attack on a conclusion produced by a defeasible rule), not undermining (premise-level) or undercutting (rule-applicability-level).

### Q6 — continue Q5, build AF and evaluate claim
(a) Define AA framework (AR,Att) from Q5's arguments/attacks. (b) Evaluate "Alex is married" (=conclusion of A4) under admissible vs grounded semantics.

**Answer:** AR={A1,A2,A3,A4}, Att={(A1,A4),(A4,A1)}. "Alex is married" is admissibly acceptable (A4∈{A4}, an admissible extension) but not groundedly acceptable (GE={A2,A3}, A4∉GE).

**Explanation:** Only A1 and A4 attack each other (rebut); A2,A3 are unattacked. f(∅)={A2,A3} (no attackers), and f({A2,A3}) adds nothing further since neither A1 nor A4 is defended (A1's attacker A4 isn't countered by A2/A3, and vice versa) ⇒ GE={A2,A3}. {A4} alone is admissible (defends itself against A1 since A4 attacks A1), so under admissible semantics A4 (hence the claim) is acceptable, but not under grounded semantics.

### Q7 — infinite AF, compute GE
AR = {A,D} ∪ {B1,B2,…} ∪ {C1,C2,…}. Att = {(Bn,A),(A,Bn) | n≥1} ∪ {(Cn,Bn) | n≥1} ∪ {(D,Cn) | n≥1}.

**Answer:** GE = {D}.

**Explanation:** D has no attackers ⇒ f(∅)={D}. f²(∅)=f({D})={D}: D does not defend any Bn, since Bn is attacked by A but D does not attack A (D only attacks the Cn's). Since {D} adds nothing new, fⁿ(∅)={D} for all n≥2, so GE={D}.

### Q8 — proof: attacking pair cannot both be groundedly acceptable
"Prove that in an abstract argumentation framework F=(AR,Att), if A,B∈AR and (A,B)∈Att, then it cannot be that both A and B are groundedly acceptable."

**Answer:** Proved by contradiction using conflict-freeness of GE.

**Explanation:** Assume both A,B∈GE. Since (A,B)∈Att, A attacks B, so {A,B}⊆GE is not conflict-free — a contradiction, because GE, being an admissible extension, is conflict-free by definition. Hence A and B cannot both be groundedly acceptable. ∎

---

## mt6 (mid term practice 6.pdf, bonus)

### Bonus Q — stable extensions
Worked examples of an AF with **no** stable extension (a single self-attacker, e.g. AR={A}, Att={(A,A)}) and one **with multiple** stable extensions (mutual 2-cycle, Att={(A,B),(B,A)}, giving stable extensions {A} and {B}).

**Answer:** self-attacker case: no stable extension exists. 2-cycle case: {A} and {B} are both stable extensions.

**Explanation:** A stable extension must be conflict-free and attack every argument outside itself. For the self-attacker, the only conflict-free set is ∅, and ∅ attacks nothing, so it fails to attack A ⇒ no stable extension. For the 2-cycle, {A} is conflict-free and attacks B (the only argument outside it) ⇒ stable; symmetrically {B} is stable. This shows stable extensions can be absent or non-unique, unlike the grounded extension (always unique).

Note: this question also reuses the barber-paradox AF from Part 1 Q5: Att={(A,A),(A,B),(B,B),(B,A)}. Since both A and B self-attack, neither survives in any conflict-free set, so it has admissible extensions {∅} only and no stable extension either.
