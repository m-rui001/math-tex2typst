#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
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

#align(center)[#text(size: 16pt, weight: "bold")[Projective-space bases of Lagrangian fibrations]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $X$ be a compact irreducible holomorphic symplectic (IHS) Kähler manifold of dimension $2 n$. A nontrivial fibration of $X$ is a proper surjective holomorphic map $f : X arrow.r B$ with connected fibers onto a normal complex space, with $0 < dim B < 2 n$. In the projective setting, Matsushita proved that $dim B = n$ and that a smooth general fiber is an abelian variety #cite(label("Matsushita1999")) #cite(label("Matsushita2001")). His equidimensionality theorem shows that every irreducible component of every fiber is Lagrangian once the general fiber is Lagrangian #cite(label("Matsushita2000")) Theorem 1. For compact Kähler IHS total spaces, Greb–Lehn’s Proposition 2.2 shows that the base is projective of dimension $n$ and that every fiber component is Lagrangian #cite(label("GrebLehn2014")). The projective-space base conjecture asks whether this normal base must be isomorphic to $bb(P)^n$.

Hwang proved the projective-space conclusion when $X$ is projective and $B$ is smooth #cite(label("Hwang2008")) Theorem 1.2. Greb and Lehn extended the smooth-base theorem to compact Kähler IHS total spaces #cite(label("GrebLehn2014")) Theorem 1.1. These results reduce the base problem to the possible singularities of $B$.

The conclusion is also known for the $K 3^(\[ n \])$, generalized Kummer, $upright(O G 6)$, and $upright(O G 10)$ deformation types without assuming the base smooth. A common nef formulation of the earlier isotropic-divisor and rational-fibration results is recorded in #cite(label("DebarreHuybrechtsMacriVoisin2024")) Theorem 1.3: a nef line bundle $L$ whose first Chern class is primitive and isotropic for the Beauville–Bogomolov–Fujiki form on such a compact IHS manifold admits a holomorphic Lagrangian fibration $g : X arrow.r bb(P)^n$ with $L tilde.eq g^(*) cal(O)_(bb(P)^n) \( 1 \)$. For an existing fibration $f : X arrow.r B$, choose an ample line bundle $H$ on $B$ and write $f^(*) H tilde.eq L^r$ with $c_1 \( L \)$ primitive. This class remains nef and isotropic, so the theorem applies to $L$; connected fibers identify the graded section rings of $H$, $L^r$, and $cal(O)_(bb(P)^n) \( r \)$. Taking their $"Proj"$ identifies $B$ with $bb(P)^n$.

In dimension four, Ou reduced the normal surface base of a projective IHS fibration to $bb(P)^2$ or the specified Fano surface $S^(upright(n)) \( E_8 \)$, with one $E_8$ singularity and two nodal rational anticanonical curves #cite(label("Ou2019")) Theorem 1.2. Huybrechts and Chenyang Xu excluded the second case #cite(label("HuybrechtsXu2022")) Theorem 0.1. Müller and Zheng Xu subsequently proved a local theorem: a projective Lagrangian germ from a smooth holomorphic symplectic manifold has smooth base if the normal analytic base has only isolated quotient singularities #cite(label("MullerXu2026")) Theorem 1.3. Their Corollary 1.4 treats such germs in total dimension four without a singularity assumption, and their Theorem 1.5 treats terminal threefold bases in total dimension six. Their Example 4.1 exhibits a nonisolated quotient stratum for a noncompact symplectic total space; excluding these strata in the compact setting therefore requires additional global geometry.

For projective IHS total spaces, the cohomological constraint is already that of projective space: Shen–Yin compute the rational intersection cohomology of $B$ as one-dimensional in degrees $0 \, 2 \, dots.h \, 2 n$ and zero in odd degrees #cite(label("ShenYin2022")) Theorem 0.4(a). This does not itself establish smoothness. Our proof first establishes smoothness and then applies Hwang’s theorem.

#thm([Theorem 1.1.])[
  #emph[Let $n gt.eq 1$, and let $X$ be a compact irreducible holomorphic symplectic Kähler manifold of dimension $2 n$, with symplectic form $sigma$. Suppose that 
$ f : X arrow.r B $

 is a projective surjective holomorphic morphism with connected fibers, where $B$ is a normal projective variety of dimension $n$. Assume that every irreducible component of every fiber has dimension $n$ and that the restriction of $sigma$ to its smooth locus is zero. Then $B$ is isomorphic to $bb(P)_(bb(C))^n$.]
] <thm:main>

Here projectivity of $f$ means the existence of a relatively ample holomorphic line bundle. Together with projectivity of $B$, it makes the original $X$ projective. Compact Kähler deformations, which can be nonprojective, enter later in the proof. The theorem imposes no smoothness condition on $B$, no additional lower bound on $b_2 \( X \)$, and no restriction on the deformation type. It gives a positive answer to the projective-space base conjecture for the stated projective fibrations.

The proof uses the companion paper #cite(label("StrongSYZ2026")). Its Theorem 1.1 supplies semiampleness of a nonzero integral nef isotropic line bundle on the given compact Kähler IHS manifold and the associated connected Lagrangian fibration; we restate it as Theorem 5. Its Lemma 4.2 supplies a polarized family for a prescribed primitive ample class, with polarization a positive multiple of that class. It also supplies a torsion-free finite-index subgroup of the integral lattice isometries fixing the class and preserving the chosen period-domain component. This subgroup acts freely, the quotient is smooth and quasi-projective, and a local marked lift of the family’s algebraic period map is submersive at some point. The family monodromy lies in that subgroup. Lemma 65 of this article proves that its image has finite index there. Section 9 uses these inputs to construct a second Lagrangian fibration.

Once $B tilde.eq bb(P)^n$ has been established, Kim–Oguiso–Shinder’s theorem excludes codimension-one multiple fibers #cite(label("KimOguisoShinder2026")) Theorems 1.1 and 3.4. Kamenova–Verbitsky also prove this conclusion over $bb(P)^n$ #cite(label("KamenovaVerbitsky2026")) Theorems 1.5 and 6.7. Thus, for every prime divisor $D subset B$, writing $f^(*) D = sum_i a_i E_i$ with distinct prime divisors $E_i$, one has $gcd_i a_i = 1$. Equivalently, there is no equality $f^(*) D = m E$ with an integral effective divisor $E$ and $m > 1$. This is a consequence of the base identification.

=== 1.1 Proof strategy <proof-strategy>

The proof has two stages. First we rule out germs that are not analytic quotients of smooth germs by finite groups. We then eliminate the stabilizers of the remaining quotient germs. The second stage uses both the original fibration and a finite cover by an abelian variety constructed from deformations that retain $B$. This cover is available without assuming that $B$ has quotient singularities.

Suppose $B$ has a nonquotient germ. Sections 3 and 4 use finite local covers and reflexive cotangent tensors to find a nonempty closed normal projective stratum $S_0 subset B$ of dimension less than $n$. A smooth Deligne–Mumford stack $cal(S)$ with coarse space $S_0$ records the finite stabilizers on its local charts. Sections 5 and Section 6 prove the obstruction

$ chi_(upright("top")) \( S_0 \) = 0 \, $

where this is the ordinary Euler characteristic of the coarse space. The numerical argument compares Euler characteristics after pullback to $X$ with alternating cotangent contributions on the local charts. This comparison uses ordinary coefficient base change in a suitable reduction to positive characteristic; Frobenius growth and Riemann–Roch force the relevant values to be zero. The local tensor classification then allows coherent coefficient modules to isolate the trivial character of the full stabilizer. This recovers the ordinary Euler characteristic of $S_0$, including when some stabilizers act trivially on the stratum.

The tensor recognition in this construction uses Deligne’s criterion #cite(label("Deligne1990")) Theorem 7.1. The differential identity behind the base-change formula uses the strictness and decomposition of projective direct images of Hodge modules #cite(label("Saito1988")) #cite(label("Saito2016")). These tools enter the Euler obstruction; the later exclusions use the global geometry of the original fibration and its deformations.

Choose a very ample line bundle $H$ on $B$ and put $e = c_1 \( f^(*) H \)$. Matsushita’s deformation theorem gives a relatively generated line bundle and a family of Lagrangian maps throughout the nearby locus where $e$ remains of type $\( 1 \, 1 \)$ #cite(label("MatsushitaDeformations2016")) Theorem 1.2 and Corollary 1.3. The targets in that result may vary. Section 7 proves that their normal Stein targets can all be identified with the original $B$, obtaining a map to $B times D$ over that entire nearby locus. Verbitsky’s degenerate-twistor construction already keeps a Lagrangian fibration holomorphic over its original base along a complex line #cite(label("Verbitsky2015")) Theorem 1.10. Bogomolov–Déev–Verbitsky develop this construction for closed base forms of type $\( 2 \, 0 \) + \( 1 \, 1 \)$ #cite(label("BogomolovDeevVerbitsky2022")) Proposition 3.2 and Theorem 3.3. Soldatenkov–Verbitsky give a formulation for normal analytic bases and show, for compact IHS fibrations, that these deformations are Zariski locally trivial over the projective base and arise from twists #cite(label("SoldatenkovVerbitsky2025")) Section 2.2, Theorem 3.1 and Corollary 3.3. The simultaneous fixed target over the full nearby $e$-Hodge locus is the additional assertion needed here.

Lemma 4 gives $b_2 \( X \) gt.eq 4$. If $b_2 \( X \) gt.eq 5$, period variation in the fixed-base family forces the Hodge cohomology of $cal(S)$ to be diagonal. Consequently

$ chi_(upright("top")) \( S_0 \) = sum_p h^(p \, p) \( cal(S) \) > 0 \, $

contradicting the obstruction. When $b_2 \( X \) = 4$, we distinguish the isotrivial family of polarized smooth fibers from a family with nonzero variation. Section 8 treats the isotrivial case: its ramification and reflection arguments reduce a possible stratum to an elliptic curve, where a connection on a negative line bundle gives the contradiction. In the other case, Section 9 constructs a projective deformation $f' : X' arrow.r B$ with a second, varying Lagrangian fibration $g : X' arrow.r C$. Section 10 uses its monodromy and the symmetric period cubic to force the same diagonal Hodge conclusion. The cubic is the Donagi–Markman condition on the smooth polarized locus #cite(label("DonagiMarkman1996")) Section 7.2, Lemmas 7.1–7.2 and Remark 7.3; Deligne’s fixed-part theorem supplies the monodromy invariants used with it #cite(label("Deligne1971")) Theorem 4.1.1(ii) and Corollary 4.1.2. These three cases rule out every nonquotient germ.

Starting from the original fibration and its fixed-base family, the second-system construction also supplies a cover in every allowed rank. On a smooth fiber $A$ of $g$, the mixed Fujiki formula makes the nef line bundle $f' ""^(*) H \|_A$ have positive top self-intersection, hence it is ample on the abelian variety $A$. Therefore $f' \|_A$ is finite, and equality of dimensions makes it surjective. This is a finite cover by an abelian variety. After the first stage has proved that $B$ has quotient singularities, Section 11 applies this cover and the original fibration. On the canonical smooth stack over $B$, the direct-image identities produce a single translation vector on $A$ whose projection to the directions fixed by each nonidentity stabilizer element never vanishes on its fixed locus. This use of equivariant higher direct images has a local precedent in Müller–Xu’s combination of those identities, cohomology and base change for the flat fibration, and equivariant Lefschetz vanishing #cite(label("MullerXu2026")) Theorem 3.1. Here the finite relation associated with the cover records pairs of points of $A$ together with an isomorphism between their stack images. A component containing a nonidentity automorphism over a pair $\( a \, a \)$ has a proper difference image in $A$. Choose such a component for which that image has maximal dimension. Polarization and ramification produce another such component with a larger difference image, giving a contradiction. Thus $B$ is smooth, and Hwang’s theorem completes the proof.

Figure 1 displays the three exclusions in the first stage and the cover available in every allowed rank.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 12.02cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[A nonquotient germ gives a closed stratum $S_0$ with $chi_( upright("top") )(S_0)=0$#linebreak()\(Sections~3--6\)]]])])
  content((-4.5, -2.3), [#box(width: 4.073cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$b_2 gt.eq 5$#linebreak()Fixed-base deformation#linebreak()and period variation#linebreak()\(Section~7\)]]])])
  content((0, -2.3), [#box(width: 4.073cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$b_2=4$, isotrivial#linebreak()Ramification and an#linebreak()elliptic connection#linebreak()\(Section~8\)]]])])
  content((4.5, -2.3), [#box(width: 4.073cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$b_2=4$, varying#linebreak()Fixed-base deformation#linebreak()with a second fibration#linebreak()and symmetric cubic#linebreak()\(Sections~9--10\)]]])])
  content((-3.4, -5), [#box(width: 6.123cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Each case excludes the stratum:#linebreak()$B$ has only quotient singularities]]])])
  content((3.4, -5), [#box(width: 6.123cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Second-system construction:#linebreak()a finite cover of $B$ by an abelian variety#linebreak()\(Section~9, all $b_2 gt.eq 4$\)]]])])
  content((0, -7), [#box(width: 12.02cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Eliminate quotient stabilizers \(Section~11\)#linebreak()$B$ is smooth; Hwang's theorem gives $B tilde.eq bb(P)^n$]]])])
  line((-6.012, -0.4811), (-4.5, -1.3), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -0.4811), (0, -1.3), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.012, -0.4811), (4.5, -1.3), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((-4.5, -3.3), (-4.5, -3.75), (0, -3.75), stroke: (thickness: 0.4pt))
  line((0, -3.3), (0, -3.75), stroke: (thickness: 0.4pt))
  line((4.5, -3.3), (4.5, -3.75), (0, -3.75), stroke: (thickness: 0.4pt))
  line((0, -3.75), (-3.4, -4.275), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((-3.4, -5.725), (-6.012, -6.519), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((3.4, -5.725), (6.012, -6.519), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The first stage rules out a nonquotient germ in three cases. The second uses both quotient singularities and a finite cover by an abelian variety. ],
) <fig:proof>

== 2 Notation and global inputs <sec:setup>

All spaces are over $bb(C)$ unless a reduction to positive characteristic is specified. An irreducible holomorphic symplectic manifold is abbreviated IHS. Write $q = q_X$ for the Beauville–Bogomolov–Fujiki quadratic form, and $\( thin dot.op thin \, thin dot.op thin \)$ for its associated bilinear form. We also write $q \( x \, y \) = \( x \, y \)$, so that $q \( x \) = q \( x \, x \)$. We use the integral normalization; its real signature is $\( 3 \, b_2 \( X \) - 3 \)$.

Choose a very ample line bundle $H$ on $B$, and set

$ e = c_1 \( f^(*) H \) . $

For a coherent sheaf $M$ on a normal space, $M^(* *)$ is its reflexive hull. In particular, $Omega_B^(\[ j \]) = \( and.big^j Omega_B^1 \)^(* *)$. Reflexive tensor operations are always explicitly interpreted by taking this hull. An associated map of a semiample line bundle is replaced by its Stein factorization.

#thm([Proposition 2.1.])[
  (Background for the given fibration).  #emph[In the setting of Theorem 1, the following hold.]
  + #emph[$X$ is projective, $e eq.not 0$ is nef and $q \( e \) = 0$. The base is $bb(Q)$-factorial and klt, has Picard number one, and $- K_B$ is ample as a $bb(Q)$-Cartier divisor. A smooth fiber is an abelian variety after choosing an origin.]
  + #emph[There are reflexive identifications 
$ R^j f_(*) cal(O)_X tilde.eq Omega_B^(\[ j \]) . $

 For every integral Weil divisor $A$ ample as a $bb(Q)$-divisor, 
$ H^i #h(-1em) (B \, \( Omega_B^(\[ j \]) ⊗ cal(O)_B \( A \) \)^(* *)) = 0 quad \( i > 0 \, med j > 0 \) . $

 The reflexivity assertion also applies locally to the projective equidimensional fibrations with connected fibers, smooth source $Z$ satisfying $omega_Z tilde.eq cal(O)_Z$, and normal Cohen–Macaulay $bb(Q)$-Gorenstein target that occur below.]
  + #emph[The rational intersection cohomology of $B$ has the Betti numbers of $bb(P)^n$, and the restriction of $H^2 \( X \, bb(Q) \)$ to a smooth fiber has one-dimensional image.]
  + #emph[If $B$ is smooth, then $B tilde.eq bb(P)^n$.]
] <prop:background>

#proof[
  Relative ampleness and projectivity of $B$ make $X$ Moishezon; as $X$ is Kähler, it is projective. Equivalently, a sufficiently positive twist of a relative polarization by a base polarization is ample. The structure statements in (1) are the fibration theorems of Matsushita #cite(label("Matsushita1999")) #cite(label("Matsushita2001")). The pullback of $H$ is nef and nonzero. Its $\( 2 n \)$-th power is zero because $dim B = n$, so Fujiki’s relation gives $q \( e \) = 0$.
  For (2), Ou’s Proposition 3.6 gives the reflexive cotangent identifications for the given projective equidimensional Lagrangian fibration, extending the symplectic differential identification of Matsushita #cite(label("Matsushita2005")) #cite(label("Ou2019")). Ou’s Theorem 1.3 is the separate local reflexivity result, and Theorem 1.4 gives the vanishing #cite(label("Ou2019")). The target hypotheses hold because klt spaces are Cohen–Macaulay #cite(label("Kollar1997")) Theorem 11.1(2), Corollaries 11.9 and 11.14 and $K_B$ is $bb(Q)$-Cartier. The cited reflexivity theorem has arbitrary-dimensional scope. The higher-cohomology and fiber-restriction statements in (3) are #cite(label("ShenYin2022")) Theorem 0.4. Statement (4) is Hwang’s theorem #cite(label("Hwang2008")) Theorem 1.2. ◻
]

Fix once and for all degreewise global isomorphisms

$ phi.alt_j : R^j f_(*) cal(O)_X arrow.r^(med tilde.op med) Omega_B^(\[ j \]) #h(2em) \( 0 lt.eq j lt.eq n \) \, $

with $phi.alt_0$ the unit identification $f_(*) cal(O)_X = cal(O)_B$. The later normalized-chart constructions use the restrictions of these same maps to $B_(upright("reg"))$; Proposition 27 constructs their compatible reflexive extensions on the charts.

We use intersection cohomology in Proposition 2 until rational smoothness has been proved in Proposition 7, which then identifies it with ordinary rational cohomology.

#thm([Corollary 2.2.])[
  #emph[If $n > 1$, then $H^1 \( B \, T_B \) = 0$.]
] <cor:tangent-rigidity>

#proof[
  On the smooth locus, contraction identifies $T_B$ with $Omega_B^(n - 1) ⊗ cal(O)_B \( - K_B \)$. Both sides extend reflexively, so
  $ T_B tilde.eq \( Omega_B^(\[ n - 1 \]) ⊗ cal(O)_B \( - K_B \) \)^(* *) . $
  Apply Proposition 2(2), since $n - 1 > 0$. ◻
]

The following elementary observation also appears in #cite(label("GrebLehn2014")) Lemma 3.1.

#thm([Lemma 2.3.])[
  #emph[One has $b_2 \( X \) gt.eq 4$.]
] <lem:betti-bound>

#proof[
  Let $h$ be an ample class. Then $\( h \, e \) > 0$ and $q \( e \) = 0$, so $chevron.l h \, e chevron.r_(bb(R))$ is a hyperbolic plane. It is perpendicular to the positive real plane generated by $"Re" sigma$ and $"Im" sigma$. These four independent real directions give the assertion. ◻
]

For a compact Kähler manifold $Y$, write $cal(K)_Y$ for its Kähler cone in $H^(1 \, 1) \( Y \, bb(R) \)$.

#thm([Theorem 2.4.])[
  (Strong hyperkähler SYZ, companion input).  #emph[Let $Y$ be a compact IHS Kähler manifold of dimension $2 m$. If a holomorphic line bundle $L$ satisfies 
$ c_1 \( L \) eq.not 0 \, #h(2em) c_1 \( L \) in overline(cal(K)_Y) \, #h(2em) q_Y \( c_1 \( L \) \) = 0 \, $

 then a positive tensor power of $L$ is generated by its global sections. Its associated map with connected fibers has a normal projective base of dimension $m$. Every component of every fiber has dimension $m$ and is Lagrangian.]
] <thm:strong-syz>

This is Theorem 1.1 of the companion #cite(label("StrongSYZ2026")); it has no restriction on $b_2 \( Y \)$, $m$, or deformation type. The hypothesis $b_2 gt.eq 5$ in that manuscript belongs to its separate finiteness Corollary 1.2. Section 9 applies the theorem to a second nonzero integral nef isotropic class on an actual projective deformation. The class is of type $\( 1 \, 1 \)$, so the exponential sequence supplies its holomorphic line bundle.

===== 2.1 Reduction to smoothness. <reduction-to-smoothness.>

For $n = 1$, normality makes $B$ a smooth curve, and Proposition 2(4) proves the result. Henceforth $n > 1$. It suffices to prove that $B$ is smooth. Proposition 48 later supplies proper holomorphic fibrations over this same $B$ throughout the nearby $e$-Hodge locus. The original fibration and the projective deformation carrying two Lagrangian systems have the stronger projectivity used in their respective arguments.

===== 2.2 The Euler obstruction. <the-euler-obstruction.>

The first stage has a specific numerical target. If $B$ has a nonquotient germ, Sections 3–4 produce a nonempty closed irreducible normal projective stratum $S_0 subset B$ of dimension $d < n$. Proposition 36, proved through Sections 5–Section 6, establishes

$ chi_(upright("top")) \( S_0 \) = 0 . $

Here $chi_(upright("top"))$ is the ordinary topological Euler characteristic of the coarse space. The local construction also gives a smooth stack $cal(S)$ above $S_0$; we write $c = n - d > 0$. Its finite stabilizers, including those acting trivially on the stratum, are retained in the calculations. In characteristic $p$, their orders are chosen prime to $p$. The later geometric arguments will contradict this Euler equality when $b_2 \( X \) gt.eq 5$ and in the isotrivial and varying cases with $b_2 \( X \) = 4$.

== 3 Finite local covers and cotangent tensors <loc:section>

We first establish three geometric facts about the base germs: finite smooth domination, rational smoothness, and the existence of maximal finite quasi-étale charts. The normalized source over such a chart will also provide the direct-image and descent maps used later. We then study reflexive cotangent tensors on one maximal chart through a residual trace category. Its tensor group acts on the fiber spaces of that category. The obstruction to a holomorphic connection identifies the nontrivial irreducible summands of the cotangent fiber representation as standard blocks for special linear and symplectic groups, which enter the Euler calculation in Section 6. A finite map between normal spaces is called #emph[quasi-étale] if it is étale outside a subset of codimension at least two in the target. The geometric tensor argument uses complex analytic local rings of the maximal charts; they are excellent and henselian, with residue field $bb(C)$. The trace and split-lifting lemmas are stated for general normal henselian local rings as well, so that they apply after completion. Reflexive pullback means pullback followed by double dual.

#thm([Lemma 3.1.])[
  (Finite smooth domination).  #emph[Every point of $B$ has an algebraic neighborhood, after an étale base change if necessary, admitting a finite surjection from a smooth variety of dimension $n$. In particular, every analytic germ of $B$ is finitely dominated by a smooth germ of the same dimension. Every such germ is analytically $bb(Q)$-factorial.]
] <loc:smooth-domination>

#proof[
  Fix $b in B$. Choose sufficiently positive very ample divisors on the smooth projective variety $X$. By Bertini, a general intersection of $n$ of them is smooth of dimension $n$. They may simultaneously be chosen so that their intersection with each component of $f^(- 1) \( b \)$ is zero-dimensional and nonempty: the fiber has finitely many components, all of dimension $n$, and successive general hyperplanes cut each of them properly. Denote the resulting smooth intersection by $Y$. The proper map $Y arrow.r B$ is quasi-finite over $b$, and hence finite over a neighborhood of $b$. Its image contains that neighborhood, by properness and the dimension theorem. A local branch at a point of $Y$ over $b$ gives the asserted finite map of analytic germs. If an individual algebraic branch is required, split the finite algebra over the henselization and descend the corresponding idempotents to an étale neighborhood.
  Let $pi : \( Y \, y \) arrow.r \( B \, b \)$ be a finite dominating smooth germ, of degree $m$, and let $D$ be a Weil divisor on $\( B \, b \)$. Pullback of Weil divisors under a finite map is defined by the ramification indices of the discrete valuations at prime divisors. The divisor $pi^(*) D$ is principal on the smooth local germ, say $"div" \( g \)$. The valuation formula for the field norm gives
  $ "div" #scale(x: 120%, y: 120%)[\(] "Nm"_(bb(C) \( Y \) \/ bb(C) \( B \)) g #scale(x: 120%, y: 120%)[\)] = pi_(*) pi^(*) D = m D . $
  Thus $m D$ is Cartier. The argument is analytic and therefore proves the stronger local assertion needed later, rather than merely algebraic $bb(Q)$-factoriality. ◻
]

#thm([Proposition 3.2.])[
  (Rational smoothness).  #emph[The space $B$ is an oriented rational homology manifold of real dimension $2 n$. Its rational intersection complex is $bb(Q)_B \[ n \]$. Consequently its ordinary rational cohomology has the Betti numbers of $bb(P)^n$. The local rational homology-manifold assertion holds for every normal germ finitely dominated by a smooth germ, in particular for the maximal charts constructed below.]
] <loc:rational-smoothness>

#proof[
  We explain the trace at a branch point. For a finite surjection $pi : Y arrow.r U$ from a smooth $n$-fold to a normal connected neighborhood, let $m_y$ be the local generic degree of the branch at $y$. A section $a$ of $pi_(*) bb(Q)_Y$ is locally constant on $Y$. Set
  $ "Tr"_pi \( a \) \( b \) = sum_(y in pi^(- 1) \( b \)) m_y a \( y \) . $
  This is locally constant. Indeed, choose disjoint neighborhoods of the finitely many points above $b$. After shrinking downstairs, the sum of the local generic degrees in each of these neighborhoods is constant: it equals the degree over the common unbranched dense open of the locally irreducible normal base. The value of $a$ is constant on each chosen neighborhood. This proves the assertion and shows that the trace is a morphism of sheaves. Its composite with the constant-section inclusion $bb(Q)_U arrow.r pi_(*) bb(Q)_Y$ is multiplication by $deg pi$. Therefore $bb(Q)_U$ is a direct summand of $pi_(*) bb(Q)_Y$.
  Proper base change and the finiteness of the fibers give $R^j pi_(*) bb(Q)_Y = 0$ for $j > 0$. Applying the point costalk at $b$ to the preceding direct summand, and using proper base change for costalks, exhibits
  $ H_({ b })^k \( U \, bb(Q) \) quad upright("as a direct summand of") quad xor.big_(y in pi^(- 1) \( b \)) H_({ y })^k \( Y \, bb(Q) \) . $
  The latter group is zero unless $k = 2 n$. The top local group on the normal, hence locally irreducible, complex analytic germ $U$ is one-dimensional: the complex orientation gives its fundamental class, and the top fundamental cycles of a pure analytic germ are indexed by its local irreducible components #cite(label("BorelHaefliger1961")) Section 1.4, Theorem 3.2, Section 3.3 and Lemma 4.3. Here fundamental classes are taken in Borel–Moore homology of representatives and passed to local groups. Equivalently, this follows from an analytic triangulation and the oriented top strata. Thus the costalk of $bb(Q)_U$ is exactly $bb(Q) \[ - 2 n \]$ at every point, with the compatible complex orientation. This is the rational homology-manifold assertion and identifies the intersection complex with the shifted constant sheaf #cite(label("Massey2005")) Theorem 1.1(1)$arrow.l.r.double$(4). The final claim now follows from the base-cohomology theorem recalled in Proposition 2; the passage from intersection to ordinary cohomology has been justified before using it. ◻
]

#thm([Proposition 3.3.])[
  (Maximal quasi-étale charts and normalized source charts).  #emph[Every pointed germ $\( B \, b \)$ has a connected finite normal Galois quasi-étale cover $\( C \, c \)$ which dominates every connected finite quasi-étale cover of that germ. The chart $\( C \, c \)$ is klt, is finitely dominated by a smooth germ, and has no nontrivial connected finite quasi-étale cover. The finite diagrams can be defined over an algebraic étale neighborhood of $b$.]
  #emph[More generally, let $U arrow.r B$ be an integral separated étale algebraic neighborhood and let $pi : C arrow.r U$ be an integral finite normal quasi-étale cover. Put $X_U = X times_B U$. The base change $X_U times_U C$ has a unique irreducible component dominating $C$; let $Z$ be its normalization and $h : Z arrow.r C$ its structure map. Then $h$ is projective and equidimensional of relative dimension $n$, has connected fibers, and satisfies $h_(*) cal(O)_Z = cal(O)_C$. The finite map $p : Z arrow.r X_U$ is étale. Consequently $Z$ is smooth, the pullback of the symplectic form on $X$ is symplectic on $Z$, its canonical bundle is trivial, and the fibers of $h$ are Lagrangian. If $pi$ is Galois with group $Gamma$, then $p$ is a $Gamma$-torsor. Ordinary étale base change on $C$ preserves projectivity, equidimensionality, connected fibers, the equality $h_(*) cal(O)_Z = cal(O)_C$, and the smooth symplectic source. The torsor in the statement belongs to the original finite chart.]
] <loc:maximal-charts>

#proof[
  Work first over the strict henselization of the algebraic germ and choose a finite smooth slice as in Lemma 6. Choose a connected local factor of its finite algebra, with fraction field $L$ over the base field $K$. If $K' \/ K$ defines a finite quasi-étale normal cover, the normalization of its pullback to this slice is unramified outside a set of codimension at least two. Finiteness preserves that codimension bound. The source of the normalized map is normal and the target is regular, so purity of the branch locus #cite(label("StacksProject")) Tag 0BMB makes the map étale everywhere. A connected finite étale cover of a strictly henselian regular local scheme is trivial. A component of the split pullback therefore embeds $K'$ into $L$ over $K$.
  Let $M \/ K$ be a finite Galois closure of $L \/ K$, let $W$ be the normalization of the base in $M$, and write $Gamma$ for its Galois group. Normalizations are finite by excellence. Let $H lt.closed Gamma$ be the normal subgroup generated by the inertia groups of all prime divisors of $W$. The finite quotient $C = W \/ H$ is unramified over every prime divisor of the normal base and hence is quasi-étale. Conversely, an intermediate extension which is quasi-étale has trivial divisorial inertia; its defining subgroup contains every conjugate of each inertia group, and hence contains $H$. Every quasi-étale cover is consequently dominated by $C$. A further quasi-étale cover of $C$ would give one of the base and is therefore trivial. Applying the same split-pullback argument to $C$ shows that it too is finitely dominated by the smooth slice.
  All finite algebras, group actions, quotient maps and their identities descend from the strict henselization to an étale neighborhood. Shrinking removes branch divisors not meeting the marked fiber. This construction also gives the analytic maximum. Indeed, the normalized pullback of any finite analytic quasi-étale cover to the smooth germ is étale by analytic purity and splits because a smooth germ is simply connected. One may also obtain this directly: a small smooth ball minus an analytic set of complex codimension at least two is simply connected, by general position for disks against a stratification; its finite cover splits there, and normalization extends that splitting uniquely. The analytic cover is thus an intermediate cover of the analytification of the same finite Galois closure. Finite normalizations and finite-group quotients commute here with analytification; the local normal components and their degrees agree. The divisorial inertia groups through the marked point are therefore the same in both constructions. Finally $C$ is klt. Indeed, writing $pi : C arrow.r B$, we have $K_C = pi^(*) K_B$ in codimension one, and for a divisorial valuation $E$ over $C$ restricting with ramification index $r$ to a divisorial valuation $F$ over $B$, the canonical ramification formula on normalized birational models gives $A_C \( E \) = r A_B \( F \)$. The latter is positive because $B$ is klt.
  We prove the source assertions, including connectedness. The connected fibers of $f$ and normality of $B$ give $f_(*) cal(O)_X = cal(O)_B$ by Stein factorization. This equality persists after the flat base change to $U$. Let $K = bb(C) \( U \)$, $L = bb(C) \( C \)$, and let $F$ be the generic fiber of $X_U arrow.r U$. Generic smoothness makes $F$ smooth. Proper flat field base change gives
  $ H^0 \( F_(overline(K)) \, cal(O)_(F_(overline(K))) \) = overline(K) . $
  Thus $F_(overline(K))$ is connected. A connected smooth scheme over an algebraically closed field is integral, since its irreducible components are disjoint. In this setting it is an abelian variety after an origin is chosen, by Proposition 2. In particular $F$ is geometrically integral, so $F_L$ is integral and normal and has $H^0 \( F_L \, cal(O)_(F_L) \) = L$. This proves uniqueness of the component dominating $C$ and identifies the generic fiber of its normalization $Z$ with $F_L$.
  The normalization is finite by excellence, so $h$ is projective. Its Stein algebra $h_(*) cal(O)_Z$ is finite over $cal(O)_C$ and embeds in the generic algebra $L$: a section on the integral space $Z$ is determined by its restriction to the generic fiber. Every such section is integral over $cal(O)_C$; normality of $C$ therefore gives $h_(*) cal(O)_Z = cal(O)_C$. Stein factorization now gives connected fibers. This part of the argument used only that $C arrow.r U$ is finite and dominant, with $C$ normal and integral.
  Let $D subset U$ have codimension at least two and contain the branch locus of $pi$. Equidimensionality of $f$ gives
  $ dim f_U^(- 1) \( D \) lt.eq dim D + n lt.eq 2 n - 2 . $
  The map $p$ is finite over the smooth space $X_U$ and is étale away from $f_U^(- 1) \( D \)$. Purity makes it étale everywhere, so $Z$ is smooth and carries the pulled-back symplectic form. Each component of a fiber of $h$ has dimension at most $n$, because its finite image lies in a fiber of $f_U$. The fiber dimension theorem gives the reverse inequality. Hence $h$ is equidimensional of relative dimension $n$; the same finite images show that its fiber components are Lagrangian. The symplectic form trivializes the canonical bundle of $Z$.
  If $pi$ is Galois, its deck action lifts to $Z$. Over the dense unbranched locus the map $p$ is a deck torsor. Both sides of the torsor map $Gamma times Z arrow.r Z times_(X_U) Z$ are finite étale over $Z$, so their isomorphism on that dense locus extends over $Z$. This proves freeness of the action also over special fibers. Subsequent étale refinements of the object chart use ordinary base change of $h$ and preserve its projectivity, equidimensionality, connected fibers and smooth symplectic source. The torsor descent is retained from the finite chart before that refinement. ◻
]

=== 3.1 The trace quotient <the-trace-quotient>

Fix a maximal chart and let $\( R \, frak(m) \)$ be its analytic local ring. Put $V = Omega_R^(\[ 1 \])$. On reflexive modules we use $M hat(⊗) N = \( M ⊗_R N \)^(* *)$ and $M^or = "Hom"_R \( M \, R \)$. These are a symmetric rigid tensor product and dual: on a common open set containing every point of codimension one they are the ordinary bundle operations, and all identities extend uniquely by reflexivity. In particular the categorical trace is the usual generic trace, which lies in $R$ by normality. We use the full additive, idempotent-complete tensor subcategory $cal(C)$ generated by $V$ and $V^or$. Every object in this subcategory is a vector bundle on the smooth locus of the chart.

There are two uses of endomorphisms below. The ordinary finite $R$-algebra $A_M = "End"_R \( M \)$ consists of morphisms of the module $M$. The internal endomorphism object is

$ underline("End") \( M \) = M accent(⊗ M, ̂)^or . $

Its underlying reflexive module is canonically $"Hom"_R \( M \, M \)$: this is the usual bundle identification in codimension one, extended reflexively. We use the underline when this module is a coefficient object in $cal(C)$, rather than the algebra of morphisms of $M$.

#thm([Lemma 3.4.])[
  (The trace ideal is the Jacobson radical).  #emph[Let $\( R \, frak(m) \)$ be any noetherian normal henselian local $bb(C)$-algebra with residue field $bb(C)$. For finite reflexive modules $M \, N$, define 
$ cal(R) \( M \, N \) = { a in "Hom"_R \( M \, N \) : "tr" \( b a \) in frak(m) upright(" for every ") b in "Hom"_R \( N \, M \) } . $

 These spaces form a tensor ideal. For every $M$, $cal(R) \( M \, M \)$ is the Jacobson radical of the finite $R$-algebra $"End"_R \( M \)$. The quotient category is semisimple abelian over $bb(C)$, has finite-dimensional Hom spaces, and its categorical dimensions are the positive integer ranks of its nonzero objects.]
] <loc:trace-radical>

#proof[
  Cyclicity of trace proves stability under composition. Stability under tensor product follows by taking a partial trace: for a map $a : M arrow.r N$ and a test map $b : N accent(⊗ P, ̂) arrow.r M accent(⊗ P, ̂)$, the trace of $b \( a hat(⊗) "id"_P \)$ is the trace of $a$ composed with the partial trace of $b$. These formulas hold for bundles in codimension one and therefore over $R$. Duality is compatible with the same ideal.
  Write $A = A_M = "End"_R \( M \)$ and $J = "rad" A$. The algebra $A$ is finite over the henselian local ring $R$, so $frak(m) A subset J$, $A \/ J$ is a finite-dimensional semisimple $bb(C)$-algebra, and $J^q subset frak(m) A$ for some $q$. We recall why idempotents lift in this setting. First lift an idempotent through the nilpotent radical of $A \/ frak(m) A$. For an ensuing lift $a in A$ of an idempotent modulo $frak(m) A$, the commutative finite algebra $R \[ a \]$ splits into the factors supported at $0$ and $1$ in its closed fiber by henselianity. The resulting idempotent lifts the given one. Induction in complementary corners lifts an entire orthogonal system. Thus primitive idempotents of $A \/ J$ lift to actual direct summands of $M$.
  For $x in J$, all sufficiently large powers $x^j$ belong to $frak(m) A$, so their traces vanish modulo $frak(m)$. The generic characteristic polynomial of $x$ has coefficients in $R$: this is true at every height-one localization, where $M$ is free, and $R$ is the intersection of those valuation rings. If $lambda_1 \, dots.h \, lambda_r$ are the roots of its reduction over $bb(C)$, Newton identities give $sum_i lambda_i^j = 0$ for every sufficiently large $j$. Grouping the distinct nonzero roots, a Vandermonde matrix applied to consecutive such powers forces all their multiplicities to be zero. There are consequently no nonzero roots, and $"tr" \( x \) = 0$ modulo $frak(m)$. The same holds for $y x$ for any $y in A$, because $J$ is an ideal. Hence $J subset cal(R) \( M \, M \)$.
  The residual trace now descends to $A \/ J$. On each simple block $"Mat"_t \( bb(C) \)$ it is a scalar multiple of the ordinary matrix trace, by cyclicity. Evaluate it on a primitive diagonal idempotent. Its lift projects onto a nonzero reflexive direct summand $M_0$, so the scalar is $"rk" \( M_0 \) > 0$. The trace pairing is therefore nondegenerate on every block. This proves the reverse inclusion and the equality with $J$.
  Apply the argument to finite direct sums of objects. Their endomorphism algebras in the quotient are semisimple matrix algebras, and their primitive projectors lift. In particular every object is a finite sum of simple objects, distinct simple objects have no morphisms, and the endomorphisms of each simple object are $bb(C)$. This also proves that the quotient is abelian and that all its exact sequences split. The ideal contains $frak(m) "Hom"_R \( M \, N \)$, so its Hom spaces are finite-dimensional. Finally the trace of the identity is $"rk" M$, as asserted. ◻
]

#thm([Lemma 3.5.])[
  (Lifting split maps).  #emph[Over any ring in Lemma 9, if a morphism of reflexive modules becomes a split injection in the trace quotient, it is already a split injection of reflexive modules. An isomorphism in the quotient lifts to an isomorphism. In particular, an object is a sum of copies of the tensor unit in the quotient if and only if its underlying module is free.]
] <loc:split-lift>

#proof[
  Let $a : M arrow.r N$ and lift a left inverse in the quotient to $b : N arrow.r M$. Then $b a = "id"_M + r$ with $r in "rad" "End"_R \( M \)$, so $b a$ is invertible. Replacing $b$ by $\( b a \)^(- 1) b$ gives an actual left inverse. If the quotient map is an isomorphism, apply the same argument to both composites of lifts of it and its inverse; the lift is an isomorphism. Apply this to an isomorphism with $R^r$ for the final statement. ◻
]

Return now to the analytic maximal chart and the category $cal(C)$ fixed above.

#thm([Proposition 3.6.])[
  (The residual tensor group).  #emph[The residual category $overline(cal(C)) = cal(C) \/ cal(R)$ admits a fiber functor $omega$ to complex vector spaces. For a choice of $omega$, tensor reconstruction identifies it with $"Rep"_(bb(C)) \( G \)$, where $G = "Aut"^⊗ \( omega \)$ is a reductive algebraic subgroup of $"GL" \( V_(upright("fib")) \)$ and $V_(upright("fib")) = omega \( overline(V) \)$. This representation is faithful and has dimension $n$.]
] <loc:tannakian>

#proof[
  Lemma 9 gives an abelian rigid symmetric $bb(C)$-linear category with $"End" \( upright(bold(1)) \) = bb(C)$. Tensor product is exact because every exact sequence splits. For an object of rank $r$, its $\( r + 1 \)$st exterior power is zero: it is zero on the common bundle locus and hence its reflexive extension is zero. Deligne’s criterion #cite(label("Deligne1990")) Theorem 7.1 therefore applies. The category is tensor-generated by one object; Deligne’s Corollary 6.20 supplies a fiber functor over a finite extension of $bb(C)$, hence over $bb(C)$ itself. Tensor reconstruction gives the stated group. A tensor generator makes it an algebraic subgroup of its general linear group, and semisimplicity of the representation category makes it reductive in characteristic zero. The fiber dimension equals the categorical dimension, namely $"rk" V = n$. ◻
]

We call $G$ the residual tensor group of the chosen fiber functor. Its representations are the fiber spaces of $overline(cal(C))$. Finite deck groups, denoted by $Gamma$, act on the geometric charts. For example, if $M_(upright("fib")) = omega \( overline(M) \)$, then

$ omega #scale(x: 120%, y: 120%)[\(] overline(underline("End") \( M \)) #scale(x: 120%, y: 120%)[\)] = "End"_(bb(C)) \( M_(upright("fib")) \) \, #h(2em) "End"_(overline(cal(C))) \( overline(M) \) = "End"_G \( M_(upright("fib")) \) . $

The first space is the full internal coefficient representation, with the conjugation action; the second is its space of invariant vectors.

=== 3.2 Connections before and after the trace quotient <connections-before-and-after-the-trace-quotient>

For an object $M$ let $M_U$ be its vector bundle on the smooth locus $U$ of a sufficiently small representative of the chart. Its ordinary Atiyah class #cite(label("Atiyah1957")) is

$ a \( M_U \) in H^1 #scale(x: 120%, y: 120%)[\(] U \, Omega_U^1 ⊗ "End" \( M_U \) #scale(x: 120%, y: 120%)[\)] . $

It vanishes precisely when $M_U$ has a holomorphic connection; integrability is not part of this assertion. We take the direct limit over shrinking representatives when discussing this class on a germ. All cohomology in the following lemmas is this ordinary sheaf cohomology.

#thm([Lemma 3.7.])[
  (A connection gives freeness on a maximal chart).  #emph[If $a \( M_U \) = 0$, then $M$ is a free $R$-module.]
] <loc:connection-free>

#proof[
  Pull a connection on $M_U$ back to a finite smooth dominating germ $pi : \( Y \, y \) arrow.r \( C \, c \)$. The complement of $pi^(- 1) \( U \)$ has codimension at least two. On $Y$ let $F = \( pi^(*) M \)^(* *)$. In local smooth coordinates each coefficient of the connection extends across that complement by the Hartogs property of $F$. Its target $F ⊗ Omega_Y^1$ is reflexive because $Omega_Y^1$ is locally free. Thus the connection extends to $F$ and still satisfies Leibniz’s rule.
  Here is the elementary freeness argument, which does not require a flat connection. For a coordinate derivation $partial$, choose a presentation of $F$ and lift the operator $nabla_partial$ to the free module of generators. If $A$ is the corresponding matrix on generators and $P$ a matrix of relations, stability of the relations gives a matrix $Q$ with
  $ partial P + A P = P Q . $
  The derivative of every minor of $P$ is therefore a linear combination of minors of the same size. Each Fitting ideal of $F$ is stable under every coordinate derivation. A nonzero ideal in a smooth characteristic-zero local ring with this property is the unit ideal: repeatedly differentiating a nonzero element of minimal order produces an element with nonzero constant term. If $r$ is the generic rank of $F$, its $r$th Fitting ideal is nonzero and hence is the unit ideal. Thus $F$ is generated by $r$ elements. The resulting surjection from a free module of rank $r$ has a torsion kernel, which is zero because it is a submodule of a free module over a domain. This proves that $F$ is free.
  Take a normal Galois closure $W arrow.r C$ of $Y arrow.r C$, with group $Gamma$. Its normal domain is local over the henselian germ, so the whole group fixes the unique marked point. The reflexive pullback $P$ of $M$ to $W$ is free: it agrees in codimension one with the pullback of the free module $F$, and both reflexive extensions agree. It has its natural semilinear $Gamma$-action. At a prime divisor, divisorial inertia acts trivially on its restriction to that divisor, because there $P$ is the ordinary pullback of a bundle from $C$. The same inertia therefore acts trivially on the fiber of $P$ at the marked point. To see the last specialization explicitly, for an inertia element of order $m$, restrict $P$ to its fixed locus and apply the idempotents
  $ 1 / m sum_(j = 0)^(m - 1) zeta^(- j) g^j . $
  Their ranks are locally constant. On the divisor all nonidentity eigenvalues have rank zero, hence they have rank zero at its specialization to the marked point as well.
  Since $C$ has no further quasi-étale cover, these inertia groups normally generate $Gamma$, by the construction in Proposition 8. The action on the marked fiber of $P$ is consequently trivial. Lift a basis of that fiber to sections of $P$ and average over $Gamma$. The averaged sections still lift the basis and hence, by Nakayama, form a basis of the free module $P$. This basis is $Gamma$-invariant. The invariant basis identifies $P^Gamma$ with $R^r$, because the invariants of the normal cover ring are $R$. Thus $P^Gamma$ is reflexive. The natural map $M arrow.r P^Gamma$ is an isomorphism in codimension one by ordinary finite descent for the pullback of a bundle. Both modules are reflexive, so this isomorphism extends over the normal germ. Hence $M = P^Gamma$ is free, as claimed. ◻
]

#thm([Lemma 3.8.])[
  (Tensor tests for the ordinary Atiyah class).  #emph[Let $M$ be an object, and let $t_j$ be actual sections of finitely many functorial mixed tensor powers $T_j \( M \)$ of $M$ and $M^or$ on the chart. Direct sums and the usual symmetric or alternating projectors may be used; each construction carries the natural action of every endomorphism of $M$. Put $Q = xor.big_j T_j \( M \)$ and define 
$ Phi_M : underline("End") \( M \) arrow.r Q \, #h(2em) A mapsto \( A dot.op t_j \)_j $

 by the infinitesimal tensor action. The coefficient map for the Atiyah class is the morphism in $cal(C)$ 
#[#set math.equation(numbering: n => "(3.1)")
 $ Psi_M = "id"_V hat(⊗) Phi_M : V hat(⊗) underline("End") \( M \) arrow.r V accent(⊗ Q, ̂) . $ <loc:psi-coefficient>]

 On the smooth locus its ordinary bundle restriction satisfies $\( Psi_(M \, U) \)_(*) a \( M_U \) = 0$ in $H^1 \( U \, \( V accent(⊗ Q, ̂) \)_U \)$. If $overline(Psi_M)$ is injective in $overline(cal(C))$, then $a \( M_U \) = 0$.]
] <loc:atiyah-tests>

#proof[
  The natural tensor action defining $Phi_M$ is a bundle map on $U$; its reflexive extension is the displayed morphism in $cal(C)$. Choose local connections $nabla_alpha$ on $M_U$. Their differences represent $a \( M_U \)$. On $T_j \( M_U \)$ the corresponding differences are the infinitesimal tensor actions of $nabla_alpha - nabla_beta$. Evaluating on the global section $t_j$ gives the coboundary of the local sections $nabla_alpha t_j$. This proves the asserted vanishing after restricting (3.1) to bundles on $U$ and taking ordinary $H^1$.
  An injection in the semisimple quotient has a left inverse there. Lemma 10 lifts it to an actual left inverse between reflexive coefficient modules. Restriction to $U$ gives a split map of bundles, which induces an injection on ordinary $H^1$. Its kernel contains $a \( M_U \)$, so that class is zero. The argument uses only that the individual $t_j$ are actual sections. No algebraic identities among their images in the quotient need hold for the chosen lifts. ◻
]

#thm([Proposition 3.9.])[
  (Connectedness and semisimplicity).  #emph[The reductive group $G$ of Proposition 11 is connected and semisimple.]
] <loc:connected-semisimple>

#proof[
  For a reductive subgroup of a general linear group, the invariant mixed tensors have that subgroup as their simultaneous pointwise stabilizer. Indeed, projectors onto direct summands and all maps between tensor constructions are themselves such tensors. Preserving them is precisely the condition to give a tensor automorphism of the forgetful functor, and tensor reconstruction identifies those automorphisms with the group. Differentiating, its Lie algebra is the common kernel of the infinitesimal tensor-action maps. Since the endomorphism space is finite-dimensional, finitely many tensors suffice for this last kernel.
  Suppose a representation $N$ of $G$ has finite image. Realize it as a direct summand of tensor constructions in $V_(upright("fib"))$, and lift its projector to obtain an actual module $M$. Choose finitely many invariant mixed tensors of $N$ whose infinitesimal stabilizer is the zero Lie algebra. By the definition of the quotient Hom spaces these tensors lift to actual maps from $R$, hence to actual sections on the chart. The map $omega \( overline(Phi_M) \)$ of Lemma 13 has as its kernel this infinitesimal stabilizer inside the full space $"End"_(bb(C)) \( N \)$, and is therefore injective. Thus $overline(Phi_M)$ is injective. Tensoring it with $overline(V)$ preserves injectivity, so $overline(Psi_M)$ is injective and that lemma and Lemma 12 make $M$ free. Therefore $N$ is trivial. The regular representation of the finite component group $G \/ G^compose$ is one such representation. It is trivial only if that component group is trivial. Hence $G$ is connected.
  A character of $G$ corresponds to a rank-one reflexive module on the chart. By analytic $bb(Q)$-factoriality some positive reflexive tensor power of that module is free. Thus the character has finite order. A connected algebraic group has no nontrivial finite-image character. The character group of $G$ is therefore zero. For a connected reductive group its quotient by the derived group is a torus, whose characters detect it; that torus must be trivial. Thus $G$ is semisimple. ◻
]

=== 3.3 The prolongation forced by a nontrivial cotangent block <the-prolongation-forced-by-a-nontrivial-cotangent-block>

For a vector space $T$ and a Lie subalgebra $frak(h) subset "End" \( T \)$, set

$ frak(h)^(\( 1 \)) = { A in "Sym"^2 T^(*) ⊗ T : A \( x \, - \) in frak(h) upright(" for every ") x in T } . $

For a reflexive module $M$, let $"Sym"^(\[ 2 \]) M$ denote the image of the symmetric idempotent $\( 1 + tau \) \/ 2$ on $M accent(⊗ M, ̂)$. It is a reflexive direct summand and restricts to the usual symmetric square on the bundle locus. For a block $V_i$ below with fiber $L_i = omega \( overline(V)_i \)$ and $T_i = L_i^or$, the fiber of its coefficient module is

$ omega #scale(x: 120%, y: 120%)[\(] overline("Sym"^(\[ 2 \]) V_i accent(⊗ V, ̂)_i^or) #scale(x: 120%, y: 120%)[\)] = "Sym"^2 L_i ⊗ L_i^or = "Sym"^2 T_i^(*) ⊗ T_i . $

The intersection defining a prolongation will be taken in this fiber space. We use Lie’s triangularization theorem and complete reducibility for finite-dimensional complex representations, in the forms #cite(label("Cap2016")) Theorem 2.2(2), Corollary 2.2(2), Theorem 2.9. The prolongation spaces belong to the Singer–Sternberg framework #cite(label("SingerSternberg1965")). The infinite-type rank-one criterion is due to Guillemin–Quillen–Sternberg #cite(label("GuilleminQuillenSternberg1967")); see also the proof and attribution in #cite(label("OttazziWarhurst2011")) Section 2.2 and Theorem 2.3. We give the prolongation argument in full, including the separate semisimple-irreducible step from nonzero first prolongation to infinite type.

#thm([Lemma 3.10.])[
  (One-block connection obstruction).  #emph[Lift a decomposition of $V_(upright("fib"))$ into irreducible $G$-modules to a decomposition $V = xor.big_i V_i$ of reflexive modules. Let 
$ frak(h)_i = frak(g) ∩ "End" \( V_(i \, upright("fib")) \) subset "End" \( V_(upright("fib")) \) \, #h(2em) frak(g) = "Lie" \( G \) \, $

 where the endomorphisms in this intersection are zero on every other block. Regard $frak(h)_i$ on $T_i = V_(i \, upright("fib"))^or$ by the dual action. If $frak(h)_i^(\( 1 \)) = 0$, then $V_i$ is free. Consequently every nontrivial irreducible block has $frak(h)_i^(\( 1 \)) eq.not 0$.]
] <loc:block-obstruction>

#proof[
  Local coordinate connections on $Omega_U^1$ are torsion-free. Their differences show that $a \( V_U \)$ belongs to the direct summand
  $ H^1 #scale(x: 120%, y: 120%)[\(] U \, "Sym"^2 V_U ⊗ V_U^or #scale(x: 120%, y: 120%)[\)] subset H^1 #scale(x: 120%, y: 120%)[\(] U \, V_U ⊗ "End" \( V_U \) #scale(x: 120%, y: 120%)[\)] . $
  On the other hand, choose local connections preserving the actual splitting $V_U = xor.big_i \( V_i \)_U$. The off-diagonal endomorphism components of the same cohomology class are zero. These two conditions imply
  #[#set math.equation(numbering: n => "(3.2)")
   $ a \( V_U \) = sum_i a_i \, #h(2em) a_i in H^1 #scale(x: 120%, y: 120%)[\(] U \, "Sym"^2 \( V_i \)_U ⊗ \( V_i \)_U^or #scale(x: 120%, y: 120%)[\)] . $ <loc:diagonal-atiyah>]
  Here is the index check. Block preservation allows only coefficients $V_a ⊗ V_b ⊗ V_b^or$. Symmetry interchanges the first two covariant slots. If $a eq.not b$, its image is an off-diagonal coefficient $V_b ⊗ V_a ⊗ V_b^or$, whose class is zero. Because these are actual direct sums of bundles, the original mixed component is also zero. This leaves precisely the terms in (3.2). In particular $a_i$ is the class $a \( \( V_i \)_U \)$ under the indicated inclusion of its coefficients.
  Choose lifts $t_j$ of finitely many $G$-invariant tensors in natural mixed powers of $V_(upright("fib"))$ cutting out $frak(g)$ infinitesimally. Use them to define $Q$ and $Phi_V$ as in Lemma 13. For the $i$th block set
  $ S_i = "Sym"^(\[ 2 \]) V_i accent(⊗ V, ̂)_i^or . $
  The symmetric inclusion in the first two slots, followed by the diagonal inclusion of the $i$th endomorphism block, gives
  $ dotless.j_i : S_i arrow.r V_i hat(⊗) underline("End") \( V \) . $
  The required one-block coefficient map is
  #[#set math.equation(numbering: n => "(3.3)")
   $ kappa_i = \( "id"_(V_i) hat(⊗) Phi_V \) compose dotless.j_i : S_i arrow.r V_i accent(⊗ Q, ̂) . $ <loc:kappa-coefficient>]
  On $U$ the source of this map is $"Sym"^2 \( V_i \)_U ⊗ \( V_i \)_U^or$. Projecting the first slot of $\( Psi_(V \, U) \)_(*) a \( V_U \) = 0$ onto $\( V_i \)_U$ and using (3.2) gives $\( kappa_(i \, U) \)_(*) a_i = 0$ in ordinary $H^1$.
  Write $L = V_(upright("fib"))$ and $L_i = V_(i \, upright("fib"))$. The kernel of $omega \( overline(Phi_V) \)$ is $frak(g)$ inside $"End"_(bb(C)) \( L \)$. Hence the fiber kernel of (3.3) is the explicit intersection
  #[#set math.equation(numbering: n => "(3.4)")
   $ ker omega \( overline(kappa_i) \) = #scale(x: 120%, y: 120%)[\(] "Sym"^2 L_i ⊗ L_i^or #scale(x: 120%, y: 120%)[\)] ∩ #scale(x: 120%, y: 120%)[\(] L_i ⊗ frak(g) #scale(x: 120%, y: 120%)[\)] quad upright("inside ") L_i ⊗ "End"_(bb(C)) \( L \) . $ <loc:kappa-kernel>]
  Partial evaluation of the first covariant slot by $x in T_i = L_i^or$ is supported on the $i$th endomorphism block. It belongs to $frak(g)$ precisely when it belongs to $frak(h)_i$. The symmetry of the first two slots is the defining symmetry in $frak(h)_i^(\( 1 \))$ on $T_i$. Passing from the action on $L_i$ to the dual action on $T_i$ transposes and changes sign, which leaves this linear kernel unchanged. Thus (3.4) identifies with $frak(h)_i^(\( 1 \))$.
  If the kernel is zero, faithfulness of $omega$ makes $overline(kappa_i)$ injective, hence split injective in the semisimple quotient. Lemma 10 lifts a left inverse for $kappa_i$ between the reflexive coefficient modules. Restricting that left inverse to $U$ makes the induced ordinary $H^1$ map injective. Thus $a_i = 0$ in ordinary $H^1$, and Lemma 12 makes $V_i$ free. A free irreducible object is the tensor unit. This proves the assertion. ◻
]

#thm([Lemma 3.11.])[
  (An auxiliary tensor factor kills prolongation).  #emph[Suppose $T = U ⊗ W$, $dim W > 1$, and $frak(h) subset "End" \( U \) ⊗ "id"_W$. Then $frak(h)^(\( 1 \)) = 0$.]
] <loc:auxiliary-factor>

#proof[
  Write a prolongation tensor as $A \( x \, y \) = A_x \( y \)$ with $A_x in frak(h)$. Fix $x = u ⊗ w_1$ with $w_1 eq.not 0$ and choose $w_2$ independent of $w_1$. For every $v in U$, symmetry gives
  $ \( A_x v \) ⊗ w_2 = A \( u ⊗ w_1 \, v ⊗ w_2 \) = \( A_(v ⊗ w_2) u \) ⊗ w_1 . $
  The two indicated tensor subspaces have zero intersection, so $A_x v = 0$ for every $v$. Thus $A_x = 0$ for every pure tensor $x$, and hence for every $x$. No basis of $W$ invariant under any larger Lie algebra has been assumed. ◻
]

#thm([Lemma 3.12.])[
  (Nonzero prolongation produces a rank-one element).  #emph[Let $frak(h) subset "End" \( T \)$ be semisimple, faithful and irreducible. If $frak(h)^(\( 1 \)) eq.not 0$, then $frak(h)$ contains an endomorphism of rank one.]
] <loc:rank-one-symbol>

#proof[
  Use homogeneous polynomial vector fields on the affine space $T$. Let $frak(p)_(- 1) = T$ be the translations, $frak(p)_0 = frak(h)$, and for $k gt.eq 1$ set
  $ frak(p)_k = { A in "Sym"^(k + 1) T^(*) ⊗ T : A \( x_1 \, dots.h \, x_k \, - \) in frak(h) upright(" for every ") x_1 \, dots.h \, x_k in T } . $
  These spaces form a graded Lie algebra $frak(p) = xor.big_(k gt.eq - 1) frak(p)_k$ under the vector-field bracket. Indeed, differentiating a bracket gives the sum of brackets with derivatives. Induction on the total degree, starting with closure of $frak(h)$ under brackets, proves $\[ frak(p)_i \, frak(p)_j \] subset frak(p)_(i + j)$. The representation also gives $\[ frak(h) \, frak(p)_k \] subset frak(p)_k$ directly.
  Suppose first that $frak(p)$ is finite-dimensional. Its solvable radical is graded, because it is preserved by the scaling automorphisms of this grading. From any nonzero homogeneous polynomial vector field in that radical, successive brackets with translations produce a nonzero constant field. Irreducibility under $frak(h)$ then puts all of $T$ in the radical. Since $frak(p)_1 eq.not 0$, the bracket $\[ T \, frak(p)_1 \]$ is nonzero. It lies in the intersection of the radical with $frak(h)$, a solvable ideal of a semisimple algebra, which is impossible. Thus the radical is zero.
  The grading derivation $D$, acting as $k "id"$ on $frak(p)_k$, must now be inner. Recall a short proof of this fact. For any derivation $D$ of a semisimple algebra $frak(a)$, nondegeneracy of the Killing form gives $z in frak(a)$ such that $E = D - "ad" \( z \)$ satisfies $"tr" \( E "ad" \( x \) \) = 0$ for all $x$. Then
  $ B \( E x \, y \) = "tr" \( \[ E \, "ad" \( x \) \] "ad" \( y \) \) = "tr" \( E "ad" \( \[ x \, y \] \) \) = 0 \, $
  so $E = 0$. Apply this to $frak(a) = frak(p)$ and write $D = "ad" \( z \)$. Comparing homogeneous degrees and using the zero center shows $z in frak(p)_0 = frak(h)$. But $D \|_T = - "id"_T$. This would give a nonzero scalar in the semisimple subalgebra $frak(h) subset frak(s l) \( T \)$, again impossible. Hence $frak(p)$ is infinite-dimensional.
  We make the symbol argument for this last alternative explicit. Let $S = "Sym" T$, and let $frak(h)^perp subset T ⊗ T^(*)$ be the annihilator of $frak(h) subset T^(*) ⊗ T$. Form the finitely generated graded $S$-module
  $ cal(M) = \( S ⊗ T^(*) \) \/ S frak(h)^perp \, $
  where the relations have degree one. Perfect pairing with homogeneous polynomial vector fields identifies $cal(M)_d^(*) = frak(p)_(d - 1)$ for $d gt.eq 0$: annihilating a relation multiplied by $d - 1$ linear factors is exactly the displayed partial-evaluation condition. Since $frak(p)$ is infinite-dimensional, $cal(M)$ is not a finite-length module supported at the origin. Its support thus contains a nonzero point $xi in T^(*) = "Spec" \( S \) \( bb(C) \)$.
  The fiber at $xi$ is
  $ T^(*) \/ { \( xi ⊗ "id" \) \( r \) : r in frak(h)^perp } \, $
  and is nonzero. Choose a nonzero vector $u in T$ annihilating its relation space. Then $chevron.l r \, u ⊗ xi chevron.r = 0$ for every $r in frak(h)^perp$. Hence $u ⊗ xi in frak(h)$. Since both $u$ and $xi$ are nonzero, this is the required rank-one endomorphism. ◻
]

#thm([Lemma 3.13.])[
  (The rank-one root calculation).  #emph[A faithful irreducible representation $T$ of a complex semisimple Lie algebra containing a rank-one endomorphism is the standard representation, or its dual, of $frak(s l) \( T \)$, or the standard representation of $frak(s p) \( T \)$. In particular the Lie algebra is simple.]
] <loc:rank-one-classification>

#proof[
  We give the weight argument, including the exceptional short-root possibilities. Consider in $bb(P) \( frak(h) \)$ the closure of the orbit of a rank-one operator. It consists of rank-one operators, since the rank-at-most-one locus is closed and the zero operator does not occur in projective space. A Borel subgroup has a fixed point on this closure. In this particular linear setting one can see the fixed point directly: triangularize the solvable Borel action, choose the smallest term of an invariant complete flag whose projectivization meets the closure, and intersect there. This projective intersection avoids the preceding hyperplane and is therefore also affine. It is finite; a connected group fixes each of its points. In the adjoint representation a Borel-fixed line is the highest-root line of one simple ideal. The highest root is long. We have therefore found a highest-long-root operator of rank one in one simple ideal.
  An irreducible representation of a direct sum of simple Lie algebras is an external tensor product of their irreducible representations. The rank of this root operator on $T$ is its rank on the indicated factor multiplied by the dimensions of all other factors. Rank one forces those other factors to have dimension one. They act trivially, and faithfulness eliminates them. Thus $frak(h)$ is simple.
  All long roots are Weyl-conjugate. For every long root $alpha$, the raising operator $e_alpha$ has rank one. Restriction to the root $frak(s l)_2$ is a direct sum of irreducibles; a summand of highest weight $m$ contributes rank $m$ to $e_alpha$. There is consequently exactly one two-dimensional standard summand and otherwise only trivial summands. The Cartan subalgebra commuting with this root $frak(s l)_2$ acts on the unique standard summand by a single character. Thus the root reflection $s_alpha$ interchanges exactly two full Cartan weights, each of multiplicity one and differing by $alpha$, and fixes every other full weight. This assertion does not yet exclude a zero weight of higher multiplicity.
  Consider one irreducible component of the subsystem of long roots. Its simple reflections act by distinct transpositions on the set of weights. Adjacent simple roots have a product of reflections of order three, so their transpositions share exactly one vertex. Orthogonal simple roots give commuting transpositions. Two different simple roots cannot give the same transposition, since the difference of the transposed weights would be both roots up to sign. Connectedness of the diagram therefore gives a single connected moving set of vertices. The transpositions generate the full symmetric group on this set.
  Map the augmentation representation on these vertices to the weight space by sending a vertex difference to the corresponding weight difference. The map is nonzero and equivariant. The augmentation representation of a symmetric group is irreducible, so the map is injective. Its image is exactly the span of the root component: consecutive vertex differences are its simple roots, and all differences lie in that span. Conjugating a simple-root transposition shows that every pair difference is a root. Conversely every root in this component arises this way, by conjugacy of its root reflections. The component is therefore of type $A$, with the moving weights the vertices of its standard simplex, up to their common centroid.
  Distinct long-root components have disjoint moving sets. Their transpositions commute, so an overlap could only be an identical pair; the difference of that pair would then belong to two orthogonal root spans, which is impossible. The long roots span the entire Cartan dual. Hence the centroid of a moving simplex, being fixed by its component and by every other component, is zero. A weight moved by no long-root component is zero.
  The ordinary classification of reduced irreducible root systems #cite(label("Cap2016")) Theorem 3.10 now leaves very few cases. For completeness, their long-root subsystems are
  $ upright("root system") & upright("long-root subsystem")\
A_ell & A_ell\
B_ell med \( ell gt.eq 3 \) & D_ell\
C_ell & A_1^ell\
D_ell med \( ell gt.eq 4 \) & D_ell\
E_6 \, E_7 \, E_8 & E_6 \, E_7 \, E_8\
F_4 & D_4\
G_2 & A_2 $
  Here $B_2 = C_2$ and the rank-one cases are $A_1$. For the non-simply-laced rows, this table follows directly from the coordinate roots: the long roots of $B_ell$ and $F_4$ are $plus.minus epsilon.alt_i plus.minus epsilon.alt_j$, those of $C_ell$ are $plus.minus 2 epsilon.alt_i$, and the long roots of $G_2$ form a regular hexagon. In the simply-laced cases every root is long. Thus only $A$, $C$, $B_3$ (where $D_3 = A_3$), and $G_2$ are possible. The Weyl groups of $B_3$ and $G_2$ contain $- "id"$. In those cases the nonzero weights would be respectively a tetrahedron or a triangle with centroid zero. Such a simplex is not preserved by $- "id"$; adjoining zero weights cannot make it centrally symmetric. These two cases are excluded.
  For type $A_ell$, the remaining simplex weights are the standard weights or their negatives. The highest weight is therefore the first or last fundamental weight. Highest-weight uniqueness #cite(label("Cap2016")) Theorem 4.3 identifies $T$ with the standard module or its dual. For type $C_ell$, the long roots are $plus.minus 2 epsilon.alt_j$; each centered two-vertex simplex is ${ epsilon.alt_j \, - epsilon.alt_j }$. The highest weight is $epsilon.alt_1$, so highest-weight uniqueness gives the standard symplectic module. In both cases this last uniqueness statement excludes any additional zero-weight multiplicity. The root-system and highest-weight facts used here are the usual finite-dimensional characteristic-zero theorems; the rank-one and simplex deductions have been proved above. ◻
]

#thm([Theorem 3.14.])[
  (Structure of the residual tensor group).  #emph[For a maximal chart there is a decomposition 
#[#set math.equation(numbering: n => "(3.5)")
 $ V_(upright("fib")) = upright(bold(1))^(xor s) xor xor.big_(i = 1)^r L_i \, #h(2em) G = product_(i = 1)^r G_i \, #h(2em) G_i = "SL" \( L_i \) med upright("or") med "Sp" \( L_i \) \, $ <loc:group-product>]

 where each $G_i$ acts by its standard representation on $L_i$ and trivially on all other summands. There are no repeated nontrivial irreducible summands. We place $"SL"_2 = "Sp"_2$ in the symplectic list. The integer $s$ is the number of free rank-one direct summands of $V$.]
] <loc:slsp>

#proof[
  By Proposition 14, $frak(g)$ is semisimple. The one-block algebra $frak(h)_i$ of Lemma 15 is an ideal of $frak(g)$, hence semisimple. Split off its complementary ideal. On the irreducible dual of the $i$th block the representation is $U ⊗ W$, with $frak(h)_i$ acting on $U$. If $dim W > 1$, Lemma 16 makes the first prolongation zero, contrary to Lemma 15 for a nontrivial block. Therefore $frak(h)_i$ acts irreducibly there. It acts faithfully, since its elements act by zero on every other block and the total representation is faithful. Lemmas 17 and 18 identify it with the full special linear or symplectic algebra in its standard module.
  The ideals so obtained for distinct blocks commute, since each is zero on all the other blocks. A remaining complementary semisimple ideal would commute with these irreducible standard actions. By Schur’s lemma it would act by scalars on each block; a semisimple Lie algebra has no scalar character. It also acts trivially on the trivial blocks, so faithfulness eliminates it. If two nontrivial blocks were isomorphic as $frak(g)$-modules, an element acting trivially on one would act trivially on the other; their one-block ideals would be zero. This again contradicts Lemma 15.
  It remains to check the group, rather than just its Lie algebra. Take the simply connected covering group of the connected semisimple group $G$. Its factors are the indicated $"SL"$ and $"Sp"$ groups. Each factor acts faithfully by its standard representation on its own block, and trivially on the others. Thus the kernel on the full representation is trivial, including any proposed central or diagonal central subgroup. The covering map is therefore an isomorphism and its image is the blockwise product in (3.5). Finally a trivial summand in the trace quotient is an actual free summand by Lemma 10, and conversely. This identifies $s$ as claimed. ◻
]

#thm([Corollary 3.15.])[
  (A unique exterior constituent).  #emph[In the notation of Theorem 19, suppose $r > 0$ and put $W = xor.big_(i = 1)^r L_i$. There are a simple $G$-module $E$ and an integer $1 lt.eq j_0 lt.eq dim W$ such that, for $0 lt.eq b lt.eq dim W$, 
$ dim_(bb(C)) "Hom"_G \( E \, Lambda^b W \) = cases(delim: "{", 1 \, & b = j_0 \,, 0 \, & b eq.not j_0 .) $

 The multiplicity of $E$ in $Lambda^(j_0) V_(upright("fib"))$ is also one. The selection of $E$ is intrinsic to the standard factors and is preserved by permutations of the factors.]
] <loc:exterior-constituent>

#proof[
  For a standard $"SL"_m$ block with $m > 2$, select its degree-one representation. The exterior powers in degrees $1 \, dots.h \, m - 1$ are irreducible with distinct highest weights, while degrees $0$ and $m$ are trivial. The selected representation therefore occurs once and in degree one only.
  For a standard $"Sp"_(2 m)$ block $L_i$, select
  $ P_i^m = ker #scale(x: 120%, y: 120%)[\(] Lambda^m L_i arrow.r Lambda^(m - 2) L_i #scale(x: 120%, y: 120%)[\)] \, $
  where the arrow is symplectic contraction and negative exterior powers are zero. The primitive decomposition
  $ Lambda^b L_i tilde.eq xor.big_(a = 0)^(floor.l min \( b \, 2 m - b \) \/ 2 floor.r) P_i^(min \( b \, 2 m - b \) - 2 a) $
  has irreducible, mutually distinct primitive terms $P_i^s$ of highest weight $pi.alt_s$ #cite(label("FultonHarris1991")) Theorem 17.5. Thus $P_i^m$ occurs once and only for $b = m$. This includes $"SL"_2 = "Sp"_2$.
  Take the external tensor product of the selected representations. It is simple for the product group and occurs in $Lambda^bullet W$ once, in a single degree $j_0$. In $Lambda^(j_0) V_(upright("fib"))$ it still has multiplicity one: a positive exterior degree from the trivial summand would require its occurrence in a smaller degree of $W$. The factorwise rule is preserved by permutations. In the symplectic case the kernel defining $P_i^m$ is also unchanged when the symplectic form is rescaled, so the selection has the asserted intrinsic meaning. ◻
]

== 4 A closed stratum and compatible algebraic products <sec:stratum>

We turn the free part of the local cotangent module into a closed geometric stratum, then construct algebraic product presentations along it. The transition maps preserve its marked ideal at every order. This supplies a single system in which the ambient tensor maps and the coherent coefficients supported on finite thickenings can be compared.

For a normal complex analytic germ $\( V \, v \)$ put

$ D_v = "im" #scale(x: 120%, y: 120%)[\(] T_V zws_v arrow.r T_(V \, v)^(upright("Zar")) #scale(x: 120%, y: 120%)[\)] \, #h(2em) r \( v \) = dim_(bb(C)) D_v . $

Here the arrow evaluates a germ of a derivation at $v$, and $T_V = "Hom" \( Omega_V^1 \, cal(O)_V \)$. All germs in the next two lemmas are finitely dominated by smooth germs of the same dimension, as supplied by Proposition 8.

#thm([Lemma 4.1.])[
  (Evaluation and smooth factors).  #emph[The largest rank of a free direct summand of $Omega_V^(\[ 1 \]) zws_v$ is $r \( v \)$. There is an analytic product decomposition 
#[#set math.equation(numbering: n => "(4.1)")
 $ \( V \, v \) tilde.eq \( Delta^(r \( v \)) \, 0 \) times \( T \, t \) \, $ <str:analytic-product>]

 where all vector fields on $\( T \, t \)$ have zero evaluation at $t$. Moreover, if $beta$ is a reflexive one-form and a vector field $xi$ has zero evaluation at $v$, then $beta \( xi \) \( v \) = 0$.]
] <str:evaluation>

#proof[
  We first prove the last assertion, which is stronger than the analogous statement for ordinary differentials. A derivation has a local holomorphic flow: after embedding the germ in a polydisc, lift its coordinate values to an ambient vector field and solve the holomorphic differential equation. Preservation of the defining ideal makes the flow preserve the embedded analytic space. If the derivation evaluates to zero, its flow $phi.alt_z$ fixes $v$.
  Choose a finite smooth cover $a : \( Y \, y \) arrow.r \( V \, v \)$ and consider $H \( z \, w \) = phi.alt_z \( a \( w \) \)$. The map $\( z \, w \) mapsto \( z \, H \( z \, w \) \)$ is finite: it is $"id"_Delta times a$ followed by the flow automorphism of $Delta times V$. Thus the inverse image of $Delta times V_(upright("sing"))$ has codimension at least two. The pullback of $beta$ from $V_(upright("reg"))$ consequently extends to a holomorphic one-form $alpha$ on the smooth space $Delta times Y$.
  We claim that $alpha$ restricts to zero on $C = Delta times { y }$. To check this, pull a fixed finite smooth cover $a_0 : Y_0 arrow.r V$ back by $H$, normalize a component dominating $Delta times Y$, and resolve it. The resulting diagram has a proper dominant map $q$:
  $ tilde(W) & arrow.r^(med g med) & Y_0\
q arrow.b &  & arrow.b a_0\
Delta times Y & arrow.r^(med H med) & V . $
  The pullback of $beta$ extends to a holomorphic form $beta_0$ on $Y_0$. On $tilde(W)$ the forms $q^(*) alpha$ and $g^(*) beta_0$ agree, since they agree on a dense open. An irreducible subvariety of $q^(- 1) \( C \)$ dominating $C$ maps under $g$ to a point of the finite fiber $a_0^(- 1) \( v \)$. Restriction to a resolution of that subvariety therefore annihilates $q^(*) alpha$. Pullback of one-forms from the smooth curve $C$ under a dominant map is injective in characteristic zero, proving the claim. Finally, the definition of the flow gives the identity
  $ alpha (frac(partial, partial z))\|_(z = 0) = a^(*) \( beta \( xi \) \) . $
  It holds first over the regular locus and then everywhere by holomorphic extension. Evaluation at $y$, using $alpha \|_C = 0$, yields $beta \( xi \) \( v \) = 0$.
  Suppose that $Omega_V^(\[ 1 \]) zws_v$ has a free summand with basis $beta_1 \, dots.h \, beta_s$ and dual vector fields $xi_1 \, dots.h \, xi_s$. A linear combination of their evaluations that vanishes pairs to zero with every $beta_j$ by the preceding paragraph. The identities $beta_j \( xi_i \) = delta_(i j)$ imply independence of the evaluations. Thus $s lt.eq r \( v \)$.
  Conversely choose vector fields with $r = r \( v \)$ independent evaluations and regular functions $z_1 \, dots.h \, z_r$ with $xi_i \( z_j \) \( v \) = delta_(i j)$. Cut a transverse germ by $z_1 = dots.h.c = z_r = 0$. Successive flows of the chosen fields define a map from a polydisc times this transverse germ to $V$. To invert it, apply the inverse flows and solve for their times by the analytic implicit function theorem; its Jacobian in the time variables is the identity at $v$. This argument works in an ambient embedding and hence also on the embedded germ. The resulting product has $r$ free cotangent summands. The transverse factor cannot have a vector field with nonzero evaluation, since such a field would give an additional independent evaluation on the product. ◻
]

#thm([Lemma 4.2.])[
  (The rank-locus dimension bound).  #emph[On such a normal germ, the locus ${ v : r \( v \) lt.eq a }$ is closed analytic and has dimension at most $a$.]
] <str:rank-locus>

#proof[
  Coherence of the sheaf of derivations, followed by evaluation on finitely many ambient coordinates, expresses the condition by minors of a matrix of holomorphic functions. For the dimension assertion we use the following trace observation. If $pi : \( Y \, y \) arrow.r \( V \, v \)$ is a finite map from a smooth germ, with this single point over $v$, and $m$ is its degree, then a vector field $eta$ on $Y$ induces the derivation
  #[#set math.equation(numbering: n => "(4.2)")
   $ a mapsto 1 / m "Tr"_(bb(C) \( Y \) \/ bb(C) \( V \)) #scale(x: 120%, y: 120%)[\(] eta \( pi^(*) a \) #scale(x: 120%, y: 120%)[\)] . $ <str:trace-derivation>]
  The trace is holomorphic by integrality and normality, and the Leibniz rule follows from linearity of trace over $cal(O)_V$. At $v$, the trace of a holomorphic function on this local branch is $m$ times its value at $y$. Consequently the evaluation of (4.2) is exactly $d pi_y \( eta_y \)$. A local branch can be isolated analytically even if the original finite cover has several points over $v$. We obtain
  #[#set math.equation(numbering: n => "(4.3)")
   $ d pi_y \( T_(Y \, y) \) subset D_v . $ <str:differential-image>]
  Let $Z$ be an irreducible subvariety of the rank locus. A component of its reduced inverse image under a finite smooth cover dominates $Z$. At general smooth points of this component and of $Z$, the restricted finite map has differential rank $dim Z$, by characteristic zero. Equation (4.3) therefore gives $dim Z lt.eq a$. ◻
]

Define $s \( b \)$ to be the free cotangent rank on a maximal chart at $b$. It is independent of the choices in Proposition 8; it is also the multiplicity of the tensor unit in Theorem 19.

#thm([Proposition 4.3.])[
  (The minimum stratum).  #emph[Let $d = min_(b in B) s \( b \)$. If $d = n$, every germ of $B$ is a quotient singularity. Otherwise the minimum locus is a nonempty closed algebraic subset. Each of its connected components $S_0$ is irreducible, normal and projective of dimension $d$. On a maximal chart over a point of $S_0$, its reduced inverse image is, as a germ of a pair, 
#[#set math.equation(numbering: n => "(4.4)")
 $ \( V \, S_V \) tilde.eq \( Delta^d times T \, Delta^d times { t } \) . $ <str:minimum-pair>]

 At every point of $S_V$, the vector-field evaluation space is exactly the tangent space to $S_V$. There is a smooth separated Deligne–Mumford stack $cal(S)$ with coarse space $S_0$ whose charts are these smooth factors. Its stabilizers are the full deck stabilizers, including those acting trivially on the smooth factor.]
] <str:minimum>

#proof[
  Smooth factors persist under further finite local quasi-étale covers. Indeed such a cover is étale over the smooth locus by purity, and a cover of $Delta^r times T_(upright("reg"))$ is pulled back from $T_(upright("reg"))$, since the polydisc is simply connected. Normalization extends the product across the omitted codimension-two set. More precisely, if $c'$ is any nearby point on a finite quasi-étale chart over $b'$, its pointed local branch is dominated by a maximal cover of $\( B \, b' \)$. Each of its $r \( c' \)$ smooth factors persists on that cover, so $r \( c' \) lt.eq s \( b' \)$. A product with $r$ smooth directions therefore implies $s gt.eq r$ throughout its image. Each pointed finite branch dominates its base germ, so the image of a sufficiently small neighborhood contains a neighborhood downstairs. Along the smooth factor through its marked point, the transverse germ is unchanged; the same description of covers shows that its maximal-cover property is unchanged as well. Hence $s$ is lower semicontinuous in the analytic topology and is constant along that factor.
  At a minimum point choose the product in Lemma 21. The preimage of the minimum locus lies in the evaluation-rank locus $r lt.eq d$: any extra smooth factor at another point of this chart would persist on its maximal cover. The rank locus on the full chart is the product of $Delta^d$ with the transverse rank-zero locus $Z$. Apply Lemma 22 to this full chart, which is finitely dominated by a smooth germ. It gives $d + dim Z lt.eq d$, so the germ of $Z$ at the marked point is just that point. Conversely the whole smooth factor has the original maximal transverse type. This proves (4.4) and also proves that the minimum locus is locally analytic, rather than merely topologically closed.
  Its closedness and projectivity of $B$ make it algebraic by Chow’s theorem. Locally it is a finite quotient of the smooth orbit by its deck stabilizer, and hence is normal. Distinct irreducible components of a normal variety are disjoint, so a connected component is irreducible. If $d = n$, Lemma 21 makes every maximal chart smooth, which is exactly the quotient-singularity assertion. The construction of the stack, with its specified stabilizers, is included in Proposition 25 below. ◻
]

From now on fix such a component with $d < n$, and put $c = n - d > 0$. We first prove the precise algebraization statement needed for its neighborhood.

#thm([Lemma 4.4.])[
  (Algebraizing a marked product).  #emph[Let $\( V \, v \)$ be an algebraic complex germ, let $S subset V$ be a reduced closed subgerm, and suppose the analytic pair is $\( Delta^d times T \, Delta^d times { t } \)$. There are an algebraic transverse germ $\( T_0 \, t_0 \)$ and common étale neighborhoods of pairs 
#[#set math.equation(numbering: n => "(4.5)")
 $ \( V \, S \) med arrow.l med \( U \, S_U \) med arrow.r med \( bb(A)^d times T_0 \, bb(A)^d times { t_0 } \) . $ <str:etale-product-pair>]

 Both inverse-image ideals defining $S_U$ are equal, without truncation. For $k gt.eq 1$, put $A_k = cal(O)_(T_0 \, t_0) \/ frak(m)_(t_0)^k$ and let $U_k$ be defined by the $k$th power of this common ideal. After shrinking the displayed neighborhoods, there are compatible isomorphisms 
#[#set math.equation(numbering: n => "(4.6)")
 $ U_k tilde.eq S_U times "Spec" A_k quad upright("over") quad bb(A)^d times "Spec" A_k . $ <str:finite-product>]

 No equivariance of these product isomorphisms is asserted.]
] <str:marked-artin>

#proof[
  Choose algebraic functions $z_1 \, dots.h \, z_d$ whose restrictions give independent cotangents on $S$ at $v$, and define $T_0$ by their vanishing. In the given analytic product these functions may replace the polydisc coordinates: their Jacobian in those coordinates is invertible. The analytic implicit function theorem, with the transverse germ retained, identifies the resulting transversal with $T$ and gives a formal isomorphism of the algebraic pointed pairs in (4.5).
  Here is why approximation can retain the marked ideal exactly. Write finite algebra presentations for the target product and generators $a_1 \, dots.h \, a_h$ and $b_1 \, dots.h \, b_l$ for its marked ideal and the ideal of $S$ in $V$, respectively. Besides the target’s defining equations, include unknown coefficients in the finitely many equations
  $ phi \( a_i \) = sum_j u_(i j) b_j \, #h(2em) b_j = sum_i v_(j i) phi \( a_i \) . $
  The formal pair isomorphism supplies a solution. Artin approximation over the henselization of the algebraic local ring produces a solution in an étale neighborhood, arbitrarily close to that formal solution; this is the polynomial-equation form of #cite(label("StacksProject")) Tags 0CAU and 0CAV. Denominators in local presentations can be included by equations for their inverses. The displayed equations give the two ideal inclusions exactly.
  Choose approximation modulo the square of the maximal ideal. Composing the resulting map on completions with the original formal inverse gives an endomorphism that is the identity on residue field and cotangent space. It is the identity on the associated graded ring, which is generated in degree one. Induction on the powers of the maximal ideal and completeness show that it is an isomorphism. Thus the second map in (4.5) induces an isomorphism of completed local rings and is étale at the marked point; shrink to its étale locus. This verifies the inverse-map issue even for a singular transversal.
  The restriction $S_U arrow.r bb(A)^d$ is étale. Both $U_k$ and $S_U times "Spec" A_k$ are étale over $bb(A)^d times "Spec" A_k$ and have the same reduction over $bb(A)^d$. Uniqueness of lifting morphisms between étale schemes through a nilpotent thickening gives (4.6) #cite(label("StacksProject")) Tag 025H. The same uniqueness makes the isomorphisms compatible as $k$ varies. Notice that this last argument uses the equality of the two ideals, not closeness of those ideals to some finite order. ◻
]

#thm([Proposition 4.5.])[
  (Compatible product presentations).  #emph[The following data exist along $S_0$.]
  + #emph[There are finitely many normal finite Galois quasi-étale charts $V_alpha arrow.r B_alpha$, with deck groups $Gamma_alpha$ and with $B_alpha arrow.r B$ separated and étale, covering $S_0$. They are maximal at every point over $S_0$.]
  + #emph[Normalized main overlaps give an étale groupoid along the reduced inverse images $S_alpha subset V_alpha$. Its quotient is the stack $cal(S)$ of Proposition 23. Writing $I$ for the marked ideal on the object charts, the same finite diagrams define, for every $k gt.eq 1$, a proper separated Deligne–Mumford stack $cal(S)_k$, with $cal(S)_1 = cal(S)$. Its coarse space is finite over $B$ and projective.]
  + #emph[A finite family of étale refinements of the object charts covers their closed strata and has the marked-product presentations of Lemma 24. All transition maps come from the normalized ambient overlaps and preserve $I$ exactly. Their restrictions are consequently compatible for all powers $I^k$.]
  + #emph[The normalized source charts give ordinary pullback and descent of coherent sheaves on any $cal(S)_k$ to coherent sheaves on $X$ supported over $S_0$.]
  #emph[These assertions are encoded by finitely many algebraic schemes, morphisms, ideals and identities. In particular they can be spread simultaneously before choosing any order of Frobenius pullback.]
] <str:products>

#proof[
  Start with a chart maximal at one point, as in Proposition 8. By (4.4) and Lemma 24, its transverse analytic type is constant along the part of $S_alpha$ covered by one common étale product neighborhood. The image is open in $S_alpha$, because an étale map is open. Every point there still has a maximal germ, since the transverse germ and its covers have not changed. Take the union of translates of this open neighborhood around the finite deck orbit over the base point. The complement in $S_alpha$ has closed image under the finite chart map. Removing that image downstairs arranges maximality at every point over the remaining stratum. Quasi-compactness of $S_0$ gives the finite list in (1). Applying Lemma 24 at its inverse images and using quasi-compactness gives a finite family of product refinements as in (3).
  We construct the groupoids while keeping the full finite normalizations. Put $V = product.co_alpha V_alpha$. Choose a common dense open $B^compose subset B_(upright("reg"))$ over which all the charts are étale, and write $V^compose = V times_B B^compose$. For $a = 2 \, 3 \, 4$, let $W_a$ be the reduced union of the irreducible components of $V^(times_B a)$ meeting $\( V^compose \)^(times_(B^compose) a)$, and let
  $ overline(V)_a = W_a^nu $
  be its full normalization. It is finite over the closed subscheme $W_a subset V^(times_B a)$. Its restriction over $B^compose$ is the ordinary product, which is étale over the smooth space $B^compose$ and therefore normal. Write $overline(R) = overline(V)_2$, with projections $s \, t : overline(R) arrow.r V$.
  The projections of these normalizations are étale at every point over $S_0$. To see this locally, pass to a common étale base neighborhood for the chosen object charts. A projection is there a finite quasi-étale map followed by an étale map: away from the codimension-two branch loci it is a base change of the original charts, and finiteness preserves that codimension bound. Each pointed target chart over $S_0$ is maximal, so every connected local finite quasi-étale factor is trivial. This proves the asserted étaleness.
  We will also need an arrow through every pair of object points over a point of $S_0$. Pass to the common strict henselian base germ at that point and select the pointed local factors of the two finite charts. By the algebraic–analytic comparison in Proposition 8, the maximality at these points also gives maximality of the selected strict henselian factors. They are therefore isomorphic over this germ. The graph of such an isomorphism is a main branch of their product and passes through the chosen pair. Normalization commutes with this strict henselian base change: the base change of a finite normalization is normal under étale localization and has the same generic normalization property, and the assertion passes to the filtered strict henselian limit. The graph branch therefore supplies a point of $overline(R)$ over the chosen pair. This proves the assertion for the original algebraic charts.
  Let $R subset overline(R)$ be the open where both $s$ and $t$ are étale. It contains the entire inverse image of $S_0$. Let $I_alpha$ be the reduced ideal of $S_alpha$ and let $I$ be their union on $V$. On the full normalization define the extended ideals
  $ J_s = "im" \( s^(*) I arrow.r cal(O)_(overline(R)) \) \, #h(2em) J_t = "im" \( t^(*) I arrow.r cal(O)_(overline(R)) \) . $
  Their zero sets are both the inverse image of $S_0$. On $R$ they are equal: the two étale pullbacks are reduced and have that same support. Let $V_k subset V$ be defined by $I^k$, and define $R_k$ to be the closed subscheme of the full $overline(R)$ defined by $J_s^k$. Its entire support lies in $R$, so
  $ R_k = R times_(s \, V) V_k = R times_(t \, V) V_k . $
  In particular its two maps to $V_k$ are étale. The map to $V times_B V$ factors through $V_k times_B V_k$, because both extended ideals vanish to order $k$ on $R_k$. The resulting map $R_k arrow.r V_k times_B V_k$ is finite: it is a closed quotient of the full finite normalization, with a factorization through that closed subscheme. This is the finiteness used below.
  Here are the normalization comparisons needed for composition. Put
  $ P = R times_(t \, V \, s) R . $
  It is normal, since it is étale over the normal object charts. Every irreducible component of $P$ meets the open over $B^compose$: its image under an étale projection to an object component is a nonempty open, and therefore meets the dense $V^compose$. Over $B^compose$, the scheme $P^compose$ is an open subscheme of the ordinary triple product $\( V^compose \)^(times_(B^compose) 3)$. Hence each component of $P$ maps dominantly onto a main component of $W_3$. Its generic map lifts to that component of $overline(V)_3$, and the lift extends over the normal component of $P$. Indeed, each element of the finite normalization is integral over the local target ring; its generic pullback is integral over a normal local ring of $P$ and so belongs to that ring. This constructs $P arrow.r overline(V)_3$.
  The three pair-forgetting maps $overline(V)_3 arrow.r W_2$ lift in the same way to maps $rho_01 \, rho_12 \, rho_02 : overline(V)_3 arrow.r overline(R)$. Componentwise dominance here follows on $B^compose$: each projection of the ordinary triple product is étale, and its nonempty image is open in the corresponding ordinary pair component. Let
  $ O_3 = rho_01^(- 1) \( R \) ∩ rho_12^(- 1) \( R \) . $
  It contains the entire inverse image of $S_0$, and its two adjacent pairs give a map $O_3 arrow.r P$. Conversely, the adjacent pair maps of $P arrow.r overline(V)_3$ agree with the two projections $P arrow.r R$ on the dense unbranched open, hence on $P$; the lift therefore lands in $O_3$. This map and $O_3 arrow.r P$ are inverse between $O_3$ and $P$. Their composites are the identity on the componentwise dense ordinary unbranched products; equality extends because the sources are reduced and the targets separated. Restrict further to $O'_3 = O_3 ∩ rho_02^(- 1) \( R \)$, which still contains the entire closed support. The map $rho_02$ gives composition there.
  On $P$ the three extended ideals from the object coordinates are equal, by the equality $J_s = J_t$ on each arrow. Call their common ideal $J$. Base change by the closed immersions therefore gives the scheme equality
  $ R_k times_(V_k) R_k = P \/ J^k . $
  Its support is the whole inverse image of $S_0$ in $P$, hence lies in the domain corresponding to $O'_3$. The three ideals agree there also along $rho_02$, so composition restricts to $R_k times_(V_k) R_k arrow.r R_k$ for every $k$.
  For associativity use $R times_V R times_V R$ and $overline(V)_4$. The same argument applies component by component: the former is normal, and its unbranched part is open in the ordinary quadruple product and meets every component. Each component therefore dominates a main component of $W_4$, while all pair-forgetting projections are dominant onto their main pair components there. It identifies with the open of $overline(V)_4$ where the adjacent pairs $01 \, 12 \, 23$ land in $R$. Restrict to the further open where $02 \, 13 \, 03$ also land in $R$. Every one of these opens contains the entire inverse image of $S_0$. Both parenthesizations are defined on this last open and agree on its componentwise dense unbranched product, hence agree everywhere. Their restrictions agree on every quotient by the common $k$th power of the stratum ideal. Interchanging the two coordinates lifts to the normalization $overline(R)$ and gives inversion on the open where both the original and interchanged arrow land in $R$. The diagonal of the ordinary unbranched pair product is open and closed; its main branch lifts the diagonal map from the normal $V$ to $overline(R)$. Restricting to the inverse image of $R$ gives the unit. These domains contain the entire closed support, by the étaleness of all pair points over $S_0$. The unit and inverse identities follow on their support-containing domains by the same dense-open comparison and then restrict to all $k$. Thus $R_k arrows.rr V_k$ is an étale groupoid. Four factors suffice because associativity is the only law involving three composable arrows.
  Since $B$ is separated, $V_k times_B V_k$ is closed in $V_k times V_k$. The finiteness proved above therefore makes the diagonal of $\[ V_k \/ R_k \]$ finite. This quotient is a separated Deligne–Mumford stack with finite inertia. Its local finite quotient presentation can be read after base change to $B_alpha$. The diagonal $B_alpha arrow.r B_alpha times_B B_alpha$ is open and closed, since $B_alpha arrow.r B$ is separated and étale. On that component the self-overlap is the normalization of $V_alpha times_(B_alpha) V_alpha$, namely $product.co_(gamma in Gamma_alpha) V_alpha$ with its distinct deck labels. The existence of a main arrow through every pair of closed object points, proved above, makes the other object charts étale refinements of this presentation: the relevant arrow projections are étale and surjective on the closed support, which is the underlying support of every $V_k$. Consequently over $B_alpha$ the stack is
  $ \[ thin \( V_alpha \)_k \/ Gamma_alpha thin \] . $
  Its coarse algebra is precisely
  $ \( cal(O)_(V_alpha) \/ I_alpha^k \)^(Gamma_alpha) = cal(O)_(B_alpha) \/ \( I_alpha^k ∩ cal(O)_(B_alpha) \) . $
  Here the intersection is the contracted ideal in the finite chart algebra; exactness of finite-group invariants in characteristic zero gives the equality. These finite algebras glue étale locally. They give a coarse space finite over the projective variety $B$, and therefore projective. A quotient by a finite group is proper over its coarse space, so the stack is proper. At $k = 1$ the coarse space is $S_0$ and the object charts are smooth, giving $cal(S)_1 = cal(S)$.
  The construction keeps the label of every $gamma in Gamma_alpha$ even when it fixes the whole smooth factor. Stabilizers may increase on closed subsets of $S_alpha$, and remain subgroups of these fixed finite deck groups. The ambient groupoid laws and their restrictions therefore retain the full stabilizers on $cal(S)$.
  For (4), write $X_alpha arrow.r V_alpha$ for the normalized source chart. Proposition 8 makes $X_alpha arrow.r X times_B B_alpha$ a finite étale $Gamma_alpha$-torsor. The normalized overlaps give its ordinary descent identifications. The ideals $I_alpha^k cal(O)_(X_alpha)$ descend to a coherent ideal near $f^(- 1) \( S_0 \)$; gluing it with the unit ideal off this closed set gives a closed subscheme $X_k subset X$. This is the descended ideal quotient, with no identification with a fiber product over the coarse thickening required. Put $X_(alpha \, k) = X_alpha \/ I_alpha^k cal(O)_(X_alpha)$. The local diagram
  $ X_(alpha \, k) & arrow.r & \( V_alpha \)_k\
arrow.b &  & arrow.b\
\[ X_(alpha \, k) \/ Gamma_alpha \] & arrow.r & \[ \( V_alpha \)_k \/ Gamma_alpha \] $
  is $2$-Cartesian. Its lower left quotient is the descended scheme $X_k times_B B_alpha$, because the source action is a torsor. These diagrams glue to a map $f_k : X_k arrow.r cal(S)_k$. For a coherent sheaf $M$ on $cal(S)_k$, the ordinary sheaves $cal(O)_(X_(alpha \, k)) ⊗_(cal(O)_(\( V_alpha \)_k)) M_alpha$ descend to a coherent sheaf on $X_k$, and then on $X$. Increasing $k$ does not change this pullback, denoted $f^(*) M$. The displayed Cartesian diagram is also the reason that ordinary chart base change and the canonical higher-direct-image coefficient maps descend. After the product refinements in (3), these constructions are their ordinary étale pullbacks from the finite charts.
  All schemes, full finite normalizations, group actions, product maps, marked ideals and maps in the diagrams with at most four factors are of finite type. Their identities, ideal inclusions, and the disjointness of each omitted closed complement from its closed support are finitely many algebraic conditions. Individual marked pairs were approximated in Lemma 24; their transition maps are the normalized algebraic maps just constructed. This proves the asserted finite nature of the compatible data. ◻
]

We write $hat(cal(B))$ for the compatible formal system $\( cal(S)_k \)_(k gt.eq 1)$. There are two kinds of sheaves in use on this system. First, an ambient reflexive tensor object $cal(M)_alpha$ on each normal chart, with its natural étale transition isomorphisms, gives the completed system

$ M = \( M_k \)_(k gt.eq 1) \, #h(2em) M_(alpha \, k) = cal(M)_alpha \/ I_alpha^k cal(M)_alpha . $

In particular, for $0 lt.eq j lt.eq n$ we use

$ cal(N)_(j \, alpha) = Omega_(V_alpha)^(\[ j \]) \, #h(2em) N_j = \( N_(j \, k) \)_(k gt.eq 1) . $

The notation $Omega_(hat(cal(B)))^(\[ j \])$ will mean this completed ambient system. It does not refer to an intrinsic reflexive differential sheaf on the nonreduced $cal(S)_k$.

The ambient Hom sheaf for two such objects is

$ cal(H)_(alpha \, M N) = cal(H) o m_(V_alpha) \( cal(M)_alpha \, cal(N)_alpha \) . $

It has the natural étale transition maps, and we write

$ hat(cal(H))_(M N) = #scale(x: 120%, y: 120%)[\(] cal(H)_(alpha \, M N) \/ I_alpha^k cal(H)_(alpha \, M N) #scale(x: 120%, y: 120%)[\)]_(k gt.eq 1) $

for its completed system. On an adic complete chart this is the Hom module of the completed ambient modules: completion is flat for noetherian rings and Hom commutes with flat base change for finite presentations. Composition and trace are induced by their ambient maps. Put

$ N = xor.big_(j = 0)^n N_j \, #h(2em) cal(E) = hat(cal(H))_(N N) . $

Thus $cal(E)$ is completed from the ambient endomorphism sheaf before any quotient is taken.

Second, a bounded-support coefficient is a coherent sheaf $M$ on some $cal(S)_k$, regarded at larger orders by pushforward along the closed immersions. For such a coefficient, $N_j ⊗ M$ means the ordinary tensor product $N_(j \, k) ⊗_(cal(O)_(cal(S)_k)) M$ at any sufficient order. Its pullback to $X$ is the ordinary pullback constructed in Proposition 25. This use of coefficients is separate from the completed ambient systems. In particular the full truncated endomorphism sheaf

$ cal(E) n d_(cal(S)_k) (xor.big_j N_(j \, k)) $

is allowed to have maps that do not lift to ambient endomorphisms. The natural map from $cal(E) \/ I^k cal(E)$ to this full sheaf may be neither injective nor surjective.

For ambient objects $M \, N$, define their barred Hom sheaf on $cal(S)$ by the residual trace pairing:

#[#set math.equation(numbering: n => "(4.7)")
 $ overline("Hom") \( M \, N \) = frac(hat(cal(H))_(M N) \|_(cal(S)), ker [hat(cal(H))_(M N) \|_(cal(S)) arrow.r \( hat(cal(H))_(N M) \|_(cal(S)) \)^or \, quad a mapsto #scale(x: 120%, y: 120%)[\(] b mapsto "tr" \( b a \) #scale(x: 120%, y: 120%)[\)]]) . $ <str:barred-hom>]

We put $overline(cal(E)) = overline("Hom") \( N \, N \)$. For the fixed natural tensor expressions and structural maps used here, Lemma 26 below shows that these are locally free and that their fibers are the trace quotients of the corresponding local tensor objects. A residual direct summand is then handled by the image of its idempotent on these bundles; it is locally a direct summand bundle as well. Cyclicity and partial trace make the kernels in (4.7) a tensor ideal, so composition and the indicated tensor operations descend to these quotients.

Coarse and chart ideals give cofinal filtrations: on a finite chart the radical of the extended coarse ideal is $I_alpha$, so suitable powers contain one another by noetherianity. A finite cover makes these comparisons uniform.

#thm([Lemma 4.6.])[
  (Uniform transverse calculations).  #emph[On the finite family of product refinements in Proposition 25, the ambient sheaves $cal(N)_j = Omega^(\[ j \])$, the fixed natural mixed reflexive tensor expressions in them, and their ambient Hom and trace maps have fixed transverse descriptions. Their completed systems at order $k$ are obtained from fixed finite modules over $A_k$ by extension along the smooth factor. The same holds for kernels and images of the resulting fixed transverse maps. Residual retracts are obtained by applying their idempotents to the resulting barred bundles. In particular the barred Hom sheaves in (4.7) are locally free on $cal(S)$ and their fibers are the local residual trace Hom spaces.]
  #emph[Consequently a property of these modules and maps that, for each fixed transverse complete ring, holds at every order $k gt.eq k_0$ has one valid order on the whole stratum, provided it is preserved by flat scalar extension and can be checked by faithfully flat completion. The completed product descriptions persist after replacing the smooth parameters by lifts of another coordinate system on the reduced stratum.]
] <str:uniform>

#proof[
  In our applications the transversal $T_0$ is normal near $t_0$. Its analytic germ is the transverse factor of a normal product, hence normal. Its completion is normal by excellence and is also the completion of the algebraic local ring; faithful flatness of completion then descends normality to that ring. Shrink $T_0$ accordingly. On a product $bb(A)^d times T_0$, restriction to the smooth locus of the normal transversal gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ Omega_(bb(A)^d times T_0)^(\[ j \]) = xor.big_(a + b = j) "pr"_1^(*) Omega_(bb(A)^d)^a ⊗ "pr"_2^(*) Omega_(T_0)^(\[ b \]) . $ <str:cotangent-product>]
  Both sides are reflexive, so the equality extends across codimension two. It remains valid under the common étale pullbacks. Equation (4.6) gives the claimed description on each whole thickened chart. For finite modules, flat base change commutes with Hom, as follows from a finite presentation; it also commutes with kernels and images. It therefore commutes with double duals and the fixed reflexive tensor constructions here. Composition and contraction are preserved, and trace can be checked on the dense locally free locus. The trace pairing on the reduced smooth factor is thus the scalar extension of a pairing of finite-dimensional complex vector spaces. Its kernel and quotient are vector bundles there. This proves the claim about barred Hom.
  We make explicit how the residual tensor category of the full maximal chart is used in these transverse calculations. At a product point put
  $ R = hat(cal(O))_(T_0 \, t_0) \, #h(2em) S = R \[ \[ t_1 \, dots.h \, t_d \] \] \, #h(2em) E = R^(xor d) xor hat(Omega_(T_0)^(\[ 1 \])) . $
  The completion of the full chart cotangent module is $E ⊗_R S$. For finite reflexive tensor objects $P \, Q$ generated by $E$, flat base change gives
  $ "Hom"_S \( P ⊗_R S \, Q ⊗_R S \) = "Hom"_R \( P \, Q \) ⊗_R S \, $
  and also commutes with their reflexive tensor operations, composition and trace. Reduction modulo $frak(m)_S = \( frak(m)_R \, t_1 \, dots.h \, t_d \)$ gives the same trace pairing as reduction over $R$ modulo $frak(m)_R$. Its kernels and residual Hom spaces therefore agree. The same flat Hom calculation compares the analytic local ring of the full chart with its completion. Idempotent lifting over the henselian rings, as in Lemmas 9 and 10, identifies their idempotent-complete residual tensor categories. Thus the residual category of the full maximal chart is transported by scalar extension to the category computed from the transverse module $E$. Theorem 19 and Corollary 20 are applied on the full chart and carried to the transverse calculation by this identification.
  One may now choose an exponent on each of the finitely many transversals and take their maximum. Equalities of coherent maps, surjectivity, and specified powers annihilating a kernel descend from faithfully flat completions. This proves precisely the asserted uniformity for the fixed finite diagrams.
  For the last assertion, the stratum ideal in $S$ is $frak(m)_R S$. If $t'_1 \, dots.h \, t'_d$ restrict to another coordinate system on $S \/ frak(m)_R S$, substitution $t_i mapsto t'_i$, fixing $R$, is an automorphism of this complete ring by the formal inverse function theorem. It preserves the stratum ideal. Completed differentials and their reflexive tensor maps are functorial for this automorphism, so it transports the completed Hom, trace and ideal data as well. ◻
]

#thm([Proposition 4.7.])[
  (Compatible direct images on normalized charts).  #emph[Let $U arrow.r B$ be an integral separated étale algebraic neighborhood, let $pi : C arrow.r U$ be an integral finite normal Galois quasi-étale chart, and let $h : Z arrow.r C$ be the normalized source chart of Proposition 8. For the global degreewise isomorphisms $phi.alt_j : R^j f_(*) cal(O)_X arrow.r Omega_B^(\[ j \])$ fixed after Proposition 2, there are unique isomorphisms 
$ phi.alt_(j \, C) : R^j h_(*) cal(O)_Z arrow.r^(med tilde.op med) Omega_C^(\[ j \]) \, #h(2em) 0 lt.eq j lt.eq n \, $

 whose restrictions to $C^compose = C times_B B_(upright("reg"))$ are the ordinary flat pullbacks of $phi.alt_j$. The degree-zero map is the unit. These isomorphisms are compatible with ordinary étale refinement and with every normalized main overlap whose projections are étale. In particular they give compatible ambient identifications $cal(N)_(j \, alpha) = R^j h_(alpha *) cal(O)_(X_alpha)$ on the charts of Proposition 25.]
] <str:direct-images>

#proof[
  The restriction $C^compose arrow.r B_(upright("reg"))$ is étale. Indeed it factors through the smooth $U times_B B_(upright("reg"))$, and purity makes the finite quasi-étale factor étale there. Its complement in $C$ has codimension at least two. Over $C^compose$ the normalized source is the ordinary base change $X times_B C^compose$: that base change is smooth and normal, all its components dominate $C^compose$ by equidimensionality, and it has the integral generic fiber used in Proposition 8. Proper flat base change and étale pullback of differentials therefore pull $phi.alt_j$ to
  $ \( R^j h_(*) cal(O)_Z \) \|_(C^compose) arrow.r^(med tilde.op med) Omega_(C^compose)^j . $
  This open includes the entire inverse image of the discriminant over the regular part of $B$; only the singular locus of $B$ has been removed.
  The discrepancy argument in Proposition 8 applies to any such quasi-étale $pi$, so $C$ is klt. In particular it is Cohen–Macaulay and $bb(Q)$-Gorenstein. The same proposition gives a projective equidimensional map $h$ with connected fibers and smooth canonical-trivial source. Ou’s local reflexivity theorem #cite(label("Ou2019")) Theorem 1.3 therefore makes $R^j h_(*) cal(O)_Z$ reflexive on $C$. Both sides of the displayed isomorphism are reflexive and the omitted set has codimension at least two, so it extends uniquely to $phi.alt_(j \, C)$. At $j = 0$ it is the Stein unit.
  Ordinary étale base change preserves both sides. On a normalized main overlap with étale projections, every component meets the inverse image of $B_(upright("reg"))$, since a main component meets the dense common unbranched open. The two pullbacks there are the same pullback of the fixed global $phi.alt_j$. They consequently agree on the entire normal overlap by reflexivity. This also proves compatibility with deck actions and with further étale refinements. ◻
]

We finish by recording the scope of spreading. Choose models over a finitely generated integral subring of $bb(C)$ for the finite diagram in Proposition 25, for the ambient coherent isomorphisms of Proposition 27, and for the finite coherent maps required in Lemma 26 at the selected orders. After localization, the object and overlap charts retain normality, the stated maps retain étaleness near the closed loci, the reduced stratum charts are smooth, the finite source charts are smooth étale torsors, and the coarse stratum is geometrically integral and projective. Retain also a fiberwise dense common unbranched open and its finite torsor identifications. Keep the ideal equalities and groupoid identities as identities of the models, and invert the finitely many deck-group orders.

For each of the pair, triple, quadruple, unit and inverse domains used above, retain the disjointness of its omitted closed complement from the corresponding closed support. There are finitely many such intersections, all with empty generic fiber, so one further localization keeps them empty. This ensures that the quotients by every power of the marked ideal remain in those domains after reduction. The common cross-arrow projections also retain their coverage of the corresponding closed supports. Their images are open by étaleness, and the closed subsets of those supports omitted by the relevant unions of images have empty generic fiber. There are finitely many such subsets, so one further localization removes them. The common product maps are modeled as étale maps of marked pairs. Their product descriptions at every finite order then follow from formal étaleness, uniformly in the model.

For any additional fixed finite list of coherent presentations, kernels, images and identities, generic freeness and coherent base change retain the required calculations after further localization. In positive characteristic we use these spread sheaves, direct-image isomorphisms and algebraic identities. No positive-characteristic maximal-cover or residual tensor classification is asserted.

== 5 Good reductions and ordinary base change <bc:section>

We retain the finite charts and product presentations of Proposition 25. We will prove ordinary coefficient base change on suitable reductions, simultaneously for every module on each chart. The transverse modules used later need not be flat over the base, so the proof will keep track of an ordinary complex and its actual chain homotopies.

Fix a normalized source chart and shrink its normal affine base around a point of the stratum. The chart properties in Proposition 8 give

$ h : Z arrow.r "Spec" R \, #h(2em) h_(*) cal(O)_Z = tilde(R) \, #h(2em) dim Z = 2 n \, $

where $Z$ is smooth and $h$ is projective and equidimensional of relative dimension $n$. Fix a nowhere zero volume form $sigma_X in H^0 \( X \, omega_X \)$; its pullback $sigma_Z$ is a frame of $omega_Z$. A sufficiently positive embedding over $R$, followed by a linear projection whose center misses the chosen fiber, gives after shrinking a finite map

#[#set math.equation(numbering: n => "(5.1)")
 $ pi : Z arrow.r Y = bb(P)_R^n . $ <bc:finite-projection>]

Indeed the chosen sections have no common zero on that fiber, hence on a neighborhood by properness. The resulting map is quasi-finite because its defining line bundle is relatively ample, and is therefore finite. Choose also a finite dominant slice $"Spec" E arrow.r "Spec" R$ whose total space is smooth, and put

$ cal(V) = pi_(*) cal(O)_Z \, #h(2em) E_Y = E ⊗_R cal(O)_Y . $

The finite algebras $cal(V)$ and $E_Y$ have regular total spaces $Z$ and $bb(P)_E^n$. Quasi-compactness of the stratum lets us make these choices on a finite collection of source charts.

For a module $E$ over a ring $R$, write $"add"_R \( E \)$ for the modules isomorphic to direct summands of finite direct sums of $E$. Our first target on one chart is a bounded complex $C$ with terms in $"add"_R \( E \)$ and, for every $R$-module $M$, natural identifications

#[#set math.equation(numbering: n => "(5.2)")
 $ theta.alt_M^i : H^i \( C ⊗_R M \) arrow.r^(med tilde.op med) H^i \( Z \, h^(*) tilde(M) \) . $ <bc:coefficient-target>]

The pullback $h^(*)$ and all tensor products here are ordinary. These identifications must respect the specified coefficient maps. Namely, for

$ gamma_M^i \( C \) : H^i \( C \) ⊗_R M arrow.r H^i \( C ⊗_R M \) \, #h(2em) \[ z \] ⊗ m mapsto \[ z ⊗ m \] \, $

and the usual map $beta_M^i$ obtained by multiplying a cohomology class on $Z$ by the pulled-back section $m$, we require

#[#set math.equation(numbering: n => "(5.3)")
 $ theta.alt_M^i gamma_M^i \( C \) = beta_M^i \( theta.alt_R^i ⊗ "id"_M \) . $ <bc:canonical-compatibility>]

The remaining target in a good reduction is an actual homotopy equivalence, locally on $"Spec" R$, from $C$ to a complex with zero differential. The following elementary observation explains why this suffices for all ordinary modules at once.

#thm([Lemma 5.1.])[
  (The ordinary homotopy criterion).  #emph[Let $C$ be a bounded complex of $R$-modules. If there are chain maps $C arrows.rl D_0$ that are inverse up to chain homotopy and $d_(D_0) = 0$, then $gamma_M^i \( C \)$ is an isomorphism for every $R$-module $M$ and every $i$. If (5.2) and (5.3) hold, the canonical map $beta_M^i$ is therefore an isomorphism.]
] <bc:homotopy-criterion>

#proof[
  Tensor the two maps and their chain homotopies with $M$. They remain homotopy inverses between $C ⊗_R M$ and $D_0 ⊗_R M$. The maps $gamma_M^i$ are natural in chain maps, and $gamma_M^i \( D_0 \)$ is the identity on $D_0^i ⊗_R M$. Naturality under the two homotopy equivalences proves the assertion for $C$. This uses no flatness of $M$, of $D_0$, or of the terms of $C$. ◻
]

We next construct the coefficient complex, then turn a generic homotopy splitting into the local splitting required by this criterion.

=== 5.1 Finite smooth covers as coefficient modules <finite-smooth-covers-as-coefficient-modules>

The following comparison supplies one additive generator for the finite regular algebras above. It makes no flatness assertion over their common normal base.

#thm([Proposition 5.2.])[
  (Comparison of finite regular algebras).  #emph[Let $L$ be a complete noetherian normal local domain, and let $A_1 \, A_2$ be finite dominant local $L$-algebras that are regular local rings. Put $d_i = "rk"_L A_i$. If these rings have positive characteristic and arise by completing local rings of varieties over a perfect field, then 
#[#set math.equation(numbering: n => "(5.4)")
 $ A_1^(xor d_2) tilde.eq A_2^(xor d_1) #h(2em) upright("as ") L upright("-modules") . $ <bc:regular-comparison>]

 The same conclusion holds in characteristic zero when the diagram is the completion of an algebraic finite diagram at a closed point over $bb(C)$. Finite products of the indicated local algebras can also be compared, using their total generic ranks.]
] <bc:finite-modules>

#proof[
  Suppose first that the characteristic is $p > 0$. Write $d = dim L$ and $tau = "trdeg"_k kappa \( L \)$, where $k$ is the perfect ground field. All residue fields of the $A_i$ are finite extensions of $kappa \( L \)$, so their $p$-degrees are $p^tau$. For $q = p^a$, finite flat Frobenius on a regular local ring, as in Kunz’s theorem #cite(label("Kunz1969")), gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ F_(*)^a A_i tilde.eq A_i^(xor q^(d + tau)) . $ <bc:frobenius-rank>]
  Here the module structure on the left is through $x mapsto x^q$. The formula follows either from a regular system of parameters and a residue-field $q$-basis, or by taking the degree of Frobenius on the fraction field. Completion does not change this formula. In particular, the exponent is the same for both algebras, including at a nonclosed point.
  The two modules in (5.4) have the same generic rank. Clearing denominators in a generic isomorphism and its inverse gives maps
  $ u : A_1^(xor d_2) arrow.r A_2^(xor d_1) \, #h(2em) v : A_2^(xor d_1) arrow.r A_1^(xor d_2) \, #h(2em) v u = r "id" \, quad u v = r "id" $
  for one nonzero $r in L$. We estimate the size of an invertible block of $F_(*)^a \( r \)$ on $F_(*)^a A_i$, viewed as a free $A_i$-module. If $frak(n)_i$ is the maximal ideal, its cokernel needs
  $ dim_(kappa \( A_i \)) #scale(x: 120%, y: 120%)[\(] F_(*)^a \( A_i \/ r A_i \) \/ frak(n)_i F_(*)^a \( A_i \/ r A_i \) #scale(x: 120%, y: 120%)[\)] = q^tau "length"_(A_i) A_i \/ \( r \, frak(n)_i^(\[ q \]) \) $
  generators. Since $frak(n)_i$ has $d$ generators, $frak(n)_i^(d \( q - 1 \) + 1) subset frak(n)_i^(\[ q \])$. The Hilbert–Samuel polynomial of $A_i \/ r A_i$, of dimension at most $d - 1$, therefore bounds this number by $O \( q^(d + tau - 1) \)$. The case $d = 0$ is immediate, since $r$ is a unit. Elementary invertible row and column operations over $A_i$ now exhibit an identity block of size $q^(d + tau) - O \( q^(d + tau - 1) \)$ in $F_(*)^a \( r \)$.
  Apply $F_(*)^a$ to $u \, v$. The identity block just found, repeated $d_2$ times, factors through $F_(*)^a \( A_2^(xor d_1) \)$. Consequently
  $ A_1^(xor d_2 \( q^(d + tau) - O \( q^(d + tau - 1) \) \)) quad upright("is an ") L upright("-module summand of") quad A_2^(xor d_1 q^(d + tau)) . $
  Finite modules over the complete local ring $L$ have Krull–Schmidt decompositions. For each indecomposable isomorphism class $T$, let $m_i \( T \)$ be its multiplicity in $A_i$. The displayed summand relation, divided by $q^(d + tau)$ and followed by $a arrow.r oo$, gives $d_2 m_1 \( T \) lt.eq d_1 m_2 \( T \)$. Interchanging the indices gives equality. This proves (5.4).
  Here are details of the characteristic-zero passage. Henselize the algebraic base at the chosen point. The idempotents separating the finitely many points of a finite algebra descend over an étale neighborhood. Thus individual factors can be treated in a finite algebraic diagram; after shrinking that diagram they remain regular and dominant over a normal integral base. Let $M = A_1^(xor d_2)$ and $N = A_2^(xor d_1)$ denote the corresponding finite modules before completion. Choose finite generators $phi.alt_1 \, dots.h \, phi.alt_s$ of the ordinary module $"Hom" \( M \, N \)$. Its completion is $"Hom" \( hat(M) \, hat(N) \)$, because $M$ is finitely presented and completion is flat.
  An isomorphism $hat(M) tilde.eq hat(N)$ exists precisely when some linear combination of the $phi.alt_i$ is surjective modulo the maximal ideal. For the forward implication, reduce the coefficients of a completed isomorphism. For the converse, Nakayama gives surjectivity, and a surjective map of the same generic rank between torsion-free modules has zero kernel. Existence of the required linear combination is a finite matrix condition: at least one maximal minor of $sum z_i overline(phi.alt)_i$ is a nonzero polynomial in the $z_i$.
  Spread the finite presentations, the marked point, and this Hom calculation over a finitely generated characteristic-zero domain. Generic freeness applied to the kernels and cokernels of the finite presentation matrices makes the Hom calculation and its reduction at the marked point commute with specialization. Retain normality, regularity, ranks, and the dimensions of the two residual modules. If all the maximal-minor polynomials vanished in characteristic zero, their finitely many coefficients would vanish in every remaining specialization. At any good positive-characteristic specialization, however, the first part supplies an isomorphism of the completed modules. This is a contradiction. A factor that splits further under specialization causes no difficulty: the first part applies to all its regular factors and their sum. Finally, comparisons with one fixed factor and addition prove the assertion for finite products. ◻
]

#prodef([Remark 5.3.])[
  Lengths in this comparison are always taken over the common target when they are compared. For a finite local algebra $A \/ L$ and a finite-length $A$-module $Q$,
  $ "length"_L Q = \[ kappa \( A \) : kappa \( L \) \] "length"_A Q . $
  Thus tensoring (5.4) with any fixed finite-length $L$-module compares the corresponding lengths with their residue-field degrees included. Dividing two such comparisons, one for a test module and one for a fixed reference module of nonzero length, gives the same ratio on every regular factor. This is the form needed at generic points of the support in the Euler calculation.
] <bc:residue-degrees>

Proposition 29, applied to the completed local factors at closed points, gives

#[#set math.equation(numbering: n => "(5.6)")
 $ cal(V) in "add" \( E_Y \) quad upright("locally on ") Y . $ <bc:additive-generator>]

To descend the assertion from completion, consider the composition pairing

$ cal(H) o m \( E_Y \, cal(V) \) ⊗ cal(H) o m \( cal(V) \, E_Y \) arrow.r cal(E) n d \( cal(V) \) . $

Membership of $"id"_(cal(V))$ in its image is exactly the existence of a retraction through a finite sum of $E_Y$’s. Flat completion commutes with these finite Hom modules and detects membership by the cokernel, so the retraction exists locally before completion. A finite open cover supplies finitely many retraction witnesses.

Let

$ sans(H) = "End"_R \( E \) \, #h(2em) sans(H)_Y = sans(H) ⊗_R cal(O)_Y \, #h(2em) cal(P) = cal(H) o m_Y \( E_Y \, cal(V) \) . $

The right action on $cal(P)$ is by precomposition, and $E$ is a left $sans(H)$-module by evaluation. Flatness of $Y \/ R$ identifies $sans(H)_Y$ with $cal(E) n d_Y \( E_Y \)$. For a left $sans(H)$-module $Q$, set $Q_Y = cal(O)_Y ⊗_R Q$, with its induced left $sans(H)_Y$-action. Our ordinary sheaf tensor notation means

$ cal(P) ⊗_(sans(H)) Q := cal(P) ⊗_(sans(H)_Y) Q_Y . $

The same convention applies to the other right $sans(H)_Y$-module sheaves below. By (5.6), $cal(P)$ is locally a finite projective right $sans(H)_Y$-module and evaluation gives

#[#set math.equation(numbering: n => "(5.7)")
 $ cal(P) ⊗_(sans(H)_Y) E_Y tilde.eq cal(V) . $ <bc:evaluation>]

These assertions follow first for $E_Y$ and then for sums and summands; no general Morita equivalence or $R$-flatness of $E$ is being asserted.

=== 5.2 One twist bound for all coefficient modules <one-twist-bound-for-all-coefficient-modules>

#thm([Lemma 5.4.])[
  #emph[Let $R$ be noetherian, let $sans(H)$ be an algebra finite over its central subring $R$, and let $cal(P)$ on $Y = bb(P)_R^n$ be locally finite projective as a right $sans(H)_Y$-module. There is an integer $m_0$ such that, for every $m gt.eq m_0$ and every left $sans(H)$-module $Q$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ H^j \( Y \, cal(P) \( m \) ⊗_(sans(H)) Q \) & = 0 &  & \( j > 0 \) \,\
H^0 \( Y \, cal(P) \( m \) \) ⊗_(sans(H)) Q & arrow.r^(med tilde.op med) H^0 \( Y \, cal(P) \( m \) ⊗_(sans(H)) Q \) . $ <bc:uniform-vanishing>]

 The arrow is the canonical multiplication map, and $H^0 \( Y \, cal(P) \( m \) \)$ is a finite projective right $sans(H)$-module. The bound is independent of $Q$.]
] <bc:uniform-twists>

#proof[
  Set $cal(K)_0 = cal(P)$. Relative generation on projective space constructs $n + 2$ exact sequences
  #[#set math.equation(numbering: n => "(5.9)")
   $ 0 arrow.r cal(K)_(r + 1) arrow.r cal(F)_r arrow.r cal(K)_r arrow.r 0 \, #h(2em) 0 lt.eq r lt.eq n + 1 \, $ <bc:finite-resolution>]
  where each $cal(F)_r$ is a finite sum of $sans(H)_Y \( - a_(r j) \)$. To obtain such a surjection, choose ordinary coherent generators after twisting and extend their maps $sans(H)_Y$-linearly. Since $cal(K)_r$ is locally projective over $sans(H)_Y$, the sequence locally splits over that algebra. Induction shows that every kernel $cal(K)_(r + 1)$ is again locally finite projective over $sans(H)_Y$.
  The sheaf $sans(H)_Y$ is flat as a right $sans(H)$-module: its tensor functor is $cal(O)_Y ⊗_R -$, and $Y$ is $R$-flat. Therefore all the kernels just constructed are $sans(H)$-flat, and every sequence in (5.9) stays exact after tensoring with an arbitrary $Q$. Choose $m_0 gt.eq a_(r j)$ for all the finitely many twists. For $m gt.eq m_0$ each $cal(F)_r \( m \) ⊗_(sans(H)) Q$ is a sum of $cal(O)_Y \( m - a_(r j) \) ⊗_R Q$. The coordinate Čech calculation on projective space gives zero higher cohomology for these sheaves for every $R$-module $Q$; their sections are the degree $m - a_(r j)$ homogeneous polynomials with coefficients in $Q$.
  For $j > 0$, the long exact sequences consequently give
  #[#set math.equation(numbering: n => "(5.10)")
   $ H^j \( Y \, cal(K)_r \( m \) ⊗_(sans(H)) Q \) tilde.eq H^(j + n + 2 - r) \( Y \, cal(K)_(n + 2) \( m \) ⊗_(sans(H)) Q \) . $ <bc:dimension-shift>]
  The $n + 1$ standard affine opens of $Y$ have affine intersections, so quasi-coherent cohomology vanishes in degrees greater than $n$. Thus the left side is zero for $r = 0 \, 1 \, 2$ and $j > 0$. In particular this proves (5.8). We have made no assertion about the projective dimension or the low-degree cohomology of the final kernel $cal(K)_(n + 2)$.
  The first two sequences, together with the vanishings for $cal(K)_1$ and $cal(K)_2$, give
  #[#set math.equation(numbering: n => "(5.11)")
   $ H^0 \( Y \, cal(P) \( m \) ⊗_(sans(H)) Q \) = "coker" #scale(x: 120%, y: 120%)[\(] H^0 \( Y \, cal(F)_1 \( m \) \) ⊗_(sans(H)) Q arrow.r H^0 \( Y \, cal(F)_0 \( m \) \) ⊗_(sans(H)) Q #scale(x: 120%, y: 120%)[\)] . $ <bc:sections-presentation>]
  For $Q = sans(H)$ this is a finite presentation of $G_m = H^0 \( Y \, cal(P) \( m \) \)$ by finite free right $sans(H)$-modules. Right exactness of tensoring this same presentation proves (5.8), with its canonical map. Finally, tensoring any short exact sequence of coefficient modules with $cal(P) \( m \)$ remains exact by $sans(H)$-flatness, and taking sections remains exact by (5.8). Equation (5.8) says that $G_m ⊗_(sans(H)) -$ is exact. Hence $G_m$ is flat; being finitely presented by (5.11), it is projective. ◻
]

Choose an integer $nu gt.eq max \( 1 \, m_0 \)$. We reserve $nu$ for the Koszul exponent; the powers of the stratum ideal keep their notation $I^k$. The coordinate sections $y_0^nu \, dots.h \, y_n^nu$ have no common zero on $Y$. Their Koszul coresolution is the locally split exact sequence

#[#set math.equation(numbering: n => "(5.12)")
 $ 0 arrow.r cal(P) arrow.r cal(P) \( nu \)^(xor \( n + 1 \)) arrow.r dots.h.c arrow.r cal(P) \( \( n + 1 \) nu \) arrow.r 0 . $ <bc:koszul>]

Local splitting follows by contracting the Koszul complex wherever one of the coordinate sections is a unit. Let $K_nu \( cal(P) \)$ be the complex of sections of its positive-twist terms, beginning in degree zero. Lemma 31 makes it a bounded complex of finite projective right $sans(H)$-modules representing $upright(bold(R)) Gamma \( Y \, cal(P) \)$. Set

$ C_nu \( cal(V) \) = K_nu \( cal(P) \) ⊗_(sans(H)) E . $

Its terms lie in $"add"_R \( E \)$ and are, explicitly, $H^0 \( Y \, cal(V) \( j nu \) \)^(xor binom(n + 1, j))$ for $1 lt.eq j lt.eq n + 1$, in degree $j - 1$. For every $R$-module $M$, ordinary associativity and (5.7) give

$ cal(P) ⊗_(sans(H)) \( E ⊗_R M \) = cal(V) ⊗_R M . $

Apply Lemma 31 with the left $sans(H)$-module $Q = E ⊗_R M$. The locally split sequence (5.12) and the finite projection formula for $pi$ give natural identifications

#[#set math.equation(numbering: n => "(5.13)")
 $ C_nu \( cal(V) \) ⊗_R M tilde.eq upright(bold(R)) Gamma \( Y \, cal(V) ⊗_R M \) = upright(bold(R)) Gamma \( Z \, h^(*) tilde(M) \) . $ <bc:ordinary-complex>]

The tensor and $h^(*)$ in this formula are ordinary operations. No Tor vanishing for $E$ or $M$ over $R$ has been used.

Here is the canonical-map content of (5.13). Use the standard affine cover of $Y$ and its Čech complex. The augmentation from $cal(V) ⊗_R M$ to the positive Koszul complex gives a quasi-isomorphism of their Čech total complexes, since (5.12) is locally split before coefficients are tensored. The maps from global sections of the positive terms to their Čech complexes are quasi-isomorphisms by (5.8); (5.8) identifies those sections with the terms of $C_nu \( cal(V) \) ⊗_R M$. This gives the natural zigzag meant by (5.13). The augmentation, Čech maps, section identifications, and finite projection formula are all natural for maps of coefficient modules. In particular it is natural for $R arrow.r M$, $1 mapsto m$. On cocycles that map sends a class to its product with the pulled-back section $m$. Thus the induced cohomology identifications are precisely (5.2) and satisfy (5.3).

The same construction applies to any coherent $cal(W)$ locally in $"add" \( E_Y \)$, using $cal(H) o m_Y \( E_Y \, cal(W) \)$ in place of $cal(P)$ and a sufficiently large exponent. In the explicit section description, an $cal(O)_Y$-linear map of such sheaves induces an actual chain map $C_nu \( cal(W) \) arrow.r C_nu \( cal(W)' \)$ whenever the same $nu$ is valid for both. These maps respect composition.

We also need a stronger comparison between different exponents for one sheaf. The bounded projective $sans(H)$-complexes $K_nu \( cal(P) \)$ represent the same object $upright(bold(R)) Gamma \( Y \, cal(P) \)$. Full faithfulness of bounded projective complexes in the derived category of right $sans(H)$-modules therefore lifts its identity to chain maps that are inverse up to $sans(H)$-linear chain homotopies. Tensoring these actual maps and homotopies with $E$ gives

#[#set math.equation(numbering: n => "(5.14)")
 $ C_nu \( cal(V) \) tilde.eq C_(nu') \( cal(V) \) quad \( nu \, nu' upright(" sufficiently large") \) $ <bc:power-comparison>]

as homotopy equivalences. The maps and homotopies commute with central multiplication by elements of $R$. We used full faithfulness over $sans(H)$, before tensoring with $E$, and then retained the resulting maps and homotopies over $R$.

Fix one such complex $C = C_(nu_0) \( cal(V) \)$ in characteristic zero. Over $"Frac" \( R \)$ it splits as a complex of vector spaces. Its cohomology embeds as a summand of a finite zero-differential complex whose terms are sums of $E ⊗_R "Frac" \( R \)$. Clearing denominators in the two maps and in their homotopy gives a nonzero $g in R$, a bounded zero-differential complex $D$ with terms finite sums of $E$, and actual maps and a homotopy

#[#set math.equation(numbering: n => "(5.15)")
 $ C arrow.r^a D arrow.r^b C \, #h(2em) b a - g "id"_C = d H_0 + H_0 d . $ <bc:cleared-homotopy>]

For example, clear separate denominators in the two maps, and then a further common denominator in the scaled homotopy; rescaling one map and $g$ gives the displayed identity. All its terms are finite module maps. It is therefore one fixed finite datum that can be spread out.

The central factor will remain this same $g$ when the exponent changes. Indeed, let $f : C arrow.r C_(nu') \( cal(V) \)$ and $j : C_(nu') \( cal(V) \) arrow.r C$ be the homotopy inverses induced by the $sans(H)$-comparisons, and write $f j - "id" = d J + J d$. Then the actual chain maps $a j$ and $f b$ satisfy

#[#set math.equation(numbering: n => "(5.16)")
 $ \( f b \) \( a j \) - g "id"_(C_(nu') \( cal(V) \)) = d \( f H_0 j + g J \) + \( f H_0 j + g J \) d . $ <bc:transported-homotopy>]

This follows by inserting (5.15) and using $f g j = g f j$. It introduces no additional clearing factor.

=== 5.3 The differential identity attached to a clearing factor <the-differential-identity-attached-to-a-clearing-factor>

Choose a finite Noether normalization $mu : "Spec" R arrow.r P = bb(A)_(bb(C))^n$, with coordinates $u_1 \, dots.h \, u_n$, and put

$ e_mu = \[ "Frac" \( R \) : bb(C) \( u_1 \, dots.h \, u_n \) \] . $

Choose a nonzero $Delta_mu in bb(C) \[ u_1 \, dots.h \, u_n \]$ such that $R \[ 1 \/ Delta_mu \]$ is finite étale and free of rank $e_mu$ over $bb(C) \[ u_1 \, dots.h \, u_n \] \[ 1 \/ Delta_mu \]$, and such that $h$ is smooth over this locus. These are fixed finite data. In particular the retained rank will later bound the degrees of completed local branches, including at points outside this open set.

Set $a = mu h$. The morphism $a$ is projective, with smooth source of dimension $2 n$ and smooth target of dimension $n$. Write $d u = d u_1 and dots.h.c and d u_n$. On the dense locus where $mu$ is étale and $h$ is smooth, the volume form defines the relative top form $eta = sigma_Z \/ d u$. Since $h_(*) cal(O)_Z = cal(O)_("Spec" R)$ and $omega_Z$ is trivial, the corresponding lowest Hodge sheaf is $R eta$, viewed on $P$.

#thm([Lemma 5.5.])[
  #emph[For the fixed $g eq.not 0$ in (5.15), on a finite principal-open cover of $P$ there are finitely many $t_j in R$ and algebraic differential operators $D_j$ with regular coefficients on the respective open sets such that 
#[#set math.equation(numbering: n => "(5.17)")
 $ eta = sum_j D_j \( g t_j eta \) . $ <bc:differential-equation>]

 The identity is in the middle relative de Rham module on the generic smooth locus, but its operators are regular also at the other points of the chosen open sets. For one integer $o_g$ fixed in characteristic zero, they have expressions 
#[#set math.equation(numbering: n => "(5.18)")
 $ D_j = sum_(\| alpha \| lt.eq o_g) c_(j \, alpha) \( u \) partial_u^alpha \, #h(2em) partial_u^alpha = partial_(u_1)^(alpha_1) dots.h.c partial_(u_n)^(alpha_n) \, $ <bc:operator-bound>]

 where each $c_(j \, alpha)$ is regular on its specified open set.]
] <bc:differential-identity>

#proof[
  Use the constant polarizable Hodge module on $Z$ in right $cal(D)_Z$ notation. Its underlying module is $omega_Z$, with lowest filtration index $- 2 n$. The filtered direct-image construction and projective strictness give
  #[#set math.equation(numbering: n => "(5.19)")
   $ F_(- 2 n) cal(H)^0 \( a_(+) omega_Z \) = a_(*) omega_Z . $ <bc:lowest-filtration>]
  To track the index, use the transfer Spencer resolution. Its term in degree $- i$ is filtered by pieces with source filtration lowered by $i$ and by the nonnegative order of target differential operators. At total index $- 2 n$, all $i > 0$ terms vanish; in degree zero only order zero remains. The lowest filtered complex is consequently $upright(bold(R)) a_(*) omega_Z$. Strictness identifies its degree-zero cohomology with the left side of (5.19). These conventions and strictness are the ones in #cite(label("Saito2016")) Sections B.2–B.3 and Theorem 1.4, the latter being #cite(label("Saito1988")) Theorem 5.3.1.
  The strict-support decomposition is compatible with the filtration. The sheaf $a_(*) omega_Z$ is torsion-free on $P$: multiplication by a nonzero base function is injective on the dominant integral smooth source. Thus its summands on proper supports are zero. After changing from right to left modules by $omega_P^(- 1)$, the sheaf $R eta$ lies in the full-support part of $cal(H)^0 \( a_(+) omega_Z \)$, which is generically the $n$-th relative de Rham cohomology. This part is an intersection extension of semisimple algebraic local systems, hence a semisimple regular holonomic $cal(D)_P$-module with no simple constituent on a proper support. Here we use strict support #cite(label("Saito2016")) Section 1.2 and algebraic semisimplicity #cite(label("Deligne1971")) Proposition 4.2.5 and Theorem 4.2.6; restricting to an arbitrary small analytic open would not justify this semisimplicity assertion.
  Inside that semisimple module let $U$ and $U_g$ be the $cal(D)_P$-submodules generated by $R eta$ and $g R eta$. At the generic point of $P$, the finite domain $R$ becomes the field $"Frac" \( R \)$, so $g$ is invertible and these restrictions agree. The quotient $U \/ U_g$ is supported properly. Semisimplicity makes it a sum of constituents of the full-support module, so it is zero. Consequently $eta$ belongs locally to $cal(D)_P \( g R eta \)$. Writing this membership using finitely many generators gives (5.17). Quasi-compactness gives a finite principal-open cover and a finite maximum $o_g$ for the orders. On an open $D \( f \)$, a local section of $mu_(*) cal(O)_("Spec" R)$ has the form $r \/ f^m$ with $r in R$. Absorb multiplication by $f^(- m)$ into the operator acting on $g r eta$; its coefficients remain regular on $D \( f \)$ and its order does not increase. Thus the $t_j$ may be taken in $R$. Algebraic differential operators on these opens of affine space have the expressions (5.18); their finitely many coefficient denominators are units on the corresponding opens. The restriction of the identity to the generic smooth locus involves only algebraic de Rham classes, connections, and finite-order operations, and thus is finite algebraic data that can be reduced after localization. ◻
]

=== 5.4 Finite preparations and selection of the reductions <finite-preparations-and-selection-of-the-reductions>

The preceding constructions give finite data in characteristic zero. We first retain these data on a model. After choosing a good reduction, we will choose its Koszul exponent and its local Cartier units there. The coefficient modules themselves are not among the data to be spread.

Spread the projective morphism, the finite charts and their groupoid, the smooth source charts, the volume form, the ideals of the strata, and the finite étale product presentations. Include $h \, pi \, E \, mu$ on each member of the finite chart cover, the coherent identity $h_(*) cal(O)_Z = R$, the compatible ambient direct-image identifications of Proposition 27, the finite Hom and evaluation calculations defining $sans(H) \, cal(P)$, the finite local retraction witnesses for (5.6), the $n + 2$ sequences in (5.9) with local splitting witnesses, one exponent $nu_0$ and its complex $C_(nu_0)$, and the maps and homotopy in (5.15). Include also the finite identities (5.17), the expressions (5.18) with their denominators on the specified open sets, and the finite operator cover itself. More explicitly, if this cover is $P = union.big_lambda D \( f_lambda \)$, retain an identity $sum_lambda r_lambda f_lambda = 1$ in $bb(C) \[ u_1 \, dots.h \, u_n \]$. Its reduction keeps these principal opens covering every fiber. Include the element $Delta_mu$ with the finite free étale rank $e_mu$. Localizing a finitely generated integral model makes the kernels, images, and cokernels used in these presentations flat over the model and retains their stated base-change maps. Retain smoothness of the source charts and slices, normality and geometric integrality of the chart bases, dimensions, equidimensionality, and the étale and finite assertions on the specified neighborhoods. Retain also geometric integrality of the smooth projective total space and smoothness of $h$ over $D \( Delta_mu \)$. Invert the stabilizer orders and the finitely many coefficient denominators. On every retained fiber, $Delta_mu$ remains nonzero, and the algebra on $D \( Delta_mu \)$ remains finite étale and free of rank $e_mu$.

Retaining the complex $C_(nu_0)$ includes retaining its coefficient meaning. The spread local splitting witnesses make the same $n + 2$ sequences (5.9) locally split over the fiber’s $sans(H)_Y$, with the same twists $a_(r j)$. The proof of Lemma 31 therefore gives the old bound $m_0$ on every retained fiber, for every coefficient module there. In particular $nu_0 gt.eq m_0$ is still valid. The first two sequences give the same finite cokernel presentation (5.11) for each $H^0 \( Y \, cal(P) \( j nu_0 \) \)$ after specialization. Tensoring that presentation with the residue field identifies the specialized section module with the section module of the fiber. Include the finitely many coordinate multiplication maps as well. Thus the specialization of $C_(nu_0)$ is the fiber complex $K_(nu_0) \( cal(P) \) ⊗_(sans(H)) E$, with (5.13) and its canonical-map compatibility.

For the smooth projective total space retain the nowhere zero volume form and the coherent conditions

#[#set math.equation(numbering: n => "(5.20)")
 $ h^2 \( cal(O)_X \) = h^(2 n) \( cal(O)_X \) = 1 \, #h(2em) H^2 \( cal(O)_X \)^(⊗ n) arrow.r H^(2 n) \( cal(O)_X \) upright(" is nonzero") . $ <bc:coherent-cup>]

These are finite cohomological conditions, supplied originally by the IHS Hodge decomposition. Retain also the relevant coherent and de Rham base-change identifications.

This preparation remains available after any fixed finite enlargement of the algebraic and coherent data on a finite-type model, followed by restriction to any nonempty principal open on which the required identities and geometric properties remain valid. Thus this localization inverts only finitely many elements. Make those choices before selecting a characteristic-zero closed point of the retained model over $bb(Q)$. Its residue field is a number field. Pull the data to its ring of integers with finitely many elements inverted, so only finitely many further places are excluded by the model. The lemma below supplies arbitrarily large remaining Cartier reductions of this number-field model. In particular the finite enlargement and localization occur before that arithmetic choice. We use only the retained algebraic and cohomological properties of the chosen characteristic-zero fiber.

#thm([Lemma 5.6.])[
  #emph[There are arbitrarily large remaining residue characteristics, at degree-one places of a finite extension of the number field, for which 
$ "Car" \( F_(*) sigma_X \) eq.not 0 . $

 On the geometric special fiber, the map 
#[#set math.equation(numbering: n => "(5.21)")
 $ psi_X : F_(*) cal(O)_X arrow.r cal(O)_X \, #h(2em) psi_X \( z \) = "Car" \( F_(*) \( z sigma_X \) \) \/ sigma_X $ <bc:cartier-splitting>]

 satisfies $psi_X \( 1 \) = delta in k^(*)$.]
] <bc:cartier-primes>

#proof[
  Put $b = b_2 \( X \)$ and choose a prime $ell > 2 b$. After a finite extension, both the residual representation on a stable lattice of $H_(upright("et"))^2 \( X_(overline(K)) \, bb(Q)_ell \)$ modulo $ell$ and $mu_ell$ are constant. At a degree-one good place of norm $p$, geometric Frobenius has an integral trace $a_p$ satisfying
  #[#set math.equation(numbering: n => "(5.22)")
   $ \| a_p \| lt.eq b p \, #h(2em) a_p equiv b med \( mod med ell \) \, #h(2em) p equiv 1 med \( mod med ell \) . $ <bc:trace-congruence>]
  We use integrality and the weight-two Weil bound, and the equality of the étale and crystalline characteristic polynomials #cite(label("KatzMessing1974")) Theorem 1, using its formulation and the crystalline applicability stated in #cite(label("MilneTannakian2025")) Chapter VI, Theorem 3.9 and Section 4.
  Discard the finitely many ramified places of the number field and the places where relative de Rham cohomology or its base change has torsion. At a degree-one remaining place the local base is $bb(Z)_p$. Crystalline–de Rham comparison for the smooth proper lift identifies the reduction of the crystalline trace with the trace of Frobenius on $H_(upright("dR"))^2 \( X_(bb(F)_p) \)$ #cite(label("BhattDeJong2011")) Corollaries 3.8 and 3.10. Modulo $p$, Frobenius on the de Rham complex factors as its projection onto $cal(O)_X$ followed by the map taking functions to their $p$-th powers in degree zero. On cohomology write this factorization as $beta alpha$ through $H^2 \( cal(O)_X \)$. The reverse composite $alpha beta$ is coherent Frobenius. The identity $"tr" \( beta alpha \) = "tr" \( alpha beta \)$ shows that zero coherent Frobenius forces $p divides a_p$.
  In that case $a_p \/ p$ is an integer in $\[ - b \, b \]$ congruent to $b$ modulo $ell$. Since $ell > 2 b$, it equals $b$, so $a_p = b p$. If coherent Frobenius vanished at all but finitely many degree-one good places, the semisimplification of $H_(upright("et"))^2 \( X_(overline(K)) \, bb(Q)_ell \)$ would therefore have the same character as $bb(Q)_ell \( - 1 \)^(xor b)$. Indeed degree-one places have density one among primes of a number field; the others have norm at least the square of the underlying rational prime and density zero. Chebotarev for number fields and the characteristic-zero character criterion #cite(label("Serre2014")) Theorem 3.2 and Section 5.1.1.3 give the assertion: finite-quotient Frobenius density and continuity identify the two trace functions in the projective limit.
  This contradicts Hodge–Tate comparison at a place above $ell$: $h^2 \( cal(O)_X \) = 1$ contributes a weight-zero summand, whereas all Tate summands just found have weight one, in the convention where $bb(Q)_ell \( - 1 \)$ has weight one. Comparison applies to the smooth proper variety over that local field #cite(label("Scholze2013")) Theorem 1.6 and Corollary 1.8; de Rham representations are stable under subquotients and their filtered dimensions are additive in exact sequences #cite(label("BrinonConrad2009")) Theorem 5.2.1(2) and Propositions 6.3.2–6.3.3, so passing to semisimplification has not lost this obstruction. Thus coherent Frobenius is nonzero at infinitely many, and hence arbitrarily large, good residue characteristics.
  By (5.20), its $n$-fold product is nonzero on top coherent cohomology. Serre duality identifies the transpose of this map with Cartier trace on global top forms. The space of global top forms is the frame line and $X$ is geometrically integral and proper, so (5.21) sends $1$ to a nonzero constant. ◻
]

All subsequent positive-characteristic assertions are made in these geometric special fibers. Choose $p$ larger than every retained Noether-normalization degree $e_mu$ and every differential order bound $o_g$ on the finite chart cover. Étale compatibility of Cartier trace gives the same constant $delta$ on the source charts. Thus $psi_Z : F_(*) cal(O)_Z arrow.r cal(O)_Z$ pushes down, using $h_(*) cal(O)_Z = R$, to

$ psi_h : F_(*) R arrow.r R \, #h(2em) psi_h \( 1 \) = delta . $

=== 5.5 Cartier detects every cleared factor <cartier-detects-every-cleared-factor>

#thm([Lemma 5.7.])[
  #emph[For every closed point $b in "Spec" R$ in a retained chart, there is a function $t$ regular near $b$ such that 
#[#set math.equation(numbering: n => "(5.23)")
 $ psi_h \( g t \) \( b \) eq.not 0 . $ <bc:unit-test>]

]
] <bc:clearing-test>

#proof[
  Fix $b$ and one of the principal opens in Lemma 32 containing $mu \( b \)$. In this proof $t_j \, D_j$ denote its data, so the $t_j$ are regular at $b$ and the coefficients of the $D_j$ are regular at $mu \( b \)$.
  First work over $K_0 = "Frac" \( R \)$, where the family $Z_0 = Z times_R K_0$ is smooth and proper. The retained étale locus of $mu$ identifies $d u$ with a basis of $omega_(K_0 \/ k)$ and gives the relative frame $eta = sigma_Z \/ d u$. Serre duality gives dual lines
  $ V_0 = H^n \( Z_0 \, cal(O)_(Z_0) \) = K_0 v \, #h(2em) W_0 = H^0 \( Z_0 \, omega_(Z_0 \/ K_0) \) = K_0 eta \, #h(2em) chevron.l v \, eta chevron.r = 1 . $
  Put
  $ Z_0^(\( p \)) = Z_0 times_("Spec" K_0 \, F_(K_0)) "Spec" K_0 \, #h(2em) V_0^(\( p \)) = V_0 ⊗_(K_0 \, F_(K_0)) K_0 \, #h(2em) W_0^(\( p \)) = W_0 ⊗_(K_0 \, F_(K_0)) K_0 . $
  Flat field base change identifies these twisted vector spaces with $H^n \( Z_0^(\( p \)) \, cal(O)_(Z_0^(\( p \))) \)$ and $H^0 \( Z_0^(\( p \)) \, omega_(Z_0^(\( p \)) \/ K_0) \)$, respectively. Write $v^(\( p \)) = v ⊗ 1$ and $eta^(\( p \)) = eta ⊗ 1$. They remain dual under the base-changed Serre pairing. Relative Frobenius $F_(upright("rel")) : Z_0 arrow.r Z_0^(\( p \))$ and its finite dual trace have the following $K_0$-linear maps on these lines:
  #[#set math.equation(numbering: n => "(5.24)")
   $ F_(upright("rel"))^(*) : V_0^(\( p \)) & arrow.r V_0 \, & v^(\( p \)) & mapsto s thin v \,\
"Tr"_(F_(upright("rel"))) : W_0 & arrow.r W_0^(\( p \)) \, & eta & mapsto s thin eta^(\( p \)) . $ <bc:relative-trace-lines>]
  Here the second map is induced by $F_(upright("rel") *) omega_(Z_0 \/ K_0) arrow.r omega_(Z_0^(\( p \)) \/ K_0)$. It is the Serre-dual transpose of the first, which proves that their scalars are the same $s in K_0$.
  Taking $p$-th powers of a Čech cocycle for $v$ gives a class $lambda$ in middle relative de Rham cohomology. Its projection to $H^n \( Z_0 \, cal(O)_(Z_0) \)$ is $F_(upright("rel"))^(*) v^(\( p \))$. Pairing $lambda$ with the top form $eta$, with the order that gives Serre evaluation, therefore gives $chevron.l lambda \, eta chevron.r = s$. This distinguishes the coherent Frobenius map in (5.24) from its de Rham lift. The lift is horizontal: its $p$-power representatives are closed even for absolute differentials over $k$, so the connecting operation defining the Gauss–Manin derivative annihilates them. The de Rham pairing is compatible with the connection. Pairing the reduced identity (5.17) with this horizontal class gives
  #[#set math.equation(numbering: n => "(5.25)")
   $ s = sum_j D_j \( g t_j s \) . $ <bc:scalar-differential>]
  The pairing, connection, and (5.17) on the smooth generic family are reductions of their finite characteristic-zero descriptions. The scalar identity (5.25) is obtained in this fiber from the newly constructed horizontal class.
  Factor absolute Frobenius as $Z_0 arrow.r^(F_(upright("rel"))) Z_0^(\( p \)) arrow.r^w Z_0$, where $w$ is the base change of $F_(K_0)$. This is the relative Frobenius factorization of #cite(label("StacksProject")) Tag 0CC6. The relative trace in (5.24) sends $m eta$ to $s m eta^(\( p \))$. The trace for $w$, by flat base change and the projection formula on top forms, applies the Cartier map $"Car"_(K_0) : F_(*) omega_(K_0 \/ k) arrow.r omega_(K_0 \/ k)$ to its remaining base form. Transitivity of finite trace therefore gives the rational identity below; compatibility of trace with this flat base change is #cite(label("StacksProject")) Tag 0E5L.
  #[#set math.equation(numbering: n => "(5.26)")
   $ psi_h \( m \) thin d u = "Car"_(K_0) #scale(x: 120%, y: 120%)[\(] F_(*) \( s m thin d u \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( m in K_0 \) . $ <bc:relative-cartier>]
  We suppress $F_(*)$ in the input notation for $psi_h$. The scalar $s$ stays inside the base Cartier operator. At this point it is only a rational element of $K_0$.
  Suppose (5.23) fails, so $psi_h \( g R_b \) subset frak(m)_(R_b)$. Complete the regular base at $mu \( b \)$:
  $ A = k \[ \[ v_1 \, dots.h \, v_n \] \] \, #h(2em) v_i = u_i - u_i \( mu \( b \) \) \, #h(2em) K = "Frac" \( A \) \, #h(2em) frak(m) = \( v_1 \, dots.h \, v_n \) . $
  The finite completed algebra $R ⊗_(k \[ u \]) A$ is a product of the completed local rings at the points above $mu \( b \)$. They are normal complete local domains; keep the factor $L$ at $b$ and put $K' = "Frac" \( L \)$. After tensoring with $K$, the whole product is finite étale of total dimension $e_mu$: the nonzero $Delta_mu$ is invertible in $K$, and its free étale rank was retained. Thus its factors are finite separable fields and
  #[#set math.equation(numbering: n => "(5.27)")
   $ \[ K' : K \] lt.eq e_mu < p . $ <bc:completed-degree>]
  Write $T = "Tr"_(K' \/ K)$.
  We next transport (5.26) to these fields; this step does not require $s$ to be regular in $L$. Finite Frobenius and the cofinality of the ordinary and Frobenius adic filtrations give $F_(*) R_b ⊗_(R_b) L tilde.eq F_(*) L$, by $\( F_(*) r \) ⊗ x mapsto F_(*) \( r x^p \)$. Hence $psi_h$ extends to $L$ and then to a $K'$-linear map $F_(*) K' arrow.r K'$. The monomials $v^alpha$, $0 lt.eq alpha_i < p$, are a $p$-basis of $K$: decompose power series according to their exponents modulo $p$ and use perfection of $k$. They remain a $p$-basis of the finite separable extension $K'$. They are also a $p$-basis of the embedded $K_0$, since $K_0$ is finite separable over $k \( u_1 \, dots.h \, u_n \)$ and translation by constants of $k$ changes $u_i$ to $v_i$. The Cartier maps computed in these bases agree on $K_0$. The extended $psi_h$ and $m mapsto "Car"_(K') \( F_(*) \( s m thin d u \) \) \/ d u$ agree on the $p$-basis monomials by (5.26); they are both $K'$-linear maps on $F_(*) K'$, so they agree everywhere. The same uniqueness of separable extension shows that the extended derivations in (5.25) agree on $K_0$, so that identity also holds in $K'$ with these operators.
  The failed containment extends to $psi_h \( g L \) subset frak(m)_L$. For every base monomial $a = v^beta$ and each $t_j$ it follows that
  #[#set math.equation(numbering: n => "(5.28)")
   $ T \( psi_h \( g a t_j \) \) in frak(m) . $ <bc:trace-in-maximal>]
  Indeed $T \( L \) subset A$ by integrality and normality. An element of $frak(m)_L$ has all its conjugates in the maximal ideal above $frak(m)$: the integral closure in a finite normal closure is finite over the complete regular ring $A$ and is local by henselianity. Their sum consequently lies in $frak(m)$.
  The common $p$-basis also proves that Cartier commutes with this rational trace. If $x = sum v^alpha c_alpha^p$ in $K'$, then $T \( x \) = sum v^alpha T \( c_alpha \)^p$, since $T \( c^p \) = T \( c \)^p$. Cartier for $d u = d v_1 and dots.h.c and d v_n$ extracts the coefficient with $alpha = \( p - 1 \) upright(bold(1))$ in either field. Hence
  $ T #scale(x: 120%, y: 120%)[\(] "Car"_(K') \( F_(*) \( x thin d u \) \) \/ d u #scale(x: 120%, y: 120%)[\)] = "Car"_K \( F_(*) \( T \( x \) thin d u \) \) \/ d u . $
  Derivations likewise commute with $T$, by uniqueness of their separable extensions. Combining this identity with (5.26) on $K'$ and (5.28), and setting $z_j = T \( g t_j s \) in K$, gives
  $ "Car"_K \( F_(*) \( a z_j thin d u \) \) \/ d u in frak(m) quad upright("for every base monomial ") a . $
  Write uniquely
  $ z_j = sum_(0 lt.eq alpha_i < p) v^alpha c_(j \, alpha)^p \, #h(2em) c_(j \, alpha) in K . $
  Multiplication by $v^(\( p - 1 \) upright(bold(1)) - alpha)$ followed by Cartier extracts exactly $c_(j \, alpha)$. For another exponent $beta$ the exponent vector lies componentwise between $0$ and $2 p - 2$ and has Cartier residue $\( p - 1 \) upright(bold(1))$ only when $beta = alpha$. Consequently every $c_(j \, alpha)$ belongs to $frak(m)$. This proves the required regularity of the traced products, namely
  #[#set math.equation(numbering: n => "(5.29)")
   $ z_j in frak(m)^(\[ p \]) = \( v_1^p \, dots.h \, v_n^p \) A . $ <bc:frobenius-ideal>]
  No regular extension of $s$ or $eta$ across $b$ has entered this argument.
  The reduced expressions (5.18) have coefficients in $A$ at $mu \( b \)$ and ordinary differential order at most $o_g < p$. They preserve $frak(m)^(\[ p \])$, since the ordinary partial derivatives annihilate every $v_i^p$. Their coefficients lie on the regular base $P$, so they pass through the $K$-linear trace $T$. Taking $T$ in (5.25) and using (5.29) gives $T \( s \) in frak(m)^(\[ p \])$. Cartier consequently sends $T \( s \) d u$ into $frak(m) thin d u$. But (5.26) with $m = 1$ gives
  $ "Car"_K \( F_(*) \( T \( s \) d u \) \) \/ d u = T \( psi_h \( 1 \) \) = \[ K' : K \] delta eq.not 0 med \( mod med frak(m) \) \, $
  where (5.27) and $delta in k^(*)$ give the final inequality. This contradiction proves the lemma. ◻
]

=== 5.6 Frobenius on the actual Koszul complexes <frobenius-on-the-actual-koszul-complexes>

In a retained reduction, $F_(Y *) cal(V)$ again belongs locally to $"add" \( E_Y \)$. In fact $F_(Y *) pi_(*) cal(O)_Z = pi_(*) F_(Z *) cal(O)_Z$, and $F_(Z *) cal(O)_Z$ is locally free over the smooth source. Over the semilocal finite algebra above a target point it is finite projective; hence its pushforward is locally in $"add" \( cal(V) \)$, and (5.6) applies. Also $F_(R *) E$ is a finite projective $E$-module when $E$ acts through its Frobenius, so

#[#set math.equation(numbering: n => "(5.30)")
 $ F_(R *) "add"_R \( E \) subset "add"_R \( E \) . $ <bc:frobenius-add>]

The old bound $m_0$ remains valid for $cal(V)$ by the spread split sequences. Apply Lemma 31 also to $F_(Y *) cal(V)$ in this characteristic, and choose one exponent $nu$ valid for both sheaves. This new $nu$ may depend on the reduction and on the chart.

There is a literal identification of complexes

#[#set math.equation(numbering: n => "(5.31)")
 $ F_(R *) C_(p nu) \( cal(V) \) = C_nu \( F_(Y *) cal(V) \) . $ <bc:frobenius-koszul>]

Indeed the term indexed by $j$ is identified by finite Frobenius projection formula as

$ F_(R *) H^0 \( Y \, cal(V) \( j p nu \) \) = H^0 \( Y \, \( F_(Y *) cal(V) \) \( j nu \) \) . $

Multiplication by $y_i^(p nu)$ before pushforward is multiplication by $y_i^nu$ in the pushed module structure. The coordinate ordering and Koszul signs agree, so (5.31) identifies the differentials as well as the terms.

Write $sans(m)_g$ for multiplication by $g$ on the unpushed sheaf or complex. Its pushforward is the map $F_(*) sans(m)_g : F_(*) z mapsto F_(*) \( g z \)$; the scalar action of $g$ on the pushed module instead sends $F_(*) z$ to $F_(*) \( g^p z \)$. The identification (5.31) respects the former map.

The retained $nu_0$ and $p nu$ both satisfy the fiber’s twist bound. Use the $sans(H)$-projective comparison before tensoring with $E$ to apply (5.16) with $nu' = p nu$. Denote its maps by $A' = a j : C_(p nu) \( cal(V) \) arrow.r D$ and $B' = f b : D arrow.r C_(p nu) \( cal(V) \)$, and its homotopy by $H'$. Applying the additive functor $F_(R *)$ to the actual identity gives

#[#set math.equation(numbering: n => "(5.32)")
 $ \( F_(R *) B' \) \( F_(R *) A' \) - F_(R *) sans(m)_g = d \( F_(R *) H' \) + \( F_(R *) H' \) d . $ <bc:pushed-homotopy>]

Under (5.31), this factors the pushed map $F_(*) sans(m)_g$ on $C_nu \( F_(Y *) cal(V) \)$ up to homotopy through the zero-differential complex $F_(R *) D$. The central factor in (5.16) was the original $g$.

Fix a closed point $b$, and choose $t$ as in Lemma 34. On a neighborhood of $b$, put $u = psi_h \( g t \) in R^(*)$. There are $cal(O)_Y$-linear maps

#[#set math.equation(numbering: n => "(5.33)")
 $ cal(V) arrow.r^iota F_(Y *) cal(V) arrow.r^(F_(*) sans(m)_g) F_(Y *) cal(V) arrow.r^(rho_t) cal(V) . $ <bc:cartier-composite>]

Here $iota \( z \) = F_(*) \( z^p \)$ and $rho_t \( F_(*) z \) = psi_Z \( h^(*) t thin z \)$. Their composite is $u "id"_(cal(V))$, because $psi_Z \( h^(*) \( t g \) z^p \) = z thin h^(*) psi_h \( t g \)$. Use the same exponent $nu$ in the two Koszul coresolutions. Naturality makes (5.33) actual chain maps of their section complexes, with exactly the same composite. Compose those chain maps with (5.32) and divide the last map by $u$. This gives actual maps

$ C_nu \( cal(V) \) arrow.r^alpha F_(R *) D arrow.r^beta C_nu \( cal(V) \) \, #h(2em) beta alpha tilde.eq "id"_(C_nu \( cal(V) \)) . $

The displayed homotopy is obtained by composing the actual homotopy in (5.32) with the two chain maps.

For completeness, such a homotopy retract is homotopy split. If $C arrow.r^alpha D arrow.r^beta C$ has $beta alpha tilde.eq "id"_C$ and $d_D = 0$, then $e = alpha beta$ satisfies $e^2 tilde.eq e$. A homotopy between maps from $D$ to itself is zero, so $e^2 = e$ as an actual degreewise map. Its images form a zero-differential complex $D'$. Define

$ alpha' = e alpha : C arrow.r D' \, #h(2em) beta' = beta \|_(D') : D' arrow.r C . $

Then $alpha' beta' = "id"_(D')$ and $beta' alpha' = \( beta alpha \)^2 tilde.eq "id"_C$, so these maps are homotopy inverses. The projection in $alpha'$ is necessary: $alpha$ itself need not factor through $D'$. Idempotents split in modules, so no additional categorical completeness is required.

#thm([Proposition 5.8.])[
  (Ordinary coefficient base change).  #emph[Perform the finite characteristic-zero preparations above on a finite-type integral model. After any fixed finite enlargement of its algebraic and coherent data, and restriction to any nonempty principal open retaining the required identities and geometric properties, one can choose a characteristic-zero closed point and a number-field model with geometric reductions in arbitrarily large residue characteristics $p$ that retain these data and satisfy 
$ psi_X \( 1 \) = delta in k^(*) \, #h(2em) p > e_mu \, quad p > o_g quad upright("on every member of the finite chart cover") . $

 On each such reduction the following assertions hold simultaneously. On every retained source chart, for every $R$-module $M$ and every $i$, the canonical map 
#[#set math.equation(numbering: n => "(5.34)")
 $ \( R^i h_(*) cal(O)_Z \) ⊗_R M arrow.r R^i h_(*) \( h^(*) tilde(M) \) $ <bc:canonical-base-change>]

 is an isomorphism, with ordinary tensor and pullback. In particular, for every coherent module $M$ supported on any finite thickening of $cal(S)$ in $hat(cal(B))$, 
#[#set math.equation(numbering: n => "(5.35)")
 $ chi \( X \, f^(*) M \) = sum_(i = 0)^n \( - 1 \)^i chi \( hat(cal(B)) \, N_i ⊗ M \) . $ <bc:ordinary-euler>]

 One reduction works for all these $M$ and all thickening orders.]
] <bc:ordinary>

#proof[
  The preceding argument makes $C_nu \( cal(V) \)$ homotopy equivalent to a zero-differential complex near every closed point. Its coefficient identifications satisfy (5.2) and (5.3). Lemma 28 therefore gives the canonical map (5.34) for every module on each such neighborhood. Since the base is affine, the cohomology modules correspond to the quasi-coherent direct-image sheaves; the map is multiplication by the pulled-back coefficient.
  The local homotopy splitting extends to a neighborhood of each closed point: its maps involve finite modules, the local function $t$, and the inverse of the unit $u$. These neighborhoods are chosen before any coefficient module $M$. They cover the finite-type chart, since any nonempty closed complement would have a closed point. Consequently the local statement holds as a sheaf statement for every module. The maps are compatible with the étale overlaps and deck actions because they are canonical multiplication maps. Proposition 25 therefore descends them to every supported thickening. The ordinary supported pullback on $X$ is exactly the one constructed there. Taking the Euler characteristic of Leray and using the spread chartwise direct-image isomorphisms of Proposition 27 gives (5.35). Here $N_i ⊗ M$ has the ordinary bounded-support meaning fixed in Section 4; all supports are proper.
  The only choices required before reduction were the finite diagrams, resolutions, one cleared homotopy per chart, and bounded differential identities. The proof of Lemma 31 works for all coefficient modules in each retained fiber, with the old bound for $C_(nu_0)$ retained by the split sequences. The exponent $nu$, the comparison at $p nu$, and the local functions $t$ were constructed anew in that fiber. No spreading of infinitely many Frobenius identities or of the individual modules $M$ occurs. A finite chart cover and Lemma 33 give the asserted simultaneous choice of reductions. ◻
]

== 6 The Euler characteristic of a minimal stratum <eu:section>

We retain the closed stratum $S_0$, its smooth stack $cal(S)$, and its formal neighbourhood $hat(cal(B))$ from Propositions 23 and 25. Thus

$ d = dim cal(S) = dim S_0 \, #h(2em) c = n - d > 0 \, $

and $I$ is the reduced ideal of $cal(S)$. Stabilizers always mean the #emph[full] stabilizers of these charts. In particular, they need not act effectively on $cal(S)$.

#thm([Proposition 6.1.])[
  #emph[If a maximal chart of $B$ is singular, then the closed minimal stratum satisfies 
$ chi_(upright("top")) \( S_0 \) = 0 . $

 Here $chi_(upright("top"))$ is the ordinary Euler characteristic of the coarse space.]
] <eu:euler-zero>

We first globalize the exterior decomposition and choose a full endomorphism quotient on one finite thickening. In characteristic zero, a comparison at one common support point then makes a reference Chern–Todd number vanish. After these finite data have been retained in one good reduction, ordinary base change bounds Frobenius growth and the reference comparison makes every product test have Euler characteristic zero. Three ordinary dual modules finally recover the trivial representation of every full stabilizer.

=== 6.1 Exterior multiplicities and the full truncated quotient <exterior-multiplicities-and-the-full-truncated-quotient>

Use the ambient formal systems $N_i = \( N_(i \, k) \)_(k gt.eq 1)$ of Section 4: on a chart $V_alpha$,

$ N_(i \, k) = Omega_(V_alpha)^(\[ i \]) \/ I_alpha^k Omega_(V_alpha)^(\[ i \]) . $

They are restrictions of reflexive sheaves on the normal ambient charts, not reflexive differentials formed on the nilpotent thickenings. Put

$ N = xor.big_(i = 0)^n N_i \, #h(2em) cal(E) = hat(cal(H))_(N N) \, $

where $hat(cal(H))_(N N)$ is the completion of ambient Hom before quotienting by $I^k$. Flat completion and finite presentation identify it locally with Hom between the completed ambient modules. For the finite tensor diagram used here, write $overline("Hom") \( M \, N \)$ for the quotient of $hat(cal(H))_(M N) \|_(cal(S))$ by the kernel of

$ hat(cal(H))_(M N) \|_(cal(S)) arrow.r \( hat(cal(H))_(N M) \|_(cal(S)) \)^or \, #h(2em) a mapsto #scale(x: 120%, y: 120%)[\(] b mapsto "tr" \( b a \) #scale(x: 120%, y: 120%)[\)] . $

Set

$ overline(cal(E)) = overline("End") \( N \) \, #h(2em) cal(J) = ker \( cal(E) arrow.r overline(cal(E)) \) . $

The fixed transverse product descriptions first make these barred Hom sheaves vector bundles on $cal(S)$ and identify their fibers with the local residual trace quotients. In particular the fibers of $overline(cal(E))$ are semisimple algebras, and

#[#set math.equation(numbering: n => "(6.1)")
 $ I cal(E) subset cal(J) \, #h(2em) cal(J)^ell subset I cal(E) $ <eu:radical-power>]

for one $ell$ after taking a finite cover of $cal(S)$. For a coefficient $M$ supported at order $k$, the finite action uses

$ "im" \( cal(J) arrow.r cal(E) \/ I^k cal(E) \) = cal(J) \/ \( cal(J) ∩ I^k cal(E) \) \, $

followed by its image in $"End" \( N ⊗ M \)$. The filtrations below use these action images. The inclusions in (6.1) follow from Lemma 9, applied to the transverse modules, and from the compatible product presentations and uniform transverse descriptions of Proposition 25 and Lemma 26.

#thm([Lemma 6.2.])[
  #emph[In the barred tensor calculus, the trivial-isotypic multiplicity bundle of $V = N_1$ is canonically 
$ cal(U) = overline("Hom") \( cal(O) \, V \) = Omega_(cal(S))^1 . $

 Let $W$ be the complementary object to this evaluation summand. There are idempotents $p_b in overline(cal(E))$, supported in the $N_b$ block, whose images are $Lambda^b W$. If $L$ is any left $overline(cal(E))$-module, then 
#[#set math.equation(numbering: n => "(6.2)")
 $ upright(bold(1))_(N_i) L tilde.eq xor.big_(a + b = i) Lambda^a Omega_(cal(S))^1 ⊗ p_b L . $ <eu:block-exterior>]

 Moreover, there are an integer $j_0$ and an isotypic idempotent $u$ in the $N_(j_0)$ block such that 
#[#set math.equation(numbering: n => "(6.3)")
 $ u overline(cal(E)) p_b = cases(delim: "{", cal(O)_(cal(S)) u \, & b = j_0 \,, 0 \, & b eq.not j_0 .) $ <eu:isolated-constituent>]

 The identity line in this formula has trivial action under every stabilizer.]
] <eu:exterior>

#proof[
  Ambient vector fields are tangent to the orbit and restrict onto its tangent bundle. Their restriction kernel is the trace kernel: a vector field vanishing at an orbit point pairs to zero there with every reflexive one-form, whereas differentials of ordinary functions detect every nonzero tangent vector. The perfect barred pairing between $V$ and $V^or$ therefore identifies the two multiplicity bundles with $Omega_(cal(S))^1$ and $T_(cal(S))$. Evaluation and contraction give mutually inverse inclusion and projection maps for the trivial-isotypic part. They are intrinsic, so agree on overlaps.
  Exterior multiplication applied to $V = cal(U) ⊗ upright(bold(1)) xor W$ in this quotient category gives $Lambda^i V = xor.big_(a + b = i) Lambda^a cal(U) ⊗ Lambda^b W$. Writing this identity in local dual frames gives matrices of barred Hom maps and their inverses. Applying these matrices to a left module proves (6.2); an unbarred algebra splitting is not needed.
  At each point, Corollary 20 supplies a simple constituent of $Lambda^bullet W$ which occurs once and in exactly one degree $j_0$. The fixed transverse descriptions transport this fiberwise selection, and its degree is locally constant, hence constant on the connected $cal(S)$. In $Lambda^(j_0) V$ its multiplicity is still one: a positive exterior degree of $cal(U)$ would require its occurrence in a smaller degree of $W$. Its isotypic projector is $u$, and Schur’s lemma gives (6.3) fiberwise.
  The selection in the corollary is intrinsic to the independent standard factors and is unchanged by their permutations. The centers of the semisimple block algebras are finite étale over $cal(S)$; in a product presentation their primitive components are constant. The invariant selection therefore defines an algebraic idempotent on the whole component. Finally every automorphism acts on an endomorphism algebra by conjugation and fixes the identity of the selected simple object. This proves the assertion about the character of its identity line, including for ineffective stabilizers. ◻
]

For a finite order $k$, ambient action gives a map

$ cal(E) \/ I^k cal(E) arrow.r "End"_(cal(S)_k) #h(-1em) (xor.big_i N_(i \, k)) . $

This map need be neither injective nor surjective; only its image is the ambient subalgebra of the full endomorphism algebra formed after quotienting. The later Hom cokernel ranges over all maps of transverse modules, including maps without an ambient lift. We therefore need the following quotient of the full algebra, while retaining the ambient image for the filtration-preserving projector used later.

#thm([Lemma 6.3.])[
  #emph[For one sufficiently large integer $k$, set 
$ cal(S)_k = \( hat(cal(B)) \, cal(O) \/ I^k \) \, quad T_i = N_i \/ I^k N_i \, quad T = xor.big_i T_i . $

 There is a canonical surjection 
#[#set math.equation(numbering: n => "(6.4)")
 $ "End"_(cal(S)_k) \( T \) arrow.r overline(cal(E)) $ <eu:full-end-quotient>]

 with nilpotent kernel, compatible with the action of $cal(E)$. After specializing any smooth product parameters, the image of ambient endomorphisms in the specialized $"End" \( T \)$ still surjects onto the specialized barred algebra, with nilpotent kernel.]
] <eu:truncated-end>

#proof[
  First let $\( R \, frak(m) \)$ be a complete transverse local ring and $M$ the corresponding finite direct sum of transverse modules. Put
  $ E = "End"_R \( M \) \, #h(2em) E_j = "End"_R \( M \/ frak(m)^j M \) . $
  For every fixed $j$, the images of $E_l arrow.r E_j$, $l gt.eq j$, form a descending sequence of subspaces of a finite-dimensional vector space. Write $D_j$ for its stable value. The maps $D_(j + 1) arrow.r D_j$ are surjective. Indeed, for $a in D_j$, the images in $E_(j + 1)$ of its lifts to all sufficiently large $E_l$ are nonempty descending affine subspaces; they stabilize and give a lift in $D_(j + 1)$. Recursively choose compatible lifts. Completeness of $M$ identifies $"proj lim"_j E_j$ with $E$, so $D_1$ is exactly the image of $E arrow.r E_1$. This is an all-level argument; stabilization at level one alone would not justify the lifting assertion.
  Choose $k$ for which $"im" \( E_k arrow.r E_1 \) = D_1$. A map in the kernel lowers $M \/ frak(m)^k M$ into its $frak(m)$-multiple, so the $k$-th power of this kernel is zero. Also $ker \( E arrow.r D_1 \) subset "rad" \( E \)$: if $a$ lowers $M$ into $frak(m) M$, then $1 - b a$ is invertible for every $b in E$, by the convergent $frak(m)$-adic geometric series. The trace-radical calculation consequently identifies
  $ D_1 \/ "rad" \( D_1 \) = E \/ "rad" \( E \) . $
  The composite $E_k arrow.r D_1 arrow.r D_1 \/ "rad" \( D_1 \)$ is onto and has nilpotent kernel. Indeed its kernel modulo the lowering kernel is the radical of a finite-dimensional algebra and is nilpotent. Notice that no claim has been made that every element of $E_k$ lifts to $E$; only its residual action must lift.
  On a product presentation, finite quotients and their Hom modules are these fixed transverse objects extended by the smooth parameter ring. Flat extension commutes with their finite presentations and kernels. Thus the chosen exponent works throughout that presentation. Take the maximum of the exponents for a finite cover of $cal(S)$. Assertions about the quotient, its kernel, and a fixed nilpotence exponent descend from faithfully flat completions.
  To check canonicity, let $cal(A)_(upright("res"))$ be the common image of the full and ambient endomorphism algebras in $"End" \( T \/ I T \)$. The original trace quotient $cal(E) arrow.r overline(cal(E))$ kills the kernel of $cal(E) arrow.r cal(A)_(upright("res"))$, by the transverse calculation, and hence factors uniquely through $cal(A)_(upright("res"))$. Composing with $"End" \( T \) arrow.r cal(A)_(upright("res"))$ defines (6.4), including on maps without ambient lifts. Its kernel is the transverse nilpotent ideal extended along the smooth parameters; it need not be the ordinary Jacobson radical of the full algebra over the parameter ring. The quotient is locally a product of matrix algebras over a reduced smooth base and has no nonzero nilpotent two-sided ideal. Thus this kernel is intrinsically the largest nilpotent two-sided ideal. Transition isomorphisms preserve it and the factorization through the residual-action image, so the map glues on the stack independently of the product coordinates.
  After setting the smooth parameters to zero, let $C$ be the image of ambient endomorphisms in the full finite algebra $"End" \( T_o \)$. Product structure identifies $C$ with the transverse ambient image. It maps onto the barred algebra because the original $E$ does. Its kernel is its intersection with the nilpotent kernel of (6.4). Changing the smooth parameter lifts while keeping the transverse coordinates is a formal automorphism preserving $I$; differential tensors transform functorially under it. This conjugates the calculation and does not change any exponent or create an additional lifting obstruction. ◻
]

=== 6.2 A characteristic-zero reference number <a-characteristic-zero-reference-number>

For a coherent sheaf $F$ on a smooth $2 n$-fold $X$ supported in codimension at least $c$, write $\[ F \]_c = "ch"_c \( F \)$. This is its codimension-$c$ support cycle, with the ordinary scheme lengths as multiplicities; it is zero if the support has larger codimension. This is the leading-term property of the Riemann–Roch transformation #cite(label("BaumFultonMacPherson1975")) Chapter III, §§1–2. Over $bb(C)$ we also use $\[ F \]_c$ for the resulting cohomology class with supports. We now construct the reference number in characteristic zero.

#thm([Lemma 6.4.])[
  #emph[Let $F_0 = f^(*) cal(O)_(cal(S))$, using ordinary pullback and the descended closed-subscheme structure on the source. Then 
#[#set math.equation(numbering: n => "(6.5)")
 $ integral_X \[ F_0 \]_c thin "td"_(2 n - c) \( X \) = 0 . $ <eu:reference-vanishing>]

 After restricting a finite coherent model to a nonempty principal open, the same equality holds for the corresponding reference sheaf on every geometric fiber.]
] <eu:reference-number>

#proof[
  We first prove, in complex cohomology with supports, that for one positive rational number $rho$
  #[#set math.equation(numbering: n => "(6.6)")
   $ \[ F_0 \]_c = rho thin f^(*) \[ S_0 \] . $ <eu:cycle-comparison>]
  The supported class $\[ S_0 \]$ exists because $B$ is an oriented rational homology manifold by Proposition 7. Equidimensionality implies that every component of $f^(- 1) \( S_0 \)$ of dimension $2 n - c = n + d$ dominates $S_0$: one whose image has smaller dimension has dimension at most $n + d - 1$.
  Choose #emph[one] maximal chart and #emph[one] lifted component $S'$ of its stratum. For each top-dimensional component of $f^(- 1) \( S_0 \)$, restrict it to the chosen base neighborhood and choose a component of its inverse image under the source torsor of Proposition 25. Its base image is a stratum lift. The deck group is transitive on such lifts over a general coarse point, so translating the chosen source component makes its base image $S'$. This translation leaves its image on $X$ unchanged. Thus one chosen lift $S'$ sees every top component, without requiring transitivity on components of the fibers of $f$. Use the finite projection of Section 5 on this source chart,
  $ pi : Z arrow.r Y = bb(P)_V^n . $
  Each chosen lifted component has dimension $n + d$ and is finite over $S' times bb(P)^n$. It therefore dominates that entire irreducible support. We can now choose #emph[one common general closed point] $y in S' times bb(P)^n$ at which all its reduced preimage support branches are smooth and étale over the support. In analytic germs each of these branches maps isomorphically to the support germ.
  Let $R = hat(cal(O))_(Y \, y)$ and let $A_alpha = hat(cal(O))_(Z \, z_alpha)$ run through the regular local factors above this same point. Write $r_alpha$ for their generic ranks over $R$, and $J subset R$ for the support ideal. The quotient $R \/ J$ is regular. If $m_alpha$ is the scheme multiplicity of the ordinary reference pullback on this branch, the preceding degree-one assertion gives
  $ m_alpha = "rk"_(R \/ J) \( A_alpha \/ J A_alpha \) . $
  Proposition 29, in characteristic zero and over this single target ring, gives
  $ A_alpha^(xor r_beta) tilde.eq A_beta^(xor r_alpha) . $
  Quotienting by $J$ and taking ranks yields
  #[#set math.equation(numbering: n => "(6.7)")
   $ r_beta m_alpha = r_alpha m_beta . $ <eu:common-charzero-ratio>]
  Thus $m_alpha \/ r_alpha$ is one common scalar.
  We compare the cohomological multiplicities by the finite local-degree rule. For a finite local branch, the projection formula with supports, capped with the complex orientation, multiplies the target support class by the generic degree of the branch after pushforward. Dividing by the degree of its reduced support map gives the coefficient of the pulled class. Applied first to the chosen base-chart branch, this gives $lambda \[ S' \]$ as the pullback of $\[ S_0 \]$, with one positive factor $lambda$ on $S'$. The intervening étale base refinement does not change that factor. Applied next to a branch of $pi$, whose reduced support map has degree one at the common point, the same rule gives coefficient $r_alpha$. Hence the coefficient of $f^(*) \[ S_0 \]$ on that branch is $lambda r_alpha$. Equation (6.7) makes the scheme-to-cohomology ratio $m_alpha \/ \( lambda r_alpha \)$ independent of the branch. The source charts are étale, so both kinds of multiplicities descend unchanged. Top support classes are determined at these generic points; this proves (6.6) globally.
  By Propositions 7 and 2, ordinary $H^(2 c) \( B \, bb(Q) \)$ is one-dimensional, and $\[ S_0 \]$ is a multiple of $c_1 \( H \)^c$. Its pullback is therefore a multiple of $e^c$. For every integer $t$, the IHS Riemann–Roch polynomial gives
  $ chi \( X \, f^(*) H^(⊗ t) \) = "RR"_X \( q \( t e \) \) = "RR"_X \( 0 \) \, $
  since $q \( e \) = 0$; see #cite(label("Huybrechts1999")) §1.11. The coefficient of $t^c$ in ordinary Hirzebruch–Riemann–Roch is $frac(1, c !) integral_X e^c "td"_(2 n - c) \( X \)$. It vanishes for $c > 0$. Together with (6.6) this proves (6.5).
  For completeness, specialization of this number does not use rational smoothness of a characteristic-$p$ base. The ordinary coherent sheaf $F_0$ on the smooth projective $X$ has a finite locally free resolution. Include its finitely many terms, maps, kernels, the descended quotient ideal defining $F_0$, and the identification with the ordinary pullback in a finite coherent model. Generic flatness and coherent base change on a nonempty principal open preserve the resolution of that quotient on fibers and support codimension at least $c$. Thus its restriction represents the actual reference pullback on every retained fiber. Its Chern character below codimension $c$ vanishes and its component in codimension $c$ is its actual support cycle. The degree
  $ deg #scale(x: 120%, y: 120%)[\(] "ch"_c \( F_(0 \, s) \) "td"_(2 n - c) \( T_(X_s) \) #scale(x: 120%, y: 120%)[\)] $
  is constant: it is the degree of a fixed relative Chern polynomial in the vector bundles of that resolution and the relative tangent bundle on a smooth proper family. This gives the last assertion. The argument neither keeps track of individual cohomology classes on the reduced base nor requires a constant number of support components. ◻
]

The finite characteristic-zero data needed for the Euler argument are now defined. We first record a finite witness for the ambient inclusion (6.1), which will be used at every thickening order. On a chart put

$ H_alpha = cal(H)_(alpha \, N N) \, #h(2em) J_(alpha \, upright("alg")) = ker #scale(x: 120%, y: 120%)[\(] H_alpha arrow.r i_(alpha *) overline(cal(E))_alpha #scale(x: 120%, y: 120%)[\)] \, $

where $i_alpha : S_alpha arrow.r.hook V_alpha$. Exact noetherian completion identifies the completion of this coherent ambient kernel with $cal(J)$. The target modulo $I_alpha$ is supported on $S_alpha$, so faithful flatness of completion at its stalks gives the finite coherent identities

$ I_alpha H_alpha subset J_(alpha \, upright("alg")) \, #h(2em) J_(alpha \, upright("alg"))^(⊗ ell) arrow.r H_alpha \/ I_alpha H_alpha quad upright("is zero") \, $

where the last map is multiplication. Retaining these identities and their kernels makes completion give (6.1) on every retained fiber at every order.

Fix the presentations of these ambient tensor and trace maps, the exterior idempotents, the full algebra $"End"_(cal(S)_k) \( T \)$, its quotient (6.4), and the kernels, surjections and nilpotence identities for that full quotient at the chosen thickness $k$. Fix also the ordinary reference pullback, its finite locally free resolution and relative Chern–Todd degree from Lemma 39, and coherent cohomology for the finitely many exterior bundles of $Omega_(cal(S))^1$.

Enlarge the common finite algebraic and coherent model of Sections 4–Section 5 by these data. Restrict it to a nonempty principal open on which the defining identities, geometric hypotheses, kernels, images, vector-bundle descriptions and coherent base-change maps are retained. In particular finite presentation and the retained Hom base-change maps identify the specialization of $"End"_(cal(S)_k) \( T \)$ with the #emph[full] endomorphism algebra of the specialized $T$, including its nonlifting maps. Proposition 35 then permits a characteristic-zero closed point of this retained model and arbitrarily large good Cartier reductions of its number-field model. Choose one such geometric reduction, of characteristic $p$, and work over its algebraically closed residue field until the final transfer back to $bb(C)$. This one reduction supplies ordinary base change for every coefficient module and every finite thickening order. The stabilizer congruences below will be imposed on a power of this fixed $p$; they impose no further arithmetic condition on the prime.

=== 6.3 A tame Euler functional <a-tame-euler-functional>

The following fact works over an algebraically closed field of characteristic prime to the stabilizer orders. Its Euler characteristic is coherent cohomology of the stack, not integration weighted by stabilizers. For a vector bundle $V$, we use $lambda_(- 1) \( V \) = sum_a \( - 1 \)^a \[ Lambda^a V \]$ in $K^0$. For a vector bundle $G$ on a possibly disconnected stack, $"rk" \( G \)$ denotes the largest of its ranks on the connected components. On the empty stack we set this rank to zero; its Euler functional is zero.

#thm([Lemma 6.5.])[
  #emph[Let $cal(D)$ be a smooth proper tame Deligne–Mumford stack of pure dimension $d$ with projective coarse space. The functional 
$ Theta \( G \) = chi #scale(x: 120%, y: 120%)[\(] cal(D) \, lambda_(- 1) \( Omega_(cal(D))^1 \) ⊗ G #scale(x: 120%, y: 120%)[\)] $

 on vector bundles is additive, and its additive extension to $K^0 \( cal(D) \)$ depends only on pointwise full-stabilizer representations. There is a constant $C_(cal(D))$ such that $\| Theta \( G \) \| lt.eq C_(cal(D)) "rk" \( G \)$ for every vector bundle $G$. Consequently, for any finite signed presentation $V = sum_i a_i \[ G_i \]$, one has 
$ \| Theta \( V \) \| lt.eq C_(cal(D)) sum_i \| a_i \| "rk" \( G_i \) . $

 The latter bound uses the chosen presentation, not the virtual rank.]
] <eu:tame-functional>

#proof[
  There are finitely many connected components. The functional and its representation dependence are componentwise; if the estimate holds on them with constants $C_j$, summing gives the stated bound with $C_(cal(D)) = sum_j C_j$ under our rank convention. We may therefore assume $cal(D)$ connected.
  Let $A$ be the pullback of an ample line bundle from the coarse space and set
  $ Theta_m \( G \) = sum_(a = 0)^d \( - 1 \)^a chi #scale(x: 120%, y: 120%)[\(] cal(D) \, Lambda^a Omega_(cal(D))^1 ⊗ A^(- m a) ⊗ G #scale(x: 120%, y: 120%)[\)] . $
  The coarse pushforward is exact by tameness #cite(label("AbramovichOlssonVistoli2008")) Definition 3.1 and Theorem 3.2. The usual Euler polynomial on its projective coarse space shows that $Theta_m \( G \)$ is a polynomial in $m$ of degree at most $d$.
  For $m$ sufficiently large, global sections of $T_(cal(D)) ⊗ A^m$ evaluate onto the invariant tangent vectors at every residual gerbe. To see the uniform assertion, push this bundle to the coarse space, use an ample twist to generate that coherent sheaf, and use exactness of invariants to restrict to a residual gerbe. At a point $x$ with stabilizer $J_x$, the possible values are exactly $\( T_x cal(D) \)^(J_x)$. The locus where this dimension is at most $r$ has dimension at most $r$. On a finite quotient chart, its stabilizer strata lie in fixed loci of subgroups; these are smooth for tame actions and their tangent spaces are the invariant tangent spaces. There are finitely many relevant subgroup strata on a finite atlas.
  For a stratum of dimension $s$ with invariant tangent dimension $r$, the incidence of sections vanishing at a point has codimension $r$ in the space of sections over that point. Since $s lt.eq r$, a general section has a zero scheme $Z_m$ of dimension at most zero. At every zero its $d$ components generate an ideal of height $d$ in a regular local ring. They are a regular sequence, and their Koszul complex gives
  $ Theta_m \( G \) = chi \( Z_m \, G \|_(Z_m) \) . $
  This remains valid when $Z_m$ is empty.
  The right side is a finite sum of invariant dimensions on zero-dimensional quotient charts. Filtering their Artin rings by powers of the maximal ideal expresses each summand as an integral linear functional of the fiber representation $G_x$. Its absolute value is bounded by a fixed constant times $dim G_x$. In particular, it depends only on these fiber representations, not on the transition functions of $G$. Choose $d + 1$ distinct sufficiently large integers $m$. Polynomial interpolation expresses $Theta_0$ as a fixed rational linear combination of the corresponding $Theta_m$. This proves both assertions for bundles, with one constant independent of $G$. Additivity extends the representation dependence to virtual classes, and the triangle inequality gives the displayed presentation bound. The construction uses the full finite groups at zeroes and applies without an effectiveness assumption. ◻
]

Apply the lemma to $cal(S)$ in the fixed reduction. Call a coherent module $M$ supported on a finite thickening a #emph[product module] if, in completed product coordinates and after forgetting the group action, it is a finite-length transverse module extended by the smooth parameter ring. The parameters may depend on the chart and the test.

For such a coefficient module, define $F^(a *) M$ by ordinary tensor along Frobenius on the ambient charts and use its natural compatibility with the groupoid maps to descend it. It is then regarded as a module on a finite thickening annihilating it. In completed coordinates $B_(upright("loc")) = R_(upright("tr")) \[ \[ t_1 \, dots.h \, t_d \] \]$, ordinary associativity gives

$ F_(B_(upright("loc")))^(a *) \( B_(upright("loc")) ⊗_(R_(upright("tr"))) M_(upright("tr")) \) tilde.eq B_(upright("loc")) ⊗_(R_(upright("tr"))) F_(R_(upright("tr")))^(a *) M_(upright("tr")) . $

Thus Frobenius pullback preserves product form without any flatness assumption on Frobenius of the transverse ring.

For a product module $M$, filter $N ⊗ M$ by $cal(J)^s \( N ⊗ M \)$ and denote the direct sum of its successive quotients by $L \( M \)$. This filtration is finite by (6.1); each quotient is killed by $I$, has a $overline(cal(E))$-action, and is a vector bundle on $cal(S)$. The last assertion is the transverse product calculation. Define

#[#set math.equation(numbering: n => "(6.8)")
 $ gamma \( M \) = sum_(b = 0)^n \( - 1 \)^b \[ p_b L \( M \) \] in K^0 \( cal(S) \) . $ <eu:gamma>]

Ordinary base change, additivity along the filtration, and (6.2) give

#[#set math.equation(numbering: n => "(6.9)")
 $ chi \( X \, f^(*) M \) = chi #scale(x: 120%, y: 120%)[\(] cal(S) \, lambda_(- 1) \( Omega_(cal(S))^1 \) ⊗ gamma \( M \) #scale(x: 120%, y: 120%)[\)] . $ <eu:euler-test>]

Every tensor product in this formula is ordinary. In particular no flatness in the transverse directions has been assumed.

#thm([Lemma 6.6.])[
  #emph[For a fixed product module $M$ on a fixed good reduction, putting $q = p^a$ gives 
$ chi \( X \, F_X^(a *) f^(*) M \) = O \( q^c \) . $

 The implicit constant may depend on the reduction and on $M$.]
] <eu:growth>

#proof[
  If $I^b M = 0$, choose generators $x_1 \, dots.h \, x_v$ for the maximal ideal of the transverse ring. Its Frobenius pullback is killed by $\( frak(m)^b \)^(\[ q \])$, which contains $\( x_1^(b q) \, dots.h \, x_v^(b q) \)$ and hence $frak(m)^(v b q)$. A fixed number of generators for $M$ also generates its ordinary Frobenius pullback. Hilbert–Samuel growth in transverse dimension $c$ therefore bounds its length by $O \( q^c \)$. Tensoring with each of the fixed $N_i$ changes this by only a fixed generator bound. The total rank of the graded pieces of $L \( F^(a *) M \)$, and hence the sum of the ranks in its expression (6.8), is $O \( q^c \)$ on a finite atlas.
  The annihilating thickness just obtained grows with $q$. The all-modules, all-orders conclusion of Proposition 35 therefore matters here: it applies to each new coefficient $F^(a *) M$ in this same reduction. The Frobenius square commutes with ordinary pullback on the ambient charts and with their étale descent, so $f^(*) F^(a *) M = F_X^(a *) f^(*) M$. Applying (6.9) and Lemma 40 proves the bound with the original test and prime fixed. ◻
]

=== 6.4 Support transfer and vanishing of product tests <support-transfer-and-vanishing-of-product-tests>

#thm([Lemma 6.7.])[
  #emph[On a fixed good reduction, every product module $M$ satisfies 
#[#set math.equation(numbering: n => "(6.10)")
 $ integral_X "ch"_c \( f^(*) M \) "td"_(2 n - c) \( X \) = 0 . $ <eu:test-leading-zero>]

 Consequently 
#[#set math.equation(numbering: n => "(6.11)")
 $ chi \( X \, f^(*) M \) = chi #scale(x: 120%, y: 120%)[\(] cal(S) \, lambda_(- 1) \( Omega_(cal(S))^1 \) ⊗ gamma \( M \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eu:all-tests-zero>]

]
] <eu:test-number>

#proof[
  If $M$ has support of dimension less than $d$, its ordinary pullback has codimension greater than $c$ by equidimensionality, and its codimension-$c$ character is zero. Otherwise repeat the common-chart and lifted-component choice from Lemma 39 in this fixed reduction, using the retained labelled source torsor. Translating a lift of each top component to the same $S'$ again makes every component visible there. Now take the generic point $eta$ of $S' times bb(P)^n$. Complete its target local ring and call it $R$; its residue field is $K = kappa \( eta \)$. Let $A_alpha$ be all the regular complete local factors over it. Write
  $ r_alpha = "rk"_R A_alpha \, #h(2em) h_alpha = \[ kappa \( A_alpha \) : K \] \, #h(2em) m_alpha \( Q \) = "length"_(A_alpha) \( A_alpha ⊗_R Q \) $
  for a finite-length $R$-module $Q$. Here $Q$ is the module induced by $M$; the reference module is $K$. The finite-regular-module identity and length over $R$ give, for every pair of factors,
  #[#set math.equation(numbering: n => "(6.12)")
   $ r_beta h_alpha m_alpha \( Q \) = r_alpha h_beta m_beta \( Q \) \, #h(2em) r_beta h_alpha m_alpha \( K \) = r_alpha h_beta m_beta \( K \) . $ <eu:residue-lengths>]
  The second lengths are positive. Division cancels both generic ranks and residue degrees and shows
  $ frac(m_alpha \( Q \), m_alpha \( K \)) = frac(m_beta \( Q \), m_beta \( K \)) . $
  Proposition 29 applies at these nonclosed points with their residue-field Frobenius degrees; no perfection of $K$ is being assumed. All top components are visible over this one generic point, because every chosen lift dominates the support under the finite projection. If factors split in reduction, include every new factor in (6.12). Descent through the étale source charts shows that
  $ \[ f^(*) M \]_c = rho_M \[ F_0 \]_c $
  as support cycles, for a scalar $rho_M$ depending possibly on $M$ and on the good prime. Lemma 39 proves (6.10).
  It remains to explain why this one coefficient suffices. Frobenius is flat on the smooth $X$, and Chern characters of ordinary Frobenius pullbacks satisfy $"ch"_i \( F_X^(a *) F \) = q^i "ch"_i \( F \)$; one can check this on a finite vector-bundle resolution by the splitting principle. Hirzebruch–Riemann–Roch, applied additively to that finite resolution #cite(label("BaumFultonMacPherson1975")) §0.1, therefore gives the polynomial
  #[#set math.equation(numbering: n => "(6.13)")
   $ chi \( X \, F_X^(a *) f^(*) M \) = sum_(i = c)^(2 n) q^i integral_X "ch"_i \( f^(*) M \) "td"_(2 n - i) \( X \) \, #h(2em) q = p^a . $ <eu:rr-polynomial>]
  The growth bound of Lemma 41 kills its coefficients for $i > c$. Equation (6.10), proved independently, kills the coefficient for $i = c$. Thus the polynomial is identically zero; evaluating at $q = 1$ and using (6.9) proves (6.11). The scalar $rho_M$ is fixed before the Frobenius exponent varies. Uniformity of that scalar in $M$, in the prime, or in Frobenius pullbacks is unnecessary. ◻
]

=== 6.5 Three ordinary tests and cancellation of stabilizer weights <three-ordinary-tests-and-cancellation-of-stabilizer-weights>

We finish by constructing three product modules whose signed coefficient in (6.8) has the same fiber representation as the trivial line, up to a single sign. The reason for three modules is the following transverse identity. Let $A$ be a transverse Artin ring at a geometric point, with its full stabilizer action, and let $Y arrow.r F$ be an equivariant map of finite $A$-modules with actual kernel $Z$. For any equivariant finite $A$-module $Q$, left exactness of Hom gives, in the stabilizer representation ring,

#[#set math.equation(numbering: n => "(6.14)")
 $ & \[ "Hom"_A \( Q \, F \) \] - \[ "Hom"_A \( Q \, Y \) \] + \[ "Hom"_A \( Q \, Z \) \]\
 & thin = #scale(x: 120%, y: 120%)[\[] "coker" #scale(x: 120%, y: 120%)[\(] "Hom"_A \( Q \, Y \) arrow.r "Hom"_A \( Q \, F \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\]] . $ <eu:hom-cokernel-template>]

Here Hom carries its full stabilizer action, before taking invariants. Neither surjectivity of $Y arrow.r F$ nor projectivity of $Q$ is required. We will choose the evaluation image so that this cokernel is the selected barred corner. Ordinary duality will turn the three Hom terms into the three coefficients in (6.8); the construction must therefore preserve the actual kernel under specialization.

Let $cal(A)_i$ be the inverse image of zero under the map

#[#set math.equation(numbering: n => "(6.15)")
 $ "Hom"_(cal(S)_k) \( T_i \, T_(j_0) \) arrow.r u overline(cal(E)) upright(bold(1))_(N_i) \, #h(2em) a mapsto u macron(a) . $ <eu:right-ideal>]

The sum of these blocks is a right ideal under precomposition in the full endomorphism algebra. By Lemma 38, this is a coherent ideal defined on $cal(S)_k$, without choosing a global lift of $u$.

#thm([Lemma 6.8.])[
  (Stabilizers and parameters).  #emph[The restriction of the ordinary ambient Kähler cotangent sheaf to $cal(S)$ is a vector bundle faithful on every stabilizer. At a point with stabilizer $H$, one can choose smooth parameters on the completed stratum and lift them to the ambient local ring so that their span, and therefore their generated ideal, is $H$-stable. These assertions remain true for the spread diagrams in characteristics prime to all the chart-group orders.]
] <str:stabilizer-parameters>

#proof[
  In a product chart the restricted ordinary cotangent is $Omega_(S_U)^1 xor \( frak(m)_(t_0) \/ frak(m)_(t_0)^2 \) ⊗ cal(O)_(S_U)$, hence is locally free. This is the ordinary cotangent, which records all embedding directions, not its reflexive hull. A finite-order automorphism of a complete local ring that is trivial on its cotangent space and has order invertible in the residue field is trivial: it is the identity on the associated graded, and at the first nonzero order of its difference from the identity, iteration multiplies that difference by the order, a contradiction. Equivalently, average lifts of a cotangent basis and apply complete Nakayama. A deck stabilizer acts faithfully on the ambient germ, so its cotangent representation is faithful.
  The surjection from the ambient maximal ideal to the cotangent space of the smooth stratum admits an $H$-equivariant linear section by averaging. Its finite-dimensional image gives the desired lifted functions. Their restrictions are coordinates by the formal inverse function theorem. They can be chosen as algebraic local functions before completion, since a finite group average of such functions is again algebraic locally. Lemma 26 permits this change of parameters. The arguments use only finite group averaging and invertibility of the parameter Jacobian, and hence apply in the indicated reductions as well. ◻
]

#thm([Lemma 6.9.])[
  (Rectification of product generators).  #emph[Let $K$ be a field, let $A$ be an Artin local $K$-algebra with residue field $K$, and put $C = A \[ \[ t_1 \, dots.h \, t_d \] \]$. Fix finite $A$-modules $E_i \, F$ and submodules $Q_i subset "Hom"_A \( E_i \, F \)$. Given surjections $C^(r_i) arrow.r Q_i ⊗_A C$, form their evaluation map 
$ Phi : xor.big_i \( E_i ⊗_A C \) ⊗_C C^(r_i) arrow.r F ⊗_A C . $

 An automorphism of each $C^(r_i)$ makes $Phi$ the scalar extension of a fixed map of finite $A$-modules, with possible zero columns. Its kernel, image and cokernel are consequently extensions of finite $A$-modules, are flat over $K \[ \[ t_1 \, dots.h \, t_d \] \]$, and specialize exactly on setting the parameters to zero.]
] <str:rectification>

#proof[
  Choose a minimal $A$-generating list $q_1 \, dots.h \, q_m$ of $Q_i$. Lift these constant elements through the given surjection. Their residue classes in $C^(r_i) \/ frak(m)_C C^(r_i)$ are independent, since their images form a basis of $Q_i \/ frak(m)_A Q_i$. Complete them to a basis of the free module. The first $m$ columns are then exactly the $q_j$; subtract suitable combinations of these columns from the others to make the latter zero. These invertible column operations on $C^(r_i)$ induce invertible operations on $\( E_i ⊗_A C \) ⊗_C C^(r_i)$ even if $E_i$ is not $A$-flat. Evaluation respects the same column operations, so the resulting map has constant coefficients in the asserted sense. Flatness of $A arrow.r A \[ \[ t \] \]$ preserves its kernel, image and cokernel. A finite $A$-module extended in this way is finite free over $K \[ \[ t \] \]$ as a $K \[ \[ t \] \]$-module, which proves exact specialization. ◻
]

When a stabilizer acts on the original objects in Lemma 44, the change of basis need not be equivariant. It proves product form and exact specialization only. The original maps and their kernels keep their given actions; their characters are computed after specialization by an invariant parameter ideal from Lemma 43.

When $d = 0$, the parameter list is empty, the rectification is already transverse, and the cotangent determinant used below is the trivial line.

Choose once and for all a power $q_0 = p^b$ such that

#[#set math.equation(numbering: n => "(6.16)")
 $ q_0 gt.eq k \, #h(2em) q_0 equiv 1 med \( mod med m \) quad upright("for every stabilizer order ") m . $ <eu:frobenius-choice>]

There are finitely many orders and each is prime to $p$. Taking $b$ to be a sufficiently large common multiple of the orders of $p$ in the corresponding unit groups gives this choice. The same $q_0$ will serve both the generating bundle and the dual modules; it is distinct from the unbounded powers $q = p^a$ in Lemma 41.

#thm([Lemma 6.10.])[
  #emph[There exist vector bundles $P_i$ on $cal(S)_k$ with surjections $P_i arrow.r.twohead cal(A)_i$. For their evaluation map 
#[#set math.equation(numbering: n => "(6.17)")
 $ Y_0 = xor.big_i T_i ⊗ P_i arrow.r^(med Phi med) T_(j_0) \, #h(2em) Z_0 = ker Phi \, $ <eu:evaluation>]

 the source, target, kernel, image and cokernel are product modules. The kernel sequence remains exact after setting the smooth product parameters to zero, including when those parameters have been chosen equivariantly for a point stabilizer.]
] <eu:three-modules>

#proof[
  By Lemma 43, the ordinary ambient cotangent restricted to $cal(S)$ is a vector bundle faithful on every full stabilizer. Since $q_0 gt.eq k$, ambient Frobenius factors through a map $Phi_(q_0) : cal(S)_k arrow.r cal(S)$. Pulling back that bundle gives a bundle on $cal(S)_k$ whose stabilizer representations remain faithful: raising roots of unity of order prime to $p$ to the $q_0$-th power is a permutation. A finite sum of bounded tensor powers contains every irreducible representation of each stabilizer. One elementary justification is that matrix coefficients of a faithful representation separate elements of a finite group, hence generate its function algebra; their products are matrix coefficients of tensor powers. There is one bound for a finite quotient atlas and its finitely many subgroup types. Dual powers may equally be included.
  Let $G$ be such a generating bundle. If $cal(A)$ is any coherent sheaf on $cal(S)_k$, exact coarse pushforward and sufficiently ample coarse twists generate the invariant Hom sheaf from $G$ to $cal(A)$. The evaluation maps then surject on every residual gerbe, since $G$ contains all its simple types. Nakayama makes them surjective on stalks. Taking suitable finite sums of twists of $G$ gives the $P_i$. This is the generating-sheaf criterion of #cite(label("OlssonStarr2003")) Definition 5.1 and Theorem 5.2, here realized by the faithful ambient cotangent bundle.
  For the product assertion, complete at a point and forget the action temporarily. Put
  $ A = R_(upright("tr")) \/ frak(m)_(upright("tr"))^k \, #h(2em) D = K \[ \[ t_1 \, dots.h \, t_d \] \] \, #h(2em) C = A ⊗_K D . $
  Every $T_i$ is $M_i ⊗_K D$ for a finite $A$-module $M_i$. In these coordinates $u$ is a constant primitive central idempotent in the $N_(j_0)$ block: its center is the fixed transverse center tensored with the local ring $D$, and its idempotents are constant. Thus the finite-dimensional transverse Hom calculation and (6.4) give $cal(A)_i = A_i ⊗_K D$, where $A_i subset "Hom"_A \( M_i \, M_(j_0) \)$ is the kernel of the transverse map $a mapsto u macron(a)$ in (6.15). Trivialize $P_i$, so its surjection is $C^(r_i) arrow.r A_i ⊗_K D$. Apply Lemma 44 with $E_i = M_i$, $F = M_(j_0)$ and $Q_i = A_i$. It makes the evaluation a fixed transverse map extended by $D$ and proves that its kernel, image and cokernel are product modules, flat over $D$, whose sequences specialize exactly modulo $\( t_1 \, dots.h \, t_d \)$.
  These basis changes establish formal product form only; they need not be equivariant. The actual bundles, maps and kernel in (6.17) keep their original equivariant structures. For character calculations, choose equivariant lifts of the smooth stratum parameters by tame averaging, as in Lemma 43. Their ideal is stable under the stabilizer. The formal automorphism fixing the transverse ring in Lemma 26 transports the tensor, full Hom, trace and ideal data to these new product coordinates. Reapplying Lemma 44 there proves flat specialization for this stable ideal. Completion detects the coherent local properties claimed here; it does not assert an algebraic equivariant product splitting. ◻
]

The ring of each completed chart of $cal(S)_k$ is an Artin ring extended by $d$ smooth parameters, so $cal(S)_k$ is Cohen–Macaulay. We now construct the global dualizing sheaf used in the tests. The fixed Frobenius factor $Phi_(q_0) : cal(S)_k arrow.r cal(S)$ is representable and finite. On a tame quotient chart Frobenius induces an isomorphism on each finite stabilizer, which proves representability; finiteness can then be checked on the charts. In completed product coordinates $A \[ \[ t_1 \, dots.h \, t_d \] \]$, with $A$ the transverse Artin algebra, its structure map from the smooth parameter ring uses $t_i^(q_0)$. This makes the source finite free over that ring. Define $omega_(cal(S)_k)$ by the $\( Phi_(q_0) \)_(*) cal(O)_(cal(S)_k)$-module

$ \( Phi_(q_0) \)_(*) omega_(cal(S)_k) = "Hom"_(cal(O)_(cal(S))) \( \( Phi_(q_0) \)_(*) cal(O)_(cal(S)_k) \, omega_(cal(S)) \) \, #h(2em) \( a lambda \) \( b \) = lambda \( a b \) . $

Finite Hom duality and the trace for Frobenius of a smooth parameter disk identify this locally with $A^(*)$ tensored with the parameter volume line, where $A^(*) = "Hom"_K \( A \, K \)$ over the residue field. Hom for a finite locally free algebra commutes with étale base change; the smooth trace is compatible with the same base change. Hence these local identifications glue with their actual stabilizer actions. This gives the dualizing sheaf and its product description. It need not be invertible: the transverse Artin algebra need not be Gorenstein. The pullback $Phi_(q_0)^(*) omega_(cal(S))$ is an invertible line bundle. For $T' = T_(j_0) \, Y_0 \, Z_0$ define the #emph[ordinary] dual module

#[#set math.equation(numbering: n => "(6.18)")
 $ M_(T') = "Hom"_(cal(S)_k) \( T' \, omega_(cal(S)_k) \) ⊗ \( Phi_(q_0)^(*) omega_(cal(S)) \)^(- 1) . $ <eu:dual-test>]

No derived dual is meant. Finite duality in the product coordinates shows that these are product modules, so Lemma 42 applies to all three.

#thm([Lemma 6.11.])[
  #emph[At each geometric point of $cal(S)$, in the representation ring of its full stabilizer, 
#[#set math.equation(numbering: n => "(6.19)")
 $ gamma \( M_(T_(j_0)) \) - gamma \( M_(Y_0) \) + gamma \( M_(Z_0) \) = \( - 1 \)^(j_0) \[ upright(bold(1)) \] . $ <eu:trivial-fiber>]

]
] <eu:character-extraction>

#proof[
  Let the stabilizer be $J$, choose the equivariant smooth parameters from Lemma 45, and denote specialization modulo them by a subscript $o$. Let $A$ be the resulting transverse Artin ring over the algebraically closed residue field $K$, and let $delta = det \( Omega_(cal(S) \, o)^1 \)$ be the one-dimensional cotangent determinant representation of $J$.
  The completed finite map to the smooth parameter disk computes the canonical module $omega_C$ as finite Hom to the disk’s canonical module #cite(label("StacksProject")) Tag 0AX0. The ring is finite free over the parameter ring, so this dualizing complex is concentrated in its canonical degree. The chosen parameter span is stabilizer-stable, with determinant $delta$, and the parameters form a regular sequence on $C = A \[ \[ t_1 \, dots.h \, t_d \] \]$. Equivariant Koszul adjunction gives
  $ #scale(x: 120%, y: 120%)[\(] omega_C \/ \( t_1 \, dots.h \, t_d \) omega_C #scale(x: 120%, y: 120%)[\)] ⊗ delta^(- 1) tilde.eq omega_A tilde.eq A^(*) \, #h(2em) A^(*) = "Hom"_K \( A \, K \) . $
  Thus the specialized dualizing module is $A^(*) ⊗_K delta$ with its actual stabilizer action. Product form justifies specialization of Hom, and finite duality gives $"Hom"_A \( T'_o \, A^(*) \) tilde.eq \( T'_o \)^(*)$ equivariantly, where $\( - \)^(*) = "Hom"_K \( - \, K \)$. The other line in (6.18) has character $delta^(- q_0)$. Consequently
  #[#set math.equation(numbering: n => "(6.20)")
   $ \( M_(T') \)_o tilde.eq \( T'_o \)^(*) ⊗ delta^(1 - q_0) tilde.eq \( T'_o \)^(*) . $ <eu:det-cancellation>]
  The last isomorphism is an assertion about the stabilizer representation: (6.16) makes $delta^(1 - q_0)$ trivial. It does not assert that the corresponding global line bundle is trivial.
  For each $j$, consider the image $C_j$ of the ambient $N_j$ endomorphisms in $"End"_A \( T_(j \, o) \)$. By Lemma 38, it surjects onto the barred corner with nilpotent kernel. This is a $J$-equivariant surjection. Exactness of tame invariants makes $C_j^J$ surject onto the invariant barred corner, whose idempotent $p_j$ we want to lift. The invariant kernel is still nilpotent, so idempotent lifting gives
  $ p'_j in C_j^J \, #h(2em) overline(p'_j) = p_j . $
  An explicit lifting proof starts with a lift $a$ and corrects $a^2 - a$ successively modulo powers of the nilpotent ideal; $2 a - 1$ is invertible modulo that ideal because its square is $1$ there. The corrections take place inside $C_j^J$. A global unbarred projector is not asserted.
  Being in the #emph[ambient image] has an additional consequence. Choose an ambient endomorphism inducing $p'_j$ after specialization. It preserves every $cal(J)^s \( N ⊗ M_(T') \)$ because $cal(J)$ is a two-sided ideal. On the specialized associated graded its action is $p_(j \, o)$, since the residual specialization of this representative is $p_(j \, o)$; no assertion about its residual action before specialization is needed. Product form makes the filtration specialize exactly. The idempotent $p'_j$ therefore splits the specialized filtered module with graded image $p_(j \, o) L \( M_(T') \)_o$. Thus in the representation ring,
  #[#set math.equation(numbering: n => "(6.21)")
   $ #scale(x: 120%, y: 120%)[\[] \( p_j L \( M_(T') \) \)_o #scale(x: 120%, y: 120%)[\]] = #scale(x: 120%, y: 120%)[\[] \( p'_j T_(j \, o) \) ⊗_A \( T'_o \)^(*) #scale(x: 120%, y: 120%)[\]] = #scale(x: 120%, y: 120%)[\[] "Hom"_A \( p'_j T_(j \, o) \, T'_o \)^(*) #scale(x: 120%, y: 120%)[\]] . $ <eu:fiber-hom>]
  The second equality is ordinary finite-dimensional tensor–Hom duality: dualizing its left-hand tensor gives $"Hom"_A \( p'_j T_(j \, o) \, T'_o \)$.
  Put $Q_j = p'_j T_(j \, o)$. Lemma 45 identifies $Z_(0 \, o)$ with the actual kernel of the specialized evaluation $Phi_o : Y_(0 \, o) arrow.r T_(j_0 \, o)$. Apply (6.14) with $Q = Q_j$ and this specialized evaluation. We compute the image of its Hom map explicitly. Each evaluation column belongs to the right ideal (6.15), and precomposing it by any map from $Q_j$ remains in that ideal. Conversely, a right-ideal map $Q_j arrow.r T_(j_0 \, o)$ extends by zero on $\( 1 - p'_j \) T_(j \, o)$ to an element of $cal(A)_(j \, o)$. Express that element in the generating columns of $P_(j \, o)$ and restrict to $Q_j$. These expressions lift it through $Y_(0 \, o)$. This verifies equality of the image with the indicated ideal, using all $A$-linear maps and with their genuine $J$-actions.
  The full quotient (6.4) now identifies that cokernel with $u overline(cal(E))_o p_j$. Surjectivity on this corner follows by lifting any barred map to a full truncated map and precomposing with $p'_j$; its kernel is exactly the inverse-image ideal just described. Dualizing the signed identity and using (6.21) leaves $\[ \( u overline(cal(E))_o p_j \)^(*) \]$. By (6.3) this is zero unless $j = j_0$, when it is the invariant identity line. Summing with the signs $\( - 1 \)^j$ in (6.8) proves (6.19). ◻
]

#proof[
  Equation (6.11) vanishes for the three modules (6.18). Take their signed sum. By Lemma 46 its coefficient has at every point the representation $\( - 1 \)^(j_0) upright(bold(1))$. Lemma 40 therefore gives
  #[#set math.equation(numbering: n => "(6.22)")
   $ chi #scale(x: 120%, y: 120%)[\(] cal(S) \, lambda_(- 1) \( Omega_(cal(S))^1 \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eu:cotangent-euler-zero>]
  This coherent Euler characteristic is retained from characteristic zero in the chosen model. Indeed the finitely many exterior bundles, proper coarse pushforward and coherent cohomology can be spread with base change; tame coarse pushforward is exact. Thus (6.22) holds for the original complex stack.
  Finally on smooth finite quotient charts the holomorphic de Rham complex resolves the constant sheaf, and taking invariants is exact in characteristic zero. Hypercohomology Euler characteristics, and proper GAGA #cite(label("PortaYu2016")) Theorem 7.1, identify
  $ sum_(a \, b) \( - 1 \)^(a + b) dim H^b \( cal(S) \, Omega_(cal(S))^a \) = sum_i \( - 1 \)^i dim H^i \( S_0 \, bb(C) \) . $
  The rational or complex cohomology of a finite stabilizer has no positive degrees; hence passage to the coarse space in this identity does not insert stabilizer weights. This remains true for stabilizers acting trivially on a chart. The left side is (6.22), proving the claimed ordinary Euler vanishing. ◻
]

== 7 Deformations with fixed base and the case $b_2 gt.eq 5$ <def:section>

We work in characteristic zero again and write $f_0 : X_0 arrow.r B$ for the original projective fibration, with $e = c_1 \( f_0^(*) H \)$ and symplectic form $sigma_0$. Matsushita’s deformation theorem supplies a morphism defined by a relatively generated line bundle on the entire nearby $e$-Hodge locus. We prove that its normal Stein target is analytically $B times D$, including when $B$ is singular, by first splitting the parameter directions locally and then using the rigidity of $B$. The nearby manifolds need only be compact Kähler.

We then follow the inverse image of the fixed closed stratum of Proposition 23 through the family. When $b_2 gt.eq 5$, this variation forces the Hodge cohomology of $cal(S)$ to be diagonal, contradicting Proposition 36. We first record a restriction calculation that will also control transported fiber polarizations in Section 9.

#thm([Lemma 7.1.])[
  #emph[Let $i : F arrow.r.hook X_0$ be a smooth fiber over the smooth locus of $f_0$. Then 
#[#set math.equation(numbering: n => "(7.1)")
 $ ker #scale(x: 120%, y: 120%)[\(] i^(*) : H^2 \( X_0 \, bb(C) \) arrow.r H^2 \( F \, bb(C) \) #scale(x: 120%, y: 120%)[\)] = e^perp . $ <def:kernel-equation>]

]
] <def:restriction-kernel>

#proof[
  The smooth fibers have one common cohomology class, and intersecting $n$ general hyperplanes of the base gives $e^n = deg_H \( B \) \[ F \]$. Polarizing the Fujiki relation, and using $q \( e \) = 0$, gives a positive constant $a$ such that
  #[#set math.equation(numbering: n => "(7.2)")
   $ integral_F i^(*) xi_1 dots.h.c i^(*) xi_n = a product_(j = 1)^n q \( e \, xi_j \) #h(2em) \( xi_j in H^2 \( X_0 \, bb(C) \) \) . $ <def:mixed-fujiki>]
  Indeed, in every nonzero pairing of the $2 n$ entries $e \, dots.h \, e \, xi_1 \, dots.h \, xi_n$, each copy of $e$ must be paired with a different $xi_j$. Positivity of $a$ follows by taking all $xi_j$ to be an ample class $h$; in particular $q \( e \, h \) > 0$.
  The restrictions of $sigma_0$ and $macron(sigma)_0$ vanish. If $xi in H^(1 \, 1) \( X_0 \, bb(R) \)$ and $q \( e \, xi \) = 0$, Equation (7.2) gives
  $ integral_F i^(*) xi thin \( i^(*) h \)^(n - 1) = 0 \, #h(2em) integral_F \( i^(*) xi \)^2 \( i^(*) h \)^(n - 2) = 0 $
  when $n gt.eq 2$. The Hodge index theorem on $F$ makes the second quadratic form negative definite on the primitive real $\( 1 \, 1 \)$-classes, so $i^(*) xi = 0$. For $n = 1$, the first integral already proves this, since $H^2 \( F \, bb(R) \)$ is one-dimensional. Thus $e^perp$ is contained in the kernel. Conversely, the first equality in Equation (7.2), with one entry $xi$ and all other entries $h$, shows that every class whose restriction vanishes is orthogonal to $e$. The Hodge decomposition and complexification give Equation (7.1). ◻
]

Let $D$ be a sufficiently small polydisc about the original point in the locus $"Def" \( X_0 \, e \)$ on which $e$ is of type $\( 1 \, 1 \)$. The local Torelli theorem identifies this smooth germ with the period hyperplane $q \( e \, sigma_t \) = 0$. Write $pi : cal(X) arrow.r D$ for the restricted Kuranishi family, and use its cohomology marking throughout.

#thm([Proposition 7.2.])[
  (Fixed-base deformation).  #emph[After shrinking $D$, there is a proper holomorphic map 
$ frak(f) : cal(X) arrow.r B times D $

 over $D$ whose central fiber is $f_0$. Every $f_t : X_t arrow.r B$ has connected fibers, and every irreducible component of every fiber is an $n$-dimensional Lagrangian subvariety. Under the chosen marking, $c_1 \( f_t^(*) H \) = e$ for every $t$. For some $m > 0$, the extension of $f_0^(*) H^m$ is relatively generated and defines these fibrations after Stein factorization.]
] <def:fixed-base>

#proof[
  Choose $m > 0$ so that $H^m$ is very ample, and put $L_0 = f_0^(*) H^m$. The local universal deformation of the pair $\( X_0 \, L_0 \)$ is the restriction of the Kuranishi family to
  $ q \( c_1 \( L_0 \) \, sigma_t \) = m q \( e \, sigma_t \) = 0 \, $
  and carries an extension $cal(L)$ of $L_0$; this is #cite(label("MatsushitaDeformations2016")) Theorem 1.1. Thus its restriction to a small polydisc is exactly the family $cal(X) arrow.r D$ chosen above. Theorem 1.2 and Corollary 1.3 of the same source give a locally free sheaf $cal(E) = pi_(*) cal(L)$ and a surjective evaluation $pi^(*) cal(E) arrow.r cal(L)$. Their hypotheses are the original Lagrangian fibration over the projective $B$ and $L_0 = f_0^(*) H^m$ with $H^m$ very ample; the nearby fibers may be nonprojective compact Kähler manifolds. The resulting proper morphism is
  $ Phi : cal(X) arrow.r bb(P)_D \( cal(E) \) . $
  Here $bb(P)_D \( cal(E) \)$ parametrizes one-dimensional quotients. The cohomology-and-base-change argument in Theorem 1.2 identifies $cal(E) ⊗ k \( 0 \)$ with $H^0 \( X_0 \, L_0 \)$. Since $f_(0 *) cal(O)_(X_0) = cal(O)_B$, projection formula identifies this last space with $H^0 \( B \, H^m \)$. Hence $Phi_0$ is $f_0$ followed by the very ample embedding of $B$ defined by the complete system $\| H^m \|$.
  Let $cal(Y)$ be the image of $Phi$, with its reduced analytic structure, and let
  $ cal(X) arrow.r^F cal(B) arrow.r^nu cal(Y) subset bb(P)_D \( cal(E) \) $
  be its relative Stein factorization. Write $p : cal(B) arrow.r D$. The space $cal(B)$ is normal because $cal(X)$ is normal, and $p$ is proper. For each $t$, take the normal Stein factorization of the induced map to its image,
  $ X_t arrow.r^(g_t) Z_t arrow.r Phi_t \( X_t \) . $
  Here $Z_t$ is normal and finite over a projective variety, and $g_t$ has connected fibers. Corollary 1.3 gives a general Lagrangian fiber. The symplectic form on the compact Kähler manifold $X_t$ is $d$-closed. Thus the proper map $g_t$ satisfies #cite(label("Matsushita2000")) Theorem 1, which makes every irreducible component of every fiber an $n$-dimensional Lagrangian subvariety. The underlying set of each fiber of $F$ is a connected component of a fiber of $Phi_t$, and hence is the underlying set of a fiber of $g_t$. In particular $F$ is equidimensional of relative dimension $n$. This determines its fiber dimensions before any identification of a fiber of $cal(B)$ with a fiberwise Stein target.
  We prove that $p$ is locally an analytic product before making any base-change assertion for its central fiber. Fix $b in p^(- 1) \( 0 \)$ and $x in F^(- 1) \( b \)$. A general codimension-$n$ smooth slice through $x$ in $X_0$ meets $F^(- 1) \( b \)$ only at $x$ as a germ. Extend its local defining equations to $cal(X)$. The resulting slice $Y$ is smooth over $D$, and its map to the germ $\( cal(B) \, b \)$ is finite and dominant. This follows from the isolated-fiber criterion for a finite map of analytic germs and equality of dimensions. Let $R subset A$ be the corresponding finite extension of local rings and let $r$ be its generic degree. Here $R$ is normal, $A$ is regular, and the parameter functions $t_1 \, dots.h \, t_s$ are part of a smooth coordinate system on $Y$.
  Choose derivations $delta_i$ of $A$ satisfying $delta_i \( t_j \) = delta_(i j)$. Define
  #[#set math.equation(numbering: n => "(7.3)")
   $ partial_i \( a \) = 1 / r "Tr"_("Frac" A \/ "Frac" R) #scale(x: 120%, y: 120%)[\(] delta_i \( a \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) a in R . $ <def:trace-derivations>]
  Trace takes $A$ into $R$: its values are integral over $R$ and belong to its fraction field, and $R$ is normal. Trace is $R$-linear, so the Leibniz rule shows that $partial_i$ is a derivation of $R$, with $partial_i \( t_j \) = delta_(i j)$. Holomorphic derivations of an analytic space have local flows. For example, embed the germ in a polydisc, lift the derivation to a vector field preserving its defining ideal, and restrict the ambient flow. Successive flows of the $partial_i$ give an isomorphism of germs
  #[#set math.equation(numbering: n => "(7.4)")
   $ \( cal(B) \, b \) tilde.eq \( p^(- 1) \( 0 \) \, b \) times \( D \, 0 \) $ <def:base-local-product>]
  over $D$. The lifts need not commute: inverse flows in the reverse order give the inverse product map.
  Normality of $cal(B)$ now implies normality of $p^(- 1) \( 0 \)$. The central factorization has connected first fibers and a finite second map, and its composite is $Phi_0$, the complete system $\| H^m \|$ pulled back by $f_0$. Uniqueness of Stein factorization therefore identifies $p^(- 1) \( 0 \)$ with the original $B$.
  It remains to globalize Equation (7.4). It gives an exact sequence
  $ 0 arrow.r T_(cal(B) \/ D) arrow.r T_(cal(B)) arrow.r p^(*) T_D arrow.r 0 . $
  The relative tangent sheaf is flat over $D$ and restricts to $T_B$, as is seen in the local products. By Corollary 3, $H^1 \( B \, T_B \) = 0$. Proper coherent semicontinuity consequently gives $R^1 p_(*) T_(cal(B) \/ D) = 0$ after shrinking. Also $p_(*) cal(O)_(cal(B)) = cal(O)_D$, since each fiber of $p$ is the image of the connected $X_t$ and is therefore connected. Pushing forward the tangent sequence and using that $D$ is Stein therefore gives global holomorphic lifts of the coordinate vector fields of $D$. Properness supplies one neighborhood on which their successive flows are defined along the whole central fiber. These flows give $cal(B) tilde.eq B times D$ over $D$. The resulting $frak(f)$ has the asserted fiber properties. The line bundle $frak(f)^(*) "pr"_B^(*) H$ on $cal(X)$ restricts centrally to $f_0^(*) H$, so its fiber Chern classes are the flat class $e$ under the chosen marking. ◻
]

#prodef([Remark 7.3.])[
  The vanishing $H^1 \( B \, T_B \) = 0$ comes from the original projective fibration. Proposition 48 produces proper holomorphic fibrations on every small $e$-deformation, whose sources may be nonprojective compact Kähler manifolds. Thus the next argument uses an open set in the full period hyperplane. Section 9 will select a projective member by constructing an integral Kähler class.
] <def:nonprojective-warning>

Assume that a nonquotient germ remains, and retain the closed stratum $S_0$, its smooth stack $cal(S)$, and $d = dim cal(S) < n$ from Proposition 23. The local charts in Proposition 8 identify the preimage of this stratum with its smooth orbit on each maximal chart.

#thm([Lemma 7.4.])[
  #emph[On a maximal chart, let $g : Y arrow.r V$ be one of the lifted smooth source maps, and let $S subset V$ be the orbit stratum. At every $y in g^(- 1) \( S \)$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ d g_y \( T_y Y \) subset T_(g \( y \)) S . $ <def:differential-tangency>]

 The same assertion holds on each parameter fiber of the family in Proposition 48.]
] <def:tangent-to-orbit>

#proof[
  First take a smooth slice $T$ through $y$ finite over $\( V \, g \( y \) \)$. For a vector $v in T_y T$, choose a local derivation $delta$ of $T$ with that value. The normalized trace construction in Equation (7.3) gives a derivation $partial$ of $V$. Because the chosen local finite branch has only $y$ over $g \( y \)$, the trace of a function specializes to its value at $y$ times the local degree. Thus $partial \( g \( y \) \) = d g_y \( v \)$. Evaluations of all local derivations of the chart are precisely the tangent space of its orbit, by Proposition 23. This proves Equation (7.5) for vectors tangent to the slice.
  The tangent spaces of finite smooth slices span $T_y Y$. Indeed, the condition that a complementary linear slice miss the projectivized fiber tangent cone is a nonempty open condition in the appropriate Grassmannian; its tangent planes cannot all lie in a proper linear subspace. Taking these slices proves the claim for every vector. The argument is analytic and applies unchanged to the compact Kähler deformations. The normalized source covers used here are smooth: their maps to $cal(X)$ are finite and unramified outside a set of codimension at least two, by equidimensionality, and hence are étale by purity. ◻
]

Resolve the reduced inverse image of $S_0 times D$ in $cal(X)$ by a resolution functor compatible with smooth maps, using the complex analytic form of #cite(label("BierstoneMilman2008")) Theorem 1.1. After shrinking around the compact central fiber, finitely many blowups suffice. Discard components whose image in $D$ is proper, and then restrict to a nonempty open $D^compose subset D$ over which the resolution is a smooth proper family. Its fibers will be denoted $Q_t$. They are compact Kähler manifolds: they are projective modifications of analytic subspaces of the compact Kähler fibers $X_t$. The lifted chart torsors descend to maps

$ j_t : Q_t arrow.r X_t \, #h(2em) h_t : Q_t arrow.r cal(S) \, $

and some component of $Q_t$ dominates $S_0$. We may allow $Q_t$ to be disconnected.

#thm([Lemma 7.5.])[
  (Hamiltonian map along the stratum).  #emph[Put $omega_t = j_t^(*) sigma_t$. There is a holomorphic bundle map 
#[#set math.equation(numbering: n => "(7.6)")
 $ cal(H)_t : h_t^(*) Omega_(cal(S))^1 arrow.r T_(Q_t) \, #h(2em) iota_(cal(H)_t \( theta \)) omega_t = h_t^(*) theta \, #h(2em) d h_t compose cal(H)_t = 0 . $ <def:hamiltonian-equations>]

 It is independent of local extensions of $theta$ to ambient base forms, and the maps are compatible with the family over $D^compose$.]
] <def:hamiltonian>

#proof[
  On a maximal chart, lift a form on the smooth orbit to an ordinary holomorphic one-form $tilde(theta)$ on the ambient base chart. On its smooth source define the relative Hamiltonian vector field $v$ by $iota_v sigma_t = g^(*) tilde(theta)$. It is vertical on the dense locus where the fibration is smooth, because those fibers are Lagrangian, and hence it is vertical everywhere. Equivalently, Hamiltonians of two functions pulled back from the base have identically zero Poisson bracket. Thus the local flow preserves the reduced inverse image of the stratum.
  If two extensions of $theta$ are chosen, their difference belongs to $I Omega_V^1 + d I$, where $I$ is the ideal of the orbit. Its pullback as a covector on the smooth source is zero at every point over the orbit, by Lemma 50. Nondegeneracy of the ambient symplectic form then says that the difference of the two vector fields is zero on this reduced inverse image. Consequently they induce the same derivation there.
  Functoriality for the smooth joint flow map and for the product with its parameter disc lifts the relative flow on the reduced total inverse image to the total analytic resolution over $D^compose$. The lifted flow fixes the deformation parameter, so differentiation gives relative vector fields there. Additivity, $cal(O)$-linearity, and compatibility on overlapping charts hold on the dense isomorphism locus of the total resolution. Their differences are holomorphic relative vector fields, so these identities extend over that total resolution. This gives a relative bundle map. The contraction and verticality identities also hold on the same dense locus and extend as holomorphic relative tensor identities over the total resolution. Restricting the map and identities to $Q_t$ gives Equation (7.6). In particular the image vectors are pairwise isotropic and annihilate every form pulled back from $cal(S)$. ◻
]

We recall the Hodge-theoretic meaning of this smooth stack. Its rational and complex cohomology are those of $S_0$: finite stabilizers have no positive-degree cohomology with these coefficients, whether or not they act effectively #cite(label("Behrend2004")) Proposition 36. Moreover $cal(S)$ has a Kähler orbifold metric. For example, pull back a Fubini–Study form from a projective embedding of $S_0$. In a finite chart its potential has a strict minimum at the marked point. The regularized maximum with a sufficiently small invariant positive quadratic potential, shifted by a small positive constant, agrees with the old potential near the chart boundary and is strictly plurisubharmonic near that point. It remains semipositive elsewhere. Finitely many such modifications and their sum give a positive form everywhere. The compact Kähler orbifold Hodge theorem gives Hodge decomposition and the Kähler identities in this proper étale groupoid setting #cite(label("MilanovSaito")) Definition 5.23 and Theorems 5.26–5.28. The complex orientation and properness also give Poincaré duality #cite(label("Behrend2004")) Corollary 25. We use this ordinary cohomology, rather than an inertia-weighted Euler characteristic.

#thm([Proposition 7.6.])[
  #emph[If $b_2 \( X \) gt.eq 5$, the base $B$ has only quotient singularities.]
] <def:large-betti>

#proof[
  Suppose a stratum $cal(S)$ as above exists. We prove
  #[#set math.equation(numbering: n => "(7.7)")
   $ H^(p \, q) \( cal(S) \) = 0 #h(2em) \( p eq.not q \) . $ <def:diagonal-hodge>]
  If $d = 0$, its coarse space is a point, already contradicting Proposition 36; we may assume $d > 0$.
  Fix $alpha in H^(p \, q) \( cal(S) \)$ with $p > q$, and set $k = d - p + 1$. On every $Q_t$,
  #[#set math.equation(numbering: n => "(7.8)")
   $ omega_t^k thin h_t^(*) alpha = 0 . $ <def:holomorphic-vanishing>]
  To verify it, first note that the pullback of $sigma_t$ by every smooth space mapping into a fiber of $f_t$ is zero. On a resolution of each irreducible fiber component this follows from the Lagrangian assumption and extension of holomorphic forms. For a map whose image is contained in a proper subvariety of that component, resolve a component of its proper base change to that resolution which dominates the source. Pullback of forms by a dominant map is injective, giving the same conclusion. Thus, at a general point where $h_t$ has constant rank, $omega_t$ vanishes on two vertical vectors. Each of its terms has at least one horizontal one-form factor. Wedge multiplication by $omega_t^k$ consequently kills the pullback of every holomorphic $p$-form on $cal(S)$, since $k + p > d$. This equality of holomorphic bundle maps extends from the dense open set and implies Equation (7.8) on Dolbeault cohomology.
  Work over a simply connected small open subset of $D^compose$. Smooth proper transport makes the maps $j_t^(*)$ and $h_t^(*)$ constant on cohomology. Accordingly
  $ v mapsto \( j_t^(*) v \)^k thin h_t^(*) alpha $
  is one fixed homogeneous polynomial with values in a fixed cohomology group. It vanishes on all period vectors over that open set, by Equation (7.8). The quadratic form on $e_(bb(C))^perp$ has radical $bb(C) e$ and rank $b_2 - 2 gt.eq 3$. Its null cone is therefore irreducible. Local Torelli and Proposition 48 imply that the periods just used contain an analytic open subset of its projectivization. Such an open set is Zariski dense. Hence the polynomial vanishes on the whole cone, including the conjugate period of our chosen fiber. Suppressing $t$, we have obtained
  #[#set math.equation(numbering: n => "(7.9)")
   $ macron(omega)^(thin k) h^(*) alpha = 0 . $ <def:antiholomorphic-vanishing>]
  We give the contraction step with its coefficients retained. This avoids replacing a sheaf-valued class by its exterior product before the contractions have been applied. If $alpha eq.not 0$, Poincaré duality supplies $beta in H^(d - p \, d - q) \( cal(S) \)$ with $alpha beta eq.not 0$. Pass to the conjugate complex structures and put
  $ cal(A) = h^(*) Omega_(overline(cal(S)))^1 \, #h(2em) r = d - q \, #h(2em) s = macron(omega) in H^0 \( macron(Q) \, Omega_(macron(Q))^2 \) . $
  Write $rho : cal(A) arrow.r Omega_(macron(Q))^1$ for differential pullback. In this notation
  $ h^(*) alpha in H^p \( macron(Q) \, Omega_(macron(Q))^q \) \, #h(2em) tilde(beta) = h^(*) beta in H^(d - p) \( macron(Q) \, Lambda^r cal(A) \) . $
  The second class is kept in the indicated coefficient bundle; it has not yet been wedge-mapped to $Omega_(macron(Q))^r$. Since $p > q$, we have $r gt.eq k$. Apply the exterior coproduct
  $ Delta_(k \, r - k) : Lambda^r cal(A) arrow.r Lambda^k cal(A) ⊗ Lambda^(r - k) cal(A) $
  to its coefficients. Cup Equation (7.9) with this class, contract the first $k$ coefficient factors by $overline(cal(H))$ from Lemma 51, and wedge the remaining $r - k$ factors as basic forms. All these are holomorphic sheaf maps on $macron(Q)$, so they induce well-defined operations on its sheaf cohomology. Their output belongs to $H^d \( macron(Q) \, Omega_(macron(Q))^d \)$.
  Here is the exterior-algebra computation of that output. If $a_1 \, dots.h \, a_k$ are local sections of $cal(A)$ and $eta$ is a basic $q$-form, the identities
  $ iota_(overline(cal(H)) \( a \)) s = rho \( a \) \, #h(2em) iota_(overline(cal(H)) \( a \)) rho \( b \) = 0 $
  give
  $ iota_(overline(cal(H)) \( a_k \)) dots.h.c iota_(overline(cal(H)) \( a_1 \)) \( s^k and eta \) = \( - 1 \)^(k \( k - 1 \) \/ 2) k ! thin rho \( a_1 \) and dots.h.c and rho \( a_k \) and eta . $
  For a decomposable $r$-form the signed shuffle coproduct followed by wedge multiplication is $binom(r, k)$ times the original form. It follows, with only an overall sign depending on conventions, that the preceding sheaf cup operation is
  #[#set math.equation(numbering: n => "(7.10)")
   $ plus.minus k ! binom(r, k) thin h^(*) \( alpha beta \) . $ <def:contraction-output>]
  Its input was zero, so Equation (7.10) forces $h^(*) \( alpha beta \) = 0$.
  That is impossible. Choose a component $Q'$ dominating $S_0$, a Kähler form $kappa$ on $Q'$, and a Kähler orbifold form $tau$ on $cal(S)$. If $N = dim Q'$, then
  $ integral_(Q') h^(*) tau^d and kappa^(N - d) > 0 : $
  the integrand is nonnegative and positive on the nonempty open set where $h$ has rank $d$. Thus the top class of $cal(S)$ pulls back nontrivially. As $alpha beta$ is a nonzero top class, it cannot pull back to zero. This proves the vanishing for $p > q$; complex conjugation proves Equation (7.7).
  The Euler number is now
  $ chi_(upright("top")) \( S_0 \) = sum_(p = 0)^d h^(p \, p) \( cal(S) \) > 0 \, $
  because the coarse stratum is nonempty and connected. This contradicts Proposition 36. There can therefore be no nonquotient germ. ◻
]

#prodef([Remark 7.7.])[
  The irreducibility just used is the only place in this section where $b_2 gt.eq 5$ is required. When $b_2 = 4$, the restricted quadratic form has rank two, and its null cone is the union of two distinct linear components. A local period branch lies in one component and its conjugate in the other. The continuation from Equation (7.8) to Equation (7.9) then does not follow. The two rank-four arguments below are necessary for exactly this reason.
] <def:rank-four-boundary>

== 8 The isotrivial case when the second Betti number is four <iso:section>

#thm([Proposition 8.1.])[
  #emph[Let $f : X arrow.r B$ be the projective Lagrangian fibration of Section 2. If $b_2 \( X \) = 4$ and the polarized period map of its smooth fibers has zero variation, then every germ of $B$ is a quotient singularity.]
] <iso:exclusion>

Throughout the section we assume these hypotheses. The proof starts with the original fibration $f$. Its constant abelian fiber and rational transcendental plane produce a normal variety $T$ with two finite maps: a Galois cover $p : T arrow.r B$, and a map $a : T arrow.r A$ to an abelian variety. We compare their ramification indices with the multiplicity of a divisor in a fiber of $f$. The resulting inequalities control both the linear monodromy and the lifting of vector fields near a minimal stratum. This is the isotrivial cover; the finite cover of $B$ by an abelian variety constructed from a second Lagrangian fibration in the next section has a different role.

Finite-cover descriptions and the Hodge theory of isotrivial Lagrangian systems are developed systematically by Kim–Laza–Martin #cite(label("KimLazaMartin2026")) Section 2.4; the construction below retains the two distinct ramification maps needed for our rank-four argument.

#thm([Lemma 8.2.])[
  #emph[The Picard number of $X$ is two, and 
$ bb(T)_(bb(Q)) := "NS" \( X \)_(bb(Q))^perp quad upright("satisfies") quad bb(T)_(bb(Q)) ⊗_(bb(Q)) bb(C) = bb(C) \[ sigma \] xor bb(C) \[ overline(sigma) \] . $

 For every prime divisor $D subset B$, there is a unique prime divisor $F_D subset X$ dominating $D$. Near the generic point of $D$, 
$ f^(*) D = m_D F_D $

 for a positive integer $m_D$.]
] <iso:vertical-divisor>

#proof[
  Since $h^(2 \, 0) \( X \) = h^(0 \, 2) \( X \) = 1$, we have $h^(1 \, 1) \( X \) = 2$. An ample class $h$ and the nonzero isotropic class $e$ are linearly independent, so they span $"NS" \( X \)_(bb(Q))$. Their Beauville form is nondegenerate, and its orthogonal complement is the stated rational plane.
  Let $F$ be any divisor dominating $D$. Its restriction to a general smooth fiber is zero, whereas $h$ restricts nontrivially and $e$ restricts to zero. Therefore $\[ F \] = a e$ with $a in bb(Q)$. Intersecting with an ample class to the power $2 n - 1$ shows $a > 0$. Choose positive integers $k \, l$ with $k \[ F \] = l e$. After multiplying once more if necessary, this is equality of integral classes. Since $H^1 \( X \, cal(O)_X \) = 0$, the exponential sequence gives
  $ cal(O)_X \( k F \) tilde.eq f^(*) H^(⊗ l) . $
  The section defining $k F$ is pulled back from a section of $H^(⊗ l)$, because $f_(*) cal(O)_X = cal(O)_B$. Its zero set consequently contains every component over the generic point of $D$. Its support is $F$, so there is only one such component. A local uniformizer of $D$ now has divisor $m_D F_D$. ◻
]

#thm([Lemma 8.3.])[
  #emph[There exist a normal projective variety $T$, a finite group $G$, an $n$-dimensional abelian variety $P$, and an $n$-dimensional abelian variety $A$, with the following properties.]
  + #emph[The map $p : T arrow.r B$ is finite Galois with group $G$, and the main base change of $X$ is birational over $T$ to $P times T$. The action on the first factor is by constant affine automorphisms preserving an ample line bundle on $P$.]
  + #emph[There is a finite surjective $G$-equivariant morphism $a : T arrow.r A$, where $G$ acts affinely on $A$. The linear actions on $P$ and $A$ have the same kernel.]
  + #emph[Writing this kernel as $K$, and writing $A_l$ for the quotient of $A$ by the finite group of translations induced by $K$, there are finite morphisms 
$ T_l := T \/ K arrow.r^(med a_l med) A_l \, #h(2em) T_l arrow.r^(med p_l med) B . $

 The group $G_l := G \/ K$ is the Galois group of $p_l$, and acts on $A_l$ with faithful linear part.]
] <iso:abelian-model>

#proof[
  Choose an ample line bundle on $X$, and use its restriction to polarize the smooth fibers. Constancy of the polarized moduli map means that the geometric generic fiber, after choosing an origin, is a fixed polarized abelian variety $P$. The origin and a polarized isomorphism are defined over a finite extension of $bb(C) \( B \)$: each is specified by finitely many algebraic data over its algebraic closure. Alternatively, a sufficiently high level structure gives this isomorphism on a dense open by the fine moduli space of polarized abelian varieties.
  We can also make the actual line bundle constant. Once its numerical polarization has been matched with a fixed ample bundle $L_P$ on $P$, their difference lies in $"Pic"^0 \( P \)$. The polarization isogeny
  $ P arrow.r "Pic"^0 \( P \) \, #h(2em) x mapsto t_x^(*) L_P ⊗ L_P^(- 1) $
  allows us to remove that difference by a translation after a further finite extension. Take a Galois closure and normalize $B$ in it. The resulting $T$ is projective and normal. The descent automorphisms of $P$ preserve $L_P$. The group $"Aut" \( P \, L_P \)$ is finite: its translation subgroup is the finite kernel of the polarization isogeny, and its origin-preserving subgroup is a discrete subgroup of the compact unitary group of the polarization. Thus each descent automorphism, initially over the function field of $T$, is a constant affine automorphism over $bb(C)$. This proves the first assertion.
  Take a $G$-equivariant projective resolution $tilde(T) arrow.r T$. The rational map $P times tilde(T) arrow.r.dashed X$ pulls $sigma$ back to a holomorphic two-form $tilde(sigma)$ on $P times tilde(T)$. To see regularity, resolve the graph; its pulled-back form descends across the birational map to the smooth product, since holomorphic differential forms are unchanged by a proper birational modification of smooth varieties. Choose a basis $alpha_1 \, dots.h \, alpha_n$ of $H^0 \( P \, Omega_P^1 \)$. The Künneth decomposition and the Lagrangian condition give
  #[#set math.equation(numbering: n => "(8.1)")
   $ tilde(sigma) = sum_(i = 1)^n alpha_i and gamma_i + beta \, #h(2em) gamma_i in H^0 \( tilde(T) \, Omega_(tilde(T))^1 \) \, quad beta in H^0 \( tilde(T) \, Omega_(tilde(T))^2 \) . $ <iso:cross-term>]
  There is no two-form term from $P$. At a general point the pulled-back form is nondegenerate and $P$ is Lagrangian; hence the $gamma_i$ are pointwise independent there.
  We spell out the rationality needed for an abelian quotient. Graph pullback and projection onto the Künneth summand give a morphism of rational Hodge structures
  $ bb(T)_(bb(Q)) arrow.r H^1 \( P \, bb(Q) \) ⊗ H^1 \( tilde(T) \, bb(Q) \) . $
  Contract its image with $H^1 \( P \, bb(Q) \)^or$, and denote the resulting rational subspace of $H^1 \( tilde(T) \, bb(Q) \)$ by $W_(bb(Q))$. By Lemma 55 and (8.1),
  $ W_(bb(Q)) ⊗ bb(C) = chevron.l gamma_1 \, dots.h \, gamma_n chevron.r_(bb(C)) xor chevron.l overline(gamma_1) \, dots.h \, overline(gamma_n) chevron.r_(bb(C)) . $
  It is a rational weight-one Hodge substructure of dimension $2 n$. To form the corresponding Albanese quotient, take the annihilator of $W_(bb(Q))$ in $H_1 \( "Alb" \( tilde(T) \) \, bb(Q) \)$. It is a rational Hodge subspace, so its real span and its lattice define a connected complex subtorus. Restriction of an ample polarization makes this an abelian subvariety. The quotient is an abelian variety $A$ of dimension $n$; its one-forms pull back to the span of the $gamma_i$. The induced morphism $tilde(a) : tilde(T) arrow.r A$ is generically finite. The subspace $W_(bb(Q))$ is $G$-stable; the Albanese functor consequently gives an affine action on $A$ making $tilde(a)$ equivariant.
  We next descend this morphism to $T$. Let $C'$ be a curve contracted by $tilde(T) arrow.r T$. The rational map from $P times C'$ to $X$, interpreted on a resolved graph, has image in one fiber of $f$. The pullback of $sigma$ on that graph is zero. Here the Lagrangian condition also applies if the image lies in a smaller subvariety of a fiber component: resolve the component, on which the pulled-back form vanishes, and dominate the smaller subvariety by proper base change. Restriction of (8.1) and contraction in the $P$ directions now show that each $gamma_i$ vanishes on the normalization of $C'$. It follows that $tilde(a)$ is constant on every contracted curve. It is constant on each connected resolution fiber as well: a positive-dimensional projective image of such a fiber in an abelian variety would contain the image of a noncontracted curve. The fibers of $tilde(T) arrow.r T$ are connected and $T$ is normal, so this proves descent to a morphism $a : T arrow.r A$.
  Equivariance gives a generically finite morphism $macron(a) : B = T \/ G arrow.r A \/ G$. Pull back an ample line bundle from the projective quotient $A \/ G$. The result is a nef and big line bundle on $B$; because $rho \( B \) = 1$, it is numerically a positive multiple of an ample class and hence is ample. Thus $macron(a)$ contracts no curve and is finite. The commutative quotient square then shows that $a$ is finite too.
  Finally the cross pairing in (8.1) is perfect between the tangent spaces of the two abelian factors. Its invariance shows that an element has trivial linear action on $P$ if and only if it has trivial linear action on $A$. Such an element acts on $A$ by a translation. Quotienting its finite translation image gives $A_l$, and equivariance gives the stated finite map from $T \/ K$. The derivative representation is unchanged by an isogeny, so the linear action of $G_l$ on $A_l$ is faithful. ◻
]

#thm([Lemma 8.4.])[
  #emph[Let $D subset B$ be a prime divisor, let $E subset T$ be a prime divisor over $D$, and put $D_A = a \( E \)$. Write 
$ M = e_E \( p \) \, #h(2em) L = e_E \( a \) $

 for the ramification indices of the two finite maps, and let $m_D$ be the fiber multiplicity in Lemma 55. Then 
#[#set math.equation(numbering: n => "(8.2)")
 $ L m_D lt.eq M . $ <iso:multiplicity-bound>]

 The linear part of a generator of the cyclic inertia is either the identity or a pseudoreflection, on both $A$ and $P$. If $M_l \, L_l$ are the analogous indices for $p_l \, a_l$, then 
#[#set math.equation(numbering: n => "(8.3)")
 $ L_l lt.eq M_l . $ <iso:linear-ramification-bound>]

]
] <iso:ramification>

#proof[
  The maps and divisors being compared fit into the following diagram. The upper square commutes as rational maps, and the lower square is the quotient square from Lemma 56.
  #cetz.canvas({
  import cetz.draw: *
  content((0, 1.6), [#text(size: 9pt)[$P times T supset P times E$]])
  content((6.1, 1.6), [#text(size: 9pt)[$X supset F_D$]])
  content((0, 0), [#text(size: 9pt)[$T supset E$]])
  content((6.1, 0), [#text(size: 9pt)[$B supset D$]])
  content((0, -1.6), [#text(size: 9pt)[$A supset D_A$]])
  content((6.1, -1.6), [#text(size: 9pt)[$A/G$]])
  line((0, 1.6), (6.1, 1.6), stroke: (thickness: 0.4pt, dash: "dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((3.05, 1.6), [#text(size: 9pt)[$phi$]], anchor: "south")
  line((0, 1.6), (0, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((0, 0.8), [#text(size: 9pt)[$"pr"_T$]], anchor: "east")
  line((6.1, 1.6), (6.1, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((6.1, 0.8), [#text(size: 9pt)[$f$#linebreak()\(ord\_F\_D\(f^\*t\)=m\_D\)]], anchor: "west")
  line((0, 0), (6.1, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((3.05, 0), [#text(size: 9pt)[$p$ finite Galois#linebreak()\(e\_E\(p\)=M\)]], anchor: "south")
  line((0, 0), (0, -1.6), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((0, -0.8), [#text(size: 9pt)[$a$ finite#linebreak()\(e\_E\(a\)=L\)]], anchor: "east")
  line((6.1, 0), (6.1, -1.6), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((6.1, -0.8), [#text(size: 9pt)[$macron(a)$]], anchor: "west")
  line((0, -1.6), (6.1, -1.6), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((3.05, -1.6), [#text(size: 9pt)[quotient]], anchor: "south")
})
  Here $t$ is a local uniformizer of $D$, and $phi.alt$ is induced by the birational identification over $T$. The integers $M$ and $L$ are local indices along $E$, not the degrees of the finite maps. They compare to the multiplicity $m_D$ on the original source $X$, which may be greater than one.
  All assertions concern generic points of divisors. We may therefore discard smaller subsets, split the unramified tangential extension, and work with smooth transverse polydiscs. Choose a transverse parameter $z$ for $E$, absorbing a unit so that $p^(*) t = z^M$. Cyclic inertia fixes $E$ pointwise. Since $a$ is finite and equivariant, it fixes the divisor $D_A$ pointwise. A finite affine automorphism with a fixed point is conjugate by a translation to its linear part; fixing a divisor makes its linear part either the identity or a pseudoreflection. The perfect cross pairing gives the same assertion on $P$.
  Let $omega = sigma^n \/ n !$, with an irrelevant nonzero scalar absorbed into the choice of a translation-invariant volume form on $P$. In the top exterior power of (8.1), every term must contain all $n$ $P$-directions. Thus the term $beta$ makes no contribution, and on the smooth product model
  $ phi.alt^(*) omega = "vol"_P and a^(*) "vol"_A . $
  Its order along $P times E$ is $L - 1$. More precisely, near the generic point of $E$, it is $u z^(L - 1) "vol"_(upright("prod"))$, where $"vol"_(upright("prod")) = "vol"_P and "vol"_T$ for a nowhere vanishing local top form $"vol"_T$ on $T$, and $u$ is pulled back from a unit at the generic point of $E$.
  Let $v = "ord"_(F_D)$ be the normalized valuation of the divisor in Lemma 55. The product field is the compositum $bb(C) \( P times T \) = bb(C) \( X \) bb(C) \( T \)$. Geometric integrality of the generic fiber makes this a Galois extension of $bb(C) \( X \)$ with group $G$. Extend $v$ to a normalized divisorial valuation $w$ of the product field $bb(C) \( P times T \)$, choosing the extension above $E$. Indeed, conjugating any extension by $G$ preserves its restriction $v$ and moves its base center through all divisors of $T$ over $D$. Write $r$ for the ramification index of $w \/ v$. Since $v \( t \) = m_D$,
  #[#set math.equation(numbering: n => "(8.4)")
   $ r m_D = M w \( z \) . $ <iso:valuation-multiplicity>]
  The center of $w$ on the proper product projects dominantly to $E$. In particular the product is smooth at the generic point of this center, and the unit $u$ above is a $w$-unit. Denote its log discrepancy by $A_(upright("prod")) \( w \)$. The volume form on the smooth $X$ has order zero at $v$. The order of the same pulled-back top form can therefore be computed in the finite extension of valuation rings and on the product model:
  #[#set math.equation(numbering: n => "(8.5)")
   $ "ord"_w \( phi.alt^(*) omega \) & = r thin "ord"_v \( omega \) + \( r - 1 \) = r - 1\
 & = \( L - 1 \) w \( z \) + A_(upright("prod")) \( w \) - 1 . $ <iso:top-form-valuation>]
  The first line uses the different exponent $r - 1$ of a tame extension of discrete valuation rings; the residue extension is separable in characteristic zero. The second line uses $"ord"_w \( "vol"_(upright("prod")) \) = A_(upright("prod")) \( w \) - 1$. On the smooth product, the pair defined by the smooth divisor $z = 0$ is log canonical, so $A_(upright("prod")) \( w \) gt.eq w \( z \)$. Consequently (8.5) gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ r = \( L - 1 \) w \( z \) + A_(upright("prod")) \( w \) med gt.eq med L w \( z \) . $ <iso:valuation-discrepancy>]
  This last inequality can also be read in local coordinates: the pullback of a form containing $d z$ has order at least $w \( z \) - 1$. Combining (8.4) and (8.6) proves (8.2).
  Let $k$ be the inertia order of $T arrow.r T_l$ along this divisor. Its image on $A$ is a group of translations fixing $a \( z = 0 \)$, so that image is trivial. Quotienting $A$ by the translation group is an isogeny and is everywhere unramified. The indices in the two compositions consequently give
  $ M = k M_l \, #h(2em) L = k L_l . $
  In particular $L_l m_D lt.eq M_l$, which implies (8.3). ◻
]

#thm([Lemma 8.5.])[
  #emph[Let $g_D$ be a local inertia generator at a prime base divisor $D$. The linear part of $g_D^(m_D)$ on $P$ does not have order two.]
] <iso:order-two>

#proof[
  Set $m = m_D$, and make the base change $t = s^m$. Near the generic point of $D$, the normalized source $X'$ of this base change is smooth and its map to $X$ is étale. Indeed $f^(*) t$ has the single divisor $m F_D$. In the regular local rings of $X$ one can write $f^(*) t = u h^m$, with $u$ a unit; adjoining $s$ and normalizing adjoins an $m$-th root of the unit. This is étale. Equivalently, the extension is unramified in codimension one and purity applies. The divisor $s = 0$ on $X'$ is reduced. These statements hold on a neighborhood of the whole fiber over the generic point of $D$, which is the neighborhood used below.
  Put $delta = gcd \( M \, m \)$. On a component of the normalized compositum of the two base covers, use a parameter $z'$ so that
  $ z = \( z' \)^(m \/ delta) \, #h(2em) s = \( z' \)^(M \/ delta) . $
  Its cyclic inertia over the rooted base has order
  $ M' = M / delta \, #h(2em) upright("and its generator acts on ") P upright(" as ") g_D^m . $
  The order of the pulled-back volume on the new product is $L' - 1$, where
  #[#set math.equation(numbering: n => "(8.7)")
   $ L' = frac(L m, delta) . $ <iso:rooted-indices>]
  This follows by substituting $z = \( z' \)^(m \/ delta)$ in $z^(L - 1) d z$. In particular $0 < L' lt.eq M'$, by (8.2).
  Write $T'$ for the chosen normalized cover, $E'$ for its divisor $z' = 0$, and $phi.alt' : P times T' arrow.r.dashed X'$ for the induced rational map. Let $omega'$ be the pullback of $omega$ to $X'$; it is nowhere vanishing on the smooth neighborhood just described. We first show that the full affine inertia action has a common fixed point. Take an actual divisor of $X'$ over $s = 0$, with normalized valuation $v'$, and extend it to a normalized divisorial valuation $w'$ of the product field above $E'$. Geometric integrality of the generic fiber makes this field extension Galois with the same group as $T'$ over the rooted base. Let $r' = e \( w' \/ v' \)$; in this tame Galois extension it is also the inertia order. Since $v' \( s \) = 1$, reducedness gives
  $ r' = M' w' \( z' \) . $
  The center $Z$ of $w'$ on the proper product projects dominantly to $E'$. Thus
  $ kappa \( E' \) med subset med kappa \( Z \) med subset med kappa \( w' \) . $
  Every inertia element fixes $kappa \( w' \)$; its restriction to the base therefore fixes $kappa \( E' \)$ and belongs to the cyclic base inertia of order $M'$. Hence $r' lt.eq M'$, and therefore
  $ r' = M' \, #h(2em) w' \( z' \) = 1 . $
  Thus the whole cyclic base inertia fixes $kappa \( w' \)$, and hence $kappa \( Z \)$. The generic point of $Z$ supplies a point of $P$ over $kappa \( Z \)$ fixed by this full affine group. Its common fixed locus is a constant closed subscheme of $P$, so nonemptiness after that field extension implies nonemptiness over $bb(C)$. Translation by a complex fixed point conjugates the affine action to the linear action. In particular their orders agree.
  Suppose now that the linear action has order two. It is a pseudoreflection, so its determinant on the top fiber form is $- 1$. A generator rotates $z'$ by a primitive $M'$-th root $zeta$. The leading coefficient of the volume is independent of the $P$-variable, and inertia fixes the tangential base residue field. Invariance of the volume therefore gives
  $ - zeta^(L') = 1 . $
  Thus $M'$ is even and $L' equiv M' \/ 2 med \( mod med M' \)$. The bound $0 < L' lt.eq M'$ makes this
  $ L' = M' \/ 2 . $
  Consider instead the product divisor $P times E'$ itself, with its normalized valuation $w_0$. The cyclic base inertia acts on $kappa \( w_0 \)$ through its affine action on $P$, of order two. If $v_0$ is the normalized restriction to the field of $X'$, every element of the inertia of $w_0 \/ v_0$ fixes $kappa \( E' \)$ and therefore lies in this base inertia. It is exactly the kernel of the displayed residue action, so
  $ e_0 = e \( w_0 \/ v_0 \) = M' \/ 2 . $
  Properness over the rooted base supplies a center for $v_0$ on $X'$. It lies in the smooth neighborhood of the whole fiber over the generic point of $s = 0$. Thus, even before knowing whether $v_0$ is a divisor on $X'$, the nowhere vanishing form $omega'$ satisfies $"ord"_(v_0) \( omega' \) = A_(X') \( v_0 \) - 1$. Computing the top-form order and the order of $s$ in the finite extension gives
  $ L' - 1 & = e_0 "ord"_(v_0) \( omega' \) + \( e_0 - 1 \) = e_0 A_(X') \( v_0 \) - 1 \,\
M' & = w_0 \( s \) = e_0 v_0 \( s \) . $
  Since $L' = e_0 = M' \/ 2$, these equalities say
  $ A_(X') \( v_0 \) = 1 \, #h(2em) v_0 \( s \) = 2 . $
  A normalized divisorial valuation over a smooth variety with log discrepancy one is the valuation of a divisor on that variety: a center of codimension at least two has log discrepancy at least two, as is seen by taking regular parameters at its generic point. Hence $v_0$ is an actual divisor of the smooth source $X'$. Its displayed multiplicity two contradicts the reduced divisor defined by $s$. This proves the lemma. ◻
]

The two local conclusions have separate uses. The inequality $L_l lt.eq M_l$ will make pulled-back differentials regular near the minimal stratum. The order bound for $g_D^(m_D)$, together with normal generation by powered meridians, now bounds the dimension.

#thm([Lemma 8.6.])[
  #emph[The linear monodromy $G_l$ acts irreducibly on $"Lie" \( P \)$, is generated by pseudoreflections of order greater than two, and satisfies $n lt.eq 4$.]
] <iso:dimension-bound>

#proof[
  Choose a connected dense open $B^compose$ on which $f$ is smooth, the base cover is unramified, and the product description in Lemma 56 holds. Write $X^compose = f^(- 1) \( B^compose \)$. The smooth proper map $X^compose arrow.r B^compose$ has connected fibers, so its map of fundamental groups is surjective. Since $X$ is simply connected, $pi_1 \( X^compose \)$ is normally generated by small meridians around the divisorial boundary of $X^compose$. One obtains this statement by filling loops and putting the filling discs in general position; the subset of complex codimension at least two does not contribute. Equidimensionality ensures that the inverse image of a subset of base codimension at least two also has codimension at least two. By Lemma 55, a meridian around $F_D$ projects to the $m_D$-th power of a meridian around $D$.
  The unramified restriction of $T arrow.r B$ is connected, and hence its monodromy has full image $G$. Translation parts act trivially on $H^1 \( P \)$; the linear monodromy is therefore exactly $G_l$. The preceding normal generation says that it is generated by conjugates of the linear parts of $g_D^(m_D)$. Lemma 57 makes each nontrivial such part a pseudoreflection; Lemma 58 excludes order two. Notice that generation uses the powered meridians. Replacing them by unpowered inertia would lose this conclusion.
  The global invariant cycle theorem, applied to the smooth projective family $X^compose arrow.r B^compose$ and its smooth projective compactification $X$, identifies
  $ H^2 \( P \, bb(C) \)^(G_l) = "im" #scale(x: 120%, y: 120%)[\(] H^2 \( X \, bb(C) \) arrow.r H^2 \( P \, bb(C) \) #scale(x: 120%, y: 120%)[\)] . $
  The hypotheses here are the algebraic smooth family over the connected open and the proper smooth compactification; no assertion about invariants on an arbitrary analytic disc is being used #cite(label("Deligne1971")) Théorème 4.1.1(ii). The classes $e \, \[ sigma \] \, \[ overline(sigma) \]$ restrict to zero, and the ample class restricts nontrivially. These four classes span $H^2 \( X \, bb(C) \)$, so the displayed space has dimension one.
  If $"Lie" \( P \)$ had a nontrivial invariant splitting, average a positive Hermitian form over the finite group and take an orthogonal invariant splitting. The imaginary parts of its restrictions to the two summands give two independent invariant real alternating forms on the underlying real tangent space. Their constant forms represent independent classes in $H^2 \( P \, bb(C) \)^(G_l)$, a contradiction. Thus the representation is irreducible.
  We use the following precise consequence of the reflection classification. An irreducible finite complex reflection group generated by reflections of order greater than two has dimension at most four. Indeed, in the imprimitive case the imprimitivity spaces are lines and every reflection is either diagonal or has a two-coordinate block
  $ mat(delim: "(", 0, u; u^(- 1), 0) . $
  The latter has order two; diagonal reflections alone cannot generate an irreducible representation of dimension greater than one. These are exactly the alternatives in #cite(label("ShephardTodd1954")) §2, pp. 276–277. In the primitive case, #cite(label("Cohen1976")) Proposition (5.9)(iii), p. 430 states that dimension at least five permits no reflection of order greater than two. Applying this consequence proves $n lt.eq 4$. ◻
]

Suppose, towards a contradiction, that a nonquotient germ remains. Take $S_0 \, cal(S) \, d \, c$ from Proposition 23. The transverse klt germ on a maximal chart has dimension $c$. It cannot have dimension one, since a normal curve is smooth. It cannot have dimension two, since a klt surface germ is a quotient germ and its maximal quasi-étale cover is smooth #cite(label("ClemensKollarMori1988")) Proposition (6.11). Thus $c gt.eq 3$. Proposition 36 excludes $d = 0$. Lemma 59 now forces

#[#set math.equation(numbering: n => "(8.8)")
 $ n = 4 \, #h(2em) c = 3 \, #h(2em) d = 1 \, #h(2em) chi_(upright("top")) \( S_0 \) = 0 . $ <iso:elliptic-case>]

The coarse curve $S_0$ is normal and projective, hence smooth. Its Euler number makes it a curve of genus one. The remainder of the proof rules out this last possibility.

#thm([Lemma 8.7.])[
  #emph[For $z_0 in T_l$, put $J = "Stab"_(G_l) \( z_0 \)$ and 
$ V_J = "Lie" \( A_l \)^J . $

 Every translation field belonging to $V_J$ lifts to a holomorphic vector field on a neighborhood of $z_0$ in $T_l$. This lift is $J$-invariant and descends through $p_l$. If $p_l \( z_0 \) in S_0$, then $dim V_J lt.eq 1$.]
] <iso:local-fields>

#proof[
  First describe the branch divisors of $a_l$. If $R subset T_l$ has ramification index $L_l > 1$, then (8.3) implies $M_l > 1$ for $p_l$. Its nontrivial cyclic inertia fixes $R$ pointwise and therefore fixes the divisor $a_l \( R \)$ pointwise. Since the linear action of $G_l$ is faithful, a generator acts on $A_l$ by an affine pseudoreflection. Consequently $a_l \( R \)$ is a component of its fixed locus: it is a translate of an abelian subvariety of codimension one. We call such a translate an abelian hyperplane.
  After shrinking about $z_0$, every ramification divisor that meets the neighborhood contains $z_0$. Its inertia is contained in $J$, since an automorphism fixing the divisor pointwise fixes $z_0$. The tangent hyperplane of its image therefore contains $V_J$.
  Let $v in V_J$. The finite separable map $a_l$ gives a unique meromorphic lift $tilde(v)$ of the constant field $v$. It is regular in codimension one. At an unramified generic point this is immediate. At a general point of a ramification divisor choose coordinates in which $a_l$ is
  $ \( z \, y_2 \, dots.h \, y_n \) mapsto \( z^(L_l) \, y_2 \, dots.h \, y_n \) . $
  Since $v$ is tangent to the abelian branch hyperplane, its normal component is zero and the lift has no pole. Normality then extends the derivation everywhere: for any regular function $h$, the meromorphic function $tilde(v) \( h \)$ belongs to every local height-one ring and thus to the normal local ring itself. Uniqueness of the lift and $J$-invariance of $v$ show that $tilde(v)$ is $J$-invariant. The germ of $p_l$ is the quotient by $J$, so the field descends to that germ of $B$.
  These descended fields have independent evaluations. To verify this without assuming either germ smooth, center exponential coordinates of $A_l$ at $a_l \( z_0 \)$, so the finite affine $J$-action becomes linear. Choose $J$-invariant linear coordinate functions $ell_1 \, dots.h \, ell_r$, dual to a basis $v_1 \, dots.h \, v_r$ of $V_J$. The invariant functions $a_l^(*) ell_i$ descend to functions $u_i$ on the base germ, and the descended fields $xi_j$ satisfy
  $ xi_j \( u_i \) = delta_(i j) . $
  They therefore split $r$ smooth directions by their local flows. The same directions persist on the maximal quasi-étale chart: the fields lift uniquely across a quasi-étale finite map (check regularity in codimension one and use normality), and the pulled-back functions retain these identities. On $S_0$ the evaluation rank on that chart is $d = 1$, by Proposition 23. Thus $r lt.eq 1$. ◻
]

#thm([Lemma 8.8.])[
  #emph[For every local holomorphic function $u$ on $B$, its pulled-back differential has an expression 
#[#set math.equation(numbering: n => "(8.9)")
 $ p_l^(*) \( d u \) = sum_(i = 1)^n h_i thin a_l^(*) alpha_i \, $ <iso:differential-coefficients>]

 where the $alpha_i$ are a basis of translation-invariant one-forms on $A_l$ and the $h_i$ are holomorphic on the corresponding neighborhood of $T_l$. At a point $z_0$ with stabilizer $J$, the covector $sum_i h_i \( z_0 \) alpha_i$ is $J$-invariant.]
] <iso:regular-differentials>

#proof[
  The coefficients are uniquely defined meromorphic functions, since $a_l$ is generically étale. It is enough to check regularity at every prime divisor of $T_l$. There is nothing to prove where $a_l$ is unramified. At a general ramification point write $M = M_l$, $L = L_l$. Use linear coordinates $\( x \, y_2 \, dots.h \, y_n \)$ on $A_l$ adapted to the affine fixed hyperplane $x = 0$. The inertia fixes the $y_i$ and acts on $x$ by a root of unity. The restrictions of $a_l^(*) y_i$ are generically independent along the divisor. They can be used as tangential coordinates on $T_l$, and, after absorbing a unit in the normal parameter,
  $ a_l^(*) x = z^L . $
  Choose $z$ so that the cyclic inertia rotates it by a primitive $M$-th root. The local invariant ring of this cyclic quotient has coordinates $z^M \, y_2 \, dots.h \, y_n$. Thus $p_l^(*) u = F \( z^M \, y \)$ for a holomorphic function $F$, and
  $ d \( p_l^(*) u \) = M / L z^(M - L) F_t \( z^M \, y \) thin d \( z^L \) + sum_(i = 2)^n F_(y_i) \( z^M \, y \) thin d y_i . $
  All coefficients are holomorphic because $L lt.eq M$. The displayed coordinate covectors are constant linear combinations of the $alpha_i$, so this proves the required codimension-one regularity. Normality extends every $h_i$.
  Expression (8.9) is unique on the function field. Its left side is $J$-invariant and its right side transforms by the linear representation on the $alpha_i$. Evaluation at the $J$-fixed point $z_0$ therefore gives an invariant covector, as asserted. ◻
]

#thm([Lemma 8.9.])[
  #emph[Let $C$ be an irreducible component of $\( p_l^(- 1) \( S_0 \) \)_(upright("red"))$. Then $C$ is a smooth curve of genus one. Its image $E = a_l \( C \)$ is an elliptic translate in $A_l$, and $a_l \|_C : C arrow.r E$ and $p_l \|_C : C arrow.r S_0$ are étale. At every $z in C$, 
$ "Lie" \( A_l \)^("Stab"_(G_l) \( z \)) = "Lie" \( E \) . $

 Here $"Lie" \( E \)$ means the constant tangent direction of the translate $E$.]
] <iso:elliptic-lift>

#proof[
  All components $C$ are projective curves mapping finitely onto $S_0$. Let $J_0$ be their generic pointwise stabilizer. More explicitly, discard the proper fixed loci of those finitely many group elements that do not fix $C$ identically. On the remaining open the stabilizer is the subgroup $J_0$ fixing $C$ pointwise. Equivariance implies
  $ a_l \( C \) subset A_l^(J_0) . $
  Every component of this fixed locus is a translate of an abelian subvariety with tangent space $V_(J_0)$. Lemma 60 bounds its dimension by one, whereas finiteness of $a_l$ makes the image of $C$ one-dimensional. It follows that the image is exactly an elliptic translate $E$, and $V_(J_0) = "Lie" \( E \)$.
  Write $nu : hat(C) arrow.r C$ for the normalization and let
  $ b : hat(C) arrow.r S_0 \, #h(2em) a_C : hat(C) arrow.r E $
  be the two finite morphisms. At any $q in hat(C)$, choose a parameter $u$ on the smooth curve $S_0$ near $b \( q \)$, and extend it to a local function on $B$. Such an extension exists because $S_0$ has its reduced closed-subspace structure. Restricting (8.9) gives
  #[#set math.equation(numbering: n => "(8.10)")
   $ b^(*) d u = eta thin a_C^(*) theta $ <iso:curve-differential>]
  near $q$, where $theta$ is a nonzero translation-invariant one-form on $E$ and $eta$ is holomorphic. There is no assumption here that $T_l$ is smooth along $C$. To justify restriction, first pull (8.9) to a resolution of $T_l$. Both sides are regular ordinary differentials there and agree generically, hence everywhere. A component of the proper base change dominating $hat(C)$ then gives the stated equality on $hat(C)$, since pullback of differentials along a dominant map to a smooth curve in characteristic zero is injective.
  Equation (8.10) implies pointwise
  $ "ram"_q \( b \) gt.eq "ram"_q \( a_C \) . $
  Both targets have genus one. Riemann–Hurwitz therefore gives the same total ramification degree, $2 g \( hat(C) \) - 2$, for both maps. The pointwise inequalities must all be equalities. In particular $eta \( q \) eq.not 0$.
  Put $z = nu \( q \)$ and $J = "Stab"_(G_l) \( z \)$. The covector in Lemma 61 is $J$-invariant, and the nonvanishing of $eta \( q \)$ says that its restriction to $"Lie" \( E \)$ is nonzero. Since $J$ contains $J_0$, we have
  $ V_J subset V_(J_0) = "Lie" \( E \) . $
  A finite-dimensional representation of a finite group in characteristic zero has equally dimensional invariant vector and covector spaces, by the averaging projector. Thus $V_J eq.not 0$, and the displayed inclusion is equality. This holds at every point and on every normalization branch.
  Fix a nonzero $v_0 in "Lie" \( E \)$. Its unique meromorphic lift through $a_l$ is holomorphic near each point of $C$, by Lemma 60, and the lifts agree on overlaps by uniqueness. Call the resulting field $tilde(v)_0$. It has nonzero evaluation everywhere on $C$, since $d a_l \( tilde(v)_0 \) = v_0$. Locally it descends through $p_l$ to a field on $B$. Its flow preserves the intrinsically defined minimum stratum $S_0$, and hence its lifted flow preserves the reduced inverse image and each of its irreducible curve components. Thus $tilde(v)_0$ is tangent to $C$.
  A reduced curve carrying such a nonvanishing ambient holomorphic field is smooth: choose a function whose derivative under the field is nonzero, and use the local flow to split off its disc direction. An invariant reduced curve in this product is the disc times a reduced zero-dimensional germ. It follows that $C = hat(C)$ is smooth. Since $d a_l \( tilde(v)_0 \) = v_0 eq.not 0$, the map $C arrow.r E$ is unramified. It is consequently an étale cover of an elliptic curve, so $g \( C \) = 1$. The equality of ramification divisors already proved also makes $C arrow.r S_0$ unramified. ◻
]

#proof[
  If a nonquotient germ remained, (8.8) and Lemma 62 would supply $C$ and a nonzero translation direction $v_0$ as above. Choose a positive integer $r$ such that $cal(L) = cal(O)_B \( r K_B \)$ is a line bundle, and put
  $ cal(M) = p_l^(*) cal(L) . $
  We construct a holomorphic connection on $cal(M) \|_C$; in particular we must check both its extension and its gluing.
  Near $z in C$, the field $tilde(v)_0$ is invariant under the point stabilizer and descends to a holomorphic field $xi_z$ on the corresponding base germ. On $B_(upright("reg"))$, Lie differentiation by $xi_z$ acts on $r$-fold canonical tensors. It extends to an operator
  $ cal(D)_z : cal(L) arrow.r cal(L) . $
  Indeed $cal(L)$ is the reflexive extension of its restriction to $B_(upright("reg"))$, so a differentiated section extends uniquely across the subset of codimension at least two. The operator obeys
  $ cal(D)_z \( u s \) = xi_z \( u \) s + u cal(D)_z \( s \) . $
  Pull it to the chosen neighborhood in $T_l$ using the lifted symbol $tilde(v)_0$: in a local pulled-back frame its rule is
  #[#set math.equation(numbering: n => "(8.11)")
   $ tilde(cal(D))_z \( h thin p_l^(*) s \) = tilde(v)_0 \( h \) thin p_l^(*) s + h thin p_l^(*) \( cal(D)_z s \) . $ <iso:connection-operator>]
  The Leibniz identity and $tilde(v)_0 \( p_l^(*) u \) = p_l^(*) \( xi_z u \)$ make this definition independent of the frame.
  On an overlap, both operators $tilde(cal(D))_z$ have the same symbol. They agree on the dense open where $p_l$ is étale and both varieties are smooth: there the differential of $p_l$ identifies the pulled-back canonical tensors with canonical tensors upstairs, and both operators are Lie differentiation by the same field $tilde(v)_0$. Their difference is an $cal(O)_(T_l)$-linear endomorphism of the line bundle $cal(M)$; its coefficient is holomorphic and zero on a dense open, hence is zero. Thus the local operators glue on a neighborhood of $C$. This argument compares the operators upstairs and does not require a single descended vector field on a neighborhood of all of $S_0$.
  Tangency of $tilde(v)_0$ to the reduced curve $C$ implies that the glued operator preserves $cal(I)_C cal(M)$, by (8.11). It therefore induces a first-order operator
  $ D : cal(M) \|_C arrow.r cal(M) \|_C $
  with symbol the nowhere vanishing field $tilde(v)_0 \|_C$. Let $tau$ be the holomorphic one-form on the elliptic curve $C$ satisfying $tau \( tilde(v)_0 \) = 1$. Then
  $ nabla s = D \( s \) ⊗ tau $
  is a holomorphic connection on $cal(M) \|_C$.
  A line bundle with a holomorphic connection on a smooth projective curve has degree zero, a classical connection obstruction #cite(label("Atiyah1957")). One elementary proof takes a nonzero meromorphic section $s$: the meromorphic one-form $nabla s \/ s$ has at each point the residue $"ord"_q \( s \)$, and the residue theorem gives $deg "div" \( s \) = 0$. Consequently
  $ deg \( cal(M) \|_C \) = 0 . $
  On the other hand, $- K_B$ is ample as a $bb(Q)$-Cartier divisor, and $p_l \|_C$ is finite onto the positive-dimensional curve $S_0$. Hence
  $ deg \( cal(M) \|_C \) = r thin deg #scale(x: 120%, y: 120%)[\(] \( p_l \|_C \)^(*) K_B #scale(x: 120%, y: 120%)[\)] < 0 . $
  This contradiction excludes the nonquotient germ and proves Proposition 54. ◻
]

== 9 A second Lagrangian system <secsys:section>

Retain the local $e$-locus $D$ and its cohomology marking from Proposition 48, and write $f_0 : X_0 arrow.r B$ for the original projective fibration. The geometric target is an actual nearby manifold with two integral nef isotropic classes whose entire positive interval lies in its Kähler cone. This gives both fibrations on one projective manifold, with the first still mapping to the original $B$.

#thm([Proposition 9.1.])[
  (Two systems on one nearby model).  #emph[Arbitrarily close to the original point of $D$, there is a member $X' = X_t$ and an integral $\( 1 \, 1 \)$-class $u$ such that $e$ and $u$ are nef and 
$ q \( e \) = q \( u \) = 0 \, #h(2em) q \( e \, u \) > 0 \, $

 and the whole positive interval satisfies 
#[#set math.equation(numbering: n => "(9.1)")
 $ { a e + b u : a \, b > 0 } subset cal(K)_(X') . $ <secsys:geometric-target>]

 In particular $X'$ is projective. Its fixed-base fibration $f' = f_t : X' arrow.r B$ admits a second projective Lagrangian fibration $g : X' arrow.r C$, with $C$ normal and projective. For every fiber $A$ over the smooth locus of $g$, the restriction $f' \|_A : A arrow.r B$ is finite and surjective. Thus $B$ has a finite cover by an abelian variety.]
] <secsys:second-system>

The rank-four refinement proved in Proposition 68 chooses $g$ with nonzero polarized variation when the original fibration has that property. We first construct the two classes in (9.1).

We distinguish integral isometries from parallel-transport operators throughout the proof. This distinction matters in applying Torelli. Write $Lambda = H^2 \( X_0 \, bb(Z) \)$, equipped with $q$, and fix the connected marked deformation component containing $X_0$. Its orientation of maximal positive subspaces is the one given by $\( "Re" sigma_0 \, "Im" sigma_0 \, kappa \)$, with $kappa$ Kähler. Markings below are anchored by parallel transport in this component.

=== 9.1 Realized positive three-planes <realized-positive-three-planes>

Call an oriented positive three-plane $T subset Lambda_(bb(R))$ #emph[realized] if it is the span of the period plane and a Kähler class of a marked manifold in the chosen component. The Calabi–Yau theorem and twistor rotation imply that every compatible oriented two-plane $P subset T$, together with its positively oriented orthogonal ray in $T$, is realized once $T$ is realized. We use period surjectivity from the chosen marked component for the integral Beauville lattice #cite(label("HuybrechtsTorelli2012")) §3.1 and Theorem 5.5, together with the marked period identification #cite(label("HuybrechtsTorelli2012")) Corollaries 4.10 and 5.9. The Kähler form of parallel-transport Torelli says that a Hodge parallel-transport isometry carrying a Kähler class to a Kähler class is induced by an isomorphism #cite(label("Markman2011")) Theorem 1.3(2) and §3.2. The global Torelli input in that proof is the preceding marked period identification. These are the marked-component statements used below. The twistor description is also recalled in #cite(label("AmerikVerbitsky2015")) Section 5.1.

#thm([Lemma 9.2.])[
  #emph[Realized positive three-planes form an open subset. In rank greater than four, a three-plane fails to be realized precisely when it is orthogonal to a rational negative MBM class of the marked component. In rank four, the weaker assertion that every nonrealized three-plane has a rational negative orthogonal line suffices and holds. At a fixed oriented period, Kähler cones of marked models in the component are either equal or disjoint.]
] <secsys:metric-periods>

#proof[
  Given a realized pair $\( P \, kappa \)$, nearby planes $T'$ contain oriented period planes $P'$ close to $P$ and orthogonal positive vectors $kappa'$ close to $kappa$. Local Torelli realizes $P'$ by a small deformation of that manifold. Openness of the relative Kähler cone makes $kappa'$ Kähler, proving openness.
  Recall the two parts of the MBM theorem used here: the negative rational wall classes are invariant under deformation that keeps them of type $\( 1 \, 1 \)$, and the Kähler cone is a component of the positive cone after removing their orthogonal hyperplanes #cite(label("AmerikVerbitsky2015")) Theorems 1.17 and 1.19. No bound on their squares is used. A realized plane cannot be orthogonal to such a class: that class would be of type $\( 1 \, 1 \)$ and orthogonal to a Kähler class. Conversely, suppose $T$ has no such orthogonality. Choose a generic oriented plane $P subset T$, so that every rational class orthogonal to $P$ is already orthogonal to $T$. Indeed, each rational vector not orthogonal to $T$ excludes a proper closed subset of the sphere of planes in $T$, and there are only countably many such vectors. Period surjectivity gives a marked manifold with period $P$. Its rational $\( 1 \, 1 \)$ classes include no MBM class. The cone theorem therefore identifies its Kähler cone with the whole positive component. The orthogonal ray to $P$ in $T$, with sign fixed by the orientation, is in that component. This realizes $T$.
  For rank four one can avoid even the MBM formulation in this step. If the negative line $T^perp$ is irrational, the same generic choice of $P$ has zero Picard lattice. Its Kähler cone is the whole positive component, so $T$ is realized. Thus a nonrealized plane has rational negative normal line.
  Finally, an intersection between the Kähler cones of two marked models with the same period gives a Hodge parallel-transport isometry carrying a Kähler class to a Kähler class. Torelli makes it the isometry of an isomorphism. The cones then agree. ◻
]

Choose an integral ample class $h$ on $X_0$. A first arbitrarily small deformation preserving both $h$ and $e$ makes the real period plane $P_(*)$ rational: rational positive two-planes are dense in the rational space $chevron.l e \, h chevron.r^perp$. In rank four this plane is already rational, and we take the original point. Ampleness of $h$ persists, and Proposition 48 preserves the fibration of class $e$. Denote this projective member and its fibration by $X_(*) \, f_(*)$. Set

#[#set math.equation(numbering: n => "(9.2)")
 $ U = P_(*) xor chevron.l e \, h chevron.r_(bb(Q)) \, #h(2em) "sign" \( q \|_U \) = \( 3 \, 1 \) . $ <secsys:four-space>]

Here and below a rational plane is also used for its real span when discussing signs and periods. The space $P_(*) + bb(R) h$ is realized. Consequently $U^perp$ contains no MBM class that could obstruct realization.

Let $bb(H) \( U \)$ be the hyperbolic three-space of negative lines in $U_(bb(R))$. A point $\[ v \]$ corresponds to the positive three-plane $v^perp ∩ U_(bb(R))$, with its fixed orientation. Let $J subset bb(H) \( U \)$ be the set of nonrealized planes. It is closed by Lemma 64. Moreover,

#[#set math.equation(numbering: n => "(9.3)")
 $ J subset bb(H) \( U \) \( bb(Q) \) . $ <secsys:rational-bad-set>]

For rank greater than four, project an obstructing rational MBM class orthogonally to $U$. The projection is rational and nonzero, since $U^perp$ contains no such class; it is the negative normal line in $U$. In rank four use the last assertion about nonrealized planes in Lemma 64. Any parallel-transport isometry preserving $U$ preserves $J$.

Choose the component of the negative cone whose null boundary contains the ray $bb(R)_(> 0) e$. We call its nonzero vectors, including boundary vectors, future vectors. Distinct future null vectors have negative pairing. The other null line in $chevron.l e \, h chevron.r$ has a rational future representative

#[#set math.equation(numbering: n => "(9.4)")
 $ w_(*) = e - frac(2 q \( e \, h \), q \( h \)) h . $ <secsys:other-cusp>]

The negative lines in a Lorentz plane with future null boundary vectors $v \, w$ form the geodesic ${ \[ s v + t w \] : s \, t > 0 }$; we denote it by $\( v \, w \)$.

=== 9.2 Null rotations from actual algebraic families <null-rotations-from-actual-algebraic-families>

#thm([Lemma 9.3.])[
  #emph[Let $a in U_(bb(Q))$ be nonzero and null. Every rational null rotation fixing $a$, extended as the identity on $U^perp$, has a positive power that is an integral parallel-transport operator in the chosen marked component.]
] <secsys:actual-monodromy>

#proof[
  Choose $b in U_(bb(Q))$ with $q \( a \, b \) = 1$ and $q \( b \) = 0$; subtracting $q \( b_0 \) a \/ 2$ from any $b_0$ paired to $1$ with $a$ gives such a vector. Let $V = chevron.l a \, b chevron.r^perp ∩ U$, a positive rational plane. For $x in V_(bb(Q))$ the null rotation is
  #[#set math.equation(numbering: n => "(9.5)")
   $ T_(a \, x) a & = a \,\
T_(a \, x) b & = b + x - 1 / 2 q \( x \) a \,\
T_(a \, x) v & = v - q \( v \, x \) a quad \( v in V \) \, #h(2em) T_(a \, x) \|_(U^perp) = "id" . $ <secsys:null-rotation>]
  Direct pairing verifies that it preserves $q$, and substitution gives $T_(a \, x) T_(a \, y) = T_(a \, x + y)$. Thus $T_(a \, x)^m = T_(a \, m x)$. Its matrix entries in an integral basis are polynomials in $m$ of degree at most two with rational coefficients and constant term the identity. For sufficiently divisible $m$, both $T_(a \, m x)$ and its inverse are integral. This accounts also for the finite gluing between the sublattices in $U$ and $U^perp$.
  For $x eq.not 0$, choose a rational positive vector $ell in V ∩ x^perp$. The rotation fixes $ell$. Replace it by a primitive integral vector on the same line. A generic period in $ell^perp$ has Picard lattice $bb(Z) ell$. Period surjectivity and the cone theorem give an ample marked deformation with polarization $ell$ or $- ell$; choose the ample sign. This sign does not alter the stabilizer of $ell$.
  We now use the prescribed-polarization conclusion of #cite(label("StrongSYZ2026")) Lemma 4.2. It applies to this primitive positive class $ell$, ample on a manifold in the chosen marked component. Write $D_ell$ for the component of its type-IV period domain containing that ample period, and put
  $ G_ell \( bb(Z) \) = { g in O \( Lambda \, q \) : g ell = ell \, med g D_ell = D_ell } . $
  The cited lemma supplies a smooth projective family of IHS manifolds over a smooth connected quasi-projective variety $S$, with a relative polarization of class $k ell$ for some $k > 0$ and a reference marking obtained by parallel transport from $X_0$. It also supplies a torsion-free finite-index subgroup $Gamma subset G_ell \( bb(Z) \)$ containing the family monodromy and an algebraic period map
  $ Phi : S arrow.r Q_ell := Gamma without D_ell . $
  Here $Q_ell$ is smooth and quasi-projective, the map $D_ell arrow.r Q_ell$ is a covering with free $Gamma$-action, and a local marked lift of $Phi$ is submersive. The type-IV domain $D_ell$ is contractible, including in rank four, so this covering identifies $pi_1 \( Q_ell \)$ with $Gamma$.
  The remaining finite-index assertion concerns the image of this actual family monodromy, and we prove it here. The submersive local lift makes the algebraic map $Phi$ dominant.
  Choose an irreducible algebraic slice $S' subset S$ of dimension $dim Q_ell$ dominating $Q_ell$. For example, intersect with general hyperplanes through a smooth submersive point, transverse to its period fiber. After normalization and restriction, this slice is smooth and generically finite over $Q_ell$. There is a nonempty Zariski-open $Q^compose subset Q_ell$ over which its restriction is a nonempty finite étale cover: generic finiteness gives a finite open after removing the boundary in a proper compactification, and characteristic zero allows removal of the branch locus. Therefore its fundamental-group image has finite index in $pi_1 \( Q^compose \)$. The map $pi_1 \( Q^compose \) arrow.r pi_1 \( Q_ell \)$ is surjective, since a loop in a complex manifold can be moved off a proper algebraic subset. It follows that
  #[#set math.equation(numbering: n => "(9.6)")
   $ \[ Gamma : Phi_(*) pi_1 \( S \) \] < oo . $ <secsys:finite-index-image>]
  The period map on the universal cover of $S$, based at this reference marking, is equivariant for the actual second-cohomology monodromy. Because $D_ell arrow.r Q_ell$ is a covering with free action, the deck transformation induced by each loop is exactly that cohomology operator. Hence the subgroup in (9.6) consists of actual parallel transports, with the original marking retained.
  Our rotation fixes $ell$; after taking an integral power, a further power preserves $D_ell$ and therefore lies in $G_ell \( bb(Z) \)$. Since $Gamma$ has finite index in $G_ell \( bb(Z) \)$, a further power lies in $Gamma$; by (9.6), one more positive power lies in the family monodromy. This uses only that every element has a positive power in any finite-index subgroup; normality of the subgroup is unnecessary. Transport to the original reference fiber finishes the proof. The zero parameter gives the identity. ◻
]

=== 9.3 An integral loxodromic operator with irrational axis <an-integral-loxodromic-operator-with-irrational-axis>

#thm([Lemma 9.4.])[
  #emph[There is a parallel-transport operator $gamma$ preserving $U$ and acting identically on $U^perp$ such that its characteristic polynomial on $U$ is irreducible over $bb(Q)$. Its real eigenvalues are $rho \, rho^(- 1)$ with $rho > 1$, and its other two eigenvalues are a nonreal conjugate pair on the unit circle. Its attracting and repelling future null lines $a_(+) \, a_(-)$ can both be placed in any prescribed neighborhood of $\[ w_(*) \]$ in the null boundary.]
] <secsys:loxodromic>

#proof[
  Choose a rational null partner $b$ of $e$ on the line of $w_(*)$ with $q \( e \, b \) = 1$, and a rational orthogonal basis $v_1 \, v_2$ of their positive perpendicular plane. Write $q \( v_1 \) = A > 0$, $q \( v_2 \) = B > 0$. For a rational number $t eq.not 0$, set $x = v_1$, $y = v_1 + t v_2$. Choose $t$ so that
  #[#set math.equation(numbering: n => "(9.7)")
   $ frac(2 \( A - B t^2 \), A + B t^2) in.not bb(Z) . $ <secsys:phase-choice>]
  This is possible: the expression lies in $\( - 2 \, 2 \)$ and assumes each of the three possible integral values at only finitely many real $t$. By Lemma 65, for some positive integers $m_1 \, m_2$ the opposite rotations $T_(e \, m_1 x)$ and $T_(b \, m_2 y)$ are integral monodromies.
  For completeness, the spectral calculation can be performed in a real orthonormal transverse basis without any rationality assumption on $sqrt(A)$ or $sqrt(B)$. Identify $a e + b' b + c v_1 + d v_2$ with the Hermitian matrix
  $ mat(delim: "(", sqrt(2) a, sqrt(A) c + i sqrt(B) d; sqrt(A) c - i sqrt(B) d, - sqrt(2) b') . $
  Its determinant is the negative of $q$. The action $H mapsto M H M^(*)$ of $S L_2 \( bb(C) \)$ induces $S O^(+) \( 3 \, 1 \)$. Formula (9.5) corresponds, for the first rotation, to an upper triangular unipotent with parameter $- m_1 sqrt(A) \/ sqrt(2)$; the opposite rotation corresponds to a lower triangular unipotent with parameter $m_2 \( sqrt(A) - i t sqrt(B) \) \/ sqrt(2)$. Put
  $ gamma_k = T_(e \, k m_1 x) T_(b \, k m_2 y) . $
  Its spin trace is
  #[#set math.equation(numbering: n => "(9.8)")
   $ tau_k = 2 + k^2 m_1 m_2 zeta \, #h(2em) zeta = - 1 / 2 \( A - i t sqrt(A B) \) . $ <secsys:spin-trace>]
  Let $lambda_k \, lambda_k^(- 1)$ be its spin eigenvalues, choosing $\| lambda_k \| > 1$. For large $k$, $lambda_k \/ tau_k arrow.r 1$. The four eigenvalues on $U_(bb(R))$ are
  $ \| lambda_k \|^2 \, quad \| lambda_k \|^(- 2) \, quad lambda_k \/ overline(lambda_k) \, quad overline(lambda_k) \/ lambda_k . $
  The sum of the last pair converges to $2 cos \( 2 arg zeta \) = 2 \( A - B t^2 \) \/ \( A + B t^2 \)$. By (9.7), it is nonintegral for all sufficiently large $k$. In particular, this conjugate pair is nonreal and neither eigenvalue is $1$ or $- 1$.
  The characteristic polynomial on $U$ is monic with rational coefficients, and its roots are algebraic integers because $gamma_k$ preserves $Lambda$. It therefore belongs to $bb(Z) \[ z \]$. It is reciprocal, has constant term $1$, and has no rational root: a rational root would be $1$ or $- 1$. If it factored into two quadratics over $bb(Q)$, real coefficients would force the nonreal pair to belong to one quadratic. That monic factor has integral coefficients, so the sum of the pair would be an integer, a contradiction. Thus it is irreducible. Fix a sufficiently large $k$.
  Finally, a nontrivial null rotation fixing $\[ w_(*) \]$ has powers converging to $\[ w_(*) \]$ on every other point of the null boundary. In boundary coordinates with $\[ w_(*) \]$ at infinity these powers are translations $z mapsto z + j c$, with $c eq.not 0$. Such a rotation has an integral monodromy power by Lemma 65. Neither eigenline of $gamma_k$ is rational, by irreducibility, so neither is $\[ w_(*) \]$. Conjugating $gamma_k$ by a sufficiently high power of this rotation brings both eigenlines as close to $\[ w_(*) \]$ as desired and preserves all the asserted properties. Call the conjugate $gamma$. ◻
]

The axis $\( a_(-) \, a_(+) \)$ contains no rational negative line. Indeed, a nonzero rational vector in its invariant real Lorentz plane would have its entire $gamma$-orbit in that plane. The rational span of the orbit would be a nonzero proper rational invariant subspace of $U$, contradicting irreducibility. The two geodesics $\( e \, a_plus.minus \)$ also contain no rational negative line. Otherwise such a line, together with rational $e$, would define a rational Lorentz plane. A rational binary quadratic form with one rational null line has both null lines rational: if $q \( e \, v \) eq.not 0$, its second null vector is $v - q \( v \) e \/ \( 2 q \( e \, v \) \)$. The second line would be $a_plus.minus$, contrary to irreducibility. Equation (9.3) gives

#[#set math.equation(numbering: n => "(9.9)")
 $ J ∩ \( a_(-) \, a_(+) \) = J ∩ \( e \, a_(+) \) = J ∩ \( e \, a_(-) \) = diameter . $ <secsys:good-limit-geodesics>]

=== 9.4 Uniform tails and the entire Kähler interval <uniform-tails-and-the-entire-kähler-interval>

For a future null line $\[ w \]$ near $\[ w_(*) \]$, choose its representative with $q \( e \, w \) = - 1$ and put

$ P \( e \, w \) = chevron.l e \, w chevron.r^perp ∩ U_(bb(R)) \, $

oriented near $P_(*)$. This is a nearby $e$-period. It gives an actual small deformation $X_w$ of $X_(*)$ within $D$, with the fibration $f_w : X_w arrow.r B$ by Proposition 48. The orthogonal projection of $h$ to $chevron.l e \, w chevron.r$ has the form

#[#set math.equation(numbering: n => "(9.10)")
 $ h_w = alpha \( w \) e - beta w \, #h(2em) alpha \( w \) = - q \( h \, w \) > 0 \, quad beta = q \( h \, e \) > 0 . $ <secsys:projected-kahler>]

It tends to $h$ as $\[ w \] arrow.r \[ w_(*) \]$, so it is Kähler on $X_w$ after restricting to a small neighborhood. As $e$ is nef on $X_w$, every $h_w + t e$, $t gt.eq 0$, is Kähler. Its orthogonal negative line in $chevron.l e \, w chevron.r$ is $\[ \( alpha \( w \) + t \) e + beta w \]$. On a smaller neighborhood $cal(V)$ of $\[ w_(*) \]$, the continuous function $alpha \( w \) \/ beta$ is bounded above by some $R$. Thus

#[#set math.equation(numbering: n => "(9.11)")
 $ \[ s e + w \] in.not J #h(2em) \( \[ w \] in cal(V) \, med q \( e \, w \) = - 1 \, med s gt.eq R \) . $ <secsys:uniform-tail>]

This is the required uniformity near the rational endpoint $e$. Choose the conjugation in Lemma 66 so that both $a_(+)$ and $a_(-)$ belong to $cal(V)$.

#thm([Lemma 9.5.])[
  #emph[For all sufficiently large integers $N$, 
$ \( e \, gamma^N e \) ∩ J = diameter . $

]
] <secsys:whole-geodesic>

#proof[
  Choose future eigenvectors for $a_(+) \, a_(-)$ with eigenvalues $rho \, rho^(- 1)$, respectively. The remaining real invariant plane is positive definite and $gamma$ acts on it by a rotation. Since $e$ is a future null vector different from both eigenlines, its coefficients along both future eigenvectors are positive. Indeed, pairing its eigenspace decomposition with either eigenvector shows the coefficient of the other to be positive. It follows that
  #[#set math.equation(numbering: n => "(9.12)")
   $ rho^(- N) gamma^N e arrow.r v_(+) \, #h(2em) rho^(- N) gamma^(- N) e arrow.r v_(-) \, $ <secsys:endpoint-limits>]
  where $v_(+) \, v_(-)$ are positive representatives of $a_(+) \, a_(-)$.
  If the assertion failed, choose $N arrow.r oo$ and $z_N = \[ s_N e + gamma^N e \] in J$, with $s_N > 0$. We first claim
  #[#set math.equation(numbering: n => "(9.13)")
   $ s_N rho^(- N) arrow.r 0 \, #h(2em) s_N rho^N arrow.r oo . $ <secsys:balance-bounds>]
  To prove the first limit, normalize $gamma^N e$ by $c_N = - q \( e \, gamma^N e \)$; by (9.12), $c_N \/ rho^N$ tends to a positive constant, and $\[ gamma^N e \] arrow.r a_(+) in cal(V)$. The tail exclusion (9.11) bounds $s_N \/ c_N$ above. If a subsequence of $s_N \/ rho^N$ had a positive limit, $z_N$ would converge to an interior point of $\( e \, a_(+) \)$. Closedness of $J$ would put that point in $J$, contradicting (9.9). This proves the first limit. Apply the same argument to
  $ gamma^(- N) z_N = \[ s_N gamma^(- N) e + e \] = \[ s_N^(- 1) e + gamma^(- N) e \] in J . $
  The uniform tail at $e$ now uses $a_(-) in cal(V)$ and gives $s_N^(- 1) rho^(- N) arrow.r 0$, which is the second limit.
  Choose integers $k_N$ such that
  $ 1 lt.eq s_N rho^(2 k_N - N) < rho^2 . $
  The two limits in (9.13) imply $k_N arrow.r oo$ and $N - k_N arrow.r oo$. Passing to a subsequence, suppose $s_N rho^(2 k_N - N) arrow.r r in \[ 1 \, rho^2 \]$. Apply $gamma^(- k_N)$ to $z_N$ and divide its representative by $rho^(N - k_N)$. Equation (9.12) gives
  $ frac(s_N gamma^(- k_N) e + gamma^(N - k_N) e, rho^(N - k_N)) = s_N rho^(2 k_N - N) frac(gamma^(- k_N) e, rho^(k_N)) + frac(gamma^(N - k_N) e, rho^(N - k_N)) arrow.r r v_(-) + v_(+) . $
  The limit has negative square, so its line is an interior point of the axis $\( a_(-) \, a_(+) \)$. Invariance and closedness of $J$ put that line in $J$, contradicting (9.9). ◻
]

Take such an $N$ and let $X_N$ be the actual nearby $e$-deformation with first fibration $f_N : X_N arrow.r B$ and period $P_N = P \( e \, gamma^N e \)$, oriented near $P_(*)$. The choice of $a_(+)$ close to $\[ w_(*) \]$, followed by large $N$, makes this deformation as small as prescribed. Put

#[#set math.equation(numbering: n => "(9.14)")
 $ u_N = - gamma^N e \, #h(2em) cal(C)_N = { a e + b u_N : a \, b > 0 } . $ <secsys:second-class>]

The minus sign is essential: $e$ and $gamma^N e$ are future null vectors, so $q \( e \, gamma^N e \) < 0$ and $q \( e \, u_N \) > 0$. The cone $cal(C)_N$ is a positive component in the Lorentz plane $chevron.l e \, u_N chevron.r$. Its positive rays correspond, by taking orthogonal negative lines, to the geodesic $\( e \, gamma^N e \)$. Lemma 67 and twistor rotation show that every ray of $cal(C)_N$ is Kähler on some marked model of period $P_N$.

All those rays are Kähler on $X_N$ itself. Indeed, their projectivized interval is connected. Intersections with the Kähler cones of marked models give an open cover by pairwise disjoint sets, by Lemma 64. Such a cover has just one nonempty member. The class $h_w$ of (9.10), for $\[ w \] = \[ gamma^N e \]$, belongs to this interval and is Kähler on $X_N$. Thus

#[#set math.equation(numbering: n => "(9.15)")
 $ cal(C)_N subset cal(K)_(X_N) . $ <secsys:actual-cone>]

In particular $e + u_N$ is an integral Kähler class, making $X_N$ projective, and $u_N$ is a nonzero integral nef isotropic $\( 1 \, 1 \)$ class on this very manifold. It is the Chern class of a line bundle: the exponential sequence and $H^1 \( X_N \, cal(O)_(X_N) \) = 0$ identify $"Pic" \( X_N \)$ with the integral $\( 1 \, 1 \)$ classes. Applying Theorem 5, including Stein factorization, gives the second Lagrangian fibration $g : X_N arrow.r C$ with normal projective base $C$. Both $f_N$ and $g$ are projective morphisms: their graphs are closed analytic subvarieties of projective products, hence algebraic, and the corresponding algebraic maps are projective.

=== 9.5 Finite maps from its abelian fibers <finite-maps-from-its-abelian-fibers>

Let $A$ be a fiber over the smooth locus of $g$. It is an abelian variety after choosing an origin. A positive multiple of $u_N$ is $g^(*) c_1 \( H_C \)$ for an ample line bundle $H_C$ on $C$, so the cohomology class of $A$ is a positive rational multiple of $u_N^n$. To see the constant, cut $C$ by $n$ general hyperplanes in a sufficiently high multiple of $H_C$; their transverse intersection is a finite collection of regular points, and its inverse image is the corresponding collection of fibers. All regular fibers have the same cohomology class by parallel transport over the connected smooth locus.

Polarizing Fujiki gives the exact positive quantity

#[#set math.equation(numbering: n => "(9.16)")
 $ binom(2 n, n) integral_(X_N) e^n u_N^n = c_(X_N) thin 2^n q \( e \, u_N \)^n > 0 . $ <secsys:mixed-fujiki>]

Therefore the nef line bundle $f_N^(*) H \|_A$ has positive top self-intersection. Such a line bundle on an abelian variety is ample. Indeed, average representatives of its class by translations. Nefness makes the resulting invariant Hermitian form positive semidefinite, and positive top intersection makes its determinant positive. All its eigenvalues are then positive, so the line bundle has a positive curvature representative and is ample.

The morphism $f_N \|_A$ has no positive-dimensional fiber, since a curve in such a fiber would have degree zero against this ample line bundle. It is proper, hence finite. Its image is closed of dimension $dim A = n = dim B$ and therefore equals $B$. This proves all assertions of Proposition 63. In particular we have obtained

#[#set math.equation(numbering: n => "(9.17)")
 $ p : A arrow.r B $ <secsys:abelian-cover>]

as a finite surjective morphism from an abelian variety.

=== 9.6 Nonzero variation in rank four <nonzero-variation-in-rank-four>

#thm([Proposition 9.6.])[
  (The rank-four variation refinement).  #emph[If $b_2 \( X_0 \) = 4$ and the polarized family of smooth fibers of $f_0$ has nonzero variation, the choices in Proposition 63 can be made so that $g$ also has nonzero polarized variation.]
] <secsys:rank-four-variation>

#proof[
  Nonzero variation means that, at some regular fiber, the derivative in a base direction of its weight-one period map is nonzero. This condition persists under small deformations of the fibration: on a small smooth product neighborhood in the family supplied by Proposition 48, the relative Hodge bundle and that derivative vary holomorphically, so a chosen nonzero matrix entry stays nonzero.
  The fiber polarization can also be transported. Its class is the restriction of an integral ample class on $X_0$. By Lemma 47 and topological transport, the restriction image on a nearby smooth fiber is a rational one-dimensional space with kernel $e^perp$. The restriction of a Kähler class spans its real form, since it pairs positively with $e$, so the transported integral class remains of type $\( 1 \, 1 \)$. Positivity on the smooth torus is open. This gives a polarized family near the chosen fiber, and the same argument applies at the conjugate fibration.
  In rank four the preliminary point was $X_(*) = X_0$. Complex conjugation of its hyperkähler complex structure reverses the period-plane orientation and the Kähler sign. The resulting marked manifold $overline(X)_(*)$ has period $overline(P)_(*)$, ample class $- h$, and conjugate fibration $overline(f)_(*) : overline(X)_(*) arrow.r overline(B)$ with fiber class $- e$. It lies in the same marked deformation component: a half-circle of the twistor sphere joins the complex structure to its negative. Nonzero variation of $overline(f)_(*)$ is equivalent to that of $f_(*)$.
  We choose the endpoint neighborhood in Lemma 66 small enough for the following comparison with this conjugate fibration. Under the actual parallel transport $gamma^(- N)$, the underlying plane of $P_N$ becomes
  $ chevron.l gamma^(- N) e \, e chevron.r^perp ∩ U_(bb(R)) . $
  It approaches an unoriented plane near $P_(*)$, since $\[ gamma^(- N) e \] arrow.r a_(-)$ and $a_(-)$ can be chosen arbitrarily close to $\[ w_(*) \]$. The transported positive cone is
  #[#set math.equation(numbering: n => "(9.18)")
   $ gamma^(- N) cal(C)_N = { a gamma^(- N) e - b e : a \, b > 0 } . $ <secsys:opposite-cone>]
  By (9.4), this cone contains a vector close to $- h$. Preservation of the orientation of maximal positive three-spaces therefore makes the transported oriented period close to $overline(P)_(*)$.
  Choose the endpoint neighborhood sufficiently small, and then $N$ sufficiently large, that this period lies in a neighborhood where the $\( - e \)$-deformation of $overline(f)_(*)$ exists and has nonzero variation. Let $Y_N$ be that actual small deformation of $overline(X)_(*)$ with period $gamma^(- N) P_N$. It has a Kähler class near $- h$, in the component (9.18). In rank four, $H^(1 \, 1) \( X_N \, bb(R) \) = chevron.l e \, u_N chevron.r_(bb(R))$, so (9.15) says that the entire positive component of $X_N$ is Kähler. The Hodge parallel-transport isometry between $Y_N$ and $X_N$ induced by $gamma^N$ consequently carries a Kähler class to a Kähler class. Torelli identifies these manifolds by an isomorphism inducing that isometry. The class $- e$ on $Y_N$ becomes $u_N$ on $X_N$.
  Line bundles on an IHS manifold are determined by their Chern classes. Thus the transported fibration and the fibration obtained from $u_N$ have the same connected fibers: positive generated powers define the same Stein factorization. It follows that $g$ has nonzero polarized variation. The isometry in this comparison is the actual parallel transport constructed in Lemma 65. ◻
]

== 10 The varying case when $b_2 = 4$ <var:section>

#thm([Proposition 10.1.])[
  (The varying rank-four case).  #emph[Let $X$ be a projective irreducible holomorphic symplectic manifold of dimension $2 n$ with $b_2 \( X \) = 4$, and let 
$ f : X arrow.r B \, #h(2em) g : X arrow.r C $

 be projective Lagrangian fibrations with normal projective bases. Assume that the polarized family of smooth fibers of $g$ has nonzero variation and that, for every smooth fiber $A_t$ of $g$, the restriction $f \|_(A_t) : A_t arrow.r B$ is finite and surjective. Fix a connected minimum stratum $S_0 subset B$ and its smooth Deligne–Mumford stack $cal(S)$ as in Propositions 23 and 25. Then 
$ H^(a \, b) \( cal(S) \) = 0 quad upright("for ") a eq.not b \, #h(2em) chi_(upright("top")) \( S_0 \) = sum_p h^(p \, p) \( cal(S) \) > 0 . $

]
] <var:exclusion>

Proposition 68 supplies these two fibrations when the original rank-four fibration has nonzero polarized variation, with the first fibration still mapping to the original base $B$. The positive Euler characteristic in the proposition contradicts Proposition 36 when the fixed stratum has a singular maximal chart.

Fix the data in the proposition, and let $C^compose$ be the connected smooth open of regular values of $g$. Resolve the reduced inverse image of $S_0$ in $g^(- 1) \( C^compose \)$, retaining the components which dominate $C^compose$, and restrict to a connected dense algebraic open $T subset C^compose$ over which the resolution is smooth. The base $T$ is smooth and quasi-projective. We obtain smooth projective families

$ pi : cal(A) = g^(- 1) \( T \) arrow.r T \, #h(2em) rho : cal(Q) arrow.r T \, $

with maps $j : cal(Q) arrow.r cal(A)$ and $h : cal(Q) arrow.r cal(S)$. The latter map uses the normalized maximal-chart covers, which are étale over the smooth source by purity; it therefore retains all the stabilizer data of $cal(S)$. Put $d = dim S_0$. Each $Q_t$ has dimension $d$, possibly with several components, and its map to $S_0$ is dominant and generically finite. Indeed $A_t arrow.r B$ is finite. The proper closed images of the omitted nondominating components can be removed from $T$. Put

$ V_(bb(Q)) = R^1 pi_(*) bb(Q) \, #h(2em) U_(bb(Q))^i = R^i rho_(*) bb(Q) \, #h(2em) H_1 = V^(1 \, 0) . $

An origin on the fibers $A_t$ is unnecessary: their holomorphic one-forms are translation invariant and trivialize their cotangent bundles. All variations in this section are taken over the same algebraic open $T$.

To prove diagonal cohomology, suppose that $0 eq.not alpha in H^(a \, b) \( cal(S) \)$ with $a > b$. We will turn its pullbacks into a flat tensor whose exterior factor has a nonzero all-holomorphic component. We will find a joint monodromy lowering operator whose block from $V^(1 \, 0)$ to $V^(0 \, 1)$ is invertible, whereas its action on the factor $U^b$ vanishes after $b + 1$ lowerings. Invariance of the tensor will then force its $a$th exterior lowering to vanish, contradicting the all-holomorphic component. The finite maps $A_t arrow.r B$ produce the tensor; the rank-four invariant-cycle count, together with the nonzero variation of $g$, produces the invertible lowering operator.

#thm([Lemma 10.2.])[
  (Differentials and the top cup component).  #emph[For every $t in T$ there is a natural factorization 
#[#set math.equation(numbering: n => "(10.1)")
 $ h_t^(*) Omega_(cal(S))^1 arrow.r j_t^(*) Omega_(A_t)^1 arrow.r Omega_(Q_t)^1 . $ <var:factorization>]

 If $0 eq.not alpha in H^(a \, b) \( cal(S) \)$, its pullback is a nonzero global flat section $y$ of $U_(bb(C))^(a + b)$. Moreover, for the morphism of variations 
#[#set math.equation(numbering: n => "(10.2)")
 $ cal(T) : Lambda^a V_(bb(Q)) ⊗ U_(bb(Q))^b arrow.r U_(bb(Q))^(a + b) \, #h(2em) v ⊗ u mapsto j^(*) v smile u \, $ <var:cup-map>]

 we have, at every point of $T$, 
#[#set math.equation(numbering: n => "(10.3)")
 $ y_t in cal(T)_t #scale(x: 120%, y: 120%)[\(] Lambda^a H_(1 \, t) ⊗ \( U_t^b \)^(0 \, b) #scale(x: 120%, y: 120%)[\)] . $ <var:top-cup>]

]
] <var:cup-image>

#proof[
  We first check the independence needed to define (10.1). On a maximal chart, lift a form on the smooth orbit to an ordinary ambient differential, using the local product presentation of Proposition 25. Every tangent vector to the smooth finite cover of this chart maps, at a point above the orbit, into the orbit tangent space. Here is the trace argument in this finite-map situation. Work with a pointed finite local branch $R subset E$ of generic degree $m$, with $E$ regular. Extend a tangent vector upstairs to a local derivation $delta$ of $E$. The rule
  $ r mapsto m^(- 1) "Tr"_("Frac" \( E \) \/ "Frac" \( R \)) \( delta r \) $
  is a derivation of $R$: its values are regular by normality, and the Leibniz rule follows from $R$-linearity of trace. Its value at the marked point is the differential image of the chosen tangent vector, since all conjugates in the pointed branch have the same residue and trace on the residue is multiplication by $m$. Evaluations of ambient derivations are precisely the orbit tangent directions, by Proposition 23.
  The normalized pullback of a maximal chart to $A_t$ is smooth and étale over $A_t$. Indeed the quasi-étale exceptional locus has codimension at least two, as does its inverse image under the finite map $A_t arrow.r B$, and purity applies. Thus the preceding tangent calculation applies there. The difference of two lifts of an orbit form vanishes on the orbit tangent, so its pullback vanishes as an ambient cotangent vector at every point above the orbit. Restricting to the reduced inverse image and then pulling to its resolution kills this difference. The resulting maps are compatible on the chart overlaps and with the finite group actions; hence they descend to (10.1).
  The map of the entire family to the fixed stack $cal(S)$ makes $h^(*) alpha$ a global flat section. It is nonzero on every fiber. To see this, choose $beta in H^(d - a \, d - b) \( cal(S) \)$ with $alpha smile beta eq.not 0$, using Poincaré duality and the Hodge decomposition on $cal(S)$. Pullback on $H^(2 d) \( cal(S) \, bb(C) \)$ is nonzero: the $d$th power of a coarse ample class has positive integral on a dominating component of $Q_t$. This also holds for $d = 0$, where the class is the unit. Since $cal(S)$ is connected, its top cohomology is one-dimensional; consequently $h_t^(*) \( alpha smile beta \) eq.not 0$ and $h_t^(*) alpha eq.not 0$.
  Finally, take the $a$th exterior power of (10.1), and use
  $ j_t^(*) Omega_(A_t)^a = Lambda^a H^0 \( A_t \, Omega_(A_t)^1 \) ⊗ cal(O)_(Q_t) . $
  On $H^b$ the resulting sheaf maps factor Dolbeault pullback through
  $ Lambda^a H^0 \( A_t \, Omega_(A_t)^1 \) ⊗ H^b \( Q_t \, cal(O)_(Q_t) \) . $
  Under the Dolbeault identification the last arrow is cup product with the pulled-back holomorphic forms. This is exactly (10.3). ◻
]

Choose flat polarizations on the variations in (10.2), and the induced tensor polarization on its source. Write $cal(T)^dagger$ for the adjoint. This adjoint is flat, although the Hodge metrics themselves generally vary. Indeed, both sides of (10.2) have weight $a + b$, and a morphism of Hodge structures commutes with their Weil operators. The adjoint for their positive Hodge metrics is therefore its transpose for the flat polarization forms. It is a morphism of variations. Consequently

#[#set math.equation(numbering: n => "(10.4)")
 $ z = cal(T)^dagger y in Gamma \( T \, Lambda^a V_(bb(C)) ⊗ U_(bb(C))^b \) $ <var:flat-z>]

is flat. Its component

#[#set math.equation(numbering: n => "(10.5)")
 $ z_(upright("top")) in Lambda^a H_1 ⊗ \( U^b \)^(0 \, b) $ <var:z-top>]

is nonzero at every point. In fact, choose $w$ in this component with $cal(T) w = y$. If the orthogonal projection of $z$ to this component were zero, then

$ 0 = chevron.l z \, w chevron.r = chevron.l y \, cal(T) w chevron.r = chevron.l y \, y chevron.r > 0 \, $

a contradiction. Orthogonality here follows from the factor Hodge decompositions of the tensor Hodge metric.

#thm([Lemma 10.3.])[
  (The simultaneous Higgs operator).  #emph[Let $T$ be a connected smooth quasi-projective algebraic variety, and let $pi : cal(A) arrow.r T$ and $rho : cal(Q) arrow.r T$ be smooth projective morphisms. The fibers of $rho$ may be disconnected. For an integer $b gt.eq 0$, put $V_(bb(Q)) = R^1 pi_(*) bb(Q)$ and $U_(bb(Q))^b = R^b rho_(*) bb(Q)$, choose flat polarizations on these rational variations, and write $H_1 = V^(1 \, 0)$. Assume the following fixed-part condition for every pure tensor word in $V_(bb(Q)) \, U_(bb(Q))^b$ and their duals: its full-monodromy invariant subspace is a constant Hodge structure, so every Hodge component of a global flat invariant tensor is again globally flat. This condition holds for the geometric systems just specified, as verified below.]
  #emph[Let $G$ be the full Zariski closure of the monodromy on $V_(bb(Q)) xor U_(bb(Q))^b$. Then $G$ is linearly reductive, though it may be disconnected. Its Lie algebra $frak(g)_(bb(C))$, transported by conjugation as a flat subbundle of $"End" \( V_(bb(C)) \) xor "End" \( U_(bb(C))^b \)$, is a subvariation of Hodge structure of weight zero. For every tangent vector $x in T_t T$, 
#[#set math.equation(numbering: n => "(10.6)")
 $ \( theta_(V \, x) \, theta_(U \, x) \) in frak(g)_t^(- 1 \, 1) . $ <var:higgs-in-lie>]

 The image 
#[#set math.equation(numbering: n => "(10.7)")
 $ E_t = "im" #scale(x: 120%, y: 120%)[\(] frak(g)_t^(- 1 \, 1) arrow.r "Hom" \( H_(1 \, t) \, overline(H)_(1 \, t) \) #scale(x: 120%, y: 120%)[\)] subset "Sym"^2 H_(1 \, t)^(*) $ <var:E>]

 is a subbundle preserved by the Chern connection. In unitary frames it satisfies 
#[#set math.equation(numbering: n => "(10.8)")
 $ A B^(*) C + C B^(*) A in E_t #h(2em) \( A \, B \, C in E_t \) \, $ <var:triple>]

 where $B^(*)$ is the Hermitian adjoint matrix.]
] <var:joint-monodromy>

#proof[
  First we verify the stated fixed-part condition from the geometric hypotheses. Write $U = U^b$. A pure tensor word has the form
  $ bb(M) = V^(⊗ r) ⊗ \( V^or \)^(⊗ r') ⊗ U^(⊗ s) ⊗ \( U^or \)^(⊗ s') . $
  The polarizations give $V^or tilde.eq V \( 1 \)$ and $U^or tilde.eq U \( b \)$, so
  $ bb(M) tilde.eq #scale(x: 120%, y: 120%)[\(] V^(⊗ \( r + r' \)) ⊗ U^(⊗ \( s + s' \)) #scale(x: 120%, y: 120%)[\)] \( r' + b s' \) . $
  The untwisted word is a flat Hodge direct summand of $R^(r + r' + b \( s + s' \)) pi.alt_(*) bb(Q)$ for the corresponding fiber product $pi.alt : cal(Y) arrow.r T$ of copies of $pi$ and $rho$. The canonical Künneth inclusion and projection commute with monodromy and Hodge decomposition; no algebraic Künneth correspondence is required. The product remains smooth and projective when fibers of $rho$ are disconnected. Deligne’s Theorem 4.1.1(ii) and Corollary 4.1.2 of #cite(label("Deligne1971")) supply invariant lifts from a nonsingular compactification of this product and make their Hodge components globally flat. Applying the Künneth projection and then the Tate twist proves the fixed-part condition for $bb(M)$. It also proves it for flat Hodge direct summands such as exterior and symmetric powers. The summand projectors decompose every tensor construction on $V xor U$ into these pure words. Since $T$ is connected, global flat sections are exactly full-monodromy invariants, and taking the Zariski closure does not change them.
  The same geometric hypotheses give semisimplicity of $V_(bb(Q)) xor U_(bb(Q))^b$ by Deligne’s Proposition 4.2.5 and Theorem 4.2.6 of #cite(label("Deligne1971")). Both cohomology systems have rational structures, integral lattices modulo torsion, and polarizations on the smooth algebraic base $T$. Semisimplicity and faithfulness imply that the unipotent radical of $G^compose$ is trivial. The component group $G \/ G^compose$ is finite, so averaging complements in characteristic zero makes the full, possibly disconnected group $G$ linearly reductive.
  A linearly reductive subgroup of a general linear group is the pointwise stabilizer of its invariant mixed tensors. One way to check the pointwise assertion is to realize the subgroup as the stabilizer of a line in a rational representation, realize that representation in mixed tensors, and choose an invariant complementary subspace to the line by linear reductivity. Its projection is an invariant tensor; fixing that tensor preserves the line and hence belongs to the subgroup. Applying this to the faithful representation $V xor U^b$, with its invariant summand projectors included, gives
  #[#set math.equation(numbering: n => "(10.9)")
   $ frak(g)_t = { D : D tau = 0 upright(" for every invariant mixed tensor ") tau upright(" at ") t } . $ <var:tensor-annihilator>]
  For a flat invariant tensor of a single Hodge type, the three parts of its connection have different Hodge degrees. Its lowering part therefore vanishes separately. Applying this to every flat Hodge component just described shows that the simultaneous pair in (10.6) annihilates every tensor in (10.9). This proves (10.6); it is an assertion about the Lie algebra of the pointwise stabilizer. Also, the invariant tensor spaces are Hodge graded, so their common infinitesimal annihilator is Hodge graded. It is flat by conjugation transport, and therefore is a subvariation of the indicated weight-zero endomorphism variation.
  The grading-preserving part of its connection is the restriction of the ambient Chern connection. Projection to $"End" \( V \)$ is a morphism of variations; its image is a subvariation, and its degree $\( - 1 \, 1 \)$ part is $E$. This proves constant rank and Chern parallelism. The weight-one polarization identifies $overline(H)_1$ with $H_1^(*)$ and makes these lowering matrices symmetric.
  For completeness, the bracket calculation takes place in the polarization-preserving Lie algebra. In a unitary Hodge frame a lowering operator has block matrix
  $ L_A = mat(delim: "(", 0, 0; A, 0) quad upright("on ") H_1 xor overline(H)_1 . $
  The conjugate of a lift of $L_B$ in $frak(g)^(- 1 \, 1)$ is in $frak(g)^(1 \, - 1)$ and has upper block $B^(*)$, up to the same irrelevant polarization sign for all $B$. The double bracket of lifts of $L_A$, this upper operator, and $L_C$ has lower block $A B^(*) C + C B^(*) A$, up to sign. Its Hodge degree is $\( - 1 \, 1 \)$; projection to the first factor proves (10.8). ◻
]

Apply the lemma to the geometric systems constructed above; its fixed-part condition was verified in the proof. The Higgs matrices in $E$ have an additional symmetry supplied by the Lagrangian system. Symplectic contraction gives an isomorphism

#[#set math.equation(numbering: n => "(10.10)")
 $ xi : T_T arrow.r^(med tilde.op med) H_1 \, #h(2em) x mapsto \[ iota_(tilde(x)) sigma \|_(A_t) \] \, $ <var:contraction>]

independent of the lift $tilde(x)$ since the fiber is Lagrangian. Regard $xi$ as a $V_(bb(C))$-valued one-form. It satisfies $d_nabla xi = 0$. Indeed its pairing with any locally transported fiber one-cycle is the fiber integral of the closed form $sigma$; exterior differentiation commutes with this integration, and the restriction of $sigma$ to the fibers is zero. Taking the $V^(0 \, 1)$ component gives

$ theta_(V \, x) \( xi \( y \) \) = theta_(V \, y) \( xi \( x \) \) . $

The polarization already gives symmetry in the two matrix slots. After the identification (10.10), these two symmetries give a cubic

#[#set math.equation(numbering: n => "(10.11)")
 $ c_t in "Sym"^3 H_(1 \, t)^(*) \, #h(2em) c_t \( x \, - \, - \) = theta_(V \, xi^(- 1) \( x \)) in E_t . $ <var:cubic>]

This is the Donagi–Markman cubic associated with a Lagrangian system #cite(label("DonagiMarkman1996")) Section 7.2, Lemmas 7.1–7.2 and Remark 7.3; the calculation above gives the symmetry in the conventions used here. Nonzero variation means that this cubic is not identically zero.

#thm([Lemma 10.4.])[
  (Maximal-rank kernels and a symmetric cubic).  #emph[Let $H$ be a finite-dimensional Hermitian vector space and let $E subset "Sym"^2 H^(*)$ be a complex subspace satisfying (10.8) in unitary coordinates. Suppose $c in "Sym"^3 H^(*)$ and $c \( x \, - \, - \) in E$ for every $x in H$. If $A in E$ has the maximum rank occurring in $E$, then 
$ c \( k \, - \, - \) = 0 #h(2em) \( k in ker A \) . $

]
] <var:matrix>

#proof[
  Let $r = "rk" A$; the assertion is immediate if $r = 0$. By unitary symmetric diagonalization, take coordinates in which $A = "diag" \( lambda_1 \, dots.h \, lambda_r \, 0 \)$, with $lambda_i > 0$. The triple operation gives all odd powers $"diag" \( lambda_i^(2 m + 1) \, 0 \)$. Interpolation on the finitely many nonzero singular values therefore gives
  $ P = "diag" \( I_r \, 0 \) in E \, #h(2em) H = F xor K \, quad K = ker A . $
  The linear map $Z mapsto P P^(*) Z + Z P^(*) P$ preserves $E$ and has eigenvalues $2 \, 1 \, 0$ on the $F F$, off-diagonal, and $K K$ blocks. Its polynomial spectral projections thus separate these blocks inside $E$. A nonzero $K K$ block would, when added to $P$, have rank larger than $r$. Hence every member of $E$ has zero $K K$ block. Write
  $ cal(D) = {D : mat(delim: "(", D, 0; 0, 0) in E} \, #h(2em) cal(B) = {B : mat(delim: "(", 0, B; B^(sans(t)), 0) in E} . $
  Here $D$ is symmetric and $B : K arrow.r F$ is a rectangular matrix. Triple closure, first with $\( P \, D \, P \)$ and then with $\( D \, P \, mat(delim: "(", 0, B; B^(sans(t)), 0) \)$, gives
  #[#set math.equation(numbering: n => "(10.12)")
   $ D^(*) in cal(D) \, #h(2em) D B in cal(B) . $ <var:block-stability>]
  For $B in cal(B)$, the Schur complement computes
  $ "rk" mat(delim: "(", I_r, B; B^(sans(t)), 0) = r + "rk" \( B^(sans(t)) B \) . $
  Maximality of $r$ implies $B^(sans(t)) B = 0$. Polarizing in $B$ shows that, for a fixed $k in K$, the space
  $ W_k = { B k : B in cal(B) } subset F $
  is totally isotropic for the complex symmetric form $\( u \, v \) mapsto u^(sans(t)) v$. In detail, $B^(sans(t)) C + C^(sans(t)) B = 0$, and evaluation on $\( k \, k \)$ gives $\( B k \)^(sans(t)) \( C k \) = 0$. Equation (10.12) shows that $W_k$ is stable under every $D in cal(D)$ and every $D^(*)$.
  Put $S = c \( k \, - \, - \)$. Every cubic contraction has zero $K K$ block; by symmetry, for $f in F$ and $k' in K$,
  $ c \( k \, f \, k' \) = c \( f \, k \, k' \) = 0 . $
  Thus $S$ has only an $F F$ block, also denoted by $S$, in $cal(D)$. For $f in F$, let $B_f$ be the off-diagonal block of $c \( f \, - \, - \)$. Cubic symmetry gives $S f = B_f k$, so
  #[#set math.equation(numbering: n => "(10.13)")
   $ "im" S subset W_k . $ <var:S-image>]
  Since $S$ is symmetric and $W_k$ is isotropic, for $w in W_k$ and $f in F$ we have
  $ \( S w \)^(sans(t)) f = w^(sans(t)) S f = 0 . $
  It follows that $S$ annihilates $W_k$. But $S^(*)$ preserves $W_k$ by (10.12); together with (10.13) this proves
  #[#set math.equation(numbering: n => "(10.14)")
   $ S S^(*) S = 0 . $ <var:positive-triple-zero>]
  The singular values of $S S^(*) S$ are the cubes of those of $S$. Hence $S = 0$. This is the Hermitian positivity step; no positivity of the complex symmetric form was asserted. ◻
]

#thm([Lemma 10.5.])[
  (Existence of an invertible lowering matrix).  #emph[Under the hypotheses of Proposition 69, every fiber of the bundle $E$ attached to the families $pi \, rho$ above contains an invertible matrix.]
] <var:invertible>

#proof[
  Let $r$ be the maximum rank in $E_t$. It is independent of $t$, because Chern parallel transport is unitary and carries $E_t$ onto $E_(t')$ by congruence. Define intrinsically
  #[#set math.equation(numbering: n => "(10.15)")
   $ K_t^(upright("all")) = sum_(A in E_t\
"rk" A = r) ker A subset H_(1 \, t) . $ <var:all-kernels>]
  Unitary Chern transport preserves the entire collection of these kernels, and therefore their span. Thus (10.15) is a global Chern-parallel subbundle of constant rank. No matrix $P$, chosen kernel, or finite cover enters its definition.
  By Lemma 72, the cubic vanishes when any argument lies in $K^(upright("all"))$. In particular all lowering Higgs operators annihilate this subbundle. Write the real flat connection on $V$ as
  $ nabla = D + theta + overline(theta) \, $
  with $D$ the Chern connection. On $K^(upright("all")) subset V^(1 \, 0)$, $theta$ vanishes by the cubic and $overline(theta)$ vanishes by Hodge degree. Complex conjugation in the real variation shows that $overline(theta)$ vanishes on $overline(K^(upright("all"))) subset V^(0 \, 1)$, while $theta$ vanishes there by degree. Consequently
  $ K^(upright("all")) xor overline(K^(upright("all"))) $
  is the complexification of a real flat subbundle $L subset V_(bb(R))$; its flat connection is unitary. Positivity of the Hodge metric shows that the alternating polarization is nondegenerate on $L$. Its symplectic orthogonal $L^perp$ is also a global flat subbundle. These statements concern the full flat connection on $T$, and hence full monodromy around every loop.
  We now compute the relevant full-monodromy invariant space. The use of the one-dimensional fiber-restriction image to prove irreducibility over $bb(R)$ also appears in Bakker’s proof of Matsushita’s variation conjecture #cite(label("Bakker2025")) Lemma 5, building on Voisin’s argument. Here it rules out the specific flat summand extracted from the maximal-rank kernels. By the global invariant-cycle theorem, in the form of #cite(label("Deligne1971")) Theorem 4.1.1(ii) applied to $g^(- 1) \( C^compose \) arrow.r C^compose$ with smooth projective compactification $X$, the image of
  $ H^2 \( X \, bb(Q) \) arrow.r H^2 \( A_t \, bb(Q) \) = Lambda^2 V_(bb(Q) \, t) $
  is precisely the invariant subspace. Its dimension is one: the independent classes $sigma$, $overline(sigma)$, and $g^(*) c_1 \( H_C \)$ restrict to zero, whereas an ample class restricts nontrivially; here $H_C$ is ample and $b_2 \( X \) = 4$. The inclusion $T arrow.r.hook C^compose$ induces a surjection of fundamental groups, because loops in a smooth complex variety can be moved off a closed subset of positive complex codimension. Since $V \|_T$ is the restriction of the same local system, its monodromy image is unchanged. Therefore
  #[#set math.equation(numbering: n => "(10.16)")
   $ dim_(bb(R)) \( Lambda^2 V_(bb(R) \, t) \)^(pi_1 \( T \, t \)) = 1 . $ <var:one-invariant>]
  Invariants commute with extension from $bb(Q)$ to $bb(R)$: they are the common kernels of rational monodromy-minus-identity maps, and a finite subcollection suffices in finite dimension.
  If $L$ were nonzero and proper, the polarization composed with the two flat projections onto $L$ and $L^perp$ would give two independent real invariant alternating forms. The polarization identifies the dual alternating-square representation with $Lambda^2 V_(bb(R))$, so this contradicts (10.16). Rationality of $L$ is not needed. If $L = V_(bb(R))$, the Higgs field vanishes identically, contradicting the chosen nonzero variation of $g$ (which remains nonzero on every dense open). Thus $L = 0$. If $r < n$, every maximum-rank matrix would have a nonzero kernel, making $K^(upright("all"))$ nonzero. Hence $r = n$. ◻
]

#proof[
  Suppose $0 eq.not alpha in H^(a \, b) \( cal(S) \)$ with $a > b$. The flat section $z$ in (10.4) is fixed by the joint algebraic monodromy $G$, and its component (10.5) is nonzero. At a point $t in T$, choose an invertible matrix $A in E_t$ and a lift $nu in frak(g)_t^(- 1 \, 1)$. Let $N_V$ be its induced action on $Lambda^a V_t$ and $N_U$ its action on $U_t^b$, acting on their respective tensor factors. Invariance gives
  $ \( N_V + N_U \) z_t = 0 . $
  Since $U_t^b$ has Hodge types $\( p \, b - p \)$ with $0 lt.eq p lt.eq b$, the operator $N_U$ satisfies $N_U^(b + 1) = 0$. The two tensor actions commute, so induction gives
  #[#set math.equation(numbering: n => "(10.17)")
   $ N_V^a z_t = \( - 1 \)^a N_U^a z_t = 0 \, $ <var:nilpotence>]
  because $a > b$.
  On $V_t$, the operator $nu$ maps $H_(1 \, t)$ isomorphically onto $overline(H)_(1 \, t)$, and kills $overline(H)_(1 \, t)$. Consequently $N_V^a$ kills every summand of $Lambda^a V_t$ having fewer than $a$ factors in $H_(1 \, t)$. On the whole sector with all $a$ exterior factors holomorphic, including its $U_t^b$ factor, it is
  $ N_V^a\|_(Lambda^a H_(1 \, t) ⊗ U_t^b) = a ! thin Lambda^a A ⊗ "id"_(U_t^b) : Lambda^a H_(1 \, t) ⊗ U_t^b arrow.r^(med tilde.op med) Lambda^a overline(H)_(1 \, t) ⊗ U_t^b . $
  The projection of $z_t$ to this sector is nonzero, because its further projection to $\( U_t^b \)^(0 \, b)$ is the nonzero component (10.5). The displayed map is injective and every other exterior sector is killed, so $N_V^a z_t eq.not 0$, contradicting (10.17). Thus no $H^(a \, b) \( cal(S) \)$ with $a > b$ is nonzero; complex conjugation excludes $a < b$ as well.
  It follows that all odd cohomology of $cal(S)$ vanishes and
  $ chi_(upright("top")) \( S_0 \) = sum_p h^(p \, p) \( cal(S) \) > 0 \, $
  since $h^(0 \, 0) \( cal(S) \) = 1$. Rational cohomology of the smooth stack is that of its coarse space, including when its stabilizers are ineffective. This proves the stated positive Euler characteristic. ◻
]

== 11 Eliminating quotient singularities <quot:section>

#thm([Proposition 11.1.])[
  (Smoothness under a finite cover by an abelian variety).  #emph[Let $f : X arrow.r B$ be the original projective Lagrangian fibration in the hypotheses of Theorem 1. Suppose that $B$ has quotient singularities and that there is a finite surjective morphism 
$ p : A arrow.r B $

 from an abelian variety $A$ of dimension $n$. Then $B$ is smooth.]
] <quot:smooth-base>

The two inputs have different roles. The original fibration supplies the direct-image identity and the Fano property of $B$. The abelian variety supplies translation fields, and the Fano property will make the ramification line bundle of the lifted cover ample. No Galois property of $p$ is assumed. The proof therefore retains all arrows of its relation over the canonical stack, together with their labels.

=== 11.1 The canonical stack and its labelled relation <quot:stack-field>

Write $frak(B)$ for the smooth canonical Deligne–Mumford stack of $B$, and $c : frak(B) arrow.r B$ for its coarse morphism. Its local presentations are $\[ U \/ G \]$, where $U$ is smooth and the finite group $G$ acts faithfully and freely in codimension one. These presentations can equivalently be obtained from the maximal charts of Proposition 8: their normalized overlaps are now étale everywhere. In particular, $frak(B)$ is proper, has trivial generic stabilizer, and agrees with $B$ over $B_(upright("reg"))$. All fiber products of stacks below are $2$-fiber products. An arrow in such a fiber product retains its isomorphism label, even when its two coarse coordinates coincide.

#thm([Lemma 11.2.])[
  (Representable lifts).  #emph[The maps $f$ and $p$ lift to representable morphisms 
$ tilde(f) : X arrow.r frak(B) \, #h(2em) tilde(p) : A arrow.r frak(B) \, #h(2em) c tilde(f) = f \, quad c tilde(p) = p . $

 The first is projective and equidimensional of relative dimension $n$, with connected fibers. The second is finite, flat, and surjective.]
] <quot:lifts>

#proof[
  Take a local Galois chart $U arrow.r U \/ G$ as above. Its non-étale locus on the coarse space has codimension at least two. The inverse image of that locus has codimension at least two in $X$, by equidimensionality, and in $A$, by finiteness. Consequently, the full normalizations of the components of the pullbacks of $U arrow.r U \/ G$ that dominate these smooth sources are finite, by excellence, and étale over the sources, by purity of the branch locus #cite(label("StacksProject")) Tag 0BMB. Their deck actions are torsor actions: the torsor identities hold on the dense étale locus and extend uniquely to the finite étale covers. The torsors and their equivariant maps to $U$ are precisely the data defining the two lifts. Uniqueness on normalized overlaps makes these data compatible and gives the stated representable lifts. The normalized-source package of Proposition 8 gives the asserted properties of $tilde(f)$ on each chart: its source is smooth and symplectic, its map to $U$ is projective with Lagrangian equidimensional fibers, and Stein factorization gives connected fibers and direct image $cal(O)_U$.
  The pullback of $tilde(p)$ to $U$ is finite, since it is finite over the ordinary finite base change $A times_B U$. It is a morphism between smooth $n$-dimensional varieties and is flat by miracle flatness #cite(label("StacksProject")) Tag 00R4. Thus $tilde(p)$ is finite flat, and it is surjective because its coarse morphism is surjective. ◻
]

The lifted cover defines the finite relation

#[#set math.equation(numbering: n => "(11.1)")
 $ cal(R) = A times_(frak(B)) A med arrow.r^(med t med)\
arrow.r_(med s med)^med A \, #h(2em) delta : cal(R) arrow.r A \, #h(2em) delta \( xi \) = t \( xi \) - s \( xi \) . $ <quot:relation>]

An arrow with source $x$ and target $y$ is a triple $\( x \, y \, eta \)$, where $eta : tilde(p) \( x \) tilde.eq tilde(p) \( y \)$ is its isomorphism label. Both projections are finite flat. The relation is generically étale over $A$, hence reduced: a nilpotent section would be zero generically and would contradict torsion-freeness over the integral base $A$. It is pure-dimensional of dimension $n$, and every irreducible component is finite and surjective over $A$ under both projections. If $nu : Z arrow.r cal(R)$ is the normalization of a component followed by inclusion, we also write $s \, t$ for the induced coordinate maps on $Z$, and put $delta_Z = delta compose nu$.

The identity section $i : A arrow.r cal(R)$ is a closed immersion. The inertia stack $I \( frak(B) \)$ parametrizes a point of $frak(B)$ together with one of its automorphisms. Thus

$ delta^(- 1) \( 0 \) = A times_(frak(B)) I \( frak(B) \) . $

In this zero-difference fiber the image of $i$ is both open and closed: the identity section of the finite unramified inertia is open, and separatedness makes it closed. We call its complement the nonidentity part. In particular, a point in that complement is an arrow $\( x \, x \, h \)$ with $h eq.not 1$; its label is retained even though its two coordinates agree.

Retain the ample line bundle $H$ on $B$ chosen in Section 2, and put $P = p^(*) H$ on $A$. The two coordinate pullbacks of $P$ to $cal(R)$ are isomorphic. For an abelian subvariety $D subset A$, define its polarized complement by

#[#set math.equation(numbering: n => "(11.2)")
 $ D^perp = ker #scale(x: 120%, y: 120%)[\(] A arrow.r^(lambda_P) hat(A) arrow.r hat(D) #scale(x: 120%, y: 120%)[\)]^0 \, #h(2em) lambda_P \( a \) = t_a^(*) P ⊗ P^(- 1) . $ <quot:orthogonal>]

The superscript $0$ means identity component. The nondegenerate rational alternating form of the polarization gives $dim D^perp = n - dim D$, $\( D^perp \)^perp = D$, and reversal of inclusions under this operation.

Here is the maximality argument that will eliminate nontrivial stabilizers. If a nontrivial stabilizer existed, surjectivity of $tilde(p)$ would give a nonidentity arrow of difference zero. Choose, among all relation components containing such an arrow, one with difference image of largest dimension. We first construct one translation field $v$ on $A$. For every nonidentity automorphism $h$, the $h$-fixed projection of $d tilde(p) \( v \)$ will be nonzero at every lift of the corresponding inertia point. This will force each of these difference images to be proper in $A$. The equality of the two polarization pullbacks will then make the chosen image a torsion coset $tau + D$. It contains zero, so $tau in D$ and the image is the subgroup $D$ itself. Its properness makes $K = D^perp$ positive-dimensional.

Finally, ramification will supply another relation component with differences outside $D$. On the normalization of the chosen component, a $K$-translation will move a point above nonidentity inertia over a ramification divisor. A whole divisor through that translated point will still map onto $D$. We will place that divisor and its marked point in one component of the space of composable arrows. Composition on this component preserves the marked nonidentity arrow and produces a difference image strictly larger than $D$, contradicting the choice of dimension. The next calculation constructs the translation field needed for the first step.

=== 11.2 A translation field along nonidentity inertia <a-translation-field-along-nonidentity-inertia>

#thm([Lemma 11.3.])[
  (A $K$-theory identity).  #emph[In $K^0 \( frak(B) \)$, 
#[#set math.equation(numbering: n => "(11.3)")
 $ tilde(f)_(!) \[ cal(O)_X \] = sum_(j = 0)^n \( - 1 \)^j \[ Omega_(frak(B))^j \] = lambda_(- 1) \( Omega_(frak(B))^1 \) . $ <quot:direct-image>]

 Moreover, for some integer $m > 0$, 
#[#set math.equation(numbering: n => "(11.4)")
 $ #scale(x: 120%, y: 120%)[\(] \[ T_(frak(B)) \] - n \[ cal(O)_(frak(B)) \] #scale(x: 120%, y: 120%)[\)]^m lambda_(- 1) \( Omega_(frak(B))^1 \) = 0 . $ <quot:nilpotence>]

]
] <quot:k-identity>

#proof[
  Use the global isomorphisms $phi.alt_j : R^j f_(*) cal(O)_X arrow.r^tilde.op Omega_B^(\[ j \])$ chosen once on the original base in Section 2, with $phi.alt_0$ the unit isomorphism. We apply the chart comparison of Proposition 27. Choose a connected affine quotient chart $U arrow.r U \/ G$ with $U \/ G arrow.r B$ an integral separated étale neighborhood, and view $U arrow.r frak(B)$ as its atlas map. Write $f_U : X_U arrow.r U$ for the normalized lift, put $U^0 = U times_B B_(upright("reg"))$, and let $pi : U^0 arrow.r B_(upright("reg"))$ be the induced étale morphism. The complement of $U^0$ has codimension at least two. Over this open the lift is the ordinary base change of the original fibration. Ordinary flat base change for $pi$, followed by the étale cotangent identification, gives
  $ \( R^j \( f_U \)_(*) cal(O)_(X_U) \) \|_(U^0) tilde.eq pi^(*) \( R^j f_(*) cal(O)_X \|_(B_(upright("reg"))) \) arrow.r^(med pi^(*) phi.alt_j med) Omega_(U^0)^j . $
  This open includes the discriminant over the regular part of $B$; the flat map used here is $pi$, so no smoothness of the fibers is required for the base-change step #cite(label("StacksProject")) Tag 02KH.
  For $j > 0$, Ou’s local reflexivity theorem applies to $f_U$: Proposition 8 supplies its projective, equidimensional map with connected fibers and smooth canonical-trivial source, and $U$ is smooth #cite(label("Ou2019")) Theorem 1.3. Both $R^j \( f_U \)_(*) cal(O)_(X_U)$ and $Omega_U^j$ are therefore their reflexive extensions from $U^0$. The displayed isomorphism extends uniquely across the complement. For $j = 0$ the same conclusion is the unit isomorphism from $\( f_U \)_(*) cal(O)_(X_U) = cal(O)_U$. On a chart overlap the extended maps agree over the inverse image of $B_(upright("reg"))$, by transitivity of flat base change from the same $phi.alt_j$. Every component of the overlap meets this open, since it maps étale to a chart and cannot be supported over its codimension-at-least-two complement. Uniqueness of reflexive extension makes the maps agree everywhere. Thus they glue to degreewise isomorphisms
  $ R^j tilde(f)_(*) cal(O)_X tilde.eq Omega_(frak(B))^j #h(2em) \( 0 lt.eq j lt.eq n \) . $
  For $j > n$, the restriction to $U^0$ is zero by Proposition 2, and reflexivity gives zero on $U$. Thus no higher direct-image terms occur.
  These isomorphisms first give (11.3) in coherent $K$-theory. In this setting coherent and vector-bundle $K$-theory agree. Indeed, $T_(frak(B))$ is faithful on every stabilizer by linearization of finite group actions. A finite direct sum $cal(G)$ of bounded tensor powers of this bundle and its dual contains every irreducible stabilizer representation occurring on a finite system of quotient charts. Exactness of finite-group invariants makes the evaluation
  $ c^(*) c_(*) \( cal(G)^or ⊗ cal(F) \) ⊗ cal(G) arrow.r cal(F) $
  surjective for every coherent $cal(F)$. For sufficiently large $k$, the coherent sheaf $c_(*) \( cal(G)^or ⊗ cal(F) \) ⊗ H^k$ is globally generated on $B$. Its generators yield a surjection from a finite sum of $cal(G) ⊗ c^(*) H^(- k)$ onto $cal(F)$. Iterating and using regularity of the smooth stack gives a finite locally free resolution. This proves the claimed comparison and allows the identity to be pulled back in vector-bundle $K^0$, even along an inertia morphism which is not flat.
  We spell out the nilpotence needed for (11.4). If $V$ is a vector bundle of rank $r$ on a smooth projective variety $Y$, then $\[ V \] - r$ is nilpotent in $K^0 \( Y \)$. Indeed, pull back to the full flag bundle of $V$. This pullback is injective on $K^0$, since pushforward of its structure sheaf is $cal(O)_Y$, with no higher direct images. The pulled-back class is a sum of classes $\[ L \] - 1$ for line bundles. For a globally generated line bundle $L$, a finite set of generating sections and its exact Koszul complex show that $\( 1 - \[ L^(- 1) \] \)^N = 0$ for some $N$. An arbitrary line bundle is a quotient of two sufficiently positive globally generated line bundles. Therefore its class minus one is also nilpotent: it is an invertible multiple of a difference of two commuting nilpotent elements. A finite sum of commuting nilpotents is nilpotent. This proves the assertion.
  Apply it on the original projective $X$ to $tilde(f)^(*) T_(frak(B))$. The projection formula and (11.3) give (11.4), with one exponent $m$ before any inertia component is chosen. ◻
]

#thm([Lemma 11.4.])[
  (A translation field with no fixed-direction zero).  #emph[For each connected component $S$ of the nonidentity inertia of $frak(B)$, let $j : S arrow.r frak(B)$ be its natural morphism, let $h$ denote the tautological finite-order automorphism, and set 
$ d = dim S \, #h(2em) W = A times_(frak(B)) S \, #h(2em) a : W arrow.r A \, #h(2em) q : W arrow.r S \, #h(2em) E = q^(*) T_S . $

 There is a translation-invariant vector field $v in "Lie" \( A \)$ such that, simultaneously for every such $S$, the section 
#[#set math.equation(numbering: n => "(11.5)")
 $ s_(v \, S) in H^0 \( W \, E \) \, #h(2em) s_(v \, S) = "pr"_(h = 1) #scale(x: 120%, y: 120%)[\(] d tilde(p) \( v \) \|_W #scale(x: 120%, y: 120%)[\)] \, $ <quot:projected-section>]

 has no zero.]
] <quot:translation-field>

#proof[
  An inertia component is a smooth proper stack: on a quotient chart its presentation is a fixed locus $U^h$ modulo the appropriate centralizer. The fixed eigensubbundle of $j^(*) T_(frak(B))$ is $T_S$. Also, $W$ is a scheme, since it is finite over $A$. The morphism $W arrow.r S$ is finite flat, being a base change of $tilde(p)$. Thus $W$ is projective, pure-dimensional of dimension $d$, and Cohen–Macaulay. These assertions hold even if $W$ is nonreduced.
  Restrict (11.4) to $S$ and take the character of the tautological automorphism. This is the inertia eigenbundle character used in Toën’s Riemann–Roch framework #cite(label("Toen1999")) Section 3.3 and Lemma 4.6; only its explicitly described ring homomorphism and moving-factor cancellation are needed here. More explicitly, for a bundle $V$ on $frak(B)$, decompose $j^(*) V = xor.big_zeta V_zeta$ into the $h$-eigenbundles and use the ring homomorphism
  $ \[ V \] mapsto sum_zeta zeta \[ V_zeta \] quad upright("in ") K^0 \( S \) ⊗_(bb(Z)) bb(C) . $
  Pull this identity to $W$ and take its Chern character in $H^(upright("even")) \( W \, bb(C) \)$. The degree-zero term coming from $\[ T_(frak(B)) \] - n$ is $"tr" \( h \| T_(frak(B)) \) - n$, which is nonzero. Indeed, the tangent action is faithful and all eigenvalues have absolute value one; their sum can be $n$ only if every eigenvalue is one. This would make $h$ the identity by finite-order linearization. The character of each moving cotangent factor in the alternating exterior sum has nonzero degree-zero term $\( 1 - zeta \)^("rk" V_zeta)$, for $zeta eq.not 1$. The eigenbundle ranks are constant on connected $S$, so each of these degree-zero terms is the same nonzero scalar on every connected component of $W$. Each full class is therefore a unit: every positive-degree element of the cohomology of the finite-dimensional projective scheme $W$ is nilpotent. Cancelling them gives
  $ "ch" #scale(x: 120%, y: 120%)[\(] lambda_(- 1) \( q^(*) Omega_S^1 \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  The term of degree $2 d$ on the left is $c_d^(upright("top")) \( E \)$, since for Chern roots $x_i$ of $E$ the expression is $product_i \( 1 - e^(- x_i) \)$. Hence
  #[#set math.equation(numbering: n => "(11.6)")
   $ c_d^(upright("top")) \( E \) = 0 quad upright("in ") H^(2 d) \( W \, bb(C) \) . $ <quot:fixed-chern-zero>]
  In particular, a nonempty nonidentity inertia component of dimension zero is impossible, as in that case this says $1 = 0$.
  Consider the bundle map
  $ alpha : "Lie" \( A \) ⊗ cal(O)_W = a^(*) T_A arrow.r E $
  used in (11.5). For every reduced irreducible subvariety $Y subset W$ of dimension $s$, this map has rank at least $s$ at its generic point. In fact, $Y arrow.r S$ is finite onto its image and is generically separable. On a smooth dense open of $Y$, and after an étale chart on $S$, its differential consequently has rank $s$. The differential identity for the fiber square says
  $ alpha compose d \( a \|_Y \) = d \( q \|_Y \) \, $
  because the latter differential has values in the fixed tangent subbundle. This proves the rank assertion.
  It follows that the locus on $W_(upright("red"))$ where $"rk" alpha lt.eq r$ has dimension at most $r$: apply the preceding assertion to each of its irreducible components. Over the stratum of rank $r$, the incidence variety
  $ { \( w \, u \) in W_(upright("red")) times "Lie" \( A \) : alpha_w \( u \) = 0 } $
  has dimension at most $r + \( n - r \) = n$. There are finitely many rank strata. Thus a general $u$ gives a section whose zero scheme has at most zero-dimensional support. It is a finite scheme because $W$ is proper.
  At every such zero, the $d$ local entries of the section are a system of parameters in a $d$-dimensional Cohen–Macaulay local ring, hence a regular sequence #cite(label("StacksProject")) Tag 02JN. Let $\[ W \]_d = sum_i "length" \( cal(O)_(W \, eta_i) \) \[ W_i \]$ be the scheme-theoretic fundamental cycle, where the $W_i$ are the irreducible components with generic points $eta_i$. The algebraic zero-section formula gives
  $ c_d^(upright("CH")) \( E \) ∩ \[ W \]_d = \[ Z \( s_(u \, S) \) \]_0 quad upright("in ") upright("CH")_0 \( W \) $
  #cite(label("StacksProject")) Tag 0FA9. The complex Borel–Moore cycle class commutes with vector-bundle Chern classes and proper pushforward #cite(label("Fulton1998")) Chapter 19. With the same generic multiplicities in $"cl"_(upright("BM")) \( \[ W \]_d \)$, this gives
  $ "length" Z \( s_(u \, S) \) = deg #scale(x: 120%, y: 120%)[\(] c_d^(upright("CH")) \( E \) ∩ \[ W \]_d #scale(x: 120%, y: 120%)[\)] = chevron.l c_d^(upright("top")) \( E \) \, "cl"_(upright("BM")) \( \[ W \]_d \) #scale(x: 120%, y: 120%)[chevron.r] = 0 \, $
  where the last equality is (11.6). Each nonempty isolated zero has strictly positive length. Thus there are no zeros. The inertia has only finitely many connected components, so the intersection of the corresponding nonempty open sets of choices of $u$ supplies the single field $v$ in the statement. ◻
]

=== 11.3 Difference images and translations <quot:differences>

We now use the field to control every relation component meeting the nonidentity part of $delta^(- 1) \( 0 \)$. The first step rules out a dominant difference image; the polarization will then describe each remaining image and its translation symmetry.

#thm([Lemma 11.5.])[
  (Dominant differences avoid nonidentity inertia).  #emph[If an irreducible component of $cal(R)$ contains a nonidentity arrow with difference zero, its difference image is a proper subvariety of $A$.]
] <quot:nondominance>

#proof[
  Let $Z$ be the normalization of such a component, let $z_0 in Z$ map to the given arrow, and suppose that $delta_Z : Z arrow.r A$ is dominant. Take its Stein factorization
  $ Z arrow.r^beta T arrow.r^gamma A . $
  Here $T$ is normal, $gamma$ is finite and dominant, and $beta$ has connected fibers. The connected fiber through $z_0$ lies entirely over nonidentity arrows: its image lies in $delta^(- 1) \( 0 \)$, where the identity and nonidentity parts are open and closed.
  Put $t_0 = beta \( z_0 \)$, and take the field $v$ of Lemma 77. A finite dominant map to the smooth $n$-fold $A$ is locally open. For completeness, a sufficiently small local branch of $T$ at $t_0$ is finite over a neighborhood of $0$; its analytic image is closed and has dimension $n$, so contains a neighborhood of $0$. We can therefore lift a sequence $exp \( epsilon_nu v \)$, with $0 eq.not epsilon_nu arrow.r 0$, to points of $T$ tending to $t_0$. Lift these points farther to $Z$. Properness gives a subsequence tending to a point $z_oo in beta^(- 1) \( t_0 \)$. Its arrow is nonidentity, and the arrows in the sequence have coordinates
  $ \( x_nu \, y_nu \) \, #h(2em) y_nu = x_nu + exp \( epsilon_nu v \) \, #h(2em) x_nu \, y_nu arrow.r x_oo . $
  Choose a local quotient chart at $tilde(p) \( x_oo \)$, a lift $psi$ of $tilde(p)$ on a small analytic neighborhood of $x_oo$, and finite-group linearizing coordinates at $psi \( x_oo \)$. After passing to a subsequence the labels are one fixed group element $h eq.not 1$, fixing $psi \( x_oo \)$, and
  $ psi \( y_nu \) = h psi \( x_nu \) . $
  Projecting to the $h$-fixed coordinate space yields
  $ "pr"_(h = 1) #scale(x: 120%, y: 120%)[\(] psi \( x_nu + exp \( epsilon_nu v \) \) - psi \( x_nu \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Division by $epsilon_nu$ and passage to the limit give $"pr"_(h = 1) d psi_(x_oo) \( v \) = 0$. This is a zero of the section (11.5) on the inertia component containing $h$, contrary to Lemma 77. ◻
]

#thm([Lemma 11.6.])[
  (Difference images and complementary translations).  #emph[Let $Z$ be the normalization of an irreducible component of $cal(R)$, and suppose that its difference image $D_Z$ has dimension $r < n$. Then 
$ D_Z = tau + D $

 for an abelian subvariety $D subset A$ of dimension $r$ and a torsion point $tau$. If $K = D^perp$, the image of $Z$ in $A times A$ is stable under diagonal translation by $K$. This action lifts uniquely to $Z$; both coordinate morphisms are equivariant, and $delta_Z$ is invariant.]
] <quot:difference-image>

#proof[
  Let $U_Z subset D_Z$ be a nonempty open over which every irreducible fiber component of $delta_Z$ has dimension $n - r$, let $a in U_Z$, and let $F$ be any one of those components, with its reduced structure. On $F$ the second coordinate map is $t_a$ composed with the first. The equality of the two pulled-back polarizations therefore says
  #[#set math.equation(numbering: n => "(11.7)")
   $ \( s \|_F \)^(*) lambda_P \( a \) tilde.eq cal(O)_F . $ <quot:character-constraint>]
  Let $H_F subset A$ be the connected abelian subvariety generated by differences of points of $s \( F \)$. Since $s$ is finite,
  $ dim H_F gt.eq n - r . $
  Resolve $F$ and choose a base point on its resolution. Its map to $A$ factors through a surjective homomorphism from its Albanese variety onto $H_F$, followed by a translation. The dual homomorphism $hat(H)_F arrow.r "Pic"^0 \( tilde(F) \)$ has finite kernel. Equation (11.7) thus implies that the restriction of $lambda_P \( a \)$ to $H_F$ is torsion.
  For a fixed abelian subvariety $H subset A$, the set of points with this property is a countable union of torsion translates of $H^perp$. To check the assertion including disconnected kernels, the homomorphism
  $ A arrow.r hat(H) \, #h(2em) a mapsto lambda_P \( a \) \|_H $
  is surjective and has $H^perp$ as the identity component of its kernel; the induced map $A \/ H^perp arrow.r hat(H)$ is an isogeny. The inverse image of any torsion point is consequently a finite union of cosets of $H^perp$ represented by torsion points of $A$. Here torsion points lift through a quotient of abelian varieties; this follows, for example, by choosing an isogeny complement to the kernel.
  There are only countably many abelian subvarieties of $A$, since their rational first-homology subspaces determine them. There are also only countably many torsion points. The open $U_Z$ is therefore covered by countably many closed torsion cosets, each of dimension at most $r$. A complex irreducible variety cannot be covered by countably many proper closed subvarieties: apply the Baire theorem in a small analytic ball in its smooth locus, and then use irreducibility. Hence one such coset contains $D_Z$. The dimension bound forces equality, proving $D_Z = tau + D$ with $dim D = r$.
  This argument also determines the subgroup generated by every component over a dense set of very general points. Let $a$ range over $U_Z$ minus every coset in the preceding countable collection which does not contain $D_Z$. This complement is dense by the same Baire argument. For #emph[each] fiber component $F$ over #emph[each] such $a$, its character constraint supplies a coset of $H_F^perp$ of dimension at most $r$ containing $a$. That coset must contain $D_Z$ and hence equal it. Thus
  $ H_F^perp = D \, #h(2em) H_F = D^perp = K . $
  The image $s \( F \)$ lies in one $K$-coset and has dimension $n - r = dim K$, so it is the whole coset. Consequently the relation over every such very general $a$ is stable under diagonal $K$-translation. These fibers are dense in $Z$: every nonempty Zariski open in $Z$ has image containing a nonempty Zariski open in $D_Z$, which meets this set. Taking closures therefore proves this invariance on the full image $Gamma subset A times A$.
  The finite map from the original relation component to $Gamma$ is generically one-to-one: over $B_(upright("reg"))$ there is a unique isomorphism label for a pair of points. Each component dominates $A$, so this open is dense on it. Thus $Z$ is also the normalization of $Gamma$. The morphism $K times Z arrow.r Gamma$ induced by simultaneous translation is dominant and has normal source. It therefore lifts uniquely to the normalization $Z$. The action law, equivariance of the coordinate maps, and invariance of the difference follow by uniqueness of this lift, or by checking on the dense normal isomorphism locus and extending. ◻
]

=== 11.4 Ramification and maximality <quot:maximality>

We now begin the contradiction proving Proposition 74. Suppose that $frak(B)$ has a nontrivial stabilizer. Surjectivity of $tilde(p)$ gives a nonidentity point of $delta^(- 1) \( 0 \)$. Among the irreducible components of $cal(R)$ containing such a point, choose one, denoted $cal(R)_0$, whose difference image has largest dimension $r$. Write

$ nu : Z arrow.r cal(R)_0 arrow.r.hook cal(R) $

for its normalization followed by inclusion. By Lemma 78, $r < n$. Lemma 79 makes $delta_Z \( Z \)$ a torsion coset; since it contains zero, it is an abelian subvariety $D subset.neq A$. Put $K = D^perp$, and fix one point $z_(*) in Z$ above a nonidentity zero-difference arrow.

The next two lemmas provide exactly the data needed for one composition. The first gives a ramification divisor $L$ and an actual residual component containing all of $i \( L \)$, with a difference outside $D$. The second moves $z_(*)$ over $L$ and places the translated point on a whole divisor whose difference image is $D$.

#thm([Lemma 11.7.])[
  (Ramification and a residual relation).  #emph[Let $D subset.neq A$ be an abelian subvariety and $K = D^perp$. There is a prime component $L$ of the ramification divisor of $tilde(p) : A arrow.r frak(B)$ which maps surjectively to $A \/ K$. For such an $L$, there is one irreducible component $cal(R)' eq.not i \( A \)$ of the actual relation $cal(R)$ such that 
$ i \( L \) subset cal(R)' \, #h(2em) delta \( cal(R)' \) subset.not D . $

]
] <quot:ramification>

#proof[
  Since $tilde(p)$ is generically étale, the determinant of $d tilde(p)$ defines an effective Cartier ramification divisor $"Ram" \( tilde(p) \)$ on $A$, and
  $ cal(O)_A \( "Ram" \( tilde(p) \) \) tilde.eq tilde(p)^(*) K_(frak(B))^(- 1) . $
  There is no divisorial stabilizer on $frak(B)$. A sufficiently divisible power of its canonical bundle is therefore the pullback of $cal(O)_B \( m K_B \)$. Thus
  $ \( tilde(p)^(*) K_(frak(B))^(- 1) \)^(⊗ m) tilde.eq p^(*) cal(O)_B \( - m K_B \) . $
  The right side is ample because $p$ is finite and $- K_B$ is ample. Hence the line bundle of the total ramification divisor is ample.
  Since $D eq.not A$, the group $K$ is positive-dimensional. If every prime component of $"Ram" \( tilde(p) \)$ had proper image in $A \/ K$, a general $K$-coset would miss the entire divisor. Its defining section would trivialize the restricted ample line bundle on that positive-dimensional projective coset, a contradiction. Thus one component $L$ dominates $A \/ K$; properness makes this map surjective. This uses ampleness of the #emph[total] ramification divisor and does not assert that each of its components is ample.
  The generic point of $L$ lies over $B_(upright("reg"))$, because finiteness preserves the codimension-at-least-two bound for the inverse image of $B_(upright("sing"))$. Near a general point of $L$, the map between smooth spaces has the transverse form
  $ \( u_1 \, u_2 \, dots.h \, u_n \) mapsto \( u_1^e \, u_2 \, dots.h \, u_n \) \, #h(2em) e > 1 . $
  Its self fiber product has, besides the identity branch, branches $v_1 = zeta u_1 \, med v_j = u_j$ for $zeta^e = 1 \, med zeta eq.not 1$. They meet the identity along $L$. There are only finitely many global irreducible components of $cal(R)$. Their closed intersections with $i \( L \)$, excluding the identity component, contain a dense open of $i \( L \)$. Irreducibility therefore gives a single residual component $cal(R)' eq.not i \( A \)$ containing all of $i \( L \)$, including its special points.
  Suppose, for a contradiction, that $delta \( cal(R)' \) subset D$. Lemma 79 says that this difference image is a torsion coset. It contains zero, since $i \( L \) subset cal(R)'$, so it is an abelian subvariety $D' subset D$. Its polarized complement $K' = \( D' \)^perp$ contains $K$. The same lemma gives a $K$-action on the normalization $Z'$ of $cal(R)'$.
  Consider the closed set
  $ F = { x in A : i \( x \) in cal(R)' } . $
  It is proper: otherwise $cal(R)'$ would contain $i \( A \)$, and the two irreducible $n$-dimensional components would be equal. For any $x in F$, choose an individual preimage of $i \( x \)$ in $Z'$. Its connected $K$-orbit remains over difference zero and remains in the inverse image of the identity part of $delta^(- 1) \( 0 \)$, since that part is open and closed. Its image at $k$ is therefore precisely $i \( x + k \)$. Hence $F$ is $K$-invariant. This reasoning does not require a global lift of $i \( L \)$ to $Z'$.
  The divisor $L subset F$ is an irreducible component of $F$, because $F$ is proper in the $n$-fold $A$. A connected group preserves each irreducible component of a closed invariant set with finitely many components. Thus $K + L = L$. But $L arrow.r A \/ K$ is surjective, which gives $K + L = A$. This contradiction proves the required assertion about $delta \( cal(R)' \)$. ◻
]

#thm([Lemma 11.8.])[
  (A divisor through the marked arrow).  #emph[Let $nu : Z arrow.r cal(R)$ be the normalization of an irreducible component followed by inclusion, with difference image an abelian subvariety $D subset.neq A$, and put $K = D^perp$. Suppose $z_0 in Z$ lies over a nonidentity arrow of difference zero. For $L$ as in Lemma 80, there are $k in K$, $e_0 = k dot.op z_0$, and a reduced prime divisor $E subset Z$ through $e_0$, such that $x_0 := s \( e_0 \) = t \( e_0 \) in L$, $nu \( e_0 \)$ is nonidentity, and 
$ s \( E \) = L \, #h(2em) delta_Z \( E \) = D . $

]
] <quot:marked-divisor>

#proof[
  The action of $K$ supplied by Lemma 79 preserves difference zero. Connectedness and the open-and-closed identity partition preserve the nonidentity condition. Since $L arrow.r A \/ K$ is surjective, a translate of the first coordinate of $z_0$ belongs to $L$. Choose such a $k$, and put $e_0 = k dot.op z_0$ and $x_0 = s \( e_0 \) = t \( e_0 \)$. This is the translated normalization point retained below.
  The divisor $L$ is Cartier because $A$ is smooth. Its local equation pulls back to a nonzero nonunit in the integral local ring $cal(O)_(Z \, e_0)$. A minimal prime over that equation has height one, by the principal ideal theorem. Taking its closure with reduced structure gives a prime divisor $E$ through $e_0$ and contained in $s^(- 1) \( L \)$. The finite map $s : Z arrow.r A$ preserves dimension, so its closed image $s \( E \)$ has dimension $n - 1$ and equals the irreducible divisor $L$.
  The image of the proper action morphism $K times E arrow.r Z$ is closed and irreducible. Its first-coordinate image is $K + L = A$. Since $Z arrow.r A$ is finite, this image has dimension $n$ and hence is all of $Z$. As $delta_Z$ is $K$-invariant,
  $ delta_Z \( E \) = delta_Z \( K dot.op E \) = delta_Z \( Z \) = D . $
  These are equalities of actual images; projectivity ensures that no special point is lost by taking closures. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 74.] Apply Lemmas 80 and 81 to the fixed $D \, K \, Z \, z_(*)$. They provide a divisor $L subset A$, a residual component $cal(R)' subset cal(R)$ containing all of $i \( L \)$, and a reduced prime divisor $E subset Z$ through the translated point $e_0$, with
  $ delta_Z \( E \) = D \, #h(2em) delta \( cal(R)' \) subset.not D . $
  Write $x_0 = s \( e_0 \) = t \( e_0 \) in L$ and $alpha_0 = nu \( e_0 \)$. The arrow $alpha_0$ is nonidentity and has difference zero. It is this translated arrow that composition will retain. Form the space of composable arrows
  $ cal(T) = cal(R)' times_(thin t \, A \, s) Z . $
  The inclusion of all of $i \( L \)$ in the actual, possibly nonnormal component $cal(R)'$ gives a global morphism $i \|_L : L arrow.r cal(R)'$: both $L$ and $cal(R)'$ carry their reduced structures. Hence the map
  $ iota : E arrow.r cal(T) \, #h(2em) e mapsto #scale(x: 120%, y: 120%)[\(] i \( s \( e \) \) \, e #scale(x: 120%, y: 120%)[\)] $
  is a closed embedding, the graph of this morphism over the closed subscheme $E subset Z$. Since $E$ is irreducible, one irreducible component $cal(T)_0$ contains its entire image. Give $cal(T)_0$ its reduced structure. Since $E$ is reduced, $iota$ factors as a closed embedding into $cal(T)_0$; in particular, this component contains the retained marked point. Figure 2 records this component choice and the subsequent composition.
  This same component dominates #emph[both] factors. Indeed, $cal(R)' times Z$ has pure dimension $2 n$. The equations for $cal(T)$ are the pullback of the diagonal in $A times A$, which is locally cut out by $n$ equations. The dimension inequality for an ideal with $n$ generators implies $dim cal(T)_0 gt.eq n$. Both projections from $cal(T)$ to its factors are finite, so $dim cal(T)_0 lt.eq n$. Its images in both irreducible $n$-dimensional factors are closed of dimension $n$, and thus are the whole factors. The dimension estimate uses smoothness of $A$ through the equations of its diagonal.
  Composition of the two labelled arrows gives $mu : cal(T)_0 arrow.r cal(R)$. Both $cal(T)_0$ and $cal(R)$ are finite over the outer source coordinate in $A$, so $mu$ is finite. Its closed irreducible image has dimension $n$, since that source coordinate is surjective. Consequently its image is an irreducible component $cal(R)''$ of $cal(R)$. On the embedded $E$, composition with the identity is exactly $nu \( e \)$, with its label. Thus $cal(R)''$ contains the marked nonidentity arrow $alpha_0 = nu \( e_0 \)$ over difference zero, and its difference image contains all of $delta_Z \( E \) = D$.
  It also contains a point outside $D$. In fact, dominance of $cal(T)_0 arrow.r cal(R)'$ allows us to choose composable arrows
  $ z arrow.r x arrow.r y $
  with $x - z in.not D$, whereas $y - x in D$, because the second arrow comes from $Z$. Since $D$ is a subgroup, $y - z = \( y - x \) + \( x - z \) in.not D$. The closed irreducible difference image of $cal(R)''$ therefore contains $D$ properly, and has dimension greater than $r$. It still meets nonidentity inertia over zero, contradicting the choice of $r$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-4.5, 0), [#text(size: 12pt)[$E in.rev e_0$]])
  content((0, 0), [#text(size: 12pt)[$cal(T)_0 in.rev iota (e_0)$]])
  content((4.5, 0), [#text(size: 12pt)[$cal(R) '' in.rev alpha_0$]])
  content((0, 1.05), [#text(size: 9pt)[$cal(T)_0$ is one irreducible component of $cal(R) ' times_(t,A,s)Z$]])
  line((-4.5, 0), (0, 0), stroke: (paint: rgb("#00008c"), thickness: 0.8pt))
  content((-2.25, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[$e arrow.r.long.bar (i(s(e)),e )$]]])], anchor: "north")
  line((0, 0), (4.5, 0), stroke: (paint: rgb("#00008c"), thickness: 0.8pt), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  content((2.25, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[onto $cal(R) ''$]]])], anchor: "north")
  content((-2.05, -2.05), [#text(size: 12pt)[$cal(R) '$]])
  content((2.05, -2.05), [#text(size: 12pt)[$Z$]])
  line((0, 0), (-2.05, -1.775), stroke: (paint: rgb("#404040"), thickness: 0.65pt), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  content((-1.201, -0.8877), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[finite,#linebreak()dominant]]])], anchor: "east")
  line((0, 0), (2.05, -1.775), stroke: (paint: rgb("#404040"), thickness: 0.65pt), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  content((1.201, -0.8877), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[finite,#linebreak()dominant]]])], anchor: "west")
  content((-2.05, -2.32), [#text(size: 7pt)[actual relation component]], anchor: "north")
  content((2.05, -2.32), [#text(size: 7pt)[normalization]], anchor: "north")
  content((0, -3.08), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$x_0=s(e_0), mu ( iota (e_0) )= alpha_0= nu (e_0) != i(x_0), delta ( alpha_0)=0$]]])
  content((-3.5, -4.15), [#text(size: 10pt)[$z$]])
  content((0, -4.15), [#text(size: 10pt)[$x$]])
  content((3.5, -4.15), [#text(size: 10pt)[$y$]])
  line((-3.5, -4.15), (0, -4.15), stroke: (paint: rgb("#404040"), thickness: 0.65pt), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  content((-1.75, -4.15), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$x-z$]]])], anchor: "north")
  line((0, -4.15), (3.5, -4.15), stroke: (paint: rgb("#404040"), thickness: 0.65pt), mark: (end: (symbol: ">>", fill: rgb("#404040"))))
  content((1.75, -4.15), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$y-x$]]])], anchor: "north")
  content((0, -5.02), [#text(size: 9pt)[$( rho , zeta ) in cal(T)_0: mu ( rho , zeta ):z arrow.r.long y,$#linebreak()$y-z=(x-z)+(y-x)$]])
})],
    caption: [Figure 2: The component used for composition. The whole divisor $E$, including $e_0$, lies in one component $cal(T)_0$ whose two finite projections are dominant. Along $E$ the first arrow is the identity, so composition retains $nu \( E \)$ and the marked nonidentity arrow $alpha_0$. The bottom row shows how the two differences add: dominance onto $cal(R)'$ supplies a difference outside $D$, while the second difference lies in $D$. ],
  ) <quot:incidence>
  Thus every stabilizer is trivial. A Deligne–Mumford stack with trivial inertia is an algebraic space, and its coarse morphism is then an isomorphism. Therefore $frak(B) = B$, and $B$ is smooth. ◻
]

== 12 Completion of the proof <sec:conclusion>

#proof[
  The case $n = 1$ was settled in Section 2; assume $n > 1$. By Lemma 4, $b_2 \( X \) gt.eq 4$. If $b_2 \( X \) gt.eq 5$, Proposition 52 gives quotient singularities for $B$. If $b_2 \( X \) = 4$ and the polarized family of smooth fibers of the original $f$ is isotrivial, Proposition 54 gives the same conclusion. In the remaining case, Proposition 68 chooses the two systems of Proposition 63 on a projective IHS deformation $X'$, still with $b_2 \( X' \) = 4$: projective Lagrangian fibrations $f' : X' arrow.r B$ and $g : X' arrow.r C$, with $C$ normal and projective, such that $g$ has nonzero polarized variation and $f'$ restricts to a finite surjection on every smooth fiber of $g$. If $B$ had a nonquotient germ, a maximal chart would be singular. Propositions 23 and 25 would supply the fixed stratum $\( S_0 \, cal(S) \)$ and its product presentations. Proposition 36, applied to the original fibration, would give $chi_(upright("top")) \( S_0 \) = 0$. For the two fibrations on $X'$, Proposition 69 instead gives $chi_(upright("top")) \( S_0 \) > 0$, a contradiction. Thus every germ of $B$ is a quotient singularity in this case as well. The three cases exhaust the possibilities.
  Using the fixed-base family, Proposition 63 supplies in every case a finite cover of the unchanged $B$ by an $n$-dimensional abelian variety: restrict its first fibration to a smooth fiber of the second. This cover, the quotient singularities just proved, and the original projective fibration $f : X arrow.r B$ meet the hypotheses of Proposition 74. Hence $B$ is smooth. The original $X$ is projective, $f$ is surjective with connected positive-dimensional fibers, and $B$ is now smooth and projective. Hwang’s theorem applies with precisely these hypotheses #cite(label("Hwang2008")) Theorem 1.2, in the setting of Theorem 1.1, giving $B tilde.eq bb(P)_(bb(C))^n$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
