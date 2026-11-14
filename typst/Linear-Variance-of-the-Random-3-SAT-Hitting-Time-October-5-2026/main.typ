#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Linear Variance of the Random 3-SAT Hitting Time]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

Fix an integer $n gt.eq 3$. A #emph[proper 3-clause] is a disjunction of three literals on distinct variables
  among $x_1 \, dots.h \, x_n$. Let $C_1 \, C_2 \, dots.h$ be independent clauses,
  each uniform among the $8 binom(n, 3)$ proper 3-clauses. Thus the signs are fair and independent,
  and whole clauses may repeat. Write

$ F_m = and.big_(j = 1)^m C_j \, wide H_n = min { m gt.eq 1 : F_m upright(" is unsatisfiable") } \, $

where $F_0$ is the empty, satisfiable formula. The random variable $H_n$ records the location of the
  satisfiability transition in the clause process.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C < oo$ such that
$ "Var" \( H_n \) lt.eq C n wide \( n gt.eq 3 \) . $

 There are also absolute constants $c > 0$ and $n_0$ such that $"Var" \( H_n \) gt.eq c n$ for $n gt.eq n_0$.
   In particular, $"Var" \( H_n \) = Theta \( n \)$ as $n arrow.r oo$.]
] <thm:main>

The new assertion is the upper bound. We give its proof in full.
  The lower bound follows from Wilson’s quantitative separation of satisfiability
  levels #cite(label("Wilson2002")) Corollary 4; Section 5 includes the short deduction,
  with the integer endpoints treated explicitly.

=== Context and contribution <context-and-contribution>

Friedgut proved sharpness of the random $k$-SAT threshold for every fixed $k gt.eq
  2$ #cite(label("Friedgut1999")) Theorem 1.3. Quantifying the width of that transition is a finer problem.
  Wilson showed that, for $k gt.eq 3$, a fixed decrease in the satisfiability probability requires at least a
  constant times $sqrt(n)$ additional clauses #cite(label("Wilson2002")).
  More recently, Carenini obtained an $O \( n \/ log n \)$ central clause-window bound for fixed $k gt.eq 3$,
  including independently sampled proper constraints #cite(label("Carenini2026")) Corollaries 7.10–7.11.
  Her subsequent paper #cite(label("Carenini2026Polynomial")) Theorems 1.1 and 1.3, Corollary 1.2,
  made public on October 5, 2026, proves for every fixed $k gt.eq
  3$ a central window bound $O_(k \, eta) \( n^(1 \/ 2 + 1 \/ k) \)$ at each fixed $0 < eta < 1 \/
  2$ and a hitting-time variance bound $O_k \( n^(1 + 2 \/ k) \)$.
  Together with the Abbe–Montanari criterion, her result establishes the limiting satisfiability threshold for
  every fixed $k gt.eq 3$. We credit Carenini with priority for the resolution of the satisfiability conjecture.
  The present paper concerns the sharper fluctuation question for three-literal clauses.

A bound on a fixed central window alone does not control the variance, which also depends on the tails.
  In the other direction, Theorem 1 and Wilson’s lower bound show that the clause window over which satisfiability
  drops from $1 - eta$ to $eta$ has order $sqrt(n)$ for every fixed $0 < eta < 1 \/ 2$; see Corollary 11.

The companion preprint #emph[Variance of the Random $k$-SAT Hitting Time] #cite(label("OpenAI2026Variance"))
  develops a clause-omission and root-test framework. It proves variance $Theta_k \( n \)$ for every fixed $k
  gt.eq 4$ and an upper bound $O \( n log n \)$ for $k = 3$.
  Our argument uses that framework, which we reprove here, and replaces its critical occupation estimate in the
  three-literal case. The companion has broader general-$k$ and capped formulations;
  the present paper concerns the uncapped proper 3-clause process defined above.

The new ingredient is a family of potentials for an arbitrary set $S$ of Boolean assignments.
  Let $q_j \( S \)$ be the probability that $j$ independent random proper 2-clauses leave no assignment in $S$, and put

$ P_d \( S \) = sum_(j = 0)^(d - 1) q_j \( S \) \, wide d gt.eq 1 . $

The potential increases when $S$ shrinks and is bounded by $d$.
  Section 2 proves that $q_d \( S \)^(3 \/ 2)$, for nonempty $S$,
  is controlled by the expected increment of $P_d$ under a random 3-clause, up to a small error.
  Summing those increments gives a direct bound on the accumulated values of $q_d^(3 \/ 2)$.
  This is the step that removes the logarithmic loss.

Here is how the potential enters the variance proof. For $n gt.eq 6$,
  cap $H_n$ at $10 n$ and let $D_i$ be the delay caused by omitting the clause at index $i$,
  without renumbering later clauses. The coordinate-omission form of the Efron–Stein inequality bounds the capped
  variance by $sum_i bb(E) D_i^2$ #cite(label("EfronStein1981")) #cite(label("BBLM2005")).
  Fixing the omitted clause singles out its three variables as roots.
  If that clause is pivotal, every remaining solution has the unique root assignment that falsifies it.
  Flipping each root gives an independent family of necessary tests on the nonroot solution set,
  except when another clause meets two or more roots. Section 3 constructs this exposure and proves the test bound.

Let $d$ be the larger of $1$ and the number of clauses other than $C_i$ among the first $10 n$ that meet a root.
  At a given index, let $S$ be the nonroot solution set of the omitted-clause prefix with the roots fixed to their
  falsifying assignment, and write $p = q_d \( S \)$. With no collisions,
  the three test families each have at most $d$ clauses and give a pivotality bound $p^3$.
  For $p > 0$, the potential gives a conditional remaining-duration bound $O \( d^(3 \/ 2) p^(- 3 \/ 2) \)$ and
  bounds the conditional expected sum of $p^(3 \/ 2)$, while $S$ is nonempty, by $O \( d^(3 \/ 2) \)$.
  The identity $3 - 3 \/ 2 = 3 \/ 2$ thus yields a conditional squared-delay bound $O \( d^3 \)$.
  The root-incidence count $d$ has bounded moments uniformly in $n$.
  Section 4 carries out this calculation and averages the rare collision cases, obtaining $bb(E) D_i^2 =
  O \( 1 \)$ uniformly in $i$. Finally, Section 5 removes the cap using an elementary first-moment tail bound and
  proves the matching lower bound.

Throughout, a random proper $a$-clause on a specified variable set is uniform over the clauses using $a$ distinct
  variables and independent fair signs. Independent collections are sampled with replacement.
  All unspecified constants are absolute.

== 2 A potential for killing assignment sets <sec:potential>

We first work on $u gt.eq 3$ variables, independently of the clause process.
  The aim is to bound a power of a short-clause killing probability by the drift of a bounded, monotone potential.
  For $S subset.eq { 0 \, 1 }^u$ and a clause $C$, let

$ S \[ C \] = { z in S : z tack.rr C } . $

For $j gt.eq 0$, define $q_j \( S \)$ as the probability that $j$ independent random proper 2-clauses #emph[kill]
  $S$, meaning that no member of $S$ satisfies them all. In particular,

$ q_j \( diameter \) = 1 quad \( j gt.eq 0 \) \, wide q_0 \( S \) = 0 quad \( S eq.not diameter \) . $

The quantity $q_j \( S \)$ is nondecreasing both in $j$ and when $S$ shrinks.
  Set $beta = 3 \/ 2$ for the rest of the paper.

#thm([Lemma 2.1.])[
  (One-clause comparison).  #emph[For a nonempty assignment set $S$,
    let $h_a \( S \)$ be the probability that one random proper $a$-clause kills $S$, for $a = 2 \, 3$. Then
#[#set math.equation(numbering: n => "(2.1)")
 $ h_2 \( S \)^beta lt.eq 3 h_3 \( S \) + u^(- 3) . $ <eq:one>]

]
] <lem:one>

#proof[
  A coordinate is #emph[frozen] if it is constant throughout $S$. Let $b$ be the number of frozen coordinates.
    A clause kills all of $S$ exactly when all its variables are frozen and each literal has the falsifying sign.
    Consequently,
  $ h_a \( S \) = frac(\( b \)_a, 2^a \( u \)_a) \, wide a = 2 \, 3 \, $
  where $\( t \)_a = t \( t - 1 \) dots.h.c \( t - a + 1 \)$, with value zero for integers $0 lt.eq t < a$.
    Since $b lt.eq u$,
  $ sqrt(h_2 \( S \)) lt.eq frac(b, 2 u) . $
  For $b gt.eq 3$ we also have
  $ frac(h_3 \( S \), h_2 \( S \)) = frac(b - 2, 2 \( u - 2 \)) gt.eq frac(b, 6 u) \, $
  which proves $h_2 \( S \)^(3 \/ 2) lt.eq 3 h_3 \( S \)$ in this case. For $b lt.eq 1$ the left side is zero.
    For $b = 2$ it is $\[ 2 u \( u - 1 \) \]^(- 3 \/ 2) lt.eq u^(- 3)$, proving (2.1). ◻
]

The error term accounts for sets with exactly two frozen coordinates:
  a 2-clause can kill such a set, whereas a proper 3-clause cannot.
  The following lemma turns the one-clause comparison into the potential estimate needed along a decreasing
  sequence of assignment sets.

#thm([Lemma 2.2.])[
  (Potential drift).  #emph[For every integer $d gt.eq 1$, put
$ P_d \( S \) = sum_(j = 0)^(d - 1) q_j \( S \) . $

 Then $0 lt.eq P_d \( S \) lt.eq d$, and $P_d$ is nondecreasing when $S$ shrinks.
   If $C$ is an independent random proper 3-clause on the $u$ variables, then
#[#set math.equation(numbering: n => "(2.2)")
 $ upright(bold(1))_({ S eq.not diameter }) q_d \( S \)^beta lt.eq
   d^(beta - 1) (3 bb(E)_C \[ P_d \( S \[ C \] \) - P_d \( S \) \] + d u^(- 3)) . $ <eq:drift>]

]
] <lem:potential>

#proof[
  Fix $j gt.eq 0$, and let $Y$ be the subset of $S$ surviving $j$ independent random proper 2-clauses.
    Adding one more such clause gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ q_(j + 1) \( S \) - q_j \( S \) = bb(E) \[ upright(bold(1))_({ Y eq.not diameter }) h_2 \( Y \) \] .
     $ <eq:two-increment>]
  Adding instead the independent 3-clause $C$ gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ bb(E)_C \[ q_j \( S \[ C \] \) - q_j \( S \) \] =
     bb(E) \[ upright(bold(1))_({ Y eq.not diameter }) h_3 \( Y \) \] . $ <eq:three-increment>]
  Indeed, in either order of adding the clauses, the increase in killing probability is precisely the probability
    that the old surviving set is nonempty and the final clause kills it.
    Products with the indicators in these formulas are defined to be zero when $Y$ is empty.
    Jensen’s inequality and Lemma 2 imply
  $ \( q_(j + 1) \( S \) - q_j \( S \) \)^beta lt.eq 3 bb(E)_C \[ q_j \( S \[ C \] \) - q_j \( S \) \] + u^(- 3) . $
  For nonempty $S$, the nonnegative successive differences telescope to $q_d \( S \)$, because $q_0 \( S \) = 0$.
    Thus the power-sum inequality yields
  $ q_d \( S \)^beta lt.eq d^(beta - 1) sum_(j = 0)^(d - 1) \( q_(j + 1) \( S \) - q_j \( S \) \)^beta \, $
  and summing the preceding bound proves (2.2). For empty $S$,
    its left side is zero and its right side is nonnegative. The bounds and monotonicity of $P_d$ follow directly
    from those of $q_j$. ◻
]

== 3 Clause deletion and independent root tests <sec:deletion>

We now reduce the variance bound to a uniform squared-delay estimate.
  The root exposure and root-flip tests in this section follow the clause-omission framework
  of #cite(label("OpenAI2026Variance")) Section 3; all details needed here are included.

Assume $n gt.eq 6$, set $L = 10 n$, and let $T = min \( H_n \, L \)$.
  For $1 lt.eq i lt.eq L$, omit $C_i$ while retaining the original indices:

$ B_m^(\( i \)) = and.big_(1 lt.eq j lt.eq m\
j eq.not i) C_j . $

Let $T^(\( i \))$ be the first index at which this omitted-clause process is unsatisfiable, capped at $L$,
  and set $D_i = T^(\( i \)) - T gt.eq 0$. Both capped variables are functions of the first $L$ clauses,
  and $T^(\( i \))$ does not depend on $C_i$.

#thm([Lemma 3.1.])[
  (Coordinate omission).  #emph[The capped hitting time satisfies
#[#set math.equation(numbering: n => "(3.1)")
 $ "Var" \( T \) lt.eq sum_(i = 1)^L bb(E) D_i^2 . $ <eq:variance-deletion>]

]
] <lem:omission>

#proof[
  This is the coordinate-omission form of the Efron–Stein inequality; see #cite(label("BBLM2005")) Section 3.2,
    Equation (3.6). For completeness, write $cal(F)_i = sigma \( C_1 \, dots.h \, C_i \)$ and $Delta_i X =
    bb(E) \[ X divides cal(F)_i \] - bb(E) \[ X divides cal(F)_(i - 1) \]$.
    Independence and the omission of $C_i$ give $Delta_i T^(\( i \)) = 0$, so $Delta_i T = - Delta_i D_i$.
    Orthogonality of conditional-expectation projections implies $bb(E) \( Delta_i D_i \)^2 lt.eq bb(E) D_i^2$.
    Summing the orthogonal martingale differences of $T$ proves (3.1). ◻
]

=== 3.1 The exposure and its two filtrations <subsec:exposure>

Fix $i$ and condition on the value of $C_i$ until further notice.
  All probabilities and expectations in this section and in Section 4, until the final averaging step,
  are in this conditional law. Write $B_m = B_m^(\( i \))$.
  Call the three variables of $C_i$ the #emph[roots], denote their set by $R$, and let $w in { 0 \,
  1 }^R$ be the unique root assignment falsifying $C_i$. There are $u = n - 3 gt.eq 3$ nonroot variables.

For $i lt.eq m < L$, define

#[#set math.equation(numbering: n => "(3.2)")
 $ A_m = { B_m upright(" is satisfiable and ") B_m and C_i upright(" is unsatisfiable") } = { T lt.eq
   m < T^(\( i \)) } . $ <eq:A>]

The processes agree before $i$, so

#[#set math.equation(numbering: n => "(3.3)")
 $ D_i = sum_(m = i)^(L - 1) upright(bold(1))_(A_m) . $ <eq:delay>]

For $i lt.eq m lt.eq L$, let $S_m subset.eq { 0 \, 1 }^u$ consist of the nonroot assignments that,
  together with $w$, satisfy $B_m$. The sets $S_m$ decrease with $m$.
  On $A_m$, the set $S_m$ is nonempty, and every solution of $B_m$ has root assignment $w$.

We will retain two independent sources of randomness: clauses driving the evolution of $S_m$,
  and clauses testing possible root flips. For every index $j lt.eq L$ other than $i$,
  first reveal the subset of $R$ met by $C_j$ and all signs on that subset. Classify the index as follows:

- An #emph[ordinary] clause meets no root; leave all its contents hidden.
- A #emph[test] clause meets exactly one root, whose literal is true under $w$; leave its two nonroot literals hidden.
- For every other clause, reveal all its remaining contents.

Let $cal(E)$ be the sigma-field of this exposure, including the information at future indices.
  Let $Z$ count the exposed indices meeting at least one root, and let $V$ count those meeting at least two roots.
  The latter clauses are called #emph[collisions]. Set $d = max { 1 \, Z }$.
  The counts $Z \, V \, d$ and the complete schedule of clause types are $cal(E)$-measurable.

Conditional on $cal(E)$, the hidden ordinary clauses are independent uniform proper 3-clauses on the nonroots,
  and the hidden nonroot parts of the test clauses are independent uniform proper 2-clauses there.
  These two collections are also independent of each other.
  To see this, condition first on the root subset and its signs separately at each index.
  Every permitted signed nonroot part remains equiprobable,
  and the original product law across indices is preserved.
  Revealing the remaining contents at the other indices does not change the law of the hidden coordinates.

For $i lt.eq m lt.eq L$, define

$ cal(G)_m & = cal(E) or sigma \( upright("ordinary contents through index ") m \) \,\
cal(H)_m & = cal(G)_m or sigma \( upright("test parts through index ") m \) . $

The set $S_m$ is $cal(G)_m$-measurable: all test clauses are already true under $w$, whatever their nonroot parts.
  The event $A_m$ is $cal(H)_m$-measurable, because this larger sigma-field knows all clauses of $B_m$.
  Future ordinary contents remain fresh given $cal(H)_m$. Finally, put

#[#set math.equation(numbering: n => "(3.4)")
 $ p_m = q_d \( S_m \) . $ <eq:p>]

The quantity $p_m$ is $cal(G)_m$-measurable and nondecreasing in $m$.
  Keeping the tests out of $cal(G)_m$ will allow us to estimate pivotality after using $cal(H)_m$ to estimate the
  remaining duration.

=== 3.2 Necessary tests for root flips <necessary-tests-for-root-flips>

#thm([Lemma 3.2.])[
  (Root-test bound).  #emph[For $i lt.eq m < L$, conditional on $cal(G)_m$,
#[#set math.equation(numbering: n => "(3.5)")
 $ bb(P) \( A_m divides cal(G)_m \) & lt.eq upright(bold(1))_({ S_m eq.not diameter }) p_m^3 &  & upright("on ") {
   V = 0 } \,\
bb(P) \( A_m divides cal(G)_m \) & lt.eq upright(bold(1))_({ S_m eq.not diameter }) p_m^2 &  & upright("on ") {
  V = 1 } . $ <eq:test3>]

]
] <lem:tests>

#proof[
  Call a root $x$ #emph[available at time $m$] if no collision through index $m$, excluding $i$,
    has its literal on $x$ as the unique root literal true under $w$.
    A collision excludes at most one root, so at least $3 - V$ roots are available. Availability is $cal(E)$-measurable.
  For an available root $x$, the nonroot parts of its test clauses through $m$ must kill $S_m$ on $A_m$.
    Otherwise, take $z in S_m$ satisfying all these parts and flip only $x$ in the assignment $\( w \, z \)$.
    Every clause of $B_m$ remains satisfied. A clause with no true root literal under $w$ already has a satisfied
    nonroot literal, which is unchanged. A clause with a true root literal other than the one on $x$ keeps that
    literal. Finally, a clause whose unique true root literal is on $x$ cannot be a collision, by availability;
    it is therefore a test clause for $x$, and $z$ satisfies its nonroot part.
    The flipped assignment also satisfies $C_i$, contradicting $A_m$.
  Given $cal(G)_m$, the test families for distinct roots remain independent collections of random proper
    2-clauses, independent of $S_m$. Each family has at most $Z lt.eq d$ members,
    so its probability of killing $S_m$ is at most $q_d \( S_m \) = p_m$.
    On $V = 0$ all three roots are available; on $V = 1$ at least two are.
    Taking these necessary independent events proves the two inequalities, including the cases $p_m = 0$ or $S_m =
    diameter$. ◻
]

== 4 Occupation and squared deletion delays <sec:occupation>

We continue with $i$ and $C_i$ fixed. Our goal is $bb(E) D_i^2 = O \( 1 \)$,
  uniformly in the value of the fixed clause. The root tests bound the chance that a delay is present;
  the potential will bound how long that delay can continue.

#thm([Lemma 4.1.])[
  (Conditional occupation estimate).  #emph[With $K = 7$, for every $i lt.eq m < L$,
#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E) [sum_(s = m)^(L - 1) upright(bold(1))_({ S_s eq.not diameter }) p_s^beta thin mid(bar.v) thin cal(H)_m]
   lt.eq K d^beta . $ <eq:occupation>]

]
] <lem:occupation>

#proof[
  Suppose $s + 1$ is ordinary, a fact known under $cal(E)$.
    Then $S_(s + 1) = S_s \[ C_(s + 1) \]$, and $C_(s + 1)$ is still a uniform proper 3-clause on the nonroots
    given $cal(H)_s$. Lemma 3 gives
  $ upright(bold(1))_({ S_s eq.not diameter }) p_s^beta lt.eq
    3 d^(beta - 1) bb(E) \[ P_d \( S_(s + 1) \) - P_d \( S_s \) divides cal(H)_s \] + d^beta u^(- 3) . $
  Condition on $cal(H)_m$ and sum over such $s$. Every potential increment is nonnegative,
    even at nonordinary steps. Thus, pathwise,
  $ sum_(m lt.eq s < L\
s + 1 upright(" ordinary")) \( P_d \( S_(s + 1) \) - P_d \( S_s \) \) lt.eq P_d \( S_L \) - P_d \( S_m \) lt.eq d . $
  The tower property therefore bounds the contribution of the ordinary steps by $3 d^beta + L d^beta u^(- 3)$.
    There are at most $Z$ remaining steps: all indices $s + 1$ in question exceed $i$,
    and every nonordinary index meets a root. Each remaining summand is at most one.
    Since $Z lt.eq d lt.eq d^beta$, $u = n - 3 gt.eq n \/ 2$, and $n gt.eq 6$, the full sum is bounded by
  $ 3 d^beta + L d^beta u^(- 3) + Z lt.eq (4 + 80 / n^2) d^beta lt.eq 7 d^beta . $
  ◻
]

#thm([Corollary 4.2.])[
  (Remaining duration).  #emph[For $i lt.eq m < L$,
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E) [sum_(s = m)^(L - 1) upright(bold(1))_(A_s) thin mid(bar.v) thin cal(H)_m] lt.eq W_m \, wide W_m =
   cases(delim: "{", min { L \, K d^beta p_m^(- beta) } \, & p_m > 0 \,, L \, & p_m = 0 .) $ <eq:duration>]

 In particular, $W_m$ is measurable with respect to the smaller sigma-field $cal(G)_m$.]
] <cor:duration>

#proof[
  For $s gt.eq m$, we have $p_s gt.eq p_m$, and $A_s$ implies $S_s eq.not diameter$.
    If $p_m > 0$, divide (4.1) by $p_m^beta$. The count is always at most $L$,
    giving both the minimum and the case $p_m = 0$. Measurability follows from that of $d$ and $p_m$. ◻
]

The two estimates now have the compatible conditioning we need:
  the duration estimate knows whether $A_m$ has occurred, while its upper bound $W_m$ does not reveal the test
  parts. We can therefore multiply it by the independent-test probability from Lemma 5.

#thm([Proposition 4.3.])[
  (Squared delay conditional on the exposure).  #emph[For every $1 lt.eq i lt.eq L$,
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) \[ D_i^2 divides cal(E) \] lt.eq 2 K^2 d^3 upright(bold(1))_({ V = 0 }) +
   2 K L d^(3 \/ 2) upright(bold(1))_({ V = 1 }) + L^2 upright(bold(1))_({ V gt.eq 2 }) . $ <eq:delay-bound>]

]
] <prop:delay>

#proof[
  For $i = L$ we have $D_i = 0$. Otherwise, (3.3) implies
  $ D_i^2 lt.eq 2 sum_(m = i)^(L - 1) upright(bold(1))_(A_m) sum_(s = m)^(L - 1) upright(bold(1))_(A_s) . $
  First condition on $cal(H)_m$, where $A_m$ is known, and apply Corollary 7.
    Then condition on $cal(G)_m$, where $W_m$ is known. Conditioning both estimates down to $cal(E)$ gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(E) \[ D_i^2 divides cal(E) \] lt.eq 2 sum_(m = i)^(L - 1)
     bb(E) \[ W_m bb(P) \( A_m divides cal(G)_m \) divides cal(E) \] . $ <eq:towers>]
  On $V = 0$, Lemma 5 bounds the product inside by
  $ K d^beta upright(bold(1))_({ S_m eq.not diameter }) p_m^(3 - beta) =
    K d^beta upright(bold(1))_({ S_m eq.not diameter }) p_m^beta . $
  This remains valid for $p_m = 0$, because the conditional probability then vanishes.
    Lemma 6 with $m = i$, conditioned further down to $cal(E)$, bounds the sum in (4.4) by $2 K^2 d^(2 beta) =
    2 K^2 d^3$. On $V = 1$, the same product is at most $K d^beta p_m^(2 - beta) lt.eq K d^beta$ when $p_m > 0$,
    and is zero when $p_m = 0$. There are at most $L$ terms. Finally, on $V gt.eq 2$ use $D_i lt.eq L$.
    The cases are $cal(E)$-measurable, proving (4.3). ◻
]

=== 4.1 Averaging the collision costs <averaging-the-collision-costs>

It remains to average the three terms of (4.3). Although one collision costs a factor $L$ and two collisions cost
  $L^2$, their probabilities are correspondingly small.

#thm([Lemma 4.4.])[
  (Root-incidence moments).  #emph[Uniformly in $n gt.eq 6$, $i$, and the fixed value of $C_i$,
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) d^3 = O \( 1 \) \, wide bb(E) \[ d^(3 \/ 2) upright(bold(1))_({ V gt.eq 1 }) \] = O \( n^(- 1) \) \, wide
   bb(P) \( V gt.eq 2 \) = O \( n^(- 2) \) . $ <eq:moments>]

]
] <lem:moments>

#proof[
  Each of the other $L - 1$ independent clauses meets a specified root with probability $3 \/ n$,
    and contains a specified pair of roots with probability $6 \/ \[ n \( n - 1 \) \]$.
    Union bounds over the three roots and their three pairs give incidence and collision probabilities satisfying
  $ p_(upright("hit")) lt.eq 9 / n \, wide p_(upright("coll")) lt.eq frac(18, n \( n - 1 \)) . $
  The incidence count $Z$ is binomial, so
  $ bb(E) e^Z = \( 1 + \( e - 1 \) p_(upright("hit")) \)^(L - 1) lt.eq exp \( 90 \( e - 1 \) \) . $
  This uniformly bounded exponential moment gives $bb(E) d^3 = O \( 1 \)$.
  For each $j eq.not i$ with $j lt.eq L$, let $J_j$ be the event that $C_j$ is a collision.
    Bound $upright(bold(1))_({ V gt.eq 1 })$ by $sum_(j eq.not i) upright(bold(1))_(J_j)$.
    Conditional on $J_j$, the count $Z$ is one plus a binomial variable with $L -
    2$ trials and success probability $p_(upright("hit"))$; all other clauses retain their original law.
    Its exponential moment, and hence $bb(E) \[ d^(3 \/ 2) divides J_j \]$, is bounded uniformly. Therefore
  $ bb(E) \[ d^(3 \/ 2) upright(bold(1))_({ V gt.eq 1 }) \] lt.eq
    sum_(j eq.not i) bb(P) \( J_j \) bb(E) \[ d^(3 \/ 2) divides J_j \] lt.eq
    O \( 1 \) \( L - 1 \) p_(upright("coll")) = O \( n^(- 1) \) . $
  Finally, independence at different indices gives
  $ bb(P) \( V gt.eq 2 \) lt.eq bb(E) binom(V, 2) = binom(L - 1, 2) p_(upright("coll"))^2 = O \( n^(- 2) \) . $
  ◻
]

Combining Proposition 8 and Lemma 9, and using $L = 10 n$, proves $bb(E) D_i^2 =
  O \( 1 \)$ in the law conditional on $C_i$, with a constant independent of its value.
  We may now remove that conditioning. Lemma 4 gives

#[#set math.equation(numbering: n => "(4.6)")
 $ "Var" \( min { H_n \, 10 n } \) = O \( n \) wide \( n gt.eq 6 \) . $ <eq:capped>]

This completes the deletion argument. No information about the location of the satisfiability threshold was needed.

== 5 The uncapped hitting time and the lower bound <sec:finish>

=== 5.1 Removing the cap <removing-the-cap>

For a fixed assignment, each independent clause is satisfied with probability $7 \/ 8$.
  A union bound over the $2^n$ assignments gives, for every $n gt.eq 3$ and integer $m gt.eq 0$,

#[#set math.equation(numbering: n => "(5.1)")
 $ bb(P) \( H_n > m \) = bb(P) \( F_m upright(" is satisfiable") \) lt.eq 2^n \( 7 \/ 8 \)^m . $ <eq:tail>]

In particular $H_n$ is finite almost surely and has a finite second moment.
  For $n gt.eq 6$, write $T = min { H_n \, L }$ as before. The integer-valued tail-sum formula yields

#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E) \( H_n - T \)^2 & = sum_(j = 0)^oo \( 2 j + 1 \) bb(P) \( H_n > L + j \)\
 & lt.eq 120 (2 \( 7 \/ 8 \)^10)^n . $ <eq:cap-error>]

Here $sum_(j gt.eq 0) \( 2 j + 1 \) r^j = \( 1 + r \) \/ \( 1 - r \)^2 = 120$ for $r = 7 \/ 8$,
  and $2 \( 7 \/ 8 \)^10 < 1$. Since

$ "Var" \( H_n \) lt.eq 2 "Var" \( T \) + 2 "Var" \( H_n - T \) lt.eq 2 "Var" \( T \) + 2 bb(E) \( H_n - T \)^2 \, $

Equations (4.6) and (5.2) give the upper bound in Theorem 1 for $n gt.eq 6$.
  For $3 lt.eq n < 6$, the same tail bound gives $bb(E) H_n^2 lt.eq 120 dot.op 2^n$,
  so enlarging the absolute constant covers these finitely many sizes.

=== 5.2 Wilson’s separation theorem <wilsons-separation-theorem>

Define the survival function and its integer level locations by

$ s_n \( m \) = bb(P) \( H_n > m \) \, wide r_n \( p \) = min { m gt.eq 0 : s_n \( m \) lt.eq
  p } quad \( 0 < p < 1 \) . $

These locations are finite by (5.1) and positive because $s_n \( 0 \) = 1$.
  We use the following consequence of Wilson’s theorem for the independent proper-clause model with replacement.

#thm([Theorem 5.1.])[
  (Wilson #cite(label("Wilson2002")), Corollary 4).  #emph[Fix $1 > p_1 > p_2 > 0$.
    There is a constant $a \( p_1 \, p_2 \) > 0$ such that, for all sufficiently large $n$, if integers $m_1 \,
    m_2$ satisfy $s_n \( m_1 \) gt.eq p_1$ and $s_n \( m_2 \) lt.eq p_2$, then
$ m_2 - m_1 gt.eq a \( p_1 \, p_2 \) sqrt(n) . $

]
] <thm:wilson>

Take $a_n = r_n \( 3 \/ 4 \)$ and $b_n = r_n \( 1 \/ 4 \)$.
  Minimality gives $s_n \( a_n - 1 \) > 3 \/ 4$, whereas $s_n \( b_n \) lt.eq 1 \/ 4$.
  Theorem 10, applied at $a_n - 1$ and $b_n$, therefore implies $b_n - a_n + 1 gt.eq
  a \( 3 \/ 4 \, 1 \/ 4 \) sqrt(n)$. Thus

#[#set math.equation(numbering: n => "(5.3)")
 $ b_n - a_n gt.eq c_0 sqrt(n) $ <eq:separation>]

for an absolute $c_0 > 0$ and all sufficiently large $n$. Moreover,

$ bb(P) \( H_n lt.eq a_n \) gt.eq 1 / 4 \, wide bb(P) \( H_n gt.eq b_n \) = s_n \( b_n - 1 \) > 1 / 4 . $

Let $H'_n$ be an independent copy of $H_n$. The two events ${ H_n lt.eq a_n \, H'_n gt.eq b_n }$ and ${ H'_n lt.eq
  a_n \, H_n gt.eq b_n }$ are disjoint for large $n$, each has probability at least $1 \/ 16$,
  and on each $\| H_n - H'_n \| gt.eq b_n - a_n$. Consequently,

$ "Var" \( H_n \) = 1 / 2 bb(E) \( H_n - H'_n \)^2 gt.eq frac(\( b_n - a_n \)^2, 16) gt.eq c_0^2 / 16 n . $

This completes the proof of Theorem 1.

#thm([Corollary 5.2.])[
  (Fixed central windows).  #emph[For every fixed $0 < eta < 1 \/ 2$,
$ r_n \( eta \) - r_n \( 1 - eta \) = Theta_eta \( sqrt(n) \) . $

]
] <cor:window>

#proof[
  The lower bound follows from Theorem 10 at $r_n \( 1 - eta \) - 1$ and $r_n \( eta \)$,
    absorbing the additive one. For the upper bound, put $mu_n =
    bb(E) H_n$ and choose $t = \( 2 C n \/ eta \)^(1 \/ 2)$, with $C$ from Theorem 1.
    Chebyshev’s inequality gives $bb(P) \( \| H_n - mu_n \| gt.eq t \) lt.eq eta \/ 2$.
    For every nonnegative integer $m lt.eq mu_n - t$ this implies $s_n \( m \) gt.eq 1 - eta \/ 2 > 1 - eta$,
    whereas at $m = ceil.l mu_n + t ceil.r$ it implies $s_n \( m \) lt.eq eta \/ 2 < eta$.
    Hence $r_n \( 1 - eta \) > mu_n - t$ and $r_n \( eta \) lt.eq ceil.l mu_n + t ceil.r$,
    proving the upper bound. If $mu_n - t < 0$, the first inequality follows instead from $r_n \( 1 - eta \) gt.eq 0$. ◻
]

The variance bound controls fluctuations around the finite-size mean $bb(E) H_n$.
  Neither the proof nor Corollary 11 requires a limiting value of $bb(E) H_n \/
  n$ or a limiting distribution for the centered hitting time.

#bibliography("refs.bib", style: "ieee", title: [References])
