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

**Explanation:**
**Step 1: recall the definition of an argument.** An argument is a structured set of statements divided into two roles: (1) premises, which are the reasons or evidence given, and (2) exactly one conclusion, which is the claim said to follow from those reasons.
**Step 2: match the blanks to the definition.** The first blank asks what the reasons/evidence statements are called — the answer is "premises." The second blank asks what the statement claimed to follow is called — the answer is "conclusion."
**Step 3: confirm.** The passage itself restates the definition, so the fill-in is a direct reading of the sentence structure.

---

### Q2 (4 marks) — Mark reason (R) and conclusion (C)
(a) Since R(the good, according to Plato, is that which furthers a person's real interests), it follows that C(in any given case when the good is known, men will seek it).
(b) The fact that C1-R2(there was never a land bridge between Australia and mainland Asia) is evidenced by R1(the animal species in the two areas are very different). C2(Asian placental mammals and Australian marsupial mammals have not been in contact in the last several million years).
(c) C(Women of the working class... should not have more than two children at most). R(The average working man can support no more and the average working woman can take care of no more in decent fashion).
(d) Many people believe a dark tan is attractive and healthy, but mounting evidence indicates C(too much sun can lead to health problems). One noticeable effect is R(premature aging of the skin... it plays a role in skin cancer).

**Answer:** as marked above (note (b) is a two-step chain: R1 supports C1, which in turn acts as R2 for C2).

**Explanation:**
**Step 1: identify conclusion-indicator and premise-indicator phrases.** Look for words such as "it follows that," "therefore," "so," "hence," "thus" to locate conclusions, and "since," "because," "for," "given that," "evidenced by" to locate premises.
**Step 2: tag each passage.** (a) "it follows that" marks the conclusion; everything before it introduced by "since" is the premise. (c) No explicit indicator, but the order is reversed — the conclusion ("should not have more than two children") is stated first, then the reason is given. (d) "mounting evidence indicates" introduces the conclusion; "one noticeable effect is" introduces the supporting evidence (premise).
**Step 3: handle the sub-argument in (b).** "The fact that X is evidenced by Y" means Y is the evidence (R1) and X is what it supports (C1). But X then serves as a further reason (R2) for the broader claim C2 about lack of continental contact. A statement can simultaneously be a conclusion of one inference and a premise of the next — this is a chained (or linked) argument.
**Step 4: confirm each tag is consistent.** Each tagged conclusion should be a claim that the tagged premises are offered to support. Check by reading "because [premise], [conclusion]" — if it reads naturally, the tags are correct.

---

### Q3 (4 marks) — Extract main conclusion from editorial text
(a) [team-sports/children's fitness passage]. **Answer:** "Our inappropriate concept of team sports causes the health and fitness problem of our children" (or weaker: "Our concept of team sports is inappropriate").
(b) [elective cesarean section passage]. **Answer:** "Elective cesarean section should be restrained."

**Explanation:**
**Step 1: understand what "main conclusion" means.** In an editorial, the main conclusion is the one central claim the author is arguing for. All other statements are either premises supporting it or sub-conclusions that themselves serve as premises.
**Step 2: distinguish premises from the conclusion.** Ask "is this statement offered as a reason for something else, or is it what everything else is trying to establish?" A statement that is supported by others, but does not itself support a further claim in the passage, is the main conclusion.
**Step 3: handle implicit or paraphrased conclusions.** Editorials often do not state the main conclusion word-for-word. It may need to be paraphrased from the overall thrust of the passage rather than copied verbatim — this is normal for non-standard-form arguments.
**Step 4: apply to (a).** The passage criticises the current concept of team sports and links it to children's poor health. The claim that ties everything together is: our concept of team sports is the cause of the health problem. All other observations support this.
**Step 5: apply to (b).** The passage presents harms and societal concerns around elective cesareans. The unifying claim everything is building toward is: elective cesarean section should be limited/restrained.

---

### Q4 (4 marks) — Which passages are arguments; identify conclusion
(a) "If public education fails... then it is likely..." — **Answer:** Not an argument (conditional sentence).
(b) "It is strongly recommended that you have your house inspected..." — **Answer:** Not an argument (a recommendation).
(c) "Mosquito bites are not always... some mosquitoes carry West Nile virus..." — **Answer:** An argument; conclusion = "Mosquito bites are not always the harmless little irritations."
(d) "Young people at universities study to achieve knowledge and not to learn a trade..." — **Answer:** An argument; conclusion = "Young people at universities should study to learn a trade" (misprint aside, note it argues the reverse rhetorically).

**Explanation:**
**Step 1: recall what makes a passage an argument.** A passage is an argument if and only if it contains at least one premise offered in support of a conclusion. The premises and conclusion must each be genuine claims (statements that can be true or false).
**Step 2: test (a).** A conditional "If P then Q" does not assert P or Q — it only asserts the relationship between them. Because no categorical claim is made, it does not count as an argument.
**Step 3: test (b).** A recommendation ("it is strongly recommended that...") is a directive, not a claim with a premise-conclusion structure. Even though it has implicit reasoning behind it, as presented here no reasons are given — it is simply advice, not an argument.
**Step 4: test (c).** "Some mosquitoes carry West Nile virus" and other facts are presented as reasons, and they support the claim "Mosquito bites are not always harmless." This has a premise-conclusion structure, so it is an argument. The conclusion is identified by asking: what claim are the facts leading to?
**Step 5: test (d).** The passage offers a reason ("young people at universities study to achieve knowledge and not to learn a trade") in support of a prescriptive conclusion. The rhetorical inversion aside, the argument structure is present.

---

### Q5 (4 marks) — Deductive or inductive?
(a) Amoco/Exxon/Texaco all listed → "all major American oil companies are listed" — **Answer:** Inductive.
(b) Longer pendulum swings slower → lengthened clock pendulum slows the clock — **Answer:** Deductive.
(c) Cholesterol is endogenous → manufactured inside the body — **Answer:** Inductive (no penalty if answered Deductive).
(d) If Alexander died of typhoid, he was infected in India; he did die of typhoid; therefore infected in India — **Answer:** Deductive.

**Explanation:**
**Step 1: recall the distinction.** A deductive argument claims the conclusion follows necessarily from the premises — if the premises are true, the conclusion cannot be false. An inductive argument claims the conclusion follows probably or with support — the premises make the conclusion likely but do not guarantee it.
**Step 2: test (a).** Three named companies are listed, and the argument generalises to "all major American oil companies." This goes beyond the stated evidence; more companies could exist that are not listed. The inference is not guaranteed — it is inductive (generalisation from examples).
**Step 3: test (b).** The general rule "a longer pendulum swings slower" combined with the specific fact "the pendulum was lengthened" yields the conclusion by direct instantiation of the rule. The conclusion follows with necessity — it is deductive.
**Step 4: test (c).** "Endogenous" means originating from within. The argument moves from the label "endogenous" to the claim "manufactured inside the body," which is essentially definitional. However, the inferential step is not formally spelled out as a universal rule, so this is marked inductive with full credit accepted for deductive — it is the explicitly flagged ambiguous case.
**Step 5: test (d).** This is a standard modus ponens form: (If P then Q), P, conclusion Q. The conclusion follows necessarily from the two premises — it is deductive.

---

### Q11 (5 marks) — Best categorical form (A/E/I/O) for each NL proposition
(a) "Every dog is a mammal." **Answer:** All S are P.
(b) "Cats never bark." **Answer:** No S are P.
(c) "None of the students failed." **Answer:** No S are P.
(d) "Whoever studies hard passes the exam." **Answer:** All S are P.
(e) "Fish don't have legs." **Answer:** No S are P.

**Explanation:**
**Step 1: recall the four standard categorical forms.** A: "All S are P" (universal affirmative). E: "No S are P" (universal negative). I: "Some S are P" (particular affirmative). O: "Some S are not P" (particular negative). Every NL sentence must be reworded into exactly one of these four templates before it can be diagrammed on a Venn diagram or tested in a syllogism (see Section 2 of the theory file).
**Step 2: apply to (a).** "Every dog is a mammal" already has the universal-affirmative shape: subject "dog," predicate "mammal," quantifier "every" = "all." Standard form: All dogs are mammals (A).
**Step 3: apply to (b) and (c).** "Cats never bark" and "none of the students failed" both deny the predicate of every member of the subject class with no exceptions — "never" and "none" are universal-negative quantifiers. Reword as: No cats are barking-things (E); No students are people-who-failed (E).
**Step 4: apply to (d).** "Whoever studies hard passes the exam" is a conditional in disguise: "if S then P" for every individual, which is logically identical to "All S are P." Standard form: All hard-studiers are exam-passers (A).
**Step 5: apply to (e).** "Fish don't have legs" universally denies the predicate "have legs" of the subject class "fish," with no stated exception. Standard form: No fish are leg-having-things (E).

---

## mt2 (mid term practice 2.pdf)

### Q1 — Is it an argument?
1.1 "Charles went bald, and most men go bald." **Answer:** Not an argument.
1.2 "Toward evening, clouds formed and the sky grew darker; then the storm broke." **Answer:** Not an argument.
1.3 "The hour is up, so you must hand in your exams." **Answer:** An argument.

**Explanation:**
**Step 1: identify the test.** A passage is an argument when one statement (the premise) is offered as a reason or evidence for another (the conclusion). A mere listing or narration of facts, even if connected by "and" or "then," does not constitute an argument because no one statement is offered to justify another.
**Step 2: test 1.1.** "Charles went bald" and "most men go bald" are two separate facts joined by "and." Neither is presented as a reason for the other — they are simply conjoined. This is not an argument.
**Step 3: test 1.2.** The passage narrates a sequence of events ("clouds formed," "sky grew darker," "storm broke") joined by "then." The temporal connective "then" describes what happened next, not a logical or evidential relationship. No conclusion is being drawn — this is a narrative, not an argument.
**Step 4: test 1.3.** "The hour is up" is presented as the reason, and "you must hand in your exams" is the conclusion. The word "so" is a conclusion-indicator that explicitly marks this as a premise-to-conclusion inference. This is an argument.

---

### Q2 — Extract main conclusion from editorial
2.1 Burglary passage (pry marks on rear door, mud near threshold; both doors found open). **Answer:** "The thief entered through the rear door and left through the front."
2.2 Stephen Hawking / Big Bang order passage. **Answer:** "The condition of the universe at the instant of the Big Bang was more highly ordered than it is today."
2.3 Graphical method for solving equations passage. **Answer:** "The graphical method for solving a system of equations is an approximation."

**Explanation:**
**Step 1: use the same technique as mt1 Q3.** Locate the claim that the rest of the passage is offered as evidence for. In editorials and detective-style reasoning passages, this may be stated mid-passage, introduced by phrases like "It must be the case that...," "This shows that...," or "We can conclude that..."
**Step 2: apply to 2.1.** The physical evidence (pry marks on rear door, mud near threshold, both doors open) are premises. They collectively point to one specific scenario the author is arguing for: the thief's path through the house. The main conclusion is that specific reconstruction.
**Step 3: apply to 2.2.** The Hawking passage builds from observations about entropy and the arrow of time. The claim these observations are designed to establish is the specific statement about the order of the universe at the Big Bang.
**Step 4: apply to 2.3.** The observations about graphical intersections and approximation errors are presented to support the overall claim about the method's nature: it is an approximation rather than an exact solution.

---

### Q3 — Syllogism validity by Venn diagram: "All squares have equal sides. Some squares are rectangles. ∴ Some rectangles have equal sides."
**Answer:** Deductive (valid).

**Explanation:**
**Step 1: assign the three terms.** M (middle term, appears in both premises but not the conclusion) = squares. S (subject of conclusion) = rectangles. P (predicate of conclusion) = equal-sided things. Draw three overlapping circles labeled S, P, M, giving the 7-region layout from Section 2 of the theory file (R1 = S only, R2 = S∩P only, R3 = P only, R4 = S∩M only, R5 = P∩M only, R6 = S∩P∩M, R7 = M only).
**Step 2: diagram premise 1 first (it is universal).** "All M is P" (all squares have equal sides) shades every part of M that lies outside P — that is R4 and R7 — because a universal premise is drawn before any particular premise, per the universal-before-particular rule.
**Step 3: diagram premise 2.** "Some S is M" (some squares are rectangles) requires an asterisk somewhere in S∩M, i.e., in R4 or R6. Since Step 2 already shaded R4 empty, the asterisk cannot go there — it is forced into R6 (S∩P∩M).
**Step 4: read off the conclusion.** "Some S is P" (some rectangles have equal sides) is true exactly when there is an asterisk in R2 or R6. Step 3 placed an asterisk in R6, so the conclusion is guaranteed by the diagram alone. The syllogism is deductively valid.

---

### Q4 — Syllogism validity: "All pediatricians are doctors. All pediatricians like children. ∴ All doctors like children."
**Answer:** Not deductive (invalid).

**Explanation:**
**Step 1: assign terms.** M = pediatricians, S = doctors, P = people-who-like-children.
**Step 2: diagram premise 1.** "All M is P" shades M outside P: regions R4 and R7 become empty.
**Step 3: diagram premise 2.** "All M is S" shades M outside S: regions R5 and R7 become empty (R7 was already empty from Step 2).
**Step 4: check the conclusion.** "All S is P" requires every part of S outside P to be empty, i.e., both R1 and R4 must be shaded. R4 is shaded (Step 2), but R1 (doctors who are neither pediatricians nor children-likers) was never touched by either premise and remains open. Because R1 stays unshaded, the diagram does not force the conclusion — the argument is invalid. (Intuitively: a doctor who is not a pediatrician need not like children.)

---

### Q5 — Syllogism validity: "No P is M. No M is S. ∴ No S is P."
**Answer:** Not deductive (invalid).

**Explanation:**
**Step 1: assign terms.** Careful: here P is the predicate of the conclusion, M is the middle term, S is the subject. Premise 1 "No P is M" relates P and M; premise 2 "No M is S" relates M and S.
**Step 2: diagram premise 1.** "No P is M" shades the overlap of P and M: regions R5 and R6 become empty.
**Step 3: diagram premise 2.** "No M is S" shades the overlap of M and S: regions R4 and R6 become empty (R6 already empty).
**Step 4: check the conclusion.** "No S is P" requires the entire S∩P overlap — regions R2 and R6 — to be empty. R6 is shaded (Steps 2-3), but R2 (things that are both S and P but not M) was never shaded by either premise and remains open. Since R2 stays open, the conclusion is not forced — the argument is invalid.

---

### Q6 — Syllogism validity: "No P is M. Some S is M. ∴ Some S is not P."
**Answer:** Deductive (valid). (Identical wording appears again as mt3 Q4 and mt3 Q7 later in this file; all three share this one derivation.)

**Explanation:**
**Step 1: assign terms.** M = middle term, S = subject of conclusion, P = predicate of conclusion. This is the same schema worked out as Example 2.1.1 in the theory file's Section 2.
**Step 2: diagram premise 1 (universal, drawn first).** "No P is M" shades the P∩M overlap: regions R5 and R6 become empty.
**Step 3: diagram premise 2 (particular).** "Some S is M" needs an asterisk in S∩M, i.e., R4 or R6. R6 is already shaded empty from Step 2, so the asterisk is forced into R4.
**Step 4: read off the conclusion.** "Some S is not P" is true when there is an asterisk in S but outside P, i.e., in R1 or R4. Step 3 placed the asterisk in R4, so the conclusion is guaranteed. The syllogism is valid.

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

**Explanation:**
**Step 1: look for argument-indicator words.** "Since," "because," and "for" are premise-indicators — they signal that what follows is a reason. "Therefore," "so," and "thus" are conclusion-indicators.
**Step 2: test 1.1.** "Since" introduces the two premises (Chicago north of Boston; Boston north of Charleston). The conclusion (Chicago north of Charleston) follows from the premises by transitivity. This is a valid deductive argument; write it in standard form by listing premises above the "therefore" line.
**Step 3: test 1.2.** "Because" introduces the premise (boss was giving him grief). The conclusion is stated first (Joe quit). Invert to standard form: premise on top, conclusion below.
**Step 4: test 1.3.** "Because" introduces two premises (witches made of wood; wood floats). The conclusion (witches float) is stated before them. Standard form reverses this ordering.
**Step 5: test 1.4.** "But" is a contrastive conjunction, not a logical indicator. The two clauses ("Congress may pass" and "president may veto") are independent facts in tension with each other — neither is offered as evidence for the other. This is a conjunction, not an argument.

---

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

**Explanation:**
**Step 1: understand enthymemes.** An enthymeme is an argument with one or more premises left unstated. The speaker assumes the audience shares the unstated premise. To reconstruct the argument, you must supply the missing "bridging" premise that logically connects the stated premise to the conclusion.
**Step 2: method for finding the suppressed premise.** Ask: what general rule, when combined with the stated premise, would yield the stated conclusion? That rule is the suppressed premise.
**Step 3: apply to 2.1.** Stated: flooding is dangerous in the Netherlands. Conclusion: outlets are above floor level. The bridge: "in countries where flooding is dangerous, outlets should be placed above floor level." This makes the inference valid.
**Step 4: apply to 2.2.** Stated: mercury is liquid at room temperature. Conclusion: this mercury is liquid in this room. The bridge: "this room is at room temperature." Without this premise, we cannot move from the general fact about mercury to this specific room.
**Step 5: apply to 2.3.** The source provides "Freshmen study in Bangkadi campus" as the suppressed premise, but note: this wording does not strictly yield "Joe is not a freshman" — for strict validity the suppressed premise would need to be "students who study in Bangkadi campus are not freshmen." The source's wording is kept above for fidelity to the original key.
**Step 6: apply to 2.4.** Both premises are suppressed. The first supplies the content of the oath (security of the US); the second connects "some situations" to the need for immediate action. Together they yield the stated conclusion.

---

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

**Explanation:**
**Step 1: scan for conclusion-indicators and concession-indicators.** Words like "for," "after all," and "since" introduce premises. Words like "nevertheless," "but," and "yet" signal a concession — an objection the author acknowledges but does not accept.
**Step 2: find the main conclusion first.** For 3.1, the opening sentence states the main conclusion directly ("should not cover ... unless proven"). For 3.2, "everybody should contribute" is the main conclusion, flagged by "nevertheless" (meaning: despite the concession, here is what I argue).
**Step 3: identify sub-arguments.** For 3.2, "for we need general and independent media" introduces a premise. That premise is itself supported by a further reason introduced by "after all." This creates a chained sub-argument: Arg 2's conclusion feeds into Arg 1 as a premise.
**Step 4: identify and label counter-considerations.** For 3.1, "patients do often report relief" is a reason against the conclusion — a counter-consideration. It is outweighed by the "but as long as it is unclear..." clause, which reasserts the main line. For 3.2, "there are programmes not worth the fee" is a conceded counter-consideration dismissed by "nevertheless."
**Step 5: write each argument in standard form.** List premises, then conclusion. Indicate which premises are derived from sub-arguments and which function as counter-considerations.

---

### Q4 — Syllogism validity: "No P is M. Some S is M. ∴ Some S is not P."
**Answer:** Deductive (valid). This is the same argument that appears as mt2 Q6 above and again below as mt3 Q7; all three copies share one derivation.

**Explanation:**
**Step 1: assign terms.** M = middle term, S = subject of conclusion, P = predicate of conclusion — this is Example 2.1.1 in the theory file's Section 2.
**Step 2: diagram premise 1 (universal, drawn first).** "No P is M" shades the P∩M overlap: regions R5 and R6 become empty.
**Step 3: diagram premise 2 (particular).** "Some S is M" needs an asterisk in S∩M, i.e., R4 or R6. R6 is already shaded empty, so the asterisk is forced into R4.
**Step 4: read off the conclusion.** "Some S is not P" holds when there is an asterisk in R1 or R4. The asterisk landed in R4, so the conclusion is guaranteed — the syllogism is valid.

---

### Q5 — Syllogism validity: "All M is P. No S is M. ∴ No S is P."
**Answer:** Not deductive (invalid). This is Example 2.1.2 in the theory file's Section 2.

**Explanation:**
**Step 1: assign terms.** M = middle term, S = subject of conclusion, P = predicate of conclusion.
**Step 2: diagram premise 1.** "All M is P" shades M outside P: regions R4 and R7 become empty.
**Step 3: diagram premise 2.** "No S is M" shades the S∩M overlap: regions R4 and R6 become empty (R4 already empty).
**Step 4: check the conclusion.** "No S is P" requires the entire S∩P overlap (R2 and R6) to be empty. R6 is shaded, but R2 was never touched by either premise and stays open. Since R2 remains open, the conclusion is not forced — invalid. (Intuitively: an S that is both P and outside M is still allowed.)

---

### Q6 — Syllogism validity: "Some P is M. Some S is not M. ∴ Some S is P."
**Answer:** Not deductive (invalid).

**Explanation:**
**Step 1: assign terms.** M = middle term, S = subject of conclusion, P = predicate of conclusion.
**Step 2: note that both premises are particular.** Neither premise is a universal ("all"/"no") statement, so there is no universal premise to shade first. Per the theory file's border-line rule, when a particular premise's asterisk could fall in either of two regions and neither region has already been closed off by a universal premise, the asterisk must be drawn straddling the border between those two regions (its exact location is left undetermined).
**Step 3: diagram premise 1.** "Some P is M" needs an asterisk in P∩M, i.e., R5 or R6. With no universal premise to rule either out, the asterisk sits on the R5/R6 border.
**Step 4: diagram premise 2.** "Some S is not M" needs an asterisk in S outside M, i.e., R1 or R2. With no universal premise to rule either out, the asterisk sits on the R1/R2 border.
**Step 5: check the conclusion.** "Some S is P" requires an unconditional asterisk in R2 or R6. Both asterisks drawn are ambiguous (on borders), not confined to R2/R6 — neither diagram step forces one into R2 or R6 specifically. The conclusion is not guaranteed — invalid. (This matches the classical rule that no valid categorical syllogism can be drawn from two particular premises.)

---

### Q7 — Syllogism validity: "No P is M. Some S is M. ∴ Some S is not P."
This is the same argument as mt2 Q6 and mt3 Q4 above (the source lists it three times across two practice files). **Answer:** Deductive (valid) — see mt3 Q4's step-by-step derivation directly above; it applies unchanged here.

---

## mt5 (mid term practice 5.pdf)

### Q1 (3 marks) — Which sentence is an argument?
(a) Charles went bald, and most men go bald. (b) Charles went bald, like most men. (c) I have been busy since Tuesday. (d) I am busy, since my teacher assigned lots of homework. (e) My roommate likes to ski, and so do I.

**Answer:** (d).

**Explanation:**
**Step 1: check each sentence for a premise-conclusion structure.** An argument requires at least one statement offered as a reason for another statement.
**Step 2: test (a).** Two facts joined by "and" — no inferential claim. Not an argument.
**Step 3: test (b).** "Like" introduces a comparison, not a reason. Not an argument.
**Step 4: test (c).** "Since Tuesday" is a temporal expression meaning "from Tuesday onward." The word "since" here marks time, not a logical reason. Not an argument.
**Step 5: test (d).** "Since my teacher assigned lots of homework" uses "since" as a reason-indicator (causal/inferential). The premise is "my teacher assigned lots of homework"; the conclusion is "I am busy." This is an argument.
**Step 6: test (e).** "And so do I" is an additive conjunction, not a premise-conclusion link. Not an argument.

---

### Q2 (3 marks) — Which sentence is NOT an argument?
(a) He apologized, so you should forgive him. (b) He apologized. Accordingly, you should forgive him. (c) Since he apologized, you should forgive him. (d) If he apologized, you should forgive him. (e) He apologized. As a result, you should forgive him.

**Answer:** (d).

**Explanation:**
**Step 1: identify what distinguishes (d) from the others.** Options (a), (b), (c), and (e) all assert "he apologized" as a categorical, stated fact and draw a conclusion from it. Option (d) does not assert that he apologized — it merely says "if" he did.
**Step 2: explain why a conditional is not an argument.** A conditional "If P then Q" makes no categorical assertion about P. If P is never actually claimed to be true, there is no premise to draw an inference from. The argument form requires at least one statement asserted as true and used as a reason.
**Step 3: confirm (a), (b), (c), (e) are arguments.** Each uses an explicit inference indicator ("so," "accordingly," "since," "as a result") and asserts "he apologized" as a true premise, then draws the conclusion "you should forgive him."
**Step 4: conclude.** Only (d) fails to provide an asserted premise, making it not an argument.

---

### Q3 (3 marks) — Odd one out
(a) I am tall so I am good at sport. (b) I am tall, as a result I am good at sport. (c) Because I am tall, I am good at sport. (d) I am tall since I am good at sport. (e) I am good at sport since I am tall.

**Answer:** (e), per verified key.

**Explanation:**
**Step 1: identify the premise and conclusion in each sentence.** In (a), (b), and (c), "I am tall" is the premise and "I am good at sport" is the conclusion. The premise is stated before the conclusion.
**Step 2: check (d).** "I am tall since I am good at sport" — here "since" introduces the reason "I am good at sport" for the claim "I am tall." The premise is "I am good at sport" and the conclusion is "I am tall." This reverses the premise-conclusion roles compared to (a)–(c).
**Step 3: check (e).** "I am good at sport since I am tall" — "since" introduces the reason "I am tall" for the claim "I am good at sport." So premise = "I am tall," conclusion = "I am good at sport." The same roles as (a)–(c). But the surface order is reversed: the conclusion is stated first, then the premise.
**Step 4: identify the structural pattern difference.** In (a), (b), (c): surface order is premise first, conclusion second. In (e): surface order is conclusion first, premise second. This reversed surface order — not reversed roles — makes (e) the structural odd one out among the group with premise="tall", conclusion="good at sport."

---

### Q4 (3 marks) — Which argument is deductive?
(a) It flies since it is a bird and birds usually fly. (b) ...birds can fly. (c) ...I never see a bird that cannot fly. (d) ...all birds fly. (e) It flies since it is a bird.

**Answer:** (d).

**Explanation:**
**Step 1: recall the criterion for deductive validity.** A deductive argument has the property that if all premises are true, the conclusion cannot be false. The key signal in natural language is a universal rule with no hedging.
**Step 2: test (a).** "Birds usually fly" is a hedged generalisation — it admits exceptions. The conclusion ("it flies") is therefore not guaranteed even if the premise is true. This is inductive.
**Step 3: test (b).** "Birds can fly" means birds have the capacity, not that every bird always does. Inductive.
**Step 4: test (c).** "I never see a bird that cannot fly" is an inductive generalisation from personal observation — it does not cover all possible cases. Inductive.
**Step 5: test (d).** "All birds fly" is a universal quantification with no exceptions. Combined with "it is a bird," the conclusion "it flies" follows necessarily by universal instantiation. This is deductive.
**Step 6: test (e).** "It is a bird" without any general rule about birds is insufficient to conclude "it flies." The general linking premise is entirely absent. Not a valid argument in any form.

---

### Q5 (3 marks) — Which sentence cannot be a conjunction of two simpler sentences?
(a) Miranda and Nick ate at home. (b) Miranda and Nick played tennis. (c) A Catholic priest married John and Mary. (d) Fred had pie and ice cream for dessert. (e) Jane speaks French and English.

**Answer:** (c).

**Explanation:**
**Step 1: recall what it means to be a conjunction of two simpler sentences.** A sentence S can be split into "S1 and S2" if both S1 and S2 are independently meaningful and together convey the same information as S. Formally, S is a conjunction P ∧ Q.
**Step 2: test (a).** "Miranda ate at home" and "Nick ate at home" are both independently true claims that together mean the same as the original. This is a valid conjunction.
**Step 3: test (b).** "Miranda played tennis" and "Nick played tennis" — but wait, they may have played together (doubles) or separately. The distributive reading ("each played tennis") works as a conjunction even if the together-reading is also possible.
**Step 4: test (c).** "A Catholic priest married John" and "a Catholic priest married Mary." These two sentences mean the priest performed two separate marriage ceremonies — but the original says the priest married John and Mary to each other (one joint ceremony). Splitting the sentence changes the meaning fundamentally. "Married John and Mary" is a single relational predicate applied to the pair, not two separate predications. This sentence cannot be decomposed into a conjunction.
**Step 5: test (d).** "Fred had pie for dessert" and "Fred had ice cream for dessert" are two independent facts that together convey the original. Valid conjunction.
**Step 6: test (e).** "Jane speaks French" and "Jane speaks English" are independent. Valid conjunction.

---

### Q6, Q7, Q8 — Which Venn diagram correctly represents the given categorical proposition(s)?
These three questions each present a pre-drawn 3-circle Venn diagram as an image (with shaded regions and/or asterisks already marked) and ask the student to pick the matching answer choice — (a)-(f) for Q6, (a)-(e) for Q7, (a)-(f) for Q8. The diagrams themselves are figures in the source PDF and were not captured by text extraction; only the multiple-choice option text survived. **Answer:** cannot be filled in without the source figure (same limitation as mt5 Q13/14 above).

**Explanation (general method, so the diagrams can be solved once seen):**
**Step 1: identify what proposition(s) each answer choice encodes.** Translate every option into standard categorical form (A/E/I/O) using the method from mt1 Q11 and the theory file's Section 2.
**Step 2: draw the 7-region diagram for each candidate proposition.** Universal propositions ("All S are P," "No S are P") are drawn as shading; particular propositions ("Some S are P," "Some S are not P") are drawn as an asterisk, always after any universal premise has already been shaded (universal-before-particular rule).
**Step 3: compare against the given figure region-by-region.** The correct answer choice is the one whose shading pattern and asterisk placement exactly match the shaded/starred regions shown in the source image — check every one of the 7 regions (R1-R7), not just the ones that look shaded at a glance, since an unshaded region carries information too (it means "this area is not asserted to be empty").
**Step 4: watch for the two classic traps tested by this style of question.** (i) A universal statement drawn as an asterisk (or vice versa) is always wrong — shading means "empty," an asterisk means "at least one element exists here." (ii) An asterisk drawn squarely inside one region when the premise is ambiguous between two regions is wrong unless a universal premise has already closed off the other region (see the border-line rule illustrated in mt3 Q6).

---

## mt6 (mid term practice 6.pdf)

### Q1 (10 marks) — Does the proposition have the form ¬S?
(a) "You may not go to the meeting." **Answer:** Yes; S = "you are allowed to go to the meeting" (or S = "you cannot skip the meeting").
(b) "I cannot recommend him too highly." **Answer:** Yes (low-recommendation reading); S = "I can recommend him highly".
(c) "He never thought he'd go to the Himalayas." **Answer:** Yes (second reading); S = "He thought he'd go to the Himalayas".
(d) "I have not done all questions." **Answer:** Yes; S = "I have done all questions".
(e) "No smoking section available." **Answer:** Yes (first reading); S = "there is a smoking section".

**Explanation:**
**Step 1: understand the task.** The question asks whether the given sentence can be read as the propositional negation ¬S of some simpler sentence S. This requires finding an S such that "not S" accurately paraphrases the given sentence under at least one natural interpretation.
**Step 2: identify where negation scopes.** Negation can interact with quantifiers and adverbs in English: "not all" does not mean "none"; "never" means "not ever"; "cannot... too" is a double negation idiom. The goal is to isolate a clean propositional S and its plain negation.
**Step 3: apply to (a).** "You may not go" = "it is not the case that you are allowed to go." S = "you are allowed to go to the meeting." The sentence is ¬S.
**Step 4: apply to (b).** The idiomatic reading "I cannot recommend him too highly" = "there is no level of praise too high for him" = effectively an emphatic positive recommendation. Under the low-recommendation reading: "I cannot recommend him [very] highly" = "I am not able to recommend him highly." S = "I can recommend him highly," and the sentence is ¬S under that reading.
**Step 5: apply to (c).** "He never thought he'd go" = "it is not the case that he thought he'd go." S = "He thought he'd go to the Himalayas."
**Step 6: apply to (d).** "I have not done all questions" = ¬S where S = "I have done all questions." This is straightforward.
**Step 7: apply to (e).** "No smoking section available" can be read as "there is no smoking section" = ¬S where S = "there is a smoking section."

---

### Q2 (10 marks) — Best categorical form for NL propositions
(a) "My friends are the only ones who care." **Answer:** "No S are P" where S = people who aren't my friends, P = people who care.
(b) "Everything that is cheap is no good." **Answer:** "All S are P" (S=cheap things, P=no-good things) or equivalently "No S are P" (S=cheap things, P=good things).
(c) "Some things that are cheap are not good." **Answer:** "Some S are P" where S = cheap things, P = no-good things.
(d) "Only seniors may take this course." **Answer:** "All S are P" (S = students who may take this course, P = seniors) or "No S are P" (S = non-seniors, P = students who may take this course).
(e) "Somebody does not love you." **Answer:** "Some S are not P" where S = people, P = you-lovers.

**Explanation:**
**Step 1: recall the four categorical forms.** (A) All S are P. (E) No S are P. (I) Some S are P. (O) Some S are not P.
**Step 2: handle "only" and "the only ones."** These invert the natural reading. "Only S are P" means "All P are S" (only seniors may take it → all who may take it are seniors). Similarly, "the only ones who care are my friends" → "all who care are my friends" → equivalently, "no non-friends care" (No non-friends are carers).
**Step 3: apply to (a).** "My friends are the only ones who care" = no one outside my friends cares. Pick S = people who are not my friends, P = people who care. Then "No S are P" captures this: no non-friends are carers.
**Step 4: apply to (b).** "Everything cheap is no good" is a universal. S = cheap things, P = no-good things. "All S are P." Equivalently, using the complement of P: "No cheap things are good things."
**Step 5: apply to (c).** "Some cheap things are not good" is a particular negative. S = cheap things, and the claim is that some of them are not good. "Some S are not P" where P = good things. Or equivalently: "Some S are P" where P = no-good things.
**Step 6: apply to (d).** "Only seniors may take this course" → "All who may take this course are seniors." S = students who may take this course, P = seniors. "All S are P."
**Step 7: apply to (e).** "Somebody does not love you" = there exists a person who is not a you-lover. S = people, P = you-lovers. "Some S are not P."

---

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

**Explanation:**
**Step 1: recall the method for finding suppressed premises (enthymemes).** Ask what general rule or background fact, when combined with the stated premises, would make the inference deductively valid.
**Step 2: apply to (a).** The stated premise is only "a fetus is a human being." To reach "abortion is illegal" two bridging facts are needed: (i) abortion kills a fetus (connecting abortion to the death of a fetus), and (ii) killing a human being is illegal (connecting death of a human to illegality). Both are assumed without being stated.
**Step 3: apply to (b).** The induction proof lists a base case and an inductive step. But without the Mathematical Induction Principle itself — "if P holds for 0 and if P(m) implies P(m+1) then P holds for all n" — the step from "base case + inductive step" to "holds for all natural numbers" is not formally justified. The principle is the suppressed premise.
**Step 4: apply to (c).** The stated premise is: "otherwise {aⁿbⁿ} would be regular." To reach "this language is not regular" from this, two facts are needed: (i) if the language is regular, then {aⁿbⁿ} is regular (the closure/reduction property), and (ii) {aⁿbⁿ} is not regular (the Pumping Lemma result). Both are standard results in formal language theory and are left unstated.

---

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

**Explanation:**
**Step 1: recall the three types of attack.** A rebutting attack occurs when two arguments have directly contradictory conclusions (one concludes P, the other concludes not-P). An undermining attack targets a premise of the attacked argument (claiming a stated premise is false). An undercutting attack targets the inferential link itself (claiming the rule does not apply in this case) without directly contradicting either the premise or the conclusion.
**Step 2: identify the conclusions of each argument.** A concludes: Alice is (presumably) innocent. A' concludes: Alice is not innocent. These are contradictory — one is the negation of the other.
**Step 3: classify the A vs A' relationship.** Because A's conclusion and A' conclusion are contradictory, each attacks the other's conclusion directly. This is a rebutting attack in both directions: (A, A') and (A', A).
**Step 4: apply the same analysis to B and B'.** B concludes: Bob is innocent. B' concludes: Bob is not innocent. Again contradictory conclusions — so (B, B') and (B', B) are rebutting attacks.
**Step 5: check for other attack types.** No argument here directly attacks a premise of another without that premise being itself a conclusion of a sub-argument (A' uses B and C as premises; if we had an argument claiming B's premises are false, that would be undermining, but no such argument is listed here).

---

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

**Explanation:**
**Step 1: verify both arguments are deductive.** A uses a universal rule (if X shaves himself, the barber does not shave X) plus the specific assumption about the barber. The conclusion follows by instantiating X = the barber. B follows the same structure with the negated assumption. Both are valid modus ponens forms — deductive.
**Step 2: identify the rebutting attacks between A and B.** A's conclusion is "the barber does not shave the barber." B's conclusion is "the barber shaves the barber." These are direct logical contradictions. By the definition of rebutting attack: (A, B) and (B, A) are both present.
**Step 3: identify self-undermining in A.** Undermining means attacking a premise of an argument. A's conclusion is "the barber does not shave the barber." A's own premise (2) states "the barber shaves himself" — which means "the barber shaves the barber." The conclusion directly contradicts premise (2). So A's conclusion, treated as an attacking statement, targets A's own premise (2). This is a self-undermining attack: (A, A).
**Step 4: apply the same reasoning to B.** B's conclusion is "the barber shaves the barber." B's own premise (2) states "the barber does not shave himself." The conclusion contradicts premise (2). So B also self-undermines: (B, B).
**Step 5: collect all four attacks.** Att = {(A,A), (A,B), (B,B), (B,A)}. This four-attack framework is the formal signature of the barber paradox — it shows why neither assumption leads to a stable, self-consistent argument.

---

# Part 2: Computational Argumentation

## mt5 (mid term practice 5.pdf)

### Q9 (5 marks) — full mutual 3-cycle
F=(AR,Att), AR={A1,A2,A3}, Att={(A1,A2),(A1,A3),(A2,A1),(A2,A3),(A3,A1),(A3,A2)} (every argument attacks the other two). Which statement is **not** correct? (a) No arguments are groundedly acceptable. (b) A1,A2,A3 are all admissibly acceptable. (c) There are three admissible extensions. (d) ∅ is an admissible extension. (e) ∅ is the grounded extension.

**Answer:** (c)

**Explanation:**
**Step 1: find all conflict-free sets.** A set is conflict-free if no argument in it attacks another argument in it. Check all subsets of {A1,A2,A3}: the empty set ∅ has no attacks internally. Each singleton {A1}, {A2}, {A3} contains only one argument and no self-attacks exist, so each singleton is conflict-free. Any 2-element set, say {A1,A2}, contains A1 and A2 which mutually attack each other — not conflict-free. By the same reasoning {A1,A3} and {A2,A3} fail, and the full set {A1,A2,A3} also fails. Conflict-free sets: ∅, {A1}, {A2}, {A3}.
**Step 2: check admissibility of each singleton.** A set S is admissible if it is conflict-free and defends every argument in it. S defends argument X if, for every argument Y that attacks X, S contains an argument that attacks Y. For {A1}: A1 is attacked by A2 and A3. Does A1 attack A2? Yes (A1,A2) is in Att. Does A1 attack A3? Yes (A1,A3) is in Att. So {A1} defends A1 against both attackers. {A1} is admissible. By symmetry (each argument attacks both others), {A2} and {A3} are also admissible.
**Step 3: list all admissible extensions.** ∅ is trivially admissible (conflict-free and vacuously defends everything in it, since it contains nothing). The three singletons are admissible. That gives four admissible extensions: {∅, {A1}, {A2}, {A3}}.
**Step 4: identify the false statement.** Option (c) claims there are three admissible extensions, but we found four. So (c) is false.
**Step 5: verify the remaining options.** Compute the grounded extension using f(S) = {X | S defends X}. f(∅) = {X | ∅ defends X} = ∅, because ∅ attacks nothing, so it defends no argument against any attacker. Since f(∅) = ∅ is already a fixed point, GE = ∅. (a) No groundedly acceptable arguments — confirmed by GE=∅. (d) ∅ is admissible — confirmed. (e) ∅ is the grounded extension — confirmed. (b) Each Ai lies in the admissible extension {Ai} — confirmed.

---

### Q10 (5 marks) — directed 3-cycle
AR={A1,A2,A3}, Att={(A1,A2),(A2,A3),(A3,A1)}. Which statement is not correct?

**Answer:** (b)

**Explanation:**
**Step 1: check for self-attacks.** None of A1, A2, A3 attacks itself, so every singleton {Ai} is conflict-free (a set with one element and no self-loop trivially has no internal conflict).
**Step 2: test whether {A1} is admissible.** {A1} is conflict-free (Step 1). Does {A1} defend A1? A1's only attacker is A3 (since (A3,A1) is in Att). For {A1} to defend A1, A1 itself would have to attack A3 — but A1 only attacks A2, not A3. So {A1} does not defend A1, and {A1} fails the admissibility test.
**Step 3: by the same argument for {A2} and {A3}.** Each singleton's sole attacker is the "next" argument in the cycle, and no argument attacks two steps ahead, so {A2} and {A3} also fail admissibility.
**Step 4: conclude the set of admissible extensions.** The only admissible extension left is ∅ (trivially conflict-free, vacuously defends nothing). So no argument is admissibly acceptable, meaning option (b) ("A1, A2, A3 are all admissibly acceptable") is the false statement.
**Step 5: compute the grounded extension to check the other options.** f(∅) = ∅ because every Ai has exactly one attacker and ∅ attacks nothing, so no argument is defended yet at round 0. Since f(∅)=∅ is already a fixed point, GE = ∅ — this confirms options (a), (d), (e) are true (no groundedly acceptable arguments, ∅ is admissible, ∅ is the grounded extension).

---

### Q11 — AR={A1,A2,A3,A4}
Att={(A2,A1),(A1,A3),(A2,A2)}. How many arguments are admissibly acceptable? (a) 0 (b) 1 (c) 2 (d) 3 (e) 4

**Answer:** (b) 1

**Explanation:**
**Step 1: identify self-attacking arguments.** (A2,A2) is in Att, so A2 attacks itself. A set is conflict-free only if no member attacks another member — a self-attack means the argument attacks itself. So no conflict-free set can contain A2.
**Step 2: assess A1.** A1's only attacker is A2 (from (A2,A1) in Att). For A1 to be defended, some argument in the defending set must attack A2. But the only argument that attacks A2 is A2 itself (via the self-loop) — and A2 cannot be in any conflict-free set (Step 1). So A1 can never be defended. A1 is not admissibly acceptable.
**Step 3: assess A3.** A3's only attacker is A1 (from (A1,A3) in Att). For A3 to be defended, something must attack A1. But A1 is itself undefendable (Step 2), and the only thing that attacks A1 is A2, which is excluded. So A3 also cannot be defended. A3 is not admissibly acceptable.
**Step 4: assess A4.** A4 has no attackers at all (no pair (X,A4) appears in Att). A set with no attackers is trivially defended — {A4} is conflict-free and vacuously defends A4. So {A4} is admissible, and A4 is admissibly acceptable.
**Step 5: count.** Exactly one argument (A4) is admissibly acceptable. The answer is (b) 1.

---

### Q12 — infinite backward chain
AR={A0,A1,A2,…}, Att={(Ai+1,Ai) | i=0,1,2,…} (each Ai is attacked by Ai+1). How many admissible extensions does F have? (a) 1 (b) 2 (c) 3 (d) 4 (e) none of the above

**Answer:** (e)

**Explanation (derived):**
**Step 1: show no finite non-empty set is admissible.** Consider any finite non-empty set S. Let Ak be the argument in S with the highest index k. Then Ak is attacked by Ak+1, but Ak+1 is not in S (since k is maximal). For {Ak} to be defended, some argument in S must attack Ak+1 — but the only argument that attacks Ak+1 is Ak+2, which is also not in S. So Ak is always left undefended in any finite non-empty set. No finite non-empty subset is admissible.
**Step 2: show ∅ is admissible.** ∅ is trivially conflict-free and vacuously defends everything in it (since it contains nothing). ∅ is one admissible extension.
**Step 3: construct infinitely many infinite admissible extensions.** For each starting index n ≥ 0, define Sₙ = {An, An+2, An+4, …} (every other argument starting from An). Each Ak in Sₙ is attacked only by Ak+1, which is not in Sₙ. But Ak+2 is in Sₙ, and Ak+2 attacks Ak+1 — so Sₙ defends Ak. Also, no two arguments in Sₙ attack each other (they are all even steps apart, and only consecutive arguments attack each other). So Sₙ is conflict-free and self-defending — hence admissible.
**Step 4: count.** We have one extension ∅, plus one extension Sₙ for each n = 0, 1, 2, … That is countably infinitely many admissible extensions. Since the answer is not 1, 2, 3, or 4, the answer is (e) none of the above.

---

### Q13 / Q14 — ASPIC+ quarantine(bob)
"Explain in natural language what knowledge is represented by the following ASPIC+ argumentation theory. Explain whether one should accept the proposition quarantine(bob) by constructing possible arguments and evaluate their acceptabilities."

**Answer:** (the underlying strict/defeasible rule set was presented as a diagram/image in the PDF and was not captured by text extraction — cannot be filled in without the source figure)

**Explanation (general method):**
**Step 1: read the knowledge base.** An ASPIC+ argumentation theory consists of strict rules (which cannot be attacked), defeasible rules (which can be defeated), and axioms (facts). Read the diagram to identify each rule's type and its premises and conclusion.
**Step 2: build all arguments.** An argument is a chain of rule applications starting from axioms. Construct every possible argument by forward-chaining from axioms through the rules. Sub-arguments (partial chains) also count as arguments in their own right.
**Step 3: identify attacks between arguments.** Three types: (i) a rebutting attack occurs when two arguments have contradictory conclusions, and at least one of them used a defeasible rule to derive that conclusion; (ii) an undermining attack occurs when one argument's conclusion contradicts a defeasible premise (an ungrounded fact used in a defeasible step) of another argument; (iii) an undercutting attack occurs when one argument's conclusion is specifically "not applicable(rule r)" — it targets the applicability of a defeasible rule in another argument without directly contradicting a premise or conclusion.
**Step 4: form the argumentation framework (AR, Att).** Collect all arguments as AR and all identified attacks as Att.
**Step 5: apply semantics.** Compute the grounded extension (or preferred/admissible extensions as needed). Check whether any argument in the extension has `quarantine(bob)` as its conclusion.
**Step 6: report.** If an argument concluding `quarantine(bob)` is in the grounded extension, then `quarantine(bob)` is groundedly acceptable. If it is only in some preferred extensions, it is admissibly but not groundedly acceptable. If no such argument survives, `quarantine(bob)` is not acceptable.

---

### Q15 — GE is admissible (proof)
"Let F=(AR,Att) be an argumentation framework; f:2^AR→2^AR where f(S)={X∈AR | S defends X}; and GE = f(∅) ∪ f²(∅) ∪ f³(∅) ∪ … . Prove that GE is an admissible extension of F."

**Answer:** GE is conflict-free and self-defending, hence admissible.

**Explanation:**
**Step 1: establish the monotone chain.** Define fⁱ(∅) inductively: f⁰(∅) = ∅, and fⁱ⁺¹(∅) = f(fⁱ(∅)). Because f is monotone with respect to set inclusion (if S ⊆ T then f(S) ⊆ f(T)), the sequence ∅ = f⁰(∅) ⊆ f¹(∅) ⊆ f²(∅) ⊆ … is non-decreasing. So GE = ⋃ᵢ fⁱ(∅) is well-defined.
**Step 2: prove GE is conflict-free, by induction on stage i.** Base case: f⁰(∅) = ∅ is trivially conflict-free (no elements, no attacks). Inductive hypothesis: assume fⁱ(∅) is conflict-free. Now suppose for contradiction that X, Y ∈ fⁱ⁺¹(∅) and (X,Y) ∈ Att. Since Y ∈ f(fⁱ(∅)), fⁱ(∅) defends Y — meaning for every attacker of Y, fⁱ(∅) contains an argument that attacks that attacker. In particular, some Z ∈ fⁱ(∅) attacks X (since X attacks Y). But X ∈ fⁱ⁺¹(∅) = f(fⁱ(∅)) means fⁱ(∅) defends X — so fⁱ(∅) attacks everything that attacks X. This means fⁱ(∅) attacks Z. But both Z and its attacker are in fⁱ(∅), contradicting the inductive hypothesis. So no mutual attacks exist within fⁱ⁺¹(∅). Taking the union, GE is conflict-free.
**Step 3: prove GE is self-defending.** Let X ∈ GE. Then X ∈ fⁱ(∅) for some stage i. Since X ∈ f(fⁱ⁻¹(∅)), the set fⁱ⁻¹(∅) defends X — that is, for every Y such that (Y,X) ∈ Att, there exists Z ∈ fⁱ⁻¹(∅) with (Z,Y) ∈ Att. Since fⁱ⁻¹(∅) ⊆ GE, this Z is also in GE. So GE itself contains an argument attacking every attacker of X, meaning GE defends X.
**Step 4: conclude admissibility.** A set is admissible if and only if it is conflict-free and defends every argument it contains. GE is conflict-free (Step 2) and self-defending (Step 3), so GE is an admissible extension of F. ∎

---

## mt4 (mid term practice 4.pdf, answer-key excerpt)

### Q17 — two arguments A, B (statement truncated in source)

**Answer:** conflict-free = {∅,{A},{B}}; admissible = {∅,{A},{B}}; GE = ∅; admissibly accepted: A, B; groundedly accepted: none.

**Explanation:**
**Step 1: reconstruct the framework.** The answer is consistent with a mutual-attack framework where Att = {(A,B),(B,A)}: A attacks B and B attacks A, and no other attacks exist.
**Step 2: find conflict-free sets.** ∅ has no internal attacks — conflict-free. {A} has one element and no self-attack — conflict-free. {B} similarly. {A,B}: A attacks B, so this set has an internal attack — not conflict-free.
**Step 3: check admissibility.** ∅ is trivially admissible. For {A}: A's only attacker is B. Does A attack B? Yes, (A,B) ∈ Att. So {A} defends A against its only attacker. {A} is admissible. Symmetrically, {B} is admissible.
**Step 4: compute the grounded extension.** f(∅) = {X | ∅ defends X} = ∅, because ∅ contains no arguments and attacks nothing, so it defends nothing. f(∅) = ∅ is already a fixed point, so GE = ∅.
**Step 5: state acceptability.** Under admissible semantics: A ∈ {A} and B ∈ {B}, both admissible extensions, so both are admissibly acceptable. Under grounded semantics: GE = ∅, so neither is groundedly acceptable.

---

### Q18 — AR={A0,A1,A2}, Att={(A1,A0),(A2,A1),(A0,A2),(A2,A2)}

**Answer:** conflict-free = {∅,{A0},{A1}}; admissible = {∅}; GE = ∅; nobody admissibly or groundedly accepted.

**Explanation:**
**Step 1: identify self-attacks.** (A2,A2) ∈ Att means A2 self-attacks. Any set containing A2 has an internal attack and is not conflict-free.
**Step 2: find all conflict-free sets.** Exclude any set containing A2. Check remaining subsets of {A0,A1}: ∅ — conflict-free. {A0} — no self-attack, conflict-free. {A1} — no self-attack, conflict-free. {A0,A1}: does A0 attack A1 or A1 attack A0? (A1,A0) ∈ Att, so A1 attacks A0. Not conflict-free.
**Step 3: check admissibility of {A0}.** A0's only attacker is A1 (from (A1,A0)). To defend A0, the set must contain something attacking A1. The only argument attacking A1 is A2 (from (A2,A1)), but A2 cannot be in any conflict-free set. So A0 is undefended. {A0} is not admissible.
**Step 4: check admissibility of {A1}.** A1's only attacker is A2 (from (A2,A1)). Note that A2 self-attacks, meaning A2 is still an attacker of A1 even though it is self-defeating. To defend A1, the set must contain something attacking A2. The only argument attacking A2 (besides A2 itself, which cannot be included) is A0 (from (A0,A2)). But {A1} does not contain A0. So A1 is undefended. {A1} is not admissible.
**Step 5: conclude admissible extensions.** Only ∅ is admissible. f(∅) = ∅ (fixed point), so GE = ∅. No argument is admissibly or groundedly acceptable.

---

### Q19 — AR={A0,A1,A2,A3}, Att={(A1,A0),(A2,A1),(A0,A2),(A3,A2)}

**Answer:** conflict-free = {∅,{A0},{A1},{A2},{A3},{A0,A3},{A1,A3}}; admissible = {∅,{A3},{A1,A3}}; GE={A1,A3}; admissibly and groundedly accepted: A1, A3.

**Explanation:**
**Step 1: map the attacks.** A1 attacks A0. A2 attacks A1. A0 attacks A2. A3 attacks A2. Note there are no self-attacks.
**Step 2: find conflict-free sets.** First list who attacks whom: A1's attacker is A2; A0's attacker is A1; A2's attackers are A0 and A3; A3 has no attacker. Now test every pair: {A0,A1} conflicts (A1 attacks A0). {A1,A2} conflicts (A2 attacks A1). {A0,A2} conflicts (A0 attacks A2). {A2,A3} conflicts (A3 attacks A2). The two pairs left standing are {A0,A3} and {A1,A3} (neither attacks the other in either direction) — both conflict-free. Any triple or the full set inherits one of the four conflicting pairs above, so none of them are conflict-free. Conflict-free sets: $\emptyset,\{A0\},\{A1\},\{A2\},\{A3\},\{A0,A3\},\{A1,A3\}$.
**Step 3: check admissibility of {A3}.** A3 has no attackers (Step 2), so $\{A3\}$ is trivially admissible: conflict-free, and it defends A3 vacuously (nothing to counter-attack).
**Step 4: check admissibility of {A1,A3}.** Conflict-free by Step 2. A1's only attacker is A2. Does the set attack A2? Yes: A3 attacks A2, and $A3 \in \{A1,A3\}$, so A1 is defended. A3 has no attacker, so it is vacuously defended. Both members defended $\implies \{A1,A3\}$ is admissible.
**Step 5: check the other candidates fail.** $\{A0\}$: A0's attacker is A1; does A0 attack A1? No — A0 only attacks A2. Undefended $\implies$ not admissible. $\{A0,A3\}$: conflict-free (Step 2), but A0 is still undefended by the same argument (A3 doesn't attack A1 either) $\implies$ not admissible. $\{A2\}$: A2's attackers are A0 and A3; A2 attacks neither $\implies$ not admissible.
**Step 6: compute the grounded extension via iteration.** Round 0: $f(\emptyset)$ = arguments with zero attackers = $\{A3\}$ (vacuously defended by $\emptyset$). Round 1: $f(\{A3\})$ — check each argument's attacker(s) against $\{A3\}$: A0's attacker A1 is not attacked by A3, so A0 stays out. A1's attacker A2 **is** attacked by A3 (A3→A2), so A1 is now defended and joins. A2's attackers are A0 and A3; A3 attacks neither, so A2 stays out (note: A3 attacking A2 directly does not "defend" A2 — attacking is the opposite of defending). So $f(\{A3\}) = \{A3,A1\}$. Round 2: $f(\{A3,A1\})$ — does anything new get defended? A0's attacker A1 would need to be attacked by the set; neither A3 nor A1 attacks A1 itself, so A0 still stays out. A2's attackers A0 and A3 would both need to be attacked by the set; still no. No growth $\implies$ fixed point reached at round 1. $GE = \{A1,A3\}$.

---

### Q20 — AR={A0,A1,A2}, Att={(A1,A0),(A2,A0),(A1,A2),(A2,A1)} ("double cycle")

**Answer:** conflict-free = {∅,{A0},{A1},{A2}}; admissible = {∅,{A1},{A2}}; GE = ∅; admissibly accepted: A1, A2; groundedly accepted: none.

**Explanation:**
**Step 1: map the attacks.** A1 attacks A0 and A2. A2 attacks A0 and A1. A0 attacks nobody (A0 does not appear as the first element of any pair in Att).
**Step 2: find conflict-free sets.** {A1,A2}: A1 attacks A2 and A2 attacks A1 — mutual attack, not conflict-free. {A0,A1}: A1 attacks A0 — not conflict-free. {A0,A2}: A2 attacks A0 — not conflict-free. All singletons and ∅ are conflict-free (no self-attacks exist).
**Step 3: check admissibility of {A1}.** A1's attacker is A2 (from (A2,A1)). Does A1 attack A2? Yes: (A1,A2) ∈ Att. So {A1} defends A1 against A2. {A1} is admissible.
**Step 4: check admissibility of {A2}.** A2's attacker is A1. Does A2 attack A1? Yes: (A2,A1) ∈ Att. So {A2} defends A2 against A1. {A2} is admissible.
**Step 5: check admissibility of {A0}.** A0 is attacked by A1 and A2. Does A0 attack A1? No — A0 appears in no attack pairs as attacker. Does A0 attack A2? No. So {A0} cannot defend A0 against either attacker. {A0} is not admissible.
**Step 6: compute the grounded extension.** f(∅) = {X | ∅ defends X}. For ∅ to defend X, ∅ must attack every attacker of X — but ∅ attacks nothing. So f(∅) = ∅ only if X has no attackers. A0 is attacked (by A1 and A2), A1 is attacked (by A2), A2 is attacked (by A1). No argument is unattacked. f(∅) = ∅, which is a fixed point. GE = ∅. No argument is groundedly acceptable.

---

## mt7 (mid term practice 7.pdf)

### Q5 — knowledge base to arguments
KB: d1 "Students are normally not married", d2 "Students are normally young adults", s1 "Young adults are adults", d3 "Adults are normally married", e1 "Alex is a student". (a) Form all arguments A1={e1,d1 ∴ Alex is not married}, A2={e1,d2 ∴ Alex is a young adult}, A3={A2,s1 ∴ Alex is an adult}, A4={A3,d3 ∴ Alex is married}. (b) Identify attack relationships (rebutting/undermining/undercutting).

**Answer:** A1 and A4 rebut each other (contradictory conclusions "not married" vs "married").

**Explanation:**
**Step 1: state the three attack types for ASPIC+ structured argumentation.** A rebutting attack targets a conclusion drawn by a defeasible rule — two arguments rebut each other when their conclusions are contradictory and at least one used a defeasible rule as its last step. An undermining attack targets a defeasible premise (a fact used in a defeasible step that has not itself been derived). An undercutting attack targets the applicability of a defeasible rule directly (the attacker's conclusion is of the form "rule d does not apply here").
**Step 2: identify A1 and A4's conclusions.** A1 concludes: Alex is not married (via defeasible rule d1). A4 concludes: Alex is married (via defeasible rule d3 applied to A3's conclusion). These are contradictory.
**Step 3: classify the A1-A4 relationship.** Both conclusions are derived via defeasible rules (d1 for A1, d3 for A4). The conclusions are direct contradictions. This fits the definition of a rebutting attack. Both (A1,A4) and (A4,A1) are rebutting attacks.
**Step 4: check whether any other attacks exist.** A2 concludes "Alex is young adult" — no other argument contradicts this. A3 concludes "Alex is an adult" — no argument contradicts this either. No argument attacks a defeasible premise of another, and no argument's conclusion has the form "rule di does not apply." So the only attacks are the mutual rebutting attacks between A1 and A4.

---

### Q6 — continue Q5, build AF and evaluate claim
(a) Define AA framework (AR,Att) from Q5's arguments/attacks. (b) Evaluate "Alex is married" (=conclusion of A4) under admissible vs grounded semantics.

**Answer:** AR={A1,A2,A3,A4}, Att={(A1,A4),(A4,A1)}. "Alex is married" is admissibly acceptable (A4∈{A4}, an admissible extension) but not groundedly acceptable (GE={A2,A3}, A4∉GE).

**Explanation:**
**Step 1: construct the framework.** From Q5, the only attacks are (A1,A4) and (A4,A1). All four arguments A1, A2, A3, A4 are in AR. The framework is F = ({A1,A2,A3,A4}, {(A1,A4),(A4,A1)}).
**Step 2: identify unattacked arguments.** A2 and A3 have no argument attacking them (no pair (X,A2) or (X,A3) in Att). They are unattacked.
**Step 3: compute the grounded extension by iteration.** f(∅) = {X | ∅ defends X}: since ∅ attacks nothing, only arguments with no attackers are defended — these are A2 and A3. f(∅) = {A2,A3}. Now compute f({A2,A3}) = {X | {A2,A3} defends X}: A2 and A3 remain (no attackers). For A1: A1's attacker is A4. Does {A2,A3} attack A4? No — neither A2 nor A3 appears as the first element of any attack pair against A4. A1 is not defended. For A4: A4's attacker is A1. Does {A2,A3} attack A1? No. A4 is not defended. f({A2,A3}) = {A2,A3}, a fixed point. GE = {A2,A3}.
**Step 4: check admissibility of {A4}.** A4 is conflict-free as a singleton (no self-attack). A4's attacker is A1. Does A4 attack A1? Yes: (A4,A1) ∈ Att. So {A4} defends A4 against its sole attacker. {A4} is admissible.
**Step 5: state the conclusion.** Under grounded semantics: GE = {A2,A3} does not contain A4, so "Alex is married" is not groundedly acceptable. Under admissible semantics: A4 ∈ {A4} and {A4} is admissible, so "Alex is married" is admissibly acceptable. The claim is accepted under the more permissive semantics but not under the most skeptical (grounded) one.

---

### Q7 — infinite AF, compute GE
AR = {A,D} ∪ {B1,B2,…} ∪ {C1,C2,…}. Att = {(Bn,A),(A,Bn) | n≥1} ∪ {(Cn,Bn) | n≥1} ∪ {(D,Cn) | n≥1}.

**Answer:** GE = {D}.

**Explanation:**
**Step 1: find arguments with no attackers.** An argument is unattacked if no other argument attacks it. Check each argument: A is attacked by every Bn. Each Bn is attacked by A and by Cn. Each Cn is attacked by D. D: look for any (X,D) in Att — none exists. D is unattacked.
**Step 2: compute f(∅).** f(∅) = {X | ∅ defends X}. ∅ defends X only if X has no attackers. Only D qualifies. f(∅) = {D}.
**Step 3: compute f({D}).** f({D}) = {X | {D} defends X}. For D itself: no attackers, trivially defended — D ∈ f({D}). For each Cn: Cn is attacked by D. Does {D} defend Cn? {D} must attack every attacker of Cn. The only attacker of Cn is D itself. Does {D} attack D? No — (D,D) is not in Att. So Cn is not defended. For each Bn: Bn is attacked by A and by Cn. For {D} to defend Bn, {D} must attack both A and Cn. But D attacks only the Cn's via (D,Cn), and does not attack A. So Bn is not defended by {D}. For A: attacked by all Bn; {D} does not attack any Bn (D only attacks Cn's). A is not defended. f({D}) = {D}.
**Step 4: conclude.** f({D}) = {D} = f(∅), so the iteration has reached a fixed point after one step. GE = {D}.

---

### Q8 — proof: attacking pair cannot both be groundedly acceptable
"Prove that in an abstract argumentation framework F=(AR,Att), if A,B∈AR and (A,B)∈Att, then it cannot be that both A and B are groundedly acceptable."

**Answer:** Proved by contradiction using conflict-freeness of GE.

**Explanation:**
**Step 1: recall the definition of grounded acceptability.** An argument X is groundedly acceptable if X ∈ GE, where GE is the unique grounded extension.
**Step 2: recall that GE is admissible.** As proved in Q15, GE is an admissible extension. Admissibility requires conflict-freeness: a set S is conflict-free if there is no pair X, Y ∈ S such that (X,Y) ∈ Att.
**Step 3: assume for contradiction that both A and B are groundedly acceptable.** Then A ∈ GE and B ∈ GE, which means {A,B} ⊆ GE.
**Step 4: derive the contradiction.** By hypothesis, (A,B) ∈ Att — A attacks B. But both A and B are in GE, so GE contains two arguments where one attacks the other. This violates the conflict-freeness of GE.
**Step 5: conclude.** The assumption that both A and B are groundedly acceptable leads to a contradiction. It cannot be that both A and B are groundedly acceptable. ∎

---

### Q9 (5 marks) — describe the steps of argument-based reasoning
"Write a paragraph describing different steps of argument-based reasoning starting from a knowledge base ∆."

**Answer:** (1) Form arguments from ∆, giving a set $AR_\Delta$. (2) Identify attacks between the formed arguments, giving $Att_\Delta \subseteq AR_\Delta \times AR_\Delta$. (3) Form the AA framework $\mathcal{F}_\Delta = (AR_\Delta, Att_\Delta)$. (4) Select an argumentation semantics $\sigma$. (5) Use $\sigma$ to evaluate acceptability: $\mathcal{F}_\Delta \vdash_\sigma A$ means $A$ is acceptable under $\sigma$. (6) If $\mathcal{F}_\Delta \vdash_\sigma A$, extract $A$'s conclusion and treat it as an acceptable claim/inference from $\Delta$.

**Explanation:**
**Step 1: why start from ∆?** The knowledge base ∆ contains the raw information — facts, rules (strict and defeasible), and assumptions. Arguments are not given directly; they must be constructed by chaining rules from ∆.
**Step 2: what happens in step (1) — forming arguments.** Each argument is a finite, acyclic chain of rule applications starting from elements of ∆. In ASPIC+, this means combining strict and defeasible rules. The sub-arguments of any argument are also arguments. The result is the set $AR_\Delta$ of all constructible arguments.
**Step 3: what happens in step (2) — identifying attacks.** For every pair of arguments, check whether a rebutting, undermining, or undercutting relationship holds. This yields the attack relation $Att_\Delta$.
**Step 4: what happens in step (3) — forming the framework.** $(AR_\Delta, Att_\Delta)$ is the abstract argumentation framework (AF) corresponding to ∆. From this point, the content of arguments no longer matters — only the attack structure.
**Step 5: what happens in steps (4) and (5) — semantics and evaluation.** Choose a semantics $\sigma$ (grounded, preferred, admissible, stable). Apply $\sigma$ to $(AR_\Delta, Att_\Delta)$ to compute extensions. An argument A is acceptable under $\sigma$ if it belongs to at least one $\sigma$-extension (or the unique one, in the case of grounded semantics).
**Step 6: what happens in step (6) — extraction.** The conclusion of an acceptable argument is treated as a claim that follows from ∆ under the chosen semantics. This is the output of the reasoning process.
**Step 7: connect to Q5–Q6.** ∆ = {d1,d2,s1,d3,e1} produced $AR_\Delta = \{A1,A2,A3,A4\}$ (step 1). The rebut between A1 and A4 gave $Att_\Delta$ (step 2). Choosing $\sigma =$ grounded gave GE = {A2,A3}, so "Alex is married" was not extractable under grounded semantics (steps 4–6). Choosing $\sigma =$ admissible gave {A4} as an admissible extension, making "Alex is married" extractable under that weaker semantics.

---

## mt6 (mid term practice 6.pdf)

### Q6 (10 marks) — infinite "star" framework: admissible, preferred, grounded
F=(AR,Att), AR={A,G}∪{B1,B2,…,Bn,…}, Att={(G,A)}∪{(Bᵢ,G)|i∈ℕ}∪{(Bᵢ,Bⱼ)|i≠j} (every Bᵢ attacks G and every other Bⱼ; G attacks A). (a) List all admissible extensions. (b) List all preferred extensions. (c) Compute GE.

**Answer:** (a) admissible extensions: ∅, {Bᵢ} for each i, {A,Bᵢ} for each i. (b) preferred extensions: {A,Bᵢ} for each i. (c) GE = ∅.

**Explanation:**
**Step 1: map the attack structure.** G attacks A. Every Bᵢ attacks G and also attacks every other Bⱼ (j ≠ i). A attacks nobody. Note that A is attacked only by G; G is attacked by every Bᵢ; each Bᵢ is attacked by every Bⱼ with j ≠ i.
**Step 2: check which sets are conflict-free.** ∅: trivially conflict-free. Any singleton {A}, {G}, or {Bᵢ}: no self-attacks, so conflict-free. {A,G}: G attacks A, so this set has an internal attack — not conflict-free. {Bᵢ,Bⱼ} for i ≠ j: Bᵢ attacks Bⱼ and Bⱼ attacks Bᵢ — not conflict-free. {A,Bᵢ}: A does not attack Bᵢ and Bᵢ does not attack A — conflict-free. No larger set including two different Bᵢ's is conflict-free.
**Step 3: check admissibility of {Bᵢ}.** Bᵢ is attacked by every Bⱼ with j ≠ i. For {Bᵢ} to defend Bᵢ, Bᵢ must attack every such Bⱼ — and indeed (Bᵢ,Bⱼ) ∈ Att for all j ≠ i. So {Bᵢ} defends Bᵢ against all its attackers. {Bᵢ} is admissible.
**Step 4: check admissibility of {A,Bᵢ}.** This set is conflict-free (Step 2). A's only attacker is G. Does the set attack G? Yes: (Bᵢ,G) ∈ Att and Bᵢ ∈ {A,Bᵢ}. So A is defended. Bᵢ's attackers are all Bⱼ with j ≠ i. Bᵢ attacks each such Bⱼ, so Bᵢ is defended. {A,Bᵢ} is admissible.
**Step 5: check whether {G} is admissible.** G is attacked by every Bᵢ. For {G} to defend G, G must attack every Bᵢ — but (G,Bᵢ) is not in Att. {G} does not defend G and is not admissible.
**Step 6: check preferred extensions.** A preferred extension is a maximal admissible extension (no admissible extension properly contains it). {Bᵢ} ⊂ {A,Bᵢ} and {A,Bᵢ} is admissible — so {Bᵢ} is not maximal. {A,Bᵢ} cannot be extended while remaining conflict-free (adding any Bⱼ for j ≠ i would conflict with Bᵢ; adding G would conflict with Bᵢ). So each {A,Bᵢ} is a preferred extension.
**Step 7: compute GE.** f(∅) = {X | X has no attackers}: A is attacked by G. G is attacked by every Bᵢ. Every Bᵢ is attacked by every other Bⱼ. No argument has zero attackers. f(∅) = ∅, which is already a fixed point. GE = ∅. This illustrates a framework where infinitely many preferred extensions exist but the grounded extension is empty — grounded semantics is maximally skeptical here.

---

### Q7 (10 marks) — proof: an argument attacked by GE cannot be admissibly acceptable
"Prove that in any abstract argumentation framework F=(AR,Att), if an argument A∈AR is attacked by some argument in the grounded extension GE, then A cannot be admissibly acceptable."

**Answer:** Proved by contradiction, by induction on the layers $f^i(\emptyset)$ that build up GE.

**Explanation:**
**Step 1: set up the proof by contradiction.** Suppose some argument B ∈ GE attacks A (so (B,A) ∈ Att), and suppose for contradiction that A ∈ E for some admissible extension E.
**Step 2: use admissibility of E.** Since E is admissible, E defends every argument in it. A ∈ E and A is attacked by B. So E must contain some argument C with (C,B) ∈ Att, meaning E attacks B.
**Step 3: recall that GE = ⋃ᵢ fⁱ(∅).** B ∈ GE means B ∈ fᵏ(∅) for some finite stage k.
**Step 4: prove by induction on i that E cannot attack fⁱ(∅).** Base case i=0: f⁰(∅) = ∅. E cannot attack ∅ (∅ has no elements). The base case holds. Inductive step: assume E does not attack fᵏ(∅). Suppose for contradiction E attacks fᵏ⁺¹(∅), meaning some D ∈ E attacks some argument X ∈ fᵏ⁺¹(∅). By definition X ∈ f(fᵏ(∅)), meaning fᵏ(∅) defends X. Since D ∈ E attacks X, fᵏ(∅) must contain some argument Y with (Y,D) ∈ Att — fᵏ(∅) attacks D. But D ∈ E and Y ∈ fᵏ(∅) ⊆ GE with (Y,D) ∈ Att means D is attacked by GE. Since E is admissible and D ∈ E, E must defend D — so E must attack Y. But Y ∈ fᵏ(∅), and we assumed E does not attack fᵏ(∅) — contradiction.
**Step 5: derive the final contradiction.** By the induction result, E never attacks any fⁱ(∅), so E never attacks any element of GE. But Step 2 showed E must attack B ∈ GE. Contradiction. So A cannot belong to any admissible extension — A is not admissibly acceptable. ∎

---

### Bonus Q — stable extensions
Worked examples of an AF with **no** stable extension (a single self-attacker, e.g. AR={A}, Att={(A,A)}) and one **with multiple** stable extensions (mutual 2-cycle, Att={(A,B),(B,A)}, giving stable extensions {A} and {B}).

**Answer:** self-attacker case: no stable extension exists. 2-cycle case: {A} and {B} are both stable extensions.

**Explanation:**
**Step 1: recall the definition of a stable extension.** A set S is a stable extension if (i) S is conflict-free — no argument in S attacks another argument in S — and (ii) S attacks every argument outside S — for every argument X ∉ S, at least one argument in S attacks X.
**Step 2: apply to the self-attacker case (AR={A}, Att={(A,A)}).** The only subsets are ∅ and {A}. {A}: A attacks itself, so {A} has an internal attack — not conflict-free. ∅: conflict-free. But ∅ attacks nothing, and A ∉ ∅, so ∅ fails to attack A. Neither subset satisfies both conditions. No stable extension exists.
**Step 3: apply to the 2-cycle case (AR={A,B}, Att={(A,B),(B,A)}).** Consider {A}: conflict-free (A does not attack itself). Does {A} attack every argument outside {A}? The only argument outside {A} is B. (A,B) ∈ Att, so yes. {A} is a stable extension. By symmetry, consider {B}: conflict-free. Does {B} attack every argument outside {B}? The only outside argument is A. (B,A) ∈ Att, so yes. {B} is a stable extension.
**Step 4: observe the contrast with the grounded extension.** The grounded extension is always unique (there is exactly one). Stable extensions can fail to exist at all (self-attacker case) or can be multiple (2-cycle case). Every stable extension is also a preferred extension, but not every preferred extension is stable.
