#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Weak Hessian bounds along every geodesic in RCD spaces]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

On a smooth Riemannian manifold, an upper bound for the Hessian of a function bounds its second derivative along
  every geodesic. The same question is subtler when the function has only a distributional Hessian.
  A weak inequality is tested against the reference measure,
  whereas a prescribed geodesic can lie in a set of measure zero.
  The goal of this paper is to pass from such a weak inequality to a bound on every minimizing geodesic in a
  finite-dimensional $upright("RCD")$ space.

We work on a complete separable metric measure space $\( M \, d \, m \)$ with full support and measure finite on
  bounded sets. We use $upright("RCD") \( K \, N \)$ to mean the unreduced curvature-dimension condition
  $upright("CD") \( K \, N \)$, together with quadratic Cheeger energy.
  The parameters satisfy $K in bb(R)$ and $1 < N < oo$. The Laplacian is the nonpositive $L^2$ generator:

$ integral_M chevron.l nabla u \, nabla v chevron.r thin upright(d) m = -
  integral_M \( Delta u \) v thin upright(d) m . $

Its domain $D \( Delta \)$ is contained in $W^(1 \, 2) \( M \)$.
  Write $Gamma \( u \, v \) = chevron.l nabla u \, nabla v chevron.r$ and $Gamma \( u \) = Gamma \( u \, u \)$.
  Our global test class is

#[#set math.equation(numbering: n => "(1.1)")
 $ "Test" \( M \) = {g in D \( Delta \) : g upright(" has a bounded globally Lipschitz representative") \,\
Delta g in W^(1 \, 2) \( M \)} . $ <eq:test-class>]

The second-order $upright("RCD")$ calculus assigns an $L^2$ Hessian to a test function and gives $nabla_(nabla g)
  nabla g = nabla \( Gamma \( g \) \/ 2 \)$ #cite(label("Gigli2018")).
  For $F in W_(upright("loc"))^(1 \, 2) \( M \)$, a compactly supported $g in "Test" \( M \)$, $Y = nabla g$,
  and $h in "Lip"_c \( M \)$, define its weak Hessian evaluation by

#[#set math.equation(numbering: n => "(1.2)")
 $ H_F \( Y \, Y \) \( h \) = - integral_M "div" \( h Y \) thin chevron.l nabla F \,
   Y chevron.r thin upright(d) m - integral_M h thin chevron.l nabla F \,
   nabla_Y Y chevron.r thin upright(d) m . $ <eq:weak-hessian>]

Here $"div" \( h Y \) = Gamma \( h \, g \) + h Delta g$, and both integrals are finite:
  the relevant derivatives are locally $L^2$, and $h \, Y$ are bounded with compact support.
  This agrees with the usual $L^2$ Hessian when $F in D \( Delta \)$.
  The definition itself requires only first derivatives of $F$.

#thm([Theorem 1.1.])[
  (Weak Hessian bounds along every geodesic).  #emph[Let $\( M \, d \, m \)$ be a full-support
    $upright("RCD") \( K \, N \)$ space, where $K in bb(R)$ and $1 < N < oo$.
    Let $F : M arrow.r bb(R)$ be bounded and globally Lipschitz, and let $G : M arrow.r
    bb(R)$ be bounded and continuous. Suppose that for every compactly supported $g in
    "Test" \( M \)$ and every nonnegative $h in "Lip"_c \( M \)$,
#[#set math.equation(numbering: n => "(1.3)")
 $ H_F \( nabla g \, nabla g \) \( h \) lt.eq integral_M h G Gamma \( g \) thin upright(d) m .
   $ <weight:hessian-assumption>]

 Then every constant-speed minimizing geodesic $sigma : \[ 0 \, 1 \] arrow.r M$, of length $ell$, satisfies
#[#set math.equation(numbering: n => "(1.4)")
 $ \( F compose sigma \)'' lt.eq ell^2 G compose sigma wide
   upright("in distributions on ") \( 0 \, 1 \) . $ <weight:curve-hessian>]

]
] <weight:every-geodesic>

Thus, for every nonnegative $phi in C_c^oo \( 0 \, 1 \)$, the conclusion means

$ integral_0^1 F \( sigma_t \) phi'' \( t \) thin upright(d) t lt.eq
  ell^2 integral_0^1 G \( sigma_t \) phi \( t \) thin upright(d) t . $

For constant $G = c$, it says that $t mapsto F \( sigma_t \) - c ell^2 t^2 \/ 2$ is concave.
  The ambient reference measure can have infinite total mass:
  bounded Lipschitz $F$ is locally Sobolev, and no global $L^2 \( m \)$ condition on $F$ is needed.

=== 1.1 Background and the analytic obstacle <background-and-the-analytic-obstacle>

The differential calculus of $upright("RCD")$ spaces makes weak gradients,
  Hessians and integration by parts available without a smooth atlas #cite(label("Gigli2018")).
  Savaré’s self-improvement of the Bakry–Émery condition supplies a measure-valued Bochner calculus and the
  multiplier properties used below #cite(label("Savare2014")).
  Ambrosio–Gigli–Savaré identify the corresponding constant Bakry–Émery bounds with Riemannian curvature-dimension
  bounds #cite(label("AGS2015")); Braun–Habermann–Sturm develop the analogous variable-curvature equivalences
  #cite(label("BHS2021")).

Changes of measure and large-parameter entropy limits already play an important role in Hessian-to-convexity
  arguments. Ketterer uses an exponential weight and a scaling limit under a Hessian assumption that includes
  Sobolev regularity of gradient pairings #cite(label("Ketterer2015Obata")) Theorem 7.1 and its proof.
  Sturm develops a vanishing-entropy argument for semiconvex functions #cite(label("Sturm2018")) Lemmas 1 and 2.
  Particularly close to our transport step is Han’s proof of infinitesimal-to-weak convexity:
  he applies entropy convexity for $e^(- a u) m$, divides by $a$,
  and lets $a$ tend to infinity #cite(label("Han2018Monotonicity")) Theorem 3.13, Equation (3.6).
  His hypotheses include local second-order Sobolev regularity of $u$.
  The work below establishes the measure-change step under the distributional hypothesis (1.3) and retains the
  spatially varying bound $G$.

Brena–Gigli study fine measure representations of weak Hessians and discuss the passage from a weak Hessian bound
  to geodesic convexity #cite(label("BrenaGigli2024")) Remarks 2.3 and 2.4.
  In particular, their Remark 2.4 proposes using a change of measure and a weak Bochner inequality,
  and identifies the regularity needed to justify the approximation in that argument.
  This is a close antecedent of the method here. Under our bounded Lipschitz hypotheses,
  we prove the multiplier regularity needed for the measure-change argument by a resolvent contraction for the
  original heat semigroup.

For bounded globally Lipschitz $V$, the change of measure $m_V = e^V m$ preserves the $L^2$ generator domain,
  but it need not preserve the test class. Its generator has the drift term $Delta_V u = Delta u +
  Gamma \( V \, u \)$; a Lipschitz $V$ does not ensure that $Gamma \( V \, u \)$ is Sobolev.
  The proof therefore closes the weighted Bochner inequality in the common generator graph domain before applying
  any curvature-dimension equivalence. The example in Remark 5 makes this regularity issue explicit.

With Laplacian-domain regularity, Kapovitch–Ketterer also pass from an $L^2$-Hessian bound to a geodesic convexity
  inequality by approximating point endpoints with measures #cite(label("KapovitchKetterer2020")) Theorem 4.7.
  The final passage to a prescribed geodesic uses Deng’s nonbranching theorem for finite-dimensional
  $upright("RCD") \( K \, N \)$ spaces #cite(label("Deng2020")) Theorem 1.3.
  It makes every strict interior subsegment of that geodesic the unique minimizer between its endpoints.
  This metric fact allows entropy inequalities for concentrating measures to recover the chosen subsegment,
  including subsegments invisible to an almost-everywhere assertion about paths.

=== 1.2 Proof structure <proof-structure>

The proof has two stages. First fix $lambda > 0$ and change the measure to $m_lambda = e^(lambda F) m$.
  The weak Hessian bound implies a weighted Bochner inequality with curvature $K - lambda G$.
  A resolvent estimate gives Lipschitz regularity of the weighted multipliers,
  and the common graph core makes the Bochner inequality valid on the actual weighted generator domain.
  The constant and variable curvature-dimension equivalences then yield $upright("CD") \( K - lambda G \, oo \)$.

Second, fix a strict subsegment of the geodesic and approximate its endpoints by normalized measures on small
  balls. All transport geodesics between these shrinking supports converge to that unique subsegment.
  The identity for Boltzmann entropy

$ "Ent"_(m_lambda) \( mu \) = "Ent"_m \( mu \) - lambda integral F thin upright(d) mu $

then turns the variable-curvature inequality into a lower bound for $F$ above its endpoint chord,
  with the Green-kernel correction determined by $G$. Choosing $lambda$ to dominate the endpoint entropies removes
  the remaining entropy term. Applying this bound on every strict subinterval proves the distributional inequality.

Section 2 gives the common calculus and approximation facts.
  Section 3 establishes the weighted generator and resolvent estimates.
  Section 4 proves the variable curvature-dimension bound, and Section 5 completes the localization argument.

== 2 Test functions, approximation and Bochner measures <sec:preliminaries>

This section records the original-space calculus needed to change measure.
  The key points are a compact core for the Laplacian and the admissibility of Lipschitz multipliers in the
  Bochner inequality. All statements concern a full-support $upright("RCD") \( K \, N \)$ space with $1 < N < oo$.
  They do not involve a weighted curvature bound.

=== 2.1 A compact core and local approximation <a-compact-core-and-local-approximation>

Besides the class $"Test" \( M \)$ in (1.1), write

$ "Test"^oo \( M \) = { g in "Test" \( M \) : Delta g in L^oo \( M \) } . $

The superscript denotes a bounded Laplacian. Both test classes are algebras.
  Test functions have $L^2$ Hessians, and the product rule gives $Gamma \( g \) in W^(1 \, 2)$ for $g in "Test"$.
  The connection is metric-compatible and torsion-free, with $nabla_(nabla g) nabla g =
  nabla \( Gamma \( g \) \/ 2 \)$ #cite(label("Gigli2018")) #cite(label("Savare2014")).
  We denote the $L^2$ Hessian by $H_g$. The graph norm of $Delta$ is $parallel g parallel_2 +
  parallel Delta g parallel_2$.

#thm([Lemma 2.1.])[
  (Cutoffs and approximation).  #emph[The following approximations are available.]
  + #emph[For a compact set $E$ in an open set $U$, there is $chi in "Test"^oo$ with $0 lt.eq chi lt.eq 1$,
    equal to one on a neighborhood of $E$, and compactly supported in $U$.
    For a fixed basepoint $o in M$, there are also exhausting cutoffs $chi_R in "Test"^oo$,
    equal to one on $B_R \( o \)$, supported in $B_(R + 1) \( o \)$,
    whose gradient and Laplacian bounds are independent of $R$.]
  + #emph[For $g in D \( Delta \)$,
#[#set math.equation(numbering: n => "(2.1)")
 $ parallel H_g parallel_2^2 lt.eq parallel Delta g parallel_2^2 + max { - K \,
   0 } parallel nabla g parallel_2^2 . $ <eq:pre-hessian-estimate>]

 Compactly supported functions in $"Test"^oo$ form a core for $Delta$.]
  + #emph[On a fixed compact region, a function $g in "Test"$ can be approximated by compactly supported $g_j in
    "Test"^oo$ with uniformly bounded gradients, with
$ g_j arrow.r g \, wide nabla g_j arrow.r nabla g \, wide Delta g_j arrow.r Delta g \, wide H_(g_j) arrow.r
  H_g quad upright("strongly in ") L^2 $

 on that region.]
  + #emph[A compactly supported Lipschitz function $xi$ can be approximated by compactly supported test functions
    $xi_j$ with a common compact support and a common Lipschitz bound, uniformly and strongly in $W^(1 \, 2)$.
    If $xi gt.eq 0$, the approximants may be chosen nonnegative.]
] <pre:approximation>

#proof[
  The good-cutoff construction and the integrated Bochner estimate give (i) and (2.1);
    see #cite(label("GigliTamanini2021")) Appendix A, Lemma A.2 and Equation (A.13).
    For the local version of the cutoff construction one uses finitely many small good cutoffs inside $U$,
    and a smooth truncation of their sum. This keeps the Laplacian bounded and Sobolev by the test algebra and
    chain rules.
  Let $P_t$ denote the heat semigroup. For $h in L^2 ∩ L^oo$,
    positive-time regularization gives $P_t h in "Test"^oo$ #cite(label("GigliTamanini2021")) Appendix A,
    Equation (A.7). Spectral calculus and density of bounded $L^2$ data show that these regularizations form a
    core. For each such regularization $h$,
  $ Delta \( chi_R h \) = chi_R Delta h + h Delta chi_R + 2 chevron.l nabla chi_R \, nabla h chevron.r . $
  The uniform cutoff bounds and the $L^2$ tails imply convergence to $Delta h$ in $L^2$,
    as well as convergence of the functions and gradients. This proves the compact-core assertion.
  For (iii), choose nested cutoffs $chi \, zeta$ such that $chi = 1$ near the region in question and $zeta =
    1$ near $"supp" chi$. Put
  $ g_t = chi P_t \( zeta g \) . $
  The function $zeta g$ lies in $"Test"$. The product rule,
    spectral continuity and the fixed cutoff bounds give convergence of $g_t$ to $chi zeta
    g$ in the Laplacian graph norm. The Bakry gradient estimate gives
  $ parallel nabla g_t parallel_oo lt.eq parallel chi parallel_oo e^(- K t) parallel nabla \( zeta g \)
    parallel_oo + parallel nabla chi parallel_oo parallel zeta g parallel_oo . $
  Apply (2.1) to $g_t - chi zeta g$ to obtain strong Hessian convergence.
    Since $chi zeta g = g$ near the region, (iii) follows.
  For (iv), use $xi_t = chi P_t xi$, with an outer cutoff $chi = 1$ near $"supp" xi$.
    The heat semigroup converges strongly in $W^(1 \, 2)$; the uniform Lipschitz estimate and the small-time
    heat-kernel moment bound give uniform convergence on the common compact support.
    The cutoff product gives the same conclusions for $xi_t$, and positivity is preserved. ◻
]

The compact core in Lemma 2 is constructed using only the original heat flow.
  It will therefore remain available when we compare the two generator domains in Section 3.

=== 2.2 Weak Hessians and admissible Bochner multipliers <weak-hessians-and-admissible-bochner-multipliers>

The weak Hessian in (1.2) is continuous under weak local $W^(1 \, 2)$ convergence of $F$,
  with the test gradient and weight fixed. For $F in D \( Delta \)$,
  the integration-by-parts formula for its $L^2$ Hessian identifies it with that tensor.
  An upper bound for $H_F \( Y \, Y \)$ means an inequality on every nonnegative compactly supported Lipschitz
  weight; it does not presuppose an $L^2$ Hessian for $F$.

The original test class in (1.1) is contained in Savaré’s class $bb(D)_oo$,
  which requires $Delta g in W^(1 \, 2)$ but not a bounded Laplacian #cite(label("Savare2014")) Equation (3.4).
  His measure-valued Bochner calculus #cite(label("Savare2014")) Lemma 3.2 and Equations (3.7)–(3.9),
  together with the Hessian-square estimate #cite(label("Gigli2018")) Theorem 3.3.8, gives

#[#set math.equation(numbering: n => "(2.2)")
 $ Gamma_2 \( g \) := Delta #scale(x: 120%, y: 120%)[\(] Gamma \( g \) \/ 2 #scale(x: 120%, y: 120%)[\)] -
   Gamma \( g \, Delta g \) thin m gt.eq #scale(x: 120%, y: 120%)[\(] K Gamma \( g \) + \| H_g \|^2
   #scale(x: 120%, y: 120%)[\)] m . $ <eq:bochner-hessian>]

The first Laplacian in this expression is measure-valued.
  The associated nonnegative Bochner remainder is locally finite and does not charge sets of zero $2$-capacity. Here

$ "Cap"_2 \( E \) = inf_(U supset E\
U med upright("open")) med inf_(v in W^(1 \, 2) \( M \)\
v gt.eq 1 med m upright("-a.e. on ") U) integral_M #scale(x: 120%, y: 120%)[\(] v^2 + \| nabla v \|^2
  #scale(x: 120%, y: 120%)[\)] thin upright(d) m . $

Sobolev multipliers are evaluated using their quasi-continuous representatives,
  which are defined outside a set of zero capacity.

In particular, a nonnegative compactly supported Lipschitz multiplier is admissible in (2.2).
  Indeed, approximate it by the nonnegative test functions in Lemma 2(iv).
  Strong $W^(1 \, 2)$ convergence gives, along a subsequence, convergence outside a set of zero capacity.
  The approximants have a common bound and compact support,
  so dominated convergence applies against the fixed local Bochner measure.
  In the integration by parts, strong convergence of the multiplier gradients pairs with $nabla Gamma \( g \) in
  L^2$. This gives the same identity and inequality for the Lipschitz multiplier.

=== 2.3 Metric and heat-flow facts <metric-and-heat-flow-facts>

A finite-dimensional full-support $upright("RCD")$ space is proper and geodesic,
  has positive finite measure on every nonempty bounded ball, and has the Sobolev-to-Lipschitz property.
  In particular, a Sobolev function with essentially bounded weak gradient has a Lipschitz representative,
  with Lipschitz constant bounded by that gradient bound. Bishop–Gromov volume control implies Gaussian volume
  growth: for a fixed basepoint $o$, there is a constant $C > 0$ such that $m \( B_r \( o \) \) lt.eq
  C exp \( C r^2 \)$ for $r gt.eq 1$. These properties are unchanged under bounded equivalence of the measure,
  except that a weighted curvature bound still requires proof.

The original heat semigroup $P_t$ is Markovian and strongly continuous on $W^(1 \, 2)$.
  Its Bakry gradient and reverse-Poincaré estimates give, for bounded data and positive times,
  the bounds used in the proof of Lemma 3. We use the standard estimates in #cite(label("Savare2014"))
  #cite(label("AGS2015")); the finite-dimensional heat regularity and cutoff statements used above are collected
  in #cite(label("GigliTamanini2021")) Appendix A.

== 3 Bounded changes of measure and the generator domain <sec:drift>

Our first task is to control the weighted generator before assigning any curvature bound to the weighted space.
  A bounded Lipschitz weight preserves weak gradients and the generator domain.
  The less immediate point is that bounded functions with bounded weighted Laplacian are Lipschitz;
  the resolvent argument below supplies this regularity from the original heat flow.

#thm([Lemma 3.1.])[
  (Bounded drift).  #emph[Let $\( M \, d \, m \)$ be a full-support $upright("RCD") \( K \, N \)$ space,
    with $1 < N < oo$, and let $V$ be bounded and globally Lipschitz.
    Set $m_V = e^V m$, and let $Delta_V$ be the generator of the Cheeger energy for $m_V$,
    with the nonpositive sign convention. The Sobolev spaces and their weak gradients agree, and
#[#set math.equation(numbering: n => "(3.1)")
 $ D \( Delta_V \) = D \( Delta \) \, wide Delta_V u = Delta u + Gamma \( V \, u \) . $ <weight:generator>]

 The two generator graph norms are equivalent. Moreover,
#[#set math.equation(numbering: n => "(3.2)")
 $ xi in D \( Delta_V \) \, quad xi \, Delta_V xi in L^oo quad arrow.r.double quad
   xi upright(" has a globally Lipschitz representative") . $ <weight:multiplier-class>]

]
] <weight:resolvent>

#proof[
  Since $e^V$ is bounded above and below by positive constants,
    the classes of test plans defining weak upper gradients agree:
    a compression bound for one measure gives a compression bound for the other.
    Thus the weak gradients agree, and the two $W^(1 \, 2)$ norms are equivalent.
    In particular, the weighted Cheeger energy is quadratic. Multiplication by $e^V$ or $e^(- V)$ preserves
    $W^(1 \, 2)$. In the weak definition of the generator, replacing a test function $eta$ by $e^V
    eta$ gives (3.1) in one direction. Replacing it by $e^(- V) eta$ gives the converse.
    All drift terms are in $L^2$ because $\| nabla V \|$ is bounded. The energy identity
  $ parallel nabla u parallel_(L^2 \( m \))^2 = - integral u Delta u thin upright(d) m $
  and its weighted counterpart bound the gradient by the respective graph norm.
    Together with (3.1), this proves graph-norm equivalence.
  Here is a resolvent proof of the last assertion, before imposing any curvature condition on the weighted space.
    Let $P_t$ be the original heat semigroup, and put
  $ R_a h = integral_0^oo e^(- a t) P_t h thin upright(d) t = \( a - Delta \)^(- 1) h . $
  For $h in L^2 ∩ L^oo$, spectral calculus, the Markov property, and the heat gradient estimate give,
    for all sufficiently large $a$,
  #[#set math.equation(numbering: n => "(3.3)")
   $ parallel R_a h parallel_p & lt.eq a^(- 1) parallel h parallel_p quad \( p = 2 \, oo \) \,\
parallel nabla R_a h parallel_2 & lt.eq C a^(- 1 \/ 2) parallel h parallel_2 \, & parallel nabla R_a h
  parallel_oo & lt.eq C_K a^(- 1 \/ 2) parallel h parallel_oo . $ <weight:resolvent-bounds>]
  For the last estimate one integrates the reverse-Poincaré bound $parallel nabla P_t h parallel_oo lt.eq
    C_K \( t^(- 1 \/ 2) + 1 \) e^(C_K t) parallel h parallel_oo$.
    These are estimates for the original $upright("RCD")$ heat semigroup.
  Consider the Banach space
  $ cal(E) = { z in W^(1 \, 2) : z \, \| nabla z \| in L^oo } \, wide parallel z parallel_(cal(E)) =
    parallel z parallel_2 + parallel nabla z parallel_2 + parallel z parallel_oo + parallel nabla z parallel_oo . $
  Completeness follows from closedness of the weak differential and completeness of $L^oo$.
    Given $h in L^2 ∩ L^oo$, the map
  $ z mapsto R_a #scale(x: 120%, y: 120%)[\(] h + Gamma \( V \, z \) #scale(x: 120%, y: 120%)[\)] $
  is a contraction on $cal(E)$ when $a$ is sufficiently large,
    by (3.3) and $parallel Gamma \( V \, z \) parallel_p lt.eq
    parallel nabla V parallel_oo parallel nabla z parallel_p$.
    Its fixed point lies in $D \( Delta \)$ and solves $\( a - Delta_V \) z = h$.
    The weighted energy identity gives uniqueness of this solution in $D \( Delta_V \)$.
    For $xi$ as in (3.2), take $h = \( a - Delta_V \) xi$. It belongs to $L^2 ∩ L^oo$,
    so uniqueness identifies $xi$ with the fixed point. The original Sobolev-to-Lipschitz property now proves the
    claim. ◻
]

== 4 From a weak Hessian bound to variable curvature <sec:curvature-change>

We now apply the generator facts to $m_lambda = e^(lambda F) m$.
  The weak Hessian upper bound lowers the Ricci bound by $lambda G$.
  We first prove this identity on compact original test functions, then close it in the common generator domain.
  This order is needed because a Lipschitz drift can destroy the Sobolev regularity of an original test function’s
  weighted Laplacian.

For a probability measure $mu$ with bounded support, define

$ "Ent"_m \( mu \) =
  cases(delim: "{", integral_M rho log rho thin upright(d) m \, & mu = rho m \,, + oo \, & mu ≪̸ m \,) wide
  0 log 0 = 0 . $

The negative part is integrable: a bounded ball containing the support has finite measure, and $s log s gt.eq -
  1 \/ e$. This is the entropy domain used below, also for the bounded reweightings $m_lambda$.

For a bounded continuous function $k$, we use the variable curvature-dimension condition
  $upright("CD") \( k \, oo \)$ of #cite(label("BHS2021")) Definition 1.2.
  In the bounded-support case needed below, it supplies, for any two finite-entropy probability measures $mu_0 \,
  mu_1$, a dynamical optimal plan $pi$ with $mu_t = \( e_t \)_(\#) pi$ such that

#[#set math.equation(numbering: n => "(4.1)")
 $ "Ent"_m \( mu_t \) & lt.eq \( 1 - t \) "Ent"_m \( mu_0 \) + t "Ent"_m \( mu_1 \)\
 & quad - integral_("Geo" \( M \)) integral_0^1 #scale(x: 120%, y: 120%)[\(] min { s \, t } -
   s t #scale(x: 120%, y: 120%)[\)] k \( gamma_s \) \| dot(gamma) \|^2 thin upright(d) s thin upright(d)
   pi \( gamma \) . $ <weight:variable-entropy>]

Here $"Geo" \( M \)$ is the space of constant-speed minimizing paths on $\[ 0 \, 1 \]$, and $e_t \( gamma \) =
  gamma_t$. A dynamical optimal plan is a probability measure on this path space whose endpoint coupling is
  optimal for quadratic transport. This formula fixes our Green-kernel and Laplacian normalizations.

#thm([Proposition 4.1.])[
  (A distributional Hessian bound changes curvature).  #emph[Let $\( M \, d \, m \)$ be a full-support
    $upright("RCD") \( K \, N \)$ space, where $K in bb(R)$ and $1 < N < oo$.
    Let $F : M arrow.r bb(R)$ be bounded and globally Lipschitz, and let $G : M arrow.r
    bb(R)$ be bounded and continuous. Suppose that for every compactly supported $g in
    "Test"$ and every nonnegative $h in "Lip"_c \( M \)$,
$ H_F \( nabla g \, nabla g \) \( h \) lt.eq integral h G Gamma \( g \) thin upright(d) m . $

 For every $lambda > 0$, the measure $m_lambda = e^(lambda F)
   m$ satisfies $upright("CD") \( K - lambda G \, oo \)$. The metric is unchanged.]
] <weight:variable-cd>

#proof[
  #strong[Core identity.] Fix $lambda > 0$, and write $V = lambda F$, $w = e^V$, $k = K - lambda G$.
    Take a nonnegative $xi$ in (3.2). Lemma 3 makes $xi$ Lipschitz.
    Initially let $g in "Test"$ be compactly supported, and set $q = Gamma \( g \) \/ 2$, $b =
    Gamma \( V \, g \)$. Define
  #[#set math.equation(numbering: n => "(4.2)")
   $ cal(B)_V \( g \, xi \) = - integral w Gamma \( xi \, q \) thin upright(d) m +
     integral w #scale(x: 120%, y: 120%)[\[] xi Delta_V g + Gamma \( xi \, g \) #scale(x: 120%, y: 120%)[\]]
     Delta_V g thin upright(d) m . $ <weight:integrated-bochner>]
  The notation $cal(B)_0 \( g \, eta \)$ denotes the same formula with $V = 0$;
    it is also meaningful for a bounded Lipschitz multiplier $eta$ after localization near $"supp" g$.
    All terms are integrable: $q in W^(1 \, 2)$, $Delta_V g in L^2$, and $xi \, \| nabla xi \|$ are bounded.
  The original measure-valued Bochner inequality, integrated against $w xi$, gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ cal(B)_0 \( g \, w xi \) gt.eq K integral w xi Gamma \( g \) thin upright(d) m . $ <weight:original-bochner>]
  Here and below a compact test cutoff equal to one near $"supp" g$ can be inserted in the multiplier.
    Its derivatives do not meet the support of any term. Thus the bounded Lipschitz multiplier is admissible by
    the local Bochner-measure calculus in Section 2.
  The product rule and (3.1) give the exact identity
  #[#set math.equation(numbering: n => "(4.4)")
   $ cal(B)_V \( g \, xi \) - cal(B)_0 \( g \, w xi \) & = integral w xi Gamma \( V \, q \) thin upright(d) m +
     integral w b #scale(x: 120%, y: 120%)[\[] Gamma \( xi \, g \) +
     xi Delta_V g #scale(x: 120%, y: 120%)[\]] thin upright(d) m\
 & = - H_V \( nabla g \, nabla g \) \( w xi \) . $ <weight:bochner-difference>]
  The second equality is precisely (1.2), since $"div" \( w xi nabla g \) =
    w \[ Gamma \( xi \, g \) + xi Delta_V g \]$. Use (1.3), with the same harmless cutoff, in (4.4).
    Together with (4.3) this yields
  #[#set math.equation(numbering: n => "(4.5)")
   $ cal(B)_V \( g \, xi \) gt.eq integral k xi Gamma \( g \) thin upright(d) m_V . $ <weight:core-be>]
  The example in Remark 5 explains why the weighted generator domain needs a separate closure argument.
  #strong[Closure in the generator domain.] We next close this inequality in the correct generator domain.
    Integration by parts in its first term rewrites the left side as
  #[#set math.equation(numbering: n => "(4.6)")
   $ 1 / 2 integral \( Delta_V xi \) Gamma \( g \) thin upright(d) m_V +
     integral \( Delta_V g \) Gamma \( xi \, g \) thin upright(d) m_V +
     integral xi \( Delta_V g \)^2 thin upright(d) m_V . $ <weight:graph-form>]
  Every term in (4.6), as well as the right side of (4.5), is continuous under convergence in the $Delta_V$ graph
    norm. Indeed, graph convergence implies strong $L^2$ convergence of gradients; use the boundedness of $xi \,
    Delta_V xi \, \| nabla xi \|$, and $k$. By Lemma 2 and graph-norm equivalence,
    compact original test functions form a core for $Delta_V$.
    Consequently (4.5) in the form (4.6) holds for every $g in D \( Delta_V \)$.
    If in addition $Delta_V g in W^(1 \, 2)$, the last two terms in (4.6) combine by integration by parts, and give
  #[#set math.equation(numbering: n => "(4.7)")
   $ 1 / 2 integral \( Delta_V xi \) Gamma \( g \) thin upright(d) m_V -
     integral xi Gamma \( g \, Delta_V g \) thin upright(d) m_V gt.eq
     integral k xi Gamma \( g \) thin upright(d) m_V . $ <weight:full-be>]
  This is the weighted Bakry–Émery inequality on its actual test domain.
    In particular it holds on the smaller class also requiring $Gamma \( g \) in L^oo$.
  #strong[Constant curvature.] We first obtain a weighted $upright("RCD")$ structure with the same intrinsic
    distance $d$. Replace $k$ by the constant $K_V = inf_M k > - oo$, and set $cal(E)_V = 2 upright("Ch")_V$.
    The unchanged weak gradients make $cal(E)_V$ a strongly local symmetric Dirichlet form with carré du champ
    $Gamma$. In the metric topology $tau$, using the completed Borel $sigma$-algebra, completeness, separability,
    full support and finite bounded-ball measures give condition (MD) of #cite(label("AGS2015")).
    The original Sobolev-to-Lipschitz property gives (ED.a); boundedly supported Lipschitz functions with slope at
    most one have weak gradient at most one, giving (ED.b). The converse of #cite(label("AGS2015")) Theorem 3.9
    therefore makes $\( M \, tau \, m_V \, cal(E)_V \)$ an Energy measure space and identifies its intrinsic
    distance with $d$. Since $cal(E)_V = 2 upright("Ch")_V$ for this metric,
    the necessity direction of #cite(label("AGS2015")) Theorem 3.14 gives upper regularity.
    Bounded equivalence preserves Gaussian volume growth, hence (MD.exp),
    so the final assertion of that theorem gives conservativity.
    Sobolev-to-Lipschitz also supplies continuous representatives for energy functions with $Gamma lt.eq 1$,
    as required by #cite(label("AGS2015")) Definition 3.16. Thus this is a Riemannian Energy measure space.
    Applying #cite(label("AGS2015")) Theorem 4.17 to (4.7) with the constant $K_V$ gives
    $upright("RCD") \( K_V \, oo \)$.
  #strong[Variable curvature.] On this weighted $upright("RCD")$ space,
    (4.7) is its $upright("BE")_2 \( k \, oo \)$ condition, and the bounded continuous function $k$ meets its
    lower semicontinuity and lower-bound assumptions. Hence $upright("CD") \( k \, oo \)$ follows
    #cite(label("BHS2021")) Definition 1.4 and Theorem 1.1. ◻
]

#prodef([Remark 4.2.])[
  (Why the domain argument is needed).  An original test function need not satisfy $Delta_V g in W^(1 \, 2)$.
    Even in Euclidean space, a bounded Lipschitz $V$ agreeing with $- \|
    x_1 \|$ near the origin and a smooth compactly supported $g$ agreeing with $x_1$ there give $Delta_V g = -
    "sign" \( x_1 \)$ locally. The integrated identity (4.4) and closure through (4.6) avoid differentiating this
    drift term. They also explain why no general converse from an unspecified weak Hessian to geodesic convexity
    is being used; compare #cite(label("BrenaGigli2024")) Remark 2.4.
] <weight:domain-warning>

== 5 Localizing the entropy inequality to a prescribed geodesic <sec:every-geodesic>

Proposition 4 provides an entropy inequality for optimal transports between measures.
  To recover a statement on one prescribed geodesic, we concentrate the endpoint measures in shrinking balls.
  Nonbranching makes every strict interior subsegment unique,
  so all the resulting transport paths converge to that subsegment.
  At the same time, we increase $lambda$ fast enough that endpoint entropy contributes no error in the limit.

#proof[
  The case $ell = 0$ is immediate. A finite-dimensional $upright("RCD")$ space is nonbranching
    #cite(label("Deng2020")) Theorem 1.3. Every strict subsegment of $sigma$ is therefore the unique minimizing
    geodesic between its endpoints. Indeed, replacing such a subsegment by a different minimizer gives a
    minimizing curve between $sigma \( 0 \)$ and $sigma \( 1 \)$, with the same length $ell$,
    agreeing with $sigma$ on a nontrivial initial interval. This contradicts nonbranching.
  Fix one strict subsegment, and denote its constant-speed reparametrization by $tau : \[ 0 \, 1 \] arrow.r M$.
    For $epsilon_j arrow.b 0$, let
  $ mu_i^j = frac(m \|_(B_(epsilon_j) \( tau \( i \) \)), m \( B_(epsilon_j) \( tau \( i \) \) \)) \, wide E_i^j =
    "Ent"_m \( mu_i^j \) = - log m \( B_(epsilon_j) \( tau \( i \) \) \) \, quad i = 0 \, 1 . $
  These quantities are finite by full support and local finiteness. Choose
  $ lambda_j gt.eq j #scale(x: 120%, y: 120%)[\(] 1 + \| E_0^j \| + \| E_1^j \| #scale(x: 120%, y: 120%)[\)] . $
  The two endpoint measures have finite entropy relative to $m_(lambda_j)$,
    so Proposition 4 provides a dynamical optimal plan $pi_j$ satisfying the variable-curvature entropy
    inequality. Write $mu_t^j = \( e_t \)_(\#) pi_j$.
  All geodesics in these plans lie in one compact set $Q$ and have lengths bounded by one constant $L$.
    Properness and Arzelà–Ascoli give compactness of this family of paths.
    Every limit of a path with these shrinking endpoint constraints must be $tau$, by the uniqueness just proved.
    Hence $pi_j$ converges weakly to $delta_tau$, even though the measures $m_(lambda_j)$ vary with $j$.
  Set $g \( s \, t \) = min { s \, t } - s t$, the nonnegative Dirichlet Green kernel on $\[ 0 \, 1 \]$, and define
  $ A_t^j & = integral F thin upright(d) mu_t^j \, & E_t^j & = "Ent"_m \( mu_t^j \) \,\
C_t^j & = integral_("Geo" \( M \)) integral_0^1 g \( s \, t \) \| dot(gamma) \|^2 thin upright(d) s thin
  upright(d) pi_j \( gamma \) \,\
D_t^j & = integral_("Geo" \( M \)) integral_0^1 g \( s \, t \) G \( gamma_s \) \| dot(gamma) \|^2 thin upright(d)
  s thin upright(d) pi_j \( gamma \) . $
  We use the large-parameter entropy comparison appearing in #cite(label("Han2018Monotonicity")) Theorem 3.13,
    Equation (3.6), now with the variable bound and the concentrating endpoint measures chosen above.
    Using $"Ent"_(m_(lambda_j)) \( mu \) = "Ent"_m \( mu \) - lambda_j integral F thin upright(d) mu$,
    the defining $upright("CD") \( K - lambda_j G \, oo \)$ inequality becomes
  #[#set math.equation(numbering: n => "(5.1)")
   $ A_t^j gt.eq \( 1 - t \) A_0^j + t A_1^j - D_t^j +
     frac(E_t^j - \( 1 - t \) E_0^j - t E_1^j + K C_t^j, lambda_j) . $ <weight:entropy-rearranged>]
  This uses the Green-kernel normalization of #cite(label("BHS2021")) Definition 1.2.
    The intermediate entropies are finite, and Jensen’s inequality on $Q$ gives $E_t^j gt.eq - log m \( Q \)$.
    Also $0 lt.eq C_t^j lt.eq L^2 \/ 8$. Thus the last term in (5.1) has lower limit at least zero,
    uniformly in $t$. The continuity of $F \, G$ on $Q$, compactness of the paths, and $pi_j arrow.r delta_tau$ imply
  #[#set math.equation(numbering: n => "(5.2)")
   $ F \( tau_t \) gt.eq \( 1 - t \) F \( tau_0 \) + t F \( tau_1 \) - \| dot(tau) \|^2 integral_0^1
     g \( s \, t \) G \( tau_s \) thin upright(d) s . $ <weight:green-concavity>]
  The argument applies to every strict subsegment of $sigma$.
    On any compact interval inside $\( 0 \, 1 \)$, choose a twice continuously differentiable function $a$ with
    $a'' \( t \) = ell^2 G \( sigma_t \)$. The Green formula and (5.2), applied on all subintervals,
    say exactly that $F compose sigma - a$ lies above each of its chords.
    It is concave, so its second distributional derivative is nonpositive. This proves (1.4).
    Continuity supplies the values at the ends of any closed subinterval. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
