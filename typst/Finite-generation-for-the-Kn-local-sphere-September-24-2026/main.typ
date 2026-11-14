#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Finite generation for the $K \( n \)$-local sphere]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The finiteness problem and continuous coefficients <part:coefficients>

==== 1.1 Introduction <sec:introduction>

Let $p$ be a prime, let $K \( n \)$ denote Morava $K$-theory of height $n gt.eq 1$ at $p$,
  and let $S_p^and$ be the $p$-completed sphere. Morava localization isolates a single chromatic height in stable
  homotopy theory. Even for the sphere, the localized spectrum is not connective,
  and a degreewise finiteness statement must control each integer degree without a connectivity assumption.
  The degreewise finite-generation question asks whether each of these groups is a finitely generated
  $bb(Z)_p$-module. We prove that it is, at every prime and positive height.

#thm([Theorem 1.1.])[
  #emph[ For every prime $p$, every integer $n gt.eq 1$, and every integer $t$, the $bb(Z)_p$-module
$ pi_t L_(K \( n \)) S_p^and $

 is finitely generated. Equivalently, for every finite $p$-local spectrum $F$,
   the module $pi_t L_(K \( n \)) F$ is finitely generated over $bb(Z)_p$ in every integer degree $t$.]
] <thm:main>

The equivalence in the statement follows from finite cofiber sequences, suspensions, and retracts:
  finite generation over the Noetherian ring $bb(Z)_p$ is preserved by kernels, cokernels, and extensions.
  The proof of the sphere assertion is completed in 1. There is no uniform bound asserted on the number of
  generators or on the order of the torsion as $p$, $n$, or $t$ varies.

===== 1.1.1 History and relation to earlier work <sec:history>

1 answers positively the degreewise finite-generation question stated by Hovey–Strickland
  #cite(label("hoveyStrickland1999")) Problem 16.2 and in Hovey’s Morava $K$- and $E$-theory problem list
  #cite(label("hoveyProblems")) Problem 1. In Li’s terminology,
  the question asks whether the local sphere is of #emph[finite type]:
  its homotopy groups are finitely generated over $bb(Z)_p$ in every integer degree
  #cite(label("liFiniteType2021")) Introduction.

The classical height-one calculation expresses the local sphere as the fiber of an Adams operation on completed
  $K$-theory #cite(label("hopkinsKOne")) §§1–2; we recall the all-degree answer at odd primes in 67.
  At height two and $p gt.eq 5$, Hovey–Strickland’s analysis of Shimomura’s calculations proves that $pi_a
  L_(K \( 2 \)) F$ is finite for every finite torsion spectrum $F$ and every integer $a$
  #cite(label("hoveyStrickland1999")) §15.2 and Theorem 15.1.
  Applied to the Moore spectrum, this supplies the mod-$p$ finiteness criterion for the sphere in that range.
  The proof here establishes that criterion uniformly in the prime and height.

Devinatz approached integral finiteness through continuous homotopy fixed points for smaller subgroups of the
  Morava stabilizer. He used #emph[essentially finite rank],
  a condition of finite generation over the periodicity ring after quotienting by the closure of periodicity
  torsion #cite(label("devinatzHomotopy2007")) §4. For Morava $E$-theory $E_n$ and certain closed procyclic
  stabilizer subgroups $H$, he proved this property for $pi_(*) \( E_n^(h H) and F \)$ under chromatic-acyclicity
  and annihilation hypotheses on the finite spectrum $F$ #cite(label("devinatzFiniteness2008")).
  Such intermediate fixed-point spectra require their own finiteness condition;
  these results are distinct from degreewise finite generation for the full local sphere.

Barthel–Schlank–Stapleton–Weinstein determined the rational answer at every prime and height
  #cite(label("bssw2024")) Theorem A:

$ bb(Q) ⊗_(bb(Z)) pi_(*) L_(K \( n \)) S tilde.equiv Lambda_(bb(Q)_p) \( zeta_1 \, dots.h \, zeta_n \) \,
  wide \| zeta_i \| = 1 - 2 i . $

Their coefficient comparison also gives a split injection from Witt-vector cohomology into degree-zero Lubin–Tate
  coefficient cohomology whose complement in each cohomological degree is killed by a power of $p$
  #cite(label("bssw2024")) Theorem B. These conclusions do not bound the size of integral torsion:
  the compact module $product_(j gt.eq 1) bb(F)_p$ has zero rationalization and exponent $p$,
  but is not finitely generated over $bb(Z)_p$. The present theorem proves that the torsion subgroup is finite in
  each integer homotopy degree. Combined with the rational calculation, it determines the free ranks in 66.

Continuous Morava descent links coefficient cohomology to sphere homotopy #cite(label("devinatzHopkins2004"))
  Theorem 1 and Appendix A. The Hopkins–Ravenel smash product theorem,
  in the descendability formulation of Mathew, gives a horizontal vanishing line at a finite page
  #cite(label("mathew2016")) Corollary 4.4, Theorem 4.18 and Proposition 10.10.
  Heard states the resulting strongly convergent local Adams spectral sequence at every prime and height,
  with a finite-page bound independent of the input spectrum #cite(label("heard2023")) Theorem 4.6 and
  Proposition 4.13. Consequently, finite coefficient cohomology for the Moore spectrum is enough to obtain finite
  homotopy in each degree. Establishing that coefficient finiteness is the main task of this paper.

Our geometric argument places Lubin–Tate deformation theory and Strauch’s torsion strata
  #cite(label("lubinTate1966")) #cite(label("strauch2007")) in the geometry of the Fargues–Fontaine curve
  #cite(label("farguesFontaine2018")). Scholze–Weinstein relate $p$-divisible groups and their universal covers to
  sections of associated bundles #cite(label("scholzeWeinstein2013"));
  the relative bundle and cohomology results used here are those of Fargues–Scholze
  #cite(label("farguesScholze2021")). The Banach–Colmez theory initiated by Colmez #cite(label("colmez2002")) was
  related to coherent sheaves on the curve by Le Bras #cite(label("lebras2018")).
  Anschütz–Le Bras’s relative full-faithfulness theorem supplies the passage from the compatible linear morphisms
  of section sheaves constructed below to bundle maps in families #cite(label("anschutzLeBras2025"))
  Corollary 3.11. Within this framework, Section 2.2, Section 3.1,
  Section 3.2 construct the marked quotient on each height stratum and its compact-support comparisons,
  retaining the marking actions and the directions of the support limits.

The passage from geometric supports back to compact coefficients also uses analytic-group duality.
  Lazard’s theory and the formulation of Beaudry–Goerss–Hopkins–Stojanoska provide the uniform-subgroup
  resolutions and their orientation data #cite(label("lazard1965")) #cite(label("bghs")).
  The tensor-induction method, recalled by Symonds in its profinite form,
  passes from an open subgroup to a complex with finite isotropy #cite(label("symonds2007")) Theorem 5.2.
  In 2, trace-one elements for these finite stabilizers replace averaging by their orders.
  This permits the complete-step coefficient comparisons and full-group norm argument even when the stabilizer has
  $p$-torsion.

The transfer argument combines classical constructions with a uniformity problem at finite marking level.
  Cartier’s $p$-basis construction identifies differential forms with Frobenius-twisted de Rham cohomology
  #cite(label("cartier1957")) §3, Theorem 1; we use the inverse-linear operator in the conventions of
  Blickle–Böckle #cite(label("blickleBockle2011")) Definition 2.1 and Example 2.23.
  Lipman’s formal residue transformation law gives the finite-root comparison #cite(label("lipmanResidues1984"))
  Lemmas (7.2)(b) and (7.3). The additional work is to control the poles of all transfer iterates and to choose
  one finite marking level for all sufficiently high transfers.
  These are the steps that return the geometric finiteness statement to the compact coefficient modules (Section
  4.1, Section 4.2, Section 5.1, Section 5.2).

Degreewise finite generation does not extend to every invertible $K \( n \)$-local spectrum.
  At height two and $p gt.eq 5$, Hovey–Strickland’s analysis of $p$-adically graded spheres gives invertible
  spectra that are not of finite type #cite(label("hoveyStrickland1999")) Theorem 15.1;
  Li classifies the finite-type invertibles in this range #cite(label("liFiniteType2021")) Theorem 4.22.
  Thus arbitrary invertible or dualizable local spectra cannot replace the finite spectra in 1.
  The proof makes no chromatic splitting assumption, and it does not compute the finite torsion summands or the
  chromatic fracture maps.

===== 1.1.2 The coefficient theorem <the-coefficient-theorem>

Fix a height $n$ formal group over a sufficiently large finite field $k$ of characteristic $p$.
  Let $E_n$ be its Morava $E$-theory and let $P_n$ be its ordinary stabilizer group.
  The algebraic conclusion that drives the proof is

#[#set math.equation(numbering: n => "(1.1)")
 $ H_(upright("cts"))^a #scale(x: 120%, y: 120%)[\(] P_n \; \( E_n \)_(2 t) \/ p #scale(x: 120%, y: 120%)[\)] quad
   upright("is finite for every ") a gt.eq 0 upright(" and ") t in bb(Z) . $ <eq:intro-coefficients>]

Here the coefficients have their compact deformation-parameter topology. The proof retains a precise larger class:
  integer powers of the periodicity line tensored with functions on whole finite tuples of division points,
  with specified Frobenius-powered coordinates, and finite sums, tensor products, equivariant summands,
  and finite filtrations of these modules. Its exact definition is 10;
  its finiteness theorem and Morava consequence are Theorem 6.1, Corollary 6.4.
  Using whole division-point schemes allows restriction to a deeper height stratum and descent through finite
  marking covers. The assertion is about this class, rather than arbitrary semilinear finite free modules.

Here is why this coefficient theorem suffices for the sphere.
  The finite Galois quotient from $P_n$ to the extended stabilizer $bb(G)_n$ preserves degreewise finiteness,
  including when its order is divisible by $p$. Morava descent for the Moore spectrum $S \/
  p$ then has finite second-page entries. A horizontal vanishing line on a finite page leaves only finitely many
  of them in each limiting stem, so $pi_(*) L_(K \( n \)) \( S \/ p \)$ is finite in each degree.
  Finally, positive-height locality gives derived $p$-completeness.
  The finite $p$-power cofibers present each integral homotopy group as a compact $bb(Z)_p$-module with finite
  quotient modulo $p$; compact Nakayama proves finite generation. These steps are proved in 1.
  The horizontal bound concerns a later page of the descent spectral sequence;
  finite mod-$p$ cohomological dimension of the full stabilizer is not needed.

===== 1.1.3 The open-stratum argument <the-open-stratum-argument>

Write

$ A_m = k \[ \[ u_m \, dots.h \, u_(n - 1) \] \] \, wide B_m = A_m \[ u_m^(- 1) \] quad \( 1 lt.eq m < n \) \,
  wide A_n = k . $

We prove coefficient finiteness by downward induction from $A_n$.
  At the step indexed by $m$, put $x = u_m$ and $G = P_n$. The next-height hypothesis makes the cohomology of
  every finite boundary strip $x^a M \/ x^b M$ finite. Thus localization from a compact allowed coefficient $M$ to
  $M \[ 1 \/ x \]$ has countable kernel and cokernel on cohomology.
  It remains to prove that open-stratum cohomology is countable:
  the original coefficient cohomology will then be compact Hausdorff and countable, hence finite.
  This explains why an intermediate countability theorem can prove a finiteness theorem.

We work first on finite covers $B_U$ of $B_m$ that mark the connected formal group and the étale Tate module.
  The index $U$ is an open subgroup of the two marking groups.
  The finite cover is an idempotent summand of a localized whole finite free model $A' \[ 1 \/ x \]$.
  Keeping the whole model before localization ensures that its boundary layers remain in the next-height
  coefficient class. For a suitable compact lattice $cal(P) = x^(- D) A'$, set

$ M_U^i = H_(upright("cts"))^i \( G \, cal(P) \) \, wide X_U^i = H_(upright("cts"))^i \( G \, B_U \) . $

The central task is countability of $X_U^i$ at every sufficiently deep #emph[fixed] marking level.
  A statement only after taking the union of all marking levels would not suffice for the return to compact
  coefficients.

The completed marking tower provides the geometric input.
  Its quotient by $G$ is the space of independent $r$-tuples in $H^1 \( cal(O) \( - 1 \/ m \) \)$ on the relative
  Fargues–Fontaine curve, where $cal(O) \( - 1 \/ m \)$ has rank $m$ and degree $- 1$, and $r = n - m$.
  Uniform Kummer calculations and deletion of dependent tuples make the equivariant compact-support cohomology
  finite. A separate ordinary-function calculation shows that invariant algebraic functions on the tower are
  constants. This permits a single normalization of a Cartier transfer $S$ on $B_U$ at one finite marking stage.
  Its pole estimate divides the pole order by a fixed power of $p$, up to a fixed additive loss;
  consequently $cal(P)$ can be chosen $S$-stable and eventually contains the transfer iterates of every
  bounded-pole lattice.

To use the compact-support result, we express it as a Laurent module $W$ of convergent series with fractional
  $p$-power exponents, for which every $H_i \( G \, W \)$ is finite over $k$.
  Residues identify its quotient by the subspace $W_(+)$ of positive-$x$-order series with the discrete transpose
  transfer tower:

$ W \/ W_(+) tilde.eq "colim" #scale(x: 120%, y: 120%)[\(] cal(P)^or arrow.r^(S^or) cal(P)^or arrow.r^(S^or)
  dots.h.c #scale(x: 120%, y: 120%)[\)] . $

Here $cal(P)^or$ is the continuous $k$-linear dual. The positive-order kernel is homologically acyclic.
  Its homology is countable; an analytic-subgroup argument using the Baire property then makes boundaries open in
  each complete cycle space, and absolute Frobenius contracts each positive-order cycle into that open subgroup.
  Invertibility of Frobenius then makes the original cycle a boundary. Compact duality gives

$ I_U^i = ⋂_(a gt.eq 0) S^a M_U^i quad upright("finite") . $

Thus geometry controls a stable transfer image. It has not yet controlled all of $X_U^i$.

The remaining argument uses the finite translation representations of the generator-lift torsor.
  For $m > 1$ their distribution algebra is the regular local ring $Lambda = k \[ \[ D_1 \, dots.h \, D_d \] \]$,
  with $d = \( m - 1 \) r$. Exact pro-completion first shows that consecutive transfer images stabilize modulo
  countable spaces on a marking tail. Together with the next-height boundary comparison,
  this upgrades the compact result to finiteness of

$ F_U^i = ⋂_(a gt.eq 0) "im" #scale(x: 120%, y: 120%)[\(] S^a M_U^i arrow.r X_U^i #scale(x: 120%, y: 120%)[\)] . $

Suppose some $X_U^i$ remained uncountable at arbitrarily deep levels, and choose the highest such degree $b$;
  the finite-isotropy bound makes this possible. A top Koszul extension then gives a finite-diagram operation from
  degree $b - d$ on a fixed root cover to degree $b$ on $B_U$, with countable cokernel.
  One common marking shrink makes that operation factor through every sufficiently high transfer.
  These factorizations use coinduced diagrams of one fixed self-extension,
  whose boundary operator has bounded pole loss. Modulo a countable quotient,
  the source classes of the top operation have positive-order cocycle representatives.
  Powering these representatives eventually absorbs that pole loss,
  so their images belong to every late compact transfer image and hence to $F_U^b$.
  The operation therefore has countable image as well as countable cokernel, contradicting the choice of $b$.
  For $m = 1$, a Cartier splitting of Frobenius replaces the top extension and gives the same conclusion directly.

This is the bridge from geometric finiteness to ordinary coefficient cohomology.
  Section 2.1, Section 2.2 construct the finite models and identify the tower; Section 3.1,
  Section 3.2 prove its two geometric outputs. The transfer and Laurent models are developed in Section 4.1,
  Section 4.2, and Section 5.1, Section 5.2 prove the stable-image and fixed-level countability assertions just
  described. 1 extends countability to the allowed coefficient class, descends the finite marking cover,
  and closes the height induction. The continuous-cochain framework used throughout is established first in 2.

The geometric completion enters through compact supports and the transpose transfer tower.
  Compact supports, neighborhood germs, and supports shrinking to a closed locus use different directions of
  passage; 1 displays their maps and the cohomology that survives.
  These distinctions permit the argument to return to an individual algebraic marking level.

===== 1.1.4 Conventions <conventions>

Throughout the coefficient argument, $k$ is finite. It may be enlarged by a finite extension to define the Honda
  models and their endomorphisms. We write $G = P_n$ and reserve $bb(G)_n$ for the extended stabilizer in 1.
  All group cohomology is continuous, with the topological coefficient conventions of 2.
  Compact lattices carry their adic topology; localized coefficients use continuous cochains with a bounded
  denominator. Group homology is denoted by $H_i$ and cohomology by $H^i$.

For analytic arguments, $C = bb(C)_p$ and $C^flat$ is its tilt.
  If $cal(D)$ is a compact profinite parameter space, write $R_(cal(D)) =
  C \( cal(D) \, C^flat \)$ for its continuous-function ring.
  Statements of finiteness with parameters mean finiteness over $R_(cal(D))$.
  The coefficient-only Frobenius $phi$ fixes monomial exponents; the absolute Frobenius $"Fr"$ also scales them.
  These two operations are distinguished throughout.

We use cohomological grading for complexes. A limit over shrinking supports,
  a colimit of restrictions defining a germ, and a colimit of corestrictions over expanding supports are specified
  separately whenever they occur.

==== 1.2 Continuous coefficients and full-group duality <sec:continuous>

The coefficient modules below include compact formal lattices, their localizations,
  and spaces of convergent Laurent series. We first specify one cochain convention that applies to all three.
  Finite free resolution terms make the cohomology of compact coefficients compact Hausdorff;
  this is the input used when countability is upgraded to finiteness.
  The marked Laurent support module needs a second conclusion:
  duality between its group homology and cohomology for the full ordinary stabilizer.
  For that module, trace-one elements for finite subgroups replace averaging by their orders and permit the
  full-group duality argument below. The two conclusions have different hypotheses;
  only the second requires the trace condition. In this section $k$ is a finite field of characteristic $p$,
  and $G$ is a compact $p$-adic analytic group.

#prodef([Definition 1.2.])[
  (Complete steps).  A coefficient module with complete steps is a vector space $M = union.big_(a gt.eq 0) M_a$,
    where the $M_a$ are complete Hausdorff linearly topologized $k$-spaces and the inclusions are continuous
    injections. The inclusions need not induce the topology on the smaller space.
    An action of $G$ is required to have the following property:
    for every $a$ there is a $b$ for which $G M_a subset M_b$ and $G times M_a arrow.r M_b$ is continuous.
    Morphisms satisfy the analogous condition with no group variable. We use the bounded-step continuous cochains
  $ C_(upright("cts"))^j \( G \, M \) = "colim"_a C_(upright("cts")) \( G^j \, M_a \) $
  with the usual inhomogeneous differential. Their cohomology is denoted $H^j \( G \, M \)$.
    The same convention applies to continuous functions on any compact profinite parameter space $cal(D)$:
    its complete steps are $C_(upright("cts")) \( cal(D) \, M_a \)$ with the topology of uniform convergence.
] <def:cts-steps>

All subsequent assertions about these coefficient modules refer to this specified complex;
  they do not replace an algebraic image by its closure. Finite-dimensional discrete modules and compact modules
  are special cases. A localization of a finite module over $k \[ \[ x \, y_1 \, dots.h \, y_s \] \]$ has the
  steps $x^(- a) M_0$, with their adic topologies. Laurent modules have the complete steps specified in 2.

#thm([Lemma 1.3.])[
  (Exact cochains).  #emph[Consider an exact sequence of underlying vector spaces
$ 0 arrow.r M' arrow.r^iota M arrow.r^q M'' arrow.r 0 $

 whose maps and actions respect complete steps. Suppose that:]
  + #emph[a bounded-step continuous map from a compact profinite space to $M$ with image in $iota \( M' \)$ is
    bounded-step continuous as a map to $M'$;]
  + #emph[for every compact subset $T$ of a step of $M''$, there is a continuous map $s : T arrow.r
    M_b$ into one step of $M$, with $q s = "id"_T$.]
  #emph[Then the corresponding sequence of continuous cochain complexes is short exact.
    In particular, it has the usual long exact cohomology sequence.
    These hypotheses hold for strict short exact sequences of compact $k$-spaces,
    for short exact sequences of finite modules over a complete Noetherian local $k$-algebra with finite residue
    field, and for their localizations with the lattice steps just described.]
] <lem:cts-exact>

#proof[
  The kernel assertion is (i). A cochain in the quotient has compact image $T$ in a single step,
    and composing it with the section in (ii) lifts that cochain. The section is not required to commute with $G$.
    Thus every degree of the cochain sequence is exact.
  For compact vector spaces, continuous duality with discrete vector spaces turns a strict surjection into an
    injection. Splitting that injection as a map of vector spaces and dualizing gives a continuous $k$-linear
    section. In the Noetherian local case the modules are compact.
    A submodule is closed, and its induced topology is its adic topology by Artin–Rees.
    This proves (i), while the compact splitting proves (ii).
    For a localization, a fixed quotient lattice is the image of a compact source lattice:
    choose lifts of finitely many module generators and a common denominator.
    Its map from that source lattice is a strict compact surjection and has a continuous linear section.
    The kernel in a fixed lattice is again a finite module, so Artin–Rees gives (i) after a common enlargement of
    the denominator. This also proves the assertions for finite twists and finite direct sums. ◻
]

#thm([Lemma 1.4.])[
  (Compact envelopes and comparison).  #emph[Let $M$ satisfy 2.]
  + #emph[Every compact subset of a step of $M$ is contained in a compact $G$-stable $k$-subspace $N$ lying in one
    complete step. The action on $N$ is continuous. These $N$ form a filtered system whose union is $M$, and
$ C_(upright("cts"))^bullet \( G \, M \) = "colim"_N C_(upright("cts"))^bullet \( G \, N \) . $

]
  + #emph[The ring $k \[ \[ G \] \]$ is Noetherian, and the trivial compact module $k$ has a resolution $P_bullet$
    by finitely generated free compact $k \[ \[ G \] \]$-modules. It may be unbounded. The comparison map
$ "Hom"_(k \[ \[ G \] \] \, upright("cts")) \( P_bullet \, M \) tilde.eq C_(upright("cts"))^bullet \( G \, M \) $

 is a natural quasi-isomorphism. Every term on the left is a finite power of $M$.]
  + #emph[A right resolution by finitely generated free compact modules similarly defines $H_i \( G \, M \)$.
    For compact $M$, cohomology and homology computed this way are compact Hausdorff,
    and continuous duality interchanges homology and cohomology, with the contragredient action on $M^or =
    "Hom"_(upright("cts")) \( M \, k \)$.]
  #emph[For $G = bb(Z)_p$ with generator $gamma$, the cochain complex is $\[ M arrow.r^(gamma - 1) M \]$ in
    degrees $0 \, 1$.]
] <lem:cts-comparison>

#proof[
  Let $T subset M_a$ be compact. The set $G T$ is compact in some $M_b$. Let $N$ be its closed linear span there.
    Modulo any open linear subspace of $M_b$, the image of $G T$ is finite.
    Since $k$ is finite, its linear span in that discrete quotient is finite as well.
    Thus $N$ is totally bounded and complete, hence compact. For any $g in G$, the action map $M_b arrow.r
    M_c$ is continuous after enlarging $c$ uniformly in $g$. The image of $N$ in the Hausdorff space $M_c$ is
    compact and closed. It contains the image of the linear span of $G T$,
    and continuity therefore shows $g N subset N$. The injection $N arrow.r
    M_c$ is a homeomorphism onto its image, so the restricted action is continuous.
    A finite sum of such spaces is again compact in a common step.
    Every element, and every compact cochain image, is contained in one of them.
    A map from a compact domain whose image lies in $N$ is continuous into $N$, by its subspace topology in $M_b$.
    This proves (i), including the assertion about cochains.
  Choose a normal uniform open subgroup $K subset G$. For the augmentation filtration of $k \[ \[ K \] \]$,
    the associated graded ring is a polynomial ring on $dim G$ variables.
    Thus $k \[ \[ K \] \]$ is Noetherian, and the finite crossed-product extension $k \[ \[ G \] \]$ is Noetherian
    as well. Successively resolving the finitely generated kernels of a finite free presentation gives $P_bullet$.
    For a compact module $N$, compare it with the compact bar resolution.
    Its terms are induced from compact $k$-spaces and are projective:
    every compact $k$-space is projective by continuous linear duality,
    and completed induction preserves that lifting property. Both are projective resolutions,
    and their augmentations and acyclic kernels split as compact $k$-spaces by continuous duality.
    The lifting construction for resolutions gives chain maps and chain homotopies in the compact category.
    Applying continuous Hom gives the usual continuous bar cochains.
    For comparison with the ind-profinite formulation under its countability hypotheses,
    see #cite(label("boggiCorobCook"), form: "prose") Proposition 8.2 and Corollary 8.4.
    The compact splitting argument just given does not impose second countability on $N$ and proves that all its
    comparison homotopies are continuous.
  There is a well-defined $k \[ \[ G \] \]$-action on $M$: integrate on a compact $G$-stable envelope of a given
    element. It is independent of that envelope. Since every $P_j$ is finite free,
    its Hom into $M$ is the filtered union of its Hom into the $N$. Filtered colimits of vector spaces are exact.
    Passing the compact comparison and its homotopies through this colimit proves (ii);
    in particular no new completion is introduced. The same argument applies to the finite free right resolution
    and tensor products. For compact $N$, every differential has compact, hence closed,
    image in a finite power of $N$. Continuous duality is exact on compact vector spaces and takes these
    finite-power complexes to the corresponding dual complexes. This proves (iii).
    Finally, $k \[ \[ bb(Z)_p \] \] = k \[ \[ gamma - 1 \] \]$, and multiplication by $gamma -
    1$ gives the stated two-term free resolution. ◻
]

We next make the finite-isotropy hypothesis explicit. Its verification for the geometric coefficient algebras will
  be given in 16.

#prodef([Definition 1.5.])[
  (Trace elements).  Let $A$ be a commutative $k$-algebra with a $G$-action.
    A semilinear $A$-module $M$ with complete steps is trace-admissible if,
    for every finite subgroup $F subset G$, there is $t_F in A$ satisfying
  $ sum_(f in F) f \( t_F \) = 1 \, $
  and multiplication by $t_F$ carries each complete step continuously into some complete step.
    The action is semilinear in the sense that $g \( a m \) = g \( a \) g \( m \)$.
] <def:cts-trace>

We will need an elementary local fact about the finite stabilizers of profinite spaces.
  The characteristic-zero Lie group in its proof is the group $K$,
  even though the coefficient field has characteristic $p$.

#thm([Lemma 1.6.])[
  (Equivariant local sections).  #emph[Let $K$ be a normal uniform open subgroup of $G$,
    and let $X$ be a profinite $G$-space on which $K$ acts freely.
    Suppose that $X arrow.r Y = K without X$ has a continuous $K$-equivariant trivialization as a principal
    $K$-space. Put $H = G \/ K$. If $x in X$ and $y$ is its image,
    the finite group $G_x$ maps isomorphically to $H_y$. There is an $H_y$-invariant clopen neighborhood $V$ of
    $y$ and a section $s : V arrow.r X$, with $s \( y \) = x$, which is equivariant for $G_x tilde.eq H_y$.]
] <lem:cts-local-section>

#proof[
  An element of $H_y$ has a lift taking $x$ into its $K$-orbit.
    Correcting that lift by the unique element of $K$ gives an element fixing $x$.
    Since $K$ acts freely, the resulting homomorphism $G_x arrow.r H_y$ is bijective. Write $F = G_x$.
    A continuous section with value $x$ at $y$ exists by the assumed trivialization.
    Its failure to be $F$-equivariant is a continuous nonabelian cocycle $c_f in
    C \( V \, K \)$ for the action combining conjugation by $F$ and its action on $V$.
    All $c_f \( y \)$ equal $1$. Shrinking to an $F$-invariant clopen neighborhood makes all these cocycles
    arbitrarily close to $1$.
  Here is the required small-cocycle argument, including the case $p divides \| F \|$.
    Choose an $F$-stable sufficiently small Lie lattice in $"Lie" \( K \)$ on which exponential, logarithm,
    and the Campbell–Hausdorff formula converge. In the Banach space of continuous functions on $V$ with values in
    $"Lie" \( K \)$, use the supremum norm of an $F$-invariant norm.
    Put $lambda_f = log c_f$ and $epsilon.alt = max_f parallel lambda_f parallel$.
    Convergence of the Campbell–Hausdorff series gives, for a fixed constant $c$, the bound
  $ parallel lambda_(f g) - lambda_f - f lambda_g parallel lt.eq c epsilon.alt^2 . $
  With $b = \| F \|^(- 1) sum_f lambda_f$, summing this identity over $g$ gives
  $ parallel lambda_f + f b - b parallel lt.eq c \| thin \| F \| thin \|_p^(- 1) epsilon.alt^2 \, wide
    parallel b parallel lt.eq \| thin \| F \| thin \|_p^(- 1) epsilon.alt . $
  Changing the section by $exp \( - b \)$ changes its cocycle to $exp \( - b \) c_f f \( exp b \)$.
    Another application of the same convergence estimate bounds the new logarithms by $c' epsilon.alt^2$,
    for a constant $c'$ depending only on $F$ and the chosen Lie lattice.
    Choose the initial neighborhood small enough that these exponentials stay in the convergence lattice and $c'
    epsilon.alt < 1$. Iteration then gives uniformly convergent continuous changes of section,
    since the successive logarithms tend to zero at least quadratically. The limit has trivial cocycle.
    Every change is the identity at $y$, so the limiting section still takes $y$ to $x$.
    Division by $\| F \|$ was only performed in $bb(Q)_p$; its fixed norm loss was absorbed in the initial choice
    of neighborhood. ◻
]

#thm([Proposition 1.7.])[
  (A uniform finite-isotropy bound).  #emph[Fix a normal uniform open subgroup $K subset G$, and put $d_G =
    dim G$ and $a_G = \[ G : K \]$. If $M$ is trace-admissible, then
$ H^j \( G \, M \) = 0 wide \( j > a_G d_G \) . $

 The same bound holds for $M ⊗_k V$ for every finite-dimensional continuous $G$-representation $V$.
   Neither the bound nor the choice of $K$ depends on $M$ or $V$.]
] <prop:cts-isotropy-bound>

#proof[
  First consider a finite subgroup $F$ and a semilinear module $L$ with a trace element $t = t_F$. The map
  $ L arrow.r k \[ F \] ⊗_k L \, wide v mapsto sum_(f in F) f ⊗ t f^(- 1) v $
  is $F$-linear when $F$ acts on the first factor of the target.
    Its composite with $f ⊗ v mapsto f v$ is multiplication by $sum_f f \( t \) = 1$.
    Thus $L$ is a direct summand of an induced module. The same formulas on continuous cochains,
    which are finite sums of bounded continuous operators, show $H^(> 0) \( F \, L \) = 0$ in our convention.
    They apply also to continuous function modules with pointwise multiplication by $t$,
    and to any finite-dimensional twist.
  The trivial $k \[ \[ K \] \]$-module has a finite free resolution of length $d_G$.
    For finite cohomological dimension and uniform-group Poincare duality,
    see #cite(label("lazard1965"), form: "prose") Chapter V, Proposition 2.5.7.1 and Theorem 2.5.8 and
    #cite(label("bghs"), form: "prose") Lemma 4.15 and Proposition 4.16.
    Thus $k$ has projective dimension $d_G$, and the Noetherian local ring $k \[ \[ K \] \]$ has finitely
    generated free terms in a minimal resolution. A sufficiently deep uniform subgroup is used also when $p = 2$.
    Tensor-induce this resolution from $K$ to $G$: take its completed tensor product over the $a_G$ cosets and let
    $G$ permute the factors, using the usual signs of complexes and the conjugate $K$-actions.
    Denote the resulting augmented complex by $T_bullet arrow.r k$.
    It is concentrated in degrees $0$ through $a_G d_G$. The original augmented resolution is split exact as a
    complex of compact $k$-spaces. Its tensor product is therefore again a split resolution of $k$ in that
    category. This is the tensor-induction construction of #cite(label("symonds2007"), form: "prose") Theorem 5.2.
  Each term of $T_bullet$ is a finite sum of signed permutation modules $k \[ \[ X \] \]$.
    Here $X$ is a finite disjoint union of products of copies of $K$, one for each tensor factor.
    The diagonal $K$-action is free, and setting the first coordinate equal to $1$ gives a continuous
    trivialization of $X arrow.r K without X$. A possible sign is a locally constant rank-one coefficient and will
    be carried along. We claim that
  #[#set math.equation(numbering: n => "(1.2)")
   $ H^j #scale(x: 120%, y: 120%)[\(] G \, "Hom"_(k \, upright("cts")) \( k \[ \[ X \] \] \, M \)
     #scale(x: 120%, y: 120%)[\)] = 0 quad \( j > 0 \) . $ <eq:cts-permutation-acyclic>]
  The Hom module is $C_(upright("cts")) \( X \, M \)$, with complete uniform-convergence steps.
    A $K$-trivialization identifies it, after untwisting the diagonal action on $M$,
    with a continuously coinduced $K$-module. Evaluation in the first coordinate contracts the coinduced bar
    complex, so its positive $K$-cohomology vanishes. All operators in that contraction are bounded continuous
    operators on function steps. The Hochschild–Serre double complex therefore reduces its $G$-cohomology to the
    cohomology of $H = G \/ K$ on the $K$-invariants.
  Apply 6 at a point of $Y = K without X$. After shrinking its neighborhood $V$ further,
    its translates by elements outside $H_y$ are disjoint: first separate $y$ from the finitely many distinct
    points $h y$, and then intersect the resulting clopen neighborhoods.
    On the induced neighborhood $H V$, the $K$-invariant functions are induced from $H_y tilde.eq
    G_x$ acting on $C_(upright("cts")) \( V \, M \)$, with its possible rank-one sign.
    The equivariant section makes this the ordinary semilinear action on values together with the action on $V$.
    Its higher $H_y$-cohomology vanishes by the trace-element splitting.
    These induced neighborhoods cover the compact space $Y$. Choose a finite such cover and take successive
    differences of its $H$-invariant clopen members to obtain a disjoint finite invariant clopen partition.
    Each piece retains its local description and splitting. Finite additivity and finite-group Shapiro now prove (1.2).
  Finally form the first-quadrant double complex
  $ C_(upright("cts"))^u #scale(x: 120%, y: 120%)[\(] G \, "Hom"_(k \, upright("cts")) \( T_v \, M \)
    #scale(x: 120%, y: 120%)[\)] . $
  The compact $k$-linear contracting homotopy of the augmented $T_bullet$ acts on these Hom modules:
    a continuous map from a compact domain into a step has image in a compact envelope,
    so integration and the contracting homotopy take place in complete steps by 4.
    Computing first in the $v$ direction identifies the total cohomology with $H^(*) \( G \, M \)$.
    Computing first in the $u$ direction and using (1.2) leaves only $u = 0$ and $0 lt.eq v lt.eq a_G d_G$.
    This proves the bound. Tensoring $M$ with $V$ preserves every step condition and the trace elements,
    so the same construction proves the last assertion with the identical bound. ◻
]

The preceding bound is deliberately larger than the dimension.
  It is its uniformity under finite twists that permits passage from torsion-free open subgroups to the full
  group, including at primes where $G$ has torsion.

#thm([Proposition 1.8.])[
  (Full-group duality).  #emph[Assume that the orientation character of $G$ is trivial over $k$.
    For every trace-admissible $M$ there are natural isomorphisms
$ H_i \( G \, M \) tilde.eq H^(d_G - i) \( G \, M \) wide \( i in bb(Z) \) . $

 Here homology is zero in negative degrees, and cohomology is zero in negative degrees.
   In particular $H^j \( G \, M \) = 0$ for $j > d_G$. The ordinary stabilizer $P_n$ has trivial orientation
   character and $d_G = n^2$, so this assertion applies to it without a twist.]
] <prop:cts-full-duality>

#proof[
  Write $R = k \[ \[ G \] \]$, $R_K = k \[ \[ K \] \]$, $H = G \/ K$, and $Sigma = k \[ H \]$.
    Regard $Sigma$ as the quotient bimodule of $R$. It is perfect as a left or right $R$-module,
    since it is induced from the length-$d_G$ free resolution over $R_K$.
    Uniform-group duality, with its conjugation action retained, gives
  #[#set math.equation(numbering: n => "(1.3)")
   $ upright(bold(R)) "Hom"_R \( Sigma \, R \) tilde.eq Sigma \[ - d_G \] $ <eq:cts-bimodule-duality>]
  as a $\( Sigma \, R \)$-bimodule. To recall the equivariance in this formula,
    restrict $R$ to $R_K$ and decompose it into its finitely many cosets.
    The dual of the uniform resolution has cohomology only in degree $d_G$,
    with one orientation line on each coset. Right translation permutes those lines by the right regular action;
    precomposition by a quotient element gives the left regular action and its action on the orientation line.
    The latter is trivial by hypothesis. This proves exactly the two commuting actions asserted in (1.3).
    The uniform duality, orientation identification, and compatibility with conjugation are also recorded in
    #cite(label("bghs"), form: "prose") Propositions 4.16 and 4.36, Theorem 4.19 and Remark 4.23.
  Put
  $ C = upright(bold(R)) "Hom"_R \( Sigma \, M \) = upright(bold(R)) Gamma \( K \, M \) \, wide B =
    Sigma ⊗_R^(upright(bold(L))) M . $
  Perfectness permits evaluation of the dual resolution against $M$,
    so (1.3) gives a natural equivalence $C tilde.eq B \[ - d_G \]$ in the derived category of $Sigma$-modules.
    The cohomology of $C$ lies in degrees $0 \, dots.h \, d_G$.
    The finite free comparisons in 4 show that these derived expressions compute precisely the specified
    continuous cochains and homology, even when $M$ is a union of steps.
  We prove that the finite-group norm
  #[#set math.equation(numbering: n => "(1.4)")
   $ k ⊗_Sigma^(upright(bold(L))) C arrow.r upright(bold(R)) "Hom"_Sigma \( k \, C \) $ <eq:cts-finite-norm>]
  is an equivalence. This is the point where finite subgroup cohomology cannot be discarded.
    For any finite-dimensional left $Sigma$-module $V$, derived adjunction gives
  $ "Ext"_Sigma^j \( V \, C \) = H^j \( G \, V^(*) ⊗_k M \) . $
  By 7 these groups vanish for $j > a_G d_G$, uniformly in $V$.
    Choose a bounded-below injective resolution $J^bullet$ of $C$.
    If $N$ is greater than both $d_G$ and $a_G d_G$, dimension shifting along its exact tail gives
  $ "Ext"_Sigma^1 \( V \, ker \( J^N arrow.r J^(N + 1) \) \) = "Ext"_Sigma^(N + 1) \( V \, C \) = 0 . $
  Every quotient $Sigma \/ I$ by a left ideal is finite-dimensional.
    Baer’s criterion therefore says that this last kernel is injective.
    Truncating there gives a bounded complex of injective modules representing $C$.
  For a finite group algebra, every injective module, including an infinite-dimensional one, is projective.
    Indeed, the canonical injection of any module $L$ into $"Hom"_k \( Sigma \, L \)$ splits if $L$ is injective;
    the target is free because the symmetric pairing on $k \[ H \]$ identifies coinduction with induction.
    On a free module of arbitrary rank the ordinary norm is an isomorphism from coinvariants to invariants:
    on each copy of $k \[ H \]$ it sends the class of $1$ to $sum_(h in H) h$.
    It is consequently an isomorphism on projective summands.
    Applying this degreewise to the bounded injective-projective model of $C$ proves (1.4),
    with no infinite totalization or completion.
  The left-hand side of (1.4), shifted by $d_G$, is
  $ \( k ⊗_Sigma^(upright(bold(L))) C \) \[ d_G \] tilde.eq k ⊗_R^(upright(bold(L))) M \; $
  the right-hand side is $upright(bold(R)) Gamma \( G \, M \)$.
    Taking cohomology in degree $- i$ of the shifted equivalence gives $H_i \( G \, M \) =
    H^(d_G - i) \( G \, M \)$, with the stated grading.
  For $G = P_n$, its Lie algebra is the central division algebra $D_n$ of degree $n$ over $bb(Q)_p$.
    Conjugation by $a in D_n^times$ has determinant
  $ det \( L_a \) det \( R_a \)^(- 1) = "Nrd" \( a \)^n "Nrd" \( a \)^(- n) = 1 . $
  The orientation character is the reduction of this determinant character, hence is trivial.
    The dimension of $D_n$ is $n^2$. ◻
]

#prodef([Remark 1.9.])[
  For a nontrivial orientation character, the same proof retains its one-dimensional line in (1.3) and gives the
    corresponding orientation-twisted duality. We only use the untwisted case stated above.
    The proposition makes no assertion that arbitrary $k \[ \[ G \] \]$-modules have finite cohomological
    dimension: its trace-element hypothesis is essential when $G$ contains $p$-torsion.
]

== 2 Finite markings and the completed tower <part:tower>

==== 2.1 Finite markings and integral models <sec:finite-markings>

This section provides the finite algebraic data used by both sides of the proof.
  The whole models give coefficients whose boundary layers belong to the next height stratum;
  their localized summands give the marking covers whose completed tower is studied geometrically.
  We also identify the full division-point lift schemes, because later transfer maps require their scheme
  structure and natural group actions.

Fix a prime $p$ and a height $n$. Choose a finite field $k$ containing the fields of definition of the Honda
  groups $Gamma_j$, $1 lt.eq j lt.eq n$, and of their endomorphisms.
  We use Honda coordinates for which $\[ p \]_(Gamma_j) \( T \) = T^(p^j)$. In this section

$ G = P_n \, wide A_m = k \[ \[ u_m \, dots.h \, u_(n - 1) \] \] \, wide 1 lt.eq m lt.eq n . $

The formal group $cal(F)$ over $A_m$ is the restriction of the universal deformation of $Gamma_n$ to the
  height-at-least-$m$ locus. The deformation-ring construction is due to
  #cite(label("lubinTate1966"), form: "prose") Proposition 1.1 and Theorem 3.1;
  the Honda conventions and endomorphism structure are recalled in #cite(label("ravenel1986"), form: "prose")
  Appendix A2.2. Its finite division schemes are formed over $A_m$ before any localization. If $m < n$, put

$ x = u_m \, wide B_m = A_m \[ 1 \/ x \] \, wide r = n - m . $

The chosen parameters are successive Hasse coefficients: the ideals of the deeper height loci are
  $\( u_m \, dots.h \, u_(j - 1) \)$, and the first coefficient of $\[ p \]_(cal(F)) \( T \)$ over $A_m$ is $x
  T^(p^m)$; compare #cite(label("strauch2007"), form: "prose") (1.1) and §2.
  Replacing a parameter by a unit multiple gives the same constructions.

The action of $G$ comes with coordinate changes $alpha_g : g^(*) cal(F) arrow.r cal(F)$.
  Write $chi_g = alpha'_g \( 0 \)$ and let $cal(L)_m$ denote the free rank-one $A_m$-module with this semilinear
  action. Composition of the $alpha_g$ gives the cocycle identity for $chi_g$.
  Comparing the leading coefficients of the $p$-series gives

#[#set math.equation(numbering: n => "(2.1)")
 $ g \( x \) = chi_g^(p^m - 1) x . $ <eq:mark-height-character>]

Thus $cal(L)_m$ is the periodicity line, up to the immaterial choice of inverse convention.
  All its integer powers will be retained. All finite $A_m$-modules below carry their compact topology;
  localizations carry the bounded-denominator coefficient convention of 2.

===== 2.1.1 The coefficient class <the-coefficient-class>

Since the $p$-series factors through $T^(p^m)$, its $ell$-fold iterate factors through $T^(p^(m ell))$.
  For $ell gt.eq 1$ and $0 lt.eq b lt.eq m ell$, define

$ D_m \( ell \, b \) = A_m \[ thin T^(p^b) thin \] med subset.eq med
  A_m \[ \[ T \] \] \/ \( \[ p^ell \]_(cal(F)) \( T \) \) . $

The brackets here mean the $A_m$-subalgebra generated by the indicated element; it will be finite over $A_m$.

#prodef([Definition 2.1.])[
  (Allowed coefficients).  The basic coefficients at height $m$ are
  #[#set math.equation(numbering: n => "(2.2)")
   $ cal(L)_m^(⊗ w) ⊗_(A_m) ⨂_(j = 1)^s D_m \( ell_j \, b_j \) \, wide w in bb(Z) \, quad 0 lt.eq b_j lt.eq
     m ell_j \, $ <eq:mark-basic-coefficients>]
  where $s$ may be zero. These are functions on whole tuples of division points,
    with the indicated powered coordinates; no independence condition is imposed.
    The allowed class $cal(C)_m$ is their closure under finite direct sums, tensor products,
    equivariant direct summands, and finite equivariant filtrations whose successive quotients belong to the
    class. An extension in this definition is an exact sequence of compact semilinear $A_m$-modules.
] <def:mark-coefficients>

#thm([Lemma 2.2.])[
  #emph[The algebra $D_m \( ell \, b \)$ is finite free of rank $p^(n ell - b)$ over $A_m$.
    Its construction and action are intrinsic to relative Frobenius and commute with restriction to a deeper
    height locus. Every member of $cal(C)_m$ is finite free over $A_m$,
    and reduction modulo $x$ sends $cal(C)_m$ into $cal(C)_(m + 1)$.]
] <lem:mark-powered-division>

#proof[
  Write $\[ p^ell \]_(cal(F)) \( T \) = f \( T^(p^b) \)$. Modulo the maximal ideal of $A_m$,
    the series $f \( Z \)$ is $Z^(p^(n ell - b))$. Weierstrass preparation therefore gives
  $ f \( Z \) = v \( Z \) W \( Z \) \, wide W \( Z \) = Z^(p^(n ell - b)) + sum_(i < p^(n ell - b)) c_i Z^i \, $
  where $v$ is a unit and all $c_i$ lie in the maximal ideal.
    Consequently $\[ p^ell \] \( T \)$ generates the same ideal as $W \( T^(p^b) \)$.
    Division by this monic polynomial shows both that $A_m \[ Z \] \/ \( W \( Z \) \) arrow.r
    A_m \[ \[ T \] \] \/ \( \[ p^ell \] \( T \) \)$, $Z mapsto T^(p^b)$,
    is injective and that its image has basis $1 \, T^(p^b) \, dots.h \, T^(p^b \( p^(n ell - b) - 1 \))$.
    This proves the rank assertion.
  A coordinate change $T mapsto a \( T \)$ carries $T^(p^b)$ to $a \( T \)^(p^b)$, a series in $T^(p^b)$.
    Thus the subalgebra is preserved; it is the relative Frobenius image of the division scheme on coordinate
    rings. The same monic-division calculation after base change identifies the resulting algebra with the
    corresponding powered division algebra of the restricted group.
    In particular it commutes with passage to $A_(m + 1) = A_m \/ \( x \)$.
    The numerical restriction on $b$ persists, since $b lt.eq m ell lt.eq \( m + 1 \) ell$.
  The basic modules are finite free. An extension with finite free quotient splits as an underlying $A_m$-module,
    so its middle term is finite free. A finite direct summand is projective and hence free over the local ring
    $A_m$. These facts also show that reduction modulo $x$ preserves the exact filtrations in the definition.
    The periodicity line restricts to the corresponding line at height $m + 1$.
    The last assertion now follows by induction over the finite constructions defining the class. ◻
]

===== 2.1.2 Connected jets and whole finite models <connected-jets-and-whole-finite-models>

For the remainder of this section assume $m < n$. Over $B_m$,
  the connected part of $cal(F) \[ p^oo \]$ is a formal group of height $m$.
  Its isomorphisms to $Gamma_m$ form a pro-finite-étale $P_m$-torsor.
  The ring-level assertion used here is #cite(label("lurieFormalGroups"), form: "prose") Lecture 14, Theorem 1:
  the isomorphism algebra of two formal group laws of the same exact positive height over a ring is an increasing
  union of finite étale algebras. In the present Honda trivialization its finite quotients can be chosen as follows.

#thm([Proposition 2.3.])[
  (Integral connected-jet models).  #emph[For each $h gt.eq 0$,
    the connected marking through exponent $p^h$ has a finite free model $H_(m \, h)$ over $A_m$.
    There are coordinates $a_0 \, dots.h \, a_h$ and polynomials in earlier coordinates such that
#[#set math.equation(numbering: n => "(2.3)")
 $ a_0^(p^m - 1) & = x \,\
a_i^(p^m) - x^(p^i) a_i & = P_i \( a_0 \, dots.h \, a_(i - 1) \) \, &  & 1 lt.eq i lt.eq h . $ <eq:mark-jet-equations>]

 If the first Hasse coefficient is normalized only up to a unit,
   the corresponding unit factors are inserted in these equations. The residue monomials
$ a_0^(e_0) a_1^(e_1) dots.h.c a_h^(e_h) \, wide 0 lt.eq e_0 < p^m - 1 \, quad 0 lt.eq e_i < p^m med \( i > 0 \) \, $

 are an $A_m$-basis. The $G$-action preserves this model and admits a finite filtration with quotients integer
   powers of $cal(L)_m$. The filtration remains such a filtration on every deeper height locus.]
] <prop:mark-jets>

#proof[
  Write an isomorphism $f : cal(F) arrow.r Gamma_m$ as an ordinary power series.
    Its coefficient at $T^(p^i)$ is $a_i$. At a degree $j$ which is not a power of $p$,
    some intermediate binomial coefficient $binom(j, v)$ is nonzero modulo $p$.
    In the coefficient of $X^v Y^(j - v)$ in $f \( cal(F) \( X \, Y \) \) = Gamma_m \( f \( X \) \, f \( Y \) \)$,
    the unknown coefficient of $T^j$ therefore has a nonzero constant coefficient.
    All other terms involve earlier coefficients. It follows inductively that every non-$p$-power coefficient is a
    polynomial over $A_m$ in the preceding $a_i$.
  Now compare $f \( \[ p \]_(cal(F)) \( T \) \)$ with $f \( T \)^(p^m)$.
    In degree $p^m$ this gives $a_0 x = a_0^(p^m)$, hence the first equation,
    since $a_0$ is invertible on the open marking space. In degree $p^(m + i)$,
    the only term involving $a_i$ on the left is $x^(p^i) a_i$; all remaining terms involve earlier coefficients.
    This proves (2.3), with polynomials over $A_m$. The recursive comparison is also the usual proof of the Honda
    classification; see #cite(label("ravenel1986"), form: "prose") Theorem A2.2.12, its proof,
    and Lemmas A2.2.20–A2.2.21.
  Let $H_(m \, h)$ be the successive monic algebra defined by these equations.
    Monic division gives the displayed basis, so it is finite free of rank $\( p^m - 1 \) p^(m h)$.
    After inverting $x$, $a_0$ is invertible, the derivative of its equation is invertible,
    and the derivative of the $i$th subsequent equation is $- x^(p^i)$. Thus $H_(m \, h) \[ 1 \/ x \]$ is finite étale.
  The actual marking quotient is finite étale by the ring-level classification above.
    After a strictly henselian base change its fiber is the corresponding quotient of $P_m$.
    A Honda automorphism has $p^m - 1$ possible nonzero linear coefficients,
    and $p^m$ choices at each succeeding $p$-power; the other coefficients are then determined.
    This follows either from the Honda coefficient calculation or from the order filtration on its endomorphism
    ring. Hence that quotient has rank $\( p^m - 1 \) p^(m h)$.
    The equations define a map from $H_(m \, h) \[ 1 \/ x \]$ to its coordinate ring.
    Every jet coefficient is a polynomial in $a_0 \, dots.h \, a_h$,
    so these coordinates distinguish geometric jets. The map on geometric function algebras is therefore
    surjective, and finite étaleness gives surjectivity of the map itself.
    A surjection between finite étale algebras of the same rank is an isomorphism,
    as can be checked after strict henselization. This identifies the algebra,
    including over nonreduced test bases, with the connected marking quotient.
  Precomposing $f$ with $alpha_g$ gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ g \( a_i \) = chi_g^(p^i) a_i + Q_(g \, i) \( a_0 \, dots.h \, a_(i - 1) \) \, wide g \( a_0 \) =
     chi_g a_0 . $ <eq:mark-jet-triangular>]
  Every coefficient in this formula lies in $A_m$; only finitely many coefficients of $alpha_g$ are used at a
    fixed jet order. The formulas preserve the defining relations after inverting $x$.
    Since $H_(m \, h)$ is $x$-torsion-free, they preserve them before localization as well.
    The inverse coordinate change supplies the inverse action.
  Order the displayed basis lexicographically starting with $e_h$, then $e_(h - 1)$, and so on.
    In expanding a transformed monomial, any use of an earlier-variable term in (2.4) lowers this order.
    Reducing a power $a_i^(p^m)$ by its monic equation lowers it again.
    The diagonal term on a basis vector is therefore $chi_g^(e_0 + p e_1 + dots.h.c + p^h e_h)$.
    The initial spans in this order are stable, with the claimed line quotients.
    All these spans and quotients are free over $A_m$, so the filtration specializes exactly to every deeper
    height locus. Finally the formulas are continuous in $g$ and in the compact coefficient topology,
    because every fixed finite coefficient quotient uses finitely many coefficients of the continuous universal
    coordinate change. ◻
]

On the same open, marking the étale Tate module gives a $"GL"_r \( bb(Z)_p \)$-torsor.
  Its action commutes with changes of connected marking and with $G$. Put

$ J = P_m times "GL"_r \( bb(Z)_p \) . $

We use a cofinal sequence of normal product congruence subgroups $U subset J$.
  The connected factors can be chosen among the kernels of the jet quotients just constructed:
  the subsequence corresponding to $1 + p^a cal(O)_(D_m)$ is cofinal.
  After omitting finitely many terms, both factors, and hence $U$, are uniform and torsion-free.
  Let $B_U$ denote the finite étale $J \/ U$-torsor algebra of the two markings.

#thm([Proposition 2.4.])[
  (A whole model for a finite marking).  #emph[For each such $U$ there are a finite free $A_m$-algebra $A'$,
    with integral multiplication laws in a fixed basis, and a $G$-invariant idempotent $e in B' =
    A' \[ 1 \/ x \]$ such that
$ B_U = e B' \, wide B' \/ B_m upright(" is finite étale") . $

 As a semilinear $A_m$-module, $A'$ has a finite filtration whose quotients are basic coefficients in $cal(C)_m$.
   Its reduction modulo $x$ has such a filtration in $cal(C)_(m + 1)$.
   In a whole basis $A' = xor.big_nu A_m b_nu$, the $G$-action is given by continuous matrices over $A_m$.
   The base action is a continuous formal action preserving $\( x \)$;
   in particular the whole-basis action has a uniform pole bound, including for compact families of group elements.]
] <prop:mark-whole-model>

#proof[
  Choose the connected jet order $h$ and the étale level $ell$ defining $U$.
    Relative Frobenius of exponent $m ell$ kills precisely the connected part of $cal(F) \[ p^ell \]$ on the
    exact-height open. Its image is the étale quotient, whose coordinate algebra is
    $D_m \( ell \, m ell \) \[ 1 \/ x \]$. One can check étaleness directly:
    writing $\[ p^ell \] \( T \)$ in the variable $Z = T^(p^(m ell))$,
    its linear coefficient is invertible when $x$ is invertible.
    Equivalently its geometric fibers have $p^(r ell)$ distinct points,
    and the resulting finite flat group scheme is étale.
  The set of ordered bases in the $r$-fold power of this finite étale group is an open and closed subscheme.
    Indeed it can be checked after an étale trivialization of the group,
    where it is a subset of a finite constant set. Its characteristic idempotent is preserved by every isomorphism
    of the group, in particular by $G$. Take
  $ A' = H_(m \, h) ⊗_(A_m) D_m \( ell \, m ell \)^(⊗ r) $
  and extend that idempotent over the connected factor. This gives the asserted $e$ and the identification with
    the two marking torsors. Both factors of $B'$ are finite étale over $B_m$.
  Tensor the monomial filtration of 12 with the whole powered tuple algebra.
    Its quotients are precisely of the form (2.2). The same holds after reduction modulo $x$ by 11.
    Tensoring the finite free bases gives a basis of $A'$, and all multiplication constants lie in $A_m$.
    This construction uses the entire tuple algebra at the boundary;
    no extension or specialization of $e$ across $x = 0$ is involved.
  The base action and the action on a powered division coordinate are substitution by the universal formal
    coordinate change and its appropriate Frobenius power. Their reduction in a fixed finite free basis converges
    in the parameter topology. Modulo any power of the maximal ideal, only a finite truncation is needed,
    so its matrix entries vary continuously in $g$. The connected-jet entries have the same property by (2.4).
    Thus all matrices have integral entries and zero pole loss in the whole lattice, uniformly in $g$.
    Preservation of $\( x \)$ is (2.1). ◻
]

===== 2.1.3 Generator lifts and roots <generator-lifts-and-roots>

At full markings the schemes of lifts of the ordered étale generators are torsors under the connected division
  groups. Their inverse limit is a torsor for

$ T = "proj lim"_(\[ p \]) Gamma_m \[ p^ell \]^r . $

Here $T$ and its finite quotients are affine group schemes;
  their representations below are coactions of the coordinate Hopf algebras.
  The two marking groups act on this description by changing the two bases;
  $G$ commutes with the resulting translations.

#thm([Proposition 2.5.])[
  (The lift algebras are root algebras).  #emph[At level $ell$,
    the reduced closure over $A_m$ of lifted geometric étale bases has coordinate algebra
$ R_(m \, ell) = k \[ \[ t_(1 \, ell) \, dots.h \, t_(r \, ell) \] \] . $

 If $s_i = t_(i \, ell)^(p^(m ell))$, the intermediate algebra generated by the $s_i$ over $A_m$ is
$ S_(m \, ell) = k \[ \[ s_1 \, dots.h \, s_r \] \] \, wide A_m subset.eq S_(m \, ell) . $

 After inverting $x$, $S_(m \, ell) \[ 1 \/ x \]$ is the étale basis algebra,
   and $R_(m \, ell) \[ 1 \/ x \]$ is its full generator-lift algebra.
   In particular the latter is the root extension of order $p^(m ell)$, finite free of rank $p^(m ell r)$,
   with no reduction of the lift scheme omitted. These identifications are natural under the $G$ action,
   changes of markings, and finite étale base change. For $j lt.eq ell$,
   earlier division coordinates are integral series in the $p^(m \( ell - j \))$ powers of the level-$ell$
   coordinates. In particular the base parameters, in first-level coordinates, have order at least $p^m$.]
] <prop:mark-roots>

#proof[
  Strauch describes the corresponding torsion stratum over the completed maximal unramified coefficient base.
    There the full Drinfeld level-$p^ell$ deformation ring $tilde(R)_ell$ is finite flat over the Lubin–Tate
    deformation ring and regular, with the universal torsion coordinates $phi.alt_1 \, dots.h \,
    phi.alt_n$ as regular parameters. The quotient
  $ tilde(R)_ell \/ \( phi.alt_1 \, dots.h \, phi.alt_m \) $
  is a regular ring of dimension $r$ over the height-at-least-$m$ base;
    its generic torsion coordinates $phi.alt_(m + 1) \, dots.h \, phi.alt_n$ give the lifted étale bases.
    The induced generic Galois action is the full $"GL"_r \( bb(Z) \/ p^ell \)$ action
    #cite(label("strauch2007")) §3, Proposition 4.1, and the proof of Theorem 2.1.
    Over our finite Honda field we establish the whole reduced closure directly, using the division divisor.
  Let $C_ell$ be the coordinate algebra of the whole $r$-fold division tuple scheme over $A_m$.
    Over $B_m$, let $Q_ell$ be the finite étale algebra of ordered bases of the étale division group,
    and let $L_ell$ be its full generator-lift algebra. The map $Q_ell arrow.r L_ell$ is finite faithfully flat:
    its fibers are torsors under the product of the $r$ connected division groups.
    The basis condition selects an open and closed subscheme of the powered tuple scheme,
    so $C_ell \[ 1 \/ x \] arrow.r L_ell$ is surjective. Define
  $ R = "image" #scale(x: 120%, y: 120%)[\(] C_ell arrow.r \( L_ell \)_(upright("red")) #scale(x: 120%, y: 120%)[\)] . $
  This is the reduced closure of the entire lifted basis locus.
    It is finite over $A_m$, as a quotient of $C_ell$, and $R \[ 1 \/ x \] = \( L_ell \)_(upright("red"))$.
    Every component dominates $B_m$: the finite flat algebra $L_ell \/
    B_m$ has its minimal primes over the generic point. Taking their closures adds no vertical component.
    Consequently $A_m arrow.r R$ is injective and integrality gives $dim R = r$.
    The closed fiber of $C_ell$ is supported at the tuple of origins,
    so $R$ is complete local with residue field $k$. Denote the universal lifted coordinates by $t_i =
    t_(i \, ell)$, and put $t_(i \, 1) = \[ p^(ell - 1) \]_(cal(F)) \( t_i \)$.
    At geometric generic points, the $p^r$ combinations of the $t_(i \, 1)$ are all the points of
    $cal(F) \[ p \]$, each with multiplicity $p^m$. Weierstrass preparation therefore gives the divisor identity
  #[#set math.equation(numbering: n => "(2.5)")
   $ \[ p \]_(cal(F)) \( Z \) = v \( Z \) product_(a in bb(F)_p^r)
     (Z - sum_(i = 1)^r zws_(cal(F)) \[ a_i \] \( t_(i \, 1) \))^(p^m) quad upright("in ") R \[ \[ Z \] \] \,
     $ <eq:mark-basis-divisor>]
  where $v$ is a unit. Equality holds in $R$, since $R$ is reduced and all its components meet the generic basis
    locus. Modulo $\( t_1 \, dots.h \, t_r \)$, the right side is a unit times $Z^(p^n)$.
    Successively comparing the Hasse coefficients forces every $u_m \, dots.h \,
    u_(n - 1)$ to vanish in that quotient. Consequently the maximal ideal of $R$ is generated by the $r$ elements
    $t_i$. Completeness gives a surjection $k \[ \[ T_1 \, dots.h \, T_r \] \] arrow.r.twohead R$.
    A nonzero ideal of the power-series domain has quotient of dimension at most $r - 1$; since $dim R = r$,
    the kernel is zero. This proves the asserted description of $R_(m \, ell)$ over $k$.
  For the powered assertion, set $h = p^(m ell)$ and let $S = A_m \[ s_1 \, dots.h \, s_r \] subset R$,
    where $s_i = t_i^h$. This is a finite $A_m$-module: it is a submodule of a finite module over the Noetherian
    ring $A_m$. It is therefore complete; it is local with residue field $k$, and $dim S = r$ by integrality.
    The first-level coordinates raised to $p^m$ belong to $S$.
    Indeed, $\[ p^(ell - 1) \] \( T \)$ is a series in $T^(p^(m \( ell - 1 \)))$,
    so raising $\[ p^(ell - 1) \] \( t_i \)$ to $p^m$ gives an integral series in $s_i$.
    The same is true of all their formal-group combinations.
  To apply (2.5) inside $S$, write $\[ p \]_(cal(F)) \( Z \) = V \( Z^(p^m) \)$.
    The monic factor on its right is a polynomial in $Z^(p^m)$ whose coefficients lie in $S$.
    Division of $V \( W \)$ by this monic polynomial in $W$ is performed in $S \[ \[ W \] \]$;
    the remainder is zero after embedding in $R \[ \[ W \] \]$, hence is already zero in $S \[ \[ W \] \]$.
    The quotient is a unit, as its reduction at the closed point is a unit.
    Reducing now modulo $\( s_1 \, dots.h \, s_r \)$ again gives a unit times $W^(p^r)$.
    The successive Hasse coefficients therefore put all the base parameters in $\( s_1 \, dots.h \, s_r \) S$.
    Thus $S$ is complete with maximal ideal generated by the $r$ elements $s_i$.
    The dimension argument just used gives $S = k \[ \[ s_1 \, dots.h \, s_r \] \]$.
    In particular the inclusion of the base factors through this power-series subring.
  The powered coordinates on the exact-height open are the étale division coordinates.
    Their basis condition gives a surjection $Q_ell arrow.r S \[ 1 \/ x \]$,
    since the $s_i$ generate the target over $B_m$. The composite into
    $R \[ 1 \/ x \] = \( L_ell \)_(upright("red"))$ is injective:
    $Q_ell$ is reduced, and the faithfully flat map $Q_ell arrow.r
    L_ell$ cannot send a nonzero element of $Q_ell$ to a nilpotent.
    Thus $Q_ell tilde.eq S \[ 1 \/ x \]$, identifying the basis algebra on the whole open.
  The extension
  $ k \[ \[ s_1 \, dots.h \, s_r \] \] med arrow.r med k \[ \[ t_1 \, dots.h \, t_r \] \] \, wide s_i mapsto t_i^h \, $
  is free with basis $product_i t_i^(e_i)$, $0 lt.eq e_i < h$;
    this follows by partitioning the monomials in a power series by their exponents modulo $h$. Its rank is $h^r$.
    After localization, $R \[ 1 \/ x \]$ is a closed subscheme of the generator-lift scheme over $S \[ 1 \/ x \]$.
    That lift scheme is a torsor under the product of $r$ connected $p^ell$-division groups,
    so it too is finite locally free of rank $p^(m ell r) = h^r$.
    On coordinate rings this is a surjection of finite locally free modules of equal rank, hence an isomorphism.
    This proves the assertion about the full scheme, including its nonreduced geometric fibers.
  All maps used to define $s_i$ are relative Frobenius maps,
    and all transition maps are multiplication by powers of $p$. They commute with group isomorphisms.
    Changing a basis replaces the $t_i$ by formal integral linear combinations,
    whose $h$th powers are the corresponding combinations of the $s_i$.
    Hence the descriptions are natural for $G$ and both marking actions.
    For an étale algebra, relative Frobenius is an isomorphism #cite(label("stacks")) Lemma 41.14.3, Tag 0EBS.
    Root extension therefore commutes with any subsequent finite étale marking extension:
    if $E \/ S \[ 1 \/ x \]$ is étale, then
  $ E ⊗_(S \[ 1 \/ x \]) R \[ 1 \/ x \] tilde.eq E^(1 \/ h) . $
  The same identity gives descent through marking levels, with their natural change-of-marking actions retained.
    Finally $t_(i \, j) = \[ p^(ell - j) \] \( t_(i \, ell) \)$ is an integral series in
    $t_(i \, ell)^(p^(m \( ell - j \)))$ with coefficients in $A_m$.
    Substituting the already proved expressions for those coefficients puts it in
    $k \[ \[ t_(1 \, ell)^(p^(m \( ell - j \))) \, dots.h \, t_(r \, ell)^(p^(m \( ell - j \))) \] \]$.
    At level one, each base parameter lies in the maximal ideal of
    $k \[ \[ t_(1 \, 1)^(p^m) \, dots.h \, t_(r \, 1)^(p^m) \] \]$, which gives the stated order bound. ◻
]

#thm([Lemma 2.6.])[
  (Basic coefficients on the marked torsor).  #emph[At full markings,
    each basic coefficient in (2.2) is associated to a finite-dimensional translation representation over $k$.
    Its torsor, representation, and maps descend to finite marking levels,
    with the natural change-of-marking actions. A fixed finite collection of such data admits a common
    sufficiently deep level. The periodicity line already trivializes at the linear connected jet.]
] <lem:mark-associated-coefficients>

#proof[
  Choose a level $L$ at least as large as all the $ell_j$. A lift of the marked étale generators in
    $cal(F) \[ p^L \]$ supplies a splitting of the connected–étale extension at that level:
    send a standard basis vector of $\( bb(Z) \/ p^L \)^r$ to its lift and extend by the group law.
    The lifts are $p^L$-torsion, so this is well defined. The resulting product decomposition identifies the
    division group with
  $ Gamma_m \[ p^L \] times \( bb(Z) \/ p^L \)^r . $
  Changing the lifts translates this splitting by $Gamma_m \[ p^L \]^r$.
    The coordinate algebra of the displayed group is a finite-dimensional $k$-space;
    its restrictions to the lower levels and their powered-coordinate images are functorial under relative
    Frobenius. They therefore give finite-dimensional representations of the same finite translation quotient.
    Torsor descent identifies their associated bundles with the original powered division coefficients.
    Tensor products and finite sums preserve this identification.
  The derivative of the connected marking identifies the intrinsic linear coefficient line with the Honda line.
    This is an equivariant trivialization and uses only $a_0$, which is invertible on the open.
    It treats every positive or negative periodicity power. The schemes and their coactions use finite division
    level, finitely many coefficients, and a finite-dimensional vector space over the finite field $k$.
    The continuous change-of-marking action consequently factors through a finite quotient on each fixed datum.
    Finite presentation of the torsor descent and its maps puts them at a finite marking stage;
    the maximum of finitely many stages works for a finite collection.
    This assertion is about the basic coefficients. Arbitrary extensions and summands in $cal(C)_m$ will be
    handled by exact sequences and retracts, without asserting that every such extension is itself a constant
    translation representation. ◻
]

===== 2.1.4 Finite isotropy and trace one <finite-isotropy-and-trace-one>

#thm([Proposition 2.7.])[
  (Geometric hypotheses for the isotropy bound).  #emph[Suppose $U$ is a torsion-free product marking subgroup as
    above. Every finite subgroup $F subset G$ acts geometrically freely on $"Spec" B_U$.
    There is an element $a_F in B_U$ with
$ sum_(f in F) f \( a_F \) = 1 . $

 Multiplication by $a_F$ is continuous between bounded-denominator steps of finite coefficient bundles.
   It also acts continuously on bounded analytic section and compact-support models,
   with compact profinite parameters retained. Thus the geometric coefficient modules satisfy the trace and
   module-action hypotheses of Proposition 1.7, Proposition 1.8. Equivalently they satisfy 5.]
] <prop:mark-finite-isotropy>

#proof[
  Let $g eq.not 1$ have finite order $N$, and suppose it fixes a geometric point $z$ of $"Spec" B_U$.
    Its image on the base factors through
  $ R = A_m \/ I_g \, wide I_g = \( g \( a \) - a : a in A_m \) . $
  Every ideal of a Noetherian complete local ring is closed, so $R$ is complete local.
    The framing action becomes an actual automorphism $gamma$ of the formal group over $R$.
    Its reduction at the closed point is the nonidentity Honda automorphism $g$. The difference endomorphism
  $ f \( T \) = gamma \( T \) -_(cal(F)) T $
  therefore has nonzero reduction, of some finite order $d$ in $T$.
    Weierstrass preparation over $R$ makes $H = "Spec" R \[ \[ T \] \] \/ \( f \( T \) \)$ finite free of rank
    $d$. For every $ell$ the fixed subscheme of the finite division scheme is
  $ H_ell = "Spec" R \[ \[ T \] \] \/ \( f \( T \) \, \[ p^ell \] \( T \) \) \, $
  a closed subscheme of $H$. Every geometric fiber of $H_ell$ thus has coordinate dimension at most $d$.
    This preparation and these finite quotients were formed over the complete base before localization.
  Lift $z$ to a full marking $t$ over its algebraically closed residue field.
    Such a lift exists by the marking torsors: the inverse system of nonempty finite fibers has surjective
    transitions. As $g$ fixes the $U$-coset, $g t = t u$ for some $u in U$.
    Commutation of the actions gives $u^N = 1$. Since $U$ is torsion-free, $u = 1$.
    In particular $gamma$ induces the identity on the connected height-$m$ formal group,
    hence on its finite $p^ell$-division subgroup inside the specialized division scheme.
    That subgroup has rank $p^(m ell)$ and is contained in $\( H_ell \)_z$.
    Taking $p^(m ell) > d$ is a contradiction. Notice that only the connected marking is needed for this last
    contradiction; no splitting of the connected–étale extension at $z$ is being used.
    To spell out the specialization, its connected division coordinate is nilpotent,
    so evaluation of each original formal series there is a finite sum.
    It gives a surjection from the specialized prepared algebra defining $H_ell$ onto that connected coordinate
    algebra, since both $f$ and $\[ p^ell \]$ vanish there. This uses only the finite algebra formed over $R$ and
    never identifies $R \[ \[ T \] \] ⊗_R Omega$ with $Omega \[ \[ T \] \]$.
  We give the trace argument for an arbitrary commutative algebra $D$ with a geometrically free action of a finite
    group $F$; this avoids a finite-type assumption on $B_U$. Put $C = D^F$.
    The image $I = "Tr"_F \( D \)$ is an ideal of $C$, because trace is $C$-linear.
    If $I$ were contained in a maximal ideal $frak(m)$ of $C$, the integrality of $D \/ C$ would give a point $z :
    D arrow.r Omega$ extending $C arrow.r kappa \( frak(m) \)$, for an algebraically closed field $Omega$.
    Integrality follows directly from the orbit polynomials $product_(f in F) \( T - f \( d \) \)$,
    and the point follows by lying-over. In $D_Omega = D ⊗_C Omega$, consider the surjective $Omega$-algebra evaluations
  $ e_f \( d ⊗ lambda \) = z \( f \( d \) \) lambda \, wide f in F . $
  Geometric freeness says that these maps are distinct. Their maximal kernels are therefore distinct,
    and the Chinese remainder theorem gives $b in D_Omega$ such that $e_1 \( b \) = 1$ and $e_f \( b \) =
    0$ for $f eq.not 1$. Hence $e_1 \( "Tr"_F \( b \) \) = 1$.
    On the other hand, writing $b = sum_i d_i ⊗ lambda_i$ gives
  $ "Tr"_F \( b \) = sum_i "Tr"_F \( d_i \) ⊗ lambda_i = 0 \, $
  because all $"Tr"_F \( d_i \)$ lie in $frak(m)$. This contradiction shows that $I = C$.
    Thus a single element of $D$ has trace one. The argument uses no assertion that invariants commute with
    residue-field base change. Apply it with $D = B_U$.
  Finally, write $a_F = e x^(- c) a$ in the whole finite model, with $a in A'$ and $c$ finite.
    Multiplication is a finite matrix over $B_m$ in the whole basis.
    Clearing its finitely many denominators makes it a continuous map from any compact lattice into a fixed
    enlarged lattice. The same statement holds for finite coefficient bundles, after choosing lattices.
    On an analytic bound where $x$ is bounded away from zero, the same function and finite matrices are bounded.
    Multiplication is continuous on sections, preserves supports, and commutes with restriction;
    it therefore acts on the section and support complexes. Retaining a compact profinite parameter means using
    the uniform seminorm on that parameter, so the same bound applies.
    These are precisely the trace-one multiplication and semilinearity conditions in the cited cohomological
    propositions. The additional continuity of the later Laurent representatives under changes of coordinates is
    verified in 43. ◻
]

===== 2.1.5 Boundary strips <boundary-strips>

#thm([Lemma 2.8.])[
  (Boundary comparison under the next-height hypothesis).  #emph[Assume that $H_(upright("cts"))^i \( G \, M \)$
    is finite for every $M in cal(C)_(m + 1)$ and every $i gt.eq 0$.
    Let $L$ be either a member of $cal(C)_m$ or $A' ⊗_(A_m) M$ for $M in cal(C)_m$,
    where $A'$ is a whole model from 13. For any integers $a < b$,
$ H_(upright("cts"))^i \( G \, x^a L \/ x^b L \) $

 is finite in every degree. For each fixed integer $a$, localization induces a map
$ H_(upright("cts"))^i \( G \, x^a L \) arrow.r H_(upright("cts"))^i \( G \, L \[ 1 \/ x \] \) $

 with countable kernel and cokernel. These assertions concern whole lattices;
   they do not require a model for the idempotent $e$ on the closed locus.]
] <lem:mark-strips>

#proof[
  The quotient $x^a L \/ x^b L$ has a finite filtration whose layers are $x^j L \/ x^(j + 1) L$ for $a lt.eq
    j < b$. Multiplication by $x^j$ and (2.1) identify the $j$th layer with
  $ \( L \/ x L \) ⊗_(A_(m + 1)) cal(L)_(m + 1)^(⊗ j \( p^m - 1 \)) . $
  If $L in cal(C)_m$, this belongs to $cal(C)_(m + 1)$ by 11.
    For a whole marking model it has a finite filtration with the same property by 13.
    The next-height hypothesis and the long exact cohomology sequences of these finite filtrations prove
    finiteness of every strip.
  Put $V = L \[ 1 \/ x \] \/ x^a L$. It is the countable increasing union of the finite-width strips $x^(a - j)
    L \/ x^a L$, $j gt.eq 0$. With the stipulated bounded-denominator cochains,
    its cochain complex is their filtered colimit. Filtered colimits of vector spaces are exact,
    so its cohomology is the filtered colimit of their finite cohomology groups.
    It is countable, since $k$ is finite. The short exact coefficient sequence
  $ 0 arrow.r x^a L arrow.r L \[ 1 \/ x \] arrow.r V arrow.r 0 $
  is exact on continuous cochains by 3; in concrete terms one lifts a cochain through a compact strip after
    enlarging its denominator bound. The long exact sequence identifies the localization kernel with an image of
    $H_(upright("cts"))^(i - 1) \( G \, V \)$ and its cokernel with a subspace of
    $H_(upright("cts"))^i \( G \, V \)$. Both are countable, as claimed. ◻
]

======= 2.1.5.1 The remaining induction step. <the-remaining-induction-step.>

At $m = n$, the allowed coefficients are finite-dimensional over $k$,
  so the finite-type resolution of 4 gives finite cohomology in each degree.
  For $m < n$, assume this finiteness for every coefficient in $cal(C)_(m + 1)$.
  The target of is the marked scalar assertion

$ H_(upright("cts"))^i \( G \, B_(U_nu) \) upright(" is countable") wide \( i gt.eq 0 \, med nu gt.eq nu_0 \) \, $

where $\( U_nu \)$ is a cofinal decreasing sequence of normal product congruence subgroups and one $nu_0$ works
  for all degrees. This is 53: it concerns each individual finite marking level on that tail.

The return to arbitrary allowed coefficients still requires 1.
  There the associated translation representations extend scalar countability to basic coefficients,
  and finite marking descent removes the cover. The boundary comparison above then makes the original compact
  coefficient cohomology countable. It is compact Hausdorff by 4, hence finite.
  Exact filtrations and summands give the full allowed class, closing the induction in 60.

==== 2.2 The completed tower and its extension-space quotient <sec:completed-tower>

The finite markings of the preceding section supply an inverse tower of covers of the exact-height open.
  Our goal is to identify its quotient by the ordinary stabilizer with a space of independent extension classes,
  including its relative structure, both marking actions, and its compact supports.
  That identification is the input for the cohomological calculations in the next part.

Fix $1 lt.eq m < n$ and put $r = n - m$. Write $x = u_m$ and $y_i = u_(m + i)$ for $1 lt.eq i < r$.
  All analytic spaces in this section are diamonds over $"Spa" \( C \, cal(O)_C \)$,
  with characteristic-$p$ functions obtained by tilting. We use the perfected analytic domain

$ X_m = { 0 < \| x \| < 1 \, med \| y_1 \| \, dots.h \, \| y_(r - 1) \| < 1 } $

associated with $A_m$; here and below an empty list of $y$-coordinates is permitted.
  For a finite marking level $U subset J$, let $Z_U arrow.r X_m$ be the finite étale cover obtained from $B_U$.
  The completed full marking tower $Z_oo$ is the inverse limit of these covers in perfectoid spaces,
  or equivalently in diamonds. Completion always means completion for the spectral norms on relatively compact
  analytic charts. In particular, no ideal containing the invertible element $x$ is used as an ideal of completion
  on $B_m$. The chart constructions use perfected Tate algebras, rational localizations,
  and fiber products of perfectoid spaces #cite(label("scholzePerfectoid2012")) Proposition 5.20,
  Theorem 6.3(i)–(ii), and Proposition 6.18.

Write $cal(V)_j = cal(O) \( 1 \/ j \)$ for the basic bundle of rank $j$ and degree one on the Fargues–Fontaine
  curve. Its section sheaf is denoted by $cal(H)_j = H^0 \( cal(V)_j \)$.
  We use the Honda model obtained by reducing the Lubin–Tate formal group over the unramified extension $F_j \/
  bb(Q)_p$ with logarithm $sum_(a gt.eq 0) T^(p^(j a)) \/ p^a$. Its $p$-series is $T^(p^j)$.
  The universal cover is a perfected open ball with Honda addition #cite(label("scholzeWeinstein2013"))
  Proposition 3.1.3. The following explicit comparison fixes the endomorphism convention as well as the underlying
  section sheaf.

#thm([Lemma 2.9.])[
  (The covariant Honda action).  #emph[The Honda universal-cover sheaf identifies covariantly with $cal(H)_j$.
    This identification intertwines the original rational Honda endomorphisms with the bundle endomorphisms,
    preserving composition. Over a geometric base, it identifies
$ D_j := "End" \( cal(V)_j \) tilde.eq "End"^0 \( Gamma_j \) \, wide P_j = cal(O)_(D_j)^times . $

 The invariant $1 \/ j$ uses the arithmetic-Frobenius convention in the Honda presentation.
   The comparison is relative on perfectoid test bases and is linear over the sheaf $underline(bb(Q)_p)$ of
   continuous $bb(Q)_p$-valued functions.]
] <lem:tower-honda-action>

The relative bundle and section descriptions used below are those of
  #cite(label("farguesScholze2021"), form: "prose") Sections II.2–II.3.
  The coordinate argument proves the particular partial-height tower comparison,
  including its integral frame and support data.

Put

$ cal(N)_m = H^1 \( cal(V)_m^or \) \, wide \( cal(N)_m^r \)_(upright("ind")) = { \( xi_1 \, dots.h \, xi_r \) :
  xi_1 \, dots.h \, xi_r upright(" are ") bb(Q)_p upright("-linearly independent") } . $

Independence is a fiberwise condition defining the indicated open subfunctor:
  relations can be normalized in the compact parameter space $bb(P)^(r - 1) \( bb(Q)_p \)$,
  so their incidence locus has closed image under projection.
  As an additive diamond, after choosing the standard untilt description,

#[#set math.equation(numbering: n => "(2.6)")
 $ cal(N)_m tilde.eq bb(G)_(a \, C)^diamond.stroked.small \/ underline(F_m) \, $ <eq:tower-additive-model>]

where $F_m \/ bb(Q)_p$ is unramified of degree $m$. One obtains this by expressing $cal(V)_m^or$ as the
  pushforward of $cal(O) \( - 1 \)$ from the curve with coefficient field $F_m$ and applying the untilt-divisor
  sequence $0 arrow.r cal(O) \( - 1 \) arrow.r cal(O) arrow.r i_(*) C arrow.r 0$.
  The resulting $H^0$ and $H^1$ sequence is $0 arrow.r underline(F_m) arrow.r
  bb(G)_(a \, C)^diamond.stroked.small arrow.r cal(N)_m arrow.r 0$;
  the section and vanishing assertions are #cite(label("farguesScholze2021")) Propositions II.2.3, II.2.5(ii),
  and II.3.4. This additive description does not choose affine coordinates for the $P_m$-action:
  that action is the one on bundle extensions.

#thm([Theorem 2.10.])[
  (Completed tower comparison).  #emph[There is a choice of a fixed determinant-height normalization for which
#[#set math.equation(numbering: n => "(2.7)")
 $ \[ Z_oo \/ G \] tilde.eq \( cal(N)_m^r \)_(upright("ind")) . $ <eq:tower-quotient>]

 The map $Z_oo arrow.r \( cal(N)_m^r \)_(upright("ind"))$ is a $G = P_n$-torsor.
   The comparison commutes with base change and with both integral marking actions of $J = P_m times
   "GL"_r \( bb(Z)_p \)$. Under the convention that a matrix acts on a kernel framing by pushout,
   $\( a \, b \) in P_m times "GL"_r \( bb(Z)_p \)$ acts on extensions by pullback along $a^(- 1)$ on $cal(V)_m$
   and pushout along $b$ on $cal(O)^r$.]
] <thm:tower-comparison>

The proof separates three geometric constructions. The normalized coordinates first identify the completed tower
  with only the étale marking as $\( cal(H)_n^r \)_(upright("ind"))$ (20).
  Independent sections then give an exact sequence with quotient of type $cal(V)_m$,
  and the connected marking supplies an actual relative frame of that quotient.
  Finally the determinant height selects the integral frame torsors.
  We first establish the Honda-action comparison needed to retain the original groups throughout these constructions.

#proof[
  Work on an affinoid perfectoid test base $T = "Spa" \( R \, R^(+) \)$ over $k$.
    The chosen inclusion $bb(F)_(p^j) subset k$ induces the unramified field $F_j$ in the relative period
    coefficients; Witt Frobenius $phi.alt$ restricts to arithmetic Frobenius there.
    For a topologically nilpotent universal-cover coordinate $X$, the covariant Lubin–Tate section map is
  #[#set math.equation(numbering: n => "(2.8)")
   $ psi_j \( X \) = sum_(i in bb(Z)) p^i \[ X^(p^(- j i)) \] . $ <eq:tower-honda-period-map>]
  Here brackets denote Teichmüller lifts. This is the natural additive isomorphism of
    #cite(label("farguesScholze2021"), form: "prose") Proposition II.2.2, applied with coefficient field $F_j$,
    uniformizer $p$, and residue-field cardinality $p^j$. Pushforward along the unramified degree-$j$ map of
    coefficient-field curves gives $cal(O) \( 1 \/ j \) = f_(*) cal(O) \( 1 \)$,
    as in the proof of #cite(label("farguesScholze2021"), form: "prose") Theorem II.2.14.
    Thus its target is $cal(H)_j$, and $phi.alt^j psi_j \( X \) = p psi_j \( X \)$.
  We record the continuity needed to use this comparison in families.
    On a closed period annulus, its Gauss seminorms can be normalized by $\| p \| =
    p^(- 1)$ and $\| \[ z \] \|_s = \| z \|^s$, with $s$ in a compact interval $\[ a \, b \]$ and $a > 0$.
    On an input chart $parallel X parallel lt.eq rho < 1$, the $i$th term of (2.8) has norm at most
  $ p^(- i) rho^(a p^(- j i)) . $
  For $i arrow.r + oo$ the first factor forces convergence.
    For $i = - h$ the bound is $p^h rho^(a p^(j h))$, which also tends to zero.
    Both tails converge uniformly on the input chart. The formula is therefore continuous,
    commutes with bounded maps of perfectoid algebras, and glues on test bases. Termwise calculation gives
  $ psi_j \( X^p \) = phi.alt psi_j \( X \) \, wide psi_j \( c X \) = \[ c \] psi_j \( X \)
    quad \( c in bb(F)_(p^j) \) . $
  Consequently the Honda Frobenius $Pi_j : X mapsto X^p$ and the Teichmüller scalars satisfy,
    on both sides with the same composition,
  $ Pi_j^j = p \, wide Pi_j \[ c \] = \[ c^p \] Pi_j . $
  These are the Honda algebra relations of #cite(label("ravenel1986"), form: "prose") A2.2.17–A2.2.18.
    They identify the original integral endomorphism ring as a finite free $bb(Z)_p$-algebra generated by $Pi_j$
    and a primitive unramified Teichmüller root. In particular finitely many monomials in these generators span it
    over $bb(Z)_p$. Compatibility with integers extends to $bb(Z)_p$ by continuity:
    the discrepancy after an approximation modulo $p^h$ has Honda norm at most $rho^(p^(j h))$,
    and its period-side norm tends to zero on each annulus. The displayed action identities therefore hold for the
    entire original maximal order, and then for its rational division algebra after inverting $p$.
  For the required sheaf linearity, let $alpha in C^0 \( \| T \| \, bb(Q)_p \)$ and fix an input section $v$.
    Quasicompactness supplies $d gt.eq 0$ such that $b = p^d alpha$ is $bb(Z)_p$-valued.
    Choose its finite clopen-constant approximation $b_h$ modulo $p^h$, and write $b - b_h = p^h c_h$,
    with $c_h$ integral. Integral Honda scalar operations do not increase the norm, so
  $ parallel \[ b \] v -_(Gamma_j) \[ b_h \] v parallel lt.eq rho^(p^(j h)) . $
  On each fixed period annulus, multiplication by an integral scalar has norm at most one, and
  $ parallel \( b - b_h \) psi_j \( v \) parallel lt.eq \| p \|^h parallel psi_j \( v \) parallel . $
  On each clopen piece constant scalar compatibility gives $psi_j \( \[ b_h \] v \) = b_h psi_j \( v \)$.
    Taking the two limits and then commuting with $p^(- d)$ proves the assertion for $alpha$ on the same test base.
  Positive-slope vanishing identifies derived sections of $cal(V)_j$ with its ordinary section sheaf.
    Relative full faithfulness #cite(label("anschutzLeBras2025")) Corollary 3.11,
    with the just-verified topological-field sheaf convention, turns the Honda action into a unital,
    composition-preserving map $"End"^0 \( Gamma_j \) arrow.r "End" \( cal(V)_j \)$.
    Its source is a division algebra, so the map is injective.
    Over a geometric base both algebras have dimension $j^2$ over $bb(Q)_p$:
    for the target, the endomorphism bundle has slope zero and rank $j^2$,
    and geometric classification together with $H^0 \( cal(O) \) = bb(Q)_p$ computes its sections.
    Thus the map is an isomorphism. The unique maximal orders correspond,
    identifying the actual Honda automorphism group with the bundle-frame group.
    Uniqueness in full faithfulness makes this construction compatible with relative base change.
    On a general test base the corresponding action is by the sheaf $underline(D_j)$ of continuous $D_j$-valued
    functions; its global sections need not have finite dimension over $bb(Q)_p$. No opposite action is introduced. ◻
]

===== 2.2.1 Normalized division coordinates <normalized-division-coordinates>

Set $q_n = p^n$ and $q_m = p^m$. We begin with the universal cover of a fixed deformation over a bounded
  perfectoid chart. Here the parameters $u_i$ are given; later they will themselves be functions of the tuple of
  division coordinates. In a coordinate reducing to the Honda coordinate,
  the multiplication series of the universal formal group $cal(F)$ satisfies

#[#set math.equation(numbering: n => "(2.9)")
 $ \[ p \]_(cal(F)) \( T \) equiv T^(q_n) med \( mod med \( u_m \, dots.h \, u_(n - 1) \) \) \,
   wide \[ p \]_(cal(F)) \( T \) in A_m \[ \[ T^(q_m) \] \] . $ <eq:tower-series-bounds>]

All coefficients are integral. Thus on a chart on which $max \| u_i \| lt.eq lambda < 1$,
  and for inputs of norm less than one, uniformly on each closed chart of strictly subunit input radius,

$ \| \[ p \]_(cal(F)) \( s \) - s^(q_n) \| lt.eq lambda \,
  wide \| \[ p \]_(cal(F)) \( s \) - \[ p \]_(cal(F)) \( t \) \| lt.eq \| s - t \|^(q_m) . $

The second inequality is a coefficientwise power-series estimate in the coordinate $T^(q_m)$,
  so it also holds for uniform norms over a relative perfectoid affinoid.
  Every fixed-level series evaluation converges on its own chart of radius less than one.
  The coefficientwise Lipschitz constant is one, independently of that radius,
  so these estimates remain uniform when the radii of successive finite approximants tend to one;
  the parameter bound $lambda < 1$ stays fixed.

For a compatible division sequence $\[ p \]_(cal(F)) t_(j + 1) = t_j$, define

#[#set math.equation(numbering: n => "(2.10)")
 $ z = lim_(j arrow.r oo) t_j^(q_n^j) . $ <eq:tower-normalized-limit>]

Consecutive terms differ by at most $lambda^(q_n^j)$; hence this limit converges uniformly.
  Conversely, for $\| z \| < 1$, the formula

#[#set math.equation(numbering: n => "(2.11)")
 $ t_j = lim_(N arrow.r oo) \[ p \]_(cal(F))^N #scale(x: 120%, y: 120%)[\(] z^(1 \/ q_n^(j + N))
   #scale(x: 120%, y: 120%)[\)] $ <eq:tower-inverse-cover>]

converges uniformly: consecutive approximants differ by at most $lambda^(q_m^N)$. The formulas are inverse.
  Indeed, the difference between $t_l$ and $z^(1 \/ q_n^l)$ has norm at most $lambda$,
  and applying $\[ p \]^(l - j)$ bounds the difference at level $j$ by $lambda^(q_m^(l - j))$,
  which tends to zero. This proves both uniqueness and recovery of a given compatible sequence.
  Conversely, for the sequence constructed from a given $z$, finite telescoping gives $\| t_j -
  z^(1 \/ q_n^j) \| lt.eq lambda$, and hence

$ \| t_j^(q_n^j) - z \| lt.eq lambda^(q_n^j) arrow.r 0 . $

Thus the other composite is the identity as well. It also shows that the kernel of projection to $t_0$ is the
  integral Tate module of the étale part: on a perfect geometric fiber,
  the connected torsion has no nonzero points. Projection to $t_0$ is v-locally surjective,
  since the monic division equations admit roots after a finite cover at every level.

We now let the deformation vary with the division tuple. The whole reduced closures of 14 give free polydisc
  coordinates at each finite level; this extra input will identify the completed tower itself.

#thm([Lemma 2.11.])[
  (The analytic étale-marking tower).  #emph[Let $Z_oo^(upright("et"))$ denote the completed perfected tower of
    ordered étale Tate-module markings over $X_m$. There is a relative analytic isomorphism
$ Z_oo^(upright("et")) tilde.eq \( cal(H)_n^r \)_(upright("ind")) \, $

 where independence is fiberwise over $bb(Q)_p$. The isomorphism is equivariant for $G$ and
   $"GL"_r \( bb(Z)_p \)$. It is the restriction of an analytic isomorphism from the completed perfected tower of
   reduced closures $R_(m \, l)$ to the open ball underlying $cal(H)_n^r$.]
] <lem:tower-etale-comparison>

#proof[
  Adjoining the point coordinates to the powered étale coordinates is a pure-root extension by 14;
    it does not change a perfected analytic level. Thus these point coordinates compute the completed étale
    marking tower. Use first the reduced level-$l$ closure in 14.
    Its coordinate ring has regular parameters $t_(1 \, l) \, dots.h \, t_(r \, l)$.
    Two consequences of that proposition are
  #[#set math.equation(numbering: n => "(2.12)")
   $ u_i & in k \[ \[ t_(1 \, 1)^(q_m) \, dots.h \, t_(r \, 1)^(q_m) \] \] \, quad u_i \( 0 \) = 0 \,\
t_(i \, j) & = F_(i \, j \, l) \( t_(1 \, l)^(q_m^(l - j)) \, dots.h \, t_(r \, l)^(q_m^(l - j)) \)
  quad \( j lt.eq l \) \, $ <eq:tower-first-order>]
  with $F_(i \, j \, l)$ integral convergent formal series, without a constant term.
    Formula (2.12) follows also by iterating the second assertion of (2.9) and expressing the base parameters in
    the powered level-$l$ coordinates.
  For $l gt.eq 1$ and $0 < rho < 1$ in the divisible value group, take the closed chart
  $ X_l \( rho \) = { max_i \| t_(i \, l)^(q_n^l) \| lt.eq rho } $
  in the perfected generic fiber of this regular ring. If $lambda = max \| u_i \|$ at a point of this chart,
    then (2.12) and finite telescoping of (2.9) give
  $ lambda lt.eq parallel t_(dot.op \, 1) parallel^(q_m) \, wide parallel t_(dot.op \, 1) parallel lt.eq
    max \( lambda \, rho^(1 \/ q_n) \) . $
  If $lambda > rho^(1 \/ q_n)$ these inequalities would give $lambda lt.eq lambda^(q_m) < lambda$. Therefore
  #[#set math.equation(numbering: n => "(2.13)")
   $ lambda lt.eq rho^(q_m \/ q_n) < 1 . $ <eq:tower-uniform-parameter>]
  For $y_(i \, l) = t_(i \, l)^(q_n^l)$ this yields
  #[#set math.equation(numbering: n => "(2.14)")
   $ parallel y_(dot.op \, l + 1) - y_(dot.op \, l) parallel lt.eq lambda^(q_n^l) lt.eq
     rho^(q_m q_n^(l - 1)) < rho . $ <eq:tower-normalized-error>]
  The finite integral injective transition maps are surjective on these charts.
    To check the radius condition in this assertion, lift a point by lying over in the finite map.
    The bound (2.13) holds at the original point and therefore at its lift;
    (2.14) then forces the lifted normalized coordinate to have norm at most $rho$.
    Consequently pullback on functions is isometric for spectral norms, also after adjoining all $p$-power roots.
  Let $L_rho$ be the completed direct limit of these perfected affinoid algebras.
    The limits $z_i = lim_l y_(i \, l)$ define a map from the perfected radius-$rho$ Gauss algebra to $L_rho$.
    This map is isometric. To see this without inferring it from points,
    take a polynomial $f$ in finitely many $p$-power roots of the variables.
    At every sufficiently late level, $f \( y_(1 \, l) \, dots.h \, y_(r \, l) \)$ has exactly the radius-$rho$
    Gauss norm of $f$: the $t_(i \, l)$ are free regular polydisc coordinates,
    and taking powers followed by perfection does not change the perfected Gauss algebra.
    These evaluations converge to $f \( z_1 \, dots.h \, z_r \)$ in the common spectral norm.
    The limit has the same norm, since the differences eventually have smaller norm than a given nonzero Gauss
    norm. Completion gives the asserted isometry; its image is therefore closed.
  It is surjective as well. For fixed $i \, j$, replace $t_(a \, l)$ in (2.12) by $z_a^(1 \/ q_n^l)$.
    The substituted series converges on the radius-$rho$ polydisc and the error is bounded by
  #[#set math.equation(numbering: n => "(2.15)")
   $ lambda^(q_m^(l - j)) lt.eq rho^(\( q_m \/ q_n \) q_m^(l - j)) arrow.r 0 . $ <eq:tower-surjectivity-error>]
  Thus $t_(i \, j)$ is in the closed image. Taking any fixed $p$-power root in this argument merely takes that
    root of the error bound, so all perfected finite-level generators are in the image.
    They are dense in $L_rho$, proving surjectivity. This establishes inverse affinoid morphisms.
    Varying $rho$ gives the isomorphism of open balls.
  All the preceding estimates are uniform norm estimates for integral series.
    Hence the constructed morphisms commute with bounded base change, glue on overlapping charts,
    and apply with any compact profinite parameter space $cal(D)$ by using the uniform norm on
    $C \( cal(D) \, C^flat \)$. In particular they establish a relative analytic comparison,
    not just a comparison of geometric points.
  The normalized limits respect addition, integral scalar operations, and the full $G$-action.
    For example, replace the deformation addition series by its Honda reduction.
    Their difference on integral inputs has norm at most $lambda$.
    Transporting to a fixed earlier division level contracts this error by $q_m^(l - j)$, exactly as in (2.15).
    The same argument applies to the integral coordinate change associated with $g in G$ and its Honda reduction;
    compact families of $g$ have the same coefficient bounds.
    It applies also to the finite sums defining integral changes of an étale basis.
    Thus the comparison is equivariant for $G$ and $"GL"_r \( bb(Z)_p \)$, continuously in both groups.
  We can now identify the exact-height open. An integral relation among the normalized sections gives,
    by the inverse construction, the same relation among their compatible division sequences:
    if the normalized relation is zero, its point at a fixed earlier level is bounded by $lambda^(q_m^(l - j))$
    for every $l$, and is zero. The converse follows by applying the limit formula.
    Clearing denominators gives the same statement for rational relations.
    Over height exactly $m$, the marked étale Tate module has rank $r$ and its marked basis is independent.
    Over a deeper height its rank is less than $r$, so the compatible tuple is dependent.
    It follows that restricting this analytic isomorphism to the exact-height open gives
  #[#set math.equation(numbering: n => "(2.16)")
   $ Z_oo^(upright("et")) tilde.eq \( cal(H)_n^r \)_(upright("ind")) . $ <eq:tower-etale-independent>]
  Here the ambient analytic morphisms have already been constructed;
    the geometric-point criterion is used only to identify their open subfunctors.
    The original basis condition is open and closed at each finite level above $x eq.not 0$,
    so no additional basis component is lost in this restriction. ◻
]

===== 2.2.2 Subbundles, extensions, and relative frames <subbundles-extensions-and-relative-frames>

#proof[
  #emph[Completion of the proof of 19.] We translate (2.16) into bundle geometry.
    The geometric classification and the relative constant Harder–Narasimhan theorem used in this step are
    #cite(label("farguesScholze2021")) Theorems II.2.14 and II.2.19.
  Let $s_1 \, dots.h \, s_r$ be independent sections of $cal(V)_n$ over a geometric point,
    and let $cal(W)$ be the saturation of their generic span.
    It is generically generated by $cal(O)^r$, so it has no negative-slope quotient:
    a map from $cal(O)$ to a negative-slope bundle is zero. If $b = "rk" cal(W) lt.eq r < n$,
    stability of $cal(V)_n$ gives $deg cal(W) < b \/ n < 1$. Its degree is a nonnegative integer, so it is zero.
    Slope classification now gives $cal(W) tilde.eq cal(O)^b$.
    The map from $cal(O)^r$ to this bundle is a matrix over $bb(Q)_p$.
    Independence forces $b = r$ and the matrix to be invertible onto its image.
    This proves the subbundle assertion over every geometric base curve.
  For a general perfectoid test base $T$, write $X_T$ for its relative Fargues–Fontaine curve and $Y_T$ for the
    covering space with Frobenius quotient $X_T$. Let $i_T : cal(O)^r arrow.r
    cal(V)_n$ be the actual map supplied by the sections. Its dual $i_T^or : cal(V)_n^or arrow.r
    cal(O)^r$ is surjective on every geometric base curve. To see that these curves detect every point,
    take $x in X_T$ and lift it to $y in Y_T$, whose Frobenius quotient is $X_T$.
    Choose a geometric point $"Spa" \( L^sharp \, L^(sharp +) \)$ over $y$.
    The identification $Y_T^diamond.stroked.small = T times "Spd" \( bb(Q)_p \)$ makes its tilt a map
    $"Spa" \( L \, L^(+) \) arrow.r T$. The untilt $L^sharp$ gives a point of $Y_L$ mapping to $y$,
    hence a point of the geometric base curve $X_L$ mapping to $x$ #cite(label("farguesScholze2021")) Definition
    II.1.15 and Propositions II.1.16–II.1.18. Thus at every $x$ some maximal minor of $i_T^or$ is nonzero in the
    residue field: otherwise it would remain zero at the point of $X_L$, contradicting surjectivity there.
    That minor is a unit in the stalk and on a neighborhood, so $i_T^or$ is surjective and splits locally.
    Dualizing makes $i_T$ a locally split injection with locally free cokernel $cal(Q)$.
    Its formation commutes with base change. We have therefore obtained the relative exact sequence
  #[#set math.equation(numbering: n => "(2.17)")
   $ 0 arrow.r cal(O)^r arrow.r cal(V)_n arrow.r cal(Q) arrow.r 0 . $ <eq:tower-bundle-sequence>]
  On each geometric fiber, every slope of $cal(Q)$ is positive:
    a nonpositive-slope quotient would give a forbidden map from the positive stable bundle $cal(V)_n$.
    It has degree one and rank $m$. Each positive basic summand has positive integral degree,
    so there is exactly one such summand, of degree one; hence $cal(Q) tilde.eq cal(V)_m$.
    Thus the already constructed vector bundle $cal(Q)$ has constant basic type.
    The relative classification #cite(label("farguesScholze2021")) Theorem II.2.19(ii),
    including the dual-surjection argument in its proof now supplies its local frames.
  Conversely, an extension
  #[#set math.equation(numbering: n => "(2.18)")
   $ 0 arrow.r cal(O)^r arrow.r cal(E) arrow.r cal(V)_m arrow.r 0 $ <eq:tower-extension>]
  has no negative-slope quotient, by applying the same vanishing of maps separately to the two ends.
    A nonnegative bundle of degree one is positive basic unless it has a quotient $cal(O)$. The connecting map
  $ "Hom" \( cal(O)^r \, cal(O) \) = bb(Q)_p^r arrow.r "Ext"^1 \( cal(V)_m \, cal(O) \) = cal(N)_m $
  sends $\( a_i \)$ to $sum_i a_i xi_i$, where $\( xi_i \)$ is the extension class.
    Since $"Hom" \( cal(V)_m \, cal(O) \) = 0$, a quotient $cal(E) arrow.r
    cal(O)$ exists exactly when this map has a nonzero kernel.
    Thus the middle term is $cal(V)_n$ exactly on $\( cal(N)_m^r \)_(upright("ind"))$.
    Moreover $"Hom" \( cal(V)_m \, cal(O)^r \) = 0$, so an extension with both ends fixed has no nonidentity
    automorphism inducing the identity on the ends. This identifies the extension moduli with a sheaf,
    with no residual automorphism group.
  It remains to show that an actual connected formal marking supplies the claimed quotient frame in families.
    Its recursively monic equations in 12 bound all its coefficients by one on the charts above.
    Its series therefore converges on the open ball and induces a map on universal covers $cal(H)_n arrow.r
    cal(H)_m$. This is a morphism of sheaves of $underline(bb(Q)_p)$-modules, where $underline(bb(Q)_p) \( T \) =
    C^0 \( \| T \| \, bb(Q)_p \)$. Indeed it commutes with addition and the integral scalar operations,
    and multiplication by $p$ is invertible on universal covers.
    It therefore commutes with every constant rational scalar.
    Here is the continuity argument for a varying scalar on the same affinoid perfectoid test object $T$.
    Write this section map as $psi$, fix $v in cal(H)_n \( T \)$, and let $alpha in C^0 \( \| T \| \, bb(Q)_p \)$.
    Compactness gives an integer $a gt.eq 0$ such that $b = p^a alpha$ takes values in $bb(Z)_p$.
    Let $b_k$ be the finite-valued, clopen-constant representative of $b$ modulo $p^k$,
    and put $c_k = \( b - b_k \) \/ p^k$. In the fixed Honda coordinates choose $parallel v parallel lt.eq
    rho < 1$ and $parallel psi \( v \) parallel lt.eq rho' < 1$.
    Integral scalar operations do not increase these norms. Since $\[ p^k \]_(Gamma_j) \( T \) = T^(p^(j k))$,
    the Honda differences satisfy
  $ parallel \[ b \] v -_(Gamma_n) \[ b_k \] v parallel = parallel \[ p^k c_k \] v parallel lt.eq rho^(q_n^k) \,
    wide parallel \[ b \] psi \( v \) -_(Gamma_m) \[ b_k \] psi \( v \) parallel lt.eq \( rho' \)^(q_m^k) . $
  Both bounds tend to zero. On each clopen piece, $psi \( \[ b_k \] v \) = \[ b_k \]
    psi \( v \)$ by constant scalar compatibility. The continuity of $psi$,
    established by the convergent analytic formulas, therefore gives $psi \( \[ b \] v \) = \[ b \] psi \( v \)$.
    Commuting with $p^(- a)$ proves the same identity for $alpha$ on $T$.
    This proves linearity for the topological-field sheaf without changing the test object.
  The marking kills the compatible integral division sections,
    since their images are Honda torsion on a perfect characteristic-$p$ base,
    and hence kills their $bb(Q)_p$-span. The relative section sequence of (2.17) is exact,
    since $H^1 \( cal(O) \) = 0$ as a v-sheaf. Thus $cal(H)_n arrow.r
    H^0 \( cal(Q) \)$ is an epimorphism of $underline(bb(Q)_p)$-module sheaves.
    The map factors through that epimorphism, and its factor remains $underline(bb(Q)_p)$-linear.
  The relative section functor on perfect complexes is fully faithful by #cite(label("anschutzLeBras2025"))
    Corollary 3.11, pp. 3680–3681, applied over the present small v-stack.
    The preceding construction gives a morphism in $D \( T_v \, underline(bb(Q)_p) \)$,
    compatibly on all test bases, with the topological-field convention of that source.
    Positive bundles have no higher relative cohomology sheaves,
    so this statement applies to the ordinary section sheaves just constructed. It gives a unique bundle map
  $ f : cal(Q) arrow.r cal(V)_m . $
  This map is nonzero on every geometric fiber. Indeed, the linear coefficient of the formal marking is nonzero on
    $x eq.not 0$, and on a sufficiently small ball it dominates the higher terms.
    Universal cover projection is locally surjective, so the induced section map is nonzero there.
    Both bundles on a geometric fiber have the same stable basic type,
    whose endomorphisms form a division algebra. Thus $f$ is an isomorphism on every fiber,
    and hence is a relative bundle isomorphism by the same pointwise maximal-minor criterion.
    Full faithfulness and uniqueness make this construction compatible with every base change and with the three
    group actions. This is the needed relative frame construction.
  ===== 2.2.3 The integral height of a frame <the-integral-height-of-a-frame>
  For a frame of $cal(Q)$, use the ordered exact sequence (2.17) to identify $det cal(Q)$ with $det cal(V)_n$,
    and fix the standard identifications $det cal(V)_n tilde.eq cal(O) \( 1 \) tilde.eq det cal(V)_m$.
    The determinant of the frame is then a section of the locally profinite sheaf $underline(bb(Q)_p^times)$.
    Its valuation is a locally constant integer. The reduced-norm valuation
  $ v_p compose "Nrd" : D_m^times arrow.r bb(Z) $
  is surjective and has kernel $P_m$. Therefore frames of any specified height form a $P_m$-torsor, locally nonempty.
  The height of the frame obtained from a connected marking is unchanged by $P_m$.
    An integral étale basis change multiplies the ordered determinant by a unit, so it also preserves this height.
    The height therefore descends from the full marking tower through both marking torsors to $X_m$.
    The domain $X_m$ is connected: it is exhausted by connected annulus-times-polydisc charts with nonempty
    successive intersections; perfection preserves their underlying spaces.
    Hence the descended height is one constant integer $c$.
  Changing the fixed determinant normalization absorbs $c$.
    Over $\( cal(H)_n^r \)_(upright("ind"))$, the connected-marking tower is a $P_m$-torsor,
    and so is the space of quotient frames of this normalized height.
    The frame map is equivariant for that same group. An equivariant map between two torsors for the same group is
    an isomorphism: after a local section of the source, its image is a section of the target,
    and the map becomes the identity on the group coordinate.
    This proves surjectivity onto every frame of the specified height as well as injectivity.
  Finally start with an arbitrary independent extension (2.18).
    Its middle term has type $cal(V)_n$, so its rational frames form a $D_n^times$-torsor.
    The determinant of the framed ends specifies a height for a middle frame.
    Surjectivity of the reduced-norm valuation makes the locus of that height locally nonempty,
    and it is a $P_n$-torsor. A frame in this locus produces (2.17) together with a quotient frame of the
    normalized height. By the preceding paragraph this is precisely a point of $Z_oo$.
    Thus every independent extension occurs and its middle-frame fiber is exactly $G = P_n$.
    Taking the quotient gives (2.7). Integral changes at either end,
    and the ordinary stabilizer on the middle frame, change determinant only by a unit.
    They preserve the selected heights and act by the stated pushout and pullback operations.
    More explicitly, for an extension with maps $\( i \, q \)$,
    postcomposing the connected marking by $a$ changes $q$ to $a q$;
    the resulting class is the pullback along $a^(- 1)$. Under the stated kernel-frame convention,
    $b$ changes $i$ to $i b^(- 1)$ and gives pushout by $b$. These use the covariant Honda action of 18 and
    commute with the middle-frame action. This completes the proof of 19. ◻
]

===== 2.2.4 Transport of supports <transport-of-supports>

For later use we specify the support convention. A compact-support complex is the filtered colimit of restriction
  fibers away from relatively compact quasi-compact bounds.
  Closed boxes can be interleaved with slightly larger open boxes. On $X_m$ one can take

$ epsilon.alt lt.eq \| x \| lt.eq rho < 1 \, wide \| y_i \| lt.eq rho \, $

with separated endpoint radii and with $epsilon.alt arrow.b 0$, $rho arrow.t 1$.
  Supports over a compact profinite parameter space $cal(D)$ must fit one such bound uniformly in $cal(D)$.
  The same convention is used on finite marking covers and on their completed towers.

#thm([Lemma 2.12.])[
  (Compact torsors and support bounds).  #emph[The two compact torsors
$ Z_U med arrow.l med Z_oo arrow.r med \( cal(N)_m^r \)_(upright("ind")) \, wide
  upright("with groups ") U upright(" and ") G \, $

 transport the preceding systems of support bounds cofinally.
   For the characteristic-$p$ function sheaf, and also with uniform compact profinite parameters, descent identifies
#[#set math.equation(numbering: n => "(2.19)")
 $ upright(bold(R)) Gamma #scale(x: 120%, y: 120%)[\(] G \,
   upright(bold(R)) Gamma_c \( Z_U \, cal(O)^flat \) #scale(x: 120%, y: 120%)[\)] tilde.eq upright(bold(R)) Gamma
   #scale(x: 120%, y: 120%)[\(] U \,
   upright(bold(R)) Gamma_c \( \( cal(N)_m^r \)_(upright("ind")) \, cal(O)^flat \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:tower-support-descent>]

 The group cochain terms retain the support convention uniformly in their compact bar parameters.]
] <lem:tower-supports>

#proof[
  After pullback to a perfectoid test space, a torsor for a locally profinite group is represented by a pro-étale,
    universally open v-cover #cite(label("scholzeDiamonds2017")) Lemma 10.13.
    For a profinite group $H$, that lemma presents it as $"proj lim"_K P \/ K$,
    where $K$ ranges over open subgroups and $P \/ K$ is finite étale over the test space.
    Over an affinoid perfectoid test space these finite covers are affinoid,
    and their limit is affinoid perfectoid, hence quasi-compact.
    Quasi-compactness descends from these test covers to the torsor morphism by
    #cite(label("scholzeDiamonds2017")) Proposition 10.11(o).
    Thus the same assertion holds for the locally spatial diamonds here;
    in particular a quasi-compact bound has quasi-compact inverse image.
    Conversely a quasi-compact bound upstairs has a quasi-compact image.
    The chosen increasing, slightly open box exhaustion covers the space;
    any such image has a finite subcover by these boxes and is contained in one larger box.
    The same argument after a finite refinement of charts works on finite covers.
    The actual relative isomorphism of 19 transports all quasi-compact bounds,
    so these observations prove the asserted cofinality on both sides.
    Compact parameter spaces do not change the argument: include the parameter in the quasi-compact bound,
    or use a finite clopen refinement and its uniform norm.
  On an invariant bound, the Čech nerve of a compact-group torsor is its continuous bar construction.
    Supports pull back to the specified inverse-image bound in every degree.
    Every bound upstairs can be enlarged to a bound invariant under both groups:
    its saturation by the compact product $G times U$ is quasi-compact and is contained in a larger bound.
    Descent for the function sheaf and for the restriction fiber therefore gives the continuous group-cochain
    description on these cofinal invariant bounds. The two actions on $Z_oo$ commute,
    so taking first $U$-descent and then $G$-descent, or in the opposite order, gives the same double bar complex.
    The support and sheaf complexes are bounded below. In each total degree only finitely many bar and sheaf
    degrees contribute, and filtered colimits commute with these finite sums and restriction fibers.
    We may consequently pass to the support colimit in the double bar complex, obtaining (2.19).
    This also proves its assertion about all compact bar parameters.
    The noncompact additive cover in (2.6) is not used in this compact-torsor argument;
    supports for that cover are computed separately in Section 3.1, Section 3.2. ◻
]

== 3 Uniform supports and independent tuples <part:supports>

==== 3.1 Kummer calculations with uniform supports <sec:kummer>

To compute supports on the extension-space quotient, we need comparison maps that are uniform as analytic bounds
  and compact parameters vary. The first goal is a bounded Kummer homotopy on nested annuli.
  Disc, affine-line, and shrinking-graph calculations will then give the exact support and neighborhood operations
  used for rank deletion.

This section concerns the #emph[untilted] affine line. Put $C = bb(C)_p$ and let $S =
  "Spa" \( R \, R^(+) \)$ be an affinoid perfectoid space over $C^flat$, with its specified untilt over $C$. Write

$ bb(A)_S = \( bb(A)_C^1 \)^diamond.stroked.small times_("Spd" C) S . $

The sheaf $cal(O)^flat$ on this space assigns to a perfectoid test object its characteristic-$p$ structural ring.
  In particular, it is not the structural sheaf on the perfected characteristic-$p$ affine line.
  The latter appears in 2 and has a different support calculation.
  The identification of the tilted sheaf on perfectoid charts follows from #cite(label("scholzeHodge2013"))
  Definition 5.10 and Lemma 5.11; we use its v-acyclicity in the form #cite(label("scholzeDiamonds2017"))
  Proposition 8.8. The toric Kummer antecedent is #cite(label("scholzeHodge2013")) Example 4.4, Lemma 4.5(i),
  and the proof of Lemma 5.6, with the countable-cover convention of #cite(label("scholzeHodgeCorrigendum2016"))
  item (1). We adapt that construction to relative annuli and prove the uniform support estimates below.

All radii below belong to $\| C^times \|$. Closed inequalities are interleaved with slightly larger open
  inequalities. Thus, for a relative bound $K$ in an open space $X$, the notation

#[#set math.equation(numbering: n => "(3.1)")
 $ upright(bold(R)) Gamma_K \( X \, cal(F) \) = "fib" #scale(x: 120%, y: 120%)[\(] upright(bold(R))
   Gamma \( X \, cal(F) \) arrow.r upright(bold(R)) Gamma \( X \\ K \, cal(F) \) #scale(x: 120%, y: 120%)[\)]
   $ <eq:kum-support-fiber>]

can be computed using separated inner and outer bounds. Compact support means the filtered colimit of these fibers
  over relatively compact bounds. For a relative calculation the bounds are in the affine-line coordinates;
  the base and all compact parameters are retained. These conventions avoid imposing a particular sharp boundary
  at higher-rank points.

===== 3.1.1 Complete coefficient rings and inverse limits <complete-coefficient-rings-and-inverse-limits>

For a compact profinite set $cal(D)$, the ring

$ R_(cal(D)) = C \( cal(D) \, C^flat \) $

is equipped with the supremum norm. More generally we may replace $R$ by $C \( cal(D) \, R \)$.
  This is again a complete uniform perfectoid algebra: Frobenius is bijective, its inverse is continuous,
  and the power-bounded elements are the continuous functions into $R^compose$.
  All Laurent norms used below are supremum norms with coefficients in this ring.
  In particular, a bound for a scalar multiplication operator is automatically uniform in $cal(D)$.

The dense-tower criterion below is a special case of #cite(label("lebras2018"), form: "prose") Proposition 3.5.
  We include the argument to retain uniformity in compact parameters and the degreewise statement for complexes.

#thm([Lemma 3.1.])[
  (Countable Banach inverse limits).  #emph[Let $\( E_j \, f_j \)$ be a countable inverse system of complete
    nonarchimedean normed vector spaces, with continuous linear maps $f_j : E_(j + 1) arrow.r
    E_j$ having dense image. Then $R^1 #h(-0.16667em) "proj lim"_j E_j = 0$.
    The assertion holds after replacing $E_j$ by $C \( cal(D) \, E_j \)$ with its supremum norm for any compact
    profinite $cal(D)$. Consequently a countable inverse system of complexes having this property in each degree
    is computed by its termwise inverse limit.]
] <lem:kum-banach-limits>

#proof[
  The countable derived limit is represented by
  $ product_(j gt.eq 0) E_j arrow.r product_(j gt.eq 0) E_j \,
    wide \( v_j \)_j mapsto \( v_j - f_j \( v_(j + 1) \) \)_j . $
  We prove surjectivity. Given $\( a_j \)_j$, construct finite strings $v_0^(\( h \)) \, dots.h \,
    v_h^(\( h \))$ satisfying $v_j^(\( h \)) - f_j \( v_(j + 1)^(\( h \)) \) = a_j$ for $j < h$.
    Having constructed such a string, use density to choose $v_(h + 1)^(\( h + 1 \))$ so that
  $ e_h = a_h + f_h \( v_(h + 1)^(\( h + 1 \)) \) - v_h^(\( h \)) $
  is as small as desired. Define the earlier terms by the required relations.
    Their changes are $f_j dots.h.c f_(h - 1) \( e_h \)$ for $j < h$ and $e_h$ for $j = h$.
    By continuity of these finitely many maps, choose $e_h$ so small that all those changes have norm at most
    $2^(- h)$. For each fixed $j$ the sequence $v_j^(\( h \))$ is Cauchy.
    Completeness and continuity give limits $v_j$ satisfying every required relation.
  For the assertion with parameters, a continuous map from $cal(D)$ to $E_j$ can be approximated uniformly by a
    map constant on a finite clopen partition. Approximate its finitely many values by images from $E_(j + 1)$.
    Thus $C \( cal(D) \, E_(j + 1) \) arrow.r C \( cal(D) \, E_j \)$ has dense image, and the same proof applies.
    Finally the displayed product complex computes the derived inverse limit degreewise.
    Surjectivity in each degree identifies it with the kernel complex, which is the termwise inverse limit.
    No closed-image assumption is needed. ◻
]

We will also use the elementary countable Milnor exact sequence

#[#set math.equation(numbering: n => "(3.2)")
 $ 0 arrow.r R^1 #h(-0.16667em) "proj lim"_j H^(i - 1) \( E_j^bullet \) arrow.r
   H^i \( upright(bold(R)) #h(-0.16667em) "proj lim"_j E_j^bullet \) arrow.r
   "proj lim"_j H^i \( E_j^bullet \) arrow.r 0 . $ <eq:kum-milnor>]

In particular, a pro-zero cohomology system contributes neither a limit nor a first derived limit.
  Here pro-zero means that for each target index a sufficiently late transition to that index is zero.

===== 3.1.2 A uniform annular homotopy <a-uniform-annular-homotopy>

Choose compatible primitive roots of unity $\( 1 \, zeta_p \, zeta_(p^2) \, dots.h \)$ and let $epsilon.alt in
  cal(O)_(C^flat)^times$ be the corresponding tilted element. Thus $epsilon.alt^sharp = 1$, $epsilon.alt eq.not 1$, and

$ kappa = - log \| epsilon.alt - 1 \| > 0 . $

A choice of this sequence identifies $bb(Z)_p \( 1 \)$ with $bb(Z)_p$;
  it also chooses all the geometric orientation generators in this section.
  We make no arithmetic trivialization assertion.

For $0 < a < b$, let $A_S \[ a \, b \] subset bb(A)_S$ be the relative annulus $a lt.eq \| T \| lt.eq b$.
  Define the complete Laurent algebra

#[#set math.equation(numbering: n => "(3.3)")
 $ M_R \[ a \, b \] = {sum_(u in bb(Z) \[ 1 \/ p \]) c_u T^u : parallel c_u parallel max \( a^u \, b^u \) arrow.r
   0} . $ <eq:kum-annular-algebra>]

The arrow to zero means that only finitely many terms exceed any specified positive norm bound.
  Thus this formula also specifies the meaning of a series whose exponents have unbounded root denominators.

#thm([Proposition 3.2.])[
  (Uniform relative narrowing).  #emph[The Kummer tower on $A_S \[ a \, b \]$ gives a natural complex
#[#set math.equation(numbering: n => "(3.4)")
 $ upright(bold(R)) Gamma \( A_S \[ a \, b \] \, cal(O)^flat \) tilde.eq
   [M_R \[ a \, b \] arrow.r^(gamma - 1) M_R \[ a \, b \]] \, wide gamma \( T^u \) = epsilon.alt^u T^u \,
   $ <eq:kum-difference>]

 in degrees $0 \, 1$. If
#[#set math.equation(numbering: n => "(3.5)")
 $ a < a' < b' < b \, wide a' \/ a gt.eq e^kappa \, wide b \/ b' gt.eq e^kappa \, $ <eq:kum-gap>]

 restriction to $A_S \[ a' \, b' \]$ is chain homotopic to its constant-monomial part.
   It therefore factors through $R \[ 0 \] xor R \[ - 1 \]$ in the derived category.
   The homotopy is bounded, linear over $R$, uniform for every compact profinite parameter,
   and compatible with base change and a translation of the coordinate by a relative section.]
] <prop:kum-annulus>

#proof[
  Adjoin all $p$-power roots of $T$. The resulting perfectoid annulus is a pro-étale $bb(Z)_p \( 1 \)$-torsor over
    $A_S \[ a \, b \]$. Choose compatible roots of the two scalar radii.
    Tilting identifies its structural ring with (3.3), with the same radii:
    the norm of a tilted coordinate equals the norm of its untilt.
    The $h$th term of the torsor nerve is the product of this perfectoid annulus with $bb(Z)_p \( 1 \)^h$.
    Its structural ring is the continuous function ring on that compact parameter space.
    All these objects are affinoid perfectoid and are v-acyclic for $cal(O)^flat$.
    Descent consequently gives continuous group cochains. The two-term completed resolution for $bb(Z)_p$,
    justified for these complete coefficients by 4, gives (3.4).
    Notice that the topology here is the Banach topology, not the discrete topology on the underlying ring.
  For $u eq.not 0$, write $u = p^v m$, where $v in bb(Z)$ and $m$ is an integer prime to $p$. In characteristic $p$,
  $ \| epsilon.alt^u - 1 \| = \| epsilon.alt - 1 \|^(p^v) . $
  For $v gt.eq 0$ this follows from Frobenius and from the unit linear term of $\( 1 + X \)^m - 1$;
    for $v < 0$ take unique $p$-power roots. Since $p^v lt.eq \| u \|_(bb(R))$, we obtain
  #[#set math.equation(numbering: n => "(3.6)")
   $ \| \( epsilon.alt^u - 1 \)^(- 1) \| lt.eq exp \( kappa \| u \|_(bb(R)) \) . $ <eq:kum-denominator>]
  The real absolute value of the exponent is essential in this inequality.
  Let $P_0$ denote projection onto the coefficient of $T^0$.
    Define the degree-$\( - 1 \)$ map from the source complex to the target by
  #[#set math.equation(numbering: n => "(3.7)")
   $ H (sum_u c_u T^u) = sum_(u eq.not 0) frac(c_u, epsilon.alt^u - 1) T^u \, $ <eq:kum-homotopy>]
  on degree one, and set it equal to zero on degree zero. For $u >
    0$ the ratio of the target and source Gauss weights is $\( b' \/ b \)^u lt.eq e^(- kappa u)$.
    For $u < 0$ it is $\( a' \/ a \)^u lt.eq e^(- kappa \| u \|)$.
    These inequalities and (3.6) show that $H$ has operator norm at most one.
    In particular its series converges, including when root denominators are unbounded. Direct calculation gives
  $ \( gamma - 1 \) H + H \( gamma - 1 \) = "res" - P_0 . $
  This is the claimed chain homotopy. Its entries are fixed scalars,
    so it commutes with scalar extension and has the same bound for $C \( cal(D) \, R \)$ coefficients.
    A translation merely replaces $T$ by the translated coordinate before applying the same formula. ◻
]

#prodef([Remark 3.3.])[
  The proposition concerns a map between two annuli. It does not assert that a fixed annulus has
    finite-dimensional cohomology. Small denominators can contribute a large cokernel to $gamma -
    1$ at a fixed radius. The homotopy disposes of these classes only after the specified change of radii.
] <rem:kum-fixed-annulus>

===== 3.1.3 Discs, the line, and its boundary <discs-the-line-and-its-boundary>

Write $D_S \( c \, r \) = { \| T - c \| lt.eq r }$ for a disc about a relative section.
  Pullback from the base and restriction to the section will be called the constant inclusion and evaluation,
  respectively.

#thm([Proposition 3.4.])[
  (Relative line and disc calculations).  #emph[The following statements hold over $S$,
    naturally under base change, with arbitrary retained compact profinite parameters.]
  + #emph[There is a constant $A_p > 1$, depending only on $p$ and the chosen Kummer generator,
    such that for $r_(upright("out")) \/ r gt.eq A_p$ the map
$ upright(bold(R)) Gamma \( D_S \( c \, r_(upright("out")) \) \, cal(O)^flat \) arrow.r
  upright(bold(R)) Gamma \( D_S \( c \, r \) \, cal(O)^flat \) $

 factors through evaluation $R \[ 0 \]$ followed by the constant inclusion. In particular,
$ H^0 \( D_S \( c \, r \) \, cal(O)^flat \) = R \, $

 and
$ "colim"_(r arrow.r 0) upright(bold(R)) Gamma \( D_S \( c \, r \) \, cal(O)^flat \) tilde.eq R \[ 0 \] . $

]
  + #emph[Ordinary and compactly supported cohomology of the line are
#[#set math.equation(numbering: n => "(3.8)")
 $ upright(bold(R)) Gamma \( bb(A)_S \, cal(O)^flat \) tilde.eq R \[ 0 \] \, wide
   upright(bold(R)) Gamma_c \( bb(A)_S \, cal(O)^flat \) tilde.eq R \[ - 2 \] . $ <eq:kum-line-values>]

 For two concentric support discs with a sufficiently large radius ratio,
   the map from the smaller support complex to the larger one has pure degree-two image,
   carried isomorphically into the final compact-support cohomology.
   More precisely, if $A_r$ is the support complex for the disc of radius $r$ and $q_r : A_r arrow.r
   R \[ - 2 \]$ is extension of support to the whole line, the cone of $q_r$ maps cohomologically to zero after
   that fixed enlargement. The required ratio is uniform, also under bounded translations of the centers.]
  + #emph[For $d$ ordered affine coordinates, the ordinary and section-germ complexes are $R \[ 0 \]$,
    and the compact-support complex computed by cofinal boxes is $R \[ - 2 d \]$.
    Maps between box-support bounds have pure degree-$2 d$ image after a fixed enlargement in each coordinate.]
  + #emph[The analogous relative assertions with $bb(F)_p$ coefficients hold with the base complex
    $upright(bold(R)) Gamma \( S \, bb(F)_p \)$ in place of $R$.
    For $S = "Spa" \( C^flat \, cal(O)_(C^flat) \) times cal(D)$ this base complex is
    $C \( cal(D) \, bb(F)_p \) \[ 0 \]$. With the chosen geometric orientations,
    extension of constants identifies these line, section-germ,
    and support computations with the corresponding $R_(cal(D))$ computations above.]
  #emph[The degree-two support class is unchanged by a translation of its section.
    Under inclusion of finitely many disjoint support discs into one larger disc, their degree-two classes add.]
] <prop:kum-line>

#proof[
  We first prove the restriction assertion. By translation take $c = 0$. Set $tau_p = \| p \|^(p \/ \( p - 1 \))$.
    Choose fixed constants $B > e^(2 kappa)$ and $A_p$ sufficiently large that,
    whenever $r_(upright("out")) \/ r gt.eq A_p$, there exists $s in \| C^times \|$ satisfying
  $ r \/ s < tau_p \, wide B s < r_(upright("out")) . $
  Increase $B$ slightly if needed to choose all radii strictly separated.
    Pick $alpha in C$ with $\| alpha \| = s$. Inside $D_S \( 0 \, r_(upright("out")) \)$ there are annuli about
    $alpha$, one contained in the other, satisfying (3.5), such that both contain $D_S \( 0 \, r \)$.
    For example their inner and outer radii may be chosen on opposite sides of $s$,
    each pair separated by a factor exceeding $e^kappa$, with outermost radius below $B s$.
    The restriction between the discs factors through the restriction between these annuli.
    By 23 this factors through $R \[ 0 \] xor R \[ - 1 \]$.
  The degree-one constant summand is the image of the mod-$p$ Kummer cocycle of $T - alpha$, extended to $R$.
    On $D_S \( 0 \, r \)$,
  $ T - alpha = - alpha \( 1 - T \/ alpha \) . $
  Choose a $p$th root of $- alpha$ in $C$. The binomial series for $\( 1 - T \/ alpha \)^(1 \/ p)$ converges
    because $parallel T \/ alpha parallel lt.eq r \/ s < tau_p$;
    this convergence bound is independent of the base. Let $u \( T \)$ be this analytic $p$th root of $T - alpha$,
    and let $U$ denote the first root on the restricted Kummer tower.
    The ratio $U \/ u \( T \)$ is of the form $zeta_p^b$ for a locally constant $bb(F)_p$-valued function $b$ on
    that tower. With the chosen generator, $gamma \( U \) = zeta_p U$, and hence $\( gamma - 1 \) b = 1$.
    Multiplication by this zero-cochain gives an $R$-linear nullhomotopy of the constant degree-one class.
    Thus the summand $R \[ - 1 \]$ maps to zero in the derived category.
    The remaining factorization through $R \[ 0 \]$ is evaluation:
    composing with the section of the smaller disc shows that it agrees with evaluation on the larger disc.
  For completeness, degree-zero sections on a fixed disc already equal $R$. Cover $D_S \( 0 \, r \)$ by
  $ { a lt.eq \| T \| lt.eq r } \, wide { a lt.eq \| T - alpha \| lt.eq r } \, quad 0 < a < r \,
    quad \| alpha \| = r . $
  These annuli cover because the two omitted small discs are disjoint.
    In the complex (3.4) the kernel is exactly $R$: every nonzero diagonal multiplier is an invertible scalar.
    The intersection contains a constant section $T = beta$ with $\| beta \| = \| beta - alpha \| = r$,
    chosen using the infinite residue field of $C$. Hence two annular constants that agree on the intersection are
    equal in $R$. Sheaf descent proves the assertion for the disc.
    The restriction factorization and exactness of filtered colimits now prove the shrinking-germ statement in (i).
  Choose an expanding sequence of closed discs covering the line, with successive radius ratios at least $A_p$.
    Sections on this open exhaustion are the derived inverse limit of their section complexes;
    using slightly enlarged open discs gives the same limit. By (i),
    its degree-zero cohomology system is the constant system $R$, and every positive-degree system is pro-zero.
    Equation (3.2) proves the first assertion of (3.8).
  We next compute the germ of the exterior. Let $E_S \( r \) = { \| T \| > r }$.
    The Kummer tower identifies its section complex with
  #[#set math.equation(numbering: n => "(3.9)")
   $ [M_R \( r \, oo \) arrow.r^(gamma - 1) M_R \( r \, oo \)] \, $ <eq:kum-exterior>]
  where the coefficient ring consists of Laurent series converging on every closed annulus contained in $r < \|
    T \| < oo$. To justify this assertion, exhaust $E_S \( r \)$ by a countable increasing sequence of closed
    annuli. Their coefficient restriction maps have dense image,
    since finite Laurent polynomials with bounded root denominator occur on every such annulus and are dense on
    each target. Apply 22 to the two terms of (3.4). This gives exactly (3.9),
    with its complete family of Gauss seminorms. The same argument works with compact parameters.
  For $r' > e^kappa r$, division by nonzero $epsilon.alt^u -
    1$ defines a homotopy from (3.9) at $r$ to that at $r'$. For negative exponents the increased inner radius
    absorbs (3.6). For positive exponents, to bound a target seminorm with outer radius $b$,
    use the source seminorm with outer radius larger than $e^kappa b$;
    such a seminorm is available because the outer radius is unbounded.
    Thus the homotopy is continuous and factors restriction through the constant copies in degrees zero and one.
    We conclude that
  #[#set math.equation(numbering: n => "(3.10)")
   $ "colim"_(r arrow.r oo) upright(bold(R)) Gamma \( E_S \( r \) \, cal(O)^flat \) tilde.eq R \[ 0 \] xor
     R \[ - 1 \] . $ <eq:kum-exterior-germ>]
  The map from ordinary sections of the line is the identity on the first summand.
    Its fiber is $R \[ - 2 \]$, proving (ii). Moreover the homotopy preserves the constant inclusion from ordinary
    sections. Taking its fiber proves the asserted pure image statement for maps between support bounds,
    before taking their final colimit. Explicitly, the boundary of the constant exterior cocycle gives a section
    $s_r : R \[ - 2 \] arrow.r A_r$ of $q_r$. The fiber homotopy identifies a sufficiently separated transition
    $A_r arrow.r A_(r')$ with $s_(r') q_r$. With the splitting $A_r tilde.eq R \[ - 2 \] xor "fib" \( q_r \)$,
    the transition is the identity on the first summand and zero on the second.
    This proves the assertion about the cones as well.
  Here is an explicit normalization of the support generator.
    The constant degree-one Kummer cocycle of $T - c$ on an exterior of $c$ maps, under the boundary map in (3.1),
    to the section-support class. For two bounded sections $c \, c'$ and a sufficiently large exterior,
    the quotient $\( T - c' \) \/ \( T - c \)$ has a $p$th root: its difference from $1$ has norm below $tau_p$.
    Their Kummer cocycles therefore agree there. This proves translation invariance and shows that every
    section-support class maps to the same generator in (3.8).
    Excision for a finite disjoint union of discs gives a direct sum of support complexes.
    The map from that direct sum to a common enlarged bound consequently sums the section generators.
  The arguments so far are relative: after a further affinoid perfectoid base change all formulas are unchanged.
    They therefore identify the relative section, germ, and support complexes as sheaves on the base v-site.
    Apply them successively in ordered coordinates. The finite box-support diagram is the iterated fiber of the
    restriction maps in those coordinates; finite fibers commute,
    and the one-coordinate constant inclusions and Kummer classes commute with every remaining coordinate
    restriction. The resulting complex is the tensor product of $d$ copies of $R \[ - 2 \]$,
    namely $R \[ - 2 d \]$. The same argument with evaluation gives ordinary and section-germ complexes
    $R \[ 0 \]$. Taking a fixed sufficient radius ratio in each coordinate gives the uniform pure-image statement
    in (iii). This verifies the product assertion using the actual box fibers,
    without assuming a compact-support comparison for arbitrary analytic coefficient sheaves.
  Finally use the absolute Artin–Schreier sequence on the v-site,
  #[#set math.equation(numbering: n => "(3.11)")
   $ 0 arrow.r bb(F)_p arrow.r cal(O)^flat arrow.r^(f mapsto f^p - f) cal(O)^flat arrow.r 0 . $ <eq:kum-as>]
  It is exact because its equation is solved by a finite étale cover on every characteristic-$p$ perfectoid chart.
    This is also the sequence used in #cite(label("scholzeHodge2013")) proof of Theorem 5.1, p. 47.
    The constant inclusions, evaluations, and chosen Kummer classes are compatible with this sequence.
    On the Laurent complexes this compatibility is explicit: Frobenius sends $c_u T^u$ to $c_u^p T^(p u)$,
    projection onto the constant term commutes with it, and the homotopy does too, since
  $ \( epsilon.alt^u - 1 \)^p = epsilon.alt^(p u) - 1 . $
  Taking the fiber of Frobenius minus the identity in the preceding relative computations therefore gives the
    corresponding base complex $upright(bold(R)) Gamma \( S \, bb(F)_p \)$, with the same shifts.
    Finite fibers commute with the filtered colimits used here.
  If $R = R_(cal(D))$, Frobenius minus the identity is surjective on $R$.
    Indeed the Artin–Schreier map on $C^flat$ has a continuous inverse branch on a sufficiently small ball about
    each point of its target. A finite clopen refinement of $cal(D)$ permits a continuous choice of these
    branches. The kernel is $C \( cal(D) \, bb(F)_p \)$, whose functions have finite image. This proves (iv).
    For a general affinoid perfectoid base we have kept the base complex,
    and have not asserted this global surjectivity. The finite-$p$ affine-line calculation also agrees with the
    direct Kummer computation in #cite(label("achingerGillesNiziol2025")) Example 2.19, proof of Lemma 2.20,
    Equation (2.22). ◻
]

#prodef([Remark 3.5.])[
  (Uniformity before a finite sum).  All support and restriction comparisons in 25 are made before any sum over
    translated centers. On finitely many relative charts, choose the largest required radius ratio.
    The same homotopies then apply with an additional compact parameter and to every translated chart.
    A map that is zero on a geometric cohomology row remains zero after a finite sum of its translated maps.
    Thus the estimates are available before the finite coset grouping that produces corestriction in 2.
] <rem:kum-before-sum>

===== 3.1.4 Shrinking supports along a closed graph locus <shrinking-supports-along-a-closed-graph-locus>

There are three different systems in use. Shrinking #emph[neighborhood germs] use restriction and a filtered
  colimit. Enlarging compact supports uses maps from smaller support to larger support and another filtered
  colimit. Shrinking the support bounds toward a closed locus uses those same support maps as an inverse system.
  The following result records the last operation separately.

#thm([Lemma 3.6.])[
  (Low degrees of shrinking graph supports).  #emph[Let $X$ be a bounded relative chart in an untilted affine
    space over a base v-sheaf $B$, with a slightly larger chart available for collars,
    and let $Z subset X$ be closed. Assume the following conditions on this fixed bound.]
  + #emph[After a finite cover of a slightly enlarged base bound by qc charts,
    $Z$ has a cofinal decreasing sequence of neighborhoods $T_j$, each a finite disjoint union of relative discs,
    or of boxes in at least one normal affine coordinate. Their centers are actual analytic sections on those charts.]
  + #emph[On each chart, the clusters of $T_(j + 1)$ refine those of $T_j$,
    and a fixed further refinement $j mapsto j + N$ puts every child cluster in its parent with the radius ratio
    required in 25. The same $N$ works for every $j$, for all compact parameters,
    and on the finitely many support shells used for excision.]
  + #emph[The cluster bounds have separated outer collars inside the enlarged output chart.
    Their intersection is $Z$, and their complements admissibly exhaust $X \\ Z$.]
  #emph[For $cal(F) = cal(O)^flat$ or $bb(F)_p$, put
$ E_j = "fib" #scale(x: 120%, y: 120%)[\(] upright(bold(R)) Gamma \( X \, cal(F) \) arrow.r
  upright(bold(R)) Gamma \( X \\ T_j \, cal(F) \) #scale(x: 120%, y: 120%)[\)] . $

 The inverse systems $H^0 \( E_j \)$ and $H^1 \( E_j \)$ are pro-zero.
   The same assertion holds relatively on the base and with compact parameters.
   Consequently the complex with support in $Z$ has no cohomology in degrees zero or one,
   and deletion of $Z$ preserves relative degree-zero sections.
   These conclusions hold also after a bounded-below descent calculation for which the finite chart refinements
   above can be made in each fixed total degree.]
  #emph[For a closed locus $Z subset Y$ in a possibly unbounded relative untilted affine space,
    the same low-degree support vanishing and degree-zero deletion statement hold if $Y$ has a compatible
    countable admissible exhaustion by interleaved bounds $X_a$ on which these hypotheses hold for $Z ∩ X_a$.
    The tube systems and their required refinements may depend on $a$.]
] <lem:kum-low-support>

#proof[
  The map $E_(j + N) arrow.r E_j$ goes from a smaller support bound to a larger one.
    Excision inside the separated collars identifies it with a finite sum of maps from the support in child discs
    to the support in their parent discs. To see the excision used here directly,
    cover an ambient chart by a neighborhood of its support and the complement of a slightly smaller support
    bound. The Mayer–Vietoris square identifies the two corresponding fibers in (3.1).
    Interleaving the inner and outer bounds yields the stated collar excision.
    It is compatible with restriction on the base and with a further finite cluster refinement.
  By 25, after the fixed radius change each child-to-parent map has pure geometric support image in degree at
    least two. The estimate is uniform before the finite sum, by 26.
    Thus it induces zero on geometric cohomology in degrees zero and one.
    For $bb(F)_p$ the base complex in 25(iv) is connective, so its shift by a support degree of at least two has
    the same low-degree vanishing. This proves the pro-zero assertion locally over the base.
  We spell out its passage through descent. Use a qc covering diagram in each cosimplicial degree.
    Fix a total degree $i$. Because the geometric complexes are bounded below by zero,
    only cosimplicial degrees at most $i + 1$ can affect the vanishing in degrees up to $i$ and its comparison
    map. Make the finitely many required chart and collar refinements in these degrees simultaneously.
    The spectral sequence obtained by first taking geometric cohomology has zero transition on the relevant
    low-degree rows. If necessary repeat the fixed refinement once for each filtration piece.
    A map zero on associated graded pieces lowers the finite filtration,
    so this finite composite is zero on the required total cohomology.
    Hence the total degree-zero and degree-one systems are pro-zero as claimed.
    This argument uses no common refinement for all degrees of an unbounded descent diagram.
  By (c), sections on $X \\ Z$ are the derived inverse limit of sections on the increasing complements $X \\ T_j$.
    Finite fibers commute with this limit, so
  #[#set math.equation(numbering: n => "(3.12)")
   $ upright(bold(R)) Gamma_Z \( X \, cal(F) \) tilde.eq upright(bold(R)) #h(-0.16667em) "proj lim"_j E_j .
     $ <eq:kum-closed-support-limit>]
  All $E_j$ are connective. In (3.2), the limit and first derived limit of the pro-zero low-degree systems vanish.
    This proves $H^0 upright(bold(R)) Gamma_Z = H^1 upright(bold(R)) Gamma_Z = 0$.
    No surjectivity assertion about the possibly large degree-two system is needed.
    Finally the long exact sequence for (3.1), with $Z$ in place of $K$,
    identifies degree-zero sections before and after deletion.
    The same proof applies to every retained compact parameter,
    since all radius bounds and finite sums were uniform in it.
  For the last assertion use the interleaved open bounds of the exhaustion and put
  $ C_a = upright(bold(R)) Gamma_(Z ∩ X_a) \( X_a \, cal(F) \) . $
  These support complexes have canonical restriction maps as $a$ varies,
    independently of the tube choices used to compute each one.
    The fixed-bound argument gives $H^0 \( C_a \) = H^1 \( C_a \) = 0$, and each $C_a$ is connective.
    Both $X_a$ and $X_a \\ Z$ admissibly exhaust $Y$ and $Y \\ Z$, respectively.
    Taking their section limits and commuting finite fibers with the derived inverse limit gives
  $ upright(bold(R)) Gamma_Z \( Y \, cal(F) \) tilde.eq upright(bold(R)) #h(-0.16667em) "proj lim"_a C_a . $
  The Milnor sequence again gives zero in degrees zero and one:
    the relevant ordinary limits and $"proj lim"^1 H^0 \( C_a \)$ are all zero.
    This uses the already formed support complexes $C_a$; it requires no common tube depth for the different
    output bounds. ◻
]

#prodef([Remark 3.7.])[
  The fixed-bound hypotheses of 27 will be verified in 31. There a fixed lattice in the space of possible
    relations indexes the clusters at every depth. Multiplication by $p$ rescales their centers and supplies the
    fixed rescaling in (b). The lattice and its relation coordinates are defined in that argument.
    The ordinary-function calculation then uses the separate exhaustion assertion of the lemma to increase the
    output bound. In particular, the lemma does not identify restriction of an arbitrary v-sheaf to a closed
    analytic locus with germs of neighborhoods.
] <rem:kum-tube-interface>

==== 3.2 Compact supports on independent extension tuples <sec:independent-tuples>

Fix $m gt.eq 1$, and fix an embedding in $C = bb(C)_p$ of the unramified extension $F_m \/ bb(Q)_p$ of degree $m$.
  In this section write

$ cal(N)_m = bb(G)_(a \, C)^diamond.stroked.small \/ underline(F_m) \, wide
  Y_s = \( cal(N)_m^s \)_(upright("ind")) \, wide Y_0 = "Spa" \( C^flat \) . $

Here independence means $bb(Q)_p$-linear independence on every geometric fiber.
  This is the additive presentation of the negative Banach–Colmez space in 19;
  an action on $cal(N)_m$ need not lift to a linear action on the displayed untilted affine coordinate.
  We will use the natural commuting actions of $P_m$ and $M_s = "GL"_s \( bb(Z)_p \)$ on $Y_s$.

All cohomology is on the $v$-site. We use the support convention of 1:
  for an increasing, interleaved system of quasicompact bounds $K subset.double X$,

#[#set math.equation(numbering: n => "(3.13)")
 $ upright(bold(R)) Gamma_c \( X \, cal(E) \) = "colim"_K "fib" #scale(x: 120%, y: 120%)[\(] upright(bold(R))
   Gamma \( X \, cal(E) \) arrow.r upright(bold(R)) Gamma \( X \\ K \, cal(E) \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:ind-support-convention>]

Bounds may be replaced by slightly smaller closed and slightly larger open bounds.
  In particular, the formula does not require a choice at a higher-rank boundary point.
  The sheaf $cal(E)$ will be either $bb(F)_p$ or $cal(O)^flat$.

A compact profinite parameter space $cal(D)$ is retained throughout each support calculation.
  Supports are uniform in this parameter. Set

$ R_(cal(D)) = C \( cal(D) \, C^flat \) \, wide E_(cal(D)) = C \( cal(D) \, bb(F)_p \) . $

The second ring consists of locally constant functions. The first is equipped with its supremum norm.
  When $cal(D)$ is infinite, finiteness over $R_(cal(D))$ will never mean finite dimension over $C^flat$.

===== 3.2.1 The translation quotient and its support maps <the-translation-quotient-and-its-support-maps>

We first compute the space before deleting dependent tuples.
  The noncompactness of $F_m$ makes it necessary to keep track of the support in the quotient.

#thm([Lemma 3.8.])[
  (Lattice transitions).  #emph[Let $L$ be a lattice of rank $e$ in a finite-dimensional $bb(Q)_p$-vector space,
    and let $L' = p^(- 1) L$. With trivial characteristic-$p$ coefficients,
    continuous cohomology is the exterior algebra on $"Hom"_(upright("cts")) \( L \, bb(F)_p \)$.
    Under the identifications from a lattice basis,]
  + #emph[restriction from $L'$ to $L$ is zero in positive degrees and is the identity in degree zero;]
  + #emph[corestriction from $L$ to $L'$ is zero in degrees less than $e$ and identifies the top-degree
    orientation lines.]
  #emph[The assertions hold with coefficients $R_(cal(D))$ and with relative base complexes in place of $bb(F)_p$.]
] <lem:ind-lattice-transitions>

#proof[
  A completed Koszul resolution on the $e$ commuting generators of $L$ computes its continuous cohomology.
    With trivial coefficients its differentials vanish, giving the asserted exterior algebra.
    One can compute the maps first over $bb(Z)_p$. If a basis of $L'$ is $v_1 \, dots.h \, v_e$,
    then a basis of $L$ is $p v_1 \, dots.h \, p v_e$. Restriction in degree $i$ is multiplication by $p^i$ on the
    corresponding exterior basis. The identity $"res" "cor" = \[ L' : L \] =
    p^e$ and torsion-freeness then give multiplication by $p^(e - i)$ for corestriction.
    Reducing modulo $p$ proves both assertions. The same finite Koszul complexes,
    tensored with $R_(cal(D))$ or with a base complex, compute the relative assertions.
    Thus no infinite product of coefficient spaces is introduced in this computation. ◻
]

#thm([Proposition 3.9.])[
  (The whole extension space).  #emph[For every $s gt.eq 0$ there are natural comparisons
#[#set math.equation(numbering: n => "(3.14)")
 $ upright(bold(R)) Gamma_c \( cal(N)_m^s times underline(cal(D)) \, bb(F)_p \) & tilde.eq
   E_(cal(D)) \[ - \( m + 2 \) s \] \,\
upright(bold(R)) Gamma_c \( cal(N)_m^s times underline(cal(D)) \, cal(O)^flat \) & tilde.eq
  R_(cal(D)) \[ - \( m + 2 \) s \] . $ <eq:ind-whole-fp>]

 A geometric Kummer orientation is understood. The comparison from the first formula to the second is extension of
   constants. It is compatible with continuous compact families of automorphisms and with all the support and
   lattice maps used below.]
] <prop:ind-whole>

#proof[
  Consider first $s = 1$. Let $D_a$ be the closed disc of radius $R_a =
    R_0 \| p \|^(- a)$ in the untilted affine line, and put
  $ L_a = { b in F_m : \| b \| lt.eq R_a } \, wide B_a = "image" \( D_a arrow.r cal(N)_m \) . $
  Choose $R_0$ between adjacent nonzero norm values of $F_m$ and interleave these discs with slightly larger ones.
    Then $L_(a + 1) = p^(- 1) L_a$, the $B_a$ exhaust the quotient, and these bounds are cofinal for (3.13).
    Indeed every point has a representative of finite norm, and every quasicompact bound is contained in one of
    the increasing slightly-open images.
  The inverse image of $B_a$ in the affine line is
  $ product.co_(b in F_m \/ L_a) \( D_a + b \) . $
  The displayed pieces are disjoint and locally finite: on any bounded disc only finitely many cosets occur.
    Consequently sections with this support form the product of the sections with the indicated disc supports.
    With the translation action this is the continuous coinduction from $L_a$.
    This assertion also applies to derived sections: on bounded charts it is finite disjoint excision,
    and an increasing exhaustion gives the displayed product.
    Descent through the translation torsor and Shapiro’s map therefore identify the quotient-support complex with
  #[#set math.equation(numbering: n => "(3.15)")
   $ upright(bold(R)) Gamma #scale(x: 120%, y: 120%)[\(] L_a \,
     upright(bold(R)) Gamma_(D_a) \( bb(G)_(a \, C)^diamond.stroked.small \, cal(E) \)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:ind-shapiro-support>]
  Here Shapiro’s map can be read directly on the bar complexes:
    choose the continuous coset section for the open subgroup $L_a subset
    F_m$ and insert the chosen representatives. The inverse inserts the same representatives in the coinduced
    function. Their homotopies are the usual insertion homotopies.
    Thus this use of Shapiro does not impose compact inverse image support under the noncompact translation cover.
    After Shapiro all bar parameters belong to compact powers of $L_a$.
  Put $A_a = upright(bold(R)) Gamma_(D_a) \( bb(G)_(a \, C)^diamond.stroked.small \, cal(E) \)$. The canonical maps
  $ A_a arrow.r upright(bold(R)) Gamma_c \( bb(G)_(a \, C)^diamond.stroked.small \, cal(E) \) tilde.eq
    cal(E)_(upright("base")) \[ - 2 \] $
  are the oriented comparison maps of 25. Their cones become cohomologically zero under a sufficiently large fixed
    ratio of support radii. This holds before group cohomology, with arbitrary compact parameters.
    To use it in (3.15), first enlarge the geometric disc while retaining the smaller group $L_a$.
    The cone map is zero on the geometric cohomology rows with parameters $L_a^j$.
    Only afterwards group the translated copies in a larger disc.
    Each grouping is a finite sum, indexed by the appropriate lattice quotient,
    and hence preserves the vanishing of the cone map on those rows.
    This order avoids any requirement that a chosen representative of a Kummer class remain invariant when its
    center lies near the new boundary.
  Under increasing $a$, the old disc supports inside a new disc are indexed by $L_(a') \/ L_a$.
    The support map is the sum of their translated extension-of-support maps.
    On the oriented base classes it is precisely corestriction. We therefore obtain
  #[#set math.equation(numbering: n => "(3.16)")
   $ upright(bold(R)) Gamma_c \( cal(N)_m \, cal(E) \) tilde.eq "colim"_(a \, thin "cor") upright(bold(R))
     Gamma \( L_a \, cal(E)_(upright("base")) \) \[ - 2 \] . $ <eq:ind-quotient-corestriction>]
  To justify the comparison on total complexes, fix a total degree.
    The geometric and positive bar complexes are uniformly bounded below, so only finitely many bar degrees enter.
    Take a common radius enlargement in those degrees. The cone has zero colimit on every relevant geometric row,
    and the resulting spectral sequence gives zero colimit in that total degree.
    Filtered colimits are exact on the underlying vector spaces.
    Thus this reasoning proves (3.16) without interchanging an uncontrolled limit and an unbounded totalization.
  29 leaves only the degree-$m$ orientation line in (3.16). This proves the case $s = 1$.
    For $s$ coordinates use product boxes in the affine space and the lattice $L_a^s$ of rank $m s$.
    Product boxes with a common increasing bound are cofinal.
    The product Kummer calculation gives degree $2 s$, and the same lattice calculation leaves degree $m s$,
    proving both displayed formulas.
  All these calculations are relative. On an arbitrary perfectoid base the phrase “base class” means its base
    complex, not that arbitrary perfectoid bases have acyclic $bb(F)_p$-cohomology.
    For the external base $underline(cal(D)) times "Spa" \( C^flat \)$ these base complexes are $E_(cal(D))$ and
    $R_(cal(D))$, respectively, by 25. The Kummer operators are linear over the retained coefficient ring and
    their bounds are independent of the compact parameter. This proves the parameter assertion and its
    compatibility with extension of constants. The constructions use canonical restriction and support maps,
    so their identifications are natural under compact continuous families of automorphisms. ◻
]

===== 3.2.2 Persistent lattices and graph neighborhoods <persistent-lattices-and-graph-neighborhoods>

We now give the uniform neighborhood construction used for rank deletion.
  Its persistence under all further refinements is needed both for compact supports and, later, for ordinary functions.

#thm([Proposition 3.10.])[
  (Uniform graph tubes).  #emph[Let a quasicompact perfectoid chart over $C^flat$ carry untilted coordinates
    $z_1 \, dots.h \, z_t$ whose classes in $cal(N)_m$ are independent.
    Restrict to a bounded part of this chart and to a compact open slope patch in $bb(Q)_p^t$.
    After a finite refinement of the base by quasicompact charts,
    the following constructions are available on each member of the refinement.]
  + #emph[There are radii $0 < alpha < beta$ and a fixed lattice $L subset bb(Q)_p^t xor F_m$ such that,
    on every geometric fiber,
#[#set math.equation(numbering: n => "(3.17)")
 $ L = { w : \| ell_z \( w \) \| lt.eq alpha } = { w : \| ell_z \( w \) \| < beta } \, wide ell_z \( a \, b \) =
   sum_i a_i z_i + b . $ <eq:ind-persistent-lattice>]

 The same base chart has lattice $p^j L$ for the radii $alpha \| p \|^j$ and $beta \| p \|^j$, for every integer $j$.]
  + #emph[Write $L_a = "pr"_(bb(Q)_p^t) \( L \)$ and $L_b = L ∩ F_m$.
    At every sufficiently large $j$, the slope patch is a finite union of $p^j L_a$-cosets.
    Its graph in $cal(N)_m$ has disjoint tubular neighborhoods indexed by those cosets.
    Each tube is the image of an actual relative disc, centered at a section $sum_i a_i
    z_i$ for a constant representative $a$, modulo the compact translation lattice $p^j L_b$.]
  + #emph[The closed tubes of radius $alpha \| p \|^j$ and the open tubes of radius $beta \|
    p \|^j$ are interleaved and cofinal among neighborhoods of the graph family.
    The construction works on a slightly enlarged independent-base bound and on its support collars,
    and it retains an arbitrary compact profinite parameter $cal(D)$.]
  #emph[For finitely many added coordinates and compact open patches of matrices of slopes,
    take products of these constructions. Their finite base refinements can be chosen simultaneously.]
] <prop:ind-tubes>

#proof[
  Let $E = bb(Q)_p^t xor F_m$, endowed with a fixed $bb(Q)_p$-norm.
    Independence says that $ell_z : E arrow.r C'$ is injective at each geometric point with untilt field $C'$.
    Its unit sphere is compact. On a bounded base chart there is a uniform upper bound $\| ell_z \( w \) \| lt.eq
    M parallel w parallel$. At a fixed geometric point there is also a positive lower bound on the unit sphere.
    Choose a sufficiently fine finite net in that sphere. The upper bound shows that the error in replacing a
    coefficient by a net point is smaller than the chosen lower bound.
    Thus finitely many strict analytic inequalities on those net points give the same lower bound on an open base
    neighborhood. Quasicompactness gives a finite refinement with uniform bounds
  #[#set math.equation(numbering: n => "(3.18)")
   $ c parallel w parallel lt.eq \| ell_z \( w \) \| lt.eq M parallel w parallel \, wide
     c > 0 . $ <eq:ind-uniform-norm>]
  One may refine by rational charts after introducing the strict margins.
    A strict rank-one inequality persists at all the higher-rank points in such a chart,
    which is why interleaved radii are used.
  At one geometric point choose a compact coefficient annulus large enough to contain all coefficients whose
    images could have norm near a proposed radius. This is possible by (3.18).
    On this annulus the image avoids zero. The nonarchimedean norm is locally constant away from zero;
    hence it takes only finitely many values on the compact annulus.
    Choose $alpha < beta$ in a gap between those values. The preimage of the disc is an open compact additive
    subgroup of $E$, and therefore a lattice $L$. A finite coefficient net on the annulus,
    with the upper bound in (3.18), makes the inequalities defining this same $L$ persist on an open base
    neighborhood. Outside the annulus the upper and lower bounds already determine membership.
    Taking a finite base refinement proves (3.17) on the entire refined chart.
    Finally $ell_z \( p^j w \) = p^j ell_z \( w \)$, proving persistence for every depth on the same chart.
  Both $L_a$ and $L_b$ are lattices. In addition, the exact sequence
  $ 0 arrow.r L_b arrow.r L arrow.r L_a arrow.r 0 $
  splits as a sequence of finite free $bb(Z)_p$-modules. Fix such a splitting once on the chart.
    Its $F_m$-component gives a continuous translation choice for every member of a slope cluster.
    In particular, if $a' - a in p^j L_a$, there is $b in F_m$ with $\( a' - a \, b \) in p^j L$, so that
  $ lr(|sum_i \( a'_i - a_i \) z_i + b|) lt.eq alpha \| p \|^j . $
  Thus the graph of that entire slope coset lies in the tube centered at $sum_i a_i z_i$.
    The splitting ensures this assertion holds for the relative family, not only on individual fibers.
  Conversely, two such quotient tubes of open radius $beta \| p \|^j$ can intersect only if, for some $b in F_m$,
    $\| ell_z \( a - a' \, b \) \| < beta \| p \|^j$. By (3.17) this forces $a - a' in p^j L_a$.
    Distinct slope cosets therefore give disjoint tubes. The stabilizer of any one covering disc is ${ b in
    F_m : \| b \| < beta \| p \|^j } = p^j L_b$, with the same group for the closed radius.
    Its full inverse image under the translation cover is the disjoint union indexed by $F_m \/ p^j L_b$.
  Because the slope patch is compact and open, it is a finite union of $p^j
    L_a$-cosets for every sufficiently large $j$. Choose representatives at each depth.
    If a refined representative lies over a coarser one, the splitting just chosen supplies a constant translation
    making its disc lie in the coarser disc. Thus all maps between the tubes are maps between actual relative
    analytic discs. On passing to the quotient they are independent of that translation choice.
    For a child disc, the ultrametric inequality also permits its parent disc to be centered at the child’s
    section without changing the parent disc: the two centers differ by at most the parent radius.
    Thus the child-to-parent maps are the concentric support maps of 25.
    Taking a fixed number of further depths makes their radius ratio at least the constant required there.
  We spell out neighborhood cofinality. A rational neighborhood of an analytic section contains a relative disc of
    some positive radius around that section after a quasicompact base refinement.
    Indeed write its finitely many defining inequalities using an analytic denominator.
    On a suitable base chart that denominator has a positive lower norm bound along the section.
    Taylor estimates on a bounded ambient disc bound all the changes in the numerators and denominator by a
    constant times the distance to the section. For a sufficiently small radius,
    the denominator keeps its norm and the defining inequalities remain true, by the ultrametric inequality.
    This argument also works when an inequality holds with equality at the section.
  Apply this observation to an open neighborhood of the compact graph family.
    The product of a quasicompact base chart and a compact profinite coefficient patch is quasicompact;
    its topology has the usual basis of base opens and clopen parameter patches.
    A finite refinement therefore supplies finitely many positive disc radii.
    A sufficiently deep common $p^j L$-refinement, and the smaller of those finitely many radii,
    put all its tubes in the given neighborhood. Their intersection is exactly the graph:
    by (3.18), a bounded convergent sequence of centers has a convergent coefficient subsequence,
    and the coefficient patch is closed. This proves both cofinality and the intersection assertion.
  For support fibers, make this construction first on a slightly larger independent-base bound and on the finitely
    many rational pieces of its intervening collars. These bounds retain the strict lower bound in (3.18).
    The first $t$ tuple coordinates are unchanged by forming a normal tube,
    so the tubes remain in the rank-at-least-$t$ locus. Bounded matrix slopes bound all remaining tuple
    coordinates. Consequently product bounds in the base and the compact slope patch are cofinal with the tuple
    bounds in this chart. Conversely, a tuple bound separated from lower rank has an independent-base bound of
    this form, by (3.18). This proves the assertion about collars and supports.
  Finally an external compact parameter may be included in the base chart and in its supremum norm,
    or treated by finite clopen refinement. All finite-net estimates retain the same bounds.
    Products use finitely many copies of $E$; taking common refinements and the maximum of finitely many required
    radius losses proves the last assertion. ◻
]

===== 3.2.3 Rank deletion with neighborhood germs <rank-deletion-with-neighborhood-germs>

For $0 lt.eq t lt.eq s$ let $X_(s \, gt.eq t) subset cal(N)_m^s$ be the locus of rank at least $t$,
  and let $Z_(s \, t)$ be its rank-$t$ locus. The latter is closed in $X_(s \, gt.eq t)$:
  dependence can be tested on projective coefficient directions, which form a compact $bb(Q)_p$-space.
  On a bounded chart the graph inequalities in 31 give the same closedness and show that the complement is
  exhausted by bounds with a positive gap from $Z_(s \, t)$.

View a tuple as the linear map $bb(Q)_p^s arrow.r cal(N)_m$ sending the standard basis to its entries.
  Its rank-$t$ coefficient quotient is $bb(Q)_p^s \/ ker \( f \)$;
  equivalently its coefficient plane is the annihilator of $ker \( f \)$ in the dual space.
  We denote this compact quotient Grassmannian by $"Gr"_t \( bb(Q)_p^s \)$ and use the action induced by
  precomposition on tuples. On its graph charts take the first $t$ independent tuple coordinates as the base.
  Each remaining coordinate has the form

#[#set math.equation(numbering: n => "(3.19)")
 $ sum_(i = 1)^t a_i z_i + b \, wide a_i in bb(Q)_p \, quad b in F_m \, $ <eq:ind-graph-centers>]

after lifting to untilted coordinates. The normal neighborhoods are exactly those of 31.

The maps now come from restriction to shrinking neighborhoods.
  After descent through the translation cover, they restrict cohomology to smaller lattice stabilizers.
  By 29, positive lattice degrees disappear, while a degree-zero class is copied into each refined slope cluster.
  This explains the locally constant slope families in the germ term below.
  Earlier, expanding compact supports used corestriction and retained the top lattice orientation instead.

#thm([Lemma 3.11.])[
  (The excision term).  #emph[There is a natural triangle
#[#set math.equation(numbering: n => "(3.20)")
 $ upright(bold(R)) Gamma_c \( X_(s \, gt.eq t + 1) \, cal(E) \) arrow.r
   upright(bold(R)) Gamma_c \( X_(s \, gt.eq t) \, cal(E) \) arrow.r cal(G)_(s \, t) \( cal(E) \) arrow.r
   upright(bold(R)) Gamma_c \( X_(s \, gt.eq t + 1) \, cal(E) \) \[ 1 \] \, $ <eq:ind-rank-triangle>]

 where $cal(G)_(s \, t)$ is computed by shrinking neighborhood germs of $Z_(s \, t)$,
   with compact support along that locus. Locally on a compact open Grassmannian graph patch $P$, it is
#[#set math.equation(numbering: n => "(3.21)")
 $ "LC" #scale(x: 120%, y: 120%)[\(] P \, upright(bold(R)) Gamma_c \( Y_t \, cal(E) \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:ind-germ-formula>]

 Here $"LC" \( P \, - \)$ means the filtered colimit of finite direct sums over finite clopen partitions of $P$.
   With an external compact parameter $cal(D)$, the corresponding formula is
$ "LC" #scale(x: 120%, y: 120%)[\(] P \, upright(bold(R)) Gamma_c \( Y_t times underline(cal(D)) \, cal(E) \)
  #scale(x: 120%, y: 120%)[\)] . $

 At each tube depth only a finite partition of $P$ is used, while $cal(D)$ remains in the base complex.
   The slope-partition colimit is algebraic.]
] <lem:ind-germ-excision>

#proof[
  First fix a support bound in $X_(s \, gt.eq t)$ and a slightly larger bound.
    Restrict a section with that support to a neighborhood of the closed rank-$t$ locus inside the larger bound.
    The fiber of this restriction is a section supported off that neighborhood;
    one can replace the neighborhood by a slightly smaller one to separate all boundary radii.
    This is the Mayer–Vietoris support fiber sequence on the bound and its collar.
    As the neighborhood shrinks, the remaining bounds are cofinal among compact bounds in $X_(s \, gt.eq t + 1)$.
    Conversely any such compact bound is disjoint from a sufficiently small neighborhood of the closed locus,
    by the strict separation on a slightly enlarged bound. Taking the exact filtered colimit of these support
    triangles and then increasing the original bound proves (3.20).
    In particular its third term uses restriction to shrinking neighborhoods.
    It is not an inverse limit of cohomology supported in shrinking tubes.
  To calculate that third term, use 31. On a fixed base chart,
    at depth $j$ there are finitely many slope clusters and actual relative disc tubes.
    Upstairs under the translation cover, other discs are the disjoint translates of these discs.
    Shapiro reduces their cohomology to the compact stabilizers $p^j L_b$;
    this is the same explicit bar construction as in (3.15).
  The comparison is induced by actual base inclusions. On a refined base chart $S$, write $C_S =
    upright(bold(R)) Gamma \( S \, cal(E) \)$, retaining any external parameter in $S$.
    Pullback from $S$ to each covering disc is translation-equivariant. After Shapiro it gives the map
  $ xor.big_(upright("slope clusters at depth ") j) upright(bold(R)) Gamma \( p^j L_b \, C_S \) arrow.r
    upright(bold(R)) Gamma \( upright("union of tubes") \, cal(E) \) . $
  These maps commute with refinements and with the restriction maps on the base and its support collars.
  Restriction through a sufficiently large fixed ratio of tube radii has pure base image on geometric cohomology,
    by 25. The radius ratio is independent of the center and of compact parameters.
    The finite refined cover of 31 works for every depth; hence one further depth works simultaneously for its
    charts, its support collars, and all the compact stabilizer-bar parameters in any fixed total degree.
    It follows that the geometric cone rows vanish before applying the group maps.
    The group maps here are restrictions to $p^(j') L_b subset p^j L_b$.
    By 29, they kill every positive lattice-cohomology degree and preserve the base degree zero.
    The resulting neighborhood-germ complex is therefore a copy of the base complex for each slope cluster.
    When a cluster splits, restriction replicates its class in each new cluster.
  This argument is relative over the independent base, rather than just a calculation on its geometric fibers.
    More explicitly, the centers in (3.19) are sections on entire refined charts,
    so the Kummer homotopies are linear over their base rings.
    Pullback of a base class realizes the comparison on each tube.
    On overlaps the comparisons are the restrictions of the same class;
    a further interleaving of tubes compares different choices.
    For descent over a support bound and its collar, choose a $v$-hypercover by quasicompact perfectoid charts in
    every degree needed. Fiber products are quasicompact after the bounded translation reduction.
    In a fixed total degree only finitely many of these degrees occur.
    One common further tube depth kills the cone rows there, so the bounded-below descent spectral sequence proves
    the relative comparison. Applying the support fiber on the base gives (3.21).
  There are only finite sums at each partition. Their exact filtered colimit is $"LC" \( P \, - \)$,
    and an external compact parameter enters the coefficient ring of these finite sums.
    Thus the construction allows continuous coefficients in $cal(D)$ but does not allow a single germ to use
    unboundedly fine slope partitions with no common neighborhood.
    The comparisons agree under restriction to the actual graphs,
    which also proves their naturality under changes of graph chart and changes of lifts. ◻
]

#thm([Theorem 3.12.])[
  (Scalar comparison and admissibility).  #emph[For every $s gt.eq 0$ and every compact profinite $cal(D)$,
    extension of constants induces natural quasi-isomorphisms
#[#set math.equation(numbering: n => "(3.22)")
 $ E_(cal(D)) ⊗_(bb(F)_p) upright(bold(R)) Gamma_c \( Y_s \, bb(F)_p \) & arrow.r^(med tilde.op med)
   upright(bold(R)) Gamma_c \( Y_s times underline(cal(D)) \, bb(F)_p \) \,\
R_(cal(D)) ⊗_(bb(F)_p) upright(bold(R)) Gamma_c \( Y_s \, bb(F)_p \) & arrow.r^(med tilde.op med) upright(bold(R))
  Gamma_c \( Y_s times underline(cal(D)) \, cal(O)^flat \) . $ <eq:ind-fp-parameters>]

 The tensors are algebraic. The comparisons retain uniform support and all compact bar parameters.]
  #emph[Each $H_c^i \( Y_s \, bb(F)_p \)$ is a countable smooth admissible $M_s$-module.
    It has a smooth commuting $P_m$-action. Smooth means that each vector has open stabilizer;
    admissible means that every open subgroup of $M_s$ has finite-dimensional fixed space.]
] <thm:ind-comparison>

#proof[
  Induct on $s$. The case $s = 0$ is the coefficient calculation on the external parameter space.
    For the induction step start with the whole space $X_(s \, gt.eq 0) = cal(N)_m^s$, whose comparison is 30.
    Delete the ranks $t = 0 \, dots.h \, s - 1$ successively using (3.20).
    For each such $t$, the germ term is locally (3.21). By the inductive hypothesis it has the scalar comparison
    in question. The functor $"LC" \( P \, - \)$ is an exact filtered colimit of finite direct sums and commutes
    with algebraic scalar extension. For its gluing, use integral frames of the coefficient quotients:
    the image of $bb(Z)_p^s$ in a $t$-dimensional coefficient quotient is a free lattice,
    and its kernel in $bb(Z)_p^s$ is a saturated direct summand.
    Dually, the coefficient plane meets the dual integral lattice in a saturated rank-$t$ summand.
    Consequently $M_s$ acts transitively on the Grassmannian,
    and integral graph charts give continuous local sections of $M_s arrow.r M_s \/ Pi_t$,
    where $Pi_t$ stabilizes the standard plane. The resulting transition functions on the independent base lie in
    $"GL"_t \( bb(Z)_p \)$. Their action on any finite set of cohomology classes is locally constant by inductive
    smoothness; compactness gives a common finite clopen refinement.
    A finite disjoint clopen trivializing cover computes global sections by finite sums of the exact functors
    $"LC" \( P \, - \)$. Thus the germ comparison glues with its algebraic finite-span structure on the compact
    Grassmannian. Exactness of scalar extension over $bb(F)_p$ and the support triangles prove (3.22),
    (3.22) for the final complement $Y_s$.
  The proof took place on uniform compact parameters before the support colimit and before each bounded-below
    totalization, as established in 32. It therefore gives the asserted comparisons on actual coefficient
    complexes. In particular it does not replace continuous families of unrestricted functions by an algebraic
    tensor after taking cohomology.
  Smoothness, including the commuting $P_m$-action, now follows from the parameter comparison.
    For a compact acting group $H$ and a class $v$, pullback by its action gives a family of classes with
    parameter $cal(D) = H$. Supports remain uniform: a compact group translates a quasicompact bound into a
    quasicompact image contained in a larger bound. By (3.22),
    this family lies in $C \( H \, bb(F)_p \) ⊗_(bb(F)_p) H_c^i \( Y_s \, bb(F)_p \)$.
    It is therefore a locally constant finite-valued orbit map. Thus the stabilizer of $v$ is open.
    This proves smoothness for both commuting actions before we use the category of smooth representations below.
  We next identify the representation in a germ term. Let $Pi_t subset
    M_s$ be the stabilizer of the standard coefficient $t$-plane.
    Its action on the independent base is through its $"GL"_t \( bb(Z)_p \)$ Levi factor;
    the other Levi factor and the unipotent radical act trivially on the normal degree-zero germ. Hence
  #[#set math.equation(numbering: n => "(3.23)")
   $ H^i cal(G)_(s \, t) \( bb(F)_p \) tilde.equiv "Ind"_(Pi_t)^(M_s) H_c^i \( Y_t \, bb(F)_p \) \,
     $ <eq:ind-parabolic-module>]
  where induction is smooth induction and no support condition on $M_s \/
    Pi_t$ is needed because that quotient is compact. To see the identification,
    use the integral trivializations just chosen on the graph charts.
    Sections are locally constant choices of an independent-base class,
    and transition functions are the changes of basis of that plane.
    These are exactly the equivariant locally constant functions defining the right side.
    The comparison is by restriction to the plane, so it is compatible with the group action and not just an
    isomorphism of vector spaces.
  Smooth parabolic induction in (3.23) preserves admissibility.
    Indeed an open subgroup $H subset M_s$ has finitely many orbits on $M_s \/ Pi_t$.
    For each orbit, the stabilizer $H ∩ g Pi_t g^(- 1)$ maps onto an open subgroup of the $"GL"_t \( bb(Z)_p \)$
    Levi factor. An $H$-fixed induced function is determined by a vector fixed under that open subgroup.
    There are finitely many such choices, each finite-dimensional by induction.
  For completeness, admissible smooth representations of a compact $p$-adic analytic group over $bb(F)_p$ are
    closed under subobjects, quotients, and extensions. Take continuous duals into $bb(F)_p$.
    A smooth module is admissible precisely when its compact dual is finitely generated over the completed group
    algebra: finite coinvariants for an open uniform pro-$p$ subgroup give finite generation by compact Nakayama,
    and the converse follows by taking coinvariants at open subgroups.
    The completed group algebra is Noetherian, since the uniform subgroup algebra has its polynomial associated
    graded ring and the full algebra is finite over it. Finite generation is therefore closed under submodules,
    quotients, and extensions. Dualizing proves the assertion for smooth modules.
  The whole-space cohomology in 30 is finite. The long exact sequences of (3.20), (3.23),
    and the preceding closure property now prove admissibility for $Y_s$.
    Countability follows in the same induction: the compact $p$-adic Grassmannian has a countable clopen basis,
    so locally constant functions on it with values in a countable $bb(F)_p$-space form a countable space,
    and the support exact sequences preserve countability. ◻
]

===== 3.2.4 Finite equivariant compact-support cohomology <finite-equivariant-compact-support-cohomology>

#thm([Lemma 3.13.])[
  #emph[Let $H$ be a compact $p$-adic analytic group and let $V$ be a countable smooth admissible
    $bb(F)_p \[ H \]$-module. Then $H_(upright("cts"))^a \( H \, V \)$ is finite-dimensional for every $a$.
    Let $H$ act trivially on the external parameter $cal(D)$ and on $R_(cal(D))$,
    and diagonally through $V$ on $R_(cal(D)) ⊗ V$. For the coefficient topology supplied by uniform finite-span
    families, there is a natural isomorphism
$ H_(upright("cts"))^a \( H \, R_(cal(D)) ⊗_(bb(F)_p) V \) tilde.equiv R_(cal(D)) ⊗_(bb(F)_p)
  H_(upright("cts"))^a \( H \, V \) . $

]
] <lem:ind-admissible-cohomology>

#proof[
  Let $V^or = "Hom" \( V \, bb(F)_p \)$ be the compact dual.
    It is finitely generated over $bb(F)_p \[ \[ H \] \]$, as in the proof of 33.
    Noetherianity gives a resolution of $V^or$ with finitely generated free terms, finite in each degree.
    Tensoring it with the trivial module $bb(F)_p$ shows that
    $"Tor"_a^(bb(F)_p \[ \[ H \] \]) \( bb(F)_p \, V^or \)$ is finite in each degree.
    Continuous duality identifies this with the dual of $H_(upright("cts"))^a \( H \, V \)$.
  For scalar extension use the finite free resolution of the trivial module supplied by 4.
    Exhaust $V$ by finite-dimensional $H$-stable subspaces. Such an exhaustion exists because $V$ is countable and
    every smooth vector has finite orbit under the compact group.
    Give $R_(cal(D)) ⊗ V$ the union of the complete finite-span steps so obtained.
    Its actual bounded-step bar cochains are
  $ C_(upright("cts"))^a \( H \, R_(cal(D)) ⊗ V \) = R_(cal(D) times H^a) ⊗_(bb(F)_p) V . $
  Indeed this is true on every finite span and then on their union.
    These are exactly the row families given by 33 with parameter $cal(D) times H^a$,
    compatibly with every bar face. The finite-type completed resolution and its comparison with continuous
    cochains apply by 4: each vector belongs to a finite continuous representation,
    and compact families are retained in one such step. In every degree the resolution calculation is a finite
    power of this coefficient module. A matrix entry in $bb(F)_p \[ \[ H \] \]$ acts on a finite $H$-stable span
    through a finite quotient of $H$, so its action after extension is $R_(cal(D))$-linear scalar extension of its
    action on $V$. The differential is therefore scalar extension of the differential over $bb(F)_p$.
    Exactness of tensoring over $bb(F)_p$ gives the displayed isomorphism.
    These are the same finite-span families as in 33, not a newly imposed completion or topology on its cohomology. ◻
]

#thm([Corollary 3.14.])[
  (Finite equivariant cohomology).  #emph[Let $1 lt.eq m < n$, $r = n - m$, and let $U subset P_m times
    "GL"_r \( bb(Z)_p \)$ be a sufficiently deep product open subgroup as in 19.
    Let $Z_U$ be the perfected analytic cover associated with $B_U$ over
$ 0 < \| x \| < 1 \, wide \| y_i \| < 1 . $

 Then
$ H^j upright(bold(R)) Gamma #scale(x: 120%, y: 120%)[\(] G \,
  upright(bold(R)) Gamma_c \( Z_U \, cal(O)^flat \) #scale(x: 120%, y: 120%)[\)] $

 is finite-dimensional over $C^flat$ for every integer $j$.
   With an external compact profinite parameter $cal(D)$, the corresponding groups are obtained by extension to
   $R_(cal(D))$ and are finite over that ring.]
] <cor:ind-finite>

#proof[
  Write $U = U_m times U_r$. The two compact frame torsors and 21 identify the complex in the assertion with
  $ upright(bold(R)) Gamma #scale(x: 120%, y: 120%)[\(] U \,
    upright(bold(R)) Gamma_c \( Y_r \, cal(O)^flat \) #scale(x: 120%, y: 120%)[\)] . $
  Indeed, on the completed full marked tower the actions commute.
    Descent first by $U$ and then by $G$, or in the opposite order, gives the two displayed descriptions.
    Compact torsors preserve the cofinal systems of support bounds.
    The uniform-parameter comparisons of 33 apply to their bar diagrams.
    Bounded-below totalization in each degree therefore justifies this interchange of descents with the support
    exhaustion.
  By 33 the geometric cohomology rows are scalar extensions of the smooth admissible modules
    $H_c^b \( Y_r \, bb(F)_p \)$ for $M_r$. Their $U_r$-cohomology is finite in each degree by 34.
    The residual $U_m$-action on these finite $bb(F)_p$-spaces is smooth,
    since the original commuting action is smooth and the finite-type cochain comparison retains its compact
    parameters. A finite-type resolution for $U_m$ then has finite-dimensional terms with these finite
    coefficients; its cohomology is finite in each degree as well.
  The successive first-quadrant spectral sequences have only finitely many terms in any prescribed total degree.
    Their entries, and hence their abutments, are finite over $bb(F)_p$ before scalar extension.
    The same finite-type comparisons and (3.22) identify the $cal(O)^flat$ answers with extension to $C^flat$,
    or to $R_(cal(D))$ when the parameter is retained. This proves the assertion.
    No finite cohomological dimension of a torsion-containing full stabilizer is used here. ◻
]

===== 3.2.5 Ordinary functions and inverse support limits <ordinary-functions-and-inverse-support-limits>

The following ordinary degree-zero assertion is different from the neighborhood-germ comparison.
  It will identify an invariant unit occurring in the Cartier normalization.

#thm([Corollary 3.15.])[
  (Functions on the independent locus).  #emph[For every $s gt.eq 0$,
#[#set math.equation(numbering: n => "(3.24)")
 $ Gamma \( Y_s \, cal(O)^flat \) = C^flat \, wide Gamma \( Y_s times underline(cal(D)) \, cal(O)^flat \) =
   R_(cal(D)) . $ <eq:ind-ordinary-functions>]

 The identifications are by pullback of scalars. For $s gt.eq 1$, projection $Y_s arrow.r
   Y_(s - 1)$ has relative degree-zero direct image $cal(O)^flat$.]
  #emph[Consequently a $G$-invariant algebraic function in a fixed finite marked coefficient model becomes a
    scalar after pullback to the completed full marking tower.
    If the model and its chosen component are defined over the finite field $k$, that scalar belongs to $k$.
    In particular this applies to invariant algebraic units.]
] <cor:ind-functions>

#proof[
  For $s gt.eq 1$, work locally over an affinoid perfectoid chart $S$ of $Y_(s - 1)$ carrying untilted lifts
    $z_1 \, dots.h \, z_(s - 1)$. Such charts exist by the translation presentation.
    The inverse image of the last independent coordinate in the untilted affine line is the complement of the
    closed graph family
  $ A_z = {sum_(i = 1)^(s - 1) a_i z_i + b : a_i in bb(Q)_p \, med b in F_m} . $
  Refine the bounded independent-base chart using 31. Choose $rho$ strictly between its persistent radii $alpha <
    beta$ and exhaust the output coordinate by discs
  $ X_a = { \| T \| lt.eq rho \| p \|^(- a) } \, wide a gt.eq 0 . $
  The centers in $X_a$ correspond exactly to the compact open coefficient lattice $p^(- a) L$,
    and all have norm at most $alpha \| p \|^(- a)$. They therefore have a separated outer collar inside $X_a$.
    This uses the persistence for negative as well as positive powers of $p$;
    the same linear identity proves both. At fixed $a$, and sufficiently large $j$,
    the closed tubes $T_j$ before translation quotient are the finite disjoint discs indexed by $p^(- a) L \/ p^j
    L$, with radius $alpha \| p \|^j$ and centers $ell_z \( w \)$ at constant coefficient representatives $w$.
    Their open companions have radius $beta \| p \|^j$ and lie inside the same collar.
    By 31 these companions are a cofinal neighborhood system,
    and their complements admissibly exhaust $X_a \\ A_z$. On the finite base refinement the exhaustions just
    chosen have common enlargements, so they compute the same support fibers on overlaps.
  Let $X$ denote this bounded ambient chart with its chosen collar, and put
  $ C_j = "fib" #scale(x: 120%, y: 120%)[\(] upright(bold(R)) Gamma \( X \, cal(O)^flat \) arrow.r
    upright(bold(R)) Gamma \( X \\ T_j \, cal(O)^flat \) #scale(x: 120%, y: 120%)[\)] . $
  The maps are $C_(j') arrow.r C_j$ for $j' gt.eq j$: #emph[smaller support maps to larger support].
    A small cluster is included in its containing larger disc;
    the transition sums these maps when several clusters are included in one larger cluster.
    By 27, after a sufficiently large fixed ratio of these radii the maps on $H^0$ and $H^1$ are zero.
    This is vanishing of the entire cohomology-group map, not elementwise eventual vanishing.
    The uniform persistent lattice charts and support collars are precisely the hypotheses needed for that lemma.
    Finite sums of the cluster maps retain the vanishing. On a finite descent cover one may compose finitely many
    further refinements to kill the finite filtration in these two total degrees.
    Hence both low-degree inverse systems are pro-zero on the whole bounded chart.
  Since complements exhaust $X \\ A_z$, limits preserve the support fiber and give
  #[#set math.equation(numbering: n => "(3.25)")
   $ upright(bold(R)) Gamma_(A_z) \( X \, cal(O)^flat \) tilde.eq upright(bold(R)) #h(-0.16667em) "proj lim"_j
     C_j . $ <eq:ind-closed-support-limit>]
  The complexes $C_j$ have no negative cohomology. The Milnor exact sequence for this countable tower therefore shows
  $ H^0 upright(bold(R)) Gamma_(A_z) \( X \, cal(O)^flat \) =
    H^1 upright(bold(R)) Gamma_(A_z) \( X \, cal(O)^flat \) = 0 : $
  both ordinary limits of $H^0 \, H^1$ vanish, and the possible $"proj lim"^1
    H^0$ vanishes because that system is pro-zero. No condition on the surviving degree-two support system is required.
  Now increase the output-coordinate bound. At every fixed bound the coefficient set $p^(- a) L$ is compact,
    so the preceding argument applies. Use the interleaved open bounds and set
  $ C_a = upright(bold(R)) Gamma_(A_z ∩ X_a) \( X_a \, cal(O)^flat \) . $
  Although the tube refinements may depend on $a$, these support complexes restrict canonically.
    The bounds and their complements admissibly exhaust the relative affine line and its complement of $A_z$.
    Thus the exhaustion assertion of 27 gives
  $ upright(bold(R)) Gamma_(A_z) \( bb(A)_S \, cal(O)^flat \) tilde.eq upright(bold(R)) #h(-0.16667em)
    "proj lim"_a C_a . $
  Each $C_a$ is connective with $H^0 \( C_a \) = H^1 \( C_a \) = 0$,
    so the Milnor sequence proves the same low-degree vanishing on the whole line.
    The two limits have been taken in order: first the tubes at a fixed output bound,
    then the canonical support complexes as that bound increases.
  The support triangle and 25 now give an isomorphism from base functions to the ordinary functions on the affine
    line minus $A_z$. This is a relative statement on the perfectoid base charts:
    all maps and estimates are linear over the base and agree on overlaps.
    Degree-zero descent by the translation group $F_m$ takes invariants of these base functions,
    on which the group acts trivially. Hence projection $Y_s arrow.r
    Y_(s - 1)$ has the claimed relative degree-zero direct image. Induction, starting with $Y_0$, proves (3.24).
    Retaining $cal(D)$ in the same relative calculation gives its parameter version.
  For the last assertion, the finite model injects into its perfected analytic realization and then into the full
    marking tower: analytic evaluation on the exhausting bounds is injective,
    and the marking extension is faithful. A $G$-invariant function descends through the actual torsor of 19.
    By (3.24), its image is a scalar $lambda in C^flat$. Apply coefficient-only $\|
    k \|$-Frobenius to this equality back on the tower, whose finite model is defined over $k$.
    It fixes the original algebraic function, whereas it sends $lambda$ to $lambda^(\| k \|)$.
    Injectivity gives $lambda^(\| k \|) = lambda$, so $lambda in k$.
    This argument does not require the chosen untilted quotient presentation itself to commute with coefficient
    Frobenius. If a preliminary finite constant extension was needed to define the model or its idempotent,
    the conclusion is in that finite field. ◻
]

#prodef([Remark 3.16.])[
  (Three directions of passage).  The preceding arguments use three different systems.
    Expanding compact support on $cal(N)_m$ gives a filtered colimit with #emph[corestriction] between expanding
    translation lattices; its top lattice degree survives. Neighborhood germs of a deleted rank stratum give a
    filtered colimit with #emph[restriction] to shrinking lattices;
    only lattice degree zero survives and slope classes are replicated.
    Cohomology with support in the actual closed graph is instead (3.25), an inverse limit of support fibers;
    the maps sum classes from smaller supported tubes into larger ones.
    Its pro-zero degrees zero and one are what prove 36. Neither that ordinary-function conclusion nor 35 asserts
    a comparison between incomplete algebraic ordinary cohomology and completed analytic ordinary cohomology.
] <rem:ind-limit-directions>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.573cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Expanding supports#linebreak() $K_a subset K_(a+1)$]])], anchor: "north-west")
  content((5.515, -0.42), [#text(size: 9pt)[$A_a$]])
  content((9.77, -0.42), [#text(size: 9pt)[$A_(a+1)$]])
  line((5.733, -0.42), (9.441, -0.42), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: black)))
  content((7.643, -0.42), [#text(size: 8pt)[corestriction]], anchor: "south", padding: 0.03528cm)
  content((11.66, 0), [#box(width: 4.251cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[$"colim"_a A_a tilde.eq R[-(m+2)]$#linebreak() Lattice degree $m$ survives.]])], anchor: "north-west")
  line((0, -1.28), (15.76, -1.28), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  content((0, -1.65), [#box(width: 4.573cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Shrinking neighborhoods#linebreak() $cal(U)_(j+1) subset cal(U)_j$]])], anchor: "north-west")
  content((5.515, -2.07), [#text(size: 9pt)[$cal(G)_j$]])
  content((9.77, -2.07), [#text(size: 9pt)[$cal(G)_(j+1)$]])
  line((5.836, -2.07), (9.338, -2.07), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: black)))
  content((7.643, -2.07), [#text(size: 8pt)[restriction]], anchor: "south", padding: 0.03528cm)
  content((11.66, -1.65), [#box(width: 4.251cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[$"colim"_j cal(G)_j tilde.eq "LC" (P, cal(B) )$#linebreak() Normal degree $0$ survives; slope values replicate.]])], anchor: "north-west")
  line((0, -3.13), (15.76, -3.13), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  content((0, -3.5), [#box(width: 4.573cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Shrinking supports#linebreak() $T_(j+1) subset T_j$]])], anchor: "north-west")
  content((5.515, -3.92), [#text(size: 9pt)[$E_j$]])
  content((9.77, -3.92), [#text(size: 9pt)[$E_(j+1)$]])
  line((9.441, -3.92), (5.733, -3.92), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.18cm, fill: black)))
  content((7.643, -3.92), [#text(size: 8pt)[support inclusion]], anchor: "south", padding: 0.03528cm)
  content((11.66, -3.5), [#box(width: 4.251cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[$bold(R)#h(-0.1667em) "varprojlim"_j E_j tilde.eq bold(R) Gamma_Z(X, "mathscr" E)$#linebreak() $H^0=H^1=0$: the low-degree systems are pro-zero.]])], anchor: "north-west")
  content((7.643, -4.65), [#box(width: 6.502cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Child-cluster support classes are summed.]]])])
})],
  caption: [Figure 1: The three limit directions of 37. For retained coefficients $R$, $A_a = upright(bold(R)) Gamma \( L_a \, R \) \[ - 2 \]$ is the lattice comparison model, with $L_(a + 1) = p^(- 1) L_a$. On a slope patch $P$, the complex $cal(G)_j$ uses neighborhood sections with compact support along the stratum; its base complex $cal(B) = upright(bold(R)) Gamma_c \( Y_t \, cal(E) \)$ is retained. The complex $E_j$ is instead the support fiber on a fixed ambient bound $X$, with $Z = ⋂_j T_j$. ],
) <fig:support-directions>

== 4 Cartier transfers and Laurent supports <part:cartier>

==== 4.1 Natural root diagrams and Cartier transfers <sec:transfers>

The invariant-function calculation makes the source comparison unit below constant and lets us normalize a single
  Cartier transfer on a finite marked algebra. Compact-support finiteness enters the Laurent argument in 2.
  The construction must work on entire finite diagrams, and its pole bound must survive every iterate:
  these are the two inputs the later pro-transfer argument will need.

Fix an exact-height stratum with $1 lt.eq m < n$ and put $r = n - m$.
  Throughout this section $G = P_n$ is unchanged. A sufficiently deep product subgroup $U subset P_m times
  "GL"_r \( bb(Z)_p \)$ will be chosen in the course of the construction. Write

$ A = k \[ \[ x \, y_1 \, dots.h \, y_(r - 1) \] \] \, wide B = A \[ 1 \/ x \] \, wide R = B_U = e B' \, wide B' =
  A' \[ 1 \/ x \] $

as in 13. In particular, $A'$ is the whole finite free $A$-algebra with its fixed integral basis,
  $B' \/ B$ is finite étale, and $e$ is a $G$-invariant idempotent.
  No specialization of $e$ across $x = 0$ will be used.

===== 4.1.1 The distribution algebra and the root functor <the-distribution-algebra-and-the-root-functor>

Let $B_oo = "colim"_U B_U$ denote the algebra with both full markings.
  The compatible lifts of the marked étale generators form a torsor $cal(P)$ under the affine group scheme

$ T = "proj lim"_(\[ p \]) Gamma_m \[ p^j \]^r . $

These are affine torsors, understood through their finite faithfully flat quotients. By 14,

#[#set math.equation(numbering: n => "(4.1)")
 $ cal(O) \( cal(P) \) = "colim"_j B_oo^(1 \/ p^(m j)) = B_oo^(upright("perf")) \, wide cal(P) \/ \[ p^ell \] T =
   "Spec" B_oo^(1 \/ p^(m ell)) . $ <eq:trans-full-torsor>]

The $G$-action commutes with $T$; changes of markings act on this identity and on $T$ by the indicated constant
  Honda automorphisms.

Here and below a root of a module has a specific meaning.
  If $h$ is a power of $p$ fixing $k$ and $M$ is an $R$-module,
  $M^(1 \/ h)$ is the copy of $M$ transported along the isomorphism

$ R arrow.r R^(1 \/ h) \, wide b mapsto b^(1 \/ h) . $

It is then regarded as an $R$-module by the #emph[inclusion] $R subset R^(1 \/ h)$.
  Thus a finite locally free $M$ of rank $v$ gives an $R$-module $M^(1 \/ h)$ of rank $h^r v$.
  The map $M^(1 \/ h) arrow.r M$ denoted by $w mapsto w^h$ is the transport isomorphism;
  it is semilinear with respect to $R^(1 \/ h) arrow.r R$, $b mapsto b^h$.
  This convention applies to maps and complexes, and does not mean pullback along $R subset
  R^(1 \/ h)$ followed by retaining its rank over the larger ring.

For the remainder of this subsection assume $m > 1$. The height-one case is treated separately in the transfer
  construction below. The continuous distribution algebra is

#[#set math.equation(numbering: n => "(4.2)")
 $ Lambda = cal(O) \( T \)^or tilde.eq k \[ \[ D_1 \, dots.h \, D_d \] \] \, wide
   d = \( m - 1 \) r . $ <eq:trans-distributions>]

Here the dual is the inverse limit of the duals of the finite Hopf algebras.
  We recall why both the dimension and the powers in this description have these values.
  Cartier duality identifies this inverse limit with the coordinate algebra of the formal group
  $\( Gamma_m^D \)^r$. The standard facts used here are the equivalence between connected $p$-divisible groups and
  formal Lie groups for which $\[ p \]$ is finite faithfully flat over a complete local Noetherian base of residue
  characteristic $p$, and finite-flat Cartier duality, which interchanges Frobenius and Verschiebung;
  see #cite(label("tate1967"), form: "prose") §1.2 and §§2.2–2.3, Propositions 1 and 3.
  Our base is the perfect field $k$. On the one-dimensional Honda group, $F^m = \[ p \]$ and $F V = \[ p \]$.
  Duality gives $V^m = \[ p \]$ on the dual; there $F^m \[ p \] = \[ p \]^m$,
  and cancellation of the faithfully flat isogeny $\[ p \]$ gives

#[#set math.equation(numbering: n => "(4.3)")
 $ F^m = \[ p \]^(m - 1) quad upright("on ") Gamma_m^D . $ <eq:trans-dual-honda>]

All Frobenius twists in this formula use the Honda model over $bb(F)_p$.
  The kernel of $F$ on $Gamma_m$ has order $p$, whereas $Gamma_m \[ p \]$ has order $p^m$.
  Thus the kernel of $V$ has order $p^(m - 1)$, and the dual Frobenius has that degree.
  A smooth formal group of dimension $s$ has Frobenius degree $p^s$, so $dim Gamma_m^D = m - 1$.
  When $m > 1$ the dual has no étale part: on any finite étale $p$-power subgroup Frobenius is invertible,
  whereas a sufficiently high iterate of the right side of (4.3) is zero.
  The connected $p$-divisible group is therefore formal, giving (4.2).
  These uses of Cartier duality are at finite flat levels before passing to the limit.

Choose a positive integer $a_0$ divisible enough to fix the finite constant field, and set, for $a gt.eq 1$,

#[#set math.equation(numbering: n => "(4.4)")
 $ q_0 = p^(m a_0) \, quad q = q_0^a \, quad ell = \( m - 1 \) a_0 a \, quad h = q^(m - 1) =
   p^(m ell) . $ <eq:trans-powers>]

On the dual formal group, (4.3) identifies $\[ p^ell \]$ with the $q$-power Frobenius.
  Its map on coordinates is the inclusion

$ sigma_q : Lambda arrow.r Lambda \, wide D_i mapsto D_i^q . $

Write $Lambda^(\( q \)) = sigma_q \( Lambda \)$ and

$ Lambda_q = Lambda \/ \( D_1^q \, dots.h \, D_d^q \) \, wide sans(N)_q = "Hom"_k \( Lambda_q \, k \) . $

The quotient $T \/ \[ p^ell \] T$ has coordinate representation $sans(N)_q$. In particular

$ dim_k sans(N)_q = q^d = h^r = p^(m ell r) \, $

in agreement with the rank of the finite lift torsor.

For a finite-length $Lambda$-module $E$, regard $E$ as a $Lambda^(\( q \))$-module through $sigma_q^(- 1)$ and define

$ "Coind"_q \( E \) = "Hom"_(Lambda^(\( q \))) \( Lambda \, E \) \, wide \( a dot.op f \) \( b \) = f \( a b \) . $

This is an exact functor, because $Lambda$ is free over $Lambda^(\( q \))$ on the monomials $D^alpha$, $0 lt.eq
  alpha_i < q$. For $E = k$ it gives $sans(N)_q$. We use the natural change-of-markings action on coinduction.
  Explicitly, if $u$ acts compatibly on $E$, its action is $\( u f \) \( b \) = u \( f \( u^(- 1) b \) \)$.
  The inclusion $sigma_q$ commutes with this action: its coefficients lie in the finite field fixed by $q$.

Denote by $V_E$ the associated coefficient bundle, obtained by descent of $cal(P) times
  E$ through translations and then through $U$. Thus $V_k = R$.
  A fixed finite diagram of such representations and maps descends to finite locally free bundles at some finite
  marking stage. A plain finite $Lambda$-module diagram can be given trivial auxiliary action after shrinking $U$:
  it factors through a finite-dimensional quotient of $Lambda$, whose marking action has finite image.
  Coinduced diagrams of arbitrarily large size retain their natural auxiliary actions;
  no single $U$ is asserted to act trivially on all of them.

#thm([Proposition 4.1.])[
  (Natural roots of finite diagrams).  #emph[Assume $m > 1$.
    With the powers in (4.4), there is a natural $G$-equivariant isomorphism
#[#set math.equation(numbering: n => "(4.5)")
 $ V_("Coind"_q \( E \)) tilde.eq \( V_E \)^(1 \/ h) . $ <eq:trans-root-functor>]

 It is compatible with the natural auxiliary actions and with every arrow of a finite diagram.
   It preserves exact diagrams and is compatible with successive coinduction and successive roots.
   For any fixed initial diagram, these assertions hold at every sufficiently deep finite marking stage,
   retaining the natural auxiliary action on each of its coinductions.]
] <prop:trans-roots>

#proof[
  The perfectness in (4.1) makes the $h$-power map an isomorphism on the #emph[total lift torsor].
    Write $rho : cal(O) \( cal(P) \) arrow.r cal(O) \( cal(P) \) ⊗_k cal(O) \( T \)$ for its coaction.
    Absolute powering satisfies
  #[#set math.equation(numbering: n => "(4.6)")
   $ rho \( f^h \) = rho \( f \)^h = \( "Fr"_h^(*) ⊗ \[ p^ell \]^(*) \) rho \( f \) \, wide
     f in cal(O) \( cal(P) \) . $ <eq:trans-power-coaction>]
  Here $"Fr"_h^(*)$ raises #emph[all] coefficients, including the base parameters, to the $h$th power.
    Thus this is a map over the matching Frobenius base, not an endomorphism over the original marked base.
    The Honda relation identifies the translation Frobenius with $\[ p^ell \]$.
    In torsor-action notation the same identity is $"Fr"_h \( t dot.op z \) = \[ p^ell \] t dot.op
    "Fr"_h \( z \)$. This endomorphism of $T$ gives an isomorphism
  $ T arrow.r^tilde.op \[ p^ell \] T $
  onto a subgroup of $T$. It is not an automorphism onto all of $T$.
    For example the projection of $\[ p^ell \] T$ to the level-$ell$ quotient is zero.
    The group $T$ need not be reduced, although the total torsor in (4.1) is perfect.
  It follows from (4.6) that, over $B_oo^(1 \/ h)$, the same total lift space with structure group $\[ p^ell \]
    T$ is the root of the original $T$-torsor. Associated-bundle induction in stages now gives
  $ V_("Coind"_(\[ p^ell \] T)^T \( E \)) = pi_(*) #scale(x: 120%, y: 120%)[\(] V_E upright(" on ")
    cal(P) \/ \[ p^ell \] T #scale(x: 120%, y: 120%)[\)] tilde.eq \( V_E \)^(1 \/ h) \, $
  where $pi : "Spec" B_oo^(1 \/ h) arrow.r "Spec" B_oo$ is the finite root map.
    The pushforward is the restriction of scalars specified above.
    One can verify the equality without a choice of a torsor point:
    after a faithfully flat trivialization it is the usual evaluation isomorphism for coinduced equivariant
    functions, and that isomorphism commutes with the two projections in the descent diagram.
    It therefore descends, is natural in $E$, and identifies each morphism of any finite diagram.
    This also proves exactness, since the trivialized functors are exact and the base changes are faithfully flat.
  All the maps used here commute with $G$. They also commute with the changes of markings,
    since $\[ p^ell \]$ is central and the chosen power fixes $k$.
    For two powers, the identities $\( z^(h_1) \)^(h_2) = z^(h_1 h_2)$ and
    $\[ p^(ell_2) \] \[ p^(ell_1) \] = \[ p^(ell_1 + ell_2) \]$ show that the two resulting torsor maps are equal.
    The evaluation map for coinduction in stages has the same composition law.
    This proves the asserted coherence, including the maps of the diagrams,
    rather than only an identification of their terms.
  Finally, the original finite diagram, its torsor quotient,
    and its coaction involve finitely many matrix coefficients and relations.
    They descend through the filtered union of finite étale marking algebras.
    Choose one stage containing this data and shrink $U$ so that the original diagram has the required auxiliary
    action there. At every coinduction level the preceding identity is still the same intrinsic power identity,
    with its natural auxiliary action; it therefore descends to that stage.
    Equivariance can be checked after the one faithfully flat full-marking extension,
    since $G$ preserves each finite marking algebra. This does not require intersecting depth conditions for
    individual elements of $G$, or making all high coinduced representations trivial under $U$. ◻
]

The elementary pairing underlying coinduction will also be useful.
  Let $kappa_q : Lambda arrow.r Lambda^(\( q \))$ extract the coefficient of $product_i
  D_i^(q - 1)$ in the displayed free basis. The pairing $\( a \, b \) mapsto kappa_q \( a b \)$ is perfect:
  modulo the maximal ideal of $Lambda^(\( q \))$ its matrix pairs $D^alpha$ with
  $D^(\( q - 1 \) upright(bold(1)) - alpha)$, and hence is invertible;
  its determinant is a unit already over $Lambda^(\( q \))$.
  Thus coinduction is naturally isomorphic to scalar extension as a functor of plain modules,
  once this functional is fixed. This last choice need not identify the auxiliary actions,
  so the action supplied by 38 will always be retained.

===== 4.1.2 A volume at one finite marking stage <a-volume-at-one-finite-marking-stage>

Use continuous differentials on the formal parameter ring and their localizations and finite étale base changes;
  write this module as $hat(Omega)_(R \/ k)^1$. It is free of rank $r$ before any perfection.

For a finite translation quotient $H$, a #emph[translation augmentation] means a nonzero $H$-equivariant map
  $lambda : cal(O) \( H \) arrow.r k$, with trivial action on $k$. Equivalently, it is an invariant integral:
  $\( "id" ⊗ lambda \) Delta \( a \) = lambda \( a \) 1$. For $m > 1$ and the quotient indexed by $q$,
  this is a $Lambda$-linear map $sans(N)_q arrow.r k$. The term refers to this invariant functional,
  not to the Hopf counit.

#thm([Proposition 4.2.])[
  (Invariant volume and scalar comparison).  #emph[After one finite marking shrink to a pro-$p$ subgroup,
    $hat(Omega)_(R \/ k)^1$ has a $G$-invariant frame. In particular it has a $G$-invariant volume generator $eta
    in hat(Omega)_(R \/ k)^r$.]
  #emph[For a finite root order $h$ fixing $k$, the normalized Cartier functional
#[#set math.equation(numbering: n => "(4.7)")
 $ T_(eta \, h) : R^(1 \/ h) arrow.r R \, wide T_(eta \, h) \( z \) =
   frac("C"^(log_p h) \( z^h eta \), eta) $ <eq:trans-cartier-functional>]

 is $R$-linear and generates $"Hom"_R \( R^(1 \/ h) \, R \)$ as a module over $R^(1 \/ h)$.
   A nonzero translation augmentation at the corresponding finite torsor level induces a scalar multiple of this
   functional; the scalar belongs to the chosen finite constant field.]
] <prop:trans-volume>

#proof[
  The intermediate order-$p$ root cover is a torsor under the height-one Frobenius quotient of translations,
    of rank $p^r$. Over the chosen Honda constants this quotient is $alpha_p^r$ for $m > 1$ and $mu_p^r$ for $m =
    1$. This follows by taking the first Frobenius kernel of the Honda group;
    its Verschiebung is zero in the first case and invertible in the second.
    These finite Hopf algebras and their Lie spaces are defined over a finite field.
    Their continuous marking actions factor through a finite group.
    Shrink $U$ to fix the quotient and a Lie basis. For $m = 1$ choose the standard toral basis of the fixed
    $mu_p^r$. Finite presentation of the coaction descends its torsor action to a finite stage.
    Torsor freeness identifies the resulting invariant vector fields with a basis
  $ delta_1 \, dots.h \, delta_r quad upright("of ") "Der"_R \( R^(1 \/ p) \, R^(1 \/ p) \) . $
  For completeness this freeness can be checked after trivializing the torsor:
    the vectors are $partial \/ partial z_i$ on $alpha_p^r$ and $z_i partial \/ partial z_i$ on $mu_p^r$.
    Their coefficient matrices are invertible, and invertibility descends faithfully flatly.
  For $b in R$, define
  #[#set math.equation(numbering: n => "(4.8)")
   $ partial_i \( b \) = #scale(x: 120%, y: 120%)[\(] delta_i \( b^(1 \/ p) \) #scale(x: 120%, y: 120%)[\)]^p .
     $ <eq:trans-frame>]
  This formula is additive, satisfies the ordinary Leibniz rule, and is $k$-linear because $k$ is perfect.
    To see that it is a frame, let $\( t_1 \, dots.h \, t_r \) = \( x \, y_1 \, dots.h \, y_(r - 1) \)$,
    a $p$-basis after the finite étale base change. Write
  $ delta_i = sum_j a_(i j) frac(partial, partial t_j^(1 \/ p)) . $
  Then $partial_i = sum_j a_(i j)^p partial \/ partial t_j$ and the new determinant is $det \( a_(i j) \)^p in
    R^times$. The derivations commute with $G$, because the full-marking action commutes with translations and
    with powers. The identities descend to this same finite stage:
    they hold after the faithful full-marking extension, and $G$ preserves $R$.
    The dual frame and its top wedge give $eta$. All differentials in this construction were taken at a finite
    root stage.
  We describe the Cartier operator used in (4.7). If $d t = d t_1 and dots.h.c and d t_r$ and $h = p^nu$,
    the unique $p$-basis expansion of a form is
  $ f thin d t = sum_(0 lt.eq alpha_i < h) f_alpha^h t^alpha thin d t \, wide f_alpha in R . $
  The operator is
  #[#set math.equation(numbering: n => "(4.9)")
   $ "C"^nu \( f thin d t \) = f_(\( h - 1 \) upright(bold(1))) thin d t . $ <eq:trans-cartier-coordinates>]
  For power series the expansion groups the exponents modulo $h$;
    localization and finite étale base change preserve it. First take $h = p$.
    In one variable the de Rham differential on a residue exponent other than $p - 1$ gives an exact term,
    while the last exponent gives the class of $t^(p - 1) d t$.
    Tensoring these one-variable complexes proves the Cartier isomorphism in $r$ variables,
    and iterating it gives (4.9) for $h = p^nu$. The inverse of the one-step isomorphism is characterized on
    one-forms by $d b mapsto \[ b^(p - 1) d b \]$ and by multiplication on exterior powers.
    This characterization shows that the formula commutes with coordinate changes and étale base change.
    For the customary inverse-Frobenius convention and its duality interpretation,
    see #cite(label("blickleBockle2011"), form: "prose") Definition 2.1 and Example 2.23.
    It is continuous on the indicated formal coefficient modules.
    In particular it commutes with $G$ and satisfies $"C"^nu \( b^h omega \) = b "C"^nu \( omega \)$.
  (4.9) proves the asserted linearity and dual-generator property. More explicitly, for $eta = d t$ the pairing
  $ \( u \, v \) mapsto T_(d t \, h) \( u v \) $
  on $R^(1 \/ h)$ pairs the $R$-basis $t^(alpha \/ h)$ with its complementary basis
    $t^(\( \( h - 1 \) upright(bold(1)) - alpha \) \/ h)$, and has invertible matrix.
    Replacing $d t$ by a volume generator multiplies by units on the source and target and preserves perfectness.
    This establishes the claim without applying a finite-type smoothness theorem to the completed power-series ring.
  The torsor augmentation has the same dual-generator property. Here is a finite-level verification.
    The coordinate algebra of the translation quotient is a tensor product of truncated polynomial algebras
    $k \[ z_i \] \/ \( z_i^h \)$, with its Honda Hopf structure.
    A nonzero translation-invariant functional $lambda$ gives a pairing $lambda \( a b \)$.
    Its radical is a translation-stable ideal: invariance of $lambda$ and the antipode identity show that the map
    to the dual regular representation is equivariant. If the radical is proper,
    it is contained in the augmentation ideal, since this coordinate algebra is local.
    For a translation-stable ideal $I$ contained there, apply $"id" ⊗ epsilon.alt$ to $Delta \( I \) subset
    cal(O) \( H \) ⊗ I$; the counit identity gives $I = 0$. The radical cannot be the whole algebra because
    $lambda eq.not 0$. The pairing is therefore perfect. After a faithfully flat trivialization this is precisely
    the pairing of the torsor functional, so its perfectness descends.
  There is a useful precision about the comparison. The dual module is rank one over the #emph[source]
    $R^(1 \/ h)$. Thus the two functionals initially differ by
  #[#set math.equation(numbering: n => "(4.10)")
   $ tau \( z \) = T_(eta \, h) \( u z \) \, wide u in \( R^(1 \/ h) \)^times \, $ <eq:trans-source-unit>]
  not by an a priori constant multiplying the output. Both maps are $G$-equivariant,
    and the generator property makes $u$ unique, hence $G$-invariant.
    By Theorem 2.10, Corollary 3.15, its image after perfected geometric extension and full markings is a constant
    on $\( cal(N)_m^r \)_(upright("ind"))$. This extension is injective on the finite algebraic root ring:
    power-series expansion on the analytic annuli is injective in each entry of the whole finite free basis,
    remains so after the idempotent summand, and full marking is faithfully flat.
    The coefficient-only $\| k \|$-Frobenius fixes its finite model, and therefore fixes this constant.
    Consequently $u in k^times$, with the understood finite enlargement if the model was defined there.
    Since $h$ fixes $k$, (4.10) is the required scalar comparison. ◻
]

===== 4.1.3 One transfer, all iterates, and whole-model pole bounds <one-transfer-all-iterates-and-whole-model-pole-bounds>

When $m > 1$ put $h_0 = q_0^(m - 1)$ as in (4.4); when $m = 1$ choose a power $h_0 =
  p^(nu_0) > 1$ fixing the same finite constants. In either case set $nu_0 = log_p h_0$.

#thm([Proposition 4.3.])[
  (The fixed normalized transfer).  #emph[At the finite marking stage of 39, the operator
#[#set math.equation(numbering: n => "(4.11)")
 $ S \( f \) = frac("C"^(nu_0) \( f eta \), eta) quad \( f in R \) $ <eq:trans-S>]

 is continuous, $k$-linear, and $G$-equivariant. It satisfies $S \( b^(h_0) f \) = b S \( f \)$.
   For $m > 1$, the maps on $R$ induced by nonzero translation augmentations $sans(N)_(q_0^a) arrow.r k$,
   after the root identification, are nonzero scalar multiples of $S^a$.
   For $m = 1$ one can choose the toral frame so that
#[#set math.equation(numbering: n => "(4.12)")
 $ S "Fr"^(nu_0) = 1 . $ <eq:trans-height-one-split>]

]
  #emph[Extend $S$ to $B'$ by $S \( f \) = S \( e f \)$, with image in $e B'$.
    There is a fixed integer $c gt.eq 0$ such that, for every integer $D$,
#[#set math.equation(numbering: n => "(4.13)")
 $ S \( x^(- D) A' \) subset x^(- ceil.l D \/ h_0 ceil.r - c) A' . $ <eq:trans-pole-bound>]

 Every sufficiently large $D_0$ makes $cal(P) = x^(- D_0) A'$ stable under $S$.
   Every fixed bounded-pole lattice, including any compact family of cochains with values in it,
   is carried into $cal(P)$ by all sufficiently large iterates.]
  #emph[The volume, its inverse, the whole trace-pairing matrices and their inverses have one fixed pole bound
    $c'$. In the normalized basis $b_i^(1 \/ h)$, $h = h_0^a$,
    their transported matrices have pole losses at most $c' \/ h$.
    The normalized Cartier maps are adjoint to the inclusions of root Laurent representatives under the residue
    pairings with the transported volumes.]
] <prop:trans-cartier>

#proof[
  The formula and 39 give equivariance and $h_0^(- 1)$-linearity.
    This is $k$-linearity because $h_0$ fixes the finite field.
    Continuity follows by grouping finitely many residue exponents in the $h_0$-basis expansion;
    multiplication by the fixed volume and its inverse is continuous on bounded-pole steps.
    The intermediate volume factors cancel under composition, so $S^a \( f \) =
    "C"^(a nu_0) \( f eta \) \/ eta$ for every $a gt.eq 1$.
  Suppose first that $m > 1$. Put $s_q = product_i D_i^(q - 1) in Lambda_q$.
    A $Lambda$-linear functional $sans(N)_q arrow.r k$ is evaluation at a socle element of $Lambda_q$.
    Its space is the one-dimensional line generated by evaluation at $s_q$. Make $U$ pro-$p$.
    The action on this line is a continuous character to $k^times$, a group of order prime to $p$,
    so it is trivial. The maps therefore descend with their natural actions.
    Successive coinduction composes the basic socle evaluations into evaluation at
  $ product_(j = 0)^(a - 1) s_(q_0) \( D_1^(q_0^j) \, dots.h \, D_d^(q_0^j) \) = product_i D_i^(q_0^a - 1) \, $
  which is nonzero in $Lambda_(q_0^a)$. Thus these composites do not vanish.
    The coherence of 38 identifies their coefficient maps with the root-twisted composites of $T_(eta \, h_0)$.
    In selfmap notation these are $S^a$. 39 identifies any other nonzero augmentation with a nonzero constant
    multiple; the constants introduce no semilinear twist because all chosen powers fix $k$.
  Suppose now that $m = 1$. We use the order-$p$ torsor $C = R^(1 \/ p)$ under the fixed group $mu_p^r$ from 39.
    Its character decomposition is strongly graded by $\( bb(Z) \/ p bb(Z) \)^r$,
    with neutral component $R$ and invertible character components #cite(label("milne2017")) Theorem 12.12 and
    Remark 12.13. The strong grading uses the torsor hypothesis:
    after a faithfully flat trivialization, each character component is free of rank one and multiplication
    between components is an isomorphism. These properties descend to $R$.
    Zariski locally on $"Spec" R$, choose generators $z_i$ of the fundamental character components.
    Strong grading makes each $z_i$ a unit, with $b_i = z_i^p in R^times$.
    The monomials $z^alpha$, $0 lt.eq alpha_i < p$, form an $R$-basis of $C$.
    Taking $p$th powers shows that the $b^alpha$ form an $R^p$-basis of $R$, so the $b_i$ are a $p$-basis.
  For the standard toral Lie basis, $delta_i \( z_j \) = delta_(i j) z_j$.
    (4.8) gives $partial_i \( b_j \) = delta_(i j) b_j$, so the already constructed volume is locally
  $ eta = d log b_1 and dots.h.c and d log b_r . $
  On overlaps a different choice has $z'_i = c_i z_i$ with $c_i in R^times$, hence $b'_i =
    c_i^p b_i$ and $d log b'_i = d log b_i$. These local descriptions therefore agree with the global volume.
    We retain this standard toral normalization; the comparison constants multiply the torsor functionals.
    The logarithmic Cartier formula gives $"C" \( eta \) = eta$.
    Consequently, for every chosen $h_0 = p^(nu_0)$ fixing $k$,
  $ S \( f^(h_0) \) = frac("C"^(nu_0) \( f^(h_0) eta \), eta) = f thin frac("C"^(nu_0) \( eta \), eta) = f . $
  This proves (4.12) at the existing finite frame stage. The natural auxiliary actions at higher levels are
    retained; no splitting of a higher torsion quotient or further shrink of $U$ is required.
    No positive-dimensional local distribution ring is used in this case.
  We next prove the pole bound in the whole model. Fix an $A$-basis $b_1 \, dots.h \, b_v$ of $A'$.
    The finite étale base change makes $B' ""^(1 \/ h_0)$ free over $B$ on
  $ b_i^(1 \/ h_0) x^(alpha_1 \/ h_0) y_1^(alpha_2 \/ h_0) dots.h.c y_(r - 1)^(alpha_r \/ h_0) \, wide 0 lt.eq
    alpha_j < h_0 . $
  The $B$-linear map $T_(eta \, h_0)$ after multiplication by $e$, with output included in $B'$,
    is a fixed finite matrix in these bases. Its entries belong to $B$ and so have a common finite $x$-pole bound.
    For $f in x^(- D) A'$, its root is a sum of $x^(- D \/ h_0) a_i^(1 \/ h_0) b_i^(1 \/ h_0)$, with $a_i in A$.
    Group the exponents in each $a_i^(1 \/ h_0)$ modulo the integral lattice.
    The resulting coefficients lie in $A$. Reducing $- D$ modulo $h_0$ loses at most $ceil.l D \/ h_0
    ceil.r$ integral powers of $x$. The fixed matrix contributes at most a further $c$,
    proving (4.13) for all $D$, including negative $D$. This also proves continuity on compact coefficient lattices.
  If $D_(a + 1) lt.eq D_a \/ h_0 + c + 1$, then
  $ D_a lt.eq h_0^(- a) D + \( c + 1 \) frac(1 - h_0^(- a), 1 - h_0^(- 1)) . $
  Choose $D_0 > \( c + 1 \) \/ \( 1 - h_0^(- 1) \)$. The same inequality implies $ceil.l D_0 \/ h_0 ceil.r +
    c lt.eq D_0$ and, for each fixed $D$, eventually $D_a lt.eq D_0$.
    The estimates apply to the whole lattice, uniformly over any compact parameter set.
    A compact bounded-pole cochain family uses one such $D$, so the assertion about cochains follows as well.
  For the trace and volume assertion, set
  $ theta = d log x and d y_1 and dots.h.c and d y_(r - 1) . $
  Write $eta = a_R theta$ with $a_R in R^times$. Extend its coefficient to the unit $a =
    a_R + \( 1 - e \) in B' ""^times$ and use $a theta$ on the whole algebra.
    The trace form of the finite étale algebra is perfect; therefore the matrices
  $ #scale(x: 120%, y: 120%)[\(] "Tr"_(B' \/ B) \( b_i b_j \) #scale(x: 120%, y: 120%)[\)]_(i j) \, wide
    #scale(x: 120%, y: 120%)[\(] "Tr"_(B' \/ B) \( a b_i b_j \) #scale(x: 120%, y: 120%)[\)]_(i j) $
  and their inverses have entries in $B$. The multiplication matrices of $e \, a \, a^(- 1)$ do also.
    Taking a maximum bounds all their poles by one $c'$. Transport by the root isomorphism replaces every matrix
    entry by its $h$th root. Its pole bound in the original $x$-valuation is consequently $c' \/ h$.
    The volume at this level is
  $ eta_h = a^(1 \/ h) thin d log x^(1 \/ h) and d y_1^(1 \/ h) and dots.h.c and d y_(r - 1)^(1 \/ h) . $
  This is transport along an isomorphism, not differential pullback under an inseparable map.
  Finally take a finite Laurent principal-part representative $w$ on one root grid and a bounded-pole coefficient
    on the next grid, and pair them by the coefficient residue of their product times $eta_h$,
    after the finite étale trace. In the logarithmic $x$-coordinate the residue selects exponent zero;
    in each ordinary $y$-coordinate it selects exponent $- 1$. (4.9) therefore gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ chevron.l w \, T_(h \, h h_0) \( f \) chevron.r_h = chevron.l iota w \, f chevron.r_(h h_0) \,
     $ <eq:trans-residue-adjoint>]
  where $T_(h \, h h_0)$ is the $h$-root of $T_(eta \, h_0)$ and $iota$ is inclusion of the same Laurent
    expression on the finer grid. For instance the ordinary one-variable test is $h_0 i + j = - 1$ on both sides;
    the logarithmic test is $h_0 i + j = 0$. The coefficient field is fixed by $h_0$,
    so taking the selected coefficient introduces no field twist.
    Finite étale trace commutes with this calculation, since its root matrix is the transported trace matrix.
    Multiplication by the volume coefficient and its inverse cancels as in (4.7).
    Thus the scalar monomial check proves (4.14) in the whole basis and then after $e$.
    Continuity extends the identity whenever a convergent Laurent expression defines a residue functional.
    This is the adjoint identity used below; no trace for the purely inseparable root extension is involved. ◻
]

#thm([Lemma 4.4.])[
  (One bound for a fixed finite diagram).  #emph[Fix a finite Yoneda diagram of translation representations,
    descend it at a finite marking stage, and fix a cohomological degree.
    Its successive boundary maps can be represented by an operator on cocycles that loses at most one fixed
    $x$-pole order. Under 38, all of its coinduced diagrams use the roots of this same operator and its chosen
    splittings.]
] <lem:trans-diagram-bound>

#proof[
  Every term and image bundle is finite locally free on the affine scheme $"Spec" R$.
    Each surjection onto such an image has an underlying $R$-linear section.
    Choose these finitely many sections once. Embed their finite projective modules in finite free modules and
    choose finitely generated whole $A$-lattices; each section is then a finite matrix over the localization and
    has a fixed pole loss. The group action on a fixed lattice has a uniform pole bound,
    by the finite torsor realization and the bounded-step continuity of Lemma 1.3, Proposition 2.4.
    Since $g \( x \) \/ x$ is an integral unit, the same bound applies to every shift of that lattice.
    The finitely many group differentials and chosen sections computing the composite boundary thus have a common
    total pole loss. This constructs the required operator on continuous cocycles, with their bounded-pole convention.
  The natural identity (4.5) carries the entire diagram, including its arrows, to its root diagram.
    Transport each of the already chosen sections by the same root isomorphism.
    Computing the boundary with those sections is exactly the root of the original computation.
    Hence the increasing ranks of the coinduced representations require no new choices of matrices or new pole
    estimate. This statement concerns realization of a fixed diagram;
    comparisons of extension classes after one common auxiliary shrink are supplied in 2. ◻
]

==== 4.2 The Laurent model for analytic compact supports <sec:laurent>

We now express the compact supports of the geometric calculation as convergent Laurent series.
  The output is an explicit module with the actual stabilizer action and finite cohomology and homology.
  Its finite-field form will carry the residue map that is transpose to the Cartier transfer,
  including series with unbounded root denominators.

Fix $1 lt.eq m < n$, put $r = n - m$ and $s = r - 1$, and retain the whole finite free model

$ A = k \[ \[ x \, y_1 \, dots.h \, y_s \] \] \, wide B = A \[ 1 \/ x \] \, wide A' = xor.big_(nu = 1)^N A b_nu \,
  wide B_U = e A' \[ 1 \/ x \] $

of 13. Thus $A' \[ 1 \/ x \]$ is finite étale over $B$, its multiplication laws in the displayed basis are
  integral, and $e$ is a $G$-invariant idempotent. All operations involving $e$ below take place in the whole free
  module. In particular no specialization of $e$ at $x = 0$ is used.

Write $F = C^flat$, fix its absolute value, and let $X$ be the perfected characteristic-$p$ analytic domain

$ 0 < \| x \| < 1 \, wide \| y_j \| < 1 quad \( 1 lt.eq j lt.eq s \) $

over $F$. Its finite marked cover is denoted by $Z_U$. The sheaf $cal(O)^flat$ on this characteristic-$p$ space is
  its structural sheaf. The present calculation consequently concerns a different space from the untilted affine
  line in 25.

===== 4.2.1 Complete Laurent steps <complete-laurent-steps>

For a compact profinite set $cal(D)$, put $R_(cal(D)) = C \( cal(D) \, F \)$, with its supremum norm.
  An empty parameter set will not be used; when there is no parameter we take a one-point set. Set

$ cal(E) = bb(Z) \[ 1 \/ p \] times #scale(x: 120%, y: 120%)[\(] bb(Z) \[ 1 \/ p \]_(> 0)
  #scale(x: 120%, y: 120%)[\)]^s \, wide \| J \| = J_1 + dots.h.c + J_s . $

If $s = 0$, the second factor has one element and $\| J \| = 0$. For $L > delta > 0$ define

#[#set math.equation(numbering: n => "(4.15)")
 $ w_(L \, delta) \( I \, J \) =
   cases(delim: "{", L I - delta \| J \| \, & I gt.eq 0 \,, delta I - delta \| J \| \, & I < 0 .) $ <eq:laurent-weight>]

Let $cal(L)_(L \, delta) \( cal(D) \)$ consist of the sums

$ f = sum_(\( I \, J \) in cal(E)) a_(I \, J) x^I y^(- J) \, wide a_(I \, J) in R_(cal(D)) \, $

such that the numbers $parallel a_(I \, J) parallel_sup exp \( - w_(L \, delta) \( I \, J \) \)$ tend to zero
  outside finite subsets of $cal(E)$. Equip this space with the maximum of these numbers as norm.
  It is a complete nonarchimedean normed module: coefficientwise limits of a Cauchy sequence have uniformly small
  tails, which proves both the required decay and convergence in the norm. Finite sums are dense. Define

$ cal(L) \( cal(D) \) = "colim"_(L \, delta) cal(L)_(L \, delta) \( cal(D) \) . $

The transitions increase $L$ and decrease $delta$. They are norm nonincreasing,
  since these changes increase every weight. Rational pairs $L > delta > 0$,
  or the sequence $\( L \, delta \) = \( j \, j^(- 1) \)$ with $j gt.eq 2$, are cofinal.
  The colimit here and below has the complete-step convention of 2; a parameter family belongs to one step.

Multiplication by an element of $B$ is multiplication of Laurent series followed by discarding every monomial
  whose exponent in some $y_j$ is nonnegative. This prescription is well defined in the complete steps.
  Indeed, if $a in x^(- c) A$, every monomial of $a$ has exponents $\( A_0 \, B_0 \)$ with $A_0 gt.eq -
  c$ and all $\( B_0 \)_j gt.eq 0$. Whenever its product survives the projection,

#[#set math.equation(numbering: n => "(4.16)")
 $ w_(L \, delta) \( I + A_0 \, J - B_0 \) gt.eq w_(L \, delta) \( I \, J \) - L c . $ <eq:laurent-matrix-bound>]

This follows because the increasing piecewise linear function $I mapsto L I$ for $I gt.eq 0$,
  $I mapsto delta I$ for $I < 0$, has slopes between $delta$ and $L$.
  At a fixed root grid, multiplying one monomial by $a$ gives a convergent series:
  after projection only finitely many $y$-exponents survive below the original pole orders,
  and the remaining $x$-orders tend to infinity. The bound extends multiplication from finite sums to arbitrary
  sums, proves its continuity, and justifies associativity by dense finite-sum approximation.
  A matrix with entries in $x^(- c) A$ has the same bound, up to the maximum norm of its finitely many entries.

Consequently $e$ is a continuous chain-compatible idempotent on the whole ambient Laurent module. We use the notation

$ cal(W)_(cal(D)) = e #scale(x: 120%, y: 120%)[\(] cal(L) \( cal(D) \) ⊗_A A' #scale(x: 120%, y: 120%)[\)] \, wide
  W_(cal(D)) = e #scale(x: 120%, y: 120%)[\(] cal(L) \( cal(D) \; k \) ⊗_A A' #scale(x: 120%, y: 120%)[\)] \, wide
  W = W_({ * }) \, $

where $cal(L) \( cal(D) \; k \)$ denotes the same sums with coefficients in $C \( cal(D) \, k \)$.
  The tensor notation means the finite sum on the displayed basis, with the multiplication action just defined;
  it introduces no additional completion. The image of $e$ in each step is closed, since it is the kernel of $1 -
  e$, and is therefore complete.

For finite-field coefficients the decay condition has a useful strong consequence.
  For every real $M$, a family in one step has only finitely many nonzero coefficients with $I lt.eq M$,
  uniformly on $cal(D)$. Indeed, every nonzero coefficient has supremum norm one, whereas

$ I lt.eq M quad arrow.r.double quad w_(L \, delta) \( I \, J \) lt.eq L max \( M \, 0 \) . $

Infinitely many such coefficients would contradict decay.
  Each of the remaining finitely many coefficient functions is locally constant.
  In particular bounded-$x$ truncation produces a locally constant family of finite principal parts,
  even when the original exponents have unbounded $p$-power denominators.
  For a one-point parameter the steps are separable: their finite sums have coefficients in the finite field and
  indices in the countable set $cal(E)$. Thus the complete steps of $W$ are Polish additive groups.
  A condition that coefficients vanish outside a prescribed subset, for example $I gt.eq a > 0$,
  is closed on each such step.

===== 4.2.2 The support complex and coefficient descent <the-support-complex-and-coefficient-descent>

Let $Q_k = \| k \|$. The operator $phi$ used in this subsection raises coefficients in $F$ to their $Q_k$th powers
  and fixes $x^I$, $y^(- J)$, and every $b_nu$. It fixes the structure constants of $A'$ and the matrix of $e$,
  since they are defined over $k$. This is #emph[coefficient-only] Frobenius. For a complex $K$ with this operator write

$ K^(phi = 1) = "fib" \( phi - 1 : K arrow.r K \) . $

#thm([Proposition 4.5.])[
  (Laurent support comparison).  #emph[With the uniform compact-support convention of 21,
    there are natural quasi-isomorphisms
#[#set math.equation(numbering: n => "(4.17)")
 $ upright(bold(R)) Gamma_c \( Z_U \, cal(O)^flat \; cal(D) \) tilde.eq cal(W)_(cal(D)) \[ - r \] \, wide
   upright(bold(R)) Gamma_c \( Z_U \, cal(O)^flat \; cal(D) \)^(phi = 1) tilde.eq W_(cal(D)) \[ - r \] .
   $ <eq:laurent-descent>]

 They are compatible with finite marking maps, the idempotent $e$, and the actions defined over $k$.
   The support cohomology is therefore concentrated in cohomological degree $r$,
   both before and after coefficient descent. Every fixed normalized root basis $b_1^(1 \/ h) \, dots.h \,
   b_N^(1 \/ h)$ gives the same module and the same complete-step category.]
] <prop:laurent-model>

#proof[
  We first calculate on $X$ with scalar coefficients. Compact bounds are cofinal among boxes
  $ K \( a \, b \, rho \) = { a lt.eq \| x \| lt.eq b \, med \| y_j \| lt.eq rho med \( 1 lt.eq j lt.eq s \) } \,
    wide 0 < a < b < rho < 1 . $
  In fact a quasicompact bound has its $x$-norm bounded away from zero and all coordinate norms bounded strictly
    below one; one can then choose $rho$ larger than its $x$-bound and every $y$-bound.
    Interleaving a slightly smaller closed box and a slightly larger open box gives the same support colimit.
    This permits strict gaps in every radius used below and avoids assertions about a particular higher-rank
    boundary point.
  The complement of a box is the union of the two $x$-exteriors and the $s$ individual $y$-exteriors.
    Its finite Čech restriction diagram, augmented by sections on $X$, calculates the support fiber.
    Every intersection is a product of open discs, punctured discs, and annuli.
    Exhaust it by a countable sequence of closed polyannuli and polydiscs, after adjoining all coordinate roots.
    The root polydisc, rational-localization and product constructions make these closed domains affinoid
    perfectoid #cite(label("scholzePerfectoid2012")) Proposition 5.20, Theorem 6.3(i)–(ii), and Proposition 6.18.
    Their structural sheaf is v-acyclic by #cite(label("scholzeDiamonds2017")) Proposition 8.8.
    Their function algebras are the corresponding completed Laurent algebras.
    The restriction maps have dense image: finite Laurent polynomials belong to both domains and are dense in the
    smaller-domain algebra. With parameters, finite sums whose coefficients are in $R_(cal(D))$ have the same
    property. Equivalently, first approximate a continuous parameter family by a finite clopen partition and then
    approximate its finitely many values by Laurent polynomials.
    The complete normed-space inverse-limit lemma, 22, eliminates the first derived inverse limit.
    There are no higher derived limits for a countable sequence.
    Thus these open intersections have their ordinary Laurent functions in degree zero, with no additional cohomology.
  Here is the resulting splitting of the support diagram. In an unpunctured coordinate $y_j$,
    a function on the exterior annulus is the sum of its nonnegative and strictly negative Laurent parts.
    The nonnegative part extends to the whole disc, since it converges at every radius less than one.
    Its summand in the restriction complex is contractible. The negative part is the quotient summand,
    in degree one. These projections have norm at most one on each closed annulus;
    on open domains one first inserts a radius gap. They are $R_(cal(D))$-linear and act coefficientwise in the
    other coordinates.
  For the punctured coordinate write an exterior pair as $\( f_(upright("in")) \, f_(upright("out")) \)$.
    The negative part of $f_(upright("in"))$ extends to the whole punctured disc:
    convergence towards zero is the only extra condition for a negative-power series.
    Likewise the nonnegative part of $f_(upright("out"))$ extends to the whole punctured disc.
    Subtracting these global functions diagonally leaves the unique pair
  $ #scale(x: 120%, y: 120%)[\(] f_(upright(i n \, +)) - f_(upright(o u t \, +)) \, thin f_(upright(o u t \, -)) -
    f_(upright(i n \, -)) #scale(x: 120%, y: 120%)[\)] . $
  Encode it by the single Laurent series
  $
    f = \( f_(upright(i n \, +)) - f_(upright(o u t \, +)) \) - \( f_(upright(o u t \, -)) - f_(upright(i
    n \, -)) \) . $
  Thus its normal representative is $\( f_(+) \, - f_(-) \)$.
    The minus sign ensures that multiplication or substitution crossing the exponent $I =
    0$ is represented by the usual Laurent operation: eliminating an outer nonnegative part by a diagonal section
    introduces its negative at the inner end. This quotient is again in degree one,
    and it retains every exponent $I in bb(Z) \[ 1 \/ p \]$, including zero exactly once.
  Apply these splittings successively to the finite product restriction diagram.
    A summand which extends in any one coordinate is contractible by the corresponding one-coordinate splitting.
    The only remaining summand has every $y$-exponent negative and the indicated two-ended $x$-representative.
    It lies in degree $s + 1 = r$. The splittings commute in distinct coordinates,
    so this is a calculation of the entire complex, not only of its highest quotient.
    It also proves the assertion for $s = 0$.
  For the surviving inner positive $x$-powers choose a radius $exp \( - L \)$ slightly below the inner support
    radius. For the surviving negative $x$-powers and negative $y$-powers choose a common outer radius
    $exp \( - delta \)$ slightly above every outer support radius. Their Gauss norms are exactly
  $ parallel a_(I \, J) parallel_sup exp \( - L I + delta \| J \| \) quad \( I gt.eq 0 \) \, wide
    parallel a_(I \, J) parallel_sup exp \( - delta I + delta \| J \| \) quad \( I < 0 \) . $
  Convergence on a closed polyannulus is precisely decay outside finite subsets for these norms.
    Every support class has these bounds after inserting the radius gaps.
    Conversely a series in one such step converges on the smaller inner domain and the larger outer collars,
    and hence supplies a class for a box with separated radii.
    Enlarging supports decreases the inner radius and increases the outer radii;
    on these representatives the map retains the same coefficients.
    The support colimit is therefore exactly $cal(L) \( cal(D) \)$.
    This calculation uses the finite restriction diagram followed by a filtered colimit of supports.
    It does not interchange that colimit with an inverse limit of shrinking supports.
  We next pass to the actual finite marked algebra. On a closed base chart with perfectoid algebra $R$,
    the whole algebra
  $ A' \[ 1 \/ x \] ⊗_B R = xor.big_(nu = 1)^N R b_nu $
  is already complete as a finite free $R$-module. It is finite étale and affinoid perfectoid by
    #cite(label("scholzeDiamonds2017")) Theorem 6.1(i). Relative Frobenius for an étale algebra is an isomorphism
    #cite(label("stacks")) Lemma 41.14.3, Tag 0EBS; consequently this algebra is also the perfected marked
    extension, rather than only an unperfected approximation.
    Restrictions use the same whole basis, so the function complex is the finite sum of the scalar complexes.
    The matrix $e$ commutes with every restriction and is an actual chain idempotent.
    Taking its image commutes with the finite fibers and filtered support colimit.
    For the intermediate inverse limits its image remains complete and the transition maps remain dense:
    apply the target idempotent to ambient approximants. Hence the preceding inverse-limit argument applies there
    as well.
  This computation uses all compact supports on $Z_U$. Pullbacks of quasicompact bounds under a finite map are
    quasicompact, and the image of a quasicompact bound is a quasicompact bounded subset of $X$.
    Thus pulled-back boxes form a cofinal support system upstairs.
    This establishes the first quasi-isomorphism in (4.17) on the actual cover.
  Coefficient Frobenius and its inverse are continuous between steps.
    For example, raising a coefficient to its $Q_k$th power changes a weight $w$ to $Q_k w$;
    this is the step with parameters $\( Q_k L \, Q_k delta \)$, followed if needed by a cofinal enlargement.
    It remains to check surjectivity of $phi - 1$, including parameters. For $b in F$, the equation
  $ a^(Q_k) - a = b $
  has a solution with $\| a \| lt.eq \| b \|$. If $\| b \| < 1$, take $a = - sum_(j gt.eq 0) b^(Q_k^j)$.
    If $\| b \| = 1$, any root is integral. If $\| b \| > 1$, a root has norm $\| b \|^(1 \/ Q_k)$.
    These choices have continuous local branches: around a root $a_0$ for $b_0$, add the small solution for $b -
    b_0$. Near a point with $\| b_0 \| gt.eq 1$ take $\| b - b_0 \| < 1$, so the same bound is retained;
    on $\| b \| < 1$ use the displayed series itself. For a continuous function on a compact profinite $cal(D)$,
    a finite clopen refinement of these local charts therefore gives a continuous solution with $parallel a
    parallel_sup lt.eq parallel b parallel_sup$.
  Apply this construction separately to every Laurent coefficient.
    The weighted norms do not increase, so all the chosen coefficients assemble to a family in the original
    complete step. Uniformly small tails make that assembled family continuous even though the finite clopen
    partitions used for different coefficients may differ. Solving on the whole finite sum and then applying $e$
    proves surjectivity on $cal(W)_(cal(D))$. Its kernel is exactly $W_(cal(D))$,
    since the fixed elements of $F$ are $k$ and $e$ is fixed. This proves the second quasi-isomorphism.
  Finally, relative Frobenius identifies each fixed root version of $A' \[ 1 \/ x \]$ with its base change to
    $B^(1 \/ h)$. Thus $b_nu^(1 \/ h)$ is a basis over the perfected base.
    Any two fixed such bases are related by invertible matrices over a finite root version of $B$,
    with bounded $x$-poles and no negative $y$-powers. The bound (4.16), rescaled to that root grid,
    makes both basis changes continuous. If a fixed matrix before taking roots has pole bound $c$,
    its $h$-root has bound $c \/ h$. Moreover, when $h divides h'$,
    each $b_nu^(1 \/ h)$ expands integrally in the basis $b_mu^(1 \/ h')$:
    it is the $\( h' \/ h \)$th power of a basis element, and the multiplication laws of the root model are
    integral. These observations prove both the basis assertion and compatibility with the stated operations. ◻
]

===== 4.2.3 Uniform continuity of the group action <uniform-continuity-of-the-group-action>

#thm([Lemma 4.6.])[
  #emph[The $G$-action on $W$ and on $cal(W)_(cal(D))$ is jointly continuous from a complete step,
    with a compact set of group and parameter values, into a complete step. It is uniformly equicontinuous there.
    The same holds for multiplication by the finite marked function algebra, fixed root-basis changes,
    and the finite matrices occurring in continuous group resolutions.
    Absolute Frobenius is an invertible additive operator on these modules.
    Its sufficiently divisible powers fixing $k$ commute with $G$ and act by chain automorphisms on the group
    complexes over $k$.]
] <lem:laurent-action>

#proof[
  We check the scalar coordinate changes first. An integral formal automorphism preserving $\( x \)$ factors into
    three types:
  $ x mapsto x u \( x \, y \) \, quad y mapsto y \; wide x mapsto x \, quad y mapsto y + c \( x \) \; wide
    x mapsto x \, quad y mapsto v \( x \, y \) \, $
  where $u$ is an integral unit, $c \( x \) in x k \[ \[ x \] \]^s$,
    and the last map preserves $\( y \)$ and has invertible linear Jacobian in $y$ over $k \[ \[ x \] \]$.
    To obtain the factorization, first remove the $x$-unit substitution by its formal inverse.
    For the residual map fixing $x$, subtract the value of its $y$-coordinates at $y = 0$;
    the remaining map fixes $\( y \)$ and its $y$-Jacobian is invertible. All inverse maps are integral.
    These operations are continuous on formal jets, uniformly in a compact family.
  Fix a root grid $1 \/ h$ and a monomial $x^I y^(- J)$. For each of the three types every surviving output
    monomial $x^(I') y^(- J')$ satisfies
  #[#set math.equation(numbering: n => "(4.18)")
   $ I' gt.eq I \, wide \| J' \| lt.eq \| J \| + \( I' - I \) . $ <eq:laurent-action-order>]
  For the $x$-unit substitution, the expansion of $u^I$ on the root grid has only nonnegative additional $x$- and
    $y$-orders, giving the stronger bound $\| J' \| lt.eq \| J \|$.
    For translation, write $X = x^(1 \/ h)$ and $Y_j = y_j^(1 \/ h)$.
    Expanding $\( Y_j + c_j \( x \)^(1 \/ h) \)^(- h J_j)$, an increase $a_j \/
    h$ in its pole requires the factor $c_j \( x \)^(a_j \/ h)$, whose $x$-order is at least $a_j \/ h$.
    Summing over $j$ gives (4.18).
  For the third type use finite principal-parts duality, which also avoids choosing a preferred expansion of a
    general linear combination of the $y_j$. On the grid just fixed the negative $Y$-powers form
  $ H_(\( Y \))^s #scale(x: 120%, y: 120%)[\(] k \[ \[ X \, Y_1 \, dots.h \, Y_s \] \] #scale(x: 120%, y: 120%)[\)] \, $
  with coefficients extended in $X$ as needed. A principal part $Y^(- j)$ pairs with $Y^(j - 1) thin d Y_1
    dots.h.c d Y_s$ by coefficient extraction. This is a perfect pairing between every finite principal-part
    truncation and the corresponding quotient of the power-series ring.
    If $v$ preserves $\( Y \)$, then its inverse and the determinant of its inverse Jacobian are integral, and
  $ \( v^(- 1) \)^(*) \( Y^(j' - 1) thin d Y_1 dots.h.c d Y_s \) $
  has total $Y$-degree at least $\| j' \| - s$. It cannot pair nontrivially with $Y^(- j)$ when $\| j' \| > \|
    j \|$. Every coefficient remains in $k \[ \[ X \] \]$. Thus here $I' gt.eq I$ and $\| J' \| lt.eq \| J \|$.
    The pairing description is the usual change-of-variables map on the finite Čech complex:
    it is first checked on monomial fractions by coefficient extraction and then on their finite principal-part
    span. Hence it represents the geometric support pullback. The case $s = 0$ requires no such step.
  The two inequalities in (4.18) are stable under composition. They imply
  $ w_(L \, delta) \( I' \, J' \) gt.eq w_(L \, delta) \( I \, J \) wide \( L > delta > 0 \) . $
  When both $x$-exponents are negative this uses the slope $delta$; when both are nonnegative it uses $L gt.eq
    delta$; when they cross zero the excess is at least $\( L - delta \) I'$.
    The output of a fixed monomial is convergent. For translations,
    after $I'$ becomes nonnegative the weight increases by at least $L - delta$ per additional unit of pole,
    and at a fixed grid only finitely many terms precede that crossing.
    For a map preserving $\( y \)$, the total $y$-pole order is bounded and its remaining $x$-series converges.
    The $x$-unit case has the same property.
  These expansions also occur on actual analytic collars. For example
  $ \( y + x \)^(- 1) = sum_(j gt.eq 0) \( - x \)^j y^(- j - 1) $
  converges on $\| x \| < \| y \|$, and its term weights are $\( L - delta \) j - delta$.
    Any compact support bound can be enlarged so that its $y$-radius exceeds its $x$-radius.
    The same enlargement works for every integral $c \( x \)$ because $\| c \( x \) \| lt.eq \| x \|$.
    For maps preserving $\( y \)$ the ideal and its inverse have the same total-radius bounds;
    finite Čech refinements give the principal-parts pullback above.
    Thus the algebraic formulas agree with the canonical support action used in 42.
  All coefficients of these integral maps have norm at most one.
    The weight estimate therefore gives a uniform operator bound on each complete scalar step.
    For a fixed monomial, every bounded-weight output truncation involves finitely many monomials on its fixed
    root grid and depends on finitely many formal jets. It consequently varies continuously with the group
    element. For an arbitrary convergent sum, discard a uniformly small tail and apply this assertion to its
    finite remainder. This proves joint continuity and equicontinuity, including all compact parameters.
    Operator-norm continuity in the group element is neither asserted nor needed.
  On the whole finite model, the group action is the scalar pullback just treated followed by a finite basis
    matrix. The integral model of 13 and compactness give a uniform pole bound for those matrices and their
    inverses. Their entries vary continuously in the bounded-lattice topology.
    Apply (4.16); then pass to the invariant image of $e$. This proves the same assertions for the marked module.
    That bound also proves the claims about multiplication and root bases.
  For completeness, these estimates allow integration against compact free resolution terms as in 4.
    If a compact family has image $K_0$ in a complete linearly topologized $k$-step,
    the closed $k$-linear span of $K_0$ is compact. Modulo any open linear subgroup its image is the span of a
    finite set over the finite field, hence finite; this proves total boundedness,
    and completeness gives compactness. Enlarge the step first to contain the compact group translates if
    necessary. Summation against compact distributions, and the resolution comparison homotopies,
    therefore remain inside a complete step. No boundary image is replaced by its closure.
  Finally, absolute Frobenius raises coefficients and basis elements to their $p$th powers #emph[and scales every
    exponent by $p$]. The relative-Frobenius basis identifications in 42 and the rescaled weight condition show
    that this operation and its inverse act continuously between steps. It commutes with the geometric action.
    A power fixing $k$ is $k$-linear, so it commutes with the differentials and homotopies of resolutions over
    $k$. This operation is distinct from the coefficient-only $phi$ in (4.17). ◻
]

===== 4.2.4 Finiteness of cohomology and homology <finiteness-of-cohomology-and-homology>

#thm([Corollary 4.7.])[
  #emph[At every sufficiently deep product marking level used in 35,
    both $H_(upright("cts"))^a \( G \, W \)$ and $H_i^(upright("cts")) \( G \, W \)$ are finite-dimensional over
    $k$ for every $a \, i gt.eq 0$. Since $k$ is finite, these are finite groups.]
] <cor:laurent-finite>

#proof[
  Put $K = upright(bold(R)) Gamma \( G \, upright(bold(R)) Gamma_c \( Z_U \, cal(O)^flat \) \)$,
    with no external parameter. By 35, every $H^j \( K \)$ is finite-dimensional over $F$.
    By 43 the complete-step comparisons in 4 apply. The finite-type resolution in each degree commutes with taking
    the fiber of $phi - 1$. Thus
  #[#set math.equation(numbering: n => "(4.19)")
   $ K^(phi = 1) tilde.eq upright(bold(R)) Gamma \( G \, W \) \[ - r \] . $ <eq:laurent-group-descent>]
  One can equally form this fiber on bounded-step bar cochains:
    the parameter-uniform surjectivity proved above applies to the compact bar parameters,
    and the two descriptions agree.
  We recall explicitly the finite-dimensional semilinear argument.
    If $V$ is an $F$-vector space of dimension $d$ and $psi$ is an invertible $Q_k$-semilinear map,
    choose coordinates $psi \( z \) = A z^(\[ Q_k \])$ with $A$ invertible.
    For any target $t$, the equations $A z^(\[ Q_k \]) - z = t$ are, after multiplication by $A^(- 1)$,
    monic equations with pairwise coprime leading monomials $z_1^(Q_k) \, dots.h \, z_d^(Q_k)$.
    Monomial reduction gives a quotient algebra of dimension $Q_k^d$, with basis $product z_i^(a_i)$ for $0 lt.eq
    a_i < Q_k$. Their Jacobian is the invertible matrix $- A^(- 1)$, so that algebra is finite étale.
    As $F$ is algebraically closed, every fiber has $Q_k^d$ points.
    Consequently $psi - 1$ is surjective and its kernel is a $d$-dimensional $k$-vector space.
  Apply this to the bijective semilinear action of $phi$ on each $H^j \( K \)$.
    The long exact sequence of its fiber and the surjectivity in the preceding degree give
  $ H^j \( K^(phi = 1) \) = H^j \( K \)^(phi = 1) \, $
  which is finite over $k$. The shift in (4.19) gives finiteness of $H_(upright("cts"))^a \( G \, W \)$.
  The marked algebra acts continuously on $W$ by (4.16), and its finite subgroups have the trace-one functions
    supplied by 16. All the hypotheses of 8 are therefore satisfied.
    Its orientation for $G = P_n$ is trivial, and it identifies
  $ H_i^(upright("cts")) \( G \, W \) tilde.eq H_(upright("cts"))^(dim \( G \) - i) \( G \, W \) . $
  The right side is finite (and zero in negative degree), proving the assertion.
    The argument uses parameter families to justify the complexes;
    it makes no claim of finite dimension over $F$ or $k$ with an infinite external parameter retained.
    In that case the respective scalar rings are $R_(cal(D))$ and $C \( cal(D) \, k \)$. ◻
]

== 5 Residue cutoff and pro-transfer <part:cutoff>

==== 5.1 The residue quotient and the finite stable image <sec:cutoff>

This section has two outputs with different hypotheses. First,
  we prove that the stable Cartier image on the cohomology of a compact coefficient lattice is finite.
  The finite Laurent homology of 44 supplies this result through a residue quotient and compact duality.
  No next-height finiteness hypothesis is needed for this step.

The second output concerns the corresponding intersection in localized cohomology.
  Here we assume next-height finiteness and countability of one consecutive quotient of Cartier images.
  These additional inputs make the localization kernel finite on the relevant compact image and allow us to
  identify the two intersections. Section 2 will establish the consecutive-image hypothesis and use the resulting
  finite localized intersection.

Fix a height stratum and a sufficiently deep finite marking level as in Section 4.1, Section 4.2.
  All vector spaces in this section are over the #emph[finite] field $k$.
  Enlarge $k$ and the fixed power $h_0 = p^(nu_0) > 1$, if necessary, so that $h_0$-power Frobenius fixes $k$. Write

$ A = k \[ \[ x \, y_1 \, dots.h \, y_(r - 1) \] \] \, wide B' = A' \[ 1 \/ x \] \, wide B_U = e B' \, $

where $A'$ is the whole finite free model, with a fixed integral basis $b_1 \, dots.h \, b_t$,
  and $e$ is its $G$-invariant idempotent on the open. We use the normalized $k$-linear Cartier transfer $S$ of
  40; on $B'$ it means $f mapsto S \( e f \)$. Thus its output lies in $e B'$, and it is zero on $\( 1 - e \) B'$.

There is a constant $c_S gt.eq 0$, independent of the nonnegative integer $D$, such that

#[#set math.equation(numbering: n => "(5.1)")
 $ S \( x^(- D) A' \) subset.eq x^(- ceil.l D \/ h_0 ceil.r - c_S) A' . $ <eq:cutoff-pole-recurrence>]

All coefficient maps are $G$-equivariant and are continuous on a bounded pole lattice into the indicated lattice.
  In particular they act on the cochain and chain complexes of 2. Choose an integer $D_0$ sufficiently large that

#[#set math.equation(numbering: n => "(5.2)")
 $ D_0 > frac(c_S + 1, 1 - h_0^(- 1)) \, wide cal(P) = x^(- D_0) A' . $ <eq:cutoff-lattice-choice>]

We will increase $D_0$ once more for a residue bound below.
  The lattice $cal(P)$ is compact, metrizable, $G$-stable, and $S$-stable.
  Moreover, for every integer $D gt.eq 0$ there exists $a_0 \( D \)$ such that

#[#set math.equation(numbering: n => "(5.3)")
 $ S^a \( x^(- D) A' \) subset.eq cal(P) quad upright("for all ") a gt.eq
   a_0 \( D \) . $ <eq:cutoff-eventual-integrality>]

Indeed iteration of (5.1), with the rounding absorbed by $c_S + 1$, gives the upper bound

$ h_0^(- a) D + \( c_S + 1 \) frac(1 - h_0^(- a), 1 - h_0^(- 1)) $

for the pole order. The strict inequality in (5.2) proves (5.3).
  This conclusion is uniform on each indicated lattice and on compact families of its elements;
  its exponent is allowed to depend on $D$.

===== 5.1.1 Normalized bases and the positive Laurent subspace <normalized-bases-and-the-positive-laurent-subspace>

Put $h = h_0^a$, $x_h = x^(1 \/ h)$, $y_(j \, h) = y_j^(1 \/ h)$, and $b_(i \, h) = b_i^(1 \/ h)$.
  We regard all these root rings inside a common perfected coefficient ring.
  The $b_(i \, h)$ are the #emph[normalized basis at level $h$];
  they form a basis of $B' ""^(1 \/ h)$ over $B^(1 \/ h)$ and of the corresponding analytic coefficient module
  over the perfected base. This is an actual root basis, not a new choice of monomials made separately for each element.

The direction of the change of basis is important. If $h' = h h_0^v$,
  then $b_(i \, h)$ expands on the $b_(j \, h')$ with coefficients in $A^(1 \/ h')$.
  To see this, expand $b_i^(h_0^v)$ on the integral basis of $A'$ and take its $h'$th roots.
  Consequently this change of basis introduces neither negative x-orders nor negative y-orders.
  The opposite change of basis can have x-poles, but at each fixed level its matrix has bounded x-poles and no
  negative y-orders. The topology and cofinal complete steps supplied by 42 are independent of these fixed changes
  of basis.

Let $eta$ be the invariant volume of 39. Extend it arbitrarily by a volume generator on the complementary
  component of $B'$. At level $h$ write its transported version as

$ eta_h = theta_h thin d log x_h and d y_(1 \, h) and dots.h.c and d y_(r - 1 \, h) \, wide
  theta_h in \( B' ""^(1 \/ h) \)^times . $

The extension on the complementary component need not be invariant;
  all expressions eventually paired will lie in the $e$-component.
  Finite étaleness makes the trace pairing perfect. The matrix

#[#set math.equation(numbering: n => "(5.4)")
 $ cal(T)_h = #scale(x: 120%, y: 120%)[\(] "Tr"_(B' ""^(1 \/ h) \/ B^(1 \/ h)) \( b_(i \, h) b_(j \, h) theta_h \)
   #scale(x: 120%, y: 120%)[\)]_(i \, j) $ <eq:cutoff-trace-matrix>]

and its inverse act on the negative-y Laurent quotient. By increasing a fixed integer $c gt.eq 1$,
  we may assume that their coefficients, and all fixed multiplication matrices used with them,
  have x-poles at most $c \/ h$ and no negative y-orders. In fact these are the root transports of fixed matrices
  at level one. Increase $D_0$ so that

#[#set math.equation(numbering: n => "(5.5)")
 $ D_0 > c . $ <eq:cutoff-residue-margin>]

The choice still satisfies (5.2).

For a compact $k$-vector space $V$ write $V^or = "Hom"_(k \, upright("cts")) \( V \, k \)$ with the discrete
  topology. Composing with $"Tr"_(k \/ bb(F)_p)$ identifies this with the usual finite-field Pontryagin dual. Define

#[#set math.equation(numbering: n => "(5.6)")
 $ Q = "colim" #scale(x: 120%, y: 120%)[\(] cal(P)^or arrow.r^(S^or) cal(P)^or arrow.r^(S^or) dots.h.c
   #scale(x: 120%, y: 120%)[\)] \, $ <eq:cutoff-Q>]

and give $Q$ the discrete topology. The dual of $cal(P)$ is countable:
  a continuous functional depends on only finitely many coefficients in its whole finite basis,
  and $k$ and the monomial index set are finite and countable, respectively. Thus $Q$ is countable.
  The actions on these discrete duals are continuous, since the original action on the compact lattice is jointly
  continuous.

We recall explicitly the Laurent convention from 42. An element of $W$ is an $e$-supported expression on the whole
  basis with monomials

$ x^I y_1^(- J_1) dots.h.c y_(r - 1)^(- J_(r - 1)) \, wide I in bb(Z) \[ 1 \/ p \] \, quad
  J_j in bb(Z) \[ 1 \/ p \]_(> 0) \, $

whose coefficients are in $k$ and tend to zero in some weighted complete step

#[#set math.equation(numbering: n => "(5.7)")
 $ w_(L \, delta) \( I \, J \) =
   cases(delim: "{", L I - delta \| J \| \, & I gt.eq 0 \,, delta I - delta \| J \| \, & I < 0 \,) quad
   L > delta > 0 \, wide \| J \| = sum_j J_j . $ <eq:cutoff-weight>]

The norm of a nonzero monomial is $exp \( - w_(L \, delta) \( I \, J \) \)$.
  When $r = 1$ there are no y-variables, and all references to their negative parts are omitted.
  Multiplication by an analytic coefficient is followed by projection to the part strictly negative in every
  y-variable. Root denominators in an element of $W$ need not be bounded.

#prodef([Definition 5.1.])[
  An element $w in W$ belongs to $W_(+)$ if, in some normalized basis $b_(i \, h)$,
    every nonzero coefficient monomial of $w$ has $I gt.eq epsilon.alt$ for some real $epsilon.alt > 0$.
    The bound is uniform over its finitely many basis components.
    This condition imposes no bound on the denominators of the exponents in those components.
]

Positivity persists on every later normalized basis, by the integral change of basis described above.
  Hence the definition makes $W_(+)$ a vector subspace: two elements may be compared at one later level and with
  the smaller of their two positive bounds. The absolute Frobenius operator

$ Phi : W arrow.r W \, wide w mapsto w^(h_0) \, $

is a $k$-linear automorphism, as established on the support model in 42.
  It scales all exponents and transports the actual root basis. Both $Phi$ and $Phi^(- 1)$ preserve $W_(+)$.
  This operator is distinct from the coefficient-only Frobenius used to obtain $W$ in (4.17).

Our aim is to identify $Q$ with $W \/ W_(+)$. At root level $h$,
  the compact test lattice and the trace matrices have pole bounds of order $1 \/ h$.
  Hence a Laurent expression with a fixed positive x-gap is invisible to all sufficiently late residue tests.
  Conversely, a series with finite-field coefficients has only finitely many nonzero terms below any fixed
  x-order. Truncating those terms will define the residue class even when the remaining series has unbounded root
  denominators.

After constructing this quotient, we will prove that $W_(+)$ has zero group homology.
  Absolute Frobenius supplies the contraction, and countability will make boundaries open in each complete cycle
  space. Together these facts turn the contraction into an actual boundary identity.

===== 5.1.2 The residue map and its kernel <the-residue-map-and-its-kernel>

Let $W_(upright("fin"))$ be the subspace of elements whose root denominators are bounded; equivalently,
  the element can be expressed in a normalized basis at some level $h$ with all exponents in $h^(- 1) bb(Z)$.
  It can still be an infinite convergent series. For $w in W_(upright("fin"))$ at this level and $p_h in
  cal(P)^(1 \/ h)$ define

#[#set math.equation(numbering: n => "(5.8)")
 $ lambda_h \( w \) \( p_h \) = "res"_(x_h \, y_h) "Tr"_(B' ""^(1 \/ h) \/ B^(1 \/ h)) \( w p_h eta_h \) .
   $ <eq:cutoff-residue-pairing>]

In logarithmic x-coordinates the residue extracts x-exponent zero and y-exponent $- 1$ in every $y_(j \, h)$.
  This is also the ordinary formal residue after replacing $d log x_h$ by $d x_h \/ x_h$.

There are only finitely many nonzero terms with $I lt.eq M$ in any $k$-series satisfying (5.7),
  for every real $M$. Indeed their weights are bounded above by $max \( L M \, 0 \)$,
  whereas a weighted null series has only finitely many terms below any given weight bound.
  This uses finiteness of $k$: a nonzero coefficient has norm one.
  Applying the observation with the pole bounds for $p_h$ and $cal(T)_h$ shows that (5.8) uses only finitely many
  terms of $w$ and finitely many coefficients of $p_h$. It is therefore a well-defined continuous functional on
  $cal(P)^(1 \/ h)$.

Powering identifies $cal(P)^(1 \/ h)$ with $cal(P)$ as a compact $k$-vector space.
  Under this identification the map between consecutive compact lattices is

$ T_h : cal(P)^(1 \/ \( h h_0 \)) arrow.r cal(P)^(1 \/ h) \, wide T_h \( v \) =
  #scale(x: 120%, y: 120%)[\(] S \( v^(h h_0) \) #scale(x: 120%, y: 120%)[\)]^(1 \/ h) . $

The Cartier-residue identity gives

#[#set math.equation(numbering: n => "(5.9)")
 $ lambda_(h h_0) \( w \) = T_h^or lambda_h \( w \) . $ <eq:cutoff-residue-transition>]

For completeness, in one ordinary coordinate with $eta = d x$,
  Cartier takes $x^j$ to $x^(\( j + 1 \) \/ h_0 - 1)$ when the displayed exponent is an integer and to zero
  otherwise. Pairing this with $x^I$ gives the same coefficient as pairing $x^I$ at the next normalized root level
  with the original monomial. With $d log x$ the condition is divisibility of $j$ by $h_0$ instead.
  Taking products of these coefficient identities proves the assertion in several coordinates.
  Trace commutes with the étale root transport, and multiplication by $theta_h$ gives (5.9) for the volume used
  here; this is the compatibility in 40. Thus the $lambda_h$ define a map $pi_(upright("fin")) :
  W_(upright("fin")) arrow.r Q$.

#thm([Proposition 5.2.])[
  (The discrete residue quotient).  #emph[The finite-level pairings extend uniquely to an exact sequence of
    $k \[ G \]$-modules
#[#set math.equation(numbering: n => "(5.10)")
 $ 0 arrow.r W_(+) arrow.r W arrow.r^(med pi med) Q arrow.r 0 . $ <eq:cutoff-residue-sequence>]

 The map $pi$ is continuous on every complete coefficient step into the discrete countable module $Q$,
   including on compact parameter families. It is equivariant for the actual group actions on the support and
   compact-dual models. All these assertions allow arbitrary root denominators in $W$.]
] <prop:cutoff-residue>

#proof[
  First work at a bounded root level $h$. In the normalized whole basis,
    multiplication by (5.4) converts (5.8) into the scalar residue test on each basis coefficient.
    Testing against all elements of $x_h^(- D_0) A^(1 \/ h)$ detects every strictly negative-y monomial of this
    product whose x-order is at most $D_0 \/ h$. There is no undetected smaller y-pole at this level:
    every positive $J_j$ in the root grid is at least $1 \/ h$. Thus
  #[#set math.equation(numbering: n => "(5.11)")
   $ lambda_h \( w \) = 0 quad arrow.r.double quad "ord"_x \( w \) > frac(D_0 - c, h) quad
     upright("in the normalized basis at level ") h . $ <eq:cutoff-zero-test>]
  Here one multiplies the detected product by $cal(T)_h^(- 1)$, which loses at most $c \/ h$ in x-order.
    These are invertible matrices on the negative-y quotient:
    their entries and those of their inverses have no negative y-powers.
    Consequently projection to negative y-powers does not invalidate their inverse identity.
    This justifies using the inverse matrix in (5.11).
  Conversely, suppose that $w$ has x-order at least $epsilon.alt > 0$ in the normalized basis at level $h$.
    At a later level $h'$ the bound is still at least $epsilon.alt$.
    The trace/volume product then has x-order at least $epsilon.alt - c \/ h'$.
    If $h' > \( D_0 + c \) \/ epsilon.alt$, it pairs to zero with $cal(P)^(1 \/ h')$.
    In particular every bounded-root element of $W_(+)$ maps to zero in $Q$.
    If a bounded-root element maps to zero in $Q$, its functional is zero at some later level of the direct
    system; (5.11), (5.5) then put it in $W_(+)$. We have proved
  #[#set math.equation(numbering: n => "(5.12)")
   $ ker \( pi_(upright("fin")) \) = W_(upright("fin")) ∩ W_(+) . $ <eq:cutoff-finite-kernel>]
  To prove surjectivity, take a functional at any stage of (5.6).
    On the whole free lattice its finite coefficient expression is represented by finite scalar principal parts.
    Applying the inverse trace/volume matrix gives a bounded-root representative $v$ for (5.8);
    it lies in the whole Laurent module because that matrix has a fixed x-pole bound and no negative y-powers.
    Replace $v$ by $e v$. These two functionals agree after one transpose transition:
    the image of the corresponding transfer lies in $e B'$, where multiplication by $e$ is the identity.
    Thus $e v$ represents the same element of the colimit and belongs to $W_(upright("fin"))$.
    This argument uses the whole trace matrix and only then projects by $e$;
    it does not specialize an idempotent to the boundary or presume a free model for its component there.
  We next extend the map to $W$. Express $w in W$ on one fixed whole normalized basis.
    Truncate to the finitely many terms of x-order $I lt.eq M$, obtaining $v_0$.
    Let $c_e$ be a fixed x-pole bound for the matrix of $e$ in that basis. Taking $M > c_e + 1$ gives
  $ v = e v_0 in W_(upright("fin")) \, wide w - v = e \( w - v_0 \) in W_(+) . $
  The finitely many terms of $v_0$ have a common root denominator,
    and $e$ has a bounded root denominator at this fixed basis level, so the first inclusion holds.
    Define $pi \( w \) = pi_(upright("fin")) \( v \)$. Any two such choices differ by a bounded-root element of
    $W_(+)$; (5.12) proves independence of the choice. If $pi \( w \) = 0$,
    the bounded-root representative $v$ belongs to $W_(+)$, so $w$ also belongs to $W_(+)$. This proves exactness.
  For continuity, fix a complete weighted step and a normalized basis.
    A sufficiently small norm ball has all its nonzero monomials of weight greater than some $a > 0$.
    Such monomials necessarily have $I > a \/ L$, because $w_(L \, delta) \( I \, J \) lt.eq L I$ when $I gt.eq
    0$ and is nonpositive when $I < 0$. The ball is therefore contained in $W_(+)$.
    The kernel of the linear map to discrete $Q$ is open in this step.
    The same argument in supremum norms works for a compact parameter space:
    only finitely many bounded-x monomials remain uniformly in the parameter,
    and each retained $k$-coefficient is locally constant. Its image in $Q$ is finite.
  It remains to identify the group action, rather than just the kernel as a vector space.
    Work first at finite root level, and put $A_h = k \[ \[ x_h \, y_h \] \]$, $frak(m)_h = \( x_h \, y_h \)$,
    and $Omega_h = hat(Omega)_(A_h \/ k)^r$. Write $alpha = "Tr" \( w p_h eta_h \)$ as an ordinary top form,
    including the factor $x_h^(- 1)$ from $d log x_h$, with its negative-y Čech convention and its
    ordered-coordinate signs. Choose $N$ so that $x_h^N alpha$ has nonnegative x-orders.
    Its truncation modulo $x_h^N$ is a finite principal-part class
  $ xi_N in H_(\( y_h \))^(r - 1) \( Omega_h \/ x_h^N Omega_h \) =
    H_(frak(m)_h)^(r - 1) \( Omega_h \/ x_h^N Omega_h \) . $
  The equality holds because $x_h$ is nilpotent on the quotient.
    The connecting map for multiplication by $x_h^N$ on $Omega_h$ sends this class to the all-negative ordinary
    principal part of $alpha$ in $H_(frak(m)_h)^r \( Omega_h \)$, with the coordinate order fixing the Čech sign.
    This identifies the finite truncation with an intrinsic local-cohomology class.
    If $g \( x_h \) = u x_h$, the naturality square has $g$ on the source copy of $Omega_h$ and $u^(- N)
    g$ on the middle copy. Consequently the connecting map sends $u^(- N) g
    xi_N$ to the $g$-translate of the class of $alpha$, as required.
  These maps are the maps on the finite support Čech model of 42.
    In particular a translation $y_h mapsto y_h + c \( x_h \)$ gives finite generalized-fraction expansions modulo
    $x_h^N$, since $c \( x_h \)$ is nilpotent there. The two-ended x-convention $\( f_(+) \, - f_(-) \)$ ensures
    that multiplication crossing x-order zero is ordinary Laurent multiplication.
    For a convergent bounded-root expression, truncation above all fixed x-pole bounds,
    including the group basis matrix bounds, changes neither residue before or after the given action.
    Thus the same naturality applies to every expression being paired.
  The generalized-fraction transformation law and the independence of regular parameters for formal residue on
    $H_(frak(m)_h)^r \( Omega_h \)$ hold also in characteristic $p$ #cite(label("lipmanResidues1984"))
    Lemmas (7.2)(b) and (7.3), pp. 60–67. Here $A_h$ is a complete regular local algebra over the perfect field
    $k$ with residue field $k$, so all hypotheses of that result hold.
    The finite étale trace is natural, the action preserves $\( x \)$ and the whole lattice,
    and the transported volume is invariant on the $e$-component. These facts give
  $ lambda_h \( g w \) \( p_h \) = lambda_h \( w \) \( g^(- 1) p_h \) wide \( g in G \) . $
  This proves equivariance on bounded-root expressions and is compatible with (5.9).
    Finite-root expressions are dense after a complete-step enlargement.
    Both the group action and $pi$ are continuous into enlarged steps and the discrete quotient by 43 and the
    preceding paragraph. Passing to the limit proves equivariance on all of $W$.
    In particular $W_(+)$ is $G$-stable. Its positive complete steps also satisfy the uniform action condition
    of 2. Indeed, for a step with x-gap $epsilon.alt$, pass to a later normalized basis $h'$.
    The scalar substitutions preserve x-order by (4.18); the remaining group basis matrices have one uniform pole
    bound $c_G \/ h'$, because they are root transports of the matrices on the original whole model.
    Choose $h'$ with $c_G \/ h' < epsilon.alt \/ 2$. The entire compact group family then has x-gap at least
    $epsilon.alt \/ 2$, and 43 puts it continuously into one common complete positive step.
    The same argument applies to compact parameter families. Compact-envelope integration from 4 therefore defines
    the completed group-ring action on $W_(+)$. The map $pi$ commutes with that action:
    approximate a distribution by finite group-ring sums in a compact envelope and use continuity of $pi$ into $Q$.
  This proof uses finite principal-part residue invariance;
    it does not presume a separate duality theorem for completed functions at infinite root level. ◻
]

===== 5.1.3 Contraction and an open boundary subgroup <contraction-and-an-open-boundary-subgroup>

The residue sequence already makes the homology of its kernel countable.
  Indeed, take a resolution by finite free completed group-ring modules in every degree, as in 4.
  Its coefficient chain complex has terms $V^(a_i)$, with each $a_i$ finite, for a coefficient module $V$.
  Thus (5.10) gives a termwise exact sequence of chain complexes.
  The complex for the countable module $Q$ is degreewise countable, whereas $H_i \( G \, W \)$ is finite by 44.
  The long exact sequence gives

#[#set math.equation(numbering: n => "(5.13)")
 $ H_i \( G \, W_(+) \) upright(" is countable for every ") i . $ <eq:cutoff-positive-countable>]

We must strengthen this to vanishing. On a complete positive coefficient step, the cycles form a Polish group,
  and the subgroup consisting of actual boundaries has countable index by (5.13).
  We will show that this subgroup is analytic, so a Baire-category argument makes it open.
  Frobenius contraction then puts an iterate of every cycle in that open subgroup;
  inverse Frobenius supplies a primitive for the original cycle.
  We first establish the contraction and the required openness criterion.

#thm([Lemma 5.3.])[
  (Contraction in one complete positive step).  #emph[For every integer $nu gt.eq
    0$ and every tuple $w in W_(+)^nu$, there are an integer $a_(*) gt.eq 0$,
    a complete weighted step written in the original whole basis, and $epsilon.alt \,
    alpha > 0$ such that all $Phi^(a_(*) + a) w$ belong to the closed subspace with x-order at least $epsilon.alt$, and
#[#set math.equation(numbering: n => "(5.14)")
 $ parallel Phi^(a_(*) + a) w parallel lt.eq exp \( - alpha h_0^a \) quad \( a gt.eq 0 \) . $ <eq:cutoff-contraction>]

 The statement applies without a bound on the root denominators of the coefficient series.]
] <lem:cutoff-contraction>

#proof[
  The empty tuple is immediate. Otherwise, since the tuple is finite,
    choose one normalized basis at level $h_0^(a_(*))$ on which all components have a common positive x-gap.
    Applying $Phi^(a_(*))$ clears this #emph[basis] denominator.
    It need not clear the root denominators in the series. In the original basis the resulting tuple $v$ still has
    a positive x-gap, since all multiplication laws in $A'$ are integral.
  Choose a common weighted step $\( L_1 \, delta \)$ for the finitely many series of $v$, with $I gt.eq
    epsilon.alt > 0$. Their original weights are bounded below.
    Increasing $L_1$ to $L$ adds $\( L - L_1 \) I$ to every weight.
    Choose $L$ large enough that all nonzero terms now have weight at least $alpha > 0$.
    They still form null series in this new step. Under $h_0^a$-powering the coefficient exponents are multiplied
    by $h_0^a$, so these weights are at least $alpha h_0^a$. Each $b_i^(h_0^a)$ expands on the original basis with
    coefficients in $A$. These coefficients add nonnegative x- and y-powers;
    projection to the strictly negative-y part can only discard terms or improve the weight.
    Their coefficients have norm at most one. This proves (5.14).
    The x-gap is multiplied by $h_0^a$, hence remains at least $epsilon.alt$ in the same complete step. ◻
]

#thm([Lemma 5.4.])[
  (A countable-index analytic subgroup).  #emph[Let $Z$ be a Polish topological group and $B subset.eq
    Z$ an analytic subgroup in the sense of descriptive set theory: $B$ is a continuous image of a Polish space.
    If $Z \/ B$ is countable, then $B$ is open.]
] <lem:cutoff-polish>

#proof[
  An analytic subset of a Polish space has the Baire property #cite(label("kechris1995")) Theorem 21.6.
    If $B$ were meagre, its countably many cosets would make $Z$ meagre in itself, contrary to the Baire theorem.
    Thus $B$ is nonmeagre. Pettis’s theorem #cite(label("kechris1995")) Theorem 9.9 says that the product of a
    nonmeagre set with the Baire property and its inverse contains a neighborhood of the identity.
    For a subgroup this product is $B$ itself, proving the assertion. ◻
]

#thm([Lemma 5.5.])[
  #emph[For the completed-resolution group homology of 2,
$ H_i \( G \, W_(+) \) = 0 wide \( i gt.eq 0 \) . $

]
] <lem:cutoff-positive-acyclic>

#proof[
  Use the finite free resolution and the countability statement (5.13) above.
    We first construct the complete cycle spaces to which 48 applies.
    Take a normalized basis level, rational weights $L > delta > 0$,
    and a rational positive cutoff $epsilon.alt > 0$. In the whole weighted null-series space require x-order at
    least $epsilon.alt$ and the equation $e w = w$. The first condition is a closed coordinate condition;
    the second is closed because $e$ and the identity are continuous into a common enlarged complete step.
    This gives a complete separable metrizable $k$-vector space $E subset W_(+)$.
    Separability follows from the countable exponent index and finite coefficient field.
    These spaces form a countable collection covering $W_(+)$:
    the basis levels are countable, and rational weights and positive cutoffs can be chosen cofinally.
    Each inclusion between two specified coefficient steps is continuous into some common enlarged step.
  Fix $i$ and one such $E$. The cycles
  $ Z_E = { z in E^(a_i) : d z = 0 } $
  form a closed subspace of a Polish group. In fact the differential is continuous from this finite product into a
    common complete step by Lemma 4.6, Lemma 1.4. Let
  $ B_E = Z_E ∩ d \( W_(+)^(a_(i + 1)) \) . $
  Its index in $Z_E$ is countable by (5.13). It is analytic for the following explicit reason.
    For each complete positive primitive step $E'$, the set
  $ { \( z \, u \) in Z_E times \( E' \)^(a_(i + 1)) : d u = z } $
  is closed: compare the two sides in a common enlarged complete step.
    Projecting this closed subset of a Polish product onto $Z_E$ gives an analytic set.
    There are countably many choices of $E'$, and their projected union is exactly $B_E$.
    Thus $B_E$ is an analytic subgroup, and 48 makes it open.
    This argument does not require the global boundary image in $W_(+)$ to be closed or the inductive topology to
    be strict.
  Now let $z$ be any cycle in $W_(+)^(a_i)$. Absolute Frobenius is $k$-linear and $G$-equivariant.
    It commutes with the completed group-ring differential: this holds for finite group-ring sums and then for
    their convergent actions on the complete steps. Apply 47 and choose the rational weights and cutoff within its
    bounds. The forward iterates after the initial basis clearing lie in one $Z_E$ and tend to zero there.
    Since $B_E$ is open, some iterate $Phi^a z$ is $d u$ with $u in W_(+)^(a_(i + 1))$.
    Both $Phi$ and its inverse preserve $W_(+)$ and commute with $d$. Hence $z = d \( Phi^(- a) u \)$.
    Every cycle bounds, as required. ◻
]

#thm([Theorem 5.6.])[
  (Finite stable transfer image).  #emph[For every $i gt.eq 0$ the compact vector space $M_i =
    H^i \( G \, cal(P) \)$ satisfies
#[#set math.equation(numbering: n => "(5.15)")
 $ I_i := ⋂_(a gt.eq 0) S^a M_i quad upright("is finite") . $ <eq:cutoff-stable>]

 No uniform bound on its size as the prime, height, degree, or finite marking level varies is asserted.]
] <thm:cutoff-stable>

#proof[
  The preceding acyclicity and (5.10) identify $H_i \( G \, Q \)$ with $H_i \( G \, W \)$, hence make it finite.
    Compact/discrete duality and the finite free resolution give
  $ H_i \( G \, Q \) = "colim"_(S^or) H_i \( G \, cal(P)^or \) = "colim"_(S^or) M_i^or . $
  Filtered colimits commute with kernels and cokernels of vector-space maps,
    so no derived interchange is involved here. Dualizing gives
  $ H_i \( G \, Q \)^or = "proj lim"_S M_i . $
  This inverse limit is finite. Its projection to the first term has image $I_i$.
    To check surjectivity onto that image description, note that every $S^a M_i$ is compact.
    For $x in I_i$, the nonempty compact sets
  $ { y in S^a M_i : S y = x } $
  are nested. Their intersection gives a preimage in $I_i$.
    Thus $S : I_i arrow.r I_i$ is surjective, and successive choices of preimages in $I_i$ lift $x$ to the inverse
    limit. It follows that $I_i$ is finite. We have used a surjection from the inverse limit onto the stable
    image; we have not assumed them equal before proving finiteness. ◻
]

===== 5.1.4 Compact power-series modules and localization <compact-power-series-modules-and-localization>

The stable image is now finite in compact lattice cohomology.
  To pass to the intersection of its images in localized cohomology, we will need two additional inputs:
  next-height finiteness, which controls boundary strips, and countability of a consecutive transfer-image
  quotient. The next lemma isolates the compact algebra used in this passage.

#thm([Lemma 5.7.])[
  #emph[Let $M$ be a profinite $k$-vector space and let $S : M arrow.r M$ be a continuous linear map.
    Assume that $I = ⋂_(a gt.eq 0) S^a M$ and $M \/ S M$ are finite.
    Then $S$ is an automorphism of $I$, and $V = M \/ I$ is a finitely generated $k \[ \[ z \] \]$-module with $z$
    acting by $S$. Its original topology is the z-adic topology. The locally nilpotent subgroup
$ T_S \( M \) = union.big_(a gt.eq 0) ker \( S^a : M arrow.r M \) $

 is finite and closed. In particular $ker S$ is finite.]
] <lem:cutoff-compact-operator>

#proof[
  The compact preimage argument in the preceding proof gives $S \( I \) = I$,
    and finiteness makes this restriction invertible. In $V =
    M \/ I$ the nested compact subspaces $S^a V$ have zero intersection. They shrink #emph[uniformly] to zero:
    for every neighborhood $O$ of zero there is an $a_0$ such that $S^a V subset O$ for every $a gt.eq a_0$.
    Otherwise the compact sets $S^a V ∩ \( V \\ O \)$ would have nonempty intersection.
  For $f = sum_(j gt.eq 0) c_j z^j$ define
  $ f v = lim_(t arrow.r oo) sum_(j = 0)^(t - 1) c_j S^j v . $
  Every sufficiently late finite tail belongs to an arbitrarily specified open linear subspace,
    uniformly for $v in V$. Completeness therefore supplies the limit.
    Polynomial module identities pass to these uniform limits and give a continuous $k \[ \[ z \] \]$-action.
  Choose lifts $v_1 \, dots.h \, v_s$ of a basis of the finite space $V \/ S V = M \/ S M$.
    Given $v = v^(\( 0 \))$, recursively choose coefficients $c_(i j) in k$ and $v^(\( j + 1 \)) in V$ such that
  $ v^(\( j \)) = sum_(i = 1)^s c_(i j) v_i + S v^(\( j + 1 \)) . $
  After $t$ steps the error is $S^t v^(\( t \))$, which tends uniformly to zero.
    Thus $v = sum_i \( sum_j c_(i j) z^j \) v_i$; the continuous map $k \[ \[ z \] \]^s arrow.r V$ is surjective.
    Each successive quotient $S^j V \/ S^(j + 1) V$ is an image of $V \/ S V$.
    Hence every $V \/ S^a V$ is finite, and its compact kernel $S^a V$ is open.
    Uniform shrinking makes these kernels a neighborhood basis, proving the topology assertion.
  The Noetherian module $V$ has a stabilizing ascending sequence $ker z subset.eq ker z^2 subset.eq dots.h.c$.
    Its union is a finitely generated submodule killed by some $z^t$,
    hence finite over the finite ring $k \[ \[ z \] \] \/ \( z^t \)$.
    The map from $T_S \( M \)$ to this union is injective, since a locally nilpotent element of $I$ is zero.
    Therefore $T_S \( M \)$ is finite and closed. In fact this map is surjective:
    if $S^a x in I$, subtract the unique element of $I$ with the same $S^a$-image to obtain a nilpotent lift.
    The contraction and the power-series action in this argument concern $M \/ I$;
    they are not asserted on the finite summand on which $S$ is invertible. ◻
]

Return to $M_i = H^i \( G \, cal(P) \)$ and set

$ Y_i = H^i \( G \, B' \) \, wide X_i = H^i \( G \, B_U \) . $

Let $j_i : M_i arrow.r Y_i$ be localization and let $f_i : M_i arrow.r
  X_i$ be localization followed by projection by $e$. For the remainder of this section assume the next-height
  finiteness hypothesis of 17. That lemma says that $j_i$ has countable kernel and cokernel for every fixed
  lattice shift. It need not say this about $f_i$ before taking a positive transfer image:
  the complementary component of $B'$ must first be removed.

For every $a gt.eq 1$ there is a map

#[#set math.equation(numbering: n => "(5.16)")
 $ f_(i \, a) : S^a M_i arrow.r S^a X_i quad upright("with countable kernel and cokernel") .
   $ <eq:cutoff-image-comparison>]

Here is the verification. The map $S^a M_i arrow.r S^a Y_i$ has kernel contained in $ker j_i$.
  Its cokernel is an image of $Y_i \/ j_i \( M_i \)$ under $S^a$, and is therefore countable.
  For $a gt.eq 1$, $S^a Y_i$ lies in the $e$-summand, where projection identifies it with $S^a X_i$.
  This proves (5.16) without imposing a countable-kernel assertion on the uniterated projection.

#thm([Proposition 5.8.])[
  (The compact localized intersection).  #emph[Fix $i gt.eq 0$ and $N gt.eq 1$. Suppose
#[#set math.equation(numbering: n => "(5.17)")
 $ S^N X_i \/ S^(N + 1) X_i quad upright("is countable") . $ <eq:cutoff-consecutive-hypothesis>]

 Then $S^N M_i \/ S^(N + 1) M_i$ is finite, and $\( S^N M_i \) \/
   I_i$ is a finitely generated $k \[ \[ z \] \]$-module with $z = S$.
   The operator $S$ on $S^N X_i$ has countable kernel and cokernel.
   Moreover $ker \( f_i \|_(S^N M_i) \)$ is finite and closed, $f_i$ is injective on $I_i$, and
#[#set math.equation(numbering: n => "(5.18)")
 $ ⋂_(a gt.eq 0) "im" \( S^a M_i arrow.r X_i \) = f_i \( I_i \) tilde.equiv I_i . $ <eq:cutoff-localized-intersection>]

 In particular the intersection is finite. No topology on $X_i$ and no closed-image assertion for its cochain
   differential is required.]
] <prop:cutoff-compact>

#proof[
  Put $A_N = S^N M_i$, $Z_N = S^N X_i$, and $f = f_i \|_(A_N)$. The induced map
  $ A_N \/ S A_N arrow.r Z_N \/ S Z_N $
  has countable kernel. Indeed, the subgroup represented by ${ a in A_N :
    f \( a \) in S Z_N }$ maps to $S Z_N \/ f \( S A_N \)$, which is countable by (5.16) at $N + 1$;
    the kernel of this map is an image of $ker f$, countable by the comparison at $N$.
    Its image in $Z_N \/ S Z_N$ is countable by (5.17). Thus $A_N \/ S A_N$ is countable.
    It is a compact Hausdorff group, because $S A_N$ is a compact image and hence closed.
    A countable compact Hausdorff group is finite: its countable cover by closed singletons, together with Baire,
    forces a singleton to be open; the group is then discrete and compact. This proves finiteness of $A_N \/ S A_N$.
  The stable intersection for $S$ acting on $A_N$ is $I_i$. Apply Theorem 5.6, Lemma 5.7.
    This gives the asserted finite generation and makes both $ker \( S \|_(A_N) \)$ and $T_S \( A_N \)$ finite.
  We first obtain countability of the kernel on $Z_N$ without using closedness of $ker f$.
    Write $Z_0 = f \( A_N \)$ and $C_N = Z_N \/ Z_0$, which is countable.
    An element of $ker \( S \|_(Z_0) \)$ lifts to an $a in A_N$ with $S a in ker f$.
    The latter kernel is countable and each nonempty fiber of $S : A_N arrow.r A_N$ is finite.
    Consequently $S^(- 1) \( ker f \)$, and hence $ker \( S \|_(Z_0) \)$, is countable.
    Mapping $ker \( S \|_(Z_N) \)$ to $C_N$ proves its countability. The cokernel is countable already by (5.17).
  It remains to prove the stronger assertion about $ker f$, for which countability alone would not suffice.
    Let $alpha in ker f subset.eq S^N M_i$. Choose a $cal(P)$-valued cocycle $c$ such that $S^N
    c$ represents $alpha$. Since $N gt.eq 1$, this representative is already $e$-supported after localization.
    If $i > 0$, vanishing in $X_i$ supplies a bounded-pole primitive $b$ with
  $ d b = S^N c $
  in the cochain complex for $B_U$, viewed inside that for $B'$.
    The convention of Lemma 1.3, Lemma 1.4 means that this one primitive belongs to some whole lattice $x^(- D)
    A'$ uniformly on its compact cochain parameters. By (5.3), all sufficiently high $S^a b$ are $cal(P)$-valued.
    The chain-map identity gives $d \( S^a b \) = S^a \( S^N c \)$ there. Thus $S^a alpha = 0$ in $M_i$.
    When $i = 0$, vanishing of the already $e$-supported localized cocycle means that the cocycle itself is zero,
    since $cal(P) arrow.r.hook B'$ is injective. This proves local $S$-nilpotence of $ker f$ in every degree.
    The exponent may depend on its chosen bounded-pole primitive; no uniform exponent was assumed.
  We now have $ker f subset.eq T_S \( A_N \)$, so $ker f$ is finite and closed.
    Its intersection with $I_i$ is zero, because $S$ acts invertibly on $I_i$.
    For an element $xi$ belonging to all the images in (5.18), discard the first $N$ terms and consider
  $ E_a = { v in S^a A_N : f \( v \) = xi } \, wide a gt.eq 0 . $
  These sets are nonempty and nested. Each is a coset of $ker f ∩ S^a A_N$,
    hence finite and closed in the compact space $A_N$. Their intersection is nonempty.
    Any point in it belongs to $I_i$ and maps to $xi$. This proves the nontrivial inclusion in (5.18);
    the reverse inclusion is immediate. It also explains why no Hausdorff topology on localized cohomology was used. ◻
]

The sequence of implications is now available at every fixed allowed marking level.
  The finite stable image comes from the analytic #emph[transpose] quotient,
  whereas the final compact argument concerns the original bounded-pole cochains.
  In particular none of the arguments in this section identifies incomplete ordinary cohomology on the open with
  the ordinary cohomology of its analytic completion.

==== 5.2 Pro-objects, finite extensions, and transfer countability <sec:pro-transfer>

We now pass from the finite stable transfer image to the cohomology of an individual finite marking level.
  All coefficient fields in this section are finite. In particular,
  a countable-dimensional coefficient space is a countable set,
  and a finite-dimensional coefficient space is a finite set. Both facts will be used.

Fix $1 lt.eq m < n$ and retain the notation

$ A = A_m \, wide B = A \[ 1 \/ x \] \, wide B_U = e A' \[ 1 \/ x \] \, wide cal(P) = x^(- D_0) A' $

of Section 2.1, Section 4.1, Section 5.1. Choose a cofinal decreasing sequence $\( U_nu \)_(nu gt.eq 0)$ of normal
  product congruence subgroups of the marking group $J$. Discard finitely many terms so that these groups are
  uniform, all the finite-isotropy conclusions hold, and the transfer $S$ is defined.
  The lattice $cal(P)$ and its whole finite free model may depend on $nu$. Write

$ X_nu^i = H_(upright("cts"))^i \( G \, B_(U_nu) \) \, wide M_nu^i = H_(upright("cts"))^i \( G \, cal(P)_nu \) . $

The $M_nu^i$ are compact. Throughout the section, the hypothesis on the next height is precisely the
  coefficient-finiteness hypothesis in 17. Thus every fixed whole-lattice shift has countable localization kernel
  and cokernel. No finiteness assertion at the current height is assumed.

#thm([Theorem 5.9.])[
  (Countability at fixed marking levels).  #emph[Assume the next-height coefficient-finiteness hypothesis of 17.
    There is an index $nu_0$ such that
$ H_(upright("cts"))^i \( G \, B_(U_nu) \) quad upright("is countable-dimensional over ") k $

 for every $nu gt.eq nu_0$ and every integer $i$.]
] <thm:pro-countability>

We will use the following consequences of the preceding sections. For every fixed $nu$ and $N gt.eq 1$, the map

$ S^N M_nu^i arrow.r S^N X_nu^i $

has countable kernel and cokernel. To see this, first use 17 for the whole model $A' \[ 1 \/ x \]$.
  The extension of $S$ to that whole model begins with projection by $e$,
  so its positive powers discard the complementary component.
  Taking the images of the two commuting $S^N$ maps preserves the assertion about countable kernel and cokernel.
  Furthermore, 52 says that if

#[#set math.equation(numbering: n => "(5.19)")
 $ S^N X_nu^i \/ S^(N + 1) X_nu^i quad upright("is countable-dimensional") \, $ <eq:pro-consecutive>]

then $S$ on $S^N X_nu^i$ has countable kernel and cokernel, and

#[#set math.equation(numbering: n => "(5.20)")
 $ F_nu^i := ⋂_(a gt.eq 0) "im" #scale(x: 120%, y: 120%)[\(] S^a M_nu^i arrow.r
   X_nu^i #scale(x: 120%, y: 120%)[\)] quad upright("is finite") . $ <eq:pro-finite-intersection>]

These assertions concern actual cohomology groups, without taking closures of images.
  The closedness needed in (5.20) is part of 52.

For $m > 1$, the proof has two steps. First we establish (5.19) in each degree with an exponent independent of the
  sufficiently deep marking level. The compact comparison above then makes $F_nu^i$ finite.
  This does not yet control all of $X_nu^i$: a finite stable intersection alone places no bound on the part lost
  under iteration.

The second step rules out an uncountable remainder. The uniform finite-isotropy bound leaves only finitely many
  cohomological degrees. If countability fails, choose the largest degree $b$ in which uncountable groups persist
  at arbitrarily deep marking levels. Put $d = \( m - 1 \) \( n - m \)$,
  the dimension of the translation distribution algebra. We will construct a finite $d$-fold translation extension
  which, for one fixed root order $h_(*)$ and every sufficiently deep level $U_nu$, induces an operation

$ epsilon_nu : H_(upright("cts"))^(b - d) \( G \, B_(U_nu)^(1 \/ h_(*)) \) arrow.r X_nu^b $

with countable cokernel. If $b - d < 0$, its source is zero and countability already follows.

Otherwise the next-height boundary hypothesis gives a subspace of the source with countable quotient whose classes
  have positive-order cocycle representatives. A second fixed $d$-fold extension,
  now a self-extension of the trivial translation coefficient,
  supplies a boundary operator $cal(B)$ on ordinary marked cochains.
  The high-transfer comparison will identify its coinduced operations,
  after inclusion from the fixed root source and transfer back to $B_(U_nu)$,
  with nonzero scalar multiples of $epsilon_nu$. This equality will hold for every high transfer at each
  sufficiently deep fixed level.

For a positive representative $w$, powering drives its order to infinity,
  while the boundary operator $cal(B)$ loses only a fixed pole order at that level.
  Its high-power boundary representatives therefore lie in $cal(P)_nu$.
  The factorization then puts the fixed class $epsilon_nu \[ w \]$ in every sufficiently late compact transfer
  image, hence in $F_nu^b$. This intersection is finite. Since the positive-representative subspace has countable
  quotient, the whole image of $epsilon_nu$ is countable. Its countable cokernel now contradicts the choice of $b$.

The category introduced next records this obstruction by making countable spaces zero while retaining each
  sufficiently deep marking level. Exact pro-completion will first control the transfer images and then construct
  the top extension operation. A finite equivariant Ext comparison will put all its high-transfer factorizations
  on one common tail of actual marking levels. When $m = 1$, the splitting $S "Fr"^(log_p h_0) =
  1$ replaces the positive-dimensional translation algebra; that case is treated at the end of the section.

===== 5.2.1 The category recording a sufficiently deep tail <the-category-recording-a-sufficiently-deep-tail>

Let $cal(V)$ be the category of $k$-vector spaces and let $cal(V)_(lt.eq ℵ_0)$ be its full subcategory of
  countable-dimensional spaces. This is a Serre subcategory:
  subspaces, quotients, and extensions of countable-dimensional spaces are countable-dimensional. Put

$ cal(A)_0 = cal(V) \/ cal(V)_(lt.eq ℵ_0) . $

The quotient functor is exact. A vector space becomes zero in $cal(A)_0$ exactly when it is countable-dimensional,
  and a linear map becomes an isomorphism exactly when its kernel and cokernel are countable-dimensional.

Define $cal(A)$ to be the category of tail families in $cal(A)_0$.
  Its objects are sequences $\( Y_nu \)_(nu gt.eq 0)$ and

$ "Hom"_(cal(A)) \( Y \, Z \) = "colim"_(nu_0) product_(nu gt.eq nu_0) "Hom"_(cal(A)_0) \( Y_nu \, Z_nu \) . $

Composition is componentwise after restricting to a common tail.
  Kernels and cokernels are computed componentwise on a tail;
  a finite diagram can always be placed on a common tail. These descriptions prove that $cal(A)$ is abelian.
  They also show that an object of $cal(A)$ is zero exactly when all its components vanish in $cal(A)_0$ after
  some index. In particular, an equality in $cal(A)$ that involves a fixed finite diagram means an equality modulo
  countable-dimensional spaces at all sufficiently deep actual levels.
  We do not replace these families by a direct limit of their underlying vector spaces.

Suppose first that $m > 1$, and set

$ Lambda = k \[ \[ D_1 \, dots.h \, D_d \] \] \, wide d = \( m - 1 \) \( n - m \) > 0 \, wide
  frak(m) = \( D_1 \, dots.h \, D_d \) . $

Let $cal(C)$ denote the abelian category of finite-length $Lambda$-modules.
  For $E in cal(C)$, the translation torsor defines the associated coefficient bundle $V_(E \, U_nu)$ for all
  sufficiently large $nu$. Here a plain finite module can be given trivial auxiliary action after shrinking
  $U_nu$: its action factors through a finite quotient of $Lambda$,
  and a sufficiently deep marking group acts trivially on that quotient.
  The same choice works for every arrow in a fixed finite diagram. Consequently

$ cal(C)^j \( E \) = #scale(x: 120%, y: 120%)[\(] C_(upright("cts"))^j \( G \, V_(E \, U_nu) \)
  #scale(x: 120%, y: 120%)[\)]_nu quad upright("and") quad T^i \( E \) =
  H^i #scale(x: 120%, y: 120%)[\(] cal(C)^bullet \( E \) #scale(x: 120%, y: 120%)[\)] $

are well-defined in $cal(A)$, independently of omitted initial terms.
  By Lemma 1.3, Proposition 4.1, each $cal(C)^j$ is an exact additive functor.
  Thus $T^bullet$ has the long exact sequences associated to short exact sequences in $cal(C)$.
  There is a uniform integer $c$ for which

#[#set math.equation(numbering: n => "(5.21)")
 $ T^i \( E \) = 0 wide \( i > c \, E in cal(C) \) \, $ <eq:pro-degree-bound>]

by Proposition 2.7, Proposition 1.7. As usual, all these functors vanish in negative cohomological degrees.

Choose $q_0$ as in 38, with all powers used below fixing $k$, and write $q_a = q_0^a$.
  The ideals $\( D_1^(q_a) \, dots.h \, D_d^(q_a) \)$ are cofinal with the powers of $frak(m)$. Put

$ Lambda_q = Lambda \/ \( D_1^q \, dots.h \, D_d^q \) . $

To identify the transition maps, use the perfect pairing of 1 on the plain $Lambda$-modules:

$ alpha_q : Lambda_q arrow.r^tilde.op sans(N)_q \, wide
  alpha_q \( a \) \( b \) = \[ D_1^(q - 1) dots.h.c D_d^(q - 1) \] \( a b \) . $

Here the brackets extract the indicated monomial coefficient.
  For allowed powers $q = s t$, the regular quotient $Lambda_q arrow.r
  Lambda_s$ becomes under these pairings the coinduction of the translation augmentation $sans(N)_t arrow.r
  k$ from the $s$-power subalgebra. Indeed, the successive coefficient extractions select exponent $\( s - 1 \) +
  s \( t - 1 \) = q - 1$ in each variable. By Proposition 4.1, Proposition 4.3,
  its coefficient-bundle map is the corresponding root of a Cartier transfer.
  Thus the inverse system of regular quotients records the classes that persist under repeated transfer.

These pairings forget the auxiliary action; the natural actions on the coinduced diagrams remain those of 38.
  The whole-diagram root identification, followed by powering on coefficients, gives an isomorphism of inverse systems

#[#set math.equation(numbering: n => "(5.22)")
 $ { T^i \( Lambda_(q_a) \) }_(a gt.eq 0) tilde.eq { T^i \( k \) arrow.l^S T^i \( k \) arrow.l^S T^i \( k \)
   arrow.l^S dots.h.c } . $ <eq:pro-stationary>]

The maps on the left are induced by the quotient maps of $Lambda$.
  Choose the scalar identifications recursively along this sequence so that its transition maps are exactly $S$.
  This is possible because Proposition 4.2, Proposition 4.3 make each discrepancy a nonzero constant.
  Each fixed finite part of this comparison is realized on a sufficiently deep marking tail.
  Thus (5.22) is an identity in $"Pro" \( cal(A) \)$; it does not assert that the natural actions on every
  $sans(N)_q$ are simultaneously trivial at one finite marking level.

===== 5.2.2 Exact completion and stabilization of the actual images <exact-completion-and-stabilization-of-the-actual-images>

We record the categorical facts with the precision needed for a uniform stabilization index.

#thm([Lemma 5.10.])[
  #emph[For an abelian category $cal(B)$, the constant objects in $"Pro" \( cal(B) \)$ are closed under kernels
    and cokernels of maps between them, and under extensions.
    If a decreasing system of subobjects $J_a subset X$ represents a constant subobject $I subset
    X$ in $"Pro" \( cal(B) \)$, then $J_a = I$ for all sufficiently large $a$.]
] <lem:pro-constants>

#proof[
  The embedding by constant objects is fully faithful and exact, which gives the kernel and cokernel statements.
    For extensions it is enough to give the dual argument in $"Ind" \( cal(B) \)$. Suppose
  $ 0 arrow.r A arrow.r E arrow.r B arrow.r 0 $
  is exact with $A$ and $B$ constant. Write $E$ as a filtered system of objects $E_j$ of $cal(B)$.
    The images of the maps $E_j arrow.r B$ are objects of $cal(B)$, and their filtered colimit is $B$.
    The defining Hom formula for ind-objects says that a map from a constant object to a filtered colimit factors
    through one term. Applied to $"id"_B$, it shows that $E_j arrow.r B$ is an epimorphism for some $j$.
    Let $K_j = ker \( E_j arrow.r B \)$. The induced map $K_j arrow.r A$ is a map in $cal(B)$.
    The pushout of $K_j arrow.r.hook E_j$ along $K_j arrow.r A$ is $E$:
    the natural map from that pushout has identity maps on the kernel $A$ and quotient $B$,
    hence is an isomorphism. This pushout is a cokernel between objects of $cal(B)$, so is constant.
    Dualizing proves extension closure in the pro-category.
  For the second assertion, the morphism from the constant object $I$ to ${
    J_a }$ is a compatible family of maps $I arrow.r J_a$. Since its composite with $J_a arrow.r.hook
    X$ is the fixed inclusion, these are inclusions identifying $I$ as a subobject of every $J_a$.
    The system ${ J_a \/ I }$ is pro-zero. Thus for any chosen $a$ some later transition $J_b \/ I arrow.r
    J_a \/ I$ is zero. This transition is monic, so $J_b \/ I = 0$.
    All still later subobjects contain $I$ and are contained in $J_b = I$, proving the assertion. ◻
]

For a finitely generated $Lambda$-module $L$, let

$ hat(L)_(upright("pro")) = { L \/ frak(m)^a L }_(a gt.eq 1) in "Pro" \( cal(C) \) . $

This completion functor is exact. Indeed, for $0 arrow.r L' arrow.r L arrow.r L'' arrow.r 0$,
  the levelwise exact sequences use $L' \/ \( L' ∩ frak(m)^a L \)$ as their first terms.
  Artin–Rees makes the filtrations $L' ∩ frak(m)^a L$ and $frak(m)^a L'$ cofinal,
  identifying these first terms with $hat(L)'_(upright("pro"))$.
  This is the same Artin–Rees and cofinal-filtration argument that proves exactness of ordinary completion in
  #cite(label("stacks")) Tag 00MA; here it identifies the completed sequences as pro-objects.

An exact functor between abelian categories extends exactly to their pro-categories:
  after a common reindexing, a finite diagram has levelwise kernels and cokernels,
  and the functor preserves these. Apply this to each $cal(C)^j$. Define

$ overline(cal(C))^(thin bullet) \( L \) = cal(C)^bullet \( hat(L)_(upright("pro")) \) \, wide
  overline(T)^(thin i) \( L \) = H^i #scale(x: 120%, y: 120%)[\(] overline(cal(C))^(thin bullet) \( L \)
  #scale(x: 120%, y: 120%)[\)] . $

Thus $overline(T)^(thin i) \( L \) = { T^i \( L \/ frak(m)^a L \) }_a$ in $"Pro" \( cal(A) \)$,
  and short exact sequences of finitely generated modules give long exact sequences.
  If $L$ has finite length, its completion is constant, so $overline(T)^(thin i) \( L \)$ is the constant object
  $T^i \( L \)$.

#thm([Proposition 5.11.])[
  (Uniform image stabilization).  #emph[For every $i$, the pro-object $overline(T)^(thin i) \( Lambda \)$ is
    constant, and its canonical projection to $T^i \( k \)$ is monic. It is annihilated by $frak(m)$.
    Moreover, there is an integer $N_i gt.eq 1$, independent of the sufficiently deep marking level, such that
$ S^(N_i) X_nu^i \/ S^(N_i + 1) X_nu^i quad upright("is countable-dimensional for all sufficiently large ") nu . $

]
] <prop:pro-stabilization>

#proof[
  We descend on $i$, starting above the bound in (5.21). Assume the assertion of constancy has been proved for
    $overline(T)^(thin j) \( Lambda \)$ with $j > i$. The ideal $frak(m)$ has a finite resolution by finite free
    $Lambda$-modules, given by the positive part of the Koszul resolution of $k$.
    Induction on resolution length shows that $overline(T)^(thin j) \( L \)$ is constant for every $j >
    i$ and every $L$ with a finite free resolution. The case of a free $L$ is the descending induction hypothesis
    and finite additivity. For $0 arrow.r L' arrow.r F arrow.r L arrow.r
    0$ with $F$ finite free and $L'$ of shorter resolution length, the long exact sequence gives
  $ 0 arrow.r "coker" #scale(x: 120%, y: 120%)[\(] overline(T)^(thin j) \( L' \) arrow.r
    overline(T)^(thin j) \( F \) #scale(x: 120%, y: 120%)[\)] arrow.r overline(T)^(thin j) \( L \)\
arrow.r ker #scale(x: 120%, y: 120%)[\(] overline(T)^(thin j + 1) \( L' \) arrow.r
  overline(T)^(thin j + 1) \( F \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  For $j > i$ the outer terms are constant by the induction on length and 54;
    extension closure gives the middle term. Taking $L = frak(m)$ and $j = i +
    1$ proves the required constancy of $overline(T)^(thin i + 1) \( frak(m) \)$.
  The exact sequence $0 arrow.r frak(m) arrow.r Lambda arrow.r k arrow.r 0$ now identifies the image of
  $ overline(T)^(thin i) \( Lambda \) arrow.r T^i \( k \) $
  with the kernel of a map between the two constant objects $T^i \( k \)$ and
    $overline(T)^(thin i + 1) \( frak(m) \)$. Call this constant subobject $I^i$. Under (5.22), the image system is
  $ J_a = "im" #scale(x: 120%, y: 120%)[\(] S^a : T^i \( k \) arrow.r T^i \( k \) #scale(x: 120%, y: 120%)[\)] \,
    wide J_(a + 1) subset J_a . $
  The second part of 54 supplies one finite $N_i$ with $J_a = I^i$ for all $a gt.eq N_i$.
    Increase $N_i$ to at least one. Equality of these subobjects in $cal(A)$ says exactly that (5.19) holds for
    this $N_i$ at every sufficiently deep actual level. Its depth is uniform because only this one
    consecutive-image comparison is involved.
  By 52, the endomorphism induced by $S$ on $J_(N_i) = I^i$ has countable kernel and cokernel at these levels.
    It is therefore an automorphism in $cal(A)$. Replacing the stationary inverse system by its $N_i$th images
    gives an isomorphic pro-object. This replacement has underlying object $I^i$ and invertible transition
    $S \|_(I^i)$, so is constant. Explicitly, its map from the constant object $I^i$ to level $a$ is
    $\( S \|_(I^i) \)^(- a)$ followed by inclusion. At the initial level the projection is the inclusion $I^i
    arrow.r.hook T^i \( k \)$. This proves the claimed monomorphism and completes the descending induction.
  Finally, multiplication by any element of $frak(m)$ followed by $Lambda arrow.r k$ is zero.
    The resulting endomorphism of $overline(T)^(thin i) \( Lambda \)$ has zero composite with the monic projection
    just proved. It is zero. Thus $frak(m)$ annihilates the pro-object. ◻
]

===== 5.2.3 Finite Yoneda extensions and the top Koszul operation <finite-yoneda-extensions-and-the-top-koszul-operation>

We spell out why operations computed with completed free modules can be realized by finite coefficient diagrams.

#thm([Lemma 5.12.])[
  (Finite-length extension comparison).  #emph[For finite-length $Lambda$-modules $E \, F$, the natural map
$ "Ext"_(cal(C))^j \( E \, F \) arrow.r "Ext"_Lambda^j \( E \, F \) $

 is an isomorphism for every $j$. Here the left side is Yoneda Ext:
   its classes are represented by exact diagrams whose middle terms all have finite length.]
] <lem:pro-finite-ext>

#proof[
  Let $cal(D)$ be the category of $frak(m)$-power-torsion $Lambda$-modules.
    Every finitely generated submodule of an object of $cal(D)$ has finite length:
    finitely many generators are killed by one power of $frak(m)$,
    and the corresponding quotient ring is Artinian. Thus $cal(D) = "Ind" \( cal(C) \)$.
  Finite endpoints have the same Yoneda extensions in these two categories.
    One can see the finite realization directly. Starting at the right endpoint of an extension in $cal(D)$,
    choose finitely many lifts of its generators, then take the finite-length submodule that they generate.
    Its kernel is finite-length. Lift generators of that kernel into the preceding middle term and continue.
    At the last step include the whole left endpoint. This constructs a finite-length subextension representing
    the given class. The same construction can be made with a prescribed finite subcomplex:
    include its terms before choosing the next lifts. To check injectivity,
    take a finite Yoneda zigzag witnessing equality. Its directed underlying path has no directed cycles.
    Process its vertices in an order compatible with the arrows,
    choosing a finite subextension that contains the images of every already chosen predecessor;
    at a finite original vertex retain the whole extension. All arrows then restrict to a finite zigzag.
    Hence the map on Ext is both surjective and injective. Equivalently,
    this is extension fullness of an abelian category in its ind-completion #cite(label("coulembier2020")) Theorem
    2.2.1.
  For comparison with all $Lambda$-modules, use that the $frak(m)$-power-torsion submodule of an injective module
    is itself injective over the Noetherian ring $Lambda$ #cite(label("stacks")) Lemma 47.3.9(2), Tag 08XW.
    If $M in cal(D)$ embeds in an ordinary injective $I$, that embedding factors through $I \[ frak(m)^oo \]$.
    Its cokernel is still $frak(m)$-power torsion. Iterating this construction gives an ordinary injective
    resolution entirely in $cal(D)$. Each term is also injective in the full abelian subcategory $cal(D)$,
    so the resolution computes both Ext groups, proving $"Ext"_(cal(D))^j \( E \, F \) =
    "Ext"_Lambda^j \( E \, F \)$ and the lemma. ◻
]

An exact finite Yoneda diagram determines an operation on $T^bullet$ by the composite of its connecting maps.
  Functoriality of long exact sequences and invariance under comparisons make this operation depend only on its
  Ext class.

#thm([Proposition 5.13.])[
  (A surjective top operation).  #emph[Suppose $T^bullet \( k \)$ is not zero,
    and let $b$ be its largest nonzero degree. There is an allowed power index $s = q_0^(a_s)$ and a generator
$ e_s in "Ext"_Lambda^d \( sans(N)_s \, k \) $

 whose operation is an epimorphism in $cal(A)$:
$ e_s : T^(b - d) \( sans(N)_s \) arrow.r T^b \( k \) . $

]
] <prop:pro-top-operation>

#proof[
  A composition series shows that $T^j \( E \) = 0$ for every finite-length $E$ and $j > b$.
    In particular $overline(T)^(thin b + 1) \( frak(m) \) = 0$.
    The exact sequence for $0 arrow.r frak(m) arrow.r Lambda arrow.r k arrow.r 0$, together with 55,
    gives an isomorphism
  #[#set math.equation(numbering: n => "(5.23)")
   $ Y := overline(T)^(thin b) \( Lambda \) arrow.r^(med tilde.op med) T^b \( k \) . $ <eq:pro-top-identification>]
  For an allowed index $s$, identify $sans(N)_s$ with $Lambda_s$ as a plain $Lambda$-module.
    Let $K_s^bullet$ be the Koszul resolution on $D_1^s \, dots.h \, D_d^s$, in degrees $\[ - d \, 0 \]$.
    Apply exact completion and then the exact cochain-term functors $cal(C)^j$ to this bounded complex.
    The augmented horizontal rows remain exact, so the total complex computes the constant object
    $cal(C)^bullet \( Lambda_s \)$. Its vertical-cohomology spectral sequence has
  $ E_1^(a \, j) \( s \) = overline(T)^(thin j) \( Lambda \)^(binom(d, - a)) \, wide - d lt.eq a lt.eq 0 \, wide
    E_1^(a \, j) \( s \) arrow.r.double T^(a + j) \( Lambda_s \) . $
  The finite column interval and (5.21) give a finite filtration in every total degree.
    By 55, $frak(m)$ annihilates every entry on this first page, so all first differentials vanish.
  We compare these operations in the forward direction. Under the pairings $alpha_s$ above,
    the natural inclusion $sans(N)_s arrow.r sans(N)_(s')$, dual to the regular quotient, is
  $ Lambda_s arrow.r Lambda_(s') \, wide 1 mapsto product_(j = 1)^d D_j^(s' - s) wide \( s' > s \) . $
  Its Koszul comparison preserves the top exterior term while making every other column map vanish on vertical
    cohomology. To see this, lift the displayed injection to a map $K_s^bullet arrow.r K_(s')^bullet$.
    On the exterior-basis summand indexed by $I subset { 1 \, dots.h \, d }$, that map is multiplication by
  $ product_(j in.not I) D_j^(s' - s) . $
  The Koszul differential removes one index, and this formula commutes with it because the missing factor changes
    $D_j^s$ to $D_j^(s')$. On the first spectral-sequence page the comparison is the identity in column $-
    d$ and zero in every other column. The latter maps remain zero on every subsequent page.
  There is no incoming differential at $\( - d \, b \)$. Starting with $E_2^(- d \, b) = Y$,
    increase $s$ once for each possible page $r = 2 \, dots.h \, d$.
    Inductively suppose the whole object $Y$ survives to page $r$ at the current index.
    At a larger index the comparison remains the identity on this whole source.
    Naturality of $d_r$ and the zero comparison on its target column show that the outgoing $d_r$ at the larger
    index is zero on all of $Y$. The earlier differentials are still zero for the same reason.
    After these finitely many increases, $E_oo^(- d \, b) = Y$.
    The leftmost-column edge of the finite filtration is therefore an epimorphism
  $ T^(b - d) \( Lambda_s \) arrow.r.twohead Y . $
  When $d = 1$ there are no pages to eliminate, and the same conclusion holds directly.
  The edge followed by (5.23) is the operation of the chain map
  $ K_s^bullet arrow.r Lambda \[ d \] arrow.r k \[ d \] $
  which projects the top exterior term onto $Lambda$ and then augments.
    Applying $"Hom"_Lambda \( - \, k \)$ to $K_s^bullet$ gives zero differentials;
    the displayed map is therefore a generator of $"Ext"_Lambda^d \( Lambda_s \, k \) tilde.eq k$.
    By 56 it has a finite-length Yoneda representative. To verify that this representative gives the same
    operation, compare the two representing morphisms in the bounded derived category of finitely generated
    $Lambda$-modules, using their finite free resolutions. They agree there because they represent the same Ext
    class. Exact completion and the exact cochain-term functors preserve quasi-isomorphisms of these bounded
    complexes, as is seen by taking the exact horizontal rows of their cones.
    Their induced operations thus agree after totalization. This identifies the edge map with the operation of the
    finite diagram and proves the proposition. ◻
]

===== 5.2.4 One auxiliary shrink for every high transfer <one-auxiliary-shrink-for-every-high-transfer>

We next establish the uniformity that is not supplied merely by forming a germ of marking levels.
  Let $T$ be the translation group scheme, so that finite rational $T$-representations are the objects of
  $cal(C)$. For a compact open subgroup $U subset J$, let $cal(R)_U$ be the category of representations of $T
  times.r U$ which are rational for $T$ and discrete continuous for $U$.
  The compatibility is the usual semidirect-product compatibility.

#thm([Lemma 5.14.])[
  (Finite forgetting kernel).  #emph[Let $U$ be a uniform pro-$p$ marking subgroup, and let $E \,
    F$ be finite objects of $cal(R)_U$. Each group $"Ext"_(cal(R)_U)^j \( E \, F \)$ is finite.
    There is one open subgroup $U' subset U$ on which every element of the kernel of
$ "Ext"_(cal(R)_U)^j \( E \, F \) arrow.r "Ext"_T^j \( E \, F \) $

 becomes zero.]
] <lem:pro-common-shrink>

#proof[
  There is an extension-descent spectral sequence
  #[#set math.equation(numbering: n => "(5.24)")
   $ H_(upright("cts"))^a #scale(x: 120%, y: 120%)[\(] U \, "Ext"_T^b \( E \, F \) #scale(x: 120%, y: 120%)[\)]
     arrow.r.double "Ext"_(cal(R)_U)^(a + b) \( E \, F \) . $ <eq:pro-equivariant-ext>]
  Here is a construction verifying the coefficient-category requirements.
    Regard $U$ as the proconstant affine group scheme whose coordinate algebra is the algebra of locally constant
    $k$-valued functions on $U$. The underlying vector space of the coordinate coalgebra of $T times.r
    U$ is $cal(O) \( T \) ⊗ C_(upright("lc")) \( U \, k \)$. A cofree representation restricts to a cofree
    $T$-representation: the semidirect action is changed to ordinary translation on the $T$ coordinate by
    conjugating that coordinate by the retained $U$ coordinate.
    Its $T$-invariants are a cofree discrete $U$-representation.
    Such $U$-representations are acyclic for invariants, since the locally constant coinduction functor is exact;
    lifts through a vector-space surjection are chosen on the finite image of a locally constant function.
    Cofree resolutions therefore give the spectral sequence for the composite of the two invariant functors.
    Tensoring with the dual of the finite representation $E$ identifies that spectral sequence with (5.24).
  By 56, the translation Ext groups are the ordinary $Lambda$-Ext groups of finite-length modules.
    The Koszul resolution makes $"Ext"_Lambda^b \( k \, k \)$ finite-dimensional and zero for $b > d$.
    Composition series and the long exact sequences in each variable give the same two conclusions for all
    finite-length endpoints. Their induced $U$-actions are discrete continuous.
    Indeed a finite Yoneda representative of a translation Ext class becomes equivariant after shrinking $U$ to
    act trivially on its finite endpoints and on the finite translation quotient through which its middle terms
    act; give those middle terms trivial auxiliary action. This open subgroup fixes the class.
    Finite-type resolutions for the analytic group $U$ then make each group on the left of (5.24)
    finite-dimensional. Only finitely many terms contribute in a fixed total degree.
    The abutment is therefore finite-dimensional over the finite field $k$, hence is a finite set.
  Every representation of the indicated coalgebra is a union of finite-dimensional subrepresentations.
    As in the finite subdiagram construction in 56, an extension with finite endpoints,
    and any Yoneda comparison between such extensions, can be realized by finite diagrams.
    Fix a class in the displayed forgetting kernel. Choose a finite equivariant diagram representing it.
    Its underlying $T$-extension is zero, so there is a finite $T$-linear Yoneda comparison with a representative
    of zero. Shrink $U$ so that it acts trivially on all the finite modules of the original diagram.
    Shrink further so that its action on the finite translation quotients through which the comparison modules act
    is trivial. Give those comparison modules trivial auxiliary action.
    Every comparison arrow is then equivariant, and the class has become zero.
    Finally the forgetting kernel is a finite set. Intersect the finitely many open subgroups just obtained for
    its elements. This one intersection kills the whole kernel.
    A sufficiently deep normal product congruence subgroup is contained in it. ◻
]

At a fixed marking level $U$, finite diagrams with their given $T times.r
  U$-actions descend without trivializing those actions at $U$.
  Indeed, choose $ell$ through which their translation actions factor and a normal open $U' subset
  U$ fixing both $T \/ \[ p^ell \] T$ and every term. The subgroup $\[ p^ell \] T times.r U'$ is normal in $T
  times.r U$: the translation subgroup is $U$-stable, $U'$ is normal in $U$,
  and $U'$ acts trivially on $T \/ \[ p^ell \] T$. The quotient of the full marked lift torsor by $\[ p^ell \] T
  times.r U'$ is a torsor under the finite group scheme $#scale(x: 120%, y: 120%)[\(] T \/ \[ p^ell \] T
  #scale(x: 120%, y: 120%)[\)] times.r \( U \/ U' \)$ over $"Spec" B_U$, by Section 2.1, Proposition 4.1.
  It is therefore a finite faithfully flat cover of that fixed base. Here $U'$ specifies a cover over $B_U$.
  Faithfully flat descent of the vector-space diagram tensored with that cover gives its finite locally free
  associated bundles, arrows, and exactness over $B_U$, with the commuting $G$-action.
  This applies also to finite equivariant Yoneda comparisons.
  Hence equality in equivariant Ext gives equality of the induced operations on the actual cohomology of the
  associated bundles at that level. Restriction to any smaller $U$ preserves it.

#thm([Lemma 5.15.])[
  (A fixed extension through all transfers).  #emph[Fix the index $s$ and generator $e_s$ of 57,
    and choose a generator $e'_0 in "Ext"_Lambda^d \( k \, k \)$.
    There is one sufficiently deep marking subgroup $U_(*)$ such that for every allowed $q gt.eq s$ the composite
#[#set math.equation(numbering: n => "(5.25)")
 $ sans(N)_s arrow.r sans(N)_q arrow.r^("Coind"_q \( e'_0 \)) sans(N)_q \[ d \] arrow.r
   k \[ d \] $ <eq:pro-composite-extension>]

 equals a nonzero scalar multiple of $e_s$ in the equivariant Ext group for $T times.r U_(*)$.
   The first and last maps use the natural auxiliary actions, which are retained for every $q$.]
] <lem:pro-high-transfer>

#proof[
  Choose finite Yoneda diagrams for $e_s$ and $e'_0$. After one initial shrink $U_0$,
    their plain module diagrams are equivariant with trivial auxiliary actions,
    agreeing with the natural action at the fixed endpoint $sans(N)_s$.
    The power-subalgebra identification commutes with marking changes by 38,
    so coinduction gives equivariant diagrams for every $q$ without making the action on $sans(N)_q$ trivial.
    The natural inclusion $sans(N)_s arrow.r sans(N)_q$ is equivariant.
    The space of translation maps $sans(N)_q arrow.r k$ is one-dimensional;
    the pro-$p$ group $U_0$ acts trivially on this line because $k^times$ has order prime to $p$.
    Choose a nonzero map on that line for the last arrow.
  After forgetting $U_0$, the composite in (5.25) is a generator.
    This can be checked directly on the power-subalgebra free pairing.
    With $Lambda^(\( q \)) = k \[ \[ D_1^q \, dots.h \, D_d^q \] \]$,
    the coefficient of $product D_i^(q - 1)$ gives the perfect pairing identifying coinduction from
    $Lambda^(\( q \))$ with extension of scalars. Extension of scalars carries the Koszul representative of $e'_0$
    to the top projection in the Koszul resolution on $D_1^q \, dots.h \, D_d^q$.
    Under the regular-module identifications, the inclusion from the smaller block is multiplication by $product
    D_i^(q - s)$ up to a unit. The Koszul comparison written in the proof of 57 has top coefficient one.
    Following with augmentation therefore leaves a nonzero top coefficient in $k$.
    Changes in the perfect-pairing generators only multiply that coefficient by a unit,
    whose augmentation is nonzero. Thus the ordinary Ext class is $c_q e_s$ for some $c_q in k^times$.
  Subtract $c_q e_s$ from each composite, now in the fixed group $"Ext"_(cal(R)_(U_0))^d \( sans(N)_s \, k \)$.
    All differences lie in its forgetting kernel. Apply 58 to this fixed pair of endpoints.
    One subgroup $U_(*)$ kills the entire kernel, and hence every difference, independently of $q$. ◻
]

===== 5.2.5 The fixed boundary estimate and the contradiction <the-fixed-boundary-estimate-and-the-contradiction>

We make explicit the cocycle estimate used after the common shrink.
  Fix a marking level $U subset U_(*)$ and one finite Yoneda diagram for $e'_0$.
  Applying its associated-bundle functor gives an exact diagram of finite locally free modules over the affine
  ring $B_U$. Each successive surjection in that diagram has a $B_U$-linear section,
  since its quotient is finite projective. Choose such sections once.
  Successively lifting a cocycle by these sections and taking group differentials gives a boundary operator

$ cal(B) : Z_(upright("cts"))^j \( G \, B_U \) arrow.r Z_(upright("cts"))^(j + d) \( G \, B_U \) $

representing $e'_0$ on cohomology. It is an additive $k$-linear operator; it need not be a morphism of $B_U$-modules.

There is a constant $C_U$ such that $cal(B)$ loses at most $C_U$ of whole-lattice $x$-order,
  in every one of the bounded degrees used below. To verify the assertion,
  realize the finitely many bundles as summands of finite free modules and choose finitely many whole lattices in
  these realizations. Every chosen section is a finite matrix with entries having bounded poles.
  The compact group action has a uniform bound on each of these lattices.
  Moreover $g \( x \) \/ x$ is an integral unit, so shifting a lattice by $x^a$ changes none of these bounds.
  A group differential is a finite sum of action and face maps;
  hence it loses at most a fixed additional pole order. Adding the losses of the finitely many sections and
  differentials gives $C_U$. Continuity of these operations on bounded-step cochains follows from Lemma 1.3, Lemma 1.4.

For $q = q_0^a gt.eq s$, put $h = q^(m - 1)$. The entire-diagram identity in 38 transports these fixed sections to
  the coinduced diagram. Thus 59 yields, for a cocycle $w$ at the fixed root level $h_s = s^(m - 1)$,

#[#set math.equation(numbering: n => "(5.26)")
 $ e_s \[ w \] = c_(q \, U)^(- 1) S^a #scale(x: 120%, y: 120%)[\[] cal(B) \( w^h \)
   #scale(x: 120%, y: 120%)[\]] \, wide c_(q \, U) in k^times . $ <eq:pro-boundary-transfer>]

This is equality in the actual group $H^(j + d) \( G \, B_U \)$.
  Here $w$ is first included from $B_U^(1 \/ h_s)$ into $B_U^(1 \/ h)$,
  and powering identifies the latter root coefficient diagram with the original one.
  Since $h$ fixes $k$ and commutes with $G$, $w^h$ is an ordinary cocycle.
  The transfer after taking the boundary is $S^a$ under the same powering identification.
  In particular the bound on the right of (5.26) is the bound for the one fixed operator $cal(B)$,
  not a new bound for each increasingly large coinduced diagram.

We also need positive representatives in the source. For any fixed integer $L > 0$, 17 says that the image of

$ H_(upright("cts"))^j \( G \, x^L A' \) arrow.r H_(upright("cts"))^j \( G \, B_U \) $

has countable cokernel; the map includes the whole model and then projects by $e$.
  The idempotent has a fixed pole cost. Powering by $h_s$ is a $k$-linear,
  $G$-equivariant isomorphism from $B_U^(1 \/ h_s)$ to $B_U$.
  Choose $L$ beyond the idempotent pole cost and pull the preceding image back under this isomorphism.
  We obtain a subspace

#[#set math.equation(numbering: n => "(5.27)")
 $ Z_U^j subset H_(upright("cts"))^j \( G \, B_U^(1 \/ h_s) \) $ <eq:pro-positive-source>]

with countable quotient, whose classes have cocycle representatives of strictly positive $x$-order on the
  normalized root basis. Increasing $L$ prescribes any fixed positive lower bound on that order.
  Whole-lattice representatives are used before projection,
  so this assertion does not specialize the idempotent across the boundary.

#proof[
  If all $T^i \( k \)$ vanish, their finitely many potentially nonzero degrees in (5.21) have a common vanishing
    tail, which is the desired conclusion. Otherwise choose the largest nonzero degree $b$ and the epimorphism
    $e_s$ from 57. If $b - d < 0$, its source is zero and already contradicts $T^b \( k \) eq.not 0$.
    We may therefore assume $j = b - d gt.eq 0$.
  Shrink the marking tail so that 59 holds and the consecutive-image conclusion of 55 holds in degree $b$.
    Fix any one level $U = U_nu$ in this tail. The set $F_nu^b$ of (5.20) is finite.
    Take a class in the positive subspace (5.27) and a cocycle representative $w$ as described there.
    If its positive order is at least $epsilon.alt > 0$, its $h$th powers have whole-basis order tending to
    positive infinity as $h = q^(m - 1)$ increases. Indeed first power out the fixed root denominator $h_s$.
    The resulting whole finite model has integral multiplication laws,
    so further Frobenius powers multiply the lower order bound;
    the fixed projection and basis changes contribute only their fixed pole costs.
    The estimate for $cal(B)$ therefore puts $cal(B) \( w^h \)$ in $cal(P)_nu$ for all sufficiently large $a$.
    Regard this cochain in the whole localized model through $B_U = e B' subset B'$.
    Its differential vanishes there because it vanishes in $B_U$.
    Since $cal(P)_nu$ is $G$-stable and $cal(P)_nu arrow.r.hook B'$ is injective, it is a $cal(P)_nu$-valued cocycle.
  By (5.26), the fixed class $e_s \[ w \]$ then belongs to
  $ "im" #scale(x: 120%, y: 120%)[\(] S^a M_nu^b arrow.r X_nu^b #scale(x: 120%, y: 120%)[\)] $
  for every sufficiently large $a$. Multiplication by the nonzero constant in that equation does not change this
    subspace. These image subspaces are decreasing, so membership in every sufficiently late one implies
    membership in their entire intersection $F_nu^b$. The threshold may depend on $w$;
    no uniform threshold over all cocycles is needed.
  Thus $e_s$ maps $Z_U^j$ into a finite-dimensional space. The quotient of its source by $Z_U^j$ is
    countable-dimensional, so the whole image of $e_s$ at this fixed level is countable-dimensional.
    This holds at every level in the chosen tail. Its morphism in $cal(A)$ is therefore zero.
    It was an epimorphism onto the nonzero object $T^b \( k \)$, a contradiction.
    Hence all $T^i \( k \)$ vanish, and the uniform degree bound gives one common tail for all degrees. ◻
]

===== 5.2.6 The multiplicative-type case <the-multiplicative-type-case>

#proof[
  By 40, the normalized transfer satisfies
  $ S "Fr"^(log_p h_0) = 1 $
  on the open coefficient algebra and on its group cochains. It is therefore surjective on every $X_nu^i$.
    In particular (5.19) holds, and (5.20) gives a finite intersection $F_nu^i$ at each sufficiently deep marking level.
  Choose a sufficiently positive whole-lattice shift $x^L A'$,
    with $L$ larger than the fixed projection pole cost. The image of its cohomology in $X_nu^i$ has countable
    cokernel, by 17. If a class $z$ is represented by a projected cocycle from this lattice,
    its iterated Frobenius powers are integral in the whole model after projection:
    their order grows, while the idempotent and basis costs are fixed.
    They consequently lie in $cal(P)_nu$ for every sufficiently large power. The identity splitting Frobenius gives
  $ \[ z \] = S^a #scale(x: 120%, y: 120%)[\[] z^(h_0^a) #scale(x: 120%, y: 120%)[\]] $
  in the actual open cohomology. As before, the image subspaces are decreasing, so this class belongs to $F_nu^i$.
    The image of the positive-lattice cohomology is therefore finite; its cokernel is countable.
    Hence $X_nu^i$ is countable. The uniform cohomological bound and the finitely many required choices give a
    common sufficiently deep tail for all degrees. ◻
]

== 6 The coefficient induction <part:induction>

==== 6.1 Finiteness of the compact coefficient cohomology <sec:coefficients>

We now close the induction on the height strata. Throughout this section $p$ and $n$ are fixed, $G = P_n$,
  and $k$ is a finite field containing the fields of definition used in the finite marking constructions. Write

$ A_m = k \[ \[ u_m \, dots.h \, u_(n - 1) \] \] \, wide 1 lt.eq m lt.eq n \, $

so that $A_n = k$. The coefficient class is that of 10: integer powers of the periodicity line,
  whole finite division-tuple algebras with the permitted Frobenius powers, and their finite tensor products,
  together with the stated closure under finite sums, summands, and finite filtrations.
  All coefficients over $A_m$ carry their compact topology.

#thm([Theorem 6.1.])[
  #emph[For every $1 lt.eq m lt.eq n$, every coefficient module $M$ in 10 over $A_m$, and every $i gt.eq 0$, the group
$ H_(upright("cts"))^i \( P_n \, M \) $

 is finite. In particular, this holds for every integer periodicity twist of $A_m$.]
] <thm:coeff-finite>

The proof uses countability on the open stratum and compactness on the closed formal neighborhood.
  We first supply the coefficient and descent steps that connect these two statements.
  For $m < n$, put $x = u_m$, $B = B_m = A_m \[ 1 \/ x \]$, and $r = n - m$.
  We choose finite marking levels from a cofinal sequence of normal product subgroups

$ U lt.closed J = P_m times "GL"_r \( bb(Z)_p \) . $

Thus $B_U \/ B$ is a finite étale $J \/ U$-torsor. Normality is available by taking sufficiently deep congruence
  subgroups; it imposes no extra hypothesis on the fixed group $G$.

#thm([Lemma 6.2.])[
  #emph[Assume the coefficient finiteness assertion at height $m + 1$.
    For a basic coefficient $M$ over $A_m$, including any fixed tensor product of the basic division-tuple
    coefficients and an integer periodicity twist, there is a sufficiently deep normal product level $U$ such that
$ H_(upright("cts"))^i #scale(x: 120%, y: 120%)[\(] G \, B_U ⊗_(A_m) M #scale(x: 120%, y: 120%)[\)] $

 is countable for every $i gt.eq 0$. The same conclusion holds after further shrinking within the chosen cofinal
   sequence.]
] <lem:coeff-finite-representations>

#proof[
  By 53, whose boundary hypothesis is precisely 17 at height $m + 1$,
    all groups $H_(upright("cts"))^i \( G \, B_U \)$ are countable on sufficiently deep fixed levels.
    We show that the indicated coefficient extensions have the same property.
  Apply 15 to the basic coefficient $M$. Its whole division-tuple factors, including their powered coordinates,
    give a finite-dimensional translation representation $E$;
    the linear connected marking trivializes the chosen integer periodicity power.
    At every sufficiently deep level this gives a $G$-equivariant identification
  $ B_U ⊗_(A_m) M tilde.eq V_E . $
  Here $G$ acts on the generator-lift torsor and commutes with translation.
  We will use a finite filtration or a finite direct-summand diagram of $E$.
    Its finitely many coaction matrices and arrows factor through one finite translation quotient.
    By the same finite-presentation descent as in Lemma 2.6, Section 4.1,
    the entire diagram and its torsor descend to one further finite marking level.
    The auxiliary actions on its finite-dimensional $k$-spaces factor through finite groups,
    so a common shrink makes them trivial on the diagram. Naturality under formal-group isomorphisms retains
    $G$-equivariance: the identities hold at full markings and descend faithfully to the fixed finite stage.
    These choices concern finitely many modules and maps, not individual elements of $G$.
  The associated-bundle functor is exact on these finite diagrams.
    After base change to the finite lift torsor it is tensoring with $E$; faithful flatness detects exactness.
    Its terms are finite locally free bundles on the affine open.
    Surjections between them have underlying module sections,
    so after choosing lattices their sections have bounded denominators.
    Consequently the associated exact sequences give exact continuous cochain sequences in the convention of 3.
  Suppose first that $m > 1$. The distribution algebra is
  $ Lambda = k \[ \[ D_1 \, dots.h \, D_d \] \] \, wide d = \( m - 1 \) r \, $
  with maximal ideal $frak(m) = \( D_1 \, dots.h \, D_d \)$, as in 38.
    A finite translation representation is a finite-length continuous $Lambda$-module. Its finite filtration
  $ E supset.eq frak(m) E supset.eq frak(m)^2 E supset.eq dots.h.c supset.eq 0 $
  has quotients that are finite direct sums of the trivial representation $k$.
    Having retained this finite diagram at the chosen marking level,
    its associated filtration has quotients $B_U^(xor a)$ with their ordinary $G$-actions.
    Countability of their cohomology and the long exact sequences of the filtration give countability of
    $H_(upright("cts"))^i \( G \, V_E \)$ in every degree.
  For $m = 1$, the translation group is of multiplicative type.
    Choose $H$ from the full cofinal sequence of finite generator-lift quotients,
    deep enough that $E$ factors through $H$. Thus its torsor is the full root algebra of 14,
    rather than an intermediate subalgebra of that root extension. Its distribution algebra
  $ R_H = cal(O) \( H \)^or = cal(O) \( H^D \) $
  is finite étale over $k$, because the Cartier dual $H^D$ of a finite multiplicative-type group is étale.
    Every finite $R_H$-module is therefore a direct summand of $R_H^(xor a)$ for some $a$.
    The perfect trace pairing of the finite étale algebra identifies $R_H$ with $R_H^or =
    cal(O) \( H \)$ as $R_H$-modules. Thus $E$ is a direct summand of a finite sum of regular function
    representations. This argument works over $k$ itself and includes quotients whose order is divisible by $p$.
    For the general semisimplicity statement over the ground field,
    see #cite(label("milne2017"), form: "prose") Theorem 12.30, pp. 241–242.
    Shrink $U$ so that the splitting maps of this finite diagram descend as well.
  The associated bundle of such a regular representation is the function algebra of the corresponding finite lift
    torsor. By 14 and (4.1), after enlarging the level it is
  $ B_U^(1 \/ h) \, wide h = p^a . $
  The exponent may be chosen to fix $k$. Powering gives an additive, $G$-equivariant homeomorphism
  #[#set math.equation(numbering: n => "(6.1)")
   $ B_U^(1 \/ h) arrow.r B_U \, wide z mapsto z^h . $ <eq:coeff-root-powering>]
  For the bounded-pole topology, this follows either from the finite root coordinates or by multiplying every root
    pole bound and parameter order by $h$; the inverse rescales those bounds.
    Hence powering identifies the continuous cochain complexes as additive complexes.
    It is also $k$-linear for the chosen exponents. It follows that each regular block,
    and then its finite sums and summands, has countable cohomology.
  All choices involve finitely many levels and finite diagrams.
    They persist on a cofinal tail, where 53 also applies. This proves the assertion in both cases. ◻
]

#thm([Lemma 6.3.])[
  #emph[Let $M_B$ be a finite locally free $B$-module with the coefficient action of $G$,
    and let $U lt.closed J$ be a finite marking level. If
$ H_(upright("cts"))^i \( G \, B_U ⊗_B M_B \) $

 is countable for every $i gt.eq 0$, then $H_(upright("cts"))^i \( G \, M_B \)$ is countable for every $i gt.eq
   0$. The order of $J \/ U$ need not be invertible in $k$.]
] <lem:coeff-finite-descent>

#proof[
  Put $H = J \/ U$ and $N = B_U ⊗_B M_B$. The $G$- and $H$-actions on $N$ commute.
    Finite étale torsor descent identifies the augmented Amitsur complex with the finite-group cochain resolution
  #[#set math.equation(numbering: n => "(6.2)")
   $ M_B arrow.r N arrow.r C^1 \( H \, N \) arrow.r C^2 \( H \, N \) arrow.r dots.h.c \, $ <eq:coeff-marking-amitsur>]
  where the displayed $N$ is in group-cochain degree zero. This augmented complex is exact.
    For completeness, after faithfully flat base change to $B_U$ the torsor becomes the trivial $H$-torsor and its
    augmented complex has the usual extra-degeneracy contraction. Exactness therefore holds before base change as well.
  It also holds with the required continuous $G$-cochain parameters.
    To make the topology explicit, choose $tau in B_U$ with $sum_(h in H) h \( tau \) = 1$.
    Such an element exists: the torsor trace is surjective after the same faithfully flat base change,
    so its cokernel vanishes over $B$. The $B$-linear map
  $ lambda : B_U arrow.r B \, wide lambda \( z \) = "Tr"_(B_U \/ B) \( tau z \) $
  satisfies $lambda \( 1 \) = 1$. Applying $lambda$ to the first algebra factor contracts the augmented Amitsur
    complex; the insert-unit differential gives the contraction identity directly.
    These are finite matrices over $B$ on the fixed finite locally free terms,
    so they send each lattice to a bounded pole shift and are continuous there.
    The contraction need not commute with $G$: exactness of each row after applying continuous cochains is what is
    needed. Thus applying $C_(upright("cts"))^a \( G \, - \)$ to (6.2) remains exact for every $a$.
  The first-quadrant double complex
  $ C_(upright("cts"))^a #scale(x: 120%, y: 120%)[\(] G \, C^b \( H \, N \) #scale(x: 120%, y: 120%)[\)] $
  therefore computes $H_(upright("cts"))^(*) \( G \, M_B \)$, and its other spectral sequence is
  #[#set math.equation(numbering: n => "(6.3)")
   $ H^b #scale(x: 120%, y: 120%)[\(] H \, H_(upright("cts"))^a \( G \, N \) #scale(x: 120%, y: 120%)[\)] med
     arrow.r.double med H_(upright("cts"))^(a + b) \( G \, M_B \) . $ <eq:coeff-marking-spectral>]
  Finite $H$-cochains are finite products. Their cohomology on a countable module is countable,
    regardless of divisibility of $\| H \|$ by $p$. Every total-degree diagonal of (6.3) is finite,
    so its abutment is countable. This proves the claim. ◻
]

#proof[
  Tensoring finite free modules preserves exact filtrations and retracts,
    and a tensor product of basic coefficients is basic. Induction on the finite constructions in 10 therefore
    reduces the asserted closure properties to finite filtrations and retracts. We induct downwards on $m$.
    At $m = n$, every basic coefficient is a finite-dimensional vector space over the finite field $k$.
    A finite-type projective resolution for $G$ computes its cohomology by a complex whose term in each degree is
    a summand of a finite power of this finite coefficient module; see 4.
    Each cohomology group is therefore finite. This uses finiteness of the resolution in each degree,
    not finite cohomological dimension of $G$. Finite sums, summands, and finite filtrations preserve the conclusion.
  Now let $m < n$ and assume the assertion at $m + 1$. It suffices first to treat a basic tensor coefficient $M$:
    the long exact cohomology sequence and retracts then give all the closures allowed in 10. By Lemma 6.2, Lemma 6.3,
  #[#set math.equation(numbering: n => "(6.4)")
   $ H_(upright("cts"))^i \( G \, M \[ 1 \/ x \] \) quad upright("is countable for every ") i gt.eq
     0 . $ <eq:coeff-open-countable>]
  We spell out the boundary comparison. The submodules $x^a
    M$ are $G$-stable as submodules with their induced actions, since $G$ preserves the ideal $\( x \)$.
    The successive quotients of every fixed pole strip are restrictions of the original coefficients to
    $A_(m + 1)$, with the appropriate conormal twists. These are still allowed coefficients:
    the conormal line is an integer periodicity twist, and a powered tuple with $b lt.eq
    m ell$ also satisfies $b lt.eq \( m + 1 \) ell$. The whole-model filtrations in Proposition 2.4,
    Lemma 2.8 consequently give finite cohomology for every fixed strip. In particular, for
  $ Q_a = x^(- a) M \/ M quad \( a gt.eq 0 \) \, wide Q = M \[ 1 \/ x \] \/ M = "colim"_a Q_a \, $
  each $H_(upright("cts"))^i \( G \, Q_a \)$ is finite.
  By the bounded-denominator convention, cochains on $Q$ are precisely the filtered union of the cochains on the
    $Q_a$. Filtered colimits of vector spaces are exact, so
  $ H_(upright("cts"))^i \( G \, Q \) = "colim"_a H_(upright("cts"))^i \( G \, Q_a \) $
  is countable. The exact cochain sequence supplied by 3 for $0 arrow.r M arrow.r M \[ 1 \/ x \] arrow.r Q arrow.r
    0$ now shows that the kernel and cokernel of
  $ H_(upright("cts"))^i \( G \, M \) arrow.r H_(upright("cts"))^i \( G \, M \[ 1 \/ x \] \) $
  are countable. Together with (6.4), this proves that $H_(upright("cts"))^i \( G \, M \)$ is countable.
  Finally, $M$ is compact. The finite-type completed resolution in 4 computes $H_(upright("cts"))^i \( G \, M \)$
    as a quotient of a closed subspace of a compact module by the compact image of a continuous map.
    Its cohomology is thus compact and Hausdorff. A countable compact Hausdorff group is finite:
    by the Baire theorem one of its singleton closed subsets has interior; translations make the group discrete,
    and compactness makes that discrete group finite. Hence $H_(upright("cts"))^i \( G \, M \)$ is finite.
    This closes the induction. ◻
]

#thm([Corollary 6.4.])[
  #emph[Let $E_n$ be Morava $E$-theory for the height-$n$ Honda group over $bb(F)_(p^n)$, and let
$ bb(G)_n = P_n times.r "Gal" \( bb(F)_(p^n) \/ bb(F)_p \) $

 be its extended stabilizer. For every $i gt.eq 0$ and every $t in bb(Z)$, both groups
$ H_(upright("cts"))^i #scale(x: 120%, y: 120%)[\(] P_n \, pi_t \( E_n \/ p \) #scale(x: 120%, y: 120%)[\)] \,
  wide H_(upright("cts"))^i #scale(x: 120%, y: 120%)[\(] bb(G)_n \, pi_t \( E_n \/ p \) #scale(x: 120%, y: 120%)[\)] $

 are finite.]
] <cor:coeff-morava>

#proof[
  The coefficient ring is
  $ pi_(*) E_n = W \( bb(F)_(p^n) \) \[ \[ u_1 \, dots.h \, u_(n - 1) \] \] \[ u^(plus.minus 1) \] \,
    wide \| u \| = - 2 . $
  Multiplication by $p$ is injective, and the ring is even.
    Therefore the odd homotopy groups of $E_n \/ p$ vanish, while each even homotopy group is the special-fiber
    ring with an integer power of its intrinsic periodicity line.
    Extending $bb(F)_(p^n)$ to the finite field $k$ identifies this coefficient with one of the $m =
    1$ twists in 60. Finite scalar extension commutes with the compact continuous-cochain complex and with its
    cohomology: after choosing a field basis it is a finite direct sum, with the product compact topology.
    Faithfulness of the extension therefore proves the asserted finiteness for $P_n$ over $bb(F)_(p^n)$.
  For the extended group use the continuous group-extension spectral sequence
  $ H^a #h(-0.16667em)
    ("Gal" \( bb(F)_(p^n) \/ bb(F)_p \) \, H_(upright("cts"))^b #scale(x: 120%, y: 120%)[\(] P_n \, pi_t \( E_n \/
    p \) #scale(x: 120%, y: 120%)[\)]) med arrow.r.double med H_(upright("cts"))^(a + b)
    #scale(x: 120%, y: 120%)[\(] bb(G)_n \, pi_t \( E_n \/ p \) #scale(x: 120%, y: 120%)[\)] . $
  Its coefficients on the second page are finite, and a finite group has finite cohomology in each degree on a
    finite module. Each total-degree diagonal has finitely many entries. The abutment is therefore finite.
    This reasoning also applies when $p$ divides the degree $n$ of the constant-field extension;
    no averaging by the order of the Galois group is used. ◻
]

== 7 Descent and integral homotopy <part:descent>

==== 7.1 Integral homotopy of the local sphere <sec:sphere>

We apply the coefficient theorem to the Morava $E$-Adams spectral sequence and then recover integral homotopy from
  finite power cofibers. The first step needs the horizontal vanishing theorem at a finite page,
  rather than a bound on the cohomological dimension of the full stabilizer.
  The second step needs actual finiteness modulo $p$, rather than a bound on torsion exponents.

===== 7.1.1 Descent after taking the cofiber of $p$ <descent-after-taking-the-cofiber-of-p>

We recall the precise standard descent input. For every prime $p$ and positive height $n$,
  the commutative algebra $E_n$ is descendable in the $K \( n \)$-local category.
  The completed Amitsur complex for a spectrum $Y$ has terms

$ L_(K \( n \)) #scale(x: 120%, y: 120%)[\(] Y and E_n^(and \( q + 1 \)) #scale(x: 120%, y: 120%)[\)] \, wide
  q gt.eq 0 \, $

and its totalization is $L_(K \( n \)) Y$. Its Adams spectral sequence is strongly convergent,
  and there are finite integers $R gt.eq 2$ and $N gt.eq 0$ such that its $R$th page vanishes in cohomological
  filtrations $s > N$. For fixed $p \, n$, these integers may be chosen independently of $Y$ and of the internal degree.

These assertions are the $k = n$ case of #cite(label("heard2023"), form: "prose") Theorem 4.6 and
  Proposition 4.13; the identification with the $K \( n \)$-local $E_n$-Adams spectral sequence is made in
  #cite(label("heard2023"), form: "prose") Remark 4.14. The descendability statement follows from the
  Hopkins–Ravenel smash product theorem and its preservation under localization,
  as in #cite(label("mathew2016"), form: "prose") Theorem 4.18 and Proposition 10.10;
  the finite-page vanishing and convergence are #cite(label("mathew2016"), form: "prose") Corollary 4.4.
  The fixed-point construction and continuous-cohomology comparison are
  #cite(label("devinatzHopkins2004"), form: "prose") Theorem 1(iii)–(iv) and Appendix A.
  None of these statements imposes a lower bound on $p$ relative to $n$.

Taking $Y = S \/ p$, the resulting spectral sequence is

#[#set math.equation(numbering: n => "(7.1)")
 $ E_2^(s \, t) = H_(upright("cts"))^s #scale(x: 120%, y: 120%)[\(] bb(G)_n \,
   pi_t \( E_n \/ p \) #scale(x: 120%, y: 120%)[\)] med arrow.r.double med
   pi_(t - s) L_(K \( n \)) \( S \/ p \) . $ <eq:sphere-modp-descent>]

Here $S \/ p$ is the finite Moore spectrum. Thus the usual continuous Amitsur comparison is compatible with
  smashing by $S \/ p$; equivalently, apply the finite-dual form of
  #cite(label("devinatzHopkins2004"), form: "prose") Theorem 1(iv) to $D \( S \/ p \)$.
  This gives the indicated coefficient module, since $E_n$ is even and $p$ is injective on its homotopy.
  No commutative multiplication on the Moore spectrum is required.

#thm([Proposition 7.1.])[
  #emph[For every prime $p$, every $n gt.eq 1$, and every $j in bb(Z)$, the group
$ pi_j L_(K \( n \)) \( S \/ p \) $

 is finite.]
] <prop:sphere-modp>

#proof[
  Every entry on the second page of (7.1) is finite by 63. The entries on all later pages are subquotients of
    those entries. Choose $R \, N$ as in the descent theorem.
    Only $0 lt.eq s lt.eq N$ can contribute to the limiting page,
    and the entries contributing to the stem $j$ have $t = j + s$.
    There are thus only finitely many finite limiting entries in that stem.
    Strong convergence supplies a separated exhaustive filtration of the abutment.
    Above filtration $N$, all successive quotients vanish, so that tail is constant;
    separatedness makes the constant tail zero. The remaining filtration is finite,
    with finite successive quotients, so the abutment is finite.
    The same argument covers negative $j$, and no evaluation or splitting of additive extensions is needed. ◻
]

===== 7.1.2 Finite power cofibers and integral recovery <finite-power-cofibers-and-integral-recovery>

The mod-$p$ criterion for finite type appears for invertible $K \( 2 \)$-local spectra in
  #cite(label("liFiniteType2021"), form: "prose") Proposition 3.1.
  We give the derived-complete form needed here, including the compact Nakayama step.
  The argument applies in all integer degrees and imposes no connectivity hypothesis.

For any spectrum $X$ and integer $a gt.eq 1$, write $X \/ p^a = "cofib" \( p^a : X arrow.r X \)$,
  with the quotient transition maps $X \/ p^(a + 1) arrow.r X \/ p^a$. We use derived $p$-completeness in the form

$ X tilde.eq "holim"_a X \/ p^a . $

This formulation does not assume ordinary completeness of its individual homotopy groups.

#thm([Lemma 7.2.])[
  #emph[Let $X$ be a derived $p$-complete spectrum. If $pi_j \( X \/ p \)$ is finite for every $j in bb(Z)$,
    then $pi_j X$ is finitely generated over $bb(Z)_p$ for every $j in bb(Z)$.
    Conversely, finite generation of all $pi_j X$ over $bb(Z)_p$ implies finiteness of all $pi_j \( X \/ p \)$.]
] <lem:sphere-completion>

#proof[
  The cofiber exact sequence gives, for every $j$,
  #[#set math.equation(numbering: n => "(7.2)")
   $ 0 arrow.r pi_j X \/ p pi_j X arrow.r pi_j \( X \/ p \) arrow.r \( pi_(j - 1) X \) \[ p \] arrow.r
     0 . $ <eq:sphere-cofiber-short>]
  Both end terms are killed by $p$. Thus every finite middle term is a finite $p$-group;
    we do not require it to be killed by $p$ itself. Factoring $p^(a + 1)$ as $p compose p^a$ gives exact triangles
  $ X \/ p^a arrow.r X \/ p^(a + 1) arrow.r X \/ p . $
  Their homotopy exact sequences inductively show that $pi_j \( X \/ p^a \)$ is a finite $p$-group for every $a
    gt.eq 1$ and every $j$.
  For fixed $j$, the inverse system of these finite groups is Mittag–Leffler:
    its decreasing images in any one finite target eventually stabilize.
    Its first derived inverse limit therefore vanishes. Applying the Milnor exact sequence,
    in the adjacent degree as well, and derived completeness gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ pi_j X med tilde.equiv med "proj lim"_a pi_j \( X \/ p^a \) . $ <eq:sphere-finite-limit>]
  For clarity, vanishing of the derived limit requires no surjectivity of the transition maps.
    The map $1 - upright("shift")$ on the product of the finite groups is surjective:
    every finite set of its defining equations can be solved backwards,
    and compactness of the product supplies a simultaneous solution.
    This is also a direct proof of the required lim-one vanishing.
  Put $M = pi_j X$. The presentation (7.3) makes $M$ a compact Hausdorff pro-$p$ group with its canonical
    continuous $bb(Z)_p$-module structure. On each finite target $pi_j \( X \/ p^a \)$,
    this scalar structure is defined by reducing a $p$-adic integer modulo a power of $p$ that kills that target;
    the definitions are compatible with the transition maps. Multiplication by $p$ on $M$ is continuous,
    so $p M$ is compact and closed. By (7.2), the quotient $M \/ p M$ is finite.
  Choose $a_1 \, dots.h \, a_d in M$ lifting generators of $M \/ p M$ over $bb(F)_p$. For $z in M$, successively express
  $ z_ell = sum_(i = 1)^d b_(i \, ell) a_i + p z_(ell + 1) \, wide z_0 = z \, wide b_(i \, ell) in { 0 \,
    dots.h \, p - 1 } . $
  The scalars $c_i = sum_(ell gt.eq 0) p^ell b_(i \, ell)$ converge in $bb(Z)_p$.
    The residual term after $L$ steps is $p^L z_L$. It tends to zero in $M$:
    any fixed finite target in (7.3) is killed by a fixed power of $p$,
    which kills the image of $p^L z_L$ for all sufficiently large $L$, independently of $z_L$.
    Therefore $z = sum_i c_i a_i$. The continuous homomorphism
  $ bb(Z)_p^d arrow.r M \, wide \( c_i \) mapsto sum_i c_i a_i $
  is surjective. This proves finite generation as an abstract $bb(Z)_p$-module,
    and not merely density of a finitely generated subgroup.
  Conversely, if every $pi_j X$ is finitely generated over $bb(Z)_p$, then both end terms of (7.2) are finite.
    For the $p$-torsion term, use that a submodule of a finite module over the Noetherian ring $bb(Z)_p$ is finite
    as a module, and here it is killed by $p$. The middle term is consequently finite as well. ◻
]

#proof[
  Let $X = L_(K \( n \)) S_p^and$. A $K \( n \)$-local spectrum is derived $p$-complete when $n > 0$.
    To see this directly, the fiber of $X arrow.r "holim"_a X \/ p^a$ is
  $ "holim" \( dots.h.c arrow.r^p X arrow.r^p X \) tilde.eq F \( S \[ 1 \/ p \] \, X \) . $
  The spectrum $S \[ 1 \/ p \]$ is $K \( n \)$-acyclic, so this mapping spectrum vanishes by locality.
    This proves the required completeness without a connectivity assumption.
  The map $S arrow.r S_p^and$ is a mod-$p$ equivalence, hence a $K \( n \)$-equivalence:
    its cofiber has invertible multiplication by $p$, whereas multiplication by $p$ is zero on Morava $K$-theory.
    Exactness of localization therefore identifies
  $ X tilde.eq L_(K \( n \)) S \, wide X \/ p tilde.eq L_(K \( n \)) \( S \/ p \) . $
  The latter spectrum has finite homotopy groups in every degree by 64. Applying 65 proves the sphere assertion.
  For the finite-spectrum formulation, consider the class of finite $p$-local spectra $F$ for which every $pi_j
    L_(K \( n \)) \( F and S \/ p \)$ is finite. It contains the sphere by 64 and is closed under suspensions,
    finite cofiber sequences, and retracts, by exactness and the homotopy long exact sequence.
    It therefore contains every finite $p$-local spectrum. The spectrum $L_(K \( n \))
    F$ is derived $p$-complete by the same locality argument,
    and its cofiber of $p$ is $L_(K \( n \)) \( F and S \/ p \)$.
    Applying 65 objectwise proves the full finite-spectrum conclusion of 1. ◻
]

===== 7.1.3 Ranks and the height-one calculation <ranks-and-the-height-one-calculation>

Finite generation gives an abstract decomposition

$ pi_j L_(K \( n \)) S_p^and tilde.equiv bb(Z)_p^(thin r_(p \, n \, j)) xor
  xor.big_(e gt.eq 1) \( bb(Z) \/ p^e \)^(m_(p \, n \, j \, e)) \, $

with finitely many nonzero torsion multiplicities in each degree.
  The argument above establishes the existence of these finite invariants;
  it does not determine the torsion multiplicities in general.

#thm([Corollary 7.3.])[
  #emph[For every prime $p$, every $n gt.eq 1$, and every $j in bb(Z)$, the free rank is
#[#set math.equation(numbering: n => "(7.4)")
 $ r_(p \, n \, j) = \# {I subset.eq { 1 \, dots.h \, n } : sum_(i in I) \( 1 - 2 i \) = j} . $ <eq:sphere-ranks>]

 Equivalently, these ranks are the graded dimensions of the exterior $bb(Q)_p$-algebra on generators in degrees $-
   1 \, - 3 \, dots.h \, - \( 2 n - 1 \)$.]
] <cor:sphere-ranks>

#proof[
  By #cite(label("bssw2024"), form: "prose") Theorem A, the rationalized homotopy ring is the indicated exterior
    algebra. For a finitely generated $bb(Z)_p$-module its $bb(Q)_p$-dimension after inverting $p$ is its free
    rank. The exterior monomials are indexed by subsets $I$ and have the degrees in (7.4). This proves the formula. ◻
]

#thm([Proposition 7.4.])[
  #emph[Let $p$ be odd. Then, for every $j in bb(Z)$,
$ pi_j L_(K \( 1 \)) S_p^and tilde.equiv
  cases(delim: "{", bb(Z)_p \, & j = 0 upright(" or ") j = - 1 \,, bb(Z) \/ p^(thin 1 + nu_p \( t \)) \, & j = 2
  t - 1 \, quad 0 eq.not t in \( p - 1 \) bb(Z) \,, 0 \, & upright("otherwise") .) $

 The displayed groups include all additive extensions.]
] <prop:sphere-height-one>

#proof[
  At height one, Morava $E$-theory is $p$-completed periodic complex $K$-theory, with
  $ pi_(*) K U_p^and = bb(Z)_p \[ beta^(plus.minus 1) \] \, wide \| beta \| = 2 . $
  The stabilizer is $bb(Z)_p^times = mu_(p - 1) times \( 1 + p bb(Z)_p \)$,
    and the Adams operation $psi^a$ acts on $beta^t$ by $a^t$.
    Taking homotopy fixed points by the finite group $mu_(p - 1)$ is exact on these coefficient modules,
    because $p - 1$ is a unit in $bb(Z)_p$. The resulting Adams summand, denoted $B$, has
  $ pi_(2 t) B = cases(delim: "{", bb(Z)_p \, & \( p - 1 \) divides t \,, 0 \, & \( p - 1 \) divides.not t \,)
    wide pi_(2 t + 1) B = 0 . $
  The element $1 + p$ topologically generates $1 + p bb(Z)_p$.
    Its two-term continuous resolution, or the standard Adams-operation fiber sequence
    #cite(label("hopkinsKOne")) §§1–2, gives
  $ L_(K \( 1 \)) S_p^and arrow.r B arrow.r^(thin psi^(1 + p) - 1 thin) B . $
  On a retained coefficient in degree $2 t$, the map is multiplication by $\( 1 + p \)^t - 1$.
    For $t = 0$ it is zero, giving $bb(Z)_p$ in degrees $0$ and $- 1$.
    For $t eq.not 0$ it is injective, and its cokernel is cyclic of order determined by
  #[#set math.equation(numbering: n => "(7.5)")
   $ nu_p #scale(x: 120%, y: 120%)[\(] \( 1 + p \)^t - 1 #scale(x: 120%, y: 120%)[\)] = 1 +
     nu_p \( t \) . $ <eq:sphere-height-one-valuation>]
  Indeed, if $p divides.not a$, binomial expansion gives $\( 1 + p \)^a - 1 equiv a p med \( mod med p^2 \)$.
    If $v_p \( z \) gt.eq 1$ and $p$ is odd, the term $p z$ in $\( 1 + z \)^p - 1$ has valuation $1 +
    v_p \( z \)$ and every other term has strictly greater valuation.
    Iterating this observation proves (7.5) for positive $t$. For negative $t$, the identity
  $ \( 1 + p \)^(- t) - 1 = - frac(\( 1 + p \)^t - 1, \( 1 + p \)^t) $
  shows that the valuation is unchanged by replacing $t$ with $- t$.
  The cokernel for a nonzero retained $t$ lies in degree $2 t - 1$; there is no kernel in degree $2 t$.
    Coefficients in other degrees vanish. The fiber exact sequence has at most one contributing kernel or cokernel
    in each stem, so the stated groups involve no unresolved additive extension. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
