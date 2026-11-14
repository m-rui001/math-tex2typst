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

#align(center)[#text(size: 16pt, weight: "bold")[Expected amenable subalgebras \
preserving core commutants]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

An inclusion $N subset M$ is #emph[expected] if it admits a faithful normal conditional expectation $E_N :
  M arrow.r N$. Such an expectation makes the inclusion compatible with modular theory:
  a faithful normal state on $N$ extends through $E_N$ to a state on $M$ whose modular action preserves $N$.
  For a faithful normal state $psi$ on $M$, the continuous core is $c \( M \) = M times.r_(sigma^psi) bb(R)$,
  with its canonical copy of $M$.

We ask whether an amenable expected subalgebra of $N$ can impose exactly the same commutation constraints as $N$
  on the whole core. Equality of commutants inside $M$ alone does not answer this question:
  the core also contains the unitaries implementing the modular action.
  Our main theorem retains these additional constraints.

#thm([Theorem 1.1.])[
  #emph[Let $N subset M$ be a unital inclusion of von Neumann algebras with separable preduals,
    and suppose that there is a faithful normal conditional expectation $E_N : M arrow.r N$.
    There exist a unital amenable von Neumann subalgebra $P subset
    N$ and a faithful normal conditional expectation $F : N arrow.r P$ such that
$ P' ∩ c \( M \) = N' ∩ c \( M \) . $

 Here amenable means injective.]
] <thm:main>

The canonical core isomorphism associated with a change of faithful normal state fixes $M$,
  so the stated relative-commutant equality is independent of the state used to define the core.

===== 1.1 History and the relative conjecture. <history-and-the-relative-conjecture.>

Popa’s solution of Kadison’s problem for irreducible expected inclusions with separable preduals and type II
  bottom factor provides a model for finding amenable subalgebras that retain prescribed commutation properties
  [15]. For type III factors, modular asymptotic centralization supplies a related approach.
  The bicentralizer of a faithful normal state consists of those elements that commute asymptotically with every
  bounded sequence asymptotically centralizing the state in predual norm.
  Connes introduced the problem of its triviality in the classification of injective factors [3,4].
  Haagerup solved the amenable type $upright("III")_1$ case,
  completing the uniqueness theorem for the injective type $upright("III")_1$ factor [5].
  For type $upright("III")_1$ factors with separable predual,
  he characterized triviality by norm-density of faithful normal states whose centralizers have trivial relative
  commutant [5] Theorem 3.1. His proof uses Popa’s construction to find a maximal abelian subalgebra of such a
  centralizer that remains maximal abelian in the ambient factor;
  the expectations onto the centralizer and onto its abelian subalgebra compose [5] proof of Theorem 3.1.

Masuda introduced a relative bicentralizer in the finite-index setting [13] Definition 4.1.
  Ando, Haagerup, Houdayer, and Marrakchi constructed the canonical relative bicentralizer flow for expected
  inclusions with type $upright("III")_1$ bottom factor [2] Theorem A.
  This extends the absolute flow discovered by Haagerup and independently by Marrakchi,
  as described in that paper. The structural results of Houdayer and Isono [6] Proposition 3.4 and Theorem 3.5 and
  Marrakchi’s absolute flow-ergodicity theorem [9] Theorem D underlie the absolute reduction used here.
  Marrakchi formulated the relative bicentralizer conjecture and proved that, for separable preduals,
  it is equivalent to the conclusion of Theorem 1 [10] Conjecture C and Theorem D.
  Our theorem therefore resolves that conjecture positively, including inclusions with arbitrary centers and types.

Marrakchi’s recent Theorem B [11] gives an expected amenable subalgebra $P subset N$ preserving $N' ∩
  M$ for general expected inclusions with separable preduals.
  Theorem 1 preserves the commutant in the continuous core.
  Applying the earlier result with upper algebra $c \( M \)$ would require an expectation from $c \( M \)$ onto
  $N$, which the original inclusion does not supply. The binormal-state and zero-shift completely positive map of
  [11] Lemmas 2.1 and 2.2(1) are essential inputs to the proof below.

===== 1.2 The absolute problem and the recent announcement. <the-absolute-problem-and-the-recent-announcement.>

Houdayer and Marrakchi have announced that every type $upright("III")_1$ factor admitting a faithful normal state
  has trivial bicentralizer [7] Theorem G; their theorem statement has no separability restriction.
  Section 3 gives an alternative proof of its separable-predual instance as part of our relative argument.
  The multiplication maps and spectral resonance of [7] Section 8 are closely related to this absolute comparison.
  Their paper also develops relative bicentralizer theory for tracial group actions;
  the general expected-inclusion core-commutant conclusion of Theorem 1 is obtained here through the relative
  tensor and core argument.

The companion [14] Theorem 4.1 and Section 5.1 develops a complementary absolute argument through bounded
  recovery: for a state with scalar centralizer, a fixed multiplication defect whose modularly averaged squared
  norm has positive limsup along unit vectors with spectral supports shrinking to one point can be detected by
  uniformly bounded algebra elements. The binormal-state identity used here also admits the iteration that yields
  the relative estimate uniformly in tensor length and flow shifts.

===== 1.3 An abelian consequence. <an-abelian-consequence.>

A maximal abelian subalgebra, or MASA, $A subset N$ satisfies $A' ∩ N = A$.
  Another part of Marrakchi’s characterization gives such a subalgebra with a precise core commutant.
  For an expected $A subset N$, we view $c \( A \)$ inside $c \( N \) subset
  c \( M \)$ using the expectation onto $A$ and its composition with $E_N$.

#thm([Corollary 1.2.])[
  #emph[Under the hypotheses of Theorem 1, there is a maximal abelian subalgebra $A subset
    N$ with a faithful normal conditional expectation $F : N arrow.r A$ such that
$ A' ∩ c \( M \) = c \( A \) or #scale(x: 120%, y: 120%)[\(] N' ∩ c \( M \) #scale(x: 120%, y: 120%)[\)] . $

]
] <cor:masa>

#proof[
  Apply [10] Theorem D, (4)$arrow.r.double$(6) to Theorem 1. ◻
]

For an irreducible expected inclusion of factors, Kadison’s problem asks for a MASA in $N$ that is also maximal
  abelian in $M$. The corollary gives such a MASA with expectation under the additional core condition $N' ∩
  c \( M \) subset c \( N \)$: its commutant in $M$ then lies in $c \( N \) ∩ M = N$, and hence equals $A$.
  This is the expected formulation identified in [10] Conjecture B and the discussion after Theorem D.

===== 1.4 Proof structure. <proof-structure.>

The analytic work concerns the case where $N$ is a type $upright("III")_1$ factor.
  Choose a faithful normal state $phi$ on $N$ and extend it by $E_N$.
  The relative bicentralizer $B subset M$ consists of elements that commute asymptotically with every bounded
  sequence in $N$ asymptotically centralizing $phi$. It carries a state-preserving flow $gamma$.
  Section 2 recalls these objects and the binormal-state identity used below.
  Existing bicentralizer criteria reduce our task to showing that the extension of $gamma$ to $B
  times.r_(sigma^phi) bb(R)$ has fixed algebra $N' ∩ c \( M \)$.

The connection with multiplication is the central point. Set $H = L^2 \( N \, phi \)$, $K = L^2 \( B \, phi \)$,
  and $Omega = phi^(1 \/ 2)$. Consider maps from $H ⊗ K$ to $L^2 \( M \, phi \)$,
  initially given for $x in N$ and $a in B$ by

$ R \( x Omega ⊗ a Omega \) = x a Omega \, wide L \( x Omega ⊗ a Omega \) = a x Omega . $

We prove that these maps are isometries and that

$ R = L exp \( i X ⊗ Y \) \, $

where $X$ generates the modular action on $H$ and $Y$ generates the bicentralizer flow on $K$.
  After a change of coordinates in the core representation, $N$ acts on $H$ alone,
  whereas an element fixed by the bicentralizer flow acts independently of the $H$ coordinate.
  They therefore commute. This is the required fixed-point criterion.

The absolute theorem supplies the isometry assertion. If that theorem failed,
  the standard reduction would give a nontrivial factor equal to its own bicentralizer and with scalar modular
  fixed algebra. Its two multiplication maps become isometries after averaging the modular action.
  A binormal eigenstate identity gives their spectral comparison;
  reflection then forces a spectral lattice condition incompatible with modular ergodicity.
  Section 3 carries out this argument, and Section 4 applies the absolute theorem to obtain the unaveraged
  relative isometries.

To prove the relative comparison, Section 5 packages words of arbitrary tensor length into states on one fixed
  operator algebra. The binormal-state identity yields an estimate uniform in tensor length,
  all intervening flow parameters, and the location of the total modular energy.
  The packaging maps are completely positive but may be nonnormal;
  a spectral cutoff argument justifies the functional calculus they require.
  Section 6 removes the energy restriction by repeatedly testing a hypothetical discrepancy.
  Averaging the comparison contraction $L^(*) R$ with its proposed unitary value loses norm wherever they differ.
  Random shifts capture such a difference with probabilities whose sum diverges,
  while the same probabilities bound the propagated error. The resulting expected norm loss exceeds the available
  norm, so the comparison is exact.

Finally, Section 7 proves the core fixed-point identity and derives the weak Dixmier property:
  every weak\* closed convex hull of an $N$-unitary orbit in $c \( M \)$ meets $N' ∩ c \( M \)$.
  Marrakchi’s characterization then supplies the amenable subalgebra.
  Existing results handle the other factor types; a central decomposition and averaging over the center give the
  general inclusion.

===== 1.5 Acknowledgment of related work. <acknowledgment-of-related-work.>

Houdayer and Marrakchi credit #emph[GPT-5.6 Sol] with counterexample exploration and an initial strict-outerness
  proof, and #emph[GPT-6 Astra] with a singular tracial-state ingredient in their resonance strategy [7] p. 7.
  They report checking and rewriting those proofs and retaining responsibility for their work.

== 2 Modular notation and bicentralizer inputs <sec:background>

The absolute proof and the relative tensor estimate use states on the bounded operators of the standard Hilbert
  space whose left and right marginals are prescribed and whose modular energy is concentrated at one point.
  We first state the resulting bicentralizer identity and the completely positive maps that shift its energy parameter.

We use standard modular theory [17] and the modular-invariance criterion for state-preserving expectations [16].
  We may assume that the algebras are nonzero. Choose a faithful normal state on $N$ and extend it by $E_N$;
  denote both states by $phi$. Put

$ cal(H) = L^2 \( M \, phi \) \, wide Omega = phi^(1 \/ 2) \, wide X_M = log Delta_phi . $

Scalar products are linear in the first variable. Our predual module conventions are

$ \( x phi \) \( y \) = phi \( y x \) \, wide \( phi x \) \( y \) = phi \( x y \) . $

The left and right standard actions are denoted by $lambda$ and $rho$, with $rho \( b \) xi = xi b$;
  we usually omit $lambda$. If $A subset M$ is invariant under $sigma^phi$,
  its state-preserving expectation identifies $L^2 \( A \, phi \)$ with a subspace of $cal(H)$.
  Write $e_A$ for that projection.

Fix a free ultrafilter $omega$ on $bb(N)$; all state ultrapowers below are Ocneanu ultrapowers [1].
  For now $N$ is a type $upright("III")_1$ factor. Its relative analytic bicentralizer $B =
  upright(B) \( N subset M \, phi \)$ consists of those $a in M$ for which $\[ a \, x_n \] arrow.r
  0$ strongly whenever $\( x_n \)$ is a bounded sequence in $N$ with $parallel x_n phi -
  phi x_n parallel_(N_(*)) arrow.r 0$. Equivalently, $B$ is the part of $M$ commuting in the state ultrapower with
  the centralizer of $N^omega$. It is modularly invariant and has a $phi$-preserving faithful normal expectation $E_B$.

===== 2.1 The flow convention. <the-flow-convention.>

Write $gamma : bb(R) arrow.cw.half B$ for the bicentralizer flow in the following logarithmic convention:
  an element $v in N^omega$ of modular frequency $s$, meaning $sigma_t \( v \) = e^(i t s) v$, satisfies

#[#set math.equation(numbering: n => "(1)")
 $ v a = gamma_s \( a \) v wide \( a in B \) . $ <eq:frequency>]

With the multiplicative parameter of [2], this means $gamma_s = beta_(e^(- s))$:
  modular frequency $s$ corresponds to $v phi^omega = e^(- s) phi^omega v$.
  The flow preserves $phi \|_B$ and commutes with its modular action [2,10].

#thm([Proposition 2.1.])[
  (Binormal states and spectral shifts).  #emph[In this setting the following hold.]
  + #emph[If a state $Phi$ on $upright(bold(B)) \( cal(H) \)$ satisfies
$ Phi compose lambda = Phi compose rho = phi \, wide Phi \( e_N \) = 1 \, wide Phi \( f \( X_M \) \) =
  f \( 0 \) quad \( f in C_0 \( bb(R) \) \) \, $

 then, for $a \, b in B$,
#[#set math.equation(numbering: n => "(2)")
 $ Phi \( lambda \( a \) rho \( b \) \) = chevron.l a Omega b \, Omega chevron.r . $ <eq:binormal>]

]
  + #emph[For each $s in bb(R)$ there is a unital completely positive map $theta_s :
    upright(bold(B)) \( cal(H) \) arrow.r upright(bold(B)) \( cal(H) \)$ such that
#[#set math.equation(numbering: n => "(3)")
 $ theta_s \( e_N \) & = e_N \, & theta_s compose rho & = rho \,\
theta_s compose lambda & = lambda compose gamma_s compose E_B \, & theta_s \( f \( X_M \) \) & =
  f \( X_M - s \) quad \( f in C_0 \( bb(R) \) \) . $ <eq:shift1>]

 These maps need not be normal.]
] <prop:inputs>

Part (i) is [11] Lemma 2.1, based on the binormal-state implementation [10] Theorem 2.9.
  For part (ii), we combine the zero-shift map of [11] Lemma 2.2(1) with the eigenoperator characterization of the
  flow in [2] Theorem A(ii). The construction below determines the spectral shift in convention (1).

===== 2.2 The shift construction. <the-shift-construction.>

Let $zeta$ be the map from [11] Lemma 2.2(1), which has the properties in part (ii) for $s = 0$.
  Choose a finite row of partial isometries $v_i in N^omega$ of modular frequency $s$ with $sum_i v_i v_i^(*) =
  1$. Such rows exist by [2] Lemma 3.4 and the proof of Theorem A(ii).
  Starting with bounded representing sequences $w_(i \, n)$, take the modularly smoothed lifts

$ v_(i \, n) = integral_(bb(R)) pi^(- 1 \/ 2) e^(- u^2) e^(- i s u) sigma_u \( w_(i \, n) \) thin d u . $

Modular convolution commutes with passage to the ultrapower [1] Lemma 4.14; since $v_i$ has frequency $s$,
  these are still lifts of $v_i$. Translation of the convolution kernel shows that their modular orbits are
  uniformly norm-continuous in $n$. Define

$ theta_s \( T \) = upright("weak") #h(-0.16667em) lim_(n arrow.r omega) thin sum_i lambda \( v_(i \, n) \)
  zeta \( T \) lambda \( v_(i \, n)^(*) \) . $

The row normalization makes the limit unital. The right algebra and $e_N$ commute with all row entries,
  so they are fixed. Relation (1) gives the left restriction $gamma_s compose E_B$.

For the spectral formula, the modular action passes to the ultrapower [1] Theorem 4.1.
  Hence, for each $t$, $sum_i v_(i \, n) sigma_t \( v_(i \, n)^(*) \) arrow.r
  e^(- i t s) 1$ strongly along $omega$; the equicontinuity just obtained makes convergence uniform on compact
  $t$-intervals. Now $zeta \( f \( X_M \) \) = f \( X_M \)$ for $f in C_0 \( bb(R) \)$.
  For a function of the form $f \( x \) = integral e^(i t x) h \( t \) thin d t$, with $h in L^1 \( bb(R) \)$,
  we may therefore integrate the finite-row conjugations to obtain

$ theta_s \( f \( X_M \) \) = integral_(bb(R)) e^(- i t s) Delta^(i t) h \( t \) thin d t = f \( X_M - s \) . $

Compact-uniform convergence of the row coefficients and the $L^1$ tail bound justify passing to the limit.
  Density gives the formula for all $f in C_0 \( bb(R) \)$.
  This calculation fixes the sign and uses no normality of $zeta$ or $theta_s$.

===== 2.3 Binormal states at a nonzero frequency. <binormal-states-at-a-nonzero-frequency.>

If the last hypothesis of (i) is instead $Phi \( f \( X_M \) \) = f \( s \)$, apply (i) to $Phi compose theta_s$.
  The fixed right algebra belongs to the multiplicative domain of $theta_s$, so

#[#set math.equation(numbering: n => "(4)")
 $ Phi #scale(x: 120%, y: 120%)[\(] lambda \( gamma_s \( a \) \) rho \( b \) #scale(x: 120%, y: 120%)[\)] =
   chevron.l a Omega b \, Omega chevron.r wide \( a \, b in B \) . $ <eq:binormal-s>]

The two marginals remain $phi$ because $gamma_s$ and $E_B$ preserve it.

== 3 The absolute bicentralizer <sec:absolute>

We first use the binormal identity to settle the absolute problem.
  This will make the ordinary multiplication maps for a relative bicentralizer isometric in Section 4.
  In the absolute argument itself, averaging the modular action provides the two isometries to be compared.

#thm([Theorem 3.1.])[
  #emph[For every type $upright("III")_1$ factor $N$ with separable predual and every faithful normal state $phi$
    on $N$, one has $upright(B) \( N \, phi \) = bb(C) 1$.]
] <thm:absolute>

Two established facts reduce the proof to a spectral contradiction.
  If the absolute conjecture fails, the self-bicentralizing reduction of [6] Proposition 3.4 and Theorem 3.5,
  recalled in [2], gives a nontrivial type $upright("III")_1$ factor with separable predual and a faithful normal
  state satisfying

#[#set math.equation(numbering: n => "(5)")
 $ M = upright(B) \( M \, phi \) \, wide M_phi = bb(C) 1 . $ <eq:self>]

The absolute bicentralizer flow is ergodic [9] Theorem D. Neither fact assumes fullness.

The averaged products, reflection, and spectral resonance below follow the architecture of [7]
  Propositions 8.8–8.10. Here the averaging uses the modular action,
  and the binormal identity supplies the comparison between the products.

#proof[
  Suppose that the theorem fails, and choose $\( M \, phi \)$ as in (5).
    Put $H = L^2 \( M \, phi \)$ and $X = log Delta_phi$. Let $e^(i s Y)$ implement $gamma_s$ on $H$,
    so that $e^(i s Y) \( a Omega \) = gamma_s \( a \) Omega$.
    Since the flow preserves the state and commutes with its modular action, $X$ and $Y$ strongly commute.
  ===== 3.1 Two products after averaging. <two-products-after-averaging.>
  The scalar fixed algebra $M_phi$ implies that the weak\* averages of $sigma_t \( x \)$ over $\[ - T \, T \]$
    converge to $phi \( x \) 1$. Indeed, any cluster point is modularly invariant and has state value
    $phi \( x \)$. We use this factorization to turn the two orders of multiplication into isometries.
  Let $m$ be the symmetric translation-invariant mean obtained from these interval averages as $T arrow.r
    oo$ along an ultrafilter. Quotient bounded measurable $H$-valued functions by the null space of
    $m \( parallel f \( t \) parallel^2 \)$, and complete to a Hilbert space $cal(H)_m$. Define on elementary tensors
  $ R \( x Omega ⊗ a Omega \) \( t \) & = sigma_t \( x \) a Omega \,\
L \( x Omega ⊗ a Omega \) \( t \) & = a sigma_t \( x \) Omega . $
  The inner products of the images of $x Omega ⊗ a Omega$ and $y Omega ⊗ b Omega$ are, respectively,
  $ m #scale(x: 120%, y: 120%)[\(] phi \( b^(*) sigma_t \( y^(*) x \) a \) #scale(x: 120%, y: 120%)[\)] \, wide
    m #scale(x: 120%, y: 120%)[\(] phi \( y^(*) sigma_(- t) \( b^(*) a \) x \) #scale(x: 120%, y: 120%)[\)] . $
  Both equal $phi \( y^(*) x \) phi \( b^(*) a \)$. By linearity and completion, $R \, L : H ⊗ H arrow.r
    cal(H)_m$ are isometries. Translation $\( tau_u f \) \( t \) = f \( t + u \)$ is unitary on $cal(H)_m$ and satisfies
  $ tau_u R = R \( e^(i u X) ⊗ 1 \) \, wide tau_u L = L \( e^(i u X) ⊗ 1 \) . $
  ===== 3.2 From eigenstates to the product identity. <from-eigenstates-to-the-product-identity.>
  We claim that
  #[#set math.equation(numbering: n => "(6)")
   $ R = L exp \( i X ⊗ Y \) . $ <eq:absolute-RL>]
  The binormal identity first compares the two sides on vectors whose $X$-spectrum lies in a short interval.
    Translation covariance then lets us combine these comparisons without accumulating an error over the intervals.
  For a unit vector $h in H$, define the state
  $ Phi_h \( T \) = m #scale(x: 120%, y: 120%)[\(] chevron.l T e^(i t X) h \,
    e^(i t X) h chevron.r #scale(x: 120%, y: 120%)[\)] . $
  The modular averages just computed give $Phi_h compose lambda = Phi_h compose rho = phi$; here $e_M = 1$.
    Moreover, $Phi_h \( f \( X \) \) = chevron.l f \( X \) h \, h chevron.r$.
    For modular-analytic $a in M$, put $a_(+) = sigma_(i \/ 2) \( a \)$, so that $Omega a_(+) = a Omega$.
    The definitions of $R$ and $L$ give
  $ R \( h ⊗ a Omega \) \( t \) = rho \( a_(+) \) e^(i t X) h \, wide L \( h ⊗ a Omega \) \( t \) = a e^(i t X) h . $
  These identities extend from $h = x Omega$ to every $h in H$ by continuity.
  Suppose the spectral support of a sequence of unit vectors $h$ is contained in intervals shrinking to $s$.
    Every weak\* accumulation state of $Phi_h$ then has spectral evaluation at $s$. By (4),
  $ chevron.l R \( h ⊗ a Omega \) \, L \( h ⊗ gamma_s \( a \) Omega \) chevron.r & =
    Phi_h #scale(x: 120%, y: 120%)[\(] lambda \( gamma_s \( a^(*) \) \) rho \( a_(+) \) #scale(x: 120%, y: 120%)[\)]\
 & arrow.r chevron.l a^(*) Omega a_(+) \, Omega chevron.r = parallel a Omega parallel^2 . $
  Both vectors on the left have squared norm $parallel a Omega parallel^2$, so their difference tends to zero.
  This convergence is uniform when the centers $s$ range over a fixed compact set and the interval lengths tend to
    zero. Otherwise choose violating vectors and a convergent subsequence of centers,
    and take a weak\* accumulation state. The preceding argument gives a contradiction.
    In this step the varying test $gamma_s \( a^(*) \)$ may be replaced by its limit:
    the common left marginal $phi$ and Cauchy–Schwarz bound the change by
  $ parallel a_(+) parallel thin parallel gamma_s \( a \) Omega - gamma_(s_0) \( a \) Omega parallel \, $
  which tends to zero. Thus no operator-norm continuity of $gamma$ is needed.
  Analytic vectors $a Omega$ are dense in $H$, and all maps being compared are isometric.
    Hence the same local conclusion holds for a fixed $eta in H$,
    with $gamma_s \( a \) Omega$ replaced by $e^(i s Y) eta$. Spectral calculus gives
  $ parallel exp \( i X ⊗ Y \) \( h ⊗ eta \) - h ⊗ e^(i s Y) eta parallel lt.eq
    sup_(\| r - s \| lt.eq delta) parallel e^(i r Y) eta - e^(i s Y) eta parallel $
  whenever $"supp"_X \( h \) subset \[ s - delta \, s + delta \]$ and $parallel h parallel = 1$.
    Consequently, for $T = R - L exp \( i X ⊗ Y \)$, a fixed compact interval $I$, and fixed $eta$,
    there is a function $alpha_(I \, eta) \( delta \) arrow.r 0$ such that
  $ parallel T \( h ⊗ eta \) parallel lt.eq alpha_(I \, eta) \( delta \) parallel h parallel $
  when $h$ has spectral support in an interval of length at most $delta$ contained in $I$.
  Translation covariance shows that $T^(*) T$ commutes with the spectral projections of $X ⊗ 1$.
    For $"supp"_X \( h \) subset I$, partition $I$ into finitely many disjoint Borel intervals $I_j$ of length at
    most $delta$ and write $h_j = upright(bold(1))_(I_j) \( X \) h$. The vectors $T \( h_j ⊗ eta \)$ are orthogonal, so
  $ parallel T \( h ⊗ eta \) parallel^2 = sum_j parallel T \( h_j ⊗ eta \) parallel^2 lt.eq
    alpha_(I \, eta) \( delta \)^2 sum_j parallel h_j parallel^2 =
    alpha_(I \, eta) \( delta \)^2 parallel h parallel^2 . $
  Letting $delta arrow.b 0$ and then using density proves (6).
  ===== 3.3 Reflection forces a lattice. <reflection-forces-a-lattice.>
  Define $\( J_0 f \) \( t \) = Delta^(i t) f \( - t \)$. Symmetry of $m$ makes $J_0$ a unitary involution on
    $cal(H)_m$. On elementary tensors,
  $ J_0 R \( x Omega ⊗ a Omega \) \( t \) = Delta^(i t) sigma_(- t) \( x \) a Omega = x sigma_t \( a \) Omega =
    L \( a Omega ⊗ x Omega \) \( t \) . $
  Similarly $J_0 L = R Sigma$, where $Sigma$ flips the input factors.
    Applying $J_0$ to (6) and composing with $Sigma$ gives $L = R exp \( i Y ⊗ X \)$.
    Substitute this back into (6) and cancel the isometry $R$ to obtain
  #[#set math.equation(numbering: n => "(7)")
   $ exp \( i Y ⊗ X \) exp \( i X ⊗ Y \) = 1 . $ <eq:latticephase>]
  Let $S subset bb(R)^2$ be the support of the joint spectral measure of $\( X \, Y \)$.
    The tensor-product spectral measure has support $S times S$, so the continuous phase in (7) satisfies
  #[#set math.equation(numbering: n => "(8)")
   $ r s' + s r' in 2 pi bb(Z) quad upright("for all ") \( r \, s \) \, \( r' \, s' \) in S . $ <eq:lattice>]
  If $S$ contains two linearly independent points, pairing with them confines $S$ to the inverse image of
    $\( 2 pi bb(Z) \)^2$ under an invertible linear map. Thus $S$ is countable.
    If $S$ spans a non-axis line, choose a nonzero $\( r_0 \, s_0 \) in S$; then $r_0 s_0 eq.not 0$,
    and any point $t \( r_0 \, s_0 \) in S$ satisfies $2 t r_0 s_0 in 2 pi bb(Z)$. Again $S$ is countable.
    In both cases the joint spectral measure is supported on countably many points,
    so $X$ has pure point spectrum. The remaining possibilities put $S$ on a coordinate axis and give $X =
    0$ or $Y = 0$.
  ===== 3.4 Excluding the spectral alternatives. <excluding-the-spectral-alternatives.>
  A modular action with scalar fixed algebra has no Hilbert-space eigenvectors other than multiples of $Omega$;
    we recall the argument of [12] Lemma 2.1. Let $P_r$ be the spectral projection of $X$ at $r$.
    For $x in M$, the bounded character averages
  $ x_T = frac(1, 2 T) integral_(- T)^T e^(- i r t) sigma_t \( x \) thin d t $
  satisfy $parallel x_T parallel lt.eq parallel x parallel$ and $x_T Omega arrow.r P_r \( x Omega \)$.
    A weak\* cluster point $y in M$ represents this vector, since $phi \( z^(*) x_T \)$ converges to $chevron.l
    P_r \( x Omega \) \, z Omega chevron.r$ for every $z in M$.
    Thus $y Omega = P_r \( x Omega \)$, and the separating property of $Omega$ gives $sigma_t \( y \) =
    e^(i r t) y$. Density of $M Omega$ shows that any nonzero eigenspace is detected by a nonzero such eigenoperator.
  For this $y$, both $y^(*) y$ and $y y^(*)$ lie in $M_phi = bb(C) 1$.
    Hence $y$ is a nonzero scalar multiple of a unitary $u$. Since $sigma_(- i) \( u \) = e^r u$, the KMS identity gives
  $ 1 = phi \( u u^(*) \) = phi \( u^(*) sigma_(- i) \( u \) \) = e^r phi \( u^(*) u \) = e^r . $
  Therefore $r = 0$, and then $y$ itself is scalar. It follows that the only eigenvectors of $X$ are multiples of
    $Omega$. They cannot span $H$ because $M$ is nontrivial. This excludes pure point spectrum, including $X = 0$.
    Finally, $Y = 0$ would make the bicentralizer flow trivial on $M$, contradicting its ergodicity.
    All alternatives are excluded, proving the theorem. ◻
]

== 4 The two relative products <sec:products>

Return to an expected inclusion with $N$ a type $upright("III")_1$ factor; $M$ remains arbitrary.
  Keep $B = upright(B) \( N subset M \, phi \)$ and put

$ H = L^2 \( N \, phi \) \, wide K = L^2 \( B \, phi \) \, wide X = log Delta_(phi \|_N) . $

Let $W_s = e^(i s Y)$ implement $gamma_s$ on $K$. Since the flow preserves $phi \|_B$,
  these unitaries commute with the modular implementation on $K$.
  The absolute theorem makes multiplication in either order isometric.
  This will let us compare the two products on the fixed Hilbert space $H ⊗ K$.

#thm([Lemma 4.1.])[
  #emph[The expectations satisfy
$ E_N \|_B = phi \( dot.op \) 1 \, wide E_B \|_N = phi \( dot.op \) 1 . $

 Consequently the maps
$ R \( x Omega ⊗ a Omega \) = x a Omega \, wide L \( x Omega ⊗ a Omega \) = a x Omega wide \( x in N \, med a in B \) $

 extend to isometries from $H ⊗ K$ to $cal(H)$.]
] <lem:products>

#proof[
  Applying $E_N$ to the asymptotic commutation condition gives $E_N \( B \) subset upright(B) \( N \, phi \) =
    bb(C) 1$, by Theorem 4. State preservation determines the scalar. For $x in N$ and $b in B$,
  $ phi \( b^(*) x \) = phi \( E_N \( b \)^(*) x \) = phi \( b^(*) \) phi \( x \) \, $
  which characterizes $E_B \( x \) = phi \( x \) 1$. Using $E_B$ for the first product and $E_N$ for the second gives
  $ chevron.l x a Omega \, y b Omega chevron.r & = phi \( b^(*) y^(*) x a \) = phi \( y^(*) x \) phi \( b^(*) a \) \,\
chevron.l a x Omega \, b y Omega chevron.r & = phi \( y^(*) b^(*) a x \) = phi \( y^(*) x \) phi \( b^(*) a \) . $
  Polarization and completion prove the assertion. ◻
]

Define the contraction $U$ and the unitary $D$ on $H ⊗ K$ by

#[#set math.equation(numbering: n => "(9)")
 $ U = L^(*) R \, wide D = exp \( i X ⊗ Y \) . $ <eq:UD>]

Thus

#[#set math.equation(numbering: n => "(10)")
 $ chevron.l U \( x Omega ⊗ a Omega \) \, y Omega ⊗ b Omega chevron.r = phi \( y^(*) b^(*) x a \) . $ <eq:Ucoeff>]

Our goal is $U = D$. The next section compares arbitrarily long words in these operators on vectors with narrowly
  supported #emph[total] modular energy. Section 6 will turn that uniform estimate into the exact identity.

== 5 An estimate uniform in total modular energy <sec:energy>

For $n gt.eq 1$, work on $H^(⊗ n) ⊗ K$. Let $X_j$ act on the $j$th copy of $H$, and let $U_j \,
  D_j$ act on that copy together with the common last factor $K$.
  Write $S_n = sum_(j = 1)^n X_j$ for the total modular generator on $H^(⊗ n)$.
  For arbitrary real numbers $d_0 \, dots.h \, d_n$, set

#[#set math.equation(numbering: n => "(11)")
 $ C & = W_(d_n) U_n W_(d_(n - 1)) dots.h.c W_(d_1) U_1 W_(d_0) \,\
D_(upright("all")) & = W_d exp \( i S_n ⊗ Y \) \, wide d = sum_(j = 0)^n d_j . $ <eq:Cword>]

Here every $W$ acts on $K$ alone. Replacing each $U_j$ in $C$ by $D_j$ gives $D_(upright("all"))$,
  because those unitaries commute with all the shifts.

#thm([Proposition 5.1.])[
  (Uniform energy estimate).  #emph[For every $eta in K$ there is a function $epsilon.alt_eta : \( 0 \, oo \)
    arrow.r \[ 0 \, oo \)$ with $epsilon.alt_eta \( delta \) arrow.r 0$ as $delta arrow.b 0$ such that
#[#set math.equation(numbering: n => "(12)")
 $ parallel \( C - D_(upright("all")) \) \( xi ⊗ eta \) parallel lt.eq epsilon.alt_eta \( delta \) $ <eq:energy>]

 for every $n gt.eq 1$, every $d_0 \, dots.h \, d_n in bb(R)$,
   and every unit vector $xi in H^(⊗ n)$ whose $S_n$-spectral support lies in an interval of length $delta$.
   The same function works for all these choices and for all positions of the interval.]
] <prop:energy>

The estimate must remain uniform even when both the tensor length and the shifts vary.
  To achieve this, we express a coefficient of $C$ through a state on the single algebra
  $upright(bold(B)) \( cal(H) \)$. The state will have fixed left and right marginals,
  while its modular distribution records the sum $S_n + d$.
  Proposition 3(i) can then be applied in one fixed state space.

For $x_j \, y_j in N$, define a kernel by

#[#set math.equation(numbering: n => "(13)")
 $ ⟨Z \( T \) ⨂_(j = 1)^n x_j Omega \, ⨂_(j = 1)^n y_j Omega⟩ = chevron.l T_0 Omega \, Omega chevron.r \,
   $ <eq:Zkernel>]

where the operators $T_j in upright(bold(B)) \( cal(H) \)$ are obtained backwards:

$ T_n = theta_(- d_n) \( T \) \, wide T_(j - 1) = theta_(- d_(j - 1)) \( y_j^(*) T_j x_j \)
  quad \( j = n \, dots.h \, 1 \) . $

The operators $x_j \, y_j$ here act on $cal(H)$ by left multiplication.

#thm([Lemma 5.2.])[
  (The iterated kernel).  #emph[Formula (13) defines a unital completely positive map $Z :
    upright(bold(B)) \( cal(H) \) arrow.r upright(bold(B)) \( H^(⊗ n) \)$, possibly nonnormal. It satisfies
#[#set math.equation(numbering: n => "(14)")
 $ Z \( lambda \( a \) \) & = Z \( rho \( a \) \) = phi \( a \) 1 quad \( a in M \) \, & Z \( e_N \) & = 1 \,\
Z \( f \( X_M \) \) & = f \( S_n + d \) quad \( f in C_0 \( bb(R) \) \) . $ <eq:Zmarg>]

 For modular-analytic $a in B$, put $a_(+) = sigma_(i \/ 2) \( a \)$, so that $Omega a_(+) = a Omega$.
   Then, for $b in B$ and $xi \, xi' in H^(⊗ n)$,
#[#set math.equation(numbering: n => "(15)")
 $ chevron.l Z \( b^(*) rho \( a_(+) \) \) xi \, xi' chevron.r = chevron.l C \( xi ⊗ a Omega \) \,
   xi' ⊗ b Omega chevron.r . $ <eq:Zmixed>]

]
] <lem:kernel>

#proof[
  ===== 5.1 Construction and marginals. <construction-and-marginals.>
  Take finitely many elementary tensors. For $T gt.eq 0$, apply the recurrence simultaneously to their two
    indices. At each stage the operator matrix is multiplied on the left and right by the adjoint and the original
    of the diagonal matrix of that position’s labels. Its positivity is preserved,
    and complete positivity of $theta_(- d_j)$ preserves it at the next stage.
    Taking the final $Omega$ coefficients therefore gives a positive scalar kernel.
    For $T = 1$, the identity $E_B \|_N = phi \( dot.op \) 1$ reduces this kernel to
  $ product_(j = 1)^n phi \( y_j^(*) x_j \) \, $
  the Gram kernel of the elementary tensors. Applying positivity to $0 lt.eq T lt.eq
    parallel T parallel 1$ now bounds the quadratic form by $parallel T parallel$ times the tensor norm squared.
    Thus the form depends only on the tensor vector, extends to the completion, and defines a positive unital map.
    The same argument with an additional matrix index proves complete positivity.
  For $T = lambda \( a \)$, the first map produces $gamma_(- d_n) \( E_B \( a \) \) in
    B$ with state value $phi \( a \)$. At a subsequent stage,
    an element $b in B$ is replaced by $gamma_(- d_(j - 1)) \( E_B \( y_j^(*) b x_j \) \) in B$. Its state value is
  $ phi \( y_j^(*) b x_j \) = phi \( b \) phi \( y_j^(*) x_j \) \, $
  using $E_N \|_B = phi \( dot.op \) 1$. Iterating this scalar identity gives the left marginal in (14).
    For the right marginal, the full right algebra is fixed by each $theta$,
    hence belongs to its multiplicative domain. Right multipliers commute with the labels and pass through every
    stage, while $E_B \|_N = phi \( dot.op \) 1$ factors the labels as above.
    For $e_N$, use $\[ e_N \, N \] = 0$ and the fact that the fixed projection $e_N$ also belongs to every map’s
    multiplicative domain. Since $e_N Omega = Omega$, the recurrence gives the same Gram kernel as for $T = 1$.
    These computations establish all of (14).
  ===== 5.2 The modular unitary group. <the-modular-unitary-group.>
  First extend the spectral formula for each individual $theta_(- q)$ from $C_0 \( bb(R) \)$ to the functions $s
    mapsto e^(i t s)$. Its restriction to $C_0 \( X_M \)$ is a homomorphism,
    so that algebra belongs to its multiplicative domain. For $f in C_0 \( bb(R) \)$, it follows that
  $ f \( X_M + q \) theta_(- q) \( e^(i t X_M) \) = theta_(- q) \( f \( X_M \) e^(i t X_M) \) =
    f \( X_M + q \) e^(i t \( X_M + q \)) . $
  The ranges of these cutoffs span a dense subspace of $cal(H)$.
    Consequently $theta_(- q) \( e^(i t X_M) \) = e^(i t \( X_M + q \))$;
    these unitaries also belong to the multiplicative domain.
    No limiting operation has been passed through $theta_(- q)$.
  In the kernel recurrence, commute $e^(i t X_M)$ to the right across each $x_j$, using $e^(i t X_M) x_j =
    sigma_t \( x_j \) e^(i t X_M)$. The next map replaces the left factor $y_j^(*) sigma_t \( x_j \) in
    N$ by its state value. The resulting coefficient is
  $ e^(i t d) product_(j = 1)^n phi \( y_j^(*) sigma_t \( x_j \) \) \, $
  which proves
  #[#set math.equation(numbering: n => "(16)")
   $ Z \( e^(i t X_M) \) = e^(i t \( S_n + d \)) . $ <eq:Zgroups>]
  A nonnormal map need not preserve weak operator integrals, so this identity alone does not yet justify (14).
    We next show that the coefficient states needed to recover continuous functions are supported inside a compact
    spectral interval.
  ===== 5.3 Spectral cutoffs and continuous functions. <spectral-cutoffs-and-continuous-functions.>
  Call $x in N$ bandlimited if it admits a finite bound $L gt.eq 0$ such that, for every interval $J$,
  $ x upright(bold(1))_J \( X_M \) cal(H) subset upright(bold(1))_(J + \[ - L \, L \]) \( X_M \) cal(H) . $
  Such elements are strongly dense. Indeed, convolve the modular action with an approximate identity having
    smooth, compactly supported Fourier transforms. If the Fourier support of a smoothing kernel lies in
    $\[ - L \, L \]$, the resulting element has the displayed transfer property:
    testing $e^(i t X_M) x e^(- i t X_M) = sigma_t \( x \)$ against scalar Fourier kernels shows that spectral
    pieces separated by more than $L$ have zero matrix coefficient.
  Two operations in the kernel preserve a suitable interval on which a positive operator vanishes.
    Suppose that $A gt.eq 0$ annihilates the spectral subspace associated with an open interval $I$.
    For $f in C_c \( I \)$, $f \( X_M \) A = 0$, so the multiplicative-domain identity gives
  $ f \( X_M + q \) theta_(- q) \( A \) = 0 . $
  The cutoff ranges span the spectral subspace for $I - q$;
    thus $theta_(- q) \( A \)$ annihilates that translated interval.
    If $x$ has transfer in $\[ - L \, L \]$, the preceding transfer rule also shows that $x^(*) A
    x$ annihilates every interval $J$ with $J + \[ - L \, L \] subset I$.
  Apply these rules to a diagonal kernel with bandlimited labels $x_j$, of transfer bounds $L_j$,
    starting from $A = upright(bold(1))_({ \| X_M \| > R })$.
    Translating by each $- d_j$ and shrinking by each $L_j$ leaves an open interval about zero whenever
  $ R > sum_(j = 0)^n \| d_j \| + sum_(j = 1)^n L_j . $
  The final operator then annihilates $Omega$, whose modular energy is zero.
    Hence its diagonal kernel coefficient vanishes. For a finite sum of bandlimited elementary tensors,
    choose one $R$ that works for every term; positivity and Cauchy–Schwarz make the off-diagonal coefficients
    vanish as well. These tensor sums form a dense subspace of $H^(⊗ n)$.
  For a unit vector $xi$ in this subspace, set $Phi_xi \( T \) = chevron.l Z \( T \) xi \,
    xi chevron.r$ and $P_R = upright(bold(1))_(\[ - R \, R \]) \( X_M \)$.
    We have proved $Phi_xi \( 1 - P_R \) = 0$. Cauchy–Schwarz therefore yields
  $ Phi_xi \( T \) = Phi_xi \( P_R T P_R \) . $
  The transfer property applied to $Omega$ also puts $x_j Omega$ in the $X$-spectral subspace for
    $\[ - L_j \, L_j \]$. Our choice of $R$ therefore places the spectral distribution of $S_n +
    d$ on $xi$ in $\[ - R \, R \]$ as well. Both sides of (16), evaluated on $xi$,
    are thus determined by functions restricted to this same compact interval.
    Finite linear combinations of the exponentials form a uniformly dense self-adjoint algebra in
    $C \( \[ - R \, R \] \)$. Uniform approximation now proves
  $ chevron.l Z \( f \( X_M \) \) xi \, xi chevron.r = chevron.l f \( S_n + d \) xi \,
    xi chevron.r wide \( f in C_0 \( bb(R) \) \) . $
  Continuity in $xi$ and polarization prove (14) on the whole tensor product.
    The radius $R$ may depend on the labels, shifts, and tensor length:
    only the resulting exact identity will enter the uniform estimate.
  ===== 5.4 The word coefficient. <the-word-coefficient.>
  First, (10) and state preservation of $E_B$ give
  $ chevron.l U \( x Omega ⊗ zeta \) \, y Omega ⊗ b Omega chevron.r = chevron.l zeta \,
    E_B \( x^(*) b y \) Omega chevron.r wide \( x \, y in N \, med b in B \, med zeta in K \) . $
  The identity follows first for $zeta = a Omega$ and then by density.
    It shows that moving an output test backwards through $U$ keeps its last factor in $B Omega$.
    To compute a word coefficient, take elementary tensors and record the adjoints of the successive test labels as
  $ c_n = gamma_(- d_n) \( b^(*) \) \, wide c_(j - 1) = gamma_(- d_(j - 1)) #scale(x: 120%, y: 120%)[\(]
    E_B \( y_j^(*) c_j x_j \) #scale(x: 120%, y: 120%)[\)] quad \( j = n \, dots.h \, 1 \) . $
  Each $c_j$ belongs to $B$. Because the right multiplier is fixed and lies in the multiplicative domain of every
    $theta$, the recurrence for $T = b^(*) rho \( a_(+) \)$ gives $T_j = c_j rho \( a_(+) \)$.
    Its final coefficient is $phi \( c_0 a \)$.
  The same recurrence computes the coefficient of $C$ backwards from its output vector.
    Moving the output test across $W_(d_j)$ applies $gamma_(- d_j)$,
    and (10) moves it across $U_j$ by replacing $c_j$ with $E_B \( y_j^(*) c_j x_j \)$.
    The last coefficient is again $phi \( c_0 a \)$. This proves (15) for elementary tensors;
    linearity and continuity give the general case. ◻
]

#proof[
  First restrict to data for which the spectral support of $S_n + d$ on $xi$ lies in $\[ - delta \, delta \]$. The state
  $ Phi \( T \) = chevron.l Z \( T \) xi \, xi chevron.r $
  has both marginals equal to $phi$ and satisfies $Phi \( e_N \) = 1$.
    By (14), along any sequence of such data with $delta arrow.r 0$,
    every weak\* accumulation state satisfies $Phi \( f \( X_M \) \) = f \( 0 \)$ for $f in C_0 \( bb(R) \)$.
    Proposition 3(i), applied to the fixed operator $a^(*) rho \( a_(+) \)$, and (15) give
  $ chevron.l C \( xi ⊗ a Omega \) \, xi ⊗ a Omega chevron.r arrow.r chevron.l a^(*) Omega a_(+) \,
    Omega chevron.r = parallel a Omega parallel^2 $
  for every modular-analytic $a in B$. Since $C$ is a contraction,
  $ parallel C \( xi ⊗ a Omega \) - xi ⊗ a Omega parallel^2 lt.eq 2 parallel a Omega parallel^2 -
    2 "Re" chevron.l C \( xi ⊗ a Omega \) \, xi ⊗ a Omega chevron.r \, $
  so this difference tends to zero. Density of analytic vectors $a
    Omega$ and contractivity give the same conclusion for each fixed $eta in K$.
    The conclusion is uniform in $n$, the shifts, and $xi$: otherwise a sequence of violating choices would have
    an accumulation state in the state space of the same algebra $upright(bold(B)) \( cal(H) \)$ and contradict
    the argument just given.
  For the ideal word, the same spectral localization gives
  $ parallel D_(upright("all")) \( xi ⊗ eta \) - xi ⊗ eta parallel lt.eq
    sup_(\| s \| lt.eq delta) parallel W_s eta - eta parallel arrow.r 0 . $
  Combining these bounds proves the centered estimate. Finally suppose the $S_n$-support of $xi$ lies in any
    interval of length $delta$. Choose $q$ so that the containing interval for $S_n + d + q$ is centered at zero,
    and replace the final shift $d_n$ by $d_n + q$. This replaces $C$ and $D_(upright("all"))$ by $W_q C$ and $W_q
    D_(upright("all"))$. Their difference has the same norm, and the input vector $eta$ is unchanged.
    The centered estimate therefore proves (12) with all the asserted uniformity. ◻
]

== 6 Repeated tensor tests <sec:repeat>

We now prove that the comparison is exact, using only the uniform estimate and the operator structure in
  (11)–(11). A discrepancy between $U$ and $D$ makes their average $\( U + D \) \/ 2$ lose squared norm.
  Yet arbitrarily long words in these averages remain uniformly close, after time averaging,
  to the ideal unitary words. Random recentering will capture the discrepancy with a nonsummable sequence of
  probabilities, forcing more total norm loss than is available.
  The sampling must control the approximation error as well as detect the discrepancy;
  independent sampling provides the same probability factor in both estimates.

#thm([Lemma 6.1.])[
  (Hybrid words and time averaging).  #emph[The estimate (12) holds with the same modulus if any subset of the
    $U_j$ is replaced by $D_j$, or if all $U_j$ are replaced by $G_j = \( U_j + D_j \) \/ 2$.
    For every $delta > 0$ there is a probability density $p_delta$ on $bb(R)$ such that,
    for every unit $xi in H^(⊗ n)$ without a spectral support restriction,
#[#set math.equation(numbering: n => "(17)")
 $ integral_(bb(R)) parallel \( C - D_(upright("all")) \) \( e^(i t S_n) xi ⊗ eta \) parallel^2 p_delta \( t \)
   thin d t lt.eq epsilon.alt_eta \( delta \)^2 . $ <eq:timeavg>]

 The statement includes the hybrid and averaged words.]
] <lem:hybrid>

#proof[
  If no $U_j$ remains, the word equals $D_(upright("all"))$.
    Otherwise disintegrate the replaced positions over their $X$-spectral variables.
    On a fiber with values $\( x_j \)$, each replaced $D_j$ acts as the shift $W_(x_j)$ on $K$,
    and the sum of the remaining energies lies in the original interval translated by $- sum x_j$.
    The interval’s length is unchanged. The fiber vector in the remaining positions need not be a simple tensor:
    Proposition 6 applies to every such vector, with the same last factor $eta$.
    If a fiber has spectral multiplicity, expand in an orthonormal basis of that multiplicity space and sum the
    homogeneous squared bounds. Integrating proves the hybrid assertion.
    Convex expansion proves the assertion for $G_j$; the coefficients of the expansion sum to one, independently of $n$.
  Choose an even real $L^2$-normalized smooth function $g$ supported in an interval of length $delta$,
    and put $p_delta \( t \) = \| hat(g) \( t \) \|^2$, with unitarily normalized Fourier transform.
    For the bounded operator $T = C - D_(upright("all"))$, vector-valued Plancherel gives
  $ integral_(bb(R)) parallel T \( e^(i t S_n) xi ⊗ eta \) parallel^2 \| hat(g) \( t \) \|^2 thin d t =
    integral_(bb(R)) parallel T \( g \( S_n - z \) xi ⊗ eta \) parallel^2 thin d z . $
  Here Plancherel is applied to $z mapsto g \( S_n - z \) xi ⊗
    eta$ and then to its image under the bounded operator $T$; no commutation of $T$ with $S_n$ is required.
    The Fourier sign does not matter with this choice of $g$.
    Each vector on the right is spectrally localized as required by (12), and
  $ integral_(bb(R)) parallel g \( S_n - z \) xi parallel^2 thin d z = parallel xi parallel^2 = 1 . $
  Apply the homogeneous form of that estimate and integrate. ◻
]

#thm([Theorem 6.2.])[
  #emph[For the operators in (9), one has $U = D$.]
] <thm:UD>

#proof[
  Suppose otherwise. Density of compact-spectrum vectors gives unit vectors $h in H$ and $eta in
    K$ with $"supp"_X \( h \) subset \[ - l \, l \]$ and $parallel \( U - D \) \( h ⊗ eta \) parallel > 0$.
    By strong continuity there are $c > 0$ and $0 < b lt.eq 1$ such that
  #[#set math.equation(numbering: n => "(18)")
   $ parallel \( U - D \) \( e^(i t' X) h ⊗ W_(s') eta \) parallel gt.eq
     c wide \( \| t' \| \, \| s' \| lt.eq b \) . $ <eq:localgap>]
  Use this fixed $eta$ in Lemma 8. Choose $delta$ so that $epsilon.alt := epsilon.alt_eta \( delta \) < c \/ 8$,
    and choose $A gt.eq 1$ with $integral_(- A)^A p_delta \( t \) thin d t gt.eq 3 \/ 4$.
  ===== 6.1 The repeated experiment. <the-repeated-experiment.>
  Fix a finite terminal length $m$. On one product probability space choose $t$ with density $p_delta$ and
    mutually independent parameters
  $ r_j tilde.op upright("Unif") \[ - 2 A \, 2 A \] \, wide s_j tilde.op upright("Unif") \[ - B_j \, B_j \] \,
    wide B_j = b + 1 + j l quad \( 1 lt.eq j lt.eq m \) \, $
  all independent of $t$. At position $j$ put the fresh input $e^(i \( t - r_j \) X) h$.
    Starting with $eta$ on $K$, propagate using $W_(s_j) G_j W_(- s_j)$.
    Let $zeta_k$ denote the result after $k$ positions, and let $chi_k$ be the ideal result with $D_j$ in place of
    $G_j$. Since $D_j$ commutes with the shifts on $K$,
  $ chi_k = exp \( i S_k ⊗ Y \) (⨂_(j = 1)^k e^(i \( t - r_j \) X) h ⊗ eta) . $
  Condition on every parameter other than $t$. Then $xi_k = ⨂_(j = 1)^k e^(- i r_j X) h$ is a fixed unit vector,
    the input is $e^(i t S_k) xi_k ⊗ eta$, and the successive conjugations $W_(s_j) G_j
    W_(- s_j)$ form an averaged word with fixed shifts summing to zero. Lemma 8 therefore gives
  #[#set math.equation(numbering: n => "(19)")
   $ integral parallel zeta_k - chi_k parallel^2 p_delta \( t \) thin d t lt.eq epsilon.alt^2 . $ <eq:idealclose>]
  For $k = 0$, both vectors are $eta$.
  ===== 6.2 A definite loss at each captured test. <a-definite-loss-at-each-captured-test.>
  At step $j = k + 1$, insert the fresh position into $zeta_k$ and apply $W_(- s_j)$ on $K$; call this input $v$.
    Let $v_0$ be the analogous input formed from $chi_k$. The parallelogram identity and contractivity give
  #[#set math.equation(numbering: n => "(20)")
   $ parallel v parallel^2 - parallel G_j v parallel^2 gt.eq 1 /
     4 parallel \( U_j - D_j \) v parallel^2 . $ <eq:normloss>]
  Define the random projection
  $ Q = upright(bold(1))_({ \| t - r_j \| lt.eq b }) thin upright(bold(1))_({ \| S_k - s_j \| lt.eq b }) \, $
  where the first factor is a scalar indicator and the second acts on the previous $k$ positions.
    For $k = 0$, interpret $S_0$ as zero. The projection $Q$ commutes with $U_j \,
    D_j$ and the last-position shifts. Put
  $ a_j = frac(b, 2 A) b / B_j . $
  We claim
  #[#set math.equation(numbering: n => "(21)")
   $ bb(E) parallel \( U_j - D_j \) Q v_0 parallel^2 & gt.eq 3 / 4 c^2 a_j \,\
bb(E) parallel \( U_j - D_j \) Q \( v - v_0 \) parallel^2 & lt.eq 4 epsilon.alt^2 a_j . $ <eq:idealbound>]
  Here $bb(E)$ integrates all parameters involved, including $t$.
  For (21), disintegrate the previous ideal vector over $S_k = e$.
    Its last factor is $W_e eta$, and $\| e \| lt.eq k l$. The interval $\[ e - b \, e + b \]$ lies in
    $\[ - B_j \, B_j \]$, so the probability over $s_j$ of capturing it is exactly $b \/ B_j$,
    as illustrated in Figure 1. For $\| t \| lt.eq A$, the probability over $r_j$ of $\| t - r_j \| lt.eq
    b$ is $b \/ \( 2 A \)$. On these fibers the current last factor is $W_(e - s_j) eta$, so (18) applies.
    Integrating, and using the mass at least $3 \/ 4$ of $\[ - A \, A \]$, proves (21).
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.05), [#text(size: 9pt)[previous ideal energy]])
  line((-3.4, 1.5), (3.4, 1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-3.4, 1.4), (-3.4, 1.6), (3.4, 1.4), (3.4, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-3.4, 1.4), [#text(size: 9pt)[$-"kl"$]], anchor: "north", padding: 0.1176cm)
  content((3.4, 1.4), [#text(size: 9pt)[$"kl"$]], anchor: "north", padding: 0.1176cm)
  circle((1.25, 1.5), radius: 0.05292, fill: black, stroke: none)
  content((1.25, 1.5), [#text(size: 9pt)[$e$]], anchor: "south", padding: 0.1176cm)
  line((1.25, 1.4), (1.25, 0.16), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((-5, -0.15), (5, 0.15), fill: rgb("#ebebeb"), stroke: none)
  rect((0.6, -0.15), (1.9, 0.15), fill: rgb("#bfbfff"), stroke: none)
  line((-5, 0), (5, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-5, -0.18), (-5, 0.18), (5, -0.18), (5, 0.18), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.6, -0.18), (0.6, 0.18), (1.9, -0.18), (1.9, 0.18), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((-5, -0.18), [#text(size: 9pt)[$-B_j$]], anchor: "north", padding: 0.1176cm)
  content((5, -0.18), [#text(size: 9pt)[$B_j$]], anchor: "north", padding: 0.1176cm)
  content((0.6, -0.18), [#text(size: 9pt)[$e-b$]], anchor: "north", padding: 0.1176cm)
  content((1.9, -0.18), [#text(size: 9pt)[$e+b$]], anchor: "north", padding: 0.1176cm)
  content((-3.4, 0.22), [#text(size: 9pt)[uniform shift $s_j$]], anchor: "south", padding: 0.1176cm)
  line((0.6, -0.85), (1.9, -0.85), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((1.25, -0.85), [#text(size: 9pt)[$2b$]], anchor: "north", padding: 0.1176cm)
  line((-5, -1.5), (5, -1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((0, -1.5), [#text(size: 9pt)[$2B_j$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Capture at step $j = k + 1$, shown schematically. For an ideal spectral value $\| e \| lt.eq k l$, the entire capture interval $\[ e - b \, e + b \]$ lies in the sampling interval, giving probability $2 b \/ \( 2 B_j \) = b \/ B_j$. The actual propagated error has no assumed spectral bound; for any of its spectral values the capture probability is at most $b \/ B_j$. ],
  ) <fig:capture>
  For (21), fix $t$ and all parameters from the previous $k$ steps, so that $zeta_k - chi_k$ is fixed.
    No spectral support bound on this error is available. For every real $e$,
  $ Pr_(s_j) \( \| e - s_j \| lt.eq b \) = frac(\| \[ e - b \, e + b \] ∩ \[ - B_j \, B_j \] \|, 2 B_j) lt.eq b /
    B_j . $
  The spectral theorem therefore gives the quadratic-form inequality
  $ frac(1, 2 B_j) integral_(- B_j)^(B_j) upright(bold(1))_({ \| S_k - s \| lt.eq b }) thin d s lt.eq b / B_j thin 1 . $
  Also $Pr_(r_j) \( \| t - r_j \| lt.eq b \) lt.eq b \/ \( 2 A \)$ for every fixed $t$.
    The two current sampling parameters are independent of each other and of the past.
    The fresh vector has norm one, while $W_(- s_j)$ commutes with $Q$ and does not affect its norm. Consequently
  $ bb(E)_(r_j \, s_j) parallel Q \( v - v_0 \) parallel^2 lt.eq a_j parallel zeta_k - chi_k parallel^2 . $
  Now integrate over $t$ and the past parameters to obtain
  $ bb(E) parallel Q \( v - v_0 \) parallel^2 lt.eq a_j bb(E) parallel zeta_k - chi_k parallel^2 lt.eq
    a_j epsilon.alt^2 $
  by (19). Since $parallel U_j - D_j parallel lt.eq 2$, this proves the claim.
  ===== 6.3 The contradiction. <the-contradiction.>
  Since $Q$ commutes with the step operators, $parallel \( U_j - D_j \) v parallel^2 gt.eq
    parallel \( U_j - D_j \) Q v parallel^2$. The triangle inequality in the mean-square Hilbert space,
    followed by (20), shows that the expected squared-norm loss at step $j$ is at least
  #[#set math.equation(numbering: n => "(22)")
   $ a_j / 4 (sqrt(3) / 2 c - 2 epsilon.alt)^2 . $ <eq:positive-loss>]
  The constant in parentheses is positive. On the other hand,
    inserting a unit fresh vector and applying the outer shift do not change norm.
    The losses therefore telescope from one and have total at most one.
    Since $sum_j a_j = oo$, choosing sufficiently many steps contradicts (22). Hence $U = D$. ◻
]

== 7 The continuous core and the general inclusion <sec:core>

The multiplication identity now determines the fixed points of the bicentralizer flow in the core.
  We recall why the core fixed-point equality yields an amenable subalgebra,
  then prove that equality in coordinates adapted to $N$. The final reduction passes from factors to an arbitrary
  center and invokes the existing amenable-subalgebra theorem.

===== 7.1 The core criterion. <the-core-criterion.>

For a type $upright("III")_1$ bottom factor, the bicentralizer in the core and its flow have the following
  description. Here $upright(B) \( N subset c \( M \) \, phi \)$ uses the same asymptotic commutation condition on
  bounded sequences in $N$, with the state $phi$ on $N$. In the realization $c \( M \) =
  M times.r_(sigma^phi) bb(R)$, with group unitaries $l \( t \)$, one has

#[#set math.equation(numbering: n => "(23)")
 $ upright(B) \( N subset c \( M \) \, phi \) = B times.r_(sigma^phi) bb(R) \, wide gamma_s \( l \( t \) \) =
   e^(- i t s) l \( t \) . $ <eq:core-bic>]

The algebra identity is [10] Proposition 7.2; the action extends the flow on $B$ as in [10] Proposition 8.6,
  proof. One inclusion in the desired fixed-point equality is automatic:

#[#set math.equation(numbering: n => "(24)")
 $ N' ∩ c \( M \) subset upright(B) \( N subset c \( M \) \, phi \)^gamma . $ <eq:core-auto>]

This inclusion follows by combining [10] Proposition 8.1 and its proof, Theorem 6.20(5), and Proposition 8.4.
  We will prove the reverse inclusion. Equality is equivalent to the relative bicentralizer conjecture by [10]
  Proposition 8.6. For an expected inclusion, that conjecture is equivalent to the #emph[weak Dixmier property]
  for $N subset c \( M \)$:

#[#set math.equation(numbering: n => "(25)")
 $ overline("conv" { u x u^(*) : u in cal(U) \( N \) })^(thin w^(*)) ∩ \( N' ∩ c \( M \) \) eq.not diameter
   wide \( x in c \( M \) \) . $ <eq:WD>]

With separable preduals, (25) is equivalent to the conclusion of Theorem 1, by [10] Theorem D.

#thm([Proposition 7.1.])[
  #emph[If $N$ is a type $upright("III")_1$ factor, then
$ upright(B) \( N subset c \( M \) \, phi \)^gamma = N' ∩ c \( M \) . $

]
] <prop:corefixed>

#proof[
  ===== 7.2 The algebra generated by $N$ and $B$. <the-algebra-generated-by-n-and-b.>
  By Theorem 9, $L^(*) R = D$ is unitary. Since $L \, R$ are isometries, this implies $R = L D$,
    so their ranges agree. Put $A = B or N$. The common range is $L^2 \( A \, phi \)$:
    it contains $Omega$, is invariant under left $N$ by its $R$ description and under left $B$ by its $L$
    description, and is contained in $L^2 \( A \, phi \)$. Applying adjoints gives invariance under the generated
    von Neumann algebra. Both $N$ and $B$ are modularly invariant,
    so the expected algebra $A$ has a canonically embedded core inside $c \( M \)$.
  ===== 7.3 Coordinates adapted to $N$. <coordinates-adapted-to-n.>
  Use $L$ to identify $L^2 \( A \, phi \)$ with $H ⊗ K$. In these coordinates left $B$ acts as $1 ⊗ B$,
    left $N$ acts as $D \( N ⊗ 1 \) D^(*)$, and the modular group is
  $ e^(i t X) ⊗ Delta_(phi \|_B)^(i t) . $
  Represent $c \( A \)$ faithfully on $H ⊗ K ⊗ L^2 \( bb(R) \)$ with constant base algebra and group unitaries
  $ e^(i t X) ⊗ Delta_(phi \|_B)^(i t) ⊗ l_(bb(R)) \( t \) \, $
  where $l_(bb(R))$ is the translation representation. This is the usual regular crossed-product representation
    after conjugating its variable base algebra by the modular implementation.
  Conjugate by $D^(*)$ on the first two positions. This removes the twist from the action of $N$,
    which now acts on $H$ alone, and transfers it to the core of $B$.
    Since $W_s$ commutes with $Delta_(phi \|_B)^(i t)$, the algebra $B times.r bb(R)$ is represented,
    at spectral value $X = h$, by
  #[#set math.equation(numbering: n => "(26)")
   $ a mapsto gamma_(- h) \( a \) ⊗ 1 \, wide l \( t \) mapsto e^(i t h) Delta_(phi \|_B)^(i t) ⊗
     l_(bb(R)) \( t \) . $ <eq:corefiber>]
  The two transformations in (26) are the same flow: on $B$ it is $gamma_(- h)$,
    and on $l \( t \)$ it multiplies by $e^(i t h)$. Thus these fibers are a fixed normal representation of $B
    times.r bb(R)$ composed with the core bicentralizer flow at $- h$, by (23).
    More explicitly, if $H = integral^xor H_h thin d nu \( h \)$ and $pi_0$ is the fixed regular representation on
    $K ⊗ L^2 \( bb(R) \)$, the representation of an element $z in B times.r bb(R)$ is
  $ integral^xor I_(H_h) ⊗ pi_0 \( gamma_(- h) \( z \) \) thin d nu \( h \) . $
  This normal direct-integral representation agrees with (26) on generators,
    so the formula applies to the entire crossed product.
  ===== 7.4 The fixed algebra. <the-fixed-algebra.>
  If $z$ is fixed by the core bicentralizer flow, then $pi_0 \( gamma_(- h) \( z \) \) =
    pi_0 \( z \)$ in every fiber. It therefore acts on $K ⊗ L^2 \( bb(R) \)$ alone, while $N$ acts on $H$ alone.
    Hence it commutes with $N$, proving
  $ upright(B) \( N subset c \( M \) \, phi \)^gamma subset N' ∩ c \( M \) . $
  The opposite inclusion is (24), so the fixed algebras agree. ◻
]

#proof[
  ===== 7.5 Factor bottom algebras. <factor-bottom-algebras.>
  For a type $upright("III")_1$ bottom factor, Proposition 10 and [10] Proposition 8.6 and Theorem D give the weak
    Dixmier property (25). The state on $N$ is a strictly semifinite weight, as required there.
    For a bottom factor of any other type, the same weak Dixmier property is [10] Proposition 4.11.
    These factor cases allow arbitrary upper algebras.
  ===== 7.6 Disintegration over the center. <disintegration-over-the-center.>
  For a general $N$, put $J = cal(Z) \( N \)$ and $M_0 = J' ∩ M$.
    The passage to $M_0$ makes $J$ central in both algebras, so that we can apply the factor cases fiber by fiber.
    The modular action of $phi = phi compose E_N$ fixes $J$ pointwise.
    Consequently $M_0$ is modularly invariant, and $E_N$ restricts to a faithful normal expectation $M_0 arrow.r
    N$. Moreover,
  #[#set math.equation(numbering: n => "(27)")
   $ J' ∩ c \( M \) = c \( M_0 \) $ <eq:center-core>]
  inside the chosen core, by [10] Proposition 4.7.
  Disintegrate $N subset M_0$ over the common central algebra $J$,
    using the probability measure $mu$ determined by $phi \|_J$.
    The bottom fibers $N_z$ are factors because $J = cal(Z) \( N \)$;
    the upper fibers $\( M_0 \)_z$ need not be factors. The simultaneous disintegration theorem for
    operator-valued weights gives faithful normal fiber expectations $E_z : \( M_0 \)_z arrow.r
    N_z$ and compatible faithful state fibers $phi_z$ [8] Propositions 2.1–2.2 and Theorem 2.3.
    Indeed, $E_N$ is $J$-bimodular, and its fiber weights satisfy $E_z \( 1 \) = 1$,
    so they are conditional expectations. The state identity $phi = phi compose
    E_N$ and the modular actions also disintegrate, as in the proof of that theorem.
  To see the resulting core compatibility, write $H_0 = L^2 \( M_0 \, phi \) =
    integral^xor H_z thin d mu \( z \)$, where $H_z = L^2 \( \( M_0 \)_z \, phi_z \)$.
    The regular representation of the core on $L^2 \( bb(R) \, H_0 \) =
    integral^xor L^2 \( bb(R) \, H_z \) thin d mu \( z \)$ is given by
  $ \( pi \( a \) xi \) \( t \) = sigma_(- t)^phi \( a \) xi \( t \) \, wide \( l \( s \) xi \) \( t \) =
    xi \( t - s \) . $
  Both formulas act fiberwise. A countable family of algebra generators and the rational translation parameters
    generate the fiber cores; the common central algebra $J$ is already present in the representation.
    Thus $c \( M_0 \) = integral^xor c \( \( M_0 \)_z \) thin d
    mu \( z \)$ with the corresponding copies of $N_z$. Separability supplies these standard measurable fields.
    The factor cases and the direct-integral criterion [10] Proposition 4.12 now give the weak Dixmier property
    for $N subset c \( M_0 \)$.
  ===== 7.7 Averaging into the central commutant. <averaging-into-the-central-commutant.>
  We have proved the weak Dixmier property inside $c \( M_0 \)$.
    To apply it to an arbitrary $x in c \( M \)$, we first average $x$ into this smaller core.
    The weak\* compact convex hull of its orbit under $cal(U) \( J \)$ is preserved by the commuting affine maps
    $"Ad" \( u \)$, $u in cal(U) \( J \)$. The compact-convex fixed-point theorem for commuting affine maps gives
    a common fixed point $y in J' ∩ c \( M \) = c \( M_0 \)$.
    One can obtain it by taking rectangular Cesàro averages for each finite family of commuting maps,
    then using compactness and the finite-intersection property.
    Since $J subset N$, this point belongs to the weak\* closed convex $N$-orbit hull of $x$.
    That hull is $N$-invariant. Applying weak Dixmier averaging inside $c \( M_0 \)$ therefore produces a point of
    $N' ∩ c \( M \)$ still in the original hull. This proves (25) for the original inclusion.
  ===== 7.8 The amenable subalgebra. <the-amenable-subalgebra.>
  Finally [10] Theorem D, (3)$arrow.r.double$(4) supplies an amenable subalgebra $P subset
    N$ with a faithful normal conditional expectation and $P' ∩ c \( M \) = N' ∩ c \( M \)$.
    The expectation is faithful and normal by the meaning of “with expectation” in that theorem.
    Unitality is automatic: if $p = 1_P < 1_N$, bimodularity would imply $F \( 1 - p \) = 0$,
    contradicting faithfulness. This proves the result. ◻
]

#heading(level: 1)[References]
#bibitem([1])[H.~Ando and U.~Haagerup, #emph[Ultraproducts of von Neumann algebras], J. Funct. Anal.
  #strong[266] (2014), no.~12, 6842--6913. #link("https://arxiv.org/abs/1212.5457v3")[arXiv:1212.5457v3].]
#bibitem([2])[H.~Ando, U.~Haagerup, C.~Houdayer, and A.~Marrakchi,
  #emph[Structure of bicentralizer algebras and inclusions of type III factors], Math. Ann.
  #strong[376] (2020), 1145--1194. #link("https://arxiv.org/abs/1804.05706v2")[arXiv:1804.05706v2].]
#bibitem([3])[A.~Connes, #emph[Classification des facteurs], in Operator Algebras and Applications,
  Part 2 (Kingston, Ontario, 1980), Proc. Sympos. Pure Math.
  #strong[38], American Mathematical Society, Providence, RI, 1982, 43--109.]
#bibitem([4])[A.~Connes, #emph[Factors of type $upright(I I I)_1$, property $L'_lambda$,
  and closure of inner automorphisms], J. Operator Theory #strong[14] (1985), 189--211.]
#bibitem([5])[U.~Haagerup, #emph[Connes' bicentralizer problem and uniqueness of the injective factor of type
  $upright(I I I)_1$], Acta Math. #strong[158] (1987), 95--148.
  #link("https://doi.org/10.1007/BF02392257")[doi:10.1007/BF02392257].]
#bibitem([6])[C.~Houdayer and Y.~Isono, #emph[Unique prime factorization and bicentralizer problem for a class of
  type III factors], Adv. Math. #strong[305] (2017), 402--455.
  #link("https://arxiv.org/abs/1503.01388v3")[arXiv:1503.01388v3].]
#bibitem([7])[C.~Houdayer and A.~Marrakchi, #emph[The classification of flows on $upright(I I)_1$ factors and
  Connes' bicentralizer problem], 2026, version 1, September 10, 2026.
  #link("https://arxiv.org/abs/2609.11462v1")[arXiv:2609.11462v1].]
#bibitem([8])[R.~Ichihara and S.~Kawakami, #emph[Disintegration of operator valued weights],
  Scientiae Mathematicae Japonicae Online #strong[e-2007] (2007), 693--699.
  #link("https://www.jams.jp/scm/contents/e-2007-7/2007-63.pdf")[Publisher PDF].]
#bibitem([9])[A.~Marrakchi, #emph[Full factors, bicentralizer flow and approximately inner automorphisms], Invent.
  Math. #strong[222] (2020), 375--398. #link("https://arxiv.org/abs/1811.10253v2")[arXiv:1811.10253v2].]
#bibitem([10])[A.~Marrakchi, #emph[Kadison's problem for type III subfactors and the bicentralizer conjecture],
  Invent. Math. #strong[239] (2025), 79--163. #link("https://arxiv.org/abs/2308.15163v3")[arXiv:2308.15163v3].]
#bibitem([11])[A.~Marrakchi, #emph[Kadison's problem and ergodicity of the bicentralizer flow], 2026, version 2,
  11 August 2026. #link("https://arxiv.org/abs/2606.23636v2")[arXiv:2606.23636v2].]
#bibitem([12])[A.~Marrakchi and S.~Vaes, #emph[Ergodic states on type $upright(I I I)_1$ factors and ergodic
  actions], J. Reine Angew. Math. #strong[809] (2024), 247--260.
  #link("https://arxiv.org/abs/2305.14217v3")[arXiv:2305.14217v3].]
#bibitem([13])[T.~Masuda, #emph[An analogue of Connes--Haagerup approach for classification of subfactors of type
  $upright(I I I)_1$], J. Math. Soc. Japan #strong[57] (2005), 959--1001.
  #link("https://doi.org/10.2969/jmsj/1150287301")[doi:10.2969/jmsj/1150287301].]
#bibitem([14])[OpenAI, #emph[Bounded recovery for modular spectral averages],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Bounded-recovery-for-modular-spectral-averages-September-23-2026/Bounded-recovery-for-modular-spectral-averages-September-23-2026.pdf")[OAI:Bounded-recovery-for-modular-spectral-averages-September-23-2026],
  2026.]
#bibitem([15])[S.~Popa, #emph[On a problem of R.~V.~Kadison on maximal abelian $*$-subalgebras in factors],
  Invent. Math. #strong[65] (1981), 269--281. #link("https://doi.org/10.1007/BF01389015")[doi:10.1007/BF01389015].]
#bibitem([16])[M.~Takesaki, #emph[Conditional expectations in von Neumann algebras], J. Funct. Anal.
  #strong[9] (1972), 306--321. #link("https://doi.org/10.1016/0022-1236(72)90004-3")[doi:10.1016/0022-1236(72)90004-3].]
#bibitem([17])[M.~Takesaki, #emph[Theory of Operator Algebras II],
  Encyclopaedia of Mathematical Sciences #strong[125], Springer-Verlag, Berlin, 2003.
  #link("https://doi.org/10.1007/978-3-662-10451-4")[doi:10.1007/978-3-662-10451-4].]
