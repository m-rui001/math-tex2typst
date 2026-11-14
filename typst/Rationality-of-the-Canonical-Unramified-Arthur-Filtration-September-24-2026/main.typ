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

#align(center)[#text(size: 16pt, weight: "bold")[Rationality of the Canonical Unramified Arthur Filtration]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

The canonical Arthur filtration organizes unramified automorphic functions by nilpotent orbits in the Langlands
  dual Lie algebra. Its definition uses singular support in a category of $ell$-adic sheaves,
  whereas the underlying space of finitely supported functions has a natural rational form.
  The rationality question asks whether these two structures are compatible.

Arthur’s conjectures organize departures from temperedness by an additional algebraic $upright("SL")_2$ factor in
  an automorphic parameter [6] Sections 4 and 8. In geometric Langlands,
  Arinkin–Gaitsgory introduced nilpotent singular support to encode this Arthur direction [2]
  Sections 1.1.2–1.1.6. The restricted local-system stack and nilpotent automorphic category of
  Arinkin–Gaitsgory–Kazhdan–Raskin–Rozenblyum–Varshavsky provide the corresponding setting over a finite field [3].

Gaitsgory–Lafforgue–Raskin formulate this question, jointly with Kazhdan,
  as the assertion that their canonical filtration is defined over $bb(Q)$ [14] Section 2.7, Conjecture 2.7.3.
  The construction and its relation to Arthur’s and Ramanujan’s conjectures are discussed in [14,27].
  Restricted geometric Langlands theory supplies the spectral description of the support categories,
  and the trace-of-Frobenius theorem identifies the ambient trace with automorphic functions [3,5,15].
  These results make rationality a precise question about the images of supported categorical traces.

We prove the rationality assertion for split connected semisimple groups under the explicit characteristic
  assumptions below. Thus the result positively resolves Conjecture 2.7.3 of [14] in this setting.
  It applies to the entire space of finitely supported functions, including its noncuspidal part.

=== 1.1 Hypotheses and the filtration <hypotheses-and-the-filtration>

Let $X$ be a smooth projective geometrically connected curve over $bb(F)_q$, and let $G \/ bb(F)_q$ be split,
  connected and semisimple. Put $k_0 = overline(bb(F))_q$, $H = G_(k_0)$ and $frak(h) = "Lie" \( H \)$.

#prodef([Assumption 1.1.])[
  The following four conditions hold.
  + The Lie algebra $frak(h)$ has an $H$-invariant nondegenerate symmetric bilinear form whose restriction to the
    center of $"Lie" \( M \)$ is nondegenerate for every Levi subgroup $M$ of $H$.
  + For each Levi subgroup $M$ of $H$, including $H$ itself, and each maximal torus $T_M subset M$,
    restriction induces an isomorphism
    $ k_0 \[ frak(m) \]^M arrow.r^(med tilde.op med) k_0 \[ frak(t)_M \]^(W_M) \, wide frak(m) = "Lie" \( M \) \,
      quad frak(t)_M = "Lie" \( T_M \) \, quad W_M = N_M \( T_M \) \/ T_M . $
  + The scheme-theoretic centralizer in $H$ of every semisimple element of $frak(h)$ is a Levi subgroup.
  + For every extension $K \/ k_0$ and every nilpotent $n in frak(h) ⊗_(k_0) K$,
    there is a parabolic subgroup $P subset H_K$, defined over $K$, such that $n in "Lie" \( R_u \( P \) \)$.
  Here a Levi subgroup is a Levi factor of a parabolic subgroup.
    Semisimple means geometrically conjugate into the Lie algebra of a maximal torus;
    nilpotent means that the geometric adjoint orbit closure contains zero.
] <intro:characteristic>

Fix a prime $ell eq.not "char" \( bb(F)_q \)$ and set $E = overline(bb(Q))_ell$.
  Write $S$ for the set of isomorphism classes of $G$-bundles on $X$ over $bb(F)_q$.
  For a characteristic-zero field $L$, let

$ cal(A)_L = L^(\( S \)) $

be the space of finitely supported functions on $S$. Its distinguished basis consists of the point functions.
  In particular $cal(A)_E = E ⊗_(bb(Q)) cal(A)_(bb(Q))$.

Fix the pinned split $bb(Q)$-form of the Langlands dual group and write $hat(G) \/ E$ for its scalar extension,
  with Lie algebra $hat(frak(g))$ and nilpotent cone $hat(cal(N))$.
  All later coefficient identifications use this same pinned form. On $overline(X) = X times_(bb(F)_q) k_0$ put

$ cal(C) = "Shv"_("Nilp") \( "Bun"_G \( overline(X) \) \, E \) \, wide Phi = \( upright("Frob")_("Bun") \)_(*) . $

The subscript denotes singular support in the global nilpotent cone, the zero fiber of the Hitchin map.
  We use geometric Frobenius and its pushforward on the automorphic category.

For a closed $"Ad" \( hat(G) \)$-invariant subset $Y subset hat(cal(N))$,
  let $cal(C)_Y subset cal(C)$ be the derived-Satake support category.
  More explicitly, the restricted geometric Langlands equivalence identifies

#[#set math.equation(numbering: n => "(1.1)")
 $ cal(C) tilde.eq "IndCoh"_(hat(cal(N))) \( Z \) \, wide Z =
   zws' #h(-0.16667em) "LocSys"_(hat(G))^(upright("restr")) \( overline(X) \) \, $ <intro:restricted-equivalence>]

and $cal(C)_Y$ corresponds to $"IndCoh"_Y \( Z \)$. The prime denotes the union of connected components occurring
  in that equivalence; it is retained throughout. A singular point is a pair $\( sigma \, A \)$ with $A$ a
  horizontal section of the adjoint local system, after identifying $hat(frak(g))^(*)$ with $hat(frak(g))$ by an
  invariant form. The support condition requires $A$ to take values in $Y$.
  Thus $Y$ is a condition on singular directions, not on the support of a function on $S$.

For a dualizable differential graded category $cal(D)$ and an endofunctor $T$,
  write $"Tr" \( T \, cal(D) \)$ for its categorical trace, a complex of vector spaces.
  It is Hochschild homology with coefficients in the graph bimodule of $T$.
  The trace/functions isomorphism gives $"Tr" \( Phi \, cal(C) \) tilde.eq cal(A)_E$,
  with the latter in degree zero. Define

#[#set math.equation(numbering: n => "(1.2)")
 $ cal(F)_Y cal(A)_E = "im" #scale(x: 120%, y: 120%)[\[] H^0 "Tr" \( Phi \, cal(C)_Y \) arrow.r
   cal(A)_E #scale(x: 120%, y: 120%)[\]] . $ <intro:filtration>]

This image definition does not assume concentration of the supported trace.
  The required concentration and injectivity statements will be proved in Section 5.

#thm([Theorem 1.2.])[
  #emph[Under Assumption 1, for every prime $ell eq.not "char" \( bb(F)_q \)$ and every closed invariant $Y subset
    hat(cal(N))$, the natural map
#[#set math.equation(numbering: n => "(1.3)")
 $ E ⊗_(bb(Q)) #scale(x: 120%, y: 120%)[\(] cal(A)_(bb(Q)) ∩ cal(F)_Y cal(A)_E #scale(x: 120%, y: 120%)[\)]
   arrow.r^(med tilde.op med) cal(F)_Y cal(A)_E $ <intro:main-map>]

 is an isomorphism. The intersection is taken inside $cal(A)_E$.]
] <intro:main>

No Hecke-finiteness or cuspidality condition is imposed. The theorem does not require $X \( bb(F)_q \)$ to be
  nonempty. These rational filtration subspaces are also independent of $ell$,
  with the closed invariant supports matched through the pinned split dual group, as shown in Section 7.
  On the unramified cuspidal subspace, Corollary 35 further identifies this filtration with the sums of the
  rational cuspidal Arthur summands of [23] Theorem 1.1 whose orbit labels lie in $Y$.

=== 1.2 A bilinear detection criterion <a-bilinear-detection-criterion>

The proof gives a characterization after every abstract field isomorphism $iota : E arrow.r^tilde.op bb(C)$.
  Such isomorphisms are used without prescribing their restriction to the algebraic numbers.
  Transport all coefficient-linear categories and spaces by $iota$.

Fix a closed point $v$ of $X$ of degree $d$, and put $r = q^d$.
  For a nilpotent orbit $o subset hat(frak(g))_(bb(C))$, choose an $upright("SL")_2$-homomorphism associated with
  a triple for $e in o$, and write $lambda_e$ for its diagonal cocharacter, so $e$ has weight two. Define

#[#set math.equation(numbering: n => "(1.4)")
 $ B_o = { \[ lambda_e \( sqrt(r) \) s \] : s in Z_(hat(G)_(bb(C))) \( upright("SL")_(2 \, e) \)_(upright("cpt"))
   #scale(x: 120%, y: 120%)[}] subset hat(G)_(bb(C)) \/ \/ hat(G)_(bb(C)) \, wide B_Y =
   union.big_(o subset Y_(bb(C))) B_o . $ <intro:compactsets>]

Here $sqrt(r)$ is positive, $\[ med \]$ denotes semisimple conjugacy value,
  and the compact form includes the components of the triple centralizer.
  The sets $B_o$, as in [14] Sections 3.1.1–3.1.3, do not depend on these choices,
  are compact and pairwise disjoint. Their elementary properties are proved in Lemma 31.

For a finite-dimensional algebraic representation $D$ of $hat(G)_(bb(C))$,
  let $T_D$ be the spherical Hecke operator at $v$, with the positive square-root Satake normalization.
  For $f \, g in cal(A)_(bb(C))$, put

#[#set math.equation(numbering: n => "(1.5)")
 $ \[ f \, g \] = sum_(b in S) frac(f \( b \) g \( b \), \| "Aut" \( b \) \|) . $ <intro:pairing>]

This is a bilinear pairing. The automorphism groups over the finite field are finite, and the sum is finite.

The key result, Theorem 24, says that for each $f \, g$ there is a unique finite complex Borel measure
  $nu_(f \, g)$ on $B = union.big_o B_o$ such that

#[#set math.equation(numbering: n => "(1.6)")
 $ \[ T_D f \, g \] = integral_B chi_D thin d nu_(f \, g) quad upright("for every ") D \, $ <intro:moments>]

and that

#[#set math.equation(numbering: n => "(1.7)")
 $ f in iota_(*) \( cal(F)_Y cal(A)_E \) quad arrow.l.r.double quad "supp" \( nu_(f \, g) \) subset.eq B_Y quad
   upright("for every ") g in cal(A)_(bb(C)) . $ <intro:detector>]

A finite complex measure means one of finite total variation. No positivity of these measures is asserted or needed.

The right side of (1.7) uses the same complex function space, point-counting Hecke operations,
  rational stack weights and compact sets for every $iota$.
  It therefore gives invariance of the filtration under all coefficient automorphisms over $bb(Q)$.
  Finite-coordinate linear algebra then proves (1.3).

=== 1.3 The local arguments <the-local-arguments>

The supported trace concentration and injection statements in [14] Corollaries 2.1.10 and 2.1.13 are conditional
  on Conjecture 2.1.5 there, as stipulated in its Section 2.1.9.
  Section 5 proves the concentration and injection needed here from the component and orbit calculations,
  and constructs actual compact Weil representatives of the supported trace classes.

The central task is to detect every nonzero top support class by a finitely supported function test despite
  possible cancellation from its boundary. Our contribution is the bilinear criterion (1.6)–(1.7) on the full
  space of finitely supported functions, together with the local calculations and compact representatives that
  establish it. First, on a retained fixed component of the local-system stack,
  a pure Weil lift supplies separated Frobenius weights. Finite covariant tests recover the component from a
  closed-orbit slice while preserving completion along its invariant base.
  Nonresonance then gives a quadratic moment-map model compatible with evaluation bundles and singular support.

A deformation-theoretic antecedent is the quadratic-germ theorem of Goldman–Millson for compact Kähler manifolds
  and compact-image representations [16] Theorem 1. Pridham obtains Frobenius-compatible classical deformation
  hulls and cup-product quadratic equations from purity for smooth proper varieties [26] Theorem 2.11 and
  Corollary 2.12. Our finite-jet nonresonance argument retains the derived equivariant model,
  its formal invariant base, evaluation bundles and singular-support map.

Second, a graded Koszul description reduces each nilpotent-orbit quotient to equivariant Clifford modules together
  with strictly contracting Hom directions. Clifford algebras and graded matrix factorizations also enter the
  spectral Whittaker construction of Ben-Zvi, Raskin and Venkatesh described in [27] Section 4.5,
  which develops an idea of V. Lafforgue; the even-nilpotent construction appears in [8] Section 18.5.
  Here a twisted-bar contraction proves trace concentration.
  Proper orbit-closure extensions and finite Koszul lifts produce actual compact Weil classes,
  so the result describes the image in (1.2), not only an abstract associated graded.
  The passage from equivariant localization to a cofiber sequence of traces follows the formalism of
  Hoyois–Scherotzke–Sibilla [17] Theorem 3.4 and Proposition 5.4.

Third, nonstandard automorphic duality turns these classes into the bilinear tests (1.5).
  Localization with supports gives decaying normal-direction contributions and hence finite complex measures.
  On a top orbit the common density is invertible; finite character approximations remove it and leave a
  nondegenerate coefficient pairing. A strict drop in ambient adjoint rank separates every proper boundary
  contribution. These two facts prevent cancellation from hiding a nonzero top class.

The supported local-cohomology and orbit-distribution strategy is inspired by Kazhdan–Okounkov’s treatment of the
  unramified Eisenstein spectrum [18] Sections 2.6.1–2.6.4 and 3.3–3.4.
  The all-function bilinear detector, compact Weil lifts, and noncancellation and rational-descent arguments are
  developed here; that reference does not establish the rationality theorem above.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$"quadratic" "component" "model" ("Section"~ 3 )$])
  content((0, -1.318), [$"compact" "Weil" "trace" "classes" ("Sections"~ 4 -- 5 )$])
  content((0, -2.636), [$"bilinear" "measure" "criterion" ("Section"~ 6 )$])
  content((0, -3.955), [$"rational" "form" "of" cal(F)_Y cal(A)_E ("Section"~ 7 )$])
  line((0, -0.2725), (0, -1.046), mark: (end: ">"))
  content((0.8523, -0.6591), [#text(size: 0.73em)[$upright("orbit traces")$]])
  line((0, -1.591), (0, -2.364), mark: (end: ">"))
  content((1.334, -1.977), [#text(size: 0.73em)[$upright("supported Hom pairings")$]])
  line((0, -2.909), (0, -3.682), mark: (end: ">"))
  content((1.19, -3.296), [#text(size: 0.73em)[$upright("coefficient descent")$]])
})],
  caption: [Figure 1: Main line of the proof. The compact-set properties used by the measure criterion are proved independently in Section 7. ],
) <intro:diagram>

Section 2 records the established geometric inputs and their precise scope.
  Sections 3–5 prove the local model and trace calculations.
  Section 6 establishes the measure criterion, and Section 7 completes the rational descent.

== 2 Geometric inputs and Frobenius conventions <inp:section>

We use the constructible $ell$-adic geometric Langlands framework.
  The results recalled here apply under Assumption 1: its first three conditions are those of [3] §14.4.1,
  and its fourth is the additional condition of [3] §D.1.1. All categories are $overline(bb(Q))_ell$-linear.
  A compact object means an object whose Hom functor commutes with filtered colimits;
  compactness is stronger than constructibility on an algebraic stack.

=== 2.1 Restricted Langlands and functions <restricted-langlands-and-functions>

#thm([Theorem 2.1.])[
  (Restricted geometric Langlands).  #emph[There is a Frobenius-invariant union $Z$ of connected components of
    $"LocSys"_(hat(G))^(upright("restr")) \( overline(X) \)$ and an equivalence
$ bb(L)_G^(upright("restr")) : cal(C) arrow.r^tilde.op "IndCoh"_(hat(cal(N))) \( Z \) . $

 It identifies $cal(C)_Y$ with $"IndCoh"_Y \( Z \)$ for every closed $hat(G)$-invariant $Y subset
   hat(cal(N))$ and intertwines Hecke functors with tensoring by the corresponding evaluation bundles.
   If $f : Z arrow.r Z$ sends a local system to its pullback along geometric Frobenius of $overline(X)$,
   the functor corresponding to $Phi = \( "Frob"_("Bun") \)_(*)$ is $f^(!)$.
   The embedding $cal(C) arrow.r.hook "Shv" \( "Bun"_G \( overline(X) \) \, overline(bb(Q))_ell \)$ preserves
   compact objects.]
] <inp:langlands>

The equivalence and the last assertion are [15] Theorems 1.3.9(i) and 1.1.7;
  Frobenius invariance of the retained union is [15] §1.5.4.
  The Hecke action is compatible with the spectral linear structure [15] Lemma 1.3.7,
  and the support compatibility is [27] Theorem 4.1.1 and Corollary 4.2.1.
  The stated Frobenius convention is exactly [14] §1.3.4. Thus $Z$ is the prime union of the introduction
  throughout this paper. In particular, this theorem does not require identifying that union with the entire
  restricted stack. Under Assumption 1, the companion full-support theorem [24] Theorem 1.4,
  regime A identifies $Z = "LocSys"_(hat(G))^(upright("restr")) \( overline(X) \)$ as spectral prestacks over the
  fixed coefficient field $E = overline(bb(Q))_ell$.

At a geometric point $x$, a representation $D$ of $hat(G)$ supplies the vector bundle $sigma mapsto
  D_(sigma \, x)$ on $Z$. At a closed point of degree $d$, the geometric points form a Frobenius cycle of length
  $d$. The corresponding Hecke construction uses all $d$ evaluation bundles, with cyclic transport.
  This observation will keep the degree of a closed point visible in our trace calculation.

#prodef([Remark 2.2.])[
  (Theta normalization).  The theta normalization of the equivalence can be made over $upright(bold(F))_q$.
    Indeed, $X$ admits a line bundle $theta.alt$ defined over $upright(bold(F))_q$ with $theta.alt^(⊗ 2) tilde.eq
    omega_X$. For odd characteristic this follows from [7] §5, Remark 2 after Proposition 5.2, p. 61:
    there is a Frobenius-invariant square-root class, and the Brauer group of the finite field vanishes,
    so this class descends. In characteristic two, choose a rational function $a in
    upright(bold(F))_q \( X \)$ with $d a eq.not 0$. The orders of $d a$ are even,
    as a Laurent expansion over each perfect residue field shows.
    Hence $cal(O)_X \( 1 / 2 "div" \( d a \) \)$ is such a square root [21] §4, p. 191.
    No rational point of $X$ is needed.
] <inp:theta>

#thm([Theorem 2.3.])[
  (Trace and ordinary local terms).  #emph[There is a canonical isomorphism of complexes
$ "LT" : "Tr" \( Phi \, cal(C) \) arrow.r^tilde.op cal(A)_(overline(bb(Q))_ell) \, $

 with the right-hand side in degree zero. For a compact object $M$ and a morphism $b : M arrow.r Phi M$,
   it sends the categorical class $\[ M \, b \]$ to the ordinary alternating trace function of the adjoint
   morphism $\( "Frob"_("Bun") \)^(*) M arrow.r M$. The function has finite support.
   This comparison is compatible with Hecke operations and with the sheaf–function operations of pullback,
   star tensor product, and compactly supported pushforward.]
] <inp:trace>

The trace isomorphism is [5] Theorem 0.2.6, equivalently Corollary 4.1.4.
  Its identification with local terms is [5] Theorem 0.6.8, equivalently Theorem 5.2.3, and Remark 0.6.5;
  the compact-embedding hypothesis used there is provided by Theorem 3.
  The compatibilities and the stack convention for summation are recalled in [14] §1.1.
  This is a statement about all of $cal(A)_(overline(bb(Q))_ell)$.
  It does not restrict to cuspidal or Hecke-finite functions.
  The stronger assertion that actual invertible Weil structures span the supported traces will be proved below.

=== 2.2 Duality and finite evaluations <duality-and-finite-evaluations>

#thm([Theorem 2.4.])[
  (Nonstandard duality).  #emph[The pairing
#[#set math.equation(numbering: n => "(2.1)")
 $ cal(C) ⊗ cal(C) arrow.r "Vect"_(overline(bb(Q))_ell) \,
   wide \( M \, N \) mapsto R Gamma_c #scale(x: 120%, y: 120%)[\(] "Bun"_G \( overline(X) \) \,
   M ⊗^(*) N #scale(x: 120%, y: 120%)[\)] $ <inp:duality-pairing>]

 defines a self-duality of $cal(C)$. It is invariant under simultaneous Frobenius.
   If $M \, N$ are compact, its value is a perfect complex, also after any finite Hecke representation is inserted
   in either variable.]
] <inp:duality>

The duality is [4] Theorem 3.2.2. Here is the finiteness deduction, which is useful when applying it.
  By Theorem 3, the two objects are compact in ambient sheaves, hence constructible [4] Appendix A.1.6.
  Star tensoring an ambient compact with a constructible object preserves compactness [4] Appendix A.1.6.
  For $p : "Bun"_G arrow.r "pt"$, the functor $p_(!)$ is left adjoint to the continuous functor $p^(!)$ [4]
  Appendix A.1.7, so it preserves compactness. Its value is therefore compact in $"Vect"_(overline(bb(Q))_ell)$,
  hence perfect. The Hecke functor for a finite-dimensional representation has a continuous adjoint supplied by
  its dual representation, and likewise preserves compactness.
  Frobenius invariance of (2.1) follows by change of variables and the compatibility of Frobenius with star tensor
  product.

For compact Weil objects the numerical trace of (2.1) is consequently

#[#set math.equation(numbering: n => "(2.2)")
 $ \[ u \, g \] = sum_(b in S) frac(u \( b \) g \( b \), \| "Aut" \( b \) \|) . $ <inp:function-pairing>]

This is the Grothendieck trace formula with groupoid counting measure; see [14] §§1.1.9 and 1.2.3.
  The pairing is bilinear over $overline(bb(Q))_ell$, without complex conjugation.
  The compact objects of the categorical dual are the opposites of the compact objects of $cal(C)$,
  and their evaluation is enriched Hom [4] §§0.5.3 and 5.1.2.
  Thus the second input may be transported to a compact Hom-test object.
  Its Weil arrow is reversed on passing to the opposite category.
  For arrows $a : Phi M arrow.r M$ and $b : N arrow.r Phi N$, the induced endomorphism of $"Hom" \( M \, N \)$ is

#[#set math.equation(numbering: n => "(2.3)")
 $ h mapsto Phi^(- 1) \( b compose h compose a \) . $ <inp:hom-action>]

This convention fixes the direction of every Frobenius action below.
  The later spanning theorem will justify testing against every function in (2.2).

=== 2.3 The geometry of a spectral component <the-geometry-of-a-spectral-component>

#thm([Theorem 2.5.])[
  (Components and deformation theory).  #emph[Every connected component $Z_sigma$ of the restricted local-system
    stack has a unique semisimple isomorphism class $sigma$. Its automorphism group $J =
    "Aut" \( sigma \)$ is reductive, possibly disconnected. There is a formal affine coarse space $S_sigma$ with
    reduced space a point, and $Z_sigma arrow.r S_sigma$ is relatively algebraic.
    After choosing a frame at a geometric point, the component is formal affine.
    For an affine infinitesimal stage $S_n arrow.r S_sigma$, its base change is affine;
    almost finite type stages and bounded Postnikov truncations may be used.
    These affine stages have coherent cohomology in each bounded range. The tangent complex at a local system $tau$ is
#[#set math.equation(numbering: n => "(2.4)")
 $ T_tau "LocSys"_(hat(G))^(upright("restr")) \( overline(X) \) tilde.eq R
   Gamma \( overline(X) \, hat(frak(g))_tau \) \[ 1 \] . $ <inp:tangent>]

 In particular the stack is quasi-smooth.]
] <inp:components>

The component and finiteness statements assemble [3] Theorems 1.4.5 and 1.6.3, Remarks 1.4.6–1.4.7,
  Corollary 3.7.4, and Theorem 5.4.2. The affine fiber assertion is Corollary 5.4.6 there;
  the assertion for general affine infinitesimal stages is made explicitly in [3] §7.9.10.
  The deformation formula is [3] Proposition 2.2.2 and §§2.4, 25.4.3.
  Formal quasi-smoothness is established in [3] §§21.2.1–21.2.3;
  the deformation complex has the required amplitude because the curve has cohomological dimension two.
  Semisimplicity of $sigma$ makes its geometric monodromy reductive,
  and its centralizer $J$ is reductive in characteristic zero.

For $d$ frames, write $K = hat(G)^d$. Adding the remaining frames is an affine torsor,
  so the same finite-stage assertions hold. The unique closed $K$-orbit is $K \/ J$:
  closed orbits correspond to semisimple local systems, and the stabilizer of a framed representative is $J$.
  Every nonempty invariant closed subset of a finite stage meets this orbit.
  These statements supply the finite-stage setting for the reconstruction in the next section;
  they do not yet identify the component with a quadratic moment-map model.

#thm([Theorem 2.6.])[
  (Pure Weil lift).  #emph[Fix an abstract field isomorphism $iota : overline(bb(Q))_ell arrow.r^tilde.op bb(C)$.
    If $Z_sigma$ is Frobenius invariant, its semisimple point $sigma$ admits a Weil structure that is $iota$-pure
    of weight zero. In particular, writing $hat(frak(g))_sigma$ for its adjoint local system,
    every Frobenius eigenvalue on $H^i \( overline(X) \, hat(frak(g))_sigma \)$ has $iota$-absolute value
    $q^(i \/ 2)$, for $0 lt.eq i lt.eq 2$.]
] <inp:pure-lift>

The pure-lift application to a Frobenius-fixed semisimple point is stated in [14] Appendix A.5.4–A.5.5,
  using [3] Corollary 3.7.4 and Proposition 25.4.6. The literal statement of that proposition treats irreducible
  Weil parameters; the cited appendix records the semisimple consequence used here.
  Purity of $H^1$ is the smooth proper curve application of Weil II [10] Corollary 3.3.6 and §3.3.10,
  also stated explicitly in [14] Appendix A.5.5. For $H^0$ it follows by viewing horizontal sections in a pure
  fiber, and for $H^2$ by curve duality. No semisimplicity of the cohomological Frobenius operators is asserted or
  required.

Put $frak(j) = "Lie" \( J \)$ and $V = H^1 \( overline(X) \, hat(frak(g))_sigma \)$.
  An invariant form on $hat(frak(g))$ and curve duality give

$ H^0 \( overline(X) \, hat(frak(g))_sigma \) = frak(j) \, wide
  H^2 \( overline(X) \, hat(frak(g))_sigma \) tilde.eq frak(j)^(*) \( - 1 \) \, $

and a $J$-invariant symplectic form $V ⊗ V arrow.r overline(bb(Q))_ell \( - 1 \)$.
  Its moment map is the cup–bracket obstruction. After forgetting the Tate factor it is the usual quadratic map
  $mu : V arrow.r frak(j)^(*)$. We will use purity to linearize Frobenius on the full formal component,
  including this obstruction and the evaluation bundles.

== 3 A quadratic model with its Frobenius action <mod:section>

We now replace each Frobenius-fixed retained component by a derived quadratic moment-map model,
  retaining its evaluation bundles and the map defining nilpotent singular support.
  The main issue is to extend coordinates constructed at its closed semisimple orbit over the formal invariant base.

Fix an abstract field isomorphism $overline(bb(Q))_ell tilde.eq bb(C)$.
  All absolute values in this section refer to this isomorphism.
  An invertible linear operator has #emph[absolute weight $w$] if all its eigenvalues have modulus $q^(w \/ 2)$.
  This terminology does not assert that the operator is semisimple.
  It is distinct from both cohomological degree and the weights of an $frak(s l)_2$-triple.

The spectral stack remains the prime union $Z$ from Section 2. Its components form a categorical coproduct.
  In the twisted bar construction, an arrow string closes only in a component preserved by $Phi$. Consequently

#[#set math.equation(numbering: n => "(3.1)")
 $ "Tr" \( Phi \, "IndCoh"_Y \( Z \) \) tilde.eq xor.big_(Z_sigma upright(" preserved by ") Phi)
   "Tr" \( Phi \, "IndCoh"_Y \( Z_sigma \) \) . $ <mod:component-trace>]

The sum is a direct sum, including when there are infinitely many components.
  There are no arrows between distinct components; this also proves their orthogonality for the Hom pairings used below.

Choose such a component and its unique closed semisimple parameter $sigma$.
  Choose a pure Weil lift as in Theorem 8, and put

$ J = "Aut" \( sigma \) \, wide frak(j) = "Lie" \( J \) \, wide V =
  H^1 \( X_(overline(bb(F))_q) \, hat(frak(g))_sigma \) . $

The group $J$ is reductive; it need not be connected. Curve duality and an invariant form identify
  $H^2 \( hat(frak(g))_sigma \)$ with $frak(j)^(*) \( - 1 \)$ and give a $J$-invariant symplectic form $omega$ on
  $V$, after forgetting its Tate factor. The moment map is

#[#set math.equation(numbering: n => "(3.2)")
 $ mu : V arrow.r frak(j)^(*) \, wide chevron.l mu \( x \) \, z chevron.r = 1 / 2 omega \( z x \, x \) . $ <mod:moment>]

Its zero fiber will always mean its #emph[derived] zero fiber.
  In particular no regular-sequence assumption on the components of $mu$ is being made.

=== 3.1 What is recovered from completion at the closed orbit <what-is-recovered-from-completion-at-the-closed-orbit>

We first explain why constructing a model near $sigma$ suffices here.
  The invariant base must be retained in this argument. Choose a closed point $v$ of degree $d$ and frames at its
  $d$ geometric points. Write $K = hat(G)^d$. The framed component supplied by Theorem 7 is an ind-affine derived
  scheme over a formal invariant base with reduced scheme a point. Its unique closed $K$-orbit is $K \/ J$.
  It has affine almost-finite-type stages over nilpotent thickenings of that invariant point.
  At each such stage the classical coordinate ring is noetherian, its invariant ring is Artinian,
  and its cohomology sheaves in any bounded Postnikov range are coherent.
  Adding the other frames to a one-frame presentation is an affine operation.
  These are precisely the finite-stage properties we use.

#thm([Lemma 3.1.])[
  (Finite covariants and completion).  #emph[Let $K$ be a reductive complex algebraic group,
    possibly disconnected, and let $A$ be a finitely generated $K$-algebra.
    Suppose $A^K$ is Artinian and $"Spec" A$ has a unique closed $K$-orbit $O$, with ideal $I$.
    For an equivariant finite $A$-module $M$ and a finite-dimensional $K$-representation $D$, the inverse system
$ "Hom"_K \( D \, M \/ I^n M \) $

 is eventually constant with value $"Hom"_K \( D \, M \)$.
   In particular the rational, locally $K$-finite part of the $I$-adic completion recovers $M$,
   and recovers $A$ together with its multiplication when $M = A$.]
] <mod:finite-covariants>

#proof[
  Choose a finite-dimensional $K$-stable generating space $U subset M$.
    The surjection $A ⊗ U arrow.r M$ induces a surjection on $"Hom"_K \( D \, - \)$, by reductivity.
    Finite generation of the covariants of $A$ over $A^K$ [9] Lemma 2.3 therefore makes $M_D =
    "Hom"_K \( D \, M \)$ finite over $A^K$, hence finite-dimensional. This applies to disconnected $K$:
    its identity component is reductive and its component group is finite. Let $N = ⋂_(n gt.eq 1) I^n M$.
    It is a finite equivariant submodule because $A$ is noetherian.
    At every point of $O$ its localization vanishes by Krull intersection [29] Tag 00IP.
    If $N$ were nonzero, its nonempty invariant closed support would contain a closed orbit, hence would meet $O$.
    Therefore $N = 0$.
  The descending subspaces $"Hom"_K \( D \, I^n M \)$ of $M_D$ have zero intersection and thus are eventually
    zero. Reductivity in characteristic zero makes $"Hom"_K \( D \, - \)$ exact, so
  $ "Hom"_K \( D \, M \/ I^n M \) = M_D \/ "Hom"_K \( D \, I^n M \) . $
  This proves the assertion. Every rational representation is the union of its finite-dimensional
    subrepresentations; applying the assertion to all $D$ therefore recovers $M$.
    Applied also to finite tensor products of representation spaces,
    it recovers multiplication and every equivariant finite-presentation map. ◻
]

For example, let $bb(G)_m$ act with weights $1 \, - 1$ on the coordinate functions $x \, y$, and put

$ A_N = bb(C) \[ x \, y \] \/ \( \( x y \)^N \) \, wide A_N^(bb(G)_m) = bb(C) \[ t \] \/ \( t^N \) \, quad t =
  x y \, quad N gt.eq 1 . $

The origin is the unique closed orbit. Each weight space of $A_N$ is finite-dimensional,
  so the locally $bb(G)_m$-finite part of its $\( x \, y \)$-adic completion recovers $A_N$.
  The ordinary inverse limit also contains arbitrary formal series such as $sum_(m gt.eq 0) x^m$,
  which are not locally finite. Thus rational recovery retains the nonzero points on both axes,
  not only the closed orbit. As $N$ varies, these stages give the formal neighborhood of $x y = 0$,
  including the formal invariant parameter $t$. The next lemma carries out this recovery for derived algebras and
  their maps.

#thm([Lemma 3.2.])[
  (Restoring the invariant base).  #emph[For the framed component above,
    an equivariant isomorphism of its completion along $K \/ J$ with another such completed model extends uniquely
    over the formal invariant bases to an isomorphism of their invariant-fiber completions.
    The same assertion holds for equivariant maps and their full mapping spaces,
    and for finite equivariant presentation data. Here the extension is unique up to a contractible space of choices.]
] <mod:reconstruction>

#proof[
  We give the derived argument, since recovering coordinate rings alone would not recover homotopies.
    The proof has three stages: finite covariants recover each affine stage and its mapping spaces;
    trivial covariants recover the invariant base; derived Koszul thickenings then give compatible extensions over
    that base. Write $cal(R)_K$ for the derived category of rational $K$-representations.
    All limits in this paragraph are taken in $cal(R)_K$, not in the category of vector spaces with an arbitrary,
    possibly nonrational, $K$-action.
  #emph[Recovery at a fixed invariant-base stage.] Let $A$ be its connective coordinate algebra,
    viewed as a commutative algebra in $cal(R)_K$. The precise hypotheses are that $H^0 \( A \)$ is finitely
    generated, $H^0 \( A \)^K$ is Artinian, $"Spec" H^0 \( A \)$ has a unique closed orbit $O$,
    and every $H^i \( A \)$ is finite over $H^0 \( A \)$. Choose a finite-dimensional $K$-stable generating space
    for the ideal of $O$ in $H^0 \( A \)$, lift its generators to degree-zero cycles,
    and extend them to a finite-dimensional stable generating space for $H^0 \( A \)$.
    Reductivity allows these lifts to be equivariant. This gives a map from a polynomial $K$-algebra $P$ to $A$,
    surjective on $H^0$. Let $I_P$ be the ideal generated by the chosen orbit equations and put
  $ A_n = A ⊗_P^(upright(bold(L))) P \/ I_P^n . $
  These derived orbit jets compute completion along $O$; the module-level comparison is [29] Tag 0BKH.
    The resulting formal neighborhood is independent of the generating presentation [3] Theorem A.1.3(c) and §A.1.5.
  Here is the cohomological calculation at these jets. Every $H^i \( A \)$ is a finite $P$-module.
    Noetherian Artin–Rees makes the positive-Tor systems ${ "Tor"_j^P \( H^i \( A \) \, P \/ I_P^n \) }_n$,
    $j > 0$, pro-zero. Since $P$ has finite global dimension,
    the hyper-Tor calculation has finite width in every cohomological degree, even if $A$ is unbounded below.
    Consequently
  $ { H^i \( A_n \) }_n tilde.eq { H^i \( A \) \/ I_P^n H^i \( A \) }_n $
  as pro-modules. This is the coherent derived-completion calculation of [29] Tags 00MA, 0A06, and 0BKH,
    applied here over the ordinary noetherian polynomial ring $P$.
    For every finite-dimensional $K$-representation $D$, Lemma 9 and exactness of covariants therefore give a
    natural pro-isomorphism
  #[#set math.equation(numbering: n => "(3.3)")
   $ { H^i "RHom"_K \( D \, A_n \) }_n tilde.eq H^i "RHom"_K \( D \, A \) \, $ <mod:derived-covariants>]
  with a constant system on the right. In particular these systems have zero $lim^1$.
    The functors $"RHom"_K \( D \, - \)$ commute with limits and jointly detect equivalences in $cal(R)_K$.
    Applying the Milnor exact sequence to (3.3) proves
  #[#set math.equation(numbering: n => "(3.4)")
   $ A arrow.r^tilde.op "holim"_n A_n quad upright("in ") "CAlg" \( cal(R)_K \) . $ <mod:rational-derived-completion>]
  Indeed the forgetful functor from commutative algebras creates limits and detects equivalences.
    Thus this is a natural equivalence of algebras, not merely an identification of their cohomology.
    It gives, for every rational equivariant coordinate algebra $B$, an equivalence of full mapping spaces
  #[#set math.equation(numbering: n => "(3.5)")
   $ "Map"_("CAlg" \( cal(R)_K \)) \( B \, A \) tilde.eq "holim"_n "Map"_("CAlg" \( cal(R)_K \)) \( B \, A_n \) \,
     $ <mod:mapping-spaces>]
  compatible with composition. No index $n$ uniform in $i$ or $D$ has been asserted or used.
    The rational limit is essential: as in the preceding example,
    the ordinary vector-space limit would retain arbitrary formal series.
    The same calculation applies to an $A$-module with coherent cohomology.
    Finite equivariant module presentations and their maps are recovered by testing their generating
    representation spaces; their relations and coherent homotopies are recovered by the corresponding derived
    mapping spaces.
  #emph[Recovery of the invariant base.] The formal coarse base is constructed from the system of trivial
    covariants of the framed affine stages [3] §§5.3.5–5.3.6.
    We do not identify an arbitrarily chosen base stage with the spectrum of its pullback’s invariant algebra.
    The trivial case of (3.3) instead recovers this entire system.
    On classical invariant functions the topologies are cofinal:
    if $frak(m)$ is the invariant ideal of definition, then $frak(m) subset I$, and,
    after passage to a fixed nilpotent invariant-base stage, Lemma 9 makes the trivial covariants of high powers
    of $I$ vanish. Applying this in every bounded range gives the corresponding comparison for the derived
    invariant systems. An equivariant map of orbit completions therefore gives the formal base map as well.
  #emph[Factorization and extension.] The noetherian formal-affine presentation of that base uses finitely many
    invariant generators $t_1 \, dots.h \, t_r$ of an ideal of definition.
    The noetherian and coherent presentation is supplied by [3] Theorem A.1.3(b),(c) and Remark A.1.4.
    Its infinitesimal stages may be taken to be the derived Koszul thickenings
  #[#set math.equation(numbering: n => "(3.6)")
   $ R_N = R \/ #h(-0.16667em) \/ \( t_1^N \, dots.h \, t_r^N \) :=
     R ⊗_(bb(C) \[ u_1 \, dots.h \, u_r \])^(upright(bold(L))) bb(C) \, wide
     u_j mapsto t_j^N . $ <mod:koszul-base-stages>]
  These are precisely the formal-affine stages used in [3] §7.1 and §§7.9.8–7.9.10.
    The relevant framed base changes are affine and almost of finite type.
  Restrict a map of orbit completions to the completed orbit of one source stage $A$.
    Compose it with the target’s map to its formal base and then with the structural map to $"Spec" R$.
    Equation (3.5), applied to the base algebra $R$ with trivial $K$-action, recovers a map $R arrow.r
    A$ and its homotopies. The images of the $t_j$ vanish at the reduced invariant point,
    so they are nilpotent in the Artinian algebra $H^0 \( A \)^K$.
    Choose a common power $N$ and invariant nullhomotopies of these $t_j^N$.
    Such nullhomotopies exist because vanishing in $H^0$ means being a boundary;
    they may be chosen invariant by reductivity. The universal property of (3.6) now factors this base map through
    a derived Koszul stage. Pulling back the target framed component along that stage factors the completed-space
    map through an affine target stage. Nilpotence alone would not justify factorization through an ordinary
    quotient. If $B_N$ is the coordinate algebra of the resulting affine target stage,
    the completed-stage map is a compatible point of the right-hand side of (3.5), with $B = B_N$.
    It therefore extends to a map on the source stage $A$, with all its homotopies and composition data.
  For clarity, the choices of powers and nullhomotopies do not add extra maps.
    The Koszul stages are cofinal tests for a formal neighborhood. One can check this directly on mapping spaces:
    above a fixed map with nilpotent $t_j$, the choices of nullhomotopy are torsors for the corresponding additive
    loop spaces, and increasing $N$ to $M$ acts on their differences by multiplication by $t_j^(M - N)$.
    Nilpotence kills every such homotopy group after passing far enough in this filtered system.
    Its nonempty space of choices is therefore contractible. This verifies cofinality for maps and homotopies,
    without interchanging a filtered colimit with a Postnikov limit.
    Equation (3.5) makes the extended maps on different source stages compatible.
    Applying it also to inverse maps and to their compositions completes the proof. ◻
]

Thus completion along the closed orbit is used to #emph[construct] coordinates.
  It is not substituted for completion along the invariant null fiber.
  For example, nonclosed points of that null fiber are retained by Lemma 10.

=== 3.2 Simultaneous linearization <simultaneous-linearization>

Here is the elementary nonresonance calculation that removes the higher relations in the local deformation
  problem. The classical Frobenius-compatible quadratic hull in the smooth proper,
  pure weight-zero setting is established in [26] Theorem 2.11 and Corollary 2.12;
  its proof also uses Jordan decomposition on finite jets. We retain the derived presentation and equivariant
  data, then apply Lemma 10 to restore the formal invariant base.

#thm([Lemma 3.3.])[
  (Nonresonance with Jordan blocks).  #emph[Let a minimal complete free graded-commutative algebra have generators
    $V^(*)$ in cohomological degree $0$ and $R^(*)$ in degree $- 1$.
    Suppose a continuous graded automorphism has linear parts of absolute weights $- 1$ and $-
    2$ on these two generator spaces. It is conjugate, by a formal graded coordinate change tangent to the
    identity, to its linear part. If it commutes with a minimal differential, that differential,
    in the resulting coordinates, sends $R^(*)$ to quadratic polynomials in $V^(*)$.
    These assertions hold equivariantly for a reductive group normalized by the automorphism.]
] <mod:nonresonance>

#proof[
  Filter coordinate changes by total generator order. At order $n gt.eq
    2$ the error in a degree-zero generator belongs to $"Hom" \( V^(*) \, "Sym"^n V^(*) \)$.
    All eigenvalues of the conjugacy operator “linear target action times inverse linear source action” on this
    space have modulus $q^(- \( n - 1 \) \/ 2)$, hence differ from $1$.
    An error in a degree-minus-one generator contains exactly one degree-minus-one factor and $n -
    1$ degree-zero factors. The corresponding operator on
  $ "Hom" \( R^(*) \, R^(*) ⊗ "Sym"^(n - 1) V^(*) \) $
  has the same modulus $q^(- \( n - 1 \) \/ 2)$. In either case its difference from the identity is invertible.
    This assertion follows from its eigenvalues and holds on generalized eigenspaces;
    it requires no diagonalization. Solve the conjugacy equation at this order and continue.
    The corrections converge in the generator-adic topology.
  In the equivariant case the errors and corrections lie in the equivariant subspaces of these finite-dimensional
    jet spaces. The conjugacy operator preserves these subspaces and its inverse does also,
    so the same construction is equivariant. Transport the differential along the coordinate changes.
    The differential of a degree-zero generator is zero by degree.
    That of a degree-minus-one generator has no constant or linear term by minimality.
    Since the differential commutes with the now linear automorphism,
    an order-$n$ term can occur only if its weight $- n$ agrees with $- 2$. Thus only $n = 2$ remains. ◻
]

#thm([Theorem 3.4.])[
  (The framed quadratic model).  #emph[ The retained component $Z_sigma$, with its Frobenius action,
    evaluation bundles at the chosen cyclic tuple, and singular-support map, admits the model
#[#set math.equation(numbering: n => "(3.7)")
 $ Z_sigma tilde.eq #scale(x: 120%, y: 120%)[\[] \( mu^(- 1) \( 0 \) \)_(upright("unst"))^and \/ J
   #scale(x: 120%, y: 120%)[\]] . $ <mod:quadratic-equation>]

 Here $upright("unst")$ is the inverse image of the origin under $V arrow.r V \/ #h(-0.16667em) \/ J$,
   and completion is along this invariant null fiber. In this model:]
  + #emph[the singularity scheme has points $\( x \, z \)$ satisfying $mu \( x \) = 0$ and $z x = 0$,
    with $z in frak(j)$;]
  + #emph[the support condition defined by $Y$ is the condition that the image of $z$ under $frak(j) arrow.r.hook
    hat(frak(g))$ belongs to $Y$;]
  + #emph[every evaluation representation of $K = hat(G)^d$ is the bundle associated to its restriction along $J
    arrow.r.hook K$; Frobenius has constant cyclic transport on these bundles;]
  + #emph[after removing the scalars $q^(1 \/ 2)$ on deformation points and $q^(- 1)$ on singular points,
    Frobenius is a linear automorphism of the moment-map data,
    normalizing $J$ and the framed representation labels. Its eigenvalues on these normalized linear data have
    modulus one.]
  #emph[The meaning of Frobenius on Hom complexes in (iv) is fixed explicitly in Lemma 3.5 below.]
] <mod:model>

#proof[
  We first work in the completion of the framed component along $K \/ J$.
    The smooth affine orbit admits an equivariant formal retraction:
    lift the identity retraction through successive nilpotent neighborhoods, using smoothness,
    and average the lifting torsors using reductivity. The fiber is a formal slice with stabilizer $J$;
    the completed framed space is its induction from $J$ to $K$.
    Equivalently, this follows by splitting the orbit tangent directions and comparing tangent complexes at every
    lifting step.
  The transverse tangent and obstruction spaces are respectively $V =
    H^1 \( hat(frak(g))_sigma \)$ and $H^2 \( hat(frak(g))_sigma \)$.
    Quasi-smoothness therefore gives a minimal presentation by complete free coordinates dual to these spaces in
    degrees $0$ and $- 1$. One obtains this presentation from a free resolution by removing the contractible
    linear pairs; the splittings can be chosen $J$-equivariantly.
  We recall the second-order obstruction calculation to fix its coefficient and sign,
    working over $E$ before the chosen coefficient transport.
    Use the simplicial descent model for local systems underlying (2.4),
    computed by hypercover cochains with the $ell$-adic limit retained.
    Its adjoint cochains compute $R Gamma \( overline(X) \, hat(frak(g))_sigma \)$,
    and its cup bracket combines the cup product with the Lie bracket of the adjoint coefficients.
    For a formal parameter $t$, write a perturbation of the descent data modulo $t^3$ as $g_(i j)
    exp \( t x_(i j) + t^2 y_(i j) \)$, with the cochains twisted by the original transition data $g_(i j)$.
    Expanding the cocycle equation by the Baker–Campbell–Hausdorff formula gives
  $ d x = 0 \, wide d y = - 1 / 2 \[ x \, x \] . $
  Thus the quadratic obstruction is the class of $1 / 2 \[ x \, x \]$ in
    $H^2 \( overline(X) \, hat(frak(g))_sigma \)$. This calculation uses a cochain model computing the deformation
    problem, rather than an assumed finite trivializing cover.
    Invariance of the coefficient pairing and graded commutativity give, with the duality and sign convention of (3.2),
  $ chevron.l 1 / 2 \[ x \, x \] \, z #scale(x: 120%, y: 120%)[chevron.r] = 1 / 2 omega \( z x \, x \) =
    chevron.l mu \( x \) \, z chevron.r . $
  This identifies the quadratic obstruction with $mu \( x \)$.
  We next arrange that both the retraction and these coordinates respect the chosen Frobenius transporter.
    Purity gives absolute point weights $0 \, 1 \, 2$ on the orbit tangent, transverse tangent,
    and obstruction spaces. A positive-transverse-order error in the retraction has positive source weight and
    orbit target weight zero. Its Frobenius conjugacy operator therefore has no eigenvalue $1$.
    At every finite jet order it can be removed uniquely by solving the same linear equation used in Lemma 11.
    The errors are equivariant sections of the tangent bundle of the smooth orbit;
    they are determined by their $J$-equivariant values at its base point.
    The stabilizer transport and the cyclic permutation of frames have weight zero.
    This constructs a Frobenius-compatible retraction and an invariant slice.
  Represent its single cyclic automorphism on the minimal free presentation.
    Such a representative can be chosen equivariantly by free lifting and reductivity.
    Its invertible linear part makes it an automorphism of the complete graded algebra.
    There is no additional relation to impose on the generator of an infinite cyclic action.
    On formal coordinate functions use inverse transport; its generator weights are $- 1 \, - 2$.
    Lemma 11 makes this automorphism linear and forces the transported differential to be quadratic.
    A coordinate change tangent to the identity preserves that quadratic part,
    so the differential is precisely $mu$. This proves the moment-map presentation on the orbit completion.
    Lemma 10 extends it over the invariant base, giving (3.7).
  For its singularities one computes directly that
  $ chevron.l d mu_x \( v \) \, z chevron.r = omega \( z x \, v \) . $
  Nondegeneracy of $omega$ identifies $ker \( d mu_x^(*) \)$ with ${ z : z x = 0 }$, proving (i).
    The singular evaluation map is fiberwise linear in $z$. At $x =
    0$ curve duality identifies it with the centralizer inclusion $frak(j) arrow.r.hook hat(frak(g))$,
    with its duality Tate factor. The target singular points have absolute weight $- 2$.
    A correction of positive degree $n$ in $x$, linear in $z$, would have weight $n - 2$,
    and cannot intertwine this Frobenius action. Comparison on each finite jet, again valid for Jordan blocks,
    excludes every such term. This proves (ii). Changing the invariant form only rescales the simple factors of
    $hat(frak(g))$, which preserves every nilpotent orbit.
  Finally, a $K$-frame is exactly the datum trivializing all the evaluation bundles in question.
    Write $cal(S)$ for the formal slice. The equivariant retraction identifies the framed completion with $K
    times^J cal(S)$, with its map to $K \/ J$ given by $\[ k \, s \] mapsto k J$.
    For a representation $D$ of $K$, quotienting the trivial framed bundle by $K$ therefore gives the bundle on
    $\[ cal(S) \/ J \]$ associated to $D \|_J$. The retraction is Frobenius-compatible,
    so the transport on its $K \/ J$ coordinate is the closed-orbit transport, independent of $s$.
    The same is therefore true of the cyclic transport on every evaluation bundle.
    Purity on the chosen Weil parameter gives modulus-one eigenvalues on every normalized frame representation.
    A cyclic action can be tested on its $d$th power. Together with purity on $H^1$ and $H^2$,
    this proves (iii) and (iv). ◻
]

=== 3.3 Which action contracts Hom complexes <which-action-contracts-hom-complexes>

The next convention is essential: the category still has the endomorphism $Phi$ specified in the problem.

#thm([Lemma 3.5.])[
  (Inverse transport on arrows).  #emph[ Choose structures $alpha_M :
    Phi M arrow.r^tilde.op M$ on compact objects. On an arrow $h : M arrow.r N$ put
#[#set math.equation(numbering: n => "(3.8)")
 $ T \( h \) & = alpha_N thin Phi \( h \) thin alpha_M^(- 1) \,\
S \( h \) & = Phi^(- 1) \( alpha_N^(- 1) h alpha_M \) = T^(- 1) \( h \) . $ <mod:T>]

 The action in the bilinear Hom pairing is $S$. On the quadratic model it gives absolute weight $-
   1$ to deformation functions and absolute weight $+ 2$ to degree-two obstruction operators.
   Thus its associated point weights on $\( x \, z \)$ are $\( 1 \, - 2 \)$, and $W \( x \, z \) = chevron.l z \,
   mu \( x \) chevron.r$ has weight zero.]
  #emph[The graph identification in (5.4) turns the original $Phi$-graph bimodule into the graph of the
    transported arrow action. In those coordinates the induced simultaneous bar actions $T$ and $S$ are inverse.
    If the paracyclic homotopy is $b H + H b = 1 - T$, then
#[#set math.equation(numbering: n => "(3.9)")
 $ b \( - T^(- 1) H \) + \( - T^(- 1) H \) b = 1 - S . $ <mod:inverse-homotopy>]

 In particular using contracting $S$-weights does not replace $"Tr" \( Phi \, - \)$ by $"Tr" \( Phi^(- 1) \, - \)$.]
] <mod:frobenius>

#proof[
  The Frobenius compatibility in Section 2 identifies $Phi$ with $f^(!)$,
    where $f$ is pullback of parameters by geometric Frobenius of the curve.
    Since $f$ is an automorphism, this is its usual pullback functor.
    A covariant trace structure is $b : N arrow.r Phi N$, whereas a structure on the opposite input is $a :
    Phi M arrow.r M$. Their pairing takes an arrow to
  $ h mapsto Phi^(- 1) \( b thin h thin a \) . $
  With $b = alpha_N^(- 1)$ and $a = alpha_M$ this is (3.8). It is the inverse of (3.8), directly by composition.
  For the signs, consider a coordinate and a relation generator with $f^(\#) x = a_1 x$ and $f^(\#) epsilon.alt =
    a_2 epsilon.alt$, where $\| x \| = 0$, $\| epsilon.alt \| = - 1$.
    Inverse transport on the endomorphisms of the free module sends multiplication by $x$ to multiplication by
    $a_1^(- 1) x$. In a Koszul resolution the degree-two operator dual to $epsilon.alt$ transforms by $a_2$ under
    the same transport. Thus purity, $\| a_1 \| = q^(1 \/ 2)$ and $\| a_2 \| = q$, gives the stated signs.
    The calculation is linear-algebraic and applies to generalized eigenspaces.
    The polynomial operator dual to $epsilon.alt$ is a linear function on the singular variable $z$;
    point weights are the contragredient weights, giving $- 2$ on $z$.
  There is a distinction between ordinary arrows and raw graph coefficients.
    In the left-graph convention for classes $M arrow.r Phi M$,
    a raw coefficient is $m in "Hom" \( M \, Phi N \)$. It is identified with an ordinary arrow by $m mapsto
    alpha_N m$. The simultaneous operator on this raw coefficient is
  $ m mapsto Phi \( alpha_N \) Phi \( m \) alpha_M^(- 1) \, $
  not the ordinary-arrow formula (3.8). Under the stated graph identification it becomes the transported
    ordinary-arrow action. The full multiobject identification,
    including permuted labels and the last twisted bar face, is proved in Lemma 21; see (5.4)–(5.5).
    Thus the paracyclic homotopy is transported through an actual isomorphism of graph bimodules.
    In these coordinates $T$ commutes with $b$, and multiplying $b H + H b = 1 - T$ by $- T^(- 1)$ proves (3.9).
    For permuted labels a common positive power is used only to read their weights.
    The graph throughout is canonically identified with the original $Phi$-graph;
    neither a power of $Phi$ nor $Phi^(- 1)$ is substituted for it. ◻
]

=== 3.4 Compact normalization, including the frame labels <compact-normalization-including-the-frame-labels>

For the measure calculation, modulus-one eigenvalues before twisting are not enough:
  they must remain of modulus one after every compact stabilizer twist.
  We establish a simultaneous normalization of the deformation and frame data.
  Choose a faithful representation $R$ of $hat(G)$ and include in the linear data the direct sum of its fibers at
  all $d$ framed points. The $d$th power of the cyclic transporter acts on these summands by the pure weight-zero
  closed-point Weil transports. Hence the cyclic transporter itself has modulus-one eigenvalues.
  Together with $V$ and $frak(j)$, these data give a faithful finite-dimensional realization of the normalized
  algebraic data group, a subgroup of a product of linear groups and $K times.r chevron.l
  upright("cyclic permutation") chevron.r$.

#thm([Lemma 3.6.])[
  (Simultaneous compact normalization).  #emph[Let $J . e$ be a nilpotent orbit preserved by the normalized
    transporter in Theorem 3.4. After changing that transporter by an element of $J$,
    choose a triple $\( e \, h \, f \)$ in this orbit and write the normalized transporter as
$ u = t thin v_0 . $

 There are simultaneous compact forms of the group and frame data such that:]
  + #emph[$t$ belongs to a compact group, preserves the compact form $J_(upright("cpt"))$, and centralizes the triple;]
  + #emph[$v_0$ is unipotent, centralizes $J$, and commutes with $t$;]
  + #emph[for $L_e = Z_J \( upright("SL")_(2 \, e) \)$, $L_(e \, upright("cpt")) =
    L_e ∩ J_(upright("cpt"))$ is a maximal compact including its components, and every $k t v_0$,
    $k in L_(e \, upright("cpt"))$, has modulus-one eigenvalues on all the normalized linear data.]
  #emph[These assertions also hold on their tensor, symmetric, exterior, subquotient,
    and triple-weight constructions. After the orbit-fixing translation by $lambda_e \( sqrt(q) \)$,
    the semisimple value of the frame transport around the $d$-cycle belongs to
#[#set math.equation(numbering: n => "(3.10)")
 $ { \[ lambda_e \( q^(d \/ 2) \) s \] : s in Z_(hat(G)) \( upright("SL")_(2 \, e) \)_(upright("cpt"))
   #scale(x: 120%, y: 120%)[}] = B_(hat(G) . e) . $ <mod:cyclic-compact-value>]

 This holds for every $k in L_(e \, upright("cpt"))$.]
] <mod:compact-normalization>

#proof[
  Write $u_1 = s_1 v_1$ for the Jordan decomposition of the original normalized transporter in its algebraic
    normalizer. Both factors preserve the data and normalize $J$.
    The semisimple part has compact closure of its powers in the faithful realization just chosen.
  We first remove the inner action of the unipotent part; this step requires some care when $J$ is disconnected.
    For a complex reductive group,
  #[#set math.equation(numbering: n => "(3.11)")
   $ "Aut" \( J \)^compose = "im" #scale(x: 120%, y: 120%)[\(] J^compose arrow.r
     "Aut" \( J \) #scale(x: 120%, y: 120%)[\)] . $ <mod:connected-automorphisms>]
  Indeed an infinitesimal automorphism is inner on the semisimple part of $J^compose$ and trivial on its central
    torus, whose character lattice has discrete automorphism group.
    After subtracting this inner action, its values on the other components give a cocycle of the finite group
    $pi_0 \( J \)$ with values in $"Lie" Z \( J^compose \)$. Averaging makes that cocycle a coboundary,
    which is an inner infinitesimal action by the central torus.
    This proves surjectivity of the differential of the inner-automorphism map and hence (3.11).
    The kernel of $J^compose arrow.r "Aut" \( J \)$ is $Z \( J \) ∩ J^compose$, a diagonalizable central group.
    Therefore the automorphism induced by $v_1$ has a unique unipotent lift $a in J^compose$:
    take the unipotent part of any lift; uniqueness follows because two such lifts differ by a central semisimple
    element. Since $s_1$ commutes with $v_1$, uniqueness gives $s_1 a s_1^(- 1) = a$.
    The element $v_0 = a^(- 1) v_1$ is unipotent, centralizes $J$, and commutes with $s_1$:
    here $v_1 a v_1^(- 1) = a$ because the action of $v_1$ on $J$ is conjugation by $a$,
    so the two unipotent factors defining $v_0$ commute. Changing the transporter by $a^(- 1) in
    J$ thus leaves $s_1 v_0$. Since $v_1$ acts on $frak(j)$ by an inner automorphism,
    it preserves every $J$-orbit; the assumed stable orbit is therefore also preserved by $s_1$.
  Let $A_1$ be the Zariski closure of the group generated by $s_1$.
    It is diagonalizable, normalizes $J$, and $M = J A_1$ is reductive:
    its unipotent radical maps trivially to $M \/ J$ and would be a connected normal unipotent subgroup of
    $J^compose$. The maximal-compact theorem for complex reductive groups,
    including disconnected groups [1] Definition 3.3 and Theorems 3.6–3.7,
    gives a maximal compact $M_(upright("cpt"))$ containing the compact closure of $chevron.l s_1 chevron.r$.
    Its intersection with $J$ is a maximal compact $J_(upright("cpt"))$:
    conjugate a maximal compact of $J$ into $M_(upright("cpt"))$ and use normality of $J$ and maximality inside
    the compact intersection. The element $s_1$ preserves this intersection.
    Averaging one Hermitian form makes this whole compact group unitary on the faithful simultaneous realization.
  Choose the triple in $J . e$ so that its $upright("SU") \( 2 \)$ lies in $J_(upright("cpt"))$.
    The two homomorphisms $upright("SL")_2 arrow.r J$ given by this triple and its $s_1$-translate are
    $J$-conjugate, because their nilpotents lie in the same orbit.
    Their restrictions to $upright("SU") \( 2 \)$ land in $J_(upright("cpt"))$,
    so they are already conjugate by an element $k_0 in J_(upright("cpt"))$.
    For completeness, if a complex conjugator is $b = k p$ in the polar decomposition relative to
    $J_(upright("cpt"))$ [1] Lemma 3.5, unitarity of the two homomorphisms implies that $b^(*)
    b$ commutes with the first one. Its positive square root $p$ therefore commutes with it,
    and $k$ is the required compact conjugator. This works in every component.
    Set $t = k_0 s_1$, choosing the conjugator’s direction so that $t$ centralizes the triple.
    Since $v_0$ centralizes $J$, it commutes with $k_0$, with $t$, and with every compact twist from $L_e$.
    The product $k t$ belongs to $M_(upright("cpt"))$ and is unitary for the same Hermitian form.
    Multiplication by the commuting unipotent $v_0$ changes neither its eigenvalues nor its semisimple character.
    The centralizer of $upright("SU") \( 2 \)$ is stable under the compact conjugation,
    so its compact intersection is a compact real form of the full complex triple centralizer [1] Lemma 3.10,
    including every component. This proves (i)–(iii). The same proof applies to all the indicated functorial
    linear constructions.
  It remains to check the cyclic frame value, rather than merely the action on $V$.
    Embed the compact frame image of $M_(upright("cpt"))$ in a maximal compact of $K times.r chevron.l
    upright("cyclic permutation") chevron.r$. Its intersection with $K$ is a product of compact forms of the $d$
    factors. For $k in L_(e \, upright("cpt"))$, the $i$th factor of $\( k t \)^d$ is the product transport around
    the cycle starting at the $i$th frame. It is compact and centralizes the triple in that factor.
    Since $v_0$ commutes with $k t$, the corresponding factor of $\( k t v_0 \)^d$ has that compact element as its
    semisimple part. The translation by $lambda_e \( sqrt(q) \)$ commutes with both $k t$ and $v_0$,
    and $v_0$ commutes with $k t$. Thus, writing $w = k t$,
  $ #scale(x: 120%, y: 120%)[\(] lambda_e \( sqrt(q) \) w v_0 #scale(x: 120%, y: 120%)[\)]^d =
    lambda_e \( q^(d \/ 2) \) w^d v_0^d . $
  No commutation between $k$ and $t$ is needed. This proves (3.10).
    Compact forms of the triple centralizer are conjugate inside that centralizer,
    so the set of ambient conjugacy values is independent of the compact form chosen in this proof. ◻
]

Translation of a transporter by $J$ does not change an equivariant calculation:
  it changes the chosen identification of the same Frobenius functor.
  After the additional translation by $lambda_e \( sqrt(q) \)$ the point $e$ is fixed,
  since singular points originally scale by $q^(- 1)$ and $e$ has triple weight $2$.
  The resulting weights and the distinction between the original and lifted gradings are recorded in Section 4.

== 4 The category on a nilpotent orbit <orb:section>

Fix an isomorphism $overline(bb(Q))_ell tilde.eq bb(C)$ and a Frobenius-fixed retained component.
  Use the quadratic model of Theorem 3.4, with $J = "Aut" \( sigma \)$, $frak(j) = "Lie" \( J \)$ and $V =
  H^1 \( overline(X) \, hat(frak(g))_sigma \)$. All representations in this section are algebraic;
  rational representations of an algebraic group may be unions of finite-dimensional representations.
  The group $J$ is reductive but need not be connected. We first omit the completion along the invariant null
  fiber. Section 5 restores that condition, on both traces and their actual compact representatives.

On each nilpotent orbit we construct compact generators, extend them with Weil structures to its closure,
  and compute their morphisms. With pure coefficient normalizations,
  the generators and their weight-zero morphism cohomology form a semisimple category,
  and the remaining weights for the inverse action $S$ are strictly negative.
  Section 5 uses these facts to contract the nonconstant part of each orbit trace.

=== 4.1 The curved model and supported localization <the-curved-model-and-supported-localization>

Put $R = bb(C) \[ V \]$. The derived zero fiber of the moment map is represented by the Koszul differential graded
  algebra

#[#set math.equation(numbering: n => "(4.1)")
 $ A = #scale(x: 120%, y: 120%)[\(] R ⊗ Lambda \( frak(j) \[ 1 \] \) \, d_mu #scale(x: 120%, y: 120%)[\)] \,
   wide \| eta_a \| = - 1 \, wide d_mu eta_a = mu_a . $ <orb:derived-koszul>]

Here a basis of $frak(j)$ indexes the components $mu_a$ of $mu : V arrow.r frak(j)^(*)$.
  In particular, no regularity of this section is asserted or needed. Its graded Koszul dual is the curved algebra

#[#set math.equation(numbering: n => "(4.2)")
 $ B = bb(C) \[ V times frak(j) \] \, wide \| x^(*) \| = 0 \, quad \| z^(*) \| = 2 \, wide W \( x \, z \) =
   chevron.l z \, mu \( x \) chevron.r . $ <orb:potential>]

A curved module has a differential $delta$ of degree one satisfying $delta^2 = W$.
  A simultaneous reversal of the curvature sign gives the same calculations after the corresponding convention change.

#thm([Lemma 4.1.])[
  (Koszul model and support).  #emph[The compact ind-coherent category on the uncompleted derived quotient
    $\[ mu^(- 1) \( 0 \) \/ J \]$ is the category of finite coherent graded $J$-equivariant factorizations of
    (4.2). Coherent singular support in a closed cone $Omega subset
    frak(j)$ corresponds to local vanishing of the factorization off $V times Omega$.
    The completion in Theorem 3.4 additionally imposes ordinary support on the inverse image of $0 in "Spec" R^J$.]
] <orb:koszul>

#proof[
  The uncompleted derived quotient is a QCA stack: it is quasi-compact, with affine stabilizers,
    and its classical inertia is of finite presentation, as for every finite-type quotient here.
    Its compact ind-coherent objects are therefore its coherent objects by [11] Theorem 3.3.5.
    We recall the Koszul construction to specify the derived and grading conventions.
    A coherent $A$-module is perfect as an $R$-complex because $R$ is regular.
    Choose a bounded finite projective $R$-resolution and transfer the actions of the degree-minus-one generators
    to it, allowing higher homotopies. The Koszul twisting cochain,
    on the symmetric #emph[divided-power coalgebra] of the dual generators,
    turns those homotopies into a differential on its extension to $B$. Its square is $sum_a z_a mu_a$.
    The linear coefficients encode nullhomotopies of $mu_a$, and the higher coefficients encode all compatibility
    homotopies for the exterior-generator actions. Conversely, the coefficients of such a curved differential,
    specialized at $z = 0$, recover that homotopy-coherent $A$-action.
  The usual free Koszul resolution proves that these constructions are inverse on derived modules and morphisms:
    after filtering by exterior length, it is the ordinary exterior/symmetric Koszul equivalence,
    and the equation differential contributes precisely the curvature term.
    There is no completed polynomial ring here. Between bounded finite projective models only finitely many
    $z$-monomials can occur in any fixed total degree. Derived morphisms on the curved side are sections of
    differential Hom; its two curvature terms cancel.
  One may equivalently define coherent curved modules modulo totalizations of finite exact sequences.
    On the smooth ambient space, finite locally free replacements compute this category.
    They are obtained by curved free covers, with the partner part of the differential correcting the square to
    $W$; the underlying coherent resolutions terminate by regularity.
    Reductivity permits equivariant choices for $J^compose$, followed by equivariance for the finite component
    group. This is also the equivariant derived-zero-locus Koszul equivalence of [30] Theorem 2.3.3,
    with its differential graded formulation in [25] Theorem 2.1.
  The variables $z_a$ are the degree-two complete-intersection operators on the $A$-side.
    Their localization is the localization defining coherent singular support.
    Under the equivalence, the category with that singular support is exactly the kernel of restriction to the
    complementary open, with the corresponding quotient description; this is [30] Proposition 2.3.9.
    Support here is support of the object in the curved category:
    a locally free underlying module can represent an object vanishing on an open set.
  The remaining completion imposes a different, ordinary support condition.
    For a DG scheme almost of finite type, [13] Proposition 7.4.5 identifies ind-coherent sheaves on its formal
    prestack completion with the kernel of restriction to the complementary open;
    its compact objects are the coherent objects with that ordinary support by [12] Proposition 4.1.7(b).
    Smooth descent, [12] Corollary 10.4.5, identifies the presentable supported categories on the quotient by $J$.
    Compactness on the quotient also uses the QCA theorem just invoked and the continuous support right adjoint of
    [12] Corollary 4.1.5. If $i$ denotes the supported inclusion and $Gamma$ its continuous right adjoint,
    then $"Hom" \( i M \, - \) = "Hom" \( M \, Gamma \( - \) \)$ shows that $i$ preserves compactness.
    Conversely, since $i$ preserves colimits, an ambient compact whose restriction to the complementary open
    vanishes is compact in the supported category. Its compact objects are therefore precisely the supported
    coherent objects. This identifies compacts after presentable descent,
    without commuting compact objects with a descent limit. Applied to the invariant null fiber in our derived
    affine model, it proves the last condition in the lemma. The completion is the formal prestack,
    not the spectrum of a completed coordinate ring. This ordinary support condition leaves the singular-direction
    operators unchanged and can be intersected with the prescribed $z$-support. ◻
]

Write $cal(B)_Omega$ for the resulting compact category with $z$-support in $Omega$,
  and $cal(B)_(Omega \, 0)$ when the invariant null-fiber condition is also imposed.
  We use the same notation with $"Ind"$ when a presentable category is required for a trace.
  All compact quotients below are idempotent completed.

#thm([Lemma 4.2.])[
  (Supported localization).  #emph[Let $Omega' subset Omega$ be closed invariant cones.
    Restriction to the complementary open gives the compactly generated localization with compact quotient
    $cal(B)_Omega \/ cal(B)_(Omega')$. If $cal(O)$ is an orbit closed in that open,
    its supported compact category is generated by coherent curved pushforwards from $V times cal(O)$.
    Morphisms are computed in the open before taking derived equivariant sections.
    The statements also hold with invariant null-fiber support.]
] <orb:localization>

#proof[
  Choose finite homogeneous equivariant generators of the relevant ideal sheaves on a finite affine cover.
    Koszul complexes on their powers, and their duals, give the ordinary local-cohomology projector and
    complementary localization. Tensoring a curved module by these ordinary complexes is defined because their
    differentials have square zero. A compact object’s identity factors through a finite stage of the projector if
    the object is supported on its center. Thus it is a summand of a finite supported stage.
  Let $i : Z_0 arrow.r.hook U$ be the smooth closed locus in the smooth ambient open, with ideal sheaf $I$,
    and let $K_n$ be the finite ordinary perfect projector stage just chosen.
    Its locally free terms need not be supported on $Z_0$. Its bounded ordinary cohomology sheaves are coherent,
    supported on $Z_0$, and annihilated by powers of $I$. Since $U$ is smooth, those coherent sheaves are perfect.
    Ordinary truncation triangles therefore express $K_n$ in their thick span.
    Each such sheaf has a finite $I$-adic filtration whose successive quotients have the form $i_(*) F$,
    for coherent sheaves $F$ on $Z_0$. The truncations, ideal filtrations,
    and their maps retain equivariance and grading.
  Ordinary perfect complexes act exactly by tensor product on coherent curved modules.
    The extra ordinary differential has square zero, so this action takes the preceding finite triangles to curved
    triangles without changing the potential. For a locally free curved representative $M$, the projection formula gives
  $ \( i_(*) F \) ⊗ M tilde.eq i_(*) #scale(x: 120%, y: 120%)[\(] F ⊗ upright(bold(L)) i^(*) M
    #scale(x: 120%, y: 120%)[\)] . $
  The right side is a coherent curved pushforward with the restricted potential.
    Consequently $K_n ⊗ M$ lies in the thick span of such pushforwards.
    The factorization of the identity through this stage makes $M$ a summand, proving generation.
    The ordinary truncations have been applied only to $K_n$, before its exact action on the curved factor.
  The same local-cohomology construction computes restriction and the quotient on morphisms;
    the support/quotient compatibility is also the one in [30] Proposition 2.3.9.
    On the ambient open, finite covers and finite Čech descent compute the ordinary perfect-complex statements.
    On a homogeneous orbit, equivariant descent takes the finite Lie-cochain complex for its unipotent stabilizer,
    followed by exact invariants for the reductive quotient. These bounded operations commute with the finite
    triangles and direct-sum folding of the grading. The argument also applies on homogeneous vector bundles.
    Ordinary support in the invariant base is preserved at every step. ◻
]

=== 4.2 Gradings and Clifford generators <gradings-and-clifford-generators>

The intersection of $frak(j)$ with $hat(cal(N))$ is its nilpotent cone:
  for a reductive subgroup, the semisimple and nilpotent parts of an element agree with those in the ambient
  faithful representation. There are finitely many nilpotent $J$-orbits.
  Fix one, $cal(O) = J . e$, and choose an $frak(s l)_2$-triple $\( e \, h \, f \)$ in $frak(j)$. Set

#[#set math.equation(numbering: n => "(4.3)")
 $ lambda = lambda_e \, wide C_e = J^e = L_e times.l U_e \, wide L_e = Z_J \( upright("SL")_(2 \, e) \) \, wide
   N_e = frak(j) \/ \[ frak(j) \, e \] . $ <orb:notation>]

The zero orbit is included, with trivial triple and $U_e = 1$.
  Subscripts $i$ denote $h$-weights, independently of cohomological degree or Frobenius weight.
  The Lie algebra of $U_e$ has strictly positive $h$-weights.
  The quotient $N_e$ consists of lowest-weight vectors and has $h$-weights at most zero.

Suppose first that the orbit is Frobenius-stable. By Lemma 14,
  the weight-zero normalized transporter can be chosen to fix the triple, preserve a compatible compact form,
  and remain of absolute weight zero after compact $L_e$-twists.
  Multiplication by $lambda \( sqrt(q) \)$ corrects the scalar motion of $e$ and gives an action fixing $e$.
  Write $S_e$ for this translated inverse action on the Hom calculation.
  For an orbit or a finite list of labels stable only under a power, the same convention is made for that power.
  Absolute weights are measured in units $q^(1 \/ 2)$ (or $q^(m \/ 2)$ for the $m$th power).

There is a separate translation of the grading. The original grading acts on $z$-points by $t^(- 2)$;
  lifting it by $lambda \( t \)$ makes $e$ fixed. We call the resulting degree on a fiber at $e$ the #emph[lifted
  degree]. The data needed below are

#[#set math.equation(numbering: n => "(4.4)")
 $ upright("factor") & upright("lifted degree before an Ext shift") & upright("absolute ") S_e upright("-weight")\
\( V_i \)^(*) upright(", as an ") x upright("-function") & - i & - 1 - i\
\( N_e \)_i upright(", as a normal tangent") & i - 2 & - 2 + i\
"Lie" \( U_e \)_i^(*) & - i & - i . $ <orb:weight-table>]

Translating by a group element changes none of the final equivariant invariants.
  In particular these are the actual weights there, rather than weights for a newly chosen categorical Frobenius.

The original super sign must be retained during this change of grading.
  It differs from the lifted-degree sign by the action of $lambda \( - 1 \)$.
  Consequently the lifted total-degree sign computes true alternating traces #emph[after taking invariants].
  In particular, a polynomial coordinate of odd lifted degree remains a commuting coordinate;
  it is not replaced by an exterior generator.

Put $Q_e \( x \) = W \( x \, e \)$. With the symplectic pairing on $V$, this is, up to the fixed moment-map sign,
  $1 / 2 chevron.l e x \, x chevron.r$. Its restriction to $V_(- 1)$ is nondegenerate:
  $e : V_(- 1) arrow.r V_1$ is an isomorphism and the symplectic pairing identifies $V_1$ with $V_(- 1)^(*)$. Let

$ D_e = "Cl" \( V_(- 1) \, Q_e \) $

be the ordinary Clifford algebra, with $c \( v \)^2 = Q_e \( v \)$,
  and let $sans(E)_e$ be the category of finite-dimensional $D_e$-modules with compatible algebraic $L_e$-action.

The related spectral Whittaker construction uses Clifford modules for a quadratic cohomology complex [27]
  Sections 4.5.2–4.5.5; its orbit trace comparison is Theorem J in Section 4.6.2 there.
  Here we keep explicit generators and their Hom weights, as well as compact Weil extensions,
  for the later bilinear tests.

For $P in sans(E)_e$, give its coefficient space lifted degree zero. Its original coefficient parity is the involution

#[#set math.equation(numbering: n => "(4.5)")
 $ gamma_P = rho_P \( lambda \( - 1 \) \) \, wide gamma_P c \( v \) gamma_P^(- 1) = -
   c \( v \) quad \( v in V_(- 1) \) . $ <orb:parity>]

Define $M_P$ over $e$ as the curved pushforward from $V_(gt.eq - 1) subset V$ of

#[#set math.equation(numbering: n => "(4.6)")
 $ #scale(x: 120%, y: 120%)[\(] cal(O)_(V_(gt.eq - 1)) ⊗ P \; quad delta =
   c \( x_(- 1) \) #scale(x: 120%, y: 120%)[\)] . $ <orb:generator>]

The unipotent radical acts on $P$ through its trivial quotient,
  and acts trivially on the projection of $V_(gt.eq - 1)$ to $V_(- 1)$.
  Only quadratic terms with both inputs of weight minus one contribute to $Q_e$ on this subspace.
  Thus (4.6) has square $Q_e$, is $C_e$-equivariant, and has lifted differential degree one.
  The lifted grading and $C_e$-equivariance descend to the required original graded object over $J . e$.
  Denote its curved pushforward into a surrounding open by the same symbol $M_P$.

#thm([Proposition 4.3.])[
  (Orbit generation).  #emph[The objects $M_P$, for simple $P in sans(E)_e$,
    generate the compact category supported on $J . e$ in an open where it is closed.
    Here “generate” allows finite cones, shifts and summands. The category $sans(E)_e$ is semisimple.]
] <orb:generation>

#proof[
  For a locally free factorization, differentiation of $delta^2 = Q_e$ gives
  $ delta \( partial_v delta \) + \( partial_v delta \) delta = partial_v Q_e . $
  Thus the derivatives of $Q_e$ annihilate the identity up to homotopy.
    Their common zero locus is $ker \( e : V arrow.r V \)$, which consists of highest-weight vectors and lies in
    $V_(gt.eq 0)$. Lemma 16 therefore reduces generation to curved pushforwards from $V_(gt.eq 0)$,
    where the potential is zero.
  On this affine space, finite graded free modules with finite stabilizer-representation labels and their degree
    shifts generate the zero-potential category. To justify this with the nonreductive stabilizer,
    note first that all finite rational $C_e$-modules have a finite filtration with $U_e$-trivial subquotients:
    take unipotent invariants and iterate, retaining $L_e$-stability.
    Rational $U_e$-cohomology has cohomological dimension $dim
    U_e$ and is computed by its finite Lie-cochain complex. The usual equivariant free tests therefore detect
    underlying graded cohomology: tensor by all finite representation labels,
    pass to their union in the regular representation, and then take invariants.
    These operations preserve colimits. The tests are compact and hence generate.
  There is no additional curved object at zero potential invisible to this test.
    After a finite projective replacement, an acyclic folded differential module over the regular polynomial ring
    is absolutely acyclic: resolve its cycles and boundaries by finite projective resolutions and fold the
    resulting bounded exact complexes. Equivariant descent adds only the bounded Lie-cochain complex above.
    Equivalently, the lifted coordinate degrees on $V_(gt.eq 0)$ are nonpositive;
    filtering finite free representatives by generator degree reduces to finite complexes over the degree-zero
    polynomial ring.
  Stabilizing the zero section of the nondegenerate quadratic space $V_(- 1)$ replaces a generator on
    $V_(gt.eq 0)$ by (4.6) with the regular Clifford module. In coordinates this is the Koszul differential for
    $x_(- 1) = 0$, together with its Clifford partner; their square is $Q_e \( x_(- 1) \)$.
    The normal coordinates have lifted degree one, so the Koszul shifts put the coefficient module in lifted
    degree zero. Tensoring by $L_e$-representations and allowing shifts gives all the preceding generators.
  Finally $D_e$ is a finite-dimensional semisimple complex algebra, including when $dim V_(- 1)$ is odd.
    A $D_e$-linear splitting of any short exact sequence in $sans(E)_e$ can be averaged over a compact form of the
    reductive group $L_e$. Conjugation preserves $D_e$-linearity,
    so the averaged splitting is also $L_e$-equivariant. This proves semisimplicity,
    including the finite component group, and reduces the generating list to its simple objects. ◻
]

=== 4.3 Actual extensions with Weil structures <actual-extensions-with-weil-structures>

#thm([Proposition 4.4.])[
  (Compact orbit-closure lifts).  #emph[Every $M_P$ is the restriction of a compact object with $z$-support in
    $overline(J . e)$. If $P$ has a compatible locally finite cyclic structure,
    the extension can be given that structure. For a simple label fixed by Frobenius,
    a structure may be chosen whose triple-translated coefficient eigenvalues have modulus one.
    The same assertions hold for a power of Frobenius, for a finite cyclic list of labels,
    and after tensoring $P$ by any finite-dimensional $L_e$-representation with compatible cyclic structure,
    placed in lifted degree zero. Inverse structures are available for opposite category classes.]
] <orb:weil-lifts>

#proof[
  Let $P_e = J_(gt.eq 0)$ be the subgroup of elements for which $lim_(t arrow.r 0) lambda \( t \) g
    lambda \( t \)^(- 1)$ exists, and put $J_0 = Z_J \( lambda \)$. The Jacobson–Morozov incidence map is
  #[#set math.equation(numbering: n => "(4.7)")
   $ pi : J times^(P_e) frak(j)_(gt.eq 2) arrow.r overline(J . e) \,
     wide \[ g \, z \] mapsto "Ad" \( g \) z . $ <orb:incidence>]
  Its connected version is the resolution in [22] Section 2.3; the following argument records the properties,
    including disconnected groups, that we use. The $frak(s l)_2$ decomposition gives
    $\[ frak(j)_(gt.eq 0) \, e \] = frak(j)_(gt.eq 2)$. Hence $P_e^compose .
    e$ is open dense in $frak(j)_(gt.eq 2)$. Every component of $P_e$ preserves this unique open
    $P_e^compose$-orbit, so $P_e . e = P_e^compose . e$. The centralizer decomposition in (4.3) gives $J^e subset
    P_e$. Consequently the open part of the source of (4.7) is $J times^(P_e) \( P_e . e \) = J \/ J^e$,
    mapped isomorphically to $J . e$. The entire source is equidimensional of dimension $dim \( J \/ J^e \)$.
    Its complementary closed subset has smaller dimension and has $J$-invariant image,
    so that image cannot meet $J . e$. Thus this is the whole inverse image of the orbit.
    Finally $J \/ P_e$ is a finite disjoint union of flag varieties;
    the incidence space is closed in $\( J \/ P_e \) times frak(j)$.
    The map is therefore proper and its image is $overline(J . e)$.
  The degree-two component of this construction uses the open orbit $J_0 . e subset frak(j)_2$,
    whose stabilizer is $L_e$. Over that open orbit the module $P$ gives an equivariant coherent module for the
    family of Clifford algebras of
  $ Q_z \|_(V_(- 1)) \, wide z in frak(j)_2 . $
  This Clifford algebra is finite as a module over $cal(O)_(frak(j)_2)$,
    also where the quadratic form degenerates. Extend the module coherently over $frak(j)_2$ as follows.
    Its quasi-coherent direct image from the open orbit is a rational $J_0$-module.
    Choose finitely many module generators over that open, enlarge them to a finite-dimensional equivariant space,
    and take their span under the finite Clifford algebra and the polynomial ring.
    This is a coherent equivariant submodule whose restriction is the original family.
    More explicitly, let $t$ act on this coefficient family through the central element $lambda \( t^(- 1) \) in
    J_0$. It sends $z mapsto t^(- 2) z$ and $c_z \( w \) mapsto c_(t^(- 2) z) \( t w \)$.
    With the original $x$-points fixed, $c_z \( x_(- 1) \)$ consequently has degree one.
    At $t = - 1$ its coefficient parity is precisely $lambda \( - 1 \)$.
    Thus equivariant extension also preserves the required original grading.
  Inflate this extension along $frak(j)_(gt.eq 2) arrow.r frak(j)_2$ and tensor it with $cal(O)_(V_(gt.eq - 1))$.
    The differential $c \( x_(- 1) \)$ has square $W \( x \, z \)$ on this locus:
    a term pairing $z_k$ with $x_i \, x_j$ requires $k + i + j = 0$, with $k gt.eq 2$ and $i \, j gt.eq - 1$,
    and hence $k = 2$, $i = j = - 1$. The construction is $P_e$-equivariant because its unipotent radical acts
    trivially on the two indicated associated graded quotients. Induction to $J$ and proper pushforward from
  $ J times^(P_e) \( V_(gt.eq - 1) times frak(j)_(gt.eq 2) \) arrow.r V times frak(j) $
  give the required coherent factorization. This map is proper by the same closed-incidence argument.
    Over $J . e$ its restriction is exactly $M_P$, so this is an actual lift, with the asserted support.
  For completeness, the equivariance in this extension can include a chosen cyclic operator,
    rather than merely its action on isomorphism classes. Take the Zariski closure of the group generated by the
    algebraic equivariance data, the grading, and that operator;
    if necessary take a common algebraic cover acting on the coefficient module.
    Rational direct image is the union of finite-dimensional representations of this group.
    Thus the finite generating space in the preceding paragraph can be chosen stable under the operator,
    and the entire extension and proper pushforward retain its structure.
  Here is also why the pure coefficient choices exist. Use the finite-type normalizer of the linear and framed
    data in Lemma 14; the action is an algebraic action of this finite-type group,
    not of an abstract automorphism group of a torus. For a fixed simple equivariant Clifford module,
    pairs consisting of a data automorphism and an implementing linear map form an algebraic group over the
    stabilizer of its isomorphism class. Its kernel is the scalars, by Schur’s Lemma.
    Given a lift $\( u \, A \)$, take its semisimple Jordan part and the diagonalizable algebraic group it
    generates. Characterwise polar decomposition in this group separates its positive-real and unit-modulus parts.
    The positive-real part projects to the identity: the eigenvalues of $u$ on the faithful normalized data
    realization have modulus one. The scalar-kernel assertion therefore forces this positive-real part to be
    $\( 1 \, c I \)$ for some $c > 0$. All eigenvalues of $A$ have the same modulus $c$,
    and $c^(- 1) A$ is the required pure implementing map. The Jordan unipotent part supplies the compatible
    commuting unipotent lift.
  The label orbits are finite as well. Encode compatible Clifford and $L_e$ actions as representations of the
    reductive group $D_e^times times.r L_e$. A simple compatible module is irreducible for this group,
    because the units linearly span $D_e$. A connected algebraic family of automorphisms preserves each
    irreducible class: on a fixed maximal compact group, its multiplicities against irreducible characters are
    continuous integer-valued functions of the family, hence constant.
    The compact group is Zariski dense, so this identifies the algebraic representations.
    Only the finite component group of the data normalizer can therefore permute labels.
    The preceding choices apply to a power, or around a finite orbit; a label fixed by Frobenius needs no power.
    Undoing the triple translation gives the original locally finite Weil structure.
    Tensor products and inversion of the implementing maps preserve the extension construction,
    proving the remaining assertions. ◻
]

=== 4.4 Morphisms, parity, and contracting weights <morphisms-parity-and-contracting-weights>

#thm([Proposition 4.5.])[
  (The orbit Hom calculation).  #emph[For $P \, P' in sans(E)_e$,
    the Hom complex between the orbit generators has a finite equivariant calculation with Euler terms
#[#set math.equation(numbering: n => "(4.8)")
 $
   [bb(C) \[ ker \( e : V arrow.r V \) \] ⊗ "Hom"_(D_e) \( P \, P' \) ⊗ Lambda^bullet \( N_e \[ - 1 \] \) ⊗
   Lambda^bullet \( "Lie" \( U_e \)^(*) \[ - 1 \] \)]^(L_e) . $ <orb:hom-euler>]

 Here the coefficient factor has lifted degree zero; the shifts in the normal and Lie factors add one to the
   degrees in (4.4). The formula is an equality of alternating equivariant characters,
   and a finite-filtration calculation bounding weights, rather than an assertion that the Hom complex splits as
   the displayed tensor product.]
  #emph[For pure coefficient normalizations, all nonconstant terms have strictly negative absolute $S_e$-weight.
    The weight-zero cohomology is
#[#set math.equation(numbering: n => "(4.9)")
 $ H^bullet "Hom" \( M_P \, M_(P') \)_(upright("wt") = 0) = "Hom"_(D_e \, L_e) \( P \, P' \) \[ 0 \] \,
   $ <orb:weight-zero-hom>]

 with ordinary composition. Before the finite invariant calculation,
   weight pieces are finite-dimensional and their dimensions grow at most polynomially over bounded-length weight
   intervals. In particular, the character sums in (4.8) are absolutely convergent on every normalized compact
   $L_e$-coset, uniformly on that coset.]
] <orb:hom-calculation>

#proof[
  Take an $L_e$-stable lowest-weight slice transverse to $J . e$ in the $z$-space.
    Its tangent is $N_e$; moving this slice by $J$ is smooth near $e$,
    so it computes the equivariant transverse fiber of Hom. Then take $U_e$-cochains and finally exact $L_e$-invariants.
  The second input is pushed forward from the equations $n = 0$ in the slice and $x_(< - 1) = 0$.
    A finite locally free stabilization of the first input is obtained by tensoring its Clifford differential with
    the Koszul factorizations of these equations and their potential partners.
    Indeed the difference between the full potential and $Q_e \( x_(- 1) \)$ is a sum of an equation times its
    partner. The terms in $n$ have quadratic partners in $x$; the terms $x_i$ for $i < -
    1$ have partners of grade $- i - 2 gt.eq 0$. This explicit correction makes the square of the differential
    equal to the full potential. Hom into the second pushforward sets the normal equations to zero.
    The $z$-normal Koszul generators remain as exterior #emph[normal tangent] factors $Lambda \( N_e \[ - 1 \] \)$.
  Filter finitely by those exterior generators. The remaining $x$-Koszul differential pairs every grade $i < -
    1$ with its grade $- i - 2$ partner. On an irreducible $frak(s l)_2$ summand these pairings are nondegenerate
    except for its highest-weight vector. Thus their cohomology is precisely $bb(C) \[ ker e \]$.
    The terms involving $n$ may give further differentials in this finite filtration, but do not change its Euler terms.
  It remains to calculate the nondegenerate quadratic part.
    On $bb(C) \[ V_(- 1) \] ⊗ "Hom" \( P \, P' \)$ its differential is the sum of the coordinate functions times
    the Clifford supercommutators. Choose an orthonormal Clifford basis, and on a homogeneous coefficient map $a$ put
  $ L_i \( a \) = c'_i a \, wide R_i \( a \) = \( - 1 \)^(\| a \|) a c_i \, wide T_i = L_i - R_i \, wide K_i = 1 /
    4 \( L_i + R_i \) . $
  Clifford anticommutation gives
  $ { T_i \, T_j } = { K_i \, K_j } = 0 \, wide { T_i \, K_j } = delta_(i j) . $
  Thus the $K_i$ are contracting partners for the exterior operators $T_i$.
    The differential $sum_i x_i T_i$ is the polynomial Koszul calculation:
    its cohomology is the constant common kernel of the $T_i$, namely the Clifford super-intertwiners,
    in lifted degree zero. All positive polynomial degrees are acyclic.
    This calculation works in even and odd Clifford dimensions alike.
  We explain its parity before taking invariants. A homogeneous map $a : P arrow.r
    P'$ of original parity $p$ is a super-intertwiner precisely when
  $ a c \( v \) = \( - 1 \)^p c' \( v \) a . $
  The map $a mapsto a gamma_P^p$ identifies that vector space with ordinary Clifford intertwiners.
    It respects the $L_e$-action and the triple-preserving cyclic action,
    because $lambda \( - 1 \)$ is central in $L_e$ and is fixed by that action.
    Only a representation-space identification is claimed before taking invariants.
    An $L_e$-invariant map commutes with $gamma_P \, gamma_(P')$,
    so an invariant super-intertwiner has even parity. After invariants the identification therefore has its
    ordinary composition and is exactly $"Hom"_(D_e \, L_e) \( P \, P' \)$.
    This proves that no odd Clifford morphism is being silently retained in degree zero.
  Finally rational $U_e$-cohomology is computed by its finite Chevalley–Eilenberg complex,
    adding the terms $Lambda \( "Lie" \( U_e \)^(*) \[ - 1 \] \)$,
    with their Lie differential and action on the other terms.
    This proves (4.8) as an alternating character identity with a finite cohomological filtration.
  The weight assertions now follow factor by factor. Functions on $ker e$ have weights $- 1 - i lt.eq -
    1$ because its $h$-weights satisfy $i gt.eq 0$. The normal factors have weights $- 2 + i lt.eq -
    2$ because their $h$-weights satisfy $i lt.eq 0$. Nontrivial Lie-cochain factors have weights $- i < 0$.
    The pure constant coefficient Hom has weight zero. Thus nothing of any other degree has weight zero,
    and no differential can enter or leave its invariant subspace. This proves (4.9).
  There are finitely many polynomial generators, all with strictly negative weights,
    and finitely many exterior and coefficient factors. Their monomial counts in bounded-length weight intervals
    have polynomial growth. Multiplication by the geometric decay of the absolute eigenvalues makes their traces
    summable. The same estimates hold uniformly with any compact $L_e$-twist by Lemma 14.
    Unipotent parts may be retained: trace depends on eigenvalues with multiplicity,
    not on an assertion that those operators are unitary. ◻
]

== 5 Frobenius traces and compact Weil classes <tr:section>

This section proves the concentration and spanning assertions needed for the image definition of $cal(F)_Y$.
  They will also permit every function in the second variable of the automorphic pairing to be represented by a
  finite combination of compact spectral tests. The argument has three parts:
  remove invariant-base support on the trace, contract the nonconstant part of an orbit trace,
  and use finite supported localization to assemble the result.

=== 5.1 The invariant-base projector and actual supported lifts <the-invariant-base-projector-and-actual-supported-lifts>

#thm([Lemma 5.1.])[
  (Invariant support on traces).  #emph[For every Frobenius-stable conical $z$-support bound $Omega$,
    inclusion induces an isomorphism
#[#set math.equation(numbering: n => "(5.1)")
 $ "Tr" \( Phi \, "Ind" cal(B)_(Omega \, 0) \) arrow.r^(thick tilde.op thick)
   "Tr" \( Phi \, "Ind" cal(B)_Omega \) . $ <tr:remove-completion>]

 A compact Weil object on the right has a compact Weil lift on the left whose trace class maps to a nonzero scalar
   multiple of its class. Both statements hold for the compact opposite categories.
   Moreover, for Hom pairings of two such lifts, the finite Koszul construction multiplies each orbit contribution
   by a constant nonzero factor, independent of the compact stabilizer variable.]
] <tr:invariant-support>

#proof[
  The ideal $I subset R^J$ of the invariant origin is generated by a finite Frobenius-stable homogeneous space $U$
    of positive-degree invariant polynomials. To obtain $U$, choose homogeneous algebra generators and take their
    Frobenius spans inside the finitely many finite-dimensional polynomial-degree spaces involved.
    The inverse Hom action has strictly negative weights on $U$ by Lemma 3.5;
    its forward inverse has strictly positive weights. In either convention the appropriate transport operator
    $F_U$ has no eigenvalue one. Thus $1 - F_U$ is invertible, even when $F_U$ has Jordan blocks.
  For a central scalar $a$, its two actions on a twisted Hochschild complex, one transported by Frobenius,
    are chain homotopic. This is the elementary homotopy moving $a$ once around the bar.
    Applying it simultaneously to a basis of $U$ and multiplying by $\( 1 - F_U \)^(- 1)$ shows that every
    generator of $I$ acts trivially on trace cohomology. Equivalently,
    regard the complex as a module over the polynomial algebra $"Sym" U$ mapping to $R^J$;
    its cohomology is supported at the origin. In particular it is $I$-torsion,
    a statement about the ordinary complex rather than about its completion.
  Let $i$ be inclusion of the support category and let $Gamma_I$ be its continuous colocalization.
    On the ambient category, $i Gamma_I$ is tensor product with the scalar local-cohomology complex
    $"RΓ"_I \( R \)$. The inclusion preserves compact objects.
    Cyclicity of categorical trace, followed by continuity in its coefficient bimodule,
    therefore identifies the map in (5.1) with
  $ "RΓ"_I "Tr" \( Phi \, "Ind" cal(B)_Omega \) arrow.r "Tr" \( Phi \, "Ind" cal(B)_Omega \) . $
  One can compute this equality directly with the finite Koszul complexes on powers of the chosen equations and
    their filtered union. It is an isomorphism because the target cohomology is $I$-torsion.
    This proves the trace assertion without replacing Hochschild chains by a completed bar complex.
  To lift an actual class, let $M$ be a compact Weil object and let $K \( U \)$ be the finite equivariant Koszul
    complex on the map $U ⊗ R arrow.r R$. Then $M ⊗ K \( U \)$ is compact, has ordinary support over $I = 0$,
    retains its $z$-support, and has the induced Weil structure.
    The finite exterior filtration and additivity of trace give
  #[#set math.equation(numbering: n => "(5.2)")
   $ \[ M ⊗ K \( U \) \] = (sum_j \( - 1 \)^j "Tr" \( F_U divides Lambda^j U \)) \[ M \] =
     det \( 1 - F_U divides U \) thin \[ M \] . $ <tr:koszul-factor>]
  The determinant is nonzero. The notation $F_U$ in this formula means the coefficient transport on the chosen
    exterior terms; passing to inverse Weil structures replaces it by its inverse,
    which still has no eigenvalue one. Dividing the class by this nonzero complex scalar gives any desired lift in
    the trace vector space, with the representative itself still an actual compact Weil object.
  The same finite filtration proves the pairing statement. In a Hom from one Koszul lift to another,
    its associated terms have coefficient factor $"Hom" \( Lambda^a U \, Lambda^b U \)$,
    with the dual transport on the contravariant coefficient and the original transport on the covariant one.
    Its alternating character is the product of the corresponding two nonzero determinants.
    Since the equations are $J$-invariant, these are constant functions of every compact $L_e$-variable.
    Taking sections with support in an orbit commutes with this finite filtration.
    Thus the same factor multiplies each orbit contribution, not merely the sum of all contributions.
    This also proves the assertions for opposite categories and their inverse structures. ◻
]

=== 5.2 An algebraic contraction of the twisted bar complex <an-algebraic-contraction-of-the-twisted-bar-complex>

We first identify the original $Phi$-graph with the transported model,
  then use the contracting inverse action $S$ on that same graph.
  On a finite stable list of models let $pi$ be the permutation induced by Frobenius and choose $alpha_i :
  Phi M_i arrow.r^tilde.op M_(pi i)$. These identifications give a functor $Psi$ on the chosen models.
  For arrows $a : M_i arrow.r M_j$ and $b : M_(pi i) arrow.r M_(pi j)$, its forward transport and inverse are

#[#set math.equation(numbering: n => "(5.3)")
 $ T \( a \) = Psi \( a \) & = alpha_j Phi \( a \) alpha_i^(- 1) \,\
S \( b \) = T^(- 1) \( b \) & = Phi^(- 1) \( alpha_j^(- 1) b alpha_i \) . $ <tr:forward-inverse>]

The action $S$ is the contracting Hom action of Lemma 3.5.

To match trace classes $M arrow.r Phi M$, use the left-twisted graph $G_Phi \( i \, j \) =
  "Hom" \( M_i \, Phi M_j \)$, whose left action is composition through $Phi$. The maps

#[#set math.equation(numbering: n => "(5.4)")
 $ theta_(i j) : G_Phi \( i \, j \) arrow.r G_Psi \( i \, j \) \, wide m mapsto alpha_j m \, wide
   G_Psi \( i \, j \) = "Hom" \( M_i \, M_(pi j) \) $ <tr:graph-identification>]

identify the graph bimodules: for composable arrows, $theta \( Phi \( a \) m b \) = Psi \( a \) theta \( m \) b$,
  with the appropriate source and target indices. Transport the entire twisted bar construction through this
  identification. In the $G_Psi$ coordinates simultaneous forward transport is $Psi$ on every factor.
  On the original graph coefficient it is instead

#[#set math.equation(numbering: n => "(5.5)")
 $ T_G \( m \) = Phi \( alpha_j \) Phi \( m \) alpha_i^(- 1) in G_Phi \( pi i \, pi j \) \, wide
   theta_(pi i \, pi j) \( T_G \( m \) \) = Psi \( theta_(i j) \( m \) \) . $ <tr:graph-transport>]

For example, for one algebra with automorphism $phi.alt$ and $psi = "Ad"_alpha phi.alt$,
  these formulas are $theta \( m \) = alpha m$ and $T_G \( m \) =
  phi.alt \( alpha \) phi.alt \( m \) alpha^(- 1)$. Thus the original $Phi$-trace is retained,
  with its graph coefficient canonically identified. Ordinary-arrow transport cannot be applied to the raw graph
  factor without this identification.

#thm([Lemma 5.2.])[
  (Locally finite contraction).  #emph[Let a small generating differential graded category with an autoequivalence
    be modeled in complexes of locally finite cyclic representations.
    Suppose, after finite cyclic permutations of its labels and pure choices of their structures,
    its morphism cohomology has nonpositive absolute $S$-weights; composition adds weights.
    Suppose its weight-zero morphism cohomology is concentrated in degree zero and its additive idempotent
    completion is semisimple, with endomorphism algebra $bb(C)$ for every simple object.
    Then its twisted trace is the twisted trace of that split semisimple category.
    It is concentrated in degree zero, with one basis line for each fixed simple label.
    Nontrivially permuted simple labels contribute zero.]
] <tr:bar-contraction>

#proof[
  Take the sum of the nonpositive-weight subcomplexes in every morphism complex.
    This is a differential graded subcategory: identities have weight zero, the differential preserves weights,
    and composition adds them. It is quasi-equivalent to the original category because the excluded weight pieces
    have zero cohomology. Locally finite semisimple-weight decomposition is exact,
    so this assertion also holds for unbounded morphism complexes.
  Use the direct-sum realization of its twisted cyclic bar complex.
    Every chain belongs to a finite sum of finite-dimensional cyclic subrepresentations.
    On a finite permutation-stable list of labels, take a common power fixing the labels;
    divided absolute weights for that power define the same nonpositive grading on the bar terms.
    Only the weights are read using this power: the functor and graph whose trace is computed remain $Phi$ and
    $G_Phi$. In the identified left-graph convention, cyclic rotation has the one-algebra formula
    $t_n \( a_0 divides dots.h.c divides a_n \) = \( Psi \( a_n \) divides a_0 divides dots.h.c divides a_(n -
    1) \)$, with the usual Koszul signs for graded factors. Its $\( n + 1 \)$-fold iterate applies $Psi$ to every
    factor. The usual paracyclic homotopy therefore gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ d H + H d = 1 - T . $ <tr:paracyclic>]
  Here $d$ is the total Hochschild and internal differential,
    and the operator $T$ is simultaneous forward transport in the identified $G_Psi$ coordinates,
    or equivalently the ordinary-arrow transport and (5.5) on the original graph.
    The identity can be obtained by inserting the unit and summing the cyclic rotations:
    consecutive faces cancel in pairs, and the two remaining faces are the identity and a full rotation.
    Transporting this identity through (5.4) gives the asserted identity on the original $Phi$-twisted bar.
    In degree zero the one-algebra convention makes it explicit:
    with $d \( m divides a \) = m a - phi.alt \( a \) m$, the term $H_0 \( m \) =
    alpha^(- 1) divides alpha m$ satisfies $d H_0 \( m \) = m - T_G \( m \)$.
  Since $T$ commutes with $d$, the operator
  #[#set math.equation(numbering: n => "(5.7)")
   $ H_(upright("inv")) = - T^(- 1) H wide upright("satisfies") wide d H_(upright("inv")) + H_(upright("inv")) d =
     1 - S . $ <tr:inverse-homotopy>]
  On every strictly negative-weight block, $1 - S$ is invertible. This inverse is algebraic:
    on each finite-dimensional cyclic subrepresentation it is a polynomial in $S$, by its minimal polynomial,
    and the resulting inverses agree on inclusions. There is no infinite geometric series of chains.
    The homotopy $\( 1 - S \)^(- 1) H_(upright("inv"))$ contracts that block.
    The homotopy preserves total weight, and the same conclusion holds when a power is used to read the weights,
    since every eigenvalue of $S$ then has modulus strictly less than one.
  Only weight zero remains. As every arrow has nonpositive weight,
    a weight-zero bar term has only weight-zero arrows. Hence this is exactly the bar complex of the weight-zero
    category. Its morphism cohomology is in degree zero; the canonical differential graded truncation gives a
    zigzag of quasi-equivalences to its degree-zero cohomology category,
    compatibly with the cyclic action and composition. A split semisimple category has the same trace as its full
    subcategory of simple objects. By the scalar-endomorphism hypothesis,
    its only nonzero morphisms are scalar endomorphisms. The twisted bar therefore gives $bb(C)$ in degree zero
    for a fixed simple and zero for a permuted block.
  Finally, any chain uses only finitely many labels. Enlarge them to a finite permutation-stable list and apply
    the preceding argument. Filtered union gives the assertion for all labels.
    All realizations are direct sums; neither an infinite product nor convergence of an infinite Hochschild
    spectral sequence has been used. ◻
]

#thm([Proposition 5.3.])[
  (Trace of an orbit).  #emph[The trace on the supported category of a Frobenius-stable nilpotent orbit is
    concentrated in degree zero. A basis is given by the classes of $M_P$ for Frobenius-fixed simple $P in
    sans(E)_e$, with chosen pure normalized structures. Every basis class lifts to an actual compact Weil object
    supported on the orbit closure, and also to one with invariant null-fiber support up to a nonzero scalar.
    The same conclusions hold for the compact opposite category with simultaneous Frobenius.]
] <tr:orbit-trace>

#proof[
  By Proposition 17, the full subcategory on the simple labels generates the supported category;
    Morita invariance permits computing its trace on this generating subcategory.
    We first check the local finiteness required by Lemma 21,
    since numerical weight bounds on cohomology alone would not suffice.
  All models used in Section 4 are algebraic equivariant models with finite-dimensional starting representation
    data. Keep the grading internal until direct-sum totalization.
    For a finite cyclic list of labels, take a common finite-type algebraic cover $H$ of the equivariance and
    cyclic chain-map data, acting on the chosen objects and the invariant quasi-compact separated ambient open
    $U$. Polynomial functions, finite Koszul resolutions, equivariant restriction,
    and proper pushforward are defined in rational representations of this group.
  One can compute derived sections without choosing a transporter-stable affine cover.
    Equivariant derived pushforward along $\[ U \/ H \] arrow.r
    B H$ produces complexes of rational $H$-representations. Flat base change along $"pt" arrow.r
    B H$ recovers ordinary derived sections on $U$, and the lax monoidal pushforward supplies their composition
    maps [11] §1.3.10, Corollary 1.4.5, and §§6.4.3–6.4.6. Here differential Hom is an ordinary square-zero
    complex because the two curvature terms cancel. Functorial bar–cobar rectification uses direct sums of finite
    tensor words, so it stays in rational representations, preserves the cyclic action,
    and gives a compatible differential graded model with strict composition [19] Proposition 2.1 and §§4.3, 4.8,
    5.2. Restriction to the algebraic closure of the cyclic operator makes the action on this model locally
    finite. Stabilizer invariants are computed by the finite Lie-cochain complex followed by exact reductive
    invariants. These bounded constructions commute with the direct-sum folding of the grading.
    Thus the locally finite cyclic actions are defined on morphism complexes with their composition,
    and decomposition by the characters of the semisimple part gives the weight subcomplexes used in the
    contraction lemma.
  Proposition 18 provides finite cyclic orbits of the labels and consistently pure implementing maps,
    including when a power is required to fix a label. On taking invariants,
    the triple translation is by a group element and does not change the actual arrow action $S$.
    Proposition 19 therefore says that this model has no positive-weight cohomology and that its zero-weight
    category is exactly the semisimple category $sans(E)_e$. Its simple objects have scalar endomorphisms:
    each is a finite-dimensional complex module, so Schur’s Lemma applies over the algebraically closed field
    $bb(C)$. Lemma 21 proves concentration and the stated basis.
    The incidence construction of Proposition 18 supplies its actual compact orbit-closure representatives;
    Lemma 20 supplies the completed representatives.
  For the opposite category use the same object models, with reversed arrows and inverse object structures.
    Its simultaneous forward action on a reversed arrow is the forward action on the underlying original arrow;
    its inverse is consequently the same contracting $S$ on that underlying complex.
    The weight calculation and paracyclic identity are unchanged.
    In particular, this argument uses the autoequivalence $Phi^(upright("op"))$ of the opposite category,
    not the inverse autoequivalence of the original category.
    It proves the same spanning assertion with actual inverse Weil structures. ◻
]

=== 5.3 Finite support filtrations and the full function space <finite-support-filtrations-and-the-full-function-space>

#thm([Theorem 5.4.])[
  (Concentration, injection, and Weil spanning).  #emph[On a fixed retained spectral component,
    the trace of every closed invariant nilpotent support category is concentrated in degree zero.
    If $Omega' subset Omega$ are such support bounds, then
#[#set math.equation(numbering: n => "(5.8)")
 $ H^0 "Tr" \( Phi \, "Ind" cal(B)_(Omega' \, 0) \) arrow.r
   H^0 "Tr" \( Phi \, "Ind" cal(B)_(Omega \, 0) \) $ <tr:support-injection>]

 is injective. A finite filtration by invariant unions of orbits has the orbit traces as its actual successive
   quotients. Every trace class is a finite linear combination of classes of compact objects with Weil structures;
   those objects can be chosen with support in the prescribed bound. All assertions hold on the compact opposite side.]
  #emph[After assembling retained components, these statements apply to $cal(C)_Y$ and $cal(C)$.
    In particular, the image defining $cal(F)_Y cal(A)_(overline(bb(Q))_ell)$ is the injective image of the
    supported trace, and every function in $cal(A)_(overline(bb(Q))_ell)$ and every vector in $cal(F)_Y
    cal(A)_(overline(bb(Q))_ell)$ is a finite linear combination of the corresponding actual compact Weil trace
    functions. The analogous statement supplies all tests through the nonstandard self-duality of Theorem 6.]
] <tr:spanning>

#proof[
  Choose a finite filtration of the nilpotent support by closed invariant unions of $J$-orbits,
    grouping Frobenius permutations into stable strata. It exists because there are finitely many nilpotent orbits
    and Frobenius preserves their closure order. At each step, Lemma 16 gives a compactly generated localization.
    Twisted Hochschild homology is localizing, so it gives a cofiber sequence of traces;
    this is the trace-localization formalism of [17] Theorem 3.4 and Proposition 5.4,
    applied to the actual Frobenius-compatible localization just constructed.
    Disjoint orbits closed in the corresponding open have orthogonal supported categories.
    If Frobenius permutes such summands without a fixed summand, their twisted trace is zero:
    in the bar model, nonzero chains would have to begin and end in the same summand,
    while the graph coefficient ends in its Frobenius translate.
    Every fixed orbit has the degree-zero trace of Proposition 22.
  Induction up this finite filtration proves concentration in degree zero.
    Each cofiber sequence is therefore a short exact sequence on $H^0$.
    More generally, apply the same argument to the finite orbit filtration of the complement of $Omega'$ in
    $Omega$. Its trace is also concentrated in degree zero, so the localization sequence starts
  $ 0 arrow.r H^0 "Tr" \( Phi \, cal(B)_(Omega' \, 0) \) arrow.r H^0 "Tr" \( Phi \, cal(B)_(Omega \, 0) \) arrow.r
    H^0 "Tr" \( Phi \, cal(B)_(Omega \, 0) \/ cal(B)_(Omega' \, 0) \) arrow.r 0 \, $
  where taking ind-completions in the trace notation is understood.
    This proves (5.8) and identifies the successive quotients with the computed orbit traces.
    It does not infer injectivity from concentration of the full category alone.
  At an induction step, each quotient basis class lifts by the compact incidence construction and the finite
    invariant Koszul construction. Subtract a finite linear combination of these lifts from a given class;
    the remainder lies in the preceding supported trace. The induction terminates after finitely many strata.
    Thus every class is spanned by actual compact Weil classes with the required closed support.
    This argument also proves spanning on the opposite side; its localization sequences and orbit lifts have
    already been checked in Proposition 22.
  For the retained union of components, compact objects involve only finitely many components and there are no
    morphisms between distinct components. The same bar argument shows
  #[#set math.equation(numbering: n => "(5.9)")
   $ "Tr" \( Phi \, cal(C) \) = xor.big_(Z_a subset Z upright(" retained")\
Phi Z_a = Z_a) "Tr" \( Phi \, cal(C) \|_(Z_a) \) \, $ <tr:component-sum>]
  and likewise for supported categories and their compact opposites.
    A component permuted nontrivially contributes zero even if a power fixes it.
    The direct sum in (5.9) is essential: no vector acquires infinitely many component contributions.
  The Frobenius-compatible restricted equivalence of Theorem 3 transports these results to the categories in the
    problem, retaining exactly the prescribed prime union. The trace/functions isomorphism and ordinary compact
    local-term compatibility of Theorem 5 take each compact Weil class to its actual finitely supported trace
    function. This identifies the supported trace injection with the image used to define $cal(F)_Y
    cal(A)_(overline(bb(Q))_ell)$. Finally the simultaneous-Frobenius nonstandard duality identifies the trace on
    the compact opposite category with the full space of tests.
    The opposite spanning statement therefore supplies every such test by a finite linear combination of the
    constructed classes. All calculations were performed after an arbitrary coefficient isomorphism with $bb(C)$;
    concentration, injections, and finite spanning transport back along that isomorphism. ◻
]

== 6 Hecke matrix coefficients and support detection <meas:section>

Fix an abstract coefficient isomorphism $overline(bb(Q))_ell tilde.eq bb(C)$ and a closed point $v in
  X$ of degree $d$. Put $r = q^d$. We use the compact sets $B_o$ and the bilinear pairing $\[ - \, - \]$ of (1.4)
  and (1.5). Write

$ B = union.big_(o subset hat(cal(N))) B_o \, wide B_Y = union.big_(o subset Y) B_o . $

There are finitely many ambient nilpotent orbits. Lemma 31, whose proof is independent of this section,
  says that the $B_o$ are disjoint compact sets and that representation characters are uniformly dense in
  $C \( B \)$. We will use this elementary fact for uniqueness and for separating different orbit contributions.

#thm([Theorem 6.1.])[
  (Bilinear support detector).  #emph[For every $f \, g in cal(A)_(bb(C))$ there is a unique finite complex Borel
    measure $nu_(f \, g)$ on $B$ such that, for every finite-dimensional representation $D$ of $hat(G)$,
#[#set math.equation(numbering: n => "(6.1)")
 $ \[ T_D f \, g \] = integral_B chi_D thin d nu_(f \, g) . $ <meas:moments>]

 For every closed invariant subset $Y subset hat(cal(N))$,
#[#set math.equation(numbering: n => "(6.2)")
 $ f in cal(F)_Y cal(A)_(bb(C)) quad arrow.l.r.double quad "supp" \( nu_(f \, g) \) subset B_Y quad
   upright("for every ") g in cal(A)_(bb(C)) . $ <meas:criterion>]

]
] <meas:detector>

The theorem concerns ordinary finitely supported functions.
  In its proof, infinite sums occur only in auxiliary character calculations on compact groups.
  Every automorphic input and test remains a finite linear combination of compact Weil classes.

=== 6.1 The bilinear Hom formula <the-bilinear-hom-formula>

We first identify exactly which scalar trace is being calculated.
  Use the nonstandard self-duality and compactness of Theorem 6 [4] Theorem 3.2.2 and Appendix A.1.
  On the automorphic side its evaluation is

$ \( cal(F) \, cal(G) \) mapsto Gamma_c #scale(x: 120%, y: 120%)[\(] "Bun"_G \,
  cal(F) ⊗^(*) cal(G) #scale(x: 120%, y: 120%)[\)] . $

On compact objects the categorical dual is the opposite category.
  Simultaneous invariance under $Phi$ identifies its action there with $Phi^(upright("op"))$.
  Thus, on the spectral side, take a covariant class $b : N arrow.r Phi N$ and an opposite-input class $a :
  Phi M arrow.r M$. Evaluation acts on an arrow $h : M arrow.r N$ by

#[#set math.equation(numbering: n => "(6.3)")
 $ S_(M \, N) \( h \) = Phi^(- 1) \( b compose h compose a \) . $ <meas:hom-action>]

The action with a Hecke insertion includes its specified cyclic Weil transport.
  Formula (6.3) is the inverse transported action $S$ of Section 3; it uses the original $Phi$-trace.

#thm([Lemma 6.2.])[
  #emph[Let $N$ and $M$ be compact spectral objects with the structures just specified,
    and let $f_N$ and $g_M$ be their automorphic trace functions,
    where $M$ is transported through the categorical duality. Then
#[#set math.equation(numbering: n => "(6.4)")
 $ \[ T_D f_N \, g_M \] = "str" #h(-0.16667em) (S_(M \, N \, D) \; "RHom" \( M \, cal(E)_(D \, v) ⊗ N \)) .
   $ <meas:hom-function-formula>]

 Here $cal(E)_(D \, v)$ denotes the evaluation insertion at the cyclic tuple above $v$.
   The scalar evaluation complex is perfect. Finite linear combinations of these classes give all inputs and all
   tests in $cal(A)_(bb(C))$. Inputs in $cal(F)_Y cal(A)_(bb(C))$ may be represented by such $N$ with the
   prescribed $Y$-support.]
] <meas:hom-functions>

#proof[
  The compact embedding into ambient sheaves, preservation of compactness by the star tensor product in two
    compact variables, and preservation by the finite Hecke insertion imply that the displayed compact-cohomology
    evaluation is perfect. Compact pushforward to a point preserves compactness;
    its target is the category of complexes of vector spaces,
    whose compact objects are precisely the perfect complexes.
    These are the compactness assertions recorded with the duality input in Section 2.
    They are needed in addition to abstract self-duality.
  The ordinary local-term comparison of Theorem 5 and the sheaf–function dictionary identify the Frobenius trace
    of this evaluation with
  $ sum_(b in "Bun"_G \( upright(bold(F))_q \) \/ tilde.equiv)
    frac(\( T_D f_N \) \( b \) g_M \( b \), \| "Aut" \( b \) \|) . $
  For each fixed Hecke label the correspondences are bounded,
    and the compact inputs have quasi-compact $!$-support. Thus the compact local-term theorem applies to
    precisely this evaluation. Transport through the duality gives (6.3), proving (6.4).
    Finally, Theorem 23 gives actual compact Weil-class spanning on both the covariant and opposite sides,
    and on every closed-support trace image. Combined with the trace–functions isomorphism,
    it proves the last assertions. ◻
]

The duality need not preserve individual spectral components or their support labels.
  We choose $M$ on the Hom side and then obtain its function test by duality.
  Distinct components are orthogonal because their spectral Hom complexes vanish.

=== 6.2 Supported traces on an orbit <supported-traces-on-an-orbit>

Fix a retained Frobenius-stable component and the model of Theorem 12.
  In the curved description, write $W \( x \, z \) = chevron.l z \, mu \( x \) chevron.r$.
  For two compact lifts let $cal(H) = cal(H) #h(-0.16667em) o m \( M \, N \)$ be their differential Hom,
  computed with locally free representatives. Its differential squares to zero.
  Its derived $J$-invariant sections, with the evaluation insertion, compute the right side of (6.4).
  The support of $cal(H)$ lies in the intersection of the two factorization supports:
  where either object vanishes in the local factorization category, the differential Hom is acyclic.

We filter these sections by #emph[local cohomology with supports] in the nilpotent $z$-orbits.
  Ordinary restriction to an orbit would give the wrong answer on boundary strata.
  The following calculation fixes both the normal-direction sign and the convergence issue.

For the motivating use of local cohomology, normal symmetric powers and distributional convergence,
  see Kazhdan–Okounkov [18] Sections 2.6.1–2.6.4, equations (107)–(111).
  The following calculation supplies the supported convergence needed for the present bilinear detector.

#thm([Lemma 6.3.])[
  (Supported convergence).  #emph[Let $O = J . e$ be a stable nilpotent orbit,
    closed in an invariant open subset of $frak(j)$. The contribution with support on $O$ to the Hom calculation
    has an absolutely convergent alternating character on the compact transporter coset of $L_e$.
    Convergence is uniform on that coset, also after any fixed finite-dimensional evaluation insertion.
    These characters are additive through the finite orbit filtration and compute the ordinary supertrace of the
    final perfect evaluation complex.]
] <meas:supported-convergence>

#proof[
  Let $i : O arrow.r.hook U subset frak(j)$ be the closed immersion and $c = "codim"_U \( O \)$.
    It is a regular immersion, with normal bundle whose fiber at $e$ is $N_e = frak(j) \/ \[ frak(j) \, e \]$.
    If $I$ is its ideal, local cohomology is the filtered colimit
  $ R Gamma_O \( cal(H) \) = "colim"_n thin R cal(H) #h(-0.16667em) o m \( cal(O)_U \/ I^(n + 1) \, cal(H) \) . $
  The successive derived cofibers of this filtration are
  #[#set math.equation(numbering: n => "(6.5)")
   $ i_(*) (L i^(*) cal(H) ⊗ "Sym"^n N ⊗ det N \[ - c \]) \, wide n gt.eq 0 . $ <meas:normal-filtration>]
  Indeed, $I^n \/ I^(n + 1) = "Sym"^n N^(*)$, while regular-immersion duality gives $i^(!) cal(H) =
    L i^(*) cal(H) ⊗ det N \[ - c \]$. One may verify the same formula directly by the regular Koszul resolution.
    Each such resolution is bounded before folding the grading,
    so it also applies to the locally free differential Hom used here.
    In particular the determinant in (6.5) is the #emph[normal] determinant.
  For example, a degree-two coordinate $z$ with $S \( z \) = q z$ gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ H_(\( z \))^1 bb(C) \[ z \] = xor.big_(m gt.eq 1) bb(C) z^(- m) \, wide S \( z^(- m) \) =
     q^(- m) z^(- m) . $ <meas:one-normal-coordinate>]
  The total degree of $z^(- m)$ after including local-cohomology degree is $1 - 2 m$.
    This checks the normal sign and the shift simultaneously.
  Take the fiber at $e$ and then derived $C_e = L_e times.l U_e$ invariants.
    The cohomology of the restricted differential Hom is a coherent graded module over $bb(C) \[ V \]$.
    Its support is contained in $ker e$. To see the last assertion directly,
    differentiate the factorization differential: if $d_N^2 = W$, then
  $ d_N \( partial d_N \) + \( partial d_N \) d_N = partial W . $
  Left composition with $partial d_N$ is a homotopy for multiplication by $partial W$ on differential Hom.
    At $z = e$ the derivatives in the $V$-directions give the linear equations $e x = 0$.
    This also proves the assertion using any finite locally free replacement.
  Coherence implies that some power of the ideal of $ker e$ annihilates this cohomology.
    Consequently only #emph[finitely many] polynomial orders transverse to $ker e$ in the $x$-space occur.
    The orders $n$ in (6.5), in contrast, remain unbounded. After the triple translation,
    the weights from Proposition 19 give
  $ upright("space") & upright("absolute ") S upright("-weight") & upright("bound")\
\( ker e ∩ V_i \)^(*) & - 1 - i quad \( i gt.eq 0 \) & lt.eq - 1\
\( N_e \)_i & - 2 + i quad \( i lt.eq 0 \) & lt.eq - 2\
"Lie" \( U_e \)_i^(*) & - i quad \( i > 0 \) & < 0 . $
  Absolute weight $w$ means eigenvalue modulus $q^(w \/ 2)$.
    Thus the unrestricted $x$-variables and the normal symmetric powers both contract.
    The finitely many transverse $x$-orders, the normal determinant,
    and the finite complex of $U_e$-cochains affect only a finite coefficient factor.
  Here is a precise summability bound. Choose a finite-dimensional invariant generating space for the restricted
    cohomology, including its finite transverse thickening. The locally finite models constructed in the proof of
    Proposition 22 permit this choice for the algebraic group generated by the normalized transporter and
    equivariance. There are constants $C \, a \, b$ and $0 < rho_x \,
    rho_z < 1$ such that the sum of eigenvalue moduli, counted with multiplicities,
    in the terms of $x$-degree $m$ and normal order $n$ is at most
  #[#set math.equation(numbering: n => "(6.7)")
   $ C \( m + 1 \)^a \( n + 1 \)^b rho_x^m rho_z^n . $ <meas:geometric-bound>]
  For example one can take $rho_x = q^(- 1 \/ 2)$ and $rho_z =
    q^(- 1)$ after absorbing the finite coefficient spaces into $C$.
    Polynomial dimension growth follows from the finite number of polynomial variables.
    Subquotients can only decrease the multiplicity bound on each generalized weight.
  By Lemma 14 these estimates are uniform when a compact element of $L_e$ is included in the transporter.
    The semisimple normalized parts preserve a compact form; the residual unipotent commutes with it.
    Hence compact twists do not change the contracting moduli of the linear data.
    Finite coefficient representations supply only a uniform constant.
    This reasoning concerns traces and eigenvalue multiplicities;
    it does not require a unipotent operator to be unitary.
  For completeness, the bound also justifies passage from the graded pieces to their colimit.
    For every $epsilon.alt > 0$, only finitely many pairs $\( m \, n \)$ can have eigenvalues of modulus at least
    $epsilon.alt$, since the coefficient weights lie in a fixed finite set.
    In the category of locally finite representations, taking a sum of generalized eigenspaces in such a range is
    exact. On that range the filtered calculation therefore stabilizes after finitely many normal orders,
    and the ordinary long exact sequences give trace additivity.
    Filtered colimits of vector spaces are exact, so this identifies the same part of the cohomology of the
    colimit. Finally (6.7) is summable in $\( m \, n \)$, allowing $epsilon.alt$ to decrease to zero.
    The argument applies also to the finite orbit filtration.
    It uses direct-sum folding of the graded complexes; bounded Koszul and group-cochain calculations commute with
    this folding.
  If Frobenius permutes a finite set of strata without fixing any,
    use a power $S^t$ to make the preceding estimates on each summand.
    The same geometric bound is summable after raising each eigenvalue modulus to any positive power,
    in particular $1 \/ t$. It therefore gives summability also for $S$,
    whose one-step action has zero trace on the resulting permuted sum.
    On fixed strata the preceding calculation applies directly.
    The full scalar evaluation is perfect by Lemma 25, so its convergent alternating character is its ordinary
    finite supertrace. ◻
]

=== 6.3 Constructing the measures <constructing-the-measures>

Let $L_(e \, c)$ be the maximal compact subgroup of $L_e$ chosen in Lemma 14, including all components.
  Denote by $tau_e$ the triple-adjusted $S$-action, using that normalized transporter and retaining the
  absolute-weight scalars in the displayed table above. On coefficient modules in lifted degree zero it is the
  normalized transporter itself. Expressions on the corresponding compact coset are written as functions of $k in
  L_(e \, c)$, with operator $k tau_e$ on the space in question.
  Haar measure $d k$ is probability measure on the entire compact group.
  This notation allows $tau_e$ to act nontrivially on $L_e$.

Projection to reductive invariants is integration over $L_(e \, c)$:

#[#set math.equation(numbering: n => "(6.8)")
 $ "str" \( tau_e \; H^(L_e) \) = integral_(L_(e \, c)) "str" \( k tau_e \; H \) thin d k . $ <meas:compact-projection>]

For a finite-dimensional representation this is the Reynolds projection,
  which commutes with $tau_e$ because it normalizes the compact group.
  Lemma 26 proves the formula for all the convergent characters here by uniform absolute convergence.
  It also applies when $L_e$ is disconnected: averaging over its finitely many components is part of the same
  Reynolds projection.

The Hecke insertion contributes a finite-dimensional cyclic trace. For linear maps around $d$ copies of $D$ one has

#[#set math.equation(numbering: n => "(6.9)")
 $ "tr" #scale(x: 120%, y: 120%)[\(] "cyc" compose \( A_1 ⊗ dots.h.c ⊗ A_d \) \;
   D^(⊗ d) #scale(x: 120%, y: 120%)[\)] = "tr" \( A_d dots.h.c A_1 \; D \) . $ <meas:cyclic-trace>]

Expanding in a basis proves the identity: the cyclic identification of indices leaves precisely the matrix entries
  of the indicated product. The framed evaluation description in Theorem 12 applies this identity to the geometric
  points above $v$. The triple translations contribute $lambda_e \( q^(d \/ 2) \)$,
  and the residual semisimple product is compact and centralizes the triple.
  Unipotent factors may be discarded in this trace. We obtain a continuous map

#[#set math.equation(numbering: n => "(6.10)")
 $ beta_e : L_(e \, c) arrow.r B_(hat(G) . e) . $ <meas:parameter-map>]

Any lifted-degree sign on the insertion contributes $lambda_e \( - 1 \)$ to the compact part.
  This is already included in $B_(hat(G) . e)$. Contravariant character conventions give the inverse parameter,
  which lies in the same compact set by Lemma 31.

Remove the insertion and write $a_(M \, N \, e) \( k \)$ for the alternating character density of the supported
  contribution. The lifted-degree sign may be used inside (6.8):
  after taking invariants it is the true cohomological sign, as established in Proposition 19.
  The density is continuous and absolutely integrable by Lemma 26.
  The contribution of $O$ is therefore the finite complex measure

#[#set math.equation(numbering: n => "(6.11)")
 $ \( beta_e \)_(*) #scale(x: 120%, y: 120%)[\(] a_(M \, N \, e) \( k \) thin d k #scale(x: 120%, y: 120%)[\)] .
   $ <meas:orbit-measure>]

Its total variation is bounded by $integral \| a_(M \, N \, e) \| thin d k$.
  Formula (6.9) shows that its $chi_D$-moment is exactly the orbit contribution with the Hecke insertion.

#thm([Proposition 6.4.])[
  #emph[Suppose $M \, N$ belong to one retained component and have closed $z$-support bounds $Z_M \,
    Z_N subset frak(j)$. Their measure satisfies
#[#set math.equation(numbering: n => "(6.12)")
 $ "supp" \( nu_(f_N \, g_M) \) subset union.big_(e in Z_M ∩ Z_N) B_(hat(G) . e) . $ <meas:common-support-bound>]

]
] <meas:common-support>

#proof[
  Sum (6.11) over the finitely many stable nilpotent orbits in the common support.
    Lemma 26 gives additivity, and Lemma 25 identifies all its moments.
    Orbits outside the common support give zero differential Hom; permuted orbits give zero trace.
    The support bound follows from (6.10). Uniqueness follows from the density of characters in $C \( B \)$ in
    Lemma 31. ◻
]

By Theorem 23, every pair of functions is a finite linear combination of the pairs just considered.
  Each vector uses only finitely many retained fixed components,
  because the categorical trace is the direct sum on such components. Cross-component Homs vanish.
  Adding the finite measures above therefore proves existence in Theorem 24 for every $f \, g$,
  and character density proves uniqueness independent of the chosen expansion. The construction is bilinear.
  Proposition 27 already proves the forward implication in (6.2).

=== 6.4 Nondegeneracy of the top-orbit contribution <nondegeneracy-of-the-top-orbit-contribution>

The decisive test concerns total mass. Canceling a common nonvanishing density will isolate a simple coefficient,
  so injectivity of the parameter map $beta_e$ is unnecessary.

We must also show that a nonzero quotient class cannot be hidden by cancellation of its measure.
  Fix a stable orbit $O = J . e$. Let $P \, Q$ be finite-dimensional equivariant $D_e$-modules,
  with compatible cyclic structures, and take the compact orbit-closure lifts of Proposition 18.
  We put the test coefficient $Q$ first and the input coefficient $P$ second in a Hom.

On an open subset where $O$ is closed and the proper boundary of its closure has been removed,
  both lifts are already supported on $O$. Consequently local cohomology with that support is the actual Hom
  complex. There is no additional series of inverse normal powers to put into its Euler character. Proposition 19 gives

#[#set math.equation(numbering: n => "(6.13)")
 $ a_(Q \, P \, e) \( k \) = p_e \( k \) thin "tr" #scale(x: 120%, y: 120%)[\(] k tau_e \;
   "Hom"_(D_e) \( Q \, P \) #scale(x: 120%, y: 120%)[\)] \, wide k in L_(e \, c) . $ <meas:top-density>]

The action on the Hom uses the inverse structure on the test as in (6.3).
  The factor $p_e$ is the graded Euler character of

#[#set math.equation(numbering: n => "(6.14)")
 $ bb(C) \[ ker e \] ⊗ Lambda^bullet \( N_e \[ - 1 \] \) ⊗ Lambda^bullet \( "Lie" \( U_e \)^(*) \[ - 1 \] \) .
   $ <meas:universal-density-factors>]

The identification of constant Clifford super-intertwiners with ordinary intertwiners,
  and its compatibility with lifted parity and tensor twists, are part of Proposition 19.

The invariant-base Koszul complexes used to obtain actual compact lifts do not alter (6.13) except by constant
  nonzero factors. Indeed, expand their finite exterior terms by additivity in each input.
  Their equation spaces are $J$-invariant, so these factors are independent of $k$;
  their Frobenius eigenvalues and inverse eigenvalues are never one.
  The exterior traces are therefore nonzero, as in Lemma 20. We rescale the trace classes by these constants.
  This permits computation first on the uncompleted orbit model while retaining actual compact tests throughout.

#thm([Lemma 6.5.])[
  (Cancellation of the universal density).  #emph[The function $p_e$ is continuous and nowhere zero on
    $L_(e \, c)$. Its reciprocal is a uniform limit of finite complex linear combinations of twisted characters of
    finite-dimensional $L_e$-representations with compatible transporter structures.
    Such a twisted character can be inserted in (6.13) by tensoring the test coefficient with the dual
    representation, in lifted degree zero.]
] <meas:cancel-density>

#proof[
  Decompose each of the finite-dimensional spaces in (6.14) by lifted degree.
    The symmetric algebra contributes inverse determinants, and each exterior algebra contributes determinants.
    Thus $p_e$ is a finite product of terms
  #[#set math.equation(numbering: n => "(6.15)")
   $ det \( 1 - epsilon k A \; W \)^eta \, wide epsilon in { 1 \, - 1 } \, quad eta in { 1 \, - 1 } \,
     $ <meas:determinant-factor>]
  where $W$ is a finite-dimensional $L_e$-representation with transporter $A$,
    and all eigenvalues of $k A$ have modulus strictly less than one, uniformly in $k$.
    The sign $epsilon$ incorporates the specified lifted-degree shift.
    The strict inequality follows from the weight bounds: all factors outside the constant coefficient Hom have
    negative absolute weight. Each determinant in (6.15) is therefore nonzero, proving the first assertion.
  The identities
  $ det \( 1 - A \; W \) = sum_(j = 0)^(dim W) \( - 1 \)^j "tr" \( A \; Lambda^j W \) \, wide
    det \( 1 - A \; W \)^(- 1) = sum_(n gt.eq 0) "tr" \( A \; "Sym"^n W \) $
  apply also with the sign $epsilon$. The second series converges uniformly here:
    its $n$th term is bounded by $dim \( "Sym"^n W \) rho^n$ for a fixed $rho < 1$.
    Finite products of these identities express $1 \/ p_e$ as the required uniform limit.
    Every finite term is the twisted character of a finite tensor product of symmetric and exterior powers of the
    allowed representation data; scalar factors may be put into its coefficient or cyclic structure.
  Finally,
  $ "Hom"_(D_e) \( Q ⊗ R^(*) \, P \) tilde.eq R ⊗ "Hom"_(D_e) \( Q \, P \) $
  with the induced cyclic actions. Under the parity identification already used for (6.13),
    its character multiplies that density by the twisted character of $R$.
    The extension construction in Proposition 18 applies to $Q ⊗ R^(*)$ as well.
    Each finite approximant is consequently realized by a finite linear combination of permitted compact test classes. ◻
]

#thm([Lemma 6.6.])[
  (Top quotient detection).  #emph[Every nonzero finite linear combination of fixed-simple classes in the
    $O$-quotient is detected by a compact test supported on $overline(O)$:
    its top-orbit measure has nonzero total mass on $B_(hat(G) . e)$.]
] <meas:top-detection>

#proof[
  Write the quotient class as $u = sum_P c_P \[ P \]$, with finitely many nonzero coefficients.
    Suppose its top mass were zero against every permitted test lift. Fix a test coefficient $Q$.
    By tensoring $Q$ with the duals of the representations in Lemma 28, the assumption gives
  $ integral_(L_(e \, c)) p_e \( k \) h \( k \) sum_P c_P "tr" #scale(x: 120%, y: 120%)[\(] k tau_e \;
    "Hom"_(D_e) \( Q \, P \) #scale(x: 120%, y: 120%)[\)] thin d k = 0 $
  for every finite character combination $h$ used there. Letting these $h$ converge uniformly to $1 \/ p_e$ gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ 0 = sum_P c_P "tr" #scale(x: 120%, y: 120%)[\(] tau_e \;
     "Hom"_(D_e \, L_e) \( Q \, P \) #scale(x: 120%, y: 120%)[\)] . $ <meas:unweighted-coefficient-pairing>]
  This is legitimate integration against a fixed continuous function, not a limit of automorphic functions.
  The equivariant Clifford coefficient category is semisimple.
    Choose $Q$ to be any fixed simple appearing in $u$, with the matching structure.
    For $P tilde.eq.not Q$ its Hom is zero; for $P tilde.eq Q$ it is the scalar endomorphism line and the action
    is the identity. Thus (6.16) says $c_Q = 0$. Repeating this contradicts $u eq.not 0$.
    Some actual finite test must therefore have nonzero top mass.
    The argument requires no injectivity of $beta_e : L_(e \, c) arrow.r B_(hat(G) . e)$:
    the total mass alone suffices. ◻
]

=== 6.5 Excluding boundary cancellation <excluding-boundary-cancellation>

#thm([Lemma 6.7.])[
  #emph[If $e' in overline(J . e) \\ J . e$, then $dim \( hat(G) . e' \) < dim \( hat(G) . e \)$.
    In particular the two ambient nilpotent orbits, and their compact sets, are distinct.]
] <meas:boundary-rank>

#proof[
  Since $J$ is reductive in characteristic zero, choose a $J$-stable complement $W$ in $hat(frak(g)) =
    frak(j) xor W$. The adjoint rank on $frak(j)$ is the dimension of the $J$-orbit and strictly drops on a proper
    boundary orbit. The rank on $W$ cannot increase under specialization,
    because the condition that a matrix have rank at most a given integer is closed. Hence
  $ "rk" \( "ad" \( e' \) \| hat(frak(g)) \) < "rk" \( "ad" \( e \) \| hat(frak(g)) \) . $
  These ranks are the ambient orbit dimensions. The same argument works for a disconnected $J$,
    whose orbits are finite unions of orbits of its identity component.
    Disjointness of the compact sets follows from Lemma 31. ◻
]

We finish the converse in Theorem 24. Suppose $f in.not cal(F)_Y cal(A)_(bb(C))$.
  By Theorem 23, choose a retained fixed component on which its trace class does not lie in the supported trace
  for $Y ∩ frak(j)$. Starting with this closed subset, filter the nilpotent cone in $frak(j)$ by closed invariant
  subsets, adding one Frobenius orbit of $J$-orbits at a time, compatibly with closure.
  Write $T_0 subset T_1 subset dots.h.c subset T_m$ for the resulting supported trace subspaces,
  with $T_0$ the trace for $Y ∩ frak(j)$. Let $i$ be the least index for which the component class lies in $T_i$.
  Then $i > 0$, and its image $u in T_i \/ T_(i - 1)$ is nonzero.
  A nontrivially permuted stratum has zero trace, so this step adds a single Frobenius-stable orbit $O =
  J . e$ outside $Y ∩ frak(j)$.

Express $u$ as a finite combination of the fixed-simple classes in the $O$-quotient,
  and choose their compact orbit-closure lifts as in the proof of Theorem 23.
  Subtract their sum from the component class. The remainder belongs to $T_(i - 1)$ and, by the same theorem,
  is represented by a finite combination of compact Weil classes with that earlier support.
  Apply Lemma 29 to $u$ and these lifts to obtain a compact test supported on $overline(O)$ with nonzero top mass.
  The earlier support bound defining $T_(i - 1)$ meets $overline(O)$ only in $overline(O) \\ O$.
  Proposition 27 and Lemma 30 therefore show that the remainder,
  and the proper-boundary contributions of the chosen lifts, have zero mass on $B_(hat(G) . e)$.
  This also excludes contributions from incomparable $J$-orbits in the same ambient nilpotent orbit.
  Other components give zero Hom. Therefore

$ nu_(f \, g) \( B_(hat(G) . e) \) eq.not 0 $

for the resulting genuine finitely supported function test $g$.
  Since $e in.not Y$, the invariant set $Y$ does not contain its ambient orbit,
  and $B_(hat(G) . e)$ is disjoint from $B_Y$. The asserted support condition fails.
  This proves the converse and completes the proof of Theorem 24.

No step used a rational point of $X$, a cuspidality condition, or Hecke-finiteness.
  Empty and full $Y$ are included, and the closed point $v$ may have any positive degree.

== 7 Compact spectral sets and rational descent <desc:section>

We first verify the elementary properties of the sets in (1.4).
  These properties supply the uniqueness used in Theorem 24; their proof is independent of that theorem.

#thm([Lemma 7.1.])[
  #emph[There are finitely many sets $B_o$. Each is compact and independent of the triple and compact form used to
    define it, and distinct orbits give disjoint sets. The algebra of representation characters restricted to $B =
    union.big_o B_o$ contains the constants, separates points and is closed under complex conjugation.
    It is uniformly dense in $C \( B \, bb(C) \)$. Each $B_o$ is preserved by inversion and by multiplication by a
    finite-order central element of $hat(G)_(bb(C))$.]
] <desc:compactsets>

#proof[
  Nilpotent orbits in a complex semisimple Lie algebra are finite in number.
    Triples for a fixed orbit are conjugate, and maximal compact forms of a complex reductive group,
    including its components, are conjugate. Consequently their images in the affine conjugacy quotient give the
    same $B_o$. The image of a compact group under the displayed continuous map is compact.
    The finite union $B$, as a compact subspace of a complex affine variety, is metrizable.
  Choose a maximal torus $T subset hat(G)_(bb(C))$. Polar decomposition in $T \( bb(C) \)$ gives
  $ T \( bb(C) \) = T \( bb(R)_(> 0) \) times T_(upright("cpt")) \, $
  where the positive factor is intrinsically described by the absolute values of all characters.
    This decomposition is Weyl-equivariant. The centralizer of the torus $lambda_e \( bb(G)_m \)$ in
    $hat(G)_(bb(C))$ is a connected reductive Levi subgroup. It contains $s$,
    and a maximal torus of this Levi containing the semisimple element $s$ also contains its central torus
    $lambda_e \( bb(G)_m \)$. Thus $lambda_e$ and $s$ can be placed in a common maximal torus.
    The positive part of $lambda_e \( sqrt(r) \) s$ is exactly $lambda_e \( sqrt(r) \)$.
    Its Weyl orbit determines the dominant cocharacter $lambda_e$:
    evaluation of cocharacters at $sqrt(r) > 1$ is injective.
  For completeness, that cocharacter determines the nilpotent orbit without forgetting any distinction in type D.
    Fix $lambda$ and write $hat(frak(g))_i$ for its weight spaces.
    Whenever a triple has diagonal cocharacter $lambda$, the $frak(s l)_2$ decomposition gives
  $ \[ hat(frak(g))_0 \, e \] = hat(frak(g))_2 . $
  Indeed, the raising map from weight zero to weight two is surjective on each irreducible $frak(s l)_2$ summand.
    Thus the centralizer of $lambda$ has an open orbit through $e$ in the irreducible vector space
    $hat(frak(g))_2$. Two such open orbits must coincide. It follows that two parameters with the same positive
    part have the same ambient nilpotent orbit. This proves disjointness;
    it is also the description underlying [14] Lemma 3.1.3.
  Representation characters separate semisimple conjugacy values in a connected complex reductive group:
    restriction to $T$ identifies their complex span with $bb(C) \[ T \]^W$ [20] Theorem 22.38.
    Hence their restrictions separate points of $B$. To check complex conjugation, write $a =
    lambda_e \( sqrt(r) \)$. For a representation $D$, $D \( a \)$ is diagonalizable with positive real
    eigenvalues and commutes with $D \( s \)$; on each of its eigenspaces $D \( s \)$ is unitary after choosing an
    invariant Hermitian form for the compact centralizer. Therefore
  $ overline(chi_D \( a s \)) = chi_D \( a s^(- 1) \) . $
  A Weyl element in the triple’s $upright("SL")_2$ conjugates $a$ to $a^(- 1)$ and commutes with $s$. Thus
  $ chi_D \( a s^(- 1) \) = chi_D \( a^(- 1) s^(- 1) \) = chi_(D^or) \( a s \) . $
  The same representation $D^or$ works simultaneously on every $B_o$.
    The character algebra is consequently self-adjoint, and the complex Stone–Weierstrass Theorem proves its
    density on the finite compact union.
  The triple Weyl element also shows that $\( a s \)^(- 1)$ is conjugate to $a s^(- 1)$,
    proving invariance under inversion. A finite-order central element lies in the chosen compact triple
    centralizer: adjoining it gives a compact group, and maximality leaves that group unchanged.
    Multiplication by it therefore preserves $B_o$. ◻
]

#thm([Corollary 7.2.])[
  #emph[A finite complex Borel measure on $B$ is determined by its integrals against all representation characters.]
] <desc:unique-measure>

#proof[
  Integration against a finite complex measure is a continuous functional on $C \( B \, bb(C) \)$ for the uniform
    norm. Lemma 31 makes the character algebra dense. Equality on the characters therefore gives equality of the
    continuous functionals and hence of the measures. ◻
]

=== 7.1 Independence of the coefficient isomorphism <independence-of-the-coefficient-isomorphism>

All algebraically closed characteristic-zero coefficient fields below are considered as abstract fields.
  Both $E$ and $bb(C)$ have transcendence degree $2^(ℵ_0)$ over $bb(Q)$,
  so there are field isomorphisms $E tilde.eq bb(C)$. No continuity or compatibility with a selected embedding of
  the algebraic numbers is used.

#thm([Proposition 7.3.])[
  #emph[For a fixed closed invariant support $Y$, the subspace $iota_(*) \( cal(F)_Y cal(A)_E \) subset
    cal(A)_(bb(C))$ is independent of the abstract isomorphism $iota : E arrow.r^tilde.op bb(C)$,
    after matching nilpotent orbits by the split root datum. Consequently $cal(F)_Y
    cal(A)_E$ is invariant under every automorphism of $E$ fixing $bb(Q)$.]
] <desc:coefficient-independence>

#proof[
  The point functions identify every transported ambient space with the same $bb(C)^(\( S \))$.
    The pinned split form identifies representation characters by highest weight across coefficient fields.
    The pairing (1.5) has rational coefficients. Spherical Hecke correspondences count the same finite-field
    modifications under each transport. Their normalization may be chosen on the complex side using the fixed
    positive $sqrt(q)$, so their operators $T_D$ are the same for each $iota$.
  If a transported choice of $sqrt(q)$ differs from this one, set
  $ z = \( 2 rho_G \) \( - 1 \) in Z \( hat(G) \) \[ 2 \] \, $
  where $2 rho_G$ is the sum of the positive roots of $G$, viewed as a cocharacter of its dual group.
    The Satake parity convention at the degree-$d$ point introduces $z^d$:
    a highest weight $mu$ acquires the sign $\( - 1 \)^(d chevron.l 2 rho_G \, mu chevron.r)$,
    which is exactly its central character at $z^d$. This convention is also encoded by the modified dual group in
    [28] Remark 6.7 and Section 6.4. On characters the change is therefore translation by $z^d$,
    and on moment measures it is the corresponding pushforward.
    By Lemma 31, this translation preserves each $B_o$. The contragredient convention similarly preserves each
    $B_o$ by inversion. Thus these conventions do not change the support test.
  Nilpotent orbits of the split group are identified across these fields using the fixed pinned $bb(Q)$-form and
    their triple cocharacters, or equivalently their weighted Dynkin diagrams.
    No outer automorphism is introduced in this identification.
    In particular the orbit labels in $Y$ and the compact set $B_Y$ are fixed independently of $iota$.
    Theorem 24 and Corollary 32 now characterize the transported subspace by the same moment equations and the
    same support condition for every test $g in cal(A)_(bb(C))$. The subspaces are equal.
  Fix one $iota$ and let $tau in "Aut" \( E \/ bb(Q) \)$. Comparing $iota$ with $iota compose
    tau$ gives $iota_(*) \( cal(F)_Y cal(A)_E \) = iota_(*) tau_(*) \( cal(F)_Y cal(A)_E \)$.
    Applying $iota^(- 1)$ proves invariance. ◻
]

=== 7.2 Descent on finite coordinate sets <descent-on-finite-coordinate-sets>

#thm([Lemma 7.4.])[
  #emph[Let $E$ be an algebraically closed extension of $bb(Q)$, and let $V_(bb(Q))$ have a specified basis,
    possibly infinite. If $W subset E ⊗_(bb(Q)) V_(bb(Q))$ is invariant under every $tau in
    "Aut" \( E \/ bb(Q) \)$, then
$ E ⊗_(bb(Q)) \( W ∩ V_(bb(Q)) \) arrow.r W $

 is an isomorphism.]
] <desc:descent>

#proof[
  The fixed field of $"Aut" \( E \/ bb(Q) \)$ is $bb(Q)$. Indeed,
    an algebraic element outside $bb(Q)$ has a different conjugate,
    and the corresponding embedding of its number field extends to an automorphism of $E$.
    A transcendental element can be included in a transcendence basis; the substitution $t mapsto t +
    1$ on that basis element extends from the rational function field to its algebraic closure $E$.
    Thus it too is moved by an automorphism over $bb(Q)$.
  Let $I$ be a finite subset of the specified basis, choose an order on $I$, and put
  $ W_I = W ∩ E^I . $
  This is an invariant finite-dimensional subspace. Its unique reduced row-echelon basis matrix is unchanged by
    every automorphism over $bb(Q)$: field automorphisms preserve the row space,
    the pivot positions and the normalization conditions. Every matrix entry therefore belongs to the fixed field
    $bb(Q)$. Its nonzero rows give a rational basis, and hence
  $ W_I = E ⊗_(bb(Q)) \( W_I ∩ bb(Q)^I \) . $
  Every vector of $E ⊗_(bb(Q)) V_(bb(Q))$ has finite support in the specified basis.
    Taking the directed union over $I$ gives the claimed surjectivity.
    Injectivity follows by tensoring the inclusion $W ∩ V_(bb(Q)) arrow.r.hook
    V_(bb(Q))$ with the flat $bb(Q)$-module $E$. ◻
]

#proof[
  Proposition 33 makes $W = cal(F)_Y cal(A)_E$ invariant under all coefficient automorphisms over $bb(Q)$.
    Apply Lemma 34 to $V_(bb(Q)) = cal(A)_(bb(Q))$ with its point-function basis. This is exactly the map (1.3).
  The argument applies to every closed invariant $Y$, including the empty set and the full nilpotent cone.
    The trace calculation uses all retained fixed components and actual finite linear combinations of Weil trace
    classes. The detector allows every finitely supported test function.
    Consequently the result holds for the entire specified space,
    without any additional finiteness or cuspidality assumption. ◻
]

The argument also compares coefficient primes on the full function space under the same four conditions of
  Assumption 1. Put $p = "char" \( bb(F)_q \)$ and $E_ell = overline(bb(Q))_ell$ for $ell eq.not p$.
  Let $Y_ell subset hat(cal(N))_(E_ell)$ be closed invariant supports with the same nilpotent-orbit labels under
  the pinned split dual group. Then, as subspaces of $cal(A)_(bb(Q))$,

$ cal(A)_(bb(Q)) ∩ cal(F)_(Y_ell) cal(A)_(E_ell) = cal(A)_(bb(Q)) ∩ cal(F)_(Y_(ell')) cal(A)_(E_(ell'))
  wide \( ell \, ell' eq.not p \) . $

Indeed, choose the same closed point $v$ and abstract isomorphisms $E_ell tilde.eq bb(C)$.
  With the positive square-root Satake normalization, the moment equations for every $f \,
  g in cal(A)_(bb(C))$ and the compact support sets in Theorem 24 are the same for every prime,
  as in the proof of Proposition 33. Uniqueness of the measures gives the same transported filtration in
  $cal(A)_(bb(C))$. Intersecting with $cal(A)_(bb(Q))$, which every coefficient isomorphism fixes,
  proves the equality. As the matched closed orbit subset varies,
  these common rational subspaces form a filtration of $cal(A)_(bb(Q))$ whose $E_ell$ scalar extension is the
  original Arthur filtration, by Theorem 2. This compares rational function subspaces;
  it does not identify spectral support categories or individual eigenobjects.

=== 7.3 Unramified cuspidal comparison <unramified-cuspidal-comparison>

#thm([Corollary 7.5.])[
  (Cuspidal comparison across coefficient primes).  #emph[Keep the curve $X \/ bb(F)_q$,
    the split connected semisimple group $G \/ bb(F)_q$, and all four conditions of Assumption 1.
    Put $p = "char" \( bb(F)_q \)$ and $E_ell = overline(bb(Q))_ell$ for $ell eq.not p$.
    At unramified level $D = 0$, let $C_(0 \, bb(Q)) subset cal(A)_(bb(Q))$ be the cuspidal function space and
    $C_(0 \, cal(O) \, bb(Q))$ its rational orbit summands from [23] Theorem 1.1, and set $C_(0 \, ell) =
    E_ell ⊗_(bb(Q)) C_(0 \, bb(Q))$. For each $ell eq.not p$,
    let $Y_ell subset hat(cal(N))_(E_ell)$ be closed and invariant,
    with the same nilpotent-orbit subset $cal(Y)$ under the fixed pinned split rational dual group.
    Write $Y = \( Y_ell \)_(ell eq.not p)$ and define
$ F_(Y \, ell)^(bb(Q)) := cal(A)_(bb(Q)) ∩ cal(F)_(Y_ell) cal(A)_(E_ell) \, wide V_(Y \, bb(Q)) :=
  xor.big_(cal(O) in cal(Y)) C_(0 \, cal(O) \, bb(Q)) . $

 Then
#[#set math.equation(numbering: n => "(7.1)")
 $ C_(0 \, bb(Q)) ∩ F_(Y \, ell)^(bb(Q)) & = V_(Y \, bb(Q)) \,\
C_(0 \, ell) ∩ cal(F)_(Y_ell) cal(A)_(E_ell) & = E_ell ⊗_(bb(Q)) V_(Y \, bb(Q)) . $ <desc:cuspidal-equalities>]

 The intersections are taken in the corresponding finitely supported function spaces.
   The equalities include the zero cusp space and empty or full $Y_ell$.]
] <desc:cuspidal-comparison>

This is precisely the unramified cuspidal common-scope form of [14] Conjectures 3.4.9 and 3.4.11.
  The additional identification with the companion’s orbit summands concerns the $D = 0$ cuspidal subspace.

#proof[
  For split $G$, the companion’s unramified double quotient is the set $S$ of bundle classes [23] Section 6.1,
    giving the stated point-function embeddings. Fix $ell$, an abstract isomorphism $iota :
    E_ell arrow.r^tilde.op bb(C)$, and a closed point $v$ with $r = q^(deg v)$.
    The finite reduced global Hecke image on the cusp space gives finitely many joint eigenspaces [23] Lemma 6.1.
    Restrict to the spherical algebra at $v$ and group all joint characters with the same one-place Satake class.
    The ordinary Hecke compatibility of Theorem 5 and the companion’s volume-one normalization give
  $ C_(0 \, bb(C)) := bb(C) ⊗_(bb(Q)) C_(0 \, bb(Q)) = xor.big_(t in Sigma_v) C_t \, wide T_V \|_(C_t) =
    chi_V \( t \) \, $
  where the $t$ are distinct classes in the positive $sqrt(r)$ convention and $V$ is any finite-dimensional
    representation of $hat(G)_(bb(C))$. The possible square-root correction is a finite central translate [23]
    Remark 6.3, and a contragredient convention gives inversion; both preserve every $B_(cal(O))$ by Lemma 31.
  The companion’s orbit descent assigns each joint character one orbit label,
    independent of the good place and complex embedding, and the complex scalar extension of each rational orbit
    summand is the sum of the joint eigenspaces with that label [23] Lemma 6.2 and Propositions 6.5–6.6.
    Every occurring embedded class of label $cal(O)$ lies in $B_(cal(O))$ by the all-embeddings compactness
    defining $R_(r \, cal(O))$. Since the $B_(cal(O))$ are disjoint,
    all joint eigenspaces grouped into one $C_t$ have the same label. Thus $Sigma_v subset B$ and
  $ bb(C) ⊗_(bb(Q)) C_(0 \, cal(O) \, bb(Q)) = xor.big_(t in Sigma_v ∩ B_(cal(O))) C_t . $
  For the common support put $B_Y = union.big_(cal(O) in cal(Y)) B_(cal(O))$.
  Write $f = sum_t f_t in C_(0 \, bb(C))$. For every $g in cal(A)_(bb(C))$,
    the finite atomic measure $mu_(f \, g) := sum_t \[ f_t \, g \] delta_t$ on $B$ satisfies
  $ \[ T_V f \, g \] = sum_t chi_V \( t \) \[ f_t \, g \] = integral_B chi_V thin d mu_(f \, g) . $
  Corollary 32 identifies $mu_(f \, g)$ with the detector measure $nu_(f \, g)$.
    If $f_t eq.not 0$, choose $b in S$ with $f_t \( b \) eq.not 0$ and take the point function $g = delta_b$. Then
  $ mu_(f \, delta_b) \( { t } \) = \[ f_t \, delta_b \] = frac(f_t \( b \), \| "Aut" \( b \) \|) eq.not 0 . $
  The atoms are distinct, so no other local component cancels this mass. The test need not be cuspidal.
    Consequently all detector measures are supported in $B_Y$ exactly when $f_t = 0$ for every $t in.not B_Y$.
    Theorem 24 and the preceding orbit decomposition give
  $ C_(0 \, bb(C)) ∩ iota_(*) \( cal(F)_(Y_ell) cal(A)_(E_ell) \) = bb(C) ⊗_(bb(Q)) V_(Y \, bb(Q)) . $
  Pulling back by $iota$, which fixes $bb(Q)$, proves the second equality in (7.1).
    Intersect it with $C_(0 \, bb(Q))$ and use $C_(0 \, bb(Q)) ∩ \( E_ell ⊗_(bb(Q)) V_(Y \, bb(Q)) \) =
    V_(Y \, bb(Q))$ to obtain the first. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Jeffrey Adams and Olivier Taïbi, #emph[Galois and Cartan cohomology of real groups],
  arXiv:1611.05956v2, 21 November 2016. #link("https://arxiv.org/abs/1611.05956v2").]
#bibitem([2])[Dima Arinkin and Dennis Gaitsgory, #emph[Singular support of coherent sheaves and the geometric
  Langlands conjecture], Selecta Mathematica, New Series #strong[21] (2015), no.~1, 1--199.
  #link("https://doi.org/10.1007/s00029-014-0167-5"). Introduction locators refer to arXiv:1201.6343v4.
  #link("https://arxiv.org/abs/1201.6343v4").]
#bibitem([3])[Dima Arinkin, Dennis Gaitsgory, David Kazhdan, Sam Raskin, Nick Rozenblyum, and Yakov Varshavsky,
  #emph[The stack of local systems with restricted variation and geometric Langlands theory with nilpotent
  singular support], arXiv:2010.01906v2, 6 April 2022. #link("https://arxiv.org/abs/2010.01906v2").]
#bibitem([4])[Dima Arinkin, Dennis Gaitsgory, David Kazhdan, Sam Raskin, Nick Rozenblyum, and Yakov Varshavsky,
  #emph[Duality for automorphic sheaves with nilpotent singular support], arXiv:2012.07665v2, 17 May 2022.
  #link("https://arxiv.org/abs/2012.07665v2").]
#bibitem([5])[Dima Arinkin, Dennis Gaitsgory, David Kazhdan, Sam Raskin, Nick Rozenblyum, and Yakov Varshavsky,
  #emph[Automorphic functions as the trace of Frobenius], arXiv:2102.07906v2, 3 June 2022.
  #link("https://arxiv.org/abs/2102.07906v2").]
#bibitem([6])[James Arthur, #emph[Unipotent automorphic representations:
  conjectures], Astérisque #strong[171--172] (1989), 13--71.
  #link("https://www.numdam.org/item/AST_1989__171-172__13_0/").]
#bibitem([7])[Michael F.~Atiyah, #emph[Riemann surfaces and spin structures],
  Annales scientifiques de l'École Normale Supérieure (4) #strong[4] (1971), no.~1, 47--62.
  #link("https://doi.org/10.24033/asens.1205").]
#bibitem([8])[David Ben-Zvi, Yiannis Sakellaridis, and Akshay Venkatesh, #emph[Relative Langlands duality],
  arXiv:2409.04677v1, 7 September 2024. #link("https://arxiv.org/abs/2409.04677v1").]
#bibitem([9])[Michel Brion, #emph[Invariant Hilbert schemes], arXiv:1102.0198v2, 21 April 2011.
  #link("https://arxiv.org/abs/1102.0198v2").]
#bibitem([10])[Pierre Deligne, #emph[La conjecture de Weil:
  II], Publications Mathématiques de l'IHÉS #strong[52] (1980), 137--252. #link("https://doi.org/10.1007/BF02684780").]
#bibitem([11])[Vladimir Drinfeld and Dennis Gaitsgory, #emph[On some finiteness questions for algebraic stacks],
  Geometric and Functional Analysis #strong[23] (2013), 149--294; arXiv:1108.5351v3, 26 October 2012.
  #link("https://arxiv.org/abs/1108.5351v3").]
#bibitem([12])[Dennis Gaitsgory, #emph[Ind-coherent sheaves], arXiv:1105.4857v7, 22 September 2012.
  #link("https://arxiv.org/abs/1105.4857v7").]
#bibitem([13])[Dennis Gaitsgory and Nick Rozenblyum, #emph[DG indschemes], arXiv:1108.1738v8, 19 March 2023.
  #link("https://arxiv.org/abs/1108.1738v8").]
#bibitem([14])[Dennis Gaitsgory, Vincent Lafforgue, and Sam Raskin,
  #emph[Tempered vs generic automorphic functions and the canonical filtration on automorphic functions],
  arXiv:2603.26925v2, 2026. #link("https://arxiv.org/html/2603.26925v2").]
#bibitem([15])[Dennis Gaitsgory and Sam Raskin, #emph[Geometric Langlands in positive characteristic from
  characteristic zero], arXiv:2508.02237v1, 4 August 2025. #link("https://arxiv.org/html/2508.02237v1").]
#bibitem([16])[William M.~Goldman and John J.~Millson, #emph[The deformation theory of representations of
  fundamental groups of compact Kähler manifolds], Publications Mathématiques de l'IHÉS #strong[67] (1988),
  43--96. #link("https://doi.org/10.1007/BF02699127").]
#bibitem([17])[Marc Hoyois, Sarah Scherotzke, and Nicolò Sibilla, #emph[Higher traces, noncommutative motives,
  and the categorified Chern character], arXiv:1511.03589v3. #link("https://arxiv.org/abs/1511.03589v3").]
#bibitem([18])[David Kazhdan and Andrei Okounkov, #emph[On the unramified Eisenstein spectrum],
  arXiv:2203.03486v3. #link("https://arxiv.org/abs/2203.03486v3"). Section and equation locators refer to this version.]
#bibitem([19])[Bernhard Keller, #emph[A-infinity algebras, modules and functor categories], arXiv:math/0510508v3,
  12 February 2006. #link("https://arxiv.org/abs/math/0510508v3").]
#bibitem([20])[J.~S.~Milne, #emph[Algebraic Groups: The Theory of Group Schemes of Finite Type over a Field],
  Cambridge University Press, 2017. #link("https://www.jmilne.org/math/Books/iAG2017.pdf").]
#bibitem([21])[David Mumford, #emph[Theta characteristics of an algebraic curve],
  Annales scientifiques de l'École Normale Supérieure (4) #strong[4] (1971), no.~2, 181--192.
  #link("https://doi.org/10.24033/asens.1209").]
#bibitem([22])[Yoshinori Namikawa, #emph[Birational geometry for nilpotent orbits], arXiv:1002.2821v2,
  10 March 2010; Handbook of Moduli, vol.~III, Advanced Lectures in Mathematics #strong[26] (2013), 1--38.
  #link("https://arxiv.org/abs/1002.2821v2").]
#bibitem([23])[OpenAI, #emph[Ramanujan--Arthur Decompositions of Cuspidal Functions at Full Finite Level],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Ramanujan-Arthur-Decompositions-of-Cuspidal-Functions-at-Full-Finite-Level-September-24-2026/paper.pdf")[OAI:Ramanujan-Arthur-Decompositions-of-Cuspidal-Functions-at-Full-Finite-Level-September-24-2026],
  2026.]
#bibitem([24])[OpenAI, #emph[The Restricted Geometric Langlands Equivalence in Positive Characteristic],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-Restricted-Geometric-Langlands-Equivalence-in-Positive-Characteristic-September-24-2026/paper.pdf")[OAI:The-Restricted-Geometric-Langlands-Equivalence-in-Positive-Characteristic-September-24-2026],
  2026.]
#bibitem([25])[Tudor Pădurariu and Yukinobu Toda, #emph[The categorical DT/PT correspondence and quasi-BPS
  categories for local surfaces], Moduli #strong[3] (2026), e1, 1--44. #link("https://doi.org/10.1112/mod.2025.10017").]
#bibitem([26])[J.~P.~Pridham, #emph[The deformation theory of representations of the fundamental group of a smooth
  variety], arXiv:math/0401344v2, revised 3 July 2019. #link("https://arxiv.org/abs/math/0401344v2").]
#bibitem([27])[Sam Raskin, #emph[Conjectures of Arthur and Ramanujan for unramified automorphic forms:
  announcement], ICM 2026 contribution, 12 October 2025, updated 10 March 2026.
  #link("https://www.samraskin.net/icm.pdf").]
#bibitem([28])[Timo Richarz and Jakob Scholbach, #emph[The motivic Satake equivalence],
  Mathematische Annalen #strong[380] (2021), 1595--1653, published 15 May 2021.
  #link("https://doi.org/10.1007/s00208-021-02176-9").]
#bibitem([29])[The Stacks Project Authors, #emph[The Stacks Project], 2026,
  Tags #link("https://stacks.math.columbia.edu/tag/00MA")[00MA],
  #link("https://stacks.math.columbia.edu/tag/00IP")[00IP],
  #link("https://stacks.math.columbia.edu/tag/0A06")[0A06],
  and #link("https://stacks.math.columbia.edu/tag/0BKH")[0BKH], accessed 18 September 2026.]
#bibitem([30])[Yukinobu Toda, #emph[Categorical Donaldson--Thomas theory for local surfaces], arXiv:1907.09076v4,
  10 June 2021. #link("https://arxiv.org/abs/1907.09076v4").]
