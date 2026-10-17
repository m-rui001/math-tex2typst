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

#align(center)[#text(size: 16pt, weight: "bold")[Strong Ulam Stability Characterizes Amenability]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $G$ be a countable discrete group and let $H$ be a complex Hilbert space. For a map $mu : G arrow.r cal(U) \( H \)$ with $mu \( e \) = I$, put

$ "def" \( mu \) = sup_(g \, h in G) ∥mu \( g h \) - mu \( g \) mu \( h \)∥ . $

The group is #emph[strongly Ulam stable] if, for every $epsilon > 0$, there is $delta > 0$ such that every such map with $"def" \( mu \) lt.eq delta$ is within $epsilon$, uniformly on $G$, of a unitary representation on the same space $H$. All norms are operator norms. The number $delta$ must work simultaneously for all Hilbert spaces, including infinite-dimensional ones.

A group is amenable if $ell^oo \( G \)$ admits a positive linear functional $m$ with $m \( 1 \) = 1$ and $m \( L_g f \) = m \( f \)$, where $\( L_g f \) \( x \) = f \( g^(- 1) x \)$. Our main result is the following characterization.

#thm([Theorem 1.1.])[
  #emph[A countable discrete group is strongly Ulam stable if and only if it is amenable.]
] <thm:main>

Kazhdan proved the implication from amenability to strong Ulam stability [9]; see also [3] Theorems 3.1 and 3.2. We prove the converse. More precisely, for every nonamenable countable group and every $delta > 0$, we construct a separable Hilbert space $H$ and a normalized map $mu : G arrow.r cal(U) \( H \)$ with $"def" \( mu \) < delta$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ sup_(g in G) ∥mu \( g \) - rho \( g \)∥ > 1 / 10 quad upright("for every unitary representation ") rho : G arrow.r cal(U) \( H \) . $ <eq:distance-goal>]

=== History and context <history-and-context>

The uniform stability problem asks whether an approximate homomorphism can be corrected without losing uniform control over the group. Kazhdan’s 1982 theorem supplies this correction for amenable groups; his work also gives unstable almost representations of fundamental groups of closed orientable surfaces of genus at least two [9,3]. Burger, Ozawa, and Thom proved that every group containing a nonabelian free subgroup fails strong Ulam stability [3] Theorem 1.2. They explicitly asked whether strong Ulam stability characterizes amenability [3] p. 111. Alpeev subsequently proved instability for restricted wreath products $A wreath G$ when $A$ is a nontrivial countable abelian group and $G$ is countable and nonamenable [1] Theorem B. His use of measured equivalence relations reaches examples without nonabelian free subgroups.

The inclusion of infinite-dimensional Hilbert spaces is essential. The term #emph[Ulam stability], without “strong”, commonly denotes the uniform statement restricted to finite-dimensional unitary groups [3] Definition 2.1. Nonamenable groups can satisfy that property. Glebsky, Lubotzky, Monod, and Rangarajan developed asymptotic cohomology and proved finite-dimensional stability for broad classes of higher-rank lattices [6]. Fournier-Facio and Rangarajan applied this theory to wreath products over infinite amenable groups and to Thompson groups [4] Theorems 1.2 and 1.3. These results concern a different stability property. The failure of the corresponding wreath-product statement for strong stability is explained in [4] Remark 6.1.

=== The construction <the-construction>

The proof starts with a nontrivial minimal strongly proximal action of $G$ on a compact space, supplied by Furstenberg’s boundary theory [5,8]. From this action we obtain finite choices of steps in $G$, each marked $sans(E)$ or $sans(F)$ at every possible departure point. The marks have two opposing counting properties: all but a small proportion of steps from a fixed point are $sans(E)$, whereas all but a small proportion of steps ending at a fixed point are $sans(F)$. They also satisfy a compatibility condition along paths: an $sans(E)$ step can never be followed by an $sans(F)$ step.

We use these paths to construct a Hilbert space $H$ with finitely many levels and a copy at each group element. Fix a set $cal(C)$ of at most three translated markings. For each $p in cal(C)$, a unitary circuit $W_p^(cal(C))$ exchanges selected subspaces of successive levels, using edges whose flags differ within $cal(C)$ and whose flag in $p$ is $sans(F)$. For a fixed set $cal(C)$, the comparisons $W_q^(cal(C)) \( W_p^(cal(C)) \)^(- 1)$ compose exactly. In constructing $mu$, however, each comparison uses its own pair of markings. The defect estimate therefore requires a bound on how a comparison changes when a third marking is added. After obtaining that bound, we compose pair comparisons with the usual translation representation to define $mu$.

The main analytic issue is that the two subspaces exchanged at one step have naturally identified coordinates with slightly different inner products. Summing the resulting errors over all layers would give no useful bound. We instead choose the isometry between these inner products to be almost the coordinate identity on the subspace used by the next layer. The change caused by a third marking can then be moved past that layer. After this move, the principal errors act on mutually orthogonal levels, so their norms combine by a maximum rather than a sum. Lemma 5 isolates the isometry construction, and Proposition 7 gives the resulting circuit estimate. Both estimates are independent of the dimensions of the finite coordinate spaces.

The obstruction to a genuine representation is a quadratic form. We use two orthonormal bases with opposite signs and a family of anticommuting involutions. The signed basis sums force the form to vanish on vectors obtained from any genuine representation. The initial inner product of our construction makes the same form equal to $1 \/ 2$. Most of the labelled paths transport the final vectors back to these initial vectors, producing the fixed distance bound (1.1).

Section 2 constructs the marks. Section 3 proves the finite-dimensional estimates and the metric-transfer lemmas. Sections 4 and 5 construct the circuits and control their dependence on the markings. Section 6 proves the quadratic-form obstruction and chooses the parameters.

=== Conventions <conventions>

Inner products are conjugate-linear in the first argument. On a coordinate space with a positive matrix $A$, the notation $\( V \, A \)$ means the inner product $⟨u \, v⟩_A = u^(*) A v$. Unless a metric is indicated, a matrix norm is Euclidean. Metrics between $1 / 2 I$ and $2 I$ make these norms uniformly equivalent. A numerical constant $C$ may increase from one occurrence to the next; it never depends on the group, the number of labels, or the number of levels. We write an explicit factor $N$ whenever an estimate sums over $N$ levels.

== 2 Flags from a boundary action <sec:flags>

We first convert nonamenability into finite families of labelled steps in $G$. Each step will carry a flag $sans(E)$ or $sans(F)$. The construction makes $sans(F)$ rare when a departure is fixed and $sans(E)$ rare when an arrival is fixed. At the same time, an $sans(E)$ step prevents every outgoing step at the next stage from having flag $sans(F)$. This last property will allow common parts of two circuits to cancel exactly.

A compact $G$-space is a #emph[boundary] if its action is minimal and strongly proximal: every orbit is dense, and the weak-star closure of the orbit of every Radon probability measure contains a point mass. We use the standard boundary characterization of amenability: a nonamenable discrete group admits a non-singleton compact Hausdorff boundary [5]; see also [8] Section 3. Fix such a boundary $K$. Minimality implies that the orbit closure of any probability contains #emph[every] point mass once it contains one.

The space $K$ has no isolated points. Indeed, if it had an isolated point, minimality would imply that all its points are isolated, so compactness would make $K$ finite. The uniform probability on $K$ is invariant, contradicting strong proximality unless $K$ is a singleton. Consequently, every nonempty open subset of $K$ contains arbitrarily many pairwise disjoint nonempty open subsets.

The following consequence of strong proximality provides the finite lists used at each stage. The requirement at the distinguished point $zeta$ is what makes the stages compatible.

#thm([Lemma 2.1.])[
  (Uniform lists with a prescribed point).  #emph[Let $K$ be a compact Hausdorff boundary, let $U subset.eq K$ be nonempty and open, let $zeta in K$, and let $0 < beta < 1$. There is a finite nonempty list $s_1 \, dots.h \, s_M in G$, with repetitions allowed, such that 
$ s_j^(- 1) zeta in U quad \( 1 lt.eq j lt.eq M \) \, #h(2em) 1 / M \# { j : s_j^(- 1) t in.not U } < beta quad \( t in K \) . $

 Moreover, some open neighborhood $O$ of $zeta$ satisfies $s_j^(- 1) O subset.eq U$ for every $j$.]
] <lem:uniform-list>

#proof[
  Choose $t_0 in U$ and a continuous function $f : K arrow.r \[ 0 \, 1 \]$ with $f \( t_0 \) = 1$ and support contained in $U$. Consider the family
  $ cal(A) = { f compose s^(- 1) : s in G \, med s^(- 1) zeta in U } subset C \( K \, bb(R) \) . $
  For every Radon probability $m$ on $K$, there is $a in cal(A)$ with
  #[#set math.equation(numbering: n => "(2.1)")
   $ integral_K a thin d m > 1 - beta / 2 . $ <eq:boundary-integral>]
  To see this, apply strong proximality and minimality to $nu = \( m + delta_zeta \) \/ 2$. Since $delta_(t_0)$ belongs to the orbit closure of $nu$, some $s in G$ satisfies
  $ 1 / 2 (integral_K f \( s^(- 1) t \) thin d m \( t \) + f \( s^(- 1) zeta \)) > 1 - beta / 4 . $
  Both terms in parentheses are at most one, so each exceeds $1 - beta \/ 2$. In particular, $s^(- 1) zeta in U$, which proves (2.1).
  We claim that the convex hull of $cal(A)$ contains a function strictly larger than $1 - beta$ everywhere. Otherwise, separate that convex hull from the nonempty open convex set
  $ cal(O) = { q in C \( K \, bb(R) \) : q \( t \) > 1 - beta upright(" for all ") t in K } $
  by the Hahn–Banach theorem. There is a nonzero continuous real linear functional $Lambda$ such that
  $ sup_(a in cal(A)) Lambda \( a \) lt.eq inf_(q in cal(O)) Lambda \( q \) . $
  This functional is positive. Indeed, if $u gt.eq 0$ and $q in cal(O)$, then $q + t u in cal(O)$ for every $t gt.eq 0$; the displayed separation would be impossible if $Lambda \( u \) < 0$. A nonzero positive functional satisfies $Lambda \( 1 \) > 0$, so we may normalize it to have $Lambda \( 1 \) = 1$. The Riesz representation theorem then identifies $Lambda$ with integration against a Radon probability $m$. Applying the separation inequality to the constant functions $q = 1 - beta + epsilon$ and letting $epsilon arrow.b 0$ gives
  $ sup_(a in cal(A)) integral_K a thin d m lt.eq 1 - beta \, $
  contradicting (2.1).
  Thus a finite convex combination of functions from $cal(A)$ exceeds $1 - beta$ on $K$. Compactness gives a strictly positive uniform margin. Approximate its coefficients by nonnegative rational coefficients summing to one, closely enough to preserve that margin. Clearing denominators produces a list with
  $ 1 / M sum_(j = 1)^M f \( s_j^(- 1) t \) > 1 - beta #h(2em) \( t in K \) . $
  Because $f$ vanishes outside $U$ and takes values in $\[ 0 \, 1 \]$, this is the required counting inequality. Finally, $O = ⋂_(j = 1)^M s_j U$ is an open neighborhood of $zeta$ and has the asserted image property. ◻
]

We now arrange these lists into stages. The two labels at stage $k$ will be denoted by $x in cal(X)_k$ and $y in cal(Y)_(k - 1)$; the corresponding step is $w mapsto w s_k \( x \, y \)$.

#thm([Proposition 2.2.])[
  (Compatible sparse flags).  #emph[Let $G$ be a nonamenable discrete group. For every integer $N gt.eq 1$ and every $0 < beta < 1$, there are finite nonempty sets $cal(X)_1 \, dots.h \, cal(X)_N$ and $cal(Y)_0 \, dots.h \, cal(Y)_(N - 1)$, maps 
$ s_k : cal(X)_k times cal(Y)_(k - 1) arrow.r G \, #h(2em) b_k : G times cal(X)_k times cal(Y)_(k - 1) arrow.r { sans(E) \, sans(F) } \, $

 with the following properties.]
  + #emph[If $k < N$ and $b_k \( w \; x \, y \) = sans(E)$, then, with $v = w s_k \( x \, y \)$, 
$ b_(k + 1) \( v \; x' \, y' \) = sans(E) quad upright("for every ") \( x' \, y' \) in cal(X)_(k + 1) times cal(Y)_k . $

]
  + #emph[For every $k \, w \, x$, 
$ frac(\# { y in cal(Y)_(k - 1) : b_k \( w \; x \, y \) = sans(F) }, \| cal(Y)_(k - 1) \|) lt.eq beta . $

]
  + #emph[For every $k \, v \, y$, 
$ frac(\# { x in cal(X)_k : b_k \( v s_k \( x \, y \)^(- 1) \; x \, y \) = sans(E) }, \| cal(X)_k \|) lt.eq beta . $

]
  #emph[Each alphabet may subsequently be replaced by any positive integer number of copies, independently of the others, while preserving these properties. In particular, its cardinality can be made arbitrarily large and divisible by any prescribed positive integer.]
] <prop:flags>

#proof[
  Fix points $xi \, zeta in K$ and choose an integer $C > 1 \/ beta$. We construct nonempty open sets $U_0 \, dots.h \, U_N$ and the stage maps backwards, starting with $U_N = K$.
  Suppose that $U_k$ is already chosen. Inside it choose pairwise disjoint nonempty open sets $U_(k \, 1) \, dots.h \, U_(k \, C)$, and set $cal(X)_k = { 1 \, dots.h \, C }$. For each $c in cal(X)_k$, apply Lemma 2 to $U_(k \, c)$ and the point $zeta$. Repeat the resulting lists to give them a common length $M_k$, and index each list by the same set $cal(Y)_(k - 1) = { 1 \, dots.h \, M_k }$. Write its entries as $s_k \( c \, y \)$. Set
  $ U_(k - 1) = ⋂_(c in cal(X)_k) med ⋂_(y in cal(Y)_(k - 1)) s_k \( c \, y \) U_(k \, c) . $
  This is an open neighborhood of $zeta$, and it satisfies
  #[#set math.equation(numbering: n => "(2.2)")
   $ s_k \( c \, y \)^(- 1) U_(k - 1) subset.eq U_(k \, c) subset.eq U_k #h(2em) \( c \, y \) . $ <eq:backward-regions>]
  This completes the backward construction.
  For a step $w mapsto v = w s_k \( c \, y \)$, define
  #[#set math.equation(numbering: n => "(2.3)")
   $ b_k \( w \; c \, y \) = sans(E) quad arrow.l.r.double quad v^(- 1) xi in U_(k \, c) \, $ <eq:boundary-flags>]
  and otherwise give it flag $sans(F)$. If this step has flag $sans(E)$, then $v^(- 1) xi in U_k$. For every next-stage label $\( c' \, y' \)$, equation (2.2) at stage $k + 1$ gives
  $ \( v s_(k + 1) \( c' \, y' \) \)^(- 1) xi = s_(k + 1) \( c' \, y' \)^(- 1) v^(- 1) xi in U_(k + 1 \, c') . $
  This proves (F1).
  For fixed $w \, c$, apply the counting conclusion of Lemma 2 at the boundary point $w^(- 1) xi$. The condition for flag $sans(E)$ is precisely $s_k \( c \, y \)^(- 1) w^(- 1) xi in U_(k \, c)$, so fewer than a $beta$ fraction of $y$ have flag $sans(F)$. This proves (F2). For fixed $v \, y$, the unique departure of the step with first label $c$ and arrival $v$ is $v s_k \( c \, y \)^(- 1)$. Its flag is $sans(E)$ exactly when $v^(- 1) xi in U_(k \, c)$. The color sets are disjoint, so at most one of the $C$ labels has this property. Since $1 \/ C < beta$, this proves (F3).
  Finally, replace any alphabet by its product with a finite nonempty set and pull back the maps $s_k$ and flags $b_k$ under the coordinate projections. All counting proportions remain unchanged, and (F1) remains exact. This proves the assertion about cardinalities. ◻
]

For $g in G$, define the translated flags $p = g b$ by

$ p_k \( w \; x \, y \) = b_k \( g^(- 1) w \; x \, y \) . $

A #emph[configuration] will mean such a translate. Every configuration satisfies (F1)–(F3), since left translation carries $w mapsto w s_k \( x \, y \)$ to a step with the same labels. In particular, along any path through the successive stages, the $sans(F)$ steps form an initial segment: after its first $sans(E)$ step, every remaining step has flag $sans(E)$.

== 3 Frames and metric transfers <sec:linear>

We need two kinds of linear algebra with estimates independent of dimension. First, a union of two orthonormal bases will be almost orthonormal on every sufficiently small set of labels; the same construction supplies symmetric involutions with small sparse restrictions. Second, when two inner products differ slightly, we will choose an isometry that changes a prescribed subspace by much less than it changes the whole space. This second choice will prevent errors from adding over all the levels of the construction.

All matrices in the first lemma are real; we use their complexifications when forming Hilbert spaces. For a finite set $E$, write $P_S$ for the coordinate projection associated with a subset $S subset.eq E$.

#thm([Lemma 3.1.])[
  (Sparse restrictions).  #emph[For every $0 < eta < 1 \/ 4$ there is $0 < beta_0 < 1 \/ 16$ with the following property. If $0 < beta lt.eq beta_0$, then for every sufficiently large integer $m$ there are unit vectors $\( a_x \)_(x in X)$ in $bb(R)^m$, where $\| X \| = 2 m$, and signs $f \( x \) in { 1 \, - 1 }$ such that:]
  + #emph[the vectors with either sign form an orthonormal basis, and hence 
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(x in X) f \( x \) a_x a_x^(*) = 0 \; $ <eq:frame-cancellation>]

]
  + #emph[if $S subset.eq X$ and $\| S \| lt.eq 4 beta \| X \|$, the synthesis map $F_S : ell^2 \( S \) arrow.r bb(C)^m$, $F_S e_x = a_x$, satisfies 
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥F_S^(*) F_S - I∥ lt.eq eta . $ <eq:sparse-gram>]

]
  #emph[Moreover, for every sufficiently large integer $n$ there is a real orthogonal $n times n$ matrix $O$ such that, on a set $Y$ of size $2 n$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ J = mat(delim: "(", 0, O; O^(*), 0) \, #h(2em) Z = mat(delim: "(", I, 0; 0, - I) $ <eq:JZ>]

 satisfy 
#[#set math.equation(numbering: n => "(3.4)")
 $ ∥P_S J P_T∥ lt.eq eta quad upright("whenever") quad \| S \| \, \| T \| lt.eq 4 beta \| Y \| . $ <eq:sparse-J>]

 In particular, $J^(*) = J$, $J^2 = Z^2 = I$, $J Z = - Z J$, and every diagonal entry of $J$ is zero.]
] <lem:sparse>

#proof[
  We give the elementary probabilistic argument, a standard use of concentration for Haar orthogonal matrices; compare [10] Section IV-B. Let $O$ be Haar distributed on the orthogonal group of $bb(R)^m$. For fixed real unit vectors $u \, v$, the random variable $u^(*) O v$ has the distribution of the first coordinate of a uniform point on the unit sphere. Represent that point as $\( g_1 \, dots.h \, g_m \) \/ \( sum_j g_j^2 \)^(1 \/ 2)$, where the $g_j$ are independent standard Gaussians. Conditioning on $sum_(j = 2)^m g_j^2$ and using the Gaussian tail bound gives, for $0 < t < 1$,
  $ bb(P) { \| u^(*) O v \| > t } & lt.eq 2 thin bb(E) exp (- frac(t^2, 2 \( 1 - t^2 \)) sum_(j = 2)^m g_j^2)\
 & = 2 \( 1 - t^2 \)^(\( m - 1 \) \/ 2) lt.eq 2 exp #scale(x: 120%, y: 120%)[\(] - \( m - 1 \) t^2 \/ 2 #scale(x: 120%, y: 120%)[\)] . $
  Put $q = 8 beta < 1 \/ 2$. For any nonempty coordinate sets $S \, T$ of size at most $q m$, take $1 \/ 4$-nets in their real unit spheres, with at most $9^(\| S \|)$ and $9^(\| T \|)$ points. A bilinear form whose absolute value is at most $eta \/ 2$ on these nets has operator norm at most $eta$. Indeed, approximating each of a maximizing pair of unit vectors changes the form by at most half its operator norm. The number of subsets of ${ 1 \, dots.h \, m }$ of size at most $q m$ is at most $exp \( m H \( q \) \)$, where
  $ H \( q \) = - q log q - \( 1 - q \) log \( 1 - q \) . $
  Thus the probability that some such submatrix $P_S O P_T$ has norm larger than $eta$ is at most
  $ 2 exp (2 m H \( q \) + 2 q m log 9 - frac(m eta^2, 16)) #h(2em) \( m gt.eq 2 \) . $
  Choose $beta_0$ so small that, for $q = 8 beta_0$, $2 H \( q \) + 2 q log 9 < eta^2 \/ 32$. The displayed probability is then less than one for all sufficiently large $m$. Hence there is an orthogonal matrix all of whose submatrices with at most $q m$ rows and columns have norm at most $eta$. Real and complex operator norms agree for these real matrices.
  Take the two bases to be the standard basis and the columns of this matrix, with signs $+ 1$ and $- 1$. For a subset of their union, its Gram matrix minus the identity has block form
  $ mat(delim: "(", 0, O_(S \, T); O_(S \, T)^(*), 0) . $
  Its norm is $∥O_(S \, T)∥$, proving (3.2). Applying the same construction in dimension $n$ gives (3.3). Each restriction in (3.4) has two off-diagonal blocks of the preceding type; they have orthogonal domains and orthogonal ranges, so its norm is the larger of their norms. ◻
]

We will use the following consequence of (3.2). For every allowed subset $S$, symmetric orthonormalization gives the column isometry

#[#set math.equation(numbering: n => "(3.5)")
 $ tilde(F)_S = F_S \( F_S^(*) F_S \)^(- 1 \/ 2) \, #h(2em) ∥tilde(F)_S - F_S∥ lt.eq C eta . $ <eq:symmetric-orthonormalization>]

This follows by applying the scalar bound $\| t^(- 1 \/ 2) - 1 \| lt.eq C \| t - 1 \|$ on $\[ 3 \/ 4 \, 5 \/ 4 \]$ to $F_S^(*) F_S$. If $S subset.eq T$ and both subsets are allowed, then $tilde(F)_S$ and the restriction of $tilde(F)_T$ to $ell^2 \( S \)$ differ by at most $2 C eta$: both are within $C eta$ of $F_S$. All these bounds hold for every subset simultaneously.

We next compare two inner products on the same vector space. A positive operator $B$ defines $chevron.l x \, y chevron.r_B = chevron.l x \, B y chevron.r$; the corresponding operator norm is denoted by $∥dot.op∥_B$. The next lemma singles out a subspace $R$ that the change of coordinates must preserve. Preservation here means that the map takes $R$ onto $R$; it need not preserve the original orthogonal complement of $R$.

#thm([Lemma 3.2.])[
  (Transfer with a prescribed subspace).  #emph[Let $A \, B$ be positive operators on a Hilbert space $E$ such that 
$ 1 / 2 I lt.eq A \, B lt.eq 2 I \, #h(2em) A - B = h Gamma \, #h(2em) Gamma^(*) = Gamma \, #h(2em) ∥Gamma∥ lt.eq 1 \, #h(2em) 0 lt.eq h lt.eq 1 / 8 . $

 Let $P$ be an orthogonal projection commuting with $B$, set $R = P E$, and assume $∥P Gamma P∥ lt.eq eta$, where $0 lt.eq eta lt.eq 1$. There is a specified invertible operator $S_R$ such that 
#[#set math.equation(numbering: n => "(3.6)")
 $ S_R^(*) A S_R = B \, #h(2em) S_R \( R \) = R \, #h(2em) ∥S_R - I∥ lt.eq C h \, #h(2em) ∥\( S_R - I \) P∥ lt.eq C h eta . $ <eq:priority-estimates>]

 The constant $C$ is absolute, and the estimates also hold in the $B$-norm after changing $C$.]
  #emph[If $R subset.eq R'$ and both projections satisfy these hypotheses, then 
#[#set math.equation(numbering: n => "(3.7)")
 $ K = S_(R')^(- 1) S_R quad upright("satisfies") quad K^(*) B K = B \, #h(2em) ∥K - I∥_B lt.eq C h \, #h(2em) ∥\( K - I \) P∥_B lt.eq C h eta . $ <eq:nested-transfer>]

 The construction commutes with orthogonal direct sums and with every orthogonal projection commuting with $A$, $B$, and $P$.]
] <lem:priority>

#proof[
  First make the $B$ inner product Euclidean. Define
  $ hat(A) = B^(- 1 \/ 2) A B^(- 1 \/ 2) = I + h B^(- 1 \/ 2) Gamma B^(- 1 \/ 2) . $
  Since $P$ commutes with $B$, this change of coordinates preserves $E = R xor R^perp$. Relative to this decomposition write
  $ hat(A) = mat(delim: "(", a, b; b^(*), d) \, #h(2em) E_0 = d - b^(*) a^(- 1) b . $
  The assumptions imply
  $ ∥hat(A) - I∥ lt.eq 2 h \, #h(2em) ∥a - I_R∥ lt.eq 2 h eta . $
  In particular, $a$ and the Schur complement $E_0$ are positive and invertible. Define
  #[#set math.equation(numbering: n => "(3.8)")
   $ Q_R = mat(delim: "(", a^(- 1 \/ 2), - a^(- 1) b E_0^(- 1 \/ 2); 0, E_0^(- 1 \/ 2)) \, #h(2em) S_R = B^(- 1 \/ 2) Q_R B^(1 \/ 2) . $ <eq:priority-map>]
  The same formula applies when either summand is zero, with the empty blocks omitted. Multiplication gives $Q_R^(*) hat(A) Q_R = I$, and hence $S_R^(*) A S_R = B$. Its first block column also shows that $S_R \( R \) = R$.
  For completeness, the bounds are uniform even when $E$ is infinite dimensional. We have $a gt.eq \( 1 - 2 h \) I_R$ and $∥b∥ lt.eq 2 h$. Moreover,
  $ E_0 gt.eq \( 1 - 2 h \) I_(R^perp) \, #h(2em) ∥E_0 - I_(R^perp)∥ lt.eq 2 h + frac(4 h^2, 1 - 2 h) . $
  The lower bound follows by minimizing $chevron.l \( x \, y \) \, hat(A) \( x \, y \) chevron.r$ over $x in R$ for fixed $y$. Functional calculus in these fixed spectral intervals now gives
  $ ∥Q_R - I∥ lt.eq C h \, #h(2em) ∥\( Q_R - I \) P∥ = ∥a^(- 1 \/ 2) - I_R∥ lt.eq C h eta . $
  Conjugation by $B^(1 \/ 2)$ changes the bounds by at most a factor of two, which proves (3.6).
  For nested subspaces, both $S_R$ and $S_(R')$ are isometries from the $B$ inner product to the $A$ inner product. Thus $K$ is $B$-unitary. Also
  $ K - I = S_(R')^(- 1) \( S_R - S_(R') \) . $
  The two terms $S_R - I$ and $S_(R') - I$ are $O \( h \)$ on $E$ and $O \( h eta \)$ on $R$, since $R subset.eq R'$. The inverse $S_(R')^(- 1)$ has uniformly bounded norm, proving (3.7). Finally, every operation in (3.8) respects the stated common reducing subspaces. ◻
]

There is also a choice of isometry from the $B$ inner product to the $A$ inner product that does not depend on $R$:

#[#set math.equation(numbering: n => "(3.9)")
 $ C_(A \, B) = A^(- 1 \/ 2) B^(1 \/ 2) \, #h(2em) C_(A \, B)^(*) A C_(A \, B) = B . $ <eq:fixed-transfer>]

It respects every common reducing subspace of $A$ and $B$. We will use this fixed map for one direction of a unitary exchange, and $S_R^(- 1)$ for the other direction. A unitary exchange between two orthogonal subspaces need not be an involution.

The last lemma converts an approximately fixed subspace into an exactly fixed one. Its dimension-free estimate also permits orthogonal sums over all group locations.

#thm([Lemma 3.3.])[
  (Fixing a subspace exactly).  #emph[Let $U$ be a unitary on a Hilbert space $E$, and let $P$ be an orthogonal projection. Suppose 
$ ∥U - I∥ lt.eq t < 1 / 2 \, #h(2em) ∥\( U - I \) P∥ lt.eq e lt.eq 1 / 2 . $

 There is a unitary $hat(U)$ that is the identity on $P E$ and leaves $\( I - P \) E$ invariant, with 
$ ∥hat(U) - U∥ lt.eq 3 e \, #h(2em) ∥hat(U) - I∥ lt.eq t + 3 e . $

 The statement holds in arbitrary Hilbert space dimension.]
] <lem:truncate>

#proof[
  Relative to $E = P E xor \( I - P \) E$, write
  $ U = mat(delim: "(", a, b; c, d) . $
  Since $\( U^(*) - I \) P = - U^(*) \( U - I \) P$, both $\( U - I \) P$ and $P \( U - I \)$ have norm at most $e$. In particular, $∥b∥ \, ∥c∥ lt.eq e$, and
  $ ∥U - mat(delim: "(", I, 0; 0, d)∥ lt.eq 2 e . $
  The compression $d$ satisfies $∥d - I∥ lt.eq t < 1$, so it is invertible even in infinite dimension. Its polar factor $v = d \( d^(*) d \)^(- 1 \/ 2)$ is therefore unitary. Unitarity of $U$ gives $d^(*) d = I - b^(*) b$, whence
  $ ∥v - d∥ = ∥I - \( d^(*) d \)^(1 \/ 2)∥ lt.eq 1 - sqrt(1 - e^2) lt.eq e^2 . $
  Taking $hat(U) = I xor v$ proves $∥hat(U) - U∥ lt.eq 2 e + e^2 lt.eq 3 e$. The remaining estimate follows by the triangle inequality. ◻
]

Lemma 6 also applies to the $B$ inner product in Lemma 5: a projection commuting with $B$ remains orthogonal for that inner product.

== 4 Hilbert spaces and unitary circuits <sec:construction>

We now turn the flags of Proposition 3 into unitary circuits. The circuits will move vectors between levels while replacing one orthonormal coordinate factor at a time by a redundant frame. The inner products are chosen so that these replacements accumulate a detectable change between the first and last levels.

=== 4.1 Labels and inner products <labels-and-inner-products>

Fix an integer $L$, put $N = L + 1$, and set

#[#set math.equation(numbering: n => "(4.1)")
 $ h = frac(1, 2 sqrt(L)) . $ <eq:h>]

We take $L$ larger than the numerical lower bounds required below. In particular, $h lt.eq 1 \/ 8$ as in Lemma 5. Let $eta > 0$ be small and choose $beta > 0$ as in Lemma 4. Proposition 3 supplies the alphabets and flags for $N$ stages. By repeating labels, we may arrange that all alphabets have sufficiently large even cardinality for Lemma 4 to apply. Repetition preserves the three flag properties.

Write $lr(|cal(X)_k|) = 2 m_k$. For $x in cal(X)_k$, let $a_(k \, x) in bb(R)^(m_k)$ be the union of two orthonormal bases, and write $f_k \( x \) = 1$ or $- 1$ according to its basis. In particular,

#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(x in cal(X)_k) f_k \( x \) a_(k \, x) a_(k \, x)^(*) = 0 . $ <eq:signed-frame>]

For $1 lt.eq d lt.eq L$, let $J_d$ and $Z_d$ be the matrices supplied by Lemma 4 on $bb(R)^(cal(Y)_d)$. Thus $J_d$ is a symmetric involution, has zero diagonal, and anticommutes with the diagonal parity matrix $Z_d$. All coordinate spaces will be complexified.

The set of full labels is

$ cal(I) = product_(k = 1)^N cal(X)_k times product_(d = 0)^L cal(Y)_d . $

Coordinates of $i in cal(I)$ are written $x_k \( i \) \, y_d \( i \)$. On the formal orthonormal label space $bb(C)^(cal(I))$ define

#[#set math.equation(numbering: n => "(4.3)")
 $ gamma_d = f_d \( X_d \) Z_1 dots.h.c Z_(d - 1) J_d \, #h(2em) D = 1 / sqrt(L) sum_(d = 1)^L gamma_d . $ <eq:clifford>]

This uses the Jordan–Wigner parity-string construction [7]; see also [2] Section 6. We check the anticommutation relations directly. Here $f_d \( X_d \)$ denotes the diagonal operator on the $cal(X)_d$ factor, and each $Z_j \, J_j$ acts on its indicated $cal(Y)_j$ factor; omitted factors carry the identity. If $d < e$, the factors $J_d$ and $Z_d$ cause $gamma_d gamma_e = - gamma_e gamma_d$, while all other relevant factors commute. Hence

#[#set math.equation(numbering: n => "(4.4)")
 $ gamma_d^(*) = gamma_d \, #h(2em) gamma_d^2 = I \, #h(2em) D^(*) = D \, #h(2em) D^2 = I \, #h(2em) "Tr" D = 0 . $ <eq:D-identities>]

The last identity follows from the zero diagonal of every $J_d$.

For $0 lt.eq k lt.eq N$, let the coordinate space at level $k$ be

$ E_k = ⨂_(j lt.eq k) bb(C)^(m_j) ⊗ ⨂_(j > k) bb(C)^(cal(X)_j) ⊗ ⨂_(d = 0)^L bb(C)^(cal(Y)_d) . $

On $E_k$ the expression for $gamma_d$ still makes sense whenever $d > k$: its $cal(X)_d$ coordinate has not been replaced by a frame. Set

#[#set math.equation(numbering: n => "(4.5)")
 $ G_k = I + h sum_(k < d lt.eq L) gamma_d . $ <eq:level-metric>]

Anticommutation gives

#[#set math.equation(numbering: n => "(4.6)")
 $ 1 / 2 I lt.eq G_k lt.eq 3 / 2 I \, #h(2em) G_0 = I + 1 / 2 D \, #h(2em) G_L = G_N = I . $ <eq:metric-bound>]

The label vector $v_i^(\( k \)) in E_k$ uses $a_(j \, x_j \( i \))$ in factors $j lt.eq k$, the standard vector $e_(x_j \( i \))$ in factors $j > k$, and $e_(y_d \( i \))$ in every $cal(Y)_d$ factor. Its $G_k$-norm is one: every added term in (4.5) has zero diagonal in some $cal(Y)_d$ factor.

We will repeatedly use two features of $G_k$. It is the identity on the compressed factors $bb(C)^(m_j)$, $j lt.eq k$. It commutes with each coordinate projection in $cal(X)_j$ for $j > k$ and in $cal(Y)_d$ for $d lt.eq k$. For the latter assertion, a term surviving in (4.5) contains only diagonal parity operators on those $cal(Y)_d$ factors.

Take the Hilbert direct sum

#[#set math.equation(numbering: n => "(4.7)")
 $ H = xor.big_(k = 0)^N med xor.big_(w in G) \( E_k \, G_k \) \, #h(2em) H_k = xor.big_(w in G) \( E_k \, G_k \) . $ <eq:big-space>]

It is separable. Left translation of the location $w$ defines a genuine unitary representation $U : G arrow.r cal(U) \( H \)$. No translation changes a label or a level.

=== 4.2 The subspaces exchanged by one layer <the-subspaces-exchanged-by-one-layer>

Fix a nonempty set $cal(C)$ of at most three configurations, and $p in cal(C)$. The use of sets allows repeated translates to be removed without changing any definition. A stage-$k$ edge is a quadruple $\( w \, k \, x \, y \)$, with arrival $v = w s_k \( x \, y \)$. It is #emph[switchable for $cal(C)$] if its flags are not the same in all configurations of $cal(C)$. The layer for $p$ will exchange exactly the switchable edges flagged $sans(F)$ in $p$. We first choose their endpoint subspaces simultaneously for all $p in cal(C)$.

At a fixed arrival $v$ and fixed $y in cal(Y)_(k - 1)$, put

#[#set math.equation(numbering: n => "(4.8)")
 $ S_(k \, v \, y)^(cal(C)) = { x in cal(X)_k : med \( v s_k \( x \, y \)^(- 1) \, k \, x \, y \) upright(" is switchable for ") cal(C) } . $ <eq:switchable-set>]

Every switchable edge is flagged $sans(E)$ in some configuration. By the arrival bound (F3),

#[#set math.equation(numbering: n => "(4.9)")
 $ lr(|S_(k \, v \, y)^(cal(C))|) lt.eq lr(|cal(C)|) beta lr(|cal(X)_k|) . $ <eq:switchable-size>]

Let $F_S : bb(C)^S arrow.r bb(C)^(m_k)$ have columns $a_(k \, x)$, $x in S = S_(k \, v \, y)^(cal(C))$. Replace these columns by

#[#set math.equation(numbering: n => "(4.10)")
 $ tilde(F)_S = F_S \( F_S^(*) F_S \)^(- 1 \/ 2) \, #h(2em) tilde(a)_(k \, v \, y \, x)^(cal(C)) = tilde(F)_S e_x . $ <eq:adjusted-frame>]

The sparse Gram estimate makes this well-defined and gives

#[#set math.equation(numbering: n => "(4.11)")
 $ tilde(F)_S^(*) tilde(F)_S = I \, #h(2em) ∥tilde(F)_S - F_S∥ lt.eq C eta . $ <eq:frame-adjustment>]

For $S = diameter$ there are no columns to adjust.

The left subspace of a switchable edge is the coordinate sector at $\( k - 1 \, w \)$ with $X_k = x$ and $Y_(k - 1) = y$. Its right subspace, at $\( k \, v \)$, has $Y_(k - 1) = y$ and $X_k$ in the line spanned by $tilde(a)_(k \, v \, y \, x)^(cal(C))$. Every other tensor factor is unrestricted. For distinct edges these left subspaces are orthogonal; so are these right subspaces. On the right this uses (4.10) and the fact that $G_k$ is the identity on the compressed $X_k$ factor.

Both endpoint subspaces have the same residual coordinates after removing the fixed $X_k$ and $Y_(k - 1)$ factors. Their metrics, denoted $A_(x \, y)$ on the left and $B_y$ on the right, are the corresponding restrictions of $G_(k - 1)$ and $G_k$. For $k lt.eq L$,

#[#set math.equation(numbering: n => "(4.12)")
 $ A_(x \, y) = B_y + h Gamma_(x \, y) \, #h(2em) Gamma_(x \, y) = f_k \( x \) Z_1 dots.h.c Z_(k - 1) J_k \|_(Y_(k - 1) = y) \, #h(2em) ∥Gamma_(x \, y)∥ = 1 . $ <eq:edge-metrics>]

The right metric $B_y$ is independent of $x$. Earlier compressed $X$ factors carry identity operators throughout. At $k = N$ both metrics are identity.

=== 4.3 Metric transfer with priority for the next layer <metric-transfer-with-priority-for-the-next-layer>

For $k lt.eq L$, arrival $v$, and next coordinate $z in cal(X)_(k + 1)$, define

#[#set math.equation(numbering: n => "(4.13)")
 $ R_(k \, v \, z)^(cal(C)) = { t in cal(Y)_k : med q_(k + 1) \( v \; z \, t \) = sans(F) upright(" for some ") q in cal(C) } . $ <eq:priority-set>]

The row bound (F2) gives $lr(|R_(k \, v \, z)^(cal(C))|) lt.eq 3 beta lr(|cal(Y)_k|)$. Let $P_(k \, v)^(cal(C))$ be the residual-coordinate projection that, in the sector $X_(k + 1) = z$, selects $Y_k in R_(k \, v \, z)^(cal(C))$. It is the identity on all remaining factors.

This projection commutes with $B_y$. Moreover,

#[#set math.equation(numbering: n => "(4.14)")
 $ ∥P_(k \, v)^(cal(C)) Gamma_(x \, y) P_(k \, v)^(cal(C))∥ lt.eq eta . $ <eq:compressed-gamma>]

Indeed, decompose by the future $X$ coordinates and earlier $Y$ coordinates. In each block the compression is, up to a sign and identity factors, a compression $J_k \[ R \, R \]$ with $lr(||) R lt.eq 3 beta lr(|cal(Y)_k|)$. Lemma 4 applies. Taking a direct sum does not increase the bound.

Apply Lemma 5 to obtain a specified isometry

$ S_e^(cal(C)) : \( upright("residual coordinates") \, B_y \) arrow.r \( upright("residual coordinates") \, A_(x \, y) \) $

for this edge. In the original coordinates it satisfies

#[#set math.equation(numbering: n => "(4.15)")
 $ ∥S_e^(cal(C)) - I∥ lt.eq C h \, #h(2em) ∥\( S_e^(cal(C)) - I \) P_(k \, v)^(cal(C))∥ lt.eq C h eta . $ <eq:edge-transfer>]

At $k = N$ put $S_e^(cal(C)) = I$. We will use $\( S_e^(cal(C)) \)^(- 1)$ for the left-to-right part of the exchange. For its right-to-left part, use the fixed isometry

#[#set math.equation(numbering: n => "(4.16)")
 $ C_(x \, y) = A_(x \, y)^(- 1 \/ 2) B_y^(1 \/ 2) : \( B_y \) arrow.r \( A_(x \, y) \) . $ <eq:fixed-leg>]

It is independent of $cal(C)$, $p$, and the priority projection.

On the left and right subspaces of an edge, in that order, define

#[#set math.equation(numbering: n => "(4.17)")
 $ M_e^(cal(C)) = mat(delim: "(", 0, C_(x \, y); \( S_e^(cal(C)) \)^(- 1), 0) . $ <eq:swap>]

Both off-diagonal entries are isometries onto the indicated endpoint, so $M_e^(cal(C))$ is unitary. In general it is not an involution. The distinction is useful: its inverse takes a vector from the right to the left using $S_e^(cal(C))$, whereas its forward right-to-left block is $C_(x \, y)$.

The stage-$k$ layer $M_(p \, k)^(cal(C))$ applies (4.17) on every switchable edge flagged $sans(F)$ in $p$, and is identity on the orthogonal complement of their endpoint subspaces. The orthogonality proved above makes this a unitary, even when infinitely many locations occur. Define

#[#set math.equation(numbering: n => "(4.18)")
 $ W_p^(cal(C)) = M_(p \, N)^(cal(C)) dots.h.c M_(p \, 1)^(cal(C)) \, #h(2em) V_(q p)^(cal(C)) = W_q^(cal(C)) \( W_p^(cal(C)) \)^(- 1) . $ <eq:circuit>]

Thus layers are applied in the order $1 \, dots.h \, N$.

Every recipe uses coordinate projections and positive square roots, and depends on group locations only through the flags. Consequently

#[#set math.equation(numbering: n => "(4.19)")
 $ U \( g \) W_p^(cal(C)) U \( g \)^(- 1) = W_(g p)^(g cal(C)) \, #h(2em) U \( g \) V_(q p)^(cal(C)) U \( g \)^(- 1) = V_(g q \, g p)^(g cal(C)) . $ <eq:equivariance>]

This is the covariance needed to turn the pairwise comparisons into an almost representation. The next section establishes that introducing a third configuration changes those comparisons only slightly.

== 5 Comparing two and three configurations <sec:comparison>

Inside one fixed set $cal(C)$, the comparisons compose exactly: $V_(r q)^(cal(C)) V_(q p)^(cal(C)) = V_(r p)^(cal(C))$. For the almost representation, however, each comparison will be made using its own pair of configurations. We therefore need the following estimate.

#thm([Proposition 5.1.])[
  #emph[There are numerical constants $C$ and $h_0 > 0$ such that, for the construction of Section 4 with $h lt.eq h_0$ and $0 < eta lt.eq 1 \/ 4$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ ∥V_(q p)^({ p \, q }) - V_(q p)^({ p \, q \, r })∥ lt.eq C h + C N eta + C N h eta $ <eq:comparison>]

 for every three configurations $p \, q \, r$. The constants do not depend on the cardinalities of any alphabets or on the configurations.]
] <prop:comparison>

The proof has three parts. We first put both constructions in the same arrival frames. Extra exchanges common to $p$ and $q$ then cancel exactly. The remaining change is in the priority isometries. Their small errors can be moved to separate levels instead of being summed along a path.

=== 5.1 Changing the arrival frames <changing-the-arrival-frames>

Write $cal(C)_2 = { p \, q }$ and $cal(C)_3 = { p \, q \, r }$. At each arrival sector, $S_2 = S_(k \, v \, y)^(cal(C)_2) subset S_3 = S_(k \, v \, y)^(cal(C)_3)$. By (4.11),

#[#set math.equation(numbering: n => "(5.2)")
 $ ∥tilde(F)_(S_2) - tilde(F)_(S_3) \|_(bb(C)^(S_2))∥ lt.eq C eta . $ <eq:two-frame-distance>]

For the moment, replace the pair’s arrival vectors by the corresponding columns of $tilde(F)_(S_3)$, leaving its edges and priorities unchanged. Denote the resulting layers by $overline(M)_(p \, k)$ and circuit by $overline(W)_p$; define $overline(W)_q$ in the same way.

We justify the operator-norm cost without summing over columns. For one layer, let $L$ and $R$ be the isometric embeddings of the direct sums of its active left and right residual spaces into $H$. Let $T$ be the direct sum of its left-to-right transfers, and $C_0$ the direct sum of the fixed right-to-left transfers. The layer equals

#[#set math.equation(numbering: n => "(5.3)")
 $ I - L L^(*) - R R^(*) + L C_0 R^(*) + R T L^(*) . $ <eq:layer-embedding>]

Only $R$ changes when the arrival frame changes. Its domain uses the metric $B_y$ on each column, independent of the compressed coordinate $X_k$. Thus (5.2), tensored with the residual coordinates and summed orthogonally over $\( v \, y \)$, gives $∥R - R'∥ lt.eq C eta$. Formula (5.3) then bounds the layer change by $4 ∥R - R'∥$. The transfers have norm one in their respective metrics, even though they may depend on the column $x$. It follows by telescoping products of unitaries that

#[#set math.equation(numbering: n => "(5.4)")
 $ ∥W_p^(cal(C)_2) - overline(W)_p∥ lt.eq C N eta \, #h(2em) ∥W_q^(cal(C)_2) - overline(W)_q∥ lt.eq C N eta . $ <eq:frame-circuit-cost>]

=== 5.2 Cancelling the common exchanges <cancelling-the-common-exchanges>

Among edges switchable for $cal(C)_3$ but not for $cal(C)_2$, those flagged $sans(E)$ in both $p$ and $q$ are unused by both circuits. The others are flagged $sans(F)$ in both and are exchanged by both circuits with exactly the same unitary. Call these the common exchanges.

A common exchange in a later layer commutes with every noncommon exchange in an earlier layer. Only adjacent layers could share a level. If the earlier edge is noncommon and is used in one of the two circuits, it is $sans(E)$ in one of $p \, q$. By (F1), at its arrival location there is no outgoing $sans(F)$ edge in that configuration at the next stage. A later common exchange there is therefore impossible. Their supports at the shared level lie at disjoint group locations. The adjustment of the $X$ vectors changes no location and hence preserves this disjointness.

Within a layer all exchanges commute, being supported on orthogonal subspaces. We may therefore move all common exchanges to the beginning of each circuit, retaining their relative order. There are only finitely many layers; infinite families within a layer are orthogonal direct sums, so this rearrangement does not require an infinite product. We obtain

#[#set math.equation(numbering: n => "(5.5)")
 $ W_p^(cal(C)_3) = hat(W)_p C_(upright("com")) \, #h(2em) W_q^(cal(C)_3) = hat(W)_q C_(upright("com")) \, #h(2em) V_(q p)^(cal(C)_3) = hat(W)_q hat(W)_p^(- 1) . $ <eq:common-cancel>]

Here $hat(W)_p = hat(M)_(p \, N) dots.h.c hat(M)_(p \, 1)$ consists of the pair-switchable edges used by $p$, with the triple’s frames and priorities. Thus $hat(M)_(p \, k)$ and $overline(M)_(p \, k)$ now have the same edges, subspaces, and fixed reverse transfers. Only their priority isometries differ.

=== 5.3 Moving the priority changes past later layers <moving-the-priority-changes-past-later-layers>

We compare $hat(W)_p$ with $overline(W)_p$; the argument for $q$ is identical. For each active edge the smaller priority projection is contained in the larger one. From (4.17),

$ mat(delim: "(", 0, C_(x \, y); \( S_e^(cal(C)_3) \)^(- 1), 0) mat(delim: "(", 0, S_e^(cal(C)_2); C_(x \, y)^(- 1), 0) = mat(delim: "(", I, 0; 0, \( S_e^(cal(C)_3) \)^(- 1) S_e^(cal(C)_2)) . $

Consequently

#[#set math.equation(numbering: n => "(5.6)")
 $ hat(M)_(p \, k) = K_k overline(M)_(p \, k) \, #h(2em) K_k \|_(H_k^perp) = I \, #h(2em) ∥K_k - I∥ lt.eq C h . $ <eq:post-unitary>]

These norms are in $H$, with its given metric. The last estimate follows from Lemma 5 and the uniform metric bounds.

For $k < N$, let $Q_(k + 1)$ be the orthogonal projection onto the departure subspace used by $overline(M)_(p \, k + 1)$ in $H_k$. We claim that

#[#set math.equation(numbering: n => "(5.7)")
 $ ∥\( K_k - I \) Q_(k + 1)∥ lt.eq C h eta . $ <eq:next-protected>]

At a fixed location, $Q_(k + 1)$ selects the next coordinates $X_(k + 1) \, Y_k$. A current arrival subspace selects $Y_(k - 1)$ and a line in the compressed $X_k$ factor. These projections commute: the conditions concern different coordinates, and $G_k$ preserves the indicated coordinate sectors. On their intersection the smaller priority contains every next departure, by (4.13). Lemma 5 bounds $\( S_e^(cal(C)_3) \)^(- 1) S_e^(cal(C)_2) - I$ there by $C h eta$. On the complement of all current arrival subspaces $K_k = I$. Their orthogonal direct sum proves (5.7); no factor counting edges or labels occurs. Set $Q_(N + 1) = 0$ for the last layer.

Apply Lemma 6 on $H_k$, taking $h_0$ sufficiently small. It gives a unitary $tilde(K)_k$, extended by identity off $H_k$, such that

#[#set math.equation(numbering: n => "(5.8)")
 $ tilde(K)_k Q_(k + 1) = Q_(k + 1) \, #h(2em) ∥K_k - tilde(K)_k∥ lt.eq C h eta \, #h(2em) ∥tilde(K)_k - I∥ lt.eq C h . $ <eq:corrected-unitary>]

It commutes with $overline(M)_(p \, k + 1)$: that layer acts only on its departure subspace $Q_(k + 1) H_k$ and its arrival subspace in $H_(k + 1)$, and $tilde(K)_k$ is identity on both. It also commutes with all later layers, which act on other levels. Figure 1 depicts the only later layer whose support overlaps $H_k$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 2), (8.6, 2), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((0, 2), [#text(size: 9pt)[${H_(k-1)}$]], anchor: "east", padding: 0.1176cm)
  line((0, 1), (8.6, 1), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((0, 1), [#text(size: 9pt)[$H_k$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (8.6, 0), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[${H_(k+1)}$]], anchor: "east", padding: 0.1176cm)
  line((1.6, 1), (1.6, 2), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((1.6, 1), radius: 0.07056, fill: black, stroke: none)
  circle((1.6, 2), radius: 0.07056, fill: black, stroke: none)
  content((1.6, 2.18), [#text(size: 9pt)[$overline(M)_(p,k)$]], anchor: "south", padding: 0.1176cm)
  content((4, 1), [#box(inset: 0.1764cm, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$tilde(K)_k$]]])])
  content((4, 0.3247), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[fixes $Q_(k+1)H_k$]]])])
  line((6.5, 0), (6.5, 1), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((6.5, 0), radius: 0.07056, fill: black, stroke: none)
  circle((6.5, 1), radius: 0.07056, fill: black, stroke: none)
  content((6.5, -0.18), [#text(size: 9pt)[$overline(M)_(p,k+1)$]], anchor: "north", padding: 0.1176cm)
  content((6.5, 1.12), [#text(size: 9pt)[$Q_(k+1)H_k$]], anchor: "south", padding: 0.1176cm)
  bezier((4, 1.8), (7.9, 1.8), (5.488, 2.116), (6.412, 2.116), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.95, 2.037), [#text(size: 9pt)[commutes past]], anchor: "south", padding: 0.1176cm)
  line((0.5, -0.95), (8.1, -0.95), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((8.1, -0.95), [#text(fill: rgb("#000000"))[#text(size: 9pt)[application order]]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The corrected priority change acts only at level $k$ and fixes the next layer’s departure subspace $Q_(k + 1) H_k$. It therefore commutes past that layer. All subsequent layers have support disjoint from $H_k$. Horizontal lines denote orthogonal levels; vertical segments indicate layers acting between successive levels. ],
) <fig:priority>

Substitute (5.6) into the product for $hat(W)_p$. Replacing each $K_k$ by $tilde(K)_k$ costs at most $C N h eta$ by telescoping. Move every $tilde(K)_k$ past the subsequent layers. The corrected unitaries commute with one another because they act on distinct levels. Thus

#[#set math.equation(numbering: n => "(5.9)")
 $ ∥hat(W)_p - \( tilde(K)_N dots.h.c tilde(K)_1 \) overline(W)_p∥ lt.eq C N h eta \, #h(2em) ∥tilde(K)_N dots.h.c tilde(K)_1 - I∥ = max_k ∥tilde(K)_k - I∥ lt.eq C h . $ <eq:moved-errors>]

Together with (5.4), this proves

$ ∥hat(W)_p - W_p^(cal(C)_2)∥ lt.eq C h + C N eta + C N h eta \, $

and the same bound holds for $q$. Using (5.5) and telescoping the two factors in $V_(q p)$ proves Proposition 7.

=== 5.4 The almost representation <the-almost-representation>

Return to the original configuration $b$ and define

#[#set math.equation(numbering: n => "(5.10)")
 $ mu \( g \) = V_(b \, g b)^({ b \, g b }) U \( g \) . $ <eq:mu>]

When $g = e$, there is just one configuration and no switchable edge; therefore $mu \( e \) = I$. Equivariance (4.19) gives

$ mu \( g \) mu \( t \) = V_(b \, g b)^({ b \, g b }) V_(g b \, g t b)^({ g b \, g t b }) U \( g t \) . $

Replace both comparisons here and the comparison in $mu \( g t \)$ by those computed in ${ b \, g b \, g t b }$. Within that common set,

$ V_(b \, g b)^({ b \, g b \, g t b }) V_(g b \, g t b)^({ b \, g b \, g t b }) = V_(b \, g t b)^({ b \, g b \, g t b }) . $

Three applications of Proposition 7 yield

#[#set math.equation(numbering: n => "(5.11)")
 $ "def" \( mu \) lt.eq C h + C N eta + C N h eta . $ <eq:defect-bound>]

The remaining task is to show that the distance from representations does not tend to zero with this bound.

== 6 Distance from genuine representations <sec:obstruction>

The map $mu$ has small defect by (5.11). To separate it from genuine representations, we compare labelled vectors at the last and first levels. Most labels are transported between these vectors by $mu$, but a quadratic form takes incompatible values on the two families if that transport is performed by a genuine representation.

=== 6.1 Transport along most paths <transport-along-most-paths>

For $i in cal(I)$, abbreviate $s_k \( i \) = s_k \( x_k \( i \) \, y_(k - 1) \( i \) \)$ and put

$ t_0 \( i \) = e \, #h(2em) t_k \( i \) = s_1 \( i \) dots.h.c s_k \( i \) \, #h(2em) s_i = t_N \( i \) . $

Let $u_i$ be $v_i^(\( N \))$ at location $e$ and level $N$, and let $r_i$ be $v_i^(\( 0 \))$ at location $e$ and level zero. Both are unit vectors.

#thm([Lemma 6.1.])[
  #emph[For all but a proportion $2 N beta$ of labels $i in cal(I)$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ ∥mu \( s_i \) u_i - r_i∥ lt.eq C N eta + C N h eta . $ <eq:transport-bound>]

]
] <lem:transport>

#proof[
  Give $cal(I)$ its uniform product probability measure. Along the forward path $t_0 \, dots.h \, t_N$, the departure $t_(k - 1)$ depends only on coordinate pairs $\( X_j \, Y_(j - 1) \)$ with $j < k$. Conditional on these pairs and on $X_k$, the coordinate $Y_(k - 1)$ is still uniform. The row bound (F2) therefore makes the probability of an $sans(F)$ step at most $beta$. A union bound shows that every forward step is $sans(E)$ with probability at least $1 - N beta$.
  Consider also the path with the same steps and terminal point $e$. Its stage-$k$ arrival is
  #[#set math.equation(numbering: n => "(6.2)")
   $ a_k \( i \) = s_N \( i \)^(- 1) s_(N - 1) \( i \)^(- 1) dots.h.c s_(k + 1) \( i \)^(- 1) = s_i^(- 1) t_k \( i \) . $ <eq:backward-position>]
  Thus $a_(k - 1) s_k = a_k$, and $a_k$ depends only on the later coordinate pairs. Conditional on these pairs and $Y_(k - 1)$, the arrival bound (F3) makes the probability of an $sans(E)$ step at most $beta$. Every backward-path step is $sans(F)$ with probability at least $1 - N beta$.
  Let $cal(I)_(upright("good"))$ be the intersection of these two events. We have
  #[#set math.equation(numbering: n => "(6.3)")
   $ lr(|cal(I) \\ cal(I)_(upright("good"))|) \/ lr(|cal(I)|) lt.eq 2 N beta . $ <eq:good-fraction>]
  No independence between the two events is needed. For $i$ in this set, put $p = s_i b$. Equation (6.2) and the definition of translation show that the forward path $t_0 \, dots.h \, t_N$ is entirely $sans(E)$ for $b$ and entirely $sans(F)$ for $p$. All its edges are switchable for ${ b \, p }$.
  Let $z_k$ be the exact label vector $v_i^(\( k \))$ at location $t_k \( i \)$. Thus $z_N = U \( s_i \) u_i$ and $z_0 = r_i$. At stage $k$, replacing its factor $a_(k \, x_k \( i \))$ by the adjusted arrival vector changes $z_k$ by at most $C eta$, by (4.11) and (4.6). The adjusted vector belongs to the active right subspace of the path’s edge. The inverse layer takes it to the left using $S_e^({ b \, p })$. For $k < N$, its residual coordinates belong to the priority subspace: the next step $\( t_k \, x_(k + 1) \, y_k \)$ is $sans(F)$ in $p$. Equation (4.15) therefore changes these coordinates by at most $C h eta$. At $k = N$ the transfer is identity. We conclude that
  $ ∥\( M_(p \, k)^({ b \, p }) \)^(- 1) z_k - z_(k - 1)∥ lt.eq C eta + C h eta . $
  Telescoping the inverse circuit from $N$ to $1$ gives
  $ ∥\( W_p^({ b \, p }) \)^(- 1) U \( s_i \) u_i - r_i∥ lt.eq C N eta + C N h eta . $
  All actual layers are unitary, so the previously incurred errors are not amplified. Finally $W_b^({ b \, p }) r_i = r_i$: its first layer does not use the departure sector of the first, $sans(E)$-flagged step, and later layers do not act on level zero. Formula (5.10) proves the claim. ◻
]

=== 6.2 A quadratic form that vanishes for representations <a-quadratic-form-that-vanishes-for-representations>

The signed frames were chosen to make the following identity hold for every genuine representation, without any assumption that it preserve our tensor factors or levels.

#thm([Lemma 6.2.])[
  #emph[Let $rho : G arrow.r cal(U) \( H \)$ be a unitary representation, and define unit vectors in $bb(C)^(cal(I)) ⊗ H$ by 
$ psi = lr(|cal(I)|)^(- 1 \/ 2) sum_(i in cal(I)) e_i ⊗ rho \( s_i \) u_i \, #h(2em) r = lr(|cal(I)|)^(- 1 \/ 2) sum_(i in cal(I)) e_i ⊗ r_i . $

 Then 
#[#set math.equation(numbering: n => "(6.4)")
 $ ⟨psi \, \( D ⊗ I \) psi⟩ = 0 \, #h(2em) ⟨r \, \( D ⊗ I \) r⟩ = 1 / 2 . $ <eq:witness-values>]

 In particular, $∥r - psi∥ gt.eq 1 \/ 4$.]
] <lem:witness>

#proof[
  For any labels $i \, j$, unitarity and multiplicativity give
  $ ⟨rho \( s_i \) u_i \, rho \( s_j \) u_j⟩ = ⟨u_i \, rho \( s_i^(- 1) s_j \) u_j⟩ . $
  Fix $d in { 1 \, dots.h \, L }$. A nonzero coefficient $\( gamma_d \)_(i j)$ pairs labels that agree except possibly in $Y_d$. Their group products have a common prefix through stage $d$:
  $ s_i = P Q_i \, #h(2em) s_j = P Q_j \, #h(2em) s_i^(- 1) s_j = Q_i^(- 1) Q_j . $
  After all coordinates other than $X_d$ are fixed, the suffixes $Q_i \, Q_j$ are independent of $X_d$: steps after $d$ use only $X_(d + 1) \, dots.h \, X_N$. There are linear isometric embeddings $E_i \, E_j : bb(C)^(m_d) arrow.r H$, also independent of $X_d$, such that $u_i = E_i a_(d \, x_d)$ and $u_j = E_j a_(d \, x_d)$. Here the metric at level $N$ is Euclidean. The factor of $\( gamma_d \)_(i j)$ that depends on $X_d$ is exactly $f_d \( x_d \)$. Consequently the sum over that coordinate is a fixed scalar multiple of
  $ & sum_(x in cal(X)_d) f_d \( x \) ⟨a_(d \, x) \, E_i^(*) rho \( Q_i^(- 1) Q_j \) E_j a_(d \, x)⟩\
 & #h(1cm)  = "Tr" (E_i^(*) rho \( Q_i^(- 1) Q_j \) E_j sum_(x in cal(X)_d) f_d \( x \) a_(d \, x) a_(d \, x)^(*)) = 0 $
  by (4.2). Summing all other coordinates proves $⟨psi \, \( gamma_d ⊗ I \) psi⟩ = 0$, and summing $d$ proves the first identity in (6.4).
  The Gram matrix of the vectors $r_i$ is $G_0$, since these are the standard label vectors at level zero. Both $G_0$ and $D$ are real symmetric. Equations (4.4) and (4.6) give
  $ ⟨r \, \( D ⊗ I \) r⟩ = frac("Tr" \( D G_0 \), lr(|cal(I)|)) = frac("Tr" \( D + 1 / 2 D^2 \), lr(|cal(I)|)) = 1 / 2 . $
  Since $∥∥ D = 1$ and both vectors have norm one,
  $ 1 / 2 lt.eq ∥r - psi∥ ∥∥ r + ∥psi∥ ∥r - psi∥ = 2 ∥r - psi∥ . $
  This proves the last assertion. ◻
]

=== 6.3 Parameter choice and the main theorem <parameter-choice-and-the-main-theorem>

Suppose that $rho$ is uniformly within $epsilon$ of $mu$. Lemma 8 bounds the transport error on $cal(I)_(upright("good"))$; on its complement the error is at most two, because both vectors are unit. The triangle inequality in the orthogonal label sum therefore gives

#[#set math.equation(numbering: n => "(6.5)")
 $ ∥r - psi∥ lt.eq epsilon + C N eta + C N h eta + 2 sqrt(2 N beta) . $ <eq:final-distance>]

All constants in this estimate and (5.11) are numerical. We can now make the parameter order explicit.

#proof[
  The amenable implication is Kazhdan’s theorem [9]. Suppose that $G$ is nonamenable, and fix any $delta > 0$. First choose $L$ large enough that $h = 1 \/ \( 2 sqrt(L) \)$ meets every numerical smallness condition above and $C h < delta \/ 2$ in (5.11). With $N = L + 1$ now fixed, choose $0 < eta < 1 \/ 4$ so small that
  $ C N eta + C N h eta < min { delta \/ 2 \, 1 \/ 20 } $
  for the constants in both (5.11) and (6.5). Next choose
  $ 0 < beta < min { beta_0 \( eta \) \, thin 1 \/ \( 3200 N \) } \, $
  where $beta_0 \( eta \)$ is supplied by Lemma 4. Construct the flags and then enlarge the alphabets to the dimensions required by that lemma. None of the established estimates worsens when the alphabets are enlarged.
  The resulting normalized map has defect less than $delta$. If a genuine representation were uniformly within $1 \/ 10$ of it, (6.5) would give
  $ ∥r - psi∥ < 1 / 10 + 1 / 20 + 1 / 20 = 1 / 5 \, $
  contrary to Lemma 9. Thus (1.1) holds for every $delta > 0$, which rules out strong Ulam stability. ◻
]

#heading(level: 1)[References]
#bibitem([1])[A.~Alpeev, #emph[Lamplighters over non-amenable groups are not strongly Ulam stable], #link("https://arxiv.org/abs/2009.11738v3")[arXiv:2009.11738] (2020), version~3, 2023.]
#bibitem([2])[S.~Bravyi and A.~Kitaev, #emph[Fermionic quantum computation], Ann. Physics #strong[298] (2002), no.~1, 210--226. #link("https://doi.org/10.1006/aphy.2002.6254")[doi:10.1006/aphy.2002.6254].]
#bibitem([3])[M.~Burger, N.~Ozawa, and A.~Thom, #emph[On Ulam stability], Israel J. Math. #strong[193] (2013), 109--129. #link("https://doi.org/10.1007/s11856-012-0050-z")[doi:10.1007/s11856-012-0050-z].]
#bibitem([4])[F.~Fournier-Facio and B.~Rangarajan, #emph[Ulam stability of lamplighters and Thompson groups], Math. Ann. #strong[389] (2024), 2469--2497. #link("https://doi.org/10.1007/s00208-023-02708-5")[doi:10.1007/s00208-023-02708-5].]
#bibitem([5])[H.~Furstenberg, #emph[Boundary theory and stochastic processes on homogeneous spaces], in #emph[Harmonic Analysis on Homogeneous Spaces], Proc. Sympos. Pure Math. #strong[26], Amer. Math. Soc., Providence, RI, 1973, 193--229.]
#bibitem([6])[L.~Glebsky, A.~Lubotzky, N.~Monod, and B.~Rangarajan, #emph[Asymptotic cohomology and uniform stability for lattices in semisimple groups], #link("https://arxiv.org/abs/2301.00476v4")[arXiv:2301.00476], version~4 (2023).]
#bibitem([7])[P.~Jordan and E.~Wigner, #emph[Über das Paulische Äquivalenzverbot], Z. Phys. #strong[47] (1928), 631--651. #link("https://doi.org/10.1007/BF01331938")[doi:10.1007/BF01331938].]
#bibitem([8])[M.~Kalantar and M.~Kennedy, #emph[Boundaries of reduced $C^(*)$-algebras of discrete groups], J. reine angew. Math. #strong[727] (2017), 247--267. #link("https://doi.org/10.1515/crelle-2014-0111")[doi:10.1515/crelle-2014-0111].]
#bibitem([9])[D.~Kazhdan, #emph[On $epsilon$-representations], Israel J. Math. #strong[43] (1982), no.~4, 315--323. #link("https://doi.org/10.1007/BF02761236")[doi:10.1007/BF02761236].]
#bibitem([10])[Y.~Lyubarskii and R.~Vershynin, #emph[Uncertainty principles and vector quantization], IEEE Trans. Inform. Theory #strong[56] (2010), no.~7, 3491--3501. #link("https://doi.org/10.1109/TIT.2010.2048458")[doi:10.1109/TIT.2010.2048458].]


