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

#align(center)[#text(size: 16pt, weight: "bold")[Quasi-isometric Recognition of \
Virtually Polycyclic Groups]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

A group is #emph[polycyclic] if it has a finite subnormal series with cyclic factors. It is #emph[virtually polycyclic] if it contains a polycyclic subgroup of finite index. We prove that virtual polycyclicity can be recognized from the large-scale geometry of a word metric.

A $\( K \, C \)$-#emph[quasi-isometry] $F : X arrow.r Y$, with $K gt.eq 1$ and $C gt.eq 0$, satisfies

$ K^(- 1) d_X \( x \, x' \) - C lt.eq d_Y \( F \( x \) \, F \( x' \) \) lt.eq K d_X \( x \, x' \) + C $

for all $x \, x' in X$, and every point of $Y$ is within distance $C$ of $F \( X \)$. Different finite generating sets give quasi-isometric word metrics.

#thm([Theorem 1.1.])[
  #emph[Let $P$ be a finitely generated virtually polycyclic group, and let $H$ be any finitely generated group. If $H$ and $P$ are quasi-isometric, then $H$ is virtually polycyclic.]
] <thm:recognition>

The group $H$ in Theorem 1 is subject to no algebraic hypothesis beyond finite generation.

The virtual lattice characterization of polycyclic groups gives the following equivalent formulation. A lattice is a discrete subgroup of finite covolume; it is uniform if the quotient is compact.

#thm([Corollary 1.2.])[
  #emph[If a finitely generated group $H$ is quasi-isometric to a lattice in a connected simply connected solvable Lie group, then a finite-index subgroup of $H$ is a uniform lattice in some connected simply connected solvable Lie group.]
] <cor:lattice-recognition>

The ambient Lie group in this conclusion may change. The precise lattice statements and finite-index reductions are given in the proof of Corollary 2.

=== 1.1 The recognition problem <the-recognition-problem>

Eskin, Fisher and Whyte formulated the lattice-recognition conjecture and its equivalent polycyclic formulation in #cite(label("EskinFisherWhyte2007")) Conjecture 1.2 and Remark (3), p. 929. Gromov’s theorem on groups of polynomial growth settles the virtually nilpotent case #cite(label("Gromov1981")). For the full class, Shalom proved that a finitely generated group quasi-isometric to an infinite polycyclic group has a finite-index subgroup with infinite abelianization #cite(label("Shalom2004")) Theorem 1.3. The remaining recognition problem asks for the algebraic structure of an arbitrary finitely generated comparison group, on which solvability is not assumed.

Height rigidity has been central to the exponential-growth case. Farb and Mosher formulated horizontal-preservation conjectures for abelian-by-cyclic models and the recognition conjecture for $upright("Sol")$ #cite(label("FarbMosher2000")) Section 5. Eskin, Fisher and Whyte established recognition for $upright("Sol")$ by coarse differentiation #cite(label("EskinFisherWhyte2013")) Theorem 1.1. Peng extended this analysis to nondegenerate unimodular split abelian-by-abelian Lie groups #cite(label("Peng2011I")) #cite(label("Peng2011II")). Her argument makes local height maps affine and compares them across boxes; it gives a description of quasi-isometries as well as virtual-polycyclic recognition #cite(label("Peng2011II")) Theorem 5.3.6 and Corollary 5.3.9. This class already includes nontrivial Jordan blocks.

For several of these models, height control induces actions on boundaries, where conjugation theorems give stronger rigidity conclusions. Dymarz carried this out for diagonalizable determinant-one models with no unit-modulus eigenvalues #cite(label("Dymarz2010")). Dymarz, Fisher and Xie prove a conjugation theorem for suitable nilpotent boundaries and apply it to SOL-like groups with possibly nonabelian nilpotent factors #cite(label("DymarzFisherXie2025")) Theorems 1.2 and 1.5. Their Section 9 repairs the conjugation step in #cite(label("Dymarz2010")) Section 3.3 using amenability. Their recognition result retains the structural and amenability hypotheses specified in their Theorem 1.5.

Grayevsky and Pallier obtain rigidity of $upright("Sol")_5$ and its lattices #cite(label("GrayevskyPallier2025")) Theorem C. A different strengthening of the geometric hypothesis is commability: two locally compact groups are commable if they are joined by a finite zigzag of continuous proper homomorphisms with cocompact image #cite(label("CornulierDeLaHarpe2016")) Remark 4.C.13. Le Boudec proves virtual-polycyclic recognition under this hypothesis #cite(label("LeBoudec2025")) Theorem 7 and Corollary 3.7.

Theorem 1 resolves recognition for the full class of virtually polycyclic groups. We establish uniform height control for the general solvable Lie models described below. Combined with amenability, this control yields elementary amenability of the comparison group; finiteness and duality then yield virtual polycyclicity.

=== 1.2 Uniform bounded height <uniform-bounded-height>

We use connected simply connected #emph[real-triangulable] Lie groups: the adjoint representation of their Lie algebra admits a simultaneously upper triangular form over $bb(R)$. Fix a left invariant Riemannian metric on each such group. A group is #emph[unimodular] if its left Haar measure is also right invariant. The relevant quotient has a canonical definition.

#prodef([Definition 1.3.])[
  Let $frak(g)$ be the Lie algebra of a real-triangulable group $G$. Denote the diagonal characters of a simultaneous real triangular form of $"ad"$ by $chi_1 \, dots.h \, chi_s$, including repetitions and zero characters. Put
  $ frak(k) = ⋂_(j = 1)^s ker chi_j \, #h(2em) W = frak(g) \/ frak(k) . $
  The #emph[exponential height map] is the homomorphism $pi : G arrow.r \( W \, + \)$ whose differential is the quotient map.
] <def:canonical-height>

For the zero-dimensional algebra, the empty intersection is $frak(g)$. The characters vanish on $\[ frak(g) \, frak(g) \]$, so the quotient is abelian. Their multiset is intrinsic to the adjoint representation; hence $frak(k)$ is independent of the triangular basis. Simple connectedness gives the homomorphism $pi$. Fix any norm on $W$.

#thm([Theorem 1.4.])[
  (Uniform bounded height).  #emph[Let $G$ be a connected simply connected real-triangulable unimodular Lie group, with a fixed left invariant Riemannian metric, exponential height map $pi : G arrow.r W$, and a fixed norm on $W$. There is a finite subgroup $cal(A)_G lt.eq "GL" \( W \)$ such that, for every $K gt.eq 1$ and $C gt.eq 0$, there is a constant $B = B \( G \, K \, C \)$ with the following property. Every $\( K \, C \)$ self quasi-isometry $F$ of $G$ has an $A_F in cal(A)_G$ satisfying 
#[#set math.equation(numbering: n => "(1.1)")
 $ parallel pi F \( g \) - pi F \( 1 \) - A_F pi \( g \) #scale(x: 120%, y: 120%)[parallel] lt.eq B #h(2em) \( g in G \) . $ <eq:height-main>]

]
] <thm:bounded-height>

The finite group $cal(A)_G$ will be constructed from the exponential rates of bracket-generated volume in Lemma 9. It depends on $G$, whereas the error bound depends additionally on the quasi-isometry constants. When $W = 0$, the height statement is vacuous and $G$ is nilpotent; this case is treated separately in recognition.

=== 1.3 How height gives recognition <how-height-gives-recognition>

We first explain how Theorem 4 implies recognition; the complete deduction appears in Section 11. A virtually polycyclic group is quasi-isometric to a connected simply connected real-triangulable unimodular Lie model $G$. Transporting the left translation action of $H$ across a quasi-isometry gives maps of $G$ with uniform quasi-isometry bounds that respect multiplication up to a uniformly bounded error. This is a #emph[uniform quasi-action]. Equation (1.1) assigns a linear part in the finite group $cal(A)_G$ to each element of $H$. After passing to a finite-index subgroup $H_0$, all linear parts are the identity. The group $H$ inherits amenability from its virtually polycyclic comparison group by quasi-isometry. Amenability then corrects the bounded defect in the height translations to a homomorphism $tau : H_0 arrow.r W$.

Every finitely generated subgroup of $ker tau$ has polynomial growth: its word paths have bounded height, and the volume of possible endpoints grows polynomially. Gromov’s theorem makes each such subgroup virtually nilpotent. Thus $ker tau$, and consequently $H$, is elementary amenable. Finiteness properties and Poincaré duality inherited from the comparison group, together with the structure of elementary amenable groups, then imply that a finite-index subgroup of $H$ is polycyclic. The bounded error is essential: a sublinear height bound alone would not give the bounded-height word paths used to prove polynomial growth in the kernel.

=== 1.4 The height argument <the-height-argument>

The geometric meaning of height is already visible in $upright("Sol") = bb(R)^2 times.r bb(R)$, where $t in bb(R)$ acts on the two coordinate directions by $e^t$ and $e^(- t)$. A bounded horizontal move at height $t$ can change the first coordinate by order $e^t$ and the second by order $e^(- t)$. To reach many endpoints, a path can make its first-coordinate move high up and its second-coordinate move low down. If its allowed heights form $r \[ a \, b \]$, the resulting rectangle has area of order $e^(r \( b - a \))$. Thus the height range determines an exponential rate of accessible volume.

For a general Lie model, the corresponding rate is a function $P \( E \)$ of the compact convex allowed height set $E subset W$. Its definition in Section 3 includes every bracket direction generated by the expanding directions. Paths of length $O \( r \)$ from one starting point, visiting the appropriate support positions and returning to a common height, reach $e^(r P \( E \) + o \( r \))$ endpoints separated at a fixed scale. Their images also have length $O \( r \)$. If those images remain at heights in $r E'$ up to sublinear errors, the image paths can reach at most $e^(r P \( E' \) + o \( r \))$ separated endpoints. A quasi-isometry therefore forces $P \( E \) lt.eq P \( E' \)$. Applying this comparison in both directions will restrict an affine height slope to the finite group $cal(A)_G$.

The proof must first produce such slopes and then make them independent of the averaging, chart, and scale used to find them. Choose the nilpotent groups $N \, D$ of Section 2, with $N$ normal and $G = N D$. The expression $g = n d$ need not be unique. We study the height function on the sets $x n D$: for fixed $x in G$ and $n in N$, rescale $d mapsto pi F \( x n d \)$ on larger and larger intrinsic $D$-balls. These are the $D$-charts, or sheets indexed by $n$. Endpoint counts instead use the slices $x N d$ at a fixed $D$-position, where the parameterization by $N$ is injective.

The geometric proof has three stages. First we study a compact space of normalized quasi-isometries: each map is translated so that it sends the identity to the identity. Moving the basepoint and recentering defines an action on this space. This construction follows Shalom’s measured-coupling viewpoint #cite(label("Shalom2004")) Sections 2.1–2.2. For each ergodic invariant probability measure, the reduced-cohomology vanishing theorem of Cornulier and Tessera #cite(label("CornulierTessera2020")) Corollary 1.9 supplies a linear height slope. The volume comparison above restricts this slope to $cal(A)_G$ once it is applied to the map and its inverse. For the reverse comparison we need the inverse of the same slope; a coupling constructed from Haar measure provides it.

Second we pass from invariant measures to arbitrary maps. We sample large $D$-charts and rescale their height functions. Stationary increments constrain each limiting profile, while accessible endpoint volume prevents it from folding. Together these facts make every supported limiting profile affine on the chart interior. The volume argument still works after restricting the switch parameters to a set retaining a subexponential fraction of their measure: a polynomial-image estimate retains the required exponential endpoint volume. Different sheets could nevertheless have different affine maps. If neighboring profiles had different linear parts, a limiting comparison at supporting heights would force a suitable source height segment to have opposite target directions on the two sheets. Alternating moves on the sheets would then produce a target volume exponent twice the source exponent, contradicting the volume comparison. Haar multipliers in suitable nilpotent quotients then detect, and eliminate, differences of their translations. Comparison across scales and basepoints gives one global slope with a uniform sublinear error.

Finally we improve this error to a bounded one. Contracting rays define maps between nilpotent quotient boundaries. The Haar volumes of their images record height; averaging translated sets then bounds its error. Boundary conjugation theorems, such as those in #cite(label("Dymarz2010")) #cite(label("DymarzFisherXie2025")), produce rigid actions from height control. Here, starting from the uniform sublinear estimate, the boundary maps bound the remaining height error through their image measures. The recognition argument can then use the bounded-height kernel and the finiteness and duality theorems.

The progression from weak height control to bounded error, followed by an application to a transported group action, already occurs in #cite(label("EskinFisherWhyte2012")) Sections 6.1–6.2 and Theorem 7.3. The present proof establishes the estimate for the full class in Theorem 4. Its volume calculations retain both the bracket directions in $N$ and the multiplicity of the surjection $N times.r D arrow.r G$, so no complementary height subgroup is required.

Sections 2–4 develop the Lie coordinates, volume estimates, and restricted-product lemma. Section 5 identifies stationary slopes. The profile and neighboring-chart arguments lead to the uniform sublinear estimate in Section 9; Section 10 proves bounded height. Section 11 completes the group-theoretic deduction.

== 2 Cartan models and the canonical height <sec:models>

Throughout this section, $G$ is a connected, simply connected, real-triangulable, unimodular Lie group, with Lie algebra $frak(g)$. We fix left invariant Riemannian metrics on every group under consideration. The notation $\| x \|_J$ denotes distance from the identity in the intrinsic metric of $J$. We construct nilpotent groups $N \, D$ whose multiplication maps onto $G$, identify their height coordinates with the canonical quotient of Definition 3, and establish the polynomial coordinate estimates needed to retain the nonsemisimple parts of the adjoint action.

The fixed metrics are complete. Indeed, choose a relatively compact identity neighborhood containing a metric ball of positive radius. A Cauchy sequence eventually lies in one left translate of that ball, hence in a compact set; a convergent subsequence then forces the whole sequence to converge. By the Hopf–Rinow theorem, closed bounded sets are compact and any two points can be joined by a minimizing geodesic.

=== 2.1 The Cartan decomposition and its multiplication map <the-cartan-decomposition-and-its-multiplication-map>

A Cartan subalgebra of a solvable Lie algebra is a nilpotent, self-normalizing subalgebra. Choose one, denoted by $frak(d)$. For a real character $gamma : frak(d) arrow.r bb(R)$, its generalized weight space in $frak(g)$ is

$ frak(g)_gamma = { u in frak(g) : \( "ad" \( v \) - gamma \( v \) "id" \)^(dim frak(g)) u = 0 upright(" for every ") v in frak(d) } . $

Only characters with a nonzero space are called weights. The exponent in this definition can be replaced by any sufficiently large fixed integer. In particular, this definition allows a nilpotent part on each weight space and does not require $frak(d)$ to be abelian.

#thm([Lemma 2.1.])[
  (Cartan model).  #emph[There is a real generalized weight decomposition 
#[#set math.equation(numbering: n => "(2.1)")
 $ frak(g) = xor.big_gamma frak(g)_gamma \, #h(2em) frak(g)_0 = frak(d) \, #h(2em) \[ frak(g)_gamma \, frak(g)_eta \] subset.eq frak(g)_(gamma + eta) . $ <eq:cartan-weight-decomposition>]

 Let $frak(n)$ be the subalgebra generated by the spaces with nonzero weight. Then $frak(n)$ is a nilpotent ideal contained in $\[ frak(g) \, frak(g) \]$, and $frak(g) = frak(n) + frak(d)$. There are homogeneous generators $X_1 \, dots.h \, X_nu$ of $frak(n)$ whose images form a basis of $frak(n) \/ \[ frak(n) \, frak(n) \]$ and whose weights $alpha_1 \, dots.h \, alpha_nu$ are all nonzero.]
  #emph[The groups $N = exp_G \( frak(n) \)$ and $D = exp_G \( frak(d) \)$ are closed and simply connected, and $N$ is normal in $G$. With the conjugation action of $D$ on $N$, multiplication defines a surjective Lie homomorphism and submersion 
#[#set math.equation(numbering: n => "(2.2)")
 $ q : N times.r D arrow.r G \, #h(2em) q \( n \, d \) = n d . $ <eq:cartan-multiplication>]

 Its kernel is 
#[#set math.equation(numbering: n => "(2.3)")
 $ ker q = { \( a^(- 1) \, a \) : a in N ∩ D } . $ <eq:cartan-overlap-kernel>]

 Moreover, $N ∩ D = exp_G \( frak(n) ∩ frak(d) \)$. Every compact subset of $G$ has lifts in a compact subset of $N times.r D$. Finally, $N = 1$ if and only if $G$ is nilpotent.]
] <lem:cartan-model>

#proof[
  We give the decomposition argument to specify precisely which parts of the Cartan action may be nonsemisimple; see also #cite(label("CornulierTessera2017")) Section 4.D for the Cartan grading. For $v \, u in frak(d)$, nilpotence of $frak(d)$ gives
  $ \( "ad"_("End" \( frak(g) \)) \( "ad" v \) \)^b \( "ad" u \) = "ad" \( \( "ad" v \)^b u \) = 0 $
  for sufficiently large $b$. Consequently $"ad" u$ preserves every generalized eigenspace of $"ad" v$. Indeed, between two primary blocks with distinct eigenvalues, the commutator with $"ad" v$ is invertible, so an operator killed by a power of that commutator has no such block. All eigenvalues are real by real triangulability. Successively taking the primary decompositions for a basis of $frak(d)$ therefore gives simultaneous invariant primary spaces. On each such space all diagonal entries of a triangular representation agree on that basis, and hence agree as linear forms on $frak(d)$. Their common form $gamma$ is a character, since diagonals of commutators vanish. This proves the direct sum decomposition into the spaces in (2.1).
  The derivation identity shows that weights add under brackets: applying $"ad" v - \( gamma \( v \) + eta \( v \) \) "id"$ repeatedly to $\[ x \, y \]$, with $x in frak(g)_gamma$ and $y in frak(g)_eta$, gives a binomial sum involving powers of $"ad" v - gamma \( v \) "id"$ on $x$ and of $"ad" v - eta \( v \) "id"$ on $y$. Every summand vanishes at a sufficiently large power. Nilpotence of $frak(d)$ gives $frak(d) subset.eq frak(g)_0$. If this inclusion were strict, the induced action of $frak(d)$ on $frak(g)_0 \/ frak(d)$ would consist of nilpotent operators. Engel’s theorem would give a nonzero fixed class. Any representative of that class normalizes $frak(d)$, contrary to self-normalization. Thus $frak(g)_0 = frak(d)$.
  The nonzero weight spaces are $frak(d)$-invariant. Their generated subalgebra $frak(n)$ is therefore $frak(d)$-invariant, and $frak(g) = frak(n) + frak(d)$ makes it an ideal. If $gamma eq.not 0$, choose $v in frak(d)$ with $gamma \( v \) eq.not 0$. The restriction of $"ad" v$ to $frak(g)_gamma$ is invertible, so $frak(g)_gamma subset.eq \[ frak(g) \, frak(g) \]$. In a simultaneous real triangularization of $"ad" \( frak(g) \)$, every element of $"ad" \( \[ frak(g) \, frak(g) \] \)$ is strictly upper triangular. Engel’s theorem applied to the derived algebra proves its nilpotence, and hence that of $frak(n)$.
  The images of the generating nonzero weight spaces span $frak(n) \/ \[ frak(n) \, frak(n) \]$, and its induced weight decomposition has no zero summand. Choose a homogeneous basis of this quotient and homogeneous lifts $X_i$. These lifts generate $frak(n)$: if $frak(h)$ is their generated subalgebra and $frak(n)^j$ denotes the lower central series, then $frak(n) = frak(h) + frak(n)^2$. Induction, using brackets, gives $frak(n) = frak(h) + frak(n)^j$ for every $j$, and nilpotence concludes the argument.
  We now pass from Lie algebras to groups. Dixmier’s real-root criterion implies that $exp_G : frak(g) arrow.r G$ is an analytic diffeomorphism #cite(label("Dixmier1957")) Theorem 3. The inclusion of either nilpotent subalgebra integrates from its simply connected Baker–Campbell–Hausdorff group, and this homomorphism is the restriction of $exp_G$ in exponential coordinates. It is injective, with closed image, because $exp_G$ is a diffeomorphism and each subalgebra is a closed vector subspace. Injectivity of $exp_G$ also gives the stated description of $N ∩ D$. This proves the claims about $N \, D$, including normality of $N$.
  The group law in the domain of $q$ is
  $ \( n \, d \) \( n' \, d' \) = \( n \( d n' d^(- 1) \) \, d d' \) \, $
  which verifies the homomorphism assertion. Its derivative at the identity is $\( x \, v \) mapsto x + v$, which is onto. Its image is therefore an open subgroup of the connected group $G$, so it is all of $G$; translation also makes $q$ a submersion everywhere. The kernel formula follows directly from $n d = 1$. Local smooth sections of a submersion, restricted to relatively compact neighborhoods, give compact sets of lifts; a finite cover proves the claim for an arbitrary compact set.
  If $frak(n) = 0$, then $frak(g) = frak(d)$ is nilpotent. Conversely, in a nilpotent $frak(g)$ all adjoint operators are nilpotent. The decomposition just proved then has only weight zero, so $frak(g) = frak(d)$ and $frak(n) = 0$. ◻
]

The map $q$ will let us estimate paths using a nilpotent $D$ coordinate. Its kernel in (2.3) is retained throughout; the argument does not require a complementary subgroup to $N$. To control conjugation by a $D$ element of intrinsic length $O \( r \)$, we need polynomial bounds on its logarithmic coordinates. We establish those bounds next, together with the rescaling of $D$ used for large charts.

=== 2.2 Intrinsic coordinates and the graded Cartan limit <intrinsic-coordinates-and-the-graded-cartan-limit>

Write $frak(d)^1 = frak(d)$ and $frak(d)^(j + 1) = \[ frak(d) \, frak(d)^j \]$ for the lower central series. Choose vector subspaces $V_j$ such that

#[#set math.equation(numbering: n => "(2.4)")
 $ frak(d) = V_1 xor dots.h.c xor V_s \, #h(2em) frak(d)^j = V_j xor dots.h.c xor V_s . $ <eq:d-filtration-splitting>]

Thus $V_1$ represents $V = frak(d) \/ \[ frak(d) \, frak(d) \]$. Fix Euclidean norms on these spaces. Define $delta_r \( sum_j v_j \) = sum_j r^j v_j$ for $r > 0$. The associated graded bracket on the same vector space is given, for $v_i in V_i$ and $v_j in V_j$, by

$ \[ v_i \, v_j \]_oo = "pr"_(i + j) \[ v_i \, v_j \] . $

Here $"pr"_k = 0$ for $k > s$. Let $D_oo$ be its simply connected nilpotent group and set

#[#set math.equation(numbering: n => "(2.5)")
 $ Delta_r \( exp_oo v \) = exp_D \( delta_r v \) . $ <eq:d-delta-definition>]

When $D = 1$, take $s = 1$ and $V_1 = 0$; the assertions below are immediate.

These weighted coordinates and graded limits belong to the classical large-scale geometry of nilpotent groups; see #cite(label("Guivarch1973")) #cite(label("Pansu1983")). The maps $Delta_r$ will let us place growing $D$-charts on the fixed domain $D_oo$. We give the finite Baker–Campbell–Hausdorff estimates needed here.

#thm([Lemma 2.2.])[
  (Nilpotent coordinates and scaling).  #emph[There is a constant $C gt.eq 1$, depending only on $D$, the metric, and the splitting, such that for $d = exp_D \( sum_j v_j \)$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ parallel v_j parallel & lt.eq C \( 1 + \| d \|_D \)^j quad \( 1 lt.eq j lt.eq s \) \,\
\| d \|_D & lt.eq C (1 + max_(1 lt.eq j lt.eq s) parallel v_j parallel^(1 \/ j)) . $ <eq:d-coordinate-upper>]

 The group laws transported from $D$ by $Delta_r$ converge, with all derivatives on compact coordinate sets, to the law of $D_oo$ as $r arrow.r oo$. Every compact $K subset D_oo$ satisfies $sup_(z in K) \| Delta_r z \|_D = O_K \( r \)$ for $r gt.eq 1$. Conversely, for every fixed $C_0$, all $Delta_r^(- 1) { d : \| d \|_D lt.eq C_0 r }$, $r gt.eq 1$, lie in one compact coordinate set. If $z_r \, z'_r$ belong to a fixed compact coordinate set and their coordinate difference tends to zero, then 
#[#set math.equation(numbering: n => "(2.7)")
 $ "dist"_D \( Delta_r z_r \, Delta_r z'_r \) = o \( r \) . $ <eq:d-scaling-equicontinuity>]

 For $v in V_1$ one also has 
#[#set math.equation(numbering: n => "(2.8)")
 $ Delta_r^(- 1) #scale(x: 120%, y: 120%)[\(] Delta_r z exp_D \( r t v \) #scale(x: 120%, y: 120%)[\)] arrow.r z exp_oo \( t v \) \, $ <eq:d-horizontal-flow-limit>]

 uniformly when $z \, t \, v$ range over fixed compact sets. Haar measures on $D$ and $D_oo$ are Lebesgue measure in these exponential coordinates, up to fixed scalars. If both scalars are chosen equal and $Q = sum_j j dim V_j$, then $Delta_r$ multiplies Haar volume by $r^Q$, and 
#[#set math.equation(numbering: n => "(2.9)")
 $ c t^Q lt.eq "vol"_D { d : \| d \|_D lt.eq t } lt.eq C t^Q #h(2em) \( t gt.eq 1 \) $ <eq:d-polynomial-volume>]

 for some $c > 0$. In particular $D$ has doubling Haar measure: 
#[#set math.equation(numbering: n => "(2.10)")
 $ "vol"_D B_D \( 1 \, 2 t \) lt.eq C "vol"_D B_D \( 1 \, t \) #h(2em) \( t > 0 \) . $ <eq:nilpotent-doubling>]

 Every conclusion of this lemma holds for an arbitrary connected, simply connected nilpotent Lie group $L$ equipped with a left invariant Riemannian metric and a splitting of its lower central filtration, with $L$ in place of $D$ and constants allowed to depend on $L$.]
] <lem:d-scaling>

#proof[
  We first bound the coordinates of a short path. For the reverse estimate, we construct uniformly bounded products of degree-one exponentials in the rescaled groups. The remaining assertions follow from these coordinates and the Haar Jacobian.
  A path of length at most $t$ splits its endpoint into a product of at most $C \( 1 + t \)$ increments from a fixed compact neighborhood. Their logarithms lie in a fixed bounded set. In a product of $a$ exponentials, the degree-$b$ part of its formal logarithm has a sum of absolute coefficients at most $C_b \( 1 + a \)^b$. To see the bound, expand the product of formal exponentials through degree $s$ in the noncommuting variables, and then use the finite expansion of $log \( 1 + u \)$ in those degrees. The degree-$b$ coefficient sum of the product is at most $a^b \/ b !$; the finitely many compositions of $b$ appearing in the logarithm give the asserted bound. Applying the degree-$b$ Dynkin projection, which sends an associative monomial to its iterated bracket and acts by multiplication by $b$ on homogeneous Lie polynomials, converts this expansion to brackets with only a degree-dependent coefficient bound. A bracket involving more than $j$ increments belongs to $frak(d)^(j + 1)$ and has zero $V_j$ projection. Evaluating the remaining finitely many types of brackets on the bounded logarithms therefore bounds this projection by $C_j \( 1 + a \)^j$. This proves (2.6).
  For the converse, we first record the limit of the transported laws. The inclusion $\[ V_i \, V_j \] subset.eq xor.big_(k gt.eq i + j) V_k$ shows that the coefficient of a bracket from $V_i times V_j$ into $V_k$, when transported by $delta_r$, is multiplied by $r^(i + j - k)$. For $r gt.eq 1$ these coefficients are bounded and converge to the associated graded bracket. The finite Baker–Campbell–Hausdorff formula proves convergence of the group laws and all their derivatives on compact sets. Denote the transported group by $D_r$; its underlying exponential coordinate space is the fixed vector space $xor.big_j V_j$.
  We now produce uniformly bounded products of degree-one exponentials covering a fixed coordinate neighborhood. Choose a basis $e_1 \, dots.h \, e_a$ of $V_1$. These vectors generate the graded Lie algebra: by the definition of the lower central series, the quotient $frak(d)^j \/ frak(d)^(j + 1)$ is spanned by brackets of length $j$ of classes in $frak(d) \/ frak(d)^2$. In $D_oo$, let $H$ consist of all finite products of $exp_oo \( t e_i \)$ and put
  $ L = "span" { "Ad"_h e_i : h in H \, med 1 lt.eq i lt.eq a } . $
  This space contains the $e_i$ and is invariant under every $"Ad"_(exp_oo \( t e_i \))$. Differentiation makes it invariant under $"ad" e_i$, so it contains all their brackets and equals the entire graded Lie algebra. Choose $b = dim D$ such conjugated vectors $"Ad"_(h_ell) e_(i_ell)$ forming a basis, where each $h_ell$ is a fixed finite product of degree-one exponentials. The map
  $ Phi_oo \( t_1 \, dots.h \, t_b \) = product_(ell = 1)^b h_ell exp_oo \( t_ell e_(i_ell) \) h_ell^(- 1) $
  is the identity at $t = 0$ and has these basis vectors as its derivative columns there.
  Use the same fixed words for $h_ell$ in $D_r$ to define $Phi_r$. The maps $Phi_r$ converge with their derivatives to $Phi_oo$ on compact parameter sets. The inverse function theorem therefore supplies a fixed parameter ball and a fixed coordinate neighborhood $U$ of the identity contained in their images for all sufficiently large $r$. More explicitly, choose a parameter ball on which the derivative of $Phi_oo$ differs by less than one quarter of the smallest singular value of $D Phi_oo \( 0 \)$ from that derivative; the corresponding estimate with one half holds for $Phi_r$. The usual contraction proof of the inverse function theorem then gives one common image ball. Every element of $U$ is thus a product of a fixed number of $exp_r \( c e_i \)$, with all $\| c \|$ bounded by one constant. The conjugators here are themselves fixed words in these exponentials.
  A fixed number of powers of $U$ covers the coordinate box ${ sum_j v_j : parallel v_j parallel lt.eq 1 }$, uniformly in $r$: choose an integer $M$ large enough that every vector $v$ in this box satisfies $v \/ M in U$, and use $exp_r \( v \) = \( exp_r \( v \/ M \) \)^M$. Under $Delta_r$, each degree-one factor becomes $exp_D \( r c e_i \)$, whose intrinsic length is at most $r \| c \| parallel e_i parallel_D$, where the last norm is the Riemannian norm at the identity. The resulting products have length at most $C r$. Enlarging $C$ handles the remaining compact interval of $r gt.eq 1$. Given arbitrary $v_j$, apply this bound with $r = max \( 1 \, max_j parallel v_j parallel^(1 \/ j) \)$ to obtain (2.6).
  For the equicontinuity assertion, the logarithm of the difference of $z_r$ and $z'_r$ in the transported law is a vector $xi_r = sum_j xi_(r \, j)$ tending to zero. The logarithm of the corresponding difference in $D$ is $delta_r xi_r$. Thus (2.6) gives
  $ frac("dist"_D \( Delta_r z_r \, Delta_r z'_r \), r) lt.eq C / r + C max_j parallel xi_(r \, j) parallel^(1 \/ j) arrow.r 0 . $
  The compact length bound follows from the same coordinate estimate. The converse compactness assertion follows from (2.6) after dividing the $V_j$ coordinate by $r^j$. Equation (2.8) follows directly from convergence of the transported product, since $delta_r \( t v \) = r t v$ on $V_1$.
  Finally, the differential of the exponential map, after left translation to the identity, is a polynomial in $"ad" v$ with constant term $"id"$. Since $"ad" v$ is nilpotent, this polynomial has determinant one. This proves the claims about Haar measure on both nilpotent groups. The linear coordinate map $delta_r$ has determinant $r^Q$. The coordinate bounds (2.6) place a radius-$t$ ball in a product of Euclidean balls with radii $C \( 1 + t \)^j$, proving the upper volume bound. Conversely, (2.6) puts the coordinate box ${ sum_j v_j : parallel v_j parallel lt.eq \( t \/ \( 2 C \) \)^j }$ inside the radius-$t$ ball when $t gt.eq 2 C$. This box has volume a fixed positive constant times $t^Q$. Decreasing that constant handles $1 lt.eq t lt.eq 2 C$, and proves (2.9). These two bounds give doubling for $t gt.eq 1$. At sufficiently small radii a smooth coordinate chart and the Riemannian metric give volume comparable to $t^(dim D)$; the remaining compact interval of radii is handled by monotonicity and positivity of ball volume. This proves (2.10). The proof used only simple connectivity and nilpotence, so it applies without change to the group $L$ in the last assertion. ◻
]

=== 2.3 Canonical height and the adjoint action <canonical-height-and-the-adjoint-action>

We now identify the canonical quotient $W$ in terms of the Cartan weights. This also distinguishes the exact scalar action of height from actual conjugation by $D$: the latter may have a unipotent factor, which the preceding coordinate estimate will bound polynomially in intrinsic length. Choose a simultaneous real triangularization of $"ad" \( frak(g) \)$, and let $chi_1 \, dots.h \, chi_b$ be its diagonal characters, including repetitions and zero characters. Thus

$ frak(k) = ⋂_(j = 1)^b ker chi_j \, #h(2em) W = frak(g) \/ frak(k) . $

These are the adjoint characters, rather than all real homomorphisms on $frak(g)$. Their multiset is independent of the triangularization, as the multiset of composition factors of the adjoint representation. Every $chi_j$ vanishes on $\[ frak(g) \, frak(g) \]$, so the quotient is abelian. Write $pi_(*) : frak(g) arrow.r W$ for the quotient and $pi : G arrow.r W$ for its integrated homomorphism. As usual, we also write $pi$ for induced linear maps when their domain is clear.

#thm([Lemma 2.3.])[
  (Canonical height and volume-preserving actions).  #emph[Each generator weight $alpha_i$ vanishes on $\[ frak(d) \, frak(d) \] + \( frak(d) ∩ frak(n) \)$, and inclusion of $frak(d)$ into $frak(g)$ induces an isomorphism 
#[#set math.equation(numbering: n => "(2.11)")
 $ W tilde.equiv V #scale(x: 180%, y: 180%)[\/] ⋂_(i = 1)^nu ker alpha_i \, #h(2em) V = frak(d) \/ \[ frak(d) \, frak(d) \] . $ <eq:canonical-cartan-height>]

 Under this identification, $pi$ kills $N$ and its restriction to $D$ is the displayed quotient of its abelianization. When $nu = 0$, the intersection on the right is all of $V$, and $W = 0$; this occurs exactly when $G$ is nilpotent.]
  #emph[Write $frak(n)_gamma = frak(n) ∩ frak(g)_gamma$ and view every weight occurring in $frak(n)$ as a linear form on $W$. For fixed norms, there are constants $C \, M$ such that, for every $d in D$ and every such weight $gamma$, 
#[#set math.equation(numbering: n => "(2.12)")
 $ "Ad"_d \|_(frak(n)_gamma) = e^(gamma \( pi d \)) U_gamma \( d \) \, #h(2em) parallel U_gamma \( d \) parallel + parallel U_gamma \( d \)^(- 1) parallel lt.eq C \( 1 + \| d \|_D \)^M \, $ <eq:d-polynomial-unipotent>]

 where $U_gamma \( d \)$ is unipotent. For $w in W$, the linear map 
#[#set math.equation(numbering: n => "(2.13)")
 $ S_w \|_(frak(n)_gamma) = e^(gamma \( w \)) "id" $ <eq:exact-weight-dilation>]

 is a Lie algebra automorphism and hence a group automorphism of $N$. Both $S_w$ and conjugation by $d$ preserve Haar measure on $N$. Consequently product Haar measure $d n thin d d$ is Haar measure on $N times.r D$.]
  #emph[The height map on $D_oo$ is the homomorphism induced by $V_1 tilde.equiv V arrow.r W$, and it satisfies 
#[#set math.equation(numbering: n => "(2.14)")
 $ pi \( Delta_r z \) = r pi \( z \) #h(2em) \( z in D_oo \, r > 0 \) . $ <eq:d-height-scaling>]

]
] <lem:canonical-height>

#proof[
  The restrictions of the diagonal characters $chi_j$ to $frak(d)$ are exactly the generalized weights of its action on $frak(g)$, with their multiplicities. All $chi_j$ vanish on $frak(n)$ by Lemma 5. In particular every Cartan weight vanishes on $frak(d) ∩ frak(n)$, and, being a character, also on $\[ frak(d) \, frak(d) \]$.
  Homogeneous bracket words in the $X_i$ span $frak(n)$. Their weights are sums of the $alpha_i$, whereas every $alpha_i$ itself occurs. The weights on $frak(d) = frak(g)_0$ are zero. It follows that
  $ frak(k) ∩ frak(d) = ⋂_i ker alpha_i quad upright("as subspaces of ") frak(d) . $
  Since $frak(n) subset.eq frak(k)$ and $frak(g) = frak(n) + frak(d)$, inclusion gives $frak(g) \/ frak(k) tilde.equiv frak(d) \/ \( frak(k) ∩ frak(d) \)$, and passing through $V$ proves (2.11). It also shows that every weight of $frak(n)$ descends to $W$. The statements about the integrated maps follow from simple connectivity. If $nu = 0$, Lemma 5 gives nilpotence and $W = 0$. Conversely, if $W = 0$, all adjoint characters vanish, so every adjoint operator is strictly triangular and Engel’s theorem makes $G$ nilpotent.
  For $d = exp_D \( v \)$ and $b_gamma = dim frak(n)_gamma$, write
  $ "ad" \( v \) \|_(frak(n)_gamma) = gamma \( pi_(*) v \) "id" + T_gamma \( v \) \, #h(2em) T_gamma \( v \)^(b_gamma) = 0 . $
  The map $v mapsto T_gamma \( v \)$ is linear, and exponentiation gives
  $ U_gamma \( d \) = sum_(j = 0)^(b_gamma - 1) frac(T_gamma \( v \)^j, j !) . $
  Replacing $v$ by $- v$ gives its inverse. By (2.6), $parallel v parallel$ is bounded by a polynomial in $1 + \| d \|_D$. The two finite sums therefore prove (2.12), uniformly over the finitely many weight spaces, including the zero weight when it occurs.
  For $v in frak(d)$, the action of $"ad" v$ on $frak(g) \/ frak(n) tilde.equiv frak(d) \/ \( frak(d) ∩ frak(n) \)$ is nilpotent. Unimodularity of $G$ consequently gives
  #[#set math.equation(numbering: n => "(2.15)")
   $ "tr" \( "ad" v \|_(frak(n)) \) = "tr" \( "ad" v \|_(frak(g)) \) - "tr" \( "ad" v \|_(frak(g) \/ frak(n)) \) = 0 . $ <eq:trace-on-n-zero>]
  Thus $det \( "Ad"_d \|_(frak(n)) \) = 1$. Bracket addition in (2.1) proves that $S_w$ preserves brackets. Choosing $v in frak(d)$ over $w$ in (2.15) also gives
  $ det S_w = exp (sum_gamma \( dim frak(n)_gamma \) gamma \( w \)) = 1 . $
  An automorphism of a simply connected nilpotent group changes Haar measure by its Lie algebra determinant, so both asserted actions preserve Haar measure. As $N$ and $D$ are unimodular and the action preserves Haar measure on $N$, direct substitution in the semidirect product law proves that $d n thin d d$ is left Haar measure on $N times.r D$.
  Finally, $pi_(*)$ annihilates $frak(d)^2$, so in the splitting (2.4) it depends only on $V_1$. The same projection is a homomorphism on the associated graded group. Equation (2.14) now follows from $delta_r \|_(V_1) = r "id"$. ◻
]

The construction supplies the canonical height using any chosen Cartan subalgebra. It also separates the exponential factors $e^(gamma \( pi d \))$ from polynomial factors in the intrinsic $D$ length. The weighted boxes developed next will keep these polynomial factors while recording exponential volume precisely.

== 3 Weighted boxes and path packing <sec:boxes>

We now count endpoints separated by a fixed positive distance that can be reached from one starting point by paths of length $O \( r \)$ with a prescribed height range. Fix a nonempty compact convex set $E subset W$ and a scale $r gt.eq 1$. At heights in $r E$, a generator of weight $alpha_i$ can be used with amplitude of order $exp \( r max_E alpha_i \)$. The boxes below record the volume generated by these displacements. They will give matching exponential bounds: many separated endpoints can be reached while staying within sublinear distance of $r E$, and no such path family confined to those heights can have more separated endpoints at the exponential scale. Comparing these bounds for a quasi-isometry will constrain how it changes height ranges.

The nilpotent group $N$ need not be abelian, and a bracket of nonzero weight vectors may have weight zero. We therefore retain every bracket direction. The estimates also retain the kernel of $q : N times.r D arrow.r G$.

Throughout this section $N eq.not { 1 }$. Use the homogeneous generators $X_1 \, dots.h \, X_nu$ and their nonzero weights $alpha_1 \, dots.h \, alpha_nu$ from Lemma 5. Let $m$ be the nilpotence class of $frak(n)$, and let $cal(Z)$ be the finite list of all nonzero bracket words of lengths at most $m$ in these generators. Repeated or proportional vectors are allowed as different entries of the list. Each word $Z$ has weight $gamma_Z$, the sum of its letter weights with multiplicity. The list spans $frak(n)$.

=== 3.1 Support exponents and normalized boxes <support-exponents-and-normalized-boxes>

For a nonempty compact set $E subset W$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ s_i \( E \) = max_(w in E) alpha_i \( w \) \, #h(2em) h_Z \( E \) = sum_(X_i upright(" occurring in ") Z) s_i \( E \) \, #h(2em) P \( E \) = max_(cal(B)) sum_(Z in cal(B)) h_Z \( E \) \, $ <eq:support-exponents>]

where occurrences are counted with multiplicity and $cal(B)$ runs over the bases selected from $cal(Z)$. The letters in a product may be applied at different support positions. Their available amplitudes therefore contribute the sum of the separate maxima $h_Z \( E \)$, which can exceed $max_E gamma_Z$. Fix an ordering of these finitely many bases and choose the first maximizer whenever a choice is needed. For $r gt.eq 0$ and $L > 0$, put

#[#set math.equation(numbering: n => "(3.2)")
 $ B_r \( E \, L \) = {exp_N (sum_(Z in cal(B)) t_Z e^(r h_Z \( E \)) Z) : \| t_Z \| lt.eq L} \, #h(2em) B_r \( E \) = B_r \( E \, 1 \) . $ <eq:weighted-box-definition>]

For example, let $frak(n)$ be the Heisenberg algebra with basis $X \, Y \, Z$ and bracket $\[ X \, Y \] = Z$, and let a derivation $T$ act by $\[ T \, X \] = X$, $\[ T \, Y \] = - Y$, and $\[ T \, Z \] = 0$. Take the simply connected group with Lie algebra $frak(n) times.r bb(R) T$. Here $W = bb(R)$, with $pi \( T \) = 1$. With generators $X \, Y$ and $E = \[ a \, b \]$, where $a lt.eq b$,

$ s_X \( E \) = b \, #h(2em) s_Y \( E \) = - a \, #h(2em) h_Z \( E \) = b - a \, #h(2em) P \( E \) = 2 \( b - a \) . $

Thus the zero-weight direction $Z$ has width $e^(r \( b - a \))$ in the box: its width comes from the two supporting heights, although $gamma_Z = 0$. This example also exhibits the Cartan overlap: we may take $frak(d) = "span" \( T \, Z \)$, so $N ∩ D = exp \( bb(R) Z \)$.

The next lemma controls the dependence on the maximizing basis choice. A coordinate bound always refers to the displayed scaled basis, rather than to an unscaled Euclidean ball.

#thm([Lemma 3.1.])[
  (Box calculus).  #emph[There are constants depending only on the fixed Lie model with the following properties, uniformly for $r gt.eq 0$ and nonempty compact $E$.]
  + #emph[The unit cube in a maximizing scaled basis and the Minkowski sum of the intervals $\[ - e^(r h_Z \( E \)) Z \, e^(r h_Z \( E \)) Z \]$, $Z in cal(Z)$, contain constant multiples of one another. Different maximizing bases therefore give boxes comparable by fixed changes of $L$.]
  + #emph[In these coordinates all Lie bracket coefficients are bounded uniformly. Multiplication and inversion in exponential coordinates are polynomials of uniformly bounded degree and coefficients. For some $C \, b$, a product of $k gt.eq 1$ elements of $B_r \( E \, L \)$ lies in 
$ B_r \( E \, C \( 1 + k \)^b \( 1 + L \)^b \) . $

]
  + #emph[Writing $d_N = dim N$, Haar measure satisfies 
#[#set math.equation(numbering: n => "(3.3)")
 $ "vol"_N B_r \( E \, L \) asymp L^(d_N) e^(r P \( E \)) . $ <eq:box-volume>]

]
  + #emph[Exact weight dilations shift the template: $S_(r w) B_r \( E \, L \)$ is comparable, with fixed radius factors, to $B_r \( E + w \, L \)$. For each fixed $C_0$ there are $C \, b$ such that, for $r gt.eq 1$ and $\| d \|_D lt.eq C_0 r$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ "Ad"_d B_r \( E \, L \) subset.eq B_r (E + frac(pi d, r) \, C \( 1 + r \)^b \( 1 + L \)^b) . $ <eq:box-conjugation>]

 The same assertion applies to $d^(- 1)$.]
] <lem:box-calculus>

#proof[
  Write a word $Y in cal(Z)$ in a maximizing basis as $Y = sum_(Z in cal(B)) c_(Y \, Z) Z$. Whenever $c_(Y \, Z) eq.not 0$, replacing $Z$ by $Y$ gives another basis. Maximality gives $h_Y \( E \) lt.eq h_Z \( E \)$. Thus
  #[#set math.equation(numbering: n => "(3.5)")
   $ e^(r h_Y \( E \)) Y = sum_(Z in cal(B)) c_(Y \, Z) e^(r \( h_Y \( E \) - h_Z \( E \) \)) #scale(x: 120%, y: 120%)[\(] e^(r h_Z \( E \)) Z #scale(x: 120%, y: 120%)[\)] $ <eq:basis-exchange-coefficients>]
  has uniformly bounded coefficients. There are only finitely many unscaled bases and words, so their coefficients admit a common bound. The reverse inclusion follows because the basis words belong to the list. This proves the first assertion.
  The bracket of two basis words is either zero or a word of the list, with exponent equal to the sum of their exponents. Formula (3.5) therefore bounds every normalized structure constant. The Baker–Campbell–Hausdorff formula terminates at degree $m$, which proves the assertion for a fixed number of factors. To control $k$ factors, expand the formal product of their exponentials and then its logarithm, retaining only degrees at most $m$. In degree $j$ there are at most $C_m \( 1 + k \)^j$ choices of factor indices, and each term contains at most $j$ input coordinates. Converting these finitely many homogeneous Lie polynomials into brackets costs constants depending only on $m$. The asserted polynomial bound in $k \, L$ follows from the bounded normalized structure constants.
  Haar measure of a simply connected nilpotent group in exponential coordinates is a fixed multiple of Lebesgue measure. Indeed the Jacobian factor of the exponential map is $det \( \( 1 - e^(- "ad" v) \) \/ "ad" v \) = 1$, interpreted by its finite power series, since $"ad" v$ is nilpotent. The determinant of the scaled basis is its unscaled determinant times $e^(r P \( E \))$. The finitely many unscaled determinants are bounded above and away from zero. This proves (3.3).
  For an exact weight dilation, $h_Z \( E + w \) = h_Z \( E \) + gamma_Z \( w \)$. Every basis has total weight zero: it is a weight-homogeneous basis of $frak(n)$, and the total weight is the trace character, which vanishes by Lemma 7. Hence maximizing bases remain maximizing after a translation of $E$, and the claimed shift follows.
  For conjugation, first remove the scalar action on each weight space. Lemma 7 bounds the remaining operator and its inverse polynomially in $1 + \| d \|_D$. Words of weight $alpha_i$ span the weight space containing $X_i$, and each such word satisfies
  #[#set math.equation(numbering: n => "(3.6)")
   $ h_Z \( E \) = sum_(X_j upright(" in ") Z) max_E alpha_j gt.eq max_E sum_(X_j upright(" in ") Z) alpha_j = s_i \( E \) . $ <eq:weight-width-domination>]
  Consequently the residual action on a scaled letter is a polynomially bounded combination of scaled words. Applying brackets and using the already established structure-constant bounds proves the same assertion for every scaled word. Restoring the character action is the exact shift by $pi d \/ r$. This gives (3.4); replacing $d$ by $d^(- 1)$ proves its inverse version. ◻
]

Fix Euclidean norms on all the finite-dimensional spaces used below. For sequences $r arrow.r oo$, a containment in $B_r \( E \, e^(o \( r \)) \)$ means that there is one sequence $eta_r arrow.r 0$ for which all the points under consideration lie in $B_r \( E \, e^(eta_r r) \)$. For a finite construction there is one common such envelope for all its elements. This convention makes no assertion uniform over all possible vanishing sequences. The box calculus shows that a fixed or polynomial number of products preserves such a bound. Changes of $E$ by Hausdorff distance $o \( 1 \)$ are also absorbed: each $h_Z$ is Lipschitz in that distance, and the all-word description compares the possibly different maximizing bases.

#thm([Lemma 3.2.])[
  (Support symmetries).  #emph[The function $P$ is translation invariant, depends only on the convex hull, and is Lipschitz for Hausdorff distance. The function 
$ p \( w \) = P \( \[ 0 \, w \] \) $

 is a polyhedral norm on $W$. The group 
#[#set math.equation(numbering: n => "(3.7)")
 $ cal(A) = { A in "GL" \( W \) : P \( A E \) = P \( E \) upright(" for every nonempty
 compact convex ") E subset W } $ <eq:support-symmetry-group>]

 is finite. Its pullback action permutes the oriented rays of the generator weights $alpha_i$.]
] <lem:support-symmetries>

When recording the dependence on the model in Theorem 4, we write $cal(A)_G = cal(A)$ for this same group.

#proof[
  Every basis from $cal(Z)$ contains all the letters $X_i$: all longer words vanish in $frak(n) \/ \[ frak(n) \, frak(n) \]$, and the letters project to its specified basis. As observed above, the sum of the word weights of any such basis is zero. Expanding this identity in letters gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ sum_i c_i alpha_i = 0 \, #h(2em) c_i upright(" positive integers") . $ <eq:positive-weight-relation>]
  The total exponent of a basis is unchanged by translating $E$, which proves translation invariance. The other two assertions about $P$ follow from the corresponding properties of support functions and the finiteness of the list.
  For a segment $\[ 0 \, w \]$, each support is $max \( 0 \, alpha_i \( w \) \)$. These expressions give positive homogeneity, piecewise linearity, and the triangle inequality for $p$, the last by taking the maximum of the basis sums after applying subadditivity term by term. Translation invariance gives $p \( - w \) = p \( w \)$. If $w eq.not 0$, the weights span $W^(*)$, and (3.8) implies that some $alpha_i \( w \) > 0$. All word exponents on the segment are nonnegative, and the mandatory letter $X_i$ makes every basis sum positive. Thus $p$ is a norm.
  Every member of $cal(A)$ is a linear isometry of this norm. Its unit ball is a full-dimensional bounded polytope, so its linear isometry group injects into the permutation group of its finitely many vertices. In particular $cal(A)$ is finite.
  Suppose $A in cal(A)$ and $A^(*) alpha_j$ is not on one of the original oriented rays. From a Euclidean ball $K$ centered at zero, remove a sufficiently small cap at the support point of $A^(*) alpha_j$. The resulting compact convex set $E$ has the same supports in all original directions $alpha_i$, but a strictly smaller support in direction $A^(*) alpha_j$. Its supports in every other direction can only decrease. Since each candidate basis sum for $P \( A E \)$ contains the letter $j$, all these finitely many sums decrease strictly. Thus $P \( A E \) < P \( A K \) = P \( K \) = P \( E \)$, contrary to $A in cal(A)$. Pullback therefore maps the finite set of rays into itself; applying the same argument to $A^(- 1)$ proves that it permutes them. ◻
]

=== 3.2 Product schemes that remain nondegenerate <product-schemes-that-remain-nondegenerate>

A generator product scheme is a finite list of indices $i_1 \, dots.h \, i_k$, with endpoint map

#[#set math.equation(numbering: n => "(3.9)")
 $ \( t_1 \, dots.h \, t_k \) mapsto product_(j = 1)^k exp_N \( t_j e^(r s_(i_j) \( E \)) X_(i_j) \) . $ <eq:generator-endpoint-map>]

We use its logarithm in the maximizing scaled coordinates. This is a polynomial map. Besides generating a box, later volume arguments need a scheme whose normalized limiting map has full differential rank somewhere. These are separate conclusions of the next lemma.

#thm([Lemma 3.3.])[
  (Uniform product schemes).  #emph[For each fixed $L < oo$ there are integers and constants depending only on $L$ and the Lie model such that every element of $B_r \( E \, L \)$, for every $r gt.eq 0$ and nonempty compact $E$, is the endpoint of a scheme of at most that many factors, with all $\| t_j \|$ bounded by that constant. Choices may be made Borel measurably in the endpoint.]
  #emph[For any sequence of these normalized coordinate systems there is a subsequence and one fixed generator product scheme whose normalized polynomial maps converge, with bounded degree and coefficients, to a map submersive at an interior point of a fixed parameter cube. The parameter point may be chosen to map to the identity.]
  #emph[If $r arrow.r oo$ and the radius is $e^(o \( r \))$, generation still uses a bounded number of factors, now with amplitudes $e^(r s_i \( E \) + o \( r \))$. Finally, every element of $N$ is a product of at most a fixed number of the elements $exp \( t X_i \)$, with unrestricted real parameters.]
] <lem:product-schemes>

#proof[
  We construct a submersive scheme for each limiting normalized group. Its persistence under nearby group laws will then give uniform generation by compactness.
  Pass first to a subsequence with the same maximizing basis. The normalized structure constants are bounded by Lemma 8, so a further subsequence converges. The Jacobi identity and the nilpotence-class bound pass to the limit, and its group law is the limiting BCH polynomial. Every letter is a basis vector. More generally, the bracket word giving a basis vector satisfies the exact identity
  $ Z \( e^(r s_1 \( E \)) X_1 \, dots.h \, e^(r s_nu \( E \)) X_nu \) = e^(r h_Z \( E \)) Z . $
  Thus its normalized value is the same coordinate vector throughout the sequence and in its limit. The limiting letters therefore still bracket-generate the whole limiting algebra.
  Here is a finite endpoint scheme with full rank in this limiting group. Let $H$ be the subgroup generated by its letter one-parameter subgroups, and consider
  $ U = "span" { "Ad"_h X_i : h in H \, med 1 lt.eq i lt.eq nu } . $
  This space contains the letters and is invariant under $"Ad"_(exp \( t X_i \))$. Differentiating proves its invariance under $"ad" X_i$, so it contains all brackets and is the entire algebra. Choose $d_N$ vectors $"Ad"_(h_j) X_(i_j)$ forming a basis, with each $h_j$ a finite product of generator exponentials. The map
  #[#set math.equation(numbering: n => "(3.10)")
   $ Phi \( t \) = product_(j = 1)^(d_N) h_j exp \( t_j X_(i_j) \) h_j^(- 1) $ <eq:submersive-conjugate-scheme>]
  sends zero to the identity and has these basis vectors as its differential columns at zero. Expanding the $h_j$ and their inverses gives a generator scheme as in (3.9). At a parameter point having fixed entries for the conjugating words and zero entries for the inserted increments, its differential is surjective. Enlarge a fixed parameter cube so this point is interior.
  Use the same words and fixed parameters for the converging laws. Their endpoint maps converge with derivatives on compact parameter sets. The inverse function theorem, applied to the indicated $d_N$ variables with the others fixed, supplies one fixed identity neighborhood contained in their images for all sufficiently late indices. Its local inverse supplies continuous parameter choices. For a fixed-radius log cube choose $k$ so large that division of every log vector by $k$ lies in this neighborhood. The identity $exp \( v \) = \( exp \( v \/ k \) \)^k$ covers the cube by a fixed number of copies of the scheme.
  This proves the uniform generation assertion by contradiction: any sequence violating every proposed common length and parameter bound has a convergent normalized-law subsequence to which the preceding argument applies. Equivalently, the compact closure of the normalized laws has a finite cover by neighborhoods carrying the preceding inverse charts. There are only finitely many maximizing bases. One may pad words by identities, and concatenate the finitely many schemes, so there is no measurable choice among infinitely many alphabets. Local inverse choices on finite Borel partitions give the stated measurable endpoint choices.
  For the growing-radius assertion let $a_0 = min_i parallel alpha_i parallel > 0$. Enlarge $E$ to $E + epsilon_r overline(B)_W \( 1 \)$, where $epsilon_r = o \( 1 \)$ is large enough that $r epsilon_r a_0$ dominates the logarithm of the radius and the fixed box-comparison constants. Every word exponent increases by at least $epsilon_r a_0$. The all-word comparison then embeds the original growing box in a fixed-radius box for the enlarged template. Generation there changes each letter amplitude by only $e^(o \( r \))$.
  Finally choose one sufficiently large centered ball as template. All its word exponents are strictly positive, so its boxes exhaust $N$ as $r arrow.r oo$. The uniform number of factors just established proves the last assertion. ◻
]

The measurable choices in this lemma do not imply any assertion about the volume of their parameter sets. Whenever we apply a polynomial image-volume estimate, we will instead identify an independently sampled parameter domain, a fixed submersive limiting scheme, and the measure of the successful parameters.

=== 3.3 Short switches and controlled paths <short-switches-and-controlled-paths>

At a supporting height, an exponentially large generator displacement can be made by a short path in $G$. The next two lemmas quantify this observation and assemble such switches into paths through prescribed height sets.

#thm([Lemma 3.4.])[
  (Logarithmic distortion).  #emph[There is a constant $C$ such that 
$ \| n \|_G lt.eq C log \( 2 + parallel log_N n parallel \) #h(2em) \( n in N \) . $

 For fixed constants controlling $\| d \|_D \/ r$ and the amplitude factor, if $\| d \|_D = O \( r \)$, $\| t \| lt.eq e^(r s_i \( E \) + o \( r \))$, and $alpha_i \( pi d \) = r s_i \( E \) + o \( r \)$, then the distance between $x n d$ and $x n exp \( t X_i \) d$ is $o \( r \)$, uniformly in $x \, n$. With bounded amplitude factor and exact equality of heights, this distance is $O \( log \( 2 + r \) \)$.]
] <lem:log-distortion>

#proof[
  If $parallel log_N n parallel lt.eq e^r$, choose a fixed large centered ball $E$ whose every word exponent is at least one. The finiteness of the unscaled bases gives $n in B_r \( E \, L_0 \)$ for a fixed $L_0$. Lemma 10 writes it as a bounded product of letter factors with amplitudes at most $M e^(r s_i \( E \))$. Choose $v_i in frak(d)$ with $alpha_i \( pi v_i \) = 1$. Conjugating a letter factor back by $d_i = exp_D \( \( r s_i \( E \) + b log \( 2 + r \) \) v_i \)$ removes its exponential amplitude. For a sufficiently large fixed $b$, the extra logarithmic term also dominates the polynomial unipotent factor from Lemma 7. The conjugated-back log vector is bounded, while $\| d_i \|_G = O \( r + 1 \)$. The resulting outward, bounded, and return moves prove the first estimate, also for bounded $n$.
  By left invariance the distance for a switch is the length of $"Ad"_(d^(- 1)) exp \( t X_i \)$. Its logarithm has norm at most
  $ C \( 1 + r \)^b \| t \| e^(- alpha_i \( pi d \)) . $
  The first estimate makes this $o \( r \)$ in the stated regime and $O \( log \( 2 + r \) \)$ in the exact regime. ◻
]

Write $a_D : D arrow.r V = frak(d) \/ \[ frak(d) \, frak(d) \]$ for abelianization, so that $pi \|_D$ factors through $a_D$.

#thm([Lemma 3.5.])[
  (Paths visiting support positions).  #emph[Fix a compact convex $E_V subset V$, a point $v_0 in E_V$, a constant $L$, and pivots $d_0 in D$ satisfying $a_D \( d_0 \) = r v_0$ and $\| d_0 \|_D lt.eq C_0 r$, where $r gt.eq 1$. Every $u in B_r \( pi E_V \, L \)$ can be reached from $d_0$ at endpoint $u d_0$ by a path with the following properties:]
  + #emph[it uses a bounded number of $D$-legs and generator switches, has length at most $C r$, and all its $D$-positions have intrinsic length at most $C r$;]
  + #emph[on each $D$-leg the abelianized position lies in $r E_V$; each connecting switch has length at most $C log \( 2 + r \)$;]
  + #emph[for any fixed continuous homomorphism $l : G arrow.r W$, all path values of $l$ lie within $O_l \( log \( 2 + r \) \)$ of $r thin l \( E_V \)$, where $l$ on $V$ denotes its induced linear map.]
  #emph[Choices may be made measurably in $u$. The analogous statements with switch length $o \( r \)$ hold for a subexponential box radius. In particular, for a fixed compact convex $E subset W$ and any pivot of intrinsic length at most $C_0 r$ with $pi d_0 in r E$, the same construction reaches $u d_0$, $u in B_r \( E \, L \)$, with absolute heights in $r E + O \( log \( 2 + r \) \)$ and total length $O \( r \)$. The constants in this specialization are independent of the pivot’s other abelianized coordinates. One may also use a prescribed $D$-curve of length $O \( r \)$ and intrinsic positions $O \( r \)$ whose height image attains all the required supports, by visiting and reversing portions of that curve.]
] <lem:support-switch-paths>

#proof[
  Choose, for each letter, a support point $v_i in E_V$ for $alpha_i compose pi$. Fix a linear section $V arrow.r frak(d)$. From the pivot visit $d_i = d_0 exp_D \( r accent(v_i - v_0, ̃) \)$, along the corresponding one-parameter segment. Its abelianization traces the segment $r \[ v_0 \, v_i \] subset r E_V$, and its length is $O \( r \)$. Decompose $u$ using Lemma 10. To apply its next letter factor, move along this leg on the current $D$-chart, switch at $d_i$, and reverse the leg on the new sheet. The support equality and Lemma 11 give the claimed switch cost. After the final return the endpoint is $u d_0$.
  Every continuous homomorphism $l$ kills $N$, since its differential kills $frak(n) subset \[ frak(g) \, frak(g) \]$, and factors on $D$ through $V$. It therefore has the specified values on the legs. It is Lipschitz for the fixed metrics, so each short switch changes its values by at most its Lipschitz constant times the switch length. This proves the third assertion.
  Measurable generator choices are supplied by Lemma 10. Short connecting paths may also be chosen measurably. The Riemannian exponential map on a closed tangent ball of the asserted length radius is continuous from a compact space and covers the relevant metric ball. Such a map has a Borel section: use nested finite closed covers of successively smaller diameters and choose the first subpiece whose image contains the endpoint; all these image sets are compact, and the nested choices have one limiting point. The corresponding geodesics give the required choices. The same argument gives the subexponential version.
  For the specialization to $W$, choose an affine section of $pi : V arrow.r W$ through $a_D \( d_0 \) \/ r$ over $pi d_0 \/ r$, with one fixed linear part, and apply the construction to the image of $E$. All leg displacements depend only on differences in that affine section. Their bounds therefore do not depend on its translating kernel component; the bound on $\| d_0 \|_D \/ r$ controls the positions. For a prescribed curve, replace the displayed legs by its portions between the pivot and a support position, and reverse each portion after the switch. All estimates remain the same. ◻
]

=== 3.4 Packing after the multiplication map <packing-after-the-multiplication-map>

The upper and lower counting arguments have different sources. For upper bounds we separate chosen lifts in $N times.r D$. For lower bounds we remain on a fixed-$D$-position slice $N d$, where the parameterization by $N$ is injective. This distinction avoids imposing a splitting hypothesis on $G$.

#thm([Lemma 3.6.])[
  (Path packing).  #emph[Fix $C_0 > 0$ and a separation distance $a > 0$. There are constants $C \, b$ such that the following holds for $r gt.eq 1$. Let $E subset W$ be compact and contain zero. The endpoints of paths starting at one point $x$, of length at most $C_0 r$, and satisfying 
$ pi \( x^(- 1) gamma \( t \) \) in r E quad upright("at every point of each path") $

 have $a$-separated subsets of cardinality at most 
#[#set math.equation(numbering: n => "(3.11)")
 $ C \( 1 + r \)^b e^(r P \( E \)) . $ <eq:finite-path-packing>]

 Each endpoint has a relative lift $\( u \, d \)$ with 
$ u in B_r \( E \, C \( 1 + r \)^b \) \, #h(2em) \| d \|_D lt.eq C r . $

 These containments remain valid, after increasing $C \, b$, under fixed bounded right thickening in $N times.r D$.]
  #emph[In particular, along a sequence with relative path heights in $r \( E + o \( 1 \) \)$ and length $O \( r \)$, the upper separated count is $e^(r P \( E \) + o \( r \))$, and the lifts have $u in B_r \( E \, e^(o \( r \)) \)$, $\| d \|_D = O \( r \)$. Without a height restriction, a path of length $t$ has a relative lift with $\| d \|_D lt.eq C \( 1 + t \)$ and $parallel log_N u parallel lt.eq e^(C \( 1 + t \))$.]
] <lem:path-packing>

#proof[
  Translate the starting point to the identity and subdivide the path into at most $C \( 1 + r \)$ increments of bounded length. Lemma 5 supplies bounded lifts $\( v_j \, e_j \)$ of these increments. Their accumulated product has coordinates
  $ d_j = e_1 dots.h.c e_j \, #h(2em) u_j = product_(k = 1)^j "Ad"_(d_(k - 1)) v_k . $
  Thus $\| d_j \|_D lt.eq C \( 1 + r \)$, and $pi d_j$ is the actual height of the corresponding path vertex.
  Expand $log_N v_k$ in the fixed weight spaces. The polynomial residual action gives, in a weight $gamma$, coefficients bounded by $C \( 1 + r \)^b e^(gamma \( pi d_(k - 1) \))$. Words of that weight span its space, and $max_E gamma lt.eq h_Z \( E \)$ for every such word $Z$. Consequently each conjugated increment has normalized coordinates bounded polynomially in $r$. The product estimate in Lemma 8 gives the asserted bound for $u_j$.
  Bounded right thickening replaces $\( u \, d \)$ by $\( u "Ad"_d v \, d e \)$ with $\( v \, e \)$ bounded. The same estimate at the terminal height controls this extra factor and proves the thickening assertion.
  Equip $N times.r D$ with a fixed left invariant Riemannian metric. The homomorphism $q$ is globally Lipschitz: its derivative bound at the identity is transported everywhere by left translations. Therefore $a$-separated projected endpoints have separated chosen lifts, with separation bounded below by a fixed positive number. Small fixed-radius balls around those lifts are disjoint. The thickening assertion places all of them in
  $ B_r \( E \, C \( 1 + r \)^b \) times B_D \( C r + C \) . $
  Product Haar is valid by Lemma 7; the first factor has volume at most a polynomial times $e^(r P \( E \))$, and the second has polynomial volume by Lemma 6. Every small lifted ball has the same positive Haar volume. This proves (3.11). Injectivity of $q$ is not used.
  For the sequential statement, enlarge $E$ by a vanishing-radius ball so it contains the actual relative path heights divided by $r$ and zero. The support functional changes by $o \( 1 \)$, and the box exponents by $o \( 1 \)$. Polynomial factors are subexponential. For an unrestricted path of length $t$, its intermediate heights are $O \( 1 + t \)$ because $pi$ is Lipschitz. The same lifted-increment argument now bounds each coordinate by $e^(O \( 1 + t \))$, and its polynomially many BCH terms preserve this bound. ◻
]

#thm([Lemma 3.7.])[
  (Polynomial packing at bounded height).  #emph[Fix $M \, C_0 \, a > 0$. There are $C \, b$ such that, for every $t gt.eq 0$, the endpoints of paths starting at one point $x$, of length at most $C_0 t$, whose every relative height has norm at most $M$, have $a$-separated subsets of cardinality at most $C \( 1 + t \)^b$. The constants depend only on the displayed data and the fixed Lie model. This lemma also holds when $N = 1$.]
] <lem:polynomial-path-packing>

#proof[
  If $N = 1$, then $G = D$ is nilpotent. The endpoints lie in the radius-$C_0 t$ ball, and disjoint fixed-radius balls about separated points, together with Lemma 6, give the polynomial bound directly. Suppose now that $N eq.not 1$. Repeat the bounded-increment lifting in the preceding proof. Every accumulated $D$-coordinate has intrinsic length $O \( 1 + t \)$ and height norm at most $M$. On each of the finitely many weight spaces the character factor is bounded by a constant depending on $M$, while the residual action is polynomial in $1 + t$. Hence every conjugated $N$-increment has polynomial log norm. There are $O \( 1 + t \)$ increments; the fixed-degree nilpotent product formula bounds the log norm of their product by $C \( 1 + t \)^b$. The same bounds survive fixed bounded right thickening. The allowed $N$ log-coordinate region and the intrinsic $D$-ball both have polynomial Haar volume. Disjoint small balls around lifts of separated endpoints give the result exactly as before. In particular this is a finite polynomial bound; it does not follow by interpreting a subexponential error as polynomial. ◻
]

#thm([Lemma 3.8.])[
  (Packing at a fixed $D$-position).  #emph[For every $a > 0$ there is $C_a < oo$ such that, for every $d in D$, $x in G$, and bounded measurable $S subset N$, the set ${ x n d : n in S }$ contains an $a$-separated subset with cardinality at least $"vol"_N \( S \) \/ C_a$. The constant is independent of $x \, d \, S$. For a fixed finite number of such slices the corresponding assertion holds for product Haar measure and the product maximum metric.]
] <lem:fixed-sheet-packing>

#proof[
  Set $K_a = N ∩ overline(B)_G \( 1 \, a \)$. This is compact since $N$ is closed and the metric on $G$ is proper. If $n d$ and $n_0 d$ have distance at most $a$, then $n_0^(- 1) n in "Ad"_d K_a$. Conjugation by $d$ preserves $N$-Haar, so the possible $n$ have measure at most $"vol"_N K_a$, independently of $d$. A maximal $a$-separated subset of the bounded slice covers it by radius-$a$ balls. Summing the preceding measure bound gives the assertion, after a harmless increase of $a$ or of $C_a$ at boundary points. Left translation by $x$ is an isometry. In the product maximum metric the covering balls are products, so the same proof multiplies the constants. ◻
]

The next estimate is needed when the $D$-positions vary. It controls how much $N$-volume can be hidden in one projected ball, including volume arising from $N ∩ D$.

#thm([Lemma 3.9.])[
  (Multiplicity of variable lifts).  #emph[Fix a radius $R$. There are $C \, b \, c$ such that, for $T \, H gt.eq 0$ and any metric ball $B_G \( y \, R \)$, the set 
$ { u in N : upright(" for some ") d in D \, \| d \|_D lt.eq T \, med parallel pi d parallel lt.eq H \, med q \( u \, d \) in B_G \( y \, R \) } $

 has $N$-Haar outer measure at most $C \( 1 + T \)^b e^(c H)$. In particular, if $T = O \( r \)$ and $H = o \( r \)$, this measure is $e^(o \( r \))$, with one common envelope for any family subject to those bounds.]
] <lem:lift-multiplicity>

#proof[
  If the set is nonempty, fix one representative $\( u_0 \, d_0 \)$. Every other projected point differs from it by an element of a fixed radius-$2 R$ ball. Choose a bounded lift $\( v \, e \)$ of that difference, using Lemma 5. In $G$,
  $ u d = u_0 d_0 v e = u_0 "Ad"_(d_0) \( v \) d_0 e . $
  It follows that
  #[#set math.equation(numbering: n => "(3.12)")
   $ u_0^(- 1) u = "Ad"_(d_0) \( v \) a \, #h(2em) a = d_0 e d^(- 1) in N ∩ D \, #h(2em) \| a \|_D lt.eq 2 T + O_R \( 1 \) . $ <eq:overlap-multiplicity-formula>]
  The first factor has log norm at most $C \( 1 + T \)^b e^(c H)$ by the character and unipotent bounds. The second has polynomial log norm by intrinsic nilpotent coordinates in $D$. The logarithm of $a$ in $D$ and in $N$ is the same vector in $frak(d) ∩ frak(n)$, because both are restrictions of the injective exponential map of $G$. The finite BCH formula therefore places $u_0^(- 1) u$ in an $N$ log-coordinate ball of radius $C \( 1 + T \)^(b') e^(c' H)$. Its Lebesgue, hence Haar, volume has the stated form after changing the constants. This proves the bound even for outer measure and uses no centrality of the overlap. ◻
]

We have obtained the required two directions of volume comparison. Bracket-generated endpoints at a common $D$-position yield separated points by Lemma 15; images of paths with controlled heights have bounded separated counts by Lemma 13. When a later construction first gives $N$-volume at varying sublinear-height $D$-positions, Lemma 16 supplies the remaining projection bound.

== 4 Polynomial images and recurrent switches <sec:polynomial-volume>

The product schemes of Lemma 10 will be restricted by conditions on the intermediate group elements. Such restrictions need not contain an open set, and their images need not be described by independent parameters. We therefore need a volume estimate for the image of an arbitrary measurable parameter set. We first prove that estimate, and then show how to retain enough parameter measure through a fixed finite sequence of switches.

=== 4.1 Volume of polynomial images <volume-of-polynomial-images>

The scalar sublevel estimate uses a Remez-type argument; see #cite(label("Ganzburg2017")) Theorems 1.1–1.2 for classical measurable-set inequalities and their earlier attribution. The image-volume estimate below is proved directly, with the coefficient and minor bounds needed for our varying polynomial maps.

For a set $A subset bb(R)^b$, write

$ \| A \|_(upright("in")) = sup { \| K \| : K subset A upright(" is compact") } \, $

where $\| dot.op \|$ denotes Lebesgue measure in the indicated dimension. Thus an inner-volume lower bound does not presuppose measurability of $A$. All logarithms below are natural.

#thm([Lemma 4.1.])[
  (Polynomial image volume).  #emph[Fix integers $a gt.eq b gt.eq 1$ and $D gt.eq 1$. There are constants $C > 0$ and $A_1 \, A_2 > 0$, depending only on $a \, b \, D$, with the following property. Let $Phi : bb(R)^a arrow.r bb(R)^b$ be a polynomial map of degree at most $D$, all of whose coefficients have absolute value at most $B gt.eq 0$. Suppose that one $b$-column minor of $D Phi$ has a coefficient of absolute value at least $c > 0$. Put $c_0 = min { c \, 1 }$. For every $R gt.eq 1$ and every Lebesgue-measurable $E subset \[ - R \, R \]^a$ of measure $m > 0$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ \| Phi \( E \) \|_(upright("in")) gt.eq C c_0^(b + 1) \( 1 + B \)^(- b^2) m^(A_1) \( 1 + R \)^(- A_2) . $ <eq:polynomial-image-quantitative>]

 One may take, with $d = max { 1 \, b \( D - 1 \) }$, 
$ A_1 = 1 + a d \( b + 1 \) \, #h(2em) A_2 = a + a^2 d \( b + 1 \) + D b^2 . $

]
  #emph[In particular, let $r arrow.r oo$ along a sequence and let $Phi_r$ have these fixed dimensions and degree bound. Suppose their coefficients converge to those of a polynomial map which is submersive at some point. If the $E_r$ are Lebesgue-measurable and 
$ E_r subset \[ - R_r \, R_r \]^a \, #h(2em) 1 lt.eq R_r lt.eq e^(o \( r \)) \, #h(2em) \| E_r \| gt.eq e^(- o \( r \)) \, $

 then 
#[#set math.equation(numbering: n => "(4.2)")
 $ \| Phi_r \( E_r \) \|_(upright("in")) gt.eq e^(- o \( r \)) . $ <eq:polynomial-image-subexponential>]

 The same conclusion follows from (4.1) if the coefficient upper bounds $B_r$ and a chosen minor-coefficient lower bound $c_r$ satisfy $log \( 1 + B_r \) + log \( 1 \/ min { c_r \, 1 } \) = o \( r \)$.]
] <lem:polynomial-image>

#proof[
  We first keep a definite part of $E$ away from the zero set of the chosen derivative minor. A coordinate slice then retains positive measure, and a small cube in that slice makes the restricted map injective. Change of variables on this cube will give the image-volume bound.
  The first step uses a scalar sublevel estimate. If a polynomial $Q$ in $k gt.eq 1$ variables has degree at most $d gt.eq 1$ and some coefficient of absolute value at least $c$, then, for $R gt.eq 1$ and $0 < eta < c$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| { x in \[ - R \, R \]^k : \| Q \( x \) \| lt.eq eta } \| lt.eq C_(k \, d) \( 1 + R \)^k \( eta \/ c \)^(1 \/ \( k d \)) . $ <eq:polynomial-minor-sublevel>]
  No upper coefficient bound is needed here.
  For $k = 1$, let the sublevel set have length $l > 0$. It contains $d + 1$ points whose mutual distances are at least $l \/ \[ 2 \( d + 1 \) \]$: after fewer than $d + 1$ choices, deleting intervals of that radius about the chosen points removes total length strictly less than $l$. Lagrange interpolation at these points bounds every coefficient of $Q$ by
  $ C_d eta \( 1 + R \)^d l^(- d) . $
  Indeed the denominators are products of $d$ point differences, while the coefficients of the numerator polynomials are bounded by $C_d \( 1 + R \)^d$. The asserted lower bound on one coefficient now proves (4.3) in one variable.
  For the induction step, write
  $ Q \( x' \, t \) = sum_(j = 0)^d q_j \( x' \) t^j $
  and choose $q_j$ which contains a coefficient of absolute value at least $c$. Put $u = eta \/ c in \( 0 \, 1 \)$ and $tau = c u^(\( k - 1 \) \/ k)$. The induction hypothesis bounds the $\( k - 1 \)$-dimensional measure of ${ \| q_j \| lt.eq tau }$ in the base cube by
  $ C \( 1 + R \)^(k - 1) u^(1 \/ \( k d \)) . $
  Above its complement, the one-variable estimate bounds the length of each sublevel slice by
  $ C \( 1 + R \) \( eta \/ tau \)^(1 \/ d) = C \( 1 + R \) u^(1 \/ \( k d \)) . $
  Fubini’s theorem, using the bound $2 R$ on the remaining slice lengths, proves (4.3). The argument also applies to constant polynomials, since $d$ is only a degree upper bound.
  Return to the minor $Q$ of $D Phi$ in the statement. Its degree is at most $b \( D - 1 \)$, so we can use $d = max { 1 \, b \( D - 1 \) }$. Choose a compact $K subset E$ with $\| K \| gt.eq m \/ 2$. For a sufficiently large constant $C_0$, depending only on $a \, b \, D$, set
  $ eta = c_0 (frac(m, C_0 \( 1 + R \)^a))^(a d) . $
  Since $m lt.eq \( 2 R \)^a$, we have $0 < eta < c_0 lt.eq 1$ after increasing $C_0$. Estimate (4.3), with coefficient lower bound $c_0$, makes the bad-minor set have measure at most $m \/ 4$. Therefore the compact set
  $ K' = K ∩ { \| Q \| gt.eq eta } $
  has measure at least $m \/ 4$.
  Permute the domain coordinates so that the chosen minor uses the first $b$ columns, and write $x = \( v \, z \)$ with $v in bb(R)^b$. Fubini supplies a fixed $z$ for which the compact slice $K'_z$ satisfies
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| K'_z \| gt.eq C_a m \( 1 + R \)^(- \( a - b \)) . $ <eq:polynomial-image-slice>]
  When $a = b$, there is no slicing and we use $K'$ itself. For $f \( v \) = Phi \( v \, z \)$, its derivative and the Lipschitz constant of its derivative on $\[ - R \, R \]^b$ are both at most
  $ L = C_(a \, b \, D) \( 1 + B \) \( 1 + R \)^D gt.eq 1 . $
  We now retain a small cube on which $f$ is injective. Cover $\[ - R \, R \]^b$ by at most $C_b \( \( 1 + R \) \/ ell \)^b$ closed cubes of side at most
  $ ell = frac(eta, 4 sqrt(b) thin L^b) . $
  One such cube $J$ contains at least the reciprocal of this number times the mass in (4.4). Choose $v_0 in K'_z ∩ J$. The least singular value of $D f \( v_0 \)$ is at least $eta \/ L^(b - 1)$, since its determinant has absolute value at least $eta$. For every $v in J$,
  $ parallel D f \( v \) - D f \( v_0 \) parallel lt.eq L sqrt(b) thin ell lt.eq frac(eta, 4 L^(b - 1)) . $
  Integrating along a line segment in $J$ gives
  $ \| f \( v \) - f \( w \) \| gt.eq frac(3 eta, 4 L^(b - 1)) \| v - w \| #h(2em) \( v \, w in J \) . $
  Thus $f$ is injective on $J$. Change of variables on its interior, with the boundary omitted as a null set, gives
  $ \| f \( K'_z ∩ J \) \| = integral_(K'_z ∩ J) \| Q \( v \, z \) \| thin d v gt.eq eta \| K'_z ∩ J \| . $
  The image here is compact and is contained in $Phi \( E \)$. Combining the cube count and (4.4) yields
  $ \| Phi \( E \) \|_(upright("in")) gt.eq C m eta^(b + 1) \( 1 + R \)^(- a) L^(- b^2) . $
  Substituting $eta$ and $L$ proves (4.1) with the stated exponents. This proof uses neither finite global fibers nor a global multiplicity bound.
  Finally, a polynomial map submersive somewhere has a derivative minor which is a nonzero polynomial. Coefficient convergence gives a fixed positive lower bound for one coefficient of that same minor of $Phi_r$, for all sufficiently large $r$, and a fixed upper bound for all coefficients of $Phi_r$. Every factor in (4.1) then has logarithm bounded below by $- o \( r \)$ under the hypotheses on $R_r$ and $\| E_r \|$. The final variant follows from the same displayed estimate. ◻
]

=== 4.2 Recurrence within a measurable set <recurrence-within-a-measurable-set>

The passage from a large parameter set to a large image is now available. The next lemma supplies that parameter set while keeping every intermediate state in a prescribed measurable set.

For a probability measure $sigma$ on a group, let $caron(sigma)$ be its image under inversion. With the convention used here, a random element of law $sigma * caron(sigma)$ has the form $s_1 s_2^(- 1)$ for independent $s_1 \, s_2$ of law $sigma$.

#thm([Lemma 4.2.])[
  (Backward recurrence).  #emph[Let $J$ be a second countable unimodular locally compact group with Haar measure $mu$. Let $Q subset J$ be compact with $0 < mu \( Q \) < oo$, and let $S subset Q$ be Borel with $mu \( S \) > 0$. Fix an integer $h gt.eq 1$ and compactly supported probability measures $sigma_1 \, dots.h \, sigma_h$ on $J$. Suppose that numbers $D_j gt.eq 1$ satisfy 
$ mu \( Q "supp" sigma_j \) lt.eq D_j mu \( Q \) #h(2em) \( 1 lt.eq j lt.eq h \) . $

 There are nested Borel sets 
$ S_0 subset S_1 subset dots.h.c subset S_h = S $

 with positive measure such that, writing $a_j = mu \( S_j \) \/ mu \( Q \)$ and $tau_j = a_j \/ \( 2 D_j \)$, one has 
#[#set math.equation(numbering: n => "(4.5)")
 $ a_(j - 1) gt.eq frac(a_j^2, 2 D_j) $ <eq:recurrence-mass>]

 and 
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(P) { x u_j in S_j } gt.eq tau_j #h(2em) \( x in S_(j - 1) \) \, $ <eq:recurrence-transition>]

 where $u_j$ has law $sigma_j * caron(sigma)_j$. If the $u_j$ are sampled independently, every $x in S_0$ therefore has probability at least $product_(j = 1)^h tau_j$ of satisfying 
$ x u_1 dots.h.c u_j in S_j subset S #h(2em) \( 1 lt.eq j lt.eq h \) . $

 In a sequence indexed by $r arrow.r oo$, if $h$ is fixed, $mu \( S \) \/ mu \( Q \) gt.eq e^(- o \( r \))$, and every $D_j lt.eq e^(o \( r \))$, then $mu \( S_0 \) \/ mu \( Q \)$ and the displayed success probability are at least $e^(- o \( r \))$.]
] <lem:backward-recurrence>

#proof[
  For a Borel set $A subset Q$, let
  $ \( T_j 1_A \) \( x \) = integral #h(-0.16667em) integral 1_A \( x s_1 s_2^(- 1) \) thin d sigma_j \( s_1 \) thin d sigma_j \( s_2 \) . $
  This is a Borel function. Right Haar invariance, the substitution $z = x s_1$, and Fubini give
  $ integral_A T_j 1_A \( x \) thin d mu \( x \) & = integral_J (integral 1_A \( z s^(- 1) \) thin d sigma_j \( s \))^2 d mu \( z \)\
 & gt.eq frac(mu \( A \)^2, mu \( Q "supp" sigma_j \)) gt.eq frac(mu \( A \)^2, D_j mu \( Q \)) . $
  For the first inequality, the inner function is supported in $Q "supp" sigma_j$, has integral $mu \( A \)$, and Cauchy–Schwarz applies. Compactness makes the containing set measurable and of finite measure.
  Starting with $S_h = S$, work backwards and define
  $ S_(j - 1) = { x in S_j : \( T_j 1_(S_j) \) \( x \) gt.eq tau_j } \, #h(2em) tau_j = frac(mu \( S_j \), 2 D_j mu \( Q \)) . $
  The contribution from $S_j \\ S_(j - 1)$ to the preceding integral is at most $mu \( S_j \)^2 \/ \( 2 D_j mu \( Q \) \)$. Since $T_j 1_(S_j) lt.eq 1$, the remaining contribution implies
  $ mu \( S_(j - 1) \) gt.eq frac(mu \( S_j \)^2, 2 D_j mu \( Q \)) \, $
  which proves (4.5); the definition gives (4.6). Conditional on the first $j - 1$ successful transitions, the current state lies in $S_(j - 1)$ and the next increment retains its prescribed law. Multiplying the conditional lower bounds proves the claimed probability estimate. For fixed $h$, finitely many squarings, products, and divisions by $e^(o \( r \))$ preserve a lower bound of the form $e^(- o \( r \))$. ◻
]

=== 4.3 Restricted product parameters <restricted-product-parameters>

We combine the two estimates. Backward recurrence supplies a lower bound for the probability of successful parameters. A density bound converts this to Lebesgue measure, and a submersive limiting polynomial map converts that measure to endpoint volume.

#thm([Corollary 4.3.])[
  (Restricted product parameters).  #emph[Let $r arrow.r oo$ along a sequence. Fix $h gt.eq 1$, positive integers $a_1 \, dots.h \, a_h$, and $a = sum_j a_j$. For each $r$, let $J_r \, Q_r \, S_r \, mu_r$, and $sigma_(j \, r)$ satisfy the hypotheses of Lemma 18, with 
$ frac(mu_r \( S_r \), mu_r \( Q_r \)) gt.eq e^(- o \( r \)) \, #h(2em) frac(mu_r \( Q_r "supp" sigma_(j \, r) \), mu_r \( Q_r \)) lt.eq e^(o \( r \)) . $

 For each $j$, let $theta_j in bb(R)^(a_j)$ have a probability law $nu_(j \, r)$, and let the $theta_j$ be independent. Suppose their joint law $nu_r$ gives full measure to a Borel admissible domain $Theta_r subset \[ - R_r \, R_r \]^a$, is absolutely continuous with respect to Lebesgue measure, and satisfies 
$ 1 lt.eq R_r lt.eq e^(o \( r \)) \, #h(2em) frac(d nu_r, d theta) lt.eq e^(o \( r \)) quad upright("almost everywhere") . $

 Let $v_(j \, r) : bb(R)^(a_j) arrow.r J_r$ be Borel maps whose images of the laws $nu_(j \, r)$ are $sigma_(j \, r) * caron(sigma)_(j \, r)$. Finally, let $Phi_r : bb(R)^a arrow.r bb(R)^b$, $1 lt.eq b lt.eq a$, be polynomial maps of a fixed degree bound whose coefficients converge to a map submersive somewhere.]
  #emph[There is a starting point $x_r in S_r$ such that the successful parameter set 
$ E_r = {theta in Theta_r : x_r v_(1 \, r) \( theta_1 \) dots.h.c v_(j \, r) \( theta_j \) in S_r upright(" for every ") 1 lt.eq j lt.eq h} $

 satisfies 
$ \| E_r \| gt.eq e^(- o \( r \)) \, #h(2em) \| Phi_r \( E_r \) \|_(upright("in")) gt.eq e^(- o \( r \)) . $

 Here $Phi_r$ may record a product endpoint, several successive endpoints, or a tuple of bundle products; it need not record the intermediate states used in the definition of $E_r$.]
] <cor:restricted-products>

#proof[
  Apply Lemma 18 and choose $x_r in S_(0 \, r)$. Independent sampling of the parameters produces the required independent increment laws, so $nu_r \( E_r \) gt.eq e^(- o \( r \))$. The set $E_r$ is Borel, because $Theta_r$, multiplication, and the increment maps are Borel. The density upper bound gives
  $ nu_r \( E_r \) lt.eq e^(o \( r \)) \| E_r \| \, $
  proving the first conclusion. Lemma 17 proves the second. No independence remains necessary after restricting to $E_r$. ◻
]

===== 4.3.1 Application to nilpotent product schemes. <application-to-nilpotent-product-schemes.>

In the Lie-group applications, the remaining tasks are to choose output coordinates that record Haar volume and to verify the limiting rank condition. In a simply connected nilpotent Lie group $M$ of dimension $b$, choose exponential coordinates so that Haar measure is Lebesgue measure. If an output map has the form

$ theta mapsto exp_M \( L_r Phi_r \( theta \) \) $

for an invertible linear map $L_r : bb(R)^b arrow.r "Lie" \( M \)$, then the conclusion becomes an inner Haar-volume lower bound

$ \| det L_r \| thin e^(- o \( r \)) . $

For a box normalization in $N$, this determinant is bounded above and below by fixed positive multiples of $e^(r P \( E \))$; for a fixed product of boxes the determinants multiply. Subsequent left translations and other Haar-preserving coordinate homeomorphisms leave this lower bound unchanged. In particular, one can first record unconjugated bundle products and only afterwards apply Haar-preserving conjugations and pass to successive total products. One does not need bounded normalized coefficients for those later coordinate changes.

A generator increment with parameter $t$ can be sampled using $t = s_1 - s_2$, where $s_1 \, s_2$ are independent uniform parameters on a sufficiently large fixed centered interval. The resulting increment law is $sigma * caron(sigma)$. Replacing every scalar parameter in a submersive generator product scheme by such a difference preserves its rank: the linear map $\( s_1 \, s_2 \) mapsto s_1 - s_2$ is surjective, and the chain rule applies. The parameter intervals can be chosen to contain a preimage of a submersion point in their interiors. All parameters here are the normalized parameters; their number and interval bounds are fixed before the scale tends to infinity.

#prodef([Remark 4.4.])[
  (Scope of the parameter estimate).  The scheme and its dimensions must be fixed after any needed subsequence of normalized coordinate laws is chosen, and before the successful parameter set is restricted. Each application must verify a submersive limit for its actual polynomial output map. Positive successful probability alone is insufficient without the stated density and rank hypotheses. For example, $\( x \, y \) mapsto \( x \, 0 \)$ maps a positive-area parameter square to a zero-area set, while $x mapsto e^(- r) x$ is submersive for every $r$ but loses an exponential factor on a fixed interval.
  An arbitrary measurable selector of product representations need not give an absolutely continuous parameter law. It cannot be inserted into Corollary 19 merely because its endpoints have positive Haar measure. When endpoints are sampled directly by Haar measure, their measure must instead be retained and used directly in the endpoint packing estimate.
] <rem:restricted-products-scope>

== 5 Stationary height slopes <sec:stationary>

The volume estimates of the preceding sections detect which linear maps can occur on the height quotient. Our first source of linear maps is reduced cohomology. We apply it to an invariant probability on a compact space of normalized quasi-isometries. This gives an averaged sublinear estimate for one fixed measure. A coupling of the forward and inverse maps then shows that its slope lies in the finite group $cal(A)$ of Lemma 9. Removing the invariant measure is a separate task, beginning in Section 6.

The use of invariant measures on spaces of quasi-isometries and their associated cocycles follows the measured-coupling approach developed by Shalom #cite(label("Shalom2004")) Sections 2.1–2.2. The continuous pair space and the transfer of the same slope to its inverse are constructed below.

Throughout this section $G$ has the hypotheses of Lemma 5, and $W eq.not 0$. We write $e$ for its identity. The homomorphism $pi : G arrow.r W$ is Lipschitz after a Euclidean norm on $W$ is fixed: its differential at the identity has bounded operator norm, and left translation transports that bound to every point.

=== 5.1 Lipschitz pairs and their compact sections <lipschitz-pairs-and-their-compact-sections>

We first replace coarse maps by continuous maps without losing uniformity. This lets us use compact-open limits and continuous group actions.

#thm([Lemma 5.1.])[
  (Lipschitz representatives).  #emph[For each $K gt.eq 1$ and $C gt.eq 0$, there are constants $B < oo$ and $Lambda gt.eq 1$, depending only on $G \, K \, C$, with the following property. Every $\( K \, C \)$ self quasi-isometry of $G$ is within distance $B$ of a map $F$ belonging to a pair $\( F \, macron(F) \)$ such that both maps are $Lambda$-Lipschitz, both satisfy 
$ d \( J \( g \) \, J \( h \) \) gt.eq Lambda^(- 1) d \( g \, h \) - Lambda #h(2em) \( J = F \, macron(F) \) \, $

 and 
$ d \( macron(F) \( F \( g \) \) \, g \) lt.eq Lambda \, #h(2em) d \( F \( macron(F) \( g \) \) \, g \) lt.eq Lambda #h(2em) \( g in G \) . $

]
] <lem:lipschitz-pairs>

The proof is given in Appendix 12.

Fix $Lambda$ as in Lemma 21. Let $Omega$ be the space of all pairs satisfying its displayed bounds, with the compact-open topology on both maps. More generally, everything below applies to any nonempty closed subspace invariant under the two translations that we now define. Target translation and domain translation act by

$ L_y \( F \, macron(F) \) & = \( L_y compose F \, macron(F) compose L_(y^(- 1)) \) \,\
\( F \, macron(F) \) dot.op x & = \( F compose L_x \, L_(x^(- 1)) compose macron(F) \) \, $

where the $L$’s inside the pairs are ordinary left translations on $G$. These actions commute and preserve every bound defining $Omega$. Define the normalized sections

$ X = { \( F \, macron(F) \) in Omega : F \( e \) = e } \, #h(2em) Y = { \( F \, macron(F) \) in Omega : macron(F) \( e \) = e } . $

#thm([Lemma 5.2.])[
  (The two sections).  #emph[The spaces $X$ and $Y$ are compact metrizable. There are homeomorphisms 
$ G times X arrow.r Omega \, quad \( z \, xi \) mapsto L_z xi \, #h(2em) Y times G arrow.r Omega \, quad \( eta \, x \) mapsto eta dot.op x . $

 The formulas 
$ T_x xi = L_(F_xi \( x \)^(- 1)) \( xi dot.op x \) \, #h(2em) U_y eta = \( L_(y^(- 1)) eta \) dot.op macron(F)_eta \( y \) $

 define continuous right actions on $X$ and $Y$, respectively. In particular, $T_y T_x = T_(x y)$ and $U_z U_y = U_(y z)$.]
] <lem:pair-sections>

#proof[
  On $X$, the composition bound gives $d \( macron(F) \( e \) \, e \) lt.eq Lambda$, since $F \( e \) = e$. On $Y$ it similarly gives $d \( F \( e \) \, e \) lt.eq Lambda$. Equi-Lipschitz bounds now give pointwise precompactness on every compact subset of $G$. Arzelà–Ascoli and a countable compact exhaustion yield compactness; all the inequalities and composition bounds are closed under compact-open convergence. The same exhaustion metrizes the topology.
  The inverse of the first coordinate map is
  $ omega mapsto #scale(x: 120%, y: 120%)[\(] F_omega \( e \) \, L_(F_omega \( e \)^(- 1)) omega #scale(x: 120%, y: 120%)[\)] \, $
  and that of the second is
  $ omega mapsto #scale(x: 120%, y: 120%)[\(] omega dot.op macron(F)_omega \( e \) \, macron(F)_omega \( e \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  They are continuous. Continuity of evaluation and composition follows directly from compact-open convergence and the common Lipschitz bound. The action identities follow either from these coordinates or by substituting the two normalization formulas. For example,
  $ F_(T_x xi) \( z \) = F_xi \( x \)^(- 1) F_xi \( x z \) \, #h(2em) macron(F)_(U_y eta) \( z \) = macron(F)_eta \( y \)^(- 1) macron(F)_eta \( y z \) . $
  These identities also verify the stated right-action convention. ◻
]

Here and below an invariant probability means invariant under every element of $G$. Such probabilities exist on any nonempty compact invariant section: $G$ is solvable and therefore amenable, so applying an invariant mean to an orbit of each continuous function gives an invariant positive functional; its representing probability is invariant. Extreme points of the compact convex set of invariant probabilities are ergodic. We will also use the ergodic decomposition of a fixed invariant probability, which applies because the action is continuous, $G$ is second countable, and the section is compact metrizable; see #cite(label("GreschonigSchmidt2000")) Theorem 5.2, specialized to the invariant case. Inversion converts our right action to the left-action convention in that theorem.

=== 5.2 Reduced cohomology and one forward comparison <reduced-cohomology-and-one-forward-comparison>

For an invariant probability $mu$ on $X$, the height evaluation is the $L^2 \( X \, mu \; W \)$-valued cocycle

$ b \( x \) \( xi \) = pi F_xi \( x \) \, #h(2em) \( rho \( x \) f \) \( xi \) = f \( T_x xi \) . $

The convention in Lemma 22 gives $rho \( x \) rho \( y \) = rho \( x y \)$, and

#[#set math.equation(numbering: n => "(5.1)")
 $ b \( x y \) = b \( x \) + rho \( x \) b \( y \) . $ <eq:height-cocycle>]

#thm([Lemma 5.3.])[
  (A slope for a fixed ergodic measure).  #emph[Let $mu$ be an invariant ergodic probability on $X$. There is a continuous homomorphism $l : G arrow.r W$ and functions $phi.alt_j in L^2 \( X \, mu \; W \)$ such that, for every compact $Q subset G$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ sup_(x in Q) parallel b \( x \) + phi.alt_j compose T_x - phi.alt_j - l \( x \) #scale(x: 120%, y: 120%)[parallel]_(L^2 \( mu \)) arrow.r 0 . $ <eq:compact-coboundaries>]

 The homomorphism $l$ kills $N$ and factors through $V$ on $D$. For each fixed $0 < R < oo$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ lim_(r arrow.r oo) 1 / r sup_(\| x \|_G lt.eq R r) parallel pi F \( x \) - l \( x \) parallel_(L^2 \( mu \)) = 0 . $ <eq:stationary-sublinear>]

 These assertions concern the fixed measure $mu$; no rate uniform over invariant measures is asserted.]
] <lem:cohomological-slope>

#proof[
  The representation $rho$ is unitary because $mu$ is invariant. It is strongly continuous: this follows first on continuous functions from the continuous action on compact $X$, and then on $L^2$ by density and unitarity. The jointly continuous evaluation $\( x \, xi \) mapsto pi F_xi \( x \)$ is uniformly continuous on compact subsets of $G times X$, so $b$ is a continuous $L^2$ cocycle.
  Real-triangulable Lie groups have property $cal(W A P)_(upright(t))$, and hence property $H_(upright(t))$, by #cite(label("CornulierTessera2020")) Corollary 1.9. In the form needed here, every continuous unitary representation without invariant vectors has zero first reduced cohomology. Reduced cohomology uses the closure of the coboundaries for uniform norm convergence on compact subsets of the group. The Hilbert representations here are weakly almost periodic, so the cited theorem applies.
  Ergodicity identifies the invariant vectors in $L^2 \( X \, mu \; W \)$ with the constant functions. Orthogonal projection of (5.1) onto this subspace gives the continuous homomorphism
  $ l \( x \) = integral_X pi F_xi \( x \) thin d mu \( xi \) . $
  Apply the vanishing theorem to the cocycle $b - l$ in the orthogonal complement. It gives (5.2). One may complexify the real Hilbert space and take real parts if using the complex convention for unitary representations.
  For completeness, fix a compact symmetric generating neighborhood $Q$ such that every $x$ is a product of at most $a \| x \|_G + a$ elements of $Q$. A fixed-radius metric ball has this property by subdividing a geodesic. Set
  $ c_j \( x \) = b \( x \) + rho \( x \) phi.alt_j - phi.alt_j - l \( x \) . $
  Given $epsilon.alt > 0$, fix $j$ with $sup_(x in Q) parallel c_j \( x \) parallel_2 lt.eq epsilon.alt$. The cocycle identity and unitarity imply
  $ parallel b \( x \) - l \( x \) parallel_2 lt.eq \( a \| x \|_G + a \) epsilon.alt + 2 parallel phi.alt_j parallel_2 . $
  Keep this $j$ fixed, let $r arrow.r oo$ for $\| x \|_G lt.eq R r$, and then let $epsilon.alt arrow.b 0$. This proves (5.3). It is a supremum of $L^2$ norms, which will be sufficient for finite meshes of paths.
  A continuous homomorphism to the additive group $W$ kills the derived Lie algebra. Since $frak(n) subset \[ frak(g) \, frak(g) \]$ and $N$ is connected, it kills $N$; on $D$ it factors through the abelianization $V$. ◻
]

We now use the first volume comparison to show that this homomorphism detects exactly the exponential height directions. The argument does not require ergodicity, provided the averaged estimate is already available.

#thm([Lemma 5.4.])[
  (Volume comparison for an averaged slope).  #emph[Let $sigma$ be a probability on $X$, and let $l : G arrow.r W$ be a continuous homomorphism killing $N$. Suppose (5.3) holds with $sigma$ in place of $mu$. Regard $l \|_D$ as a linear map on $V$. Then every nonempty compact convex $E_V subset V$ satisfies 
#[#set math.equation(numbering: n => "(5.4)")
 $ P \( pi E_V \) lt.eq P \( l E_V \) . $ <eq:forward-slope-volume>]

 Consequently $l = A pi$ for an invertible linear map $A : W arrow.r W$. The same assertion holds for the inverse maps on $Y$.]
] <lem:stationary-volume>

#proof[
  Fix $v_0 in E_V$ and a pivot $d_0 in D$ of intrinsic length $O \( r \)$ whose abelianization is $r v_0$. Put $E = pi E_V$. Apply Lemma 12 with the set $E_V subset V$: although $l$ factors through $V$ on $D$, we do not yet know that it factors through $W$. For each $n in B_r \( E \)$, that lemma supplies a measurably chosen path from $d_0$ to $n d_0$ of length $O \( r \)$. Its abelianized $D$-legs stay in $r E_V$, and its switches have length $o \( r \)$. Since $l$ kills $N$ and is Lipschitz, the path’s $l$-heights lie in $r \( l E_V + o \( 1 \) \)$. All its points have distance $O \( r \)$ from $e$, with common bounds for the sampled endpoints.
  Sample $n$ with normalized Haar measure on $B_r \( E \)$, independently of $xi tilde.op sigma$. Fix $tau > 0$ and sample each path at an arclength mesh of spacing at most $tau r$, including its endpoints. There are at most $M_tau$ sampled points, independent of $r \, n$. At any of them, say $g_r \( n \)$, the assumed estimate gives
  $ integral_X \| pi F_xi \( g_r \( n \) \) - l \( g_r \( n \) \) \|^2 thin d sigma \( xi \) = o \( r^2 \) \, $
  uniformly in $n$. Fubini, a finite union bound, and Chebyshev’s inequality show that, for every fixed $eta > 0$, the fraction of pairs $\( xi \, n \)$ on which a sampled error exceeds $eta r$ tends to zero. Hence for all large $r$ there is one $xi$ for which at least half the endpoint volume has no such error.
  For these endpoints the entire image path lies at heights within $\( c tau + eta + o \( 1 \) \) r$ of $r l E_V$. Indeed the image of each mesh interval has diameter at most the common Lipschitz constant times $tau r$. The initial image point is the common $F_xi \( d_0 \)$; subtracting its height only translates the allowed height set.
  At their common source $D$-position, the good endpoints have a separated subset of cardinality at least $c_0 e^(r P \( E \))$, by Lemma 15. Choose the separation large enough that the quasi-isometry lower bound keeps their images separated by a fixed positive amount. Their image paths have length $O \( r \)$. Lemma 13 and translation invariance of $P$ give
  $ P \( E \) lt.eq P #scale(x: 120%, y: 120%)[\(] l E_V + overline(B)_W \( 0 \, c tau + eta \) #scale(x: 120%, y: 120%)[\)] $
  after taking $r arrow.r oo$. First let $eta arrow.b 0$, then $tau arrow.b 0$. Continuity of $P$ for Hausdorff distance proves (5.4). This argument only used a fixed finite mesh before the limit; it did not require an $L^2$ bound on the pointwise supremum over a path.
  Apply (5.4) to $\[ 0 \, v \] subset V$. Since $p$ is a norm,
  $ p \( l v \) gt.eq p \( pi v \) \, #h(2em) ker l subset.eq ker pi . $
  Writing $d = dim W$, the inclusion forces $"rank" l gt.eq d$, while the target of $l$ has dimension $d$. Thus $l$ and $pi$ have the same kernel on $V$, and $l = A pi$ there for an invertible $A$. Both homomorphisms kill $N$ and $G = N D$, so this equality holds on $G$. All the reasoning applies to the reversed pairs on $Y$ as well. ◻
]

=== 5.3 Transferring the same slope to the inverse <transferring-the-same-slope-to-the-inverse>

An independently obtained slope for $macron(F)$ would not yet show that $A$ preserves $P$. We need its slope to be exactly $A^(- 1)$. The commuting actions on $Omega$ give a finite measure on the inverse section, and averaging over a ball makes the transfer functions well-defined there.

#thm([Lemma 5.5.])[
  (The inverse coupling).  #emph[Let $mu$ be an invariant probability on $X$ and let $A in "GL" \( W \)$. Suppose there are $phi.alt_j in L^2 \( X \, mu \; W \)$ satisfying (5.2) with $l = A pi$. There is a finite nonzero $U$-invariant measure $nu$ on $Y$ and functions $theta_j in L^2 \( Y \, nu \; W \)$ such that, for every compact $Q subset G$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ sup_(y in Q) parallel pi macron(F) \( y \) + theta_j compose U_y - theta_j - A^(- 1) pi y #scale(x: 120%, y: 120%)[parallel]_(L^2 \( nu \)) arrow.r 0 . $ <eq:inverse-coboundaries>]

 In particular, for every fixed $0 < R < oo$, 
#[#set math.equation(numbering: n => "(5.6)")
 $ lim_(r arrow.r oo) 1 / r sup_(\| y \|_G lt.eq R r) parallel pi macron(F) \( y \) - A^(- 1) pi y parallel_(L^2 \( nu \)) = 0 . $ <eq:inverse-stationary-sublinear>]

]
] <lem:inverse-coupling>

#proof[
  #emph[The invariant measure on the inverse section.] Let $m$ be Haar measure on $G$. In the coordinates $Omega = G times X$ of Lemma 22, put $M = m times mu$. This is a nonzero Radon measure and is target-invariant. Domain translation has the formula
  $ \( z \, xi \) dot.op x = \( z F_xi \( x \) \, T_x xi \) . $
  For each fixed $xi$, the change in $z$ is right translation, which preserves $m$ by unimodularity. Invariance of $mu$ therefore makes $M$ domain-invariant as well.
  In the other coordinates $Omega = Y times G$, domain translation is $\( eta \, x \) mapsto \( eta \, x g \)$. For a Borel set $E subset Y$, the measure $B mapsto M \( E times B \)$ is right-invariant and locally finite: for compact $B$ it is bounded by $M \( Y times B \) < oo$. Haar uniqueness gives $M \( E times B \) = nu \( E \) m \( B \)$, and countable additivity in $E$ supplies a Borel measure $nu$ with
  #[#set math.equation(numbering: n => "(5.7)")
   $ M = nu times m quad upright("on ") Y times G . $ <eq:two-section-measure>]
  Here a product with compact factors is compact in $Omega$, by the coordinate homeomorphism, so the local finiteness used above follows from the Radon property of $M$.
  Choose a compact ball $B_0 subset G$ with $0 < m \( B_0 \) < oo$. Then
  $ nu \( Y \) m \( B_0 \) = M \( Y times B_0 \) < oo . $
  If $nu \( Y \) = 0$, a countable compact exhaustion of $G$ and (5.7) would imply $M = 0$. Thus $0 < nu \( Y \) < oo$. In particular, $nu$ is a measure obtained from product coordinates; we are not restricting $M$ to the possibly $M$-null section $Y$.
  For $y in G$, set $q_y \( eta \) = macron(F)_eta \( y \)$. The identity
  #[#set math.equation(numbering: n => "(5.8)")
   $ L_(y^(- 1)) \( eta dot.op x \) = \( U_y eta \) dot.op \( q_y \( eta \)^(- 1) x \) $ <eq:coupling-target-action>]
  shows that $nu$ is $U$-invariant. More explicitly, integrate a test function of $eta$ times a compactly supported function of $x$ against $M$. In the transformed integral, the fiber change $x mapsto q_y \( eta \)^(- 1) x$ preserves left Haar measure. Target invariance of $M$ then gives invariance of the $eta$-integral.
  #emph[Transfer functions averaged over the fibers.] Choose measurable representatives of the $phi.alt_j$ and lift them by
  $ Phi_j \( L_z xi \) = pi z + phi.alt_j \( xi \) . $
  They belong to $L^2$ on every compact subset of $Omega$ and satisfy $Phi_j \( L_z omega \) = pi z + Phi_j \( omega \)$. Their domain increments have defect
  $ E_j \( omega \, t \) = Phi_j \( omega dot.op t \) - Phi_j \( omega \) - A pi t . $
  If $omega = L_z xi$, this is exactly $c_j \( t \) \( xi \) = b \( t \) \( xi \) + phi.alt_j \( T_t xi \) - phi.alt_j \( xi \) - A pi t$. Consequently, for compact $K_Omega subset Omega$ and $K_G subset G$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ sup_(t in K_G) integral_(K_Omega) \| E_j \( omega \, t \) \|^2 thin d M \( omega \) arrow.r 0 . $ <eq:local-increment-defect>]
  Indeed $K_Omega$ lies in $K times X$ for a compact $K subset G$ in the first coordinates; the integral is at most $m \( K \) parallel c_j \( t \) parallel_2^2$.
  We now average over whole balls so that no trace of an $L^2$ function on a null section is required. Fix a compact ball $B subset G$ of positive Haar measure, and define
  $ D_j \( eta \, x \) & = Phi_j \( eta dot.op x \) - A pi x \,\
Psi_j \( eta \) & = frac(1, m \( B \)) integral_B D_j \( eta \, x \) thin d m \( x \) . $
  Product coordinates and Fubini define this average for $nu$-almost every $eta$. Jensen’s inequality and local $L^2$ integrability of $Phi_j$ show that $Psi_j in L^2 \( Y \, nu \; W \)$; define it arbitrarily on the remaining null set.
  Equation (5.8), target equivariance of $Phi_j$, and additivity of $pi$ give
  #[#set math.equation(numbering: n => "(5.10)")
   $ Psi_j \( U_y eta \) - Psi_j \( eta \) = - pi y + A pi q_y \( eta \) + R_j \( eta \, y \) \, $ <eq:inverse-transfer-identity>]
  where $R_j \( eta \, y \)$ is the difference of the averages of $D_j \( eta \, dot.op \)$ on $q_y \( eta \) B$ and on $B$. For each fixed $y$, this identity holds almost everywhere: $U_y$ preserves $nu$, and the changes in the fiber variable preserve Haar measure. These facts also show that changing the measurable representatives of the transfers changes none of their $L^2$ classes or averages.
  #emph[Comparing two fiber averages.] We claim that $R_j$ tends to zero in $L^2 \( nu \)$ uniformly for $y$ in any fixed compact $Q$. The increment estimate (5.9) will control, in $L^2 \( nu \)$, the difference between averages over two bounded regions of each fiber. Since $macron(F)_eta \( e \) = e$ on $Y$ and the maps have a common Lipschitz constant, all $q_y \( eta \)$ with $y in Q$, $eta in Y$ lie in one compact set $Q_1 subset G$. Put $C_1 = Q_1 B$. Jensen’s inequality applied to the two averages gives, for every $y in Q$,
  #[#set math.equation(numbering: n => "(5.11)")
   $ parallel R_j \( dot.op \, y \) parallel_2^2 & lt.eq frac(1, m \( B \)^2) integral_Y integral_(C_1) integral_B \| D_j \( eta \, x_1 \) - D_j \( eta \, x_2 \) \|^2 thin d m \( x_2 \) thin d m \( x_1 \) thin d nu \( eta \) . $ <eq:whole-ball-bound>]
  The enlargement from $q_y \( eta \) B$ to $C_1$ is legitimate because its averaging density is bounded by $1 \/ m \( B \)$, even though its center depends on $eta$. Thus the right side is independent of $y$.
  Inside this integral one has
  $ D_j \( eta \, x_1 \) - D_j \( eta \, x_2 \) = E_j \( eta dot.op x_2 \, x_2^(- 1) x_1 \) . $
  Make the substitution $t = x_2^(- 1) x_1$, which preserves left Haar measure in $x_1$. Enlarge the resulting $t$-domain to the compact $B^(- 1) C_1$. The pairs $eta dot.op x_2$ range over the compact image of $Y times B$, and their measure is $M$ by (5.7). Hence the right side of (5.11) is at most
  $ frac(1, m \( B \)^2) integral_(B^(- 1) C_1) integral_(Y dot.op B) \| E_j \( omega \, t \) \|^2 thin d M \( omega \) thin d m \( t \) \, $
  which tends to zero by (5.9). We have proved
  $ sup_(y in Q) parallel R_j \( dot.op \, y \) parallel_(L^2 \( nu \)) arrow.r 0 . $
  The supremum here is over the individual $L^2$ norms. No common pointwise exceptional set for all $y$ is being asserted or used.
  Set $theta_j = - A^(- 1) Psi_j$ and rearrange (5.10). This gives
  $ pi macron(F)_eta \( y \) + theta_j \( U_y eta \) - theta_j \( eta \) = A^(- 1) pi y - A^(- 1) R_j \( eta \, y \) \, $
  proving (5.5) with precisely the inverse of the given $A$. The inverse height evaluations form a continuous cocycle for the unitary action on $L^2 \( Y \, nu \; W \)$, by the formulas in Lemma 22. Subdividing a geodesic into bounded steps, exactly as in the proof of Lemma 23, proves (5.6). Neither ergodicity of $nu$ nor a second application of reduced cohomology is needed. ◻
]

=== 5.4 Finite stationary labels <finite-stationary-labels>

#thm([Proposition 5.6.])[
  #emph[For every invariant ergodic probability $mu$ on $X$, there is an $A_mu in cal(A)$ such that (5.2) holds with $l = A_mu pi$ and 
$ lim_(r arrow.r oo) 1 / r sup_(\| x \|_G lt.eq R r) parallel pi F \( x \) - A_mu pi x parallel_(L^2 \( mu \)) = 0 #h(2em) \( 0 < R < oo \) . $

 The coupled finite invariant measure on $Y$ satisfies the analogous estimate with $A_mu^(- 1)$.]
] <prop:stationary-slopes>

#proof[
  Lemma 23 gives $l$ and its compact coboundary approximations. Lemma 24 gives $l = A pi$ with $A$ invertible. The inverse coupling in Lemma 25 supplies a finite nonzero invariant measure $nu$ and the inverse averaged estimate with the same $A^(- 1)$. Normalize $nu$ to a probability and apply Lemma 24 to the inverse maps.
  Every compact convex $E subset W$ has a compact convex lift to $V$, by a fixed linear section of $pi : V arrow.r W$. The forward comparison therefore gives $P \( E \) lt.eq P \( A E \)$, and the inverse comparison applied to $A E$ gives $P \( A E \) lt.eq P \( E \)$. Thus $P \( A E \) = P \( E \)$ for every nonempty compact convex $E$, which is precisely $A in cal(A)$. ◻
]

The next form allows an occupation measure to have several ergodic components. It is the only stationary conclusion needed for the microstep argument in the next section.

#thm([Corollary 5.7.])[
  (Stationary increments).  #emph[Fix an invariant probability $mu$ on $X$, without assuming ergodicity. For each $v in V$, represented in the fixed degree-one complement in $frak(d)$, one has 
#[#set math.equation(numbering: n => "(5.12)")
 $ integral_X "dist" (frac(pi F_xi \( exp_D \( L v \) \), L) \, { A pi v : A in cal(A) }) thin d mu \( xi \) arrow.r 0 #h(2em) \( L arrow.r oo \) . $ <eq:finite-stationary-increments>]

 For each fixed $L > 0$, the integrand is a bounded continuous function on $X$. For $L gt.eq 1$ these functions have a common bound depending only on $v \, G \, Lambda$. The convergence is for the fixed $mu$.]
] <cor:stationary-increments>

#proof[
  Write $mu = integral mu_s thin d kappa \( s \)$ for its ergodic decomposition #cite(label("GreschonigSchmidt2000")) Theorem 5.2. On almost every component Proposition 26 gives $A_s in cal(A)$. Since $\| exp_D \( L v \) \|_G lt.eq L parallel v parallel$ up to the fixed norm convention, its estimate implies convergence of the displayed integral with $mu_s$ in place of $mu$.
  The normalized height evaluations are uniformly bounded for $L gt.eq 1$ by the Lipschitz bounds for $F$ and $pi$ and by $F \( e \) = e$. The comparison set is finite and fixed. Dominated convergence through the ergodic decomposition proves (5.12). No measurable choice of $A_s$ is required: the integrand already takes distance to the full finite set. Continuity for fixed $L$ follows from evaluation in the compact-open topology. ◻
]

When applying Corollary 27 to limits of occupation measures, one must first fix a limiting invariant measure. One may then pass to the geometric limit for each fixed microstep length $L$, using continuity of its integrand, and only afterwards let $L arrow.r oo$. This order uses exactly the fixed-measure convergence proved here.

== 6 Affine limits of chart profiles <sec:profiles>

The stationary increment estimate applies to invariant probabilities, whereas the quasi-isometry under consideration need not be typical for any such probability. We first obtain invariant probabilities by averaging over large charts. Stationary increments then constrain the slopes of limiting chart profiles to convex hulls of finitely many vectors. A separate volume comparison controls the support exponent of the image of each horizontal segment. Together these inequalities will make every supported limiting profile affine on the interior of its chart, with linear part $A pi$ for some $A in cal(A)$. The label and the affine offset may still differ between profiles; their agreement is the subject of the next two sections.

Throughout this section the bounds on the map pairs are fixed, as in Lemma 22. They, and the group $G$, determine all uniform constants below. We assume $W eq.not 0$. Fix a Euclidean norm on $W$, and set

#[#set math.equation(numbering: n => "(6.1)")
 $ cal(C) = { w in W : alpha_i \( w \) lt.eq parallel alpha_i parallel upright(" for every ") i } . $ <eq:profile-polytope>]

Here the norm of a form is its dual Euclidean norm. The unit ball is contained in $cal(C)$. The positive relation among all generator weights and their spanning property imply that $cal(C)$ is bounded: its recession cone consists of the vectors on which all the weights are nonpositive, and that cone is ${ 0 }$. In particular $cal(C)$ is a compact convex polytope with $0$ in its interior. Moreover

$ s_i \( cal(C) \) = parallel alpha_i parallel > 0 . $

Indeed the contact point of the unit ball for $alpha_i$ belongs to $cal(C)$ and attains the defining bound. At this contact point every form on a different oriented ray has a strict inequality, by equality in Cauchy–Schwarz. Thus each distinct oriented generator ray defines a genuine facet, and that contact point lies in its relative interior.

Write $m$ for the nilpotence class of $N$, and put

$ s_(-) = min_i s_i \( cal(C) \) \, #h(2em) s_(+) = max_i s_i \( cal(C) \) . $

We will sample an $N$-box with template $cal(C)$ and allow an additional deterministic $N$-translation from a slightly larger box. To keep these samples asymptotically invariant under fixed group moves, the $D$-positions must stay inside a smaller height region. The next choice ensures that this interior margin survives conjugation by the additional translation. Fix once and for all a number $c > 1$ such that $c s_(-) > 2 m s_(+)$. Until the end of this section, $delta$ is fixed and satisfies $0 < c delta < 1 \/ 2$. Define the open subset of the graded nilpotent group $D_oo$ by

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(U)_delta = { z in D_oo : pi z in \( 1 - c delta \) "int" \( cal(C) \) } . $ <eq:profile-domain>]

The map $pi$ on $D_oo$ is the linear height projection in graded logarithmic coordinates. Consequently $cal(U)_delta$ is connected.

#prodef([Definition 6.1.])[
  (Chart profiles).  Let $r arrow.r oo$ along a sequence. For each $r$, choose a map pair with first map $F$, a basepoint $x in G$, and a deterministic suffix $k_0 in N$ satisfying
  #[#set math.equation(numbering: n => "(6.3)")
   $ k_0 in B_r \( \( 1 + delta \) cal(C) \, e^(epsilon_r r) \) \, #h(2em) epsilon_r gt.eq 0 \, quad epsilon_r arrow.r 0 . $ <eq:profile-suffix>]
  Choose $a$ uniformly with respect to Haar measure on $B_r \( cal(C) \)$, and set $n = a k_0$. The chart profile is the random continuous function
  #[#set math.equation(numbering: n => "(6.4)")
   $ f_(r \, x \, n) \( z \) = frac(pi F \( x n Delta_r z \) - pi F \( x \), r) \, #h(2em) z in D_oo . $ <eq:chart-profile>]
  The law of this function is taken in $C_(upright("loc")) \( D_oo \, W \)$, with its topology of uniform convergence on compact subsets. The map, basepoint, and suffix may all vary with $r$.
] <def:chart-profiles>

For a continuous $W$-valued function $h$ on a nonempty compact set $Z$, write $parallel h parallel_Z = sup_(z in Z) parallel h \( z \) parallel$.

The logarithmic coordinates of $n$ are bounded by $e^(O \( r \))$, uniformly along every sequence in Definition 28. Hence Lemma 11 gives $\| n \|_G = O \( r \)$, so the values of the profiles at the identity are bounded. Lemma 6 and the uniform Lipschitz bound for $F$ give equicontinuity and boundedness on each compact subset of $D_oo$: explicitly,

$ parallel f_(r \, x \, n) \( z \) - f_(r \, x \, n) \( z' \) parallel lt.eq C_1 / r thin d_D \( Delta_r z \, Delta_r z' \) \, $

where $C_1$ is independent of $a \, x \, F \, k_0$. Arzelà–Ascoli and a compact exhaustion therefore give a common compact set containing the profiles along any such sequence, after discarding finitely many terms. In particular their laws have weakly convergent subsequences. Every limiting function is Lipschitz along horizontal segments, with a bound proportional to the norm of the horizontal velocity. Indeed those segments are the uniform limits of

#[#set math.equation(numbering: n => "(6.5)")
 $ Psi_(r \, t) \( z \) = Delta_r^(- 1) \( Delta_r z exp_D \( r t v \) \) \, #h(2em) v in V \, $ <eq:actual-profile-segment>]

and the corresponding paths in $D$ have speed at most a constant times $r parallel v parallel$. Here, as in Lemma 6, a vector in $V$ is represented in the chosen first-layer complement of $frak(d)$.

=== 6.1 Invariant occupation probabilities <invariant-occupation-probabilities>

We need chart averages that are asymptotically unchanged by each fixed right translation. The enlarged suffix in (6.3) is important for later comparisons, so the following estimate keeps track of its effect.

#thm([Lemma 6.2.])[
  (Interior slack).  #emph[Use the data of Definition 28. Suppose a family $u_r in N$ has a word expansion of its logarithm whose coefficient of each word $Z$ is bounded in absolute value by 
$ exp #scale(x: 120%, y: 120%)[\(] r \( 1 - c delta \) h_Z \( cal(C) \) + o \( r \) #scale(x: 120%, y: 120%)[\)] \, $

 with a common error envelope for the finitely many words. Then $k_0 u_r k_0^(- 1)$ has logarithmic coordinates tending exponentially to zero in the coordinates normalized for $B_r \( cal(C) \)$. The same conclusion holds uniformly for bounded families satisfying the displayed coefficient bounds with a common envelope.]
] <lem:profile-interior-slack>

#proof[
  Expand $log k_0$ in the finite list of bracket words using Lemma 8. Its coefficient in a word $Y$ is bounded by $exp \( r \( 1 + delta \) h_Y \( cal(C) \) + o \( r \) \)$. The finite expansion of $exp \( "ad" \( log k_0 \) \) log u_r$ consists of brackets of an initial word $Z$ with additional words $Y_1 \, dots.h \, Y_j$. The sum of their lengths is at most $m$ whenever the bracket is nonzero. Before expansion in a maximizing basis, the logarithm of the coefficient divided by $r$ is at most
  $ \( 1 - c delta \) h_Z \( cal(C) \) + \( 1 + delta \) sum_(ell = 1)^j h_(Y_ell) \( cal(C) \) + o \( 1 \) . $
  The width of the resulting word is $h_Z \( cal(C) \) + sum_ell h_(Y_ell) \( cal(C) \)$. Relative to this width the exponent is therefore at most
  #[#set math.equation(numbering: n => "(6.6)")
   $ - delta (c h_Z \( cal(C) \) - sum_(ell = 1)^j h_(Y_ell) \( cal(C) \)) + o \( 1 \) lt.eq - delta \( c s_(-) - m s_(+) \) + o \( 1 \) . $ <eq:profile-slack-exponent>]
  This is bounded above by a negative constant for all large $r$. The basis-exchange comparison in Lemma 8 says that expanding a word in a maximizing basis uses only basis entries whose widths are at least its width. That expansion cannot increase the bound in (6.6). There are only finitely many terms, which proves the assertion. ◻
]

For a pair $omega$ and a point $p in G$, let $omega \[ p \] in X$ denote the pair normalized at $p$; its first map is $g mapsto F \( p \)^(- 1) F \( p g \)$. The normalized action has the exact identity

#[#set math.equation(numbering: n => "(6.7)")
 $ T_g omega \[ p \] = omega \[ p g \] . $ <eq:profile-normalization-action>]

#thm([Lemma 6.3.])[
  (Occupation invariance).  #emph[Let $rho$ be a continuous compactly supported probability density with respect to Haar measure on $D_oo$, with support contained in $cal(U)_delta$. Independently of $a$, sample $z$ with density $rho$. Every weak limit of the laws of 
$ omega \[ x a k_0 Delta_r z \] in X $

 is an invariant probability for the normalized right action of $G$.]
] <lem:occupation-invariance>

#proof[
  We prove that the laws of the sampled points are asymptotically unchanged in total variation by right multiplication by each fixed element of $G$. It suffices to consider elements of $D$ and $N$, since these subgroups generate $G$.
  For $d in D$, right multiplication changes $z$ to
  $ z mapsto Delta_r^(- 1) \( Delta_r z thin d \) . $
  This map preserves Haar measure in the scaled coordinates, because $D$ is unimodular and the coordinate scaling has constant Jacobian. By Lemma 6 it converges to the identity uniformly on compact sets. A continuous compactly supported density changes by $o \( 1 \)$ in $L^1$, proving the assertion for $d$.
  For fixed $u in N$, right multiplication changes $a$ to
  $ a thin q_r \( z \) \, #h(2em) q_r \( z \) = k_0 "Ad"_(Delta_r z) \( u \) k_0^(- 1) \, $
  and leaves $z$ unchanged. On the compact support of $rho$, the weight-action estimate in Lemma 7 bounds a coefficient of $log "Ad"_(Delta_r z) \( u \)$ in a word $Z$ by
  $ exp #scale(x: 120%, y: 120%)[\(] r gamma_Z \( pi z \) + o \( r \) #scale(x: 120%, y: 120%)[\)] lt.eq exp #scale(x: 120%, y: 120%)[\(] r \( 1 - c delta \) h_Z \( cal(C) \) + o \( r \) #scale(x: 120%, y: 120%)[\)] . $
  The error is uniform there; it includes the polynomial factors from the unipotent part of the $D$ action. Words of zero total weight cause no exception to the inequality. Lemma 29 shows that $q_r \( z \)$ tends exponentially to the identity in the $cal(C)$-normalized coordinates, uniformly in $z$.
  The normalized product laws have uniformly bounded polynomial coefficients. Thus, on the fixed coordinate cube defining $B_r \( cal(C) \)$, multiplication by $q_r \( z \)$ and by $q_r \( z \)^(- 1)$ both converge uniformly to the identity. Their images lie in Euclidean boundary enlargements of the cube of thickness tending to zero. Haar invariance now gives
  $ sup_(z in "supp" rho) frac("vol"_N \( B_r \( cal(C) \) q_r \( z \) triangle.stroked.t B_r \( cal(C) \) \), "vol"_N \( B_r \( cal(C) \) \)) arrow.r 0 . $
  This is precisely the required total-variation estimate for the conditional uniform laws of $a$.
  The estimates were proved before projecting the sampling coordinates to $G$. Projection decreases total variation, so the possible nonuniqueness of $N D$ coordinates is harmless here. Finally apply (6.7). The action on the compact space $X$ is continuous by Lemma 22; every weak limit of the normalized occupation laws is therefore invariant. ◻
]

=== 6.2 Two inequalities on a limiting segment <two-inequalities-on-a-limiting-segment>

Fix a supported limit $f$ of chart profiles. We first constrain its increments to the convex hull of the stationary slopes, then compare the support exponent of each image segment with that of its source. Finite derivative labels alone would still permit folding: the scalar function $t mapsto \| t \|$ has derivative $plus.minus 1$ almost everywhere. The second inequality retains the volume information needed to rule out this behavior. Lemma 33 will combine the two inequalities to prove affinity. Both statements concern every compact horizontal segment in the open chart, and neither uses any comparison between neighboring sheets.

#thm([Lemma 6.4.])[
  (Convex increment constraint).  #emph[Let $nu$ be a weak limit of chart-profile laws, and let $f in "supp" nu$. If 
$ J = { z exp_oo \( t v \) : 0 lt.eq t lt.eq T } subset.double cal(U)_delta \, #h(2em) T > 0 \, quad v in V \, $

 then 
#[#set math.equation(numbering: n => "(6.8)")
 $ frac(f \( z exp_oo \( T v \) \) - f \( z \), T) in "conv" { A pi v : A in cal(A) } . $ <eq:profile-convex-increments>]

]
] <lem:profile-convex-increments>

#proof[
  First allow the starting point $z$ to vary in a small neighborhood $O$ so that the whole family of segments lies in a compact subset of $cal(U)_delta$. Choose a continuous probability density $eta$ supported in $O$, positive near the specified starting point. Choose another continuous probability density $rho$, compactly supported in $cal(U)_delta$, which is bounded below by a positive number on a compact neighborhood of this swept family. The same neighborhood contains all the actual scaled paths $Psi_(r \, t) \( z \)$ from (6.5), for all large $r$, $z in "supp" eta$, and $0 lt.eq t lt.eq T$.
  Let $mu_r$ be the occupation law obtained with $rho$. Pass to a subsequence on which $mu_r$ converges to $mu$; the prescribed profile limit remains $nu$. By Lemma 30, $mu$ is invariant. The cutoff and this subsequence are fixed before choosing a microstep length.
  Fix an integer $L gt.eq 1$. Put $q = floor.l r T \/ L floor.r$ and divide the actual path into $q$ increments by $exp_D \( L v \)$ and a final remainder. For $0 lt.eq j < q$, its $j$th starting point is
  $ p_j = x a k_0 Delta_r z exp_D \( j L v \) . $
  Right invariance of Haar measure in $D$ shows that the distribution of the scaled $D$ coordinate of $p_j$, when $z$ has density $eta$, has density at most $parallel eta parallel_oo$. Its support is in the compact set where $rho$ has a positive lower bound. Hence the law of $omega \[ p_j \]$ is bounded above by $C_0 mu_r$, with a constant $C_0$ independent of $r \, j \, L$. The original law of $a$ is unchanged and independent of $z$ throughout this comparison.
  Write $K_v = "conv" { A pi v : A in cal(A) }$ and define the bounded continuous function on $X$
  $ d_L \( omega' \) = "dist" (frac(pi F_(omega') \( exp_D \( L v \) \), L) \, K_v) . $
  The identity of height cocycles at $p_j$ and convexity give
  $ & bb(E)_(a \, z) "dist" (frac(f_(r \, x \, a k_0) \( Psi_(r \, T) \( z \) \) - f_(r \, x \, a k_0) \( z \), T) \, K_v)\
 & #h(25mm)  lt.eq frac(L, r T) sum_(j = 0)^(q - 1) bb(E)_(a \, z) d_L \( omega \[ p_j \] \) + O \( L \/ r \) lt.eq C_0 integral_X d_L thin d mu_r + O \( L \/ r \) . $
  The final error uses the Lipschitz bound on the remainder interval and the boundedness of $K_v$. For this fixed $L$, let $r arrow.r oo$. Profile compactness and the uniform convergence of $Psi_(r \, T)$ give
  $ integral #h(-0.16667em) integral_O "dist" (frac(f' \( z exp_oo \( T v \) \) - f' \( z \), T) \, K_v) eta \( z \) thin d z thin d nu \( f' \) lt.eq C_0 integral_X d_L thin d mu . $
  Now let the integer $L$ tend to infinity. Corollary 27 for this one fixed invariant probability $mu$ makes the right side tend to zero. No convergence rate uniform over invariant probabilities is required.
  The nonnegative integrand on the left is continuous in the profile and the starting point. Its integral being zero, it vanishes on the product of the supports. In particular it vanishes for the specified $f$ and $z$. The argument applies to each segment as stated in the lemma. ◻
]

#thm([Lemma 6.5.])[
  (Segment volume inequality).  #emph[Under the hypotheses of Lemma 31, 
#[#set math.equation(numbering: n => "(6.9)")
 $ P \( f \( J \) \) gt.eq P \( pi J \) = T p \( pi v \) . $ <eq:profile-segment-volume>]

]
] <lem:profile-segment-volume>

#proof[
  #emph[Fixing the endpoint scheme.] Set $E = pi J$. We may pass to any further subsequence of the one giving $nu$. First pass to a subsequence on which the nilpotent laws in $E$-normalized coordinates converge. By Lemma 10, choose a fixed finite ordered list of generator increments whose normalized endpoint map has a submersive limit at an interior parameter point. Its length $h$ is fixed independently of $r$. An increment in letter $i$ has the form $exp \( t e^(r s_i \( E \)) X_i \)$, with $t$ in a fixed bounded interval. Replace $t$ by $t_1 - t_2$ with independent uniform interval parameters, enlarging their fixed intervals if necessary. The difference map is surjective, so the limiting endpoint map is still submersive somewhere in the parameter cube. Fix this scheme now.
  #emph[Retaining sheets with the prescribed profile.] Choose a compact neighborhood $Z_J subset.double cal(U)_delta$ of $J$ that contains all the actual scaled paths $Psi_(r \, t) \( z \)$, $0 lt.eq t lt.eq T$, for large $r$. Put $Q_r = B_r \( cal(C) \) k_0$. Because $f in "supp" nu$, for each fixed positive tolerance the set of $n in Q_r$ whose profiles are within that tolerance of $f$ on this compact has a positive lower limiting relative measure. Choosing the tolerances slowly enough gives Borel sets $S_r subset Q_r$ and numbers $zeta_r arrow.r 0$ such that
  #[#set math.equation(numbering: n => "(6.10)")
   $ frac("vol"_N \( S_r \), "vol"_N \( Q_r \)) gt.eq e^(- o \( r \)) \, #h(2em) sup_(n in S_r) parallel f_(r \, x \, n) - f parallel_(Z_J) lt.eq zeta_r . $ <eq:profile-good-mass>]
  To be explicit, choose tolerances $1 \/ j$ successively; postpone the $j$th choice until its probability lower bound has logarithm of absolute value at most $r \/ j$. This also ensures that every other fixed compactness error tends to zero along the diagonal. The scheme and its compact were chosen before this diagonal.
  We verify the support-volume hypothesis for recurrence. For an individual generator interval let $sigma_(j \, r)$ denote the law of $exp \( t e^(r s_i \( E \)) X_i \)$. Since $E subset \( 1 - c delta \) "int" \( cal(C) \)$,
  $ s_i \( E \) lt.eq \( 1 - c delta \) s_i \( cal(C) \) . $
  Lemma 29 shows that $k_0 "supp" \( sigma_(j \, r) \) k_0^(- 1)$ tends to the identity in normalized $cal(C)$ coordinates. The bounded polynomial product law therefore gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ "vol"_N \( Q_r "supp" \( sigma_(j \, r) \) \) lt.eq D_(j \, r) "vol"_N \( Q_r \) \, #h(2em) D_(j \, r) = e^(o \( r \)) . $ <eq:profile-recurrence-denominator>]
  All estimates hold with common envelopes for the fixed finite list.
  For the $j$th switch, sample $s_(j \, 1) \, s_(j \, 2)$ independently with law $sigma_(j \, r)$, independently also for different $j$, and put $u_j = s_(j \, 1) s_(j \, 2)^(- 1)$. Its law is $sigma_(j \, r) * caron(sigma)_(j \, r)$. Apply Lemma 18 in the unimodular group $N$ with the compact set $Q_r$, the Borel set $S_r$, and these increment laws. The mass bound (6.10), the denominator bound (6.11), and the fixed depth $h$ give a starting point $n_0 in S_r$ such that
  $ bb(P) { n_0 u_1 dots.h.c u_j in S_r upright(" for every ") 1 lt.eq j lt.eq h } gt.eq e^(- o \( r \)) . $
  Thus every intermediate sheet in a successful sequence has a good profile.
  #emph[From parameter measure to endpoint volume.] The successful interval parameters have Lebesgue measure at least $e^(- o \( r \))$ in the fixed product cube, since the uniform product density is a fixed constant. In $E$-normalized logarithmic coordinates, the endpoint map for the increments is a polynomial of fixed degree with convergent bounded coefficients and a submersive limit, by our choice of scheme. Lemma 17, or equivalently Corollary 19, now gives accessible endpoint volume in $N$ at least
  #[#set math.equation(numbering: n => "(6.12)")
   $ exp #scale(x: 120%, y: 120%)[\(] r P \( E \) - o \( r \) #scale(x: 120%, y: 120%)[\)] . $ <eq:profile-accessible-volume>]
  If necessary, restrict the successful parameters to a compact subset of half their measure; this preserves the estimates and makes the image measurable. Left multiplication by $n_0$ preserves the volume. The rank conclusion is a property of the full fixed polynomial map, established before the successful restriction.
  #emph[Comparing source and image packing.] Take $d_p = Delta_r z$ as pivot. For each prescribed generator increment, travel along $Delta_r z exp_D \( r t v \)$ to a point where its weight attains $s_i \( E \)$, perform the increment, and return to the pivot on the new sheet. Lemma 12 gives an $o \( r \)$-length switch at that point; the two $D$ legs have length $O \( r \)$. The difference of two interval parameters is a single generator increment. We therefore do not need a good profile at the algebraic midpoint of $s_1 s_2^(- 1)$.
  All sheet states at which a $D$ leg is traversed belong to $S_r$. The images of these legs consequently have heights in
  $ pi F \( x \) + r #scale(x: 120%, y: 120%)[\(] f \( J \) + o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  The short switches contribute only $o \( r \)$ height errors by Lipschitzness. The finite concatenation has length $O \( r \)$, begins at $x n_0 d_p$, and ends at the fixed $D$ position $d_p$ on one of the accessible sheets.
  By Lemma 15, the endpoint volume (6.12) gives at least $exp \( r P \( E \) - o \( r \) \)$ source points separated by any prescribed fixed large constant. Choose this constant so their quasi-isometry images remain separated. Their image paths have a common start, length $O \( r \)$, and relative heights in $r \( f \( J \) - f \( z \) + o \( 1 \) \)$, since the starting profile value is $f_(r \, x \, n_0) \( z \) = f \( z \) + o \( 1 \)$. The compact set $f \( J \) - f \( z \)$ contains zero; enlarging it by a ball of radius tending to zero absorbs the error. Lemma 13, translation invariance of $P$, and its continuity for Hausdorff distance give the upper bound $exp \( r P \( f \( J \) \) + o \( r \) \)$ for the same separated points. Taking logarithms and dividing by $r$ proves (6.9). When $pi v = 0$ the claimed lower bound is zero; it is also immediate from nonnegativity of $P$. ◻
]

=== 6.3 A deterministic affinity criterion <a-deterministic-affinity-criterion>

We now use the two segment inequalities twice. At infinitesimal scale they force the horizontal derivative to be $A pi$ for a measurable label $A in cal(A)$. On whole segments, equality between support and positive variation fixes the weight signs along directions avoiding every weight hyperplane. The closures of the cones determined by these signs have extremal rays; passage to those directions gives enough affine line restrictions to obtain smoothness. The derivative label is consequently continuous, hence constant on the connected domain. The following criterion isolates this deterministic argument.

#thm([Lemma 6.6.])[
  (Affinity criterion).  #emph[Let $f : cal(U)_delta arrow.r W$ be continuous and locally Lipschitz along horizontal segments, with locally uniform bounds for unit horizontal velocities. Suppose that, for every segment $J = { z exp_oo \( t v \) : 0 lt.eq t lt.eq T } subset.double cal(U)_delta$, $T > 0$, both 
#[#set math.equation(numbering: n => "(6.13)")
 $ frac(f \( z exp_oo \( T v \) \) - f \( z \), T) in "conv" \( cal(A) pi v \) \, #h(2em) P \( f \( J \) \) gt.eq T p \( pi v \) $ <eq:affinity-two-inequalities>]

 hold. Then there exist $A in cal(A)$ and $b in W$ such that $f \( z \) = A pi z + b$ for all $z in cal(U)_delta$.]
] <lem:affinity-criterion>

#proof[
  #emph[Horizontal derivatives take values in the finite group.] Choose a basis of the first layer $V$ and its left-invariant vector fields on $D_oo$. Flow-box Fubini and linewise Lipschitzness give locally bounded distributional derivatives of $f$ in these directions. Their linear combinations define a measurable linear map $M \( z \) : V arrow.r W$. For each fixed $v$, it agrees almost everywhere with the line derivative in direction $v$: both are the distributional derivative along that field. These assertions may be made simultaneously for a countable dense set of $v$ by intersecting their full Haar-measure sets.
  At a point of line differentiability, the image of a short segment, translated to start at zero and divided by its length, converges in Hausdorff distance to the linear segment of velocity $M \( z \) v$. Indeed the definition of differentiability bounds the error uniformly on the entire sufficiently short one-sided interval. Differentiate (6.13) and use continuity and positive homogeneity of $P$ to obtain
  #[#set math.equation(numbering: n => "(6.14)")
   $ M v in "conv" \( cal(A) pi v \) \, #h(2em) p \( M v \) gt.eq p \( pi v \) $ <eq:affinity-derivative-constraints>]
  at the common full-measure points. Continuity in $v$ extends these constraints from the dense set to all of $V$.
  The first constraint makes $M$ vanish on $ker pi$, so $M = B pi$ for a linear map $B : W arrow.r W$. It also gives $p \( B w \) lt.eq p \( w \)$ by convexity, while the second constraint gives the reverse inequality. Thus $B$ is a linear isometry of $p$ and is invertible. The full linear isometry group of the polyhedral norm $p$ is finite: its elements permute the finitely many vertices of the unit ball, and those vertices span $W$. Average a Euclidean inner product over this full finite group. In its norm, $B w$ and every $A w$, $A in cal(A)$, have the same length. Strict convexity and the convex-hull inclusion force
  $ B w in { A w : A in cal(A) } #h(2em) \( w in W \) . $
  If $B$ differed from every $A in cal(A)$, the finitely many proper linear subspaces $ker \( B - A \)$ could not cover $W$. Hence $B in cal(A)$. We have proved
  #[#set math.equation(numbering: n => "(6.15)")
   $ M \( z \) = B \( z \) pi \, #h(2em) B \( z \) in cal(A) quad upright("for almost every ") z . $ <eq:affinity-label-field>]
  Choose any label on the remaining null set, so $B$ is a measurable finite-valued function throughout the domain.
  #emph[Equality of support and variation fixes weight signs.] Let $v$ have generic height $w = pi v$, meaning $alpha_i \( w \) eq.not 0$ for all $i$. Along almost every line of this direction, the absolutely continuous restriction $h \( t \) = f \( z exp_oo \( t v \) \)$ has derivative $B \( z exp_oo \( t v \) \) w$ almost everywhere. Thus $p \( h' \( t \) \) = p \( w \)$. We work on a compact interval $\[ 0 \, T \]$ inside such a line and translate $h$ to have $h \( 0 \) = 0$, which does not change $P$.
  For a word basis $cal(B)$, let $m_i \( cal(B) \)$ count all occurrences of $X_i$ in its words. Every generator is mandatory, so $m_i \( cal(B) \) gt.eq 1$. Choose a basis maximizing $P \( h \( \[ 0 \, T \] \) \)$, and put $q_i \( t \) = \( alpha_i compose h \)' \( t \)$. Then
  #[#set math.equation(numbering: n => "(6.16)")
   $ P \( h \( \[ 0 \, T \] \) \) & = sum_i m_i \( cal(B) \) max_(0 lt.eq t lt.eq T) alpha_i \( h \( t \) \)\
 & lt.eq sum_i m_i \( cal(B) \) integral_0^T \( q_i \( t \) \)_(+) thin d t lt.eq integral_0^T p \( h' \( t \) \) thin d t = T p \( w \) . $ <eq:affinity-support-variation>]
  The second inequality is the definition of $p$ as the maximum over word bases. The segment volume inequality supplies the reverse inequality between the outer quantities, so every inequality in (6.16) is equality. Since every $m_i \( cal(B) \)$ is positive, each scalar maximum has no deficit. If $t_i$ is a maximizing time for $alpha_i \( h \( t \) \)$, this says
  #[#set math.equation(numbering: n => "(6.17)")
   $ 0 = integral_0^(t_i) \( q_i \( t \) \)_(-) thin d t + integral_(t_i)^T \( q_i \( t \) \)_(+) thin d t . $ <eq:affinity-sign-order>]
  Consequently a negative derivative cannot occur, on a set of positive measure, before a positive derivative. On this interval each weight’s positive-sign indicator is nonincreasing, up to null sets.
  By Lemma 9, pullback by every label permutes the distinct oriented generator-weight rays. Genericity therefore makes every $q_i$ nonzero almost everywhere, and the number of positive signs among those distinct rays is independent of the label $B$. A finite collection of nonincreasing indicators with constant sum has each indicator constant almost everywhere. Thus all weight signs are constant along the line, on the interval under consideration. Applying this on a countable exhaustion of its open interval in $cal(U)_delta$ shows the following: if $w$ lies in a chamber of the generator-weight hyperplane arrangement, then almost all labels along the line send that chamber to the same chamber. Here each line meets $cal(U)_delta$ in an interval because its projected height moves linearly through a convex set.
  #emph[Extremal directions have constant horizontal derivative.] The chambers just used are the connected components of $W \\ union.big_i ker alpha_i$. Their closures are pointed polyhedral cones, since the weights span $W^(*)$. Let $w eq.not 0$ span an extremal ray $R$ of one of these closed cones, and choose a horizontal lift $v in V$.
  For each chamber $C_0$ whose closure contains $R$, choose generic vectors $v_j arrow.r v$ with $pi v_j in C_0$. We explain carefully why the almost-everywhere chamber agreement passes to this limiting direction. On a compact set of pairs $\( z \, s \)$ whose flows stay in the domain, the maps $z mapsto z exp_oo \( s v_j \)$ preserve Haar measure and converge uniformly to the corresponding map for $v$. Approximating the bounded measurable function $B$ by continuous functions on a larger compact set shows that
  $ B \( z exp_oo \( s v_j \) \) arrow.r B \( z exp_oo \( s v \) \) quad upright("in measure locally in ") \( z \, s \) . $
  The approximation errors are uniformly controlled by Haar invariance. Apply the same statement at a second time $t$; Fubini gives convergence in measure locally in $\( z \, s \, t \)$. After a subsequence both labels converge almost everywhere. We restrict to compact sets of triples for which the segment between the two limiting positions stays in the open domain; for large $j$ the nearby segments do so too. The preceding chamber argument applies to every $v_j$. Since the set of labels is finite, the relation that two labels have the same image of $C_0$ is closed. It follows that almost every such triple satisfies
  $ B \( z exp_oo \( s v \) \) overline(C)_0 = B \( z exp_oo \( t v \) \) overline(C)_0 . $
  There are only finitely many incident chambers. Intersect their full-measure sets, and then exhaust the domain of triples by compact sets.
  The intersection of the closures of all chambers incident to $R$ is exactly $R$. Indeed the active hyperplanes of an extremal ray cut down to its line; the remaining chamber inequalities select the half-line containing $w$. Equivalently, all hyperplanes through $w$ allow both neighboring signs among the incident chambers, while the other hyperplanes have the fixed sign of $w$. Intersecting the displayed equalities therefore shows that the two labels have the same image of $R$. They preserve the invariant Euclidean norm chosen above, so their values on $w$ are equal. Thus the derivative in direction $v$ is constant at almost every pair of positions on almost every such line. Absolute continuity makes $f$ affine on those lines.
  When $v in ker pi$, the first inequality in (6.13) already makes $f$ constant on every horizontal segment of direction $v$.
  #emph[Regularity makes the label constant on the domain.] The extremal rays of a full-dimensional pointed chamber span $W$. Choose finitely many lifts of such rays spanning a complement to $ker pi$ in $V$, and add a basis of $ker pi$. The resulting vectors $v_1 \, dots.h \, v_b$ span $V$. Let $Y_j$ be their left-invariant horizontal fields on $D_oo$. The line affinities just proved imply
  $ Y_j^2 f = 0 quad upright("in distributions") \, #h(2em) 1 lt.eq j lt.eq b . $
  For completeness, use flow coordinates for $Y_j$ and test against a compactly supported smooth function. Along almost every flow line the second distributional derivative of an affine function is zero. Integration in the transverse coordinates gives the displayed identity. The flow preserves Haar measure, so no divergence term occurs.
  The associated graded Lie algebra of $D$ is generated by its first layer $V$. Hence the fields $Y_j$ and their iterated brackets span the full tangent space everywhere. Hörmander’s sum-of-squares theorem #cite(label("Hormander1967")) Theorem 1.1 applies to $sum_(j = 1)^b Y_j^2$, componentwise in $W$, and makes $f$ smooth. All hypotheses are local on the open domain: the fields are smooth and real, the bracket condition holds at every point, and the right side is the smooth function zero.
  The horizontal derivative is now continuous. Its almost-everywhere membership in the finite set ${ A pi : A in cal(A) }$ from (6.15) extends to every point, since a full-measure subset is dense. The domain is connected, so that derivative is one constant $A pi$. Every horizontal derivative of $f - A pi$ vanishes; the same is then true for iterated brackets. Bracket generation makes its entire differential zero, and connectedness gives $f - A pi = b$ for one constant $b in W$. ◻
]

#thm([Proposition 6.7.])[
  (Affine profile limits).  #emph[For every fixed $delta$ with $0 < c delta < 1 \/ 2$ and every sequence in Definition 28, the profile laws are relatively compact. Every function in the support of every limiting law has the form 
#[#set math.equation(numbering: n => "(6.18)")
 $ f \( z \) = A pi z + b quad \( z in cal(U)_delta \) \, #h(2em) A in cal(A) \, quad b in W . $ <eq:affine-profile-limit>]

]
] <prop:affine-profiles>

#proof[
  Relative compactness and horizontal Lipschitz regularity were proved after Definition 28. Lemmas 31 and 32 supply both assumptions of Lemma 33 on every segment. That lemma gives (6.18). ◻
]

We record precisely the uniform consequence of this supported-law statement that will be used for additional suffixes. It does not yet select a single affine function for a whole chart.

#thm([Corollary 6.8.])[
  (Distance to the affine class).  #emph[Fix $delta$ as above, a function $epsilon \( r \) gt.eq 0$ tending to zero, a nonempty compact set $Z subset cal(U)_delta$, and $eta > 0$. Uniformly over the fixed family of map pairs, all $x in G$, and all deterministic $k_0 in B_r \( \( 1 + delta \) cal(C) \, e^(r epsilon \( r \)) \)$, 
#[#set math.equation(numbering: n => "(6.19)")
 $ bb(P)_a {min_(A in cal(A)) inf_(b in W) sup_(z in Z) parallel f_(r \, x \, a k_0) \( z \) - A pi z - b parallel gt.eq eta} arrow.r 0 . $ <eq:distance-to-affine-class>]

 The conclusion also holds when $k_0$ is sampled independently of $a$ from any probability supported in the same allowed suffix set. In that case every supported limiting profile is still affine on $cal(U)_delta$.]
] <cor:affine-profile-concentration>

#proof[
  For a continuous function on $Z$, its distance in the supremum norm to the set of restrictions of $A pi + b$ is a continuous, $1$-Lipschitz function of that continuous function. The affine restriction set is closed: take a subsequence with fixed $A$, and evaluate at one point of $Z$ to see that the offsets converge.
  If (6.19) failed, there would be a sequence of maps, basepoints, and deterministic allowed suffixes for which the displayed probability is bounded below by a positive constant. Profile compactness supplies a subsequential law limit. Proposition 34 supports that limit on the affine class. The event whose probability is bounded below is closed, so the Portmanteau inequality is a contradiction.
  For an independent random suffix, condition on its value. The bad probability is an average of deterministic bad probabilities, and hence is bounded by the same supremum, which tends to zero. For a compact exhaustion of $cal(U)_delta$, the zero sets of the continuous affine-distance functions are closed. For each compact in the exhaustion and each $eta > 0$, the Portmanteau inequality for the open event that this distance exceeds $eta$ shows that its limiting probability is zero. Thus every limiting law is supported on functions affine on all these compact sets. Use a constant-label subsequence and evaluate at a fixed point to see that their labels and offsets are compatible across the exhaustion; equivalently, the class of functions affine on the entire domain is closed in $C_(upright("loc")) \( cal(U)_delta \, W \)$.
  The function $epsilon \( r \)$ was fixed before taking the limit. This assertion is not a supremum over all possible subexponential envelopes at one finite scale. Nor does it assert concentration near one particular pair $\( A \, b \)$: different affine profiles may still occur in the limiting law. ◻
]

== 7 Agreement of neighboring linear labels <sec:neighbor-labels>

The affine profiles of Proposition 34 may initially have different linear parts, or #emph[labels], on different sheets. We now exclude that possibility for sheets joined by one generator step of the enlarged chart width. The argument uses only the local affine profiles. In particular, it does not use a global sublinear estimate, or equality of their affine offsets.

We retain the polytope $cal(C)$, the domain $cal(U)_delta$, and the profiles $f_(r \, x \, n)$ from Definition 28. All limits below are along sequences $r arrow.r oo$. A factor $e^(o \( r \))$ has one common vanishing envelope throughout each finite construction. The constants defining the family of Lipschitz quasi-isometry pairs are fixed.

#thm([Proposition 7.1.])[
  (Neighboring labels).  #emph[There is $delta_1 > 0$, depending only on the fixed group and the uniform quasi-isometry bounds, with the following property. Fix $0 < delta lt.eq delta_1$. Let $F$, $x$, and the following suffixes and steps vary with $r$: 
$ a tilde.op frac(1_(B_r \( cal(C) \)), "vol" B_r \( cal(C) \)) thin d n \, #h(2em) n = a k_0 \, #h(2em) k_0 in B_r \( \( 1 + delta \) cal(C) \, e^(o \( r \)) \) \,\
k = exp \( t X_i \) \, quad \| t \| lt.eq e^(\( 1 + delta \) r s_i \( cal(C) \) + o \( r \)) . $

 The suffix and step are deterministic. Every pair in the support of a limiting joint law of $\( f_(r \, x \, n) \, f_(r \, x \, n k) \)$ has the form 
$ \( A pi z + b_1 \, med A pi z + b_2 \) #h(2em) \( z in cal(U)_delta \) $

 for a common $A in cal(A)$ and some $b_1 \, b_2 in W$.]
] <prop:neighbor-labels>

The contradiction comes from reflecting an inward height segment at a facet of $cal(C)$. If the proposition failed for arbitrarily small enlargements, the two limiting affine maps would agree on that facet, and their relative linear map would be a reflection. An inward source segment $E$ would then have two opposite target images relative to the common value at its facet endpoint. Each image has volume exponent $P \( E \)$, while their union has exponent $2 P \( E \)$.

We will alternate finite sequences of switches on the two sheets. Their source terminal points remain reachable over $E$, so their separated count has exponent at most $P \( E \)$. To force the larger target exponent, we retain a large joint volume of successive endpoints. The polynomial image estimate then turns the corresponding target increments into terminal volume with exponent $2 P \( E \)$. The next lemma supplies the intervening passage from separated endpoint tuples to volume in lifted $N$ coordinates, allowing $N ∩ D eq.not { 1 }$. Write $q : N times.r D arrow.r G$ for the multiplication map.

#thm([Lemma 7.2.])[
  (Volume from endpoint tuples).  #emph[Fix a positive integer $h$ and compact sets $E_1 \, dots.h \, E_h subset W$ containing $0$. Suppose that, for each $r$, there are $M_r$ tuples $\( y_1 \, dots.h \, y_h \) in G^h$, separated by a sufficiently large fixed constant in the maximum product metric. Let $y_0$ be a common basepoint. Suppose each tuple admits lifts relative to $y_0$ of the form 
$ y_0^(- 1) y_j = q \( U_1 dots.h.c U_j \, d_j \) \, #h(2em) U_j in B_r \( E_j \, e^(o \( r \)) \) \, #h(2em) \| d_j \|_D lt.eq C r \, quad parallel pi d_j parallel = o \( r \) \, $

 with common bounds for all tuples. Then there is a measurable set $cal(T)_r subset N^h$ of increments satisfying the same box bounds, with possibly larger subexponential factors, such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ "vol"_(N^h) \( cal(T)_r \) gt.eq M_r e^(- o \( r \)) . $ <eq:tuple-lift-volume>]

 Every product $u_1 dots.h.c u_h$ from $cal(T)_r$ has an accompanying $d in D$ with $\| d \|_D = O \( r \)$ and $pi d = o \( r \)$ whose projection lies a bounded distance from one of the listed terminal points $y_0^(- 1) y_h$. Moreover, the $N$-coordinate volume of all such pairs projecting into any one ball of fixed radius in $G$ is at most $e^(o \( r \))$.]
] <lem:tuple-lift-volume>

#proof[
  Choose one lift for each endpoint of each tuple. Thicken each total lift $\( U_1 dots.h.c U_j \, d_j \)$ by multiplying it on the right by a fixed small compact neighborhood in $N times.r D$. Its projected diameter is uniformly bounded, because $q$ is a homomorphism. The resulting product neighborhoods in $\( N times.r D \)^h$ are disjoint: their projections are contained in disjoint neighborhoods of the separated tuples. Each has the same positive Haar volume. Here product Haar on $N times.r D$ is both left and right invariant, by unimodularity and the determinant-one $D$ action on $N$.
  All their $D$ coordinates lie in a ball of radius $O \( r \)$, of polynomial Haar volume. Fubini therefore shows that their projection to the total $N$ coordinates has volume at least $M_r$ divided by a polynomial in $r$. The map
  $ \( v_1 \, dots.h \, v_h \) mapsto \( v_1 \, v_1^(- 1) v_2 \, dots.h \, v_(h - 1)^(- 1) v_h \) $
  preserves product Haar: successively, each changed variable undergoes a left translation. Apply it to this projected set to obtain $cal(T)_r$.
  To check its bounds, write a thickened total $N$ coordinate as $\( U_1 dots.h.c U_j \) eta_j$. Right multiplication of its full lift by a bounded factor makes $eta_j = "Ad"_(d_j) \( a_j \)$ for $a_j$ in a fixed compact subset of $N$. The small height and polynomial unipotent bound give $parallel log eta_j parallel lt.eq e^(o \( r \))$. The new increment is $eta_(j - 1)^(- 1) U_j eta_j$, with $eta_0 = 1$. Since $0 in E_j$, all word widths of $E_j$ are nonnegative, and the box product estimates put this new increment in $B_r \( E_j \, e^(o \( r \)) \)$. Every projected total coordinate has at least one accompanying $D$ tuple from the thickened set; this proves the assertion about terminal products as well as (7.1).
  For completeness, consider two admissible pairs $\( u \, d \)$ and $\( tilde(u) \, tilde(d) \)$ whose projections lie in the same ball of fixed radius. Lift their bounded group difference as $q \( a \, b \)$ with $a in N$ and $b in D$ in fixed compact sets. Equality in $G$ gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ u^(- 1) tilde(u) = "Ad"_d \( a \) z \, #h(2em) z = d b tilde(d)^(- 1) in D ∩ N . $ <eq:tuple-overlap>]
  The first factor has log norm at most $e^(o \( r \))$. The second has $D$-length $O \( r \)$ and hence polynomial log coordinates, by Lemma 6. The logarithm of their product is therefore bounded by $e^(o \( r \))$. Once one admissible pair is fixed, all the other $N$ coordinates in the ball lie in a left translate of an $N$ log ball of radius $e^(o \( r \))$. Its Haar volume is $e^(o \( r \))$. This is also the specific instance of Lemma 16 needed here. Notice that (7.2) bounds the entire overlap, without assuming it is central or discrete. ◻
]

#proof[
  Both profiles are covered by Proposition 34, since multiplying the allowed suffix by $k$ preserves its enlarged box bound. Suppose the asserted equality of labels fails for arbitrarily small positive $delta$. We explain first the limiting geometry and then compare source and target volumes.
  ===== 7.1 A reflection at a facet. <a-reflection-at-a-facet.>
  Choose violating $delta arrow.r 0$. Passing to a subsequence fixes the letter $X_i$ and distinct labels $A_1 \, A_2 in cal(A)$. Compactness of the profiles allows their offsets to converge to $b_1 \, b_2$. Diagonalize in the scales so that there are Borel sets
  $ Q_r = B_r \( cal(C) \) k_0 \, #h(2em) S_r subset Q_r \, #h(2em) frac("vol" S_r, "vol" Q_r) gt.eq e^(- o \( r \)) \, $
  on which the two profiles converge to $A_1 pi z + b_1$ and $A_2 pi z + b_2$ on every required compact set over $cal(C)$. To justify the mass assertion, fix each approximation tolerance first. A neighborhood of a point in a limiting support has positive probability. Take its scale sufficiently large that the negative logarithm of this probability divided by $r$ is arbitrarily small, then decrease the tolerance. A compact exhaustion permits any later fixed finite collection of paths. The domains $cal(U)_delta$ exhaust the inverse image of $"int" cal(C)$; equicontinuity on compact subsets of $D_oo$ extends this convergence to the boundary along the same diagonal. Also $k_0 \, k in B_r \( cal(C) \, e^(o \( r \)) \)$ on this diagonal.
  At a height in the facet
  $ H_i = { w in cal(C) : alpha_i \( w \) = s_i \( cal(C) \) } \, $
  the points on the two sheets are a distance $o \( r \)$ apart: conjugate the step by a $D$ position at that height and use Lemma 11. Thus the limiting affine maps agree on the relative interior of the entire facet. Their linear parts satisfy
  $ A_1^(- 1) A_2 v = v #h(2em) \( v in ker alpha_i \) . $
  Choose an inner product invariant under the finite group $cal(A)$. An orthogonal map fixing a hyperplane pointwise is either the identity or its orthogonal reflection. Since $A_1 eq.not A_2$, the map $A_1^(- 1) A_2$ is this reflection.
  Let $p_0$ be the contact point in the relative interior of $H_i$ and let $v$ be its reflection normal, chosen with $alpha_i \( v \) > 0$. For a sufficiently small fixed $epsilon.alt > 0$ put
  $ E_0 = \[ - epsilon.alt v \, 0 \] \, #h(2em) E = p_0 + E_0 subset cal(C) \, #h(2em) E'_1 = A_1 E_0 \, #h(2em) E'_2 = A_2 E_0 = - A_1 E_0 . $
  The common affine value at $p_0$ is the target pivot. Translation invariance and segment homogeneity of $P$ give
  #[#set math.equation(numbering: n => "(7.3)")
   $ P \( E'_1 \) = P \( E'_2 \) = P \( E \) = epsilon.alt p \( v \) > 0 \, #h(2em) P \( E'_1 union E'_2 \) = 2 P \( E \) . $ <eq:reflection-doubling>]
  Figure 1 depicts these source and target segments.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1.65, 2.5), [#text(size: 9pt)[Source heights]])
  rect((-0.1, -0.15), (2.75, 2.12), fill: rgb("#f2f2ff"), stroke: none)
  line((2.75, -0.2), (2.75, 2.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((2.65, 1.78), [#text(size: 9pt)[$alpha_i=s_i( cal(C) )$]], anchor: "east", padding: 0.1176cm)
  line((0.55, 0.95), (2.75, 0.95), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((0.55, 0.95), radius: 0.05997, fill: black, stroke: none)
  circle((2.75, 0.95), radius: 0.05997, fill: black, stroke: none)
  content((0.55, 0.95), [#text(size: 9pt)[$p_0- epsilon v$]], anchor: "north", padding: 0.1176cm)
  content((2.75, 0.95), [#text(size: 9pt)[$p_0$]], anchor: "west", padding: 0.1176cm)
  content((1.55, 0.95), [#text(size: 9pt)[$E=p_0+E_0$]], anchor: "south", padding: 0.1176cm)
  content((1.6, -0.55), [#text(size: 9pt)[$P(E)=P(E_0)>0$]])
  content((7, 2.5), [#text(size: 9pt)[Target heights relative to the pivot]])
  line((7, 0.95), (4.95, 0.95), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((7, 0.95), (9.05, 0.95), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  circle((7, 0.95), radius: 0.05997, fill: black, stroke: none)
  content((7, 0.95), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((5.9, 0.95), [#text(size: 9pt)[$E'_1=A_1E_0$]], anchor: "south", padding: 0.1176cm)
  content((8.1, 0.95), [#text(size: 9pt)[$E'_2=-A_1E_0$]], anchor: "south", padding: 0.1176cm)
  content((7, -0.55), [#text(size: 9pt)[$P(E'_1 union E'_2)=2P(E_0)$]])
})],
    caption: [Figure 1: The height geometry of the reflection contradiction. The two affine profiles agree at the facet pivot and send the inward segment to opposite target segments. Alternating bundles detect the volume exponent of their union. The picture is schematic: the exponential counts come from bracket-generated boxes, and the volume argument accounts for the nonuniqueness of lifts to $N times.r D$. ],
  ) <fig:reflection>
  ===== 7.2 Source bundles with a large joint volume. <source-bundles-with-a-large-joint-volume.>
  At a pivot $d_p in D$ of height $r p_0$ and $D$-length $O \( r \)$, alternate two sorts of bundles. A first-sheet bundle updates the pair state by $n mapsto n u$. A second-sheet bundle updates it by $n mapsto n k u k^(- 1)$; on that sheet this is the generator movement $n k mapsto n k u$. Each bundle consists of a fixed finite sequence of generator increments with widths $e^(r s_j \( E \))$ and with independent difference-of-interval parameters before restrictions are imposed.
  We choose the source schemes and their number before restricting parameters to good sheets. Pass to a subsequence on which the normalized bracket laws for $E$, $E'_1$, $E'_2$, and $E'_1 union E'_2$ converge, together with the bounded linear embeddings from either individual target normalization into the union normalization.
  The number of bundles is determined by multiplication in the target. Consider the polynomial map multiplying alternating increments from the two target boxes, with output normalized to $E'_1 union E'_2$. For a sufficiently large fixed number $h$ of increments, its limiting map is submersive. Indeed, every union-scaled generator attains its support maximum in one of the two sets. Its limiting vector therefore belongs to the image of the corresponding limiting embedding. These vectors bracket-generate the union-normalized limiting algebra. Finite products of exponentials from the two embedding images have a submersive endpoint map: their conjugates span the generated Lie algebra, and one inserts variable increments with those conjugates as differentials. Inserting identity factors makes the product alternating. Fix such an $h$. This rank property belongs to the full multiplication map, before any target increments have been selected.
  For each of the $h$ source bundles, Lemma 10 supplies an $E$-normalized generator scheme with a submersive limiting product map. Represent its scalar parameters as independent differences of interval parameters. The schemes and their total number of switches are now fixed. These choices depend only on the normalized algebra data, not on $S_r$ or the support tolerances. Passing to this subsequence preserves the profile approximations and the bound $"vol" S_r \/ "vol" Q_r gt.eq e^(- o \( r \))$. All the scaled $D$-legs lie in one compact subset over $cal(C)$, including their facet pivots. The boundary convergence just established therefore controls their profiles.
  Apply backward recurrence to the individual switches in these bundles. For a first-sheet switch with interval law $sigma$, the increment law is $sigma * caron(sigma)$. For a second-sheet switch it is $sigma_k * caron(sigma)_k$, where $sigma_k = \( "Ad"_k \)_(*) sigma$ is the conjugated interval law. Thus all switches have the form required by Lemma 18, with a depth independent of $r$.
  Every recurrence denominator in Lemma 18 is at most $e^(o \( r \)) "vol" Q_r$. Indeed the supports in question are products of a fixed number of $k_0^(plus.minus 1)$, $k^(plus.minus 1)$, and generator intervals fitting the $cal(C)$ widths, all with subexponential factors. The box calculus bounds the volume of the corresponding support enlargements by $e^(o \( r \)) "vol" B_r \( cal(C) \)$. Hence backward recurrence supplies a nonempty Borel subset of $S_r$ such that each initial state in that subset has conditional successful parameter probability at least $e^(- o \( r \))$, with every intermediate pair state in $S_r$. Fix one such state $n_0$.
  Apply Corollary 19 to the map from all bundle parameters to the tuple of their products #emph[before] the conjugations by $k$ and before accumulation. The normalized map is the product of $h$ submersive limiting polynomial maps. The normalized pairs of interval parameters have a fixed bounded joint density with respect to Lebesgue measure. Thus the successful probability just proved gives successful Lebesgue measure at least $e^(- o \( r \))$, even though the restricted coordinates are correlated. The image consequently contains a compact set of $N^h$ Haar volume at least $e^(r h P \( E \) - o \( r \))$. Conjugation by $k$ preserves Haar on $N$, and the change from successive increments to successive states is triangular and Haar preserving. Consequently the admissible tuples $\( n_1 \, dots.h \, n_h \)$ of bundle-end states have the same lower volume. This application takes place before conjugation, so it requires no coefficient bound for a conjugation written in $E$-normalized coordinates.
  By Lemma 15, the corresponding tuples
  $ #scale(x: 120%, y: 120%)[\(] F \( x n_1 d_p \) \, dots.h \, F \( x n_h d_p \) #scale(x: 120%, y: 120%)[\)] $
  have a separated-count lower bound $e^(r h P \( E \) - o \( r \))$. Take the source separation sufficiently large that the quasi-isometry preserves a fixed target separation. On the source side each terminal point $x n_h d_p$ is reachable from $x n_0 d_p$ by a path of length $O \( r \)$ whose relative heights lie in $r \( E_0 + o \( 1 \) \)$. Use the $D$ legs over $E$ and return to the pivot after each generator switch. Second-sheet bundles use $o \( r \)$ bridges at the pivot. Lemma 13 therefore bounds the covering number of all source terminal points by
  #[#set math.equation(numbering: n => "(7.4)")
   $ e^(r P \( E \) + o \( r \)) $ <eq:source-reflection-count>]
  at every fixed radius.
  ===== 7.3 Target products have twice the terminal exponent. <target-products-have-twice-the-terminal-exponent.>
  Put $y_j = F \( x n_j d_p \)$. The successful profiles imply that the transition from $y_(j - 1)$ to $y_j$ has a path of length $O \( r \)$ with relative height set $r \( E'_(tau \( j \)) + o \( 1 \) \)$, where $tau \( j \)$ alternates between $1$ and $2$. All pivot height differences are $o \( r \)$, since the two limiting affine profiles agree at $p_0$ and every intermediate state is good. Choose lifts of these paths. On accumulating them, the preceding $D$ factors have height $o \( r \)$ and length $O \( r \)$; their conjugations preserve the indicated box widths up to subexponential factors. The endpoint lifts thus have the form
  $ \( u'_1 dots.h.c u'_j \, d'_j \) \, #h(2em) u'_j in B_r \( E'_(tau \( j \)) \, e^(o \( r \)) \) \, #h(2em) \| d'_j \|_D = O \( r \) \, quad pi d'_j = o \( r \) . $
  Apply Lemma 37 to the separated target tuples. It gives a measurable increment set of Haar volume at least $e^(r h P \( E \) - o \( r \))$. Dividing each factor by its box determinant shows that this set has Lebesgue measure at least $e^(- o \( r \))$ in the joint individual-box log coordinates. These coordinates lie in a cube of radius $e^(o \( r \))$.
  Apply the alternating multiplication map used to choose $h$, with output normalized to $E'_1 union E'_2$. Its degree is fixed, its coefficients are bounded by the box calculus, and its limit is submersive by that earlier choice. These properties concern the full map and therefore remain available for the measurable increment set just obtained.
  Lemma 17, applied to the measurable increment set, gives a compact set of terminal $N$ coordinates of volume at least
  $ e^(r P \( E'_1 union E'_2 \) - o \( r \)) = e^(2 r P \( E \) - o \( r \)) . $
  Every such terminal coordinate has an accompanying $D$ coordinate of length $O \( r \)$ and height $o \( r \)$ projecting near an image terminal. The last assertion of Lemma 37 bounds its volume over any fixed-radius projected ball by $e^(o \( r \))$. But (7.4) and the quasi-isometry cover all image terminals by only $e^(r P \( E \) + o \( r \))$ fixed-radius balls. This is a contradiction because $P \( E \) > 0$. The labels therefore agree for every sufficiently small fixed $delta$, as asserted. ◻
]

The preceding comparison leaves the offsets undetermined. For fixed $delta$, a generator step can require a height exceeding the facet by order $delta r$; co-location alone would therefore leave an error of order $delta$ in the normalized affine offsets. The next section eliminates this error by a separate quotient-volume comparison.

== 8 Comparing the offsets of neighboring sheets <sec:neighbor-offsets>

Proposition 36 gives a common linear label for neighboring sheet profiles. It does not yet identify their constant terms. At a fixed positive chart enlargement, the direct bridge between the sheets can have length proportional to that enlargement times the scale. We retain this error and compare volumes in suitable nilpotent quotients. Their Haar multipliers will detect each component of the difference of the offsets.

=== 8.1 Quotients associated to cones of weights <quotients-associated-to-cones-of-weights>

We first construct the quotients used in the comparison. A word in the generators $X_i$ is called #emph[pure for $S$] if every letter has weight in $S$, and #emph[mixed for $S$] otherwise. These terms will always refer to the cone specified in the same argument.

#thm([Lemma 8.1.])[
  (Cone quotients and their Haar multipliers).  #emph[Let $S subset W^(*)$ be either the closed positive ray generated by a generator weight $alpha$, or the closed cone generated by two linearly independent generator weights $alpha \, lambda$. The span $frak(i)_S$ of the mixed words is a $frak(d)$-invariant ideal of $frak(n)$ containing $frak(d) ∩ frak(n)$. Put 
$ I_S = exp_N \( frak(i)_S \) \, #h(2em) L_S = N \/ I_S . $

 The group $I_S$ is closed, and $L_S$ is connected, simply connected, and nilpotent. Every compact subset of $L_S$ has compact lifts in $N$ and hence in $G$. There is a well-defined action of $G$ on $L_S$ under which $N$ acts by left translations and $D$ acts by its induced conjugation automorphisms. Write 
$ p_S \( g \) = g dot.op 1_(L_S) . $

 Then $p_S \( g h \) = g dot.op p_S \( h \)$ and the stabilizer of $1_(L_S)$ is $I_S D$. There is a linear form $ell_S in W^(*)$ such that, for every Haar-measurable $E subset L_S$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ "vol"_(L_S) \( g dot.op E \) = e^(ell_S \( pi g \)) "vol"_(L_S) \( E \) . $ <eq:cone-haar-multiplier>]

 The form $ell_S$ is the sum of the weights of $frak(n) \/ frak(i)_S$, counted with their dimensions. It can be expressed as a nonnegative integral combination of the inside generator weights, with a positive coefficient for every inside generator. In particular, it is a positive multiple of $alpha$ in the ray case, and it has the form $c alpha + d lambda$, with $c \, d > 0$, in the two-generator case.]
] <lem:cone-quotients>

#proof[
  Bracketing a mixed word with any generator produces another mixed word. The derivation identity and the Jacobi identity therefore show that their span is the ideal generated by the outside letters. Homogeneous bracket words span $frak(n)$. If a weight $gamma$ lies outside $S$, a word of weight $gamma$ cannot be pure: a sum of inside weights belongs to $S$. Consequently the entire generalized weight space $frak(n)_gamma$ lies in $frak(i)_S$ whenever $gamma in.not S$. For $v in frak(d)$ and an outside letter $X_i$, the vector $\[ v \, X_i \]$ stays in $frak(n)_(alpha_i)$ and hence in $frak(i)_S$. Applying the derivation identity to words proves $\[ frak(d) \, frak(i)_S \] subset frak(i)_S$. This argument includes the nilpotent parts of the generalized weight actions.
  Both possible cones $S$ are pointed. A nonempty sum of their nonzero inside weights cannot be zero. The quotient algebra is spanned by pure words, so it has no zero generalized weight space. The zero weight space of $frak(n)$ is therefore contained in $frak(i)_S$; in particular $frak(d) ∩ frak(n) subset frak(i)_S$. The exponential descriptions of the subgroups give $N ∩ D subset I_S$. The ideal exponentiates to a closed subgroup because the exponential map is a diffeomorphism and $frak(i)_S$ is a closed linear subspace. The Baker–Campbell–Hausdorff group on $frak(n) \/ frak(i)_S$ identifies with $N \/ I_S$: the algebra quotient induces a surjective group homomorphism with kernel $I_S$. This realizes $L_S$ as a connected, simply connected nilpotent Lie group. A linear section of the algebra quotient, composed with its logarithm and the exponential map of $N$, gives a continuous section $L_S arrow.r N$. Images of compact sets under this section are compact, proving the lifting assertion.
  The action of $N times.r D$ on $L_S$ is
  $ \( n \, d \) dot.op \( x I_S \) = n \( d x d^(- 1) \) I_S . $
  The kernel of the multiplication map $N times.r D arrow.r G$ consists of $\( h^(- 1) \, h \)$ with $h in N ∩ D$. Its action sends $x I_S$ to $x h^(- 1) I_S = x I_S$. Thus the action factors through $G$, without requiring that the multiplication map be injective. If $g = n d$, its value at the identity is $n I_S$, proving the stabilizer assertion and the stated equivariance of $p_S$.
  Translations by $N$ preserve quotient Haar measure. The determinant of the $D$-action is the exponential of its trace character; its unipotent parts have determinant one. The weight description thus gives (8.1). To check its positivity assertion, project to the abelianization of $frak(n)$. The image of $frak(i)_S$ there is exactly the span of the outside generator images. The inside generator images remain linearly independent in the quotient abelianization. They can be included in a basis of $frak(n) \/ frak(i)_S$ selected from pure words. Summing that basis’s weights proves the asserted integral combination. Every inside weight in a two-generator cone is a nonnegative real combination of its two defining weights, and each defining generator itself survives. Both extremal coefficients are therefore positive. ◻
]

For a ray we also use the notation $I_alpha \, L_alpha \, p_alpha \, ell_alpha$. These objects depend on the oriented ray, rather than its representative. For $A in cal(A)$ and a cone $S$, put $S' = \( A^(*) \)^(- 1) S$. Lemma 9 ensures that $S'$ is a cone of the same permitted kind, defined by the corresponding target generator rays.

=== 8.2 Ideal boxes and a covering with controlled cardinality <ideal-boxes-and-a-covering-with-controlled-cardinality>

The quotient Haar multiplier will measure the difference between the two offsets. To make that comparison, we will cover the ideal coordinates by translates of a smaller box and bound their number by the ratio of the two box volumes.

Fix a cone $S$ as above and a Euclidean norm on $W$. Write $I := I_S$. Define

$ T_(*) = { v in W : parallel v parallel lt.eq 1 \, med beta \( v \) lt.eq 0 upright(" for every ") beta in S } \, #h(2em) T_j = epsilon.alt_j T_(*) \, quad j in { 2 \, 1 \, + } \, $

where $0 < epsilon.alt_2 < epsilon.alt_1 < epsilon.alt_(+)$. An inside weight has support maximum zero on $T_(*)$. If $beta in.not S$, separation from the closed convex cone gives a vector nonpositive on $S$ and strictly positive on $beta$. Rescaling that vector into the unit ball proves $max_(T_(*)) beta > 0$. Hence

#[#set math.equation(numbering: n => "(8.2)")
 $ h_Z \( T_j \) & = epsilon.alt_j c_Z \, #h(2em) c_Z := h_Z \( T_(*) \) > 0 &  & upright("for every mixed word ") Z \,\
h_Z \( T_j \) & = 0 &  & upright("for every pure word ") Z . $ <eq:cone-word-widths>]

Select a maximal-width basis of $frak(i)_S$ from mixed words and use it to define the ideal box $B_r^I \( T_j \, L \)$, by the same scaled-log-coordinate construction as $B_r \( T_j \, L \)$. The same basis can be used for all three $j$, since their widths differ by a positive scalar factor. Complete it to a basis of $frak(n)$ by pure words whose quotient images form a basis. This is a maximal-width basis of the whole algebra. Indeed any basis with too few mixed vectors can replace an excess pure vector by a mixed vector, increasing its total width. Once its mixed vectors form a basis of $frak(i)_S$, their maximal possible total is the one selected above, and the remaining widths are zero. Thus, with $P_j = P \( T_j \)$,

#[#set math.equation(numbering: n => "(8.3)")
 $ "vol"_I B_r^I \( T_j \, L \) asymp L^(dim I) e^(r P_j) quad upright("for fixed ") L > 0 . $ <eq:ideal-box-volume>]

The normalized multiplication and word-expansion bounds of Lemma 8 apply to these ideal boxes as well: brackets of mixed words remain mixed, and their word widths add.

We will also use coordinates separating this ideal from its quotient. Choose a linear section $sigma : frak(n) \/ frak(i)_S arrow.r frak(n)$ whose image is spanned by the selected pure words. The map

#[#set math.equation(numbering: n => "(8.4)")
 $ \( i \, z \) mapsto i exp_N #scale(x: 120%, y: 120%)[\(] sigma \( log_(L_S) z \) #scale(x: 120%, y: 120%)[\)] $ <eq:ideal-section-coordinates>]

is a bijection from $I_S times L_S$ to $N$. Projection determines $z$, and then determines $i$. Both this map and its inverse are polynomial in log coordinates by the nilpotent product formula. We verify explicitly that product Haar measure in these coordinates is Haar measure on $N$, up to a fixed scalar. Write $s \( z \) = exp_N \( sigma \( log_(L_S) z \) \)$. For $a in N$, with quotient image $macron(a) in L_S$, left multiplication acts on these coordinates by

$ a thin i thin s \( z \) = #scale(x: 120%, y: 120%)[\(] "Ad"_a \( i \) c_a \( z \) #scale(x: 120%, y: 120%)[\)] s \( macron(a) z \) \, #h(2em) c_a \( z \) = a s \( z \) s \( macron(a) z \)^(- 1) in I . $

The inner automorphism $"Ad"_a \|_I$ has determinant one, since its differential is the exponential of a nilpotent derivation. The group $I$ is unimodular, so right translation by $c_a \( z \)$ also preserves its Haar measure. Meanwhile $z mapsto macron(a) z$ preserves Haar measure on $L_S$. Fubini proves invariance of the pushed-forward product measure under every left translation by $a$. The coordinate diffeomorphism makes this measure a nonzero Radon measure, so uniqueness of Haar measure proves the assertion. For a common sequential subexponential envelope, the box calculus gives

#[#set math.equation(numbering: n => "(8.5)")
 $ n in B_r \( T_j \, e^(o \( r \)) \) quad arrow.l.r.double quad i in B_r^I \( T_j \, e^(o \( r \)) \) \, quad parallel log_(L_S) z parallel lt.eq e^(o \( r \)) \, $ <eq:ideal-section-boxes>]

where the envelope may be enlarged on either side. To see the forward implication, use the adapted maximal basis: projection retains only its zero-width pure coordinates. Multiplying by the inverse section then leaves an ideal element in the same enlarged box. Conversely, the section of a subexponential quotient log ball lies in the zero-width part of the box, and multiplication gives the assertion.

#thm([Lemma 8.2.])[
  (Strict-width covering and absorption).  #emph[Fix the cone, radii, and a letter $X_i$ with weight $alpha in S$. Fix also $M > 0$. For all sufficiently small fixed $delta > 0$, the following claims hold along every sequence $r arrow.r oo$. Suppose 
$ k_q = exp \( t_q X_i \) \, #h(2em) \| t_q \| lt.eq e^(M delta r + o \( r \)) . $

 There is a measurable partition of $B_r^I \( T_1 \)$ into sets indexed by anchors $i_kappa in B_r^I \( T_1 \)$, with 
#[#set math.equation(numbering: n => "(8.6)")
 $ upright("tile")_kappa & subset i_kappa k_q B_r^I \( T_2 \, O \( 1 \) \) k_q^(- 1) \, & \# { kappa } & lt.eq e^(r \( P_1 - P_2 \) + o \( r \)) \,\
k_q^(- 1) i_kappa k_q & in B_r^I \( T_(+) \, O \( 1 \) \) . $ <eq:cone-tiles>]

 Moreover, if $u in B_r \( T_2 \, e^(o \( r \)) \)$ and $e_r in N$ satisfies $parallel log_N e_r parallel lt.eq e^(M delta r + o \( r \))$, the ideal coordinate of $u e_r$ in (8.4) belongs to $B_r^I \( T_2 \, e^(o \( r \)) \)$. These statements hold simultaneously for any fixed finite collection of the cones, templates, and their images under $cal(A)$, after decreasing $delta$.]
] <lem:strict-width-tiling>

#proof[
  If $Z$ is mixed, adjoining occurrences of $X_i$ does not change its width on $T_(*)$, because $s_i \( T_(*) \) = 0$. In
  $ "Ad"_(k_q) Z = sum_(p = 0)^(m - 1) frac(t_q^p, p !) \( "ad" X_i \)^p Z \, $
  every nonzero term is mixed and has the same $c_Z$. Its added exponential cost is at most $p M delta r + o \( r \)$. Expanding a word in a maximal-width ideal basis uses only basis vectors whose widths are at least its own, by basis exchange. Consequently the positive differences
  $ \( epsilon.alt_1 - epsilon.alt_2 \) c_Z \, #h(2em) \( epsilon.alt_(+) - epsilon.alt_1 \) c_Z $
  absorb all those costs if $delta$ is sufficiently small. There are only finitely many words and $p < m$. Their positive gaps also absorb the common $o \( r \)$ envelope. We obtain
  $ k_q B_r^I \( T_2 \, 1 \) k_q^(- 1) subset B_r^I \( T_1 \, O \( 1 \) \) \, #h(2em) k_q^(- 1) B_r^I \( T_1 \, 1 \) k_q subset B_r^I \( T_(+) \, O \( 1 \) \) . $
  Put $Q_r = k_q B_r^I \( T_2 \, 1 \) k_q^(- 1)$. Choose a maximal disjoint family $i_kappa Q_r$ with anchors in $B_r^I \( T_1 \)$. Such a family is finite: each set lies in $B_r^I \( T_1 \, O \( 1 \) \)$, by the first inclusion and normalized multiplication. Conjugation by $k_q$ preserves Haar on $I_S$, since its derivative is the exponential of the nilpotent map $"ad" \( t_q X_i \) \|_(frak(i)_S)$ and has determinant one. Dividing volumes in (8.3) bounds the number of anchors by $O \( e^(r \( P_1 - P_2 \)) \)$. Maximality implies that every translate $i Q_r$, for $i in B_r^I \( T_1 \)$, meets some $i_kappa Q_r$. Hence
  $ B_r^I \( T_1 \) subset union.big_kappa i_kappa Q_r Q_r^(- 1) subset union.big_kappa i_kappa k_q B_r^I \( T_2 \, O \( 1 \) \) k_q^(- 1) . $
  Assign a point to the first set containing it. This gives the measurable partition, and the second inclusion above proves (8.6).
  For the last assertion write $u = i exp_N sigma \( s \)$, where $i in B_r^I \( T_2 \, e^(o \( r \)) \)$ and $parallel s parallel lt.eq e^(o \( r \))$, using (8.5). Factor
  $ exp_N sigma \( s \) e_r = i_(e_r) exp_N sigma \( s_(e_r) \) . $
  The polynomial coordinate maps show that $parallel log i_(e_r) parallel + parallel s_(e_r) parallel lt.eq e^(M' delta r + o \( r \))$ for a fixed multiple $M'$ of $M$. Every ideal basis width on $T_2$ is strictly positive. Decrease $delta$ so that $M' delta$ is less than all these widths. Then $i_(e_r) in B_r^I \( T_2 \, O \( 1 \) \)$ for all sufficiently large $r$, and the ideal coordinate $i i_(e_r)$ has the required bound. Finitely many simultaneous requirements have a positive common threshold for $delta$. ◻
]

=== 8.3 Conditioned probes and the offset comparison <conditioned-probes-and-the-offset-comparison>

We retain the profiles of Definition 28:

$ f_(r \, x \, n) \( z \) = frac(pi F \( x n Delta_r z \) - pi F \( x \), r) \, #h(2em) a upright(" uniform in ") B_r \( cal(C) \) \, quad n = a k_0 \, $

where $k_0 in B_r \( \( 1 + delta \) cal(C) \, e^(o \( r \)) \)$ is independent of $a$. All subexponential bounds below use one common vanishing envelope for the finite constructions under consideration. The maps and basepoints may vary along the sequence. We use

$ cal(U)_delta = { z in D_oo : pi z in \( 1 - c delta \) "int" cal(C) } . $

#thm([Proposition 8.3.])[
  (Equality of neighboring offsets).  #emph[There exists $delta_2 > 0$ such that, for every fixed $0 < delta lt.eq delta_2$, the following holds. Let $r arrow.r oo$, let $F$ range over the fixed family of smoothed quasi-isometries, let $x in G$ vary, and let $k_0$ be any allowed deterministic suffix. For a generator letter $X_i$, put 
$ k = exp \( t X_i \) \, #h(2em) \| t \| lt.eq e^(\( 1 + delta \) r s_i \( cal(C) \) + o \( r \)) . $

 Every pair in the support of any limiting joint law of $\( f_(r \, x \, a k_0) \, f_(r \, x \, a k_0 k) \)$ has identical affine restrictions to $cal(U)_delta$. Equivalently, on every fixed compact subset of that domain, the difference of these profiles tends to zero in probability. The conclusion also holds for suffixes and steps sampled independently of $a$, provided their bounds have a common vanishing envelope.]
] <prop:neighbor-offsets>

#proof[
  Take $delta$ below the threshold in Proposition 36. The two profiles in a limiting support then have the form
  $ h_1 \( z \) = A pi z + b_1 \, #h(2em) h_2 \( z \) = A pi z + b_2 quad \( z in cal(U)_delta \) $
  with one $A in cal(A)$. Fix such a pair and a subsequence whose joint laws converge to a law containing it in its support. It suffices to prove $b_1 = b_2$. There are finitely many letters and labels, so these may be fixed after passing to a subsequence. Write $alpha = alpha_i$.
  ===== 8.3.1 Choice of templates. <choice-of-templates.>
  We will use the ray cone of $alpha$, and then each cone generated by $alpha$ and a generator weight independent of it. Fix one of these cones $S$, and put $S' = \( A^(*) \)^(- 1) S$. Let $p_0$ be the contact point of the unit ball with the $alpha$ facet of $cal(C)$. This point belongs to the relative interior of that facet. Choose a fixed $c' > c$ and put
  $ w_q = \( 1 - c' delta \) p_0 . $
  Choose fixed radii $0 < epsilon.alt_2 < epsilon.alt_1 < epsilon.alt_(+)$ as above, small enough that
  #[#set math.equation(numbering: n => "(8.7)")
   $ w_q + T_j subset.double \( 1 - c delta \) "int" cal(C) quad \( j = 2 \, 1 \, + \) $ <eq:offset-template-interior>]
  for every sufficiently small fixed $delta$. Here $subset.double$ means compact containment. To verify the choice, the other oriented-ray facets have positive slack at $p_0$; a sufficiently small fixed $epsilon.alt_(+)$ preserves their inequalities. On the $alpha$ facet, $alpha \( T_j \) lt.eq 0$, while $c' > c$ gives a strict margin at $w_q$. The radii can therefore be chosen before $delta$ tends to zero. On the target templates $A T_j$ the inside weights of $S'$ have width zero and all mixed words have positive width. Also
  $ P \( A T_j \) = P \( T_j \) = P_j . $
  The comparison will balance three counts. We will construct at least $e^(r P_1 - o \( r \))$ separated source endpoints and assign them to at most $e^(r \( P_1 - P_2 \) + o \( r \))$ tiles. For each tile we will prove an upper bound
  $ e^(r \( P_2 - ell_(S') \( b_2 - b_1 \) \) + o \( r \)) $
  for the separated image endpoints. The term $P_2$ comes from their ideal coordinates; the remaining term is the Haar multiplier on the quotient. Summing over tiles cancels $P_2$ and will force $ell_(S') \( b_2 - b_1 \) lt.eq 0$. The construction below arranges these two coordinate restrictions on the same endpoints.
  Normalize the source at $w_q$ using the exact automorphism $S_(- r w_q)$, and write $k_q = S_(- r w_q) k$. Since $alpha \( p_0 \) = s_i \( cal(C) \)$,
  $ k_q = exp \( t_q X_i \) \, #h(2em) \| t_q \| lt.eq e^(\( 1 + c' \) delta r s_i \( cal(C) \) + o \( r \)) . $
  Use Lemma 39 to partition $B_r^I \( T_1 \)$, with anchors $i_kappa$. Choose a fixed unit cube $J$ in $frak(n) \/ frak(i)_S$, and write $sigma$ for the section used in (8.4).
  ===== 8.3.2 Three paths chosen independently of the starting sheet. <three-paths-chosen-independently-of-the-starting-sheet.>
  Sample $i_1$ uniformly in $B_r^I \( T_1 \)$ and $s$ uniformly in $J$, independently of the original random $a$. Let $i_kappa$ be the anchor assigned to $i_1$, so the tile index $kappa$ depends only on this probe. For the moment $n = a k_0$ is still random. Define
  #[#set math.equation(numbering: n => "(8.8)")
   $ n_1 = n S_(r w_q) \( i_1 exp_N sigma \( s \) \) \, #h(2em) n_(2 \, kappa) = n S_(r w_q) \( i_kappa \) k \, #h(2em) n_2 = n S_(r w_q) \( i_1 \) k . $ <eq:offset-probes>]
  We will count the endpoints $n_1$. The auxiliary endpoint $n_2$ keeps the ideal probe $i_1$ and replaces the quotient factor by the neighbor step $k$, while $n_(2 \, kappa)$ gives one second-sheet anchor for its tile. Their design gives the exact cancellation
  #[#set math.equation(numbering: n => "(8.9)")
   $ n_1^(- 1) n_2 = S_(r w_q) #scale(x: 120%, y: 120%)[\(] exp_N \( - sigma \( s \) \) k_q #scale(x: 120%, y: 120%)[\)] . $ <eq:offset-probe-cancellation>]
  This difference is independent of $i_1$. A path from $n$ to $n_1$ will control the target quotient coordinate relative to the first sheet. A path from $n_(2 \, kappa)$ to $n_2$, followed by the bridge in (8.9), will control the target ideal coordinate of the same endpoint relative to its second-sheet anchor.
  The following three sheet changes can be generated with uniformly bounded numbers of generator switches:
  $ n & arrow.r n_1 &  & upright("using the template ") w_q + T_1 \,\
n k & arrow.r n_(2 \, kappa) &  & upright("using the template ") w_q + T_(+) \,\
n_(2 \, kappa) & arrow.r n_2 &  & upright("using the template ") w_q + T_2 . $
  For the first, $i_1 exp_N sigma \( s \) in B_r \( T_1 \, O \( 1 \) \)$ by (8.5). For the second, the relative normalized increment is $k_q^(- 1) i_kappa k_q$, which satisfies (8.6). For the third it is $k_q^(- 1) i_kappa^(- 1) i_1 k_q in B_r^I \( T_2 \, O \( 1 \) \)$ by (8.6). Lemma 10, followed by $S_(r w_q)$, gives the stated generation with generator amplitudes at most $e^(r s_j \( w_q + T_l \) + o \( r \))$ for the indicated template $l$.
  Choose these product representations measurably as functions of $\( i_1 \, s \)$, using the measurable bounded product selection in Lemma 10. Its finite family of bounded schemes can be padded by identity factors, and its Borel local inverse choices give Borel parameters for every endpoint. The anchors are already measurable. All choices, including the product parameters and the paths below, are independent of $a$. The number of switches is bounded independently of the probe parameters. Every intermediate suffix is a fixed-length product of the original allowed suffix and increments in the template boxes, and, when needed, $k$. The box calculus and (8.7) keep it in $B_r \( \( 1 + delta \) cal(C) \, e^(o \( r \)) \)$, with one envelope for all probes.
  Choose a pivot $d_q in D$ with $pi d_q = r w_q$ and $\| d_q \|_D = O \( r \)$, for example by exponentiating $r$ times a fixed linear lift of $w_q$ to $frak(d)$. Each generator switch can be performed by a $D$-leg from the pivot to a support height of its template, the short switch there, and a reversed $D$-leg on the new sheet. The legs have length $O \( r \)$ and the switches have length $o \( r \)$, by Lemmas 11 and 12. Their scaled $D$-coordinates lie in a fixed compact subset of $cal(U)_delta$, by Lemma 6 and the strict containment (8.7). We fix a compact neighborhood of all these coordinates for the remaining profile comparisons.
  ===== 8.3.3 Why the intermediate profiles retain their starting offsets. <why-the-intermediate-profiles-retain-their-starting-offsets.>
  This step uses only the affinity of individual limiting profiles. Consider one of the selected generator switches, with template $E subset.double \( 1 - c delta \) "int" cal(C)$ and letter $X_j$. There is a nonempty open set of heights in that domain on which $alpha_j \( w \) > s_j \( E \)$, because the support maximum is attained inside the open domain. On a smaller such open set the difference is bounded below by a positive number. At its $D$-positions, conjugating the switch back gives exponentially decaying generator coefficients, up to polynomial factors. The distance of its two source sheet points, divided by $r$, therefore tends to zero. Their image profiles agree there in every joint limit. Proposition 34 makes each limiting profile affine on $cal(U)_delta$, so equality on this open set gives equality throughout that domain.
  It follows by sequence compactness that the difference across each such switch tends to zero in probability on the fixed compact set of legs. This statement is uniform for the permitted parameter choices with their common envelope: a violating sequence of choices would give a joint limit contradicting the preceding open-set argument. Conditioning on any independent probe parameters and integrating proves the same assertion for the measurable choices just made. Since there are boundedly many switches, with probability tending to one their intermediate profiles all differ by $o \( 1 \)$ from the starting profile of their respective sheet. The first path uses the profile of $n$; the other two use that of $n k$.
  We now choose a single starting $n$ retaining a positive volume of probes. For a fixed tolerance $eta > 0$, let $E_r \( eta \)$ be the event that the original pair of profiles is within $eta$ of $\( h_1 \, h_2 \)$ on the required compact. The support hypothesis gives $liminf_r bb(P) \( E_r \( eta \) \) > 0$. Let $b_r \( eta \)$ be the joint probability, over the original chart sample and the independent probes, that one of the intermediate profile comparisons has error exceeding $eta$. The preceding paragraph gives $b_r \( eta \) arrow.r 0$. For large $r$ it is less than one quarter of $bb(P) \( E_r \( eta \) \)$. Fubini’s theorem then supplies an original sample in $E_r \( eta \)$ for which fewer than half of the probes fail these comparisons. First do this for each fixed tolerance and then let the tolerance decrease sufficiently slowly with $r$. We obtain a deterministic starting $n = n_r$ and a measurable set of good probes of probability at least $1 \/ 2$, on which all the required intermediate profiles approach their designated affine maps. This order of choices does not condition on a null event, and it does not require every probe to succeed simultaneously.
  The generation selectors prescribe the paths; the probability law here remains the original product of ideal Haar measure and Lebesgue measure on $J$. The preceding success events are measurable because the selected parameters are Borel and the profiles depend continuously on their sheet coordinates. Inner regularity of this finite-dimensional product measure allows us to retain a compact subset of good probes of probability at least $1 \/ 4$.
  The map $\( i_1 \, s \) mapsto i_1 exp_N sigma \( s \)$ is injective and carries product Haar measure to Haar measure up to a fixed scalar. The good probe set thus has actual $N$-volume bounded below by a fixed positive multiple of $e^(r P_1)$. Since $S_(r w_q)$ has determinant one and left translation by $n$ preserves Haar, the good values of $n_1$ in (8.8) have this same lower bound. The possibly small probability of the starting event has caused no loss of probe volume. We use the compact retained subset from now on. Its $n_1$-endpoint image is compact, because $\( i_1 \, s \) mapsto n S_(r w_q) \( i_1 exp_N sigma \( s \) \)$ is continuous. No continuity of the anchor assignment or generation selectors is required; the tile partition is Borel and its anchor is fixed on each tile.
  ===== 8.3.4 The bridge and the two target restrictions. <the-bridge-and-the-two-target-restrictions.>
  We now estimate the bridge in (8.9). At the pivot, conjugation by $d_q^(- 1)$ cancels the character scaling $S_(r w_q)$ and leaves only polynomially bounded unipotent factors. As $s$ ranges in a fixed cube, the resulting logarithm has norm at most $e^(C_1 delta r + o \( r \))$. Logarithmic distortion gives
  #[#set math.equation(numbering: n => "(8.10)")
   $ d_G \( x n_1 d_q \, x n_2 d_q \) lt.eq C_2 delta r + o \( r \) \, $ <eq:offset-bridge>]
  where the constants are independent of sufficiently small fixed $delta$. We retain this error at its stated size.
  For good probes put
  $ y_0 = F \( x n d_q \) \, quad y_1 = F \( x n_1 d_q \) \, quad y_(2 \, kappa) = F \( x n_(2 \, kappa) d_q \) \, quad y_2 = F \( x n_2 d_q \) . $
  The first probe path has target relative heights in $r \( A T_1 + o \( 1 \) \)$, because its profiles approach $A pi z + b_1$ and its pivot height is $w_q$. Its length is $O \( r \)$. Path lifting and packing therefore give a lift of $y_0^(- 1) y_1$ with $N$-part in $B_r \( A T_1 \, e^(o \( r \)) \)$ and $D$-length $O \( r \)$. Its endpoint height is $o \( r \)$, since both endpoint profiles approach $A w_q + b_1$. Every pure quotient width is zero, so
  #[#set math.equation(numbering: n => "(8.11)")
   $ p_(S') \( y_0^(- 1) y_1 \) in cal(T)_r \, #h(2em) cal(T)_r = { z in L_(S') : parallel log z parallel lt.eq e^(o \( r \)) } \, #h(2em) "vol"_(L_(S')) cal(T)_r lt.eq e^(o \( r \)) . $ <eq:offset-first-quotient>]
  Choose its envelope large enough that the same restriction holds after fixed bounded right thickening of the endpoints. Indeed a bounded final step keeps the first path’s relative heights in $r \( A T_1 + o \( 1 \) \)$: its unthickened endpoint height is $o \( r \)$ and $0 in A T_1$. The same path lifting estimate applies.
  For a tile contributing a good probe, the second starting path and the profile conditioning give
  #[#set math.equation(numbering: n => "(8.12)")
   $ pi \( y_0^(- 1) y_(2 \, kappa) \) = r \( b_2 - b_1 \) + o \( r \) . $ <eq:offset-anchor-height>]
  The path from $y_(2 \, kappa)$ to $y_2$ has relative heights in $r \( A T_2 + o \( 1 \) \)$, length $O \( r \)$, and endpoint height $o \( r \)$. Choose its lift $u_2 d_2$ with
  $ u_2 in B_r \( A T_2 \, e^(o \( r \)) \) \, #h(2em) \| d_2 \|_D = O \( r \) \, #h(2em) pi d_2 = o \( r \) . $
  A lift of the bridge from $y_2$ to $y_1$, using (8.10) and the quasi-isometry bounds, has $N$ log norm at most $e^(C_3 delta r + o \( r \))$ and $D$-length $O \( delta r \) + o \( r \)$. Conjugating its $N$-part by $d_2$ changes this estimate only by a subexponential factor. We obtain a lift of $y_(2 \, kappa)^(- 1) y_1$ of the form
  #[#set math.equation(numbering: n => "(8.13)")
   $ u_2 e_r d \, #h(2em) parallel log e_r parallel lt.eq e^(C_4 delta r + o \( r \)) \, quad \| d \|_D = O \( r \) \, quad parallel pi d parallel lt.eq O \( delta r \) + o \( r \) . $ <eq:offset-lift-with-error>]
  The last height bound is only $O \( delta r \)$, not $o \( r \)$.
  Apply the absorption part of Lemma 39 to the target ideal $I' = I_(S')$ and template $A T_2$. After decreasing $delta$, the ideal coordinate of $u_2 e_r$ belongs to $B_r^(I') \( A T_2 \, e^(o \( r \)) \)$. More explicitly, factor $u_2 = i_2 exp sigma' \( s_2 \)$, with $parallel s_2 parallel lt.eq e^(o \( r \))$. Factoring $exp sigma' \( s_2 \) e_r$ again produces an ideal error with log norm $e^(O \( delta \) r + o \( r \))$. Every mixed ideal width is strictly positive, so this error fits in the ideal box. This is an ideal-coordinate bound uniform over the accompanying quotient coordinates; it does not require their location to stay in a subexponential ball.
  The bound remains valid under fixed bounded right thickening of the lifts in (8.13). Such thickening adds an $N$-factor conjugated by $d$. The stated $D$-length and $O \( delta r \) + o \( r \)$ height bounds make its logarithm at most $e^(O \( delta \) r + o \( r \))$, and the same positive ideal widths absorb it. This explicitly accounts for the non-sublinear height of the lift relative to the second-sheet anchor.
  All constants in the bridge and polynomial coordinate estimates can be chosen independently of sufficiently small $delta$: the radii are fixed, the pivots stay in fixed compact height sets, and the quasi-isometry constants are fixed. There are finitely many cones, letters, and labels. We choose $delta_2$ small enough to satisfy all their strict gap and absorption inequalities simultaneously.
  The fixed-$delta$ bridge has now been absorbed in the ideal-coordinate bound. It remains to compare quotient Haar volumes: their exact multiplier will detect $ell_(S') \( b_2 - b_1 \)$.
  ===== 8.3.5 Volume at an arbitrary translated quotient location. <volume-at-an-arbitrary-translated-quotient-location.>
  Fix a contributing tile and let $g_kappa = y_(2 \, kappa)^(- 1) y_0$. Equivariance in Lemma 38, together with (8.11), gives the exact restriction
  #[#set math.equation(numbering: n => "(8.14)")
   $ p_(S') \( y_(2 \, kappa)^(- 1) y_1 \) in g_kappa dot.op cal(T)_r . $ <eq:offset-translated-quotient>]
  It also holds for the thickened endpoints described above. The Haar multiplier and (8.12) imply
  #[#set math.equation(numbering: n => "(8.15)")
   $ "vol"_(L_(S')) \( g_kappa dot.op cal(T)_r \) lt.eq e^(- r ell_(S') \( b_2 - b_1 \) + o \( r \)) . $ <eq:offset-quotient-volume>]
  The set may be far from the quotient identity. Its location has no effect on this equality of Haar multipliers.
  In the ideal and section coordinates (8.4), every admissible $N$-part of the thickened lifts lies in a set with ideal coordinate in $B_r^(I') \( A T_2 \, e^(o \( r \)) \)$ and quotient coordinate in $g_kappa dot.op cal(T)_r$. Quotient integration and (8.3) bound its Haar volume by
  #[#set math.equation(numbering: n => "(8.16)")
   $ e^(r \( P_2 - ell_(S') \( b_2 - b_1 \) \) + o \( r \)) . $ <eq:offset-tile-N-volume>]
  This is a bound by a containing product set. It requires neither independence of the coordinates nor a product description of the admissible set, and holds at any translated quotient location.
  To turn this into a separated-point bound, take image endpoints in this tile with a fixed sufficiently large separation. Choose the admissible lifts relative to $y_(2 \, kappa)$ and thicken each on the right by a fixed small neighborhood in $N times.r D$. Their projections lie in disjoint metric balls, so these lifted neighborhoods are disjoint even if $N times.r D arrow.r G$ is not injective. Each has the same positive product Haar volume. The thickened $D$-coordinates lie in an intrinsic $D$-ball of radius $O \( r \)$, of polynomial volume. The two coordinate restrictions just proved still hold for all the neighborhoods. Fubini’s theorem and (8.16) therefore bound their number by
  #[#set math.equation(numbering: n => "(8.17)")
   $ e^(r \( P_2 - ell_(S') \( b_2 - b_1 \) \) + o \( r \)) . $ <eq:offset-tile-count>]
  The envelopes here are common to all contributing tiles, since the probe paths, profile tolerances, and coordinate bounds were uniform over their parameters.
  The good $n_1$-volume was at least a constant times $e^(r P_1)$. Lemma 15, at the common pivot $d_q$, supplies at least $e^(r P_1 - o \( r \))$ suitably separated source points from that set. Take the separation large enough that their images are separated at the constant used in (8.17). Assign each chosen point to its probe tile. Summing (8.17) over at most $e^(r \( P_1 - P_2 \) + o \( r \))$ tiles gives
  $ e^(r P_1 - o \( r \)) lt.eq e^(r \( P_1 - ell_(S') \( b_2 - b_1 \) \) + o \( r \)) . $
  Divide logarithms by $r$ and let $r arrow.r oo$. We have proved $ell_(S') \( b_2 - b_1 \) lt.eq 0$.
  For the reverse inequality take the original starting suffix to be $k_0 k$ and the step to be $k^(- 1)$. The former is still in the allowed enlarged box by normalized multiplication, with an enlarged common subexponential envelope; the latter has the same generator amplitude bound. The swapped pair belongs to the swapped limiting support. Repeating the argument gives $ell_(S') \( b_1 - b_2 \) lt.eq 0$. Thus
  #[#set math.equation(numbering: n => "(8.18)")
   $ ell_(S') \( b_2 - b_1 \) = 0 quad upright("for each of the specified cone tests.") $ <eq:offset-traces-vanish>]
  ===== 8.3.6 The trace tests determine the offset. <the-trace-tests-determine-the-offset.>
  For the ray cone, its target trace is a positive multiple of $beta = \( A^(*) \)^(- 1) alpha$. Hence $beta \( b_2 - b_1 \) = 0$. For each generator weight $lambda$ independent of $alpha$, the target two-generator trace is $c beta + d eta$, where $eta = \( A^(*) \)^(- 1) lambda$ and $c \, d > 0$. Equation (8.18) then gives $eta \( b_2 - b_1 \) = 0$. Weights proportional to $alpha$ require no additional test. Since the generator weights span $W^(*)$, their target transforms do as well, proving $b_2 = b_1$. When $dim W = 1$, the ray test alone gives this conclusion.
  Finally, compactness converts the support assertion into convergence in probability on each compact subset: any violation would admit a joint limit assigning positive mass to unequal restrictions. The same contradiction works along arbitrary sequences of maps, basepoints, and allowed deterministic choices with their fixed common envelope. Conditioning on independently sampled suffixes and steps, or selecting violating deterministic choices if convergence failed, gives the stated random-choice version. ◻
]

== 9 From random charts to uniform height control <sec:uniformity>

The preceding sections identify affine profiles and compare nearby sheets. We now remove the random chart center. There are two distinct points to check: the affine label must be independent of scale and basepoint, and the chart offset must disappear after division by the scale. Throughout this section the Lipschitz, quasi-isometry and coarse-inverse bounds for the pairs $\( F \, macron(F) \)$ are fixed. All constants are uniform over that family.

Choose $delta > 0$ small enough for Proposition 40, and use $cal(C)$, $cal(U)_delta$, and $f_(r \, x \, n)$ from Definition 28. Thus

$ f_(r \, x \, n) \( z \) = frac(pi F \( x n Delta_r z \) - pi F \( x \), r) \, #h(2em) z in D_oo . $

Choose a compact identity neighborhood $Z subset cal(U)_delta$. In particular, $pi Z$ contains a neighborhood of zero in $W$. We can shrink $Z$ a fixed number of times below.

#thm([Lemma 9.1.])[
  (Suffix comparison and concentration).  #emph[Let $a$ be uniform on $B_r \( cal(C) \)$. Along every sequence $r arrow.r oo$, with arbitrary maps $F$, basepoints $x$, and suffixes 
$ k_0 in B_r \( \( 1 + delta \) cal(C) \, e^(eta_r r) \) \, #h(2em) eta_r arrow.r 0 \, $

 one has 
#[#set math.equation(numbering: n => "(9.1)")
 $ parallel f_(r \, x \, a k_0) - f_(r \, x \, a) parallel_Z arrow.r 0 quad upright("in probability") . $ <eq:suffix-profile-comparison>]

 The assertion also holds for suffixes sampled independently of $a$ whose supports satisfy the same bound.]
  #emph[There are deterministic $A_(F \, x \, r) in cal(A)$ and $s_(F \, x \, r) in W$ such that 
#[#set math.equation(numbering: n => "(9.2)")
 $ sup_(F \, x) bb(E) ∥f_(r \, x \, a) - A_(F \, x \, r) pi - s_(F \, x \, r) / r∥_Z arrow.r 0 \, #h(2em) \| s_(F \, x \, r) \| lt.eq C r . $ <eq:ordinary-chart-concentration>]

 The same approximation holds in probability with $a$ replaced by $a k_0$ in the sequential setting of (9.1).]
] <lem:suffix-concentration>

#proof[
  By Lemma 10, an allowed suffix is a product of a bounded number of generator exponentials. Their amplitudes obey the bounds of Proposition 40; all partial products remain allowed suffixes by Lemma 8. The joint law of each successive pair of profiles is relatively compact by Proposition 34. Every limit is supported on identical pairs by Proposition 40. The distance between the two profiles on $Z$ therefore tends to zero in probability. Summing over the bounded number of steps proves (9.1). If independent random suffixes violated the assertion, conditioning would select deterministic suffixes with failure probability bounded below. This would contradict the deterministic statement.
  Write $mu_r$ for uniform Haar probability on $B_r \( cal(C) \)$. The normalized product bounds give a fixed $L gt.eq 1$ such that
  $ a^(- 1) B_r \( cal(C) \) subset B_r \( cal(C) \, L \) #h(2em) \( a in B_r \( cal(C) \) \) . $
  Let $k$ be independent and uniform on $B_r \( cal(C) \, L \)$. For each fixed $a$, the conditional law of $a k$ dominates $c mu_r$ for a constant $c > 0$ independent of $r$ and $a$. Indeed, its Haar density on $a B_r \( cal(C) \, L \)$ is the reciprocal of the volume of that box, and the ratio of this volume to $"vol" B_r \( cal(C) \)$ is bounded. Consequently, for independent $a \, b$ with law $mu_r$,
  $ Pr { parallel f_(r \, x \, a) - f_(r \, x \, b) parallel_Z > epsilon.alt } lt.eq c^(- 1) Pr { parallel f_(r \, x \, a) - f_(r \, x \, a k) parallel_Z > epsilon.alt } arrow.r 0 . $
  The ordinary profile laws are relatively compact and uniformly bounded on $Z$. If $nu$ is any subsequential limit, the last display says that $nu times nu$ is supported on the diagonal. Thus $nu$ is a point mass. Proposition 34 says that this point has the form $A pi + b$, with $A in cal(A)$.
  Set
  $ s_(F \, x \, r) = r thin bb(E) f_(r \, x \, a) \( 1 \) \, $
  and choose $A_(F \, x \, r) in cal(A)$ to minimize the expected supremum norm in (9.2). These quantities are well defined because the profiles are bounded. The point-mass conclusion proves convergence to zero along every sequence of maps and basepoints; otherwise a violating sequence would have a point-mass subsequential limit for which the minimum is zero. This proves the stated supremum over $F \, x$. Finally $\| a \|_G lt.eq C r$ by Lemma 11, so the Lipschitz bound for $F$ gives $\| s_(F \, x \, r) \| lt.eq C r$. Equation (9.1) transfers the deterministic approximation to the allowed suffixes. ◻
]

#prodef([Remark 9.2.])[
  The suffix assertion is sequential. Equivalently, one can prescribe a vanishing envelope $eta \( r \)$ for any fixed finite collection of constructions and then take the corresponding uniform bounds. It does not mean a supremum at a fixed $r$ over every sequence that might eventually satisfy $eta_r arrow.r 0$. The supremum in (9.2) concerns ordinary charts and has no such suffix parameter.
] <rem:suffix-envelope>

#thm([Lemma 9.3.])[
  (Stabilization across scales).  #emph[There is $R_0$ independent of $F \, x$ such that $A_(F \, x \, r)$ is independent of $r gt.eq R_0$. Moreover 
$ sup_(F \, x) \| s_(F \, x \, r) \| \/ r arrow.r 0 . $

]
] <lem:scale-stabilization>

#proof[
  Put $q = 1 + delta \/ 2$. If $r lt.eq r' lt.eq q r$, let $a$ be uniform on $B_r \( cal(C) \)$ and let $k$ be independent and uniform on $B_(r') \( cal(C) \, L \)$, for a sufficiently large fixed $L$. For every such $a$,
  $ a^(- 1) B_(r') \( cal(C) \) subset B_(r') \( cal(C) \, L \) . $
  The density argument in Lemma 41 shows that the law of $a k$ dominates a fixed multiple of uniform measure on $B_(r') \( cal(C) \)$. This suffix fits the strict expansion at scale $r$, since $r' lt.eq \( 1 + delta \/ 2 \) r$.
  For the same $N$-coordinate $n$, compare the two deterministic approximations at
  $ z' = Delta_(r')^(- 1) Delta_r z \, #h(2em) r' pi z' = r pi z . $
  On a fixed smaller $Z$, $z'$ stays in the original neighborhood. The errors of both approximations are $o \( r \)$ in probability, uniformly over $r' in \[ r \, q r \]$, $F$, and $x$. To justify this last uniformity, a violating sequence would be an allowed sequence in Lemma 41, with the fixed envelope coming from $L$; the density comparison constants are fixed. More precisely, the lower domination of the law of $a k$ transfers its scale-$r$ good event to uniform measure on $B_(r') \( cal(C) \)$. Intersect there with the ordinary scale-$r'$ good event. Therefore
  #[#set math.equation(numbering: n => "(9.3)")
   $ sup_(z in Z) lr(|s_(F \, x \, r) - s_(F \, x \, r') + r \( A_(F \, x \, r) - A_(F \, x \, r') \) pi z|) = o \( r \) . $ <eq:scale-affine-comparison>]
  The expression is deterministic: an event of positive probability on which both approximations are accurate proves its bound.
  Subtract (9.3) at $1$ from its values at a fixed finite set of points whose heights span $W$. The offsets cancel. Distinct members of the finite set $cal(A)$ are separated on these heights, so the labels agree for all $r gt.eq R_0$, with one $R_0$. Since any larger scale can be reached by successive ratios in $\[ 1 \, q \]$, the label stabilizes. Evaluating at $1$ also gives
  $ \| s_(F \, x \, r') - s_(F \, x \, r) \| lt.eq epsilon \( r \) r quad \( r lt.eq r' lt.eq q r \) \, #h(2em) epsilon \( r \) arrow.r 0 \, $
  uniformly in the other variables.
  For completeness, fix $epsilon.alt > 0$ and choose a fixed $R gt.eq R_0$ such that $epsilon \( t \) lt.eq epsilon.alt$ for $t gt.eq R$. Telescope along scales $R \, q R \, q^2 R \, dots.h$, ending with a ratio at most $q$. The uniform bound at the initial scale gives
  $ \| s_(F \, x \, r) \| lt.eq C R + epsilon.alt sum_(j : q^j R < r) q^j R lt.eq C R + frac(q, q - 1) epsilon.alt r . $
  First divide by $r$ and let $r arrow.r oo$, then let $epsilon.alt arrow.r 0$. This proves the uniform sublinear bound. ◻
]

#thm([Proposition 9.4.])[
  (Uniform sublinear height estimate).  #emph[For each map $F$ there is a single $A_F in cal(A)$ and there is a function $epsilon.alt \( R \) arrow.r 0$, common to the entire fixed family, such that 
#[#set math.equation(numbering: n => "(9.4)")
 $ lr(|pi F \( x g \) - pi F \( x \) - A_F pi g|) lt.eq epsilon.alt \( R \) R #h(2em) \( F \, med x in G \, med \| g \|_G lt.eq R \) . $ <eq:uniform-sublinear>]

 The label of the coarse inverse is $A_(macron(F)) = A_F^(- 1)$.]
] <prop:uniform-sublinear>

#proof[
  It remains to compare the stabilized labels and center values at different basepoints. Fix a sufficiently small $eta > 0$ relative to $delta$. Suppose $\| x^(- 1) y \|_G lt.eq eta r$ and choose a lift
  $ x^(- 1) y = u d \, #h(2em) \| d \|_D lt.eq C \( 1 + eta r \) \, #h(2em) parallel log u parallel lt.eq e^(C \( 1 + eta r \)) $
  using Lemma 13. Set $r_0 = \( 1 - delta \/ 2 \) r$ and, for $a$ uniform on $B_r \( cal(C) \)$, put
  $ a_y = d^(- 1) u^(- 1) a d . $
  Its law has constant Haar density $1 \/ "vol" B_r \( cal(C) \)$ on its support, since conjugation by $d$ has determinant one.
  Let $a_0$ be uniform on $B_(r_0) \( cal(C) \)$ and let $k$ be independent and uniform on $d^(- 1) B_r \( cal(C) \, L \) d$. We claim that the law of $a_y$ is dominated by a fixed multiple of the law of $a_0 k$. Indeed, for every possible $a \, a_0$,
  $ "Ad"_d \( a_0^(- 1) a_y \) = \( "Ad"_d a_0 \)^(- 1) u^(- 1) a in B_r \( cal(C) \, L \) . $
  The inclusion follows from Lemma 8: the smaller box retains a strict exponent gap after conjugation by $d$, and $u$ fits strictly within the $r$-widths if $eta$ is small enough. Polynomial conjugation factors are absorbed by these gaps. The Haar volume of the box for $k$ is a fixed multiple of $"vol" B_r \( cal(C) \)$. Conditional density comparison, followed by integration in $a_0$, proves the claim.
  All these $k$ lie in the allowed expansion at scale $r_0$. For this use $\( 1 + delta \) \( 1 - delta \/ 2 \) > 1$ and choose $eta$ smaller if necessary; the remaining strict gap again absorbs the polynomial factors. Thus Lemma 41 applies with a common envelope to this collection of comparisons.
  We have the exact identity
  $ x a Delta_r z = y a_y d^(- 1) Delta_r z . $
  For $z$ in a fixed smaller neighborhood, the point $z' = Delta_(r_0)^(- 1) \( d^(- 1) Delta_r z \)$ lies in $Z$. This follows from Lemma 6 and the small bound on $\| d \|_D \/ r$; its height satisfies exactly
  $ r_0 pi z' = r pi z - pi d . $
  The two deterministic chart approximations, transferred through the fixed density domination, can now be compared. Their offsets are $o \( r \)$ by Lemma 43. Subtracting the comparison at two values of $z$ cancels both center values and $pi d$. Testing a fixed spanning set of heights forces equality of the stabilized labels at $x \, y$, uniformly for all sufficiently large $r$. Evaluation at $z = 1$ then gives
  $ pi F \( y \) - pi F \( x \) - A_(F \, y \, r_0) pi \( x^(- 1) y \) = o \( r \) \, #h(2em) \| x^(- 1) y \|_G lt.eq eta r \, $
  uniformly in $F \, x \, y$.
  Any two basepoints can be compared at a sufficiently large scale; therefore the stabilized label is a single $A_F$. To obtain (9.4) for $\| g \| lt.eq R$, take $y = x g$ and $r = R \/ eta$. The preceding uniform error then provides one modulus $epsilon.alt \( R \) arrow.r 0$ for all maps and basepoints.
  Finally apply (9.4) to both maps in a coarse-inverse pair. For $g_t = exp_D \( t H \)$, the displacement $F \( g_t \)$ from $F \( 1 \)$ is $O \( t \)$. Bounded-error composition gives
  $ t pi H = A_(macron(F)) A_F \( t pi H \) + o \( t \) . $
  Every $w in W$ is $pi H$ for some $H in frak(d)$. Division by $t$ proves $A_(macron(F)) A_F = "id"$. ◻
]

== 10 Quotient boundaries and bounded height error <sec:boundary>

We now strengthen Proposition 44 to a bounded error. A ray quotient records the directions that contract when one height tends to minus infinity. The sublinear estimate produces homeomorphisms of these quotients. Comparing the volumes of their images first bounds height variation along $N$-fibers. Averaging the image volumes of translates in the source quotient then controls the remaining $D$-directions.

Boundary actions play a central role in #cite(label("Dymarz2010")) Theorem 2 and Section 4 and #cite(label("DymarzFisherXie2025")) Section 4.1. Here the contracting quotient boundaries are used to compare Haar volumes of boundary images and bound the height error.

=== 10.1 Contracting rays and boundary homeomorphisms <contracting-rays-and-boundary-homeomorphisms>

For a generator ray represented by a nonzero form $alpha$, abbreviate the objects of Lemma 38 by

$ I_alpha = I_(bb(R)_(gt.eq 0) alpha) \, #h(2em) L_alpha = N \/ I_alpha \, #h(2em) p_alpha \( g \) = g dot.op 1 \, #h(2em) ell_alpha = ell_(bb(R)_(gt.eq 0) alpha) . $

Multiplying $alpha$ by a positive scalar does not change these objects. Every weight of $"Lie" \( L_alpha \)$ is a strictly positive multiple of $alpha$, and

#[#set math.equation(numbering: n => "(10.1)")
 $ ell_alpha = c_alpha alpha \, #h(2em) c_alpha > 0 . $ <eq:ray-trace>]

The positivity follows because at least one generator class on this ray survives in the quotient abelianization. Fix one representative of each target generator ray, and use its pullbacks by the finitely many members of $cal(A)$ when a source representative is needed. We fix left invariant Riemannian metrics on the finitely many ray quotients.

We use two elementary consequences of the quotient action. If $y = n d$ is any lift of an element of $G$, then

#[#set math.equation(numbering: n => "(10.2)")
 $ p_beta \( y h \) = p_beta \( y \) thin "Ad"_d #scale(x: 120%, y: 120%)[\(] p_beta \( h \) #scale(x: 120%, y: 120%)[\)] . $ <eq:quotient-step>]

Here $"Ad"_d$ denotes the induced automorphism on $L_beta$. The formula is independent of the lift because $N ∩ D subset I_beta$. Also, for each fixed compact set $Q subset L_beta$, there are $C \, M \, c > 0$ such that

#[#set math.equation(numbering: n => "(10.3)")
 $ sup_(q in Q) parallel log \( "Ad"_d q \) parallel lt.eq C \( 1 + \| d \|_D \)^M e^(c beta \( pi d \)) #h(2em) upright("if ") beta \( pi d \) lt.eq 0 . $ <eq:quotient-contraction>]

Indeed the quotient has finitely many weights $c_j beta$, $c_j > 0$; take $c = min_j c_j$ and use the polynomial bounds on their unipotent parts from Lemma 7, Equation (2.12). These statements also hold for compact families of bounded increments.

#thm([Lemma 10.1.])[
  (Boundary maps from sublinear height control).  #emph[Let $F$ belong to the fixed Lipschitz quasi-isometry family, let $A = A_F$, and let $beta$ be a selected target ray representative. Put $alpha = beta compose A$. There is a homeomorphism 
$ f_beta : L_alpha arrow.r L_beta $

 and a fixed compact set $Q_beta subset L_beta$ such that 
#[#set math.equation(numbering: n => "(10.4)")
 $ f_beta \( p_alpha x \) in F \( x \) dot.op Q_beta #h(2em) \( x in G \) . $ <eq:boundary-shadow>]

 The compact sets may be chosen uniformly over the fixed family. The map obtained from $macron(F)$ for the reversed ray pair is $f_beta^(- 1)$.]
] <lem:ray-boundaries>

#proof[
  Since $cal(A)^(*)$ permutes the generator rays, the source quotient is defined. Choose $v in frak(d)$ with $alpha \( pi v \) < 0$. There are only finitely many ray and label choices, so choose all these $v$’s once.
  #emph[Convergence and a uniform compact shadow.] For $x_t = x exp_D \( t v \)$, Proposition 44 gives
  $ beta #scale(x: 120%, y: 120%)[\(] pi F \( x_t \) - pi F \( x \) #scale(x: 120%, y: 120%)[\)] = t alpha \( pi v \) + o \( t \) lt.eq - c_0 t #h(2em) \( t gt.eq T_0 \) \, $
  with $c_0 \, T_0 > 0$ uniform in $F \, x$ and the finite choices. Set $y_t = F \( x \)^(- 1) F \( x_t \)$. Its distance from $1$ is $O \( 1 + t \)$. By Lemma 13 it has a lift $y_t = n_t d_t$ with $\| d_t \|_D lt.eq C \( 1 + t \)$. The increments $y_t^(- 1) y_(t + 1)$ have uniformly bounded length and hence bounded lifts. Equations (10.2) and (10.3) imply
  $ ∥log #scale(x: 120%, y: 120%)[\(] p_beta \( y_t \)^(- 1) p_beta \( y_(t + 1) \) #scale(x: 120%, y: 120%)[\)]∥ lt.eq C \( 1 + t \)^M e^(- c_1 t) . $
  The series is summable. In a left invariant Riemannian metric, $d \( 1 \, exp Z \) lt.eq C parallel Z parallel$, by using the path $s mapsto exp \( s Z \)$. Thus the projected trajectory at integer times is Cauchy and stays in a fixed closed ball. Completeness and properness of the metric give convergence in a fixed compact set. The same estimate for time increments of size at most one gives convergence for real $t arrow.r oo$. The initial interval $0 lt.eq t lt.eq T_0$ contributes a fixed compact set, so the limit lies in a fixed compact $Q_beta$. Equivariance of $p_beta$ under the $G$-action therefore gives a limit
  #[#set math.equation(numbering: n => "(10.5)")
   $ b \( x \) = lim_(t arrow.r oo) p_beta F \( x exp_D \( t v \) \) in F \( x \) dot.op Q_beta . $ <eq:boundary-limit>]
  #emph[Independence of the representative.] We first record the path estimate used for this purpose. Suppose, for large $t$, a source path stays at distance at most $C_2 t$ from a fixed $x$, has length bounded by a polynomial in $t$, and satisfies
  $ alpha #scale(x: 120%, y: 120%)[\(] pi \( x^(- 1) z \) #scale(x: 120%, y: 120%)[\)] lt.eq - c_2 t $
  at each of its points $z$. The uniform sublinear estimate puts its image, relative to $F \( x \)$, at $beta$-heights at most $- c_2 t \/ 2$ for all sufficiently large $t$. The lifts at all image points have $D$-length $O \( t \)$, because their distance from $F \( x \)$ is $O \( t \)$. Subdivide the source path into bounded-length pieces. Equations (10.2) and (10.3) bound each projected image increment by a polynomial times $e^(- c t)$. There are only polynomially many pieces, so the projected distance between the endpoints tends to zero. Constants here may depend on this fixed collection of paths.
  For fixed $d in D$, connect $x exp \( t v \)$ to $x d exp \( t v \)$ by $x d \( s \) exp \( t v \)$, where $d \( s \)$ is a fixed piecewise smooth path in $D$ from $1$ to $d$. Its length is polynomial in $t$, since conjugation in the nilpotent group $D$ has polynomial norm. Its points have distance $O \( t \)$ from $x$, and their relative $alpha$-heights equal $t alpha \( pi v \) + O \( 1 \)$. The preceding path estimate gives $b \( x d \) = b \( x \)$.
  For fixed $u in I_alpha$, we will vary the height within the halfspace $alpha < 0$ to realize $u$ while keeping the $alpha$-height strongly negative. Choose a compact convex set $E subset W$ containing $pi v$, entirely in $alpha < 0$, such that every bracket word containing an outside-ray letter has $h_Z \( E \) > 0$. Here is why such an $E$ exists. Every generator form outside the positive $alpha$-ray is unbounded above on the halfspace ${ alpha lt.eq alpha \( pi v \) }$. For each outside form choose a point in that halfspace on which it is as large as desired, and take the convex hull together with $pi v$. The support maxima for inside-ray letters remain fixed negative numbers. Since the list of words and their lengths is finite, sufficiently large outside maxima make the support sum of every mixed word positive.
  By Lemma 38, the mixed words span $"Lie" \( I_alpha \)$. Thus the fixed element $u$ belongs to $B_t \( E \, O \( 1 \) \)$ for all sufficiently large $t$. One can see this directly in the all-word description of the box: the fixed coordinates of $log u$ in a mixed-word basis are dominated by its positive exponential widths. Choose an affine section $sigma : W arrow.r V$ of $pi$ with $sigma \( pi v \)$ equal to the abelianization of $v$. The compact convex set $E_V = sigma \( E \)$ contains that abelianization and satisfies $pi E_V = E$. The paths of Lemma 12, applied to $E_V$ and the pivot $exp \( t v \)$, connect $exp \( t v \)$ to $u exp \( t v \)$ in length $O \( t \)$ with heights in $t \( E + o \( 1 \) \)$. All their heights remain strictly negative in $alpha$ by a linear amount, and all their points have distance $O \( t \)$ from $1$. Left translation by $x$ and the preceding path estimate give $b \( x u \) = b \( x \)$.
  The stabilizer of $1 in L_alpha$ is $I_alpha D$. The two invariances therefore show that $b \( x \)$ depends only on $p_alpha x$. Define $f_beta \( p_alpha x \) = b \( x \)$. This establishes (10.4).
  #emph[Inverse and continuity.] By Proposition 44, $A_(macron(F)) = A^(- 1)$, so the construction for $macron(F)$ gives $macron(f) : L_beta arrow.r L_alpha$. For $x_t = x exp \( t v \)$ the quotient point $p_alpha x_t$ is fixed. Equation (10.4) at $x_t$ supplies representatives $z_t$ of $f_beta \( p_alpha x \)$ within a fixed distance of $F \( x_t \)$: lift the compact set $Q_beta$ to a bounded set in $G$. The coarse-inverse estimate and the shadow estimate for $macron(f)$ then give
  $ macron(f) \( f_beta \( p_alpha x \) \) in x_t dot.op Q' $
  for a fixed compact $Q' subset L_alpha$. The sets on the right contract to $p_alpha x$, since $alpha \( pi v \) < 0$. Thus $macron(f) f_beta = "id"$. Interchanging the maps proves $f_beta macron(f) = "id"$.
  Fix $x$ and $t$. The projection of a fixed-radius neighborhood of $x_t$ contains a neighborhood of $p_alpha x$; this uses only that the quotient projection is a submersion. By the Lipschitz bound and (10.4), its image under $f_beta$ is contained in $F \( x_t \) dot.op Q''$, with $Q''$ fixed. These sets have diameter tending to zero. Indeed, after normalization by $F \( x \)$, the $D$-part has length $O \( t \)$ and negative linear $beta$-height, so (10.3) applies; quotient left translations are isometries. The fixed action of $F \( x \)$ is Lipschitz, being a left translation followed by an automorphism. This proves continuity at $p_alpha x$. The same argument proves continuity of $macron(f)$, completing the proof. ◻
]

=== 10.2 Boundary volumes and variation along $N$-fibers <boundary-volumes-and-variation-along-n-fibers>

#thm([Lemma 10.2.])[
  (Volumes of boundary images).  #emph[For each source and target ray pair in Lemma 45, there is a fixed compact ball $U subset L_alpha$ with nonempty interior such that 
#[#set math.equation(numbering: n => "(10.6)")
 $ "vol"_(L_beta) #scale(x: 120%, y: 120%)[\(] f_beta \( x dot.op U \) #scale(x: 120%, y: 120%)[\)] asymp e^(ell_beta \( pi F \( x \) \)) #h(2em) \( x in G \) . $ <eq:boundary-volume>]

 The comparison constants and the choices of balls are uniform over the fixed quasi-isometry family.]
] <lem:boundary-volume>

#proof[
  Fix a unit ball $V_(-) subset L_beta$ and a bounded set of lifts of radius $R_(-)$ in $G$. Denote the common Lipschitz constants by $L_F \, L_(macron(F))$ and the common coarse-inverse error by $E_0$. For each such lift $b$,
  $ d_G \( macron(F) \( F \( x \) b \) \, x \) lt.eq L_(macron(F)) R_(-) + E_0 . $
  The shadow estimate for the inverse boundary map therefore puts $f_beta^(- 1) \( F \( x \) dot.op V_(-) \)$ inside $x dot.op U$, where $U$ is one compact ball containing
  $ { h dot.op q : \| h \|_G lt.eq L_(macron(F)) R_(-) + E_0 \, med q in Q_(upright("inv")) } . $
  Here $Q_(upright("inv"))$ is its fixed shadow compact. This choice of $U$ is independent of $x$.
  Choose a bounded lift set for this $U$ once, of radius $R_U$. For every lift $b$ in it, $d_G \( F \( x b \) \, F \( x \) \) lt.eq L_F R_U$. The forward shadow estimate gives $f_beta \( x dot.op U \) subset F \( x \) dot.op V_(+)$ for one compact $V_(+)$. Thus
  $ F \( x \) dot.op V_(-) subset f_beta \( x dot.op U \) subset F \( x \) dot.op V_(+) . $
  Both comparison sets have positive finite Haar volume. The $G$-action scales that volume by $e^(ell_beta \( pi F \( x \) \))$, proving the assertion. There are finitely many ray and label choices, so all constants can be chosen uniformly. ◻
]

#thm([Lemma 10.3.])[
  (Bounded variation on $N$-fibers).  #emph[There is a uniform constant $B_N$ such that 
$ \| pi F \( x n \) - pi F \( x \) \| lt.eq B_N #h(2em) \( F \, med x in G \, med n in N \) . $

 In particular $\| pi F \( n d \) - pi F \( d \) \| lt.eq B_N$ for all $n in N \, d in D$.]
] <lem:leaf-height>

#proof[
  Fix a generator $X_i$ and any $t in bb(R)$. For every source generator ray other than that of $alpha_i$, the element $exp \( t X_i \)$ lies in its ideal and acts trivially on the corresponding quotient. Hence the two source sets
  $ x exp \( t X_i \) dot.op U \, #h(2em) x dot.op U $
  are identical. Lemma 46 bounds the difference of the associated target trace heights by a uniform constant. By (10.1), this bounds every target ray-height difference except possibly the ray paired with $alpha_i$.
  There is a relation $sum_rho c_rho rho = 0$ over all distinct target generator rays, with every $c_rho > 0$, by Lemma 9. Applying it to the height difference bounds the one remaining form as well. Since the ray forms span $W^(*)$, there is a uniform constant $B_1$ with
  $ \| pi F \( x exp \( t X_i \) \) - pi F \( x \) \| lt.eq B_1 $
  for every $x \, i \, t$. No bound on $t$ is imposed.
  The sets $B_r \( cal(C) \)$ exhaust $N$, since every generator support maximum on $cal(C)$ is positive. By Lemma 10, every such box element is a product of at most one fixed number $M$ of generator exponentials. Their parameters can be arbitrary, because the preceding estimate is parameter independent. Thus $B_N = M B_1$ works for every $n$. Finally $n d = d \( d^(- 1) n d \)$ and $d^(- 1) n d in N$; applying the bound at the basepoint $d$ proves the last assertion without introducing any dependence on $d$. ◻
]

=== 10.3 Averaging and bounded height <averaging-and-bounded-height>

Fix a ray pair, its boundary map $f_beta$, and the ball $U$ from Lemma 46. Pull target Haar measure back to $L_alpha$ by this map. For $d in D$, the preceding two lemmas make the mass of every left translate of $d dot.op U$ comparable to $e^(ell_beta \( pi F \( d \) \))$, independently of the translating element. The next lemma compares this common mass with the source Haar volume of $d dot.op U$. Since that volume scales by $e^(ell_alpha \( pi d \))$, the comparison will relate source and target height characters.

#thm([Lemma 10.4.])[
  (Averaging translates of a Radon measure).  #emph[Let $L$ be a connected simply connected nilpotent Lie group with Haar measure $mu$ and a left invariant Riemannian metric. Let $rho$ be a Radon measure on $L$. Suppose a family of compact positive-Haar-measure sets $E_j$, including $E_0$, and positive numbers $a_j$ satisfy 
$ K^(- 1) a_j lt.eq rho \( z E_j \) lt.eq K a_j #h(2em) \( z in L \, med j \) $

 for one $K gt.eq 1$. Then 
$ frac(a_j, mu \( E_j \)) asymp frac(a_0, mu \( E_0 \)) $

 with constants depending only on $K$ and a large-scale volume doubling constant of $L$, independently of the shapes and diameters of the sets. Absolute continuity of $rho$ is not required.]
] <lem:haar-averaging>

#proof[
  For compact $E subset B \( R_E \)$ and $T > R_E$, Tonelli’s theorem gives
  $ integral_(B \( T \)) rho \( z E \) thin d mu \( z \) = integral_L mu \( B \( T \) ∩ y E^(- 1) \) thin d rho \( y \) . $
  Nilpotent groups are unimodular, so inversion preserves Haar measure. The inner quantity equals $mu \( E \)$ for $y in B \( T - R_E \)$, vanishes outside $B \( T + R_E \)$, and lies between zero and $mu \( E \)$ everywhere. Consequently
  #[#set math.equation(numbering: n => "(10.7)")
   $ mu \( E \) rho \( B \( T - R_E \) \) lt.eq integral_(B \( T \)) rho \( z E \) thin d mu \( z \) lt.eq mu \( E \) rho \( B \( T + R_E \) \) . $ <eq:haar-kernel-bounds>]
  Fix a large-scale doubling constant $D_0$ such that $mu \( B \( 2 T \) \) lt.eq D_0 mu \( B \( T \) \)$ for all sufficiently large $T$. Such a constant follows from the polynomial volume estimates for nilpotent groups, as in Lemma 6. Put $q_0 = a_0 \/ mu \( E_0 \)$. Apply (10.7) to $E_0$, first with averaging radius $T - R_(E_0)$ and then with radius $T + R_(E_0)$. The assumed translate bounds and doubling give, for sufficiently large $T$,
  $ \( K D_0 \)^(- 1) q_0 mu \( B \( T \) \) lt.eq rho \( B \( T \) \) lt.eq K D_0 q_0 mu \( B \( T \) \) . $
  For a fixed $j$, choose $T$ so large that these bounds apply to $T - R_(E_j)$ and $T + R_(E_j)$ and that $T gt.eq 2 R_(E_j)$. Use (10.7) for $E_j$ and the assumed translate bounds once more. Doubling yields
  $ \( K^2 D_0^2 \)^(- 1) q_0 lt.eq frac(a_j, mu \( E_j \)) lt.eq K^2 D_0^2 q_0 . $
  The required averaging radius may depend on $j$; the displayed constants do not. Only integration of nonnegative measurable functions was used, so the proof applies equally to singular Radon measures. ◻
]

#proof[
  If $W = 0$, the assertion is immediate. Otherwise first take a Lipschitz pair from the uniform family of Lemma 21, with label $A_F$ from Proposition 44. Fix a target ray $beta$ and its source ray $alpha = beta compose A_F$. Let $f_beta$ and $U$ be given by Lemmas 45 and 46. Define a Radon measure on $L_alpha$ by
  $ rho \( E \) = "vol"_(L_beta) \( f_beta \( E \) \) . $
  This is a measure because $f_beta$ is a homeomorphism; no absolute-continuity property is asserted.
  For $d in D$, put $U_d = d dot.op U$ and $a_d = e^(ell_beta \( pi F \( d \) \))$. Every $z in L_alpha$ has a representative $n in N$, and $z U_d = n d dot.op U$. Lemmas 46 and 47 give
  $ rho \( z U_d \) asymp a_d #h(2em) \( z in L_alpha \, d in D \) $
  with one uniform comparison constant. Lemma 48, applied to these sets and the reference set $U_1 = U$, implies
  $ frac(e^(ell_beta \( pi F \( d \) \)), "vol"_(L_alpha) \( U_d \)) asymp frac(e^(ell_beta \( pi F \( 1 \) \)), "vol"_(L_alpha) \( U \)) . $
  The source action scales Haar by $e^(ell_alpha \( pi d \))$. Taking logarithms therefore gives
  #[#set math.equation(numbering: n => "(10.8)")
   $ ell_beta \( pi F \( d \) - pi F \( 1 \) \) = ell_alpha \( pi d \) + O \( 1 \) #h(2em) \( d in D \) \, $ <eq:trace-height-bound>]
  with a uniform error.
  We identify its linear term using the already proved sublinear estimate. For $w in W$, choose $H in frak(d)$ with $pi H = w$ and set $d_t = exp_D \( t H \)$. Its length is $O \( t \)$, so (10.8) and Proposition 44 give
  $ t ell_alpha \( w \) + O \( 1 \) = ell_beta \( pi F \( d_t \) - pi F \( 1 \) \) = t ell_beta \( A_F w \) + o \( t \) . $
  After division by $t$, $ell_alpha = ell_beta compose A_F$. The target ray traces span $W^(*)$ by (10.1). A fixed spanning subfamily of (10.8) therefore yields
  $ \| pi F \( d \) - pi F \( 1 \) - A_F pi d \| lt.eq B_D #h(2em) \( d in D \) \, $
  with uniform $B_D$. For any $g = n d$, Lemma 47 and $pi n = 0$ extend this bound to $g$, with bound $B_D + B_N$. All finite ray and label choices were absorbed into the constants, so the conclusion holds for the whole fixed family.
  Finally an original $\( K \, C \)$ quasi-isometry is at a uniformly bounded distance from its Lipschitz approximation by Lemma 21. Since $pi$ is Lipschitz, changing back alters the error by a uniform constant, proving the stated theorem for the original maps. ◻
]

== 11 From bounded heights to polycyclicity <sec:recognition>

We now apply Theorem 4 to an arbitrary finitely generated group quasi-isometric to a virtually polycyclic group. The geometric step produces a homomorphism whose kernel is locally virtually nilpotent, meaning that every finitely generated subgroup of the kernel is virtually nilpotent. This proves elementary amenability. Finiteness and duality theorems then supply a polycyclic subgroup of finite index.

=== 11.1 The two Lie models <the-two-lie-models>

Two Lie groups serve different purposes below. A solvable Lie group $S$ contains a finite-index subgroup of the comparison group as a uniform lattice; its compact quotient supplies finiteness and Poincaré duality. A real-triangulable group $G$, quasi-isometric to $S$, supplies the height geometry. We do not require a lattice in $G$.

For the lattice model, we use the following finiteness terminology. A group $L$ is of type $F$ if it has a finite CW classifying space. It is of type $upright("FP")_n \( bb(Z) \)$ if the trivial module $bb(Z)$ has a projective resolution over $bb(Z) L$ that is finitely generated through degree $n$, and of type $upright("FP")_oo \( bb(Z) \)$ if this holds in every degree. Its integral cohomological dimension $"cd"_(bb(Z)) L$ is the minimum length of a projective $bb(Z) L$-resolution of $bb(Z)$, or infinity if no finite-length resolution exists. Type $F$ implies both $upright("FP")_oo \( bb(Z) \)$ and finite integral cohomological dimension. The recognition argument will use these two consequences separately.

We use the algebraic characterization of an integral Poincaré duality group of dimension $n$: the trivial module $bb(Z)$ admits a finite-length resolution by finitely generated projective $bb(Z) L$-modules, and

$ H^i \( L \; bb(Z) L \) = 0 quad \( i eq.not n \) \, #h(2em) H^n \( L \; bb(Z) L \) tilde.equiv bb(Z) quad upright("as abelian groups") . $

The right $L$-module $H^n \( L \; bb(Z) L \)$ is the orientation module; its action may be nontrivial, so orientability is not part of our convention. See #cite(label("Bieri1981")) Theorem 9.2 and Section 9.10 and the discussion preceding #cite(label("Li2018")) Corollary 4.48.

#thm([Lemma 11.1.])[
  #emph[Let $P$ be a finitely generated virtually polycyclic group, and let $H$ be a finitely generated group quasi-isometric to $P$. There exist a finite-index subgroup $Gamma lt.eq P$, a connected simply connected solvable Lie group $S$, and a connected simply connected real-triangulable unimodular Lie group $G$ such that 
$ Gamma upright(" is a uniform lattice in ") S \, #h(2em) H tilde.eq_(upright("QI")) P tilde.eq_(upright("QI")) S tilde.eq_(upright("QI")) G . $

 The group $H$ is amenable. Moreover, $Gamma$ has a finite classifying space and is an integral Poincaré duality group of dimension $dim S$.]
] <lem:model-reduction>

#proof[
  Dekimpe’s lattice realization theorem #cite(label("Dekimpe2000")) Theorem 4.1 gives $Gamma$ and $S$, with $Gamma$ normal of finite index in $P$ if desired. The uniform lattice acts properly and cocompactly by left translations on $S$. Thus its inclusion is a quasi-isometry by the Milnor–Švarc lemma; the same observation applies to a finite-index subgroup acting on a Cayley graph. See #cite(label("CornulierDeLaHarpe2016")) Theorem 4.C.5(1) and Proposition 4.C.11(3). Cornulier–Tessera’s reduction #cite(label("CornulierTessera2017")) Lemma 3.A.1 gives a real-triangulable $G$ quasi-isometric to $S$. It remains to check unimodularity and the stated properties of $H$ and $Gamma$.
  The group $P$ is amenable, since cyclic groups are amenable and this property is preserved by extensions and finite extensions. We give the metric Følner argument that transfers this information to $G$ and $H$. It is important here to obtain metric Følner sets in $G$, rather than only amenability as a locally compact group; compare #cite(label("Tessera2008")) Proposition 11.11 and Corollary 11.13.
  Let $Y$ denote either $G$, with a left invariant Riemannian metric and left Haar measure $mu$, or $H$, with a word metric and counting measure. Choose a quasi-isometry $u : P arrow.r Y$ with coarse-surjectivity radius $c > 0$, and fix $a > c$. For finite nonempty $E subset P$, put
  $ A_E = union.big_(p in E) B_Y \( u \( p \) \, a \) . $
  For each fixed radius, the lower quasi-isometry inequality bounds the number of points of $P$ whose images lie in a ball of that radius. Consequently the balls in this union have bounded multiplicity, and
  #[#set math.equation(numbering: n => "(11.1)")
   $ mu \( A_E \) gt.eq c_1 \| E \| $ <eq:recognition-folner-lower>]
  for a constant $c_1 > 0$ independent of $E$.
  Write $N_R \( A \)$ for the metric $R$-neighborhood of a set $A$. If $y in N_R \( A_E \) \\ A_E$, choose $p_y in P$ with $d_Y \( y \, u \( p_y \) \) lt.eq c$ and $p in E$ with $d_Y \( y \, u \( p \) \) lt.eq R + a + 1$. Since $a > c$, we have $p_y in.not E$. The lower quasi-isometry inequality gives $d_P \( p_y \, E \) lt.eq R'$, with $R'$ depending only on $R \, a$ and the quasi-isometry constants. It follows that
  #[#set math.equation(numbering: n => "(11.2)")
   $ mu #scale(x: 120%, y: 120%)[\(] N_R \( A_E \) \\ A_E #scale(x: 120%, y: 120%)[\)] lt.eq mu \( B_Y \( 1 \, c \) \) thin \| N_(R') \( E \) \\ E \| . $ <eq:recognition-folner-boundary>]
  An increasing-radius Følner sequence in $P$, together with (11.1)–(11.2), therefore gives finite-measure sets $A_j subset Y$ satisfying
  #[#set math.equation(numbering: n => "(11.3)")
   $ frac(mu \( N_R \( A_j \) \), mu \( A_j \)) arrow.r 1 #h(2em) upright("for every fixed ") R . $ <eq:recognition-metric-folner>]
  For the discrete group $H$, this is the Følner criterion for amenability.
  For $Y = G$, right translation by $g$ moves every point a distance $d_G \( 1 \, g \)$, so $A_j g subset N_(d_G \( 1 \, g \)) \( A_j \)$. If right translation multiplied left Haar measure by a factor greater than one, this inclusion would contradict (11.3). A nontrivial modular homomorphism has such a value, after replacing $g$ by $g^(- 1)$ if necessary. Thus $G$ is unimodular.
  Finally, a connected simply connected solvable Lie group of dimension $n$ is diffeomorphic to $bb(R)^n$; explicit coordinates are given in #cite(label("CornulierTessera2017")) Lemma 3.B.2. The compact smooth manifold $Gamma without S$ is therefore aspherical and has a finite CW structure. It is a finite classifying space for $Gamma$, and manifold Poincaré duality makes $Gamma$ an integral Poincaré duality group of dimension $n$. ◻
]

=== 11.2 Polynomial growth in a height kernel <polynomial-growth-in-a-height-kernel>

The polynomial packing estimate needed here is stronger than an estimate of the form $e^(o \( t \))$. Lemma 14 gives that estimate for paths whose heights remain bounded at every point. We record carefully how it applies to a subgroup with its own word metric.

#thm([Lemma 11.2.])[
  #emph[Let $G$ be a connected simply connected real-triangulable unimodular Lie group with the height homomorphism $pi : G arrow.r W$, and let $f : H arrow.r G$ be a quasi-isometry from a finitely generated group, normalized by $f \( e \) = 1$. Suppose $H_0 lt.eq H$ and $tau : H_0 arrow.r W$ is a homomorphism such that, for some $D < oo$, 
#[#set math.equation(numbering: n => "(11.4)")
 $ parallel pi f \( h \) - tau \( h \) parallel lt.eq D #h(2em) \( h in H_0 \) . $ <eq:recognition-corrected-height>]

 Then every finitely generated subgroup of $K_0 = ker tau$ has polynomial growth and is virtually nilpotent.]
] <lem:height-kernel-growth>

#proof[
  Fix a finitely generated subgroup $J lt.eq K_0$ and a finite symmetric generating set $T$ of $J$. The heights of all orbit points $f \( j \)$, $j in J$, have norm at most $D$. For a word $j = t_1 dots.h.c t_m$ with $m lt.eq t$, put $j_i = t_1 dots.h.c t_i$. The upper quasi-isometry inequality gives a constant $L_T$ such that
  $ d_G \( f \( j_(i - 1) \) \, f \( j_i \) \) lt.eq L_T #h(2em) \( 1 lt.eq i lt.eq m \) . $
  Join these successive points by minimizing geodesics. The resulting path starts at $1$, ends at $f \( j \)$, and has length at most $L_T t$. The homomorphism $pi$ is Lipschitz for a left invariant Riemannian metric: its differential has constant norm in left-trivialized tangent spaces. If $L_pi$ is a Lipschitz constant, every point of the path has height norm at most $D + L_pi L_T$.
  Lemma 14, with these fixed length and height bounds, shows that a maximal $1$-separated subset of $f \( B_T \( t \) \)$ has at most $C_T \( 1 + t \)^(b_T)$ points. The unit balls about that subset cover $f \( B_T \( t \) \)$. The lower quasi-isometry inequality bounds the number of elements of $H$ mapping into each such ball by one constant: any two such elements are at uniformly bounded distance in the fixed word metric of $H$. Hence
  $ \| B_T \( t \) \| lt.eq C'_T \( 1 + t \)^(b_T) . $
  This is an intrinsic growth bound for $J$; no undistortion of $J$ in $H$ is assumed. Gromov’s polynomial-growth theorem #cite(label("Gromov1981")) Main Theorem, p. 54 makes $J$ virtually nilpotent. ◻
]

The packing input works with lifts to $N times.r D$: compactly bounded increment lifts place chosen endpoint lifts in a polynomial-volume coordinate region. Separation in $G$ separates these lifts, as in Lemma 14, so the argument applies even when $N ∩ D eq.not { 1 }$.

=== 11.3 The transferred action and elementary amenability <the-transferred-action-and-elementary-amenability>

We use the term #emph[elementary amenable] for the smallest class of groups containing finite and abelian groups and closed under subgroups, quotients, extensions, and directed unions. In the next proposition amenability is a hypothesis, but elementary amenability is a conclusion.

#thm([Proposition 11.3.])[
  #emph[Let $G$ be a connected simply connected real-triangulable unimodular Lie group with height homomorphism $pi : G arrow.r W$. Let $H$ be a finitely generated amenable group quasi-isometric to $G$. Assume the uniform bounded-height conclusion of Theorem 4 for the family of self-quasi-isometries transferred from left translations of $H$. Then there is a finite-index normal subgroup $H_0 lt.eq H$ and a homomorphism $tau : H_0 arrow.r W$ whose kernel is locally virtually nilpotent. In particular, $H$ is elementary amenable.]
] <prop:recognition-from-height>

#proof[
  Choose quasi-inverse maps $f : H arrow.r G$ and $r : G arrow.r H$. Bounded changes allow us to arrange $f \( e \) = 1$ and $r \( 1 \) = e$. For $h in H$, define
  $ F_h = f compose L_h compose r \, #h(2em) L_h \( k \) = h k . $
  The maps $F_h$ have uniform quasi-isometry constants, because the maps $L_h$ are isometries. There is a constant $D_0$ such that
  #[#set math.equation(numbering: n => "(11.5)")
   $ sup_(g in G) d_G \( F_h F_k \( g \) \, F_(h k) \( g \) \) lt.eq D_0 #h(2em) \( h \, k in H \) \, $ <eq:recognition-quasiaction>]
  and $F_e$ is uniformly close to the identity. These assertions follow from the bounded errors in $r compose f$ and $f compose r$. Also $F_h \( 1 \) = f \( h \)$.
  Put $s \( h \) = pi f \( h \)$. The assumed height theorem gives a single $B < oo$ and matrices $A_h$ in the fixed finite group $cal(A)_G$ such that
  #[#set math.equation(numbering: n => "(11.6)")
   $ parallel pi F_h \( g \) - s \( h \) - A_h pi \( g \) parallel lt.eq B #h(2em) \( h in H \, med g in G \) . $ <eq:recognition-affine-action>]
  Apply this formula twice to $F_h F_k \( g \)$, and compare with its application to $F_(h k) \( g \)$ using (11.5). It follows that
  $ \( A_h A_k - A_(h k) \) pi \( g \) $
  is bounded as $g$ ranges over $G$. Since $pi$ is surjective onto the vector space $W$, its linear coefficient vanishes. Similarly $A_e = I$. Thus $h mapsto A_h$ is a homomorphism, and
  $ H_0 = { h in H : A_h = I } $
  is normal and has finite index. Evaluating the same comparison at $g = 1$ gives a constant $D_1$ such that
  #[#set math.equation(numbering: n => "(11.7)")
   $ parallel s \( h k \) - s \( h \) - s \( k \) parallel lt.eq D_1 #h(2em) \( h \, k in H_0 \) . $ <eq:recognition-defect>]
  The uniform constant in the height theorem is essential here: $D_1$ does not depend on $h$ or $k$.
  The subgroup $H_0$ is amenable. Let $m$ be a left-invariant mean on bounded real functions on $H_0$, extended coordinatewise to functions with values in $W$. Define
  #[#set math.equation(numbering: n => "(11.8)")
   $ tau \( h \) = m_x #scale(x: 120%, y: 120%)[\(] s \( h x \) - s \( x \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) h in H_0 . $ <eq:recognition-mean>]
  For fixed $h$, the function being averaged is bounded, since (11.7) bounds its distance from $s \( h \)$ by $D_1$. Positivity of the mean gives
  #[#set math.equation(numbering: n => "(11.9)")
   $ parallel tau \( h \) - s \( h \) parallel lt.eq D_1 . $ <eq:recognition-mean-error>]
  To verify additivity, write
  $ s \( h k x \) - s \( x \) = s \( h k x \) - s \( k x \) + s \( k x \) - s \( x \) . $
  Left invariance under $x mapsto k x$ shows that the means of the two terms on the right are $tau \( h \)$ and $tau \( k \)$. Therefore $tau \( h k \) = tau \( h \) + tau \( k \)$.
  Let $K_0 = ker tau$. Equation (11.9) is the hypothesis of Lemma 50; that lemma makes each finitely generated subgroup of $K_0$ virtually nilpotent. Nilpotent groups are elementary amenable by their central series, and so are their finite extensions. The finitely generated subgroups of $K_0$ form a directed family with union $K_0$. Thus $K_0$ is elementary amenable. The exact sequence
  $ 1 arrow.r K_0 arrow.r H_0 arrow.r^tau tau \( H_0 \) arrow.r 1 $
  and abelianness of $tau \( H_0 \)$ show that $H_0$ is elementary amenable. Finally $H \/ H_0$ is finite, so $H$ is elementary amenable as well. ◻
]

The image $tau \( H_0 \)$ need not be discrete in $W$, and the kernel $K_0$ need not be finitely generated. Neither property was used: abelianness of the image and the directed-union argument are sufficient.

=== 11.4 Finiteness, duality, and the conclusion <finiteness-duality-and-the-conclusion>

The previous proposition supplies elementary amenability. To complete recognition, we first transfer $upright("FP")_oo \( bb(Z) \)$ from the comparison lattice. The elementary amenable finiteness theorem then gives a finite-index subgroup of type $F$, which supplies the finite cohomological dimension needed for duality transfer.

#proof[
  Let $P$ and $H$ satisfy the hypotheses of the theorem. Apply Lemma 49 and retain both the real-triangulable unimodular model $G$ and the uniform lattice $Gamma lt.eq S$.
  If $W = 0$, Lemma 7 makes $G$ nilpotent. Its metric balls have polynomial Haar volume, by the nilpotent coordinate bounds of Lemma 6. A quasi-isometry from $H$ to $G$ has bounded multiplicity on bounded scales, so disjoint small-ball packing transfers this to polynomial word growth of $H$. Gromov’s theorem #cite(label("Gromov1981")) Main Theorem, p. 54 makes $H$ virtually nilpotent, hence virtually polycyclic. This also includes the zero-dimensional model: in that case $H$ is finite. We may therefore suppose $W eq.not 0$.
  By Lemma 49, $H$ is amenable. Apply Theorem 4 to the uniform family transferred from its left translations. Proposition 51 shows that $H$ is elementary amenable.
  The group $Gamma$ has a finite classifying space and is quasi-isometric to $H$. Li’s coarse invariance theorem #cite(label("Li2018")) Corollary 4.47, applied over $bb(Z)$ for each $n$, gives $H in upright("FP")_oo \( bb(Z) \)$. The elementary amenable finiteness theorem #cite(label("KrophollerMartinezPerezNucinkis2009")) Theorem 1.1, (viii)$arrow.r.double$(v) now gives a finite-index subgroup $V lt.eq H$ of type $F$. The structural conclusion recorded in Section 2 of the same paper also gives a finite-index solvable subgroup $U lt.eq H$. Set $H_1 = U ∩ V$. Then $H_1$ is solvable and has finite index in $H$. The finite cover of a finite classifying space for $V$ corresponding to $H_1$ is a finite classifying space for $H_1$. In particular,
  $ "cd"_(bb(Z)) H_1 < oo . $
  This also implies that $H_1$ is torsion-free: restriction of a finite projective resolution to a hypothetical nontrivial finite cyclic subgroup would give finite integral cohomological dimension for that subgroup, which is impossible.
  Both $H_1$ and $Gamma$ now have finite integral cohomological dimension, and they are quasi-isometric. Since $Gamma$ is an integral Poincaré duality group, Li’s duality transfer #cite(label("Li2018")) Corollary 4.48, with coefficient ring $bb(Z)$, makes $H_1$ an integral Poincaré duality group. Here the type-$F$ subgroup supplies the finite-cohomological-dimension hypothesis. Bieri’s theorem #cite(label("Bieri1981")) Theorem 9.23 says that a solvable integral Poincaré duality group is polycyclic. Hence $H_1$ is polycyclic, and $H$ is virtually polycyclic. ◻
]

#proof[
  Let $Lambda$ be a lattice in a connected simply connected solvable Lie group $S$. Such a lattice is polycyclic #cite(label("FarbWeinberger2008")) Proposition 3.4, and is uniform #cite(label("Geng2015")) Theorem 2.9(i). It is therefore finitely generated and quasi-isometric to $S$ by the Milnor–Švarc lemma. A finitely generated group $H$ quasi-isometric to $Lambda$, or equivalently to $S$, is virtually polycyclic by Theorem 1. Dekimpe’s realization theorem #cite(label("Dekimpe2000")) Theorem 4.1 then embeds a finite-index subgroup of $H$ as a uniform lattice in some connected simply connected solvable Lie group.
  Conversely, every virtually polycyclic comparison group has such a finite-index lattice model by the same realization theorem. Finite index preserves quasi-isometry, so the lattice formulation implies the group formulation. The ambient Lie group obtained for $H$ is not prescribed by this equivalence. ◻
]

== 12 Lipschitz representatives <app:lipschitz-representatives>

We prove the uniform replacement lemma used to construct the compact space of quasi-isometry pairs in Section 5.

#proof[
  A coarse inverse can first be chosen with constants depending only on $K \, C$. Indeed, for each target point choose a source point whose image is within the coarse-surjectivity constant. The two quasi-isometry inequalities bound the distortion of this choice and its two composition errors. It is therefore enough to smooth either member of a uniformly controlled coarse-inverse pair by a bounded amount.
  Choose a maximal $1$-separated set $cal(V) subset G$. Properness makes it locally finite, and maximality makes its closed unit balls cover $G$. The cover by open balls of radius $2$ has uniformly bounded multiplicity: disjoint balls of radius $1 \/ 3$ about participating centers lie in a ball of fixed radius, and left invariance gives the same Haar-volume ratio at every center. Its nerve therefore has bounded dimension, say $q$; realize each simplex as a standard regular Euclidean simplex with unit edges. The functions
  $ a_v \( g \) = max { 0 \, 2 - d \( g \, v \) } \, #h(2em) lambda_v \( g \) = frac(a_v \( g \), sum_(u in cal(V)) a_u \( g \)) $
  define a partition map $lambda$ from $G$ to the nerve. The denominator is at least $1$. If $M$ bounds the cover multiplicity, normalization and the $1$-Lipschitz cutoffs give $parallel lambda \( g \) - lambda \( h \) parallel_1 lt.eq 4 M d \( g \, h \)$. This also controls the intrinsic piecewise Euclidean metric. Indeed, for probability vectors $a \, b$ with $parallel a - b parallel_1 < 2$, normalize their coordinatewise minimum to a probability vector $c$. The vector $c$ lies in the common face of their support simplices, and the two segments $a$ to $c$ and $c$ to $b$ have total Euclidean length at most $2 parallel a - b parallel_1$. Thus $lambda$ is locally $8 M$-Lipschitz for the intrinsic metric. Subdivision of geodesics in $G$ makes this a global bound.
  Let $J$ be either coarse map. Map the vertex $v$ to $J \( v \)$. The image vertices of a simplex have uniformly bounded diameter, since its source vertices have pairwise distance at most $4$. Extend over simplices by increasing dimension, always preserving the maps already defined on their faces. The required controlled extension uses exponential coordinates on $G$, which are global by Lemma 5. For a center $p in G$ put
  $ cal(C)_p \( s \, z \) = p exp #scale(x: 120%, y: 120%)[\(] s log \( p^(- 1) z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 lt.eq s lt.eq 1 . $
  For every fixed $R$, on $d \( p \, z \) lt.eq R$ this contraction has a uniformly bounded derivative in $s$ and spatial Lipschitz constant at most $c_R s$. To see the latter bound, differentiate the smooth map $exp \( s log z \)$ on a compact set. Its spatial derivative vanishes at $s = 0$, so the mean-value estimate in $s$ supplies the factor $s$. For the spatial distance estimate, bound derivatives on an enlarged compact ball containing geodesics between points of the original ball. Left translation makes the bounds independent of $p$.
  On a simplex write a point as $b + s \( u - b \)$, where $b$ is its barycenter and $u$ lies on its boundary. If $H$ is the previously constructed boundary map, extend it by $cal(C)_p \( s \, H \( u \) \)$, taking $p$ to be the image of one vertex. Facewise Lipschitz bounds give a Lipschitz boundary map for the Euclidean distance, since the boundary of a regular simplex of dimension at least two has bounded intrinsic quasiconvexity constant. For an edge its two endpoint images already have bounded distance. The radial extension is quantitatively Lipschitz: if $rho$ is the distance from $b$ to the boundary and $D$ is the maximum distance from $b$ to the simplex, then for $x = b + s \( u - b \)$ and $x' = b + s' \( u' - b \)$ one has
  $ \| s - s' \| lt.eq rho^(- 1) \| x - x' \| \, #h(2em) min \( s \, s' \) \| u - u' \| lt.eq \( 1 + D \/ rho \) \| x - x' \| . $
  Combine these with the spatial $O \( s \)$ bound and the uniform time derivative bound of $cal(C)_p$. Regular simplices of bounded dimension have uniform values of the geometric constants involved. The extension also remains in a ball of controlled radius about the vertex images, because the contraction is evaluated on a fixed compact ball. Induction through at most $q$ dimensions gives one uniform Lipschitz constant and one uniform radius. Shared faces retain their previous maps, so the extensions agree. Simplexwise Lipschitz bounds give a Lipschitz map for the intrinsic metric of the nerve.
  Compose this map with $lambda$. Whenever $lambda_v \( g \) > 0$, one has $d \( g \, v \) < 2$, hence $d \( J \( g \) \, J \( v \) \) lt.eq 2 K' + C'$ for the uniform constants of the coarse map under consideration. The controlled radius of the simplex extension therefore bounds the distance of the resulting Lipschitz map from $J$, uniformly in $g$.
  Apply this construction to both coarse maps. Bounded perturbations preserve the lower quasi-isometry inequalities. They preserve the bounded composition errors as well: use the original coarse upper inequality to compare the original map at two points a bounded distance apart, and then the bounded perturbation of its values. Enlarging a single constant $Lambda$ gives all the stated bounds. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
