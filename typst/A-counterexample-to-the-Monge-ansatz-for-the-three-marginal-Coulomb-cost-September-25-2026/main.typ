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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to the Monge ansatz \
for the three-marginal Coulomb cost]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 The problem and the result <sec:introduction>

For a Borel probability measure $mu$ on $bb(R)^3$, let $Pi \( mu \, mu \, mu \)$ denote the probability measures on $\( bb(R)^3 \)^3$ with all three coordinate marginals equal to $mu$. We use the Coulomb cost

#[#set math.equation(numbering: n => "(1)")
 $ c \( x_1 \, x_2 \, x_3 \) = frac(1, \| x_1 - x_2 \|) + frac(1, \| x_1 - x_3 \|) + frac(1, \| x_2 - x_3 \|) \, $ <eq:cost>]

where $c = + oo$ if two coordinates coincide, and write

$ E_(*) \( mu \) = inf_(pi in Pi \( mu \, mu \, mu \)) integral c thin d pi . $

Here and below $\| dot.op \|$ is the Euclidean norm. A #emph[Monge plan] is a coupling of the form $\( "Id" \, T_2 \, T_3 \)_(\#) mu$, where $T_2 \, T_3 : bb(R)^3 arrow.r bb(R)^3$ are Borel maps and $\( T_2 \)_(\#) mu = \( T_3 \)_(\#) mu = mu$. For a Borel map $T$, the pushforward is defined by $T_(\#) mu \( A \) = mu \( T^(- 1) \( A \) \)$. For a map defined on a set of full measure, we use the same notation for the pushforward of the measure restricted to that set.

The question is whether absolute continuity of $mu$, together with $E_(*) \( mu \) < oo$, guarantees an optimal Monge plan. We give a counterexample with additional regularity.

#thm([Theorem 1.1.])[
  #emph[There is a nonnegative density $rho$ on $bb(R)^3$ such that 
$ integral_(bb(R)^3) rho \( x \) thin d x = 1 \, #h(2em) rho in C_c^oo \( bb(R)^3 \) \, #h(2em) sqrt(rho) in C_c^oo \( bb(R)^3 \) \, $

 with the following properties. For $mu = rho thin d x$, the value $E_(*) \( mu \)$ is finite and is attained by a coupling in $Pi \( mu \, mu \, mu \)$, but every pair of Borel maps $T_2 \, T_3 : bb(R)^3 arrow.r bb(R)^3$ satisfying $\( T_2 \)_(\#) mu = \( T_3 \)_(\#) mu = mu$ obeys 
$ integral_(bb(R)^3) c #scale(x: 120%, y: 120%)[\(] x \, T_2 \( x \) \, T_3 \( x \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) > E_(*) \( mu \) . $

 The inequality permits the left-hand side to be infinite.]
] <thm:main>

The maps in the theorem are arbitrary Borel maps. In particular, the conclusion concerns existence of any Monge optimizer and includes maps with no cyclic relation or regularity. The theorem also excludes optimal symmetrizations of admissible Monge plans, since permutation averaging preserves their marginals and Coulomb cost.

===== 1.1 History and significance. <history-and-significance.>

Coulomb multi-marginal transport arises in the strong-interaction limit of density functional theory. In this setting the description of optimal configurations by measure-preserving maps is usually called the Monge or co-motion ansatz. The co-motion formulation was developed in the strictly correlated electron literature; see Seidl, Gori-Giorgi and Savin #cite(label("SGS2007")) and the account by Friesecke, Gerolin and Gori-Giorgi #cite(label("FGG2023")). The distinction between equality of optimal values and attainment by maps is essential. Colombo and Di Marino #cite(label("CDM2015")) author version, Theorem 1.1 proved that the Coulomb Kantorovich minimum equals the infimum over measure-preserving cyclic maps for identical non-atomic marginals. This provides approximating maps without asserting that a minimizing map exists. Section 6 gives a direct proof of equality of the two infima for the particular marginal constructed here.

For two particles, Cotar, Friesecke and Klüppelberg #cite(label("CFK2013")) arXiv version, Theorem 3.6 proved existence and uniqueness of an optimal map for absolutely continuous marginals in every dimension. For arbitrary particle number on the line, Colombo, De Pascale and Di Marino #cite(label("CDDM2015")) Theorem 1.1 constructed optimal cyclic maps for identical nonatomic marginals with finite transport value. Pass #cite(label("Pass2013")) constructed Coulomb optimizers that are not induced by maps for radial data; the existence of such an optimizer does not exclude a different optimizer of Monge form. Colombo and Stra #cite(label("CS2016")) gave counterexamples to the prescribed radial quantile-cyclic constructions. Bindini, De Pascale and Kausamo #cite(label("BDK2022")) subsequently constructed smooth densities for the reduced radial cost of the planar three-particle problem for which none of the four prescribed maps III, DDI, DID and IDD is optimal. This radial cost is obtained by minimizing the Coulomb interaction over angles; it is different from the Coulomb cost on the line.

The general higher-dimensional map-attainment question with at least three particles is recorded in the 2022 preprint of #cite(label("FGG2023")) arXiv version, Theorem 2.4 and the following discussion. The three-particle Coulomb question in $bb(R)^3$ was still stated as open in January 2026 by Friesecke #cite(label("Friesecke2026")) Section 3.2. Theorem 1 excludes every preserving Borel pair for a smooth identical marginal. With the particle-density normalization $n = 3 rho$, one has $integral n = 3$ and $sqrt(n) in H^1 \( bb(R)^3 \)$. Thus the example belongs to the physical density class $D_3$ of #cite(label("FGG2023")) arXiv version, Eq. (12). This is a density-regularity statement; no external potential or ground-state realization is asserted.

Our construction adapts the shared-component splitting mechanism of Gerolin, Kausamo and Rajala #cite(label("GKR2019")) for the repulsive harmonic cost $- sum_(i < j) \| x_i - x_j \|^2$. For the Coulomb interaction, the additional task is to build two families of triples with a common supporting potential. We obtain these families and their supporting inequalities by local calculus.

===== 1.2 Idea of the proof. <idea-of-the-proof.>

The construction has two parts: a geometric condition that forces every optimal plan onto two prescribed families of triples, and a mass imbalance that prevents a preserving map from choosing between them. Let $B$ be a small ball about zero, and let $e_1 \, e_2$ be the first two coordinate unit vectors. We construct smooth diffeomorphisms $Y_k \, W_k$, for $k = 1 \, 2$, from $B$ onto small components near $e_k \, - e_k$, respectively. The two families are

$ \( x \, Y_k \( x \) \, W_k \( x \) \) \, #h(2em) x in B \, quad k in { 1 \, 2 } \, $

together with their coordinate permutations; see Figure 1.

The triples $\( 0 \, e_k \, - e_k \)$ have the same Coulomb cost and the same central gradient. This allows the two local families to share a supporting potential on $B$. Completing this potential on the four outer components gives an inequality $c \( x_1 \, x_2 \, x_3 \) gt.eq u \( x_1 \) + u \( x_2 \) + u \( x_3 \)$, with equality precisely on the two families. Strict cost gaps exclude the other triples of distinct centers; the Coulomb singularity excludes repeated components after the neighborhoods have been made small enough.

For a smooth probability measure $nu$ on $B$, we form the marginal $mu$ by giving the central component measure $nu \/ 3$ and each outer component measure $\( Y_k \)_(\#) nu \/ 6$ or $\( W_k \)_(\#) nu \/ 6$. Randomly choosing a branch and permuting its three coordinates then gives an optimal coupling with this common marginal. Every optimizer must saturate the supporting inequality. In particular, on the central component, a deterministic map must choose one of the four branch images. If it chooses a branch $H$ on a Borel set $S subset B$, it sends mass $nu \( S \) \/ 3$ into $H \( S \)$, which has marginal mass only $nu \( S \) \/ 6$. This contradicts preservation on every selection set of positive mass. The exact image-measure relation, rather than the component totals alone, excludes arbitrarily irregular choices of branch.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.25cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B$ near $0$#linebreak()mass $1"/"3$]]])])
  content((3.8, 0), [#box(width: 2.25cm, inset: 0.3333em, radius: 4pt, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y_1(B)$ near $e_1$#linebreak()mass $1"/"6$]]])])
  content((-3.8, 0), [#box(width: 2.25cm, inset: 0.3333em, radius: 4pt, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_1(B)$ near $-e_1$#linebreak()mass $1"/"6$]]])])
  content((0, 1.9), [#box(width: 2.25cm, inset: 0.3333em, radius: 4pt, stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff9f2"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y_2(B)$ near $e_2$#linebreak()mass $1"/"6$]]])])
  content((0, -1.9), [#box(width: 2.25cm, inset: 0.3333em, radius: 4pt, stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff9f2"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_2(B)$ near $-e_2$#linebreak()mass $1"/"6$]]])])
  line((1.125, 0), (2.675, 0), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  content((1.9, 0), [#text(size: 9pt)[$Y_1$]], anchor: "south", padding: 0.1176cm)
  line((-1.125, 0), (-2.675, 0), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  content((-1.9, 0), [#text(size: 9pt)[$W_1$]], anchor: "south", padding: 0.1176cm)
  line((0, 0.425), (0, 1.475), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#994d00"))))
  content((0, 0.95), [#text(size: 9pt)[$Y_2$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.425), (0, -1.475), stroke: (paint: rgb("#994d00"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#994d00"))))
  content((0, -0.95), [#text(size: 9pt)[$W_2$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Schematic positions of the five disjoint components, with their marginal masses. Every optimal plan is concentrated on triples joining a central point to its two images with the same subscript. The arrows denote local diffeomorphisms, not straight transport trajectories. For each indicated map $H$ and Borel set $S subset B$, $mu \( H \( S \) \) = mu \( S \) \/ 2$. ],
) <fig:components>

Sections 2–5 establish the mass obstruction, construct and certify the two local families, and form the smooth marginal and an explicit optimizer. Section 6 constructs preserving maps whose costs approach that optimum. Section 7 extends the construction to every inverse-power Riesz cost in every Euclidean dimension at least two.

== 2 An obstruction to deterministic selection <sec:splitting>

We isolate the measure-theoretic step. A homeomorphism onto an open image sends Borel sets to Borel sets, since its inverse is continuous.

#thm([Lemma 2.1.])[
  #emph[Let $d gt.eq 2$ be an integer, let $B subset bb(R)^d$ be open, let $nu$ be a Borel probability measure with $nu \( B \) = 1$, and let $H_1 \, dots.h \, H_4 : B arrow.r bb(R)^d$ be homeomorphisms onto open images. Suppose that $B \, H_1 \( B \) \, dots.h \, H_4 \( B \)$ are pairwise disjoint. Define 
#[#set math.equation(numbering: n => "(2)")
 $ mu = 1 / 3 nu + 1 / 6 sum_(j = 1)^4 \( H_j \)_(\#) nu . $ <eq:split-measure>]

 There is no Borel map $T : bb(R)^d arrow.r bb(R)^d$ such that $T_(\#) mu = mu$ and 
#[#set math.equation(numbering: n => "(3)")
 $ T \( x \) in { H_1 \( x \) \, dots.h \, H_4 \( x \) } quad upright("for ") nu upright("-almost every ") x in B . $ <eq:selection>]

]
] <lem:splitting>

#proof[
  For each $j$, define the Borel set
  $ S_j = { x in B : T \( x \) = H_j \( x \) } . $
  Its image $H_j \( S_j \)$ is Borel. Pairwise disjointness of the component images and injectivity of $H_j$ give
  $ mu \( S_j \) = 1 / 3 nu \( S_j \) \, #h(2em) mu \( H_j \( S_j \) \) = 1 / 6 nu \( S_j \) . $
  Since $S_j subset T^(- 1) \( H_j \( S_j \) \)$, preservation of $mu$ would imply
  $ 1 / 3 nu \( S_j \) lt.eq mu \( T^(- 1) \( H_j \( S_j \) \) \) = mu \( H_j \( S_j \) \) = 1 / 6 nu \( S_j \) . $
  Thus $nu \( S_j \) = 0$ for all four indices, contradicting (3). ◻
]

The argument does not require $nu$ to be uniform or even absolutely continuous. Additional points mapped into $H_j \( S_j \)$ can only increase its preimage mass. Matching the total mass of each component by a partition therefore cannot remove the obstruction.

== 3 Two local Coulomb branches <sec:local>

Put $a_1 = e_1 = \( 1 \, 0 \, 0 \)$ and $a_2 = e_2 = \( 0 \, 1 \, 0 \)$. At each of the two triples $\( 0 \, a_k \, - a_k \)$,

#[#set math.equation(numbering: n => "(4)")
 $ c \( 0 \, a_k \, - a_k \) = 5 / 2 \, #h(2em) nabla_x c \( 0 \, a_k \, - a_k \) = 0 \, #h(2em) nabla_z c \( 0 \, a_k \, - a_k \) = 5 / 4 a_k . $ <eq:center-jets>]

The equal cost values and vanishing central gradients allow the two families to share one central potential.

Near each center triple, we use the positive outer point $y$ as the parameter and find the central and negative outer points by minimization. Subtracting suitable concave quadratic potentials in those two coordinates makes the minimum unique; its value defines the potential at $y$. We also require both minimizing coordinates to depend diffeomorphically on $y$. We can then invert the central coordinate and obtain both outer components as diffeomorphic images of a common central set.

#thm([Lemma 3.1.])[
  #emph[There are a number $K > 0$, open neighborhoods $P_0^k \, P_k^(+) \, P_k^(-)$ of $0 \, a_k \, - a_k$, respectively, and smooth maps $X_k \, Z_k : P_k^(+) arrow.r bb(R)^3$, for $k = 1 \, 2$, with the following properties:]
  + #emph[Each of $X_k$ and $Z_k$ is a diffeomorphism onto its open image, and 
$ X_k \( a_k \) = 0 \, #h(2em) Z_k \( a_k \) = - a_k . $

]
  + #emph[Define 
$ u_0 \( x \) = 5 / 2 - K / 2 \| x \|^2 \, #h(2em) v_k \( z \) = 5 / 4 a_k dot.op \( z + a_k \) - K / 2 \| z + a_k \|^2 . $

 There is a smooth function $w_k : P_k^(+) arrow.r bb(R)$, with $w_k \( a_k \) = 0$, such that on $P_0^k times P_k^(+) times P_k^(-)$, 
#[#set math.equation(numbering: n => "(5)")
 $ c \( x \, y \, z \) gt.eq u_0 \( x \) + w_k \( y \) + v_k \( z \) . $ <eq:local-certificate>]

 Equality holds if and only if $\( x \, z \) = \( X_k \( y \) \, Z_k \( y \) \)$.]
] <lem:local>

#proof[
  For a parameter $K > 0$, use the potentials in the statement and set
  $ F_k \( x \, y \, z \) = c \( x \, y \, z \) - u_0 \( x \) - v_k \( z \) . $
  By (4), its $\( x \, z \)$-gradient vanishes at the $k$-th center triple. We choose $K$ to obtain a unique minimizing pair on a small product neighborhood for each fixed $y$, and to make each coordinate of the resulting minimizing pair an invertible function of $y$.
  The Coulomb cost is smooth near both center triples. At the $k$-th center, write
  $ M_k = D_(\( x \, z \) \( x \, z \))^2 c \, #h(2em) N_k = D_y nabla_(\( x \, z \)) c . $
  The $\( x \, z \)$-Hessian of $F_k$ there is $M_k + K I_6$, while its mixed derivative in $y$ is $N_k$. For $h \( b \) = \| b \|^(- 1)$, $b eq.not 0$, differentiation gives
  #[#set math.equation(numbering: n => "(6)")
   $ D^2 h \( b \) = \| b \|^(- 3) (3 frac(b b^(sans(T)), \| b \|^2) - I_3) . $ <eq:pair-hessian>]
  This matrix has eigenvalues $2 \| b \|^(- 3) \, - \| b \|^(- 3) \, - \| b \|^(- 3)$ and is therefore invertible. The two $3 times 3$ blocks of $N_k$ are
  $ - D^2 h \( - a_k \) \, #h(2em) - D^2 h \( - 2 a_k \) \, $
  and hence are both invertible. The matrices $M_k$ are fixed symmetric $6 times 6$ matrices. For all sufficiently large $K$, both $M_k + K I_6$ are positive definite. Moreover,
  $ K \( M_k + K I_6 \)^(- 1) N_k = \( I_6 + K^(- 1) M_k \)^(- 1) N_k arrow.r N_k . $
  Invertibility is an open condition on $3 times 3$ matrices, so we may choose a single $K$ for which both blocks of $\( M_k + K I_6 \)^(- 1) N_k$ are invertible for each $k$.
  Fix such a $K$. The implicit function theorem applied to $nabla_(\( x \, z \)) F_k = 0$ gives a smooth stationary branch
  $ nabla_(\( x \, z \)) F_k \( X_k \( y \) \, y \, Z_k \( y \) \) = 0 \, $
  with the prescribed center values. Differentiating this equation at $y = a_k$ gives
  $ D \( X_k \, Z_k \) \( a_k \) = - \( M_k + K I_6 \)^(- 1) N_k . $
  The two block invertibilities allow the inverse function theorem to be applied separately to $X_k$ and $Z_k$. After restricting to one sufficiently small neighborhood of $a_k$, both maps are diffeomorphisms onto their open images.
  By continuity, the $\( x \, z \)$-Hessian of $F_k$ remains positive definite on a product of sufficiently small open balls around the three centers. Shrink the $y$-ball so that the stationary pair $\( X_k \( y \) \, Z_k \( y \) \)$ belongs to the product of the other two balls. For fixed $y$, this latter product is convex. The positive definite Hessian makes $F_k \( dot.op \, y \, dot.op \)$ strictly convex on it, so its stationary pair is its unique minimum there.
  Define its minimum value by
  $ w_k \( y \) = F_k \( X_k \( y \) \, y \, Z_k \( y \) \) . $
  The preceding minimum property gives (5) with exactly the stated equality set. The center values in (4) give $w_k \( a_k \) = 0$. All neighborhoods can be restricted further as needed to retain the separate diffeomorphism properties. ◻
]

== 4 A supporting inequality on five components <sec:certificate>

The two local inequalities use the same central potential. We can therefore combine their functions into one potential on five disjoint components. To identify its entire equality set, we must also show strict inequality for every component pattern other than permutations of the two opposite-pair triples $\( 0 \, a_k \, - a_k \)$.

#thm([Proposition 4.1.])[
  #emph[There are pairwise disjoint open balls $U_0 \, U_k^(+) \, U_k^(-)$ centered at $0 \, a_k \, - a_k$, respectively, and a bounded continuous function $u : U arrow.r bb(R)$, where 
$ U = U_0 union U_1^(+) union U_1^(-) union U_2^(+) union U_2^(-) \, $

 such that 
#[#set math.equation(numbering: n => "(7)")
 $ c \( x_1 \, x_2 \, x_3 \) gt.eq sum_(i = 1)^3 u \( x_i \) quad upright("on ") U^3 . $ <eq:certificate>]

 Equality holds precisely at the triples in $U^3$ which, after a permutation, have the form 
#[#set math.equation(numbering: n => "(8)")
 $ \( X_k \( y \) \, y \, Z_k \( y \) \) in U_0 times U_k^(+) times U_k^(-) \, #h(2em) y in U_k^(+) \, quad k in { 1 \, 2 } . $ <eq:contact>]

 The maps $X_k \, Z_k$ are diffeomorphisms on $U_k^(+)$, with 
$ X_k \( U_k^(+) \) subset U_0 \, #h(2em) Z_k \( U_k^(+) \) subset U_k^(-) . $

]
] <prop:certificate>

#proof[
  Use the functions and neighborhoods of Lemma 3. Choose small balls contained in these neighborhoods, taking $U_0$ inside both central neighborhoods. On the respective components define
  $ u = u_0 med upright("on ") U_0 \, #h(2em) u = w_k med upright("on ") U_k^(+) \, #h(2em) u = v_k med upright("on ") U_k^(-) . $
  The balls will be shrunk below. Since the functions are smooth near their centers, we can first restrict to fixed preliminary balls on which their absolute values are bounded by one constant $M > 0$. Take the final balls sufficiently small that their closures are pairwise disjoint.
  At the five centers the values of $u$ are $5 \/ 2 \, 0 \, 0 \, 0 \, 0$. For a triple of distinct centers other than a permutation of $\( 0 \, a_k \, - a_k \)$, there are two possibilities. If zero is absent, its potential sum is zero and its cost is positive. If zero is present, the other two centers come from different opposite pairs. Their cost is
  $ 2 + 1 / sqrt(2) > 5 / 2 \, $
  so again there is a strict gap. There are finitely many such triples, and the cost and local potentials are continuous near each one. All these strict inequalities therefore persist on the corresponding products after sufficiently small restrictions.
  For a repeated-center type, two coordinates belong to the same ball. If all radii are at most $r$, the distance between those two coordinates is at most $2 r$, and their pair cost is at least $1 \/ \( 2 r \)$, with the usual interpretation at coincidence. Taking $r$ small enough that $1 \/ \( 2 r \) > 3 M$ makes the cost strictly larger than the potential sum on every such product.
  The inequalities of Lemma 3 remain valid when their domains are restricted, with the same equality characterization. Permuting a triple leaves both $c$ and the sum of the three values of $u$ unchanged. Thus the two prescribed component types and their permutations satisfy (7), with equality exactly as in (8); every other type has strict inequality. Finally, keep $U_0 \, U_k^(-)$ fixed and shrink each $U_k^(+)$ once more. Since $X_k \( a_k \) = 0$ and $Z_k \( a_k \) = - a_k$, continuity ensures
  $ X_k \( U_k^(+) \) subset U_0 \, #h(2em) Z_k \( U_k^(+) \) subset U_k^(-) . $
  All inequalities and diffeomorphism properties survive this restriction. The function $u$ is bounded and continuous on the final disjoint union $U$. ◻
]

We now use the central point as parameter for both equality families. This gives four diffeomorphisms on one common ball, as required by the selection obstruction and the construction of the smooth marginal.

#thm([Lemma 4.2.])[
  #emph[There is an open ball $B$ of positive radius centered at zero, contained in $U_0$, on which the maps 
$ Y_k = \( X_k \|_(U_k^(+)) \)^(- 1) \|_B \, #h(2em) W_k = Z_k compose Y_k quad \( k = 1 \, 2 \) $

 are well defined and are diffeomorphisms onto open images. They satisfy 
$ Y_k \( B \) subset U_k^(+) \, #h(2em) W_k \( B \) subset U_k^(-) \, $

 and every triple $\( x \, Y_k \( x \) \, W_k \( x \) \)$, $x in B$, is an equality triple in (7). In particular, the five sets 
$ B \, quad Y_1 \( B \) \, quad W_1 \( B \) \, quad Y_2 \( B \) \, quad W_2 \( B \) $

 are pairwise disjoint.]
] <lem:common-ball>

#proof[
  Both $X_k \( U_k^(+) \)$ are open neighborhoods of zero. Choose a positive-radius ball $B$ about zero inside their intersection and $U_0$. The inverse maps then take $B$ into $U_k^(+)$, and Proposition 4 gives $Z_k \( Y_k \( B \) \) subset U_k^(-)$. The inverse and composition of the relevant diffeomorphisms are diffeomorphisms onto open images. The identities $X_k \( Y_k \( x \) \) = x$ and $W_k = Z_k compose Y_k$ give equality by Proposition 4. Disjointness follows from the five component balls. ◻
]

== 5 The marginal and exclusion of every Monge optimizer <sec:proof>

We now prove Theorem 1. Let the balls, maps, and potential be as in Proposition 4 and Lemma 5. Set

$ cal(H) = { Y_1 \, W_1 \, Y_2 \, W_2 } . $

===== 5.1 A smooth marginal. <a-smooth-marginal.>

Choose a nonnegative function $g in C_c^oo \( B \)$ with $integral_B g^2 thin d x = 1$, and let $nu = g^2 thin d x$, regarded as a probability measure on $bb(R)^3$. Define

#[#set math.equation(numbering: n => "(9)")
 $ mu = 1 / 3 nu + 1 / 6 sum_(H in cal(H)) H_(\#) nu . $ <eq:mu>]

These coefficients sum to one. For $H in cal(H)$, define

$ g_H \( y \) = cases(delim: "{", g \( H^(- 1) \( y \) \) thin \| det D H^(- 1) \( y \) \|^(1 \/ 2) \, & y in H \( B \) \,, 0 \, & y in.not H \( B \) .) $

The formula is smooth on $H \( B \)$. Its support is contained in the compact set $H \( "supp" g \) subset H \( B \)$, so extension by zero is smooth on $bb(R)^3$. Thus $g_H in C_c^oo \( bb(R)^3 \)$, and change of variables gives $H_(\#) nu = g_H^2 thin d y$.

It follows that $mu = rho thin d x$, where

$ rho = 1 / 3 g^2 + 1 / 6 sum_(H in cal(H)) g_H^2 . $

The functions here are nonnegative and have pairwise disjoint supports, since their supports lie in the five disjoint components. Consequently

$ sqrt(rho) = 1 / sqrt(3) g + 1 / sqrt(6) sum_(H in cal(H)) g_H . $

This proves both asserted smoothness properties, compact support, and normalization. Also $mu \( U \) = 1$ and $mu \|_B = \( 1 \/ 3 \) nu$.

===== 5.2 A finite optimal coupling. <a-finite-optimal-coupling.>

Sample $x$ with law $nu$, choose $k$ uniformly from ${ 1 \, 2 }$, independently of $x$, and apply an independent uniform permutation to the three entries of

$ \( x \, Y_k \( x \) \, W_k \( x \) \) . $

Let $pi_0$ be the resulting law. In any fixed coordinate the central point has coefficient $1 \/ 3$, and each specified outer map has coefficient $\( 1 \/ 2 \) \( 1 \/ 3 \) = 1 \/ 6$. Hence every coordinate marginal is exactly $mu$.

All sampled triples satisfy (7) with equality. The boundedness of $u$ therefore gives

#[#set math.equation(numbering: n => "(10)")
 $ integral c thin d pi_0 = 3 integral_U u thin d mu < oo . $ <eq:optimal-value>]

Conversely, every $pi in Pi \( mu \, mu \, mu \)$ has $pi \( U^3 \) = 1$: each of the three events $x_i in.not U$ has probability zero. Integrating (7) yields

$ integral c thin d pi gt.eq 3 integral_U u thin d mu . $

Thus $pi_0$ attains $E_(*) \( mu \)$, and the latter is finite. Only the inequality on $U^3$ is used.

For any optimal $pi$, the nonnegative slack $c \( x_1 \, x_2 \, x_3 \) - sum_i u \( x_i \)$ on $U^3$ has integral zero. Indeed the cost is finite and the potential sum is bounded, so subtraction and integration are legitimate. It follows that $pi$ is concentrated on the equality triples in (8).

===== 5.3 No optimal maps. <no-optimal-maps.>

Suppose that Borel maps $T_2 \, T_3$, each preserving $mu$, induce an optimal plan. The preceding equality condition holds at $\( x \, T_2 \( x \) \, T_3 \( x \) \)$ for $mu$-almost every $x$, hence for $nu$-almost every $x in B$.

The first coordinate $x in B subset U_0$ is the unique central coordinate of an equality triple. The remaining coordinates lie one each in $U_k^(+)$ and $U_k^(-)$ for some $k$. If their values in those components are $y \, z$, then $x = X_k \( y \)$ and $z = Z_k \( y \)$. Injectivity of $X_k$ forces

$ y = Y_k \( x \) \, #h(2em) z = W_k \( x \) . $

Allowing either order of these coordinates and either value of $k$, we obtain

$ T_2 \( x \) in { Y_1 \( x \) \, W_1 \( x \) \, Y_2 \( x \) \, W_2 \( x \) } quad upright("for ") nu upright("-almost every ") x in B . $

This contradicts Lemma 2 applied to (9). Thus no Monge plan attains the minimum, completing the proof of Theorem 1.0◻

== 6 Equality of the two infima <sec:infima>

The obstruction above concerns attainment, not the value of the Monge infimum. We prove this directly for the constructed marginal. The partition and cost-oscillation argument adapts the approximation method of Colombo and Di Marino #cite(label("CDM2015")) author version, Lemma 2.3 and proof of Theorem 2.1. Their general theorem treats the Coulomb singularity and cyclic maps for identical nonatomic marginals. Here the separated components allow an elementary proof, including the required Borel maps.

#thm([Proposition 6.1.])[
  #emph[For the probability measure $mu$ of Theorem 1, 
$ inf_(T_2 \, T_3 : bb(R)^3 arrow.r bb(R)^3 med upright("Borel")\
\( T_2 \)_(\#) mu = \( T_3 \)_(\#) mu = mu) integral c \( x \, T_2 \( x \) \, T_3 \( x \) \) thin d mu \( x \) = E_(*) \( mu \) . $

 Every pair in this infimum has cost strictly greater than the common infimum, but pairs with finite cost approach it.]
] <prop:equal-infima>

The approximation keeps the finite component structure of the optimizer $pi_0$. We partition the components into small cells and prescribe the mass of a graph plan in each product of three cells to equal that of $pi_0$. Within each product the two plans may differ, but the components remain separated and the cost oscillation tends to zero with the cell diameter. To realize the prescribed masses, we split each source cell into pieces and send each piece into two specified target cells, with the normalized restriction of $mu$ as each target law. The following elementary transport fact supplies those maps; its proof is given at the end of the section.

#thm([Lemma 6.2.])[
  #emph[Let $d gt.eq 2$ be an integer. If $alpha$ and $beta$ are absolutely continuous Borel probability measures on $bb(R)^d$, there is a Borel map $Q : bb(R)^d arrow.r bb(R)^d$ such that $Q_(\#) alpha = beta$.]
] <lem:borel-transport>

#proof[
  Write $K_0 = "supp" g$, and let $K_1 \, dots.h \, K_4$ be its images under the four maps in $cal(H)$. These are nonempty compact sets in the five disjoint components, and $mu \( K \) = 1$ for $K = union.big_(a = 0)^4 K_a$. In particular,
  $ eta = min_(a eq.not b) "dist" \( K_a \, K_b \) > 0 . $
  The optimal coupling $pi_0$ constructed in Section 5 is supported on products of three distinct component sets.
  Fix $delta > 0$. Partition each $K_a$ into finitely many Borel cells of diameter at most $delta$, for example by a finite grid of half-open cubes. Discard the cells of zero $mu$-mass and denote the remaining cells by $A_1 \, dots.h \, A_N$. They partition a set of full $mu$-measure and each belongs to a single $K_a$. Put
  $ q_(i j k) = pi_0 \( A_i times A_j times A_k \) . $
  The marginal constraints on $pi_0$ read
  $ sum_(j \, k) q_(i j k) = mu \( A_i \) \, #h(2em) sum_(i \, k) q_(i j k) = mu \( A_j \) \, #h(2em) sum_(i \, j) q_(i j k) = mu \( A_k \) . $
  For each fixed $i$, split $A_i$ into Borel sets $B_(i j k)$ of masses $q_(i j k)$, ignoring zero-mass pieces. Such a split can be made by successive first-coordinate slabs: the first-coordinate marginal of $mu \|_(A_i)$ is absolutely continuous, so its cumulative distribution is continuous and takes every value between zero and $mu \( A_i \)$. Endpoints of the slabs have zero mass; any unused null set is included in a fixed piece.
  For each $q_(i j k) > 0$, Lemma 7 supplies maps on $B_(i j k)$ sending the probability $q_(i j k)^(- 1) mu \|_(B_(i j k))$, respectively, to
  $ frac(mu \|_(A_j), mu \( A_j \)) quad upright("and") quad frac(mu \|_(A_k), mu \( A_k \)) . $
  Reset any exceptional values outside the indicated target cell to a fixed point in that cell. These changes are Borel and occur on null sets. Glue the maps over the finitely many pieces to obtain $T_2 \, T_3$, and give them a fixed value on the remaining Borel null set in $bb(R)^3$. Different source pieces may use the same normalized target law. Their weights $q_(i j k)$ add to the full mass of the target cell, so no target partition is needed. Indeed, for any Borel set $D$,
  $ mu \( T_2^(- 1) \( D \) \) = sum_(i \, j \, k : q_(i j k) > 0) q_(i j k) frac(mu \( D ∩ A_j \), mu \( A_j \)) = sum_j mu \( D ∩ A_j \) = mu \( D \) \, $
  and the same calculation proves $\( T_3 \)_(\#) mu = mu$. The graph coupling $pi_delta = \( "Id" \, T_2 \, T_3 \)_(\#) mu$ gives each product $A_i times A_j times A_k$ exactly the mass $q_(i j k)$.
  Whenever $q_(i j k) > 0$, the three cells lie in three distinct component sets. Thus all pairwise distances in their product are at least $eta$, including after the redistribution within the cells. If $x$ and $y$ are two triples in the same such product, then $\| x_ell - y_ell \| lt.eq delta$ for each coordinate. Consequently
  $ lr(|frac(1, \| x_ell - x_r \|) - frac(1, \| y_ell - y_r \|)|) lt.eq frac(2 delta, eta^2) \, #h(2em) \| c \( x \) - c \( y \) \| lt.eq frac(6 delta, eta^2) . $
  Both costs are finite, bounded by $3 \/ eta$ on all active products. Since $pi_delta$ and $pi_0$ have identical masses on these products, summing their oscillation bounds gives
  $ lr(|integral c thin d pi_delta - integral c thin d pi_0|) lt.eq frac(6 delta, eta^2) . $
  Letting $delta arrow.b 0$ proves the required upper bound on the Monge infimum. The reverse bound follows because every admissible graph plan is a coupling. Strict nonattainment is Theorem 1. ◻
]

The argument uses a uniform separation estimate on the approximating plans themselves; it does not pass the singular Coulomb cost through weak convergence. No classification or uniqueness of optimal couplings is needed.

#proof[
  We construct a Borel map from each such probability to uniform measure on $\( 0 \, 1 \)^d$, and a Borel map in the reverse direction. Let $f$ be a nonnegative Borel probability density. The forward map is Rosenblatt’s successive conditional-distribution transform #cite(label("Rosenblatt1952")); we also give the inverse quantile construction and make the Borel choices explicit in both directions.
  #emph[The forward map.] We successively transform each coordinate by its conditional distribution function given the preceding coordinates. Write $x_(1 : j) = \( x_1 \, dots.h \, x_j \)$, with $x_(1 : 0)$ the empty prefix, and set
  $ f_(1 : j) \( x_(1 : j) \) = integral_(bb(R)^(d - j)) f \( x_(1 : j) \, z \) thin d z quad \( 1 lt.eq j < d \) \, #h(2em) f_(1 : d) = f \, #h(2em) f_(1 : 0) = 1 . $
  The prefix densities are Borel, have integral one, and are finite almost everywhere. Tonelli’s theorem gives $integral_(bb(R)) f_(1 : j) \( a \, r \) thin d r = f_(1 : j - 1) \( a \)$ for every prefix $a$, including the empty prefix when $j = 1$. For $j = 1 \, dots.h \, d$, define
  $ F_j \( a \, t \) = frac(integral_(- oo)^t f_(1 : j) \( a \, r \) thin d r, f_(1 : j - 1) \( a \)) \, #h(2em) a in bb(R)^(j - 1) . $
  This formula is used where its denominator belongs to $\( 0 \, oo \)$; on the remaining fibers use instead the fixed distribution function $t mapsto \( 1 + e^(- t) \)^(- 1)$. Thus every fiber is a continuous distribution function with limits zero and one, and all $F_j$ are jointly Borel. For $j gt.eq 2$, the exceptional prefix fibers have zero probability under $f_(1 : j - 1) \( a \) thin d a$; there are no exceptional fibers when $j = 1$.
  For a random variable with a continuous distribution function $F$, the variable $F \( X \)$ is uniform on $\( 0 \, 1 \)$. Indeed, continuity and the limits of $F$ allow a cut at each probability level $u in \( 0 \, 1 \)$; any interval on which $F = u$ has probability zero, and hence $bb(P) \( F \( X \) lt.eq u \) = u$. At stage $j$, this identity and Fubini show that, conditionally on the preceding original prefix, the new transformed coordinate is uniform. It is therefore independent of that prefix, and hence of all preceding transformed coordinates. A finite induction over $j = 1 \, dots.h \, d$ shows that the Borel map
  $ R_f \( x \) = #scale(x: 120%, y: 120%)[\(] F_j \( x_(1 : j - 1) \, x_j \) #scale(x: 120%, y: 120%)[\)]_(j = 1)^d $
  sends $f thin d x$ to product uniform measure on $\( 0 \, 1 \)^d$. Its values lie in $\[ 0 \, 1 \]^d$, including on exceptional fibers. This argument does not require a density to be positive everywhere or a distribution function to be strictly increasing.
  #emph[The reverse map.] Given independent uniform coordinates, we successively recover the original conditional laws by quantiles. For each $j$ and $0 < u < 1$, define
  $ q_j \( a \, u \) = inf { r in bb(Q) : F_j \( a \, r \) gt.eq u } . $
  This value is finite, and
  $ { \( a \, u \) : q_j \( a \, u \) < t } = union.big_(r in bb(Q)\
r < t) { \( a \, u \) : F_j \( a \, r \) gt.eq u } $
  proves joint Borel measurability on $0 < u < 1$. At $u = 0 \, 1$, define $q_j \( a \, u \) = 0$. For $0 < u < 1$, continuity of $F_j \( a \, dot.op \)$ gives
  $ q_j \( a \, u \) lt.eq t quad arrow.l.r.double quad u lt.eq F_j \( a \, t \) . $
  Consequently $q_j \( a \, U \)$ has distribution function $F_j \( a \, dot.op \)$ for uniform $U$. For $u in \[ 0 \, 1 \]^d$, recursively set
  $ z_j = q_j \( z_(1 : j - 1) \, u_j \) quad \( j = 1 \, dots.h \, d \) \, #h(2em) S_f \( u \) = \( z_1 \, dots.h \, z_d \) \, $
  starting with the empty prefix. This finite recursion defines a Borel map. For independent uniform inputs, induction shows that after step $j$ the output prefix has density $f_(1 : j)$: the preceding prefix has density $f_(1 : j - 1)$, its exceptional fibers have probability zero, and on every other fiber the quantile has the conditional distribution just defined. Thus $S_f$ has output law $f thin d x$. If $f$ and $g$ are densities of $alpha$ and $beta$, respectively, then $S_g compose R_f$ has the required property. ◻
]

== 7 Inverse-power Riesz interactions <sec:riesz>

The construction is not specific to the Coulomb exponent or to three spatial dimensions. For an integer $d gt.eq 2$ and a real number $s > 0$, define on $\( bb(R)^d \)^3$

#[#set math.equation(numbering: n => "(11)")
 $ c_s \( x_1 \, x_2 \, x_3 \) = sum_(1 lt.eq i < j lt.eq 3) \| x_i - x_j \|^(- s) \, $ <eq:riesz-cost>]

with $c_s = + oo$ if two coordinates coincide. For a Borel probability measure $mu$ on $bb(R)^d$, let $Pi \( mu \, mu \, mu \)$ now denote the couplings on $\( bb(R)^d \)^3$, and write

$ E_s \( mu \) = inf_(pi in Pi \( mu \, mu \, mu \)) integral c_s thin d pi . $

#thm([Theorem 7.1.])[
  #emph[For every integer $d gt.eq 2$ and every real $s > 0$, there is a nonnegative density $rho$ on $bb(R)^d$ such that 
$ integral_(bb(R)^d) rho \( x \) thin d x = 1 \, #h(2em) rho in C_c^oo \( bb(R)^d \) \, #h(2em) sqrt(rho) in C_c^oo \( bb(R)^d \) \, $

 with the following properties. For $mu = rho thin d x$, the value $E_s \( mu \)$ is finite and attained by a coupling, but every pair of Borel maps $T_2 \, T_3 : bb(R)^d arrow.r bb(R)^d$ with $\( T_2 \)_(\#) mu = \( T_3 \)_(\#) mu = mu$ satisfies 
$ integral_(bb(R)^d) c_s #scale(x: 120%, y: 120%)[\(] x \, T_2 \( x \) \, T_3 \( x \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) > E_s \( mu \) . $

 The left-hand side may be infinite. Nevertheless, 
$ inf_(T_2 \, T_3 : bb(R)^d arrow.r bb(R)^d med upright("Borel")\
\( T_2 \)_(\#) mu = \( T_3 \)_(\#) mu = mu) integral c_s \( x \, T_2 \( x \) \, T_3 \( x \) \) thin d mu \( x \) = E_s \( mu \) \, $

 and pairs with finite cost approach this infimum.]
] <thm:riesz>

The density and all local construction constants may depend on $\( d \, s \)$. The physical Coulomb discussion in Section 1 refers to the specialization $d = 3 \, s = 1$; the interaction in (11) is the stated inverse power, not a logarithmic kernel.

#proof[
  Fix $d gt.eq 2$ and $s > 0$, and put $a_1 = e_1$ and $a_2 = e_2$ in $bb(R)^d$. The measure argument already applies in this dimension. We verify the three properties of the cost that it needs: local equality families given by diffeomorphisms, strict supporting inequalities on all other component products, and a uniform cost-oscillation bound on separated products.
  ===== 7.1 Local branches. <local-branches.>
  For $h_s \( b \) = \| b \|^(- s)$, $b eq.not 0$, the center jets are
  $ c_s \( 0 \, a_k \, - a_k \) = 2 + 2^(- s) \, #h(2em) nabla_x c_s \( 0 \, a_k \, - a_k \) = 0 \, #h(2em) nabla_z c_s \( 0 \, a_k \, - a_k \) = s \( 1 + 2^(- s - 1) \) a_k . $
  As before, we keep the positive outer point $y$ free and minimize in the other two coordinates. The potentials in Lemma 3 are replaced by
  $ u_0 \( x \) = 2 + 2^(- s) - K / 2 \| x \|^2 \, #h(2em) v_k \( z \) = s \( 1 + 2^(- s - 1) \) a_k dot.op \( z + a_k \) - K / 2 \| z + a_k \|^2 . $
  The central potential is common to the two branches, and $F_k = c_s - u_0 - v_k$ has vanishing $\( x \, z \)$-gradient at each center. Direct differentiation gives
  $ D^2 h_s \( b \) = s \| b \|^(- s - 2) (\( s + 2 \) frac(b b^(sans(T)), \| b \|^2) - I_d) . $
  Its radial eigenvalue is $s \( s + 1 \) \| b \|^(- s - 2)$, and its tangential eigenvalues are $- s \| b \|^(- s - 2)$, so it is invertible.
  At the $k$-th center, define $M_k$ and $N_k$ as in Section 3, with $c_s$ in place of $c$. The two $d times d$ blocks of $N_k$ are $- D^2 h_s \( - a_k \)$ and $- D^2 h_s \( - 2 a_k \)$, hence are invertible, while $M_k$ is a symmetric $2 d times 2 d$ matrix. For sufficiently large $K$, both $M_k + K I_(2 d)$ are positive definite and both $d times d$ blocks of $\( M_k + K I_(2 d) \)^(- 1) N_k$ are invertible, because
  $ K \( M_k + K I_(2 d) \)^(- 1) N_k = \( I_(2 d) + K^(- 1) M_k \)^(- 1) N_k arrow.r N_k . $
  One $K$ works for the two branches. The implicit and inverse function arguments of Lemma 3 now give separate local diffeomorphisms $X_k \, Z_k$ on $d$-dimensional neighborhoods. The cost is smooth near the collision-free center triples; after shrinking the product balls, the $\( x \, z \)$-Hessian of $F_k$ remains positive definite. Strict convexity on the product of the $x$- and $z$-balls therefore gives the same local supporting inequality and exact equality set, with $w_k \( a_k \) = 0$.
  ===== 7.2 The supporting inequality and the marginal. <the-supporting-inequality-and-the-marginal.>
  The five center values of the potential are now $2 + 2^(- s) \, 0 \, 0 \, 0 \, 0$. A distinct-center triple containing zero but not an opposite pair has cost
  $ 2 + 2^(- s \/ 2) > 2 + 2^(- s) . $
  A distinct-center triple without zero has positive cost and potential sum zero. These finitely many strict gaps persist on small products by continuity. If two points lie in one ball of radius at most $r$, their pair cost is at least $\( 2 r \)^(- s)$. This exceeds $3 M$ for sufficiently small $r$, where $M$ bounds the absolute values of the preliminary potentials. Positivity of the other pair terms and permutation symmetry of $c_s$ therefore give the full supporting inequality and exact contact set described in Proposition 4, now in $bb(R)^d$. The proof of Lemma 5 then also applies in $bb(R)^d$.
  On that common ball $B$, choose a nonnegative $g in C_c^oo \( B \)$ with $integral_B g^2 thin d x = 1$, and form $nu$ and $mu$ by (9) using the four resulting diffeomorphisms. The change-of-variables construction in Section 5, now with $d$-dimensional Jacobians, gives the same smooth compactly supported density and square root: each image function is supported compactly inside its open component, and the five supports are disjoint. The same random choice of a branch and permutation gives an optimal coupling $pi_0$ with the three marginals equal to $mu$. The bounded supporting potential proves its cost is finite and forces every optimal coupling onto the contact set. Applying Lemma 2 to the four branch maps then excludes every marginal-preserving Borel pair, exactly as in Section 5.
  ===== 7.3 Approximation by preserving maps. <approximation-by-preserving-maps.>
  The five compact component sets have a positive mutual separation $eta$, and $pi_0$ uses only products of three distinct components. Repeat the cell partition and redistribution from the proof of Proposition 6 in $bb(R)^d$, using Lemma 7. The first-coordinate marginals used to split the cells are absolutely continuous by Fubini in every such dimension. The redistribution gives a graph coupling $pi_delta$ of a preserving Borel pair with the same mass as $pi_0$ on each product of cells of diameter at most $delta$. Every active product still has all pair distances at least $eta$. For two triples $x \, y$ in one such product, the scalar mean value theorem gives
  $ lr(|\| x_ell - x_r \|^(- s) - \| y_ell - y_r \|^(- s)|) lt.eq 2 s delta thin eta^(- s - 1) \, #h(2em) \| c_s \( x \) - c_s \( y \) \| lt.eq 6 s delta thin eta^(- s - 1) . $
  Both costs are bounded by $3 eta^(- s)$ on the active products. Summing their oscillations against the common product masses yields
  $ lr(|integral c_s thin d pi_delta - integral c_s thin d pi_0|) lt.eq 6 s delta thin eta^(- s - 1) arrow.r 0 . $
  The reverse inequality for the infima holds because every graph plan is a coupling. This proves the final assertion. In particular, no restriction relating $s$ to $d$ is needed: the optimizer and these approximating plans stay away from all collisions. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
