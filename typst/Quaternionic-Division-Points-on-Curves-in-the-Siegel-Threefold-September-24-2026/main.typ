#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Quaternionic division points on curves \
in the Siegel threefold]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Siegel moduli variety $cal(A)_2$ parametrizes principally polarized abelian surfaces and has dimension three.
  An indefinite quaternion division algebra can occur as the full rational endomorphism algebra of such a surface.
  The corresponding non-CM points lie on special curves. The Zilber–Pink conjecture predicts that a Hodge-generic
  algebraic curve meets the union of these special curves in only finitely many points.
  The quaternion algebra, its discriminant, and the endomorphism order are allowed to vary in this prediction.

For a geometric point $s$ of $cal(A)_2$, write $\( A_s \, lambda_s \)$ for the represented polarized surface and put

$ "End"^0 \( A_s \) = "End"_(overline(bb(Q))) \( A_s \) ⊗_(bb(Z)) bb(Q) . $

A curve is #emph[Hodge generic] if it is not contained in a proper special subvariety,
  including a Hecke translate of one.

#thm([Theorem 1.1.])[
  #emph[Let $C subset cal(A)_(2 \, overline(bb(Q)))$ be a reduced irreducible closed Hodge-generic algebraic curve. Then
$ Sigma_(upright("QM")) \( C \) = { s in C \( overline(bb(Q)) \) :
  "End"^0 \( A_s \) upright(" is an indefinite quaternion division algebra over ") bb(Q) #scale(x: 120%, y: 120%)[}] $

 is finite.]
] <thm:main>

Thus 1 resolves affirmatively the quaternionic-division component of the Zilber–Pink conjecture for curves in
  $cal(A)_2$. Its condition is equality of the full geometric endomorphism algebra.
  In particular, it excludes the split algebra $M_2 \( bb(Q) \)$ and does not replace the endomorphism condition
  by the existence of a quaternion embedding into a larger algebra.
  No condition is imposed on the boundary of $C$, and the points are counted across all quaternionic special
  curves at once.

Throughout the paper, a #emph[QM point] means a point whose full geometric rational endomorphism algebra is an
  indefinite quaternion division algebra over $bb(Q)$.

=== 1.1 Earlier results <earlier-results>

The general unlikely-intersection principle asks when an intersection with a special subvariety has larger
  dimension than the ambient dimension count predicts. Zilber formulated this principle in the semiabelian setting
  #cite(label("Zilber2002")); Pink formulated its Shimura counterpart #cite(label("Pink2005")) Conjecture 1.3.
  For a Hodge-generic curve in a threefold, intersections with special curves have negative expected dimension.
  Pink’s nondensity prediction therefore requires finiteness even after all such special curves are allowed to
  vary. The locus in 1 is the part arising from division quaternionic multiplication.

Daw and Orr proved the conclusion when the closure of the curve meets the zero-dimensional boundary stratum of the
  Baily–Borel compactification #cite(label("DawOrr2022")) Theorem 1.4.
  Their reduction for an arbitrary curve assumes a large-Galois-orbit estimate #cite(label("DawOrr2022"))
  Theorem 1.3 and Conjecture 6.2. Their later work proves finiteness against all special curves under that same
  boundary hypothesis #cite(label("DawOrrMultiplicative2025")) Corollary 1.2.
  Papas obtained further finiteness results under degeneration in higher-dimensional Siegel varieties,
  with additional conditions on endomorphism algebras and their behavior under reduction; in dimension two,
  his boundary hypothesis still requires the zero-dimensional stratum #cite(label("Papas2024")) Theorem 1.4.

Papas’s work with $v$-adic values of $G$-functions studies neighborhoods of an interior quaternionic point.
  It gives a height estimate involving the number of supersingular places at which the varying point is close to
  the chosen center, and finiteness when that number is bounded #cite(label("PapasIII2025")) Theorem 1.7 and
  Corollary 1.9. The horizontal good-reduction comparisons in #cite(label("PapasI2025")) Theorem 3.4 are also
  useful here. We prove a height estimate independent of the number of supersingular proximity places.

=== 1.2 The height argument <the-height-argument>

Our height argument belongs to the arithmetic auxiliary-function tradition of Bombieri and André
  #cite(label("Bombieri1981")) #cite(label("Andre1989")). Interior period matrices and their $p$-adic realizations
  enter André’s motivic treatment #cite(label("Andre1995")) and Papas’s work cited above.
  We prove the interpolation statement needed here directly for fixed algebraic differential systems at an
  ordinary point. In this terminology, “ordinary” means that the differential system has no pole at the center;
  it imposes no ordinary-reduction condition on the abelian surface.

To rule out infinitely many targets, pass to a fixed smooth fine-level cover and choose an interior quaternionic
  point $t_0$. The substantive estimate is

#[#set math.equation(numbering: n => "(1.1)")
 $ h \( t \) lt.eq c_1 \[ K \( t \) : K \]^(c_2) wide #scale(x: 120%, y: 120%)[\(] t
   upright(" a division-quaternionic point") #scale(x: 120%, y: 120%)[\)] \, $ <eq:intro-height>]

where $K$ and the ample logarithmic height $h$ are fixed. The constants may depend on the curve.
  This estimate is proved in 20; it is not an assumed Galois-orbit bound.

The equations come from a rank-five quadratic variation. In the first cohomology of each fiber,
  take the trace-zero operators that are self-adjoint for the alternating polarization, with pairing $⟨T \, U⟩ =
  1 / 4 "Tr" \( T U \)$. At a QM point, the actual Rosati-symmetric endomorphisms in this space span a positive
  definite two-plane $E_t$. We compare a fixed pair of independent integral endomorphisms at the center with a
  small integral spanning pair at the target. Write $B$ and $P$ for their de Rham coordinates,
  and $Y \( a \)$ for horizontal transport from the target back to the center, where $a =
  x \( t \)$ is a local algebraic parameter with $x \( t_0 \) = 0$.

At places where the target is close to the center, these coordinates satisfy a matrix of trace relations

$ ⟨B \, Y \( a \) P⟩ = T_v in upright(M)_2 \( bb(Q) \) . $

The four entries pair the two centered vectors with the two transported target vectors.
  At finite places the relations come from endomorphisms of their common good reduction.
  Although the rational matrix $T_v$ can vary with the prime, a lift of residue Frobenius fixes it.
  Comparing the relation with its conjugate therefore eliminates $T_v$.
  The two arguments are $a$ and $b = a R$, where $b$ is a conjugate of $a$ and $R =
  b \/ a$ is included among the algebraic coordinates. The number of conjugate tuples is polynomial in the field
  degree, so one common system retains a substantial sum of local smallness.
  The finitely many exceptional primes and the archimedean places are grouped directly by their trace matrices.

The interpolation theorem in 6 turns this local information into (1.1).
  Its inputs are common analytic equations, controlled coefficient heights, sufficiently small values of $a$,
  and nonidentity on every algebraic branch used in its proof.
  The auxiliary graph is obtained by adjoining the quotient of a finite Taylor truncation of a common relation by
  a power of $a$. On this graph, the proof constructs a low-degree polynomial.
  The product formula forces that polynomial to vanish at the target,
  while the construction ensures that it does not vanish on the whole graph.
  Intersection and projection then reduce the dimension of an algebraic variety containing the target.
  Repeating this descent proves the height bound. An ordinary-point differential estimate makes the required
  orders polynomial in the algebraic degrees.

It remains to prove the nonidentity input. Full monodromy handles the single-argument relations and pairs of
  arguments that vary independently. The exceptions are pairs lying on an isogeny correspondence dominating both
  fixed curves. There are only finitely many such correspondences, up to integral changes of lift.
  We choose one auxiliary prime $ell$ and a fixed level cover on which each target admits a marking with the
  following property: modulo $ell$, its plane and the centered plane span a degenerate four-space.
  A functional identity in the exceptional case would force a Frobenius quasi-isogeny to act by one common sign on
  both planes. The prescribed incidence rules this out, using the polarized multiplier and the integral trace
  form. This argument also covers supersingular reductions and target planes that are themselves degenerate modulo
  $ell$.

Once (1.1) is known, endomorphism estimates and one-variable Hodge-norm bounds give polynomially bounded integral
  coordinates for two Hodge vectors at every point of a large Galois orbit.
  The periods lie in the three-dimensional quadric of isotropic lines in the rank-five space.
  The period at a QM point is orthogonal to its plane $E_t$,
  and the orthogonal complement of each positive two-plane cuts this quadric in a conic.
  The path form of o-minimal counting would produce a one-parameter semialgebraic family of such planes whose
  conics contain a nonconstant period arc. Their union has algebraic closure of dimension at most two.
  Full monodromy, however, makes the period image Zariski dense in the three-dimensional quadric,
  giving the contradiction.

This last step follows the arithmetic point-counting strategy of Pila and Zannier #cite(label("PilaZannier2008")).
  The rational-point theorem of Pila and Wilkie #cite(label("PilaWilkie2006")),
  refined into definable blocks by Pila #cite(label("Pila2011")) Theorem 3.6,
  underlies the projected path-counting result of Habegger and Pila #cite(label("HabeggerPila2016")) Corollary 7.2
  used here. The numerical bounds for the Hodge vectors come from the endomorphism estimates of Masser and
  Wüstholz #cite(label("MW1994")) and Schmid’s degeneration and norm theorems #cite(label("Schmid1973")).
  In the rank-five variation the final geometric contradiction is a direct dimension calculation followed by the
  monodromy theorem of André #cite(label("Andre1992")).

=== 1.3 Conventions and organization <conventions-and-organization>

All varieties and algebraic points are over $overline(bb(Q))$ unless a field is specified.
  Algebraic heights are absolute logarithmic heights. Local absolute values extend the usual,
  nonsquared absolute values on $bb(Q)$, and local sums carry the normalized weights.
  The rational coordinate height used in point counting is multiplicative and will be denoted $H_(upright("rat"))$.

Constants and polynomial exponents may depend on fixed curves, covers, centers, frames, and connections.
  They never depend on the varying quaternion algebra or target point.
  A polynomial bound always refers to a fixed number of variables and fixed connection ranks.

2 establishes the geometric and monodromy input. The interpolation theorem is proved in 3.
  4 constructs the arithmetic data and common equations. 5 proves their nonidentity and the height estimate.
  6 finishes the proof and descends to the coarse curve.

== 2 The quadratic variation and its isogeny exceptions <sec:geometry>

Quaternionic multiplication will be recorded by two independent Hodge vectors in a rank-five quadratic local
  system. We first construct this system on a fixed fine-level curve and determine its monodromy.
  For two curve arguments, failure of independent monodromy forces a polarized isogeny relation.
  We show that only finitely many such relations can dominate the fixed curves.
  This finiteness will allow the auxiliary level in 5 to be chosen before any target point is considered.

=== 2.1 Fixed curves and finite covers <fixed-curves-and-finite-covers>

#thm([Lemma 2.1.])[
  (Passage to fixed covers).  #emph[Let $C subset cal(A)_2$ be a reduced irreducible closed curve over
    $overline(bb(Q))$. There is a finite surjective map $pi : S arrow.r
    C$ from a smooth geometrically connected curve over a number field,
    together with a principally polarized abelian scheme $f : cal(A) arrow.r S$ whose coarse moduli map is $pi$.
    One may obtain $S$ by normalization and a fixed full symplectic level $N gt.eq 3$.]
  #emph[If infinitely many points of $C$ have the endomorphism algebra in 1,
    then infinitely many points of $S$ have that property. Deleting finitely many points of $S$,
    or making a further fixed finite surjective cover and selecting a dominating connected component,
    preserves this assertion. Once all fixed data are defined over $K$,
    degrees and ample logarithmic heights on the smooth completions satisfy
#[#set math.equation(numbering: n => "(2.1)")
 $ \[ K \( pi \( t \) \) : K \] lt.eq \[ K \( t \) : K \] lt.eq D \[ K \( pi \( t \) \) : K \] \, wide
   c^(- 1) h_C \( pi \( t \) \) - c lt.eq h_S \( t \) lt.eq c h_C \( pi \( t \) \) + c \, $ <eq:fixed-cover-bounds>]

 with fixed constants $D \, c$. The same statements hold for any further fixed cover.
   In particular, a degree-dependent polynomial height bound obtained on one selected lift of every target
   descends to the original targets.]
] <lem:finite-covers>

#proof[
  The full level moduli space is a fine moduli scheme with a universal abelian scheme #cite(label("Chai1985"))
    Chapter I, Theorem 1.4; for the complex moduli interpretation see also #cite(label("MilneModuli2013"))
    Theorem 4.6 and Corollary 4.7. The finite change-of-level group acts on it,
    and its quotient is the coarse moduli space, so the forgetful map is finite.
    We fix the symplectic pairing component after adjoining the relevant roots of unity.
    Normalize a component of its pullback dominating $C$. Normal curves in characteristic zero are smooth;
    the resulting map is finite and surjective. All the schemes and morphisms in this construction descend to a
    number field. Fibres of a finite map are finite, so an infinite set downstairs has infinitely many lifts.
    For a cover with several components, at least one component contains infinitely many lifts;
    a dominating component of a finite cover of an irreducible curve is itself surjective.
  After normalizing the base, the finite maps extend to finite maps between smooth projective completions.
    For such a map of generic degree $D_0$, the degree formula for a fibre gives
    $\[ K \( t \) : K \( pi \( t \) \) \] lt.eq D_0$. Over the finitely many singular points of the original
    coarse curve, the fixed finite map has a fixed finite set of preimages;
    enlarge $D$ to bound their residue-field extensions as well.
    Thus the constant $D$ in (2.1) is uniform, but need not equal the generic degree of the map to the singular curve.
  Functoriality of heights identifies a height of a pulled-back ample divisor with the height downstairs up to a
    bounded function. Any two ample divisors on a fixed projective curve bound each other’s heights linearly:
    sufficiently large positive integral multiples of either minus the other are ample and have heights bounded
    below. This proves (2.1). Replacing the fixed field $K$ changes degrees by at most a fixed factor.
    None of these constants depends on the point. ◻
]

Assume the target locus is infinite, as will be appropriate for the final contradiction, and choose $S$ as in 2.
  We write $macron(S)$ for its smooth projective completion.
  After any required finite deletions, choose a target $t_0 in
  S \( overline(bb(Q)) \)$ and enlarge the fixed number field $K$ so that $t_0 in S \( K \)$.
  A rational function $x in K \( S \)$ can be chosen with a simple zero at $t_0$.
  On a neighbourhood of $t_0$, it is an étale parameter; its inverse germ through $t_0$ is always the germ used
  below. Other zeros of $x$ do not specify this germ. Rational frames and affine coordinates may be made regular
  on this neighbourhood by further finite deletions away from $t_0$.
  The finitely many conjugates of these fixed data will also be treated as fixed data.
  No property of the reduction of $t_0$ is imposed here.

=== 2.2 A rank-five operator model <a-rank-five-operator-model>

Let $bb(H)_(bb(Z)) = R^1 f_(*) bb(Z)$ on $S \( bb(C) \)$, and let $psi$ be its alternating polarization.
  The corresponding rational local system is $bb(H) = bb(H)_(bb(Z)) ⊗ bb(Q)$.
  The adjoint of an operator for $psi$ is denoted by $T^dagger$. We use the weight-zero local system

#[#set math.equation(numbering: n => "(2.2)")
 $ bb(V) = { T in "End" \( bb(H) \) : T^dagger = T \, med "Tr" \( T \) = 0 } \, wide ⟨T \, U⟩ = 1 /
   4 "Tr" \( T U \) \, wide q \( T \) = ⟨T \, T⟩ . $ <eq:quadratic-system>]

Its natural integral lattice is the intersection with $"End" \( bb(H)_(bb(Z)) \)$.
  The rational form in (2.2) is integral and unimodular on this lattice after inverting $2$.
  Using another fixed commensurable integral lattice only enlarges the finite set of excluded auxiliary primes.

#thm([Lemma 2.2.])[
  (The quadratic model and the quaternionic plane).  #emph[The local system $bb(V)$ has rank five,
    a nondegenerate form of real signature $\( 3 \, 2 \)$, and Hodge numbers $\( 1 \, 3 \, 1 \)$ in types
    $\( 1 \, - 1 \) \, \( 0 \, 0 \) \, \( - 1 \, 1 \)$. It is the primitive part of $R^2 f_(*) bb(Q) \( 1 \)$.
    Conjugation of operators gives a surjective morphism of algebraic groups
#[#set math.equation(numbering: n => "(2.3)")
 $ rho : "GSp" \( bb(H) \, psi \) arrow.r "SO" \( bb(V) \, q \) \, wide g : T mapsto g T g^(- 1) \, wide ker rho =
   bb(G)_m . $ <eq:gsp-to-so>]

 Its restriction to $"Sp"_4$ is the spin covering, with kernel ${ plus.minus upright("id") }$.]
  #emph[At a point $t$ whose full geometric endomorphism algebra is an indefinite quaternion division algebra,
    the trace-free Rosati-symmetric endomorphisms form a rational two-plane $E_t subset bb(V)_t$ of Hodge vectors.
    The restriction of $q$ to $E_t$ is positive definite. This plane is spanned by two actual integral trace-free
    symmetric endomorphisms. If $Lambda_t = bb(V)_(bb(Z) \, t)$, then $L_t =
    E_t ∩ Lambda_t$ is saturated in $Lambda_t$; a selected generating pair need not generate this saturated lattice.]
] <lem:qm-plane>

#proof[
  In a symplectic basis, the matrix of $psi$ is $J = mat(delim: "(", 0, I_2; - I_2, 0)$.
    The equations $T^t J = J T$ and $"Tr" \( T \) = 0$ give
  $ T = mat(delim: "(", A, beta J_2; gamma J_2, A^t) \, wide A = mat(delim: "(", a, b; c, - a) \, wide J_2 =
    mat(delim: "(", 0, 1; - 1, 0) . $
  One checks that $T^2 = \( a^2 + b c - beta gamma \) I_4$. Thus
  $ q \( T \) = a^2 + b c - beta gamma \, $
  which has signature $\( 3 \, 2 \)$ and is nondegenerate over $bb(Z) \[ 1 \/ 2 \]$.
    The alternating form $\( u \, v \) mapsto psi \( T u \, v \)$ identifies the self-adjoint operators with
    alternating two-forms. The identity operator corresponds to $psi$,
    and its orthogonal complement for the trace form is the primitive part.
    Taking account of the polarization twist gives $bb(V)
    tilde.eq \( and.big^2 bb(H) \) \( 1 \)_(upright("prim"))$ and the stated Hodge numbers.
  Conjugation by a similitude preserves self-adjointness and the trace pairing.
    Its determinant on $bb(V)$ is $1$, since $"GSp"_4$ is connected.
    The induced Lie algebra map $frak(s p)_4 arrow.r frak(s o)_5$ is nonzero.
    Simplicity and equality of dimensions make it an isomorphism.
    Consequently the induced map on the adjoint groups is an isomorphism;
    these are the split adjoint groups of types $C_2$ and $B_2$.
    Its kernel on $"GSp"_4$ is exactly the scalar torus, proving (2.3) and the assertion about the spin covering.
    These statements are over $bb(Q)$, not merely over $bb(C)$.
  Put $D = "End"^0 \( cal(A)_t \)$. The polarization induces the positive Rosati involution on $D$.
    Over $bb(R)$, the identification $D ⊗ bb(R) tilde.eq M_2 \( bb(R) \)$ turns a positive involution into the
    adjoint for a positive definite form, and hence into transpose in a suitable basis.
    Its fixed subspace has dimension three. The cohomological trace is nonzero on the identity,
    so its kernel in that subspace has dimension two. For a nonzero symmetric endomorphism $u$,
    Rosati positivity gives $"Tr" \( u u^dagger \) = "Tr" \( u^2 \) > 0$.
    Thus $q$ is positive definite on this trace-free subspace.
  The rational realization of endomorphisms on $H^1$ is faithful and identifies endomorphisms with rational Hodge
    endomorphisms #cite(label("MilneShimura1995")) Theorem 4.1.
    In particular these vectors are Hodge vectors in $bb(V)_t$.
    Clearing denominators in a rational basis gives integral endomorphisms with the same symmetry and trace
    conditions. Equivalently one can first apply $u mapsto u + u^dagger$ and then $v mapsto 4 v -
    "Tr" \( v \) upright("id")$ to integral endomorphisms; the principal polarization makes the first operation
    integral. Finally, intersection of an integral lattice with a rational subspace is saturated. ◻
]

Write $cal(V)_(upright("dR"))$ for the algebraic de Rham realization,
  with its Gauss–Manin connection and trace form. The connection is the one constructed from the relative de Rham
  complex #cite(label("KatzOda1968")) Theorem 1; its functoriality and compatibility with cup products follow from
  that construction. Algebraic–analytic de Rham comparison #cite(label("Grothendieck1966DeRham")) Theorem 1$'$,
  applied to the relative complexes, identifies its horizontal local system with the Betti realization;
  this relative interpretation is recorded in #cite(label("Katz1970")) Section 0.0.
  Actual endomorphisms have compatible Betti, de Rham, and étale realizations,
  and their trace pairings are rational. For a polarized isogeny $phi : A arrow.r A'$ with $phi^(*) lambda' =
  m lambda$, cohomological pullback $phi^(*) : H^1 \( A' \) arrow.r
  H^1 \( A \)$ has multiplier $m$ and reverses direction. Our covariant transport on $H^1$ is

$ T_phi = m \( phi^(*) \)^(- 1) : H^1 \( A \) arrow.r H^1 \( A' \) \, $

which again has multiplier $m$. We put $I_phi \( u \) = T_phi u T_phi^(- 1)$ in the operator model.
  This is the isometry in (2.3) in the direction from $A$ to $A'$;
  on actual endomorphisms it realizes $alpha mapsto phi alpha phi^(- 1)$.
  These conventions also apply to polarized quasi-isogenies with rational multiplier and commute with composition.
  Thus an inverse isogeny of multiplier $m$ composed with Frobenius of multiplier $p$ has multiplier $p \/
  m$ on this covariant weight-one realization. For an isogeny, $deg phi = m^2$.

Under a flat trivialization, the period is the line of type $\( 1 \, - 1 \)$ in the smooth projective quadric

#[#set math.equation(numbering: n => "(2.4)")
 $ Q_V = { \[ z \] in bb(P) \( V_(bb(C)) \) : q \( z \) = 0 } \, wide dim_(bb(C)) Q_V = 3 . $ <eq:period-quadric>]

A rational vector is of type $\( 0 \, 0 \)$ if and only if it is orthogonal to this line:
  its reality supplies orthogonality to the conjugate line as well.
  In particular, the period at a quaternionic target is orthogonal to $E_t$.

=== 2.3 Monodromy and rational isogenies <monodromy-and-rational-isogenies>

#thm([Proposition 2.3.])[
  (Single and product monodromy).  #emph[For the family over any fixed smooth finite cover of a Hodge-generic
    curve in $cal(A)_2$, the connected algebraic monodromy on $bb(H)$ is $"Sp"_4$,
    and that on $bb(V)$ is $"SO" \( V \, q \)$. The same holds after pullback by a dominant morphism from an
    irreducible complex algebraic variety, on a smooth open of a resolution.]
  #emph[Let $S_1 \, S_2$ be two such curves, and let an irreducible complex algebraic variety $W$ map dominantly
    to both. On the sum of the two pulled-back weight-one systems, either the connected monodromy is $"Sp"_4 times
    "Sp"_4$, or the image of $W$ in the product of the two moduli curves is contained in a dominating component of
    a polarized isogeny correspondence. In the latter case the corresponding local period relation is given by a
    fixed element of $"GSp"_4 \( bb(Q) \)$ with positive multiplier.]
] <prop:monodromy>

#proof[
  The generic Mumford–Tate group of a Hodge-generic curve is $"GSp"_4$.
    The connected monodromy normality theorem for a polarizable geometric variation on a smooth algebraic base
    places connected monodromy normally in its derived group #cite(label("Andre1992")) §5, Theorem 1.
    Since $"Sp"_4$ is $bb(Q)$-simple, the connected monodromy is either trivial or $"Sp"_4$.
    In the first case a finite cover kills monodromy, and the theorem of the fixed part makes the variation
    constant; the moduli map would be constant. This is impossible.
    This consequence is also recorded in #cite(label("Andre1992")) §6, Remark 1.
    A dominant pullback has the same generic Mumford–Tate group and still has a nonconstant moduli map,
    so the argument also applies there. The assertion for $bb(V)$ follows from (2.3).
  For the two systems let $M$ be their generic Mumford–Tate group and $H$ their connected monodromy,
    after fixing rational symplectic bases on a simply connected open. Both projections of $H$ are $"Sp"_4$.
    Put $G = "PGSp"_4$. The algebraic Goursat lemma and simplicity give two possibilities for the image $macron(H)
    subset G times G$: it is the product, or it is the graph of a $bb(Q)$-defined automorphism $alpha$ of $G$.
    Indeed the kernels of the two projections are normal; in an adjoint simple group a proper such kernel is
    trivial. In the product case dimensions give $H = "Sp"_4 times "Sp"_4$.
  In the graph case, every automorphism of the split adjoint group of type $C_2$ is inner,
    since its Dynkin diagram has no automorphism. As $G$ is adjoint,
    a $bb(Q)$-defined inner automorphism is conjugation by an element $macron(g) in G \( bb(Q) \)$.
    The central exact sequence
  $ 1 arrow.r bb(G)_m arrow.r "GSp"_4 arrow.r G arrow.r 1 $
  and $H^1 \( bb(Q) \, bb(G)_m \) = 0$ show that $macron(g)$ lifts to $g in "GSp"_4 \( bb(Q) \)$.
    Conjugate the second factor by this lift, so that $macron(H)$ becomes the diagonal.
    Normality of $H$ in $M$ forces the adjoint image of $M$ into the normalizer of this diagonal.
    That normalizer is the diagonal itself: a normalizing pair $\( g_1 \, g_2 \)$ has $g_2^(- 1)
    g_1$ central in the adjoint group.
  The two Hodge homomorphisms therefore agree after passage to $G$.
    Their discrepancy on the weight-one spaces is a real algebraic character of the Deligne torus
    $"Res"_(bb(C) \/ bb(R)) bb(G)_m$ into the scalar $bb(G)_m$. Such a character is a power of the norm.
    The two weights are equal, so restriction to real scalars makes this power zero.
    The rational map $g$ thus identifies the Hodge structures themselves.
    Its similitude multiplier is positive because it compares the positive definite forms supplied by their
    polarizations and complex structures.
  This argument holds at very general points of the chosen open;
    holomorphicity extends the resulting fixed period relation across it.
    Write $mu > 0$ for the multiplier of $g : H^1 \( A_1 \) arrow.r H^1 \( A_2 \)$.
    The homology map in the direction from $A_1$ to $A_2$ is
  $ F = mu \( g^(- 1) \)^or : H_1 \( A_1 \, bb(Q) \) arrow.r H_1 \( A_2 \, bb(Q) \) . $
  It has multiplier $mu$ and commutes with the complex structures.
    Choose an integer $n > 0$ such that $n F$ is integral. It induces a holomorphic isogeny $phi : A_1 arrow.r
    A_2$, which is algebraic since the tori are projective. Its multiplier is the positive integer $m = n^2 mu$:
    integrality follows by evaluating its polarization identity on a pair of integral homology vectors of pairing
    $1$. Moreover $phi^(*) = n mu g^(- 1)$, so the covariant cohomological transport defined above is
  $ T_phi = m \( phi^(*) \)^(- 1) = n g . $
  Thus $phi$ realizes the original projective rational representative.
  A fixed rational similitude defines a closed algebraic Hecke correspondence, finite over either moduli factor.
    Concretely, for a fixed integral multiplier $m$, its kernels are among the finite subgroup schemes of
    $A \[ m \]$, and the principal polarizations and fixed level structures give the corresponding finite moduli
    problem. Closure of the local relation consequently contains the image of $W$ in one such correspondence.
    Its projections to both curves are dominant by hypothesis.
    Finite central twists of the local systems can be killed by a finite cover and do not change this conclusion
    about their moduli points. ◻
]

=== 2.4 Only finitely many dominating correspondences <only-finitely-many-dominating-correspondences>

Here the finiteness concerns whole correspondences dominating two fixed curves.
  Individual isolated isogenous pairs need not belong to the finite list.

#thm([Proposition 2.4.])[
  (Finitely many isogeny exceptions).  #emph[Fix finitely many closed irreducible Hodge-generic curves in
    $cal(A)_2 \( bb(C) \)$. For every ordered pair of these curves there are finitely many rational positive
    projective symplectic similitudes carrying a lift of the first onto a lift of the second,
    modulo integral changes of lifts. Consequently all dominating polarized isogeny correspondences between this
    list of curves are contained in a finite union of closed curves in their pairwise products.
    There is a fixed finite set of positive integers $m$ such that every pair on this union is joined by a
    polarized isogeny of one of these multipliers, of degree $m^2$.
    Refining the fixed level does not enlarge the required set of underlying multipliers.]
] <prop:finite-correspondences>

#proof[
  We first show that the real stabilizer of a lifted curve is discrete.
    Finite area of the curve quotient will then make its integral stabilizer a subgroup of finite index.
    Maps between two lifts consequently have only finitely many cosets,
    and rational representatives will give the fixed isogeny multipliers.
  Let $frak(H)_2$ be Siegel space, let $G_(bb(R)) = "PGSp"_4 \( bb(R) \)^(+)$ be its effective connected group of
    holomorphic isometries, and fix a torsion-free principal congruence subgroup $Gamma$ at fine level.
    For any curve in the list, choose an irreducible analytic component $X$ of its full inverse image in
    $frak(H)_2$. It is a closed analytic curve. Its normalization may be used wherever a smooth curve is needed.
    The integral stabilizer
  $ Gamma_X = { gamma in Gamma : gamma X = X } $
  contains the image of the monodromy of the normalization of the corresponding fine-level curve.
    In fact this image is the deck group on the lifted normalization over the smooth part.
    By 4, it is Zariski dense in the real adjoint group.
  We verify that the real stabilizer
  $ H_X = { g in G_(bb(R)) : g X = X } $
  is discrete. It is closed: if $g_n arrow.r g$ with $g_n X = X$, closedness of $X$ gives $g X subset X$,
    and applying the same argument to $g_n^(- 1)$ gives equality. Thus $H_X$ is a Lie subgroup.
    Its Lie algebra is invariant under $Gamma_X$. Stabilizing a fixed real vector subspace of the adjoint
    representation is an algebraic condition, so Zariski density makes this Lie algebra an ideal of
    $frak(s p)_4 \( bb(R) \)$. Simplicity leaves zero or the full Lie algebra.
    The latter would give $H_X = G_(bb(R))$, forcing $X = frak(H)_2$ by transitivity.
    The dimensions differ, so $H_X$ is discrete.
  Discreteness alone does not bound the number of cosets of $Gamma_X$.
    For this we use that $Gamma_X without X$, with normalization understood,
    has finite area for the metric induced from an invariant Hermitian metric on $frak(H)_2$.
    To check both the quotient and the effect of singularities,
    let $S_X$ be the normalization of the corresponding closed fine-level curve and form
  $ Y = S_X times_(Gamma without frak(H)_2) frak(H)_2 . $
  The normalization map from $S_X$ to its closed fine-level image is finite, so base change makes $Y arrow.r
    frak(H)_2$ finite, with image the full inverse image of that curve.
    On the other hand, $Y arrow.r S_X$ is a covering and locally a biholomorphism, so $Y$ is smooth.
    The finite map to that inverse image is an isomorphism above the smooth locus of the curve;
    hence it is its normalization.
  The component $Y_0$ normalizing $X$ has stabilizer $Gamma_X$;
    this group acts transitively on every fibre over $S_X$, since a deck transformation carrying two points of the
    same fibre to one another preserves their common connected component, and $Gamma_X without Y_0 tilde.eq S_X$.
    It therefore suffices to bound the pullback metric at the finitely many punctures of $S_X$.
  For completeness, any holomorphic map from the unit disk to $frak(H)_2$ contracts its invariant metric up to a
    fixed constant relative to the Poincaré metric. Realize $frak(H)_2$ as a bounded domain.
    An automorphism moving the image of the origin to a fixed origin,
    followed by the Cauchy derivative estimate in bounded coordinates, bounds the derivative at zero uniformly.
    Disk automorphisms give the pointwise assertion. Apply it on the universal cover of a punctured parameter
    disk. The descended upper bound is a constant multiple of
  $ frac(\| d u \|^2, \| u \|^2 log^2 \( 1 \/ \| u \| \)) \, $
  whose area on $0 < \| u \| < epsilon$ is finite. On the remaining compact part the period map is holomorphic and
    has finite area. Zeros of its derivative or singular branches only decrease this upper bound.
  We now deduce the precise group-theoretic consequence
  #[#set math.equation(numbering: n => "(2.5)")
   $ \[ H_X : Gamma_X \] < oo . $ <eq:stabilizer-index>]
  The action of $G_(bb(R))$ on $frak(H)_2 = G_(bb(R)) \/ K_(upright("max"))$ is proper,
    since $K_(upright("max"))$ is compact. Therefore the discrete group $H_X$ acts properly on $X$,
    with finite point stabilizers. Choose a regular point $z in
    X$ and a sufficiently small $H_(X \, z)$-invariant disk $D subset X$ of positive induced area such that $g D ∩
    D$ is empty for $g in.not H_(X \, z)$. Distinct double cosets in $Gamma_X without H_X \/
    H_(X \, z)$ give disjoint images of translates of $D$ in $Gamma_X without X$. Each translate embeds there:
    a further identification would give a nonidentity element of the torsion-free group $Gamma_X$ conjugate to an
    element of the finite group $H_(X \, z)$. All these disks have the same positive area.
    Finite total area thus bounds the number of double cosets,
    and finiteness of $H_(X \, z)$ bounds the number of left cosets. This proves (2.5).
  Choose lifts $X_1 \, X_2$ for two curves. If a rational positive projective similitude $g_0$ carries $X_1$ onto
    $X_2$, the set of all real such maps is $g_0 H_(X_1)$. By (2.5) this set has only finitely many classes modulo
    right multiplication by $Gamma_(X_1)$. Every class containing a rational map admits a rational representative.
    Integral changes of the chosen lifts add no classes: at coarse level all lifts are conjugate under the full
    integral symplectic group; at the chosen fine level there are only finitely many resulting classes.
    Thus there are finitely many rational maps for the whole fixed list.
  A dominating component of a Hecke correspondence determines a local equality between a rational translate of one
    lifted curve and another lifted curve. Both are irreducible closed analytic curves,
    so this local equality extends to equality of those lifts.
    It is therefore represented by one of the finite maps just obtained.
    Lift each projective rational representative to $"GSp"_4 \( bb(Q) \)$, using $H^1 \( bb(Q) \, bb(G)_m \) = 0$,
    and clear denominators on the integral homology lattices. Its multiplier becomes a positive integer $m$.
    This gives an isogeny of multiplier $m$ on the local correspondence.
    To retain that multiplier after taking closure, work over the fixed fine moduli space in characteristic zero.
    Subgroups $K subset A \[ m \]$ that are maximal isotropic for the Weil pairing and have order $m^2$ form a
    finite étale scheme over this space: étale-locally the torsion is a constant finite group.
    Each such subgroup gives the quotient $B = A \/ K$ with its principal polarization characterized by $q^(*)
    lambda_B = m lambda_A$. The resulting map to $cal(A)_2 times cal(A)_2$ is finite.
    Indeed it is finite over the first coarse factor, hence proper into the product because the second factor is
    separated, and its fibres are finite. Its image is therefore closed,
    and every geometric point of that image admits an isogeny of multiplier $m$.
    The closure of the local correspondence lies in this image,
    including at singular coarse points and points with extra automorphisms.
  Taking all representatives and the finitely many curve components of their intersections with the pairwise
    products that dominate both factors gives the required finite union.
    Additional level structures change only the finite covers of these moduli problems,
    not the underlying isogenies or their multipliers. ◻
]

We apply 5 to the full finite list of absolute Galois conjugates of the original closed coarse curve $C$.
  The canonical Siegel moduli space has reflex field $bb(Q)$,
  and Galois conjugation permutes its special subvarieties #cite(label("Orr2021")) Corollary 5.3, arXiv version 2.
  If a conjugate of $C$ lay in a proper special subvariety,
  inverse conjugation would contradict the Hodge genericity of $C$.
  Thus every curve in this list is Hodge generic. Enlarging $K$ for centers or markings adds no coarse image to
  this list. The resulting finite set of multipliers, the chosen center,
  and the rank-five lattices are fixed before the prime $ell$ and the marking cover of 17 are selected.
  Refining level changes the markings over these same coarse images;
  the exceptional isogenies are required only between the underlying polarized abelian varieties.
  Later estimates may therefore be proved on that fixed cover and descended by 2.

== 3 Interpolation with two arguments <sec:interpolation>

This section proves a polynomial height bound from common analytic relations at a weighted collection of places.
  The relations involve a small algebraic parameter $a$, auxiliary algebraic coordinates $U$,
  and solutions of fixed ordinary differential systems. A second argument may be $a R$,
  where $R$ is a coordinate of $U$. The conclusion will bound a height parameter $h$ polynomially in a complexity
  parameter $d$, provided the relations are not all identities on any of the algebraic branches used in a
  dimension descent.

=== 3.1 Weighted absolute heights <weighted-absolute-heights>

For a tuple $z = \( z_i \)$ over a number field $F$, write $∥∥ z_v = max_i \| z_i \|_v$ and put

$ upright(h) #h(-0.16667em) (z) = sum_v w_v log max \( 1 \, ∥z∥_v \) \, wide w_v =
  frac(\[ F_v : bb(Q)_v \], \[ F : bb(Q) \]) . $

At the infinite places the absolute value is the usual, unsquared one;
  thus a complex place has weight $2 \/ \[ F : bb(Q) \]$. The same notation for a polynomial,
  or a finite list of polynomials, means the height of its complete coefficient tuple #emph[with the additional
  coordinate $1$]. It therefore bounds the scale of the coefficients. For each fixed number of variables,

#[#set math.equation(numbering: n => "(3.1)")
 $ log lr(|G \( z \)|)_v lt.eq log max \( 1 \, ∥"coeff" G∥_v \) + deg \( G \) log max \( 1 \, ∥∥ z_v \) +
   epsilon_v log \# "mon" \( G \) \, $ <eq:polynomial-evaluation>]

where $epsilon_v$ is $1$ at an infinite place and $0$ otherwise.
  In particular, the sum of the last terms is controlled without counting the finite places.

Occasionally the selected local data distinguish embeddings inducing the same place.
  We then use embeddings $F arrow.r.hook bb(C)$ or $F arrow.r.hook bb(C)_p$,
  each with weight $1 \/ \[ F : bb(Q) \]$, which gives the same height formula.
  A selection of embeddings is allowed. On replacing $F$ by a finite extension,
  we always take #emph[all] extensions of each selected embedding.
  The sum of their weights is its original weight. All selected sums below are consequently unchanged by such an
  extension. No bound for the degree of a normal closure or of an auxiliary coefficient field will be used.

=== 3.2 The interpolation statement <the-interpolation-statement>

In the statement, the finite list of curves, connections, ordinary centres,
  rational frames regular at the centres, and algebraic chart germs is fixed.
  Its ranks and all polynomial-combination degrees are fixed.
  An allowed analytic expression is a polynomial combination of the algebraic coordinates $\( a \, U \)$,
  these chart germs, and entries of the horizontal solution matrices, evaluated at $a$ and possibly at $a R$,
  where $R$ is one of the coordinates of $U$. Constant summands are allowed.
  The total degree in all polynomial factors, including $a$ and every coordinate of $U$,
  is bounded by a fixed constant. Only substitution into the fixed germs produces Taylor coefficients of growing
  degree. The scalar coefficients of the combination may be algebraic and vary with the target.

#thm([Theorem 3.1.])[
  (Common-relation interpolation).  #emph[Fix the analytic data just described,
    a fixed affine ambient space with coordinates $\( a \, U \)$,
    and an algebraic ambient locus $X$ in that space. Let $h \, d gt.eq 2$, let $Psi \( h \) =
    1 + \( log h \)^c$ for a fixed $c gt.eq 1$, and let $z_(*) = \( a_(*) \, U_(*) \) in
    X \( overline(bb(Q)) \)$ with $a_(*) eq.not 0$. Suppose that the following bounds hold,
    with fixed polynomials $Q_i$ having nonnegative coefficients.]
  + #emph[The ambient locus has equations of degree at most $Q_0 \( d \)$ and affine height at most $Q_0 \( d \)
    Psi \( h \)$, and $upright(h) #h(-0.16667em) (z_(*)) lt.eq Q_0 \( d \) h$.]
  + #emph[There is a finite weighted selection $cal(V)$ of places or embeddings for which $lr(|a_(*)|)_v < 1$ and
#[#set math.equation(numbering: n => "(3.2)")
 $ S_(upright("small")) := sum_(v in cal(V)) w_v log 1 / lr(|a_(*)|)_v gt.eq frac(h, Q_1 \( d \)) \, wide
   sum_(v in cal(V)) w_v log max \( 1 \, ∥U_(*)∥_v \) lt.eq Q_2 \( d \) Psi \( h \) . $ <eq:interpolation-smallness>]

 If the second argument occurs, $lr(|R_(*)|)_v = 1$ for these local data.]
  + #emph[A common list of fixed length $s$ of allowed expressions
$ E_nu \( a \, U \) = sum_(j gt.eq 0) a^j e_(nu j) \( U \) \, wide 1 lt.eq nu lt.eq s \, $

 vanishes at $z_(*)$ at every selected local datum. Its coefficients satisfy
$ deg e_(nu j) lt.eq C \( 1 + j \) \, wide upright(h) #h(-0.16667em)
  (\( e_(nu j) \)_(nu \, thin 0 lt.eq j lt.eq l)) lt.eq Q_3 \( l \, d \) Psi \( h \) . $

 There are $b_v gt.eq 0$ with $sum_(v in cal(V)) w_v b_v lt.eq
   Q_4 \( d \) Psi \( h \)$ such that the convergent tails at the target satisfy, for every $l gt.eq 0$,
#[#set math.equation(numbering: n => "(3.3)")
 $ lr(|sum_(j gt.eq l) a_(*)^j e_(nu j) \( U_(*) \)|)_v lt.eq
   lr(|a_(*)|)_v^l exp \( \( 1 + l \) b_v \) . $ <eq:interpolation-tail>]

]
  + #emph[If $W subset.eq X$ is an irreducible algebraic variety containing $z_(*)$ on which $a$ is nonconstant,
    then on every normalization branch above the generic point of every component of $W ∩
    V \( a \)$ the expressions $E_1 \, dots.h \, E_s$ are not all identically zero.
    The expressions use their specified ordinary chart germs.]
  #emph[Then $h lt.eq C_1 d^(C_2)$, with constants depending only on the fixed data and the polynomials in the
    hypotheses.]
] <thm:interpolation>

The hypothesis in (iv) includes branches on proper subvarieties of $X$.
  The proof only uses the varieties encountered in the descent below, so verification on those varieties suffices.
  In the application this is the role of 19.

Here is the descent mechanism. Suppose that $h$ is larger than a polynomial in $d$,
  and let $W subset.eq X$ be an irreducible variety containing the target.
  When $a$ is nonconstant and $W$ meets $a = 0$, we pass to a graph $W'$ that is isomorphic to $W$ over $a eq.not
  0$. On this graph we construct a polynomial $P$ with

$ P in.not I \( W' \) \, wide P \( z'_(*) \) = 0 \, $

where $z'_(*)$ is the lifted target. The intersection with $P =
  0$ then projects to a smaller-dimensional variety containing $z_(*)$.
  We discard the graph coordinate after each step, so the ambient dimension stays fixed.

The two requirements on $P$ have different sources. Nonidentity in (iv),
  together with an ordinary-point zero estimate, gives a graph whose special fibre satisfies a codimension-two
  condition after one further equation is imposed. Counting coefficients layer by layer in powers of $a$ then
  gives a polynomial nonzero on $W'$ whose target value is bounded locally by $\|
  a_(*) \|_v^n$ times controlled factors. The ratio of $n$ to its degree $L$ can exceed any prescribed polynomial
  in $d$, while both $n$ and $L$ remain polynomially bounded.
  At the selected places, the factor $\| a_(*) \|_v^n$ contributes $-
  n S_(upright("small"))$ to the logarithm of its value. At the other places,
  its degree costs at most $L$ times the global height of the lifted target.
  For a sufficiently large ratio $n \/ L$, the product formula forces $P \( z'_(*) \) = 0$.
  The remaining errors are polynomial multiples of $Psi \( h \)$ and are absorbed when $h$ is large.

=== 3.3 Effective algebra in fixed dimension <effective-algebra-in-fixed-dimension>

The descent needs two kinds of algebraic bounds: equations for each smaller variety must retain controlled degree
  and height, and the interpolation polynomial must have a membership identity with controlled coefficients.
  We record both bounds here. Throughout this subsection, “controlled” means polynomial in the input degrees and
  linear in $1 +$ the joint logarithmic coefficient height, with ambient dimension fixed.

In a fixed number of variables, ideals with generators of degree at most $D$ have Gröbner bases of degree
  polynomial in $D$, for any prescribed monomial order #cite(label("Dube1990")) Corollary 8.3.
  We may first discard generators linearly dependent on the others, leaving polynomially many.
  If a polynomial belongs to such an ideal, the degrees in a membership representation are polynomial in $D$ and
  the degree of that polynomial #cite(label("Aschenbrenner2004")) Theorem 3.4.
  This is a bound for arbitrary ideal membership.

These degree bounds also give coefficient bounds from the original input coefficients.
  Let $delta$ be the Gröbner-basis degree bound, and choose the minimal monomial generators $M_alpha$ of the
  initial ideal. Each is the leading monomial of a polynomial of degree at most $delta$ in the ideal.
  Seek such a polynomial in the form

$ H_alpha = M_alpha + sum_(N < M_alpha\
deg N lt.eq delta) c_(alpha N) N \, wide H_alpha = sum_i A_(alpha i) G_i . $

The membership bound supplies a polynomial bound for the degrees of the $A_(alpha i)$.
  The displayed coefficient equations are therefore a solvable affine linear system of polynomial size whose
  entries are only the original coefficients and $0 \, plus.minus 1$.
  A solution obtained by nonzero minors bounds the coefficients of $H_alpha$ and its representation
  simultaneously. The resulting $H_alpha$ form a Gröbner basis,
  since their leading monomials generate the initial ideal.
  Thus no bound for coefficients of a previously chosen basis is presumed.

If the joint affine height of the input is $H$, a determinant of size $s$ has height at most $s H + s log s$.
  Normalizing a nonzero coordinate and concatenating polynomially many coefficient lists incurs only a polynomial
  factor. Consequently all these affine coefficient heights are at most $Q \( D \) \( H + 1 \)$:
  the dependence on the logarithmic input height is linear.
  The same argument treats elimination and saturation; for example saturation by $a$ is computed by eliminating
  $z$ after adjoining $z a - 1$.

For varieties, the degree and arithmetic Bézout inequalities give the following consequence:
  intersections, closures of coordinate projections, and choices of irreducible components have degrees polynomial
  in the input degrees and Chow heights at most a polynomial in the input degrees times $1 +$ the joint input
  height. Here and below the ambient dimensions are fixed. We use the arithmetic Bézout inequality
  #cite(label("KPS2001")) Corollary 2.11, the projection bound #cite(label("KPS2001")) Lemma 2.6,
  and additivity and nonnegativity of cycle heights #cite(label("KPS2001")) Section 1.2.4.
  The comparison of Chow coefficient height with this cycle height is #cite(label("KPS2001")) Lemma 1.1,
  inequality (1.2), and Section 1.2.4. One may work throughout with Chow forms,
  normalizing one nonzero coefficient to $1$. The affine height of the normalized coefficient tuple then equals
  its projective height, by the product formula.

It is enough to recover equations #emph[set-theoretically] from a Chow form.
  Indeed, if $Z subset bb(P)^N$ has dimension $r$ and Chow form $cal(C)_Z$, substitute the $r + 1$ hyperplanes

$ sum_(j = 1)^N T_(i j) \( X_j - x_j X_0 \) = 0 wide \( 0 lt.eq i lt.eq r \) $

in $cal(C)_Z$ and take its coefficients as a polynomial in the $T_(i j)$.
  These coefficients vanish at $x$ precisely when $\[ 1 : x \] in Z$:
  outside $Z$, the hyperplanes through that point form a base-point-free system on $Z$, and $r +
  1$ general members have empty intersection on $Z$. The resulting equations have degree at most $\( r + 1 \) deg
  Z$ and controlled affine coefficient heights by expansion. Their number is polynomial in $deg Z$.

Thus every variety used below admits an ideal $frak(b)$ of controlled generators with

#[#set math.equation(numbering: n => "(3.4)")
 $ V \( frak(b) \) = W \, wide frak(b) subset.eq I \( W \) . $ <eq:controlled-support>]

We need not compute generators of the radical $I \( W \)$. The distinction will be useful:
  ideal membership in $frak(b)$ suffices for evaluation on $W$, while nonvanishing on $W$ will be imposed separately.

=== 3.4 An ordinary-point zero estimate <an-ordinary-point-zero-estimate>

The differential method compares successive derivatives in a finite-dimensional row space;
  see the classical multiplicity estimate of Bertrand and Beukers #cite(label("BertrandBeukers1985")) Theorem 1.
  We give the argument here because the algebraic variety on which the system is restricted varies in the descent,
  and the bound must be polynomial in its degree while allowing the second argument $a R$.

#thm([Lemma 3.2.])[
  (Uniform ordinary-point order bound).  #emph[For the fixed analytic data of 6 there is a polynomial $M \( D \)$
    with the following property. Let $W$ be an irreducible affine variety of degree at most $D$ on which $a$ is
    nonconstant. On a branch above the generic point of a component of $V_W \( a \)$,
    every allowed expression $E$ which is not identically zero satisfies
#[#set math.equation(numbering: n => "(3.5)")
 $ "ord"_(frak(p)) E < M \( D \) "ord"_(frak(p)) a . $ <eq:divisorial-zero-estimate>]

 The bound is independent of the heights of the coefficients of $W$ and of the expression.]
] <lem:zero-estimate>

#proof[
  We first preserve the branch order on a curve of controlled degree,
    then use the ordinary differential equation to bound that order independently of coefficient heights.
  #emph[Reduction to a curve.] Write $k = dim W$, and let $tilde(D)$ be the normalization divisor defining the
    branch. At a general point $p$ of $tilde(D)$, both the normalization and $tilde(D)$ are smooth,
    and the finite map from $tilde(D)$ to its image $D_0$ is étale at $p$ after restricting to dense open subsets,
    by separability in characteristic zero. Choose $k - 1$ general affine linear functions whose differentials
    restrict to a basis of the cotangent space of $D_0$ at the image of $p$.
    Their pullbacks restrict to a basis on $tilde(D)$. Their common level set through $p$ is consequently a smooth
    curve germ transverse to $tilde(D)$ in the normalization.
    The downstairs linear section is proper and has total projective degree at most $D$.
    The transverse germ leaves the nonnormal locus, so its map to its image curve is generically the normalization
    isomorphism. It is thus the corresponding smooth germ on the normalization of an irreducible component of that
    linear section.
  This slice preserves formal orders as well. If $"ord"_(tilde(D)) a = e > 0$ and $"ord"_(tilde(D)) E = N$,
    only the terms with $j lt.eq N \/ e$ contribute to the leading coefficient.
    After deleting a proper closed subset of $tilde(D)$, write $a = t^e v$ and that finite truncation as $t^N u$,
    where $t$ is a local equation of $tilde(D)$ and $u \, v$ are units.
    On the transverse curve $t$ is a uniformizer. Hence the orders are exactly $e$ and $N$ after restriction.
    All these conditions hold at a general slice point.
  Let $T_0$ be the smooth projective normalization of this sliced curve.
    Its genus is polynomial in $D$, by a general birational plane projection and the arithmetic genus of a plane
    curve. Every ambient coordinate on $T_0$ is a quotient $X_i \/ X_0$,
    so its polar divisor has degree at most $D$. In particular the maps defined by $a$ and $a
    R$ have degrees at most $D$ and $2 D$, respectively.
  Adjoin the points on the fixed curves specified by the algebraic chart germs.
    Constant argument maps contribute constant chart factors and require no cover;
    in what follows index only the nonconstant argument maps.
    If the corresponding fixed maps to $bb(P)^1$ have degrees $d_i$ and branch sets $B_i$,
    including infinity when it is a branch value, the chosen normalized fibre-product component $T arrow.r
    T_0$ has degree at most $N_0 = product_i d_i$. It is étale outside $union.big_i phi.alt_i^(- 1) \( B_i \)$,
    where $phi.alt_i$ is $a$ or $a R$. This set has at most $sum_i \# B_i deg phi.alt_i = O \( D \)$ points,
    and the ramification contribution above each is at most $N_0$. Thus Riemann–Hurwitz gives
  $ 2 g \( T \) - 2 lt.eq N_0 max { 0 \, 2 g \( T_0 \) - 2 } + O \( D \) . $
  The degrees of the maps from $T$ to the fixed curves are bounded by $N_0 deg phi.alt_i$,
    so all pulled-back fixed divisors have polynomial degree.
    Poles of $a R$ are included in this calculation through the fibre above infinity.
    All ramification indices are bounded as well; any further ramification multiplies the two orders in (3.5) by
    the same factor.
  #emph[The ordinary differential system.] Let $p in T$ be the point of the specified branch.
    In direct sums and tensor products of the fixed pulled-back systems the expression takes the form
  $ E = r_0 y \, $
  where $y$ is a horizontal column of a fixed rank $N$ and $r_0$ is a rational row.
    Polynomial algebraic factors are absorbed in $r_0$. A constant map to one of the fixed curves contributes a
    constant horizontal factor. The rational frames here are the pullbacks of the fixed frames;
    they are regular and invertible at $p$. In fact $a = 0$ and $R$ is regular at the chosen affine divisor,
    so both arguments $a$ and $a R$ are at their ordinary centres.
    The connection and $r_0$ are therefore regular at $p$. Their global polar divisors have degrees polynomial in
    $D$, by the bounds on the degrees of the pullback maps and of the coordinate functions.
  Choose a rational function $z$ on $T$ which is a uniformizer at $p$ and whose polar divisor has degree at most
    $2 g \( T \) + 1$. Such a function follows from Riemann–Roch by prescribing its first two jets at $p$ and
    allowing a pole at another point. For $g \( T \) = 0$ a degree-one function suffices.
    Put $delta = d \/ d z$, and write the horizontal equation as $delta y = A y$.
    The poles of the rational vector field $delta$ are bounded in degree by the zero divisor of $upright(d) z$,
    hence by $2 g \( T \) - 2 + 2 deg z$. Differentiating a rational function adds at most its reduced polar
    divisor and the polar divisor of this vector field. It follows that $A$, $r_0$,
    and any fixed number of their derivatives have polar degrees polynomial in $D$.
    They remain regular at $p$; using a uniformizer rather than dividing by $upright(d)
    a$ accommodates arbitrary ramification of $a$.
  Set
  $ r_(i + 1) = delta r_i + r_i A . $
  Then $delta^i E = r_i y$. The successive rows become dependent after at most $N$ steps.
    If $r_rho$ is the first row dependent on its predecessors, their span $M = chevron.l r_0 \, dots.h \,
    r_(rho - 1) chevron.r_(bb(C) \( T \))$ is stable under the dual connection:
    differentiating the dependence shows that every later row belongs to it. Here $rho lt.eq N$.
  Let $cal(O) = cal(O)_(T \, p)$ and saturate the common kernel of these rows in $cal(O)^N$.
    Saturation makes it a subbundle locally. It is stable under the ordinary connection,
    since its derivative is regular and belongs to the kernel generically.
    The quotient has an ordinary connection as well. Explicitly,
    if $v$ is a local section annihilated by every row in $M$,
    stability of $M$ under the dual connection gives $r \( nabla_delta v \) = 0$ for every $r in M$.
    The ordinary connection makes $nabla_delta v$ regular, so it belongs to the saturated kernel.
    The kernel and its quotient are free over the local discrete valuation ring,
    and the induced quotient connection has no pole. The image $macron(y)$ of $y$ in this quotient is a nonzero
    horizontal section: a zero image would give $r_0 y = E = 0$.
    Conversely, if $E$ were identically zero, all its derivatives $r_i
    y$ would be zero and $y$ would lie in the kernel. The nonzero horizontal quotient section has nonzero
    reduction at $p$: the coefficient recurrence of an ordinary linear differential equation forces a horizontal
    section with zero initial value to be zero.
  The integral dual of this free quotient is exactly the saturated row lattice $cal(L) = M ∩ cal(O)^N$:
    its rows are the integral functionals annihilating the common kernel.
    Since $macron(y)$ has nonzero reduction, one such functional $lambda in cal(L)$ has $lambda y$ a unit.
    Choose a nonzero $rho times rho$ minor $Delta$ of the matrix with rows $r_0 \, dots.h \, r_(rho - 1)$.
    All these rows are regular at $p$. Cramer’s rule on the selected columns gives
  $ Delta lambda = sum_(i = 0)^(rho - 1) c_i r_i \, wide c_i in cal(O) . $
  Hence at least one $i < rho$ satisfies $"ord"_p \( r_i y \) lt.eq "ord"_p Delta$.
    This is the elementary-divisor bound for the row lattice, expressed without choosing a new global frame.
    A nonzero rational function on $T$ has equal total zero and pole degrees,
    so $"ord"_p Delta$ is bounded by its polar degree, which is polynomial in $D$. Finally, since $z$ is a uniformizer,
  $ "ord"_p E lt.eq "ord"_p \( delta^i E \) + i lt.eq "ord"_p Delta + N - 1 . $
  Increasing the resulting polynomial by $1$ proves (3.5), since $"ord"_p a gt.eq 1$.
    This construction used only degrees, genera, ramification and fixed ranks; it used no arithmetic height. ◻
]

=== 3.5 The graph and its special fibre <the-graph-and-its-special-fibre>

#thm([Lemma 3.3.])[
  (Dimension of the constrained graph fibre).  #emph[Let $W$ be an irreducible affine variety of dimension $k
    gt.eq 1$ with coordinate $a$ nonconstant, let $f$ be regular on $W$, and let $m gt.eq 1$ be an integer. Suppose
$ "ord"_(frak(p)) f < m "ord"_(frak(p)) a $

 on every normalization branch over the generic components of $V_W \( a \)$.
   Let $W'$ be the affine graph closure of $q = f \/ a^m$ over $W \\ V \( a \)$. For every regular function $g$ on $W$,
#[#set math.equation(numbering: n => "(3.6)")
 $ dim V #scale(x: 120%, y: 120%)[\(] I \( W' \) \, a \, q + g #scale(x: 120%, y: 120%)[\)] lt.eq k -
   2 . $ <eq:graph-fiber-dimension>]

 The set is empty when $k = 1$; the same convention applies if $V_W \( a \)$ is empty.]
] <lem:graph-fiber>

#proof[
  Write $A = overline(bb(Q)) \[ W \]$, $u = f \/ a^m$, and let $B$ be the finite normalization of $A$.
    The graph has coordinate ring $A \[ u \]$, and $B \[ u \]$ is finite over it.
    Suppose there were a point of the graph above a generic point $frak(p)$ of a component of $V_W \( a \)$.
    Lying over in $B \[ u \]$ and then contraction to $B$ give a prime $frak(r)$ above $frak(p)$.
    The local ring $B_(frak(r))$ is a discrete valuation ring.
    The hypothesis says $u = v pi^(- s)$ there, for a unit $v$, a uniformizer $pi$, and $s > 0$.
    Its map into the local ring of the lifted graph point would satisfy $pi^s u =
    v$ with $pi$ in the maximal ideal and $v$ invertible, a contradiction.
  The constructible image of $V_(W') \( a \)$ therefore contains none of the generic points of $V_W \( a \)$.
    Each component of the latter has dimension $k - 1$, so the closure of this image has dimension at most $k -
    2$. On imposing $q = - g$, projection from the graph to $W$ is a closed immersion:
    in its coordinate ring the extra coordinate is already specified by $g$.
    Its image lies in the preceding constructible image, which proves (3.6). ◻
]

=== 3.6 Interpolation by successive powers of the parameter <interpolation-by-successive-powers-of-the-parameter>

The extra equation $q + g = 0$ in 8 is essential. For example, on $W = bb(A)^2$ with coordinates $\( a \, u \)$,
  take $f = u$ and $m = 1$. The graph $W' = { a q = u }$ still has a one-dimensional fiber over $a = 0$:
  its entire $q$-line maps to $\( a \, u \) = \( 0 \, 0 \)$. Imposing $q + g_0 \( u \) = 0$ leaves one point.
  Thus it is the projected boundary, and then the graph with this additional equation, that has dimension $k - 2$;
  the boundary of the graph alone need not have that dimension. 1 displays this distinction.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.323cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W'=\{u="aq"\}$#linebreak()coordinates $(a,q)$]]])])
  content((7.423, 0), [#box(width: 5.323cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W= bb(A)^2$#linebreak()coordinates $(a,u)$]]])])
  content((0, -2.49), [#box(width: 5.323cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W' inter \{a=0\}$: the $q$-line#linebreak()dimension $1$]]])])
  content((7.423, -2.499), [#box(width: 5.323cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[image $(a,u)=(0,0)$#linebreak()dimension $0$]]])])
  line((2.662, 0), (4.762, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.712, 0), [#text(size: 9pt)[projection]], anchor: "south", padding: 0.1176cm)
  line((0, -1.965), (0, -0.5648), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.423, -1.974), (7.423, -0.5741), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.662, -2.493), (4.762, -2.496), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.712, -2.494), [#text(size: 9pt)[contracts]], anchor: "south", padding: 0.1176cm)
  content((0, -4.94), [#box(width: 5.323cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$a=0, q=-g_0(0)$#linebreak()dimension $0$]]])])
  line((0, -4.415), (0, -3.015), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -3.715), [#text(size: 9pt)[$q+g_0(u)=0$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The graph $q = u \/ a$ over a two-dimensional affine base. Horizontal arrows are projections and vertical arrows are inclusions. The graph boundary is a line, but its image is a point. The additional equation $q + g_0 \( u \) = 0$ selects one point on that line, giving the dimension $k - 2 = 0$ used in the layer count. ],
) <fig:graph-projection>

The next lemma gives a polynomial of low total degree with an arbitrarily large prescribed polynomial ratio of
  order to degree. Requiring nonvanishing on the variety is part of the construction.

#thm([Lemma 3.4.])[
  (Interpolation through successive layers).  #emph[Let $W' subset bb(A)^M$ be irreducible of dimension $k gt.eq
    1$, with coordinates including $a \, U \, q$. Let $frak(b) = \( G_1 \, dots.h \, G_t \)$ have controlled
    generators and $V \( frak(b) \) = W'$. Suppose
$ dim V \( frak(b) \, a \, F_0 \) lt.eq k - 2 \, wide F_0 = q + g_0 \( U \) \, $

 and put $F_n = F_0 + sum_(j = 1)^(n - 1) a^j g_j \( U \)$, where $m gt.eq 1$ is an integer and $deg g_j lt.eq
   C \( m + j + 1 \)$. Here $M \, C$ are fixed and all other complexities, including $m$,
   are polynomially bounded in $d$; the coefficient heights through index $n$ are bounded by $Q \( n \, d \)
   Psi \( h \)$.]
  #emph[For any prescribed positive integer $r$ polynomially bounded in $d$,
    there are positive integers $L$ and $n = r L$, both polynomially bounded in $d$, and a polynomial $P$ such that
#[#set math.equation(numbering: n => "(3.7)")
 $ deg P lt.eq L \, quad P in.not I \( W' \) \, quad P = sum_(lambda = 1)^t A_lambda G_lambda + A F_n +
   a^n B . $ <eq:layer-membership>]

 The degrees of all the coefficients in this representation are polynomial in $d$, and their joint affine height,
   including that of $P$, is at most $Q' \( d \) Psi \( h \)$.
   The polynomial $Q'$ may depend on the prescribed polynomial bound for $r$.]
] <lem:layer-interpolation>

#proof[
  Fix a degree-compatible monomial order and a Gröbner basis of $frak(j) = \( frak(b) \, a \, F_0 \)$,
    together with representations of its elements in these displayed generators.
    Their degrees and heights have the bounds recorded above.
    For each reducible monomial, fix a basis element to divide by.
    Division in degree at most $T$ can then be performed by a fixed decreasing sweep through all monomials of that
    degree range, allowing zero coefficients. Thus, for $deg H lt.eq T$, it gives linearly in $H$
  #[#set math.equation(numbering: n => "(3.8)")
   $ H = "rem"_(frak(j)) H + sum_lambda C_lambda G_lambda + a C + F_0 D . $ <eq:layer-division>]
  There is a fixed bound $Delta$, polynomial in the complexities at this stage,
    such that every term on the right has degree at most $T + Delta$.
    Indeed, degree-compatible division produces quotient multipliers of degree at most $T -
    deg H_alpha$ for a basis element $H_alpha$. Substituting its fixed generator representation adds its excess
    degree, at most $Delta$; it does not multiply $T$.
  Work modulo $\( frak(b) \, F_n \, a^n \)$. In (3.8), the $a C$ term advances one layer, while
  $ F_0 D equiv - sum_(j = 1)^(n - 1) a^j g_j D $
  advances at least one layer. Starting with a polynomial of degree at most $L$,
    apply this division to each successive coefficient of $1 \, a \, dots.h \, a^(n - 1)$.
    The coefficient being divided at layer $i$ has degree at most $L + B_0 \( i + 1 \)$,
    for a polynomially bounded $B_0$. To verify this induction, a jump by $j gt.eq 1$ adds at most $Delta +
    C \( m + j + 1 \) lt.eq B_0 j$ to the degree. The sum of all jumps to layer $i$ is $i$,
    and there is no substitution at the same layer. We retain every remainder and require it to be zero.
  When $k = 1$, the dimension hypothesis makes $frak(j) = \( 1 \)$, so there are no remainder conditions.
    If $frak(j) eq.not \( 1 \)$, then $k gt.eq 2$, and the number of standard monomials of degree at most $T$ is at most
  $ B_1 \( 1 + T \)^(k - 2) \, $
  with $B_1$ polynomially bounded. Here is an elementary uniform bound.
    If the monomial initial ideal has generators of degree at most $D_1$,
    in a standard monomial at most $dim V \( frak(j) \)$ exponents can be at least $D_1$.
    Otherwise its variables of large exponent would contain the support of a monomial generator,
    by the coordinate-prime description of the radical of a monomial ideal.
    Choose those variables and bound every other exponent by $D_1 - 1$.
    This gives the asserted bound with a constant depending polynomially on $D_1$, since $M$ is fixed.
    If $frak(j) = \( 1 \)$ there are no standard monomials and no conditions. Thus at most
  #[#set math.equation(numbering: n => "(3.9)")
   $ B_1 n \( 1 + L + B_0 n \)^(k - 2) $ <eq:layer-condition-count>]
  linear conditions suffice when the ideal is proper.
  Choose $k$ algebraically independent functions among the ambient coordinate functions on $W'$.
    Such a subset exists because these functions generate its function field.
    Let $V_L$ be the span of their monomials of total degree at most $L$,
    regarded as actual polynomials in the ambient coordinates. Then
  $ dim V_L = binom(L + k, k) \, wide V_L ∩ I \( W' \) = 0 . $
  This chooses independent polynomial representatives; no remainder map is presumed to descend canonically to
    classes modulo $I \( W' \)$. One can equally extend $V_L$ to a linear complement of $I \( W' \) ∩
    overline(bb(Q)) \[ a \, U \, q \]_(lt.eq L)$.
  Set $n = r L$. For a proper $frak(j)$, the bound (3.9) is at most
  $ B_2 r \( 1 + B_0 r \)^(k - 2) L^(k - 1) $
  for a polynomially bounded $B_2$. A sufficiently large polynomial choice of $L$ makes it smaller than
    $binom(L + k, k)$. In the unit-ideal case the conclusion holds already for any nonzero source vector.
    There is consequently a nonzero element $P in V_L$ for which all remainders vanish.
    This proves both membership and $P in.not I \( W' \)$.
  For completeness, the construction also gives the asserted affine height bounds.
    Division in bounded degree is a linear operation on a coefficient space of polynomial dimension.
    During division the leading monomial strictly decreases among the monomials of degree at most $T$;
    thus its coefficient transformation is a product of polynomially many matrices with controlled affine heights.
    For composable matrices with inner dimension $b$, the coefficient-tuple convention gives
  $ upright(h) #h(-0.16667em) (A B) lt.eq upright(h) #h(-0.16667em) (A) + upright(h) #h(-0.16667em) (B) + log b . $
  Indeed, locally every entry is a sum of $b$ products, and only infinite places contribute the factor $b$.
    The $n$ layer operations therefore have polynomial affine heights.
    Their source basis consists of monomials, so has height zero.
    A kernel vector obtained by minors and normalized to have a nonzero coordinate equal to $1$ has affine height
    $Q \( d \, n \, L \) Psi \( h \)$.
  The tracked divisions give a membership representation of bounded degree.
    Alternatively, apply the arbitrary-membership bound to $\( frak(b) \, F_n \, a^n \)$ and solve its coefficient
    equations with the chosen $P$: the degrees and number of unknowns are polynomial in $d \, n \, L$,
    and minors give the same affine height estimate. This bounds the scale of $P \, A_lambda \, A \, B$ together.
    Since $r \, L \, n$ are polynomial in $d$, (3.7) follows with the stated bounds. ◻
]

=== 3.7 Product formula and descent <product-formula-and-descent>

#proof[
  We descend through irreducible subvarieties $W subset.eq X$ containing $z_(*)$.
    At every step their degrees and degrees of chosen set-theoretic equations are polynomial in $d$,
    and the affine heights of those equations are at most $Q \( d \) Psi \( h \)$.
    Initially take a component of $X$ containing the point. The algebraic bounds above preserve these conditions
    under each operation below.
  If $a$ is constant on $W$, its constant value has height at most $Q \( d \) Psi \( h \)$,
    by projection to the $a$-line and the component height bound. On the other hand the product formula and (3.2) give
  #[#set math.equation(numbering: n => "(3.10)")
   $ upright(h) #h(-0.16667em) (a_(*)) = sum_v w_v log max \( 1 \, lr(|a_(*)|)_v^(- 1) \) gt.eq
     S_(upright("small")) gt.eq h \/ Q_1 \( d \) . $ <eq:constant-parameter-height>]
  Hence $h lt.eq Q \( d \) Psi \( h \)$, which implies a polynomial bound in $d$:
    for fixed $c$, $1 + \( log h \)^c lt.eq C_c sqrt(h)$ for $h gt.eq 2$.
  Suppose now that $a$ is nonconstant and $k = dim W gt.eq 1$.
    If $a$ is nonconstant but $V_W \( a \)$ is empty, this case can be settled without an analytic equation.
    For the controlled ideal $frak(b)_W = \( G_1 \, dots.h \, G_t \)$,
    the ideal $\( frak(b)_W \, a \)$ is the unit ideal. The membership and coefficient bounds provide
  $ 1 = sum_i A_i G_i + a B $
  with polynomial degrees in $d$ and joint affine height $Q \( d \) Psi \( h \)$.
    At the target $1 = a_(*) B \( z_(*) \)$. Evaluating $B$ on the selected embeddings costs only its coefficient
    height and the small local sizes of $U_(*)$, since $lr(|a_(*)|)_v < 1$. It follows that
  $ S_(upright("small")) = sum_(v in cal(V)) w_v log lr(|B \( z_(*) \)|)_v lt.eq Q \( d \) Psi \( h \) . $
  Again $h lt.eq Q \( d \) Psi \( h \)$ gives the required polynomial bound.
    We may therefore suppose that $V_W \( a \)$ is nonempty.
  The total number of generic normalization branches above $V_W \( a \)$ is at most $deg W$.
    Indeed take one general transverse linear slice meeting every component $D_j$ of this fibre at general affine
    points. The curve components have total degree at most $deg W$.
    Their normalizations contain the transverse germs above all these points.
    If a normalization divisor above $D_j$ has residue degree $f_i$ and $e_i = "ord"_i \( a \)$,
    it contributes $deg \( D_j \) f_i e_i$ to the zero divisor of $a$ on the normalized slice.
    That divisor has degree equal to the polar degree of $a$, at most $deg W$.
    In particular the number of branches is bounded. This counts residue degrees and ramification multiplicities,
    even though the normalization itself is birational.
  At each such branch choose the lowest nonzero order among the $E_nu$.
    To avoid cancellation of these leading terms in a combination, set
  $ E = sum_(nu = 1)^s t^(nu - 1) E_nu $
  for a positive integer $t$. Each branch excludes at most $s - 1$ values of $t$,
    since its leading-coefficient polynomial is nonzero. There is therefore a permissible $t$ of polynomial size
    in $d$. This combination preserves the coefficient and tail bounds:
    at finite places its coefficients are integral, and the extra triangle-inequality factor at infinite places
    has total logarithm polynomial in $d$. Absorb it in the $b_v$. Write $E = sum a^j e_j \( U \)$.
  By 7, an integer $m$ polynomially bounded in $d$ can be chosen so that, for
  $ f = sum_(j = 0)^(m - 1) a^j e_j \( U \) \, $
  one has $"ord"_(frak(p)) f < m "ord"_(frak(p)) a$ on every relevant branch.
    Indeed the omitted terms have order at least $m "ord"_(frak(p)) a$,
    since all their coefficients are regular on the affine variety. Form the graph $W'$ of $q = f \/ a^m$.
    Its equations with controlled support are obtained by saturating $\( frak(b)_W \, a^m q - f \)$ by $a$;
    the closure of its support is exactly the graph. This takes place in one more variable and has polynomial
    degree and affine height bounds.
  The target lifts to $z'_(*) = \( a_(*) \, U_(*) \, q_(*) \)$.
    Its global height is bounded using the rational expression for $q_(*)$:
  #[#set math.equation(numbering: n => "(3.11)")
   $ upright(h) #h(-0.16667em) (z'_(*)) lt.eq Q_5 \( d \) h + Q_6 \( d \) Psi \( h \) . $ <eq:graph-global-height>]
  Here $Q_5$ is fixed at this stage, before the interpolation degree and order are chosen.
    Its selected local size must instead be estimated using the exact equation $E \( z_(*) \) = 0$. The tail bound gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ lr(|q_(*)|)_v = lr(|a_(*)^(- m) sum_(j gt.eq m) a_(*)^j e_j \( U_(*) \)|)_v lt.eq
     exp \( \( m + 1 \) b_v \) . $ <eq:graph-local-height>]
  In particular the sum of the positive local logarithmic sizes of $\( U_(*) \, q_(*) \)$ is at most $Q_7 \( d \)
    Psi \( h \)$. The new equation and its finite truncations are
  $ F = q + sum_(j gt.eq 0) a^j e_(m + j) \( U \) \, wide F_n = q + sum_(j = 0)^(n - 1) a^j e_(m + j) \( U \) . $
  At the target,
  #[#set math.equation(numbering: n => "(3.13)")
   $ lr(|F_n \( z'_(*) \)|)_v lt.eq lr(|a_(*)|)_v^n exp \( \( m + n + 1 \) b_v \) . $ <eq:shifted-tail>]
  By 8, $V \( I \( W' \) \, a \, q + e_m \)$ has dimension at most $k - 2$.
    For a controlled ideal $frak(b)$ defining $W'$ set-theoretically,
    $V \( frak(b) \, a \, q + e_m \)$ is the same set and has the same dimension.
    Apply 9, with the ratio $r = n \/ L$ to be chosen shortly. At the lifted target its identity becomes
  $ P \( z'_(*) \) = A \( z'_(*) \) F_n \( z'_(*) \) + a_(*)^n B \( z'_(*) \) . $
  Equations (3.1), (3.12), and (3.13), together with the coefficient and membership degree bounds, imply
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_(v in cal(V)) w_v log lr(|P \( z'_(*) \)|)_v lt.eq - n S_(upright("small")) +
     Q_8 \( d \, n \, L \) Psi \( h \) . $ <eq:local-interpolation-value>]
  All positive contributions here are sums of affine coefficient heights, positive local coordinate sizes,
    the $b_v$, and infinite-place triangle-inequality terms. There is no error proportional to the number of
    finite places. At the remaining places evaluate $P$ itself, rather than its membership representation.
    Since $deg P lt.eq L$, (3.11) gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ sum_(v in.not cal(V)) w_v log lr(|P \( z'_(*) \)|)_v lt.eq L Q_5 \( d \) h +
     Q_9 \( d \, n \, L \) Psi \( h \) . $ <eq:outside-interpolation-value>]
  The choices can now be made in the required order. The graph and $m$ have already fixed $Q_5$.
    Choose an integer $r > 2 Q_1 \( d \) \( Q_5 \( d \) + 1 \) + 1$, polynomially bounded in $d$.
    Next choose the polynomially large $L$ supplied by 9, and set $n = r L$.
    If $P \( z'_(*) \) eq.not 0$, its product formula and (3.14)–(3.15) give
  $ 0 lt.eq (- frac(n, Q_1 \( d \)) + L Q_5 \( d \)) h + Q_10 \( d \, n \, L \) Psi \( h \) . $
  The coefficient of $h$ is at most $- L$. As $n \, L$ are now fixed polynomials in $d$,
    this inequality again implies $h lt.eq Q \( d \) Psi \( h \)$ and hence a polynomial height bound.
    Thus, beyond a polynomial threshold chosen #emph[after] $m \, r \, L \, n$, the value $P \( z'_(*) \)$ must be zero.
  Since $P in.not I \( W' \)$, the intersection $W' ∩ V \( P \)$ has dimension at most $k - 1$.
    Project it to the original $\( a \, U \)$-space, take its closure,
    and choose an irreducible component containing $z_(*)$. Such a component exists because $a_(*) eq.not
    0$ and the graph projection is an isomorphism over that open set. Projection cannot increase dimension.
    The degree and arithmetic bounds above preserve the induction hypotheses.
    Discard the graph coordinate $q$; at the next step construct a new graph from the original common equations on
    this smaller variety. Consequently the ambient number of variables stays fixed.
  The dimension drops at every continuing step, so there are at most $dim X$ such steps.
    A zero-dimensional final variety has constant $a$ and is covered by (3.10).
    Taking the maximum of the finitely many polynomial thresholds proves the theorem.
    All component and coefficient field extensions made during the proof extend the selected local data by all
    embeddings, as specified above; they do not alter any smallness sum or introduce a field-degree factor. ◻
]

== 4 Arithmetic coordinates and common local relations <sec:arithmetic>

We construct the algebraic coordinates and common local equations needed for 6.
  The coordinates will have controlled global height and much smaller norms on the center disks.
  A weighted proximity estimate then ensures that one common system of equations retains enough smallness of the
  local parameter. Throughout this section the curve, its finite cover, its algebraic frames,
  and the center are fixed. In particular the conclusions apply after any one fixed auxiliary level cover.
  No condition on the reduction type of the center is imposed.

Write $pi : cal(A) arrow.r S$ for the abelian scheme and put $cal(H) = R^1 pi_(*) Omega_(cal(A) \/ S)^bullet$.
  We use the operator realization of $cal(V) subset "End" \( cal(H) \)$ from 3.
  On actual endomorphisms, $"Tr"$ denotes the trace on first cohomology, so that $"Tr" \( 1 \) = 4$.
  As in (2.2), $⟨u \, v⟩ = 1 / 4 "Tr" \( u v \)$. For an endomorphism $u$, set

$ q_lambda \( u \) = "Tr" \( u u^dagger \) \, $

where $dagger$ is the principal Rosati involution. This is a positive definite integral quadratic form on
  $"End" \( A \)$.

For a number field $F$ containing coordinates under consideration,
  our weights are $w_v = \[ F_v : bb(Q)_v \] \/ \[ F : bb(Q) \]$, with the usual unsquared absolute values.
  Thus $upright(h) #h(-0.16667em) (z) = sum_v w_v log max \( 1 \, ∥z∥_v \)$ for an affine tuple $z$,
  where the norm is the coordinate maximum. The same sums can be written over embeddings into $bb(C)$ or
  $overline(bb(Q))_p$, giving each embedding weight $1 \/ \[ F : bb(Q) \]$.
  If a selected set of embeddings is extended to a larger field, we always take #emph[all] extensions.
  Their weights sum to the old weight. This convention also permits grouping embeddings in a normal closure
  without charging its degree to any estimate.

After omitting finitely many points, fix a rational frame of $cal(V)$ regular at $t_0$,
  affine coordinates $z$ on a neighborhood of $t_0$, and $x in K \( S \)$ with a simple zero at $t_0$.
  The inverse branch through $t_0$ is denoted $z = z \( X \)$, with $z \( 0 \) = z \( t_0 \)$.
  Shrink the neighborhood so that these data and the connection are regular there.
  Choose two independent integral trace-free Rosati-symmetric endomorphisms of $A_(t_0)$ as in 3,
  enlarge $K$ once to define them, and denote their de Rham coordinate pair by $B = \( B_1 \, B_2 \)$.
  For ordered vector pairs $upright(bold(v)) = \( v_1 \, v_2 \)$ and $upright(bold(w)) = \( w_1 \, w_2 \)$,
  write $⟨upright(bold(v)) \, upright(bold(w))⟩ = \( ⟨v_i \, w_j⟩ \)_(i \, j = 1)^2$.
  Put $a = x \( t \) eq.not 0$, $h = max { 2 \, h_H \( t \) }$ for a fixed nonnegative ample logarithmic height on
  $overline(S)$, and $d = max { 2 \, \[ K \( t \) : K \] }$. All constants below depend only on the fixed data.

=== 4.1 Integral endomorphisms and de Rham coordinates <integral-endomorphisms-and-de-rham-coordinates>

#thm([Lemma 4.1.])[
  (Potential good reduction).  #emph[An abelian surface whose geometric endomorphism algebra is a quaternion
    division algebra over $bb(Q)$ has potentially good reduction at every finite place.]
] <lem:potential-good>

#proof[
  Fix a finite place. The semistable reduction theorem #cite(label("BLR1990")) Section 7.4, Theorem 1,
    followed by a further finite extension, gives semistable reduction and defines all geometric endomorphisms.
    They extend to the Néron model and preserve the torus in its connected special fiber.
    If that torus has positive rank $r$, its rational character space is a nonzero unital module,
    on one side or the other, for the division algebra $D = "End"^0 \( A_(overline(K)) \)$.
    Every finite dimensional module over a division algebra is free over it,
    so its rational dimension is a positive multiple of $dim_(bb(Q)) D = 4$. This contradicts $r lt.eq 2$.
    The toric rank is therefore zero, and the semistable model is an abelian scheme.
    The extension used here is local; no uniform bound on its degree is needed for an absolute height computation. ◻
]

#thm([Proposition 4.2.])[
  (Small labeled integral vectors).  #emph[There are constants $c \, C > 0$ with the following property.
    For every target $t$, an extension $L \/ K \( t \)$ of degree at most $C$ defines all geometric endomorphisms
    of $A_t$. There are two independent endomorphisms $u_1 \,
    u_2 in "End"_L \( A_t \)$ which are symmetric and trace free, span $E_t$, and satisfy
#[#set math.equation(numbering: n => "(4.1)")
 $ q_(lambda_t) \( u_j \) lt.eq C \( d h \)^c wide \( j = 1 \, 2 \) . $ <eq:rosati-size>]

 The corresponding labeled vectors are denoted $P = \( P_1 \, P_2 \)$ in de Rham coordinates.
   Conjugating a labeled target always means conjugating these endomorphisms as well.
   This pair need not generate the saturated integral cohomology lattice of $E_t$.]
] <prop:small-vectors>

#proof[
  The Galois action on the geometric endomorphism lattice has finite image in $upright("GL")_r \( bb(Z) \)$,
    with $r lt.eq 16$. Indeed a finite set of lattice generators is defined over a finite extension.
    A finite subgroup of $upright("GL")_r \( bb(Z) \)$ injects into $upright("GL")_r \( upright(bold(F))_3 \)$,
    because the kernel of reduction modulo $3$ is torsion free.
    Its order is consequently bounded in terms of $r$ alone. The fixed field of the kernel gives the asserted $L$.
  For a principally polarized abelian variety of fixed dimension,
    the endomorphism estimate of Masser–Wüstholz gives a rational spanning set of integral endomorphisms whose
    Rosati lengths are bounded by a fixed power of
  $ max { 2 \, \[ L : bb(Q) \] \, h_F \( A_t \) } . $
  Here polynomial dependence on the field degree is essential.
    It is explicit in the Proposition of #cite(label("MW1994")) Section 4,
    with its parameter $m$ equal to the dimension of the abelian variety;
    the alternative involving a smaller image is then zero. Its lattice Lemma 2.1 also gives a basis with the same
    kind of bound. See also #cite(label("DawOrr2022")) Theorem 6.6 and Section 6.7 for the polynomial dependence
    in this application. The theta-height comparison #cite(label("Pazuki2012")) Theorem 1.1 and Corollary 1.3,
    on one fixed theta level, and functoriality of heights on a fixed curve give
  $ h_F \( A_t \) lt.eq C h . $
  The degree of passage to that fixed level is bounded.
  For clarity, the projection to the required plane can be made without target-dependent denominators. The map
  $ u mapsto 4 \( u + u^dagger \) - "Tr" \( u + u^dagger \) 1 $
  preserves integrality, has symmetric trace-free image, and increases the Rosati norm by at most a fixed factor.
    By 3 its rational image has dimension two. Apply this map to the small spanning set and select two independent
    images. This proves (4.1). The norm and trace assertions are unchanged under field conjugacy:
    they are traces of actual endomorphisms and their Rosati adjoints. ◻
]

The next distinction is useful. A rational frame can have large denominators at a moving point,
  even when the endomorphism is integral. Their global cost is linear in $h$.
  On fixed sufficiently small neighborhoods of the center the frames are uniformly controlled,
  and the restricted cost is much smaller.

#thm([Proposition 4.3.])[
  (Coordinate heights and local norms).  #emph[Choose the vectors of 11.
    Their affine coordinates in the fixed frame satisfy
#[#set math.equation(numbering: n => "(4.2)")
 $ upright(h) #h(-0.16667em) (z \( t \) \, a \, P) lt.eq C \( h + log d \) . $ <eq:dr-global>]

 There are center neighborhoods at every place, with a single integral description outside a fixed finite set of
   rational primes, such that for any selected weighted set $cal(V)$ on the actual center branches,
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(v in cal(V)) w_v log max \( 1 \, ∥z \( t \) \, P∥_v \) lt.eq C \( 1 + log h + log d \) . $ <eq:dr-local>]

 These statements hold for the finitely many conjugate fixed charts.
   They also hold after a bounded denominator and a polarized isogeny of any one fixed multiplier are applied to
   the vectors.]
] <prop:dr-size>

#proof[
  #emph[Global finite-place bounds.] We first bound the denominators of integral endomorphisms in the rational
    frame. Potential good reduction supplies an integral de Rham lattice at each target;
    a fixed ideal measures the denominators of the frame and its dual relative to that lattice.
    Pass, for this argument only, to a fixed common cover carrying two coprime fine levels $N_1 \, N_2 gt.eq 3$.
    The integral fine moduli scheme $cal(A)_2 \( N_i \)$ is quasi-projective over $cal(O)_K \[ 1 \/ N_i \]$
    #cite(label("Chai1985")) Chapter I, Theorem 1.4 and Section 1.7.
    Embed it in projective space over this ring, take its scheme-theoretic closure,
    and then take the closure of the graph of the curve map in the product with the fixed projective curve model.
    Denote this proper graph model by $X_i$. Take its projective closure over $cal(O)_K$ when using global model
    heights. The inverse image $U_i$ of the abelian interior carries the integral vector bundle $cal(H)_i$ of
    first de Rham cohomology and its dual. At a prime $p divides.not N_i$, a target acquires good reduction by 10;
    its prime-to-$p$ level extends after a finite local extension. Properness extends the point to $X_i$.
    The good-reduction abelian scheme with prime-to-$p$ level also supplies a valuation-ring point of the abelian
    interior. Its map to the projective closure agrees with the graph map on the generic fiber,
    hence everywhere by separatedness. The moduli image of the extended graph point therefore lies in the abelian
    interior. Consequently the extended point belongs to $U_i$.
  This last assertion concerns the moduli image. The point is allowed to reduce above a boundary point of the
    original curve. Thus we use $U_i$, rather than a preassigned integral open of the curve, to compare lattices.
    The two choices of $i$ cover every residue characteristic.
  Choose a rational frame $e_1 \, dots.h \, e_4$ of $cal(H)$ such that it and its dual $e^1 \, dots.h \,
    e^4$ are regular at $t_0$. Form on $U_i$ the coherent denominator ideals
  $ cal(I)_(+) = { f : f e_j in cal(H)_i upright(" for all ") j } \, wide cal(I)_(-) = { f :
    f e^j in cal(H)_i^or upright(" for all ") j } . $
  These are coherent colon ideals, and extend to coherent ideals on the noetherian projective model $X_i$
    #cite(label("StacksProject")) Lemma 28.23.1(2), Tag 01PE.
    Their product, further multiplied by a denominator ideal for the fixed rational conversion from operator
    entries to our frame of $cal(V)$, gives a fixed ideal $cal(J)_i$.
    Multiplication by $cal(J)_i$ makes all the specified sections integral on $U_i$.
    Remove its finitely many generic zeros from the curve. No duality assertion about arbitrary coherent
    extensions across the boundary is required. For a lifted target over a valuation ring $R$,
    write $cal(J)_i \( t \) R = \( eta \)$ and $Lambda = H_(upright("dR"))^1 \( cal(A)_t \/ R \)$.
    The frame vectors belong to $eta^(- 1) Lambda$ and their duals belong to $eta^(- 1) Lambda^or$.
    An actual integral endomorphism preserves $Lambda$: it extends to the abelian scheme #cite(label("BLR1990"))
    Section 1.2, Proposition 8, and de Rham cohomology is functorial.
    Each of its matrix entries is therefore in $eta^(- 2) R$.
    The extra fixed conversion of coordinates gives, for some fixed integer $b$,
  #[#set math.equation(numbering: n => "(4.4)")
   $ log max \( 1 \, ∥P∥_v \) lt.eq b lambda_(cal(J)_i \, v) \( t \) + c_v quad \( v divides.not N_i \) \,
     $ <eq:pole-ideal>]
  where $c_v = 0$ outside finitely many fixed primes.
  Here is explicitly why the right side has the claimed global cost.
    For a sufficiently ample fixed line bundle $cal(L)$ on $X_i$,
    $cal(J)_i cal(L)^n$ is generated by finitely many fixed sections $s_0 \, dots.h \,
    s_r$ #cite(label("StacksProject")) Proposition 28.27.13(7), Tag 01Q3.
    Choose $s_k$ with $s_k \( t \) eq.not 0$. With the model norm at a finite place,
    $lambda_(cal(J)_i \, v) \( t \) lt.eq - log ∥s_k \( t \)∥_v$.
    The product formula for this nonzero element of the metrized line $cal(L)_t^n$ gives
  $ sum_(v divides.not oo) w_v lambda_(cal(J)_i \, v) \( t \) lt.eq n h_(cal(L)) \( t \) +
    sum_(v divides oo) w_v log ∥s_k \( t \)∥_v lt.eq n h_(cal(L)) \( t \) + C . $
  The last bound uses the bounded sup norms of the finitely many fixed sections on the fixed projective complex
    model. The finite ideal heights are nonnegative, so this also bounds any restricted finite sum,
    such as the sum over $p divides.not N_i$. Every generic projective curve and map used here is fixed,
    so $h_(cal(L)) \( t \) = O \( h \)$. Equation (4.4), summed using the two models,
    bounds all finite denominator contributions by $O \( h \)$,
    independently of the local extension used for good reduction.
  #emph[Global archimedean bounds.] At an archimedean place the Hodge norm of an actual endomorphism is
    $q_(lambda_t)^(1 \/ 2)$, up to a fixed convention. In a rational de Rham frame,
    the norms of the frame and dual have at most a fixed power of the inverse distance to the finitely many
    omitted points, times powers of its logarithm. The algebraic Gauss–Manin connection is regular singular by
    #cite(label("Katz1970")) Theorem 14.1; this property passes to its duals,
    tensor products and subquotients #cite(label("Katz1970")) Proposition 11.3 and Remark 11.3.4.
    After a fixed ramified cover at each puncture, compare its algebraic logarithmic lattice with the canonical
    extension of the variation. Both frames and their inverses differ by meromorphic matrices with finite pole
    orders. Schmid’s norm estimates for the variation and its dual #cite(label("Schmid1973")) Theorems 4.9
    and 6.6$'$ then give the asserted power and logarithmic bounds for the rational frame and its dual.
    The sum of the positive logarithms of these factors is $O \( h \)$ by the local height inequalities for the
    fixed omitted divisor. The contribution of (4.1) is $O \( log h + log d \)$.
    Affine base coordinates and $a$ are fixed rational functions and have height $O \( h \)$. This proves (4.2).
  #emph[Bounds on the center disks.] For (4.3), outside finitely many primes the family, parameter chart, frame,
    and dual are integral near the center, with the frame invertible.
    All integral endomorphism coordinates then have norm at most one on that residue neighborhood.
    At a fixed exceptional prime $p$, extend the local coefficient field once so that the fixed center has good
    reduction and a chosen full $M$-level structure, where $M gt.eq 3$ and $p divides.not M$.
    Adding this level to the original characteristic-zero curve gives a finite étale cover;
    at the chosen lift of the center, the $p$-adic inverse function theorem gives an analytic section over a
    sufficiently small center disk. Every sufficiently close target on the original branch therefore has a lift on
    this section after coefficient extension, including when the original level is divisible by $p$.
    Forgetting the original level maps the lifted disk to the prime-to-$p$ fine moduli scheme.
    On a smaller closed disk its coordinates lie in an integral open about the fixed center and reduce to the same
    special point. An integral de Rham frame on this moduli open pulls back to a frame whose change-of-basis
    matrix with the original frame, and its inverse, are analytic and bounded on the disk.
    Thus both the finite-place comparison cost and the base-coordinate norms are bounded by fixed local constants.
  At infinity choose compact disks within the regular charts; the frame and dual Hodge norms are bounded there.
    Only $O \( log h + log d \)$ remains from the Rosati norm.
    The sum of weights above a fixed rational prime is one, as is the sum of archimedean weights,
    which proves the restricted sum.
  Finally a polarized isogeny of fixed multiplier carries Rosati norms isometrically under conjugation on
    operators. Its inverse introduces only a bounded denominator into an actual endomorphism.
    This changes the finite estimates at finitely many fixed primes by fixed constants, and proves the last assertion. ◻
]

=== 4.2 Horizontal comparison on good-reduction disks <horizontal-comparison-on-good-reduction-disks>

We next express pairings between centered and target endomorphisms in one cohomology space.
  At finite places the common special fiber supplies that space,
  and functorial comparison must apply to each individual endomorphism even when it does not extend over the base
  curve. Let $Y \( X \)$ be the rank-five horizontal transport #emph[back] to the center,
  normalized by $Y \( 0 \) = I$. It is obtained from the corresponding transport on $cal(H)$ by the operator
  construction. Its entries are ordinary-point Taylor series over $K$.

#thm([Proposition 4.4.])[
  (Functorial good-reduction comparison).  #emph[At a finite place,
    suppose a point $t$ is on a sufficiently small actual center branch.
    After coefficient extension the two polarized abelian schemes have a common special fiber $overline(A)$.
    More precisely, over a finite local extension $F$ with residue field $k$, put $F_0 =
    W \( k \) \[ 1 \/ p \]$ and $D = H_(upright("cris"))^1 \( overline(A) \/ W \( k \) \) \[ 1 \/ p \]$.
    There are rational comparison isomorphisms
$ c_u : H_(upright("dR"))^1 \( A_u \/ F \) arrow.r D ⊗_(F_0) F \, wide u = t_0 \, t \, $

 whose transition $c_(t_0)^(- 1) c_t$ is horizontal transport.
   They are compatible with morphisms of either lifted fiber and their specializations,
   including morphisms which do not extend over the base curve. Ramification of the coefficient field is allowed.]
  #emph[In particular, if $beta_i$ and $alpha_j$ are the specializations of the centered and target endomorphisms, then
#[#set math.equation(numbering: n => "(4.5)")
 $ ⟨B_i \, Y \( a \) P_j⟩ = 1 / 4 "Tr" \( beta_i alpha_j \) in bb(Q) wide \( 1 lt.eq i \, j lt.eq 2 \) .
   $ <eq:cross-trace>]

 The cross pairings belong to $1 / 4 bb(Z)$, and their ordinary absolute values are at most $C \( d h \)^c$.
   At archimedean places the same assertions hold with integral Betti transport in place of specialization.]
] <prop:good-comparison>

#proof[
  Work on a smooth integral prime-to-$p$ fine moduli chart $frak(M)$ over a Witt base,
    and let $z$ be the common special point. The relative first crystalline cohomology of the universal abelian
    scheme defines a convergent isocrystal $cal(E)$ on the special fiber of this chart.
    Its value at $z$ is the crystalline cohomology of the actual abelian variety $overline(A)$ over $z$.
    The canonical realization of $cal(E)$ on any smooth proper lifting is its relative de Rham cohomology with
    Gauss–Manin connection; see #cite(label("MaulikPoonen2012")) Theorems 4.16 and 4.26,
    the latter using #cite(label("Ogus1984")) Theorem 3.8.2.
  Here is the common evaluation explicitly. Over the local field $F$ in the statement, put $frak(T) =
    "Spf" cal(O)_F chevron.l Z chevron.r$ and substitute $X = a Z$ into the chosen inverse branch.
    Shrinking the fixed center disks ensures that the resulting chart coordinates belong to $cal(O)_F chevron.l Z
    chevron.r$ and differ from their centered values by elements of $frak(m)_F cal(O)_F chevron.l Z chevron.r$,
    where $frak(m)_F$ is the maximal ideal of $cal(O)_F$. Thus the map to $frak(M)$ reduces constantly to $z$ on
    $\( frak(T) med mod med p \)_(upright("red")) = "Spec" k \[ Z \]$.
    This remains true when $F$ is ramified and $a in.not p cal(O)_F$:
    the image of $frak(m)_F$ in $cal(O)_F \/ p$ is nilpotent.
    Consequently $frak(T)$ is an enlargement of $z$, and the crystal transition for its structural map to the
    point enlargement gives a canonical horizontal identification
  $ cal(E)_(frak(T)) tilde.eq D ⊗_(F_0) cal(O)_(frak(T)) \[ 1 \/ p \] . $
  This is the constant-reduction construction of #cite(label("MaulikPoonen2012")) Definitions 4.10–4.13 and Section 4.7.
  At $Z = 0$ and $Z = 1$, the relative comparison gives precisely the two maps $c_(t_0)$ and $c_t$ of the
    statement. Their compatibility with restriction to a fiber identifies them with the functorial absolute
    crystalline–de Rham comparisons; an explicit absolute statement with arbitrary ramification is
    #cite(label("KubrakPrikhodko2022")) Appendix B, Proposition B.4.
    Proper formal GAGA identifies completed and ordinary de Rham cohomology.
    An endomorphism of either individual fiber extends over its good-reduction abelian scheme and is carried to
    its actual specialization on $overline(A)$. This argument needs only that individual endomorphism,
    without an extension to neighboring fibers. The common fiber is $overline(A)$ itself,
    with the same specialization maps and prime-to-$p$ markings as in smooth proper base change.
    The construction does not introduce an auxiliary isogeny between special fibers.
  The crystal identification is horizontal and is the identity when the two evaluations coincide.
    Therefore $c_(t_0)^(- 1) c_t$ is the identity-normalized horizontal transport,
    and uniqueness for the ordinary differential equation identifies its operator realization with $Y \( a \)$.
    The resulting relative matrix identity is also discussed in #cite(label("PapasI2025")) Theorem 3.4 and Remark 3.6.
  Outside finitely many fixed primes our curve chart and connection are integral; the Taylor comparison converges,
    including over ramified extensions, whenever
  #[#set math.equation(numbering: n => "(4.6)")
   $ - log \| a \|_v > frac(2 log p, p - 1) . $ <eq:factorial-disk>]
  Indeed the divided-power terms have denominators dividing the corresponding factorial.
    At the finitely many other primes, 10 for the fixed center and a prime-to-characteristic moduli chart give the
    same assertion on a fixed smaller disk.
  Functoriality identifies both operator realizations with the operators $beta_i \,
    alpha_j$ on the same crystalline vector space, proving (4.5).
    The characteristic polynomial of an endomorphism of an abelian variety has integral coefficients and is
    independent of the Weil cohomology: it is characterized by the degree polynomial $deg \( n - u \)$
    #cite(label("Milne1986")) Section 12. For the crystalline realization used here,
    the cohomological assertion can be seen directly. Rational crystalline cohomology is a Weil cohomology
    #cite(label("MaulikPoonen2012")) Remark 4.15. Cup product identifies the cohomology of the abelian special
    fiber with the exterior algebra on $H^1$: comparison with its good lift reduces this to the corresponding
    statement for a complex abelian variety. Thus $\[ n \] - u$ acts on top cohomology by
    $det \( n - u divides H^1 \)$; the degree formula identifies that action with $deg \( \[ n \] - u \)$.
    Equality for all sufficiently large integers $n$ identifies the characteristic polynomials,
    and hence their traces. This applies also to $beta_i alpha_j$,
    so its trace is integral and the pairing in (4.5) belongs to $1 / 4 bb(Z)$.
    Specialization preserves the polarization, Rosati involution, and these trace polynomials.
    Positivity of the Rosati form in characteristic $p$ #cite(label("Milne1986")) Theorem 17.3 gives
  $ \| "Tr" \( beta_i alpha_j \) \|^2 lt.eq "Tr" \( beta_i^2 \) "Tr" \( alpha_j^2 \) lt.eq C \( d h \)^c . $
  At infinity parallel transport identifies integral first cohomology lattices,
    so the cross pairing again belongs to $1 / 4 bb(Z)$. On the compact center disk the Hodge norms at the two
    points are uniformly comparable under this transport. Cauchy–Schwarz for the resulting positive norm and (4.1)
    give the same size bound. Notice that the two transported operators need not both be Hodge endomorphisms at
    the center in this last argument. ◻
]

=== 4.3 Smallness on the actual center branches <smallness-on-the-actual-center-branches>

#thm([Lemma 4.5.])[
  (Proximity and the factorial cutoff).  #emph[Use the fixed center disks of Proposition 4.3, Proposition 4.4,
    and at every remaining prime impose (4.6). Let $cal(V)_0 \( t \)$ be all weighted embeddings at which $t$
    belongs to these actual branches. Then
#[#set math.equation(numbering: n => "(4.7)")
 $ sum_(v in cal(V)_0 \( t \)) w_v log \( 1 \/ \| a \|_v \) gt.eq c h - C #scale(x: 120%, y: 120%)[\(] 1 +
   log^2 \( d h \) #scale(x: 120%, y: 120%)[\)] . $ <eq:proximity-sum>]

 In particular the sum is at least $c h \/ 2$ if $h gt.eq Q_0 \( d \)$ for a fixed polynomial $Q_0$.]
] <lem:proximity>

#proof[
  Use the effective divisor $D_0 = \[ t_0 \]$ on the smooth completion $overline(S)$.
    Since it has positive degree, some fixed multiple of $D_0$ minus the ample divisor defining $h$ is ample.
    The height of an ample divisor is bounded below, and hence
  $ h_(D_0) \( t \) gt.eq c h - C . $
  Take local Weil functions for this divisor. On the actual branch through $t_0$ they equal $-
    log \| x \( t \) \|_v$ up to fixed bounded errors. Outside the chosen branch neighborhoods their positive
    contributions are bounded; the error is zero at all but finitely many primes.
    At an unexceptional prime the integral parameter chart is étale at the center,
    so the branch is precisely the Henselian inverse branch with that reduction.
    Other zeros of the rational function $x$ are not counted.
    Before the factorial cutoff, the weighted proximity sum is therefore at least $c h - C$.
  Here is a uniform bound for the loss caused by that cutoff.
    Put $D = \[ K \( a \) : bb(Q) \] lt.eq C d$ and $H = upright(h) #h(-0.16667em) (a) lt.eq C h$.
    If a rational prime $p$ has any place where $\| a \|_v < 1$,
    it contributes at least $\( log p \) \/ D$ to $upright(h) #h(-0.16667em) (a^(- 1)) = H$:
    writing a local valuation in integral units cancels its ramification index against the absolute weight.
    For the set $cal(P) \( a \)$ of these primes,
  #[#set math.equation(numbering: n => "(4.8)")
   $ sum_(p in cal(P) \( a \)) log p lt.eq D H \, wide \# cal(P) \( a \) lt.eq D H \/ log 2 . $ <eq:prime-support>]
  Write $alpha_p = log p \/ \( p - 1 \)$. At places over $p$ discarded by (4.6),
    the total weighted loss is at most $2 alpha_p$, since their weights sum to at most one. For any set of $N$ primes,
  $ sum alpha_p lt.eq C sum_(k = 1)^N frac(log \( k + 1 \), k) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 +
    log^2 \( N + 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Here $log x \/ \( x - 1 \)$ decreases for $x > 1$, and the $k$th smallest prime is at least $k + 1$.
    Apply this with (4.8). Restricting the finitely many exceptional and archimedean disks costs only a fixed
    further constant. This proves (4.7); its last assertion follows by elementary absorption of the logarithmic
    term for $h gt.eq Q_0 \( d \)$. ◻
]

=== 4.4 Grouping the equations <grouping-the-equations>

Include in the fixed exceptional set all denominator primes of the centered vectors and the trace pairing,
  in all fixed conjugate charts. At infinity and at the finitely many exceptional primes,
  only $O \( d \)$ embeddings of the labeled field occur, so we can keep the rational cross-trace matrix as a
  coefficient of each group’s equations. The number of remaining primes can grow with the target.
  There we compare a trace equation with its image under a lift of residue Frobenius.
  The rational trace is fixed, so subtraction eliminates it;
  only $O \( d \)$ conjugates of the complete labeled tuple can occur.
  Retaining the labels also records Frobenius’s action on the actual endomorphisms, as needed in 5.

#thm([Proposition 4.6.])[
  (Common relations with controlled coefficients).  #emph[Suppose $h gt.eq Q_0 \( d \)$,
    increasing $Q_0$ if necessary. The proximity embeddings can be partitioned into at most $Q_1 \( d \)$ groups,
    and one group $cal(V)$ has
#[#set math.equation(numbering: n => "(4.9)")
 $ S_(upright("small")) = sum_(v in cal(V)) w_v log \( 1 \/ \| a \|_v \) gt.eq
   h \/ Q_2 \( d \) . $ <eq:group-smallness>]

 On each group there is one fixed list of analytic equations, evaluated at one algebraic tuple $\( a \, U \)$,
   of one of the following forms:
#[#set math.equation(numbering: n => "(4.10)")
 $ ⟨B \, Y \( a \) P⟩ & = T \, &  & upright("with ") T in upright(M)_2 \( bb(Q) \) \,\
⟨B \, Y \( a \) P⟩ & = ⟨B' \, Y' \( a R \) P'⟩ \, &  & R = b \/ a \, quad b = x' \( t' \) \, $ <eq:constant-relations>]

 together with the actual branch equations
#[#set math.equation(numbering: n => "(4.11)")
 $ z - z \( a \) = 0 \, wide z' - z' \( a R \) = 0 quad upright("when a second chart is present") .
   $ <eq:chart-relations>]

 The primed data are one simultaneous field conjugate of the complete labeled unprimed data.
   In (4.10) all places are finite and $\| R \|_v = 1$ on the group.
   The Frobenius of the common reduction transports each of the two labeled pairs to its primed pair.]
  #emph[The tuple has degree at most $Q_3 \( d \)$ over $K$, and
#[#set math.equation(numbering: n => "(4.12)")
 $ upright(h) #h(-0.16667em) (a \, U) lt.eq Q_3 \( d \) h \, wide
   sum_(v in cal(V)) w_v log max \( 1 \, ∥U∥_v \) lt.eq Q_3 \( d \) \( 1 + log h \) . $ <eq:common-size>]

 Writing the common list as $E \( a \, U \) = sum_(j gt.eq 0) a^j e_j \( U \)$, it has fixed length and
#[#set math.equation(numbering: n => "(4.13)")
 $ deg e_j & lt.eq C \( 1 + j \) &  & \( j gt.eq 0 \) \,\
upright(h) #h(-0.16667em) (upright("affine coefficient tuple of ") \( e_0 \, dots.h \, e_l \)) & lt.eq
  Q_4 \( l \, d \) \( 1 + log h \) &  & \( l gt.eq 0 \) . $ <eq:coefficient-size>]

 There are $b_v gt.eq 0$ with
#[#set math.equation(numbering: n => "(4.14)")
 $ ∥sum_(j gt.eq l) a^j e_j \( U \)∥_v & lt.eq \| a \|_v^l exp #scale(x: 120%, y: 120%)[\(] \( 1 + l \) b_v
   #scale(x: 120%, y: 120%)[\)] &  & \( l gt.eq 0 \) \,\
sum_(v in cal(V)) w_v b_v & lt.eq Q_5 \( d \) \( 1 + log^2 h \) . $ <eq:arithmetic-tail>]

 The series are formed from fixed ordinary-point algebraic connection systems in $a$ and $a R$,
   and fixed algebraic chart series, by polynomial operations of fixed degree.]
] <prop:common-relations>

#proof[
  First choose a field $L$ defining the complete labeled tuple:
    the point, its two endomorphisms, and the fixed curve, center, and frames. By 11, $\[ L : bb(Q) \] lt.eq C d$.
    Let $M$ be a normal closure. We do not bound $\[ M : bb(Q) \]$.
    Compute weights by extending every selected embedding to #emph[all] embeddings of $M$;
    every old weighted sum is preserved.
  At infinity or a fixed exceptional prime, the four entries of the cross trace are the rational constants of 13.
    At any one such place type, an embedding of the labeled field $L$ into its local algebraic closure determines
    the Taylor evaluation and the constant. There are at most $\[ L : bb(Q) \]$ possibilities.
    Group by these embeddings, by the finitely many fixed charts, and then by the constant matrix.
    This gives $O \( d \)$ groups of the form (4.10), with $upright(h) #h(-0.16667em) (T) lt.eq
    C \( 1 + log d + log h \)$. We count the constants actually obtained from these embeddings;
    we do not count all rational matrices of that height.
  At an unexceptional prime $p$, for each embedding $rho : M arrow.r.hook overline(bb(Q))_p$,
    choose $sigma in "Gal" \( overline(bb(Q))_p \/ bb(Q)_p \)$ inducing the $p$th-power automorphism of
    $overline(upright(bold(F)))_p$. Apply $sigma$ to (4.5). The trace on the right is rational,
    and is fixed by $sigma$. Thus
  $ ⟨rho B \, Y^rho \( rho a \) rho P⟩ = ⟨sigma rho B \, Y^(sigma rho) \( sigma rho a \) sigma rho P⟩ . $
  On $L$, the embedding $sigma rho$ equals $rho tau$ for one of the at most $\[ L : bb(Q) \]$ embeddings $tau :
    L arrow.r M$. Partition by $tau$ and the fixed conjugate charts.
    Define $\( B' \, P' \, t' \, b \) = tau \( B \, P \, t \, a \)$ in this group.
    This gives the same analytic equation (4.10) at every embedding of the group.
    The compositum $L tau \( L \)$ has degree at most $\[ L : bb(Q) \]^2$,
    so the field defining the coordinates of this equation has polynomial degree even though $M$ need not.
  A local automorphism preserves the absolute value, whence $\| b \|_v = \| a \|_v$ and $\| R \|_v = 1$.
    Globally $upright(h) #h(-0.16667em) (R) lt.eq upright(h) #h(-0.16667em) (a) +
    upright(h) #h(-0.16667em) (b) lt.eq C h$. On the common special fiber, relative Frobenius $F :
    overline(A) arrow.r overline(A)^(\( p \))$ satisfies $F alpha =
    alpha^(\( p \)) F$ for every endomorphism $alpha$, and similarly for the centered endomorphisms.
    Thus conjugation by $F$, which is the normalized isometry on the operator system,
    carries each labeled vector to its primed vector. This records an identity of actual specialized
    endomorphisms, in addition to the de Rham equation. No restriction on the Newton polygon has been used.
  For the local sums retain the selected embeddings of $M$ with their absolute weights.
    If a later algebraic operation introduces another coefficient field $F'$,
    work over $M F'$ and take all extensions of those selected embeddings.
    The common equation, the equality $\| R \|_v = 1$, and the local norm bounds are preserved by restriction of
    absolute values, and the new weights sum to the old ones.
    This step requires no new choice of a Frobenius lift. Thus the field indexing the selected embeddings can be
    large, while the field defining the algebraic tuple has polynomial degree.
    The degree of the normal closure never enters the coordinate-degree, height, or grouping estimates.
  There are in total polynomially many groups. Apply 14 and select one to obtain (4.9).
    Put the ordinary coordinates $z \, P$ and, where present, $z' \, P' \, R$ in $U$.
    The constants $B \, B'$ belong to fixed data; $T$ is a coefficient of the equation, not an extra variable.
    Equations (4.11) require the base coordinates to be those of the selected inverse branches.
    Their inclusion keeps the number of variables and equations fixed and prevents another sheet of the rational
    parameter from being treated as the chosen germ. Equation (4.12) follows from 12, its conjugate version,
    and the local and global bounds for $R$.
  #emph[Coefficient heights.] It remains to bound the common series, uniformly across its selected places.
    Outside the fixed exceptional set, the algebraic chart series and the connection matrix in that chart have
    integral Taylor coefficients. If $Z \( X \) = sum Z_j X^j$ is an identity-normalized horizontal matrix with
    integral ordinary connection matrix, its recursion shows inductively that
  $ Z_j in \( j ! \)^(- 1) upright(M)_r \( cal(O)_v \) . $
  For example $\( j + 1 \) Z_(j + 1)$ is a sum of $Z_k$ times integral connection coefficients for $k lt.eq j$,
    and $j ! \/ k !$ is integral. The same holds for inverse horizontal matrices and the fixed rank-five system.
    Hence $∥Z_j∥_v lt.eq exp \( j alpha_p \)$ at a good prime.
    Integral algebraic chart series satisfy the stronger bound $∥z_j∥_v lt.eq 1$.
  At every fixed exceptional finite place the implicit function theorem gives a positive radius of convergence for
    each algebraic chart series; its coefficients and those of the connection are bounded by $c_v^(j + 1)$ for a
    fixed $c_v gt.eq 1$. The same recursion then bounds a horizontal coefficient by $c_v^j \| 1 \/ j ! \|_v$,
    after increasing $c_v$. At infinity the ordinary analytic solution and the chart series have fixed positive
    convergence radii, so their coefficients grow at most exponentially.
    Since only finitely many $c_v$ differ from one, summing these bounds and using $sum_p v_p \( j ! \) log p =
    log \( j ! \)$ gives, for example,
  $ upright(h) #h(-0.16667em) (Z_0 \, dots.h \, Z_j \, z_0 \, dots.h \, z_j) lt.eq C \( j + 1 \) log \( j + 2 \) . $
  Only this polynomial estimate for logarithmic heights is needed.
    In the second series $b = a R$, the coefficient of $a^j$ has an additional factor $R^j$,
    explaining the linear degree bound. The remaining coefficients are fixed algebraic coefficients,
    together with the four rational constants $T$ in the constant case.
    Their affine heights, including scale, have just been bounded.
    Polynomial operations of fixed degree and concatenation through order $l$ preserve a polynomial height bound.
    This proves (4.13) for the complete coefficient tuple.
  #emph[Local tails.] At an unexceptional finite place put $M_v = max \( 1 \, ∥U∥_v \)$.
    The ultrametric inequality and $\| R \|_v = 1$ give, for a fixed integer $b$ and every $l$,
  $ ∥sum_(j gt.eq l) a^j e_j \( U \)∥_v lt.eq M_v^b \| a \|_v^l exp \( l alpha_p \) . $
  For $l = 0$ the tail is the entire common relation and vanishes at the target.
    For $l gt.eq 1$ the constant matrix $T$ does not occur in the tail.
    The displayed inequality follows by taking the maximum over $j gt.eq l$; (4.6) makes those bounds decrease.
    There is no multiplicative constant greater than one at every prime.
    Fixed products or tensor expressions satisfy the same estimate after increasing $b$ and the fixed coefficient
    bounds, because the total Taylor index controls the factorial bound.
  At the finitely many exceptional places and at infinity, choose the disks strictly inside a fixed convergence
    disk. Cauchy estimates, or the local differential recursion,
    then give the same tail estimate with $alpha_p$ replaced by a fixed constant;
    at infinity the geometric-series sum contributes one fixed further constant. Consequently one may take
  $ b_v lt.eq C log M_v + C alpha_p $
  at the unexceptional primes, with fixed additional constants at the other places.
    The contribution of $alpha_p$ over all selected primes is $O \( 1 + log^2 \( d h \) \)$ by (4.8) and the
    calculation in 14. Summing and using (4.12) proves (4.14)–(4.14).
    All operations used involve a fixed number of fixed ordinary systems and their fixed tensor constructions,
    as asserted. ◻
]

The equations in 15 provide common arithmetic relations, including at primes where the reduction is supersingular.
  Their nonidentity on the algebraic varieties encountered by interpolation is a separate requirement,
  addressed in the next section.

== 5 Auxiliary markings and the height bound <sec:height>

We prove the nonidentity required by 6 for the common relations of 15, and then deduce the height bound.
  Single and product monodromy handle the constant relations and the paired relations away from the finitely many
  dominating isogeny correspondences. The remaining case requires one auxiliary level.

Here is the role of that level. At a common reduction, Rosati positivity makes the rational span of the centered
  and target endomorphism planes nondegenerate. We arrange that the sum of their $bb(Z)_ell$-lattices is
  nevertheless saturated of rank four, with degenerate reduction modulo a fixed prime $ell$.
  A functional identity would force the composite of relative Frobenius with the inverse of a multiplier-$m$
  isogeny to act by conjugation as one common sign on the rational span.
  The positive sign forces a rational scalar, incompatible with its multiplier $p \/ m$,
  where $p$ is the residue characteristic and $m$ is a fixed correspondence multiplier prime to $p$.
  The negative sign makes the rank-four lattice an orthogonal eigensummand of a unimodular lattice,
  whose reduction modulo $ell$ must be nondegenerate. Thus either sign gives a contradiction.
  The marking imposes no restriction on the quaternion algebra of the target.

=== 5.1 A finite-field incidence <a-finite-field-incidence>

The required marking comes from the following incidence statement.
  Its acting element must lift to the spin group because symplectic level markings act on the quadratic system
  through $"Sp"_4 arrow.r "SO"_5$.

#thm([Lemma 5.1.])[
  #emph[Let $k$ be a finite field of odd characteristic, let $\( V \, q \)$ be a nondegenerate quadratic space of
    dimension five, let $A subset V$ be a nondegenerate $2$-plane, and let $T subset V$ be any $2$-plane.
    There is an element
$ u in "im" #scale(x: 120%, y: 120%)[\(] "Spin" \( V \) \( k \) arrow.r
  "SO" \( V \) \( k \) #scale(x: 120%, y: 120%)[\)] $

 such that $A ∩ u T = 0$ and $A + u T$ is a degenerate $4$-plane, with radical of dimension one.
   The conclusion includes restricted quadratic forms on $T$ of ranks zero, one, and two.]
] <lem:finite-field-incidence>

#proof[
  Write $b \( v \, w \) = q \( v + w \) - q \( v \) - q \( w \)$.
    The nondegenerate ternary space $A^perp$ is isotropic over $k$, so it has a decomposition
  $ A^perp = chevron.l e \, f chevron.r perp chevron.l c chevron.r \, wide q \( e \) = q \( f \) = 0 \, quad
    b \( e \, f \) = 1 \, quad q \( c \) = delta eq.not 0 . $
  Here and below angle brackets around vectors mean their linear span. For any $v \, w in A$, the plane
  $ T_(*) = chevron.l e + v \, c + w chevron.r $
  is disjoint from $A$, and $A + T_(*) = e^perp$. This hyperplane has radical $k e$.
    We can arrange that $T_(*)$ and $T$ have isometric restricted forms.
    A nondegenerate binary form over $k$ represents every nonzero scalar:
    in the split case use the form $x y$, and in the anisotropic case use surjectivity of the norm $k_2^times
    arrow.r k^times$. The value zero is represented by the zero vector. Consequently the following choices are possible:
  + If $q \|_T = 0$, take $v = 0$ and $q \( w \) = - delta$.
  + If $q \|_T$ has rank one, write it as $"diag" \( 0 \, beta \)$ with $beta eq.not 0$, take $v = 0$,
    and choose $q \( w \) = beta - delta$.
  + If $q \|_T$ has rank two, choose a vector of norm $delta$ in $T$ and an orthogonal complement of norm $alpha
    eq.not 0$. Take $q \( v \) = alpha$ and $w = 0$. Then $q \|_(T_(*)) = "diag" \( alpha \, delta \)$.
  Witt extension, which applies also to isometries between degenerate subspaces of a nondegenerate space in
    characteristic different from two #cite(label("EKM2008")) Theorem 8.3, extends the chosen isometry $T arrow.r
    T_(*)$ to an element of $"O" \( V \) \( k \)$. If its determinant is $- 1$,
    compose it with reflection in an anisotropic vector of $T_(*)^perp$. Such a vector exists:
    a three-dimensional subspace of a nondegenerate five-dimensional space cannot be totally isotropic.
    The reflection fixes $T_(*)$ pointwise. We have therefore obtained $u_0 in "SO" \( V \) \( k \)$ with $u_0 T =
    T_(*)$.
  It remains to correct the spinor norm. The setwise stabilizer of every $2$-plane $E$ in $"SO" \( V \) \( k \)$
    has surjective spinor norm. To see this, choose a hyperbolic plane $chevron.l r \, s chevron.r$,
    normalized by $b \( r \, s \) = 1$, and consider
  $ h_z \( r \) = z r \, wide h_z \( s \) = z^(- 1) s \, wide h_z \|_(chevron.l r \, s chevron.r^perp) =
    1 quad \( z in k^times \) . $
  If $R_v$ denotes reflection in $v$, then $h_z = R_(r + s) R_(r + z s)$,
    so its spinor norm is $z$ modulo squares. When $E$ is nondegenerate,
    take this hyperbolic plane inside the nondegenerate ternary space $E^perp$; then $h_z$ fixes $E$ pointwise.
    When $E$ is degenerate, write $E = chevron.l r \, a chevron.r$ with $0 eq.not r in "rad" \( E \)$.
    Choose $s_0$ with $b \( r \, s_0 \) = 1$ and $b \( a \, s_0 \) = 0$, and put $s = s_0 - q \( s_0 \) r$.
    Then $q \( s \) = 0$ and $a perp chevron.l r \, s chevron.r$, so $h_z$ preserves $E$ setwise.
    This also treats the totally isotropic case.
  Apply the preceding construction to $E = T_(*)$, choosing the spinor norm of $h_z$ to be the inverse of that of
    $u_0$. The element $u = h_z u_0$ still maps $T$ to $T_(*)$ and has trivial spinor norm.
    To see the lifting assertion directly, write an orthogonal transformation of determinant one as an even
    product of reflections #cite(label("SchulzePillot2020")) Theorem 1.32.
    The corresponding product in the Clifford algebra has Clifford norm equal to the product of their quadratic
    norms. If this product is a square $c^2$, rescaling the Clifford element by $c^(- 1)$ gives a norm-one
    element, hence an element of $"Spin" \( V \) \( k \)$ with the same orthogonal action
    #cite(label("SchulzePillot2020")) Corollary 9.6 and Definition 9.7.
    Conversely a spin lift has trivial spinor norm. Thus $u$ has the required lift.
    In dimension five over $k$, this spin group is the split group $"Sp"_4$. ◻
]

=== 5.2 Fixing the level and the exceptional primes <fixing-the-level-and-the-exceptional-primes>

We first specify the order of the fixed choices. Apply 2 to obtain a smooth connected fine-level curve $S_(*)$ and
  its family. If the quaternionic-division locus is finite,
  both the finiteness assertion and the height bound below hold after choosing constants.
  We therefore assume in the construction that the locus is infinite,
  and choose $t_(0 \, *)$ away from the finite omissions. Fix its labeled endomorphism pair and all the conjugates
  of these data. Apply 5 to the finite list of underlying image curves.
  Choose integral representatives of the resulting rational similitudes and let $cal(M)$ be their finite set of
  positive polarized multipliers. This step precedes the auxiliary level:
  passing to that level does not enlarge the list of multipliers required for the underlying image curves.

For a rational endomorphism plane $E_t$, let

$ L_t = E_t ∩ Lambda_t $

be its saturated lattice in the integral quadratic local system of 3.
  The integral lattice is understood with the fixed finite set of bad denominator primes removed.
  Saturation implies that $L_t \/ ell L_t$ is a $2$-plane in $Lambda_t \/ ell
  Lambda_t$ at every remaining prime $ell$. This holds even when its quadratic form becomes degenerate.
  The small generating pair from 11 need not be a basis of $L_t$ and will not be used to define its reduction.

#thm([Proposition 5.2.])[
  #emph[There is a fixed odd prime $ell$ and a fixed geometrically connected finite étale cover $S arrow.r
    S_(*)$ parameterizing symplectic markings at level $ell$, with a fixed lift $t_0$ of $t_(0 \, *)$,
    such that every quaternionic-division point of $S_(*)$ outside a finite set has a lift $t in
    S$ satisfying the following condition. In the common quadratic space supplied by the markings,
#[#set math.equation(numbering: n => "(5.1)")
 $ dim #scale(x: 120%, y: 120%)[\(] overline(L)_(t_0) + overline(L)_t #scale(x: 120%, y: 120%)[\)] = 4 \, wide
   q \|_(overline(L)_(t_0) + overline(L)_t) upright(" is degenerate") . $ <eq:marked-incidence>]

 The prime $ell$ is prime to every $m in cal(M)$. At every prime $p eq.not
   ell$ of good reduction for these fixed models where $t$ and $t_0$ have the same marked reduction,
   the corresponding two saturated $bb(Z)_ell$-lattices have sum $M$ satisfying
#[#set math.equation(numbering: n => "(5.2)")
 $ M = Lambda_ell ∩ \( M ⊗_(bb(Z)_ell) bb(Q)_ell \) \, wide "rank" M = 4 \, wide
   M \/ ell M upright(" is degenerate") . $ <eq:primitive-four-lattice>]

 These assertions are preserved by simultaneous field conjugation.]
] <prop:marking>

#proof[
  The geometric monodromy subgroup in $"Sp"_4 \( bb(Z) \)$ is finitely generated,
    because $S_(*)^(upright("an"))$ has finitely generated fundamental group, and is Zariski dense by 4.
    Strong approximation for a finitely generated Zariski-dense subgroup of a simply connected absolutely almost
    simple group gives surjectivity onto $"Sp"_4 \( bb(F)_ell \)$ for all sufficiently large primes $ell$
    #cite(label("MVW1984")) Theorem, p. 515. Choose such an $ell$, avoiding $2$,
    the discriminant of the ambient quadratic lattice, the discriminant of $L_(t_(0 \, *))$,
    and every multiplier in $cal(M)$. After a fixed extension containing the relevant root of unity,
    full symplectic markings with the prescribed pairing form a torsor under $"Sp"_4 \( bb(F)_ell \)$.
    Surjective geometric monodromy says exactly that its pullback to $S_(*)$ is geometrically connected.
  Fix a marking above $t_(0 \, *)$. Its plane is nondegenerate modulo $ell$.
    For any target, its saturated plane still has dimension two modulo $ell$,
    and 16 supplies a change of marking in the image of $"Sp"_4 \( bb(F)_ell \)$ giving (5.1).
    All markings occur on the same cover $S$. Deleting finitely many points to choose frames and affine charts
    excludes only finitely many points downstairs. In particular,
    $ell$ has not been chosen to avoid the discriminants of the varying target planes.
  At a common marked reduction, smooth proper base change identifies each integral $ell$-adic cohomology lattice
    with that of the common reduction. The mod-$ell$ identifications agree with the markings.
    Take $bb(Z)_ell$-bases of the two saturated planes. Their four reductions are independent by (5.1),
    so some $4$-row minor of their coordinate matrix is an $ell$-adic unit.
    These four vectors extend to a basis of $Lambda_ell$; their sum $M$ is a direct summand,
    and therefore satisfies the saturation equality in (5.2).
    Its reduction is precisely the degenerate space in (5.1).
    This proves local saturation at $ell$; no global saturation assertion about the sum of integral lattices is
    needed. Simultaneous conjugation carries both markings, both lattices,
    and their common pairing to the conjugate data, preserving independence and degeneracy. ◻
]

We have now fixed the incidence condition and its integral consequence.
  Enlarge the fixed field $K$ for the cover, the chosen lift $t_0$, and its labeled pair,
  and use the notation of 4 on $S$. Before grouping proximity places, we make one further finite exclusion:
  every isogeny of an allowed multiplier between the reduced centers must lift to one of finitely many
  characteristic-zero isogenies between them. The next lemma provides this assertion for the maps themselves.

#thm([Lemma 5.3.])[
  #emph[Fix finitely many pairs of principally polarized abelian surfaces over a number field and finitely many
    positive integers $m$. Outside a fixed finite set of rational primes,
    every polarized isogeny of multiplier $m$ between the geometric reductions of a fixed pair is the
    specialization of a characteristic-zero polarized isogeny of that multiplier between the pair.
    The set of these characteristic-zero maps is finite. The assertion concerns the maps themselves,
    and holds for supersingular reductions as well.]
] <lem:fixed-isogeny-reduction>

#proof[
  It suffices to treat one pair $\( A_0 \, lambda_0 \)$, $\( A'_0 \, lambda'_0 \)$ and one $m$.
    Choose models over a localization of the ring of integers, with good reduction and with $m$ invertible.
    A polarized isogeny $phi$ with $phi^(*) lambda'_0 = m lambda_0$ has degree $m^2$ and kernel contained in
    $A_0 \[ m \]$. After a fixed finite extension and localization,
    all subgroup schemes of this fixed order and the required isotropic type in $A_0 \[ m \]$ are the spreads of
    the finitely many characteristic-zero ones. Indeed $A_0 \[ m \]$ is finite étale,
    and after splitting it these are subgroups of one fixed finite group.
  Each possible kernel gives a fixed polarized quotient $\( D \, lambda_D \)$,
    with the quotient map pulling $lambda_D$ back to $m lambda_0$.
    The remaining data are polarized isomorphisms $\( D \, lambda_D \) tilde.eq \( A'_0 \, lambda'_0 \)$.
    Here isomorphisms are group isomorphisms of abelian schemes,
    preserving the zero section and the polarizations. Their scheme is unramified by rigidity and is of finite
    type: for relatively ample line bundles representing the polarizations,
    the restriction of their product to such a graph is numerically twice the source line bundle,
    and hence has a fixed Hilbert polynomial. Thus these graphs lie in one relative Hilbert scheme.
    The fibers of the polarized-isomorphism scheme are torsors under the finite polarized group-automorphism
    groups #cite(label("Milne1986")) Proposition 17.5, so the scheme is quasi-finite.
  A quasi-finite scheme of finite type over a ring of integers, with finite generic fiber,
    becomes the spread of that generic fiber after deleting finitely many primes.
    For completeness, discard its finitely many vertical irreducible components;
    its finitely many generic points then spread to a finite scheme after localization,
    and deleting the support of the remaining complement gives the assertion.
    Further localization makes this scheme finite étale. After a fixed extension splitting its generic fiber,
    this finite étale scheme is a disjoint union of sections:
    each component has generic degree one over the normal base.
    Its geometric points are therefore exactly the specializations of the fixed characteristic-zero maps,
    including every polarized-automorphism choice. Applying this to the finite list of kernels proves the lemma. ◻
]

Include the primes excluded by 18, those dividing the elements of $cal(M)$,
  and $ell$ in the fixed exceptional set of 15. Here the center pairs are the finitely many pairs of conjugates of
  $t_0$. The possible center isogenies are now fixed algebraic data.
  Take the full finite list of these maps between every ordered pair of absolute conjugates of the center;
  the list is stable under simultaneous absolute Galois conjugation. Enlarging $K$ once more defines all of them.
  This enlargement adds no geometric center to the list, since the absolute conjugates were included already.
  The local Frobenius lift in 15 need not fix $K$: it permutes the conjugate centers and maps in this fixed list.
  At an embedding $rho$ of the labeled coefficient field, a selected specialized center map is $rho \( phi_0 \)$
  for a member $phi_0$ of that list. Subdividing by this member makes the algebraic choice common to the selected
  embeddings. Upon any further coefficient-field extension we retain all extensions of each selected embedding,
  so the map and its specialization remain compatible and the total weights are unchanged.
  A chosen multiplier-$m$ isogeny between target fibers also requires only a bounded relative field extension.
  Its kernel is one of a uniformly bounded number of subgroups of the fixed-size group $A_t \[ m \]$,
  and the polarized identifications form a torsor under a finite automorphism group of bounded order in dimension
  two. For the latter bound, such a group acts faithfully on the rank-four integral Betti lattice,
  and finite subgroups of $"GL"_4 \( bb(Z) \)$ have bounded order.
  Thus these choices preserve all polynomial degree bounds in 4.

=== 5.3 Nonidentity on every branch <nonidentity-on-every-branch>

We use three lists of equations. Constant relations will be excluded by single monodromy,
  and paired relations outside the finite correspondence locus by product monodromy.
  On that locus we first convert the paired relation to one involving a single transport matrix;
  the marking will then exclude an identity.

The notation $B = \( B_1 \, B_2 \)$ and $P = \( P_1 \, P_2 \)$ means the labeled centered and target pairs,
  and $Y \( a \)$ transports back to the center. We retain all four entries of each matrix equation:
  in the exceptional case they will force the same sign on both entire planes.
  In every case include the algebraic chart equations from 15:
  if $z$ denotes affine coordinates on $S$ and $z = zeta \( a \)$ is the actual inverse germ of the chosen
  parameter, include $z - zeta \( a \) = 0$. For a second argument include $z' - zeta' \( a R \) = 0$.
  The ambient algebraic conditions put $z \, z'$ on the respective curves and impose $a = x \( z \)$ and $a R =
  x' \( z' \)$ when appropriate. Only fixed denominators needed for these affine charts are cleared.

The first list, used at archimedean or fixed exceptional places, is

#[#set math.equation(numbering: n => "(5.3)")
 $ ⟨B \, Y \( a \) P⟩ = c \, $ <eq:constant-system>]

where the $2$-by-$2$ rational matrix $c$ is common to the chosen group. The second list is

#[#set math.equation(numbering: n => "(5.4)")
 $ ⟨B \, Y \( a \) P⟩ = ⟨B' \, Y' \( a R \) P'⟩ . $ <eq:paired-system>]

It is used when the target pair of image points is outside all the finitely many dominating isogeny
  correspondences of 5.

For the third list the target pair belongs to one of those correspondences.
  We transport its primed vectors to the unprimed fiber using an isogeny, and do the same at the centers.
  To compare these two operations, their isogenies must have the same specialization.
  Choose a polarized isogeny $phi_s$ of multiplier $m in cal(M)$ between the targets,
  and write $I_s$ for its normalized isometry on the quadratic systems.
  First adjoin its field of definition to the paired target field and extend every already selected embedding by
  all its extensions. This costs only a bounded relative degree and preserves every weighted local sum.
  The previously chosen Frobenius identities restrict to the original labeled tuples,
  so remain true under these extensions without a new choice of Frobenius lift.
  At a place of this expanded group the unprimed center and target reduce to the same marked point $r$ of the good
  fine model, and hence to the same universal fiber $A_r$. The chosen local automorphism has residue action
  $"Frob"_p$, so the primed center and target both reduce to $r^(\( p \))$ and to $A_r^(\( p \))$.
  These are the conjugate identifications of the same source fiber, not independently chosen isomorphisms.
  The target isogeny extends between the good abelian models;
  its specialization is an actual multiplier-$m$ map $A_r arrow.r A_r^(\( p \))$.
  By 18 this map is the specialization of one fixed center isogeny $phi_0$, with normalized isometry $I_0$.
  Only now subdivide the expanded embedding set by this finite choice from the conjugate-stable list of actual
  maps, including each map’s polarized quotient identification.

The center and target comparison maps now identify both isogenies with the same specialized map.
  Functoriality in 13 therefore gives, at this target,

#[#set math.equation(numbering: n => "(5.5)")
 $ I_0 Y \( a \) = Y' \( a R \) I_s . $ <eq:isogeny-transport>]

Put $D_i = I_0^(- 1) B'_i$ and $hat(P)_j = I_s^(- 1) P'_j$ at the target. The third list is the single-argument system

#[#set math.equation(numbering: n => "(5.6)")
 $ ⟨B \, Y \( a \) P⟩ = ⟨D \, Y \( a \) hat(P)⟩ . $ <eq:exceptional-system>]

In this system $D$ is fixed and $hat(P)$ is an additional pair of vector coordinates in the unprimed frame;
  the second argument can be dropped. Its target value is the realization of actual rational endomorphisms,
  with denominators bounded in terms of $m$ and with the same Rosati norm bounds as $P'$.
  More explicitly, if $hat(alpha) = phi_s^(- 1) alpha' phi_s$, then $m hat(alpha) =
  phi_s^dagger alpha' phi_s$ is integral and $q_(lambda_s) \( hat(alpha) \) = q_(lambda'_s) \( alpha' \)$.
  Thus Proposition 4.3, Proposition 4.6 apply to this new tuple.
  No isogeny is assumed to exist along a containing algebraic variety used in interpolation.

#thm([Proposition 5.4.])[
  #emph[For a selected marked target as in 17, each applicable list above,
    formed from a nonempty selected group of places, satisfies the all-branch nonidentity hypothesis of 6.
    More precisely, let $W$ be any irreducible algebraic subvariety of the indicated affine ambient conditions
    which contains the target and on which $a$ is nonconstant.
    On every branch over the generic point of every component of $W ∩ { a = 0 }$,
    at least one equation in the applicable list, including the chart equations, is not an identity.]
] <prop:nonidentity>

#proof[
  #emph[From a branch identity to monodromy.] Suppose that every equation is an identity on such a branch.
    On the normalization near a general point of its divisor, $a$ vanishes and all affine coordinates,
    including $R$ when present, are regular. The series in $a$ and $a
    R$ therefore converge after a complex embedding in a neighborhood of that point.
    In a transverse parameter on the normalization, the formal identity makes every coefficient zero at the
    generic point of the divisor. Convergence therefore gives an identity on a nonempty analytic open.
    Any fixed denominator cleared in a chart is nonzero at the target,
    hence is a nonzero function on $W$ and has finite order on each normalization branch.
    It cannot turn a nonzero series into an identity. If one of the chart equations is not an identity we already
    have the desired conclusion; otherwise they identify the series arguments with the actual projections to $S$
    and $S'$. The first projection is nonconstant since $a$ is nonconstant.
  Pass to a smooth dense open of $W$ on which these projections and the algebraic frames are defined.
    An irreducible complex algebraic variety has connected smooth locus,
    so the analytic identity continues on its universal cover.
    At a fixed point of this open the vector coordinates are single-valued,
    whereas continuation changes the transport matrices by the monodromy of the pulled-back systems.
    A dominant map to a curve has fundamental-group image of finite index after deleting suitable closed subsets
    and passing to a resolution; thus 4 applies on this open.
    The vector pairs are generically independent, because they are independent at the target.
    A pair minor nonzero at the target is not identically zero on $W$,
    so its nonvanishing locus meets this analytic open even if the pair vanishes on the divisor itself.
    They need not remain independent at every boundary point of $W$.
  #emph[Constant relations and independent projections.] For (5.3), fix a general point of this open.
    The orbit of the transport matrix under continuation has Zariski closure a translate of $"SO"_5$.
    For nonzero vectors $b \, v$ in its standard representation, the function $g mapsto ⟨b \,
    g v⟩$ is not constant. Indeed, the span of the differences $g v - v$ is invariant,
    and is the whole representation by irreducibility and the absence of invariant vectors.
    A constant matrix coefficient would annihilate this span.
    Applying this to $B_1$ and $P_1$ contradicts the continued identity.
  For (5.4), if the second projection is constant, only the first system varies and the same argument applies.
    If it is nonconstant, 4 gives product monodromy unless the closure of the paired image is contained in a
    dominating isogeny correspondence. In the latter case 5 puts the image in the fixed finite list;
    since these correspondences are closed, the target also belongs to that list,
    contrary to this case’s defining assumption. For product monodromy,
    fix the second transport matrix and vary the first. The resulting constant matrix coefficient is again impossible.
  #emph[The exceptional relation forces a common sign.] Consider now (5.6).
    At a general point $z$ of $W$, write $Y_z : cal(V)_z arrow.r cal(V)_(t_0)$ for transport.
    The continued identity holds with transport $g Y_z$ for every $g in "SO" \( cal(V)_(t_0) \)$.
    The standard representation is absolutely irreducible, so Burnside’s theorem says that these matrices span
    $"Hom" \( cal(V)_z \, cal(V)_(t_0) \)$. For each $i \, j$, the linear functional
  $ M mapsto ⟨B_i \, M P_j⟩ - ⟨D_i \, M hat(P)_j⟩ $
  therefore vanishes on every linear map $M$ between these two spaces.
    The corresponding rank-one tensors are equal. Identifying their first factors with covectors by the fixed
    center trace pairing, we obtain
  #[#set math.equation(numbering: n => "(5.7)")
   $ B_i ⊗ P_j = D_i ⊗ hat(P)_j wide \( 1 lt.eq i \, j lt.eq 2 \) . $ <eq:burnside-tensors>]
  These are polynomial equations in the algebraic vector coordinates.
    They hold on a dense open of $W$, and therefore at the target itself.
    There, all four pairs of factors are nonzero. The $\( 1 \, 1 \)$ equation gives $D_1 =
    c_0 B_1$ and $hat(P)_1 = c_0^(- 1) P_1$ for some nonzero scalar $c_0$;
    the $\( 2 \, 1 \)$ and $\( 1 \, 2 \)$ equations give the same scalar for the other indices.
    The self-pairing of $B_1$ is a nonzero rational number, and is unchanged by conjugation or the isometry $I_0$.
    Thus $c_0^2 = 1$, and
  #[#set math.equation(numbering: n => "(5.8)")
   $ D_i = epsilon B_i \, wide hat(P)_j = epsilon P_j \, wide epsilon in { 1 \, - 1 } . $ <eq:common-sign>]
  The $\( 2 \, 1 \)$ and $\( 1 \, 2 \)$ equations are essential here:
    they couple the two labels and give a single sign for both pairs.
  #emph[Specialization to a Frobenius quasi-isogeny.] We now use that the vectors in (5.8) come from
    endomorphisms. De Rham realization on the rational endomorphism algebra of a characteristic-zero abelian
    variety is faithful: base change to $bb(C)$, compare with Betti cohomology,
    and use the faithful action on its rational first homology.
    Conjugation by an isogeny preserves the Rosati self-adjoint subspace.
    Consequently (5.8) asserts equalities of actual rational endomorphisms in the center and target fibers.
    These equalities specialize under good reduction.
  Choose any place in the nonempty selected group and let $p$ be its residue characteristic.
    The unprimed center and target have a common marked reduction $overline(A)$,
    and the primed reductions identify with its $p$-twist. Write $F : overline(A) arrow.r
    overline(A)^(\( p \))$ for relative Frobenius, and write $overline(phi)_0$ for the common specialization of
    $phi_0$ and $phi_s$. The map
  $ u = overline(phi)_0^(- 1) F in "End"^0 \( overline(A) \) $
  is a self-quasi-isogeny with polarized multiplier $p \/ m$.
    Relative Frobenius transports the unprimed labeled endomorphisms to their primed specializations.
    The specialized equalities (5.8) therefore say that the conjugation action $g$ of $u$ on the quadratic
    $bb(Q)_ell$-space acts by $epsilon$ on both specialized endomorphism planes.
    The sign action extends to their saturated $bb(Z)_ell$-lattices;
    the chosen small pairs need not be bases of those lattices. By 3, $g$ belongs to $"SO"_5$.
  #emph[Excluding the two signs.] Let $T$ be the rational span of those two planes in $"End"^0 \( overline(A) \)$.
    Its $ell$-adic realization has dimension four by 17. The trace form on its rational symmetric endomorphisms is
    positive definite by Rosati positivity in arbitrary characteristic #cite(label("Milne1986")) Theorem 17.3;
    hence $T$ is nondegenerate over $bb(Q)$, and its realization $T_ell$ is nondegenerate over $bb(Q)_ell$.
    The one-dimensional perpendicular is consequently $g$-stable.
    Since $det g = 1$ and $det \( g \|_(T_ell) \) = epsilon^4 = 1$, $g$ acts as $+ 1$ on that perpendicular.
  If $epsilon = + 1$, it follows that $g = 1$. The kernel of the conjugation representation of $"GSp"_4$ on this
    quadratic space is its scalar center by 3. Put $mu = p \/ m$.
    With the covariant convention of 2, the action on first cohomology is
  $ T_u = mu \( u^(*) \)^(- 1) = \( u^dagger \)^(*) \; $
  the equality follows from $u^dagger u = \[ mu \]$. Thus $\( u^dagger \)^(*) =
    c upright("id")$ for some $c in bb(Q)_ell$. The ordinary cohomological trace of the rational
    quasi-endomorphism $u^dagger$ is rational #cite(label("Milne1986")) Proposition 12.9, so $4 c =
    "Tr" \( u^dagger \) in bb(Q)$. Faithfulness gives $u^dagger = c upright("id")$, and applying Rosati gives $u =
    c upright("id")$. Its multiplier would satisfy $c^2 = p \/ m$.
    This is impossible because $p divides.not m$, so the $p$-adic valuation of $p \/ m$ is odd.
  If $epsilon = - 1$, $g$ is an involution with negative eigenspace exactly $T_ell$.
    Both $F$ and $overline(phi)_0$ have multipliers prime to $ell$,
    so their actions are invertible on the integral Tate modules;
    conjugation by $u$ preserves the integral quadratic lattice $Lambda_ell$.
    This lattice is unimodular by the choice of $ell$. Since $ell$ is odd,
    the integral projectors $\( 1 + g \) \/ 2$ and $\( 1 - g \) \/ 2$ give an orthogonal direct sum
  $ Lambda_ell = Lambda_(+) perp Lambda_(-) \, wide Lambda_(-) = Lambda_ell ∩ T_ell . $
  Each summand is unimodular, so $Lambda_(-) \/ ell Lambda_(-)$ is nondegenerate.
    But 17 identifies $Lambda_(-)$ with the sum $M$ of the two marked saturated plane lattices,
    whose reduction is degenerate by (5.2). This is the required contradiction.
  Both cases contradict the assumed identity. The use of Rosati positivity and rational endomorphism trace is
    valid for every reduction type; no classification or ordinarity assertion about Frobenius has been used. ◻
]

=== 5.4 Application of interpolation and descent <application-of-interpolation-and-descent>

#thm([Theorem 5.5.])[
  #emph[Fix a reduced irreducible closed Hodge-generic curve $C subset cal(A)_2$ over $overline(bb(Q))$,
    and let $C^nu$ be its normalization. For a fixed nonnegative ample logarithmic height $h$ on the smooth
    projective completion of $C^nu$ and a fixed field of definition $K$, there are constants $C_1 \,
    C_2 > 0$ such that every point $s in C^nu \( overline(bb(Q)) \)$ whose coarse image has full geometric
    rational endomorphism algebra an indefinite quaternion division algebra over $bb(Q)$ satisfies
$ max { 2 \, h \( s \) } lt.eq C_1 max { 2 \, \[ K \( s \) : K \] }^(C_2) . $

 The same assertion holds on the fixed fine-level curves used above,
   and for a fixed projective height of the coarse points. The constants do not depend on the quaternion algebra,
   its discriminant, or the target endomorphism order.]
] <thm:height>

#proof[
  If the target locus is finite, enlarge the constants to cover it.
    Otherwise use the initial family and center, the finite multiplier list,
    and then the fixed prime and connected marking cover, in the order already specified.
    For each target choose one lift satisfying 17; this does not enlarge any fixed datum.
    Remove the finite exceptional targets of the affine charts,
    and suppose that its height $h$ exceeds a sufficiently large fixed polynomial in $d =
    max { 2 \, \[ K \( t \) : K \] }$. The fields generated by the labeled single or paired point tuples in 15
    have degree polynomial in $d$. A normal closure is used only to index selected embeddings.
    A chosen fixed-multiplier isogeny requires only a bounded relative extension over the field of its two point
    arguments, so adjoining it preserves this polynomial bound.
    Selected embeddings are extended by all extensions; the new weights above an old embedding sum to its old
    weight, preserving the normalized smallness sum.
  #emph[Arithmetic inputs.] Apply 15, with the fixed exceptional primes chosen above.
    Partition first into its constant and Frobenius groups, and, if needed,
    subdivide the latter by the finite center-isogeny choice.
    There are polynomially many groups, and one supplies a common list of equations and a selected weighted set
    $cal(V)$ with
  $ sum_(v in cal(V)) w_v log 1 / lr(|a|)_v gt.eq frac(h, Q_1 \( d \)) \, wide
    sum_(v in cal(V)) w_v log^(+) ∥U∥_v lt.eq Q_2 \( d \) \( 1 + log^c h \) . $
  The tuple $\( a \, U \)$ has global logarithmic height at most $Q_3 \( d \) h$.
    The coefficient degrees are $O \( j + 1 \)$, and the complete affine coefficient tuple through order $l$,
    including scale, has logarithmic height at most $Q_4 \( l \, d \) \( 1 + log^c h \)$.
    The tails satisfy the hypotheses of 6. These assertions also hold for the transformed target pair $hat(P)$ in
    the exceptional case: its fixed denominator and preserved Rosati norms give exactly the size hypotheses of 12,
    and only the original ordinary connection in $a$ is used.
    In the other paired case $lr(|R|)_v = 1$ at every selected place.
    Thus its two ordinary systems are evaluated at $a$ and $a R$, as required.
    The chart equations use fixed algebraic ordinary germs.
  #emph[Nonidentity and interpolation.] Start the interpolation argument inside the fixed affine algebraic
    conditions on the base coordinates described above. They have bounded complexity.
    No inverse Gram matrices or inverse minors of the target endomorphism pairs have been adjoined.
    Every irreducible subvariety encountered in the dimension descent contains the target.
    If $a$ varies there, 19 supplies nonidentity on every relevant branch,
    including branches on which a chart equation already fails.
    If $a$ is constant, the stopping case in 6 applies directly.
  6 now gives $h lt.eq C_3 d^(C_4)$ for the selected lifts.
    Its constants are uniform because the cover, centers, allowed ordinary systems, and isogeny multipliers are fixed.
  #emph[Descent from the selected lifts.] The degree of the marking cover is fixed. If $t_(*)$ is the image of $t$, then
  $ \[ K \( t \) : K \] lt.eq \( deg \( S arrow.r S_(*) \) \) \[ K \( t_(*) \) : K \] . $
  Choose the ample height upstairs as the height of the pullback of an ample divisor downstairs;
    it equals the downstairs height up to a bounded error, and arbitrary fixed ample heights on these curves are
    comparable up to fixed positive constants and bounded errors.
    Thus the bound for the selected lift descends to $t_(*)$.
    The further normalization and fine-level maps descend in the same way by 2.
    For any other lift $tilde(t)$ in a fixed cover, height comparison and $\[ K \( t_(*) \) : K \]
    lt.eq \[ K \( tilde(t) \) : K \]$ give the same numerical bound. Thus only the selected lifts require (5.1).
    At singular coarse points there are finitely many normalization preimages,
    all included among the finite exceptions. Increasing the constants includes all finitely many omitted points.
    The absolute height bound for a selected lift also holds for all its conjugates over the fixed data field,
    even when those conjugates were not selected relative to the original marking of $t_0$;
    no fresh incidence choice is needed to deduce that numerical bound.
    All fixed enlargements of the data field $K$ change the degree bounds by at most fixed factors. ◻
]

== 6 From heights to finiteness <sec:counting>

We now turn the height estimate into a bound on degrees. The rational objects to be counted are ordered pairs of
  integral Hodge vectors in the rank-five variation. Their two orthogonality equations cut the period quadric in a
  conic. A semialgebraic family of such pairs with one real parameter therefore sweeps out an algebraic subset of
  dimension at most two, whereas full monodromy forces the period image to be Zariski dense in the
  three-dimensional quadric.

Throughout this section the curve, family, and all auxiliary covers are fixed over a number field $K$.
  We choose the ample height on $macron(S)$ from a fixed projective embedding defined over $K$, and write

$ h \( t \) = max { 2 \, h_(macron(S)) \( t \) } \, wide d \( t \) = max { 2 \, \[ K \( t \) : K \] } . $

This choice is invariant under $"Gal" \( overline(bb(Q)) \/ K \)$;
  changing to it preserves the preceding estimates by the height comparisons in 2.
  Constants in this section depend on the fixed data.

=== 6.1 Flat coordinates at all complex embeddings <flat-coordinates-at-all-complex-embeddings>

The Rosati bound in 11 controls the Hodge norms of our vectors.
  Counting requires their numerical sizes in integral flat bases.
  Near a puncture, passing between these two bounds also requires control of the dual Hodge norm at each complex
  embedding.

Write $b = ⟨dot.op \, dot.op⟩$ for the trace pairing of (2.2).
  In a flat trivialization of $bb(V)_(bb(Z))$, let $V_(bb(Z))$ be the corresponding fixed lattice and $V_(bb(C)) =
  V_(bb(Z)) ⊗ bb(C)$. The period quadric of (2.4) is

$ Q_V = { \[ w \] in bb(P) \( V_(bb(C)) \) : b \( w \, w \) = 0 } \, wide dim_(bb(C)) Q_V = 3 . $

The period line is the line corresponding to $H^(2 \, 0)$, with the Tate twist understood.
  A real vector of type $\( 0 \, 0 \)$ is orthogonal to this line.
  In particular the two vectors of 11 satisfy these equations, and their Gram matrix for $b$ is positive definite by 3.

Here the counting height is the #emph[multiplicative rational coordinate height].
  For $y = \( y_1 \, dots.h \, y_m \) in bb(Q)^m$, with $y_i = a_i \/ b_i$ in lowest terms and $b_i > 0$, put

$ H_(upright("rat")) \( y \) = max_i max { lr(|a_i|) \, b_i } . $

For an integral tuple it is $max { 1 \, ∥y∥_oo }$. This height is distinct from the absolute logarithmic algebraic
  heights used in the arithmetic argument.

#thm([Lemma 6.1.])[
  (Flat-coordinate bound).  #emph[There is a finite collection of simply connected complex charts covering
    $S \( bb(C) \)$, each equipped with an integral flat basis of $bb(V)_(bb(Z))$,
    whose period maps are definable in $bb(R)_(upright("an") \, exp)$.
    There are constants $c \, M > 0$ such that, for every QM point $t in S \( overline(bb(Q)) \)$,
    the ordered pair of integral vectors supplied by 11 has flat coordinate tuple $y in bb(Z)^10$ satisfying
#[#set math.equation(numbering: n => "(6.1)")
 $ H_(upright("rat")) \( y \) lt.eq c #scale(x: 120%, y: 120%)[\(] d \( t \) h \( t \)
   #scale(x: 120%, y: 120%)[\)]^M $ <eq:flat-coordinate-height>]

 in each of these charts containing $t$. The same bound holds for their conjugate vectors at every conjugate of
   $t$ over $K$.]
] <lem:flat-coordinate-bound>

#proof[
  We first describe the charts and their metric estimates, including the punctures of $S$.
    A compact subset away from the finitely many points of $macron(S) \\ S$ has a finite cover by relatively
    compact simply connected coordinate disks. Shrink these disks inside slightly larger disks on which the flat
    trivializations and the period maps are holomorphic. Their real and imaginary parts are restricted analytic
    functions, hence definable.
  At a puncture choose a rational function $u$ on $macron(S)$ which is a local parameter there.
    Enlarge $K$ once to define these finitely many choices. The local monodromy is quasi-unipotent.
    On a fixed local cover $u = w^e$ it is unipotent, say $exp N$, with $N$ nilpotent.
    The one-variable nilpotent orbit theorem #cite(label("Schmid1973")) Theorem 4.9 gives, in the compact dual,
    the expression
  #[#set math.equation(numbering: n => "(6.2)")
   $ Phi \( u \) = exp (frac(log w, 2 pi i) N) Psi \( w \) \, $ <eq:sector-period>]
  where $Psi$ extends holomorphically across $w = 0$. Cover a sufficiently small punctured $u$-disk by finitely
    many open angular sectors of width less than $2 pi$, and choose a branch of $w$ and of $log w$ on each.
    The exponential in (6.2) is a polynomial in $log w$. The branch of $w$ is algebraic, its argument is bounded,
    and $log lr(|w|)$ is definable in $bb(R)_(upright("an") \, exp)$.
    After shrinking the radius, $Psi$ is restricted analytic in an affine chart about $Psi \( 0 \)$.
    Thus the projective map (6.2) is definable. These local covers are used only to describe functions on the
    sectors; no point-dependent global cover is introduced.
  Write $∥dot.op∥_(H \, u)$ for the Hodge norm. Schmid’s abstract one-variable norm estimate
    #cite(label("Schmid1973")) Theorem 6.6$'$, applied both to $bb(V)$ and to its dual,
    bounds the norms of each fixed flat basis and dual basis by a power of $1 + log \( 1 \/ lr(|u|) \)$,
    uniformly on each sector. Indeed every fixed flat vector belongs to some step of the monodromy weight
    filtration, and that theorem supplies such a power; only finitely many basis vectors occur.
    Passing from $w$ to $u = w^e$ merely changes the constants.
    Consequently, with $e_1 \, dots.h \, e_5$ an integral flat basis and $e_1^(*) \, dots.h \, e_5^(*)$ its dual,
    we have fixed $c_0 \, r > 0$ such that
  #[#set math.equation(numbering: n => "(6.3)")
   $ max_i { ∥e_i∥_(H \, u) \, ∥e_i^(*)∥_(H \, u)^or #scale(x: 120%, y: 120%)[}] lt.eq
     c_0 #scale(x: 120%, y: 120%)[\(] 1 + log \( 1 \/ lr(|u|) \) #scale(x: 120%, y: 120%)[\)]^r .
     $ <eq:sector-metric-dual>]
  On the compact charts the corresponding bound is constant.
    In particular (6.3) controls the metric and its inverse in flat coordinates.
  For completeness, the logarithm in this bound can be controlled at an individual complex embedding,
    not merely on average. Let $F = K \( t \)$ and let $sigma :
    F arrow.r.hook bb(C)$ fix the chosen embedding of $K$. Whenever $sigma \( t \)$ belongs to the sector,
    $u \( t \) eq.not 0$, and the absolute height identity $upright(h) #h(-0.16667em) (u \( t \)^(- 1)) =
    upright(h) #h(-0.16667em) (u \( t \))$ gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ log^(+) 1 / lr(|sigma \( u \( t \) \)|) & lt.eq \[ F : bb(Q) \] upright(h) #h(-0.16667em) (u \( t \))\
 & lt.eq c_1 d \( t \) h \( t \) . $ <eq:individual-embedding-log>]
  The first inequality follows by retaining that archimedean summand in the height of $u \( t \)^(- 1)$,
    using the usual nonsquared absolute value. For the second,
    the fixed rational function $u$ defines a morphism $macron(S) arrow.r bb(P)^1$,
    whose height is bounded above by a constant times $1 + h_(macron(S))$.
    This also explains why algebraic local parameters were chosen.
  Let $v$ be either of the two chosen endomorphism vectors, at any such embedding.
    If $v$ realizes the symmetric endomorphism $alpha$, the Weil operator fixes its type $\( 0 \, 0 \)$,
    and its rationality gives
  $ ∥v∥_H^2 = b \( v \, v \) = 1 / 4 "Tr" \( alpha^2 \) = 1 / 4 q_(lambda_t) \( alpha \) . $
  The bound in 11 therefore gives $∥v∥_H lt.eq c_2 \( d \( t \) h \( t \) \)^(r_2)$.
    If $v = sum_i n_i e_i$, the dual norm inequality is
  $ lr(|n_i|) = lr(|e_i^(*) \( v \)|) lt.eq ∥e_i^(*)∥_H^or ∥v∥_H . $
  Combining this with (6.3) and (6.4) proves a polynomial bound on the #emph[numerical sizes] of all ten integers.
    This is precisely (6.1).
  The vectors are realizations of actual integral endomorphisms.
    Conjugation preserves integrality, independence, and the rational Rosati trace norms.
    Although labeling the endomorphisms may require an extension of $K \( t \)$ of bounded relative degree,
    each embedding of $K \( t \)$ extends to that field. Conjugating the labeled pair along any such extension
    supplies the asserted pair at the conjugate point. Neither the degree estimate for $u \( t \)$ nor the number
    of conjugate points is diminished by this labeling extension. ◻
]

=== 6.2 Counting distinct curve arguments <counting-distinct-curve-arguments>

We use the following precise specialization of the counting theorem.
  The structure $bb(R)_(upright("an") \, exp)$ containing our period charts is o-minimal by
  #cite(label("DMM1994")) Corollary 5.13. Let $Z subset bb(R)^m times
  bb(R)^n$ be definable in an o-minimal expansion of the real field, and write $pi_1 \,
  pi_2$ for its two projections. For every $eta > 0$ there is $c_Z \( eta \)$ such that, if $T gt.eq 1$ and

$ Sigma subset { \( y \, z \) in Z : y in bb(Q)^m \, med H_(upright("rat")) \( y \) lt.eq T } \,
  wide \# pi_2 \( Sigma \) > c_Z \( eta \) T^eta \, $

then there is a continuous definable path $beta : \[ 0 \, 1 \] arrow.r
  Z$ for which $pi_1 beta$ is semialgebraic and real analytic on $\( 0 \, 1 \)$, while $pi_2 beta$ is nonconstant.
  This is #cite(label("HabeggerPila2016")) Corollary 7.2, with $k = 1$ and no family parameter.
  The corollary counts distinct second projections and imposes no finite-fiber hypothesis on $Z arrow.r bb(R)^m$.
  A constant first projection is allowed, and causes no difficulty below.

#thm([Proposition 6.2.])[
  #emph[For fixed $A \, kappa > 0$, the set of QM points $t in S \( overline(bb(Q)) \)$ satisfying
#[#set math.equation(numbering: n => "(6.5)")
 $ h \( t \) lt.eq A d \( t \)^kappa $ <eq:counting-height-hypothesis>]

 is finite.]
] <prop:counting-finiteness>

#proof[
  The set in question is stable under $"Gal" \( overline(bb(Q)) \/ K \)$.
    If its degrees were unbounded, take a point $t$ of sufficiently large degree $d = \[ K \( t \) : K \]$.
    Its full orbit has $d$ distinct points on $S \( bb(C) \)$, all satisfying (6.5).
    Assign each conjugate to one chart of 21. If there are $J$ charts,
    one chart contains at least $d \/ J$ of these distinct points.
    For each of them choose a conjugate of the labeled pair at $t$. Their integral coordinate tuples have
  #[#set math.equation(numbering: n => "(6.6)")
   $ H_(upright("rat")) \( y \) lt.eq T = c_3 d^B $ <eq:counting-polynomial-T>]
  for fixed $c_3 \, B > 0$.
  In the selected chart write $z in D subset bb(R)^2$ for the curve coordinate and $Phi \( z \) in
    Q_V$ for the period line. Identify the flat real space with $bb(R)^5$. Consider the fixed definable set
  #[#set math.equation(numbering: n => "(6.7)")
   $ Z = {\( \( v_1 \, v_2 \) \, z \) in \( bb(R)^5 \)^2 times
     D : \( b \( v_i \, v_j \) \)_(i \, j = 1)^2 upright(" is positive definite") \,\
b \( v_1 \, Phi \( z \) \) = b \( v_2 \, Phi \( z \) \) = 0} . $ <eq:counting-incidence>]
  Orthogonality to a projective line means orthogonality to any nonzero representative;
    it is a well-defined algebraic incidence condition. The coordinate $z$ is injective on the chart.
    The tuples just chosen thus form a set $Sigma subset Z$ with at least $d \/
    J$ distinct second projections and rational first coordinates bounded as in (6.6).
  Choose $eta > 0$ with $B eta < 1$. The finitely many chart incidences have a common counting constant,
    obtained by taking their maximum. For large enough $d$ we have
  $ d \/ J > c_Z \( eta \) \( c_3 d^B \)^eta . $
  The quoted corollary therefore gives a path $beta \( s \) = \( gamma \( s \) \, z \( s \) \)$ in $Z$,
    with $gamma$ semialgebraic and $z$ nonconstant. It remains to show that this path would force the period image
    into a proper algebraic subset of $Q_V$. The first projection supplies at most one algebraic parameter,
    and for each nondegenerate pair the orthogonal period lines form a conic.
  Let $cal(A) subset \( bb(C)^5 \)^2$ be the complex Zariski closure of $gamma \( \( 0 \, 1 \) \)$.
    A semialgebraic set of real dimension at most one has real Zariski closure of dimension at most one,
    and complexification preserves that dimension. Hence $dim_(bb(C)) cal(A) lt.eq 1$.
    Equivalently, after a finite semialgebraic decomposition, the arc has Nash coordinate functions,
    which are algebraic over its real parameter; their algebraic closure has transcendence degree at most one.
  Crucially, impose nondegeneracy before closing the orthogonality incidence. Let
  $ cal(U) = { \( v_1 \, v_2 \) : det \( b \( v_i \, v_j \) \)_(i \, j = 1)^2 eq.not 0 } subset \( bb(C)^5 \)^2 \, $
  and define the locally closed algebraic set
  $ cal(I) = { \( v_1 \, v_2 \, \[ w \] \) in \( cal(A) ∩ cal(U) \) times Q_V : b \( v_1 \, w \) =
    b \( v_2 \, w \) = 0 } . $
  For each $\( v_1 \, v_2 \) in cal(A) ∩ cal(U)$, their span is a nondegenerate two-space.
    Its perpendicular is a nondegenerate three-space, whose isotropic lines form a smooth projective conic.
    Every fiber of $cal(I) arrow.r cal(A) ∩ cal(U)$ therefore has dimension one, so
  $ dim_(bb(C)) cal(I) lt.eq 2 . $
  Let $X subset Q_V$ be the Zariski closure of its image under the second projection.
    The dimension of an image and its closure cannot exceed the dimension of its source, whence
  #[#set math.equation(numbering: n => "(6.8)")
   $ dim_(bb(C)) X lt.eq 2 . $ <eq:counting-dimension-two>]
  This construction closes only the incidence over $cal(A) ∩ cal(U)$;
    it does not add arbitrary fibers over degenerate pairs. Since the pairs on $gamma$ have positive definite Gram
    matrix, they lie in $cal(U)$, and consequently $Phi \( z \( s \) \) in X$ for all $s in \( 0 \, 1 \)$.
  The continuous nonconstant path $z \( s \)$ contains infinitely many distinct points accumulating inside the
    chart. Indeed one may restrict it to a closed interior interval on which it remains nonconstant.
    The inverse image $Phi^(- 1) \( X \)$ is a complex analytic subset of a connected one-dimensional chart.
    The identity theorem therefore makes it the entire chart.
    Continuing the defining homogeneous polynomial identities along $S$ gives
  $ tilde(Phi) \( tilde(S) \) subset X \, $
  where $tilde(S)$ is the connected universal cover and the flat trivialization defining $tilde(Phi)$ extends the
    one in the chosen chart.
  Fix a period line $L$ in this image. Equivariance places its entire monodromy orbit $Gamma L$ in $X$.
    By 4, $Gamma$ is Zariski dense in $"SO" \( V_(bb(C)) \, b \)$,
    and this group acts transitively on the nonsingular isotropic quadric $Q_V$.
    The orbit $Gamma L$ is therefore Zariski dense in $Q_V$. This contradicts (6.8) and $dim Q_V = 3$.
  Degrees in (6.5) are thus bounded. That inequality also bounds their ample heights,
    and Northcott’s theorem on the fixed projective curve $macron(S)$ proves finiteness. ◻
]

=== 6.3 Descent to the coarse curve <descent-to-the-coarse-curve>

#proof[
  Suppose the stated locus on $C$ were infinite. By 2, normalize $C$ and take a connected component of a fixed
    fine-level cover containing infinitely many lifted target points.
    Removing the finitely many points needed for the smooth family and the algebraic charts leaves infinitely
    many. Choose an interior QM center and then the fixed auxiliary cover of 17.
    All these choices, including their fields of definition, are made once.
  For every remaining target to which the construction is applied,
    20 supplies a selected lift on this fixed cover with $h \( t \) lt.eq A d \( t \)^kappa$, for fixed $A \,
    kappa$. The degrees of a point and its lift are comparable by the fixed degree of the finite map,
    and the ample heights are comparable by the pullback of ample divisors, as in 2.
    Thus the constants are uniform as the quaternion algebra and the target vary.
  Apply 22 on the fixed covering curve. Its counting argument uses the full orbit over the fixed field $K$:
    the height inequality for a selected lift is invariant under that orbit,
    and conjugation preserves its two integral Hodge vectors and their Rosati bounds.
    A conjugate marking need not satisfy the incidence imposed relative to the chosen center.
    That incidence was used to prove the height inequality; the incidence (6.7) depends only on the target’s Hodge
    vectors. Hence all these selected lifts belong to the finite set of 22,
    whose final step uses Northcott’s theorem. Their images on $C$ form a finite set.
    Adding back the finitely many removed points contradicts the assumed infinitude.
    This proves the asserted finiteness for full geometric endomorphism algebra an indefinite quaternion division
    algebra over $bb(Q)$, with no restriction on its discriminant or order. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
