#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Topological triviality of $mu$-constant families of surface singularities]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Milnor number measures the topology of a nearby smooth level of an isolated hypersurface singularity:
  its Milnor fiber has the homotopy type of a bouquet of spheres,
  with one sphere for each unit of the Milnor number #cite(label("Milnor1968")) Theorems 6.5 and 7.2;
  the analytic formulation in terms of the Jacobian algebra is recalled in #cite(label("LeRamanujam1976"))
  Section 1, Theorem 1.5. A basic question in equisingularity theory asks whether keeping this number constant
  also keeps the defining function topologically unchanged.
  For complex surfaces, this requires a method that works beyond the dimensions in which the classical cobordism
  argument applies.

Let $Delta subset bb(C)$ be a disk centered at zero and let

$ F : \( bb(C)^3 times Delta \, { 0 } times Delta \) arrow.r \( bb(C) \, 0 \) $

be holomorphic. Write $f_t \( x \) = F \( x \, t \)$ and suppose that $f_t$ has an isolated critical point at the
  origin. Its Milnor number is

$ mu \( f_t \, 0 \) =
  dim_(bb(C))
  frac(cal(O)_(bb(C)^3 \, 0), \( partial f_t \/ partial x_1 \, partial f_t \/ partial x_2 \, partial f_t \/
  partial x_3 \)) . $

The family is #emph[topologically right-trivial] if a homeomorphism germ of the ambient family,
  preserving the parameter and the origin section, identifies each defining function with the central one.
  The coordinate changes and their inverses must vary jointly continuously with the parameter.

#thm([Theorem 1.1.])[
  #emph[Let $F : \( bb(C)^3 times Delta \, { 0 } times Delta \) arrow.r \( bb(C) \, 0 \)$ be holomorphic.
    Suppose that, for every $t in Delta$, $f_t \( 0 \) = 0$, $f_t$ has an isolated critical point at $0$,
    and $mu \( f_t \, 0 \) = mu \( f_0 \, 0 \)$. After shrinking the disk and the germ representatives,
    there is a homeomorphism germ
$ Phi \( x \, t \) = \( phi.alt_t \( x \) \, t \) \, wide phi.alt_t \( 0 \) = 0 \, quad phi.alt_0 =
  upright("id") \, wide f_t #scale(x: 120%, y: 120%)[\(] phi.alt_t \( x \) #scale(x: 120%, y: 120%)[\)] =
  f_0 \( x \) . $

 Both $Phi$ and $Phi^(- 1)$ are jointly continuous on neighborhoods of the origin section over the original disk.]
] <thm:main>

Thus the surface case of the $mu$-constant problem has a positive answer.
  The parameter dependence may be arbitrary and holomorphic,
  and the surface singularities need not be log canonical. The finite parameter covers used in the proof are
  removed before constructing the homeomorphism in the theorem.
  The same ambient maps identify the zero sets and the nearby nonzero levels,
  keeping the value of the function fixed throughout the parameter disk.

=== The problem and its antecedents <the-problem-and-its-antecedents>

Lê and Ramanujam proved that a $mu$-constant family of isolated hypersurface singularities has constant embedded
  topological type when the hypersurface dimension is different from two #cite(label("LeRamanujam1976"))
  Theorem 2.1. Their argument compares Milnor fibers through a homologically trivial cobordism.
  In higher dimensions the $h$-cobordism theorem turns this comparison into a product;
  the curve case follows from surface topology. Complex dimension two is the dimension in which this argument
  leaves the product structure unresolved. Outside complex dimension two,
  Timourian and King established local triviality of families of function germs #cite(label("Timourian1977"))
  #cite(label("King1980")). This additional passage matters here:
  constancy of the individual topological types and a jointly continuous choice of ambient coordinate changes are
  different conclusions.

Whitney regularity supplies a stronger geometric form of equisingularity.
  For a hypersurface germ in three variables, let $mu^(\( j \))$ be the Milnor number of its restriction to a
  general $j$-dimensional linear subspace. Then $mu^(\( 3 \)) = mu$,
  while $mu^(\( 1 \))$ is the multiplicity minus one and $mu^(\( 2 \))$ records the generic plane section.
  Teissier proved that constancy of this full sequence implies Whitney regularity along the singular section
  #cite(label("Teissier1973")) Chapter II, Theorem 3.9; Briançon and Speder proved the converse
  #cite(label("BrianconSpeder1976")) Theorem 2. Their examples also show that topological triviality need not
  imply Whitney regularity #cite(label("BrianconSpeder1975"))#cite(label("BrianconSpeder1976")) Section 3.
  Thus a proof under the sole $mu$-constant hypothesis must account for families whose generic plane-section
  Milnor number changes.

The equimultiplicity theorem of Fernández de Bobadilla and Pełka settles a separate part of this numerical
  comparison: a family with constant finite Milnor number has constant multiplicity in every dimension
  #cite(label("FernandezBobadillaPelka2024")) Theorem 1.1. Their theorem allows even formal power series whose
  coefficients vary continuously along a real interval. Its proof gives A’Campo’s radius-zero monodromy model a
  symplectic structure and extends McLean’s Floer-theoretic spectral sequence to compare multiplicities without
  assuming a common Milnor radius. For the present surface problem it supplies constancy of $mu^(\( 1 \))$,
  but does not supply constancy of $mu^(\( 2 \))$. We use it with Teissier’s criterion in the log-canonical case;
  the double-point case reduces to the classical $mu$-constant problem for plane curves.

Vector fields offer another approach to the parameter dependence.
  The Lê–Saito–Teissier criterion relates constancy of the Milnor number to the smallness of the parameter
  derivative compared with the spatial gradient #cite(label("LeSaito1973"))#cite(label("Teissier1973"))
  Chapter II, Remark 3.10. Such an estimate makes a gradient lift continuous at the singular section,
  but continuity alone does not give unique, continuously invertible transport.
  Parusiński constructed trivializing vector fields for $mu$-constant linear families $f \( x \) +
  t g \( x \)$ of isolated hypersurface singularities, without a dimension restriction
  #cite(label("Parusinski1999")) Corollary 2.1. Appendix 12 separates the gradient estimate from the trajectory
  control needed for general parameter dependence.

For surfaces, simultaneous resolution gives a bridge from numerical invariants to topology.
  Wahl associated a logarithmic characteristic number to a normal surface singularity #cite(label("Wahl1990")).
  Okuma showed that, for a deformation of a non-log-canonical Gorenstein surface singularity,
  constancy of this number produces simultaneous surface resolutions after finite base change,
  with reduced exceptional divisors on the fibers over the distinguished singular section
  #cite(label("Okuma2004")) Theorem 1.2.

Recent work describes further constraints on degenerations under the $mu$-constant hypothesis.
  Aldasoro Rosales studies semistable models after suitable base change and projective compactification.
  Her results include rational acyclicity of the special-fiber dual complex,
  Tate type for the second cohomology of the additional vertical surfaces,
  and equality of the first Betti numbers of the special fiber and its distinguished component
  #cite(label("AldasoroRosales2025")) Theorem 1.2. The comparison below likewise studies these additional
  surfaces, using their boundary complements and logarithmic canonical squares.
  Peters proves symplectic equivalence of completed Milnor fibers and contact equivalence of links for
  $mu$-constant polynomial families without vanishing folds #cite(label("Peters2026")) Theorem 3.7.
  That extra hypothesis provides a common Milnor radius. Our argument instead obtains transport from a resolved
  zero family and extends it to the ambient function levels.

=== The resolution invariant and the numerical comparison <the-resolution-invariant-and-the-numerical-comparison>

Write $X_t = { f_t = 0 }$. These are normal Gorenstein surfaces.
  For non-log-canonical germs, our main numerical task is to deduce constancy of Wahl’s logarithmic surface
  invariant from $mu$ alone. On a good resolution, write the relative Zariski decomposition of the canonical
  divisor plus the full reduced exceptional divisor as $P + N$,
  with $P$ relatively nef and $N$ effective and exceptional.
  The exceptional intersection matrix identifies a unique exceptional rational cycle $P_(upright("loc"))$ having
  the same intersections as $P$ with every exceptional curve. The invariant is

$ beta = - P_(upright("loc"))^2 . $

Section 3 recalls its resolution independence and the conventions used by Okuma #cite(label("Okuma2004"))
  Section 2. It also expresses this local square as a difference of ordinary projective squares.

The proof rests on a cancellation of Euler characteristics.
  To explain it, first consider a projective family with just the prescribed surface singularity in each fiber.
  A semistable log minimal model replaces its special fiber by a component $S_0$ dominating $X_0$ and additional
  projective surfaces $S_a$ over the singular point. Each component $S$ has a reduced boundary $B_S$,
  consisting of its intersections with the other vertical components and the horizontal exceptional divisors.
  Write $S^compose = S \\ B_S$. The construction gives $S_0^compose tilde.eq X_0 \\ {
  0 }$ and makes every $K_(S_a) + B_(S_a)$ nef.

Constancy of $mu$ keeps the Euler characteristic of the punctured projective fibers constant.
  Their nearby Euler comparison, after the contribution of $S_0^compose$ cancels, is

$ 0 = sum_a chi_c \( S_a^compose \) + delta \, wide delta gt.eq 0 . $

Here $chi_c$ denotes Euler characteristic with compact supports,
  and $delta$ is the sum of the excess Euler characteristics of the local smoothings at interior singular points
  of the extra surfaces. Greuel–Steenbrink’s first-Betti-number theorem makes these excesses nonnegative
  #cite(label("GreuelSteenbrink1983")). Langer’s orbifold Bogomolov–Miyaoka–Yau inequality supplies the other sign
  #cite(label("Langer2003")):

$ 0 lt.eq \( K_(S_a) + B_(S_a) \)^2 lt.eq 3 chi_c \( S_a^compose \) wide upright("for every ") a . $

Thus every extra logarithmic square vanishes. Specialization of projective intersections then gives constancy of
  $beta$. The key point is to retain a boundary for which both the Euler comparison and the surface inequality hold.

The technical development establishes these properties in order.
  Section 4 reduces this scalar assertion to polynomial families over algebraic curves.
  Individual finite determinacy supplies polynomial representatives,
  and constructibility of the resolution invariant gives the curve comparison.
  These individual equivalences are used only to compare numerical invariants.
  The high-degree compactification, following the construction in #cite(label("Steenbrink1985")) Lemma 2.5,
  gives projective surfaces with precisely the prescribed singularity and a smooth complement.

Sections 5–5.1 use semistable reduction and the threefold log minimal model program #cite(label("KM1998"))
  Chapter 7 to obtain a model with a reduced special fiber.
  The boundary retains every surviving horizontal exceptional divisor.
  Relative nefness and the negativity lemma identify its full support over the singular section.
  Adjunction then supplies precisely the reduced boundaries used in the comparison above.

Sections 6–6.1 establish the Euler comparison and its signs.
  The essential local assertion is that a boundary intersection contributes zero to the nearby Euler function,
  including at singular points of the threefold. Finite covers that make the boundary Cartier and the structure of
  threefold dlt strata reduce this assertion to the Euler calculation for a product of coordinates.
  Proper compatibility of nearby cycles then permits the local calculation to be integrated over the special fiber
  #cite(label("SchuermannNearby")) #cite(label("MaximSchuermann")).
  The interior correction and the comparison of orbifold and ordinary Euler characteristics complete the two sign
  calculations. Section 7 converts the resulting vanishing into constancy of $beta$.

The log-canonical branch is handled separately. Constancy of the spectrum,
  following Varchenko and Steenbrink #cite(label("Varchenko1982")) #cite(label("Steenbrink1985")),
  together with the threshold formula #cite(label("Kollar1997Pairs")) Theorem 9.5 and inversion of adjunction
  #cite(label("Kawakita2007")), shows that log canonicity is constant along the family.
  Section 10 treats this branch and the double-point case through sectional Milnor numbers.

=== From resolution to a homeomorphism of the functions <from-resolution-to-a-homeomorphism-of-the-functions>

In the non-log-canonical branch, Okuma’s theorem produces a simultaneous minimal semigood resolution after a
  finite disk cover #cite(label("Okuma2004")) Theorem 1.2. Its reduced exceptional restrictions are essential:
  they allow the remaining relative-normal-crossings assertion to be proved by the Euler characteristic of the
  exceptional curves. A node smoothing would lower that characteristic,
  whereas the resolved tubes and the punctured zero fibers make it constant.

Section 9 constructs complete lifts of the parameter directions on the resolved tubes.
  These descend to the punctured zero fibers and extend to the ambient nonzero levels while preserving the
  defining function. Properness of the tubes and reverse transport establish joint continuity at the origin for
  both the maps and their inverses. An explicit correction along the angular seam of $t =
  u^e$ then yields a trivialization over the original disk.
  Section 10 supplies the double-point and log-canonical cases using sectional Milnor numbers and completes the proof.

Appendix 11 supplies the marked monomial construction used in Section 5.
  It also gives two variants of the numerical argument: specialization of intersection squares supported properly
  over a curve and comparison within an irreducible component of a finite jet space.
  Appendix 12 gives an ambient transport criterion using continuous gradient lifts and explicit control of
  trajectories at the singular section. Its two sufficient geometric conditions come from Whitney regularity and
  from a proper simultaneous resolution with relative normal crossings.
  The criterion separates the smallness of the vector fields from the additional control needed to obtain
  continuous flows and continuous inverse flows.

== 2 Local families and fixed representatives <sec:local-families>

We first record the local information needed for the numerical comparison and for the eventual ambient
  trivialization. Throughout this section, $F \( x \, t \) =
  f_t \( x \)$ is a holomorphic family in three spatial variables over a disk $Delta$, with $f_t \( 0 \) = 0$,
  an isolated critical point at $0$, and $mu \( f_t \, 0 \) = mu > 0$ for every $t in Delta$.
  Write $X = F^(- 1) \( 0 \)$, $X_t = f_t^(- 1) \( 0 \)$, and $Gamma = { 0 } times Delta$.
  Representatives and the parameter disk may always be shrunk about the central point.

#thm([Lemma 2.1.])[
  (Local family properties).  #emph[There are representatives on which the spatial critical locus of $F$ is
    exactly $Gamma$. On these representatives $X arrow.r Delta$ is flat,
    its fibers are normal Gorenstein surfaces, and $X$ is a normal Gorenstein threefold,
    smooth over $Delta$ away from $Gamma$. The same statements hold after a nonconstant holomorphic base change
    between smooth disks.]
] <lem:local-family-properties>

#proof[
  Consider the scheme defined by the three spatial partial derivatives.
    Its central fiber is supported at $0$ and has length $mu$.
    The local finiteness theorem for analytic maps gives a finite representative over the disk.
    In the regular local ring $bb(C) { x_1 \, x_2 \, x_3 \, t }$,
    the three partials together with $t$ form a system of parameters. They therefore form a regular sequence.
    The quotient by the three partials is Cohen–Macaulay of dimension one, and $t$ is a nonzerodivisor in it.
    It is consequently finite flat over the disk, of degree $mu$.
    In every nearby fiber its local length at $0$ is already $mu$; there can be no further points.
    This is conservation of the spatial-gradient number; compare #cite(label("Denkowski2018")) Proposition 3.1.
  Each surface fiber is a hypersurface, hence Gorenstein and Cohen–Macaulay.
    Its isolated singularity has codimension two, so Serre’s criterion gives normality.
    Similarly, the total hypersurface is Gorenstein and Cohen–Macaulay; it is smooth off $Gamma$,
    which has codimension two in $X$, and is therefore normal.
    Since no fiber of the ambient projection is contained in $X$, its parameter is a nonzerodivisor on $X$.
    Torsion-freeness over the regular one-dimensional base gives flatness.
    After a disk base change the equation is again a relative hypersurface,
    with the same individual surface germs and the same spatial critical locus. These arguments apply again. ◻
]

Use $chi_c$ for Euler characteristic with compact supports;
  on a compact space it agrees with ordinary Euler characteristic $chi$.

#thm([Lemma 2.2.])[
  (Euler characteristic in a fixed ball).  #emph[There are a sufficiently small closed Euclidean ball $B$ about
    $0$, a smaller parameter disk, and $eta > 0$ such that the following statements hold for every parameter in
    that disk:]
  + #emph[$0$ is the only spatial critical point in $B$;]
  + #emph[$f_t^(- 1) \( c \)$ meets $partial B$ transversely whenever $\| c \| < eta$;]
  + #emph[
$ chi \( X_t ∩ B \) = 1 \, wide chi_c #scale(x: 120%, y: 120%)[\(] \( X_t ∩ B \) \\ { 0 }
  #scale(x: 120%, y: 120%)[\)] = 0 . $

]
  #emph[The Euler equalities also hold if the radius of $B$ varies slightly within a sufficiently small interval
    about the chosen radius.]
] <lem:fixed-ball-euler>

#proof[
  Choose $B$ inside the representative of Lemma 2, with radius a Milnor radius for $f_0$.
    Transversality at the compact set $f_0^(- 1) \( 0 \) ∩ partial B$ persists for small $t$ and small $c$.
    Points elsewhere on the sphere do not enter these small levels, after shrinking, by compactness.
    This proves the first two assertions.
  Fix $c$ with $0 < \| c \| < eta$. The spaces $f_t^(- 1) \( c \) ∩
    B$ form a proper smooth family with boundary over the smaller parameter disk.
    Smooth lifts tangent to the boundary give the proper-submersion theorem in this setting.
    Their Euler characteristic is therefore that of the central Milnor fiber, namely $1 + mu$;
    see #cite(label("Milnor1968")) Theorems 6.5 and 7.2 and, for the analytic Jacobian-algebra formulation,
    #cite(label("LeRamanujam1976")) Section 1, Theorem 1.5.
  For a fixed $t$, choose an inner Milnor ball for $f_t$, with closure in the interior of $B$.
    On the closed region between the two spheres, $f_t$ has no critical point,
    and both boundary restrictions are submersive over a sufficiently small disk of values.
    Thus the shell has the same Euler contribution at value $0$ and at sufficiently small nonzero values.
    In the inner ball, passing from value $0$ to a small nonzero value replaces a contractible singular fiber by a
    Milnor fiber of Euler characteristic $1 + mu$. Additivity of $chi_c$,
    or a decomposition using the inner boundary and the two complementary pieces, therefore gives
  $ chi \( f_t^(- 1) \( c \) ∩ B \) - chi \( X_t ∩ B \) = mu . $
  The inner ball and the admissible nonzero value may depend on $t$;
    the preceding computation of the outer smooth level applies to every such value.
    It follows that $chi \( X_t ∩ B \) = 1$. Removing its one origin point gives the second equality.
    Finally, transversality persists for radii in a small interval around the chosen radius,
    and the identical argument applies there. ◻
]

Our algebraic reduction will concern the numerical invariant of each individual surface germ.
  The following elementary form of finite determinacy supplies polynomial representatives for that purpose.

#thm([Lemma 2.3.])[
  (Individual finite determinacy).  #emph[Let $f in bb(C) { x_1 \, x_2 \,
    x_3 }$ have an isolated critical point at $0$ and Milnor number $mu$,
    and write $frak(m) = \( x_1 \, x_2 \, x_3 \)$. For every $b in
    frak(m)^(mu + 2)$ there is a biholomorphic germ $h$ fixing $0$ such that $\( f + b \) compose h = f$.
    In particular, if $N gt.eq mu + 1$, then $f$ is analytically right-equivalent to its Taylor polynomial $j^N f$.]
] <lem:individual-jets>

#proof[
  Let $frak(m) = \( x_1 \, x_2 \, x_3 \)$ and $J \( f \) = \( f_(x_1) \, f_(x_2) \, f_(x_3) \)$.
    The local algebra $bb(C) { x } \/ J \( f \)$ has length $mu$, so its maximal ideal has $mu$th power zero,
    by the descending filtration and Nakayama’s lemma. Hence $frak(m)^mu subset J \( f \)$.
    For the given $b in frak(m)^(mu + 2)$ we have
  $ b in frak(m)^(mu + 2) subset frak(m)^2 J \( f \) \, wide b_(x_i) in frak(m)^(mu + 1) subset frak(m) J \( f \) . $
  Write $b = a^(sans(T)) g$, where $g = \( f_(x_i) \)_i$ is a column vector and the entries of $a$ lie in
    $frak(m)^2$. There is a matrix $C$ with entries in $frak(m)$ such that the gradient column of $f +
    s b$ is $\( I + s C \) g$. On a sufficiently small neighborhood this matrix is invertible simultaneously for
    $0 lt.eq s lt.eq 1$. The holomorphic spatial vector field
  $ w_s = - \( I + s C \)^(- sans(T)) a $
  vanishes to second order and satisfies $d \( f + s b \) \( w_s \) = - b$.
    Its time-dependent flow $h_s$, initially the identity, exists as a holomorphic germ throughout $0 lt.eq
    s lt.eq 1$, after shrinking the spatial neighborhood. This follows from a uniform quadratic bound on $w_s$;
    the reverse equation supplies the inverse germ. The chain rule gives
    $frac(d, d s) \( \( f + s b \) compose h_s \) = 0$, and therefore $h = h_1$ has the required property.
    Taking $b = j^N f - f$ proves the assertion about Taylor polynomials. ◻
]

=== 2.1 Birational conventions <birational-conventions>

A pair $\( Z \, B \)$ consists of a normal complex variety and an effective rational Weil divisor $B$ such that
  $K_Z + B$ is rational Cartier. For a prime divisor $E$ on a birational model,
  its log discrepancy is one plus the coefficient of $E$ in the difference between the canonical divisor upstairs
  and the pullback of $K_Z + B$, using compatible canonical divisors.
  The pair is #emph[log canonical], abbreviated lc, if all log discrepancies are nonnegative.
  For $B = 0$ we say that $Z$ is log canonical. A pair with boundary coefficients at most one is #emph[divisorial
  log terminal], abbreviated dlt, if it has a log resolution on which every exceptional divisor has positive log
  discrepancy. An lc center is the image of a divisor with log discrepancy zero.
  For an lc pair, the equivalent dlt criterion is that a simple normal crossing open set contains the generic
  points of all lc centers. We use the usual normality and adjunction properties of its coefficient-one strata
  #cite(label("Kollar2023Families")) 11.5–11.15. A normal variety is $bb(Q)$-factorial if every prime Weil divisor
  has a positive Cartier multiple. A divisor is nef over a morphism when it has nonnegative degree on every
  complete contracted curve.

== 3 The local logarithmic square <sec:local-square>

The numerical invariant used below can be computed on a partial resolution.
  We first specify its local intersection convention, then express it as a difference of ordinary projective
  intersection numbers.

Let $\( V \, p \)$ be a normal complex surface singularity and let $rho : tilde(V) arrow.r
  V$ be a good resolution: $tilde(V)$ is smooth, $rho$ is proper and isomorphic away from $p$,
  and the full reduced exceptional divisor $E = sum_j E_j$ has simple normal crossings.
  Its intersection matrix is negative definite. Consequently, for a rational divisor $Q$ on $tilde(V)$,
  there is a unique rational exceptional cycle $nu \( Q \)$ satisfying

$ nu \( Q \) dot.op E_j = Q dot.op E_j wide upright("for every ") j . $

Write the relative Zariski decomposition as

$ K_(tilde(V)) + E = P + N \, $

where $N$ is an effective rational exceptional cycle, $P dot.op E_j gt.eq 0$ for every $j$, and $P dot.op E_j =
  0$ whenever $E_j$ occurs in $N$. Wahl’s local logarithmic invariant #cite(label("Wahl1990")) is

#[#set math.equation(numbering: n => "(1)")
 $ beta \( V \, p \) = - nu \( P \)^2 . $ <eq:beta-definition>]

We also write $P_(upright("loc")) = nu \( P \)$ for this numerical exceptional cycle.
  These are the relative decomposition and intersection conventions used by Okuma #cite(label("Okuma2004"))
  Section 2, pp. 649–650.

The value is unchanged on a higher good resolution and agrees with the value on the minimal semigood resolution,
  where the exceptional divisor has normal crossings, allowing irreducible components to have self-nodes.
  Indeed, let $pi : hat(V) arrow.r tilde(V)$ be a further resolution, isomorphic off $E$,
  with full reduced exceptional divisor $hat(E)$ over $p$. Log canonicity of the normal crossings pair gives

$ K_(hat(V)) + hat(E) = pi^(*) \( K_(tilde(V)) + E \) + G \, wide G gt.eq 0 \, $

where $G$ is $pi$-exceptional. Hence its relative decomposition is $pi^(*) P + \( pi^(*) N + G \)$:
  the first summand is relatively nef and is orthogonal to every component of the second.
  Uniqueness of the relative decomposition applies. Also $nu \( pi^(*) P \) = pi^(*) nu \( P \)$,
  as one checks against both strict transforms and $pi$-exceptional curves. The square therefore stays unchanged.
  A common higher resolution compares any two choices, including a semigood one.

#thm([Lemma 3.1.])[
  (Projective computation of the local square).  #emph[Let $V$ be an integral normal projective complex surface,
    smooth outside a point $p$, with Cartier canonical divisor.
    Let $b : S arrow.r V$ be a projective birational morphism from a normal surface, isomorphic outside $p$.
    Suppose that the reduced inverse image of $p$ is a divisor $B$, that $\( S \, B \)$ is log canonical,
    and that $K_S + B$ is $b$-nef. Then
#[#set math.equation(numbering: n => "(2)")
 $ beta \( V \, p \) = K_V^2 - \( K_S + B \)^2 . $ <eq:projective-local-square>]

]
] <lem:projective-local-square>

#proof[
  Choose a log resolution $pi : Z arrow.r S$, isomorphic outside $B$, and put $rho = b pi$.
    Let $E$ be the full reduced exceptional divisor of $rho$. With compatible canonical divisors, log canonicity gives
  $ K_Z + E = pi^(*) \( K_S + B \) + N \, $
  where $N$ is effective and $pi$-exceptional. The pullback on the right is $rho$-nef and has intersection zero
    with every component of $N$. It is therefore the positive part $P$ of the relative decomposition.
  The divisor $Z_P = P - rho^(*) K_V$ is exceptional: the two summands agree outside $rho^(- 1) \( p \)$.
    Moreover, $rho^(*) K_V$ has intersection zero with every exceptional curve, so $Z_P = nu \( P \)$.
    The projection formula gives
  $ P^2 = K_V^2 + Z_P^2 = \( K_S + B \)^2 . $
  Together with (1), this proves the formula. ◻
]

#thm([Lemma 3.2.])[
  (Persistence of log canonicity).  #emph[In a holomorphic family of isolated hypersurface singularities in three
    spatial variables with constant Milnor number over a connected smooth complex curve,
    log canonicity of the normal surface germ is constant.]
] <lem:lc-persistence>

#proof[
  By Varchenko’s theorem #cite(label("Varchenko1982")), as recovered by Steenbrink,
    the spectrum of an isolated hypersurface singularity is constant in a $mu$-constant deformation
    #cite(label("Steenbrink1985")) Theorem 2.8. Its smallest number plus one is the complex singularity index
    #cite(label("Steenbrink1985")) Theorem 2.11, and the log canonical threshold is the minimum of this index and
    one #cite(label("Kollar1997Pairs")) Theorem 9.5. For a normal hypersurface in a smooth ambient space,
    adjunction and inversion of adjunction identify log canonicity with threshold one
    #cite(label("Kawakita2007")). To apply the algebraic inversion theorem to an individual analytic germ,
    replace its defining function by a sufficiently high Taylor polynomial using Lemma 4;
    analytic right equivalence preserves both the threshold and log canonicity.
    Thus log canonicity, and its failure, is constant in the family.
    This use of the spectrum concerns the individual isolated function germs;
    it does not assume topological triviality of the family. ◻
]

== 4 Reduction of the numerical assertion to algebraic curves <sec:algebraic-reduction>

We now use the Wahl invariant $beta = - P_(upright("loc"))^2$ defined above.
  The objective of this section is to transfer constancy of this scalar invariant from algebraic curve families to
  arbitrary holomorphic disk families. The individual right-equivalences of Lemma 4 are sufficient;
  no simultaneous analytic equivalence of the original family with a polynomial family is asserted.

Fix $mu > 0$ and $N gt.eq mu + 1$. Let $V_N$ be the affine space of complex polynomials in three variables of
  degree at most $N$, with zero constant and linear terms, and put

$ U_mu = { g in V_N : dim_(bb(C)) bb(C) { x } \/ J \( g \) = mu } . $

#thm([Lemma 4.1.])[
  (The precise jet locus).  #emph[The subset $U_mu$ is locally closed algebraic.
    On $U_mu$, the function $g mapsto beta \( V \( g \) \, 0 \)$ has finite image and is algebraically constructible.]
] <lem:mu-jet-locus>

#proof[
  Work first in the finite-dimensional algebra $A_mu = bb(C) \[ x_1 \, x_2 \, x_3 \] \/ frak(m)^(mu + 1)$.
    The ideal generated by the partials of $g$ is the image of a linear map $A_mu^(xor 3) arrow.r
    A_mu$ whose matrix entries depend polynomially on the coefficients of $g$.
    The condition that its cokernel have dimension $mu$ is a locally closed rank condition.
  This condition tests the full local length, including exclusion of infinite length.
    Indeed, for the local algebra $A = bb(C) { x } \/ J \( g \)$ with maximal ideal $frak(n)$,
    suppose $dim_(bb(C)) A \/ frak(n)^(mu + 1) = mu$. The $mu +
    1$ successive layers $frak(n)^j \/ frak(n)^(j + 1)$, $0 lt.eq j lt.eq mu$, cannot all be nonzero.
    If a layer vanishes, Nakayama’s lemma applied to the finitely generated ideal $frak(n)^j$ shows that this
    ideal is zero. Consequently $A$ already has length $mu$. The converse follows from the same filtration.
    Polynomial, localized algebraic, and convergent power-series computations give the same truncated quotient.
    This proves the first assertion.
  For constructibility, let $B$ be any irreducible locally closed subvariety of $U_mu$;
    replace it first by a smooth dense open. Consider its universal hypersurface with the origin section.
    After another dense open restriction on $B$, there is a Zariski neighborhood of this section on which the
    relative singular locus is exactly the section. To see this,
    isolatedness in each fiber implies that the section is an irreducible component of the relative critical
    locus: a larger component containing it would have a positive-dimensional fiber at a general section point,
    by the dimension inequality. The other components meet the section over proper closed subsets of $B$.
    Remove those subsets from $B$, then remove those components from the total space.
    The resulting total hypersurface is Cohen–Macaulay and regular off a subset of codimension two, hence normal.
    Its fibers have dimension two, so miracle flatness over the smooth base gives flatness;
    it is smooth over $B$ off the section.
  Take a projective resolution, isomorphic off the section,
    which principalizes its ideal and has simple normal crossing reduced exceptional divisor $E$.
    Characteristic-zero resolution of singularities and principalization provide this construction;
    see #cite(label("Wlodarczyk2005")) Theorems 1.0.1–1.0.3. Generic smoothness,
    applied to the resolution space and every intersection of components of $E$,
    permits a further dense open restriction on $B$ such that the resolution is smooth over $B$ and $E$ is a
    relative simple normal crossing divisor. Nondominating exceptional strata are discarded in making this
    restriction. Since the resolution is projective and all of $E$ lies over the section,
    $E$ and all intersections of its components are proper over $B$.
  The fibers are now good resolutions of the surface germs at the origins.
    Their weighted exceptional dual graphs are locally constant in the complex topology,
    up to permutation of the vertices. In fact smooth proper variation preserves the connected components and
    genera of the exceptional curves, as well as their intersection points and incidence.
    Their self-intersections are degrees of the normal line bundles obtained by restricting the divisor line
    bundles on the resolution space. These degrees are locally constant in smooth proper curve families.
    If a total divisor has several components in a fiber, they are disjoint because that relative divisor is
    smooth, so the same degree calculation applies to each component.
  The weighted graph determines $beta$. It determines the exceptional intersection matrix,
    and adjunction gives $K dot.op E_i = 2 g \( E_i \) - 2 - E_i^2$ for each exceptional curve.
    Thus it determines all intersections of $K + E$ with the exceptional curves,
    and hence its relative Zariski decomposition and the square of its numerical exceptional representative.
    An irreducible smooth complex base is connected, so $beta$ is constant on this dense open of $B$.
    Noetherian induction on the remaining closed subsets yields a finite stratification of $U_mu$ on which $beta$
    is constant. ◻
]

#thm([Proposition 4.2.])[
  (Scalar curve reduction).  #emph[Assume the following algebraic assertion:
    for every polynomial family in three variables with regular coefficients on a smooth complex algebraic curve
    $C$, with zero constant and linear terms and constant positive Milnor number at the origin,
    the Wahl invariant at a marked non-log-canonical fiber equals its value on the nearby general fibers.
    Then $beta \( X_t \, 0 \)$ is constant near $t = 0$ in every holomorphic $mu$-constant family whose central
    surface germ is non-log-canonical.]
] <prop:scalar-curve-reduction>

#proof[
  Take $N gt.eq mu + 1$ and consider the holomorphic coefficient map $a : Delta arrow.r V_N$, $a \( t \) =
    j^N f_t$. By Lemma 4, it takes values in $U_mu$ and preserves the analytic type of every individual surface
    germ, hence its Wahl invariant. Write $a_0 = a \( 0 \)$ and $beta_0 = beta \( V \( a_0 \) \, 0 \)$.
  If constancy fails on every smaller disk, $a_0$ lies in the closure of the constructible set
  $ Z_eq.not = { g in U_mu : beta \( V \( g \) \, 0 \) eq.not beta_0 } . $
  The closure here may be taken in the Zariski topology: an accumulating sequence of coefficient vectors already
    forces this inclusion. Choose an irreducible locally closed subset of $Z_eq.not$ whose closure in $U_mu$
    contains $a_0$. After restricting to an affine neighborhood of $a_0$,
    its closure is an irreducible affine variety $Z$ of positive dimension,
    containing a dense open $Z^compose subset Z_eq.not$.
  There is an algebraic curve in $Z$ through $a_0$ whose general point lies in $Z^compose$.
    For completeness, choose a finite Noether normalization $pi : Z arrow.r
    bb(A)^d$ and translate so that $pi \( a_0 \) = 0$. The image of $Z \\ Z^compose$ is a proper closed subset.
    Choose a line through $0$ not contained in that image. Its inverse image is cut out in $Z$ by $d -
    1$ equations, so every irreducible component through $a_0$ has dimension at least one.
    Finiteness of $pi$ gives the opposite inequality and prevents a one-dimensional component from mapping to a
    point. Such a component therefore dominates the line and has general point in $Z^compose$.
    Normalize it, choose a point over $a_0$, and remove the finitely many other points needed to obtain the
    desired marked smooth curve $C$. The inclusion into coefficient space supplies regular polynomial coefficients
    on $C$.
  Every member of this curve lies in $U_mu$, its marked fiber is the polynomial $a_0$ with non-log-canonical
    surface germ, and its general Wahl invariant differs from $beta_0$.
    This contradicts the assumed algebraic assertion. Therefore the invariant is constant in the original analytic
    family after shrinking. ◻
]

Appendix 11 gives a second curve comparison, using irreducible components of $U_mu$ directly;
  it does not require constructibility of the scalar invariant.

=== 4.1 A projective family with the prescribed singularities <sec:compactification>

The following construction allows the local invariant to be compared by ordinary intersection numbers on
  projective surfaces. It preserves each individual analytic right type;
  no simultaneous analytic coordinate change is needed.

#thm([Lemma 4.3.])[
  (Compactification with one singular point).  #emph[Let $C$ be a smooth connected complex algebraic curve with
    marked point $0$. Let $g_c \( x_1 \, x_2 \, x_3 \)$ be polynomials of bounded degree $l$,
    with coefficients regular on $C$, satisfying $g_c \( 0 \) = 0$ and $d_x g_c \( 0 \) = 0$.
    Suppose the critical point at the origin is isolated and has the same finite Milnor number $mu$ for every $c
    in C$. After replacing $C$ by a Zariski neighborhood of $0$,
    there is a flat projective hypersurface family $X subset bb(P)^3 times C$ of some fixed degree $d$,
    with section $Gamma$, such that each fibre is integral and normal, smooth outside $Gamma \( c \)$,
    and its germ at $Gamma \( c \)$ admits a defining function analytically right-equivalent to $g_c$. Furthermore,
#[#set math.equation(numbering: n => "(3)")
 $ K_(X_c)^2 & = d \( d - 4 \)^2 \,\
chi_c \( X_c \\ { Gamma \( c \) } \) & = d \( d^2 - 4 d + 6 \) - mu - 1 . $ <eq:compact-canonical-square>]

 The total space $X$ is normal and Gorenstein. These conclusions remain valid after a finite change of smooth base
   curves.]
] <lem:compactification>

#proof[
  Choose $d > l$ with $d gt.eq mu + 2$ and homogeneous coordinates $\[ x_1 : x_2 : x_3 : w \]$ on $bb(P)^3$.
    Homogenize $g_c$ to degree $d$, obtaining $G_c \( x \, w \)$, and set
  $ X_c = { G_c \( x \, w \) + Q_d \( x \) = 0 } \, wide Gamma \( c \) = \[ 0 : 0 : 0 : 1 \] \, $
  where $Q_d$ is a general homogeneous form of degree $d$ in the three spatial coordinates, independent of $c$.
  Since $Q_d in frak(m)^(mu + 2)$, Lemma 4 shows, for each $c$ separately,
    that adding $Q_d$ preserves the analytic right type of $g_c$.
    This finite-determinacy and high-degree-tail compactification is also the construction used in
    #cite(label("Steenbrink1985")) Lemma 2.5.
  At $c = 0$, the linear system spanned by $G_0$ and all forms $Q_d \( x \)$ has base locus exactly
    ${ \[ 0 : 0 : 0 : 1 \] }$. The characteristic-zero Bertini theorem #cite(label("KleimanBertini")) Theorem 4.1
    therefore makes a general member smooth elsewhere; its nonzero coefficient of $G_0$ can be normalized to one.
    One can also see the required Bertini assertion directly.
    On $U = bb(P)^3 \\ { \[ 0 : 0 : 0 : 1 \] }$, the incidence variety
  $ { \( z \, Q \) : G_0 \( z \) + Q \( z \) = 0 } subset U times H^0 \( bb(P)^2 \, cal(O) \( d \) \) $
  is an affine bundle over $U$, since evaluation of the forms is surjective at every $z in U$. It is smooth.
    Its generic fibre over the coefficient space is regular, being obtained by localization,
    and hence smooth over its characteristic-zero function field.
    The nonsmooth locus has constructible image missing the generic point,
    so a nonempty open set of choices has smooth fibres.
  There are no other singularities for complex parameters sufficiently near $0$.
    Indeed, otherwise projectivity gives a sequence of singular points converging to the unique singular point of
    $X_0$. They are then in the chart $w = 1$. Conservation of the spatial-gradient number in a small ball
    contradicts their existence, since the origin already accounts for the full constant number $mu$.
    The parameters with an additional singular point form a constructible subset of $C$.
    A constructible subset of an algebraic curve which misses an analytic neighborhood of $0$ is finite;
    removing it gives the required Zariski neighborhood.
  Every resulting projective hypersurface has only one singular point. It is reduced and irreducible:
    a repeated component or the intersection of two distinct surface components would give a positive-dimensional
    singular locus. The hypersurface is Cohen–Macaulay and regular in codimension one, hence normal.
    Since the defining equation is nonzero on every ambient fibre,
    it is a relative effective Cartier divisor and the family is flat. Outside the section it is smooth over $C$.
    The total hypersurface is Gorenstein and regular in codimension one, so it too is normal.
  Adjunction gives $omega_(X_c) = cal(O)_(X_c) \( d - 4 \)$ and therefore (3).
    A small global smoothing changes only a Milnor neighborhood of the singular point:
    outside it the family is a proper submersion with transverse boundary.
    Replacing the contractible singular neighborhood by its Milnor fibre increases Euler characteristic by $mu$.
    A smooth degree-$d$ surface in $bb(P)^3$ has Euler characteristic $d \( d^2 - 4 d + 6 \)$,
    as follows from its tangent-normal exact sequence and the Gauss–Bonnet formula. This proves (3).
    Such a smoothing can, for example, be obtained by subtracting $epsilon w^d$;
    near the isolated critical point this is the usual Milnor smoothing,
    and compactness preserves smoothness away from that neighborhood.
  A change of base leaves the individual projective surfaces and their germs unchanged.
    Over a smooth new curve the relative hypersurface description, flatness, smoothness off the section,
    and the same codimension-one argument give all the remaining assertions again. ◻
]

== 5 A semistable log model <sec:log-model>

The algebraic comparison requires a model on which the exceptional curves of the general surface form a horizontal
  boundary. The following construction keeps that boundary while making the special fibre reduced.
  Its output is the input for the support and adjunction arguments in the next section.

#thm([Proposition 5.1.])[
  (The relative log model).  #emph[Let $C$ be a smooth connected complex algebraic curve with a marked point $0$,
    and let $pi : X arrow.r C$ be a flat projective family of integral normal Gorenstein surfaces.
    Suppose that $X$ is normal and Gorenstein, that a section $Gamma subset X$ contains every fibre singularity,
    and that $pi$ is smooth on $X \\ Gamma$. Then, after shrinking $C$ about $0$ and making a finite base change
    from a smooth curve, there is a projective birational morphism
$ h : Y arrow.r X $

 with the following properties. Here $X$, $C$, $Gamma$ and $0$ denote the base-changed objects,
   and $H$ is the sum, with coefficient one, of all $h$-exceptional prime divisors dominating $C$.]
  + #emph[$Y$ is normal and $bb(Q)$-factorial, and $h$ is an isomorphism over $X \\ Gamma$.]
  + #emph[For every $c in C$, the scheme fibre $Y_c$ is a reduced Cartier divisor,
    and $\( Y \, H + Y_c \)$ is divisorial log terminal.]
  + #emph[$K_Y + H$ is nef over $X$. Every vertical $h$-exceptional prime divisor lies in $Y_0$ and maps to the
    point $Gamma ∩ X_0$.]
  + #emph[For $c eq.not 0$, the surface $Y_c$ is integral and normal,
    and the divisor $H \|_(Y_c)$ is reduced as a Weil divisor.
    The fibre $Y_0$ has a unique component dominating $X_0$; its remaining components are projective surfaces over
    $Gamma ∩ X_0$.]
] <prop:log-model>

Here nefness over $X$ means nonnegative intersection with every complete curve contracted by $h$.
  A divisorial log terminal (dlt) pair is used in the usual characteristic-zero sense;
  in particular its coefficient-one components are normal and it has simple normal crossings at the generic points
  of their intersection strata. We construct the marked semistable model by Proposition 31,
  which makes explicit the dimension-three monomial reduction of #cite(label("KM1998")) Theorems 7.17 and 7.19,
  and then apply the semistable minimal model theorem #cite(label("KM1998")) Theorem 7.9.
  In its terminology, a dlt morphism to a smooth curve requires the fibre to be included in the boundary at every
  parameter #cite(label("KM1998")) Definition 7.1.

#proof[
  First choose a projective log resolution $g : Z arrow.r X$ which principalizes the ideal of $Gamma$ and resolves
    the union with $X_0$. We choose it to be an isomorphism over $X \\ Gamma$:
    that open set is smooth and its special fibre is already smooth.
    Thus $Z$ is smooth, $g^(- 1) \( Gamma \)$ has divisorial support,
    and the union of this support with the support of $Z_0$ has simple normal crossings.
    All exceptional divisors of $g$ lie over $Gamma$. By generic smoothness for $Z arrow.r
    C$ and for the finitely many strata of its exceptional divisor,
    we may delete finitely many base points other than $0$ so that $Z arrow.r
    C$ is smooth away from $0$ and every fibre support together with the exceptional divisor has simple normal
    crossings. After the same shrinking, every vertical exceptional divisor lies over $0$.
  Let $H_Z$ be the reduced horizontal exceptional divisor of $g$, and write $Z_0 = sum a_j Z_j$.
    The preceding shrinking makes $\( Z_0 \)_(upright("red")) + H_Z$ simple normal crossing,
    with $H_Z$ relatively simple normal crossing over $C \\ { 0 }$.
    Choose a positive integer $b$ divisible by every $a_j$, and a parameter $tau$ at $0$ regular with no other
    zero on a Zariski neighbourhood. The cover $s^b = tau$, with its smooth normalization, is finite,
    ramified to order $b$ over $0$, and étale elsewhere. We again write $X$,
    $C$ and $Gamma$ for the pulled-back objects.
  The pulled-back target $X$ is still normal and Gorenstein.
    Indeed the chosen curve cover is locally $s^b = tau$, so the target is locally the hypersurface
    $A \[ s \] \/ \( s^b - tau \)$ over a Gorenstein ring $A$.
    It is therefore Gorenstein and satisfies Serre’s condition $S_2$.
    Off the section it is smooth over the new smooth curve, while the section has codimension two.
    Thus it satisfies $R_1$ and is normal. Its fibres remain integral,
    so the flat total space over the connected covering curve is integral.
  Apply Proposition 31 to $Z$ with marking $H_Z$ and the chosen cover.
    It gives a smooth variety $V$, projective over the normalized pullback of $Z$,
    whose special fibre is reduced and simple normal crossing together with the transformed horizontal marking.
    The construction is an isomorphism on the normalized pullback away from $0$,
    where the family and marking already have these properties.
    Over $X \\ Gamma$, the original morphism was smooth and the marking was empty,
    so the same assertion shows that $V arrow.r X$ is an isomorphism there.
    Thus all exceptional divisors still lie over $Gamma$, and every vertical exceptional divisor lies over $0$.
  Let $H_V$ be the reduced sum of the horizontal exceptional prime divisors on $V$.
    Since the modification is an isomorphism away from $0$, $H_V$ is precisely the transformed reduced marking
    $H_Z$. For every $c$, the pair $\( V \, H_V + V_c \)$ is simple normal crossing.
    Consequently $\( V \, H_V \) arrow.r C$ is a dlt morphism.
    The relative minimal model program of #cite(label("KM1998")) Theorem 7.9 applies to the threefold pair
    $\( V \, H_V \)$ over the flat target $X arrow.r C$. All its contractions and flips are projective over $X$,
    it terminates, and the resulting morphism $\( Y \, H \) arrow.r C$ is again dlt.
    Its alternative of a Mori fibre space cannot occur: such a space would factor the dominant morphism from the
    threefold to $X$ through a variety of dimension less than three. We therefore obtain $K_Y + H$ nef over $X$.
  The program consists of divisorial contractions and flips, so it extracts no divisors.
    Every surviving horizontal exceptional prime consequently retains coefficient one in $H$,
    and every vertical exceptional prime still lies over $0$.
    Each step is an isomorphism over $X \\ Gamma$, since there were no relative curves to contract there.
    The usual preservation of $bb(Q)$-factoriality in this program gives the asserted $bb(Q)$-factorial model.
  For completeness, the scheme-theoretic fibre is precisely the boundary fibre used above.
    The pullback of a local parameter at $c$ is a nonzerodivisor on the integral normal variety $Y$,
    so $Y_c$ is Cartier. Its order at every prime component is one:
    the corresponding divisorial valuation occurred on $V$, where the fibre was reduced,
    and the program did not extract divisors. A principal divisor with these orders on a normal variety defines a
    reduced subscheme. Locally, if $u^n in \( t \)$, the height-one valuations show that $u \/
    t$ is regular at every height-one prime; normality then gives $u \/ t in cal(O)_Y$. Thus $\( t \)$ is radical.
  For $c eq.not 0$ there are no vertical exceptional divisors, and $X_c$ is integral.
    Its strict transform is therefore the only component of $Y_c$. This component is normal by the dlt property.
    At the generic point of each curve in $H ∩ Y_c$, the pair is simple normal crossing;
    hence the Cartier fibre cuts $H$ with multiplicity one, giving the reduced Weil divisor $H \|_(Y_c)$.
    Over $0$ there is again just one strict transform of $X_0$; all other components are exceptional.
    They map into $Gamma ∩ X_0$ and are projective, because $h$ is projective. This proves all the assertions. ◻
]

The proposition identifies $H$ as the full surviving horizontal divisorial boundary.
  It does not yet identify the whole set $h^(- 1) \( Gamma \)$ with the boundary,
  nor identify the different in adjunction on each fibre component.
  Those are separate consequences of nefness, non-log-canonicity and the support argument proved next.

=== 5.1 The full exceptional boundary <sec:full-boundary>

The log model must remember every point over the singular section.
  This section proves that relative nefness forces that property in the non-log-canonical case.
  It also identifies precisely the boundary entering surface adjunction.
  The existence of the model is an input to this section.

Let $C$ be a smooth connected complex curve with distinguished point $0$, let $sigma : X arrow.r
  C$ be a flat family of normal Gorenstein surfaces, and let $Gamma subset X$ be a section.
  Assume that $X$ is normal and Gorenstein. Consider a projective birational morphism

$ h : Y arrow.r X \, wide q = sigma compose h \, $

where $Y$ is a normal $bb(Q)$-factorial threefold and $h$ is an isomorphism over $X \\ Gamma$.
  Write $H$ for the reduced sum of the $h$-exceptional prime divisors dominating $C$.
  Assume that all vertical $h$-exceptional prime divisors lie over $0$,
  that every fiber $Y_c$ is a reduced Cartier divisor, and that

$ Y_0 = S_0 + sum_a S_a \, $

where $S_0$ maps birationally onto $X_0$ and every $S_a$ maps to the point $Gamma ∩ X_0$.
  We assume that $Y_c$ is irreducible for $c eq.not 0$, that $\( Y \, H + Y_c \)$ is dlt for all $c$ under
  consideration, and that

$ L = K_Y + H $

is $h$-nef. We use compatible canonical divisors and put

$ A = L - h^(*) K_X \, wide D = Y_0 + H . $

The assumptions on the fibers may equally be imposed after shrinking $C$.
  For a component $S$ of $Y_c$, let $B_S$ be the reduced union of the curves in which $S$ meets the other
  components of $H + Y_c$.

#thm([Lemma 5.2.])[
  (Surface adjunction).  #emph[Every component $S$ of $Y_c$ is normal. Its different is exactly $B_S$:
$ \( K_Y + H + Y_c \) \|_S tilde.op_(bb(Q)) K_S + B_S . $

 In particular $\( S \, B_S \)$ is dlt and
$ L \|_S tilde.op_(bb(Q)) K_S + B_S . $

 The latter divisor is nef on every curve contracted by $h \|_S$.
   For an extra vertical component $S_a$, it is nef on the projective surface $S_a$.]
] <lem:surface-boundary>

#proof[
  Dlt adjunction gives normality of $S$ and a dlt pair $\( S \, "Diff"_S \( H + Y_c - S \) \)$;
    see #cite(label("Fujino2011")) Lemma 10.2. We check the coefficients of the different at every prime curve of $S$.
  If a prime curve lies in another component of $H + Y_c$, its generic point is an lc stratum.
    The dlt pair is simple normal crossing there, so ordinary adjunction gives coefficient one.
    Here we use the description of dlt lc centers as boundary strata and the defining simple-normal-crossing
    property at their generic points; see #cite(label("Kollar2023Families")) Definition 11.5 and (11.10.4).
  At the generic point $eta$ of any other prime curve of $S$, no other component of $H + Y_c$ is present.
    Thus $S$ equals the Cartier divisor $Y_c$ near $eta$. The local ring $cal(O)_(S \, eta)$ is a regular
    one-dimensional local ring, since $S$ is normal. If $t$ is a local equation of the fiber,
    the two-dimensional local ring $R = cal(O)_(Y \, eta)$ satisfies
  $ R \/ \( t \) = cal(O)_(S \, eta) . $
  Consequently its maximal ideal is generated by $t$ and one lift of a generator of the maximal ideal of
    $R \/ \( t \)$. The embedding dimension of $R$ is at most two, and $R$ is regular.
    Ordinary adjunction therefore gives coefficient zero at this curve.
    This proves equality of the different and $B_S$ as divisors; no other prime-curve contribution remains.
  The line bundle of $Y_c = q^(*) \( c \)$ restricts trivially to $S$, giving the formula with $L$.
    Its degree on a curve contracted by $h \|_S$ is the degree of $L$ on that curve and is nonnegative.
    Finally, $S_a$ is projective because it is a closed subvariety of the projective fiber of $h$ over $Gamma ∩
    X_0$, and every curve on $S_a$ is contracted by $h$. ◻
]

#thm([Proposition 5.3.])[
  (Support over a non-log-canonical section).  #emph[Assume in addition that the surface $X_c$ is not log
    canonical at $Gamma ∩ X_c$ for general $c in C$. Then $A lt.eq 0$,
    some horizontal coefficient of $A$ is strictly negative, and
$ h^(- 1) \( Gamma \) = "Supp" \( - A \) = "Supp" \( H \) union union.big_a S_a $

 as sets. In particular $B_(S_0)$ is the full reduced exceptional preimage of $Gamma ∩ X_0$ on $S_0$,
   and $B_(Y_c)$ has the same property on every $Y_c$ with $c eq.not 0$. Thus
$ S_0 \\ "Supp" \( B_(S_0) \) tilde.eq X_0 \\ Gamma \, wide
  Y_c \\ "Supp" \( B_(Y_c) \) tilde.eq X_c \\ Gamma quad \( c eq.not 0 \) . $

]
] <prop:full-exceptional-boundary>

#proof[
  The divisor $A$ is exceptional, since $h$ is an isomorphism away from $Gamma$, and is $h$-nef,
    since a pullback from $X$ has degree zero on contracted curves. Apply the negativity lemma to $- A$:
    its pushforward is zero, so $- A$ is effective #cite(label("Fujino2011")) Lemma 4.16(1).
  Suppose every horizontal coefficient of $A$ were zero. The support of $A$ would then lie over $0$.
    For general $c eq.not 0$, its restriction to $Y_c$ would be zero.
    By Lemma 11 and Cartier-fiber adjunction on $X$, with compatible canonical divisors, this gives a crepant comparison
  $ K_(Y_c) + B_(Y_c) = h_c^(*) K_(X_c) \, wide h_c = h \|_(Y_c) . $
  The pair on the left is log canonical. Computing discrepancies on a common resolution now shows that $X_c$ is
    log canonical: the discrepancy of a divisor exceptional over $Y_c$ is unchanged,
    and a boundary component on $Y_c$ has discrepancy $- 1$ over $X_c$. This contradicts the hypothesis.
    Thus at least one horizontal exceptional prime has negative coefficient.
  Such a prime maps onto $Gamma$: its image is closed by properness, is contained in $Gamma$, and dominates $C$.
    Therefore every fiber of $h$ over $Gamma$ meets $"Supp" \( - A \)$.
    The support statement in the negativity lemma says that each fiber of a proper birational morphism between
    normal varieties either lies in the support of an effective anti-nef divisor or is disjoint from it
    #cite(label("Fujino2011")) Lemma 4.16(2). Applying it to $-
    A$ proves $h^(- 1) \( Gamma \) subset "Supp" \( - A \)$; the reverse inclusion holds because $A$ is
    exceptional over $Gamma$.
  Every prime in $"Supp" \( - A \)$ is either a component of $H$ or one of the $S_a$,
    by the assumptions on the exceptional primes. Conversely these divisors map into $Gamma$ and hence lie in the
    support. Intersect this equality with $S_0$. None of the listed divisors equals $S_0$,
    and their intersections are precisely the boundary curves defining $B_(S_0)$;
    dlt strata have the expected codimension. Hence there are no additional exceptional points or curves on $S_0$
    outside this boundary. The same argument on $Y_c$, $c eq.not 0$, uses only $H$.
    The stated isomorphisms follow from the assumed isomorphism away from $Gamma$. ◻
]

#prodef([Remark 5.4.])[
  Lemma 11 identifies a divisor on a surface. It does not assert that further adjunction to a boundary curve has
    zero fractional different, nor that the threefold is smooth at every closed boundary point.
    Those are distinct local questions.
]

== 6 The nearby Euler characteristic along the boundary <sec:nearby-euler>

We now compare a nearby open fiber of the log model with the open surfaces in its special fiber.
  The essential local assertion is that boundary intersections contribute zero,
  including the points where the threefold is singular. We first prove that assertion independently of the global
  construction.

For a complex algebraic variety, write $chi_c$ for the Euler characteristic with compact supports.
  On a complex algebraic variety it equals the ordinary Euler characteristic.
  If $f : Z arrow.r bb(C)$ is regular, the #emph[nearby Euler function] $psi_f$ is the unshifted nearby-cycle
  operation on constructible functions. In particular, $psi_f \( upright(bold(1))_V \) \( z \)$ is the Euler
  characteristic of the local Milnor fiber of $f \|_V$ when $V$ is closed.
  Extend this definition by additivity to constructible functions.
  Equivalently, take stalk Euler characteristics of the usual, unshifted sheaf nearby cycles.
  This operation depends only on the restriction away from $f^(- 1) \( 0 \)$ and commutes with proper pushforward.
  For a finite map $rho$, pushforward is the sum over the finite set $rho^(- 1) \( z \)$;
  for a general proper map it is integration with respect to $chi_c$.
  These conventions and the proper compatibility are recalled in #cite(label("SchuermannNearby")) Definition 3.2
  and #cite(label("MaximSchuermann")) Proposition 4.19(1).

#thm([Lemma 6.1.])[
  (Boundary covers in dimension three).  #emph[Let $Z$ be a normal complex algebraic threefold and let $B =
    sum_(j = 1)^n B_j$ be a reduced divisor with distinct prime components.
    Assume that $\( Z \, B \)$ is dlt and that every $B_j$ is $bb(Q)$-Cartier.
    If $z$ lies on at least two of the $B_j$, then, after replacing $Z$ by a neighborhood $U$ of $z$,
    there is a finite surjective map $rho : tilde(U) arrow.r U$ from a normal variety such that:]
  + #emph[$rho$ is étale in codimension one and over $U \\ B$,
    and every total pullback $rho^(*) B_j$ is a reduced Cartier divisor;]
  + #emph[$\( tilde(U) \, rho^(*) B \)$ is dlt and is simple normal crossing at every point of $rho^(- 1) \( z \)$.]
] <lem:boundary-cover>

#proof[
  Shrink $U$ so that the only boundary components present are those through $z$,
    and choose regular functions $g_j$ with $"div" \( g_j \) = m_j B_j$, where $m_j$ is a positive integer.
    Normalize $U$ in a field extension obtained by adjoining roots $a_j^(m_j) = g_j$ for all $j$.
    Normalization is finite here, and taking one field extension gives a finite surjective map of some degree $d$.
    This is the usual local boundary-Cartier cover; see also #cite(label("Kollar2023Families")) Proposition 11.25.
  At a codimension-one point, write each $g_j$ as a unit times the $m_j$-th power of a local equation,
    or as a unit if $B_j$ is absent. Adjoining its root is therefore unramified there.
    The same argument shows that the cover is étale wherever all the $B_j$ are Cartier,
    in particular over $U \\ B$ and over the simple normal crossing locus of $\( U \, B \)$.
    Consequently $"div" \( a_j \) = rho^(*) B_j$ has coefficient one on every prime in its support.
    Thus the total pullback is reduced and Cartier.
  Put $tilde(B) = rho^(*) B$. The codimension-one ramification formula gives
  $ K_(tilde(U)) + tilde(B) = rho^(*) \( K_U + B \) $
  with compatible canonical divisors. More generally, if a divisorial valuation $F$ upstairs restricts to $e$
    times a normalized divisorial valuation $E$ downstairs, then
  #[#set math.equation(numbering: n => "(4)")
   $ A \( F \, tilde(U) \, tilde(B) \) = e A \( E \, U \, B \) \, $ <eq:finite-log-discrepancy>]
  where $A$ denotes log discrepancy. To see the formula, choose a birational model on which $E$ is a divisor and
    normalize it in the upper function field. At the generic point of $F$,
    the ramification divisor has coefficient $e - 1$. Hence the discrepancy coefficients satisfy $a_F =
    e a_E + \( e - 1 \)$, giving (4). Restriction of a divisorial valuation through a finite extension is
    divisorial, since its value group has finite index and its residue field has the same transcendence degree.
    This is the finite-cover discrepancy formula of #cite(label("KM1998")) Proposition 5.20;
    see also #cite(label("Kollar2023Families")) 11.22–11.23.
  It follows that the upper pair is log canonical and that every log canonical center upstairs maps onto a log
    canonical center downstairs. Each lower center meets the simple normal crossing locus because the lower pair
    is dlt. The cover is étale there, so each upper center also meets the simple normal crossing locus.
    This is the dlt criterion. We use the standard facts that the log canonical centers of a dlt pair are the
    normal strata of its coefficient-one boundary, with the expected codimensions,
    and that intersections of log canonical centers are unions of such centers;
    see #cite(label("FujinoDlt")) Proposition 9.2 in the author draft and #cite(label("Kollar2023Families"))
    Definition 11.5 and 11.10.
  Fix $y in rho^(- 1) \( z \)$. There is at least one upper boundary prime through $y$ over each lower boundary
    prime through $z$. Indeed each root $a_j$ vanishes at $y$, so its Cartier divisor contains $y$.
    Primes over distinct lower primes are distinct, since a finite map preserves their dimensions.
    Thus at least two upper primes meet at $y$. If at least three meet,
    the dlt stratum theorem makes $y$ a zero-dimensional log canonical center.
    The dlt criterion then says that the upper pair is simple normal crossing at $y$.
  Suppose instead that precisely two upper boundary primes $T_1 \, T_2$ meet at $y$.
    They lie over distinct lower primes; hence each agrees near $y$ with its entire reduced Cartier pullback and
    is itself Cartier there. The surface $T_1$ is normal by dlt adjunction,
    and a normal surface is Cohen–Macaulay. Therefore the Cartier curve $C = T_2 \|_(T_1)$ has no embedded points.
    It is generically reduced, because the pair is simple normal crossing at the generic points of its curve
    strata, so it is reduced. Each irreducible component of $C$ is a normal curve, hence smooth.
    Two such components cannot meet at $y$: their intersection would make $y$ a log canonical center,
    forcing simple normal crossings there, whereas a simple normal crossing threefold pair with only two boundary
    branches has no zero-dimensional log canonical center. Consequently $C$ is a smooth curve near $y$.
  Let $R = cal(O)_(tilde(U) \, y)$ and let $a \, b$ define $T_1 \, T_2$.
    Since $R \/ \( a \, b \)$ is a regular local ring of dimension one,
  $ "edim" R lt.eq "edim" \( R \/ \( a \, b \) \) + 2 = 3 = dim R . $
  Thus $R$ is regular. Moreover $a \, b$ have independent images in its cotangent space,
    so they are part of a regular system of parameters. The two boundary components are transverse.
    This proves the claimed simple normal crossing assertion in every case. ◻
]

#thm([Lemma 6.2.])[
  (Vanishing at boundary intersections).  #emph[Under the hypotheses of Lemma 14,
    suppose that a regular function $f$ has reduced zero divisor $V = sum_(j in I) B_j$,
    where $I$ is a nonempty subset of ${ 1 \, dots.h \, n }$. Put $H = sum_(j in.not I) B_j$.
    At every point $z in V$ lying on at least two components of $B$,
$ psi_f \( upright(bold(1))_(Z \\ H) \) \( z \) = 0 . $

]
] <lem:boundary-nearby-zero>

#proof[
  Use the finite cover of Lemma 14, and let $d$ denote its degree.
    At each point $y$ over $z$, choose analytic simple normal crossing coordinates.
    As the cover is unramified in codimension one, the vertical multiplicities remain one.
    After absorbing a unit into one coordinate, the pulled-back function and horizontal divisor are
  $ f compose rho = z_1 dots.h.c z_r \, wide rho^(- 1) H = { z_(r + 1) dots.h.c z_(r + h) = 0 } \, wide r gt.eq
    1 \, quad r + h gt.eq 2 . $
  When $h = 0$, the horizontal divisor is empty. For $r gt.eq 2$,
    the local Milnor fiber of the coordinate product has the homotopy type of $\( S^1 \)^(r - 1)$ and therefore
    Euler characteristic zero. The same is true after restricting to any intersection of horizontal coordinate
    hyperplanes. Inclusion–exclusion therefore gives zero for the complement of the horizontal boundary.
    For $r = 1$, each such restricted Milnor fiber is a polydisc, with Euler characteristic one.
    Here $h gt.eq 1$,
    so inclusion–exclusion gives $sum_(J subset.eq { 1 \, dots.h \, h }) \( - 1 \)^(\| J \|) = \( 1 - 1 \)^h = 0$.
    These computations may be made on small adapted polydiscs, or on Milnor balls,
    with the same local nearby Euler values.
  Let $tilde(alpha) = upright(bold(1))_(tilde(U) \\ rho^(- 1) H)$.
    Over $U \\ V$, its finite pushforward is $d upright(bold(1))_(U \\ H)$:
    away from $H$ the cover is étale of degree $d$, and on $H$ all the terms are zero.
    Since nearby cycles only use the restriction off $V$, proper compatibility gives
  $ d thin psi_f \( upright(bold(1))_(U \\ H) \) \( z \) = sum_(y in rho^(- 1) \( z \))
    psi_(f compose rho) \( tilde(alpha) \) \( y \) = 0 . $
  This is an identity of constructible Euler functions; no triviality of the covering local system is needed.
    Since $d > 0$, the result follows. ◻
]

#thm([Proposition 6.3.])[
  (Euler comparison for the log model).  #emph[Let $q : Y arrow.r
    C$ be a projective flat morphism from a normal complex threefold to a smooth pointed curve $\( C \, 0 \)$.
    Let $H$ be a reduced divisor with horizontal prime components.
    Assume that the Cartier fiber $Y_0 = sum S$ is reduced, that $\( Y \, Y_0 + H \)$ is dlt,
    and that its boundary components are $bb(Q)$-Cartier. Assume also that $Y_t \\ H$ is smooth for all
    sufficiently small $t eq.not 0$. For each component $S$ of $Y_0$,
    let $B_S$ be the reduced union of its intersections with the other components of $Y_0 + H$,
    and put $S^compose = S \\ B_S$. If each local smoothing of an isolated singularity in $S^compose$ has Milnor
    fiber Euler characteristic at least one, then
#[#set math.equation(numbering: n => "(5)")
 $ chi_c \( Y_t \\ H \) = sum_(S subset Y_0) chi_c \( S^compose \) + delta \, wide delta gt.eq 0 \,
   $ <eq:nearby-euler-comparison>]

 for all sufficiently small $t eq.not 0$.]
] <prop:nearby-euler-comparison>

#proof[
  Write $lambda = psi_q \( upright(bold(1))_(Y \\ H) \)$ using a local coordinate on $C$ at $0$.
    Proper compatibility gives
  $ chi_c \( Y_t \\ H \) = integral_(Y_0) lambda thin d chi_c . $
  At every point lying on at least two components of $Y_0 + H$, Lemma 15 gives $lambda = 0$.
    Every remaining point lies in exactly one $S^compose$. The surface $S$ is normal by dlt adjunction,
    so its singular points form a finite set. At a smooth point of $S^compose$,
    the local reduced Cartier fiber is precisely $S$. Its regular local ring is a quotient of the ambient local
    ring by the base parameter, so the ambient ring is regular and that parameter is part of a regular system of
    parameters. Thus $q$ is smooth there and $lambda = 1$.
  At a singular point $p in S^compose$, a neighborhood misses $H$ and all other special-fiber components.
    Flatness and the hypothesis on the nearby open fibers therefore give a smoothing of the normal isolated
    surface singularity $\( S \, p \)$. If $M_p$ is its Milnor fiber, then $lambda \( p \) = chi \( M_p \) gt.eq
    1$ by the assumed interior smoothing statement. Integrating the disjoint open surfaces and these finitely many
    corrections yields (5), with
  $ delta = sum_(S subset Y_0) sum_(p in "Sing" \( S \) ∩ S^compose) #scale(x: 120%, y: 120%)[\(] chi \( M_p \) -
    1 #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  ◻
]

In the projective log model $h : Y arrow.r X$, the special-fiber components are $S_0$ and the extra surfaces
  $S_a$. The preceding proposition applies once the interior smoothing inequality is supplied.
  In particular, the boundary calculation does not require the different obtained by further adjunction to a curve
  to have integral coefficients.

=== 6.1 Interior Milnor fibers and the surface inequality <sec:surface-estimates>

We need two signs in the nearby Euler comparison. The local smoothing of an interior singularity contributes at
  least the value $1$ contributed by a smooth point. On the other hand,
  the complement of a reduced boundary in an extra vertical surface has nonnegative Euler characteristic because
  its log canonical divisor is nef. We prove these statements separately.

We use ordinary Euler characteristic for compact local Milnor fibers.
  All Betti numbers below have rational coefficients.

#thm([Lemma 6.4.])[
  (The interior correction).  #emph[Let $q : \( cal(V) \, x \)
    arrow.r \( bb(C) \, 0 \)$ be a flat holomorphic germ whose scheme central fiber $\( S \, x \)$ is a normal
    surface with an isolated singularity and whose sufficiently small nonzero fibers are smooth.
    If $F_x$ is a sufficiently small Milnor fiber of $q$, then
$ chi \( F_x \) gt.eq 1 . $

 At a smooth point of a reduced Cartier central surface in a normal threefold,
   the local nearby Euler characteristic is $1$.]
] <lem:interior-correction>

#proof[
  Greuel–Steenbrink’s theorem #cite(label("GreuelSteenbrink1983")) gives $b_1 \( F_x \) =
    0$ for a smoothing of a normal isolated singularity; no Gorenstein hypothesis is required.
    We use the formulation in #cite(label("Greuel2019")) Theorem 2.18.
    Choose a Milnor representative with smooth transverse boundary.
    Its interior is a smooth Stein surface, being a closed analytic submanifold of a small open ball slice.
    The boundary collar makes this interior homotopy equivalent to the compact Milnor representative.
    By the Andreotti–Frankel dimension bound #cite(label("AndreottiFrankel1959")),
    a complex Stein surface has the homotopy type of a CW complex of real dimension at most two;
    see also #cite(label("HillNacinovich1993")) Theorem 1 and the following remark (2).
    Consequently $b_j \( F_x \) = 0$ for $j > 2$. The Milnor fiber is nonempty, so
  $ chi \( F_x \) = b_0 \( F_x \) + b_2 \( F_x \) gt.eq 1 . $
  For the last assertion, let $t$ denote the pulled-back base coordinate.
    At the point in question, the quotient of the threefold local ring by $\( t \)$ is regular of dimension two.
    Lifting generators of its maximal ideal and adjoining $t$ shows that the total local ring has embedding
    dimension at most three, hence is regular. The same dimension count shows that $t$ is a regular coordinate.
    Thus $q$ is smooth there and its small local fiber is contractible. ◻
]

#thm([Lemma 6.5.])[
  (The surface inequality).  #emph[Let $S$ be a normal projective surface over $bb(C)$,
    and let $B$ be a reduced effective Weil divisor, possibly empty.
    Suppose that $\( S \, B \)$ is log canonical and that the $bb(Q)$-Cartier divisor $K_S + B$ is nef.
    Set $S^compose = S \\ "Supp" B$. Then
$ 0 lt.eq \( K_S + B \)^2 lt.eq 3 e_(upright("orb")) \( S \, B \) lt.eq 3 chi_c \( S^compose \) \, $

 where $e_(upright("orb"))$ denotes Langer’s orbifold Euler number.]
] <lem:surface-bmy>

#proof[
  Nefness on the projective surface implies pseudoeffectivity and nonnegative self-intersection.
    The latter can also be checked after pulling back to a projective resolution,
    where the divisor is still nef and has the same square. The pseudoeffective form of Langer’s inequality gives
    $\( K_S + B \)^2 lt.eq 3 e_(upright("orb")) \( S \, B \)$ #cite(label("Langer2003")) Corollary 5.2.
  It remains to compare the two Euler numbers. By Langer’s definition,
    smooth points of the boundary have weight zero. At every singular point of the pair lying on that boundary the
    local orbifold number is also zero, since the boundary has a coefficient-one branch and the pair is log
    canonical #cite(label("Langer2003")) Theorem 7.6. For $Z = "Sing" S \\ "Supp" B$,
    the weighted formula therefore reads
  $ e_(upright("orb")) \( S \, B \) = chi_c \( S^compose \) +
    sum_(x in Z) #scale(x: 120%, y: 120%)[\(] e_(upright("orb")) \( x \; S \, 0 \) - 1 #scale(x: 120%, y: 120%)[\)] . $
  Every term in the sum is nonpositive by the local upper bound #cite(label("Langer2003")) Definition 3.4 and
    Corollary 7.8. This proves the last inequality, including all singular-point corrections. ◻
]

For application, write the reduced special fiber of the model as

$ Y_0 = S_0 + sum_a S_a \, $

where $S_0$ dominates the original special surface and each $S_a$ is an extra component contracted to its marked
  point. Let $B_S$ be the reduced boundary on a component $S$ supplied by adjunction, and put $S^compose =
  S \\ "Supp" B_S$. By Proposition 10 and Lemma 11, every $S_a$ is projective,
  $\( S_a \, B_(S_a) \)$ is dlt and hence log canonical, and its log canonical divisor is nef:
  all its curves are contracted by the morphism over which the threefold log divisor is nef.
  Lemma 18 consequently applies to each extra component. It need not apply to $S_0$.

Proposition 12 identifies the nearby complements $Y_c \\ H$ with the smooth punctured fibers $X_c \\ Gamma$ for $c
  eq.not 0$. Thus an interior singular point of any $S_a$ is smoothed by the family.
  Indeed the central fiber is locally that component alone, is normal and reduced Cartier,
  and the nearby fibers there are smooth. Its contribution in Lemma 17 exceeds the smooth-point value by the
  nonnegative number $chi \( F_x \) - 1$.

Lemma 15 supplies the vanishing of nearby Euler values at intersections of boundary components,
  and Proposition 16 combines it with these interior corrections.
  Theorem 21 will use that comparison and the two signs above to force every extra logarithmic square to vanish.
  The orbifold boundary calculation in the surface inequality concerns a different invariant and does not supply
  the nearby-Euler vanishing.

== 7 Specializing the logarithmic square <sec:square-specialization>

We now isolate the numerical consequence of the extra-component vanishing.
  All intersections in this section are ordinary projective intersection numbers;
  the conversion to the local invariant is exactly Lemma 5.

#thm([Lemma 7.1.])[
  (Square specialization).  #emph[Let $q : Y arrow.r C$ be a flat projective morphism to a smooth connected
    complex curve, with pure two-dimensional fibres. Let $L$ be a rational Cartier divisor on $Y$.
    If $\[ Y_0 \] = sum_j m_j \[ S_j \]$ is the cycle of a fibre, then for every $c in C$
$ \( L \|_(Y_c) \)^2 = sum_j m_j \( L \|_(S_j) \)^2 . $

 In particular, the multiplicities on the right are one when $Y_0$ is reduced.]
] <lem:square-specialization>

#proof[
  Choose $r > 0$ such that $r L$ is Cartier. Flatness and properness imply that
    $chi \( Y_c \, cal(O)_Y \( n r L \) \|_(Y_c) \)$ is constant in $c$ for every integer $n$
    #cite(label("StacksProject")) Lemma 36.32.2. This is a polynomial in $n$ of degree at most two,
    whose quadratic coefficient is $r^2 \( L \|_(Y_c) \)^2 \/ 2$.
    Its leading term is the sum of the leading terms on the two-dimensional components,
    weighted by their generic lengths #cite(label("StacksProject")) Lemmas 33.45.1, 33.45.2 and 33.45.6.
    Comparing these coefficients and dividing by $r^2$ proves the assertion. ◻
]

#thm([Proposition 7.2.])[
  (The numerical conclusion of the log model).  #emph[Let $X arrow.r C$, with section $Gamma$,
    be the projective family of Lemma 9. Let $h : Y arrow.r X$ be a projective birational morphism from a normal
    integral threefold, isomorphic off $Gamma$. Suppose $Y_0 = S_0 + sum_a S_a$ is reduced Cartier,
    $S_0$ maps birationally to $X_0$, and the $S_a$ map to $Gamma \( 0 \)$.
    Suppose that, after shrinking $C$, the other fibres $Y_c$ are normal and map birationally to $X_c$.]
  #emph[Let $H$ be the reduced horizontal exceptional boundary and set $L = K_Y + H$,
    assumed rational Cartier and $h$-nef. For each component $S$ of $Y_0$,
    let $B_S$ be the reduced divisor of its intersections with the other components of $Y_0 + H$.
    Assume that $\( S \, B_S \)$ is log canonical and
$ L \|_S tilde.op_(bb(Q)) K_S + B_S . $

 For $S_0$, require that $B_(S_0)$ is the full reduced inverse image of $Gamma \( 0 \)$.
   For $c eq.not 0$, require likewise that the full reduced inverse image $B_c$ of $Gamma \( c \)$ is a divisor,
   that $\( Y_c \, B_c \)$ is log canonical, and that $L \|_(Y_c) tilde.op_(bb(Q)) K_(Y_c) + B_c$. If
$ \( K_(S_a) + B_(S_a) \)^2 = 0 wide upright("for every ") a \, $

 then $beta \( X_c \, Gamma \( c \) \) = beta \( X_0 \, Gamma \( 0 \) \)$ for all remaining $c in C$.]
] <prop:beta-from-log-model>

#proof[
  The integral threefold $Y$ dominates the smooth curve, so it is flat:
    its local rings are torsion-free modules over the corresponding discrete valuation rings.
    Its fibres have pure dimension two, and it is projective over $C$.
    Lemma 19 and the assumed vanishing give, for $c eq.not 0$,
  $ \( K_(Y_c) + B_c \)^2 = \( L \|_(Y_c) \)^2 = \( L \|_(S_0) \)^2 +
    sum_a \( L \|_(S_a) \)^2 = \( K_(S_0) + B_(S_0) \)^2 . $
  The restrictions of $L$ are nef over the respective $X_c$, since $L$ is $h$-nef.
    The full-boundary hypotheses therefore allow Lemma 5 on both the central and noncentral birational models.
    The displayed equality and $K_(X_c)^2 = K_(X_0)^2$ yield the claimed equality of local invariants. ◻
]

When a finite change of curve was used to construct $Y$, this equality still concerns the original fibre
  singularities: such a change repeats individual fibres and does not alter their analytic germs.

Lemma 29 extends the specialization identity to nonproper families when the divisor has proper support over the
  curve. Its two proofs explain how the numerical comparison can be kept local.

=== 7.1 Constancy in the original analytic family <constancy-in-the-original-analytic-family>

The preceding results now establish the numerical hypothesis needed by simultaneous resolution.
  The passage through algebraic families has served only to compare the scalar invariant;
  we return afterwards to the original holomorphic family.

#thm([Theorem 7.3.])[
  (Constancy of the logarithmic invariant).  #emph[Let $F \( x \, t \)$ be a holomorphic family of isolated
    hypersurface singularities in $bb(C)^3$ with $f_t \( 0 \) = 0$ and constant positive Milnor number.
    If the central normal surface germ $X_0 = { f_0 = 0 }$ is not log canonical, then $beta \( X_t \, 0 \) =
    beta \( X_0 \, 0 \)$ for every sufficiently small $t$.]
] <thm:beta-constant>

#proof[
  By Proposition 8, it suffices to compare a polynomial family over a smooth algebraic curve at a marked
    non-log-canonical fiber with its nearby general fibers. Log canonicity is constant by Lemma 6,
    so all germs in the relevant connected curve are non-log-canonical.
    Apply Lemma 9 to obtain a projective hypersurface family with exactly these singularities and smooth
    complement of the section. Its punctured-fiber Euler characteristic and its canonical square are constant.
  Construct the model of Proposition 10, making its finite smooth curve base change. Write
  $ Y_0 = S_0 + sum_a S_a \, wide L = K_Y + H \, wide S^compose = S \\ "Supp" B_S . $
  Lemma 11 and Proposition 12 verify all the adjunction and full-boundary requirements. In particular,
  $ S_0^compose tilde.eq X_0 \\ Gamma \, wide Y_c \\ H tilde.eq X_c \\ Gamma quad \( c eq.not 0 \) . $
  The first of these open surfaces is smooth. On every other component,
    any isolated interior singularity is smoothed by the family,
    and Lemma 17 gives a nonnegative correction $chi \( F_x \) - 1$ to its nearby Euler value.
  Apply Proposition 16. Constancy of the punctured-fiber Euler characteristic and the two displayed isomorphisms
    cancel the contribution of $S_0^compose$, giving
  #[#set math.equation(numbering: n => "(6)")
   $ 0 = sum_a chi_c \( S_a^compose \) + delta \, wide delta =
     sum_a sum_(x in "Sing" \( S_a \) ∩ S_a^compose) \( chi \( F_x \) - 1 \) gt.eq 0 . $ <eq:zero-euler-sum>]
  Each $S_a$ is projective and its adjoint divisor is nef, so Lemma 18 gives
  $ 0 lt.eq \( K_(S_a) + B_(S_a) \)^2 lt.eq 3 chi_c \( S_a^compose \) . $
  Every term on the right side of (6) is therefore nonnegative. Every extra logarithmic square is zero.
  All hypotheses of Proposition 20 have now been verified. It gives equality of the logarithmic invariant on the
    marked and nearby general fibers. The finite base change used in the model repeats the individual surface
    germs, so this is equality for the original algebraic family as well.
    Proposition 8 then yields the assertion for the given holomorphic family. ◻
]

== 8 From the numerical invariant to a resolved family <sec:resolution>

We now assume that the central surface is not log canonical and that the numerical argument has established
  constancy of $beta \( X_t \, 0 \) = - P_(t \, upright("loc"))^2$.
  Okuma’s theorem gives a smooth resolved family after a finite disk cover,
  with reduced nodal exceptional restrictions. We then use the fixed-ball Euler identity to show that none of
  their nodes can smooth. This yields the relative normal-crossing divisor needed for complete transport in the
  next section.

A surface resolution is #emph[semigood] when its reduced exceptional divisor has normal crossings;
  irreducible components may have self-nodes. For a divisor in a smooth family of surfaces,
  #emph[relative normal crossings] means that near its points there are coordinates $\( z_1 \, z_2 \, u \)$ in
  which the family map is $u$ and the divisor is $z_1 = 0$ or $z_1 z_2 = 0$.

#thm([Proposition 8.1.])[
  #emph[Let $F \( x \, t \) = f_t \( x \)$ satisfy the hypotheses of the main theorem.
    Assume that $X_0 = { f_0 = 0 }$ is not log canonical and that $beta \( X_t \, 0 \)$ is constant.
    After shrinking the parameter disk and making a finite base change $t = u^e$, there is a proper modification
$ b : N arrow.r X' = { F \( x \, u^e \) = 0 } $

 such that $N arrow.r Delta_u$ is smooth, $b$ is an isomorphism off the origin section,
   and its reduced exceptional divisor $E$ has relative normal crossings.
   The restriction $b_u$ is the minimal semigood resolution, and $E \|_(N_u)$ is its full reduced exceptional divisor.]
] <prop:resolved-family>

#proof[
  The zero-fiber family is a flat deformation of a normal Gorenstein surface singularity.
    Each fiber has just the one singular point in the chosen representative.
    Thus constancy of the invariant at the section is also constancy of the sum over the singularities of the
    fiber, as used in Okuma’s notation.
  We first check the small-deformation setup in #cite(label("Okuma2004")) Sections 3–4.
    Resolve the analytic total space, and then principalize the pulled-back ideal of the section on the smooth
    resolution #cite(label("Wlodarczyk2009")) Theorems 2.0.1 and 2.0.3, Lemma 4.0.3.
    The composite is proper and isomorphic off the section: the total space is smooth there and the pulled-back
    ideal is the unit ideal there. Its full reduced inverse image of the section is a simple normal crossing
    divisor. The exceptional support is proper over the disk.
    The critical loci for the parameter map on the resolution and on all closed intersections of exceptional
    components lie in this proper support. These intersections are smooth.
    On each of them a critical component has constant parameter value;
    an intersection contained in a fiber also has a single value.
    Properness makes their images closed analytic subsets of the disk.
    After shrinking, their only possible value is zero. Hence the resolution over the punctured disk is smooth,
    with relative normal crossing exceptional divisor. These relative normal-crossing charts give a locally
    trivial deformation of the exceptional divisor there. This supplies the punctured-disk weak simultaneous
    resolution required by Okuma’s setup.
  Okuma’s Theorem 1.2 #cite(label("Okuma2004")) now gives a simultaneous resolution after a finite base change,
    with minimal semigood fiber resolutions and a reduced divisor $E$ whose every restriction is the full reduced
    exceptional divisor over the distinguished non-log-canonical section.
    That section is our origin section, because there are no other singularities.
    Take the normalization of a branch of the finite base change.
    A local parameter then puts its map to the original disk in the form $t = u^e$.
    Flatness and smooth fibers make the resulting resolved family smooth over this disk.
    Formation of the Cartier divisor restrictions commutes with this further base change.
    In particular their reducedness also holds at $u = 0$. The divisor $E$ contains no fiber,
    and its restrictions are effective Cartier divisors; hence it is a relative effective Cartier divisor.
    Its support is exactly $b^(- 1) \( { 0 } times Delta_u \)$.
  It remains to prove relative normal crossings, since fiberwise normal crossings alone do not give that
    conclusion. Choose the fixed closed Milnor ball $B$ from the preliminary Euler calculation and set $N_B =
    b^(- 1) \( X' ∩ \( B times Delta_u \) \)$. Its projection to the disk is a proper smooth submersion with
    boundary. Near the sphere boundary the modification is an isomorphism,
    and the required submersion follows from the uniform boundary transversality of the original family.
    Consequently $chi \( \( N_B \)_u \)$ is constant. The complement of $E_u$ in this fiber is isomorphic to
    $\( X_(u^e) ∩ B \) \\ { 0 }$. The preliminary identity $chi \( X_t ∩ B \) = 1$ and additivity,
    using compact supports on the complements, give
  $ chi \( E_u \) = chi \( \( N_B \)_u \) \, $
  so the compact reduced nodal curves $E_u$ have constant Euler characteristic.
  Here is the local consequence of that constancy. The divisor $E$ is Cartier in the smooth total space $N$.
    At a smooth point of $E_0$ it is already smooth over the parameter.
    At each node of $E_0$, the holomorphic Morse lemma with parameter gives relative coordinates in which its
    equation is
  $ z_1 z_2 = a \( u \) \, wide a \( 0 \) = 0 . $
  There are finitely many nodes. Choose disjoint small neighborhoods of them with transverse boundaries.
    Smoothness over the parameter near the remaining points of $E_0$, together with properness of $E arrow.r
    Delta_u$, excludes new nodes outside these neighborhoods after shrinking the disk.
    The remainder is a proper smooth family with boundary, so its topology is unchanged.
    Inside a node neighborhood a crossing has Euler characteristic one,
    whereas a smoothing is an annulus and has Euler characteristic zero. Thus for general small $u$,
  $ chi \( E_u \) = chi \( E_0 \) - \# { upright("nodes whose smoothing function ") a
    upright(" is not identically zero") } . $
  No global labeling of components is needed; the calculation includes self-intersection nodes.
    Since the Euler characteristic is constant, every smoothing function vanishes identically.
    The resulting charts, together with the charts at the smooth points,
    prove relative normal crossings near $E_0$. Properness of $E arrow.r
    Delta_u$ extends this conclusion over a smaller disk. ◻
]

We have obtained the relative normal-crossing divisor needed for complete transport.
  The next section constructs the ambient homeomorphisms and then removes the finite parameter cover.

== 9 From resolutions to ambient right triviality <sec:ambient-lifting>

This section supplies the final topological step. Its input is complete transport on the punctured zero fibers;
  its output is a trivialization of the functions on ambient neighborhoods.
  We first make that passage on fixed closed-ball tubes. We then construct the required transport from either
  Whitney regularity or a simultaneous resolution, and finally remove a finite base change.
  No estimate for a vector field at the singular section is needed.

#thm([Lemma 9.1.])[
  (Ambient lifting on a closed-ball tube).  #emph[Let $G \( x \, u \)$ be holomorphic on a neighborhood of $B
    times D$, where $B subset bb(C)^n$ is a closed ball centered at $0$ and $D subset
    bb(C)$ is a disk centered at $0$. Suppose that $G \( 0 \, u \) =
    0$ and that $d_x G \( x \, u \) eq.not 0$ for $x eq.not 0$.
    Assume that, for some $eta > 0$, the levels $G \( dot.op \, u \) = c$, $\| c \| < eta$,
    meet $partial B$ transversely. Put
$ T_u = { x in B : \| G \( x \, u \) \| < eta } \, wide Z^(*) = { \( x \, u \) in \( B \\ { 0 } \) times D :
  G \( x \, u \) = 0 } . $

 Suppose there are smooth real vector fields $v_1 \, v_i$ on $Z^(*)$, tangent to its sphere boundary,
   projecting to $1 \, i$ on $D$. Suppose moreover that their transport along each segment $\[ 0 \, u \]$ and its
   reverse exists for the entire segment in $Z^(*)$. More precisely, this is the transport of $"Re" \( u \) v_1 +
   "Im" \( u \) v_i$ for time one, starting over $0$, and its reverse starting over $u$.
   Then, after shrinking $D$ if necessary, there are homeomorphisms
$ H_u : T_0 arrow.r T_u \, wide G \( H_u \( x \) \, u \) = G \( x \, 0 \) \, $

 such that $H_0 = upright("id")$, $H_u \( 0 \) = 0$, and both the family and its inverse are jointly continuous.
   Restriction to the interiors of the tubes is a parameter-preserving ambient homeomorphism near the origin section.]
] <lem:ambient-tube>

#proof[
  On the ambient tube with the origin section removed, $\( G \, u \)$ is a smooth submersion,
    including on the sphere boundary. Extend each $v_a$, $a in { 1 \, i }$, to a smooth ambient field $V_a$ satisfying
  $ d u \( V_a \) = a \, wide d G \( V_a \) = 0 \, wide V_a upright(" tangent to the sphere boundary") . $
  Here the prescribed extension along $Z^(*)$ can be made in submersion coordinates,
    with boundary coordinates where necessary. Equivalently, subtract a preliminary lift and extend the remaining
    section of the kernel bundle of $d \( G \, u \)$ from the closed submanifold $Z^(*)$ of the axis complement.
    A partition of unity patches these extensions: the specified projections, boundary tangency,
    and prescribed values on $Z^(*)$ are affine linear conditions. There is no assertion that $V_a$ extends to the axis.
  For $u in D$, integrate $"Re" \( u \) V_1 + "Im" \( u \) V_i$ for time one, starting at $\( x \, 0 \)$.
    For $x eq.not 0$ on the zero level, existence for the whole interval is the hypothesis.
    For $G \( x \, 0 \) = c eq.not 0$, the trajectory stays in the compact set
  $ { \( y \, s \) : y in B \, med s in \[ 0 \, u \] \, med G \( y \, s \) = c } \, $
  which misses the axis. Smooth continuation and boundary tangency give existence for the whole interval here as
    well. Reverse transport gives the inverse on $T_u \\ { 0 }$.
    Both maps depend smoothly on their arguments off the axis, also in charts at the sphere boundary,
    and preserve the value of $G$.
  Set $H_u \( 0 \) = 0$. To prove joint continuity there, let $x_j arrow.r 0$ and $u_j arrow.r u$.
    A subsequential limit $y$ of $H_(u_j) \( x_j \)$ exists in $B$,
    and function preservation gives $G \( y \, u \) = 0$. If $y eq.not 0$,
    smooth dependence of reverse transport near $\( y \, u \)$ would imply that $x_j$ tends to its nonzero
    endpoint over $0$, a contradiction. Thus every such limit is $0$. The same argument proves inverse continuity:
    if $y_j in T_(u_j)$ tends to $0$, any nonzero subsequential limit of $H_(u_j)^(- 1) \( y_j \)$ contradicts
    smooth forward transport. Consequently the maps and inverses are jointly continuous everywhere.
    Reverse transport also proves that each $H_u$ is onto exactly $T_u$.
    Finally, the tube interiors form open neighborhoods of the respective origins and their union is an open
    neighborhood of the origin section. This proves the last assertion. ◻
]

#thm([Corollary 9.2.])[
  (Whitney regular zero fibers).  #emph[Let $G \( x \, u \)$, with $x in bb(C)^n$,
    be a holomorphic family with $G \( 0 \, u \) = 0$ and no spatial critical points off the origin section near
    $\( 0 \, 0 \)$. If the pair
$ #scale(x: 120%, y: 120%)[\(] { G = 0 } \\ { x = 0 } \, med { x = 0 } #scale(x: 120%, y: 120%)[\)] $

 satisfies Whitney conditions (a) and (b), then $G$ is ambiently topologically right trivial near that section,
   with the central map equal to the identity.]
] <cor:whitney-right>

#proof[
  Write $rho \( x \, u \) = parallel x parallel^2$. We claim that $\( u \, rho \)$ is a real submersion on the
    punctured zero locus sufficiently near $\( 0 \, 0 \)$. Otherwise choose points $\( x_j \, u_j \)
    arrow.r \( 0 \, 0 \)$ witnessing failure. After taking a subsequence,
    the unit spatial vectors $x_j \/ parallel x_j parallel$ converge to $v$,
    the real tangent spaces of the total zero locus converge to $L$,
    and the real tangent spaces of its fibers converge to $Q$.
    Whitney (a) implies that $L$ contains the two real base directions.
    The fiber tangent spaces have real dimension $2 n - 2$ and lie in $ker d u$, so
  $ Q = L ∩ ker d u : $
  the inclusion holds by passage to limits, and both sides have dimension $2 n - 2$.
    Whitney (b), applied to the secants from $\( 0 \, u_j \)$, gives $\( v \, 0 \) in L$,
    hence $\( v \, 0 \) in Q$. On the other hand, failure of submersivity says that $d
    rho$ vanishes on each fiber tangent space. It follows that $\( v \, 0 \)$ is orthogonal to $Q$,
    a contradiction to $parallel v parallel = 1$.
  Take a sufficiently small closed ball and parameter disk inside this submersion neighborhood.
    Smooth local right inverses to $d \( u \, rho \)$, patched by a partition of unity, give lifts $v_1 \,
    v_i$ of the parameter directions with $d rho \( v_a \) = 0$.
    Their trajectories preserve the positive spatial radius. Along any fixed parameter segment they therefore
    remain in a compact set disjoint from the axis, so transport is complete in both directions.
    These fields are tangent to the sphere boundary. The zero levels are transverse to that sphere;
    by compactness the same holds for all sufficiently small nonzero levels and parameters, after shrinking.
    Lemma 23 applies. ◻
]

#thm([Proposition 9.3.])[
  (Lifts supplied by a resolution).  #emph[Let $G \( x \, u \)$ satisfy the analytic and transversality hypotheses
    of Lemma 23. Suppose that the zero family admits a proper holomorphic map $b : M arrow.r { G =
    0 }$ over the parameter disk such that]
  + #emph[$q : M arrow.r D$ is a smooth family;]
  + #emph[$b$ is an isomorphism away from the origin section;]
  + #emph[$E = b^(- 1) \( { x = 0 } \)$ is a relative normal-crossing divisor.]
  #emph[Here the last condition means that, in local coordinates consisting of fiber coordinates and $u$,
    the support of $E$ is a union of coordinate hyperplanes in the fiber coordinates.
    Then $G$ has the trivialization of Lemma 23.]
] <prop:resolution-right>

#proof[
  Choose the ball and a smaller parameter disk within representatives of $b$.
    Above the closed ball, $q$ is a smooth submersion with boundary:
    near the sphere, $b$ is an isomorphism and the fibers meet the sphere transversely.
    Relative normal-crossing coordinates give local lifts of the two real parameter directions tangent to every
    branch of $E$. Away from $E$ use submersion coordinates, and near the sphere use boundary submersion
    coordinates. A partition of unity gives smooth lifts on $M$ tangent both to $E$ and to the sphere boundary.
  Properness makes the inverse image of the closed ball over each compact parameter segment compact.
    The smooth lifts are therefore complete along that segment in both directions.
    Their flows preserve $E$ and its complement: tangency preserves each local branch,
    and uniqueness applied in both time directions prevents a trajectory in the complement from reaching $E$.
    Push the fields down through the isomorphism off $E$. These are precisely the complete fields on the punctured
    zero family required by Lemma 23. ◻
]

#thm([Lemma 9.4.])[
  (Removal of a finite disk base change).  #emph[Let $F \( x \, t \)$ be a holomorphic family with
    $F \( 0 \, t \) = 0$. Suppose that, after the base change $t = u^e$, $e gt.eq 1$, the family $G \( x \, u \) =
    F \( x \, u^e \)$ has the tube trivialization $H_u$ of Lemma 23.
    Then $F$ is ambiently topologically right trivial over the original disk,
    by a section-preserving homeomorphism whose central map is the identity.]
] <lem:remove-base-change>

#proof[
  Put $zeta = exp \( 2 pi i \/ e \)$. For real $s gt.eq 0$ sufficiently small,
  $ J_s = H_(zeta s)^(- 1) compose H_s : T_0 arrow.r T_0 $
  is a homeomorphism preserving $f_0 = F \( dot.op \, 0 \)$, and $J_0 = upright("id")$.
    These compositions have exact common domains: the two target tubes $T_s$ and $T_(zeta s)$ coincide since
    $s^e = \( zeta s \)^e$. The families $J_s$ and $J_s^(- 1) = H_s^(- 1) compose H_(zeta s)$ are jointly continuous.
  For $t = r^e exp \( i theta \)$, $r > 0$ and $0 lt.eq theta lt.eq 2 pi$, define
  $ phi.alt_t = H_(r exp \( i theta \/ e \)) compose J_(r theta \/ \( 2 pi \)) . $
  The two values at the angular seam agree, because
  $ H_(zeta r) compose J_r = H_r . $
  Figure 1 displays this endpoint identity.
  #figure(
    [#grid(
    columns: (0.49fr, 0.49fr,),
    column-gutter: 2%,
    [
      (200,120)(-5,-16) (10,10)(1,0)75 (10,10)(1,2)33.5 (85,10)(85,56)(43.5,77) (10,10)(42.5,28.75)(75,47.5)
        (30,10)(30,16)(27.3,20) (10,10) (85,10) (43.5,77) (75,47.5) (4,3)(0,0)$0$ (92,10)(0,0)\[l\]$r$
        (48,82)(0,0)\[l\]$zeta r$ (85,48)(0,0)\[l\]$u = r e^(i theta \/ e)$ (36,21)(0,0)\[l\]$theta \/
        e$ (75,-9)(0,0)$r \, zeta r med mapsto med t = r^e$
    ],
    [
      #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$T_0$])
  content((2.193, 0), [$T_0$])
  content((0, -0.744), [$T_r$])
  content((2.193, -0.744), [$T_(zeta r)$])
  line((0.468, 0), (1.725, 0), mark: (end: ">"))
  content((1.097, 0.2266), [#text(size: 0.73em)[$J_r$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.4186, -0.372), [#text(size: 0.73em)[$H_r$]])
  line((2.193, -0.2725), (2.193, -0.4715), mark: (end: ">"))
  content((2.708, -0.372), [#text(size: 0.73em)[$H_(zeta r)$]])
  line((0.468, -0.634), (1.593, -0.634))
  line((0.468, -0.854), (1.593, -0.854))
})
    ],
  )

$ phi.alt_(r^e e^(i theta)) = H_(r e^(i theta \/ e)) compose J_(r theta \/ \( 2 pi \)) \, wide 0 lt.eq theta lt.eq
  2 pi . $

],
    caption: [Figure 1: Removing the angular seam for $t = u^e$ (the sector is schematic, with $e > 1$). One turn in the $t$-disk lifts from $r$ to $zeta r$ in the $u$-disk. These endpoints have the same target tube. The square records the endpoint correction $J_r = H_(zeta r)^(- 1) H_r$; the path $s mapsto J_s$ from $J_0 = upright("id")$ interpolates that correction as $theta$ runs from $0$ to $2 pi$. The two endpoint formulas for $phi.alt_t$ therefore agree. ],
  ) <fig:transport-seam>
  The inverse is
  $ phi.alt_t^(- 1) = J_(r theta \/ \( 2 pi \))^(- 1) compose H_(r exp \( i theta \/ e \))^(- 1) \, $
  and its seam identity is $J_r^(- 1) compose H_(zeta r)^(- 1) = H_r^(- 1)$. Thus both maps glue.
    At $r = 0$ every constituent map is the identity, independently of $theta$;
    joint continuity of the constituent families and their inverses therefore gives joint continuity on the polar
    disk with its central circle collapsed. Set $phi.alt_0 = upright("id")$.
  For every $t$, the source is the same tube $T_0$ and the target is ${ x in B : \| f_t \( x \) \| < eta }$. Moreover,
  $ f_t compose phi.alt_t = f_0 compose J_(r theta \/ \( 2 pi \)) = f_0 \, wide phi.alt_t \( 0 \) = 0 . $
  Restricting to the interiors gives the asserted homeomorphism germ $\( x \, t \)
    mapsto \( phi.alt_t \( x \) \, t \)$ over the original disk. ◻
]

#prodef([Remark 9.5.])[
  A finite map between smooth pointed disks has the form $t = u^e$ after a coordinate change:
    write it as $u^e$ times a nonvanishing holomorphic unit and absorb a holomorphic $e$th root of that unit into
    $u$. Accordingly, the preceding lemma applies to a normalized disk branch of the finite base change used for a
    simultaneous resolution. It requires no deck-equivariance of that resolution or of its chosen lifts.
]

== 10 The log canonical and double-point cases <sec:low-cases>

We finish with two cases accessible through sectional Milnor numbers.
  The double-point case reduces to a Whitney regular family of plane curves after splitting off a square.
  The remaining log canonical case, of multiplicity three, is itself Whitney regular.
  For a holomorphic germ in $n$ variables with an isolated critical point,
  write $mu^(\( j \))$ for the Milnor number of its restriction to a general $j$-dimensional linear subspace,
  and put $mu^(*) = \( mu^(\( 1 \)) \, dots.h \, mu^(\( n \)) \)$.
  Thus $mu^(\( n \)) = mu$ and $mu^(\( 1 \)) = "mult"_0 \( f \) - 1$.

We use two equisingularity theorems. The equimultiplicity theorem of Fernández de Bobadilla and Pełka states that
  a family of isolated hypersurface singularities with constant finite Milnor number has constant multiplicity
  #cite(label("FernandezBobadillaPelka2024")) Theorem 1.1. Teissier’s criterion states that,
  for a deformation of an isolated hypersurface singularity with a section and smooth complement of the section
  over the base, constancy of $mu^(*)$ implies the Whitney conditions for that complement and the section
  #cite(label("Teissier1973")) Chapter II, Theorem 3.9. The absence of critical points off the section in our
  representatives verifies the latter smoothness hypothesis.

#thm([Proposition 10.1.])[
  #emph[Let $F \( x \, t \) = f_t \( x \)$ be a holomorphic family in three spatial variables, with $f_t \( 0 \) =
    0$, an isolated critical point at $0$ in every fiber, and constant Milnor number.
    If either $"mult"_0 \( f_0 \) = 2$ or the normal surface germ $X_0 = { f_0 = 0 }$ is log canonical,
    then $F$ is topologically right-trivial over a sufficiently small parameter disk.]
] <prop:low-cases>

#proof[
  Suppose first that $"mult"_0 \( f_0 \) = 2$. Choose a spatial direction in which the second derivative of $f_0$
    is nonzero. The implicit function theorem solves the corresponding first-derivative equation as $z =
    a \( y \, t \)$, where $y in bb(C)^2$ and $a \( 0 \, t \) = 0$.
    Translating $z$ by $a \( y \, t \)$ and taking a holomorphic square root of the resulting nonvanishing
    quadratic coefficient gives biholomorphic coordinates, depending holomorphically on $t$ and preserving the
    origin, in which
  $ f_t = z^2 + g_t \( y \) . $
  The Jacobian quotient is then the Jacobian quotient of $g_t$,
    so $g_t$ has an isolated critical point and $mu \( g_t \) = mu \( f_t \)$.
    Equimultiplicity for this plane family gives constant $mu^(*) \( g_t \)$,
    whose two entries are $"mult"_0 \( g_t \) - 1$ and $mu \( g_t \)$.
    Teissier’s criterion and Corollary 24 give a joint right-trivialization of $g_t$.
    Extend its maps by the identity in $z$ and conjugate by the coordinate changes at $0$ and at $t$.
    This gives the required right-trivialization of $f_t$, with central map the identity.
  Now suppose $X_0$ is log canonical. Adjunction and inversion of adjunction identify this condition with log
    canonicity of $\( bb(C)^3 \, X_0 \)$ #cite(label("Kawakita2007"));
    the different on the normal Cartier hypersurface in a smooth ambient space is zero.
    These single-germ algebraic statements also apply to the analytic germ by its analytic right-equivalence to a
    sufficiently high polynomial jet. Put $m = "mult"_0 \( f_0 \)$.
    On the blowup of the origin the exceptional plane has discrepancy $2 - m$, hence $m lt.eq 3$.
    Since the origin is a critical point, $m gt.eq 2$, and the case $m = 2$ is already settled.
  For $m = 3$, let $tilde(X)_0$ be the strict transform and $P tilde.eq bb(P)^2$ the exceptional plane.
    The crepant boundary on the blowup is $tilde(X)_0 + P$. Adjunction to $P$ shows that $\( P \, C \)$ is log
    canonical, where $C = tilde(X)_0 \|_P$ is the tangent cubic with its scheme-theoretic multiplicities.
    A boundary component of a log canonical pair has coefficient at most one. Thus $C$ is reduced.
  Equimultiplicity keeps the order of $f_t$ equal to three.
    Choose a projective line transverse to $C$ at three distinct smooth points.
    This condition persists for the cubic initial forms of $f_t$ when $t$ is small.
    The corresponding plane sections, and hence general plane sections, are ordinary triple points.
    Their Milnor number is four: the two quadratic initial forms of their partial derivatives have no common
    projective zero, so their local intersection multiplicity is $2 dot.op 2$. Consequently
  $ mu^(*) \( f_t \) = \( 2 \, 4 \, mu \( f_0 \) \) $
  throughout a sufficiently small disk. Teissier’s criterion gives Whitney regularity,
    and Corollary 24 supplies the right-trivialization. ◻
]

=== 10.1 Proof of Theorem 1 <proof-of-theorem-thmmain>

If the central multiplicity is two, or the central surface is log canonical, Proposition 28 proves the theorem.
  Otherwise the central surface is non-log-canonical. Theorem 21 proves constancy of its logarithmic invariant.
  Proposition 22 then supplies a smooth simultaneous resolution with relative normal-crossing exceptional divisor
  after a finite disk base change. The fixed-ball hypotheses of Lemma 23 follow from Lemmas 2 and 3.
  Proposition 25 gives the joint ambient right trivialization after that base change,
  and Lemma 26 descends it to the original disk. The formulas preserve the parameter, the origin section,
  and the defining function, with the identity at the central parameter and jointly continuous inverses.
  These are precisely all the assertions of Theorem 1.0◻

== 11 Local constructions for the numerical comparison <app:local-numerical>

This appendix supplies the explicit marked semistable construction used in Section 5,
  together with two variants of the numerical comparison. First,
  properly supported intersection squares allow the specialization argument to be made on a possibly nonproper
  family. We then construct the marked model by monomial modifications.
  Finally, we give an alternative algebraic-curve comparison inside a single irreducible component of the jet locus.

=== 11.1 Intersection numbers with proper support <intersection-numbers-with-proper-support>

#thm([Lemma 11.1.])[
  (Specialization of a supported square).  #emph[Let $q : Y arrow.r
    C$ be a dominant morphism from an integral normal $bb(Q)$-factorial quasi-projective complex threefold to a
    smooth connected complex algebraic curve. Let $A = sum_i a_i
    E_i$ be a rational divisor whose support is proper over $C$.
    For a fiber write its fundamental cycle as $\[ Y_c \] = sum_j m_j \[ S_j \]$. Then the number
$ Q_c \( A \) = sum_j m_j \( A \|_(S_j) \)^2 $

 is independent of $c$.]
  #emph[Here, when $S_j$ is proper, its summand is the usual projective intersection number.
    When $S_j$ is not proper, it is not a component of $A$, and $A \|_(S_j)$ is a rational Cartier divisor with
    proper curve support. Its square means the degree obtained by intersecting that proper curve cycle with the
    rational line bundle $A \|_(S_j)$.]
] <lem:supported-square>

#proof[
  The morphism $q$ is flat: its local rings are torsion-free over the local discrete valuation rings of $C$.
    Its fibers have pure dimension two. Every vertical $E_i$ is proper,
    since the support of $A$ is proper over $C$. A horizontal $E_i$ is projective and flat over $C$:
    properness together with quasi-projectivity gives projectivity,
    and flatness again follows from torsion-freeness. All intersections below therefore have proper support.
    Multiplying the divisors by common positive integers makes them Cartier;
    we divide by these integers after taking intersection numbers.
  Commutativity and additivity of Cartier-divisor intersections give
  $ Q_c \( A \) & = sum_i a_i sum_j m_j deg #scale(x: 120%, y: 120%)[\(] A dot.op E_i dot.op \[ S_j \]
    #scale(x: 120%, y: 120%)[\)]\
 & = sum_i a_i deg #scale(x: 120%, y: 120%)[\(] A \|_(E_i) dot.op Y_c \|_(E_i) #scale(x: 120%, y: 120%)[\)] . $
  For distinct $E_i$ and $S_j$, the two orders of restriction describe the same proper intersection curves with
    their intersection multiplicities. If $E_i = S_j$, all calculations take place on a proper surface and use its
    normal-bundle class. These observations also justify the formula when some fiber component is not proper.
  For a vertical $E_i$, the line bundle of $Y_c$ restricts trivially to $E_i$,
    since it comes from a point divisor on $C$ and $q \|_(E_i)$ is constant.
    Its term is zero, including when $E_i subset Y_c$. For a horizontal $E_i$,
    the term is the degree of the fixed rational line bundle $A \|_(E_i)$ on the scheme-theoretic fiber
    $\( E_i \)_c$. That degree is constant in a projective flat curve family.
    For example, it is the coefficient of $n$ in the fiberwise Euler characteristic of a Cartier multiple of $n
    A \|_(E_i)$; flatness makes the Euler characteristic independent of $c$,
    and the intersection formula identifies this coefficient. This proves the assertion. ◻
]

There is a second proof that explains why a compactification of the ambient family causes no extra term.
  Take an integral normal projective compactification $overline(Y) arrow.r C$ of $Y arrow.r C$.
  The support of $A$ is already closed in $overline(Y)$: its map to $overline(Y)$ is proper over the separated
  base $C$. A Cartier multiple of $A$ thus extends to a Cartier divisor on $overline(Y)$ by gluing it to the zero
  divisor on $overline(Y) \\ "Supp" \( A \)$. The compactification is flat over $C$.
  Lemma 19 makes the extended fiber square constant. Its restriction to every component contained in
  $overline(Y) \\ Y$ is trivial, and therefore has square zero.
  On a component meeting $Y$, its square is the supported intersection number in Lemma 29.
  The projective identity is consequently precisely the desired local one.

#thm([Corollary 11.2.])[
  (The local exceptional-square comparison).  #emph[Suppose a projective birational morphism $h : Y arrow.r
    X$ is a log model over a smooth curve as in Section 5.1, except that $X arrow.r C$ need not be proper.
    Assume $X$ and $Y$ are quasi-projective, all exceptional prime divisors map into the section $Gamma tilde.eq
    C$, and put
$ A = K_Y + H - h^(*) K_X . $

 If $Y_0 = S_0 + sum_a S_a$ and the nearby fibers are irreducible, then
$ \( A \|_(Y_c) \)^2 = \( A \|_(S_0) \)^2 + sum_a \( A \|_(S_a) \)^2 . $

 Under the full-boundary, adjunction, and nefness hypotheses of Proposition 20,
   the first two squares are respectively $- beta \( X_c \, Gamma \( c \) \)$ and $-
   beta \( X_0 \, Gamma \( 0 \) \)$, while
$ \( A \|_(S_a) \)^2 = \( K_(S_a) + B_(S_a) \)^2 . $

 Thus vanishing of the extra squares proves constancy of the local invariant without a projective compactification
   of $X$.]
] <cor:local-exceptional-square>

#proof[
  The divisor $A$ is exceptional and has proper support over the section, because $h$ is projective.
    Lemma 29 applies. On each $S_a$, a divisor pulled back from $X$ has trivial line-bundle class,
    giving the displayed adjunction formula. On $S_0$ and on a nearby fiber,
    pull back to a good resolution of the corresponding surface germ.
    As in Lemma 5, log canonicity makes the difference from the pulled-back logarithmic canonical divisor an
    effective exceptional negative part, orthogonal to the relatively nef part.
    The pullback of $A$ is the numerical exceptional representative of that nef part.
    Its properly supported square is therefore $- beta$, by the definition of the local invariant.
    This argument uses no global canonical square of $X_c$. ◻
]

=== 11.2 An explicit marked semistable construction <an-explicit-marked-semistable-construction>

We spell out the dimension-three toroidal construction underlying the marked semistable reduction used in
  Proposition 10; compare #cite(label("KM1998")) Theorems 7.17 and 7.19.
  It preserves the horizontal markings throughout the construction.

#thm([Proposition 11.3.])[
  (Marked monomial reduction in dimension three).  #emph[Let $q : Z arrow.r
    C$ be a morphism from a smooth quasi-projective complex threefold to a smooth curve.
    Let $0 in C$, write $Z_0 = sum_i a_i Z_i$, and let $H$ be a reduced divisor with horizontal components.
    Suppose that $\( Z_0 \)_(upright("red")) + H$ is simple normal crossing,
    and that away from $0$ the morphism is smooth with relative simple normal crossing divisor $H$.
    After shrinking $C$ about $0$, choose a parameter $tau$ with no other zero and an integer $b$ divisible by
    every $a_i$. After the finite base change $s^b = tau$ and normalization,
    there is a projective birational modification whose total space is smooth and whose special fiber is reduced
    and simple normal crossing together with the transformed horizontal marking.
    The modification is an isomorphism on every open set where the original morphism was smooth and the marking
    relatively simple normal crossing.]
] <prop:marked-monomial-reduction>

#proof[
  Work componentwise if the normalized base change is disconnected.
    At a point of $Z_0$, choose simple normal crossing coordinates in which
  $ tau = u product_(i in I) z_i^(a_i) \, wide u upright(" a unit") \, wide \| I \| lt.eq 3 . $
  The horizontal components present are among the other coordinate hyperplanes.
    An étale root of $u$ reduces the local calculation to the monomial equation.
    Each normalized local sheet is toric in the vertical coordinates, with cone and lattice
  $ sigma_I = bb(R)_(gt.eq 0)^I \, wide N_I = {\( d_i \) in bb(Z)^I : sum_(i in I) a_i d_i equiv
    0 med \( mod med b \)} . $
  The order of the new base parameter is the integral height function $ell \( d \) = sum_i a_i d_i \/ b$.
    Since $a_i divides b$, the primitive generator $\( b \/ a_i \) e_i$ of each original ray has height one.
    The remaining coordinates, including the horizontal markings, are unchanged product factors.
  Subdivide the cones by inserting all their height-one lattice rays. There are finitely many:
    their intersections with $ell = 1$ lie in compact simplices.
    At each stage insert a point not already a ray by a star subdivision of its smallest containing cone.
    Starting with simplicial cones, this keeps every cone simplicial.
    To make the choices compatible across all charts, carry out the sequence on the single orthant with one
    coordinate for each global $Z_i$ and the congruence lattice with the same coefficients $a_i$.
    Restrict its subdivisions to each face that actually occurs. A point not on such a face does not change that face.
  Here is a global realization by projective modifications.
    A vertical ray $v$ records the orders along its divisor of the pullbacks of the original $Z_i$.
    Let $G_v$ be the sum of all vertical prime divisors with that order vector.
    On every current chart the fan is simplicial, so $G_v$ is rational Cartier.
    Suppose a ray to be inserted is in the relative interior of the cone generated by $v_1 \, dots.h \, v_k$,
    and write $v = sum_j lambda_j v_j$, with all $lambda_j > 0$ rational.
    Choose positive integers $c_j$ such that the $c_j G_(v_j)$ are Cartier and all products $c_j
    lambda_j$ are equal. Normalize the blowup of the coherent ideal
  $ cal(I) = sum_j cal(O) \( - c_j G_(v_j) \) . $
  On a toric chart its generators are monomials. The regions on which one of their orders is smallest give exactly
    the star subdivision at $v$: the equality of these orders is $c_1 d_1 = dots.h.c =
    c_k d_k$ in ray coordinates. On a chart missing one of the required rays the corresponding summand is the unit
    ideal, so the modification is the identity. Thus these normalized blowups realize the compatible subdivisions
    globally. They are projective, and preserve the product coordinates for the horizontal markings.
  We verify regularity, including the small-dimensional lattice step.
    In an actual chart the vertical cone has dimension at most three.
    Its section at height one is now a segment, a triangle, or a point with no lattice points other than its
    vertices. An empty lattice segment is primitive. An empty lattice triangle is unimodular:
    translate one vertex to zero and denote its edge vectors by $v \, w$.
    If their lattice index exceeded one, a nonzero lattice point of the half-open parallelogram would have the
    form $alpha v + gamma w$, with $0 lt.eq alpha \, gamma < 1$.
    If $alpha + gamma lt.eq 1$, this point lies in the triangle and is not a vertex.
    If $alpha + gamma > 1$, the lattice point $\( 1 - alpha \) v + \( 1 - gamma \) w$ does so.
    Both contradict emptiness. The edge vectors therefore form a basis of the height-zero lattice.
    Adjoining one height-one vertex gives a basis of the full lattice, so the corresponding cone is regular.
    The same conclusion follows from the primitive-segment calculation in dimension two and is immediate in
    dimension one.
  The resulting local toric varieties are smooth. Every vertical ray still has height one,
    so the divisor of $s$ is reduced. Regular toric coordinates show that this divisor together with all
    horizontal coordinate divisors is simple normal crossing.
    The original global labels and order vectors distinguish local boundary branches,
    so the construction does not identify distinct branches of one component.
    Outside the special fiber the cover is étale and no subdivision acts.
    At a smooth point of the original morphism over $0$ there is only one vertical coordinate of multiplicity one;
    its cone needs no subdivision. This proves the asserted isomorphism property as well. ◻
]

=== 11.3 Algebraic curves through prescribed jets <algebraic-curves-through-prescribed-jets>

The constructibility lemma in Section 4 is useful in its own right.
  The scalar comparison also admits the following argument that does not use constructibility of the scalar.

#thm([Lemma 11.4.])[
  (Comparison within an irreducible jet component).  #emph[Let $U_mu$ be the locally closed algebraic jet locus of
    Lemma 7. Assume the algebraic constancy assertion in Proposition 8.
    Any two points of the same irreducible component of $U_mu$,
    one of which defines a non-log-canonical surface germ, have the same Wahl invariant.
    Consequently that proposition holds without invoking constructibility of the Wahl invariant.]
] <lem:jet-component-comparison>

#proof[
  Write $Z$ for the irreducible component and let $a_0 \, a_1 in Z$ be the points in question.
    If they coincide there is nothing to prove. Resolve a projective closure of $Z$,
    obtaining a smooth irreducible projective variety $tilde(Z)$ with a proper surjective map to that closure.
    Choose a point above each $a_i$. If $dim Z = 1$, use $tilde(Z)$ itself.
    If $dim Z gt.eq 2$, general sufficiently ample hypersurfaces through the two chosen points cut out a smooth
    irreducible projective curve through them. Indeed the systems can be chosen to separate first jets at those
    points; their general members are smooth there, and Bertini applies away from the finite base locus.
    Iterating the irreducibility and smoothness assertions of Bertini gives the required complete-intersection
    curve; compare #cite(label("KleimanBertini")).
  The complement of the inverse image of $Z$ is closed and misses the chosen points.
    Its intersection with the curve is therefore finite. Delete those finitely many points, and, if needed,
    restrict the curve further to an affine open containing the two chosen points.
    The result is a smooth connected algebraic curve $C'$, with a morphism to $U_mu$ whose image contains $a_0$
    and $a_1$. Pulling back the universal polynomial gives regular coefficients on $C'$ and constant Milnor number
    $mu$. Log canonicity is constant by Lemma 6; hence all its germs are non-log-canonical.
    Apply the assumed scalar assertion with any point of $C'$ as the marked point.
    Its value agrees with the nearby general values. The exceptional algebraic subset of a curve is finite;
    shrinking an analytic disk about the marked point avoids its other points.
    The value is therefore constant on that disk, including its center.
    It follows that the invariant is locally constant throughout the connected curve $C'$,
    and in particular has the same value at the two prescribed points.
  Finally, the finitely many irreducible components of $U_mu$ not containing $a_0$ form a closed subset missing
    $a_0$. A sufficiently small analytic neighborhood of $a_0$ avoids that subset.
    Every nearby jet $a \( t \)$ in the holomorphic jet map therefore shares an irreducible component with $a_0$.
    The comparison just proved makes its Wahl invariant equal to the central value.
    Individual finite determinacy then returns this equality to the original holomorphic family,
    exactly as in Proposition 8. ◻
]

== 12 Continuous gradient lifts <sec:continuous-gradient>

There is a second way to pass from transport on the punctured zero set to ambient right triviality.
  It uses vector fields that extend continuously to the origin section,
  together with a condition preventing their trajectories from reaching that section in finite time.
  The gradient lift and its correction near the zero set belong to the vector-field method of Kuo and Parusiński;
  see #cite(label("Parusinski1999")) Section 2, especially equation (2.5).
  We give the criterion with all its transport hypotheses explicit.

Let $G$ be holomorphic on a neighborhood of ${ 0 } times D$ in $bb(C)^n times D$,
  where $D$ is a complex disk centered at zero, and suppose $G \( 0 \, u \) = 0$. Set

$ A = { 0 } times D \, wide X^(*) = { G = 0 } \\ A . $

Real tangent vectors are written in complex coordinates as $\( w \, a \)$, with $w in bb(C)^n$ and $a in bb(C)$.
  Norms are Euclidean. All assertions below concern sufficiently small representatives.

#thm([Proposition 12.1.])[
  (A continuous-lift criterion).  #emph[Assume that $d_x G eq.not 0$ off $A$ and that, at every point of $A$,
#[#set math.equation(numbering: n => "(7)")
 $ frac(\| G_u \( x \, u \) \|, parallel d_x G \( x \, u \) parallel) arrow.r 0 wide
   upright("as ") \( x \, u \) arrow.r A \, quad x eq.not 0 . $ <eq:gradient-small-o>]

 For each $a = 1 \, i$, suppose that $X^(*)$ carries a smooth real vector field $v_a = \( w_a \, a \)$ with the
   following properties:]
  + #emph[$d G \( v_a \) = 0$ and $w_a \( x \, u \) arrow.r 0$ on approach to every point of $A$;]
  + #emph[no trajectory of $v_a$ in $X^(*)$ has a finite-time endpoint in $A$ lying inside the representative,
    in either time direction.]
  #emph[Then, after shrinking, there is an ambient homeomorphism germ
$ H \( x \, u \) = \( H_u \( x \) \, u \) \, wide G \( H_u \( x \) \, u \) = G \( x \, 0 \) \, wide H_u \( 0 \) = 0 \, $

 with $H_0 = upright("id")$ and with $H$ and $H^(- 1)$ jointly continuous.]
] <prop:continuous-gradient-lift>

#proof[
  On the ambient complement of $A$, put
  $ k_a = - a G_u thin frac(\( overline(G_(x_1)) \, dots.h \, overline(G_(x_n)) \), parallel d_x G parallel^2) \,
    wide K_a = \( k_a \, a \) . $
  These smooth real fields satisfy $d G \( K_a \) = 0$. Equation (7) says precisely that $k_a arrow.r 0$ at $A$.
    On $X^(*)$, the difference $s_a = w_a - k_a$ is a section of the complex vector bundle $K = ker d_x G$,
    and it too tends to zero at $A$.
  We extend this correction while preserving its vanishing at the section.
    The smooth submanifold $X^(*)$ is closed in the ambient complement of $A$.
    Choose a smooth tubular retraction $r : U arrow.r X^(*)$, with a variable tube radius small enough that
  $ parallel z - r \( z \) parallel < 1 / 2 "dist" \( r \( z \) \, A \) wide \( z in U \) . $
  Choose a smooth function $chi$ on the axis complement, equal to one on $X^(*)$, taking values in $\[ 0 \, 1 \]$,
    and with support in $U$. If $pi_(K_z)$ denotes Hermitian orthogonal projection onto $K_z$, define
  $ tilde(s)_a \( z \) = chi \( z \) pi_(K_z) \( s_a \( r \( z \) \) \) quad \( z in U \) \, wide tilde(s)_a =
    0 quad upright("outside ") U . $
  This is a smooth section of $K$ agreeing with $s_a$ on $X^(*)$.
    If $z$ approaches a point of $A$ within $U$, the displayed tube bound implies that $r \( z \)$ approaches the
    same point. Since the projection has norm at most one, $tilde(s)_a \( z \) arrow.r 0$ as well. Thus
  $ W_a = \( k_a + tilde(s)_a \, a \) $
  extends continuously across $A$ by $W_a = \( 0 \, a \)$. It is smooth off $A$, agrees with $v_a$ on $X^(*)$,
    and annihilates $d G$ everywhere. At points of $A$ the last assertion follows from $G \( 0 \, u \) = 0$.
  Peano’s existence theorem gives local solutions of each real ODE $dot(z) = W_a \( z \)$.
    They are unique off $A$ because the field is smooth there.
    A solution meeting $A$ has $G = 0$ throughout, by the chain rule.
    If it left $A$, a connected interval on which it lies off $A$ would give a trajectory of $v_a$ with a
    finite-time endpoint on $A$, contrary to the hypothesis. The same argument in reverse time excludes arrival
    from outside $A$. On $A$ the equation is $dot(x) = 0$, $dot(u) = a$, so uniqueness holds there too.
  For clarity, continuity of these local flows also holds at $A$.
    On a fixed compact neighborhood the continuous field is bounded.
    Initial points in a smaller neighborhood therefore have solutions on a common short interval,
    all contained in that compact neighborhood. For a convergent sequence of initial points,
    the solutions are uniformly bounded and equicontinuous. Every uniformly convergent subsequence satisfies the
    integral equation for the limiting initial point. Uniqueness identifies its limit,
    and hence the whole sequence converges. The same argument applies to negative times.
    Uniqueness and reverse flow give continuous local inverse maps.
    Consequently these are local flows by homeomorphisms, jointly continuous in the initial point and time.
  Write $u = s + i t$. Starting at $\( x \, 0 \)$, first follow $W_1$ for time $s$ and then $W_i$ for time $t$.
    Uniform short-time existence permits both steps for all $x$ and $u$ in common smaller neighborhoods.
    The endpoint has parameter $u$ and defines $H_u \( x \)$. Each step preserves $G$ and the section.
    Reverse the two steps, in the opposite order, to obtain the joint inverse.
    The reverse operations are defined on an open neighborhood of the section.
    Within that neighborhood the image of our open source is its inverse image under the reverse map,
    so this image is open. At $u = 0$ both times are zero. This proves all the assertions. ◻
]

#prodef([Remark 12.2.])[
  (Radial transport).  If the no-finite-time-endpoint condition holds for every constant real combination of $v_1$
    and $v_i$, one may instead integrate $"Re" \( u \) W_1 + "Im" \( u \) W_i$ for time one.
    The preceding uniqueness argument applies to this combined field.
    Its speed on a compact neighborhood is bounded by a constant times $\| u \|$,
    so the solutions exist up to time one after shrinking $u$ and the initial neighborhood.
    Applying the same compactness argument to the integral equations, now also allowing $u$ to vary,
    gives joint continuity. Reversing the trajectory gives the inverse.
    Thus this stronger trajectory hypothesis provides transport along $\[ 0 \, u \]$.
] <rem:continuous-radial>

The small-o condition and the trajectory condition have different roles.
  The Lê–Saito–Teissier criterion #cite(label("LeSaito1973")) supplies (7) for the $mu$-constant isolated families
  considered here; see #cite(label("Teissier1973")) Chapter II,
  Remark 3.10 and #cite(label("Parusinski1999")) proof of Corollary 2.1, equation (2.6).
  The latter writes the estimate with the full gradient; it is equivalent to the spatial-gradient version since
  $parallel d G parallel^2 = parallel d_x G parallel^2 + \| G_u \|^2$.
  The following two constructions supply the additional trajectory condition.

#thm([Corollary 12.3.])[
  (An explicit Whitney lift).  #emph[Suppose that $G$ satisfies the analytic and gradient hypotheses of
    Proposition 33 and that $\( X^(*) \, A \)$ satisfies the Whitney conditions.
    Then $G$ has the trivialization of that proposition. The fields on $X^(*)$ can be chosen to preserve $parallel
    x parallel^2$, and every constant real combination has the same property.]
] <cor:gradient-whitney>

#proof[
  Use the Hermitian inner product linear in its first entry, and set $q \( x \, u \) = pi_(K_(\( x \, u \))) x$.
    We first show that
  #[#set math.equation(numbering: n => "(8)")
   $ frac(parallel q \( x \, u \) parallel, parallel x parallel) arrow.r 1 wide
     upright("on ") X^(*) upright(" approaching ") A . $ <eq:whitney-projection>]
  Along any sequence, pass to a subsequence on which $x \/ parallel x parallel$ and $K_(\( x \, u \))$ converge,
    to $v$ and $Q$ respectively. Equation (7) implies that the tangent spaces of the total zero set converge to $Q
    times bb(C)$. Whitney condition (b), applied to the secants between $\( x \, u \)$ and $\( 0 \, u \)$,
    puts $\( v \, 0 \)$ in this limiting space. Thus $v in Q$, which proves (8).
  In particular $q eq.not 0$ sufficiently near the section. With $k_a$ as in the preceding proof, define
  $ w_a = k_a - frac("Re" chevron.l k_a \, x chevron.r, parallel q parallel^2) thin q \, wide
    v_a = \( w_a \, a \) \, wide a = 1 \, i . $
  The correction belongs to $K$, so $d G \( v_a \) = 0$. Moreover $"Re" chevron.l q \, x chevron.r =
    parallel q parallel^2$, giving $d parallel x parallel^2 \( v_a \) = 0$.
    Its norm is bounded by $parallel k_a parallel parallel x parallel \/ parallel q parallel$; hence $w_a arrow.r
    0$ by (7) and (8). Every constant real combination preserves the positive radius of a trajectory in $X^(*)$,
    so no such trajectory can reach $A$ in finite time. Proposition 33 and Remark 34 apply. ◻
]

#thm([Corollary 12.4.])[
  (Continuous lifts from a resolution).  #emph[Suppose that $G$ satisfies the analytic and gradient hypotheses of
    Proposition 33. Suppose that there is a proper holomorphic map $b : M arrow.r { G = 0 }$ over $D$,
    an isomorphism away from $A$, such that the composite $q : M arrow.r D$ is smooth and $E =
    b^(- 1) \( A \)$ is a relative normal-crossing divisor. Then $G$ has the trivialization of that proposition.
    The fields on $X^(*)$ satisfy the trajectory condition for every constant real combination.]
] <cor:gradient-resolution>

#proof[
  Relative normal-crossing coordinates give smooth lifts of the real parameter directions $1 \,
    i$ tangent to every local branch of $E$. Submersion coordinates supply lifts away from $E$.
    A partition of unity patches these to smooth fields $tilde(v)_1 \,
    tilde(v)_i$ on $M$ with the same projections and tangencies.
    Through the isomorphism off $E$, push them to fields $v_a = \( w_a \, a \)$ on $X^(*)$.
  These spatial parts tend to zero at $A$. Indeed, properness supplies convergent subsequences of the unique
    preimages of any sequence in $X^(*)$ tending to a point of $A$. Every limit lies in $E$.
    The spatial component of $b$ vanishes on $E$, so its differential on a field tangent to a branch of $E$ is
    zero there. Continuity of $d b \( tilde(v)_a \)$ now proves $w_a arrow.r 0$.
  To verify the trajectory condition, suppose that an integral arc of a constant real combination of the $v_a$ had
    a finite-time endpoint in $A$ inside the representative. Its lift to $M \\ E$ solves the corresponding smooth
    combined field. A terminal segment of the downstairs arc has compact closure,
    whose inverse image is compact by properness. Smooth ODE continuation therefore extends the lifted arc to a
    point of $E$. Tangency preserves $E$, and uniqueness in both time directions prevents an arc outside $E$ from
    reaching it. This contradiction proves the required condition. The continuous-lift criterion applies. ◻
]

For the families in the main theorem, these criteria give an alternative construction of the ambient maps.
  In the double-point case of Section 10, apply the continuous Whitney criterion to the plane family $g_t$ after
  splitting off a square, and then extend the maps by the identity in the remaining coordinate and conjugate back
  as in that section. The log canonical case of multiplicity three uses the Whitney criterion directly.
  In the non-log-canonical case, use the resolved family of Proposition 22 after its finite disk cover.
  The Lê–Saito–Teissier estimate applies to each of these $mu$-constant families.
  The closed-ball construction in Section 9 also supplies exact common tube domains,
  which are used in Lemma 26 to descend from the finite cover to the original disk.

#bibliography("refs.bib", style: "ieee", title: [References])
