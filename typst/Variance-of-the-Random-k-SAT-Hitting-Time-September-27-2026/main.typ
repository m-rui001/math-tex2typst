#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Variance of the Random $k$-SAT Hitting Time]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Fluctuations of the satisfiability transition <sec:introduction>

Add independent random clauses to a Boolean formula until the formula becomes unsatisfiable.
  How much does the number of clauses at this first failure vary from one sample to another?
  For every fixed clause size $k gt.eq 4$, we prove that its variance has order $n$,
  where $n$ is the number of variables. For three-literal clauses the variance lies between positive constant
  multiples of $n$ and $n log n$.

A #emph[proper $k$-clause] is a disjunction of literals on $k$ distinct variables.
  Fix $k gt.eq 3$ and $n gt.eq k$, and let $C_1 \, C_2 \, dots.h$ be independent uniform choices from the $2^k
  binom(n, k)$ proper signed clauses on $n$ variables. Signs are independent and fair; whole clauses may repeat. Put

$ F_m = C_1 and dots.h.c and C_m \, wide F_0 = upright("true") \, wide H_n = min { m gt.eq 1 :
  F_m upright(" is unsatisfiable") } . $

For a fixed $B > 0$, the capped first failure time is $T_(n \, B) = min { H_n \, floor.l B n floor.r }$.
  Each assignment survives a clause with probability $1 - 2^(- k)$, so

#[#set math.equation(numbering: n => "(1.1)")
 $ Pr \( H_n > m \) lt.eq 2^n \( 1 - 2^(- k) \)^m . $ <eq:intro-first-moment>]

Thus $H_n$ is almost surely finite and has finite moments.

#thm([Theorem 1.1.])[
  #emph[Fix an integer $k gt.eq 3$, and write
$ ell_k \( n \) = cases(delim: "{", log \( e n \) \, & k = 3 \,, 1 \, & k gt.eq 4 \,) wide U_k =
  frac(log 2, - log \( 1 - 2^(- k) \)) . $

 There are constants $C_k \, c_k > 0$ such that
$ "Var" \( H_n \) lt.eq C_k n ell_k \( n \) quad \( n gt.eq k \) \, wide "Var" \( H_n \) gt.eq c_k n quad
  upright("for all sufficiently large ") n . $

 For every fixed $B > 0$ there is $C_(k \, B) < oo$ such that
$ "Var" \( T_(n \, B) \) lt.eq C_(k \, B) n ell_k \( n \) quad \( n gt.eq k \) . $

 If $B > U_k$, then also $"Var" \( T_(n \, B) \) gt.eq c_k n$ for all sufficiently large $n$,
   with the size cutoff allowed to depend on $k$ and $B$.]
] <thm:variance>

All constants concern fixed $k$. The lower condition on the cap is substantive:
  an early cap can stop the process before its random transition.
  In the proof, it is enough to have integer caps $L_n = O \( n \)$ with $Pr \( H_n > L_n - 1 \) lt.eq
  1 \/ 4$ eventually; $B > U_k$ is an explicit sufficient condition.
  This argument leaves a logarithmic gap for three-literal clauses;
  the companion paper #cite(label("LinearThreeSATVariance")) closes it and proves $"Var" \( H_n \) =
  Theta \( n \)$ for the uncapped proper 3-clause process.

The identity $Pr \( F_m upright(" is satisfiable") \) = Pr \( H_n > m \)$ turns these variance bounds into bounds
  on the transition window. Between any fixed probability levels $eta$ and $1 - eta$, $0 < eta < 1 \/ 2$,
  its width is $O_(k \, eta) \( sqrt(n ell_k \( n \)) \)$. Chebyshev’s inequality also gives

$ Pr #scale(x: 120%, y: 120%)[\(] \| H_n - bb(E) H_n \| gt.eq
  t sqrt(n ell_k \( n \)) #scale(x: 120%, y: 120%)[\)] lt.eq C_k t^(- 2) wide \( t > 0 \) . $

This is concentration about the finite-size expectation. The limiting threshold $alpha_k$ of
  #cite(label("FixedKThreshold")) Theorem 1.1 identifies $lim_n bb(E) H_n \/ n$,
  but supplies no bound on the bias $bb(E) H_n - alpha_k n$ at the fluctuation scale above.
  For $k = 3$, the separate companion #cite(label("ComputableThreeSATThreshold")) Theorem 1.1 proves that the
  limiting threshold $alpha_3$ is a computable real.

=== 1.1 Earlier work and the new estimate <earlier-work-and-the-new-estimate>

The location and the width of a threshold are different questions.
  Friedgut #cite(label("Friedgut")) Theorem 1.3 proved a sharp threshold sequence for each fixed clause size,
  without asserting convergence of that sequence. Achlioptas and Peres #cite(label("AchlioptasPeres"))
  Theorems 1–2 used a weighted second moment to locate the threshold within $O \( k \)$ of $2^k log
  2$ as $k$ grows. Ding, Sly, and Sun #cite(label("DSS")) Theorem 1 proved the predicted limiting threshold for
  all sufficiently large $k$. Carenini’s paper #cite(label("Carenini2026Polynomial")) Corollary 1.2,
  made public on October 5, 2026, establishes the satisfiability conjecture for every fixed $k gt.eq 3$.
  We credit Carenini with priority for the resolution of the satisfiability conjecture.
  The companion #cite(label("FixedKThreshold")) Theorem 1.1 establishes a limiting location for every fixed $k
  gt.eq 3$; its independent forcing argument gives the variance bound $O_k \( n^(1 + 2 \/ k) \)$ for the capped
  last-satisfiable prefix $min \( H_n - 1 \, 2^(k + 1) n \)$ #cite(label("FixedKThreshold")) Proposition 3.3.

For transition width, Wilson #cite(label("Wilson")) Corollary 4 proved an $Omega_k \( sqrt(n) \)$ separation of
  central quantiles in the independent proper-clause model.
  We convert that separation into the variance lower bound,
  keeping the integer endpoints so the argument allows atoms.
  Carenini #cite(label("Carenini")) Corollaries 7.10–7.11 proves an $O_(k \, eta) \( n \/ log n \)$ window upper
  bound for fixed $k gt.eq 3$, including proper independent clauses.
  Her subsequent paper gives the polynomial window bound $O_(k \, eta) \( n^(1 \/ 2 + 1 \/ k) \)$ and the
  hitting-time variance bound $O_k \( n^(1 + 2 \/ k) \)$ #cite(label("Carenini2026Polynomial")) Theorems 1.1
  and 1.3; the window estimate, together with the Abbe–Montanari criterion,
  yields the limiting-threshold theorem credited above. The upper bounds here sharpen these fluctuation estimates.
  For $k = 3$, the companion #cite(label("LinearThreeSATVariance")) further removes the logarithmic loss in this
  paper’s upper bound.

Our upper bound uses the coordinate-omission form of the Efron–Stein inequality #cite(label("EfronStein"))
  #cite(label("BBLM")). Deleting one clause leaves its $k$ variables available for root-flip tests of the
  remaining solutions. When no other clause meets two of these variables,
  the $k$ tests are independent and use clauses of length $k - 1$; we account separately for such collisions.
  A set of assignments that is easily killed by those shorter clauses must also have a short expected lifetime
  under $k$-clauses. The replacement of a shorter constraint by a block of native clauses has a qualitative
  predecessor in Friedgut’s half-cube argument #cite(label("Friedgut")) Lemma 5.7;
  sequential conditioning on a residual assignment set is developed in Carenini #cite(label("Carenini"))
  Theorem 4.3 and Lemma 6.1. We prove a block estimate uniform in the number of variables and the block length.
  It also covers assignment sets that no single $k$-clause can kill.

The main improvement comes after this replacement step. Instead of bounding the number of clauses incident to the
  deleted clause’s variables by a logarithmic cutoff, we retain that number as a random parameter.
  Its fixed moments are bounded. The proof must therefore use the incidence count without destroying the
  independence of the shorter-clause tests or of future ordinary clauses.
  Conditioning on the incidence pattern through the cap achieves both.
  Collisions involving two of the deleted clause’s variables are paid for by joint incidence and collision moments.

=== 1.2 The route through the upper bound <the-route-through-the-upper-bound>

Write $L = floor.l B n floor.r$. If deleting $C_i$ while preserving the other clause indices delays the capped
  first failure by $D_i$, then

$ "Var" \( T_(n \, B) \) lt.eq sum_(i = 1)^L bb(E) D_i^2 . $

The delay $D_i$ counts the prefixes at which restoring $C_i$ destroys satisfiability,
  so $D_i^2$ counts ordered pairs of such prefixes. The problem is to control this occupation time.

Here is the shorter-clause estimate used for that purpose.
  A collection of clauses #emph[kills] $S subset.eq { 0 \, 1 }^u$ if no member of $S$ satisfies every clause.
  Let $q_d \( S \)$ be the probability that $d$ independent proper $\( k - 1 \)$-clauses kill $S$,
  and let $tau_k \( S \)$ be the expected number of independent proper $k$-clauses through its first kill.
  For $u gt.eq k$, $d gt.eq 1$, and $beta = k \/ \( k - 1 \)$, we prove in Section 2 that

$ tau_k \( S \) q_d \( S \)^beta lt.eq C_k d^beta . $

This estimate holds for every assignment set, with no lower cutoff on $q_d \( S \)$.

Section 3 connects this statement to clause deletion. Call the variables of $C_i$ its roots,
  and fix them to the unique values that falsify $C_i$. Let $S_m$ be the nonroot parts of solutions of the prefix
  with $C_i$ omitted and the roots fixed this way. A clause disjoint from the roots is an ordinary $k$-clause on
  the nonroots. A clause meeting one root and satisfied by that root hides a $\( k - 1 \)$-clause:
  its nonroot part becomes a constraint when that root is flipped.
  If restoring $C_i$ destroys satisfiability, each allowed root flip must fail.
  In the absence of collisions this gives $k$ independent tests killing $S_m$.

Conditional on the exposed incidence pattern, let $Z$ be the number of clauses meeting the roots and put $d =
  max { 1 \, Z }$. The lifetime estimate bounds both the expected remaining duration of a deletion event and the
  total time spent at levels $q_d \( S_m \) gt.eq a$. Write $q = q_d \( S_m \)$.
  The $k$ independent tests contribute $q^k$, while the expected remaining duration costs a factor $q^(- beta)$.
  Integrating the resulting $q^(k - beta)$ over time costs a second lifetime factor:
  the expected occupation above level $a$ is bounded by a constant times $a^(- beta)$.
  The near-zero part of the resulting integral is therefore

$ integral a^(thin k - 2 beta - 1) thin d a . $

At $k = 3$, $k = 2 beta$ and the finite cap produces a logarithm; for $k gt.eq 4$,
  $k > 2 beta$ and the integral is bounded. Section 4 then averages the root counts and proves the capped upper
  bound. Exponential tails remove a sufficiently late cap. Wilson’s quantile bound supplies the separate
  lower-bound argument.

Section 5 removes a sufficiently late cap and records the exact first-unsatisfiable and last-satisfiable endpoint
  identities. Section 6 proves the lower bound, completing the variance theorem.
  Section 7 specializes the cap constants to three clauses and transfers the proper-clause concentration to the
  Poisson clause law used in the threshold companion. After that main argument,
  Appendix 8 determines the limits of the two estimates for arbitrary assignment sets.
  Appendix 9 compares proper-clause models at different sizes,
  and Appendix 10 gives a second three-clause proof based on prefix exposure and incidence truncation.

== 2 Survival of a set of assignments <sec:replacement>

The deletion argument will leave a set of assignments that must pass random tests of length $k - 1$.
  We need to relate the probability that those tests eliminate the set to its lifetime under clauses of length
  $k$. This section proves the relation for every assignment set.
  Replacing a shorter constraint by a block of clauses of the original length has a qualitative predecessor in
  Friedgut’s half-cube argument #cite(label("Friedgut")) Lemma 5.7.

Fix integers $k gt.eq 3$ and $u gt.eq k$, and put

$ r = k - 1 \, wide beta = frac(k, k - 1) . $

A proper $s$-clause, for $1 lt.eq s lt.eq u$, chooses an $s$-element subset of the $u$ variables uniformly and
  then chooses independent fair signs on that subset. Clauses are independent,
  so a whole clause may occur more than once. A collection of clauses #emph[kills] $S subset.eq { 0 \,
  1 }^u$ when no member of $S$ satisfies every clause in the collection. For nonnegative integers $d \, g$, define

$ q_d \( S \) = bb(P) \( d upright(" proper ") r upright("-clauses kill ") S \) \, wide R_g \( S \) =
  bb(P) \( g upright(" proper ") k upright("-clauses kill ") S \) . $

For a nonempty set, $q_0 \( S \) = R_0 \( S \) = 0$. For the empty set these probabilities are one,
  including when there are zero clauses. Let $H_k \( S \)$ be the first killing index in an infinite sequence of
  proper $k$-clauses, counting the killing clause, and put

$ H_k \( diameter \) = 0 \, wide tau_k \( S \) = bb(E) H_k \( S \) . $

These expectations are finite: for every integer $m gt.eq 0$,

#[#set math.equation(numbering: n => "(2.1)")
 $ bb(P) \( H_k \( S \) > m \) lt.eq \| S \| \( 1 - 2^(- k) \)^m lt.eq 2^u exp \( - 2^(- k) m \) . $ <eq:set-survival>]

Indeed, each fixed assignment survives each independent clause with probability $1 - 2^(- k)$,
  and the first inequality is a union bound.

=== 2.1 Replacing one shorter clause <replacing-one-shorter-clause>

For a nonempty set $S$, a coordinate is #emph[frozen] if every member of $S$ has the same value there.
  If $b$ coordinates are frozen, the probability that one proper $s$-clause kills $S$ is

#[#set math.equation(numbering: n => "(2.2)")
 $ h_s \( S \) = frac(\( b \)_s, 2^s \( u \)_s) \, wide 1 lt.eq s lt.eq u \, $ <eq:frozen-killing>]

where $\( a \)_s = a \( a - 1 \) dots.h.c \( a - s + 1 \)$, with value zero for a nonnegative integer $a < s$.
  To kill $S$, every literal of the clause must be false for every assignment in $S$.
  Its variables must therefore be frozen, and each sign must oppose their common values.
  This characterizes the killing clauses and proves the formula.

Write $h = h_r \( S \)$. Then $0 lt.eq h lt.eq 2^(- r) lt.eq 1 \/ 4$. If $b gt.eq k$,

#[#set math.equation(numbering: n => "(2.3)")
 $ h_k \( S \) = h frac(b - r, 2 \( u - r \)) gt.eq 1 / k h^beta . $ <eq:frozen-power>]

In fact $b - r gt.eq b \/ k$, $u - r lt.eq u$, and

$ h = 1 / 2^r product_(j = 0)^(r - 1) frac(b - j, u - j) lt.eq (frac(b, 2 u))^r . $

Substituting these bounds into the equality proves (2.3). Its hypothesis matters.
  For the cylinder whose first $r$ coordinates are fixed to zero,

#[#set math.equation(numbering: n => "(2.4)")
 $ h_k \( S \) = 0 \, wide h_r \( S \) = frac(1, 2^r binom(u, r)) > 0 . $ <eq:frozen-exception>]

No single $k$-clause kills this set. A sufficiently long block can still do so through the joint effect of its clauses.

#thm([Lemma 2.1.])[
  (One-clause replacement).  #emph[For an integer $k gt.eq 3$, let
$ K_k = #scale(x: 120%, y: 120%)[\(] 2^k \( k - 1 \) #scale(x: 120%, y: 120%)[\)]^(k - 1) . $

 For every integer $u gt.eq k$, every $S subset.eq { 0 \, 1 }^u$, and every integer $g gt.eq 1$,
#[#set math.equation(numbering: n => "(2.5)")
 $ R_g \( S \) gt.eq q_1 \( S \) - K_k g^(- \( k - 1 \)) . $ <eq:one-replacement>]

]
] <lem:one-replacement>

#proof[
  For $S = diameter$, both probabilities are one. Suppose $S$ is nonempty and retain $b \, r \, h$ above.
    A block kills $S$ if any one of its clauses does. Independence gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ R_g \( S \) gt.eq 1 - \( 1 - h_k \( S \) \)^g gt.eq 1 - e^(- g h_k \( S \)) . $ <eq:individual-block-bound>]
  First assume $b gt.eq k$. If $\( g \/ k \) h^(1 \/ r) gt.eq 2$, then (2.3) gives $g h_k \( S \) gt.eq 2 h$, and
  $ R_g \( S \) gt.eq 1 - e^(- 2 h) gt.eq h . $
  For the last inequality, $1 - e^(- 2 h) - h$ is zero at $h =
    0$ and has nonnegative derivative on $\[ 0 \, 1 \/ 4 \]$. If instead $\( g \/ k \) h^(1 \/ r) < 2$, then
  $ h < \( 2 k \)^r g^(- r) lt.eq K_k g^(- r) \, $
  because $2 k lt.eq 2^k \( k - 1 \)$. Nonnegativity of $R_g \( S \)$ now suffices.
  If $b < r$, then $h = 0$, which also proves the inequality. The only remaining case is $b = r$. Formula (2.2) gives
  $ h = frac(1, 2^r binom(u, r)) lt.eq (frac(r, 2 u))^r . $
  When $g < 2^(k + 1) u$, this is less than $\( 2^k r \/ g \)^r = K_k g^(- r)$.
    When $g gt.eq 2^(k + 1) u$, apply (2.1) to the full cube:
  $ R_g \( S \) gt.eq 1 - exp \( \( log 2 - 2 \) u \) gt.eq 1 - e^(- u) > 1 / 4 gt.eq h . $
  Here $u gt.eq k gt.eq 3$. This last bound uses the whole block and remains valid even though $h_k \( S \) = 0$. ◻
]

=== 2.2 Several tests and the expected lifetime <several-tests-and-the-expected-lifetime>

Replacing tests one at a time requires a bound for arbitrary residual sets:
  conditioning on the other clauses need not leave a set with any special description.
  The sequential conditioning follows the replacement argument of Carenini #cite(label("Carenini")) Theorem 4.3.
  The uniform additive block estimate in Lemma 2 takes the place of the cutoff-dependent comparison of
  single-clause killing probabilities in #cite(label("Carenini")) Lemma 6.1; the exceptional case $b = k -
  1$ above rules out a cutoff-free positive power lower bound for $h_k$ in terms of $h_r$.

#thm([Lemma 2.2.])[
  (Sequential replacement).  #emph[For integers $k gt.eq 3$ and $u gt.eq k$, every $S subset.eq { 0 \, 1 }^u$,
    and all integers $d \, g gt.eq 1$,
#[#set math.equation(numbering: n => "(2.7)")
 $ R_(d g) \( S \) gt.eq q_d \( S \) - d K_k g^(- \( k - 1 \)) . $ <eq:sequential-replacement>]

]
] <lem:sequential-replacement>

#proof[
  Choose independent proper $r$-clauses $Q_1 \, dots.h \, Q_d$ and independent blocks $G_1 \, dots.h \, G_d$,
    each containing $g$ proper $k$-clauses; take all these choices mutually independent.
    Let $p_j$ be the probability that $G_1 \, dots.h \, G_j \, Q_(j + 1) \, dots.h \, Q_d$ kill $S$, for $0 lt.eq
    j lt.eq d$.
  For the replacement at index $j$, condition on $G_1 \, dots.h \, G_(j - 1) \, Q_(j + 1) \, dots.h \, Q_d$,
    and let $S'$ be the members of $S$ satisfying those clauses.
    The omitted $Q_j$ and fresh $G_j$ remain independent with their original laws.
    Their conditional killing probabilities are $q_1 \( S' \)$ and $R_g \( S' \)$.
    Lemma 2 applies also if $S' = diameter$, so $p_j gt.eq p_(j - 1) - K_k g^(- r)$ after averaging.
    Summing from $j = 1$ to $d$, using $p_0 = q_d \( S \)$ and $p_d = R_(d g) \( S \)$, proves the claim. ◻
]

#thm([Proposition 2.3.])[
  (Lifetime from shorter-clause killing).  #emph[For an integer $k gt.eq 3$, put
$ beta = frac(k, k - 1) \, wide K_k = #scale(x: 120%, y: 120%)[\(] 2^k \( k - 1 \)
  #scale(x: 120%, y: 120%)[\)]^(k - 1) \, wide C_k = 4 \( 2 K_k \)^(1 \/ \( k - 1 \)) . $

 For every integer $u gt.eq k$, every $S subset.eq { 0 \, 1 }^u$, and every integer $d gt.eq 1$,
#[#set math.equation(numbering: n => "(2.8)")
 $ tau_k \( S \) q_d \( S \)^beta lt.eq C_k d^beta . $ <eq:lifetime-product>]

 Consequently, for nonempty $S$ and $0 < a lt.eq q_d \( S \)$,
#[#set math.equation(numbering: n => "(2.9)")
 $ tau_k \( S \) lt.eq C_k d^beta a^(- beta) . $ <eq:lifetime-level>]

 There is no upper restriction on $d$ and no positive lower cutoff on $a$.]
] <prop:lifetime>

#proof[
  For the empty set the lifetime is zero. If $S eq.not diameter$ and $q_d \( S \) = 0$,
    the left side of (2.8) is zero, since the lifetime is finite. Otherwise put $q = q_d \( S \) > 0$ and choose
  $ g = ⌈(frac(2 K_k d, q))^(1 \/ \( k - 1 \))⌉ . $
  Sequential replacement gives $R_(d g) \( S \) gt.eq q \/ 2$.
    Split an infinite independent sequence of $k$-clauses into blocks of length $d g$.
    The events that these blocks kill the #emph[original] set $S$ are independent,
    each of probability at least $q \/ 2$. The first successful block has expected index at most $2 \/ q$,
    and the cumulative sequence kills $S$ no later than the end of that block. Hence
  $ tau_k \( S \) lt.eq frac(2 d g, q) . $
  The quantity inside the ceiling is at least one, so $g$ is at most twice that quantity. It follows that
  $ tau_k \( S \) lt.eq 4 \( 2 K_k \)^(1 \/ \( k - 1 \)) (d / q)^(1 + 1 \/ \( k - 1 \)) = C_k d^beta q^(- beta) . $
  This proves the product bound and then the stated level bound. ◻
]

These inequalities also hold conditionally for a set $S$ measurable with respect to an exposed history,
  provided the comparison clauses remain independent of that history.
  Apply the deterministic-set inequality at each realization of $S$.
  In particular, sequential replacement conditions only on other independent clause positions;
  it does not condition the fresh clauses on a satisfiability event.

== 3 Clause omission and root tests <sec:deletion>

We now turn the lifetime estimate into a bound for the effect of deleting one clause.
  Its variables provide tests of the assignments that remain after deletion.
  We expose the incidence pattern through the whole cap, so that the number of tests is known,
  while keeping both their contents and the future ordinary clauses independent.
  The tests bound the probability of a deletion event; the ordinary clauses bound its remaining duration.

Fix an integer $k gt.eq 3$, a real $B > 0$, and $n gt.eq 2 k$.
  Put $L = floor.l B n floor.r$, and for now suppose $L gt.eq 1$.
  Let $C_1 \, C_2 \, dots.h$ be independent uniform proper $k$-clauses on $n$ variables,
  let $H$ be the first unsatisfiable prefix index, and put $T = min { H \, L }$. For $1 lt.eq i lt.eq L$, define

$ B_m^(\( i \)) = and.big_(1 lt.eq j lt.eq m\
j eq.not i) C_j \, wide T^(\( i \)) = min { inf { m gt.eq 0 : B_m^(\( i \)) in.not upright("SAT") } \,
  L #scale(x: 120%, y: 120%)[}] \, wide D_i = T^(\( i \)) - T . $

The infimum is over integers and $inf diameter = oo$. Deleting $C_i$ retains all other clause indices.
  It can only delay unsatisfiability, so $D_i gt.eq 0$; moreover $T^(\( i \))$ depends only on the first $L$
  clauses other than $C_i$.

#thm([Lemma 3.1.])[
  (Coordinate omission).  #emph[For the independent clause process above,
#[#set math.equation(numbering: n => "(3.1)")
 $ "Var" \( T \) lt.eq sum_(i = 1)^L bb(E) D_i^2 . $ <eq:coordinate-omission>]

]
] <lem:coordinate-omission>

#proof[
  This is the coordinate-omission form of the Efron–Stein method #cite(label("EfronStein")),
    recorded in #cite(label("BBLM")) equation (3.6). Here is a direct martingale proof.
    Let $cal(H)_j = sigma \( C_1 \, dots.h \, C_j \)$, with $cal(H)_0$ trivial, and write
  $ M_i = bb(E) \[ T divides cal(H)_i \] - bb(E) \[ T divides cal(H)_(i - 1) \] . $
  Since $T^(\( i \))$ omits the independent coordinate $C_i$, $bb(E) \[ T^(\( i \)) divides cal(H)_i \] =
    bb(E) \[ T^(\( i \)) divides cal(H)_(i - 1) \]$. Thus, with $X_i = T - T^(\( i \))$,
  $ M_i = bb(E) \[ X_i divides cal(H)_i \] - bb(E) \[ X_i divides cal(H)_(i - 1) \] . $
  The tower property gives
  $ bb(E) M_i^2 = bb(E) #scale(x: 120%, y: 120%)[\(] bb(E) \[ X_i divides cal(H)_i \]
    #scale(x: 120%, y: 120%)[\)]^2 - bb(E) #scale(x: 120%, y: 120%)[\(] bb(E) \[ X_i divides cal(H)_(i - 1) \]
    #scale(x: 120%, y: 120%)[\)]^2 lt.eq bb(E) X_i^2 = bb(E) D_i^2 \, $
  where the inequality uses conditional Jensen. The martingale differences are orthogonal and $T$ is
    $cal(H)_L$-measurable, so summing proves the claim. ◻
]

=== 3.1 What the two filtrations reveal <what-the-two-filtrations-reveal>

Fix $i$ and condition on a value of $C_i$. Until the end of Section 4,
  probabilities and expectations refer to this conditional law. The bounds will be uniform in the fixed clause.
  Its set $R$ of $k$ variables will be called the roots, and $t in { 0 \,
  1 }^R$ is their unique assignment falsifying $C_i$. There are $u = n - k gt.eq k$ remaining variables.
  Write $B_m = B_m^(\( i \))$.

For $i lt.eq m < L$, define the deletion event

#[#set math.equation(numbering: n => "(3.2)")
 $ A_m = { B_m in upright("SAT") \, med B_m and C_i in.not upright("SAT") } = { T lt.eq
   m < T^(\( i \)) } . $ <eq:deletion-events>]

On this event every solution of $B_m$ has root values $t$. The two prefix processes agree before $i$, and hence

#[#set math.equation(numbering: n => "(3.3)")
 $ D_i = sum_(m = i)^(L - 1) upright(bold(1))_(A_m) . $ <eq:delay-identity>]

In particular $D_L = 0$: the displayed sum is then empty.
  The upper endpoint is $L - 1$ because both failure times have already been stopped at $L$.

For $i lt.eq m lt.eq L$, define $S_m subset.eq { 0 \, 1 }^u$ to be the nonroot restrictions of solutions of $B_m$
  with root values $t$. The sets are defined on every outcome and decrease with $m$; for $m < L$,
  $A_m$ implies that $S_m$ is nonempty. We need to reveal this set while retaining independent randomness to test
  whether one of its assignments allows a root to be flipped.

The #emph[root type] of a clause records the subset of its variables in $R$ and the signs of their literals.
  A clause is #emph[ordinary] if that subset is empty. It is a #emph[test clause] if the subset contains exactly
  one root and its literal is true at $t$. Let $O$ and $Q$ be the ordinary and test indices among ${ 1 \,
  dots.h \, L } \\ { i }$.

Reveal the root type at every such index through $L$. At indices in ${ 1 \, dots.h \,
  L } \\ \( { i } union O union Q \)$, also reveal the complete signed nonroot part.
  Let $cal(E)$ be the sigma-field generated by this static information. Thus $O \, Q$ and the counts

#[#set math.equation(numbering: n => "(3.4)")
 $ Z & = \# { j lt.eq L : j eq.not i \, med C_j upright(" meets ") R } \,\
V & = \# { j lt.eq L : j eq.not i \, med C_j upright(" meets at least two roots") } \, wide d = max { 1 \,
  Z } $ <eq:global-root-counts>]

are $cal(E)$-measurable. We call a clause counted by $V$ a #emph[collision].
  The ordinary clauses and the nonroot parts of test clauses have not yet been revealed.

#thm([Lemma 3.2.])[
  (Conditional product law).  #emph[Conditional on $cal(E)$,
    the clauses at indices in $O$ are independent uniform proper $k$-clauses on the $u$ nonroots.
    The nonroot parts at indices in $Q$ are independent uniform proper $\( k - 1 \)$-clauses on the nonroots.
    These two collections are mutually independent.]
] <lem:conditional-product>

#proof[
  For a prescribed root type with $h$ roots and prescribed root signs,
    there are exactly $2^(k - h) binom(u, k - h)$ possible signed nonroot parts.
    Since complete proper $k$-clauses are equiprobable, these parts are equiprobable conditional on the type.
    Original clause independence makes this conditional law a product over the indices.
    Once the types are fixed, $O$ and $Q$ are fixed index sets.
    Revealing the parts outside $O union Q$ preserves the product law on the other indices.
    Their residual lengths are $k$ on $O$ and $k - 1$ on $Q$, as asserted. ◻
]

A test clause is already true under $t$, so its nonroot part imposes no condition on $S_m$.
  Consequently $S_m$ is measurable with respect to

$ cal(G)_m = sigma #scale(x: 120%, y: 120%)[\(] cal(E) \, med C_j : j in O \, med j lt.eq
  m #scale(x: 120%, y: 120%)[\)] . $

We will bound the probability of $A_m$ under this filtration, which knows $S_m$ but leaves the test parts hidden.
  To bound the remaining duration on $A_m$, we also need to know whether $A_m$ has occurred.
  For that purpose, enlarge the filtration by revealing the past test parts:

$ cal(F)_m^(*) = sigma #scale(x: 120%, y: 120%)[\(] cal(G)_m \, med upright("nonroot parts of ") C_j : j in Q \,
  med j lt.eq m #scale(x: 120%, y: 120%)[\)] . $

The full baseline prefix $B_m$, and thus $A_m$, is $cal(F)_m^(*)$-measurable.
  Under $cal(G)_m$, the past test parts remain independent with their original conditional laws.
  Under either filtration, the future ordinary clauses remain independent uniform proper $k$-clauses.
  Both assertions follow from Lemma 6. The static information includes future nonordinary data,
  but it includes no future ordinary contents.

=== 3.2 Flipping a root gives an independent test <flipping-a-root-gives-an-independent-test>

Recall that $q_d \( S \)$ is the probability that $d$ independent proper $\( k - 1 \)$-clauses kill $S$.
  Here $d = max { 1 \, Z }$ is already known under $cal(E)$. Put

$ beta = frac(k, k - 1) \, wide q_m = q_d \( S_m \) . $

For $j in R$, let $cal(I)_(j \, m)$ be the test indices through $m$ whose root is $j$,
  and put $s_(j \, m) = \| cal(I)_(j \, m) \|$. Then $s_(j \, m) lt.eq Z lt.eq d$.
  Let $J_m subset.eq R$ consist of roots $j$ for which no collision through $m$ has exactly one root literal true
  under $t$, at root $j$. A collision can exclude at most one root, so

#[#set math.equation(numbering: n => "(3.5)")
 $ \| J_m \| gt.eq k - V . $ <eq:available-root-tests>]

The index sets and counts in this paragraph are $cal(E)$-measurable.

#thm([Lemma 3.3.])[
  (Root-flip tests).  #emph[For $i lt.eq m < L$, on the event ${ \| J_m \| gt.eq 1 }$,
#[#set math.equation(numbering: n => "(3.6)")
 $ bb(P) \( A_m divides cal(G)_m \) lt.eq upright(bold(1))_({ S_m eq.not diameter }) q_m^(\| J_m \|) .
   $ <eq:root-flip-tests>]

]
] <lem:root-flip-tests>

#proof[
  Suppose $A_m$ occurs, and fix $j in J_m$. The nonroot parts at the indices in $cal(I)_(j \, m)$ must kill $S_m$.
    If they did not, choose $x in S_m$ satisfying all of them.
    Extend $x$ by the root assignment $t$, then flip root $j$. We check the clauses of $B_m$.
  A clause with no true root literal under $t$ has a satisfied nonroot part,
    because $\( t \, x \)$ satisfies $B_m$. The flip does not change that part.
    A clause with a true literal on another root remains true.
    Every remaining clause has $j$ as its unique true root under $t$.
    It cannot be a collision, by $j in J_m$, so it is a test clause at an index in $cal(I)_(j \, m)$;
    its nonroot part is satisfied by the choice of $x$. The flipped assignment therefore satisfies $B_m$ with root
    values different from $t$, contradicting $A_m$.
  Conditional on $cal(G)_m$, the test parts belonging to distinct roots are disjoint independent families of
    proper $\( k - 1 \)$-clauses. For nonempty $S_m$, a family of $s_(j \, m) lt.eq
    d$ tests kills it with probability $q_(s_(j \, m)) \( S_m \) lt.eq q_d \( S_m \)$.
    This also covers $s_(j \, m) = 0$, whose killing probability is zero.
    The necessary tests for all roots in $J_m$ thus have conditional probability at most $q_m^(\| J_m \|)$.
    Finally $A_m$ requires $S_m eq.not diameter$. ◻
]

The proof has kept the actual incidence count $d$, rather than discarding environments where it exceeds a chosen
  cutoff. We next bound duration with that same parameter; its moments will be averaged only after all conditional
  estimates have been proved.

=== 3.3 From ordinary clauses to chronological duration <from-ordinary-clauses-to-chronological-duration>

For this comparison, keep the actual schedule and ordinary clauses through $L$.
  At every index after $L$, append an auxiliary independent uniform proper $k$-clause on the $u$ nonroots.
  The continuation is independent of the entire original process.

For $i lt.eq m < L$ and $S_m eq.not diameter$, let $K_m$ be the number of ordinary clauses strictly after $m$,
  including the first one that completes the killing of the original set $S_m$. Use the continuation if necessary.
  Let $U_m$ be the number of chronological indices after $m$ through that killing index.
  Set $K_m = U_m = 0$ if $S_m = diameter$. The conditional product law and the independent continuation give

#[#set math.equation(numbering: n => "(3.7)")
 $ bb(E) \[ K_m divides cal(F)_m^(*) \] = bb(E) \[ K_m divides cal(G)_m \] =
   tau_k \( S_m \) . $ <eq:ordinary-future-mean>]

There are at most $Z$ nonordinary indices between $m$ and the kill:
  every one occurs before or at $L$, and the deleted index $i$ is not after $m$. Thus, pathwise,

#[#set math.equation(numbering: n => "(3.8)")
 $ U_m lt.eq K_m + Z \, wide bb(E) \[ U_m divides cal(F)_m^(*) \] lt.eq tau_k \( S_m \) + Z \, wide
   bb(E) \[ U_m divides cal(G)_m \] lt.eq tau_k \( S_m \) + Z . $ <eq:chronological-domination>]

The continuation makes these statements valid even when no pre-cap ordinary clause completes the kill.

#thm([Lemma 3.4.])[
  (Weighted deletion delay).  #emph[Let
$ W_m = min { L \, tau_k \( S_m \) + Z } . $

 This is $cal(G)_m$-measurable. For $i lt.eq m < L$, on $A_m$,
#[#set math.equation(numbering: n => "(3.9)")
 $ bb(E) [sum_(ell = m + 1)^(L - 1) upright(bold(1))_(A_ell) thin mid(bar.v) thin cal(F)_m^(*)] lt.eq
   W_m . $ <eq:future-deletion-delay>]

 Consequently
#[#set math.equation(numbering: n => "(3.10)")
 $ bb(E) \[ D_i^2 divides cal(E) \] lt.eq 3 sum_(m = i)^(L - 1)
   bb(E) \[ upright(bold(1))_(A_m) W_m divides cal(E) \] . $ <eq:conditional-weighted-delay>]

]
] <lem:weighted-delay>

#proof[
  On $A_m$, every later solution of $B_ell$ must have root values $t$ and a nonroot restriction in $S_m$.
    Once the future ordinary clauses kill that original set, there can be no such solution,
    including at the killing index. If the kill is after $L$, the remaining capped interval ends first.
    In either case the number of later deletion events is at most $U_m$, and is also at most $L$.
    Taking conditional expectations and using (3.8) gives (3.9).
  On $A_m$, the set $S_m$ is nonempty and therefore needs at least one ordinary clause to be killed.
    Hence $tau_k \( S_m \) gt.eq 1$ and $W_m gt.eq 1$. Expand the square of (3.3).
    For each cross term condition on the earlier $cal(F)_m^(*)$; it contains $A_m$. The tower property gives
  $ bb(E) \[ D_i^2 divides cal(E) \] & = sum_(m = i)^(L - 1) bb(E) \[ upright(bold(1))_(A_m) divides cal(E) \]\
 & quad +
   2 sum_(m = i)^(L - 1) bb(E)
   [upright(bold(1))_(A_m) bb(E) [sum_(ell = m + 1)^(L - 1) upright(bold(1))_(A_ell) thin mid(bar.v) thin
   cal(F)_m^(*)] thin mid(bar.v) thin cal(E)]\
 & lt.eq sum_(m = i)^(L - 1) bb(E) \[ upright(bold(1))_(A_m) \( 1 + 2 W_m \) divides cal(E) \]\
 & lt.eq 3 sum_(m = i)^(L - 1) bb(E) \[ upright(bold(1))_(A_m) W_m divides cal(E) \] . $
  ◻
]

Both the root-test probability and the remaining duration are now controlled by the same set $S_m$.
  We still have to bound how long that set can spend at each level of $q_d \( S_m \)$,
  and then average the incidence counts.

== 4 Occupation and incidence moments <sec:occupation>

Keep the deleted index $i$, its fixed clause $C_i$, and the environment $cal(E)$ of Section 3.
  We first bound the time spent at each level of the shorter-clause killing probability $q_m = q_d \( S_m \)$.
  We then combine that occupation bound with the root tests and average the incidence counts.

In this section $C_k$ denotes a positive constant depending only on the fixed $k$,
  which may increase between occurrences. It need not equal the explicit constant in Proposition 4.
  Recall $beta = k \/ \( k - 1 \)$, $d = max { 1 \, Z }$, and $W_m = min { L \, tau_k \( S_m \) + Z }$.
  On $S_m eq.not diameter$,

#[#set math.equation(numbering: n => "(4.1)")
 $ W_m q_m^beta lt.eq C_k d^beta . $ <eq:weighted-lifetime-product>]

Indeed, Proposition 4 bounds $tau_k \( S_m \) q_m^beta$ by a constant times $d^beta$, and

$ Z q_m^beta lt.eq Z lt.eq d lt.eq d^beta . $

The product bound remains valid when $q_m = 0$.

=== 4.1 Time spent above a level <time-spent-above-a-level>

#thm([Lemma 4.1.])[
  (Conditional occupation).  #emph[There is a constant $C_k gt.eq 1$, independent of the environment,
    such that for every $0 < a lt.eq 1$, almost surely,
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(m = i)^(L - 1) bb(P) \( S_m eq.not diameter \, med q_m gt.eq a divides cal(E) \) lt.eq min { L \,
   C_k d^beta a^(- beta) } . $ <eq:conditional-occupation>]

]
] <lem:conditional-occupation>

#proof[
  Define
  $ N_a = sum_(m = i)^(L - 1) upright(bold(1))_({ S_m eq.not diameter \, med q_m gt.eq a }) \, $
  and let $sigma_a$ be the first index counted by $N_a$, or $oo$ if there is none.
    Because $d$ is known in $cal(E)$ and $S_m$ is $cal(G)_m$-measurable, ${ sigma_a = m } in cal(G)_m$.
  On ${ sigma_a = m }$, no eligible index precedes $m$. The future ordinary clauses used to define $U_m$ kill the
    original $S_m$ at index $m + U_m$. If that index is at most $L$, then $S_ell$ is empty there and thereafter:
    a member would have to lie in $S_m$ and satisfy those same ordinary clauses.
    The eligible indices are therefore among $m \, dots.h \, m + U_m - 1$.
    If the kill is after $L$, the capped interval ends earlier. Thus in both cases
  $ N_a lt.eq U_m quad upright("on ") { sigma_a = m } . $
  The first eligible index is included in these $U_m$ possible indices.
  On ${ sigma_a = m }$, the lifetime bound and (3.8) give
  $ bb(E) \[ U_m divides cal(G)_m \] lt.eq tau_k \( S_m \) + Z lt.eq C_k d^beta a^(- beta) \, $
  after increasing $C_k$, since $q_m gt.eq a$ and $Z lt.eq d lt.eq d^beta a^(- beta)$.
    The first-visit events are disjoint, so the tower property yields
  $ bb(E) \[ N_a divides cal(E) \] & lt.eq sum_(m = i)^(L - 1) bb(E)
    [upright(bold(1))_({ sigma_a = m }) bb(E) \[ U_m divides cal(G)_m \] divides cal(E)]\
 & lt.eq C_k d^beta a^(- beta) sum_(m = i)^(L - 1) bb(P) \( sigma_a = m divides cal(E) \) lt.eq
   C_k d^beta a^(- beta) . $
  Also $N_a lt.eq L$. These two bounds prove the claim. ◻
]

Only the first visit to the level is stopped on. All later eligible indices are charged to the remaining lifetime
  of the same nested set. This is why the argument needs fresh future ordinary contents under $cal(G)_m$,
  even though $cal(E)$ has already exposed future nonordinary data.

To apply the occupation bound to the squared deletion delay, first consider an environment with $V = 0$.
  All $k$ root tests are then available. Lemma 7 supplies the factor $q_m^k$ in the weighted-delay bound (3.10).
  On a nonempty $S_m$, (4.1) gives

$ W_m q_m^k = \( W_m q_m^beta \) q_m^(k - beta) lt.eq C_k d^beta q_m^(k - beta) . $

The remaining occupation sum has exponent

$ gamma = k - beta = frac(k \( k - 2 \), k - 1) . $

The lifetime estimate has controlled the remaining deletion duration;
  Lemma 9 contributes a second lifetime factor $a^(- beta)$ by bounding the time spent above level $a$.
  The resulting layer-cake integral contains $a^(gamma - beta - 1)$.
  Its integrability at zero is determined by $gamma - beta = k \( k - 3 \) \/ \( k - 1 \)$,
  which is zero exactly at $k = 3$.

#thm([Lemma 4.2.])[
  (Integrated occupation).  #emph[For $L gt.eq 1$, almost surely and with a constant independent of the environment,
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(m = i)^(L - 1) bb(E) \[ upright(bold(1))_({ S_m eq.not diameter }) q_m^gamma divides cal(E) \] lt.eq
   cases(delim: "{", C_k d^beta \( 1 + log L \) \, & k = 3 \,, C_k d^beta \, & k gt.eq 4 .)
   $ <eq:integrated-occupation>]

]
] <lem:integrated-occupation>

#proof[
  Since $0 lt.eq q_m lt.eq 1$, the layer-cake identity and Lemma 9 give
  #[#set math.equation(numbering: n => "(4.4)")
   $ & sum_(m = i)^(L - 1) bb(E) \[ upright(bold(1))_({ S_m eq.not diameter }) q_m^gamma divides cal(E) \]\
 & quad = integral_0^1 gamma a^(gamma - 1) sum_(m = i)^(L - 1)
   bb(P) \( S_m eq.not diameter \, med q_m gt.eq a divides cal(E) \) thin d a\
 & quad lt.eq integral_0^1 gamma a^(gamma - 1) min { L \, A a^(- beta) } thin d a \, wide A = C_k d^beta gt.eq
   1 . $ <eq:occupation-integral>]
  The terms are nonnegative, so the interchange of conditional expectation, the finite sum, and integration is valid.
  For $k gt.eq 4$, $gamma > beta$. Bounding the minimum by $A a^(- beta)$ gives
  $ integral_0^1 gamma a^(gamma - 1) min { L \, A a^(- beta) } thin d a lt.eq frac(gamma A, gamma - beta) . $
  This is a constant times $A$ for fixed $k$.
  For $k = 3$, $gamma = beta = 3 \/ 2$. If $A gt.eq L$, the integral is at most $L lt.eq A$.
    If $A < L$, split at $a_(*) = \( A \/ L \)^(1 \/ beta)$. The lower part equals $L a_(*)^beta = A$; the upper part is
  $ beta A integral_(a_(*))^1 frac(d a, a) = A log \( L \/ A \) . $
  Thus the integral is at most $A \[ 1 + log_(+) \( L \/ A \) \] lt.eq A \( 1 + log L \)$, where $log_(+) x =
    max { log x \, 0 }$. This proves both cases. ◻
]

=== 4.2 The cost of collisions <the-cost-of-collisions>

The number $V$ of collisions through the whole cap is fixed under $cal(E)$.
  With no collisions all $k$ root tests are available. One collision may remove one test;
  two or more collisions will be handled by the deterministic cap.

#thm([Proposition 4.3.])[
  (Conditional squared delay).  #emph[For $L gt.eq 1$, set
$ h_k \( L \) = cases(delim: "{", 1 + log L \, & k = 3 \,, 1 \, & k gt.eq 4 .) $

 Then, almost surely,
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) \[ D_i^2 divides cal(E) \] lt.eq C_k d^(2 beta) h_k \( L \) upright(bold(1))_({ V = 0 }) +
   C_k L d^beta upright(bold(1))_({ V = 1 }) + L^2 upright(bold(1))_({ V gt.eq 2 }) . $ <eq:conditional-squared-delay>]

]
] <prop:conditional-squared-delay>

#proof[
  Because $W_m$ is $cal(G)_m$-measurable, the tower property and the root-flip test bound imply,
    for every integer $1 lt.eq j lt.eq k$ on the $cal(E)$-measurable event ${ \| J_m \| gt.eq j }$,
  $ bb(E) \[ upright(bold(1))_(A_m) W_m divides cal(E) \] lt.eq
    bb(E) \[ upright(bold(1))_({ S_m eq.not diameter }) W_m q_m^j divides cal(E) \] . $
  Here we used $q_m lt.eq 1$ if more than $j$ tests are available.
  If $V = 0$, take $j = k$ and use $W_m q_m^k lt.eq C_k d^beta q_m^gamma$ on nonempty sets, as above.
    Substituting in (3.10) and applying integrated occupation gives $C_k d^(2 beta) h_k \( L \)$.
  If $V = 1$, at least $k - 1$ tests are available by (3.5). Since $k - 1 gt.eq beta$ for $k gt.eq 3$,
  $ upright(bold(1))_({ S_m eq.not diameter }) W_m q_m^(k - 1) lt.eq C_k d^beta . $
  Use this bound at each of the at most $L$ indices in (3.10). It gives $C_k L d^beta$.
    Finally, when $V gt.eq 2$, the pathwise bound $0 lt.eq D_i lt.eq L$ gives $D_i^2 lt.eq L^2$.
    This includes environments with no available test. ◻
]

The one-collision contribution contains $d^beta$. Its average therefore needs the joint distribution of incidences
  and collisions, not just an upper bound on the probability of a collision.

=== 4.3 Joint moments of incidences and collisions <joint-moments-of-incidences-and-collisions>

#thm([Lemma 4.4.])[
  (Weighted root counts).  #emph[Fix integers $k gt.eq 3$ and $n gt.eq 2 k$, a real $B > 0$,
    and a set of $k$ roots. Take $M$ independent uniform proper $k$-clauses on $n$ variables,
    where $M$ is a nonnegative integer with $M lt.eq B n$. Let $Z$ count clauses meeting a root,
    $V$ count clauses meeting at least two roots, and $d = max { 1 \, Z }$. For every fixed real $p gt.eq 0$,
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) d^p lt.eq C_(k \, B \, p) . $ <eq:incidence-moments>]

 For every fixed positive integer $r$,
#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) \[ d^p upright(bold(1))_({ V gt.eq r }) \] lt.eq C_(k \, B \, p \, r) n^(- r) .
   $ <eq:weighted-collision-moments>]

]
] <lem:weighted-root-counts>

#proof[
  For one clause, let $I$ indicate meeting a root and let $J$ indicate meeting at least two.
    Write $p_1 = bb(P) \( I = 1 \)$ and $p_2 = bb(P) \( J = 1 \)$. Union bounds over roots and pairs of roots give
  #[#set math.equation(numbering: n => "(4.8)")
   $ p_1 lt.eq k^2 / n \, wide p_2 lt.eq binom(k, 2) frac(k \( k - 1 \), n \( n - 1 \)) lt.eq
     frac(k^2 \( k - 1 \)^2, n^2) . $ <eq:one-trial-root-counts>]
  Thus $Z tilde.op "Bin" \( M \, p_1 \)$, and
  $ bb(E) e^Z = \( 1 + p_1 \( e - 1 \) \)^M lt.eq exp \( B k^2 \( e - 1 \) \) . $
  For $K_p = sup_(x gt.eq 0) max { 1 \, x }^p e^(- x) < oo$, we have $d^p lt.eq K_p e^Z$. This proves (4.6).
  For the collision bound, retain the dependence between $Z$ and $V$.
    Write $\( a \)_r = a \( a - 1 \) dots.h.c \( a - r + 1 \)$.
    For every nonnegative function $f$ on the nonnegative integers and $1 lt.eq r lt.eq M$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ bb(E) \[ f \( Z \) \( V \)_r \] = \( M \)_r p_2^r thin bb(E) f \( r + X \) \, wide
     X tilde.op "Bin" \( M - r \, p_1 \) . $ <eq:joint-factorial-identity>]
  To prove the identity, expand $\( V \)_r$ over ordered $r$-tuples of distinct clause indices.
    A collision at each chosen index has probability $p_2^r$ and forces its incidence indicator to be one.
    The remaining $M - r$ incidence indicators retain their independent Bernoulli laws with parameter $p_1$.
    Each ordered tuple has the same expectation, giving the formula.
  Since $upright(bold(1))_({ V gt.eq r }) lt.eq \( V \)_r \/ r !$, use $f \( x \) = max { 1 \, x }^p$ in (4.9):
  $ bb(E) \[ d^p upright(bold(1))_({ V gt.eq r }) \] & lt.eq frac(\( M \)_r p_2^r, r !) thin bb(E) max { 1 \, r + X }^p\
 & lt.eq frac(\( M \)_r p_2^r, r !) thin K_p e^r exp \( B k^2 \( e - 1 \) \) lt.eq C_(k \, B \, p \, r) n^(- r) . $
  The last inequality uses $M lt.eq B n$ and (4.8). If $r > M$, the left side is zero.
    The same definitions cover $M = 0$ and $p = 0$. ◻
]

These moments are taken with the deleted clause fixed and the other clauses still random.
  Once $cal(E)$ is fixed, $Z$ and $V$ are known; their rarity returns only when we average over $cal(E)$.

=== 4.4 Completing the capped upper bound <completing-the-capped-upper-bound>

#proof[
  Suppose first that $n gt.eq 2 k$ and $L gt.eq 1$, and keep $C_i$ fixed.
    The remaining $L - 1 lt.eq B n$ clauses satisfy Lemma 12.
    Averaging (4.5) over $cal(E)$, and using the lemma with $p =
    2 beta$ in (4.6) and $\( p \, r \) = \( beta \, 1 \) \, \( 0 \, 2 \)$ in (4.7), gives
  $ bb(E) \[ D_i^2 divides C_i \] & lt.eq C_k h_k \( L \) bb(E) \[ d^(2 beta) divides C_i \] +
    C_k L bb(E) \[ d^beta upright(bold(1))_({ V = 1 }) divides C_i \] + L^2 bb(P) \( V gt.eq 2 divides C_i \)\
 & lt.eq C_(k \, B) h_k \( L \) + C_(k \, B) L n^(- 1) + C_(k \, B) L^2 n^(- 2)\
 & lt.eq C_(k \, B) h_k \( L \) . $
  The constants are uniform in $i$ and in the value of $C_i$. Remove this conditioning and use coordinate omission:
  $ "Var" \( T \) lt.eq sum_(i = 1)^L bb(E) D_i^2 lt.eq C_(k \, B) L h_k \( L \) . $
  Since $L lt.eq B n$, this is at most
  $ C_(k \, B) n ell_k \( n \) \, wide ell_k \( n \) =
    cases(delim: "{", log \( e n \) \, & k = 3 \,, 1 \, & k gt.eq 4 .) $
  For $k = 3$, we used $1 + log L lt.eq C_B log \( e n \)$ when $L gt.eq 1$.
    If $L = 0$, the capped variable is identically zero. The finitely many remaining sizes $k lt.eq
    n < 2 k$ are covered by increasing the constant, since $0 lt.eq T lt.eq floor.l B n floor.r$.
    This proves the upper bound for every fixed positive $B$ and every $n gt.eq k$. ◻
]

== 5 Caps, uncapped times, and finite-size means <sec:interfaces>

The capped upper bound uses only finitely many clause coordinates.
  We now choose a sufficiently late cap and remove it, compare the first-unsatisfiable and last-satisfiable
  conventions with their exact endpoint corrections, and identify the limiting normalized means.
  The lower estimate, which requires a different input, is proved in Section 6.

=== 5.1 Exact cap comparisons <exact-cap-comparisons>

Fix $k gt.eq 3$, put $q_k = 1 - 2^(- k)$, and write $P_n \( m \) = bb(P) \( H_n > m \)$.
  We also write $F_(n \, m) = F_m$ when displaying the number of variables.
  Each assignment survives $m$ independent proper clauses with probability $q_k^m$.
  The expected number of surviving assignments therefore gives

#[#set math.equation(numbering: n => "(5.1)")
 $ P_n \( m \) lt.eq min { 1 \, 2^n q_k^m } wide \( m in bb(Z)_(gt.eq 0) \) . $ <eq:first-moment-tail>]

In particular, $H_n$ is almost surely finite and has finite moments of every order.
  For integer caps $a gt.eq 1$ and $b gt.eq 0$, define

$ X_a = min { H_n \, a } \, wide V_b = min { H_n - 1 \, b } . $

These have the exact prefix identities

#[#set math.equation(numbering: n => "(5.2)")
 $ P_n \( m \) = bb(P) \( X_a > m \) quad \( 0 lt.eq m < a \) \, wide P_n \( m \) =
   bb(P) \( V_b gt.eq m \) quad \( 0 lt.eq m lt.eq b \) . $ <eq:prefix-conventions>]

All clause counts in these identities are integers.

#thm([Proposition 5.1.])[
  (Finite and infinite cap comparisons).  #emph[For $b gt.eq a$, put $R_(a \, b) = V_b - X_a + 1$ and $D_a = H_n -
    X_a$. Then
#[#set math.equation(numbering: n => "(5.3)")
 $ R_(a \, b) & = sum_(m = a)^b upright(bold(1))_({ H_n > m }) \, & 0 lt.eq
   R_(a \, b) & lt.eq \( b - a + 1 \) upright(bold(1))_({ H_n > a }) \,\
D_a & = \( H_n - a \)_(+) . $ <eq:finite-cap-identity>]

 For either $Z = R_(a \, b)$ or $Z = D_a$, writing $xi_(n \, a) = 2^n q_k^a$,
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) Z lt.eq 2^k xi_(n \, a) \, wide bb(E) Z^2 lt.eq \( 2^(2 k + 1) - 2^k \) xi_(n \, a) . $ <eq:cap-moments>]

 If $X = V_b$ or $X = H_n$, respectively, then
#[#set math.equation(numbering: n => "(5.5)")
 $ 0 lt.eq sqrt("Var" \( X \)) - sqrt("Var" \( X_a \)) & lt.eq 2^k sqrt(1 + q_k) thin xi_(n \, a)^(1 \/ 2) \,\
0 lt.eq "Var" \( X \) - "Var" \( X_a \) & lt.eq #scale(x: 120%, y: 120%)[\[] 2 a thin 2^k + 2^(2 k + 1) -
  2^k #scale(x: 120%, y: 120%)[\]] xi_(n \, a) . $ <eq:cap-sigma>]

 The mean identities are $bb(E) V_b = bb(E) X_a - 1 + bb(E) R_(a \, b)$ and $bb(E) H_n = bb(E) X_a + bb(E) D_a$.]
] <prop:cap-bridge>

#proof[
  The finite identity follows by considering $H_n lt.eq a$ and $H_n > a$; it also gives $R_(a \, b) =
    min { \( H_n - a \)_(+) \, b - a + 1 }$. For every integer $r gt.eq 0$,
  $ bb(P) \( D_a > r \) = P_n \( a + r \) lt.eq xi_(n \, a) q_k^r . $
  The integer tail-sum identities yield
  $ bb(E) D_a & = sum_(r = 0)^oo P_n \( a + r \) lt.eq frac(xi_(n \, a), 1 - q_k) \,\
bb(E) D_a^2 & = sum_(r = 0)^oo \( 2 r + 1 \) P_n \( a + r \) lt.eq frac(1 + q_k, \( 1 - q_k \)^2) xi_(n \, a) . $
  For $R_(a \, b)$ the same sums end at $r = b - a$, so the bounds also apply. Since $X_a Z = a Z$ for either remainder,
  $ "Cov" \( X_a \, Z \) = \( a - bb(E) X_a \) bb(E) Z gt.eq 0 . $
  The constant shift in the finite-cap identity does not affect variance. Thus
  $ "Var" \( X \) - "Var" \( X_a \) = 2 \( a - bb(E) X_a \) bb(E) Z + "Var" \( Z \) gt.eq 0 . $
  Using (5.4) proves (5.5). The triangle inequality for centered variables in $L^2$ gives
  $ \| sqrt("Var" \( X \)) - sqrt("Var" \( X_a \)) #scale(x: 120%, y: 120%)[\|] lt.eq sqrt("Var" \( Z \)) lt.eq
    sqrt(bb(E) Z^2) \, $
  which proves (5.5). ◻
]

Recall the first-moment cap density

#[#set math.equation(numbering: n => "(5.6)")
 $ U_k = frac(log 2, - log q_k) . $ <eq:sufficient-cap>]

For any fixed $B > U_k$, let $rho_(k \, B) = 2 q_k^B < 1$. The cap $a = floor.l B n floor.r$ satisfies

#[#set math.equation(numbering: n => "(5.7)")
 $ xi_(n \, a) = q_k^(floor.l B n floor.r - B n) rho_(k \, B)^n lt.eq q_k^(- 1) rho_(k \, B)^n . $ <eq:cap-rounding>]

The factor $q_k^(- 1)$ accounts for the floor; a ceiling cap needs no such factor.
  Equality $B = U_k$ does not give exponential decay by this argument.
  In particular, $B = 2^(k + 1)$ is sufficient for every fixed $k gt.eq 3$.

#thm([Corollary 5.2.])[
  (Uncapped variance and finite-size concentration).  #emph[For independent uniform proper clauses with fixed $k
    gt.eq 3$,
#[#set math.equation(numbering: n => "(5.8)")
 $ "Var" \( H_n \) = cases(delim: "{", O \( n log n \) \, & k = 3 \,, O_k \( n \) \, & k gt.eq 4 .)
   $ <eq:uncapped-variance>]

 The same upper bounds hold for the uncapped last satisfiable index $H_n - 1$ and, for every fixed $B > 0$,
   for $min { H_n - 1 \, floor.l B n floor.r }$. Write $s_k \( n \) = sqrt(n ell_k \( n \))$,
   with $ell_k$ as in the introduction. For each of these statistics, or for $T_(n \, B)$ from Theorem 1,
   there is a constant $C$ (depending on fixed $k$ and, when present, $B$) such that
#[#set math.equation(numbering: n => "(5.9)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] \| X - bb(E) X \| gt.eq t s_k \( n \) #scale(x: 120%, y: 120%)[\)] lt.eq
   C t^(- 2) wide \( t > 0 \) $ <eq:mean-centered-concentration>]

 for all sufficiently large $n$.]
] <cor:uncapped>

#proof[
  Choose a fixed $B > U_k$ and use the capped upper bound of Theorem 1 for $X_a = T_(n \, B)$, $a =
    floor.l B n floor.r$. Equations (5.5) and (5.7) transfer its bound to $H_n$,
    with an additive $O_(k \, B) \( n rho_(k \, B)^n \)$ error. Subtracting one leaves variance unchanged.
    For any real random variable $Y$ with finite variance, any independent copy $Y'$,
    and any $1$-Lipschitz function $f$,
  $ "Var" \( f \( Y \) \) = 1 / 2 bb(E) \( f \( Y \) - f \( Y' \) \)^2 lt.eq 1 / 2 bb(E) \( Y - Y' \)^2 =
    "Var" \( Y \) . $
  Apply this to $f \( y \) = min { y \, floor.l B n floor.r }$ and $Y = H_n - 1$.
    Finally, Chebyshev’s inequality gives (5.9). Increasing the upper-bound constants covers the finitely many
    remaining $n gt.eq k$, since all uncapped moments are finite. ◻
]

The mean correction is more precise than its normalized limiting effect: for $a = floor.l B n floor.r$ with $B > U_k$,

#[#set math.equation(numbering: n => "(5.10)")
 $ 0 lt.eq frac(bb(E) H_n - bb(E) T_(n \, B), n) lt.eq frac(2^k q_k^(- 1), n) rho_(k \, B)^n .
   $ <eq:normalized-mean-bridge>]

Theorem 1.1 of #cite(label("FixedKThreshold")) gives a unique positive finite threshold $alpha_k$ in exactly this
  proper-clause model. It also implies

#[#set math.equation(numbering: n => "(5.11)")
 $ frac(bb(E) H_n, n) arrow.r alpha_k \, wide frac(bb(E) T_(n \, B), n) arrow.r
   alpha_k quad \( B > U_k \) . $ <eq:mean-limit>]

Here is the explicit expectation argument. Take $b = 2^(k + 1) n$.
  The theorem and monotonicity imply $min { H_n - 1 \, b } \/ n arrow.r alpha_k$ in probability;
  the first-moment bound implies $alpha_k lt.eq U_k < 2^(k + 1)$.
  The bounded statistic therefore converges in mean. Proposition 13 first compares it with $X_b$, then with $H_n$;
  the errors after the one-index shift are exponentially small. Equation (5.10) handles the remaining caps.
  The same conclusion holds for last-satisfiable caps of density $B > U_k$.
  These limits give no rate for $bb(E) H_n - alpha_k n$ or for the corresponding capped bias.
  The concentration in (5.9) is centered at each finite-size expectation.

== 6 Quantile separation and the variance lower bound <sec:lower-bounds>

The remaining part of Theorem 1 is a linear lower bound. We use a width theorem for the proper-clause model and
  convert it into a second-moment estimate. Keeping the two integer quantiles explicit makes the argument valid
  when the hitting-time law has atoms.

An elementary sparse-prefix estimate will also supply the positive lower bounds on finite-size means in
  Appendices 9 and 10. We record it before turning to the quantile argument.

#thm([Lemma 6.1.])[
  (A sparse satisfiable prefix).  #emph[For every real $0 < c < e^(- 2)$, every integer $k gt.eq 3$,
    and every $n gt.eq k$, put $j = floor.l c n floor.r$. In the independent proper-clause model,
#[#set math.equation(numbering: n => "(6.1)")
 $ 1 - P_n \( j \) lt.eq frac(e c, n^2) sum_(t = 1)^oo t^2 \( e^2 c \)^t =
   O_c \( n^(- 2) \) . $ <eq:sparse-satisfiability>]

]
] <lem:sparse-satisfiability>

#proof[
  Form the bipartite incidence graph between the $j$ clause positions and the $n$ variables.
    A matching covering all clause positions supplies a satisfying assignment:
    set each matched variable to satisfy its literal in the clause matched to it.
    This criterion and the deficient-set union bound below appear in Franco and Van
    Gelder #cite(label("FrancoVanGelder2003")) Section 8. By Hall’s theorem #cite(label("Hall1935")) Theorem 1,
    failure of such a matching implies that some set of $t$ variables contains at least $t + 1$ whole clauses.
    A proper $k$-clause lies in a specified $t$-set with probability $\( t \)_k \/ \( n \)_k
    lt.eq \( t \/ n \)^k$, interpreted as zero when $t < k$. Thus, using $k gt.eq 3$, $j lt.eq c n$,
    and $binom(a, b) lt.eq \( e a \/ b \)^b$,
  $ 1 - P_n \( j \) & lt.eq sum_(1 lt.eq t lt.eq n\
t + 1 lt.eq j) binom(n, t) binom(j, t + 1) \( t \/ n \)^(k \( t + 1 \))\
 & lt.eq sum_(t = 1)^n e c \( e^2 c \)^t \( t \/ n \)^(t + 2) lt.eq frac(e c, n^2) sum_(t = 1)^oo t^2 \( e^2 c \)^t . $
  The final series is finite because $e^2 c < 1$. ◻
]

Wilson’s Corollary 4 #cite(label("Wilson")) applies to independent uniform proper $k$-clauses sampled with
  replacement. At the fixed probability levels $3 \/ 4$ and $1 \/ 4$, its assertion for every fixed $k gt.eq
  3$ gives constants $d_k > 0$ and $n_k$ such that, for $n gt.eq n_k$,

#[#set math.equation(numbering: n => "(6.2)")
 $ P_n \( m_1 \) gt.eq 3 / 4 \, quad P_n \( m_2 \) lt.eq 1 / 4 quad arrow.r.double quad m_2 - m_1 gt.eq
   d_k sqrt(n) $ <eq:wilson-gap>]

The constants may depend on $k$. We spell out the conversion from this quantile-width statement to a variance
  bound, including possible atoms.

#thm([Proposition 6.2.])[
  (Linear variance lower bound).  #emph[Let $L_n$ be positive integer caps of order $O \( n \)$ and suppose
    $P_n \( L_n - 1 \) lt.eq 1 \/ 4$ for all sufficiently large $n$. Then
$ "Var" \( min { H_n \, L_n } \) gt.eq c_k n $

 for all sufficiently large $n$, with $c_k > 0$. In particular, for every fixed $B > U_k$ and every fixed $k gt.eq 4$,
#[#set math.equation(numbering: n => "(6.3)")
 $ "Var" \( H_n \) = Theta_k \( n \) \, wide "Var" \( T_(n \, B) \) = Theta_(k \, B) \( n \) \, wide
   "Var" \( min { H_n - 1 \, floor.l B n floor.r } \) = Theta_(k \, B) \( n \) . $ <eq:sharp-variance>]

 For $k = 3$, the corresponding variances lie between positive constant multiples of $n$ and $n log n$.]
] <prop:variance-lower>

#proof[
  Write $X = min { H_n \, L_n }$ and $G \( j \) = bb(P) \( X lt.eq j \)$. Define the integer quantiles
  $ a = min { j : G \( j \) gt.eq 1 \/ 4 } \, wide b = min { j : G \( j \) gt.eq 3 \/ 4 } . $
  The cap hypothesis gives $b lt.eq L_n - 1$. Thus $a - 1$ and $b$ are below the cap and, by minimality,
  $ P_n \( a - 1 \) = 1 - G \( a - 1 \) > 3 \/ 4 \, wide P_n \( b \) = 1 - G \( b \) lt.eq 1 \/ 4 . $
  Applying (6.2) to the endpoint probabilities above gives $b - a gt.eq d_k sqrt(n) - 1$.
    Minimality of the quantiles also gives
  $ bb(P) \( X lt.eq a \) gt.eq 1 / 4 \, wide bb(P) \( X gt.eq b \) = 1 - G \( b - 1 \) > 1 / 4 . $
  For an independent copy $X'$, each of the disjoint events ${ X lt.eq a \, X' gt.eq b }$ and ${ X' lt.eq a \,
    X gt.eq b }$ has probability at least $1 \/ 16$ once $b > a$. Therefore
  $ "Var" \( X \) = 1 / 2 bb(E) \( X - X' \)^2 gt.eq frac(\( b - a \)^2, 16) gt.eq d_k^2 / 64 n $
  for sufficiently large $n$. If $L_n = floor.l B n floor.r$ and $B > U_k$, then
  $ P_n \( L_n - 1 \) lt.eq q_k^(- 2) rho_(k \, B)^n = o \( 1 \) $
  by (5.1). The capped upper bounds proved above give the matching upper bounds. The exact identity
  $ min { H_n - 1 \, L_n } = min { H_n \, L_n + 1 } - 1 $
  proves the lower bound for last satisfiability, since its required condition is $P_n \( L_n \) lt.eq 1 \/ 4$.
    Finally $"Var" \( H_n \) gt.eq "Var" \( min { H_n \, L_n } \)$ by Proposition 13;
    Corollary 14 supplies the uncapped upper bound. This completes the variance assertions of Theorem 1. ◻
]

== 7 Three-clause cap and Poisson refinements <sec:three-clause-refinements>

At clause size three, the cap identities connect the first-unsatisfiable statistic used in the variance proof to
  the last-satisfiable statistics used in the threshold companion #cite(label("FixedKThreshold")).
  We give their exact constants, then transfer concentration to the companion’s auxiliary Poisson clause law,
  which allows repeated variables within a clause. The Poisson density interval and the cap on the hitting time
  play different roles and can be chosen independently. For $k = 3$, define the three distinct statistics

$ T = min { H_n \, 10 n } \, wide W = min { H_n - 1 \, 10 n } \, wide V = min { H_n - 1 \, 16 n } . $

With $rho = 2 \( 7 \/ 8 \)^10 < 1$, Proposition 13 gives

#[#set math.equation(numbering: n => "(7.1)")
 $ W & = T - 1 + upright(bold(1))_({ F_(n \, 10 n) in upright("SAT") }) \,\
V & = T - 1 + R \, wide 0 lt.eq R lt.eq \( 6 n + 1 \) upright(bold(1))_({ F_(n \, 10 n) in upright("SAT") }) .
  $ <eq:three-same-cap>]

Consequently $0 lt.eq bb(E) V - \( bb(E) T - 1 \) lt.eq \( 6 n + 1 \) rho^n$ and $\| sqrt("Var" \( V \)) -
  sqrt("Var" \( T \)) \| lt.eq \( 6 n + 1 \) rho^(n \/ 2)$. The sharper geometric bounds proved above are

$ bb(E) R lt.eq 8 rho^n \, wide bb(E) R^2 lt.eq 120 rho^n \, wide 0 lt.eq "Var" \( V \) -
  "Var" \( T \) lt.eq \( 160 n + 120 \) rho^n . $

The pathwise inequality $W lt.eq 6 n + 4 n upright(bold(1))_({ H_n > 6 n })$ and the density-six first moment,
  with $sigma = 2 \( 7 \/ 8 \)^6 < 1$, give

#[#set math.equation(numbering: n => "(7.2)")
 $ frac(bb(E) W, n) lt.eq 6 + 4 sigma^n = 6 + o \( 1 \) . $ <eq:three-center-upper>]

The survival-sum bound $bb(E) H_n lt.eq 6 n + 8 sigma^n$ proves the same $6 +
  o \( 1 \)$ upper bound for $T$ and $V$. Their normalized expectations are therefore all at most $7$ for
  sufficiently large $n$.

On the density interval $0 lt.eq c lt.eq 8$, the three-clause Poisson law gives the following explicit transfer
  constants. Let $s_n \( c \)$ be the satisfiability probability for $"Pois" \( c n \)$ clauses,
  where the three variable choices within each clause are independent uniform choices with replacement and the
  signs are independent and fair. Internal repetitions and tautologies are allowed in this auxiliary law.
  The distinct-variable fraction is exactly

$ theta.alt_n = frac(\( n \)_3, n^3) = 1 - 3 / n + 2 / n^2 . $

Poisson thinning gives independent proper and repeated-variable clause collections.
  The proper count $J$ has distribution $"Pois" \( c n theta.alt_n \)$, while the other count has mean

$ c n \( 1 - theta.alt_n \) = c \( 3 - 2 \/ n \) lt.eq 24 wide \( 0 lt.eq c lt.eq 8 \) . $

Requiring no repeated-variable clauses for a lower bound, and deleting them for an upper bound, gives

#[#set math.equation(numbering: n => "(7.3)")
 $ e^(- 24) bb(E) P_n \( J \) lt.eq s_n \( c \) lt.eq bb(E) P_n \( J \) \, wide c n - 24 lt.eq bb(E) J lt.eq
   c n \, wide "Var" \( J \) lt.eq 8 n . $ <eq:three-poisson-sandwich>]

Set $omega_n = bb(E) W \/ n$. The variance upper bound implies, in particular,
  $bb(P) \( \| W - n omega_n \| gt.eq n^(11 \/ 12) \) = O \( n^(- 1 \/ 6) \)$.
  Chebyshev’s inequality for $J$ and (7.3) therefore yield, uniformly for $c in \[ 0 \, 8 \]$,

#[#set math.equation(numbering: n => "(7.4)")
 $ c lt.eq omega_n - 2 n^(- 1 \/ 12) & quad arrow.r.double quad s_n \( c \) gt.eq e^(- 24) \/ 2 \,\
c gt.eq omega_n + 2 n^(- 1 \/ 12) & quad arrow.r.double quad s_n \( c \) =
  O \( n^(- 1 \/ 6) \) . $ <eq:three-poisson-lower>]

Indeed, in the lower case $bb(E) J lt.eq n omega_n - 2 n^(11 \/ 12)$, so $J lt.eq n omega_n -
  n^(11 \/ 12)$ except with probability $O \( n^(- 5 \/ 6) \)$.
  In the upper case $bb(E) J gt.eq n omega_n + 2 n^(11 \/ 12) - 24$,
  and the opposite deviation has the same bound. Apply concentration at the indicated integer counts;
  for counts beyond $10 n$, use monotonicity at $ceil.l n omega_n + n^(11 \/ 12) ceil.r < 10 n$, valid by (7.2).
  These statements use the last-SAT cap $10 n$ and Poisson density ceiling $8$,
  giving the lower constant $e^(- 24) \/ 2$. The general transfer lemma of the threshold companion permits a cap
  density $lambda$ and a separate Poisson density ceiling $D$,
  each above a fixed upper bound for the normalized centers #cite(label("FixedKThreshold")) Lemma 5.3.
  Specializing it to $k = 3$ and $lambda = D = 16$ uses the last-SAT statistic $V$, center $bb(E) V \/ n$,
  and interval $c in \[ 0 \, 16 \]$. In that specialization the repetition bound is $48$ and the lower constant is
  $e^(- 48) \/ 2$.

== 8 Sharpness for arbitrary assignment sets <sec:replacement-sharpness>

For each fixed integer $k gt.eq 3$, two exponents in Section 2 are optimal for estimates uniform over arbitrary
  assignment sets: the power $k \/ \( k - 1 \)$ of the inverse killing probability in the lifetime bound,
  and the power $k - 1$ of the inverse block length in the one-clause replacement error.
  Both examples below use subcubes with many frozen coordinates.
  A common observation identifies when a block of clauses can kill such a subcube.

Write $r = k - 1$. We retain the proper clause law: a proper $s$-clause on $u$ coordinates chooses $s$ distinct
  coordinates uniformly and gives them independent fair signs.
  Different clauses are independent, with repetition of whole clauses allowed.
  Recall that $q_1 \( S \)$ is the probability that one proper $r$-clause kills $S$,
  $R_t \( S \)$ is the probability that $t$ proper $k$-clauses kill $S$, and $tau_k \( S \) = bb(E) H_k \( S \)$.
  For nonempty $S$, $H_k \( S \)$ is the least positive index $t$ for which the first $t$ proper $k$-clauses
  jointly kill $S$; the convention for the empty set is $H_k \( diameter \) = 0$.

For integers $u gt.eq b gt.eq k$, consider the nonempty subcube

$ S_(u \, b) = { x in { 0 \, 1 }^u : x_1 = dots.h.c = x_b = 0 } . $

Its first $b$ coordinates are frozen and the others are free.
  If $h_s \( S_(u \, b) \)$ denotes the probability that one proper $s$-clause kills this subcube,
  the frozen-coordinate formula (2.2) reads

#[#set math.equation(numbering: n => "(8.1)")
 $ h_s \( S_(u \, b) \) = frac(\( b \)_s, 2^s \( u \)_s) quad \( 1 lt.eq s lt.eq u \) \, wide
   q_1 \( S_(u \, b) \) = h_r \( S_(u \, b) \) \, $ <eq:sharp-subcube-probabilities>]

where $\( a \)_s = a \( a - 1 \) dots.h.c \( a - s + 1 \)$. In particular,

#[#set math.equation(numbering: n => "(8.2)")
 $ frac(h_k \( S_(u \, b) \), q_1 \( S_(u \, b) \)) = frac(b - r, 2 \( u - r \)) . $ <eq:sharp-successive-ratio>]

For every integer $t gt.eq 1$, the same subcube satisfies

#[#set math.equation(numbering: n => "(8.3)")
 $ 1 - #scale(x: 120%, y: 120%)[\(] 1 - h_k \( S_(u \, b) \) #scale(x: 120%, y: 120%)[\)]^t lt.eq
   R_t \( S_(u \, b) \) lt.eq t h_k \( S_(u \, b) \) + binom(t, 2) k^2 / u . $ <eq:sharp-subcube-bounds>]

The lower bound records the independent chances that a single clause kills the whole subcube.
  To prove the upper bound, restrict all $t$ clauses to the frozen values.
  Each restricted clause is already true, is the empty false clause, or is a nonempty clause on free coordinates.
  If no restricted clause is empty and false, and no two original clauses share a free coordinate,
  then the remaining nonempty clauses use disjoint sets of variables.
  Choose one literal in each and set it true, then assign the other free coordinates arbitrarily.
  The resulting assignment lies in $S_(u \, b)$ and satisfies the block.
  Thus a block can kill the subcube only if an individually killing clause occurs or a pair of clauses shares a
  free coordinate. For a fixed free coordinate, the probability that both independent proper clauses contain it is
  $\( k \/ u \)^2$. Summing over the $u - b$ free coordinates bounds the probability for a given pair by $k^2 \/
  u$. A union bound over clauses and pairs proves the upper bound in (8.3).

#thm([Proposition 8.1.])[
  (Optimality of the lifetime exponent).  #emph[Fix an integer $k gt.eq 3$, and put $beta = k \/ \( k - 1 \)$.
    For every real $gamma < beta$ and all constants $D \, A > 0$, there exist arbitrarily large integers $u gt.eq
    k$ and nonempty sets $S subset.eq { 0 \, 1 }^u$ such that
$ q_1 \( S \) gt.eq A u^(- \( k - 1 \)) \, wide tau_k \( S \) > D q_1 \( S \)^(- gamma) . $

 Consequently, the killing-probability exponent $beta$ in Proposition 4 cannot be decreased in a bound uniform
   over arbitrary assignment sets, even above any fixed multiple of the scale $u^(- \( k - 1 \))$.]
] <prop:lifetime-sharp>

#proof[
  Let the integer $N gt.eq 2$ tend to infinity, and put
  $ u = N^(2 k + 1) \, wide b = N^(2 k) \, wide S = S_(u \, b) . $
  Since $k$ is fixed and $b \/ u = N^(- 1)$, (8.1) gives
  #[#set math.equation(numbering: n => "(8.4)")
   $ a_N := q_1 \( S \) tilde.op 2^(- r) N^(- r) \, wide h_N :=
     h_k \( S \) tilde.op 2^(- k) N^(- k) . $ <eq:sharp-frozen-probabilities>]
  Choose $t_N = floor.l 1 \/ \( 4 h_N \) floor.r$. This is positive for all sufficiently large $N$, and $t_N =
    Theta_k \( N^k \)$. A set survives the first $t_N$ clauses exactly when $H_k \( S \) > t_N$, so (8.3) yields
  #[#set math.equation(numbering: n => "(8.5)")
   $ bb(P) \( H_k \( S \) > t_N \) = 1 - R_(t_N) \( S \) gt.eq 1 - t_N h_N - binom(t_N, 2) k^2 / u gt.eq 3 / 4 -
     o \( 1 \) . $ <eq:sharp-survival>]
  Here $t_N h_N lt.eq 1 \/ 4$, while $t_N^2 \/ u = O_k \( N^(- 1) \)$. It follows that
  $ tau_k \( S \) gt.eq t_N bb(P) \( H_k \( S \) > t_N \) = Omega_k \( N^k \) . $
  For the reverse bound, let $J$ be the index of the first clause that kills the original set $S$ by itself.
    The cumulative sequence kills $S$ no later than $J$. Since $J$ has the geometric distribution with success
    probability $h_N > 0$,
  $ tau_k \( S \) lt.eq bb(E) J = h_N^(- 1) = O_k \( N^k \) . $
  Thus
  $ tau_k \( S \) = Theta_k \( N^k \) = Theta_k #scale(x: 120%, y: 120%)[\(] a_N^(- beta)
    #scale(x: 120%, y: 120%)[\)] . $
  For each fixed $gamma < beta$, the ratio $tau_k \( S \) \/ a_N^(- gamma)$ tends to infinity, since $k -
    r gamma > 0$. Finally,
  $ a_N u^r tilde.op 2^(- r) N^(2 k r) = 2^(- r) b^r arrow.r oo . $
  For all sufficiently large $N$, the two displayed requirements therefore hold for the prescribed $D$ and $A$.
    The values of $u$ are arbitrarily large. ◻
]

#thm([Proposition 8.2.])[
  (Optimality of the block-error exponent).  #emph[Fix an integer $k gt.eq 3$.
    For integers $g gt.eq 2$, there are nonempty sets $S_g subset.eq { 0 \, 1 }^(u_g)$, with $u_g gt.eq k$, for which
$ q_1 \( S_g \) - R_g \( S_g \) tilde.op 2^(- k) g^(- \( k - 1 \)) wide \( g arrow.r oo \) . $

 In particular, no error $o \( g^(- \( k - 1 \)) \)$, uniform over $u$ and the assignment set,
   can replace the error in Lemma 2.]
] <prop:replacement-sharp>

#proof[
  For every integer $g gt.eq 2$, put
  $ u_g = g^(k + 2) \, wide b_g = g^(k + 1) \, wide S_g = S_(u_g \, b_g) \, $
  and abbreviate $a_g = q_1 \( S_g \)$ and $h_g = h_k \( S_g \)$. Equations (8.1) and (8.2) give
  $ a_g tilde.op 2^(- r) g^(- r) \, wide frac(g h_g, a_g) = frac(g \( b_g - r \), 2 \( u_g - r \)) arrow.r 1 / 2 . $
  The upper bound in (8.3), and the two-term inclusion–exclusion lower bound for the independent individual
    killing events, give
  $ g h_g - binom(g, 2) h_g^2 lt.eq R_g \( S_g \) lt.eq g h_g + binom(g, 2) k^2 / u_g . $
  The collision error is $O_k \( g^(- k) \) = o \( a_g \)$.
    Also $h_g = Theta_k \( g^(- k) \)$, so the inclusion–exclusion error is $O_k \( g^(- 2 \( k - 1 \)) \) =
    o \( a_g \)$. Hence
  $ R_g \( S_g \) = g h_g + o \( a_g \) \, wide q_1 \( S_g \) - R_g \( S_g \) = #scale(x: 120%, y: 120%)[\(] 1 /
    2 + o \( 1 \) #scale(x: 120%, y: 120%)[\)] a_g tilde.op 2^(- k) g^(- r) . $
  This is the stated asymptotic. ◻
]

These constructions delimit estimates uniform over arbitrary assignment sets.
  They leave open stronger lifetime estimates for classes of sets with additional structure,
  and variance arguments using information beyond the killing probability.
  In particular, they do not show that the logarithm in the three-clause variance upper bound is necessary.

== 9 Comparing finite-size centers with proper clauses <sec:direct-comparison>

The variance estimate controls fluctuations at one size. We now compare the corresponding centers at different
  sizes, using proper clauses at every step. The comparison keeps the weights of the two variable blocks;
  this is what makes its error uniform even when one block is much larger than the other.
  Once these probability comparisons are established, the deterministic balanced-comparison lemma of the threshold
  companion turns them into convergence. This gives a second route to convergence from a concentration estimate,
  without using the companion’s limiting-threshold theorem as Section 5 does.
  The theorem below takes concentration as an input, so it also applies to the independent,
  weaker variance proof in Appendix 10.

Interpolation between a system and independent parts appears in the thermodynamic-limit work of Guerra and
  Toninelli #cite(label("GuerraToninelli")) and the diluted-system work of Franz and
  Leone #cite(label("FranzLeone")) and Franz, Leone, and Toninelli #cite(label("FranzLeoneToninelli")).
  Those works concern free energies under their respective model hypotheses;
  they provide methodological context for the size comparison.
  The one-clause interpolation here uses frozen variables, as in the satisfiability interpolation of Bayati,
  Gamarnik, and Tetali #cite(label("BGT")) Section 4, Proposition 2.
  Their clause law samples variable tuples with replacement.
  Here the clauses have distinct variables, so the exact killing probabilities contain falling factorials.
  We control the resulting error locally before summing it over the trials.

=== 9.1 A center theorem with an explicit concentration input <a-center-theorem-with-an-explicit-concentration-input>

For fixed $k gt.eq 3$ and $n gt.eq k$, let $H_n$ be the index of the first unsatisfiable prefix of independent
  uniform proper $k$-clauses on $n$ variables, and write $P_n \( j \) = bb(P) \( H_n > j \)$ for integers $j gt.eq
  0$. Fix a real $B > 0$ and set

$ L_n = floor.l B n floor.r \, wide T_n = min { H_n \, L_n } \, wide mu_n = bb(E) T_n \, wide e_n = mu_n \/ n . $

The endpoint for this first-unsatisfiable convention is strict:

#[#set math.equation(numbering: n => "(9.1)")
 $ P_n \( j \) = bb(P) \( T_n > j \) wide \( 0 lt.eq j < L_n \) . $ <cmp:prefix-endpoint>]

At $j = L_n$, the probability on the right is zero, whereas $P_n \( L_n \)$ need not vanish.
  All statements below use only indices strictly below the cap when applying (9.1).

#thm([Theorem 9.1.])[
  (Proper-clause center comparison from concentration).  #emph[  Fix $k gt.eq 3$, $B > 0$,
    and $0 < delta < 1 \/ 2$. Suppose that there are constants $0 < a lt.eq A < B$ and numbers $eta_n gt.eq
    0$ tending to zero such that, for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(9.2)")
 $ a lt.eq e_n lt.eq A \, wide bb(P) #scale(x: 120%, y: 120%)[\(] \| T_n - mu_n \| gt.eq
   n^(1 - delta) #scale(x: 120%, y: 120%)[\)] lt.eq eta_n . $ <cmp:module-input>]

 Then there is a finite constant $K gt.eq 0$ such that, for all sufficiently large $n = min { n_1 \, n_2 }$,
   with no restriction on $n_1 \/ n_2$,
#[#set math.equation(numbering: n => "(9.3)")
 $ e_(n_1 + n_2) gt.eq min { e_(n_1) \, e_(n_2) } - K n^(- delta) \, $ <cmp:sum>]

 and, for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(9.4)")
 $ e_(n + 1) gt.eq e_n - K n^(- delta) . $ <cmp:neighbor>]

 Moreover $e_n$ converges to a number $alpha in \[ a \, A \]$, and
#[#set math.equation(numbering: n => "(9.5)")
 $ P_n \( floor.l c n floor.r \) arrow.r cases(delim: "{", 1 \, & 0 lt.eq c < alpha \,, 0 \, & c > alpha .)
   $ <cmp:strict-sides>]

 For every sufficiently large $s$ and every $N gt.eq s^2$, one has the one-sided estimate
#[#set math.equation(numbering: n => "(9.6)")
 $ e_N gt.eq e_s - K \( 1 + B_delta \) s^(- delta) \, wide B_delta =
   frac(\( 3 \/ 2 \)^delta, 1 - \( 2 \/ 3 \)^delta) . $ <cmp:tree-bound>]

]
] <thm:proper-center-module>

The theorem allows an arbitrary vanishing concentration error; it does not require a specified polynomial rate.
  In particular, Chebyshev’s inequality supplies (9.2) whenever

#[#set math.equation(numbering: n => "(9.7)")
 $ "Var" \( T_n \) = o #scale(x: 120%, y: 120%)[\(] n^(2 - 2 delta) #scale(x: 120%, y: 120%)[\)] .
   $ <cmp:variance-input>]

The proof uses concentration twice: to make the two local formulas likely to be satisfiable,
  and to turn a likely satisfiable diluted formula back into a lower bound for the center at the combined size.

=== 9.2 Local clauses and diluted global clauses <local-clauses-and-diluted-global-clauses>

#thm([Lemma 9.2.])[
  (Proper-clause trial comparison).  #emph[Partition $N = n_1 + n_2$ variables into blocks of sizes $n_1 \,
    n_2 gt.eq k$, and put $w_j = n_j \/ N$ and $n = min { n_1 \, n_2 }$.
    Fix an integer $M gt.eq 0$ and $0 < epsilon < 1$. Each of $M$ independent local trials chooses block $j$ with
    probability $w_j$ and inserts an independent uniform proper $k$-clause in that block.
    Each of $M$ independent diluted global trials inserts an independent uniform proper $k$-clause on all $N$
    variables with probability $1 - epsilon$, and inserts no clause otherwise.
    Let $Q_(upright("loc"))$ and $Q_(upright("dil"))$ be the respective probabilities that the resulting formulas
    are satisfiable. Then
#[#set math.equation(numbering: n => "(9.8)")
 $ Q_(upright("dil")) & gt.eq Q_(upright("loc")) - C_k M epsilon^(- k) sum_(j = 1)^2 w_j / n_j^k \, & C_k & =
   frac(\[ k \( k - 1 \) \]^k, 2^k) \,\
Q_(upright("dil")) & gt.eq Q_(upright("loc")) - frac(C_k M, epsilon^k n^k) . $ <cmp:weighted-replacement>]

 For $N = n + 1$, if all local trials instead use a fixed main set of $n gt.eq k$ variables, then
#[#set math.equation(numbering: n => "(9.9)")
 $ Q_(upright("dil")) gt.eq Q_(upright("loc")) - frac(D_k M, epsilon^k n^k) \, wide D_k = k^(2 k) /
   2^k . $ <cmp:neighbor-replacement>]

 These statements impose no restriction on a block-size ratio.]
] <cmp:trial-comparison>

#proof[
  Condition on every trial except the one being replaced. If the residual formula is unsatisfiable,
    both conditional satisfiability probabilities are zero. Otherwise let $S$ be its nonempty solution set,
    and call a variable frozen when it has the same value in every member of $S$.
    Among any specified $v gt.eq k$ variables of which $b$ are frozen, a proper $k$-clause kills $S$ with probability
  $ h_k \( b \, v \) = frac(\( b \)_k, 2^k \( v \)_k) . $
  Indeed, each of the selected variables must be frozen and each sign must oppose its frozen value.
    With $x = b \/ v$ and $y_(+) = max { y \, 0 }$,
  #[#set math.equation(numbering: n => "(9.10)")
   $ frac(\( x - \( k - 1 \) \/ v \)_(+)^k, 2^k) lt.eq h_k \( b \, v \) lt.eq x^k / 2^k . $ <cmp:factorial-bounds>]
  For $b gt.eq k$, each factor $\( b - r \) \/ \( v - r \)$, $0 lt.eq r < k$,
    is at most $b \/ v$ and at least $\( b - k + 1 \) \/ v$. For $b < k$,
    both the middle expression and the positive part on the left vanish. This proves the bounds.
  Let $beta_j$ be the frozen fraction in block $j$, always with respect to the entire residual set $S$;
    its defining formula may contain clauses crossing the two blocks.
    By convexity and (9.10), the killing probability of a nondiluted global clause is at most
  $ 2^(- k) (sum_j w_j beta_j)^k lt.eq 2^(- k) sum_j w_j beta_j^k \, $
  whereas the local killing probability is at least $2^(- k) sum_j w_j \( beta_j - \( k - 1 \) \/ n_j \)_(+)^k$.
    If $beta_j gt.eq k \( k - 1 \) \/ \( epsilon n_j \)$, Bernoulli’s inequality gives
  $ \( beta_j - \( k - 1 \) \/ n_j \)_(+)^k gt.eq \( 1 - epsilon \/ k \)^k beta_j^k gt.eq \( 1 - epsilon \) beta_j^k . $
  Below that threshold, $beta_j^k lt.eq \[ k \( k - 1 \) \]^k \/ \( epsilon^k n_j^k \)$.
    It follows that the diluted global killing probability exceeds the local one by at most $C_k epsilon^(- k)
    sum_j w_j \/ n_j^k$. The estimate holds for every residual formula.
    Replacing the trials one at a time, conditioning on all other independent trials at each step,
    and then averaging and telescoping proves (9.8). Since $n_j gt.eq n$ and $w_1 + w_2 = 1$,
    it also proves the coarser bound.
  For neighboring sizes, let $b$ count the frozen variables in the main $n$-set and let $x in { 0 \,
    1 }$ indicate whether the extra variable is frozen. The global frozen fraction
    $gamma = \( b + x \) \/ \( n + 1 \)$ obeys $b \/ n gt.eq gamma - 1 \/ \( n + 1 \)$.
    The local killing probability is therefore at least $2^(- k) \( gamma - k \/ n \)_(+)^k$,
    while the nondiluted global one is at most $2^(- k) gamma^k$.
    Splitting at $gamma = k^2 \/ \( epsilon n \)$ and applying the same Bernoulli inequality bounds the per-trial
    loss by $D_k \/ \( epsilon^k n^k \)$. Telescoping gives (9.9). ◻
]

At $k = 3$ the constants are exactly $C_3 = 27$ and $D_3 = 729 \/ 8$.
  The stronger weighted bound will be used for unequal blocks.
  The coarser bound remains useful when the block sizes are known to be comparable.

=== 9.3 From a random clause count to a center <from-a-random-clause-count-to-a-center>

We first record the integer step needed in both center comparisons.
  From (9.2) and (9.1), for every integer $0 lt.eq j < L_n$ and all sufficiently large $n$,

#[#set math.equation(numbering: n => "(9.11)")
 $ j lt.eq mu_n - n^(1 - delta) & quad arrow.r.double quad P_n \( j \) gt.eq 1 - eta_n \,\
j gt.eq mu_n + n^(1 - delta) & quad arrow.r.double quad P_n \( j \) lt.eq eta_n . $ <cmp:concentration>]

Because $eta_n arrow.r 0$, its tail supremum $overline(eta)_n = sup_(v gt.eq n) eta_v$ also tends to zero.
  This will provide uniformity when one block is arbitrarily larger than the other.

Suppose, for a fixed $a_0 > 0$, that $a_0 N lt.eq M lt.eq A N$, $0 < epsilon lt.eq 1 \/ 2$,
  and $Q_(upright("dil")) gt.eq 1 - zeta$. The number of inserted clauses is $J tilde.op
  "Bin" \( M \, 1 - epsilon \)$. Conditional on $J$, the inserted clauses have exactly the independent
  proper-clause law, so $Q_(upright("dil")) = bb(E) P_N \( J \)$. Put

$ j = ⌊\( 1 - epsilon \) M - N^(1 - delta)⌋ . $

For all sufficiently large $N$, the lower bound on $M$ gives $j gt.eq 0$, and $j lt.eq M lt.eq
  A N < L_N$ because $A < B$. Also $"Var" \( J \) lt.eq A N$, whence

$ bb(P) \( J < j \) lt.eq A N^(- 1 + 2 delta) \, wide Q_(upright("dil")) lt.eq P_N \( j \) + bb(P) \( J < j \) . $

The second inequality uses monotonicity of $P_N$. If $zeta + A N^(- 1 + 2 delta) + eta_N < 1$,
  the upper implication in (9.11) forces $j < mu_N + N^(1 - delta)$. The floor in the definition of $j$ then gives

#[#set math.equation(numbering: n => "(9.12)")
 $ e_N > frac(\( 1 - epsilon \) M, N) - 2 N^(- delta) - N^(- 1) gt.eq frac(\( 1 - epsilon \) M, N) -
   3 N^(- delta) . $ <cmp:count-transfer>]

We will apply this implication with all three errors tending to zero.

#proof[
  For the two-block comparison, put $N = n_1 + n_2$, $n = min { n_1 \, n_2 }$, $e_(*) = min { e_(n_1) \,
    e_(n_2) }$, and choose
  $ epsilon = n^(- delta) \, wide M = ⌊\( e_(*) - 2 epsilon \) N⌋ . $
  For sufficiently large $n$, the anchors imply $\( a \/ 4 \) N lt.eq M lt.eq A N$ and $epsilon lt.eq 1 \/ 2$.
    In the local model let $X_j$ count the clauses in block $j$. Its marginal law is binomial, and
  $ bb(E) X_j = M n_j \/ N lt.eq mu_(n_j) - 2 epsilon n_j lt.eq mu_(n_j) - 2 n_j^(1 - delta) \, wide
    "Var" \( X_j \) lt.eq A n_j . $
  Thus $bb(P) \( X_j > mu_(n_j) - n_j^(1 - delta) \) lt.eq A n_j^(- 1 + 2 delta)$.
    Conditional on the block choices, the clauses inside the two blocks have independent proper laws.
    On the event $X_j lt.eq mu_(n_j) - n_j^(1 - delta)$, the integer count lies below $L_(n_j)$ for large $n_j$,
    because $mu_(n_j) lt.eq A n_j$ and $A < B$. The lower implication in (9.11) and a union bound therefore give
  $ Q_(upright("loc")) gt.eq 1 - sum_(j = 1)^2 #scale(x: 120%, y: 120%)[\(] A n_j^(- 1 + 2 delta) +
    eta_(n_j) #scale(x: 120%, y: 120%)[\)] . $
  The right-hand error is at most $2 A n^(- 1 + 2 delta) + 2 overline(eta)_n$,
    which tends to zero uniformly over all pairs of sizes with minimum $n$.
  The weighted replacement loss has the same uniformity:
  #[#set math.equation(numbering: n => "(9.13)")
   $ C_k M epsilon^(- k) sum_j w_j / n_j^k & = C_k M / N epsilon^(- k) sum_j n_j^(1 - k)\
 & lt.eq 2 A C_k n^(1 - k + k delta) = o \( 1 \) . $ <cmp:uniform-replacement-loss>]
  Here $1 - k + k delta < 0$ for $k gt.eq 3$ and $delta < 1 \/ 2$.
    The factor $N$ has canceled, so no upper bound on $N \/ n$ is used.
    Lemma 20 therefore gives $Q_(upright("dil")) gt.eq 1 - zeta_n$, where $zeta_n arrow.r
    0$ uniformly over these pairs. Since $N gt.eq 2 n$, the count error at size $N$ and $eta_N lt.eq
    overline(eta)_n$ also vanish uniformly. Applying (9.12), and keeping the floor in $M$, yields
  $ e_N gt.eq \( 1 - epsilon \) \( e_(*) - 2 epsilon - N^(- 1) \) - 3 N^(- delta) gt.eq e_(*) - K n^(- delta) \, $
  where the last inequality uses $e_(*) lt.eq A$, $N gt.eq n$, and $delta < 1$.
    This proves (9.3) for arbitrary size ratios.
  For the neighboring comparison take $N = n + 1$, put $epsilon = n^(- delta)$, and let $M = floor.l mu_n -
    2 n^(1 - delta) floor.r$ local trials all use the main $n$ variables.
    Again $\( a \/ 4 \) N lt.eq M lt.eq A N$ for sufficiently large $n$.
    The local formula has exactly the law at size $n$ and count $M$, so $Q_(upright("loc")) gt.eq 1 -
    eta_n$ by (9.11). The neighboring replacement loss is
  $ frac(D_k M, epsilon^k n^k) = O_(k \, A) \( n^(1 - k + k delta) \) = o \( 1 \) . $
  Equation (9.12) now gives
  $ e_(n + 1) gt.eq \( 1 - epsilon \) frac(n e_n - 2 n^(1 - delta) - 1, n + 1) - 3 \( n + 1 \)^(- delta) gt.eq
    e_n - K n^(- delta) . $
  For the last step, use $e_n lt.eq A$ and $1 - \( 1 - epsilon \) n \/ \( n + 1 \) lt.eq epsilon +
    1 \/ \( n + 1 \)$. This proves (9.4).
  It remains to explain the deterministic step and check its inputs.
    The geometric summation of errors parallels Abbe and Montanari’s approximate sum-superadditivity argument
    #cite(label("AM")) arXiv version, Lemma 8 and Remark 3. The required minimum comparison is the threshold
    companion’s Lemma 5.4 (“Balanced comparisons”) #cite(label("FixedKThreshold")).
    For an integer $n_0 gt.eq 1$, it states that if a bounded real sequence $\( u_n \)_(n gt.eq n_0)$ satisfies
  $ u_(r + s) gt.eq min { u_r \, u_s } - K min \( r \, s \)^(- delta) quad upright("for ") 1 \/ 3 lt.eq
    r \/ s lt.eq 3 \, wide u_(s + 1) gt.eq u_s - K s^(- delta) \, $
  for all $r \, s gt.eq n_0$ in the indicated ratio range and all $s gt.eq n_0$, respectively, with fixed $K gt.eq
    0$ and $delta > 0$, then it converges and, for every $s gt.eq max { n_0 \, 2 }$ and every $N gt.eq s^2$,
    $u_N gt.eq u_s - K \( 1 + B_delta \) s^(- delta)$ with $B_delta$ as above.
    The lemma is a deterministic minimum comparison: it uses leaves of sizes $s \, s + 1$,
    and its binary tree has child-size ratios at most three. Choose $n_0$ beyond the cutoffs in our anchors and
    two comparisons. Then the boundedness in (9.2), the comparable-size part of (9.3),
    and (9.4) verify every hypothesis with $u_n = e_n$. The lemma gives (9.6) and convergence to some $alpha
    in \[ a \, A \]$.
  For $0 lt.eq c < alpha$, eventually $floor.l c n floor.r lt.eq mu_n -
    n^(1 - delta)$ and $floor.l c n floor.r < L_n$. For $alpha < c < B$, eventually $mu_n + n^(1 - delta) lt.eq
    floor.l c n floor.r < L_n$. In both cases the fixed positive density gap eventually exceeds $n^(1 - delta) +
    1$, accounting for the floor. Apply (9.11). Since $alpha lt.eq A < B$, choose one fixed $d in \( A \, B \)$;
    monotonicity extends the zero limit from $d$ to all $c gt.eq B$. This proves (9.5). ◻
]

The comparison (9.6) is one-sided. It proves convergence of the finite-size means,
  but gives no two-sided estimate for $mu_n - alpha n$ on the fluctuation scale of the variance theorem.

=== 9.4 Checking the inputs for the variance estimates <checking-the-inputs-for-the-variance-estimates>

For the main application put $B_k = 2^(k + 1)$ and take $B = B_k$; at $k = 3$ we may also take $B = 10$.
  We verify the anchors without assuming threshold convergence. Let $q_k = 1 - 2^(- k)$.
  The assignment first moment gives $P_n \( j \) lt.eq 2^n q_k^j$, hence, for every positive integer $d$,

#[#set math.equation(numbering: n => "(9.14)")
 $ bb(E) H_n = sum_(j = 0)^oo P_n \( j \) lt.eq d n + 2^k \( 2 q_k^d \)^n . $ <cmp:mean-upper>]

For $d = 2^k$, one has $2 q_k^(2^k) < 2 \/ e < 1$. For $k = 3$, the sharper choice $d =
  6$ satisfies $2 \( 7 \/ 8 \)^6 < 1$. Since $T_n lt.eq H_n$, it follows that eventually

#[#set math.equation(numbering: n => "(9.15)")
 $ e_n lt.eq A_k < B \, wide A_k = cases(delim: "{", 7 \, & k = 3 \,, 2^k + 1 \, & k gt.eq 4 .) $ <cmp:center-upper>]

For the positive anchor, fix $0 < c < min { e^(- 2) \, B }$ and let $j = floor.l c n floor.r$.
  Lemma 15 gives $P_n \( j \) = 1 - O_c \( n^(- 2) \)$ for the same independent proper-clause model.
  Since $c < B$, one has $j < L_n$ for sufficiently large $n$.
  Therefore $mu_n gt.eq j P_n \( j \) = c n - o \( n \)$, and with $c_0 = c \/ 2$ we obtain the full anchors

#[#set math.equation(numbering: n => "(9.16)")
 $ c_0 lt.eq e_n lt.eq A_k < B wide upright("for all sufficiently large ") n . $ <cmp:center-bounds>]

The capped variance theorem gives

$ frac("Var" \( T_n \), n^(2 - 2 delta)) =
  cases(delim: "{", O \( n^(- 1 + 2 delta) log n \) \, & k = 3 \,, O_k \( n^(- 1 + 2 delta) \) \, & k gt.eq 4 \,) $

which tends to zero for every fixed $0 < delta < 1 \/ 2$. Theorem 19 now applies with $a = c_0$ and $A = A_k$.
  Its strict-side limit is the same $alpha_k$ as in the threshold companion #cite(label("FixedKThreshold"))
  Theorem 1.1: if the two limits differed, a density strictly between them would be assigned opposite limiting
  probabilities. In particular, the proper-clause comparisons (9.3)–(9.4) hold for every such fixed $delta$.

The weaker polynomial variance estimate of the threshold companion #cite(label("FixedKThreshold")) Proposition 3.3
  can be used as a separate input. For $a = B_k n$ and the same last-SAT cap $b = a$,
  the exact identity in Proposition 13 is

$ min { H_n - 1 \, a } = min { H_n \, a } - 1 + upright(bold(1))_({ H_n > a }) . $

That proposition gives $"Var" \( min { H_n \, a } \) lt.eq "Var" \( min { H_n - 1 \, a } \)$.
  Consequently the companion’s $O_k \( n^(1 + 2 \/ k) \)$ bound verifies (9.7) for every $0 <
  delta < \( k - 2 \) \/ \( 2 k \)$, including the companion’s stated choice $delta = \( k - 2 \) \/ \( 4 k \)$.
  This substitution uses the companion’s own variance estimate.
  The range $delta < 1 \/ 2$ for the local variance bounds is also strict; no endpoint assertion is made.

== 10 A three-clause proof using prefix exposure <sec:appendix-c>

We give a second variance estimate for three-clause formulas,
  revealing clause types only through the current prefix. The argument truncates the number of clauses testing
  each variable of an omitted clause at $ceil.l log n ceil.r$,
  and pays separately for clauses meeting two or more of those variables. It gives an $O \( n log^4 n \)$ bound.
  The cube of the incidence cutoff contributes three logarithmic factors;
  the critical occupation integral contributes the fourth. The main argument in Sections 3–4 instead averages the
  bounded third moment of the actual incidence count, giving $O \( n log n \)$.
  Comparing the two proofs shows where that improvement enters.
  The replacement step below also gives a distinct finite-variable estimate:
  replacing one two-clause on $u$ variables by $g$ three-clauses loses at most $64 \( g^(- 2) + u^(- 2) \)$ in
  killing probability.

Throughout this section, $C_1 \, C_2 \, dots.h$ are independent uniform proper three-clauses on $n gt.eq
  3$ variables: a clause uses three distinct variables and independent fair signs, while whole clauses may repeat.
  Write $H_n$ for the index of the first unsatisfiable prefix and put

$ L = 10 n \, wide T_n = min { H_n \, L } \, wide m_n = bb(E) T_n . $

#thm([Theorem 10.1.])[
  (Variance from prefix exposure).  #emph[There is an absolute constant $C$ such that, for all integers $n gt.eq 3$,
$ "Var" \( T_n \) lt.eq C n \( log n \)^4 . $

 Consequently, for every $t > 0$,
$ bb(P) #scale(x: 120%, y: 120%)[\(] \| T_n - m_n \| gt.eq
  t sqrt(n) \( log n \)^2 #scale(x: 120%, y: 120%)[\)] lt.eq C t^(- 2) . $

]
] <thm:prefix-variance>

The proof has two uses of the same lifetime estimate. It bounds the remaining duration of a deletion event and the
  total time spent at a given level of the probability of killing the surviving assignments.
  Three independent root-flip tests connect those two bounds.

=== 10.1 Replacing pairs by triples on a finite variable set <replacing-pairs-by-triples-on-a-finite-variable-set>

For an integer $u gt.eq 3$ and $S subset.eq { 0 \, 1 }^u$,
  a collection of clauses #emph[kills] $S$ if no member of $S$ satisfies all of them.
  A uniform proper $r$-clause here is chosen from the $2^r binom(u, r)$ signed clauses on $r$ distinct variables.
  For an integer $d gt.eq 1$, let $q_d \( S \)$ be the probability that $d$ independent uniform proper two-clauses
  kill $S$. Let $tau \( S \)$ be the expected length of the first prefix of independent uniform proper
  three-clauses whose conjunction kills $S$, and set $tau \( diameter \) = 0$.
  For nonempty $S$, this expectation is finite because the probability of survival after $m$ clauses is at most
  $\| S \| \( 7 \/ 8 \)^m$.

Replacing a shorter constraint by native clauses has a qualitative predecessor in Friedgut’s half-cube argument
  #cite(label("Friedgut")) Lemma 5.7. The residual-set conditioning used below is the averaged replacement method
  of Carenini #cite(label("Carenini")) Theorem 4.3, Lemma 6.1, and Corollary 6.2;
  the following bound supplies the finite-variable pair-to-triple estimate needed here.

#thm([Lemma 10.2.])[
  (One-pair replacement).  #emph[For every integer $u gt.eq 3$, every $S subset.eq { 0 \, 1 }^u$,
    and every integer $g gt.eq 1$, if the $g$ triples are independent uniform proper three-clauses on these $u$
    variables, then
#[#set math.equation(numbering: n => "(10.1)")
 $ bb(P) \( upright("the ") g upright(" triples kill ") S \) gt.eq q_1 \( S \) -
   64 \( g^(- 2) + u^(- 2) \) . $ <eq:prefix-one-pair>]

]
] <lem:prefix-one-pair>

#proof[
  If $S = diameter$, both killing probabilities are one. Suppose that $S eq.not diameter$,
    and let $b$ be the number of variables taking a common value on all members of $S$.
    A single clause kills $S$ exactly when every one of its variables is among these $b$ frozen variables and
    every sign opposes the common value. Thus the killing probability of a proper $r$-clause is
  $ h_r = frac(\( b \)_r, 2^r \( u \)_r) \, wide r = 2 \, 3 \, $
  where $\( x \)_r = x \( x - 1 \) dots.h.c \( x - r + 1 \)$, and $\( b \)_r = 0$ for integers $0 lt.eq b < r$.
    For $b gt.eq 3$,
  $ h_3 / h_2^(3 \/ 2) = frac(b - 2, sqrt(b \( b - 1 \))) frac(sqrt(u \( u - 1 \)), u - 2) gt.eq 1 / 4 . $
  Indeed, the first factor is at least $\( b - 2 \) \/ b gt.eq 1 \/ 3$, and the second is at least one.
  Put $h = h_2 lt.eq 1 \/ 4$. The block kills $S$ whenever one of its clauses kills $S$ by itself,
    so its killing probability is at least $1 - \( 1 - h_3 \)^g gt.eq 1 - e^(- g h_3)$.
    If $b gt.eq 3$ and $\( g \/ 4 \) sqrt(h) gt.eq 2$, then $g h_3 gt.eq 2 h$,
    and this probability is at least $1 - e^(- 2 h) gt.eq h$.
    The last inequality follows because $1 - e^(- 2 h) - h$ vanishes at zero and has nonnegative derivative on
    $\[ 0 \, 1 \/ 4 \]$. In the remaining case with $b gt.eq 3$, $h lt.eq 64 g^(- 2)$. If $b < 3$, then
  $ h lt.eq frac(1, 2 u \( u - 1 \)) lt.eq u^(- 2) . $
  The nonnegativity of the block killing probability now proves (10.1) in every case. ◻
]

#prodef([Remark 10.3.])[
  For $k = 3$, the cutoff-free estimate in Lemma 2 has error $256 g^(- 2)$.
    Neither that error nor $64 \( g^(- 2) + u^(- 2) \)$ is uniformly smaller:
    the latter is smaller for $g < sqrt(3) thin u$, the former is smaller for $g > sqrt(3) thin u$,
    and they are equal when $g = sqrt(3) thin u$. The two estimates therefore retain different quantitative information.
]

#thm([Proposition 10.4.])[
  (Lifetime above the finite-variable cutoff).  #emph[Let $K = 64$.
    There is an absolute constant $K_1$ such that for every integer $u gt.eq 3$,
    every nonempty $S subset.eq { 0 \, 1 }^u$, every integer $d gt.eq 1$, and every $a$ with $4 K d \/ u^2 lt.eq
    a lt.eq 1$,
#[#set math.equation(numbering: n => "(10.2)")
 $ q_d \( S \) gt.eq a quad arrow.r.double quad tau \( S \) lt.eq K_1 d^(3 \/ 2) a^(- 3 \/ 2) . $ <eq:prefix-lifetime>]

]
] <prop:prefix-lifetime>

#proof[
  Replace $d$ independent two-clauses one at a time by independent blocks of $g$ proper three-clauses.
    At each step condition on the clauses in every other position, including the blocks already inserted.
    Their surviving assignments form a set $S' subset.eq S$. The pair being removed and the new block are
    independent of this conditioning. Lemma 22, including its empty-set case,
    bounds the conditional loss by $K \( g^(- 2) + u^(- 2) \)$. Averaging and telescoping over the replacements gives
  #[#set math.equation(numbering: n => "(10.3)")
   $ bb(P) \( d g upright(" independent uniform proper three-clauses kill ") S \) gt.eq q_d \( S \) -
     K d \( g^(- 2) + u^(- 2) \) . $ <eq:prefix-many-pairs>]
  Choose $g = ceil.l sqrt(4 K d \/ a) ceil.r$. Each of $K d \/ g^2$ and $K d \/ u^2$ is at most $a \/ 4$,
    so a block of $d g$ triples kills the original set $S$ with probability at least $a \/ 2$.
    In an infinite independent sequence, disjoint blocks have independent events of killing that original set.
    Their first successful block has expected index at most $2 \/ a$,
    and the cumulative sequence kills $S$ by the end of that block. Therefore
  $ tau \( S \) lt.eq frac(2 d g, a) lt.eq 8 sqrt(K) thin d^(3 \/ 2) a^(- 3 \/ 2) \, $
  where $g lt.eq 2 sqrt(4 K d \/ a)$ follows from $d gt.eq 1$ and $a lt.eq 1$.
    This proves the assertion, for example with $K_1 = 64$. ◻
]

=== 10.2 A deleted clause and an unexposed future <a-deleted-clause-and-an-unexposed-future>

We now apply the lifetime estimate to the delay caused by omitting one clause.
  We first assume $n$ is sufficiently large, in particular $n gt.eq 6$;
  the final constant will cover the remaining sizes. Keep the original clause indices, and for $1 lt.eq i lt.eq
  L$ and integer $m gt.eq 0$ put

$ B_m^(\( i \)) = and.big_(1 lt.eq j lt.eq m\
j eq.not i) C_j \, wide T^(\( i \)) = min { inf { m in bb(Z)_(gt.eq 0) : B_m^(\( i \)) in.not upright("SAT") } \,
  L #scale(x: 120%, y: 120%)[}] \, wide D_i = T^(\( i \)) - T_n \, $

with $inf diameter = oo$. Then $D_i gt.eq 0$, and $T^(\( i \))$ does not use coordinate $C_i$.
  The coordinate-omission inequality, Lemma 5, gives

#[#set math.equation(numbering: n => "(10.4)")
 $ "Var" \( T_n \) lt.eq sum_(i = 1)^L bb(E) D_i^2 . $ <eq:prefix-omission>]

Its martingale proof applies to precisely these index-preserving deletions and to the cap $L = 10 n$.

Fix $i$ and condition on any particular clause $C_i$. Until the end of the variance proof,
  probabilities refer to this conditional law; the other clauses remain independent and uniform.
  We call indices other than $i$ the baseline indices for this deletion.
  Let $R$ be the three variables of $C_i$, called its #emph[roots], and let $t in { 0 \,
  1 }^R$ be their unique values that falsify $C_i$. Put $u = n - 3$, abbreviate $B_m = B_m^(\( i \))$,
  and let $cal(F)_m = sigma \( C_j : 1 lt.eq j lt.eq m \, med j eq.not i \)$ under the conditional law.
  In particular, $u gt.eq 3$.

For $i lt.eq m < L$, define

#[#set math.equation(numbering: n => "(10.5)")
 $ A_m = { T_n lt.eq m < T^(\( i \)) } = { B_m in upright("SAT") \, med B_m and
   C_i in.not upright("SAT") } . $ <eq:prefix-delay-events>]

On $A_m$, every solution of $B_m$ has root values $t$. The two processes agree before index $i$, so

#[#set math.equation(numbering: n => "(10.6)")
 $ D_i = sum_(m = i)^(L - 1) upright(bold(1))_({ A_m }) . $ <eq:prefix-delay-sum>]

In particular $D_L = 0$. For every $m gt.eq i$, let $S_m subset.eq { 0 \,
  1 }^u$ be the nonroot restrictions of solutions of $B_m$ with root values $t$.
  The sets are decreasing, $cal(F)_m$-measurable, and nonempty on $A_m$.

A clause is #emph[ordinary] if it uses only nonroots. A fresh clause is ordinary with probability

$ p_0 = binom(u, 3) / binom(n, 3) \, $

which is bounded below by a positive absolute constant for sufficiently large $n$.
  Let $U_m$ be the number of trials after index $m$, including the last trial,
  until the ordinary clauses among them kill the original set $S_m$; put $U_m = 0$ when $S_m = diameter$.
  These trials may continue past $L$. Conditional on $cal(F)_m$,
  the future ordinary clauses are independent uniform proper triples on the nonroots.
  Their arrival gaps, counting the arrival trial, are independent geometric variables of mean $1 \/ p_0$,
  independent of the ordinary clauses themselves. Conditioning first on the latter clauses and summing the means
  of the gaps through their killing time proves

#[#set math.equation(numbering: n => "(10.7)")
 $ bb(E) \[ U_m divides cal(F)_m \] = frac(tau \( S_m \), p_0) . $ <eq:prefix-future-mean>]

The assertion uses the fact that only the prefix has been revealed; for $m gt.eq i$,
  all trials after $m$ remain fresh even after fixing $C_i$.

#thm([Lemma 10.5.])[
  (Remaining deletion time).  #emph[Set $cal(W)_m = min { L \, tau \( S_m \) \/ p_0 }$. For $i lt.eq m < L$, on $A_m$,
$ bb(E) [sum_(ell = m + 1)^(L - 1) upright(bold(1))_({ A_ell }) thin mid(bar.v) thin cal(F)_m] lt.eq cal(W)_m . $

 Consequently,
#[#set math.equation(numbering: n => "(10.8)")
 $ bb(E) D_i^2 lt.eq 3 sum_(m = i)^(L - 1) bb(E) \[ upright(bold(1))_({ A_m }) cal(W)_m \] .
   $ <eq:prefix-weighted-delay>]

]
] <lem:prefix-future-delay>

#proof[
  On $A_m$, any later solution of $B_ell$ still has root values $t$, and its nonroot part lies in $S_m$.
    Once the subsequent ordinary clauses kill $S_m$, no such solution remains.
    Thus $A_ell$ is impossible for $ell gt.eq m + U_m$. The number of later indices is at most both $U_m$ and $L$;
    its conditional expectation is therefore at most $min { bb(E) \[ U_m divides cal(F)_m \] \, L }$.
    Equation (10.7) proves the first assertion.
  On $A_m$, the nonempty set $S_m$ requires at least one triple to be killed, so $cal(W)_m gt.eq 1$.
    Expanding (10.6), conditioning each cross term on its earlier history, and using the first assertion gives
  $ bb(E) D_i^2 & = sum_m bb(E) upright(bold(1))_({ A_m }) +
    2 sum_m bb(E)
    [upright(bold(1))_({ A_m }) bb(E) [sum_(ell = m + 1)^(L - 1) upright(bold(1))_({ A_ell }) thin mid(bar.v) thin
    cal(F)_m]]\
 & lt.eq sum_m bb(E) \[ upright(bold(1))_({ A_m }) \( 1 + 2 cal(W)_m \) \] lt.eq
   3 sum_m bb(E) \[ upright(bold(1))_({ A_m }) cal(W)_m \] \, $
  where every outer sum runs from $m = i$ to $L - 1$. ◻
]

=== 10.3 The three root-flip tests <the-three-root-flip-tests>

The weight in (10.8) is determined by the surviving set. To estimate the accompanying deletion probability,
  we hide the parts of clauses that are already satisfied at the fixed root values.
  They will test whether a root can be flipped.

The #emph[type] of a baseline clause through index $m$ records the roots it contains and the signs of its root
  literals. For $j in R$, let $cal(I)_(j \, m)$ be the indices other than $i$, at most $m$,
  whose clause contains exactly root $j$ and whose root literal is true at $t$;
  put $s_(j \, m) = \| cal(I)_(j \, m) \|$. Call a clause containing at least two roots a #emph[collision],
  and let $v_m$ count such clauses at baseline indices through $m$.
  Finally, let $J_m subset.eq R$ contain those roots $j$ for which no collision through $m$ has exactly one root
  literal true under $t$, at root $j$. A collision can exclude at most one root, hence

#[#set math.equation(numbering: n => "(10.9)")
 $ \| J_m \| gt.eq 3 - v_m . $ <eq:prefix-available-roots>]

Let $cal(G)_m$ reveal all these prefix types and the entire signed nonroot part of every baseline clause through
  $m$, except at indices in $union.big_(j in R) cal(I)_(j \, m)$. Thus $cal(G)_m subset.eq cal(F)_m$.
  The hidden clauses are already satisfied by their root literal at $t$,
  so their nonroot parts do not affect $S_m$. In particular $S_m \, J_m \, s_(j \, m) \, v_m$,
  and $cal(W)_m$ are $cal(G)_m$-measurable. Conditional on $cal(G)_m$,
  the hidden nonroot parts are independent uniform proper two-clauses on the $u$ nonroots.
  Indeed, conditioning the independent clauses on their types separately preserves their product law,
  and revealing nonroot parts at other indices does not change it.

Put

$ d = ceil.l log n ceil.r \, wide q_m = q_d \( S_m \) . $

#thm([Lemma 10.6.])[
  (Root-flip tests under prefix conditioning).  #emph[For every $i lt.eq m < L$,
    on the $cal(G)_m$-measurable event ${ max_(j in R) s_(j \, m) lt.eq d \, med \| J_m \| gt.eq 1 }$,
#[#set math.equation(numbering: n => "(10.10)")
 $ bb(P) \( A_m divides cal(G)_m \) lt.eq upright(bold(1))_({ S_m eq.not diameter }) q_m^(\| J_m \|) .
   $ <eq:prefix-root-tests>]

]
] <lem:prefix-root-tests>

#proof[
  If $A_m$ occurs, then for each $j in J_m$ the pair clauses at indices in $cal(I)_(j \, m)$ must kill $S_m$.
    Otherwise choose an assignment in $S_m$ satisfying those pairs, extend it with root values $t$,
    and flip only $j$. A clause with no true root literal before the flip has a satisfied nonroot part,
    which is unchanged. A clause with a true root literal at a root other than $j$ remains satisfied.
    Any remaining clause has $j$ as its unique true root before the flip.
    It cannot be a collision because $j in J_m$, so it belongs to $cal(I)_(j \, m)$ and its pair is satisfied by
    the chosen assignment. The flipped assignment therefore satisfies $B_m$ with root values different from $t$,
    contradicting (10.5).
  The required killing events for different $j$ use disjoint families of the conditionally independent hidden
    pairs. On a nonempty $S_m$, each family has at most $d$ members and therefore kills with probability at most
    $q_d \( S_m \) = q_m$. A family of zero pairs has killing probability zero, so it causes no exception.
    Multiplication of these conditional bounds, together with the necessity of $S_m eq.not diameter$, proves (10.10). ◻
]

=== 10.4 Truncating incidence counts and summing occupation <truncating-incidence-counts-and-summing-occupation>

It remains to sum the right side of (10.8). The tests make deletion unlikely when $q_m$ is small.
  When it is large, the lifetime estimate limits both the remaining deletion time and the number of indices at
  that level. We first isolate the rare prefixes for which too many tests or collisions are present.

#thm([Lemma 10.7.])[
  (Prefix incidence counts).  #emph[Uniformly in $i lt.eq m < L$ and in the fixed value of $C_i$,
#[#set math.equation(numbering: n => "(10.11)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] max_(j in R) s_(j \, m) > d #scale(x: 120%, y: 120%)[\)] & = O \( n^(- 4) \) \,\
bb(P) \( v_m gt.eq 1 \) & = O \( n^(- 1) \) \, wide bb(P) \( v_m gt.eq 2 \) =
  O \( n^(- 2) \) . $ <eq:prefix-large-count>]

]
] <lem:prefix-counts>

#proof[
  A baseline clause contains a specified root with probability $3 \/ n$, independently across indices,
    and $s_(j \, m)$ is no greater than that root’s incidence count.
    A union bound over roots and choices of $d$ indices among at most $L = 10 n$ trials gives
  #[#set math.equation(numbering: n => "(10.12)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] max_(j in R) s_(j \, m) > d #scale(x: 120%, y: 120%)[\)] lt.eq
     3 binom(L, d) \( 3 \/ n \)^d lt.eq 3 \( 30 e \/ d \)^d = O \( n^(- 4) \) . $ <eq:prefix-count-numerical>]
  The final bound holds for sufficiently large $n$, since $d = ceil.l log n ceil.r$ and $log d arrow.r oo$.
  A trial contains any specified pair of roots with probability $6 \/ \[ n \( n - 1 \) \]$.
    The union over the three pairs bounds its collision probability by $18 \/ \[ n \( n - 1 \) \]$.
    A union bound over at most $L$ independent trials gives $bb(P) \( v_m gt.eq 1 \) = O \( n^(- 1) \)$;
    a union bound over pairs of trials gives $bb(P) \( v_m gt.eq 2 \) lt.eq binom(L, 2) O \( n^(- 4) \) =
    O \( n^(- 2) \)$. ◻
]

With $K = 64$, set

#[#set math.equation(numbering: n => "(10.13)")
 $ a_0 = frac(4 K d, u^2) = frac(256 d, \( n - 3 \)^2) . $ <eq:prefix-cutoff>]

For sufficiently large $n$, $a_0 < 1$. On $S_m eq.not diameter$,

#[#set math.equation(numbering: n => "(10.14)")
 $ cal(W)_m q_m^(3 \/ 2) lt.eq C d^(3 \/ 2) . $ <eq:prefix-weighted-lifetime>]

For $q_m gt.eq a_0$, this follows by applying Proposition 24 with $a = q_m$, and then using $cal(W)_m lt.eq
  tau \( S_m \) \/ p_0$. For $q_m < a_0$, including $q_m = 0$, use $cal(W)_m lt.eq L$ and

#[#set math.equation(numbering: n => "(10.15)")
 $ L a_0^(3 \/ 2) = 10 n (frac(256 d, \( n - 3 \)^2))^(3 \/ 2) = O \( d^(3 \/ 2) n^(- 2) \) lt.eq
   C d^(3 \/ 2) . $ <eq:prefix-small-level>]

#thm([Lemma 10.8.])[
  (Reduction to occupation).  #emph[For all sufficiently large $n$, uniformly in $i$ and in the value of $C_i$,
#[#set math.equation(numbering: n => "(10.16)")
 $ bb(E) D_i^2 lt.eq C \( 1 + d^(3 \/ 2) \) + C d^(3 \/ 2) sum_(m = i)^(L - 1) bb(E) #scale(x: 120%, y: 120%)[\[]
   upright(bold(1))_({ S_m eq.not diameter }) q_m^(3 \/ 2) #scale(x: 120%, y: 120%)[\]] . $ <eq:prefix-reduction>]

]
] <lem:prefix-reduction>

#proof[
  In (10.8), the terms on ${ max_j s_(j \, m) > d } union { v_m gt.eq 2 }$ contribute at most
  $ L sum_(m = i)^(L - 1) #scale(x: 120%, y: 120%)[\[] bb(P) \( max_j s_(j \, m) > d \) +
    bb(P) \( v_m gt.eq 2 \) #scale(x: 120%, y: 120%)[\]] = O #scale(x: 120%, y: 120%)[\(]
    L^2 \( n^(- 4) + n^(- 2) \) #scale(x: 120%, y: 120%)[\)] = O \( 1 \) . $
  For every remaining term, the restrictions, $cal(W)_m$, and $S_m$ are $cal(G)_m$-measurable.
    If $v_m = 1$, then $\| J_m \| gt.eq 2$. Conditioning on $cal(G)_m$ in Lemma 26 bounds its weighted probability
    by $upright(bold(1))_({ S_m eq.not diameter }) cal(W)_m q_m^2$.
    On a nonempty set, (10.14) and $q_m lt.eq 1$ bound this by $C d^(3 \/ 2)$.
    The one-collision contribution is therefore at most
  $ C d^(3 \/ 2) sum_(m = i)^(L - 1) bb(P) \( v_m = 1 \) = O \( d^(3 \/ 2) \) . $
  No independence between $v_m$ and the surviving set is asserted or needed.
  If $v_m = 0$, all three roots are available, and the same conditional bound has exponent three. By (10.14),
  $ upright(bold(1))_({ S_m eq.not diameter }) cal(W)_m q_m^3 lt.eq
    C d^(3 \/ 2) upright(bold(1))_({ S_m eq.not diameter }) q_m^(3 \/ 2) . $
  We may now discard the incidence restrictions. Summing the three cases and absorbing the factor three from
    (10.8) proves (10.16). ◻
]

We next bound how long the decreasing sets $S_m$ can remain nonempty at a given pair-killing level.
  The first visit to that level determines a set whose future lifetime controls all subsequent visits.

#thm([Lemma 10.9.])[
  (Occupation above a level).  #emph[For all sufficiently large $n$ and every $a_0 lt.eq a lt.eq 1$,
#[#set math.equation(numbering: n => "(10.17)")
 $ sum_(m = i)^(L - 1) bb(P) \( S_m eq.not diameter \, med q_m gt.eq a \) lt.eq
   C d^(3 \/ 2) a^(- 3 \/ 2) . $ <eq:prefix-occupation>]

 For $0 < a < a_0$, the same sum is at most $L$.]
] <lem:prefix-occupation>

#proof[
  Let $sigma_a$ be the first index in ${ i \, dots.h \, L - 1 }$ for which $S_m eq.not diameter$ and $q_m gt.eq
    a$, and set $sigma_a = oo$ when none exists. This is a stopping time for $cal(F)_m$,
    because $q_d$ is a deterministic function of its set argument.
    On ${ sigma_a = m }$, every counted index is at least $m$. Also $S_ell = diameter$ for $ell gt.eq m + U_m$:
    by then the future ordinary clauses have killed $S_m$, and any member of $S_ell$ would be a member of $S_m$
    satisfying all those clauses. The number of counted indices is thus at most $U_m$, including the first index $m$.
  For $a gt.eq a_0$, the event ${ sigma_a = m }$ is $cal(F)_m$-measurable,
    and on it the lifetime proposition applies. The fresh-future identity gives
  $ bb(E) \[ upright(bold(1))_({ sigma_a = m }) U_m \] & = bb(E)
    [upright(bold(1))_({ sigma_a = m }) frac(tau \( S_m \), p_0)]\
 & lt.eq C d^(3 \/ 2) a^(- 3 \/ 2) bb(P) \( sigma_a = m \) . $
  Summing over the disjoint first-visit events proves (10.17).
    This conditioning is legitimate because $m gt.eq i$ and all trials after $m$ remain unexposed.
    At a smaller level there are at most $L$ indices to count. ◻
]

#proof[
  For $0 lt.eq q lt.eq 1$, $q^(3 \/ 2) = integral_0^1 3 / 2 a^(1 \/ 2) upright(bold(1))_({ q gt.eq a }) thin d a$.
    Applying this identity and Lemma 29 gives
  $ sum_(m = i)^(L - 1) bb(E) \[ upright(bold(1))_({ S_m eq.not diameter }) q_m^(3 \/ 2) \] & = integral_0^1 3 /
    2 a^(1 \/ 2) sum_(m = i)^(L - 1) bb(P) \( S_m eq.not diameter \, q_m gt.eq a \) thin d a\
 & lt.eq L a_0^(3 \/ 2) + C d^(3 \/ 2) integral_(a_0)^1 frac(d a, a) lt.eq C d^(3 \/ 2) log n . $
  The final step uses (10.15) and $log \( 1 \/ a_0 \) lt.eq 2 log n$, since $a_0 gt.eq n^(- 2)$.
    The sum is finite and the integrands are nonnegative, so the interchange of sum, expectation,
    and integral is valid. Lemma 28 now yields, uniformly in the deleted index and the fixed clause,
  #[#set math.equation(numbering: n => "(10.18)")
   $ bb(E) D_i^2 lt.eq C \( 1 + d^(3 \/ 2) \) + C d^3 log n lt.eq C \( log n \)^4 . $ <eq:prefix-squared-influence>]
  Average over $C_i$ to remove the conditioning, and sum (10.18) in (10.4).
    This gives $"Var" \( T_n \) lt.eq C n \( log n \)^4$ for sufficiently large $n$.
    Enlarging $C$ covers the remaining integers $n gt.eq 3$, since $0 lt.eq T_n lt.eq 10 n$.
    Chebyshev’s inequality proves the stated tail bound. ◻
]

For every fixed $0 < eta < 1 \/ 2$, the $eta$ and $1 - eta$ quantiles of $T_n$ therefore lie within
  $O_eta \( sqrt(n) log^2 n \)$ of $m_n$. The probability outside any diverging multiple of this scale tends to
  zero. These statements use the finite-size mean $m_n$.

=== 10.5 Cap changes and the center comparison <cap-changes-and-the-center-comparison>

The prefix proof supplies a second concentration input for Theorem 19.
  That theorem assumes a concentration bound and proves the center comparisons independently of how the bound is
  obtained. We apply it here using the variance bound of Theorem 21,
  together with the cap identities already proved in Section 7. Put

$ W_n = min { H_n - 1 \, 10 n } \, wide V_n = min { H_n - 1 \, 16 n } \, wide e_n = frac(bb(E) T_n, n) \, wide
  P_n \( j \) = bb(P) \( H_n > j \) . $

#thm([Corollary 10.10.])[
  #emph[The variance and tail bounds of Theorem 21 hold also for $W_n$ and $V_n$,
    each centered at its own expectation. Moreover $e_n arrow.r alpha_3$,
    the strict-side threshold of the proper three-clause model: for every fixed $c gt.eq 0$ with $c eq.not alpha_3$,
$ P_n \( floor.l c n floor.r \) arrow.r cases(delim: "{", 1 \, & c < alpha_3 \,, 0 \, & c > alpha_3 .) $

 There is an absolute constant $C$ such that for all sufficiently large $n = min { n_1 \,
   n_2 }$ with $max { n_1 \, n_2 } lt.eq 3 n$, and for all sufficiently large $n$ in the second inequality,
#[#set math.equation(numbering: n => "(10.19)")
 $ e_(n_1 + n_2) gt.eq min { e_(n_1) \, e_(n_2) } - C n^(- 1 \/ 4) \, wide e_(n + 1) gt.eq e_n -
   C n^(- 1 \/ 4) . $ <eq:prefix-center-comparisons>]

]
] <cor:prefix-consequences>

#proof[
  Set $rho = 2 \( 7 \/ 8 \)^10 < 1$. With $T = T_n$, $W = W_n$, and $V = V_n$,
    identities (7.1)–(7.1) show that the mean corrections from $m_n -
    1$ are at most $rho^n$ and $\( 6 n + 1 \) rho^n$, respectively.
    The corresponding absolute differences of standard deviations are at most $rho^(n \/ 2)$ and $\( 6 n + 1 \)
    rho^(n \/ 2)$; the sharper geometric bounds are those in Section 7, obtained from Proposition 13.
    These exponentially small corrections transfer the variance estimate to both last-satisfiable statistics.
    Chebyshev’s inequality gives their tails about their own means.
  For the center claim, choose a fixed $0 < c < e^(- 2)$ and put $j = floor.l c n floor.r$.
    Lemma 15 gives $bb(E) T_n gt.eq j P_n \( j \) = c n - o \( n \)$.
    The survival-sum bound (9.14) with $k = 3$ and density six gives $bb(E) T_n lt.eq bb(E) H_n lt.eq 6 n +
    8 \[ 2 \( 7 \/ 8 \)^6 \]^n$. Thus $c_0 lt.eq e_n lt.eq 7 < 10$ eventually, for some absolute $c_0 > 0$.
    The relevant survival identity is $P_n \( j \) = bb(P) \( T_n > j \)$ for integers $0 lt.eq j < 10 n$;
    the restriction below the cap is essential, whereas the last-SAT identity $P_n \( j \) =
    bb(P) \( W_n gt.eq j \)$ includes $j = 10 n$. Theorem 21 supplies the concentration input
  #[#set math.equation(numbering: n => "(10.20)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \| T_n - m_n \| gt.eq n^(3 \/ 4) #scale(x: 120%, y: 120%)[\)] lt.eq
     eta_n \, wide eta_n = C frac(\( log n \)^4, sqrt(n)) arrow.r 0 . $ <eq:prefix-center-concentration>]
  Apply Theorem 19 with $k = 3$, $B = 10$, $a = c_0$, $A = 7$, and $delta = 1 \/ 4$.
    It gives both comparisons in (10.19), in particular for the stated comparable sizes,
    and convergence with the proper strict-side limits. Uniqueness identifies the limit with $alpha_3$ of
    #cite(label("FixedKThreshold")) Theorem 1.1. The one-sided estimate (9.6) also gives,
    for every sufficiently large $s$ and every $N gt.eq s^2$,
  $ e_N gt.eq e_s - C' s^(- 1 \/ 4) . $
  ◻
]

For the comparable-size consequence, the coarser trial comparison gives a concrete error bound.
  With $N = n_1 + n_2$, $n = min \( n_1 \, n_2 \)$, $e_(*) = min \( e_(n_1) \, e_(n_2) \)$, set $epsilon =
  n^(- 1 \/ 4)$ and $M = floor.l \( e_(*) - 2 epsilon \) N floor.r$, as in the proof of Theorem 19.
  The anchors give $\( c_0 \/ 4 \) N lt.eq M lt.eq 7 N$ for large $n$.
  Since $C_3 = 27$ in Lemma 20 and $N lt.eq 4 n$, (9.8) bounds the loss by

#[#set math.equation(numbering: n => "(10.21)")
 $ frac(27 M, epsilon^3 n^3) lt.eq frac(27 dot.op 7 dot.op 4 n, n^(9 \/ 4)) = 756 n^(- 5 \/ 4) . $ <eq:prefix-756-loss>]

The restriction $max \( n_1 \, n_2 \) lt.eq 3 n$ is used only for this numerical bound.
  For neighboring sizes, set $N = n + 1$ and $M = floor.l m_n - 2 n^(3 \/ 4) floor.r$.
  The constant $D_3 = 729 \/ 8$ gives loss $\( 729 \/ 8 \) M \/ \( epsilon^3 n^3 \) = O \( n^(- 5 \/ 4) \)$.
  In either case, the count-transfer index $j = floor.l \( 1 - epsilon \) M -
  N^(3 \/ 4) floor.r$ is nonnegative for large $n$ and lies strictly below $10 N$, as required in (9.12).

The deviation bounds above are about each statistic’s finite-size mean.
  The comparison inequalities are one-sided and do not give a two-sided rate for $e_n - alpha_3$.

#bibliography("refs.bib", style: "ieee", title: [References])
