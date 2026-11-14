#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: false), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)
#show figure.where(kind: table): set block(breakable: true)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[Rigidity of the Turing degrees]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Turing reducibility compares the information available from sets of integers:
  $A lt.eq_T B$ means that an oracle Turing machine with oracle $B$ computes the characteristic function of $A$.
  Mutual reducibility defines Turing equivalence, and its equivalence classes form the partial order
  $\( cal(D)_T \, lt.eq_T \)$ of Turing degrees. The underlying notion of relative computation goes back to
  Turing’s oracle machines [13] Section 4; see [12] for standard degree-theoretic background.
  The automorphism problem asks how much of this information the abstract ordering retains.

The rigidity conjecture for the Turing degrees asks whether every automorphism of this ordering fixes every
  degree. An automorphism here is any bijection $pi : cal(D)_T arrow.r cal(D)_T$ satisfying

$ upright(bold(a)) lt.eq_T upright(bold(b)) quad arrow.l.r.double quad
  pi \( upright(bold(a)) \) lt.eq_T pi \( upright(bold(b)) \) . $

We work in ZFC and impose no definability or regularity hypothesis on $pi$.

#thm([Theorem 1.1.])[
  #emph[Every order automorphism of the full Turing-degree structure is the identity:
$ forall pi in "Aut" \( cal(D)_T \, lt.eq_T \) med forall upright(bold(a)) in cal(D)_T wide
  pi \( upright(bold(a)) \) = upright(bold(a)) . $

]
] <thm:rigidity>

===== 1.1 Prior work and the remaining problem. <prior-work-and-the-remaining-problem.>

The Turing jump sends a degree $upright(bold(a))$ to the degree $upright(bold(a))'$ of the halting problem
  relative to an oracle of degree $upright(bold(a))$. Jockusch and Solovay proved that every jump-preserving order
  automorphism fixes all degrees above $upright(bold(0))^(\( 4 \))$, the fourth jump of the computable degree [2].
  Using Slaman and Woodin’s definability of the double jump,
  Shore and Slaman proved that the jump is definable from the ordering [9],
  so every order automorphism preserves it. Shore later gave direct degree-theoretic definitions of the jump [8].

A cone consists of all degrees above a fixed degree. Nerode and Shore proved that every automorphism fixes some
  cone, whose base may depend on the automorphism [7]; see also [10] Theorem 3.2, author’s version.
  Slaman and Woodin obtained a fixed cone common to all automorphisms:
  every automorphism fixes all degrees above $upright(bold(0))''$, the second jump of the computable degree.
  Their analysis also shows that the automorphism group is countable and that each automorphism has an arithmetic
  representation on sets of integers [11,10]. These results show that the order determines substantial
  computability-theoretic structure. They leave the rigidity problem at degrees outside the known fixed cone.

The representation theorem is the external input to our proof.
  In its all-input form, it assigns to every arbitrary degree automorphism a single arithmetic, hence Borel,
  function on sets of integers that induces that automorphism on degrees [11] Theorem 6.3.1(2).
  The cited source is the 2005 unpublished manuscript; the result also appears in Slaman’s account [10].
  This theorem supplies the regularity needed for a category argument while retaining the unrestricted scope of
  Theorem 1.

===== 1.2 A consequence for definability. <a-consequence-for-definability.>

Theorem 1 also settles the biinterpretability conjecture of Slaman and Woodin.
  Full second-order arithmetic is the two-sorted structure of natural numbers and all subsets of natural numbers,
  with arithmetic and membership. Slaman and Woodin interpret this structure using finite tuples of Turing
  degrees. In their formulation, biinterpretability asks whether the relation matching such a code for a set $X
  subset.eq bb(N)$ with its degree $\[ \]_T X$ is first-order definable in the degree ordering without parameters
  [11] Definition 7.5.1. They prove that this is equivalent to rigidity [11] Theorem 7.5.3;
  thus our theorem gives a positive answer. We state the resulting corollary in Section 5.

===== 1.3 Recovery and removal of parameters. <recovery-and-removal-of-parameters.>

Our main construction is the recovery theorem of Proposition 7.
  We identify $2^(bb(N))$ with the sets of integers; recovering a real means computing which rational numbers lie
  below it. Write $xor$ for the oracle join, which combines the information in finitely many sets of integers.
  For a Borel map $F : bb(R) arrow.r 2^(bb(N))$ with countable fibers satisfying

$ F \( x + y \) lt.eq_T F \( x \) xor F \( y \) \, $

we recover any prescribed irrational $t in \( 0 \, 1 \)$ from four values of $F$ at rational affine combinations
  of $t$ and two auxiliary reals $u \, v$. Recovery holds for a comeager set of pairs $\( u \, v \)$:
  the exceptional pairs form a countable union of nowhere-dense sets.
  The statement applies beyond functions representing degree automorphisms.

The numerical mechanism is an averaging identity. For a fixed positive rational $delta$,
  start with a real state $s_0 = 0$ and repeatedly choose the increment $delta t$ or $delta \( t - 1 \)$,
  recording the choice as $r_n = 0$ or $r_n = 1$, respectively. Summing these increments gives

$ s_N = delta (N t - sum_(n < N) r_n) . $

If the states remain in $\( - 1 \, 1 \)$, the proportion of choices with $r_n =
  1$ approximates $t$ with error less than $1 \/ \( N delta \)$.
  Thus computing the binary choices suffices to recover the irrational parameter $t$ with an effective error bound.

The function $F$ supplies both a rule for choosing the increments and a way to compute those choices.
  Countable fibers ensure that $F$ takes distinct values on opposite sides of $u$.
  Continuity on a comeager restriction then makes one output bit take opposite values near two such points.
  At state $s_n$, we test this bit of $F \( u + s_n \)$, choosing an upward step near the lower endpoint and a
  downward step near the upper endpoint. This keeps the states bounded,
  regardless of the bit’s behavior between the two endpoint regions.

The addition reductions need not be uniform in their inputs.
  For each auxiliary pair in a comeager set, Borel regularity provides two programs that remain fixed along the
  recurrence. The first adds the selected increment while moving from a neighborhood of $u$ to a neighborhood of
  $v$; the second returns to the neighborhood of $u$ at the new offset.
  The computation uses a fixed function value for each of the two possible increments, a fixed return value,
  and the initial value $F \( u \)$. These four values are its only real oracles.
  The program indices and rational constants may depend on $t$ and the chosen pair $\( u \, v \)$.

Finite-oracle recovery also appears in perfect-set coding.
  Groszek and Slaman recover a real from two branches of a perfect tree together with a sequence supplying a
  suitable dense set [1] Lemma 2.2, author’s version. Lutz and Siskind’s refinement recovers any real from four
  elements of a perfect set together with a fixed real that computes each member of a countable dense subset,
  without requiring an enumeration computable from that fixed real [5] Theorem 4.3, arXiv version.
  Our recovery statement has different hypotheses: it uses the addition relation for one Borel function and
  prescribes affine arguments for its four values. Its bounded recurrence supplies the decoding procedure without
  an additional real oracle.

To conclude rigidity, represent an arbitrary automorphism by a map $F$ as above.
  The degrees of the four arguments are bounded by the join of the degrees of $t \, u \, v$.
  Applying the inverse automorphism to the recovery bound therefore bounds the preimage degree of $t$ by this same
  join. Sacks’s relative category cone-avoidance principle says that, over a fixed oracle,
  auxiliary reals compute a fixed set not already computable from that oracle only on a meager set of choices [4]
  Lemma 4.1. Since recovery holds on a comeager set, Lemma 4 removes the auxiliary degrees and yields
  $pi^(- 1) \( upright(bold(a)) \) lt.eq_T upright(bold(a))$ for every degree $upright(bold(a))$.
  Applying $pi$ to this inequality and repeating the argument for $pi^(- 1)$ gives the opposite inequalities
  between $pi \( upright(bold(a)) \)$ and $upright(bold(a))$.

A related method appears in Kjos-Hanssen’s proof of rigidity for automorphisms induced by permutations of the
  natural numbers [3] Theorem 20, arXiv version. That argument recovers a Bernoulli parameter (the probability of
  a $1$), uses a measure cone theorem, and applies the inverse automorphism.
  Here the parameter is recovered from the addition relation for a Borel function,
  and category removes the auxiliary degrees. The representing function need not arise from a permutation.

===== 1.4 Organization. <organization.>

Section 2 fixes the real and oracle codings and proves the category lemmas.
  Section 3 states the exact Slaman–Woodin input and constructs the Borel map on the real line.
  Section 4 proves four-value recovery, and Section 5 removes the auxiliary degrees, completes the proof,
  and derives the biinterpretability corollary.

== 2 Computability and category <sec:preliminaries>

We first encode ordinary real arithmetic by Turing degrees.
  The category lemma at the end of the section will remove the auxiliary real parameters introduced by the
  recovery construction.

We identify $2^(bb(N))$ with the sets of natural numbers, equipped with the usual Cantor topology.
  Fix an effective enumeration $\( Phi_e \)_(e in bb(N))$ of oracle Turing machines.
  For sets $A \, B$, their join $A xor B$ interleaves their characteristic functions.
  Finite joins use a fixed effective coding.

The degree join $upright(bold(a)) or upright(bold(b))$ is the least upper bound of $upright(bold(a)) \,
  upright(bold(b))$: an oracle computes $A xor B$ exactly when it computes both $A$ and $B$.
  Every order automorphism therefore preserves finite joins. It also fixes the least degree $upright(bold(0))$.

To distinguish ordinary real numbers from oracle sets, fix an effective listing $\( q_i \)_(i in bb(N))$ of
  $bb(Q)$ and put

$ C \( x \) = { i : q_i < x } \, wide d \( x \) = \[ C \( x \) \]_T quad \( x in bb(R) \) . $

Thus all computability assertions about real numbers below refer to these strict rational cuts.

#thm([Lemma 2.1.])[
  #emph[The cut map $C : bb(R) arrow.r 2^(bb(N))$ is Borel and injective.
    If $c_0 \, dots.h \, c_k in bb(Q)$ and $x_1 \, dots.h \, x_k in bb(R)$, with $k gt.eq 1$, then
$ d (c_0 + sum_(i = 1)^k c_i x_i) lt.eq_T or.big_(i = 1)^k d \( x_i \) . $

 Every noncomputable degree equals $d \( t \)$ for some irrational $t in \( 0 \, 1 \)$.]
] <lem:cuts>

#proof[
  The $i$th coordinate of $C$ is the indicator of the open ray $\( q_i \, oo \)$, so $C$ is Borel.
    Density of $bb(Q)$ gives injectivity.
  An oracle for $C \( x \)$ computes rational brackets $a < x lt.eq b$ of arbitrarily small width:
    search over rational pairs and check their cut bits. The input cuts consequently compute rational
    approximations, with prescribed error, to any fixed rational linear combination $z$.
    If $z$ is irrational, comparison with each rational query eventually separates and computes $C \( z \)$.
    If $z$ is rational, its cut is computable. This proves the degree inequality.
    It asserts existence of a reduction for each fixed tuple,
    and does not require an algorithm deciding whether the combination is rational.
  Given a noncomputable set $B$, let $t = sum_(n gt.eq 0) B \( n \) 2^(- n - 1)$.
    Then $0 < t < 1$ and $t$ is irrational: the endpoint expansions and all binary expansions of rational numbers
    are computable. The bits of $B$ give effective approximations to $t$,
    hence compute $C \( t \)$ by irrationality. Conversely, successive dyadic comparisons with the cut recover the
    unique binary expansion of $t$. Thus $C \( t \) equiv_T B$. ◻
]

Recall that a set is #emph[meager] if it is a countable union of nowhere-dense sets,
  and #emph[comeager] if its complement is meager. We use the Baire Category Theorem and the fact that Borel sets
  in Polish spaces have the Baire property [6] Theorem 2.52 and Corollary 2.57.

#thm([Lemma 2.2.])[
  #emph[If $X$ is Polish, $Y$ is second countable, and $f : X arrow.r Y$ is Borel,
    there is a comeager set $D subset.eq X$ such that $f \| D$ is continuous.]
] <lem:continuity>

#proof[
  Let $\( U_n \)$ be a countable basis for $Y$. By the Baire property,
    write $f^(- 1) \( U_n \) triangle.stroked.t V_n subset.eq M_n$, where $V_n$ is open and $M_n$ is meager.
    On $D = X \\ union.big_n M_n$ one has $\( f \| D \)^(- 1) \( U_n \) = D ∩ V_n$, which is relatively open. ◻
]

Only continuity on the indicated restriction is asserted.
  For a discrete-valued function, Lemma 3 makes its value constant on the intersection of that restriction with a
  suitable neighborhood of each of its points.

Lemma 4 will remove auxiliary real parameters from a degree bound that holds on a comeager set of pairs.
  It is the relative category cone-avoidance principle attributed to Sacks in [4] Lemma 4.1.
  We include the version for rational-cut oracles that our proof requires.

#thm([Lemma 2.3.])[
  (Category avoidance).  #emph[Let $A \, Y subset.eq bb(N)$ with $Y lt.eq.not_T A$. Then
$ { \( u \, v \) in bb(R)^2 : Y lt.eq_T A xor C \( u \) xor C \( v \) } $

 is meager.]
] <lem:avoidance>

#proof[
  For a fixed index $e$, let $S_e$ be the set of pairs with both coordinates irrational for which
    $Phi_e^(A xor C \( u \) xor C \( v \))$ is the characteristic function of $Y$.
    Suppose $S_e$ is dense in a nonempty open rectangle $R$ with rational endpoints.
    We show that $Y lt.eq_T A$, with $e$ and the endpoints of $R$ as finite program constants.
  On input $n$, search for a finite halting computation of $Phi_e \( n \)$ whose answers about $A$ are correct and
    whose finitely many proposed cut answers hold throughout a nonempty open subrectangle of $R$.
    This is an effective search relative to $A$. Dovetail simulations with finite time bounds and finite tables of
    proposed answers to the two variable oracles. For a cut $C \( u \)$,
    answer $1$ to a rational $q$ imposes $q < u$, whereas answer $0$ imposes $u lt.eq q$.
    Such a finite table is compatible throughout a nonempty open interval inside the corresponding side of $R$
    exactly when the maximum of its lower bounds is smaller than the minimum of its upper bounds,
    after including the corresponding endpoints of $R$ among these bounds.
    This is decidable rational arithmetic, and the same check applies to $v$.
    Repeated queries must have consistent answers.
  The search terminates. A pair in $S_e ∩ R$ has a halting computation on $n$.
    Since its coordinates are irrational, none of the finitely many queried rationals equals the relevant
    coordinate. Its finite transcript therefore holds on an open neighborhood inside $R$,
    and appears in the search. Every transcript accepted by the search is sound:
    its open subrectangle intersects the dense set $S_e$, where the same deterministic computation returns
    $Y \( n \)$. The search thus computes $Y \( n \)$ with oracle $A$, a contradiction.
  It follows that $S_e$ is not dense in any nonempty rational open rectangle.
    Since these rectangles form a basis, $S_e$ is nowhere dense.
    The pairs with a rational coordinate form a countable union of nowhere-dense lines.
    Adding these pairs and taking the countable union over $e$ completes the proof. ◻
]

The reduction index in Lemma 4 may depend on $\( u \, v \)$.
  Its proof takes the union over all indices, so no uniformity across the success set is required.

== 3 Representing an arbitrary automorphism <sec:representation>

We invoke the following established result. Its scope is essential:
  it applies to any automorphism of the full degree order and supplies a single function valid at every input.

#thm([Theorem 3.1.])[
  (Slaman–Woodin).  #emph[For every $pi in "Aut" \( cal(D)_T \, lt.eq_T \)$ there is an arithmetic function
    $hat(F) : 2^(bb(N)) arrow.r 2^(bb(N))$ such that
$ \[ hat(F) \( A \) \]_T = pi \( \[ \]_T A \) wide upright("for every ") A subset.eq bb(N) . $

]
] <thm:representation>

This is Theorem 6.3.1(2) of [11]; see also Theorem 4.29 in the author version of [10].
  The generic-input assertion in the first clause of the cited Theorem 6.3.1 is separate from the all-input
  assertion used here.

Arithmetic here describes the graph of a single total function. That graph is Borel.
  By the Borel-graph criterion for functions between Polish spaces [6] Corollary 4.15, $hat(F)$ is Borel.
  The weaker Borel conclusion also appears directly as Corollary 4.25 in the author version of [10].

#thm([Lemma 3.2.])[
  #emph[For an arbitrary $pi in "Aut" \( cal(D)_T \, lt.eq_T \)$ there is a Borel function $F : bb(R) arrow.r
    2^(bb(N))$ with countable fibers such that
#[#set math.equation(numbering: n => "(3.1)")
 $ \[ F \( x \) \]_T & = pi \( d \( x \) \) wide \( x in bb(R) \) \,\
F \( x + y \) & lt.eq_T F \( x \) xor F \( y \) wide \( x \, y in bb(R) \) . $ <eq:representation>]

]
] <lem:lift>

#proof[
  Take $F = hat(F) compose C$ from Theorem 5 and Lemma 2. If $F \( x \) = F \( y \)$, then $pi \( d \( x \) \) =
    pi \( d \( y \) \)$, hence $d \( x \) = d \( y \)$. Each fiber of $F$ therefore injects, by $C$,
    into a single Turing degree. Such a degree is countable: its members are among the outputs of countably many
    oracle programs with any fixed representative as oracle.
  By Lemma 2, $d \( x + y \) lt.eq_T d \( x \) or d \( y \)$. Since $pi$ preserves order and joins,
  $ \[ F \( x + y \) \]_T lt.eq_T pi \( d \( x \) \) or pi \( d \( y \) \) = \[ F \( x \) xor F \( y \) \]_T . $
  This is exactly (3.1). ◻
]

The representing function is not required to be injective,
  or to give the same output set on equivalent input sets. Equation (3.1) prescribes only its output degree.
  The countable-fiber property is the consequence of injectivity of the automorphism that will enter the argument.

== 4 Recovery from four values <sec:recovery>

The following result separates the local construction from the degree automorphism to which it will be applied.

#thm([Proposition 4.1.])[
  (Recovery from four values).  #emph[Let $F : bb(R) arrow.r 2^(bb(N))$ be Borel with countable fibers, and suppose
$ F \( x + y \) lt.eq_T F \( x \) xor F \( y \) wide \( x \, y in bb(R) \) . $

 For every irrational $t in \( 0 \, 1 \)$ there is a comeager set $G_t subset.eq
   bb(R)^2$ such that for each $\( u \, v \) in G_t$ there is a rational $delta in \( 0 \, 1 \)$ for which
#[#set math.equation(numbering: n => "(4.1)")
 $ C \( t \) lt.eq_T F \( u \) xor F \( u - v \) xor F \( v - u + delta t \) xor
   F \( v - u + delta \( t - 1 \) \) . $ <eq:four-values>]

]
] <prop:recovery>

#proof[
  The two auxiliary reals allow us to advance from $u + s$ to $u + s + a$ through two additions:
  $ \( u + s \) + \( v - u + a \) = v + s + a \, wide \( v + s + a \) + \( u - v \) = u + s + a . $
  If the programs witnessing these additions can be kept fixed,
    then the oracles $F \( v - u + a \)$ and $F \( u - v \)$ turn an oracle for $F \( u + s \)$ into one for
    $F \( u + s + a \)$. We will use only the two increments $delta t$ and $delta \( t - 1 \)$.
    The initial oracle $F \( u \)$, the fixed return oracle $F \( u - v \)$,
    and the two increment oracles are exactly the four values in (4.1).
    For each pair $\( u \, v \)$ in a comeager set, we first arrange two programs that remain fixed along the
    recurrence. A bit of $F \( u + s \)$ will then select the increment so that successive states stay bounded;
    the frequencies of the choices will recover $t$.
  #emph[Two local addition programs.] For each $\( x \, y \)$, let $e \( x \, y \)$ be the least index satisfying
  $ Phi_(e \( x \, y \))^(F \( x \) xor F \( y \)) = F \( x + y \) . $
  Such an index exists by hypothesis. For a fixed index, the condition that every output bit is computed correctly
    is arithmetical in the three oracle sets and is therefore Borel in $\( x \, y \)$.
    The set on which this is the least successful index is Borel as well. Thus $e : bb(R)^2 arrow.r bb(N)$ is Borel.
  By Lemma 3, choose comeager sets $D subset.eq bb(R)$ and $E subset.eq bb(R)^2$ such that $F \| D$ and $e \|
    E$ are continuous; the codomain of $e$ is discrete. Fix the given $t$ and put $H = bb(Q) + bb(Q) t$.
    Let $G_t$ consist of the pairs $\( u \, v \)$ satisfying
  #[#set math.equation(numbering: n => "(4.2)")
   $ u + s in D \, wide \( u + s \, v - u + a \) in E \, wide \( v + s \, u - v \) in E quad
     upright("for all ") s \, a in H . $ <eq:all-shifts>]
  The group $H$ is countable. For each fixed pair of shifts,
    the last two maps of $\( u \, v \)$ in (4.2) are affine homeomorphisms of $bb(R)^2$.
    The first condition is a pullback under a translated coordinate projection;
    the inverse image of a meager exceptional set is meager. Consequently $G_t$ is comeager.
  Fix any $\( u \, v \) in G_t$, and set
  $ p = e \( u \, v - u \) \, wide q = e \( v \, u - v \) . $
  Both centers belong to $E$. Relative continuity of $e \| E$ gives a number $0 < rho < 1$ such that
  #[#set math.equation(numbering: n => "(4.3)")
   $ e \( u + s \, v - u + a \) & = p &  & \( s \, a in H \, med \| s \| \, \| a \| < rho \) \,\
e \( v + s \, u - v \) & = q &  & \( s in H \, med \| s \| < rho \) . $ <eq:p>]
  The membership in $E$ required for these equalities is supplied by (4.2).
    Thus $p$ and $q$ carry out the two additions above whenever $s \, a in H$ and $\| s \| \, \| a \| \, \| s +
    a \| < rho$. The last bound is needed because the second addition starts at the new offset $s + a$.
    We now choose the two increments and a rule for selecting between them so that the old and new offsets always
    stay in this range.
  #emph[A bounded recurrence.] Choose $- rho < b_(-) < 0$ with $u + b_(-) in D$.
    The interval $\( 0 \, rho \)$ contains uncountably many $b$ with $u + b in D$,
    and the fiber of $F \( u + b_(-) \)$ is countable. We may therefore choose $0 < b_(+) < rho$ with $u +
    b_(+) in D$ and $F \( u + b_(-) \) eq.not F \( u + b_(+) \)$.
    Fix a bit $j$ where these two sets differ, and put $h = F \( u + b_(+) \) \( j \)$.
  Continuity of $F \| D$ makes this bit constant on sufficiently small relative neighborhoods of the two endpoint
    translates. Choose a positive rational $delta < rho$ small enough that
  #[#set math.equation(numbering: n => "(4.4)")
   $ F \( u + s \) \( j \) & eq.not h &  & #scale(x: 120%, y: 120%)[\(] s in H ∩ \[ b_(-) \, b_(-) + delta \]
     #scale(x: 120%, y: 120%)[\)] \,\
F \( u + s \) \( j \) & = h &  & #scale(x: 120%, y: 120%)[\(] s in H ∩ \[ b_(+) - delta \, b_(+) \]
  #scale(x: 120%, y: 120%)[\)] . $ <eq:left>]
  We may also require $3 delta < b_(+) - b_(-)$. Every tested translate belongs to $D$ by (4.2);
    the endpoints themselves need not lie in $H$.
  Define $s_0 = 0$ and, recursively,
  #[#set math.equation(numbering: n => "(4.5)")
   $ r_n = cases(delim: "{", 1 \, & F \( u + s_n \) \( j \) = h \,, 0 \, & F \( u + s_n \) \( j \) eq.not h \,)
     wide s_(n + 1) = s_n + delta \( t - r_n \) . $ <eq:recurrence>]
  We claim that
  #[#set math.equation(numbering: n => "(4.6)")
   $ s_n in H ∩ \[ b_(-) \, b_(+) \] wide \( n gt.eq 0 \) . $ <eq:invariant>]
  The initial state has this property. If $r_n = 0$, then (4.4) forces $s_n < b_(+) - delta$;
    the increment $delta t$ lies in $\( 0 \, delta \)$, so $s_(n + 1)$ remains in the interval.
    If $r_n = 1$, then (4.4) forces $s_n > b_(-) + delta$; its negative increment has magnitude
    $delta \( 1 - t \) < delta$, with the same conclusion. Rationality of $delta$ ensures $s_(n + 1) in H$.
    This proves (4.6), and in particular $\| s_n \| < rho$. Figure 1 isolates the only feature of the tested bit
    needed for this confinement: it points the next step inward near either endpoint.
    No restriction on its intervening behavior is needed.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.2, 0.55), fill: rgb("#e0e0ff"), stroke: none)
  rect((1.2, 0), (8.8, 0.55), fill: rgb("#f6f6f6"), stroke: none)
  rect((8.8, 0), (10, 0.55), fill: rgb("#ffe8d1"), stroke: none)
  line((0, 0), (10, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, -0.08), (0, 0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.2, -0.08), (1.2, 0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.8, -0.08), (8.8, 0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((10, -0.08), (10, 0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.09), [#text(size: 9pt)[$b_-$]], anchor: "north", padding: 0.1176cm)
  content((1.2, -0.09), [#text(size: 9pt)[$b_-+ delta$]], anchor: "north", padding: 0.1176cm)
  content((8.8, -0.09), [#text(size: 9pt)[$b_+- delta$]], anchor: "north", padding: 0.1176cm)
  content((10, -0.09), [#text(size: 9pt)[$b_+$]], anchor: "north", padding: 0.1176cm)
  content((0.6, 0.3), [#text(size: 9pt)[$r_n=0$]])
  content((9.4, 0.3), [#text(size: 9pt)[$r_n=1$]])
  content((5, 0.3), [#text(size: 9pt)[either choice may occur]])
  line((0.12, 0.9), (1.1, 0.9), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((0.61, 0.97), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$+ delta t$]]], anchor: "south", padding: 0.1176cm)
  line((9.88, 0.9), (8.9, 0.9), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#b25a00"))))
  content((9.39, 0.97), [#text(fill: rgb("#b25a00"))[#text(size: 9pt)[$- delta (1-t)$]]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: The bounded recurrence, schematically. The tested bit forces an inward step in each endpoint strip; the bit need not be monotone between them. Each step has length less than $delta$, so no state can leave $\[ b_(-) \, b_(+) \]$. The oracle computation produces the choices $r_n$, not the numerical states $s_n$. ],
  ) <fig:bounded-recurrence>
  #emph[Computing the binary choices.] Let $T$ denote the finite join on the right of (4.1).
    We show that $\( r_n \)_(n gt.eq 0)$ is computable from $T$ by maintaining, relative to $T$,
    an oracle-program index $P_n$ satisfying
  $ Phi_(P_n)^T = F \( u + s_n \) . $
  Initially $P_0$ projects to the first component $F \( u \)$.
    Given $P_n$, read $Phi_(P_n)^T \( j \)$ and compare it with the fixed bit $h$ to obtain $r_n$.
    Select the third component of $T$ if $r_n = 0$ and the fourth if $r_n = 1$, namely
  $ F \( v - u + delta \( t - r_n \) \) . $
  Set $a_n = delta \( t - r_n \)$. By (4.6), $s_n \, a_n in H$ and $\| s_n \| \, \| a_n \| < rho$.
    Equation (4.3) therefore shows that program $p$, with its two oracle components simulated by $Phi_(P_n)^T$ and
    the selected tuple component, computes
  $ F \( v + s_n + a_n \) = F \( v + s_(n + 1) \) . $
  Since $\| s_(n + 1) \| < rho$, Equation (4.3) then shows that program $q$,
    with this output and the fixed component $F \( u - v \)$ as its two oracles, computes $F \( u + s_(n + 1) \)$.
    Effective substitution of oracle subroutines produces the next index $P_(n + 1)$.
  This is an actual computation relative to the fixed tuple.
    The indices are constructed using the already computed branch bits.
    Inductively each substituted subroutine is total on its actual oracle,
    and both outer programs are valid reductions at the indicated argument pairs.
    Every bit computation has finite nesting depth through earlier indices and terminates.
    No bound on its running time is needed. To compute $r_n$, perform the finite construction through stage $n$.
  The program uses only the fixed integers $p \, q \, j \, h$, the rational $delta$,
    and the four tuple components. It does not compute the numerical states $s_n$, or use $t \, u \, v \, rho \,
    b_(-) \, b_(+)$ as additional real oracles. The finite program constants may depend on $t \, u \, v$,
    as allowed in the pointwise reduction (4.1).
  #emph[Recovering the parameter.] Summing (4.5) gives
  $ s_N = delta (N t - sum_(n < N) r_n) . $
  Because $\| s_N \| < rho < 1$, the $T$-computable rational numbers $A_N = N^(- 1) sum_(n < N) r_n$ satisfy
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| t - A_N \| < frac(1, N delta) wide \( N gt.eq 1 \) . $ <eq:error>]
  For a rational query $a$, search for an $N$ such that $a < A_N - 1 \/ \( N delta \)$ or $a > A_N +
    1 \/ \( N delta \)$, and return the corresponding cut bit. Irrationality of $t$ guarantees termination.
    The rational $delta$ makes the error bound effective, so this computes $C \( t \)$ from $T$ and proves (4.1). ◻
]

#prodef([Remark 4.2.])[
  The parameter $delta$ and the reduction program in Proposition 7 need not be selected effectively from
    $\( u \, v \)$. The conclusion is that the reduction exists for every pair in a comeager set.
    The category avoidance argument allows precisely this form of nonuniformity.
] <rem:nonuniform>

== 5 Rigidity and biinterpretability <sec:rigidity>

We now apply the recovery construction to the full degree structure.

#proof[
  Fix an arbitrary order automorphism $pi$ and take the Borel map $F$ given by Lemma 6.
    Fix an irrational $t in \( 0 \, 1 \)$. Proposition 7 gives a comeager set $G_t$ of pairs $\( u \, v \)$ for
    which (4.1) holds with a suitable rational $delta in \( 0 \, 1 \)$.
  For such a pair, put $upright(bold(b)) = d \( t \) or d \( u \) or d \( v \)$.
    Each argument in the four values on the right of (4.1) is a rational linear combination of $t \, u \, v \, 1$.
    Lemma 2 bounds its degree by $upright(bold(b))$, and Equation (3.1) bounds the degree of its $F$-value by
    $pi \( upright(bold(b)) \)$. The same upper bound holds for the finite join of the four values. Thus
  $ d \( t \) lt.eq_T pi #scale(x: 120%, y: 120%)[\(] d \( t \) or d \( u \) or d \( v \)
    #scale(x: 120%, y: 120%)[\)] wide \( \( u \, v \) in G_t \) . $
  Applying the inverse order automorphism yields
  #[#set math.equation(numbering: n => "(5.1)")
   $ pi^(- 1) \( d \( t \) \) lt.eq_T d \( t \) or d \( u \) or d \( v \) wide \( \( u \, v \) in G_t \) .
     $ <eq:generic-bound>]
  Choose one fixed set $Y$ representing $pi^(- 1) \( d \( t \) \)$. If $Y lt.eq.not_T C \( t \)$, Lemma 4 says that
  $ { \( u \, v \) : Y lt.eq_T C \( t \) xor C \( u \) xor C \( v \) } $
  is meager. But (5.1) puts the comeager set $G_t$ inside this set,
    contradicting the Baire Category Theorem for $bb(R)^2$. Consequently
  $ pi^(- 1) \( d \( t \) \) lt.eq_T d \( t \) . $
  The set $Y$ is fixed before the pair varies. No common index for the reductions in (5.1) is required.
  The irrational $t$ was arbitrary. By Lemma 2, its degrees cover every noncomputable degree,
    and the least degree is fixed. We have therefore proved
  #[#set math.equation(numbering: n => "(5.2)")
   $ pi^(- 1) \( upright(bold(a)) \) lt.eq_T upright(bold(a)) wide \( upright(bold(a)) in cal(D)_T \) $ <eq:one-sided>]
  for every order automorphism $pi$. Apply this result to the automorphism $pi^(- 1)$ to obtain
    $pi \( upright(bold(a)) \) lt.eq_T upright(bold(a))$. Applying $pi$ to (5.2) gives $upright(bold(a)) lt.eq_T
    pi \( upright(bold(a)) \)$. Antisymmetry now gives $pi \( upright(bold(a)) \) =
    upright(bold(a))$ for every degree. ◻
]

The second application uses Theorem 5 for the inverse degree automorphism.
  It does not require an inverse of $F$, which may have nontrivial fibers.

#thm([Corollary 5.1.])[
  #emph[The Turing-degree ordering is biinterpretable without parameters with full second-order arithmetic,
    in the sense of [11] Definition 7.5.1.]
] <cor:biinterpretability>

#proof[
  Slaman and Woodin prove that this property is equivalent to rigidity [11] Theorem 7.5.3. Apply Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~J.~Groszek and T.~A.~Slaman, A basis theorem for perfect sets,
  #emph[Bulletin of Symbolic Logic] #strong[4] (1998), no.~2, 204--209.
  #link("https://doi.org/10.2307/421023")[DOI].
  #link("https://math.berkeley.edu/~slaman/papers/prikry.pdf")[Author's version], dated 17 November 2000,
  whose lemma numbering is used here.]
#bibitem([2])[C.~G.~Jockusch, Jr., and R.~M.~Solovay, Fixed points of jump preserving automorphisms of degrees,
  #emph[Israel Journal of Mathematics] #strong[26] (1977), no.~1, 91--94.
  #link("https://doi.org/10.1007/BF03007659")[DOI].]
#bibitem([3])[B.~Kjos-Hanssen, Permutations of the integers induce only the trivial automorphism of the Turing
  degrees, #emph[Bulletin of Symbolic Logic] #strong[24] (2018), no.~2, 165--174.
  #link("https://doi.org/10.1017/bsl.2018.15")[DOI]. #link("https://arxiv.org/abs/1603.00525v1")[arXiv:1603.00525v1].]
#bibitem([4])[A.~Kumar and S.~Shelah, Large Turing independent sets,
  #emph[Proceedings of the American Mathematical Society] #strong[151] (2023), no.~1, 355--367.
  #link("https://doi.org/10.1090/proc/16081")[DOI].]
#bibitem([5])[P.~Lutz and B.~Siskind, Part 1 of Martin's conjecture for order-preserving and measure-preserving
  functions, #emph[Journal of the American Mathematical Society] #strong[38] (2025), no.~2, 319--367.
  #link("https://doi.org/10.1090/jams/1046")[DOI].
  #link("https://arxiv.org/abs/2305.19646v3")[arXiv:2305.19646v3], whose theorem numbering is used here.]
#bibitem([6])[D.~Marker, #link("https://www.math.uic.edu/~marker/math512/dst.pdf")[#emph[Descriptive Set Theory]],
  course notes, Fall 2002.]
#bibitem([7])[A.~Nerode and R.~A.~Shore, Reducibility orderings:
  theories, definability and automorphisms, #emph[Annals of Mathematical Logic] #strong[18] (1980), no.~1, 61--89.
  #link("https://doi.org/10.1016/0003-4843(80)90004-2")[DOI].]
#bibitem([8])[R.~A.~Shore, Direct and local definitions of the Turing jump,
  #emph[Journal of Mathematical Logic] #strong[7] (2007), no.~2, 229--262.]
#bibitem([9])[R.~A.~Shore and T.~A.~Slaman, Defining the Turing jump,
  #emph[Mathematical Research Letters] #strong[6] (1999), no.~5--6, 711--722.
  #link("https://math.berkeley.edu/~slaman/papers/jump.pdf")[Author's version].]
#bibitem([10])[T.~A.~Slaman, Global properties of the Turing degrees and the Turing jump,
  in #emph[Computational Prospects of Infinity, Part I: Tutorials], C.~Chong, Q.~Feng, T.~A.~Slaman, W.~H.~Woodin,
  and Y.~Yang (eds.), Lecture Notes Series, Institute for Mathematical Sciences, National University of Singapore,
  vol.~14, World Scientific, Hackensack, NJ, 2008, pp.~83--101.
  #link("https://doi.org/10.1142/9789812794055_0002")[DOI].
  #link("https://math.berkeley.edu/~slaman/papers/IMS_slaman.pdf")[Author's version],
  whose theorem numbering is used here.]
#bibitem([11])[T.~A.~Slaman and W.~H.~Woodin,
  #link("https://math.berkeley.edu/~slaman/talks/sw.pdf")[#emph[Definability in Degree Structures]],
  unpublished manuscript, 21 July 2005.]
#bibitem([12])[R.~I.~Soare, #link("https://link.springer.com/book/9783540666813")[#emph[Recursively Enumerable
  Sets and Degrees: A Study of Computable Functions and Computably Generated Sets]],
  Perspectives in Mathematical Logic, Springer-Verlag, Berlin, 1987.]
#bibitem([13])[A.~M.~Turing, Systems of logic based on ordinals,
  #emph[Proceedings of the London Mathematical Society] (2) #strong[45] (1939), 161--228.
  #link("https://doi.org/10.1112/plms/s2-45.1.161")[DOI].]
