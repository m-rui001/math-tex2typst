#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[A positive solution to Tingley's problem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:intro>

For a real normed space $X$, write $S_X = { x in X : ∥x∥ = 1 }$, with the distance inherited from $X$. Tingley’s problem asks whether every surjective isometry $f : S_X arrow.r S_Y$ extends to a real-linear isometry of the spaces [21]. Any such extension must be the radial map below. This candidate preserves norms and distances at each fixed radius; the difficulty is to recover distances between points at different radii from the metric on a single sphere. We prove the full assertion.

#thm([Theorem 1.1.])[
  #emph[Let $X \, Y$ be nonzero real Banach spaces and let $f : S_X arrow.r S_Y$ be a surjective isometry. Then 
$ T \( 0 \) = 0 \, #h(2em) T \( x \) = ∥x∥ f (x / ∥x∥) quad \( x eq.not 0 \) $

 is a surjective real-linear isometry. It is the unique linear extension of $f$.]
] <thm:main>

The spaces may have arbitrary dimension and need not be separable, reflexive, smooth, or strictly convex. Applied to complex Banach spaces regarded as real spaces, the conclusion is real linearity; complex linearity is not asserted.

The problem belongs to the extension theory of metric isometries. Mazur and Ulam proved that every surjective isometry between real normed spaces is affine [13]; Mankiewicz obtained an extension theorem for surjective isometries between convex sets with nonempty interiors [12]. A unit sphere has empty ambient interior, so this does not directly provide the desired extension. Tingley’s original paper established preservation of antipodal points for surjective isometries between finite-dimensional Banach-space spheres [21].

Early positive results used the structure of concrete spaces. Wang treated surjective isometries between spheres of complex $C_0$-spaces [24], and Ding obtained extension results for $ell^p \( Gamma \)$-type sequence spaces with $p > 1$, $p eq.not 2$ [6]. It is useful to distinguish results for specified source and target classes from the #emph[Mazur–Ulam property]: every surjective sphere isometry from the given space to an arbitrary real Banach target extends linearly. Cheng and Dong formulated this property explicitly [3]. Tan proved it for real $L^p \( mu \)$ on $sigma$-finite measure spaces when $1 < p < oo$, $p eq.not 2$ [19].

Facial geometry provides another route. Following work of Cheng and Dong [3], Tanaka proved that surjective sphere isometries preserve maximal convex subsets of the sphere [20] Lemma 3.5. The operator-algebra program led to extension theorems between arbitrary complex von Neumann algebras, due to Fernández-Polo and Peralta [8], and between their preduals, due to Mori [14]. Mori and Ozawa subsequently proved the arbitrary-target Mazur–Ulam property for unital complex $C^(*)$-algebras viewed as real spaces, and for real von Neumann algebras [15]. Our common-support propagation has a geometric affinity with facial methods; the invariant set and its return-map estimate are constructed directly below.

In finite dimensions, Banakh proved the Mazur–Ulam property for every two-dimensional real Banach space [2]. Other recent results concern specific spaces or sphere self-isometries: Fakhoury proved extension results for sphere self-isometries of Schreier spaces and their $p$-convexifications [7]. Huang and Zhu proved class-to-class extension theorems for Haagerup noncommutative $L_p$-spaces with $1 < p < oo$, $p eq.not 2$, associated with arbitrary von Neumann algebras [9], and Schatten $p$-classes for $0 < p < oo$, $p eq.not 2$, including quasi-Banach cases [10].

===== 1.1 Proof strategy. <proof-strategy.>

The argument measures the largest error in preserving a distance between two radius levels. Its central geometric step turns a hypothetical positive error into two aligned chords. Extremality propagates through common supports, producing an invariant closed convex set of directions. On this set an opposite-endpoint return map contracts the Kuratowski measure of noncompactness. Darbo’s fixed-point theorem then supplies an aligned direction. The proof-specific work is the construction of this invariant set and the quantitative return-map estimate, followed by the chord contradiction; the supporting-functional, ultrapower, fixed-point and affine-extension tools are classical.

Section 2 supplies the finite-dimensional supports and continuous radial contacts. Section 3 makes a positive defect attain its maximum in a new pair of Banach spaces while retaining the bound at every radius. Section 4 constructs the invariant directions and applies the fixed-point theorem. Section 5 eliminates the resulting aligned configuration: one parameter regime contradicts maximality after a small radial perturbation, and the remaining regime contradicts a preserved sphere distance by convexity. Section 6 deduces the onto radial metric extension and proves real linearity by midpoint reflection. All auxiliary arguments are included, with the fixed-point proofs in Appendix 7. Norm subscripts are omitted when their spaces are clear.

== 2 Supporting functionals and radial contact <sec:supports>

A #emph[support] at a vector $a$ in a finite-dimensional normed space is a linear functional $phi$ with $∥phi∥ lt.eq 1$ and $phi \( a \) = ∥a∥$. All supporting functionals below may be taken on the finite-dimensional span of the vectors under discussion. The next lemma is the finite-dimensional Hahn–Banach extension argument [1]; we include its elementary proof.

#thm([Lemma 2.1.])[
  #emph[Supports exist, and can be extended with the same norm bound to any specified finite-dimensional enlargement of their domain. If unit vectors $v \, w$ and positive numbers $alpha \, beta$ satisfy 
$ ∥alpha v + beta w∥ = alpha + beta \, $

 then they have a common support: a norm-bounded linear functional taking value one at both.]
] <lem:support>

#proof[
  Start with the norming functional on the line through a nonzero vector, or the zero functional at zero. To extend a functional $L$ from a subspace $V$ to $V + bb(R) e$, choose its value at $e$ in
  $ ⋂_(a in V) \[ L \( a \) - ∥a - e∥ \, med L \( a \) + ∥a - e∥ \] . $
  The intervals intersect pairwise, since $L \( a \) - L \( b \) lt.eq ∥a - b∥ lt.eq ∥a - e∥ + ∥b - e∥$. They have a common point: they are closed intervals, have the finite intersection property, and the interval indexed by zero is compact. The chosen value gives $\| L \( a \) - L \( e \) \| lt.eq ∥a - e∥$; rescaling proves the norm bound on $V + bb(R) e$. Finitely many such extensions suffice. Finally, a support at $alpha v + beta w$ must take value one at both unit vectors, since both weights are positive. ◻
]

#thm([Lemma 2.2.])[
  #emph[If $∥c∥ < 1$, each ray $c + bb(R)_(+) v$, $v in S_X$, meets $S_X$ at a unique point $c + rho \( v \) v$. The radius is continuous and satisfies 
$ 1 - ∥c∥ lt.eq rho \( v \) lt.eq 1 + ∥c∥ . $

]
] <lem:radial>

#proof[
  Continuity of the norm and boundedness of the unit ball give contact. Every point strictly between an interior point of a convex ball and a point of that ball is interior: the corresponding convex combination contains a ball of positive radius about it. This proves uniqueness. The bounds follow from the triangle inequality. If $v_n arrow.r v$, every convergent subsequence of the bounded scalar sequence $rho \( v_n \)$ has limit $rho \( v \)$ by continuity of the norm and uniqueness of contact; hence the whole sequence converges. ◻
]

== 3 Attaining the maximal defect <sec:attainment>

For a surjective sphere isometry define

$ D_q \( x \, y \) = ∥f \( x \) - q f \( y \)∥ - ∥x - q y∥ \, #h(2em) M = sup_(x \, y in S_X \, med 0 lt.eq q lt.eq 1) \| D_q \( x \, y \) \| . quad "(1)" $ <eq:defect>

The map $f$ is bijective. If $D_q^(f^(- 1))$ denotes the inverse map’s defect, then

$ D_q^(f^(- 1)) \( f \( x \) \, f \( y \) \) = - D_q \( x \, y \) #h(2em) \( x \, y in S_X \, med 0 lt.eq q lt.eq 1 \) \, quad "(2)" $ <eq:inverse-defect>

so the inverse has the same absolute defect bound. Each $D_q$ is 2-Lipschitz as a function of $q$, uniformly in $x \, y$, and $D_0 = D_1 = 0$. Thus

$ \| D_q \( x \, y \) \| lt.eq 2 min \( q \, 1 - q \) \, #h(2em) 0 lt.eq M lt.eq 1 . quad "(3)" $ <eq:defectbound>

The attainment argument uses the standard Banach-space ultrapower construction [4]. We give the construction and verify its sphere-map and defect properties directly.

#thm([Lemma 3.1.])[
  #emph[If some surjective sphere isometry has $M > 0$, there are nonzero real Banach spaces, a surjective sphere isometry, still denoted by $f : S_X arrow.r S_Y$, and $x_0 \, y in S_X$, $0 < t < 1$, such that 
$ \| D_q \( a \, c \) \| & lt.eq M &  & \( a \, c in S_X \, med 0 lt.eq q lt.eq 1 \) \,\
∥f \( x_0 \) - t f \( y \)∥ - ∥x_0 - t y∥ & = M > 0 . quad "(4)" $ <eq:maximal>

]
] <lem:attainment>

#proof[
  Choose triples approaching the absolute supremum. Pass to a subsequence of one sign and, if necessary, replace the map by its inverse. After a further subsequence the radius parameters converge to $t in \[ 0 \, 1 \]$. The uniform Lipschitz bound allows us to replace them all by $t$, retaining convergence of the signed defects to $M$. By (3), $M \/ 2 lt.eq t lt.eq 1 - M \/ 2$.
  We describe the limit construction to justify attainment. Choose a free ultrafilter $cal(U)$ on $bb(N)$: a maximal proper filter containing all cofinite sets. It exists by the maximal principle, since a union of a chain of such filters is again a proper filter. We use the usual set-theoretic framework with choice here. For any subset, either it or its complement belongs to $cal(U)$. Every bounded real sequence has a unique limit along $cal(U)$. Indeed, in a compact interval containing the sequence, the closures of its values on sets in $cal(U)$ have the finite intersection property; their intersection is nonempty and the ultrafilter property makes it a singleton. These limits preserve sums, inequalities, and continuous real functions.
  On bounded sequences in $X$ use the seminorm
  $ ∥\( a_n \)∥_(cal(U)) = lim_(cal(U)) ∥a_n∥ . $
  Let $Q_X$ be the quotient by its kernel, with the induced norm, and define $Q_Y$ in the same way. Constant sequences embed $X \, Y$ isometrically, so these quotients are nonzero. Every unit vector in either quotient has a representative of unit vectors: normalize each nonzero term and replace zero terms by a fixed unit vector. The change has norm $\| ∥a_n∥ - 1 \|$, whose ultralimit is zero.
  Applying $f$ termwise to unit representatives defines $F : S_(Q_X) arrow.r S_(Q_Y)$. The identity
  $ lim_(cal(U)) ∥f \( a_n \) - f \( b_n \)∥ = lim_(cal(U)) ∥a_n - b_n∥ $
  proves both independence of representative and distance preservation. Applying $f^(- 1)$ termwise gives the inverse of $F$, so it is surjective. For any fixed $q in \[ 0 \, 1 \]$,
  $ ∥F \( \[ a_n \] \) - q F \( \[ b_n \] \)∥ - ∥\[ a_n \] - q \[ b_n \]∥ = lim_(cal(U)) D_q \( a_n \, b_n \) in \[ - M \, M \] . $
  Since the pair and $q$ were arbitrary, the bound holds for every pair and every radius. The chosen maximizing sequences give equality at $t$.
  Complete both quotient spaces. Their unit spheres are the metric completions of their previous spheres, by density and normalization. Extending the induced isometry and its inverse gives inverse maps by continuity and density, hence a surjective isometry of these completed spheres. Continuity preserves the defect bound and the selected equality. These spaces and this map have the asserted properties. ◻
]

It therefore suffices to rule out the attained configuration (4), which we retain throughout the next two sections.

== 4 Aligning extremal chords <sec:alignment>

For a bounded subset $H$ of a normed space, its Kuratowski measure of noncompactness [11] is

$ chi \( H \) = inf { delta > 0 : H upright(" is covered by finitely many sets of diameter at most ") delta } . $

We use the uniform strict-contraction form of Darbo’s fixed-point theorem [5], proved in Appendix 7.

#thm([Theorem 4.1.])[
  #emph[Let $C$ be a nonempty closed bounded convex subset of a Banach space. If $g : C arrow.r C$ is continuous and, for some $0 lt.eq gamma < 1$, 
$ chi \( g \( H \) \) lt.eq gamma chi \( H \) #h(2em) \( H subset C \) \, $

 then $g$ has a fixed point.]
] <thm:condensing>

#thm([Proposition 4.2.])[
  #emph[Under (4), put $b = f \( y \)$ and keep $y \, t$ fixed. There are endpoints $x \, z in S_X$, directions $v in S_X$, $w in S_Y$, and positive numbers $p \, r \, s \, u$ such that 
$ x & = t y + p v in S_X \, & z & = t y - r v in S_X \,\
f \( x \) & = t b + s w in S_Y \, & f \( z \) & = t b - u w in S_Y \, quad "(5)" $ <eq:chords>

 and 
$ s - p = r - u = M \, #h(2em) d := p + r = s + u = ∥x - z∥ lt.eq 2 . quad "(6)" $ <eq:radii>

 All four radii belong to $\[ 1 - t \, 1 + t \]$.]
] <prop:alignment>

#proof[
  Starting from a direction at $t y$, we map its sphere contact to $S_Y$ and take the opposite sphere contact on the line through $t b$. Pull this opposite endpoint back to $S_X$, and reverse its direction from $t y$. A fixed direction for this return map will align the two chords.
  For $v in S_X$, use Lemma 3 to define $p = p \( v \) > 0$ by $x \( v \) = t y + p v in S_X$. Define successively
  $ f \( x \( v \) \) = t b + s w \, #h(2em) f \( z \) = t b - u w in S_Y \, #h(2em) r = ∥z - t y∥ \, quad g \( v \) = frac(t y - z, r) \, quad "(7)" $ <eq:return>
  where $w in S_Y$ and $u > 0$ is determined by radial contact in direction $- w$. These quantities are continuous in $v$, and their positive radii lie in $\[ 1 - t \, 1 + t \]$.
  Let $E = { v in S_X : s \( v \) - p \( v \) = M }$. It is closed in $X$, since $S_X$ is closed and $s - p$ is continuous on $S_X$. It is nonempty: $v_0 = \( x_0 - t y \) \/ ∥x_0 - t y∥$ satisfies $x \( v_0 \) = x_0$ by uniqueness of radial contact, and belongs to $E$ by (4). For $v in E$, distance preservation and the global defect bound give
  $ s + u = ∥x \( v \) - z∥ lt.eq p + r \, #h(2em) r - u lt.eq M . $
  Since $s = p + M$, both inequalities are equalities. Thus
  $ r = u + M \, #h(2em) ∥p v + r g \( v \)∥ = p + r . quad "(8)" $ <eq:equality>
  In particular $v$ and $g \( v \)$ share a support. Moreover, every unit direction $l$ sharing a support with $g \( v \)$ belongs to $E$: for the fixed $z \, r \, u$ associated with $v$,
  $ p \( l \) + r = ∥x \( l \) - z∥ = ∥f \( x \( l \) \) - f \( z \)∥ lt.eq s \( l \) + u \, $
  so $s \( l \) - p \( l \) gt.eq r - u = M$. The reverse inequality is the global defect bound. In particular $g \( v \) in E$.
  #emph[An invariant convex set.] Start with $v_0 in E$. Suppose $"conv" { v_0 \, dots.h \, v_n } subset E$. Choose a strictly positive convex combination $a_n$ of these vectors, and set $v_(n + 1) = g \( a_n \)$. A common support $phi$ for $a_n \, v_(n + 1)$, extended to their finite span with the $v_i$, takes value one at each $v_i$ by strict positivity. For every $l$ in the enlarged convex hull,
  $ 1 = phi \( l \) lt.eq ∥l∥ lt.eq 1 . $
  Thus $l$ is a unit vector sharing $phi$ with $v_(n + 1) = g \( a_n \)$, and belongs to $E$ by the preceding propagation rule.
  Choose the coefficients so that the $a_n$ are dense in $C = overline("conv") { v_0 \, v_1 \, dots.h }$. Explicitly, enumerate all finite rational probability vectors on initial lists of indices, repeat each arbitrarily late, and at stage $n$ use one whose list is contained in ${ 0 \, dots.h \, n }$. Mix its zero-padded coefficients with the uniform positive vector on that list of $n + 1$ indices, using a weight $0 < lambda_n < 1$ tending to zero. This changes the prescribed combination by at most $2 lambda_n$, because every $v_i$ is unit. Each prescribed rational combination is therefore a limit of $a_n$’s. Such combinations are dense in $C$, proving the assertion. The set $C$ is nonempty, closed, bounded, convex, and contained in $E subset S_X$. Since $g \( a_n \) = v_(n + 1) in C$, continuity gives $g \( C \) subset C$. Only this constructed set is separable; the ambient spaces are unrestricted.
  #emph[A strict decrease of noncompactness.] Compare $v \, v' in E$, marking their associated variables by primes. From (7),
  $ r ∥g \( v \) - g \( v' \)∥ & lt.eq \| r - r' \| + ∥z - z'∥\
 & lt.eq \| r - r' \| + \| u - u' \| + u ∥w - w'∥ \,\
s ∥w - w'∥ & lt.eq \| s - s' \| + ∥f \( x \( v \) \) - f \( x \( v' \) \)∥\
 & lt.eq \| s - s' \| + \| p - p' \| + p ∥v - v'∥ . $
  Using $s = p + M$ and $r = u + M$ yields
  $ ∥g \( v \) - g \( v' \)∥ lt.eq frac(u p, r s) ∥v - v'∥ + frac(2 \| u - u' \|, r) + frac(2 u \| p - p' \|, r s) . quad "(9)" $ <eq:contraction>
  Set $a = 1 - t > 0$ and $U = 1 + t$. All radii lie in $\[ a \, U \]$, and $r = u + M$, $s = p + M$ give $0 < M < r \, s$. Hence
  $ frac(u p, r s) = (1 - M / r) (1 - M / s) lt.eq gamma := (1 - M / U)^2 < 1 . $
  Fix a finite cover of $H subset C$ by sets of diameter at most $delta$. For $eta > 0$, intersect its parts with $H$ and subdivide them according to finite partitions of the ranges of $p$ and $u$ into intervals of length at most $eta$. Since $r \, s gt.eq a$ and $u \/ r < 1$, the last two terms in (9) sum to at most $4 eta \/ a$ on each resulting part. The images of these parts cover $g \( H \)$ with diameters at most $gamma delta + 4 eta \/ a$. Letting $eta arrow.b 0$ for this fixed cover and then taking the infimum over diameter covers gives $chi \( g \( H \) \) lt.eq gamma chi \( H \)$.
  Theorem 5 now gives $v in C$ with $g \( v \) = v$. Set $x = x \( v \)$; this endpoint may differ from $x_0$. Substitution in (7) gives (5). Equation (8) and distance preservation give (6). ◻
]

#figure(
  [(340,148) (10,116)(1,0)270 (10,36)(1,0)270 (10,116)(190,116)(280,116) (10,36)(135,36)(280,36) (10,130)(0,0)$z$(190,130)(0,0)$t y$(280,130)(0,0)$x$ (10,20)(0,0)$f \( z \)$(135,20)(0,0)$t b$(280,20)(0,0)$f \( x \)$ (100,100)(-1,0)90(100,100)(1,0)90 (235,100)(-1,0)45(235,100)(1,0)45 (100,87)(0,0)$r$(235,87)(0,0)$p$ (72.5,52)(-1,0)62.5(72.5,52)(1,0)62.5 (207.5,52)(-1,0)72.5(207.5,52)(1,0)72.5 (72.5,65)(0,0)$u$(207.5,65)(0,0)$s$ (310,116)(0,0)$X$(310,36)(0,0)$Y$],
  caption: [Figure 1: The aligned chords of Proposition 6. Each segment is drawn along its own unit direction. The inner points are $t y$ and $t b$; the endpoints lie on the respective unit spheres. The diagram records lengths only, with $p + r = s + u$ and $r - u = s - p = M$. ],
) <fig:chords>

== 5 The chord contradiction <sec:comparison>

Fix the configuration supplied by Proposition 6, illustrated in Figure 1, and set

$ A = p / d \, #h(2em) B = u / d \, #h(2em) epsilon.alt = 1 - t . quad "(10)" $ <eq:AB>

Then $A \, B > 0$ and $A + B = 1 - M \/ d < 1$.

We first derive a secant estimate from the defect bound. If either $A$ or $B$ exceeds $epsilon.alt$, this estimate leads to a radial perturbation that increases the maximal defect. In the remaining case, convexity gives incompatible bounds for the preserved distance from $y$ to $z$.

#thm([Lemma 5.1.])[
  #emph[Put 
$ h = min {t / s \, epsilon.alt / u} \, #h(2em) theta = frac(h s, p) \, #h(2em) K = frac(∥\( r \/ u \) v + h y∥ - ∥\( p \/ s \) v + h y∥, r \/ u - p \/ s) . $

 For every support $phi$ at $v + theta y$, 
$ epsilon.alt / p lt.eq phi \( v \) lt.eq K lt.eq cases(delim: "{", 1 - B \, & B lt.eq epsilon.alt \,, B \, & B > epsilon.alt .) quad "(11)" $ <eq:K>

]
] <lem:secant>

#proof[
  At radius $t - s h$, the signed defect for $x \, y$ is
  $ Delta_x := D_(t - s h) \( x \, y \) = s #scale(x: 120%, y: 120%)[\(] ∥w + h b∥ - ∥\( p \/ s \) v + h y∥ #scale(x: 120%, y: 120%)[\)] . $
  At radius $t + u h$, the negative of the signed defect for $z \, y$ is
  $ Delta_z := - D_(t + u h) \( z \, y \) = u #scale(x: 120%, y: 120%)[\(] ∥\( r \/ u \) v + h y∥ - ∥w + h b∥ #scale(x: 120%, y: 120%)[\)] . $
  Both radii lie in $\[ 0 \, 1 \]$, so both defects are at most $M$. The choice of $h$ makes at least one radius an endpoint, where its defect is zero. The weighted sum $u Delta_x + s Delta_z$ cancels the common target norm; since $s r - u p = M d$,
  $ frac(u Delta_x + s Delta_z, d) = M K . $
  The inequality $t \/ s lt.eq epsilon.alt \/ u$ is equivalent to $B lt.eq epsilon.alt$. In that case $Delta_x = 0$ and $K lt.eq s \/ d = 1 - B$; otherwise $Delta_z = 0$ and $K lt.eq u \/ d = B$. At $B = epsilon.alt$ both defects vanish, so $K = 0$ and the stated upper bound remains valid.
  The supported vector is nonzero: if $v + theta y = 0$, then $theta = 1$ and $v = - y$, whereas $∥t y + p v∥ = 1$ forces $p = 1 + t$ and hence $theta lt.eq t \/ p < 1$.
  Since $r \/ u > p \/ s > 0$, a support at $v + theta y$, hence also at $\( p \/ s \) v + h y$, bounds the secant from below by $phi \( v \)$. It remains to prove $phi \( v \) gt.eq epsilon.alt \/ p$. Write $beta = t \/ p$, so $0 < theta lt.eq beta$. If $theta = beta$, then
  $ phi \( v \) = frac(1 - t phi \( y \), p) gt.eq epsilon.alt / p $
  because $∥p v + t y∥ = 1$. If $theta < beta$, take a support $psi$ at $v + beta y$. The two support inequalities give
  $ theta #scale(x: 120%, y: 120%)[\(] psi \( y \) - phi \( y \) #scale(x: 120%, y: 120%)[\)] lt.eq phi \( v \) - psi \( v \) lt.eq beta #scale(x: 120%, y: 120%)[\(] psi \( y \) - phi \( y \) #scale(x: 120%, y: 120%)[\)] . $
  Thus $psi \( y \) gt.eq phi \( y \)$ and $phi \( v \) gt.eq psi \( v \) gt.eq epsilon.alt \/ p$. ◻
]

#thm([Lemma 5.2.])[
  #emph[Neither $A > epsilon.alt$ nor $B > epsilon.alt$ is possible.]
] <lem:large>

#proof[
  First suppose $B > epsilon.alt$. Then $h = epsilon.alt \/ u$ and Lemma 7 gives
  $ frac(p u, d epsilon.alt) gt.eq 1 . quad "(12)" $ <eq:product>
  Let $L$ be any support at $v$, and write $j = L \( y \)$. For a support $phi$ at $v + theta y$, Lemma 7 gives
  $ B gt.eq phi \( v \) = ∥v + theta y∥ - theta phi \( y \) gt.eq 1 + theta j - theta . quad "(13)" $ <eq:strictchain>
  In fact $B > 1 + theta j - theta$. If equality held throughout (13), then $∥v + theta y∥ = L \( v + theta y \)$, so $L$ would also support at $v + theta y$. But Lemma 7 applies to every support there and would give $1 = L \( v \) lt.eq B < 1$. Therefore
  $ 1 - j > frac(1 - B, theta) = frac(p u, d epsilon.alt) gt.eq 1 . $
  Every support at $v$ is strictly negative on $y$. Applying one to $r v - t y = - z$ gives $r - t j lt.eq 1$, so $u < r < 1$. Equation (12), namely $A u gt.eq epsilon.alt$, then gives $A > epsilon.alt$.
  We record the inverse configuration explicitly. For $f^(- 1)$ use $f \( z \)$ as the first endpoint, $b$ as the base direction, and $f \( x \)$ as the opposite endpoint. The new parameters are
  $ \( p' \, s' \, r' \, u' \) = \( u \, r \, s \, p \) \, quad \( v' \, w' \, y' \, b' \) = \( - w \, - v \, b \, y \) . quad "(14)" $ <eq:inverse>
  By (2), the inverse retains the bound in (4), and its defect at $\( f \( z \) \, b \, t \)$ is $s' - p' = r - u = M$. The new configuration therefore has the same hypotheses, with $\( A' \, B' \) = \( B \, A \)$. The preceding argument thus says that $A > epsilon.alt$ implies $B > epsilon.alt$ and that every support at $- w$ is strictly negative on $b$. Equivalently, every support at $w$ is strictly positive on $b$.
  Consequently, if either strict inequality holds, both support-sign conclusions hold. For $0 < eta < t$, the defect bound at radius $t - eta$ gives
  $ ∥s w + eta b∥ - ∥p v + eta y∥ lt.eq M = s - p . quad "(15)" $ <eq:perturb>
  A support at $w$ shows $∥s w + eta b∥ > s$. Also $∥p v + eta y∥ < p$ for all sufficiently small positive $eta$. Otherwise take $eta_n arrow.b 0$ with these norms at least $p$, and supports $L_n$ at $p v + eta_n y$ on $"span" { v \, y }$. Since $L_n \( v \) lt.eq 1$,
  $ p lt.eq p L_n \( v \) + eta_n L_n \( y \) quad arrow.r.double quad L_n \( y \) gt.eq 0 . $
  A convergent subsequence in the compact dual unit ball of this finite-dimensional span has a limit $L$ with $L \( y \) gt.eq 0$. The support identities give
  $ p L \( v \) = lim_n #scale(x: 120%, y: 120%)[\(] ∥p v + eta_n y∥ - eta_n L_n \( y \) #scale(x: 120%, y: 120%)[\)] = p . $
  Thus $L$ supports $v$ and is nonnegative on $y$, a contradiction. The two strict norm inequalities contradict (15). ◻
]

#thm([Proposition 5.3.])[
  #emph[An attained positive maximum as in (4) is impossible.]
] <prop:no-defect>

#proof[
  By Lemma 8, $A \, B lt.eq epsilon.alt$. Apply Lemma 7 both to the original configuration and to (14). This gives
  $ epsilon.alt lt.eq d A \( 1 - B \) \, #h(2em) epsilon.alt lt.eq d B \( 1 - A \) . quad "(16)" $ <eq:small>
  The smaller of the two products is strictly below $1 \/ 4$: if $A lt.eq B$, then $A < 1 \/ 2$ and $A \( 1 - B \) lt.eq A \( 1 - A \) < 1 \/ 4$; interchange the letters otherwise. As $d lt.eq 2$, (16) implies $epsilon.alt < 1 \/ 2$, so $A lt.eq epsilon.alt < t$ and $1 - B gt.eq t$. Consequently,
  $ p / t < r / epsilon.alt \, #h(2em) s / t gt.eq u / epsilon.alt . quad "(17)" $ <eq:ratios>
  Consider the convex functions
  $ F \( lambda \) = ∥y + lambda v∥ \, #h(2em) G \( lambda \) = ∥b + lambda w∥ #h(2em) \( lambda gt.eq 0 \) . $
  The unit lengths of $x \, f \( x \)$ give
  $ F \( 0 \) = G \( 0 \) = 1 \, #h(2em) F \( p \/ t \) = G \( s \/ t \) = 1 \/ t > 1 . $
  By (17) and monotonicity of secant slopes,
  $ F \( r \/ epsilon.alt \) gt.eq 1 + frac(r \/ epsilon.alt, p \/ t) \( 1 \/ t - 1 \) > 1 \/ t . $
  On the other hand, $u \/ epsilon.alt in \[ 0 \, s \/ t \]$, so convexity gives $G \( u \/ epsilon.alt \) lt.eq 1 \/ t$. But sphere distance preservation gives
  $ epsilon.alt F \( r \/ epsilon.alt \) = ∥y - z∥ = ∥b - f \( z \)∥ = epsilon.alt G \( u \/ epsilon.alt \) \, $
  a contradiction. ◻
]

== 6 The linear extension <sec:extension>

#proof[
  If the defect of the original sphere map were positive, Lemma 4 and Proposition 9 would contradict one another. Thus $M = 0$. For $a = alpha x$ and $c = beta y$, where $x \, y$ are unit and $alpha gt.eq beta > 0$, put $q = beta \/ alpha$. The radial map satisfies
  $ ∥T \( a \) - T \( c \)∥ = alpha ∥f \( x \) - q f \( y \)∥ = alpha ∥x - q y∥ = ∥a - c∥ . $
  Exchanging the points handles the other ordering; distances involving zero follow from norm preservation. For $b in Y \\ { 0 }$, choose $y in S_X$ with $f \( y \) = b \/ ∥b∥$. Then $T \( ∥b∥ y \) = b$. Hence $T$ is a surjective metric isometry fixing zero.
  For completeness we prove the affine step of Mazur–Ulam [13] in the short reflection presentation of Nica [16], who explicitly credits Väisälä and Vogt [22,23]. If $F : E arrow.r F_0$ is an onto isometry of real normed spaces and $a \, c in E$, let
  $ m = \( a + c \) \/ 2 \, #h(2em) m' = \( F \( a \) + F \( c \) \) \/ 2 \, #h(2em) delta = ∥F \( m \) - m'∥ . $
  The triangle inequality gives $delta lt.eq ∥a - c∥ \/ 2$. Reflection $R \( z \) = 2 m' - z$ is an onto isometry of $F_0$. Its conjugate $H = F^(- 1) R F$ interchanges $a \, c$ and has midpoint defect
  $ ∥H \( m \) - m∥ = ∥R F \( m \) - F \( m \)∥ = 2 delta . $
  Apply the same construction repeatedly to the resulting onto self-isometries of $E$. Their midpoint defects double but obey the same bound $∥a - c∥ \/ 2$, so $delta = 0$. Thus every onto isometry preserves midpoints.
  In particular $T \( \( a + c \) \/ 2 \) = \( T \( a \) + T \( c \) \) \/ 2$. Since $T \( 0 \) = 0$, first $T \( 2 a \) = 2 T \( a \)$ and then $T \( a + c \) = T \( a \) + T \( c \)$. Rational homogeneity follows from additivity, and real homogeneity from continuity. Finally, a linear extension is determined on every nonzero vector by its norm and its unit direction, proving uniqueness. ◻
]

== 7 The fixed-point ingredients <sec:appendix>

We prove Theorem 5, including the compact convex fixed-point theorem it uses. The measure-of-noncompactness argument is the classical mechanism of Darbo [5]; the compact case is the Schauder fixed-point theorem [17], obtained below from the simplex argument using Sperner’s labeling lemma [18].

#thm([Lemma 7.1.])[
  #emph[For every bounded nonempty set $H$ in a normed space, 
$ chi \( overline(H) \) = chi \( H \) \, #h(2em) chi \( overline("conv") H \) = chi \( H \) . $

 If $C_n$ are nonempty closed bounded subsets of a Banach space with $C_(n + 1) subset C_n$ and $chi \( C_n \) arrow.r 0$, then their intersection is nonempty and compact.]
] <lem:chi>

#proof[
  Closing each member of a finite diameter cover preserves its diameter and covers the closure, proving the first identity. To prove the second, cover $H$ by finitely many nonempty subsets $H_1 \, dots.h \, H_N$ of diameter at most $delta$, and let $R$ bound the norms of their points. Each $"conv" H_i$ has diameter at most $delta$: for two convex combinations, expand their difference using products of their coefficients and apply the triangle inequality. Every point of $"conv" H$ has the form
  $ sum_(i = 1)^N lambda_i z_i \, #h(2em) z_i in "conv" H_i \, quad lambda_i gt.eq 0 \, quad sum_i lambda_i = 1 \, $
  choosing arbitrary $z_i$ when $lambda_i = 0$. Partition the coefficient simplex into finitely many sets of $ell_1$-diameter at most $eta$. For each part, take all sums admitting a representation with coefficients in that part. These sets cover $"conv" H$. Two sums in one such set differ in norm by at most $delta + R eta$, by adding and subtracting the combination with one coefficient vector and the other set of $z_i$’s. Thus $chi \( "conv" H \) lt.eq delta + R eta$. Let $eta arrow.b 0$, take the infimum in $delta$, and use the closure identity and monotonicity for the reverse inequality.
  For the intersection assertion, choose $x_n in C_n$. For each positive integer $k$, a sufficiently late $C_n$ has a finite cover of diameter less than $2^(- k)$. Successive infinite subsequences, followed by a diagonal choice, produce a Cauchy subsequence of the $x_n$ with indices tending to infinity. Its limit belongs to every $C_n$, by completeness, nesting, and closedness. Their intersection is closed and has measure of noncompactness zero. Finite covers of arbitrarily small diameter give total boundedness, so the intersection is compact. ◻
]

#thm([Lemma 7.2.])[
  #emph[Every continuous self-map of a finite-dimensional probability simplex has a fixed point.]
] <lem:simplex>

#proof[
  The zero-dimensional case is immediate. Let $P$ be a continuous self-map of the simplex $Delta_m = { a in bb(R)^(m + 1) : a_i gt.eq 0 \, med sum_i a_i = 1 }$. Subdivide it into simplices, and label each subdivision vertex $a$ by an index $i$ such that $a_i > 0$ and $a_i gt.eq P \( a \)_i$. Such an index exists: otherwise summing over the positive coordinates of $a$ would give $1 < sum_i P \( a \)_i = 1$. The label of a vertex lies among the vertices of every original face containing it.
  Here is the required combinatorial fact, including its parity proof. In a finite face-compatible triangulation of an $m$-simplex with labels $0 \, dots.h \, m$ satisfying that boundary condition, the number of small simplices carrying all labels is odd. Count incidences of small $m$-simplices with facets labeled $0 \, dots.h \, m - 1$, modulo two. Internal facets count twice. Such a boundary facet can lie only in the original face missing label $m$; by induction its number is odd, starting with the single vertex in dimension zero. A small $m$-simplex contributes one incidence if it carries all labels, two if its vertex labels include $0 \, dots.h \, m - 1$ with one of these repeated, and none otherwise. This proves the claim.
  There are finite compatible subdivisions of arbitrarily small mesh: subdivide faces first and cone their subdivisions to the barycenter. The vertices of each resulting simplex are barycenters of a nested chain of faces. If two nested faces have $k$ and $l$ vertices, $k lt.eq l$, their barycenters differ by at most $\( 1 - k \/ l \)$ times the original diameter. Thus a subdivision in dimension $m gt.eq 1$ reduces each diameter by a factor at most $m \/ \( m + 1 \)$. Repeat.
  In each subdivision choose a fully labeled small simplex. Compactness and the shrinking mesh give a subsequence whose vertices converge to one point $a$. For every coordinate $i$, the vertex with label $i$ satisfies the corresponding inequality; continuity yields $a_i gt.eq P \( a \)_i$. Summing gives equality in every coordinate, so $a = P \( a \)$. ◻
]

#thm([Lemma 7.3.])[
  #emph[Every continuous self-map $g$ of a nonempty compact convex subset $K$ of a normed space has a fixed point.]
] <lem:compactfixed>

#proof[
  For $delta > 0$, choose a finite strict $delta$-net $P_1 \, dots.h \, P_N in K$. For $x in K$ set
  $ lambda_i \( x \) = frac(max { delta - ∥P_i - g \( x \)∥ \, 0 }, sum_j max { delta - ∥P_j - g \( x \)∥ \, 0 }) . $
  The denominator is positive, and these are continuous probability weights. Map the probability simplex to itself by sending coefficients $\( a_i \)$ to $\( lambda_i \( sum_j a_j P_j \) \)$. By Lemma 11 there is a fixed coefficient vector. Its convex combination $x in K$ satisfies
  $ ∥x - g \( x \)∥ lt.eq sum_i lambda_i \( x \) ∥P_i - g \( x \)∥ < delta \, $
  since a positive weight implies the corresponding distance is less than $delta$. Letting $delta arrow.b 0$ and taking a convergent subsequence in $K$ gives a fixed point. ◻
]

#proof[
  Set $C_0 = C$ and $C_(n + 1) = overline("conv") \( g \( C_n \) \)$. These are nonempty closed bounded convex subsets of $C$ satisfying $C_(n + 1) subset C_n$. By Lemma 10,
  $ chi \( C_(n + 1) \) = chi \( g \( C_n \) \) lt.eq gamma chi \( C_n \) \, $
  so their intersection $K$ is nonempty, compact, and convex. If $x in K$, then $g \( x \) in g \( C_n \) subset C_(n + 1)$ for every $n$, so $g \( K \) subset K$. Apply Lemma 12. ◻
]

#heading(level: 1)[References]
#bibitem([1])[S.~Banach, #emph[Sur les fonctionnelles linéaires], Studia Mathematica #strong[1] (1929), 211--216. #link("https://doi.org/10.4064/sm-1-1-211-216").]
#bibitem([2])[T.~Banakh, #emph[Every 2-dimensional Banach space has the Mazur--Ulam property], Linear Algebra and its Applications #strong[632] (2022), 268--280. #link("https://doi.org/10.1016/j.laa.2021.09.020").]
#bibitem([3])[L.~Cheng and Y.~Dong, #emph[On a generalized Mazur--Ulam question: Extension of isometries between unit spheres of Banach spaces], Journal of Mathematical Analysis and Applications #strong[377] (2011), no.~2, 464--470. #link("https://doi.org/10.1016/j.jmaa.2010.11.025").]
#bibitem([4])[D.~Dacunha-Castelle, #emph[Ultraproduits d'espaces de Banach], Séminaire Goulaouic--Schwartz (1971--1972), exposé no.~9, 11 pp. #link("https://www.numdam.org/item/SEDP_1971-1972____A9_0/").]
#bibitem([5])[G.~Darbo, #emph[Punti uniti in trasformazioni a codominio non compatto], Rendiconti del Seminario Matematico della Università di Padova #strong[24] (1955), 84--92. #link("https://www.numdam.org/item/RSMUP_1955__24__84_0/").]
#bibitem([6])[G.~G.~Ding, #emph[The isometric extension problem in the unit spheres of $ell^p \( Gamma \)$ $\( p > 1 \)$ type spaces], Science in China Series A: Mathematics #strong[46] (2003), 333--338. #link("https://doi.org/10.1360/03ys9035").]
#bibitem([7])[M.~Fakhoury, #emph[Tingley's problem for Schreier spaces and their $p$-convexifications], Journal of Functional Analysis #strong[289] (2025), no.~10, 111122. #link("https://doi.org/10.1016/j.jfa.2025.111122").]
#bibitem([8])[F.~J.~Fernández-Polo and A.~M.~Peralta, #emph[On the extension of isometries between the unit spheres of von Neumann algebras], Journal of Mathematical Analysis and Applications #strong[466] (2018), no.~1, 127--143. #link("https://doi.org/10.1016/j.jmaa.2018.05.062").]
#bibitem([9])[J.~Huang and Y.~Zhu, #emph[Tingley's problem for Haagerup noncommutative $L_p$-spaces, $1 < p eq.not 2 < oo$], arXiv:2608.30131v1 (2026). #link("https://arxiv.org/abs/2608.30131v1").]
#bibitem([10])[J.~Huang and Y.~Zhu, #emph[Tingley's problem for Schatten $p$-classes, $0 < p eq.not 2 < oo$], arXiv:2607.11244v1 (2026). #link("https://arxiv.org/abs/2607.11244v1").]
#bibitem([11])[C.~Kuratowski, #emph[Sur les espaces complets], Fundamenta Mathematicae #strong[15] (1930), 301--309. #link("https://doi.org/10.4064/fm-15-1-301-309").]
#bibitem([12])[P.~Mankiewicz, #emph[On extension of isometries in normed linear spaces], Bulletin de l'Académie Polonaise des Sciences, Série des Sciences Mathématiques, Astronomiques et Physiques #strong[20] (1972), 367--371.]
#bibitem([13])[S.~Mazur and S.~Ulam, #emph[Sur les transformations isométriques d'espaces vectoriels normés], Comptes Rendus de l'Académie des Sciences, Paris #strong[194] (1932), 946--948.]
#bibitem([14])[M.~Mori, #emph[Tingley's problem through the facial structure of operator algebras], Journal of Mathematical Analysis and Applications #strong[466] (2018), no.~2, 1281--1298. #link("https://doi.org/10.1016/j.jmaa.2018.06.050").]
#bibitem([15])[M.~Mori and N.~Ozawa, #emph[Mankiewicz's theorem and the Mazur--Ulam property for $C^(*)$-algebras], Studia Mathematica #strong[250] (2020), no.~3, 265--281. #link("https://doi.org/10.4064/sm180727-14-11").]
#bibitem([16])[B.~Nica, #emph[The Mazur--Ulam theorem], Expositiones Mathematicae #strong[30] (2012), 397--398. Author version: arXiv:1306.2380v1, #link("https://arxiv.org/abs/1306.2380v1").]
#bibitem([17])[J.~Schauder, #emph[Der Fixpunktsatz in Funktionalräumen], Studia Mathematica #strong[2] (1930), 171--180. #link("https://doi.org/10.4064/sm-2-1-171-180").]
#bibitem([18])[E.~Sperner, #emph[Neuer Beweis für die Invarianz der Dimensionszahl und des Gebietes], Abhandlungen aus dem Mathematischen Seminar der Universität Hamburg #strong[6] (1928), 265--272. #link("https://doi.org/10.1007/BF02940617").]
#bibitem([19])[D.-N.~Tan, #emph[Extension of isometries on the unit sphere of $L^p$ spaces], Acta Mathematica Sinica, English Series #strong[28] (2012), 1197--1208. #link("https://doi.org/10.1007/s10114-011-0302-6").]
#bibitem([20])[R.~Tanaka, #emph[A further property of spherical isometries], Bulletin of the Australian Mathematical Society #strong[90] (2014), no.~2, 304--310. #link("https://doi.org/10.1017/S0004972714000185").]
#bibitem([21])[D.~Tingley, #emph[Isometries of the unit sphere], Geometriae Dedicata #strong[22] (1987), 371--378. #link("https://doi.org/10.1007/BF00147942").]
#bibitem([22])[J.~Väisälä, #emph[A proof of the Mazur--Ulam theorem], American Mathematical Monthly #strong[110] (2003), no.~7, 633--635. #link("https://doi.org/10.1080/00029890.2003.11920004").]
#bibitem([23])[A.~Vogt, #emph[Maps which preserve equality of distance], Studia Mathematica #strong[45] (1973), no.~1, 43--48. #link("https://doi.org/10.4064/sm-45-1-43-48").]
#bibitem([24])[R.~S.~Wang, #emph[Isometries between the unit spheres of $C_0 \( Omega \)$ type spaces], Acta Mathematica Scientia #strong[14] (1994), no.~1, 82--89. #link("https://doi.org/10.1016/S0252-9602(18)30093-6").]


