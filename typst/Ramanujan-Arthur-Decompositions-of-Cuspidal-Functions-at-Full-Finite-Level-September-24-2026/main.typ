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

#align(center)[#text(size: 16pt, weight: "bold")[Ramanujan--Arthur Decompositions of Cuspidal Functions \
at Full Finite Level]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The absolute values of unramified Hecke eigenvalues measure the departure of an automorphic representation from temperedness. The Ramanujan–Arthur prediction organizes the departures that occur in the discrete spectrum by homomorphisms from $upright("SL")_2$ into the Langlands dual group; the additional algebraic factor is central to Arthur’s conjectural description of non-tempered discrete automorphic representations #cite(label("Arthur1989")) Sections 4 and 8. For cuspidal automorphic functions over a global function field, this leads to a decomposition indexed by nilpotent orbits. We prove that decomposition with arbitrary full finite level. Its common orbit also turns genericity at one unramified place into temperedness at all unramified places in the adjoint absolutely simple case.

=== 1.1 The statement <the-statement>

Let $X$ be a smooth projective geometrically connected curve over $bb(F)_q$, let $F = bb(F)_q \( X \)$, and let $G$ be a split connected semisimple group over $bb(F)_q$. Write $bb(A)_F$ for the adele ring and $cal(O)_(bb(A))$ for its integral subring. Let $D$ be any effective divisor on $X$ defined over $bb(F)_q$; its multiplicities are arbitrary. Set

#[#set math.equation(numbering: n => "(1.1)")
 $ K_D = ker #scale(x: 120%, y: 120%)[\(] G \( cal(O)_(bb(A)) \) arrow.r G \( cal(O)_D \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(X)_D = G \( F \) without G \( bb(A)_F \) \/ K_D . $ <intro:level>]

For $D = 0$, this means $K_D = G \( cal(O)_(bb(A)) \)$. Equivalently, $cal(X)_D$ is the set of isomorphism classes in $"Bun"_(G \, D) \( bb(F)_q \)$, where the level is a trivialization on the whole finite subscheme $D$.

Let $C_(D \, bb(Q))$ be the space of compactly supported $bb(Q)$-valued functions on $cal(X)_D$ satisfying

#[#set math.equation(numbering: n => "(1.2)")
 $ integral_(U \( F \) without U \( bb(A)_F \)) f \( u g \) thin d u = 0 $ <intro:cuspidality>]

for every proper $F$-parabolic subgroup $P subset G$, its unipotent radical $U$, and every $g in G \( bb(A)_F \)$. This condition is independent of the nonzero normalization of $d u$. For a prime $ell eq.not "char" \( bb(F)_q \)$, put

$ C_(D \, ell) = overline(bb(Q))_ell ⊗_(bb(Q)) C_(D \, bb(Q)) . $

All these cusp spaces at fixed level are finite dimensional.

Fix the pinned split rational form of the dual group $hat(G)$, with Lie algebra $hat(frak(g))$, and the rational conventions of #cite(label("GLR")) Sections 3.1.1 and 3.4.1–3.4.3. For a nilpotent $hat(G)$-orbit $cal(O) subset hat(frak(g))$, choose a Jacobson–Morozov homomorphism

$ phi.alt_(cal(O)) : upright("SL")_2 arrow.r hat(G) \, #h(2em) H_(cal(O)) = Z_(hat(G)) #scale(x: 120%, y: 120%)[\(] phi.alt_(cal(O)) \( upright("SL")_2 \) #scale(x: 120%, y: 120%)[\)] . $

The centralizer $H_(cal(O))$ may be disconnected. Define $H_(cal(O))^c \( overline(bb(Q)) \)$ to consist of its semisimple algebraic points whose images under every embedding $overline(bb(Q)) arrow.r.hook bb(C)$ are conjugate into a maximal compact subgroup of $H_(cal(O)) \( bb(C) \)$. For a prime power $r$, write

#[#set math.equation(numbering: n => "(1.3)")
 $ r_(cal(O)) & = phi.alt_(cal(O)) mat(delim: "(", r^(1 \/ 2), 0; 0, r^(- 1 \/ 2)) \,\
R_(r \, cal(O)) & = "image" (r_(cal(O)) H_(cal(O))^c \( overline(bb(Q)) \) arrow.r \( hat(G) \/ #h(-0.16667em) \/ "Ad" \( hat(G) \) \) \( overline(bb(Q)) \)) . $ <intro:orbit-spectrum>]

We fix compatible square roots and use the rational Satake normalization of #cite(label("GLR")) Equation (3.2). Changing a square root multiplies the displayed factor by $phi.alt_(cal(O)) \( - I \)$, a finite-order element of $H_(cal(O))$, and does not change the set in Equation (1.3).

For a closed point $x in.not "supp" \( D \)$, put $d_x = \[ k \( x \) : bb(F)_q \]$ and $q_x = q^(d_x)$. Its spherical Hecke algebra is

$ A_x = "Funct"_c #scale(x: 120%, y: 120%)[\(] G \( cal(O)_x \) without G \( F_x \) \/ G \( cal(O)_x \) \, bb(Q) #scale(x: 120%, y: 120%)[\)] \, $

with Haar measure normalized by $"vol" \( G \( cal(O)_x \) \) = 1$. We regard each character of $A_x$ over $overline(bb(Q))$ as a semisimple dual-group conjugacy class by this fixed Satake convention.

Define $C_(D \, cal(O) \, bb(Q)) subset C_(D \, bb(Q))$ by the following spectral-support condition: for every $x in.not "supp" \( D \)$, every character occurring in

$ overline(bb(Q)) ⊗_(bb(Q)) A_x f $

has Satake class in $R_(q_x \, cal(O))$. Set $C_(D \, cal(O) \, ell) = overline(bb(Q))_ell ⊗_(bb(Q)) C_(D \, cal(O) \, bb(Q))$. The same orbit is required at all good points.

#thm([Theorem 1.1.])[
  #emph[For every $X \, G \, D \, ell$ as above, the natural addition maps 
#[#set math.equation(numbering: n => "(1.4)")
 $ xor.big_(cal(O)) C_(D \, cal(O) \, bb(Q)) arrow.r^(med tilde.op med) C_(D \, bb(Q)) \, #h(2em) xor.big_(cal(O)) C_(D \, cal(O) \, ell) arrow.r^(med tilde.op med) C_(D \, ell) $ <intro:decomposition>]

 are isomorphisms. The sums range over the nilpotent orbits of $hat(G)$.]
] <main:decomposition>

Taking $D = 0$ resolves Conjecture 3.4.6 of Gaitsgory–Lafforgue–Raskin positively, as well as its equivalent rational form, Conjecture 3.4.5. Theorem 1 also establishes the stated finite-level extension. The compactness in Equation (1.3) is the archimedean condition at every embedding; no extra nonarchimedean condition is included.

=== 1.2 Generic cuspidal representations <generic-cuspidal-representations>

For a split group, fix a Borel subgroup with unipotent radical $N$. A local representation of $G \( F_x \)$ is #emph[generic] if it admits a nonzero Whittaker functional for a nondegenerate character of $N \( F_x \)$. A cuspidal automorphic representation is #emph[globally generic] if one of its vectors has a nonzero global Whittaker coefficient for a nondegenerate character of $N \( F \) without N \( bb(A)_F \)$. The generalized Ramanujan conjecture predicts that globally generic cuspidal representations are tempered at every place #cite(label("CiubotaruHarris")) Section 1.1. We obtain its unramified assertion in the following scope, with genericity required at only one unramified place.

#thm([Corollary 1.2.])[
  (Unramified generalized Ramanujan).  #emph[Let $F$ be the function field of a smooth projective geometrically connected curve over a finite field, and let $G \/ F$ be split connected adjoint absolutely simple. Let $pi = ⨂'_x pi_x$ be a complex cuspidal automorphic representation of $G \( bb(A)_F \)$. If $pi_v$ is unramified and generic at one place $v$, then $pi_x$ is tempered at every place $x$ at which it is unramified. In particular, every globally generic cuspidal automorphic representation of $G \( bb(A)_F \)$ is tempered at every unramified place.]
] <main:generic-ramanujan>

Here unramified means spherical for a hyperspecial maximal compact subgroup. The conclusion is only about these local components. The proof, given at the end of Section 6, combines the common orbit with the local geometric-parameter criterion of Ciubotaru and Harris.

=== 1.3 Context <context>

The Langlands correspondence for general linear groups over function fields, established by Drinfeld in rank two and by Laurent Lafforgue in general, gives the purity theorem used at the end of this proof #cite(label("LLafforgue")) Introduction and Theorem VII.6. Vincent Lafforgue’s construction of global parameters extends the parameterization of cuspidal functions to split reductive groups with arbitrary finite level #cite(label("VLafforgue")) Theorem 1.1. These results provide global parameters and control the weights of their general-linear constituents. The main issue here is to constrain the absolute-value part of an unramified dual-group parameter to the neutral cocharacter of a nilpotent orbit.

Gaitsgory–Lafforgue–Raskin connect nilpotent-orbit filtrations on automorphic functions with Hecke spectral support and formulate the rational and $ell$-adic cusp decompositions in #cite(label("GLR")) Section 3.4. Their Remark 3.4.7 identifies the latter as the $ell$-adic Ramanujan–Arthur conjecture. We address this spectral-support assertion directly.

Using the present decomposition at $D = 0$, the companion manuscript identifies each cuspidal canonical Arthur-filtration step with the scalar extension of the corresponding sum of the rational summands here, under its four characteristic hypotheses #cite(label("ArthurRationality")) Assumption 1.1 and Corollary 7.5. This is the common-scope form of #cite(label("GLR")) Conjectures 3.4.9 and 3.4.11.

Earlier function-field results constrain the unramified spectrum under additional local hypotheses. In characteristic greater than two, Sawin and Templier prove unramified temperedness under monomial geometric supercuspidality and base-change assumptions #cite(label("SawinTemplier")) Theorem 1.1; their Theorem 11.7 also shows that a cuspidal representation of a split semisimple group tempered at one unramified place is tempered at all such places. Ciubotaru and Harris obtain restrictions to complementary series indexed by nilpotent orbits, and generalized Ramanujan under additional local assumptions, from excursion parameters, Frobenius weights, and the spherical unitary dual #cite(label("CiubotaruHarris")) Theorems 1.11 and 5.4. Theorem 1 supplies the nilpotent-orbit restriction for the whole cuspidal space at full finite level. Corollary 2 uses their local criterion #cite(label("CiubotaruHarris")) Corollary 6.32(1): the algebraic $upright("SL")_2$ cocharacter in our decomposition makes the Satake parameter geometric, and the common orbit propagates the resulting temperedness without the additional tempered-place hypothesis of their global Theorem 5.4.

The geometric ingredients have a separate ancestry. Geometric Satake identifies spherical sheaves with representations of the dual group #cite(label("MV")); its derived form and the regular-sheaf and Springer calculations are due to Ginzburg, Bezrukavnikov–Finkelberg, and Arkhipov–Bezrukavnikov–Ginzburg #cite(label("GinzburgLoop")) #cite(label("BF")) #cite(label("ABG")). We use the enhanced arithmetic Satake formulation of Ben-Zvi–Sakellaridis–Venkatesh #cite(label("BZSV")) together with the tensor-product and trace formalism of Ben-Zvi–Francis–Nadler #cite(label("BFN")). Gaitsgory’s nearby-cycle construction supplies central sheaves #cite(label("GaitsgoryCentral")), and the Wakimoto filtration and its central compatibilities are developed by Arkhipov–Bezrukavnikov and, in the integral parahoric setting, Cass–van den Hove–Scholbach #cite(label("AB")) #cite(label("CvdHS")). Section 2 states the precise versions used here and proves the additional specialization, root-datum, and cyclic-transfer compatibilities needed for the argument.

=== 1.4 Proof strategy <proof-strategy>

The main intermediate result is local. An ordered Bernstein weight is a joint character of the commuting Iwahori translation operators, before passage to the Weyl-group quotient. If its absolute-value exponent is dominant and it occurs in the discrete automorphic spectrum, then it is a compact factor times a Jacobson–Morozov value (Theorem 25). We prove this by contradiction and induction on semisimple rank. For a hypothetical violating weight $t$ at $x$, choose a complex realization and write $lambda = log_(q_x) \| t \|$ in the dominant chamber; unitarity makes its central component zero. The contradiction comes from two degree bounds on the same spherical cohomological summand.

First, standard translations define bounded open shtukas that detect the prescribed ordered weight. A polynomial filter removes irrelevant continuous spectral families; induction gives a strict spectral gap for those that remain. The rotation trace identity then forces the weight to occur in compact cohomology. Deligne’s weight bound puts its degree at least $2 d_x chevron.l lambda \, mu chevron.r - C'$, where $mu$ is the translation weight and $C'$ is independent of $mu$. The occurrence itself, through integrality of Frobenius weights, also forces $lambda$ to be rational (Corollary 32). A fixed rational Weyl-invariant metric therefore lets us choose integral highest weights $mu = m lambda$ for sufficiently divisible positive integers $m$, including when $lambda$ lies on a chamber wall.

The Wakimoto filtration compares this translation cohomology with cohomology for the spherical Satake label of highest weight $mu$. Since $mu = m lambda$ is the unique weight maximizing pairing with $lambda$, its extreme part cannot cancel against another filtration term. The hyperspecial projections retain that part at a spherical level. There the categorical trace realizes the projection on complexes, and a finite specialization argument preserves its top nonzero cohomology. This produces the spherical summand on which both degree bounds can be compared.

The upper bound is prepared independently in Section 3. Derived Satake and the categorical trace calculation express the spherical trace as an equivariant module. Its group-valued trace variable $s in hat(G)$ and Lie-algebra variable $e in hat(frak(g))$ satisfy the derived relation

#[#set math.equation(numbering: n => "(1.5)")
 $ "Ad" \( s \) e = q_x e . $ <intro:resonance>]

At semisimple part $t$, the resonant space is $E_t = { e in hat(frak(g)) : "Ad" \( t \) e = q_x e }$. Uniform bounds from costandard translations and nef Springer line bundles pass, by Levi restriction and localization on opposite flags, to bounds on whole derived fibers, with degrees corrected by compatible $frak(s l)_2$-triples. A finite-orbit induction then gives the upper bound for equivariant modules satisfying these tests, without a coherence hypothesis. Applied to the summand just constructed, the two bounds on its top nonzero degree $N$ are

$ 2 d_x chevron.l lambda \, mu chevron.r - C' med lt.eq med N med lt.eq med C + max_(e in E_t) d_x chevron.l mu \, h_e chevron.r \, $

where $h_e$ is the neutral cocharacter of a compatible triple and $C \, C'$ are independent of $m$. On $mu = m lambda$, the difference of the leading terms is

$ 2 d_x m min_(e in E_t) parallel lambda - h_e \/ 2 parallel^2 . $

It is positive for a violating parameter, contradicting the two bounds as $m$ grows. This proves the local theorem.

Two parts of the argument can be used separately. Propositions 14 and 17 extract corrected fiber bounds for arbitrary equivariant modules from uniform flag tests. Lemma 24 compares two descent conditions by realizing a divisible rotation in a connected generalized Picard group and applying Lang’s theorem. The latter construction keeps the entire level modulus and treats arithmetic components of a splitting cover explicitly.

Finally, exact root equations for compatible triples show that the compact factor can be chosen algebraically and is compact at every complex embedding. Purity of the irreducible constituents of the global parameter makes the dominant neutral cocharacter independent of the good place. The finite rational Hecke algebra then gives the direct sum in Equation (1.4).

=== 1.5 Organization and conventions <organization-and-conventions>

Section 2 constructs the cyclic trace and records its Satake, central, and Springer descriptions. Section 3 proves the amplitude estimate. Section 4 proves the rotation trace identity with full finite level. Section 5 extracts the local constraint from the discrete spectrum. Section 6 proves Theorem 1 and deduces Corollary 2.

The local arguments are formulated for split connected reductive groups so that they apply inductively to Levi subgroups. Central degree is bounded modulo a discrete lattice where necessary. On the sheaf side the coefficients have characteristic zero, and all derived tensor products and fibers are retained. A complex realization is chosen only when absolute values are used. At a place of degree $d$, the Hecke parameter is $q^d$, while the global cohomological Frobenius has base $q$. Standard translations are used for the trace identity; costandard translations are used for upper amplitude estimates. The established sheaf-theoretic and spectral inputs are stated with their precise roles in the sections where they enter.

== 2 Local kernels and their Frobenius traces <sec:categorical>

We compare compact cohomology of Frobenius-fixed Hecke paths with dual-group geometry. The comparison has three outputs. At spherical level, the trace is a pairing with a dg module over the Koszul algebra for $"Ad" \( s \) e = q^d e$, where $s in hat(G)$ records transport around the degree-$d$ Frobenius cycle and $e$ is the Lie-algebra coordinate (Proposition 9). Nef line bundles on the Springer resolution give the costandard tests used to bound this pairing (Proposition 6). At Iwahori level, central kernels and their Wakimoto filtration give Hecke actions and transfers to spherical level (Proposition 8). The spherical description retains dg morphisms; the Iwahori Hecke-algebra action will be needed on cohomology.

All constructible categories in this section have their stable, $upright(bold(k))$-linear enhancements. Over a field of positive characteristic, $upright(bold(k)) = overline(upright(bold(Q)))_ell$. Comparisons with complex constructible sheaves are made with characteristic-zero coefficients. On the dual side put

$ S = "Sym" \( hat(frak(g))^(*) \[ - 2 \] \) . $

Thus a linear polynomial has cohomological degree $2$. Tensor products of dg modules are derived unless explicitly stated otherwise.

=== 2.1 Conventions and change of characteristic <conventions-and-change-of-characteristic>

Fix a split maximal torus, an alcove, and its standard parahorics. For parahorics $P \, Q$, write $cal(H)_(P \, Q)$ for the stable category of equivariant constructible complexes on $P without L G \/ Q$ generated by constant orbit complexes and having finite Schubert support. We use the usual convolution, with compact direct image, for which the point complex is the unit. The standard and costandard complexes on an Iwahori orbit of length $n$ are normalized as

$ Delta_w = \( j_w \)_(!) upright(bold(k)) \[ n \] \( n \/ 2 \) \, #h(2em) nabla_w = \( j_w \)_(*) upright(bold(k)) \[ n \] \( n \/ 2 \) . $

Fix a square root $q^(1 \/ 2)$. Geometric Frobenius acts on $upright(bold(k)) \( - 1 \)$ by $q$. Satake uses the usual correction of the commutativity constraint by the component parity, so that its target is ordinary $"Rep" \( hat(G) \)$.

#thm([Lemma 2.1.])[
  (Ordinary specialization).  #emph[For every prime $p eq.not ell$, the geometric characteristic-zero and $overline(upright(bold(F)))_p$ categories $cal(H)_(P \, Q)$ admit simultaneous enhanced equivalences preserving standard, costandard, and intersection complexes, convolution, and change of parahoric level. They also preserve restriction of equivariance from $L^(+) G$ to the pro-unipotent radical $I^u$ of an Iwahori, including the induced maps of mapping complexes. These are assertions about ordinary geometric categories; Weil structures will be specified separately.]
] <cat:specialization>

#proof[
  Use the split integral group with the given root datum and the strictly henselian trait $R = upright(bold(Z))_(\( p \))^(upright("sh"))$. Its closed geometric point is $overline(upright(bold(F)))_p$; its geometric generic point has characteristic zero. First forget the left parahoric equivariance. On each relative partial affine flag variety $L G_R \/ Q_R$, use its #emph[Iwahori-cell] stratification, whose strata are affine spaces over $R$, and let $cal(C)_R$ be the thick category generated by their relative standard constant complexes, with finite Schubert support. A parahoric orbit is a union of these cells, and its standard constant complex belongs to $cal(C)_R$ by localization. We do not regard parahoric orbits themselves as affine spaces.
  Here are the base-change hypotheses being used. Start the Tate lifts over $S_0 = "Spec" upright(bold(Z)) \[ 1 \/ ell \]$, which is an admissible base in #cite(label("RicharzScholbach")) Notation 2.1. In that paper’s Section 2.4 the target $T$ of a base change $T arrow.r S_0$ need only be Noetherian of finite Krull dimension. Thus its Lemma 2.12 applies to $T = "Spec" R$ and to both geometric fibers. It says that $*$-extension and $!$-restriction of a stratum commute with these pullbacks on the Tate lifts. Its proof first treats Iwahori cells and then obtains the parahoric version by localization. Realize these comparison maps in ordinary etale complexes. Transitivity gives the maps for restriction from $R$ to either fiber; closing their equivalence loci under cones and retracts gives the assertion on $cal(C)_R$. The same argument shows that restrictions and corestrictions to a fine cell lie in the thick category generated by its constant complex. No motivic $t$-structure or new Beilinson–Soulé assertion over $R$ is needed.
  On an affine stratum we have
  $ R Gamma \( upright(bold(A))_R^n \, upright(bold(k)) \) = upright(bold(k)) = R Gamma \( upright(bold(A))_(macron(eta))^n \, upright(bold(k)) \) = R Gamma \( upright(bold(A))_(macron(s))^n \, upright(bold(k)) \) . $
  Consequently fiber restriction identifies mapping complexes between objects generated by its constant complex. Induct on a finite closed union of strata containing the supports of $A \, B in cal(C)_R$. For a closed stratum $i : Z arrow.r.hook Y$ with complementary open $j : U arrow.r.hook Y$, the fiber sequence
  $ R "Hom"_Z \( i^(*) A \, i^(!) B \) arrow.r R "Hom"_Y \( A \, B \) arrow.r R "Hom"_U \( j^(*) A \, j^(*) B \) $
  and the boundary comparison prove full faithfulness on mapping complexes. Fiber restriction is essentially surjective on the specified categories because it contains their standard generators and preserves cones and retracts. This also proves compatibility with composition: the comparisons are induced by one enhanced restriction functor.
  Here is the equivariant version of this argument. On a bounded support choose a finite-type smooth quotient $K_R$ of the acting parahoric; its discarded kernel is split pro-unipotent and has trivial positive equivariant cohomology. Compatible quotients can be used for inclusions of parahorics and for $I^u subset L^(+) G$ #cite(label("RicharzScholbach")) Lemma 2.18. Each $K_R$ is an extension of a split reductive group by split unipotent groups. The cohomology of $K_R^a$ commutes with restriction to either geometric fiber: this follows from the Bruhat decomposition of its reductive quotient, homotopy invariance for the unipotent factors, and localization and duality for products of affine spaces and split tori. Compute equivariant mapping complexes by the bar presentation
  $ Y_R \, quad K_R times Y_R \, quad K_R^2 times Y_R \, quad dots.h . $
  At each simplicial degree use the strata $K_R^a times upright(bold(A))_R^n$ coming from the fine Iwahori cells of $Y_R$. The underlying coefficients in the bar calculation are pulled back from $Y_R$. The preceding recollement argument therefore applies, with the single-stratum calculation replaced by that for $K_R^a$. It gives an equivalence of the mapping complexes at that degree. Totalizing these equivalences gives the equivariant comparison. No exchange of a scalar extension with an infinite totalization is used. The common relative parahoric standard complexes are equivariant objects; their fiber restrictions generate the specified equivariant categories. Full faithfulness on the bar mapping complexes and closure under cones and retracts therefore give essential surjectivity on those categories as well. The maps of bar presentations for subgroup inclusions give the claimed compatibility with restriction of equivariance.
  Convolution is twisted exterior product followed by proper direct image on bounded supports. Smooth descent for the torsor defining the twisted product and proper base change therefore commute with fiber restriction. The comparison for all iterated products uses the same iterated convolution diagram and respects all associativity compatibilities. This is also the realized convolution comparison of #cite(label("RicharzScholbach")) Proposition 3.14 and Lemma 3.15. The argument applies to the smooth proper projections between the partial affine flags. The stratumwise perverse conditions agree on the two fibers: the restriction and corestriction degrees agree, and the relative cell dimensions are the same. The equivalence is therefore perverse $t$-exact and preserves intermediate extensions, hence intersection complexes. Wakimoto complexes are finite convolutions of standard and costandard complexes, so they are preserved as well.
  An algebraic closure of the generic field embeds in $upright(bold(C))$. On each finite support and each finite bar term, algebraically closed extension in characteristic zero is fully faithful on bounded constructible $overline(bb(Q))_ell$-complexes #cite(label("JKLMBaseChange")) Lemma A.1. The etale–Betti comparison is likewise fully faithful #cite(label("SunComparison")) Corollary 3.4.3, Proposition 3.5.9, and Remark 3.5.12. These comparisons use the derived pullback and site functors; their isomorphisms on Hom into every shift give the mapping-complex equivalences. Full faithfulness suffices here: the specified categories are generated from the matched standard complexes by finite cones and retracts. Comparing the same bar presentations at fixed coefficients before totalization gives the asserted characteristic-zero comparison. All constructions above use only $p eq.not ell$. ◻
]

#thm([Theorem 2.2.])[
  (Derived Satake with Frobenius).  #emph[The stable idempotent-complete tensor category generated by the normalized spherical Satake complexes is monoidally equivalent to 
$ "Perf"^(hat(G)) \( S \) . $

 The normalized Satake object $"Sat" \( V \)$ corresponds to $S ⊗ V$. With the split Weil structures, Frobenius pullback corresponds to extension of scalars by 
$ S arrow.r S \, #h(2em) alpha mapsto q alpha quad \( alpha in hat(frak(g))^(*) \[ - 2 \] \) \, $

 and acts trivially on the representation labels. These assertions include the enhanced monoidal structure and all morphisms between the indicated objects.]
] <cat:satake>

#proof[
  The geometric input for reductive groups is the monoidal dg equivalence of #cite(label("BZSV")) Theorem 6.6.1, which strengthens the monoidal triangulated calculation of #cite(label("BF")) Theorem 5. We use the corrected version of the latter paper; its purity and multiplicative formality construction is in #cite(label("BF")) Sections 6.5–6.6. The Galois-compatible formulation in #cite(label("BZSV")) Theorem 6.7.5 uses an arithmetic shearing. We verify below the split Weil normalization and dilation required here.
  The regular Satake Ext algebra is the graded equivariant algebra $"Sym" \( hat(frak(g))^(*) \)$, with its linear generators in degree $2$; the Ext spaces between the other Satake objects are
  $ "Ext"^bullet \( "Sat" \( V \) \, "Sat" \( W \) \) = \( S ⊗ V^(*) ⊗ W \)^(hat(G)) . $
  These identifications respect tensor products and composition. Lemma 3 carries the complete ordinary diagram of these calculations to every residue characteristic.
  For the Weil calculation we need pointwise purity. Over every finite field, the intersection complex of a split parahoric Schubert variety is very pure and Tate with semisimple Frobenius #cite(label("DCHL")) Section 1.2 and Theorem 2.2.1. That theorem is stated for arbitrary split connected reductive groups and all $p eq.not ell$. Writing $"IC"$ here for that paper’s unshifted complex, our normalization is $"IC" \[ d \] \( d \/ 2 \)$. It says that a stalk cohomology group in degree $a$ has Frobenius scalar $q^(a \/ 2)$. Normalized Verdier self-duality gives the same assertion for point costalks. On a smooth orbit of dimension $d_O$, the identity $x^(!) j^(!) B = \( j^(!) B \)_x \[ - 2 d_O \] \( - d_O \)$ then gives that scalar also on the degree-$b$ cohomology of the ordinary fiber of $j^(!) B$.
  The equivariant orbit filtration of a morphism complex has local terms computed from these restrictions and the cohomology of the split orbit stabilizer $H$. Its reductive quotient is a split Levi, and the remaining unipotent factors are cohomologically trivial; $H^c \( B H \)$ is Tate with scalar $q^(c \/ 2)$. A local term
  $ "Hom" \( H^a \( A_x \) \, H^b \( \( j^(!) B \)_x \) \) ⊗ H^c \( B H \) $
  therefore has degree $b - a + c$ and scalar $q^(\( b - a + c \) \/ 2)$. All spectral-sequence differentials vanish by their distinct weights. This proves purity and the semisimplified scalar on the Ext groups; it alone does not exclude extensions of equal-weight Frobenius modules. On a degree-two adjoint generator the scalar is nevertheless exactly $q$: its semisimplification is $q$, and it commutes with $hat(G)$; each simple adjoint summand occurs once. On the central summand the generators are the first Chern classes of the split torus, on which Frobenius is also exactly $q$. This determines Frobenius on the generated algebra. The corresponding goodness statement for convolution #cite(label("DCHL")) Corollary 2.2.3, together with the perversity of spherical convolution, makes its normalized tensor multiplicity spaces Tate of weight zero with trivial Frobenius. Thus the canonical top-cell Weil structures give the split Satake tensor identifications used above.
  For clarity, formality can be applied to this entire diagram at once. For a mixed morphism complex $C = xor.big_w C_w$, use the multiplicative intermediate complex
  $ xor.big_w tau_(lt.eq w) C_w . $
  Its inclusion into $C$ and its projection to $xor.big_w H^w \( C_w \)$ are quasi-isomorphisms. Here $C_w$ denotes the generalized weight summand; no semisimplicity of an arbitrary pure Weil complex is being inferred. Composition and tensor product add weights and degrees, so these quasi-isomorphisms are compatible with every composition and tensor operation. They are Frobenius-equivariant. Closing this enhanced diagram under finite cones and retracts gives the assertion. Only its associative monoidal structure is required below. ◻
]

=== 2.2 Central kernels and Springer tests <central-kernels-and-springer-tests>

Let $Lambda = X_(*) \( T \) = X^(*) \( hat(T) \)$. We call the chamber in which $J_a$ is standard the positive translation chamber. The opposite chamber is the costandard chamber. A line bundle on the dual flag variety is denoted $cal(O) \( eta \)$ with the convention that this costandard chamber is its nef chamber.

#thm([Theorem 2.3.])[
  (Central and Wakimoto kernels).  #emph[There is a tensor functor to the Drinfeld center of the homotopy category 
$ Z : "Rep" \( hat(G) \) arrow.r cal(Z) \( "Ho" \( cal(H)_(I \, I) \) \) $

 with its split Weil structure. Its interchanges are compatible with projection to every standard parahoric. At a hyperspecial parahoric the projected functor is Satake.]
  #emph[There are invertible kernels $J_a$, $a in Lambda$, with coherent multiplication $J_a star.op J_b tilde.eq J_(a + b)$. They are standard on the positive chamber and costandard on its opposite. The central object $Z \( V \)$ has a finite functorial Wakimoto filtration, tensor compatible in $V$, with 
$ "gr"_a Z \( V \) = J_a ⊗ V_a . $

 Its induced central interchange with $J_b$ is the ordinary interchange of the two translation factors and the identity on the multiplicity space, with the fixed Satake parity convention. The multiplicity spaces have trivial semisimplified Frobenius. These statements hold over every $upright(bold(F))_q$ under consideration. For a fixed central label, its interchange in the other kernel variable is a chosen natural equivalence of exact enhanced functors. We use the central tensor identities in the homotopy category; we do not assert an enhancement of $Z$ to an infinity-categorical Drinfeld center.]
] <cat:central>

#proof[
  The central construction and the Wakimoto filtration for every split reductive group over the base in question follow from #cite(label("CvdHS")) Theorem 1.4 and Theorem 5.24, by realization. The scope of its centrality assertion is exactly the homotopy category. More precisely, its Theorem 4.38 constructs the two natural maps in its Equation (4.7) from the enhanced nearby-cycles and convolution functors, using Lemma 4.20 and Theorem 4.36(3). For a fixed central label these give the stated natural equivalence of exact functors in the other kernel variable, so it applies to an actual cofiber diagram. Theorem 4.38 supplies the homotopy hexagon, and Theorem 4.41 the homotopy tensor compatibility. These finite identities are the ones needed for products of character operators on cohomology below. The maps are defined over $upright(bold(F))_q$ and carry their actual Weil structures, after fixing the nearby-cycles Frobenius lift.
  We record explicitly the graded-interchange argument, to include all root data. The Wakimoto graded category is the category of $Lambda$-graded vector spaces, and the graded central functor has the weights of restriction from $hat(G)$ to $hat(T)$. For every dominant character $lambda$ of the actual torus there is its highest-weight quotient to the line labelled by $J_lambda$. On this quotient the central interchange is the ordinary interchange: restrict the fusion diagram to the open Cartan-position cell, where the sheaves are normalized constants and the quotient is the highest-line restriction. The two tensor generators are interchanged there, with exactly the fixed Satake parity correction. Naturality and the central tensor identity now imply the same interchange for an arbitrary central label with $J_lambda$. Indeed the two opposite central interchanges have product one, and passage to this quotient identifies one of them with the ordinary interchange, so identifies the other with its inverse. This is the argument of #cite(label("AB")) Lemma 18 and Section 3.6.6, Equation (21). Dominant characters generate $Lambda$ as a group. Tensor compatibility and invertibility of the $J_lambda$ extend the assertion to every $lambda$. The argument uses the actual character lattice, and applies to products and central torus factors as stated. Its top-cell maps are defined over $upright(bold(F))_q$, so it preserves the specified normalization and Weil maps. Projection compatibility follows from proper base change for the nearby-cycles construction: the projection of flag levels is a smooth proper flag fibration, and the commutation before taking nearby cycles is the commutation of modifications at disjoint points. Using the same multiple-point diagram makes these compatibilities simultaneous for all the parahorics and all products.
  The split Weil multiplicities can also be checked without any choice of splitting of the filtration. The trace of the central object is the Bernstein central character, over each finite extension. The Wakimoto trace functions are linearly independent. Consequently all power traces on $V_a$ equal $dim V_a$; their semisimplified eigenvalues are one. This statement permits unipotent extensions, which do not affect the eigenvalue separations used later. ◻
]

#thm([Proposition 2.4.])[
  (The spherical Springer test).  #emph[Let $"For"$ forget $L^(+) G$-equivariance to $I^u$-equivariance on $"Gr"_G$, without changing the underlying complex, and let $"Av"_(*)$ be its right adjoint. Put $W_eta = J_eta star.op delta_0$. For every integral weight $eta$ in the closed costandard chamber, derived Satake identifies 
$ "Av"_(*) W_eta quad upright("with") quad #scale(x: 120%, y: 120%)[\(] R pi_(*) cal(O)_(tilde(cal(N))) \( eta \) #scale(x: 120%, y: 120%)[\)]_(upright("sh")) \, #h(2em) pi : tilde(cal(N)) arrow.r hat(frak(g)) . $

 The subscript means that coherent degree $a$ and polynomial degree $b$ are assigned total degree $a + 2 b$. This is an equivalence of ordinary equivariant dg $S$-modules. The $S$-action is polynomial restriction along $pi$, and the assertion is compatible with tensoring by representations and with all morphisms between free Satake labels. The displayed convention introduces no extra shift. Any smooth-pullback normalization of $"For"$ changes the formula only by a fixed shift and Tate twist, independent of $eta$.]
] <cat:springer>

#proof[
  We give the algebra-to-module calculation, including its root-datum and equivariance conventions. Let $cal(R)$ be the regular Satake ind-object. Its second regular action gives the $hat(G)$-action on the following algebras and modules. The regular calculations are
  $ "Ext"_(L^(+) G)^bullet \( delta_0 \, cal(R) \) = S \, #h(2em) "Ext"_(I^u)^bullet \( delta_0 \, cal(R) \) = upright(bold(k)) \[ cal(N) \]_(upright("sh")) \, $
  and the Wakimoto calculation for nef weights, including its products, is
  #[#set math.equation(numbering: n => "(2.1)")
   $ xor.big_(eta med upright("nef")) "Ext"_(I^u)^bullet \( delta_0 \, J_eta star.op cal(R) \) tilde.eq (xor.big_(eta med upright("nef")) Gamma \( tilde(cal(N)) \, cal(O) \( eta \) \))_(upright("sh")) . $ <cat:section-algebra>]
  The algebra calculation is #cite(label("ABG")) Theorems 7.3.1 and 7.6.1; the section algebra and its product maps are #cite(label("ABG")) Theorem 8.5.2 and Equations (8.7.2)–(8.7.8). We explain why using the actual lattice $Lambda$ entails no isogeny restriction here. Wakimoto inversion identifies the left side for $eta$ with the appropriate fixed-point costalk of $cal(R)$. Its cohomological filtration is the principal-nilpotent filtration on the $- eta$ weight space of $upright(bold(k)) \[ hat(G) \]$. The fixed-point and filtration assertions of #cite(label("GinzburgLoop")) Propositions 5.5.2 and 5.6.2 are stated for the full cocharacter lattice of an arbitrary semisimple group. The section-filtration identification used in #cite(label("ABG")) Equations (8.6.2)–(8.6.3) applies to every dominant character of the actual dual torus. Multiplication of the regular representation, followed by the fixed-point-to-convolution base-change maps in #cite(label("ABG")) Equations (8.7.6)–(8.7.8), identifies the products in Equation (2.1). This proves the required calculation for every semisimple isogeny type, without an assertion about all objects in a generalized ABG equivalence.
  For a torus the calculation is immediate: its Grassmannian is $Lambda$, its pro-unipotent group is cohomologically trivial, and the algebra map is $"Sym" \( "Lie" \( hat(T) \)^(*) \[ - 2 \] \) arrow.r upright(bold(k))$. For a general reductive group, perform the characteristic-zero calculation using its central isogeny to the product of its adjoint group and its abelianization. Each Grassmannian component identifies with the corresponding component in that product; finite central kernels have trivial positive cohomology with these coefficients. On the dual side this restricts the regular representation and its products to the prescribed central-character lattice. It therefore restricts precisely the preceding section-algebra calculation. Central translations have length zero, and central linear variables map to zero. Finally Lemma 3 transports this ordinary enhanced diagram, including the forgetful map of algebras and the module action, to every $p eq.not ell$. The regular ind-object causes no problem: mapping out of the point in these Ind-completions commutes with its filtered union.
  We now identify the polynomial map. The equivariant-cohomology spectral sequence for the regular internal Hom has second page
  $ H^bullet \( B G \) ⊗ "Ext"_(I^u)^bullet \( delta_0 \, cal(R) \) . $
  Both factors are even, so its edge map induces
  $ upright(bold(k)) ⊗_(H^bullet \( B G \)) "Ext"_(L^(+) G)^bullet \( delta_0 \, cal(R) \) tilde.eq "Ext"_(I^u)^bullet \( delta_0 \, cal(R) \) . $
  Freeness over $H^bullet \( B G \)$ follows by lifting a homogeneous basis on this second factor and comparing its associated graded. Taking $hat(G)$-invariants identifies $H^bullet \( B G \)$ with $S^(hat(G))$, since the invariant part of $cal(R)$ is the unit. The map thus has kernel $S \( S^(hat(G)) \)_(> 0)$ and is restriction to the nilpotent cone. On degree-two simple adjoint factors its identification differs from the usual one at most by nonzero scalars, by equivariance and surjectivity. Absorb these constant scalars in the choice of coordinates; they commute with the Frobenius dilation. This also identifies the action on each module in Equation (2.1).
  The comparisons just used are comparisons of dg modules. In characteristic zero the simultaneous purity construction of #cite(label("ABG")) Proposition 9.5.2 and Lemma 9.5.3, or the multiplicative weight truncation in Theorem 4, formalizes the algebra, its map, and its positive modules together. The ordinary enhanced specialization carries that diagram to the desired characteristic. No identification of an arbitrary Weil structure on a Springer test is needed for the present assertion.
  For every finite-dimensional $V$, adjunction now gives
  $ R "Hom" \( "Sat" \( V \) \, "Av"_(*) W_eta \) & tilde.eq R "Hom" \( "For" "Sat" \( V \) \, W_eta \)\
 & tilde.eq #scale(x: 120%, y: 120%)[\(] R Gamma \( tilde(cal(N)) \, V^(*) ⊗ cal(O) \( eta \) \) #scale(x: 120%, y: 120%)[\)]_(upright("sh"))^(hat(G))\
 & tilde.eq R "Hom"_(S \, hat(G)) \( S ⊗ V \, \( R pi_(*) cal(O) \( eta \) \)_(upright("sh")) \) . $
  For every nef $eta$, including walls, the higher line-bundle cohomology vanishes by #cite(label("Broer")) Theorem 2.4 and Remark 2.7(2). Thus the section-module computation indeed computes the derived pushforward appearing here. This use of vanishing is entirely on the characteristic-zero dual side. The polynomial computation proves naturality in all morphisms between the free labels, which compactly generate. Yoneda proves the asserted equivalence. The pushforward is coherent on the smooth affine space $hat(frak(g))$; an equivariant graded finite free resolution, followed by shearing, shows that it is a perfect $S$-module.
  Finally our forgetful functor preserves the underlying sheaf. If one instead uses $"For" \[ c \] \( c \/ 2 \)$, its right adjoint is $"Av"_(*) \[ - c \] \( - c \/ 2 \)$. The integer $c$ is the dimension fixed by that change of level, independently of $eta$. ◻
]

=== 2.3 The geometric cyclic functor <the-geometric-cyclic-functor>

Bundle stacks below may have fixed full congruence level away from the selected legs and fixed parahoric level at them. They may also be divided by a discrete lattice of central modifications, as in Section 4. At a closed place every geometric leg is retained, with Frobenius cyclically permuting them. A kernel may change these levels. It always has bounded relative position.

For a composite kernel $L$ on a bundle stack $cal(B)$, define

$ sans(K) \( L \) = R Gamma_c \( cal(B) \, "Graph" \( upright("Fr") \)^(*) L \) . $

Equivalently this is compact cohomology of the stack of paths from $P$ to $zws^(upright("Fr")) P$, with all intermediate bundles and all Hecke coefficients retained. Fixed kernels at other places may be included in every path. Compact cohomology of a locally finite type stack is the colimit over finite-type open substacks, using extension by zero.

#thm([Proposition 2.5.])[
  (Coherent path rotation).  #emph[The preceding construction is an exact enhanced Frobenius-twisted cyclic functor. Put $Phi = upright("Fr")^(*)$ on local kernels. With convolution ordered in the direction of the path, its cyclic maps are 
#[#set math.equation(numbering: n => "(2.2)")
 $ rho_(U \, V) : sans(K) \( U star.op V \) arrow.r^tilde.op sans(K) \( Phi \( V \) star.op U \) . $ <cat:last-first>]

 They are natural in all enhanced morphisms and coherently compatible with units, iterated products, and change of level. Here $rho_(U \, upright(bold(1)))$ is the identity. The full slide $rho_(upright(bold(1)) \, V) : sans(K) \( V \) arrow.r sans(K) \( Phi V \)$, followed by the Weil structure of $V$, is cohomological Frobenius. Slides at disjoint sets of legs commute; their product is the full slide.]
] <cat:cyclic>

#proof[
  For two kernels, the path description is
  $ \( P \, Q \; med U \( P \, Q \) \, med V \( Q \, zws^(upright("Fr")) P \) \) . $
  Rotating the first step sends $\( P \, Q \)$ to $\( Q \, zws^(upright("Fr")) P \)$. To obtain pullback in that direction use its inverse, which sends $\( P \, Q \)$ to $\( zws^(upright("Fr")^(- 1)) Q \, P \)$. The two coefficients on this rotated path are $Phi \( V \) \( zws^(upright("Fr")^(- 1)) Q \, P \)$ and $U \( P \, Q \)$. This is precisely Equation (2.2). In this description $upright("Fr")^(- 1)$ may be interpreted on perfections. Etale constructible sheaves and their compact direct images are invariant under the resulting universal homeomorphisms, so the construction also defines the same map before perfection.
  For any finite list of kernels use the stack of all its intermediate bundles. Multiplication forgets an intermediate bundle, a unit repeats one, and rotation moves an end bundle through Frobenius. The identities between these operations are identities of the corresponding path diagrams. Applying compact direct image, base change, and the projection formula in the enhanced six-operation formalism preserves these identities coherently. The required precise finite-type foundations are the enhanced adic operations and their base-change and projection formula compatibilities in #cite(label("LiuZheng")) Section 7.1 and Theorem 7.2.7.
  One can express the coherence as a balanced bar construction. In simplicial degree $n$ retain all intermediate kernels in the path; inner faces compose adjacent kernels, degeneracies insert units, and the end face is the rotation just described. Their common refinements are again the same path stack, which supplies every simplicial identity and its higher compatibility. This verifies coherence in the enhancement, rather than only pairwise isomorphisms in its homotopy category.
  The same reasoning applies to the locally finite type stack. A fixed finite diagram uses finitely many bounded kernels. The image and inverse image of a finite-type bounded open under the relevant bounded-position maps are contained in some larger finite-type bounded open. Thus that diagram is computed on a finite-type stage, after enlarging stages when necessary. The finite-type maps are compatible under extension by zero, so their filtered colimit preserves the same identities. Central-lattice quotients are treated by the corresponding locally finite sums of these diagrams.
  When $U = upright(bold(1))$, inverse rotation of the path is $upright("Fr")^(- 1)$. Its compact direct image is pullback by $upright("Fr")$. Composing with the Weil structure is therefore exactly cohomological Frobenius. Moving disjoint groups of labels gives commuting rotations of the common path diagram, with product the complete rotation. ◻
]

=== 2.4 Hecke characters and finite flag transfers <hecke-characters-and-finite-flag-transfers>

If $U$ is a rigid Weil kernel with left dual $U^or$ and with an interchange $U star.op L tilde.eq L star.op U$, define its character operator on $sans(K) \( L \)$ by

#[#set math.equation(numbering: n => "(2.3)")
 $ sans(K) \( L \) & arrow.r sans(K) \( L star.op U^or star.op U \) arrow.r^rho sans(K) \( Phi U star.op L star.op U^or \)\
 & arrow.r sans(K) \( U star.op L star.op U^or \) arrow.r sans(K) \( L star.op U star.op U^or \) arrow.r sans(K) \( L \) . $ <cat:character>]

The arrows use coevaluation, rotation, the Weil structure, interchange, and evaluation, respectively. We denote this operator by $chi_U$. The same formula for a rigid kernel between two different levels is called transfer. The individual formula is a morphism of complexes. The Iwahori Hecke-algebra action asserted next is its action on $H^bullet sans(K) \( L \)$; no enhanced action of that algebra is deduced from the homotopy central functor.

#thm([Proposition 2.6.])[
  (Hecke action and transfer).  #emph[Suppose that $L$ has a central label at a closed place $x$. The operators in Equation (2.3) give the usual affine Hecke algebra at $x$, with parameter $q_x$, on $H^bullet sans(K) \( L \)$. They give ordinary Hecke operators on $H^bullet sans(K) \( upright(bold(1)) \)$.]
  #emph[More explicitly, let $H_w$ denote the operator with characteristic function $1_(I w I)$ and Iwahori volume one. Then 
$ H_s^2 = \( q_x - 1 \) H_s + q_x \, #h(2em) H_w H_(w') = H_(w w') quad upright("if ") ell \( w w' \) = ell \( w \) + ell \( w' \) . $

 The positive normalized Bernstein translations are 
#[#set math.equation(numbering: n => "(2.4)")
 $ T_a = \( - 1 \)^(ell \( t^a \)) chi_(J_a) \, #h(2em) T_a = q_x^(- ell \( t^a \) \/ 2) H_(t^a) quad \( a upright(" positive") \) \, $ <cat:translation-sign>]

 and extend multiplicatively to the entire translation lattice.]
  #emph[For a standard parahoric $P supset I$, its two level transfers identify the hyperspecial or parahoric trace cohomology with the image of 
$ e_P = (sum_(w in W_P) q_x^(ell \( w \)))^(- 1) sum_(w in W_P) H_w . $

 At hyperspecial level the spherical character action agrees with the Bernstein center. The individual-leg slides commute with these actions and transfers. On the Wakimoto graded terms the Bernstein action is the translation action tensored with the weight multiplicities in Theorem 5. The Wakimoto filtration gives long exact sequences equivariant for these Bernstein translations and for the selected-leg slides. Its graded terms carry the stated translation action. Thus flat completion, ordered-weight projections, and spectral projectors may be applied to these cohomology sequences.]
  #emph[There is also the following geometric form of the rank-one assertion. If an exact translation position is parallel to the simple wall of $s$, the operator $H_s + 1$ on its path trace is pullback and sum along the finite etale family of Frobenius-fixed rank-one refinement flags, of degree $q_x + 1$. Consequently $H_s$ takes the sum over the other flags.]
] <cat:hecke>

#proof[
  The kernels in use are rigid. Standard simple kernels are invertible with inverse the corresponding costandard kernel; length-zero kernels are invertible as well. Finite standard filtrations, cones, and retracts preserve dualizability. The projection kernels have the pullback and proper-direct-image adjunctions of the smooth proper flag projection.
  The character formula is multiplicative under convolution: the coevaluation for a product is the composite of its two coevaluations, and the cyclic and interchange identities move the two factors successively. Applying the triangle identities then gives the product of their characters on cohomology. This uses only the homotopy hexagon and tensor identities specified in Theorem 5. For additivity, fix the central label $L$ and apply its chosen natural equivalence of exact enhanced functors to the cofiber diagram of the test kernels. This supplies a morphism of that cofiber diagram, not merely unrelated maps on its three objects. On a mapping-cone model the interchange is triangular with respect to the two summands, while coevaluation and evaluation pair equal summands. The two diagonal contributions are the character of the second term and the negative of the character of the first term. This also explains why shifts give their usual alternating signs.
  For the quadratic relation use the unshifted closed kernel $C_s = upright(bold(k))_(P_s \/ I)$, where $P_s \/ I tilde.eq upright(bold(P))^1$. Convolution through the partial level gives
  $ C_s star.op C_s tilde.eq R Gamma \( upright(bold(P))^1 \, upright(bold(k)) \) ⊗ C_s . $
  The open–closed triangle gives $chi_(C_s) = H_s + 1$. The Weil trace of $R Gamma \( upright(bold(P))^1 \, upright(bold(k)) \)$ at $x$ is $1 + q_x$. Thus $\( H_s + 1 \)^2 = \( 1 + q_x \) \( H_s + 1 \)$, the asserted relation. Length-additive convolution of open cells is an isomorphism, giving the length and braid relations. For a degree-$d_x$ place, all kernels are external products on its geometric legs with cyclic Frobenius. The trace of a graded cycle on $C^(⊗ d_x)$ is the trace of the composite Frobenius on $C$; hence the parameter is $q^(d_x)$. The same identity shows that a shifted simple or translation kernel contributes its single-factor sign $\( - 1 \)^(ell \( t^a \))$, not a spurious sign depending on the number of geometric legs. This proves Equation (2.4). Length parity is a character of the translation lattice, so multiplicativity is preserved.
  At $L = upright(bold(1))$ the path stack is the Frobenius-fixed bundle groupoid. On it, the unit, counit, and Weil structure in Equation (2.3) sum the stalk traces over the Hecke correspondence, with its stack multiplicities. This is the ordinary action on compactly supported functions on the rational bundle groupoid. The construction for other central labels uses the same diagrams and their central interchange, so the verified relations apply there as well.
  For general $P$ repeat the closed-kernel computation with the full flag $P \/ I$. Connected transition groups act trivially on its cohomology, so its cohomology is the constant Tate complex with Frobenius trace $c_P = sum_(w in W_P) q_x^(ell \( w \))$. The composite of the two transfers at the $P$-level is multiplication by $c_P$; the opposite composite is $sum_(w in W_P) H_w$. Since $c_P eq.not 0$, the two normalized transfers give the stated idempotent identification. Theorem 5 identifies the projected central kernel with Satake at a hyperspecial level. Trace additivity on its Wakimoto filtration then gives the usual Bernstein central character, which proves compatibility of the spherical action.
  We spell out the assertion about parallel walls, which is needed for a geometric correspondence later. For a translation $t^a$ parallel to the $s$ wall, its character on the rank-one root subgroup has valuation zero. Thus the exact partial relative position identifies the rank-one refinement flag at the two ends. On the Frobenius path stack the allowed flags are the fixed flags of that semilinear identification. They form a finite etale family $Z arrow.r Y$ of degree $q_x + 1$. The closed kernel factors through the partial level, and its character factors through the two transfer maps. Those maps are the pullback and sum for $Z arrow.r Y$. Indeed, smooth proper base change reduces the unit/counit calculation to the diagonal of $upright(bold(P))^1$ and the graph of its twisted Frobenius. Their intersections are transverse: Frobenius has zero tangent map and the diagonal contributes the identity. Every fixed flag therefore has coefficient one. Etale locally on $Y$, where $Z$ is a disjoint union of sections, the resulting maps are the diagonal map and the sum map between constant coefficient complexes. They agree on overlaps and hence descend. This calculation is unchanged after tensoring with the coefficient pulled back from the partial path stack, or after retaining automorphisms of the bundles. Subtracting the diagonal, by the open–closed triangle, gives the other-flags operator $H_s$.
  Finally, naturality of full rotation makes Frobenius commute with every Weil Hecke action. A slide at an auxiliary disjoint place commutes with this action by its common disjoint-leg diagram. Dividing the full slide by the other, invertible slides proves the same assertion for the selected-leg slide. Projection transfers use those same diagrams. The graded translation assertion follows from the map compatibility in Theorem 5. More explicitly, those filtered interchanges and rotation maps commute with the inclusion, quotient, and connecting maps of each successive filtration triangle. Applying cohomology gives the asserted equivariant long exact sequences. This is all the filtration compatibility needed here; it does not require an action on a derived completion of the Iwahori trace. ◻
]

Whenever an unqualified equality between a translation slide and Frobenius is used below, the large translation labels are chosen divisible by an even integer. Their length parity then vanishes. The weights of a representation with such an extremal label have the same even parity, since their differences are roots of the dual group. Filter translations remain arbitrary and always use the explicit normalization in Equation (2.4).

=== 2.5 The algebra of a twisted loop <the-algebra-of-a-twisted-loop>

The final local calculation is given in terms of dg algebras, so positive cohomological polynomial degrees cause no connectivity assumption. It applies to the entire compact cohomology functor, including fixed disjoint kernels. Its enhanced input is derived spherical Satake and the coherent path functor, independently of the homotopy central functor at Iwahori level.

#thm([Proposition 2.7.])[
  (Spectral form of a Frobenius trace).  #emph[At a hyperspecial closed-place leg of degree $d$, the functor $sans(K)$ on perfect spherical labels has the form 
#[#set math.equation(numbering: n => "(2.5)")
 $ sans(K) \( P \) tilde.eq (cal(A) ⊗_(B_(q^d)) \( B_(q^d) ⊗_(S^(⊗ d)) P \))^(hat(G)) \, $ <cat:loop-pairing>]

 where $cal(A)$ is an equivariant dg module, with no coherence or boundedness assumption. After eliminating intermediate factors, the algebra is 
#[#set math.equation(numbering: n => "(2.6)")
 $ B_r = cal(O) \( hat(G) \) ⊗ "Sym" \( hat(frak(g))^(*) \[ - 2 \] xor hat(frak(g))^(*) \[ - 1 \] \) \, #h(2em) r = q^d . $ <cat:loop-algebra>]

 Write $s$ for its degree-zero holonomy variable and $e$ for its degree-two linear variable. The second summand supplies odd Koszul generators $eta_alpha$ of degree $1$, with 
#[#set math.equation(numbering: n => "(2.7)")
 $ d eta_alpha = chevron.l alpha \, "Ad" \( s \) e - q^d e chevron.r . $ <cat:holonomy>]

 The group acts by simultaneous conjugation.]
  #emph[The $d$-fold selected-leg slide on representation labels is the action of $s$ on each factor. Spherical Hecke characters act by the corresponding invariant characters of $s$. On cohomology these descriptions agree with the transfers in Proposition 8. A degree-two morphism linear in the selected $e$ variable multiplies the corresponding slide eigenvalue by $q^d$. All statements are natural in perfect labels and their dg morphisms.]
] <cat:loops>

#proof[
  Put $cal(C) = "Mod"_S \( D \( "Rep"_(upright("rat")) \( hat(G) \) \) \)$ and let $Phi_r$ be extension of scalars by $alpha mapsto r alpha$. The free objects $S ⊗ V$ are compact, dualizable generators: rational invariants of a reductive group in characteristic zero are exact and commute with direct sums #cite(label("MilneAlgebraicGroups")) Remark 15.13 and Proposition 15.16. Thus this category is the Ind-completion of its perfect objects.
  We first calculate the universal trace for one factor. Let $cal(C)^e = cal(C) ⊗ cal(C)^(upright("rev"))$. Use the regular right action $L dot.op \( P \, Q \) = Q ⊗ L ⊗ P$ and the twisted left action $\( P \, Q \) dot.op M = Phi_r \( P \) ⊗ M ⊗ Q$. The pairing $\( L \, M \) mapsto sans(K) \( M ⊗ L \)$ is coherently balanced: the balancing map is precisely
  $ sans(K) \( M ⊗ Q ⊗ L ⊗ P \) arrow.r^rho sans(K) \( Phi_r \( P \) ⊗ M ⊗ Q ⊗ L \) . $
  Proposition 7 verifies all the bar identities. Consequently $sans(K)$ extends to a continuous functional on the relative tensor product of these two module categories.
  Here is an explicit algebra calculation of that relative tensor product. It is the derived intersection of the diagonal and the graph $\( Phi_r \, "id" \)$ in the product presentation of $\[ "Spec" S \/ hat(G) \]$. This language abbreviates a module-algebra computation: #cite(label("BFN")) Proposition 4.1 identifies the tensor product of module categories with modules over the derived tensor product of their defining algebra objects. It applies in the stable presentable category of equivariant modules, without a connectivity condition.
  An object of this intersection has a diagonal coordinate $x$, a graph coordinate $y$, and two group identifications
  $ a : x arrow.r r y \, #h(2em) b : x arrow.r y . $
  Resolve the equations $"Ad" \( a \) x - r y = 0$ and $"Ad" \( b \) x - y = 0$ by their degree-one Koszul generators. Their algebra, before group descent, is the polynomial algebra on $x \, y$ and the two group variables with those Koszul generators. These resolutions are $K$-flat: their exterior-degree filtrations have free graded polynomial quotients. Eliminate $y$ and its Koszul generator using the second equation. This is an invertible linear substitution followed by removal of contractible Koszul pairs. Trivialize $b$ by the product group action, put $e = y$ and $s = a b^(- 1)$, and transport the remaining generator by the same change of basis. The residual group is the diagonal $hat(G)$, its action is conjugation, and the remaining differential is
  $ d eta_alpha = chevron.l alpha \, "Ad" \( s \) e - r e chevron.r . $
  This is exactly $B_r$. In particular the specified null-homotopies of the equation have been retained.
  The universal trace sends a label $P$ to $B_r ⊗_S P$. The comparison from the second-coordinate representation to the first-coordinate representation in the preceding diagram is $a b^(- 1) : y arrow.r r y$. It is the last-to-first slide of Equation (2.2). Hence its action on a representation is $V \( s \)$, with the asserted orientation. Coevaluation and evaluation then give $"Tr"_V \( s \)$ for a rigid character transfer.
  For a cyclic degree-$d$ leg, retain $d$ coordinates and the $d$ twisted identifications. Trivializing all but one of the group variables eliminates the intermediate coordinates and their Koszul pairs. The remaining transport is their ordered product $s$, and its equation is $"Ad" \( s \) e = q^d e$. Carrying a representation label around this full cycle acts by $V \( s \)$. For an external tensor label every factor has this same full transport; a single partial turn also performs the appropriate graded cyclic permutation. This explains both the $d$-fold slide and the map from the original $S^(⊗ d)$ to the loop algebra in Equation (2.5).
  It remains to justify that the continuous functional is pairing with a module, including when it is not coherent. Let $cal(T) = "Mod"_(B_r) \( D \( "Rep"_(upright("rat")) \( hat(G) \) \) \)$ and write the functional as $L : cal(T) arrow.r D \( upright(bold(k)) \)$. Again $B_r ⊗ V$ are compact dualizable generators. The exact contravariant functor on $cal(T)^c$ given by $P mapsto L \( P^or \)$ is represented by an object $cal(A) in "Ind" \( cal(T)^c \) = cal(T)$. Tensor duality gives, for compact $M$,
  $ L \( M \) tilde.eq "Hom"_(cal(T)) \( M^or \, cal(A) \) tilde.eq \( cal(A) ⊗_(B_r) M \)^(hat(G)) . $
  Both sides preserve colimits, proving the formula for all $M$, and hence Equation (2.5).
  The character calculation is natural in labels and their evaluation and coevaluation maps. The projection transfer of Proposition 8 is therefore the same character operation on cohomology in this model. Finally, for a linear degree-two morphism $u : P arrow.r Q \[ 2 \]$, cyclic naturality and Theorem 4 give
  $ sigma_Q \[ 2 \] thin sans(K) \( u \) = q^d thin sans(K) \( u \) thin sigma_P \, $
  where $sigma$ is the full selected-leg slide. This proves the stated change in eigenvalue. The degree is even, so no additional Koszul sign occurs. ◻
]

In particular $Z_(upright("sph")) = cal(O) \( hat(G) \)^(hat(G))$ acts as an actual degree-zero central dg algebra through $B_r$. Here is the precise spectral-projector consequence. For an external Satake label with representation $V^(⊗ d)$, let $rho = V^(⊗ d)$ and let $sigma$ be its $d$-fold selected-leg slide. Before tensoring with $cal(A)$ and taking invariants, $sigma$ is the matrix $rho \( s \)$ on the finite free $B_r$-module $B_r ⊗ V^(⊗ d)$. For any positive integer $N$,

$ p \( z \) = det #scale(x: 120%, y: 120%)[\(] z - rho \( s \)^N #scale(x: 120%, y: 120%)[\)] in Z_(upright("sph")) \[ z \] $

annihilates $sigma^N$ strictly by Cayley–Hamilton. The identity persists after tensoring with $cal(A)$ and taking invariants. If a flat $Z_(upright("sph"))$-algebra $R$ gives a coprime factorization $p = p_0 p_1$, choose $a p_0 + b p_1 = 1$. Then $b \( sigma^N \) p_1 \( sigma^N \)$ is an actual chain idempotent on the spherical complex after this base change. It selects the $p_0$ factor and gives its dg direct summand, regardless of boundedness. This is the enhanced projector used after transferring a cohomological Iwahori summand to hyperspecial level.

Two consequences will be used repeatedly. First, imposing finitely many equations in invariant functions of $s$ is ordinary derived tensor with a finite Koszul complex and commutes with every operation just described. Second, after such a specialization, an invertible coefficient of a nonresonant linear equation permits its variable and Koszul generator to be eliminated as a contractible pair. Thus the action of the original polynomial variables on a resonant slice is their ordinary restriction, with cohomological degree still $2$.

== 3 A uniform upper bound for the extreme slide <sec:amplitude>

We bound the cohomological degrees in the part of a spherical trace whose slide eigenvalues have maximal absolute value, as the highest weight grows along a fixed rational ray. The geometric input is a uniform upper bound for the costandard tests of Proposition 6. After semisimple specialization, these tests control the degrees of fibers of the resonant module, with a correction determined by compatible nilpotent triples. A finite orbit decomposition then turns the fiber bounds into the upper estimate of Theorem 18. The module may be neither coherent nor bounded; the uniformity of the tests is what permits this passage.

We use cohomological grading: $H^i \( C \[ a \] \) = H^(i + a) \( C \)$. An upper bound $b$ for a complex means that $H^i = 0$ for $i > b$; it does not assert finite-dimensionality or a lower bound. Throughout this section all bundle levels, all kernels at other places, and the number of variable kernels are fixed. Constants may depend on these data. They will not depend on the dominant weights in a nef family. For a reductive group we either bound the abelian degree or divide by a fixed lattice of central modifications with cocompact image in the free abelian degree lattice. Such a lattice acts freely on that lattice. The assertions below apply to either convention.

=== 3.1 Bundle geometry and costandard transforms <bundle-geometry-and-costandard-transforms>

Fix a norm on the semisimple part of the rational cocharacter space. The instability of a bundle is the norm of its dominant Harder–Narasimhan type. The size of a modification is any fixed norm bound for its relative positions, summed over the geometric legs. Changing either norm changes only the constants.

#thm([Proposition 3.1.])[
  (Bounded geometry).  #emph[For a fixed split connected reductive group and fixed finite level, the following statements hold.]
  + #emph[The number of rational isomorphism classes of bundles of instability at most $b$ is bounded by $C \( 1 + b \)^N$, for fixed $C \, N$.]
  + #emph[There is a locally finite constructible stratification of the bundle stack such that, on a stratum where the automorphism group has dimension $r$, the stratum has dimension at most $C - r$. The same constant works for all Harder–Narasimhan types.]
  + #emph[Suppose that a sequence of bundles $cal(E)_n$ has meromorphic isomorphisms to its point-Frobenius transforms, or meromorphic automorphisms, with the $n$th modification of size at most $b_n$. If the ratio of the instability of $cal(E)_n$ to $1 + b_n$ is unbounded, a subsequence has a coarsening of the canonical reduction to one fixed maximal parabolic that these isomorphisms carry to its point-Frobenius transform, or to itself, respectively. The assertion holds over geometric points and is compatible with descent and iteration of the Frobenius isomorphism.]
  #emph[All statements allow an arbitrary effective level divisor, including nonreduced divisors, and any fixed list of parahoric flags.]
] <amp:geometry>

#proof[
  We recall precisely the principal-bundle input. In arbitrary characteristic the canonical parabolic reduction exists and is unique; its Levi bundle is semistable. Semistable Levi bundles in a fixed component form a quasicompact stack. The reduced Harder–Narasimhan strata are of finite type, and the stack of canonical reductions maps finitely and radicially onto its stratum. These are the assertions of #cite(label("Schieder")) § 2.3.1, Theorem 2.3.3(a),(c), and § 2.4.1. We use the finite radicial description, not an assertion that this map is an isomorphism in every characteristic.
  For each of the finitely many standard Levis $M$, central cocharacters cover the free degree lattice of $M$ up to finite index; see #cite(label("Schieder")) § 2.1.3. After tensoring by central bundles, its semistable bundles consequently belong to finitely many bounded families. Degree-zero central bundles are included in these families, since the corresponding Picard stacks are of finite type. Fix all the representations of these Levis that occur in the root filtrations and in highest-weight realizations of the finitely many maximal flag varieties. On the bounded families, the maximal and minimal slopes of these associated vector bundles are bounded. Restoring a central translation changes each central weight quotient by its prescribed scalar degree. It follows that a quotient of central weight $beta$ has all slopes in
  #[#set math.equation(numbering: n => "(3.1)")
   $ \[ chevron.l beta \, nu chevron.r - C_0 \, chevron.l beta \, nu chevron.r + C_0 \] \, $ <amp:slope-interval>]
  where $nu$ is the canonical type and $C_0$ is independent of $nu$. There are only finitely many representations here, so one constant suffices. This argument uses boundedness of families; it does not use preservation of semistability by a representation in positive characteristic.
  Choose a fixed large number $A > C_0 + 2 g_X - 2$, enlarged for the finitely many weight filtrations if necessary. Coarsen the canonical parabolic by retaining exactly the simple gaps greater than $A$. Write this parabolic as $P = L U$. In its induced Levi bundle the remaining semisimple gaps are bounded by $A$. It therefore belongs, modulo central translation in $L$, to a bounded family: its canonical Levi is one of the semistable Levis considered above, and its remaining degree gaps range over a finite set of rational lattice points.
  Use the relative-root height filtration of $U$, whose successive quotients are vector groups with linear $L$-action. This parabolic filtration and its commutator inclusions hold in every characteristic; see #cite(label("ConradReductive")) Theorem 5.4.3. Filtering them further by the weights of the original canonical Levi, every resulting root has a positive coefficient on a retained gap. Equation (3.1) therefore gives minimal slope greater than $2 g_X - 2$. Their $H^1$ vanishes by Serre duality. The $H^1$ of every successive vector-group quotient vanishes as well, and the nonabelian cohomology sequence, applied successively, shows that the $P$-bundle is induced from its $L$-bundle. The cutoff was chosen from the original semistable-Levi families before coarsening, so there is no circular choice of a bound depending on $A$.
  It follows that every bundle is induced from one of finitely many bounded families for a Levi, followed by a central translation in that Levi. The translations required in an HN ball are lattice points in a ball of radius $O \( 1 + b \)$ and are polynomially many. These translations can be chosen over the fixed finite field after passing to a fixed finite-index degree lattice: choose a divisor of positive degree over that field and use its line bundle. The remaining degree cosets are absorbed into the bounded families. The bounded principal-bundle families have finitely many rational classes. To see this directly, fix a faithful representation and a twist for which all the associated vector bundles are globally generated and have vanishing $H^1$. A basis of global sections rigidifies each bundle into one of finitely many finite-type framed algebraic spaces. Every rational bundle admits such a basis over the finite field, and each framed space has finitely many rational points. The canonical reduction of a rational bundle descends by uniqueness, and the vanishing of $H^1 \( U \)$ above holds over the finite field itself. Thus every rational class is obtained from the same finite list of rational Levi families. This proves (a).
  Choose finite-type scheme atlases for these bounded families, with dimensions bounded by $C$. Each central translate of each atlas maps to the bundle stack. A geometric fiber of such a map over an object with automorphism dimension $r$ has dimension at least $r$: it parametrizes isomorphisms from a family member to that object. The dimension formula bounds the image stratum by $C - r$. Within each fixed HN stratum only finitely many translating choices occur, and the HN stratification is locally finite. Refining the images and the stabilizer dimensions thus proves (b) with a locally finite stratification. Universal homeomorphisms in the canonical-reduction description do not change these dimensions or the constructible-sheaf calculation.
  For (c), pass to a subsequence on which a simple gap tends to infinity relative to $1 + b_n$, and fix its maximal parabolic $P_i$. Choose an actual $G$-equivariant projective embedding $G \/ P_i arrow.r.hook bb(P) \( V_i \)$ using a sufficiently ample linearized line bundle with weight a divisible multiple of the fundamental weight. In particular the scheme-theoretic stabilizer of the base-point line is $P_i$; no assertion about the stabilizer of an arbitrary simple highest-weight module in small characteristic is required. The line defining the coarsened canonical reduction is the unique highest-weight line. Every other weight differs from this weight by a positive combination of simple roots involving the selected root. Equation (3.1) shows that the degree of this line exceeds every slope of the quotient by the selected gap minus a fixed constant. A modification of size $b_n$ in this fixed representation has poles bounded by a divisor of degree $O \( b_n \)$. The resulting homomorphism from the highest line to the target quotient therefore vanishes when the gap is sufficiently large. The meromorphic isomorphism preserves the reduction line and hence its maximal-parabolic reduction. For point Frobenius, the target canonical type and degrees are the same: point Frobenius acts on the parameter field, not by Frobenius pullback along $X$. Uniqueness of the canonical reduction gives the descent and iteration assertions.
  Finally, a full level structure has a space of choices of fixed finite type and fixed dimension; over the finite field its possible trivializations form a torsor under the fixed finite group $G \( cal(O)_D \)$. Parahoric flags have the same boundedness property. They change all the preceding constants by fixed amounts. No argument uses reducedness of $D$. ◻
]

#thm([Lemma 3.2.])[
  (The diagonal and the Frobenius graph).  #emph[Let $cal(B)$ be one of the bundle stacks in Proposition 10. The object $Delta_(!) upright(bold(k))$ on $cal(B) times cal(B)$ has a uniform upper perverse bound. Moreover, for a constructible complex $cal(F)$ on $cal(B) times cal(B)$ with upper perverse bound $N$, pullback to the point-Frobenius graph followed by compact cohomology has upper bound $N + C_1$, where $C_1$ is independent of $cal(F)$.]
] <amp:trace-bound>

#proof[
  We use middle perversity with smooth descent, as in #cite(label("LaszloOlssonPerverse")) Lemma 4.1 and Theorems 4.2, 5.1, so that $upright(bold(k)) \[ - r \]$ is perverse on the classifying stack of a smooth group of dimension $r$. Stratify further by stabilizer dimension and by the isomorphism relation. Over a pair of isomorphic bundles with stabilizer dimension $r$, the stalk of $Delta_(!) upright(bold(k))$ is the compact cohomology of their isomorphism scheme and has upper degree $2 r$. The corresponding locus of isomorphic pairs has dimension at most $C - 2 r$, by Proposition 10(b). The support criterion for the upper perverse truncation gives a bound independent of $r$.
  At a point of the Frobenius graph the stabilizer dimension in $cal(B) times cal(B)$ is $2 r$. Every stratum through it has dimension at least $- 2 r$. Thus the stalk upper bound of $cal(F)$ is at most $N + 2 r$. On the graph the relevant stratum has dimension at most $C - r$. Compact cohomology of a sheaf on a finite-type algebraic stack of dimension $a$ vanishes in degrees above $2 a$; see #cite(label("SunStacks")) Theorem 1.4. The resulting bound is
  $ \( N + 2 r \) + 2 \( C - r \) = N + 2 C . $
  Stratification and the spectral sequence for cohomology sheaves give the same estimate for complexes. Apply the calculation on finite-type opens and then take the defining filtered colimit. The bounds are independent of the open, so they persist in that colimit. The central-degree convention is treated componentwise. ◻
]

#thm([Proposition 3.3.])[
  (Uniform geometric tests).  #emph[In the hyperspecial cyclic calculation, a fixed list of perfect spherical labels has bounded-above cohomology. The same upper bound property holds uniformly when the list also contains a fixed number of Springer pushforwards 
$ R pi_(*) cal(O)_(tilde(cal(N))) \( eta_j \) \, #h(2em) pi : tilde(cal(N)) arrow.r hat(frak(g)) \, $

 whose line bundles are independently nef. Fixed additional twists or fixed perfect factors are allowed. The number of factors and the additional twists are fixed; their nef weights may vary independently without changing the upper bound.]
] <amp:tests>

#proof[
  Compute the trace by applying the Hecke transforms to one factor of $Delta_(!) upright(bold(k))$ and then applying Lemma 11. Every fixed bounded kernel has finite upper perverse amplitude. A costandard kernel has a bound independent of its length, as follows.
  Let $cal(H)_w$ be its exact-position Hecke stratum, with source and target maps $p \, q$. The map $p$ is smooth of relative dimension $ell \( w \)$ and $q$ is affine; these facts are checked after smooth local trivialization, where their fibers are the affine Schubert cell. In the closure correspondence the target map is proper. Here is the coefficient comparison for an arbitrary locally bounded constructible input. Choose a sufficiently deep jet subgroup acting trivially on the chosen Schubert closure, and pass to its smooth torsor of trivializations. The open and closed Hecke spaces then become products over the source. For bounded constructible complexes the formula
  $ R \( "id" times j \)_(*) \( A times.square B \) tilde.eq A times.square R j_(*) B $
  follows by Verdier duality from the corresponding extension-by-zero formula. It does not require $A$ to be lisse. Thus smooth base change #cite(label("LaszloOlssonSixII")) § 12.1 and descent identify the costandard coefficient with $R j_(*) p^(*) \( - \) \[ ell \( w \) \]$. Proper pushforward from the closure identifies the costandard transform with
  $ R q_(*) p^(*) \( - \) \[ ell \( w \) \] . $
  Smooth pullback with this shift preserves perversity, and affine Artin vanishing says that $R q_(*)$ preserves an upper perverse bound; see #cite(label("BeilinsonPerverse")) § 3.2, paragraph preceding Theorem 3.2. Both assertions descend from the smooth scheme charts, since the maps of the correspondence are representable. The resulting upper bound is independent of $w$.
  Passage between the fixed parahoric levels costs only a fixed amplitude, because their fibers are fixed flag varieties. Forgetting and then right-averaging torus equivariance has a representable torus-torsor fiber. Its direct image has a finite Postnikov filtration with constant cohomology pieces $H^i \( T \, upright(bold(k)) \)$: translations act trivially on torus cohomology. This is cohomology of $T$, not of $B T$, and no splitting of the filtration is needed. It adds only fixed shifts. This is the averaging convention in Proposition 6. By the same proposition, nef Springer line bundles correspond to costandard Wakimoto translations, with shifts independent of their weights. A bounded additional translation can be composed with a nef translation at a fixed cost. Convolution of a fixed number of these transforms preserves the uniform upper bound just proved. The spherical polynomial action and the identification of their products with derived tensor products are those of Theorem 4 and Proposition 6. ◻
]

=== 3.2 Specialization and uniform Levi tests <specialization-and-uniform-levi-tests>

Fix a closed leg of degree $d$, set $Q = q^d$, and choose a complex realization of $upright(bold(k))$. Let $t in hat(G)$ be semisimple and put

$ H = Z_(hat(G)) \( t \) \, #h(2em) E_t = { e in hat(frak(g)) : "Ad" \( t \) e = Q e } . $

In a torus containing $t$, decompose $log_Q \| t \|$ into its connected-central and semisimple components, using the rational direct sum of the connected-center and derived-torus cocharacter spaces. Throughout this section $lambda$ denotes the #emph[semisimple component], and we assume that $lambda$ is rational. No rationality is required of the connected-central component. This convention applies to every grading and cocharacter below, as well as to metric pairings. The direction $lambda$ is central in $H$: conjugation fixing $t$ also fixes its absolute-value direction and its semisimple projection. Roots annihilate the discarded central component; therefore every vector in $E_t$ still has $lambda$-weight one. Replacing $t$ by $t z$, for $z in Z \( hat(G) \)^compose$, leaves $lambda$ unchanged.

Specialization at the class of $t$ always means the following finite operation. Choose once algebra generators $a_1 \, dots.h \, a_r$ of $upright(bold(k)) \[ hat(G) \]^(hat(G))$, and tensor the cyclic calculation with the Koszul complex of $a_1 - a_1 \( t \) \, dots.h \, a_r - a_r \( t \)$. These functions generate the maximal ideal of $\[ t \]$. No regularity of the adjoint quotient is assumed. The generators have degree zero, and the number and degrees of the Koszul factors are independent of $t$. We retain all the derived structure produced by this operation.

#thm([Lemma 3.4.])[
  (The specialized test module).  #emph[After this specialization, the cyclic calculation is a pairing with an $H$-equivariant dg module $M$ over $"Sym" \( E_t^(*) \[ - 2 \] \)$. The module need not be coherent or bounded. The action of a spherical polynomial at any one geometric factor is restriction of its linear functions to $E_t$. The uniform tests of Proposition 12 remain valid. They also allow fixed equivariant perfect factors on the flag varieties, in particular restriction to fixed closed $H^compose$-orbits of Borels.]
] <amp:specialization>

#proof[
  By Proposition 9, the holonomy satisfies the derived linear equation $"Ad" \( s \) e = Q e$. The fiber of the adjoint quotient over $\[ t \]$ consists of elements conjugate to $t u$, with $u$ unipotent in $H$. Indeed the adjoint quotient is the Weyl quotient of a maximal torus #cite(label("LeeAdjointQuotients")) Theorem 4.1(2), and representation characters are unchanged by the commuting unipotent factor in Jordan decomposition. Here is an algebraic slice description, with no completion of the coefficient module. Let $W$ be the sum of the nonresonant $"Ad" \( t \)$-eigenspaces in $hat(frak(g))$. Choose an $H$-stable affine open $U subset H^compose$ containing the unipotent locus on which $1 - "Ad" \( t u \)$ on $hat(frak(g)) \/ "Lie" H$ and $"Ad" \( t u \) - Q$ on $W$ are invertible. Both determinants are nonzero at every unipotent $u$. There are only finitely many $H$-classes of semisimple $u$ for which $t u$ is conjugate to $t$, since their torus representatives come from the finite Weyl orbit of $t$. Invariant functions allow us also to remove all these classes except $u = 1$. The conjugation map
  $ hat(G) times^H \( t U \) arrow.r hat(G) $
  is etale: its transverse differential is the first displayed invertible operator. After the removal of the other sheets, uniqueness of the Jordan semisimple part identifies every conjugating ambiguity over the class fiber with $H$. The restriction to the schematic class fiber is therefore etale and universally bijective, hence an isomorphism. Being etale, it is an isomorphism over every infinitesimal thickening of that fiber as well. Flat pullback and descent therefore identify the supported quasi-coherent complexes on these neighborhoods, equivariantly. This assertion applies to arbitrary complexes: on affine charts it holds for modules killed by each power of the fiber ideal, hence for their filtered unions; flatness computes pullback on cohomology in every degree. The finite Koszul specialization has cohomology annihilated by the fiber ideal, so it is covered by this argument. In particular, all equivariance remains ordinary rational $H$-equivariance.
  Over $cal(O) \( U \)$, the invertible nonresonant block of $"Ad" \( t u \) - Q$ gives a change of odd Koszul generators for which their differentials are precisely the coordinates of $W$. Eliminating these contractible pairs is an actual dg-algebra quasi-isomorphism over $"Sym" \( E_t^(*) \[ - 2 \] \)$. Solve successively for the transported variables at the other geometric factors in the same way. Push forward the unipotent and additional derived variables along their affine projection. They remain in $M$, including all invariant Koszul generators and the residual equation $"Ad" \( u \) e = e$. The polynomial-action assertion follows by solving the equations starting at the chosen geometric factor. The description is $H$-equivariant.
  Tensoring with the finite Koszul complex changes upper bounds by only a fixed amount. For a fixed finite-dimensional representation of a reductive subgroup of $hat(G)$, every irreducible summand occurs in a restriction from $hat(G)$. One proof uses the surjection $upright(bold(k)) \[ hat(G) \] arrow.r upright(bold(k)) \[ H \]$, takes a finite-dimensional $hat(G)$-subrepresentation containing lifts of its matrix coefficients, and then uses complete reducibility. Thus all fixed $H$-tests are available. Induction from $H^compose$ to $H$ is finite, so it also allows $H^compose$-invariants and fixed $H^compose$-tests. These retracts are taken after specialization on the slice; their maps need not extend equivariantly before specialization.
  Here is the perfect-generation detail for the flag factors. On the smooth projective flag variety choose an ample equivariant line bundle $A$. Equivariant Serre evaluation gives surjections from finite sums of $V ⊗ A^(- n)$ onto any equivariant coherent sheaf. For an explicit finiteness argument, let the flag variety have dimension $a$. More than $2 a$ successive evaluations give an extension whose class vanishes, since the local-to-global Ext spectral sequence and exact reductive invariants give $"Ext"_(H^compose)^n \( F \, K \) = 0$ for coherent $F \, K$ and $n > 2 a$. The truncated evaluation complex therefore contains $F$ as a retract. Applying finite cohomology filtrations shows that every perfect complex is in the finite thick closure of these bundles. Apply this statement to its dual and dualize: the same perfect complex is in the finite thick closure of bundles $V ⊗ A^n$, $n gt.eq 0$. All representations, twists, cones, and shifts in this construction are fixed once the perfect complex is fixed. Tensoring a variable nef line with these positive twists keeps it nef. The structure sheaf of a fixed closed smooth $H^compose$-flag orbit is perfect on the ambient flag variety, so the assertion applies to its restriction test. This proves the last claim with constants independent of the variable nef weights. ◻
]

The specialized module $M$ satisfies the geometric tests, but need not be coherent or bounded. Bounds for each fixed representation test alone would not control cohomology whose representation types vary with the degree. We next obtain bounds uniform under character twists on each Levi. In Proposition 17, these twists and a finite list of fixed representations will detect every representation constituent, turning the invariant test bounds into a bound on the whole fiber.

For a cocharacter $gamma$ commuting with $t$, define

$ L = Z_(hat(G)) \( gamma \) \, #h(2em) H_L = H^compose ∩ L \, #h(2em) E_L = E_t ∩ "Lie" L \, #h(2em) M_L = M ⊗_(upright(bold(k)) \[ E_t \])^(upright(bold(L))) upright(bold(k)) \[ E_L \] . $

The group $H_L$ is connected reductive, by the structure of torus centralizers #cite(label("MilneAlgebraicGroups")) Theorem 17.38 and Corollary 17.59. All coordinate rings in this notation carry the degree-two shearing. A representation test is placed in ordinary cohomological degree zero. Since $lambda$ is central in $H$, it commutes with $gamma$ and is a rational central cocharacter of $H_L$; its weight on $E_L$ is one.

#thm([Proposition 3.5.])[
  (Uniform central-character tests).  #emph[For every such $L$ and every fixed finite-dimensional rational $H_L$-representation $U$, there is a constant $C \( U \, L \)$ such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ H^i #scale(x: 120%, y: 120%)[\(] \( M_L ⊗ U ⊗ eta \)^(H_L) #scale(x: 120%, y: 120%)[\)] = 0 quad upright("for ") i > C \( U \, L \) \, #h(2em) eta in X^(*) \( L \) . $ <amp:levi-bound>]

 Invariants denote invariant global sections. The constant is independent of the character $eta$.]
] <amp:levi>

#proof[
  Choose Borels containing a reference torus with $t \, gamma$. First order their roots by $gamma$ and $- gamma$, respectively; within $L$, order them positively on $lambda$ and complete the order arbitrarily on the zero-weight roots. Their $H^compose$-orbits are complete flag varieties. Use two Springer tests restricted to these orbits, as permitted by Lemma 13.
  Let $P_gamma \, P_(- gamma)$ be the two opposite parabolics. Choose an integral character $chi$ strictly dominant for the first partial flag variety and zero on the coroots of $L$. The extremal pairing in mutually dual representations gives an invariant section of the product of two nef line bundles on the partial flags. Project the selected complete-flag orbits to these partial-flag varieties. On the product of the two resulting $H^compose$-orbits, the section’s nonvanishing locus is the locus of opposite partial flags, which is $H^compose \/ H_L$. Indeed the ambient big-cell Gauss factorization is unique and is preserved by conjugation by $t$. If an element of $H^compose$ admits that factorization, its unipotent and Levi factors centralize $t$ as well and lie in the corresponding parabolics of $H^compose$. Thus ambient oppositeness restricts to exactly the opposition locus for $H^compose$. Localizing by that section is the filtered colimit of simultaneous positive twists by the two nef lines. The section and its localization maps have degree zero.
  The pairs of complete flags form a fibration over this opposition locus. Over the reference opposite partial-flag pair, its fiber is the product of two complete flag varieties for $H_L$. The resonant parts of the two ambient nilradicals are
  $ E_(gamma gt.eq 0) quad upright("and") quad E_(gamma lt.eq 0) . $
  Indeed the zero $gamma$-part $E_L$ has positive $lambda$-weight and belongs to both nilradicals, independently of the remaining flags; the roots of $H_L$ have $lambda$-weight zero. The displayed subspaces span $E_t$ and intersect in $E_L$, so
  $ upright(bold(k)) \[ E_(gamma gt.eq 0) \] ⊗_(upright(bold(k)) \[ E_t \])^(upright(bold(L))) upright(bold(k)) \[ E_(gamma lt.eq 0) \] tilde.eq upright(bold(k)) \[ E_L \] . $
  Thus their derived intersection over $E_t$ has no excess.
  For completeness, the other torus eigenspaces do not obstruct splitting off this intersection. Decompose the ambient Lie algebra as $E_t xor W$ by $t$-weights. The projectors are polynomials in $"Ad" \( t \)$, so this also splits the universal nilradical subbundles globally and equivariantly. Its Koszul base change to $E_t$ has zero differential on the factors from $W$, so these factors are finite exterior algebras of equivariant vector bundles. Their exterior-degree-zero summand is canonical; no splitting of the varying nonresonant subbundle inside $W$ is required. Taking this summand in both tests leaves exactly $upright(bold(k)) \[ E_L \]$ on the opposite-pair slice. Tensoring with $M$ therefore gives $M_L$. The remaining complete flags contribute $R Gamma \( cal(O) \) = upright(bold(k))$. By equivariant descent from $H^compose \/ H_L$, the resulting invariant test is the expression in Equation (3.2).
  We check the uniformity in $eta$. Give the first partial-flag line fiber character $eta$. After the $n$th localization twist the two fiber characters are, with the opposite-Borel conventions,
  $ eta - n chi \, #h(2em) n chi . $
  Both lines are nef for every sufficiently large $n$, since $chi$ is strictly positive on precisely the omitted simple coroots and $eta$ vanishes on the Levi coroots. The starting value of $n$ may depend on $eta$. It changes neither the localization colimit nor the bound: every term in this cofinal tail is in the same uniformly bounded nef family of Proposition 12. The fixed resolutions in Lemma 13 introduce only fixed additional positive twists and fixed shifts. The character $eta$ and the localization characters are trivial on the derived subgroup of $L$, so the residual complete flags still push their structure sheaves to constants. If $L = hat(G)$, the character line is underlying-trivial and already nef; this also covers the case with no partial flags.
  A fixed $U$ is obtained from a fixed representation test by the restriction and summand argument in Lemma 13. Finally, global sections on these fixed flag varieties have finite cohomological dimension, reductive invariants are exact, and filtered colimits of vector spaces are exact. All the operations and the direct-summand projection above are therefore valid for arbitrary dg $M$. They preserve a uniform upper bound, proving the proposition. ◻
]

=== 3.3 Orbits, corrected fibers, and local cohomology <orbits-corrected-fibers-and-local-cohomology>

For $e in E_L$, choose a Jacobson–Morozov triple $\( e \, h_e \, f \)$ inside $"Lie" L$ such that

$ "Ad" \( t \) \( e \, h_e \, f \) = \( Q e \, h_e \, Q^(- 1) f \) . $

We use $h_e$ for the integral neutral cocharacter as well as its differential. Conjugate it into the reference torus of $H_L$ when computing pairings.

#thm([Lemma 3.6.])[
  (Resonance orbits).  #emph[Every element of $E_L$ is nilpotent and admits such a compatible triple. There are finitely many $H_L$-orbits in $E_L$. For $e in E_L$, every $h_e$-weight in the normal space 
$ N_e = E_L \/ \[ e \, "Lie" H_L \] $

 is nonpositive.]
] <amp:orbits>

#proof[
  Choose a faithful algebraic representation $rho : L arrow.r.hook "GL" \( V \)$. The relation $"Ad" \( t \) e = Q e$ says that $d rho \( e \)$ is conjugate to $Q thin d rho \( e \)$. Its finite multiset of eigenvalues is therefore preserved by multiplication by $Q$. Since $Q > 1$, every eigenvalue is zero. Thus $d rho \( e \)$, and hence $e$, is nilpotent. Start with the Jacobson–Morozov theorem in characteristic zero #cite(label("BMYJM")) Theorems 3.1 and 3.2. On the torsor of triples with first member $e$, let $\( t \, Q \)$ act by
  $ \( e \, h \, f \) mapsto \( Q^(- 1) "Ad" \( t \) e \, "Ad" \( t \) h \, Q "Ad" \( t \) f \) . $
  The closure of the subgroup generated by $\( t \, Q \)$ is diagonalizable. The torsor is under the unipotent radical of the centralizer of $e$ #cite(label("BMYJM")) Proposition 3.3; successive vector-group quotients have vanishing first cohomology for a diagonalizable group in characteristic zero. It therefore has a fixed point, which is the required compatible triple.
  Put $c = t Q^(- h_e \/ 2)$. It commutes with the triple. Decompose $"Lie" L$ into simultaneous $c$-eigenspaces and irreducible $frak(s l)_2$-modules $V_n$. A vector of $h_e$-weight $k$ belongs to $E_L$ precisely when its $c$-eigenvalue is $Q^(1 - k \/ 2)$. Its predecessor of weight $k - 2$, when present, has $t$-eigenvalue one and lies in $"Lie" H_L$. The raising map is onto this vector unless $k = - n$ is the lowest weight. Hence every normal weight is of the form $- n lt.eq 0$.
  For finiteness, conjugate $h_e$ into the fixed torus by $H_L$. Its central projection in $L$ is zero, because the triple comes from $upright("SL")_2$. Its root pairings are integral and bounded in absolute value by $dim "Lie" L$: they are weights of an $frak(s l)_2$-representation of that dimension. There are consequently only finitely many possibilities in the fixed cocharacter lattice. Fix one such $h$. On the $c = 1$ part of the same calculation the raising map gives a surjection
  $ "Lie" Z_(H_L) \( h \) arrow.r E_L ∩ \( "Lie" L \)_2 \( h \) . $
  Thus every $e$ admitting this $h$ has an open $Z_(H_L) \( h \)$-orbit in that vector space. An irreducible vector space has at most one open orbit. The finite list of $h$’s therefore gives finitely many $H_L$-orbits. ◻
]

We make the grading used for a nonzero fiber explicit. Let $a = 2 lambda$ and first deshear by adding the $a$-weight to cohomological degree. A linear function on $E_L$ has original degree $2$ and $a$-weight $- 2$, so the coordinate ring now has degree zero. Take the derived fiber at $e$ in this grading. The rational cocharacter

$ rho_e = h_e - a $

fixes $e$, and hence belongs to its stabilizer $S_e = \( H_L \)_e$. Add its weight to the fiber degree. The result is called the #emph[corrected fiber], denoted $F_e^(upright("corr"))$. Equivalently, the total correction is by $h_e$. Here is a literal implementation for rational $lambda$. Choose $N$ for which $N lambda$ is integral, and decompose into the finitely many sectors of $lambda$-weights $w$ modulo $bb(Z)$. In the sector represented by $r in \[ 0 \, 1 \) ∩ N^(- 1) bb(Z)$, replace degree $i$ by the integral degree $i + 2 \( w - r \)$ and retain the numerical offset $2 r$. The actual shifts are even integers, so all dg signs are unchanged. A linear function changes $\( i \, w \)$ to $\( i + 2 \, w - 1 \)$ and has new degree zero. Tensor products add offsets, with an even integral carry. Thus deshearing is a finite collection of honest complexes with rational numerical offsets. Write $W_(e \, r)$ for the ordinary derived fiber in the sector represented by $r$. We use $H^j \( W_e \)$ for sectorwise cohomology in numerical degree $j$: a class in $H^n \( W_(e \, r) \)$ has $j = n + 2 r$. The actual complexes retain integral degrees. The assertion that the corrected fiber has upper bound $B$ means precisely

#[#set math.equation(numbering: n => "(3.3)")
 $ H^j \( W_e \)_b = 0 quad upright("whenever ") j + b > B \, #h(2em) b = rho_e upright("-weight") . $ <amp:corrected-fiber>]

All nonzero-point pullbacks are taken after this deshearing. Differentials retain degree one and preserve $b$. Apply the same deshearing to every representation test $U ⊗ eta$. On each of its simultaneous weight spaces, the desheared degree plus the $rho_e$-weight is the $h_e$-weight, since $a + rho_e = h_e$. In particular, the possible $a$-weight of a character $eta in X^(*) \( L \)$ cancels its $rho_e$-weight: its $h_e$-weight is zero because the triple lies in the derived group of $L$. On $H_L$-invariants the total $a$-weight is zero, so deshearing does not change the output cohomological degrees.

#thm([Lemma 3.7.])[
  (Contributions of an orbit).  #emph[Suppose $F_e^(upright("corr"))$ has upper bound $B_e$. For every finite-dimensional $H_L$-representation $V$, the contribution of the orbit $H_L e$ to invariant sections of $M_L ⊗ V$ has upper bound 
#[#set math.equation(numbering: n => "(3.4)")
 $ B_e + C_e + max { h_e upright("-weights of ") V } \, $ <amp:orbit-bound>]

 where $C_e$ is independent of $V$. This assertion uses local cohomology in an open subset where the orbit is closed and is valid for arbitrary dg $M_L$.]
] <amp:support>

#proof[
  Deshear as above. In an invariant open subset where the orbit is closed it is a smooth regular immersion into the smooth space $E_L$. If $cal(I)$ is its ideal, local cohomology is
  $ R Gamma_(H_L e) \( M_L \) = "colim"_p R cal(H) o m \( cal(O) \/ cal(I)^p \, M_L \) . $
  Each quotient is perfect on the regular ambient space. Its finite filtration has graded pieces the symmetric powers of the conormal bundle. Regular-immersion duality therefore expresses the corresponding support terms as
  $ i_(*) #scale(x: 120%, y: 120%)[\(] L i^(*) M_L ⊗ det N ⊗ "Sym"^a N #scale(x: 120%, y: 120%)[\)] \[ - c \] \, #h(2em) c = "codim" \( H_L e \) \, $
  where $M_L$ is read in the desheared grading and $i$ denotes the regular immersion. The shift $\[ - c \]$ raises degrees by $c$; the normal symmetric powers, rather than the conormal ones, are the factors relevant to the upper bound.
  The action of $rho_e$ on a normal vector of $h_e$-weight $k$ has weight $k - 2$. By Lemma 15 this is at most $- 2$. Consequently arbitrary normal powers cannot increase the corrected upper bound. The determinant and the codimension shift cost a constant depending only on the orbit. This establishes a bound uniform in $p$ before passage to the filtered colimit.
  Equivariant sections on the orbit are rational group cohomology of $S_e$. Its unipotent radical is computed by the finite exterior Lie-algebra cochain complex, and invariants for a reductive Levi are exact. The triple centralizer is a Levi in the centralizer of $e$ #cite(label("BMYJM")) Proposition 3.3; taking the fixed points of the compatible diagonalizable action gives the same decomposition for $S_e$. The cocharacter $rho_e$ lies in, and is central in, this triple-centralizer Levi. If $frak(u)$ is the Lie algebra of the unipotent radical, a possible additional cost is
  $ max_(0 lt.eq a lt.eq dim frak(u)) (a + max "wt"_(rho_e) and.big^a frak(u)^(*)) . $
  The exterior complex has finitely many columns, so it is valid for unbounded coefficients without an infinite-totalization issue. Finite component invariants are exact in characteristic zero. The test $V$ is desheared too: its $a$-weight-$alpha$ space is placed in numerical degree $alpha$. Its numerical degree plus its $rho_e$-weight is therefore its $h_e$-weight. Taking invariants of the reductive triple-centralizer Levi forces total $rho_e$-weight zero. On the original $H_L$-invariants the total $a$-weight is zero as well, so the resulting numerical degree is the original cohomological degree. This gives Equation (3.4).
  No finite-generation hypothesis has been used. Tensoring with the perfect quotients and their finite filtrations is legitimate for unbounded dg modules. The operation displayed above is a filtered colimit, not an inverse limit. Exactness of filtered colimits preserves the upper bound uniform in $p$. Finally there are finitely many orbits, so their support triangles give a finite devissage. ◻
]

#thm([Proposition 3.8.])[
  (Bounded corrected fibers).  #emph[For every allowed Levi $L$ and every $e in E_L$, the corrected fiber $F_e^(upright("corr"))$ is bounded above. The bound is a bound on the whole complex; its cohomology need not be finite-dimensional.]
] <amp:fiber>

#proof[
  Induct on the semisimple rank of $L$, using Proposition 14 for all its smaller allowed Levis. If the centralizer of the triple in $H_L$ has a torus noncentral in $L$, choose a cocharacter in that torus noncentral in $L$. Its centralizer is a proper Levi $L'$ of $L$ containing the triple. It is still allowed: combine this cocharacter with $gamma$, using a sufficiently large multiple to specify the same successive centralizers. Derived restriction is transitive, so the derived fiber obtained from $M_(L')$ is the same as that from $M_L$. Induction proves the assertion for this orbit.
  Consider an orbit for which no such torus exists. The direction $lambda - h_e \/ 2$ centralizes the triple, so it is central in $L$. Since $lambda$ is central in $H_L$, this implies that $H_L$ centralizes $h_e$. In the centralizer of $h_e$, an element centralizing $e$ also centralizes $f$, by uniqueness of the compatible triple with $e \, h_e$ fixed. Thus $S_e$ equals the triple centralizer in $H_L$. It is reductive and finite modulo $Z \( L \)^compose$. Since $lambda - h_e \/ 2$ is central in $L$, every vector in $E_L$ has $h_e$-weight two. Lemma 15 gives only nonpositive weights in the normal space, so that space is zero: $H_L e$ is open in $E_L$. The irreducible space $E_L$ has only one open orbit.
  Every boundary orbit has already been handled by the proper-Levi case. Apply Lemma 16 to those finitely many orbits with tests $U ⊗ eta$. Every neutral cocharacter of a triple in $L$ annihilates $eta in X^(*) \( L \)$. Their boundary contributions therefore have upper bounds independent of $eta$. Together with Equation (3.2), the localization triangle shows that the open orbit alone satisfies the same type of uniform bound for each fixed $U$.
  We explain why these invariant bounds detect the entire corrected fiber. The group $S_e$ is reductive, possibly disconnected, and contains the central torus $Z \( L \)^compose$ with finite quotient. Restrictions of characters of $L$ form a finite-index sublattice of $X^(*) \( Z \( L \)^compose \)$. Modulo tensoring by these restrictions, there are finitely many irreducible rational representations of $S_e$: there are finitely many central-character cosets, and for each fixed central character the irreducibles are representations of a finite-dimensional twisted group algebra of the finite group $S_e \/ Z \( L \)^compose$. Choose finitely many fixed $H_L$-representations $U_1 \, dots.h \, U_r$ whose restrictions detect the duals of representatives of these classes. Such representations exist by the matrix-coefficient and complete-reducibility argument used above.
  Arbitrary rational representations of a reductive group in characteristic zero are direct sums of finite-dimensional irreducibles #cite(label("MilneAlgebraicGroups")) Remark 12.53(a), Theorem 22.42, and Corollary 22.43. Invariants are exact, so every nonzero cohomology class of the corrected fiber is detected by one of the tests $U_j ⊗ eta$. The correction on that test has only the $h_e$-weights of $U_j$, since $h_e$ annihilates $eta$. More explicitly, an irreducible constituent of $H^j \( W_e \)$ of $rho_e$-weight $b$ has a nonzero invariant pairing with one of these tests. If the chosen test component has $h_e$-weight $a$, that pairing has ordinary degree $j + b + a$: the total $rho_e$-weight is zero, and the test’s numerical degree plus its $rho_e$-weight is its $h_e$-weight. Hence
  $ j + b lt.eq C' \( U_j \) - min "wt"_(h_e) \( U_j \) . $
  The maximum over the finite list gives the bound in Equation (3.3). This argument includes rank zero, where $E_L = 0$ and all representation types are characters. It starts the induction and completes the proof. ◻
]

=== 3.4 The extreme amplitude estimate <the-extreme-amplitude-estimate>

Choose a rational Weyl-invariant positive-definite metric and use it to identify weight and cocharacter directions. Conjugate $lambda$ into the closed dominant chamber. For sufficiently divisible positive integers $m$, the weight $mu = m lambda$ is integral, dominant, and trivial on the connected center. Let $V_mu$ be the corresponding irreducible representation.

#thm([Theorem 3.9.])[
  (Extreme upper amplitude).  #emph[In the finite Koszul specialization at $\[ t \]$ of $sans(K) \( V_mu^(times.square d) \)$, retain the part with maximal absolute value for the $d$-fold slide at the chosen leg. Its cohomological upper bound is 
#[#set math.equation(numbering: n => "(3.5)")
 $ C + max_(e in E_t) d chevron.l mu \, h_e chevron.r . $ <amp:amplitude-bound>]

 The constant is independent of $m$. It is also uniform when $t$ is replaced by $t z$, with $z in Z \( hat(G) \)^compose$, after omitting the absolute-value central part, and when one chooses among a fixed finite list of hyperspecial variants. Fixed additional kernels at disjoint places are permitted.]
  #emph[Unless $t$, modulo its absolute-value central part, is a compact factor times a Jacobson–Morozov point for $Q$, the difference between $2 d chevron.l lambda \, mu chevron.r$ and the nonconstant term in Equation (3.5) is positive and grows linearly with $m$.]
] <amp:amplitude>

#proof[
  In the loop description, the representation label becomes $V_mu^(⊗ d)$ and the $d$-fold slide acts by its holonomy; this is the slide convention of Proposition 9. Among the weights of $V_mu$, pairing with $lambda$ is uniquely maximal at $mu$. Indeed a weight lies in the convex hull of the Weyl orbit of $mu$, and the linear functional defined by $mu$ attains its maximum on that orbit only at $mu$ itself. This argument also applies on chamber walls. Thus the extreme part is the line of character $d mu$. It is $H$-stable; its character is trivial on the derived subgroup of $H$, and the unipotent part of holonomy acts trivially on it. Nilpotent thickenings in the Koszul specialization do not change this semisimple eigenvalue separation.
  Apply Proposition 17 and Lemma 16 with this one-dimensional representation. There are finitely many orbits by Lemma 15. The maximum of their fixed costs is a single constant $C$, and the representation contribution on the orbit of $e$ is $d chevron.l mu \, h_e chevron.r$. This proves Equation (3.5).
  Compatibility of the triple implies that $lambda - h_e \/ 2$ centralizes it. The invariant metric extends, on the derived Lie algebra, to an invariant bilinear form; therefore
  $ \( h_e \, lambda - h_e \/ 2 \) = \( \[ e \, f \] \, lambda - h_e \/ 2 \) = 0 . $
  Consequently
  #[#set math.equation(numbering: n => "(3.6)")
   $ 2 d chevron.l lambda \, mu chevron.r - d chevron.l mu \, h_e chevron.r = 2 d m parallel lambda - h_e \/ 2 parallel^2 . $ <amp:squared-gap>]
  All directions here are projected away from the connected center. If the right side vanishes, the semisimple element $t Q^(- h_e \/ 2)$ centralizes the triple and has absolute values one in the remaining directions. It is conjugate into a maximal compact subgroup after removing the absolute-value central part #cite(label("AdamsTaibiCohomology")) Theorems 3.6 and 3.7. This is exactly the required compact-times-Jacobson–Morozov form. Conversely that form gives equality for its triple. If equality occurs for no orbit, the finite list of squared norms in Equation (3.6) has a strictly positive minimum. This is the asserted uniform linear gap.
  Finally, replacing $t$ by $t z$ leaves $H$, $E_t$, their orbits, the allowed Levis, and every flag test unchanged. It also leaves the semisimple direction $lambda$, the rational deshearing, and all corrected-fiber and representation-test gradings unchanged, even when $log_Q \| z \|$ is irrational. The only change in the finite invariant Koszul test is in the scalar values subtracted from a fixed list of invariant generators. Its length, shifts, and the preceding geometric bounds are unchanged. All constants in the slice, flag, support, and finite-representation arguments can therefore be chosen uniformly on this central family. The label $mu$ is central-trivial, so its extreme line is unchanged as well. For finitely many hyperspecial variants take the maximum of their constants. Kernels at other places were fixed throughout Proposition 12 and do not affect this uniformity. ◻
]

== 4 Rotation and a trace identity <sec:rotation>

This section compares two ways of closing a positive translation path. One closes it over $bb(F)_q$; the other closes it after moving its initial segment past Frobenius. The comparison requires a connected Picard group. We construct that group using a divisible norm lift on the splitting cover of the generic centralizer. Its modulus retains the entire level divisor, including its multiplicities.

=== 4.1 Levels, translations, and genericity <levels-translations-and-genericity>

Throughout this section $G$ may be split reductive. Fix a split maximal torus $T$, its Weyl group $W$, and the translation lattice $Lambda = X_(*) \( T \)$. Put

$ Lambda_0 = { a in Lambda : chevron.l chi \, a chevron.r = 0 upright(" for every ") chi in X^(*) \( G \) } . $

The positive chamber is the chamber of standard Bernstein translations chosen in Section 2. At distinct closed points $x_1 \, dots.h \, x_r$, outside the fixed level divisor $D$, impose Iwahori level. Write $d_j = deg \( x_j \)$ and $q_j = q^(d_j)$. Additional fixed parahoric flags are allowed. All modifications below preserve the full trivialization along $D$.

If $G$ has a split connected center, quotient by a rational free lattice $Xi$ of central modifications whose degree map is injective and has cocompact image in the free abelian degree lattice. Such a lattice exists: central cocharacters span the character-degree space over $bb(Q)$, and rational divisors on $X$ realize a finite-index subgroup of its degree lattice. Choose a representative of every resulting degree coset. Every path used below has degree zero. If it closes in the quotient, its closing central modification has degree zero and is therefore the identity. The same holds for Frobenius closure, since the lattice is rational and point Frobenius preserves character degrees. Thus these paths lift to the selected degree sectors before taking the quotient. This observation also specifies the quotient version of all subsequent constructions.

For a positive tuple $a = \( a_j \)$, set

$ L_a = sum_j d_j ell \( t^(a_j) \) \, #h(2em) T_a = product_j q_j^(- ell \( t^(a_j) \) \/ 2) 1_(I_j t^(a_j) I_j) . $

Here the rational Iwahori has volume one. The $T_a$ extend multiplicatively to the Bernstein torus. They are the #emph[function-normalized] operators of Proposition 8. In particular, at a closed point the character of the pure standard kernel is $\( - 1 \)^(ell \( t^a \)) T_a$, including when the geometric factors are cyclically permuted by Frobenius. We retain this correction for arbitrary translation labels; we do not restrict the Bernstein algebra to an even sublattice.

Choose $u_j$ in the closed positive chamber and in $2 \| W \| Lambda_0$. At the $d_j$ geometric points above $x_j$, repeat $u_j$ identically. Choose positive integral multiples $pi.alt$ of the semisimple fundamental weights that belong to $X^(*) \( T \)$ and are trivial on the connected center. Assume

#[#set math.equation(numbering: n => "(4.1)")
 $ sum_j d_j chevron.l pi.alt \, w_j u_j chevron.r eq.not 0 #h(2em) upright("for every such ") pi.alt upright(" and every ") \( w_j \) in W^r . $ <rot:genericity>]

When $G$ is a torus the condition is empty. We do not require each $u_j$ to be regular.

Write $upright("Fr")$ for point Frobenius, reserving $F$ for the function field. Let $Y_u$ be the open translation shtuka: an object consists of a bundle $cal(E)$ with the specified levels and a meromorphic isomorphism

$ phi.alt : cal(E) arrow.r upright("Fr") \( cal(E) \) $

of exact Iwahori positions $t^(u_j)$ at the geometric legs, preserving all levels away from them. Equivalently one can keep the intermediate bundles in the path. Modifications at distinct legs commute, and the open convolution maps used below identify these descriptions. Put

#[#set math.equation(numbering: n => "(4.2)")
 $ C \( u \) = R Gamma_c \( Y_u \, upright(bold(k)) \) \, #h(2em) M \( u \) = C \( u \) \[ L_u \] \( L_u \/ 2 \) . $ <rot:complex>]

All $ell \( t^(u_j) \)$ are even, so the shift and cyclic-permutation signs in this normalization are trivial. We use the natural Frobenius on $M \( u \)$; in terms of $C \( u \)$ it is $q^(- L_u \/ 2) upright("Fr")^(*)$. The complex $M \( u \)$ is the cyclic complex of the repeated standard translation kernels $J_(u_j)$. For a positive tuple $v$, their coherent commutation with the kernels $J_(v_j)$ lets us apply the character construction in Equation (2.3). Denote the resulting function-normalized endomorphism of $M \( u \)$ by $T_v$, with the parity correction specified above.

#thm([Theorem 4.1.])[
  #emph[Let $u$ satisfy the chamber, divisibility, degree-zero, and genericity conditions above. Let $v$ be any fixed regular positive tuple in $Lambda_0^r$, without a parity restriction. For all sufficiently large integers $n$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(\[ cal(E) \]) \( T_(n u + v) \)_(cal(E) \, cal(E)) = "Tr"_(upright("alt")) \( upright("Fr")^n T_v divides M \( u \) \) . $ <rot:normalized-trace>]

 The diagonal sum uses ordinary matrix entries on the rational isomorphism classes of bundles with level, and is finite. The assertion retains arbitrary multiplicities in $D$ and the allowed central quotient.]
] <rot:trace>

We first bound $Y_u$ and identify its translation operators with finite correspondences. The large-Frobenius trace formula then counts loops whose rotation by the first $u$-segment is identified with Frobenius. The ordinary matrix trace instead counts rational loops. The main comparison uses a connected Picard group to identify these two descent groupoids; the proof of Theorem 19 then assembles the counts.

=== 4.2 Boundedness and separation <boundedness-and-separation>

We first record the elementary translation facts needed to apply the bundle bounds of Proposition 10. If affine Weyl elements $w \, w'$ satisfy $ell \( w w' \) = ell \( w \) + ell \( w' \)$, the open convolution map

#[#set math.equation(numbering: n => "(4.4)")
 $ I w I times^I I w' I arrow.r I w w' I $ <rot:open-product>]

is an isomorphism. Indeed the root subgroups in the two inversion sets are disjoint, and their ordered products give the root coordinates on the inversion set of $w w'$. Thus a path of exact position $w w'$ has a unique intermediate flag of the prescribed type. This statement, with its intermediate isomorphisms, also holds for Hecke groupoids. In particular, translations in one closed chamber have unique length-additive subdivisions.

For an ordinary local automorphism $g$ with $g^m in I t^(m b) I$ for all $m gt.eq 1$, its dominant Newton vector is $b$. Here the Newton vector means the valuations of its semisimple part, viewed as a cocharacter modulo $W$. Here is a linear-algebra verification that also works on a wall. In any highest-weight representation, an integral torus-weight lattice is preserved by $I$. The growth rates of the operator norms of $g^m$ and its dual are consequently the extremal pairings of its weights with $m b$. Over a finite splitting extension, put $g$ in Jordan form. Its unipotent part has finite $p$-power order, and conjugation by the fixed change-of-basis matrix changes logarithmic operator norms by a bounded amount. The same growth rates are therefore those of the valuations of its semisimple eigenvalues. As the highest weights vary, these extremal pairings determine the dominant cocharacter, proving that it is $b$. No semisimplicity of the representation in positive characteristic is needed. If $g$ preserves a parabolic reduction, the valuation of a character of that parabolic is its pairing with the Newton vector in the corresponding Levi, hence with a Weyl conjugate of $b$ in $G$.

#thm([Lemma 4.2.])[
  #emph[Under Equation (4.1), $Y_u$ is a separated Deligne–Mumford stack of finite type, and $C \( u \)$ is a bounded complex with finite-dimensional cohomology. For a fixed regular positive $v in Lambda_0^r$ and all sufficiently large integers $n$, the ordinary rational loop groupoid of exact position $n u + v$ has finitely many isomorphism classes and finite mass. Only bundles of instability $O \( 1 + n \)$ occur in it.]
] <rot:bounded>

#proof[
  Suppose the instability in $Y_u$ were unbounded. Proposition 10 would give a maximal-parabolic canonical reduction preserved by $phi.alt$, where preservation means that the reduction is carried to its Frobenius image. Work first at a geometric point with all its data defined over $bb(F)_(q^b)$, enlarging $b$ to be divisible by every $d_j$. Iterating $phi.alt$ $b$ times gives an ordinary meromorphic automorphism $gamma$ of the bundle. Equation (4.4) puts all its powers, at every geometric point above $x_j$, in the Iwahori cells of translations $m b u_j$.
  Apply the preceding Newton calculation to the preserved reduction. The valuation of its fundamental character at one geometric leg is $b chevron.l pi.alt \, w_j u_j chevron.r$ for some $w_j$. The original Frobenius path intertwines the consecutive local automorphisms and their reductions. Since the character of the split parabolic is also preserved, its valuation is the same at all $d_j$ geometric points above $x_j$. The product formula for the meromorphic character therefore gives
  $ b sum_j d_j chevron.l pi.alt \, w_j u_j chevron.r = 0 \, $
  contrary to Equation (4.1). Proposition 10 now bounds the instability, so boundedness of bundles and of the Hecke positions gives finite type. This argument includes wall labels, which merely allow more Weyl choices.
  The shtuka condition makes inertia unramified. Infinitesimally an automorphism compatible with $phi.alt$ equals its transported Frobenius pullback; the latter has zero differential, so its tangent vector is zero. Automorphism schemes of a bundle with bounded level are affine of finite type. Thus the inertia is quasi-finite, and $Y_u$ is Deligne–Mumford.
  For separation, let two objects over a discrete valuation ring $R$ be isomorphic over its fraction field. Choose a faithful representation of $G$. At the generic point of the special fiber of $X_R$, both path maps are integral isomorphisms: the legs are horizontal. If $m$ is the smallest valuation of a matrix entry of the generic isomorphism, compatibility with the paths gives $m = q m$, since base Frobenius multiplies vertical valuations by $q$ and multiplication by an integral invertible matrix preserves the smallest valuation. Hence $m = 0$. The same argument applies to the inverse. The isomorphism consequently extends at that vertical generic point. All horizontal codimension-one points are already covered by the generic-fiber bundle isomorphism. Normality of the smooth surface $X_R$ and affineness of the isomorphism torsor extend it across codimension two. The path identities extend by density. So do the prescribed level identities: $D_R$ is flat over $R$, including when $D$ is nonreduced. The same argument treats fixed parahoric flags. This proves the valuative criterion for the quasi-finite diagonal, which is therefore proper.
  For completeness, finite-dimensional compact cohomology can be reduced to the corresponding assertion for algebraic spaces. On this bounded family, choose a sufficiently large effective divisor $N$ disjoint from the legs and the existing level such that an automorphism equal to the identity on $N$ is the identity. A faithful representation reduces this to the uniform vanishing of sections of a bounded family of endomorphism bundles twisted by $- N$. Frobenius-compatible trivializations on $N$ form a finite étale torsor under
  $ H_N = #scale(x: 120%, y: 120%)[\(] "Res"_(N \/ bb(F)_q) \( G_N \) #scale(x: 120%, y: 120%)[\)] \( bb(F)_q \) . $
  Indeed the jet group $"Res"_(N \/ bb(F)_q) \( G_N \)$ is smooth and connected, and its Lang map is finite étale and surjective. The resulting rigidified shtuka is a separated algebraic space of finite type with a finite-group quotient equal to $Y_u$. Compact cohomology is therefore bounded and finite-dimensional; taking $H_N$-invariants is exact over $upright(bold(k))$. The same reduction applies to weights. A finite-type algebraic space over a field admits a finite stratification by schemes, obtained by successively choosing a dense open subspace that is a scheme. Excision transfers the scheme weight bounds to this algebraic space, and exact finite-group invariants retain them. Thus the pure constant coefficient in Equation (4.2) has the usual integral-weight compact cohomology bounds, without any appeal to a weight theorem for arbitrary Artin stacks.
  Finally, $a = n u + v$ is regular positive, and for each fixed pairing in Equation (4.1) the corresponding pairing for $a$ is a nonconstant affine function of $n$. Thus $a$ satisfies the same nonvanishing condition for all sufficiently large $n$. A rational ordinary loop of type $a$ with excessive instability has, by Proposition 10, a preserved maximal-parabolic reduction. The same character and product-formula argument excludes it. The quantitative bound is $O \( 1 + n \)$. There are finitely many rational bundles in that range, and each admits only finitely many rational meromorphic automorphisms with these pole bounds: in a faithful representation they lie in a fixed finite-dimensional space of sections over a finite field. The automorphism group of every such rational loop has finitely many rational points. This proves the last assertion. ◻
]

=== 4.3 The finite correspondence underlying a translation <the-finite-correspondence-underlying-a-translation>

For a positive tuple $v$, let $cal(C)_v$ classify a commuting square

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$cal(E)$])
  content((2.981, 0), [$cal(E)'$])
  content((0, -1.585), [$upright("Fr") \( cal(E) \)$])
  content((2.981, -1.585), [$upright("Fr") \( cal(E)' \) .$])
  line((0.336, 0), (2.579, 0), mark: (end: ">"))
  content((1.458, -0.2266), [#text(size: 0.73em)[$h$]])
  content((1.458, 0.2266), [#text(size: 0.73em)[$v$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.2741, -0.7927), [#text(size: 0.73em)[$phi.alt$]])
  line((2.981, -0.2725), (2.981, -1.313), mark: (end: ">"))
  content((3.304, -0.7927), [#text(size: 0.73em)[$phi.alt'$]])
  line((0.732, -1.585), (2.117, -1.585), mark: (end: ">"))
  content((1.425, -1.812), [#text(size: 0.73em)[$upright("Fr") \( h \)$]])
})

The vertical paths have type $u$, and $h$ has type $v$. Denote the initial and final shtuka projections by $p$ and $q$ respectively. The direction used on cohomology is $p_(!) q^(*)$, pullback towards the initial vertex.

#thm([Lemma 4.3.])[
  #emph[The two projections of $cal(C)_v$ are finite étale after passing to perfections. On $C \( u \)$ the function-normalized categorical translation is 
#[#set math.equation(numbering: n => "(4.5)")
 $ T_v = q^(- L_v \/ 2) p_(!) q^(*) . $ <rot:geometric-operator>]

 These correspondences compose according to addition in a closed chamber. For $v = u$ the correspondence is the graph of point Frobenius, so $T_u$ acts as Frobenius on $M \( u \)$.]
] <rot:finite-correspondence>

#proof[
  We first work at one geometric leg. Take a reduced gallery for $t^v$. After a prefix $b$, cyclic rotation changes the shtuka label to the translation $tau = b^(- 1) t^u b$. Since $u$ and $v$ lie in one closed chamber,
  $ ell \( t^u b \) = ell \( t^u \) + ell \( b \) . $
  For the next simple reflection $s$, one has $ell \( tau s \) = ell \( tau \) + 1$. A translation has opposite left and right length changes at a wall to which its vector is not parallel. Consequently either $s$ is an initial letter of $tau$, or $tau$ is parallel to the $s$-wall and commutes with $s$.
  In the first case write $tau = s w$. Unique open subdivision identifies the step with the cyclic rotation from the path $s w$ to the path $w s$. It is an isomorphism on perfections. The cancellation of the inverse simple kernel against that initial factor in the categorical action is precisely the cyclic isomorphism of Proposition 7. Thus its unnormalized action is pullback along this geometric step.
  For a closed leg of degree $d$, perform this rotation on the whole block of $d$ geometric factors. Cyclicity applied to $Delta_s^(times.square d) star.op Delta_w^(times.square d)$ changes the repeated label $tau = s w$ to the repeated label $w s = s tau s$; unique reduced subdivisions identify both ends with the stated path stacks.
  In the parallel case, pass from the alcove to its $s$-panel. The partial relative position identifies the two rank-one flag varieties: on the root groups for that panel, translation conjugation has exponent zero. A refinement of the partial shtuka is therefore a flag fixed by the resulting Frobenius-semilinear identification. Over a degree-$d$ closed leg, these refinements form a finite étale family of $q^d + 1$ flags. To check this over a general base, trivialize the rank-one torsor étale locally and use the Lang map for its connected rank-one group; the fixed flags then become $bb(P)^1 \( bb(F)_(q^d) \)$. If $pi$ denotes the map forgetting this refinement, the closed simple correspondence acts by $pi^(*) pi_(!)$, and the open simple correspondence acts by
  #[#set math.equation(numbering: n => "(4.6)")
   $ pi^(*) pi_(!) - "id" . $ <rot:panel-action>]
  Here Equation (4.6) is also an equality with the categorical transfer, rather than only an equality of trace functions. Use the unshifted closed rank-one kernel, which factors through the panel projection. Its unit and counit give the diagonal and projection maps for the proper flag variety. After restriction to the twisted trace, the Frobenius graph meets the diagonal transversely: its linearized fixed-point equation has derivative $- 1$. Every fixed flag therefore has coefficient one in the unit/counit transfer. The projection formula identifies the resulting operator with sum and pullback over the finite family of fixed flags. This is the explicit rank-one calculation in Proposition 8. Subtracting the identity kernel by the standard open/closed triangle gives Equation (4.6). In particular no compact cohomology shift of the flag variety remains in this finite transfer.
  At a closed leg the same calculation is made in the product of its $d$ geometric flag varieties, with Frobenius cyclically permuting the factors. A fixed tuple is determined by one $bb(F)_(q^d)$-flag. The same transverse intersection proves the coefficient-one assertion and gives the parameter $q^d$. Graded cyclic permutation produces the single-factor parity in the pure standard kernel. The correction defining $T_v$ removes that parity even when $v$ is odd. Thus normalization gives the factor $q^(- L_v \/ 2)$ in Equation (4.5).
  Length-zero gallery steps identify the relevant paths. Composing the two kinds of simple steps proves finiteness on perfections and the operator assertion. Unique subdivision also proves compatibility of composition and of commuting-translation shuffles. When $v = u$, the two initial steps in the commuting square are subdivisions of the same path of position $2 u$ and hence coincide. The square is therefore $h = phi.alt$, $cal(E)' = upright("Fr") \( cal(E) \)$, and $phi.alt' = upright("Fr") \( phi.alt \)$. Its action is $upright("Fr")^(*)$ on $C \( u \)$; after the normalization in Equation (4.2) it is Frobenius on $M \( u \)$. ◻
]

=== 4.4 The Frobenius trace and the shifted loop condition <the-frobenius-trace-and-the-shifted-loop-condition>

We use the following precise form of the large-Frobenius trace theorem. If $A arrow.l^(c_2) C arrow.r^(c_1) A$ is a correspondence of separated finite-type schemes over $bb(F)_q$, with $c_1$ proper and $c_2$ quasi-finite, then, for all sufficiently large $n$, its Frobenius-twisted fixed-point set is finite and the alternating compact trace equals the sum of the naive local traces. This is #cite(label("Varshavsky")) Theorem 2.3.2(a),(b) and Remark 2.3.3(c), with the open subset there equal to all of $A$. The same proof applies to compactifiable algebraic spaces, as stated in the final paragraph of that paper’s introduction. In our application both projections are finite and the coefficient is constant, so each point counted by the pullback/sum correspondence has local trace one.

Here is the reduction that avoids invoking such a theorem directly for a stack. Use the rigidifying divisor $N$ from the proof of Lemma 20. Every Hecke step at the legs transports its $N$-trivialization uniquely. Hence the correspondence lifts to the rigidified algebraic space $tilde(Y)_u$, commutes with the constant finite group $H_N$, and has finite projections. Exact averaging gives

#[#set math.equation(numbering: n => "(4.7)")
 $ "Tr"_(upright("alt")) \( upright("Fr")^(n *) U_v divides C \( u \) \) = frac(1, \| H_N \|) sum_(h in H_N) "Tr"_(upright("alt")) \( h thin upright("Fr")^(n *) tilde(U)_v divides R Gamma_c \( tilde(Y)_u \, upright(bold(k)) \) \) \, $ <rot:averaging>]

where $U_v = p_(!) q^(*)$ is unnormalized. Apply the theorem to the finitely many lifted correspondences. The fixed-point groupoid downstairs is the quotient of the disjoint union of their twisted fixed points by $H_N$, with $H_N$ acting by conjugation on the twisting element. Its weighted cardinality is exactly the right side of Equation (4.7) after replacing traces by counts. This proves the stack formula with all automorphism factors.

If a gallery rotation uses an inverse purely inseparable map, choose a fixed Frobenius power that clears its denominator, and do the same for the finitely many maps in the correspondence. The resulting correspondence has finite algebraic models. Composing it with $upright("Fr")^(n - b)$ gives the original correspondence composed with $upright("Fr")^n$. Since compact étale cohomology and fixed geometric points are invariant under the intervening universal homeomorphisms, the preceding argument applies once $n$ exceeds this fixed $b$. The Frobenius operators in this procedure are transported with the correspondence; none is replaced by the identity.

Let $cal(L)_a$ denote the geometric groupoid of ordinary meromorphic loops of exact position $a$: its objects are $\( cal(E) \, gamma \)$, where $gamma$ is a self-modification preserving the levels. For $a = n u + v$, let $R_u$ rotate the first $u$-segment to the end. It is invertible when $a$ is regular, as will also follow from the torus apartment description below. Write

$ cal(L)_a^(upright("sh")) = { \( cal(E) \, gamma \, iota \) : iota : R_u \( cal(E) \, gamma \) arrow.r^tilde.op upright("Fr") \( cal(E) \, gamma \) } . $

Arrows in this notation must respect $iota$.

#thm([Lemma 4.4.])[
  #emph[For sufficiently large $n$, the fixed-point groupoid for $upright("Fr")^(n *) U_v$ on $Y_u$ is equivalent to $cal(L)_(n u + v)^(upright("sh"))$. Consequently 
#[#set math.equation(numbering: n => "(4.8)")
 $ "Tr"_(upright("alt")) \( upright("Fr")^(n *) U_v divides C \( u \) \) = \| cal(L)_(n u + v)^(upright("sh")) \| . $ <rot:shifted-trace>]

]
] <rot:concatenation>

#proof[
  With the direction $p_(!) q^(*)$ used above, the fixed-point identification is $p = upright("Fr")^n q$. Thus its data consist of a shtuka $\( cal(E) \, phi.alt \)$ and a closing step $h : upright("Fr")^n cal(E) arrow.r cal(E)$ of type $v$, compatible with $phi.alt$. Concatenate
  $ cal(E) arrow.r^phi.alt upright("Fr") cal(E) arrow.r dots.h.c arrow.r upright("Fr")^n cal(E) arrow.r^h cal(E) . $
  The total position is $n u + v$ by Equation (4.4). Compatibility with $h$ identifies rotation of the initial $u$-step with point Frobenius.
  Conversely, subdivide a loop of position $n u + v$ into $n$ successive $u$-steps and one $v$-step. The given identification of the first rotation with Frobenius turns the first step into $phi.alt : cal(E) arrow.r upright("Fr") cal(E)$; subsequent steps are its Frobenius translates. If $gamma$ is the total loop, the last step is $h = gamma \( phi.alt^(\( n \)) \)^(- 1)$. The identity $phi.alt gamma = upright("Fr") \( gamma \) phi.alt$ gives the required commuting square for $h$. Unique open subdivision makes these constructions inverse on objects, intermediate isomorphisms, and arrows. The trace formula just proved gives Equation (4.8). ◻
]

=== 4.5 Regular centralizers and connected norm lifts <regular-centralizers-and-connected-norm-lifts>

We will compare the shifted count with the ordinary rational loop count. Only their fixed-point groupoids need be finite; the geometric groupoid $cal(L)_a$ itself need not be bounded.

For a torus $G$, the centralizer is already split and all the degree-zero labels are zero, so the following apartment assertion is empty. Otherwise, for a regular positive $a_j$, an ordinary local automorphism $g$ of position $t^(a_j)$ has all powers in the positions $t^(m a_j)$ by Equation (4.4). We explain why this forces both strong regularity and the apartment assertion needed for rotation. Work over a finite extension over which the object and its local flag are defined, and use the reduced affine building of $G$ there. Let $A_0$ be the base alcove. Its Iwahori fixes it pointwise #cite(label("TitsReductiveLocal")) Sections 1.2 and 3.7. For every point $z in A_0$, writing $g^m = i_1 t^(m a_j) i_2$ gives

$ d \( z \, g^m z \) = d \( z \, t^(m a_j) z \) = m parallel a_j parallel . $

Equality in the triangle inequality for $m = 2$ shows that the segments $\[ g^k z \, g^(k + 1) z \]$ concatenate to a geodesic axis. Its direction is regular, since its vector distance is $a_j$. After taking a power to remove the finite permutation of building types, the minimum set of this regular-axis isometry is a unique apartment; this is #cite(label("CapraceCiobotaru")) Lemma 2.3. The original $g$ preserves this apartment because it commutes with its power. Its finite Weyl part fixes the regular translation vector and hence is trivial. Thus $g$ acts on the apartment by a translation. An apartment corresponds to a maximal split torus $S$, and its stabilizer is $N_G \( S \)$ #cite(label("TitsReductiveLocal")) Section 2.1. The trivial finite Weyl part therefore puts $g$ in $Z_G \( S \) = S$, since $G$ is split. The central Euclidean factor for reductive $G$ can simply be restored; the labels under consideration have zero character degree.

Every point of $A_0$ lies on such an axis, so the original flagged lattice belongs to that torus apartment. The valuations of its root characters are the root pairings with $a_j$, all nonzero. In particular no root value is one. Moreover, a Weyl element centralizing $g$ would fix its regular valuation vector and must be the identity. Hence $g$ is strongly regular semisimple and this split torus is its full centralizer. Unique subdivision in the apartment now identifies $R_u$ with local modification by the ordered cocharacter $u_j$. Modification by $- u_j$ is its inverse. This description is unchanged by further extension of the residue field.

The generic conjugacy invariant of a loop fixed by either ordinary or shifted Frobenius is rational: rotation does not change that invariant. Fix one such invariant $c$. It determines a canonical torus $S_c \/ F$ with a tautological element $gamma_c in S_c \( F \)$. This construction is obtained by descending the split torus along the Weyl torsor above $c$. For any realization of $c$ as a strongly regular automorphism, its centralizer is canonically identified with $S_c$: two conjugating choices differ by an element of the same commutative centralizer. The preceding argument first splits this torus after a finite residue extension. Over the original completed field at a closed leg, local Galois acts on its split labels through $W$ and fixes the valuation vector of the rational tautological element. That vector is regular, so its Weyl stabilizer is trivial. Thus $S_c$ is already split over the original completed field. The valuations distinguish the ordering, so the rotation displacements are rational there as well.

#thm([Lemma 4.5.])[
  #emph[If $a$ satisfies Equation (4.1), with $a$ replacing $u$, then $S_c$ has no split cocharacter directions outside the connected center of $G$.]
] <rot:anisotropic>

#proof[
  A noncentral invariant cocharacter can be placed in the closure of a Weyl chamber. Its stabilizer is the Weyl group of a proper standard Levi. Choose a fundamental character for a simple root missing from that Levi, multiplied to be integral. It is fixed by the arithmetic monodromy of $S_c$, and so defines a rational character $chi$ of that torus. The value $chi \( gamma_c \)$ is a rational function on $X$. Away from the legs it is a unit: any realization of the loop is an integral automorphism there, as is its inverse, and hence all its torus-character valuations vanish. At a leg its valuation is $chevron.l pi.alt \, w_j a_j chevron.r$ for a Weyl choice $w_j$. The product formula contradicts the assumed nonvanishing. This argument uses the tautological torus element and therefore applies even before a rational bundle realizing $c$ has been chosen. ◻
]

#thm([Lemma 4.6.])[
  #emph[Suppose $a = n u + v$ is regular and satisfies the nonvanishing condition, and suppose the two fixed-point groupoids in question are finite. Then ordinary and shifted Frobenius descent on $cal(L)_a$ have the same weighted count: 
#[#set math.equation(numbering: n => "(4.9)")
 $ \| cal(L)_a \( bb(F)_q \) \| = \| cal(L)_a^(upright("sh")) \| . $ <rot:descent-count>]

 The assertion holds with arbitrary multiplicities in $D$ and after the central quotient described above.]
] <rot:picard>

#proof[
  We give the comparison separately for each rational invariant $c$. First we construct a connected group acting on suitable full-level subgroupoids of loops. We then realize rotation as a rational point of that group and use Lang’s theorem to compare the two descent conditions. Let $Y arrow.r X$ be the normalization in a connected arithmetic Galois splitting field of $S_c$. Its group $Gamma$ is a subgroup of $W$; write $N = \| Gamma \|$. This cover need not be geometrically connected. It is split and unramified at the regular legs. Let $sans(M) = X_(*) \( T \)$ be the abstract split cocharacter lattice used on the cover. There is a norm homomorphism of generic tori
  #[#set math.equation(numbering: n => "(4.10)")
   $ nu : "Res"_(F \( Y \) \/ F) \( bb(G)_m ⊗_(bb(Z)) sans(M) \) arrow.r S_c \, $ <rot:norm>]
  which multiplies Galois conjugates with their descent action on $sans(M)$. We will use a connected source for this norm. Neither surjectivity nor separability of the norm itself is required.
  Choose a finite rational set $Z subset X$ disjoint from the legs and containing the support of $D$, the ramification points, the points where $gamma_c$ is not regular integral, and all other prescribed level points. Add one auxiliary closed point outside the legs. For an effective rational modulus $B$ supported on the full inverse image of $Z$, with positive multiplicity at every such point, put
  #[#set math.equation(numbering: n => "(4.11)")
   $ Q_B = "Pic"^(underline(0)) \( Y \, B \) ⊗_(bb(Z)) sans(M) . $ <rot:picard-source>]
  The superscript means degree zero on #emph[each geometric component]. The modulus meets every component, so a line bundle with its specified $B$-trivialization has no scalar automorphisms. Consequently $Q_B$ is an actual smooth connected commutative algebraic group. One can see this from the generalized-Picard exact sequence: over the algebraic closure it is an extension of the product of the component Jacobians by the products of the local truncated unit groups, modulo one constant multiplicative group per component. A truncated unit group is smooth and connected, including for nonreduced moduli in positive characteristic. This is also the precise representability and connectedness statement in #cite(label("JordanRibetScholl")) Section 1.4, Proposition 1.6 and the following paragraph. The auxiliary point rigidifies this source only; it adds no level to the original loop problem.
  For the descent comparison, it suffices to construct a coherent action of $Q_B \( overline(bb(F))_q \)$ on geometric objects and arrows, compatible with Frobenius. We now impose the integral conditions that retain the full level. Let $cal(L)_(a \, c \, B)$ be the full subgroupoid on objects for which norms of split congruence units at $B$ preserve the local lattices, all flags, and the complete $D$-trivialization. Every object belongs to such a subgroupoid after increasing the multiplicities of $B$. Indeed the generic torus embedding and the norm are continuous for the local valuation topologies; sufficiently deep units map into the prescribed principal congruence stabilizer. Away from $Z$ and the legs the regular integral centralizer is an unramified torus, and its integral units preserve the lattice. At the legs this follows from the centralizer-apartment description above.
  Represent an element of $Q_B \( overline(bb(F))_q \)$ by an $sans(M)$-valued divisor disjoint from $B$. Such a representative exists by choosing meromorphic sections agreeing with its trivializations to the specified finite orders. Modify the bundle at the image of its support by the norm cocharacters in Equation (4.10): change the local trivializations at those points and glue them to the unchanged torsor away from the support. This uses formal gluing for smooth affine torsors on a curve, applied at finitely many points; see #cite(label("PappasZhu")) arXiv version, Section 5.a, Lemma 5.1. At $Z$ keep the original lattice and its level. All modifications commute with $gamma_c$, so the result remains a loop with the same invariant and the same relative positions at the legs. If two representatives differ by the divisor of a rational split-torus function $h$ with $h \|_B = 1$, the meromorphic automorphism $nu \( h \)$ identifies the two results. At $Z$ it extends and preserves the full nonreduced level by the defining stabilizer condition; elsewhere it is the usual change of lattice trivialization. The normalized function $h$ is unique: the ratio of two choices is constant on each geometric component and equals one along $B$. The ratios of three representatives multiply, so these isomorphisms satisfy their cocycle identities. Tensor product therefore gives a coherent action of $Q_B \( overline(bb(F))_q \)$ on the groupoid. An arrow between loops identifies their canonical centralizers and carries each norm modification to the corresponding one. Thus the action is natural in all arrows, including every target automorphism.
  The action preserves $cal(L)_(a \, c \, B)$. Namely a torus modification does not change which elements of the commuting norm-unit subgroup stabilize a lattice. The same observation proves stability under $R_u$. All these constructions are Frobenius-compatible, since the cover and the modulus are rational.
  We next exhibit rotation in the connected source Equation (4.11). At a geometric point $y$ of $Y$ over the leg $x_j$, let $nu_y in sans(M) ⊗ bb(Q)$ be the valuation vector of the tautological element $gamma_c$ in the split coordinates on $Y$. It belongs to the Weyl orbit of $a_j$. Since $a_j$ is regular, there is a unique $w_y in W$ with $nu_y = w_y a_j$. Define the $sans(M)$-valued divisor
  $ Delta = sum_j med sum_(y mapsto x_j) w_y \( u_j \/ N \) \[ y \] \, $
  where the inner sum runs over all geometric points above $x_j$. These cocharacters are integral because $u_j in 2 \| W \| Lambda_0$ and $N$ divides $\| W \|$. The valuation vectors are transported by the deck action and preserved by Frobenius on the abstract constant lattice $sans(M)$. Uniqueness of $w_y$ therefore makes $Delta$ both rational and $Gamma$-equivariant with its descent action on the labels. Under the ordered local identification, every lift contributes $u_j \/ N$ to its norm. There are $N$ lifts over each geometric leg, so the norm is exactly the rotation modification by $u_j$. The support of $Delta$ avoids $B$, giving its canonical trivialization along the full modulus.
  We verify its multidegree. Let $Gamma_(upright("geom"))$ be the geometric monodromy subgroup, and write $e_C$ for the vector degree of $Delta$ on a geometric component $C$. Deck equivariance gives
  $ e_(gamma C) = gamma e_C \, $
  so $Gamma_(upright("geom"))$ fixes $e_C$. Frobenius preserves the labels of the abstract split torus, and rationality gives $e_(upright("Fr") C) = e_C$. Choose $sigma in Gamma$ inducing the same permutation of geometric components as Frobenius. Then
  $ sigma e_C = e_(sigma C) = e_(upright("Fr") C) = e_C . $
  The coset of $sigma$ generates the cyclic group $Gamma \/ Gamma_(upright("geom"))$. Together with invariance under $Gamma_(upright("geom"))$, this proves
  #[#set math.equation(numbering: n => "(4.12)")
   $ e_C in \( sans(M) ⊗ bb(Q) \)^Gamma . $ <rot:component-degree>]
  By Lemma 23, this vector is central. Every coefficient of $Delta$ lies in the rational subspace annihilating $X^(*) \( G \)$, and so does $e_C$. That derived subspace meets the rational central cocharacter subspace in zero. Thus $e_C = 0$ on every component. This is the point at which arithmetic, rather than merely geometric, monodromy is needed. We have obtained an element $a_B in Q_B \( bb(F)_q \)$ whose action is $R_u$.
  We can now compare descent. Lang’s theorem applies to the smooth connected source $Q_B$; see #cite(label("Lang")) Theorem 1 and its corollary. In this commutative case its surjectivity is especially direct: $upright("Fr") - 1$ has derivative $- 1$, hence has open image, and an open subgroup of a connected algebraic group is the entire group. Choose $b in Q_B \( overline(bb(F))_q \)$ such that
  $ upright("Fr") \( b \) - b = a_B . $
  If $sans(t)_b$ denotes its action, Frobenius compatibility supplies a natural identification
  $ R_u^(- 1) upright("Fr") thin sans(t)_b tilde.eq sans(t)_b thin upright("Fr") . $
  Hence $sans(t)_b$, with inverse $sans(t)_(- b)$, gives an equivalence of descent groupoids
  #[#set math.equation(numbering: n => "(4.13)")
   $ "Fix" \( upright("Fr") \, cal(L)_(a \, c \, B) \) tilde.eq "Fix" \( R_u^(- 1) upright("Fr") \, cal(L)_(a \, c \, B) \) . $ <rot:lang-equivalence>]
  The identity in the source is an isomorphism of rigidified line bundles, with no scalar ambiguity. Equation (4.13) therefore includes the Frobenius isomorphisms and their compatible arrows. It preserves automorphism groups, not only geometric isomorphism classes.
  We also spell out effectivity of the descent used here. An object and a Frobenius isomorphism are defined over a finite extension. After iterating by that extension degree, the resulting automorphism belongs to the rational points of an affine finite-type group over a finite field, hence has finite order. A further iterate is the identity. The datum is thus finite Galois descent, which is effective for bundles, levels, and their meromorphic isomorphisms. Ordinary Frobenius descent is precisely the rational-point groupoid in Equation (4.9). The shifted version can either be read from Equation (4.13) or from the explicit concatenation construction of Lemma 22.
  The subgroupoids $cal(L)_(a \, c \, B)$ exhaust the geometric loop groupoid as the multiplicities grow. Both fixed-point groupoids have finitely many isomorphism classes by hypothesis. Choose $B$ large enough to contain representatives of both. The equivalence then proves equality of their entire weighted counts for $c$. Summing over the finitely many contributing rational invariants proves Equation (4.9).
  Finally, a norm modification arising from componentwise degree-zero source line bundles changes no character degree of $G$. Its action commutes with central modifications and therefore descends to the quotient by $Xi$. The initial degree-lifting observation identifies its closed paths with the ones just considered. This proves the central-quotient assertion as well. ◻
]

=== 4.6 Proof of the trace identity <proof-of-the-trace-identity>

#proof[
  With $U_v = p_(!) q^(*)$ on the unnormalized complex, the identity to prove is equivalently
  #[#set math.equation(numbering: n => "(4.14)")
   $ sum_(\[ cal(E) \]) \( T_(n u + v) \)_(cal(E) \, cal(E)) = q^(- \( n L_u + L_v \) \/ 2) "Tr"_(upright("alt")) \( upright("Fr")^(n *) U_v divides C \( u \) \) . $ <rot:raw-trace>]
  Set $a = n u + v$. For $n$ large it is regular and satisfies the nonvanishing condition. Lemma 20 makes the ordinary loop count finite, and the large-Frobenius formula makes the shifted count finite. For a fixed rational bundle $cal(E)$, closing a Hecke modification whose target is isomorphic to $cal(E)$ amounts to choosing such an isomorphism, modulo its automorphisms. Consequently its diagonal matrix entry is the corresponding loop mass. Summing gives
  $ sum_(\[ cal(E) \]) \( T_a \)_(cal(E) \, cal(E)) & = q^(- L_a \/ 2) \| cal(L)_a \( bb(F)_q \) \|\
 & = q^(- L_a \/ 2) \| cal(L)_a^(upright("sh")) \|\
 & = q^(- L_a \/ 2) "Tr"_(upright("alt")) \( upright("Fr")^(n *) U_v divides C \( u \) \) . $
  The first equality includes the stack multiplicities; no extra reciprocal automorphism factor is to be inserted in the matrix trace. The second equality is Lemma 24, and the third is Lemma 22. Since lengths add in the positive chamber, $L_a = n L_u + L_v$, proving Equation (4.14). Equation (4.5) and the even shift in Equation (4.2) give Equation (4.3). The operator $T_v$ here is function-normalized; the parity correction for an arbitrary $v$ was kept in Lemma 21. ◻
]

== 5 Extraction from the discrete spectrum <sec:extraction>

We prove a local restriction on the discrete automorphic spectrum. All absolute values in this section refer to one fixed complex realization. We transport the coefficient field and the sheaf constructions to that realization as abstract characteristic-zero linear algebra. The eigenvalues coming from mixed compactly supported cohomology retain their Weil weights under this transport.

Let $G$ be split connected reductive and let $T$ be a split maximal torus. An #emph[ordered Bernstein weight] of a local representation at a place $x$ is a character $t_0 : X_(*) \( T \) arrow.r upright(bold(k))^times$ occurring in its Iwahori invariants, before passage to its Weyl orbit. Put $q_x = q^(deg \( x \))$ and define its exponent by

$ chevron.l lambda_0 \, a chevron.r = log_(q_x) \| t_0 \( a \) \| . $

We call this exponent dominant if $chevron.l lambda_0 \, alpha^or chevron.r gt.eq 0$ for every positive root $alpha$ of $G$, with the positive-translation convention of Section 2.

#thm([Theorem 5.1.])[
  #emph[Let $G$ be split connected reductive, let $x$ be a closed point, and impose Iwahori level at $x$ and arbitrary fixed compact open level away from $x$. Let $pi$ be a unitary discrete automorphic representation with nonzero invariants at that level. If an ordered Bernstein weight $t_0$ of $pi_x$ has dominant exponent $lambda_0 = log_(q_x) \| t_0 \|$, then 
#[#set math.equation(numbering: n => "(5.1)")
 $ t_0 tilde.op phi.alt mat(delim: "(", q_x^(1 \/ 2), 0; 0, q_x^(- 1 \/ 2)) c \, $ <ext:local-form>]

 where $phi.alt : "SL"_2 arrow.r hat(G)$ is a homomorphism and $c$ is semisimple and conjugate into a maximal compact subgroup of $Z_(hat(G)) \( phi.alt \)$.]
] <ext:discrete>

The proof is an induction on semisimple rank. For a hypothetical violating weight, a polynomial spectral filter and the rotation trace identity force its occurrence in compact cohomology of translation shtukas. Integral Frobenius weights then make $lambda_0$ rational, allowing integral highest weights $mu = m lambda_0$ along its exact ray. The Wakimoto filtration isolates the repeated highest-weight term, and hyperspecial projections transfer its high-degree cohomology to the spherical calculation. A separate spherical dg model supplies an actual chain projector onto this summand. A finite Koszul test preserves its highest nonzero cohomological degree, which the Frobenius lower bound and Theorem 18 then bound incompatibly as $m$ grows. A fixed auxiliary place makes the translation shtukas bounded even when the ray lies on a chamber wall.

=== 5.1 Dominant ordered weights and hyperspecial projections <dominant-ordered-weights-and-hyperspecial-projections>

We first isolate the local algebra needed for passage from Iwahori to hyperspecial level. Throughout this subsection, $Q > 1$ is the residue cardinality. Let $L = X_(*) \( T \)$ be the cocharacter lattice of a split connected reductive group, let $W$ be its finite Weyl group, and let

$ cal(H) = cal(H) \( L \, Q \) \, #h(2em) A = upright(bold(k)) \[ L \] \, #h(2em) Z = A^W $

be its Iwahori Hecke algebra, Bernstein subalgebra, and center. We use the group-theoretic Bernstein presentation in #cite(label("HainesKottwitzPrasad")) Lemmas 1.6.1 and 1.7.1, Remark 1.7.2, and Equation (1.15.2). The coefficient field $upright(bold(k))$ is algebraically closed of characteristic zero. The unnormalized finite simple generators, denoted here by $sans(T)_s$, satisfy

$ \( sans(T)_s - Q \) \( sans(T)_s + 1 \) = 0 . $

We write $theta_a$ for the Bernstein element corresponding to $a in L$. In the positive chamber of standard translations it is

$ theta_a = Q^(- ell \( t^a \) \/ 2) sans(T)_(t^a) = T_a . $

Thus the trivial representation has positive real Bernstein exponent. With $alpha$ a positive simple root of the group, the Bernstein relation in these conventions is

#[#set math.equation(numbering: n => "(5.2)")
 $ theta_a sans(T)_s - sans(T)_s theta_(s a) = \( Q - 1 \) frac(theta_a - theta_(s a), 1 - theta_(- alpha^or)) . $ <ext:bernstein-relation>]

The quotient on the right belongs to $A$.

For a character $t : L arrow.r upright(bold(k))^times$, choose a complex realization of its values and write $lambda = log_Q \| t \| in "Hom" \( L \, upright(bold(R)) \)$. We call $t$ dominant if

#[#set math.equation(numbering: n => "(5.3)")
 $ lambda \( alpha^or \) gt.eq 0 #h(2em) \( alpha > 0 \) . $ <ext:dominant-character>]

This condition places no restriction on the central part of $lambda$. Put $c = W t in "Spec" \( Z \)$ and

$ R = hat(Z)_c \, #h(2em) B = cal(H) ⊗_Z R . $

Since $A$ is finite over $Z$, its completed scalar extension decomposes as

$ A ⊗_Z R tilde.eq product_(r in W t) hat(A)_r . $

Let $p_t$ be the idempotent of this product selecting the factor at $t$. On a finite-dimensional module with central character $c$, $p_t$ selects the generalized $A$-weight space at $t$.

Choose a base alcove in the reduced building. Let $cal(V)$ be its finite set of hyperspecial vertices and let $e_v in cal(H)$, $v in cal(V)$, be their normalized parahoric idempotents. In particular, at the base hyperspecial vertex,

#[#set math.equation(numbering: n => "(5.4)")
 $ e = frac(sum_(w in W) sans(T)_w, sum_(w in W) Q^(ell \( w \))) . $ <ext:spherical-idempotent>]

The denominator is nonzero. All these vertices are conjugate under the length-zero alcove stabilizer for the adjoint semisimple root datum; the corresponding conjugate idempotents belong to $cal(H)$ even when those length-zero elements do not belong to its original extended Weyl group.

#thm([Lemma 5.2.])[
  #emph[Suppose that $t$ satisfies Equation (5.3). Then, in $B$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ B p_t B = sum_(v in cal(V)) B e_v B . $ <ext:hecke-ideals>]

 Equivalently, a simple module at the central character $W t$ contains the ordered Bernstein weight $t$ if and only if at least one of the hyperspecial idempotents acts nontrivially on it.]
] <ext:hecke>

#proof[
  We first treat the full semisimple coweight lattice, then descend through a finite lattice extension, and finally pass from simple modules to idempotent ideals.
  #emph[The full lattice.] Suppose first that $L$ is the direct sum of the full coweight lattice of the semisimple root system and a central lattice. The latter contributes a central Laurent polynomial algebra and may be specialized at its character. It therefore suffices to consider the semisimple factors. For a character $r$ put
  $ I \( r \) = cal(H) ⊗_A upright(bold(k))_r . $
  Its spherical line is spanned by $upright(bold(1))_r = sum_(w in W) sans(T)_w ⊗ 1$. We use the following precise principal-series theorem: for the full weight lattice of a root system, the spherical vector generates the principal-series module if and only if
  #[#set math.equation(numbering: n => "(5.6)")
   $ product_(alpha > 0) #scale(x: 120%, y: 120%)[\(] 1 - Q r \( alpha^or \) #scale(x: 120%, y: 120%)[\)] eq.not 0 . $ <ext:spherical-cyclicity>]
  This is #cite(label("Ram")) Proposition 2.11(b), applied to the dual root system. The parameter denoted by $q$ there is $Q^(1 \/ 2)$ here, and its finite generator is $Q^(- 1 \/ 2) sans(T)_s$. Thus the exceptional root value in that proposition is $Q^(- 1)$, as in Equation (5.6). The result includes singular characters. For a product of root systems it follows by tensor product. Its characteristic-zero formulation over $upright(bold(k))$ follows by extension of scalars: the finite matrices determining cyclicity are defined over the field generated by the finitely many character values and $Q^(1 \/ 2)$, which admits a complex realization.
  If $r$ is dominant, every positive-coroot value has modulus at least one, so Equation (5.6) holds. Consequently $I \( r \)$ is generated by $upright(bold(1))_r$. A simple module $S$ containing the generalized weight $r$ contains an ordinary eigenvector of that weight: a finite-dimensional module over a commutative algebra has a common eigenvector in each nonzero generalized weight space. Inducing such a vector gives a surjection $I \( r \) arrow.r S$. The generating spherical vector cannot map to zero, so $e S eq.not 0$.
  Conversely, there is exactly one spherical simple at each central character. For completeness, this follows directly from the spherical Satake identity $e cal(H) e = Z e$ #cite(label("HainesKottwitzPrasad")) Sections 4.1 and 4.6, Equation (4.6.1). At a central character $c'$, the module
  $ P = cal(H) e ⊗_Z upright(bold(k))_(c') $
  is finite-dimensional and satisfies $e P = upright(bold(k)) e$. Every proper submodule of $P$ has zero $e$-projection, since any submodule containing $e P$ contains the generator of $P$. The sum of its proper submodules is therefore proper and is its unique maximal submodule. Any simple module $S$ with $e S eq.not 0$ and central character $c'$ is a quotient of $P$: for $0 eq.not u in e S$, simplicity gives $S = cal(H) u$ and $e S = \( e cal(H) e \) u = upright(bold(k)) u$. This proves uniqueness.
  At $c' = W r$, every simple quotient of $I \( r \)$ is spherical by the preceding paragraph. Hence its unique spherical simple is such a quotient and contains $r$, since the inducing vector generates $I \( r \)$ and has a nonzero image in every nonzero quotient. We have proved, for the full lattice and every dominant $r$,
  #[#set math.equation(numbering: n => "(5.7)")
   $ S \[ r \] eq.not 0 quad arrow.l.r.double quad e S eq.not 0 \, $ <ext:full-lattice-detector>]
  where $S \[ r \]$ denotes the generalized weight space.
  #emph[A finite enlargement for a general reductive lattice.] Let $V = L ⊗_(upright(bold(Z))) upright(bold(Q))$. Write
  $ V = V_(upright("ss")) xor V_(upright(c)) \, $
  where $V_(upright("ss"))$ is the rational span of the coroots and $V_(upright(c))$ is the common kernel of the roots. Let $Q^or$ and $P^or$ be the coroot and full coweight lattices in $V_(upright("ss"))$, and put
  $ L_(upright("ss")) = L ∩ V_(upright("ss")) \, #h(2em) L_(upright(c)) = "pr"_(upright(c)) \( L \) \, #h(2em) L' = P^or xor L_(upright(c)) . $
  The projection is rational, so $L_(upright(c))$ is a lattice. Root integrality gives $"pr"_(upright("ss")) \( L \) subset P^or$; hence $L subset L'$. The inclusion has finite index, and
  #[#set math.equation(numbering: n => "(5.8)")
   $ Gamma = L' \/ L tilde.eq P^or \/ L_(upright("ss")) . $ <ext:lattice-quotient>]
  Indeed the map from $P^or$ to $L' \/ L$ is surjective because $L arrow.r L_(upright(c))$ is surjective, and its kernel is $L_(upright("ss"))$. In particular $Q^or subset L_(upright("ss"))$.
  Set $cal(H)' = cal(H) \( L' \, Q \)$ and $A' = upright(bold(k)) \[ L' \]$. The Weyl group acts trivially on $Gamma$, since $w a' - a' in Q^or$ for $a' in L'$. The Bernstein presentation consequently grades $cal(H)'$ by $Gamma$, with degree-zero subalgebra $cal(H)$. Each component has an invertible homogeneous element $theta_(a')$, which commutes with $A$. Thus
  #[#set math.equation(numbering: n => "(5.9)")
   $ cal(H)' = xor.big_(gamma in Gamma) theta_(a'_gamma) cal(H) $ <ext:strong-grading>]
  is a strong finite grading. No splitting of $Gamma$ into a subgroup of units is required.
  We shall also use a different set of homogeneous units. The length-zero stabilizer $Omega'_(upright("ss"))$ of the semisimple base alcove is isomorphic to $P^or \/ Q^or$, and its map onto $Gamma$ is surjective by Equation (5.8). Choose $omega_gamma in Omega'_(upright("ss"))$ in each degree and put $U_gamma = sans(T)_(omega_gamma)$. Then
  #[#set math.equation(numbering: n => "(5.10)")
   $ e_gamma = U_gamma^(- 1) e U_gamma in cal(H) $ <ext:hyperspecial-conjugates>]
  is the idempotent of a hyperspecial vertex. To see the inclusion in $cal(H)$, one may either use its degree zero or note that conjugation by $omega_gamma$ takes the finite Weyl subgroup at the base vertex to the finite parahoric Weyl subgroup at that hyperspecial vertex. Central translations fix the reduced building and give no further idempotents. Taking all of $cal(V)$, rather than just the vertices arising from these representatives, is therefore harmless.
  #emph[Descent of the simple-module detector.] Let $S$ be a simple $cal(H)$-module at the central character $c$. It is finite-dimensional, since $cal(H)$ is finite over $Z$. Choose a simple quotient $S'$ of the finite-dimensional induced module $cal(H)' ⊗_(cal(H)) S$. Adjunction gives a nonzero map $S arrow.r S'$, hence an embedding on restriction. We identify $S$ with its image. Simplicity of $S'$ and the two choices of homogeneous units give
  #[#set math.equation(numbering: n => "(5.11)")
   $ S' = sum_(gamma in Gamma) theta_(a'_gamma) S = sum_(gamma in Gamma) U_gamma S . $ <ext:clifford-sums>]
  Each summand is a simple $cal(H)$-module, because each homogeneous unit normalizes the degree-zero algebra. This also proves directly the needed Clifford-theoretic assertion that the restriction is a semisimple sum of conjugates. More particularly, $theta_(a'_gamma)$ commutes with $A$, so all summands in the first sum have the same $A$-weight support. Consequently
  #[#set math.equation(numbering: n => "(5.12)")
   $ S \[ t \] eq.not 0 quad arrow.l.r.double quad S' \[ t \] eq.not 0 \, $ <ext:restriction-support>]
  with the right-hand side interpreted as an $A$-weight space. The second sum gives the complementary assertion
  #[#set math.equation(numbering: n => "(5.13)")
   $ e S' eq.not 0 quad arrow.l.r.double quad e_gamma S eq.not 0 upright(" for some ") gamma in Gamma . $ <ext:restriction-spherical>]
  Suppose first that $S \[ t \] eq.not 0$. The nonzero $A$-weight space $S' \[ t \]$ contains an $A'$-weight $t'$ restricting to $t$. Since $L$ has finite index in $L'$, restriction determines the real absolute-value exponent uniquely; thus $t'$ is dominant. Applying Equation (5.7) to $cal(H)'$ gives $e S' eq.not 0$. Equation (5.13) now gives a nonzero hyperspecial projection on $S$.
  Conversely, suppose that $e_v S eq.not 0$ for a hyperspecial vertex $v$. The idempotent $e_v$ is conjugate to $e$ by a length-zero unit of $cal(H)'$, so $S'$ is spherical. Let $W r'$ be its $A' ""^W$-central character. Restriction of this central character to $Z$ is $W t$; hence, after replacing $r'$ by a Weyl conjugate, its restriction to $L$ is exactly $t$. This representative $r'$ is dominant. The full-lattice detector says that the spherical simple $S'$ contains $r'$, and hence contains $t$ on restriction to $A$. Equation (5.12) gives $S \[ t \] eq.not 0$. We have proved the asserted equivalence on all simple modules at $c$.
  #emph[The completed ideals.] The algebra $B$ is finite over the complete local ring $R$. Every simple $B$-module is annihilated by the maximal ideal $frak(m)_R$: it is finite over $R$, and centrality and simplicity make $frak(m)_R S$ either zero or $S$, with the second possibility excluded by Nakayama’s lemma. The same assertion holds for every quotient of $B$. Thus the simple $B$-modules are precisely the simple modules of the residue fiber to which the preceding detector applies.
  Put $J = sum_(v in cal(V)) B e_v B$. In $B \/ J$, the image of $p_t$ annihilates every simple module by that detector. It belongs to the Jacobson radical and is an idempotent, so it is zero. Therefore $B p_t B subset J$. Conversely, in $B \/ B p_t B$ every image of $e_v$ annihilates every simple module. These images are again idempotents in the Jacobson radical and are zero. This proves the reverse inclusion and Equation (5.5). ◻
]

#thm([Corollary 5.3.])[
  #emph[In the notation of Lemma 26, let $N = xor.big_i N^i$ be a graded $B$-module whose $B$-action preserves degree. No finite-generation hypothesis on $N$ is imposed. If $p_t N$ is finite-dimensional, then $e_v N$ is finite-dimensional for every $v in cal(V)$. Moreover, 
$ p_t N^i eq.not 0 quad arrow.r.double quad e_v N^i eq.not 0 upright(" for some ") v in cal(V) . $

 These assertions apply in particular to any invariant direct summand selected by a projector commuting with $B$.]
] <ext:hecke-finite>

#proof[
  Equation (5.5) supplies, for each $v$, a finite expression $e_v = sum_j a_j p_t b_j$ with $a_j \, b_j in B$. Hence $e_v N subset sum_j a_j \( p_t N \)$, proving finite-dimensionality. Conversely, write $p_t$ as a finite sum of elements of the ideals $B e_v B$. If all $e_v N^i$ were zero, this expression would give $p_t N^i = 0$. Finally, the image of a projector commuting with $B$ is a $B$-submodule, so the same argument applies to it. ◻
]

=== 5.2 The finite-level analytic input <the-finite-level-analytic-input>

We specify the analytic facts used below. Write $L = X_(*) \( T \)$ for a split maximal torus and put

$ L^0 = { a in L : chevron.l chi \, a chevron.r = 0 upright(" for every ") chi in X^(*) \( G \) } . $

This is a saturated sublattice spanning the semisimple directions. The annihilator of $L^0$ in the dual torus is $Z \( hat(G) \)^compose$. Consequently two ordered parameters have the same character on $L^0$ if and only if they differ by an element of $Z \( hat(G) \)^compose$.

Choose a free group $Xi$ of rational central modifications whose degree image is cocompact in the free central degree lattice and intersects degree zero trivially, as in Section 4. For a compact open level $K$, let

$ cal(L)_K = L^2 #scale(x: 120%, y: 120%)[\(] G \( F \) without G \( bb(A)_F \) \/ \( K Xi \) #scale(x: 120%, y: 120%)[\)] . $

The measure on its point basis includes the usual automorphism factors. An arbitrary unitary automorphic central character can be treated in this model after a unitary unramified twist: a character on the lattice $Xi$ extends to the degree group of $G$, in which its image has finite index, since the circle group is divisible. Such a twist has zero real exponent and does not affect the assertion we shall prove.

#thm([Proposition 5.4.])[
  (Finite-level spectral facts).  #emph[At a fixed compact open level the following assertions hold.]
  + #emph[The discrete summand $cal(D)_K$ of $cal(L)_K$ is finite-dimensional. Its orthogonal complement admits a Hecke-equivariant unitary realization as a closed invariant subspace of a finite sum of direct integrals of normalized parabolic inductions 
$ "Ind"_(P \( bb(A)_F \))^(G \( bb(A)_F \)) \( sigma ⊗ chi \) \, $

 where $P$ is proper, $sigma$ belongs to the discrete spectrum of its Levi $M$, and $chi$ ranges over a compact torus of unitary unramified characters, subject to the central condition imposed by $Xi$. All fixed-level fiber dimensions are bounded.]
  + #emph[Let $Q_b$ be the orthogonal projection onto the point basis in an HN ball of radius $b$. There are constants $C \, c > 0$ such that 
#[#set math.equation(numbering: n => "(5.14)")
 $ parallel \( 1 - Q_b \) v parallel lt.eq C e^(- c b) parallel v parallel #h(2em) \( v in cal(D)_K \, b gt.eq 0 \) . $ <ext:discrete-tail>]

]
  + #emph[Suppose that the level at $x$ is Iwahori. The ordered Bernstein weights of a fiber induced from $M$ have the form 
#[#set math.equation(numbering: n => "(5.15)")
 $ w \( t_M z \) \, #h(2em) w Phi_M^(+) subset Phi_G^(+) \, $ <ext:induced-weights>]

 where $t_M$ is an ordered Bernstein weight of $sigma_x$ and $z$ is the local value of $chi$. There are finitely many such weight families, and their generalized-weight lengths are uniformly bounded.]
] <ext:spectral>

#proof[
  We use the following precise form of Langlands’ spectral theorem. At a fixed compact open level, the discrete pairs $\( M \, sigma \)$ with nonzero fixed-level induced vectors form finitely many classes under Weyl association and unramified twisting. Their compact induced models are finite-dimensional, their unitary twisting spaces are compact real tori modulo finite stabilizers, and Eisenstein wave packets on these spaces give the Hecke-equivariant Hilbert spectral decomposition. This formulation is stated in #cite(label("LLafforgueSpectral")) Theorem III.7 and the preceding definitions, pp. 33–36, where it is identified with #cite(label("MW")) Section VI.2.1; the function-field treatment in the English edition is #cite(label("MW")) Section VI.2.7. The statement includes discrete inducing representations. If the given level is not contained in the chosen standard maximal compact subgroup, intersect it with that subgroup first and then take invariants under the original compact level. This replaces the full compact models by closed invariant subspaces and preserves all the asserted finiteness and norm bounds.
  We explain the effect of $Xi$. Unramified characters are characters of a free degree lattice. On the central degree lattice of $G$, the condition that $sigma ⊗ chi$ be trivial on $Xi$ fixes finitely many characters because the image of $Xi$ has finite index. For $M = G$ this leaves finitely many points of each twisting torus. There are finitely many pairs by the quoted theorem and their fixed-level models have finite dimension, so $cal(D)_K$ is finite. For a proper Levi $M$, the condition cuts its unitary parameter torus into finitely many translates of a closed subtorus, hence leaves a compact parameter space. The wave-packet construction allows finite Weyl identifications between parameters; equivalently it realizes the corresponding Hilbert space inside finitely many full induced compact models. This proves (i) in precisely the form needed here.
  Boundedness of fixed-level induction ranks can also be read directly from the compact picture. The quotient of a maximal compact subgroup by its intersection with the inducing parabolic and the prescribed open level is finite. Its finitely many representatives replace the level on $sigma$ by finitely many compact open subgroups of $M$. Their invariant spaces are finite-dimensional. Unitary unramified twists are trivial on these compact subgroups, so the same dimension bounds hold throughout each torus.
  For (ii), use the exact constant-term assertion on deep function-field Siegel sectors #cite(label("MorrisI")) Chapter I, Section 5.9, p. 107; see also #cite(label("MW")) Section I.2.7. Once the root coordinates outside a Levi are sufficiently large, a function at the prescribed compact level equals its constant term for that parabolic. The threshold is uniform at a fixed level and on the bounded transverse data. The constant-term exponent theorem says that translating an automorphic form’s normalized constant term in the split-center degree variables gives a finite sum of characters times polynomials #cite(label("BernsteinLapid")) Section 6.2, pp. 200–201, Equations (6.1)–(6.3); see also #cite(label("MW")) Sections I.3.1–I.3.2 and I.4.2. We need the strict decay consequence, and give its elementary proof to include all boundary directions.
  Partition a Siegel domain according to which simple-root coordinates are above the constant-term threshold. The remaining roots define the Levi; their bounded coordinates range over bounded data modulo its center. After passing to finite-index degree lattices, finitely many transverse values and translates of positive orthants suffice. Take the image of each sufficiently deep sector in $P \( F \) without G \( bb(A) \) \/ \( K Xi \)$, with its quotient Iwasawa measure $delta_P \( m \)^(- 1) thin d u thin d m thin d k$. The compact unipotent quotient $U \( F \) without U \( bb(A) \)$ has volume one, and the function equals its constant term $f_P$ on this sector. The deep-sector separation statement #cite(label("MorrisI")) Chapter I, Section 4.2, p. 101 puts every additional rational identification within a sector in $P \( F \)$, which has already been quotiented out. The finitely many bounded transverse charts of #cite(label("MorrisI")) Chapter I, Section 4.6, pp. 102–103 therefore give bounded residual multiplicity for the map to the automorphic quotient. The sector’s weighted squared norm is consequently at most a fixed multiple of the global squared norm. This statement uses the parabolic quotient and its measure; the integral-unipotent multiplicity in a raw subset of $G \( bb(A) \)$ need not be bounded.
  Absorb the finitely many transverse measure factors into a norm on a finite-dimensional space $V$. Multiplication by $delta_P^(- 1 \/ 2)$ then normalizes the constant term to an exponential-polynomial sequence
  $ F : upright(bold(N))^r arrow.r V \, #h(2em) dim V < oo \, $
  and the preceding norm comparison gives $F in ell^2 \( upright(bold(N))^r \, V \)$.
  Let $E$ be the span of all forward coordinate shifts of $F$. It is finite-dimensional because $F$ is exponential-polynomial. Each coordinate shift $S_j$ preserves $E$ and is a contraction for its inherited $ell^2$ norm. It has no eigenvalue of modulus one: if $S_j h = z h$, $\| z \| = 1$, and $h eq.not 0$, a nonzero slice in the other coordinates gives a coordinate ray of constant nonzero norm, contradicting square summability. Thus choose $rho < 1$ greater than the moduli of every eigenvalue of every $S_j \|_E$. Finite-dimensional Jordan estimates and commutation of the shifts give
  $ parallel S_1^(n_1) dots.h.c S_r^(n_r) parallel lt.eq C rho^(n_1 + dots.h.c + n_r) . $
  Evaluation at the origin is bounded in the $ell^2$ norm, so this proves exponential decay of $F$. Summing over the polynomially many lattice points of a given radius gives an exponential squared norm tail. Bounded sectors contribute none for large radius. The reduction height and the HN radius are comparable up to fixed constants, by the degree description of the canonical reductions. This proves Equation (5.14) for each discrete form. A basis of the finite-dimensional space $cal(D)_K$ makes the constants uniform on that space.
  Finally, compatibility of normalized parabolic induction with Iwahori invariants identifies the Iwahori invariants of the local induced representation with the corresponding induced Hecke module #cite(label("PrasadBernstein")) Section 5.8, Theorem 8. We use left modules and the positive-translation convention of Equation (5.2); the conversion from the source’s right-module convention is described in its Section 7. The Bernstein presentation now proves (iii). The ambient Hecke algebra is free as a right module over the Levi Hecke algebra, with basis indexed by the representatives $w$ for which $w Phi_M^(+) subset Phi_G^(+)$. Commuting a Bernstein element past these basis elements by Equation (5.2) is triangular in Bruhat order, and its diagonal characters are exactly Equation (5.15). The real exponent of a unitary $sigma$ is zero in the split central directions of $M$. The finite list of inducing data and the bounded fiber dimensions from (i) give the last assertions of (iii). ◻
]

We shall use the following elementary uniform bound to handle the fact that Bernstein translations need not be normal operators.

#thm([Lemma 5.5.])[
  #emph[Let $B \, r_0 > 0$ and $R_0 in upright(bold(N))$ be fixed. For every $r > r_0$ there is a constant $C$ with the following property: if $A$ is an operator on a Hilbert space of dimension at most $R_0$, with $parallel A parallel lt.eq B$ and all eigenvalues of modulus at most $r_0$, then 
$ parallel A^n parallel lt.eq C r^n #h(2em) \( n gt.eq 0 \) . $

]
] <ext:matrix-bound>

#proof[
  On the circle $\| z \| = r$, the determinant of $z - A$ has absolute value at least $\( r - r_0 \)^(dim A)$. In an orthonormal basis, its adjugate has a bound depending only on $B \, r \, R_0$. The resolvent is therefore uniformly bounded on that circle. The contour formula for $A^n$ gives the stated estimate, after increasing $C$ to cover the zero-dimensional case. ◻
]

=== 5.3 A dominant weight forces high cohomology <a-dominant-weight-forces-high-cohomology>

To set up the induction for Theorem 25, suppose that it is known in smaller semisimple rank and that $t_0$ violates its conclusion. We work at a level, and after a unitary central twist, for which $pi$ is contained in $cal(D)_K$. Its central exponents are zero. In particular $lambda_0$ lies in the semisimple directions, and it is nonzero: an exponent-zero semisimple parameter has the form in Equation (5.1) with the trivial homomorphism $phi.alt$.

Choose a second closed point $y eq.not x$ where $pi$ is unramified, refine its level to an Iwahori, and fix an ordered Bernstein weight $t_(0 \, y)$ there. Shrink the level away from $x \, y$ to a product of principal congruence subgroups. Every compact open subgroup contains such a product, so the resulting level $K = I_x times I_y times K^(x \, y)$ still has $pi^K eq.not 0$. The factor $K^(x \, y)$ is full level along an effective divisor disjoint from $x \, y$, as required by the geometric constructions. All these levels now remain fixed.

We give the finite-level tensor argument ensuring simultaneous occurrence of the two chosen local weights; the general tensor-product theory is due to Flath #cite(label("FlathTensorProducts")). The finite-dimensional space $V = pi^K$ is simple over the product Hecke algebra $cal(H)_x ⊗ cal(H)_y ⊗ cal(H)^(x \, y)$. Indeed any nonzero vector generates $pi$ under the adelic group by irreducibility; averaging its translates over $K$ shows that it generates $V$ under this Hecke algebra. Let $A_x \, A_y$ be the images of the two local Hecke algebras in $"End" \( V \)$. The subspace $"rad" \( A_x \) V$ is stable under the entire product algebra, so is either zero or $V$. The second possibility contradicts nilpotence of the radical; hence $A_x$ is semisimple. Every element of its center commutes with the product algebra and therefore acts as a scalar on $V$. Thus $A_x$ is a single matrix algebra. The same argument applies to $A_y$. The commuting matrix-algebra actions consequently give

$ V tilde.eq U_x ⊗ U_y ⊗ W \, $

where $U_x \, U_y$ are their simple modules and $W eq.not 0$ is the multiplicity space. The simple local types are independent of the auxiliary level: refinement embeds the finite invariant spaces, whose isotypic restrictions therefore have the same simple type. Taking the union over auxiliary levels identifies these types with the local Iwahori modules $pi_x^(I_x)$ and $pi_y^(I_y)$. The tensor of their nonzero generalized weight spaces at $t_0$ and $t_(0 \, y)$ is therefore nonzero. Thus $\( t_0 \, t_(0 \, y) \)$ occurs on the finite-dimensional discrete space at this refined level. In the following, weights are compared on $\( L^0 \)^2$ unless explicitly stated otherwise.

#thm([Lemma 5.6.])[
  #emph[There is a Laurent polynomial $P_0$ in the degree-zero Bernstein translations at $x$, nonzero at $t_0$, and an open cone of dominant regular directions arbitrarily close to $lambda_0$, such that the following holds. For every fixed auxiliary label $zeta$ at $y$ and every sufficiently large label $mu$ in this cone, every continuous joint weight surviving $P_0$ has strictly smaller modulus on $T_(\( mu \, zeta \))$ than the target joint weight.]
] <ext:spectral-gap>

#proof[
  Complexify the twisting torus of each family in Proposition 28. Its ordered $x$-weights form a coset of an algebraic subtorus. There are finitely many such cosets. A coset not containing the target on $L^0$ can be annihilated by a Laurent polynomial nonzero at the target. Raise that polynomial to a power exceeding the uniformly bounded generalized-weight length, and multiply over these cosets. The resulting $P_0$ kills their actions, including generalized weights.
  Consider a remaining family, induced from $M$ and shuffled by $w$. Let $C_M$ be its real twisting-center subspace after that shuffle, and let $nu$ be the real exponent of its unitary contour. Unitarity of the inducing central character gives $nu perp C_M$. Membership of the target in its complexified coset gives $lambda_0 - nu in C_M$. The possible ambiguity from working on $L^0$ is a connected-central factor of $G$ and is already contained in the twisting center of $M$. Therefore
  #[#set math.equation(numbering: n => "(5.16)")
   $ nu = "pr"_(C_M^perp) \( lambda_0 \) \, #h(2em) \( lambda_0 \, nu \) = parallel lambda_0 parallel^2 - parallel "pr"_(C_M) \( lambda_0 \) parallel^2 . $ <ext:orthogonal-projection>]
  If the second subtracted term were zero, the twisting factor taking the inducing parameter to $t_0$ would be unitary. Moreover, $w Phi_M^(+) subset Phi_G^(+)$ and dominance of $lambda_0$ would make the corresponding inducing weight dominant for $M$. The induction hypothesis would give Equation (5.1) for that weight, and hence for its unitary central twist and Weyl conjugate $t_0$. This contradicts the choice of $t_0$. Thus every remaining family has
  #[#set math.equation(numbering: n => "(5.17)")
   $ \( lambda_0 \, nu \) < parallel lambda_0 parallel^2 . $ <ext:strict-projection>]
  The finite list of strict inequalities persists in a small open cone of directions adjacent to $lambda_0$ and inside the regular dominant chamber. The $y$-exponents run through a finite list on the unitary contours. Their pairings with the fixed $zeta$ are bounded constants, whereas the strict $x$-gap grows linearly with $mu$. This proves the assertion for all sufficiently large $mu$ in a slightly smaller cone. ◻
]

Choose once and for all a sufficiently divisible regular positive label $zeta in L^0$ such that all the finitely many parabolic pairings involving $zeta$ alone are nonzero. This is possible by avoiding a finite collection of rational hyperplanes. The divisibility includes the fixed multiples required in the rotation calculation and the even multiple needed to remove convention signs. We impose the same fixed divisibility on the varying $mu$.

#thm([Proposition 5.7.])[
  #emph[Under the induction assumption and the choice of a violating weight above, let $u = \( mu \, zeta \)$, where $mu$ is sufficiently large in the cone of Lemma 30 and $u$ satisfies Equation (4.1). Then $M \( u \)$ contains the joint Bernstein character $\( t_0 \, t_(0 \, y) \)$ on $\( L^0 \)^2$. At some full ordered extension $\( t_x \, t_y \)$ of that character it has nonzero cohomology in a degree $i$ satisfying 
#[#set math.equation(numbering: n => "(5.18)")
 $ i gt.eq 2 d_x chevron.l lambda_0 \, mu chevron.r + 2 log_q \| zeta \( t_(0 \, y) \) \| . $ <ext:degree-lower>]

]
] <ext:lower>

#proof[
  The complex $M \( u \)$ has finite-dimensional total cohomology by Lemma 20. If the target character did not occur, a Laurent polynomial in the two degree-zero Bernstein algebras would annihilate its entire cohomology and remain nonzero at the target. Multiply it by $P_0$ and by polynomial factors killing every other discrete joint character. Powers larger than the finite generalized weight lengths kill the corresponding generalized spaces. Denote the resulting polynomial by $P$. It is nonzero at the target, kills $M \( u \)$, and on the discrete spectrum retains only the target joint generalized weight space $cal(D)_0$.
  Multiply $P$ by a Bernstein monomial with sufficiently large positive labels at both places. This changes none of these properties, since all Bernstein monomials are invertible. We can consequently write
  $ P = sum_v c_v T_v $
  with a finite set of regular positive degree-zero labels $v$. For the remainder of this argument $u$ and $P$ are fixed and only the positive integer $n$ varies. Apply Theorem 19 to each term. The normalized version of that identity gives, for every sufficiently large $n$,
  #[#set math.equation(numbering: n => "(5.19)")
   $ sum_b \( T_u^n P \)_(b \, b) = "Tr"_(upright("alt")) \( upright("Fr")^n P divides M \( u \) \) = 0 . $ <ext:filtered-diagonal>]
  Here $b$ indexes the normalized point basis of $cal(L)_K$; normalization by the square root of its measure does not change diagonal matrix entries. The translation $u$ is even; each insertion $T_v$ is in the function normalization of that theorem, including its known parity correction to the perverse trace. No evenness condition is imposed on $v$. Only this ordinary diagonal sum is used; the operator is not asserted to be trace class on all of $cal(L)_K$.
  The support bound in Theorem 19 puts every contributing diagonal entry in an HN ball of radius $B n$ for a fixed $B$. Increase $B$ if necessary and write $Q_n = Q_(B n)$. The left side of Equation (5.19) is therefore $"Tr" \( Q_n T_u^n P Q_n \)$. By Proposition 10, $"rank" Q_n$ is polynomial in $n$.
  Put
  $ a = mu \( t_0 \) zeta \( t_(0 \, y) \) \, #h(2em) R = \| a \| > 0 . $
  Lemma 30 gives an $r_0 < R$ bounding the moduli of all continuous eigenvalues of $T_u$ on the image of $P$. Fixed Hecke operators are uniformly bounded on all unitary fibers by their $L^1$ norms. The image of $P$ in each fiber is invariant under $T_u$, has bounded dimension, and inherits its Hilbert norm. Choose $r_0 < r < R$ and apply Lemma 29 on this image. We obtain
  $ parallel T_u^n P parallel_(upright("cont")) lt.eq C r^n . $
  This bound is uniform even where the dimension of the image changes. Hence the continuous contribution to the compressed trace is at most $"rank" \( Q_n \) C r^n = o \( R^n \)$.
  On $cal(D)_0$, simultaneous triangularization of the commuting Bernstein operators gives
  #[#set math.equation(numbering: n => "(5.20)")
   $ "Tr"_(cal(D)_K) \( T_u^n P \) = dim \( cal(D)_0 \) P \( t_0 \, t_(0 \, y) \) a^n . $ <ext:discrete-leading-trace>]
  The coefficient is nonzero; generalized-weight nilpotents do not change the diagonal of these matrices. The norm of $T_u^n P$ on this finite-dimensional space is at most $C \( 1 + n \)^N R^n$ for fixed $C \, N$. Equation (5.14) therefore makes the difference between its full trace and its $Q_n$-compressed trace $o \( R^n \)$. Decomposing the Hilbert space into its orthogonal discrete and continuous summands, Equations (5.19) and (5.20) would imply
  $ 0 = dim \( cal(D)_0 \) P \( t_0 \, t_(0 \, y) \) a^n + o \( R^n \) \, $
  an impossibility. Thus the target character occurs in $M \( u \)$.
  Since the full Bernstein torus also acts on this finite-dimensional space, the target character on $\( L^0 \)^2$ has at least one full ordered extension $\( t_x \, t_y \)$ in its support. The cyclic-slide identity of Proposition 7 identifies normalized Frobenius on that generalized weight space with the translation $T_u$, up to the already harmless convention sign. Every one of its Frobenius eigenvalues has modulus
  $ \| mu \( t_x \) zeta \( t_y \) \| = q^(d_x chevron.l lambda_0 \, mu chevron.r + log_q \| zeta \( t_(0 \, y) \) \|) . $
  Recall the weighted translation length $L_u = d_x ell \( t^mu \) + d_y ell \( t^zeta \)$ and the normalization in Equation (4.2). The reduction in the proof of Lemma 20 applies the compact-support weight theorem #cite(label("DeligneII")) Corollary 3.3.4 to $Y_u$: the weights of the constant sheaf’s $H_c^j$ are integers at most $j$. Since
  $ H^i \( M \( u \) \) = H_c^(i + L_u) \( Y_u \, upright(bold(k)) \) \( L_u \/ 2 \) \, $
  the weights of this normalized group are integers at most $i$. Comparing with the displayed Frobenius modulus proves Equation (5.18). ◻
]

#thm([Corollary 5.8.])[
  #emph[The semisimple exponent $lambda_0$ of a violating weight in this induction argument is rational.]
] <ext:rationality>

#proof[
  The Frobenius weights of $M \( u \)$ are integers by the weight theorem and normalization just used in Proposition 31. Set $b = 2 log_q \| zeta \( t_(0 \, y) \) \|$. The occurrence in Proposition 31, not merely its degree inequality, gives
  #[#set math.equation(numbering: n => "(5.21)")
   $ 2 d_x chevron.l lambda_0 \, mu chevron.r + b in upright(bold(Z)) $ <ext:integral-pairings>]
  for every sufficiently large allowed label in the open cone. Let $L_1 subset L^0$ be the fixed finite-index lattice imposing the divisibility conditions. Given $a in L_1$, choose $mu$ sufficiently deep in that cone that both $mu$ and $mu + a$ belong to it, and avoid the finitely many affine hyperplanes excluded by Equation (4.1) for both labels. Such labels exist: a full-dimensional cone has lattice points arbitrarily far from any prescribed finite collection of proper affine hyperplanes. Subtracting the two instances of Equation (5.21) gives $2 d_x chevron.l lambda_0 \, a chevron.r in upright(bold(Z))$. These pairings on the full-rank lattice $L_1$ prove the assertion. ◻
]

=== 5.4 The extreme summand and specialization <the-extreme-summand-and-specialization>

Use the rational metric to identify the exponent direction with a label direction. By Corollary 32 we can now take

#[#set math.equation(numbering: n => "(5.22)")
 $ mu = m lambda_0 $ <ext:exact-ray>]

for arbitrarily large divisible integers $m$. These labels may lie on a wall. The spectral gap proved above also holds on this exact ray by Equation (5.17). The fixed choice of $zeta$ makes Equation (4.1) hold for every sufficiently large such $m$: if a main-ray parabolic pairing vanishes, its auxiliary pairing does not; if it does not vanish, the combined pairing has at most one exceptional value of $m$. Thus Proposition 31 and its proof apply along this ray as well.

#thm([Lemma 5.9.])[
  #emph[For $mu$ as in Equation (5.22), the only weight $a$ of the irreducible representation $V_mu$ maximizing $chevron.l lambda_0 \, a chevron.r$ is $a = mu$, and its multiplicity is one. Consequently the only maximizing tuple in $V_mu^(⊗ d_x)$ is $\( mu \, dots.h \, mu \)$.]
] <ext:unique-extreme>

#proof[
  Every weight has the form $mu - sum_alpha n_alpha alpha$ with $n_alpha gt.eq 0$ in the positive simple roots of the dual group. Equality of its pairing with that of $mu$ forces every root appearing in this difference to be orthogonal to $lambda_0$. The highest weight $mu$ has zero pairing with the coroots of that Levi root system. Its highest line therefore generates the trivial representation of the corresponding derived Levi. Applying only its lowering operators produces no different weight. The maximizing face consists of the highest line alone. Additivity of the pairing proves the assertion about tuples. ◻
]

Let $\( t_x \, t_y \)$ be one of the full extensions supplied by Proposition 31 for the chosen $m$. It can vary with $m$, but $t_x \/ t_0 in Z \( hat(G) \)^compose$. Put $d = d_x$ and consider the Iwahori trace complex

$ C_mu = sans(K) #scale(x: 120%, y: 120%)[\(] Z \( V_mu \)^(times.square d) \; J_zeta #scale(x: 120%, y: 120%)[\)] \, $

where the semicolon records the fixed auxiliary label at $y$ and all other fixed levels and kernels. Let $cal(H)_x$ be the affine Hecke algebra at $x$ with coefficients in $upright(bold(k))$, let $Z_x$ be its center, and set

$ R_x = accent(\( Z_x \), ̂)_(W t_x) \, #h(2em) hat(H)_mu = H^(*) \( C_mu \) ⊗_(Z_x) R_x . $

This is flat scalar extension of a graded cohomology module. No dg $Z_x$-module structure on the Iwahori complex is used. The auxiliary label at $y$ remains fixed; no projection onto a $y$-weight is needed in this step.

We use a different operator here from the full normalized Frobenius in Proposition 31. On the repeated highest $x$-tuple, the $d$-fold $x$-label slide has character $d mu$, whereas full Frobenius on $M \( mu \, zeta \)$ has joint character $\( mu \, zeta \)$. The selected-place slide separates Wakimoto terms; the lower degree bound retains the single residue-degree factor $d_x$ in Equation (5.18).

#thm([Proposition 5.10.])[
  #emph[Fix a positive even integer $kappa$ removing the slide convention signs, and let $S_x$ be the $kappa$th power of the $d$-fold $x$-label slide. There is a polynomial projector $epsilon_(upright("ext"))$ on $hat(H)_mu$, commuting with $cal(H)_x ⊗_(Z_x) R_x$, such that every 
$ N_v = e_v epsilon_(upright("ext")) hat(H)_mu $

 has finite-dimensional total graded space. For some hyperspecial vertex $v$, it is nonzero in a degree satisfying Equation (5.18). The transfer identifies $N_v$ with the extreme $S_x$-part of $H^(*) \( C_(mu \, v)^(upright("sph")) \) ⊗_(Z_x) R_x$, where $C_(mu \, v)^(upright("sph")) = sans(K)_v \( V_mu^(times.square d) \; J_zeta \)$.]
] <ext:extreme-transfer>

#proof[
  Use the finite Wakimoto filtration of Theorem 5 and its cohomology spectral sequence. Its first page has labels $upright(bold(a)) = \( a_1 \, dots.h \, a_d \)$ of weights of $V_mu$, with their weight-space multiplicities. The Bernstein algebra and $S_x$ act on this spectral sequence. The commutation statements of Propositions 7 and 8 also make $S_x$ commute with the full Hecke action on its abutment. Tensoring the pages and the abutment with the flat algebra $R_x$ gives a convergent spectral sequence with its finite filtration. Write $Theta_b$ for the Bernstein element of a label $b$. Taking the $d$-fold slide first returns each tuple $upright(bold(a))$ to its original ordering. For $b = a_1 + dots.h.c + a_d$, the Wakimoto interchange formula of Theorem 5 identifies $S_x$ on this graded term with
  $ Theta_b^kappa ⊗ U_(upright(bold(a))) \, $
  where $U_(upright(bold(a)))$ acts on the finite tensor product of weight-multiplicity spaces. The chosen power removes the parity signs, and the trivial semisimplified Weil structures make $U_(upright(bold(a)))$ unipotent. The two factors commute. After specializing the Bernstein algebra at an ordering $r$, its only possible eigenvalue is
  #[#set math.equation(numbering: n => "(5.23)")
   $ (product_(j = 1)^d a_j \( r \))^kappa . $ <ext:graded-slide>]
  Here is an annihilator construction entirely on cohomology. The completed Bernstein algebra is finite over $R_x$. For each of the finitely many labels $upright(bold(a))$, put
  $ D_(upright(bold(a))) \( z \) = product_(w in W) #scale(x: 120%, y: 120%)[\(] z - Theta_(w b)^kappa #scale(x: 120%, y: 120%)[\)] . $
  Its coefficients are invariant, and hence lie in $R_x$. One factor gives $D_(upright(bold(a))) \( Theta_b^kappa \) = 0$. Therefore $D_(upright(bold(a))) \( S_x \)$ lies in the ideal generated by $1 ⊗ \( U_(upright(bold(a))) - 1 \)$ in the commutative algebra of these operators. Choose $n_(upright(bold(a)))$ with $\( U_(upright(bold(a))) - 1 \)^(n_(upright(bold(a)))) = 0$. The monic polynomial $Q_(upright(bold(a))) = D_(upright(bold(a)))^(n_(upright(bold(a)))) in R_x \[ z \]$ annihilates the entire first-page term, regardless of the size of its cohomology. Its residual roots are exactly the values in Equation (5.23) at the orderings of $t_x$. Put $Q_0 = product_(upright(bold(a))) Q_(upright(bold(a)))$. This annihilates the entire first page, hence every later page and the associated graded of the abutment. If the filtration has $b_mu$ steps, then $Q = Q_0^(b_mu)$ annihilates $hat(H)_mu$: each application of $Q_0 \( S_x \)$ lowers its filtration by at least one step. The same $Q$ also annihilates every page.
  The maximal modulus of these residual roots is independent of the ordering of $t_x$, by Weyl invariance of the weight polytope. Hensel factorization over $R_x$ gives $Q = Q_(+) Q_(-)$, with $Q_(+)$ collecting all roots of that maximal modulus and $Q_(-)$ all remaining roots. The factors are relatively prime. Their Bezout identity defines an idempotent $epsilon_(upright("ext"))$, polynomial in $S_x$, on every page, the filtered cohomology, and its abutment. On the abutment it commutes with the full Hecke algebra, since $S_x$ does and its polynomial coefficients are central.
  Apply also the ordered idempotent $p_(t_x)$ from Lemma 26. It commutes with the spectral-sequence maps and with $epsilon_(upright("ext"))$. Lemma 33 shows that exactly one label tuple survives on the projected first page: every entry is $mu$. Its multiplicity is one. The Weil normalization and interchange compatibility in Theorem 5 identify this term with the $t_x$-ordered part of $H^(*) \( M \( mu \, zeta \) \)$. Central factors cause no additional eigenvalues, since $mu in L^0$ and $V_mu$ is trivial on $Z \( hat(G) \)^compose$. There is no other surviving filtration step to support a differential. It follows that $p_(t_x) epsilon_(upright("ext")) hat(H)_mu$ is finite-dimensional and contains the nonzero high-degree piece of Proposition 31. Flat completion preserves this finite-dimensional generalized central-character piece.
  Apply Corollary 27 to the graded module $epsilon_(upright("ext")) hat(H)_mu$. Each $N_v$ is finite-dimensional, and some $N_v$ retains a nonzero piece in the same high degree. The cohomology transfer in Proposition 8 identifies $e_v hat(H)_mu$ with $H^(*) \( C_(mu \, v)^(upright("sph")) \) ⊗_(Z_x) R_x$ and intertwines $S_x$ and the center. This proves the stated identification. The finite set of hyperspecial variants is among those allowed in Theorem 18. ◻
]

The next step supplies the actual complex needed for specialization. It uses the spherical dg model separately from the Iwahori cohomology construction.

#thm([Proposition 5.11.])[
  #emph[For each $v$, the genuine spherical $Z_x$-dg module $C_(mu \, v)^(upright("sph"))$ has, after flat scalar extension to $R_x$, a dg direct summand $E_(mu \, v)$ with $H^(*) \( E_(mu \, v) \) = N_v$. Its chain projector is polynomial in the spherical slide $S_x$ and commutes with finite Koszul tests over $R_x$.]
] <ext:spherical-projector>

#proof[
  Use Proposition 9. On the finite representation bundle $V_mu^(⊗ d)$, the $d$-fold slide is the degree-zero closed matrix
  $ rho_mu \( s \) = V_mu \( s \)^(⊗ d) $
  over $cal(O) \( hat(G) \)$. Therefore
  $ P_mu \( z \) = det #scale(x: 120%, y: 120%)[\(] z - rho_mu \( s \)^kappa #scale(x: 120%, y: 120%)[\)] in cal(O) \( hat(G) \)^(hat(G)) \[ z \] = Z_x \[ z \] $
  satisfies $P_mu \( S_x \) = 0$ as a literal identity of chain maps. Indeed Cayley–Hamilton holds on the finite bundle before tensoring with the arbitrary dg module $cal(A)$ in that proposition; tensoring and then taking exact rational invariants preserve the identity. In particular this assertion requires no finiteness assumption on $cal(A)$ or on the whole spherical cohomology.
  Now the completed complex
  $ hat(C)_(mu \, v)^(upright("sph")) = C_(mu \, v)^(upright("sph")) ⊗_(Z_x) R_x $
  is defined using that actual dg module structure. The residual roots of $P_mu$ are the products of weight values in Equation (5.23) at $t_x$, with their tensor multiplicities. Their set is Weyl invariant, so it is the same root set used for $Q$. Factor $P_mu = P_(+) P_(-)$ over $R_x$ by Hensel’s lemma, separating the same maximal-modulus residual roots from the others. For a Bezout identity $u P_(+) + v P_(-) = 1$, the chain map
  $ e_(+) = v \( S_x \) P_(-) \( S_x \) $
  is idempotent: $e_(+)^2 - e_(+)$ is a multiple of $P_mu \( S_x \) = 0$. Its image $E_(mu \, v)$ is an actual dg direct summand. The coefficients lie in $R_x$, so this projector commutes with tensoring by any finite Koszul complex over $R_x$.
  We verify that its cohomology is the transferred extreme part; polynomial annihilators on cohomology alone would not have sufficed for the preceding chain construction. On $H^(*) \( hat(C)_(mu \, v)^(upright("sph")) \)$ both $Q \( S_x \)$ and $P_mu \( S_x \)$ vanish, and the two polynomial projectors commute. On the intersection of the $Q_(+)$ part with the $P_(-)$ part, $Q_(+) \( S_x \)$ and $P_(-) \( S_x \)$ vanish. Their residual roots have different moduli, so these two polynomials are relatively prime over $R_x$; their Bezout identity makes this intersection zero. The same argument interchanging $+$ and $-$ kills the other cross intersection. Thus $e_(+)$ and the transferred $epsilon_(upright("ext"))$ act identically on cohomology. This argument applies to arbitrary modules, without finite generation. Consequently $H^(*) \( E_(mu \, v) \) = N_v$, as claimed. ◻
]

#thm([Lemma 5.12.])[
  (Top cohomology under a Koszul test).  #emph[Let $\( R \, frak(m) \)$ be a noetherian local ring and let $C$ be a complex of $R$-modules bounded above in cohomology. Suppose that $N$ is its highest nonzero cohomological degree and $H^N \( C \)$ is a finite nonzero $R$-module. If $f_1 \, dots.h \, f_r$ generate $frak(m)$, then 
$ H^N #scale(x: 120%, y: 120%)[\(] C ⊗_R K_R \( f_1 \, dots.h \, f_r \) #scale(x: 120%, y: 120%)[\)] eq.not 0 \, $

 where the Koszul complex is placed in degrees $\[ - r \, 0 \]$. No regular-sequence hypothesis is required.]
] <ext:koszul>

#proof[
  The bounded Koszul complex is a complex of finite free modules, so its tensor product has a convergent spectral sequence
  $ E_2^(p \, q) = H^p #scale(x: 120%, y: 120%)[\(] K_R \( f \; H^q \( C \) \) #scale(x: 120%, y: 120%)[\)] med arrow.r.double med H^(p + q) \( C ⊗_R K_R \( f \) \) . $
  Its term at $\( p \, q \) = \( 0 \, N \)$ is $H^N \( C \) \/ frak(m) H^N \( C \)$, which is nonzero by Nakayama’s lemma. No later differential enters this term, since its source would have second index greater than $N$; none leaves it, since its target would have positive Koszul degree. The term survives in total degree $N$. ◻
]

#proof[
  For semisimple rank zero, the group is a split torus. Its unitary local characters have zero absolute-value exponent, so the assertion holds with trivial $phi.alt$. Assume the result in lower semisimple rank and choose a violating weight $t_0$ as above. All the preceding constructions are then available for arbitrarily large $m$ in Equation (5.22).
  Use Proposition 34 to choose $v$, and then Proposition 35 to obtain the dg summand $E_(mu \, v)$. Let $N$ be its highest nonzero cohomological degree. It exists because $H^(*) \( E_(mu \, v) \) = N_v$ has finite-dimensional total graded space, and it satisfies
  #[#set math.equation(numbering: n => "(5.24)")
   $ N gt.eq 2 d m parallel lambda_0 parallel^2 + b \, #h(2em) b = 2 log_q \| zeta \( t_(0 \, y) \) \| . $ <ext:top-lower>]
  Use the invariant algebra generators $a_1 \, dots.h \, a_r$ fixed before Lemma 13, and put $f_j = a_j - a_j \( t_x \)$. These functions generate the maximal ideal of $W t_x$ in $Z_x$, and their images generate the maximal ideal of $R_x$. Apply their finite Koszul complex to the actual $R_x$-dg summand $E_(mu \, v)$. Lemma 36 preserves a nonzero class in degree $N$. The chain projector of Proposition 35 commutes with this tensor product, so the tested summand is a direct summand of the tested completed spherical complex.
  Completion can be removed from the latter test. Indeed it is flat, and each $f_j$ acts null-homotopically on its Koszul complex. The tested cohomology is therefore annihilated by the maximal ideal, and extension of scalars from $Z_x$ to $R_x$ changes none of its cohomology groups. The natural map from the uncompleted spherical Koszul test to its completion is thus a quasi-isomorphism. On this specialized cohomology the polynomial coefficients of the chain projector reduce to their residue-field values. Its image is exactly the maximal-modulus group for the holonomy slide $S_x$, by its Hensel factorization. Raising an invertible slide to the positive power $kappa$ preserves the ordering of eigenvalue moduli. Hence the surviving degree $N$ belongs to the extreme summand to which Theorem 18 applies, giving
  #[#set math.equation(numbering: n => "(5.25)")
   $ N lt.eq C + d m max_(e in E_(t_x)) chevron.l lambda_0 \, h_e chevron.r . $ <ext:top-upper>]
  The restriction of $t_x$ to $L^0$ is that of $t_0$. Hence $t_x$ differs from $t_0$ only by a connected-central factor. The adjoint eigenspace $E_(t_x)$, its compatible neutral cocharacters, and the semisimple exponent are consequently independent of that factor. Because $t_0$ is a violation and its central exponent is zero, the strict part of Theorem 18 gives
  $ delta = 2 parallel lambda_0 parallel^2 - max_(e in E_(t_x)) chevron.l lambda_0 \, h_e chevron.r > 0 . $
  The same theorem makes $C$ uniform under the possible connected-central changes of $t_x$. Its hypotheses also allow the fixed auxiliary label and all the finitely many hyperspecial variants; replace their constants by their maximum. No level, auxiliary kernel, or semisimple holonomy datum varies with $m$.
  Subtracting Equation (5.25) from Equation (5.24) now yields $d m delta lt.eq C - b$, impossible for arbitrarily large $m$. There is no violating weight. This completes the induction and the proof of Theorem 25. ◻
]

== 6 The global decomposition <sec:global>

We now assume that $G$ is semisimple, and put $U = X \\ "supp" \( D \)$. Throughout this section, Frobenius and the normalized Satake isomorphism have the conventions fixed in the introduction. In particular, if $d_x = deg \( x \)$, then $q_x = q^(d_x)$.

Theorem 25 gives a complex compact–Jacobson–Morozov form at each good place and each complex realization. Three steps remain. At each place we must obtain one algebraic factorization whose remainder is compact at every complex embedding. We must then show that its nilpotent orbit is independent of the good place, and descend the resulting decomposition of joint Hecke eigenspaces to $bb(Q)$.

=== 6.1 The rational cuspidal spectrum <the-rational-cuspidal-spectrum>

We first record precisely the finite-dimensional space to which the argument applies. For a split group, the isomorphism classes of bundles with full level $D$ are

$ "Bun"_(G \, D) \( bb(F)_q \) = G \( F \) without G \( bb(A)_F \) \/ K_D . $

In general the bundle description has a disjoint union indexed by $ker^1 \( F \, G \)$; this kernel is trivial for split $G$ #cite(label("VLafforgue")) Section 2.1, Equation (2.1), and Remark 2.2. Thus this identification does not assert the stronger, generally false statement that every $G$-torsor over $F$ is trivial. The finite-level cuspidal space is finite dimensional #cite(label("VLafforgue")) Section 1.1. The finite subscheme called $N$ there can be precisely $D$, with all its multiplicities: its subgroup $K_N$ is defined by the same kernel as $K_D$. Moreover, the central lattice used there can be trivial here, since the center of a semisimple group has compact adelic points. These statements therefore concern the entire space $C_(D \, bb(Q))$ in Theorem 1.

Write $C_(D \, bb(C)) = bb(C) ⊗_(bb(Q)) C_(D \, bb(Q))$, and let

$ bb(T)_(D \, bb(Q)) subset "End"_(bb(Q)) \( C_(D \, bb(Q)) \) $

be the unital algebra generated by the good-place spherical Hecke algebras $A_x$, for $x in \| U \|$.

#thm([Lemma 6.1.])[
  #emph[The algebra $bb(T)_(D \, bb(Q))$ is finite dimensional and reduced. After extending scalars to $overline(bb(Q))$, its action has a decomposition 
#[#set math.equation(numbering: n => "(6.1)")
 $ overline(bb(Q)) ⊗_(bb(Q)) C_(D \, bb(Q)) = xor.big_(chi in Sigma_D) C_chi $ <glob:joint-spectrum>]

 into joint eigenspaces, where $Sigma_D$ is finite. All good-place Satake classes of these characters are algebraic.]
] <glob:hecke-spectrum>

#proof[
  Finite dimensionality of $C_(D \, bb(Q))$ implies that of its Hecke image algebra. On the complex cusp space use the positive automorphic $L^2$ inner product. For a spherical function $a$, the adjoint of convolution by $a$ is convolution by $a^(*) \( g \) = overline(a \( g^(- 1) \))$. This function is again spherical and its operator preserves the cusp space. The spherical operators at one place commute, and operators at different places commute. Consequently all their restrictions are commuting normal operators. Simultaneous diagonalization follows in the finite-dimensional space, and implies that the Hecke image algebra is reduced. A finite reduced algebra over $bb(Q)$ is a product of number fields, so it splits over $overline(bb(Q))$ and gives Equation (6.1). The normalized Satake isomorphism is defined over $bb(Q) \( sqrt(q_x) \)$; hence an algebraic Hecke character determines an algebraic point of the dual adjoint quotient, and therefore an algebraic semisimple conjugacy class. ◻
]

=== 6.2 A single triple at every complex embedding <a-single-triple-at-every-complex-embedding>

The definition of $R_(r \, cal(O))$ requires one algebraic triple and an algebraic remainder compact at every complex embedding. The local theorem supplies complex triples separately at those embeddings. We compare their neutral cocharacters in a fixed torus: the exact root equations will force them to agree, after which polynomial equations produce a triple over $overline(bb(Q))$.

For a split maximal torus $T$ of $hat(G)$ and a semisimple $t in T \( overline(bb(Q)) \)$, define its exponent at an embedding $iota : overline(bb(Q)) arrow.r.hook bb(C)$, relative to a prime power $r > 1$, by

#[#set math.equation(numbering: n => "(6.2)")
 $ chevron.l a \, lambda_iota \( t \) chevron.r = log_r \| iota \( a \( t \) \) \| \, #h(2em) a in X^(*) \( T \) . $ <glob:exponent>]

Thus $lambda_iota \( t \) in X_(*) \( T \) ⊗_(bb(Z)) bb(R)$. We first keep this vector in the fixed torus, without applying a different Weyl element at each embedding.

#thm([Lemma 6.2.])[
  #emph[Suppose that, at every embedding $iota$, the element $iota \( t \)$ is conjugate to 
$ phi.alt_iota #h(-0.16667em) mat(delim: "(", sqrt(r), 0; 0, sqrt(r)^(- 1)) c_iota \, $

 where $phi.alt_iota : "SL"_2 arrow.r hat(G)_(bb(C))$ is an algebraic homomorphism and $c_iota$ is semisimple and conjugate into a compact subgroup of $Z_(hat(G)) \( phi.alt_iota \( "SL"_2 \) \) \( bb(C) \)$. Then the following hold.]
  + #emph[The vectors $lambda_iota \( t \)$ are all equal to a vector $lambda$, and $mu = 2 lambda$ belongs to $X_(*) \( T \)$.]
  + #emph[There is a homomorphism $phi.alt : "SL"_2 arrow.r hat(G)_(overline(bb(Q)))$ with diagonal cocharacter $mu$ such that 
$ t = mu \( sqrt(r) \) c \, #h(2em) c in Z_(hat(G)) \( phi.alt \( "SL"_2 \) \) \( overline(bb(Q)) \) \, $

 and the image of $c$ is compact at every complex embedding.]
  + #emph[The nilpotent orbit of the raising element of $phi.alt$ is unique. In particular, $\[ t \]$ belongs to precisely one of the sets $R_(r \, cal(O))$.]
] <glob:embeddings>

#proof[
  Fix one embedding and conjugate its proposed decomposition so that its product is $iota \( t \)$ itself. Let $A$ be the image of the diagonal torus of $"SL"_2$. Its centralizer $L = Z_(hat(G)) \( A \)$ is a connected Levi subgroup #cite(label("MilneAlgebraicGroups")) Theorem 17.38 and Section 25.25. The semisimple element $c_iota$ lies in $L$, so it lies in a maximal torus $S$ of $L$. The central torus $A$ belongs to every maximal torus of $L$. Therefore $S$ contains both $A$ and $iota \( t \)$ and is a maximal torus of $hat(G)$. Both $S$ and $T_(bb(C))$ are maximal tori of the connected group $Z_(hat(G)) \( iota \( t \) \)^compose$; maximal-torus conjugacy #cite(label("MilneAlgebraicGroups")) Theorem 17.10 therefore puts the diagonal cocharacter in $T$ without moving $iota \( t \)$. This argument never requires the full semisimple centralizer, or the centralizer of the triple, to be connected.
  After this alignment, let $mu_iota in X_(*) \( T \)$ be the diagonal cocharacter. The compact factor belongs to $T \( bb(C) \)$, and the closure of its cyclic subgroup is compact. Every torus character therefore has modulus one on it. Equation (6.2) gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ 2 lambda_iota \( t \) = mu_iota . $ <glob:integral-neutral>]
  We prove that these integral cocharacters are independent of the embedding. Choose a positive definite Weyl-invariant inner product on $X_(*) \( T \) ⊗ bb(R)$, and extend it to an invariant complex bilinear form on $hat(frak(g))_(bb(C))$. Such a form is obtained by choosing a positive multiple of the Killing form on each simple factor. For two embeddings write $lambda \, lambda'$ for their exponents and $delta = lambda' - lambda$. The aligned triple at the first embedding has neutral element $H_mu = d mu \( 1 \) = 2 lambda$ under the usual identification of the real cocharacter space with the real subspace of $"Lie" T$. If a root component $e_alpha$ of its raising element is nonzero, then
  $ iota \( alpha \( t \) \) = r \, #h(2em) alpha \( lambda \) = 1 . $
  Since $alpha \( t \)$ is algebraic and $r$ is rational, this is the algebraic identity $alpha \( t \) = r$. At the second embedding it implies $alpha \( lambda' \) = 1$. The corresponding argument for the lowering element uses the identity $alpha \( t \) = r^(- 1)$. It follows that $delta$ centralizes both the raising and lowering elements, say $e$ and $f$. Invariance gives
  $ \( delta \, 2 lambda \) = \( delta \, \[ e \, f \] \) = \( \[ delta \, e \] \, f \) = 0 . $
  Applying the same argument to the aligned triple at the second embedding gives $\( delta \, 2 lambda' \) = 0$. Subtracting proves $\( delta \, delta \) = 0$, whence $lambda' = lambda$. Equation (6.3) proves (i).
  The common cocharacter $mu$ is defined over $bb(Q)$, since $T$ is split. Put $H_mu = d mu \( 1 \)$. The equations in $e \, f in hat(frak(g))$
  #[#set math.equation(numbering: n => "(6.4)")
   $ \[ H_mu \, e \] = 2 e \, #h(2em) \[ H_mu \, f \] = - 2 f \, #h(2em) \[ e \, f \] = H_mu \,\
"Ad" \( t \) e = r e \, #h(2em) "Ad" \( t \) f = r^(- 1) f $ <glob:algebraic-triple>]
  are polynomial equations over $overline(bb(Q))$ and have a complex solution by the alignment above. They consequently have a solution over $overline(bb(Q))$. In characteristic zero, the resulting $frak(s l)_2$ homomorphism integrates to an algebraic homomorphism $phi.alt : "SL"_2 arrow.r hat(G)$. Its diagonal cocharacter is $mu$, because cocharacters in characteristic zero are determined by their differentials. This includes the zero triple and the trivial homomorphism.
  Choose an algebraic square root of $r$ and set $c = t mu \( sqrt(r) \)^(- 1) in T \( overline(bb(Q)) \)$. Equation (6.4) says that $c$ centralizes the triple, hence its connected algebraic image $phi.alt \( "SL"_2 \)$. At every embedding and for every $a in X^(*) \( T \)$,
  $ \| iota \( a \( c \) \) \| = r^(chevron.l a \, lambda chevron.r) r^(- chevron.l a \, mu chevron.r \/ 2) = 1 . $
  Thus the cyclic subgroup generated by $iota \( c \)$ has compact closure in $T \( bb(C) \)$. This closure is contained in the closed subgroup $Z_(hat(G)) \( iota phi.alt \( "SL"_2 \) \) \( bb(C) \)$, and is conjugate into a maximal compact subgroup of that reductive group #cite(label("AdamsTaibiCohomology")) Theorems 3.6 and 3.7. This argument also applies to a disconnected triple centralizer and proves (ii).
  For uniqueness, first observe that any compact–Jacobson–Morozov decomposition of $t$ has diagonal cocharacter $mu$ after the same torus alignment. Decompose the Lie algebra by $H_mu$ as $hat(frak(g)) = xor.big_j hat(frak(g))_j$. For any triple $\( e \, H_mu \, f \)$, elementary $frak(s l)_2$ representation theory gives
  $ \[ hat(frak(g))_0 \, e \] = hat(frak(g))_2 : $
  in every irreducible $frak(s l)_2$ summand having weight two, raising maps weight zero onto weight two. The orbit of $e$ under $Z_(hat(G)) \( H_mu \)^compose$ is therefore open in the irreducible vector space $hat(frak(g))_2$. There can be only one such open orbit. Hence the neutral cocharacter determines the nilpotent orbit, without an exception for very-even orbits in type $D$.
  Finally conjugate $phi.alt$ over $overline(bb(Q))$ to the selected representative $phi.alt_(cal(O))$ of its orbit. The conjugated remainder satisfies precisely the all-embeddings condition defining $H_(cal(O))^c \( overline(bb(Q)) \)$ #cite(label("GLR")) Sections 3.1.1 and 3.4.1–3.4.2. This proves (iii). ◻
]

#prodef([Remark 6.3.])[
  The sets $R_(r \, cal(O))$ are pairwise disjoint by Lemma 38. They are Galois-stable with the rational forms stipulated in their definition #cite(label("GLR")) Section 3.4.2. To see the square-root issue directly, replacing $sqrt(r)$ by $- sqrt(r)$ inserts $phi.alt_(cal(O)) \( - I \)$ into the compact factor. This element is central in the triple centralizer and has finite order, so preserves compactness at every embedding. Multiplication of $t$ by any finite-order element of $Z \( hat(G) \)$ likewise preserves its orbit label and membership in $R_(r \, cal(O))$.
  For later use, let $2 rho_G$ be the sum of the positive roots of $G$, viewed as a cocharacter of the dual torus. In the usual square-root presentation of normalized Satake, if $tau$ changes the chosen square root of $q_x$ by a sign $epsilon.alt_(tau \, x)$, then the Satake class of the Galois-conjugate Hecke character is
  #[#set math.equation(numbering: n => "(6.5)")
   $ \[ t_(chi^tau \, x) \] = \[ \( 2 rho_G \) \( epsilon.alt_(tau \, x) \) thin tau \( t_(chi \, x) \) \] . $ <glob:satake-galois>]
  Indeed, on a dominant coweight $a$ the change of the normalization factor is $epsilon.alt_(tau \, x)^(chevron.l 2 rho_G \, a chevron.r)$. The element $\( 2 rho_G \) \( - 1 \)$ is central in $hat(G)$, since its pairing with every dual root is even. It has order at most two. Thus Equation (6.5) preserves all the assertions of Lemma 38. If the rational Satake form absorbs this correction, the comparison is ordinary Galois equivariance. In either presentation of the identification in #cite(label("GLR")) Equation (3.2), the comparison differs at most by the finite central factor just computed; only this conclusion is used below.
] <glob:signs>

=== 6.3 Purity on the good open curve <purity-on-the-good-open-curve>

We next prove that the orbit found locally is independent of the good place. Sawin and Templier’s Theorem 11.7 gives an earlier place-independence result for unramified temperedness using V. Lafforgue’s parameters #cite(label("SawinTemplier")). Here the global purity argument compares every nilpotent-orbit label. We will use the following precise consequence of the purity theorem, allowing ramification at every point of $X \\ U$.

#thm([Lemma 6.4.])[
  #emph[Let $cal(V)$ be a lisse $overline(bb(Q))_ell$-sheaf on the smooth geometrically connected curve $U \/ bb(F)_q$, defined over a finite extension of $bb(Q)_ell$. Suppose that all its Frobenius eigenvalues at closed points are algebraic over $bb(Q)$. For each complex embedding of these algebraic numbers, the multiset of numbers 
$ log_(q_x) \| alpha \| \, #h(2em) alpha upright(" an eigenvalue of ") "Frob"_x upright(" on ") cal(V) \, $

 counted with multiplicity, is independent of $x in \| U \|$.]
] <glob:twist-purity>

#proof[
  Take the irreducible constituents $cal(W)_j$ of a Jordan–Hölder filtration of $cal(V)$. After a finite extension of coefficients they are defined over finite extensions of $bb(Q)_ell$. At each closed point the characteristic polynomial of $cal(V)$ is the product of those of its constituents, so their eigenvalues are still algebraic. It suffices to treat one constituent $cal(W)$ of rank $n$.
  The rank-one sheaf $det cal(W)$ has finite geometric monodromy #cite(label("DeligneII")) Proposition 1.3.4. Fix a closed point $y in \| U \|$ of degree $d_y$ and choose an algebraic number $b$ such that
  $ b^(n d_y) = det \( "Frob"_y divides cal(W) \) . $
  Normalize the degree map on the Weil group by $deg \( "Frob"_x \) = d_x$. The number $b$ is an $ell$-adic unit: the original representation has compact image, so the eigenvalues of every group element, and in particular its determinant, are $ell$-adic units. The constant-field character $b^deg$ consequently extends continuously from the Weil group to the arithmetic fundamental group. Set $cal(W)^0 = cal(W) ⊗ b^(- deg)$.
  Its determinant still has finite geometric monodromy, and has value one on $"Frob"_y$. A power killing its geometric monodromy factors through $"Gal" \( overline(bb(F))_q \/ bb(F)_q \)$; its value on an element of degree $d_y$ is one, so this constant-field character has finite order. Thus $det cal(W)^0$ has finite order. This is also the determinant normalization described in #cite(label("DeligneII")) Section 1.3.6.
  Laurent Lafforgue’s purity theorem applies to the irreducible lisse sheaf $cal(W)^0$ on the smooth curve $U$: its finite-order determinant implies that all its Frobenius eigenvalues are algebraic and have modulus one under every complex embedding #cite(label("LLafforgue")) Theorem VII.6(i)–(ii). Therefore every Frobenius eigenvalue $alpha$ of $cal(W)$ at $x$ satisfies
  $ log_(q_x) \| alpha \| = log_q \| b \| . $
  This value is independent of $x$. Taking the union over the fixed list of constituents, with their ranks and multiplicities, proves the assertion. Neither the rank-one theorem nor the purity theorem requires $U$ to be proper. ◻
]

#thm([Proposition 6.5.])[
  #emph[Fix a joint character $chi in Sigma_D$ and an embedding $iota : overline(bb(Q)) arrow.r.hook bb(C)$. Let $lambda_(chi \, x)$ be the dominant exponent of its normalized Satake class at $x in \| U \|$, with base $q_x$ and absolute value induced by $iota$. Then $lambda_(chi \, x)$ is independent of $x$.]
] <glob:place>

#proof[
  Choose an embedding $overline(bb(Q)) arrow.r.hook overline(bb(Q))_ell$ and view $chi$ as an $ell$-adic character. V. Lafforgue’s global parameter theorem gives a continuous semisimple parameter
  $ sigma : pi_1 \( U \) arrow.r hat(G) \( overline(bb(Q))_ell \) \, $
  defined over a finite extension of $bb(Q)_ell$, for which the semisimple class of $sigma \( "Frob"_x \)$ is the Satake class of $chi$ at every $x in \| U \|$ #cite(label("VLafforgue")) Theorem 1.1. Here is why one parameter can be chosen for this joint character. Its nonzero joint eigenspace is preserved by the commuting excursion operators. Their finite-dimensional image has a character on that eigenspace. The parameter attached to such an excursion character has the required good-place Satake evaluations. We need neither uniqueness of this lift of $chi$ nor reducedness of the excursion algebra.
  For an algebraic representation $V$ of $hat(G)$, the composition $V compose sigma$ is a lisse sheaf on $U$. Its Frobenius eigenvalues are algebraic, since the corresponding semisimple Satake classes are algebraic. Lemma 40 shows that their multiset of logarithmic absolute values, with base $q_x$, is independent of $x$.
  For completeness, this determines the exponent in the dual torus. Let $V_a$ have dominant highest weight $a$. If $lambda_(chi \, x)$ is dominant, every weight $a'$ of $V_a$ satisfies
  $ chevron.l a' \, lambda_(chi \, x) chevron.r lt.eq chevron.l a \, lambda_(chi \, x) chevron.r . $
  The largest Frobenius exponent in $V_a compose sigma$ is therefore $chevron.l a \, lambda_(chi \, x) chevron.r$, and it is independent of $x$. The dominant weights in the character lattice of the dual maximal torus span its real weight space: a sufficiently divisible positive multiple of each fundamental weight belongs to this lattice. Their pairings determine $lambda_(chi \, x)$. This argument applies to every isogeny type of the semisimple dual group. ◻
]

=== 6.4 Descent of the orbit summands <descent-of-the-orbit-summands>

#thm([Proposition 6.6.])[
  #emph[For every effective divisor $D$, the rational cuspidal space has the decomposition 
#[#set math.equation(numbering: n => "(6.6)")
 $ C_(D \, bb(Q)) = xor.big_(cal(O)) C_(D \, cal(O) \, bb(Q)) $ <glob:rational-decomposition>]

 with the spectral-support summands specified in the introduction.]
] <glob:descent>

#proof[
  If the cusp space is zero, the assertion is immediate. Otherwise fix $chi in Sigma_D$ and a good place $x$. At any complex realization, a nonzero vector of $C_chi$ occurs in the discrete cuspidal automorphic spectrum. Choose a nonzero projection of such a vector to an irreducible cuspidal constituent. This projection retains the joint Hecke character and is spherical at $x$. Lemma 26 shows that its Iwahori invariants contain the dominant ordering of its spherical Bernstein character. Theorem 25 therefore puts the spherical parameter in compact–Jacobson–Morozov form.
  The same statement applies to every Galois-conjugate character: $C_(D \, bb(Q))$ and its Hecke action are defined over $bb(Q)$, so every such character occurs again in Equation (6.1). By Equation (6.5) and Remark 39, every embedding of an algebraic torus representative $t_(chi \, x)$ itself has compact–Jacobson–Morozov form. Lemma 38 then gives a unique orbit $cal(O)_(chi \, x)$ with
  $ \[ t_(chi \, x) \] in R_(q_x \, cal(O)_(chi \, x)) . $
  Proposition 41 makes its dominant exponent independent of $x$. The orbit uniqueness in Lemma 38 thus makes $cal(O)_(chi \, x)$ independent of $x$ as well; denote it by $cal(O)_chi$.
  We have partitioned the finite set $Sigma_D$ into the subsets $Sigma_(D \, cal(O)) = { chi : cal(O)_chi = cal(O) }$. They are Galois-stable by Remark 39 and Equation (6.5). Let $e_chi$ be the primitive idempotent of $overline(bb(Q)) ⊗ bb(T)_(D \, bb(Q))$ associated with $chi$. The sum
  $ e_(cal(O)) = sum_(chi in Sigma_(D \, cal(O))) e_chi $
  is Galois-fixed, so belongs to $bb(T)_(D \, bb(Q))$. These idempotents are orthogonal and sum to one. They yield a rational direct sum decomposition with summands $e_(cal(O)) C_(D \, bb(Q))$.
  It remains to identify them with the given cyclic-support spaces. For $f in C_(D \, bb(Q))$ write $f = sum_chi f_chi$ after scalar extension using Equation (6.1). At a fixed place $x$, the character support of $overline(bb(Q)) ⊗ A_x f$ is exactly
  $ { chi \|_(A_x) : f_chi eq.not 0 } . $
  Indeed, the local eigenspace for a restricted character is the direct sum of the joint eigenspaces with that restriction, and the projection of $f$ to it is nonzero precisely when one of the corresponding $f_chi$ is nonzero. It follows that this cyclic support is contained in $R_(q_x \, cal(O))$ for every good $x$ if and only if every $chi$ with $f_chi eq.not 0$ has $cal(O)_chi = cal(O)$. Here we use the pairwise disjointness of the orbit sets. The condition is therefore equivalent to $e_(cal(O)) f = f$, proving $e_(cal(O)) C_(D \, bb(Q)) = C_(D \, cal(O) \, bb(Q))$. This is the spectral-support definition of #cite(label("GLR")) Section 3.4.3, with the closed points restricted to $U$. Equation (6.6) follows. ◻
]

#proof[
  Proposition 42 proves the rational assertion. Tensor Equation (6.6) with $overline(bb(Q))_ell$ over $bb(Q)$. The resulting summands are exactly $C_(D \, cal(O) \, ell)$ by their definition. Scalar extension is exact, so their natural addition map to $C_(D \, ell)$ is an isomorphism. ◻
]

=== 6.5 Generic cuspidal representations <generic-cuspidal-representations-1>

#proof[
  Choose the split model of $G$ over the constant field with the same root datum. Its base change to $F$ is isomorphic to the given group. Let $S$ be the finite set of places at which $pi$ is ramified. For a split adjoint group all hyperspecial maximal compact subgroups at a place are conjugate, so unramifiedness is equivalent to having $G \( cal(O)_x \)$-fixed vectors for this model. Smoothness of the local representations and their restricted tensor product allow an effective divisor $D$ supported on $S$ with $pi^(K_D) eq.not 0$: at each point of $S$, take a principal congruence subgroup fixing a nonzero local vector. The spherical Hecke algebras outside $S$ act on $pi^(K_D)$ through the joint character determined by the local components $pi_x$. This character occurs in the complex cusp space $C_(D \, bb(C)) = bb(C) ⊗_(bb(Q)) C_(D \, bb(Q))$. By Lemma 37, it and its Satake classes are algebraic. Choose $iota : overline(bb(Q)) arrow.r.hook bb(C)$ realizing this character, and write $\[ t_x \]$ for its algebraic normalized Satake classes. The complex scalar extension of Theorem 1 and the pairwise disjointness in Lemma 38 give a single orbit $cal(O)$ such that
  $ \[ t_x \] in R_(q_x \, cal(O)) #h(2em) \( x in.not S \) . $
  We use positive real square roots in the complex normalized Satake parameters of $pi_x$. Their comparison with $iota \( t_x \)$ has at most the finite central correction in Remark 39, which changes neither the orbit nor the polar exponent.
  At the place $v$, where $pi_v$ is generic, choose an algebraic representative $t_v in hat(T) \( overline(bb(Q)) \)$ in a maximal torus of $hat(G)$. Let $nu_v in X_(*) \( hat(T) \) ⊗ bb(R)$ be its polar exponent, so $\| iota \( a \( t_v \) \) \| = q_v^(chevron.l a \, nu_v chevron.r)$ for every $a in X^(*) \( hat(T) \)$. The torus alignment in Lemma 38 identifies
  $ nu_v = 1 / 2 mu_(cal(O)) \, $
  where $mu_(cal(O)) in X_(*) \( hat(T) \)$ is the diagonal cocharacter of a Jacobson–Morozov homomorphism for $cal(O)$. For every weight $a$ of an algebraic representation of $hat(G)$,
  $ chevron.l a \, nu_v chevron.r = 1 / 2 chevron.l a \, mu_(cal(O)) chevron.r in 1 / 2 bb(Z) . $
  Thus the complex Satake parameter of $pi_v$ is geometric in the sense of #cite(label("CiubotaruHarris")) Definition 6.3. Since $G$ is adjoint, $hat(G)$ is simply connected; in particular, the adjoint and fundamental representations required in their Corollary 6.32 are algebraic representations of $hat(G)$ and satisfy the displayed condition.
  The cuspidal representation $pi$ occurs in the unitary cuspidal $L^2$ spectrum, so each local component is unitarizable. The component $pi_v$ is therefore spherical, generic, and unitary. By #cite(label("CiubotaruHarris")) Corollary 6.32(1), its polar exponent is zero. Hence $mu_(cal(O)) = 0$. The $frak(s l)_2$ relations then make the raising and lowering elements zero, so $cal(O) = { 0 }$. For this orbit the Jacobson–Morozov homomorphism is trivial, so every class in $R_(q_x \, { 0 })$ has compact image under $iota$. A spherical representation with compact normalized Satake parameter is tempered. This proves the assertion at every $x in.not S$.
  Finally, a nonzero global Whittaker functional on $pi$ induces a nonzero local Whittaker functional at each place. Indeed, choose a pure tensor on which the global functional is nonzero and fix all its factors except the chosen local one. The resulting functional on that factor has the required local equivariance and is nonzero. A globally generic $pi$ is therefore generic at every place and unramified outside the finite set $S$, so it satisfies the hypothesis of the corollary. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
