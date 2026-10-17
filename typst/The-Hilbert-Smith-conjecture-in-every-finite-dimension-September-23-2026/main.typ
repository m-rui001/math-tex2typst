#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The Hilbert--Smith conjecture in every finite dimension]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Hilbert–Smith conjecture asks whether a locally compact group acting faithfully and continuously on a connected topological manifold must be a Lie group. An action is #emph[faithful] when its kernel is trivial: no nonidentity element fixes every point. Faithfulness does not require point stabilizers to be trivial. We prove the following statement.

#thm([Theorem 1.1.])[
  (The Hilbert–Smith conjecture).  #emph[Let $n gt.eq 1$. A locally compact second-countable Hausdorff group acting faithfully and jointly continuously on a connected Hausdorff second-countable topological $n$-manifold without boundary is a Lie group.]
] <cor:lie>

This gives a positive resolution in every positive finite dimension. The manifold may be noncompact, nonorientable, or nontriangulable; fixed points and arbitrary stabilizers are allowed. In dimension zero, a connected manifold is a point, so a faithful acting group is trivial and the conclusion holds as well.

The mechanism is the exclusion of faithful actions of the additive group of $p$-adic integers, for a prime $p$,

$ bb(Z)_p = "proj lim"_k bb(Z) \/ p^k bb(Z) \, $

with its profinite topology. The precise classical reduction from the full group theorem to this case is recalled at the end of the proof.

#thm([Theorem 1.2.])[
  ($p$-adic exclusion).  #emph[Let $n gt.eq 1$ be an integer and $p$ a prime. Every jointly continuous action of $bb(Z)_p$ on a connected Hausdorff second-countable topological $n$-manifold without boundary has nonzero kernel. Consequently the action factors through a finite quotient of $bb(Z)_p$.]
] <thm:main>

For a manifold $M$, equip $"Homeo" \( M \)$ with the compact-open topology. Jointly continuous actions are equivalently continuous homomorphisms $bb(Z)_p arrow.r "Homeo" \( M \)$. No dimension bound on the orbit space is assumed.

1 also gives the dynamical consequence recorded in #cite(label("Pardon2013")) Conjecture 1.4. For a manifold $M$ as in 1, a homeomorphism $f$ is #emph[almost periodic] if the cyclic subgroup ${ f^j : j in bb(Z) }$ has compact closure $K$ in $"Homeo" \( M \)$. Some positive iterate of $f$ is then the time-one map of a continuous real flow: there are an integer $m gt.eq 1$ and a continuous homomorphism $Phi : bb(R) arrow.r "Homeo" \( M \)$ with $Phi \( 1 \) = f^m$. Indeed, $K$ is a compact abelian group acting faithfully and jointly continuously on $M$. Evaluation on a countable dense subset of $M$ embeds $K$ into a countable product of copies of $M$, so $K$ is second countable. By 1, it is a compact abelian Lie group. Its identity component $K^0$ is a torus of finite index, so $f^m in K^0$ for some $m gt.eq 1$. The surjective exponential map of this torus places $f^m$ on a one-parameter subgroup, giving $Phi$.

=== 1.1 The problem and its predecessors <the-problem-and-its-predecessors>

Hilbert’s fifth problem asked how far differentiability assumptions could be removed from the theory of continuous transformation groups #cite(label("Hilbert1902")) Problem 5. One central formulation concerns a group that is itself locally Euclidean. Gleason and Montgomery–Zippin resolved that formulation in 1952 #cite(label("Gleason1952")) #cite(label("MontgomeryZippin1952")), and Yamabe extended the structure theory to general locally compact groups #cite(label("Yamabe1953a")) #cite(label("Yamabe1953b")). Hilbert–Smith asks for the restrictions imposed by a faithful action on a connected manifold. The passage to additive $p$-adic groups combines this structure theory with rigidity of periodic transformations. Lee gives a treatment of the reduction #cite(label("Lee1997")); Pardon’s introduction states the action-specific form used here #cite(label("Pardon2013")) Introduction, p. 1. The structure theory is developed systematically in Montgomery–Zippin #cite(label("MontgomeryZippin1955")).

The low-dimensional cases illustrate how much geometry may be needed to control a merely continuous action. The cases of one- and two-manifolds were classical; Pardon gives a later account and proof of the two-dimensional case, crediting Montgomery–Zippin #cite(label("Pardon2019")). Pardon proved the three-dimensional conjecture #cite(label("Pardon2013")) Theorem 1.5. His local argument uses incompressible surfaces in a suitable invariant open set and the resulting action on a surface mapping class group. In particular, it accommodates arbitrary stabilizers without replacing the given action by a smooth action.

Another line of work controls the action by its regularity. Bochner–Montgomery established the differentiable precedent #cite(label("BochnerMontgomery1946")). Repovš–Ščepin proved the Lipschitz case on Riemannian manifolds #cite(label("RepovsScepin1997")) Theorem 1.1, and Maleshich obtained an obstruction for Hölder actions on closed manifolds when a common exponent exceeds $n \/ \( n + 2 \)$ #cite(label("Maleshich1997")) Theorem 3.1. Martin established the quasiconformal case on Riemannian manifolds #cite(label("Martin1999")) Theorems 1.2–1.3. These results impose regularity on the transformations, rather than only on the underlying manifold.

The metric arguments connect to the dimension-raising theory of Yang and Bredon–Raymond–Williams #cite(label("Yang1960")) #cite(label("BredonRaymondWilliams1961")). Their obstruction concerns integral cohomological dimension; Raymond’s subsequent analysis emphasizes the different behavior with field coefficients #cite(label("Raymond1961")). In the Lipschitz proof, an averaged invariant metric keeps Hausdorff dimension small enough to contradict the required dimension increase of the orbit space. Mj extended this approach to uniformly quasisymmetric actions on compact metric cohomology manifolds under Ahlfors regularity and Hausdorff-dimension hypotheses, with applications to boundaries of Poincaré duality hyperbolic groups #cite(label("Mj2012")) Theorem 2.24 and Corollary 2.25.

Shelukhin used Floer-theoretic methods to exclude nontrivial continuous $p$-adic actions by homeomorphisms in the $C^0$-closure of the Hamiltonian diffeomorphism group of a closed symplectic manifold on whose $pi_2$ both the symplectic class and the first Chern class vanish #cite(label("Shelukhin2024")) Theorem A.

Newman’s rigidity theorem for periodic transformations #cite(label("Newman1931")) supplies the local input used here: a finite-order homeomorphism of a connected manifold that fixes a nonempty open set pointwise is the identity. For a modern statement and proof, see #cite(label("Pardon2019")) author manuscript, pp. 2–3. Pardon’s local reduction #cite(label("Pardon2013")) §4.1 uses this rigidity to find a faithful action of an open subgroup on an invariant open subset of one coordinate chart. We use that reduction without imposing regularity on the transformations or on the boundary of the chart subset.

=== 1.2 Duality and signatures <duality-and-signatures>

The signature viewpoint has a separate line of antecedents. Verdier developed duality for sheaves on locally compact spaces #cite(label("Verdier1966")); we use its derived functor formulation in Kashiwara–Schapira and Schapira #cite(label("KashiwaraSchapira1990")) #cite(label("SchapiraNotes")). Balmer’s triangular Witt groups package symmetric forms and their neutral relations in categories with duality #cite(label("Balmer2000")). For localization we use Balmer–Walter’s published Theorem 2.1, which removes the weak-cancellation hypothesis of the earlier localization theorem #cite(label("BalmerWalter2002")). Woolf applied this formalism both to perfect complexes of sheaves and to constructible complexes. Using duality on perfect complexes, he proved a cylinder homotopy relation for that theory and obtained a generalized homology theory from constructible Witt groups on compact polyhedra #cite(label("Woolf2008")). Ranicki–Weiss construct rational Pontryagin classes using a local chain theory generated by continuous simplex maps, with cutoff by subdivision, excision, and control of passage to direct summands #cite(label("RanickiWeiss2010")) §4 and Theorems 8.2–8.3. Their chain-level $L$-theory differs from the sheaf Witt groups used here, but its generated-category strategy is a close antecedent.

Our categories are generated by proper images of finite polyhedra under arbitrary continuous maps. Such images need not be constructible. We verify that duality and the constructions in the cylinder relation restrict to these specified generated categories. The additional quotient comparison and uniform integral bound establish the fixed signature lattice. The comparison is integral before rationalization: a rational isomorphism alone would not bound the possible denominators.

=== 1.3 The obstruction: equal parts in a fixed lattice <the-obstruction-equal-parts-in-a-fixed-lattice>

The numerical contradiction is simple. Fix an odd integer $d gt.eq 3$; for an action on an $n$-manifold, we will take $d > n$. We construct an abelian group $E_d \( S^d \)$, an orientation class $u_d$, and a positive integer $L_d$. For an integral class $x$, write $overline(x) = x ⊗ 1$ for its rational image. Then

#[#set math.equation(numbering: n => "(1.1)")
 $ E_d \( S^d \) ⊗ bb(Q) = bb(Q) overline(u)_d \, #h(2em) "im" #scale(x: 120%, y: 120%)[\(] E_d \( S^d \) arrow.r E_d \( S^d \) ⊗ bb(Q) #scale(x: 120%, y: 120%)[\)] subset.eq L_d^(- 1) bb(Z) overline(u)_d . $ <intro:lattice>]

A faithful $bb(Z)_p$-action will produce, for every $k gt.eq 1$, $p^k$ integral classes in this group. Their rational images are equal and sum to $4 overline(u)_d$. Each image is therefore $\( 4 \/ p^k \) overline(u)_d$, which contradicts (1.1) as soon as $p^k > 4 L_d$. The order of these choices matters: $L_d$ is fixed before $k$.

Here “integral” refers to an element of the abelian Witt group before it is tensored with $bb(Q)$; the sheaf coefficients are real throughout. For a map from a compact polyhedron, its direct-image sheaf complex records the cohomology of the fibers. A symmetric self-duality on that complex supplies signature data, and the Witt group sets forms with a lagrangian equal to zero. This makes the invariant additive while retaining the integrality of ordinary signature.

Here is the group underlying this argument. For a finite polyhedron $X$, let $cal(T) \( X \)$ be the full thick subcategory of the bounded derived category of real sheaves generated by

$ R f_(*) underline(bb(R))_B \, #h(2em) f : B arrow.r X \, #h(2em) B upright(" a compact finite polyhedron") \, $

where $f$ is continuous. Thus an object is obtained by finite sums, shifts, cones, and direct summands from these proper direct images. Their stalks need not be finite dimensional. Verdier duality nevertheless restricts to this category, as we prove from simplex generators. We put $E_r \( X \) = W_r \( cal(T) \( X \) \)$, the Witt group of nonsingular symmetric forms for the shifted duality $cal(D)_(X \, r) = \[ - r \] cal(D)_X$, with neutral forms set equal to zero. 2 gives the precise definitions, the signs, and homotopy invariance.

To establish (1.1), we compare with the subcategory generated by semialgebraic maps. On a suitably chosen oriented ball, finite Witt relations can be evaluated by ordinary integral signature. Two arguments transfer that integrality to the continuous category. First, cutting off the finite polyhedral sources identifies quotient morphisms with germs near a closed set. Second, a full dense triangulated inclusion with duality, in which every object of the larger category is a summand of one from the smaller category, admits a map on Witt groups in the reverse direction whose two composites are multiplication by $2$. The resulting exponent-two kernel and cokernel bound is a consequence of Hornbostel–Schlichting’s cofinality theorem #cite(label("HornbostelSchlichting2004")) author preprint, Appendix A, Theorem A.2. We give the cutoff and explicit doubling constructions in 3; neither requires the images of arbitrary continuous maps to be constructible.

Localization on a finite cover of the sphere then bounds both the kernel and the cokernel of comparison by a fixed power of $2$, in every degree. This proves the lattice statement in 25. Rational equivalence alone would lose the denominator bound. The cutoff description and the integral bound for dense inclusions are also useful independently of the group action; they supply the additional comparison needed beyond the constructible homology theory of #cite(label("Woolf2008")).

=== 1.4 How the action supplies the equal parts <how-the-action-supplies-the-equal-parts>

Suppose that a faithful action exists on an $n$-manifold. By Newman’s theorem, a small open subgroup $G tilde.equiv bb(Z)_p$ acts faithfully and preserves orientation on a connected invariant open subset $O subset bb(R)^n$ of one coordinate chart. Choose an odd integer $d > n$, with $d gt.eq 3$, and give

$ W = O times bb(R)^(d - n) subset bb(R)^d $

the product action, trivial in the added coordinates. We use the one-point compactification $W^(+)$, its orbit space $Y = W^(+) \/ G$, and the maps

$ S^d arrow.r^c W^(+) arrow.r^q Y arrow.r^t X . $

Here $c$ collapses $S^d \\ W$ to $oo$, and $t$ is a continuous map into a compact space $X$ homeomorphic to a finite polyhedron. We require the value $b = t q \( oo \)$ to have a basis of contractible open neighborhoods in $X$. The composite $t q c$ always has the same finite-polyhedron source $S^d$, as shown in 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S^d$]]])])
  content((3.6, 0), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W^+$]]])])
  content((6.7, 0), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y=W^+"/"G$]]])])
  content((10, 0), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$X$]]])])
  line((0.3942, 0), (3.206, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.8, 0), [#text(size: 9pt)[$c$]], anchor: "south", padding: 0.1176cm)
  line((3.994, 0), (5.893, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.15, 0), [#text(size: 9pt)[$q$]], anchor: "south", padding: 0.1176cm)
  line((7.507, 0), (9.661, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((8.35, 0), [#text(size: 9pt)[$t$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.6), (0, -1.65), (10, -1.65), (10, -0.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.5, -1.388), [#text(size: 9pt)[$f="tqc"$]], anchor: "north", padding: 0.1176cm)
  content((0, 1.829), [#text(fill: rgb("#404040"))[#text(size: 9pt)[compact polyhedral#linebreak()source]]])
  content((3.6, 1.88), [#text(fill: rgb("#404040"))[#text(size: 9pt)[$G$ acts on $W^+$#linebreak()and fixes $infinity$]]])
  content((6.7, 1.86), [#text(fill: rgb("#404040"))[#text(size: 9pt)[compact orbit#linebreak()space]]])
  content((10, 1.653), [#text(fill: rgb("#404040"))[#text(size: 9pt)[test space]]])
  content((3.6, -2.599), [#text(fill: rgb("#404040"))[#text(size: 9pt)[$c$ is the identity on $W$ and collapses $S^d without W$ to $infinity$.]]])
})],
  caption: [Figure 1: A local action produces compact-source tests. Away from $b = t q \( oo \)$, the source of $f$ lies in the oriented manifold $W = O times bb(R)^(d - n)$. The restricted map $f^(- 1) \( X \\ { b } \) arrow.r X \\ { b }$ is proper, with oriented manifold source. ],
) <fig:local-test>

Put $f_t = t q c$ and $A_t = R f_(t *) underline(bb(C))_(S^d)$. Here $bb(C)$ is the positive real plane with pairing $B \( z \, w \) = "Re" \( z overline(w) \)$. Pushing this coefficient pairing together with the orientation of $S^d$ gives the degree-$d$ form $alpha_t$ on $A_t$. Away from $b$, the map $f_t$ is proper from an oriented open subset of $W$. Identify the characters of $G$ with the group $Lambda = union.big_(j gt.eq 0) mu_(p^j)$ of roots of unity of $p$-power order. A finite partition $Lambda = D_0 union.sq dots.h.c union.sq D_(m - 1)$ gives orthogonal projectors $e_i$ on $A_t \|_(X \\ { b })$ onto the corresponding character parts. A projector need not extend to a summand over $b$. Choose a contractible open neighborhood $U$ of $b$. The projector’s germ near $X \\ U$ defines an endomorphism of $A_t$ in the quotient by objects compactly supported in $U$.

For a self-adjoint projector $e_i$, the operator $2 e_i - 1$ is a self-adjoint involution. We therefore have the following sum of forms on the existing object:

$ \[ A_t \, alpha_t \] + \[ A_t \, alpha_t \( 2 e_i - 1 \) \] . $

An integral localization isomorphism lifts it to a class $z_i \( t \) in E_d \( X \)$. An explicit matrix isometry gives $sum_i z_i \( t \) = 2 \[ A_t \, alpha_t \]$, without taking the images of quotient idempotents.

Averaging a map supported in a ball gives a test $a : Y arrow.r S^d$ with $deg \( a q c \) = 1$. For each $k$, faithfulness gives a nonempty open region $V subset W \/ G$ over which $W \/ \( p^k G \) arrow.r W \/ G$ consists of $p^k$ labeled sheets. Serre’s results on odd spheres provide a map $D_s : S^d arrow.r S^d$ of degree $s > 0$ such that $D_s a$ is homotopic to a map constant outside $V$ #cite(label("Serre1951")) #cite(label("Serre1953")). There a locally constant coefficient isometry permutes $p^k$ chosen character parts cyclically. Covariance and homotopy invariance equate the rational images $s overline(z)_i \( a \)$. Cancelling the nonzero rational scalar $s$ equates the $overline(z)_i \( a \)$, while the original integral classes stay in the same fixed lattice. Their rational images sum to $4 overline(u)_d$: one factor of $2$ comes from the real coefficient plane and the other from the involution construction. The fixed lattice gives the contradiction.

Only the actual manifold sources and the test spaces carry Verdier duality in this argument. The compact orbit spaces enter through ordinary sheaf direct images, averaging, and Čech cohomology. No dimension bound on the orbit spaces or regularity assumption on the boundary of $O$ is used. The odd stabilization is the only dimensional choice. In particular, the proof treats both odd congruence classes of $d$ modulo $4$.

Section 2, Section 3, Section 4 construct and bound the signature invariant. 5 prepares the local tests, including the odd-sphere argument. 6 constructs the integral character classes and proves Theorem 1.2, Theorem 1.1.

== 2 Compact-source sheaf categories and homotopy invariance <sec:categories>

The sheaves used below can have very complicated stalks. Their finiteness comes from their sources: they are built, by finitely many operations, from proper images of constant sheaves on finite polyhedra. We first establish duality on exactly these categories, and then prove the cylinder relation that will make their Witt groups homotopy invariant.

=== 2.1 Spaces, coefficients, and generators <spaces-coefficients-and-generators>

All sheaves in this section have coefficients in the field $bb(R)$, regarded algebraically. A #emph[test space] is a locally compact, finite-dimensional, separable metrizable space of the following kinds: a finite polyhedron, a space homeomorphic to one, an open subset of such a space, or a finite product of these spaces. Points and the empty space are included. The spaces to which Verdier duality is applied will always be test spaces.

Write

$ sans(D) \( X \) = D^b \( "Sh"_(bb(R)) \( X \) \) . $

For a complex $A$, the assertion that its support is contained in a compact set $K subset X$ means that all its cohomology sheaves vanish on $X \\ K$. We use this formulation even when the set of points with a nonzero cohomology stalk is not closed. All tensor products are derived tensor products over $bb(R)$; tensoring sheaves is exact over this field.

#prodef([Definition 2.1.])[
  (The test categories).  Let $cal(T)^0 \( X \)$ be the smallest full replete triangulated subcategory of $sans(D) \( X \)$ containing
  #[#set math.equation(numbering: n => "(2.1)")
   $ R f_(*) underline(bb(R))_B \, #h(2em) f : B arrow.r X \, #h(2em) B upright(" a compact finite polyhedron") \, $ <cat:generators>]
  where $f$ is any continuous map. Let $cal(T) \( X \)$ be its closure under direct summands in $sans(D) \( X \)$.
  When $X$ has a specified semialgebraic model, define $cal(P)^0 \( X \)$ and $cal(P) \( X \)$ in the same manner, requiring $B$ to be a compact polyhedron in a Euclidean space and $f$ to be continuous semialgebraic in the specified models. For an arbitrary open subset $U$ of a semialgebraic model, the condition on $f : B arrow.r U$ is that its composite into that model be semialgebraic. The open subset itself need not be semialgebraic.
  An allowed map for $cal(T)$ is a continuous map of test spaces. For $cal(P)$ we use continuous semialgebraic maps in the models, their restrictions to the open subsets under consideration, and inclusions of such open subsets. The condition on a map used in the arguments below is that composition carry every allowed compact-source generator to an allowed compact-source generator. Homotopies for $cal(P)$ satisfy this condition in their two variables; the continuous semialgebraic homotopies used below do so.
] <def:test-categories>

The sheaf operations used below satisfy their finite-dimensionality hypotheses for every allowed map, including a nonproper map. To see this explicitly, every test space is homeomorphic to a locally closed subset of some $bb(R)^N$: realize its finite polyhedral factors as closed Euclidean subsets, take the prescribed relative open subsets, and then their finite product. Fix such an embedding of the source $X$ of a continuous map $g : X arrow.r Y$. Since $Y$ is Hausdorff, each fiber $Z = g^(- 1) \( y \)$ is closed in $X$, hence locally closed in the same $bb(R)^N$. For its embedding $i : Z arrow.r.hook bb(R)^N$, extension $i_(!)$ is exact: factor $i$ as a closed inclusion followed by an open inclusion. For every sheaf $F$ on $Z$, composition of derived proper images gives

$ R Gamma_c \( Z \; F \) tilde.eq R Gamma_c \( bb(R)^N \; i_(!) F \) . $

The right side has no cohomology above $N$, by #cite(label("SchapiraNotes")) Lemma 11.7.1. This bound is independent of $y$. Thus every such $g$ has finite $c$-soft dimension, by #cite(label("SchapiraNotes")) Definition 11.3.1 and Remark 11.3.3. The composition formula used here is established before that finite-dimension hypothesis is imposed #cite(label("SchapiraNotes")) Equation (11.3.1), so this verification does not assume the duality formalism it is used to justify.

In particular the maps in (2.1) are proper, because their sources are compact and their targets are Hausdorff, and their derived images are bounded. Proper base change identifies their stalk cohomology with the cohomology of compact fibers. Boundedness does not imply that these stalks are finite dimensional. For the general locally compact sheaf formalism see #cite(label("KashiwaraSchapira1990")) Chapter III and #cite(label("SchapiraNotes")) §§11.3–11.4.

We work with essentially small categories. This causes no size issue: there is a set of finite polyhedra up to isomorphism and of continuous maps from each into a fixed $X$; the derived category is locally small. Finite constructions using their morphisms, followed by the choice of summands, still have a set of isomorphism classes. Choose representatives and then take replete subcategories when convenient.

#thm([Lemma 2.2.])[
  (Simplex generators and summands).  #emph[In either definition, closed simplices suffice in place of all compact finite polyhedra. Every object of $cal(T) \( X \)$, respectively $cal(P) \( X \)$, is a direct summand of an object of $cal(T)^0 \( X \)$, respectively $cal(P)^0 \( X \)$. In particular these summand closures are triangulated and thick.]
] <cat:simplex-generators>

#proof[
  Fix a finite triangulation of $B$. For a closed simplex $sigma$, let $j_sigma : sigma^compose arrow.r.hook sigma$ and $i_sigma : partial sigma arrow.r.hook sigma$ be the inclusions. The open-complement triangle is
  #[#set math.equation(numbering: n => "(2.2)")
   $ \( j_sigma \)_(!) underline(bb(R))_(sigma^compose) arrow.r underline(bb(R))_sigma arrow.r \( i_sigma \)_(*) underline(bb(R))_(partial sigma) arrow.r \( j_sigma \)_(!) underline(bb(R))_(sigma^compose) \[ 1 \] . $ <cat:simplex-boundary-triangle>]
  Induction on dimension expresses the first term using constants on closed simplices: apply the same argument to the finite triangulation of the boundary, starting with points. Filter $B$ by its skeleta. On each skeleton the complement of the previous skeleton is a finite disjoint union of open simplices. Its constant sheaf extended by zero is the finite sum of the first terms of (2.2), extended into that skeleton. The open-complement triangles for this filtration therefore build $underline(bb(R))_B$ from constants on the closed simplices of $B$. Pushing these finite triangles along $f$ proves the assertion. For the semialgebraic categories all restrictions and simplex inclusions just used are semialgebraic.
  For the second assertion, the class of summands of objects in a full triangulated subcategory is itself triangulated. Indeed, suppose $A xor A' = C$ and $B xor B' = D$ belong to that subcategory, and let $u : A arrow.r B$. Fullness places the block map $u xor 0 : C arrow.r D$ in the subcategory. A cone on this map is
  $ "Cone" \( u \) xor B' xor A' \[ 1 \] . $
  Hence $"Cone" \( u \)$ is a summand of an object of the subcategory. Shifts and finite sums have the same property, and an iterated summand is a summand. This proves the claim and also proves thickness. ◻
]

=== 2.2 Duality on the generated categories <duality-on-the-generated-categories>

Let $a_X : X arrow.r upright("pt")$. We use the dualizing complex and Verdier operation

$ omega_X = a_X^(!) bb(R) \, #h(2em) cal(D)_X A = R cal(H) o m \( A \, omega_X \) . $

The operation is initially understood in the ambient derived category. Its boundedness and the invertibility of its biduality map on our categories will be proved, not assumed.

We recall precisely the pieces of the sheaf formalism used here. For locally compact spaces and maps of finite $c$-soft dimension, $R f_(!)$ has right adjoint $f^(!)$, composition identifies $f^(!) omega_Y$ with $omega_X$, and the counit gives the trace

#[#set math.equation(numbering: n => "(2.3)")
 $ "Tr"_f : R f_(!) omega_X arrow.r omega_Y . $ <cat:trace>]

The internal duality isomorphism is

#[#set math.equation(numbering: n => "(2.4)")
 $ R f_(*) cal(D)_X A arrow.r^tilde.op cal(D)_Y R f_(!) A #h(2em) \( A in sans(D) \( X \) \) . $ <cat:verdier-formula>]

It is adjoint to evaluation followed by the trace, and is compatible with the evaluation map $eta_A : A arrow.r cal(D)_X^2 A$ whenever the expressions are bounded. For an open inclusion $j$, $j^(!) = j^(- 1)$, so duality commutes with open restriction. These are the adjunction and internal duality statements in #cite(label("SchapiraNotes")) Theorem 11.4.2, Propositions 11.4.3–11.4.4 and 11.4.6(b). Proper base change, the projection formula, and compact-support Künneth will also be used in their natural forms #cite(label("SchapiraNotes")) Theorems 11.3.5–11.3.6 and Corollary 11.3.11. None of these statements asserts reflexivity of every bounded sheaf complex.

#thm([Proposition 2.3.])[
  (Duality and compact support).  #emph[The Verdier operation restricts to a triangulated duality on each of $cal(T)^0 \( X \)$, $cal(T) \( X \)$, $cal(P)^0 \( X \)$, and $cal(P) \( X \)$. In particular, for every object $A$ in one of these categories, $cal(D)_X A$ belongs to the same category and the canonical map 
$ eta_A : A arrow.r^tilde.op cal(D)_X^2 A $

 is an isomorphism. There is a compact $K subset X$ outside which both $A$ and $cal(D)_X A$ vanish.]
] <prop:test-duality>

#proof[
  We first calculate on a closed $n$-simplex $Delta$, choosing an orientation of its interior. With $j : Delta^compose arrow.r.hook Delta$,
  #[#set math.equation(numbering: n => "(2.5)")
   $ cal(D)_Delta underline(bb(R))_Delta = omega_Delta tilde.eq j_(!) underline(bb(R))_(Delta^compose) \[ n \] \, #h(2em) cal(D)_Delta #scale(x: 120%, y: 120%)[\(] j_(!) underline(bb(R))_(Delta^compose) \[ n \] #scale(x: 120%, y: 120%)[\)] tilde.eq underline(bb(R))_Delta . $ <cat:simplex-duality>]
  Here is the local calculation, including the boundary. At an interior point the compactly supported cohomology of a sufficiently small open ball is $bb(R)$ in degree $n$ and zero otherwise. At a boundary point a cofinal system of relative neighborhoods is homeomorphic to a half-ball with its flat face retained. All its compactly supported cohomology vanishes. For example, its one-point compactification is a closed ball and has zero reduced cohomology; this also applies at corners after a local homeomorphism. The local description of the dualizing complex therefore gives the first isomorphism in (2.5). The orientation identifies its interior local system with the constant sheaf. For the dualizing-complex formulation of orientation on a manifold without boundary, see #cite(label("SchapiraNotes")) §11.7; the relative half-ball calculation above establishes the boundary case needed here.
  For the second isomorphism, open-image duality gives
  $ cal(D)_Delta j_(!) underline(bb(R))_(Delta^compose) tilde.eq R j_(*) underline(bb(R))_(Delta^compose) \[ n \] . $
  The unit $underline(bb(R))_Delta arrow.r R j_(*) underline(bb(R))_(Delta^compose)$ is an isomorphism: the intersection of each sufficiently small relative neighborhood with $Delta^compose$ is nonempty and contractible, with no higher constant-sheaf cohomology. Under these identifications the biduality map of $underline(bb(R))_Delta$ is this unit. Thus it is the canonical biduality map, and is invertible, including at the boundary. The case $n = 0$ is ordinary duality of the one-dimensional vector space.
  Now take a simplex generator $A = R f_(*) underline(bb(R))_Delta$. Since $f$ is proper, (2.4) and (2.5) give
  $ cal(D)_X A tilde.eq R f_(*) omega_Delta . $
  The boundary triangle (2.2) expresses $omega_Delta$ using constants on compact subpolyhedra of $Delta$. Consequently $cal(D)_X A$ lies in the same generated category.
  We check explicitly that proper duality transports the canonical biduality map. Put $F = R f_(*)$ and $B = underline(bb(R))_Delta$, and write
  $ zeta_C : F cal(D)_Delta C arrow.r^tilde.op cal(D)_X F C #h(2em) \( C = B \, cal(D)_Delta B \) $
  for (2.4). The source calculation makes $B \, cal(D)_Delta B \, cal(D)_Delta^2 B$ bounded, as are their proper images. The two comparisons $zeta_B \, zeta_(cal(D)_Delta B)$ and the dual of $zeta_B$ therefore show that all terms in the following diagram are bounded:
  (2.6)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$F B$])
  content((3.311, 0), [$cal(D)_X^2 F B$])
  content((0, -1.239), [$F cal(D)_Delta^2 B$])
  content((3.311, -1.239), [$cal(D)_X F cal(D)_Delta B .$])
  line((0.402, 0), (2.579, 0), mark: (end: ">"))
  content((1.491, 0.2266), [#text(size: 0.73em)[$eta_(F B)$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.4668, -0.6193), [#text(size: 0.73em)[$F eta_B$]])
  line((3.311, -0.2725), (3.311, -0.9661), mark: (end: ">"))
  content((3.971, -0.6193), [#text(size: 0.73em)[$cal(D)_X \( zeta_B \)$]])
  line((0.864, -1.239), (2.249, -1.239), mark: (end: ">"))
  content((1.557, -1.465), [#text(size: 0.73em)[$zeta_(cal(D)_Delta B)$]])
})
  Under tensor–Hom adjunction, both composites correspond to the pushed evaluation pairing with its two arguments interchanged. The cup map respects tensor symmetry, and both composites use the same trace, so the diagram commutes. Its left, bottom, and right arrows are isomorphisms. Hence $eta_A = eta_(F B)$ is an isomorphism.
  The class of objects whose dual is bounded and belongs to the generated category is closed under shifts and triangles. On this class, the objects for which $eta$ is invertible are closed under these operations as well: naturality gives a morphism of triangles, and an isomorphism on two terms gives an isomorphism on the third. The same assertions pass to direct summands, by applying the dual functor to the splitting maps. 4 now proves the duality assertions for all four categories.
  Each generator vanishes outside $f \( Delta \)$. Finite sums, triangles, shifts, and summands preserve vanishing outside a finite union of such compact sets. Choose one such compact $K$ for $A$. Open restriction of duality shows that $cal(D)_X A$ also vanishes on $X \\ K$. ◻
]

#prodef([Remark 2.4.])[
  There is no assertion that restriction preserves the test categories. For example, $underline(bb(R))_(\[ 0 \, 1 \])$ belongs to $cal(T) \( \[ 0 \, 1 \] \)$, whereas its restriction to $\( 0 \, 1 \)$ has no compact support there and hence does not belong to $cal(T) \( \( 0 \, 1 \) \)$. Restrictions in later germ arguments are taken in the ambient derived categories. Likewise, Verdier reflexivity in 5 is not algebraic reflexivity of each stalk: Verdier duality uses local compact-support information. This distinction allows proper continuous images with infinite-dimensional stalks.
] <cat:restriction-caution>

#thm([Proposition 2.5.])[
  (Direct images and open extension).  #emph[For an allowed map $g : X arrow.r Y$, direct image induces exact functors 
$ g_(*) : cal(T)^0 \( X \) arrow.r cal(T)^0 \( Y \) \, #h(2em) g_(*) : cal(T) \( X \) arrow.r cal(T) \( Y \) \, $

 and the analogous functors for $cal(P)^0 \, cal(P)$. They are given by $R g_(!) tilde.eq R g_(*)$ on these categories, commute coherently with Verdier duality and its shifts, and are compatible with composition. For an open inclusion $j : U arrow.r.hook X$, this functor is $j_(!)$ and is fully faithful.]
] <prop:test-pushforward>

#proof[
  If $A$ vanishes outside a compact $K subset X$, let $i : K arrow.r.hook X$. The canonical map $A arrow.r i_(*) i^(- 1) A$ is an isomorphism, as is checked on cohomology stalks. The map $g i : K arrow.r Y$ is proper. Composition of direct images therefore identifies the natural comparison
  $ R g_(!) A arrow.r R g_(*) A $
  with the corresponding, invertible comparison for $g i$. This argument requires only compactness of $K$, not a polyhedral structure on $K$. On a generator the image is
  $ R g_(*) R f_(*) underline(bb(R))_B tilde.eq R \( g f \)_(*) underline(bb(R))_B \, $
  which is again an allowed generator. Exactness and preservation of splittings prove category membership and boundedness for every object. The semialgebraic case follows from the same composition check.
  Both $A$ and $cal(D)_X A$ have compact support by 5. Hence (2.4) gives the natural isomorphism
  #[#set math.equation(numbering: n => "(2.7)")
   $ R g_(!) cal(D)_X A arrow.r^tilde.op cal(D)_Y R g_(!) A . $ <cat:push-duality>]
  It preserves biduality because it is defined by evaluation and trace. More explicitly, a pairing $beta : A ⊗ A arrow.r omega_X \[ - r \]$ is sent to the pairing
  #[#set math.equation(numbering: n => "(2.8)")
   $ R g_(!) A ⊗ R g_(!) A & arrow.r R g_(!) \( A ⊗ A \) arrow.r^(R g_(!) beta) R g_(!) omega_X \[ - r \] arrow.r^("Tr"_g \[ - r \]) omega_Y \[ - r \] . $ <cat:push-pairing>]
  The first arrow is the cup map obtained from the projection formula and the adjunction map $g^(- 1) R g_(!) A arrow.r A$ (using $R g_(!) A arrow.r R g_(*) A$). Under tensor–Hom adjunction, (2.8) is exactly (2.7) composed with the image of the adjoint of $beta$. The symmetry of tensor products and the adjunction identities imply compatibility with biduality. For composable maps, the cup maps compose and
  $ "Tr"_(h g) = "Tr"_h compose R h_(!) \( "Tr"_g \) $
  under the composition identifications. Thus the duality functors and their pairings compose coherently. Notice that the last two arrows of (2.8) use $R g_(!)$ on $omega_X$; compact support of $omega_X$ is not required.
  For an open inclusion, $R j_(!) = j_(!)$ and $j^(- 1) j_(!)$ is the identity. The adjunction $\( j_(!) \, j^(- 1) \)$ gives
  $ "Hom"_(sans(D) \( X \)) \( j_(!) A \, j_(!) B \) tilde.eq "Hom"_(sans(D) \( U \)) \( A \, B \) . $
  Thus extension is fully faithful. The already proved comparison with $R j_(*)$ applies because objects from the test category on $U$ have compact support in $U$. ◻
]

=== 2.3 Shifted forms and the cone relation <shifted-forms-and-the-cone-relation>

We use cochain shifts and homological Witt indexing:

#[#set math.equation(numbering: n => "(2.9)")
 $ cal(D)_(X \, r) = \[ - r \] cal(D)_X \, #h(2em) W_r \( cal(B) \) = W^(- r) \( cal(B) \) \, #h(2em) E_r \( X \) = W_r \( cal(T) \( X \) \) . $ <cat:witt-indexing>]

The biduality and exactness signs are the translated-duality signs of triangular Witt theory; the exactness sign of $cal(D)_(X \, r)$ is $delta_r = \( - 1 \)^r$. With these signs, a symmetric form of degree $r$ is equivalently a pairing

#[#set math.equation(numbering: n => "(2.10)")
 $ beta : A ⊗ A arrow.r omega_X \[ - r \] \, #h(2em) beta compose tau_(A \, A) = beta \, $ <cat:pairing-form>]

whose adjoint $alpha : A arrow.r^tilde.op cal(D)_(X \, r) A$ is invertible. Here $tau$ is tensor symmetry with the Koszul sign. We give the chain-level verification of these conventions in 7. In particular, on an oriented $d$-manifold the orientation identification $omega_X \[ - d \] tilde.eq underline(bb(R))_X$ makes the multiplication pairing of the constant sheaf a symmetric degree-$d$ form. When its underlying object belongs to a test category, it defines a class there.

We recall the one algebraic cone fact needed for homotopy invariance. Write $\#$ for the chosen shifted duality. Witt groups are generated under orthogonal sum by nonsingular symmetric forms, with neutral forms set equal to zero; the negative of a pairing is its additive inverse. A triangular lagrangian for $\( A \, alpha \)$ is an arrow $i : L arrow.r A$ completed to a triangle $L arrow.r A arrow.r \# L arrow.r L \[ 1 \]$ in which the second map is the composite $A arrow.r^alpha \# A arrow.r^(\# i) \# L$, with the translated-duality signs, and the triangle is compatible with its dual under the form and biduality, including the connecting morphism. A form with such a lagrangian is neutral. The hyperbolic form $H \( L \)$, on $L xor \# L$, is an example. These definitions and their equivalence with the symmetric-cone description below are the triangular Witt formalism of #cite(label("Balmer2000")); a convenient precise reference for the cone statement is #cite(label("Woolf2008")) §2.1, Lemma 2.1.

Set $I = \[ 0 \, 1 \]$ and let $i_t : X arrow.r I times X$ be $x mapsto \( t \, x \)$, for $t = 0 \, 1$. For a degree-$r$ form $\( A \, alpha \)$ in $cal(T) \( X \)$ or $cal(P) \( X \)$, our goal is to prove

$ \( i_0 \)_(*) \[ A \, alpha \] = \( i_1 \)_(*) \[ A \, alpha \] $

in the corresponding Witt group of $I times X$. We will construct a neutral form on the sum of the two endpoint objects whose diagonal pairings are a common nonzero real multiple of $\( i_0 \)_(*) alpha$ and $- \( i_1 \)_(*) alpha$. The symmetric-cone construction below produces this form; pushing the resulting equality along a homotopy will then identify the homomorphisms induced by its endpoints.

#thm([Lemma 2.6.])[
  (Symmetric cone).  #emph[Let $\( \# \, eta \)$ be a triangulated duality with exactness sign $delta in { 1 \, - 1 }$ on a category in which multiplication by $2$ is invertible on every morphism group. Let $u : L arrow.r \# L$ be symmetric, without an invertibility assumption. In a triangle 
$ L arrow.r^u \# L arrow.r^v C arrow.r^w L \[ 1 \] \, $

 the cone has a nonsingular symmetric form $psi : C arrow.r^tilde.op \[ 1 \] \# C$ for the translated duality. It is neutral and can be chosen to satisfy 
#[#set math.equation(numbering: n => "(2.11)")
 $ psi v = - \[ 1 \] \( \# w \) \, #h(2em) \[ 1 \] \( \# v \) psi = delta \[ 1 \] \( eta_L \) w \, $ <cat:cone-compatibility>]

 with the dual shift comparisons understood. For $\# = cal(D)_(X \, r + 1)$ this is a neutral form of degree $r$.]
] <cat:symmetric-cone>

#proof[
  Dualize and rotate the triangle. Its first arrow is $delta \# u$. Symmetry of $u$ makes its first two terms compatible with $delta eta_L$ and the identity of $\# L$, with fourth vertical map $delta \[ 1 \] \( eta_L \)$. Complete these maps to a morphism of triangles with third map $psi_0$. The signed transpose of $psi_0$ is another such completion. Replacing $psi_0$ by
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] psi_0 - delta \[ 1 \] \( \# psi_0 \) eta_C #scale(x: 120%, y: 120%)[\)] $
  preserves the first two squares and imposes symmetry for the translated biduality $- delta eta$. The resulting map $psi$ satisfies (2.11). It is an isomorphism by the two-out-of-three property for the morphism of triangles. By definition it is the symmetric boundary of $u$, hence neutral. Equivalently, rotate the displayed triangle to start with $\# L arrow.r C$; its third object is $L \[ 1 \] tilde.eq \[ 1 \] \# \( \# L \)$, and (2.11) gives the triangular lagrangian. All these operations take place in the given full triangulated category; averaging uses that $2$ is invertible. Finally $\[ 1 \] cal(D)_(X \, r + 1) = cal(D)_(X \, r)$ with exactly the translated signs, proving the degree assertion. ◻
]

=== 2.4 Natural external products <natural-external-products>

To compare the two endpoint copies of a form on $X$, we will combine it with the interval boundary triangle. The next lemma verifies that these products remain in the test category and carry the required pairings.

Let $e_t : { t } arrow.r.hook I$ for $t = 0 \, 1$. Write

#[#set math.equation(numbering: n => "(2.12)")
 $ H = underline(bb(R))_I \, #h(2em) J = j_(!) underline(bb(R))_(\( 0 \, 1 \)) \, #h(2em) E_t = \( e_t \)_(*) bb(R) \, #h(2em) E = E_0 xor E_1 \, $ <cat:interval-objects>]

where $j : \( 0 \, 1 \) arrow.r.hook I$. Let $cal(C)_I$ be the full thick subcategory generated by $H \, E_0 \, E_1$. It is contained in $cal(P) \( I \)$ and $cal(T) \( I \)$, and contains $J$ by the triangle

#[#set math.equation(numbering: n => "(2.13)")
 $ J arrow.r^u H arrow.r^v E arrow.r^partial J \[ 1 \] . $ <cat:interval-triangle>]

#thm([Lemma 2.7.])[
  (Products with the interval).  #emph[For $A in cal(T) \( X \)$ and $B in cal(C)_I$, the external product $B times.square A$ belongs to $cal(T) \( I times X \)$; the same assertion holds for $cal(P)$. For all integers $s \, r$, the natural map 
#[#set math.equation(numbering: n => "(2.14)")
 $ mu_(s \, r) : cal(D)_(I \, s) B times.square cal(D)_(X \, r) A arrow.r^tilde.op cal(D)_(I times X \, s + r) \( B times.square A \) $ <cat:external-duality>]

 is an isomorphism. The map is adjoint to the product of evaluations, with the tensor shift signs; it commutes with proper direct image, duality, and the trace maps. In particular the product of symmetric pairings is symmetric for the sum of their degrees.]
] <cat:interval-products>

#proof[
  First suppose $A = R f_(*) underline(bb(R))_Delta$. For $B = H$ the proper external-image formula gives
  $ H times.square A tilde.eq R \( 1 times f \)_(*) underline(bb(R))_(I times Delta) . $
  The source is a compact finite polyhedron. For $B = E_t$ the product is the generator on the endpoint copy of $Delta$. The triangle (2.13) proves membership for $B = J$ as well. Exactness and preservation of summands in each variable prove the membership statement for all $B \, A$. All source maps in this argument are semialgebraic when $f$ is.
  We describe the natural map in (2.14) before proving that it is invertible. For locally compact spaces $Z \, X$ there is a product trace map
  #[#set math.equation(numbering: n => "(2.15)")
   $ t_(Z \, X) : omega_Z times.square omega_X arrow.r omega_(Z times X) . $ <cat:product-trace>]
  By the adjunction for $a_(Z times X)$, this is the map corresponding, under compact-support Künneth, to the tensor of the two traces to $bb(R)$. To define $mu_(s \, r)$, pair
  $ \( cal(D)_(Z \, s) B times.square cal(D)_(X \, r) A \) ⊗ \( B times.square A \) $
  by moving the second dual factor past $B$, evaluating the two pairs, combining their output shifts, and applying $t_(Z \, X) \[ - s - r \]$. Take its tensor–Hom adjoint. This construction proves naturality in both variables and specifies the actual comparison, rather than merely an abstract isomorphism of its objects.
  The construction is compatible with proper pushforward. We verify the two ingredients of this assertion. First, for a proper $f : Z' arrow.r Z$, the two composites from $R \( f times 1 \)_(!) \( omega_(Z') times.square omega_X \)$ to $omega_(Z times X)$ agree: one uses $"Tr"_f$ and then the product trace; the other uses the source product trace and then $"Tr"_(f times 1)$. Under adjunction to the point and Künneth, both are
  $ "Tr"_(a_(Z')) ⊗ "Tr"_(a_X) . $
  Their equality therefore follows from adjunction, including its composition identities. Second, the cup maps used to push evaluation in (2.8) commute with external products. Indeed the external-image isomorphism is obtained from proper base change and the projection formula, and after inverse-image adjunction its cup map is the tensor of the two counits. Tensoring these counits before or after evaluating gives the same map. These two equalities show that the natural $mu$ is carried to the natural $mu$ by proper-image duality. They also show its compatibility with biduality. The assertion for shifts follows by inserting the tensor shift comparisons, not by changing any trace.
  It remains to prove invertibility on the objects in the lemma. First take $s = r = 0$; the specified shift comparisons give the other degrees. On $I times Delta$, for $B = H$ and $A = underline(bb(R))_Delta$, (2.5) identifies both sides with the constant sheaf on $\( 0 \, 1 \) times Delta^compose$ extended by zero and shifted by $1 + dim Delta$. This calculation applies to the product polyhedron with its boundary, using its product orientation. The map on the interior is the product of the orientation evaluations and is an isomorphism; both sides vanish on the boundary. For $B = E_t$, closed direct-image duality reduces the map to the identity duality comparison on $Delta$. Thus it is an isomorphism for $H \, E_0 \, E_1$. Triangles and summands prove the assertion for every $B in cal(C)_I$ and for their shifts.
  For $A = R f_(*) underline(bb(R))_Delta$, the external-image isomorphism and proper duality identify (2.14) with the proper image of the comparison just verified on $I times Delta$. The preceding naturality check is what identifies it with that map. It is consequently an isomorphism even for an arbitrary continuous $f$. Finally, for fixed $B$ the locus of $A$ for which this natural comparison is an isomorphism is closed under triangles, shifts, and summands. 4 completes the proof.
  For the last assertion, write the product pairing as the tensor of its two pairings, preceded by the middle-factor permutation and followed by (2.15). Naturality of the Koszul symmetry shows that interchanging its two arguments is the same as interchanging the arguments of each factor pairing. Both factor pairings are symmetric, so the product is symmetric. ◻
]

=== 2.5 The interval boundary and homotopies <the-interval-boundary-and-homotopies>

Orient $I$ from $0$ to $1$. The local calculation already used gives

#[#set math.equation(numbering: n => "(2.16)")
 $ cal(D)_(I \, 1) J tilde.eq H \, #h(2em) cal(D)_(I \, 1) H tilde.eq J \, #h(2em) cal(D)_I E tilde.eq E . $ <cat:interval-duals>]

The first arrow $u$ of (2.13), considered as $J arrow.r cal(D)_(I \, 1) J$, is symmetric. Its pairing is multiplication $J ⊗ J arrow.r J = omega_I \[ - 1 \]$.

#thm([Lemma 2.8.])[
  (The two endpoint forms).  #emph[Let $\( A \, alpha \)$ be a symmetric degree-$r$ form in $cal(T) \( X \)$ or $cal(P) \( X \)$, and let $i_t : X arrow.r I times X$ be $x mapsto \( t \, x \)$. There is a neutral degree-$r$ form on 
$ E times.square A tilde.eq \( i_0 \)_(*) A xor \( i_1 \)_(*) A $

 whose two diagonal forms are $c \( i_0 \)_(*) alpha$ and $- c \( i_1 \)_(*) alpha$, for a common nonzero real scalar $c$. There are no off-diagonal terms.]
] <cat:endpoint-forms>

#proof[
  We first determine the interval boundary itself. Compact-support cohomology of (2.13) is the exact sequence
  #[#set math.equation(numbering: n => "(2.17)")
   $ 0 arrow.r bb(R) arrow.r^(x mapsto \( x \, x \)) bb(R)^2 arrow.r^(\( x_0 \, x_1 \) mapsto x_1 - x_0) bb(R) arrow.r 0 \, $ <cat:interval-cohomology>]
  where the last identification uses the chosen orientation of $I$. For example, it follows by taking the cellular cochains of the pair $\( I \, { 0 \, 1 } \)$: the coboundary of endpoint values is their difference. Proper duality to the point therefore identifies the shifted dual of $partial$ with a map $H arrow.r E$ having opposite nonzero coefficients at the two ends. This determines the sheaf morphism, since
  $ "Hom"_(sans(D) \( I \)) \( H \, E_t \) tilde.eq "Hom"_(sans(D) \( upright("pt") \)) \( bb(R) \, bb(R) \) = bb(R) $
  by closed direct-image adjunction, and taking global sections detects these two coefficients. The cone identity (2.11) consequently gives opposite endpoint pairings for the symmetric cone of $u$.
  Now use the symmetric morphism supplied by the product of $u$ and $alpha$:
  #[#set math.equation(numbering: n => "(2.18)")
   $ J times.square A arrow.r^(u times.square alpha) H times.square cal(D)_(X \, r) A arrow.r^(mu_(1 \, r)) cal(D)_(I times X \, r + 1) \( J times.square A \) . $ <cat:cylinder-morphism>]
  It lies in the required category by 9, and it is symmetric by that lemma. Identifying its middle object with $H times.square A$ using $alpha$, its cone triangle is
  $ J times.square A arrow.r H times.square A arrow.r^(v times.square 1) E times.square A arrow.r^(partial times.square 1) \( J times.square A \) \[ 1 \] . $
  8 supplies a neutral nonsingular form $psi$ of degree $r$ on $E times.square A$.
  The two slices are disjoint closed subsets. Closed direct-image adjunction thus makes every morphism between their supported complexes zero, in every degree. In particular $psi$ is diagonal. On either diagonal its precomposition with $v times.square 1$ determines it: restriction of $H times.square A$ to that slice is $A$, and the restriction of $v times.square 1$ is the identity. Apply (2.11) to compute this precomposition. By the natural product comparison, the shifted dual of $partial times.square 1$ is the product of the shifted dual of $partial$ with the identity of $cal(D)_(X \, r) A$, up to a single shift sign independent of the endpoint, as calculated in 45. After precomposing with $1 times.square alpha$, the two coefficients are therefore a common nonzero scalar times $alpha$ and its negative, as asserted. 7 fixes the absolute normalization of this scalar. ◻
]

#thm([Theorem 2.9.])[
  (Homotopy invariance).  #emph[If $h : I times X arrow.r Y$ is a continuous homotopy of maps of test spaces, its endpoint maps induce equal homomorphisms 
$ h_(0 *) = h_(1 *) : E_r \( X \) arrow.r E_r \( Y \) #h(2em) \( r in bb(Z) \) . $

 The same assertion holds for $W_r \( cal(P) \( - \) \)$ under the allowed semialgebraic homotopies. In particular, homotopy equivalences induce isomorphisms, and a nonempty contractible test space has the Witt groups of a point. The semialgebraic assertion uses a contraction in the allowed semialgebraic category.]
] <thm:homotopy>

#proof[
  For a form $\( A \, alpha \)$, 10 gives
  $ \[ thin \( i_0 \)_(*) A \, c \( i_0 \)_(*) alpha thin \] + \[ thin \( i_1 \)_(*) A \, - c \( i_1 \)_(*) alpha thin \] = 0 $
  in the degree-$r$ Witt group of the cylinder. Multiplying a pairing by a positive real scalar does not change its isometry class: scalar multiplication of its underlying object by the inverse square root gives an isometry. If $c < 0$, the displayed relation is the negative of the one with $\| c \|$. Thus in either case
  $ \( i_0 \)_(*) \[ A \, alpha \] = \( i_1 \)_(*) \[ A \, alpha \] . $
  Push this equality along $h$ using 7. Its composite maps are $h_0$ and $h_1$, so it proves the desired equality on form classes and hence on the Witt group. Properness of the whole homotopy is unnecessary: every object in the relation has support in $I times K$ for a compact $K subset X$. The proof for $cal(P)$ uses exactly the same relation, whose compact-source maps and homotopy images are then semialgebraic. Apply the endpoint equality to the two compositions of a homotopy equivalence and its inverse to obtain the final assertions. ◻
]

This proof implements the interval argument of #cite(label("Woolf2008")) Proposition 3.11 inside the actual generated categories. The continuous maps in their generators have only been used through proper direct image, so no constructibility condition on their images was introduced.

At a point both test categories are exactly the bounded derived category of finite-dimensional real vector spaces: a compact polyhedron has finite-dimensional bounded cohomology, and the point generator and its finite sums and shifts already generate every such complex. We will use this identification and its elementary Witt calculation in 4.

== 3 Localization, germs, and dense subcategories <sec:localization>

We will identify quotient morphisms with germs near the complement of an open set, obtain the Witt localization sequence, and compare the quotients arising from an open cover. This open-cover quotient comparison has kernel and cokernel annihilated by $2$; this integral bound will control the denominators in the sphere calculation.

Throughout this section, $cal(B)$ denotes either $cal(T)$ or $cal(P)$, and $cal(B)^0$ denotes its triangulated subcategory before adjoining summands. All spaces and, for $cal(P)$, all maps are as in 3. An open subset of a semialgebraic model need not itself be semialgebraic. The constructions below cut polyhedral sources inside its inverse image, so this causes no additional assumption. We use the compact support bounds, dualities, and fully faithful open extension functors established in Proposition 2.3, Proposition 2.5. We identify $cal(B) \( U \)$ with its image in $cal(B) \( X \)$ under extension by zero when $U subset X$ is open.

=== 3.1 Cutting off a finite construction <cutting-off-a-finite-construction>

The first step is to replace a finite construction by one supported inside a prescribed open set while preserving its germ along a closed subset. An analogous cutoff for categories generated by simplex maps appears in Ranicki–Weiss’s local chain-complex construction #cite(label("RanickiWeiss2010")) author version, Lemma 4.14 and Corollary 4.15. We prove the required statement here for the generated sheaf categories.

#thm([Lemma 3.1.])[
  (Cutoff).  #emph[Let $K subset O subset X$, where $K$ is closed in $X$ and $O$ is open. For every $A in cal(B)^0 \( X \)$ there is a morphism 
$ s : A' arrow.r A $

 such that $A'$ is extended from $cal(B)^0 \( O \)$, its cohomology vanishes outside a compact subset of $O$, and $s$ restricts to an isomorphism on some open neighborhood of $K$.]
] <lem:cutoff>

#proof[
  First take $A = R f_(*) underline(bb(R))_Delta$, with $Delta$ a compact simplex. The compact set $F = f^(- 1) K$ lies in the relatively open set $f^(- 1) O$. Finite subdivision gives a relatively open polyhedral neighborhood $E$ of $F$ such that
  $ C = overline(E) subset f^(- 1) O \, #h(2em) C upright(" and ") C \\ E upright(" are compact finite polyhedra") . $
  For completeness, choose the subdivision so that the closed stars of vertices of simplices meeting $F$ all lie in $f^(- 1) O$; the positive distance from $F$ to the complement and a sufficiently small mesh ensure this. Assign value zero to those vertices and value one to all other vertices, and extend linearly to a function $h$. It is zero on $F$ and one outside $f^(- 1) O$. Take $E = { h < 1 \/ 2 }$ and $C = { h lt.eq 1 \/ 2 }$, subdividing along the level set. Because all vertex values are zero or one, $C = overline(E)$. If $F$ is empty, take $E = C = diameter$.
  For $e : E arrow.r.hook Delta$, the natural map $e_(!) underline(bb(R))_E arrow.r underline(bb(R))_Delta$ induces
  $ s : A' = R f_(*) e_(!) underline(bb(R))_E arrow.r A . $
  On $C$, the open–closed triangle is
  $ e_(C !) underline(bb(R))_E arrow.r underline(bb(R))_C arrow.r i_(*) underline(bb(R))_(C \\ E) arrow.r e_(C !) underline(bb(R))_E \[ 1 \] \, $
  where $e_C : E arrow.r.hook C$ and $i : C \\ E arrow.r.hook C$. Push this triangle along the restrictions of $f$. Both compact sources map into $O$, and therefore $A'$ is extended from $cal(B)^0 \( O \)$, with support bounded by the compact set $f \( C \) subset O$. In the semialgebraic case these source subsets and restricted maps are still semialgebraic. Moreover,
  $ N = X \\ f \( Delta \\ E \) $
  is open and contains $K$. Its inverse image lies in $E$, so open restriction of proper direct image identifies $s \|_N$ with an isomorphism.
  The assertion is preserved by shifts and finite sums. We check closure under cones, including the compatibility of the morphisms. Suppose $a : A arrow.r B$ is a morphism between objects for which the assertion holds. First choose a cutoff $b : B' arrow.r B$ over $O$, invertible on an open $N supset K$. Cut off $A$ over the smaller open set $O ∩ N$, obtaining $c : A' arrow.r A$. Since $A'$ is supported in a compact subset of $N$, for $j : N arrow.r.hook X$ we have $A' tilde.eq j_(!) j^(*) A'$. The adjunction
  $ "Hom"_(sans(D) \( X \)) \( A' \, B' \) tilde.eq "Hom"_(sans(D) \( N \)) \( A' \|_N \, B' \|_N \) $
  therefore lifts $\( b \|_N \)^(- 1) \( a \|_N \) \( c \|_N \)$ to a morphism $a' : A' arrow.r B'$. The same adjunction with target $B$ proves the equality $b a' = a c$ on $X$. Complete this commutative square to a morphism of distinguished triangles. It gives
  $ "Cone" \( a' \) arrow.r "Cone" \( a \) $
  which is invertible on the intersection of the neighborhoods where $b$ and $c$ are invertible. Full faithfulness of open extension identifies $a'$ with a morphism in $cal(B)^0 \( O \)$, so its cone belongs to that category. The union of the compact support bounds for $A'$ and $B'$ is a compact support bound inside $O$ for this cone. The finite triangulated generation of $cal(B)^0 \( X \)$ now proves the assertion. ◻
]

Cutoff also recognizes which summands come from an open set.

#thm([Proposition 3.2.])[
  (Objects supported in an open set).  #emph[For an open inclusion $j : U arrow.r.hook X$, the essential image of $j_(!) : cal(B) \( U \) arrow.r cal(B) \( X \)$ consists exactly of those objects whose cohomology vanishes outside some compact subset of $U$. This image is a thick, duality-stable subcategory.]
] <prop:compact-support>

#proof[
  An extended object has such a support bound by 7. Conversely, let $S in cal(B) \( X \)$ vanish off a compact set $C subset U$. Write it as an actual summand
  $ S arrow.r^i A arrow.r^r S \, #h(2em) r i = upright("id")_S \, #h(2em) A in cal(B)^0 \( X \) . $
  By 12, choose $s : A' arrow.r A$ over $U$ which is invertible on a neighborhood $N$ of $C$. Since $S$ is extended by zero from $N$, open-extension adjunction lifts $i$ to $i' : S arrow.r A'$ and gives $s i' = i$ globally. Consequently $\( r s \) i' = upright("id")_S$. Restricting this splitting to $U$ makes $S \|_U$ a summand of the object $A' \|_U in cal(B)^0 \( U \)$. Thus $S \|_U in cal(B) \( U \)$, and its extension is $S$.
  Finite unions of compact subsets of $U$ are compact in $U$. The long cohomology sequence of a triangle and the stalkwise splitting of a summand show that this support condition is thick. If $S$ vanishes off $C$, open restriction of Verdier duality shows that $cal(D)_X S$ also vanishes off $C$. Duality stability follows from 5. ◻
]

=== 3.2 The quotient as a category of germs <the-quotient-as-a-category-of-germs>

The quotient by $cal(B) \( U \)$ forgets objects supported in compact subsets of $U$. We now show that its morphisms are determined by their behavior on sufficiently small neighborhoods of the complement.

For $U subset X$ open, put $K = X \\ U$. The neighborhoods of $K$ are ordered by shrinking; intersection makes this a filtered system. For $A \, B in cal(B) \( X \)$, define the group of germ morphisms by

#[#set math.equation(numbering: n => "(3.1)")
 $ "colim"_(N supset K\
N upright(" open in ") X) "Hom"_(sans(D) \( N \)) \( A \|_N \, B \|_N \) . $ <loc:eq-germs>]

Here $sans(D) \( N \) = D^b \( "Sh"_(bb(R)) \( N \) \)$ is the ambient bounded derived category. Neither restricted object is required to belong to $cal(B) \( N \)$. Composition is defined after restricting two representatives to a common neighborhood.

#thm([Theorem 3.3.])[
  (Germ description).  #emph[Restriction induces natural isomorphisms 
$ "Hom"_(cal(B) \( X \) \/ cal(B) \( U \)) \( A \, B \) tilde.eq "colim"_(N supset X \\ U) "Hom"_(sans(D) \( N \)) \( A \|_N \, B \|_N \) $

 for every $A \, B in cal(B) \( X \)$. These isomorphisms respect composition, open restriction of duality, and restriction of distinguished triangles. The quotient here is the Verdier quotient itself.]
] <thm:germs>

#proof[
  An object of $cal(B) \( U \)$ vanishes outside a compact $C subset U$, and therefore vanishes on the neighborhood $X \\ C$ of $K$. Consequently a morphism with cone in $cal(B) \( U \)$ becomes invertible in germs. Restriction thus factors through the Verdier quotient.
  We prove fullness first for $A in cal(B)^0 \( X \)$. Represent a germ by $v : A \|_N arrow.r B \|_N$ on $N supset K$. Apply 12 with $O = N$ to obtain $s : A' arrow.r A$, where $A'$ is compactly supported inside $N$ and $s$ is invertible near $K$. Adjunction extends $v \( s \|_N \)$ to a morphism $t : A' arrow.r B$ on $X$. The cone of $s$ has a compact support bound $C$ and vanishes on some open $M supset K$. It is therefore supported in the compact subset $C \\ M subset U$; 13 puts it in $cal(B) \( U \)$. The roof
  $ A arrow.l^s A' arrow.r^t B $
  defines a quotient morphism with germ $v$. For a general $A in cal(B) \( X \)$, choose $A arrow.r^i A_0 arrow.r^p A$ with $p i = upright("id")_A$ and $A_0 in cal(B)^0 \( X \)$. Lift the germ $v \( p \|_N \)$ by the case just proved, then compose its lift with $i$. This proves fullness for arbitrary summand sources and arbitrary targets.
  For faithfulness, first let $t : A arrow.r B$ be an actual morphism whose germ is zero. If $A in cal(B)^0 \( X \)$, take a neighborhood $N supset K$ on which $t$ is zero and a cutoff $s : A' arrow.r A$ supported inside $N$. Open-extension adjunction gives $t s = 0$ globally. Since $s$ becomes invertible in the quotient, $t$ becomes zero there. For a summand source as above, apply this assertion to $t p : A_0 arrow.r B$ and use $t = \( t p \) i$. Finally, every quotient morphism is represented by a roof $A arrow.l^s C arrow.r^t B$ with cone of $s$ in $cal(B) \( U \)$. Its denominator is invertible near $K$. If the roof has zero germ, the numerator $t$ has zero germ and hence is zero in the quotient by the actual-morphism case. This proves faithfulness for all roofs.
  The functor used throughout was restriction. Its compatibility with composition, triangles, and open Verdier duality proves the remaining statements; the cutoff choices were used only to prove that this canonical functor is full and faithful. ◻
]

=== 3.3 Witt localization <witt-localization>

The support characterization supplies the kernel category for localization. Balmer–Walter’s theorem then gives an exact sequence of integral Witt groups in every degree.

#thm([Theorem 3.4.])[
  (Witt localization).  #emph[For every open $U subset X$ and every $r in bb(Z)$, there is a natural long exact sequence 
#[#set math.equation(numbering: n => "(3.2)")
 $ dots.h.c arrow.r W_r \( cal(B) \( U \) \) arrow.r W_r \( cal(B) \( X \) \) arrow.r W_r \( cal(B) \( X \) \/ cal(B) \( U \) \) arrow.r^partial W_(r - 1) \( cal(B) \( U \) \) arrow.r dots.h.c . $ <loc:eq-witt-localization>]

 The sequence is natural for $cal(P) arrow.r cal(T)$ and for the pushforwards of 7: a map $g : X arrow.r X'$ with $g \( U \) subset U'$ induces a morphism from the sequence for $\( X \, U \)$ to the sequence for $\( X' \, U' \)$.]
] <thm:witt-localization>

#proof[
  We apply #cite(label("BalmerWalter2002")) Theorem 2.1, pp. 132–134. Let $cal(J) = cal(B) \( U \)$ and $cal(K) = cal(B) \( X \)$. By 13, $cal(J)$ is a full thick subcategory stable under the exact duality. It is therefore a saturated full triangulated subcategory in the terminology of that theorem.
  These categories are essentially small: compact finite polyhedra and their maps to a fixed target have a set of representatives; finite triangulated constructions use sets of derived morphisms; and adding summands still gives a set of isomorphism classes. We may thus work with small equivalent categories. Morphism groups in $cal(K)$ are real vector spaces, so multiplication by $2$ is bijective. The enriched octahedral axiom $\( upright(T R 4)^(+) \)$ holds in derived categories of exact categories and passes to full triangulated subcategories and localizations #cite(label("BalmerWalter2002")) §2, p. 133. Hence it holds for $cal(K) subset D^b \( "Sh"_(bb(R)) \( X \) \)$.
  Let $S$ be the class of morphisms whose cones belong to $cal(J)$. The ordinary Verdier quotient $S^(- 1) cal(K) = cal(K) \/ cal(J)$ has full kernel $cal(J)$, and the duality preserves $S$: dualizing a cone triangle gives a shift of the corresponding dual cone. All the localization hypotheses are now satisfied. Applying the theorem to every shifted duality and rewriting its cohomological indices as $W_r = W^(- r)$ gives (3.2).
  For the naturality assertion, $cal(P) arrow.r cal(T)$ preserves the support subcategories and the duality. Similarly, if $g \( U \) subset U'$, a compact support bound $C subset U$ maps to the compact support bound $g \( C \) subset U'$. The exact duality-preserving pushforward therefore preserves the kernel subcategories and induces a functor of their localizations.
  To check the boundary map, use its construction in #cite(label("BalmerWalter2002")) §2, p. 133. For the chosen shifted duality, a symmetric form in the quotient is isometric to the image of a symmetric morphism whose cone belongs to the kernel category. Its boundary is the Witt class of a compatible symmetric cone. An exact functor with the stated duality comparisons carries that morphism and its symmetric-cone diagram to such a representative in the target. Both routes around the naturality square can therefore use this same transported diagram. Independence of the representative gives equality of the boundary classes. The remaining maps commute by construction, proving the stated naturality. ◻
]

=== 3.4 Open covers and an integral density bound <open-covers-and-an-integral-density-bound>

For an open cover, the two relevant quotients see the same germs. Cutoff gives the following density statement, whose effect on Witt groups we will then bound integrally.

#thm([Proposition 3.5.])[
  (An open cover gives a dense inclusion).  #emph[If $X = U union V$ with $U \, V$ open, extension by zero induces a fully faithful exact functor preserving duality 
#[#set math.equation(numbering: n => "(3.3)")
 $ cal(B) \( V \) \/ cal(B) \( U ∩ V \) arrow.r cal(B) \( X \) \/ cal(B) \( U \) . $ <loc:eq-open-cover>]

 Its replete image is dense: every object of the target is an actual summand of an object in the image. These functors commute with $cal(P) arrow.r cal(T)$.]
] <prop:open-cover>

#proof[
  Extension from $V$ sends $cal(B) \( U ∩ V \)$ into $cal(B) \( U \)$, so it induces the asserted exact functor with duality. Put $K = X \\ U$; then $K subset V$ and $K = V \\ \( U ∩ V \)$. Open neighborhoods of $K$ contained in $V$ are cofinal among its open neighborhoods in $X$: intersect any given neighborhood with $V$. Applying 14 on $V$ and on $X$ therefore identifies the morphism groups on the two sides of (3.3). This proves full faithfulness.
  For $A_0 in cal(B)^0 \( X \)$, apply 12 with $O = V$ and this $K$. Its cutoff $A'_0 arrow.r A_0$ has cone compactly supported inside $U$, so it becomes an isomorphism in $cal(B) \( X \) \/ cal(B) \( U \)$. The object $A'_0$ comes from $cal(B)^0 \( V \)$. Every $A in cal(B) \( X \)$ is a summand of such an $A_0$, proving density. Fullness and exactness show that the replete image is triangulated: a morphism in the image lifts to the source, and its cone is the image of a cone there. It is also duality stable. All functors used are the same open extensions for $cal(P)$ and $cal(T)$, which proves the final assertion. ◻
]

The exponent-two kernel and cokernel bound for dense inclusions follows from the cofinality theorem for triangular Witt groups of Hornbostel–Schlichting #cite(label("HornbostelSchlichting2004")) author preprint, Appendix A, Theorem A.2. We give a direct proof with an explicit homomorphism in the reverse direction. It doubles forms into the smaller category and checks that neutral relations descend there.

#thm([Theorem 3.6.])[
  (Dense doubling).  #emph[Let $cal(A) subset cal(C)$ be a full replete triangulated subcategory stable under duality, and suppose it is dense: each object of $cal(C)$ is a summand of an object of $cal(A)$. Assume these categories admit triangular Witt groups. In every degree, the inclusion homomorphism 
$ iota : W_r \( cal(A) \) arrow.r W_r \( cal(C) \) $

 has kernel and cokernel annihilated by $2$. More precisely, there is a homomorphism $d : W_r \( cal(C) \) arrow.r W_r \( cal(A) \)$ satisfying 
$ iota d = 2 upright("id") \, #h(2em) d iota = 2 upright("id") . $

 No closure of $cal(A)$ under arbitrary summands is required.]
] <thm:dense-doubling>

#proof[
  Fix the degree and denote its duality by $\#$. We first record a consequence of density:
  #[#set math.equation(numbering: n => "(3.4)")
   $ y xor y \[ 1 \] in cal(A) #h(2em) \( y in cal(C) \) . $ <loc:eq-adjacent-shifts>]
  Indeed, write $c tilde.eq y xor z$ with $c in cal(A)$. If density is expressed by a split inclusion, its cone supplies such a complement by the split-triangle identity. The endomorphism $0_y xor upright("id")_z$ of $c$ belongs to $cal(A)$ by fullness. Its cone is $y xor y \[ 1 \]$, which proves (3.4). Applying this to $y \[ - 1 \]$ also gives $y xor y \[ - 1 \] in cal(A)$.
  For a nonsingular symmetric form $q = \( x \, alpha \)$ in $cal(C)$, set
  #[#set math.equation(numbering: n => "(3.5)")
   $ D \( q \) = q perp q perp H \( x \[ 1 \] \) \, $ <loc:eq-doubling-form>]
  where $H$ denotes the hyperbolic form for $\#$. Its underlying object is
  $ x xor x xor x \[ 1 \] xor \# \( x \[ 1 \] \) tilde.eq \( x xor x \[ 1 \] \) xor \( x xor x \[ - 1 \] \) \, $
  using $alpha : x tilde.eq \# x$ and $\# \( x \[ 1 \] \) tilde.eq \( \# x \) \[ - 1 \]$. By (3.4) it belongs to $cal(A)$. Repleteness and fullness make $D \( q \)$ a form in $cal(A)$. This assignment respects isometries and orthogonal sums: the direct sum of isometries acts on the two copies of $q$, and the hyperbolic construction respects isomorphisms and direct sums. It remains to check neutral forms.
  Suppose $q$ has a triangular lagrangian $a : l arrow.r x$. Its lagrangian triangle has the form
  $ l arrow.r^a x arrow.r \# l arrow.r l \[ 1 \] \, $
  with the duality compatibility that defines a neutral form. The object $z = l xor l \[ 1 \]$ belongs to $cal(A)$, so $H \( z \)$ is neutral already in $cal(A)$. In $cal(C)$, the form $D \( q \) perp H \( z \)$ has lagrangian
  #[#set math.equation(numbering: n => "(3.6)")
   $ L = l xor l xor x \[ 1 \] xor \# l xor l \[ 1 \] . $ <loc:eq-doubled-lagrangian>]
  Here the first two factors are the lagrangians of the copies of $q$; $x \[ 1 \]$ is the first lagrangian of $H \( x \[ 1 \] \)$; and, in $H \( z \) tilde.eq H \( l \) perp H \( l \[ 1 \] \)$, choose the second lagrangian $\# l$ of $H \( l \)$ and the first lagrangian $l \[ 1 \]$ of $H \( l \[ 1 \] \)$. Orthogonal sum of these lagrangian triangles gives the indicated duality-compatible lagrangian triangle.
  We verify $L in cal(A)$ using only fullness and triangles. Both objects of the morphism
  $ a xor 0 : l xor l \[ 1 \] arrow.r x xor x \[ 1 \] $
  belong to $cal(A)$ by (3.4). Its cone, and hence the following object, belongs to $cal(A)$:
  $ C = \# l xor x \[ 1 \] xor l \[ 2 \] . $
  Add $l xor l \[ 1 \] in cal(A)$ and rearrange to obtain
  $ C xor l xor l \[ 1 \] tilde.eq \( \# l xor x \[ 1 \] xor l \) xor \( l \[ 1 \] xor l \[ 2 \] \) . $
  The second displayed summand $l \[ 1 \] xor l \[ 2 \]$ is itself in $cal(A)$. Its split inclusion into the displayed total object is therefore a morphism in $cal(A)$; taking its cone puts $\# l xor x \[ 1 \] xor l$ in $cal(A)$. Finally,
  $ L tilde.eq \( l xor l \[ 1 \] \) xor \( \# l xor x \[ 1 \] xor l \) $
  also belongs to $cal(A)$. This removal used a split triangle between objects already in $cal(A)$.
  The underlying object of $D \( q \) perp H \( z \)$, its lagrangian $L$, and $\# L$ now belong to $cal(A)$. Fullness supplies all arrows of the lagrangian diagram in $cal(A)$; its inherited triangulation and duality make the same diagram a lagrangian diagram there. Thus $D \( q \) perp H \( z \)$ is neutral in $cal(A)$, and since $H \( z \)$ is neutral there, $\[ D \( q \) \] = 0$ in $W_r \( cal(A) \)$. The assignment (3.5) consequently descends to a homomorphism $d : W_r \( cal(C) \) arrow.r W_r \( cal(A) \)$.
  In $cal(C)$, $H \( x \[ 1 \] \)$ is neutral, so $iota d \[ q \] = 2 \[ q \]$. If $q$ starts in $cal(A)$, then $x \[ 1 \]$ is in $cal(A)$ and the same hyperbolic form is neutral there, giving $d iota \[ q \] = 2 \[ q \]$. The first identity annihilates the cokernel of $iota$ by $2$, and the second annihilates its kernel by $2$. ◻
]

#thm([Corollary 3.7.])[
  #emph[The map on Witt groups induced by (3.3) has kernel and cokernel annihilated by $2$, in every degree and for either test category.]
] <loc:cor-open-cover-bound>

#proof[
  Apply 17 to the replete image in 16. ◻
]

== 4 A bounded lattice on the test sphere <sec:lattice>

Set

$ F_r \( X \) = W_r \( cal(P) \( X \) \) \, #h(2em) E_r \( X \) = W_r \( cal(T) \( X \) \) . $

The inclusion of categories gives a natural comparison $F_r \( X \) arrow.r E_r \( X \)$. In this section spheres and their pole complements have their usual semialgebraic models. Rationalization always means tensoring these abelian groups with $bb(Q)$; the sheaf coefficients remain $bb(R)$. Fix an odd integer $d gt.eq 3$. We will prove that the rational image of $E_d \( S^d \)$ lies in a lattice with one denominator $L_d$. The bound may depend on $d$, but will be independent of every action, test map, and character partition used later.

=== 4.1 Point groups and finite exponent comparison <point-groups-and-finite-exponent-comparison>

#thm([Lemma 4.1.])[
  (The point calculation).  #emph[For every integer $r$, the comparison at a point is an isomorphism, and 
$ F_r \( upright("pt") \) = E_r \( upright("pt") \) = cases(delim: "{", bb(Z) \, & r equiv 0 med \( mod med 4 \) \,, 0 \, & r equiv.not 0 med \( mod med 4 \) .) $

 In degree zero the indicated isomorphism is signature. On $S^0$ both theories are the direct sum of two copies of the point theory, and the map to the point is addition.]
] <lat:point-groups>

#proof[
  A generator over a point is the finite dimensional bounded cohomology complex of a compact finite polyhedron. Conversely, the point constant and its shifts generate every bounded complex of finite dimensional real vector spaces: split a complex into its cohomology and a contractible complex. Both point categories are therefore precisely this derived category.
  For a degree $r$ form, the cohomology pairing pairs $H^i$ perfectly with $H^(r - i)$. The complex splitting identifies the form with the orthogonal sum of these cohomology pairings. Terms with $i eq.not r - i$ occur in hyperbolic pairs: choose one member as a lagrangian, the other being its shifted dual. If $r$ is odd there is no remaining term. If $r = 2 k$, the remaining form is on $H^k$, with symmetry sign $\( - 1 \)^(k^2) = \( - 1 \)^k$ from tensor symmetry. For odd $k$ it is alternating; a symplectic basis exhibits it as hyperbolic. For even $k$ it is a real symmetric form. Diagonalization and cancellation of a positive and a negative line give its class as its signature times the positive line.
  Signature respects all neutral relations. Indeed, in a lagrangian triangle $L arrow.r A arrow.r cal(D)_(upright("pt") \, r) L arrow.r L \[ 1 \]$, at the middle degree $k$ the second map is the adjoint of the first for the middle pairing. Thus exactness identifies the image of $H^k \( L \)$ with its own perpendicular in $H^k \( A \)$. Such a symmetric form has signature zero. The positive line has signature one, proving the claimed infinite cyclic group. Finally, sheaves and their dualities on the two-point space split by the two open and closed components, giving the last assertion. ◻
]

We record the elementary algebra that will keep the denominator bound uniform. The class of abelian groups annihilated by some finite power of $2$ is closed under subgroups, quotients, and finite extensions: an extension of groups annihilated by $2^a$ and $2^b$ is annihilated by $2^(a + b)$. The exponent is allowed to depend on the group, but not on an element of it.

#thm([Lemma 4.2.])[
  (Finite diagram chases).  #emph[In a commutative diagram of exact rows 
$ A_1 & arrow.r & A_2 & arrow.r & A_3 & arrow.r & A_4 & arrow.r & A_5\
f_1 arrow.b &  & f_2 arrow.b &  & f_3 arrow.b &  & f_4 arrow.b &  & f_5 arrow.b\
B_1 & arrow.r & B_2 & arrow.r & B_3 & arrow.r & B_4 & arrow.r & B_5 \, $

 suppose the kernels and cokernels of $f_1 \, f_2 \, f_4 \, f_5$ are annihilated by $q$. Then the kernel and cokernel of $f_3$ are annihilated by $q^3$.]
  #emph[Suppose also that a commutative square is written as 
$ A & arrow.r^i & A'\
f arrow.b &  & arrow.b g\
B & arrow.r^j & B' . $

 If both horizontal kernels and cokernels are annihilated by $2$, and the kernel and cokernel of $f$ are annihilated by $q$, then those of $g$ are annihilated by $4 q$.]
] <lat:finite-chases>

#proof[
  Denote the arrows in the first rows by $a_i$ and $b_i$. If $x in ker f_3$, then $a_3 \( q x \) = 0$, so choose $v in A_2$ with $a_2 v = q x$. Since $b_2 f_2 v = 0$, choose $w in B_1$ with $b_1 w = f_2 v$. Lift $q w$ to $z in A_1$, so that $f_1 z = q w$. Now $q v - a_1 z in ker f_2$, hence $q \( q v - a_1 z \) = 0$. Applying $a_2$ gives $q^3 x = 0$.
  For $y in B_3$, choose $v in A_4$ with $f_4 v = q b_3 y$. Then $a_4 v in ker f_5$, so choose $w in A_3$ with $a_3 w = q v$. The element $q^2 y - f_3 w$ lies in $ker b_3$; write it as $b_2 z$ with $z in B_2$. Choose $t in A_2$ with $f_2 t = q z$. The equality
  $ f_3 \( q w + a_2 t \) = q f_3 w + q b_2 z = q^3 y $
  proves the cokernel assertion.
  In the square, if $g \( x' \) = 0$, lift $2 x'$ to $x in A$. Then $j f \( x \) = 0$, so $f \( 2 x \) = 0$ and $2 q x = 0$. Applying $i$ gives $4 q x' = 0$. For $y' in B'$, lift $2 y'$ to $y in B$ and then lift $q y$ to $x in A$. This gives $2 q y' = g \( i x \)$, which even annihilates the cokernel by $2 q$. ◻
]

#thm([Theorem 4.3.])[
  (Bounded comparison).  #emph[For every $j gt.eq 0$ there is a nonnegative integer $e_j$, independent of $r$, such that the kernel and cokernel of 
$ F_r \( S^j \) arrow.r E_r \( S^j \) $

 are annihilated by $2^(e_j)$ for every integer $r$.]
] <thm:bounded-comparison>

#proof[
  The assertion for $j = 0$ follows from 19, with $e_0 = 0$. Suppose it holds for $j - 1$. Put $X = S^j$, let $U \, V$ be the complements of two distinct poles, and put $I = U ∩ V$. The spaces $U \, V$ are semialgebraically contractible, and $I$ is semialgebraically homotopy equivalent to $S^(j - 1)$ (for $j = 1$ this has two components). By 11, the comparisons on $U \, V$ are isomorphisms and those on $I$ have the induction bound in every degree. These homotopies need not be proper: the pushforward functors of 7 use compact supports.
  For $cal(B) = cal(P)$ or $cal(T)$ write temporarily
  $ Q_r^(cal(B)) \( Z \, A \) = W_r #scale(x: 120%, y: 120%)[\(] cal(B) \( Z \) \/ cal(B) \( A \) #scale(x: 120%, y: 120%)[\)] $
  when $A$ is open in $Z$. Naturality of 15 gives two exact rows of the form
  $ W_r \( cal(B) \( I \) \) arrow.r W_r \( cal(B) \( V \) \) arrow.r Q_r^(cal(B)) \( V \, I \) arrow.r W_(r - 1) \( cal(B) \( I \) \) arrow.r W_(r - 1) \( cal(B) \( V \) \) . $
  Their four outer comparisons have the uniform induction bound. The first chase in 20 therefore bounds the comparison on $Q_r \( V \, I \)$ in all degrees.
  By Proposition 3.5, Theorem 3.6, the two horizontal maps in the natural square
  $ Q_r^(cal(P)) \( V \, I \) & arrow.r & Q_r^(cal(P)) \( X \, U \)\
arrow.b &  & arrow.b\
Q_r^(cal(T)) \( V \, I \) & arrow.r & Q_r^(cal(T)) \( X \, U \) $
  have kernels and cokernels annihilated by $2$. The square chase therefore gives a uniform finite exponent for the right-hand comparison. Finally use the two localization rows
  $ Q_(r + 1)^(cal(B)) \( X \, U \) arrow.r W_r \( cal(B) \( U \) \) arrow.r W_r \( cal(B) \( X \) \) arrow.r Q_r^(cal(B)) \( X \, U \) arrow.r W_(r - 1) \( cal(B) \( U \) \) . $
  A further five-term chase gives the desired bound on the middle comparison. Each step used only a finite exact diagram, and the same bounds work for every $r$. ◻
]

#prodef([Remark 4.4.])[
  The preceding proof can be made quantitative without optimizing any bound: if the induction exponent is $e$, its three steps give $3 e$, then $3 e + 2$, then $9 e + 6$. Thus one may take $e_0 = 0$ and $e_j = 9 e_(j - 1) + 6$, or equivalently $e_j = 3 \( 9^j - 1 \) \/ 4$. This bound depends on the sphere dimension $j$, but works for every degree and every class in the comparison groups. Only existence of such a fixed exponent will be used. A comparison merely after inverting $2$ would not suffice: the inclusion $bb(Z) subset bb(Z) \[ 1 \/ 2 \]$ has an unbounded $2$-primary torsion cokernel.
] <lat:exponent-bookkeeping>

=== 4.2 The rational sphere group and its integral generator <the-rational-sphere-group-and-its-integral-generator>

#thm([Proposition 4.5.])[
  (Rational sphere calculation).  #emph[For either $G_r = F_r$ or $G_r = E_r$, and for $j gt.eq 0$, 
$ G_r \( S^j \) ⊗ bb(Q) tilde.eq #scale(x: 120%, y: 120%)[\(] G_r \( upright("pt") \) ⊗ bb(Q) #scale(x: 120%, y: 120%)[\)] xor #scale(x: 120%, y: 120%)[\(] G_(r - j) \( upright("pt") \) ⊗ bb(Q) #scale(x: 120%, y: 120%)[\)] . $

 In particular, for the fixed odd integer $d$, both $F_d \( S^d \) ⊗ bb(Q)$ and $E_d \( S^d \) ⊗ bb(Q)$ are one-dimensional rational vector spaces.]
] <prop:sphere-rank>

#proof[
  Write $tilde(G)_r \( Z \) = ker \( G_r \( Z \) arrow.r G_r \( upright("pt") \) \)$ for the kernel of projection to a point. A point inclusion splits this projection whenever $Z$ is nonempty. Write $cal(B)$ for the category giving $G$, and use the notation $Q_r^(cal(B))$ from the preceding proof. For $j gt.eq 1$, use its pole cover $X = U union V$ and $I = U ∩ V$. Since $G_r \( U \) arrow.r G_r \( upright("pt") \)$ is an isomorphism, the map $G_r \( U \) arrow.r G_r \( X \)$ is split injective in every degree. Localization therefore identifies
  $ Q_r^(cal(B)) \( X \, U \) tilde.eq tilde(G)_r \( X \) . $
  More explicitly, its kernel in $G_r \( X \)$ is exactly the point summand, and its next boundary is zero because $G_(r - 1) \( U \) arrow.r G_(r - 1) \( X \)$ is injective.
  Likewise $G_r \( I \) arrow.r G_r \( V \)$ is split surjective: project to the point, use contractibility of $V$, and choose a point of $I$ as a section. The other localization sequence consequently identifies its boundary as an isomorphism
  $ Q_r^(cal(B)) \( V \, I \) tilde.eq tilde(G)_(r - 1) \( I \) . $
  The dense map between these two relative groups is an isomorphism after tensoring with $bb(Q)$ by 17. Thus
  $ tilde(G)_r \( S^j \) ⊗ bb(Q) tilde.eq tilde(G)_(r - 1) \( S^(j - 1) \) ⊗ bb(Q) . $
  For $S^0$ the reduced group is the kernel of addition of two point groups, hence one point group. Induction and the split point summand prove the formula. At $\( r \, j \) = \( d \, d \)$ the two summands are $0$ and $bb(Q)$, respectively, because $d$ is odd and 19 gives $G_d \( upright("pt") \) = 0$ and $G_0 \( upright("pt") \) = bb(Z)$. ◻
]

Give $S^d$ an orientation. Its constant real sheaf, with its orientation pairing into $omega_(S^d) \[ - d \]$, determines

$ u_(F \, d) in F_d \( S^d \) \, #h(2em) u_d in E_d \( S^d \) . $

The comparison takes $u_(F \, d)$ to $u_d$. Write $overline(u)_(F \, d) = u_(F \, d) ⊗ 1$ and $overline(u)_d = u_d ⊗ 1$ for their rational images.

#thm([Proposition 4.6.])[
  (Signature on a finite semialgebraic relation).  #emph[Every finite collection of objects of $cal(P) \( S^d \)$ has finite dimensional locally constant cohomology on a common dense open subset of $S^d$. On a sufficiently small oriented ball there, a degree-$d$ form has an integral signature on its degree-zero cohomology. For any finite Witt relation one can choose such a ball simultaneously for all objects and lagrangian diagrams in the relation; the signatures then respect that relation.]
  #emph[Consequently $u_(F \, d)$ is nontorsion and 
$ F_d \( S^d \) ⊗ bb(Q) = bb(Q) overline(u)_(F \, d) \,\
"im" #scale(x: 120%, y: 120%)[\(] F_d \( S^d \) arrow.r F_d \( S^d \) ⊗ bb(Q) #scale(x: 120%, y: 120%)[\)] = bb(Z) overline(u)_(F \, d) . $

]
] <prop:generic-signature>

#proof[
  For a continuous semialgebraic map from a compact polyhedron, Hardt’s semialgebraic triviality theorem gives a finite semialgebraic partition of the target over whose pieces the map is trivial #cite(label("Hardt1980")) main theorem; see also the precise finite-partition formulation in #cite(label("Coste2000")) Theorem 4.1. Refining this partition into cells, the union of the top dimensional cells is open and dense in the sphere. Each fiber is a compact semialgebraic set, so has the finite cohomology of a finite triangulation; these semialgebraic stratification and triangulation facts are recalled in #cite(label("HardtLambrechtsTurchinVolic2011")) §2.1, pp. 2481–2483. Proper base change and the trivializations show that a generator has finite dimensional locally constant cohomology on that open set.
  This property passes to the finite constructions defining $cal(P)$. Shifts and summands cause no difficulty. For a cone, the cohomology long exact sequence expresses each cohomology sheaf as an extension of a kernel and a cokernel of morphisms of finite local systems. Those kernels and cokernels are local systems, and such extensions are locally constant: on a small ball, positive extension groups between finite constant sheaves vanish. Indeed, for finite vector spaces $V \, W$ and a ball $B$,
  $ "Ext"_B^k \( underline(V)_B \, underline(W)_B \) = H^k #scale(x: 120%, y: 120%)[\(] B \; underline("Hom"_(bb(R)) \( V \, W \))_B #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( k > 0 \) . $
  Taking the finite intersection of the dense open subsets needed for a finite list of generators proves the first assertion for every finite list of objects. No condition is imposed on the derived morphisms in their constructions.
  Choose a ball $B$ in that common open subset. Every local system in question is constant on $B$, and the same extension vanishing splits the successive truncation triangles of each bounded complex. Hence its restriction is isomorphic to the constant complex associated to its finite dimensional cohomology complex. In particular the constant-complex functor identifies the full subcategory of bounded complexes on $B$ with finite locally constant cohomology with the bounded derived category of finite dimensional vector spaces. The orientation identification $omega_B tilde.eq underline(bb(R))_B \[ d \]$ identifies $cal(D)_(B \, d)$ on this subcategory with ordinary derived linear duality. This identification is compatible with evaluation and biduality: on a finite constant complex it is the natural map
  $ underline("RHom"_(bb(R)) \( C \, bb(R) \))_B tilde.eq "Rℋom"_B \( underline(C)_B \, underline(bb(R))_B \) \, $
  and the assertion passes through its finite shifts and sums. The orientation form of the constant line becomes the positive form $x y$. This degree-zero local description holds in both odd congruence classes of $d$ modulo four.
  A nonsingular degree-$d$ form on $A$ thus gives an ordinary nonsingular symmetric form $b$ on $H^0 \( A \)_x$, for $x in B$. Its signature is an integer, additive under orthogonal sums and invariant under isometry. To check neutrality, include a lagrangian triangle in the finite list before choosing $B$. Writing $ell : H^0 \( L \)_x arrow.r H^0 \( A \)_x$, its middle exact sequence is
  $ H^0 \( L \)_x arrow.r^ell H^0 \( A \)_x arrow.r^(ell^(*) b) #scale(x: 120%, y: 120%)[\(] H^0 \( L \)_x #scale(x: 120%, y: 120%)[\)]^(*) . $
  The last map can have the harmless common sign of the triangle convention. Exactness gives $"im" ell = ker \( ell^(*) b \) = \( "im" ell \)^perp$. This is an ordinary lagrangian; the middle signature is zero. Since each equality in a Witt group is witnessed by a finite combination of isometries, orthogonal sums, and neutral relations, this proves the assertion about any fixed relation.
  The class $u_(F \, d)$ has signature one on every such oriented ball. If a nonzero multiple of it vanished, a finite relation witnessing that equality would contradict its signature. Thus $u_(F \, d)$ is nontorsion and spans the rational line of 23. For $x in F_d \( S^d \)$ write $x ⊗ 1 = \( a \/ b \) overline(u)_(F \, d)$, where $a in bb(Z)$ and $b > 0$. The difference $b x - a u_(F \, d)$ is torsion, so for some integer $nu > 0$ there is an actual equality $nu b x = nu a u_(F \, d)$ in the Witt group. Choose a common ball for this finite equality and put $sigma$ for the signature of a representative of $x$ there. It gives $nu b sigma = nu a$, hence $a \/ b = sigma in bb(Z)$. All integral multiples of $u_(F \, d)$ occur, proving the asserted equality of images. ◻
]

#thm([Theorem 4.7.])[
  (The fixed sphere lattice).  #emph[Let $d gt.eq 3$ be odd, with orientation class $u_d$ as above. There is a positive power of $2$, denoted by $L_d$, such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ E_d \( S^d \) ⊗ bb(Q) = bb(Q) overline(u)_d \,\
"im" #scale(x: 120%, y: 120%)[\(] E_d \( S^d \) arrow.r E_d \( S^d \) ⊗ bb(Q) #scale(x: 120%, y: 120%)[\)] subset.eq L_d^(- 1) bb(Z) overline(u)_d . $ <lat:lattice>]

 One may take $L_d = 2^(e_d)$. This denominator is fixed by the sphere dimension and comparison. It is independent of every later action, test map, character partition, prime $p$, and exponent $k$.]
] <thm:sphere-lattice>

#proof[
  By 21 the comparison is a rational isomorphism, so 24 identifies its nonzero rational orientation class with $overline(u)_d$. Take $L_d = 2^(e_d)$, which annihilates the comparison cokernel in degree $d$. For every $x in E_d \( S^d \)$ there is $y in F_d \( S^d \)$ with $L_d x$ equal to its image. The rational image of $y$ is an integral multiple of $overline(u)_(F \, d)$ by 24, so $x ⊗ 1 in L_d^(- 1) bb(Z) overline(u)_d$. ◻
]

=== 4.3 Degree and integral localization <degree-and-integral-localization>

Two further properties will connect the lattice to the action: degree compares sphere tests, and integral localization lifts the character classes from a quotient category.

#thm([Proposition 4.8.])[
  (Action of degree).  #emph[Let $d gt.eq 3$ be odd. If $f : S^d arrow.r S^d$ is continuous and has degree $s in bb(Z)$, then 
$ f_(*) overline(u)_d = s overline(u)_d quad upright("in ") E_d \( S^d \) ⊗ bb(Q) . $

 Consequently $f_(*)$ acts on this entire rational group by multiplication by $s$. More generally, if $N$ is a connected closed oriented triangulable $d$-manifold and $f : N arrow.r S^d$ has degree $s$, its pushed orientation form has rational class $s overline(u)_d$.]
] <prop:degree-action>

#proof[
  Choose a finite polyhedral model for the source and a finite semialgebraic triangulation of the target sphere. The latter identifies its polyhedral model with $S^d$ semialgebraically. On these models choose a simplicial approximation $g$ to $f$ after subdivision, as in #cite(label("Hatcher2002")) Theorem 2C.1, pp. 177–179. The models and $g$ are semialgebraic. Orient each model by its identifying homeomorphism; these identifications preserve the fundamental classes and the orientation forms used for degree and pushforward. The homotopy need only be continuous: 11 identifies $f_(*)$ and $g_(*)$ on the continuous theory, with the model identifications understood. The constant sheaf on the source model is an identity-map generator, so its orientation form belongs to the semialgebraic category.
  Fix a top dimensional target simplex. In its interior choose a small ball $B$ avoiding the images of lower dimensional source simplices and of collapsed top dimensional simplices. Each source simplex mapping onto this target simplex contributes one open sheet over $B$, mapped homeomorphically onto $B$. These are all preimages of $B$, and there are finitely many. The restricted map is proper, as the base change of the map from the compact source. On $B$ its direct image is the constant vector space with one basis vector for each sheet.
  The pushed pairing is diagonal in this basis. Products between different sheets vanish; on one sheet the trace of the orientation pairing is $+ 1$ or $- 1$ according as that homeomorphism preserves or reverses the chosen orientations. To see the sign directly, the trace for a homeomorphism identifies its source dualizing complex with the target dualizing complex; relative to the two orientation trivializations, the induced map on local top homology is exactly its orientation sign. Proper duality and its trace therefore give the same sign for the constant-line pairing. Its signature on $B$ is the sum of these local signs. For a sphere source this is the degree $s$ by the local-degree formula #cite(label("Hatcher2002")) Proposition 2.30, pp. 135–136. For the stated general source, fix $y in B$ and write $g^(- 1) \( y \) = { x_1 \, dots.h \, x_t }$. Excision identifies
  $ H_d \( N \, N \\ g^(- 1) \( y \) \; bb(Z) \) tilde.eq xor.big_(i = 1)^t H_d \( N \, N \\ { x_i } \; bb(Z) \) . $
  The fundamental class $\[ N \]$ maps to the tuple of positive local orientation generators. The relative map induced by $g$ sends the $i$th generator to $epsilon.alt_i$ times the orientation generator of $H_d \( S^d \, S^d \\ { y } \; bb(Z) \)$, where $epsilon.alt_i$ is the orientation sign of that sheet. Naturality of the absolute-to-relative maps, together with $g_(*) \[ N \] = s \[ S^d \]$, gives $s = sum_i epsilon.alt_i$. This also covers an empty fiber, with sum zero. Only interiors of top dimensional simplices occur; these are open balls, so no PL manifold structure is required of the triangulation.
  This local calculation determines the rational coefficient without assuming a globally defined generic signature. In fact, if the rational image of $g_(*) u_(F \, d)$ (or of the pushed class from $N$) is $rho overline(u)_(F \, d)$, clear denominators and torsion to obtain a finite Witt relation. Choose the signature ball for that relation inside the ball of sheets just used; this is possible since the relation’s common open set is dense. Its signature says $rho = s$. Apply the comparison to obtain the assertion in $E$. Finally, $overline(u)_d$ spans the rational group by 25, so the assertion about the entire group follows by linearity. ◻
]

#thm([Proposition 4.9.])[
  (A contractible open set can be localized away).  #emph[Let $d gt.eq 3$ be odd. Let $X$ be any test space for $cal(T)$, and let $U subset X$ be a nonempty contractible open subset. Then the quotient functor induces an integral isomorphism 
#[#set math.equation(numbering: n => "(4.2)")
 $ E_d \( X \) arrow.r^(med tilde.op med) W_d #scale(x: 120%, y: 120%)[\(] cal(T) \( X \) \/ cal(T) \( U \) #scale(x: 120%, y: 120%)[\)] . $ <lat:contractible-isomorphism>]

 In particular this applies to compact test polyhedra and to their manifold-with-boundary models. It is natural for continuous maps $g : X arrow.r X'$ with $g \( U \) subset U'$, whenever $U'$ is also a nonempty contractible open subset.]
] <prop:contractible-quotient>

#proof[
  Homotopy invariance and 19 give $E_d \( U \) = E_d \( upright("pt") \) = 0$. Let $i : U arrow.r.hook X$ and let $p_Z : Z arrow.r upright("pt")$ denote projection. The composite
  $ E_(d - 1) \( U \) arrow.r^(i_(*)) E_(d - 1) \( X \) arrow.r^(\( p_X \)_(*)) E_(d - 1) \( upright("pt") \) $
  is $\( p_U \)_(*)$, an isomorphism. Thus $i_(*)$ is split injective, with retraction $\( \( p_U \)_(*) \)^(- 1) \( p_X \)_(*)$. If $d equiv 1 med \( mod med 4 \)$, the point group here is $bb(Z)$; if $d equiv 3 med \( mod med 4 \)$, it is zero. The split-injectivity argument applies in either case. All these maps exist by compact-support pushforward, whether or not the space maps are proper. The relevant part of 15 is
  $ 0 arrow.r E_d \( X \) arrow.r W_d #scale(x: 120%, y: 120%)[\(] cal(T) \( X \) \/ cal(T) \( U \) #scale(x: 120%, y: 120%)[\)] arrow.r E_(d - 1) \( U \) arrow.r^(i_(*)) E_(d - 1) \( X \) . $
  Exactness and the last injectivity give the asserted isomorphism over $bb(Z)$. The functor $g_(*)$ preserves the support subcategory because $g \( U \) subset U'$, so naturality follows from the natural localization sequence. No rationalization or splitting of quotient idempotents is involved. ◻
]

== 5 Preparing local tests <sec:local-tests>

Fix $n gt.eq 1$ and a prime $p$, and suppose that $bb(Z)_p$ acts faithfully and jointly continuously on a connected Hausdorff second-countable topological $n$-manifold $M$ without boundary, as in 2. We will construct a degree-one test from a compact sphere through an orbit space, and then move a positive-degree multiple of that test into a prescribed open region of the orbit space. The construction begins with a faithful action inside one coordinate chart.

=== 5.1 An invariant chart subset and a compact test source <an-invariant-chart-subset-and-a-compact-test-source>

#thm([Proposition 5.1.])[
  (An invariant chart subset).  #emph[There are an open subgroup $G tilde.equiv bb(Z)_p$ and a nonempty connected $G$-invariant open subset $O$ of a coordinate chart of $M$ such that $G$ acts faithfully and preserves orientation on $O$. In particular, we may regard $O$ as the actual open subset of $bb(R)^n$ supplied by that chart.]
] <prop:chart-reduction>

#proof[
  We use Newman’s theorem in the following form: a finite-order homeomorphism of a connected topological manifold which is the identity on a nonempty open subset is the identity everywhere #cite(label("Newman1931")); for a modern statement and proof, see #cite(label("Pardon2019")) author manuscript, pp. 2–3. The local reduction using this theorem also appears in #cite(label("Pardon2013")) §4.1.
  There is a point $x in M$ such that no open subgroup of $bb(Z)_p$ fixes a neighborhood of $x$ pointwise. To prove this, suppose otherwise, and write
  $ H_j = p^j bb(Z)_p \, #h(2em) F_j = "int"_M "Fix" \( H_j \) . $
  Some $F_j$ is nonempty. We show that it is closed. If $x in overline(F_j)$, then $H_j$ fixes $x$, since its fixed set is closed. By the supposition, some neighborhood $N$ of $x$ is fixed pointwise by $H_ell$. Compactness of $H_j$ and continuity at $H_j times { x }$ give a coordinate ball $B in.rev x$ so small that $H_j B subset N$. The saturation $N' = H_j B$ is open and connected: every translate of $B$ contains $x$. It is $H_j$-invariant, and the restricted action factors through the finite group $H_j \/ \( H_j ∩ H_ell \)$. Each of its homeomorphisms is therefore periodic and fixes the nonempty open subset $N' ∩ F_j$ pointwise. Newman’s theorem makes each the identity on $N'$. Thus $x in F_j$, proving closedness. Connectedness gives $F_j = M$, contrary to faithfulness.
  Choose such an $x$, a chart $C in.rev x$, and a coordinate ball $B in.rev x$ with $overline(B)$ compactly contained in $C$. Joint continuity and compactness of $overline(B)$ give an open subgroup $H$ such that $H overline(B) subset C$. Shrinking $H$ further gives $H x subset B$. Then
  $ O = H B = union.big_(g in H) g B subset C $
  is open and invariant, and is connected because every $g B$ meets $B$ at $g x$. Its restriction kernel in $H$ is closed. A nonzero closed subgroup of $bb(Z)_p$ is $p^j bb(Z)_p$ for some $j$: choose an element of smallest finite $p$-adic valuation and use the density of its integer multiples in that subgroup. Thus a nonzero restriction kernel would be an open subgroup fixing the neighborhood $O$ of $x$, which is impossible.
  The chart orients $O$. Every homeomorphism of connected $O$ either preserves or reverses this orientation, so every square preserves it. Replace $H$ by $G = 2 H$. This is an open subgroup isomorphic to $bb(Z)_p$ and its restricted action remains faithful. For odd $p$ this replacement leaves $H$ unchanged; for $p = 2$ it has index two. ◻
]

Fix an odd integer $d > n$ with $d gt.eq 3$ for the rest of the proof. Give

$ W = O times bb(R)^(d - n) subset bb(R)^d $

the product orientation, and let $G$ act trivially on the auxiliary factor. This action remains faithful and preserves orientation. Write $W^(+) = W union { oo }$ for its one-point compactification and use $S^d = bb(R)^d union { oo_(upright("amb")) }$ with the matching orientation as the compact test source. Its orientation form represents $u_d$ of 25. The choice of $d$ will allow us to apply the odd-sphere homotopy calculation below.

#thm([Lemma 5.2.])[
  (Collapse and compactification).  #emph[The map 
$ c : S^d arrow.r W^(+) \, #h(2em) c \( z \) = cases(delim: "{", z \, & z in W \,, oo \, & z in.not W \,) $

 is continuous. The action on $W$ extends to a jointly continuous action on $W^(+)$ fixing $oo$. Both $W^(+)$ and its orbit space by any closed subgroup of $G$ are compact metrizable spaces.]
] <lem:collapse>

#proof[
  The inverse image of an open subset of $W$ is open in $S^d$. A basic neighborhood of $oo$ is $W^(+) \\ K$, where $K subset W$ is compact; its inverse image is the open set $S^d \\ K$. This proves continuity of $c$ for an arbitrary open $W$.
  For compact $K subset W$, its saturation $G K$ is compact, being the image of $G times K$. Every $g in G$ maps $W^(+) \\ G K$ into $W^(+) \\ K$. This gives joint continuity at all $\( g \, oo \)$, while continuity on $G times W$ was already established.
  The space $W$ is locally compact, noncompact, and second countable; its one-point compactification is compact metrizable. If $d_0$ is a compatible metric on $W^(+)$, then
  $ d_1 \( x \, y \) = max_(g in G) d_0 \( g x \, g y \) $
  is a compatible invariant metric, by uniform continuity on the compact space $G times W^(+)$. For a closed subgroup $H subset G$, the metric
  $ d_H \( H x \, H y \) = min_(h in H) d_1 \( x \, h y \) $
  induces the quotient topology. Its positivity on distinct orbits follows from compactness, and the triangle inequality follows from invariance. This proves the last assertion. ◻
]

#thm([Lemma 5.3.])[
  (An averaged degree-one test).  #emph[After replacing $G$ by an open subgroup and identifying that subgroup with $bb(Z)_p$, set 
$ q : W^(+) arrow.r Y = W^(+) \/ G \, #h(2em) y_oo = q \( oo \) . $

 There is a continuous map $a : Y arrow.r S^d$ such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ deg \( a q c \) = 1 . $ <top:degree-one>]

 Moreover, $a q$ is homotopic on $W^(+)$ to a degree-one pinch supported in a round ball compactly contained in $W$.]
] <lem:averaged-test>

#proof[
  Fix $xi in S^d$ and a map $P : bb(R)^d arrow.r S^d$ which is constant with value $xi$ outside the unit ball and induces an orientation-preserving homeomorphism $overline(B)^d \/ partial B^d arrow.r S^d$. Choose $z in W$ and $r > 0$ with $overline(B) \( z \, r \) subset W$. The map
  $ P_(z \, r) \( w \) = P \( \( w - z \) \/ r \) \, #h(2em) P_(z \, r) \( oo \) = xi \, $
  is continuous on $W^(+)$ and $P_(z \, r) c$ has degree one.
  Regard $S^d$ as the unit sphere in $bb(R)^(d + 1)$. By continuity and compactness, a sufficiently small open subgroup $H subset G$ satisfies
  $ sup_(h in H \, thin w in W^(+)) parallel P_(z \, r) \( h w \) - P_(z \, r) \( w \) parallel < 1 / 2 . $
  Let $mu_H$ be Haar probability measure and put
  $ A \( w \) = integral_H P_(z \, r) \( h w \) thin d mu_H \( h \) . $
  This is a continuous $H$-invariant $bb(R)^(d + 1)$-valued map and $parallel A \( w \) - P_(z \, r) \( w \) parallel < 1 \/ 2$. Thus every vector $\( 1 - t \) P_(z \, r) \( w \) + t A \( w \)$ has norm at least $1 \/ 2$. Normalizing these vectors gives a homotopy from $P_(z \, r)$ to the invariant map $A \/ parallel A parallel$. The homotopy fixes $oo$ and is constant with value $xi$ outside the compact subset $H overline(B) \( z \, r \)$ of $W$. Replace $G$ by $H$. The normalized map descends to $a : Y arrow.r S^d$, and the homotopy proves (5.1). Faithfulness and orientation preservation persist under this replacement. ◻
]

We henceforth fix $G \, q \, Y \, a$ as in 30.

=== 5.2 Rational orbit cohomology and maps to an odd sphere <rational-orbit-cohomology-and-maps-to-an-odd-sphere>

To move the test, we first detect rational cohomology on the orbit space by pulling it back to the compactification. Rational cohomology of compact metrizable spaces below means Čech cohomology, computed from finite open-cover nerves. We use its natural agreement with cohomology of the constant sheaf; see #cite(label("BergfalkLupiniPanagiotopoulos2024")) §1.6 and §2. The sheaf Čech comparison is an isomorphism on compact Hausdorff spaces and commutes with pullback #cite(label("StacksCechComparison")) Lemmas 20.16.2 and 20.15.1. To relate it to nerve cochains, shrink a finite cover so that the closure of each member lies in its original member. On each compact intersection of these closures, any locally constant cochain value has finite image and a positive constancy scale. For finitely many cochains, a sufficiently fine common finite refinement therefore makes every pulled-back value constant on each new intersection. Applying this to cocycles and to their primitives identifies the two direct limits. The inclusions of constant cochains into locally constant cochains commute with refinement and pullback, so the identification is natural. No covering-dimension bound is used.

#thm([Lemma 5.4.])[
  (Rational orbit pullback).  #emph[Let $E$ be a compact metrizable space with a continuous $G$-action, and let $r : E arrow.r E \/ G$ be its orbit map. For any field $k$, in the bounded-below derived category of sheaves one has 
$ R r_(*) underline(k)_E tilde.eq r_(*) underline(k)_E . $

 For $k = bb(Q)$ the unit $underline(bb(Q))_(E \/ G) arrow.r r_(*) underline(bb(Q))_E$ has a natural sheaf retraction. Consequently 
$ r^(*) : caron(H)^j \( E \/ G \; bb(Q) \) arrow.r caron(H)^j \( E \; bb(Q) \) $

 is injective for every $j$.]
] <lem:orbit-injectivity>

#proof[
  Every orbit is homeomorphic to $G \/ G_x$ for a closed subgroup $G_x$. Such a quotient is a compact zero-dimensional space: for $bb(Z)_p$ it is either a point, a finite quotient, or $bb(Z)_p$ itself. On a compact zero-dimensional space, global sections of sheaves of vector spaces form an exact functor. Indeed, local lifts through a sheaf epimorphism can be chosen on a finite cover and then glued over a finite disjoint clopen refinement. Thus the higher cohomology of each orbit vanishes.
  The map $r$ is closed and separated and has compact fibers. Bounded-below proper base change #cite(label("StacksProperBaseChange")) Lemma 20.18.1 and Theorem 20.18.2 therefore gives
  $ \( R^j r_(*) underline(k)_E \)_y = H^j \( r^(- 1) \( y \) \; underline(k)_(r^(- 1) \( y \)) \) = 0 quad \( j > 0 \) . $
  This use of proper base change imposes no covering-dimension bound on $E$ or $E \/ G$.
  For an open $U subset E \/ G$ and a locally constant function $phi : r^(- 1) \( U \) arrow.r bb(Q)$, define
  #[#set math.equation(numbering: n => "(5.2)")
   $ cal(A)_U \( phi \) \( r \( x \) \) = integral_G phi \( g x \) thin d mu_G \( g \) . $ <top:rational-average>]
  The expression is independent of the representative $x$. For fixed $x$, the locally constant function $g mapsto phi \( g x \)$ on $G$ factors through some finite quotient $G \/ p^ell G$, so its average is rational.
  It is also locally constant as a function of $x$. For every $g in G$, continuity gives a product neighborhood of $\( g \, x \)$ on which $phi \( h x' \)$ is constant. A finite collection of the group neighborhoods covers $G$. Intersecting the corresponding neighborhoods of $x$ shows that $phi \( h x' \) = phi \( h x \)$ for all $h in G$ and all $x'$ in one neighborhood of $x$. Their averages are equal there. An invariant locally constant function descends to a locally constant function on the orbit space, because $r$ is an open quotient map. The operators (5.2) commute with restriction and fix functions pulled back from $U$. They give the asserted sheaf retraction. Applying derived global sections, and using $R r_(*) underline(bb(Q))_E = r_(*) underline(bb(Q))_E$, makes the usual cohomology pullback split injective. The natural Čech–sheaf comparison gives the stated conclusion. ◻
]

Let $gamma_d in caron(H)^d \( S^d \; bb(Q) \)$ denote the rational orientation class for our chosen sphere orientation. On an odd sphere, rational triviality can be strengthened to nullhomotopy after a positive-degree postcomposition. The next proof passes through a finite nerve, so it applies to a compact metrizable domain of arbitrary dimension. The finite-cover construction is classical Čech theory #cite(label("EilenbergSteenrod1952")) Chapter IX; see also #cite(label("BergfalkLupiniPanagiotopoulos2024")) §2 and §4.3. We construct the sphere-valued approximation explicitly.

#thm([Lemma 5.5.])[
  (Killing a rationally trivial sphere map).  #emph[Let $d gt.eq 3$ be odd. If $K$ is compact metrizable and $v : K arrow.r S^d$ satisfies $v^(*) gamma_d = 0$, then there is a positive integer $s$ and a degree $s$ map $D_s : S^d arrow.r S^d$ for which $D_s v$ is nullhomotopic.]
] <lem:odd-sphere-null>

#proof[
  The case $K = diameter$ is immediate. Choose a finite open cover $cal(U) = { U_i }$ of $K$ on each of whose members $v$ has image of Euclidean diameter less than $1 \/ 4$, and choose $x_i in U_i$. For every simplex $sigma$ of the nerve $N cal(U)$, choose a point in the corresponding intersection. All the vectors $v \( x_i \)$ for vertices of $sigma$ are within $1 \/ 4$ of its image. Their convex combinations are therefore nonzero. The formula
  $ b (sum_i t_i i) = frac(sum_i t_i v \( x_i \), parallel sum_i t_i v \( x_i \) parallel) $
  defines a continuous map $b : \| N cal(U) \| arrow.r S^d$. A subordinate partition of unity defines a nerve map $p_(cal(U)) : K arrow.r \| N cal(U) \|$. Normalized interpolation between $v \( x \)$ and the corresponding convex combination gives $v tilde.eq b p_(cal(U))$.
  For finite covers of a compact space, Čech cohomology is the direct limit of the cohomologies of their nerves. The map to the limit from $H^d \( \| N cal(U) \| \; bb(Q) \)$ is the pullback by $p_(cal(U))$; this follows from the vertex-star cover and is independent of the subordinate partition. Since the image of $b^(*) gamma_d$ is zero, some finite refinement $cal(V)$ and its simplicial refinement map $rho : \| N cal(V) \| arrow.r \| N cal(U) \|$ satisfy
  $ \( b rho \)^(*) gamma_d = 0 quad upright("in ") H^d \( \| N cal(V) \| \; bb(Q) \) . $
  Moreover $p_(cal(U)) tilde.eq rho p_(cal(V))$: at each point, the vertices appearing in both barycentric expressions belong to cover members containing that point, so linear interpolation stays in one simplex of $N cal(U)$. We have reduced the assertion to the map $b rho : P arrow.r S^d$ from the finite complex $P = \| N cal(V) \|$.
  We now use that $d$ is odd and $d gt.eq 3$. Using based cellular degree maps, consider the mapping telescope
  #[#set math.equation(numbering: n => "(5.3)")
   $ cal(S) = "Tel" #scale(x: 120%, y: 120%)[\(] S^d arrow.r^(D_2) S^d arrow.r^(D_3) S^d arrow.r^(D_4) dots.h.c #scale(x: 120%, y: 120%)[\)] . $ <top:odd-telescope>]
  We verify its homotopy type directly. Serre’s finiteness theorem gives finite $pi_j \( S^d \)$ for $j > d$ #cite(label("Serre1951")) Chapter V, §3, Proposition 3. We also use his precise degree-map assertion, valid in every homotopy degree of an odd sphere: if $q x = 0$ in a homotopy group, then postcomposition with a degree-$2 q$ map kills $x$ #cite(label("Serre1953")) Chapter V, §1, Corollary 2 to Proposition 1. The telescope has CW type, and its homotopy groups are the direct limits of those of its spheres: maps and homotopies from spheres have bounded height, and each finite subtelescope retracts onto its final sphere. Any element of $pi_j \( S^d \)$, $j > d$, has some finite order $q$. A sufficiently long subsequent product of the degrees $2 \, 3 \, 4 \, dots.h$ is divisible by $2 q$; its sphere map is homotopic to a composite through a degree-$2 q$ map, and therefore kills that element. Thus all these higher direct limits vanish. In degree $d$ the direct limit is $"colim" \( bb(Z) arrow.r^2 bb(Z) arrow.r^3 bb(Z) arrow.r dots.h.c \) = bb(Q)$, and in degrees below $d$ it is zero. Hence $cal(S)$ has type $K \( bb(Q) \, d \)$. The same odd-sphere telescope and finite-stage argument are used in #cite(label("DranishnikovFerryWeinberger2003")) proof of Proposition 4.5, p. 928.
  Let $j : S^d arrow.r cal(S)$ include the first sphere. Choose $gamma_(cal(S)) in H^d \( cal(S) \; bb(Q) \)$ with $j^(*) gamma_(cal(S)) = gamma_d$. Indeed, $j_(*)$ in degree-$d$ homology is the inclusion $bb(Z) arrow.r.hook bb(Q)$, and universal coefficients identify this restriction map with the isomorphism $"Hom" \( bb(Q) \, bb(Q) \) arrow.r "Hom" \( bb(Z) \, bb(Q) \)$. Then $\( j b rho \)^(*) gamma_(cal(S)) = \( b rho \)^(*) gamma_d = 0$. Ordinary Eilenberg–MacLane representability on the finite complex $P$ makes $j b rho$ nullhomotopic. A nullhomotopy has compact image. The continuous height function on the telescope is therefore bounded on that image, so the image lies in a finite subtelescope. Retracting this subtelescope onto its last sphere gives a nullhomotopy of $D_s b rho$, where $D_s$ is the composite of finitely many of the displayed degree maps and $s > 0$ is their product. Composing with $p_(cal(V))$ and using $v tilde.eq b rho p_(cal(V))$ proves the assertion. ◻
]

=== 5.3 Concentrating the test on finite quotient sheets <concentrating-the-test-on-finite-quotient-sheets>

Faithfulness supplies a region with finite quotient sheets for every quotient order, even when the original action has fixed points or nontrivial stabilizers. The degree-one test $a$ remains fixed while these regions vary.

#thm([Lemma 5.6.])[
  (Finite quotient sheets).  #emph[For every integer $k gt.eq 1$, put $m = p^k$ and $zeta = exp \( 2 pi i \/ m \)$. There exists a nonempty open $V subset Y \\ { y_oo }$ such that the finite quotient map 
$ W \/ \( p^k G \) arrow.r W \/ G = Y \\ { y_oo } $

 over $V$ is a disjoint union of $m$ homeomorphisms onto $V$. There is a locally constant function 
$ beta : q^(- 1) \( V \) arrow.r { 1 \, zeta \, dots.h \, zeta^(m - 1) } subset S^1 $

 satisfying 
#[#set math.equation(numbering: n => "(5.4)")
 $ beta \( g w \) = zeta^(macron(g)) beta \( w \) \, #h(2em) macron(g) in G \/ p^k G = bb(Z) \/ m . $ <top:sheet-multiplier>]

]
] <lem:finite-sheets>

#proof[
  Some $x in W$ has stabilizer $G_x subset p^k G$. Otherwise, the classification of closed subgroups of $bb(Z)_p$ would imply $p^(k - 1) G subset G_x$ for every $x in W$, contradicting faithfulness. Set $H = p^k G$, $Z = W \/ H$, and let $z$ be the image of $x$. This is a Hausdorff orbit space, and the stabilizer of $z$ for the finite action of $G \/ H$ is $\( G_x + H \) \/ H = 0$. Write $tau$ for the element induced by $1 in G$.
  Choose pairwise disjoint open neighborhoods $U_j$ of $tau^j z$, $0 lt.eq j < m$, and put $N = ⋂_(j = 0)^(m - 1) tau^(- j) U_j$. Then the translates $tau^j N$ are pairwise disjoint. If $r : Z arrow.r W \/ G$ is the finite quotient map and $V = r \( N \)$, openness of $r$ shows that $V$ is nonempty and open, and
  $ r^(- 1) \( V \) = product.co_(j = 0)^(m - 1) tau^j N . $
  Each restriction $r : tau^j N arrow.r V$ is an open continuous bijection, hence a homeomorphism. Pulling these sheets back under $W arrow.r Z$ partitions $q^(- 1) \( V \)$ into relatively clopen subsets. Give the pullback of $tau^j N$ the constant value $zeta^j$. The resulting function $beta$ is locally constant, and the cyclic permutation of the sheets proves (5.4). ◻
]

To concentrate a positive-degree postcomposition of $a$ in such a region, we will extend a nullhomotopy from its closed complement. The following construction provides the required extension.

#thm([Lemma 5.7.])[
  (Extending a homotopy from a closed subset).  #emph[Let $Y_0$ be compact metrizable, $F_0 subset Y_0$ closed, and $f : Y_0 arrow.r S^d$ continuous. Every homotopy $H : F_0 times \[ 0 \, 1 \] arrow.r S^d$ starting at $f \|_(F_0)$ is the restriction of a homotopy on $Y_0$ starting at $f$.]
] <top:neighborhood-extension>

#proof[
  Put $I = \[ 0 \, 1 \]$. Paste $H$ with $f$ on the closed subset
  $ C = \( F_0 times I \) union \( Y_0 times { 0 } \) subset Y_0 times I . $
  Viewing the resulting map as $bb(R)^(d + 1)$-valued, extend each of its $d + 1$ coordinates by the Tietze extension theorem to obtain $E : Y_0 times I arrow.r bb(R)^(d + 1)$. The open set $N = { parallel E parallel > 1 \/ 2 }$ contains $C$, and $E \/ parallel E parallel$ extends the pasted sphere map to $N$. Compactness of $I$ gives an open $U supset F_0$ with $U times I subset N$; explicitly, take the complement of the projection of the compact set $\( Y_0 times I \) \\ N$. Choose a continuous $lambda : Y_0 arrow.r \[ 0 \, 1 \]$ equal to one on $F_0$ and zero on $Y_0 \\ U$. Then
  $ tilde(H) \( y \, t \) = frac(E \( y \, t lambda \( y \) \), parallel E \( y \, t lambda \( y \) \) parallel) $
  is defined everywhere: if $y in U$ its argument lies in $U times I$, and otherwise its argument is $\( y \, 0 \) in C$. It is continuous, starts at $f$, and agrees with $H$ on $F_0 times I$. ◻
]

We can now concentrate a positive-degree postcomposition of the fixed test $a$ into any prescribed nonempty open region. The degree $s$ below may depend on that region; for a region supplied by 33, this allows dependence on $k$.

#thm([Proposition 5.8.])[
  (Moving a test into a prescribed open set).  #emph[For every nonempty open $V subset Y \\ { y_oo }$, set $F = Y \\ V$. There are a positive integer $s$, a degree $s$ map $D_s : S^d arrow.r S^d$, and a map $h : Y arrow.r S^d$ such that 
$ h tilde.eq D_s a \, #h(2em) h \|_F equiv b $

 for some $b in S^d$. In particular $h \( y_oo \) = b$ and $q^(- 1) h^(- 1) \( S^d \\ { b } \) subset q^(- 1) \( V \) subset W$.]
] <prop:move-test>

#proof[
  We first show $\( a \|_F \)^(*) gamma_d = 0$. Choose a round ball with closure in the nonempty open set $q^(- 1) \( V \) subset W$. The pinch in 30 can be moved to this ball by a homotopy on $W^(+)$. Here is explicit control of that homotopy. Connect the two centers by a path in connected open $W$, which is path connected. Its compact image has positive distance from $bb(R)^d \\ W$. Choose a sufficiently small fixed radius for transport along the path; at the two ends shrink and enlarge radially as needed. Applying the formula $P_(z \( t \) \, r \( t \))$ from 30 gives a continuous family of pinches. All radii are positive and all closed balls lie in one compact subset of $W$. Consequently the family is also continuous at $oo$, where it has constant value $xi$.
  It follows that $a q$ is homotopic to a map constant on $q^(- 1) \( F \)$. Thus the pullback of $\( a \|_F \)^(*) gamma_d$ to $q^(- 1) \( F \)$ is zero. This preimage is a closed invariant compact subset of $W^(+)$, and its orbit space is $F$. The restricted orbit map $q^(- 1) \( F \) arrow.r F$ therefore meets the hypotheses of 31, so $\( a \|_F \)^(*) gamma_d = 0$. By 32, some $D_s a \|_F$ is nullhomotopic. Apply 34 to this nullhomotopy and $f = D_s a$ on $Y$. Its endpoint is the required $h$. Finally, $y_oo in F$, and every point of $F$ maps to $b$, which gives the asserted preimage inclusion. ◻
]

#prodef([Remark 5.9.])[
  (The source of a restricted test).  Let $t : Y arrow.r X$ be continuous with $X$ a compact Hausdorff test space, and write
  $ f = t q c : S^d arrow.r X \, #h(2em) b = t \( y_oo \) \, $
  as in 1. The source over $X \\ { b }$ is precisely $q^(- 1) t^(- 1) \( X \\ { b } \) subset W$, with its given orientation and $G$-action. The restriction of $f$ to this source is proper, since it is the base change of the proper map $f$ to an open subset of $X$. Thus its oriented direct-image pairing is the restriction of the pairing pushed from $S^d$. These are the manifold sources used for duality in the next section; $Y$ enters through ordinary sheaf direct image. In 35, this source lies over the finite quotient sheets of 33 when $V$ is chosen there. The positive degree $s$ may depend on $V$ and $k$.
] <top:proper-test-interface>

== 6 Character classes and the contradiction <sec:characters>

Fix $n gt.eq 1$ and an odd integer $d > n$ with $d gt.eq 3$, as in 5. We use its data

$ W = O times bb(R)^(d - n) subset bb(R)^d \, #h(2em) c : S^d arrow.r W^(+) \, #h(2em) q : W^(+) arrow.r Y = W^(+) \/ G \, #h(2em) a : Y arrow.r S^d $

where $O subset bb(R)^n$ is connected and open, $G = bb(Z)_p$ acts faithfully and preserves orientation on $W$, and $deg \( a q c \) = 1$. Put $y_oo = q \( oo \)$. The orientation of $S^d$ is the one used for $u_d$ in 25. All sheaves and pairings below are over $bb(R)$; the notation $bb(C)$ denotes the real coefficient plane with its additional complex scalar operations. We will associate integral classes to finite partitions of the character set, show that they are natural under maps and homotopies of tests, and use the finite quotient sheets to equate their rational images. The final step compares those images with the fixed lattice from 25.

=== 6.1 Characters and proper direct images <characters-and-proper-direct-images>

Let $Lambda = union.big_(j gt.eq 0) mu_(p^j) subset S^1$ be the countable group of complex roots of unity of $p$-power order. Define the orbit sheaf $cal(H) = q_(*) underline(bb(C))_(W^(+))$. On this sheaf let $T$ denote the action of $1 in G$, with the convention $\( T s \) \( x \) = s \( \( - 1 \) x \)$, and write $M_lambda$ for multiplication by $lambda in bb(C)$. Define

$ cal(H)_lambda = ker \( T - M_lambda \) \, #h(2em) cal(H)_D = xor.big_(lambda in D) cal(H)_lambda quad \( D subset Lambda \) . $

#thm([Lemma 6.1.])[
  (Character coproducts).  #emph[There are canonical isomorphisms 
#[#set math.equation(numbering: n => "(6.1)")
 $ R q_(*) underline(bb(C))_(W^(+)) tilde.eq cal(H) tilde.eq xor.big_(lambda in Lambda) cal(H)_lambda . $ <char:orbit-sum>]

 For every continuous map $t : Y arrow.r X$ to a compact Hausdorff space and every $D subset Lambda$, the natural map 
#[#set math.equation(numbering: n => "(6.2)")
 $ xor.big_(lambda in D) R t_(*) cal(H)_lambda arrow.r R t_(*) cal(H)_D $ <char:derived-sum>]

 is an isomorphism in the bounded-below derived category of real sheaves on $X$. The sum on the left is a coproduct in the ambient derived category.]
] <lem:character-coproduct>

#proof[
  Apply 31 to the compact metrizable $G$-space $W^(+)$ with $k = bb(R)$. The coefficient sheaf $underline(bb(C))_(W^(+))$ is the direct sum of two real constant sheaves, so additivity gives the first isomorphism in (6.1). This argument imposes no dimension bound on $Y$.
  The stalk of $cal(H)$ at an orbit is the complex vector space of locally constant functions on $G \/ H$. The pullback of any such function to $G$ factors through $G \/ p^j G$ for some $j$: a finite clopen partition on which the function is constant admits a refinement by cosets of a common open subgroup. The representation is consequently the union of finite cyclic representations. Each of the latter decomposes into the eigenspaces of $T$, since $z^(p^j) - 1$ has distinct complex roots. Kernels and sheaf direct sums can be checked on stalks, proving the second isomorphism in (6.1). This asserts an algebraic sheaf direct sum; a section over a noncompact open set need not have globally finite character support.
  We record explicitly the compactness argument needed for (6.2). If $K$ is compact Hausdorff and $\( cal(F)_lambda \)$ is a family of sheaves, every section of $xor.big_lambda cal(F)_lambda$ on $K$ involves only finitely many indices. Indeed it has this property locally by the definition of sheafification, and a finite subcover makes the set of indices finite on $K$. Thus global sections commute with direct sums. The same argument on every closed subset of $K$ shows that direct sums of soft sheaves are soft: extend the finitely many component sections separately. Soft resolutions and their acyclicity on compact Hausdorff spaces therefore give
  #[#set math.equation(numbering: n => "(6.3)")
   $ H^r #h(-0.16667em) (K \, xor.big_lambda cal(F)_lambda) tilde.eq xor.big_lambda H^r \( K \, cal(F)_lambda \) #h(2em) \( r gt.eq 0 \) . $ <char:compact-cohomology>]
  The soft-resolution facts used here are the compact case of #cite(label("SchapiraNotes")) Propositions 11.2.4, 11.2.5, and 11.2.8.
  Apply (6.3) to $K = t^(- 1) \( x \)$ and the restrictions of the eigensheaves. Proper base change identifies the stalk cohomology of (6.2) with these isomorphisms. All the derived images have the common lower bound zero, so their sum remains bounded below. Finally, countable sheaf sums are exact, and termwise sums compute coproducts in the derived category by #cite(label("StacksDerivedSums")) Lemma 13.33.5. This proves both assertions. ◻
]

For the rest of the construction, a #emph[compact test] means a compact test space $X$ as in 3. We consider a continuous map $t : Y arrow.r X$ for which

$ b_t = t \( y_oo \) $

has a basis of contractible open neighborhoods in $X$. Write

#[#set math.equation(numbering: n => "(6.4)")
 $ f_t = t q c : S^d arrow.r X \, #h(2em) A_t = R f_(t *) underline(bb(C))_(S^d) \, #h(2em) alpha_t : A_t arrow.r^tilde.op cal(D)_(X \, d) A_t . $ <char:test-form>]

Here $alpha_t$ is the pushforward of the sphere orientation pairing with coefficient form

$ B \( z \, w \) = "Re" \( z overline(w) \) . $

The object $A_t$ belongs to $cal(T) \( X \)$, being two copies of a compact polyhedron generator; its form is supplied by Proposition 2.3, Proposition 2.5.

Set $X_t^compose = X \\ { b_t }$. The preimage $f_t^(- 1) \( X_t^compose \)$ lies in $W$, since $c$ sends $S^d \\ W$ to $oo$. It is precisely $\( t q \)^(- 1) \( X_t^compose \)$ under the identity map on $W$. The restricted map to $X_t^compose$ is proper: it is the base change over an open set of the proper map $f_t$. Composition and open base change give a canonical identification

#[#set math.equation(numbering: n => "(6.5)")
 $ A_t \|_(X_t^compose) tilde.eq \( R t_(*) cal(H) \) \|_(X_t^compose) . $ <char:open-identification>]

The pairing on this open set is the direct image of the orientation pairing on the actual oriented manifold $f_t^(- 1) \( X_t^compose \) subset W$. Thus duality is used on the manifold and on the test space; no duality on $Y$ or $W^(+)$ enters this identification.

For $D subset Lambda$ put $B_D = \( R t_(*) cal(H)_D \) \|_(X_t^compose)$. Every $B_D$ is a retract of $A_t \|_(X_t^compose)$ by (6.1) and the complementary subsum. Consequently it is bounded with the same cohomological amplitude bounds as $A_t \|_(X_t^compose)$. These statements concern the ambient derived category on $X_t^compose$; membership of $B_D$ in a test subcategory on that open set is unnecessary. Their Verdier duals are bounded as well, since they are retracts of $cal(D)_(X_t^compose) \( A_t \|_(X_t^compose) \)$. The inclusions of bounded and bounded-below derived categories into the ambient derived category are fully faithful #cite(label("StacksDerivedCategories")) Definition 13.11.3 and Lemma 13.11.6. Thus the coproduct property in that ambient category detects the morphisms between bounded objects used below.

#thm([Lemma 6.2.])[
  (Real orthogonality).  #emph[If $D \, E subset Lambda$ are disjoint, the cross pairing between $B_D$ and $B_E$ induced by $alpha_t \|_(X_t^compose)$ is zero. In particular, the projectors associated with any finite partition of $Lambda$ are self-adjoint.]
] <lem:orthogonality>

#proof[
  Write $A = A_t \|_(X_t^compose)$ and $alpha = alpha_t \|_(X_t^compose)$, and let $R^dagger = alpha^(- 1) cal(D)_(X_t^compose \, d) \( R \) alpha$ denote the adjoint of an endomorphism of $A$. The orientation-preserving action of $G$ on the proper manifold map above acts by isometries of $alpha$, by naturality of orientation and proper duality. Complex scalar multiplication by a unit also preserves $B$. In particular, if $J = M_(upright(i))$, then
  $ J^dagger = - J \, #h(2em) M_lambda = \( "Re" lambda \) upright("id") + \( "Im" lambda \) J \, #h(2em) T^dagger = T^(- 1) \, #h(2em) M_lambda^dagger = M_(lambda^(- 1)) quad \( lambda in Lambda \) . $
  Fix $lambda in.not E$. On $B_({ lambda })$ the endomorphism $T - M_lambda$ is zero. Let $R_E$ denote the endomorphism of $B_E$ induced by $T^(- 1) - M_(lambda^(- 1))$ on $cal(H)_E$. The latter operator is invertible: on the $mu$-summand its inverse is multiplication by $\( mu^(- 1) - lambda^(- 1) \)^(- 1)$. These componentwise inverses define one endomorphism of the algebraic sheaf direct sum, and hence induce an inverse $R_E^(- 1)$ on $B_E$ after $R t_(*)$ and restriction. For the two inclusions $i_lambda : B_({ lambda }) arrow.r A$ and $i_E : B_E arrow.r A$, adjointness yields
  $ 0 & = cal(D)_(X_t^compose \, d) \( i_E \) alpha \( T - M_lambda \) i_lambda\
 & = cal(D)_(X_t^compose \, d) \( R_E \) thin cal(D)_(X_t^compose \, d) \( i_E \) alpha i_lambda . $
  The first factor in the last line is invertible, so the cross pairing from $B_({ lambda })$ to $cal(D)_(X_t^compose \, d) B_E$ vanishes. This applies also when $mu = overline(lambda) eq.not lambda$: the common complex scalar operators distinguish these two real subrepresentations.
  By 37 and exact open restriction, $B_D$ is the derived coproduct of the $B_({ lambda })$, $lambda in D$. A morphism out of a coproduct is determined by its composites with the coprojections. The cross pairing from $B_D$ therefore vanishes. Symmetry gives the cross pairing in the opposite order. In a finite decomposition these equalities say precisely that every projector is self-adjoint. ◻
]

=== 6.2 Integral classes without splitting quotient idempotents <integral-classes-without-splitting-quotient-idempotents>

The projectors constructed above live on the punctured target. We now use their germs to construct integral classes on the whole target.

Fix a finite partition $Lambda = D_0 union.sq dots.h.c union.sq D_(m - 1)$. Choose a contractible open neighborhood $U$ of $b_t$, and set

$ cal(Q)_U \( X \) = cal(T) \( X \) \/ cal(T) \( U \) . $

The open projectors above define endomorphisms $e_i$ of the image of $A_t$ in $cal(Q)_U \( X \)$ by 14, since $X_t^compose$ contains $X \\ U$. In this quotient they satisfy

#[#set math.equation(numbering: n => "(6.6)")
 $ e_i e_j = delta_(i j) e_i \, #h(2em) sum_(i = 0)^(m - 1) e_i = upright("id") \, #h(2em) e_i^dagger = e_i . $ <char:projector-identities>]

Only endomorphisms of the existing object $A_t$ are asserted here.

#prodef([Definition 6.3.])[
  (Character classes).  Let
  $ ell_U : E_d \( X \) arrow.r^tilde.op W_d \( cal(Q)_U \( X \) \) $
  be the integral isomorphism of 27. For $0 lt.eq i < m$ define $z_i \( t \) in E_d \( X \)$ uniquely by
  #[#set math.equation(numbering: n => "(6.7)")
   $ ell_U \( z_i \( t \) \) = \[ A_t \, alpha_t \] + \[ A_t \, alpha_t compose \( 2 e_i - upright("id") \) \] . $ <char:class-definition>]
] <def:character-classes>

This is a class in the ordinary quotient Witt group: the second form is nonsingular and symmetric because $2 e_i - upright("id")$ is a self-adjoint involution. If $e_i$ is represented by an orthogonal direct summand, the involution is $+ upright("id")$ on that summand and $- upright("id")$ on its complement. The sum in (6.7) then cancels the complementary form and doubles the selected form. An image object for $e_i$ is not part of the definition. The definition is independent of $U$. Indeed, for two choices $U_1 \, U_2$ choose a contractible neighborhood $U_0 subset U_1 ∩ U_2$ of $b_t$. The quotient functors $cal(Q)_(U_0) \( X \) arrow.r cal(Q)_(U_j) \( X \)$ carry the projectors to each other by their germ descriptions, and commute with localization from $E_d \( X \)$. Since both $ell_(U_j)$ are injective, the lifts defined using $U_0 \, U_1 \, U_2$ coincide.

#thm([Proposition 6.4.])[
  (Sum of the character classes).  #emph[Let $t : Y arrow.r X$ be a compact test map as in (6.4), with a contractible open neighborhood basis at $b_t$. For every finite partition $Lambda = D_0 union.sq dots.h.c union.sq D_(m - 1)$, its character classes satisfy the integral identity 
#[#set math.equation(numbering: n => "(6.8)")
 $ sum_(i = 0)^(m - 1) z_i \( t \) = 2 \[ A_t \, alpha_t \] quad upright("in ") E_d \( X \) . $ <char:class-sum>]

]
] <prop:sum-classes>

#proof[
  We work in $cal(Q)_U \( X \)$ and abbreviate $\( A_t \, alpha_t \)$ to $\( A \, alpha \)$. On $A^(xor m)$ let
  $ Q = "diag" \( 2 e_0 - upright("id") \, dots.h \, 2 e_(m - 1) - upright("id") \) \, #h(2em) Q_0 = "diag" \( upright("id") \, - upright("id") \, dots.h \, - upright("id") \) . $
  Let $P_j$ be the permutation matrix interchanging the zeroth and $j$th copies, with $P_0 = upright("id")$, and let $E_j$ be the diagonal matrix having $e_j$ in every diagonal entry. Define
  $ S = sum_(j = 0)^(m - 1) E_j P_j . $
  All the $E_j$ commute with the permutation matrices. Using only (6.6), we have $S^2 = upright("id")$ and $S^dagger = S$, where the adjoint is for $alpha^(xor m)$. Moreover,
  $ S^dagger Q_0 S = sum_(j = 0)^(m - 1) E_j P_j Q_0 P_j = Q . $
  For the last identity, its $i$th diagonal entry is $e_i - sum_(j eq.not i) e_j = 2 e_i - upright("id")$ and all off-diagonal entries are zero. Thus $S$ is an isometry from the sum of the twisted forms to $\( A \, alpha \) perp \( A \, - alpha \)^(perp \( m - 1 \))$. The sum of their Witt classes is $\( 2 - m \) \[ A \, alpha \]$. Adding the $m$ untwisted terms in (6.7) gives $2 \[ A \, alpha \]$. The injectivity of $ell_U$ proves (6.8). ◻
]

=== 6.3 Covariance and homotopy <covariance-and-homotopy>

#thm([Proposition 6.5.])[
  (Covariance on compact tests).  #emph[Let $t : Y arrow.r X$ be a compact test map as in (6.4), and let $g : X arrow.r X'$ be a continuous map of compact tests. Suppose $X$ has a contractible neighborhood basis at $b_t$ and $X'$ has one at $b_(g t) = g \( b_t \)$. For every fixed finite partition of $Lambda$, 
#[#set math.equation(numbering: n => "(6.9)")
 $ g_(*) z_i \( t \) = z_i \( g t \) quad upright("in ") E_d \( X' \) . $ <char:covariance>]

]
] <prop:class-covariance>

#proof[
  Choose a contractible open $U' in.rev g \( b_t \)$, and then a contractible open $U in.rev b_t$ with $U subset g^(- 1) \( U' \)$. Pushforward takes an object supported in a compact subset of $U$ to one supported in a compact subset of $U'$. Consequently Proposition 2.5, Theorem 3.4 give a duality-preserving quotient functor
  $ overline(g)_(*) : cal(Q)_U \( X \) arrow.r cal(Q)_(U') \( X' \) $
  and a commuting square on Witt groups with the maps $ell_U \, ell_(U')$. Composition of proper direct images identifies the pushed total form with $\( A_(g t) \, alpha_(g t) \)$.
  We check the endomorphisms in this identification. Represent a projector $e_i$ by a quotient roof. Its restriction agrees with the character projector on some open neighborhood $N$ of $X \\ U$. Shrinking $N$ if necessary, arrange $N subset X \\ { b_t }$ and that the denominator of the roof is invertible there. Define
  #[#set math.equation(numbering: n => "(6.10)")
   $ N' = X' \\ g \( X \\ N \) . $ <char:covariance-neighborhood>]
  Since $X$ is compact, $g \( X \\ N \)$ is closed. Since $X \\ N subset U$ and $g \( U \) subset U'$, the set $N'$ contains $X' \\ U'$. Also $g^(- 1) \( N' \) subset N$, and $g \( b_t \) in.not N'$. Over $N'$ the pushed roof can therefore be computed entirely where the original projector agrees with its character description.
  Open base change and composition identify that description with the projector on $R \( g t \)_(*) cal(H)$ for $D_i$. Every upstairs preimage in this computation avoids $oo$, so (6.5) identifies it with the projector for $g t$ on $A_(g t)$. The germ theorem gives equality of these endomorphisms in $cal(Q)_(U') \( X' \)$. The quotient functor thus carries the two forms in (6.7) to their counterparts for $g t$. Applying the integral localization isomorphisms proves (6.9). ◻
]

#thm([Proposition 6.6.])[
  (Homotopy of character classes).  #emph[For a fixed partition of $Lambda$, homotopic maps $t_0 \, t_1 : Y arrow.r S^d$ satisfy $z_i \( t_0 \) = z_i \( t_1 \)$ in $E_d \( S^d \)$.]
] <prop:class-homotopy>

#proof[
  The value at $y_oo$ may move during the homotopy. We will combine two sufficiently close stages into a single compact test and recover them by homotopic projections. Consider the compact test
  #[#set math.equation(numbering: n => "(6.11)")
   $ C_d = { \( x_0 \, x_1 \) in S^d times S^d : chevron.l x_0 \, x_1 chevron.r gt.eq 0 } . $ <char:close-pair>]
  It is compact semialgebraic, hence homeomorphic to a finite polyhedron. It has a contractible open neighborhood basis at each point. To check this also at its boundary, the differential of $F \( x_0 \, x_1 \) = chevron.l x_0 \, x_1 chevron.r$ on $S^d times S^d$ is nonzero where $F = 0$: its derivative in the tangent direction $x_0$ at $x_1$ equals $1$. Thus $C_d$ is a smooth $2 d$-manifold with boundary, with local Euclidean or half-space charts; sufficiently small balls in these charts give the required basis. Its test forms have degree $d$, inherited by pushforward from $S^d$; the target dimension is $2 d$.
  The projections $pi_0 \, pi_1 : C_d arrow.r S^d$ are homotopic by
  $ \( x_0 \, x_1 \, r \) mapsto frac(\( 1 - r \) x_0 + r x_1, parallel \( 1 - r \) x_0 + r x_1 parallel) \, #h(2em) 0 lt.eq r lt.eq 1 . $
  The denominator is nonzero, since its square is $\( 1 - r \)^2 + r^2 + 2 r \( 1 - r \) chevron.l x_0 \, x_1 chevron.r gt.eq 1 \/ 2$.
  Let $H : Y times \[ 0 \, 1 \] arrow.r S^d$ be the given homotopy. Uniform continuity on its compact domain gives a finite subdivision $0 = r_0 < dots.h.c < r_N = 1$ such that each pair
  $ t^(\( j \)) = \( H \( - \, r_j \) \, H \( - \, r_(j + 1) \) \) : Y arrow.r C_d $
  lands in $C_d$. Its distinguished value has the neighborhood basis just verified. By Proposition 6.5, Theorem 2.9,
  $ z_i \( H \( - \, r_j \) \) = pi_(0 *) z_i \( t^(\( j \)) \) = pi_(1 *) z_i \( t^(\( j \)) \) = z_i \( H \( - \, r_(j + 1) \) \) . $
  Iteration proves the assertion. ◻
]

=== 6.4 Equal parts and the fixed lattice <equal-parts-and-the-fixed-lattice>

Fix $k gt.eq 1$, put $m = p^k$, and let $zeta = exp \( 2 pi upright(i) \/ m \)$. Choose a transversal $D_0$ for the cosets of $mu_m$ in $Lambda$, and set

#[#set math.equation(numbering: n => "(6.12)")
 $ D_i = zeta^i D_0 #h(2em) \( 0 lt.eq i < m \) . $ <char:cyclic-partition>]

These are disjoint and partition $Lambda$. By 33 there are a nonempty open $V subset Y \\ { y_oo }$ and a locally constant function $beta : q^(- 1) V arrow.r S^1$ satisfying

$ beta \( g x \) = chi \( g \) beta \( x \) \, #h(2em) chi \( 1 \) = zeta \, $

for the character $chi : G arrow.r mu_m$.

#thm([Proposition 6.7.])[
  (Equality for a concentrated test).  #emph[Let $k gt.eq 1$, and let $V$ and its character multiplier $beta$ be as in 33. If $h : Y arrow.r S^d$ is constant on $Y \\ V$, then the classes for (6.12) satisfy 
$ z_0 \( h \) = z_1 \( h \) = dots.h.c = z_(m - 1) \( h \) quad upright("in ") E_d \( S^d \) . $

]
] <prop:equal-parts>

#proof[
  Let $b$ be that constant value. Since $y_oo in.not V$, it equals $b_h$. The source of the restricted test over $S^d \\ { b }$ lies in $q^(- 1) V subset W$. Multiplication by $beta$ on its coefficient sheaf is defined because $beta$ is locally constant, and is a real isometry because $\| beta \| = 1$. With our convention for $T$,
  $ T M_beta = M_(zeta^(- 1)) M_beta T . $
  It therefore takes a $lambda$-eigensheaf to the $zeta^(- 1) lambda$-eigensheaf and cyclically permutes the subsums in (6.12). After the proper restricted manifold pushforward it remains an isometry of $\( A_h \, alpha_h \) \|_(S^d \\ { b })$ and conjugates $e_i$ to $e_(i - 1)$, with indices modulo $m$.
  The isometry and its inverse define quotient morphisms by 14. Its conjugation identity makes the twisted forms for $e_i$ and $e_(i - 1)$ isometric in the quotient. Their untwisted terms agree as well. The integral isomorphism in 27 and 39 now give $z_i \( h \) = z_(i - 1) \( h \)$. ◻
]

#thm([Theorem 6.8.])[
  (Contradiction on the invariant chart).  #emph[For every $n gt.eq 1$ and every prime $p$, an orientation-preserving continuous $bb(Z)_p$-action on a connected open subset of $bb(R)^n$ has nonzero kernel.]
] <thm:contradiction>

#proof[
  Suppose such an action is faithful. Choose an odd integer $d > n$ with $d gt.eq 3$, and form the data at the beginning of this section by Lemma 5.2, Lemma 5.3. The latter may replace $G$ by an open subgroup; its action remains faithful and orientation preserving.
  First fix the lattice. 25 gives a positive power of $2$, denoted by $L_d$, such that
  $ E_d \( S^d \) ⊗ bb(Q) = bb(Q) overline(u)_d \, #h(2em) "im" #scale(x: 120%, y: 120%)[\(] E_d \( S^d \) arrow.r E_d \( S^d \) ⊗ bb(Q) #scale(x: 120%, y: 120%)[\)] subset L_d^(- 1) bb(Z) overline(u)_d . $
  This bound depends only on the chosen sphere comparison. Choose $k$ so large that $m = p^k > 4 L_d$, and then choose $V \, beta$ and the partition (6.12). These choices give integral classes $z_i \( a \) in E_d \( S^d \)$.
  Write $overline(z)_i \( a \) = z_i \( a \) ⊗ 1$ and $overline(u)_d = u_d ⊗ 1$. We now compare these rational images. By 35 there are an integer $s > 0$ and a map $h$, constant on $Y \\ V$, such that $h tilde.eq D_s a$, where $D_s : S^d arrow.r S^d$ has degree $s$. Thus Proposition 6.7, Proposition 6.6, Proposition 6.5 give
  $ D_(s *) z_i \( a \) = z_i \( D_s a \) = z_i \( h \) = z_j \( h \) = D_(s *) z_j \( a \) . $
  On the rational line $bb(Q) overline(u)_d$, the map $D_(s *)$ is multiplication by $s$, by 26. Since $s > 0$, all the $overline(z)_i \( a \)$ are equal. This cancels $s$ only as a nonzero rational scalar: the original classes $z_i \( a \)$ remain integral, and their rational images lie in the same fixed lattice. In particular, the bound $L_d$ is unchanged, regardless of the size or prime divisors of $s$.
  Finally compute their sum. The coefficient form $B$ is the orthogonal sum of two positive real lines. Therefore $\[ A_a \, alpha_a \] = 2 \( a q c \)_(*) u_d$, and the degree-one property of $a q c$ gives $overline(\[ A_a \, alpha_a \]) = 2 overline(u)_d$. By 40,
  $ sum_(i = 0)^(m - 1) overline(z)_i \( a \) = 4 overline(u)_d \, #h(2em) overline(z)_i \( a \) = 4 / m overline(u)_d quad upright("in ") E_d \( S^d \) ⊗ bb(Q) . $
  Each $z_i \( a \)$ is an integral class, so $overline(z)_i \( a \) in L_d^(- 1) bb(Z) overline(u)_d$. The lattice inclusion would force $4 L_d \/ m in bb(Z)$. But $0 < 4 L_d \/ m < 1$. This contradiction applies to every prime, including $p = 2$. ◻
]

#proof[
  Let $M$ have any positive finite dimension $n$, and suppose that its given action were faithful. 28 produces a faithful orientation-preserving action of an open subgroup, itself isomorphic to $bb(Z)_p$, on a connected invariant chart subset $O subset bb(R)^n$. This contradicts 44. Hence the original kernel is nonzero. It is closed, since it is the intersection of the closed stabilizers of the points of $M$. Every nonzero closed subgroup of $bb(Z)_p$ is open: if it contains $x$ of valuation $j$, it contains $overline(x bb(Z)) = p^j bb(Z)_p$, the closure of the integer multiples of $x$. The action therefore factors through a finite quotient. The chart reduction requires none of compactness, global orientability, or triangulability of $M$, and permits all stabilizers, as established in 5. ◻
]

#proof[
  The classical Hilbert–Smith reduction says that a locally compact group which acts faithfully and continuously on a connected manifold and is not a Lie group contains a topologically embedded copy of $bb(Z)_p$ for some prime $p$; see #cite(label("Pardon2013")) Introduction, p. 1. Apply this reduction to the given locally compact Hausdorff second-countable group. Restriction to the embedded subgroup retains joint continuity and faithfulness on the same $n$-manifold, contrary to 2. The group is therefore a Lie group. ◻
]

== 7 Duality shifts and the cylinder signs <app:duality-signs>

This appendix fixes one coherent convention and verifies the signs used in (2.10), Lemma 2.8. It also explains why an overall sign in the cylinder does not alter homotopy invariance. The translated-duality convention is the one in #cite(label("Woolf2008")) §2.1. For exactness sign $+ 1$, the cone identities are those of #cite(label("Woolf2008")) Lemma 2.1; their version for $delta in { 1 \, - 1 }$ is proved in 8. The calculations below apply to complexes of sheaves by using resolutions for internal Hom. They involve only the signs of complexes and therefore commute with restriction and with the natural derived-functor comparisons used in the text.

=== 7.1 Hom, shifts, and biduality <hom-shifts-and-biduality>

For a cochain complex $A$, put

$ A \[ j \]^i = A^(i + j) \, #h(2em) d_(A \[ j \]) = \( - 1 \)^j d_A . $

If $a$ has degree $i$ in $A$, write $a \[ j \]$ for the corresponding element of degree $i - j$ in $A \[ j \]$. For a fixed complex $K$, the Hom complex $D A = cal(H) o m \( A \, K \)$ has differential

$ d \( F \) = d_K F - \( - 1 \)^n F d_A #h(2em) \( \| F \| = n \) . $

The shift comparison is

#[#set math.equation(numbering: n => "(7.1)")
 $ kappa_j : D \( A \[ j \] \) & arrow.r \( D A \) \[ - j \] \,\
kappa_j \( F \) \( a \) & = \( - 1 \)^(j n - j \( j - 1 \) \/ 2) F \( a \[ j \] \) \, #h(2em) F in D \( A \[ j \] \)^n . $ <cat:hom-shift>]

For $j = 1$ this is the factor $\( - 1 \)^n$. To check that (7.1) is a chain map, note that increasing $n$ by one changes its exponent by $j$, precisely the differential sign of the target shift. The other differential term has the extra $\( - 1 \)^j$ from the source shift. These are the two terms in the Hom differential, so both commute with $kappa_j$. Iterating the one-step comparison gives the exponent $n + \( n - 1 \) + dots.h.c + \( n - j + 1 \)$ for positive $j$; the formula for negative $j$ follows by inversion. We use these iterated comparisons whenever dual functors and shifts are identified.

The unshifted biduality is the tensor-symmetry evaluation

#[#set math.equation(numbering: n => "(7.2)")
 $ eta_A \( a \) \( F \) = \( - 1 \)^(\| a \| \| F \|) F \( a \) . $ <cat:hom-biduality>]

It is a chain map, as follows by substituting the two Hom differentials; its two evaluation signs also give $D \( eta_A \) eta_(D A) = upright("id")_(D A)$ whenever the duality is defined. The comparisons (7.1) make this unshifted dual a $+ 1$-exact duality: dualizing a cone triangle and identifying its shifts gives the dual triangle with positive final dual arrow.

Now identify $D_j = \[ j \] D$ with $cal(H) o m \( - \, K \[ j \] \)$ by the output-shift comparison $f \[ j \] \( a \) = f \( a \) \[ j \]$, with no additional sign. Its two differential expressions both equal $\( - 1 \)^j d_K f - \( - 1 \)^n f d_A$ for an element of shifted degree $n$. Tensor symmetry into $K \[ j \]$ gives the shifted biduality $eta^(\( j \))$. Under the iterated comparisons of (7.1), its expression relative to the unshifted biduality is

#[#set math.equation(numbering: n => "(7.3)")
 $ eta^(\( j \)) = \( - 1 \)^(j \( j + 1 \) \/ 2) eta . $ <cat:translated-biduality>]

Indeed, on an element $a$ of degree $i$, moving the inner $j$-shift through the outer Hom contributes $\( - 1 \)^(j i + j \( j + 1 \) \/ 2)$. In the evaluation (7.2), a dual element now has its degree changed by $j$, contributing the additional factor $\( - 1 \)^(j i)$. The two terms depending on $i$ cancel, leaving (7.3). The exactness sign of $D_j$ is $\( - 1 \)^j$.

It follows directly from tensor–Hom adjunction that a morphism $A arrow.r cal(H) o m \( A \, K \[ j \] \)$ is symmetric for this biduality precisely when its pairing $A ⊗ A arrow.r K \[ j \]$ is invariant under Koszul interchange. Apply this with $K = omega_X$ and $j = - r$. This proves (2.10) and its agreement with $W_r = W^(- r)$. In particular, if $X$ is an oriented $d$-manifold, the target $omega_X \[ - d \]$ is the constant sheaf in degree zero. The pairing $1 ⊗ 1 mapsto 1$ is symmetric and positive in an oriented local trivialization. No additional parity sign is attached to this orientation form.

=== 7.2 Evaluation of a product <evaluation-of-a-product>

Fix the convention for combining output shifts by

#[#set math.equation(numbering: n => "(7.4)")
 $ K \[ p \] ⊗ L \[ q \] arrow.r \( K ⊗ L \) \[ p + q \] \, #h(2em) k \[ p \] ⊗ ell \[ q \] mapsto \( - 1 \)^(q \| k \|) \( k ⊗ ell \) \[ p + q \] \, $ <cat:tensor-output-shifts>]

where $\| k \|$ is the degree in the unshifted $K$. This is a chain map: in the first differential term the extra exponent is $q$, and in the second the two exponents differ by $2 p$. This choice is associative, since the exponents for three factors in either order are $q \| k \| + t \| k \| + t \| ell \|$.

Let $f \, g$ have degrees $l \, n$ in $cal(D)_(I \, s) B \, cal(D)_(X \, r) A$ respectively. Thus their degrees before the output shifts are $l - s \, n - r$. For homogeneous $b \, a$, the product map defined in 9 evaluates as

#[#set math.equation(numbering: n => "(7.5)")
 $ mu_(s \, r) \( f times.square g \) \( b times.square a \) = \( - 1 \)^(n \| b \| + r \( \| b \| + l - s \)) f \( b \) times.square g \( a \) \, $ <cat:product-evaluation-sign>]

followed by the product trace. The exponent $n \| b \|$ moves $g$ past $b$. The first unshifted output has degree $\| b \| + l - s$; applying (7.4) to output shifts $- s \, - r$ gives the second exponent. This derives the formula without assuming any finiteness or local constancy of the stalks of $A$.

#thm([Lemma 7.1.])[
  (Suspending the first product input).  #emph[Let $B in cal(C)_I$, $A in cal(T) \( X \)$ (or the corresponding semialgebraic category), and $s \, r in bb(Z)$. Write 
$ gamma_s \( B \) = \[ - s \] kappa_1 : cal(D)_(I \, s) \( B \[ 1 \] \) arrow.r \( cal(D)_(I \, s) B \) \[ - 1 \] . $

 Use the first-factor shift comparisons 
$ sigma : B \[ 1 \] times.square A & arrow.r^tilde.op \( B times.square A \) \[ 1 \] \,\
epsilon.alt : \( cal(D)_(I \, s) B \) \[ - 1 \] times.square cal(D)_(X \, r) A & arrow.r^tilde.op \( cal(D)_(I \, s) B times.square cal(D)_(X \, r) A \) \[ - 1 \] . $

 They introduce no sign under (7.4). Indicate the inputs of the product comparison by superscripts and put 
$ tilde(mu)_(s \, r) = \( cal(D)_(I times X \, s + r) sigma \)^(- 1) mu_(s \, r)^(B \[ 1 \] \, A) \, #h(2em) lambda = epsilon.alt compose \( gamma_s \( B \) times.square 1 \) . $

 Then the two routes to the suspended total dual satisfy 
#[#set math.equation(numbering: n => "(7.6)")
 $ gamma_(s + r) \( B times.square A \) thin tilde(mu)_(s \, r) = \( - 1 \)^r mu_(s \, r)^(B \, A) \[ - 1 \] thin lambda . $ <cat:suspension-comparison>]

 The scalar $\( - 1 \)^r$ is independent of $A$, its cohomological degrees, and the point of $I$.]
] <cat:product-shift-sign>

#proof[
  Keep $l \, n$ as the degrees of the two shifted dual elements. The Hom shift comparison on the first factor contributes $\( - 1 \)^(l - s)$, while the comparison on the total dual contributes $\( - 1 \)^(l + n - s - r)$. In (7.5), replacing $b$ by $b \[ 1 \]$ changes the braiding exponent by $- n$. After the first Hom comparison, the degree of the corresponding dual element changes along with that of $b$, so the output-shift term is the same along the two routes. The discrepancy is therefore
  $ \( l + n - s - r \) - \( l - s \) - n equiv r med \( mod med 2 \) . $
  All dependence on the individual degrees cancels. This is the stated scalar, and it is the suspension discrepancy used when dualizing $partial times.square 1$ in 10. ◻
]

=== 7.3 Normalizing the endpoint calculation <normalizing-the-endpoint-calculation>

Recall $H = underline(bb(R))_I$, $J = j_(!) underline(bb(R))_(\( 0 \, 1 \))$, and $E = E_0 xor E_1$ from (2.12). The interval triangle is

$ J arrow.r^u H arrow.r^v E arrow.r^partial J \[ 1 \] . $

Choose the orientation identification so that its connecting homomorphism is the difference map in (2.17). Proper duality to the point identifies its shifted dual with

$ \[ 1 \] \( cal(D)_(I \, 1) partial \) : H arrow.r E \, #h(2em) h mapsto \( - h \|_0 \, h \|_1 \) . $

The symmetric-cone identity $psi_E v = - \[ 1 \] \( cal(D)_(I \, 1) partial \)$ therefore gives

#[#set math.equation(numbering: n => "(7.7)")
 $ psi_E = mat(delim: "(", 1, 0; 0, - 1) : E arrow.r cal(D)_I E . $ <cat:interval-cone-matrix>]

There are no off-diagonal maps because the endpoint supports are disjoint. The diagonal coefficients are determined by precomposition with $v : H arrow.r E$, since on each endpoint this restriction is the identity. Thus the cohomology calculation determines the full derived-category morphism.

Now let $\( A \, alpha \)$ be a degree-$r$ form on $X$, and write $i_t : X arrow.r I times X$ for the endpoint inclusion, $t = 0 \, 1$. For the product cone of (2.18), the same cone identity, the naturality of (2.14), and 45 give

#[#set math.equation(numbering: n => "(7.8)")
 $ psi_r = \( - 1 \)^r mat(delim: "(", \( i_0 \)_(*) alpha, 0; 0, - \( i_1 \)_(*) alpha) . $ <cat:cylinder-cone-matrix>]

One can check this equality by precomposing with $v times.square 1$, which determines each diagonal as in 10. Combining the shifted interval and total dualities uses 45; desuspending the first dual output thereafter leaves (7.4) unchanged. There is consequently just the displayed factor $\( - 1 \)^r$.

Reversing the orientation or changing all cone normalizations coherently may negate both entries of (7.8). It leaves their relative sign opposite. Since the form is neutral, both normalizations give the same equality of the two endpoint Witt classes. This is the only sign consequence used in 11.


#bibliography("refs.bib", style: "ieee", title: [References])
