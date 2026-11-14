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

#align(center)[#text(size: 16pt, weight: "bold")[Frobenius Structures on Tame Hecke Eigensheaves]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A Hecke eigensheaf realizes a local system on a curve by the geometry of modifications of bundles.
  Over a finite field, an arithmetic local system contains more information than its geometric restriction:
  it also specifies Frobenius. The corresponding automorphic object must therefore carry a Frobenius structure
  that preserves its eigenisomorphisms. We construct such objects with Borel level and tame regular-unipotent
  monodromy, after a finite extension of the field of constants.

=== 1.1 The result <the-result>

For a smooth projective pointed curve $\( X \, x \)$, let $G =
  upright("SL")_n$ and let $B$ be its upper-triangular Borel.
  The stack $"Bun"_(G \, B \, x) \( X \)$ parametrizes $G$-bundles on $X$ with a $B$-reduction at $x$.
  A sheaf on this stack is locally constructible perverse if its pullback to each smooth finite-type scheme chart,
  shifted by the relative dimension of that chart, is bounded constructible and perverse.
  Its parabolic global nilpotent cone $Lambda_(upright("par"))$ consists of generically nilpotent Higgs fields
  with at most a simple pole at $x$ and residue in the nilradical of the chosen Borel.
  Singular support is interpreted on the same smooth charts.

For representations $bold(V) = \( V_i \)_(i in I)$ of the dual group $upright("PGL")_n$,
  write $sans(H)_(I \, bold(V))$ for the Hecke functor with legs in $\( X \\ { x } \)^I$.
  We use the relative Satake normalization of Section 2, with no moving-leg shift.
  In particular, the tensor-unit functor is exterior product with the constant $overline(bb(Q))_ell$-sheaf on
  $\( X \\ { x } \)^I$.

A Weil structure over $bb(F)_(q^m)$ means an isomorphism between the $q^m$-Frobenius pullback of the geometric
  sheaf and the sheaf itself. We require the eigenisomorphisms to respect this structure and the Frobenius
  structure on the parameter.

#thm([Theorem 1.1.])[
  #emph[Let $n gt.eq 2$, let $bb(F)_q$ have characteristic $p > n$, let $ell eq.not p$, and put $E =
    overline(bb(Q))_ell$. Let $X_0 \/ bb(F)_q$ be a smooth projective geometrically connected curve of genus at
    least two, with $x_0 in X_0 \( bb(F)_q \)$, and put $U_0 = X_0 \\ { x_0 }$. Suppose
$ rho : pi_1^(upright("et")) \( U_0 \) arrow.r upright("PGL")_n \( L \) $

 is continuous for a finite extension $L \/ bb(Q)_ell$, its geometric restriction is Zariski dense,
   and its inertia at $x_0$ kills wild inertia and has the form
#[#set math.equation(numbering: n => "(1.1)")
 $ rho \( gamma \) = exp #scale(x: 120%, y: 120%)[\(] t_ell \( gamma \) N #scale(x: 120%, y: 120%)[\)]
   $ <eq:regular-monodromy>]

 for a regular nilpotent $N$. Here a choice of compatible $ell$-power roots of unity identifies the tame quotient
   $bb(Z)_ell \( 1 \)$ with $bb(Z)_ell$ and defines $t_ell$.]
  #emph[There are an integer $m gt.eq 1$ and a nonzero $E$-adic Weil sheaf $M_0$ on
$ "Bun"_(upright("SL")_n \, B \, x_0) \( X_0 \)_(bb(F)_(q^m)) $

 whose geometric pullback $M$ is locally constructible perverse and has singular support in
   $Lambda_(upright("par"))$. If $rho_m$ denotes the restriction of $rho$ to
   $pi_1^(upright("et")) \( U_(0 \, bb(F)_(q^m)) \)$, then for every finite set $I$ and every family $V_i in
   "Rep"_E \( upright("PGL")_n \)$ there are isomorphisms of Weil sheaves
#[#set math.equation(numbering: n => "(1.2)")
 $ sans(H)_(I \, bold(V)) \( M_0 \) tilde.eq M_0 times.square times.square_(i in I) \( V_i \)_(rho_m) .
   $ <eq:main-eigenmaps>]

 They are natural in the representations and coherent for the unit, convolution, permutations,
   and all fusion diagonals.]
] <thm:main>

Write $k = overline(bb(F))_q$, $X = X_0 times_(bb(F)_q) k$, $x = \( x_0 \)_k$, and $U =
  U_0 times_(bb(F)_q) k$ for the geometric curve and its punctured complement.
  The Frobenius structure is required on the entire eigenstructure,
  rather than only on the underlying perverse sheaf. The finite extension in the theorem arises when a point on an
  auxiliary bundle stack is made invariant under a power of Frobenius.
  We use Weil structures, so a compatible action of the infinite cyclic group is sufficient.

=== 1.2 Background and the geometric input <background-and-the-geometric-input>

The geometric Langlands program replaces automorphic functions by sheaves on moduli stacks of bundles and asks
  that Hecke eigenvalues be realized as local systems on a curve.
  Drinfeld’s rank-two work and Laumon’s geometric formulation established central parts of this perspective
  [7,17]. Frenkel, Gaitsgory, and Vilonen constructed unramified $upright("GL")_n$ eigensheaves,
  including the finite-field Weil setting; Gaitsgory subsequently gave a geometric proof of the vanishing theorem
  underlying that construction [10,12]. Thus the arithmetic compatibility of an eigenstructure is a classical
  requirement, not a new condition introduced here.

For general groups, the restricted spectral stack and its action on automorphic sheaves with nilpotent singular
  support were developed by Arinkin, Gaitsgory, Kazhdan, Raskin, Rozenblyum, and Varshavsky [2].
  Gaitsgory and Raskin prove the restricted geometric Langlands equivalence in characteristic zero and construct
  its positive-characteristic specialization; in positive characteristic their general-group result concerns a
  union of spectral components [14]. We use the characteristic-zero equivalence and the spectral action,
  with their precise scopes, in Section 3.

Our geometric input is the companion manuscript #emph[Constructible tame Hecke eigensheaves in positive
  characteristic] [22]. It constructs geometric, locally constructible perverse eigensheaves with Borel level,
  parabolic nilpotent singular support, and the full fusion-compatible eigenstructure.
  Its method first creates level structure by a characteristic-zero degeneration to a separating node and then
  specializes to positive characteristic. We use its nearby-cycle, nonvanishing, perverse-truncation,
  and enhancement-descent theorems, stated at their uses below. Those results do not supply Frobenius descent.
  The present paper proves the additional arithmetic compatibility for $upright("SL")_n$ under the hypotheses of
  Theorem 1.

In characteristic-zero de Rham sheaf theory, Færgeman constructs coherent tame eigenobjects for irreducible
  regular-singular parameters, conditional on the spectral-action and localization-compatibility inputs specified
  in [9] Sections 1.3.6–1.4.3. Regular holonomicity and generic perversity in the tame setting remain expectations
  in that preprint [9] Remark 1.4.1.2. Our theorem establishes perversity in the geometric $ell$-adic setting and
  equips the eigenstructure with a finite-field Weil action,
  for the dense parameters with regular-unipotent boundary monodromy specified above.

The nodal geometry is part of the automorphic gluing framework of Nadler and Yun [20],
  with twisted curves as in Abramovich–Vistoli and Olsson [1,21].
  Root stacks and proper henselian invariance of finite covers allow us to retain finite-quotient monodromy
  through the two degenerations [18,23]. The sheaf-theoretic specialization used here is geometric nearby cycles,
  in the form developed by Hansen–Scholze and Gaitsgory–Raskin and adapted to level structure in [22,16,14].

=== 1.3 The arithmetic constructions and the proof <the-arithmetic-constructions-and-the-proof>

There are two extra difficulties in making the geometric construction equivariant.
  First, an invariant parameter need not make an arbitrarily chosen geometric eigenobject visibly invariant.
  Second, the two boundary parameters at a separating node must be glued by a conjugation that preserves both
  Frobenius and compact image.

Section 3 treats the first difficulty. For a dense unramified $upright("PGL")_n$-parameter in characteristic zero,
  the relevant restricted spectral component is a smooth formal space with one point.
  Transport of the spectral action preserves that component.
  The inverse image of its skyscraper has scalar endomorphisms and no negative self-extensions;
  these properties recognize its transport up to shift. An invariant polarization on the curve rules out a nonzero
  shift on the automorphic side, giving a generator isomorphism on this particular eigenobject.
  Density and the trivial center of $upright("PGL")_n$ force compatibility with its full eigenstructure.
  This recognition argument avoids choosing an equivariant normalization of the Langlands equivalence itself.

Section 4 first lifts the original arithmetic parameter to a punctured curve $C_1$ in characteristic zero.
  At its puncture the Frobenius matrix $A$ and the regular nilpotent logarithm $N_1$ satisfy $"Ad" \( A \) N_1 =
  q N_1$. A cocharacter commuting with $A$ scales $N_1$. We choose a ramified cover $C_2 arrow.r
  C_1$ whose degree makes the required gluing conjugator lie in a fixed compact open subgroup.
  The resulting boundary identification commutes with $A$. This compact equivariant gluing is the second reusable
  ingredient: inverse boundary monodromies alone would not ensure a continuous compact-valued parameter on the
  smoothing.

The compatible finite torsor towers on the two punctured components glue on balanced twisted nodal models and lift
  to a dense unramified parameter on their smooth generic curve. Apply the equivariant unramified result there.
  In Section 5, nearby cycles on a prescribed node type, restriction to one component,
  and descent from enhanced to ordinary flags produce an equivariant perverse eigensheaf on $C_1$.
  The restriction uses a point defined over a finite extension of the characteristic-zero base;
  a power of the generator fixes that point. Finally, Section 6 specializes this eigensheaf to the original
  finite-field curve. Both specializations use a separate support-closure argument to prove nonvanishing.
  Naturality of the comparisons in Section 2 carries the entire eigenstructure through these steps.

== 2 Equivariant Hecke systems and specialization <sec:conventions>

We fix the sheaf conventions and explain which parts of the geometric specialization formalism carry a semilinear
  action. The issue is compatibility of the entire Hecke system, including collisions of moving points.

=== 2.1 Sheaves, level structures, and moving legs <sheaves-level-structures-and-moving-legs>

Write $E = overline(bb(Q))_ell$, $G = upright("SL")_n$, and $caron(G) = upright("PGL")_n$,
  with the split forms understood over every base field. On a smooth stack $cal(B)$ locally of finite type,
  $D_(upright("lcc")) \( cal(B) \, E \)$ denotes the category of geometric adic complexes whose pullback to each
  smooth finite-type scheme chart is bounded and constructible. The bounds may depend on the chart.
  A complex $F$ is perverse if $b^(*) F \[ d \]$ is perverse for every smooth chart $b : Y arrow.r
  cal(B)$ of constant relative dimension $d$. These conventions agree with [22] Section 2.1.

For a pointed smooth projective curve $\( X \, x \)$, put

$ cal(A) = "Bun"_(G \, B \, x) \( X \) \, wide cal(A)^(+) = "Bun"_(G \, R_u \( B \) \, x) \( X \) \, wide T =
  B \/ R_u \( B \) . $

An enhanced flag is a reduction to $R_u \( B \)$; forgetting the enhancement is a representable $T$-torsor
  $cal(A)^(+) arrow.r cal(A)$. At ordinary Borel level, the trace form identifies a cotangent vector with a Higgs field

$ theta in H^0 #scale(x: 120%, y: 120%)[\(] X \, "ad" \( P \) ⊗ omega_X \( x \) #scale(x: 120%, y: 120%)[\)] \,
  wide "Res"_x theta in "Lie" R_u \( B_P \) \, $

where $B_P$ is the chosen Borel in the fiber at $x$. The cone $Lambda_(upright("par"))$ consists of those fields
  that are nilpotent over the function field of $X$. On a smooth chart,
  singular support means the geometric adic singular support of the pulled-back complex,
  contained in the smooth cotangent pullback of this cone; see [22] Section 3.1 and [4,3].

Let $U$ be the locus of allowed modifications, disjoint from the level point.
  For a finite set $I$, the Hecke stack $cal(H)_I$ has an input bundle map $p_I$ and an output-and-leg map $o_I :
  cal(H)_I arrow.r cal(B) times U^I$. If $bold(V) = \( V_i \)_(i in I)$ are representations of $caron(G)$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ sans(H)_(I \, bold(V)) \( F \) = o_(I \, *) #scale(x: 120%, y: 120%)[\(] F thin tilde(times.square) thin
   "Sat"_I \( bold(V) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:hecke-normalization>]

The twisted product is ordinary exterior product in input frames,
  descended using equivariance of the Satake kernel. All pushforwards are taken on finite Schubert bounds,
  where the output maps are proper. On a fixed-point Schubert orbit of dimension $d_lambda = chevron.l 2 rho_G \,
  lambda chevron.r$, the simple kernel is normalized by

#[#set math.equation(numbering: n => "(2.2)")
 $ "IC"_lambda \|_("Gr"^lambda) = E \[ d_lambda \] \( d_lambda \/ 2 \) . $ <eq:satake-normalization>]

Here $rho_G$ is the half-sum of positive roots. Since the cocharacter lattice of $G$ is its coroot lattice,
  $d_lambda$ is even. In particular all twists in (2.2) are integral. There is no moving-leg shift in (2.1).
  We use geometric Satake with its fusion tensor structure [19].

For a surjection $a : I arrow.r.twohead J$, let $delta_a : U^J arrow.r
  U^I$ be the collision diagonal and set $W_j = ⨂_(i in a^(- 1) \( j \)) V_i$. The relative fusion convention is

#[#set math.equation(numbering: n => "(2.3)")
 $ \( 1 times delta_a \)^(*) sans(H)_(I \, bold(V)) \( F \) tilde.eq sans(H)_(J \, bold(W)) \( F \) .
   $ <eq:fusion-convention>]

This is ordinary pullback, without a codimension shift.

#prodef([Definition 2.1.])[
  For a $caron(G)$-local system $theta.alt$ on $U$, a coherent Hecke eigenstructure on $F$ consists of isomorphisms
  #[#set math.equation(numbering: n => "(2.4)")
   $ sans(H)_(I \, bold(V)) \( F \) tilde.eq F times.square times.square_(i in I) \( V_i \)_theta.alt
     $ <eq:eigenstructure>]
  for all finite $I$, natural in the representations, and compatible with the unit,
    successive modifications and convolution, permutations, and all collision maps (2.3),
    including their iterated compatibilities. The notation $\( V \)_theta.alt$ means the lisse sheaf obtained by
    evaluating the representation $V$ on $theta.alt$.
] <def:eigenstructure>

Let $sigma$ be a semilinear automorphism of the ground field and the curve,
  preserving the split group and the level data. An equivariant sheaf has an isomorphism $sigma^(*) F tilde.eq F$;
  an equivariant eigenstructure requires (2.4) to commute with this isomorphism and the specified isomorphism
  $sigma^(*) theta.alt tilde.eq theta.alt$. We use the group generated by $sigma$,
  so the one isomorphism determines all its iterates and inverses.
  Transport acts on the base, not on the coefficient field $E$.
  At a finite-field fiber the ground-field action $a mapsto a^q$ gives the arithmetic convention.
  Inverting the generator everywhere gives the usual geometric Frobenius convention for Weil sheaves.

=== 2.2 Satake transport and its Weil normalization <satake-transport-and-its-weil-normalization>

#thm([Lemma 2.2.])[
  #emph[Semilinear isomorphisms of pointed curves identify the relative Satake and Hecke systems,
    compatibly with all the operations in Definition 2. In representation labels the required symmetric tensor
    comparison is unique. The same assertion holds for extension between algebraically closed characteristic-zero
    fields.]
] <lem:satake-transport>

#proof[
  Transport preserves the split Schubert orbits, their intersection complexes, convolution diagrams,
    and fusion diagrams. Thus it gives a symmetric tensor equivalence of the spherical Satake categories
    preserving all highest-weight labels. Under Satake it is a symmetric tensor autoequivalence of
    $"Rep"_E \( upright("PGL")_n \)$ with trivial outer automorphism.
    Over the algebraically closed coefficient field it is tensor isomorphic to the identity:
    the fiber-functor torsor is trivial and the remaining group automorphism is inner.
    Two such isomorphisms differ by a tensor automorphism of the identity functor,
    namely an element of $Z \( upright("PGL")_n \)$, which is trivial.
  Use this comparison for the full geometric system. On separated legs it is the exterior product comparison.
    The fusion extensions, proper convolution maps, and their exchange transformations are transported together,
    so their compatibility maps agree. In the kernel categories the fusion extensions are middle extensions with
    the usual perverse leg shifts; a comparison on the separated locus determines them.
    Applying the corresponding natural sheaf operations gives the Hecke comparison.
    Algebraically closed base extension has the same properties:
    it preserves the simple kernels and convolution and is an equivalence on spherical Satake.
    Uniqueness again identifies its representation labels. ◻
]

#thm([Lemma 2.3.])[
  #emph[Over a finite field, the split Weil structures on (2.2) give a symmetric tensor Satake system,
    with ordinary coefficient multiplicity spaces carrying trivial action.
    Its Frobenius comparison is the one in Lemma 3.]
] <lem:normalized-weil-satake>

#proof[
  We verify the normalization, since purity alone would not specify the Frobenius scalars.
    Resolve a split affine Schubert variety by its Bott–Samelson resolution, using the Iwahori stratification.
    Its iterated projective-line-bundle structure is defined over the finite field.
    The projective-bundle formula gives scalar geometric Frobenius $q^j$ on $H^(2 j)$ and zero odd cohomology.
    After the shift and twist $\[ d_lambda \] \( d_lambda \/ 2 \)$, the scalar on degree $i$ is $q^(i \/ 2)$.
  In perverse degree zero of the proper direct image, the full-support intersection complex occurs with
    multiplicity one. The decomposition theorem [5] Theorems 5.3.8 and 5.4.5 makes its isotypic summand
    geometrically well defined and hence Frobenius stable, with the normalization fixed on the open orbit.
    The Frobenius-stable perverse Leray filtration, whose spectral sequence degenerates by the same theorem,
    exhibits each cohomology group of this summand as a subquotient of the corresponding scalar cohomology group. Thus
  $ H^i \( "Gr" \, "IC"_lambda \) upright(" has Frobenius as on ") E \( - i \/ 2 \)
    quad \( i upright(" even") \) \, wide H^i = 0 quad \( i upright(" odd") \) . $
  The cohomological convolution comparison is graded and Frobenius compatible.
    Indeed it is constructed by Künneth on separated legs and fusion over the split affine line [19] Lemma 6.1,
    Equations (6.2a)–(6.2c), and Section 14. The cohomology system is lisse across collisions and geometrically
    constant: it is constant on the separated locus in the coordinate trivializations,
    and lisseness extends this constancy. Comparison between rational configurations therefore commutes with
    Frobenius; binary tensor comparison uses the rational configurations $\( 0 \, 1 \)$ and $\( 0 \, 0 \)$,
    available over every finite field. The scalar rule is consequently the same for convolution and the
    corresponding tensor product. Every graded tensor comparison on total cohomology commutes with these scalars.
    Faithfulness of the cohomological Satake fiber functor shows that the kernel tensor maps do as well.
    In particular, the induced Frobenius action on the geometric multiplicity space
    $"Hom" \( "IC"_nu \, "IC"_lambda * "IC"_mu \)$ is trivial:
    source and target cohomology have the same scalar in each degree,
    and the cohomological fiber functor is faithful. Fusion extends the compatibility to the relative system.
    Finally, the uniqueness in Lemma 3 identifies this Weil comparison with the transport comparison. ◻
]

=== 2.3 The specialization input with an action <the-specialization-input-with-an-action>

The geometric result we need is stronger than one-point Hecke commutation.
  It is the combination of Propositions 2.1 and 5.1 of [22], with the following relative setup.
  Let $S = "Spec" R$ be an excellent complete strictly henselian discrete valuation trait with algebraically
  closed residue field and with $ell$ invertible. Fix a geometric generic point $macron(eta)$ and write $s$ for
  the closed point. Let $cal(B) \/ S$ be a smooth locally finite-type bundle stack and let $U \/
  S$ be a smooth scheme of relative dimension one of allowed legs.
  Bounded Hecke correspondences have proper representable output maps,
  and in coordinates and input frames they have the split Schubert local models with their spherical kernels.
  The setup includes ordinary and enhanced level disjoint from the legs, and the twisted nodal families used below.

#thm([Proposition 2.4.])[
  (Geometric specialization and transport).  #emph[In this setup,
    geometric nearby cycles preserve local bounded constructibility and are perverse exact.
    They admit natural isomorphisms
#[#set math.equation(numbering: n => "(2.5)")
 $ sans(H)_(I \, bold(V))^s \( Psi F \) arrow.r^(med tilde.op med) Psi #scale(x: 120%, y: 120%)[\(]
   sans(H)_(I \, bold(V))^(macron(eta)) \( F \) #scale(x: 120%, y: 120%)[\)] $ <eq:hecke-specialization>]

 compatible with the unit, convolution, permutations, and every fusion diagonal.
   Suppose $F$ has a coherent eigenstructure with parameter $theta.alt_(macron(eta))$.
   For each representation, suppose its evaluation sheaf has a lisse lattice whose finite reductions extend lisse
   after finite trait extensions, compatibly on further extensions and with the reductions of a special-fiber
   tensor system $theta.alt_s$. Then $Psi F$ has a coherent eigenstructure with eigenvalue $theta.alt_s$.]
  #emph[If the models, $F$ with its given coherent eigenstructure,
    and these tensor-specialization data carry a semilinear generator, with a compatible lift to $macron(eta)$,
    all the comparisons and the resulting eigenstructure are equivariant.
    For the finite-stage lattice models one may use compatible invariant trait extensions.
    No single finite extension is required for all reductions.]
] <prop:equivariant-specialization>

#proof[
  The geometric assertions are exactly [22] Propositions 2.1 and 5.1;
    the foundational nearby-cycle formalism is also described in [14] Section 4.1 and [16] Theorems 4.1 and 6.7.
    In particular, these are geometric nearby cycles without inertia invariants,
    and the input need not descend over one finite extension of the fraction field.
  We explain the additional equivariance. An isomorphism of traits and models,
    together with its lift to the geometric generic point, identifies the defining nearby-cycle diagrams.
    The pullback, proper-pushforward, and tensor exchange maps therefore commute with its transport.
    In input frames the Hecke comparison is the natural exterior-product exchange with a Satake kernel,
    followed by proper-pushforward exchange. This is the construction in [22] Section 5,
    including its comparison on collision diagonals. The Satake-label identification in [22] Lemma 5.3 also
    commutes with transport: the two composites are tensor comparisons and hence agree by Lemma 3.
  On the eigenvalue side, the lisse tensor comparison is natural at every finite lattice reduction and every
    further trait extension. Passing to the adic system preserves this naturality.
    Thus (2.5) transports the equivariant eigenmaps and all their diagrams.
    The convolution and nested diagonal identities are identities of the same exchange transformations;
    they require no separate choices. At a finite-field fiber their Satake structures are the normalized Weil
    structures by Lemma 4. ◻
]

=== 2.4 The characteristic restriction for $upright("SL")_n$ <the-characteristic-restriction-for-mathrmsl_n>

The remaining geometric inputs of [22] have four Lie-theoretic hypotheses:
  a nondegenerate invariant symmetric form, also nondegenerate on every Levi’s Lie-algebra center;
  Chevalley restriction for every Levi; scheme-theoretic semisimple centralizers that are Levis;
  and containment of every nilpotent element, over every field extension,
  in the nilradical of a parabolic defined over that field.
  We verify them to make the characteristic restriction in the main theorem explicit.

#thm([Lemma 2.5.])[
  #emph[For $G = upright("SL")_n$ over an algebraically closed field of characteristic zero or of characteristic
    $p > n$, the hypotheses H1–H4 of [22] Theorem 1.1 hold.]
] <lem:lie-hypotheses>

#proof[
  The invariant form $kappa \( X \, Y \) = "tr" \( X Y \)$ is nondegenerate on $frak(s l)_n$,
    since $n$ is invertible. For a block Levi with block sizes $n_1 \, dots.h \, n_r$,
    its restriction to the Lie-algebra center is the diagonal form with entries $n_i$ on
  $ { \( z_i \) : sum_i n_i z_i = 0 } . $
  This hyperplane is the orthogonal complement of $\( 1 \, dots.h \, 1 \)$, whose squared length is $n$.
    All $n_i$ and $n$ are invertible, so the restricted form is nondegenerate.
  Chevalley restriction for these Levis follows by block diagonalization on the dense regular-semisimple locus.
    Block-symmetric polynomials in the eigenvalues lift by the block characteristic polynomials.
    The Weyl-group order divides $n !$, which is invertible; averaging shows that invariants on the
    total-trace-zero hyperplane are restrictions of invariants on the full diagonal space.
    Block diagonalization may be performed in the determinant-one Levi,
    by adjusting the determinant with an element of the diagonal centralizer.
  The scheme-theoretic centralizer of a semisimple Lie-algebra element is its block Levi,
    as follows directly from the matrix commutation equations.
    Finally, over every field extension, vanishing of the positive-degree invariant polynomials says that the
    matrix is nilpotent. A basis adapted to its kernel filtration puts it in a strictly triangular Lie algebra
    defined over that field. It therefore lies in the nilradical of a rational Borel,
    which supplies the required rational parabolic. ◻
]

== 3 An equivariant unramified eigencomplex <sec:unramified>

The first specialization will start with an unramified eigencomplex on a smooth projective curve in characteristic
  zero. The geometric existence theorem supplies such a complex,
  but does not by itself supply the semilinear action needed here.
  We obtain that action by using the particular eigencomplex attached to a spectral skyscraper.
  Its spectral component is preserved by transport, and the skyscraper can be recognized from its endomorphisms.
  A second rigidity argument then shows that every isomorphism with its transport respects the full eigenstructure.

#thm([Proposition 3.1.])[
  #emph[Let $C$ be a smooth projective connected curve of genus at least two over an algebraically closed field
    $K$ of characteristic zero. Let $f$ be a semilinear automorphism of $C$ with an ample line bundle $cal(L)$ and
    an isomorphism $f^(*) cal(L) tilde.eq cal(L)$. Let $G = upright("SL")_n$ and $caron(G) = upright("PGL")_n$.
    Suppose that $tau$ is a continuous $caron(G)$-local system on $C$,
    defined over a finite extension of $bb(Q)_ell$, with Zariski-dense image and an isomorphism $u :
    f^(*) tau arrow.r^tilde.op tau$.]
  #emph[There is a nonzero locally bounded constructible complex $D_tau$ on $"Bun"_G \( C \)$,
    with nilpotent singular support, a full coherent Hecke eigenstructure of eigenvalue $tau$, and an isomorphism
$ b : f^(*) D_tau arrow.r^tilde.op D_tau $

 compatible with that eigenstructure and $u$. The object $D_tau$ is compact in the automorphic nilpotent category.
   The eigenstructure uses the relative Satake normalization of Section 2 and is compatible with unit,
   convolution, permutations, and every fusion diagonal. The isomorphisms $b$ and $u$ define compatible actions of
   $bb(Z)$ on the eigencomplex and its eigenvalue.]
] <prop:equivariant-unramified>

Here $f^(*)$ denotes transport on the curve and on its bundle stack,
  with the coefficient field $overline(bb(Q))_ell$ fixed. We prove the proposition in three steps:
  identify the spectral summand and its behavior under transport,
  recognize the transported object without a shift, and prove uniqueness of the coherent eigenstructure on that object.

=== 3.1 The spectral skyscraper and transport of the action <the-spectral-skyscraper-and-transport-of-the-action>

Write

$ cal(S) = "LocSys"_(caron(G))^(upright("restr")) \( C \) \, wide cal(D)_C =
  "Shv"_(upright("Nilp")) \( "Bun"_G \( C \) \) . $

The first stack parametrizes local systems with restricted variation;
  the second is the full automorphic category with global nilpotent singular support.
  We use the following precise characteristic-zero input from the proof of [22] Lemma 8.1.
  The Gaitsgory–Raskin equivalence

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(D)_C tilde.eq "IndCoh"_(upright("Nilp")) \( cal(S) \) $ <eq:unramified-equivalence>]

is linear for the $"QCoh" \( cal(S) \)$-action, and the inclusion of $cal(D)_C$ in the ambient automorphic
  category preserves compact objects [14] Main Theorem 1.3.9(ii), Lemma 1.3.7, and Theorem 1.1.7.
  These statements apply to geometric $overline(bb(Q))_ell$-adic sheaves over an arbitrary algebraically closed
  characteristic-zero field [14] Section 2.3. The spectral action agrees, through universal evaluation,
  with the coherent Hecke action [2] Main Theorem 14.3.2 and Section 14.3.3.
  As in [22] Lemma 8.1, we identify the external Satake labels with our input–output convention:
  if a tensor relabeling $alpha$ is required, the external point is $tau compose alpha^(- 1)$.
  Evaluation at the point denoted by $tau$ below is therefore exactly $V mapsto V_tau$.

Let $i_tau : "Spec" overline(bb(Q))_ell arrow.r cal(S)$ denote this point, and put

$ delta_tau = i_(tau \, *)^("IndCoh") overline(bb(Q))_ell . $

We recall the local description used in [22] Lemma 8.1, since it will also recognize the transport of this object.
  The components of $cal(S)$ are indexed by semisimple parameters;
  the component of an irreducible parameter has only one isomorphism class of geometric points [2]
  Proposition 3.7.2 and Corollary 3.7.5. Density makes $tau$ irreducible and gives

#[#set math.equation(numbering: n => "(3.2)")
 $ "Aut" \( tau \) = Z_(caron(G)) \( "im" tau \) = Z \( caron(G) \) = 1 . $ <eq:unramified-centralizer>]

The tangent complex of $cal(S)$ at $tau$ is $R Gamma \( C \, "ad" \( tau \) \) \[ 1 \]$ [2] Section 21.2.1.
  Its degree $- 1$ cohomology is zero by (3.2). The invariant nondegenerate form on $"Lie" \( caron(G) \)$ and
  Poincaré duality give

$ H^2 \( C \, "ad" \( tau \) \) tilde.eq H^0 \( C \, "ad" \( tau \) \)^or \( - 1 \) = 0 . $

Thus the open-and-closed component $cal(S)_tau$ containing $tau$ has no infinitesimal automorphisms or
  obstructions and is a smooth one-point formal polydisc, with tangent space $H^1 \( C \, "ad" \( tau \) \)$.

For this formal component we use the completion description

$ "IndCoh" \( cal(S)_tau \) tilde.eq "IndCoh" \( bb(A)_(overline(bb(Q))_ell)^d \)_({ 0 }) \, wide d =
  dim_(overline(bb(Q))_ell) H^1 \( C \, "ad" \( tau \) \) \, $

as in [2] Sections 21.1.7–21.1.10; the right-hand category consists of objects set-theoretically supported at the
  origin. Its compact objects are bounded coherent complexes with this support.
  Indeed, coherent complexes with this support are compact and generate the supported category;
  on the smooth affine space this is also the usual generation by the Koszul complex at the origin.
  In particular their cohomology modules have finite length. The skyscraper $delta_tau$ is nonzero and compact.
  Since the formal component is smooth, it has no spectral obstruction directions,
  so $delta_tau$ has nilpotent spectral singular support. This is the ind-coherent singular-support condition,
  rather than the microlocal support of a constructible skyscraper.

Choose an equivalence (3.1), and let $D_tau$ be the inverse image of $delta_tau$.
  It is compact in $cal(D)_C$ and in the ambient automorphic category.
  Compact automorphic objects are bounded constructible on every finite-type smooth chart [2] Appendix F,
  Section F.2.2, so $D_tau$ is locally bounded constructible.
  Its full eigenstructure is the one constructed in [22] Lemma 8.1: the module identities

#[#set math.equation(numbering: n => "(3.3)")
 $ A ⊗ delta_tau tilde.eq i_(tau \, *)^("IndCoh") \( i_tau^(*) A \) \, wide A in "QCoh" \( cal(S) \) \,
   $ <eq:skyscraper-evaluation>]

applied to universal evaluation over $C^I$, give

#[#set math.equation(numbering: n => "(3.4)")
 $ sans(H)_(I \, \( V_i \)) \( D_tau \) tilde.eq D_tau times.square #scale(x: 180%, y: 180%)[\(]
   times.square_(i in I) \( V_i \)_tau #scale(x: 180%, y: 180%)[\)] . $ <eq:unramified-eigenmaps>]

The unit, tensor, permutation, and fusion maps come from the same universal evaluation system.
  Spectral linearity transports all of them together. This proves the required geometric assertions about $D_tau$.

The remaining issue is the action of $f$. It is enough at this stage to preserve the summand corresponding to
  $cal(S)_tau$; no equivariance of the chosen equivalence (3.1) is required.

#thm([Lemma 3.2.])[
  #emph[Semilinear transport by $f$ identifies the automorphic spectral action with the action for the transported
    curve and its restricted stack of local systems. Consequently, if $f^(*) tau tilde.eq tau$,
    transport preserves the summand of $cal(D)_C$ corresponding to $cal(S)_tau$.]
] <lem:spectral-action-transport>

#proof[
  We compare the finite-set Hecke action data that characterize the spectral action.
    These data include derived representation labels, leg factors $"QLisse" \( C \)^(⊗ I)$,
    and their higher compatibilities; $"QLisse" \( C \)$ is the category of quasi-lisse sheaves of [2]
    Section 8.1.1. Exterior product realizes the leg factors on $C^I$.
    We must transport both the Hecke diagrams and this quasi-lisse factorization.
  First consider the geometric Hecke diagrams. Transport by $f$ is an exact $overline(bb(Q))_ell$-linear
    equivalence preserving nilpotent singular support. It takes every Hecke correspondence over $C^I$ to its
    transported correspondence and commutes with pullback, tensor product, convolution pushforward,
    and their exchange maps. Lemma 3 compares the Satake kernels and their tensor and fusion maps.
    Dualizing complexes are transported as well, so the comparison also applies when the action is expressed with
    dualizing pullback conventions. The resulting comparison is one of the actual sheaf operations and their
    structural maps, including the geometric maps in the leg categories.
  To pass from ordinary representations to the derived labels, use the construction of [13] Sections B.3.6–B.3.8,
    recalled in [2] Section 14.2.2: bounded-derived extension, restriction to compact objects,
    and then ind-extension. On the perverse representation objects,
    the preceding comparison identifies the Satake diagrams with all their structural maps.
    The universal property of the bounded derived category extends it exactly and preserves the coherent
    finite-set diagrams. The resulting right-lax monoidal structure maps are isomorphisms.
    Restriction to compact objects and ind-extension therefore give the comparison for the continuous derived
    action. This uses the specified extension of the representation action;
    it does not identify the whole derived spherical sheaf category with the derived representation category.
  It remains to compare the quasi-lisse factorization. Transport identifies $"QLisse" \( C \)^(⊗ I)$ with the
    corresponding category for the transported curve. The exterior-product embedding used in [2] Section 14.2.5 is
    fully faithful, so the comparison just constructed also identifies the Hecke action with values in these leg
    categories. This is the action developed in [2] Sections 14.2.5–14.2.8 and Main Theorem 14.3.2.
  We have now compared the full finite-set action data. Transport also identifies the universal evaluation objects
    on the restricted stacks. By [2] Theorem 8.1.4, universal evaluation gives an equivalence between the space of
    $"QCoh" \( cal(S) \)$-actions and the space of these data, with their higher compatibilities.
    Consequently the conjugate of the spectral action under transport is the spectral action of the transported curve.
  The component $cal(S)_tau$ is carried to the component of $f^(*) tau$.
    When these parameters are isomorphic, its component idempotent is preserved.
    This idempotent acts as the identity on $D_tau$, and hence also on $f^(*) D_tau$, proving the final assertion. ◻
]

=== 3.2 Recognizing the transported object <recognizing-the-transported-object>

The preceding lemma places $f^(*) D_tau$ in the same spectral component as $D_tau$.
  We now recognize its image there. The required elementary criterion is useful independently of the spectral setting.

#thm([Lemma 3.3.])[
  #emph[Let $\( R \, frak(m) \)$ be a commutative local $overline(bb(Q))_ell$-algebra with residue field
    $overline(bb(Q))_ell$, and let $P$ be a nonzero bounded complex of $R$-modules whose cohomology modules have
    finite length. Suppose that
$ "Hom"_(D \( R \)) \( P \, P \) = overline(bb(Q))_ell \, wide "Hom"_(D \( R \)) \( P \, P \[ j \] \) =
  0 quad \( j < 0 \) . $

 Then $P tilde.eq overline(bb(Q))_ell \[ r \]$ for an integer $r$.]
] <lem:point-object>

#proof[
  Let $a$ and $b$ be the least and greatest degrees with nonzero cohomology.
    Any two nonzero finite-length modules over $R$ admit a nonzero map from the first to the second:
    take a quotient of the first onto $overline(bb(Q))_ell$ and an inclusion of $overline(bb(Q))_ell$ into the
    socle of the second. Thus, if $a < b$, there is a nonzero map $h : H^b \( P \) arrow.r H^a \( P \)$.
    The truncation maps give a composite
  $ P arrow.r H^b \( P \) \[ - b \] arrow.r^(h \[ - b \]) H^a \( P \) \[ - b \] arrow.r P \[ a - b \] . $
  Its map on degree $b$ cohomology is $h$, so it is a nonzero negative-degree endomorphism.
    This contradicts the hypothesis. Hence $a = b$, and $P$ is a shift of a single finite-length module $M$.
  Every element of $frak(m)$ acts nilpotently on $M$. Since $"End"_R \( M \) = overline(bb(Q))_ell$,
    this action is a nilpotent scalar and is therefore zero. Thus $M$ is an $overline(bb(Q))_ell$-vector space,
    and all of its $overline(bb(Q))_ell$-linear endomorphisms are $R$-linear.
    The equality $"End"_R \( M \) = overline(bb(Q))_ell$ forces $dim_(overline(bb(Q))_ell) M = 1$. ◻
]

For the skyscraper, and therefore for $D_tau$, we have

#[#set math.equation(numbering: n => "(3.5)")
 $ H^0 R "Hom" \( D_tau \, D_tau \) = overline(bb(Q))_ell \, wide H^j R "Hom" \( D_tau \, D_tau \) =
   0 quad \( j < 0 \) . $ <eq:unramified-endomorphisms>]

These are the ambient automorphic Hom groups, since $cal(D)_C$ is a full subcategory.
  Transport preserves both these groups and compactness. Lemma 8 places $f^(*) D_tau$ in the $cal(S)_tau$ summand.
  Its image under (3.1) is therefore a bounded coherent complex supported at the origin of the smooth formal
  component. Applying Lemma 9 to the local ring at that origin gives

#[#set math.equation(numbering: n => "(3.6)")
 $ f^(*) D_tau tilde.eq D_tau \[ r \] $ <eq:unramified-possible-shift>]

for some $r in bb(Z)$.

We eliminate the shift on a bounded open, so no global cohomological bound on $"Bun"_G \( C \)$ is needed.
  Use the $f$-invariant ample line bundle $cal(L)$ in the statement.
  For each sufficiently large integer $m$, let $cal(U)_m subset
  "Bun"_(upright("SL")_n) \( C \)$ be the open substack on which the associated vector bundle $cal(V)$ satisfies

$ cal(V) ⊗ cal(L)^m upright(" is globally generated") \, wide H^1 \( C \, cal(V) ⊗ cal(L)^m \) = 0 . $

These conditions are open and the opens cover the bundle stack by Serre vanishing.
  Each $cal(U)_m$ is of finite type: rank and trivialized determinant fix the Hilbert polynomial,
  the displayed conditions fix $h^0$, and a choice of basis of sections gives the usual finite-type Quot
  presentation. Adding the determinant trivialization is also a finite-type condition.
  Because $f$ preserves $cal(L)$, every $cal(U)_m$ is invariant under transport.

Choose $m$ with $D_tau \|_(cal(U)_m) eq.not 0$. On a finite-type smooth atlas of $cal(U)_m$,
  local bounded constructibility gives a finite cohomological interval;
  descent gives the same boundedness on $cal(U)_m$. Consequently

$ S_m = { j in bb(Z) : cal(H)^j \( D_tau \|_(cal(U)_m) \) eq.not 0 } $

is finite and nonempty. Pullback along the automorphism of $cal(U)_m$ is exact and conservative,
  so it preserves $S_m$. Equation (3.6) gives $S_m = S_m - r$, which forces $r = 0$.
  We have obtained an isomorphism $b : f^(*) D_tau tilde.eq D_tau$.
  It remains to verify its compatibility with the Hecke eigenmaps.

=== 3.3 Uniqueness of the full eigenstructure <uniqueness-of-the-full-eigenstructure>

For $I$ a finite set and $L_1 \, L_2$ finite-rank lisse $overline(bb(Q))_ell$-sheaves on $C^I$,
  there is a natural external-product formula

#[#set math.equation(numbering: n => "(3.7)")
 $ R "Hom" \( D_tau times.square L_1 \, D_tau times.square L_2 \) tilde.eq R
   "Hom" \( D_tau \, D_tau \) ⊗_(overline(bb(Q))_ell) R Gamma \( C^I \, L_1^or ⊗ L_2 \) . $ <eq:unramified-hom-kunneth>]

We explain its applicability to the non-quasicompact bundle stack.
  On every finite-type smooth scheme chart, the restrictions of $D_tau$ are bounded constructible,
  and the usual constructible Hom–Künneth formula applies. Equivalently,
  one can use adjunction for the projection to the chart, proper base change for $C^I$,
  and the projection formula. The second factor in (3.7) is a bounded finite-dimensional
  $overline(bb(Q))_ell$-complex, hence perfect. Tensoring with it commutes with the limits computing smooth
  descent and restriction over finite-type opens of the bundle stack.
  The chartwise formulas therefore give the displayed global formula.
  On constructible chart objects these are also the Hom complexes in the ambient ind-sheaf category.

Both factors on the right are concentrated in nonnegative degrees,
  by (3.5) and the fact that the $L_i$ are ordinary lisse sheaves. Thus

#[#set math.equation(numbering: n => "(3.8)")
 $ "Hom" \( D_tau times.square L_1 \, D_tau times.square L_2 \) & tilde.eq "Hom" \( L_1 \, L_2 \) \,\
H^j R "Hom" \( D_tau times.square L_1 \, D_tau times.square L_2 \) & = 0 wide \( j < 0 \) . $ <eq:unramified-hom-zero>]

The first identification sends a lisse-sheaf map $a$ to $upright("id")_(D_tau) times.square a$.

#thm([Lemma 3.4.])[
  #emph[The complex $D_tau$ admits a unique full coherent Hecke eigenstructure with eigenvalue $tau$.
    Consequently every isomorphism $f^(*) D_tau tilde.eq D_tau$ is compatible with the eigenstructure and the
    given isomorphism $u : f^(*) tau tilde.eq tau$.]
] <lem:unramified-eigenstructure-unique>

#proof[
  Compare two full eigenstructures. For each finite set $I$ and tuple of representations $\( V_i \)$,
    their eigenmaps differ by an automorphism of
  $ D_tau times.square #scale(x: 180%, y: 180%)[\(] times.square_(i in I) \( V_i \)_tau #scale(x: 180%, y: 180%)[\)] . $
  By (3.8), this automorphism is uniquely $upright("id")_(D_tau) times.square a_(I \, \( V_i \))$,
    where $a_(I \, \( V_i \))$ is an automorphism of the lisse factor.
    Naturality of the eigenstructures makes the one-leg maps $a_V$ natural in $V$.
    Compatibility with successive Hecke operations, on the locus of distinct legs,
    identifies the maps $a_(I \, \( V_i \))$ with exterior products of the one-leg maps.
    Equality on that dense open determines maps of lisse sheaves on $C^I$. Fusion along the diagonal then gives
  $ a_(V ⊗ W) = a_V ⊗ a_W \, wide a_(overline(bb(Q))_ell) = upright("id") . $
  Thus the $a_V$ form a tensor automorphism of the local-system functor $V mapsto V_tau$.
    Its group is the centralizer of the monodromy of $tau$ in $caron(G)$, which is trivial by (3.2).
    All $a_V$, and hence all $a_(I \, \( V_i \))$, are identities. The two systems of eigenmaps agree.
  This also proves uniqueness at the level of coherent structures.
    Equation (3.8) says that the mapping spaces between the displayed targets have no positive homotopy groups.
    The eigenmaps identify the successive Hecke transforms in the compatibility diagrams with targets of the same
    form. Hence there is no additional choice of higher homotopies in the unit, convolution, permutation,
    or fusion compatibilities. The resulting natural transformation on ordinary representation labels has a unique
    exact continuous extension by the universal properties of the stable and ind constructions defining the
    spectral action.
  Now transport the eigenstructure of $D_tau$ by $f$, use $u$ on its eigenvalue, and use any isomorphism $b :
    f^(*) D_tau tilde.eq D_tau$ on the automorphic factor. Lemma 3 makes this a full eigenstructure on $D_tau$
    with eigenvalue $tau$. The uniqueness just proved identifies it with the original one,
    which is the claimed compatibility of $b$. ◻
]

#proof[
  The inverse image of $delta_tau$ constructed above is nonzero, compact, locally bounded constructible,
    and carries the coherent geometric eigenstructure (3.4). Its membership in $cal(D)_C$ gives nilpotent singular
    support. Spectral-action transport, Lemma 9, and the invariant-open argument give an isomorphism $b :
    f^(*) D_tau tilde.eq D_tau$. Lemma 10 proves its compatibility with $u$ and all eigenmaps.
    Iterating $b$ and its inverse defines the action of the free cyclic group,
    with the corresponding iterations of $u$ on the eigenvalue.
    The eigenstructure compatibilities persist under these iterations.
    This is the asserted $bb(Z)$-equivariant eigencomplex. ◻
]

== 4 Arithmetic towers and equivariant gluing at a node <sec:parameters>

We construct the parameter to which the unramified input of Proposition 7 will be applied. There are two steps.
  First we lift the arithmetic parameter $rho$ to a punctured curve in characteristic zero,
  retaining its Frobenius action and its entire boundary homomorphism.
  We then place this lift on one component of a separating nodal curve and extend it to an unramified parameter on
  a smooth generic fiber. In the second step the gluing must preserve both Frobenius and compactness of the
  monodromy image. A ramified auxiliary component will allow us to satisfy these two conditions simultaneously.

=== 4.1 Lifting the arithmetic parameter <lifting-the-arithmetic-parameter>

With $k = overline(bb(F))_q$, set

#[#set math.equation(numbering: n => "(4.1)")
 $ R_0 = W \( bb(F)_q \) \, wide D = "Frac" \( R_0 \) \, wide R = W \( k \) \, wide K =
   overline("Frac" \( R \)) \, wide overline(D) = overline(D) subset K . $ <eq:coefficient-traits>]

Here $overline(D)$ is the algebraic closure of $D$ inside $K$.
  The ring $R$ is an excellent complete strictly henselian discrete valuation ring with residue field $k$.
  Extend the Witt-vector automorphism of $R$ induced by $a mapsto a^q$ on $k$ to an automorphism $phi$ of $K$.
  It fixes $D$ and preserves $overline(D)$. On roots of unity of $ell$-power order it acts by $zeta mapsto
  zeta^q$, as follows from their Teichmüller lifts in $R$. We use the same letter for these compatible actions,
  with the coordinate orientation fixed in Section 2.

Choose a smooth projective pointed lift

$ \( cal(X) \, frak(x) \) arrow.r "Spec" R_0 quad upright("of ") \( X_0 \, x_0 \) \, wide cal(U) = cal(X) \\ frak(x) . $

Pointed deformations are unobstructed because $H^2 \( X_0 \, T_(X_0) \( - x_0 \) \) = 0$;
  an ample line bundle also lifts, and formal algebraization gives the projective family.
  This is the lifting construction of [22] Section 8.5, here performed over $R_0$ so as to retain the field of
  definition. Write

$ \( C_1 \, x_1 \) = \( cal(X) \, frak(x) \)_D \, wide U_1 = C_1 \\ { x_1 } . $

By smoothness, a function $t$ on a neighborhood of $frak(x)$ over $R_0$ may be chosen as a relative parameter.
  Its differential trivializes the conormal line of the section. We also regard $t$ as a rational function on $C_1$.

For an integer $d$ invertible in $R_0$, the coordinate $t$ identifies the residual gerbe of
  $cal(X) \( root(d, frak(x)) \)$ with $B mu_d$ over $R_0$:
  it trivializes the divisor line by $1 \/ t$ and thereby specifies its trivial $d$th root.
  Pulling a finite torsor back to this neutral object gives its boundary fiber.
  A frame over the strictly henselian base $R$ identifies that fiber with its finite structure group,
  acting on itself on the right. In this frame, both inertia and semilinear transport are recorded by left
  multiplication. The construction below chooses such frames compatibly through the tower.

#thm([Proposition 4.1.])[
  #emph[The arithmetic representation $rho$ determines a continuous parameter
$ sigma_1 : pi_1^(upright("et")) \( \( U_1 \)_(overline(D)) \) arrow.r upright("PGL")_n \( L' \) $

 for a finite coefficient extension $L' \/ L$, together with equivariance under $phi$, with the following properties.]
  #{ set enum(numbering: "i."); [
  + #emph[Its geometric image is Zariski dense. After compatible choices of frames it is the same compact subgroup
    as $rho \( pi_1^(upright("et")) \( U_(0 \, k) \) \)$.]
  + #emph[Its boundary homomorphism is
#[#set math.equation(numbering: n => "(4.2)")
 $ gamma mapsto exp \( t_ell \( gamma \) N_1 \) \, $ <eq:lifted-boundary>]

 where $N_1$ is regular nilpotent. Every prime factor of characteristic-zero inertia other than $ell$ acts trivially.]
  + #emph[In compatible frames at the coordinate-neutralized root gerbes of $x_1$,
    the equivariance has a single value $A in H_0$, where $H_0 = rho \( pi_1^(upright("et")) \( U_0 \) \)$, and
#[#set math.equation(numbering: n => "(4.3)")
 $ "Ad" \( A \) N_1 = q N_1 . $ <eq:frobenius-scales-nilpotent>]

]
  + #emph[For every algebraic representation of $upright("PGL")_n$,
    the associated local system over $\( U_1 \)_K$ admits an invariant lattice whose finite reductions extend
    lisse over $cal(U)_R$, equivariantly under $phi$. Their specializations recover the tensor local system of
    $rho$, including its given arithmetic action.]
] }
] <prop:lifted-parameter>

We prove the proposition after a finite-cover lemma that will also be used in the nodal smoothing.
  It compares monodromy orbits on finite torsor fibers, allowing disconnected torsors as required when we enlarge
  the compact group that records monodromy.

#thm([Lemma 4.2.])[
  #emph[Let $S$ be the spectrum of a complete strictly henselian discrete valuation ring with algebraically closed
    residue field, and let $cal(Y) arrow.r S$ be a proper flat tame Deligne–Mumford curve with finite diagonal,
    projective coarse space, and geometrically reduced fibers.
    Let $cal(T) arrow.r cal(Y)$ be a finite étale right $Q$-torsor, for a finite group $Q$, and let $y : S arrow.r
    cal(Y)$ be a section in its smooth scheme locus. Identify the geometric special and generic fibers of $y^(*)
    cal(T)$ by a trivialization over $S$. The partitions of this finite set by connected components of
    $cal(T)_(macron(s))$ and $cal(T)_(macron(eta))$ then agree.]
] <lem:component-orbits>

#proof[
  The stack $cal(T)$ is again proper, flat, and tame, with geometrically reduced fibers.
    Proper henselian invariance lifts the open-and-closed decomposition of $cal(T)_(macron(s))$ to one of
    $cal(T)$; equivalently, it lifts the corresponding idempotents [23] Theorem 4.5.
    Consider one lifted summand $cal(Z)$. Its special fiber is connected, reduced,
    and proper over an algebraically closed field, so
  $ H^0 \( cal(Z)_(macron(s)) \, cal(O) \) = k \( macron(s) \) . $
  Coarse-space pushforward for a tame stack is exact and commutes with base change [1] Lemmas 2.3.3–2.3.4.
    The coarse space here is flat over $S$: locally, taking invariants under a linearly reductive finite group
    preserves flatness. Thus semicontinuity on this proper coarse space gives
    $h^0 \( cal(Z)_(macron(eta)) \, cal(O) \) lt.eq 1$. Flatness ensures that the generic fiber is nonempty,
    so this dimension is exactly one. In particular $cal(Z)_(macron(eta))$ is connected.
    Every lifted special component therefore has exactly one geometric generic component.
    Intersecting these components with the trivialized section fiber proves the assertion. ◻
]

#proof[
  The use of the arithmetic image $H_0$, rather than only the geometric image,
    retains the action that we need to specialize at the end of the proof. This image is compact.
    Choose a faithful linear representation and an $H_0$-invariant lattice,
    and let $H_(0 \, r)$ be a decreasing sequence of open normal congruence subgroups cofinal at the identity.
    Put $Gamma_r = H_0 \/ H_(0 \, r)$. The finite quotients of $rho$ give a compatible tower of right
    $Gamma_r$-torsors on $U_0$. We choose the torsor convention so that associated local systems have monodromy $rho$.
  At stage $r$ the inertia image has $ell$-power order. Choose indices $d_r$, each a power of $ell$,
    with $d_r divides d_(r + 1)$ and with $d_r$ divisible by that order.
    The stage-$r$ torsor extends uniquely to a finite étale torsor on the root stack
  $ X_0 \( root(d_r, x_0) \) . $
  Indeed a Kummer root of the local parameter kills the finite tame inertia,
    after which the cover is étale across the root divisor. This local description also proves the assertion over
    the original finite field, or one can descend the geometric extension by its uniqueness.
    The tame-cover interpretation is [18] Proposition A.10.
  The relative root stack $cal(X) \( root(d_r, frak(x)) \)$ is smooth, proper, and tame over $R_0$,
    with finite diagonal, since $d_r$ is invertible in $R_0$.
    Proper henselian invariance therefore lifts the torsor to this relative root stack [23] Theorem 4.5;
    see also [18] Theorem A.11 and Corollaries A.12–A.13 and [22] Sections 8.3 and 8.5.
    Full faithfulness lifts its group action and the transition maps,
    comparing on a divisible root index when necessary, and preserves all relations among those maps.
    Only the root indices have been required to be prime to $p$;
    the finite groups $Gamma_r$ may have order divisible by $p$.
  Restriction to $cal(U)$ and then to $\( U_1 \)_(overline(D))$ gives the parameter $sigma_1$ with values in
    $"proj lim"_r Gamma_r = H_0$, after framing. All the lifted data are over $R_0$.
    Their base changes to $R$ and $overline(D)$ consequently carry the descended semilinear $phi$-actions and
    their compatible transition maps.
  We first check the geometric image. Choose a section of $cal(U)_R$ through a geometric special point and
    compatible frames of the tower along it. Such frames exist because this section is strictly henselian.
    Apply Lemma 12 at each stage after base change to $R$. The geometric fibers of the root stacks and of their
    finite étale covers are smooth curves as stacks. A connected component is therefore irreducible,
    and removing the marked gerbes and their inverse images preserves its connectedness.
    The component partitions on the punctured geometric special and generic fibers agree.
    In the fiber of a torsor these partitions are the monodromy orbits;
    the orbit of the chosen frame is precisely the image subgroup of $Gamma_r$.
    Thus the geometric images have the same image in every $Gamma_r$.
    Both are compact, hence closed, in $H_0$, so they are equal.
    Connected components are unchanged by extension from $overline(D)$ to $K$,
    giving the assertion for $sigma_1$ itself. Density now follows from the hypothesis on $rho$.
  To compare the boundary actions, use $t$ to neutralize the residual gerbe of each root stack as $B mu_(d_r)$,
    compatibly under power maps. Pullback to its neutral object over $R$ gives a finite étale torsor on a strictly
    henselian trait. The resulting finite nonempty sets of frames have surjective transition maps,
    so a compatible frame can be chosen throughout the tower.
    Its $mu_(d_r)$-action is the same on special and generic fibers under the identification of prime-to-$p$ roots
    of unity. These actions record the entire peripheral homomorphism, not just its conjugacy class.
    Passing to the limit gives (4.2), with $N_1$ conjugate to the original regular nilpotent after the fixed
    generator convention. Since only $ell$-power root indices were used,
    each $bb(Z)_a \( 1 \)$-factor of characteristic-zero inertia with $a eq.not ell$ acts trivially,
    including the factor $a = p$.
  The neutral objects defined by $t$ are themselves defined over $R_0$.
    In their compatible frames the semilinear action is left multiplication by elements of $Gamma_r$ compatible in
    $r$, hence by one element $A in H_0$. Its compatibility with the gerbe action reads
  $ A thin exp \( t_ell \( gamma \) N_1 \) thin A^(- 1) = exp \( q thin t_ell \( gamma \) N_1 \) . $
  Taking the logarithm of a nontrivial boundary element proves (4.3).
    All these statements use the chosen coordinate orientation.
    Replacing the Frobenius generator $phi$ by $phi^(- 1)$ replaces $A$ by $A^(- 1)$ and $q$ by $q^(- 1)$.
  Finally, an algebraic representation defined over a finite coefficient extension has a lattice invariant under
    the compact group $H_0$. Each finite reduction factors through some $Gamma_r$,
    so the lifted torsor extends that reduction over $cal(U)_R$.
    These are equivariant extensions, and their special fibers are the reductions of the original arithmetic local
    system. Tensor products and morphisms compare through the same tower;
    for morphisms one may clear denominators in the chosen lattices.
    This gives the tensor specialization data in (iv). ◻
]

=== 4.2 A compact conjugator and an auxiliary component <a-compact-conjugator-and-an-auxiliary-component>

The first parameter is now lifted with its arithmetic action.
  To extend it across a separating node, the two boundary actions must agree when expressed using the opposite
  orientations of the two branches. The following linear-algebra observation gives an identification that also
  commutes with $A$ and belongs to a fixed compact group.

#thm([Lemma 4.3.])[
  #emph[Suppose $N_1 in frak(p g l)_n \( L' \)$ is regular nilpotent,
    $A in upright("PGL")_n \( L' \)$ satisfies (4.3), and $H_0 subset
    upright("PGL")_n \( L' \)$ is compact with $A in H_0$. After a finite coefficient extension there exist a
    cocharacter $c : bb(G)_m arrow.r upright("PGL")_n$, a compact open subgroup $J$ containing $H_0$,
    and an integer $e > 1$ prime to $ell$, such that
#[#set math.equation(numbering: n => "(4.4)")
 $ c \( z \) A = A c \( z \) \, wide "Ad" \( c \( z \) \) N_1 = z N_1 \, wide P :=
   c \( - 1 \/ e \) in J . $ <eq:compact-conjugator>]

 Consequently $P$ commutes with $A$ and
#[#set math.equation(numbering: n => "(4.5)")
 $ P exp \( - e a N_1 \) P^(- 1) = exp \( a N_1 \) wide \( a in L' \) . $ <eq:inverse-boundary-conjugation>]

]
] <lem:compact-conjugator>

#proof[
  Identify $N_1$ with its traceless nilpotent matrix and choose a matrix lift $tilde(A)$ of $A$.
    The relation $tilde(A) N_1 = q N_1 tilde(A)$ preserves the regular Jordan filtration.
    On its successive one-dimensional quotients the eigenvalues of $tilde(A)$ form a geometric progression with
    ratio $q$. They are distinct, since $q > 1$ is an integer and the coefficient field has characteristic zero.
    Thus $tilde(A)$ is diagonalizable after a finite extension.
    Choose an eigenvector $v_0$ generating a Jordan chain, and put $v_i = N_1^i v_0$ for $0 lt.eq i < n$.
    For some $a_0 eq.not 0$ these vectors satisfy
  $ tilde(A) v_i = a_0 q^i v_i \, wide N_1 v_i = v_(i + 1) med \( i < n - 1 \) \, wide N_1 v_(n - 1) = 0 . $
  The projective class of the diagonal cocharacter $c \( z \) v_i = z^i v_i$ commutes with $A$ and scales $N_1$ by $z$.
  Choose a closed faithful linear representation of $upright("PGL")_n$ and a lattice $Lambda$ stable under $H_0$.
    The inverse image of $upright("GL") \( Lambda \)$ is a compact open subgroup $J$ of
    $upright("PGL")_n \( L' \)$ containing $H_0$: it is open by continuity and compact because the embedding is
    closed. Since $c \( 1 \) = 1$ and $J$ contains a neighborhood of $1$, choose $e > 1$ with $e equiv -
    1$ modulo a sufficiently high power of $ell$. Then $- 1 \/
    e$ is sufficiently close to $1$ that $c \( - 1 \/ e \) in J$. This choice makes $e$ prime to $ell$.
    The last identity follows by applying $"Ad" \( P \) N_1 = - N_1 \/ e$ to the exponential. ◻
]

Fix $c \, J \, e \, P$ as in the lemma, enlarging the coefficient field once and again denoting it by $L'$.
  Retain the notation for all parameters. Define a cover

#[#set math.equation(numbering: n => "(4.6)")
 $ h : C_2 arrow.r C_1 quad upright("by normalizing ") C_1 upright(" in ") D \( C_1 \) \( w \) \, wide w^e =
   t . $ <eq:auxiliary-cover>]

The valuation of $t$ at $x_1$ is one. The polynomial $w^e - t$ is therefore Eisenstein there,
  even after extension to $overline(D)$, so this is a degree-$e$ geometrically connected cover.
  The curve $C_2$ is smooth and projective over $D$, and there is a unique point $x_2$ over $x_1$.
  It is $D$-rational and totally ramified, with local parameter $w$;
  these assertions are also visible in the completed local extension $D \[ \[ t \] \] subset D \[ \[ w \] \]$.
  Riemann–Hurwitz gives $g \( C_2 \) gt.eq 2$.

Put $U_2 = C_2 \\ { x_2 }$ and $sigma_2 = h^(*) sigma_1$ on $\( U_2 \)_(overline(D))$.
  Any other branch points of $h$ lie over $U_1$ and cause no ramification in this pullback local system.
  In the coordinate $w$, its boundary homomorphism is $exp \( e thin t_ell \( gamma \) N_1 \)$.

For the rest of the construction choose open normal subgroups $J_r subset J$, decreasing and cofinal at $1$, and set

#[#set math.equation(numbering: n => "(4.7)")
 $ Q_r = J \/ J_r . $ <eq:nodal-finite-quotients>]

The map $H_0 arrow.r Q_r$ factors through one of the earlier quotients $Gamma_j$,
  because $H_0 ∩ J_r$ is open in $H_0$. Extension of structure group therefore gives a right $Q_r$-torsor on the
  first component with its original equivariance; pullback by $h$ gives the one on the second.
  These torsors need not be connected. For any common root index $b$ divisible by their stage-$r$ inertia orders
  they extend over $C_i \( root(b, x_i) \)_(overline(D))$. The cover $h$ induces a map of these root stacks,
  since $h^(*) x_1 = e x_2$. In coordinates it sends a $b$th root of $t$ to the $e$th power of a $b$th root of
  $w$; on the residual gerbes its map is

#[#set math.equation(numbering: n => "(4.8)")
 $ mu_b arrow.r mu_b \, wide zeta mapsto zeta^e . $ <eq:gerbe-power-map>]

The neutral objects fixed by $t$ and $w$ correspond under this map:
  in their divisor-line trivializations, $h^(*) \( 1 \/ t \) = \( 1 \/ w \)^e$, with no scalar factor.
  The second torsor and its frame are pulled back from the first,
  and this fiber identification is defined over $D$. Thus the induced frame on the second gerbe has exactly the
  same equivariance value $A$ as the first. This equality, in addition to the factor $e$ in the inertia,
  is the arithmetic information supplied by the algebraic cover.

=== 4.3 The balanced smoothing and its parameter <the-balanced-smoothing-and-its-parameter>

Identify $x_1$ with $x_2$ and write $C_0 = C_1 union_(x_1 = x_2) C_2$.
  Choose a projective smoothing $cal(C) arrow.r "Spec" D \[ \[ s \] \]$ of this separating node,
  with a relatively ample line bundle. The curve has unobstructed deformations and an independent smoothing
  parameter at the split node; lifting an ample line bundle algebraizes the deformation.
  As in [22] Section 8.2, the completed local equation can be chosen as

#[#set math.equation(numbering: n => "(4.9)")
 $ a b' = s \, $ <eq:ordinary-node>]

where $a$ restricts to a parameter on the first branch and $b'$ to one on the second.
  Rescaling their tangent coordinates over $D$, and rescaling $s$ accordingly, ensures

$ \( a \/ t \) \( x_1 \) = 1 \, wide \( b' \/ w \) \( x_2 \) = 1 . $

These equalities will identify the coordinate neutralizations of the branch gerbes without a constant unit twist.

Choose compatible roots $s_b$ of $s$ and put

#[#set math.equation(numbering: n => "(4.10)")
 $ S_b = "Spec" overline(D) \[ \[ s_b \] \] \, wide s_b^b = s \, wide Omega =
   overline(overline(D) \( \( s \) \)) . $ <eq:nodal-traits>]

Extend $phi \|_(overline(D))$ coefficientwise to $overline(D) \( \( s \) \)$,
  then to the union obtained by adjoining the compatible roots $s_b$ while fixing those roots,
  and finally to $Omega$. We again denote this automorphism by $phi$.
  The smooth projective geometric generic fiber of $cal(C)$ will be denoted $C \/ Omega$.
  It is connected of genus $g \( C_1 \) + g \( C_2 \)$, and its polarization is $phi$-invariant.

For each $b$, let $cal(C) \( b \) arrow.r S_b$ be the balanced twisted model with node chart

#[#set math.equation(numbering: n => "(4.11)")
 $
   ["Spec" #scale(x: 120%, y: 120%)[\(] overline(D) \[ \[ s_b \] \] \[ u \, v \] \/ \( u v - s_b \)
   #scale(x: 120%, y: 120%)[\)] \/ mu_b] \, quad {a = u^b \, quad b' = v^b \,\
zeta \( u \, v \) = \( zeta u \, zeta^(- 1) v \) . $ <eq:balanced-node>]

Away from the closed node this is the ordinary family after base change.
  The construction is the balanced twisted-curve construction of [21] Theorems 1.9–1.10, Remark 1.11,
  and Proposition 2.2(ii); the chart and its power maps are described in [22] Section 8.2.
  In particular each model is proper, flat, and tame, with projective coarse space and geometrically reduced
  fibers. Its special-fiber normalization is the disjoint union of the two root stacks
  $C_i \( root(b, x_i) \)_(overline(D))$. For $b divides m$ the power maps on $u \,
  v$ give the corresponding maps between models over the map $S_m arrow.r S_b$.

The construction may be made over $D \[ \[ s_b \] \]$ with the group scheme $mu_b$,
  so the models and these maps carry the chosen semilinear actions.
  The ratios $a \/ t$ and $b' \/ w$ have residue one. Their formal roots with constant term one are unique and
  compatible under power maps in characteristic zero. They are also preserved by $phi$.
  Consequently the node chart identifies the branch neutral objects with those already used for $t \, w$.
  For general $b$, only the $ell$-primary quotient of the gerbe acts on our torsors.
  On that quotient $phi$ acts by the $q$th power; the other prime factors act trivially on the torsors.

We fix at this point the index that will produce Borel level on the special-fiber bundle stack.
  Choose a strictly dominant cocharacter $lambda in X_(*) \( T \)$ for the split torus $T subset B subset
  G$ and an integer $b_(*)$ satisfying

#[#set math.equation(numbering: n => "(4.12)")
 $ 0 < chevron.l alpha \, lambda chevron.r < b_(*) wide upright("for every positive root ") alpha . $ <eq:alcove-index>]

Choose the parameter indices $b_r$ so that $b_(*) divides b_r divides
  b_(r + 1)$ and $b_r$ kills the two stage-$r$ inertia actions.
  The sheaf construction will use the fixed model $cal(C) \( b_(*) \)$ and inertia type $lambda \|_(mu_(b_(*)))$;
  the varying indices $b_r$ supply only finite-stage extensions of the parameter.
  Denote by $cal(V) subset cal(C) \( b_(*) \)$ its smooth scheme locus.
  Its geometric generic fiber is $C$ and its special fiber is $\( U_1 union.sq U_2 \)_(overline(D))$.

#thm([Proposition 4.4.])[
  #emph[There exists a continuous Zariski-dense parameter
$ tau : pi_1^(upright("et")) \( C \) arrow.r J subset upright("PGL")_n \( L' \) $

 with equivariance under $phi$. For every algebraic representation of $upright("PGL")_n$,
   an invariant lattice in its evaluation local system has finite reductions extending lisse over $cal(V)
   times_(S_(b_(*))) S_(b_r)$ for sufficiently large $r$. These extensions are equivariant and specialize on the
   two punctured components to $sigma_1$ and $sigma_2$, with their given actions,
   compatibly with the entire tensor system.]
] <prop:nodal-parameter>

#proof[
  We first glue the finite torsors on the special fiber of $cal(C) \( b_r \)$.
    Express both actions using the common node generator $zeta in mu_(b_r)$.
    Write $u_(1 \, r) \( zeta \) in Q_r$ for the first action in its fixed frame.
    On the second branch the positive coordinate generator is $zeta^(- 1)$.
    Combining this orientation reversal with (4.8), its action in the induced frame is
    $u_(1 \, r) \( zeta \)^(- e)$. If $P_r$ is the image of $P$ in $Q_r$, Equation (4.5) gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ P_r thin u_(1 \, r) \( zeta \)^(- e) P_r^(- 1) = u_(1 \, r) \( zeta \) . $ <eq:finite-stage-gluing>]
  To read this identity directly at a finite root index, lift $zeta$ to characteristic-zero tame inertia and use
    (4.2) before reducing to $Q_r$. Different lifts have the same reduction.
    The prime factors other than $ell$ contribute the identity on both sides.
  Identify the second right-torsor fiber with the first by left multiplication by $P_r$.
    Equation (4.13) says exactly that this identification intertwines their gerbe actions.
    Both semilinear actions have value $A_r$, the reduction of $A$.
    Since $P_r A_r = A_r P_r$, the same identification intertwines Frobenius.
    In coordinates on the two fibers the required square is the elementary equality
  $ P_r \( A_r g \) = A_r \( P_r g \) wide \( g in Q_r \) . $
  Figure 1 records the two signs and this gluing map. All the identifications are reductions of the one element $P
    in J$, so they are compatible throughout the tower.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  bezier((-4.6, 0.2), (0, 0), (-2.7, 0.8), (-1.3, 0.5), stroke: (paint: rgb("#1e3f67"), thickness: 0.8pt, miter-limit: 10))
  bezier((0, 0), (4.6, -0.2), (1.3, -0.5), (2.7, -0.8), stroke: (paint: rgb("#1e3f67"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((-3.2, 0.6264), [#text(size: 9pt)[$(C_1,x_1)$]], anchor: "south", padding: 0.1176cm)
  content((3.2, -0.6264), [#text(size: 9pt)[$(C_2,x_2)$]], anchor: "north", padding: 0.1176cm)
  content((0, 0.2469), [#text(size: 9pt)[$B mu_(b_r)$]], anchor: "south", padding: 0.1176cm)
  content((-2.8, -0.75), [#text(size: 9pt)[$u arrow.r.bar zeta u$#linebreak()$u_(1,r)( zeta )$]])
  content((2.8, 0.75), [#text(size: 9pt)[$v arrow.r.bar zeta^(-1)v$#linebreak()$u_(1,r)( zeta )^(-e)$]])
  content((-2.8, -2.05), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.8pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[first fiber: $Q_r$]]])])
  content((2.8, -2.05), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.8pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[second fiber: $Q_r$]]])])
  line((1.406, -2.05), (-1.485, -2.05), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.03969, -2.05), [#text(size: 9pt)[$P_"rA"_r=A_"rP"_r$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: The two branches of the balanced node and the torsor fibers on its normalization, shown schematically. The cover $w^e = t$ multiplies boundary monodromy by $e$, and the second branch reverses its orientation. Multiplication by $P_r$ identifies the resulting action $u_(1 \, r)^(- e)$ with $u_(1 \, r)$ while commuting with the common Frobenius value $A_r$. ],
  ) <fig:node-gluing>
  The normalization torsors now glue to a finite étale right $Q_r$-torsor $cal(T)_(r \, 0)$ on
    $cal(C) \( b_r \)_0$. This is ordinary nodal gluing in the equivariant chart:
    étale locally on each branch cover, the torsor is constant across the origin;
    its two constant fibers have been identified with the same $mu_(b_r)$-action.
    Glue them across $u v = 0$ and take the equivariant quotient.
    This proves étaleness at the node as well as away from it, and retains the $Q_r$-action and semilinear action.
    It is the finite-cover gluing of [22] Section 8.3, with the identification now chosen to commute with $A$.
  Proper henselian invariance lifts $cal(T)_(r \, 0)$ to a finite étale torsor $cal(T)_r$ on $cal(C) \( b_r \)$
    [23] Theorem 4.5. Full faithfulness lifts the group actions, the equivariance isomorphisms,
    and the transition maps after pullback to divisible indices. Their relations lift as well.
    Restriction to the common geometric generic curve $C$ yields a tower of finite $Q_r$-torsors and hence,
    after compatible framing, a continuous parameter with image in $"proj lim"_r Q_r = J$.
    The lifted equivariance gives the asserted action on this parameter.
  We verify density using the first component, without imposing connectedness on these $Q_r$-torsors.
    Choose a section of $cal(V) arrow.r S_(b_(*))$ through a point of $\( U_1 \)_(overline(D))$,
    base-change it to every $S_(b_r)$, and choose compatible frames of the lifted tower along these sections.
    Apply Lemma 12 over each $S_(b_r)$. The orbit of the frame under the monodromy of the punctured first
    component lies in its connected component in the whole special torsor.
    The lemma identifies that component’s section fiber with the geometric generic component’s section fiber,
    which is the generic monodromy orbit. Thus, if $H_1$ is the image of $sigma_1$ and $H_tau$ the image of $tau$
    in these compatible frames, then
  $ "im" \( H_1 arrow.r Q_r \) subset "im" \( H_tau arrow.r Q_r \) wide upright("for every ") r . $
  Both subgroups are compact and therefore closed in $J$. Since the $J_r$ are cofinal,
    these inclusions imply $H_1 subset H_tau$. Proposition 11 makes $H_1$ Zariski dense,
    and hence $tau$ is Zariski dense.
  Finally let $V$ be an algebraic representation over a finite coefficient extension and choose a $J$-stable
    lattice in $V$. Every finite reduction factors through some $Q_r$.
    Away from the node the models $cal(C) \( b_r \)$ agree with the corresponding base changes of
    $cal(C) \( b_(*) \)$. The torsor $cal(T)_r$ therefore supplies the required lisse extension on $cal(V)
    times_(S_(b_(*))) S_(b_r)$, and its special restrictions are exactly the two component torsors with their
    semilinear actions. Using this one tower for all representations supplies the tensor and morphism comparisons,
    as in Proposition 11. These are the equivariant lattice-specialization data needed for nearby cycles on the
    fixed model $cal(C) \( b_(*) \)$. ◻
]

== 5 From the separating node to an equivariant flag eigensheaf <sec:nodal>

The parameter $tau$ of Proposition 14 lives on the smooth projective generic curve $C \/
  Omega$ of the twisted degeneration. Proposition 7 therefore supplies an equivariant unramified eigencomplex.
  We now specialize this complex to the node, retain the first normalization component,
  and remove the enhancement of its flag. The two issues are nonvanishing on the prescribed node type and
  preservation of the semilinear action when passing to a perverse eigensheaf.

#thm([Proposition 5.1.])[
  #emph[Let $\( C_1 \, x_1 \) \/ D$, $sigma_1$, and $phi$ be the pointed curve, dense lifted parameter,
    and semilinear automorphism of Proposition 11. There exist an integer $m gt.eq
    1$ and a nonzero locally constructible perverse geometric $overline(bb(Q))_ell$-adic sheaf
$ M_(overline(D)) quad upright("on") quad cal(A)_1 = "Bun"_(G \, B \, x_1) \( \( C_1 \)_(overline(D)) \) $

 with a $phi^m$-structure and the full coherent Hecke eigenstructure for $sigma_1$.
   Every eigenisomorphism is compatible with this structure and with the given $phi^m$-structure on $sigma_1$.
   Moreover, $"SS" \( M_(overline(D)) \) subset Lambda_(upright("par"))$.]
] <prop:charzero-equivariant>

=== 5.1 The prescribed node type and its two flags <the-prescribed-node-type-and-its-two-flags>

Retain the fixed index $b_(*)$ and strictly dominant cocharacter $lambda$ from Section 4; thus

$ 0 < chevron.l alpha \, lambda chevron.r < b_(*) wide upright("for every positive root ") alpha . $

Put $S = S_(b_(*)) = "Spec" overline(D) \[ \[ s_(b_(*)) \] \]$.
  In the relative bundle stack of $cal(C) \( b_(*) \) \/ S$,
  remove from the closed fiber every inertia type except the conjugacy class of $lambda \|_(mu_(b_(*)))$.
  Denote the resulting open stack by $cal(B)$. The condition is open because the finitely many conjugacy classes
  of homomorphisms $mu_(b_(*)) arrow.r G$ are locally constant on the residual gerbe.
  The centralizer of the chosen type is $T$: the inequalities ensure that no root is trivial on
  $lambda \( mu_(b_(*)) \)$. The Hom-stack theorem gives algebraicity and local finite presentation [15]
  Theorem 1.2. Smoothness follows from the vanishing of $H^2$ of the adjoint bundle:
  the curve is tame, coarse pushforward is exact, and its coarse space has dimension one.
  In particular $cal(B)$ has smooth finite-type charts over $S$. Its geometric generic fiber is $"Bun"_G \( C \)$.

Let $B^(-)$ be the Borel opposite to $B$ with the same maximal torus $T$, and define

$ cal(A)_1^(+) = "Bun"_(G \, R_u \( B \) \, x_1) \( \( C_1 \)_(overline(D)) \) \, wide cal(A)_2^(+) =
  "Bun"_(G \, R_u \( B^(-) \) \, x_2) \( \( C_2 \)_(overline(D)) \) . $

An object of either stack includes an enhanced flag, that is, a reduction to the indicated unipotent radical.
  The calculation of [22] Lemma 8.2 gives

#[#set math.equation(numbering: n => "(5.1)")
 $ cal(B)_s tilde.eq \[ cal(A)_1^(+) times cal(A)_2^(+) \/ T \] \, $ <eq:nodal-type-quotient>]

where $T$ changes the two frames on the node gerbe simultaneously.
  We recall the calculation to verify its compatibility with our semilinear action and with the two different
  component curves.

On the first branch of the balanced chart, set $a = u^(b_(*))$.
  In a frame in which inertia is $lambda$, a change of frame satisfies

$ h \( zeta u \) = lambda \( zeta \) h \( u \) lambda \( zeta \)^(- 1) . $

Conjugating to the invariant punctured-disc frame gives $g \( a \) =
  lambda \( u \)^(- 1) h \( u \) lambda \( u \)$. If $j = chevron.l alpha \,
  lambda chevron.r$ for a positive root, the positive and negative root coordinates respectively transform as

#[#set math.equation(numbering: n => "(5.2)")
 $ u^j f \( u^(b_(*)) \) mapsto f \( a \) \, wide u^(b_(*) - j) g \( u^(b_(*)) \) mapsto a g \( a \) .
   $ <eq:nodal-root-coordinate>]

The toral coordinates are series in $a$. These formulas identify the full frame-change group with ${ g \( a \) in
  G \( overline(D) \[ \[ a \] \] \) : g \( 0 \) in B }$; the assertion over arbitrary test schemes follows by the
  same root-group factorization in the formal big cell. Evaluation $h mapsto
  h \( 0 \)$ becomes the torus projection of this Iwahori group.
  Fixing the gerbe frame therefore gives an enhanced $B$-flag.

On the second branch the node generator acts by $v mapsto zeta^(- 1) v$.
  Its positively oriented coordinate generator thus sees $- lambda$, so the identical calculation gives $B^(-)$.
  On both branches the fixed gerbe torsor has automorphism group $T$, expressed using the common node generator.
  Gluing the normalization bundles, with an identification on their gerbes, now gives (5.1).
  The computation is branchwise and requires no isomorphism between $C_1$ and $C_2$.

All these prescriptions use the split group, the group-scheme cocharacter $lambda$,
  and the balanced coordinates chosen over $D$. They consequently commute with $phi$,
  including its action on $mu_(b_(*))$; no individual root of unity has been declared fixed.
  Thus (5.1) is an equivariant identification. A modification away from the node preserves its gerbe frames and
  acts on the corresponding factor. This also identifies every successive and multi-leg Hecke correspondence,
  after pullback to $cal(A)_1^(+) times cal(A)_2^(+)$, with its componentwise counterpart.

=== 5.2 A criterion for nonzero nearby cycles <a-criterion-for-nonzero-nearby-cycles>

Nearby cycles can vanish for a nonzero generic complex. The input that excludes this possibility here is the
  specialization-detection theorem of [22] Theorem 4.2, with the following precise scope.

#thm([Lemma 5.2.])[
  (Specialization detection).  #emph[Let $S = "Spec" A$ be an excellent complete strictly henselian trait with
    algebraically closed residue field and $ell$ invertible. Let $cal(Y) arrow.r
    S$ be smooth and locally of finite type. Its special fiber is to be an unlevelled, ordinary Borel-level,
    or enhanced Borel-level bundle stack on a smooth projective curve, or, in characteristic zero,
    the simultaneous-torus quotient of two enhanced-level stacks.
    If the residue characteristic is positive, assume that the residue field is an algebraic closure of a finite
    field and impose the Lie-theoretic hypotheses of Lemma 6.]
  #emph[Assume that a smooth scheme $L arrow.r S$ of relative dimension one provides spherical Hecke legs and that
    $L_s$ contains a nonempty open of each special-fiber curve on which modifications are allowed.
    The bounded output maps to $cal(Y) times_S L$ must be representable and proper;
    exact-relative-position strata must be smooth over both input-and-leg and output-and-leg;
    their special fibers must have the transverse-modification geometry of [22] Proposition 3.3.
    The Satake kernel on its open stratum is constant with the relative Satake shift and twist.]
  #emph[Let $F$ be a locally bounded constructible complex on $cal(Y)_(macron(eta))$ with lisse spherical Hecke
    eigenvalues on $L_(macron(eta))$. Suppose each eigenvalue has a lisse lattice whose finite reductions extend
    lisse after finite trait extensions, compatibly with the special-fiber value, as in Proposition 5.
    If, on some smooth finite-type chart $Z arrow.r cal(Y)$, the closure of the nonzero-stalk locus of
    $F \|_(Z_(macron(eta)))$ meets $Z_s$, then $Psi F eq.not 0$.]
] <lem:specialization-detection>

Here and below $Psi$ is geometric nearby cycles, without inertia invariants.
  The closure in the lemma may be computed after descending its finitely many geometric generic components to a
  finite extension of the trait. Neither the lemma nor this interpretation requires the complex $F$ itself to
  descend. These are part of the statement and conventions of [22] Theorem 4.2.

We will produce the required meeting by extending a bundle carrying a nonzero generic stalk.
  For $G = upright("SL")_n$, the uniformization needed for this step has an elementary description.
  If $Y$ is a smooth projective connected curve over an algebraically closed field and $y in Y$,
  the complement $Y \\ { y }$ is a smooth affine curve. Its coordinate ring is a Dedekind domain.
  A rank-$n$ projective module over that ring is isomorphic to the sum of a free module of rank $n -
  1$ and its determinant. Consequently every $upright("SL")_n$-bundle is trivial on this complement.
  A free basis can be adjusted by a unit so that its determinant agrees with the given trivialization.
  This is the $upright("SL")_n$ case of the affine-curve triviality used in Drinfeld–Simpson uniformization and in
  [6] Theorem 1.1; see also [8].

In particular, any two $upright("SL")_n$-bundles on $Y$ differ by a modification at $y$.
  Each such modification lies in some finite Schubert bound.
  In a family, the bounded Hecke space with fixed reference input and fixed smooth section $y$ is proper over the
  base trait. A geometric generic modification therefore extends after a finite trait extension:
  its point first descends to a finite generic extension, and the valuative criterion then applies over the
  corresponding DVR normalization of the complete trait. The output remains unchanged near every marking or node
  disjoint from $y$.

=== 5.3 Specializing on the chosen component <specializing-on-the-chosen-component>

Apply Proposition 7 to $\( C \, tau \)$. The generic curve is smooth, projective,
  and connected of genus at least two; its polarization comes from the projective smoothing.
  Proposition 14 supplies the continuous dense parameter over a finite coefficient field and its equivariance.
  We obtain a nonzero locally bounded constructible eigencomplex $D_tau$ on $cal(B)_(macron(eta)) =
  "Bun"_G \( C \)$, with its $phi$-structure and coherent equivariant eigenmaps.

The trait $S_(b_(*))$ is excellent, complete, and strictly henselian,
  with algebraically closed characteristic-zero residue field; in particular $ell$ is invertible.
  Use $L = cal(V)$, the smooth scheme locus of $cal(C) \( b_(*) \)$, a relative curve with $L_(macron(eta)) =
  C$ and $L_s = U_(1 \, overline(D)) union.sq U_(2 \, overline(D))$.
  At these legs the bounded correspondences have the split affine Grassmannian models in smooth frame charts.
  Their output maps are representable and proper, and their exact-position maps are smooth over both
  bundle-and-leg projections. These local models have the normalized constant kernels on their open cells.
  Modifications there preserve the node type. On the special fiber (5.1), the cotangent description,
  cone dimension bound, and transverse modifications are precisely the torus-quotient case of [22] Section 3 and
  Section 8.2. The required Lie-theoretic properties hold in characteristic zero.
  Thus the geometric hypotheses of Proposition 5 and Lemma 16 hold for this family.

For their eigenvalue hypothesis, use the equivariant finite-torsor tower of Proposition 14.
  For each representation, an invariant lattice has reductions extending lisse over the smooth scheme locus after
  the extensions $S_(b_r) arrow.r S_(b_(*))$. Their specializations are the component parameter systems,
  and all tensor maps and semilinear actions are carried by the same tower. Hence

#[#set math.equation(numbering: n => "(5.3)")
 $ F_s := Psi D_tau $ <eq:nodal-nearby>]

is locally bounded constructible and carries the coherent component eigenstructure and its $phi$-action.

To prove $F_s eq.not 0$ on this particular type, first choose a point of $cal(A)_1^(+) times cal(A)_2^(+)$.
  A smooth chart of $cal(B)$ through its image, followed by henselian lifting,
  gives a reference bundle $P_0$ over $S$ with the prescribed node type.
  Lift also a point of $L_s$ to a section $y$ of $L \/ S$. Choose a bundle $P$ on $C \/
  Omega$ where $D_tau$ has nonzero stalk. Such a point exists on a finite-type chart because $D_tau$ is nonzero
  and locally bounded constructible.

The Dedekind-domain argument above identifies $P$ and $\( P_0 \)_Omega$ off $y_Omega$.
  Extend the resulting bounded modification after a finite trait extension.
  Its output lies in $cal(B)$, since its node restriction still equals that of $P_0$.
  Take a smooth finite-type chart $Z arrow.r cal(B)$ through its special value and a residue-field point of the
  chart above it. If $S'$ is the extended trait, the morphism $Z times_(cal(B)) S' arrow.r S'$ is smooth;
  henselian lifting of that point gives a section, after a further finite extension if necessary.
  Its geometric generic point has the chosen nonzero stalk.
  This section witnesses a meeting of the closure in Lemma 16 with the special fiber. Thus

#[#set math.equation(numbering: n => "(5.4)")
 $ F_s eq.not 0 quad upright("on ") \[ cal(A)_1^(+) times cal(A)_2^(+) \/ T \] . $ <eq:nodal-nonzero>]

Finite extensions in this argument only locate the closure inside the fixed geometric generic fiber;
  they impose no new descent condition on $D_tau$ or its semilinear structure. They need not carry $phi$:
  geometric nearby cycles are unchanged by this finite-trait replacement,
  and the equivariant object (5.3) was already constructed over $S$.

Ordinary pullback of $F_s$ to $cal(A)_1^(+) times cal(A)_2^(+)$ is nonzero,
  because this map is smooth and surjective. Choose a $overline(D)$-point $\( a_1 \, a_2 \)$ with nonzero stalk.
  The bundle and enhanced flag defining $a_2$ descend to a finite extension $D' \/ D$:
  they are of finite presentation and $overline(D) \/ D$ is algebraic.
  Pass to a finite normal extension containing $D'$. Since $phi$ fixes $D$,
  its action on this normal extension has finite order. Some power $phi^m$ fixes it pointwise,
  and the descended model then supplies an identification $phi^(m *) a_2 tilde.eq a_2$.
  We henceforth use this power as generator.

Restricting along $cal(A)_1^(+) times { a_2 }$ gives a nonzero locally bounded constructible complex $F_1^(+)$ on
  $cal(A)_1^(+)$, with a $phi^m$-structure. The quotient description of the Hecke correspondences and proper base
  change for each bound give

#[#set math.equation(numbering: n => "(5.5)")
 $ sans(H)_(I \, \( V_i \)) \( F_1^(+) \) tilde.eq F_1^(+) times.square times.square_(i in I) \( V_i \)_(sigma_1)
   $ <eq:nodal-enhanced-eigen>]

for every finite leg set $I$. The same comparisons apply on the successive-modification spaces and on every fusion
  diagonal. They are natural under semilinear transport, so all these eigenmaps and their coherence constraints
  are equivariant. Ordinary restriction here is sufficient; no perversity assertion is made for $F_1^(+)$.

=== 5.4 Perverse cohomology and removal of the enhancement <perverse-cohomology-and-removal-of-the-enhancement>

To pass from $F_1^(+)$ to an ordinary-level perverse eigensheaf, we will take perverse cohomology,
  push forward along the torsor that forgets the enhancement, and take perverse cohomology once more.
  The first truncation supplies nilpotent singular support, which controls monodromy along the enhancement torus.
  Unipotence of that monodromy will ensure that the direct image is nonzero;
  the second truncation then gives the required perverse object.

The geometric inputs for these steps are [22] Propositions 6.1 and 7.5.
  Their scope is a smooth projective complex curve with one marked point and a split simple simply connected
  group. Proposition 6.1 applies at either ordinary or enhanced Borel level:
  for a locally bounded constructible geometric adic complex with a coherent eigenstructure for a Zariski-dense
  parameter, every perverse cohomology inherits the full eigenstructure and nilpotent singular support,
  and some perverse cohomology is nonzero if the complex is.
  Proposition 7.5 removes the enhancement when the boundary monodromy is unipotent.
  Our group $upright("SL")_n$ meets the group assumptions, and Proposition 11 proves both density and the required
  unipotent boundary monodromy for $sigma_1$.

Choose an abstract field isomorphism $overline(D) tilde.eq bb(C)$ to apply these geometric statements.
  Such an isomorphism exists: both fields are algebraically closed of characteristic zero and have transcendence
  degree $2^(ℵ_0)$ over $bb(Q)$. We will use their Betti arguments to establish geometric properties,
  while making all sheaf operations and induced maps in the geometric adic category over $overline(D)$.

First choose $j$ such that $Q = zws^p H^j \( F_1^(+) \) eq.not 0$.
  Here is why its eigenstructure retains the semilinear action. For a finite set $I$, put $d = \| I \|$.
  The proof of [22] Proposition 6.1, Section 6.3 constructs, on the objects under consideration,
  the functorial adic comparison

#[#set math.equation(numbering: n => "(5.6)")
 $ zws^p H^j #scale(x: 120%, y: 120%)[\(] sans(H)_(I \, \( V_i \)) \( F_1^(+) \) \[ d \]
   #scale(x: 120%, y: 120%)[\)] tilde.eq sans(H)_(I \, \( V_i \)) \( zws^p H^j F_1^(+) \) \[ d \] .
   $ <eq:nodal-truncation>]

The Betti calculation proves the needed perverse bounds; the comparison itself follows from the universal property
  of the adic truncation triangles. On the eigenvalue side, put $cal(L)_I =
  times.square_(i in I) \( V_i \)_(sigma_1)$. Since this sheaf is lisse on the smooth $d$-dimensional leg space,
  exterior product with $cal(L)_I \[ d \]$ is perverse exact, so

$ zws^p H^j \( F_1^(+) times.square cal(L)_I \[ d \] \) tilde.eq Q times.square cal(L)_I \[ d \] . $

Applying these comparisons to (5.5) and canceling the common shift $\[ d \]$ gives the relative-normalized
  eigenmaps for $Q$.

For a collision $Delta : U_1^J arrow.r U_1^I$, the corresponding truncation comparison uses
  $\( upright("id") times Delta \)^(*) \[ \| J \| - \| I \| \]$ on these locally constant leg families.
  The comparisons for successive Hecke operations use the total dimension of their retained leg space,
  counting a shared leg only once. Thus (5.6) carries the entire unit, convolution, permutation,
  and fusion diagrams. Pullback by $phi^m$ preserves the perverse structure and its truncation maps,
  so these adic comparisons commute with it. No compatibility between a chosen complex realization and $phi$ is needed.

Now let

$ q : cal(A)_1^(+) arrow.r cal(A)_1 $

forget the enhancement. This is a $T$-torsor of relative dimension $r = n - 1$. Set $F = q_(!) Q$.
  We need the intermediate assertion in the proof of [22] Proposition 7.5:
  this particular direct image is nonzero. We recall its mechanism,
  since a general torus direct image does not preserve nonvanishing.

At enhanced level, a cotangent residue lies in $"Lie" B$.
  In an adapted local frame write a generically nilpotent Higgs field as $theta = b \( t \) thin d t \/ t$,
  with $b \( t \)$ regular. The positive-degree invariant polynomials vanish on $b \( t \)$ and hence on the
  residue $b \( 0 \)$; the toral projection of this residue is therefore zero.
  Thus the enhanced nilpotent cone is the smooth cotangent pullback of the ordinary-level cone and annihilates
  tangent directions to the $T$-fibers [22] Section 3.1. The microlocal criterion of [22] Lemma 7.1 now makes the
  Betti realization of $Q$ monodromic along this torsor: locally on the base it is constructible for a product
  stratification with the whole torus as second factor. In particular its cohomology sheaves on each fiber are
  local systems.

For a representation $V$, let $chi_V$ be its character on the dual torus $hat(T)$.
  The central-sheaf calculation, based on Gaitsgory’s construction [11] and proved in the needed form in [22]
  Lemma 7.4 and proof of Proposition 7.5, gives, for every $V in "Rep" \( caron(G) \)$,

#[#set math.equation(numbering: n => "(5.7)")
 $ chi_V \( upright("enhancement monodromy") \) = "Tr" \( upright("boundary monodromy on ") V_(sigma_1) \) thin
   upright("id")_Q = \( dim V \) thin upright("id")_Q . $ <eq:nodal-character>]

The last equality uses unipotence at $x_1$. On any stalk cohomology of a torsor fiber,
  the commuting monodromies have joint generalized eigencharacters,
  viewed as points of the dual torus $hat(T) \( overline(bb(Q))_ell \)$.
  Character functions of representations span the Weyl-invariant regular functions on $hat(T)$ and separate its
  Weyl orbits. Equation (5.7) therefore puts each eigencharacter in the orbit of $1$, which consists of $1$ alone.
  All enhancement monodromies on these finite-dimensional spaces are unipotent.

Choose a fiber $T = q^(- 1) \( a \)$ where $Q_T := Q \|_T$ is nonzero,
  and let $j_0$ be the largest index with $cal(H)^(j_0) \( Q_T \) eq.not 0$.
  Its fiber $W$ is a nonzero finite-dimensional representation of $Gamma =
  X_(*) \( T \)$ with commuting unipotent operators. The augmentation ideal of $overline(bb(Q))_ell \[ Gamma \]$
  acts nilpotently on this space, so the coinvariants $W_Gamma$ are nonzero. Poincaré duality gives

$ H_c^(2 r) \( T \, cal(H)^(j_0) \( Q_T \) \) tilde.eq W_Gamma \( - r \) eq.not 0 . $

In the compact-support hypercohomology spectral sequence this term has no incoming differential,
  by maximality of $j_0$, and no outgoing differential, because $H_c^i \( T \, - \) = 0$ for $i > 2 r$.
  Consequently $H_c^(2 r + j_0) \( T \, Q_T \) eq.not 0$. Comparison and base change for the adic functor $q_(!)$
  imply $F_a eq.not 0$. This argument uses a nilpotence bound only on the chosen finite-dimensional space.

The morphism $q$ has finite type and fixed relative dimension, so $F$ is locally bounded constructible.
  Away from $x_1$, Hecke modifications transport an enhanced flag as well as its ordinary flag.
  Proper base change on a bounded Hecke correspondence and the projection formula therefore give the natural comparison

#[#set math.equation(numbering: n => "(5.8)")
 $ sans(H)_(I \, \( V_i \)) \( q_(!) Q \) tilde.eq \( q times upright("id")_(U_1^I) \)_(!)
   sans(H)_(I \, \( V_i \)) \( Q \) tilde.eq q_(!) Q times.square times.square_(i in I) \( V_i \)_(sigma_1) .
   $ <eq:nodal-torus-hecke>]

These comparisons also hold on the successive and collision correspondences.
  Hence they preserve every coherence constraint. Since $q$ is defined over $D$,
  its direct image and these natural comparison maps carry the $phi^m$-structure.

Finally choose a nonzero perverse cohomology $M_(overline(D)) = zws^p H^a \( F \)$.
  Proposition 6.1 of [22] applies now at ordinary Borel level,
  and the same adic truncation argument (5.6) proves equivariance of all the induced eigenmaps.
  It also gives nilpotent singular support. At ordinary flag level this is $Lambda_(upright("par"))$.
  This completes the proof of Proposition 15.

== 6 Specialization to the finite field <sec:final>

We now have a perverse eigensheaf with an action of $phi^m$ on the lifted pointed curve over $overline(D)$.
  The arithmetic torsor tower of Proposition 11 identifies its eigenvalue after mixed-characteristic
  specialization with the original arithmetic parameter, including its Frobenius structure.

#proof[
  Take $m$ and $M_(overline(D))$ from Proposition 15. Recall that $R = W \( k \)$, $K = overline("Frac" \( R \))$,
    and $overline(D) subset K$ is preserved by $phi$. Pullback under this algebraically closed field extension gives
  $ M_K quad upright("on") quad "Bun"_(G \, B \, frak(x)) \( cal(X)_K \) . $
  It remains nonzero, locally constructible, and perverse, and inherits the $phi^m$-structure.
    These assertions are checked on finite-type smooth charts:
    extension of algebraically closed fields preserves nonzero constructible stalks, support dimensions,
    and Verdier duality, hence perversity. Base change for the bounded Hecke correspondences,
    with the tensor Satake comparison of Section 2, transports the entire eigenstructure.
    Its eigenvalue is the base change of $sigma_1$, with the action provided by the arithmetic tower.
  Consider the relative ordinary-level bundle stack
  #[#set math.equation(numbering: n => "(6.1)")
   $ cal(A) = "Bun"_(G \, B \, frak(x)) \( cal(X)_R \/ R \) \, wide L = cal(U)_R \, wide M = Psi M_K quad
     upright("on ") cal(A)_k . $ <eq:final-relative-stack>]
  We verify the hypotheses of Proposition 5 and Lemma 16 in this second family.
    The ring $R$ is an excellent complete strictly henselian DVR with algebraically closed residue field $k$,
    and $ell$ is invertible because $ell eq.not p$. The stack $cal(A)$ is smooth and locally of finite type over
    $R$: $H^2$ of the adjoint bundle vanishes on the fibers of the smooth relative curve,
    and adding a flag is a smooth $G \/ B$-fibration. The leg space $L$ is smooth of relative dimension one,
    with special fiber $U$.
  Since all legs avoid $frak(x)$, their spherical Hecke correspondences have the ordinary split affine
    Grassmannian models in frames. Bounded output maps are representable and proper,
    both exact-position maps over bundle-and-leg are smooth, and the open-stratum kernels have the fixed relative
    Satake normalization. The special-fiber cotangent and transverse-modification geometry is the ordinary
    Borel-level case of [22] Section 3. Its group hypotheses H1–H4 hold by Lemma 6, using $p > n$.
    Finally, the invariant lattices supplied by the arithmetic tower have lisse finite reductions on $cal(U)_R$,
    with their $phi$-actions. Their specializations, including all tensor maps,
    are exactly the local systems associated to $rho$. Thus all the geometric and eigenvalue hypotheses of both
    cited specialization statements hold.
  It follows that $M$ is locally constructible and perverse, and has the natural multi-leg eigenisomorphisms
  #[#set math.equation(numbering: n => "(6.2)")
   $ sans(H)_(I \, \( V_i \)) \( M \) tilde.eq M times.square
     times.square_(i in I) \( V_i \)_(rho \|_(pi_1 \( U \))) . $ <eq:final-eigen>]
  The same proposition gives a $phi^m$-structure on $M$ and equivariance of these maps.
    The special-fiber action of $phi^m$ is $q^m$-Frobenius. On the eigenvalue system its action is precisely the
    one obtained by restricting $rho$ to $pi_1 \( U_(0 \, bb(F)_(q^m)) \)$,
    because the finite torsors used for the lift descended from that arithmetic representation.
    This identifies the arithmetic eigenvalue, as well as its geometric restriction.
  We still have to prove $M eq.not 0$. Choose a $K$-point $\( P \, beta \)$ with nonzero stalk of $M_K$,
    where $beta$ is its Borel reduction at $frak(x)_K$. Use the trivial $G$-bundle on $cal(X)_R$ as reference,
    and lift a point of $U \( k \)$ to a section $y in cal(U)_R \( R \)$ by smoothness and the henselian property.
    The affine-curve argument of Section 5 trivializes $P$ off $y_K$, compatibly with its determinant.
    The resulting modification of the reference bundle lies in a finite Schubert bound,
    whose Hecke space is proper over the reference input and $y$.
    After a finite trait extension it extends to a bundle $cal(P)$ on the whole relative curve.
  The remaining datum is the flag. Its generic value $beta$ is a point of the associated flag bundle
    $cal(P) \|_(frak(x)) times^G G \/ B$ over the extended trait.
    This bundle is proper, so the valuative criterion extends $beta$ as well.
    We have thereby extended the point $\( P \, beta \)$ to a section of $cal(A)$.
    Lift this section to a smooth finite-type chart through its special value,
    using henselian lifting as in the nodal argument. The section has a nonzero generic stalk,
    so the closure of the nonzero-stalk locus on that chart meets its special fiber.
    All hypotheses having been verified above, Lemma 16 proves $M eq.not 0$.
  Apply now the field-level nilpotent-detection theorem [22] Theorem 4.1.
    For the level stacks over $k = overline(bb(F))_q$ under its Lie-theoretic hypotheses,
    it states that a locally bounded constructible complex with spherical eigenisomorphisms and lisse eigenvalues
    has singular support in the cone of generically nilpotent Higgs fields on every smooth finite-type chart.
    Here $cal(A)_k$ is the ordinary Borel-level stack, the characteristic assumptions hold,
    and (6.2) supplies those lisse eigenvalues. At an ordinary flag $beta$, the cotangent residue condition is
  $ "Res"_x theta in "Lie" R_u \( B_beta \) . $
  The cone in the detection theorem is therefore exactly $Lambda_(upright("par"))$ from Theorem 1.
    This proves $"SS" \( M \) subset Lambda_(upright("par"))$ in the stated chartwise sense.
  Equip $M$ with its $phi^m$-structure and denote the resulting Weil sheaf over $bb(F)_(q^m)$ by $M_0$.
    The split Weil Satake comparison of Section 2 identifies the transported Hecke functors with the
    relative-Satake-normalized Weil functors in the theorem. Thus (6.2) is an isomorphism of Weil sheaves for
    every finite leg set and every collection of representations.
  Every operation above transports the full eigenstructure by comparisons natural for the semilinear generator.
    These comparisons were constructed on the successive-modification correspondences and on every collision
    diagonal, with the tensor unit and permutations respected throughout.
    The resulting unit, convolution, permutation, and fusion diagrams therefore commute as Weil diagrams,
    including all iterated collisions. A structure for the group generated by Frobenius is all that is required
    for a Weil sheaf; no profinite descent assertion is used. The resulting $M_0$ has all the claimed properties. ◻
]

#heading(level: 1)[References]
#bibitem([1])[D.~Abramovich and A.~Vistoli, #emph[Compactifying the space of stable maps], J. Amer. Math. Soc.
  #strong[15] (2002), no.~1, 27--75.]
#bibitem([2])[D.~Arinkin, D.~Gaitsgory, D.~Kazhdan, S.~Raskin, N.~Rozenblyum, and Y.~Varshavsky,
  #emph[The stack of local systems with restricted variation and geometric Langlands theory with nilpotent
  singular support], arXiv:2010.01906v2, April 6, 2022.]
#bibitem([3])[O.~Barrett, #emph[The singular support of an $ell$-adic sheaf], Tunisian J. Math.
  #strong[6] (2024), no.~4, 703--734.]
#bibitem([4])[A.~Beilinson, #emph[Constructible sheaves are holonomic], Selecta Math.
  (N.S.) #strong[22] (2016), no.~4, 1797--1819.]
#bibitem([5])[A.~A.~Beilinson, J.~Bernstein, and P.~Deligne, #emph[Faisceaux pervers],
  in #emph[Analyse et topologie sur les espaces singuliers~I], Astérisque #strong[100] (1982), 5--171.]
#bibitem([6])[P.~Belkale and N.~Fakhruddin, #emph[Triviality properties of principal bundles on singular curves],
  Algebraic Geometry #strong[6] (2019), no.~2, 234--259.]
#bibitem([7])[V.~G.~Drinfeld, #emph[Two-dimensional $ell$-adic representations of the fundamental group of a curve
  over a finite field and automorphic forms on $upright(G L) \( 2 \)$], Amer. J. Math.
  #strong[105] (1983), no.~1, 85--114.]
#bibitem([8])[V.~G.~Drinfeld and C.~Simpson, #emph[$B$-structures on $G$-bundles and local triviality], Math. Res.
  Lett. #strong[2] (1995), no.~6, 823--829.]
#bibitem([9])[J.~Færgeman, #emph[Motivic realization of rigid $G$-local systems on curves and tamely ramified
  geometric Langlands], arXiv:2405.18268v2, July 28, 2024; to appear in Selecta Mathematica.]
#bibitem([10])[E.~Frenkel, D.~Gaitsgory, and K.~Vilonen, #emph[On the geometric Langlands conjecture], J. Amer.
  Math. Soc. #strong[15] (2002), no.~2, 367--417.]
#bibitem([11])[D.~Gaitsgory, #emph[Construction of central elements in the affine Hecke algebra via nearby
  cycles], Invent. Math. #strong[144] (2001), no.~2, 253--280.]
#bibitem([12])[D.~Gaitsgory, #emph[On a vanishing conjecture appearing in the geometric Langlands correspondence],
  Ann. of Math. (2) #strong[160] (2004), no.~2, 617--682.]
#bibitem([13])[D.~Gaitsgory, D.~Kazhdan, N.~Rozenblyum, and Y.~Varshavsky,
  #emph[A toy model for the Drinfeld--Lafforgue shtuka construction], arXiv:1908.05420v5, February 7, 2022.]
#bibitem([14])[D.~Gaitsgory and S.~Raskin, #emph[Geometric Langlands in positive characteristic from
  characteristic zero], arXiv:2508.02237v1, August 4, 2025.]
#bibitem([15])[J.~Hall and D.~Rydh, #emph[Coherent Tannaka duality and algebraicity of Hom-stacks],
  Algebra Number Theory #strong[13] (2019), no.~7, 1633--1675.]
#bibitem([16])[D.~Hansen and P.~Scholze, #emph[Relative perversity], Commun. Amer. Math. Soc.
  #strong[3] (2023), 631--668.]
#bibitem([17])[G.~Laumon, #emph[Correspondance de Langlands géométrique pour les corps de fonctions], Duke Math.
  J. #strong[54] (1987), no.~2, 309--359.]
#bibitem([18])[M.~Lieblich and M.~Olsson, #emph[Generators and relations for the étale fundamental group],
  Pure Appl. Math. Q. #strong[6] (2010), no.~1, 209--243.]
#bibitem([19])[I.~Mirković and K.~Vilonen, #emph[Geometric Langlands duality and representations of algebraic
  groups over commutative rings], Ann. of Math. (2) #strong[166] (2007), no.~1, 95--143;
  corrected version arXiv:math/0401222v5, February 13, 2018.]
#bibitem([20])[D.~Nadler and Z.~Yun, #emph[Automorphic gluing functor in Betti geometric Langlands],
  arXiv:2105.12318v3, June 6, 2023.]
#bibitem([21])[M.~C.~Olsson, #emph[\(Log) twisted curves], Compos. Math. #strong[143] (2007), no.~2, 476--494.]
#bibitem([22])[OpenAI, #emph[Constructible tame Hecke eigensheaves in positive characteristic],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Constructible-tame-Hecke-eigensheaves-in-positive-characteristic-October-5-2026/constructible-tame-hecke-eigensheaves-positive-characteristic.pdf")[OAI:Constructible-tame-Hecke-eigensheaves-in-positive-characteristic-October-5-2026],
  2026.]
#bibitem([23])[D.~Rydh, #emph[Compactification of stacks and extending stackiness across the boundary], preprint,
  September 16, 2014.]
