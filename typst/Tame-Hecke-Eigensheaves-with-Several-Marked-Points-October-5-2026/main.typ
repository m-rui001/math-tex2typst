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

#align(center)[#text(size: 16pt, weight: "bold")[Tame Hecke Eigensheaves with Several Marked Points]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <intro:section>

A geometric Hecke eigensheaf realizes a local system on a curve through modifications of bundles.
  At a puncture, the monodromy of the local system must be reflected in the level structure on the bundle stack.
  We construct such eigensheaves for $"SL"_n$ with Borel level at several punctures and arbitrary unipotent tame
  monodromy. The sheaves are locally constructible and perverse,
  and their eigenisomorphisms extend coherently over collisions of the modification points.

=== 1.1 The theorem <the-theorem>

Let $n gt.eq 2$, let $k = overline(bb(F))_q$ have characteristic $p > n$, and fix a prime $ell eq.not p$.
  Put $E = overline(bb(Q))_ell$. Let $X_0 \/ bb(F)_q$ be a smooth projective geometrically connected curve of
  genus $g gt.eq 2$, with distinct rational points $x_1 \, dots.h \, x_s$, where $s gt.eq 2$. Write

$ X = \( X_0 \)_k \, wide D = x_1 + dots.h.c + x_s \, wide U = X \\ \| D \| . $

Set $G = "SL"_n$ and $caron(G) = "PGL"_(n \, E)$, and let $B subset G$ be the upper-triangular Borel subgroup.
  All bundle stacks below refer to the split group over the geometric base field in use.

A parameter is a continuous homomorphism

#[#set math.equation(numbering: n => "(1.1)")
 $ rho : pi_1^(upright("et")) \( U \, macron(u) \) arrow.r "PGL"_n \( L \) \, $ <intro:parameter>]

where $L \/ bb(Q)_ell$ is finite inside $E$. We assume that its image is Zariski dense,
  that it kills wild inertia at every $x_i$, and that

#[#set math.equation(numbering: n => "(1.2)")
 $ rho \( gamma \) = exp #scale(x: 120%, y: 120%)[\(] t_(ell \, i) \( gamma \) N_i #scale(x: 120%, y: 120%)[\)]
   wide \( gamma in I_(x_i) \) . $ <intro:monodromy>]

Here $t_(ell \, i) : I_(x_i) arrow.r bb(Z)_ell$ is a chosen tame quotient and $N_i in
  frak(p g l)_n \( L \)$ is nilpotent. The exponential is the finite nilpotent exponential.
  No regularity is assumed for $N_i$; it may be zero. For $V in "Rep"_E \( caron(G) \)$,
  write $V_rho$ for the corresponding lisse $E$-sheaf on $U$.

Let

$ cal(A) = "Bun"_("SL"_n \, B \, D) \( X \) $

be the stack of $"SL"_n$-bundles $P$ together with Borel reductions $beta_i$ at the marked points.
  A geometric $E$-adic complex $M$ on $cal(A)$ is #emph[locally constructible perverse] if $f^(*)
  M \[ d \]$ is bounded constructible and perverse for every smooth finite-type chart $f : S arrow.r
  cal(A)$ of constant relative dimension $d$. This is a local condition on the stack.

The trace pairing identifies its cotangent vectors with Higgs fields

#[#set math.equation(numbering: n => "(1.3)")
 $ phi.alt in H^0 #scale(x: 120%, y: 120%)[\(] X \, "ad" \( P \) ⊗ omega_X \( D \) #scale(x: 120%, y: 120%)[\)] \,
   wide "Res"_(x_i) \( phi.alt \) in "Lie" R_u \( B_(beta_i) \) quad \( 1 lt.eq i lt.eq s \) . $ <intro:cotangent>]

Let $Lambda_D$ be the cone of these fields that are nilpotent at the generic point of $X$.
  A singular-support containment in this cone means its smooth cotangent pullback on every smooth chart.

For a finite set $I$ and representations $V_i in "Rep"_E \( caron(G) \)$,
  the functor $"Hecke"_(I \, \( V_i \))$ modifies bundles at points of $U^I$.
  We use relative Satake normalization: on a Schubert cell of dimension $d_lambda$ the kernel is
  $E \[ d_lambda \] \( d_lambda \/ 2 \)$, and there is no additional moving-leg shift.
  The conventions and collision maps are specified in Section 2.

#thm([Theorem 1.1.])[
  #emph[For every parameter (1.1) satisfying the preceding hypotheses,
    there is a nonzero locally constructible perverse geometric $E$-adic sheaf $M$ on $cal(A)$ with
$ "SS" \( M \) subset Lambda_D . $

 For every finite set $I$ and every family $\( V_i \)_(i in I)$, it has isomorphisms
#[#set math.equation(numbering: n => "(1.4)")
 $ "Hecke"_(I \, \( V_i \)) \( M \) tilde.eq M times.square #scale(x: 180%, y: 180%)[\(]
   times.square_(i in I) \( V_i \)_rho #scale(x: 180%, y: 180%)[\)] wide upright("on ") cal(A) times U^I \,
   $ <intro:eigen>]

 natural in the representations and coherent for the tensor unit, convolution, permutations,
   and fusion on every collision diagonal. These isomorphisms use the relative normalization above.]
] <intro:main>

The parameter and eigensheaf are geometric: the statement does not require a Frobenius structure.
  Local constructibility allows the cohomological bounds to depend on the finite-type chart.

=== 1.2 Context and antecedents <context-and-antecedents>

The eigensheaf problem originates in Drinfeld’s rank-two construction and Laumon’s geometric formulation for
  general linear groups [8,20]. Frenkel, Gaitsgory, and Vilonen reduced unramified $"GL"_n$ eigensheaf existence
  to a vanishing conjecture [11], which Gaitsgory subsequently proved [13].
  Geometric Satake identifies the local Hecke kernels with representations of the dual group and supplies their
  tensor and fusion structure [23]. These results established the geometric form of the passage from a prescribed
  local system to an automorphic sheaf.

Our immediate antecedent is [27] Theorem 1.1, whose main theorem has one marked point and regular-unipotent
  monodromy for a broader class of groups. Here the group is $"SL"_n$ with $p > n$,
  there are several marked points, and every nilpotent boundary logarithm is allowed.
  The two-specialization construction and the local arguments follow that companion;
  we prove the simultaneous level geometry and compatibility arguments needed for this extension.

For semisimple groups over $bb(C)$, Beilinson and Drinfeld constructed eigensheaves from opers by quantizing the
  Hitchin system [5] §0.2. The recent five-paper collaboration proves categorical forms of the unramified
  correspondence in characteristic zero [14,15]. Arinkin, Gaitsgory, Kazhdan, Raskin, Rozenblyum,
  and Varshavsky introduced the stack of local systems with restricted variation and its action on sheaves with
  nilpotent singular support [1]. Gaitsgory and Raskin use this framework to formulate the geometric adic
  correspondence and compare characteristic zero with positive characteristic [16].
  The input needed here is the characteristic-zero restricted equivalence [16] Main Theorem 1.3.9(ii),
  through the unramified eigencomplex construction of [27] Lemma 8.1.
  Thus the categorical theory enters on a smooth projective curve before level structures are introduced.

Nilpotent singular support links this input to ramification.
  The geometry of the global nilpotent cone was developed by Laumon, Faltings, and Ginzburg [21,10,17].
  Beilinson’s theory of singular support for constructible étale sheaves,
  and Barrett’s extension to adic coefficients, give the function tests used below [4,3].
  The Hecke detection argument in [1] §§20.5–20.8, Appendix H uses a cocharacter in the center of a Levi subgroup
  and an isolated cotangent intersection. The field and specialization arguments of [27] §§3–4 adapt that
  geometry. We establish the versions required for all the level stacks occurring here.
  Geometric nearby cycles and their perverse exactness rest on Hansen–Scholze and Gaitsgory–Raskin [19,16].

The characteristic-zero level arguments use Betti sheaf theory.
  Nadler and Yun prove local constancy of moving Hecke operators on the nilpotent category and construct its
  spectral action, already allowing finitely many level points [24] Theorems 6.2.2 and 6.3.7.
  Their automorphic gluing construction relates twisted nodal curves to smoothings [25];
  its description of bundle types and branch gluing is the geometric antecedent of our degeneration.
  Our proof also needs a separate nonvanishing statement for the particular nearby cycles being taken.
  At a puncture, the local spectral input comes from Gaitsgory’s central sheaves [12],
  the affine-flag equivalence of Arkhipov and Bezrukavnikov [2],
  and Dhillon and Taylor’s extension to the universal monodromic setting [6].
  The last supplies the local kernels used in the descent argument of [27] §7,
  which we globalize with all the other levels retained. Dhillon and Taylor’s sequel proves the tame local Betti
  correspondence [7].

Several-point ramification has earlier geometric realizations.
  Uit de Bos gives an explicit $"GL"_2$ correspondence for the projective line with four punctures and pure
  irreducible parameters with unipotent monodromy [31]. Shen proves a Hecke-compatible equivalence over an open
  spectral locus for parabolic $"GL"_n$ in positive characteristic, using crystalline $D$-modules [29].
  In the characteristic-zero de Rham setting, Færgeman gives a construction for irreducible regular-singular
  parameters conditional on the forthcoming factorization input and local compatibility conjecture specified in
  that work [9] Theorem 1.4.1.1, §§1.3.7, 1.4.3, Conjecture 4.2.1.
  In the cited version, regular holonomicity and generic perversity in the ramified setting are stated as
  expectations [9] Remark 1.4.1.2. The present theorem concerns geometric adic sheaves in positive characteristic
  and includes local constructibility and perversity.

=== 1.3 Proof strategy and the several-point extensions <proof-strategy-and-the-several-point-extensions>

The proof has two specializations. First we construct an eigensheaf with the prescribed level in characteristic
  zero. We then specialize it to the given curve in characteristic $p$.
  The intermediate sheaves must remain locally constructible, retain the full Hecke system, and remain nonzero.
  The last condition requires a separate argument: nearby cycles of a nonzero complex can vanish.

The first stage starts with any marked complex curve and a dense parameter with unipotent boundary monodromy.
  Take two copies of that curve and join corresponding marked points to form a nodal curve.
  A smoothing replaces all its nodes at once. On the second component,
  reverse the orientation of the underlying marked surface and transport the parameter.
  This makes the two boundary monodromies inverse at every pair of branches.
  Finite quotients of the parameter then glue at all nodes after introducing suitable cyclic stabilizers there.
  Their compatible lifts produce a dense unramified parameter on the smooth geometric generic curve,
  where the characteristic-zero existence theorem applies.

The cyclic stabilizer type of the bundles has a different role from the boundary monodromy of the parameter.
  Choosing that type inside an alcove turns the special bundle stack into a quotient of two stacks with
  #emph[enhanced flags]. An enhanced flag is a reduction to $N_B = R_u \( B \)$;
  forgetting it is a torsor under $T = B \/ N_B$. With $s$ nodes, the special stack is

$ #scale(x: 120%, y: 120%)[\[] \( cal(A)_1^(+) times cal(A)_2^(+) \) \/ T^s #scale(x: 120%, y: 120%)[\]] \, $

where the torus changes the two branch enhancements at each node simultaneously.
  All node identifications must be compatible with the same parameter tower. One second component suffices:
  the extra cycles in the dual graph give gluing choices and impose no further relation between the nodes.

After nearby cycles, pull back to the product and restrict to a fiber over the second factor.
  This gives an eigencomplex on the first enhanced stack. To pass to ordinary flags,
  we prove that its monodromies along the enhancement torus are unipotent.
  The local central-kernel trace at a puncture identifies representation characters of that torus monodromy with
  traces of the parameter’s boundary monodromy. The latter traces are $dim V$, for every $V$, under (1.2).
  Characters therefore force all enhancement eigencharacters to be trivial.
  Compactly supported cohomology along the torus is then nonzero,
  so forgetting the enhancements preserves a nonzero eigencomplex.
  This is the step where unipotence, rather than regular unipotence, is sufficient.

Two further arguments control the sheaves throughout. A local calculation with two Hecke modifications detects
  covectors outside the nilpotent cone. The same calculation, applied to cuts over a trait,
  proves that nearby cycles cannot vanish when the closure of the nonzero generic stalks meets the special fiber.
  Separately, the Betti spectral action makes fixed-point Hecke functors exact near a dense parameter:
  an equivariant frame near its free closed orbit identifies these functors with finite sums of the identity.
  Moving-leg local constancy then permits perverse cohomology while retaining every tensor and collision comparison.

To reach the given curve, lift it with its marked points over the Witt ring $W \( k \)$.
  The finite quotients of $rho$ extend over root stacks at the marked sections, whose orders are powers of $ell$.
  Proper henselian lifting gives a compatible parameter on the geometric generic curve with the same dense image
  and boundary monodromies. Apply the characteristic-zero construction to that parameter and take geometric nearby
  cycles on the ordinary Borel-level bundle stack. Proper bounded Hecke modifications make the closure of the
  nonzero generic-stalk locus meet the special fiber, allowing the detection criterion to prove nonvanishing once more.

These constructions extend the one-point argument of [27].
  The additional work is to prove the detection and perverse statements for the several-level stacks,
  to keep the other levels transported in the local central-kernel comparison,
  and to glue one compatible tower at all nodes. The detection criterion and the torus descent are stated
  separately from the final construction, so their hypotheses and their use in both specializations remain
  explicit. The nearby-cycle and unramified existence inputs are recalled with their precise scope;
  the several-point extensions are proved here.

Section 2 fixes the sheaf and Hecke conventions. Section 3 proves the cotangent and transverse-modification facts
  used in the detection theorems of Section 4. Sections 5 and 6 establish perverse cohomology and descent from
  enhanced flags. Section 7 carries out the characteristic-zero construction,
  and Section 8 specializes it to prove Theorem 1.

== 2 Level structures, sheaves, and specialization <found:section>

The construction will pass through enhanced flags and through a quotient that identifies paired enhancements on
  two marked curves. We describe these stacks first, then fix the sheaf and Hecke conventions that allow the
  resulting objects to be specialized. The nearby-cycle inputs are [27] Propositions 2.1 and 5.1;
  their hypotheses concern the local geometry at the moving legs, rather than the number of level points.

=== 2.1 The level stacks <found:level-stacks>

Let $X$ be a smooth projective connected curve over an algebraically closed field, and let $D = x_1 + dots.h.c +
  x_s$ be a reduced divisor. Write $U = X \\ \| D \|$. We use $G = upright("SL")_n$,
  the upper triangular Borel $B$, its unipotent radical $N_B$, and the diagonal torus $T = B \/ N_B$. The stacks

$ cal(A) = "Bun"_(G \, B \, D) \( X \) \, wide cal(A)^(+) = "Bun"_(G \, N_B \, D) \( X \) $

classify a $G$-bundle with, respectively, a $B$-reduction or an $N_B$-reduction at every $x_i$.
  We call the latter an enhanced flag. Forgetting the enhancements gives a representable torsor

#[#set math.equation(numbering: n => "(2.1)")
 $ q : cal(A)^(+) arrow.r cal(A) quad upright("under ") T^s . $ <found:torsor>]

Unlevelled bundles and opposite Borels are also allowed. All these stacks are smooth and locally of finite type:
  the bundle deformation obstruction lies in $H^2$ on a curve,
  and adding a reduction at a point has smooth fiber $G \/ B$ or $G \/ N_B$.

For two such pointed curves, identify the flag tori at corresponding points by fixed isomorphisms $tau_i :
  T_(1 i) tilde.eq T_(2 i)$. Put

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(B)_12 = \[ \( cal(A)_1^(+) times cal(A)_2^(+) \) \/ T_Delta^s \] \, wide T_Delta^s =
   product_(i = 1)^s { \( t \, tau_i \( t \) \) : t in T_(1 i) } . $ <found:quotient>]

The branch convention in the nodal construction will specify the $tau_i$.
  This smooth stack maps to $cal(A)_1 times cal(A)_2$ as a torsor under $\( T_1^s times T_2^s \) \/ T_Delta^s$.
  We will use this quotient in characteristic zero. Thus its objects are pairs of enhanced bundles modulo
  simultaneous changes of the two enhancements at each paired marking.

A Hecke modification in $U$ transports every level structure,
  because it identifies the bundles near all the $x_i$. On the product and the quotient,
  a leg in $U_1 union.sq U_2$ modifies the corresponding component.
  The quotient Hecke correspondence pulls back to the product correspondence when either its input or its output
  is lifted to the product. Indeed the transported enhancements provide the lift on the other side.
  This cartesian property also holds for successive modifications and their collision diagrams.

On a fixed Schubert bound, both the input-and-leg and output-and-leg maps are representable and proper.
  On an exact-position stratum they are smooth. To see that adding all the levels preserves these facts,
  choose a coordinate and a frame on the formal disc at the leg.
  The modification is a split affine-Grassmannian model there;
  the marked fibers remain in the complementary piece of the gluing.
  For a fixed bound the frame can be taken to finite jet order,
  so these descriptions are obtained by smooth covers. The same description applies to a leg in the smooth scheme
  locus of a family of twisted nodal curves. Its stacky nodes remain in the complementary piece.
  Restricting to fixed node types restricts both bounded projections by base change and hence preserves their
  properness. On a finite-type output chart a fixed bound meets only a quasi-compact part of the input stack.

=== 2.2 Local constructibility and relative Satake <local-constructibility-and-relative-satake>

Put $E = overline(bb(Q))_ell$. For a smooth stack $cal(B)$ locally of finite type,
  $D_(upright("lcc")) \( cal(B) \, E \)$ denotes the geometric adic complexes whose ordinary pullback to every
  smooth finite-type scheme chart is bounded constructible.
  Thus “lcc” means locally bounded constructible, and bounds may depend on the chart.
  An object $F$ is perverse when $f^(*) F \[ d \]$ is perverse for every smooth chart $f : S arrow.r
  cal(B)$ of constant relative dimension $d$. These conditions define a perverse $t$-structure and its truncations
  locally on the stack.

For a closed conic subset $C subset T^(*) cal(B)$, set

$ f^compose C = "image" \( S times_(cal(B)) C arrow.r T^(*) S \) . $

The assertion $"SS" \( F \) subset C$ means $"SS" \( f^(*) F \) subset f^compose C$ on every such chart.
  Here stack cotangent vectors mean degree-zero cotangent vectors,
  and singular support is the geometric adic singular support,
  with the function-test characterization of [3] §1.5, Theorem (vii). Shifts do not affect singular support.

Fix a Satake equivalence with $"Rep"_E \( caron(G) \)$, where $caron(G) = upright("PGL")_n$,
  including its fusion commutativity constraint. Write $rho_G$ for the half-sum of positive roots.
  For a dominant coweight $lambda$ its simple kernel has open-orbit restriction

#[#set math.equation(numbering: n => "(2.3)")
 $ "IC"_lambda \|_("Gr"^lambda) = E \[ d_lambda \] \( d_lambda \/ 2 \) \, wide d_lambda = chevron.l 2 rho_G \,
   lambda chevron.r . $ <found:satake-normalization>]

The integer $d_lambda$ is even: the coweight lattice of $upright("SL")_n$ is the coroot lattice,
  and $chevron.l 2 rho_G \, alpha^or chevron.r = 2$ for a simple coroot.
  Tate twists here are geometric coefficient lines; compatible trivializations may be chosen for Betti comparison.

For a finite set $I$ let $cal(H)_I$ be the moving Hecke stack, with input map $p_I$ and output-and-leg map $o_I :
  cal(H)_I arrow.r cal(B) times U^I$. The relative Satake kernel $"Sat"_I \( bold(V) \)$ for
  $bold(V) = \( V_i \)_(i in I)$ is the exterior product of the fixed-point kernels at distinct legs,
  extended by fusion at collisions. Equivalently, it is computed using successive modifications and proper
  convolution. We define

#[#set math.equation(numbering: n => "(2.4)")
 $ "Hecke"_(I \, bold(V)) \( F \) = o_(I \, *) #scale(x: 120%, y: 120%)[\(] F thin tilde(times.square) thin
   "Sat"_I \( bold(V) \) #scale(x: 120%, y: 120%)[\)] . $ <found:hecke>]

In input frames the twisted product is the ordinary exterior product; Satake equivariance supplies descent.
  The push is taken on a finite bound containing the kernel support.
  There is no moving-leg shift in (2.4); in particular $"Hecke"_(I \, \( upright(bold(1)) \)) \( F \) =
  F times.square E_(U^I)$.

#prodef([Definition 2.1.])[
  A coherent eigenstructure for a tensor local system $V mapsto L_V$ on $U$ consists of natural isomorphisms
  $ "Hecke"_(I \, bold(V)) \( F \) tilde.eq F times.square #scale(x: 180%, y: 180%)[\(] times.square_(i in I)
    L_(V_i) #scale(x: 180%, y: 180%)[\)] $
  for all finite sets and representations, compatible with the unit, successive modifications and convolution,
    permutations, and fusion. Explicitly, if $a : I arrow.r.twohead J$ and $delta_a : U^J arrow.r
    U^I$ is its collision diagonal, the fusion comparison uses ordinary pullback and identifies
  $ \( 1 times delta_a \)^(*) "Hecke"_(I \, bold(V)) \( F \) tilde.eq "Hecke"_(J \, bold(W)) \( F \) \, wide
    W_j = ⨂_(i in a^(- 1) \( j \)) V_i . $
  The eigenmaps must commute with these comparisons, including their compositions for nested collisions.
] <found:coherence>

We use this convention for products and quotients as well, allowing legs on both component curves.
  When studying perversity over $U^I$ we will insert $\[ \| I \| \]$ explicitly and subsequently remove it.

=== 2.3 Geometric nearby cycles <geometric-nearby-cycles>

Let $R$ be an excellent complete strictly henselian discrete valuation ring with algebraically closed residue
  field and with $ell$ invertible. Write $S = "Spec" R$, fix a geometric generic point $macron(eta)$,
  and write $0$ for the closed point. Geometric nearby cycles $Psi_Y : D_c^b \( Y_(macron(eta)) \, E \) arrow.r
  D_c^b \( Y_0 \, E \)$ take no inertia invariants. If descent data supply an inertia action,
  we use the underlying geometric complex.

#thm([Proposition 2.2.])[
  (Nearby-cycle input).  #emph[For finite-type $S$-schemes,
    geometric nearby cycles preserve bounded constructibility, are perverse exact,
    commute with smooth pullback and proper pushforward, and satisfy exterior-product comparison.
    They are unchanged by finite extensions of the trait inside the fixed geometric generic field.
    The same statements hold locally on the smooth stacks used here, with representable proper maps.]
  #emph[Let $Z$ be a finite-type $S$-scheme. Suppose a lisse finite-rank sheaf $L_(macron(eta))$ on
    $Z_(macron(eta))$ has a lattice over the integers of a finite extension of $bb(Q)_ell$.
    Assume that each finite reduction extends lisse over $Z$ after a finite extension of $S$,
    compatibly on further common extensions, with special reductions belonging to a fixed lisse sheaf $L_0$ on
    $Z_0$. The trait extension may depend on the reduction. Then for any map $g : Y arrow.r
    Z$ of finite-type $S$-schemes and any bounded constructible $F$ on $Y_(macron(eta))$,
#[#set math.equation(numbering: n => "(2.5)")
 $ Psi_Y F ⊗ g_0^(*) L_0 arrow.r^tilde.op Psi_Y \( F ⊗ g_(macron(eta))^(*) L_(macron(eta)) \) . $ <found:lattice>]

 This is natural in maps and tensor products of the lisse systems, and holds locally on the smooth stacks in use.]
] <found:nearby>

These are precisely the assertions of [27] Proposition 2.1.
  We recall why they apply to geometric coefficients without a common finite field of descent.
  At a fixed torsion coefficient level, each finite diagram descends after a finite trait extension.
  The comparisons are compatible with further extensions and with reduction of the coefficients.
  Passing to the adic system, then inverting the coefficient uniformizer, gives the geometric functor.
  Equivalently, over the integral closure of $R$ in its geometric generic field,
  the universally locally acyclic extension formalism gives nearby cycles by special restriction;
  see [19] Theorems 4.1 and 6.7. Smooth descent gives the stack assertions,
  including perversity with the chart shift $\[ d \]$. For (2.5),
  apply the lisse tensor formula to each extended finite reduction and pass to the limit.
  This permits arbitrary $g$: it is the lisseness of the factor,
  rather than a base-change claim for $Psi$ along $g$, that is used.
  No single finite extension is required for the entire lattice tower.

All these comparisons use the natural pull, tensor, and proper-push exchange maps.
  They respect composition, tensor associativity, projection formula, and proper base change.
  We will also use the constant-family property: a complex pulled back from a fixed geometric fiber has zero
  vanishing cycles in a smooth constant family.

#thm([Proposition 2.3.])[
  (Specialization of eigenstructures).  #emph[Let $cal(B) \/ S$ be smooth and locally of finite type,
    and let $cal(U) \/ S$ be a smooth curve of allowed legs. Assume the split spherical disc models,
    proper bounds, and smooth exact-position maps described in Section 2.1. Then there are natural comparisons
$ "Hecke"_(I \, bold(V))^0 \( Psi F \) arrow.r^tilde.op Psi_(cal(B) times_S cal(U)^I)
  "Hecke"_(I \, bold(V))^(macron(eta)) \( F \) wide \( F in D_(upright("lcc")) \( cal(B)_(macron(eta)) \, E \) \) \, $

 compatible with the entire relative Hecke system of Definition 2.
   Consequently, if $F$ has a coherent lisse eigenvalue whose lattices satisfy Proposition 3 compatibly as a
   tensor system, $Psi F$ has the specialized coherent eigenvalue.]
] <found:hecke-specialization>

#proof[
  This is [27] Proposition 5.1; we explain the local hypothesis and the collision assertion needed here.
    In a coordinate-and-input-frame cover a bounded step is a product with a split Schubert model.
    For an arbitrary preceding space $Y$ and a complex $K$ on it,
    the comparison for the next twisted product is therefore the exterior-product map
  $ Psi_Y K times.square Psi_("Gr") "Sat" \( V \) arrow.r^tilde.op
    Psi_(Y times_S "Gr") \( K times.square "Sat" \( V \) \) . $
  The first factor need not be smooth. The specialized Grassmannian kernel is the Satake kernel with the same
    label and normalization; [27] Lemma 5.3 fixes a single tensor identification for these kernels.
    Frame descent and proper push give the one-step comparison.
  For successive steps, take $Y$ to retain the preceding modifications and all leg parameters.
    The same calculation is valid after setting any collection of legs equal.
    Proper convolution then gives the fused comparison, and naturality of the exchange maps identifies it with the
    comparison obtained by successive pushes. Thus the diagonal exchange,
    which need not be invertible on arbitrary sheaves, is invertible on these Hecke constructions and respects
    nested diagonals. Permutations are the fusion symmetry of the kernels,
    and the identity-modification kernel gives the unit. Transported levels at all marked points,
    and node types away from the disc, change none of these frame calculations.
    This verifies the application of the cited proposition to every stack and family used here.
    Finally (2.5) identifies the specialization of the eigenvalue side, naturally in all its tensor maps,
    and hence specializes the coherence diagrams themselves. ◻
]

=== 2.4 Betti comparison <found:betti>

Over $bb(C)$ we use the realization of geometric adic constructible complexes as algebraically constructible
  complexes of ordinary $E$-vector spaces on the analytic space.
  For a lisse sheaf it restricts its continuous monodromy to topological loops.
  On finite-type charts it is conservative, preserves perversity, and commutes with the pullbacks,
  tensor products, and finite-type pushes used below. It also identifies algebraic singular support with the
  complex conic analytic singular support, as seen from comparison of vanishing-cycle tests.
  These conventions and their passage to smooth stacks are those of [27] §2.4; see also [16] §2.2.1.

We use Betti results to verify properties of already constructed adic objects and adic comparison maps.
  In particular, Betti perversity bounds will justify adic truncation comparisons.
  The infinite-rank universal monodromic kernels used in the torus argument stay on the Betti side.
  Every object subsequently specialized is geometric adic and lcc.

== 3 Nilpotent covectors and transverse Hecke modifications <geom:section>

The sheaf-theoretic detection argument needs two geometric inputs:
  a dimension bound for the nilpotent cotangent cone and a transverse Hecke modification for every covector
  outside it. We prove these for all the level stacks of Section 2.1.
  Throughout this section the ground field $𝕜$ is algebraically closed of characteristic zero or of characteristic
  $p > n$; the product and quotient stacks are needed only in characteristic zero.
  Put $frak(g) = "Lie" G$, and write $frak(m) = "Lie" M$ for a Levi subgroup $M$.

=== 3.1 The matrix hypotheses and the cotangent cone <the-matrix-hypotheses-and-the-cotangent-cone>

The trace form $kappa \( a \, b \) = "tr" \( a b \)$ is nondegenerate on $frak(s l)_n$, since $n$ is invertible.
  We record the other Lie algebra facts that underlie [27] §3,
  with the characteristic hypotheses checked for our group.
  A Levi has block sizes $d_1 \, dots.h \, d_r$ with sum $n$.
  Its Lie center consists of block scalars $\( c_i \)$ with $sum_i d_i c_i = 0$.
  The trace form there is the restriction of $sum_i d_i c_i c'_i$.
  Each $d_i$ and $n$ is invertible, so this restriction is nondegenerate:
  its orthogonal complement in the block scalar space is the line $\( 1 \, dots.h \, 1 \)$, whose norm is $n$.

Chevalley restriction for such a Levi follows from the characteristic polynomials of the blocks.
  The Levi Weyl group has order $product_i d_i !$ invertible in the field,
  so restriction to the trace-zero hyperplane commutes with taking invariants.
  Symmetric polynomials in the block eigenvalues give all invariants there;
  injectivity follows from the density of matrices with distinct eigenvalues within the blocks.
  Conjugators may be chosen with determinant one by adjusting a diagonal centralizer element.
  The scheme centralizer of a semisimple matrix is the corresponding block Levi.
  Finally, matrix nilpotence agrees with the zero fiber of these invariants,
  and every nilpotent matrix over #emph[any] field extension has a rational full flag on which it is strictly
  triangular. Such a flag is obtained successively from nonzero vectors in the kernel and the induced nilpotent
  operator on the quotient. These verify the four group hypotheses used in [27] §§1 and 3,
  without extending the field to find a nilpotent flag.

Let $P$ be a bundle with reductions $H_i$ at $x_i$, where each $H_i$ is a Borel or its unipotent radical.
  Its deformation bundle is

$ cal(E)_H = ker ("ad" \( P \) arrow.r xor.big_i "ad" \( P \)_(x_i) \/ frak(h)_i) \, wide frak(h)_i = "Lie" H_i . $

Infinitesimal automorphisms and deformations are $H^0 \( cal(E)_H \)$ and $H^1 \( cal(E)_H \)$.
  Serre duality identifies degree-zero cotangent vectors with Higgs fields

#[#set math.equation(numbering: n => "(3.1)")
 $ phi.alt in H^0 \( X \, "ad" \( P \) ⊗ omega_X \( D \) \) \, wide
   "Res"_(x_i) phi.alt in frak(h)_i^perp . $ <geom:residues>]

The trace form gives $frak(b)_i^perp = "Lie" N_(B_i)$ and $\( "Lie" N_(B_i) \)^perp = frak(b)_i$.
  Thus ordinary flags impose nilradical residues, whereas enhanced flags impose Borel-valued residues.
  For unlevelled bundles the fields are regular.

On $cal(B)_12$ a cotangent vector pulls back to a pair of enhanced-level fields that annihilates the diagonal
  torus action. Pairing a covector with an infinitesimal change of enhancement is pairing with the toral part of
  its residue. The two branch contributions are added with the signs fixed by the identifications $tau_i$ in (2.2).

#prodef([Definition 3.1.])[
  For any of these stacks $cal(B)$, let $Lambda subset T^(*)
    cal(B)$ be the cone of Higgs fields generically nilpotent on each component curve in its presentation.
    For a smooth chart $f : S arrow.r cal(B)$, write $Lambda_S = f^compose Lambda$.
] <geom:cone>

The cone is closed, since the nonleading coefficients of the characteristic polynomial are global sections whose
  vanishing is exactly generic nilpotence. Its enhanced-level residues have zero toral part.
  Indeed, writing $phi.alt = b \( t \) thin d t \/ t$ at a marked point,
  the characteristic coefficients of $b \( t \)$ vanish and hence those of $b \( 0 \)$ vanish.
  A nilpotent upper triangular matrix has zero diagonal. Consequently the enhanced cone is precisely the smooth
  cotangent pullback of the ordinary cone under $q$. Likewise,
  the cone on $cal(B)_12$ is the smooth cotangent pullback from $cal(A)_1 times cal(A)_2$.
  All toral residues vanish already, so the quotient imposes no additional condition on this cone.

#thm([Proposition 3.2.])[
  #emph[For a smooth finite-type chart $S arrow.r cal(B)$ of pure dimension $d$,
$ dim Lambda_S lt.eq d . $

 In characteristic zero the cone is isotropic: the symplectic form vanishes on the smooth locus of every reduced
   subvariety of $Lambda_S$.]
] <geom:dimension>

#proof[
  We adapt the rational-reduction proof of [27] Proposition 3.1 to all the marked flags.
    This is the parabolic form of Ginzburg’s isotropy argument [17] Lemma 7;
    compare the separable-lifting criterion and its bundle-stack application in [1] Appendix D.1.5 and D.1.8.
    For $upright("SL")_n$ the required flag is already rational.
    First take ordinary flags, and let $Z$ be a reduced irreducible component of $Lambda_S$,
    with function field $F$. Its generic point supplies $\( P \, \( beta_i \) \, phi.alt \)$ on $X_F$,
    together with its lift to $S$. Over $F \( X \)$, choose a rational full flag in the underlying rank-$n$ vector
    space that makes the nilpotent field strictly triangular.
    Properness of the associated flag bundle extends this Borel reduction to the whole smooth curve $X_F$.
    Denote it by $Q$. Its nilradical bundle is a subbundle of $"ad" \( P \)$, so generic containment extends to
  $ phi.alt in H^0 #scale(x: 120%, y: 120%)[\(] X_F \, \( Q times^B "Lie" N_B \) ⊗ omega_(X_F) \( D \)
    #scale(x: 120%, y: 120%)[\)] . $
  No separable or inseparable extension of $F$ has been used.
  For each $i$, fix the relative position of $Q_(x_i)$ and $beta_i$.
    Let $cal(Y)$ classify a global Borel reduction and flags with these prescribed relative positions.
    This is a smooth stack: $"Bun"_B$ is smooth by the vanishing of curve $H^2$,
    and its added fibers are products of Borel orbits in $G \/ B$.
    These orbits are smooth, since intersections of two Borels have their smooth torus-and-root-group description.
    Its deformation bundle consists of sections of $"ad" \( Q \)$ whose values at $x_i$ lie in $"Lie" Q_(x_i) ∩
    frak(b)_(beta_i)$.
  The pullback of $phi.alt$ as a covector on $cal(Y)$ is zero.
    Its pairing with this deformation bundle has no pole at any $x_i$ by the original residue conditions.
    Generically the pairing is zero because the nilradical annihilates the Borel Lie algebra under the trace form.
    It is therefore zero everywhere, and Serre duality gives the asserted vanishing on deformations.
  Spread the reduction and the fixed positions to a dense open of $Z$, then restrict to its smooth locus.
    The canonical one-form on $T^(*) S$ vanishes on this open:
    it evaluates $phi.alt$ on the induced bundle deformation, which factors through $cal(Y)$.
    Directions relative to $cal(B)$ are also annihilated, since the chart covector comes from $T^(*) cal(B)$.
    Its exterior differential, the symplectic form, vanishes there as well.
    An isotropic subspace in a $2 d$-dimensional symplectic space has dimension at most $d$, proving the bound.
    The unlevelled case is the same proof with the conditions at the $x_i$ omitted.
  Products preserve the bound. A smooth cotangent pullback adds the relative dimension of the smooth map to the
    dimension of the cone; its canonical one-form is the pullback of the original one.
    The cone descriptions above therefore give the enhanced and quotient cases.
    In characteristic zero the rational-flag argument may start with any reduced irreducible subvariety of
    $Lambda_S$, giving the stated isotropy on its smooth locus. ◻
]

=== 3.2 A detecting cocharacter <a-detecting-cocharacter>

A nonnilpotent field can be detected by moving a modification defined by an integral cocharacter.
  The next matrix argument is the $upright("SL")_n$ form of [27] Lemma 3.2.

#thm([Lemma 3.3.])[
  #emph[If $a \( t \) in frak(s l)_n \[ \[ t \] \]$ and $a \( 0 \)$ is not nilpotent, then,
    after a change of formal $upright("SL")_n$-frame, there are a block Levi $M$ and a cocharacter $lambda :
    bb(G)_m arrow.r Z \( M \)$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ a \( t \) in frak(m) \[ \[ t \] \] \, wide "ad" \( a \( 0 \) \) \|_(frak(g) \/ frak(m))
   upright(" is invertible") \, wide kappa \( a \( 0 \) \, d lambda \) eq.not 0 . $ <geom:normal-form>]

]
] <geom:cocharacter>

#proof[
  Write $a \( 0 \) = s + v$ for its commuting semisimple and nilpotent parts.
    Both have trace zero, and $s eq.not 0$. Diagonalize $s$ and let $M$ be its block centralizer.
    On the off-block matrices $"ad" \( s \)$ is invertible, whereas $"ad" \( v \)$ is nilpotent and commutes with
    it. Their sum is therefore invertible there.
  For block sizes $d_i$, the differentials of central cocharacters span $frak(z) \( frak(m) \) = { \( c_i \) :
    sum d_i c_i = 0 }$. Explicitly, the integer vectors having entries $d_j \, - d_i$ in positions $i \,
    j$ and zero elsewhere lie in the cocharacter lattice, and span this hyperplane over the ground field because
    the $d_i$ are invertible. The trace form on the center is nondegenerate, as checked above,
    and $v$ is orthogonal to all block scalars. Some integral central cocharacter thus has
    $kappa \( a \( 0 \) \, d lambda \) = kappa \( s \, d lambda \) eq.not 0$.
  Finally remove the off-block coefficient of $t^r$ inductively for $r gt.eq 1$.
    Conjugation by an element congruent to $1 + t^r Y$ modulo $t^(r + 1)$ changes that coefficient by
    $\[ Y \, a \( 0 \) \]$. The invertibility on off-block matrices supplies $Y$,
    and smoothness of $upright("SL")_n$ supplies a group element with this first-order value.
    The successive changes converge in $upright("SL")_n \[ \[ t \] \]$,
    giving the first assertion of (3.2) without changing the constant term. ◻
]

=== 3.3 The two nondegenerate zeros <the-two-nondegenerate-zeros>

Let $H$ be an exact-position Hecke correspondence, with maps

$ p : H arrow.r cal(B) \, quad o : H arrow.r cal(B) \, quad l : H arrow.r U \, wide tilde(p) = \( p \, l \) \,
  quad q_H = \( o \, l \) . $

The symbols $p \, o$ mean input and output. On a product or quotient, $U$ here denotes $U_1 union.sq U_2$.
  For relative position $lambda^(+)$, both $tilde(p)$ and $q_H$ are smooth of relative dimension $m =
  chevron.l 2 rho_G \, lambda^(+) chevron.r$.

#thm([Proposition 3.4.])[
  #emph[For a geometric covector $A in T_b^(*) cal(B) \\ Lambda$, there are an allowed leg $y$, such an $H$,
    a point $h$ with $p \( h \) = b$ and $l \( h \) = y$, a covector $A' in T_(o \( h \))^(*) cal(B)$,
    and $0 eq.not xi in T_y^(*) U$ with
#[#set math.equation(numbering: n => "(3.3)")
 $ p^(*) A = q_H^(*) \( A' \, xi \) quad upright("at ") h . $ <geom:identity>]

 The following sections have nondegenerate zeros at $h$:]
  + #emph[on $H_(upright("in")) = tilde(p)^(- 1) \( b \, y \)$,
    the restriction of $p^(*) A$ to the $q_H$-vertical tangent bundle;]
  + #emph[on $H_(upright("out")) = q_H^(- 1) \( o \( h \) \, y \)$,
    the restriction of $o^(*) A'$ to the $tilde(p)$-vertical tangent bundle.]
  #emph[Each restriction is a section of the dual of the indicated vertical tangent bundle.
    The fibers include the identifications of the fixed bundles;
    these fibers and the vertical tangent bundles have dimension and rank $m$, respectively.
    The point $y$ can be chosen in any prescribed nonempty open of a component on which $A$ is not generically
    nilpotent.]
] <geom:transverse>

#proof[
  We give the local calculation of [27] Proposition 3.3 and explain its compatibility with all the levels.
    Choose $y$ away from every marking where the field representing $A$ is nonnilpotent.
    Write it as $a \( t \) thin d t$ in a formal frame. Apply Lemma 7 and modify by $lambda \( t \)$,
    with adjoint lattices
  $ L = frak(g) \[ \[ t \] \] \, wide L' = "Ad" \( lambda \( t \) \) L \, wide J = L ∩ L' . $
  As $a \( t \) in frak(m) \[ \[ t \] \]$ and $lambda$ centralizes $M$, this field is regular in both lattices.
    It extends to an output field $A'$ with the same residues at all marked points.
  The two fixed-side tangent spaces and their residue pairing are
  #[#set math.equation(numbering: n => "(3.4)")
   $ T_h H_(upright("in")) = L \/ J \, wide T_h H_(upright("out")) = L' \/ J \,
     wide \( D \, C \) mapsto "Res" kappa \( D \, C \) thin d t . $ <geom:tangents>]
  Indeed input disc gauge transformations move $L'$, output disc gauge transformations move $L$,
    and their common stabilizer has Lie algebra $J$. For the integer weight decomposition $frak(g) =
    xor.big_j frak(g)_j$ of $lambda$, these quotients are
  #[#set math.equation(numbering: n => "(3.5)")
   $ L \/ J = xor.big_(j > 0) frak(g)_j ⊗ 𝕜 \[ \[ t \] \] \/ \( t^j \) \, wide L' \/ J =
     xor.big_(j < 0) frak(g)_j ⊗ t^j 𝕜 \[ \[ t \] \] \/ 𝕜 \[ \[ t \] \] . $ <geom:truncations>]
  Opposite weights pair perfectly, and $t^i$ pairs with $t^(- 1 - i)$. Thus (3.4) is a perfect pairing.
  Holding output and leg fixed, a vector $C in L'$ changes the input by its principal part.
    Its pairing with $p^(*) A$ is $"Res" kappa \( a \( t \) \, C \) thin d t = 0$, because $a \( t \) \,
    C in L'$ and $L'$ is its own annihilator under residue. The smooth cotangent sequence for $q_H$ now says that
    $p^(*) A$ descends to output bundle times leg. Its bundle component is $A'$:
    principal-part deformations supported away from $y$ and the markings test this assertion where the bundles are
    identified. They span the deformation space, since adding a sufficiently large pole divisor there kills $H^1$
    of the deformation bundle. For the leg component replace $t$ by $t - z$ while holding output fixed.
    The logarithmic derivative of the transition $lambda \( t - z \)$ is $- d lambda \/ t$.
    Serre duality therefore gives
  $ xi = plus.minus kappa \( a \( 0 \) \, d lambda \) thin d z eq.not 0 \, $
  where the common sign depends only on the gluing convention. This proves (3.3).
    It also shows that the second section vanishes at $h$, since on $tilde(p)$-vertical vectors both $p^(*)
    A$ and the leg differential vanish.
  To compute the derivative of the first section, move the output lattice in the input fiber in direction $D in
    L \/ J$ and transport a $q_H$-vertical test vector $C in L' \/ J$ with it. Differentiation gives, up to sign,
  #[#set math.equation(numbering: n => "(3.6)")
   $ "Res" kappa \( a \( t \) \, \[ D \, C \] \) thin d t = "Res" kappa \( \[ a \( t \) \, D \] \, C \) thin d t .
     $ <geom:hessian>]
  This is independent of the lifts: $"ad" \( a \( t \) \)$ preserves $L \, L'$ and $J$.
    It preserves every $lambda$-weight summand, and on each nonzero weight its constant term is invertible by
    (3.2). It is consequently invertible on the truncated modules in (3.5).
    The perfect pairing (3.4) shows that (3.6) is perfect. It is exactly the derivative of the section at its
    zero. For the second section, hold the output fixed and move $L$ by $C in L' \/ J$.
    The calculation exchanges $C$ and $D$, giving the transpose of the same perfect pairing, up to sign.
    Both zeros are therefore nondegenerate and isolated. Only integer truncation lengths occur;
    no cocharacter weight is inverted in the ground field.
  Every calculation was made at $y$. Away from $y$ all the flags and their residue conditions are unchanged,
    so the proof applies with any number of ordinary or enhanced levels. On a product it acts in one factor.
    On the quotient it descends from that calculation: unchanged residues preserve annihilation of the diagonal
    torus, and the Hecke correspondence is obtained by the smooth quotient base change of Section 2.1. ◻
]

The two zeros serve different purposes below. The zero on the output fiber isolates a contribution to the proper
  Hecke push, while the zero on the input fiber gives coordinates for the split quadratic equation that recovers
  the original vanishing-cycle test.

== 4 Detection by Hecke modifications <det:section>

We use the geometry of Section 3 to prove two detection statements.
  Over a field, the moving Hecke eigenrelations exclude every nonnilpotent direction from singular support.
  Over a trait, they prevent nearby cycles from vanishing when the generic support approaches the special fiber.
  The second assertion will preserve nonzero objects through both of the degenerations in the construction.

The argument adapts [27] Theorems 4.1–4.2 and Lemmas 4.3–4.4 to several ordinary or enhanced flags,
  their products, and their simultaneous torus quotient. We reproduce the common local argument:
  one transverse Hecke modification isolates a stalk in a proper pushforward,
  while a second use of the modification recovers the original cut from an exact split quadratic equation.
  The moving-leg microlocal method is related to [1] Sections 20.5–20.8 and Appendix H;
  here the precise two-fiber input is Proposition 8.

Write $cal(B)$ for one of the stacks of Section 2.1, and $Lambda subset T^(*)
  cal(B)$ for the generically nilpotent cone of Section 3. For a smooth scheme chart $b : S arrow.r cal(B)$,
  write $Lambda_S = b^compose Lambda subset T^(*) S$. Products and quotients have Hecke modifications on both open
  curves. Throughout this section the base fields and characteristics are those of Section 3.

#thm([Theorem 4.1.])[
  (Field detection).  #emph[Let $F in D_(upright("lcc")) \( cal(B) \)$ be a Hecke eigencomplex with lisse
    eigenvalues. In the product and quotient cases assume the eigenrelations on both open curves.
    Then, for every smooth finite-type chart $b : S arrow.r cal(B)$,
$ "SS" \( b^(*) F \) subset Lambda_S . $

 For this conclusion it is enough to have the individual one-leg isomorphisms $"Hecke"_V \( F \) tilde.eq F
   times.square cal(V)_V$ for all Satake representations $V$, with each $cal(V)_V$ lisse;
   their coherence is not needed in this section.]
] <det:field>

For the second statement let $R$ be an excellent complete strictly henselian discrete valuation ring with
  algebraically closed residue field and $ell$ invertible. Put $S_0 = "Spec" R$, with special point $s$,
  generic point $eta$, and a fixed geometric generic point $macron(eta)$.
  Let $cal(B) arrow.r S_0$ be smooth and locally of finite type, with special fiber one of the preceding stacks.
  Assume a smooth relative curve of legs $L arrow.r S_0$ whose special fiber contains a nonempty open in each
  curve on which modifications are allowed. The bounded Hecke maps over input-and-leg and output-and-leg are
  representable and proper; the exact-position maps are smooth,
  have the geometry of Proposition 8 on the special fiber, and carry the standard open-stratum restriction of the
  Satake kernel. We use the scheme or algebraic-space correspondence charts and split Schubert local models
  described in Section 2.

#thm([Theorem 4.2.])[
  (Specialization detection).  #emph[In this relative setup,
    let $F in D_(upright("lcc")) \( cal(B)_(macron(eta)) \)$ be a Hecke eigencomplex with lisse eigenvalues on
    $L_(macron(eta))$ satisfying the lattice specialization condition of Proposition 3.
    If $Psi F = 0$, then on every smooth finite-type chart $D arrow.r
    cal(B)$ the closure of the generic nonzero-stalk locus of $F \|_(D_(macron(eta)))$ does not meet $D_s$.]
] <det:specialization>

The closure in this statement can be computed after descending its finitely many geometric generic components to a
  finite extension of $R$. It does not require a field of definition for $F$ itself.
  All extensions below are taken inside the fixed geometric generic field.
  Nearby cycles always mean geometric nearby cycles, without inertia invariants.
  For a relative chart $D arrow.r cal(B)$, the notation $Lambda_D$ below means the smooth cotangent pullback of
  the special-fiber cone to $T^(*) D_s$.

=== 4.1 A hypersurface cut and two Hecke modifications <a-hypersurface-cut-and-two-hecke-modifications>

The common step in the two theorems is a calculation for one hypersurface.
  We keep the two coefficient complexes distinct. In the #emph[field case],
  let $F$ satisfy the hypotheses of Theorem 9, take a smooth chart $b : D arrow.r cal(B)$, a closed point $d$,
  and a regular function $f$ near $d$ with $f \( d \) = 0$, and put $K = b^(*) F$.
  Here $L$ is the open curve of allowed legs, or the disjoint union of the two open curves in the product and
  quotient cases. In the #emph[trait case], let $F$ satisfy the hypotheses of Theorem 10 and assume $Psi F = 0$.
  Take a smooth chart $b : D arrow.r cal(B)$ over $S_0$, a closed point $d in D_s$,
  and a regular function $f$ with $f \( d \) = 0$; put $K = b_(macron(eta))^(*) F$.
  Thus $K$ is defined on $D$ in the field case and only on $D_(macron(eta))$ in the trait case.

#thm([Lemma 4.3.])[
  (Hypersurface calculation).  #emph[If the differential $d f_d$ in the field case,
    respectively its relative special-fiber differential in the trait case, lies outside $Lambda_D$, then
$ \( Phi_f K \)_d = 0 quad upright("in the field case") \, wide
  #scale(x: 120%, y: 120%)[\(] Psi \( K \|_({ f = 0 }_(macron(eta))) \) #scale(x: 120%, y: 120%)[\)]_d = 0 quad
  upright("in the trait case") . $

 Here $Phi_f$ is the unshifted cone from restriction to geometric nearby cycles for $f$.]
] <det:cut>

#proof[
  The Hecke eigenrelation first gives a vanishing after proper pushforward.
    The two nondegenerate zeros of Proposition 8 then have different roles:
    one isolates a single stalk in that pushforward, and the other gives local coordinates in which the equation
    is the original hypersurface equation plus a split quadratic form.
    A projective compactification will recover the cycles of the original hypersurface from those of the stabilized one.
  #emph[1. The modified hypersurface and the eigenrelation.] If $d
    f_d$ is nonzero on the tangent space relative to $b$, the map $\( b \, f \) : D arrow.r cal(B) times
    bb(A)^1$ is smooth near $d$ in the field case, and ${ f = 0 } arrow.r
    cal(B)$ is smooth near $d$ in the trait case. Smooth base change proves the assertion.
    We may therefore assume $d f_d = b^(*) A$ for a covector $A in.not Lambda$ at $b \( d \)$.
  Choose the modification $h$ supplied by Proposition 8, at a leg $y$.
    Write $H$ for its exact-position Hecke stratum, with leg map $l : H arrow.r L$, and write
  $ p : H arrow.r cal(B) \, wide o : H arrow.r cal(B) \, wide q_H = \( o \, l \) : H arrow.r cal(B) times L \,
    wide tilde(p) = \( p \, l \) . $
  Both $q_H$ and $tilde(p)$ are smooth of relative dimension $m$. At $h$ the proposition gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ p^(*) A = q_H^(*) \( A' \, xi \) \, wide xi eq.not 0 . $ <det:eq-leg>]
  Use the two fibers named in that proposition:
  $ H_(upright("in")) = tilde(p)^(- 1) \( b \( d \) \, y \) \, wide H_(upright("out")) =
    q_H^(- 1) \( o \( h \) \, y \) . $
  On $H_(upright("in"))$, the restriction of $p^(*) A$ to the $q_H$-relative tangent has a nondegenerate zero at
    $h$; on $H_(upright("out"))$, the restriction of $o^(*) A'$ to the $tilde(p)$-relative tangent does too.
    Each fiber retains the identification with its fixed-side bundle.
  In the trait case these are special-fiber statements; take the corresponding relative Hecke stratum over $S_0$.
    In the field case introduce the completed local trait $S_0$ at $0$ in the function line, with parameter $z$,
    extend all spaces constantly, and impose $f = z$. We will apply vanishing cycles over this trait.
    Thus the two cases have a common notation: $e = 0$ in the trait case and $e = z$ in the field case,
    and the operation to be computed is, respectively, $Psi$ and $Phi$.
  Take two copies $H_1 \, H_2$ of $H$ and form
  #[#set math.equation(numbering: n => "(4.2)")
   $ W_0 = H_2 times_(p \, cal(B)) D \, wide P = H_1 times_(q_H \, cal(B) times L \, q_H) W_0 . $ <det:eq-double>]
  Thus the two modifications have the same output bundle and leg,
    while the input of the second lies in the chart $D$; Figure 1 records these two different roles.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$D$])
  content((3, 0), [$W_0$])
  content((3, 1.8), [$P$])
  content((6.2, 1.8), [$H_1$])
  content((6.2, 0), [$cal(B) times L$])
  content((9, 1.8), [$cal(B)$])
  line((3.266, 1.8), (5.873, 1.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.6, 1.8), [$"pr"_1$], anchor: "south", padding: 0.1176cm)
  line((3, 1.555), (3, 0.2716), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3, 0.9), [$"pr"_2$], anchor: "east", padding: 0.1176cm)
  line((6.2, 1.528), (6.2, 0.2597), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.2, 0.9), [$q_(H,1)$], anchor: "west", padding: 0.1176cm)
  line((3.327, 0), (5.564, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.6, 0), [$q_(H,2)$], anchor: "north", padding: 0.1176cm)
  line((2.673, 0), (0.2657, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.5, 0), [second input], anchor: "north", padding: 0.1176cm)
  line((6.527, 1.8), (8.62, 1.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.6, 1.8), [$p_1$], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: The cartesian square of two modifications with a common output and leg. The cut is imposed through the left-hand map to $D$; the coefficient is pulled from the first input at the upper right. The diagonal section $W_0 arrow.r P$ makes the two modifications equal. ],
  ) <det:figure>
  Let $c : P arrow.r D$ be the projection through $W_0$. Set $W = { f = e } subset W_0$ and $P_c = { f \( c \) =
    e } subset P$. The distinguished points are $w = \( h \, d \)$ in $W_s$ and $a = \( h \, h \, d \)$ in
    $\( P_c \)_s$. Products here are over the trait when one is present.
  The output-bundle map $W arrow.r cal(B)$ is smooth near $w$.
    Indeed, $W_0 arrow.r cal(B) times L$ is smooth, and (4.1) says that the cut differential,
    on directions relative to the output bundle, has the nonzero leg component $xi$.
    The eigenisomorphism therefore implies that the cycles of the pulled-back Hecke transform vanish at $w$.
    In the trait case this is smooth base change from $Psi F = 0$, followed by the lisse tensor compatibility.
    In the field case $W arrow.r cal(B)_(S_0)$ is smooth over the function trait,
    where $cal(B)_(S_0)$ is the constant stack. Pullback of the constant family with coefficient $F$ therefore has
    zero vanishing cycles, and tensoring by the lisse eigenvalue preserves this assertion.
    Only the smooth map to the bundle stack enters this argument.
  #emph[2. Isolating one stalk in the proper pushforward.] Replace $H_1$ by its Schubert bound $overline(H)_1$ and
    let $"IC"_lambda$ be the simple Satake kernel of this bound. Set
  $ overline(P)_c = overline(H)_1 times_(cal(B) times L) W \, wide pi_c : overline(P)_c arrow.r W . $
  This map is proper. Let $cal(J)$ be the pullback to $overline(P)_c$ of the Hecke integrand $F thin
    tilde(times.square) thin "IC"_lambda$ on $overline(H)_1$, with the twisted-product convention of (2.4).
    In the field case extend the integrand constantly in $z$ before pulling back to the cut;
    thus $cal(J)$ is defined on the whole $z$-family. In the trait case it is defined on the geometric generic
    fiber. Proper base change identifies $R pi_(c \, *) cal(J)$ with the pullback to $W$ of the Hecke transform
    used in Step 1.
  Let $T = pi_c^(- 1) \( w \)$ and let $C$ be the restriction to $T$ of $Phi cal(J)$ in the field case,
    or of $Psi cal(J)$ in the trait case. Proper compatibility of cycles and the vanishing in Step 1 give
  #[#set math.equation(numbering: n => "(4.3)")
   $ R Gamma \( T \, C \) = 0 . $ <det:eq-proper-zero>]
  On the open stratum $P_c subset overline(P)_c$ the kernel is $E \[ m \] \( m \/ 2 \)$.
    We will isolate the contribution of $a$ there.
  The open part of $T$ is exactly $H_(upright("out"))$ for $H_1$, since $w$ fixes $H_2 = h$ and $c = d$.
    Thus (4.1) at the fixed second modification identifies $d \( f compose c \)$ along this whole fiber with the
    pullback of $\( A' \, xi \)$ along $q_(H \, 1)$. Before cutting, $P arrow.r
    cal(B)$ by the first input bundle is smooth. At a point of $T$ in its open-orbit neighborhood,
    failure of smoothness after cutting would mean that $d \( f compose c \)$ comes from the cotangent space of
    that first input bundle. Since $P arrow.r H_1$ is smooth, its cotangent map is injective;
    thus failure would already give on $H_1$ an equality
  $ q_(H \, 1)^(*) \( A' \, xi \) = p_1^(*) A_1 $
  for some $A_1$. On $tilde(p)_1$-relative tangents this forces $o_1^(*) A'$ to vanish.
    The nondegenerate zero on $H_(upright("out"))$ shows that $a$ is isolated among such points of $T$.
    Consequently $C$ vanishes on a punctured neighborhood of $a$ in $T$:
    there the cut map to the first input stack is smooth and the open-orbit Satake kernel is an invertible
    constant shift and twist. This smoothness is over the trait.
    In the field case the integrand therefore pulls back the constant $F$-family on $cal(B)_(S_0)$,
    so it has zero $Phi$, as required; the trait case uses $Psi F = 0$.
  Here is the precise consequence of this isolation. If a constructible complex on a proper scheme vanishes on a
    punctured neighborhood of a closed point, its contribution at that point is a direct summand of its global
    cohomology. To see this, let $j : T \\ { a } arrow.r T$ and $i : { a } arrow.r T$.
    The restriction $j^(*) C$ is zero near $a$, so $\( R j_(*) j^(*) C \)_a = 0$.
    The localization triangle consequently splits as the direct sum of $i_(*) C_a$ and $R j_(*) j^(*) C$;
    both connecting morphisms vanish by these disjoint supports.
    The same localization argument applies to algebraic spaces. Equation (4.3) now gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ C_a = 0 . $ <det:eq-vertex-zero>]
  #emph[3. An exact split quadratic equation at the isolated point.] We identify the local equation at this
    isolated point exactly. The diagonal $W_0 arrow.r P$, given by making the two modifications equal,
    is a section of the smooth map $P arrow.r W_0$. Étale locally at $a$, there is a map $r : P arrow.r
    D$ lifting the first-input map to $cal(B)$, whose restriction to this diagonal is the original chart point,
    including its identification with the first input. Indeed, the smooth morphism $P times_(cal(B)) D arrow.r
    P$ has that section on the diagonal. To extend it, choose relative smooth coordinates,
    giving an étale map from a neighborhood of its value to $bb(A)_P^delta$,
    where $delta$ is the relative dimension of $D arrow.r cal(B)$ at $d$.
    The coordinates of the prescribed section are functions on the diagonal;
    lift these functions to a neighborhood in $P$ and take their graph in $bb(A)_P^delta$.
    Pullback of the étale map along this graph gives an étale neighborhood of $P$ with a lift to $P times_(cal(B))
    D$. Retain the branch carrying the prescribed section along the diagonal.
    The resulting projection to $D$ is $r$, and the fiber product retains the specified stack isomorphism between
    $b compose r$ and the first input. Thus $c$ records the second input everywhere,
    whereas $r$ records the first input in this étale neighborhood; the two agree on the diagonal.
    The diagonal, being a section of the smooth morphism $P arrow.r W_0$ of relative dimension $m$,
    is a regular immersion of codimension $m$. Choose relative coordinates $v_1 \, dots.h \,
    v_m$ generating its ideal. Since $r = c$ on it, there are functions $u_i$ with
  #[#set math.equation(numbering: n => "(4.5)")
   $ f \( c \) - f \( r \) = sum_(i = 1)^m u_i v_i . $ <det:eq-exact-uv>]
  In particular, the subsequent change of coordinates will give the exact cut equation.
  On the diagonal fiber with $c = d$ and leg $y$, which is the fixed-input, fixed-leg fiber of $H$ through $h$,
    the conormal coefficients $u_i$ are the negatives of the restriction of $p^(*)
    A$ to the $q_H$-relative tangent, in the frame dual to the $v_i$.
    In fact variation of the first modification with the second fixed has $d c = 0$, whereas $b compose
    r$ is its first input, so differentiating (4.5) gives precisely this restriction.
    This calculation is independent of the chart-vertical part of $d r$:
    $d f_d = b^(*) A$ annihilates $ker \( d b_d \)$. The description holds along that entire diagonal fiber.
    The nondegenerate zero on $H_(upright("in"))$ shows that $u_i \( a \) =
    0$ and that the derivatives of the $u_i$ on that fiber form a basis.
    The map $W_0 arrow.r D times L$ is the smooth base change of $tilde(p)$, of relative dimension $m$.
    On the diagonal, $r = c$ and the leg provide the other coordinates; the $v_i$ provide its normal coordinates. Hence
  #[#set math.equation(numbering: n => "(4.6)")
   $ \( r \, l \, u_1 \, dots.h \, u_m \, v_1 \, dots.h \, v_m \) : P arrow.r D times L times
     bb(A)^(2 m) $ <det:eq-uv-chart>]
  is étale near $a$, with the evident relative interpretation over $S_0$.
    On this neighborhood of the cut, $cal(J) \|_(P_c) tilde.eq r^(*) K \[ m \] \( m \/ 2 \)$.
    Thus (4.4) says that the cycles of the pulled-back $K$ vanish at the vertex of
  #[#set math.equation(numbering: n => "(4.7)")
   $ f + sum_i u_i v_i = e . $ <det:eq-affine-quadric>]
  For $m = 0$ this is already the required assertion, after removing the smooth leg factor.
  #emph[4. Recovering the original hypersurface.] We have proved vanishing after adjoining the split quadratic
    variables. To remove them, we use a proper family whose extra cohomology is supported precisely on the
    original cut ${ f = e }$. For $m > 0$, put $B = D times L$ and compactify (4.7) to the proper quadric family
  #[#set math.equation(numbering: n => "(4.8)")
   $ pi : Q = {sum_(i = 1)^m u_i v_i + \( f - e \) w^2 = 0} subset bb(P)_B^(2 m) arrow.r
     B . $ <det:eq-projective-quadric>]
  In the field case $B$ also carries the constant extension in $z$.
    Every point above $\( d \, y \)$ other than the vertex $\[ 0 : dots.h.c : 0 : 1 \]$ is smooth for $pi$,
    since some $u_i$ or $v_i$ is nonzero. The cycles of $pi^(*) K$ there vanish by smooth base change;
    they vanish at the vertex by (4.6). Proper compatibility therefore gives zero cycles for $R pi_(*) pi^(*)
    K$ at $\( d \, y \)$.
  The split-quadric calculation in [27] proof of Lemma 4.3 gives the precise extra term we need.
    Write $i : Z = { f = e } arrow.r.hook B$. Hyperplane powers give a triangle
  #[#set math.equation(numbering: n => "(4.9)")
   $ xor.big_(a = 0)^(2 m - 1) E_B \( - a \) \[ - 2 a \] arrow.r R pi_(*) E_Q arrow.r
     i_(*) E_Z \( - m \) \[ - 2 m \] arrow.r^(+ 1) . $ <det:eq-quadric-triangle>]
  Here the first arrow is an isomorphism outside $Z$: a smooth split quadric of dimension $2 m -
    1$ has the same $E$-cohomology as $bb(P)^(2 m - 1)$. Over $Z$ the family is the constant projective cone on
    the split quadric of dimension $2 m - 2$. Its cohomology has one additional copy of $E \( - m \)$ in degree $2
    m$, beyond the hyperplane powers. Proper base change identifies the restriction of the cone of the first arrow
    with this constant complex on $Z$; localization therefore identifies the cone as the last term displayed.
    This explains why the triangle is a statement about sheaves, not merely fiber cohomology dimensions.
  Tensor (4.9) with $K$ and use the projection formula. In the trait case take this triangle on the geometric
    generic fiber. The cycles of its first term vanish at $\( d \, y \)$ because $Psi K = 0$;
    those of its middle term vanish by the proper calculation above.
    Its last term therefore has zero nearby cycles there, and proper compatibility for $i$ proves the claimed
    vanishing on ${ f = 0 }$. In the field case use the triangle on the whole $z$-family.
    Its first term has zero vanishing cycles because $K$ is pulled from the constant family $D$.
    The identical argument with $Phi$ proves $\( Phi_f K \)_d = 0$.
    Smooth base change removes the leg factor in both cases. The sheaf operations used throughout are those in
    Proposition 3. ◻
]

=== 4.2 Nilpotent singular support <nilpotent-singular-support>

#proof[
  Apply Lemma 11 on every smooth chart and every open subchart.
    It says that every function whose differential at a point is outside $Lambda_D$ is locally acyclic there
    relative to $b^(*) F$. The cone includes the zero section,
    so these are precisely the nonzero directions that must be excluded.
    Weak singular support is the closure of the differentials of functions with nonzero vanishing cycles;
    over an infinite field closed-point tests suffice by constructibility.
    Barrett proves this description for the present $E$-coefficients and proves that weak singular support equals
    full singular support [3] §§1.4–1.5, Theorem (vii), extending Beilinson’s torsion-coefficient theorem
    [4] §1.5. The hypersurface calculation therefore gives $"SS" \( b^(*) F \) subset Lambda_D$.
    The same calculation on charts with additional smooth parameters is available,
    so the conclusion is compatible with the smooth-chart definition of singular support on the stack. ◻
]

=== 4.3 Simultaneous cuts and nonvanishing of specialization <simultaneous-cuts-and-nonvanishing-of-specialization>

To prove specialization detection, we must pass from hypersurfaces to enough simultaneous cuts to make the support
  finite over the trait. Successive hypersurface applications would require information about the singular support
  of intermediate restrictions. The following incidence argument makes all the cuts at once.

#thm([Lemma 4.4.])[
  (Simultaneous cuts).  #emph[In the trait case, assume $Psi F = 0$.
    Let $f_1 \, dots.h \, f_r$ vanish at $d in D_s$ and suppose their special-fiber differentials span an
    $r$-dimensional subspace $V subset T_d^(*) D_s$ with $V ∩ \( Lambda_D \)_d = { 0 }$.
    Then nearby cycles of $K \|_({ f_1 = dots.h.c = f_r = 0 }_(macron(eta)))$ vanish at $d$.
    The statement for $r = 0$ is $Psi K = 0$.]
] <det:simultaneous>

#proof[
  The case $r = 1$ is Lemma 11. For $r > 1$ consider the proper incidence projection
  $ pi : J = { \( t \, \[ a_1 : dots.h.c : a_r \] \) in D times bb(P)^(r - 1) : sum_i a_i f_i \( t \) =
    0 } arrow.r D . $
  At $\( d \, \[ a \] \)$ the differential of the defining function on a standard projective chart is $sum_i a_i d
    f_i$; derivatives in the projective directions are zero since all $f_i \( d \)$ vanish.
    It is nonzero and lies outside the pulled-back nilpotent cone.
    The map $D times bb(A)^(r - 1) arrow.r cal(B)$ on each such chart is smooth,
    so Lemma 11 proves that the nearby cycles of $pi^(*) K$ vanish on the whole fiber $bb(P)^(r - 1)$ over $d$.
    Proper compatibility gives $\( Psi R pi_(*) pi^(*) K \)_d = 0$.
  Let $i : Z = { f_1 = dots.h.c = f_r = 0 } arrow.r.hook D$.
    On the geometric generic fiber hyperplane powers give the triangle
  $ xor.big_(a = 0)^(r - 2) E_D \( - a \) \[ - 2 a \] arrow.r R pi_(*) E_J arrow.r
    i_(*) E_Z \( - \( r - 1 \) \) \[ - 2 \( r - 1 \) \] arrow.r^(+ 1) . $
  Indeed, over $D \\ Z$ the incidence is a projective bundle of relative dimension $r - 2$,
    so the first arrow is an isomorphism there. Over $Z$ it is the product $Z times bb(P)^(r - 1)$,
    and the cone has only its constant top cohomology sheaf. Proper base change and localization identify the cone
    as written, not merely its stalk dimensions. Tensor by $K$.
    The first term has zero nearby cycles by $Psi K = 0$, and the middle term by the preceding proper calculation.
    Proper compatibility for $i$ proves the lemma. ◻
]

#proof[
  Suppose that the closure of the nonzero-stalk locus meets $D_s$.
    Shrink to an affine chart smooth of constant relative dimension $N$ over $S_0$.
    The closure of that locus in $D_(macron(eta))$ has finitely many irreducible components
    $Z_(macron(eta) \, alpha)$. Constructibility gives, on each component,
    a dense open subset where the stalk of $K$ is nonzero. After a finite extension of the trait,
    descend the components and the proper closed complements of these opens.
    We only descend these finite algebraic data, and continue to use $K$ over $macron(eta)$.
    Let $Z_alpha subset D$ and $E_alpha subset Z_alpha$ be their horizontal closures.
    Components not meeting $D_s$ may be removed.
  Write $j$ for the largest dimension of a generic component whose closure meets $D_s$,
    and choose an irreducible component $Z_0$ of the reduced special fiber of such a closure.
    A horizontal integral finite-type scheme over this excellent trait, with generic dimension $j$,
    has every nonempty special-fiber component of dimension $j$;
    its local dimension at a special-fiber closed point is $j + 1$.
    For these two assertions see, respectively, [30] Tags 0B2J and 02JU.
    The same dimension calculation shows that the special fibers of the horizontal exceptional closures $E_alpha$
    have dimension at most $j - 1$ whenever the corresponding generic component has dimension at most $j$.
  Choose a general closed point $d$ of $Z_0$. We may arrange that $Z_0$ is smooth at $d$,
    that $d$ is in none of the exceptional closures, and that every reduced special-fiber component of the support
    closure through $d$ equals $Z_0$ near $d$. Distinct horizontal components may have this same special
    component; this causes no difficulty. By Proposition 6,
  $ dim Lambda_D lt.eq N . $
  After shrinking a dense open in $Z_0$, the fiber dimension theorem therefore gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ dim \( Lambda_D \)_d lt.eq N - j . $ <det:eq-cone-fiber>]
  Choose a $j$-plane $V subset T_d^(*) D_s$ which avoids $\( Lambda_D \)_d \\ { 0 }$ and whose restriction to $T_d
    Z_0$ is an isomorphism onto $T_d^(*) Z_0$. Both are nonempty open conditions on the Grassmannian.
    When $j > 0$, for the first condition projectivize the cone in (4.10):
    it has dimension at most $N - j - 1$, and a general $bb(P)^(j - 1)$ in $bb(P)^(N - 1)$ is disjoint from it by
    the elementary incidence dimension count. The second is the usual complement-to-a-fixed-subspace condition.
    The base field is infinite, so the two opens meet. If $j = 0$, take $V = 0$ and use no cutting functions.
    Lift a basis of $V$ to differentials of regular functions $f_1 \, dots.h \, f_j$ vanishing at $d$.
    Their restrictions are parameters on the smooth scheme $Z_0$. Put $Y = { f_1 = dots.h.c = f_j = 0 } subset D$.
    Lemma 12 says
  #[#set math.equation(numbering: n => "(4.11)")
   $ \( Psi \( K \|_(Y_(macron(eta))) \) \)_d = 0 . $ <det:eq-final-zero>]
  We finish by showing directly that this stalk is nonzero.
    Near $d$, the special fiber of the closed support closure intersected with $Y$ is zero-dimensional.
    On any of its selected horizontal components $Z_alpha$ of generic dimension $j$ through $d$,
    the local ring has dimension $j + 1$, so its quotient by the $j$ functions has dimension at least one [30] Tag
    0B52. Its further quotient by the uniformizer is zero-dimensional.
    Thus this intersection has a generization of $d$ in the generic fiber.
    Such a generization lies outside $E_alpha$, since $d$ was chosen outside its closure,
    and $K$ has a nonzero geometric stalk there.
  For completeness, the passage from this generization to nearby cycles is local and finite.
    Let $Z subset Y$ be the reduced intersection $Y ∩ union.big_alpha Z_alpha$.
    Its generic fiber contains the nonzero-stalk locus of $K \|_(Y_(macron(eta)))$,
    the preceding generization lies in $Z$, and $d$ is isolated in $Z_s$.
    The morphism $Z arrow.r S_0$ is quasi-finite at $d$. Take an affine neighborhood in $Y$ and use the henselian
    decomposition of its closed support: the local ring of $Z$ at $d$ is a finite local $R$-algebra and defines an
    open-and-closed piece $T subset Z$ [30] Tag 04GH(3) and its proof. Its unique special-fiber point is $d$.
    Remove the closed complement $Z \\ T$ from the ambient neighborhood.
    On the resulting neighborhood, which has the same nearby-cycle stalk at $d$,
    the support closure is the finite $S_0$-scheme $T$.
  The generic restriction of $K$ is the extension by zero from this finite closed support.
    Proper base change now identifies its nearby-cycle stalk at $d$ with
  $ xor.big_(z in T_(macron(eta))) \( K \|_(Y_(macron(eta))) \)_z . $
  This is a finite direct sum of complexes of $E$-vector spaces, at least one of which is nonzero.
    Hence the sum is nonzero, contradicting (4.11). The argument includes $j = 0$,
    when there are no cutting functions and the original support already has the required finite local piece.
    This proves the theorem. ◻
]

== 5 Perverse cohomology of a dense eigencomplex <perv:section>

We now work over $bb(C)$. Our objective is to extract a perverse object from an eigencomplex without losing its
  moving-leg eigenmaps or fusion constraints. Density makes the spectral parameter a free closed orbit.
  A frame along this orbit gives exactness of fixed-point Hecke operators on a subcategory containing the
  eigencomplex and its truncations; local constancy in the legs then supplies the moving statement.
  This is the argument of [27] §6, with all the marked points retained in the level structure.

Let $X \/ bb(C)$ be a smooth projective connected curve of genus $g$, let $D = x_1 + dots.h.c +
  x_s$ be a nonempty reduced divisor, and put $U = X \\ \| D \|$.
  Let $cal(B)$ be either $cal(A)$ or $cal(A)^(+)$ from Section 2.1,
  and let $Lambda subset T^(*) cal(B)$ be its generically nilpotent cone from Section 3.
  All Hecke functors use the relative Satake normalization.

#thm([Proposition 5.1.])[
  #emph[Suppose $F in D_(upright("lcc")) \( cal(B) \, E \)$ is a coherent Hecke eigencomplex for a continuous
    parameter $sigma : pi_1^(upright("et")) \( U \) arrow.r caron(G) \( L \)$ with Zariski-dense image,
    where $L \/ bb(Q)_ell$ is finite. Then every $zws^p H^j \( F \)$ has a natural coherent eigenstructure for
    $sigma$, with singular support in $Lambda$. The eigenmaps are natural in representations and compatible with
    the unit, convolution, permutations, and fusion on every collision diagonal.
    If $F eq.not 0$, some $zws^p H^j \( F \)$ is nonzero. No global cohomological bound on $F$ and no condition on
    the boundary monodromy are required.]
] <perv:eigen>

=== 5.1 The Betti spectral action with all levels present <the-betti-spectral-action-with-all-levels-present>

We state the Betti input before using it. At each $x_i$, in a formal coordinate $t_i$,
  ordinary and enhanced flags correspond respectively to

$ upright("Iw")_i = { h in G \( bb(C) \[ \[ t_i \] \] \) : h \( 0 \) in B } \, wide upright("Iw")_i^0 =
  { h in G \( bb(C) \[ \[ t_i \] \] \) : h \( 0 \) in N_B } . $

The first congruence subgroup is normal in each of these groups,
  and both groups lie in the positive-loop maximal parahoric, hence in its normalizer.
  Thus the finite set of levels satisfies the hypotheses of Nadler–Yun’s level-structure results [24] §6.2.
  Their level cotangent nilpotent cone is defined by generic nilpotence and is exactly $Lambda$,
  with the residue conditions established in Section 3.

Write $cal(D)_Lambda \( cal(B) \)$ for the Betti category with singular support in this cone.
  The results of [24] Theorem 6.2.2, Proposition 6.3.2, §6.3.6, and Theorem 6.3.7 give the following two inputs.
  First, for a finite set $I$ and representations $bold(V) = \( V_i \)_(i in I)$, the moving transform satisfies

#[#set math.equation(numbering: n => "(5.1)")
 $ "SS" #scale(x: 120%, y: 120%)[\(] "Hecke"_(I \, bold(V)) \( K \) #scale(x: 120%, y: 120%)[\)] subset Lambda
   times 0_(U^I) \, wide K in cal(D)_Lambda \( cal(B) \) . $ <perv:leg-support>]

This holds on the full product, including collisions. On smooth charts,
  the isotropy proved in Section 3 and the product-stratification argument in the proof of [24] Proposition 6.3.2
  and §6.3.6 make this a local product statement. On each finite-type smooth chart,
  choose a microlocal stratification whose conormals contain the pulled-back cone.
  The output is weakly constructible for its product with a sufficiently small contractible analytic leg patch,
  and hence is the pullback of a fixed-leg slice. The transport is compatible with the Hecke tensor operations.

Second, choose $u in U^(upright("an"))$ and free generators $gamma_1 \, dots.h \,
  gamma_a$ of its topological fundamental group, where $a = 2 g + s - 1$.
  Since $U^(upright("an"))$ has the homotopy type of a bouquet of these circles,
  its Betti stack of $caron(G)$-local systems is

$ cal(L) = \[ Y \/ caron(G) \] \, wide Y = caron(G)^a \, $

with simultaneous conjugation. The symmetric monoidal category $"Perf" \( cal(L) \)$ acts on
  $cal(D)_Lambda \( cal(B) \)$. For $V in "Rep"_E \( caron(G) \)$, the equivariant bundle $cal(E)_V = Y times
  V$ acts by $"Hecke"_(V \, u)$; its tautological automorphisms along the $gamma_i$ act by Hecke transport [24]
  Proposition 6.3.3 and §6.3.6. These statements use the Satake labeling fixed in Section 2.

The Betti categories in [24] §5.1 and §6.2 do not impose global boundedness or support in a finite-type substack.
  The Hecke transforms above preserve local bounded constructibility:
  on any finite-type output chart a Satake kernel has a finite-dimensional bound,
  whose proper correspondence meets only a quasi-compact part of the input stack.
  Consequently the local product statement also applies to the lcc objects and to the finite diagrams used below,
  locally on finite-type charts.

#thm([Lemma 5.2.])[
  (The scalar spectral action).  #emph[Let $K in cal(D)_Lambda \( cal(B) \)$ have a coherent Betti eigenstructure
    with parameter represented by $y in Y \( E \)$. Every $f in E \[ Y \]^(caron(G))$ acts,
    as a degree-zero endomorphism of the spectral unit and hence of $K$, by $f \( y \) "id"_K$.]
] <perv:scalar>

#proof[
  We use the identification with excursion operators in [24] §7.1 and Proposition 7.2.3;
    the scalar calculation is [27] Lemma 6.2. Here is the calculation for the free group of rank $2 g + s - 1$.
    Matrix coefficients span $E \[ Y \]$. Exactness of invariants for the reductive group $caron(G)$ implies that
    every invariant is a finite sum of functions
  #[#set math.equation(numbering: n => "(5.2)")
   $ \( g_1 \, dots.h \, g_a \) mapsto "Tr"_W (A compose ⨂_(i = 1)^a V_i \( g_i \)) \, wide W = ⨂_(i = 1)^a V_i \,
     quad A in "End"_(caron(G)) \( W \) . $ <perv:excursion>]
  Indeed products of matrix coefficients are images of $"End"_E \( W \)$ under this trace map.
    A finite sum of these finite-dimensional equivariant images contains a prescribed invariant;
    exactness of invariants lifts it to invariant endomorphisms in the corresponding finite sum of source spaces.
  The excursion for (5.2) inserts the coevaluation tensor in $W ⊗ W^(*)$, transports each $V_i$ around $gamma_i$,
    applies $A$, and evaluates. The dual factor can remain at $u$ as an identity leg.
    Naturality, the tensor constraints, and the unit constraint of the eigenstructure identify this operation with
    the same tensor calculation on the parameter. Its value is (5.2) at $y$.
    This proves the assertion for every invariant function. In particular the scalar follows from the coherent
    eigenmaps, not merely from fixed-point eigenisomorphisms. ◻
]

=== 5.2 Equivariant frames and exactness <equivariant-frames-and-exactness>

The next algebraic lemma trivializes each $cal(E)_V$ after inverting an invariant function nonzero at a given
  dense parameter. Its frames will be used only to prove exactness.
  They need not respect tensor products, since the eigenmaps will be obtained by truncating the original coherent maps.

#thm([Lemma 5.3.])[
  #emph[If the entries of $y in Y \( E \)$ generate a Zariski-dense subgroup of $caron(G) =
    upright("PGL")_(n \, E)$, then for every nonzero representation $V$, of dimension $b$,
    there are an invariant $f_V in E \[ Y \]^(caron(G))$ with $f_V \( y \) eq.not 0$ and equivariant maps
$ alpha_V : cal(O)_Y^(xor b) arrow.r cal(E)_V \, wide beta_V : cal(E)_V arrow.r cal(O)_Y^(xor b) $

 such that
#[#set math.equation(numbering: n => "(5.3)")
 $ beta_V alpha_V = f_V "id" \, wide alpha_V beta_V = f_V "id" . $ <perv:adjugates>]

]
] <perv:frame>

#proof[
  This is the closed-orbit frame argument of [27] Lemma 6.3.
    The stabilizer of $y$ is the centralizer of a dense subgroup, hence $Z \( caron(G) \) = 1$.
    Its orbit $O$ is closed: a one-parameter subgroup giving a limit of the conjugated tuple forces every entry
    into its associated parabolic. Density forces that parabolic to be all of $caron(G)$,
    so the one-parameter subgroup is central. The affine Hilbert–Mumford closed-orbit criterion proves the claim.
    Thus $O tilde.eq caron(G)$.
  A basis $v_1 \, dots.h \, v_b$ at $y$ defines equivariant sections on $O$ by $s_j \( h y \) = h v_j$.
    Restriction $E \[ Y \] ⊗ V arrow.r.twohead E \[ O \] ⊗ V$ is surjective because $O$ is closed and $Y$ is
    affine. Reductivity in characteristic zero makes invariants exact,
    so these sections extend equivariantly to $Y$. Use the extensions as the columns of $alpha_V$.
    Every character of the semisimple group $caron(G)$ is trivial, so $det V$ is trivial.
    After choosing a volume form, $f_V = det alpha_V$ is invariant and nonzero at $y$.
    The adjugate defines a regular equivariant map $beta_V$ on all of $Y$:
    on the dense open set $f_V eq.not 0$ it equals $f_V alpha_V^(- 1)$,
    and this identity verifies equivariance everywhere. The two adjugate identities give (5.3). ◻
]

Let $cal(D)_Lambda^(upright("lcc")) \( cal(B) \)$ be the lcc part of the Betti nilpotent category.
  It is stable under perverse truncation. Locally this is the microlocal dévissage assertion that the singular
  support of a bounded complex is the union of the singular supports of its perverse cohomologies;
  it follows equivalently from the exact perverse vanishing-cycle tests.
  Smooth charts give the statement without a uniform bound on the stack.

Fix a dense tuple $y$ as in Lemma 15. For each isomorphism class of nonzero representations choose $f_V$ supplied
  by that lemma for this tuple, and let $S$ be the multiplicative set they generate. Define

$ cal(D)_S = { K in cal(D)_Lambda^(upright("lcc")) \( cal(B) \) : f_K : K arrow.r
  K upright(" is invertible for every ") f in S } . $

Here $f_K$ denotes the central endomorphism given by the spectral action.

#thm([Lemma 5.4.])[
  #emph[The subcategory $cal(D)_S$ is preserved by perverse truncations and by all fixed-point Hecke functors.
    Every fixed-point Hecke functor is perverse $t$-exact on this subcategory.]
] <perv:exact>

#proof[
  For a degree-zero natural endomorphism $f$ of the identity, naturality for $zws^p tau_(lt.eq r) K arrow.r
    K$ and the universal property of truncation give
  $ f_(zws^p tau_(lt.eq r) K) = zws^p tau_(lt.eq r) \( f_K \) . $
  Indeed both sides are the unique endomorphism of the truncation whose composite to $K$ equals $f_K$ after the
    truncation map. The other truncation has the analogous property.
    Invertibility therefore passes to both truncations, proving that $cal(D)_S$ inherits the perverse
    $t$-structure. No exactness of an arbitrary spectral operator has been assumed.
  Applying the spectral action to (5.3) gives maps
  $ K^(xor b) arrow.r^(alpha_(V \, K)) "Hecke"_(V \, u) \( K \) arrow.r^(beta_(V \, K)) K^(xor b) . $
  Symmetric monoidality identifies $f_("Hecke"_(V \, u) \( K \))$ with $"Hecke"_(V \, u) \( f_K \)$,
    so the Hecke functor preserves $cal(D)_S$. On this subcategory the adjugate identities make $f_V^(- 1)
    beta_(V \, K)$ an inverse to $alpha_(V \, K)$. Hence
  #[#set math.equation(numbering: n => "(5.4)")
   $ "Hecke"_(V \, u) \|_(cal(D)_S) tilde.eq "id"_(cal(D)_S)^(xor dim V) \, $ <perv:fixed-exact>]
  which proves exactness. Hecke transport along a path from $u$ proves the assertion at any allowed point.
    The zero representation acts by zero. Compositions, including convolution at a shared point,
    are therefore exact and preserve $cal(D)_S$ as well. ◻
]

=== 5.3 Moving legs, collisions, and adic eigenmaps <moving-legs-collisions-and-adic-eigenmaps>

#proof[
  Let $K$ be the Betti realization of $F$, using Section 2.4.
    Theorem 9 and singular-support comparison put $K$ in $cal(D)_Lambda^(upright("lcc")) \( cal(B) \)$.
    Its topological monodromy remains Zariski dense. The topological fundamental group has dense image in the
    profinite fundamental group; a polynomial equation on the image,
    after adjoining its coefficients to a finite extension of $L$, is closed for the adic topology.
    An equation on topological monodromy therefore holds on the entire adic image.
    The tuple $y$ associated with $K$ satisfies Lemma 15; use this tuple to choose $S$ and $cal(D)_S$.
    By Lemma 14, $f_(V \, K) = f_V \( y \) "id"_K$, so $K in cal(D)_S$.
    Lemma 16 puts all of its perverse truncations and cohomologies in this subcategory.
  We first prove the bounds needed to truncate moving transforms. For $A in cal(D)_S$ and $m = \| I \|$, the functor
  $ A mapsto "Hecke"_(I \, bold(V)) \( A \) \[ m \] $
  is perverse $t$-exact. On a contractible leg patch, (5.1) identifies its unshifted value with a constant family
    of fixed-point transforms. The fiber is a composition of fixed-point Hecke functors,
    using convolution where the legs coincide, and hence has the bounds of $A$ by Lemma 16.
    The constant sheaf shifted by $m$ on the smooth parameter space is perverse.
    The product description therefore proves the asserted bounds on smooth charts.
    Applying this exact functor to a truncation triangle and using its universal property yields natural isomorphisms
  #[#set math.equation(numbering: n => "(5.5)")
   $ zws^p H^j #scale(x: 120%, y: 120%)[\(] "Hecke"_(I \, bold(V)) \( A \) \[ m \] #scale(x: 120%, y: 120%)[\)]
     tilde.eq "Hecke"_(I \, bold(V)) \( zws^p H^j A \) \[ m \] . $ <perv:moving-truncation>]
  The same bounds hold for successive operations with all previous leg variables retained.
    Locally in those variables the input is a constant family whose fixed-leg fibers belong to $cal(D)_S$.
    Applying the next Hecke operator uses (5.4) on these fibers and (5.1) for its parameter dependence.
    Thus the truncation comparison holds throughout each composition diagram.
    The shift is the dimension of the total retained parameter space, counted once;
    successive operations at a shared leg add no parameter.
  For clarity, let $pi : I arrow.r.twohead J$ be a surjection, let $Delta_pi : U^J arrow.r
    U^I$ be its collision diagonal, and put $W_j = ⨂_(i in pi^(- 1) \( j \)) V_i$. The fusion convention gives
  $ \( 1 times Delta_pi \)^(*) "Hecke"_(I \, bold(V)) \( A \) tilde.eq "Hecke"_(J \, bold(W)) \( A \) . $
  On the local product families just considered,
  #[#set math.equation(numbering: n => "(5.6)")
   $ \( 1 times Delta_pi \)^(*) \[ thin \| J \| - \| I \| thin \] $ <perv:collision-exact>]
  is perverse exact: it replaces a perverse constant factor on a smooth $\|
    I \|$-dimensional base by the perverse constant factor on the $\| J \|$-dimensional base.
    This proves compatibility of (5.5) with collision restriction, including iterated collisions.
    Local constancy only away from diagonals would not suffice for this step.
  These bounds construct the required comparisons in the adic category itself.
    Start with the adic truncation triangles of $F$ and apply the adic Hecke functors.
    Betti realization preserves perversity and is conservative on the finite-type charts,
    so the bounds just proved show that their images are truncation triangles.
    Their universal property therefore supplies (5.5) adically for $F$.
    The same argument applies to the retained-leg compositions and the shifted diagonal restriction (5.6).
    In particular no algebraization of maps constructed only in the Betti category is needed.
  Write $cal(V)_(I \, sigma) = times.square_(i in I) \( V_i \)_sigma$.
    Shift the original adic eigenmap by $m$, apply $zws^p H^j$, and use (5.5).
    Exterior product with the lisse factor $cal(V)_(I \, sigma) \[ m \]$ is perverse exact. We obtain
  $ "Hecke"_(I \, bold(V)) \( zws^p H^j F \) \[ m \]
    tilde.eq \( zws^p H^j F times.square cal(V)_(I \, sigma) \) \[ m \] . $
  Removing the common shift gives precisely the required eigenmap
  #[#set math.equation(numbering: n => "(5.7)")
   $ "Hecke"_(I \, bold(V)) \( zws^p H^j F \) tilde.eq zws^p H^j F times.square cal(V)_(I \, sigma) \,
     $ <perv:induced-eigen>]
  with no moving-leg shift.
  Finally apply the functorial truncation comparisons to the diagrams of the original coherent eigenstructure.
    Naturality in representations, the unit, and permutations commute with truncation.
    The retained-leg comparison proves compatibility with convolution, and (5.6) proves compatibility with fusion.
    Every vertex over $U^I$, after the single shift $\[ \| I \| \]$, lies in the perverse heart:
    locally it is a fixed-point exact transform of $zws^p H^j F$ times a lisse parameter factor.
    After collision to $U^J$, the adjustment $\[ \| J \| - \| I \| \]$ places all vertices in the new heart.
    For objects $P \, Q$ of such a heart, $pi_r "Map" \( P \, Q \) = "Hom" \( P \, Q \[ - r \] \) =
    0$ for $r > 0$. Thus their mapping spaces are discrete, and the commutative diagrams give all the coherent
    constraints. The auxiliary choices of frames played no role in constructing (5.7).
  Theorem 9 applied to these eigenmaps gives singular support in $Lambda$;
    one may also use perverse microlocal dévissage. All bounds and comparisons were local on finite-type smooth
    charts. If $F$ is nonzero, its bounded restriction to some such chart has nonzero perverse cohomology.
    Smooth perverse pullback identifies this with a restriction of some $zws^p H^j F$, proving nonvanishing. ◻
]

== 6 Removing all flag enhancements <desc:section>

Work over $bb(C)$, with the marked curve $\( X \; x_1 \, dots.h \, x_s \)$ and $U = X \\ { x_1 \, dots.h \,
  x_s }$. For a parameter $sigma$ on $U$, write $V_sigma$ for its associated tensor local system.
  We will pass from a nonzero coherent eigencomplex on $cal(A)^(+)$ to a nonzero perverse eigenobject on $cal(A)$.
  The map

$ q : cal(A)^(+) arrow.r cal(A) $

is a torsor under $H = T^s$. Compactly supported direct image along $q$ can kill a local system with nontrivial
  torus characters. The point of the argument is that unipotent boundary monodromy of the eigenvalue forces
  unipotent monodromy along every factor of $H$.

We adapt the one-point descent argument of [27] Section 7.
  Its local input is Gaitsgory’s central-sheaf construction [12] in the universal monodromic form of
  Dhillon–Taylor [6]. The extension needed here keeps the levels at the other marked points #emph[transported] in
  every moving and convolution correspondence. We spell out the resulting natural comparisons:
  the trace identity needs monodromy on one convolution factor at a time.
  The universal kernels occur only in Betti sheaves; $q_(!)$ and the final perverse cohomology are operations on
  the original geometric adic complexes.

=== 6.1 Monodromy on the full enhancement torus <monodromy-on-the-full-enhancement-torus>

A complex on an $H$-torsor is #emph[monodromic along the torsor] if, locally on its base,
  it is constructible for a product stratification ${ S_alpha times H }$ and, on a contractible patch of $H$,
  is pulled back from a slice. This includes the extension data between strata.
  It allows arbitrary monodromy in $pi_1 \( H \) = X_(*) \( T \)^s$ and requires no equivariant structure.
  The condition is preserved by base change on the base.

#thm([Lemma 6.1.])[
  #emph[If $Q in D_(upright("lcc")) \( cal(A)^(+) \, E \)$ has nilpotent singular support,
    its Betti realization is monodromic along the whole $T^s$-torsor $q$, and along each enhancement separately.]
] <desc:monodromic>

#proof[
  By the cone description following Definition 5, the nilpotent cone on $cal(A)^(+)$ is the smooth cotangent
    pullback of the ordinary-level cone: a nilpotent Borel-valued residue has zero toral component at every marked
    point. On a smooth torsor chart $S times H$ the singular support is therefore contained in $Lambda_S times
    0_H$. The cone $Lambda_S$ is isotropic by Proposition 6. Choose a microlocal stratification of $S$ whose
    conormals contain it. The product stratification criterion used in [24] proof of Proposition 6.3.2 and [27]
    Lemma 7.1 makes $Q$ constructible for ${ S_alpha times H }$.
    Restriction to a slice over a contractible patch of $H$ is an equivalence for this constructible category;
    hence it identifies the entire complex with the pullback from that slice.
    Continuation gives the assertion on overlaps. These descriptions persist under base change and, in particular,
    under passage to the base of a single enhancement torus. ◻
]

=== 6.2 The single-disc inputs <the-single-disc-inputs>

Fix one marked point $x_i$. In this subsection $T$ denotes its individual enhancement torus; put

$ d = dim T \, wide Gamma = X_(*) \( T \) \, wide R_T = E \[ Gamma \] = cal(O) \( hat(T) \) . $

Here $hat(T) subset caron(G)$ is the dual maximal torus. We fix positive cocharacter loops and orientations of the
  compact real torus in $T \( bb(C) \)$. Let $cal(L)_T$ be the local system with fiber $R_T$ and regular
  monodromy. It has infinite-dimensional stalks and is used in the category of weakly constructible Betti sheaves.
  For ordinary-direct-image convolution its unit is

#[#set math.equation(numbering: n => "(6.1)")
 $ upright(bold(1))_T = cal(L)_T \[ d \] . $ <desc:unit>]

Our enhancement-difference convention writes the varying input as $e
  a^(- 1)$ for fixed output $e$ and difference $a in T$.

We use the following precise features of this unit, proved in [27] Lemma 7.2.
  Convolution with $upright(bold(1))_T$ is naturally the identity on relatively monodromic complexes,
  commutes with base change, and respects successive convolutions.
  Multiplication by $R_T$ on the unit acts as enhancement monodromy.
  In fact, if $W$ is a fiber and $M_1 \, dots.h \, M_d$ its commuting monodromies,
  the unit integral before shifting is the Koszul complex

$ K^bullet \( z_1 M_1^(- 1) - 1 \, dots.h \, z_d M_d^(- 1) - 1 \; R_T ⊗_E W \) . $

Its cohomology is $W$ in degree $d$, with residual $z_j$ acting by $M_j$.
  This also applies to complexes relatively over a stratified base.
  Compatibility with two integrations follows on the real universal covers of the compact tori:
  replace two lifted differences by the first and their sum, and integrate in that order.
  The change preserves product orientation and continuation follows the same summed path.
  This specifies the unit maps, rather than only their isomorphism classes.

Let $upright("Iw")$ and $upright("Iw")^0$ be the inverse images of $B$ and $N_B$ in $L^(+) G$.
  The local central-sheaf input is the monoidal functor

$ Z : "Rep" \( caron(G) \) arrow.r cal(H)^(upright("mon")) \, wide V mapsto Z \( V \) \, $

where $cal(H)^(upright("mon"))$ is the universal monodromic Betti Hecke category on $L G \/ upright("Iw")^0$,
  with the pro-unipotent equivariance convention of [6]. It comes with nearby-cycle monodromies $m_V$,
  natural in $V$. We use the kernel specialization and monoidal comparison of [6] Proposition 6.3.1 and
  Lemma 6.3.2, as recorded in [27] Sections 7.2 and 7.4: the moving Satake kernel tensored with
  $upright(bold(1))_T$ specializes to $Z \( V \)$, and the specialized twisted product and its convolution map are
  the specified monoidal maps of $Z$.

The corresponding local trace formula is

#[#set math.equation(numbering: n => "(6.2)")
 $
   (upright(bold(1))_T arrow.r^(upright("coev")) Z \( V \) star.op Z \( V^(*) \) arrow.r^(m_V star.op
   upright("id")) Z \( V \) star.op Z \( V^(*) \) arrow.r^(upright("ev")) upright(bold(1))_T) =
   chi_V in "End" \( upright(bold(1))_T \) = R_T \, $ <desc:local-trace>]

where $chi_V$ is the character on $hat(T)$ and evaluation in this order is induced from the symmetric
  representation category. For completeness, [6] Propositions 5.3.1 and 9.3.1(a)–(c) compute this trace after the
  Wakimoto associated-graded functor. On the weight summand $nu in X^(*) \( hat(T) \) = Gamma$,
  monodromy is multiplication by $e^nu$. The trace is thus $sum_nu dim \( V_nu \) e^nu = chi_V$.
  On endomorphisms of the unit the associated-graded functor retains multiplication on its regular $R_T$-module,
  and is faithful there, proving (6.2). Reversing conventions inverts both the torus and boundary loops and does
  not change the unipotence conclusion.

One further input explains why ordinary pushforward can be specialized in these correspondences.
  We state it because its hypothesis must be checked again when the other levels are present.

#thm([Lemma 6.2.])[
  (Exchange through an enhancement torus).  #emph[Let $P arrow.r^pi C arrow.r^b
    Y$ be a factorization over an analytic disc $Delta$, with $pi$ a torus torsor on the entire family and $b$
    proper. On finite-dimensional paracompact charts suppose that $F$ over $Delta^(*)$ is weakly constructible and
    relatively monodromic along $pi$. Then the natural exchange
#[#set math.equation(numbering: n => "(6.3)")
 $ Psi \( b pi \)_(*) F arrow.r \( b_0 pi_0 \)_(*) Psi F $ <desc:push-exchange>]

 is an isomorphism. Base change and projection formula for these pushforwards also hold,
   and the comparisons respect composition. Here $Psi$ denotes geometric Betti nearby cycles,
   without taking monodromy invariants.]
] <desc:exchange>

#proof[
  This is [27] Lemma 7.3. Quotient the enhancement torus by its positive real radial subgroup $A tilde.eq
    bb(R)^d$, to factor $P arrow.r^rho overline(P) arrow.r^(macron(pi)) C$ over the #emph[whole] disc.
    The second map is a compact-torus bundle and therefore proper.
    Relative monodromicity gives $F = rho^(*) overline(F)$: restriction across a contractible radial factor is an
    equivalence, so the local descriptions glue. In trivializations extending across zero,
  $ R rho_(*) rho^(*) overline(F) = overline(F) \, wide Psi F = rho_0^(*) Psi overline(F) . $
  These identities persist after base change and tensoring with a factor from the target.
    Proper base change for $b macron(pi)$ proves all assertions.
    The maps are the natural exchanges for restriction and direct image from the universal cover of $Delta^(*)$,
    so they respect composition. The same proof applies to products of tori. ◻
]

=== 6.3 A central action with all the other levels retained <a-central-action-with-all-the-other-levels-retained>

Choose a disc $Delta$ about $x_i$, disjoint from the other marks,
  and a lift to the universal cover of $Delta^(*)$. For the eigenvalue $V_sigma$,
  write $V_(partial i)$ for the resulting boundary fiber and $M_(V \, i)$ for positive-loop monodromy.
  Let $mu_i$ denote the $R_T$-action given by continuation along the $i$th enhancement.

#thm([Lemma 6.3.])[
  (Trace at one of several marked points).  #emph[Let $Q$ be a locally bounded algebraically constructible Betti
    complex on $cal(A)^(+)$, monodromic along $T^s$, with coherent Hecke eigenisomorphisms for $sigma$ on $U$.
    The local central kernels at $x_i$ act on $Q$, and there are natural isomorphisms
#[#set math.equation(numbering: n => "(6.4)")
 $ Z \( V \) star.op_(x_i) Q tilde.eq Q ⊗_E V_(partial i) $ <desc:central-eigen>]

 compatible with the unit, representation morphisms, and convolution.
   On each individual convolution factor they carry $m_V$ to $M_(V \, i)$.
   In particular, for every $i$ and every $V in "Rep" \( caron(G) \)$,
#[#set math.equation(numbering: n => "(6.5)")
 $ chi_V \( mu_i \) = "Tr" \( M_(V \, i) \) thin upright("id")_Q . $ <desc:character-trace>]

]
] <desc:trace>

#proof[
  We give the several-level version of [27] Lemma 7.4, including the comparisons needed to apply (6.2).
  #emph[Moving correspondence and its single-step comparison.] Let $frak(H)_(i \, Delta)$ parametrize a leg $z in
    Delta$, two bundles $P_0 \, P_1$ with enhancements $eta_(0 j) \, eta_(1 j)$ at every $x_j$,
    and a modification $P_0 tilde.eq P_1$ off $z$. At $x_i$ the two enhancements are independent.
    At each $x_j$ with $j eq.not i$ require $eta_(1 j)$ to be the transport of $eta_(0 j)$.
    Write $p$ for input and $o$ for output-and-leg. We bound the underlying modifications by closed spherical
    Schubert bounds, retaining the full independent flags at $x_i$.
    Choose these bounds to contain the Satake supports; their closed central fibers then contain the specialized
    supports.
  Forgetting the levels at $j eq.not i$ makes this the pullback of the one-point moving correspondence by the
    stack of those levels on its input. Transport gives the same description using its output.
    This cartesian assertion also holds for successive modifications:
    there is one choice of each other enhancement, and the intermediate and final choices are determined.
    It does #emph[not] assert that $Q$ is pulled back from the one-point stack.
  In an input frame compatible with $eta_(0 i)$ the local family is the one used to define $Z$:
    its punctured fiber is $"Gr"_G times G \/ N_B$ and its central fiber is $L G \/ upright("Iw")^0$.
    The kernel $K_V$ on the punctured fiber is the relative Satake kernel on $"Gr"_G$,
    tensored with $upright(bold(1))_T$ on $T = B \/ N_B subset G \/ N_B$, extended by zero.
    Thus it requires equality of the two ordinary flags at $x_i$ and records their enhancement difference.
    Its specialization is $Z \( V \)$. With the relative normalization of Section 2,
    the moving-leg perverse shift is absent on both sides of this statement.
  The kernels and their maps descend from these frames. On a bound one can take finite jets on a sufficiently
    thick neighborhood of the sum of the graphs of $x_i$ and $z$,
    so the same smooth frame space works at collision. The equivariance of Satake and the $N_B$-invariance of the
    flag factor give descent off zero; at zero it is the $upright("Iw")^0$-equivariance of $Z \( V \)$.
    The finite jet quotients of this last group are unipotent, hence Betti contractible,
    so descent retains the maps and their cocycles. The extra levels are outside this neighborhood and enter only
    in the bundle factor.
  For an input family $D$ over $Delta^(*)$, write
  $ A_V \( D \) = o_(*) \( D thin accent(times.square K, ̃)_V \) \, wide B_V \( R \) = Z \( V \) star.op_(x_i) R \, $
  where the twisted product includes the fixed relative normalization.
    For $Q$ viewed as a constant family, the unit calculation gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ A_V \( Q \) tilde.eq "Hecke"_V \( Q \) \|_(Delta^(*)) tilde.eq Q times.square V_sigma \|_(Delta^(*)) .
     $ <desc:punctured-action>]
  Indeed the only integration beyond the usual Hecke correspondence is over the input enhancement at $x_i$,
    with kernel $upright(bold(1))_T$.
  The output map $o$ factors over the full disc by forgetting just $eta_(0 i)$, keeping its ordinary flag,
    and then by a proper map. The first map is a $T$-torsor. For the second,
    bounded input modifications with fixed output lie in a proper Grassmannian bound,
    and their ordinary input flags form a proper $G \/ B$-bundle.
    All other enhancements are determined by transport from the output; they add no nonproper directions.
    At $z = 0$ the output enhancement is still fixed, and choosing the ordinary input flag is still the full
    proper flag bundle on the modified input fiber. Thus the quotient is proper at collision as well;
    we have not replaced it by an exact-position affine-flag stratum.
    The integrand is relatively monodromic along the forgotten torus:
    $Q$ has this property by hypothesis, and $K_V$ has a local system in the enhancement difference with support
    conditions independent of that difference. Lemma 18 therefore applies.
  In the input frames, the nearby-cycle tensor map for this integrand is an exterior-product comparison with an
    arbitrary coefficient from the bundle factor. It is an isomorphism both for constant $D = Q$ and for $D =
    Q times.square L$, where $L$ is a finite-rank local system on $Delta^(*)$:
    trivialize $L$ on the puncture cover. This is a Betti calculation on finite-dimensional bounds,
    as in [27] Lemma 7.4. On sufficiently small chart neighborhoods,
    the local Milnor data adapted to the constructible factors have finite triangulations.
    Finite cellular complexes then compute the comparison, permitting the infinite-dimensional stalks of
    $cal(L)_T$; no global finite triangulation of the correspondence is needed.
    There is no adic inverse limit in this calculation. Smooth frame descent preserves the comparison and its
    naturality.
  Combining this tensor map with inverse push exchange defines an actual natural isomorphism
  #[#set math.equation(numbering: n => "(6.7)")
   $ c_V \( D \) : B_V \( Psi D \) & = o_(0 \, *) \( Psi D thin accent(times.square Z, ̃) \( V \) \)\
 & arrow.r o_(0 \, *) Psi \( D thin accent(times.square K, ̃)_V \) arrow.r^tilde.op Psi A_V \( D \) .
   $ <desc:comparison>]
  For constant $D = Q$, its composite with the specialization of (6.6) gives (6.4) and identifies $m_V$ with
    $M_(V \, i)$. We still need to check that this single-step identification remains valid on each factor of a
    convolution.
  #emph[The two-step comparison.] First, for $D = Q times.square L$ the construction gives the commutative square
  (6.8)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$B_V \( Psi \( Q times.square L \) \)$])
  content((3.249, 0), [$Psi A_V \( Q times.square L \)$])
  content((0, -0.744), [$B_V \( Q \) ⊗ L_partial$])
  content((3.249, -0.744), [$Psi A_V \( Q \) ⊗ L_partial .$])
  line((1.062, 0), (2.385, 0), mark: (end: ">"))
  content((1.724, 0.2266), [#text(size: 0.73em)[$c_V \( Q times.square L \)$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.2741, -0.372), [#text(size: 0.73em)[$tilde.op$]])
  line((3.249, -0.2725), (3.249, -0.4715), mark: (end: ">"))
  content((3.523, -0.372), [#text(size: 0.73em)[$tilde.op$]])
  line((0.93, -0.744), (2.187, -0.744), mark: (end: ">"))
  content((1.559, -0.5173), [#text(size: 0.73em)[$c_V \( Q \) ⊗ upright("id")$]])
})
  On the puncture cover both routes are the same tensor comparison for $Q \, K_V$, tensored with the fiber of $L$,
    followed by the same push exchange. Finite rank allows that fiber through the direct images.
    The square is natural in every local-system endomorphism of $L$, including its monodromy:
    the latter commutes with the cyclic fundamental group of $Delta^(*)$ and is an endomorphism of $L$ itself.
  Now let $frak(H)_(i \; W \, V)^(\( 2 \))$ parametrize successive bounded modifications $P_0 arrow.r P_1 arrow.r
    P_2$ at the same $z in Delta$. The three enhancements at $x_i$ are independent;
    those at every other mark are transported throughout. Its integrand is $Q thin accent(times.square K, ̃)_W
    thin accent(times.square K, ̃)_V$. There are two useful pushes.
    The map $f$ forgetting $P_0$ and the first modification is the base change of the first output map.
    It factors by forgetting $eta_(0 i)$, then by a proper map.
    The map $g$ composing the modifications and forgetting $P_1$ factors by forgetting $eta_(1 i)$,
    then by a proper map: the bounded intermediate bundles form the closed convolution fiber in a proper
    Grassmannian bound, and the intermediate ordinary flag contributes a proper $G \/ B$-bundle.
    Choose a target bound containing all composites. Both factorizations are over the whole disc.
    Transport again determines the other marked-point enhancements.
  The integrand is relatively monodromic for both forgotten tori.
    For $f$ this is the single-step check, with the second kernel pulled back from the target.
    For $g$, $Q$ is independent of $eta_(1 i)$, and varying $eta_(1 i)$ varies the two enhancement differences
    inversely. Their universal local systems remain a local system in this variable;
    their ordinary-flag and Schubert conditions are independent of it.
    Lemma 18 gives the push, base-change, and projection-formula comparisons for $f$ and $g$.
  The unit convolution on $Delta^(*)$ and the specified monoidal map of $Z$ at zero induce
  $ b : A_V A_W \( Q \) arrow.r^tilde.op A_(V ⊗ W) \( Q \) \, wide b_0 :
    B_V B_W \( Q \) arrow.r^tilde.op B_(V ⊗ W) \( Q \) . $
  Tensor factors here are in action order. The essential compatibility is
  (6.9)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$B_V B_W \( Q \)$])
  content((3.051, 0), [$B_(V ⊗ W) \( Q \)$])
  content((0, -0.744), [$Psi \( A_V A_W \( Q \) \)$])
  content((3.051, -0.744), [$Psi A_(V ⊗ W) \( Q \) .$])
  line((0.864, 0), (2.187, 0), mark: (end: ">"))
  content((1.526, 0.2266), [#text(size: 0.73em)[$b_0$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((1.382, -0.372), [#text(size: 0.73em)[$c_V \( A_W \( Q \) \) thin B_V \( c_W \( Q \) \)$]])
  line((3.051, -0.2725), (3.051, -0.4715), mark: (end: ">"))
  content((3.759, -0.372), [#text(size: 0.73em)[$c_(V ⊗ W) \( Q \)$]])
  line((0.996, -0.744), (2.121, -0.744), mark: (end: ">"))
  content((1.558, -0.5173), [#text(size: 0.73em)[$Psi b$]])
})
  The left side is defined because (6.6) identifies $A_W \( Q \)$ with $Q times.square W_sigma \|_(Delta^(*))$,
    an allowed input for $c_V$.
  To prove the square, start on the two-step correspondence with the natural map from the twisted product of the
    nearby cycles of $Q \, K_W \, K_V$ to the nearby cycles of their twisted product.
    The local kernel comparison of [6] Lemma 6.3.2, together with exterior comparison for $Q$,
    makes it an isomorphism. Pushing first through $f$ identifies it with the left side of (6.9),
    by base change and projection formula. Pushing first through $g$ identifies it with $b_0$ followed by
    $c_(V ⊗ W) \( Q \)$: the specialized kernel map is precisely the monoidal map of $Z$ in the input frames.
    After the final output push these are equal, since tensor exchange, push exchange,
    and the intervening projection-formula squares are natural and compose.
    Every nonproper exchange in this assertion has one of the torus factorizations just checked.
    On the punctured family the same equality uses the compatible successive unit integrations specified after
    (6.1). Thus the square compares these particular maps, not merely two isomorphic outputs.
  #emph[Individual monodromy and trace.] Apply (6.8) with $L = W_sigma \|_(Delta^(*))$.
    The comparison $c_W \( Q \)$ sends $m_W$ to $M_(W \, i)$;
    naturality of the square in that local-system endomorphism carries it to the $W_(partial i)$ factor alone
    after applying $B_V$. For the outer factor, the left vertical identification in (6.8) is a projection-formula
    map, natural in endomorphisms of the kernel $Z \( V \)$. It therefore intertwines $m_V$ acting on
    $B_V \( Psi \( Q times.square L \) \)$ with $m_V$ on $B_V \( Q \)$ tensored with $upright("id")_(L_partial)$.
    The bottom arrow is $c_V \( Q \) ⊗ upright("id")$, which identifies this operator with $M_(V \, i)$ on its
    factor alone. More explicitly, let
  $ Phi_(V \, W) : B_V B_W \( Q \) arrow.r^tilde.op Q ⊗ V_(partial i) ⊗ W_(partial i) $
  be the successive comparison and eigenidentification, with the fixed symmetry placing the factors in action
    order. What we have proved is the pair of identities
  $ Phi_(V \, W) \( m_V star.op upright("id") \) & = \( upright("id")_Q ⊗ M_(V \, i) ⊗ upright("id") \) Phi_(V \, W) \,\
Phi_(V \, W) \( upright("id") star.op m_W \) & = \( upright("id")_Q ⊗ upright("id") ⊗ M_(W \, i) \) Phi_(V \, W) . $
  The square (6.9) and the original coherent eigenmaps identify this comparison with the one for $V ⊗ W$.
    Naturality in representation morphisms includes coevaluation and evaluation;
    the tensor unit is covered by (6.1). Iteration gives the same assertion for any number of factors.
  Consequently, applying (6.2) to $Q$ gives insertion and contraction of $V_(partial i)$ with $M_(V \, i)$ on its
    indicated factor, hence $"Tr" \( M_(V \, i) \) upright("id")_Q$.
    The right side of that local formula acts by $chi_V \( mu_i \)$ through the universal-unit identification.
    This proves (6.5) with all other enhancements retained. ◻
]

=== 6.4 Unipotence, nonvanishing, and the ordinary-level object <unipotence-nonvanishing-and-the-ordinary-level-object>

#thm([Proposition 6.4.])[
  #emph[Let $sigma$ be a continuous Zariski-dense geometric adic parameter on $U$,
    defined over a finite coefficient extension, with unipotent local monodromy at every $x_i$.
    If $cal(A)^(+)$ carries a nonzero lcc geometric adic coherent Hecke eigencomplex for $sigma$,
    then $cal(A)$ carries a nonzero locally constructible perverse geometric adic Hecke eigensheaf for $sigma$.
    It has all the unit, convolution, permutation, and fusion compatibilities of Definition 2,
    and nilpotent singular support. No boundary monodromy is required to be regular.]
] <desc:ordinary>

#proof[
  We extend the final step of [27] Proposition 7.5 to the full $T^s$-torsor.
    Take a nonzero perverse cohomology $Q$ of the given eigencomplex.
    Proposition 13 supplies its coherent eigenstructure, and Theorem 9 puts its singular support in the nilpotent
    cone. Lemma 17 and Betti comparison therefore allow us to apply Lemma 19 at every $x_i$.
    Since $M_(V \, i)$ is unipotent,
  #[#set math.equation(numbering: n => "(6.10)")
   $ chi_V \( mu_i \) = \( dim V \) upright("id")_Q wide upright("for every ") i \, V . $ <desc:character-dimension>]
  Restrict to one $H = T^s$ fiber and to a finite-dimensional stalk cohomology space $W$ there.
    Its commuting monodromies have joint generalized eigencharacters,
    each a tuple $\( a_1 \, dots.h \, a_s \) in hat(T) \( E \)^s$.
    Equation (6.10) says $chi_V \( a_i \) = chi_V \( 1 \)$ for all representations $V$.
    Characters span $cal(O) \( hat(T) \)^(W_G)$, where $W_G$ is the Weyl group, and separate semisimple classes.
    Thus $a_i$ has the same image as $1$ in the finite Weyl quotient;
    the fiber through $1$ is the singleton ${ 1 }$. Every $a_i = 1$,
    so all commuting monodromy operators along the whole $H$ are unipotent.
    This conclusion uses no regularity or fixed Jordan type.
  Return to adic sheaves and put $F = q_(!) Q$. The representable morphism $q$ is of finite type with fixed
    relative dimension, so $F$ is lcc. To prove $F eq.not 0$, choose a fiber $H =
    q^(- 1) \( a \)$ on which $Q$ has a nonzero stalk. Compute on its Betti realization,
    whose cohomology sheaves are finite-rank local systems. Let $j$ be the largest index with
    $cal(H)^j \( Q \|_H \) eq.not 0$, and let $W$ be its fiber.
    Write $r = dim H = s dim T$ and $Gamma_H = pi_1 \( H^(upright("an")) \)$. Then
  $ H_c^(2 r) \( H \, cal(H)^j \( Q \|_H \) \) tilde.eq W_(Gamma_H) \( - r \) eq.not 0 . $
  Indeed the finitely many commuting operators $M - 1$ are nilpotent,
    so the augmentation ideal $frak(a) subset E \[ Gamma_H \]$ acts nilpotently on this particular $W$.
    If its coinvariants vanished, $W = frak(a) W = frak(a)^2 W = dots.h.c = 0$, a contradiction.
    The displayed identification is Poincaré duality. In the compact-support hypercohomology spectral sequence
  $ E_2^(a \, b) = H_c^a \( H \, cal(H)^b \( Q \|_H \) \) arrow.r.double H_c^(a + b) \( H \, Q \|_H \) \, $
  the nonzero term $\( a \, b \) = \( 2 r \, j \)$ has no incoming differential,
    because higher cohomology sheaves vanish, and no outgoing differential,
    because $H_c^a$ vanishes for $a > 2 r$. It survives, proving nonzero compactly supported hypercohomology.
    Betti comparison and base change for $q_(!)$ identify this with a nonzero stalk of $F$.
  Finally the unramified Hecke correspondences transport all levels.
    The enhanced correspondence is cartesian from the ordinary one by $q$ using either projection,
    and has the same relative Satake kernel. Base change and projection formula give, for every leg set $I$,
  $ "Hecke"_(I \, \( V_i \)) \( q_(!) Q \) & tilde.eq \( q times upright("id")_(U^I) \)_(!)
    "Hecke"_(I \, \( V_i \)) \( Q \)\
 & tilde.eq q_(!) Q times.square times.square_(i in I) \( V_i \)_sigma . $
  On bounds the Hecke pushforwards are proper. The same cartesian description holds on successive-modification
    diagrams and after restriction to every collision diagonal; their natural exchanges compose.
    Thus these isomorphisms transport all the coherence diagrams,
    in the original relative normalization without a moving-leg shift.
    The nonzero lcc eigencomplex $F$ has a nonzero perverse cohomology.
    Apply Proposition 13 to obtain the asserted coherent eigensheaf and Theorem 9 for its nilpotent singular support. ◻
]

== 7 Construction in characteristic zero <con:section>

We now produce the enhanced eigencomplex required by Proposition 20.
  Starting with a parameter on a complex curve punctured at $s$ points,
  we attach one second component at all $s$ punctures and smooth the resulting nodes.
  The unramified correspondence supplies an eigencomplex on the smooth generic curve.
  Its nearby cycles produce the enhanced flags, and torus descent gives the ordinary-flag eigensheaf.
  We follow the construction of [27] Section 8, explaining the compatibility at several nodes and the nonvanishing
  on the specified component of the bundle stack.

=== 7.1 The unramified input <the-unramified-input>

We use the following precise input from the characteristic-zero correspondence.
  Its local constructibility conclusion is essential for applying nearby cycles.

#thm([Lemma 7.1.])[
  ([27] Lemma 8.1).  #emph[Let $C$ be a smooth projective connected curve over an algebraically closed field of
    characteristic zero, and let $G$ be simple and simply connected.
    A continuous $hat(G)$-local system $tau$ on $C$, defined over a finite extension of $bb(Q)_ell$ and with
    Zariski-dense image, admits a nonzero locally bounded constructible geometric $E$-adic eigencomplex on
    $"Bun"_G \( C \)$. Its Hecke eigenstructure has the relative Satake normalization and is coherent for all
    finite sets of legs, including collision maps.]
] <con:unramified>

We recall why the input includes these finiteness and coherence assertions;
  we use the full correspondence only through this lemma. The characteristic-zero theorem of Gaitsgory–Raskin
  identifies the automorphic nilpotent category with the ind-coherent category with nilpotent singular support on
  the restricted stack of $hat(G)$-local systems, compatibly with its quasi-coherent spectral action [16] Main
  Theorem 1.3.9(ii), Lemma 1.3.7, and Theorem 1.1.7. At a dense parameter the adjoint group $hat(G)$ has trivial
  centralizer. Consequently $H^0 \( C \, "ad" tau \) = 0$, and duality gives $H^2 \( C \, "ad" tau \) = 0$.
  The corresponding formal component is formally smooth, with no automorphisms;
  its ind-coherent skyscraper is nonzero, compact, and has zero obstruction-theoretic singular support [1]
  Proposition 3.7.2, Corollary 3.7.5, and Sections 21.1–21.2.
  Compactness is preserved by the correspondence and by inclusion of the automorphic nilpotent category [16]
  Theorem 1.1.7, and implies bounded constructibility on every finite-type smooth chart [1] Appendix F,
  Section F.2.2. Finally, the projection formula for the skyscraper evaluates every universal tensor local system
  at $tau$. Spectral linearity turns these identities into the entire Hecke eigenstructure, with its unit, tensor,
  permutation, and collision compatibilities [1] Main Theorem 14.3.2 and Section 14.3.3.
  The Satake labeling is fixed as in Section 2; the spectral point is labeled so that evaluation of $V$ is
  $V_tau$. This is the compact-object argument of [27] Lemma 8.1.

=== 7.2 Several nodes and their bundle types <several-nodes-and-their-bundle-types>

For the rest of this section $G = upright("SL")_n$. Let $X_1 \/
  bb(C)$ be a smooth projective connected curve of genus $g gt.eq 2$, with $s gt.eq 2$ distinct points $x_11 \,
  dots.h \, x_(1 s)$. Write $D_1 = sum_i x_(1 i)$ and $U_1 = X_1 \\ \| D_1 \|$,
  and fix a continuous dense parameter $sigma$ on $U_1$, defined over a finite coefficient field and unipotent at
  each puncture. Let $\( X_2 \, \( x_(2 i) \) \)$ be a second copy of the marked curve; put $D_2 =
  sum_i x_(2 i)$ and $U_2 = X_2 \\ \| D_2 \|$. Identify $x_(1 i)$ with $x_(2 i)$ for every $i$.
  The resulting connected nodal curve $C_0$ has two components and $s$ nodes. There is a projective smoothing

$ C arrow.r "Spec" bb(C) \[ \[ z \] \] $

with smooth connected geometric generic fiber and local equations $a b = z$ at all nodes.
  Indeed, deformations of a nodal curve are unobstructed, the node-smoothing parameters can be prescribed
  independently, and an ample line bundle lifts and algebraizes the formal deformation.
  Taking every parameter to have order one gives a regular semistable model.

Choose compatible roots $z_m^m = z$, and put $R_m = bb(C) \[ \[ z_m \] \]$.
  The balanced twisted model $C \( m \) \/ R_m$ has, at each node, the chart

#[#set math.equation(numbering: n => "(7.1)")
 $ ["Spec" R_m \[ u \, v \] \/ \( u v - z_m \) #scale(x: 120%, y: 120%)[\/] mu_m] \, wide a = u^m \, quad b =
   v^m \, quad zeta \( u \, v \) = \( zeta u \, zeta^(- 1) v \) . $ <con:node-chart>]

Here the positive action is on the $X_1$ branch. These charts are understood #emph[étale locally].
  In the regular semistable model the two components are transverse Cartier divisors; their local equations,
  after absorbing a unit, give étale maps to $a b = z$ near each node.
  Choose neighborhoods containing only their designated node, insert (7.1),
  and glue with the ordinary curve off the nodes. The charts coincide there with their coarse spaces,
  so the construction introduces no further stacky points. It is the balanced twisted-curve construction of [26]
  Theorems 1.9–1.10, Remark 1.11, and Proposition 2.2(ii), used in [27] Section 8.2.
  For $m divides m'$ the power maps $u_m = u_(m')^(m' \/ m)$ and $v_m =
  v_(m')^(m' \/ m)$ give compatible transition maps. Each $C \( m \)$ is proper and flat, tame,
  and has finite diagonal. Its special-fiber normalization consists of $X_1$ and $X_2$ with an $m$th root-stack
  point at each marking.

Fix a strictly dominant cocharacter $lambda in X_(*) \( T \)$ and an index $m$ such that

#[#set math.equation(numbering: n => "(7.2)")
 $ 0 < chevron.l alpha \, lambda chevron.r < m wide upright("for every positive root ") alpha . $ <con:alcove>]

At every node prescribe the type $lambda \|_(mu_m)$, using the common node generator in (7.1).
  Its centralizer is $T$: the eigenvalues in the standard representation are pairwise distinct by (7.2).
  Let $cal(B)_m$ be the open substack of $"Bun"_G \( C \( m \) \/ R_m \)$ obtained by deleting the other types in
  the closed fiber. There are finitely many types, and their weight multiplicities are locally constant in
  families on each residual gerbe, so this is an open substack.

The stack $cal(B)_m$ is smooth and locally of finite type over $R_m$.
  Algebraicity and local finite presentation follow from the Hom-stack theorem for a proper flat finitely
  presented source and target $B G$ with affine diagonal [18] Theorem 1.2.
  The obstruction group at a bundle $P$ is $H^2 \( C \( m \)_t \, "ad" P \)$,
  which vanishes because coarse pushforward on a tame curve is exact and the coarse space is one-dimensional.
  Its geometric generic fiber is the unlevelled bundle stack of the smooth generic curve.

Let $B^(-)$ be the opposite Borel containing $T$. Define

$ cal(A)_1^(+) = "Bun"_(G \, N_B \, D_1) \( X_1 \) \, wide cal(A)_2^(+) =
  "Bun"_(G \, R_u \( B^(-) \) \, D_2) \( X_2 \) . $

Thus the second component has opposite enhanced flags. The following description is the several-node form of [27]
  Lemma 8.2; the relation between twisted nodes and parahoric level also appears in [25] Section 2.3,
  Proposition 3.1.5, and Lemma 3.2.3.

#thm([Lemma 7.2.])[
  #emph[There is an equivalence
#[#set math.equation(numbering: n => "(7.3)")
 $ \( cal(B)_m \)_0 tilde.eq \[ \( cal(A)_1^(+) times cal(A)_2^(+) \) \/ T^s \] . $ <con:special-quotient>]

 The $i$th torus changes simultaneously the two frames at the $i$th gluing gerbe,
   expressed using its common node generator. A Hecke modification in $U_j$ pulls back to the usual modification
   on the $j$th factor.]
] <con:quotient>

#proof[
  We first calculate on a normalized root disc of the first component. Put $t = u^m$.
    Locally on a test scheme $S$, choose an equivariant frame in which inertia acts by $lambda \( zeta \)$.
    Frames lift from the origin through infinitesimal neighborhoods by smoothness and exactness of
    $mu_m$-invariants. Their changes satisfy
  $ h \( zeta u \) = lambda \( zeta \) h \( u \) lambda \( zeta \)^(- 1) \, wide h \( 0 \) in T . $
  In the invariant punctured-disc frame the same change is $g \( t \) =
    lambda \( u \)^(- 1) h \( u \) lambda \( u \)$. For a positive root $alpha$ and $j = chevron.l alpha \,
    lambda chevron.r$, its positive and negative root series transform as
  #[#set math.equation(numbering: n => "(7.4)")
   $ u^j a_alpha \( u^m \) mapsto a_alpha \( t \) \, wide u^(m - j) b_alpha \( u^m \) mapsto t b_alpha \( t \) .
     $ <con:iwahori-series>]
  Toral series are series in $t$. These are exactly the series in the Iwahori group
  $ I_B \( S \) = { g in G \( cal(O)_S \[ \[ t \] \] \) : g \( 0 \) in B } . $
  For completeness the root calculation identifies the whole group:
    $h \( 0 \) in T$ puts $h$ in the formal big cell $R_u \( B^(-) \) T R_u \( B \)$;
    the formulas in (7.4) transform its root-ordered factorization into that of $I_B$.
    Conversely reduction of an Iwahori element belongs to $B$, hence to that big cell,
    and the inverse formulas give a regular equivariant frame change.
  Gluing to the component off its marked points therefore turns a bundle of this root type into an ordinary
    $B$-level bundle. Evaluation $h mapsto h \( 0 \)$ becomes the torus projection $I_B arrow.r T$.
    Its kernel is the inverse image of $N_B$ under $I_B arrow.r B$,
    so identifying the gerbe restriction with the fixed type torsor is precisely the extra datum of an enhanced flag.
  On the second branch a positive coordinate generator is $eta = zeta^(- 1)$.
    Its fiber action is $lambda \( eta^(- 1) \)$, so the same calculation uses $- lambda$ and gives $B^(-)$.
    In the common node generator both fixed type torsors have automorphism group $T$.
    A bundle on the nodal curve consists of its bundles on the normalization and an identification at every pair
    of residual gerbes. Choosing frames of both gerbe restrictions makes that identification automatic;
    changing the two frames simultaneously leaves it unchanged.
    Applying this construction at the $s$ disjoint pairs gives (7.3).
    Multiple nodes between the same components impose no additional relation:
    nodal descent specifies one independent gluing isomorphism at each node.
    With reversed right-action conventions the same quotient would have inversion on its second torus factor;
    here we use simultaneous gerbe frames.
  A modification away from the markings transports the gerbe frames and their identifications.
    The corresponding Hecke diagram therefore pulls back to the diagram on the indicated factor. ◻
]

At a leg in the smooth scheme locus of $C \( m \)$, all node data lie outside the modification disc.
  Disc gluing gives the usual split affine-Grassmannian models:
  the bounded maps are proper, the exact-position maps to bundle and leg are smooth,
  and all modifications preserve the chosen types. The special leg locus is $U_1 union.sq U_2$.
  Thus the family satisfies the geometric hypotheses of Theorem 10 and Proposition 4,
  including successive modifications and collisions. Its special cone and dimension bound are those of the torus
  quotient in Section 3.

=== 7.3 A parameter on the smoothing <a-parameter-on-the-smoothing>

We must now extend $sigma$ across the smoothing. The second copy carries one parameter whose boundary monodromies
  are simultaneously inverse to those on the first. This is where using an orientation-reversing homeomorphism of
  the entire marked surface is essential.

Choose such a homeomorphism $f : U_2^(upright("an")) arrow.r U_1^(upright("an"))$ carrying the punctures in order.
  It induces an isomorphism on profinite fundamental groups by Riemann existence.
  If $rho_1$ represents $sigma$, put $rho_2 = rho_1 compose hat(f)_(*)$.
  A positive loop $c_(2 i)$ goes to a conjugate of $c_(1 i)^(- 1)$.
  Choose paths to the boundary fibers so that, in these identifications,

#[#set math.equation(numbering: n => "(7.5)")
 $ rho_2 \( c_(2 i) \) = rho_1 \( c_(1 i) \)^(- 1) wide \( 1 lt.eq i lt.eq s \) . $ <con:boundary-inversion>]

The choices are made in the full compact image, before taking finite quotients.
  The homeomorphism need not be algebraic: Riemann existence algebraizes its finite covers.
  Figure 2 records the two distinct inversions, of boundary loops and of the second branch coordinate,
  that make gluing possible.

The index $m$ remains fixed for the bundle type and the eventual nearby-cycle calculation on $cal(B)_m$.
  To construct the parameter we will instead use divisible indices $m_r$,
  large enough to kill the finite inertia images at stage $r$.
  One fixed root index need not kill the entire adic boundary monodromy.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((-2.5, 0), radius: (1, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((2.5, 0), radius: (1, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((-2.65, 0), [#text(size: 9pt)[$X_1$]])
  content((2.65, 0), [#text(size: 9pt)[$X_2$]])
  circle((-1.72, 1), radius: 0.05644, fill: black, stroke: none)
  circle((1.72, 1), radius: 0.05644, fill: black, stroke: none)
  line((-1.72, 1), (1.72, 1), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((-1.32, 1), [#text(size: 9pt)[$x_11$]], anchor: "south", padding: 0.1176cm)
  content((1.32, 1), [#text(size: 9pt)[$x_21$]], anchor: "south", padding: 0.1176cm)
  content((0, 1), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B mu_m$]]])])
  circle((-1.72, -1), radius: 0.05644, fill: black, stroke: none)
  circle((1.72, -1), radius: 0.05644, fill: black, stroke: none)
  line((-1.72, -1), (1.72, -1), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((-1.32, -1), [#text(size: 9pt)[$x_1s$]], anchor: "south", padding: 0.1176cm)
  content((1.32, -1), [#text(size: 9pt)[$x_2s$]], anchor: "south", padding: 0.1176cm)
  content((0, -1), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B mu_m$]]])])
  content((0, 0), [#text(size: 9pt)[$dots.v$]])
  content((-2.5, -2.1), [#text(size: 9pt)[positive branch $u$#linebreak()enhanced $B$-flags]])
  content((2.5, -2.1), [#text(size: 9pt)[negative branch $v$#linebreak()enhanced $B^-$-flags]])
  bezier((1.5, 2.05), (-1.5, 2.05), (0.3556, 2.293), (-0.3556, 2.293), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-5.551e-17, 2.232), [#text(size: 9pt)[$f$ reverses orientation#linebreak()at every boundary]], anchor: "south", padding: 0.1176cm)
  content((0, -3.12), [#text(size: 9pt)[$zeta :(u,v) arrow.r.bar ( zeta u, zeta^(-1)v)$ $rho_2(c_2i)= rho_1(c_1i)^(-1)$#linebreak() $ ( cal(B)_m)_0 tilde.eq [( cal(A)_1^+ times cal(A)_2^+)"/"T^s]$]])
})],
  caption: [Figure 2: Normalization and gluing at all $s$ nodes (schematically). The ovals are the coarse curves of the normalized root stacks. The dashed pairs are identified, not extra curve components. For bundle types the gerbes have fixed order $m$ and each pair contributes one frame-change torus to the displayed quotient. For parameter covers at stage $r$, replace $m$ by $m_r$ and $rho_j$ by its finite quotient at that stage. The inverse boundary actions then agree on the gluing gerbe, because its common generator acts oppositely on the two branch coordinates. ],
) <con:gluing-figure>

#thm([Lemma 7.3.])[
  #emph[Put $K_1 = overline(bb(C) \( \( z \) \))$ and let $C_(K_1)$ be the smooth geometric generic curve.
    There is a continuous unramified parameter $rho_(K_1)$ on $C_(K_1)$ with the same compact image as $rho_1$.
    Its lattice reductions specialize on $U_1 union.sq U_2$ to those of $rho_1$ and $rho_2$,
    with the tensor compatibilities of Proposition 4.]
] <con:parameter>

#proof[
  Let $H = rho_1 \( pi_1^(upright("et")) \( U_1 \) \) subset caron(G) \( L' \)$ be the compact image,
    for a finite coefficient field $L'$. Choose a cofinal decreasing sequence of open normal subgroups $H_r$ and
    put $Q_r = H \/ H_r$. One obtains such a sequence from congruence kernels of an $H$-stable lattice in a
    faithful representation. Both $U_j$ carry connected $Q_r$-torsors.
    Choose indices $m_r$ divisible by the fixed $m$ and by the orders of all their boundary images,
    with $m_r divides m_(r + 1)$.
  By the root-stack description of tame covers [22] Proposition A.10,
    the torsors extend to finite étale torsors on the normalization of $C \( m_r \)_0$.
    At each pair of gerbes their actions agree: the node identifies a positive generator on the first branch with
    a negative generator on the second, and (7.5) cancels that inversion.
    Reduce the chosen boundary-fiber identifications modulo $H_r$ to identify these restrictions.
    They are compatible at every level of the tower. The torsors glue to a finite étale $Q_r$-torsor $Y_(r \, 0)$
    on $C \( m_r \)_0$. Locally this is nodal gluing of finite étale algebras with identified fibers:
    on the completed branch discs the covers are constant, with the same $mu_(m_r)$-action at the origin,
    so their gluing is constant on the nodal cover and descends equivariantly.
    This also proves compatibility under the power maps of the twisted models.
  Proper henselian invariance of finite étale covers lifts $Y_(r \, 0)$ to a torsor $Y_r$ over $C \( m_r \)$ [28]
    Theorem 4.5. Its hypotheses hold because the models are proper with finite diagonal over complete henselian
    traits. Full faithfulness lifts the group actions, transition maps after pullback to divisible models,
    and all relations between them. All generic fibers become $C_(K_1)$.
    Choose a base section specializing in $U_1$ and compatible points of the torsor fibers above it;
    finite étale covers of this strictly henselian section are constant.
    The tower therefore gives a continuous homomorphism
  #[#set math.equation(numbering: n => "(7.6)")
   $ rho_(K_1) : pi_1^(upright("et")) \( C_(K_1) \) arrow.r "proj lim"_r Q_r = H . $ <con:generic-homomorphism>]
  We check its image. Each $Y_(r \, 0)$ is connected, since its two normalization torsors are connected and are
    glued along nonempty fibers. The total torsor $Y_r$ is proper and flat with reduced geometric fibers.
    Its tame coarse space is flat as well: locally its coordinate ring is the $mu_(m_r)$-invariant direct summand
    of an $R_(m_r)$-flat ring, and invariant formation commutes with base change.
    The connected reduced proper special fiber has $H^0 \( cal(O) \) = bb(C)$.
    Semicontinuity, applied to the coarse space, gives $h^0 \( Y_(r \, K_1) \, cal(O) \) = 1$,
    so the geometric generic torsor is connected. Thus (7.6) surjects onto every $Q_r$.
    Its image is compact and therefore closed in $H$; surjectivity to this cofinal system makes it all of $H$.
    In particular the parameter remains Zariski dense.
  For an algebraic representation of $caron(G)$, enlarge its finite coefficient field if necessary and choose an
    $H$-stable lattice. Each finite reduction factors through some $Q_r$.
    Its lifted torsor supplies a lisse extension over the smooth leg locus after the corresponding finite trait
    extension, with the specified special reductions on both components.
    All twisted models agree away from the nodes. The tower thus gives the required tensor compatibilities;
    maps between lattices are compared after clearing denominators.
    As allowed in Proposition 4, different reductions may require different finite trait extensions. ◻
]

=== 7.4 A nonzero specialization and descent <a-nonzero-specialization-and-descent>

Lemma 21 now supplies a nonzero locally bounded constructible eigencomplex $F$ on $"Bun"_G \( C_(K_1) \)$ with
  parameter $rho_(K_1)$. Take its geometric nearby cycles on the fixed model $cal(B)_m$.
  Propositions 3 and 4, with the geometry and lattice extensions just verified,
  give a locally bounded constructible eigencomplex $Psi F$ on $\( cal(B)_m \)_0$,
  for legs on both $U_1$ and $U_2$. To use it we must prove nonvanishing on precisely this prescribed-type fiber.

Choose a point of the product in (7.3) and lift its image to a reference bundle $P_0$ over $R_m$.
  This is possible by smoothness of $cal(B)_m$: lift a point in a smooth chart over the henselian trait.
  Choose also a section $y$ of the smooth scheme locus, disjoint from the nodes.
  Since $F$ is nonzero, some $K_1$-valued bundle $P$ has nonzero stalk.
  Both $P$ and $\( P_0 \)_(K_1)$ are trivial on the affine curve $C_(K_1) \\ { y_(K_1) }$.
  Indeed, a rank-$n$ projective module over a Dedekind domain is the sum of a free rank-$\( n - 1 \)$ module and
  its determinant; an $upright("SL")_n$-bundle has trivial determinant,
  and its frame can be adjusted to respect the chosen determinant trivialization.

An isomorphism off $y_(K_1)$ exhibits $P$ as a modification of $\( P_0 \)_(K_1)$ in a finite Schubert bound.
  Its point is defined over a finite extension of the trait’s fraction field.
  Properness of the bounded Hecke space over the fixed input $P_0$ and leg $y$ extends this modification over the
  resulting trait. Its output still has the prescribed types, because the modification is away from all nodes.
  Lift this section to a finite-type smooth chart through its special value.
  Its generic stalk is the chosen nonzero stalk, so the closure of the generic nonzero-stalk locus on this chart
  meets the special fiber. Theorem 10 therefore gives

#[#set math.equation(numbering: n => "(7.7)")
 $ Psi F eq.not 0 . $ <con:nonzero-nearby>]

Here finite extensions cause no change to geometric nearby cycles, as in Proposition 3.

Pull back $Psi F$ ordinarily along the smooth surjection $cal(A)_1^(+) times
  cal(A)_2^(+) arrow.r \( cal(B)_m \)_0$. Its pullback is nonzero.
  By local constructibility choose a $bb(C)$-valued point $\( a_1 \, a_2 \)$ with nonzero stalk and restrict to
  $cal(A)_1^(+) times { a_2 }$. This gives a nonzero locally bounded constructible complex $F_1^(+)$ on
  $cal(A)_1^(+)$. By Lemma 22, the first component’s Hecke correspondences are the base changes of those
  downstairs and act on the first factor alone. Proper base change on each bound makes both pullbacks compatible
  with the full coherent Hecke system. Thus $F_1^(+)$ has eigenvalue $sigma$.
  These are ordinary pullbacks; perversity will be obtained after descent.

#thm([Proposition 7.4.])[
  #emph[Let $X \/ bb(C)$ be a smooth projective connected curve of genus at least two, with $s gt.eq
    2$ distinct marked points, divisor $D$ their sum, and $G = upright("SL")_n$.
    Let $sigma$ be a continuous dense $caron(G)$-parameter on their complement,
    defined over a finite coefficient extension, with unipotent monodromy at every marking.
    Then $"Bun"_(G \, B \, D) \( X \)$ carries a nonzero locally constructible perverse geometric $E$-adic
    eigensheaf with eigenvalue $sigma$, nilpotent singular support,
    and the full coherent Hecke system in relative Satake normalization.]
] <con:charzero>

#proof[
  The construction gives $F_1^(+)$ on the enhanced stack for $X$.
    Proposition 20 applies because the parameter is dense and each boundary monodromy is unipotent,
    and gives a nonzero perverse eigenobject on the ordinary-flag stack.
    Its singular support lies in the required cone by Theorem 9. No regularity of any local nilpotent is used. ◻
]

== 8 Lifting the parameter and specializing to characteristic $p$ <lift:section>

We return to the curve and parameter of Theorem 1. The remaining step is to lift the marked curve and its
  parameter to characteristic zero, apply Proposition 24, and specialize the resulting perverse eigensheaf.
  We retain the full inertia homomorphisms in the lift, including when some $N_i$ vanish.

Let $R = W \( k \)$. This is an excellent complete strictly henselian discrete valuation ring,
  and $ell$ is invertible in $R$. There is a smooth projective lift with disjoint marked sections

$ \( cal(X) \, frak(x)_1 \, dots.h \, frak(x)_s \) arrow.r "Spec" R $

of $\( X \, x_1 \, dots.h \, x_s \)$. Indeed, the obstruction group for the marked curve is
  $H^2 \( X \, T_X \( - D \) \) = 0$; an ample line bundle also lifts,
  and formal algebraization gives the projective family. Use the split models of $G$ and $B$ over $R$, and put

$ cal(D) = sum_i frak(x)_i \, wide cal(U) = cal(X) \\ \| cal(D) \| \, wide K_0 = overline("Frac" \( R \)) . $

#thm([Lemma 8.1.])[
  #emph[The parameter $rho$ lifts to a continuous parameter $rho_(K_0) :
    pi_1^(upright("et")) \( cal(U)_(K_0) \) arrow.r caron(G) \( L \)$ with the same compact image.
    After compatible choices of boundary fibers and prime-to-$p$ roots of unity,
    its full inertia homomorphism at $frak(x)_i$ is
#[#set math.equation(numbering: n => "(8.1)")
 $ rho_(K_0) \( gamma \) = exp #scale(x: 120%, y: 120%)[\(] t_(ell \, i) \( gamma \) N_i
   #scale(x: 120%, y: 120%)[\)] . $ <lift:inertia>]

 In particular every other prime factor of characteristic-zero inertia acts trivially.
   Its lattice reductions extend lisse over $cal(U)$ and specialize to those of $rho$,
   with the tensor compatibilities of Proposition 4.]
] <lift:parameter>

#proof[
  We use the finite-cover lifting argument of [27] Section 8.5, Lemma 8.4, applied at all the disjoint markings.
    Let $H = rho \( pi_1^(upright("et")) \( U \) \)$, choose a cofinal system $Q_r = H \/ H_r$ as in Lemma 23,
    and let $Y_r^compose$ be the corresponding connected finite étale torsor on $U$.
    At every marking its inertia image has $ell$-power order,
    since the given inertia homomorphism factors through $bb(Z)_ell$.
    Choose $d_r = ell^(e_r)$ divisible by all these orders at stage $r$, with $d_r divides d_(r + 1)$.
    The torsor extends to the proper root stack
  $ X_r = X #scale(x: 120%, y: 120%)[\(] root(d_r, x_1) \, dots.h \, root(d_r, x_s) #scale(x: 120%, y: 120%)[\)] . $
  This is the root-stack description of tame covers [22] Proposition A.10. The corresponding relative root stack
  $ cal(X)_r = cal(X) #scale(x: 120%, y: 120%)[\(] root(d_r, frak(x)_1) \, dots.h \,
    root(d_r, frak(x)_s) #scale(x: 120%, y: 120%)[\)] $
  is smooth, proper, and tame with finite diagonal over $R$, since $d_r$ is invertible in $R$.
  Proper henselian invariance lifts the finite étale torsors to $cal(X)_r$ [28] Theorem 4.5;
    full faithfulness lifts their group actions, transition maps after pullback to divisible root stacks,
    and all compatibility relations. See also [22] Theorem A.11 and Corollaries A.12–A.13.
    Restricting to $cal(U)$ and then to its geometric generic fiber, and choosing compatible base points, produces
  $ rho_(K_0) : pi_1^(upright("et")) \( cal(U)_(K_0) \) arrow.r H . $
  Only the root indices must be prime to $p$; the finite group orders $\| Q_r \|$ need not be.
  The special torsor on $X_r$ is connected: its inverse image of $U$ is dense and is the connected torsor
    $Y_r^compose$. It is smooth and geometrically reduced. The proper flat tame-coarse-space argument in Lemma 23
    gives connected geometric generic root-stack torsors. A smooth connected curve stack is irreducible;
    removing the inverse images of the finitely many marked gerbes therefore leaves it connected.
    Thus $rho_(K_0)$ surjects onto every $Q_r$, and its compact image is all of $H$.
    In particular the lifted parameter is Zariski dense.
  To determine inertia, trivialize the normal line of each marked section over the strictly henselian trait.
    Its root gerbes are then $B mu_(d_r)$, with compatible atlases as $r$ varies.
    Restricting the lifted torsor to this gerbe and pulling to its atlas gives a constant finite torsor together
    with its $mu_(d_r)$-action. Full faithfulness of lifting retains exactly the special-fiber action.
    Compatible prime-to-$p$ roots of unity identify the generic and special generators.
    One may choose the boundary frames compatibly throughout the tower:
    the possible frames form an inverse system of nonempty finite fibers with surjective transition maps.
    At every stage, generic inertia consequently factors through $mu_(d_r)$ and agrees with the original inertia
    map. Passing to the inverse limit proves (8.1) for the whole inertia group.
    In particular its $bb(Z)_a \( 1 \)$ factor acts trivially for every prime $a eq.not ell$, including $a = p$.
    This records the full peripheral compatibility, rather than only the conjugacy class of one monodromy element;
    compare [22] Lemma 3.5.
  Finally, each finite reduction of an $H$-stable lattice in an algebraic representation factors through some
    $Q_r$. The lifted torsor restricted to $cal(U)$ is lisse and has the required special fiber.
    Tensor products and maps between the resulting systems come from the same tower,
    with denominators cleared when comparing lattices. This proves the asserted lattice extension condition. ◻
]

We may identify $K_0$ abstractly with $bb(C)$. Indeed $k$ is countable and $W \( k \)$ is a set of sequences in
  $k$, while it contains $bb(Z)_p$. Its cardinality, and hence that of $K_0$, is the continuum.
  An uncountable algebraically closed characteristic-zero field has transcendence degree equal to its cardinality,
  so $K_0$ and $bb(C)$ are isomorphic. This identification is only of the geometric base fields;
  the adic topology of the coefficient field and continuity of the parameter remain unchanged.

#proof[
  By Lemma 25 and Proposition 24, the ordinary-flag bundle stack over $K_0$ has a nonzero locally constructible
    perverse eigenobject $M_(K_0)$ with eigenvalue $rho_(K_0)$. Put
  $ cal(A) = "Bun"_(G \, B \, cal(D)) \( cal(X) \/ R \) \, wide M = Psi M_(K_0) quad upright("on ") cal(A)_k =
    cal(A) . $
  The stack $cal(A)$ is smooth over $R$: the unlevelled bundle stack is smooth by vanishing of the degree-two
    obstruction groups, and its flag fibers are products of the smooth variety $G \/ B$.
    Proposition 3 implies that $M$ is locally constructible and perverse.
    Thus for a smooth finite-type chart $f : S arrow.r cal(A)$ of relative dimension $d$,
    the complex $f^(*) M \[ d \]$ is bounded constructible and perverse.
    These are geometric nearby cycles, without taking inertia invariants.
  The Hecke geometry on $cal(U)$ is the split smooth-leg geometry of Section 2.
    The lattice extensions in Lemma 25 and Proposition 4 give
  #[#set math.equation(numbering: n => "(8.2)")
   $ "Hecke"_(I \, \( V_i \)) \( M \) tilde.eq M times.square #scale(x: 180%, y: 180%)[\(]
     times.square_(i in I) \( V_i \)_rho #scale(x: 180%, y: 180%)[\)] wide upright("on ") cal(A) times
     U^I . $ <lift:final-eigenmaps>]
  This is the relative Satake normalization $E \[ d_lambda \] \( d_lambda \/ 2 \)$, with no moving-leg shift.
    The isomorphisms are natural in all $V_i$ and retain the unit, convolution, permutation,
    and fusion compatibilities on every collision diagonal, since specialization transports the coherent system itself.
  It remains to show that $M$ is nonzero. Local constructibility gives a $K_0$-valued point
    $\( P \, \( beta_i \) \)$ of the geometric generic bundle stack at which $M_(K_0)$ has nonzero stalk.
    Choose a reference bundle $P_0$ on $cal(X)$, for example the trivial bundle.
    A point of $U$ lifts to a section $y$ of $cal(U)$ by smoothness and henselianity.
    On the affine curve $cal(X)_(K_0) \\ { y_(K_0) }$, both $P$ and $\( P_0 \)_(K_0)$ are trivial by the
    determinant argument used in Section 7. Hence $P$ is a modification of $\( P_0 \)_(K_0)$ at $y_(K_0)$ in some
    finite Schubert bound. After a finite trait extension defining the data,
    properness of the bounded unlevelled Hecke space extends the modification and thus the bundle.
    Each flag $beta_i$ then extends by properness of the associated $G \/ B$-bundle over the marked section.
    We have extended the original point to the relative ordinary-flag stack.
  Lift this section to a finite-type smooth chart through its special value,
    after a further henselian lift if necessary. Its generic stalk is still nonzero,
    so the closure of the generic nonzero-stalk locus meets the special fiber on that chart.
    Theorem 10 forces $Psi M_(K_0) eq.not 0$. Its hypotheses hold by the Hecke geometry above,
    the lattice extensions of Lemma 25, and the special-fiber geometry of Section 3.
    Geometric nearby cycles are unchanged by the finite trait extensions used in this argument.
  Finally, Theorem 9, applied to (8.2), gives $"SS" \( M \) subset Lambda$ on every smooth chart.
    At ordinary flag level, Definition 5 and its cotangent description identify this with the cone of generically
    nilpotent Higgs fields
  $ phi.alt in H^0 #scale(x: 120%, y: 120%)[\(] X \, "ad" \( P \) ⊗ omega_X \( D \)
    #scale(x: 120%, y: 120%)[\)] \, wide "Res"_(x_i) phi.alt in "Lie" R_u \( B_(beta_i) \)
    quad \( 1 lt.eq i lt.eq s \) . $
  The condition $p > n$ gives precisely the characteristic hypotheses used in that geometry and detection.
    The nonzero sheaf $M$ has all the asserted properties. Every parameter and sheaf used in the construction is
    geometric; no Frobenius structure is required. ◻
]

#heading(level: 1)[References]
#bibitem([1])[D. Arinkin, D. Gaitsgory, D. Kazhdan, S. Raskin, N. Rozenblyum, and Y.
  Varshavsky, #emph[The stack of local systems with restricted variation and geometric Langlands theory with
  nilpotent singular support], preprint, 2020, revised 2022,
  #link("https://arxiv.org/abs/2010.01906v2")[arXiv:2010.01906v2].]
#bibitem([2])[S. Arkhipov and R. Bezrukavnikov, #emph[Perverse sheaves on affine flags and Langlands dual group],
  with an appendix by R. Bezrukavnikov and I. Mirković, Israel J. Math. #strong[170] (2009), 135--183.
  #link("https://doi.org/10.1007/s11856-009-0024-y")[doi:10.1007/s11856-009-0024-y].]
#bibitem([3])[O. Barrett, #emph[The singular support of an $ell$-adic sheaf], Tunisian J. Math.
  #strong[6] (2024), no.~4, 703--734. #link("https://doi.org/10.2140/tunis.2024.6.703")[doi:10.2140/tunis.2024.6.703].]
#bibitem([4])[A. Beilinson, #emph[Constructible sheaves are holonomic], Selecta Math.
  (N.S.) #strong[22] (2016), no.~4, 1797--1819.
  #link("https://doi.org/10.1007/s00029-016-0260-z")[doi:10.1007/s00029-016-0260-z].]
#bibitem([5])[A. Beilinson and V. Drinfeld, #emph[Quantization of Hitchin's integrable system and Hecke
  eigensheaves], preprint. #link("https://math.uchicago.edu/~drinfeld/langlands/QuantizationHitchin.pdf")[Authors'
  manuscript].]
#bibitem([6])[G. Dhillon and J. Taylor, #emph[The universal monodromic Arkhipov--Bezrukavnikov equivalence],
  preprint, 2025, #link("https://arxiv.org/abs/2501.14156v1")[arXiv:2501.14156v1].]
#bibitem([7])[G. Dhillon and J. Taylor, #emph[Tame local Betti geometric Langlands], preprint, 2025,
  #link("https://arxiv.org/abs/2501.14157v1")[arXiv:2501.14157v1].]
#bibitem([8])[V. G. Drinfeld, #emph[Two-dimensional $ell$-adic representations of the fundamental group of a curve
  over a finite field and automorphic forms on $"GL" \( 2 \)$], Amer. J. Math.
  #strong[105] (1983), no.~1, 85--114. #link("https://doi.org/10.2307/2374382")[doi:10.2307/2374382].]
#bibitem([9])[J. Færgeman, #emph[Motivic realization of rigid $G$-local systems on curves and tamely ramified
  geometric Langlands], preprint, 2024, #link("https://arxiv.org/abs/2405.18268v2")[arXiv:2405.18268v2].]
#bibitem([10])[G. Faltings, #emph[Stable $G$-bundles and projective connections], J. Algebraic Geom.
  #strong[2] (1993), no.~3, 507--568.]
#bibitem([11])[E. Frenkel, D. Gaitsgory, and K. Vilonen, #emph[On the geometric Langlands conjecture], J. Amer.
  Math. Soc. #strong[15] (2002), no.~2, 367--417.
  #link("https://doi.org/10.1090/S0894-0347-01-00388-5")[doi:10.1090/S0894-0347-01-00388-5].]
#bibitem([12])[D. Gaitsgory, #emph[Construction of central elements in the affine Hecke algebra via nearby
  cycles], Invent. Math. #strong[144] (2001), no.~2, 253--280.
  #link("https://doi.org/10.1007/s002220100122")[doi:10.1007/s002220100122].]
#bibitem([13])[D. Gaitsgory, #emph[On a vanishing conjecture appearing in the geometric Langlands correspondence],
  Ann. of Math. (2) #strong[160] (2004), no.~2, 617--682.
  #link("https://doi.org/10.4007/annals.2004.160.617")[doi:10.4007/annals.2004.160.617].]
#bibitem([14])[D. Gaitsgory and S. Raskin, #emph[Proof of the geometric Langlands conjecture I:
  construction of the functor], preprint, 2024, revised 2025,
  #link("https://arxiv.org/abs/2405.03599v3")[arXiv:2405.03599v3].]
#bibitem([15])[D. Gaitsgory and S. Raskin, #emph[Proof of the geometric Langlands conjecture V:
  the multiplicity one theorem], preprint, 2024, revised 2026,
  #link("https://arxiv.org/abs/2409.09856v3")[arXiv:2409.09856v3].]
#bibitem([16])[D. Gaitsgory and S. Raskin, #emph[Geometric Langlands in positive characteristic from
  characteristic zero], preprint, 2025, #link("https://arxiv.org/abs/2508.02237v1")[arXiv:2508.02237v1].]
#bibitem([17])[V. Ginzburg, #emph[The global nilpotent variety is Lagrangian], Duke Math. J.
  #strong[109] (2001), no.~3, 511--519.
  #link("https://doi.org/10.1215/S0012-7094-01-10933-2")[doi:10.1215/S0012-7094-01-10933-2].]
#bibitem([18])[J. Hall and D. Rydh, #emph[Coherent Tannaka duality and algebraicity of Hom-stacks],
  Algebra Number Theory #strong[13] (2019), no.~7, 1633--1675.
  #link("https://doi.org/10.2140/ant.2019.13.1633")[doi:10.2140/ant.2019.13.1633].]
#bibitem([19])[D. Hansen and P. Scholze, #emph[Relative perversity], Commun. Amer. Math. Soc.
  #strong[3] (2023), 631--668. #link("https://doi.org/10.1090/cams/21")[doi:10.1090/cams/21].]
#bibitem([20])[G. Laumon, #emph[Correspondance de Langlands géométrique pour les corps de fonctions], Duke Math.
  J. #strong[54] (1987), no.~2, 309--359.
  #link("https://doi.org/10.1215/S0012-7094-87-05418-4")[doi:10.1215/S0012-7094-87-05418-4].]
#bibitem([21])[G. Laumon, #emph[Un analogue global du cône nilpotent], Duke Math. J.
  #strong[57] (1988), no.~2, 647--671.
  #link("https://doi.org/10.1215/S0012-7094-88-05729-8")[doi:10.1215/S0012-7094-88-05729-8].]
#bibitem([22])[M. Lieblich and M. Olsson, #emph[Generators and relations for the étale fundamental group],
  Pure Appl. Math. Q. #strong[6] (2010), no.~1, 209--243.
  #link("https://doi.org/10.4310/PAMQ.2010.v6.n1.a6")[doi:10.4310/PAMQ.2010.v6.n1.a6].]
#bibitem([23])[I. Mirković and K. Vilonen, #emph[Geometric Langlands duality and representations of algebraic
  groups over commutative rings], Ann. of Math. (2) #strong[166] (2007), no.~1, 95--143.
  #link("https://doi.org/10.4007/annals.2007.166.95")[doi:10.4007/annals.2007.166.95].]
#bibitem([24])[D. Nadler and Z. Yun, #emph[Spectral action in Betti geometric Langlands], Israel J. Math.
  #strong[232] (2019), 299--349. #link("https://doi.org/10.1007/s11856-019-1871-9")[doi:10.1007/s11856-019-1871-9].]
#bibitem([25])[D. Nadler and Z. Yun, #emph[Automorphic gluing functor in Betti geometric Langlands], preprint,
  2021, revised 2023, #link("https://arxiv.org/abs/2105.12318v3")[arXiv:2105.12318v3].]
#bibitem([26])[M. C. Olsson, #emph[\(Log) twisted curves], Compos. Math. #strong[143] (2007), no.~2, 476--494.
  #link("https://doi.org/10.1112/S0010437X06002442")[doi:10.1112/S0010437X06002442].]
#bibitem([27])[OpenAI, #emph[Constructible tame Hecke eigensheaves in positive characteristic],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Constructible-tame-Hecke-eigensheaves-in-positive-characteristic-October-5-2026/constructible-tame-hecke-eigensheaves-positive-characteristic.pdf")[OAI:Constructible-tame-Hecke-eigensheaves-in-positive-characteristic-October-5-2026],
  2026.]
#bibitem([28])[D. Rydh, #emph[Compactification of stacks and extending stackiness across the boundary], preprint,
  September~16, 2014. #link("https://davidrydh.se/papers/compactification-survey20140916.pdf")[Author's manuscript].]
#bibitem([29])[S. Shen, #emph[Tamely ramified geometric Langlands correspondence in positive characteristic], Int.
  Math. Res. Not. IMRN #strong[2024], no.~7, 6176--6208.
  #link("https://doi.org/10.1093/imrn/rnae005")[doi:10.1093/imrn/rnae005].]
#bibitem([30])[The Stacks Project Authors, #emph[Stacks Project], 2026. #link("https://stacks.math.columbia.edu").]
#bibitem([31])[N. uit de Bos, #emph[An explicit geometric Langlands correspondence for the projective line minus
  four points], Int. Math. Res. Not. IMRN #strong[2022], no.~24, 19690--19746.
  #link("https://doi.org/10.1093/imrn/rnab218")[doi:10.1093/imrn/rnab218].]
