#set page(paper: "us-letter", margin: (x: 80.9pt, y: 80.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Limiting Satisfiability Threshold \
for Every Fixed Clause Size]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 The limiting-threshold problem <sec:intro>

As independent clauses are added to a random Boolean formula, satisfiability changes from likely to unlikely.
  A narrow transition window answers only part of the threshold question:
  its location might still drift as the number of variables grows.
  We prove that the location converges for every fixed clause size at least three.

A Boolean assignment gives each variable $x_i$ a value in ${ 0 \, 1 }$.
  A literal is a variable or its negation; a clause is a disjunction of literals,
  and a conjunctive normal form formula is a conjunction of clauses.
  A formula is satisfiable if some assignment makes every clause true.
  Random $k$-SAT asks how this event changes as independent clauses are added to a formula on $n$ variables.

Fix an integer $k gt.eq 3$. For $n gt.eq k$, a #emph[proper $k$-clause] uses $k$ distinct variables chosen
  uniformly from $x_1 \, dots.h \, x_n$, with independent fair signs.
  Thus each of the $2^k binom(n, k)$ possible clauses has the same probability.
  Let $C_1 \, C_2 \, dots.h$ be independent clauses with this law, and define

$ F_(n \, m) = and.big_(i = 1)^m C_i \, wide P_n \( m \) = bb(P) \( F_(n \, m) in upright("SAT") \) \, wide m =
  0 \, 1 \, 2 \, dots.h . $

Here $upright("SAT")$ denotes satisfiability, and the empty conjunction is true.
  Whole clauses are sampled with replacement: two positions may contain the same clause,
  although a variable cannot occur twice within one proper clause.
  The prefix coupling makes $P_n$ nonincreasing and gives $P_n \( 0 \) = 1$.
  The ratio $c = m \/ n$ is the clause density.

#thm([Theorem 1.1.])[
  #emph[For every fixed integer $k gt.eq 3$, there is a constant $alpha_k in \( 0 \, oo \)$ such that,
    for independent proper uniformly signed $k$-clauses sampled with replacement,
$ lim_(n arrow.r oo) P_n \( floor.l c n floor.r \) =
  cases(delim: "{", 1 \, & 0 lt.eq c < alpha_k \,, 0 \, & c > alpha_k .) $

]
] <thm:main>

The conclusion is a strict-side threshold statement; it makes no assertion at $c = alpha_k$.
  All estimates below may depend on the fixed integer $k$. The proof does not require the centers of the
  transition windows to be known in advance. It constructs a finite-size center,
  controls the fluctuations about it, and then proves that these centers converge.

=== 1.1 Prior work and the role of the present argument <prior-work-and-the-role-of-the-present-argument>

Carenini [5] Theorem 1.1 and Corollary 1.2 proves an $O_(k \, eta) \( n^(1 \/ 2 + 1 \/ k) \)$ clause window
  between probability levels $eta$ and $1 - eta$, for each fixed $0 < eta < 1 \/ 2$, and,
  using the Abbe–Montanari criterion, establishes the satisfiability conjecture for every fixed $k gt.eq 3$.
  We credit Carenini with priority for the resolution of the satisfiability conjecture.
  The present paper gives an alternative proof of the limiting-threshold conclusion.

Chvátal and Reed [7] explicitly formulated the conjecture that each fixed clause size greater than one has a
  limiting satisfiability density. Friedgut’s sharp-threshold theorem, with Bourgain’s appendix [14] Theorem 1.3,
  established that random $k$-SAT has a sharp transition around a sequence of densities.
  It left open whether that sequence converges for each fixed $k$.
  The classical two-clause problem had already been settled by Chvátal and Reed [7] Theorems 3–4,
  who also credit independent proofs by Goerdt and Fernandez de la Vega. Goerdt’s journal treatment is [15].
  The implication-graph mechanism is separate from the proof given here.

For larger arities, Achlioptas and Peres [2] obtained leading-order bounds $2^k log 2 - O \( k \)$,
  using weighted second moments. The statistical-physics work of Mézard, Parisi, and Zecchina [19] and of Mertens,
  Mézard, and Zecchina [18] developed threshold predictions through the cavity method and one-step replica
  symmetry breaking. In particular, the latter work predicted the large-$k$ expansion

$ 2^k log 2 - frac(1 + log 2, 2) + o_k \( 1 \) \, wide o_k \( 1 \) arrow.r 0 quad \( k arrow.r oo \) . $

Coja-Oghlan and Panagiotou [8] Theorem 1.1 proved that the liminf and limsup of the sharp-threshold sequence both
  lie within an additive error tending to zero as $k arrow.r oo$ of $2^k log 2 - \( 1 + log 2 \) \/ 2$.
  These asymptotic-in-arity estimates are distinct from convergence in $n$ at a fixed arity.
  Ding, Sly, and Sun [9] proved existence and identified the threshold with the one-step replica symmetry breaking
  prediction for all sufficiently large fixed $k$. Theorem 1 establishes existence for every fixed $k gt.eq 3$,
  without identifying the value of $alpha_k$.

The first ingredient is a comparison between shorter clauses and blocks of ordinary clauses.
  Friedgut’s half-cube replacement lemma [14] Lemma 5.7 gives a qualitative antecedent based on frozen coordinates
  and sequential replacement. Carenini [6] Lemma 6.1 and Corollaries 6.2,
  7.10–7.11 developed an averaged clause-replacement method.
  The cited version proves an $O_k \( n \/ log n \)$ window between any two fixed central probability levels,
  with constants also depending on those levels, and distinguishes window width from convergence of the location
  in Section 10.1. Here the replacement is applied after erasing one variable.
  Summing the resulting changes in satisfiability probabilities bounds the forced fraction along the clause
  process. A deletion argument then converts this integrated bound into polynomial concentration.
  We give the replacement, forcing, and deletion proofs in full.

The second ingredient compares a whole system with independent subsystems.
  Guerra and Toninelli [16] used interpolation to establish thermodynamic limits for mean-field spin glasses.
  Franz and Leone [12], and Franz, Leone, and Toninelli [13], developed interpolation for diluted systems.
  Their pressure and free-energy arguments, with the stated even-arity restrictions,
  do not supply the hard satisfiability-threshold conclusion used here.
  Bayati, Gamarnik, and Tetali [3] Section 4, Proposition 2 established a frozen-variable satisfiability
  interpolation between clauses on a whole variable set and clauses confined to its parts.
  Our Poisson comparison is a continuous-parameter form of that method.
  Its sign follows from convexity of $x mapsto x^k$, applied to the proportions of globally forced variables in
  the parts. The comparison is exact for an auxiliary clause model that permits repeated variables;
  we prove the transfer back to proper clauses, including the constant loss caused by repetitions.

Finally, errors that are summable over geometrically increasing sizes cannot produce macroscopic drift.
  This principle parallels the approximate-superadditivity analysis of Abbe and Montanari [1] arXiv version,
  Section 4.3, Lemma 8 and Remark 3, developed in their study of solution counts.
  Our comparison uses the minimum of two normalized centers.
  We prove the corresponding deterministic convergence lemma,
  in a form that requires the comparison only when the two sizes are comparable.

=== 1.2 How the proof reaches the threshold <how-the-proof-reaches-the-threshold>

We cap the last satisfiable index at a fixed multiple of $n$,
  and take its expectation divided by $n$ as the finite-size center.
  The first task is to show that this capped index has sublinear fluctuations.
  In a satisfiable formula, a variable is #emph[forced] if every satisfying assignment gives it the same value.
  The clauses that avoid the variable form the untouched background.
  If the variable is forced, deleting its literal from each incident clause produces shorter clauses that
  eliminate every solution of this background. Replacing each shortened clause by a block of ordinary clauses
  turns this event into a decrease of the satisfiability probability.
  Summing over prefix lengths telescopes the decreases. Section 2 thereby controls the total expected forced
  fraction along the process.

Section 3 omits a single clause while keeping the other time indices.
  The delay in losing satisfiability counts the prefixes where that clause is pivotal.
  Its square counts pairs of such prefixes. If the punctured formula survives from the earlier prefix to the later
  one, every intervening clause must avoid killing the earlier solution set.
  This bounds the pair probability in terms of the variables already forced at the earlier time.
  The integrated forcing estimate then yields the required variance bound.
  Section 4 places the normalized means in a fixed positive bounded interval,
  using a clause-to-variable matching at low density and an assignment first moment at high density.

Concentration alone still permits the centers to drift. In the auxiliary Poisson model,
  interpolation says that satisfiability at a combined size is at least the product of the probabilities in two
  independent parts. Below either finite-size center, transfer from the proper model gives a fixed positive
  probability; above the combined center, it gives a probability tending to zero.
  These facts prevent the combined center from lying much below both smaller centers.
  A comparison with one extra variable handles adjacent sizes.
  Section 5 makes these steps precise and sums the errors along a balanced tree of nearly equal blocks.
  Its concentration-to-convergence theorem is then applied to the local variance and center bounds.

Section 6 uses a first moment at density six to bound the means of the three-clause indices,
  and gives exact relations between their cap conventions. It then specializes the forcing estimate and deduces
  concentration at the smaller cap. The improved mean bound permits a smaller transfer interval for either cap,
  sharpening the numerical constants while keeping the roles of the cap and the interval distinct.
  Section 7 explains the lower-arity cases and the finite-size information supplied by the proof.

== 2 Replacement and integrated forcing <sec:forcing>

We begin the local concentration proof by controlling how many variables are forced along the clause process.
  The estimate is integrated over prefix lengths: erasing one variable turns forcing into a difference of
  satisfiability probabilities, and those differences can be summed by telescoping.

For the fixed $k gt.eq 3$, write

$ H_n = inf { m gt.eq 1 : F_(n \, m) in.not upright("SAT") } . $

The value $+ oo$ is allowed in this definition, although $P_n \( m \) lt.eq
  2^n \( 1 - 2^(- k) \)^m$ implies that $H_n$ is finite almost surely. Put

#[#set math.equation(numbering: n => "(2.1)")
 $ L_k = 2^(k + 1) \, wide M_n = L_k n \, wide V_n = min { H_n - 1 \, M_n } \, wide mu_n =
   frac(bb(E) V_n, n) . $ <eq:statistic>]

Thus $V_n$ is the last satisfiable index up to the cap $M_n$, and

#[#set math.equation(numbering: n => "(2.2)")
 $ P_n \( m \) = bb(P) \( V_n gt.eq m \) wide \( 0 lt.eq m lt.eq M_n \) . $ <eq:survival>]

This identity includes $m = M_n$. Later, when a clause is omitted,
  the same endpoint convention will count every additional satisfiable prefix.

=== 2.1 Killing a solution set with one clause <killing-a-solution-set-with-one-clause>

A variable of a satisfiable formula $H$ is #emph[forced] if all satisfying assignments of $H$ give it the same
  value. Let $b \( H \)$ be the number of forced variables, and set $b \( H \) = 0$ if $H$ is unsatisfiable.
  This definition uses all solutions of the entire formula, even when the formula contains clauses of different lengths.

For a formula $H$ on $v$ variables and $1 lt.eq r lt.eq v$, define

#[#set math.equation(numbering: n => "(2.3)")
 $ q_r \( H \) = frac(\( b \( H \) \)_r, 2^r \( \)_() v r) \, wide \( \)_() u r =
   u \( u - 1 \) dots.h.c \( u - r + 1 \) \, $ <eq:kill>]

where $\( \)_() u r = 0$ for nonnegative integers $u < r$.
  Here a random $r$-clause uses $r$ distinct uniform variables and independent fair signs.

If $H$ is satisfiable, $q_r \( H \)$ is exactly the probability that adding one independent random $r$-clause
  makes it unsatisfiable. Indeed, every solution of $H$ must falsify every literal in such a clause.
  Each chosen variable must therefore be forced, and its sign must oppose the forced value.
  Conversely those conditions make the clause false in every solution.
  For unsatisfiable $H$, the convention $q_r \( H \) = 0$ records that there is no transition to count.

=== 2.2 Replacing a shorter clause <replacing-a-shorter-clause>

The next estimate is uniform in the background formula. This uniformity will allow successive replacements after
  conditioning on all other clauses.

#thm([Lemma 2.1.])[
  (Replacing a $\( k - 1 \)$-clause).  #emph[Let $k gt.eq 3$ and $n gt.eq k + 1$ be integers, and put
$ v = n - 1 \, wide epsilon = n^(- \( k - 1 \) \/ k) \, wide g = ceil.l 2 k n^(1 \/ k) ceil.r . $

 For any formula $H$ on these $v$ variables, let $Q$ be an independent random $\( k - 1 \)$-clause and let $R_1 \,
   dots.h \, R_g$ be independent random $k$-clauses, also independent of $H \, Q$. Then
$ bb(P) \( H and R_1 and dots.h.c and R_g in.not upright("SAT") \) gt.eq
  bb(P) \( H and Q in.not upright("SAT") \) - epsilon . $

]
] <lem:replacement>

The power comparison below is the Boolean forced-variable instance of the codimension comparison in Carenini [6]
  Lemma 6.1. The proof records the block size and error needed for the present summation.

#proof[
  If $H$ is unsatisfiable, both unsatisfiability probabilities are one.
    Suppose it is satisfiable, and set $x = q_(k - 1) \( H \)$ and $b = b \( H \)$.
    When $x lt.eq epsilon$, the right side after subtracting $epsilon$ is nonpositive. Assume $x > epsilon$.
  First $b gt.eq k$. Otherwise
  $ x lt.eq frac(1, 2^(k - 1) binom(n - 1, k - 1)) lt.eq 1 / n lt.eq n^(- \( k - 1 \) \/ k) = epsilon . $
  The middle inequality follows from $binom(n - 1, k - 1) gt.eq n - 1$, valid for $1 lt.eq k - 1 lt.eq n - 2$,
    and $2^(k - 1) \( n - 1 \) gt.eq n$. For $b gt.eq k$, the exact killing probabilities give
  $ q_k \( H \) = x frac(b - k + 1, 2 \( v - k + 1 \)) gt.eq x / k frac(b, 2 v) gt.eq 1 / k x^(k \/ \( k - 1 \)) . $
  Here $b - k + 1 gt.eq b \/ k$ and $v - k + 1 lt.eq v$. For the last inequality,
    each factor $\( b - j \) \/ \( v - j \)$ is at most $b \/ v$, so $x lt.eq \( b \/ \( 2 v \) \)^(k - 1)$.
    Consequently,
  $ g q_k \( H \) gt.eq 2 n^(1 \/ k) x^(k \/ \( k - 1 \)) gt.eq 2 x \, $
  because $x > n^(- \( k - 1 \) \/ k)$.
  The block makes $H$ unsatisfiable whenever at least one of its clauses does so individually.
    These individual events are independent conditional on $H$. Hence
  $ bb(P) \( H and R_1 and dots.h.c and R_g in.not upright("SAT") \) gt.eq 1 - \( 1 - q_k \( H \) \)^g gt.eq 1 -
    e^(- 2 x) gt.eq x . $
  For the last inequality, $0 lt.eq x lt.eq 2^(- \( k - 1 \)) lt.eq 1 \/ 4$, and $1 - e^(- 2 x) -
    x$ vanishes at zero and has positive derivative on that interval. ◻
]

=== 2.3 Erasing one variable and summing over time <erasing-one-variable-and-summing-over-time>

The following estimate is the input to the omission argument in Section 3.
  Unsatisfiable formulas contribute zero, and the sum includes the empty prefix and the cap.

#thm([Proposition 2.2.])[
  (Integrated forcing).  #emph[For every fixed integer $k gt.eq 3$,
#[#set math.equation(numbering: n => "(2.4)")
 $ sum_(j = 0)^(M_n) bb(E) frac(b \( F_(n \, j) \), n) = O_k \( n^(1 \/ k) \) \, wide M_n =
   2^(k + 1) n . $ <eq:integrated>]

]
] <prop:forcing>

#proof[
  It is enough to consider $n gt.eq k + 1$. We first prove an explicit bound for every integer cap $M gt.eq 0$,
    and then take $M = M_n$. The case $M = 0$ is immediate, so assume $M gt.eq 1$.
    By symmetry, the $j$-th summand is the probability that $F_(n \, j)$ is satisfiable and $x_n$ is forced.
    Delete the clauses containing $x_n$, and let $d$ be their number. Then $d tilde.op "Bin" \( j \, k \/ n \)$.
    Conditional on their positions, the untouched formula $B$ is an independent proper $k$-SAT formula on $v = n -
    1$ variables with $j - d$ clauses. Erasing the literal on $x_n$ from each deleted clause leaves independent
    uniform $\( k - 1 \)$-clauses $Q_1 \, dots.h \, Q_d$ on those $v$ variables, independent of $B$.
  If $F_(n \, j)$ is satisfiable and $x_n$ is forced, then
  #[#set math.equation(numbering: n => "(2.5)")
   $ B in upright("SAT") \, wide B and Q_1 and dots.h.c and Q_d in.not upright("SAT") . $ <eq:forced-reduction>]
  Indeed, any solution of the latter formula would extend to a solution of $F_(n \, j)$ with either value of $x_n$.
  Keep the incidence positions fixed. Replace each $Q_ell$ in turn by $g$ fresh random $k$-clauses, with $g \,
    epsilon$ as in Lemma 2. At a replacement step, condition on $B$, all other remaining shortened clauses,
    and all previously inserted blocks. The clause being replaced is still uniform and independent of this
    background, so the lemma bounds the loss in unsatisfiability probability by $epsilon$. Averaging at each step yields
  $ bb(P) \( B and Q_1 and dots.h.c and Q_d in.not upright("SAT") divides upright("incidence positions") \) lt.eq
    1 - P_v \( j - d + d g \) + d epsilon . $
  The formula after all replacements has $j - d + d g$ independent proper $k$-clauses on $v$ variables.
    Since $B in.not upright("SAT")$ is contained in the event on the left and has conditional probability $1 -
    P_v \( j - d \)$, the conditional probability of (2.5) is at most
  #[#set math.equation(numbering: n => "(2.6)")
   $ Delta_(j \, d) + d epsilon \, wide Delta_(j \, d) = P_v \( j - d \) - P_v \( j - d + d g \) gt.eq
     0 . $ <eq:replacement-difference>]
  To sum this estimate, let $p_(j \, d) = bb(P) \( "Bin" \( j \, k \/ n \) = d \)$. For $0 lt.eq d lt.eq j lt.eq M$,
  $ p_(j \, d) lt.eq binom(j, d) \( k \/ n \)^d lt.eq frac(\( k M \/ n \)^d, d !) . $
  For fixed $d$, monotonicity of $P_v$ and telescoping give
  #[#set math.equation(numbering: n => "(2.7)")
   $ sum_(j = d)^M Delta_(j \, d) = sum_(t = 0)^(M - d) #scale(x: 120%, y: 120%)[\[] P_v \( t \) -
     P_v \( t + d g \) #scale(x: 120%, y: 120%)[\]] lt.eq d g . $ <eq:telescoping>]
  For example, after shifting the second sum by $d g$, only the first $d g$ nonnegative terms can remain;
    if the shift exceeds the number of terms, that number is already at most $d g$.
  Use the envelope $\( k M \/ n \)^d \/ d !$ only for the nonnegative $Delta_(j \, d)$ term.
    The error $d epsilon$ is averaged with its original binomial weight, whose mean is $k j \/ n$. Therefore
  #[#set math.equation(numbering: n => "(2.8)")
   $ sum_(j = 0)^M bb(E) frac(b \( F_(n \, j) \), n) & lt.eq
     sum_(d = 0)^M frac(\( k M \/ n \)^d, d !) sum_(j = d)^M Delta_(j \, d) + epsilon sum_(j = 0)^M frac(k j, n)\
 & lt.eq g sum_(d = 0)^oo frac(d \( k M \/ n \)^d, d !) + frac(k M \( M + 1 \), 2 n) epsilon\
 & = frac(k M, n) e^(k M \/ n) g + frac(k M \( M + 1 \), 2 n) epsilon . $ <eq:forcing-general-cap>]
  At $M = M_n = L_k n$, the exponential factor depends only on $k$.
    The last expression is therefore $O_k \( g + n epsilon \) = O_k \( n^(1 \/ k) \)$, because $g =
    O_k \( n^(1 \/ k) \)$ and $n epsilon = n^(1 \/ k)$. ◻
]

== 3 Clause omission and polynomial concentration <sec:concentration>

We now turn the integrated forcing estimate into a bound on the fluctuations of the last satisfiable prefix.
  Omitting one clause can delay the loss of satisfiability.
  The delay counts the prefixes where that clause is pivotal, and its square counts pairs of pivotal times.
  The key observation is that a future punctured prefix can survive only if every intervening clause avoids
  killing the present solution set.

=== 3.1 Omitting a clause without changing time indices <omitting-a-clause-without-changing-time-indices>

Fix an integer $M gt.eq 1$ and the independent clauses $C_1 \, dots.h \, C_M$. For the next two lemmas, let

$ V = max { 0 lt.eq m lt.eq M : F_(n \, m) in upright("SAT") } $

be the last satisfiable index capped at $M$. For $1 lt.eq i lt.eq M$, set

$ V^(- i) = max {0 lt.eq m lt.eq M : and.big_(1 lt.eq j lt.eq m\
j eq.not i) C_j in upright("SAT")} . $

The time index $i$ is skipped; the remaining positions are not renumbered.
  Thus $V^(- i) gt.eq V$, and $V^(- i)$ is independent of $C_i$.

The following coordinate-omission inequality belongs to the martingale variance method associated with Efron and
  Stein [10] and Steele’s treatment of nonsymmetric statistics [20].
  Boucheron, Bousquet, Lugosi, and Massart [4] Section 3.2, equation (3.6) state the arbitrary-omission form.
  The short proof fixes the deletion convention and constant.

#thm([Lemma 3.1.])[
  (Deletion variance bound).  #emph[For the capped indices just defined,
$ "Var" \( V \) lt.eq sum_(i = 1)^M bb(E) \( V^(- i) - V \)^2 . $

]
] <lem:variance-deletion>

#proof[
  Let $cal(F)_i = sigma \( C_1 \, dots.h \, C_i \)$, with $cal(F)_0$ trivial, and put
  $ D_i = bb(E) \[ V divides cal(F)_i \] - bb(E) \[ V divides cal(F)_(i - 1) \] . $
  Independence of the clauses and the fact that $V^(- i)$ does not use $C_i$ give
  $ bb(E) \[ V^(- i) divides cal(F)_i \] = bb(E) \[ V^(- i) divides cal(F)_(i - 1) \] . $
  For $Z_i = V - V^(- i)$, it follows that
  $ D_i = bb(E) \[ Z_i divides cal(F)_i \] - bb(E) \[ Z_i divides cal(F)_(i - 1) \] . $
  The tower property and conditional Jensen inequality yield
  $ bb(E) D_i^2 = bb(E) #scale(x: 120%, y: 120%)[\(] bb(E) \[ Z_i divides cal(F)_i \]
    #scale(x: 120%, y: 120%)[\)]^2 - bb(E) #scale(x: 120%, y: 120%)[\(] bb(E) \[ Z_i divides cal(F)_(i - 1) \]
    #scale(x: 120%, y: 120%)[\)]^2 lt.eq bb(E) Z_i^2 . $
  The martingale differences are orthogonal and sum to $V - bb(E) V$.
    Summing the displayed inequalities proves the lemma. ◻
]

=== 3.2 Pairs of pivotal times <pairs-of-pivotal-times>

Fix $i$. For $i lt.eq m lt.eq M$, the punctured prefix and its killing probability are

$ G_m = and.big_(1 lt.eq j lt.eq m\
j eq.not i) C_j \, wide q_m = q_k \( G_m \) . $

The function $q_k$ was defined in (2.3); in particular, $q_m = 0$ when $G_m$ is unsatisfiable.

#thm([Lemma 3.2.])[
  (Pivotal pairs).  #emph[For every $1 lt.eq i lt.eq M$,
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E) \( V^(- i) - V \)^2 lt.eq 2 sum_(m = i)^M bb(E) min { M q_m \, 1 } . $ <eq:pivotal>]

]
] <lem:pivotal>

#proof[
  Let
  $ A_m = { G_m in upright("SAT") \, med G_m and C_i in.not upright("SAT") } . $
  This event is exactly ${ V < m lt.eq V^(- i) }$: prefix $m$ is satisfiable after omission and unsatisfiable
    before it. Hence, including the endpoint $m = M$,
  $ V^(- i) - V = sum_(m = i)^M upright(bold(1))_(A_m) . $
  For $ell gt.eq m$, on $A_m$ the original prefix remains unsatisfiable, so
  $ A_m ∩ A_ell = A_m ∩ { G_ell in upright("SAT") } . $
  Condition on $cal(F)_m^(\( - i \)) = sigma \( C_j : 1 lt.eq j lt.eq m \, med j eq.not i \)$.
    The clause $C_i$ and the future clauses $C_(m + 1) \, dots.h \, C_ell$ are conditionally independent.
    The conditional probability of $A_m$ is $q_m$. If $G_m$ is satisfiable,
    then $G_ell$ can be satisfiable only if none of these future clauses individually makes $G_m$ unsatisfiable.
    Each does so with probability $q_m$, independently. Thus
  #[#set math.equation(numbering: n => "(3.2)")
   $ bb(P) \( A_m ∩ A_ell divides cal(F)_m^(\( - i \)) \) = q_m
     bb(P) \( G_ell in upright("SAT") divides cal(F)_m^(\( - i \)) \) lt.eq
     q_m \( 1 - q_m \)^(ell - m) . $ <eq:pivotal-pair>]
  If $G_m$ is unsatisfiable, the relevant event and the right side are both zero.
  Expand the square of the indicator sum and bound its double sum by twice the sum over $m lt.eq ell$. For $q > 0$,
  $ sum_(ell = m)^M \( 1 - q \)^(ell - m) lt.eq min { M \, 1 \/ q } \, $
  because $m gt.eq 1$. Multiplication by $q$, followed by expectation and summation over $m$, gives (3.1).
    When $q = 0$, every term in the corresponding product is zero, so no division by zero is needed. ◻
]

=== 3.3 The variance bound <the-variance-bound>

The pivotal-pair estimate has reduced the squared omission delay to a truncated killing probability.
  Taking a $k$-th root converts that quantity into the forced fraction controlled by Proposition 3.

#thm([Proposition 3.3.])[
  (Polynomial concentration).  #emph[For every fixed integer $k gt.eq 3$, the statistic $V_n =
    min \( H_n - 1 \, L_k n \)$ from (2.1) satisfies
#[#set math.equation(numbering: n => "(3.3)")
 $ "Var" \( V_n \) = O_k \( n^(1 + 2 \/ k) \) . $ <eq:variance>]

 In particular, with $mu_n = bb(E) V_n \/ n$,
#[#set math.equation(numbering: n => "(3.4)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] \| V_n - n mu_n \| gt.eq n^(1 - delta_k) #scale(x: 120%, y: 120%)[\)] =
   O_k \( n^(- eta_k) \) \, wide delta_k = frac(k - 2, 4 k) \, quad eta_k = frac(k - 2, 2 k) . $ <eq:concentration>]

]
] <prop:concentration>

#proof[
  Set $M = L_k n$, $V = V_n$, and fix $i$. With the notation of Lemma 5, let $rho_m = b \( G_m \) \/ n$.
    The falling-factorial ratios in (2.3) give $q_m lt.eq rho_m^k$.
    Since $min { z \, 1 } lt.eq z^(1 \/ k)$ for $z gt.eq 0$,
  $ min { M q_m \, 1 } lt.eq \( M q_m \)^(1 \/ k) lt.eq M^(1 \/ k) rho_m . $
  Unconditionally, $G_m$ has the law of $F_(n \, m - 1)$. Lemma 5 and Proposition 3 therefore give,
    uniformly in $1 lt.eq i lt.eq M$,
  $ bb(E) \( V^(- i) - V \)^2 lt.eq 2 M^(1 \/ k) sum_(m = i)^M bb(E) rho_m lt.eq
    2 M^(1 \/ k) sum_(j = 0)^(M - 1) bb(E) frac(b \( F_(n \, j) \), n) = O_k \( n^(2 \/ k) \) . $
  Summing over $M = L_k n$ indices in Lemma 4 proves (3.3). Chebyshev’s inequality proves (3.4), because
  $ 1 + 2 / k - 2 \( 1 - delta_k \) = - (1 - 2 / k - 2 delta_k) = - eta_k . $
  ◻
]

The exponent $delta_k$ is positive for $k gt.eq 3$, so the window $n^(1 - delta_k)$ is sublinear.
  The estimate is centered at the finite-size mean $n mu_n$; comparing those means across sizes is a separate task.

== 4 Positive and finite center bounds <sec:anchors>

Before comparing different sizes, we place the centers in a fixed positive interval below the cap.
  At high density, an assignment first moment makes satisfiability unlikely.
  At a sufficiently small positive density, a matching from clauses to variables supplies a satisfying assignment
  regardless of the signs.

The matching criterion is Hall’s theorem [17]. Its application to satisfiability and the associated deficiency
  counting appear in Franco and Van Gelder [11] Section 8. We include the alternating-path argument and the
  probability estimate.

#thm([Lemma 4.1.])[
  (Bounds on the centers).  #emph[For each fixed $k gt.eq 3$, there is $a_0 > 0$ such that,
    for all sufficiently large $n$,
$ a_0 lt.eq mu_n lt.eq 2^k + 1 . $

]
] <lem:center-bounds>

#proof[
  For any fixed assignment, each proper uniformly signed $k$-clause is satisfied with probability $1 - 2^(- k)$.
    The clauses are independent, so at $m = 2^k n$ the expected number of satisfying assignments is
  $ 2^n \( 1 - 2^(- k) \)^(2^k n) lt.eq \( 2 \/ e \)^n = o \( 1 \) . $
  Consequently $P_n \( 2^k n \) = o \( 1 \)$. Since $V_n lt.eq L_k n$,
  $ mu_n lt.eq 2^k + \( L_k - 2^k \) P_n \( 2^k n \) = 2^k + o \( 1 \) . $
  For the lower bound, fix $c_0 > 0$ with $e^2 c_0 < 1$ and put $m = floor.l c_0 n floor.r < n$.
    A matching assigning each clause position a distinct variable occurring in that clause guarantees
    satisfiability: give each matched variable the value that satisfies its literal in the matched clause.
    These choices are compatible because the matched variables are distinct.
  If no such matching exists, some $t$ clause positions use fewer than $t$ variables.
    To see this directly, take a maximum matching and start an alternating-path search from an unmatched clause.
    Every reached variable must be matched, or an augmenting path would exist.
    Its matched clause is then reached as well. The starting unmatched clause gives more reached clauses than
    reached variables, which is the asserted obstruction.
  Enlarge a deficient variable set to a set of exactly $t$ variables. A union bound gives
  $ bb(P) \( upright("no matching") \) & lt.eq sum_(t = 1)^m binom(m, t) binom(n, t) \( t \/ n \)^(k t)\
 & lt.eq sum_(t = 1)^m \( e^2 c_0 thin t \/ n \)^t = o \( 1 \) . $
  Indeed, the probability that a proper clause lies in a specified $t$-set is $\( \)_() t k \/ \( \)_() n k
    lt.eq \( t \/ n \)^k$, and it is zero for $t < k$. Bounding the two binomial coefficients by
    $\( e m \/ t \)^t$ and $\( e n \/ t \)^t$ first gives $\[ e^2 c_0 \( t \/ n \)^(k - 2) \]^t$.
    Since $k gt.eq 3$ and $t < n$, this is at most the displayed summand.
    For the last limit, every fixed summand tends to zero, whereas the tail is bounded by the tail of the
    convergent geometric series $sum_(t gt.eq 1) \( e^2 c_0 \)^t$.
  Thus $P_n \( m \) = 1 - o \( 1 \)$. Because $m lt.eq M_n$, the survival identity (2.2) gives
  $ mu_n gt.eq m / n P_n \( m \) = c_0 - o \( 1 \) . $
  An eventual lower bound $a_0 > 0$ and the asserted upper bound follow. ◻
]

== 5 From concentration to a limiting location <sec:convergence>

The preceding estimates control fluctuations at one size.
  We now rule out drift of the centers as the number of variables grows. The argument has two steps.
  An auxiliary Poisson formula compares the satisfiability probabilities at a combined size and at two smaller
  sizes. Concentration turns this probability comparison into inequalities between centers,
  whose errors can then be summed along a balanced tree.

Recall that $H_n = inf { m gt.eq 1 : F_(n \, m) in.not upright("SAT") }$ is the first unsatisfiable index in the
  proper-clause process. To state the comparison argument independently of the cap used above,
  fix $lambda > 0$ and define

#[#set math.equation(numbering: n => "(5.1)")
 $ M_n^(\( lambda \)) = floor.l lambda n floor.r \, wide V_n^(\( lambda \)) = min { H_n - 1 \, M_n^(\( lambda \)) } \,\
x_n^(\( lambda \)) = frac(bb(E) V_n^(\( lambda \)), n) . $ <eq:general-capped-center>]

Thus, for every integer $0 lt.eq m lt.eq M_n^(\( lambda \))$,

#[#set math.equation(numbering: n => "(5.2)")
 $ P_n \( m \) = bb(P) #scale(x: 120%, y: 120%)[\(] V_n^(\( lambda \)) gt.eq
   m #scale(x: 120%, y: 120%)[\)] . $ <eq:general-cap-survival>]

This identity includes $m = M_n^(\( lambda \))$. The superscript keeps these statistics distinct from the
  particular $V_n$ and $mu_n$ used in the preceding sections.

#thm([Theorem 5.1.])[
  (Concentration implies convergence).  #emph[Fix an integer $k gt.eq 3$ and $lambda > 0$.
    Suppose that the proper independent uniformly signed $k$-clause process has constants
$ 0 < a lt.eq b < lambda \, wide 0 < delta < 1 / 2 \, wide eta > 0 \, wide 0 lt.eq K < oo $

 such that, for all sufficiently large $n$,
#[#set math.equation(numbering: n => "(5.3)")
 $ a lt.eq x_n^(\( lambda \)) lt.eq b \,\
bb(P) (lr(|V_n^(\( lambda \)) - n x_n^(\( lambda \))|) gt.eq n^(1 - delta)) lt.eq
  K n^(- eta) . $ <eq:convergence-input>]

 Then $x_n^(\( lambda \))$ converges to some $alpha in \[ a \, b \]$, and
$ lim_(n arrow.r oo) P_n \( floor.l c n floor.r \) =
  cases(delim: "{", 1 \, & 0 lt.eq c < alpha \,, 0 \, & c > alpha .) $

 Moreover, for all sufficiently large $r \, s$,
#[#set math.equation(numbering: n => "(5.4)")
 $ x_(r + s)^(\( lambda \)) & gt.eq min { x_r^(\( lambda \)) \, x_s^(\( lambda \)) } - 4 min { r \, s }^(- delta) \,\
x_(s + 1)^(\( lambda \)) & gt.eq x_s^(\( lambda \)) - 4 s^(- delta) . $ <eq:convergence-sum>]

 The first comparison holds without a restriction on $r \/ s$.]
] <thm:concentration-to-convergence>

The input is a tail estimate about a finite-size mean. The conclusion gives convergence of that mean,
  while the quantitative comparison is one-sided. We begin with the probability inequality that supplies it.

=== 5.1 An auxiliary product inequality <an-auxiliary-product-inequality>

For every positive integer $n$ and $c gt.eq 0$, let $s_n \( c \)$ be the satisfiability probability of the
  following auxiliary formula. Its number of clauses is $"Pois" \( c n \)$.
  Within each clause, the $k$ variable indices are chosen independently and uniformly from ${ 1 \, dots.h \, n }$,
  and their signs are independent and fair. The clauses are independent.
  The resulting literals are disjoined in the usual Boolean sense,
  so repeated variables and tautologies are allowed. This definition applies at every positive size, including $n = 1$.

The following calculation is a Poisson form of the frozen-variable interpolation of Bayati, Gamarnik,
  and Tetali [3] Section 4, Proposition 2. Independence of the endpoint Poisson families gives the product that we need.

#thm([Lemma 5.2.])[
  (Auxiliary product inequality).  #emph[For every pair of positive integers $r \, s$ and every $c gt.eq 0$,
#[#set math.equation(numbering: n => "(5.5)")
 $ s_(r + s) \( c \) gt.eq s_r \( c \) s_s \( c \) . $ <eq:auxiliary-product>]

]
] <lem:auxiliary-product>

#proof[
  Let $N = r + s$, and partition the variables into parts of sizes $n_1 = r$ and $n_2 = s$.
    For $0 lt.eq t lt.eq c$, take three independent Poisson families:
    a mean $N t$ family of auxiliary clauses on all $N$ variables and, for $i = 1 \, 2$,
    a mean $n_i \( c - t \)$ family of auxiliary clauses confined to part $i$.
    Write $G_t$ for their conjunction and $f \( t \) = bb(P) \( G_t in upright("SAT") \)$.
  We use the elementary add-one formula for a marked Poisson family.
    If a bounded observable has conditional expectations $a_j$ given exactly $j$ independent marks,
    then its expectation at mean $v$ is $sum_(j gt.eq 0) e^(- v) v^j a_j \/ j !$,
    whose derivative is $sum_(j gt.eq 0) e^(- v) v^j \( a_(j + 1) - a_j \) \/ j !$.
    Both series converge uniformly on compact intervals of $v$,
    so the formula also applies after conditioning on the other two Poisson families.
  For a satisfiable background $G_t$, let $b_i$ be the number of variables in part $i$ that are forced by the
    entire background: every satisfying assignment gives each such variable the same value.
    Set $b_i = 0$ on unsatisfiable backgrounds. For a satisfiable background,
    a new auxiliary clause destroys satisfiability exactly when each of its literals is false in every satisfying
    assignment. Each literal must therefore oppose the value of a forced variable.
    Conversely, that condition makes the whole new clause false in every solution.
    The independent signed draws give killing probabilities
  $ (frac(b_1 + b_2, 2 N))^k quad upright("and") quad (frac(b_i, 2 n_i))^k $
  for a global clause and a clause confined to part $i$, respectively.
    This remains exact when an index is repeated: each independent signed draw must still be one of the literals
    false in every solution.
  An unsatisfiable background remains unsatisfiable after any clause is added.
    The add-one formula, applied to the three means, therefore gives for $0 < t < c$
  $ f' \( t \) & =
    N bb(E)
    [upright(bold(1))_({ G_t in upright("SAT") }) {sum_(i = 1)^2 n_i / N (frac(b_i, 2 n_i))^k - (frac(b_1 + b_2, 2
    N))^k}]\
 & gt.eq 0 . $
  The last inequality is convexity of $z mapsto z^k$ on $\[ 0 \, oo \)$,
    since $\( b_1 + b_2 \) \/ \( 2 N \)$ is the weighted average of $b_i \/ \( 2 n_i \)$ with weights $n_i \/ N$.
    At $t = 0$ the two restricted formulas are independent, so $f \( 0 \) = s_r \( c \) s_s \( c \)$; at $t = c$,
    only the global formula remains, so $f \( c \) = s_N \( c \)$.
    Continuity at the endpoints proves the assertion for $c > 0$, and $c = 0$ is immediate. ◻
]

=== 5.2 Transfer to proper clauses <transfer-to-proper-clauses>

For the rest of the proof of Theorem 8, assume its hypotheses and keep $k \, lambda \, a \, b \, delta \, eta \,
  K$ fixed. Choose any density ceiling $D > b$. The elementary sandwich below does not use the concentration
  hypothesis; its tail consequences also use (5.3). The ceiling is independent of the cap parameter $lambda$:
  the cap locates the survival events in (5.2), whereas $D$ bounds the expected number of clauses with internal
  repetitions in the auxiliary formula. Put

#[#set math.equation(numbering: n => "(5.6)")
 $ R = D binom(k, 2) \, wide gamma = min { eta \, 1 - 2 delta } > 0 \, wide kappa = e^(- R) /
   2 . $ <eq:transfer-parameters>]

#thm([Lemma 5.3.])[
  (Proper-clause transfer).  #emph[For $n gt.eq k$ set $theta_n = \( n \)_k \/ n^k$, where $\( n \)_k =
    n \( n - 1 \) dots.h.c \( n - k + 1 \)$. If $0 lt.eq c lt.eq D$ and $J tilde.op "Pois" \( c n theta_n \)$, then
#[#set math.equation(numbering: n => "(5.7)")
 $ e^(- R) bb(E) P_n \( J \) lt.eq s_n \( c \) lt.eq bb(E) P_n \( J \) \,\
c n - R lt.eq bb(E) J lt.eq c n \, wide "Var" \( J \) lt.eq D n . $ <eq:proper-sandwich>]

 If (5.3) holds, then there are constants $0 lt.eq K' < oo$ and an integer $n_1 gt.eq
   k$ such that for every $n gt.eq n_1$ and every $c in \[ 0 \, D \]$,
#[#set math.equation(numbering: n => "(5.8)")
 $ c lt.eq x_n^(\( lambda \)) - 2 n^(- delta) & quad arrow.r.double quad s_n \( c \) gt.eq kappa \,\
c gt.eq x_n^(\( lambda \)) + 2 n^(- delta) & quad arrow.r.double quad s_n \( c \) lt.eq
  K' n^(- gamma) . $ <eq:proper-transfer-low>]

 The constants $K'$ and $n_1$ may depend on the fixed parameters, but not on $c$ or $n$.]
] <lem:proper-transfer>

#proof[
  An auxiliary clause has distinct indices with probability $theta_n$.
    Poisson thinning separates the clauses into a family of $J$ clauses with distinct indices and a family of $Q$
    clauses with an internal repetition, where
  $ J tilde.op "Pois" \( c n theta_n \) \, wide Q tilde.op "Pois" \( c n \( 1 - theta_n \) \) . $
  These counts are independent. Indeed, their joint probability-generating function is
  $ bb(E) \[ z^J w^Q \] = exp #scale(x: 120%, y: 120%)[\(] c n \[ theta_n z + \( 1 - theta_n \) w - 1 \]
    #scale(x: 120%, y: 120%)[\)] = e^(c n theta_n \( z - 1 \)) e^(c n \( 1 - theta_n \) \( w - 1 \)) . $
  The same independent-mark construction shows that, conditional on these counts,
    the marks in the two families are independent with their respective conditional laws.
    In the first family, every unordered set of $k$ distinct variables has $k !$ equally likely orders and the
    signs remain independent and fair. Conditional on $J$, this family therefore has exactly the law $F_(n \, J)$.
  A union bound over the $binom(k, 2)$ pairs of variable positions gives
  $ c n \( 1 - theta_n \) lt.eq c binom(k, 2) lt.eq R . $
  Consequently $c n - R lt.eq bb(E) J lt.eq c n$ and $"Var" \( J \) = bb(E) J lt.eq D n$.
    Deleting the repeated-variable clauses can only help satisfiability.
    Requiring $Q = 0$, which is independent of the proper family and has probability $e^(- c n \( 1 - theta_n \))
    gt.eq e^(- R)$, gives the lower bound. This proves (5.7).
  Write $h = n^(1 - delta)$. The concentration input and the survival identity give,
    for all sufficiently large $n$ and integer $j$,
  $ P_n \( j \) & gt.eq 1 - K n^(- eta) &  & upright("if ") 0 lt.eq j lt.eq n x_n^(\( lambda \)) - h \,\
P_n \( j \) & lt.eq K n^(- eta) &  & upright("if ") j gt.eq n x_n^(\( lambda \)) + h . $
  For the first estimate the indicated counts are below the cap because $x_n^(\( lambda \)) lt.eq b < lambda$.
    For the second, first use (5.2) up to the cap and then use monotonicity beyond it at $j_0 =
    ceil.l n x_n^(\( lambda \)) + h ceil.r$. The inequality $j_0 lt.eq
    M_n^(\( lambda \))$ holds for all sufficiently large $n$: the gap $\( lambda - b \) n$ dominates $h + 2$.
    This also accounts for both integer roundings.
  If $c lt.eq x_n^(\( lambda \)) - 2 n^(- delta)$, then $bb(E) J lt.eq n x_n^(\( lambda \)) - 2 h$.
    Chebyshev’s inequality yields
  $ bb(P) #scale(x: 120%, y: 120%)[\(] J > n x_n^(\( lambda \)) - h #scale(x: 120%, y: 120%)[\)] lt.eq
    frac(D n, h^2) = D n^(- \( 1 - 2 delta \)) . $
  The lower bound in (5.7) is thus at least
  $ e^(- R) #scale(x: 120%, y: 120%)[\(] 1 - K n^(- eta) - D n^(- \( 1 - 2 delta \)) #scale(x: 120%, y: 120%)[\)] \, $
  which is at least $kappa$ for every sufficiently large $n$.
  If $c gt.eq x_n^(\( lambda \)) + 2 n^(- delta)$, then $bb(E) J gt.eq n x_n^(\( lambda \)) + 2 h - R$.
    For large $n$, $h > R$, and
  $ bb(P) #scale(x: 120%, y: 120%)[\(] J < n x_n^(\( lambda \)) + h #scale(x: 120%, y: 120%)[\)] lt.eq
    frac(D n, \( h - R \)^2) = O #scale(x: 120%, y: 120%)[\(] n^(- \( 1 - 2 delta \)) #scale(x: 120%, y: 120%)[\)] . $
  The upper bound in (5.7) is at most this probability plus $K n^(- eta)$, proving (5.8) with $gamma =
    min { eta \, 1 - 2 delta }$. All estimates used the common bounds $R$ and $D n$,
    so they are uniform on $\[ 0 \, D \]$. ◻
]

=== 5.3 Comparing centers at different sizes <comparing-centers-at-different-sizes>

The lower transfer bound (5.8) stays positive, whereas the upper bound (5.8) tends to zero uniformly.
  We use this separation with the product inequality (5.5) to compare the centers.

Let $u = min { r \, s }$, $N = r + s$, and set

$ c = min { x_r^(\( lambda \)) \, x_s^(\( lambda \)) } - 2 u^(- delta) . $

For all sufficiently large $u$, the center bounds in (5.3) put $c$ in $\[ 0 \, D \]$.
  Since $u^(- delta) gt.eq r^(- delta) \, s^(- delta)$, the lower estimate in Lemma 10 applies at both sizes.
  Hence Lemma 9 gives $s_N \( c \) gt.eq kappa^2$. For all sufficiently large $N$,
  the upper estimate in Lemma 10 is smaller than $kappa^2$; it rules out $c gt.eq x_N^(\( lambda \)) +
  2 N^(- delta)$. Therefore

$ x_N^(\( lambda \)) > c - 2 N^(- delta) gt.eq min { x_r^(\( lambda \)) \, x_s^(\( lambda \)) } - 4 u^(- delta) . $

This proves (5.4) for every pair of sufficiently large sizes. No ratio between them was used.

To reach every sufficiently large size from a fixed block size, we will use blocks of sizes $s$ and $s + 1$.
  We therefore also need a neighboring-size comparison. Take $c = x_s^(\( lambda \)) - 2 s^(- delta)$,
  which again lies in $\[ 0 \, D \]$ for large $s$. In the size-one auxiliary model,
  the empty-formula event gives $s_1 \( c \) gt.eq e^(- c) gt.eq e^(- D)$. Consequently

$ s_(s + 1) \( c \) gt.eq s_s \( c \) s_1 \( c \) gt.eq kappa e^(- D) . $

For large $s$, the upper transfer estimate at size $s + 1$ is smaller than this fixed positive constant. It follows that

$ x_(s + 1)^(\( lambda \)) > c - 2 \( s + 1 \)^(- delta) gt.eq x_s^(\( lambda \)) - 4 s^(- delta) \, $

which proves (5.4).

The tree argument below uses the sum comparison only when its child sizes are comparable.

=== 5.4 Summing the errors along a balanced tree <summing-the-errors-along-a-balanced-tree>

The principle that errors summable over geometrically increasing sizes cannot sustain macroscopic drift parallels
  the approximate-superadditivity argument of Abbe and Montanari [1] arXiv version, Lemma 8.
  Here the operation is a minimum of normalized quantities; the following lemma proves the required form directly.

#thm([Lemma 5.4.])[
  (Balanced comparisons).  #emph[Let $n_0 gt.eq 1$ be an integer and let $\( u_n \)_(n gt.eq n_0)$ be a bounded
    real sequence. Suppose that $0 lt.eq A < oo$, $beta > 0$, and that, for all $r \, s gt.eq
    n_0$ with $1 \/ 3 lt.eq r \/ s lt.eq 3$,
$ u_(r + s) gt.eq min { u_r \, u_s } - A min { r \, s }^(- beta) . $

 Suppose also that, for every $s gt.eq n_0$,
$ u_(s + 1) gt.eq u_s - A s^(- beta) . $

 Then $u_n$ converges. More precisely, put
$ B_beta = frac(\( 3 \/ 2 \)^beta, 1 - \( 2 \/ 3 \)^beta) . $

 For every integer $s gt.eq max { n_0 \, 2 }$ and every integer $n gt.eq s^2$,
#[#set math.equation(numbering: n => "(5.9)")
 $ u_n gt.eq u_s - A \( 1 + B_beta \) s^(- beta) . $ <eq:balanced-comparison-bound>]

]
] <lem:balanced-comparison>

#proof[
  Fix an integer $s gt.eq max { n_0 \, 2 }$. For $n gt.eq s^2$, write $n = q s + t$, where $q =
    floor.l n \/ s floor.r gt.eq s$ and $0 lt.eq t < s$. Thus $n$ is a sum of $q -
    t$ blocks of size $s$ and $t$ blocks of size $s + 1$. Both block counts are nonnegative,
    and the neighbor inequality puts the value of every block at least $u_s - A s^(- beta)$.
  Arrange these $q$ blocks in a binary tree by dividing each group of $a gt.eq
    2$ blocks into groups of $floor.l a \/ 2 floor.r$ and $ceil.l a \/ 2 ceil.r$ blocks.
    Each child contains at least $a \/ 3$ blocks, so its total size is at least $s a \/ 3$.
    Moreover, the ratio of the larger child’s total size to the smaller child’s is at most
  $ frac(ceil.l a \/ 2 ceil.r \( s + 1 \), floor.l a \/ 2 floor.r s) lt.eq 2 \( 1 + 1 \/ s \) lt.eq 3 . $
  The sum inequality is therefore valid at every internal node, with error at most $A \( s a \/ 3 \)^(- beta)$.
  Iterating the minimum inequality from the leaves to the root gives a lower bound by the least leaf value minus
    the largest sum of errors on a leaf-to-root path. If $a_1 \, a_2 \,
    dots.h$ are the block counts at the successive internal nodes of such a path, then $a_1 gt.eq
    2$ and $a_(j + 1) gt.eq \( 3 \/ 2 \) a_j$, because a child contains at most two thirds of its parent’s blocks.
    Every path error is consequently at most
  $ A s^(- beta) \( 3 \/ 2 \)^beta sum_(j = 0)^oo \( 2 \/ 3 \)^(j beta) = A B_beta s^(- beta) . $
  This proves (5.9). First let $n arrow.r oo$ with $s$ fixed to obtain
  $ liminf_(n arrow.r oo) u_n gt.eq u_s - A \( 1 + B_beta \) s^(- beta) . $
  Taking the limsup as $s arrow.r oo$ gives $liminf_n u_n gt.eq limsup_n u_n$.
    Boundedness makes both quantities finite, and hence $u_n$ converges. ◻
]

#proof[
  #emph[Completion of Theorem 8.] Apply Lemma 11 to (5.4)–(5.4), with $A = 4$ and $beta = delta$.
    It gives convergence, and the center bounds place the limit $alpha$ in $\[ a \, b \]$.
  Fix $0 lt.eq c < alpha$. Since $x_n^(\( lambda \)) arrow.r alpha$ and $n^(- delta) arrow.r 0$,
    for all sufficiently large $n$, $floor.l c n floor.r lt.eq n x_n^(\( lambda \)) - n^(1 - delta)$.
    This count lies below the cap, and (5.3) together with (5.2) gives $P_n \( floor.l c n floor.r \) gt.eq 1 -
    K n^(- eta) arrow.r 1$.
  Now fix $c > alpha$, and choose a real $d$ with $alpha < d < min { c \, lambda }$,
    which is possible because $alpha lt.eq b < lambda$. For large $n$,
    the integer $floor.l d n floor.r$ lies below the cap and is at least $n x_n^(\( lambda \)) + n^(1 - delta)$.
    The same two estimates give $P_n \( floor.l d n floor.r \) lt.eq K n^(- eta) arrow.r 0$.
    Monotonicity then yields $P_n \( floor.l c n floor.r \) lt.eq P_n \( floor.l d n floor.r \) arrow.r 0$. ◻
]

=== 5.5 Application to every fixed clause size <application-to-every-fixed-clause-size>

We finish by checking the inputs for the statistic used in this paper.
  This also identifies the repetition constant furnished by the general transfer lemma.

#proof[
  Fix $k gt.eq 3$. Recall $L_k = 2^(k + 1)$, $V_n = min { H_n - 1 \, L_k n }$, and $mu_n = bb(E) V_n \/ n$.
    Since $L_k$ is an integer, the definitions in (5.1) with $lambda = L_k$ give exactly $V_n^(\( L_k \)) =
    V_n$ and $x_n^(\( L_k \)) = mu_n$.
  Proposition 6 supplies the tail estimate in (5.3) with
  $ delta = delta_k = frac(k - 2, 4 k) \, wide eta = eta_k = frac(k - 2, 2 k) \, $
  and some $K = K_k < oo$. These exponents satisfy $0 < delta < 1 \/ 2$ and $eta > 0$.
    Lemma 7 supplies the center bounds with $a = a_0$ and $b = 2^k + 1 < L_k$.
  For the transfer in this application choose $D = L_k > b$. Then
  $ R = L_k binom(k, 2) \, wide 1 - 2 delta = frac(k + 2, 2 k) > eta \, wide gamma = eta \, wide kappa = e^(- R) / 2 . $
  Thus all hypotheses of Theorem 8 hold with the stated cap, center bounds, and exponents.
    It follows that $mu_n arrow.r alpha_k in \[ a_0 \, 2^k + 1 \]$ and that the proper-clause satisfiability
    probabilities tend to one for $0 lt.eq c < alpha_k$ and to zero for $c > alpha_k$, as claimed. ◻
]

== 6 Three-clause refinements <sec:three-clause>

For three literals per clause, a first moment at density six improves the center bound enough to use the
  comparison interval $\[ 0 \, 8 \]$, including for the main cap $16 n$.
  We also compare that statistic with last-satisfiable and first-unsatisfiable indices capped at $10 n$.
  Changing the cap of the last-satisfiable index has an exponentially small effect on its normalized mean.
  Comparison with the first unsatisfiable index also includes a one-step shift.

Throughout this section the clauses are independent uniformly signed proper triples, sampled with replacement,
  and $n gt.eq 3$. Recall the first unsatisfiable index $H_n$, and write

#[#set math.equation(numbering: n => "(6.1)")
 $ W_n = min { H_n - 1 \, 10 n } \, wide T_n = min { H_n \, 10 n } \, wide V_n = min { H_n - 1 \,
   16 n } . $ <eq:three-statistics>]

Thus $V_n$ is the statistic of the main proof at $k = 3$.
  Put $nu_n = bb(E) W_n \/ n$, while $mu_n = bb(E) V_n \/ n$ as before. For integer $m$,

#[#set math.equation(numbering: n => "(6.2)")
 $ P_n \( m \) & = bb(P) \( W_n gt.eq m \) &  & quad \( 0 lt.eq m lt.eq 10 n \) \,\
P_n \( m \) & = bb(P) \( T_n > m \) &  & quad \( 0 lt.eq m < 10 n \) . $ <eq:three-survival>]

Only the last-satisfiable identity includes its capped endpoint.

=== 6.1 The density-six bound and changes of cap <the-density-six-bound-and-changes-of-cap>

Each fixed assignment satisfies a proper triple with probability $7 \/ 8$, so $P_n \( m \) lt.eq
  2^n \( 7 \/ 8 \)^m$. Set

$ sigma = 2 \( 7 \/ 8 \)^6 < 1 \, wide rho = 2 \( 7 \/ 8 \)^10 < 1 . $

The survival-sum identity for the positive integer $H_n$ gives the cap-independent bound

#[#set math.equation(numbering: n => "(6.3)")
 $ bb(E) H_n = sum_(m gt.eq 0) P_n \( m \) lt.eq 6 n + sum_(m gt.eq 6 n) 2^n \( 7 \/ 8 \)^m = 6 n +
   8 sigma^n . $ <eq:three-h-mean>]

In particular, the normalized means of $W_n \, T_n \, V_n$ are all at most seven for large $n$.
  Splitting at $6 n$ also gives the direct estimate

#[#set math.equation(numbering: n => "(6.4)")
 $ nu_n lt.eq 6 + 4 P_n \( 6 n \) lt.eq 6 + 4 sigma^n . $ <eq:three-center>]

The matching argument in Lemma 7 gives $P_n \( floor.l c_0 n floor.r \) = 1 -
  o \( 1 \)$ whenever $c_0 > 0$ and $e^2 c_0 < 1$. These clause counts lie below both caps,
  so there is $a_0 > 0$ such that

#[#set math.equation(numbering: n => "(6.5)")
 $ a_0 lt.eq nu_n lt.eq mu_n lt.eq 7 wide upright("for all sufficiently large ") n . $ <eq:three-anchors>]

The improved upper bound therefore applies to either cap.

The exact relations explain the distinction between first and last indices at the capped endpoint.
  With the common cap $10 n$,

#[#set math.equation(numbering: n => "(6.6)")
 $ W_n = T_n - 1 + upright(bold(1))_({ H_n > 10 n }) = T_n - 1 +
   upright(bold(1))_({ F_(n \, 10 n) in upright("SAT") }) . $ <eq:three-same-cap>]

If $H_n lt.eq 10 n$, the indices differ by one; otherwise both equal $10 n$.
  To compare $V_n$ with $T_n - 1$, count the extra satisfiable prefixes:

#[#set math.equation(numbering: n => "(6.7)")
 $ V_n = T_n - 1 + E_n \, wide E_n = sum_(m = 10 n)^(16 n) upright(bold(1))_({ H_n > m }) \,\
0 lt.eq E_n lt.eq \( 6 n + 1 \) upright(bold(1))_({ H_n > 10 n }) . $ <eq:three-cross-cap>]

The first term is necessary: $H_n = 10 n + 1$ gives $E_n = 1$.
  Since $P_n \( 10 n \) lt.eq rho^n$, these identities imply

#[#set math.equation(numbering: n => "(6.8)")
 $ 0 lt.eq bb(E) V_n - \( bb(E) T_n - 1 \) & lt.eq \( 6 n + 1 \) rho^n \,\
\| "sd" \( V_n \) - "sd" \( T_n \) \| & lt.eq \( 6 n + 1 \) rho^(n \/ 2) . $ <eq:three-mean-bridge>]

For the second estimate, center the identity $V_n = T_n - 1 +
  E_n$ and apply the reverse triangle inequality in $L^2$, using $"sd" \( E_n \)
  lt.eq \( bb(E) E_n^2 \)^(1 \/ 2)$. Similarly,

#[#set math.equation(numbering: n => "(6.9)")
 $ 0 lt.eq V_n - W_n lt.eq 6 n upright(bold(1))_({ H_n > 10 n }) \, wide 0 lt.eq mu_n - nu_n lt.eq
   6 rho^n . $ <eq:three-last-cap-bridge>]

Thus $nu_n arrow.r alpha_3$, since the main proof already gives $mu_n arrow.r alpha_3$.

=== 6.2 Numerical forcing bound and concentration <numerical-forcing-bound-and-concentration>

The replacement parameters of Lemma 2 become $v = n - 1$, $epsilon = n^(- 2 \/ 3)$, and $g =
  ceil.l 6 n^(1 \/ 3) ceil.r$, for $n gt.eq 4$. For a satisfiable background $B$, put $b = b \( B \)$ and $x =
  q_2 \( B \) = b \( b - 1 \) \/ \( 4 v \( v - 1 \) \)$. When $x > epsilon$,
  the proof of that lemma gives $b gt.eq 3$, and the exact killing probabilities read

#[#set math.equation(numbering: n => "(6.10)")
 $ q_3 \( B \) = x^(3 \/ 2) frac(b - 2, sqrt(b \( b - 1 \))) frac(sqrt(v \( v - 1 \)), v - 2) gt.eq 1 /
   3 x^(3 \/ 2) . $ <eq:three-killing>]

Here $b - 2 gt.eq b \/ 3$, $sqrt(b \( b - 1 \)) lt.eq b$, and $sqrt(v \( v - 1 \)) gt.eq v - 2$.
  Thus $g q_3 \( B \) > 2 x$, and the lemma’s independent-block estimate is $1 - \( 1 - q_3 \( B \) \)^g gt.eq 1 -
  e^(- 2 x) gt.eq x$. Together with the case $x lt.eq epsilon$, this recovers the uniform replacement loss $epsilon$.

The numerical forcing bound follows directly from (2.8) with $k = 3$ and $M = 10 n$:

#[#set math.equation(numbering: n => "(6.11)")
 $ sum_(j = 0)^(10 n) bb(E) frac(b \( F_(n \, j) \), n) lt.eq
   30 e^30 ceil.l 6 n^(1 \/ 3) ceil.r + \( 150 n + 15 \) n^(- 2 \/ 3) = O \( n^(1 \/ 3) \) . $ <eq:three-forcing>]

The constant $30$ is the maximum mean incidence count $3 M \/ n$.
  The general proof supplies the conditioning and telescoping needed for this estimate, including the prefix $j = 10 n$.

Concentration at the smaller cap follows even more directly from the main variance bound:
  $W_n = min { V_n \, 10 n }$. If $V'_n$ is an independent copy of $V_n$ and $W'_n = min { V'_n \, 10 n }$,
  truncation is $1$-Lipschitz, so

$ "Var" \( W_n \) = 1 / 2 bb(E) \( W_n - W'_n \)^2 lt.eq 1 / 2 bb(E) \( V_n - V'_n \)^2 = "Var" \( V_n \) . $

Proposition 6 and Chebyshev’s inequality give

#[#set math.equation(numbering: n => "(6.12)")
 $ "Var" \( W_n \) = O \( n^(5 \/ 3) \) \, wide bb(P) #scale(x: 120%, y: 120%)[\(] \| W_n - n nu_n \| gt.eq
   n^(11 \/ 12) #scale(x: 120%, y: 120%)[\)] = O \( n^(- 1 \/ 6) \) . $ <eq:three-concentration>]

The same powers hold for $V_n$, with its own finite-size mean.

=== 6.3 The comparison range is independent of the cap <the-comparison-range-is-independent-of-the-cap>

In the auxiliary model, an ordered triple has distinct variable indices with probability

$ theta.alt_n = frac(\( n \)_3, n^3) = 1 - 3 / n + 2 / n^2 . $

At density $c$, Poisson thinning separates a proper-clause count $J tilde.op
  "Pois" \( c n theta.alt_n \)$ from an independent repeated-variable family with mean count $c \( 3 - 2 \/ n \)$.
  Therefore Lemma 10 gives, for every fixed $D gt.eq 0$ and $0 lt.eq c lt.eq D$,

#[#set math.equation(numbering: n => "(6.13)")
 $ e^(- 3 D) bb(E) P_n \( J \) lt.eq s_n \( c \) lt.eq bb(E) P_n \( J \) \, wide c n - 3 D lt.eq bb(E) J lt.eq
   c n \, wide "Var" \( J \) lt.eq D n . $ <eq:three-density-sandwich>]

The parameter $D$ controls the density at which probabilities are compared.
  The proof of Theorem 8 requires $D > b$; it need not equal the cap.

By (6.5) and (6.12), both $\( lambda \, x_n^(\( lambda \)) \) = \( 10 \, nu_n \)$ and
  $\( lambda \, x_n^(\( lambda \)) \) = \( 16 \, mu_n \)$ satisfy that theorem’s inputs with

#[#set math.equation(numbering: n => "(6.14)")
 $ \( a \, b \, delta \, eta \) = (a_0 \, 7 \, 1 / 12 \, 1 / 6) \, wide \( D \, R \, gamma \, kappa \) =
   (8 \, 24 \, 1 / 6 \, e^(- 24) / 2) . $ <eq:three-engine-parameters>]

Here $b < lambda$ for either cap, $D > b$, and $gamma = min { eta \, 1 - 2 delta } = 1 \/ 6$.
  On $\[ 0 \, 8 \]$, the repetition mean is at most $24$, so the sandwich is

#[#set math.equation(numbering: n => "(6.15)")
 $ e^(- 24) bb(E) P_n \( J \) lt.eq s_n \( c \) lt.eq bb(E) P_n \( J \) \, wide c n - 24 lt.eq bb(E) J lt.eq
   c n \, wide "Var" \( J \) lt.eq 8 n . $ <eq:three-poisson-sandwich>]

For either choice $z_n = nu_n$ or $z_n = mu_n$, there is an absolute constant $K_8 < oo$ such that,
  uniformly on $0 lt.eq c lt.eq 8$ for all sufficiently large $n$,

#[#set math.equation(numbering: n => "(6.16)")
 $ c lt.eq z_n - 2 n^(- 1 \/ 12) & arrow.r.double s_n \( c \) gt.eq e^(- 24) \/ 2 \,\
c gt.eq z_n + 2 n^(- 1 \/ 12) & arrow.r.double s_n \( c \) lt.eq K_8 n^(- 1 \/ 6) . $ <eq:three-transfer-low>]

The theorem also gives the corresponding size comparisons for either choice of center:

#[#set math.equation(numbering: n => "(6.17)")
 $ z_(r + s) & gt.eq min { z_r \, z_s } - 4 min { r \, s }^(- 1 \/ 12) \,\
z_(s + 1) & gt.eq z_s - 4 s^(- 1 \/ 12) \, $ <eq:three-center-sum>]

for all sufficiently large relevant sizes, without a restriction on $r \/ s$ in the first inequality.

If probabilities are instead compared over the wider interval $\[ 0 \, 16 \]$, the same calculation gives $R =
  48$, lower sandwich factor $e^(- 48)$, and lower-transfer constant $e^(- 48) \/ 2$.
  These are the constants obtained from the generic choices $lambda = 16$, $b = 9$, and $D =
  16$ in the main proof. The sharper mean bound permits $D = 8$ for that same cap, while the $D =
  16$ calculation covers a larger range of densities.

== 7 Lower arities and finite-size information <sec:boundaries>

The balanced comparison gives a one-sided quantitative bound on the finite-size centers.
  In (5.9), take $u_n = mu_n$, $A = 4$, and $beta = delta_k$, then let the larger size tend to infinity.
  For every sufficiently large integer $s$,

#[#set math.equation(numbering: n => "(7.1)")
 $ mu_s lt.eq alpha_k + C_k s^(- delta_k) \, wide C_k =
   4 (1 + frac(\( 3 \/ 2 \)^(delta_k), 1 - \( 2 \/ 3 \)^(delta_k))) . $ <eq:one-sided-center-rate>]

Thus the center cannot exceed its limit by more than the stated error.
  The proof gives no corresponding bound on $alpha_k - mu_s$,
  and hence no effective two-sided rate for approximating $alpha_k$.
  Proposition 6 controls fluctuations about $bb(E) V_n$; it does not place a two-sided window of width
  $n^(1 - delta_k)$ around $alpha_k n$. All constants concern a fixed $k$, and are not uniform when $k$ grows with $n$.

#prodef([Remark 7.1.])[
  (The two-clause boundary).  Chvátal and Reed [7] Theorems 3–4 proved that independent uniform clauses on two
    distinct variables, sampled with replacement, are satisfiable with probability tending to one below density
    $1$ and unsatisfiable with probability tending to one above density $1$.
    Goerdt [15] obtained the threshold independently. Thus $alpha_2 = 1$ in the same proper-clause convention.
    This is a separate theorem: the bound $O_k \( n^(1 + 2 \/ k) \)$ is only $O \( n^2 \)$ at $k =
    2$ and gives no sublinear concentration window there.
] <rem:two>

#prodef([Remark 7.2.])[
  (The unit-clause boundary).  For $k = 1$, the threshold on the linear-density scale is zero.
    Fix $c > 0$, choose $0 < c' < c$, and Poissonize the number of independent uniform unit clauses at mean $c'
    n$. For each variable, the positive and negative occurrence counts are independent $"Pois" \( c' \/ 2 \)$
    variables, independently across variables. The formula is satisfiable exactly when no variable receives both
    signs, an event of probability
  $ #scale(x: 120%, y: 120%)[\(] 2 e^(- c' \/ 2) - e^(- c') #scale(x: 120%, y: 120%)[\)]^n arrow.r 0 . $
  The Poisson clause count is at most $floor.l c n floor.r$ with probability tending to one.
    Monotonicity in the clause count therefore implies that the fixed-count unit-clause formula is unsatisfiable
    with probability tending to one at every $c > 0$. At density zero it is empty and satisfiable.
] <rem:unit>

#heading(level: 1)[References]
#bibitem([1])[E.~Abbe and A.~Montanari, #emph[On the concentration of the number of solutions of random
  satisfiability formulas], Random Structures Algorithms #strong[45] (2014), no.~3, 362--382.
  #link("https://doi.org/10.1002/rsa.20501")[doi:10.1002/rsa.20501]\;
  #link("https://arxiv.org/abs/1006.3786v1")[arXiv:1006.3786v1].]
#bibitem([2])[D.~Achlioptas and Y.~Peres, #emph[The threshold for random $k$-SAT is $2^k log 2 - O \( k \)$], J.
  Amer. Math. Soc. #strong[17] (2004), no.~4, 947--973.
  #link("https://doi.org/10.1090/S0894-0347-04-00464-3")[doi:10.1090/S0894-0347-04-00464-3].]
#bibitem([3])[M.~Bayati, D.~Gamarnik, and P.~Tetali, #emph[Combinatorial approach to the interpolation method and
  scaling limits in sparse random graphs], Ann. Probab. #strong[41] (2013), no.~6, 4080--4115.
  #link("https://doi.org/10.1214/12-AOP816")[doi:10.1214/12-AOP816]\;
  #link("https://arxiv.org/abs/0912.2444v3")[arXiv:0912.2444v3].]
#bibitem([4])[S.~Boucheron, O.~Bousquet, G.~Lugosi, and P.~Massart,
  #emph[Moment inequalities for functions of independent random variables], Ann. Probab.
  #strong[33] (2005), no.~2, 514--560.
  #link("https://doi.org/10.1214/009117904000000856")[doi:10.1214/009117904000000856]\;
  #link("https://arxiv.org/abs/math/0503651v1")[arXiv:math/0503651v1] (electronic reprint).]
#bibitem([5])[G.~Carenini, #emph[A polynomial scaling window for random $k$-SAT and a proof of the satisfiability
  conjecture], Electronic Colloquium on Computational Complexity, Report TR26-229 (2026),
  published 5 October 2026. #link("https://eccc.weizmann.ac.il/report/2026/229/")[ECCC Report TR26-229].]
#bibitem([6])[G.~Carenini, #emph[The Scaling Window of Random $k$-SAT],
  Electronic Colloquium on Computational Complexity, Report TR26-145 (2026), preprint;
  #link("https://arxiv.org/abs/2609.26222v1")[arXiv:2609.26222v1].
  #link("https://eccc.weizmann.ac.il/report/2026/145/")[ECCC Report TR26-145].]
#bibitem([7])[V.~Chvátal and B.~Reed, #emph[Mick Gets Some (the Odds Are on His Side)], Proc.
  33rd Annual Symposium on Foundations of Computer Science (1992), 620--627.
  #link("https://doi.org/10.1109/SFCS.1992.267789")[doi:10.1109/SFCS.1992.267789].
  #link("https://www.diochnos.com/teaching/CS5970/2020F/project-papers/ChvatalReed.pdf")[conference paper PDF].]
#bibitem([8])[A.~Coja-Oghlan and K.~Panagiotou, #emph[The asymptotic $k$-SAT threshold], Adv. Math.
  #strong[288] (2016), 985--1068.
  #link("https://doi.org/10.1016/j.aim.2015.11.007")[doi:10.1016/j.aim.2015.11.007]\;
  #link("https://arxiv.org/abs/1310.2728v6")[arXiv:1310.2728v6].]
#bibitem([9])[J.~Ding, A.~Sly, and N.~Sun, #emph[Proof of the satisfiability conjecture for large $k$], Ann.
  of Math. (2) #strong[196] (2022), no.~1, 1--388.
  #link("https://doi.org/10.4007/annals.2022.196.1.1")[doi:10.4007/annals.2022.196.1.1]\;
  #link("https://arxiv.org/abs/1411.0650v3")[arXiv:1411.0650v3].]
#bibitem([10])[B.~Efron and C.~Stein, #emph[The jackknife estimate of variance], Ann. Statist.
  #strong[9] (1981), no.~3, 586--596. #link("https://doi.org/10.1214/aos/1176345462")[doi:10.1214/aos/1176345462].]
#bibitem([11])[J.~Franco and A.~Van Gelder, #emph[A perspective on certain polynomial-time solvable classes of
  satisfiability], Discrete Appl. Math. #strong[125] (2003), nos.~2--3, 177--214.
  #link("https://doi.org/10.1016/S0166-218X(01)00358-4")[doi:10.1016/S0166-218X(01)00358-4].
  See also the
  #link("https://citeseerx.ist.psu.edu/document?doi=a79e4c87237fc557de1acc74371bc986f575a571&repid=rep1&type=pdf")[author
  manuscript dated 7 August 1998], Section~8.]
#bibitem([12])[S.~Franz and M.~Leone, #emph[Replica bounds for optimization problems and diluted spin systems], J.
  Statist. Phys. #strong[111] (2003), 535--564.
  #link("https://doi.org/10.1023/A:1022885828956")[doi:10.1023/A:1022885828956]\;
  #link("https://arxiv.org/abs/cond-mat/0208280v1")[arXiv:cond-mat/0208280v1].]
#bibitem([13])[S.~Franz, M.~Leone, and F.~L.~Toninelli, #emph[Replica bounds for diluted non-Poissonian spin
  systems], J. Phys. A #strong[36] (2003), no.~43, 10967--10985.
  #link("https://doi.org/10.1088/0305-4470/36/43/021")[doi:10.1088/0305-4470/36/43/021]\;
  #link("https://arxiv.org/abs/cond-mat/0307367v2")[arXiv:cond-mat/0307367v2].]
#bibitem([14])[E.~Friedgut, with an appendix by J.~Bourgain, #emph[Sharp thresholds of graph properties,
  and the $k$-SAT problem], J. Amer. Math. Soc. #strong[12] (1999), no.~4, 1017--1054.
  #link("https://doi.org/10.1090/S0894-0347-99-00305-7")[doi:10.1090/S0894-0347-99-00305-7].]
#bibitem([15])[A.~Goerdt, #emph[A threshold for unsatisfiability], J. Comput. System Sci.
  #strong[53] (1996), no.~3, 469--486. #link("https://doi.org/10.1006/jcss.1996.0081")[doi:10.1006/jcss.1996.0081].]
#bibitem([16])[F.~Guerra and F.~L.~Toninelli, #emph[The thermodynamic limit in mean field spin glass models],
  Comm. Math. Phys. #strong[230] (2002), no.~1, 71--79.
  #link("https://doi.org/10.1007/s00220-002-0699-y")[doi:10.1007/s00220-002-0699-y]\;
  #link("https://arxiv.org/abs/cond-mat/0204280v1")[arXiv:cond-mat/0204280v1].]
#bibitem([17])[P.~Hall, #emph[On representatives of subsets], J. London Math. Soc.
  #strong[10] (1935), no.~1, 26--30. #link("https://doi.org/10.1112/jlms/s1-10.37.26")[doi:10.1112/jlms/s1-10.37.26].]
#bibitem([18])[S.~Mertens, M.~Mézard, and R.~Zecchina, #emph[Threshold values of random $K$-SAT from the cavity
  method], Random Structures Algorithms #strong[28] (2006), no.~3, 340--373.
  #link("https://doi.org/10.1002/rsa.20090")[doi:10.1002/rsa.20090]\;
  #link("https://arxiv.org/abs/cs/0309020v2")[arXiv:cs/0309020v2].]
#bibitem([19])[M.~Mézard, G.~Parisi, and R.~Zecchina, #emph[Analytic and algorithmic solution of random
  satisfiability problems], Science #strong[297] (2002), no.~5582, 812--815.
  #link("https://doi.org/10.1126/science.1073287")[doi:10.1126/science.1073287].]
#bibitem([20])[J.~M.~Steele, #emph[An Efron--Stein inequality for nonsymmetric statistics], Ann. Statist.
  #strong[14] (1986), no.~2, 753--758. #link("https://doi.org/10.1214/aos/1176349952")[doi:10.1214/aos/1176349952].]
