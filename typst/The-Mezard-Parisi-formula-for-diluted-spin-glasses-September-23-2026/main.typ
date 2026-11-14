#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[The Mézard--Parisi formula for diluted spin glasses]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A diluted spin glass has a finite mean number of interactions per spin.
  Its local environment remains random as the system grows,
  and the cavity method describes that environment through a distribution of local fields.
  When many competing states contribute to the partition function,
  the proposed order parameter is a hierarchy of distributions of these fields.
  The thermodynamic question is whether this hierarchy determines the limiting expected log partition function per
  spin. We call this quantity #emph[pressure]. At inverse temperature $beta$,
  the usual physical free energy per spin is its negative divided by $beta$.

The Viana–Bray model is a classical diluted two-spin model #cite(label("VB85")).
  Mézard and Parisi #cite(label("MP01")) developed the hierarchical cavity picture for the fixed-connectivity
  Bethe-lattice spin glass, with an explicit one-step replica-symmetry-breaking functional.
  Franz and Leone #cite(label("FL03")) adapted Guerra’s interpolation method #cite(label("Guerra03")) to diluted
  systems and obtained replica-symmetric and one-step pressure bounds for even-arity models.
  Panchenko and Talagrand #cite(label("PT04")) then proved the arbitrary finite-level hierarchical upper bounds
  considered here.

We prove that the infimum of these bounds is the limiting pressure.
  This resolves the equality conjecture stated immediately after Theorem 4 of
  Panchenko–Talagrand #cite(label("PT04")), for their Poisson,
  even-arity Ising model class with factorized interactions and the specified positivity condition.
  Only first moments of the interaction and external field are required.
  The result includes the Viana–Bray model, diluted even-spin models with symmetric couplings,
  and soft random even-$K$ SAT at every positive temperature.
  The exact model and trial functional are defined in 2; the named models and their expected ground-state limits
  are treated in 10.

An exact variational description and reduction to a prescribed trial class are distinct problems.
  The cavity variational principle of Aizenman, Sims and Starr #cite(label("ASS03")) for the
  Sherrington–Kirkpatrick model has a Viana–Bray counterpart in De Sanctis’s formulation over random multioverlap
  structures #cite(label("DeSanctis04")). Panchenko’s spin-distribution approach #cite(label("Pan13"))
  Theorems 1–2 gives an exact variational formula over invariant exchangeable spin distributions.
  Under their positivity condition, Coja-Oghlan and Perkins #cite(label("COP19")) obtain an invariant-kernel
  variational formula for random regular factor graphs. These results use different descriptions of the state from
  the finite hierarchy of message laws optimized here. The additional task is to recover the specific hierarchical
  cavity functional without losing the pressure.

Panchenko #cite(label("Pan16")) Theorem 2 established a hierarchical single-site representation for finite-RSB
  asymptotic Gibbs measures of suitably modified models; approximation of general states by that class remains a
  separate step. Biswas, Chen and Sen #cite(label("BCS25")) Theorem 1.1 and Proposition 1.4 obtain exact
  replica-symmetric pressure formulas in high-temperature and critical or subcritical regimes for compact real
  spin spaces under moment and regularity assumptions. For the zero-field Ising spin glass with Rademacher
  couplings on random regular graphs, Concetti #cite(label("Concetti25")) Theorem 1.3 gives a
  full-replica-symmetry-breaking pressure bound no larger than each optimized finite-level bound;
  equality with that functional is conjectural in that work.
  The result here identifies the finite-depth Panchenko–Talagrand infimum at arbitrary density in its stated
  interaction class.

The main obstacle is the distribution of spins seen across several replicas, that is,
  several samples from the same Gibbs system. The probability of each replica-spin pattern depends on products of
  every subset of those spins. The spatial average of such a product is a #emph[multioverlap];
  pair overlaps alone do not determine all these patterns. This is the information isolated by the
  spin-distribution approach #cite(label("Pan13")). To compare a cavity insertion with independent hierarchical
  messages, we must control all finite multioverlaps before redrawing the message roots independently.

We work with finite auxiliary hierarchies before taking the thermodynamic limit.
  Their branching is part of the construction; no ultrametric organization of the physical Gibbs states is
  assumed. Bounded perturbations yield identities for prescribed replica branching patterns.
  Delaying each branching depth by one level permits an induction that concentrates multioverlaps #emph[on average
  over branching depths]. The cavity insertion itself has an expansion averaging over finite trees,
  so this averaged control is sufficient. The system size tends to infinity at each fixed depth;
  only then does the depth increase. The proof strategy following 1 explains how the finite-tree calculus,
  concentration and independent-message comparison fit together.

== 2 The model and the variational principle <model:section>

Fix an even integer $p gt.eq 2$ and $alpha > 0$. Let $theta$ be a random real function on ${ - 1 \,
  1 }^p$ and let $h$ be a real random variable. Write $B \( theta \) = max_s \| theta \( s \) \|$ and assume

#[#set math.equation(numbering: n => "(2.1)")
 $ bb(E) B \( theta \) + bb(E) \| \| h < oo . $ <model:integrability>]

For independent $M_N tilde.op "Poisson" \( alpha N \)$, independent copies $theta_k$ of $theta$,
  independent copies $h_i$ of $h$, and independent uniform indices $i_(ell \, k) in \[ N \] = { 1 \, dots.h \, N }$, set

#[#set math.equation(numbering: n => "(2.2)")
 $ - H_N \( sigma \) = sum_(k = 1)^(M_N) theta_k \( sigma_(i_(1 \, k)) \, dots.h \, sigma_(i_(p \, k)) \) +
   sum_(i = 1)^N h_i sigma_i \,\
Z_N = sum_(sigma in { - 1 \, 1 }^N) e^(- H_N \( sigma \)) \, wide F_N = 1 / N bb(E) log Z_N . $ <model:hamiltonian>]

All families in this definition are mutually independent. In particular, indices are sampled with replacement.
  The model parameters and disorder laws are fixed as $N$ varies.

The interaction hypotheses are the existence of a representation

#[#set math.equation(numbering: n => "(2.3)")
 $ e^(theta \( s_1 \, dots.h \, s_p \)) = a (1 + b product_(ell = 1)^p f_ell \( s_ell \)) \,
   wide \| b product_(ell = 1)^p f_ell \( s_ell \) \| < 1 quad upright("a.s.") \, $ <model:factorization>]

for every spin tuple, where $a > 0$ and $b$ are real random variables, the $f_ell : { - 1 \, 1 } arrow.r
  bb(R)$ are independent copies of one random function, $b$ is independent of them, and

#[#set math.equation(numbering: n => "(2.4)")
 $ bb(E) \[ \( - b \)^n \] gt.eq 0 wide \( n gt.eq 1 \) . $ <model:positivity>]

The expectations in (2.4) are interpreted as finite real expectations.
  This is automatic in the nondegenerate case: independence and the strict product bound force $b$ and $max_s \|
  f_1 \( s \) \|$ to be essentially bounded, as shown in 9.
  If the product term vanishes identically, the interaction is spin independent and one may take $b = 0$.
  The multiplier $a$ may depend on all the other variables in the representation;
  no separate integrability of $log a$ is assumed.

=== 2.1 The hierarchical cavity functional <the-hierarchical-cavity-functional>

We give the power-mean form of the Panchenko–Talagrand functional #cite(label("PT04")) Section 5.
  A message $x$ specifies a probability distribution on one spin.
  The site term inserts a new spin with its incident interactions;
  the edge term corrects for interactions counted in that insertion.

For $x in bb(R)$ let $q_x \( s \) = e^(x s) \/ \( 2 cosh x \)$. Define

#[#set math.equation(numbering: n => "(2.5)")
 $ C_theta \( x_1 \, dots.h \, x_p \) & = sum_(s in { - 1 \, 1 }^p) e^(theta \( s \)) product_(ell = 1)^p
   q_(x_ell) \( s_ell \) \,\
U_theta \( x_1 \, dots.h \, x_(p - 1) \; epsilon \) & = log sum_(s in { - 1 \, 1 }^(p - 1))
  e^(theta \( s_1 \, dots.h \, s_(p - 1) \, epsilon \)) product_(ell = 1)^(p - 1) q_(x_ell) \( s_ell \) .
  $ <model:edge>]

Both $\| log C_theta \|$ and $\| U_theta \|$ are bounded by $B \( theta \)$, uniformly in the messages.

Write $cal(P) \( E \)$ for the Borel probability measures on $E$.
  Let $cal(M)_1 = cal(P) \( bb(R) \)$ and $cal(M)_(j + 1) = cal(P) \( cal(M)_j \)$,
  equipped with the topology of weak convergence and its Borel sigma-field.
  Fix $r gt.eq 1$, $zeta in cal(M)_(r + 1)$, and $0 < m_1 < dots.h.c < m_r < 1$.
  For each message label $omega$ independently, draw

#[#set math.equation(numbering: n => "(2.6)")
 $ eta_0^omega tilde.op zeta \, wide eta_(d + 1)^omega divides eta_d^omega tilde.op eta_d^omega
   med \( 0 lt.eq d lt.eq r - 2 \) \, wide x^omega divides eta_(r - 1)^omega tilde.op eta_(r - 1)^omega .
   $ <model:chain>]

At $r = 1$, this means that each label first draws a random probability measure $eta_0$ with law $zeta$,
  then draws $x$ with law $eta_0$. Higher levels repeat this sampling of measures.
  All these variables are independent of the physical disorder.
  Use different labels for $x_1 \, dots.h \, x_p$ and for $x_ell^j$, $j gt.eq 1$, $1 lt.eq ell < p$.
  Take independent $k tilde.op "Poisson" \( alpha p \)$, $theta \, theta_1 \, dots.h$, and $h$, and put

#[#set math.equation(numbering: n => "(2.7)")
 $ V_(upright(s)) & = 1 / 2 sum_(epsilon = plus.minus 1) exp
   (h epsilon + sum_(j = 1)^k U_(theta_j) \( x_1^j \, dots.h \, x_(p - 1)^j \; epsilon \)) \,\
V_(upright(e)) & = C_theta \( x_1 \, dots.h \, x_p \) . $ <model:vs>]

For $0 lt.eq d < r$, let $cal(F)_d$ be generated by all the physical disorder in these expressions and all
  $eta_j^omega$, $0 lt.eq j lt.eq d$. Set

#[#set math.equation(numbering: n => "(2.8)")
 $ T_r V = V \, wide T_d V = (bb(E) \[ \( T_(d + 1) V \)^(m_(d + 1)) divides cal(F)_d \])^(1 \/ m_(d + 1))
   quad \( d = r - 1 \, dots.h \, 0 \) . $ <model:power-means>]

Only auxiliary messages are integrated in these conditional expectations.
  For example, at depth one, $T_0 V = \( bb(E)_x \[ V^(m_1) divides bold(eta)_0 \] \)^(1 \/ m_1)$.
  At depth two, each label draws $eta_0 tilde.op zeta$, then $eta_1 divides eta_0 tilde.op eta_0$,
  and then $x divides eta_1 tilde.op eta_1$, and

$ T_0 V =
  (bb(E)_(bold(eta)_1) [(bb(E)_(bold(x)) \[ V^(m_2) divides bold(eta)_1 \])^(m_1 \/ m_2) thin mid(bar.v) thin
  bold(eta)_0])^(1 \/ m_1) . $

Here bold symbols collect all message labels in $V$; physical disorder is held fixed throughout,
  including in the two abbreviated displays. Define

#[#set math.equation(numbering: n => "(2.9)")
 $ cal(B)_r \( zeta \, upright(bold(m)) \) = log 2 + bb(E) log T_0 V_(upright(s)) -
   alpha \( p - 1 \) bb(E) log T_0 V_(upright(e)) \, wide Phi_r =
   inf_(zeta \, thin upright(bold(m))) cal(B)_r \( zeta \, upright(bold(m)) \) . $ <model:functional>]

At $r = 0$, the messages are independent with common law $zeta in
  cal(P) \( bb(R) \)$ and the operators $T_d$ are omitted; this defines $cal(B)_0 \( zeta \)$ and $Phi_0$.

The quantities in (2.9) are finite without any moment assumption on the trial messages.
  Indeed, the power-mean operators preserve pointwise multiplicative bounds, and

#[#set math.equation(numbering: n => "(2.10)")
 $ \| log T_0 V_(upright(s)) \| lt.eq \| \| h + sum_(j = 1)^k B \( theta_j \) \,
   wide \| log T_0 V_(upright(e)) \| lt.eq B \( theta \) . $ <model:trial-bounds>]

#thm([Theorem 2.1.])[
  #emph[Under (2.1)–(2.4), the thermodynamic limit exists and
#[#set math.equation(numbering: n => "(2.11)")
 $ lim_(N arrow.r oo) F_N = inf_(r gt.eq 0) Phi_r . $ <main:formula>]

]
] <main:theorem>

The right side is an infimum over finite hierarchies. The theorem does not assume that a trial law attains it or
  that a limiting infinite-depth Gibbs state has been constructed.

=== 2.2 Proof strategy <proof-strategy>

The interpolation upper bound holds at every system size and every finite depth.
  We reproduce it in 4, including a normalization that avoids assuming integrability of the multiplier $log a$.
  The lower bound has four steps.

+ #emph[Select a cavity reservoir.] A reservoir is a common Gibbs system on $N$ spins used to compare systems of
  sizes $N$ and $N + 1$. For bounded interaction and field laws,
  add bounded Poisson perturbations whose number is sublinear in the system size.
  Their effect on the pressure vanishes. At each fixed hierarchy depth,
  select system sizes and deterministic perturbation parameters for which the difference between successive
  expected logarithms after the auxiliary power-mean recursion is at most an arbitrarily small error above the
  original pressure liminf. The same choices give concentration of every perturbation score (Section 5, Lemma 6.2).
+ #emph[Prescribe branching patterns.] An elementary calculus for finite probability trees expands insertions into
  signed sums over added replica paths. Independent marks select any prescribed branching pattern.
  Score concentration then gives identities for these signed sums (Section 3, Theorem 6.5).
+ #emph[Concentrate all multioverlaps.] Move each internal branching depth of a target tree one step later.
  The first fresh split at each new depth supplies the same small factor as the normalizing coefficient.
  A relative bound on the sum of absolute coefficients preserves control of errors after division.
  Conditional covariance then decays by induction on the number of replicas.
  A second identity concentrates the remaining conditional mean (7).
+ #emph[Recover independent cavity messages.] Encode a uniformly chosen reservoir site’s entire finite hierarchy
  by successive conditional laws. Multioverlap concentration permits different site labels to be replaced by
  independent copies of this process in the cavity insertion.
  This yields an admissible trial value close to the selected increment (8).

The estimates in Step 3 are averages over separated interior branching depths.
  The insertion expansion assigns vanishing probability to the exceptional trees,
  so these averages are sufficient for Step 4. No uniform concentration in the depth is needed.
  The resulting lower bound holds for every bounded interaction law invariant under permutations of its inputs,
  without factorization or positivity. Finally, normalization and estimates uniform over all trial laws remove
  boundedness and give 1 under the stated first moment assumption (9).

== 3 Calculus on finite trees <tree:section>

A power-mean insertion admits two expansions. The logarithmic expansion will compare pressures;
  an expansion with one canceled replica factor will extract the perturbation identities.
  Both follow from one differentiation rule on trees. We also bound their coefficients and the probability of
  exceptional branching depths. Power-mean calculations for hierarchical trial laws appear in
  Mézard–Parisi #cite(label("MP01")) Appendix A and Panchenko–Talagrand #cite(label("PT04")) Section 5;
  the latter uses cascade weights introduced by Ruelle #cite(label("Ruelle87")).
  Here we derive the needed identities directly for finite sequences of arbitrary probability kernels,
  without assuming an infinite hierarchy.

=== 3.1 Path kernels and insertions <path-kernels-and-insertions>

Fix an integer $L gt.eq 1$ and numbers

$ 0 = m_0 < m_1 < dots.h.c < m_(L - 1) < m_L = 1 . $

A path has depths $0 \, dots.h \, L$. Its depth-zero variable is the root.
  For $1 lt.eq d lt.eq L$, the probability kernel $K_d$ draws the next variable given the whole prefix through
  depth $d - 1$; $cal(F)_d$ is the prefix sigma-field. The root distribution is fixed throughout all insertions.
  In an $r$-level application, $L = r + 1$: depths $1 \, dots.h \, r$ carry auxiliary variables,
  and depth $L$ carries a Gibbs spin configuration. For the trial law (2.6) with $r gt.eq 1$,
  $eta_d$ is the depth-$d$ variable for $0 lt.eq d < r$, and $x$ is the depth-$r$ variable.

A finite tree $cal(T)$ consists of a common root and finitely many labeled paths, each ending at depth $L$.
  Every internal vertex has at least one child; in particular, all unary portions of paths are retained.
  At each vertex, different children are drawn independently using the appropriate kernel.
  We write $E_(cal(T))$ for this sampling expectation conditional on the root.
  A split at depth $d$ means that the last common vertex is at depth $d$.
  Replica positions at depth $L$ are distinct vertices, but the values sampled there need not differ.
  Thus independent spin replicas may be the same spin configuration.
  Removing some leaves and the portions of their paths unused by the remaining leaves preserves the sampling law
  of the remaining tree.

When the terminal variables are spin configurations $sigma^a in { - 1 \, 1 }^N$,
  the multioverlap on a subset $S$ of the replica leaves is

#[#set math.equation(numbering: n => "(3.1)")
 $ R_S = 1 / N sum_(i = 1)^N product_(a in S) sigma_i^a \, wide R_diameter = 1 . $ <tree:multioverlap>]

An unspecified expectation $bb(E)$ below includes the root and the sampling of the indicated tree.

Here is how the path kernels arise from a partition function.
  Let $P_d$, $1 lt.eq d < L$, be the auxiliary prior kernels, put $X_(L - 1) = log Z$, and recursively set

$ X_(d - 1) = m_d^(- 1) log P_d e^(m_d X_d) wide \( 1 lt.eq d < L \) . $

The corresponding #emph[tilted kernels] are

#[#set math.equation(numbering: n => "(3.2)")
 $ K_d \( d z divides cal(F)_(d - 1) \) = e^(m_d \( X_d \( z \) - X_(d - 1) \))
   P_d \( d z divides cal(F)_(d - 1) \) \, wide 1 lt.eq d < L . $ <tree:original-tilt>]

They are probability kernels by the recursion. The final kernel $K_L$ is the Gibbs distribution of the spin
  configuration conditional on its auxiliary prefix. When $L = 1$, only this final kernel is present.

For a positive path function $A$, define

#[#set math.equation(numbering: n => "(3.3)")
 $ Y_L = A \, wide Y_(d - 1) = #scale(x: 120%, y: 120%)[\(] K_d Y_d^(m_d)
   #scale(x: 120%, y: 120%)[\)]^(1 \/ m_d) \, wide d = L \, dots.h \, 1 . $ <tree:Y-recursion>]

We initially suppose that $A$ is bounded above and away from zero, conditionally on the root.
  Every expression below is then well defined. Denote the kernels after insertion by

#[#set math.equation(numbering: n => "(3.4)")
 $ K_d^A \( d z divides cal(F)_(d - 1) \) = (frac(Y_d \( z \), Y_(d - 1)))^(m_d)
   K_d \( d z divides cal(F)_(d - 1) \) . $ <tree:updated-kernel>]

The recursion shows that these are probability kernels. Superscript $A$ on a tree expectation means that these
  kernels are used.

#thm([Lemma 3.1.])[
  (Insertion calculus).  #emph[Suppose a leaf partition function is iterated by power means,
    with exponents $m_1 \, dots.h \, m_(L - 1)$, and $K_1 \, dots.h \, K_(L - 1)$ are its tilted kernels.
    Let $K_L$ be its terminal Gibbs kernel. Multiplying each spin weight by $A$ changes the iterated root
    logarithm by $log Y_0$, where (3.3) uses the kernels before insertion. The new kernels are (3.4).]
  #emph[For an internal vertex $beta$ of a prescribed tree, let $d_beta$ be its depth,
    let $n_beta$ be its number of children, and put
$ gamma_beta = m_(d_beta) - n_beta m_(d_beta + 1) . $

 The conditional joint density of its updated tree law is
#[#set math.equation(numbering: n => "(3.5)")
 $ W_(cal(T)) \( A \) := frac(d P_(cal(T))^A, d P_(cal(T))) =
   product_(a in "Leaves" \( cal(T) \)) A^a product_(beta in "Int" \( cal(T) \)) Y_beta^(gamma_beta) . $ <tree:density>]

 Here $Y_beta$ is $Y_(d_beta)$ evaluated on the prefix at $beta$.]
  #emph[The recursion is monotone and homogeneous: if $a lt.eq A lt.eq b$, for positive root-measurable $a \, b$,
    then $a lt.eq Y_d lt.eq b$ at every depth; and multiplying $A$ by a positive root-measurable constant
    multiplies every $Y_d$ by that constant.]
] <tree:insertion>

#proof[
  At the terminal spin integration, the partition-function ratio is $K_L A = Y_(L - 1)$, because $m_L = 1$.
    If $X_d$ and $X_d^A$ are the old and new backward logarithms, substitution in the preceding power mean gives
  $ exp #scale(x: 120%, y: 120%)[\(] m_d \( X_(d - 1)^A - X_(d - 1) \) #scale(x: 120%, y: 120%)[\)] =
    K_d exp #scale(x: 120%, y: 120%)[\(] m_d \( X_d^A - X_d \) #scale(x: 120%, y: 120%)[\)] . $
  Backward induction proves $X_d^A - X_d = log Y_d$ and then gives (3.4); the same formula at $d =
    L$ is the usual Gibbs density ratio.
  Multiply the edge density ratios in (3.4) over the tree. An internal vertex at positive depth $d$ receives
    exponent $m_d$ from its incoming edge and exponent $- n_beta m_(d + 1)$ from its outgoing edges.
    At the root there is no incoming edge, which agrees with $m_0 = 0$.
    Each terminal vertex receives exponent $m_L = 1$. This proves (3.5).
    Monotonicity and homogeneity follow at once by backward induction in (3.3). ◻
]

An insertion may use additional variables that were absent from the original model.
  Enlarge each path kernel by their independent prior kernels before applying the lemma.
  The original backward logarithms do not depend on these variables,
  so the original tilt leaves their conditional prior kernels unchanged. Additional root variables remain quenched.

We will use differentiation of (3.3). For $A_(bold(t)) = 1 + sum_(j = 1)^k t_j D_j$,
  where the real path functions $D_j$ are bounded, differentiation on any real neighborhood where $A_(bold(t))$ is
  uniformly positive gives

#[#set math.equation(numbering: n => "(3.6)")
 $ partial_(t_j) log Y_d = E^(A_(bold(t))) [D_j / A_(bold(t))\| cal(F)_d] . $ <tree:first-variation>]

The conditional expectation on the right follows one new path below the specified prefix.
  Indeed, differentiating one power mean gives $partial_(t_j) log Y_(d - 1) =
  K_d^(A_(bold(t))) partial_(t_j) log Y_d$, and the terminal derivative is $D_j \/ A$.

===== 3.1.1 Analytic bounds. <analytic-bounds.>

The expressions are analytic on the complex domain

$ sum_j \| t_j \| parallel D_j parallel_oo < 1 \, $

with bounds uniform over the kernels. On a smaller closed domain with this sum at most $rho < 1$,
  $A$ has argument bounded by $theta.alt = arcsin rho < pi \/ 2$ and modulus between $1 - rho$ and $1 + rho$.
  If $Y_d$ has argument in $\[ - theta.alt \, theta.alt \]$,
  then $K_d Y_d^(m_d)$ has argument in $\[ - m_d theta.alt \, m_d theta.alt \]$, using the principal powers.
  It is nonzero, and taking its $1 \/ m_d$ power gives the same argument bound for $Y_(d - 1)$.
  More quantitatively, a lower modulus bound $a_d > 0$ gives the lower bound $a_(d - 1) =
  a_d cos \( m_d theta.alt \)^(1 \/ m_d) > 0$, whereas the upper modulus bound $1 + rho$ is preserved.
  These bounds justify integration of analytic functions at each step and all subsequent differentiations.
  They also bound (3.5), its canceled versions below, and their derivatives on smaller domains,
  uniformly over the kernels for fixed depth, exponents, tree size, and bounds on the inserted functions.

=== 3.2 The two expansion rules <the-two-expansion-rules>

Call a leaf #emph[protected] if its factor $A^a$ in the tree density is canceled by a denominator $A^a$.
  For a set $C$ of protected leaves and a bounded parameter-independent function $G$,
  consider $E_(cal(T))^A \[ G product_(a in C) \( A^a \)^(- 1) \]$. Differentiating (3.5) shows that

$ partial_(t_j) log W_(cal(T)) \( A \) = sum_(a in "Leaves" \( cal(T) \)) D_j^a / A^a +
  sum_(beta in "Int" \( cal(T) \)) gamma_beta thin partial_(t_j) log Y_beta . $

In the derivative of $E_(cal(T))^A \[ G product_(a in C) \( A^a \)^(- 1) \]$,
  the leaf terms at $a in C$ cancel exactly with differentiation of their denominators.
  Each remaining leaf term inserts $D_j^a \/ A^a$ and makes that leaf protected.
  By (3.6), an internal-vertex term is the same expectation after adjoining an independent updated path below
  $beta$, with an additional factor $D_j \/ A$ at its terminal vertex.
  This is precisely a fresh path at $beta$, with coefficient $gamma_beta$, and its new leaf is protected.
  Conditional independence of children and the projectivity of tree sampling justify this representation even when
  $G$ uses the other children of $beta$.

For a tree with $n$ leaves, telescoping gives the useful identity

#[#set math.equation(numbering: n => "(3.7)")
 $ sum_(beta in "Int" \( cal(T) \)) #scale(x: 120%, y: 120%)[\(] n_beta m_(d_beta + 1) -
   m_(d_beta) #scale(x: 120%, y: 120%)[\)] = n . $ <tree:telescoping>]

All summands are positive. Define a probability law $Q_k$ on trees with leaves labeled $1 \, dots.h \,
  k$ as follows. Start with a single path. When the current tree has $n$ leaves,
  choose an internal vertex $beta$ with probability

#[#set math.equation(numbering: n => "(3.8)")
 $ frac(n_beta m_(d_beta + 1) - m_(d_beta), n) \, $ <tree:Q-rule>]

create a fresh child there, and continue with a completely new path to depth $L$.
  Give its terminal vertex label $n + 1$. Identity (3.7) verifies the normalization.
  The random tree is chosen independently of all variables subsequently sampled on it.
  For example, under $Q_2$ the two paths split at depth $d$ with probability $m_(d + 1) - m_d$, for $0 lt.eq
  d < L$. This split is uniform on the depths when $m_d = d \/ L$.

#thm([Lemma 3.2.])[
  (Logarithmic expansion).  #emph[For a bounded real path function $D$ and $A = 1 + t D$,
#[#set math.equation(numbering: n => "(3.9)")
 $ log Y_0 = sum_(k gt.eq 1) frac(\( - 1 \)^(k - 1) t^k, k) bb(E)_(Q_k) E_(cal(T)) product_(a = 1)^k D^a \,
   wide \| t \| parallel D parallel_oo < 1 . $ <tree:log-series>]

 This identity is conditional on the root. If $\| t \| parallel D parallel_oo lt.eq c < 1$,
   the absolute value of the remainder after order $K$ is at most
#[#set math.equation(numbering: n => "(3.10)")
 $ sum_(k > K) c^k / k . $ <tree:log-tail>]

]
] <tree:log-expansion>

#proof[
  The first derivative is, by (3.6), the expectation of $D \/ A$ on one updated path. Protect that leaf.
    Every subsequent derivative can only add a fresh path, because all current leaves are protected.
    At order $k$, all $k - 1$ fresh coefficients are negative.
    After normalization by (3.7), their absolute products are $\( k - 1 \) !$ times the probabilities in $Q_k$.
    Therefore
  $ frac(d^k, d t^k) log Y_0\|_(t = 0) = \( - 1 \)^(k - 1) \( k - 1 \) ! thin bb(E)_(Q_k) E_(cal(T))
    product_(a = 1)^k D^a . $
  Analyticity proves (3.9); the coefficients have absolute value at most $parallel D parallel_oo^k \/ k$,
    which proves the stated convergence domain and (3.10). ◻
]

Here is the companion rule with old replicas. Fix a tree $cal(T)$ with an anchor leaf $a_(*)$.
  Starting from all its old paths, assign colors $1 \, dots.h \, k$ in that order. For the next color, one may either

+ choose an unused old leaf other than $a_(*)$, with coefficient $1$; or
+ create a fresh path from any internal vertex $beta$ of the current tree, with coefficient $gamma_beta =
  m_(d_beta) - n_beta m_(d_beta + 1)$.

Each fresh path uses a new child at its divergence vertex and new vertices at every greater depth.
  Every chosen leaf receives its color and cannot be chosen again.
  The current tree includes all old paths, including unused ones, and every path already added.
  An extension history $E$ records these choices; write $a_j \( E \)$ for the leaf carrying color $j$,
  $cal(T)_E$ for its final tree, and $c_E$ for the product of its coefficients.

#thm([Lemma 3.3.])[
  (Canceled-anchor expansion).  #emph[Let $H$ be a bounded function of the variables on the old tree,
    fixed as the insertion parameters vary. For $A_(bold(t)) = 1 + sum_(j = 1)^k t_j D_j$,
    with bounded real path functions $D_j$, one has
#[#set math.equation(numbering: n => "(3.11)")
 $ partial_(t_1) dots.h.c partial_(t_k) E_(cal(T))^(A_(bold(t))) H / A_(bold(t))^(a_(*))\|_(bold(t) = 0) =
   sum_E c_E thin E_(cal(T)_E) [H product_(j = 1)^k D_j^(a_j \( E \))] . $ <tree:mixed-expansion>]

 The formula holds in any fixed order of the colors. For identical directions $D_j = D$,
   the coefficient of $t^k$ is the right-hand side divided by $k !$.
   The analytic bounds established above apply to its left-hand side, uniformly over the path kernels.
   The empty extension has weight $1$.]
] <tree:extension-expansion>

#proof[
  Begin with $C = { a_(*) }$ and $G = H$. Apply the preceding rule successively,
    incorporating each new $D_j$ in $G$. Fresh leaves are protected immediately,
    so the only unprotected leaves are unused old leaves. At zero all factors $A$ and $Y$ are $1$,
    proving the claimed rule and its coefficients. ◻
]

=== 3.3 Sums of extension coefficients <sums-of-extension-coefficients>

We now control the signed normalization and the accumulated error in the prescribed-tree identities used for the
  lower bound.

In an extension history, the anchor and the already colored paths are called reference paths.
  Constraints on the new color will only specify its splitting depths with these paths.
  In particular, a constraint does not distinguish unused old paths with the same specified ancestry.

To see the cancellation that must be controlled, start with two old paths splitting at depth $d$,
  and let the first be the anchor. Require one added color to split from the anchor exactly at $d$.
  It may use the second old leaf, create a fresh path at the depth-$d$ vertex,
  or follow the second old path and leave it at a depth $ell > d$. The respective coefficients give the total

$ 1 + \( m_d - 2 m_(d + 1) \) + sum_(ell = d + 1)^(L - 1) \( m_ell - m_(ell + 1) \) = m_d - m_(d + 1) . $

On the uniform mesh $m_d = d \/ L$, with $delta = L^(- 1)$, this signed total is $- delta$,
  but the sum of absolute coefficients is $2 + delta$. If instead the required split is delayed to $d + 1 < L$,
  the only allowed choice is a fresh split at the unary depth-$\( d + 1 \)$ vertex on the anchor path.
  Its coefficient is $- delta$, so the absolute sum is now $delta$.
  The next two lemmas extend these two calculations: the first computes signed totals,
  and the second controls absolute sums when specified splits occur away from old branching depths.

#thm([Lemma 3.4.])[
  (Reference-path totals).  #emph[Suppose the next color must follow a specified reference prefix to depth $d$ and
    then enter a child distinct from all $j gt.eq 1$ children there that contain reference paths.
    Apart from these ancestry constraints its continuation is unrestricted.
    The sum of the coefficients of all allowed choices is
#[#set math.equation(numbering: n => "(3.12)")
 $ m_d - j m_(d + 1) . $ <tree:one-reference-total>]

 Consequently, if the anchor and the colors must have a prescribed tree $S$,
   the total coefficient over all compatible extensions of any old tree is
#[#set math.equation(numbering: n => "(3.13)")
 $ kappa \( S \) = product_(v in "Br" \( S \)) product_(j = 1)^(a_v - 1) \( m_(d_v) - j m_(d_v + 1) \) \, $ <tree:K>]

 where $a_v$ and $d_v$ are the child count and depth of each branching vertex in the prescribed reference tree.
   More generally, the same one-step rule can be iterated starting from any already constructed set of references.]
] <tree:reference-total>

#proof[
  At the specified divergence vertex, let $n$ be the child count in the entire current tree.
    The $j$ excluded children contain all references passing through that vertex.
    Each of the other $n - j$ children roots a subtree containing no reference.
    Its terminal vertices are therefore unused old leaves. If such a subtree is rooted at depth $d + 1$,
    its permitted choices are an old leaf, with coefficient $1$,
    or a fresh divergence at an internal vertex in the subtree. If it has $q$ leaves, telescoping within it gives
  $ q + sum_(beta upright(" internal in the subtree")) \( m_(d_beta) - n_beta m_(d_beta + 1) \) = m_(d + 1) . $
  The formula includes the case of a terminal child, when both sides are $1$.
    Adding these contributions to the fresh choice at the specified vertex gives $m_d -
    n m_(d + 1) + \( n - j \) m_(d + 1) = m_d - j m_(d + 1)$.
  For consistent prescribed splitting depths with all reference paths,
    the deepest required common prefix determines the divergence vertex and its excluded reference children.
    Thus the one-step sum depends only on the current reference tree,
    not on which old paths or fresh paths realized it. Sum backwards over successive choices.
    At a branching vertex of the final prescribed tree, the numbers of excluded reference children when new child
    groups are first entered are exactly $1 \, dots.h \, a_v - 1$.
    Their factors give (3.13), independently of the color order. ◻
]

To control errors after division by a small reference coefficient, we also need an absolute bound.
  Moving a target branching depth away from all old branching depths forces a fresh unary split.
  The next estimate charges one small factor to each such vertex.

#thm([Lemma 3.5.])[
  (Charging fresh splits).  #emph[Assume $m_d = d \/ L$ and put $delta = L^(- 1)$.
    Start with an old tree having $q$ leaves and assign $k$ colors by the canceled-anchor extension rule.
    Prescribe the reference shape of the anchor and the colors,
    possibly with additional restrictions on allowed extensions.
    Suppose $b$ specified branching vertices of that shape have depths which are not branching depths anywhere in
    the old tree. Then
#[#set math.equation(numbering: n => "(3.14)")
 $ sum_(E upright(" allowed")) \| c_E \| lt.eq C_(q \, k) delta^b . $ <tree:charging-bound>]

 The constant is independent of $L$, the prescribed depths, and their coincidences at different vertices.]
  #emph[In particular, for these $b$ vertices let
$ J = product_v product_(j = 1)^(a_v - 1) \( m_(d_v) - j m_(d_v + 1) \) . $

 If $m_(d_v) gt.eq eta > 0$ at all of them, then $J eq.not 0$ and
#[#set math.equation(numbering: n => "(3.15)")
 $ frac(1, \| J \|) sum_(E upright(" allowed")) \| c_E \| lt.eq C_(q \, k \, eta) . $ <tree:relative-charging>]

]
] <tree:charging>

#proof[
  If the current tree has $s$ leaves, (3.7) says that the total absolute coefficient of all fresh choices is $s$.
    There are at most $s$ eligible old choices. Hence the total absolute coefficient at an unrestricted step is at
    most $2 s lt.eq 2 \( q + k \)$. At any fixed depth there are at most $s$ vertices.
    Restricting a step to fresh divergences at unary vertices of a prescribed depth therefore gives total absolute
    coefficient at most $s delta$, because each such divergence has coefficient $m_d - m_(d + 1) = - delta$.
  Consider an allowed history and one of its specified target branching vertices.
    That vertex cannot already be branching in the old tree. At the first step at which it became branching in the
    current tree, a fresh path must therefore have diverged there while it was unary.
    The vertex may itself have been created earlier as part of a new unary path; the same conclusion then applies.
    Distinct target vertices become branching at distinct steps,
    since a fresh path creates only one branching vertex. Assign each of the $b$ vertices to its creation step.
    There are at most $k ! \/ \( k - b \) !$ possible assignments (and necessarily $b lt.eq k$).
  For each fixed assignment, enlarge the family of histories by discarding all constraints except that a
    designated step creates a unary split at its assigned depth.
    Bound its step sum by $\( q + k \) delta$ and every other step sum by $2 \( q + k \)$.
    Iterated summation over choices gives at most
  $ frac(k !, \( k - b \) !) \( q + k \)^b #scale(x: 120%, y: 120%)[\(] 2 \( q + k \)
    #scale(x: 120%, y: 120%)[\)]^(k - b) delta^b . $
  This proves (3.14), including repeated assigned depths, because the designated steps remain distinct.
  For the final assertion, the $j = 1$ factor at each designated vertex has absolute value $delta$,
    whereas for $j gt.eq 2$
  $ \| m_d - j m_(d + 1) \| = \( j - 1 \) m_d + j delta gt.eq eta . $
  There are only a size-dependent number of the latter factors.
    Thus $\| J \| gt.eq delta^b eta^(sum_v \( a_v - 2 \))$, and the result follows. ◻
]

=== 3.4 The distribution of branching depths <the-distribution-of-branching-depths>

Still take $m_d = d \/ L$. Suppress unary stretches only for the purpose of describing a shape by a finite
  topology and its branching-depth coordinates. For $0 < eta < 1 \/ 2$,
  call a shape #emph[regular] if every branching depth divided by $L$ lies in $\( eta \, 1 - eta \)$ and any two
  distinct branching vertices have normalized depths differing by more than $eta$. A singleton is regular.
  This is the regularity used when sampling a single tree; later we also use two copies whose corresponding depth
  assignments are deliberately aligned.

#thm([Lemma 3.6.])[
  (Regular shapes).  #emph[For every fixed $k$ there is $C_k < oo$, independent of $L$ and $eta$, such that
#[#set math.equation(numbering: n => "(3.16)")
 $ Q_k { cal(T) upright(" is not regular") } lt.eq C_k \( eta + L^(- 1) \) . $ <tree:irregular-probability>]

 For any particular labeled topology with $a$ branching vertices and any consistent assignment of their depths,
#[#set math.equation(numbering: n => "(3.17)")
 $ Q_k { upright("that topology and depth assignment") } lt.eq C_k L^(- a) . $ <tree:assignment-probability>]

 Deleting leaves from a regular tree produces a regular tree, after discarding branching vertices that become unary.]
] <tree:regular-shapes>

#proof[
  Suppose the current tree has $n$ leaves. A new branching vertex is created exactly when the next path diverges
    at a unary vertex. Each such choice has probability $delta \/ n$ by (3.8).
    At any depth there are at most $n$ vertices; hence for a set $B$ of depths the probability that the next path
    creates a branching vertex at a depth in $B$ is at most $\| B \| delta$.
    At each of the first $k - 1$ steps, the boundary depths and the depths within normalized distance $eta$ of any
    previous branching vertex form a set of cardinality at most $C_k \( eta L + 1 \)$.
    If none of these forbidden creation events occurs, the final tree is regular. A union bound proves (3.16).
    Divergence at an already branching vertex does not create a new coordinate and requires no extra exclusion.
  For (3.17), restrict a specified final labeled tree to leaves $1 \, dots.h \, n$, retaining every unary stretch.
    These restrictions determine its successive histories under (3.8).
    Each of its $a$ branching vertices is first created by a unary divergence,
    whose probability is at most $delta$; every other transition probability is at most $1$.
    The probability of the specified history is therefore at most $delta^a$.
    If a topology description identifies equivalent child orderings,
    their number is bounded in terms of $k$ alone, which gives the stated version with $C_k$.
    Finally, a retained branching vertex after deletion was already a branching vertex of the original tree,
    at the same depth. Its depth coordinates are a subset of the old ones, so regularity is preserved. ◻
]

#prodef([Remark 3.7.])[
  For fixed $k$ there are finitely many labeled topologies.
    Therefore (3.17) converts an unnormalized depth average $L^(- a)
    sum$ for a topology with $a$ branching coordinates into a bound for its contribution under $Q_k$.
    The same is true for errors on subshapes: summing over coordinates discarded by the subshape costs at most the
    corresponding power of $L$. Together with (3.16), this allows averaged estimates on regular depth assignments
    to be used in the logarithmic expansion.
] <tree:averaging-remark>

== 4 The interpolation upper bound <upper:section>

The interpolation method of Guerra #cite(label("Guerra03")),
  adapted to diluted systems by Franz and Leone #cite(label("FL03")) and to arbitrary finite levels by Panchenko
  and Talagrand #cite(label("PT04")), replaces each real interaction by $p$ independent cavity interactions.
  The difference is controlled by the convexity of $x mapsto x^p$.
  We give the argument for the full trial class, including unbounded messages and integrable physical disorder.

#thm([Proposition 4.1.])[
  #emph[Under the hypotheses of 1, $F_N lt.eq cal(B)_r \( zeta \, upright(bold(m)) \)$ for every $N$ and every
    admissible finite-level trial law. Consequently $F_N lt.eq inf_(r gt.eq 0) Phi_r$.]
] <upper:bound>

#proof[
  First dispose of the degenerate factorization. Put $M = max_(s = plus.minus 1) \| f \( s \) \|$.
    If $b = 0$ almost surely or $M = 0$ almost surely, the interaction is a spin-independent random constant $c$, and
  $ F_N = cal(B)_r = log 2 + bb(E) log cosh h + alpha bb(E) c $
  for every trial law. Otherwise choose $u \, v > 0$ with $bb(P) \( M gt.eq u \) >
    0$ and $bb(P) \( \| b \| gt.eq v \) > 0$. Since $\| b \| product_(ell = 1)^p M_ell < 1$ almost surely,
    independence gives
  $ parallel b parallel_oo lt.eq u^(- p) \, wide parallel M parallel_oo lt.eq \( v u^(p - 1) \)^(- 1) . $
  Indeed, violating either bound on a set of positive probability and restricting the other independent factors to
    these lower bounds would violate the strict product condition. All moments used below are therefore finite.
  #emph[Interpolation.] Fix a trial law and set $L = r + 1$.
    Interpolate between real interactions of mean $t alpha N$ and, at each site $i$,
    independent cavity interactions $U_theta \( x_1 \, dots.h \, x_(p - 1) \; sigma_i \)$ of mean $\( 1 - t \)
    alpha p$. Different cavity terms have disjoint message labels.
    Counts, interactions, fields, and root message measures are quenched.
    Apply the backward power-mean recursion to the spin partition function and denote its expected root logarithm
    divided by $N$ by $phi \( t \)$. For $r = 0$ all messages are quenched and there is no auxiliary recursion.
    Independence between different sites throughout the recursion gives
  $ phi \( 1 \) = F_N \, wide phi \( 0 \) = log 2 + bb(E) log T_0 V_(upright(s)) . $
  Poisson differentiation gives $phi' \( t \) \/ alpha$ as the expected insertion increment of one real
    interaction minus $p$ times the increment of one cavity interaction at a uniform site.
    Each increment has absolute value at most $B \( theta \)$,
    since the recursion preserves multiplicative bounds. Conditioning on the counts justifies the derivative on
    $\( 0 \, 1 \)$, and the same bound gives continuity at the endpoints.
  We claim that
  #[#set math.equation(numbering: n => "(4.1)")
   $ phi' \( t \) + alpha \( p - 1 \) bb(E) log T_0 V_(upright(e)) lt.eq 0 . $ <upper:derivative>]
  All three insertions have the form $a \( 1 + D \)$ under (2.3).
    For a real interaction, $D = b product_ell f_ell \( sigma_(i_ell) \)$; for a cavity interaction, replace $p -
    1$ of the factors by $macron(f) \( x \) = sum_s f \( s \) q_x \( s \)$; for an edge insertion,
    replace all $p$. In the last case the independent message process is appended to the unperturbed tilted tree,
    so its increment is $log T_0 V_(upright(e))$.
  #emph[Normalization.] We remove $a$ before taking expectations, so no integrability of $log a$ is needed.
    Put $D_(*) = b product_ell f_ell \( 1 \)$ and $c = theta \( 1 \, dots.h \, 1 \)$.
    Subtract $c$ from each insertion increment. These integrable subtractions cancel in the combination with
    coefficients $1 \, - p \, p - 1$. Keep the interpolated system fixed.
    For $0 < lambda < 1$, replace each normalized increment by
  #[#set math.equation(numbering: n => "(4.2)")
   $ log Y_0 \( 1 + lambda D \) - log \( 1 + lambda D_(*) \) \, $ <upper:regularization>]
  where $Y_0$ is the insertion recursion of 3. For every spin input, the ratio
  $ frac(1 + lambda D, 1 + lambda D_(*)) = \( 1 - w \) + w frac(1 + D, 1 + D_(*)) \, wide w =
    frac(lambda \( 1 + D_(*) \), 1 + lambda D_(*)) in \[ 0 \, 1 \] \, $
  lies between $e^(- 2 B \( theta \))$ and $e^(2 B \( theta \))$.
    The same is true after averaging any subset of the spin inputs against the $q_x$’s.
    It follows that (4.2) is bounded in absolute value by $2 B \( theta \)$.
    For each fixed interaction, convergence as $lambda arrow.t
    1$ is uniform in the spin inputs and messages and is preserved by the finite recursion.
    Dominated convergence therefore recovers the desired normalized increments.
  #emph[Convexity.] Apply 3 to the regularized increments. On a tree $cal(T)$ with $n$ replica leaves define
  $ P_(cal(T)) = 1 / N sum_(i = 1)^N bb(E)_f product_(a = 1)^n f \( sigma_i^a \) \, wide B_(cal(T)) =
    bb(E)_(f \, x) product_(a = 1)^n macron(f) \( x^a \) . $
  Here $bb(E)_f$ averages one fresh function $f$, shared by all $n$ replica factors in the product.
    The expectation $bb(E)_(f \, x)$ also averages an entire fresh message-label tree, including its root.
    This function and message tree are independent of one another and of the old tilted system.
    Thus $B_(cal(T))$ is deterministic for a fixed tree, while $P_(cal(T))$ still depends on the old spin
    replicas. At $r = 0$, the message itself is a root variable shared by all replica leaves.
    Averaging the independent uniform indices and the independent copies of $f$ and of the new message label
    gives, respectively, $P_(cal(T))^p$, $P_(cal(T)) B_(cal(T))^(p - 1)$, and $B_(cal(T))^p$.
    The inserted $b$ is independent of these variables. Thus the order-$n$ coefficient of the combined regularized
    increment is
  #[#set math.equation(numbering: n => "(4.3)")
   $ - lambda^n / n bb(E) \[ \( - b \)^n \] thin bb(E)_(Q_n) bb(E)
     [P_(cal(T))^p - p P_(cal(T)) B_(cal(T))^(p - 1) + \( p - 1 \) B_(cal(T))^p] . $ <upper:remainder>]
  The regularized baseline terms cancel. The tree law $Q_n$ is that of 3; it is common to the three insertions.
    The series is absolutely convergent for $lambda < 1$, with each insertion controlled by $sum_(n gt.eq 1)
    lambda^n \/ n$. Since $p$ is even, convexity of $x mapsto x^p$ makes the bracket nonnegative,
    and (2.4) makes (4.3) nonpositive. Taking $lambda arrow.t 1$ proves (4.1).
    Integration over $t in \[ 0 \, 1 \]$ gives the proposition. ◻
]

== 5 A perturbed cavity reservoir <cavity:section>

We compare systems of sizes $N$ and $N + 1$ through a common $N$-spin system, the #emph[reservoir].
  This cavity comparison follows the Aizenman–Sims–Starr variational scheme #cite(label("ASS03")) and its
  spin-distribution form in Panchenko #cite(label("Pan13")) Section 2.2.
  We add a sublinear number of bounded perturbations to obtain identities for its spin trees.
  The comparison below shows that these perturbations change the pressure by $o \( 1 \)$ and preserve the
  site-minus-bond cavity increment.

Until 9, assume that $B \( theta \) lt.eq B$ and $\| h \| lt.eq
  H$ almost surely and that the law of $theta$ is invariant under permutations of its $p$ coordinates.
  Neither the factorization nor the positivity assumption is used in the lower bound.

Fix $L gt.eq 2$ and use $r = L - 1$ auxiliary levels with

#[#set math.equation(numbering: n => "(5.1)")
 $ m_d = d \/ L quad \( 0 lt.eq d lt.eq L \) \, wide delta = 1 \/ L . $ <cavity:grid>]

Let $\( c_nu \)_(nu gt.eq 1)$ be positive with $sum_nu c_nu = 1$, and let $s_N = N^(3 \/ 4)$.
  To the spin weight add independent Poisson families of single-site factors $psi_nu$,
  with counts of means $c_nu s_N$ and independent uniform sites in $\[ N \]$.
  Each factor uses its own auxiliary variables, drawn along the hierarchy with product priors, and satisfies

#[#set math.equation(numbering: n => "(5.2)")
 $ 1 \/ 2 lt.eq psi_nu lt.eq 3 \/ 2 . $ <cavity:factor-bounds>]

The total number of factors is $"Poisson" \( s_N \)$ and is finite almost surely.
  Counts, types, and sites are root variables. The parameters of the factors are denoted by $upright(bold(u))$ and
  are fixed, not quenched random variables, unless a parameter average is explicitly taken.
  The factors needed later are specified in 6.

Apply the power-mean recursion to the resulting leaf partition function.
  Write $P_N^(L \, upright(bold(u)))$ for its expected root logarithm.
  Comparing pointwise with the unperturbed spin weight and then applying the recursion gives

#[#set math.equation(numbering: n => "(5.3)")
 $ \| P_N^(L \, upright(bold(u))) - N F_N \| lt.eq \( log 2 \) s_N \, $ <cavity:negligible>]

uniformly in the hierarchy, its parameters, and $N$.

#thm([Lemma 5.1.])[
  (Cavity increments).  #emph[The increments $Delta_N^(L \, upright(bold(u))) =
    P_(N + 1)^(L \, upright(bold(u))) - P_N^(L \, upright(bold(u)))$ are uniformly bounded in $N \, L \,
    upright(bold(u))$. There is a reservoir on $N$ spins with physical interaction count of mean
#[#set math.equation(numbering: n => "(5.4)")
 $ rho_N = alpha \( N + 1 \) (frac(N, N + 1))^p \, $ <cavity:reservoir-mean>]

 the usual fields, and the perturbation counts of means $c_nu s_N$, such that
#[#set math.equation(numbering: n => "(5.5)")
 $ Delta_N^(L \, upright(bold(u))) = log 2 + bb(E) log Y_(0 \, upright(s)) - bb(E) log Y_(0 \, upright(b)) +
   o_N \( 1 \) . $ <cavity:identity>]

 The error is uniform in $L \, upright(bold(u))$. The insertion recursion uses the tilted reservoir kernels and
   independent new root disorder, with terminal insertions
#[#set math.equation(numbering: n => "(5.6)")
 $ A_(upright(s)) \( sigma \) & = 1 / 2 sum_(epsilon = plus.minus 1) exp
   (h epsilon + sum_(j = 1)^(K_(upright(s))) theta_j \( sigma_(i_(1 \, j)) \, dots.h \, sigma_(i_(p - 1 \, j)) \,
   epsilon \)) \,\
A_(upright(b)) \( sigma \) & =
  exp (sum_(j = 1)^(K_(upright(b))) theta_j \( sigma_(i_(1 \, j)) \, dots.h \, sigma_(i_(p \, j)) \)) \,
  $ <cavity:site-insertion>]

 where $K_(upright(s)) tilde.op "Poisson" \( alpha p \)$, $K_(upright(b)) tilde.op
   "Poisson" \( alpha \( p - 1 \) \)$, and all displayed indices are independent uniform indices in $\[ N \]$.]
] <cavity:increment>

#proof[
  #emph[The physical interactions.] Split the Poisson interaction process of the $\( N + 1 \)$-spin system
    according to the number of indices equal to $N + 1$. Terms with no new index have mean $rho_N$.
    Terms with exactly one new index have mean $alpha p \( N \/ \( N + 1 \) \)^(p - 1) = alpha p +
    O \( N^(- 1) \)$; by permutation invariance we may place the new input last.
    Their other indices are independent uniform indices in $\[ N \]$,
    and their interaction functions retain the prescribed law.
    Terms with at least two new indices have total mean $O \( N^(- 1) \)$.
    Meanwhile, the $N$-spin system can be obtained from the same reservoir by adding a Poisson number of old
    interactions of mean
  $ alpha N - rho_N = alpha \( p - 1 \) + O \( N^(- 1) \) . $
  These quantities are nonnegative for all sufficiently large $N$.
  ===== 5.1 The perturbations. <the-perturbations.>
  The old-site perturbation count in the $\( N + 1 \)$-spin system has total mean $s_(N + 1) N \/ \( N + 1 \)$,
    and the new-site count has mean $s_(N + 1) \/ \( N + 1 \)$.
    Couple these processes to the reservoir perturbations using common Poisson points.
    The expected number of unmatched factors is at most
  $ \| s_(N + 1) - s_N \| + 2 s_(N + 1) \/ \( N + 1 \) = O \( N^(- 1 \/ 4) \) . $
  Deleting or adding a perturbation changes the root logarithm by at most $log 2$;
    an interaction changes it by at most $B$. An unused auxiliary variable can simply be integrated out with its
    prior, so these comparisons remain valid when the number of auxiliary variables changes.
  ===== 5.2 The increment. <the-increment.>
  We may consequently discard the repeated-new-index interactions, match the perturbations,
    and replace the two insertion count means by their limits at a total expected cost $O \( N^(- 1 \/ 4) \)$.
    Summing over the new spin gives $2 A_(upright(s))$, while the old-system correction gives $A_(upright(b))$.
    The factor $2$ supplies the term $log 2$ in the increment.
    The insertion identity for the power means then proves (5.5). Finally,
  $ \| log Y_(0 \, upright(s)) \| lt.eq H + B K_(upright(s)) \, wide \| log Y_(0 \, upright(b)) \| lt.eq
    B K_(upright(b)) . $
  Together with the coupling estimate this bounds the increments for large $N$;
    increasing the constant covers the remaining sizes. All estimates are uniform in $L$ and $upright(bold(u))$. ◻
]

In the rest of the lower-bound proof, all spin trees are sampled from this reservoir using its tilted auxiliary
  kernels and its terminal Gibbs kernel. The reservoir retains an independent Poisson interaction process of mean
  $O \( N \)$ and $N$ independent bounded fields. Thus the concentration argument applies to its slightly modified
  interaction mean as well.

== 6 Perturbations and identities on prescribed trees <pert:section>

Throughout this section the interaction and field are bounded, and the depth $L gt.eq 2$ is fixed.
  The arguments apply both to the $N$-spin system and to the reservoir in 10.
  Its physical disorder consists of independent bounded interactions with a Poisson count of mean $O \( N \)$,
  together with $N$ independent bounded fields. All expectations in a statement at a specified parameter vector
  are taken with that vector held fixed.

We choose perturbations whose derivatives concentrate, while selecting cavity increments at most an arbitrarily
  small error above the unperturbed liminf. A Poisson insertion then turns concentration into Taylor-coefficient
  identities. Independent signs along the inserted paths select the prescribed splitting depths.
  The use of concentration to obtain overlap identities has antecedents in the self-averaging argument of
  Ghirlanda–Guerra #cite(label("GG98")). Related antecedents are the stochastic-stability relations of
  Aizenman–Contucci #cite(label("AC98")) and their extensions to diluted multioverlaps by Barra and De
  Sanctis #cite(label("BarraDeSanctis07")). Panchenko’s spin-distribution identities #cite(label("Pan13")) provide
  the cavity context. The bounded perturbation family and the identities on colored finite trees needed here are
  constructed and proved below.

=== 6.1 The perturbation family <the-perturbation-family>

A #emph[mark specification] consists of a finite number $n gt.eq 0$ of labeled Rademacher coordinates,
  a depth in ${ 1 \, dots.h \, L - 1 }$ assigned to each coordinate, two functions $g \, g_0 : { - 1 \,
  1 }^n arrow.r bb(Q) ∩ \[ - 1 \, 1 \]$, and a choice $S_0 = 1$ or $S_0 = sigma_i$.
  Each coordinate is sampled at its assigned depth along an auxiliary path.
  Distinct coordinates are independent; the value of a coordinate is shared at a shared vertex and is independent
  at different vertices. The case $n = 0$ includes constant functions.
  We use all such specifications, a countable collection because each sign domain is finite.
  Products of signs and their rational averages belong to this collection; these will select branching patterns.

The two parameters have different roles: differentiation in $u$ produces a concentrated score,
  while the values of $t$ probe an insertion’s Taylor expansion.
  Taking $u$ smaller than every fixed power of $t$ will force each limiting Taylor coefficient to vanish.
  For each specification include types indexed by all integers $j gt.eq 4$.
  The type $nu$ corresponding to this specification and $j$ has

#[#set math.equation(numbering: n => "(6.1)")
 $ t_nu = j^(- 1) \, wide I_nu = \[ j^(- j) \, 2 j^(- j) \] \, wide u_nu in I_nu . $ <pert:parameters>]

Enumerate these types by $nu in bb(N)$ and choose constants $c_nu > 0$ with $sum_nu c_nu = 1$.
  Independently for each type, put $n_nu tilde.op "Poisson" \( c_nu s_N \)$, where $s_N = N^(3 \/ 4)$.
  Each term has an independent uniform site $i in \[ N \]$ and an independent copy of its mark process.
  At a leaf it multiplies the spin weight by

#[#set math.equation(numbering: n => "(6.2)")
 $ psi_nu = 1 + t_nu g sigma_i + u_nu g_0 S_0 . $ <pert:factor>]

In particular $1 \/ 2 < psi_nu < 3 \/ 2$. Counts, types, and sites belong to the root;
  the mark variables are sampled with their product priors at their assigned auxiliary depths.
  Since the total count is $"Poisson" \( s_N \)$, this construction uses only finitely many terms almost surely.
  The factor bound permits termwise comparison through the power means, as in (5.3).

Write $pi$ for the product of the uniform probability measures on the intervals $I_nu$,
  and $upright(bold(u)) = \( u_nu \)_nu$. We use $pi$ to select deterministic parameter vectors,
  not as part of their quenched law. Each interval has fixed positive length for a fixed type;
  concentration estimates may therefore depend on its length.

=== 6.2 Concentration of each perturbation score <concentration-of-each-perturbation-score>

For one type $nu$, define on a tilted path, including its terminal Gibbs configuration,

#[#set math.equation(numbering: n => "(6.3)")
 $ D_nu = sum_(q = 1)^(n_nu) frac(g_(0 \, q) S_(0 \, q), 1 + t_nu g_q sigma_(i_q) + u_nu g_(0 \, q) S_(0 \, q)) .
   $ <pert:score>]

Let $chevron.l dot.op chevron.r$ denote expectation along one tilted path conditional on the root,
  and let $bb(E)_(upright(bold(u)))$ average the root at fixed $upright(bold(u))$. Define

#[#set math.equation(numbering: n => "(6.4)")
 $ e_(nu \, N) \( upright(bold(u)) \) = frac(1, c_nu s_N) bb(E)_(upright(bold(u))) chevron.l \| D_nu -
   bb(E)_(upright(bold(u))) chevron.l D_nu chevron.r \| chevron.r . $ <pert:error>]

#thm([Lemma 6.1.])[
  (Averaged score concentration).  #emph[For each fixed $L$ and each fixed type $nu$,
#[#set math.equation(numbering: n => "(6.5)")
 $ integral e_(nu \, N) \( upright(bold(u)) \) thin pi \( d upright(bold(u)) \) arrow.r 0 . $ <pert:concentration-eq>]

 The assertion holds for the reservoir as well as for the original system.
   Constants need not be uniform in $L$ or $nu$.]
] <pert:concentration>

#proof[
  Hold the other parameters fixed, write $u = u_nu$, $n = n_nu$, and put $lambda_nu = c_nu s_N$.
    Choose an open interval $J_nu$ containing $I_nu$ such that $\| t_nu \| + \| u \| < 1 \/
    2$ throughout its closure. On this interval, pathwise,
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| D_nu \| lt.eq 2 n \, wide - 4 n lt.eq partial_u D_nu = -
     sum_(q = 1)^n frac(\( g_(0 \, q) S_(0 \, q) \)^2, psi_(nu \, q)^2) lt.eq 0 . $ <pert:score-bounds>]
  ===== 6.2.1 Fluctuations along a tilted path. <fluctuations-along-a-tilted-path.>
  Let $X_0 \( u \)$ be the random root log partition function before taking the root expectation.
    To include the last step in the differentiation, regard the logarithm of the spin weight as $X_L$ and the spin
    partition function as the step with exponent $m_L = 1$. Differentiation of one backward step gives
  $ partial_u X_(d - 1) = K_d \( partial_u X_d \) \, wide partial_u^2 X_(d - 1) = K_d \( partial_u^2 X_d \) +
    m_d "Var"_(K_d) \( partial_u X_d \) . $
  Thus, for $M_d = chevron.l D_nu divides cal(F)_d chevron.r$,
  #[#set math.equation(numbering: n => "(6.7)")
   $ X'_0 \( u \) & = chevron.l D_nu chevron.r \,\
X''_0 \( u \) & = chevron.l partial_u D_nu chevron.r + sum_(d = 1)^L m_d chevron.l \( M_d - M_(d - 1) \)^2 chevron.r\
 & gt.eq m_1 "Var" \( D_nu divides cal(F)_0 \) - 4 n . $ <pert:first-derivative>]
  Here the conditional expectations and variances use the tilted path law at the current $u$.
    At fixed root all derivatives are justified by the bounded score and its derivatives;
    the finite recursion then justifies the displayed differentiation formulas.
    Their root expectations are justified by the finite moments of the Poisson counts.
  Integrating (6.7) over $I_nu = \[ a \, b \]$ and using $\| X'_0 \| lt.eq 2 n$ yields
  #[#set math.equation(numbering: n => "(6.8)")
   $ integral_a^b bb(E)_(upright(bold(u))) "Var" \( D_nu divides cal(F)_0 \) thin d u lt.eq
     frac(4 lambda_nu \( 1 + b - a \), m_1) . $ <pert:thermal-variance>]
  Consequently the interval-averaged thermal mean absolute deviation, divided by $lambda_nu$, is at most
  #[#set math.equation(numbering: n => "(6.9)")
   $ (frac(4 \( 1 + \| I_nu \| \), m_1 \| I_nu \| lambda_nu))^(1 \/ 2) . $ <pert:thermal-bound>]
  ===== 6.2.2 Fluctuations of the root mean. <fluctuations-of-the-root-mean.>
  It remains to concentrate $X'_0$ over the root. By (6.7), the random function
  $ G \( u \) = X_0 \( u \) + 2 n u^2 $
  is convex on $J_nu$. Uniformly for $u in J_nu$ and all the other parameters,
  #[#set math.equation(numbering: n => "(6.10)")
   $ "Var" \( G \( u \) \) lt.eq C_nu N \, wide \| bb(E)_(upright(bold(u))) G' \( u \) \| lt.eq
     C_nu lambda_nu . $ <pert:root-variance>]
  To prove the first estimate, condition on the physical and total perturbation counts.
    Conditional on the latter count, its types and sites are independent labels;
    changing a label replaces a single bounded factor. Apply the Efron–Stein variance
    inequality #cite(label("EfronStein")) $"Var" Z lt.eq 1 / 2 sum_j bb(E) \( Z - Z^(\( j \)) \)^2$,
    where $Z^(\( j \))$ is obtained by independently resampling the $j$th input.
    For completeness, with independent inputs $X_1 \, dots.h \, X_k$,
    let $E_j$ integrate only $X_j$ and let $cal(G)_j = sigma \( X_1 \, dots.h \, X_j \)$.
    The Doob differences are $D_j = bb(E) \[ Z - E_j Z divides cal(G)_j \]$. Orthogonality and Jensen give
  $ "Var" Z = sum_j bb(E) D_j^2 lt.eq sum_j bb(E) \( Z - E_j Z \)^2 = 1 / 2 sum_j bb(E) \( Z - Z^(\( j \)) \)^2 . $
  This independent-input decomposition requires neither identical laws nor a symmetric statistic;
    see Efron–Stein #cite(label("EfronStein")) Section 2. Resampling one interaction, field,
    or perturbation term changes $X_0$ by a bounded amount: this is immediate for the spin weights and is
    preserved by each power mean. When a term is removed, its unused independent mark variables can be integrated
    out, so the same assertion holds for addition or deletion of a term.
    Conditional variances are therefore bounded by a constant times the number of root variables.
    Conditional means are Lipschitz functions of the counts, with bounded Lipschitz constants.
    If $Q \, Q'$ are independent copies of a Poisson variable and $b$ is $C$-Lipschitz, then
  $ "Var" \( b \( Q \) \) = 1 / 2 bb(E) \( b \( Q \) - b \( Q' \) \)^2 lt.eq C^2 "Var" \( Q \) . $
  Applying this to the independent counts completes the $O \( N \)$ estimate.
    The correction $2 n u^2$ obeys the same estimates. The derivative bound in (6.10) follows directly from (6.6).
  ===== 6.2.3 Passing from a convex function to its derivative. <passing-from-a-convex-function-to-its-derivative.>
  Put $macron(G) = bb(E)_(upright(bold(u))) G$ and $Z = G - macron(G)$.
    If $u plus.minus rho$ lie in $J_nu$, forward and backward difference quotients imply
  $ \| G' \( u \) - macron(G)' \( u \) \| & lt.eq
    frac(\| Z \( u - rho \) \| + 2 \| Z \( u \) \| + \| Z \( u + rho \) \|, rho)\
 & quad + macron(G)' \( u + rho \) - macron(G)' \( u - rho \) . $
  The monotonicity of $macron(G)'$ gives
  $ integral_a^b \[ macron(G)' \( u + rho \) - macron(G)' \( u - rho \) \] thin d u lt.eq
    2 rho \[ macron(G)' \( b + rho \) - macron(G)' \( a - rho \) \] . $
  Together with (6.10), this proves
  #[#set math.equation(numbering: n => "(6.11)")
   $ frac(1, \| I_nu \|) integral_(I_nu) bb(E)_(upright(bold(u))) \| G' \( u \) -
     bb(E)_(upright(bold(u))) G' \( u \) \| thin d u lt.eq C_nu
     (sqrt(N) / rho + frac(rho lambda_nu, \| I_nu \|)) . $ <pert:convex-bound>]
  For all sufficiently large $N$, take $rho = N^(- 1 \/ 8)$, which lies within the fixed neighborhood margin.
    After division by $lambda_nu = c_nu N^(3 \/ 4)$, both terms tend to zero.
    Removing the correction to $G'$ costs at most $C_nu bb(E) \| n - lambda_nu \| \/ lambda_nu lt.eq
    C_nu lambda_nu^(- 1 \/ 2)$. Thus the root contribution to (6.4) tends to zero.
    Combining it with (6.9) proves the result after integration over $u_nu$.
    All estimates are uniform in the other parameters, so their integration against the remaining product measure
    proves (6.5). ◻
]

=== 6.3 One sequence for low increments and all identities <one-sequence-for-low-increments-and-all-identities>

The parameter choices must satisfy concentration and a low cavity increment simultaneously.
  Let $underline(F) = liminf_N F_N$ over all system sizes for the bounded model.
  Recall that $P_N^(L \, upright(bold(u)))$ denotes the root-averaged perturbed log partition function,
  and put $Delta_N \( upright(bold(u)) \) = P_(N + 1)^(L \, upright(bold(u))) - P_N^(L \, upright(bold(u)))$.

#thm([Lemma 6.2.])[
  (Deterministic parameter selection).  #emph[For every fixed $L gt.eq 2$ and $epsilon > 0$,
    there are sizes $N_j arrow.t oo$ and deterministic vectors $upright(bold(u))_j$ such that]
  + #emph[$Delta_(N_j) \( upright(bold(u))_j \) lt.eq underline(F) + 2 epsilon$;]
  + #emph[for every fixed type $nu$, $e_(nu \, N_j) \( upright(bold(u))_j \) arrow.r 0$ in the reservoir;]
  + #emph[in the reservoir, the expectations of every finite product of multioverlaps on every fixed finite
    prescribed tree of depth $L$ converge along this sequence.]
] <pert:selection>

#proof[
  #emph[Find low averaged increments.] The uniform perturbation bound (5.3) gives
  $ liminf_N 1 / N integral P_N^(L \, upright(bold(u))) thin pi \( d upright(bold(u)) \) = underline(F) . $
  Hence infinitely many $N$ satisfy $integral Delta_N thin d pi lt.eq underline(F) + epsilon$:
    otherwise telescoping the averaged increments would contradict this liminf.
    10 supplies a constant $C$ such that $\| Delta_N \( upright(bold(u)) \) \| lt.eq C$ uniformly.
  ===== 6.3.1 Choose parameters with small score errors. <choose-parameters-with-small-score-errors.>
  For a finite collection of types, Lemma 11 and Markov’s inequality show that the set where all its errors are
    small has parameter measure tending to one. More explicitly,
    choose $N_j$ successively among the preceding infinite set so large that
  $ sum_(nu lt.eq j) integral e_(nu \, N_j) \( upright(bold(u)) \) thin pi \( d upright(bold(u)) \) lt.eq j^(- 3) . $
  Then the set $G_j$ where $e_(nu \, N_j) lt.eq j^(- 1)$ for all $nu lt.eq j$ has complement of measure $q_j lt.eq
    j^(- 2)$. Its conditional mean increment is at most
  $ frac(underline(F) + epsilon + C q_j, 1 - q_j) lt.eq underline(F) + 2 epsilon $
  for all sufficiently large $j$. A vector in $G_j$ with increment at most $underline(F) +
    2 epsilon$ can therefore be chosen. Relabeling the tail proves (i) and (ii).
  ===== 6.3.2 Make all finite-tree moments converge. <make-all-finite-tree-moments-converge.>
  At fixed $L$ the finite labeled tree shapes and finite products of their multioverlaps form a countable
    collection. Each such product is bounded by one in absolute value.
    A diagonal subsequence gives (iii), without affecting (i) or (ii). ◻
]

From now on $L$ is fixed and $N arrow.r oo$ means convergence along a sequence from Lemma 12.
  Expectations below are evaluated at the selected deterministic vector, whose dependence on $N$ is suppressed.
  No uniformity in $L$, in the number of paths, or in a perturbation type is asserted for these limits.

=== 6.4 Poisson insertion and analytic extraction <poisson-insertion-and-analytic-extraction>

Fix an old labeled tree $cal(T)$, a distinguished leaf $a_(*)$,
  and a bounded polynomial $f$ in multioverlaps of its old replicas.
  The polynomial and its coefficients are fixed as $N$ and the insertion parameters vary.
  The root-averaged expectation on this tree is denoted simply by $bb(E) f$.
  The anchor marginal is always one tilted path. Therefore (6.4) implies, for each fixed type $nu$,

#[#set math.equation(numbering: n => "(6.12)")
 $ lr(|frac(bb(E) \[ f D_nu^(a_(*)) \] - bb(E) f thin bb(E) chevron.l D_nu chevron.r, c_nu s_N)|) lt.eq
   parallel f parallel_oo e_(nu \, N) arrow.r 0 . $ <pert:score-identity>]

For a fixed mark specification, introduce an independent new uniform site and an independent copy of its mark
  process, and set $A = 1 + t g sigma_i + u g_0 S_0$. Let $Y$ be its insertion recursion from Lemma 2,
  and let $W_(cal(T)) \( A \)$ be the updated-tree density (3.5).
  The expectations in the following display use the unmodified reservoir,
  extended by the independent insertion variables with their prior kernels:

#[#set math.equation(numbering: n => "(6.13)")
 $ J_(N \, cal(T)) \( t \, u \) & = bb(E) [f thin frac(g_0^(a_(*)) S_0^(a_(*)), A^(a_(*))) W_(cal(T)) \( A \)] \,\
H_N \( t \, u \) & = J_(N \, cal(T)) \( t \, u \) - bb(E) f thin J_(N \, { a_(*) }) \( t \, u \) .
  $ <pert:palm-expression>]

In the single-anchor expression $J_(N \, { a_(*) })$, the test is $1$.

#thm([Lemma 6.3.])[
  (Palm identity).  #emph[If $nu$ is a type with the specified marks, then
#[#set math.equation(numbering: n => "(6.14)")
 $ \| H_N \( t_nu \, u_nu \) \| lt.eq parallel f parallel_oo e_(nu \, N) . $ <pert:palm-bound>]

 For a fixed mark specification the function $H_N \( t \, u \)$ is the same for all its types $j$:
   its base reservoir contains the full original Poisson families, including all types.]
] <pert:palm>

#proof[
  Apply the Poisson add-one identity to the sum over type-$nu$ terms in $D_nu$.
    After division by its mean $c_nu s_N$, the remaining count is again Poisson with mean $c_nu s_N$,
    and all the other counts are unchanged. Thus the remaining model has exactly the original reservoir law.
    The distinguished term becomes an independent new insertion with parameters $t_nu \, u_nu$.
    Its score is $g_0^(a_(*)) S_0^(a_(*)) \/ A^(a_(*))$. The updated tree density is (3.5),
    so the anchor factor $A^(a_(*))$ cancels. This proves
  $ frac(bb(E) \[ f D_nu^(a_(*)) \], c_nu s_N) = J_(N \, cal(T)) \( t_nu \, u_nu \) \, wide
    frac(bb(E) chevron.l D_nu chevron.r, c_nu s_N) = J_(N \, { a_(*) }) \( t_nu \, u_nu \) . $
  Equation (6.14) now follows from (6.12). In particular no type has been deleted from the law of the base
    reservoir. This proves the last assertion. ◻
]

#thm([Lemma 6.4.])[
  (Vanishing insertion coefficients).  #emph[For every mark specification included in the perturbation family,
    old tree, anchor, and bounded overlap-polynomial test $f$, every Taylor coefficient at $t =
    0$ of $H_N \( t \, 0 \)$ tends to zero along the selected sequence.]
] <pert:analytic>

#proof[
  Lemma 4 gives a complex neighborhood $\| t \| \, \| u \| <
    rho$ on which the functions in (6.13) are analytic and uniformly bounded in $N$ and in the selected parameter
    vector. Shrinking $rho$ gives a uniform bound on their $u$-derivatives as well.
    These constants may depend on the fixed tree, $L$, and $parallel f parallel_oo$,
    but not on the type index $j$ in the mark specification.
  Each Taylor coefficient of $H_N \( t \, 0 \)$ is a finite linear combination of multioverlap moments and
    products of two such moments on prescribed trees. Their coefficients are determined by the fixed tree,
    exponents, mark law, and polynomial test, and are independent of $N$.
    Indeed the canceled anchor expansion supplies finitely many extensions at any fixed order;
    averaging the independent insertion site turns its spin product into a multioverlap.
    These coefficients converge by Lemma 12(iii). The uniform analytic bound then implies,
    by the geometric bound on the Taylor tails, that $H_N \( t \, 0 \)$ converges uniformly on each smaller disk
    to an analytic function $H \( t \)$.
  For every sufficiently large fixed $j$, the corresponding type and Lemma 13 give
  $ limsup_(N arrow.r oo) \| H_N \( j^(- 1) \, 0 \) \| lt.eq C limsup_(N arrow.r oo) \| u_(nu \, N) \| lt.eq
    2 C j^(- j) . $
  Here the score error tends to zero with $j$ fixed, and the same function $H_N$ is used for every $j$,
    by Lemma 13. Hence $\| H \( j^(- 1) \) \| lt.eq 2 C j^(- j)$.
    If the first nonzero Taylor coefficient of $H$ had degree $q$, then $\| H \( j^(- 1) \) \| gt.eq
    c j^(- q)$ for all sufficiently large $j$, a contradiction.
    Thus $H$ vanishes identically near zero, proving the claim coefficient by coefficient. ◻
]

=== 6.5 Prescribing the colored tree <prescribing-the-colored-tree>

The anchor is called a #emph[spin anchor] when $S_0 = sigma_i$, and a #emph[marker anchor] when $S_0 = 1$.
  Added colors are ordered $1 \, dots.h \, k$; the anchor has color $0$.
  They occupy distinct replica positions, none equal to the anchor,
  according to the canceled-anchor extension rule of Lemma 4.
  A constraint $cal(C)$ prescribes any consistent collection of their pairwise split depths,
  involving only the added colors and the anchor. It imposes no extra restrictions involving the other old
  replicas. Let $frak(E) \( cal(T) \, a_(*) \, cal(C) \)$ be the allowed extension histories,
  with coefficients $c_E$ from that lemma. For a history $E$, set

$ R_E = 1 /
  N sum_(i = 1)^N
  cases(delim: "{", sigma_i^(a_(*)) product_(j = 1)^k sigma_i^(a_j \( E \)) \, & upright("spin anchor") \,,
  product_(j = 1)^k sigma_i^(a_j \( E \)) \, & upright("marker anchor") .) $

For $k = 0$ these are respectively $R_({ a_(*) })$ and $1$.

#thm([Theorem 6.5.])[
  (Identity on prescribed trees).  #emph[ For the perturbation family defined above, along every sequence from Lemma 12,
#[#set math.equation(numbering: n => "(6.15)")
 $ sum_(E in frak(E) \( cal(T) \, a_(*) \, cal(C) \)) c_E thin bb(E) \[ f R_E \] -
   bb(E) f sum_(E in frak(E) \( { a_(*) } \, a_(*) \, cal(C) \)) c_E thin bb(E) \[ R_E \] arrow.r
   0 . $ <pert:tree-identity-eq>]

 This holds for every fixed old tree, either kind of anchor, every bounded polynomial $f$ in its multioverlaps,
   every finite number of ordered added colors, and every prescribed constraint $cal(C)$.
   The empty addition is allowed. The error is taken to zero at fixed $L$, fixed tree, and fixed constraint,
   before any limit in $L$.]
] <pert:tree-identity>

#proof[
  For $k = 0$, the claim is the vanishing constant coefficient from 14, using constant marks.
    For $k gt.eq 1$, we explain how to extract distinct colored marks.
    Fix rational-valued functions $g_0 \, g_1 \, dots.h \, g_k$,
    all bounded by one and constructed jointly from the same finite collection of auxiliary marks.
    The mixed insertion uses $A = 1 + sum_(j = 1)^k z_j g_j sigma_i$.
    Its mixed derivative in all $z_j$ is the symmetric multilinear form obtained by polarizing the degree-$k$
    coefficient for a single $g$. More explicitly, if $Q_N \( g \) = k ! \[ t^k \] H_N \( t \, 0 \)$,
    then the mixed derivative is
  $ frac(k^k, 2^k k !) sum_(epsilon.alt in { - 1 \, 1 }^k) (product_(j = 1)^k epsilon.alt_j) Q_N
    (k^(- 1) sum_(j = 1)^k epsilon.alt_j g_j) . $
  Every argument of $Q_N$ is rational-valued and bounded by one,
    so each resulting pair $\( g \, g_0 \)$ belongs to the fixed mark family.
    Lemma 14 makes the displayed mixed derivative tend to zero.
    The mixed derivative expansion is precisely the ordered extension rule:
    there is no additional factorial in its coefficients.
  It remains to arrange that the expectation over the marks selects exactly the extensions satisfying $cal(C)$.
    For a pair of colors $a \, b in { 0 \, dots.h \, k }$ and a depth $1 lt.eq d lt.eq L - 1$,
    the event that their split depth is at least $d$ is the event that they share their vertex at depth $d$.
    Introduce a new independent Rademacher coordinate at that depth and give both $g_a$ and $g_b$ its factor.
    Its contribution to their joint mark expectation is $1$ if the vertex is shared and $0$ otherwise.
    For a finite collection of such requirements, use different independent coordinates for the different
    requirements and define each $g_a$ as the product of its assigned factors. Then
  #[#set math.equation(numbering: n => "(6.16)")
   $ bb(E)_(upright("marks")) [g_0^(a_(*)) product_(j = 1)^k g_j^(a_j \( E \))] =
     product_(\( a \, b \, d \) med upright("required"))
     upright(bold(1))_({ a \, b upright(" share their depth-") d upright(" vertex") }) . $ <pert:mark-selector>]
  All marks in this calculation are independent of the base reservoir.
  Let $H_d \( a \, b \)$ denote the sharing indicator in (6.16), with $H_0 = 1$ and $H_L =
    0$ for distinct replica positions. These are positions in the sampled tree,
    even when their spin configurations happen to agree. Exact splitting at depth $d$ is expressed by $H_d -
    H_(d + 1)$, for $0 lt.eq d lt.eq L - 1$. Products and finite linear combinations therefore select any
    prescribed consistent colored shape or collection of allowed shapes.
    For each term of this finite linear combination, the functions $g_0 \, dots.h \,
    g_k$ are products of signs and hence take values in ${ - 1 \, 1 }$.
    These functions and their polarization averages belong to the mark family fixed at the start of the section.
    Constant marks cover $k = 0$.
  Finally apply the mixed canceled-anchor expansion to the difference (6.13),
    average the marks using the selector, and average the independent uniform insertion site.
    The latter average is exactly $R_E$. Lemma 14 and polarization make the coefficient difference tend to zero,
    yielding (6.15). Finite linear combinations extend the conclusion from overlap monomials to the stated tests.
    The construction uses only marks through depth $L - 1$: the extension rule never reuses the anchor or an
    already used color, so no test of coincidence at depth $L$ is required. ◻
]

#prodef([Remark 6.6.])[
  (Order of the choices).  The mark specifications and their positive weights $c_nu$ are fixed first,
    for a fixed $L$. Parameter averaging then gives one selected sequence on which all types concentrate and all
    finite overlap moments converge. The analytic argument takes $N arrow.r
    oo$ with each $j$ fixed before sending $j arrow.r oo$. Only after the resulting prescribed-tree identities
    have been established is $L$ allowed to increase. No concentration estimate uniform over the countable family
    is needed.
]

== 7 Decorrelation on prescribed trees <decor:section>

Throughout this section $m_d = d \/ L$ and $delta = L^(- 1)$.
  For each fixed $L$, all limits in $N$ are along the sizes and parameter choices supplied by 12;
  they satisfy the identities of 15. Different values of $L$ may use different sequences.
  The argument uses only these identities and the tree sampling rules; in particular,
  it does not use the interaction factorization.

Our goal is concentration of every finite multioverlap, averaged over separated interior branching depths.
  These are the averages needed for the comparison with independent messages in 8.

=== 7.1 Averages over depths <decor:averages>

A topology is a finite rooted tree on labeled leaves, with unary vertices suppressed.
  Each branching vertex is assigned an integer depth in ${ 0 \, dots.h \, L - 1 }$,
  increasing strictly along every branch. Write $b \( S \)$ for the number of branching vertices of a topology
  $S$. Fix $eta > 0$. A depth assignment is #emph[$eta$-regular] if every assigned depth divided by $L$ lies in
  $\( eta \, 1 - eta \)$ and the normalized depths of distinct branching vertices differ by more than $eta$.
  When an additional prefix depth $d$ is specified, it must satisfy the same restrictions relative to all
  branching depths. When two copies of one topology use aligned depths,
  corresponding vertices share one depth coordinate; regularity is imposed on these distinct coordinates.

For a nonnegative array $z \( upright(bold(q)) \)$ on $a$ depth coordinates, put

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(A)_(L \, eta) z = L^(- a) sum_(upright(bold(q)) thick eta upright("-regular")) z \( upright(bold(q)) \) .
   $ <decor:average-definition>]

Additional ordering restrictions, such as $d < min_v q_v$, are included in the summation domain.
  These are unnormalized averages: their total mass is at most one. Consequently, for $0 < gamma lt.eq 1$,

#[#set math.equation(numbering: n => "(7.2)")
 $ cal(A)_(L \, eta) \( z^gamma \) lt.eq \( cal(A)_(L \, eta) z \)^gamma . $ <decor:average-holder>]

Two elementary comparisons will recur. Summing over an unused coordinate costs at most $L$,
  canceled by its normalization. A fixed integer shift of any subset of the coordinates maps $eta$-regular
  assignments injectively into $eta \/ 2$-regular assignments for all sufficiently large $L$.

There are only finitely many labeled topologies of any bounded size and, at fixed $L$,
  only finitely many assignments of their depths. Thus errors in Theorem 15 can be maximized over any of the
  finite collections used below before taking $N arrow.r oo$.
  We denote such a maximum by $epsilon_(N \, L \, k)$; for each fixed $L \, k$,

#[#set math.equation(numbering: n => "(7.3)")
 $ epsilon_(N \, L \, k) arrow.r 0 . $ <decor:identity-error>]

Constants multiplying this error may depend arbitrarily on $L$.

Recall that $R_S$ is the multioverlap of the sampled leaves of $S$, defined in (3.1).
  The result to be proved is the following.

#thm([Theorem 7.1.])[
  #emph[For every fixed labeled topology $S$,
#[#set math.equation(numbering: n => "(7.4)")
 $ lim_(L arrow.r oo) limsup_(N arrow.r oo) cal(A)_(L \, eta) "Var" \( R_S \) = 0 wide \( eta > 0 \) \,
   $ <decor:overlap-concentration-equation>]

 where only the $b \( S \)$ branching depths are averaged.
   For a singleton, whose average has no coordinates, $"Var" \( R_S \) arrow.r 0$ as $N arrow.r oo$ at every fixed $L$.]
] <decor:overlap-concentration>

The proof has two parts. First we control the randomness below a sampled prefix through the squared conditional
  covariance of the spin-product vector. This is an induction on the number of leaves;
  delaying the target splits by one level will control its signed extension coefficients.
  We then use a marker anchor to concentrate the remaining conditional mean at each fixed depth.
  Averaging over depths is essential when combining the two estimates.

=== 7.2 Conditional covariance and continuity in depth <conditional-covariance-and-continuity-in-depth>

For a sampled copy of $S$, set

$ A_S = (product_(a in S) sigma_i^a)_(i lt.eq N) \, wide R_S = upright(bold(1)) dot.op A_S \, wide x dot.op y =
  N^(- 1) sum_(i = 1)^N x_i y_i \, wide parallel x parallel_N^2 = x dot.op x . $

At a depth $d$ on its initial stem, including its first branching depth,
  let $cal(F)_d$ be generated by the root and the sampled prefix through $d$, and define

#[#set math.equation(numbering: n => "(7.5)")
 $ mu_(d \, S) & = bb(E) \[ A_S divides cal(F)_d \] \,\
v_N \( S \, d \) & = 1 / N^2 bb(E) sum_(i \, j = 1)^N "Cov" \( A_(S \, i) \, A_(S \, j) divides cal(F)_d \)^2 .
  $ <decor:covariance-definition>]

The expectation includes the root. Every coordinate of $A_S$ and $mu_(d \, S)$ has absolute value at most one,
  and $0 lt.eq v_N \( S \, d \) lt.eq 1$. The next lemma explains why this squared covariance is the useful
  quantity to induct on.

#thm([Lemma 7.2.])[
  (Contractions and three copies).  #emph[If a random vector $B
    in \[ - 1 \, 1 \]^N$ is conditionally independent of $A_S$ given $cal(F)_d$, then
#[#set math.equation(numbering: n => "(7.6)")
 $ parallel \( A_S - mu_(d \, S) \) dot.op B #scale(x: 120%, y: 120%)[parallel]_(L^2) lt.eq
   v_N \( S \, d \)^(1 \/ 4) . $ <decor:contraction-bound>]

 If $X \, Y \, Z$ are conditionally independent copies of a bounded random vector given a sigma field $cal(G)$,
   and $C$ is its conditional covariance matrix, then
#[#set math.equation(numbering: n => "(7.7)")
 $ bb(E) \( X dot.op Y - X dot.op Z \)^2 gt.eq 2 / N^2 bb(E) sum_(i \, j) C_(i j)^2 . $ <decor:three-copy-bound>]

]
] <decor:contractions>

#proof[
  Conditional on $cal(F)_d$ and $B$, the squared contraction has expectation $N^(- 2) sum_(i j) C_(i j) B_i B_j$.
    Its absolute value is at most $N^(- 2) sum_(i j) \| C_(i j) \|$.
    Cauchy–Schwarz, first over $i \, j$ and then over the prefix, proves (7.6).
    For the second assertion, write $mu = bb(E) \[ X divides cal(G) \]$. Conditional independence gives
  $ bb(E) \[ \( X dot.op Y - X dot.op Z \)^2 divides cal(G) \] = 2 /
    N^2 "tr" #scale(x: 120%, y: 120%)[\(] \( C + mu mu^(sans(T)) \) C #scale(x: 120%, y: 120%)[\)] gt.eq 2 /
    N^2 "tr" \( C^2 \) \, $
  since $C$ is positive semidefinite. ◻
]

#thm([Lemma 7.3.])[
  (Averaged continuity in depth).  #emph[Fix a topology $S$ and a subset $U$ of its branching vertices.
    For each $eta$-regular depth assignment, let $S^U$ have the same topology with the depths of the vertices in
    $U$ increased by one. At an ancestral evaluation depth $d$, compare the means using the same sampled prefix.
    Then, for all sufficiently large $L$,
#[#set math.equation(numbering: n => "(7.8)")
 $ cal(A)_(L \, eta) bb(E) parallel mu_(d \, S^U) - mu_(d \, S) parallel_N^2 lt.eq
   C \/ L . $ <decor:branch-depth-continuity>]

 The average ranges over all branching depths; the coordinate $d$ is also averaged if it ranges,
   and otherwise is held fixed. If $d$ ranges along an initial unary stretch of $S$, then
#[#set math.equation(numbering: n => "(7.9)")
 $ cal(A)_(L \, eta) bb(E) parallel mu_(d + 1 \, S) - mu_(d \, S) parallel_N^2 lt.eq C \/ L \,
   $ <decor:evaluation-depth-continuity>]

 where this average includes $d$ and all branching depths,
   and the means are evaluated along the same sampled path. The constant depends only on the number of vertices
   and shifts, uniformly in $N$, the evaluation depth, and the transition kernels.]
] <decor:depth-continuity>

#proof[
  Keep the later branching depths of $T$ fixed and sample a single path along its initial stem.
    On this path, $mu_(t \, T)$ is a bounded vector martingale. Orthogonality of its increments gives
  #[#set math.equation(numbering: n => "(7.10)")
   $ sum_t bb(E) parallel mu_(t + 1 \, T) - mu_(t \, T) parallel_N^2 lt.eq 1 . $ <decor:martingale-energy>]
  This proves the evaluation-depth assertion after summing over the ranged depth and dividing by $L$.
  Consider a branching vertex at depth $q$ with child shapes $T_1 \, dots.h \, T_s$.
    Holding their later depths fixed, its original conditional mean is $product_j mu_(q \, T_j)$,
    with products understood coordinatewise. If the split is delayed to $q + 1$,
    its conditional mean at the same prefix of depth $q$ is
    $bb(E) \[ product_j mu_(q + 1 \, T_j) divides cal(F)_q \]$,
    where the child means are evaluated on a common one-step continuation.
    Jensen’s inequality and the product difference inequality on $\[ - 1 \, 1 \]^s$ yield
  #[#set math.equation(numbering: n => "(7.11)")
   $ bb(E) ∥product_j mu_(q \, T_j) - bb(E) [product_j mu_(q + 1 \, T_j) divides cal(F)_q]∥_N^2 lt.eq
     s sum_j bb(E) parallel mu_(q + 1 \, T_j) - mu_(q \, T_j) parallel_N^2 . $ <decor:one-vertex-shift>]
  Summing over $q$ uses (7.10) with each child shape fixed.
    Propagating a changed subtree mean towards an ancestral evaluation consists of conditional expectations and
    multiplication by factors bounded by one. Both operations contract this squared norm.
    Averaging over all other depth coordinates therefore proves the claimed $C \/ L$ bound for one shift.
    For several shifts, change the vertices one at a time and use the squared triangle inequality with a factor
    equal to the number of shifts. Regularity ensures that the intermediate shapes have the same ancestry
    relations and, for large $L$, lie in the enlarged $eta \/ 2$-regular domain.
    All relevant one-prefix marginal laws are unchanged when other sampled branches are omitted,
    so these estimates hold in any larger sampled tree. ◻
]

Suppose now that $S$ first branches at depth $e$ into proper child shapes $T_1 \, dots.h \, T_s$.
  Conditional independence of the children gives $mu_(e \, S) = product_j mu_(e \, T_j)$. Write

#[#set math.equation(numbering: n => "(7.12)")
 $ a_(S \, e) = product_(j = 1)^s mu_(e \, T_j) \, wide p_N \( S \, e \) =
   sum_(j = 1)^s v_N \( T_j \, e \)^(1 \/ 4) . $ <decor:projection-definition>]

For any vector $B in \[ - 1 \, 1 \]^N$ independent of the continuation of $S$ given its prefix at $e$,
  successive replacement of the children, using (7.6), gives

#[#set math.equation(numbering: n => "(7.13)")
 $ parallel \( A_S - a_(S \, e) \) dot.op B parallel_(L^2) lt.eq p_N \( S \, e \) . $ <decor:projection-bound>]

At each replacement the other child vectors and the already replaced means form a bounded multiplier independent
  of the child being replaced, conditionally on $cal(F)_e$.
  In particular this applies to $B = upright(bold(1))$, and to a vector sampled on another side separated before
  $e$. For two such sides, both can be projected with total $L^2$ error at most $2 p_N \( S \, e \)$.
  Multiplication of the contracted error by any scalar test $f$ with $\| f \| lt.eq 1$, even a correlated one,
  does not increase its $L^1$ bound.

=== 7.3 Conditional decorrelation <conditional-decorrelation>

#thm([Proposition 7.4.])[
  #emph[For every fixed labeled topology $S$ and every $eta > 0$,
#[#set math.equation(numbering: n => "(7.14)")
 $ lim_(L arrow.r oo) limsup_(N arrow.r oo) cal(A)_(L \, eta) v_N \( S \, d \) = 0 \,
   $ <decor:conditional-concentration-equation>]

 where the average ranges over all branching depths of $S$ and an additional regular depth $d$ strictly before its
   first split. For a singleton, the average ranges over $d$ alone.]
] <decor:conditional-concentration>

#proof[
  We induct on the number $k$ of leaves. The induction replaces each proper child by its conditional mean.
    It then applies the prescribed-tree identity to two copies with delayed branching depths;
    after summing the signed coefficients, this becomes a nonnegative three-copy estimate.
    To keep track of the depth averages, let
  #[#set math.equation(numbering: n => "(7.15)")
   $ V_(k \, L) \( eta \) = max_(1 lt.eq \| S \| lt.eq k) limsup_(N arrow.r oo) cal(A)_(L \, eta)
     v_N \( S \, d \) . $ <decor:V-definition>]
  The maximum is over finitely many labeled topologies. Averages of any lower-order covariance used below,
    including averages with extra unused coordinates or shifted depths,
    are bounded by the appropriate $V_(k - 1 \, L) \( eta \/ 2 \)$, using (7.2) when fractional powers occur.
  ===== 7.3.1 One leaf. <one-leaf.>
  Take two old paths splitting at $d$, with path $1$ a spin anchor,
    and add one color required to split from the anchor exactly at $d$.
    The available old path $2$ has coefficient $1$. A fresh path can split from both old paths at $d$,
    with coefficient $- c_d$, or follow path $2$ and leave it at $ell > d$, with coefficient $- c_ell$, where
  #[#set math.equation(numbering: n => "(7.16)")
   $ c_d = 2 m_(d + 1) - m_d = \( d + 2 \) delta \, wide c_ell =
     delta quad \( d < ell lt.eq L - 1 \) . $ <decor:c-weights>]
  From the anchor alone the total coefficient is $- delta$.
    Write $X = R_12$ and $X_ell = R_13$ for the corresponding fresh extension.
    Each $X_ell$ has the marginal law of $X$, and $sum_(ell = d)^(L - 1) c_ell = 1 + delta$.
    The prescribed-tree identity with $f = X$ therefore gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ 1 / 2 sum_(ell = d)^(L - 1) c_ell bb(E) \( X - X_ell \)^2 = delta "Var" \( X \) + o_N \( 1 \) lt.eq delta +
     o_N \( 1 \) . $ <decor:singleton-identity>]
  For $ell = d$, the three spin vectors are conditionally independent below $d$.
    Hence (7.7) and $c_d gt.eq eta$ give $v_N \( S \, d \) lt.eq delta \/ eta + o_N \( 1 \)$ at each fixed $L \,
    d$. This proves $V_(1 \, L) \( eta \) lt.eq delta \/ eta$.
  ===== 7.3.2 Shifted copies and their coefficients. <shifted-copies-and-their-coefficients.>
  Let $\| S \| = k gt.eq 2$, its first split be $e > d$, and its proper child shapes be $T_1 \, dots.h \, T_s$.
    Sample an old tree consisting of two copies of $S$, denoted I and II,
    whose stems split at $d$ and whose internal depth assignments are aligned.
    Fix an old leaf in I as the spin anchor. Let $S^(+)$ be the topology $S$ with every internal branching depth
    increased by one. In the prescribed-tree identity require the anchor and the added colors to form two copies
    of $S^(+)$, separated at $d$, with the anchor in its original labeled position in the first copy.
    These constraints involve only the anchor and the added colors.
    Add all other colors of side I first, then those of side II. 1 illustrates one local shift.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-3.045, -0.82), (2.415, -0.82), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-3.045, -1.64), (2.415, -1.64), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((-3.045, -0.82), [#text(size: 9pt)[$e$]], anchor: "east", padding: 0.1176cm)
  content((-3.045, -1.64), [#text(size: 9pt)[$e+1$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (0, -0.82), (-1.05, -1.64), (-2.1, -2.624), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, -0.82), (1.575, -2.624), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-1.05, -1.64), (-0.0525, -2.624), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  circle((0, -0.82), radius: 0.07056, fill: black, stroke: none)
  circle((-1.05, -1.64), radius: 0.07761, fill: rgb("#0000a6"), stroke: none)
  content((0, 0), [#text(size: 9pt)[common stem]], anchor: "south", padding: 0.1176cm)
  content((-2.1, -2.624), [#text(size: 9pt)[anchor]], anchor: "north", padding: 0.1176cm)
  content((-0.0525, -2.624), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[new child]]], anchor: "north", padding: 0.1176cm)
  content((1.575, -2.624), [#text(size: 9pt)[old leaf]], anchor: "north", padding: 0.1176cm)
  content((-0.525, -2.132), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$- delta$]]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: One local effect of delaying a target split. The old tree is solid; the dashed child creates a split at the previously unary depth-$e + 1$ vertex, with coefficient $m_(e + 1) - m_(e + 2) = - delta$. The proof shifts every internal target depth and charges distinct vertices separately, even when their depths coincide. Later target colors may reuse eligible old leaves. ],
  ) <decor:shift-figure>
  Let $kappa \( T \)$ be the reference coefficient (3.13), and put
  #[#set math.equation(numbering: n => "(7.18)")
   $ J = kappa \( S^(+) \)^2 . $ <decor:J-definition>]
  At each vertex the $j = 1$ factor is $- delta$; for $j gt.eq
    2$ its absolute value is at least $eta \/ 2$ for all sufficiently large $L$. If $b = b \( S \)$, then
  #[#set math.equation(numbering: n => "(7.19)")
   $ \| J \| gt.eq c_(k \, eta) delta^(2 b) > 0 . $ <decor:J-lower-bound>]
  For large $L$, regularity ensures that each shifted depth differs from every branching depth of the old tree,
    including $d$. Thus these $2 b$ target branching vertices must be created by fresh unary splits. Lemma 6 gives
  #[#set math.equation(numbering: n => "(7.20)")
   $ frac(1, \| J \|) sum_(upright("allowed extensions")) \| c \| lt.eq C_(k \, eta) . $ <decor:relative-absolute-cost>]
  The two copies have aligned depths but distinct branching vertices: each vertex supplies its own factor $delta$.
    This is the reason for the shift. The full signed coefficient has an additional factor $-
    delta$ from separation at $d$; we divide by $J$ and leave that factor in the identity.
    Equation (7.20) then controls every projection error after division.
  ===== 7.3.3 Projecting the two target sides. <projecting-the-two-target-sides.>
  In every extension, the marginal target tree consists of two ordinary copies of $S^(+)$,
    independent below their separation at $d$. By (7.13) its multioverlap differs in $L^2$ from the contraction of
    its projected means at $e + 1$ by at most $2 p_N \( S^(+) \, e + 1 \)$.
    Change the proper child depths back by one, then change their evaluation depth from $e + 1$ to $e$.
    The product difference inequality and Lemma 19 show that this adds an error at most $h_N \( S \)$ in $L^2$, with
  #[#set math.equation(numbering: n => "(7.21)")
   $ cal(A)_(L \, eta) h_N \( S \)^2 lt.eq C_k \/ L . $ <decor:projection-shift-error>]
  One can take $h_N \( S \)$ to be the sum of the finitely many $L^2 \( parallel dot.op parallel_N \)$ distances
    in these comparisons, multiplied by a size-dependent constant.
    This definition depends only on the single-copy marginal shapes, not on the particular extension.
    Thus (7.21) holds uniformly for the comparisons in the extension sum,
    even though the union of the old and target trees itself need not have regular depths.
  Let $a \, b$ denote the vectors $a_(S \, e)$ on the old stems I and II.
    The target stem in I shares the old prefix through $e$ because it contains the anchor,
    so its final projected vector is $a$.
  ===== 7.3.4 The signed extension sum. <the-signed-extension-sum.>
  Set $f$ to be the overlap of all $2 k$ old leaves, an allowed fixed overlap monomial.
    All target-I additions stay in the anchor’s branch below $d$,
    so they leave the old-II stem and its child counts unchanged.
    Classify the first added path of target side II by its prefix through $e$.
    It may diverge freshly at $ell = d$, with coefficient $- c_d$,
    or follow the old II stem and diverge at $d < ell < e$, with coefficient $- c_ell = - delta$.
    In such a class let $b_ell$ be $a_(S \, e)$ on the new stem; it shares the old II prefix through $ell$.
    At $ell = d$ the stems carrying $a \, b \, b_d$ are conditionally independent below $d$.
    Every remaining possibility follows the old II prefix through $e$ and has final projected vector $b$.
    All later target paths in side II follow its first path through $e$, since their earliest split is $e + 1$.
  For a fixed extension history, retain every old path and the first target-II prefix through $e$,
    and delete all other new branches. The target-I projection $a$ already depends only on the retained old anchor
    prefix. Each deleted subtree integrates to one under its probability kernels;
    a reused old leaf introduces no new variable. The retained tree depends only on the class:
    it is the old tree with a fresh stem attached at $ell < e$, or just the old tree in the remaining class.
    The history is a combinatorial choice, not a condition on sampled values.
    Thus the joint marginal of the old paths and projected prefixes is fixed within each class.
    In particular, the expectation of $f$ times the projected overlap is constant within a class and can be
    multiplied by its total signed coefficient.
  By Lemma 5, summing later side-II colors backwards gives $kappa \( S^(+) \)$ for each first-path choice.
    Summing the side-I choices gives the other factor $kappa \( S^(+) \)$.
    The fresh class at $ell$ therefore has total coefficient $- c_ell J$.
    The total coefficient is $- delta J$, both from the old tree and from the anchor alone. Since
  $ sum_(ell = d)^(e - 1) c_ell = \( e + 1 \) delta = m_e + delta \, $
  the remaining prefix-through-$e$ class has coefficient $m_e J$.
    Thus the projected terms have the following coefficients:
  $ upright("side-II prefix") & upright("projected overlap") & upright("total coefficient")\
upright("fresh divergence at ") d lt.eq ell < e & a dot.op b_ell & - c_ell J\
upright("old prefix through ") e & a dot.op b & m_e J $
  Multiply the projected overlap in each row by $f$ and divide the prescribed-tree identity by $J$. Rearranging gives
  #[#set math.equation(numbering: n => "(7.22)")
   $ sum_(ell = d)^(e - 1) c_ell bb(E) #scale(x: 120%, y: 120%)[\[] f \( a dot.op b - a dot.op b_ell \)
     #scale(x: 120%, y: 120%)[\]] = delta #scale(x: 120%, y: 120%)[\(] bb(E) \[ f \( a dot.op b \) \] -
     bb(E) f thin bb(E) R_(upright("target")) #scale(x: 120%, y: 120%)[\)] + rho_N \( S \, d \) \,
     $ <decor:induction-identity>]
  where $R_(upright("target"))$ on the right is the target overlap in the anchor-alone extension.
    Its absolute value is at most one. The error satisfies
  #[#set math.equation(numbering: n => "(7.23)")
   $ \| rho_N \( S \, d \) \| lt.eq C_(k \, eta) #scale(x: 120%, y: 120%)[\(] p_N \( S^(+) \, e + 1 \) +
     h_N \( S \) #scale(x: 120%, y: 120%)[\)] + C_(L \, k \, eta) epsilon_(N \, L \, k) . $ <decor:induction-error>]
  Indeed, multiplying a projection error by $f$, even when correlated with it,
    costs at most its $L^2$ norm since $\| f \| lt.eq 1$. Sum these errors with absolute coefficients and apply
    (7.20). The final term includes division of the original identity error by $J$ and tends to zero at fixed $L$.
  ===== 7.3.5 Closing the induction. <closing-the-induction.>
  Equation (7.13) gives $parallel f - a dot.op b parallel_(L^2) lt.eq 2 p_N \( S \, e \)$.
    Moreover $sum_(ell = d)^(e - 1) c_ell = \( e + 1 \) delta lt.eq 1$.
    Replacing $f$ by $a dot.op b$ on the left of (7.22) therefore costs at most $4 p_N \( S \, e \)$.
    Each $a dot.op b_ell$ has the same marginal law as $a dot.op b$, so that left side becomes
  $ 1 / 2 sum_(ell = d)^(e - 1) c_ell bb(E) \( a dot.op b - a dot.op b_ell \)^2 . $
  Its summands are nonnegative and $c_d gt.eq eta$. The right side of (7.22) is bounded in absolute value by $2
    delta + \| rho_N \( S \, d \) \|$. Hence
  #[#set math.equation(numbering: n => "(7.24)")
   $ bb(E) \( a dot.op b - a dot.op b_d \)^2 lt.eq C_eta #scale(x: 120%, y: 120%)[\(] delta +
     p_N \( S \, e \) + \| rho_N \( S \, d \) \| #scale(x: 120%, y: 120%)[\)] . $ <decor:projected-three-copy>]
  Sample three copies of $A_S$ conditionally independently below $d$.
    Projecting each of the two contractions involving the first copy changes it in $L^2$ by at most $2
    p_N \( S \, e \)$. Using (7.7), (7.24), and $p_N \( S \, e \) lt.eq k$, we obtain
  #[#set math.equation(numbering: n => "(7.25)")
   $ v_N \( S \, d \) lt.eq C_(k \, eta) #scale(x: 120%, y: 120%)[\(] delta + p_N \( S \, e \) +
     p_N \( S^(+) \, e + 1 \) + h_N \( S \) #scale(x: 120%, y: 120%)[\)] +
     C_(L \, k \, eta) epsilon_(N \, L \, k) . $ <decor:covariance-induction-estimate>]
  Each child in either $p_N$ has fewer than $k$ leaves. To make the averaging step explicit,
    the aligned construction has $D = b \( S \) + 1$ distinct depth coordinates, including $d$ and $e$.
    A term belonging to $T_j$ uses only $D_j = b \( T_j \) + 1$ coordinates.
    For the shifted term these are
    $pi_j \( upright(bold(q)) \) = \( e + 1 \, \( q_v + 1 \)_(v in "Br" \( T_j \)) \)$.
    Every retained assignment has at most $L^(D - D_j)$ preimages,
    and its coordinates are $eta \/ 2$-regular for large $L$.
    If $w_j$ is the child covariance as a function of these coordinates, then, for $0 < gamma lt.eq 1$,
  #[#set math.equation(numbering: n => "(7.26)")
   $ L^(- D) sum_(upright(bold(q)) thick eta upright("-regular")) w_j \( pi_j \( upright(bold(q)) \) \)^gamma &
     lt.eq L^(- D_j) sum_(upright(bold(y)) thick eta \/ 2 upright("-regular")) w_j \( upright(bold(y)) \)^gamma\
 & lt.eq (L^(- D_j) sum_(upright(bold(y)) thick eta \/ 2 upright("-regular")) w_j \( upright(bold(y)) \))^gamma .
   $ <decor:fiber-bound>]
  The unshifted term has the same bound without translating the coordinates.
    Thus the two aligned copies use single-copy estimates; there is no restriction of an independently averaged
    pair of copies to a diagonal. Taking $gamma = 1 \/ 4$ and then $limsup_N$, and using (7.21) and (7.3), gives,
    for sufficiently large $L$,
  #[#set math.equation(numbering: n => "(7.27)")
   $ V_(k \, L) \( eta \) lt.eq C_(k \, eta) (L^(- 1 \/ 2) + V_(k - 1 \, L) \( eta \/ 2 \)^(1 \/ 4)) .
     $ <decor:induction-recursion>]
  The maximum over smaller topologies in (7.15) can be absorbed in the right side because these covariances are
    bounded by one. The base case and induction now imply $V_(k \, L) \( eta \) arrow.r 0$ for every fixed $k \,
    eta$, proving the proposition. ◻
]

=== 7.4 Concentration of every multioverlap <concentration-of-every-multioverlap>

The covariance estimate controls fluctuations below a sampled prefix.
  We now use a marker anchor to concentrate the prefix projection,
  and combine this with the averaged continuity estimate.

#proof[
  For a singleton, use the spin-anchor identity with no added colors and $f = R_S$.
    It gives $bb(E) R_S^2 = \( bb(E) R_S \)^2 + o_N \( 1 \)$.
  Suppose $S$ first splits at $e$ and has proper child shapes $T_1 \, dots.h \, T_s$.
    We will condition one step before $e$. Use $S$ as the old tree,
    designate one of its leaves as a marker anchor, and add a full copy of $S$ all of whose leaves split from the
    anchor at $e - 1$. Its first path must be fresh at $e - 1$, because the old tree has not yet branched there.
    All other target paths lie in the resulting fresh subtree.
    The extension coefficient on both sides of the prescribed-tree identity is the same nonzero number
  #[#set math.equation(numbering: n => "(7.28)")
   $ C \( S \, e \) = - delta kappa \( S \) . $ <decor:marker-coefficient>]
  The target and old copies are conditionally independent and identically distributed below $cal(F)_(e - 1)$.
    With $f = R_S$ and $M = bb(E) \[ R_S divides cal(F)_(e - 1) \]$,
    their product has conditional expectation $M^2$. On the anchor-alone side,
    deleting the marker’s continuation below $e - 1$ integrates a probability kernel to one and leaves the
    ordinary target law $S$, with mean $bb(E) R_S$. The identity therefore gives
  #[#set math.equation(numbering: n => "(7.29)")
   $ C \( S \, e \) #scale(x: 120%, y: 120%)[\(] bb(E) M^2 - \( bb(E) R_S \)^2 #scale(x: 120%, y: 120%)[\)] =
     C \( S \, e \) "Var" \( M \) = o_N \( 1 \) \, $ <decor:marker-variance-identity>]
  and hence
  #[#set math.equation(numbering: n => "(7.30)")
   $ wide "Var" \( M \) arrow.r 0 quad upright("at each fixed ") L \, S \,
     e . $ <decor:prefix-projection-concentration>]
  Division by $C \( S \, e \)$ is made only at fixed $L$; no uniform lower bound as $L arrow.r oo$ is needed.
  It remains to control the conditional variance below this prefix.
    The child covariances are evaluated at $e$, which is separated from all their branching depths;
    the move to $e - 1$ will use martingale continuity instead. Set
  $ G = upright(bold(1)) dot.op product_j mu_(e \, T_j) \, wide G_(-) =
    upright(bold(1)) dot.op product_j mu_(e - 1 \, T_j) . $
  The latter is $cal(F)_(e - 1)$-measurable. By (7.13), $bb(E) \( R_S - G \)^2 lt.eq p_N \( S \, e \)^2$.
    Keeping all proper child depths fixed, the product difference inequality and (7.10) imply
  #[#set math.equation(numbering: n => "(7.31)")
   $ cal(A)_(L \, eta) bb(E) \( G - G_(-) \)^2 lt.eq C_k \/ L . $ <decor:adjacent-prefix-error>]
  Here $e$ is itself a ranged coordinate, so the one-step increments are summed before division by $L$.
    Since conditional expectation is the optimal $L^2$ projection,
  $ bb(E) \( R_S - M \)^2 lt.eq bb(E) \( R_S - G_(-) \)^2 lt.eq 2 p_N \( S \, e \)^2 + 2 bb(E) \( G - G_(-) \)^2 . $
  Variance decomposition and (7.30) now show
  #[#set math.equation(numbering: n => "(7.32)")
   $ limsup_(N arrow.r oo) cal(A)_(L \, eta) "Var" \( R_S \) lt.eq
     C_k (L^(- 1) + V_(k - 1 \, L) \( eta \/ 2 \)^(1 \/ 2)) quad
     upright("for all sufficiently large ") L . $ <decor:variance-estimate>]
  In this estimate we used $p_N \( S \, e \)^2 lt.eq s sum_j v_N \( T_j \, e \)^(1 \/ 2)$ and (7.26) with $gamma =
    1 \/ 2$: here the full average has $D = b \( S \)$ coordinates because $d$ is absent, while still $D_j =
    b \( T_j \) + 1$. Proposition 20 finishes the proof. ◻
]

#prodef([Remark 7.5.])[
  All uncancelled small denominators in this section occur only in prescribed-tree identity errors.
    At fixed $L$ there are finitely many relevant trees, so those errors disappear before any depth average or $L$
    limit is taken. Errors that survive the $N$ limit are controlled by the uniform relative absolute-cost bound
    (7.20), the lower-order covariance averages, and the martingale estimate $C \/ L$.
    No rate of convergence in $N$ uniform in $L$ is used.
] <decor:order-of-limits>

== 8 Independent hierarchical messages and the cavity comparison <comp:section>

We turn the reservoir into a trial law in three steps: encode its full one-site branching law,
  use multioverlap concentration to separate the sites, and compare the resulting insertion logarithms.

Fix $epsilon > 0$. At each depth $L gt.eq 2$, use the sequence of sizes and deterministic parameter choices
  supplied by 12. Write $N$ for sizes on this sequence. The choices may depend on $L$,
  and all statements below concern these choices. Retain $underline(F)$ for the liminf over #emph[all] system
  sizes of the bounded model, as before selection. In particular,

#[#set math.equation(numbering: n => "(8.1)")
 $ Delta_N^(L \, upright(bold(u))_(L \, N)) lt.eq underline(F) + 2 epsilon . $ <comp:low-increments>]

=== 8.1 Encoding a single-site tree <encoding-a-single-site-tree>

#thm([Lemma 8.1.])[
  (Recursive law encoding).  #emph[For each fixed $N$, $L gt.eq 2$, and selected parameter vector,
    with the reservoir root disorder averaged, there is a deterministic trial law $zeta_(L \, N) in
    cal(M)_L$ whose single-label spin process has the same expected spin products on every prescribed tree as a
    uniformly chosen site of the reservoir. Different trial labels can be chosen independently.]
] <comp:encoding>

#proof[
  Include an independent uniform site $i in \[ N \]$ in the root variable, along with the reservoir root disorder.
    Sample the tilted reservoir auxiliary kernels along each path,
    and let $cal(G)_d$ be the sigma-field generated by this enlarged root and the full auxiliary prefix through
    depth $d$. At depth $r = L - 1$ put
  $ x = "arctanh" chevron.l sigma_i chevron.r \, $
  where the brackets denote the leaf Gibbs expectation. This is finite:
    at finite $N$ all configuration weights are strictly positive, so $- 1 < chevron.l sigma_i chevron.r < 1$.
    Thus $x$ is determined at depth $r$, before the terminal spin transition at depth $L$.
    At each terminal replica leaf, draw a spin with law $q_x$.
    Given the auxiliary prefix, these spins are independent and have exactly the one-site law of the independent
    terminal Gibbs replicas.
  Define the random measures backward by
  $ eta_(r - 1) = "Law" \( x divides cal(G)_(r - 1) \) \, wide eta_d =
    "Law" \( eta_(d + 1) divides cal(G)_d \) quad \( 0 lt.eq d < r - 1 \) . $
  Then $eta_d in cal(M)_(r - d)$, so $zeta_(L \, N) = "Law" \( eta_0 \) in cal(M)_L$.
    All state spaces are standard Borel, so these conditional probability kernels have measurable versions.
    The auxiliary priors used here may be taken to be finite products of finite mark spaces at each realized root;
    hence the same assertion also follows directly by finite sums conditional on the root counts.
  Here is an explicit verification for every branching pattern.
    Fix a descendant tree $T$ and prescribe a spin $e_a$ at each terminal leaf.
    At depth $r$, its conditional probability is $G_T \( x \) = product_a q_x \( e_a \)$.
    At depth $d < r$, let $T_1 \, dots.h \, T_j$ be the subtrees rooted at its children.
    Conditional independence of children gives the backward recursion
  $ G_T \( eta_d \) = product_(ell = 1)^j integral G_(T_ell) \( nu \) thin eta_d \( d nu \) . $
  By induction, this probability depends on the full prefix only through $eta_d$.
    Thus the nested measures preserve the joint output law of every descendant tree,
    including unary stretches and arbitrary numbers of children.
    This recursion is precisely the branching version of (2.6).
    Taking $zeta_(L \, N) = "Law" \( eta_0 \)$ preserves the root mixture as well.
    In particular, for every subset $S$ of the leaves,
  #[#set math.equation(numbering: n => "(8.2)")
   $ bb(E) product_(a in S) tau^a = 1 / N sum_(i = 1)^N bb(E) product_(a in S) sigma_i^a =
     bb(E) R_S . $ <comp:single-label-moments>]
  Use independent copies of the entire construction, including the reservoir root and uniform site,
    for different labels. The resulting messages are independent of the new physical disorder in the cavity
    insertions. ◻
]

=== 8.2 From multioverlaps to spin patterns <from-multioverlaps-to-spin-patterns>

#thm([Lemma 8.2.])[
  (Empirical-pattern comparison).  #emph[Fix a prescribed tree with $k$ leaves.
    Suppose an observable of absolute value at most one uses the replica-spin patterns at $a$ independent uniform
    site labels. Replacing these patterns by $a$ independent trial-label patterns from 22 changes its expected
    value by at most
#[#set math.equation(numbering: n => "(8.3)")
 $ a sum_(diameter eq.not S subset.eq \[ k \]) bb(E) \| R_S - bb(E) R_S \| . $ <comp:pattern-error>]

 The observable may also depend on new insertion disorder, independent of the reservoir.]
] <comp:patterns>

#proof[
  Conditional on the sampled reservoir configurations, the pattern
    $bold(sigma)_i = \( sigma_i^1 \, dots.h \, sigma_i^k \)$ at a uniform site has empirical distribution
  $ pi \( bold(e) \) = 1 / N sum_i product_(b = 1)^k frac(1 + e_b sigma_i^b, 2) =
    2^(- k) sum_(S subset.eq \[ k \]) R_S product_(b in S) e_b \, wide bold(e) in { - 1 \, 1 }^k . $
  The trial-label distribution is $macron(pi) = bb(E) pi$ by (8.2).
    Independent uniform sampling with replacement gives $pi^(⊗ a)$ conditionally in the reservoir;
    the trial distribution is $macron(pi)^(⊗ a)$. The elementary telescoping bound for product measures gives
  $ lr(bar.v.double pi^(⊗ a) - macron(pi)^(⊗ a) bar.v.double)_(upright("TV")) lt.eq
    a lr(bar.v.double pi - macron(pi) bar.v.double)_(upright("TV")) lt.eq a /
    2 sum_(diameter eq.not S subset.eq \[ k \]) \| R_S - bb(E) R_S \| . $
  Integrating a function bounded by one costs at most twice total variation.
    Conditioning on the independent insertion disorder proves the last assertion. ◻
]

Let $Q_k$ be the tree law in 3. We need the following consequence of the decorrelation theorem:

#[#set math.equation(numbering: n => "(8.4)")
 $ lim_(L arrow.r oo) limsup_(N arrow.r oo) bb(E)_(Q_k) sum_(diameter eq.not S subset.eq \[ k \]) bb(E) \| R_S -
   bb(E) R_S \| = 0 wide \( k upright(" fixed") \) . $ <comp:shape-error>]

Here and below the inner limit is along the selected fixed-$L$ sequence.
  To see this, fix $0 < eta < 1 \/ 2$, and let $frak(S)_k$ be the finite collection of labeled topologies on
  nonempty subsets of $\[ k \]$. We claim the bound

#[#set math.equation(numbering: n => "(8.5)")
 $ bb(E)_(Q_k) sum_(diameter eq.not S subset.eq \[ k \]) bb(E) \| R_S - bb(E) R_S \| lt.eq
   C_k
   (eta + L^(- 1) + sum_(U in frak(S)_k) #scale(x: 120%, y: 120%)[\(] cal(A)_(L \, eta) "Var" \( R_U \)
   #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)) . $ <comp:shape-error-bound>]

The average for a singleton has no depth coordinates. By 7,
  nonregular trees have probability at most $C_k \( eta + L^(- 1) \)$.
  On regular trees every induced subtree retains the interior and separation conditions on its branching depths.
  For a topology with $a$ branching vertices, each depth assignment has probability at most $C_k L^(- a)$.
  If an induced subtree retains $a'$ branching vertices, each assignment of its depths has at most $L^(a - a')$
  extensions to the full tree. Summing out these unused coordinates leaves exactly the normalization $L^(- a')$ in
  $cal(A)_(L \, eta)$. Cauchy–Schwarz bounds the resulting average of mean absolute deviations by
  $#scale(x: 120%, y: 120%)[\(] cal(A)_(L \, eta) "Var" \( R_U \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)$.
  Summing over the finitely many topologies and subsets, and using the bound two for each deviation on nonregular
  trees, proves (8.5). Apply 17 first at fixed $eta$, taking the fixed-$L$ limit in $N$ before $L arrow.r oo$,
  and then let $eta arrow.b 0$ to obtain (8.4).

=== 8.3 Comparison of the insertion logarithms <comparison-of-the-insertion-logarithms>

#thm([Proposition 8.3.])[
  #emph[For the trial laws of 22, with $upright(bold(m))^(\( L \)) = \( 1 \/ L \, dots.h \, \( L - 1 \) \/ L \)$,
#[#set math.equation(numbering: n => "(8.6)")
 $ lim_(L arrow.r oo) limsup_(N arrow.r oo)
   lr(|Delta_N^(L \, upright(bold(u))_(L \, N)) - cal(B)_(L - 1) \( zeta_(L \, N) \, upright(bold(m))^(\(
   L \)) \)|) = 0 . $ <comp:increment-comparison>]

]
] <comp:insertion-comparison>

#proof[
  For each insertion in 10, replace the reservoir spins at its site labels by independent spin processes from 22.
    Denote the resulting trial insertions by $tilde(A)_(upright(s))$ and $tilde(A)_(upright(b))$,
    and their recursions from (3.3) by $tilde(Y)_(0 \, upright(s))$ and $tilde(Y)_(0 \, upright(b))$.
    These recursions use the trial kernels.
  At the terminal spin transition, averaging $tilde(A)_(upright(s))$ over its independent trial spins gives
    exactly $V_(upright(s))$ in (2.7); hence $tilde(Y)_(0 \, upright(s)) = T_0 V_(upright(s))$.
    For $tilde(A)_(upright(b))$ the same transition gives a product of $K_(upright(b))$ edge factors with disjoint
    message labels. Given the physical disorder and all message prefixes at a depth,
    these label groups remain independent. Their product therefore factors through each conditional power mean,
    successively from the last level to the first. Consequently,
  $ bb(E) log tilde(Y)_(0 \, upright(b)) & = alpha \( p - 1 \) bb(E) log T_0 V_(upright(e)) \,\
log 2 + bb(E) log tilde(Y)_(0 \, upright(s)) - bb(E) log tilde(Y)_(0 \, upright(b)) & =
  cal(B)_(L - 1) \( zeta_(L \, N) \, upright(bold(m))^(\( L \)) \) . $
  By (5.5), it remains to compare the reservoir and trial insertion logarithms in the stated limits.
  Consider either insertion and first restrict its Poisson count $K$ to $K lt.eq M$, where $M$ is fixed.
    Set $C = H + B M$, $z = cosh C$, and $c = tanh C < 1$. On this event both the reservoir insertion and its
    trial version can be written as $A = z \( 1 + D \)$ with $\| D \| lt.eq c$,
    uniformly in all disorder and path variables. The deterministic term $log z$ cancels in the comparison.
  At each order $k$ of 3, the product of the $k$ copies of $D$ is a bounded function of replica-spin patterns at
    at most $p M$ labels and of independent insertion disorder.
    By 23, its evaluation error on a fixed tree is bounded by $p M sum_(S eq.not diameter) bb(E) \| R_S -
    bb(E) R_S \|$. Hence (8.4) makes its tree-averaged error tend to zero in the ordered limits.
    For every fixed $M$, truncating the expansion after $q$ terms leaves an error at most $sum_(k > q) c^k \/
    k$ on either side, uniformly in $N \, L$.
  Outside the count cutoff the original insertion logarithms, on both sides, are bounded by $H + B K$.
    Their expected contribution is therefore at most $2 bb(E) \[ \( H + B K \) upright(bold(1))_({ K > M }) \]$,
    which tends to zero as $M arrow.r oo$. This proves convergence of the expected insertion logarithms:
    explicitly, first choose $M$ to control the Poisson tail, then $q$ to control the geometric tail,
    and then take the limits in $N$ and $L$ for the finitely many remaining expansion terms.
    Together with the trial identities above and (5.5), this proves (8.6). ◻
]

#thm([Corollary 8.4.])[
  #emph[For every bounded permutation-invariant interaction law and bounded field law,
    with the functionals defined in 2,
$ liminf_(N arrow.r oo) F_N gt.eq inf_(r gt.eq 0) Phi_r . $

]
] <comp:bounded-lower>

#proof[
  Write $A = inf_(r gt.eq 0) Phi_r$, which is finite by (2.10).
    Each encoded trial value is at least $A$, so (8.1) gives, at every fixed $L$,
  $ A lt.eq underline(F) + 2 epsilon + limsup_(N arrow.r oo)
    lr(|Delta_N^(L \, upright(bold(u))_(L \, N)) - cal(B)_(L - 1) \( zeta_(L \, N) \, upright(bold(m))^(\(
    L \)) \)|) . $
  The inner limit uses that depth’s selected sequence. Letting $L arrow.r oo$ in 24 gives $A lt.eq underline(F) +
    2 epsilon$, and then $epsilon arrow.b 0$ proves the result. ◻
]

== 9 Normalization, truncation, and completion of the proof <reduction:section>

The lower bound proved in 25 requires bounded permutation-invariant interactions,
  whereas the upper bound uses the factorization and positivity hypotheses.
  An integrable constant shift and uniform approximation connect the two statements.

#thm([Lemma 9.1.])[
  (Stability).  #emph[Couple two interaction laws $theta \, theta'$ and two field laws $h \, h'$,
    each satisfying (2.1) for the fixed $p$ and $alpha$, and put $D = bb(E) max_s \| theta \( s \) -
    theta' \( s \) \|$ and $d = bb(E) \| h - h' \|$. Then
#[#set math.equation(numbering: n => "(9.1)")
 $ \| F_N - F'_N \| & lt.eq alpha D + d \,\
\| cal(B)_r \( zeta \, upright(bold(m)) \) - cal(B)'_r \( zeta \, upright(bold(m)) \) \| & lt.eq
  alpha \( 2 p - 1 \) D + d $ <reduction:free-stability>]

 uniformly in $N \, r$ and all trial laws, including $r = 0$.
   If $c$ is an integrable random constant associated with an interaction and $hat(theta) = theta - c$, then
#[#set math.equation(numbering: n => "(9.2)")
 $ hat(F)_N = F_N - alpha bb(E) c \, wide hat(cal(B))_r = cal(B)_r - alpha bb(E) c . $ <reduction:shift>]

]
] <reduction:stability>

#proof[
  Use the same counts and indices in the two Hamiltonians. Their pointwise log-weight difference is bounded by the
    sum of the interaction sup-norm differences and field differences.
    The logarithm of the partition function preserves this bound, which gives (9.1).
    Each cavity interaction changes by at most the corresponding sup-norm interaction difference,
    and so does each edge logarithm. The power means preserve these root-measurable bounds.
    The site term has mean $alpha p$ interactions and the edge term has coefficient $alpha \( p - 1 \)$, giving (9.1).
  For (9.2), the physical constants factor out of the spin partition function and of every power mean.
    In the functional, the site term shifts by $- alpha p bb(E) c$ and the edge term contributes $+
    alpha \( p - 1 \) bb(E) c$, for a net shift $- alpha bb(E) c$. ◻
]

#proof[
  The multiplier $a$ may depend asymmetrically on the labeled input functions,
    so the original interaction law need not be permutation invariant.
    We first remove this multiplier by an integrable scalar shift.
    Set $c = theta \( 1 \, dots.h \, 1 \)$ and $hat(theta) = theta - c$.
    The constant is integrable, since $\| c \| lt.eq B \( theta \)$. The factorization gives
  $ hat(theta) \( s \) =
    log frac(1 + b product_(ell = 1)^p f_ell \( s_ell \), 1 + b product_(ell = 1)^p f_ell \( 1 \)) . $
  The multiplier $a$ has disappeared. Independence and identical distribution of the $f_ell$,
    and their independence of $b$, show that the law of $hat(theta)$ is invariant under permutations of its
    inputs. Moreover $bb(E) B \( hat(theta) \) lt.eq 2 bb(E) B \( theta \) < oo$.
  For $K > 0$, truncate each entry of $hat(theta)$ to $\[ - K \, K \]$ and truncate $h$ to $\[ - K \, K \]$,
    obtaining $hat(theta)^(\( K \)) \, h^(\( K \))$. Permutation invariance is preserved.
    The bounded-law lower bound 25 applies whether or not truncation preserves the factorization.
    By dominated convergence,
  $ D_K = bb(E) max_s \| hat(theta) \( s \) - hat(theta)^(\( K \)) \( s \) \| arrow.r 0 \, wide d_K = bb(E) \| h -
    h^(\( K \)) \| arrow.r 0 . $
  Write $hat(I)$ for the infimum of the normalized trial functional over all depths and trial laws,
    and $I_K$ for the same infimum with the truncated physical laws. The uniform trial estimate gives
  $ \| hat(I) - I_K \| lt.eq alpha \( 2 p - 1 \) D_K + d_K . $
  The pressure estimate and 25 now imply
  $ liminf_N hat(F)_N gt.eq I_K - alpha D_K - d_K gt.eq hat(I) - 2 alpha p D_K - 2 d_K . $
  Letting $K arrow.r oo$ proves $liminf_N hat(F)_N gt.eq hat(I) = inf_r hat(Phi)_r$.
    Undoing the constant shift gives $liminf_N F_N gt.eq inf_r Phi_r$.
    Finally 9 gives $limsup_N F_N lt.eq inf_r Phi_r$. Both limits agree, proving existence and (2.11). ◻
]

== 10 Named models and the zero-temperature limit <models:section>

The standard examples of the factorization are the diluted spin models and random satisfiability models of
  Franz–Leone and Panchenko–Talagrand #cite(label("FL03")) #cite(label("PT04")).
  We retain the Poisson counts and sampling with replacement specified in (2.2).

#thm([Corollary 10.1.])[
  (Viana–Bray and diluted even-spin models).  #emph[Fix an even integer $p gt.eq 2$, $alpha > 0$,
    and independent real random variables $J \, H$ such that $J$ has a symmetric distribution and $bb(E) \| J \| +
    bb(E) \| H \| < oo$. For every $beta > 0$, the model with
$ theta_beta \( s_1 \, dots.h \, s_p \) = beta J product_(ell = 1)^p s_ell \, wide h_beta = beta H $

 satisfies the variational formula (2.11), with the trial functional evaluated at these interaction and field
   laws. In particular, this holds for the Viana–Bray model #cite(label("VB85")), which is the case $p = 2$.]
] <models:spin>

#proof[
  Use
  $ a = cosh \( beta J \) \, wide b = tanh \( beta J \) \, wide f_ell \( s \) = s . $
  The functions $f_ell$ are deterministic independent copies, and $\| b \| < 1$ almost surely.
    Symmetry makes every odd moment of $b$ zero; the even moments are nonnegative.
    Finally, $B \( theta_beta \) = beta \| J \|$ and $\| h_beta \| = beta \| H \|$. Thus all hypotheses of 1 hold. ◻
]

#thm([Corollary 10.2.])[
  (Soft random even-$K$ SAT).  #emph[Fix an even integer $K gt.eq 2$ and $alpha > 0$.
    Let $epsilon_1 \, dots.h \, epsilon_K$ be independent fair signs and let $W gt.eq
    0$ be independent of the signs, with $bb(E) W < oo$. For every $beta > 0$, the interaction
$ theta_beta \( s_1 \, dots.h \, s_K \) = - beta W product_(ell = 1)^K frac(1 + epsilon_ell s_ell, 2) \, wide h = 0 \, $

 satisfies (2.11). The choice $W = 1$ is the soft random even-$K$ SAT model;
   $W$ gives an independent nonnegative clause weight.]
] <models:sat>

#proof[
  The product $I_epsilon \( s \) = product_ell \( 1 + epsilon_ell s_ell \) \/ 2$ takes values in ${ 0 \,
    1 }$ and indicates a violated clause. Therefore
  $ e^(theta_beta \( s \)) = 1 + \( e^(- beta W) - 1 \) I_epsilon \( s \) . $
  Take $a = 1$, $b = e^(- beta W) - 1$, and $f_ell \( s \) = \( 1 + epsilon_ell s \) \/ 2$.
    The functions are independent copies and independent of $b$.
    Since $0 lt.eq - b < 1$, the strict product condition and every positivity inequality hold.
    Moreover, $B \( theta_beta \) = beta W$, so 1 applies. ◻
]

For the spin model, define the unscaled energy score by

$ cal(E)_N \( sigma \) = sum_(k = 1)^(M_N) J_k product_(ell = 1)^p sigma_(i_(ell \, k)) + sum_(i = 1)^N H_i sigma_i . $

For the satisfiability model, put

$ cal(E)_N \( sigma \) = - sum_(k = 1)^(M_N) W_k product_(ell = 1)^K
  frac(1 + epsilon_(ell \, k) sigma_(i_(ell \, k)), 2) . $

These scores and their disorder laws do not depend on $beta$;
  in both cases the partition function is $Z_N \( beta \) = sum_sigma e^(beta cal(E)_N \( sigma \))$.
  Let $cal(B)_(r \, beta)$ denote the functional (2.9) for the corresponding laws at inverse temperature $beta$.

#thm([Corollary 10.3.])[
  (Zero-temperature variational limit).  #emph[For each model in Corollary 10.1, Corollary 10.2, the limit
$ g = lim_(N arrow.r oo) 1 / N bb(E) max_sigma cal(E)_N \( sigma \) $

 exists and satisfies
#[#set math.equation(numbering: n => "(10.1)")
 $ g = lim_(beta arrow.r oo) 1 / beta inf_(r gt.eq 0) inf_(zeta \, upright(bold(m)))
   cal(B)_(r \, beta) \( zeta \, upright(bold(m)) \) . $ <models:ground-formula>]

 More precisely, the expression inside the temperature limit lies in $\[ g \, g + log \( 2 \) \/ beta \]$.
   For unit-weight SAT, the limiting expected minimum number of violated clauses per variable is $- g$.]
] <models:ground>

#proof[
  Write $g_N = N^(- 1) bb(E) max_sigma cal(E)_N \( sigma \)$ and $P_N \( beta \) =
    N^(- 1) bb(E) log Z_N \( beta \)$. The first-moment assumptions make $g_N$ finite and uniformly bounded.
    Since there are $2^N$ spin configurations,
  $ g_N lt.eq frac(P_N \( beta \), beta) lt.eq g_N + frac(log 2, beta) . $
  For each fixed $beta > 0$, 1 gives $P_N \( beta \) arrow.r I \( beta \)$, where $I \( beta \) =
    inf_(r \, zeta \, upright(bold(m))) cal(B)_(r \, beta) \( zeta \, upright(bold(m)) \)$. Hence
  $ limsup_N g_N lt.eq frac(I \( beta \), beta) lt.eq liminf_N g_N + frac(log 2, beta) . $
  Letting $beta arrow.r oo$ proves that $g_N$ converges to a limit $g$.
    Taking $N arrow.r oo$ in the finite-volume bounds now gives $g lt.eq I \( beta \) \/ beta lt.eq g +
    log \( 2 \) \/ beta$, proving (10.1). In the satisfiability model,
    maximizing the negative violation count is the same as minimizing that count. ◻
]

The infimum in (10.1) is taken over all finite hierarchies separately at each positive temperature.
  The formula does not require attainment or a limiting hierarchy.

#prodef([Remark 10.4.])[
  The even-arity hypothesis in 28 excludes random 3-SAT. For that model,
    the companion #cite(label("OpenAIThreeSAT2026")) Theorem 8.4 gives an exact soft-pressure formula over finite
    rational trials for a Poisson number of clauses whose variable positions are sampled independently with
    replacement. Its sign-indexed message pairs need not form a probability distribution,
    and its trial functional differs from (2.9).
]

#bibliography("refs.bib", style: "ieee", title: [References])
