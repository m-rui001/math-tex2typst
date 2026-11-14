#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Bounded recovery for modular spectral averages]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

Spectral localization in the standard Hilbert space of a von Neumann algebra does not by itself produce uniformly
  bounded elements of the algebra. This distinction matters when an argument starts with spectral vectors but its
  asymptotic identities apply only to bounded operator sequences.
  Our main analytical result, 8, provides a bounded recovery principle for this situation.

Let $M$ be a von Neumann algebra with a faithful normal state $phi.alt$.
  Write $M_phi.alt$ for the fixed-point algebra of its modular automorphism group $sigma^phi.alt$.
  We call $phi.alt$ ergodic when $M_phi.alt = bb(C) 1$. On the standard Hilbert space $H = L^2 \( M \)$, put $xi =
  phi.alt^(1 \/ 2)$, $D = log Delta_phi.alt$, and $U_t = e^(i t D)$.
  For an arbitrary fixed $T in cal(B) \( H \)$, consider unit vectors supported in spectral intervals of $D$
  shrinking to a real number $s$. 8 shows that a positive limiting averaged value of $∥T U_t
  h∥^2$ on these vectors can be recovered as a positive value of $∥T v
  xi∥^2$ on a sequence of uniformly bounded $v in M$. The recovered vectors remain in intervals shrinking to $s$,
  with widths at most four times the original widths. The averaging uses a fixed translation-invariant mean
  obtained from symmetric interval averages. The exact quantifiers and mean are given in Lemma 3.4, Theorem 4.1.

The only structural assumption in this recovery theorem is $M_phi.alt = bb(C) 1$;
  neither a bicentralizer condition nor a second action is required.
  This assumption supplies a broad class of applications: Marrakchi and Vaes proved that ergodic faithful normal
  states form a dense $G_delta$ in the normal state space of every type $upright("III")_1$ factor with separable
  predual #cite(label("MarrakchiVaes2024")) Theorem A.

===== 1.1 Bicentralizers and prior work. <bicentralizers-and-prior-work.>

We use the predual convention

$ \( w phi.alt \) \( y \) = phi.alt \( y w \) \, wide \( phi.alt w \) \( y \) = phi.alt \( w y \) . $

The bicentralizer $"BC" \( M \, phi.alt \)$ consists of those $a in M$ for which $\[ a \, w_n \] arrow.r
  0$ strongly whenever $\( w_n \)$ is uniformly bounded and $∥w_n phi.alt - phi.alt w_n∥_(M_(*)) arrow.r 0$.
  Connes’ bicentralizer conjecture asserts that this algebra is scalar for every type $upright("III")_1$ factor
  with separable predual. Connes developed the problem in his classification program for injective factors
  #cite(label("Connes1980")) #cite(label("Connes1985")). Haagerup proved the amenable case,
  completing the uniqueness theorem for the injective type $upright("III")_1$ factor #cite(label("Haagerup1987")).

Haagerup also related triviality to the existence of a faithful normal state with irreducible centralizer,
  meaning $\( M_phi.alt \)' ∩ M = bb(C) 1$ #cite(label("Haagerup1987")) Theorem 3.1.
  Together with Popa’s work on maximal abelian subalgebras #cite(label("Popa1981")),
  this connects the problem to expected subalgebras; the expected-masa equivalence is stated in
  #cite(label("HI2017")) Corollary 3.6. Important nonamenable cases include Houdayer’s theorem for free
  Araki–Woods factors #cite(label("Houdayer2009")) and the semisolid factors treated by Houdayer and Isono
  #cite(label("HI2017")) Theorem 3.7. An irreducible centralizer in these results is different from the scalar
  centralizer assumed in our recovery theorem.

Houdayer and Isono proved that a nonscalar bicentralizer of a separable type $upright("III")_1$ factor is itself a
  type $upright("III")_1$ factor and equals its own bicentralizer for the restricted state #cite(label("HI2017"))
  Proposition 3.4 and Theorem 3.5. Ando, Haagerup, Houdayer,
  and Marrakchi established the canonical relative bicentralizer flow #cite(label("AHHM2020")) Theorem A,
  following the flow construction of Haagerup and its independent discovery by Marrakchi.
  Marrakchi proved that every nonidentity time of the absolute flow is ergodic,
  without a fullness assumption #cite(label("Marrakchi2020")) Theorem D.
  His subsequent work develops the binormal-state and relative-core machinery #cite(label("Marrakchi2025"))
  #cite(label("Marrakchi2026")).

===== 1.2 The absolute application and the recent announcement. <the-absolute-application-and-the-recent-announcement.>

Houdayer and Marrakchi have announced triviality of the bicentralizer for every type $upright("III")_1$ factor
  admitting a faithful normal state, with no separability condition in the theorem statement
  #cite(label("HoudayerMarrakchi2026")) Theorem G. The application proved here is an alternative proof of the
  separable-predual instance of that conclusion.

#thm([Theorem 1.1.])[
  #emph[Let $M$ be a type $upright("III")_1$ factor with separable predual and let $phi.alt$ be any faithful
    normal state on $M$. Then
$ "BC" \( M \, phi.alt \) = bb(C) 1 . $

]
] <thm:main>

By #cite(label("HI2017")) Corollary 3.6, 1 also implies that every type $upright("III")_1$ factor with separable
  predual admits a maximal abelian subalgebra with a faithful normal conditional expectation.
  This is an existence statement for the factor; the expectation need not preserve the scalar-centralizer state
  used in bounded recovery.

The independent analytical contribution is the bounded recovery theorem,
  which applies to arbitrary $T$ without assuming a bicentralizer intertwining law.
  Houdayer and Marrakchi obtain the same symmetric spectral relation used below through multiplication isometries
  and a singular KMS state on the continuous core #cite(label("HoudayerMarrakchi2026")) Section 8.4,
  Propositions 8.8–8.10. Here modular averaging and bounded recovery lead to that relation through two interval
  estimates.

Houdayer and Marrakchi explicitly disclose assistance from #emph[GPT-5.6 Sol] and #emph[GPT-6 Astra]
  #cite(label("HoudayerMarrakchi2026")) p. 7. They credit Sol with counterexample exploration and an initial
  strict-outerness argument, and Astra with the singular tracial-state ingredient in their resonance strategy.
  They describe checking and rewriting the proofs and retaining responsibility for them.
  These are their stated contributions to that work, whose relative tracial-action theory is also developed in the
  paper.

===== 1.3 The rigidity statement. <the-rigidity-statement.>

A continuous action on $M$ means a $u$-continuous action on its automorphism group.
  Bounded recovery gives the following spectral proof of rigidity.

#thm([Theorem 1.2.])[
  (Spectral intertwining rigidity).  #emph[Let $M$ be a von Neumann algebra with a faithful normal state $phi.alt$
    such that $M_phi.alt = bb(C) 1$. Let $b : bb(R) arrow.cw.half M$ be a continuous $phi.alt$-preserving action.
    Suppose that, for every $s in bb(R)$, every uniformly bounded sequence $\( w_n \)$ in $M$, and every $a in M$,
#[#set math.equation(numbering: n => "(1.1)")
 $ ∥phi.alt w_n - e^s w_n phi.alt∥_(M_(*)) arrow.r 0 quad arrow.r.double quad w_n a - b_s \( a \) w_n arrow.r
   0 quad upright("strongly") . $ <eq:flow-property>]

 Then $b_s = "id"_M$ for every $s in bb(R)$.]
] <thm:rigidity>

The conclusion also follows from the announced absolute theorem.
  Indeed, at $s = 0$, hypothesis (1.1) implies $"BC" \( M \, phi.alt \) = M$.
  If $M eq.not bb(C) 1$, its scalar centralizer makes it a type $upright("III")_1$ factor by
  #cite(label("MarrakchiVaes2024")) Lemma 2.1; the announced theorem would then force $M = bb(C) 1$.
  Our proof instead derives 2 directly from bounded recovery and uses it to prove 1.
  For that application to a self-bicentralizing factor, the modular centralizer is scalar,
  the bicentralizer flow satisfies (1.1), and that flow is ergodic.
  A trivial ergodic action has scalar underlying algebra.

===== 1.4 Recovery and the spectral argument. <recovery-and-the-spectral-argument.>

The recovery proof combines modular averaging with the fourth-moment and polar-cutoff devices of Haagerup and
  Musat #cite(label("HaagerupMusat2007")) Equation (2.10), Lemma 2.6, and Remark 2.8.
  The strategy of recovering bounded witnesses by randomization, fourth-moment control,
  and truncation appears in the tracial spectral-gap argument of Ioana and Vaes #cite(label("IoanaVaes2015"))
  pp. 127–130. Related fourth-moment control underlies Marrakchi’s binormal-state implementation
  #cite(label("Marrakchi2025")) Section 2, Claim 2.2. Here modular orbit averages supply the moment bounds,
  and a final Fourier filter restores the shrinking spectral bands.
  The averaging time is chosen separately for each initial bounded representative of a spectral vector;
  these representatives need not be uniformly bounded. Norm convergence in the predual controls a varying
  second-moment operator, and independent circle phases give a uniform fourth-moment bound.
  One fixed polar truncation threshold then suffices. Fourier localization restores the spectral support without
  increasing operator norms by a factor depending on the width of the spectral interval.
  The Fourier operations belong to the standard spectral-subspace framework for automorphism groups
  #cite(label("Arveson1974")); the bounds needed here are proved explicitly.

For the spectral application, implement the state-preserving action by $V_s \( a xi \) =
  b_s \( a \) xi$ and write $V_s = e^(i s Q)$. These unitaries commute with $U_t$,
  so $\( D \, Q \)$ has a joint spectral support $cal(S) subset bb(R)^2$.
  The recovered bounded sequences let (1.1) force averaged intertwining defects to vanish on bands shrinking to a
  fixed modular energy. A spectral partition then gives an interval estimate without requiring a rate uniform in
  that energy. Applying this estimate twice, with the operators interchanged and the time reversed, gives

$ exp #scale(x: 120%, y: 120%)[\(] i \( r ell + q p \) #scale(x: 120%, y: 120%)[\)] =
  1 wide \( \( r \, p \) \, \( q \, ell \) in cal(S) \) . $

This symmetric relation is the final rigidity mechanism. It forces the joint support to be countable or to lie on
  a coordinate axis. Scalarity of the modular centralizer excludes nonzero modular eigenvalues,
  by the bounded-eigenoperator extraction and KMS argument of #cite(label("MarrakchiVaes2024")) Lemma 2.1,
  leaving only the axis on which the flow generator vanishes.

===== 1.5 Organization. <organization.>

2 records the established bicentralizer inputs and reduces 1 to 2.
  3 proves the modular and averaging preliminaries. 4 proves 8, and 5 completes the spectral argument.

== 2 Bicentralizers and the reduction <sec:bicentralizers>

We recall the definition to fix both the topology and the quantifiers.
  For a faithful normal state $phi.alt$, put $∥x∥_phi.alt = phi.alt \( x^(*) x \)^(1 \/ 2)$.
  The bicentralizer consists of those $a in M$ for which, for every $epsilon > 0$, there is $delta > 0$ such that

$ u in cal(U) \( M \) \, quad ∥u phi.alt - phi.alt u∥_(M_(*)) < delta quad arrow.r.double quad ∥u^(*) a u -
  a∥_phi.alt < epsilon . $

This is Haagerup’s unitary formulation of the usual bicentralizer #cite(label("Haagerup1987")) proof of Lemma 1.2.
  Equivalently, its elements asymptotically commute strongly with every uniformly bounded sequence that
  asymptotically centralizes $phi.alt$ in predual norm. We use established structural results in this equivalent form.

#thm([Proposition 2.1.])[
  (Established bicentralizer results).  #emph[Let $M$ be a type $upright("III")_1$ factor with separable predual
    and $phi.alt$ a faithful normal state.]
  + #emph[ If $B = "BC" \( M \, phi.alt \)$ is nonscalar, then $B$ is a type $upright("III")_1$ subfactor with a
    normal $phi.alt$-preserving conditional expectation, and
$ "BC" \( B \, phi.alt \|_B \) = B . $

]
  + #emph[ There is a continuous $phi.alt$-preserving action $beta^phi.alt :
    bb(R)_(+)^(*) arrow.cw.half "BC" \( M \, phi.alt \)$ characterized by
$ ∥w_n phi.alt - lambda phi.alt w_n∥_(M_(*)) arrow.r 0 quad arrow.r.double quad w_n a -
  beta_lambda^phi.alt \( a \) w_n arrow.r 0 quad * upright("-strongly") $

 for every $lambda > 0$, every uniformly bounded sequence $\( w_n \)$ in $M$, and every $a in "BC" \( M \, phi.alt \)$.]
  + #emph[ The fixed-point algebra of $beta^phi.alt$ is $bb(C) 1$.]
] <bc:inputs>

#proof[
  #emph[Sources and hypotheses.] The restricted-state identity in Proposition 2.1 is #cite(label("HI2017"))
    Proposition 3.4; the type dichotomy and expectation are #cite(label("HI2017")) Theorem 3.5.
    The bicentralizer is globally invariant under the modular group by #cite(label("HI2017")) Proposition 3.3,
    so its canonical expectation preserves $phi.alt$. These results impose no amenability or fullness hypothesis.
  For Proposition 2.1, apply #cite(label("AHHM2020")) Theorem A(ii) to the identity inclusion $M subset M$.
    Continuity is part of the flow construction. The expectation-preservation identity in #cite(label("AHHM2020"))
    Theorem A(iv) specializes to preservation of $phi.alt$, because the relative commutant is $bb(C) 1$.
  Finally, #cite(label("Marrakchi2020")) Theorem D states, for any $sigma$-finite type $upright("III")_1$ factor,
    that every $beta_lambda^phi.alt$ with $lambda eq.not 1$ is ergodic. This is stronger than Proposition 2.1.
    Fullness is not assumed in this Theorem. ◻
]

#proof[
  Suppose that $"BC" \( M \, phi.alt \)$ is nonscalar. Replace $\( M \, phi.alt \)$ by $\( B \, phi.alt \|_B \)$
    using 3Proposition 2.1. The restricted state is faithful and normal. The predual is still separable:
    if $E : M arrow.r B$ is the normal expectation, $B_(*) in.rev rho mapsto rho compose
    E in M_(*)$ is an isometric embedding. We may therefore assume
  $ "BC" \( M \, phi.alt \) = M \, wide M eq.not bb(C) 1 . $
  Every unitary $u in M_phi.alt$ centralizes $phi.alt$ exactly.
    The unitary definition of the bicentralizer gives $u^(*) a u = a$ for every $a in M$.
    Since unitaries span $M_phi.alt$, and $M$ is a factor, it follows that $M_phi.alt = bb(C) 1$.
  Set $b_s = beta_(e^(- s))^phi.alt$. The premise of (1.1) is equivalent to
  $ ∥w_n phi.alt - e^(- s) phi.alt w_n∥_(M_(*)) arrow.r 0 . $
  3Proposition 2.1 therefore gives exactly (1.1), and also continuity and state preservation.
    By 2, $b$ is trivial. By 3Proposition 2.1, it is ergodic. Hence $M = bb(C) 1$, contradicting the reduction.
    The contradiction applies to every original pair $\( M \, phi.alt \)$. ◻
]

== 3 Modular localization and averaging <sec:modular>

The recovery argument requires two kinds of control: modular spectral localization must imply a predual norm
  estimate, and modular averaging must control the moments of an operator even when its norm is large.
  We establish these facts here. The two norm limits in 6 will control different terms in the fourth-moment
  expansion in 4.

Throughout this Section $M$ is a von Neumann algebra with a faithful normal state $phi.alt$.
  Let $H = L^2 \( M \)$ be its standard Hilbert space, $xi = phi.alt^(1 \/ 2)$ its cyclic separating unit vector, and

$ L \( a \) h = a h \, wide R \( a \) h = h a \, wide D = log Delta_phi.alt \, wide U_t = e^(i t D) . $

Write $E_D$ for the spectral resolution of $D$ and $J$ for the modular conjugation.
  Inner products are linear in the first variable. We use the standard modular theory of
  #cite(label("Takesaki2003")). We write $sigma_t = sigma_t^phi.alt$. Standard modular theory gives

#[#set math.equation(numbering: n => "(3.1)")
 $ U_t \( a xi \) = sigma_t \( a \) xi \, wide e^(D \/ 2) a xi = xi a \, wide R \( a \) =
   J L \( a \)^(*) J . $ <eq:modular-identities>]

Indeed, $M xi$ is contained in the domain of the closed Tomita operator $S = J Delta_phi.alt^(1 \/ 2)$,
  with $S \( a xi \) = a^(*) xi$. Thus $Delta_phi.alt^(1 \/ 2) a xi = J a^(*) xi = xi a$.
  These standard-form conventions are also those of #cite(label("AHHM2020")) Section 2.1.

#thm([Lemma 3.1.])[
  (From modular localization to predual norm).  #emph[For $w in M$ and $s in bb(R)$,
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥phi.alt w - e^s w phi.alt∥_(M_(*)) lt.eq \( 1 + e^(s \/ 2) \) ∥\( e^(D \/ 2) - e^(s \/ 2) \) w xi∥ .
   $ <eq:predual-bound>]

 Consequently, if $\( w_n \)$ is uniformly bounded and the $D$-spectral support of $w_n
   xi$ is contained in $\[ s - d_n \, s + d_n \]$ with $d_n arrow.r 0$, then the left side of (3.2) tends to zero.]
] <mod:predual>

#proof[
  Put $c = e^(s \/ 2)$ and $eta = xi w - c w xi$. By (3.1), $eta = \( e^(D \/ 2) - c \) w xi$, and $J eta =
    w^(*) xi - c xi w^(*)$. For $∥y∥ lt.eq 1$, commutation of the left and right actions gives
  $ chevron.l y xi \, xi w^(*) chevron.r = chevron.l y \( xi w \) \, xi chevron.r . $
  Starting from $phi.alt \( w y \) = chevron.l y xi \, w^(*) xi chevron.r$, replace $w^(*) xi$ by $c xi w^(*)$,
    and then $xi w$ by $c w xi$. The total error is at most $\( 1 + c \) ∥eta∥$,
    while the resulting expression is $c^2 phi.alt \( y w \)$. Taking the supremum over $y$ proves the estimate.
    The last assertion follows from
  $ ∥\( e^(D \/ 2) - e^(s \/ 2) \) w_n xi∥ lt.eq sup_(lr(|u - s|) lt.eq d_n) lr(|e^(u \/ 2) - e^(s \/ 2)|)
    thin ∥w_n xi∥ . $
  ◻
]

#thm([Lemma 3.2.])[
  (Smooth spectral localization).  #emph[Let $f in C_c^oo \( bb(R) \)$, with Fourier convention $f \( u \) =
    integral_(bb(R)) g \( t \) e^(i t u) thin d t$. For $y in M$, the weak integral
$ y_f = integral_(bb(R)) g \( t \) sigma_t \( y \) thin d t $

 belongs to $M$ and satisfies $∥y_f∥ lt.eq ∥g∥_1 ∥y∥$ and $y_f xi = f \( D \) y xi$.
   If $a in M$ and $a xi$ has compact $D$-spectral support, there is $a^flat in M$ such that
#[#set math.equation(numbering: n => "(3.3)")
 $ a xi = xi a^flat . $ <eq:right-multiplier>]

 The same Fourier construction applies to any continuous state-preserving action and its unitary implementation.]
] <mod:localization>

#proof[
  The inverse Fourier transform $g$ is integrable. The bounded weak integral is defined by integration against
    normal functionals, and its operator norm has the stated bound.
    Applying it to $xi$ and using the spectral theorem gives $y_f xi = f \( D \) y xi$.
    This uses no operator norm continuity of the orbit.
  If $K$ is a compact support for $a xi$, choose $f in C_c^oo \( bb(R) \)$ equal to $e^(- u \/ 2)$ on a
    neighborhood of $K$, and put $a^flat = a_f$. Then (3.1) and functional calculus give
  $ xi a^flat = e^(D \/ 2) a^flat xi = e^(D \/ 2) f \( D \) a xi = a xi . $
  All vectors in this computation belong to the domain of $e^(D \/ 2)$;
    in particular the filtered vector has compact spectral support.
    The Fourier argument for another state-preserving action is identical. ◻
]

For the rest of this Section assume $M_phi.alt = bb(C) 1$.
  Let $mu_k$ be uniform probability measure on $\[ - k \, k \]$, for $k in bb(N)$.

#thm([Lemma 3.3.])[
  (Two norm ergodic limits).  #emph[For every $y in M$ and $psi in M_(*)$,
#[#set math.equation(numbering: n => "(3.4)")
 $ integral sigma_t \( y \) xi thin d mu_k \( t \) & arrow.r phi.alt \( y \) xi &  & upright("in ") H \,\
integral psi compose sigma_(- t) thin d mu_k \( t \) & arrow.r
  psi \( 1 \) phi.alt &  & upright("in ") M_(*) . $ <eq:hilbert-mean>]

]
] <mod:means>

#proof[
  The unitary mean ergodic theorem gives a norm limit for the vectors in (3.4).
    The corresponding operator averages have norm at most $∥y∥$.
    For each fixed $u$, translating the interval changes their averages in operator norm by at most
    $lr(|u|) ∥y∥ \/ k$ for all sufficiently large $k$. Every weak operator cluster point is consequently fixed by
    $sigma$, hence scalar. Evaluation under $phi.alt$ identifies it as $phi.alt \( y \) 1$.
    This identifies the Hilbert norm limit and proves (3.4).
  The action on $M_(*)$ is norm continuous on each functional.
    For positive normal functionals this follows from their realization as vector functionals in standard form and
    the strong continuity of $U$; linear decomposition gives the general case.
    The predual averages are therefore Bochner integrals and are contractions. Let
  $ cal(N) = overline("span")^(thin ∥dot.op∥) { rho compose sigma_u - rho : rho in M_(*) \, med u in bb(R) } . $
  Its annihilator in $\( M_(*) \)^(*) = M$ is $M_phi.alt = bb(C) 1$.
    The Hahn–Banach theorem implies $cal(N) = { psi in M_(*) : psi \( 1 \) = 0 }$.
    The averages tend to zero in norm on each generator of $cal(N)$, by the interval boundary estimate,
    and hence on all of $cal(N)$ by contractivity. They fix $phi.alt$.
    Apply this to $psi - psi \( 1 \) phi.alt$ to obtain (3.4). ◻
]

Fix a free ultrafilter $omega$ on $bb(N)$. For a bounded continuous scalar function $f$ define

$ m_t f \( t \) = lim_(k arrow.r omega) integral f \( t \) thin d mu_k \( t \) . $

This positive normalized mean is invariant under translations and under $t mapsto - t$.
  For a bounded continuous $H$-valued function $F$, put

$ ∥F∥_(upright("av")) = #scale(x: 120%, y: 120%)[\(] m_t ∥F \( t \)∥^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $

The triangle inequality follows from the corresponding inequalities for the finite interval integrals.
  Thus this is a seminorm.

#thm([Lemma 3.4.])[
  (Operator averaging).  #emph[For $S in cal(B) \( H \)$, define $P \( S \)$ by
$ chevron.l P \( S \) h \, k chevron.r = m_t chevron.l U_t^(*) S U_t h \, k chevron.r . $

 Then $P$ is a positive unital contraction, $P \( S \)$ commutes with every spectral projection of $D$, and
#[#set math.equation(numbering: n => "(3.5)")
 $ P \( L \( a \) \) = phi.alt \( a \) 1 wide \( a in M \) . $ <eq:scalar-average>]

 In particular,
#[#set math.equation(numbering: n => "(3.6)")
 $ ∥t mapsto S U_t h∥_(upright("av"))^2 = chevron.l P \( S^(*) S \) h \, h chevron.r . $ <eq:quadratic-average>]

]
] <mod:average>

#proof[
  The bounded sesquilinear form defines $P \( S \)$, with $∥P \( S \)∥ lt.eq ∥S∥$.
    Positivity and unitality follow directly from the mean. Translation invariance gives $U_u^(*) P \( S \) U_u =
    P \( S \)$ for every $u$, hence commutation with the spectral projections of $D$.
    For $S = L \( a \)$ the averages and their weak limits belong to the weakly closed algebra $L \( M \)$,
    since $U_t^(*) L \( a \) U_t = L \( sigma_(- t) \( a \) \)$.
    The fixed-point algebra is scalar, and evaluation at $xi$ gives (3.5).
    Equation (3.6) is the definition applied to $S^(*) S$. No normality of $P$ is asserted or needed. ◻
]

== 4 Recovering bounded operators from spectral vectors <sec:recovery>

8 converts a positive averaged quantity on narrow modular spectral bands into a positive quantity on uniformly
  bounded operators. Its proof uses both norm limits in 6: the Hilbert-space limit controls one fourth-moment
  term, and the predual limit controls the other. No uniform operator norm bound is required for the initial
  representatives of the spectral vectors. Randomization, fourth-moment control, truncation,
  and selection of a bounded witness occur together in the tracial spectral-gap argument of Ioana and Vaes
  #cite(label("IoanaVaes2015")) proof of the appendix theorem, pp. 129–130.
  Related fourth-moment control gives equi-integrability in Marrakchi’s binormal-state implementation
  #cite(label("Marrakchi2025")) Section 2, Claim 2.2. We use the fourth-moment and polar-cutoff devices of
  Haagerup and Musat #cite(label("HaagerupMusat2007")) Lemma 2.6 and Remark 2.8,
  with moment bounds supplied by modular orbit averages against the given state.
  The final Fourier localization retains the shrinking spectral band.

#thm([Theorem 4.1.])[
  (Bounded recovery).  #emph[Let $M$ be a von Neumann algebra with a faithful normal state $phi.alt$ such that
    $M_phi.alt = bb(C) 1$. Use the standard-space notation and the fixed mean $m$ of 7.
    Fix $T in cal(B) \( H \)$ and $s in bb(R)$. Suppose that $delta_n > 0$ tends to zero and that $h_n in
    H$ are unit vectors with $D$-spectral support in $\[ s - delta_n \, s + delta_n \]$. If
#[#set math.equation(numbering: n => "(4.1)")
 $ limsup_(n arrow.r oo) m_t ∥T U_t h_n∥^2 > 0 \, $ <eq:recovery-positive>]

 then there are a subsequence $\( n_j \)$, elements $v_j in M$,
   and constants $C_(*) < oo$ and $eta > 0$ such that, for every $j$,
$ ∥v_j∥ lt.eq C_(*) \, wide ∥T v_j xi∥ gt.eq eta \, $

 and $v_j xi$ has $D$-spectral support in $\[ s - 4 delta_(n_j) \, s + 4 delta_(n_j) \]$.]
] <rec:bounded>

#proof[
  We use the same family of Fourier filters to localize the initial bounded approximations and to restore
    localization after polar truncation. Choose $f_0 in C_c^oo \( bb(R) \)$ such that
  $ 0 lt.eq f_0 lt.eq 1 \, wide f_0 = 1 upright(" on ") \[ - 1 \, 1 \] \, wide "supp" f_0 subset \[ - 2 \, 2 \] \, $
  and write $f_0 \( u \) = integral_(bb(R)) g_0 \( t \) e^(i t u) thin d t$, with $g_0$ a Schwartz function.
    For $rho > 0$, set
  $ f_rho \( u \) = f_0 #scale(x: 120%, y: 120%)[\(] \( u - s \) \/ rho #scale(x: 120%, y: 120%)[\)] \, wide
    g_rho \( t \) = rho e^(- i s t) g_0 \( rho t \) . $
  Then $f_rho \( u \) = integral_(bb(R)) g_rho \( t \) e^(i t u) thin d t$ and
  #[#set math.equation(numbering: n => "(4.2)")
   $ ∥g_rho∥_1 = ∥g_0∥_1 = : C_1 quad upright("for every ") rho > 0 . $ <eq:recovery-kernel>]
  By 5, the weak integral
  $ cal(F)_rho \( x \) = integral_(bb(R)) g_rho \( t \) sigma_t \( x \) thin d t in M $
  satisfies
  #[#set math.equation(numbering: n => "(4.3)")
   $ cal(F)_rho \( x \) xi = f_rho \( D \) x xi \, wide ∥cal(F)_rho \( x \)∥ lt.eq C_1 ∥x∥ . $ <eq:recovery-filter>]
  In particular, its vector has spectral support in $\[ s - 2 rho \, s + 2 rho \]$.
  #emph[Approximation by bounded representatives.] By (4.1), after passing to a subsequence and reindexing,
    there is $gamma > 0$ such that
  $ m_t ∥T U_t h_n∥^2 gt.eq 4 gamma wide \( n gt.eq 1 \) . $
  Since $M xi$ is dense in $H$, approximate $h_n$ by $x_n xi$ and apply $f_(delta_n) \( D \)$.
    This multiplier fixes $h_n$ and is a contraction. Thus the vectors $cal(F)_(delta_n) \( x_n \)
    xi$ approximate $h_n$ as closely as desired. Normalize them, obtaining $y_n in M$ with $∥y_n xi∥ =
    1$ and spectral support in $\[ s - d_n \, s + d_n \]$, where $d_n = 2 delta_n$.
    Choose the approximations so that $∥y_n xi - h_n∥ arrow.r 0$ and
  #[#set math.equation(numbering: n => "(4.4)")
   $ m_t ∥T U_t y_n xi∥^2 gt.eq 2 gamma wide \( n gt.eq 1 \) . $ <eq:recovery-defect>]
  This is possible because the averaged seminorm in 7 gives
  $ lr(|∥t mapsto T U_t y_n xi∥_(upright("av")) - ∥t mapsto T U_t h_n∥_(upright("av"))|) lt.eq ∥T∥ ∥y_n xi - h_n∥ . $
  Discard finitely many terms so that $d_n lt.eq 1$. The modular identity in (3.1) gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ phi.alt \( y_n^(*) y_n \) = 1 \, wide phi.alt \( y_n y_n^(*) \) = ∥e^(D \/ 2) y_n xi∥^2 lt.eq
     e^(s + d_n) . $ <eq:recovery-two-masses>]
  There is no asserted uniform bound on $∥y_n∥$.
  #emph[Simultaneous defect and moment bounds.] Fix $n$ for the moment, and write $y = y_n$.
    With $mu_k$ the uniform probability measure on $\[ - k \, k \]$, define
  $ A_k & = integral sigma_t \( y^(*) y \) thin d mu_k \( t \) \, & B_k & =
    integral sigma_t \( y y^(*) \) thin d mu_k \( t \) \,\
psi \( x \) & = phi.alt \( y^(*) x y \) \, & psi_k & = integral psi compose sigma_(- t) thin d mu_k \( t \) . $
  We seek simultaneous control of $phi.alt \( A_k^2 \)$ and $psi_k \( B_k \)$,
    which will bound the fourth moment after discretization. Here $psi$ is a normal state.
    State invariance gives the exact identity
  #[#set math.equation(numbering: n => "(4.6)")
   $ psi_k \( x \) = integral phi.alt #scale(x: 120%, y: 120%)[\(] sigma_t \( y \)^(*) x sigma_t \( y \)
     #scale(x: 120%, y: 120%)[\)] thin d mu_k \( t \) . $ <eq:recovery-functional>]
  By the two ordinary norm limits in 6,
  $ A_k xi arrow.r xi \, wide ∥psi_k - phi.alt∥_(M_(*)) arrow.r 0 . $
  Consequently $phi.alt \( A_k^2 \) = ∥A_k xi∥^2 arrow.r 1$. Although $B_k$ depends on $k$, it satisfies
  $ ∥B_k∥ lt.eq ∥y∥^2 \, wide phi.alt \( B_k \) = phi.alt \( y y^(*) \) lt.eq e^(s + 1) \, $
  and hence
  #[#set math.equation(numbering: n => "(4.7)")
   $ lr(|psi_k \( B_k \) - phi.alt \( B_k \)|) lt.eq ∥psi_k - phi.alt∥_(M_(*)) ∥y∥^2 arrow.r
     0 . $ <eq:recovery-varying-test>]
  All these limits are taken with $n$ fixed. For every sufficiently large $k$ we may impose $phi.alt \( A_k^2 \)
    lt.eq 2$ and $∥psi_k - phi.alt∥_(M_(*)) lt.eq ∥y∥^(- 2)$ simultaneously. It follows that
  #[#set math.equation(numbering: n => "(4.8)")
   $ phi.alt \( A_k^2 \) + psi_k \( B_k \) lt.eq 3 + e^(s + 1) . $ <eq:recovery-continuous-moments>]
  On the other hand, (4.4) and the definition of $m$ imply that the set of integers $k$ for which
  $ integral ∥T sigma_t \( y \) xi∥^2 thin d mu_k \( t \) > 3 / 2 gamma $
  belongs to the fixed free ultrafilter. It therefore meets the cofinite set on which (4.8) holds.
    Choose one such $k$, still for this fixed $n$.
  We next replace this continuous average by a finite probability average. Put $z_t = sigma_t \( y \)$.
    The three scalar functions
  $ t mapsto ∥T z_t xi∥^2 \, wide \( t \, u \) mapsto phi.alt \( z_t^(*) z_t z_u^(*) z_u \) \,
    wide \( t \, u \) mapsto phi.alt \( z_t^(*) z_u z_u^(*) z_t \) $
  are continuous on the relevant compact interval or square.
    Indeed, $t mapsto z_t$ is bounded and strong-star continuous,
    and products on bounded sets preserve this continuity. A common sufficiently fine partition of
    $\[ - k \, k \]$, using its normalized interval lengths as weights,
    therefore approximates all three integrals. The product weights approximate the double integrals defining
    $phi.alt \( A_k^2 \)$ and $psi_k \( B_k \)$. Thus there are finitely many times $t_i$ and weights $p_i gt.eq
    0$, with $sum_i p_i = 1$, such that, writing
  $ z_i = sigma_(t_i) \( y \) \, wide A = sum_i p_i z_i^(*) z_i \, wide B = sum_i p_i z_i z_i^(*) \, $
  we have
  #[#set math.equation(numbering: n => "(4.9)")
   $ sum_i p_i ∥T z_i xi∥^2 gt.eq gamma \, wide phi.alt \( A^2 \) + sum_i p_i phi.alt \( z_i^(*) B z_i \) lt.eq
     C \, wide C := 4 + e^(s + 1) . $ <eq:recovery-finite>]
  The finite averages may depend on $n$; $gamma$ and $C$ do not.
    In particular, no estimate on the rate in (4.7) uniform in $n$ has been used.
  #emph[Randomization and truncation.] For this finite average,
    let $epsilon.alt_i$ be independent random variables uniformly distributed on the complex unit circle, and set
  $ z = sum_i sqrt(p_i) thin epsilon.alt_i z_i . $
  The vector $z xi$ is supported in $\[ s - d_n \, s + d_n \]$. Independence and vanishing first moments give
  $ bb(E) ∥T z xi∥^2 = sum_i p_i ∥T z_i xi∥^2 gt.eq gamma . $
  The following expansion is the Steinhaus variant of the fourth-moment identity in
    #cite(label("HaagerupMusat2007")) equation (2.10) and Remark 2.8, with coefficients $sqrt(p_i) z_i$.
    We include the expansion to keep track of the order of the noncommuting factors. The two surviving pairings give
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E) \[ \( z^(*) z \)^2 \] = A^2 + sum_i p_i z_i^(*) B z_i -
     sum_i p_i^2 \( z_i^(*) z_i \)^2 . $ <eq:recovery-fourth>]
  The last sum subtracts the overlap of the pairings, where all four indices agree.
    Its summands are positive, so (4.9) implies
  #[#set math.equation(numbering: n => "(4.11)")
   $ bb(E) phi.alt \( \( z^(*) z \)^2 \) lt.eq C . $ <eq:recovery-fourth-bound>]
  We next use the functional-calculus truncation underlying #cite(label("HaagerupMusat2007")) Lemma 2.6,
    equations (2.15)–(2.20). For $K > 0$, write $z = u lr(|z|)$ in its polar decomposition and put $z^(\[ K \]) =
    u min \( lr(|z|) \, K \)$. Then $∥z^(\[ K \])∥ lt.eq K$ and
  #[#set math.equation(numbering: n => "(4.12)")
   $ bb(E) ∥\( z - z^(\[ K \]) \) xi∥^2 & = bb(E) phi.alt #scale(x: 120%, y: 120%)[\(] \( lr(|z|) - K \)_(+)^2
     #scale(x: 120%, y: 120%)[\)]\
 & lt.eq K^(- 2) bb(E) phi.alt \( lr(|z|)^4 \) lt.eq C K^(- 2) . $ <eq:recovery-truncation>]
  This controls the vector error on the side required for the bounded operator $T$.
    No estimate for the adjoint truncation error is needed.
  #emph[Restoring the spectral band and selecting realizations.] Define the random element $v =
    cal(F)_(d_n) \( z^(\[ K \]) \) in M$. By (4.3), every realization satisfies
  #[#set math.equation(numbering: n => "(4.13)")
   $ ∥v∥ lt.eq C_1 K \, wide v xi = f_(d_n) \( D \) z^(\[ K \]) xi \, $ <eq:recovery-bounded-output>]
  and $v xi$ is supported in $\[ s - 2 d_n \, s + 2 d_n \]$.
    Since $f_(d_n) \( D \)$ fixes $z xi$ and has norm at most one, (4.12) gives
  $ bb(E) ∥v xi - z xi∥^2 lt.eq C K^(- 2) . $
  The triangle inequality in the Hilbert space of square-integrable random $H$-vectors now yields
  #[#set math.equation(numbering: n => "(4.14)")
   $ #scale(x: 120%, y: 120%)[\(] bb(E) ∥T v xi∥^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) gt.eq sqrt(gamma) -
     frac(∥T∥ sqrt(C), K) . $ <eq:recovery-fixed-cutoff>]
  Fix once and for all
  $ K gt.eq 2 ∥T∥ sqrt(C \/ gamma) . $
  The hypothesis implies $T eq.not 0$, so $K$ can be chosen positive.
    This choice is independent of $n$ and ensures that the left-hand side of (4.14) is at least $sqrt(gamma) \/ 2$.
  To select a realization, note that $z$ depends norm-continuously on the finite phase torus and $z^(\[ K \]) =
    z q_K \( z^(*) z \)$, where
  $ q_K \( r \) = min { 1 \, K \/ sqrt(r) } quad \( r > 0 \) \, wide q_K \( 0 \) = 1 . $
  Since $q_K$ is continuous on $\[ 0 \, oo \)$, continuous functional calculus makes the cutoff norm-continuous.
    The filter $cal(F)_(d_n)$ is bounded and linear, so $∥T v xi∥^2$ is continuous on the compact phase torus.
    It therefore attains a maximum at least its expectation. Choose such a realization $v_n$ for each $n$. Then
  $ ∥v_n∥ lt.eq C_1 K \, wide ∥T v_n xi∥ gt.eq sqrt(gamma) / 2 \, $
  and its spectral support lies in $\[ s - 2 d_n \, s + 2 d_n \] = \[ s - 4 delta_n \, s + 4 delta_n \]$.
    Restoring the subsequence notation proves 8 with $C_(*) = C_1 K$ and $eta = sqrt(gamma) \/ 2$. ◻
]

1 summarizes the construction. The averaging time depends on the initial representative, whereas the moment bound,
  cutoff threshold, and Fourier-kernel norm are independent of the width of its spectral band.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.103cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Spectral vectors#linebreak() $ h_n "rVert" =1$, radius $delta_n$#linebreak()$m_t "TU"_"th"_n "rVert"^2 gt.eq 4 gamma$]]])])
  content((4.65, 0), [#box(width: 4.103cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Operator vectors#linebreak() $y_n xi$, radius $2 delta_n$#linebreak()$ y_n "rVert"$ may grow with $n$]]])])
  content((9.3, 0), [#box(width: 4.103cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Average and randomize#linebreak() $z= sum_i sqrt(p_i) epsilon_i z_i$#linebreak()$bb(E) phi (|z|^4) lt.eq C$]]])])
  content((9.3, -2.35), [#box(width: 4.103cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One polar cutoff#linebreak() $ z^([K]) "rVert" lt.eq K$#linebreak()mean squared error#linebreak()$lt.eq C"/"K^2$]]])])
  content((4.65, -2.35), [#box(width: 4.103cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Restore the spectral band#linebreak() $v= cal(F)_(2 delta_n)(z^([K]))$#linebreak()$ v "rVert" lt.eq C_1K$, radius $4 delta_n$]]])])
  content((0, -2.35), [#box(width: 4.103cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Select a realization#linebreak() $ v_n "rVert" lt.eq C_1K$#linebreak()$ "Tv"_n xi "rVert" gt.eq sqrt( gamma )"/"2$]]])])
  line((2.051, 0), (2.599, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((6.701, 0), (7.249, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((9.3, -0.925), (9.3, -1.425), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((7.249, -2.35), (6.701, -2.35), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((2.599, -2.35), (2.051, -2.35), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
})],
  caption: [Figure 1: The construction in 8, after passing to the subsequence with a positive averaged squared norm. Every band is centered at the fixed modular energy $s$. The polar cutoff need not preserve that band; the next Fourier filter restores it with radius $4 delta_n$. The constants $C$, $K$, and $C_1$ are independent of $n$. The cutoff error is averaged over the circle phases. ],
) <fig:bounded-recovery>

== 5 Spectral rigidity <sec:rigidity>

We now prove 2. Throughout this Section, assume its hypotheses and retain the modular notation and the symmetric
  mean from 7. In particular, $M_phi.alt = bb(C) 1$. We use no ergodicity assumption on $b$.

=== 5.1 From bounded recovery to an interval estimate <from-bounded-recovery-to-an-interval-estimate>

When $a xi = xi a^flat$, the identity $w a xi = R \( a^flat \) w xi$ for $w in M$ writes the intertwining defect,
  at fixed $s$, as a bounded operator applied to $w xi$.

#thm([Lemma 5.1.])[
  (Estimate at a spectral point).  #emph[Let $a \, a^flat in M$ satisfy $a xi = xi a^flat$. For $s in bb(R)$, set
$ T_s = R \( a^flat \) - L \( b_s \( a \) \) in cal(B) \( H \) . $

 If $h_n in H$ are unit vectors with $D$-spectral supports contained in $\[ s - d_n \, s + d_n \]$,
   where $d_n > 0$ and $d_n arrow.r 0$, then
#[#set math.equation(numbering: n => "(5.1)")
 $ ∥t mapsto T_s U_t h_n∥_(upright("av")) arrow.r 0 . $ <eq:point-estimate>]

]
] <spec:point>

#proof[
  If the conclusion fails, 8, applied to the fixed operator $T_s$,
    gives a uniformly bounded sequence $v_n in M$ such that the $D$-spectral supports of $v_n xi$ shrink to $s$ and
  $ ∥T_s v_n xi∥ gt.eq eta > 0 wide upright("for every ") n . $
  By 4,
  $ ∥phi.alt v_n - e^s v_n phi.alt∥_(M_(*)) arrow.r 0 . $
  The intertwining hypothesis (1.1) therefore gives $\( v_n a - b_s \( a \) v_n \) xi arrow.r 0$.
    Since left and right multiplication commute,
  $ T_s v_n xi = v_n xi a^flat - b_s \( a \) v_n xi = \( v_n a - b_s \( a \) v_n \) xi \, $
  a contradiction. ◻
]

The point estimate supplies no uniform rate in $s$. To pass to an interval,
  we use the commutation of the averaged quadratic form with the spectral projections of $D$.

#thm([Lemma 5.2.])[
  (Estimate on an interval).  #emph[Let $a \, a^flat in M$ satisfy $a xi = xi a^flat$.
    For every nonempty compact interval $I subset bb(R)$, every $c in bb(C)$, and every $h in E_D \( I \) H$,
#[#set math.equation(numbering: n => "(5.2)")
 $ ∥t mapsto \( R \( a^flat \) - c L \( a \) \) U_t h∥_(upright("av")) lt.eq ∥h∥
   sup_(s in I) ∥\( b_s \( a \) - c a \) xi∥ . $ <eq:interval-estimate>]

]
] <spec:interval>

#proof[
  Put
  $ S = R \( a^flat \) - c L \( a \) \, wide C = P \( S^(*) S \) \, wide B =
    sup_(s in I) ∥\( b_s \( a \) - c a \) xi∥ . $
  The number $B$ is finite, and 7 gives
  $ ∥t mapsto S U_t h∥_(upright("av"))^2 = chevron.l C h \, h chevron.r . $
  Suppose that the asserted estimate fails. By homogeneity there is a unit vector $h in E_D \( I \) H$ with
  $ chevron.l C h \, h chevron.r = B^2 + epsilon wide \( epsilon > 0 \) . $
  For each positive integer $n$, partition $I$ into finitely many disjoint Borel intervals $J$ of diameter at most
    $1 \/ n$. Since $C$ commutes with the spectral projections of $D$,
  $ chevron.l C h \, h chevron.r = sum_J chevron.l C E_D \( J \) h \, E_D \( J \) h chevron.r \, wide
    sum_J ∥E_D \( J \) h∥^2 = 1 . $
  Consequently, one nonzero spectral piece, after normalization,
    gives a unit vector $h_n$ supported in $overline(J_n)$ such that
  #[#set math.equation(numbering: n => "(5.3)")
   $ chevron.l C h_n \, h_n chevron.r gt.eq B^2 + epsilon . $ <eq:partition-gap>]
  By compactness of $I$, after passing to a subsequence these supports lie in intervals shrinking to a single
    point $s in I$. This also covers a singleton interval $I$.
  Write $z = b_s \( a \) - c a$, so that $S = T_s + L \( z \)$.
    By 9, $∥t mapsto T_s U_t h_n∥_(upright("av")) arrow.r 0$. On the other hand, 7 gives the exact identity
  $ ∥t mapsto L \( z \) U_t h_n∥_(upright("av"))^2 = chevron.l P \( L \( z^(*) z \) \) h_n \, h_n chevron.r =
    phi.alt \( z^(*) z \) lt.eq B^2 . $
  The triangle inequality now yields $limsup_n ∥t mapsto S U_t h_n∥_(upright("av")) lt.eq B$, contrary to (5.3). ◻
]

=== 5.2 The joint spectral pairing <the-joint-spectral-pairing>

State preservation gives a unitary implementation

$ V_s \( a xi \) = b_s \( a \) xi wide \( a in M \) . $

It is strongly continuous by the $u$-continuity of $b$: for $a in M$,

$ ∥V_s \( a xi \) - a xi∥^2 = 2 phi.alt \( a^(*) a \) - 2 "Re" phi.alt \( a^(*) b_s \( a \) \) arrow.r
  0 wide \( s arrow.r 0 \) \, $

and density extends this continuity to $H$. Since $b_s$ preserves $phi.alt$,
  it commutes with the modular automorphism group. Thus $V_s U_t = U_t V_s$ for all $s \, t$.
  Write $V_s = e^(i s Q)$. The self-adjoint operators $D$ and $Q$ strongly commute;
  let $E$ be their joint spectral resolution and let $cal(S) subset bb(R)^2$ be its closed support.

The joint spectral measure is concentrated on $cal(S)$. Indeed,
  its complement is a union of open sets with zero spectral projection,
  and the countable base of $bb(R)^2$ reduces this to a countable union.
  Hence $E \( cal(S) \) = 1$, without any separability assumption on $H$.

#thm([Lemma 5.3.])[
  (Joint spectral pairing).  #emph[For every $\( r \, p \) \, \( q \, ell \) in cal(S)$,
#[#set math.equation(numbering: n => "(5.4)")
 $ exp #scale(x: 120%, y: 120%)[\(] i \( r ell + q p \) #scale(x: 120%, y: 120%)[\)] = 1 . $ <eq:spectral-pairing>]

]
] <spec:pairing>

#proof[
  Fix $delta > 0$ and write $I_v = \[ v - delta \, v + delta \]$. We first choose nonzero $x \, a in M$ such that
  $ x xi in E \( I_r times I_p \) H \, wide a xi in E \( I_q times I_ell \) H . $
  Here is the justification for this bounded localization. Choose nonnegative smooth functions $f \,
    g$ supported in the interiors of $I_r \, I_p$ and equal to one on smaller neighborhoods of $r \, p$.
    The spectral projection of the resulting smaller rectangle is nonzero by the definition of $cal(S)$.
    Consequently, $f \( D \) g \( Q \) eq.not 0$. Density of $M xi$ supplies $y in M$ with $f \( D \) g \( Q \) y
    xi eq.not 0$. Fourier integration along $b$ realizes $g \( Q \) y xi$ as a vector in $M xi$:
    if $g \( u \) = integral_(bb(R)) hat(g) \( t \) e^(i t u) thin d t$,
    use the bounded weak integral $integral_(bb(R)) hat(g) \( t \) b_t \( y \) thin d t$.
    The subsequent filter $f \( D \)$ also preserves $M xi$ by 5.
    Their composition therefore gives the required $x$. The construction of $a$ is identical.
    No bound uniform in $delta$ on the resulting operators is needed.
  Both vectors have compact modular spectral support. By 5, choose $x^flat \, a^flat in M$ with
  $ x xi = xi x^flat \, wide a xi = xi a^flat . $
  Set
  $ c = e^(i r ell) \, wide d = e^(i q p) \, wide H_0 = ∥a xi∥ ∥x xi∥ > 0 \, $
  and consider the bounded continuous vector functions
  $ F \( t \) = sigma_t \( x \) a xi \, wide G \( t \) = a sigma_t \( x \) xi . $
  Since
  $ F \( t \) - c G \( t \) = \( R \( a^flat \) - c L \( a \) \) U_t \( x xi \) \, $
  10 and the $Q$-spectral support of $a xi$ give
  #[#set math.equation(numbering: n => "(5.5)")
   $ ∥F - c G∥_(upright("av")) & lt.eq ∥x xi∥ sup_(s in I_r) ∥\( b_s \( a \) - c a \) xi∥\
 & lt.eq H_0 sup_(s in I_r\
u in I_ell) lr(|e^(i s u) - c|) . $ <eq:first-product-estimate>]
  Interchanging $a$ and $x$ in the same argument yields
  $ ∥t mapsto sigma_t \( a \) x xi - d x sigma_t \( a \) xi∥_(upright("av")) lt.eq H_0 sup_(s in I_q\
u in I_p) lr(|e^(i s u) - d|) . $
  The pointwise identity
  #[#set math.equation(numbering: n => "(5.6)")
   $ U_t #scale(x: 120%, y: 120%)[\(] sigma_(- t) \( a \) x xi -
     d x sigma_(- t) \( a \) xi #scale(x: 120%, y: 120%)[\)] = G \( t \) - d F \( t \) $ <eq:time-reversal>]
  and reflection invariance of the mean identify the seminorm on the left with $∥G - d F∥_(upright("av"))$.
    In particular, the phase is still $d$: the unitary $U_t$ is complex linear. We have proved
  #[#set math.equation(numbering: n => "(5.7)")
   $ ∥G - d F∥_(upright("av")) lt.eq H_0 sup_(s in I_q\
u in I_p) lr(|e^(i s u) - d|) . $ <eq:second-product-estimate>]
  The averaged norm of $F$ has the same factor $H_0$ as the two error bounds. By reflection invariance and 7,
  #[#set math.equation(numbering: n => "(5.8)")
   $ ∥F∥_(upright("av"))^2 & = m_t chevron.l L \( sigma_t \( x^(*) x \) \) a xi \, a xi chevron.r\
 & = chevron.l P \( L \( x^(*) x \) \) a xi \, a xi chevron.r = phi.alt \( x^(*) x \) phi.alt \( a^(*) a \) =
   H_0^2 . $ <eq:product-norm>]
  Using $lr(|c|) = 1$ and
  $ \( 1 - c d \) F = \( F - c G \) + c \( G - d F \) \, $
  combine (5.5) and (5.7), and divide by $H_0$, to obtain
  $ lr(|1 - c d|) lt.eq sup_(s in I_r\
u in I_ell) lr(|e^(i s u) - e^(i r ell)|) + sup_(s in I_q\
u in I_p) lr(|e^(i s u) - e^(i q p)|) . $
  The right side tends to zero as $delta arrow.r 0$. For example,
    the first supremum is at most $delta \( lr(|r|) + lr(|ell|) \) + delta^2$, by $lr(|e^(i v) - e^(i w)|) lt.eq
    lr(|v - w|)$ for real $v \, w$. The second has the analogous bound.
    Since $c$ and $d$ depend only on the original support points, this proves (5.4). ◻
]

=== 5.3 Conclusion of the proof <conclusion-of-the-proof>

We first record the restriction that a scalar modular centralizer imposes on modular eigenvalues.
  This is the weak-mixing argument of Marrakchi and Vaes #cite(label("MarrakchiVaes2024")) Lemma 2.1;
  we include the needed conclusion and its proof in our spectral notation.
  The bounded operator extraction is useful because a spectral projection on $H$ need not itself preserve $M xi$.

#thm([Lemma 5.4.])[
  (Modular eigenvalues).  #emph[If $M_phi.alt = bb(C) 1$, then $D$ has no nonzero eigenvalue.
    If, in addition, $D$ has pure point spectrum, then $M = bb(C) 1$.]
] <spec:eigenvalues>

#proof[
  Suppose $E_D \( { r } \) eq.not 0$. Choose $x in M$ such that $eta = E_D \( { r } \) x xi eq.not 0$,
    using density of $M xi$. Let
  $ y_k = integral_(bb(R)) e^(- i r t) sigma_t \( x \) thin d mu_k \( t \) \, $
  where $mu_k$ is uniform probability measure on $\[ - k \, k \]$.
    These bounded weak integrals satisfy $∥y_k∥ lt.eq ∥x∥$. The Hilbert-space mean ergodic theorem for $t mapsto
    e^(- i r t) U_t$ gives
  $ y_k xi arrow.r eta wide upright("in ") H . $
  Take a weak operator convergent subnet of $\( y_k \)$, with limit $y in M$.
    Its vector limit is $y xi = eta eq.not 0$. Therefore, for every $t in bb(R)$,
  $ sigma_t \( y \) xi = U_t y xi = e^(i r t) y xi . $
  Since $xi$ is separating, $sigma_t \( y \) = e^(i r t) y$.
  It follows that $y^(*) y \, y y^(*) in M_phi.alt = bb(C) 1$.
    Their scalar values coincide because $∥y^(*) y∥ = ∥y y^(*)∥$, and are strictly positive.
    Thus $y$ is a nonzero scalar multiple of a unitary, and $phi.alt \( y^(*) y \) = phi.alt \( y y^(*) \) > 0$.
    The modular identity (3.1) now gives
  $ phi.alt \( y y^(*) \) = ∥xi y∥^2 = ∥e^(D \/ 2) y xi∥^2 = e^r ∥y xi∥^2 = e^r phi.alt \( y^(*) y \) . $
  Hence $r = 0$. If $D$ has pure point spectrum, all of $H$ is consequently its zero eigenspace, so $D = 0$.
    Then the modular action is trivial and $M = M_phi.alt = bb(C) 1$. ◻
]

#proof[
  By 11, the symmetric bilinear form
  $ frak(b) \( \( r \, p \) \, \( q \, ell \) \) = r ell + q p $
  takes values in $2 pi bb(Z)$ on every pair of points of $cal(S)$.
    We claim that $cal(S)$ is countable or is contained in a coordinate axis.
  If $cal(S)$ contains linearly independent vectors $v_1 \, v_2$, the map
  $ z mapsto #scale(x: 120%, y: 120%)[\(] frak(b) \( v_1 \, z \) \,
    frak(b) \( v_2 \, z \) #scale(x: 120%, y: 120%)[\)] $
  is an invertible real linear map on $bb(R)^2$, since the form is nondegenerate and $v_1 \, v_2$ are independent.
    It sends $cal(S)$ into the countable set $\( 2 pi bb(Z) \)^2$, proving countability.
    Otherwise $cal(S)$ is contained in a line through the origin.
    If this line is not a coordinate axis, write its points as $t \( alpha \, beta \)$ with $alpha beta eq.not 0$.
    Pairing each point with itself gives
  $ alpha beta t^2 in pi bb(Z) . $
  There are at most two real values of $t$ for each integer, again proving countability.
    The zero-dimensional case is contained in both axes. This proves the claim.
  If $cal(S)$ is countable, its spectral projections at singletons sum strongly to $1$, because $E \( cal(S) \) =
    1$. Each such projection has range in an eigenspace of $D$, so $D$ has pure point spectrum.
    By 12, $M = bb(C) 1$, and $b$ is trivial.
  If instead $cal(S) subset { 0 } times bb(R)$, then $D = 0$, again giving $M = M_phi.alt =
    bb(C) 1$ and triviality of $b$. In the remaining case $cal(S) subset bb(R) times { 0 }$, we have $Q = 0$.
    Thus $V_s = 1$ for every $s$, and
  $ b_s \( a \) xi = V_s \( a xi \) = a xi wide \( a in M \) . $
  Separation by $xi$ gives $b_s \( a \) = a$. In all cases $b$ is the trivial action, as asserted. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
