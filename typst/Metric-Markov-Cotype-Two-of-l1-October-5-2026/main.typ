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

#align(center)[#text(size: 16pt, weight: "bold")[Metric Markov Cotype Two of $ell_1$]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

Metric Markov cotype asks whether the values of a map on a finite reversible Markov chain can be modified so that
  their one-step variation becomes small, while the cost of the modification is controlled by the original
  variation over a longer time interval. The modified values are not prescribed linear averages.
  This freedom is essential for the result proved here.

We work first with the real Banach space

$ ell_1 = {x = \( x \( k \) \)_(k gt.eq 1) : sum_(k gt.eq 1) \| x \( k \) \| < oo} \, wide parallel x parallel_1 =
  sum_(k gt.eq 1) \| x \( k \) \| . $

Write $bb(N) = { 1 \, 2 \, dots.h }$ and $\[ n \] = { 1 \, dots.h \, n }$.
  A stochastic matrix $A = \( a_(i j) \)_(i \, j in \[ n \])$ has nonnegative entries and each row sum equal to
  one. It is reversible with respect to a probability vector $pi = \( pi_i \)_(i in \[ n \])$ if $pi_i a_(i j) =
  pi_j a_(j i)$ for all $i \, j$. Reversibility implies stationarity, $pi A = pi$. Zero coordinates of $pi$ are allowed.

#prodef([Definition 1.1.])[
  (Mendel–Naor).  A metric space $\( X \, d \)$ has metric Markov cotype two with constant $C > 0$ if,
    for every $n \, t in bb(N)$, every probability vector $pi$,
    every stochastic matrix $A$ reversible with respect to $pi$, and every $x_1 \, dots.h \, x_n in X$,
    there exist $y_1 \, dots.h \, y_n in X$ such that
  #[#set math.equation(numbering: n => "(1.1)")
   $ sum_i pi_i d \( x_i \, y_i \)^2 + t sum_(i \, j) pi_i a_(i j) d \( y_i \, y_j \)^2 lt.eq
     C^2 sum_(i \, j) pi_i (1 / t sum_(s = 1)^t A^s)_(i j) d \( x_i \, x_j \)^2 . $ <eq:cotype>]
  The infimum of all such constants is denoted $N_2 \( X \)$.
] <def:cotype>

This is #cite(label("MendelNaor13")) Definition 1.2. Our main result is the following.

#thm([Theorem 1.2.])[
  #emph[The real space $ell_1$ satisfies
$ N_2 \( ell_1 \) lt.eq 12 sqrt(21) . $

]
] <thm:main>

Thus the square of the constant in (1.1) may be taken to be $3024$, independently of the number of points,
  the number of coordinates, and the time parameter. No optimization of this numerical constant is intended.

=== History and significance <history-and-significance>

Ball introduced Markov type and cotype in his study of Lipschitz extension #cite(label("Ball92")).
  His Markov cotype condition for Banach spaces uses specified linear averages,
  and $ell_1$ fails that stronger condition. Ball also proposed a metric definition.
  Mendel and Naor developed the Cesàro formulation above, proved its equivalence to Ball’s metric definition,
  and asked explicitly whether $N_2 \( ell_1 \)$ is finite #cite(label("MendelNaor13")) Question 1.15 and
  Section 7. Theorem 2 answers that question affirmatively.

For $1 < p lt.eq 2$, the uniformly convex theory gives $N_2 \( ell_p \) lt.eq
  C \/ sqrt(p - 1)$ with a universal constant $C$ #cite(label("Ball92"));
  see also #cite(label("MendelNaor13")) Section 1.1. These bounds deteriorate as $p$ decreases to one and do not
  settle the endpoint treated here.

There is a second distinction worth making. Using a construction of Kalton,
  Mendel and Naor found a closed linear subspace of $ell_1$ that fails metric Markov cotype at every finite
  exponent #cite(label("MendelNaor13")) Theorem 1.14. This does not rule out Theorem 2,
  because the points $y_i$ in Definition 1 need not belong to a given subspace containing the original data.
  Our construction uses this freedom.

One important consequence concerns extension of Lipschitz maps.
  For a map $f$ between metric spaces, $"Lip" \( f \)$ denotes the least $L gt.eq
  0$ such that $d \( f \( x \) \, f \( y \) \) lt.eq L d \( x \, y \)$ for all $x \, y$ in its domain.
  Ball’s extension problem asks whether a Lipschitz map from an arbitrary subset of Hilbert space into $ell_1$
  admits an extension with a universal multiplicative loss in its Lipschitz constant.
  Mendel and Naor explain that an affirmative answer to their metric Markov cotype question gives such an
  extension #cite(label("MendelNaor13")) Corollary 1.13 and the discussion after Question 1.15.
  The extension problem is also discussed in #cite(label("NaorYoung22")) Section 1.
  We record the consequence precisely in Section 6; the proof of Theorem 2 itself is elementary and independent of
  extension theorems.

=== The nonlinear construction <the-nonlinear-construction>

Finite subsets of $ell_1$ admit exact representations by weighted cuts; see #cite(label("DezaLaurent97")).
  We retain not only their distances but also a contractive map back to the given ambient $ell_1$.
  Nonlinear cut smoothing with the cubic $phi.alt \( r \) = 3 r^2 - 2 r^3$ also appears in the work of Cheng,
  Wang, and Xiang on sharp metric cotype #cite(label("ChengWangXiang26"));
  metric cotype and metric Markov cotype are different invariants.

The additional ingredient here is a martingale estimate for the cubic.
  For a finite family $cal(B)$ of cuts, the representation gives binary vectors $z_i in { 0 \,
  1 }^(cal(B))$ in a weighted Hilbert space $H$, with

$ parallel z_i - z_j parallel_H^2 = parallel x_i - x_j parallel_1 . $

It also gives a map $T$ with $T \( z_i \) = x_i$ that is contractive for the weighted $ell_1$ norm on the cut
  coordinates. Let $Q = \[ 0 \, 1 \]^(cal(B))$, and let $Phi : Q arrow.r Q$ apply $phi.alt$ coordinatewise.
  Stop an $A$-walk $\( X_s \)$ after an independent nonnegative geometric number $S$ of steps with mean $t$.
  Writing $bb(E)_i$ for expectation when the walk starts at $i$, we choose

$ h_i = bb(E)_i z_(X_S) \, wide y_i = T \( Phi \( h_i \) \) . $

For the estimate, start the walk from its stationary law $pi$ and record stopping as a separate transition after
  the $S$ walk steps. Attach $h_j$ to the current index $j$ while alive and $z_j$ when the walk stops at $j$,
  keeping that value thereafter. These values form a martingale.
  Because $phi.alt'$ vanishes at the binary values, a fourth-power Hilbert potential controls the total squared
  weighted-$ell_1$ variation after applying $Phi$. Centering at $z_(X_0)$ makes the terminal potential equal to
  $parallel x_(X_S) - x_(X_0) parallel_1^2$. The stopping jump accounts for the approximation cost,
  and the expected $t$ preceding jumps account for the one-step variation.
  Contractivity of $T$ transfers these bounds to $ell_1$.

We prove the cut representation in Section 2 and the martingale estimate in Section 3.
  The comparison in Section 4, valid in any metric space, converts the terminal geometric endpoint cost to the
  Cesàro average in (1.1). These ingredients are assembled in Section 5.
  The resulting points have a simple interpretation: each $y_i$ is the expected coordinatewise median of three
  independent geometric-walk endpoints started at $i$. This interpretation is established after the main proof.

== 2 Finite cuts and reconstruction <sec:cuts>

We first replace finitely many vectors in $ell_1$ by finitely many binary coordinates.
  The reconstruction map will allow us to choose new points in the full ambient space,
  rather than in the span of the data. This is the cut representation #cite(label("DezaLaurent97")) Chapter 4,
  together with the ambient reconstruction given below.

#thm([Lemma 2.1.])[
  #emph[Given $x_1 \, dots.h \, x_n in ell_1$, either all the points coincide,
    or there exist a finite set $cal(B)$, positive weights $\( w_B \)_(B in cal(B))$,
    binary vectors $z_i in { 0 \, 1 }^(cal(B))$, and an affine map $T : bb(R)^(cal(B)) arrow.r
    ell_1$ with the following properties. For
$ parallel u parallel_(1 \, w) = sum_(B in cal(B)) w_B \| u_B \| \, wide parallel u parallel_H^2 =
  sum_(B in cal(B)) w_B u_B^2 \, $

 one has
#[#set math.equation(numbering: n => "(2.1)")
 $ T \( z_i \) & = x_i \,\
parallel x_i - x_j parallel_1 & = parallel z_i - z_j parallel_(1 \, w) = parallel z_i - z_j parallel_H^2 \,\
parallel T \( u \) - T \( u' \) parallel_1 & lt.eq parallel u -
  u' parallel_(1 \, w) wide \( u \, u' in bb(R)^(cal(B)) \) . $ <eq:reconstruct>]

 The space $H$ is $bb(R)^(cal(B))$ with the indicated Hilbert norm.]
] <lem:cuts>

#proof[
  For each original coordinate $k$, put $v \( k \) = min_i x_i \( k \)$.
    For every nonempty proper subset $B subset \[ n \]$, define the nonnegative vector
  #[#set math.equation(numbering: n => "(2.2)")
   $ b_B \( k \) = (min_(i in B) x_i \( k \) - max_(i in.not B) x_i \( k \))_(+) . $ <eq:cut-vector>]
  Here $r_(+) = max { r \, 0 }$. The estimates
  $ \| v \( k \) \| lt.eq sum_i \| x_i \( k \) \| \, wide b_B \( k \) lt.eq 2 sum_i \| x_i \( k \) \| $
  show that $v \, b_B in ell_1$. Set $w_B = parallel b_B parallel_1$ and retain only subsets with $w_B > 0$;
    these form $cal(B)$. There are at most $2^n - 2$ of them. Define
  #[#set math.equation(numbering: n => "(2.3)")
   $ z_i \( B \) = upright(bold(1))_({ i in B }) \, wide T \( u \) = v + sum_(B in cal(B)) u_B b_B . $ <eq:affine-map>]
  The sum is finite, so $T$ takes values in $ell_1$.
  To verify the identities, fix $k$ and list the distinct values among $x_1 \( k \) \, dots.h \,
    x_n \( k \)$ as $alpha_1 < dots.h.c < alpha_m$. For $1 lt.eq r < m$, the upper cut
  $ B_r = { i : x_i \( k \) gt.eq alpha_(r + 1) } $
  has $b_(B_r) \( k \) = alpha_(r + 1) - alpha_r$; all other cuts have $b_B \( k \) = 0$.
    Thus $T \( z_i \) \( k \)$ is $alpha_1$ plus exactly the successive gaps below $x_i \( k \)$, proving (2.1).
    Moreover, the cuts with positive $b_B \( k \)$ are nested.
    If $x_i \( k \) gt.eq x_j \( k \)$, every nonzero term in $sum_B \( z_i \( B \) - z_j \( B \) \)
    b_B \( k \)$ is nonnegative; the reverse inequality gives the reverse sign. Hence
  $ \| x_i \( k \) - x_j \( k \) \| = sum_B \| z_i \( B \) - z_j \( B \) \| b_B \( k \) . $
  Sum over $k$. Since binary differences have equal absolute value and square, this gives (2.1).
    The triangle inequality applied to (2.3) gives (2.1). If $cal(B)$ is empty,
    the same coordinate description shows that all the data coincide. ◻
]

== 3 A flat map and a quartic potential <sec:flat>

By (2.1), squared $ell_1$ distances between the original data are fourth powers of Hilbert distances between their
  binary encodings. We therefore seek a fourth-power potential that controls squared increments after the cubic map.

Fix a finite nonempty set $cal(B)$ and positive weights $w_B$, and use the two norms from Lemma 3.
  Write $Q = \[ 0 \, 1 \]^(cal(B))$ and let $chevron.l dot.op \,
  dot.op chevron.r_H$ be the weighted Hilbert inner product. Define

$ phi.alt \( r \) = 3 r^2 - 2 r^3 quad \( 0 lt.eq r lt.eq 1 \) \, wide Phi \( u \)_B =
  phi.alt \( u_B \) quad \( u in Q \) . $

The map $Phi$ takes $Q$ to itself and fixes its binary vertices.
  The key estimate controls its squared weighted-$ell_1$ increment by a convexity remainder in $H$.

#thm([Lemma 3.1.])[
  #emph[For $u \, u' in Q$ and $e in { 0 \, 1 }^(cal(B))$, put $a = u - e$, $delta = u' - u$, and $F_e \( u \) =
    parallel u - e parallel_H^4$. Then
#[#set math.equation(numbering: n => "(3.1)")
 $ parallel Phi \( u' \) - Phi \( u \) parallel_(1 \, w)^2 lt.eq 108 #scale(x: 120%, y: 120%)[\(] F_e \( u' \) -
   F_e \( u \) - 4 parallel a parallel_H^2 chevron.l a \, delta chevron.r_H #scale(x: 120%, y: 120%)[\)] . $ <eq:flat>]

]
] <lem:flat>

#proof[
  For either bit $d in { 0 \, 1 }$ and $r in \[ 0 \, 1 \]$,
  $ \| phi.alt' \( r \) \| = 6 r \( 1 - r \) lt.eq 6 \| r - d \| . $
  Integrating on the segment from $u_B$ to $u'_B$ gives
  $ \| phi.alt \( u'_B \) - phi.alt \( u_B \) \| & lt.eq 6 \| delta_B \| integral_0^1 \| a_B + s delta_B \| thin d s\
 & lt.eq 6 \| a_B \| \| delta_B \| + 3 \| delta_B \|^2 . $
  Summing with weights and applying Cauchy–Schwarz yields
  #[#set math.equation(numbering: n => "(3.2)")
   $ parallel Phi \( u' \) - Phi \( u \) parallel_(1 \, w) lt.eq
     6 parallel a parallel_H parallel delta parallel_H + 3 parallel delta parallel_H^2 . $ <eq:increment>]
  Let $R$ denote the expression in parentheses in (3.1). Expanding the fourth power gives the exact identity
  #[#set math.equation(numbering: n => "(3.3)")
   $ R = 2 parallel a parallel_H^2 parallel delta parallel_H^2 + #scale(x: 120%, y: 120%)[\(] 2 chevron.l a \,
     delta chevron.r_H + parallel delta parallel_H^2 #scale(x: 120%, y: 120%)[\)]^2 . $ <eq:remainder>]
  In particular, $parallel a parallel_H^2 parallel delta parallel_H^2 lt.eq R \/ 2$. Also
  $ parallel delta parallel_H^4 & lt.eq 2 #scale(x: 120%, y: 120%)[\(] 2 chevron.l a \, delta chevron.r_H +
    parallel delta parallel_H^2 #scale(x: 120%, y: 120%)[\)]^2 + 8 chevron.l a \, delta chevron.r_H^2\
 & lt.eq 2 #scale(x: 120%, y: 120%)[\(] 2 chevron.l a \, delta chevron.r_H +
   parallel delta parallel_H^2 #scale(x: 120%, y: 120%)[\)]^2 +
   8 parallel a parallel_H^2 parallel delta parallel_H^2 lt.eq 4 R . $
  Squaring (3.2) and using $\( r + s \)^2 lt.eq 2 r^2 + 2 s^2$ therefore gives
  $ parallel Phi \( u' \) - Phi \( u \) parallel_(1 \, w)^2 lt.eq
    72 parallel a parallel_H^2 parallel delta parallel_H^2 + 18 parallel delta parallel_H^4 lt.eq 36 R + 72 R =
    108 R . $
  ◻
]

The linear term in (3.1) disappears on taking a conditional expectation along a Hilbert-valued martingale.
  It is important that the center may depend on the initial state.

#thm([Corollary 3.2.])[
  #emph[Let $\( M_m \)_(m gt.eq 0)$ be an $H$-valued martingale with respect to a filtration $\( cal(F)_m \)$,
    taking values in $Q$ and converging almost surely to $M_oo$. If $e$ is an $cal(F)_0$-measurable binary vector, then
#[#set math.equation(numbering: n => "(3.4)")
 $ bb(E) sum_(m = 0)^oo parallel Phi \( M_(m + 1) \) - Phi \( M_m \) parallel_(1 \, w)^2 & lt.eq
   108 #scale(x: 120%, y: 120%)[\(] bb(E) parallel M_oo - e parallel_H^4 - bb(E) parallel M_0 -
   e parallel_H^4 #scale(x: 120%, y: 120%)[\)]\
 & lt.eq 108 bb(E) parallel M_oo - e parallel_H^4 . $ <eq:martingale-energy>]

]
] <cor:martingale>

#proof[
  Apply Lemma 4 to each pair $M_m \, M_(m + 1)$. The vector $4 parallel M_m -
    e parallel_H^2 \( M_m - e \)$ is $cal(F)_m$-measurable and bounded. Therefore
  $ bb(E) #scale(x: 120%, y: 120%)[\[] parallel M_m - e parallel_H^2 chevron.l M_m - e \, M_(m + 1) -
    M_m chevron.r_H divides cal(F)_m #scale(x: 120%, y: 120%)[\]] = 0 . $
  Taking expectations and summing over $0 lt.eq m < L$ telescopes the potentials.
    All potentials are bounded by $\( sum_B w_B \)^2$, so bounded convergence applies to the terminal potential as
    $L arrow.r oo$. Monotone convergence applies to the nonnegative jump sum.
    This proves the first inequality; the second follows by discarding the initial nonnegative potential. ◻
]

== 4 Geometric and Cesàro endpoint costs <sec:comparison>

The stopped martingale will produce a geometric average of endpoint distances.
  The next estimate converts it to the finite average in Definition 1.
  This comparison is part of the resolvent approach in #cite(label("MendelNaor13")) Section 7,
  especially Lemma 7.1. We give an elementary version with an explicit constant; only stationarity,
  not reversibility, is needed.

#thm([Lemma 4.1.])[
  #emph[Let $\( X_s \)_(s gt.eq 0)$ be a stationary Markov chain on $\[ n \]$, and let $x_1 \, dots.h \,
    x_n$ lie in a metric space $\( X \, d \)$. For $t in bb(N)$, set $p = 1 \/ \( t + 1 \)$ and $q = 1 - p$.
    If $S$ is independent of the walk and $bb(P) \( S = s \) = p q^s$ for $s gt.eq 0$, then
#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E) d \( x_(X_S) \, x_(X_0) \)^2 lt.eq 28 / t sum_(s = 1)^t bb(E) d \( x_(X_s) \, x_(X_0) \)^2 . $ <eq:comparison>]

]
] <lem:comparison>

#proof[
  Write
  $ D \( s \) = bb(E) d \( x_(X_s) \, x_(X_0) \)^2 \, wide W = 1 / t sum_(s = 1)^t D \( s \) . $
  The triangle inequality, Minkowski’s inequality in $L_2$, and stationarity imply
  #[#set math.equation(numbering: n => "(4.2)")
   $ sqrt(D \( r + s \)) lt.eq sqrt(D \( r \)) + sqrt(D \( s \)) wide \( r \, s gt.eq 0 \) . $ <eq:subadditivity>]
  Consequently $D \( t \) lt.eq 2 D \( r \) + 2 D \( t - r \)$ for $1 lt.eq r lt.eq t$.
    Since $D \( 0 \) = 0$, averaging gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ D \( t \) lt.eq 2 / t sum_(r = 1)^t D \( r \) + 2 / t sum_(r = 0)^(t - 1) D \( r \) lt.eq 4 W . $ <eq:Dt>]
  If $s = j t + r$ with $j gt.eq 0$ and $0 lt.eq r < t$, repeated use of (4.2) gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ D \( s \) lt.eq #scale(x: 120%, y: 120%)[\(] j sqrt(D \( t \)) +
     sqrt(D \( r \)) #scale(x: 120%, y: 120%)[\)]^2 lt.eq 2 j^2 D \( t \) + 2 D \( r \) . $ <eq:blocks>]
  For $J = floor.l S \/ t floor.r$ and $R = S - t J$, the geometric second moment yields
  $ bb(E) J^2 lt.eq frac(bb(E) S^2, t^2) = frac(2 t^2 + t, t^2) lt.eq 3 . $
  For each $0 lt.eq r < t$,
  $ bb(P) \( R = r \) = frac(p q^r, 1 - q^t) lt.eq 2 / t . $
  Indeed $\( 1 + 1 \/ t \)^t gt.eq 2$ implies $q^t lt.eq 1 \/ 2$, so the left side is at most $2 p =
    2 \/ \( t + 1 \) lt.eq 2 \/ t$. Thus
  $ bb(E) D \( R \) lt.eq 2 / t sum_(r = 0)^(t - 1) D \( r \) lt.eq 2 W . $
  Take expectations in (4.4) and use independence of $S$ and the walk to conclude
  $ bb(E) d \( x_(X_S) \, x_(X_0) \)^2 = bb(E) D \( S \) lt.eq 2 dot.op 3 dot.op 4 W + 2 dot.op 2 W = 28 W . $
  Every step remains valid when $t = 1$; then $R = 0$. ◻
]

== 5 The stopped walk and the main theorem <sec:proof>

We now construct the required points. Fix the data in Definition 1 with $X = ell_1$.
  If all $x_i$ coincide, choose $y_i = x_i$. Otherwise use Lemma 3 to obtain $z_i \, H \, T$,
  and use the map $Phi$ of Section 3.

Put $p = 1 \/ \( t + 1 \)$, $q = 1 - p$, and define

#[#set math.equation(numbering: n => "(5.1)")
 $ h_i = p sum_(s = 0)^oo q^s \( A^s z \)_i \, wide \( A^s z \)_i = sum_j \( A^s \)_(i j) z_j . $ <eq:resolvent>]

This convex combination converges in the finite-dimensional space $H$ and belongs to $Q$.
  Equivalently, $h_i = bb(E)_i z_(X_S)$, where $bb(E)_i$ refers to an $A$-walk started at $i$ and $S$ is
  independent with $bb(P) \( S = s \) = p q^s$. The first-step identity is

#[#set math.equation(numbering: n => "(5.2)")
 $ h_i = p z_i + q sum_j a_(i j) h_j . $ <eq:harmonic>]

We take

#[#set math.equation(numbering: n => "(5.3)")
 $ y_i = T \( Phi \( h_i \) \) . $ <eq:y>]

In particular, each $y_i$ belongs to $ell_1$.

=== 5.1 A martingale that realizes the two costs <a-martingale-that-realizes-the-two-costs>

Start a chain in an alive state with index distributed according to $pi$.
  From an alive state of index $i$, it moves to the dead state of index $i$ with probability $p$,
  and to the alive state of index $j$ with probability $q a_(i j)$. Dead states are absorbing.
  Its filtration $cal(F)_m$ records the initial state and the first $m$ transitions only.

One realization uses an independent stationary $A$-walk $\( X_s \)_(s gt.eq 0)$ and successive independent
  survival trials, each successful with probability $q$. Let $S$ be the number of successful trials before the
  first failure. Then $bb(P) \( S = s \) = p q^s$ and $S$ is independent of the walk.
  There are $S$ live index transitions followed by one death transition; the index at death is $X_S$.

Attach the value $h_i$ to the alive state of index $i$ and the value $z_i$ to its dead state,
  and let $M_m$ be the attached value at chain time $m$. Equation (5.2) shows that $\( M_m \)$ is an $H$-valued
  martingale for the indicated filtration. It lies in $Q$ and is eventually constant almost surely, with

$ M_0 = h_(X_0) \, wide M_oo = z_(X_S) . $

The vector $e = z_(X_0)$ is $cal(F)_0$-measurable and binary. Corollary 5 and (2.1) give

#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) sum_(m = 0)^oo parallel Phi \( M_(m + 1) \) - Phi \( M_m \) parallel_(1 \, w)^2 lt.eq
   108 bb(E) parallel x_(X_S) - x_(X_0) parallel_1^2 . $ <eq:stopped-bound>]

To compute the left side exactly, set

$ B = sum_i pi_i parallel z_i - Phi \( h_i \) parallel_(1 \, w)^2 \, wide E_A =
  sum_(i \, j) pi_i a_(i j) parallel Phi \( h_i \) - Phi \( h_j \) parallel_(1 \, w)^2 . $

At time $m$, the event that the chain is alive has probability $q^m$ and is independent of $X_m$.
  Stationarity gives $bb(P) \( X_m = i \) = pi_i$ and $bb(P) \( X_m = i \, X_(m + 1) = j \) = pi_i a_(i j)$.
  Since $Phi \( z_i \) = z_i$, the expected squared jump at time $m$ is $p q^m B + q^(m + 1) E_A$. Therefore

#[#set math.equation(numbering: n => "(5.5)")
 $ bb(E) sum_(m = 0)^oo parallel Phi \( M_(m + 1) \) - Phi \( M_m \) parallel_(1 \, w)^2 = B + q / p E_A = B +
   t E_A . $ <eq:jump-identity>]

This identity explains why the killing probability was chosen to be $1 \/ \( t + 1 \)$.

=== 5.2 Completion of the proof <completion-of-the-proof>

#proof[
  Use the points (5.3). Contractivity of $T$ and the identity $T \( z_i \) = x_i$ imply
  $ & sum_i pi_i parallel x_i - y_i parallel_1^2 + t sum_(i \, j) pi_i a_(i j) parallel y_i - y_j parallel_1^2\
 & #h(25mm)  lt.eq B + t E_A lt.eq 108 bb(E) parallel x_(X_S) - x_(X_0) parallel_1^2 \, $
  where the last inequality follows from (5.4) and (5.5). Lemma 6 bounds the last expression by
  $ 108 dot.op 28 dot.op 1 / t sum_(s = 1)^t bb(E) parallel x_(X_s) - x_(X_0) parallel_1^2 . $
  The stationary walk satisfies
  $ 1 / t sum_(s = 1)^t bb(E) parallel x_(X_s) - x_(X_0) parallel_1^2 =
    sum_(i \, j) pi_i (1 / t sum_(s = 1)^t A^s)_(i j) parallel x_i - x_j parallel_1^2 . $
  This is (1.1) with $C^2 = 3024$. ◻
]

#prodef([Remark 5.1.])[
  The proof uses reversibility only through $pi A = pi$. Consequently,
    the same inequality and the same construction hold for every stationary stochastic matrix,
    without detailed balance. No positivity assumption on the individual $pi_i$ is needed in the argument.
] <rem:stationary>

=== 5.3 An expected-median interpretation <an-expected-median-interpretation>

The construction has an intrinsic description in the original coordinates. Let

$ G = p sum_(s = 0)^oo q^s A^s $

be the stochastic matrix of geometric endpoints. For fixed $i$, take independent indices $J_1 \, J_2 \,
  J_3$ with common law $bb(P) \( J_a = j \) = G_(i j)$. For three real vectors,
  write $"med" \( x \, x' \, x'' \)$ for their coordinatewise median.
  This vector belongs to $ell_1$, since its coordinatewise absolute value is at most $\| x \| + \| x' \| + \|
  x'' \|$. Then

#[#set math.equation(numbering: n => "(5.6)")
 $ y_i = bb(E) thin "med" \( x_(J_1) \, x_(J_2) \, x_(J_3) \) . $ <eq:median>]

In each original coordinate, the median is at least a given threshold exactly when at least two of the three
  values are. The threshold decomposition in the proof of Lemma 3 therefore gives the pointwise identity

$ "med" \( x_(J_1) \, x_(J_2) \, x_(J_3) \) = v + sum_(B in cal(B)) b_B
  upright(bold(1))_({ \# { a in \[ 3 \] : J_a in B } gt.eq 2 }) . $

Each indicator has expectation $3 h_i \( B \)^2 \( 1 - h_i \( B \) \) + h_i \( B \)^3 =
  phi.alt \( h_i \( B \) \)$. Taking expectations in the finite sum proves (5.6).

== 6 Complex scalars and Lipschitz extension <sec:consequences>

#thm([Corollary 6.1.])[
  #emph[For complex scalars, $N_2 \( ell_1 \( bb(C) \) \) lt.eq 12 sqrt(42)$.]
] <cor:complex>

#proof[
  The real-linear bijection
  $ J : ell_1 \( bb(C) \) arrow.r ell_1 \( bb(R) \) \, wide
    J x = \( Re x \( 1 \) \, Im x \( 1 \) \, Re x \( 2 \) \, Im x \( 2 \) \, dots.h \) $
  satisfies $parallel x parallel_1 lt.eq parallel J x parallel_1 lt.eq sqrt(2) parallel x parallel_1$.
    Apply Theorem 2 to $J x_i$ and pull the resulting points back by $J^(- 1)$.
    The left side of (1.1) can only decrease, while its right side increases by at most a factor of $2$. ◻
]

For the extension consequence, recall that a metric space $\( Z \, d_Z \)$ has #emph[Markov type two] with
  constant $M > 0$ if

$ sum_(i \, j) pi_i \( A^t \)_(i j) d_Z \( u_i \, u_j \)^2 lt.eq
  M^2 t sum_(i \, j) pi_i a_(i j) d_Z \( u_i \, u_j \)^2 $

for every $n \, t in bb(N)$, every stochastic matrix $A$ reversible with respect to a probability vector $pi$,
  and every $u_1 \, dots.h \, u_n in Z$. Hilbert spaces satisfy this inequality with $M =
  1$ #cite(label("Ball92")); see also #cite(label("MendelNaor13")) Definition 1.1 and the following discussion.

#thm([Corollary 6.2.])[
  #emph[There is a universal constant $K < oo$ such that, for every real Hilbert space $cal(H)$,
    every subset $S subset.eq cal(H)$, and every Lipschitz map $f : S arrow.r ell_1$, there is an extension $F :
    cal(H) arrow.r ell_1$ with $"Lip" \( F \) lt.eq K "Lip" \( f \)$.]
] <cor:extension>

#proof[
  We use the Lipschitz extension theorem in #cite(label("MendelNaor13")) Corollary 1.13,
    extending Ball’s theorem #cite(label("Ball92")). In its Banach-space form,
    a source with Markov type two and a dual Banach target with metric Markov cotype two admit extensions with a
    constant bounded by a universal multiple of the two corresponding constants.
    A Hilbert space has Markov type two with constant one, and $ell_1$ is the dual of $c_0$.
    Theorem 2 verifies the remaining hypothesis. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
