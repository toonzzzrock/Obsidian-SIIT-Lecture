# Logics and Computational Argumentation

Covers official course Module 4 ("Argument-based Reasoning and Argumentation Semantics": Dung's abstract frameworks, conflict-free/admissible/grounded/preferred/stable semantics, the argument-based reasoning pipeline, rebut/undermine/undercut, dialogue/dispute trees) plus ASPIC+ (Module 8, kept by request). Module 5 (proof systems: Fitch/INDO/Resolution) is deliberately excluded. Originally cropped from full_02.md Section 6; the reasoning-pipeline, attack-type, and dialogue-tree subsections were added later from the Module 4 lecture PDF to close gaps. Companion file: arg_propositions_nl.md covers "Arguments and Propositions in Natural Language" (Modules 2-3).

---

# Section 1: Computational Argumentation Frameworks (Dung, Semantics, Dialogue Trees, & ASPIC+)

---

### Detailed Theory & Concepts to Read First

This section builds every definition up from scratch, with a small toy graph worked step by step for each concept. Read it top to bottom; each definition reuses the vocabulary from the one before it.

#### 0. Setup: what a framework is

An abstract argumentation framework is a directed graph $\mathcal{F} = (AR, Att)$:

- $AR$ = the set of arguments (think of them as opaque boxes — you don't care what's inside them, only who attacks whom).
- $Att \subseteq AR \times AR$ = the attack relation. $(X, Y) \in Att$ reads "$X$ attacks $Y$", drawn as an arrow $X \to Y$.

**Running example (used for every definition below):** $AR = \{A, B, C\}$, $Att = \{(A,B), (B,C), (C,A)\}$ — a directed 3-cycle: $A \to B \to C \to A$.

```
      A ----------> B
      ^             |
       \           /
        \-- C <---/
```

This is exactly how the "opaque box" arguments $A, B, C$ of the running 3-cycle example got their attack relation in the first place: each is really a mini-argument like $A_1$–$A_3$ above, and $Att$ records which one's conclusion contradicts which other one's premise or reasoning step.

#### 0.5. Where do $AR$ and $Att$ actually come from? The argument-based reasoning process

Section 0 treats $AR$ and $Att$ as given, but in practice they are built from a knowledge base in seven steps:

1. **Start from a knowledge base $K$** — a set of premises (natural language or formal, possibly conflicting).
2. **Construct arguments** from $K$ using inference rules. An argument is written $\langle \text{reason}, \text{conclusion}\rangle$, where _reason_ is a set of premises and/or sub-arguments.
3. **Identify attacks** between the constructed arguments $\Rightarrow Att$.
4. **Abstract away the internal structure**, keeping only the attack relation $\Rightarrow \mathcal{F}=(AR,Att)$.
5. **Pick a semantics** $\sigma$ (e.g. admissible, grounded, preferred — Sections 3–6 below).
6. **Evaluate acceptability**: $\mathcal{F}\vdash_\sigma A$ means $A$ is acceptable under $\sigma$.
7. **Extract conclusions**: if $A$ is acceptable, its conclusion is an acceptable claim.

_Worked example (steps 1–2, sub-arguments and intermediate conclusions):_ $K=\{d_1, s_1, e_1\}$ where $d_1$: "if a person wears a ring, they are usually married", $s_1$: "a married person is not a bachelor", $e_1$: "John wears a ring".

- $A_1 = \langle \{e_1\}, \text{"John wears a ring"}\rangle$ — built straight from a premise.
- $A_2 = \langle \{d_1, A_1\}, \text{"John is married"}\rangle$ — $A_1$ is a **sub-argument** of $A_2$; "John wears a ring" is an **intermediate conclusion** of $A_2$; "John is married" is $A_2$'s final conclusion.
- $A_3 = \langle \{s_1, A_2\}, \text{"John is not a bachelor"}\rangle$ — built on top of $A_2$ the same way.

#### 0.6. Three ways one argument attacks another: rebut, undermine, undercut

Given two arguments $A=\langle r_A, c_A\rangle$ and $B=\langle r_B, c_B\rangle$, $A$ can attack $B$ in three distinct ways:

- **Rebut** — $A$'s conclusion $c_A$ contradicts $B$'s conclusion $c_B$ (_direct_ rebut, usually symmetric) or contradicts an _intermediate_ conclusion of $B$ (_indirect_ rebut).
- **Undermine** (premise-attack) — $c_A$ contradicts a premise used inside $B$'s reason $r_B$.
- **Undercut** — $c_A$ contradicts the validity of an inference step used inside $B$, not a premise or the conclusion itself.

A useful fact: **a deductive argument can only be rebutted or undermined, never undercut** — by definition every inference step in a deductive argument is watertight, so there is nothing "in between" to undercut.

##### Example 1 — Rebut: conclusion vs. conclusion

- $A = \langle\{\text{"the light is red"}, \text{"cars stop at red lights"}\}, \text{"the car will stop"}\rangle$
- $B = \langle\{\text{"the driver is running late"}, \text{"drivers running late often run red lights"}\}, \text{"the car will NOT stop"}\rangle$

```
   A: "the car will stop"  <---- contradicts ---->  B: "the car will NOT stop"
        (rebut is symmetric: A rebuts B, and B rebuts A, right at the conclusion)
```

$A$ and $B$ reach **directly contradictory final conclusions**, and each conclusion was reached by ordinary (defeasible) reasoning — nothing about the premises or the inference steps is in dispute, only the bottom-line claim. This is a **direct rebut**, and it is symmetric: $A$ rebuts $B$ exactly as much as $B$ rebuts $A$. (An **indirect** rebut looks the same but lands on an intermediate conclusion of the target instead of its final one — e.g. if some argument $D$ concluded "the driver is NOT running late," $D$ would indirectly rebut $B$ by attacking the sub-conclusion $B$ is built on, even though $D$ never mentions "the car will stop" at all.)

##### Example 2 — Undermine: conclusion vs. a premise

- $A = \langle\{\text{"John wears a ring"}, \text{"people who wear rings are usually married"}\}, \text{"John is married"}\rangle$
- $B = \langle\{\text{"John told me he is single"}\}, \text{"John is not married"}\rangle$
- $C = \langle\{\text{"the ring John wears is a family heirloom, not a wedding ring"}\}, \text{"John wearing a ring says nothing about his marital status"}\rangle$

```
   premise "John wears a ring" ----[used inside]----> A: "John is married"
        ^
        |
   C's conclusion attacks THIS PREMISE, not A's final conclusion
```

$C$ **undermines** $A$: $C$'s conclusion contradicts the standing of the premise "John wears a ring [as evidence of marriage]" that $A$ relies on — it does not dispute the inference rule ("ring-wearers are usually married" could still be a fine rule in general) and it does not directly assert "John is not married" either. Contrast this with $B$, which **rebuts** $A$ (its conclusion "John is not married" directly contradicts $A$'s final conclusion "John is married") without touching any of $A$'s premises at all. Undermining only makes sense against a **defeasible premise** (an assumption, not an unquestionable axiom) — you cannot undermine a premise that is stipulated as certain.

##### Example 3 — Undercut: conclusion vs. the inference step itself

- $A = \langle\{\text{"normally birds fly"}, \text{"Twitty is a bird"}\}, \text{"Twitty flies"}\rangle$
- $B = \langle\{\text{"Twitty is a penguin"}, \text{"a penguin is not a normal bird"}\}, \text{"Twitty is not a normal bird"}\rangle$
- $C = \langle\{\text{"Twitty is a robotic penguin"}, \text{"robotic penguins fly"}\}, \text{"Twitty flies"}\rangle$

```
   "normally birds fly" + "Twitty is a bird"  --[defeasible step, valid only if Twitty is a NORMAL bird]-->  "Twitty flies"
                                                              ^
                                                              |
                              B's conclusion ("Twitty is not a normal bird") knocks out
                              the licence for this step, without asserting "Twitty doesn't fly"
```

$B$ **undercuts** $A$: $B$'s conclusion ("Twitty is not a normal bird") contradicts the hidden condition that makes $A$'s inference step licensed ("Twitty is a normal bird"), rather than contradicting $A$'s conclusion directly — $B$ never says "Twitty does not fly." $B$ does **not** attack $C$ at all — $C$ reaches the same final conclusion ("Twitty flies") via a completely different, unrelated route (it does not go through the "normal bird" step at all), so there is nothing in $C$ for $B$ to contradict.

**Side-by-side summary of the three examples:**

| Attack | What contradicts what | Example pair | Target survives if... |
|---|---|---|---|
| Rebut | conclusion vs. conclusion (or intermediate conclusion) | $B$ vs. $A$ (car), $B$ vs. $A$ (ring) | ...the two conclusions turn out compatible after all |
| Undermine | conclusion vs. a premise used inside the target | $C$ vs. $A$ (ring) | ...that premise is re-confirmed by other evidence |
| Undercut | conclusion vs. the licence for an inference step (no premise or conclusion is touched) | $B$ vs. $A$ (Twitty) | ...the step's licensing condition is re-confirmed |

_Three argumentation-framework variants built on this attack relation:_ an **Abstract framework (AA)** is the $(AR,Att)$ pair used throughout this section; a **Bipolar framework (BAF)** adds a second relation $Sup \subseteq AR \times AR$ for _support_; a **Generalized framework (GAF)** allows any number of dialectical relations $R_1,\dots,R_n$ beyond just attack.

#### 1. Conflict-free — "no infighting inside the set"

A set $S \subseteq AR$ is **conflict-free** iff no member of $S$ attacks another member of $S$:
$$S \text{ is conflict-free} \iff \forall X, Y \in S,\; (X,Y) \notin Att$$
Plain-English check: pick every pair of arguments inside $S$ (including a member against itself); if any pair has an arrow between them, $S$ fails.

_Worked example on the 3-cycle:_

- $\{A, B\}$: is $(A,B) \in Att$? Yes. **Not conflict-free.**
- $\{A, C\}$: is $(C,A) \in Att$? Yes. **Not conflict-free.**
- $\{A\}$: no pair to check (only one element, and $(A,A) \notin Att$). **Conflict-free.**
- $\{A, B, C\}$: already fails via $(A,B)$. **Not conflict-free.**
- $\emptyset$: vacuously true (no pairs exist). **Conflict-free.**

So the full list of conflict-free subsets of the 3-cycle is $\{\emptyset, \{A\}, \{B\}, \{C\}\}$ — every singleton survives, but no pair does, because the graph is a complete cycle where every argument attacks exactly one other.

#### 2. Defense — "does the set fight back for its members?"

$S$ **defends** an argument $X$ iff, for every attacker $Y$ of $X$, some member of $S$ attacks $Y$ back:
$$S \text{ defends } X \iff \forall Y \text{ with } (Y,X) \in Att,\; \exists Z \in S \text{ such that } (Z,Y) \in Att$$
Plain-English check: list every arrow pointing _into_ $X$. For each one, does $S$ contain something that shoots back at the attacker? If $X$ has zero attackers, $S$ defends it automatically (vacuous truth — nothing to defend against).

_Worked example:_ Does $\{B\}$ defend $A$?

- $A$'s only attacker is $C$ (since $(C,A) \in Att$).
- Does $B$ attack $C$? Yes, $(B,C) \in Att$.
- So $\{B\}$ **does defend** $A$.

Does $\{B\}$ defend $B$ itself?

- $B$'s only attacker is $A$.
- Does $B$ attack $A$? No — $B$ only attacks $C$.
- So $\{B\}$ **does not defend** $B$.

This "defends itself" check is exactly what the next definition needs.

**Characteristic function $f$.** Package "everything $S$ defends" into one function:
$$f(S) = \{X \in AR \mid S \text{ defends } X\}$$
_Worked example:_ $f(\{B\}) = \{A\}$ (from above; $B$ does **not** defend $B$ or $C$ — check $C$: its attacker is $B$, and $B$ does not attack itself, so $C$ is undefended by $\{B\}$).

#### 3. Admissible extension — "conflict-free, and defends everyone inside it"

$$S \text{ is admissible} \iff S \text{ is conflict-free AND } S \subseteq f(S)$$
Plain-English recipe for checking a candidate $S$:

1. Conflict-free check (Section 1).
2. For **every** $X \in S$, find $X$'s attackers and confirm some member of $S$ attacks each attacker back (Section 2).
   If both hold, $S$ is admissible.

_Worked example: is $\{A\}$ admissible on the 3-cycle?_

1. Conflict-free: yes (single element, no self-attack).
2. Does $\{A\}$ defend $A$? $A$'s attacker is $C$. Does $A$ attack $C$? No — $A$ only attacks $B$. **$A$ is not defended.**
   So $\{A\}$ **fails** step 2 — not admissible. By the exact same argument, $\{B\}$ and $\{C\}$ also fail (each one's sole attacker is the _other_ cycle member, which it does not itself attack — you can check $\{B\}$ against $f(\{B\})=\{A\}$ above: $B \notin f(\{B\})$, so $\{B\} \not\subseteq f(\{B\})$). Only $\emptyset$ survives ($\emptyset$ is trivially conflict-free and vacuously defends nothing), so **the only admissible extension of the 3-cycle is $\emptyset$.**

_A second example where an admissible set is non-trivial:_ $AR=\{X,Y,Z\}$, $Att=\{(X,Y),(Y,Z)\}$ (a chain, not a cycle: $X$ attacks $Y$, $Y$ attacks $Z$, nothing attacks $X$).

```
X ----------> Y ----------> Z
(unattacked)
```

- Try $S=\{X,Z\}$. Conflict-free? $(X,Z) \notin Att$ and $(Z,X) \notin Att$, so yes.
- Does $S$ defend $X$? $X$ has no attackers, so yes (vacuous).
- Does $S$ defend $Z$? $Z$'s attacker is $Y$. Does $X \in S$ attack $Y$? Yes, $(X,Y) \in Att$. So $Z$ is defended.
- Both members defended, conflict-free ⇒ **$\{X,Z\}$ is admissible.**

This is the standard pattern: an unattacked argument ($X$) defends the argument two steps downstream ($Z$) by attacking the thing attacking it ($Y$) — "the enemy of my enemy is defended by me."

#### 4. Admissibly accepted — "wins under at least one admissible reading"

An argument $X$ is **admissibly accepted** iff it belongs to _at least one_ admissible extension (any one is enough — you don't need agreement across all of them).

_Worked example (chain $X \to Y \to Z$ above):_ admissible extensions are $\{\emptyset, \{X\}, \{X,Z\}\}$ (check $\{X\}$ alone: conflict-free, defends $X$ vacuously — admissible too, just not maximal). $X$ and $Z$ are both admissibly accepted (they appear in $\{X,Z\}$). $Y$ never appears in any admissible extension (its only possible defender against $X$ would have to attack $X$, and nothing does) — $Y$ is **not** admissibly accepted.

_On the 3-cycle:_ the only admissible extension is $\emptyset$, so **no argument is admissibly accepted** — every argument in a pure cycle is "unresolved."

#### 5. Grounded extension ($GE$) — the unique, most cautious verdict

**Theorem (existence and uniqueness).** For any framework $\mathcal{F}=(AR,Att)$, the characteristic function $f$ is monotonic (if $S_1 \subseteq S_2$ then $f(S_1) \subseteq f(S_2)$ — defending is easier to keep, never lost, as $S$ grows). By the Knaster–Tarski fixed-point theorem, a monotonic function on the powerset lattice $(2^{AR}, \subseteq)$ has a **unique least fixed point**. That least fixed point is defined to be the grounded extension $GE$, and it is always admissible (proved in Example 6.3 below).

**Step-by-step algorithm to compute $GE$ (iterate $f$ from the bottom):**
$$f^0(\emptyset) = \emptyset,\quad f^1(\emptyset) = f(\emptyset),\quad f^{k+1}(\emptyset) = f(f^k(\emptyset)),\quad GE = \bigcup_{k=0}^{\infty} f^k(\emptyset)$$
In plain terms: start from nothing defended ($\emptyset$). At each round, add every argument that the _current_ set defends. Repeat until the set stops growing (a fixed point) — that final set is $GE$. Intuition: round 0 always captures the arguments with **zero attackers** (they are trivially defended by anything, including $\emptyset$); round 1 adds arguments whose _only_ attackers are already defeated by round-0 arguments; and so on, one "layer" of the graph at a time.

_Fully worked example — a 4-argument layered graph._ $AR=\{D,C,B,A\}$, $Att=\{(D,C),(C,B),(B,A)\}$ (a chain $D \to C \to B \to A$, $D$ has no attackers).

```
   D ----------> C ----------> B ----------> A
(unattacked)
 [in GE]        [not in GE]   [in GE]       [not in GE]
```

($D$ enters at round 1 since it has no attackers. $B$ enters at round 2 since $D$ defeats $B$'s attacker $C$. $C$ never enters: its sole attacker $D$ survives (nothing defeats $D$), so $C$ stays legitimately attacked. $A$ never enters either: its sole attacker $B$ is never itself defeated from inside the growing set, since nothing in $\{D,B\}$ attacks $B$.)

| Round $k$ | $f^k(\emptyset)$ | Reasoning for each new member                                                                                                                                                                        |
| --------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0         | $\emptyset$      | starting point by definition                                                                                                                                                                         |
| 1         | $\{D\}$          | $D$ has no attackers ⇒ defended vacuously by $\emptyset$                                                                                                                                             |
| 2         | $\{D, B\}$       | $B$'s only attacker is $C$; is $C$ attacked by $f^1(\emptyset)=\{D\}$? Yes, $(D,C)\in Att$ ⇒ $B$ now defended. ($C$ itself is not added: $C$'s attacker is $D$, and nothing in $\{D\}$ attacks $D$.) |
| 3         | $\{D, B\}$       | check $A$: its attacker is $B$; is $B$ attacked by $f^2(\emptyset)=\{D,B\}$? No — nothing attacks $B$ from inside $\{D,B\}$ (only $C$ attacks $B$, and $C \notin \{D,B\}$). No new members.          |

Round 3 equals round 2 ⇒ fixed point reached ⇒ $GE = \{D, B\}$. Reading it off the chain: unattacked arguments ($D$) are always in $GE$; the argument two steps away ($B$) is defended by $D$; the arguments in between/downstream of a defended attacker ($C$, $A$) are excluded because their sole attacker is never itself defeated by $GE$.

_Worked example on the 3-cycle:_ $f^0(\emptyset)=\emptyset$. $f^1(\emptyset)=f(\emptyset)$: does $\emptyset$ defend $A$? $A$'s attacker is $C$; $\emptyset$ attacks nothing, so no. Same for $B, C$ by symmetry. So $f^1(\emptyset)=\emptyset$ — already a fixed point. $GE=\emptyset$. (This matches Section 3: the only admissible set was $\emptyset$, and $GE$ is always itself admissible, so with only one admissible candidate available, $GE$ has to be it.)

**Groundedly accepted:** $X$ is groundedly accepted iff $X \in GE$. Since $GE$ is unique, this is a single, unambiguous, "skeptical" verdict — unlike admissible acceptance, there's no "accepted under one reading but not another."

#### 6. Preferred extension — the maximal, most credulous verdicts

**Theorem (existence).** Every admissible set is contained in some maximal admissible set — i.e. preferred extensions always exist (proof sketch: the union of a chain of admissible sets is itself admissible, so Zorn's lemma applies; in the small finite graphs seen in this course you can just enumerate). A framework can have **one, many, or (in infinite frameworks) infinitely many** preferred extensions.

**Step-by-step procedure to find them by hand (finite graphs):**

1. List all conflict-free subsets of $AR$.
2. Filter to the admissible ones (defends every member — Section 3's checklist).
3. Keep only the admissible sets that are not a strict subset of another admissible set — those maximal ones are the preferred extensions.

_Worked example — mutual attack (the case where grounded and preferred diverge):_ $AR=\{A,B\}$, $Att=\{(A,B),(B,A)\}$.

```
A <==========> B
   (mutual attack)
```

1. Conflict-free subsets: $\emptyset, \{A\}, \{B\}$ ($\{A,B\}$ fails, both arrows present).
2. Admissible check: $\{A\}$ — $A$'s attacker is $B$; does $A$ attack $B$? Yes ⇒ defended ⇒ admissible. $\{B\}$ is admissible by the mirror argument. $\emptyset$ is trivially admissible.
3. Maximal ones: $\{A\}$ and $\{B\}$ are each maximal (neither is a subset of the other, and $\{A,B\}$ itself isn't even conflict-free so it's not a candidate).

**Preferred extensions: $\{A\}$ and $\{B\}$** — two different "credulous" resolutions, each internally consistent, each picking a side. Meanwhile $GE=\emptyset$ (round 0: neither $A$ nor $B$ has zero attackers, so nothing enters at round 1) — the "skeptical" grounded semantics refuses to commit to either side, while preferred semantics offers both possible commitments separately. This is the core conceptual difference: **grounded = the unique cautious core; preferred = every maximal credulous stance, and there can be more than one.**

_Relationship to the running 3-cycle:_ the only admissible set was $\emptyset$, and it's trivially the only maximal one too, so the 3-cycle has exactly one preferred extension, $\emptyset$, same as its grounded extension. (Odd cycles are a case where preferred and grounded coincide, both empty; even cycles behave like the mutual-attack example, splitting into multiple preferred extensions — see the 4-node self-loop and 2-cycle cases worked in Example 6.1–6.2 and 6.4 below.)

#### 7. Stable extension — recap

A conflict-free set $S$ is **stable** iff it attacks every argument outside it:
$$\forall Y \in AR \setminus S,\; \exists X \in S \text{ such that } (X,Y) \in Att$$
Every stable extension is preferred (and hence admissible), but not every preferred extension is stable — the 3-cycle example above has a preferred extension $\emptyset$ that is _not_ stable, since $\emptyset$ attacks nothing while $A,B,C$ all remain outside it unattacked. (Odd cycles are the textbook case of "no stable extension exists.")

#### 8. Acceptance status — summary table

| Status                           | Definition                     | On the mutual-attack example $\{A,B\}, Att=\{(A,B),(B,A)\}$         |
| -------------------------------- | ------------------------------ | ------------------------------------------------------------------- |
| Admissibly accepted              | in _some_ admissible extension | $A$: yes (in $\{A\}$). $B$: yes (in $\{B\}$).                       |
| Groundedly accepted              | in the (unique) $GE$           | $A$: no. $B$: no. ($GE=\emptyset$)                                  |
| Credulously accepted (preferred) | in _some_ preferred extension  | same as admissible here: $A$ yes, $B$ yes                           |
| Skeptically accepted (preferred) | in _every_ preferred extension | $A$: no. $B$: no. (each preferred extension picks only one of them) |

Reading the table: admissible/credulous acceptance is the loosest test ("could this argument win under some consistent stance?"), grounded/skeptical acceptance is the strictest ("does every reasonable stance agree on this?").

#### 9. Structured Argumentation (ASPIC+)

Unlike abstract frameworks where arguments are atomic black boxes, structured argumentation systems (like ASPIC+) build arguments from:

- **Premises / Axioms:** Facts $\mathcal{K}_p$ (ordinary premises that can be attacked) and $\mathcal{K}_n$ (axioms that cannot be attacked).
- **Defeasible Rules ($\Rightarrow$):** Rules that create presumptive conclusions subject to defeat.
- **Strict Rules ($\rightarrow$):** Deductive inference rules that cannot be defeated.
- **Three Modes of Attack:**
  1. **Undermining:** Attacking an ordinary defeasible premise.
  2. **Rebutting:** Attacking the defeasible conclusion of another argument by deriving its contrary.
  3. **Undercutting:** Attacking the applicability of a defeasible rule itself by asserting that the rule's inference is invalid in this case.

##### Worked example (adapted from the course's TOAST demo: "is Alex married?")

**Step 1: the knowledge base.** Axiom (unattackable fact): `student(alex)`. Defeasible rules (natural language, from the Module 4 slides):
- $r_1$: a student normally is **not married**.
- $r_2$: a student is normally a **young adult**.
- $r_3$ (strict, always true): a student is **always an adult**.
- $r_4$: an adult is **often married**.
- Contrariness: `married(alex)` and `notMarried(alex)` are contradictory conclusions.

**Step 2: build the arguments** (each one chains off a premise or an earlier argument, exactly as in the seven-step pipeline of §0.5):

| Argument | Built from | Rule used | Conclusion |
|---|---|---|---|
| $A_1$ | `student(alex)` | (axiom) | `student(alex)` |
| $A_2$ | $A_1$ | $r_1$ (defeasible) | `notMarried(alex)` |
| $A_3$ | $A_1$ | $r_3$ (strict) | `adult(alex)` |
| $A_4$ | $A_1$ | $r_2$ (defeasible) | `youngAdult(alex)` |
| $A_5$ | $A_3$ | $r_4$ (defeasible) | `married(alex)` |

**Step 3: identify attacks.** $A_2$ concludes `notMarried(alex)`; $A_5$ concludes `married(alex)`. These are contradictory, and both conclusions were reached via a **defeasible** rule ($r_1$ and $r_4$ respectively) — so this is a **rebut**, and it is mutual: $Att = \{(A_2, A_5), (A_5, A_2)\}$. (Note $A_3$ is built with the *strict* rule $r_3$, so $A_3$ itself can never be rebutted — only $A_1$, its premise, could in principle be undermined, but $A_1$ is an axiom and axioms cannot be undermined either. This is why the only attack in the whole framework is the one rebut between $A_2$ and $A_5$.)

**Step 4: evaluate under the semantics from §1-§6.** $AR = \{A_1,A_2,A_3,A_4,A_5\}$, $Att=\{(A_2,A_5),(A_5,A_2)\}$ — a single mutual-attack pair sitting alongside three untouched arguments.
- $A_1, A_3, A_4$ have no attackers at all, so they are in **every** admissible/preferred/grounded extension automatically.
- $\{A_5\}$ is conflict-free and defends itself (it attacks its only attacker $A_2$) — so $\{A_1,A_3,A_4,A_5\}$ is **admissible**, and `married(alex)` is **admissibly accepted**. Symmetrically $\{A_1,A_3,A_4,A_2\}$ is also admissible, giving `notMarried(alex)` too.
- The **grounded extension** only keeps what is defended from the *unattacked base* (§5's fixed-point $f$): $f(\emptyset) = \{A_1,A_3,A_4\}$ (the only arguments with zero attackers), and $f(\{A_1,A_3,A_4\})$ adds nothing more, because neither $A_2$ nor $A_5$ is defended (each one's only attacker is the other, and neither is in the set yet — a mutual-attack pair can never bootstrap itself into the grounded extension). So $GE = \{A_1, A_3, A_4\}$: **grounded semantics stays agnostic** on whether Alex is married, even though *some* admissible extension commits one way or the other. This is exactly the "cautious vs. credulous" gap Theorem 8 (§10 below) explains via dialogue trees.

**Step 5: illustrate the other two attack types on the same knowledge base (not in the original example, added for contrast).**
- *Undermine:* suppose a new fact `youngAdult(alex)` is asserted as a **defeasible premise** rather than derived by $r_2$, and a separate argument $A_6 = \langle\{\text{``Alex just turned 40''}\}, \text{``Alex is not a young adult''}\rangle$. $A_6$ would **undermine** $A_4$ by attacking that defeasible premise directly, without ever engaging $r_2$'s validity or $A_4$'s conclusion.
- *Undercut:* suppose a new argument $A_7 = \langle\{\text{``Alex is a monk, and student-monks never marry regardless of general trends''}\}, \text{``rule $r_4$ does not apply to Alex''}\rangle$. $A_7$ would **undercut** $A_5$: it does not dispute that Alex is an adult ($A_3$'s conclusion, a premise of $A_5$) and it does not directly assert `notMarried(alex)` either — it specifically knocks out the *licence* to apply $r_4$ to Alex.

#### 10. Dialogue trees (dispute trees) — computing acceptance as a two-player game

Instead of computing $f$ round by round over the whole framework, acceptance can be checked by playing a game between **Proponent** (defends the topic argument $A$) and **Opponent** (tries to defeat it). A **dialogue** is a sequence of moves $m_0, m_1, \dots$ where each move is `Player : X` and each $X$ attacks the argument moved by the other player just before it. Proponent opens with the topic argument; Proponent wins if Opponent eventually runs out of attacking moves.

_Worked example:_ $\mathcal{F}=(\{A,B,C\}, \{(B,A),(C,B)\})$ (the same chain-style framework used for grounded-extension Example 5 above, where $GE=\{A,C\}$).

```
Pro: A
Opp: B
Pro: C
```

Proponent moves $A$; Opponent attacks with $B$ (the only attacker of $A$); Proponent counter-attacks with $C$ (the only attacker of $B$); Opponent has no argument attacking $C$, so **Proponent wins** — matching $A \in GE$ found earlier by the fixed-point computation.

**Definition (dialogue tree $T$ for topic argument $A$):**

1. Every node is labelled by an argument and is either a **proponent node** or an **opponent node** (never both); a child's status is the opposite of its parent's, and the argument labelling a child attacks the argument labelling its parent.
2. The root is a proponent node labelled $A$.
3. Every proponent node $N$ (labelled $B$) gets **one child for every** argument attacking $B$ — Proponent must answer _all_ of Opponent's possible attacks.
4. Every opponent node $N$ (labelled $B$) gets **exactly one child** labelled by _some_ argument attacking $B$ — Opponent only needs to try one attack per move.
5. No other nodes exist.

##### Rule 3 in plain terms: proponent nodes branch on EVERY attacker

Rule 3 says: if $B$ has attackers $\{X_1,\dots,X_n\}$, the proponent node labelled $B$ must have exactly $n$ children, one labelled $X_1$, one labelled $X_2$, …, one labelled $X_n$ — no fewer.

*Example (rule followed correctly).* Suppose $B$ is attacked by both $C$ and $E$. A correct proponent node for $B$ looks like:
```
        Pro: B
       /       \
  Opp: C        Opp: E
```
Both children are present, because Proponent must be ready to answer whichever attack Opponent actually chooses to raise — leaving either one out would let Proponent dodge a real attack it cannot actually answer.

*Counter-example (rule violated).* This is **not** a legal dialogue tree, even though it "looks like" progress:
```
        Pro: B
          |
       Opp: C          ✗ illegal: E also attacks B, but no Opp:E
                          child was created for it — the tree is
                          silently ignoring one of Opponent's options
```
If $E$ also attacks $B$ but the tree only ever shows the $C$ branch, the tree is not testing whether Proponent can survive an attack via $E$ — it is an incomplete, invalid dialogue tree, and any acceptance conclusion drawn from it would be unsound.

##### Rule 4 in plain terms: opponent nodes get just ONE child (not all of them)

Rule 4 says: if $B$ has attackers $\{X_1,\dots,X_n\}$, the opponent node labelled $B$ gets **exactly one** child, labelled by whichever single $X_i$ is used to counter $B$ — the tree does not have to (and must not) show every possible counter at once.

**Who actually picks $X_i$, and does the pick matter?** By rule 1, a child's argument attacks its parent's argument, and a child's status is the *opposite* of its parent's. The parent here is an **opponent** node ($B$), so the child is a **proponent** node — i.e. this child is *Proponent's* move, attacking $B$ back. So it is Proponent (or, more precisely, whoever is *searching* for a winning dialogue tree on Proponent's behalf) who picks which attacker of $B$ to use, not Opponent.

*Example (rule followed correctly).* Suppose $B$ is attacked by both $C$ and $E$ (same situation as above, but now $B$ is an **opponent** node instead of a proponent node), and suppose $C$ itself has no attacker (so playing $C$ ends the branch in a win) while $E$ does have a further attacker $F$ that turns out to defeat any reply (so playing $E$ instead would lose). A correct opponent node for $B$ picks the one that works:
```
   Opp: B
     |
  Pro: C        (picked C, because C has no attacker of its own —
                  this branch now ends in a win for Proponent;
                  picking E instead would have opened up a losing
                  line through E's own attacker F)
```

**This is exactly the situation you're pointing at: yes, picking $C$ vs. $E$ changes whether *this particular tree* wins or loses.** That is not a flaw or an ambiguity in the definition — it is the entire point of Theorem 7 saying "**iff there exists** an admissible dialogue tree." Acceptability is not "does every possible tree win," it is "can at least one legal tree be built that wins." So when you (or an algorithm) are trying to determine whether $A$ is admissibly acceptable, you are allowed to **search** over these choices at every opponent node and keep only the ones that lead to success — exactly like an OR-node in a game tree, where you only need one good move, not all of them. Concretely: if some choice at some opponent node makes the whole tree fail, that just means *that one candidate tree* fails to prove acceptability; it does **not** mean $A$ is unacceptable, because a different choice (like $C$ over $E$ here) might still build a fully winning, admissible tree. Only if **every** possible choice, at every opponent node, eventually leads to failure would $A$ genuinely be not admissibly acceptable.

Contrast this with rule 3's proponent nodes, where the children are **Opponent's** possible attacks on Proponent's own argument $B$ — there, Proponent has no say in which attacker Opponent throws next, so the tree must be ready for **all** of them (that asymmetry — Proponent needs "for all", the search for Proponent's replies needs only "there exists" — is exactly why rules 3 and 4 look different).

*Counter-example (rule violated).* This is **not** a legal dialogue tree, because it turns the opponent node into a proponent-style branching node:
```
   Opp: B
   /      \
Pro: C    Pro: E     ✗ illegal: an opponent node may only ever
                        have ONE child, never two — showing both
                        C and E at once breaks the alternating
                        proponent/opponent asymmetry that makes
                        this a game rather than a plain search tree
```
If opponent nodes were also allowed to branch on every attacker, the "game" would collapse into just exhaustively exploring the whole attack graph at once, and the Proponent/Opponent asymmetry that rules 3 and 4 are built to create (Proponent must survive *all* of Opponent's attacks, but only needs to find *one* good counter-attack of its own) would be lost.

The set of arguments labelling proponent nodes is $T$'s **defense set**. A branch that ends (Proponent's argument has no attackers left) is a won dispute; an infinite branch is also a win for Proponent (Opponent never runs out of new attacks to try, but never succeeds either).

**Definition (admissible dialogue tree):** $T$ is **admissible** iff no argument labels both a proponent node and an opponent node anywhere in the tree (Proponent's own defense set must stay internally consistent).

##### Example and counter-example for "admissible dialogue tree"

*Example (admissible).* Chain framework $\mathcal{F}=(\{A,B,C\},\{(B,A),(C,B)\})$, tree for topic $A$:
```
Pro: A
 └─ Opp: B
     └─ Pro: C
```
$A$ labels only the root (always proponent-status), $B$ labels only one node (always opponent-status), $C$ labels only one node (always proponent-status). No argument ever switches status, so this tree is **admissible**.

*Counter-example (not admissible).* 3-cycle framework $\mathcal{F}=(\{A,B,C\},\{(A,B),(B,C),(C,A)\})$, tree for topic $A$ (from the loop discussion below):
```
Pro: A            ← A as proponent
 └─ Opp: C
     └─ Pro: B
         └─ Opp: A   ← A again, now as opponent — SAME argument, opposite status
```
$A$ labels the root as a proponent node and, four moves later, labels another node as an opponent node. That single clash is enough to make the whole tree **not admissible** — it does not matter that the rest of the tree structure otherwise follows rules 1-5 correctly. (Note the subtlety: the definition only forbids an argument switching *status*. An argument reappearing **twice with the same status**, e.g. two different proponent nodes both labelled $A$ in some larger tree, would **not** by itself break this particular definition — only a proponent/opponent clash does.)

**Theorem 7 (admissible ⟺ admissible dialogue tree).** $T$ is an admissible dialogue tree for $A$ $\iff$ its defense set is (a subset of) an admissible extension containing $A$. So _searching for admissible dialogue trees_ is a game-tree way of computing the admissible semantics.

##### Example and counter-example for Theorem 7

*Example (theorem's "if" direction: admissible tree exists ⟹ admissible extension exists).* Reuse the chain-framework tree just above: defense set $=\{A,C\}$ (the proponent-labelled nodes). Check directly against the Section-1/2 definitions: is $\{A,C\}$ conflict-free? $Att=\{(B,A),(C,B)\}$ contains neither $(A,C)$ nor $(C,A)$ — yes. Does it defend $A$? $A$'s only attacker is $B$; does $C$ attack $B$? Yes, $(C,B)\in Att$ — defended. Does it defend $C$? $C$ has no attacker — vacuously defended. So $\{A,C\}$ **is** admissible, exactly as Theorem 7 guarantees from the tree's existence.

*Counter-example (the "only if" direction, and why the tree must be admissible to count).* Take $\mathcal{F}''=(\{A,B,C,D\}, \{(B,A),(D,A),(C,B)\})$ from the branching example below, where the $D$-branch is an unanswerable dead end. No admissible dialogue tree for $A$ can be built there (every candidate tree either fails on the $D$ branch, or — if you tried to patch it by reusing an argument with the wrong status — fails the admissibility definition instead). Theorem 7 then correctly predicts $A$ has **no** admissible extension containing it in $\mathcal{F}''$, which matches the direct fixed-point check done there ($\{A\}$ cannot defend $A$ against $D$). This also shows why the *non-admissible* looping tree built for the 3-cycle above is worthless as a proof: even though that tree technically "never loses" in the raw win/loss sense, because it is not admissible, Theorem 7 makes no promise about it at all — you cannot read off an admissible extension from a non-admissible tree.

**Theorem 8 (grounded ⟺ finite-depth dialogue tree).** $A$ is groundedly acceptable $\iff$ there exists a dialogue tree for $A$ that is **finite in depth** (every branch terminates — Proponent always has the last word, no unresolved infinite back-and-forth). This is why $GE$ is called the "cautious" semantics: only arguments Proponent can _finitely_ defend end up in it, while admissible/preferred semantics also accept arguments defended only by infinitely-repeating (but never-losing) dialogues.

##### Example and counter-example for Theorem 8

*Example (finite tree ⟹ grounded).* The same chain-framework tree, $\text{Pro:}A \to \text{Opp:}B \to \text{Pro:}C$, terminates after depth 2 — every branch ends (the $C$ branch has no attacker to answer). Compute the grounded extension directly to confirm: $f(\emptyset)=\{C\}$ ($C$ is the only argument with zero attackers); $f(\{C\})$ — does $\{C\}$ defend $A$? $A$'s attacker is $B$, and $C$ attacks $B$, so yes, add $A$: $f(\{C\})=\{A,C\}$; $f(\{A,C\})$ — does $\{A,C\}$ defend $B$? $B$'s attacker is $C$, and nothing in $\{A,C\}$ attacks $C$, so no — fixed point reached, $GE=\{A,C\}$. This is exactly the finite tree's defense set, confirming Theorem 8.

*Counter-example (admissible but NOT grounded, because every tree is infinite).* Take the exact infinite backward chain from mt5 Q12 of `practice_extracted.md`: $AR=\{A_0,A_1,A_2,\dots\}$, $Att=\{(A_{i+1},A_i) \mid i=0,1,2,\dots\}$ — i.e. $A_1$ attacks $A_0$, $A_2$ attacks $A_1$, $A_3$ attacks $A_2$, and so on forever, arrows always pointing from a higher index back to the one just below it.

**First, compute $GE$ directly — it is $\emptyset$, not "every other argument".** $f(\emptyset)$ = arguments defended by nothing, i.e. arguments with **zero attackers**. But every single $A_i$ (including $A_0$) has an attacker ($A_{i+1}$) — nobody is ever attacker-free. So $f(\emptyset)=\emptyset$, and the fixed point stalls immediately: $GE=\emptyset$. **No argument in this framework is groundedly acceptable at all**, not $A_0$, not any "odd" or "even" one.

**Second, the preferred extensions are the two "parity" sets, not a single $\{1,3,5,\dots\}$.** From Q12's admissible sets $S_n=\{A_n,A_{n+2},A_{n+4},\dots\}$, check maximality: nothing can be added to $S_0=\{A_0,A_2,A_4,\dots\}$ because every argument outside it is odd-indexed and odd-indexed $A_{2k+1}$ always attacks the even-indexed $A_{2k}\in S_0$ — so $S_0$ is maximal, i.e. **preferred**. By the same argument $S_1=\{A_1,A_3,A_5,\dots\}$ is also maximal/preferred. Every other $S_n$ ($n\ge2$) is a proper subset of $S_0$ or $S_1$ (whichever parity it matches), so it is admissible but **not** maximal, hence not preferred. So there are exactly **two** preferred extensions: the "evens" $\{A_0,A_2,A_4,\dots\}$ and the "odds" $\{A_1,A_3,A_5,\dots\}$ — never a mix of the two, and neither is picked out as more "correct" than the other (this is the classic case of preferred semantics being genuinely multi-valued).

**Third, try to actually build the finite tree — and watch it refuse to terminate.** Attempt a dialogue tree for topic argument $A_0$:
```
Pro: A0
 └─ Opp: A1     (A0's only attacker is A1)
     └─ Pro: A2   (A1's only attacker is A2 — forced, no other choice)
         └─ Opp: A3
             └─ Pro: A4
                 └─ Opp: A5
                     └─ ...  (this never bottoms out: every Ai has
                                exactly one attacker, A(i+1), so there
                                is always one more forced move)
```
Because every $A_i$ has exactly one attacker and that attacker itself has exactly one attacker, and so on without end, there is no branching choice anywhere (rule 4's "pick one" is not even a real choice here — always forced) and **no way to make this terminate**. This single infinite branch is exactly the defense set $S_0=\{A_0,A_2,A_4,\dots\}$ from above — it is a perfectly legitimate **admissible** dialogue tree (no argument ever repeats, so the admissibility definition from earlier is never violated) proving $A_0$ sits inside the preferred extension $S_0$. But it is **not finite**, so by Theorem 8 it proves nothing about grounded acceptance — consistent with $GE=\emptyset$ computed above. This is the sharpest illustration of why grounded is the "cautious" semantics: admissible/preferred only need a tree that never *loses*, but grounded specifically needs one that *finishes*, and in a framework where every argument's regress genuinely never ends, nothing finishes — so $GE$ collapses all the way to $\emptyset$.

##### Contrast: a "rooted" infinite chain, where GE is infinite but non-empty

Flip the direction of attack in the chain above: $AR=\{1,2,3,4,\dots\}$, $Att=\{(i,i+1)\mid i=1,2,3,\dots\}$ — i.e. $1$ attacks $2$, $2$ attacks $3$, $3$ attacks $4$, and so on **forward** forever. The crucial structural difference from the previous example: argument $1$ has **no attacker at all** (nothing points into it) — this chain has a root, whereas the earlier backward chain did not.

**Step 1: seed the fixed point from the root.** $f(\emptyset)=\{1\}$ — $1$ is the *only* argument with zero attackers, so it is defended by $\emptyset$ vacuously; every other argument $i>1$ has attacker $i-1$, so it is not yet defended.

**Step 2: climb outward, one odd number per stage.** $f(\{1\})$: does $\{1\}$ defend $3$? $3$'s attacker is $2$; does $1$ attack $2$? Yes — so $3$ is defended: $f(\{1\})=\{1,3\}$. $f(\{1,3\})$: does it defend $5$? $5$'s attacker is $4$; does $3$ attack $4$? Yes — add $5$: $f(\{1,3\})=\{1,3,5\}$. This repeats forever, each stage finite, and the infinite union converges to $GE=\{1,3,5,7,\dots\}$ — **infinite, but non-empty**, unlike the unrooted case.

**Step 3: every individual member still has its own *finite* tree** — this is the resolution to "how can an infinite $GE$ come from finite trees at all." Topic argument $3$: $\text{Pro:}3 \to \text{Opp:}2 \to \text{Pro:}1$, and $1$ has no attacker, so the tree **terminates** at depth 2. Topic argument $2k{-}1$ has a tree of depth $2(k{-}1)$ — always finite, just longer as $k$ grows. There is no single tree proving all of $GE$ at once; there are infinitely many individually-finite trees, one per member, each one eventually bottoming out at the root argument $1$.

**Step 4: this framework has a unique extension, not two.** Since $1$ has no attacker, any *maximal* admissible set must contain $1$ (nothing can ever conflict with adding it). That forces $2$ out (attacked by $1$, now in the set); with $2$ out, nothing blocks adding $3$, and $3$ is defended (its attacker $2$ is itself attacked by $1\in$ the set) — so maximality forces $3$ in. This repeats forever: every odd number is forced in, every even number is forced out. So $\{1,3,5,\dots\}$ is the *only* admissible set that cannot be extended — **grounded = preferred = stable = $\{1,3,5,\dots\}$**, all coinciding, with no second "phase" the way the unrooted chain had two symmetric preferred extensions (evens/odds).

**The one-line takeaway:** whether an infinite chain's $GE$ is empty or infinite-but-nonempty depends entirely on whether the chain has an attacker-free root to seed $f(\emptyset)$ — no root (like the backward Q12 chain) collapses $GE$ to $\emptyset$ with two competing preferred extensions; a root (like this forward chain) lets $GE$ climb outward forever and coincide with a single, unique preferred/stable extension.

##### A taxonomy of infinite argumentation frameworks

Two independent design choices produce different infinite behaviour, and it's easy to conflate them:

- **Extent** — which end(s) of a chain, if any, go on forever: right-infinite only (a leftmost/finite element exists), left-infinite only (a rightmost/finite element exists), or both-infinite (no finite endpoint anywhere, indexed by all of $\mathbb{Z}$).
- **Direction of attack relative to the finite end** — if a finite endpoint exists, does the chain attack *into* it (leaving it exposed, no root) or *away from* it (leaving it a root)?

Cases 1–2 below are the two already covered above; cases 3–6 are new.

**Case 1 — right-infinite, unrooted** (the Q12 chain, already covered): $AR=\{A_0,A_1,A_2,\dots\}$, $Att=\{(A_{i+1},A_i)\}$ — every element, including the finite end $A_0$, has an attacker. Result: $GE=\emptyset$, exactly two preferred extensions (evens/odds).

**Case 2 — right-infinite, rooted** (the "Contrast" section just above): $AR=\{1,2,3,\dots\}$, $Att=\{(i,i{+}1)\}$ — the finite end $1$ has no attacker. Result: $GE=\{1,3,5,\dots\}$, unique, coincides with the unique preferred/stable extension.

**Case 3 — left-infinite (no left end)**, either variant: mirror image of Case 1 or Case 2 with the index direction reversed ($\dots,-3,-2,-1,0$ instead of $0,1,2,3,\dots$). Nothing new happens — relabel $i \mapsto -i$ and the same two results apply, just with "leftmost" replaced by "rightmost." Worth stating explicitly only because it confirms the result depends on *root existence*, not on which side is drawn as "the end."

**Case 4 — both-infinite (no left end, no right end): $AR=\mathbb{Z}$, $Att=\{(i,i{+}1)\mid i\in\mathbb{Z}\}$.**

Every integer $i$ attacks $i+1$, forever in both directions — no argument is ever attacker-free (argument $i$ is always attacked by $i-1$).

- *Fixed point:* $f(\emptyset)=\emptyset$ since nothing is attacker-free, and $f(\emptyset)=\emptyset$ forces $f$ to stay at $\emptyset$ at every stage. So $GE=\emptyset$.
- *Admissible sets:* $S_{even}=\{\dots,-2,0,2,4,\dots\}$ and $S_{odd}=\{\dots,-1,1,3,\dots\}$. Conflict-free: any two elements of $S_{even}$ differ by an even number $\ge 2$, never by exactly $1$, so no internal attacks — same for $S_{odd}$. Defended: for $i\in S_{even}$, its attacker is $i-1$ (odd); is $i-1$ attacked by something in $S_{even}$? Yes, $i-2\in S_{even}$ attacks $i-1$. So every element is defended.
- *Maximal:* any odd number adjacent to some even number already in $S_{even}$ can't be added without conflict, so $S_{even}$ is maximal — likewise $S_{odd}$.
- *Result:* $GE=\emptyset$, exactly two preferred extensions ($S_{even}, S_{odd}$), no stable extension conflict issue here since both $S_{even}$ and $S_{odd}$ *are* stable (every excluded argument is attacked: each odd number is attacked by the even number just below it, and vice versa) — so stable = preferred = $\{S_{even}, S_{odd}\}$, just grounded is empty.

So having *no finite endpoint at all* behaves exactly like having a finite endpoint that's unrooted (Case 1): what matters for $GE=\emptyset$ is the *absence of a root*, not the presence or absence of ends.

**Case 5 — a poisoned chain (self-attack): $AR=\{1,2,3,\dots\}$, $Att=\{(1,1)\}\cup\{(i,i{+}1)\mid i\ge1\}$.**

Same as Case 2's rooted chain, except $1$ also attacks itself.

- *Conflict-free check:* no conflict-free set can ever contain $1$, since $\{1\}$ attacks itself. So $1\notin S$ for any admissible $S$.
- *Cascade:* with $1$ excluded, $1$ still attacks $2$ (self-attack doesn't cancel $1$'s outgoing attacks) — so $2$ needs $1$'s attack countered by something in $S$ attacking $1$. Only $1$ attacks $1$, and $1\notin S$ (can't defend using an excluded argument as if it were in $S$) — actually re-check: defense means *some member of $S$* attacks every attacker of $2$. $2$'s only attacker is $1$. Does anything in $S$ attack $1$? Only $1$ itself attacks $1$, and $1\notin S$. So $2$ can never be defended, hence $2\notin S$ either.
- *Cascade continues:* $3$'s only attacker is $2$. For $3\in S$, $S$ must attack $2$ — but nothing attacks $2$ at all (only $1$ attacks $2$... wait, $Att$ only has $1\to2$; nothing attacks $2$ except $1$, and $1\notin S$, so this reasoning actually shows $2$ is simply never *attacked by $S$*, meaning $3$ is never defended either). By induction every $i\ge2$ is permanently undefendable, and $1$ is permanently excluded by self-attack.
- *Result:* the only admissible set is $\emptyset$. Hence grounded = preferred = $\{\emptyset\}$, and there is **no stable extension** — $\emptyset$ doesn't attack $1$ (needed for stability), so $1$ is neither in $\emptyset$ nor attacked by it.

One self-attacking argument at the root of an otherwise well-behaved rooted chain destroys the entire chain's admissibility, not just that one argument.

**Case 6 — "jump" attacks that decompose into independent chains: $AR=\{1,2,3,\dots\}$, $Att=\{(i,i{+}2)\mid i\ge1\}$** (each argument attacks the one *two* steps ahead, skipping its immediate neighbour).

Check who attacks whom: $1\to3$, $2\to4$, $3\to5$, $4\to6,\dots$ Odd-indexed and even-indexed arguments never attack each other (attack always preserves parity), so this framework is really **two completely separate rooted forward chains glued together with no attacks between them**: $\{1,3,5,\dots\}$ (root $1$, since nothing attacks $1$) and $\{2,4,6,\dots\}$ (root $2$, since nothing attacks $2$).

- *General principle (useful beyond this example):* if $Att$ never crosses between two disjoint subsets of $AR$, the framework is a **disjoint union of independent sub-frameworks**, and every extension of the whole is just an independent combination of an extension from each part — in particular $GE(\text{whole}) = GE(\text{part}_1)\cup GE(\text{part}_2)\cup\cdots$.
- Apply Case 2's result to each part by relabelling ($1,3,5,\dots \mapsto 1,2,3,\dots$ and $2,4,6,\dots\mapsto1,2,3,\dots$): each part's grounded/preferred/stable extension keeps every other element starting from its own root.
  - Odd chain $1\to3\to5\to7\to\dots$: relabelled root is $1$ itself, so its extension keeps $1,5,9,13,\dots$ (indices $\equiv1\pmod4$).
  - Even chain $2\to4\to6\to8\to\dots$: relabelled root is $2$, so its extension keeps $2,6,10,14,\dots$ (indices $\equiv2\pmod4$).
- *Result:* unique $GE=$ preferred $=$ stable $=\{i : i\equiv1\text{ or }2\pmod4\} = \{1,2,5,6,9,10,\dots\}$.

**Case 7 — non-chain infinite topology (pointer, not re-derived here):** the infinite "star" framework already worked out in `practice_extracted.md` (mt6 Q6) — $AR=\{A,G\}\cup\{B_1,B_2,\dots\}$, $Att=\{(G,A)\}\cup\{(B_i,G)\mid i\}\cup\{(B_i,B_j)\mid i\ne j\}$ (infinitely many arguments $B_i$ all mutually attacking each other and all attacking a common hub $G$, which in turn attacks $A$). There, $GE=\emptyset$ but there are **infinitely many** preferred extensions $\{A,B_i\}$ (one per choice of $i$), unlike every chain case above which has at most two. Included here to show that "infinitely many preferred extensions" is also a possible outcome once the topology isn't a simple chain.

**Summary table:**

| Case | Topology | $GE$ | # preferred extensions | Stable exists? |
|---|---|---|---|---|
| 1 | right-infinite, unrooted (Q12) | $\emptyset$ | 2 (evens/odds) | yes, both preferred sets are stable |
| 2 | right-infinite, rooted | infinite, unique | 1 | yes, = the unique preferred set |
| 3 | left-infinite | mirror of 1 or 2 | mirror of 1 or 2 | mirror of 1 or 2 |
| 4 | both-infinite ($\mathbb{Z}$) | $\emptyset$ | 2 (evens/odds) | yes, both preferred sets are stable |
| 5 | rooted chain + self-attack at the root | $\emptyset$ (only admissible set) | 1 (the empty set) | no |
| 6 | "jump" attacks (skip-one), decomposes into 2 rooted chains | infinite, unique | 1 | yes |
| 7 | infinite mutual-attack star/hub | $\emptyset$ | infinitely many | no (checked in mt6 Q6) |

##### Worked example with real branching (both rule 3 and rule 4 together)

Extend the chain framework used above by giving $A$ a **second**, independent attacker $D$ that nothing else touches: $\mathcal{F}''=(\{A,B,C,D\}, \{(B,A),(D,A),(C,B)\})$.

```
                    Pro: A
                   /        \
              Opp: B          Opp: D
                 |               (no attacker of D exists —
              Pro: C              Opponent's move D cannot be
                 |                 countered: dead end, this
      (no attacker of C —          branch is a LOSS for Proponent)
       branch ends, Proponent
       wins this branch)
```

Rule 3 forces the root $A$ (attacked by both $B$ and $D$) to branch into two children: $\text{Opp:}B$ and $\text{Opp:}D$. The left branch resolves in Proponent's favour exactly as in the first worked example ($C$ has no attacker, so Proponent has the last word). But the right branch is stuck: $D$ has no attacker at all, so there is no argument Proponent can bring in to answer Opponent's move $D$ — that branch is a **loss**. Because Proponent must win **every** branch spawned by rule 3 (not just some of them), the whole dialogue tree fails, and **no admissible dialogue tree for $A$ exists** in $\mathcal{F}''$. This matches the fixed-point check directly: does $\{A\}$ defend $A$? $A$'s attackers are $\{B,D\}$; is $D$ attacked by anything? No — so $A$ is undefended against $D$, and $A$ is not admissibly acceptable.

##### What happens if the dialogue loops? (cyclic vs. genuinely infinite frameworks)

Take the running 3-cycle framework from §0: $AR=\{A,B,C\}$, $Att=\{(A,B),(B,C),(C,A)\}$, and try to build a dialogue tree for topic argument $A$.

```
Pro: A            (root, proponent)
 └─ Opp: C        (A's only attacker is C)
     └─ Pro: B    (C's only attacker is B)
         └─ Opp: A   ← argument A appears again, now as an OPPONENT node
             └─ Pro: C   ← C appears again, now as a PROPONENT node
                 └─ Opp: B  ← B appears again, now as an OPPONENT node
                     └─ Pro: A   ← and around again, forever: A,C,B,A,C,B,...
```

Every argument in this cycle has **exactly one** attacker, so rule 4 leaves no alternative move to pick at any opponent node — the tree is forced to keep unwinding the cycle forever, never terminating. Two separate things go wrong here, and it is worth telling them apart:

1. **By the raw win/loss rule alone, this branch is not a loss.** An infinite branch means Opponent never runs out of attacking moves, but Opponent also never traps Proponent (every opponent move gets answered), so nothing in the basic definition declares Proponent defeated.
2. **But the tree fails the stronger admissibility requirement anyway.** $A$ now labels both a proponent node (the root) and an opponent node (four moves later) in the same tree — and symmetrically so do $B$ and $C$ as the loop continues. The admissible-dialogue-tree definition explicitly forbids this ("no argument labels both a proponent node and an opponent node"). So this looping tree is **not admissible**, and since every dialogue tree for $A$ in this framework is forced into the same loop (no branching choices exist anywhere, per rule 4), **no admissible dialogue tree for $A$ exists at all** — by Theorem 7, $A$ is not admissibly acceptable, matching the earlier finding in §1 that the only conflict-free sets in this 3-cycle are $\emptyset$ and the three singletons, none of which defend themselves.
3. It is also, separately, not **finite in depth** — so by Theorem 8 it could never certify grounded acceptance either, even if the admissibility problem were somehow not there.

**Practical takeaway for an implementation (why engines don't hang forever):** a real dispute-tree procedure tracks the set of arguments already used along the current branch and stops expanding — reports "failure along this branch" — the moment a move would repeat an argument already on that branch, rather than actually building the infinite tree. This "no-repeats" check is exactly what the admissibility condition above is doing on paper.

Contrast this with a **genuinely infinite** framework, such as the infinite backward chain / infinite "star" framework already used in mt5 Q9-Q12 and mt6 Q6/mt7 Q7 of `practice_extracted.md`, where $AR$ itself is infinite and every argument along a branch is **distinct** (nothing ever repeats). There, an infinite branch is a legitimate, non-repeating dialogue: it violates *no* admissibility condition, so it can still correspond to an admissible (even preferred) extension — it simply can never be *finite*, so by Theorem 8 the topic argument is admissibly but not groundedly acceptable. The 3-cycle case above is different precisely because its infinitude comes from **revisiting the same finitely many arguments**, which is what admissibility rules out; the infinite-star case is different because its infinitude comes from an **endless supply of new arguments**, which admissibility has nothing to say against.

_Why this matters for explanation:_ since $\mathcal{F}\vdash_\sigma A$ is literally "Proponent wins a dialogue about $A$", a won dialogue tree **is** a human-readable justification for why $A$ is accepted — this is the basis of using argumentation frameworks to explain the output of other reasoning systems (recent explainable-AI research plugs argumentation frameworks in as the "surrogate model" being explained, in the same role that a linear regression plays in the more familiar LIME method).

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

- **Step 1: Conflict-free sets:**
  - Singletons: $\{A_1\}, \{A_2\}, \{A_3\}$ are conflict-free.
  - Pairs: $(A_1, A_2) \in Att \implies \{A_1, A_2\}$ has conflict. Similarly, $\{A_2, A_3\}$ and $\{A_1, A_3\}$ have conflicts.
  - $\emptyset$ is conflict-free.
  - List: $\emptyset, \{A_1\}, \{A_2\}, \{A_3\}$.
- **Step 2: Check admissibility for singletons:**
  - For $\{A_1\}$: Attacked by $A_3$. To defend against $A_3$, $\{A_1\}$ must contain an argument that attacks $A_3$. The only attacker of $A_3$ is $A_2$, but $A_2 \notin \{A_1\}$. Hence, $\{A_1\}$ **cannot defend itself**.
  - By symmetry, $\{A_2\}$ and $\{A_3\}$ also fail to defend themselves.
  - For $\emptyset$: Defends all its elements vacuously.
  - **All Admissible Extensions:** $\{\emptyset\}$.
- **Step 3: Compute $GE$:**
  - $f^1(\emptyset)$: Arguments with zero attackers. Every node has an incoming attack edge.
  - $f^1(\emptyset) = \emptyset \implies GE = \emptyset$.
- **Step 4: Acceptance Status:**
  - Admissibly accepted: **None**.
  - Groundedly accepted: **None**.

---

##### 6.1.2: Asymmetric 4-Node Graph with Self-Loop

Let $AR = \{A_1, A_2, A_3, A_4\}$ and $Att = \{(A_2, A_1), (A_1, A_3), (A_2, A_2)\}$.

```
             (A2 self-loop)
               |
               v
              A1 ----------> A3          A4 (isolated)
```

- **Step 1: Evaluate Isolated Node $A_4$:**
  $A_4$ has no incoming and no outgoing attacks. It is completely unconstrained.
- **Step 2: Evaluate $A_2$:**
  $(A_2, A_2) \in Att$. $A_2$ attacks itself, so $A_2$ can **never** belong to any conflict-free or admissible set.
- **Step 3: Evaluate $A_1$:**
  $A_1$ is attacked by $A_2$. Can any conflict-free set defend $A_1$?
  The only attacker of $A_2$ is $A_2$ itself. But $A_2$ cannot be in any conflict-free set.
  Thus, no conflict-free set can ever defend $A_1$ against $A_2$.
  Therefore, $A_1$ can **never** belong to any admissible extension!
- **Step 4: Evaluate $A_3$:**
  $A_3$ is attacked by $A_1$. Can $A_3$ be defended?
  To defend $A_3$, a set must contain an attacker of $A_1$, which is $A_2$.
  Since $A_2$ cannot be in any conflict-free set, no conflict-free set can defend $A_3$.
  Thus, $A_3$ can never belong to any admissible extension.
- **Step 5: Admissible Extensions:**
  Since $A_1, A_2, A_3$ can never be defended by an admissible set, only $A_4$ remains.
  $A_4$ has no attackers, so it defends itself vacuously.
  Admissible extensions:
  $$\emptyset, \quad \{A_4\}$$
- **Step 6: Number of Admissibly Accepted Arguments:**
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

_Determine how many admissible extensions $\mathcal{F}$ has._

##### Step-by-Step Analysis:

1. **Understand Attacks:** Each $A_i$ is attacked by $A_{i+1}$. There are no base nodes (every node has an incoming attack from the next higher index).
2. **Examine Finite Sets:**
   - Consider any non-empty finite set $S \subset AR$.
   - Let $A_m$ be the argument in $S$ with the **maximum index** $m$.
   - $A_m$ is attacked by $A_{m+1}$.
   - To defend $A_m$, $S$ must contain an argument that attacks $A_{m+1}$.
   - The only argument that attacks $A_{m+1}$ is $A_{m+2}$.
   - But $m+2 > m$, which contradicts the assumption that $m$ was the maximum index in $S$!
   - Therefore, **no non-empty finite set can ever be admissible**.
3. **Examine Infinite Sets:**
   - Can an infinite set defend itself?
   - To defend $A_0$, we must include $A_2$ (attacks $A_1$).
   - To defend $A_2$, we must include $A_4$ (attacks $A_3$).
   - By induction, the infinite set of all even indices is:
     $$S_{\text{even}} = \{A_0, A_2, A_4, A_6, \dots \} = \{A_{2k} \mid k \in \mathbb{N}\}$$
   - **Is $S_{\text{even}}$ conflict-free?**
     Yes, because $(A_i, A_j) \in Att \iff i = j+1$, which requires one even and one odd index. Since $S_{\text{even}}$ contains only even numbers, no two elements can attack each other.
   - **Does $S_{\text{even}}$ defend all its elements?**
     For every $A_{2k} \in S_{\text{even}}$, its sole attacker is $A_{2k+1}$.
     The argument $A_{2k+2} \in S_{\text{even}}$ directly attacks $A_{2k+1}$.
     Therefore, $S_{\text{even}}$ defends every element it contains!
   - Thus, $S_{\text{even}}$ is an **admissible extension**.
4. **What about odd indices?**
   - Consider $S_{\text{odd}} = \{A_1, A_3, A_5, \dots \} = \{A_{2k+1} \mid k \in \mathbb{N}\}$.
   - Every $A_{2k+1}$ is attacked by $A_{2k+2}$, which in turn is attacked by $A_{2k+3} \in S_{\text{odd}}$.
   - $S_{\text{odd}}$ is conflict-free and defends all its elements.
   - Thus, $S_{\text{odd}}$ is also an **admissible extension**!
5. **What about shifted infinite sets?**
   - Notice that for any fixed $m \ge 0$, the set:
     $$S_m = \{A_{m + 2k} \mid k \in \mathbb{N}\}$$
     is conflict-free and defends all its elements.
   - For each starting integer $m$, we get an admissible set (with $S_0 = S_{\text{even}}$ and $S_1 = S_{\text{odd}}$, $S_2 \subset S_0$, etc.).
   - Since there are infinitely many such subsets (and $\emptyset$), the framework has **infinitely many admissible extensions**.

- **Exam Multiple Choice Conclusion:** Select **"None of the above"** (if the given choices are 1, 2, 3, 4).

---

#### Example 6.3: Formal Mathematical Proof of the Grounded Soundness Lemma

##### Theorem:

In any abstract argumentation framework $\mathcal{F} = (AR, Att)$, if $A \in AR$ is attacked by the grounded extension $GE$, then $A$ cannot belong to any admissible extension.

##### Complete Inductive Proof:

Let $GE = \bigcup_{i=0}^\infty f^i(\emptyset)$, where $f^0(\emptyset) = \emptyset$ and $f^{i+1}(\emptyset) = f(f^i(\emptyset))$.

**Core Lemma:** If $E$ is an admissible extension, then for all integers $i \ge 0$, $E$ does not attack any argument in $f^i(\emptyset)$ (i.e., there do not exist $X \in E$ and $Y \in f^i(\emptyset)$ such that $(X, Y) \in Att$).

- **Proof of Lemma by Mathematical Induction on $i$:**
  - **Base Case ($i = 0$):**
    $f^0(\emptyset) = \emptyset$. Since $\emptyset$ contains no elements, $E$ cannot attack any argument in $f^0(\emptyset)$. The claim holds vacuously.
  - **Inductive Hypothesis ($i = k$):**
    Assume that $E$ does not attack any argument in $f^k(\emptyset)$.
  - **Inductive Step ($i = k + 1$):**
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

- **Completing the Main Theorem:**
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

- **Argument A:** Assume the barber shaves himself. The rule says the barber shaves only those who do not shave themselves $\implies$ the barber does not shave himself.
- **Argument B:** Assume the barber does not shave himself. The rule says the barber shaves all those who do not shave themselves $\implies$ the barber shaves himself.

##### Formal Analysis:

1. **Standard Form Translation:**
   - **Argument A:**
     - Premise 1: If person $X$ shaves himself, the barber does not shave $X$.
     - Premise 2 (Assumption): The barber shaves himself.
     - $\therefore$ Conclusion: The barber does not shave himself.
   - **Argument B:**
     - Premise 1: If person $X$ does not shave himself, the barber shaves $X$.
     - Premise 2 (Assumption): The barber does not shave himself.
     - $\therefore$ Conclusion: The barber shaves himself.
2. **Identification of Attacks:**
   - **Rebutting Attacks:**
     - The conclusion of $A$ ("The barber does not shave himself") directly contradicts the conclusion of $B$ ("The barber shaves himself").
     - Hence, $A$ and $B$ **mutually rebut** each other: $(A, B) \in Att$ and $(B, A) \in Att$.
   - **Undermining Attacks:**
     - The conclusion of $A$ ("The barber does not shave himself") directly contradicts Premise 2 of $A$ itself ("The barber shaves himself").
     - Thus, $A$ contradicts its own starting premise $\implies$ **$A$ undermines itself** ($(A, A) \in Att$).
     - The conclusion of $B$ ("The barber shaves himself") directly contradicts Premise 2 of $B$ itself ("The barber does not shave himself").
     - Thus, **$B$ undermines itself** ($(B, B) \in Att$).
3. **Resulting Argumentation Framework:**
   $$AR = \{A, B\}$$
   $$Att = \{(A, A), \; (A, B), \; (B, A), \; (B, B)\}$$
4. **Semantics Evaluation:**
   - Neither $A$ nor $B$ can belong to any conflict-free set because both are self-attacking.
   - The only conflict-free set is $\emptyset$.
   - Admissible extensions: $\{\emptyset\}$.
   - Grounded extension: $GE = \emptyset$.
   - Preferred extensions: $\{\emptyset\}$.
   - Stable extensions: **None** ($\emptyset$ does not attack $A$ or $B$).

---

## Verification Checklist (Computational Argumentation)

- [ ] **Dung Semantics:**
  - Is every admissible set **strictly conflict-free**?
  - Does the grounded extension contain **only** arguments defended from the base of unattacked nodes?
