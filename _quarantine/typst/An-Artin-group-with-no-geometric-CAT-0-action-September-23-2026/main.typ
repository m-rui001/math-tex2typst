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

#align(center)[#text(size: 16pt, weight: "bold")[An Artin group with no geometric CAT(0) action]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $S$ be finite and let $M = \( m_(s t) \)_(s \, t in S)$ be symmetric, with $m_(s s) = 1$ and

$ m_(s t) in { 2 \, 3 \, dots.h } union { oo } #h(2em) \( s eq.not t \) . $

The Artin group $A_M$ has generators $sigma_s$, $s in S$. For each finite $m_(s t)$, its defining relation equates the two alternating words of length $m_(s t)$ starting with $sigma_s$ and $sigma_t$. A label $oo$ imposes no relation.

Throughout, an action is called #emph[geometric] if it is an isometric action on a nonempty proper CAT(0) metric space $X$, is proper, and is cocompact. Here a metric space is proper when its closed bounded subsets are compact; action properness means that

$ { g : g K ∩ K eq.not diameter } $

is finite for every compact $K subset X$; and cocompactness means that $G K = X$ for some compact $K$. Our CAT(0) convention is the geodesic triangle-comparison inequality with Euclidean comparison triangles. The explicit properness assumption on $X$ also follows from the other action hypotheses for a length space [5] Exercise I.8.4(1).

Charney asked which Artin groups are CAT(0) [6] Problem 4. The affirmative expectation that every finite-rank Artin group admits a geometric action is recorded by Haettel as Conjecture 1.1 of [12]. A geometric action would make the group’s large-scale geometry accessible through geodesic convexity and Euclidean comparison. The challenge is compatibility: constructing actions for the rank-two braid subgroups does not by itself supply an action of the whole group.

There are substantial positive results. Right-angled Artin groups, whose finite off-diagonal labels are all two, have finite nonpositively curved cubical classifying spaces and hence geometric CAT(0) actions [7] preprint Theorem 3.1.1. Brady and McCammond constructed nonpositively curved two-dimensional complexes for the three-generator Artin groups with all three finite labels at least three [2] preprint Theorem 4. Haettel proved the conjecture for XXL type, where every finite off-diagonal label is at least five [12] Theorem 1.4. For classical braid groups, Brady and McCammond established the five-strand case [3] Theorem B, Haettel, Kielak, and Schwer the six-strand case [13] preprint Corollary 4.18, and Jeong the seven-strand case [14] preprint Corollary 14.

In the opposite direction, Brady and Crisp found Artin groups with two-dimensional classifying spaces for which the least dimension of a geometric CAT(0) action is three [1] preprint Theorems B and 3.1. Their examples show that an obstruction in one dimension can disappear in a higher-dimensional CAT(0) space. To refute the conjecture, an obstruction must instead survive every dimension.

#prodef([Theorem 1.1.])[
  #emph[There is an Artin matrix $M$ on 116 generators, with every off-diagonal label in ${ 2 \, 3 \, oo }$, such that $A_M$ admits no geometric action. One explicit matrix is given in Definition 20.]
] <thm:main>

Thus Theorem 1 gives a negative resolution of the CAT(0) conjecture for Artin groups. In particular, the conclusion excludes every nonempty proper CAT(0) space, regardless of dimension or the choice of a complex or metric.

=== The construction and the obstruction <the-construction-and-the-obstruction>

The small group that detects the obstruction is

$ T = chevron.l a \, b \, c divides a b a = b a b \, med b c b = c b c \, med c a c = a c a chevron.r . $

To each of its three cyclic braid pairs we attach a 40-strand braid group, sharing the first two standard generators of that block with the pair. Each attachment adds 37 generators. Two further generators $d \, e$, each commuting with $a \, b \, c$ and having no other finite incident labels, make $T$ their simultaneous centralizer; Section 7 proves this equality. This gives $3 + 3 dot.op 37 + 2 = 116$ generators.

For an isometry coming from a geometric action, write $ell \( g \)$ for its stable translation length, the limit of $d \( x \, g^n x \) \/ n$. Section 2 turns these lengths on commuting elements into Euclidean pairings and proves that a pairing with a fixed element is additive on its whole centralizer. The calculation in Section 3 uses these standard geometric properties to constrain the braid relations, without requiring the braid blocks themselves to act cocompactly. A long block forces

$ frac(ell \( \( u v \)^3 \), 3 ell \( u^2 \)) = frac(ell \( \( u v \)^3 \), 3 ell \( v^2 \)) > 1 / 2 . $

If these inequalities held on all three pairs in a geometric action of $T$, the commuting pairs

$ \( a^2 \, \( a b \)^3 \) \, med \( b^2 \, \( a b \)^3 \) \, med \( b^2 \, \( b c \)^3 \) \, med \( c^2 \, \( b c \)^3 \) \, med \( c^2 \, \( c a \)^3 \) \, med \( a^2 \, \( c a \)^3 \) $

would give six asymptotically Euclidean sectors, each of angle less than $pi \/ 3$. Their cyclic union would have total angle less than $2 pi$.

A related angle-sum obstruction appears in Crisp’s study of two-dimensional Bestvina–Brady groups [8] Lemma 1.3 and the following remark. His argument assumes covering dimension two and a proper action in which each isometry attains its minimum displacement.

The main geometric step is to turn this short angular circuit into a contradiction that remains valid in arbitrary dimension. Coordinates coming from an affine mirror action separate disjoint regions of the sector disk at large scale. This action is the equilateral-triangle specialization of Digne’s reflection-coordinate homomorphism [10] Proposition 2.1. CAT(0) geodesics provide a second disk whose image stays far from the cone point. We transfer the resulting sphere to a triangular presentation complex, using a bound valid at every point of every parameter triangle. A local winding count then detects a target triangle with nonzero signed multiplicity, whereas a direct folding argument makes every such multiplicity zero.

The triangular presentation and its girth-six link are the $m = n = p = 3$ specialization of Brady and McCammond’s construction [2] preprint Lemmas 2–3. We prove the facts needed here, including the signed-count and controlled-approximation statements. The latter comparison between local degree and global signed counts is formulated entirely in terms of distances and finite diagrams. It does not require a triangulation or a dimension bound on the unknown CAT(0) space.

Finally, the simultaneous-centralizer construction makes the action on $T$ geometric: a suitable intersection of two displacement sublevel sets is closed and convex, and $T$ acts cocompactly on it. Its stable lengths are the ambient stable lengths. The braid inequalities and the six-sector obstruction therefore apply to the same action.

=== Organization and notation <organization-and-notation>

Sections 2 and 3 establish the length calculation. Sections 4–6 prove the obstruction for $T$. Section 7 gives the matrix, the algebraic embeddings, and the centralizer argument completing Theorem 1. The substantial geometric, algebraic, and diagrammatic ingredients are proved below. We use elementary finite planar topology for regular neighbourhoods of graphs and winding numbers; no Artin-group asphericity theorem is an input.

We use $B_l$ for the braid presentation on $s_1 \, dots.h \, s_(l - 1)$: adjacent generators satisfy the length-three braid relation, and generators at distance at least two commute. For commuting elements $g \, h$, the notation $chevron.l g \, h chevron.r$ will denote the polarization of their squared stable lengths, defined in Lemma 4.

== 2 Stable lengths and centralizer characters <sec:lengths>

Our objective is a pairing of stable lengths that is additive on an entire centralizer, even when its elements do not commute with one another. The geometric facts used here are standard: attainment of minimum displacement under a geometric action and the structure of its minimizing set are treated in Bridson–Haefliger [5] II.6.8(5) and II.6.10(2); the Euclidean structure on commuting translations is central to the Flat Torus Theorem [5] II.7.1. We derive precisely the length identities needed for the braid calculation directly from triangle comparison, without using a splitting theorem.

#prodef([Lemma 2.1.])[
  #emph[In a CAT(0) space, geodesic segments are unique and depend continuously on their endpoints. If $alpha \, beta : \[ 0 \, 1 \] arrow.r X$ are geodesics parametrized proportionally to length, then 
#[#set math.equation(numbering: n => "(2.1)")
 $ d \( alpha \( t \) \, beta \( t \) \) lt.eq \( 1 - t \) d \( alpha \( 0 \) \, beta \( 0 \) \) + t d \( alpha \( 1 \) \, beta \( 1 \) \) . $ <eq:distance-convexity>]

 If $m$ is the midpoint of $\[ v \, w \]$, then 
#[#set math.equation(numbering: n => "(2.2)")
 $ d \( z \, m \)^2 lt.eq frac(d \( z \, v \)^2 + d \( z \, w \)^2, 2) - frac(d \( v \, w \)^2, 4) . $ <eq:midpoint-comparison>]

 For any four points $p \, q \, r \, s$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ d \( p \, r \)^2 + d \( q \, s \)^2 lt.eq d \( p \, q \)^2 + d \( q \, r \)^2 + d \( r \, s \)^2 + d \( s \, p \)^2 . $ <eq:quadrilateral>]

]
] <lem:comparison>

#proof[
  For uniqueness, split one of two segments with the same endpoints at an arbitrary point and use the other segment as the third side of the resulting triangle. Its comparison triangle is a straight segment, so comparison identifies the two points with the same proportional parameter. For two segments with a common initial point, comparison bounds their distance at parameter $t$ by $t$ times the distance of their terminal points. The analogous statement holds for a common terminal point. Inserting the segment from $alpha \( 0 \)$ to $beta \( 1 \)$ between $alpha$ and $beta$, and using the triangle inequality, proves (2.1). This bound also proves continuous dependence on the endpoints; dependence on the parameter follows from constant-speed parametrization.
  The Euclidean identity for a median, together with comparison, gives (2.2). Let $m$ now be the midpoint of $\[ p \, r \]$. The triangle inequality and $\( A + B \)^2 lt.eq 2 A^2 + 2 B^2$ give
  $ d \( q \, s \)^2 lt.eq 2 d \( q \, m \)^2 + 2 d \( s \, m \)^2 . $
  Apply (2.2) to each term on the right to obtain (2.3). ◻
]

For an isometry $g$ and a base point $o$, define its #emph[stable length] by

#[#set math.equation(numbering: n => "(2.4)")
 $ ell \( g \) = lim_(n arrow.r oo) frac(d \( o \, g^n o \), n) . $ <eq:stable-length>]

Here the limit exists: the sequence $a_n = d \( o \, g^n o \)$ is subadditive, and, for fixed $k$ and $n = q k + r$ with $0 lt.eq r < k$, $a_n lt.eq q a_k + a_r$. Consequently $limsup a_n \/ n lt.eq a_k \/ k$ for every $k$, and the limit equals $inf_(k gt.eq 1) a_k \/ k$. Changing $o$ changes $a_n$ by at most twice the distance between the two base points. Thus the length is independent of $o$, is invariant under conjugation, and satisfies

#[#set math.equation(numbering: n => "(2.5)")
 $ ell \( g^m \) = \| m \| ell \( g \) #h(2em) \( m in bb(Z) \) . $ <eq:length-powers>]

For negative $m$, use $d \( o \, g^(- n) o \) = d \( o \, g^n o \)$; for positive $m$, use the subsequence indexed by multiples of $m$ in (2.4).

#prodef([Lemma 2.2.])[
  #emph[Suppose $G$ acts geometrically on $X$. Every $g in G$ attains its minimum displacement, and 
$ ell \( g \) = min_(x in X) d \( x \, g x \) . $

 If this number is positive, $g$ preserves a geodesic line and translates along it by $ell \( g \)$. Moreover, $ell \( g \) = 0$ if and only if $g$ has finite order.]
] <lem:semisimple>

#proof[
  Set $D = inf_x d \( x \, g x \)$, and choose $x_n$ with $d \( x_n \, g x_n \) arrow.r D$. Write $x_n = h_n p_n$ with $p_n$ in a compact set $K$ whose $G$-translates cover $X$. After discarding finitely many terms, $q_n = h_n^(- 1) g h_n$ moves $p_n$ by at most $D + 1$. The closed $\( D + 1 \)$-neighborhood $K'$ of $K$ is closed and bounded, hence compact. Both $p_n$ and $q_n p_n$ belong to $K'$, so $q_n K' ∩ K' eq.not diameter$. Action properness gives only finitely many possibilities for $q_n$. Pass to a subsequence on which $q_n = q$ and $p_n arrow.r p in K$. Then $d \( p \, q p \) = D$. A fixed one of the conjugators $h_n$ transfers $p$ to a minimizer for $g$.
  Let $x$ be such a minimizer. If $D > 0$, let $m$ be the midpoint of $\[ x \, g x \]$; then $g m$ is the midpoint of $\[ g x \, g^2 x \]$. Comparison in the triangle with vertices $x \, g x \, g^2 x$ gives
  $ D lt.eq d \( m \, g m \) lt.eq 1 / 2 d \( x \, g^2 x \) lt.eq D . $
  Thus $d \( x \, g^2 x \) = 2 D$. We verify that all consecutive orbit segments form a line. Suppose the concatenation from $x$ to $g^i x$ is geodesic. In the triangle with vertices $x \, g^i x \, g^(i + 1) x$, the points at distance $D$ from $g^i x$ along the two incident sides are $g^(i - 1) x$ and $g^(i + 1) x$. Their distance is $2 D$, by the preceding equality and translation by $g^(i - 1)$. Their Euclidean comparison points can be at distance $2 D$ only if the comparison angle at $g^i x$ is $pi$. Hence $d \( x \, g^(i + 1) x \) = \( i + 1 \) D$. Induction, followed by translation by all powers of $g$, proves that the segments $\[ g^i x \, g^(i + 1) x \]$, $i in bb(Z)$, form an isometrically parametrized line. In particular $ell \( g \) = D$.
  If $D = 0$, the minimizer is fixed, so $ell \( g \) = 0$. Its stabilizer is finite by action properness applied to the compact singleton ${ x }$; thus $g$ has finite order. Conversely, finite order immediately gives zero stable length. ◻
]

For commuting isometries of a complete CAT(0) space, Rodenhausen [15] Theorem 14.6 proves a parallelogram identity for infimal displacements. The next proof works directly with stable lengths.

#prodef([Lemma 2.3.])[
  #emph[For pairwise commuting isometries $g_1 \, dots.h \, g_k$ of a CAT(0) space, the function 
$ v mapsto ell \( g^v \) \, #h(2em) g^v = g_1^(v_1) dots.h.c g_k^(v_k) \, #h(2em) v in bb(Z)^k \, $

 extends uniquely to a continuous seminorm on $bb(R)^k$ whose square is a positive semidefinite quadratic form. For commuting $g \, h$, put 
#[#set math.equation(numbering: n => "(2.6)")
 $ chevron.l g \, h chevron.r = frac(ell \( g h \)^2 - ell \( g \)^2 - ell \( h \)^2, 2) . $ <eq:pairing-definition>]

 These pairings are the bilinear form on every commuting family; in particular, $chevron.l g^i \, h^j chevron.r = i j chevron.l g \, h chevron.r$. Lengths and pairings are invariant under simultaneous conjugation.]
] <lem:commuting-form>

#proof[
  Write $nu \( v \) = ell \( g^v \)$ for integer $v$. Commutation, the triangle inequality, and (2.5) give
  $ nu \( u + v \) lt.eq nu \( u \) + nu \( v \) \, #h(2em) nu \( m v \) = \| m \| nu \( v \) \,\
\| nu \( u \) - nu \( v \) \| lt.eq sum_(i = 1)^k \| u_i - v_i \| ell \( g_i \) . $
  Define $nu \( v \/ q \) = nu \( v \) \/ q$ for integers $q > 0$. Homogeneity makes this well-defined on $bb(Q)^k$, and the displayed Lipschitz bound gives a unique continuous extension to $bb(R)^k$. It is a seminorm.
  Apply (2.3) to the four points
  $ o \, quad g^(n u) o \, quad g^(n \( u + v \)) o \, quad g^(n v) o $
  in that cyclic order. Divide by $n^2$ and pass to the limit to obtain, with $Q = nu^2$,
  $ Q \( u + v \) + Q \( u - v \) lt.eq 2 Q \( u \) + 2 Q \( v \) . $
  This initially holds for integer vectors and extends by scaling and continuity to real vectors. Apply it to $u + v \, u - v$ and use $Q \( 2 u \) = 4 Q \( u \)$ to obtain the opposite inequality. Hence
  #[#set math.equation(numbering: n => "(2.7)")
   $ Q \( u + v \) + Q \( u - v \) = 2 Q \( u \) + 2 Q \( v \) . $ <eq:parallelogram>]
  For completeness, polarization here requires only elementary algebra. Set $B \( u \, v \) = \( Q \( u + v \) - Q \( u - v \) \) \/ 4$. It is symmetric and continuous, and (2.7) gives
  $ B \( u + w \, v \) + B \( u - w \, v \) = 2 B \( u \, v \) . $
  Taking $w = u$ gives $B \( 2 u \, v \) = 2 B \( u \, v \)$, since $B \( 0 \, v \) = 0$. Next take $u = \( a + b \) \/ 2$, $w = \( a - b \) \/ 2$ to obtain additivity in the first variable. Integer and rational homogeneity follow, and continuity gives real homogeneity. Symmetry gives the same properties in the second variable. Finally $B \( u \, u \) = Q \( u \) gt.eq 0$, so $B$ is positive semidefinite; expanding $Q \( u + v \)$ recovers (2.6). Conjugation invariance follows from that of stable length. ◻
]

The following strengthening of bilinearity is crucial. The elements $h_1 \, h_2$ in its statement need not commute with one another. Real translation characters also underlie Bridson’s obstruction to proper semisimple actions on two-dimensional CAT(0) spaces [4] Proposition 3.1.

#prodef([Lemma 2.4.])[
  #emph[For a geometric action and a fixed $g in G$, the function 
$ C_G \( g \) arrow.r bb(R) \, #h(2em) h mapsto chevron.l g \, h chevron.r $

 is a group homomorphism. Thus $chevron.l g \, h_1 h_2 chevron.r = chevron.l g \, h_1 chevron.r + chevron.l g \, h_2 chevron.r$ whenever both $h_1$ and $h_2$ commute with $g$.]
] <lem:centralizer-character>

#proof[
  If $ell \( g \) = 0$, positive semidefiniteness in Lemma 4 implies $chevron.l g \, h chevron.r = 0$ for every $h in C_G \( g \)$: the nonnegative quadratic $ell \( g^t h \)^2 = 2 t chevron.l g \, h chevron.r + ell \( h \)^2$, for integer $t$ of both signs, forces the coefficient to vanish.
  Now let $D = ell \( g \) > 0$ and choose a minimizer $x$. By Lemma 3, $d \( x \, g^n x \) = n D$. Define
  $ b \( z \) = lim_(n arrow.r oo) #scale(x: 120%, y: 120%)[\(] d \( z \, g^n x \) - n D #scale(x: 120%, y: 120%)[\)] . $
  The terms decrease by the triangle inequality and are bounded below by $- d \( z \, x \)$, so the limit exists. The function $b$ is $1$-Lipschitz.
  Fix $h in C_G \( g \)$ and $z \, w in X$. Put $p_n = g^n x$ and $q_n = h^(- 1) g^n x$. Since $h$ commutes with $g$, $d \( p_n \, q_n \) = d \( x \, h^(- 1) x \)$ is constant. Two orderings in (2.3) give
  $ \| d \( z \, p_n \)^2 + d \( w \, q_n \)^2 - d \( w \, p_n \)^2 - d \( z \, q_n \)^2 #scale(x: 120%, y: 120%)[\|] lt.eq d \( z \, w \)^2 + d \( p_n \, q_n \)^2 . $
  Every long distance on the left is $n D + O \( 1 \)$. More precisely, $d \( z \, p_n \) = n D + b \( z \) + o \( 1 \)$ and $d \( z \, q_n \) = d \( h z \, p_n \) = n D + b \( h z \) + o \( 1 \)$, and similarly for $w$. Dividing the inequality by $2 n D$ and passing to the limit therefore gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ b \( h z \) - b \( h w \) = b \( z \) - b \( w \) . $ <eq:busemann-difference>]
  Consequently $chi \( h \) = b \( x \) - b \( h x \)$ is a homomorphism on $C_G \( g \)$: apply (2.8) with $z = k x \, w = x$ to compute $chi \( h k \) = chi \( h \) + chi \( k \)$. Also $b \( x \) = 0$, $b \( g x \) = - D$, and hence $chi \( g \) = D$. Lipschitz continuity, applied to $h^n$, gives
  $ n \| chi \( h \) \| = \| b \( x \) - b \( h^n x \) \| lt.eq d \( x \, h^n x \) \, #h(2em) upright("so ") \| chi \( h \) \| lt.eq ell \( h \) . $
  Apply this last inequality to $g^t h$ for every integer $t$. By Lemma 4,
  $ \( t D + chi \( h \) \)^2 lt.eq t^2 D^2 + 2 t chevron.l g \, h chevron.r + ell \( h \)^2 . $
  After cancelling the quadratic terms, the inequality for arbitrarily large positive and negative $t$ forces $D chi \( h \) = chevron.l g \, h chevron.r$. Thus the pairing is a multiple of the homomorphism $chi$, as asserted. ◻
]

== 3 A quantitative constraint from braid groups <sec:braids>

Let $B_l$ denote the group on $s_1 \, dots.h \, s_(l - 1)$ with relations

$ s_i s_(i + 1) s_i = s_(i + 1) s_i s_(i + 1) \, #h(2em) s_i s_j = s_j s_i quad upright("if ") \| i - j \| gt.eq 2 . $

Throughout this section the same notation may denote elements of another group satisfying these relations. No injectivity or cocompactness of the resulting braid subgroup is needed for the length estimates.

#prodef([Proposition 3.1.])[
  #emph[Suppose a group acting geometrically on a CAT(0) space contains elements $s_1 \, dots.h \, s_39$ satisfying the $B_40$ relations, with $ell \( s_1^2 \) > 0$. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ (frac(ell \( \( s_1 s_2 \)^3 \), 3 ell \( s_1^2 \)))^2 gt.eq 143 / 513 > 1 / 4 \, $ <eq:braid-angle-bound>]

 and in particular 
$ frac(ell \( \( s_1 s_2 \)^3 \), 3 ell \( s_1^2 \)) = frac(ell \( \( s_1 s_2 \)^3 \), 3 ell \( s_2^2 \)) > 1 / 2 . $

]
] <prop:braid-angle>

For $B_4$, Crisp and Paoluzzi compute translation components along an axis of a central element under a minimal geometric action [9] Proposition 5; minimality means that no proper nonempty closed convex subset is invariant.

To prove Proposition 6, we compare central elements of the initial braid subblocks using the centralizer characters of Section 2. For a general $B_l$ with $l gt.eq 3$, define

#[#set math.equation(numbering: n => "(3.2)")
 $ L_1 = 1 \, #h(2em) L_j = s_(j - 1) L_(j - 1) s_(j - 1) \, #h(2em) Z_r = L_1 dots.h.c L_r \, #h(2em) N_r = binom(r, 2) . $ <eq:braid-centers-definition>]

Here $2 lt.eq j lt.eq l$ and $1 lt.eq r lt.eq l$.

#prodef([Lemma 3.2.])[
  #emph[The element $L_j$ commutes with $s_i$ for $i lt.eq j - 2$, and $Z_r$ commutes with every $s_i$ for $i < r$. In particular, 
$ Z_2 = s_1^2 \, #h(2em) Z_3 = \( s_1 s_2 \)^3 . $

 The element $delta = s_1 dots.h.c s_(l - 1)$ satisfies 
#[#set math.equation(numbering: n => "(3.3)")
 $ delta s_i delta^(- 1) = s_(i + 1) #h(2em) \( 1 lt.eq i lt.eq l - 2 \) . $ <eq:braid-shift>]

 In any geometric action of the ambient group, 
#[#set math.equation(numbering: n => "(3.4)")
 $ chevron.l s_i^2 \, Z_r chevron.r = frac(ell \( Z_r \)^2, N_r) #h(2em) \( 2 lt.eq r lt.eq l \, med 1 lt.eq i < r \) . $ <eq:braid-central-pairing>]

]
] <lem:braid-centers>

#proof[
  Induct on $j$ for the assertion about $L_j$. For $i lt.eq j - 3$, both $s_(j - 1)$ and $L_(j - 1)$ commute with $s_i$. For $i = j - 2$, put $a = s_(j - 2)$, $b = s_(j - 1)$, and $C = L_(j - 2)$. Then $b C = C b$ and $L_j = b a C a b$, so the braid relation gives
  $ a L_j = a b a C a b = b a b C a b = b a C b a b = b a C a b a = L_j a . $
  This includes the case $j = 3$, where $C = L_1 = 1$; the case $j = 2$ is empty. In particular, $L_j$ commutes with each earlier $L_i$, because the word for $L_i$ uses only $s_1 \, dots.h \, s_(i - 1)$.
  Next induct on $r$ for $Z_r$. Both $Z_(r - 1)$ and $L_r$ commute with $s_i$ for $i lt.eq r - 2$. The only remaining generator is $s = s_(r - 1)$. It commutes with $Z_(r - 2)$. With $L = L_(r - 1)$ we have $L_r = s L s$, and the already proved commutation of $L$ with $L_r$ says $L s L s = s L s L$. Therefore
  $ s \( L L_r \) = s L s L s = L s L s^2 = \( L L_r \) s \, $
  which proves the assertion. The case $r = 2$ is immediate. Finally
  $ Z_3 = s_1^2 s_2 s_1^2 s_2 = s_1 \( s_1 s_2 s_1 \) s_1 s_2 = s_1 \( s_2 s_1 s_2 \) s_1 s_2 = \( s_1 s_2 \)^3 . $
  To verify (3.3), in $delta s_i$ commute the last $s_i$ left past $s_(i + 2) \, dots.h \, s_(l - 1)$, replace $s_i s_(i + 1) s_i$ by $s_(i + 1) s_i s_(i + 1)$, and commute the new $s_(i + 1)$ left past $s_1 \, dots.h \, s_(i - 1)$. The result is $s_(i + 1) delta$.
  For the length identity, apply the character $h mapsto chevron.l Z_r \, h chevron.r$ from Lemma 5. All $s_i$, $i < r$, are in its domain. Applying it to each adjacent braid relation shows that their values are equal; call the common value $alpha$. The positive word for $L_j$ has $2 \( j - 1 \)$ letters, so that for $Z_r$ it has $2 N_r$ letters. Thus
  $ ell \( Z_r \)^2 = chevron.l Z_r \, Z_r chevron.r = 2 N_r alpha \, #h(2em) chevron.l s_i^2 \, Z_r chevron.r = 2 alpha \, $
  which proves (3.4), including when $ell \( Z_r \) = 0$. ◻
]

#proof[
  We retain $l = 2 k$ with $k gt.eq 3$ until the final arithmetic, where $k = 20$. Put $g = s_1^2$, $D = ell \( g \) > 0$, and
  $ R_r = frac(ell \( Z_r \)^2, N_r^2 D^2) quad \( 2 lt.eq r lt.eq 2 k \) \, #h(2em) c_0 = frac(chevron.l s_1^2 \, s_3^2 chevron.r, D^2) . $
  We will express each normalized center length $R_r$ in terms of $R_3$ and $c_0$. Positivity for the commuting odd-indexed squares and for two disjoint block centers will then constrain these quantities and force $R_3 > 1 \/ 4$.
  All squared generators have length $D$, by (3.3). We claim that every pair with $j - i gt.eq 2$ has
  #[#set math.equation(numbering: n => "(3.5)")
   $ chevron.l s_i^2 \, s_j^2 chevron.r = c_0 D^2 . $ <eq:nonadjacent-pairing>]
  First fix $i = 1$. All $s_j$ with $j gt.eq 3$ commute with $g$; their adjacent braid relations, evaluated under the character of $g$, show that $chevron.l g \, s_j chevron.r$ is independent of $j gt.eq 3$. This proves the claim for $i = 1$. For general $i \, j$, conjugate the pair $\( s_1 \, s_(j - i + 1) \)$ by $delta^(i - 1)$. Every successive use of (3.3) has index at most $l - 2$, so it sends the pair to $\( s_i \, s_j \)$. Simultaneous conjugation invariance proves the claim.
  By (3.4),
  #[#set math.equation(numbering: n => "(3.6)")
   $ chevron.l g \, Z_r chevron.r = N_r R_r D^2 . $ <eq:normalized-center-pairing>]
  We compute this character in a second way. Since $Z_3 = g L_3$,
  $ chevron.l g \, L_3 chevron.r = \( 3 R_3 - 1 \) D^2 . $
  For $j > 3$ the recursive definition gives the word
  $ L_j = \( s_(j - 1) dots.h.c s_3 \) L_3 \( s_3 dots.h.c s_(j - 1) \) . $
  Every displayed factor belongs to $C_G \( g \)$, and $chevron.l g \, s_i chevron.r = c_0 D^2 \/ 2$ for $i gt.eq 3$. Keeping $L_3$ as one factor, the character therefore gives
  $ chevron.l g \, L_j chevron.r = #scale(x: 120%, y: 120%)[\(] 3 R_3 - 1 + \( j - 3 \) c_0 #scale(x: 120%, y: 120%)[\)] D^2 #h(2em) \( j gt.eq 3 \) . $
  In particular, this calculation does not expand the noncommuting $s_2$-letters inside $L_3$. Summing over the factors of $Z_r$, including $L_2 = g$, and using (3.6), yields
  #[#set math.equation(numbering: n => "(3.7)")
   $ N_r R_r = 1 + \( r - 2 \) \( 3 R_3 - 1 \) + binom(r - 2, 2) c_0 #h(2em) \( 3 lt.eq r lt.eq 2 k \) . $ <eq:braid-recursion>]
  There are $k$ mutually commuting squares $s_1^2 \, s_3^2 \, dots.h \, s_(2 k - 1)^2$. The squared length of their product, computed by Lemma 4, is
  $ k D^2 + k \( k - 1 \) c_0 D^2 gt.eq 0 . $
  Consequently
  #[#set math.equation(numbering: n => "(3.8)")
   $ c_0 gt.eq - frac(1, k - 1) . $ <eq:lower-cross-pairing>]
  For the other constraint, compare $Z_k$ with $Z'_k = delta^k Z_k delta^(- k)$. Repeated application of (3.3) sends its generators $s_1 \, dots.h \, s_(k - 1)$ to $s_(k + 1) \, dots.h \, s_(2 k - 1)$; the largest index to which the shift formula is applied is $2 k - 2$. Every generator in the first block commutes with every generator in the second, so $Z_k$ and $Z'_k$ commute, and they have equal length by conjugacy.
  Write their positive words as $Z_k = x_1 dots.h.c x_(2 N_k)$ and $Z'_k = y_1 dots.h.c y_(2 N_k)$. Use first the character of $Z'_k$, since each $x_p$ commutes with $Z'_k$, and then the character of each $x_p$, since each $y_q$ commutes with $x_p$. These are two separate valid character expansions, giving
  $ chevron.l Z_k \, Z'_k chevron.r & = sum_(p = 1)^(2 N_k) chevron.l x_p \, Z'_k chevron.r = sum_(p \, q = 1)^(2 N_k) chevron.l x_p \, y_q chevron.r\
 & = \( 2 N_k \)^2 frac(c_0 D^2, 4) = N_k^2 c_0 D^2 . $
  Here the factor $1 \/ 4$ follows by bilinearity from (3.5) applied to $x_p^2 \, y_q^2$. The nonnegative squared length of $Z_k \( Z'_k \)^(- 1)$ is thus $2 N_k^2 D^2 \( R_k - c_0 \)$, proving
  #[#set math.equation(numbering: n => "(3.9)")
   $ R_k gt.eq c_0 . $ <eq:disjoint-centers>]
  Put $r = k$ in (3.7) and use (3.9). Since $N_k - binom(k - 2, 2) = 2 k - 3$, we obtain
  $ 3 R_3 & gt.eq 1 - frac(1, k - 2) + frac(2 k - 3, k - 2) c_0\
 & gt.eq 1 - frac(3 k - 4, \( k - 1 \) \( k - 2 \)) \, $
  where the second inequality is (3.8). At $k = 20$, this says
  $ 3 R_3 gt.eq 1 - 56 / 342 = 143 / 171 \, #h(2em) R_3 gt.eq 143 / 513 > 1 / 4 . $
  Finally $Z_3 = \( s_1 s_2 \)^3$, $N_3 = 3$, and $ell \( s_2^2 \) = ell \( s_1^2 \) = D$. These identities give the claimed ratios. ◻
]

== 4 Six asymptotic sectors <sec:sectors>

Set

$ T = chevron.l a \, b \, c divides a b a = b a b \, med b c b = c b c \, med c a c = a c a chevron.r \, #h(2em) cal(E) = { \( a \, b \) \, \( b \, c \) \, \( c \, a \) } \, $

and write $z_(u v) = \( u v \)^3$ for $\( u \, v \) in cal(E)$.

#prodef([Proposition 4.1.])[
  #emph[There is no geometric action of $T$ such that, for every $\( u \, v \) in cal(E)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ frac(ell \( z_(u v) \), 3 ell \( u^2 \)) = frac(ell \( z_(u v) \), 3 ell \( v^2 \)) > 1 / 2 . $ <eq:strict-ratios>]

]
] <prop:triangle-obstruction>

The denominators are positive in every geometric action: sending each of $a \, b \, c$ to $1 in bb(Z)$ shows that their squares have infinite order, so Lemma 3 applies. The equality of the two ratios also follows from conjugacy of adjacent braid generators. We prove the proposition in Section 6. In this section, assume for contradiction that such an action on $Y$ exists and fix $y in Y$.

We will construct a parameter disk $P$ made of six Euclidean sectors and maps $f_n : P arrow.r Y$, indexed by positive integers $n$. Within each sector, image distances divided by $n$ approach Euclidean distances. Mirror coordinates will ensure a second property: disjoint closed regions of $P$ have images separated by a positive multiple of $n$. The total sector angle below $2 pi$ then lets us fill the same boundary by a second disk whose image stays a positive multiple of $n$ from $y$. Sections 5 and 6 compare the resulting sphere with finite labelled diagrams to obtain the contradiction.

=== 4.1 Orbit control and mirror coordinates <orbit-control-and-mirror-coordinates>

Let $d_T$ be the word metric for $a \, b \, c$ and their inverses. The following form of the Švarc–Milnor orbit comparison is standard; see [5] I.8.18–19. Its direct proof records the constants used to turn mirror-coordinate separation into metric separation.

#prodef([Lemma 4.2.])[
  #emph[For a geometric action of $T$ and any base point $y$, there are constants $R \, C < oo$ such that $T y$ is $R$-dense and 
#[#set math.equation(numbering: n => "(4.2)")
 $ d_T \( s \, t \) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + d_Y \( s y \, t y \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( s \, t in T \) . $ <eq:orbit-control>]

]
] <lem:orbit-control>

#proof[
  If $T K = Y$ with $K$ compact, take $R = max_(p in K) d \( y \, p \)$. Every $t p$ is within $R$ of $t y$. For $L = d \( s y \, t y \)$, divide the geodesic into $N = max \( 1 \, ceil.l L ceil.r \) lt.eq L + 1$ pieces, each of length at most one. Choose nearby orbit points at the division points, keeping the prescribed endpoint labels $s \, t$. Each successive group increment $q$ satisfies $d \( y \, q y \) lt.eq 2 R + 1$. There are finitely many such $q$: the compact ball $overline(B) \( y \, 2 R + 1 \)$ contains both $y$ and $q y$, so properness applies. The largest word length of these increments, enlarged to at least one, can be used for $C$. Summing their word lengths proves (4.2). ◻
]

Digne’s reflection-coordinate homomorphism sends an Artin generator associated to a reflection $r$ to $\( e_r \, r \)$ in a semidirect product [10] Proposition 2.1. We use its concrete version for the side reflections of an equilateral triangle and verify its formulas. The resulting coordinates will distinguish all six sectors.

Take an equilateral triangle in the Euclidean plane, and denote its three side lines by $D_a \, D_b \, D_c$. Let $r_u$ be reflection in $D_u$, and let $cal(D)$ be the set of all images of these three lines under the generated reflection group. Write

$ E = xor.big_(D in cal(D)) bb(R) e_D \, #h(2em) ∥sum_D xi_D e_D∥_1 = sum_D \| xi_D \| . $

All vectors here have finite support. Each $r_u$ preserves $cal(D)$ and acts linearly on $E$ by permuting its basis vectors.

#prodef([Lemma 4.3.])[
  #emph[The formulas 
$ u dot.op xi = e_(D_u) + r_u xi #h(2em) \( u = a \, b \, c \) $

 define an affine isometric action of $T$ on $E$. If $V \( t \) = t dot.op 0$, then 
#[#set math.equation(numbering: n => "(4.3)")
 $ parallel V \( t \) - V \( s \) parallel_1 lt.eq d_T \( s \, t \) . $ <eq:mirror-lipschitz>]

 For each $\( u \, v \) in cal(E)$, the elements $u^2 \, z_(u v)$ act by pure translations with vectors 
#[#set math.equation(numbering: n => "(4.4)")
 $ L_u = 2 e_(D_u) \, #h(2em) L_(u v) = 2 \( e_(D_u) + e_(D_v) + e_(D_(u v)) \) \, $ <eq:mirror-translations>]

 where $D_(u v)$ is the third mirror at $D_u ∩ D_v$. The three lines $D_(a b) \, D_(b c) \, D_(c a)$ are distinct from one another and from $D_a \, D_b \, D_c$.]
] <lem:mirror-action>

#proof[
  Two incident side reflections generate the reflection group of three lines spaced at angles $pi \/ 3$ about their intersection. Their two length-three braid words have the same linear part. The translation part of $u v u$ is
  $ e_(D_u) + e_(r_u D_v) + e_(r_u r_v D_u) = e_(D_u) + e_(D_(u v)) + e_(D_v) . $
  For $v u v$, the three terms occur in the reverse order. Thus the translation parts also agree, proving the affine braid relations.
  Each generator or inverse moves $0$ a vector of norm one, so a word of length $k$ moves $0$ a distance at most $k$. For the linear permutation part $r_s$ of $s$, the cocycle identity gives
  $ V \( t \) - V \( s \) = r_s V \( s^(- 1) t \) . $
  Taking norms proves (4.3).
  Reflection in $D_u$ fixes its own basis vector, giving the translation vector $2 e_(D_u)$ for $u^2$. Also $\( u v \)^3 = \( u v u \)^2$. The affine map $u v u$ has translation vector equal to the sum of the three mirror vectors, and its linear part preserves that sum and has square one. Squaring proves the second formula in (4.4). The third mirror at a vertex of an equilateral triangle is parallel to the opposite side and distinct from it. The three opposite directions are different. This proves the last assertion. ◻
]

=== 4.2 The parameter disk <the-parameter-disk>

For each pair $\( u \, v \) in cal(E)$, use both commuting pairs

$ \( U \, H \) = \( u^2 \, z_(u v) \) \, #h(2em) \( U \, H \) = \( v^2 \, z_(u v) \) . $

Commutation follows from Lemma 7. On the exponent plane $bb(R)^2$ of each pair, let $parallel dot.op parallel_(U \, H)$ be the stable seminorm from Lemma 4. Give its nonnegative quadrant exponent coordinates $\( lambda \, mu \)$, corresponding to $U \, H$, respectively. The next lemma proves that this quadrant is a Euclidean sector.

#prodef([Lemma 4.4.])[
  #emph[Each of these six seminorms is positive definite. Each sector angle $theta$ satisfies $0 < theta < pi \/ 3$. The sectors glue isometrically along their shared rays, in the cyclic order 
#[#set math.equation(numbering: n => "(4.5)")
 $ a^2 \, med z_(a b) \, med b^2 \, med z_(b c) \, med c^2 \, med z_(c a) \, med a^2 . $ <eq:ray-order>]

 Their radius-one disk $P$ is a topological disk with total angle $0 < Omega < 2 pi$. It has a continuous injective map $v_(*) : P arrow.r E$ whose value in a sector for $U = u^2 \, H = z_(u v)$ is 
#[#set math.equation(numbering: n => "(4.6)")
 $ v_(*) \( lambda \, mu \) = lambda L_u + mu L_(u v) \, $ <eq:separating-coordinates>]

 and similarly with $v$ in place of $u$.]
] <lem:sector-data>

#proof[
  For integral $\( i \, j \)$, the pure translation formulas give
  $ V \( \( U^i H^j \)^m \) = m \( i L_u + j L_(u v) \) . $
  Use (4.3) and (4.2), divide by $m$, and let $m arrow.r oo$. It follows that
  $ parallel i L_u + j L_(u v) parallel_1 lt.eq C parallel \( i \, j \) parallel_(U \, H) . $
  The same inequality holds on rational vectors by homogeneity and on real vectors by continuity. The two displayed translation vectors are linearly independent: the extra-mirror coordinate first determines $j$, and the $D_u$-coordinate then determines $i$. The stable form is therefore positive definite.
  The central pairing formula (3.4), with $r = 3$, gives
  $ chevron.l U \, H chevron.r = frac(ell \( H \)^2, 3) . $
  Hence
  #[#set math.equation(numbering: n => "(4.7)")
   $ cos theta = frac(chevron.l U \, H chevron.r, ell \( U \) ell \( H \)) = frac(ell \( H \), 3 ell \( U \)) > 1 / 2 . $ <eq:sector-angle>]
  Positive definiteness ensures $cos theta < 1$. This proves the angle bounds.
  Along a ray for an element $W$, exponent $t gt.eq 0$ has distance $t ell \( W \)$ from the origin in either adjacent sector. Thus the identifications preserve both exponents and metrics. The resulting cone is parametrized by a radius $r gt.eq 0$ and a cyclic angle of period $Omega$, with all angle values identified at $r = 0$. Its part $0 lt.eq r lt.eq 1$ is the asserted disk.
  The formulas for $v_(*)$ agree on every shared ray. If a vector in its image has a nonzero extra-mirror coordinate, that coordinate specifies $\( u \, v \)$ and $mu$. The excess over $2 mu$ on one of the original two side coordinates specifies the remaining exponent and which of the two sectors is used. If there is no excess, the point is on the shared $H$-ray. With no extra-mirror coefficient, the vector is on one squared-generator ray or is zero. These descriptions distinguish points precisely up to the stated ray identifications. They prove injectivity, including at the origin. ◻
]

We use only the Euclidean metric within each sector of $P$; we do not claim that this cone disk is CAT(0). Figure 1 shows the cyclic gluing.

#figure(
  [#image("fig/sectors.pdf.png", width: 82.0%)],
  caption: [Figure 1: The six sectors of the parameter disk $P$, cut open along the $a^2$-ray. The two boundary copies of that ray are identified. The angles and patch sizes are schematic; each angle is less than $pi \/ 3$, with total $Omega < 2 pi$. The chord is drawn after unfolding a shorter angular arc and illustrates Lemma 13; the nested patches $B' subset "int" B$ are chosen in Subsection 6.1 for the local winding count. ],
) <fig:sectors>

=== 4.3 Uniform asymptotic maps <uniform-asymptotic-maps>

In each sector define the group label

#[#set math.equation(numbering: n => "(4.8)")
 $ t_n \( p \) = U^(floor.l n lambda floor.r) H^(floor.l n mu floor.r) . $ <eq:sector-label>]

These labels agree on the glued rays.

#prodef([Lemma 4.5.])[
  #emph[There are continuous maps $f_n : P arrow.r Y$, with $f_n \( 0 \) = y$, and a constant $C_0$ independent of $n \, p$, such that 
#[#set math.equation(numbering: n => "(4.9)")
 $ d_Y \( f_n \( p \) \, t_n \( p \) y \) lt.eq C_0 . $ <eq:grid-error>]

 For two points in any one sector, 
#[#set math.equation(numbering: n => "(4.10)")
 $ frac(d_Y \( f_n \( p \) \, f_n \( p' \) \), n) arrow.r parallel p - p' parallel_(U \, H) $ <eq:sector-convergence>]

 uniformly. In addition, uniformly on $P$, 
#[#set math.equation(numbering: n => "(4.11)")
 $ frac(d_Y \( y \, f_n \( p \) \), n) arrow.r r \( p \) \, #h(2em) frac(V \( t_n \( p \) \), n) arrow.r v_(*) \( p \) . $ <eq:radial-coordinates>]

 If $A_1 \, A_2 subset P$ are disjoint nonempty closed sets, then for some $delta > 0$ and all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(4.12)")
 $ d_Y \( f_n \( A_1 \) \, f_n \( A_2 \) \) gt.eq delta n . $ <eq:region-separation>]

]
] <lem:sector-maps>

#proof[
  Triangulate the entire exponent quadrant by squares of side $1 \/ n$, each split along a diagonal, and assign the vertex $\( i \/ n \, j \/ n \)$ the point $U^i H^j y$. Use constant-speed geodesics on edges. On each triangle, cone the opposite edge to its remaining vertex using geodesics. This gives a continuous map: all restrictions to common edges are the same geodesic parametrization. Geodesic convexity bounds the distance of every image point from a vertex by the maximum of the corresponding vertex distances. Commutation bounds those distances uniformly by the displacements of $U \, H$. Restricting to the radius-one sector therefore gives (4.9). The restrictions on shared rays agree, so the six maps glue. There are only six sectors, allowing a common $C_0$.
  For one commuting pair put
  $ F \( i \, j \) = d_Y \( y \, U^i H^j y \) #h(2em) \( \( i \, j \) in bb(Z)^2 \) . $
  The triangle inequality and commutation give
  $ \| F \( i \, j \) - F \( i' \, j' \) \| lt.eq d \( y \, U y \) \| i - i' \| + d \( y \, H y \) \| j - j' \| . $
  For a fixed rational vector $q = \( a \/ m \, b \/ m \)$, compare $floor.l n q floor.r$ with $floor.l n \/ m floor.r \( a \, b \)$; their difference stays bounded. The definition of stable length consequently gives
  $ frac(F \( floor.l n q floor.r \), n) arrow.r frac(ell \( U^a H^b \), m) = parallel q parallel_(U \, H) . $
  This includes negative $a \, b$. On a bounded real region, choose a finite rational net of arbitrarily small mesh. The common Lipschitz bound above, with a rounding error $O \( 1 \/ n \)$, and continuity of the stable norm upgrade this convergence to uniform convergence on the region.
  For $p \, p'$ in a sector, the difference between their floored exponent vectors differs from the floor of $n \( p' - p \)$ by a bounded integer vector. The orbit distance between their labels is $F$ of that difference. The uniform result and (4.9) prove (4.10). Taking one point to be $0$ gives the radial assertion. The other assertion of (4.11) follows directly from (4.4); its error is in fact $O \( 1 \/ n \)$.
  Finally, compactness and injectivity give
  $ eta = min_(p in A_1 \, med q in A_2) parallel v_(*) \( p \) - v_(*) \( q \) parallel_1 > 0 . $
  By (4.11), the norm of $V \( t_n \( p \) \) - V \( t_n \( q \) \)$ is at least $eta n \/ 2$, uniformly for these pairs and large $n$. Combining (4.3), (4.2), and (4.9) gives
  $ d_Y \( f_n \( p \) \, f_n \( q \) \) gt.eq frac(eta n, 2 C) - 1 - 2 C_0 . $
  Decreasing the positive coefficient proves (4.12). ◻
]

#prodef([Lemma 4.6.])[
  #emph[There is $epsilon.alt > 0$ such that, for all sufficiently large $n$, the map $f_n \|_(partial P)$ extends to a second parameter disk whose entire image lies outside $B_Y \( y \, epsilon.alt n \)$. Gluing the two parameter disks gives a continuous sphere map, still denoted $f_n$.]
] <lem:outer-cap>

#proof[
  For any two points of $partial P$, choose a shorter angular arc between them. Its angle $phi.alt$ is at most $Omega \/ 2 < pi$. Unfold its sectors to a Euclidean wedge. The wedge intersected with the unit disk is convex, so the chord between the points stays within it, as in Figure 1. Its length is
  $ 2 sin \( phi.alt \/ 2 \) lt.eq 2 sin \( Omega \/ 4 \) . $
  Each sector appears at most once in this development, except that a sector containing both endpoints may appear in two end pieces. Each such piece is convex, so its intersection with the chord is a segment. The chord therefore splits into at most seven single-sector pieces. Apply the uniform estimate (4.10) to each piece. Uniformly for $p \, p' in partial P$, this gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ d_Y \( f_n \( p \) \, f_n \( p' \) \) lt.eq 2 sin \( Omega \/ 4 \) n + o \( n \) . $ <eq:boundary-short>]
  Fix $p_0 in partial P$ and cone the boundary map to $f_n \( p_0 \)$ by geodesics. Their continuous dependence makes this a continuous map of a parameter disk. If $q in \[ A \, B \]$, the two triangle inequalities give
  $ d \( y \, q \) gt.eq max { d \( y \, A \) - d \( A \, q \) \, thin d \( y \, B \) - d \( q \, B \) } gt.eq frac(d \( y \, A \) + d \( y \, B \) - d \( A \, B \), 2) . $
  Here both endpoints have distance $n + o \( n \)$ from $y$, uniformly, by (4.11); (4.13) bounds their distance. The entire coning segment therefore stays at distance at least
  $ #scale(x: 120%, y: 120%)[\(] 1 - sin \( Omega \/ 4 \) #scale(x: 120%, y: 120%)[\)] n - o \( n \) $
  from $y$. Take $epsilon.alt = 1 / 2 \( 1 - sin \( Omega \/ 4 \) \) > 0$. ◻
]

== 5 Labelled triangular diagrams <sec:diagrams>

We next construct a two-dimensional labelled complex from the presentation of $T$. The presentation and link are the case $m = n = p = 3$ of the construction of Brady and McCammond [2]. We give direct proofs of the needed facts. This complex is separate from the unknown CAT(0) space; the argument here concerns finite diagrams and planar topology.

We need two conclusions. Proposition 16 will show that a spherical diagram has zero total signed occurrences of each individual target triangle. Lemma 17 will approximate any geometric sphere map by a diagram, with one distance bound valid on every point of every parameter triangle. Together they will let the local winding count in Section 6 use the metric separation from the preceding section.

=== 5.1 The triangular presentation and its link <the-triangular-presentation-and-its-link>

#prodef([Lemma 5.1.])[
  #emph[For each $\( u \, v \) in cal(E)$, introduce two private generators $x_(u v)$ and $h_(u v)$. Write $\( x_1 \, x_2 \, x_3 \, h \) = \( u \, v \, x_(u v) \, h_(u v) \)$ within this block. A presentation of $T$ is given by the three relations 
#[#set math.equation(numbering: n => "(5.1)")
 $ x_i x_(i + 1) = h #h(2em) \( i = 1 \, 2 \, 3 \) \, $ <eq:triangle-relations>]

 in each block, where the subscripts on the $x_i$ are read modulo three.]
] <lem:triangular-presentation>

#proof[
  The first two relations give $h = x_1 x_2$ and $x_3 = x_2^(- 1) x_1 x_2$. Substituting these in the third gives $x_1 x_2 x_1 = x_2 x_1 x_2$. Conversely, that braid relation and these definitions of $x_3 \, h$ give all three relations (5.1). Since the added generators are private to their blocks, eliminating them independently recovers the defining presentation of $T$. ◻
]

Let $cal(A)$ be the resulting set of nine generators. Define the labelled Cayley complex $cal(K)$ as follows. Its vertices are the elements of $T$. For every $g in T$ and $q in cal(A)$ there is an oriented edge labelled $\( g \, q \)$ from $g$ to $g q$. For each relation (5.1) and each $g$, attach a triangle, with its own cell identity, along the edges joining

#[#set math.equation(numbering: n => "(5.2)")
 $ g \, quad g x_i \, quad g h . $ <eq:triangle-vertices>]

Edges and triangles retain these identities even if some other cells have the same vertex data. The homomorphism $T arrow.r bb(Z)$ taking $a \, b \, c$ to $1$ takes every $x_i$ to $1$ and every $h$ to $2$. Consequently the three vertices in (5.2) are distinct. In particular every target triangle has three distinct sides and three distinct corners.

The link at a vertex means the graph with one vertex for each incident edge direction and one edge for each incident triangle corner. Its vertices can be denoted $q^(+) \, q^(-)$ for $q in cal(A)$, representing the outgoing and incoming $q$-edges.

#prodef([Lemma 5.2.])[
  #emph[The link at every vertex of $cal(K)$ has no circuit of length less than six, including circuits formed by parallel edges.]
] <lem:link-girth>

#proof[
  Fix a Cayley vertex $v$. For the relation $x_i x_(i + 1) = h$, its initial, middle, and terminal corners occur at $v$ in exactly the translates $g = v$, $g = v x_i^(- 1)$, and $g = v h^(- 1)$, respectively. Their link edges are exactly
  #[#set math.equation(numbering: n => "(5.3)")
   $ { x_i^(+) \, h^(+) } \, #h(2em) { x_i^(-) \, x_(i + 1)^(+) } \, #h(2em) { x_(i + 1)^(-) \, h^(-) } . $ <eq:link-edges>]
  Thus one block is a theta graph with three internally disjoint paths of length three from $h^(+)$ to $h^(-)$:
  $ h^(+) #h(0.27778em) - #h(0.27778em) x_1^(+) #h(0.27778em) - #h(0.27778em) x_3^(-) #h(0.27778em) - #h(0.27778em) h^(-) \,\
h^(+) #h(0.27778em) - #h(0.27778em) x_2^(+) #h(0.27778em) - #h(0.27778em) x_1^(-) #h(0.27778em) - #h(0.27778em) h^(-) \,\
h^(+) #h(0.27778em) - #h(0.27778em) x_3^(+) #h(0.27778em) - #h(0.27778em) x_2^(-) #h(0.27778em) - #h(0.27778em) h^(-) . $
  Its nine link edges are distinct. The three blocks meet only at the signed directions of $a \, b \, c$. Across different blocks the only link edges whose two endpoints are shared directions are
  $ { a^(-) \, b^(+) } \, #h(2em) { b^(-) \, c^(+) } \, #h(2em) { c^(-) \, a^(+) } . $
  They too are distinct. This verifies both the complete link description and the absence of parallel edges; possible coincidences of group elements do not identify labelled edge directions.
  It remains to bound a simple circuit. A circuit staying within one block has length at least six. Otherwise split it into maximal nonempty paths within individual blocks, and let $k$ be their number. Their endpoints are the places where the circuit changes blocks. If $k = 2$, both changes occur in the intersection of the same two blocks. Their endpoints must be the two distinct signs of the one shared generator. Within either block their distance is three, so the circuit has length at least six.
  If $k = 3$, the circuit visits all three blocks, changing at one signed direction of each of $a \, b \, c$. In a block the two relevant directions are those of $x_1 \, x_2$. Equal signs have distance at least two; opposite signs have distance at least three except for $x_1^(-) \, x_2^(+)$, which are adjacent. When all three signs agree, the length is therefore at least $2 + 2 + 2$. Otherwise there are two changes of sign in the cyclic order $a \, b \, c \, a$: one from minus to plus, and one from plus to minus. At most one of the corresponding two block paths can use the exceptional adjacency. The lower bound is then $1 + 3 + 2 = 6$.
  Finally, if $k gt.eq 4$, a block path of length one must be one of the three displayed edges between shared directions. Each shared direction is incident to at most one such edge, so two length-one paths cannot be consecutive on the simple circuit. At most $floor.l k \/ 2 floor.r$ paths have length one and the others have length at least two. The total length is at least $2 k - floor.l k \/ 2 floor.r gt.eq 6$. ◻
]

=== 5.2 Signed counts on spheres <signed-counts-on-spheres>

A combinatorial map to $cal(K)$ will always include cell identities. Each edge maps to a specified target edge, possibly with its orientation reversed, or to a vertex. Each triangle either maps homeomorphically to a specified target triangle by its vertex correspondence, or maps affinely into a specified target edge or vertex. These choices agree on common sides. We call the latter triangles collapsed. Fix an orientation for every target triangle. On an oriented source surface, a noncollapsed triangle has sign $+ 1$ or $- 1$ according to its map to that oriented target.

The proof below uses the classical diagrammatic-reducibility method of deleting opposite faces and excluding a reduced spherical diagram by curvature [11] Definition 3.1 and Corollary 4.6, here keeping the identity of each target cell and allowing collapsed parameter triangles.

#prodef([Proposition 5.3.])[
  #emph[For every combinatorial map from a finite triangulated oriented two-sphere to $cal(K)$, and every individual target triangle $tau$, the sum of the signs of all occurrences of $tau$ is zero. Collapsed triangles are allowed in the map and contribute zero.]
] <prop:sphere-counts>

#proof[
  #emph[Encoding the sphere.] In each noncollapsed source triangle draw a central node with three legs ending at its side midpoints. A triangle collapsed to an edge has exactly two nonconstant sides. Join their midpoints by an arc; both sides map to the same labelled target edge. A triangle collapsed to a vertex needs no arc. Joining across source sides produces an embedded trivalent graph, together with possible closed curves containing no nodes. Discard these curves. Each remaining node records a particular occurrence of a target triangle, with its orientation sign, and each graph edge pairs two sides mapping to the same labelled target edge.
  We must retain endpoint information before using this graph as a diagram. Give it a thin regular neighbourhood, consisting of node disks and ribbons along the edges. Along either side of a ribbon the actual group label of the corresponding endpoint of its target edge stays constant. Indeed, passing through an edge-collapsed triangle connects the two sides at the same endpoint of that edge. At a node the two ribbon sides bounding one sector carry the same group label, namely the corresponding corner of that target triangle. It follows that every boundary circle of the regular neighbourhood carries one group-vertex label throughout.
  For each connected component containing nodes, cap its neighbourhood by a disk on every boundary circle and use that constant label at the corresponding dual vertex. This gives a labelled triangular cell decomposition of a sphere: graph nodes correspond to its triangular faces, graph edges to its edges, and neighbourhood boundary circles to its vertices. Here we use the elementary finite planar-topology fact that a polygonal arc properly embedded in a disk cuts it into two disks. To see how it applies, thicken a spanning tree of the connected planar graph to a disk. Add the other embedded edges one at a time as bands. Each runs through a complementary disk and divides it into two disks. Capping the remaining boundary circles therefore gives a sphere. This also proves the usual Euler formula for the resulting cell decomposition. It need not be a strict simplicial complex; incidences, rather than distinct pairs of vertices, are counted.
  The labelling rules exclude certain possible degeneracies. A graph edge cannot join two legs at the same node: these legs represent different target sides, whereas a ribbon has one fixed target edge. No two corners of a face can become the same dual vertex, since their actual target vertex labels are distinct. Also a bridge of the graph would have both ribbon sides on the same neighbourhood boundary circle. Constancy around that circle would equate the distinct endpoints of its target edge, so a correctly labelled graph here has no bridge. Multiple edges between different nodes are harmless.
  #emph[Deleting folds.] A fold is a pair of faces sharing an edge and mapping to the same target triangle across the same target side. Their signs are opposite. Such a pair can be deleted directly in the planar graph. Take a small disk around the chosen connecting edge and its two nodes, cutting the other four legs close to the nodes. The chosen edge and its endpoint disks form a disk even if the same two nodes have additional connecting edges: the middle portions of those additional edges lie outside this disk. If the remaining target sides are called $i \, j$, the exposed legs occur in cyclic order $i \, j \, j \, i$, up to reversal and cyclic permutation. Join $i$ to $i$ and $j$ to $j$ inside the disk without crossing and delete the two nodes. The endpoint labels match on each new ribbon side, including at the common target corner between the two pairings. This preserves all the label rules, planarity, and the sum of signs for each target triangle. It may separate components or produce circles without nodes; discard such circles and cap the neighbourhoods of the remaining components as above. Figure 2 illustrates the reconnection and its endpoint labels.
  #figure(
    [#image("fig/fold.pdf.png", width: 100%)],
    caption: [Figure 2: Deleting a fold. The two nodes are oppositely signed occurrences of the same labelled target triangle $tau$, joined across side $k$. Its other sides are $i \, j$; the regions retain the actual vertex labels $v_0 \, v_1 \, v_2$. Inside the dashed surgery disk, equal sides can be reconnected without crossing, preserving all endpoint labels. ],
  ) <fig:fold>
  #emph[The Euler contradiction.] If nodes remain and no fold is available, choose a component and its dual spherical cell decomposition. The successive corners at each dual vertex give a closed walk in the link of its actual target vertex. A backtrack in this walk would use the very same target corner on both sides of a shared edge. The exact corner description (5.3) then identifies the same translated target triangle on both sides, which is a fold. These must be two distinct source faces: one face cannot use two different corners at this dual vertex, nor can two of its distinct sides be joined by the same ribbon. Thus a one-face incidence cannot evade the deletion rule.
  Every link walk is consequently nonbacktracking. Any finite nonempty closed nonbacktracking walk contains a circuit, so Lemma 15 makes its length at least six. Let $F \, E \, V$ count faces, edges, and vertices of this dual component, with all incidences counted. We obtain
  $ 3 F = 2 E \, #h(2em) 2 E gt.eq 6 V \, #h(2em) V - E + F = 2 . $
  The first two imply $V - E + F lt.eq 0$, a contradiction. Thus whenever nodes remain, a fold can be removed. Each removal decreases their number by two, so the process terminates with no nodes. All signed target-cell counts have been preserved and are then zero. ◻
]

=== 5.3 Controlled approximation by diagrams <controlled-approximation-by-diagrams>

The next lemma transfers continuous maps into the geometric $T$-space to diagrams. A triangulation of a parameter surface means a homeomorphism from a finite triangulated surface onto it. Refinements below are performed within its existing faces, with matching subdivisions of their boundaries. In particular, a prescribed subcomplex remains a union of closed triangles after refinement; its underlying subset is never moved.

#prodef([Lemma 5.4.])[
  #emph[Suppose that $T$ acts geometrically on $Y$ and fix $y in Y$. There is a constant $C_1$, depending only on this action, $y$, and the fixed presentation, with the following property. Let $Sigma$ be a triangulated parameter two-sphere, let $B$ be a subcomplex, and let $f : Sigma arrow.r Y$ be continuous. There is a refinement keeping $B$ a subcomplex and a combinatorial map from the refined sphere to $cal(K)$ such that, for every final triangle $Q$, every one of its group-vertex labels $s$, and every $p in Q$, 
#[#set math.equation(numbering: n => "(5.4)")
 $ d_Y \( s y \, f \( p \) \) lt.eq C_1 . $ <eq:all-points-control>]

 In particular $C_1$ is independent of $f$, its modulus of continuity, and the number of triangles required.]
] <lem:controlled-diagrams>

#proof[
  #emph[Uniform boundary types.] Choose $R < oo$ such that every point of $Y$ is within $R$ of $T y$. For example, if $Y = T K$ with $K$ compact, take $R = max_(z in K) d_Y \( y \, z \)$. By Lemma 9, choose an integer $M$ such that
  #[#set math.equation(numbering: n => "(5.5)")
   $ d_Y \( s y \, t y \) lt.eq 2 R + 1 quad arrow.r.double quad d_T \( s \, t \) lt.eq M . $ <eq:bounded-edge-word>]
  Set $D = max { d_Y \( y \, a y \) \, d_Y \( y \, b y \) \, d_Y \( y \, c y \) }$.
  By uniform continuity, first refine the given parameter triangulation, still respecting $B$, until every face image has diameter at most one. Give each vertex $v$ a group label $s_v$ with $d_Y \( s_v y \, f \( v \) \) lt.eq R$. For each unoriented edge, choose once and for all a path between its two labels of length at most $M$ in the Cayley graph on $a \, b \, c$; the opposite orientation uses the reverse of this same path. This is possible by (5.5). Add three constant steps at each end of every chosen path. Subdivide the parameter edge accordingly, once for both adjacent faces. Its length is at most $M + 6$, and every face boundary is a labelled null loop of length at most $3 \( M + 6 \)$.
  Relative to the label of an original vertex of a face, only finitely many such boundary types are possible: their lengths are bounded and their letters belong to ${ a^(plus.minus 1) \, b^(plus.minus 1) \, c^(plus.minus 1) \, 1 }$. We now construct one finite filling of each type, keeping its parameter boundary fixed. This construction also explains why an ordinary parameter disk, with permissible collapsed triangles, can always be used.
  #emph[Filling the boundary loops.] Reserve the first three constant steps at the chosen original base vertex, and leave them unchanged. Ignoring constants, the remaining boundary word represents the identity in the presentation of Lemma 14. By the definition of a presented group, it lies in the normal closure of the relators in the free group. Hence it can be reduced to the empty word by finitely many free insertions or deletions of $q q^(- 1)$, insertions or deletions of a translated triangular relator loop or its reverse, and constant-step moves. Here each individual move takes place in one target edge, triangle, or vertex. More explicitly, an insertion of a conjugate $w r w^(- 1)$ is achieved by inserting the journey $w w^(- 1)$ through successive free moves and then inserting the triangular loop $r$ at its tip. Free cancellations account for equality in the free group. This proves the claimed finite reduction without assuming a disk-diagram theorem. All moves are performed outside the three reserved steps, so every intermediate cyclic parameter path has at least three edges.
  Realize two successive cycles as the disjoint boundary circles of a triangulated annulus. Along unchanged edges use strips whose two ends have identical target labels on the two circles; triangulate each strip rectangle into two edge-collapsed or vertex-collapsed triangles. For a nonempty substituted arc on each circle, the intervening region is a polygon whose vertex labels lie in the one target simplex used by the move, so it can be triangulated with the corresponding simplex maps.
  For precision, an empty arc requires a fan, not an identification of parameter vertices. Suppose an arc with successive vertices $p_0 \, dots.h \, p_k$ on one circle is deleted at the vertex $q$ of the other. The region between these arcs has the two distinct radial edges $q p_0$ and $q p_k$, together with the fan triangles $q p_(j - 1) p_j$ for $1 lt.eq j lt.eq k$. Although $p_0 \, p_k \, q$ have the same group label, $p_0$ and $p_k$ are distinct parameter vertices. The unchanged strips attach along the two radial edges. At $q$ the preceding strip, the fan, and the following strip have a single interval as their link, so this construction has no pinched parameter point. Reversing the construction handles insertion at an empty arc. The reserved constant steps ensure a nonempty unchanged part around the other side of the annulus. Thus all these pieces form an actual annulus with its two boundary circles unchanged. Since all vertices of the fan map to the simplex used by the move, its triangles are legal, including when some or all of their labels agree.
  As a concrete case, deleting $x x^(- 1)$ from a five-edge cycle consisting of that excursion and three constant edges gives a three-edge cycle. The connecting annulus has two fan triangles collapsed to the $x$-edge and three unchanged strips. Its inner circle remains a circle, despite all its labels being equal; see Figure 3.
  #figure(
    [#image("fig/annulus.pdf.png", width: 95.0%)],
    caption: [Figure 3: The annulus deleting $x x^(- 1)$ and retaining three constant steps. The five outer labels are $g \, g x \, g \, g \, g$; the three inner labels are all $g$. The two fan triangles map into the edge from $g$ to $g x$; the six triangles in the other three strips map to $g$. The inner boundary is capped only at the end of the reduction. ],
  ) <fig:annulus>
  Stack the finitely many annuli and cap the final three-step constant cycle by a cone mapping to its vertex. The result is a finite triangulated disk with the original subdivided boundary. Identify this parameter disk with the original face by a boundary-preserving homeomorphism. Such an identification is elementary: realize the stacked annuli as successive collars inside a disk and the final cone as its central disk; a prescribed parametrization of the outer circle extends radially. The triangulation and its affine simplex maps are understood in these abstract triangle coordinates; the homeomorphism need not be affine in any pre-existing coordinates on the parameter surface. All added triangles are therefore contained in the original face. Gluing these constructions along the already agreed edge subdivisions gives a triangulated sphere and preserves $B$ as a subcomplex.
  #emph[The uniform estimate.] It remains to verify the uniform estimate at every parameter point. Fix all the above fillings for the finite set of boundary types. Normalize their original base vertex to $1 in T$, and let $L$ be the largest original word length $d_T \( 1 \, s \)$ of any vertex label appearing in any one of these fillings. This number is finite, including for private generators in the triangular presentation, since they are words in $a \, b \, c$. It is chosen once and does not depend on $f$. In a translated filling based at an original vertex $v_0$ labelled $s_0$, every label $s$ satisfies $d_T \( s_0 \, s \) lt.eq L$. Every point $p$ of that original face then satisfies
  $ d_Y \( s y \, f \( p \) \) & lt.eq d_Y \( s y \, s_0 y \) + d_Y \( s_0 y \, f \( v_0 \) \) + d_Y \( f \( v_0 \) \, f \( p \) \)\
 & lt.eq D L + R + 1 . $
  Each final triangle lies within that face, so taking $C_1 = D L + R + 1$ proves (5.4). ◻
]

== 6 A local winding count <sec:localization>

We now combine the geometry of Section 4 with the diagram statements of Section 5. Continue to assume the action and strict inequalities of Proposition 8, and retain the sphere maps $f_n$ and the constant $epsilon.alt > 0$ from Lemma 13.

Write $Sigma$ for the parameter sphere; for the geometric map $f_n : Sigma arrow.r Y$, Lemma 17 supplies a separate labelled diagram $Sigma arrow.r cal(K)$ on that sphere. Projected mirror coordinates of its group-labelled vertices, extended affinely over parameter triangles, will define a planar map $q_n : Sigma arrow.r bb(R)^2$ that approximates coordinates on a small patch and has nonzero local winding. Separation in $Y$ will force every occurrence of a contributing target triangle into the patch, making that winding a weighted sum of whole-sphere signed counts, which Proposition 16 makes zero.

=== 6.1 A patch and its coordinates <sec:local-patch>

Choose one of the six sectors, say the sector for $U = u^2 \, H = z_(u v)$. Its exponent coordinates form the nonnegative quadrant in a Euclidean plane. Choose a small closed coordinate rectangle

$ B = \[ lambda_0 \, lambda_1 \] times \[ mu_0 \, mu_1 \] $

in the interior of this sector, with $lambda_0 \, mu_0 > 0$, and so small and close to the origin that all its radii satisfy

#[#set math.equation(numbering: n => "(6.1)")
 $ 0 < r \( p \) < min \( epsilon.alt \/ 3 \, 1 \/ 4 \) #h(2em) \( p in B \) . $ <eq:small-patch>]

Write $kappa \( p \) = \( lambda \, mu \)$ on $B$. Fix an interior point $p_(*)$ and a smaller closed coordinate rectangle $B' subset "int" B$ containing $p_(*)$ in its interior.

We regard $P$ and the second disk as a fixed triangulated parameter sphere, with $B$ a subcomplex. One explicit way to arrange this is as follows. In each sector take the triangle whose two outer vertices lie on its boundary rays at radius one. The six triangles form a polygonal cone disk $Q$. On a radial line, its outer radius $rho$ is at least $cos \( theta \/ 2 \) > sqrt(3) \/ 2$. Map $Q$ to $P$ by a radial homeomorphism that fixes radii at most $1 \/ 2$ and is linear from radius $1 \/ 2$ to the outer radius, sending $rho$ to $1$. These maps agree on the common rays. The rectangle $B$ is fixed pointwise. Extend its four straight sides within its triangle to partition that triangle into finitely many convex polygons; triangulate each polygon and the other five triangles. Finally cone the resulting boundary subdivision to a new parameter vertex for the second disk. This supplies the required finite parameter triangulation.

For $xi = sum_D xi_D e_D$, define the bounded linear map

#[#set math.equation(numbering: n => "(6.2)")
 $ J xi = (frac(xi_(D_u) - xi_(D_(u v)), 2) \, xi_(D_(u v)) / 2) . $ <eq:coordinate-projection>]

By (4.4),

#[#set math.equation(numbering: n => "(6.3)")
 $ J v_(*) \( p \) = kappa \( p \) $ <eq:projection-identity>]

throughout the chosen sector. This is a coordinate projection on that sector; no global injectivity of $J$ is asserted.

Apply Lemma 17 to each sphere map $f_n$, preserving $B$ as a subcomplex. We obtain a subdivided combinatorial sphere map to $cal(K)$. Denote the group label at a vertex by $s$. There is one constant $C_1$, independent of $n$, for which

#[#set math.equation(numbering: n => "(6.4)")
 $ d_Y \( s y \, f_n \( p \) \) lt.eq C_1 $ <eq:local-all-points>]

whenever $s$ is a vertex label of a final parameter triangle and $p$ is any point of that triangle.

On this parameter sphere, assign to the vertex with label $s$ the plane value $J V \( s \) \/ n$, and extend affinely on each abstract triangle. Call the resulting continuous map $q_n$. Affineness refers to the abstract triangle coordinates, regardless of the homeomorphisms used to place the triangles in the parameter sphere.

#prodef([Lemma 6.1.])[
  #emph[On $B$, the maps $q_n$ converge uniformly to $kappa$.]
] <lem:projected-approximation>

#proof[
  Fix $p in B$ and any vertex label $s$ of a triangle containing $p$. The bounds (6.4) and (4.9) imply
  $ d_Y \( s y \, t_n \( p \) y \) lt.eq C_1 + C_0 . $
  By (4.2) and (4.3), there is a constant $C_2$, independent of $n \, p \, s$, such that
  $ parallel V \( s \) - V \( t_n \( p \) \) parallel_1 lt.eq C_2 . $
  The second convergence in (4.11) has error $O \( 1 \/ n \)$, so
  $ ∥frac(V \( s \), n) - v_(*) \( p \)∥_1 = O \( 1 \/ n \) $
  uniformly for every such vertex label. Apply $J$ and (6.3). Since $q_n \( p \)$ is a convex combination of those vertex values, it satisfies the same uniform error bound from $kappa \( p \)$. This is precisely where the all-points form of (6.4) is used. ◻
]

=== 6.2 The winding calculation <the-winding-calculation>

For completeness, we spell out the elementary planar count we use. For a loop avoiding a point $w$, choose continuous local arguments of its vectors from $w$ on successive short parameter intervals. Matching the arguments at their common endpoints gives a total angle change in $2 pi bb(Z)$. Its quotient by $2 pi$ is the winding number. It is unchanged under a homotopy avoiding $w$: local angle choices vary continuously, and a continuous integer-valued function is constant.

If a finite oriented triangulated disk is mapped affinely to the plane, and $w$ avoids all projected edges, sum the winding numbers of its oriented triangle boundaries. Interior edges occur twice with opposite orientations and their angle increments cancel. The sum is therefore the winding number of the outer boundary. For one affine triangle the term is zero if $w$ is outside its convex hull, and is its orientation sign if $w$ lies in its interior. In the first case one may contract the loop inside its convex hull; in the second, rays from $w$ meet the triangle boundary once and its direction makes one full turn. A degenerate triangle contributes zero because $w$ avoids its projected edges.

Choose a small open plane ball $W$ about $kappa \( p_(*) \)$ whose closure lies in $kappa \( "int" B' \)$. By Lemma 18, for large $n$ and every $w$ in a sufficiently small fixed such ball, the following hold:

+ the straight-line homotopy from $q_n \|_(partial B)$ to $kappa \|_(partial B)$ avoids $w$;
+ every $p in B$ with $q_n \( p \) = w$ lies in $"int" B'$.

Indeed, take the approximation error and the radius of $W$ smaller than half the positive distance from $kappa \( p_(*) \)$ to $kappa \( B \\ "int" B' \)$. For each large $n$, choose $w in W$ avoiding every projected edge of the entire finite sphere diagram. A finite union of line segments cannot contain an open ball, so this choice is possible.

The positively or negatively oriented rectangle $kappa \( partial B \)$ has winding number $1$ or $- 1$ about $w$. The preceding homotopy and cancellation argument show that the sum of signed coverings of $w$ by the triangles of $B$ is nonzero. Every contributing triangle is noncollapsed, has a nondegenerate planar image, and contains a parameter point of $B'$ projecting to $w$.

=== 6.3 All occurrences of a contributing cell are local <all-occurrences-of-a-contributing-cell-are-local>

#prodef([Lemma 6.2.])[
  #emph[For all sufficiently large $n$, every occurrence in the sphere diagram of a target triangle contributing to the winding count on $B$ lies entirely in $"int" B$.]
] <lem:localized-degree>

#proof[
  By (4.12), the $f_n$-images of $B'$ and $P \\ "int" B$ are separated by a positive multiple of $n$. On the second disk, Lemma 13 gives distance at least $epsilon.alt n$ from $y$. On $B'$, (6.1) and (4.11) give distance at most $\( epsilon.alt \/ 3 \) n + o \( n \)$ from $y$. Thus the images of $B'$ and the entire complement of $"int" B$ in the sphere have mutual distance tending to infinity, uniformly.
  Let $tau$ be a contributing labelled target triangle. One of its occurrences contains $p in B'$ with $q_n \( p \) = w$. Fix any one of the three group vertex labels $s$ of $tau$. Every other occurrence of this same target cell has the same vertex label $s$, including the full translate information. If some occurrence met the complement of $"int" B$, take a point $p'$ in that intersection. The all-points bound (6.4) would give
  $ d_Y \( f_n \( p \) \, f_n \( p' \) \) lt.eq d_Y \( f_n \( p \) \, s y \) + d_Y \( s y \, f_n \( p' \) \) lt.eq 2 C_1 \, $
  contradicting the uniform separation for large $n$. This also excludes an occurrence touching $partial B$. ◻
]

#proof[
  Choose $n$ large enough for the constructions and Lemma 19. Orient every labelled target triangle of $cal(K)$ once and for all. Its three group vertices have fixed projected values $J V \( s \) \/ n$, so its affine planar image is fixed. If it covers $w$, its determinant has a fixed nonzero sign $eta_tau in { 1 \, - 1 }$. The covering sign of each occurrence is $eta_tau$ times that occurrence’s orientation sign relative to the chosen orientation of the target.
  Group the nonzero winding sum on $B$ by its contributing target triangles. By Lemma 19, every occurrence of each of these target triangles in the whole sphere lies in $B$. Its total contribution is therefore
  $ eta_tau thin #scale(x: 120%, y: 120%)[\(] upright("signed number of occurrences of ") tau upright(" in the sphere") #scale(x: 120%, y: 120%)[\)] = 0 $
  by Proposition 16. Summing gives zero, contrary to the winding number $1$ or $- 1$. Distinct target cells remain separate in this sum even if their projected vertex data agree. The contradiction proves the proposition. ◻
]

== 7 The finite Artin matrix and the final contradiction <sec:assembly>

We now combine the length restriction of Proposition 6 with the obstruction of Proposition 8. The additional generators in the following matrix make the group $T$ a common centralizer. This will produce a geometric action of $T$ from any hypothetical geometric action of the full group.

#prodef([Definition 7.1.])[
  Let $cal(E) = { \( a \, b \) \, \( b \, c \) \, \( c \, a \) }$, as before, and set
  $ S = { a \, b \, c \, d \, e } med union.sq { s_j^(u v) : \( u \, v \) in cal(E) \, med 3 lt.eq j lt.eq 39 } . $
  All symbols in the second set are distinct. For each $\( u \, v \) in cal(E)$, also write $s_1^(u v) = u$ and $s_2^(u v) = v$; these are aliases for existing elements of $S$. Define a symmetric matrix $M = \( m_(s t) \)_(s \, t in S)$ by the following prescriptions:
  + $m_(s s) = 1$ for every $s in S$, and $m_(a b) = m_(b c) = m_(c a) = 3$.
  + In each block ${ s_1^(u v) \, dots.h \, s_39^(u v) }$, set
    $ m_(s_i^(u v) \, s_j^(u v)) = cases(delim: "{", 3 \, & \| i - j \| = 1 \,, 2 \, & \| i - j \| gt.eq 2 .) $
  + For $q in { d \, e }$ and $u in { a \, b \, c }$, set $m_(q u) = 2$.
  + Every remaining off-diagonal entry is $oo$.
  Let $G = A_M$ be the resulting Artin group, with the generators denoted by the elements of $S$ themselves. Let $G_0$ be the group presented by the generators $S \\ { d \, e }$ and all their prescribed relations.
] <def:matrix>

Two distinct blocks meet in just one generator, so their prescriptions do not conflict. Each pair among $a \, b \, c$ is the initial pair of exactly one block, with label $3$ in both prescriptions. Thus the definition specifies exactly one matrix, on

$ \| S \| = 5 + 3 dot.op 37 = 116 $

generators. In particular $m_(d e) = oo$, and neither $d$ nor $e$ has a finite label with any of the private block generators.

=== 7.1 The required embeddings <the-required-embeddings>

#prodef([Lemma 7.2.])[
  #emph[For every $\( u \, v \) in cal(E)$, the homomorphism 
$ B_3 = chevron.l t_1 \, t_2 divides t_1 t_2 t_1 = t_2 t_1 t_2 chevron.r arrow.r T \, #h(2em) t_1 mapsto u \, quad t_2 mapsto v \, $

 is injective. For every $l gt.eq 3$, the homomorphism $B_3 arrow.r B_l$ given by $t_1 mapsto s_1$ and $t_2 mapsto s_2$ is also injective.]
] <lem:pair-embeddings>

#proof[
  For the first assertion, let $w$ be the remaining element of ${ a \, b \, c }$. The assignment
  $ u mapsto t_1 \, #h(2em) v mapsto t_2 \, #h(2em) w mapsto t_1 $
  defines a homomorphism $T arrow.r B_3$: the braid relation for $u \, v$ is the displayed defining relation of $B_3$, the relation for $v \, w$ is that relation with its sides interchanged, and the relation for $w \, u$ becomes $t_1^3 = t_1^3$. Its composite with the asserted inclusion is the identity of $B_3$.
  For the second assertion we construct a word invariant, retaining the entire permutation of the strands as part of its state. Place $l$ distinct tokens, named $1 \, dots.h \, l$, in $l$ ordered positions. Tokens $1 \, 2 \, 3$ are called selected. A state consists of an ordered list of all $l$ tokens and an element $q in B_3$. Read a signed letter $s_i^epsilon$, $epsilon in { 1 \, - 1 }$, as follows. Swap the tokens in positions $i \, i + 1$, irrespective of the sign. If both are selected, they are consecutive in the ordered list of selected tokens; if they occupy positions $j \, j + 1$ in that shorter list, replace $q$ by $q t_j^epsilon$. If at most one is selected, leave $q$ unchanged. The integer $j$ is computed before the swap, and is either $1$ or $2$.
  We verify the defining relations as transformations of all states, not merely of the initial state. The operation for $s_i^(- 1)$ is the inverse of that for $s_i$: a second swap restores the full token list, and, when a letter was recorded, its selected-list index is still $j$, so that the two recorded letters cancel. For $\| i - k \| gt.eq 2$, the swaps at $i$ and $k$ involve disjoint pairs of positions and have the same final token list in either order. With just three selected tokens, at most one of these pairs consists of two selected tokens. Swapping the other pair does not change the selected-list index of the recorded pair, because moving a selected token past an unselected token preserves the order of the selected list. Hence the positive commutation relation is respected.
  For a positive braid relation, name the three tokens initially in positions $i \, i + 1 \, i + 2$ by $A \, B \, C$. The swaps in $s_i s_(i + 1) s_i$ exchange, in order, the pairs
  $ \( A \, B \) \, med \( A \, C \) \, med \( B \, C \) \, $
  whereas those in $s_(i + 1) s_i s_(i + 1)$ exchange them in the opposite order. Both finish with the ordered triple $C \, B \, A$ and fix all other positions. If at most one of $A \, B \, C$ is selected, neither word records a letter. If exactly two are selected, each word records their single crossing with positive sign and the same selected-list index: the third selected token is outside these three consecutive positions and stays on the same side throughout. If all three are selected, the two records are respectively $t_1 t_2 t_1$ and $t_2 t_1 t_2$, which represent the same element of $B_3$.
  Thus the invertible state transformations satisfy every defining positive relation of $B_l$. They consequently respect arbitrary signed word equalities: each defining relator acts trivially, as does its inverse or any conjugate, and free cancellations act trivially by the inverse check. This is precisely the normal-closure description of equality in the presented group. In particular, the verification applies after every signed prefix, and the equal full token lists ensure identical processing of every suffix.
  Start with the token list $\( 1 \, dots.h \, l \)$ and $q = 1$. A word using only $s_1^(plus.minus 1) \, s_2^(plus.minus 1)$ always swaps two of the first three tokens. Its record is exactly the same word with $s_i$ replaced by $t_i$, including every sign. If the original word is trivial in $B_l$, its state transformation fixes this initial state, and its record is therefore trivial in $B_3$. This proves injectivity. The construction asserts a state invariant; it does not assert that discarding the other tokens gives a homomorphism $B_l arrow.r B_3$. ◻
]

=== 7.2 Normal forms and the common centralizer <normal-forms-and-the-common-centralizer>

We use the standard normal-form theorem for free products with amalgamation; see Serre [17] Chapter I, §1.2, Theorems 1–2. The elementary proof below records the exact form needed here, including the case in which multiplication removes the final representative.

#prodef([Lemma 7.3.])[
  #emph[Let $H_1 \, H_2$ be groups with a common embedded subgroup $E$, and let $H_1 *_E H_2$ be the group obtained by identifying the two copies of $E$ in their free product. Each factor embeds in this group, and their intersection is $E$. A product $a_1 dots.h.c a_n$, $n gt.eq 1$, whose factors belong alternately to $H_1 \\ E$ and $H_2 \\ E$ is nontrivial. If such a product contains a factor from $H_i \\ E$, it does not belong to the other factor.]
] <lem:amalgam-normal-form>

#proof[
  For $i = 1 \, 2$, choose a set $R_i subset H_i$ such that every element of $H_i$ is uniquely $r e$ with $r in R_i$, $e in E$, and with $1$ representing $E$. Consider formal states
  $ \( r_1 \, dots.h \, r_n \; e \) \, #h(2em) n gt.eq 0 \, $
  where every $r_j$ is a nonidentity representative and their factor types alternate; for $n = 0$ only the terminal element $e$ is present. Representatives retain their factor types as part of the state.
  Define right multiplication of a state by $h in H_i$ as follows. If its final representative has type $i$, isolate the tail $r e$ with that representative $r$; otherwise use the missing representative $r = 1$. The preceding list $P$ is empty or ends in the other factor. Decompose the element $r e h$ of $H_i$ uniquely as $r' e'$. Replace the tail by $r' \; e'$, omitting $r'$ when $r' = 1$.
  For fixed $i$, these operations are a right action of $H_i$. Indeed, after multiplying by $h in H_i$, the prefix $P$ stays fixed. For a further $k in H_i$, the tail is rewritten from $r' e' k = \( r e h \) k$. If $r' = 1$ was omitted, the rule simply uses the missing representative $1$ and rewrites $e' k$, with exactly the same result. Uniqueness of the decomposition in $H_i$ and associativity therefore give the operation for $h k$. Multiplication by $1$ fixes every state, and multiplication by $h^(- 1)$ is inverse to multiplication by $h$.
  If $h in E$, either factor action leaves all representatives fixed and changes only the terminal element from $e$ to $e h$. The two actions therefore agree on $E$ and give a right action of the presented amalgam: all multiplication relations within the factors and all identifications of $E$ act identically.
  Every state is reached from $\( thin \; 1 \)$ by reading the word $r_1 dots.h.c r_n e$. Conversely, applying the algorithm to an arbitrary word uses only valid equalities in the amalgam and produces a word of that form. If two state words were equal in the amalgam, their actions on $\( thin \; 1 \)$ would give the same state. This proves both existence and uniqueness of these normal forms. In particular, the normal form of an element of $H_i$ is its single representative and terminal $E$-element, or just its $E$-element; this proves the factor embeddings and the intersection assertion.
  Finally, when processing an alternating product $a_1 dots.h.c a_n$ with every $a_j in.not E$, at each step the terminal $E$-element times $a_j$ is still outside $E$. Since its factor type differs from that of the preceding representative, one new nonidentity representative is appended. Its normal form thus has exactly $n$ representatives, of the indicated alternating types. It is nontrivial and cannot be the normal form of an element of a factor whose type omits any of these representatives. ◻
]

Write $B_40^(u v)$ for the abstract braid group in the block corresponding to $\( u \, v \)$, and $B_3^(u v)$ for its initial two-generator subgroup. By Lemma 21, each $B_3^(u v)$ embeds both in that block and in $T$. Applying Lemma 22 successively therefore gives

#[#set math.equation(numbering: n => "(7.1)")
 $ G_0 tilde.equiv #scale(x: 120%, y: 120%)[\(] \( T *_(B_3^(a b)) B_40^(a b) \) *_(B_3^(b c)) B_40^(b c) #scale(x: 120%, y: 120%)[\)] *_(B_3^(c a)) B_40^(c a) . $ <eq:iterated-amalgam>]

At every stage $T$ remains embedded, so the next attaching subgroup is embedded as well. The presentations agree: identifying the first two generators of each block with its specified pair in $T$ leaves exactly the generators and relations defining $G_0$. Thus $T$ and all three braid blocks are embedded in $G_0$.

Let $F \( d \, e \)$ be the free group on $d \, e$, realized as reduced words in $d^(plus.minus 1) \, e^(plus.minus 1)$ with multiplication by concatenation and free cancellation, and put $B = T times F \( d \, e \)$. The direct product has the presentation for $T$ together with the two free generators and the six commutation relations between ${ d \, e }$ and ${ a \, b \, c }$. To check this description directly, the commutations move every $T$-letter to the left of every free letter; the evident homomorphism to the direct product and the two commuting factor homomorphisms are inverse on the generators. Comparison with Definition 20 now gives

#[#set math.equation(numbering: n => "(7.2)")
 $ G tilde.equiv G_0 *_T B = G_0 *_T #scale(x: 120%, y: 120%)[\(] T times F \( d \, e \) #scale(x: 120%, y: 120%)[\)] . $ <eq:full-amalgam>]

Lemma 22 makes both factors, and hence $T$ and the three braid blocks, embedded subgroups of $G$.

#prodef([Lemma 7.4.])[
  #emph[For the elements $d \, e$ of $G$, 
$ C_G \( d \) ∩ C_G \( e \) = T . $

]
] <lem:common-centralizer>

#proof[
  Every element of $T$ commutes with $d$ and $e$ by the presentation. Conversely, first suppose that $g in.not B$. Its normal form in (7.2) can be written $g = w b$, where $b in B$ and $w$ is a nonempty alternating product of elements outside $T$, whose last factor lies in $G_0 \\ T$. Indeed, absorb the terminal $T$-element and, if present, the last $B$-representative into $b$. There is at least one $G_0$-representative because $g in.not B$.
  Under the projection $B arrow.r F \( d \, e \)$, the element $b d b^(- 1)$ maps to a conjugate of the nonidentity free generator $d$. Consequently $b d b^(- 1) in B \\ T$. The word
  $ g d g^(- 1) = w \( b d b^(- 1) \) w^(- 1) $
  is reduced in the sense of Lemma 22: its middle factor lies in $B \\ T$, both neighbors lie in $G_0 \\ T$, and all remaining adjacent factors alternate. It contains a $G_0 \\ T$ factor and hence cannot belong to $B$. In particular it cannot equal $d$. Thus $C_G \( d \) subset B$.
  It remains to compute the common centralizer within $B$. If a reduced word $f in F \( d \, e \)$ commutes with $d$, write $f = v d^q$, where $q in bb(Z)$ and either $v$ is empty or its last letter is $e$ or $e^(- 1)$. This is obtained by removing the maximal terminal string of $d$-letters from the reduced word. Then
  $ f d f^(- 1) = v d v^(- 1) . $
  If $v$ is nonempty, this displayed word is freely reduced, has length $2 \| v \| + 1 > 1$, and cannot equal $d$. Hence $f = d^q$. For $q eq.not 0$, the word $d^q e d^(- q)$ is freely reduced and is not $e$, so only the identity commutes with both free generators. An element $\( t \, f \) in T times F \( d \, e \)$ therefore centralizes both $d$ and $e$ exactly when $f = 1$. This proves the assertion. ◻
]

=== 7.3 A geometric action of the common centralizer <a-geometric-action-of-the-common-centralizer>

Geometric actions of centralizers on minimum-displacement sets are classical. Swenson [18] Theorem 13 credits this result to Ruane [16]; Swenson also studies intersections of convex subgroups, and his proof of Theorem 17 treats simultaneous centralizers [18] Theorems 16–17. The following finite-tuple compactness argument gives the precise common-displacement-sublevel formulation needed here. It applies in every dimension and does not require the elements being centralized to commute.

#prodef([Lemma 7.5.])[
  #emph[Suppose a group $H$ acts geometrically on a nonempty proper CAT(0) space $X$. For finitely many elements $q_1 \, dots.h \, q_m in H$, $m gt.eq 1$, set 
$ C = ⋂_(j = 1)^m C_H \( q_j \) . $

 If $A gt.eq 0$ is finite and the set 
$ Y_A = { x in X : d_X \( x \, q_j x \) lt.eq A upright(" for ") 1 lt.eq j lt.eq m } $

 is nonempty, then $Y_A$, with its inherited metric, is a proper CAT(0) space, invariant under $C$, and the restricted $C$-action is geometric. Every element of $C$ has the same stable translation length in $Y_A$ as in $X$.]
] <lem:geometric-centralizer>

#proof[
  Each function $x mapsto d_X \( x \, q_j x \)$ is continuous and convex. For the convexity, if $gamma$ is the geodesic from $x_0$ to $x_1$ parametrized on $\[ 0 \, 1 \]$, then $q_j gamma$ is the geodesic from $q_j x_0$ to $q_j x_1$, and Lemma 2 gives
  $ d_X \( gamma \( t \) \, q_j gamma \( t \) \) lt.eq \( 1 - t \) d_X \( x_0 \, q_j x_0 \) + t d_X \( x_1 \, q_j x_1 \) . $
  Thus $Y_A$ is closed and convex. Its geodesic triangles and their metrics are inherited from $X$, so it is CAT(0); each closed bounded subset of $Y_A$ is closed and bounded in $X$ and is therefore compact. If $c in C$, then
  $ d_X \( c x \, q_j c x \) = d_X \( c x \, c q_j x \) = d_X \( x \, q_j x \) \, $
  so $Y_A$ is $C$-invariant. Compact subsets of $Y_A$ are compact in $X$, hence the restricted action satisfies the required compact-set properness condition.
  It remains to prove cocompactness. Choose compact $K subset X$ with $H K = X$, and let
  $ L = { z in X : d_X \( z \, K \) lt.eq A } . $
  This closed bounded neighborhood of $K$ is compact, since $X$ is proper. Accordingly
  $ cal(F) = { r in H : r L ∩ L eq.not diameter } $
  is finite. For any $h in H$ such that $h K ∩ Y_A eq.not diameter$, choose $p in K$ with $h p in Y_A$. For every $j$,
  $ d_X \( p \, h^(- 1) q_j h p \) = d_X \( h p \, q_j h p \) lt.eq A . $
  Both $p$ and $h^(- 1) q_j h p$ belong to $L$, so $h^(- 1) q_j h in cal(F)$. Only finitely many ordered tuples
  $ \( h^(- 1) q_1 h \, dots.h \, h^(- 1) q_m h \) $
  are therefore possible. Choose one representative $h_i$ for each tuple that occurs, with $1 lt.eq i lt.eq N$.
  If $h$ has the same tuple as $h_i$, then, for every $j$,
  $ h^(- 1) q_j h = h_i^(- 1) q_j h_i quad arrow.r.double quad \( h h_i^(- 1) \) q_j \( h h_i^(- 1) \)^(- 1) = q_j . $
  Consequently $h h_i^(- 1) in C$, or equivalently
  $ h in C h_i \, #h(2em) h = c h_i quad upright("for some ") c in C . $
  Here $C h_i$ is a #emph[right] coset, in the standard convention. Now set
  $ K_C = Y_A ∩ union.big_(i = 1)^N h_i K . $
  This set is compact. Given $x in Y_A$, write $x = h p$ with $p in K$, choose its tuple representative $h_i$, and write $h = c h_i$ as above. Then $c^(- 1) x = h_i p$ belongs to both $Y_A$ and $h_i K$, so $x in C K_C$. Thus $C K_C = Y_A$, proving cocompactness.
  Finally, for $y in Y_A$, $c in C$, and every positive integer $n$, invariance and the inherited metric give
  $ d_(Y_A) \( y \, c^n y \) = d_X \( y \, c^n y \) . $
  Dividing by $n$ and taking limits proves equality of stable lengths. ◻
]

#proof[
  Let $M$ be the explicit finite matrix of Definition 20. Suppose, for a contradiction, that $G = A_M$ acts properly and cocompactly by isometries on a nonempty proper CAT(0) space $X$. No restriction is placed on the dimension of $X$.
  Choose $x_0 in X$ and a finite number
  $ A gt.eq max { d_X \( x_0 \, d x_0 \) \, d_X \( x_0 \, e x_0 \) } . $
  The set
  $ Y = { x in X : d_X \( x \, d x \) lt.eq A \, med d_X \( x \, e x \) lt.eq A } $
  contains $x_0$. By Lemmas 23 and 24, $T$ acts geometrically on $Y$, and its stable lengths there agree with its stable lengths in $X$.
  Sending every Artin generator of $G$ to $1 in bb(Z)$ defines a homomorphism $G arrow.r bb(Z)$: both sides of each defining Artin relation have the same number of letters. In particular, every squared generator maps to $2$ and has infinite order. Lemma 3 therefore gives $ell_X \( \( s_1^(u v) \)^2 \) > 0$ for each $\( u \, v \) in cal(E)$. The corresponding embedded $B_40$ block satisfies all the relations required by Proposition 6, so that
  $ frac(ell_X \( \( u v \)^3 \), 3 ell_X \( u^2 \)) = frac(ell_X \( \( u v \)^3 \), 3 ell_X \( v^2 \)) > 1 / 2 #h(2em) \( \( u \, v \) in cal(E) \) . $
  Equality of stable lengths transfers all three strict inequalities to the geometric $T$-action on $Y$. This contradicts Proposition 8.
  The $116$-generator Artin group $A_M$ therefore has no proper cocompact isometric action on any nonempty proper CAT(0) space. This is the required counterexample. ◻
]

#heading(level: 1)[References]
#bibitem([1])[N.~Brady and J.~Crisp, #emph[Two-dimensional Artin groups with CAT(0) dimension three], Geom. Dedicata #strong[94] (2002), 185--214. #link("https://doi.org/10.1023/A:1020962804856")[doi:10.1023/A:1020962804856]. Preprint: #link("https://arxiv.org/abs/math/0012102v2")[arXiv:math/0012102v2].]
#bibitem([2])[T.~Brady and J.~P.~McCammond, #emph[Three-generator Artin groups of large type are biautomatic], J. Pure Appl. Algebra #strong[151] (2000), no.~1, 1--9. #link("https://doi.org/10.1016/S0022-4049(99)00094-8")[doi:10.1016/S0022-4049(99)00094-8]. Preprint: #link("https://arxiv.org/abs/math/9809174v1")[arXiv:math/9809174v1].]
#bibitem([3])[T.~Brady and J.~McCammond, #emph[Braids, posets and orthoschemes], Algebr. Geom. Topol. #strong[10] (2010), no.~4, 2277--2314. #link("https://doi.org/10.2140/agt.2010.10.2277")[doi:10.2140/agt.2010.10.2277].]
#bibitem([4])[M.~R.~Bridson, #emph[Length functions, curvature and the dimension of discrete groups], Math. Res. Lett. #strong[8] (2001), 557--567. #link("https://people.maths.ox.ac.uk/bridson/papers/dim/")[Author's preprint page].]
#bibitem([5])[M.~R.~Bridson and A.~Haefliger, #emph[Metric Spaces of Non-Positive Curvature], Grundlehren der mathematischen Wissenschaften, vol.~319, Springer-Verlag, Berlin, 1999. #link("https://doi.org/10.1007/978-3-662-12494-9")[doi:10.1007/978-3-662-12494-9].]
#bibitem([6])[R.~Charney, #emph[Problems related to Artin groups], American Institute of Mathematics, undated problem list. #link("https://people.brandeis.edu/~charney/papers/Artin_probs.pdf")[Author's manuscript].]
#bibitem([7])[R.~Charney and M.~W.~Davis, #emph[Finite $K \( pi \, 1 \)$'s for Artin groups], in #emph[Prospects in Topology], F.~Quinn (ed.), Annals of Mathematics Studies, vol.~138, Princeton University Press, Princeton, NJ, 1995, pp.~110--124. #link("https://people.math.osu.edu/davis.12/finitekpi1.pdf")[Author's preprint].]
#bibitem([8])[J.~Crisp, #emph[On the CAT(0) dimension of 2-dimensional Bestvina--Brady groups], Algebr. Geom. Topol. #strong[2] (2002), 921--936. #link("https://doi.org/10.2140/agt.2002.2.921")[doi:10.2140/agt.2002.2.921]. #link("https://arxiv.org/abs/math/0211130")[arXiv:math/0211130].]
#bibitem([9])[J.~Crisp and L.~Paoluzzi, #emph[On the classification of CAT(0) structures for the 4-string braid group], Michigan Math. J. #strong[53] (2005), no.~1, 133--163. #link("https://doi.org/10.1307/mmj/1114021090")[doi:10.1307/mmj/1114021090].]
#bibitem([10])[F.~Digne, #emph[Présentation des groupes de tresses purs et de certaines de leurs extensions], unpublished manuscript, 1999; arXiv version~3, 2016. #link("https://arxiv.org/abs/1511.08731v3")[arXiv:1511.08731v3].]
#bibitem([11])[S.~M.~Gersten, #emph[Reducible diagrams and equations over groups], in #emph[Essays in Group Theory], Mathematical Sciences Research Institute Publications, vol.~8, Springer-Verlag, New York, 1987, pp.~15--73. #link("https://doi.org/10.1007/978-1-4613-9586-7_2")[doi:10.1007/978-1-4613-9586-7\_2].]
#bibitem([12])[T.~Haettel, #emph[XXL type Artin groups are CAT(0) and acylindrically hyperbolic], Ann. Inst. Fourier (Grenoble) #strong[72] (2022), no.~6, 2541--2555. #link("https://doi.org/10.5802/aif.3524")[doi:10.5802/aif.3524].]
#bibitem([13])[T.~Haettel, D.~Kielak, and P.~Schwer, #emph[The 6-strand braid group is CAT(0)], Geom. Dedicata #strong[182] (2016), 263--286. #link("https://doi.org/10.1007/s10711-015-0138-9")[doi:10.1007/s10711-015-0138-9]. Preprint: #link("https://arxiv.org/abs/1304.5990v2")[arXiv:1304.5990v2].]
#bibitem([14])[S.~G.~Jeong, #emph[The seven-strand braid group is CAT(0)], Manuscripta Math. #strong[171] (2023), 563--581. #link("https://doi.org/10.1007/s00229-022-01387-x")[doi:10.1007/s00229-022-01387-x]. Preprint: #link("https://arxiv.org/abs/2009.09350v1")[arXiv:2009.09350v1].]
#bibitem([15])[M.~Rodenhausen, #emph[Centralisers of polynomially growing automorphisms of free groups], Ph.D. thesis, Rheinische Friedrich-Wilhelms-Universität Bonn, 2013. #link("https://hdl.handle.net/20.500.11811/5725")[hdl:20.500.11811/5725].]
#bibitem([16])[K.~E.~Ruane, #emph[Dynamics of the action of a CAT(0) group on the boundary], Geom. Dedicata #strong[84] (2001), 81--99. #link("https://doi.org/10.1023/A:1010301824765")[doi:10.1023/A:1010301824765].]
#bibitem([17])[J.-P.~Serre, #emph[Trees], translated from the French by J.~Stillwell, Springer-Verlag, Berlin--New York, 1980. #link("https://doi.org/10.1007/978-3-642-61856-7")[doi:10.1007/978-3-642-61856-7].]
#bibitem([18])[E.~L.~Swenson, #emph[A cut point theorem for CAT(0) groups], J. Differential Geom. #strong[53] (1999), no.~2, 327--358. #link("https://doi.org/10.4310/jdg/1214425538")[doi:10.4310/jdg/1214425538].]


