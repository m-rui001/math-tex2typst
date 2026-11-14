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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to the \
nearby Lagrangian conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a closed connected smooth manifold $Q$, write $pi : T^(*) Q arrow.r
  Q$ for the cotangent projection and $lambda_(\( q \, p \)) \( v \) =
  p \( d pi \( v \) \)$ for the canonical one-form. A smooth submanifold $L subset T^(*)
  Q$ is Lagrangian if it has dimension $dim Q$ and $d lambda$ vanishes on it; it is exact if $lambda \|_L =
  d f$ for a globally defined function $f : L arrow.r bb(R)$. Here closed means compact without boundary.
  Arnold’s nearby Lagrangian conjecture asks whether every closed exact embedded Lagrangian in $T^(*)
  Q$ is Hamiltonian isotopic to the zero section. This is the modern formulation used, for example,
  in #cite(label("Abouzaid2012")) #cite(label("Kragh2013"));
  Arnold’s discussion of Lagrangian knots provides the broader historical setting #cite(label("Arnold1986")).

Throughout this paper our conventions are

$ omega = d lambda \, wide iota_(X_(H_t)) omega = - d H_t . $

A Hamiltonian isotopy has a smooth time-dependent Hamiltonian supported in one fixed compact subset of $T^(*) Q$.
  For compact Lagrangians this entails no restriction: multiplying a Hamiltonian by a cutoff equal to one on a
  neighborhood of the compact isotopy trace preserves its flow along that trace.

#thm([Theorem 1.1.])[
  #emph[For some sufficiently large even integer $N$, the manifold $Q = S^9 times
    S^(N - 1)$ admits a closed exact smoothly embedded Lagrangian $L subset T^(*)
    Q$ such that $L$ is diffeomorphic to $Q$ and no compactly supported Hamiltonian isotopy carries the zero
    section to $L$.]
] <thm:main>

The theorem resolves the unrestricted nearby Lagrangian conjecture negatively.
  Both the base and the Lagrangian in this example are connected and simply connected.
  The obstruction concerns how $L$ lies in the cotangent bundle,
  even though its abstract smooth manifold agrees with the base.

=== 1.1 Context and predecessors <context-and-predecessors>

Classical intersection theorems of Hofer and Laudenbach–Sikorav constrain Hamiltonian deformations of the zero
  section #cite(label("Hofer1985")) #cite(label("LaudenbachSikorav1985")).
  Generating functions provide one route to such results: their critical points encode intersections,
  so finite-dimensional critical-point theory can detect symplectic phenomena.
  The construction and transport of these functions under Hamiltonian isotopy were developed by Chaperon,
  Laudenbach and Sikorav #cite(label("Chaperon1984")) #cite(label("LaudenbachSikorav1985"))
  #cite(label("Sikorav1987")); Eliashberg and Gromov give a systematic account,
  including Chekanov’s contact-isotopy lifting theorem #cite(label("EG1998")) Theorem 4.1.1.
  Positive isotopy results in low dimension include Hind’s theorem for Lagrangian spheres in $T^(*)
  S^2$ #cite(label("Hind2012")) Theorem 1 and the cotangent-torus theorem of Dimitroglou Rizell,
  Goodman and Ivrii #cite(label("DGI2016")) Theorem B. The former,
  together with the projection theorem recalled next and the classification of closed surfaces,
  gives the closed exact case over $S^2$.

The topology of the cotangent projection has become increasingly rigid.
  Fukaya, Seidel and Smith, and independently Nadler, established cohomological and categorical constraints under
  additional assumptions on the base, Maslov class and spin structures #cite(label("FSS2008"))
  #cite(label("Nadler2009")). Abouzaid proved that the projection is a homotopy equivalence when the Maslov class
  vanishes #cite(label("Abouzaid2012")). Kragh’s parametrized spectra, together with Abouzaid’s appendix,
  removed that hypothesis #cite(label("Kragh2013")) Corollary 1.2 and Theorem E.2.
  Abouzaid and Kragh subsequently proved that the projection is a simple homotopy equivalence
  #cite(label("AK2018")) Theorem 1. These results concern the topology of the projection and do not identify the
  ambient Hamiltonian isotopy class.

More recent work reaches finer topological information. Abouzaid, Courte,
  Guillermou and Kragh constructed twisted generating functions and proved that the stable Lagrangian Gauss map,
  which records the stabilized tangent Lagrangian planes, induces zero on homotopy groups
  #cite(label("ACGK2025")). The normal invariant of a homotopy equivalence to $Q$ lies in $\[ Q \, G \/ O \]$,
  where $G \/ O$ is the homotopy fiber of the map from stable real vector bundles to stable spherical fibrations.
  It measures part of the obstruction to making the equivalence a diffeomorphism.
  Abouzaid, Álvarez-Gavela, Courte and Kragh used the twisted derivative on tube spaces to constrain the normal
  invariant of the projection, in particular proving that it is $2$-torsion #cite(label("AACK2025"))
  Corollary 1.2. Porcelli and Smith’s Floer-homotopy approach places this normal invariant in the image of the
  stable Hopf action $B \( G \/ O \) arrow.r G \/ O$ #cite(label("PorcelliSmith2026")) Theorem 6.
  These are further necessary conditions on a nearby Lagrangian, distinct from its ambient isotopy class.

Smooth tube spaces connect generating functions with Waldhausen’s algebraic $K$-theory of spaces
  #cite(label("Waldhausen1982")) #cite(label("WJR2013")). Álvarez-Gavela,
  Igusa and Sullivan developed tube torsion for Legendrians and constructed Legendrians whose tube torsion is
  nontrivial although their base projections are homotopic to diffeomorphisms #cite(label("AIS2026"))
  Theorem 1.15. They also identify stable tube homotopy classes as a finer invariant underlying the real
  cohomological torsion #cite(label("AIS2026")) Remark 3.32.
  Their examples lie in the jet space $J^1 Q = T^(*) Q times bb(R)$;
  forgetting the last coordinate can introduce double points.
  The present construction uses a particular nonzero stable tube class and proves that every possible pair of
  coincident cotangent branches is separated.

Courte and Porcelli constrain the parametrized Whitehead torsion of families of nearby Lagrangians,
  proving weak vanishing when the base has Euler characteristic zero #cite(label("CP2025")) Theorems 1.2 and 1.5,
  Corollary 1.6. Their parameters index whole Lagrangians in a fixed cotangent bundle.
  Below, $S^9$ instead indexes the functions at infinity of one generating family.
  These two families, and the invariants attached to them, have different roles.
  The one-critical-function and cobordism arguments are also related to Kragh’s study of generating functions and
  the Hatcher–Waldhausen map #cite(label("Kragh2026")). We prove the required statement for our varying
  homogeneous data at infinity.

=== 1.2 The construction and its obstruction <the-construction-and-its-obstruction>

We describe the proof in the language of generating families.
  For a smooth function $F \( q \, w \)$ on $Q times bb(R)^r$, the equations

$ d_w F \( q \, w \) = 0 \, wide \( q \, w \) mapsto \( q \, d_q F \( q \, w \) \) $

define an exact Lagrangian immersion when the full vertical-gradient equation is regular.
  This means regularity with respect to both $q$ and $w$, not invertibility of every fiber Hessian.
  An embedding requires the additional global injectivity argument supplied in Section 5.

Our generating families agree outside a fixed vertical ball with degree-two homogeneous functions $g_b$,
  where $b in S^9$. The negative domain of $g_b$ on the unit sphere is a smooth tube:
  a domain isotopic to the negative domain of a nondegenerate quadratic form.
  Adding positive and negative quadratic variables defines the stable smooth tube space $upright(bold(T))$.
  The homotopy type of each negative domain is a sphere, so such a family also determines a stable spherical
  fibration, classified by a map to $B G$. Section 2 defines these models and their map $gamma :
  upright(bold(T)) arrow.r B G$. Waldhausen’s tube fibration,
  together with Rognes’s low-degree smooth Whitehead group calculation #cite(label("Waldhausen1982"))
  #cite(label("Rognes2002")) #cite(label("Rognes2014")), yields

$ 0 eq.not a in pi_9 upright(bold(T)) \, wide gamma_(*) a = 0 . $

Thus the smooth tube family remains nontrivial after its associated stable spherical fibration has become trivial.

Sections 3 and 4 prove that these infinity data cannot occur in a family with exactly one nondegenerate critical
  point in each fiber. Morse theory first gives a fiber homotopy equivalence between the sphere of negative
  eigendirections at that point and the negative domain at infinity.
  After the local quadratic model has been made constant, the regular zero level between an inner and an outer
  sphere forms a family of $h$-cobordisms. Thickening this family by one interval and extending it into a fixed
  cylinder produces a cobordism with a product complement. Stability and the classification of smooth families
  then give a product for the whole original family. This permits the negative domains to be deformed to a fixed
  tube, contradicting the choice of $a$.

Section 5 realizes $a$ using the extra sphere factor in $Q = S^9 times S^(N - 1)$.
  A positive scale $R \( b \)$ and a linear coupling to $v in
  S^(N - 1)$ arrange that the entire critical locus satisfies

$ nabla g_b \( w \) = R \( b \) v . $

Homogeneity parametrizes this locus by $S^9 times S^(N - 1)$.
  The sphere and base momenta are the two components $d_v F$ and $d_b F$ of the generated covector.
  Equality of the sphere momenta confines the difference between two putative coincident branches to the line
  spanned by $v$. Varying $R$ over $S^9$ makes the base momenta separate the remaining pairs.
  Near the critical points of that variation, the tube family has been chosen quadratic,
  and the critical equation already has a unique solution.

Finally, Section 6 follows the generating family through a hypothetical Hamiltonian isotopy to the zero section.
  Its direct small-step construction adds fixed split quadratic forms and preserves the stable class of the
  homogeneous data. At the zero section, the critical-locus projection would be a diffeomorphism,
  giving a unique nondegenerate critical point over each base point.
  Restricting to a fixed $S^9$ slice then gives precisely the family excluded by Proposition 5,
  completing the contradiction.

== 2 Stable tubes and a kernel class <sec:tubes>

The output of this section is a nonzero family of smooth tube data over $S^9$ whose associated stable spherical
  fibration is trivial. We first specify the function model and its stabilizations,
  then obtain the class from the stable smooth $h$-cobordism space.

=== 2.1 Functions and domains <functions-and-domains>

For positive integers $k \, l$, write

$ q_(k \, l) \( x \, y \) = - lr(bar.v.double x bar.v.double)^2 + lr(bar.v.double y bar.v.double)^2 \,
  wide \( x \, y \) in bb(R)^k xor bb(R)^l . $

Let $T_(k \, l)$ be the path component of $q_(k \, l) \|_(S^(k + l - 1))$ in

$ { h in C^1 \( S^(k + l - 1) \, bb(R) \) : 0 upright(" is a regular value of ") h } \, $

with its $C^1$ topology. We also regard its elements as homogeneous functions

#[#set math.equation(numbering: n => "(1)")
 $ g \( r u \) = r^2 h \( u \) \, wide r > 0 \, quad u in S^(k + l - 1) \, wide g \( 0 \) =
   0 . $ <eq:homogeneous-extension>]

Indeed $g$ is $C^1$ on the whole vector space, since $g \( w \) =
  O \( lr(bar.v.double w bar.v.double)^2 \)$ and $d g \( w \) = O \( lr(bar.v.double w bar.v.double) \)$, and

#[#set math.equation(numbering: n => "(2)")
 $ nabla g \( r u \) = r #scale(x: 120%, y: 120%)[\(] 2 h \( u \) u +
   nabla_S h \( u \) #scale(x: 120%, y: 120%)[\)] . $ <eq:angular-gradient>]

The radial and tangential terms are orthogonal. Consequently $0$ is a regular value of $h$ precisely when $g$ has
  no critical point away from $0$. When $h$ is smooth, $g$ is smooth off the origin, and its negative domain

$ D \( h \) = { u in S^(k + l - 1) : h \( u \) lt.eq 0 } $

is a smooth tube: a domain isotopic to $D \( q_(k \, l) \) tilde.equiv S^(k - 1) times D^l$.

We will pass between functions and domains in families. Here are the details of that passage.
  For a fixed smooth domain $D$ with cooriented boundary, the smooth functions defining $D$ have negative sign in
  $"int" D$, positive sign outside $D$, and positive outward normal derivative on $partial D$.
  Their convex combinations retain all three properties. Thus the space of defining functions for $D$ is convex.
  A collar of $partial D$ supplies one such function. For nearby domains,
  express the boundaries as normal graphs and extend their graph isotopies to ambient isotopies supported in the
  collar. Pulling back the chosen function gives local continuous choices of defining functions.
  Over a compact parameter space a partition of unity combines these choices:
  at each parameter all the terms define the same domain, so convexity applies.
  This construction also works relative to a subspace on which defining functions are already chosen,
  by interpolation with that choice in a neighborhood. In particular,
  a homotopy of smooth domains lifts to a homotopy of defining functions, with prescribed endpoints.

Smooth angular functions and $C^1$ angular functions give the same homotopy groups.
  To see this directly, for a compact family put

$ mu = min_(b \, u) #scale(x: 120%, y: 120%)[\(] 4 h_b \( u \)^2 +
  lr(bar.v.double nabla_S h_b \( u \) bar.v.double)^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) > 0 . $

Sufficiently close approximation in angular $C^1$ norm preserves this inequality,
  also throughout straight interpolation. Smooth finitely many angular functions and take a smooth partition of
  unity in the parameters to obtain such an approximation. Cutoffs in the parameters give the relative version.
  Applying the same argument to a homotopy proves both surjectivity and injectivity on homotopy groups.
  These descriptions agree with the smooth tube models of #cite(label("AIS2026")) §3.6;
  see also #cite(label("AACK2025")) Definitions 3.10 and 3.36 for homogeneous $C^1$ functions and the tube-type
  space with its $C^1$ topology.

Direct sum is well defined in this model:

$ \( g xor g' \) \( w \, z \) = g \( w \) + g' \( z \) . $

Its gradient vanishes only when both block gradients vanish, hence only at $\( w \, z \) = 0$.
  Direct sums of paths from the standard forms also show that the indices add.
  Although $g xor g'$ can fail to be smooth on a coordinate axis, it is $C^1$ there;
  subsequent angular smoothing preserves its tube class. Adding positive squares has the usual geometric
  interpretation. In the sphere chart $u = w \/ lr(bar.v.double w bar.v.double)$, $v =
  z \/ lr(bar.v.double w bar.v.double)$, its negative domain is

$ h \( u \) + lr(bar.v.double v bar.v.double)^2 lt.eq 0 . $

This is the disk thickening of the old negative domain, with the boundary rounded.
  Adding negative squares gives the corresponding construction on the positive domain.

Fix the coordinate identifications putting negative coordinates before positive ones.
  Additions of positive and negative squares then form a commuting two-parameter stabilization system.
  The diagonal is cofinal, and we use the based mapping telescope

#[#set math.equation(numbering: n => "(3)")
 $ upright(bold(T)) = "hocolim"_m #scale(x: 120%, y: 120%)[\(] T_(m \, m) arrow.r^(thin xor q_(1 \, 1) thin)
   T_(m + 1 \, m + 1) #scale(x: 120%, y: 120%)[\)] . $ <eq:stable-tubes>]

In particular, a nullhomotopy after adding any fixed numbers of positive and negative squares implies stable
  nullity: adding the missing squares reaches a diagonal stage.

=== 2.2 The stable kernel <the-stable-kernel>

Let $G$ be the stable space of homotopy self-equivalences of spheres, stabilized by suspension;
  $B G$ classifies stable spherical fibrations. The negative domains of a tube family have the homotopy type of
  spheres, and their stable fiber homotopy class defines a map $gamma : upright(bold(T)) arrow.r B G$.
  To describe its fiber, let $H \( X \)$ be the smooth $h$-cobordism space of a compact smooth manifold $X$,
  with identified incoming end and prescribed product vertical boundary. Its stable version is

$ H^s \( X \) = "hocolim"_r H \( X times J^r \) \, $

where $J$ is a closed interval and the maps are interval product stabilizations.
  For $X = *$ this is equivalently the stabilization of disks of increasing dimension.
  We will specify the collared product model when applying it in Section 4.

We use the stable parametrized $h$-cobordism theorem #cite(label("WJR2013")) Theorems 0.1 and 0.3 in the form

#[#set math.equation(numbering: n => "(4)")
 $ H^s \( X \) tilde.eq Omega "Wh"^(upright("diff")) \( X \) . $ <eq:stable-hcob-theorem>]

Here $"Wh"^(upright("diff")) \( X \)$ denotes the infinite loop space of the cofiber of the unit $Sigma^oo X_(+)
  arrow.r A \( X \)$, where $A \( X \)$ is Waldhausen’s algebraic $K$-theory spectrum of $X$.

Waldhausen’s tube theorem identifies the fiber of $gamma$ with $H^s \( * \)$.

#thm([Theorem 2.1.])[
  (Waldhausen’s tube fibration).  #emph[For the stable smooth tube space (3) there is a homotopy fiber sequence
#[#set math.equation(numbering: n => "(5)")
 $ H^s \( * \) arrow.r upright(bold(T)) arrow.r^gamma B G . $ <eq:tube-fibration>]

 The rigid tube map $iota : B O arrow.r upright(bold(T))$, defined by nondegenerate quadratic forms,
   satisfies $gamma compose iota tilde.eq B J$, where $B J : B O arrow.r B G$ is the stable spherical fibration map.]
] <thm:tube-fibration>

This is the smooth tube theorem of #cite(label("Waldhausen1982")),
  with the function and domain comparison and the rigid map described in #cite(label("AIS2026")) §3.6,
  Theorem 3.30 and Remark 3.34. The negative-domain frame model in #cite(label("AACK2025")) §4.1, Definition 4.3,
  Propositions 4.4, 4.6, 4.7 and Remark 4.5 identifies this particular map $gamma$ with the classifying map of the
  negative-domain spherical fibration. To identify the rigid composite,
  retract the negative domain of a quadratic form onto the unit sphere of its negative eigenspace.
  Stabilizing the corresponding Grassmannians gives $B O$, and taking those sphere bundles is exactly $B J$.
  The comparison of the partition and spherical-domain models is a stable equivalence;
  we use no finite-stage equivalence between those models. All equivalences and fiber sequences here are
  understood up to weak homotopy equivalence.

#thm([Proposition 2.2.])[
  #emph[There exists
#[#set math.equation(numbering: n => "(6)")
 $ 0 eq.not a in pi_9 upright(bold(T)) \, wide gamma_(*) a = 0 . $ <eq:kernel-class>]

 Moreover, $\( B J \)_(*) : pi_9 B O arrow.r pi_9 B G$ is injective.]
] <prop:kernel-class>

#proof[
  Bott periodicity gives $pi_8 O tilde.equiv pi_9 O tilde.equiv bb(Z) \/
    2$ #cite(label("Bott1959")) Corollary to Theorem II, equation (1.5).
    The stable $J$-homomorphisms in both degrees are injective #cite(label("Adams1966")) Theorem 9.5. We also use
  $ pi_9^S tilde.equiv \( bb(Z) \/ 2 \)^3 \, wide #scale(x: 120%, y: 120%)[\(] pi_10
    "Wh"^(upright("diff")) \( * \) #scale(x: 120%, y: 120%)[\)]_(\( 2 \)) tilde.equiv bb(Z) \/ 8
    xor \( bb(Z) \/ 2 \)^2 . $
  The first value appears in #cite(label("IWX2023")) Table 1, degree 9;
    the second is Rognes’s computation #cite(label("Rognes2002")) Theorem 5.8,
    also recorded in #cite(label("Rognes2014")) Theorem 3.3. Only the two-primary assertion is used.
  In positive degrees $pi_i G = pi_i^S$. One may use either based or unbased sphere equivalences here,
    since the evaluation fibration has base a sphere whose connectivity tends to infinity under stabilization.
    The relevant part of the long exact sequence of (5) is
  #[#set math.equation(numbering: n => "(7)")
   $ pi_10 upright(bold(T)) arrow.r pi_10 B G arrow.r^partial pi_9 H^s \( * \) arrow.r
     pi_9 upright(bold(T)) arrow.r^(gamma_(*)) pi_9 B G . $ <eq:tube-long-exact>]
  The image of $pi_10 B O$ in $pi_10 B G = pi_9^S$ is the order-two image of $J_9$.
    Theorem 2 puts it in $ker partial$. Since $pi_9^S$ has order eight, $\| "im" partial \| lt.eq 4$.
    On the other hand, (4) identifies
  $ pi_9 H^s \( * \) = pi_10 "Wh"^(upright("diff")) \( * \) \, $
  whose two-primary part has order $32$. Thus $partial$ is not surjective.
    Exactness in (7) implies that the image in $pi_9 upright(bold(T))$ is nonzero and is contained in $ker
    gamma_(*)$, proving (6). Finally, $pi_9 B O arrow.r pi_9 B G$ is $J_8$,
    which is injective by the other degree of Adams’s theorem cited above. ◻
]

#thm([Lemma 2.3.])[
  #emph[Fix $B = S^9$ and a standard height function $theta : B arrow.r bb(R)$.
    The class $a$ in (6) has, for arbitrarily large $m gt.eq 20$,
    a representative $b mapsto h_b$ in $T_(m \, m)$ such that $\( b \, u \) mapsto
    h_b \( u \)$ is smooth and $h_b = q_(m \, m) \|_(S^(2 m - 1))$ on neighborhoods of both critical points of
    $theta$. Its homogeneous extension $g_b$ satisfies, for constants $0 < c lt.eq C < oo$,
#[#set math.equation(numbering: n => "(8)")
 $ c lr(bar.v.double w bar.v.double) lt.eq lr(bar.v.double nabla_w g_b \( w \) bar.v.double) lt.eq
   C lr(bar.v.double w bar.v.double) wide \( b in B \, med w in bb(R)^(2 m) \) . $ <eq:uniform-homogeneous-gradient>]

 For any fixed metric on $B$, there is also a constant $C_1$ such that
#[#set math.equation(numbering: n => "(9)")
 $ lr(bar.v.double d_w d_b g_b \( w \) bar.v.double) lt.eq
   C_1 lr(bar.v.double w bar.v.double) . $ <eq:base-mixed-bound>]

 The derivatives in (9) extend continuously to $w = 0$ with value zero.]
] <lem:localized-family>

#proof[
  A map from the compact sphere to the mapping telescope (3) has bounded height.
    A finite initial portion of the telescope retracts onto its last stage.
    Hence $a$ is represented by a based map $S^9 arrow.r T_(m \, m)$ at a finite stage.
    Further stabilization preserves its stable class and makes $m$ arbitrarily large.
  Choose an oriented disk in $B$ whose closure avoids the two critical points of $theta$.
    Collapsing the complement of its interior gives a degree-one map $B arrow.r S^9$,
    constant at the target basepoint off that disk. Equivalently one can take a smooth map of degree one supported
    there, obtained by a relative smooth approximation of this collapse map.
    Precomposition preserves the based homotopy class, since a degree-one self-map of $S^9$ is based homotopic to
    the identity. The resulting family is standard on neighborhoods of both critical points.
  Apply the relative angular approximation described above,
    retaining the standard function on smaller such neighborhoods.
    More explicitly, approximate the continuous map into $C^1 \( S^(2 m - 1) \)$ by a finite smooth partition of
    unity in $b$ multiplying smooth angular functions; then multiply its difference from $q_(m \, m)$ by a
    parameter cutoff which is zero on the smaller neighborhoods and one outside the original standard
    neighborhoods. The approximation remains uniformly close in angular $C^1$ norm.
    The positive regularity margin and straight interpolation show that its stable class is still $a$ and its
    spherical class is zero.
  For this smooth family,
    the continuous positive function $lr(bar.v.double 2 h_b \( u \) u + nabla_S h_b \( u \) bar.v.double)$ has a
    positive minimum and a finite maximum on $B times S^(2 m - 1)$. Formula (2) gives (8), including the origin.
    Finally $d_b g_b \( r u \) = r^2 d_b h_b \( u \)$. Differentiating in $w$ gives a degree-one expression whose
    angular coefficients are bounded by compactness, proving (9).
    The degree-two value bound and degree-one derivative bound also prove the asserted $C^1$ extension at zero.
    As before, the nonzero based stable class cannot be freely nullhomotopic,
    because the fundamental group action fixes zero. ◻
]

== 3 Families with one critical point <sec:morse>

We now establish the obstruction used in the proof. A family is #emph[homogeneous at infinity] if it agrees,
  outside one fixed ball in every fiber, with a family of degree-two homogeneous functions.
  Smoothness of a homogeneous function below means smoothness away from the origin,
  together with its $C^1$ extension at the origin.

#thm([Proposition 3.1.])[
  #emph[Let $B = S^9$ and let $p gt.eq 20$. Suppose that $f_b : bb(R)^(2 p) arrow.r bb(R)$, $b in B$,
    is a smooth family satisfying the following conditions:]
  + #emph[it is homogeneous at infinity, with smooth homogeneous data in $T_(p \, p)$;]
  + #emph[each $f_b$ has exactly one critical point, which is nondegenerate and varies smoothly with $b$;]
  + #emph[the stable spherical class of the family at infinity is zero in $\[ B \, B G \]$.]
  #emph[Then its stable tube class is zero in $\[ B \, upright(bold(T)) \]$.]
] <prop:one-critical>

The proof occupies this section and Section 4. We first fix the local quadratic model and explain the necessary
  Morse theory on the noncompact fibers. Comparing a one-critical function with a smooth $h$-cobordism by removing
  a normal neighborhood of its unstable disk is also central to Kragh’s account of generating functions and the
  Hatcher–Waldhausen map #cite(label("Kragh2026")). Here the data at infinity vary with the parameter,
  and we keep their smooth tube class throughout the comparison.

=== 3.1 Normalization and the negative sphere bundle <normalization-and-the-negative-sphere-bundle>

Translate the critical section to the origin by compactly supported fiber diffeomorphisms.
  Such a family is obtained by flowing a cutoff of the constant translation vector field:
  choose its plateau to contain all line segments from zero to the critical section.
  Subtract the critical value using a cutoff equal to one on the ball of radius $A$ and zero outside the ball of
  radius $2 A$, with $A$ sufficiently large. On its transition annulus the derivative of this correction is
  $O \( A^(- 1) \)$, whereas the original gradient has norm at least $c A$.
  Thus no new critical points appear, and the data at infinity are unchanged.

Let $Q_b$ be the quadratic term at the resulting critical point. Taylor expansion, uniformly over $B$, gives

$ f_b \( w \) - Q_b \( w \) = O \( lr(bar.v.double w bar.v.double)^3 \) \, wide d_w \( f_b - Q_b \) =
  O \( lr(bar.v.double w bar.v.double)^2 \) . $

A radial cutoff on a sufficiently small ball replaces $f_b$ by $Q_b$ near zero.
  The extra derivative is $O \( lr(bar.v.double w bar.v.double)^2 \)$ on the transition annulus,
  while $lr(bar.v.double nabla Q_b \( w \) bar.v.double) gt.eq
  c_0 lr(bar.v.double w bar.v.double)$ for a uniform $c_0 > 0$. We have therefore arranged

#[#set math.equation(numbering: n => "(10)")
 $ f_b \( 0 \) = 0 \, wide f_b = Q_b upright(" near ") 0 \, $ <eq:local-quadratic>]

without changing the unique critical point or the infinity data.

#thm([Lemma 3.2.])[
  #emph[Suppose a family satisfying (10) has one nondegenerate critical point and smooth homogeneous data of type
    $T_(k \, l)$ at infinity, where $k \, l gt.eq 3$. Its Morse index is $k$.
    Moreover, the unit sphere bundle of its negative eigenspaces is fiber homotopy equivalent to the family of
    negative domains at infinity.]
] <lem:morse-sublevels>

#proof[
  Choose a radius $a > 0$ inside the common quadratic neighborhood and a radius $R_0$ with an inner collar on
    which the family is already homogeneous. Take a small uniform $delta > 0$ and write
  $ M_(-)^b = { f_b lt.eq - delta } \, wide M_(+)^b = { f_b lt.eq delta } . $
  We first show that $M_(-)^b$ is homotopy equivalent to the negative domain at infinity.
    On its compact part $lr(bar.v.double w bar.v.double) lt.eq R_0$, choose a descending field,
    radial outward near $lr(bar.v.double w bar.v.double) = R_0$.
    This boundary prescription is possible because homogeneity gives
  $ d f_b \( partial_r \) = 2 f_b \/ r < 0 $
  there. Interpolate with negative gradient away from that collar.
    The conditions are strict linear inequalities, so these choices can be patched smoothly, also over $b$.
  The field cannot leave through $f_b = - delta$. It must reach the outer sphere in finite time:
    on the compact region its rate of descent has a positive lower bound, while $f_b$ has a finite lower bound.
    The exit is transverse. Stopping the flow at its first exit and fixing all points outside the ball gives a
    deformation retraction onto
  $ M_(-)^b ∩ { r gt.eq R_0 } . $
  The globally stopped homotopy is continuous, which is sufficient here.
    If $h_b$ denotes the angular function at infinity, angular projection of this outer portion has,
    over $u$ with $h_b \( u \) < 0$, the radial fiber
  $ lr([max {R_0 \, sqrt(frac(delta, - h_b \( u \)))} \, oo)) . $
  Contracting each such interval to its continuous lower endpoint proves the homotopy equivalence.
    The open and closed negative domains have the same homotopy type, since zero is a regular value. In particular,
  #[#set math.equation(numbering: n => "(11)")
   $ M_(-)^b tilde.eq S^(k - 1) . $ <eq:negative-sublevel-type>]
  On $f_b gt.eq delta$, normalized negative gradient has $d f_b$-derivative $- 1$ and bounded speed.
    Indeed the gradient is bounded away from zero on the compact part and grows at least linearly at infinity.
    Extend this to a bounded smooth field by cutting off below $delta$, away from zero.
    Each point with $f_b > delta$ reaches the level $delta$ after time $f_b - delta$.
    Stopped flow gives a deformation retraction of $bb(R)^(k + l)$ onto $M_(+)^b$, so
  #[#set math.equation(numbering: n => "(12)")
   $ M_(+)^b tilde.eq * . $ <eq:positive-sublevel-type>]
  We give the local handle argument to justify its use for these noncompact sublevels.
    If the Morse index is $j$, choose local linear coordinates with $Q_b = - lr(bar.v.double x bar.v.double)^2 +
    lr(bar.v.double y bar.v.double)^2$, where $x in bb(R)^j$.
    The coordinate changes and their inverses have uniformly bounded norms; a global frame is not needed.
    Choose a smooth function $mu$ on $\[ 0 \, oo \)$ with
  $ - 1 < mu' lt.eq 0 \, wide mu \( 0 \) > delta \, wide mu \( s \) = 0 upright(" for ") s gt.eq 2 delta . $
  Modify the function in this neighborhood to
  $ tilde(f)_b = f_b - mu \( lr(bar.v.double x bar.v.double)^2 + 2 lr(bar.v.double y bar.v.double)^2 \) . $
  The modification is supported where $f_b < delta$. Its derivatives in the chart are
  $ - 2 \( 1 + mu' \) x \, wide 2 \( 1 - 2 mu' \) y . $
  Thus zero is its only critical point and has value below $- delta$.
    We have ${ tilde(f)_b lt.eq delta } = M_(+)^b$. Bounded normalized descent on the slab between $-
    delta$ and $delta$ retracts this set, relative to $M_(-)^b$, onto ${ tilde(f)_b lt.eq - delta }$.
  The latter set retracts, relative to $M_(-)^b$, onto
  $ M_(-)^b union D \, wide D = { y = 0 \, med lr(bar.v.double x bar.v.double)^2 lt.eq delta } . $
  For membership of $D$, note that $s + mu \( s \) gt.eq mu \( 0 \) > delta$ for $0 lt.eq s lt.eq delta$.
    At an added point outside $M_(-)^b$, shrink $y$ radially to zero if $lr(bar.v.double x bar.v.double)^2 lt.eq
    delta$, and otherwise to length $sqrt(lr(bar.v.double x bar.v.double)^2 - delta)$.
    The modified function decreases during this motion, and it agrees continuously with fixing $M_(-)^b$ at the
    boundary. This proves the claimed relative deformation.
  The relative homology of $\( M_(+)^b \, M_(-)^b \)$ is therefore that of one $j$-disk modulo its boundary.
    Equations (11)–(12) force $j = k$, and the boundary map makes $partial
    D$ a generator of $H_(k - 1) \( M_(-)^b \; bb(Z) \)$. Within the local negative cone,
    this sphere expands to $a S \( E_b^(-) \)$, where $E_b^(-)$ is the negative eigenspace in the original
    Euclidean metric.
  Flow this sphere to the outer sphere using the descending field above and project angularly.
    The construction varies smoothly with $b$. On each fiber it takes a homology generator to a generator in the
    negative domain. Both source and target have the homotopy type of the simply connected sphere $S^(k - 1)$.
    They have CW type, so the integral homology isomorphism is a homotopy equivalence by the homological Whitehead
    theorem #cite(label("Hatcher2002")) Corollary 4.33. The fiberwise criterion for maps of bundles over a CW base
    makes it a fiber homotopy equivalence. This identifies the claimed spherical fibration. ◻
]

Return to $k = l = p$ in Proposition 5. By Lemma 6, its spherical hypothesis says that the stable class of $E^(-)$
  has zero image under $B J$. The injectivity of $pi_9 B O arrow.r
  pi_9 B G$ established in Section 2 implies that this bundle class is zero.
  The map $"Gr"_p \( bb(R)^(2 p) \) arrow.r B O \( p \)$ has homotopy fiber the $\( p - 1 \)$-connected Stiefel
  manifold $V_p \( bb(R)^(2 p) \)$, so this map is $p$-connected.
  The stabilization $B O \( p \) arrow.r B O$ is also $p$-connected.
  For $p gt.eq 20$ both induce isomorphisms on $pi_9$. Hence the negative-eigenspace map is nullhomotopic in this
  finite Grassmannian.

The space of nondegenerate forms of signature $\( p \, p \)$ retracts onto the corresponding sign forms.
  We can consequently choose a smooth homotopy $Q_(b \, s)$ of nondegenerate forms from $Q_b$ to the fixed
  $q_(p \, p)$, with uniform lower gradient bound $c_1 lr(bar.v.double w bar.v.double)$.
  Insert this homotopy into a much smaller punctured quadratic ball,
  using a radial parameter $s \( r \)$ which is one near zero, zero near the outer boundary, and satisfies

$ r \| s' \( r \) \| lt.eq epsilon . $

Such a cutoff exists on an arbitrarily long logarithmic radius interval.
  Differentiating $Q_(b \, s \( r \)) \( w \)$ adds an error $O \( epsilon r \)$ to its quadratic gradient.
  A sufficiently small $epsilon$ excludes new critical points.
  The parameter is constant near zero, so the resulting function is smooth and equals the fixed $q_(p \, p)$ there.

=== 3.2 A smoothing lemma for stabilization <a-smoothing-lemma-for-stabilization>

Direct sums of homogeneous functions are naturally $C^1$.
  The following explicit adjustment restores smoothness away from the total origin and will also be used in
  Hamiltonian transport.

#thm([Lemma 3.3.])[
  #emph[Let $g_b \( w \)$ be a smooth homogeneous family with $lr(bar.v.double nabla g_b \( w \) bar.v.double)
    gt.eq c lr(bar.v.double w bar.v.double)$, and let $q' \( z \)$ be a fixed nondegenerate quadratic form.
    Put $W = \( w \, z \)$ and $G_0 \( b \, W \) = g_b \( w \) + q' \( z \)$.
    Suppose that $F_b \( W \)$ is smooth and that
$ \| F_b - G_0 \| lt.eq M_0 \, wide lr(bar.v.double d_W F_b - d_W G_0 bar.v.double) lt.eq M_1 $

 uniformly. Then, outside an arbitrarily large fixed ball,
   $F$ can be modified to agree exactly with a smooth homogeneous family $G_eta$.
   The modification creates no new critical points, preserves a neighborhood of every original critical point,
   and the homogeneous family $G_eta$ is homotopic through regular $C^1$ homogeneous functions to $G_0$.]
  #emph[The construction is uniform over compact parameter spaces,
    or over any parameter domain on which the bounds used here are uniform.]
] <lem:stabilization-smoothing>

#proof[
  There is $c_0 > 0$ such that $lr(bar.v.double nabla_W G_0 bar.v.double) gt.eq
    c_0 lr(bar.v.double W bar.v.double)$. For $W eq.not 0$ choose a smooth cutoff $rho_eta$ which vanishes on
    $\[ 0 \, eta \]$, equals one on $\[ 2 eta \, oo \)$, and has derivative bounded by $C \/ eta$, and set
  $ G_eta \( b \, W \) = g_b \( w \) rho_eta (lr(bar.v.double w bar.v.double) / lr(bar.v.double W bar.v.double)) +
    q' \( z \) . $
  The potentially nonsmooth term vanishes in an open cone around $w = 0$.
    Elsewhere it is smooth, so $G_eta$ is smooth away from $W = 0$.
    On the support of $1 - rho_eta$, we have $lr(bar.v.double w bar.v.double) lt.eq
    2 eta lr(bar.v.double W bar.v.double)$. Homogeneity and the angular derivative bound give
  #[#set math.equation(numbering: n => "(13)")
   $ \| G_eta - G_0 \| lt.eq C_2 eta^2 lr(bar.v.double W bar.v.double)^2 \, wide
     lr(bar.v.double d_W G_eta - d_W G_0 bar.v.double) lt.eq C_2 eta lr(bar.v.double W bar.v.double) .
     $ <eq:angular-smoothing-estimates>]
  In the second estimate the derivative of $lr(bar.v.double w bar.v.double) \/
    lr(bar.v.double W bar.v.double)$ costs at most $lr(bar.v.double W bar.v.double)^(- 1)$ where the cutoff
    changes. For small $eta$, the straight homotopy from $G_0$ to $G_eta$ retains a linear nonzero-gradient bound.
  Let $alpha_A$ vanish for $lr(bar.v.double W bar.v.double) lt.eq A$,
    equal one for $lr(bar.v.double W bar.v.double) gt.eq 2 A$, and have derivative bounded by $C_3 \/ A$. Replace $F$ by
  $ F_A = \( 1 - alpha_A \) F + alpha_A G_eta . $
  On the transition annulus its derivative differs from $d_W G_0$ by at most
  $ M_1 + C_2 eta lr(bar.v.double W bar.v.double) + C_3 / A #scale(x: 120%, y: 120%)[\(] M_0 +
    C_2 eta^2 lr(bar.v.double W bar.v.double)^2 #scale(x: 120%, y: 120%)[\)] . $
  Relative to $lr(bar.v.double W bar.v.double)$ this is $O \( eta + eta^2 + A^(- 1) \)$.
    Choose $eta$ small and then $A$ large so that the bound is less than $c_0 lr(bar.v.double W bar.v.double) \/
    2$. No critical points occur in the annulus or its exterior.
    The original critical points already lie in a uniform ball,
    since $d_W F$ differs from a linearly bounded-below gradient by at most $M_1$.
    Taking $A$ beyond that ball preserves their neighborhoods.
    The function is unchanged near zero and thus smooth everywhere. ◻
]

Adding positive squares increases the normal disk dimension of the negative tube $S^(k - 1) times
  D^l$ while leaving the dimension of its sphere core $S^(k - 1) times { 0 }$ fixed.
  We use this freedom to allow the final deformation of these cores through embeddings in Section 4.

Apply the lemma to the normalized $f_b \( w \) + lr(bar.v.double z bar.v.double)^2$.
  Its difference from the homogeneous sum, and that of its vertical derivative, are bounded because $f_b -
  g_b$ is supported in a fixed $w$-ball. We obtain a family,
  still with one critical point and with a fixed local model, whose infinity data have type $T_(k \, l)$ with

#[#set math.equation(numbering: n => "(14)")
 $ k = p \, wide l > k + 9 . $ <eq:unbalanced-indices>]

Both indices remain at least twenty. Its local model is $q_(k \, l)$.
  If its tube family is null at this stage, adding the same number of negative squares as the positive squares
  just added gives nullity in the diagonal stable system. Fixed reordering of coordinate blocks does not affect
  nullity. It remains to prove that this enlarged tube family is null, which is the purpose of the next section.

== 4 The zero-level cobordism <sec:obstruction>

We continue with the normalized family from Section 3: its unique critical point is zero,
  its local model is the fixed $q_(k \, l)$, its data at infinity are smooth and homogeneous, and (14) holds. Put

$ Y = S^(k + l - 1) \, wide Sigma = { q_(k \, l) = 0 } ∩ Y tilde.equiv S^(k - 1) times S^(l - 1) . $

Choose radii $a \, R_0$ with collars in the local quadratic and outer homogeneous regions, respectively.
  Identify their annulus with $Y times \[ 0 \, 1 \]$ by a smooth increasing radius $r \( t \)$, with $r' > 0$. Write

$ s_b \( u \, t \) = frac(f_b \( r \( t \) u \), r \( t \)^2) . $

Near $t = 0$ and $t = 1$ this function is independent of $t$,
  and equals $q_(k \, l) \|_Y$ and the angular infinity data $h_b^1$, respectively.
  Differentials in this section are in the annulus variables, with $b$ fixed;
  we also write $f_b$ for its pullback to the annulus.

=== 4.1 A regular band and its two complementary regions <a-regular-band-and-its-two-complementary-regions>

Since $f_b$ has no critical point on the annulus and

#[#set math.equation(numbering: n => "(15)")
 $ d f_b = r^2 d s_b quad upright("on ") s_b = 0 \, $ <eq:zero-level-differential>]

zero is a regular value of $s_b$. Its zero set is transverse to both end faces.
  Compactness gives a small uniform $epsilon.alt > 0$ and a band identification

#[#set math.equation(numbering: n => "(16)")
 $ C_b = { s_b = 0 } \, wide cal(R)_b = { \| s_b \| lt.eq epsilon.alt } tilde.equiv C_b times J \, wide
   J = \[ - epsilon.alt \, epsilon.alt \] . $ <eq:zero-band>]

To obtain it, choose a field with $d s_b$-derivative one in a slightly larger band,
  tangent to the end faces and purely angular and independent of $t$ on their collars.
  Such choices patch because the condition $d s_b \( V \) = 1$ is affine.
  Integrating the field identifies its second coordinate with $s_b$.
  At the incoming end the choice can be fixed independently of $b$, so the resulting collar embedding $Sigma times
  J arrow.r.hook Y$ is fixed.

#thm([Lemma 4.1.])[
  #emph[On
$ P_(plus.minus \, b) = { \( u \, t \) : med plus.minus s_b \( u \, t \) gt.eq epsilon.alt } $

 there are smooth fields $V_(plus.minus \, b)$, depending smoothly on $b$, such that
#[#set math.equation(numbering: n => "(17)")
 $ plus.minus d f_b \( V_(plus.minus \, b) \) & > 0 &  & upright("on ") P_(plus.minus \, b) \,\
d t \( V_(plus.minus \, b) \) & > 0 &  & upright("near ") t = 0 \, 1 \,\
plus.minus d s_b \( V_(plus.minus \, b) \) & > 0 &  & upright("on ") s_b = plus.minus epsilon.alt . $ <eq:field-f>]

 The fields can be chosen with a common prescription extending across the whole angular sphere on each end collar.]
] <lem:signed-flows>

#proof[
  By (15), near the zero set a field can make $d f_b$ and $d s_b$ both strictly positive,
    or both strictly negative. The same holds at the two side levels for small uniform $epsilon.alt$.
    On an end collar write $s_b = h$, angular and independent of $t$, and use
  $ V = partial_t + h nabla_Y h . $
  Then
  $ d t \( V \) = 1 \, quad d s_b \( V \) = h lr(bar.v.double nabla_Y h bar.v.double)^2 \, quad d f_b \( V \) =
    h #scale(x: 120%, y: 120%)[\(] 2 r r' + r^2 lr(bar.v.double nabla_Y h bar.v.double)^2
    #scale(x: 120%, y: 120%)[\)] . $
  These give the required signs, including strictness on the side levels, since $d h eq.not 0$ near $h = 0$.
    Away from the prescribed regions, use strict signed gradient ascent or descent for $f_b$.
    Convex patching preserves every applicable strict linear inequality,
    and can keep the displayed prescription on smaller end collars.
    The construction is smooth over the compact parameter space.
    Fields on cornered regions are understood to extend locally across their faces. ◻
]

Let $T_(-)^0$ and $T_(- \, b)^1$ be the truncated negative domains $s_b lt.eq -
  epsilon.alt$ on the inner and outer spheres, viewed in angular coordinates.
  They are isotopic to the respective negative tubes.

#thm([Lemma 4.2.])[
  #emph[The negative field gives an embedding
$ j_b : T_(-)^0 arrow.r.hook "int" T_(- \, b)^1 $

 which is a homotopy equivalence. It also identifies $C_b$ with
$ T_(- \, b)^1 \\ "int" j_b \( T_(-)^0 \) . $

 In particular, the family $C_b$, with its fixed incoming identification with $Sigma$,
   is a smooth family of h-cobordisms.]
] <lem:residual-hcob>

#proof[
  For $V_(- \, b)$ the inner face and side face are entry faces, and the outer face is the only exit.
    Every trajectory exits in finite forward time: on the compact region $P_(- \, b)$, $-
    d f_b \( V_(- \, b) \)$ has a positive lower bound and $f_b$ has bounded range.
    Backwards, the same argument forces a trajectory to reach an entry face.
  Flow to the first intersection with $t = 1$ maps each entry face smoothly and injectively into $T_(- \, b)^1$.
    Transversality to the exit face gives smooth dependence of the exit time,
    also at the side’s outer edge where the time is zero. Extensions across the corner faces show that these maps
    have full rank up to the edges. Their images meet precisely along the shared inner edge and otherwise are
    disjoint, by uniqueness of flow; backwards flow gives their union as the entire outer tube.
    The image of the inner face lies in the interior of the outer tube,
    since the field points strictly inward from the side. The band identification (16) identifies that side with
    $C_b$ and proves the stated decomposition.
  Choose $delta > 0$ as in Lemma 6, also small enough that the sphere $a \( S^(k - 1) times { 0 } \)$ in the fixed
    negative eigenspace lies in $f_b lt.eq - delta$. This sphere is the core of the inner tube.
    Its image under the negative flow remains in this sublevel.
    The core represents a generator there by that lemma, and therefore its image at $R_0$ represents a generator
    in the outer radial portion. Angular projection carries it to a generator in the open negative domain.
    Inclusion of $T_(- \, b)^1$ into this open domain is a homotopy equivalence for our small $epsilon.alt$.
    Thus $j_b$ has degree $plus.minus 1$ on the sphere homotopy types of its source and target.
    These types are simply connected, so $j_b$ is a homotopy equivalence.
  Excision with collars now gives
  $ H_(*) \( C_b \, partial_(-) C_b \; bb(Z) \) tilde.equiv
    H_(*) \( T_(- \, b)^1 \, j_b \( T_(-)^0 \) \; bb(Z) \) = 0 . $
  This includes connectedness of $C_b$. The two tubes and their common boundary are simply connected,
    so van Kampen applied to the decomposition implies $pi_1 C_b = 0$.
    The cobordism is orientable, and Poincaré–Lefschetz duality gives vanishing of the relative homology at its
    outgoing end as well. Both boundary components are diffeomorphic to $S^(k - 1) times
    S^(l - 1)$ and hence simply connected. All these smooth spaces have CW type,
    so the homological Whitehead theorem #cite(label("Hatcher2002")) Corollary 4.33 makes both boundary inclusions
    homotopy equivalences. Regularity and properness give a smooth bundle of these cobordisms over $B$,
    including their boundary collars, with fixed incoming identification. ◻
]

=== 4.2 Stabilizing the cobordism inside a fixed cylinder <stabilizing-the-cobordism-inside-a-fixed-cylinder>

The family $C_b$ gives a class $c_B in \[ B \, H \( Sigma \) \]$.
  We need a product identification relative to the incoming end that varies over all of $B$.
  We first thicken $C_b$ by one interval and extend it to $Y$.
  The resulting family has a product complement in a fixed cylinder.
  We will then use stability to recover the original family class from this enlarged one.

In the space $H \( X \)$ recalled in Section 2, the incoming end is identified with $X$;
  when $partial X eq.not diameter$, the vertical boundary is the prescribed product $partial X times I$.
  There is no identification of the outgoing end with $X$. All these data have collars.
  Equivalently one may bend the vertical face into the outgoing face,
  so incoming and outgoing boundaries meet along $partial X$.
  This is the collared model of #cite(label("WJR2013")) Definitions 1.1.1 and 1.1.3. The product component is

$ H \( X \)_0 tilde.eq B P \( X \) \, wide P \( X \) =
  "Diff" \( X times I med upright("rel") med X times { 0 } union partial X times I \) \, $

with the equivalent convention of diffeomorphisms fixed near the indicated faces and product near the outgoing
  face. Thus a null classifying map into this component gives a product family relative to the incoming end.

In our application, $Sigma$ is simply connected and has dimension at least $38$.
  The smooth $h$-cobordism theorem #cite(label("Milnor1965")) Theorem 9.1 makes every $h$-cobordism on $Sigma$ a
  product relative to its incoming end: its dimension is at least $39$,
  and its boundary inclusions are homotopy equivalences. If a product parametrization restricts to $a :
  Sigma arrow.r Sigma$ at the incoming end, precomposing it with $a^(- 1) times "id"_I$ fixes that end pointwise.
  Thus $H \( Sigma \)$ is connected.

The interval stabilization used here is $sigma : H \( X \) arrow.r H \( X times J \)$,
  where $J$ is a closed interval. For $X$ closed and $C$ an $h$-cobordism from $X$ to $N$,
  add a fixed incoming collar to form

$ C^(-) = \( X times \[ - 1 \, 0 \] \) union_X C . $

Use $C^(-) times J$, with the following faces before rounding:

#[#set math.equation(numbering: n => "(18)")
 $ upright("incoming: ") & X times { - 1 } times J \,\
upright("vertical: ") & X times \[ - 1 \, 0 \] times partial J \,\
upright("outgoing: ") & \( N times J \) union \( C times partial J \) . $ <eq:stabilization-faces>]

The vertical face has its stated product identification; the remaining sides belong to the outgoing end.
  Corner bending turns these into the usual collared cobordism faces.
  For manifolds with boundary, retain the existing product vertical faces as well and round their product corners.
  This is the product construction of #cite(label("WJR2013")) Definition 1.1.3.

If $e : X arrow.r.hook Y$ is a codimension-zero embedding, extension $e_(!) : H \( X \) arrow.r
  H \( Y \)$ glues the cobordism to the trivial cylinder on $Y \\ "int"
  e \( X \)$ along the product vertical boundary. In the bent collared model, the same operation is

#[#set math.equation(numbering: n => "(19)")
 $ C mapsto \( Y times I \) union_(X times I) C \, $ <eq:hcob-extension>]

where $X times I subset C$ is the incoming collar. This expression shows that extension commutes with interval
  stabilization, using the product collars and their fixed corner adjustments.

Add trivial collars $Y times \[ - 1 \, 0 \]$ and $Y times \[ 1 \, 2 \]$ to the annulus and set,
  with corners to be rounded,

#[#set math.equation(numbering: n => "(20)")
 $ W_b = \( Y times \[ - 1 \, 0 \] \) union cal(R)_b . $ <eq:band-cobordism>]

Its incoming boundary is the fixed $Y times { - 1 }$. Figure 1 records these faces and the complementary regions
  used below.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.016, 3.78), [#text(size: 9pt)[\(a\) One interval stabilization]])
  rect((0, 0.72), (1.152, 2.88), fill: rgb("#e6e6e6"), stroke: none)
  rect((1.152, 0.72), (4.032, 2.88), fill: rgb("#c7c7c7"), stroke: none)
  line((0, 0.72), (0, 2.88), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  line((0, 0.72), (1.152, 0.72), stroke: (thickness: 0.9pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((0, 2.88), (1.152, 2.88), stroke: (thickness: 0.9pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((1.152, 0.72), (1.152, 2.88), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round", dash: "dotted"))
  line((1.152, 0.72), (4.032, 0.72), (4.032, 2.88), (1.152, 2.88), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  content((-0.324, 1.8), [#text(size: 9pt)[incoming]], angle: 90deg)
  content((2.592, 1.8), [#text(size: 9pt)[$C_b times J$]])
  content((0.576, 3.262), [#text(size: 8pt)[fixed#linebreak()vertical]])
  content((2.628, 3.226), [#text(size: 8pt)[outgoing]])
  content((0.576, 0.3384), [#text(size: 8pt)[added collar]])
  content((2.628, 0.3384), [#text(size: 8pt)[outgoing]])
  content((9.864, 3.78), [#text(size: 9pt)[\(b\) Extension into the fixed $Y$-cylinder]])
  rect((5.76, 0.504), (13.97, 3.096), fill: rgb("#f5f5f5"), stroke: none)
  rect((5.76, 0.504), (7.488, 3.096), fill: rgb("#c7c7c7"), stroke: none)
  merge-path({bezier((7.488, 1.382), (11.38, 1.138), (8.82, 1.382), (9.864, 1.138)); line((11.38, 1.138), (11.38, 2.146)); bezier((11.38, 2.146), (7.488, 2.218), (9.864, 2.146), (8.82, 2.218))}, close: true, fill: rgb("#c7c7c7"), stroke: none)
  line((7.488, 0.504), (7.488, 3.096), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((11.38, 0.504), (11.38, 3.096), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((5.76, 0.504), (13.97, 0.504), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((5.76, 3.096), (13.97, 3.096), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((5.76, 0.504), (5.76, 3.096), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  line((13.97, 0.504), (13.97, 3.096), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  line((7.488, 0.504), (7.488, 1.382), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  bezier((7.488, 1.382), (11.38, 1.138), (8.82, 1.382), (9.864, 1.138), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  line((11.38, 1.138), (11.38, 2.146), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  bezier((11.38, 2.146), (7.488, 2.218), (9.864, 2.146), (8.82, 2.218), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  line((7.488, 2.218), (7.488, 3.096), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  content((5.436, 1.8), [#text(size: 9pt)[incoming]], angle: 90deg)
  content((6.588, 1.8), [#text(size: 9pt)[$Y times [-1,0]$]], angle: 90deg)
  content((9.324, 1.8), [#text(size: 9pt)[$cal(R)_b tilde.equiv C_b times J$]])
  content((9.36, 2.65), [#text(size: 9pt)[$P_(+,b)$]])
  content((9.36, 0.8064), [#text(size: 9pt)[$P_(-,b)$]])
  content((12.66, 1.8), [#text(size: 9pt)[upper collar#linebreak()$Y times [1,2]$]])
  content((13.97, 3.348), [#text(size: 8pt)[complement $tilde.equiv E_b times I$]], anchor: "east", padding: 0.07056cm)
  content((7.488, 0.1296), [#text(size: 8pt)[$0$]])
  content((5.76, 0.1296), [#text(size: 8pt)[$-1$]])
  content((11.38, 0.1296), [#text(size: 8pt)[$1$]])
  content((13.97, 0.1296), [#text(size: 8pt)[$2$]])
  line((12.02, -0.2376), (13.97, -0.2376), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: ">"))
  content((13, -0.2376), [#text(size: 9pt)[$t$]], anchor: "north", padding: 0.07056cm)
})],
  caption: [Figure 1: Face bookkeeping for one fiber, before corner rounding. In (a), the dashed segments are the fixed vertical faces on the added incoming collar $Sigma times \[ - 1 \, 0 \] times J$; both sides beyond that collar are movable outgoing faces. In (b), the dark region is $W_b = \( Y times \[ - 1 \, 0 \] \) union cal(R)_b$, and its heavy interface with the light complement is $E_b = partial_(+) W_b$. The product identification of the complement is proved over the possibly varying bundle $E arrow.r B$. The angular direction is schematic: the upper and lower dashed display edges are not boundary faces of the closed sphere $Y$. The drawing asserts neither radial monotonicity nor a product trivialization of $C arrow.r B$. ],
) <fig:regular-band>

#thm([Lemma 4.3.])[
  #emph[The family $W_b$ represents the extension to $Y$ of the interval stabilization of $C_b$.]
] <lem:band-is-stabilization>

#proof[
  Adjoin a fixed incoming collar to $C_b$, obtaining
  $ C_b^(-) = \( Sigma times \[ - 1 \, 0 \] \) union C_b . $
  Its interval stabilization is $C_b^(-) times J$, with incoming $Sigma times J$.
    In the convention of (18), the two faces $C_b times partial
    J$ and the outgoing end times $J$ form the movable boundary.
    The added incoming-collar portions supply the fixed vertical boundary when a boundary-relative model is used.
    Extending across $Sigma times J arrow.r.hook Y$ replaces that incoming collar by $Y times \[ - 1 \, 0 \]$.
    The result is exactly (20), using (16) for the attached piece.
  This construction works on transition maps as well. Local product trivializations of $C_b$ fix its incoming
    collar and can be made product on outgoing collars, without fixing their outgoing end.
    Extend them by identity over the added collar and take their product with $"id"_J$.
    A fixed bending of the two interval coordinates gives the usual boundary-relative stabilized cylinder.
    Near the lower gluing seam the transitions are identity; near the upper seam they preserve both interval
    coordinates and act only in the remaining boundary variable.
    Thus fixed planar corner adjustments descend through the transitions.
    Extending by identity over the complement in $Y$ gives the same family as (20).
    This is a single interval stabilization with both side faces movable. ◻
]

#thm([Lemma 4.4.])[
  #emph[The complement of $W_b$ up to $Y times { 2 }$ is, after compatible corner rounding,
    a product cylinder over the outgoing boundary of $W_b$, smoothly in $b$.
    Consequently $\[ W \] = 0$ in $\[ B \, H \( Y \) \]$.]
] <lem:product-complement>

#proof[
  Before rounding, the outgoing boundary of $W_b$ comprises the two sign domains at $t = 0$, the two band sides,
    and the band end at $t = 1$. Its complement is the union of $P_(- \, b)$ and $P_(+ \, b)$ with the upper
    collar $Y times \[ 1 \, 2 \]$. Use Lemma 8 on the sign regions.
    On and above the upper end, its common angular prescription extends across the band and has $d t > 0$.
    It can be continued to the top with that property. The resulting field points from every outgoing face of
    $W_b$ into the complement, and its only exit face is $t = 2$.
  We describe a rounding transverse to this field. At a lower corner put
  $ v = t \, wide w = plus.minus s_b - epsilon.alt \; $
  the complement is the quadrant $v \, w gt.eq 0$. At an upper corner put $v = t - 1$ and use the same $w$;
    the complement is the union $v gt.eq 0$ or $w gt.eq 0$. At either corner the field has $d v \( V \) >
    0$ and $d w \( V \) > 0$. Round the interface by a curve in the first quadrant at the bottom,
    and in the third quadrant at the top, smoothly joining the unchanged straight parts.
    Choose its conormal into the complement as a nonzero nonnegative combination of $d v \, d w$.
    This makes the rounded interface transverse with the same orientation.
  The product end coordinates allow fixed small planar roundings over all parameters.
    If the stabilized piece and its exterior are kept as separate pieces at the bottom seam,
    move their dividing wall in the small corner neighborhood so it reaches the rounded interface transversely.
    All transition maps there are identity. Each piece is then a fixed planar adjustment of its original collared
    model, so Lemma 10 still describes the rounded family.
  Every forward trajectory reaches $t = 2$ in finite time. In sufficiently small lower and upper collars,
    $d t \( V \)$ has a uniform positive lower bound; this bounds transit time there and prevents reentry across
    their inner thresholds in the wrong direction. In the remaining compact middle,
    a trajectory stays in one sign region and its signed $f_b$ increases at a rate bounded below,
    with bounded range. Its time there is therefore finite. It cannot exit across the entry boundary.
    The same argument backwards reaches the rounded outgoing boundary of $W_b$.
  Transversality gives smooth hitting times in the initial point and in $b$.
    Rescaling these times gives a product diffeomorphism of the complementary cobordism relative to its entry,
    say $E_b = partial_(+) W_b$. This proves a product identification over the entire possibly varying bundle $E
    arrow.r B$; it does not merely assert that the individual fibers are products.
  Finally, adding $E_b times I$ to the outgoing end changes no incoming-relative h-cobordism bundle class.
    Extend the transverse field a small uniform distance into $W$ to obtain a collar $E times \[ - eta \, 0 \]$.
    A fixed increasing smooth diffeomorphism $\[ - eta \, 1 \] arrow.r \[ - eta \, 0 \]$,
    equal to the identity near $- eta$, compresses the added cylinder into this collar,
    and is identity on the rest of $W$. It is defined without choosing a trivialization of $E arrow.r B$.
    The enlarged total is the literal product $B times Y times \[ - 1 \, 2 \]$, relative to its incoming boundary.
    Hence $\[ W \] = 0$. ◻
]

=== 4.3 Recovering the original cobordism family <recovering-the-original-cobordism-family>

We have shown that the extension to $Y$ of one interval stabilization of $C_b$ is a product family.
  We now show that this operation detects its class over $B = S^9$.

The stable parametrized $h$-cobordism theorem (4) is natural for this extension #cite(label("WJR2013"))
  Theorems 0.1 and 0.3.

The quantitative statements needed below are as follows. The single stabilization $H \( X \) arrow.r
  H \( X times J \)$ is $r$-connected provided

#[#set math.equation(numbering: n => "(21)")
 $ dim X gt.eq max \( 2 r + 8 \, 3 r + 5 \) . $ <eq:igusa-range>]

Every subsequent stage also satisfies this dimension bound, so the map $H \( X \) arrow.r
  H^s \( X \)$ is $r$-connected as well. Moreover, an $\( r + 1 \)$-connected map $X arrow.r
  Y$ induces an $r$-connected map $H^s \( X \) arrow.r H^s \( Y \)$.
  For the first statement we use Igusa’s stability theorem #cite(label("Igusa1988")) in the form of
  #cite(label("CP2025")) Theorem 2.16; the second is #cite(label("CP2025")) Theorem 2.17.
  Extension is the map of #cite(label("CP2025")) Definition 2.15.
  As specified in #cite(label("CP2025")) Remark 2.13, these statements use the WJR product convention (18).
  Connectivity here means isomorphisms on $pi_i$ for $i < r$ and a surjection on $pi_r$.

#thm([Proposition 4.5.])[
  #emph[Let $k \, l gt.eq 20$, and put
$ Y = S^(k + l - 1) \, wide Sigma = { q_(k \, l) = 0 } ∩ Y tilde.equiv S^(k - 1) times S^(l - 1) . $

 For a closed collar embedding $e : Sigma times J arrow.r.hook Y$, the composite
#[#set math.equation(numbering: n => "(22)")
 $ H \( Sigma \) arrow.r^sigma H \( Sigma times J \) arrow.r^(e_(!)) H \( Y \) arrow.r
   H^s \( Y \) $ <eq:hcob-injectivity-map>]

 induces an isomorphism on $pi_9$ in the product component.
   Consequently, if a sphere family in $H \( Sigma \)$ has null image under this composite, the family is itself null.]
] <prop:hcob-injectivity>

#proof[
  Here $dim Sigma = k + l - 2 gt.eq 38$, whereas the bound in (21) for $r = 10$ is $35$.
    Hence $H \( Sigma \) arrow.r H^s \( Sigma \)$ is $10$-connected.
    The composite $H \( Sigma \) arrow.r H \( Sigma times J \) arrow.r
    H^s \( Sigma times J \)$ has the same connectivity: its target is the tail of the defining stabilization
    telescope. It therefore induces an isomorphism on $pi_9$.
  Set $d = min \( k \, l \) - 1$. The source of $e$ is $\( d - 1 \)$-connected,
    and $Y$ has vanishing homotopy groups in degrees at most $d$. Thus $e$ is $d$-connected:
    it is an isomorphism below degree $d$ and a surjection in degree $d$.
    The stable extension $H^s \( Sigma times J \) arrow.r H^s \( Y \)$ is consequently $\( d - 1 \)$-connected,
    with $d - 1 gt.eq 18$, and also induces an isomorphism on $pi_9$.
    Compatibility of extension and stabilization identifies the composite of these two isomorphisms with (22).
  The space $H \( Sigma \)$ is connected, as shown above. For a connected target,
    free homotopy classes of maps from $S^9$ are orbits of based classes under the fundamental group action.
    The orbit of zero is just zero. Thus the same detection of nullity applies to sphere families without a
    specified basepoint. ◻
]

By Proposition 12, Lemmas 10 and 11 imply

#[#set math.equation(numbering: n => "(23)")
 $ c_B = 0 quad upright("in ") \[ B \, H \( Sigma \) \] . $ <eq:zero-cobordism-class>]

The passage to free sphere classes is harmless: the fundamental-group action fixes zero.
  The classification of smooth families by this h-cobordism space now supplies incoming-relative product
  trivializations of the whole family $C_b$, not just of its individual fibers;
  see #cite(label("CP2025")) Proposition 2.11.

=== 4.4 Removing the cobordism and straightening the cores <removing-the-cobordism-and-straightening-the-cores>

#proof[
  #emph[Completion of the proof of Proposition 5.] First replace the outer negative domains by their truncated
    domains $T_(- \, b)^1$; moving a regular boundary through a sufficiently small angular collar is an isotopy.
    By Lemma 9 and (23), each of these domains is $j_b \( T_(-)^0 \)$ with a smoothly varying product collar
    attached. Shrink that collar: if its product coordinate is $\[ 0 \, 1 \]$,
    retain only $\[ 0 \, s \]$ and let $s$ decrease to zero. The outer boundaries vary through embeddings,
    including at $s = 0$, where they equal $partial j_b \( T_(-)^0 \)$.
    Thus the family is homotopic as tube domains to $j_b \( T_(-)^0 \)$.
  Fix $T_(-)^0 tilde.equiv S^(k - 1) times D^l$ and let
  $ e_b : S^(k - 1) arrow.r.hook Y \, wide e_b \( u \) = j_b \( u \, 0 \) $
  be its cores. We may replace $j_b \( T_(-)^0 \)$ by small round normal neighborhoods of $e_b$.
    Here is a precise version that removes framing choices. First shrink its disk factors to a uniformly small
    radius. In metric normal-bundle charts of the cores write
  $ j_b \( u \, z \) = #scale(x: 120%, y: 120%)[\(] psi_b \( u \, z \) \,
    xi_b \( u \, z \) #scale(x: 120%, y: 120%)[\)] \, wide psi_b \( u \, 0 \) = u \, quad xi_b \( u \, 0 \) = 0 . $
  On this smaller domain use, for $0 < t lt.eq 1$, the embeddings
  #[#set math.equation(numbering: n => "(24)")
   $ \( u \, z \) mapsto #scale(x: 120%, y: 120%)[\(] psi_b \( u \, t z \) \, med
     t^(- 1) xi_b \( u \, t z \) #scale(x: 120%, y: 120%)[\)] . $ <eq:normal-linearization>]
  These are compositions of the original embedding with dilation in the disk and normal directions.
    The estimates $lr(bar.v.double xi_b \( u \, t z \) bar.v.double) lt.eq
    C t lr(bar.v.double z bar.v.double)$ keep them in the chosen chart.
    At $t = 0$ the formula extends smoothly to $\( u \, D_z xi_b \( u \, 0 \) z \)$.
    The normal derivative is an isomorphism, so the limit is also an embedding.
    Its fiber ellipsoids can be changed to round balls by interpolation of positive definite metrics,
    with the common disk radius chosen sufficiently small. At the level of domains this requires no fixed normal
    framing.
  The core family is homotopic through embeddings to the fixed standard core.
    Indeed, as maps into $Y = S^(k + l - 1)$, both it and the constant standard family are nullhomotopic because
  $ dim \( B times S^(k - 1) \) = k + 8 < k + l - 1 . $
  Choose a smooth homotopy, constant on collars of its two time endpoints.
    Its parameter dimension, including time, is ten. Relative fiberwise multijet transversality avoids double
    points since
  $ 10 + 2 \( k - 1 \) < k + l - 1 . $
  Vertical rank-defect strata have codimension at least $l + 1 > 10 + \( k - 1 \)$ and are avoided as well.
    Here we use the parametric multijet theorem in the form of #cite(label("BPT2025")) Theorem 2.3.4 and
    Corollary 2.3.5(iii), and explain its compact-parameter relative application.
    Cover the compact parameter manifold $B times \[ 0 \, 1 \]$, away from smaller endpoint collars,
    by finitely many coordinate charts. In each chart multiply the local perturbations by a parameter cutoff
    supported away from the endpoint collars. Local source cutoffs allow independent variations at distinct source
    points, as required for the two-point jets. Apply transversality successively on compact subsets covering
    these charts; sufficiently small subsequent perturbations preserve avoidance already obtained on compact
    subsets. The rank estimate first gives fiberwise immersions.
    Compactness and $C^1$ openness then give a uniform neighborhood of the diagonal on which distinct sufficiently
    close source points remain distinct. Apply the two-point argument on the compact complement of this
    neighborhood. The strict dimension bounds make each transverse bad-stratum preimage empty.
    The endpoint families remain fixed, and their embedding property persists on smaller endpoint collars by $C^1$
    openness. This proves that every member of the resulting homotopy is an embedding.
    Uniformly small round normal neighborhoods follow this family to a fixed tube.
  All the resulting homotopies of domains give homotopies of tube data.
    Use boundary collars for local defining-function choices; the fibers of these choices are convex,
    so partitions of unity in parameters give global choices.
    Continuous families in the smooth topology suffice for the homotopy class;
    when smooth parameter dependence is needed, relative approximation preserves embeddings and regularity on
    compact parameter sets. We have proved nullity of the enlarged family in $T_(k \, l)$.
    Adding the missing negative squares returns to the diagonal system and proves the proposition. ◻
]

== 5 An exact embedded realization <sec:embedding>

We now turn the nonzero tube family of Section 2 into a closed exact embedded Lagrangian.
  A sphere factor records the direction of the vertical gradient.
  Its momenta separate branches except in one direction, and a scale varying over $S^9$ separates the remaining pairs.

We first recall the elementary generating-family criterion, including the immersion statement needed below.
  If $M$ is a smooth manifold, a smooth function $F : M times bb(R)^r arrow.r
  bb(R)$ is a #emph[Morse family] when zero is a regular value of the full map $d_w F : M times
  bb(R)^r arrow.r \( bb(R)^r \)^(*)$. Individual fiber Hessians need not be invertible. Write

$ "Crit" \( F \) = { \( q \, w \) : d_w F \( q \, w \) = 0 } \, wide
  Gamma_F \( q \, w \) = \( q \, d_q F \( q \, w \) \) . $

#thm([Lemma 5.1.])[
  #emph[For a Morse family, $Gamma_F : "Crit" \( F \) arrow.r T^(*) M$ is an exact Lagrangian immersion,
    with primitive $F \|_("Crit" \( F \))$.]
] <lem:generating-map>

#proof[
  The critical locus is smooth of dimension $dim M$. In local coordinates,
    its defining differential is the surjective matrix
  $ A = \( F_(w q) \, F_(w w) \) . $
  A tangent vector killed by $d Gamma_F$ has $delta q = 0$, $F_(w w) delta w = 0$, and $F_(q w) delta w = 0$.
    Since $F_(w w)$ is symmetric, these equations say $A^(sans(T)) delta w = 0$.
    Surjectivity of $A$ forces $delta w = 0$. Thus $Gamma_F$ is an immersion.
    On the critical locus $d_w F = 0$, and hence
  $ Gamma_F^(*) lambda = d \( F \|_("Crit" \( F \)) \) . $
  Its pullback of $d lambda$ is zero. The dimension just computed proves that the immersion is Lagrangian. ◻
]

Take the family $g_b$ from Lemma 4, with $B = S^9$, $N = 2 m$, and a height function $theta : B arrow.r bb(R)$.
  Fix a metric on $B$. Choose a union $U_0$ of neighborhoods of the two critical points of $theta$ on which $g_b$
  is the fixed quadratic form. Thus

$ delta_0 := min_(B \\ U_0) lr(bar.v.double d theta bar.v.double) > 0 . $

Smooth angular dependence and homogeneity give a constant $C_1$ such that

#[#set math.equation(numbering: n => "(25)")
 $ lr(bar.v.double d_w d_b g_b \( w \) bar.v.double) lt.eq
   C_1 lr(bar.v.double w bar.v.double) . $ <eq:mixed-derivative-bound>]

Here $d_b g_b$ is a covector at $b$ and the norm is the corresponding operator norm.
  Its extension at $w = 0$ is $C^1$, with derivative zero there.

#thm([Proposition 5.2.])[
  #emph[On $Q = B times S^(N - 1)$ there is a smooth Morse family $F : Q times bb(R)^N arrow.r
    bb(R)$ which equals $g_b \( w \)$ outside a uniform vertical ball and whose generating map is a diffeomorphism
    from its critical locus onto a closed exact embedded Lagrangian $L subset T^(*) Q$.
    Its critical locus, and hence $L$, is diffeomorphic to $Q$.
    The infinity class on each slice $B times { v_0 }$ is the chosen class $a$.]
] <prop:embedded-realization>

#proof[
  Choose
  #[#set math.equation(numbering: n => "(26)")
   $ K delta_0 > C_1 \/ c \, $ <eq:scale-choice>]
  where $c lr(bar.v.double w bar.v.double) lt.eq lr(bar.v.double nabla g_b \( w \) bar.v.double) lt.eq
    C lr(bar.v.double w bar.v.double)$. Set
  $ R \( b \) = Lambda e^(K theta \( b \)) . $
  Let $G_b$ be smooth on all of $bb(R)^N$ and agree with $g_b$ for $lr(bar.v.double w bar.v.double) gt.eq 1$;
    multiplying by a radial cutoff which vanishes near zero gives such a family.
    Let $beta : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ be smooth,
    equal to one on $\[ 0 \, 1 \]$ and zero on $\[ 2 \, oo \)$. Define
  #[#set math.equation(numbering: n => "(27)")
   $ F \( b \, v \, w \) = G_b \( w \) - R \( b \) beta \( lr(bar.v.double w bar.v.double) \/ T \) chevron.l v \,
     w chevron.r \, wide v in S^(N - 1) . $ <eq:embedded-family>]
  Choose $Lambda$ so large that
  $ R_min > max {C \, med sup_(b \, thin lr(bar.v.double w bar.v.double) lt.eq 1)
    lr(bar.v.double nabla G_b \( w \) bar.v.double)} . $
  With
  $ D_beta = sup_(s gt.eq 0) #scale(x: 120%, y: 120%)[\(] \| beta \( s \) \| +
    s \| beta' \( s \) \| #scale(x: 120%, y: 120%)[\)] \, $
  choose
  #[#set math.equation(numbering: n => "(28)")
   $ T > max { 1 \, R_max \/ c \, D_beta R_max \/ c } . $ <eq:T-choice>]
  These choices are made in the order $K$, $Lambda$, $T$.
  There are no vertical critical points with $lr(bar.v.double w bar.v.double) lt.eq 1$, by the choice of $R_min$.
    For $lr(bar.v.double w bar.v.double) gt.eq T$, the vertical derivative of the cutoff linear term has norm at
    most $D_beta R \( b \)$, so
  $ lr(bar.v.double d_w F bar.v.double) gt.eq c lr(bar.v.double w bar.v.double) - D_beta R \( b \) > 0 . $
  All critical points therefore satisfy precisely
  #[#set math.equation(numbering: n => "(29)")
   $ nabla g_b \( w \) = R \( b \) v . $ <eq:embedded-critical>]
  Conversely every solution of this equation has
  $ 1 < R \( b \) \/ C lt.eq lr(bar.v.double w bar.v.double) lt.eq R \( b \) \/ c < T \, $
  so it is a critical point of (27). By homogeneity, the critical locus is smoothly parameterized by
  #[#set math.equation(numbering: n => "(30)")
   $ \( b \, u \) mapsto
     (b \, frac(nabla g_b \( u \), lr(bar.v.double nabla g_b \( u \) bar.v.double)) \, frac(R \( b \) u,
     lr(bar.v.double nabla g_b \( u \) bar.v.double))) \, wide u in S^(N - 1) . $ <eq:critical-parametrization>]
  Its inverse recovers $u = w \/ lr(bar.v.double w bar.v.double)$.
  To check regularity of the critical equation, vary $v$ in $v^perp$:
    its contribution to the differential is $- R delta v$. Radial variation $delta w =
    w$ contributes $nabla g_b \( w \) = R v$, because $nabla g_b$ is homogeneous of degree one.
    These variations span $bb(R)^N$. Hence $F$ is a Morse family, and Lemma 13 gives an exact Lagrangian immersion.
  It remains to prove injectivity. Two points with the same image must first have the same base coordinates
    $\( b \, v \)$. At critical points the cutoffs are constant and $G_b = g_b$.
    Equality of the covectors in the sphere direction, which are
  $ d_v F \( dot(v) \) = - R \( b \) chevron.l w \, dot(v) chevron.r \, wide dot(v) perp v \, $
  therefore implies $w - w' = t v$ for some $t in bb(R)$. Both endpoints, and their whole straight segment,
    have norm at most $R \( b \) \/ c$. The bound (25) yields
  #[#set math.equation(numbering: n => "(31)")
   $ lr(bar.v.double d_b g_b \( w \) - d_b g_b \( w' \) bar.v.double) lt.eq \( C_1 \/ c \) R \( b \) \| t \| .
     $ <eq:collision-bound>]
  This use of the fundamental theorem of calculus remains valid if the segment passes through zero,
    since $d_b g_b$ is $C^1$ there.
  The difference in the $B$-momenta is
  $ d_b g_b \( w \) - d_b g_b \( w' \) - K R \( b \) t thin d theta_b . $
  For $b in.not U_0$, its norm is at least
  $ R \( b \) \| t \| #scale(x: 120%, y: 120%)[\(] K delta_0 - C_1 \/ c #scale(x: 120%, y: 120%)[\)] . $
  By (26), equality of those momenta forces $t = 0$. For $b in U_0$,
    the function $g_b$ is the fixed nondegenerate quadratic form,
    and (29) already has a unique solution for each $v$. Thus the immersion is injective everywhere.
  Figure 2 summarizes the two momentum tests.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.36), (3.816, 0.36), stroke: (paint: rgb("#666666"), thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: ">"))
  content((3.816, 0.36), [#text(size: 9pt)[$v^ perp$]], anchor: "west", padding: 0.07056cm)
  line((0, 0.36), (0, 3.168), stroke: (paint: rgb("#666666"), thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: ">"))
  content((0, 3.168), [#text(size: 9pt)[$v$]], anchor: "south", padding: 0.07056cm)
  line((2.448, 0.36), (2.448, 2.902), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  line((2.448, 1.066), (2.448, 2.722), stroke: (thickness: 1.0pt, cap: "round", miter-limit: 10))
  circle((2.448, 1.066), radius: 0.07056, fill: black, stroke: none)
  content((2.448, 1.066), [#text(size: 9pt)[$w'$]], anchor: "west", padding: 0.07056cm)
  circle((2.448, 2.722), radius: 0.07056, fill: black, stroke: none)
  content((2.448, 2.722), [#text(size: 9pt)[$w$]], anchor: "west", padding: 0.07056cm)
  line((2.138, 1.152), (2.138, 2.635), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: ">"))
  content((2.138, 1.894), [#text(size: 9pt)[$"tv"$]], anchor: "east", padding: 0.07056cm)
  circle((2.448, 0.36), radius: 0.05644, fill: rgb("#666666"), stroke: none)
  content((2.448, 0.1728), [#text(size: 8pt)[same projection#linebreak()onto $v^ perp$]], anchor: "north", padding: 0.07056cm)
  content((5.04, 2.772), [#text(size: 9pt)[Equal sphere momenta force]], anchor: "west", padding: 0.07056cm)
  content((5.04, 2.318), [#text(size: 9pt)[$w-w'="tv"$.]], anchor: "west", padding: 0.07056cm)
  content((5.04, 1.692), [#text(size: 9pt)[For $b in.not U_0$, base momenta satisfy]], anchor: "west", padding: 0.07056cm)
  content((5.04, 1.116), [#text(size: 9pt)[$\| Delta p_B\| gt.eq R(b)|t|(K delta_0-C_1"/"c)$.]], anchor: "west", padding: 0.07056cm)
  content((5.04, 0.504), [#text(size: 9pt)[$K delta_0>C_1"/"c, Delta p_B=0#h(0.3333em) arrow.r.double.long#h(0.3333em) t=0$.]], anchor: "west", padding: 0.07056cm)
})],
    caption: [Figure 2: Schematic of the two momentum tests for two critical points at fixed base coordinates $\( b \, v \)$, with $Delta p_B$ the difference of the $B$-momenta. Sphere momenta detect the component of $w$ perpendicular to $v$; the varying scale separates the remaining pairs outside $U_0$. Within $U_0$, the fixed quadratic critical equation has a unique solution. The two-dimensional drawing represents an orthogonal decomposition only. The estimate also holds when the segment from $w'$ to $w$ passes through zero. ],
  ) <fig:momentum-separation>
  The parameter space in (30) is compact and has no boundary.
    A compact injective immersion is an embedding, so its image is a closed exact embedded $L tilde.equiv Q$.
    In fact Euler’s identity gives the global primitive $F \|_("Crit" \( F \)) = - g_b \( w \)$,
    although the exactness argument did not require this formula.
    Finally, for $lr(bar.v.double w bar.v.double) gt.eq 2 T$,
    the family equals $g_b \( w \)$ independently of $v$. Its restriction at infinity to any fixed sphere slice
    therefore represents $a$. ◻
]

== 6 Hamiltonian transport and the obstruction <sec:transport>

We now transport the generating family of Proposition 14 under a hypothetical Hamiltonian isotopy.
  The construction below keeps track of its actual homogeneous data at infinity.
  Each step adds a fixed quadratic form of split signature,
  followed by a homotopy through regular homogeneous data. In particular,
  the construction applies to the nonconstant tube family used here.
  The construction follows the classical strategy of composing with small Hamiltonian steps and adding split
  quadratic variables #cite(label("Sikorav1987")) Sections 1.3–1.7;
  generating families and their invariance under isotopy are also developed in #cite(label("EG1998")).
  For a related generating-family lifting statement, see Álvarez-Gavela et al. #cite(label("AIS2026")) Lemma 3.23;
  the argument needed here is given directly.

We use the Morse families and generating maps $Gamma_F$ of Section 5.
  For any manifold $M$, write $M_0 subset T^(*) M$ for its zero section.
  Every family constructed below has $Gamma_F$ a diffeomorphism from $"Crit" \( F \)$ onto the Lagrangian it generates.

=== 6.1 A Euclidean cylinder and a compactly supported extension <a-euclidean-cylinder-and-a-compactly-supported-extension>

Retain $N = 2 m$ and $Q = S^9 times S^(N - 1)$ from the preceding construction, and put $d = 10 + N$.
  View $Q$ as the product of unit spheres in $bb(R)^10 times bb(R)^N = bb(R)^d$. For $0 < nu < 1$, the map

$ iota : Q times \( - nu \, nu \)^2 arrow.r bb(R)^d \, wide
  iota \( \( b \, v \) \, alpha \) = \( \( 1 + alpha_1 \) b \, \( 1 + alpha_2 \) v \) $

is a diffeomorphism onto a bounded open neighborhood $U$ of $Q$.
  Its inverse, the projection $r_Q : U arrow.r Q$, and its two radial coordinates extend smoothly to a
  neighborhood of $overline(U)$. The cotangent lift gives the canonical identification

$ T^(*) U tilde.equiv T^(*) Q times T^(*) \( \( - nu \, nu \)^2 \) \, wide lambda_U = lambda_Q +
  p_alpha dot.op d alpha . $

If $F$ is the family of Proposition 14, then

#[#set math.equation(numbering: n => "(32)")
 $ F^(\( 0 \)) \( x \, w \) = F \( r_Q \( x \) \, w \) $ <eq:transport-initial-family>]

is a Morse family whose generated image is the cylinder

#[#set math.equation(numbering: n => "(33)")
 $ cal(L)_0 = { \( q \, alpha \; p_q \, 0 \) : \( q \, p_q \) in L \, med
   alpha in \( - nu \, nu \)^2 } . $ <eq:transport-cylinder>]

Its critical parametrization is a diffeomorphism. All its vertical critical points lie in a uniform ball,
  and it has the stated smoothness and homogeneous estimates uniformly up to $overline(U)$.

#thm([Lemma 6.1.])[
  (Extension of the reverse isotopy).  #emph[Suppose that a smooth compactly supported Hamiltonian isotopy of
    $T^(*) Q$ sends $Q_0$ to $L$. There is a smooth Hamiltonian on $T^(*) bb(R)^d$,
    supported for all times in one compact subset of $T^(*) U$,
    whose flow $tilde(phi)_t$ has the following properties. Every trajectory starting on $cal(L)_0$ has constant
    radial position $alpha$. For some $nu_c > 0$, the final image over $U_c =
    iota \( Q times \( - nu_c \, nu_c \)^2 \)$ is precisely the zero section:
#[#set math.equation(numbering: n => "(34)")
 $ tilde(phi)_1 \( cal(L)_0 \) ∩ T^(*) U_c = \( U_c \)_0 . $ <eq:transport-central-zero>]

]
] <lem:transport-cylinder-extension>

#proof[
  Let $phi_t$ be the assumed original flow, generated by $H_t$.
    The path $phi_(1 - t) compose phi_1^(- 1)$ starts at the identity, ends at $phi_1^(- 1)$, and is generated by
  #[#set math.equation(numbering: n => "(35)")
   $ H_t^Q = - H_(1 - t) . $ <eq:transport-reverse-sign>]
  Indeed differentiation of this path gives $- X_(H_(1 - t))$ at its current point;
    the fixed composition on the right introduces no conjugation of the Hamiltonian.
  Choose $0 lt.eq zeta lt.eq 1$ supported in $\( - nu \, nu \)^2$ and identically $1$ on $\( - nu_c \, nu_c \)^2$.
    Choose $0 lt.eq xi lt.eq 1$ of compact support in $bb(R)^2$, with $xi = 1$ on a ball to be specified.
    On $T^(*) U$ set
  #[#set math.equation(numbering: n => "(36)")
   $ tilde(H)_t \( q \, alpha \; p_q \, p_alpha \) = H_t^Q \( q \, p_q \) zeta \( alpha \) xi \( p_alpha \) \,
     $ <eq:transport-extended-hamiltonian>]
  and extend by zero to $T^(*) bb(R)^d$. This is smooth with uniform compact support:
    $Q$ is compact, $H_t^Q$ has uniformly compact momentum support, and both additional coordinate pairs are cut off.
  The convention $iota_(X_H) d lambda = - d H$ gives the radial equations
  #[#set math.equation(numbering: n => "(37)")
   $ dot(alpha) = H_t^Q zeta thin nabla xi \( p_alpha \) \, wide dot(p)_alpha = -
     H_t^Q nabla zeta thin xi \( p_alpha \) . $ <eq:transport-radial-equations>]
  Set
  $ M = sup_(t \, q \, p_q) \| H_t^Q \( q \, p_q \) \| thin sup_alpha
    lr(bar.v.double nabla zeta \( alpha \) bar.v.double) . $
  This number is independent of the size of the plateau of $xi$.
    Take $xi = 1$ on ${ lr(bar.v.double p_alpha bar.v.double) lt.eq M + 1 }$.
    A trajectory starting on $cal(L)_0$ starts with $p_alpha = 0$,
    and the second equation gives $lr(bar.v.double p_alpha \( t \) bar.v.double) lt.eq M t$ for $0 lt.eq t lt.eq
    1$. Hence it stays in this plateau, the first equation vanishes, and $alpha$ is constant.
    When $alpha in \( - nu_c \, nu_c \)^2$, also $nabla zeta = 0$; then $p_alpha =
    0$ and the $T^(*) Q$ motion is exactly the reverse isotopy. It sends $L$ to $Q_0$.
    Since all radial positions on the entire cylinder are fixed,
    no other part of that cylinder enters the central slab. This proves (34). ◻
]

=== 6.2 A compact mixed generating function for each small step <a-compact-mixed-generating-function-for-each-small-step>

Fix a compact subset $K subset.double T^(*) U$ containing the support of $tilde(H)_t$ in its interior for every
  $t$. Points outside $K$ are stationary, and uniqueness of flow lines prevents a trajectory from crossing into
  the stationary exterior in finite time. In particular, all the flow maps and their successive time increments
  are supported in this common compact region. Smoothness in time and compactness allow a finite subdivision

$ 0 = t_0 < t_1 < dots.h.c < t_s = 1 $

such that every map $psi_j = tilde(phi)_(t_j) tilde(phi)_(t_(j - 1))^(- 1)$ is as close to the identity in $C^1$
  as required below.

#thm([Lemma 6.2.])[
  (Mixed coordinates and the action primitive).  #emph[For a sufficiently small increment,
    write $psi \( x \, p \) = \( X \, P \)$ in the Euclidean cotangent coordinates.
    The pair $\( X \, p \)$ is a global coordinate system on its graph.
    There is a smooth compactly supported function $sigma \( X \, p \)$ such that
#[#set math.equation(numbering: n => "(38)")
 $ x = X + sigma_p \( X \, p \) \, wide P = p + sigma_X \( X \, p \) . $ <eq:transport-mixed-graph>]

 One can choose a single compact $D subset.double U$ containing the spatial support projection of all these
   functions, independently of a subsequent refinement of the subdivision.
   Also $I + sigma_(p X)$ is invertible, and refinement makes $lr(bar.v.double sigma_p bar.v.double)_oo$
   arbitrarily small.]
] <lem:transport-mixed-generator>

#proof[
  Require $lr(bar.v.double D_x X - I bar.v.double) < epsilon < 1$ uniformly.
    For each fixed $p$, the map $x mapsto X \( x \, p \)$ is a local diffeomorphism and satisfies
  $ lr(bar.v.double X \( x_1 \, p \) - X \( x_2 \, p \) bar.v.double) gt.eq \( 1 - epsilon \)
    lr(bar.v.double x_1 - x_2 bar.v.double) . $
  It is injective and proper, since it is the identity outside a compact set.
    Its image is both open and closed in $bb(R)^d$, so it is onto.
    The inverse $x = x \( X \, p \)$ is smooth jointly in $\( X \, p \)$.
  For a step from time $a$ to time $b$, let $phi_(s \, a)$ denote its partial flow.
    Cartan’s formula and the sign convention give
  $ cal(L)_(X_(tilde(H)_s)) lambda = d #scale(x: 120%, y: 120%)[\(] lambda \( X_(tilde(H)_s) \) -
    tilde(H)_s #scale(x: 120%, y: 120%)[\)] . $
  Consequently the action integral
  #[#set math.equation(numbering: n => "(39)")
   $ A \( x \, p \) = integral_a^b #scale(x: 120%, y: 120%)[\(] lambda \( X_(tilde(H)_s) \) -
     tilde(H)_s #scale(x: 120%, y: 120%)[\)] \( phi_(s \, a) \( x \, p \) \) thin d s $ <eq:transport-action>]
  satisfies $psi^(*) lambda - lambda = d A$. It is compactly supported:
    outside $K$ the trajectory is stationary and its integrand is zero.
    On the graph, expressed in mixed coordinates, put
  $ S \( X \, p \) = A \( x \( X \, p \) \, p \) + x \( X \, p \) dot.op p . $
  Then
  $ d S = P dot.op d X + x dot.op d p . $
  Writing $S = X dot.op p + sigma$ gives (38). Explicitly,
  #[#set math.equation(numbering: n => "(40)")
   $ sigma \( X \, p \) = A \( x \( X \, p \) \, p \) + \( x \( X \, p \) - X \) dot.op p .
     $ <eq:transport-compact-sigma>]
  This expression vanishes outside the compact mixed-coordinate image of $K$.
    Its spatial projection lies in a fixed compact subset of $U$,
    because both the input and output trajectories remain in $K$.
    Enlarge that projection slightly to obtain $D subset.double U$.
    Thus for every $X in U \\ D$, $sigma$ and all its derivatives vanish on a neighborhood of $X$,
    for all momenta. Finally $I + sigma_(p X) = D_X x$ is invertible, and $sigma_p = x -
    X$ tends uniformly to zero with the length of the time increment. ◻
]

=== 6.3 Transport of one Morse family <transport-of-one-morse-family>

The following step supplies the analytic induction. The variables called $w$ include all the stabilizing variables
  introduced at earlier steps.

#thm([Proposition 6.3.])[
  (One transport step with controlled infinity data).  #emph[Suppose $F_o : U times bb(R)^r arrow.r
    bb(R)$ is a smooth Morse family, with $Gamma_(F_o)$ a diffeomorphism onto its generated Lagrangian $cal(L)_o
    subset T^(*) U$. Suppose that it is smooth up to $overline(U)$, with uniform bounds on compact vertical sets,
    and equals a homogeneous function $g_o \( x \, w \)$ for $lr(bar.v.double w bar.v.double) gt.eq R_o$,
    where $g_o$ is smooth for $w eq.not 0$ and
#[#set math.equation(numbering: n => "(41)")
 $ lr(bar.v.double nabla_w g_o \( x \, w \) bar.v.double) gt.eq c_o lr(bar.v.double w bar.v.double) \, wide
   lr(bar.v.double d_x g_o \( x \, w \) bar.v.double) lt.eq C_o lr(bar.v.double w bar.v.double)^2 \, wide
   c_o > 0 . $ <eq:transport-old-bounds>]

 For a small step $psi$ as in Lemma 16, there is a smooth Morse family on $U times
   bb(R)^(r + 2 d)$ generating $psi \( cal(L)_o \)$ with the same properties.
   Its critical locus corresponds diffeomorphically to $"Crit" \( F_o \)$.
   On every fixed compact parameter slice in $U$, its homogeneous data represent the split quadratic stabilization
   of the preceding tube class.]
] <prop:transport-step>

#proof[
  Introduce $z \, p in bb(R)^d$. Before choosing cutoffs, consider the local expression
  $ F_o \( X + z \, w \) + sigma \( X \, p \) - z dot.op p \, wide X + z in U . $
  Its $p$- and $z$-equations are $z = sigma_p \( X \, p \)$ and $p = nabla_x F_o \( X + z \, w \)$.
    Together with the old $w$-equation, these are precisely the mixed graph equations for composition with $psi$:
    $z$ is the displacement from the new base point $X$ to the old one, and $p$ is the old momentum.
    The cutoffs below keep the shifted base point in $U$ and switch off the shift for large
    $lr(bar.v.double w bar.v.double)$. We will then compare the result with $g_o \( X \, w \) -
    z dot.op p$ to restore homogeneity at infinity.
  #emph[Choice of cutoffs.] Choose $zeta_1 : U arrow.r \[ 0 \, 1 \]$ of compact support,
    identically $1$ on an open set $V$ containing $D$. Fix $delta_0 > 0$ so that
  #[#set math.equation(numbering: n => "(42)")
   $ 2 delta_0 < "dist" \( "supp" zeta_1 \, partial U \) \, wide
     lr(bar.v.double sigma_p bar.v.double)_oo < delta_0 . $ <eq:transport-buffer>]
  The first choice is made before refining the subdivision to obtain the second.
    Let $beta_1 : bb(R)^d arrow.r \[ 0 \, 1 \]$ be $1$ for $lr(bar.v.double z bar.v.double) lt.eq
    delta_0$ and $0$ for $lr(bar.v.double z bar.v.double) gt.eq 2 delta_0$.
    Choose a smooth radial $chi : bb(R)^r arrow.r \[ 0 \, 1 \]$,
    equal to $1$ on a ball strictly larger than ${ lr(bar.v.double w bar.v.double) lt.eq R_o }$,
    of compact support, and such that
  #[#set math.equation(numbering: n => "(43)")
   $ lr(bar.v.double nabla chi \( w \) bar.v.double) lt.eq delta_1 \/ lr(bar.v.double w bar.v.double)
     quad \( w eq.not 0 \) . $ <eq:transport-log-cutoff>]
  Here $delta_1 > 0$ may be arbitrarily small. For example, after fixing the inner radius $R_1 > R_o$,
    take $chi \( w \) = theta.alt \( log \( lr(bar.v.double w bar.v.double) \/ R_1 \) \/ T \)$ outside that
    radius, where $theta.alt$ is a fixed smooth cutoff equal to $1$ near $\( - oo \, 0 \]$ and $0$ near
    $\[ 1 \, oo \)$; choosing $T$ sufficiently large gives (43). Extend it by $1$ at smaller radii.
  Define
  #[#set math.equation(numbering: n => "(44)")
   $ kappa \( X \, z \, w \) & = zeta_1 \( X \) beta_1 \( z \) chi \( w \) \, & x & = X + kappa \( X \, z \, w \) z \,\
hat(F) \( X \, w \, z \, p \) & = F_o \( X + kappa \( X \, z \, w \) z \, w \) + sigma \( X \, p \) -
  z dot.op p . $ <eq:transport-kappa>]
  The shifted argument always lies in $U$. Indeed, when the shift is nonzero,
    $X in "supp" zeta_1$ and its length is less than $2 delta_0$;
    the buffer in (42) places that entire ball in $U$. When the shift vanishes the assertion is immediate.
  #emph[The full critical equations.] Write $a = nabla_x F_o \( x \, w \)$,
    identifying Euclidean covectors and vectors. Direct differentiation, before discarding any cutoff terms, gives
  #[#set math.equation(numbering: n => "(45)")
   $ hat(F)_p & = sigma_p \( X \, p \) - z \,\
hat(F)_z & = kappa a + \( a dot.op z \) nabla_z kappa - p \,\
hat(F)_w & = nabla_w F_o \( x \, w \) + \( a dot.op z \) nabla_w kappa \,\
hat(F)_X & = a + \( a dot.op z \) nabla_X kappa + sigma_X \( X \, p \) . $ <eq:transport-critical-p>]
  At any vertical critical point, (45) forces $z = sigma_p \( X \, p \)$,
    hence $lr(bar.v.double z bar.v.double) < delta_0$ and $beta_1 = 1$ on a neighborhood of that point.
    When $lr(bar.v.double w bar.v.double) gt.eq R_o$, the old function is homogeneous at every allowed shifted
    base point. Equations (41) and (43) therefore imply
  #[#set math.equation(numbering: n => "(46)")
   $ lr(bar.v.double hat(F)_w bar.v.double) gt.eq \( c_o - C_o delta_0 delta_1 \)
     lr(bar.v.double w bar.v.double) . $ <eq:transport-outer-gradient>]
  Choose $delta_1$ so that $C_o delta_0 delta_1 < c_o \/ 2$.
    Thus no vertical critical point has $lr(bar.v.double w bar.v.double) gt.eq R_o$; at every one of them $chi =
    1$ on a neighborhood as well.
  There are two open regions to consider, namely $V$ and $U \\ D$; they cover $U$.
    For $X in V$, the three cutoff factors are $1$ near a solution, and the critical equations become
  #[#set math.equation(numbering: n => "(47)")
   $ nabla_w F_o \( x \, w \) = 0 \, wide p = nabla_x F_o \( x \, w \) \, wide x = X + sigma_p \( X \, p \) \,
     wide x = X + z . $ <eq:transport-supported-critical>]
  They express exactly composition with the graph (38), and the generated covector is
  #[#set math.equation(numbering: n => "(48)")
   $ hat(F)_X = p + sigma_X \( X \, p \) = P . $ <eq:transport-supported-output>]
  The critical equation is regular here. In local total coordinates $\( x \, w \, p \, X \)$,
    first impose the regular old equation $nabla_w F_o = 0$. With $\( x \, w \)$ fixed, the equation $p -
    nabla_x F_o = 0$ has identity coefficient in $p$. With $\( x \, w \, p \)$ fixed,
    the last graph equation has invertible coefficient $I + sigma_(p X)$ in $X$.
    This triangular order proves surjectivity of the differential of the full new vertical-gradient map.
  For $X in U \\ D$, the function $sigma$ vanishes on a spatial neighborhood for all $p$.
    The equations instead reduce to
  #[#set math.equation(numbering: n => "(49)")
   $ z = 0 \, wide x = X \, wide nabla_w F_o \( X \, w \) = 0 \, wide p =
     zeta_1 \( X \) nabla_x F_o \( X \, w \) . $ <eq:transport-outside-critical>]
  The auxiliary variable $p$ may therefore differ from the old momentum. Nevertheless, (45) gives exactly
  #[#set math.equation(numbering: n => "(50)")
   $ hat(F)_X = nabla_x F_o \( X \, w \) \, $ <eq:transport-outside-output>]
  because all the spatial cutoff terms are multiplied by $z = 0$.
    This is the identity correspondence, which is the true graph of $psi$ over this region.
    For regularity, first use the equation $- z = 0$ to eliminate $z$, then the equation $zeta_1 nabla_x F_o - p =
    0$ to eliminate $p$; the remaining equation is the regular old vertical-gradient equation.
    This also checks the entire transition region of $zeta_1$.
    The two descriptions agree on the overlap, where $zeta_1 = 1$.
  #emph[The correspondence of critical loci.] For an old critical point $\( x \, w \)$ put $p_o =
    nabla_x F_o \( x \, w \)$ and $\( X \, P \) = psi \( x \, p_o \)$. Define
  #[#set math.equation(numbering: n => "(51)")
   $ \( x \, w \) mapsto #scale(x: 120%, y: 120%)[\(] X \, w \, z = x - X \, med p =
     zeta_1 \( X \) p_o #scale(x: 120%, y: 120%)[\)] . $ <eq:transport-critical-correspondence>]
  If $X in V$, these are the mixed graph equations, with $p = p_o$.
    If $X in.not D$, the true graph is the identity, so $x = X$, $z = 0$, and (49) applies.
    Thus (51) is a smooth map into $"Crit" \( hat(F) \)$ on all of $"Crit" \( F_o \)$. Its inverse is
  #[#set math.equation(numbering: n => "(52)")
   $ \( X \, w \, z \, p \) mapsto \( X + kappa \( X \, z \, w \) z \, w \) . $ <eq:transport-critical-inverse>]
  The preceding equations show that these maps are inverse and that the generated image is exactly
    $psi \( cal(L)_o \)$. The step preserves $T^(*) U$, since its support is compactly contained there.
    Thus no old or new critical point is lost at the base boundary,
    and $Gamma_(hat(F))$ is a diffeomorphism onto the transported image. All new solutions obey a uniform bound:
    $lr(bar.v.double w bar.v.double) < R_o$, $lr(bar.v.double z bar.v.double) < delta_0$, and
  $ lr(bar.v.double p bar.v.double) lt.eq sup { lr(bar.v.double nabla_x F_o \( x \, w \) bar.v.double) :
    x in overline(U) \, lr(bar.v.double w bar.v.double) lt.eq R_o } < oo . $
  #emph[Restoring exact homogeneity at infinity.] Set $W = \( w \, z \, p \)$ and consider the homogeneous reference
  #[#set math.equation(numbering: n => "(53)")
   $ G_0 \( X \, W \) = g_o \( X \, w \) - z dot.op p . $ <eq:transport-homogeneous-reference>]
  It is $C^1$ everywhere, homogeneous of degree two, and satisfies
  #[#set math.equation(numbering: n => "(54)")
   $ lr(bar.v.double nabla_W G_0 bar.v.double)^2 = lr(bar.v.double nabla_w g_o bar.v.double)^2 +
     lr(bar.v.double z bar.v.double)^2 + lr(bar.v.double p bar.v.double)^2 gt.eq
     min \( c_o^2 \, 1 \) lr(bar.v.double W bar.v.double)^2 . $ <eq:transport-reference-gradient>]
  Both the value error and its #emph[full] vertical first derivative are uniformly bounded.
    To verify this explicitly, write
  #[#set math.equation(numbering: n => "(55)")
   $ E \( X \, W \) & = hat(F) \( X \, W \) - G_0 \( X \, W \)\
 & = #scale(x: 120%, y: 120%)[\[] F_o \( X + kappa z \, w \) - F_o \( X \, w \) #scale(x: 120%, y: 120%)[\]] +
   #scale(x: 120%, y: 120%)[\[] F_o \( X \, w \) - g_o \( X \, w \) #scale(x: 120%, y: 120%)[\]] +
   sigma \( X \, p \) . $ <eq:transport-error-decomposition>]
  The first bracket and every term in its vertical derivative can be nonzero only with $w \,
    z$ in fixed bounded sets, where the required derivatives of $F_o$ are uniformly bounded.
    The second bracket and its vertical derivative are bounded because it vanishes for
    $lr(bar.v.double w bar.v.double) gt.eq R_o$. The final term has compact support.
    The expression $- z dot.op p$, although unbounded, has cancelled exactly. Thus for some finite $M_0 \, M_1$,
  #[#set math.equation(numbering: n => "(56)")
   $ \| E \( X \, W \) \| lt.eq M_0 \, wide lr(bar.v.double nabla_W E \( X \, W \) bar.v.double) lt.eq
     M_1 quad \( X in overline(U) \, W in bb(R)^(r + 2 d) \) . $ <eq:transport-bounded-error>]
  No compact-support assertion for $E$ in all its variables is needed.
  Apply Lemma 7 with $q' \( z \, p \) = - z dot.op p$, uniformly over $overline(U)$. Its homogeneous smoothing is
  #[#set math.equation(numbering: n => "(57)")
   $ G_eta \( X \, W \) = rho_eta \( lr(bar.v.double w bar.v.double) \/ lr(bar.v.double W bar.v.double) \)
     g_o \( X \, w \) - z dot.op p quad \( W eq.not 0 \) \, $ <eq:transport-angular-smoothing>]
  where $rho_eta$ vanishes for arguments at most $eta$ and is $1$ for arguments at least $2 eta$.
    Choose $eta$ small and then $A$ sufficiently large as in the lemma,
    with $A$ beyond the uniform critical-locus bound. Let $tau_A$ be the radial cutoff from that construction and set
  #[#set math.equation(numbering: n => "(58)")
   $ F_n = \( 1 - tau_A \) hat(F) + tau_A G_eta . $ <eq:transport-final-step-family>]
  The lemma shows that this function is smooth, equals $G_eta$ for $lr(bar.v.double W bar.v.double) gt.eq 2 A$,
    and has no new critical points. It leaves a neighborhood of the entire critical locus unchanged,
    so $F_n$ has the same regular critical locus and generated parametrization as $hat(F)$.
    It also supplies a straight homotopy from $G_0$ to $G_eta$ through regular $C^1$ homogeneous functions.
  The new homogeneous function $G_eta$ is smooth off zero, smoothly dependent on $X$ up to $overline(U)$,
    and has a uniform positive gradient margin on the unit sphere.
    Homogeneity and compactness there give the next constants of the form (41);
    the remaining uniform smooth bounds follow directly from the construction.
    The quadratic form $- z dot.op p$ is nondegenerate with signature $\( d \, d \)$:
    in fixed linear coordinates $z = a + b$, $p = a - b$ it equals $- lr(bar.v.double a bar.v.double)^2 +
    lr(bar.v.double b bar.v.double)^2$. The space of nondegenerate forms of signature $\( d \, d \)$ is connected.
    Choose a fixed path in this space from $- z dot.op p$ to the standard split form in the chosen added
    coordinates. Its direct sum with $g_o \( X \, w \)$ has nonzero total gradient off the origin,
    since both block gradients can vanish only there. This path is independent of $X$,
    so direct sum defines a homotopy over the whole base. Together with the straight homotopy to $G_eta$,
    it preserves the free stable tube class on every fixed compact parameter slice. This proves all the assertions. ◻
]

=== 6.4 The final critical point and the contradiction <the-final-critical-point-and-the-contradiction>

#proof[
  Take the class $a eq.not 0$ with $gamma_(*) a = 0$ supplied by Proposition 3,
    and the closed exact embedded Lagrangian $L subset T^(*) \( S^9 times S^(N - 1) \)$ supplied by
    Proposition 14. Suppose that a Hamiltonian isotopy as in the theorem sent the zero section to $L$.
    Lemma 15 supplies a compactly supported Euclidean Hamiltonian whose final cylinder is the zero graph over
    $U_c$. Start with (32) and apply Proposition 17 to each of its $s$ increments.
    Only finitely many steps are required. The subdivision is fixed by the mixed-coordinate and spatial-buffer
    conditions, which depend on the Hamiltonian and its support.
    At each step the new family constants change only the logarithmic cutoff,
    smoothing parameter and outer radius; they impose no further restriction on the step length.
    Thus the estimates and cutoff radii may be chosen anew at each step. We obtain a smooth family
  $ F^(\( s \)) : U times bb(R)^(2 p) arrow.r bb(R) \, wide p = m + d s \, $
  with exactly homogeneous smooth-off-zero data at infinity,
    whose regular critical locus maps diffeomorphically onto $tilde(phi)_1 \( cal(L)_0 \)$.
  Over $U_c$, the full critical-locus projection
  #[#set math.equation(numbering: n => "(59)")
   $ "Crit" \( F^(\( s \)) \) \|_(U_c) arrow.r U_c $ <eq:transport-final-projection>]
  is a diffeomorphism: it is the generating parametrization followed by projection of the zero graph.
    In particular there is precisely one critical point over every $X in U_c$,
    and these points form a smooth section. Their vertical Hessians are invertible.
    Indeed, if $v in bb(R)^(2 p)$ were in the kernel of such a Hessian, then
  $ D \( partial_W F^(\( s \)) \)_(\( X \, W \)) \( 0 \, v \) = partial_W^2 F^(\( s \)) \( X \, W \) v = 0 . $
  Since the full critical equation is regular, its zero set has this kernel as its tangent space.
    Thus $\( 0 \, v \)$ would be tangent to $"Crit" \( F^(\( s \)) \)$ and in the kernel of the differential of
    (59). That projection is a diffeomorphism, so $v = 0$; the square Hessian is nonsingular.
  Fix $v_0 in S^(N - 1)$ and restrict the base to
  $ b mapsto iota \( \( b \, v_0 \) \, 0 \) \, wide b in S^9 . $
  The resulting smooth family $f_b : bb(R)^(2 p) arrow.r bb(R)$ therefore has exactly one nondegenerate fiber
    critical point, varying smoothly with $b$. Its homogeneous data belong to $T_(p \, p)$,
    since each transport step added signature $\( d \, d \)$.
    On this fixed slice the initial homogeneous family was $g_b$,
    and every subsequent step preserved its class after split stabilization.
    Hence, writing $g_oo : S^9 arrow.r upright(bold(T))$ for the final stable tube family,
  $ \[ g_oo \]_(upright("free")) = \[ a \]_(upright("free")) eq.not \[ * \] \, wide gamma compose g_oo tilde.eq * . $
  This formulation does not require the smoothing homotopies to fix a chosen basepoint.
    Equivalently, the basepoint paths supplied by these homotopies identify the resulting based class with $a$.
    All hypotheses of Proposition 5 hold, including the uniform homogeneous behavior and the required large
    indices. That proposition makes the same tube family freely null in the stable tube space,
    contradicting the non-null class of Proposition 3. The assumed compactly supported Hamiltonian isotopy does
    not exist. This closed exact embedded $L$ is therefore the required counterexample. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
