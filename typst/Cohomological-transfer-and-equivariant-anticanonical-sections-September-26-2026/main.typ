#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Cohomological-transfer-and-equivariant-anticanonical-sections-September-26-2026]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

Let $X$ be a smooth connected projective variety over $bb(C)$ and put $L = - K_X = det T_X$.
  Anticanonical nonvanishing asks whether $H^0 \( X \, m L \) eq.not 0$ for some integer $m > 0$.
  We assume that $L$ is smoothly semipositive: it has a smooth Hermitian metric with nonnegative Chern curvature.
  Cohomological constructions can produce sections with a fixed twist, which must then be removed.
  In the presence of a group action there is a second obstruction:
  the resulting section must have the required character. Our principal theorem addresses these two obstructions
  together.

Let an algebraic torus $T$ act on $X$. A $T$-linearization of a line bundle is a lift of this action to its total
  space, linear on each fiber. The tangent action gives the natural linearization of $L$,
  but tensoring that action by a character of $T$ gives another one.
  We write $P$ for $L$ equipped with any such linearization, and use additive notation for tensor products.
  Thus $H^0 \( X \, m P \)^T$ specifies both a degree and a character of an anticanonical section.

The input to our principal theorem is a sequence of sections of $M + i P$ with a fixed error $M$.
  The assumption on the error is that $- M$ is pseudoeffective:
  its numerical class lies in the closure of the effective cone.

#thm([Theorem 1.1.])[
  (Invariant transfer).  #emph[Let $X$ be smooth connected projective, let $L = -
    K_X$ carry a smooth semipositive metric, and let an algebraic torus $T$ act on $X$.
    Let $P \, M$ be linearized line bundles such that $P = L$ as ordinary line bundles and $-
    M$ is pseudoeffective. The linearization of $P$ may differ from the natural one on $L$.
    Suppose that for an unbounded $I subset bb(Z)_(> 0)$ there are nonzero invariant sections
$ s_i in H^0 \( X \, M + i P \)^T wide \( i in I \) . $

 Then $H^0 \( X \, m P \)^T eq.not 0$ for some integer $m > 0$.]
] <inj:transfer>

The theorem removes the fixed error without losing the specified character.
  It assumes neither vanishing of $H^1 \( X \, cal(O)_X \)$ nor a condition on the Euler characteristic.
  Taking the trivial torus gives ordinary fixed-error conversion.
  With the natural linearization, invariant cohomology supplies an important source of the required twisted
  sections. In Section 4 we deduce that

$ chi \( X \, cal(O)_X \) eq.not 0 quad arrow.r.double quad
  H^0 \( X \, - m K_X \)^T eq.not 0 upright(" for some ") m > 0 . $

The integer may depend on $X$. The distinction between natural and shifted linearizations remains essential in
  this deduction: the invariant anticanonical index is applied only with the natural one.

Combining this natural invariant nonvanishing with the compact-monodromy structure theorem of
  #cite(label("CompanionH")) Theorem (Finite cover with compact torus monodromy) removes the Euler-characteristic
  premise from the ordinary conclusion. The structure theorem separates the universal cover into a Euclidean
  factor, compact factors with parallel canonical frames, and a compact factor with no positive-degree holomorphic
  forms. After a finite cover, the remaining action on the last factor lies in a compact torus.
  Its invariant section therefore descends, and a finite norm returns a section to $X$.
  Section 14 proves the following consequence and constructs two additional descent maps,
  for cohomology and for twisted forms.

#thm([Corollary 1.2.])[
  #emph[For every smooth connected projective complex $X$ with smoothly semipositive $- K_X$,
    some positive multiple $- m K_X$ has a nonzero section.]
] <thm:ordinary>

=== 1.1 Why a fibration removes the error <why-a-fibration-removes-the-error>

Choose nonzero invariant input sections $s_i$. Ratios of products having the same linearized degree are invariant
  rational functions. Their common field determines a rational map from $X$ to a projective base.
  Along its generic fiber, the divisors of the $s_i$ vary affinely with $i$.
  Unboundedness forces their slope to be effective, so a quotient $s_j \/
  s_i$ supplies a relative anticanonical section.

The main difficulty is to extend this relative section across the boundary.
  We work with a birational morphism $mu : W arrow.r X$ and a normal equidimensional model $f_W : W arrow.r Y$,
  and put $P_W = mu^(*) P$. Every vertical prime of $W$ then lies over a prime of $Y$.
  Subtracting the smallest normalized order over each base prime gives a regular section of $k P_W -
  f_W^(*) \( k B \)$, where $B$ is a rational divisor on $Y$ and $k B$ is integral.
  On a smooth resolution $pi : V arrow.r X$ through $W$, put $E = K_(V \/ X)$.
  The same ratio field shows that the invariant sections of $E + j k pi^(*) P$ on the generic fiber of $V arrow.r
  Y$ form a one-dimensional space over $bb(C) \( Y \)$ for every $j gt.eq 0$, including zero.

Two metrics now play different roles. Smooth adjoint fiber integrals in increasing degrees converge,
  after taking roots, to a fiberwise maximum. This gives a bounded semipositive metric on $k B$.
  At degree zero, pseudoeffectivity of $- M$ supplies a different metric with positive curvature in the base
  directions. Its fiber integral extends to $- K_Y + D_(*)$, where $D_(*) gt.eq
  0$ pulls back to an exceptional divisor over $X$. Its multiplier ideal $cal(J)$ can be nontrivial.
  What matters is the inclusion $cal(O)_Y \( - D_(*) \) subset.eq
  cal(J)$ and the fact that tensoring by the bounded metric on $j k B$ leaves $cal(J)$ unchanged.

Nadel vanishing therefore turns the section dimension of $cal(O)_Y \( D_(*) + j k B \) ⊗
  cal(J)$ into a polynomial in $j$, including at zero. Its value there is positive,
  so it cannot vanish at every positive integer. A resulting section lifts by the relative section,
  and the exceptional correction disappears on $X$. Section 2 prepares the model and the maximum metric;
  Section 3 gives the complete transfer proof.

=== 1.2 A separate harmonic mechanism <a-separate-harmonic-mechanism>

There is another way to detect the zero exponent, using restriction of cohomology to fibers.
  Its hypotheses and purpose differ from character-sensitive transfer.
  Let $f : V arrow.r Y$ be a surjective morphism between smooth projective varieties,
  let $D_V$ have a smooth semipositive metric of curvature $theta$,
  and let $Q$ have a continuous semipositive metric on $Y$.
  Suppose that on a nonempty ordinary open set where $f$ is a submersion,
  every null direction of $theta$ is vertical. We prove in Theorem 16 that

$ H^p #scale(x: 120%, y: 120%)[\(] Y \, R^q f_(*) \( K_V + D_V \) ⊗ Q^k #scale(x: 120%, y: 120%)[\)] =
  0 wide \( p > 0 \, med q \, k gt.eq 0 \) . $

The proof approximates only the continuous metric pulled back from $Y$.
  A weak limit of harmonic representatives has all base canonical covectors as wedge factors,
  and its relative part detects a nonzero cohomology class on a general fiber.
  We apply decomposition to the smooth coefficient $D_V$ and then tensor the resulting derived isomorphism by
  $Q^k$. Thus the argument uses no decomposition theorem for a merely continuous coefficient upstairs.

We work through the natural-linearization application completely,
  then explain alternative constructions at the point where their geometric input changes.
  A fixed invariant system, null-pole functions, and determinant-semigroup ratios give different ways to choose
  the base. An ordinary curvature-null field leads instead to a reduced flat alteration,
  a line of multiplication maps, and a norm back to the original function field.
  Local strictness with an exact direct-image ideal and stabilization of actual direct-image lines provide two
  further vanishing mechanisms. Each construction is carried through to its section conclusion;
  the common analytic conclusions are reused only after their hypotheses have been verified.

=== 1.3 Context and analytic predecessors <context-and-analytic-predecessors>

Anticanonical nonvanishing is motivated by the questions recorded by Yau #cite(label("Yau1994")) Problem 75.
  Our conclusions concern a positive power, whose exponent may vary with the variety.
  Smooth semipositivity provides curvature identities unavailable from numerical nefness alone.
  Demailly–Peternell–Schneider established the universal-cover splitting and finite-cover Albanese fibration for a
  Hermitian semipositive anticanonical bundle #cite(label("DPS1996")) Structure Theorem;
  Campana–Demailly–Peternell identified the remaining compact factors as rationally connected
  #cite(label("CDP2015")) Theorem 1.4. The finite cover is a fiber bundle,
  so descent must still account for monodromy. We use the precise compact-torus structure and finite étale norm in
  #cite(label("CompanionH")), and construct the cohomology-valued and form-valued descent maps here.

In the broader nef setting, Lazić–Matsumura–Peternell–Tsakanikas–Xie proved numerical effectivity of
  $- \( K_X + Delta \)$ for projective log canonical threefold pairs with nef $- \( K_X + Delta \)$,
  assuming that $X$ is $bb(Q)$-factorial or has rational singularities #cite(label("LMPTX2023")) Theorem A.
  Numerical effectivity means that the numerical class is represented by an effective $bb(R)$-divisor;
  it does not by itself provide a section of the specified line bundle.

Müller proves nonvanishing for projective klt pairs with nef log anticanonical divisor whose restriction to a
  general fiber of the maximal rationally connected fibration is semiample,
  and for every projective klt threefold pair with nef log anticanonical divisor #cite(label("Muller2025"))
  Theorem A and Corollary B. His equivariant theorem gives natural invariant sections for semiample log
  anticanonical divisors on projective sub-log canonical pairs under commutative linear algebraic groups
  #cite(label("Muller2025")) Theorem C. Here we work with smooth projective varieties and algebraic tori.
  Smooth semipositivity and a nonzero Euler characteristic give natural invariant sections,
  while Theorem 1 allows shifted linearizations with fixed-error input.
  The compact-monodromy descent then gives ordinary nonvanishing without the Euler-characteristic assumption.

The independent compact-complex index theorem, with its actual value at zero,
  is supplied by #cite(label("CompanionI")) Invariant anticanonical index theorem.
  The passage from cohomology to twisted forms uses smooth semipositive hard Lefschetz,
  due to Mourougane #cite(label("Mourougane1999")) Theorem 2.6 and Serre duality;
  we use the formulation #cite(label("DPS2001")) Corollary 2.1.2.
  The determinant construction follows Lazić–Peternell #cite(label("LP2018")) Lemma 4.1 and its later use in
  #cite(label("LMPTX2023")) Lemma 5.1; we prove the unbounded-twist argument in the form needed here,
  including the numerically trivial case. The inverse determinant is pseudoeffective by the cotangent-tensor
  theorem of Lazić–Matsumura–Peternell–Tsakanikas–Xie #cite(label("LMPTX2023")) Theorem 4.1,
  which develops Ou’s generic-nefness argument #cite(label("Ou2023")) Theorem 1.4.

Berndtsson’s smooth direct-image theorem #cite(label("Berndtsson2009")) gives positivity of the fiberwise adjoint
  metrics. We obtain the continuous maximum metric by taking their normalized moment limits,
  and derive local horizontal strictness from his curvature formula.
  For singular coefficients, Berndtsson–Păun proved direct-image positivity over smooth families
  #cite(label("BP2008")) Theorem 3.5; we use Păun–Takayama’s multiplier-ideal formulation and extension to the
  actual torsion-free direct image #cite(label("PT2018")) Theorems 3.3.4–3.3.5.
  Positivity of an invariant line is obtained from a specified holomorphic quotient;
  it is never inferred for an arbitrary singular subbundle.
  Fujino–Matsumura injectivity #cite(label("FM2016")) and Nadel vanishing #cite(label("Nadel1990")) supply the
  cohomological ending. Guan–Zhou strong openness #cite(label("GuanZhou2015")) is used to keep the relevant ideal
  fixed when a strict metric is mixed with another one.

The harmonic argument belongs to a different regularity regime.
  Richberg smoothing #cite(label("Richberg1968")) provides uniform approximations of continuous base weights,
  and Fujisawa’s derived decomposition #cite(label("Fujisawa2015")) Theorem 1,
  obtained from Takegoshi’s harmonic representatives, applies to the smooth semipositive coefficient on $V$.
  Related vanishing theorems impose global curvature domination:
  Fujino #cite(label("Fujino2018")) Theorem 1.3 uses a smooth semipositive metric on the pullback of an ample base
  line, whereas Matsumura #cite(label("Matsumura2018")) Theorem 1.3 uses the pullback of a base Kähler form.
  Our harmonic proof starts instead from the kernel inclusion on a nonempty ordinary open set and treats the
  continuous base twist by uniform approximation. The reduced-flat construction uses weak semistable reduction
  #cite(label("AK2000")); its finite-group descent and normal-target norm are kept distinct from a finite-flat
  norm-line construction.

=== 1.4 Conventions and reading path <conventions-and-reading-path>

We write $tilde.op$, $tilde.op_(bb(Q))$, and $equiv$ for linear, rational linear, and numerical equivalence.
  A local frame of squared norm $e^(- phi.alt)$ has curvature $i partial macron(partial) phi.alt$;
  factors of $2 pi$ are included when viewing curvature as a first Chern form.
  A continuous semipositive metric has continuous plurisubharmonic weights.
  Locally bounded weights have both upper and lower bounds and need not be continuous.

The action on sections is $\( g dot.op s \) \( g x \) = g \( s \( x \) \)$.
  Algebraic-torus invariants agree with invariants under its maximal compact torus.
  Averaging smooth metric weights and Kähler forms over the compact torus preserves semipositivity.
  A rank assertion on a dense base-change open is not an assertion on singular fibers.

The shortest route to Corollary 2 is the transfer proof in Sections 2–3,
  its natural invariant application in Section 4, and invariant-section descent in Section 14.
  Section 5 also obtains exact source characters. The remaining constructions explain different ways to convert
  cohomology into sections. Section 6 gives an independent ordinary proof through singular injectivity;
  Sections 7–11 develop harmonic restriction and its geometric inputs;
  Sections 12 and 13 use exact multiplier ideals and actual direct-image lines.
  The final section also gives the stronger tensor-holonomy calculation.

The table compares the inputs and the step that completes each conversion.
  The source-character constructions in Sections 5 and 10 additionally keep track of an extremal character.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Input
], table.cell(rowspan: 1, colspan: 1)[Base construction
], table.cell(rowspan: 1, colspan: 1)[Conversion
]),
  table.cell(rowspan: 1, colspan: 1)[Unbounded shifted invariant sections; $- M$ pseudoeffective
], table.cell(rowspan: 1, colspan: 1)[Common section-ratio field
], table.cell(rowspan: 1, colspan: 1)[Fixed-ideal vanishing; Theorem 1
],
  table.cell(rowspan: 1, colspan: 1)[Natural invariant cohomology; nonzero Euler value
], table.cell(rowspan: 1, colspan: 1)[Fixed invariant system
], table.cell(rowspan: 1, colspan: 1)[Harmonic restriction; Section 8
],
  table.cell(rowspan: 1, colspan: 1)[Ordinary cohomology in one degree at unbounded powers
], table.cell(rowspan: 1, colspan: 1)[Curvature-null field and reduced flat alteration
], table.cell(rowspan: 1, colspan: 1)[Descent of a continuous line and its injection; Theorem 24
],
  table.cell(rowspan: 1, colspan: 1)[No positive structure-sheaf cohomology
], table.cell(rowspan: 1, colspan: 1)[Null-pole field or determinant semigroup
], table.cell(rowspan: 1, colspan: 1)[Maximum metric and harmonic restriction; Section 9
],
  table.cell(rowspan: 1, colspan: 1)[No positive structure-sheaf cohomology
], table.cell(rowspan: 1, colspan: 1)[Null-pole field, expressed by degree zero
], table.cell(rowspan: 1, colspan: 1)[Local strictness for the exact direct-image ideal; Section 12
],
  table.cell(rowspan: 1, colspan: 1)[Unbounded natural invariant twisted sections; $- M$ pseudoeffective
], table.cell(rowspan: 1, colspan: 1)[Toroidal invariant Iitaka model
], table.cell(rowspan: 1, colspan: 1)[Affine boundary orders and strong openness; Section 13
],
)
]

== 2 Preparing a fibration and measuring its relative section <sec:models>

A section regular on the generic fiber may still have poles over the boundary.
  The following model separates the horizontal and vertical tests for regularity;
  a smooth resolution will be used only for fiber integrals.

#thm([Lemma 2.1.])[
  (Equidimensional models).  #emph[Let $X arrow.r.dashed Y$ be a dominant rational map of integral projective
    varieties over $bb(C)$. There are a smooth projective birational model $Y'$ of $Y$ and an integral projective
    flat family $X_0 arrow.r Y'$ with a birational morphism to the graph of the original map.
    Every irreducible component of every fiber has dimension $dim X - dim Y$.
    The normalization $V$ of $X_0$ is equidimensional over $Y'$; in particular,
    every vertical prime divisor of $V$ maps onto a prime divisor of $Y'$.
    If $bb(C) \( Y \)$ is algebraically closed in $bb(C) \( X \)$, the morphism from $V$,
    and from any smooth resolution of $V$, to $Y'$ has connected fibers.
    If a torus acts on $X$ and the rational map is invariant,
    these constructions and a projective resolution of $V$ can be made equivariant, with trivial action on the base.]
] <val:flat-model>

#proof[
  Embed the projective graph over $Y$ in $bb(P)^N times Y$.
    Over the flat open set the fibers define a map to the projective Hilbert scheme
    #cite(label("Grothendieck1961Hilbert")) Theorem 3.2 and the Hilbert-scheme specialization after
    Proposition 3.8. Resolve the closure of its graph, also resolving the base,
    and pull back the universal family. Flatness over an integral base embeds each affine coordinate ring in its
    generic localization. The generic fiber is integral, so these coordinate rings have neither nilpotents nor
    zero divisors. Thus the pulled-back family is integral and is the closure of the original family over the flat
    open set. Its map to the graph is birational.
  Constancy of the Hilbert polynomial bounds the dimension of every fiber above by the generic relative dimension.
    At any fiber component the height bound for the ideal generated by local parameters of the smooth base gives
    the opposite bound. This proves purity of fiber dimension.
    Normalization is finite, so fiber dimensions and dimensions of images of components are preserved.
    A prime divisor mapping into codimension at least two in $Y'$ would have dimension at most $dim Y' -
    2 + \( dim X - dim Y' \) = dim X - 2$, a contradiction.
  For connectedness apply Stein factorization to the normal total space.
    Its finite intermediate base has function field the algebraic closure of $bb(C) \( Y' \)$ in $bb(C) \( X \)$;
    the asserted field condition and normality of $Y'$ make the finite birational morphism an isomorphism.
    The same reasoning applies after resolution. In the equivariant case,
    the family over the original open set is stable under the action.
    Its closure and normalization are therefore stable, and equivariant resolution in characteristic zero supplies
    the last assertion. ◻
]

=== 2.1 Rank-one adjoints and a continuous maximum metric <har:sec:maximum>

Our first task is to turn a rational relative section into a metrized line on the base.
  This construction will serve both the character-sensitive transfer and the harmonic applications.
  Its normal equidimensional model is used for divisorial normalization and continuity.
  A resolution supplies smooth coefficients for the direct-image theorem; that resolution need not be equidimensional.

#thm([Proposition 2.2.])[
  (Divisorial normalization and maximum metric).  #emph[Let $X \, Y$ be smooth connected projective, let $L = -
    K_X$ have a smooth semipositive metric, and suppose
$ V arrow.r^nu W arrow.r^mu X \, wide g : W arrow.r Y \, wide f = g nu \, $

 where $W$ is normal, $g$ is projective surjective equidimensional, $mu$ is birational,
   and $V$ is a smooth projective resolution. Set $D_V = \( mu nu \)^(*) L$ and $E = K_(V \/ X)$,
   and let $s_E$ be the canonical Jacobian section of $E$. Suppose a nonzero rational section $s$ of $b mu^(*) L$,
   $b > 0$, has no horizontal poles and, on the generic fiber $V_eta$, satisfies
$ H^0 \( V_eta \, E + k b D_V \) = bb(C) \( Y \) thin s_E s^k wide \( k gt.eq 0 \) . $

 Alternatively, suppose a torus acts compatibly on the diagram, trivially on $Y$,
   and let $P$ be $L$ with any chosen linearization. Put $P_V = \( mu nu \)^(*) P$.
   In this case it suffices that $s$ be an invariant rational section of $b mu^(*)
   P$ and that the displayed condition be replaced by
$ H^0 \( V_eta \, E + k b P_V \)^T = bb(C) \( Y \) thin s_E s^k wide \( k gt.eq 0 \) \, $

 where $E$ carries its natural Jacobian action.]
  #emph[After replacing $b \, s$ by a multiple and a power, there are a line $Q$ on $Y$ and a regular injection
$ g^(*) Q arrow.r b mu^(*) L $

 whose squared fiber-maximum norms define a positive continuous metric with plurisubharmonic weights on $Q$.
   In the invariant case $Q$ has trivial linearization and the injection $g^(*) Q arrow.r b mu^(*) P$ is equivariant.]
] <har:prop:maximum>

#proof[
  In the invariant case average a smooth semipositive metric on $L$ over the maximal compact torus.
    The chosen linearization of $P$ differs from the natural one by a character,
    which is unitary on this compact torus, so the averaged metric is invariant for both actions.
  The rank assumption at $k = 0$ forces the generic fiber to be geometrically connected.
    Indeed its constant functions, multiplied by $s_E$, inject into that adjoint space.
    In the invariant case the connected torus acts trivially on the finite Stein base,
    so all these constants are invariant. Their dimension is therefore one.
    Smooth general fibers are consequently connected and irreducible.
  For every prime divisor $B$ of $Y$, put
  $ c_B = min_(Gamma mapsto B) frac("ord"_Gamma \( s \), "ord"_Gamma \( g^(*) B \)) . $
  Properness and equidimensionality supply divisorial lifts of $B$;
    all vertical prime divisors lie over base primes. Only finitely many $c_B$ are nonzero.
    Clear denominators and use the resulting integral divisor as $Q$.
    Sending its rational canonical section to the powered $s$ gives a regular bundle map by normality.
    Its effective Cartier zero divisor $G$ omits at least one component above every base prime.
    In the invariant case all these divisors are invariant, the base line carries trivial linearization,
    and the map is to $b mu^(*) P$. In an eigensection version,
    one instead twists the base linearization by the section character.
  For a local frame $e$ of $Q$, denote its image by $s_e$ and put
  #[#set math.equation(numbering: n => "(1)")
   $ M_e \( y \) = max_(x in W_y) \| s_e \( x \) \|^2 . $ <har:eq:max>]
  This is continuous. Properness gives upper semicontinuity.
    For lower semicontinuity use that an equidimensional holomorphic map from a pure dimensional normal space to a
    smooth base is open. To verify openness at a point, cut the source by as many general local hyperplanes as the
    fiber dimension, isolating the point in its fiber. The slice germ has dimension at least that of the base and
    is finite over that smooth base germ. Its image is therefore the entire base germ.
    This can be done inside any prescribed source neighborhood.
  The locus $Z_0$ where $M_e$ vanishes is algebraic closed:
    its complement is the constructible image $g \( W \\ "Supp" G \)$,
    and continuity makes $Z_0$ closed in the classical topology;
    a constructible classically closed subset is Zariski closed.
    By the omitted-lift property, $Z_0$ has codimension at least two.
  We show first that $- log M_e$ is plurisubharmonic on a dense open.
    Work on a fixed smooth-fibration open for $f$, where the canonical exceptional section and $s_e$ are not
    identically zero on any fiber component. Take a local frame $eta$ of $K_Y$. The section
  $ \( s_E \/ f^(*) eta \) s_e^k quad upright("of ") K_(V \/ Y) + \( k b + 1 \) D_V $
  generates the rank-one adjoint space at the generic point.
    In the shifted equivariant case its coefficient is $D_V + k b P_V$;
    as a metrized ordinary line it is still $\( k b + 1 \) D_V$.
    Berndtsson’s smooth direct-image theorem #cite(label("Berndtsson2009")) Theorem 1.2 applies on the bundle and
    base-change locus with smooth semipositive coefficient $\( k b + 1 \) D_V$.
    In the invariant case the invariant line is an #emph[orthogonal quotient] of the full direct image:
    the compact torus acts unitarily, and the sum of its nonzero-weight spaces is its orthogonal complement.
    It therefore has semipositive curvature. This quotient argument, rather than positivity of arbitrary sublines,
    is what permits taking invariants.
  For $k gt.eq 1$ the resulting plurisubharmonic function is
  #[#set math.equation(numbering: n => "(2)")
   $ - 1 / k log integral_(V_y) \| s_e \|^(2 k) thin d mu_y \, $ <har:eq:moments>]
  where $mu_y$ comes from $s_E \/ f^(*) eta$ with the metric of $D_V$.
    It is smooth, nonnegative, of full support, and independent of $k$.
    Each integral is smooth positive on our fixed open, so the curvature inequality extends there from its
    possibly $k$-dependent base-change open. Normalized to probability measures,
    its $1 \/ k$-powers increase to $M_e$. They converge locally uniformly:
    a point just below the positive fiber maximum has a neighborhood of uniformly positive $mu_y$-mass on nearby
    fibers; compactness supplies finitely many such neighborhoods,
    while bounded total mass gives the upper estimate. Thus (2) converges locally uniformly to $- log M_e$.
  By continuity this weight extends plurisubharmonically across the bad analytic loci wherever $M_e > 0$.
    It cannot tend to $+ oo$ across $Z_0$ of codimension at least two.
    Through a point of $Z_0$ choose a small analytic disc whose boundary misses $Z_0$.
    Nearby parallel discs have their boundaries in a fixed compact set off $Z_0$.
    Since $Z_0$ has codimension at least two, a dense set of these discs misses it entirely.
    The maximum principle therefore bounds the weight uniformly at their centers,
    and continuity off $Z_0$ supplies the same bound there. A zero of the continuous $M_e$ would contradict this
    bound. Hence $M_e > 0$ everywhere, and the weight is continuous plurisubharmonic.
    Its transformation rule under a change of frame is exactly the metric transformation rule for $Q$. ◻
]

== 3 Character-sensitive transfer with a fixed multiplier ideal <inj:character-transfer>

The next conversion allows a character shift of the anticanonical linearization.
  Its proof uses a common field of invariant section ratios and a singular metric with positive curvature in the
  base directions. The boundary correction on the base has exceptional pullback,
  and its multiplier ideal stays fixed while the exponent varies.

#proof[
  #emph[The common ratio field.] Put $n = dim X$ and write $N_i = M + i P$.
    For each $i$, ratios of invariant sections of the same positive multiple of $N_i$ form a field $Q_i$.
    For $p < q < b$ in $I$, the identity
  $ \( b - p \) N_q = \( b - q \) N_p + \( q - p \) N_b $
  holds with linearizations. Multiplication by suitable powers of the fixed $s_p \,
    s_b$ puts any ratio for $N_p$ or $N_b$ into $Q_q$. This retains the ratio itself:
    for a ratio in degree $a N_p$, multiply its numerator and denominator by $s_p^(a \( b - q - 1 \))
    s_b^(a \( q - p \))$, and use the analogous formula for a ratio in $a N_b$.
    Taking a further index beyond any prescribed two interior indices proves that all $Q_i$ with $i > min
    I$ coincide; denote this field by $Q$.
  Fix the first two indices $p < q$. For $b > q$ the ratio
  #[#set math.equation(numbering: n => "(3)")
   $ frac(s_q^(b - p), s_p^(b - q) s_b^(q - p)) $ <inj:ratio-field-identity>]
  belongs to $Q$. If $"trdeg"_(bb(C)) Q = 0$, it is constant.
    The section divisors are affine in $i$, and their slope is effective because the indices are unbounded.
    Thus $s_q \/ s_p$ is a regular invariant section of $\( q - p \) P$.
  Otherwise put $e = "trdeg" Q > 0$. Choose $e$ independent ratios to define a map to $bb(P)^e$,
    resolve its graph and take Stein factorization. The Stein field is the relative algebraic closure in
    $bb(C) \( X \)$ of the field of the chosen ratios, a finite extension of that field.
    It contains $Q$, since $Q$ is algebraic over the chosen ratio field,
    and is relatively algebraically closed in $bb(C) \( X \)$.
    The connected torus acts trivially on the Stein base because its orbits lie in finite fibers over a base with
    trivial action. As before take a smooth projective base $Y$, a normal equidimensional $W arrow.r
    Y$ with a birational morphism $W arrow.r X$, and an equivariant smooth resolution $V arrow.r W$,
    with maps $mu : W arrow.r X$, $f_W : W arrow.r Y$, and total maps $pi : V arrow.r X$ and $f : V arrow.r Y$.
    Put $P_W = mu^(*) P$. The map $f$ has connected fibers by the Stein construction and normality of $Y$.
    Write $L' = pi^(*) L$ and $P' = pi^(*) P$.
  For each interior index $i$ and every divisor $H'$ on $Y$,
  #[#set math.equation(numbering: n => "(4)")
   $ H^0 \( V \, a pi^(*) N_i - f^(*) H' \)^T eq.not 0 quad upright("for some integer ") a > 0 .
     $ <inj:ratio-domination>]
  Indeed the chosen independent ratios belong to $Q_i$. Put their numerators and denominator in one common degree
    by products of invariant sections. On the resolved graph they have a common invariant factor whose line is
    that multiple of $N_i$ minus the pullback of $cal(O)_(bb(P)^e) \( 1 \)$.
    The latter line is big on $Y$, so a sufficiently large multiple dominates $H'$.
  #emph[A regular relative section.] We next remove the vertical poles while preserving the character.
    Let $D_i$ be the section divisor on $W$. Since (3) comes from $Y$, its horizontal divisor is zero.
    The affine relations show that the horizontal part of $\( D_q - D_p \) \/ \( q - p \)$ is effective.
    Normalize the vertical part by subtracting the minimum coefficient divided by pullback multiplicity above each
    base prime, and let $B$ be the resulting rational base divisor.
    There is an integer $k > 0$, divisible by $q - p$ and clearing the coefficients of $B$, for which
  #[#set math.equation(numbering: n => "(5)")
   $ gamma = \( s_q \/ s_p \)^(k \/ \( q - p \)) \( f_W^(*) 1_(k B) \)^(- 1) in
     H^0 \( W \, k P_W - f_W^(*) \( k B \) \)^T $ <inj:gamma>]
  is regular. Normality checks regularity in codimension one,
    and equidimensionality accounts for every vertical prime.
    Above every base prime $gamma$ is nonzero at the general point of at least one component.
    We also write $gamma$ for its pullback to $V$.
  #emph[All adjoint ranks, including zero.] The ratio field must also control the fiber integrals.
    Let $E = K_(V \/ X) gt.eq 0$. Its Jacobian section $1_E$ is invariant for the natural linearization on $L'$,
    irrespective of the character shift in $P'$. For all $j gt.eq 0$,
  #[#set math.equation(numbering: n => "(6)")
   $ "rank" #scale(x: 120%, y: 120%)[\(] f_(*) cal(O)_V \( E + j k P' \) #scale(x: 120%, y: 120%)[\)]^T =
     1 . $ <inj:transfer-rank>]
  The section $1_E gamma^j$ gives the lower bound over the generic fiber.
    If the rank were larger, globalize two invariant sections $u_1 \,
    u_2$ independent over $bb(C) \( Y \)$ after a twist $f^(*) \( a H \)$, where $H$ is ample.
    Choose $i \, b in I$ with $b > i + j k$. Multiply $u_1^k$ and $u_1^(k - 1) u_2$ by $s_i^k
    gamma^(b - i - j k)$. Both results are sections of
  $ k E + k pi^(*) N_b + f^(*) #scale(x: 120%, y: 120%)[\(] k a H - \( b - i - j k \) k B
    #scale(x: 120%, y: 120%)[\)] \, $
  with ratio $u_2 \/ u_1$. Apply (4) at index $b$ to cancel this base twist by the same invariant multiplier in
    the numerator and denominator. Removing the exceptional twist $k
    E$ and pushing to $X$ leaves two invariant sections of an equal multiple of $N_b$.
    Normality extends across the image of the exceptional locus.
    Their ratio must be in $Q subset bb(C) \( Y \)$, contrary to independence. This proves (6).
  #emph[The bounded metric and the horizontally positive metric.] We now construct the two metrics needed for
    interpolation. Average a smooth semipositive metric $h_0$ on $L$ over the maximal compact torus.
    It is also invariant for $P$, because the two linearizations differ by a character,
    unitary on that compact torus. Equation (4) and pseudoeffectivity of $- M$ give $L' -
    eta f^(*) H$ pseudoeffective for some $eta > 0$ and ample $H$.
    Taking a positive current, averaging, and mixing a small positive fraction of its potential with $h_0$ gives
    an invariant singular metric $h$ on $L'$ with
  #[#set math.equation(numbering: n => "(7)")
   $ i Theta_h gt.eq delta f^(*) omega_Y \, wide cal(I) \( h \) = cal(O)_V \, wide
     delta > 0 . $ <inj:strict-integrable>]
  Skoda integrability and compactness give the last equality.
    The metric is bounded below by a positive constant times $h_0$ on compact coordinate patches:
    its potential relative to the smooth metric is locally bounded above.
  Apply Proposition 4 with the normal model $W$, the chosen linearization $P$,
    and the relative section $gamma$ of $k P_W - f_W^(*) \( k B \)$.
    Equivalently use the rational section $\( s_q \/ s_p \)^(k \/ \( q - p \))$ before normalization.
    Equation (6) gives every invariant adjoint rank, the Jacobian has its natural invariant action,
    and the averaged smooth metric is invariant also for $P$.
    The vertical minima defining $k B$ are exactly those in that proposition.
    Its smooth coefficient is $L' + j k P'$, ordinary $\( 1 + j k \) L'$,
    so the orthogonal quotient argument applies without any singular-subbundle claim.
    We obtain a continuous, in particular locally bounded, semipositive metric on $k B$.
  #emph[A fixed ideal on the base.] The continuous base metric just obtained controls the varying power.
    The singular degree-zero metric will supply the positive constant term.
    For $j = 0$ use the singular coefficient metric $h$. The singular adjoint direct-image theorem
    #cite(label("PT2018")) Setup 3.2.1 and Theorem 3.3.4 applies over the smooth, locally free base-change locus.
    Its generic multiplier-ideal inclusion is an isomorphism by (7);
    fiber integrability is an almost-everywhere assertion by Fubini.
    The invariant summand is an orthogonal holomorphic quotient for the compact-invariant metric.
    Thus its line metric has semipositive curvature. Subtract a local potential for $delta
    omega_Y$ from the coefficient weight to see that its curvature is in fact at least $delta omega_Y$.
  In a frame $xi$ of $- K_Y$, denote the squared norm of $1_E f^(*) xi$ by $F_xi \( y \)$.
    With base volume in the dual frame, this is the pushforward density of the integrable absolute adjoint form
    $1_E$ with metric $h$. Hence $F_xi$ is locally integrable on the whole base chart.
    We next extend its negative logarithm with an explicit exceptional correction.
  #emph[Boundary extension with exceptional support.] For a prime boundary divisor $P$ choose a prime $Q subset
    V$ mapping onto it, of pullback multiplicity $l$ and Jacobian order $a = "ord"_Q \( E \)$.
    At general points write $f = \( z_1^l \, z_2 \, dots.h \, z_e \)$.
    Integrating on one coordinate patch, using $h gt.eq c h_0$, gives almost everywhere
  #[#set math.equation(numbering: n => "(8)")
   $ F_xi \( y \) gt.eq c' \| y_1 \|^(2 \( \( a + 1 \) \/ l - 1 \)) . $ <inj:density-bound>]
  The exponent includes the transverse Jacobian factor $\| z_1 \|^(- 2 \( l - 1 \))$.
    If a nonexceptional component dominates $P$, choose it for the estimate.
    Then $a = 0$ and the coefficient of $P$ in the correction is zero.
    Otherwise every component dominating $P$ is exceptional; choose a nonnegative integer coefficient at least
    $\( a + 1 \) \/ l - 1$. Summing over the finitely many boundary primes gives $D_(*) gt.eq
    0$ with $f^(*) D_(*)$ exceptional over $X$.
  For the last assertion one must also check primes mapping to codimension at least two on $Y$.
    The equidimensional normal model $W$ has relative dimension $n - e$,
    so for $Z subset Y$ of codimension at least two,
  $ dim f_W^(- 1) \( Z \) lt.eq dim Z + n - e lt.eq n - 2 . $
  Any prime of $V$ over $Z$ therefore maps to codimension at least two on $W$ and on $X$.
    Every component dominating a base prime in $"Supp" D_(*)$ is exceptional by the rule defining that support.
    These two checks account for every component of $f^(*) D_(*)$.
  On $- K_Y + D_(*)$ define the metric by $\| xi 1_(D_(*)) \|^2 = F_xi$ on the dense open.
    Its ordinary-frame weight is $- log F_xi + log \| g_(D_(*)) \|^2$.
    Estimate (8) bounds this weight above at general boundary points.
    Subtract a local smooth potential for $delta omega_Y$. The resulting plurisubharmonic weight extends across
    each boundary divisor away from a codimension-two analytic subset.
    Hartogs extension for plurisubharmonic functions then fills that subset.
    Restoring the smooth potential gives a metric on all of $Y$ with curvature at least $delta omega_Y$.
    If $cal(J)$ is its multiplier ideal, then
  #[#set math.equation(numbering: n => "(9)")
   $ cal(O)_Y \( - D_(*) \) subset.eq cal(J) \, $ <inj:fixed-ideal-inclusion>]
  since multiplying the metric coefficient by $\| g_(D_(*)) \|^2$ recovers the locally integrable density $F_xi$.
  #emph[Interpolation and return to $X$.] Tensor by the bounded semipositive metric on $j k B$.
    For every $j gt.eq 0$ the multiplier ideal remains the same $cal(J)$, which is not assumed trivial.
    Nadel vanishing yields
  $ H^v #scale(x: 120%, y: 120%)[\(] Y \, cal(O)_Y \( D_(*) + j k B \) ⊗ cal(J) #scale(x: 120%, y: 120%)[\)] =
    0 wide \( v > 0 \, med j gt.eq 0 \) . $
  Put $cal(F) = cal(O)_Y \( D_(*) \) ⊗ cal(J)$. Its Euler characteristic after twisting by $j k
    B$ is a polynomial in $j$. The inclusion (9) gives $cal(O)_Y arrow.r.hook cal(F)$,
    so at zero this polynomial equals $h^0 \( Y \, cal(F) \) > 0$.
    A nonzero section therefore exists for some $j > 0$. Pull it back and multiply by $gamma^j$ to obtain an
    invariant section of $j k P' + f^(*) D_(*)$. Removing the exceptional twist and pushing down gives the
    required section of $j k P$. ◻
]

== 4 Natural linearization and cohomological input <sec:cohomological-input>

Write $n = dim X$ and $chi^T \( X \, cal(O)_X \) = sum_q \( - 1 \)^q dim H^q \( X \, cal(O)_X \)^T$.
  The transfer theorem permits a chosen character. To obtain its input from cohomology,
  we now use the natural anticanonical character. The following result is the exact input from the index companion
  #cite(label("CompanionI")) Invariant anticanonical index theorem.

#thm([Proposition 4.1.])[
  (Invariant anticanonical index).  #emph[Let $F$ be a compact complex manifold with a holomorphic action of a
    compact real torus $T$. Give $D = - K_F$ its natural linearization.
    There are an integer $a > 0$ and a polynomial $P in bb(Q) \[ t \]$ such that
$ sum_q \( - 1 \)^q dim H^q \( F \, m a D \)^T = P \( m \) quad \( m > 0 \) \, wide P \( 0 \) =
  sum_q \( - 1 \)^q dim H^q \( F \, cal(O)_F \)^T . $

 The statement includes the trivial torus, an empty fixed locus, and zero-dimensional fixed components;
   it assumes no positivity, projectivity, or Kähler condition.]
] <har:prop:index>

In particular the value at zero is the actual index, not a formal extrapolation of an eventual polynomial.
  We use this theorem to select a fixed cohomological degree on an unbounded sequence.

#thm([Lemma 4.2.])[
  (Forms and determinant sections).  #emph[Let $X$ be smooth connected projective, let $L = -
    K_X$ have a smooth semipositive metric, and let an algebraic torus $T$ act on $X$.
    If $chi^T \( X \, cal(O)_X \) eq.not 0$, then for some fixed $q$ there are nonzero invariant sections of
    $Omega_X^(n - q) ⊗ L^(m + 1)$ for unbounded positive integers $m$.
    If these do not already give a nonzero invariant section of a positive power of $L$,
    there is an integer $e > 0$, a linearized line bundle $M$, a nonzero map $M arrow.r
    and.big^e Omega_X^(n - q)$, and invariant sections
$ 0 eq.not s_i in H^0 \( X \, M + a_i L \)^T \, wide a_i arrow.r oo . $

]
] <har:lem:forms>

#proof[
  The polynomial in Proposition 5 is not zero. A fixed cohomological degree therefore has nonzero invariant
    cohomology along an unbounded sequence. Average a Kähler form and the metric weights over the maximal compact
    torus, and denote the resulting curvature of $L$ by $theta$.
    The smooth semipositive hard Lefschetz theorem #cite(label("DPS2001")) Corollary 2.1.2, applied to $m L =
    K_X + \( m + 1 \) L$, gives the asserted forms. Concretely,
    if $u$ is harmonic of type $\( n \, q \)$ with values in $\( m + 1 \) L$, Bochner–Kodaira gives
  $ 0 = parallel \( D' \)^(*) u parallel^2 + chevron.l \[ \( m + 1 \) theta \, Lambda \] u \, u chevron.r . $
  Both terms are nonnegative. Applying the complex-linear star on form indices to $u$ therefore gives a
    holomorphic form of type $\( n - q \, 0 \)$. The construction is equivariant.
    For $q = 0$ it already yields invariant sections of $m L$; for $q =
    n$ the holomorphic form itself is a section of $\( m + 1 \) L$.
    If $r = max "rank" theta = n$ and $q > 0$, the curvature term makes this form vanish on a nonempty open set,
    hence everywhere, so this case cannot occur.
  The determinant extraction follows the method of #cite(label("LMPTX2023")) Lemma 5.1 and #cite(label("LP2018"))
    Lemma 4.1. We spell out the unbounded-twist step, which here also applies when $L$ is numerically trivial.
    Choose a rational frame of $L$ and divide each form by the corresponding power of that frame.
    Their span over $bb(C) \( X \)$ is a subspace of the generic fiber of $Omega_X^(n - q)$, of some rank $e$.
    Changing the frame rescales each vector by a nonzero rational function, so this subspace is intrinsic.
    Saturate its top exterior power in $and.big^e Omega_X^(n - q)$ and call the resulting rank-one subsheaf $M$.
    It is reflexive on smooth $X$, hence a line bundle. The generic span is torus-stable,
    so its saturation carries the induced linearization.
  Choose finitely many of the original forms as a generic basis.
    Every wedge of $e$ original forms lies generically in $M$ tensored by the sum of their powers of $L$;
    saturation makes it a regular section of that line. In the fixed basis,
    one coordinate of the unbounded family is nonzero for unbounded $m$.
    Wedge those forms with the other $e - 1$ fixed basis forms.
    These wedges are nonzero and invariant, and their twist exponents are $m + 1$ plus a fixed sum.
    They give the required sections with $a_i arrow.r oo$. ◻
]

#thm([Corollary 4.3.])[
  (Natural invariant nonvanishing).  #emph[Let $X$ be smooth connected projective over $bb(C)$,
    with smoothly semipositive $L = - K_X$. If an algebraic torus $T$ acts on $X$ and $chi \( X \, cal(O)_X \)
    eq.not 0$, then $H^0 \( X \, m L \)^T eq.not 0$ for some integer $m > 0$, with the natural linearization.
    The torus may be trivial.]
] <thm:main>

#proof[
  Every element of the connected torus is homotopic to the identity,
    so its action on singular cohomology is trivial. By Hodge decomposition its action on every
    $H^q \( X \, cal(O)_X \)$ is trivial. Consequently the invariant index at zero equals $chi \( X \, cal(O)_X \)
    eq.not 0$. Lemma 6 supplies either an invariant section directly or invariant sections of $M +
    a_i L$ with $a_i arrow.r oo$ and a nonzero map from $M$ into a positive tensor power of $Omega_X^1$.
    The cotangent-tensor theorem #cite(label("LMPTX2023")) Theorem 4.1,
    applied to the smooth zero-boundary pair with nef $- K_X$, says that $- M$ is pseudoeffective.
    Apply Theorem 1 with $P = L$ naturally linearized. ◻
]

The harmonic constructions need additional information about the zero divisors of these determinant sections.
  The following degree argument provides it directly from the cotangent inclusion,
  independently of the pseudoeffectivity theorem used in Corollary 7.

#thm([Lemma 4.4.])[
  (Curvature-null determinant divisors).  #emph[Let $X$ be a smooth connected projective variety of dimension $n$,
    and let $L = - K_X$ have smooth semipositive curvature $theta$ of maximal rank $r < n$.
    Suppose a line bundle $M$ admits a nonzero map $M arrow.r and.big^e Omega_X^p$ for integers $e \, p > 0$.
    Then $c_1 \( M \) G^(n - 1) lt.eq 0$ for every Kähler class $G$.
    If $0 eq.not s in H^0 \( X \, M + a L \)$ for an integer $a$, its zero divisor $D$ satisfies
$ \[ D \] \[ theta \]^r \[ omega \]^(n - r - 1) = 0 $

 for every Kähler form $omega$. Each component has zero intersection separately,
   and $theta^r$ vanishes on its smooth locus.]
] <har:lem:null-divisors>

#proof[
  For every Kähler class $G$, Yau’s prescribed-Ricci theorem #cite(label("Yau1978")) gives a Kähler metric in $G$
    with Ricci form $theta$. Kähler curvature symmetry identifies the mean curvature of $T_X$ with Ricci;
    the induced mean curvature of $and.big^e Omega_X^p$ is nonpositive.
    If $deg_G M > 0$, solve a scalar Laplace equation to give $M$ a metric of positive constant mean curvature.
    Its inverse tensor the cotangent construction then has negative mean curvature,
    contradicting the Bochner formula for its nonzero section. Thus $c_1 \( M \) G^(n - 1) lt.eq 0$.
    Put $G = \[ theta \] + t \[ omega \]$, divide by $t^(n - 1 - r)$, and let $t arrow.b 0$. Since $theta^(r + 1) = 0$,
  $ c_1 \( M \) \[ theta \]^r \[ omega \]^(n - 1 - r) lt.eq 0 . $
  The same intersection for $M + a L$ is nonnegative by effectivity and smooth semipositivity,
    and the contribution from $a L$ is zero. It is consequently zero.
    Each component has zero intersection separately; the nonnegative form $theta^r and
    omega^(n - r - 1)$ therefore vanishes on its smooth locus, which gives the last assertion. ◻
]

#prodef([Remark 4.5.])[
  (The singular-norm proof of the degree sign).  The determinant degree calculation also has a useful current
    proof. In a Kähler metric with the prescribed semipositive Ricci form,
    let $e$ be the local image of a frame of $M$ in the cotangent construction. Its mean curvature is nonpositive.
    Chern’s norm differentiation formula makes the trace of $i partial macron(partial)
    log \( \| e \|^2 + epsilon \)$ nonnegative: the negative mean-curvature term has the required sign,
    and the derivative term is nonnegative by Cauchy–Schwarz.
    The logarithms converge locally in $L^1$, by comparison with logarithms of holomorphic coefficients.
    The resulting trace-positive current represents $- c_1 \( M \)$.
    Integrating proves $c_1 \( M \) G^(n - 1) lt.eq 0$, including possible codimension-two zeros of the injected
    frame. This retains a singular-norm proof of the degree sign independently of the constant-mean-curvature
    contradiction used above.
]

== 5 Exact source characters from the transfer theorem <inj:extremal-weights>

A source component is the fixed component whose attracting set as $t arrow.r 0$ is open.
  The following calculation gives the exact character that will be transferred;
  it also supplies the weight input to the later harmonic method.

#thm([Lemma 5.1.])[
  (The character at a source).  #emph[Let a torus $T$ act on a smooth connected projective $X$ with a linearized
    ample line. Let $U$ be a $T$-linearized line, let $lambda$ be a generic integral cocharacter with $X^lambda =
    X^T$, and let $S$ be its source. Write $mu$ for the full $T$-character of $U \|_S$.
    Every nonzero eigensection of $U$ has $lambda$-weight at most $chevron.l mu \, lambda chevron.r$.
    If $U$ is nef, every fixed-component fiber weight has pairing at most that value and, for every $m gt.eq 0$,
#[#set math.equation(numbering: n => "(10)")
 $ \[ chi_T \( X \, m U \) \]_(m mu) = chi \( S \, m U \|_S \) . $ <inj:extreme-index>]

 The trivial torus is allowed, with $S = X$ and $mu = 0$.]
] <lem:source-character>

#proof[
  Białynicki-Birula’s theorem #cite(label("BB1973")) gives positive normal $lambda$-weights at $S$.
    The first nonzero conormal jet of an eigensection subtracts a nonnegative sum of these weights from the line’s
    fiber weight, proving the section bound. For an ample line,
    generation of a sufficiently high power gives the fixed-fiber weight bound.
    Apply this to $b U + A$, for an ample linearized $A$, and let $b arrow.r oo$ to obtain the bound for nef $U$.
  To verify the full-character identity, evaluate the equivariant fixed-point formula
    #cite(label("AtiyahSegal1968")) #cite(label("AtiyahSinger1968")) at $a lambda \( t \)$ as $t arrow.r oo$,
    divide by $t^(m chevron.l mu \, lambda chevron.r)$, and keep $a$ generic in $T$.
    The inverse normal Euler factors are
  $ \( 1 - a^(- w) t^(- chevron.l w \, lambda chevron.r) e^(- x) \)^(- 1) . $
  They tend to one at $S$. Every other fixed component has a negative normal weight,
    hence an inverse factor tending to zero, and its line weight is no larger.
    Truncating in the ordinary cohomology degree gives the limit $a^(m mu) chi \( S \, m U \|_S \)$.
    Since the index is a finite Laurent polynomial, existence of this limit excludes higher $lambda$-weights.
    The limit is precisely the sum of its terms on the weight hyperplane with pairing $m chevron.l mu \,
    lambda chevron.r$; varying $a$ identifies that sum with the single character $m
    mu$ and the stated coefficient. For the trivial action the identity is immediate. ◻
]

#thm([Theorem 5.2.])[
  (Exact attainment of source characters).  #emph[Let $X$ be smooth connected projective with smoothly
    semipositive $L = - K_X$ and with $H^0 \( X \, Omega_X^p \) = 0$ for all $p > 0$.
    Let an algebraic torus $T$ act with a linearized ample bundle.
    For every generic integral cocharacter $lambda$ with $X^lambda = X^T$,
    let $S$ be its source and let $mu$ be the full $T$-character of $L \|_S$.
    Then for some $k_mu > 0$ there is a nonzero section of $k_mu L$ of character $k_mu mu$.
    In particular a positive power of $L$ has a nonzero invariant section, for the natural linearization.]
] <inj:extremal-theorem>

#proof[
  Take a generic integral cocharacter $lambda$ with $X^lambda = X^T$.
    A linearized projective embedding shows that only finitely many walls must be avoided.
    Białynicki-Birula’s attracting-cell theorem #cite(label("BB1973")) gives a unique source component $S$ with
    open attracting stratum as $t arrow.r 0$; all its normal $lambda$-weights are positive.
    Projection of that stratum to $S$ gives a dominant rational map $X arrow.r.dashed S$.
    Pullback of forms is injective and extends across the codimension-two indeterminacy locus on smooth $X$.
    Thus $S$ also has no positive-degree holomorphic forms and $chi \( S \, cal(O)_S \) = 1$.
  Let $mu$ be the full $T$-character of $L \|_S$. Apply Lemma 10 with $U = L$.
  The right side of (10) is polynomial in $m$ with value one at zero.
    For infinitely many $m > 0$, one fixed cohomological degree has a nonzero weight-$m mu$ class.
    Equivariant hard Lefschetz with coefficient $\( m + 1 \) L$ produces, for a fixed $p$, nonzero eigenforms
  $ alpha_m in H^0 \( X \, Omega_X^p ⊗ \( m + 1 \) L \) \, wide "wt" \( alpha_m \) = m mu . $
  Use an invariant Kähler form and the maximal compact torus to preserve all character spaces.
  Use the determinant construction in Lemma 6: the generic span has rank $r$,
    and its saturated determinant is a linearized line $M_0 subset and.big^r Omega_X^p$.
    Wedge forms with unbounded $m$ against $r - 1$ fixed complementary basis forms.
    If the indices in one such wedge are $m_1 \, dots.h \, m_r$, its twist degree and character are
  $ i = sum_(j = 1)^r \( m_j + 1 \) \, wide sum_(j = 1)^r m_j mu = \( i - r \) mu . $
  Thus there are sections of $M_0 + i L$ of weight $\( i - r \) mu$ for unbounded $i$.
    If $p > 0$, the cotangent tensor theorem #cite(label("LMPTX2023")) Theorem 4.1 makes $- M_0$ pseudoeffective;
    for $p = 0$, $M_0 = cal(O)_X$ as an ordinary line bundle.
    Let $P$ be $L$ with its natural linearization shifted by $- mu$,
    and let $M$ be $M_0$ with its induced linearization shifted by $r mu$.
    These changes leave the ordinary line bundles unchanged, so $- M$ is pseudoeffective in both cases above.
    The eigensections just constructed are invariant sections of $M + i P$, because
  $ \( i - r \) mu + r mu - i mu = 0 . $
  Theorem 1 yields a nonzero section
  $ v_mu in H^0 \( X \, k_mu L \) \, wide "wt" \( v_mu \) = k_mu mu \, wide k_mu > 0 $
  in the natural linearization.
  There are finitely many source weights as the generic cocharacter varies.
    Zero lies in the convex hull of the actual section weights $k_mu mu$.
    Otherwise strict separation gives a generic integral cocharacter pairing negatively with all of them.
    At its own source, the weight $mu$ is a sum of tangent weights of positive pairing,
    or the empty sum for a trivial action, contradicting strict negativity.
    The weights are integral, so a convex combination giving zero may be chosen rational.
    Clear its denominators and multiply the corresponding powers of the nonzero $v_mu$.
    The product is a nonzero invariant section in positive degree.
    For the trivial torus the same argument starts directly from $chi \( X \, cal(O)_X \) = 1$ with $mu = 0$. ◻
]

== 6 Singular injectivity and an Iitaka conversion <inj:injectivity>

The trivial-torus case of Theorem 1 already converts unbounded fixed-error sections into an anticanonical section.
  We give an independent proof using singular injectivity and vanishing for all higher direct images.
  On the Iitaka model $f : V arrow.r Y$ constructed below, with $V$ birational over $X$,
  the final interpolation retains $f_(*) cal(O)_V \( K_(V \/ X) \)$ itself.
  The character-sensitive proof instead retains a corrected base line with a fixed multiplier ideal.
  The resulting twisted-form conversion will be applied after forms descend to a finite étale cover in
  Section 14.3. The base metric need only have locally bounded plurisubharmonic weights;
  the anticanonical metric upstairs remains smooth and semipositive.

#thm([Lemma 6.1.])[
  (Injectivity and base cohomology).  #emph[Let $g : V arrow.r
    Y$ be a morphism of smooth projective complex varieties, let $A$ be very ample on $Y$,
    and give $A$ a smooth metric with positive curvature $omega_A$.
    Suppose a line bundle $N$ on $V$ has a singular Hermitian metric $h$ such that
$ cal(I) \( h \) = cal(O)_V \, wide i Theta_h \( N \) gt.eq epsilon.alt g^(*) omega_A quad
  upright("for some ") epsilon.alt > 0 . $

 Then
$ H^i \( Y \, R^j g_(*) cal(O)_V \( K_V + N \) \) = 0 wide \( i > 0 \, med j gt.eq 0 \) . $

 Disconnected smooth source varieties are allowed, with the hypotheses on each component.]
] <inj:leray>

#proof[
  The input is the injectivity theorem of Fujino–Matsumura #cite(label("FM2016")) Theorem A.
    On a compact Kähler manifold it applies to a possibly singular coefficient metric and a smooth semipositive
    multiplying line bundle $S$, provided the former curvature dominates a positive multiple of the latter.
    Multiplication by any nonzero section of $S$ is injective on canonical cohomology with the coefficient
    multiplier ideal. Here we use $S = g^(*) \( m A \)$; the comparison constant can be $epsilon.alt \/ m$,
    and the ideal is trivial.
  We include the reduction to base cohomology, following the slicing and Leray argument in #cite(label("FM2016"))
    proof of Proposition 1.9, Step 3. Induct on $dim Y$. Choose $m$ large enough for Serre vanishing for all the
    finitely many sheaves $R^j g_(*) cal(F)$, where $cal(F) = cal(O)_V \( K_V + N \)$.
    A sufficiently general divisor $C in \| m A \|$ is smooth, has smooth inverse image $V_C$,
    contains no associated point of these direct images, and contains the image of no component of $V$.
    Its restricted coefficient metric has trivial multiplier ideal.
    To see the last assertion without assuming analytic singularities,
    pull the locally integrable metric coefficients to the incidence variety of the basepoint-free system on $V$.
    That incidence variety is a projective-space bundle over $V$.
    Fubini’s theorem gives integrability on almost every smooth member,
    simultaneously on a finite coordinate cover. This full-measure condition meets the required algebraic open
    conditions. Restricting the curvature inequality on these members gives the same hypothesis over $C$.
  Adjunction and multiplication by the cutting section give
  $ 0 arrow.r cal(F) arrow.r cal(F) ⊗ g^(*) cal(O)_Y \( m A \) arrow.r
    cal(O)_(V_C) \( K_(V_C) + N \|_(V_C) \) arrow.r 0 . $
  The corresponding long direct-image sequence breaks into short exact sequences:
    multiplication by the cutting equation is injective on every $R^j g_(*) cal(F)$,
    by the associated-point choice. The induction hypothesis on $C$ and Serre vanishing for the middle terms
    therefore give $H^i \( Y \, R^j g_(*) cal(F) \) = 0$ for $i gt.eq 2$.
  The Leray spectral sequence now has only columns zero and one.
    For each $j$ it identifies $H^1 \( Y \, R^j g_(*) cal(F) \)$ with the first filtration subspace of
    $H^(j + 1) \( V \, cal(F) \)$. After the twist by $g^(*) \( m A \)$ this subspace maps to zero,
    since all positive base cohomology of the twisted direct images vanishes.
    Functoriality of the Leray filtration and Fujino–Matsumura injectivity imply that the original subspace is
    zero. This proves the remaining degree $i = 1$. ◻
]

#thm([Proposition 6.2.])[
  (Conversion on an Iitaka base).  #emph[Let $X$ be smooth connected projective over $bb(C)$ and let $L = -
    K_X$ carry a smooth semipositive Hermitian metric. Suppose that $F_0$ is a pseudoeffective line bundle and,
    for an unbounded set $S subset bb(Z)_(> 0)$, there are effective integral divisors
$ N_s tilde.op s L - F_0 wide \( s in S \) . $

 Then $H^0 \( X \, m L \) eq.not 0$ for some integer $m > 0$.]
] <inj:ordinary-conversion>

#proof[
  Fix $a < b$ in $S$. The affine relations
  #[#set math.equation(numbering: n => "(11)")
   $ \( s - a \) N_b tilde.op \( s - b \) N_a + \( b - a \) N_s wide \( s > b \) $ <inj:affine-divisors>]
  will make the fiberwise section direction unique. Put $e = kappa \( X \, N_b \)$.
    If $e = 0$, the two effective divisors in (11) are equal.
    Letting $s$ tend to infinity gives $N_b gt.eq N_a$, so $N_b - N_a tilde.op \( b - a \) L$ is effective.
    If $e = dim X$, $b L = N_b + F_0$ is big, which also proves the assertion. We treat $0 < e < dim X$.
  Resolve a multiple system of $N_b$ attaining its Iitaka dimension and take its Stein factorization.
    After modifying the base, flattening the main component, normalizing, and resolving, we have
  $ V arrow.r W arrow.r X \, wide f : V arrow.r Y \, wide f_W : W arrow.r Y . $
  Here $Y \, V$ are smooth projective, $W$ is normal projective and birational to $X$, $f_W$ is equidimensional,
    and $f$ has connected fibers. The normalization is finite and preserves the fiber-dimension bound from
    flattening; the resolution $V arrow.r W$ need not be equidimensional over $Y$.
    Equivalently the flat main component is obtained from the closure of the family of generic fibers in the
    projective Hilbert scheme #cite(label("Grothendieck1961Hilbert")) Theorem 3.2.
    Write $pi : V arrow.r X$, $L' = pi^(*) L$, and $E = K_(V \/ X) gt.eq 0$.
    For a very ample $A$ on $Y$ and some integer $t > 0$,
  $ t pi^(*) N_b - f^(*) A tilde.op G gt.eq 0 . $
  The initial moving polarization stays big after base modification,
    so it dominates the chosen $A$ after increasing $t$.
  For a geometric generic fiber $F$,
  #[#set math.equation(numbering: n => "(12)")
   $ kappa #scale(x: 120%, y: 120%)[\(] F \, \( pi^(*) N_b + E \) \|_F #scale(x: 120%, y: 120%)[\)] =
     0 . $ <inj:rigidity>]
  Indeed adding an effective exceptional divisor changes no global sections of multiples of a pullback from the
    smooth $X$. If two sections on the generic fiber were independent,
    a sufficiently large ample base twist would globalize two such sections.
    Absorb that twist using $t pi^(*) N_b gt.eq f^(*) A$, up to linear equivalence.
    Their nonconstant fiberwise ratio, together with the ratios giving the base,
    would yield image dimension at least $e + 1$ for a multiple of $pi^(*) N_b + E$.
    The geometric generic fiber is integral because the Stein field is relatively algebraically closed in
    characteristic zero. Generic base change justifies the globalization over the original function field.
    This contradiction proves (12). The same assertion holds without $E$.
  Restriction of (11) to $F$ is therefore equality of effective divisors.
    Unboundedness of $S$ shows $\( pi^(*) \( N_b - N_a \) \) \|_F gt.eq 0$.
    If $d = b - a$, a rational section $z$ of $d L$ with divisor $N_b - N_a$ is consequently regular on $F$.
    For every $k gt.eq 0$,
  #[#set math.equation(numbering: n => "(13)")
   $ h^0 #scale(x: 120%, y: 120%)[\(] F \, \( E + k d L' \) \|_F #scale(x: 120%, y: 120%)[\)] =
     1 . $ <inj:rank-one-all-k>]
  The indicated effective section gives the lower bound. For $k gt.eq 1$,
    multiply by the section of $k pi^(*) N_a + \( k - 1 \) E$ to inject into the sections of
    $k \( pi^(*) N_b + E \) \|_F$. For $k = 0$, multiply by the section of $pi^(*) N_b \|_F$.
    Equation (12) gives both upper bounds. This explicitly includes the zero exponent.
  On the normal equidimensional model $W$, take for every prime $P subset Y$ the minimum
  $ c_P = min_(Q mapsto P) frac("ord"_Q \( z \), "ord"_Q \( f_W^(*) P \)) . $
  Every vertical prime maps to a base prime and every denominator is positive.
    There are only finitely many nonzero $c_P$. Subtracting $f_W^(*) \( sum c_P P \)$ leaves an effective rational
    Cartier divisor, because the horizontal divisor of $z$ was already effective.
    Clear denominators, replacing $d \, z$ by a common power. We obtain
  #[#set math.equation(numbering: n => "(14)")
   $ d L' tilde.op H + f^(*) B \, wide H gt.eq 0 \, $ <inj:base-decomposition>]
  with $H$ pulled back from an effective Cartier divisor on $W$ and $B$ integral on $Y$.
    Above each base prime at least one component has coefficient zero in $H$.
  Proposition 4 now applies with the ordinary line $P = L$, the rational section $z$,
    and the normal equidimensional model $W$. Equation (13) supplies rank one for every $k gt.eq 0$;
    the vertical minima giving (14) agree with the proposition’s normalization.
    Hence $B$ has a continuous semipositive metric. In a local frame $b$, with $sigma = s_H f^(*) b$ and $h_0 =
    pi^(*) h_L$, its weight is
  #[#set math.equation(numbering: n => "(15)")
   $ phi.alt_B = - log max_(V_y) \| sigma \|_(h_0^d)^2 . $ <inj:max-weight>]
  Only local boundedness of this metric is needed in the following injectivity argument.
  It remains to use the zero exponent rather than merely asymptotic positivity.
    Since $F_0$ is pseudoeffective, the ample domination above gives $n L' -
    f^(*) A$ pseudoeffective for some $n > 0$. Its positive current yields a singular metric on $L'$ with
    curvature dominating a positive multiple of $f^(*) omega_A$.
    Mix its weights with the smooth semipositive weights using a sufficiently small positive coefficient.
    Skoda’s small-exponent integrability #cite(label("Demailly2011")) Lemma 5.6(a),
    in the squared-norm convention $e^(- phi.alt)$, and a finite covering of $V$ make the new multiplier ideal
    trivial while retaining a strictly positive base curvature coefficient.
    No analytic-singularity assumption is used. For $k gt.eq 0$ put $C_k = L' +
    k f^(*) B$ and add $k f^(*) phi.alt_B$ to the coefficient weights.
    Local boundedness keeps the multiplier ideal trivial and preserves the positive base-curvature lower bound.
    Since $K_V + C_k = E + k f^(*) B$, Lemma 12 and the projection formula give
  $ H^i #scale(x: 120%, y: 120%)[\(] Y \, f_(*) cal(O)_V \( E \) ⊗ cal(O)_Y \( k B \)
    #scale(x: 120%, y: 120%)[\)] = 0 quad \( i > 0 \, med k gt.eq 0 \) . $
  Riemann–Roch makes the Euler characteristic a polynomial in $k$. At $k = 0$ it equals $h^0 \( V \, E \) = 1$.
    It is therefore nonzero at some positive integer $k$. A section of $E + k f^(*) B$, multiplied by $s_H^k$,
    gives a section of $E + k d L'$. Since $pi_(*) cal(O)_V \( E \) = cal(O)_X$,
    it yields a nonzero section of $k d L$ on $X$. ◻
]

#thm([Corollary 6.3.])[
  (Twisted-form input).  #emph[Under the smooth projective and smooth anticanonical semipositivity hypotheses of
    Proposition 13, suppose $H^0 \( X \, Omega_X^p ⊗ m L \) eq.not
    0$ for an unbounded set of positive integers $m$ and a fixed $p gt.eq 0$.
    Then a positive power of $L$ has a nonzero section.]
] <inj:forms-input>

#proof[
  For $p = 0$ the assertion is immediate. Otherwise take the stable generic span of the directions of the twisted
    forms in $Omega_X^p$, of rank $r > 0$, and saturate its determinant in $and.big^r Omega_X^p
    subset \( Omega_X^1 \)^(⊗ p r)$. A saturated rank-one subsheaf of a locally free sheaf on smooth $X$ is
    reflexive and hence invertible; call it $M$. Wedge an arbitrarily far-tail member with suitable $r -
    1$ members of a fixed generic basis. This gives nonzero sections of $M + s L$ for unbounded sums $s$.
    The cotangent-tensor generic-nefness theorem #cite(label("LMPTX2023")) Theorem 4.1 applies because $-
    K_X$ is nef and proves that $- M$ is pseudoeffective. Apply the proposition with $F_0 = -
    M$ and the divisors of these sections. ◻
]

For the direct twisted-form descent in Section 14.3, the forms in this corollary must first descend to a smooth
  projective finite étale cover of the original variety. The conversion asserts ordinary sections on that cover.
  A norm then descends a section of a further positive power.
  It asserts neither equivariance of the conversion nor a uniform bound on the positive exponent.

== 7 Harmonic restriction with a continuous base metric <har:sec:harmonic>

The coefficient on the total space in the decomposition theorem below always has a smooth metric.
  Continuity enters only through a line bundle pulled back from the base.
  We give the approximation and restriction arguments because the decomposition theorem by itself is not a
  vanishing theorem.

#thm([Lemma 7.1.])[
  (Uniform smoothing).  #emph[Let $Q$ be a line bundle on a smooth projective $Y$,
    with a positive continuous Hermitian metric whose local weights are plurisubharmonic.
    For a fixed Kähler form $eta$, there are smooth metrics whose weights converge uniformly to these weights and
    whose curvatures are at least $- epsilon_j eta$, with $epsilon_j arrow.r 0$.]
] <har:lem:smoothing>

#proof[
  This is the regularized-maximum construction of Richberg #cite(label("Richberg1968"));
    see also #cite(label("Demailly2012")) Theorem I.5.21. The small negative curvature allowance permits its use
    for semipositive, rather than strictly positive, weights.
    Write a weight as a smooth reference weight plus a global continuous function $u$,
    with background curvature $gamma$. For fixed $epsilon > 0$, use background $gamma + epsilon eta$,
    so that the original potential has a strict local margin.
    On finitely many enlarged coordinate patches, add a smooth local potential of this background, convolve,
    and subtract that potential. Take inner patches which still cover $Y$.
    Add smooth bumps zero on the inner patches and a small negative constant near the outer boundaries,
    choosing their second derivatives smaller than the strict margin and the convolution errors much smaller than
    the bump heights. A regularized maximum of the active candidates is smooth:
    a candidate near its outer boundary is uniformly below a candidate from an inner patch and does not affect the
    maximum. Convexity, monotonicity, and translation equivariance of regularized maximum preserve the background
    lower bound and the transition rule for weights. Let the uniform error and then $epsilon$ tend to zero.
    Equivalently, one may smooth the strictly positive metric on $N Q + H$, with $H$ positive,
    subtract the weight of $H$, and divide by $N$. ◻
]

#thm([Theorem 7.2.])[
  (Kernel-condition vanishing).  #emph[Let $f : V arrow.r Y$ be a surjective morphism between smooth connected
    projective complex varieties. Let $D_V$ be a line bundle with a smooth semipositive Hermitian metric,
    whose curvature is $theta$. Let $Q$ be a line bundle on $Y$ with a positive continuous Hermitian metric having
    plurisubharmonic weights. Assume that on a nonempty ordinary open subset of the submersion locus,
#[#set math.equation(numbering: n => "(16)")
 $ ker theta subset.eq ker d f . $ <har:eq:kernel>]

 Then, for every $k gt.eq 0$, $q gt.eq 0$, and $p > 0$,
#[#set math.equation(numbering: n => "(17)")
 $ H^p #scale(x: 120%, y: 120%)[\(] Y \, R^q f_(*) \( K_V + D_V \) ⊗ Q^k #scale(x: 120%, y: 120%)[\)] =
   0 . $ <har:eq:vanishing>]

 In applications below $D_V$ is the pullback of a smoothly semipositive anticanonical line,
   and the particular diagram supplies (16); the rank-open condition is not inferred from nefness.]
] <har:thm:kernel>

#proof[
  Fix $k$. We will show that every nonzero cohomology class on the source restricts nontrivially to some general
    fiber. Smooth-coefficient decomposition will then give the asserted vanishing.
    Choose a Kähler form $omega$ on $V$ and a Dolbeault class $c in H^ell \( V \, K_V + A \)$, where $A = D_V +
    k f^(*) Q$ and $n = dim V$. Lemma 15 gives product metrics $h_j arrow.r h$ uniformly on $A$,
    with curvature at least $theta - o \( 1 \) omega$. Let $u_j$ be the harmonic $\( n \, ell \)$-representative
    of $c$ for $h_j$. Harmonic norm minimization, comparison with one fixed smooth closed representative,
    and uniform metric equivalence give a fixed $L^2$ bound. The Bochner–Kodaira identity gives
  #[#set math.equation(numbering: n => "(18)")
   $ parallel \( D'_j \)^(*) u_j parallel_(h_j)^2 + chevron.l \[ theta \, Lambda \] u_j \,
     u_j chevron.r_(h_j) lt.eq o \( 1 \) parallel u_j parallel_(h_j)^2 . $ <har:eq:energy>]
  Here curvature commutators in bidegree $\( n \, ell \)$ are monotone in the curvature form:
    their eigenvalues are sums of the curvature eigenvalues on the antiholomorphic index set.
  Let $v_j = * u_j$, absorbing a fixed nonzero dimensional constant so that $u_j = omega^ell and v_j$.
    The complex-linear star acts on form indices, carrying the coefficient line along.
    Metric compatibility gives $\( D'_j \)^(*) = plus.minus * macron(partial) *$ and $macron(partial)_j^(*) =
    plus.minus * D'_j *$. Thus
  $ accent(partial v, ‾)_j arrow.r 0 upright(" in ") L^2 \, wide D'_j v_j = 0 . $
  These are statements about a fixed holomorphic bundle; the first operator does not differentiate the varying
    metric. Passing to a weak $L^2$ subsequence gives a distributionally holomorphic, hence smooth holomorphic,
    $v$. Since $omega$ is Kähler, the form $u = omega^ell and v$ is $macron(partial)$-closed and represents $c$.
    Indeed projection to harmonic forms for one fixed smooth reference metric is a bounded finite-rank operator,
    has the same value on every $u_j$, and commutes with this weak limit.
    The nonnegative square root of $\[ theta \, Lambda \]$ annihilates the limit by (18).
    Pointwise diagonalization therefore shows that every positive-curvature holomorphic covector is a wedge factor
    of $v$.
  The approximation also gives a Chern equation before any use of the kernel condition.
    In any local holomorphic frame of $A$, let $h_j$ denote its squared norm.
    The equation $D'_j v_j = 0$ reads $partial \( h_j v_j \) = 0$.
    Uniform convergence of $h_j$ and weak $L^2$ convergence suffice to pass it to distributions:
  #[#set math.equation(numbering: n => "(19)")
   $ partial \( h v \) = 0 . $ <har:eq:distribution>]
  No derivative convergence of metric weights is used.
  To detect the class on a fiber, we next show that $v$ contains all base canonical covectors as wedge factors.
    On the open set in (16), every pulled-back base covector annihilates $ker theta$,
    so its wedge with $v$ vanishes. The holomorphic bundle map
  $ f^(*) Omega_Y^1 arrow.r Omega_V^(n - ell + 1) ⊗ A \, wide alpha mapsto \( d f \)^(*) alpha and v \, $
  therefore vanishes everywhere. Over the smooth fibration locus, in base coordinates $y_1 \, dots.h \, y_b$, this gives
  #[#set math.equation(numbering: n => "(20)")
   $ v = f^(*) \( d y_1 and dots.h.c and d y_b \) and w . $ <har:eq:basefactor>]
  The relative restriction $w_y$ is unambiguously defined after choosing the base canonical frame.
    If $n - ell < b$, then $v = 0$ already.
  The limiting metric is the smooth metric of $D_V$ times a positive continuous function pulled back from the
    base. Because of (20), only vertical differentiations survive in (19).
    The continuous base function is constant under these differentiations;
    the remaining expression is smooth in the vertical variables and continuous altogether.
    It vanishes pointwise and gives $D'_(D_V \| V_y) w_y = 0$ on every smooth fiber under consideration.
  The restriction in cohomology is restriction of a $\( 0 \, ell \)$-form #emph[valued in] $K_V + A$.
    Use $K_V \|_(V_y) = K_(V_y) ⊗ K_Y \|_y$ to remove the constant canonical base factor.
    It is not the ordinary pullback of an $\( n \, ell \)$-form to a lower-dimensional fiber.
    The restricted representative is a nonzero constant times
  $ omega_y^ell and w_y \, wide omega_y = omega \|_(V_y) . $
  It is harmonic on the compact smooth fiber: it is $macron(partial)$-closed,
    and its star has zero Chern derivative. Thus a nonzero $v$ gives a nonzero restriction class on some general
    fiber. The Leray edge map
  #[#set math.equation(numbering: n => "(21)")
   $ H^ell \( V \, K_V + D_V + k f^(*) Q \) arrow.r H^0 \( Y \, R^ell f_(*) \( K_V + D_V \) ⊗ Q^k \) $ <har:eq:edge>]
  is injective, since zero edge image implies zero restriction on the general smooth base-change locus.
  Finally apply Fujisawa’s derived decomposition #cite(label("Fujisawa2015")) Theorem 1,
    obtained from Takegoshi’s harmonic representatives, to the #emph[smooth] coefficient $D_V$:
  $ R f_(*) \( K_V + D_V \) tilde.eq xor.big_q R^q f_(*) \( K_V + D_V \) \[ - q \] . $
  Tensor the resulting derived isomorphism by the line $Q^k$ on $Y$ and use the projection formula. It gives
  $ h^ell \( V \, K_V + D_V + k f^(*) Q \) = sum_(p + q = ell) h^p \( Y \, R^q f_(*) \( K_V + D_V \) ⊗ Q^k \) . $
  Injection (21) bounds the left side by the summand $p = 0$. All remaining summands vanish.
    For total degrees exceeding $n$, the left side is zero directly.
    This proves every case of (17), including the twist $k = 0$. ◻
]

#prodef([Remark 7.3.])[
  (The vertical-polyvector proof).  There is a second way to obtain the restriction step,
    useful when only uniform comparability, rather than convergence of metrics, is known.
    Let $rho$ be a smooth semipositive real $\( 1 \, 1 \)$-form on $V$.
    Suppose a line $A$ has uniformly comparable smooth metrics of curvature $gt.eq c rho - epsilon_j omega$,
    where $c > 0$ is fixed and $epsilon_j arrow.r 0$, on a smooth projective $V$.
    The weak-limit argument through (18) gives a holomorphic $v in
    H^0 \( Omega_V^(n - ell) ⊗ A \)$ representing each adjoint class by $omega^ell and v$.
    Under $Omega_V^(n - ell) ⊗ A = and.big^ell T_V ⊗ \( K_V + A \)$,
    it corresponds to a holomorphic polyvector whose indices lie in $and.big^ell ker rho$.
    If $ker rho subset ker d f$ on a nonempty open, this polyvector is vertical throughout the submersion locus by
    holomorphy. Lowering its vertical indices and restricting uses exactly the induced fiber Kähler metric,
    with the canonical base factor held constant. Suppose on each general fiber there is a smooth metric on
    $A \|_(V_y)$ with curvature a positive multiple of $rho \|_(V_y)$.
    The corresponding holomorphic $\( dim V_y - ell \, 0 \)$-form $v_y$ contains all the positive-curvature
    covectors. Hence its curvature commutator is zero. Since a holomorphic form of antiholomorphic degree zero is
    $macron(partial)$-harmonic, Bochner–Kodaira gives $D' v_y = 0$. Its Lefschetz image is fiber-harmonic.
    This proves the same detection and edge injection without passing a Chern equation through the limit.
    The smooth-coefficient splitting is still a separate requirement.
] <har:rem:polyvector>

#thm([Proposition 7.4.])[
  (Pseudoeffective domination variant).  #emph[In Theorem 16,
    replace the kernel hypothesis by the assumption that $b D_V -
    f^(*) H$ is pseudoeffective for some $b > 0$ and some ample line $H$ on $Y$. Then the same vanishing holds.]
] <har:prop:dominationvanish>

#proof[
  Keep the uniformly convergent metrics and the notation of the proof of Theorem 16. For $ell > 0$, put
  $ S = i^(\( n - ell \)^2) h thin v and overline(v) \, wide T = S and omega^(ell - 1) \, $
  with coefficient pairing understood. The distributional Chern equation and holomorphy make $T$ a continuous
    closed positive $\( n - 1 \, n - 1 \)$-form. The curvature-energy equality gives $theta and T = 0$.
    Choose a positive curvature form $eta$ of $H$. A positive current in the class of $b D_V -
    f^(*) H$ pairs nonnegatively with $T$, since positive currents have order zero.
    To compute this pairing cohomologically, apply de Rham regularization, which commutes with $d$,
    to approximate $T$ uniformly by smooth closed forms. For each approximant the pairing agrees with that against
    the cohomologous smooth form $b theta - f^(*) eta$; uniform convergence passes this equality to $T$. It follows that
  $ 0 lt.eq integral_V \( b theta - f^(*) eta \) and T = - integral_V f^(*) eta and T lt.eq 0 . $
  Pointwise positivity forces $f^(*) eta and T = 0$; diagonalization gives the full base wedge factor in $v$.
    The distributional fiber equation, canonical-valued restriction, edge injection,
    and smooth-coefficient splitting proceed exactly as in that proof.
    Only positive total degrees are needed to kill a term of positive base degree. ◻
]

#thm([Proposition 7.5.])[
  (Euler interpolation on a birational model).  #emph[Let $pi : V arrow.r
    X$ be birational between smooth connected projective varieties, let $L = - K_X$ be smoothly semipositive,
    put $D_V = pi^(*) L$, and write $E = K_(V \/ X) = K_V + D_V$.
    Let $f : V arrow.r Y$ be surjective, with $Y$ smooth connected projective.
    Suppose a continuously semipositive line $Q$ on $Y$ and an injection $f^(*) Q arrow.r b D_V$, $b > 0$,
    satisfy either vanishing criterion above. Then $H^0 \( X \, k b L \) eq.not 0$ for some $k > 0$.
    If a torus acts, trivially on $Y$ and $Q$, and all maps and the injection are equivariant,
    this section can be taken invariant.]
] <har:prop:euler>

#proof[
  Let $cal(G) = f_(*) cal(O)_V \( E \)$, or its invariant summand in the equivariant case.
    A torus over a trivially acted-on base has coherent weight summands, so this is a direct summand.
    Vanishing gives $h^0 \( Y \, cal(G) ⊗ Q^k \) = chi \( Y \, cal(G) ⊗ Q^k \)$ for every $k gt.eq 0$.
    The right side is polynomial in $k$ by Riemann–Roch for coherent sheaves. At zero it is one:
    $pi_(*) cal(O)_V \( E \) = cal(O)_X$ and the exceptional canonical section is invariant.
    The polynomial is therefore nonzero at some positive integer.
    Multiply the resulting section of $E + k f^(*) Q$ by the $k$-th power of the injection and push through $pi$.
    The effective exceptional divisor $E$ changes neither sections nor their characters, by normality of $X$. ◻
]

== 8 Invariant Euler nonvanishing by a fixed invariant system <har:sec:eulerroute>

We now give a harmonic proof of Corollary 7. Starting with the determinant sections,
  we choose the base from powers of one fixed invariant line.
  Maximality of its image will force the invariant adjoint spaces on the generic fiber to have rank one.
  The determinant intersection identity will supply the curvature-kernel condition.
  Together these properties give the continuously semipositive base line and the vanishing at twist zero required
  by Proposition 19. The premise here is the nonzero invariant Euler characteristic;
  vanishing of every higher structure-sheaf cohomology group is not required.

#proof[
  #emph[Harmonic proof of Corollary 7.] Use Lemma 6, retaining the cases which did not already produce a section,
    and write $N_i = M + a_i L$, $s_i$ for its invariant sections.
    Write $n = dim X$, let $theta$ be the averaged smooth semipositive curvature, let $r$ be its maximal rank,
    and fix a Kähler form $omega$. Choose indices $a_(-) < a$ and keep unbounded indices above $a$.
    Put $N = M + a L$. Among rational maps given by all invariant sections of positive powers of $N$,
    choose one with maximal image dimension. Resolve its base ideal equivariantly and take Stein factorization.
    We obtain a smooth projective $X_0$, a birational $pi_0 : X_0 arrow.r X$, and $f_0 : X_0 arrow.r
    Y_0$ with connected fibers and normal projective base, with
  #[#set math.equation(numbering: n => "(22)")
   $ d pi_0^(*) N = f_0^(*) H_0 + G_0 \, wide G_0 gt.eq 0 \, $ <har:eq:iitaka>]
  where $H_0$ is ample. The torus acts trivially on $Y_0 \, H_0$, and the defining section of $G_0$ is invariant.
  The invariant sections of $j pi_0^(*) N$ on the generic fiber form a one-dimensional vector space over
    $bb(C) \( Y_0 \)$ for every $j > 0$. Indeed finitely many generic-fiber sections extend rationally with
    vertical poles. A section of a sufficiently high power of $H_0$ clears those poles;
    multiplication by the corresponding power of the section of $G_0$ gives invariant sections of a higher power
    of $pi_0^(*) N$, and hence of $N$ on $X$. If two original sections were independent,
    their ratio would not lie in $bb(C) \( Y_0 \)$. This field is relatively algebraically closed by Stein
    factorization, so that ratio would be transcendental over it.
    Combine it with the original image coordinates, by products to put all ratios in one power.
    The image dimension increases, contradicting maximality.
  For each $a_i > a$ there are positive integers $p \, q$ such that $p a_i + q a_(-) = \( p + q \) a$.
    The invariant section $s_i^p s_(-)^q$ is thus generically proportional to $s_a^(p + q)$.
    Its effective generic-fiber divisor shows that all horizontal components of $"div" \( pi_0^(*) s_i \)$ lie in
    the fixed finite support of $"div" \( pi_0^(*) s_a \)$. Extract a subsequence of their integer multiplicity
    vectors that is componentwise nondecreasing. For two indices $a_j > a_i$ in it, put
  $ b = a_j - a_i > 0 \, wide s = pi_0^(*) s_j \/ pi_0^(*) s_i . $
  This is an invariant rational section of $b pi_0^(*) L$, regular on the generic fiber.
    The relative canonical divisor $E_0 = K_(X_0 \/ X)$ has its horizontal support in the same fixed support:
    $pi_0$ can be chosen to be an isomorphism outside the invariant base ideal,
    which lies in the zero locus of $s_a$. Fix $k gt.eq 0$, and work on the generic fiber.
    The effective divisors of $s_(E_0)$ and $s$ have support in the divisor of $pi_0^(*) s_a$.
    All coefficients are finite, so a sufficiently large integer $h$ satisfies
  $ h "div" \( pi_0^(*) s_a \) gt.eq "div" \( s_(E_0) \) + k "div" \( s \) . $
  The quotient $\( pi_0^(*) s_a \)^h \/ \( s_(E_0) s^k \)$ is therefore a regular invariant section of the
    difference line. Multiplication by it injects the entire invariant adjoint section space into the
    one-dimensional invariant space for $h pi_0^(*) N$. Consequently
  #[#set math.equation(numbering: n => "(23)")
   $ dim_(bb(C) \( Y_0 \)) H^0 \( \( X_0 \)_eta \, E_0 + k b pi_0^(*) L \)^T =
     1 wide \( k gt.eq 0 \) . $ <har:eq:invrank>]
  If $dim Y_0 = 0$, the section $s$ is already regular on $X_0$ and descends to the required section on $X$.
  Otherwise apply Lemma 3 to this fibration and resolve its normal equidimensional model:
  $ V arrow.r W arrow.r X_0 \, wide g : W arrow.r Y \, wide f : V arrow.r Y . $
  Write $mu : W arrow.r X$ and $pi : V arrow.r X$ for the composed birational maps.
    We also use $f_0$ for its pullback to $V$. Here $Y$ is smooth projective,
    $W$ is normal equidimensional over $Y$, and $V$ is smooth.
    All constructions are equivariant, with trivial base action. The ranks (23) persist:
    a further effective birational canonical divisor has trivial pushforward also on the generic smooth fiber.
  It remains to relate this algebraic fibration to the curvature.
    The kernel condition for $D_V = pi^(*) L$ follows from Lemma 8 and (22). If $r < n$,
  $ integral_V \( pi^(*) theta \)^r and f_0^(*) eta_(H_0) and \( pi^(*) omega \)^(n - r - 1) = 0 . $
  Indeed the whole class $d N$ has zero intersection, and both the moving and effective fixed parts have
    nonnegative intersection. On an ordinary open where $pi$ is an isomorphism, $theta$ has rank $r$,
    and the base-to-image map has injective differential, positivity forces the horizontal form to annihilate $ker
    pi^(*) theta$. Its kernel there is $ker d f$. Thus $ker pi^(*) theta subset ker d f$.
    These algebraic generic conditions meet the nonempty ordinary maximal-rank open.
    For full curvature rank the kernel inclusion holds directly.
  Proposition 4 normalizes $s$ to $g^(*) Q arrow.r b mu^(*) L$, with effective zero divisor $G$,
    and gives a continuous semipositive metric on $Q$. Theorem 16 and Proposition 19 now produce an invariant
    section of a positive power of $L$. ◻
]

=== 8.1 An alternative proof that the maximum stays positive <an-alternative-proof-that-the-maximum-stays-positive>

The preceding proof is complete. We record a second argument for the positivity of the fiberwise maximum on its
  model. Instead of extending the maximum weight across a codimension-two set,
  we first prove nefness by stabilizing the sheaves of allowed poles.
  Blowing up a hypothetical zero fiber then contradicts nefness.
  This argument uses harmonic vanishing and is independent of the maximum-principle step in Proposition 4.

#thm([Proposition 8.1.])[
  (Pole-sheaf stabilization on the invariant Iitaka model).  #emph[Let $V arrow.r W arrow.r X$, $g : W arrow.r Y$,
    $f : V arrow.r Y$, and $D_V = pi^(*) \( - K_X \)$ be the normal equidimensional model and smooth resolution in
    the preceding invariant Iitaka construction. Put $E = K_(V \/ X)$.
    Retain its invariant adjoint rank-one condition (23) and its curvature-kernel inclusion, and write $b D_V =
    G + f^(*) Q$ after vertical normalization, with $G$ pulled back from the normal model and omitting a
    divisorial lift of each base prime. Then the increasing invariant pole sheaves
    $cal(P)_k = \( f_(*) cal(O)_V \( E + k G \) \)^T$, viewed as rational functions through $s_E s_G^k$,
    stabilize. The line $Q$ is nef and $G$ contains no entire fiber.
    These conclusions give a second proof that the fiberwise maximum defines a positive continuous metric.]
] <har:prop:pole-stabilization>

#proof[
  On $V$, form
  $ cal(P)_k = \( f_(*) cal(O)_V \( E + k G \) \)^T wide \( k gt.eq 0 \) \, $
  viewed as sheaves of rational functions on $Y$ by division by $s_E s_G^k$.
    They have rank one, contain $cal(O)_Y$, and increase with $k$.
    For each prime $P$ of $Y$, take a lift $Gamma$ omitted by $G$. Regularity of $f^(*) a thin s_E s_G^k$ gives
  $ "ord"_Gamma \( f^(*) P \) "ord"_P \( a \) + "ord"_Gamma E gt.eq 0 . $
  The possible poles are therefore bounded independently of $k$ by one divisor $C$.
    Normality embeds all $cal(P)_k$ into $cal(O)_Y \( C \)$, so Noetherianity gives a stable value $cal(P)_oo$.
  Take a very ample $H$ on $Y$. Apply Theorem 16, with trivial base twist,
    to the smooth coefficient $\( 1 + k b \) D_V + l f^(*) H$, $k \, l gt.eq 0$.
    Its curvature dominates the original curvature, so its kernel is still vertical on the same open set.
    Since its adjoint line is $E + k G + f^(*) \( k Q + l H \)$,
    projection to invariants and the projection formula give
  $ H^i \( Y \, cal(P)_k ⊗ \( k Q + l H \) \) = 0 wide \( i > 0 \) . $
  For large $k$, Castelnuovo–Mumford regularity makes $cal(P)_oo ⊗ \( k Q + \( dim Y \) H \)$ globally generated.
    Pull back to the normalization of any curve and remove torsion.
    The fixed sheaf has positive rank, so its degree plus $k$ times that rank times $deg
    Q$ is nonnegative for unbounded $k$. Thus $Q$ is nef.
  If $G$ contained the entire fiber over $y in Y$, blow up $y$ (the curve case is already excluded by
    normalization). The normalized main transform remains equidimensional because it lies in a base change with
    the same fiber-dimension upper bound. Recompute the vertical minima on this model.
    The new rational base divisor is the pullback of $Q$ plus a strictly positive multiple of the exceptional
    divisor: every divisorial lift of its generic point lies over the old fiber and therefore has positive order
    in the pulled-back $G$. The rank and kernel arguments just given still apply,
    so the new divisor is nef after clearing denominators. Its degree on a line in the exceptional projective
    space is negative, a contradiction. Hence no entire fiber lies in $G$.
    Properness and openness give a positive continuous maximum,
    and the moment calculation (2) proves semipositivity without the codimension-two extension argument.
    This gives the same conclusion by a distinct pole-sheaf stabilization proof. ◻
]

== 9 Two invariant fields giving the harmonic diagram <har:sec:fields>

The preceding proof chooses a base from powers of one fixed line. Here we give two alternatives.
  In the first, finite rank of the linearized Picard group controls the horizontal divisors of the determinant
  sections. In the second, equal-degree products force their horizontal orders to be affine in the exponent.
  Both produce a relative anticanonical section, rank-one invariant adjoint spaces,
  and a vertical curvature kernel, so that Propositions 4 and 19 apply.

Throughout this section assume $H^i \( X \, cal(O)_X \) = 0$ for $i > 0$,
  and let $T$ act algebraically on the smooth connected projective $X$.
  Put $n = dim X$ and $L = - K_X$, choose a compact-torus-invariant smooth semipositive metric,
  and write $theta$ for its curvature and $r$ for its maximal rank. Apply Lemma 6.
  If it already produces an invariant anticanonical section, there is nothing to construct;
  this includes the full-rank case. Otherwise write its determinant sections as $s_i in H^0 \( X \, N_i \)^T$,
  where $N_i = M + a_i L$ and $a_i arrow.r oo$. Lemma 8 gives their zero intersection with
  $\[ theta \]^r \[ omega \]^(n - r - 1)$. If $r = 0$, their effective zero divisors have zero Kähler degree and
  hence vanish; a ratio of two sections gives the conclusion directly. We therefore work with $0 < r < n$.

=== 9.1 Invariant functions with curvature-null poles <har:subsec:small>

Call a prime divisor small if $theta^r$ vanishes on its smooth locus.
  An effective divisor has small support exactly when its intersection with
  $\[ theta \]^r \[ omega \]^(n - r - 1)$ vanishes. Smallness persists under pullback to smooth birational models
  and for exceptional divisors centered in small supports. To see this even over a singular locus,
  resolve the original prime, take a dominating component of the fiber product with the proposed source,
  and test the pulled-back form on a smooth dominating space; continuity extends its zero identity.

Let $cal(K)$ consist of zero and the invariant rational functions with small pole support. It is a field:
  sums and products introduce no new pole support, while zeros and poles of a rational function are linearly
  equivalent effective divisors, so the zero support is small whenever the pole support is.
  This also handles inversion. It is a finitely generated intermediate field in $bb(C) \( X \)$.
  Explicitly, take a transcendence basis of $cal(K)$, extend it to one of $bb(C) \( X \)$,
  and note that adjoining the complementary independent variables preserves the degrees of finite algebraic
  subextensions. The finite degree of the full function field over the larger purely transcendental field bounds
  those degrees, making the algebraic part finite.

Use finitely many generators to map to a product of projective lines, take the image $Y_0$,
  and resolve equivariantly: $pi_0 : X_0 arrow.r X$, $f_0 : X_0 arrow.r Y_0$. The base action is trivial.
  Indeterminacy lies in the small pole supports, so the resolution may be chosen to be an isomorphism off them.
  The exceptional canonical divisor $E_0$ is small. A pullback of an ample line $H_0$ on $Y_0$ has a small
  effective representative, built from the pole divisors of the generators and exceptional corrections.

The choice of field now controls horizontal divisors. There are only finitely many invariant small primes on $X_0$
  horizontal over $Y_0$. Indeed $"Pic"^0 \( X_0 \) = 0$ by birational invariance,
  and the kernel of the linearized Picard group over the ordinary Picard group consists of characters.
  Thus the linearized Picard group has finite rank. Infinitely many such primes would give,
  after clearing torsion, a nonzero integral relation among their natural linearized divisor lines.
  The corresponding quotient of canonical divisor sections is an invariant rational function whose divisor is that
  nonzero horizontal combination. Its poles downstairs are small, so it belongs to $cal(K) = bb(C) \( Y_0 \)$.
  But a function pulled back from $Y_0$ has vertical divisor, a contradiction.

The determinant divisors chosen above are small by Lemma 8,
  so their horizontal supports belong to this finite set. Order the multiplicities along an infinite subsequence
  and take a ratio. We obtain an invariant rational section $s$ of $b pi_0^(*) L$, $b > 0$,
  regular on the generic fiber. For every $k gt.eq 0$, both

$ \( f_(0 *) cal(O)_(X_0) \( k b pi_0^(*) L \) \)^T \, wide \( f_(0 *) cal(O)_(X_0) \( E_0 + k b pi_0^(*) L \) \)^T $

have rank one. They contain $s^k$ and $s_(E_0) s^k$. Any other invariant generic section has its vertical poles
  cleared by a power of $H_0$. Its effective zero divisor is small,
  since its class has zero intersection with the semipositive test forms, using smallness of $E_0 \,
  H_0$ and $theta^(r + 1) = 0$. The ratio of two such sections therefore has small poles and is in $cal(K)$.
  They are dependent over the base field, as required.

The kernel condition has a direct differential proof. Every level divisor of a generating function is small.
  At a regular level point in the rank-$r$ open, its tangent hyperplane must contain $ker theta$:
  a hyperplane not containing that kernel would surject onto the rank-$r$ quotient,
  so $theta^r$ would not vanish on it. Thus $ker theta subset ker d f_0$ on a nonempty ordinary open.
  After an equidimensional normal model and a smooth resolution, all these properties persist.
  Proposition 4 gives the continuous base metric and Proposition 19 gives an invariant anticanonical section.
  No separate relative-algebraic-closure assumption on the small-pole field is needed.
  The invariant adjoint rank at $k = 0$ already forces geometric connectedness of the generic fiber,
  as explained in Proposition 4.

=== 9.2 Ratios from a semigroup of determinant lines <har:subsec:semigroup>

Retain the hypotheses and determinant sections fixed at the start of the section.
  This time we impose all equal-degree ratios at once; their relations will give a relative section without first
  listing the horizontal primes. Form the semigroup of linearized line bundles generated by the $N_i$,
  and the field generated by ratios of invariant sections of the same semigroup element.
  Choose a transcendence basis among these ratios. Products put their numerators and denominators into one
  invariant linear system of a semigroup element $N_0$. Normalize its image in the relative algebraic closure of
  its function field in $bb(C) \( X \)$, and resolve the base to obtain $Y$.
  Every original ratio is algebraic over the chosen transcendence basis,
  so belongs to this finite relative algebraic closure. The connected torus acts trivially on it:
  it fixes the smaller field and has no nontrivial finite quotient. Thus the base action is trivial.

After the Hilbert-family modification, take the normal equidimensional main graph $W arrow.r
  Y$ and its smooth resolution $V$. Write $pi : V arrow.r X$, $f : V arrow.r Y$, $D_V = pi^(*) L$, $E =
  K_(V \/ X)$. The pullback $A$ of the image hyperplane bundle to $Y$ is big,
  and the common factor of the pulled-back coordinates is regular,
  giving an invariant effective difference $pi^(*) N_0 - f^(*) A$. Hence for an ample $H$ on $Y$,

#[#set math.equation(numbering: n => "(24)")
 $ a pi^(*) N_0 - f^(*) H quad upright("is invariantly effective for some ") a > 0 . $ <har:eq:absorb>]

The intersection identity of Lemma 8 for every $N_i$, and hence $N_0$,
  forces the intersection of $f^(*) A$ with $\( pi^(*) theta \)^r \( pi^(*) omega \)^(n - r - 1)$ to vanish.
  Where the map to the image has maximal rank this proves the kernel condition,
  by the same positive-semidefinite linear algebra used above.

For every semigroup element $N$ and integer $e gt.eq 0$,

$ dim_(bb(C) \( Y \)) H^0 \( V_eta \, pi^(*) N + e E \)^T lt.eq 1 . $

If two generic sections were independent, twist their invariant direct image by a sufficiently ample base line,
  obtain global invariant sections, and absorb that twist with (24).
  Since $pi_(*) cal(O)_V \( e E \) = cal(O)_X$, this gives invariant sections of a semigroup element whose ratio
  is not in $bb(C) \( Y \)$, contradicting its construction.

Let $F_i$ be the horizontal divisor of $pi^(*) s_i$. For $a_i < a_j < a_h$, positive integers $u \,
  v$ with $u a_i + v a_h = \( u + v \) a_j$ yield two nonzero invariant generic sections of the same line.
  Their ratio is constant on the generic fiber, so $u F_i + v F_h = \( u + v \) F_j$.
  Consequently $F_i$ is affine in $a_i$. Its slope is effective because $F_i gt.eq 0$ and $a_i arrow.r oo$.
  The ratio $s = pi^(*) s_2 \/ pi^(*) s_1$, of degree $b = a_2 - a_1 > 0$, therefore has no horizontal poles. In fact

$ dim_(bb(C) \( Y \)) H^0 \( V_eta \, k b D_V + e E \)^T = 1 quad \( k \, e gt.eq 0 \) . $

The displayed section $s^k s_E^e$ gives the lower bound. For the upper bound choose $i$ large enough that $F_i -
  k \( F_2 - F_1 \) gt.eq 0$. Multiplication by $pi^(*) s_i \/
  s^k$ embeds the space into the preceding rank-at-most-one space for $N_i + e E$.
  If the base is a point, $s$ is already globally regular. Otherwise Propositions 4 and 19 finish this route.
  The stronger all-$e$ generic-rank statement is retained here; only $e = 1$ is needed for the metric and transfer.

== 10 Extremal weights and a dominated base <har:sec:extremal>

This route uses a source component for a one-parameter action rather than the invariant index.
  It applies to a smooth projective rationally connected $S$ with smoothly semipositive $L = - K_S$.
  The final product argument will give invariance under an entire algebraic torus.
  The source-character theorem of Section 5 already gives this conclusion under weaker hypotheses.
  Here the purpose is to obtain the character by harmonic vanishing:
  we construct a base dominated by $L$, then retract that base to its source so that Euler interpolation takes
  place in one specified weight.

#thm([Lemma 10.1.])[
  (Source weights and retraction).  #emph[Let $S$ be smooth connected projective with a $bb(C)^(*)$-action,
    allowing the trivial action. Let $S_0$ be its attracting component for $t arrow.r 0$,
    and write $w_C \( U \)$ for the fiber weight of a linearized line $U$ on a fixed component $C$.
    A nonzero eigensection of $U$ has weight at most $w_(S_0) \( U \)$.
    If $U$ is nef, then $w_C \( U \) lt.eq w_(S_0) \( U \)$ for every fixed component,
    and the multiplicity of weight $m w_(S_0) \( U \)$ in the virtual character $chi \( S \, m U \)$ is
    $chi \( S_0 \, m U \|_(S_0) \)$, for $m > 0$. If $U$ is nef, on a smooth equivariant resolution $d :
    hat(S) arrow.r S$ of the source retraction $p : hat(S) arrow.r S_0$,
    there is an equivariant nonzero bundle map $p^(*) \( U \|_(S_0) \) arrow.r d^(*) U$.]
] <har:lem:source>

#proof[
  An ample line has a linearized positive power for a projective $bb(C)^(*)$-action.
    Indeed the action’s map to the Picard variety is constant,
    since a torus has no nonconstant homomorphism to an abelian variety.
    The pairs consisting of an element and an isomorphism from the pulled-back line to the line form an algebraic
    extension of $bb(C)^(*)$ by the scalar $bb(C)^(*)$; this extension is a torus and splits.
    This supplies the needed linearization. The section-weight bound, the comparison of fixed weights,
    and the index formula are Lemma 10 for $T = bb(C)^(*)$ and $U$ as given.
    The source retraction itself is the attracting-cell map of #cite(label("BB1973")).
    The additional assertion needed by the harmonic construction is its bundle map, which we now prove.
  For the bundle map, identify the generic fibers of $U$ and its restriction at the source by transporting a
    vector along an orbit, dividing by $t^(w_(S_0) \( U \))$, and taking the limit.
    The orbit extension over $bb(A)^1$, over the relevant function field,
    pulls the line back to an equivariantly trivial line of that weight.
    This constructs a multiplicative rational identification, hence the claimed rational map.
    If $U$ is ample, a generated power has enough source-weight sections to generate its restriction to $S_0$.
    Their pulled-back restrictions map to the original sections by the limit construction,
    proving absence of poles. For nef $U$, a negative order in the rational map would give a negative order for $k
    U + H$ for large $k$, contrary to ampleness. This proves regularity along every prime divisor and hence
    everywhere by normality. The trivial action has $S_0 = S$ and the identity map. ◻
]

#thm([Proposition 10.2.])[
  (Attainment of the source weight).  #emph[Let $S$ be smooth connected projective rationally connected,
    with smoothly semipositive $L = - K_S$, and fix a $bb(C)^(*)$-action with the natural anticanonical
    linearization. If $w = w_(S_0) \( L \)$, then some $ell > 0$ has a nonzero section of $ell L$ of weight $ell w$.]
] <har:prop:extremal>

#proof[
  #emph[Determinant sections with a prescribed weight.] A point is immediate.
    Otherwise $S_0$ is rationally connected, being a smooth rational image of $S$.
    Thus $chi \( S_0 \, cal(O)_(S_0) \) = 1$. The highest-weight index in Lemma 21 is a nonzero polynomial in $m$,
    so for unbounded $m$ a fixed group $H^q \( S \, m L \)$ contains weight $m w$.
    The smooth coefficient Lefschetz map is equivariant for a circle-invariant Kähler form. It gives twisted sections
  $ v_m in H^0 \( S \, Omega_S^(dim S - q) ⊗ \( m + 1 \) L \) = H^0 \( S \, and.big^q T_S ⊗ m L \) $
  of weight $m w$. For $q = 0$ they are the desired sections.
    Otherwise saturate their generic span in $and.big^q T_S$, of rank $e > 0$, and call it $cal(U)$.
    The determinant extraction used earlier gives nonzero eigensections
  #[#set math.equation(numbering: n => "(25)")
   $ d_i in H^0 \( S \, det cal(U) + k_i L \) \, wide "wt" \( d_i \) = k_i w \, wide k_i arrow.r
     oo . $ <har:eq:detweights>]
  If $D_i$ is the zero divisor, we claim
  $ e L - c_1 \( cal(U) \) upright(" pseudoeffective") \, wide \( e + k_i \) L - D_i upright(" pseudoeffective") . $
  For $q = dim S$, saturation gives $cal(U) = and.big^(dim S) T_S = L$ and $e = 1$, so $e L - c_1 \( cal(U) \) =
    0$ directly. For $0 < q < dim S$, the cotangent-subsheaf theorem #cite(label("LMPTX2023")) Theorem 4.1
    applies: $cal(U) ⊗ \( - L \) subset Omega_S^(dim S - q)$,
    and exterior powers are direct summands of tensor powers in characteristic zero;
    saturating can only add an effective determinant correction in the required direction.
  #emph[A base on which dominated systems become rigid.] Call a divisor class dominated if a positive multiple of
    $L$ minus it is pseudoeffective. Maximize the image dimension of linear systems of dominated effective
    integral divisors, and choose a full system $\| P_0 \|$ realizing this maximum.
    Rational connectedness gives $"Pic"^0 \( S \) = 0$, so the system may be linearized and taken equivariantly.
    Resolve its graph, take Stein factorization, flatten by the Hilbert-family construction,
    resolve the base and normalize the main component. We obtain
  $ V arrow.r W arrow.r S \, wide g : W arrow.r Y \, $
  with smooth projective $V \, Y$, normal equidimensional $W$, and connected fibers.
    Write $f : V arrow.r Y$, $mu : V arrow.r S$, $A = mu^(*) L$, $E = K_(V \/ S)$,
    and let $L_W$ be the pullback of $L$ to $W$. An ample pullback from $Y$ is dominated:
    the original moving polarization is dominated, and its pullback to a birational base model is big,
    hence dominates a small ample class. Also $E$ is dominated.
    Horizontal exceptional primes have centers in the original base locus and are bounded by pullbacks of divisors
    in $\| P_0 \|$; vertical primes are bounded by sufficiently ample base pullbacks.
    These statements prove domination of the whole finite effective canonical discrepancy.
  A line $B$ on $V$ is dominated when $c A - B$ is pseudoeffective for some $c > 0$.
    No such line can have two independent sections on the generic fiber.
    If it did, tensor by a sufficiently ample base pullback to globalize them.
    This new line remains dominated because the base polarization is dominated.
    Combine their ratio with the original base coordinates, using products to put all coordinates in a single
    linear system. Its line is still dominated. Push the effective system and its pseudoeffective domination
    relation down to $S$. The new ratio is nonconstant along the generic fiber,
    so the image dimension exceeds the chosen maximum, a contradiction.
    In particular generic-fiber sections of both $j a A$ and $E +
    j a A$ have dimension at most one for every $a \, j > 0$, and the same adjoint assertion for $j =
    0$ follows from domination of $E$.
  There are only finitely many dominated horizontal primes on $V$.
    Here $"Pic"^0 \( V \) = 0$, since $V$ is birational to the rationally connected $S$.
    Thus its Picard group has finite rank. Infinitely many dominated horizontal primes would give,
    after clearing torsion, a nontrivial integral linear equivalence among them.
    Splitting positive and negative coefficients gives two effective divisors in the same class and a pencil
    varying along the generic fiber, contrary to the preceding paragraph.
    The pullbacks of $D_i$ therefore have horizontal supports in a fixed finite set.
    Order their multiplicities along a subsequence. A ratio from (25) gives a rational eigensection $s$ of $a
    L_W$, weight $a w$, with no horizontal poles.
  #emph[The metrized base line and its source weight.] Divisorial normalization, as in Proposition 4, gives
  #[#set math.equation(numbering: n => "(26)")
   $ g^(*) Q arrow.r a L_W \, $ <har:eq:weightbase>]
  with effective zero divisor omitting one lift over every base prime.
    Shift the linearization of $Q$ to make this map equivariant.
    Since the canonical exceptional section times $s^j$ is nonzero generically,
    all required adjoint ranks are exactly one. The maximum construction gives a continuous semipositive metric on
    $Q$. Here the base action may be nontrivial, but full rank one is available and the ordinary direct-image line
    theorem applies without taking an invariant summand.
  We must still control the character produced by interpolation on the base.
    Let $Y_0$ be the source of its induced action. The original unbounded eigensections imply
  #[#set math.equation(numbering: n => "(27)")
   $ w_(Y_0) \( Q \) gt.eq a w . $ <har:eq:weightinequality>]
  After fixing $a$, take an infinite subsequence of $k_i$ in one residue class modulo $a$,
    still ordered horizontally. Divide by its first section. The resulting eigensections of $j a L_W$,
    for unbounded $j$, have weight $j a w$, no horizontal poles and vertical poles bounded by one fixed divisor.
    Clear these poles by an invariant effective Cartier divisor $C$ on $Y$,
    with its canonical section of weight zero. Generic rank one and the map (26) show that each resulting section
    comes from $j Q + C$. It has no residual poles: at a base prime test on a lift omitted by the zero divisor of
    (26). The source upper bound gives $j a w lt.eq j w_(Y_0) \( Q \) + w_(Y_0) \( C \)$.
    Divide by $j$ and pass to the unbounded subsequence to obtain (27).
  #emph[Euler interpolation on the source of the base.] The continuous semipositive metric makes $Q$ nef by
    Lemma 15. Resolve the source retraction of $Y$ and dominate this resolution by a smooth model $V'$ of $V$.
    Let $p : V' arrow.r Y_0$, $mu' : V' arrow.r S$, $A' = mu' ""^(*) L$, $E' = K_(V' \/ S)$, and $Q_0 =
    Q \|_(Y_0)$. Lemma 21 and (26) give $p^(*) Q_0 arrow.r a A'$. An ample pullback by $p$ is dominated by $A'$:
    the pullback of the original ample base polarization is big on the resolution of $Y$,
    and hence dominates an ample class there, which in turn dominates an ample pullback from $Y_0$.
    Proposition 18 applies to every twist $j Q_0$, including zero.
    The action on $Y_0$ is trivial, and $Q_0$ has the constant fiber weight $w_(Y_0) \( Q \)$.
    Let $cal(B)$ be the weight-zero summand of $p_(*) cal(O) \( E' \)$.
    Thus sections of $cal(B) ⊗ Q_0^j$ have precisely weight $j w_(Y_0) \( Q \)$.
    Vanishing identifies their dimension with the Euler polynomial for every $j gt.eq 0$.
    At zero this polynomial is positive, because the canonical exceptional section is invariant.
    For some $j > 0$ we therefore obtain a nonzero section of $E' + j p^(*) Q_0$ of that weight.
    Map it into $E' + j a A'$ and push down to $S$. Its weight is at least $j a w$ by (27),
    and at most $j a w$ by the source bound on $S$. Equality gives the required extremal section. ◻
]

#thm([Corollary 10.3.])[
  (From extremal characters to invariants).  #emph[Every algebraic torus acting on the rationally connected $S$ of
    Proposition 22 has a nonzero invariant section of some positive power of $- K_S$.]
] <har:cor:torus>

#proof[
  For a generic integral one-parameter subgroup $lambda$, its source $C$ is a torus-fixed component with all
    normal weights positive on $lambda$. Denote by $gamma_C$ the fiber character of $L$.
    Choose a full torus eigenvector in the extremal section space of Proposition 22.
    It cannot vanish on $C$, since a nonzero leading conormal jet would strictly lower its $lambda$-weight.
    Its character is therefore $ell gamma_C$. The finitely many characters of such sources have convex hull
    containing zero. Otherwise a separating functional, approximated by a generic rational one,
    would be negative on all of them, whereas the source for that one-parameter subgroup has
    $gamma_C \( lambda \) > 0$, the sum of its positive normal weights.
    Use the effective torus quotient if the action has a kernel; a trivial action is already covered.
    A rational convex combination of the source characters is zero.
    Clear its denominators and the finitely many section exponents,
    then multiply the corresponding powers of their nonzero eigensections.
    On the integral variety this product is nonzero and invariant. ◻
]

== 11 The curvature-kernel field and a reduced flat alteration <har:sec:alteration>

This construction converts ordinary cohomology on $X$ itself; in the descent application,
  $X$ will be a finite étale cover. It does not require $"Pic"^0 = 0$.
  Its alteration is genuinely generically finite. We will explicitly descend the resulting metrized base line to
  birational models of the original function field.

#thm([Theorem 11.1.])[
  (Ordinary conversion through a curvature-null field).  #emph[Let $X$ be smooth connected projective,
    with smoothly semipositive $L = - K_X$. Suppose that for one fixed $q gt.eq 0$,
    $H^q \( X \, m L \) eq.not 0$ for unbounded positive integers $m$.
    Then $H^0 \( X \, r L \) eq.not 0$ for some $r > 0$.]
] <thm:alteration-conversion>

Smooth Lefschetz and Corollary 14 already imply this conclusion.
  We give a different geometric proof through three constructions:
  the field constant in curvature-null directions, a line of multiplication maps on a reduced flat alteration,
  and descent of that metrized line and its injection to the original function field.
  The alteration makes the fiberwise maximum positive and continuous by using reduced fibers.
  Returning to the original function field then allows the birational Euler argument to apply.

=== 11.1 The field constant in curvature-null directions <har:subsec:kernelfield>

Let $X$ be smooth connected projective with smoothly semipositive $L = - K_X$,
  and suppose $H^q \( X \, m L \) eq.not 0$ for arbitrarily large positive $m$, with fixed $q$.
  Put $n = dim X$, let $theta$ be the smooth semipositive curvature of $L$, and let $r$ be its maximal rank.
  If $q = 0$, the conclusion is already given. Otherwise start from the assumed classes and apply the
  harmonic-star construction in the proof of Lemma 6; it gives nonzero sections of $Omega_X^(n - q) ⊗ L^(m + 1)$.
  No invariant-index assumption is involved. If $q = n$, these are anticanonical sections; if $r = n$,
  the positive curvature energy on an open set excludes $q > 0$.
  In the remaining cases the same determinant extraction gives a line $M$ mapping nontrivially to a positive
  exterior power of $Omega_X^(n - q)$, and effective divisors

$ D_i in \| M + a_i L \| \, wide a_i arrow.r oo \, wide D_i \[ theta \]^r \[ omega \]^(n - r - 1) = 0 . $

The intersection equality is Lemma 8. If $r = 0$, all $D_i$ vanish,
  and two distinct $a_i$ show that a positive power of $L$ is trivial. Assume $1 lt.eq r < n$.

On the ordinary open $U$ of maximal curvature rank, define

$ cal(K) = { g in bb(C) \( X \) : d g \( ker theta \) = 0 upright(" on ") U
  upright(" off a proper algebraic subset") } . $

It is a field. It is relatively algebraically closed: differentiate a minimal polynomial for an element algebraic
  over $cal(K)$ in a null direction; its separable derivative is generically nonzero,
  so the element has zero derivative there as well. The intermediate-field argument from Section 9.1 proves finite
  generation.

If a rational function has null pole support, it belongs to $cal(K)$.
  Its level divisors have the same zero intersection as the poles, hence each of their components is null.
  At a regular level point in $U$, the tangent hyperplane contains $ker theta$,
  by the same rank-quotient argument as before. This proves the assertion where the differential is nonzero and
  then everywhere required.

Choose a smooth projective model $Y$ of $cal(K)$ and resolve the map by $mu : X_1 arrow.r X$, $f : X_1 arrow.r Y$.
  Put $A = mu^(*) L$. The generic fiber is geometrically integral,
  because the extension is regular in characteristic zero. On a nonempty ordinary open,
  $ker mu^(*) theta subset ker d f$, and $dim Y lt.eq r$. In fact for every smooth $\( 1 \, 1 \)$-form $eta$ on $Y$,

#[#set math.equation(numbering: n => "(28)")
 $ \( mu^(*) theta \)^r and f^(*) eta = 0 . $ <har:eq:globalwedge>]

On the rank-$r$ open this follows because every horizontal covector lies in the positive-curvature span;
  elsewhere the rank is smaller, and continuity extends the identity across the algebraic exceptional locus.

Any integral relation $sum b_i = sum b_i a_i = 0$ makes $sum b_i D_i$ principal with null pole support.
  Its function is in $cal(K)$, so the horizontal parts of $mu^(*) D_i$ satisfy the same relation.
  Three-term interpolation proves that these horizontal divisors are affine in $a_i$.
  Their slope is effective by unbounded nonnegative coefficients.
  Thus for two indices with $b = a_2 - a_1 > 0$ the quotient $s$ is a rational section of $b
  A$ with effective horizontal divisor, regular over a dense base open.
  If $Y$ is a point it already descends to a section on $X$.

Let $E = K_(X_1 \/ X) = K_(X_1) + A$. For every $t gt.eq 0$,

#[#set math.equation(numbering: n => "(29)")
 $ "rank" f_(*) cal(O)_(X_1) \( E + t A \) lt.eq 1 \, quad upright("with equality for ") t = k b \, med k gt.eq
   0 . $ <har:eq:ordinaryrank>]

For the upper bound, twist two hypothetical independent generic sections by a high ample base line to make them
  global. Their zero divisors push to effective divisors on $X$ with zero intersection against
  $\[ theta \]^r \[ omega \]^(n - r - 1)$, using (28), exceptionality of $E$, and $theta^(r + 1) = 0$.
  Their quotient has null poles, hence lies in $cal(K)$, contrary to independence.
  The lower bound is supplied by $s_E s^k$.

Over a smooth dense open with geometrically integral fibers, the function $-
  log max_(X_(1 \, y)) \| s \|^2$ is plurisubharmonic. Indeed the rank-one adjoint section $\( s_E \/ f^(*) eta \)
  s^k$ has smooth coefficient $\( k b + 1 \) A$. The moment calculation (2) applies,
  with full-support density and locally uniform power-mean limit.
  The next construction extends this good-locus metric using reduced flat fibers rather than divisorial minima.

=== 11.2 A Hom line on a reduced flat family <har:subsec:homline>

By weak semistable reduction #cite(label("AK2000")) Theorem 0.3,
  there are a smooth projective alteration $Y_a arrow.r Y$ and a modification $Z_a$ of the main component of $X_1
  times_Y Y_a$ such that $p_a : Z_a arrow.r Y_a$ is equidimensional, toroidal, and has reduced fibers.
  Toroidal varieties are Cohen–Macaulay, so the equidimensional flatness criterion over the smooth base makes
  $p_a$ flat. Write $q_a : Z_a arrow.r X_1$. The source $Z_a$ need not be smooth.

Take a sufficiently high power $cal(P)$ of a relatively very ample line.
  Relative Serre vanishing and base change give locally free bundles

$ cal(H) = p_(a *) cal(P) \, wide cal(H)' = p_(a *) \( cal(P) ⊗ q_a^(*) A^b \) \, $

commuting with base change, with surjective evaluation for $cal(P)$.
  On the generic fiber, multiplication by $s$ gives a nonzero map $cal(H)_eta arrow.r cal(H)'_eta$.
  Resolve its rational point in the projective bundle of lines in $"Hom" \( cal(H) \, cal(H)' \)$ on a smooth
  projective birational base model $Y_b arrow.r Y_a$, and call the pulled-back tautological subline $B_b$.
  Put $Z_b = Z_a times_(Y_a) Y_b$, with maps $p_b$ and $q_b$.
  Flatness and reduced geometric fibers survive this base change. The total space is integral:
  flatness over an integral base embeds its local rings in their generic localizations,
  and its generic fiber is integral.

There is a regular line map

#[#set math.equation(numbering: n => "(30)")
 $ p_b^(*) B_b arrow.r q_b^(*) A^b $ <har:eq:homline>]

nonzero on each fiber. To construct it, compose the tautological Hom map with evaluation into $cal(P) ⊗ q_b^(*)
  A^b$. It annihilates the kernel of evaluation onto $cal(P)$,
  because it is multiplication on the generic fiber and the total space is integral.
  Factor through $cal(P)$ and cancel that invertible line. If the result vanished as a map on a fiber,
  the induced map of fiber section spaces would vanish, contrary to the everywhere subbundle $B_b subset
  "Hom" \( cal(H) \, cal(H)' \)$ and base change. Reducedness now implies that it has a nonzero value at some
  point of every fiber; without reducedness this last implication would fail.

Give $B_b$ the maximum metric through (30) and the pulled-back smooth metric of $A^b$.
  The maximum is positive and continuous. Properness gives upper semicontinuity.
  Smooth points are dense in each reduced fiber; a value arbitrarily close to the maximum may be chosen at such a
  point. Flatness and fiber smoothness make the morphism smooth there,
  giving liftings of nearby base points and lower semicontinuity.
  On a dense open the map is the pullback of $s$ times a rational base factor, by its defining generic Hom line.
  Its fibers map onto the original smooth integral fibers, so the maximum weight equals the pullback of the
  good-locus weight just proved, plus a pluriharmonic frame term.
  Continuity and removable singularities extend plurisubharmonicity everywhere on $Y_b$.

=== 11.3 Descending the alteration and its section <har:subsec:alterationnorm>

Proposition 19 requires a source birational to $X$, whereas the construction above used an alteration.
  We first descend a power of the metrized line by a finite group quotient.
  We then descend its injection by a field norm. These two operations will produce the required data on birational
  models of the original fields.

Choose a finite Galois extension of $bb(C) \( Y \)$ containing $bb(C) \( Y_b \)$, of degree $ell$ and group $G$.
  Starting with the normalization of $Y$ in this extension,
  normalize the simultaneous graph of all conjugate rational maps to $Y_b$.
  This gives a normal projective $W$, a regular $G$-action, and a map $rho : W arrow.r Y_b$.
  The quotient $W_0 = W \/ G$ is normal projective birational to $Y$, and $W arrow.r W_0$ is finite.
  Let $B_W = rho^(*) B_b$. The product

$ C_W = ⨂_(g in G) g^(*) B_W $

has its permutation linearization and invariant product metric.
  The power $C_W^ell$ has trivial stabilizer actions on fibers, so descends to a line $C_0$ on $W_0$.
  One can check descent locally on affine quotient neighborhoods:
  prescribe an equivariant nonzero value on a finite orbit, lift it to a section, average,
  and shrink the quotient neighborhood until it is a frame. Its invariant transition functions descend.
  The invariant metric descends continuously by the quotient topology.

Resolve $hat(Y) arrow.r W_0$, and let $B_0$ be the pullback of $C_0$.
  Its metric is plurisubharmonic on the dense finite-étale locus, and by continuity everywhere.
  Choose a smooth projective birational model $hat(X) arrow.r X_1$ mapping to $hat(Y)$,
  with composite maps $hat(mu) : hat(X) arrow.r X$ and $hat(f) : hat(X) arrow.r hat(Y)$, and put $hat(A) =
  hat(mu)^(*) L$. Normalize the main component of $hat(X) times_(W_0) W$, calling it $R$.
  It is finite over $hat(X)$ with the same Galois group: geometric integrality of the generic fiber, proved above,
  makes the function field extension linearly disjoint from the finite Galois base extension.
  The finite maps fit into the commutative square

$ R & arrow.r & W\
upright("finite") thin arrow.b &  & arrow.b thin upright("finite")\
hat(X) & arrow.r & W_0 . $

Here the lower map factors through $hat(f) : hat(X) arrow.r hat(Y)$, and the upper-right space maps to $Y_b$ by $rho$.

On $R$, the difference of the pullbacks $b hat(A) - B_W$ has a nonzero section.
  Indeed resolve the rational map from $R$ to $Z_b$ over $X_1$ and $Y_b$.
  The resulting common graph is a modification of $R$, and (30) gives a regular section there.
  Both line bundles already come from $R$; normality therefore descends this section to $R$.
  Multiply its $G$-conjugates and raise to the $ell$-th power.
  This yields a section of the pullback of $b ell^2 hat(A) - hat(f)^(*) B_0$.
  A further field norm for the finite surjection onto the normal target #cite(label("StacksNormNormal"))
  Lemma 31.18.7, of degree $ell$, relative to a rational line frame, gives a regular nonzero section downstairs of

#[#set math.equation(numbering: n => "(31)")
 $ b ell^3 hat(A) - hat(f)^(*) \( ell B_0 \) . $ <har:eq:descendedalteration>]

Regularity can be checked at every prime: all orders upstairs are nonnegative, hence so are the norm orders.
  The powers are not meant to be minimal. Put $hat(b) = b ell^3$ and $hat(Q) = ell B_0$.
  We have returned to birational models of the original source and base fields,
  with a continuously semipositive $hat(Q)$ and an injection $hat(f)^(*) hat(Q) arrow.r hat(b) hat(A)$.
  The original kernel condition persists on a nonempty open of these birational models.
  Theorem 16 and Proposition 19 now give a section of a positive power of $L$ on $X$.

== 12 Local strictness and an exact multiplier ideal <inj:localized>

The rank-one direct image of an adjoint line need not be locally free.
  We identify its defect from its reflexive hull with the multiplier ideal of its fiber-integral metric.
  This exact identity permits Euler interpolation without discarding conditions in codimension two.

The two analytic lemmas below turn positivity on one horizontal patch into vanishing for that ideal.
  Proposition 27 then identifies the ideal, and Proposition 28 applies the construction to the curvature-null-pole
  field already used in Section 9.1. The base field is the same;
  the vanishing argument now uses the actual degree-zero direct image.

#thm([Lemma 12.1.])[
  (Localized multiplier-ideal vanishing).  #emph[Let $Y$ be a smooth connected projective complex variety of
    dimension $d > 0$. Suppose a line bundle $R$ has a singular Hermitian metric with plurisubharmonic weights
    $psi$. Assume that on some coordinate ball these weights are continuous and their curvature dominates a
    positive smooth $\( 1 \, 1 \)$-form. Then
$ H^q #scale(x: 120%, y: 120%)[\(] Y \, cal(O)_Y \( K_Y + R \) ⊗ cal(I) \( psi \) #scale(x: 120%, y: 120%)[\)] =
  0 wide \( q > 0 \) . $

]
] <inj:local-nadel>

#proof[
  We construct a globally strictly positive metric with exactly the same multiplier ideal.
  #emph[Producing an integrable divisor metric.] Choose a very ample $A$ with curvature $omega_A$,
    and a smooth metric $psi_0$ on $R$. For sufficiently small fixed $delta >
    0$ and arbitrarily large integers $l$, we first claim that
  #[#set math.equation(numbering: n => "(32)")
   $ H^0 #scale(x: 120%, y: 120%)[\(] Y \, cal(O)_Y \( l R - A \) ⊗ cal(I) \( l \( 1 + delta \) psi \)
     #scale(x: 120%, y: 120%)[\)] eq.not 0 . $ <inj:jet-section>]
  On $l R$ use weights $l \( 1 + delta \) psi - l delta psi_0$, and add the smoothly metrized line $j_l A - K_Y$,
    with $j_l = ceil.l C delta l + C' ceil.r$. Fixed sufficiently large constants $C \,
    C'$ absorb the negative smooth curvatures and leave a positive lower bound.
    The multiplier ideal is $cal(I)_l = cal(I) \( l \( 1 + delta \) psi \)$.
    Within a smaller ball of strict positivity choose a point and a cutoff logarithmic pole equal to $log \|
    z \|^2$ near that point. Add $eta l$ times this pole, with $eta >
    0$ fixed sufficiently small independently of $delta \, l$.
    Its negative curvature costs at most $O \( eta l \)$ on the ball,
    where the original positive lower bound has order $l$. Nadel vanishing #cite(label("Nadel1990")),
    in the strict-current form of #cite(label("Demailly2011")) Theorem 5.11,
    therefore gives surjectivity to jets of order $floor.l eta l floor.r - d$ at the point.
    Continuity of $psi$ there makes $cal(I)_l$ trivial near that point,
    and polar-coordinate integration gives the ideal $frak(m)^(floor.l eta l floor.r - d + 1)$ for the added pole.
    Consequently
  $ h^0 #scale(x: 120%, y: 120%)[\(] Y \, \( l R + j_l A \) ⊗ cal(I)_l #scale(x: 120%, y: 120%)[\)] gt.eq c l^d $
  for some $c > 0$ independent of sufficiently small $delta$.
  Remove $j_l + 1$ copies of $A$. At each step choose a smooth member of $\|
    A \|$ containing no associated center of $cal(O)_Y \/ cal(I)_l$.
    If a section vanishes on that member, division by its equation preserves membership in $cal(I)_l$,
    because that equation is a nonzerodivisor on the quotient.
    The number of conditions lost at a step is at most $C'' l^(d - 1)$ uniformly for $0 < delta lt.eq 1$.
    Indeed choose $p$ with $p A - R$ globally generated, restrict a general nonzero section to the hyperplane,
    and bound the restriction space by that of $\( p l + h \) A$ there, where $0 lt.eq h lt.eq j_l$.
    The Hilbert polynomial and the hyperplane exact sequence give this bound.
    The total loss is $O \( delta l^d \) + O \( l^(d - 1) \)$. Choosing $delta$ small and then $l$ large proves (32).
  Let $sigma$ be a nonzero section in (32). In compatible local frames,
    the weight $phi.alt_A$ of the positive metric on $A$ defines a divisor metric on $R$ by
  $ psi' = 1 / l #scale(x: 120%, y: 120%)[\(] log \| sigma \|^2 + phi.alt_A #scale(x: 120%, y: 120%)[\)] . $
  Its curvature dominates $omega_A \/ l$. If $V = psi' - \( 1 + delta \) psi$,
    membership of $sigma$ in the multiplier ideal in (32) says exactly that $exp \( l V \)$ is locally integrable.
  #emph[Preserving the ideal.] Take $l gt.eq 1 \/ delta$ and put $rho = \( 1 - epsilon \) psi + epsilon psi'$.
    The identity
  $ - psi = - frac(rho, 1 + epsilon delta) + frac(epsilon V, 1 + epsilon delta) $
  and Hölder’s inequality, with the integrability of $exp \( V \/ delta \)$,
    prove $cal(I) \( rho \) subset.eq cal(I) \( psi \)$. For the converse,
    strong openness #cite(label("GuanZhou2015")) Theorem 1.1, coherence,
    and compactness give $gamma > 0$ with $cal(I) \( \( 1 + gamma \) psi \) = cal(I) \( psi \)$ on a finite cover.
    Small-exponent integrability of the divisor metric $psi'$ gives $gamma' >
    0$ with $exp \( - gamma' psi' \)$ locally integrable. Apply Hölder with
    $s = \( 1 - epsilon \) \/ \( 1 + gamma \)$ and $1 - s$. For small $epsilon$ one has $epsilon \/ \( 1 - s \) <
    gamma'$, proving $cal(I) \( psi \) subset.eq cal(I) \( rho \)$.
    The metric $rho$ has a global positive curvature lower bound and the same ideal.
    Nadel vanishing proves the assertion. ◻
]

#thm([Lemma 12.2.])[
  (Strictness from horizontal curvature).  #emph[Let $p : V arrow.r
    Y$ be a proper holomorphic submersion with compact fibers and Kähler total space.
    Let $D$ have a smooth semipositive Hermitian metric. Work on an open set where $p_(*) \( K_(V \/ Y) + D \)$ is
    locally free and its fibers are the corresponding section spaces.
    Suppose the coefficient curvature dominates the pullback of a positive base form on an open patch meeting
    $V_(y_0)$, and let $u_0 in H^0 \( V_(y_0) \, K_(V_(y_0)) + D \|_(V_(y_0)) \)$ be a section that is nonzero on
    that patch. The curvature of the direct-image metric paired with $u_0$ at $y_0$ is strictly positive in every
    nonzero tangent direction of $Y$. If a compact torus acts over the trivial base action and preserves the
    metrics, let the entire invariant summand, or an entire character summand,
    have rank one and suppose $u_0$ belongs to that summand. Its quotient metric under the holomorphic orthogonal
    projection has the same strictness at $y_0$.]
] <inj:strict-direct-image>

#proof[
  We spell out the consequence of Berndtsson’s curvature formula #cite(label("Berndtsson2009")) Section 4,
    Proposition 4.2, Lemmas 4.3–4.4, and equation (4.8), since strict vertical positivity is not required.
    Restrict to a disk with coordinate $z$ in a chosen base direction, and let the fiber dimension be $a$.
    If $a = 0$, the direct image is locally the orthogonal sum of the coefficient lines on the finitely many
    sheets. Its curvature pairing is a sum of nonnegative terms,
    with a positive term on the patch where $u_0$ is nonzero. Assume now $a > 0$.
    A holomorphic direct-image section extending $u_0$ with vanishing covariant derivative at zero has a smooth
    absolute $\( a \, 0 \)$ representative $u$ satisfying
  $ D' u = d z and lambda \, wide accent(partial u, ‾) = d z and eta \, wide D' = partial - partial phi.alt and . $
  On the central fiber, $lambda$ is orthogonal to holomorphic adjoint forms and $eta and
    omega$ is $macron(partial)$-exact. Replace $u$ by $u - d z and xi$ so that $lambda =
    0$ and $eta$ is primitive there. These two requirements prescribe, respectively,
    $macron(partial)^(*) \( omega and xi \)$ and $macron(partial) \( omega and xi \)$,
    up to the Kähler-identity constants. Orthogonality and exactness place the two prescriptions in their required
    images; Hodge decomposition solves them simultaneously. Lefschetz linear algebra identifies the relevant
    $\( a \, 1 \)$-forms with $omega and xi$, for $xi$ of type $\( a - 1 \, 0 \)$.
  With $c_a = i^(a^2)$, the resulting curvature pairing is
  $ c_a p_(*) #scale(x: 120%, y: 120%)[\(] u and macron(u) thin e^(- phi.alt) and
    i partial macron(partial) phi.alt #scale(x: 120%, y: 120%)[\)] - i thin d z and
    d macron(z) thin c_a integral_(V_0) eta and macron(eta) thin e^(- phi.alt) . $
  The second term is nonnegative by the primitive middle-degree Hodge–Riemann sign.
    The first integrand is nonnegative everywhere. On the prescribed patch the pullback lower bound contributes
    the positive base form times the squared vertical norm of $u_0$.
    This is positive on a nonempty open subset, so its integral is strictly positive.
    For a torus action, averaging is a holomorphic orthogonal projection.
    The Chern connection preserves the orthogonal character splitting,
    so the same calculation applies on the invariant summand. ◻
]

#thm([Proposition 12.3.])[
  (The exact ideal of an invariant adjoint line).  #emph[Let $X \, V \,
    Y$ be smooth connected projective varieties with $dim Y > 0$, let $pi : V arrow.r X$ be birational,
    and let $f : V arrow.r Y$ be surjective. Suppose an algebraic torus $T$ acts equivariantly on these maps and
    trivially on $Y$. Give $L = - K_X$ its natural linearization and a smooth semipositive metric invariant under
    the maximal compact torus. Put $L' = pi^(*) L$, $J = K_(V \/ X)$,
    and let $t$ be its natural invariant Jacobian section. Assume that
$ cal(B) = \( f_(*) cal(O)_V \( J \) \)^T $

 has rank one. Via division by $t$, view $cal(B)$ as a sheaf of rational functions on $Y$,
   and write $cal(B)^(or or) = cal(O)_Y \( B_0 \)$ and $R = B_0 - K_Y$.
   Then the invariant adjoint $L^2$ metric extends to a singular semipositive metric $psi_R$ on $R$, and
#[#set math.equation(numbering: n => "(33)")
 $ cal(O)_Y \( B_0 \) ⊗ cal(I) \( psi_R \) = cal(B) . $ <inj:exact-ideal>]

 If, on a nonempty patch in the smooth base-change locus where $t$ is nonzero,
   the curvature of $L'$ dominates the pullback of a positive base form,
   then $psi_R$ is smooth and strictly positive on a base coordinate ball.]
] <inj:exact-adjoint-ideal>

#proof[
  The sheaf $cal(B)$ is torsion-free. Its hull is determined by regularity over the generic points of base primes.
    More precisely, for a prime $P subset Y$ its coefficient in $B_0$ is
  $ b_P = min_(Q mapsto P) ⌊frac("ord"_Q \( t \), "ord"_Q \( f^(*) P \))⌋ . $
  These are exactly the regularity tests for the rational section $\( f^(*) a \) t$.
    On the smooth base-change open, the entire invariant adjoint summand is a line.
    Its fiber-integral metric is semipositive by the compact-torus orthogonal quotient argument of Proposition 4.
  Put $k = dim Y$. This metric extends plurisubharmonically across every base prime.
    At a general point of a component attaining $b_P$, write the map as $\( z_1^e \, z_2 \, dots.h \, z_k \)$,
    where $e > 0$ is the pullback multiplicity, and let $a$ be the order of $t$.
    The relative canonical coefficient for the local frame of $R$ is a nonvanishing smooth factor times
  $ z_1^(a - b_P e - \( e - 1 \)) . $
  Since $0 lt.eq a - b_P e < e$, this exponent is nonpositive.
    Integration on one fixed small vertical polydisk bounds the squared norm below by a positive constant near the
    base prime. The weight is therefore locally bounded above there.
    Extend first along these divisorial neighborhoods and then across codimension at least two;
    write the extended weight as $psi_R$.
  Choose local frames $g$ of $cal(O)_Y \( B_0 \)$ and $eta$ of $K_Y$.
    The frame $g \/ eta$ of $R$ corresponds on the smooth locus to the relative adjoint section $\( f^(*) g \)
    t \/ f^(*) eta$. For a holomorphic function $a$, Fubini identifies integrability of $a$ with this frame’s
    squared norm, using the base volume from $eta$, with square integrability of the absolute top form
    $\( f^(*) \( a g \) \) t$ with the smooth $L'$ metric upstairs. The excluded analytic sets have measure zero.
    Such an integrable meromorphic top form has no divisorial pole;
    smoothness upstairs then extends it across codimension two.
    Conversely a holomorphic lift is integrable over inverse images of relatively compact base charts by
    properness. The lift is invariant and the identification agrees on the generic fiber.
    This proves both inclusions in (33), so it retains any codimension-two difference between $cal(B)$ and its hull.
  For the final assertion apply Lemma 26 to the invariant section determined by $t$ on the stated patch.
    The fiber-integral metric is smooth on the base-change open,
    so its strictness at one point gives a positive lower curvature bound on a smaller coordinate ball. ◻
]

#thm([Proposition 12.4.])[
  (Invariant sections by a degree-zero field).  #emph[Let $X$ be smooth connected projective with
    $H^q \( X \, cal(O)_X \) = 0$ for $q > 0$. Suppose $L = -
    K_X$ has a smooth semipositive metric and an algebraic torus $T$ acts on $X$.
    Then $H^0 \( X \, m L \)^T eq.not 0$ for some $m > 0$, with the natural anticanonical linearization.]
] <inj:degree-zero-route>

#proof[
  #emph[The null-pole field and the relative section.] Average a metric on $L$ and a Kähler form $omega$ over the
    maximal compact torus, and write $alpha gt.eq 0$ for the resulting curvature form,
    in first-Chern normalization. Proposition 5, with its actual value at zero,
    followed by the equivariant hard Lefschetz construction in Lemma 6, has the following consequence:
    if the asserted invariant sections do not exist, there is a fixed $q > 0$ and unbounded positive $j$ with
  $ 0 eq.not u_j in H^0 \( X \, Omega_X^(n - q) ⊗ j L \)^T . $
  The coefficient in hard Lefschetz is $j = m + 1$, since $K_X + j L = m L$ equivariantly.
    In the Bochner identity for the associated harmonic $\( n \, q \)$-forms the curvature term is a sum of $q$
    eigenvalues of $j alpha$. Full rank on an open set would force vanishing there,
    hence vanishing of the holomorphic Lefschetz preimage everywhere. Thus $r = max "rank" alpha < n$.
  Define the degree of a divisor by
  $ ell \( D \) = \[ D \] thin \[ alpha \]^r \[ omega \]^(n - r - 1) . $
  It is nonnegative on effective divisors and vanishes on $L$.
    Lemma 6 gives a linearized determinant line $S$ and, for unbounded positive integers $p$, nonzero invariant sections
  $ s_p in H^0 \( X \, S + p L \)^T . $
  Put $N_p = "div" \( s_p \)$. Lemma 8 gives $ell \( N_p \) = 0$:
    prescribed Ricci curvature first gives $ell \( S \) lt.eq 0$, and effectivity supplies the reverse inequality.
    The degree-zero divisors are exactly the curvature-null divisors of Section 9.1.
    We use their invariant pole field again, now to construct the exact direct-image ideal.
  Let $K$ be the field of invariant rational functions whose polar divisors have degree zero.
    Sums and products preserve this property; inverses do also,
    because polar and zero divisors are linearly equivalent and effective degrees are nonnegative.
    The field is relatively algebraically closed in $bb(C) \( X \)$.
    Indeed a root of a monic equation over $K$ can have poles only on the polar divisors of its coefficients,
    by the discrete-valuation inequality. The connected torus fixes each member of the finite root set,
    so the root is invariant as well. The field is finitely generated:
    choose a transcendence basis over $bb(C)$; algebraic subextensions over its rational field inside the finitely
    generated ambient field have bounded degrees, after adjoining an ambient separating transcendence basis.
    Their compositum is therefore finite.
  Take a smooth projective model $Y$ of $K$. Flatten the graph of the induced rational map,
    and normalize its main component, to obtain a normal equidimensional $G arrow.r Y$ birational to $X$;
    then take an equivariant resolution $V arrow.r G$. The action on $Y$ is trivial.
    Write $f_G : G arrow.r Y$ for the normal-model morphism and $L_G$ for the pullback of $L$ to $G$.
    Write $pi : V arrow.r X$, $f : V arrow.r Y$, $L' = pi^(*) L$,
    and let $t$ be the invariant Jacobian section of $K_V + L' = cal(O)_V \( J \)$, with $J = K_(V \/ X) gt.eq 0$.
    The generic fiber is geometrically integral because $K$ is relatively algebraically closed.
    These constructions use only equivariant resolution of the graph and the Hilbert-family flattening;
    they do not assert equidimensionality of the smooth resolution.
  Ratios of products of the $s_p$ having the same bidegree in $\( S \, L \)$ belong to $K$.
    Their horizontal divisor on $G$ is zero, so for $p > p_1 > p_0$,
  $ \( p - p_0 \) N_(p_1)^(upright("hor")) = \( p - p_1 \) N_(p_0)^(upright("hor")) + \( p_1 - p_0 \)
    N_p^(upright("hor")) . $
  Equivalently,
  $ N_p^(upright("hor")) = N_(p_0)^(upright("hor")) +
    frac(p - p_0, p_1 - p_0) \( N_(p_1)^(upright("hor")) - N_(p_0)^(upright("hor")) \) . $
  Effectivity for unbounded $p$ forces $N_(p_1)^(upright("hor")) - N_(p_0)^(upright("hor")) gt.eq 0$.
    Put $d_0 = p_1 - p_0 > 0$ and $sigma_0 = s_(p_1) \/ s_(p_0)$,
    a rational invariant section of $d_0 L$ with effective horizontal divisor.
    We use the same symbol for its pullback to $G$. If $Y$ is a point, it has no poles and proves the assertion.
    Assume $dim Y = k > 0$.
  For each prime $P subset Y$, put
  $ c_P = min_(Q mapsto P) frac("ord"_Q \( sigma_0 \), "ord"_Q \( f_G^(*) P \)) . $
  Only finitely many $c_P$ are nonzero. Choose a positive integer $h$ clearing their denominators, and set
  $ d = h d_0 \, wide sigma = sigma_0^h \, wide B = sum_P h c_P P . $
  Thus $sigma$ is a rational invariant section of $d L_G$, and $B$ is an integral divisor with trivial action.
    Divisorial normalization gives
  #[#set math.equation(numbering: n => "(34)")
   $ s_D = sigma \( f_G^(*) 1_B \)^(- 1) in H^0 \( G \, d L_G - f_G^(*) B \)^T \, wide D = "div" \( s_D \) gt.eq
     0 . $ <inj:invariant-base-decomposition>]
  Here $1_B$ is the rational canonical section of $cal(O)_Y \( B \)$.
    At least one component above every base prime has coefficient zero in $D$.
    We also write $sigma$ for its pullback to $V$.
  #emph[Adjoint rigidity and a horizontal curvature bound.] For every $m gt.eq 0$,
  #[#set math.equation(numbering: n => "(35)")
   $ "rank" #scale(x: 120%, y: 120%)[\(] f_(*) cal(O)_V \( J + m d L' \) #scale(x: 120%, y: 120%)[\)]^T =
     1 . $ <inj:degree-rank>]
  There is a generic section $t sigma^m$. If the invariant rank were larger,
    a large very ample base twist would give two invariant global sections independent over $K$.
    Their pushed divisors on $X$ have degree zero. For the base twist this follows by taking the ratio of two
    general base hyperplanes: their pullbacks to the equidimensional $G$ have no common prime component,
    so their pushed divisors are the actual polar and zero divisors of an element of $K$.
    The remaining class is $m d L$, and the exceptional Jacobian pushes to zero.
    Thus the ratio of the two sections would again belong to $K$, contradicting their independence.
    This proves (35), including $m = 0$.
  At a rank-$r$ point of $alpha$, the differential of every rational function in $K$ kills $ker
    alpha$ wherever it is regular. For a regular value, the closure of its level hypersurface has degree zero.
    The nonnegative form $alpha^r and omega^(n - r - 1)$ therefore vanishes on that hypersurface.
    A tangent hyperplane failing to contain $ker alpha$ would still carry rank $r$, a contradiction.
    Apply this to $k$ independent base coordinates. It gives $k lt.eq r$.
    Intersect the maximal-rank open with the dense smooth base-change locus and the complement of the exceptional
    locus. On a small patch there,
  #[#set math.equation(numbering: n => "(36)")
   $ pi^(*) alpha gt.eq c f^(*) omega_Y wide \( c > 0 \) . $ <inj:horizontal-patch>]
  This is semipositive linear algebra on a complement of the kernel, not an inference from numerical degree alone.
    If $r = 0$, a nonzero effective divisor cannot have degree zero, so $k > 0$ cannot occur.
  Apply Proposition 4 to the equivariant normal equidimensional model $G arrow.r Y$, with $P =
    L$ naturally linearized and the rational section $sigma$.
    Equation (35) verifies the invariant adjoint ranks, and (34) is its vertical normalization.
    The result is a positive continuous semipositive metric on $B$.
  #emph[The exact ideal and interpolation from zero.] The varying twist is now metrized.
    The degree-zero metric must retain the entire direct image, including its codimension-two defect.
  Apply Proposition 27 to $cal(B) = \( f_(*) cal(O)_V \( J \) \)^T$.
    Equation (35) at $m = 0$ gives its rank, and the patch in (36) is disjoint from the exceptional locus,
    so $t$ is nonzero there. The proposition supplies the metric $psi_R$ on $R = B_0 - K_Y$,
    strictly positive on a base ball, with the exact identity (33).
  Adding $m$ times the continuous bounded metric on $B$ preserves the ideal and the strictness on the ball.
    Lemma 25 therefore gives
  $ H^q \( Y \, cal(B) ⊗ cal(O)_Y \( m B \) \) = 0 wide \( q > 0 \, med m gt.eq 0 \) . $
  At zero, canonical pushforward gives $h^0 \( Y \, cal(B) \) = h^0 \( V \, cal(O)_V \( J \) \)^T = 1$.
    Thus the Euler polynomial has value one at zero. For some $m >
    0$ lift a nonzero section and multiply by $s_D^m$. The result is an invariant section of $J + m d L'$.
    Remove the exceptional Jacobian divisor by pushforward to the smooth $X$.
    It gives the required natural invariant section of $m d L$. ◻
]

== 13 Actual direct-image lines and stabilized orders <inj:stabilized>

This proof of natural invariant transfer retains the actual adjoint direct-image sheaves throughout.
  A birational toroidal equidimensional model makes their invariant rank-one summands line bundles.
  Local frames of these lines lift to holomorphic adjoint sections,
  which will give the integrability needed for their quotient metrics.

The boundary orders are minima of finitely many affine functions.
  After the slopes are made integral, the lines vary affinely in all large degrees.
  The intercept comparison also embeds the zero-degree line, twisted by the eventual slope,
  into those large-degree lines. Strong openness then carries strict positivity from degree zero along this
  family, preserving the nonzero constant term in Euler interpolation.

#thm([Proposition 13.1.])[
  (Invariant Iitaka conversion by stabilized orders).  #emph[Let $X$ be smooth connected projective and let an
    algebraic torus $T$ act on $X$. Give $L = - K_X$ its natural linearization and suppose it admits a smooth
    semipositive metric. Let $M$ be a linearized line bundle with $- M$ pseudoeffective.
    If there are nonzero sections $sigma_j in H^0 \( X \, M + j L \)^T$ for an unbounded set $J subset
    bb(Z)_(> 0)$, then $H^0 \( X \, m L \)^T eq.not 0$ for some integer $m > 0$.]
] <inj:stabilized-transfer>

#proof[
  #emph[Generic adjoint rigidity.] Write $D \( j \) = M + j L$ and fix $j_0 < j_1$ in $J$.
    Choose $k > 0$ so that the invariant system $H^0 \( X \, k D \( j_1 \) \)^T$ has maximal image dimension among
    these systems for all positive degrees. No finite-generation assertion is needed to attain this maximum,
    an integer between zero and $dim X$. An equivariant principalization of its base ideal gives a smooth
    projective $pi_0 : W_0 arrow.r X$, isomorphic off the base locus, and a connected-fiber Stein map $f_0 :
    W_0 arrow.r Y_0$ such that
  $ pi_0^(*) k D \( j_1 \) = f_0^(*) H + G \, $
  where $H$ is ample on the normal projective $Y_0$ and $G$ is the effective fixed divisor.
    The base action and the fiber action on $H$ are trivial, while the defining section of $G$ is invariant.
    These identifications follow by dividing the invariant generating sections by the common fixed factor.
    The action on the finite Stein factor is trivial by connectedness of $T$.
  Let $K = bb(C) \( Y_0 \)$ and let $F$ be the generic fiber.
    It is normal and integral, with $H^0 \( F \, cal(O)_F \) = K$.
    The field $K$ is relatively algebraically closed in $K \( F \)$:
    an algebraic element has no poles on proper normal $F$, as follows from a monic equation over $K$.
    For every $h > 0$,
  #[#set math.equation(numbering: n => "(37)")
   $ dim_K H^0 \( F \, h pi_0^(*) D \( j_1 \) \|_F \)^T = 1 . $ <inj:invariant-fiber-rigidity>]
  There is the section $pi_0^(*) sigma_(j_1)^h$. If there were two independent invariants,
    their ratio would be transcendental over $K$. They extend as invariant rational sections on $W_0$ with only
    vertical poles. A common pullback of a section of a sufficiently large multiple $l H$ clears these poles:
    prescribe vanishing on their finitely many proper base images.
    Multiplying also by $s_G^l$ produces invariant sections of a multiple of $D \( j_1 \)$ on $X$.
    Products with the original system retain its image field and add their new ratio,
    contradicting maximal image dimension. This proves (37).
  Let $D_i^F$ be the effective divisor of $sigma_i \|_F$. The invariant products of the same linearized degree are
    proportional, so for $c > j_1$ in $J$,
  $ \( c - j_0 \) D_(j_1)^F = \( c - j_1 \) D_(j_0)^F + \( j_1 - j_0 \) D_c^F . $
  Thus $D_(j_1)^F - D_(j_0)^F gt.eq 0$. Put $d = j_1 - j_0 > 0$ and $z = sigma_(j_1) \/ sigma_(j_0)$,
    a rational invariant section of $d L$. It is regular on $F$, with zero support in $D_(j_1)^F$.
    If the base is a point we already have a regular invariant section on $W_0$, hence on $X$.
  Otherwise let $e_0$ be the Jacobian section of $K_(W_0) + pi_0^(*) L$.
    Its zeros lie over the principalized base locus and, on $F$, in the support of $D_(j_1)^F$.
    For every fixed $s gt.eq 0$, choose $h$ large enough that, on $F$,
  $ h D_(j_1)^F gt.eq "div" \( e_0 \|_F \) + s "div" \( z \|_F \) . $
  Such an $h$ exists because both effective divisors on the right have support in $D_(j_1)^F$.
    The invariant quotient $\( sigma_(j_1) \|_F \)^h \/ \( e_0 z^s \|_F \)$ is regular.
    Multiplication by this nonzero quotient injects the entire invariant adjoint section space into the
    one-dimensional space in (37). Consequently
  #[#set math.equation(numbering: n => "(38)")
   $ H^0 #scale(x: 120%, y: 120%)[\(] F \, \( K_(W_0) + \( 1 + s d \) pi_0^(*) L \) \|_F
     #scale(x: 120%, y: 120%)[\)]^T = K dot.op \( e_0 z^s \) \|_F wide \( s gt.eq 0 \) . $ <inj:adjoint-generic-line>]
  #emph[Actual lines and affine boundary orders.] The generic rank computation will now be upgraded to line
    bundles whose local frames lift to adjoint sections. After further birational modifications,
    the same adjoint ranks are preserved by canonical pushforward on a common smooth resolution.
    No support claim about new exceptional primes is needed. Now apply birational weak toroidalization
    #cite(label("ADK2013")) Theorem 1.1, followed by equidimensionalization by toroidal subdivisions
    #cite(label("AK2000")) Proposition 4.4. This gives a birational modification $Y arrow.r Y_0$ with $Y$ smooth,
    a normal toroidal $Z$ birational over $W_0$, and an equidimensional $g : Z arrow.r Y$.
    These are birational modifications; no alteration or assertion of reduced fibers is being used.
    Take a smooth resolution $W arrow.r Z$ and write $f : W arrow.r Y$, $pi : W arrow.r X$, and $pi_Z : Z arrow.r X$.
  Toroidal singularities are rational. Therefore, for
  $ cal(E)_s = f_(*) cal(O)_W \( K_(W \/ Y) + \( 1 + s d \) pi^(*) L \) \, $
  the sheaf $cal(E)_s ⊗ cal(O)_Y \( K_Y \)$ equals
  $ g_(*) #scale(x: 120%, y: 120%)[\(] omega_Z ⊗ pi_Z^(*) cal(O)_X \( \( 1 + s d \) L \)
    #scale(x: 120%, y: 120%)[\)] . $
  It is reflexive: deleting a codimension-two subset of $Y$ deletes only codimension at least two from $Z$,
    by equidimensionality, and the reflexive canonical sheaf on $Z$ extends its sections.
    The pushforward is torsion-free as well, since the source is integral and the map is dominant.
  The toroidal modifications may fail to be equivariant. Nevertheless $cal(E)_s$ has a $T$-linearization.
    Compute the same direct image on an equivariant smooth resolution $W'$ of the main component of $W_0
    times_(Y_0) Y$. A common smooth resolution of $W$ and $W'$ identifies their canonical direct images,
    since all coefficient twists are pulled back from $X$ and a birational morphism of smooth varieties pushes its
    canonical sheaf to the canonical sheaf. The identifications are the identifications of rational forms,
    so preserve the generic torus action. The invariant part
  $ A_s = \( cal(E)_s \)^T $
  is now an actual reflexive direct summand of rank one by (38); on smooth $Y$ it is a line bundle.
    Birational canonical pushforward gives
  #[#set math.equation(numbering: n => "(39)")
   $ H^0 \( Y \, K_Y + A_s \) = H^0 \( X \, s d L \)^T \, wide h^0 \( Y \, K_Y + A_0 \) =
     1 . $ <inj:global-invariant-identification>]
  The last equality uses the natural invariant trivialization of $K_X + L$.
  We compute these actual lines. On the regular locus of $Z$ let $e_Z$ be the Jacobian section with effective
    divisor $E_Z$. Use the rational generator $e_Z z^s$ for $K_Y + A_s$.
    For each prime $B subset Y$, let $Q_i$ run over primes of $Z$ mapping onto $B$, and let
  $ b_i = "ord"_(Q_i) \( g^(*) B \) > 0 \, quad e_i = "ord"_(Q_i) \( E_Z \) \, quad c_i = "ord"_(Q_i) \( z \) . $
  A rational base multiplier $a$ is regular above the generic point of $B$ precisely when $b_i "ord"_B \( a \) +
    e_i + s c_i gt.eq 0$ for all $i$. There are no horizontal poles by (38). The exact allowed pole order is
  $ u_s \( B \) = ⌊min_i frac(e_i + s c_i, b_i)⌋ \, wide K_Y + A_s = cal(O)_Y \( C_s \) \, quad C_s =
    sum_B u_s \( B \) B . $
  Only finitely many primes occur with a nonzero slope or intercept.
    Replace $d \, z$ by a common positive multiple and power so that all $v_B =
    min_i \( c_i \/ b_i \)$ are integers, and write $V = sum_B v_B B$. For all sufficiently large integer $s$,
  #[#set math.equation(numbering: n => "(40)")
   $ C_s = C_oo + s V \, wide C_oo gt.eq C_0 . $ <inj:affine-stabilization>]
  Indeed only the indices of minimal slope can minimize for large $s$.
    Among them the least intercept, after taking its floor, is at least the unrestricted least intercept at zero.
    This proves the stated inequality coefficient by coefficient. Set $A_oo = cal(O)_Y \( C_oo \) - K_Y$.
    Then $A_s = A_oo + s V$ eventually, and
  #[#set math.equation(numbering: n => "(41)")
   $ A_0 + s V arrow.r.hook A_s $ <inj:line-inclusion>]
  for those $s$. The eventual family has intercept $A_oo$, but this inclusion compares it with the actual
    zero-degree line $A_0$. It is this inclusion that will transfer sections produced by interpolation from
    exponent zero.
  #emph[Integrable metrics and interpolation from zero.] The original moving part, together with $-
    M$ pseudoeffective, shows that $pi^(*) L - epsilon.alt f^(*)
    H_1$ is pseudoeffective for some ample $H_1$ on $Y$ and $epsilon.alt > 0$.
    The pullback of $H$ to $Y$ is big, so it still dominates a small ample class.
    Mix a metric representing this pseudoeffectivity with the smooth semipositive metric on $pi^(*) L$,
    using a small positive coefficient. This gives at $s = 0$ a singular metric with trivial multiplier ideal and
    curvature at least $delta f^(*) omega_Y$, with $delta > 0$.
    For $s > 0$ use the smooth semipositive metrics on $\( 1 + s d \) pi^(*) L$.
  The singular adjoint metric and its extension #cite(label("PT2018")) Theorems 3.3.4–3.3.5 give semipositive
    metrics on $cal(E)_s$ on its locally free locus. The generic multiplier-ideal inclusion is an isomorphism
    since the upstairs ideal is trivial. Give $A_s$ the quotient metric for the holomorphic projection onto this
    summand; quotient positivity is #cite(label("PT2018")) Lemma 2.3.4(2). Write its weights as $psi_s$.
    Their description is the logarithm of the squared norm of the dual line frame in $cal(E)_s^or$.
    They extend plurisubharmonically across the remaining codimension-two subset of smooth $Y$,
    since $A_s$ is a line bundle. They are not identically $- oo$,
    by the nondegenerate finite fiber metric at almost every smooth base-change parameter.
    An invariant choice of upstairs metric is unnecessary for this quotient argument.
  Crucially,
  #[#set math.equation(numbering: n => "(42)")
   $ e^(- psi_s) in L_(upright("loc"))^1 \( Y \) wide \( s gt.eq 0 \) . $ <inj:base-integrability>]
  A local frame of the actual summand lifts to a local section of $cal(E)_s$.
    Its fiberwise squared norm bounds the quotient squared norm from above.
    The lift is a holomorphic adjoint section upstairs, after adding a base canonical frame.
    Its absolute density is integrable over inverse images of relatively compact charts by the trivial upstairs
    ideal and properness. Fubini on the smooth locus identifies this integral with the fiber norms integrated
    against the base canonical volume, proving (42). A frame of a reflexive hull without such a lift would not suffice.
  The weight $psi_0$ has a strictly positive lower curvature bound on all of $Y$.
    To check this across the boundary, choose a smooth function $p$ on $Y$ whose Hessian dominates $omega_Y$ near
    a given point and is bounded above by $C omega_Y$ globally.
    Multiply the upstairs squared metric by $e^(t f^(*) p)$ for small $t > 0$.
    It remains semipositive and has the same ideal. Its direct-image quotient weight is $psi_0 -
    t p$ almost everywhere, so it is plurisubharmonic everywhere by the extension theorem.
    A finite covering gives $i partial macron(partial) psi_0 gt.eq delta' omega_Y$ for some $delta' > 0$.
  We now put strictly positive metrics with trivial multiplier ideal on $A_0 + s V$ for every $s gt.eq 0$.
    These are the lines on the left of (41), so vanishing for them will retain the known section count at zero.
    Fix an integer $s > 0$. Take a sufficiently large integer $u$ in the range of (40),
    and choose a smooth metric $psi_oo$ on $A_oo$. In compatible frames the formula
  #[#set math.equation(numbering: n => "(43)")
   $ rho_s = psi_0 + s / u \( psi_u - psi_oo \) $ <inj:openness-mixture>]
  defines a metric on $A_0 + s V$. Its curvature is strictly positive once $s \/ u$ is small enough.
    Strong openness #cite(label("GuanZhou2015")) Theorem 1.1 and compactness give $eta >
    0$ such that $e^(- \( 1 + eta \) psi_0)$ is locally integrable on a finite cover.
    Hölder, together with (42) for this $u$, proves $e^(- rho_s)$ integrable if
  $ s / u frac(1 + eta, eta) lt.eq 1 . $
  The smooth $psi_oo$ contributes only bounded factors. No exponent improvement uniform in $u$ is needed.
    At $s = 0$ the original $psi_0$ already has these properties.
  Nadel vanishing consequently gives
  $ H^i \( Y \, K_Y + A_0 + s V \) = 0 wide \( i > 0 \, med s gt.eq 0 \) . $
  The Euler polynomial in $s$ has value one at zero by (39).
    Thus it is nonzero for all sufficiently large integers $s$.
    Using (41) and then (39) gives a nonzero invariant section of $s d L$ on $X$. ◻
]

Under the hypotheses $H^q \( X \, cal(O)_X \) = 0$ for $q > 0$,
  Proposition 5 and Lemma 6 supply the unbounded invariant twisted forms required to apply this proposition.
  For positive differential degree, their saturated generic determinant has pseudoeffective inverse by the
  cotangent-tensor theorem, exactly as in Corollary 14, now preserving the action.
  For degree zero the invariant section is already available.
  Thus this construction is a separate proof of invariant nonvanishing under those hypotheses,
  with strong openness and the actual direct-image line replacing the bounded base metric used earlier.

Section 14 applies the invariant conclusions to compact factors and descends their products through the retained
  monodromy and a finite-cover norm.

== 14 Compact monodromy and the descent maps <sec:descent>

We prove Corollary 2 by applying invariant nonvanishing to the compact factor in the universal cover and then
  taking a finite norm. We use the structure statement of #cite(label("CompanionH")) Theorem (Finite cover with
  compact torus monodromy), not that companion’s nonvanishing conclusion.
  For a smooth connected projective $X$ with smoothly semipositive $- K_X$,
  it gives a holomorphic isometric universal-cover splitting

$ tilde(X) = bb(C)^c times V times F \, $

where $V$ is a product of compact simply connected Ricci-flat factors with invariant parallel canonical frames and
  $F$ is a product of compact projective factors with no positive-degree holomorphic forms.
  After finite index, the deck subgroup acts faithfully by a translation lattice on $bb(C)^c$, trivially on $V$,
  and through a compact real torus $H$ on $F$. Empty products are points.
  The associated finite cover $X'$ is smooth projective and need not be a product.
  These are the only geometric conclusions from the companion that we need.

The compact factor $F$ has $H^j \( F \, cal(O)_F \) = 0$ for $j > 0$ by Hodge symmetry,
  and its anticanonical metric is smoothly semipositive. We first descend an invariant section.
  Afterwards we construct two additional descent maps, preserving a cohomology class or a twisted form,
  to which the ordinary conversions apply on $X'$.

=== 14.1 Invariant sections and the finite norm <har:subsec:sectiondescent>

#proof[
  On $F$, the compact torus preserves a very ample line because it preserves its Chern class and
    $"Pic"^0 \( F \) = 0$. Its projective action has algebraic-torus Zariski closure:
    a compact connected abelian subgroup of a projective linear group is conjugate into a diagonal compact torus.
    Passing through the finite special-linear cover, if necessary, provides a linearization of a very ample power.
    Invariants of the natural anticanonical line for the compact group and its Zariski closure agree.
    Corollary 7 therefore gives a nonzero invariant section of $- m K_F$ for some $m > 0$.
  Tensor its pullback to $tilde(X)$ with the $m$-th powers of the inverse canonical frames on $bb(C)^c$ and $V$.
    This nonzero product is invariant under the selected deck subgroup and descends to a section on $X'$.
    If $F$ is a point, take its section to be $1$ and $m = 1$.
  The finite étale norm #cite(label("CompanionH")) Lemma (Finite étale norm) sends this section to a nonzero
    section of a positive power of $- K_X$. Explicitly, pull to a connected finite Galois refinement,
    multiply all Galois translates, and descend their invariant product.
    The product is nonzero on the integral cover, and canonical bundles pull back under étale morphisms.
    Projectivity and GAGA make the resulting holomorphic section algebraic. ◻
]

The exponent can increase when common powers are taken on compact factors and when the finite norm is formed.
  None of these arguments supplies a uniform exponent.

=== 14.2 Descending a nonzero cohomology class <har:subsec:cohomdescent>

We can also descend cohomology before producing any section. The invariant Euler characteristic of $F$ is one.
  Proposition 5 gives, for unbounded $m$, nonzero classes in $H^q \( F \, - m K_F \)^H$,
  with one fixed $q$ after subsequence extraction. Choose a smooth closed Dolbeault representative and average it
  over $H$. Pull it to the product universal cover and tensor with powers of the constant anticanonical volume on
  $bb(C)^c$ and the invariant trivializations on $V$. It is deck-invariant for the selected subgroup and descends
  to the finite cover $X'$.

The descended class is nonzero. The faithful translation action makes a compact slice $F$,
  at fixed Euclidean and $V$ coordinates, embed into $X'$; no nonidentity lattice element preserves that slice.
  Restricting the descended coefficient-valued Dolbeault class to it, with the product coefficient frames fixed,
  recovers the chosen nonzero class on $F$. Hence $H^q \( X' \, - m K_(X') \) eq.not 0$ for unbounded $m$.
  Theorem 24 now produces a positive anticanonical section on $X'$.
  The finite norm of Section 14.1 gives a positive anticanonical section on $X$.
  Here the invariant cohomology is descended before the ordinary alteration conversion is applied on $X'$.

=== 14.3 Descending twisted forms before Iitaka conversion <har:subsec:formdescent>

There is a direct twisted-form route to the ordinary conversion of Section 6.
  Keep the product $tilde(X) = bb(C)^c times V times F$ and the finite-index deck subgroup just constructed,
  whose action is by translations on $bb(C)^c$, trivial on $V$, and contained in the compact torus $H$ on $F$.
  Put $P = - K_F$ and $d = dim F$. The invariant index has constant term one.
  Hence for a fixed $q$ and unbounded positive integers $m$ there are nonzero invariant classes in

$ H^q \( F \, m P \)^H = H^q \( F \, K_F + \( m + 1 \) P \)^H . $

Choose an $H$-invariant Kähler form. Smooth semipositive hard Lefschetz #cite(label("DPS2001")) is an equivariant
  surjection from $H^0 \( F \, Omega_F^(d - q) ⊗ \( m + 1 \) P \)$ onto the displayed group.
  Averaging a preimage over $H$ keeps its nonzero image, so supplies

$ 0 eq.not alpha_m in H^0 \( F \, Omega_F^(d - q) ⊗ \( m + 1 \) P \)^H . $

Set $p = d - q$. Let $tau_0$ be the translation-invariant inverse canonical frame on $bb(C)^c$,
  and let $tau_V$ be a product of the parallel inverse canonical frames on $V$.
  Projection to $F$ and the natural inclusion of its pulled-back cotangent bundle into the product cotangent
  bundle give the holomorphic twisted form

$ tilde(alpha)_m = "pr"_F^(*) alpha_m ⊗ \( tau_0 ⊗ tau_V \)^(m + 1) in H^0 #scale(x: 120%, y: 120%)[\(]
  tilde(X) \, Omega_(tilde(X))^p ⊗ \( - K_(tilde(X)) \)^(m + 1) #scale(x: 120%, y: 120%)[\)] . $

It is nonzero: evaluate $alpha_m$ on a tangent $p$-tuple at a point where it is nonzero and use the same tuple in
  the product; the other coefficient frames never vanish. The $m +
  1$ coefficient exponent matches the full anticanonical line of the product.

Every factor in this expression is invariant under the selected deck subgroup.
  The resulting form therefore descends through the covering map to a holomorphic section

$ 0 eq.not beta_m in H^0 #scale(x: 120%, y: 120%)[\(] X' \,
  Omega_(X')^p ⊗ \( - K_(X') \)^(m + 1) #scale(x: 120%, y: 120%)[\)] $

on the associated smooth projective finite étale cover $X'$ of $X$.
  Descent follows on evenly covered coordinate neighborhoods, where invariant local forms glue;
  its pullback is $tilde(alpha)_m$, so the descended form cannot be zero.
  For every fixed $r > 0$ the same construction is linear and gives the injection

$ H^0 \( F \, Omega_F^p ⊗ r P \)^H arrow.r.hook H^0 \( X' \, Omega_(X')^p ⊗ \( - r K_(X') \) \) . $

Projectivity and GAGA make $beta_m$ algebraic. If $F$ is a point, take $p = q = 0$ and $alpha_m = 1$;
  the same construction applies.

Now apply Corollary 14 on $X'$ itself to this fixed differential degree and the unbounded positive twists $m + 1$.
  It gives a nonzero positive anticanonical section on $X'$.
  Pull back to a finite connected Galois refinement and multiply its translates, as in Section 14.1,
  to obtain a nonzero positive anticanonical section on $X$.
  Thus this route descends the twisted forms before using the ordinary Iitaka and injectivity conversion;
  the cohomology and alteration route of the preceding subsection remains a separate construction.

=== 14.4 The stronger tensor-holonomy alternative <the-stronger-tensor-holonomy-alternative>

The Bochner–holonomy argument underlies the structure results of #cite(label("DPS1996")) Sections 2–3 and
  #cite(label("CDP2015")) proof of Theorem 1.4. We include the following tensor form of that argument as a second
  input for the same descent. It excludes all positive covariant tensor powers on an irreducible non-Ricci-flat
  factor, which is stronger than excluding holomorphic differential forms.
  The proof uses the determinant character of the irreducible holonomy representation.

#thm([Proposition 14.1.])[
  (The covariant-tensor holonomy dichotomy).  #emph[Let $P$ be a compact simply connected nonflat Kähler factor,
    irreducible in the Riemannian de Rham sense, with nonnegative Ricci curvature.
    Either $K_P$ has a nonzero parallel holomorphic volume form, or
$ H^0 #scale(x: 120%, y: 120%)[\(] P \, \( Omega_P^1 \)^(⊗ m) #scale(x: 120%, y: 120%)[\)] = 0 wide
  upright("for every integer ") m > 0 . $

]
] <prop:tensor-holonomy>

#proof[
  For a holomorphic covariant tensor, the contracted curvature on its bundle is the sum, over its tensor slots,
    of the negative Ricci operator. It is nonpositive. Integration of the Bochner identity on compact $P$
    therefore makes the tensor parallel. Its value at a point must consequently be fixed by the holonomy representation.
  Let $H$ be the closure of the holonomy group on the complex tangent space at that point.
    It is a compact subgroup of the unitary group. Simple connectivity makes full holonomy equal to restricted
    holonomy, so $H$ is connected. De Rham irreducibility makes its complex tangent representation irreducible:
    a proper invariant complex subspace would give a proper real parallel subspace and its orthogonal complement.
    Consider the determinant character of this representation.
    If it is trivial, the induced holonomy on the canonical line is trivial.
    Parallel transport of a nonzero canonical vector gives a global parallel volume form, which is holomorphic.
  If the determinant character is nontrivial, connectedness implies that its differential is nonzero.
    This differential is the complex trace on the Lie algebra $frak(h)$.
    A compact Lie algebra is the sum of its center and its derived algebra, and trace vanishes on the latter.
    Hence there is a central $Z in frak(h)$ with nonzero trace.
    By complex irreducibility and Schur’s lemma it acts on the tangent space as a scalar $i a thin upright("Id")$,
    with $a in bb(R)$ nonzero. Its action on the $m$-fold covariant tensor power is the nonzero scalar $- m i a$.
    That tensor power has no $H$-fixed vector. The parallelism proved in the first paragraph now excludes every
    nonzero holomorphic tensor of positive degree. ◻
]

This dichotomy supplies a second factor argument, stronger than vanishing of differential forms.
  On its trivial-canonical factors, a connected group of holomorphic isometries fixes a holomorphic volume form:
  it acts trivially on cohomology by isotopy, and the holomorphic top-form space injects into cohomology by Hodge
  theory. On the other factors all positive-degree forms vanish as direct summands of covariant tensor powers.
  Hodge symmetry then gives vanishing of higher structure-sheaf cohomology.
  The compact-monodromy algebraization, invariant section, and norm construction above apply to this dichotomy as well.

#bibliography("refs.bib", style: "ieee", title: [References])
