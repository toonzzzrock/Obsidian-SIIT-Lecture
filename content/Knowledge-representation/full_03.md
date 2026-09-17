# CSS 434 Knowledge Representation and Reasoning - Midterm Study Guide

Built from Module 1-5 lecture PDFs (`m/`) and all 7 midterm practice sets (`mt/`). Part A is the concept reference, organized by exam topic, not lecture order. Part B is every practice question from all 7 sets, tagged to a Part A section, with a worked answer (existing answer keys verified/completed where the source PDF left blanks).

Course structure (Module 1): 1 Intro to Knowledge & Reasoning, 2 Arguments in NL, 3 Propositions in NL, 4 Argument-based Reasoning & Argumentation Semantics, 5 Propositional Proof Systems, 6 Probabilistic Logic Programming, 7 Predicate/Herbrand Logic, 8 Structured Argumentation (Aspic+), 9 Current topics. Midterm content is drawn from Modules 1-5.

Key relations to remember throughout: `KB |- phi` (provable) is **sound** if it implies `KB |= phi` (entailed); **complete** if entailment implies provability. Prefer sound-but-incomplete over complete-but-unsound (Godel: no system captures all of arithmetic both soundly and completely).

---

## Part A - Concept Reference

### A1. Arguments in Natural Language

**Argument** = series of sentences where some are **premises** and exactly one is the **conclusion**, and the premises are *intended* to give a reason for the conclusion. Not every juxtaposition of sentences is an argument: commands, questions, and mere sequences of statements with no reason-giving relationship are not arguments.

**Argument markers** flag which sentence is which:
- Reason markers: *since, because, for, as, in view of the fact that*
- Conclusion markers: *hence, thus, so, accordingly, as a result, it follows that*
- **Substitution test** for ambiguous words (*since, for, then*): swap in a canonical marker (*because* / *hence*); if meaning is preserved, it's a marker, if not, it's just temporal/other ("He's been a citizen since 1973" is not the same as "...because 1973", so *since* is not a marker there).
- Not all "and"/"since"/"so" usages are markers or conjunctions; check by substitution/entailment.

**Standard form**: numbered premises, then a conclusion marked with `:.`, e.g.:
```
(1) All men are mortal.
(2) Socrates is a man.
:. (3) Socrates is mortal. (from 1,2)
```

**Argument mining from messy text**, 3-step procedure:
1. Remove excess verbiage: repeated premises, illustrative examples, tangents.
2. Break up compound premises into separate numbered statements.
3. Supply suppressed (implicit) premises needed to make the reasoning explicit; usually a general rule connecting a specific premise to the conclusion.

**Deductive vs non-deductive (inductive/defeasible)**:
- **Deductive**: impossible for all premises to be true and conclusion false. Equivalent: if premises true, conclusion *must* be true.
- **Non-deductive**: not deductive; premises can all be true while conclusion is false. To show non-deductive, **exhibit a truth assignment/scenario making all premises true and the conclusion false**.
- A deductive argument's inference is water-tight; classic deductive fallacies to recognize as non-deductive: **affirming the consequent** (`P->Q, Q :. P`), **denying the antecedent** (`P->Q, notP :. notQ`).
- An argument with *inconsistent* premises is vacuously deductive (premises can never all be true, so the conditional "if true then..." holds trivially).

**Sub-arguments and support**: A supports B if `cnl(A)` backs a premise of B; if A is literally part of `reas(B)`, A is a *sub-argument* of B, and `cnl(A)` is an *intermediate conclusion* of B.

**Attack relation**: A attacks B via exactly one of:
- **Rebut**: `cnl(A)` and `cnl(B)` (direct) or `cnl(A)` and an intermediate conclusion of B (indirect) are contradictory. Often symmetric.
- **Undermine** (premise-attack): `cnl(A)` is contrary to a premise of `reas(B)`.
- **Undercut**: `cnl(A)` is contrary to an inference step of B (attacks the *rule's applicability*, not a premise or conclusion). Example: "He has a cough, so he's ill" undercut by "the AC blew dirty air, so cough=>ill doesn't apply here."
- **Deductive arguments can be rebutted or undermined but never undercut** (every inference step is water-tight, nothing to contest).

### A2. Categorical Propositions and Venn Diagrams

Four canonical forms (quantifiers **All / Some / No**, categories S, P):

| Name | Form | Set meaning | Venn diagram |
|---|---|---|---|
| A | All S are P | S\P = empty | region S\P shaded |
| E | No S are P | S and P disjoint | region S and P shaded |
| I | Some S are P | S and P overlap | `*` in S and P overlap |
| O | Some S are not P | S\P nonempty | `*` in S\P |

**Negation via Venn diagram**: shaded flips to asterisked, white stays white. So not(No S is P) = Some S is P (E to I), not(All S is P) = Some S is not P (A to O).

**Deductiveness check for categorical-proposition arguments**: draw the Venn diagram implied by the premises; the argument is deductive iff that diagram forces the conclusion's diagram (every state consistent with the premises already satisfies the conclusion).

**Standard single-premise conversions**:
- `Some S are P :. Some P are S`: deductive (same diagram, `*` in symmetric region).
- `No S are P :. No P are S`: deductive (same diagram, symmetric shading).
- `Some S are not P :. Some P are not S`: **not** deductive (different regions, S\P differs from P\S).

**The four-pattern drill (memorize, appears repeatedly across practice sets)**:
- a. Some P is M. Some S is not M. Conclude Some S is P. **Not deductive** (undistributed middle, two particular premises).
- b. All M is P. No S is M. Conclude No S is P. **Not deductive** (M subset of P doesn't stop S overlapping P outside M).
- c. No M is P. Some S is not M. Conclude Some S is not P. **Not deductive**.
- d. No P is M. Some S is M. Conclude Some S is not P. **Deductive** (S has a member in M, M is disjoint from P, so that member is not in P).

**Existential import caveat**: `All S are P :. Some S are P` is only valid if S is assumed non-empty. This course defines "All S are P" via set difference (S\P = empty) with **no existential-import assumption**, so treat it as **not deductive** unless the argument states S is non-empty.

### A3. Propositional Logic - Syntax and Semantics

**Signature Sigma**: set of propositional atoms. **Language L**: all sentences built from Sigma with `not, and, or, ->, <->` (L is infinite even for finite Sigma).

**Truth assignment** `i : Sigma -> {T,F}`; `2^n` assignments for `|Sigma|=n`. `phi^i` = truth value of phi under i. `M(phi) = {i | phi^i = T}` = models of phi.

**Truth tables for the connectives**: memorize `->`: false only when antecedent T and consequent F; `P <- Q` is equivalent to `Q -> P`.

**Classification** (`I` = all assignments):
- **valid**: `M(phi) = I` (true under every assignment)
- **contingent**: strictly between empty and I
- **unsatisfiable**: `M(phi) = empty`
- **satisfiable** = valid or contingent (`M(phi)` nonempty)
- **falsifiable** = contingent or unsatisfiable (`M(phi) != I`)

Common valid schemas worth recognizing on sight: `(p->q) or (q->p)`, double negation `p <-> not not p`, De Morgan's laws, `p -> (q -> p)`, implication distribution `(p -> (q -> r)) -> ((p -> q) -> (p -> r))`.

**Logical equivalence**: `phi === psi` iff `M(phi)=M(psi)`.
**Consistency**: phi consistent with Delta iff some assignment satisfies phi and all of Delta.
**Logical entailment**: `Delta |= psi` iff every assignment satisfying all of Delta also satisfies psi, i.e. `M(Delta)` subset of `M(psi)`. If Delta is unsatisfiable, `Delta |= psi` for *any* psi (vacuous truth).
**Unsatisfiability Theorem** (core trick behind most entailment questions): `Delta |= phi` **iff** `Delta union {not phi}` is unsatisfiable.

**SAT**: is F satisfiable? NP-complete; truth-table check is exponential (`2^n`); real solvers (MiniSAT etc.) do well in practice.

**Encoding a constraint problem as a propositional sentence** (graph-coloring pattern, reusable for exam-scheduling too): for nodes V and colors/slots C,
- Signature: one atom per (node, color) pair.
- `F1` = at least one color per node: for each node, disjunction over its color atoms, conjoined across nodes.
- `F2` = at most one color per node: for each node and each pair of colors, `not(atom_c1 and atom_c2)`.
- `F3` = adjacent nodes differ: for each edge (n,m) and each color c, `not(n_c and m_c)`.
- `F = F1 and F2 and F3`; every satisfying assignment is a valid coloring/scheduling.

### A4. Proof Systems (turning `|=` into mechanical `|-`)

Three approaches to check `Delta |= phi`: (1) truth table, exponential but simple; (2) SAT-based, check `Delta union {not phi}` unsatisfiable; (3) proof-based, symbolic derivation, usually much shorter.

**Proof system R** is sound if `Delta |-_R phi` implies `Delta |= phi`; complete if the reverse holds. Fitch and Resolution (below) are both sound *and* complete.

#### A4.1 Fitch Natural Deduction (10 rules, one intro + one elim per connective)

| Rule | Form |
|---|---|
| Negation Intro (NI) | from `phi->psi` and `phi->not psi`, derive `not phi` |
| Negation Elim (NE) | from `not not phi`, derive `phi` |
| And Intro (AI) | from `phi1,...,phin`, derive `phi1 and ... and phin` |
| And Elim (AE) | from `phi1 and ... and phin`, derive any `phii` |
| Or Intro (OI) | from any `phii`, derive `phi1 or ... or phin` |
| Or Elim (OE) | from `phi1 or ... or phin` and each `phii->psi`, derive `psi` |
| Implication Intro (II) | from a subproof `phi |- psi` (assume phi, derive psi), derive `phi->psi` |
| Implication Elim (IE) / Modus Ponens | from `phi->psi` and `phi`, derive `psi` |
| Biconditional Intro (BI) | from `phi->psi` and `psi->phi`, derive `phi<->psi` |
| Biconditional Elim (BE) | from `phi<->psi`, derive `phi->psi` (or `psi->phi`) |

Worked pattern, prove `p->r` from `{p->q, q->r}`:
```
1. p -> q            Premise
2. q -> r            Premise
  3.1 p              Assumption
  3.2 q              IE 1,3.1
  3.3 r              IE 2,3.2
4. p -> r            II 3.1-3.3
```
Any "use Fitch to prove X" question is: open an assumption subproof for the antecedent you need, chase IE/AE/OE down to the target, close with II (or OE/NI as needed).

#### A4.2 Clausal Form and the INDO Procedure

**Literal**: an atom or its negation. **CNF**: conjunction of disjunctions of literals. **Clausal form**: CNF written as a set of clauses, each clause a set of literals (so `a or a` collapses to `{a}`; the empty clause `{}` is unsatisfiable by definition, no literal to satisfy it).

**Indo** converts any sentence to clausal form:
1. **I**mplication out: `phi1->phi2` is equivalent to `not phi1 or phi2`.
2. **N**egation in: push `not` to atoms via double negation and De Morgan (`not(phi1 and phi2)` equiv `not phi1 or not phi2`, `not(phi1 or phi2)` equiv `not phi1 and not phi2`).
3. **D**istribution: `phi1 or (phi2 and phi3)` equiv `(phi1 or phi2) and (phi1 or phi3)`; repeat until fully CNF.
4. **O**perator out: read off the clause set from the conjunction of disjunctions.

Worked example, clausal form of `(p->q)->(q->r)`:
```
I   not(p->q) or (q->r)   ->   not(not p or q) or (not q or r)
N   (not not p and not q) or (not q or r)   ->   (p and not q) or (not q or r)
D   (p or not q or r) and (not q or not q or r)
O   {p,not q,r}, {not q,r}
```
Clausal form of a whole KB Delta = union of the clausal forms of each sentence in Delta.

#### A4.3 Propositional Resolution

**Resolution rule**: from `{phi1,...,chi,...,phin}` and `{psi1,...,not chi,...,psin}`, derive `{phi1,...,phin,psi1,...,psin}` (the two clauses minus the complementary pair `chi, not chi`, union of the rest). Modus ponens is a special case (chi->phi is `{phi, not chi}`, chi is `{chi}`, resolve to get `{phi}`).

**Resolution derivation** of phi from Delta: sequence of clauses ending at unit clause `{phi}`, each either a premise or from Resolution on earlier clauses. Sound but *not complete alone* (e.g. Delta=empty can't derive any valid phi even though `empty |= phi` for valid phi).

**Resolution proof** (fixes completeness, uses the Unsatisfiability Theorem): a resolution *proof* of phi from Delta is a resolution *derivation of the empty clause `{}`* from the clausal form of `Delta union {not phi}`. This is sound **and** complete: `Delta |= phi` iff such a proof exists.

Standard recipe for "use Resolution to prove Delta |= phi":
1. Clausal-form Delta (via INDO on each sentence) and clausal-form `not phi`.
2. Union all clauses.
3. Resolve repeatedly until you derive `{}`, citing which two clauses/lines each step used.

Worked example: Delta={p, p->q, (p->q)->(q->r)}, prove phi=r: clausal(Delta)={{p},{not p,q},{p,not q,r},{not q,r}}, clausal(not phi)={not r}. Resolve `{p},{not p,q}` gives `{q}`; `{not q,r},{q}` gives `{r}`; `{r},{not r}` gives `{}`. Empty clause reached, so proved.

### A5. Abstract Argumentation Frameworks (Dung AFs)

**AF**: `F = (AR, Att)`, AR a set of arguments, `Att` a subset of `AR x AR`, a binary attack relation. (Extensions exist: Bipolar AF adds a support relation; Generalized AF has n relations.)

For `S` subset of `AR`, `A` in `AR`:
- **S attacks A** iff some `X` in `S` has `(X,A)` in `Att`.
- **S is conflict-free** iff no `X,Y` in `S` with `(X,Y)` in `Att`.
- **S (collectively) defends A** iff S attacks every argument attacking A.

**Semantics** (all built on conflict-freeness + defense):
- **Admissible extension**: conflict-free and defends every member of itself. Empty set is always admissible (but proves nothing). A is *admissibly acceptable* iff A is in some admissible extension.
- **Complete extension**: admissible and contains every argument it defends.
- **Preferred extension**: maximal complete extension (no proper superset is also complete).
- **Grounded extension (GE)**: the *least* fixed point of the characteristic function; unique, always exists.
- **Stable extension**: complete **and** attacks every argument not in it (for every X not in S, some Y in S has `(Y,X)` in Att). Stable extensions may not exist (e.g. self-attacking singleton `{A}` with `Att={(A,A)}` has none) or may be multiple.

**Characteristic function**: `f_F(X) = {A in AR | X defends A}`. `S` is a complete extension iff it's an admissible fixed point of `f_F` (`f_F(S)=S`).

**Computing GE, the standard exam algorithm**:
```
GE = f_F(empty) union f_F(f_F(empty)) union f_F^3(empty) union ... = union over i of f_F^i(empty)
```
`f_F(empty)` = all arguments with **no attackers** (vacuously defended by empty set). Then keep applying f_F and unioning until it stabilizes (finite AFs) or forms the infinite union (infinite AFs, track the pattern across iterations).

**Skepticism ordering**: grounded is the **most skeptical** semantics, admissible the **least**: if `F |-_gr A` then `F |-_sigma A` then `F |-_ad A` for any sigma (reverse can fail). Admissible, complete, and preferred all **coincide** on which individual arguments are acceptable (Lemma: `F|-_ad A` iff `F|-_com A` iff `F|-_pr A`), even though the *extensions themselves* differ. Grounded acceptable implies admissibly acceptable, not conversely.

**Reference worked cases** (patterns that recur in every practice set):
- No attacks at all (`Att=empty`): whole AR is admissible; every argument is both admissibly and groundedly acceptable.
- Single self-attack (`Att={(A,A)}`): `{A}` not conflict-free, so only `empty` admissible, so A accepted under neither semantics; no stable extension.
- Even attack cycle, e.g. `{(B,C),(C,B)}`: `{B}` and `{C}` both admissible (each defends itself by attacking the only attacker of the other), so both B,C admissibly acceptable, but GE=empty (neither survives the least-fixed-point computation), so neither groundedly acceptable.
- Odd attack cycle, e.g. 3-cycle `{(A,B),(B,C),(C,A)}`: only `empty` is admissible, so nobody accepted under any semantics.
- Chain with one unattacked root defending down a chain (e.g. D attacks-chain-into C_n attacks-chain-into B_n which mutually attacks A): GE picks up the unattacked root immediately, and propagates defense down the chain **only as far as the alternation of attacks allows**; an argument attacked from *outside* the chain that the chain can't in turn attack stays excluded from GE even though the chain defends its immediate neighbors. Always trace `f_F(empty), f_F^2(empty), ...` explicitly rather than eyeballing this.

**Two general theorems worth memorizing the proof shape of** (both appear verbatim as mt exam questions):
1. *If A is attacked by an argument in GE, A cannot be admissibly acceptable.* Proof: suppose A admissibly acceptable via extension E; since GE attacks A, and E defends A, E must attack GE, but induction on `i` shows no admissible E ever attacks `f_F^i(empty)` (base case `f^0=empty` trivial; inductive step: if E attacked `f^(i+1)(empty)`, then `f^i(empty)` attacks E, so E attacks `f^i(empty)` by admissibility of E, contradicting the induction hypothesis), contradiction.
2. *If `(A,B)` in Att, A and B cannot both be groundedly acceptable.* Proof: if both in GE, GE isn't conflict-free (A attacks B), contradicting that GE is a complete (hence admissible, hence conflict-free) extension.

**Dialectical proof procedure** (search-based way to check `F|-_sigma A`): a **dispute tree** for topic A has root labelled A (Proponent); every Proponent node's *every* attacker must appear as a child (Opponent); every Opponent node needs just *one* child attacking it (Proponent), chosen to survive. The **defense set** = all Proponent-node labels. Tree is **admissible** if no argument appears as both a Proponent and an Opponent label. Theorem: admissible tree's defense set is an admissible extension, and conversely every admissible extension has such a tree; A is groundedly acceptable iff some dispute tree for A is finite in every branch (finite depth).

### A6. Structured / Instantiated Argumentation (from a knowledge base, Aspic-style)

Given a rule-based KB with **strict rules** (`s: ...`, always sound) and **defeasible/default rules** (`d: ...`, "usually" rules, can have exceptions) plus **facts/evidence** (`e: ...`):

**Constructing arguments**: chain rules starting from facts. `A1 = e1 :. conclusion`; a compound argument `A2 = A1, d1 :. conclusion2` has reason = premise `d1` plus sub-argument `A1`. The conclusion of a sub-argument is an *intermediate conclusion* of the whole.

**Finding attacks between constructed arguments**: check every pair for rebut (contradictory conclusions, including against an *intermediate* conclusion for indirect rebut), undermine (conclusion contradicts a premise/fact used), undercut (conclusion says a *default rule doesn't apply* here; only possible against **defeasible** rule applications, never against a strict-rule argument).

**Evaluating a claim**: 1) form all arguments from the KB, 2) find all attacks, 3) build `F=(AR,Att)`, 4) pick a semantics sigma, 5) check if some argument concluding the claim is sigma-acceptable; same machinery as A5. A claim can be admissibly acceptable but not groundedly acceptable (common exam pattern: symmetric rebut pair `{A,A'}`, both admissible singletons, but GE excludes both).

**7-step argument-based reasoning pipeline** (state this if asked to "describe the process"): (1) start from KB Delta, (2) form arguments `AR_Delta`, (3) identify attacks `Att_Delta`, (4) abstract to AF `F_Delta=(AR_Delta,Att_Delta)`, (5) select a semantics sigma, (6) evaluate acceptability `F_Delta |-_sigma A`, (7) extract `cnl(A)` of every accepted A as an acceptable conclusion from Delta.

---

## Part B - Practice Question Bank (all 7 sets, mapped to Part A, worked)

Legend: **[A#]** tags the Part A section to review. Answers reproduce/verify what the source PDF gave; where the PDF left a blank, the answer is derived here and marked **(derived)**.

### mt1 - mid term practice 1.pdf

**Part I (Q1-8), arguments in NL / Venn [A1, A2]**
1. Which is an argument -> **(d)** "I am busy, since my teacher assigned lots of homework" (has reason-marker *since* linking premise to conclusion; others are plain conjunctions/statements).
2. Which is *not* an argument -> **(d)** "If he apologized, you should forgive him" is a conditional, not an argument (no asserted premise).
3. Odd one out -> **(e)** "I am good at sport since I am tall" reverses the premise/conclusion direction relative to (a)-(d), which all conclude "good at sport" from "tall".
4. Deductive -> **(d)** "It flies since it is a bird and all birds fly": universal premise makes it water-tight; the others hedge with *usually/can/never see one that can't* (inductive).
5. Cannot be conjunction -> **(c)** "A Catholic priest married John and Mary" (relational *and*, not a plain conjunction); the rest split into two independent facts.
6-8. Venn-diagram "which proposition can NOT be inferred": diagram-dependent (need the figure); apply A2, read off exactly what's shaded/asterisked, the option contradicting or unsupported by that diagram is the answer. Practice by drawing the diagram before matching options.
9. AF, `Att` = full mutual 3-cycle among A1,A2,A3 (all pairs attack both ways) **[A5]**: no arguments groundedly acceptable, true (a); all 3 admissibly acceptable, true (b) (each `{Ai}` admissible since it attacks both others); (d) empty set admissible, true; (e) empty set is also the grounded extension, true. Full extension list: empty, {A1}, {A2}, {A3}, giving 4 admissible extensions, not 3, so **(c) "there are three admissible extensions" is the statement that is not correct**.
10. 3-cycle `{(A1,A2),(A2,A3),(A3,A1)}` (directed cycle, not mutual): admissible extensions are `{empty}` only (odd cycle, A5 pattern), so **(b) "A1,A2,A3 are all admissibly acceptable" is not correct**.
11. `AR={A1..A4}`, `Att={(A2,A1),(A1,A3),(A2,A2)}`: A2 self-attacks, so it never belongs to any conflict-free set; A1 is attacked only by A2 and A2 can never be defeated (nothing attacks it), so A1 can never be defended; A3 is attacked only by A1, same problem; A4 is unattacked and isolated. Admissibly acceptable: **A4 only, answer (b) 1**.
12. Infinite backward chain `Att={(Ai+1,Ai)}`: admissible extensions are `empty, {A0}, {A0,A2}, {A0,A2,A4}, ...`, infinitely many, growing chains from the even-indexed arguments, **answer (e) none of the above (infinitely many)**.
13-14. Aspic+ `quarantine(bob)` construction: open-ended; apply A6, list the rules given, build arguments bottom-up from facts, check attacks (rebut/undermine/undercut per rule type), evaluate under admissible/grounded, then state in plain English what the KB claims and whether `quarantine(bob)` follows. Answer depends on the specific rule set given in that exam version; follow the A6 recipe exactly.
15. Prove GE admissible **[A5]**: standard theorem. GE is conflict-free (else some Ai,Aj in GE attack each other, but induction on the stage `i` at which each entered `f^i(empty)` shows earlier stages never attack, and same-or-later stages are exactly what's defended, contradiction) and GE defends every member of itself (any attacker of some `A` in `f^(i+1)(empty)` is by definition attacked by `f^i(empty)` which is a subset of GE). Full proof follows the two-theorem pattern in A5.
16-21. Propositional logic **[A3]**: 16 -> (d) 3 true (`p or q`=T, `p->q`=F, `q->p`=T, `r<-p and q`=T under p=T,q=F,r=F, i.e. 3 of the 4 are true). 17: build truth table for `{p or q or r, p->not q, p->not r}`; check each of 8 rows, 2 rows satisfy all three (p=F with exactly one of q,r true), **(c) 2**. 18: check satisfiability of each of the 4 sentences individually: `not p->p` (equiv `p or p`, satisfiable), `p->not p` (satisfiable, p=F), `not(p or not p)` (unsatisfiable, it's a contradiction), `p->(q->not p)` (satisfiable), so 3 satisfiable, **(d) 3**. 19-20 (same Delta): sentences are (i) valid-looking tautology form, (ii) `(p->q) or (q->p)` valid, (iii) `(p->q) and (q->p)` = `p<->q` contingent, (iv) `p` contingent, so contingent count is 2, **19: (c) 2**; unsatisfiable count is 0, **20: (a) 0**. 21. `Delta={p->q and r, p->r}` entails which: check each option against `Delta union {not option}` for unsatisfiability (Unsatisfiability Theorem); option (a) `q and r` is not entailed (Delta doesn't force p true); **option (d) `p -> q or r`** is entailed (weaker than `p->q and r`, follows by weakening the consequent): if p true then q and r true (first premise) so q or r true; if p false, the implication is vacuously true. **Answer: (d)**.

### mt2 - mid term practice 2.pdf

Fully answered in source, organized as **[A1]** language/arguments (Q1: tick argument/not + standard form; Q2: standard form with suppressed premises; Q3: extracting 2+ arguments from a text with argument-map hints), **[A2]** categorical/Venn (Q4-7: apply the four-pattern drill from A2), and **[A3/A4]** propositional logic through INDO/Resolution:
- Q9-10: truth-table validity/contingency/unsatisfiability checks, mechanically fill A3's classification table.
- Q12: INDO conversions, worked examples of `r and s <- p or q or k`, `(p or q or r -> q)`, `(q and r) <-> r` fully shown; follow the I-N-D-O steps in A4.2 exactly as demonstrated.
- Q13: Resolution derivation of empty clause from `{{p,q,k},{not p,r},{not p,not r},{p,not q},{not k,l},{not l}}`, an 11-step derivation is given; trace it as the canonical worked example for A4.3.
- Q14: Resolution check of `Delta |= phi` via clausal form of `Delta union {not phi}` then derive `{}`, full worked derivation given, use as template for any "check Delta |= phi via Resolution" question.

### mt3 - mid term practice 3.pdf

**Q1-3** ([A1], sub-argument/attack identification exercises): apply A1's attack-relation definitions (rebut/undermine/undercut) to whichever text/argument-map is given.

**Q4-7** ([A2], four-pattern drill; blanks in source, **derived** from Module 3 Example 7 answer key which states these exact four patterns and confirms only pattern (d) is deductive):
- Q4: "No P is M and Some S is M, hence Some S is not P." -> pattern (d) -> **Deductive**.
- Q5: "All M is P, No S is M, hence No S is P." -> pattern (b) -> **Not deductive**.
- Q6: "Some P is M, Some S is not M, hence Some S is P." -> pattern (a) -> **Not deductive**.
- Q7: "No P is M. Some S is M. So some S is not P." -> same as Q4 (pattern d) -> **Deductive**.

**Q8** ([A3], truth values under `p=T,q=F,r=F`): 8.1 `p->q and r` = F; 8.2 `p<->q and r` = F; 8.3 `p and q -> not not r` = T (antecedent `p and q`=F, so implication vacuously T); 8.4 `p and q <- q and r` = T (both sides F, `F<-F`=T).

**Q9** truth-table valid/contingent/unsatisfiable, fully worked in source with tables shown; 9.1 unsatisfiable, 9.2 contingent, 9.3 valid, 9.4 answer requires completing the table per the pattern shown (build all 4 rows of p,q and evaluate `(p->q)->(p->not q)`: row p=F,q=F gives T, row p=T,q=F gives T, row p=F,q=T gives T, row p=T,q=T gives F, so contingent, **(b)**).

**Q10** - widget order-form check: table already gives the answer key (truth values filled): `aluminum or copper or iron`=True, `red or green or blue or grey`=True, `aluminum->gray`=True, `copper and not coated -> red`=True, `iron->coated`=**False**. Note constraint 5 is the one violated by the order form.

**Q11** - exam-scheduling encoding **[A5's sibling: A3's graph-coloring pattern]**: apply the reusable encoding from A3, atoms `course-slot` (e.g. `css434-m`), constraints "exactly one slot per course" plus "adjacent (conflicting) courses differ." **(derived, general method, plug in the actual edge set from the figure)**:
```
F1 (each course gets at least 1 slot): (css434-m or css434-a) and (css444-m or css444-a) and (its341-m or its341-a) and (its441-m or its441-a)
F2 (at most 1 slot each): not(css434-m and css434-a) and ... (same for other 3 courses)
F3 (conflicting pairs differ): for each edge (X,Y) in the conflict graph: not(X-m and Y-m) and not(X-a and Y-a)
```
Then 11.2 enumerate satisfying assignments = valid 2-colorings of the conflict graph (swap m/a on each connected component independently, so 2^(number of connected components) solutions). Read the actual edges off the figure in the PDF to finish.

**Q12** entailment via truth table, mechanical, build the table over p,q,r and check "every row satisfying LHS also satisfies RHS". Use the Unsatisfiability Theorem as a shortcut for each sub-question: form `Delta union {not conclusion}` and search for a satisfying row; if none exists, entailment holds (answer yes), if one exists, it fails (answer no). Work each of 12.1-12.4 this way rather than guessing from the table shape.

### mt4 - mid term practice 4.pdf (answer-key excerpt, argumentation frameworks) **[A5]**

All four given AFs are fully worked in the source; use them as drilled reference cases for the semantics definitions:
- Q17 (AR={A0,A1,A2}, mutual + self-attack A2): conflict-free {empty,{A0},{A1}}, admissible {empty,{A0},{A1}}, GE=empty, admissibly accepted A0,A1, groundedly accepted none.
- Q18 (4-cycle-ish with a self-attack): conflict-free {empty,{A0},{A1}}, admissible = empty only, GE=empty, nobody accepted under either semantics.
- Q19 (AR={A0..A3}): admissible {empty,{A3},{A1,A3}}, GE={A1,A3}, admissibly and groundedly accepted: A1,A3.
- Q20 (AR={A0,A1,A2}, "double cycle"): admissible {empty,{A1},{A2}}, GE=empty, admissibly accepted A1,A2, groundedly accepted none.

Pattern to take away: always compute conflict-free sets first (cheap filter), then check which are admissible (defend all members), then find the least fixed point for GE.

### mt5 - mid term practice 5.pdf

Fully answered in source. Structure: Q1 negation-form `not S` identification for ambiguous NL sentences **[A1]** (practice spotting which reading of an ambiguous negative sentence matches `not S` for a clean S). Q2 categorical-form matching **[A2]**. Q3 suppressed-premise reconstruction, including the barber paradox and mathematical induction as suppressed-premise examples **[A1]**. Q4-5 knowledge-base to arguments to attacks **[A6]**: builds arguments from default rules, identifies rebut pairs (A/A', B/B'), and the self-referential barber argument (undermines itself, giving a 4-attack AF `{(A,A),(A,B),(B,B),(B,A)}`). Q6-9 formal argumentation **[A5]**: infinite AF with one "generator" A defended only by odd Bi's, admissible = `{empty} union {Bi} union {A,Bi}` for each i, preferred = `{A,Bi}` for each i (infinitely many, none dominates), GE=empty (nothing unattacked to start from except the Bi's which cyclically attack each other; trace f(empty) carefully); Q7 proves the "attacked by GE implies not admissible" theorem (A5 theorem 1); Q8 proves "`(A,B)` in Att implies not both groundedly acceptable" (A5 theorem 2); Q10 entailment via truth table **[A3]**.

### mt6 - mid term practice 6.pdf

Fully answered in source. Q1-6 **[A1/A2]**: argument identification, main-conclusion extraction from editorial text, deductive/inductive classification (includes the "endogenous cholesterol" case marked as inductive with a no-penalty note for deductive), Venn-diagram deductiveness for classic syllogisms (Barbara-form Accords/Hondas argument is deductive by direct chaining). Q7-11 categorical-form matching **[A2]**. Q12 symbolic translation of NL arguments into propositional form **[A3]** (fully worked, e.g. `A or N, A :. not N`). Q13-18 **[A3]** deductive/non-deductive checks with explicit falsifying truth assignments where non-deductive, plus two general theorem-proofs by contradiction (Q16-18) following the same proof pattern as A5's theorems: assume the conclusion false, derive that some premise must also be false.

### mt7 - mid term practice 7.pdf

Fully answered in source. Q1-7 **[A3]**: valid/contingent/unsatisfiable classification, logical-equivalence checks (`not(p or q)` vs `not p and not q` are equivalent; others not), consistency checks (find or rule out a satisfying assignment for `phi` alongside a set Delta), entailment via truth table (Q7 fully tabulated, `{p->q or r, q->r} |= (p->r)` confirmed row by row). Q8-9 **[A4]**: entailment-via-truth-table restated, Fitch proof of `|- p->(q->p)` (use II twice: assume p, then assume q, p still holds from outer assumption, derive q->p, then p->(q->p)). Q10 logical-equivalence rewrite of a KB using only `not,->`, fully worked: `p or q or r === not(not p -> q) -> r`, `r and k === not(r -> not k)`, `p or r -> q or s === (not p -> r) -> (not q -> s)`. Q11-13 **[A4]**: Fitch proof, INDO clausal form, and full Resolution proof of `{p->q or r, q->r} |= (p->r)`, all three methods worked on the *same* entailment, useful as a cross-check template (solve one exam question three ways to verify your answer). Q14 discussion question **[A4]**: three approaches to entailment (truth table / SAT / proof-based), answer given, use as the model answer for any "compare methods" essay question. Bonus Q (stable extensions) **[A5]**: worked examples of an AF with *no* stable extension (single self-attacker) and one with *multiple* stable extensions (mutual 2-cycle, `{A}` and `{B}` both stable).

---

## Quick pre-exam checklist

1. Can you classify any NL sentence as argument/not, and pull out premises + conclusion in standard form, spotting suppressed premises? [A1]
2. Given any two-premise categorical syllogism, can you draw the Venn diagram and decide deductive/not in under a minute? Know the four-pattern drill by heart. [A2]
3. Given a sentence, can you classify valid/contingent/unsatisfiable and check entailment via truth table *and* via the Unsatisfiability Theorem? [A3]
4. Can you run INDO on any sentence to clausal form, and complete a Resolution proof (derive `{}` from `Delta union {not phi}`)? Can you write a Fitch subproof using assumption/II? [A4]
5. Given any small `(AR,Att)`, can you list conflict-free sets, admissible extensions, and compute GE via `f(empty), f^2(empty), ...` without guessing? Know the 5 reference cases (empty, self-attack, even cycle, odd cycle, chain) cold. [A5]
6. Given a rule-based KB (strict + defeasible rules + facts), can you construct all arguments, tag every attack as rebut/undermine/undercut, and evaluate a claim under admissible vs grounded semantics? [A6]
