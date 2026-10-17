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

#align(center)[#text(size: 16pt, weight: "bold")[A uniformly discrete counterexample to bounded approximation in Lipschitz-free spaces]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

Uniform discreteness keeps distinct points of a metric space a fixed positive distance apart. For its Lipschitz-free space, this separation guarantees the approximation property: the identity can be approximated on each compact set by finite-rank operators. Kalton asked whether the approximating operators can always be chosen with one bound on their norms [12] Proposition 4.4 and following remarks, p. 185. The question was restated by Godefroy and Ozawa [11] Question 1 and in Godefroy’s survey [9] Problem 6.2. We construct a countable uniformly discrete space for which no such bound exists.

We work over the real scalars. For a pointed metric space $\( M \, d \, o \)$, let $"Lip"_0 \( M \)$ be the Banach space of real Lipschitz functions vanishing at $o$, with the Lipschitz constant as norm. Its #emph[Lipschitz-free space] is

$ cal(F) \( M \) = overline("span") { delta_x : x in M } subset.eq "Lip"_0 \( M \)^(*) \, #h(2em) delta_x \( f \) = f \( x \) . $

Thus $delta_o = 0$ and $∥delta_x - delta_y∥ = d \( x \, y \)$. The latter identity follows from the Lipschitz inequality and the test function $z mapsto d \( z \, y \) - d \( o \, y \)$. The construction originates in the molecular spaces of Arens and Eells [2] §2; its linearization properties and complemented free subspaces are central to the work of Godefroy and Kalton [10] §2.

A Banach space $X$ has the #emph[approximation property] (AP) if for every norm-compact set $C subset.eq X$ and every $epsilon > 0$ there is a bounded finite-rank linear operator $T : X arrow.r X$ with $sup_(u in C) ∥T u - u∥ < epsilon$. For $lambda gt.eq 1$, it has $lambda$-BAP if these operators can always be chosen with $∥T∥ lt.eq lambda$. The bounded approximation property (BAP) means $lambda$-BAP for some finite $lambda$, and the metric approximation property (MAP) means $1$-BAP. In AP the norm may depend on $C$ and $epsilon$; in BAP one bound must work for all of them. A metric space is #emph[proper] if its closed bounded balls are compact.

#thm([Theorem 1.1.])[
  #emph[There is a countable, unbounded, nonproper pointed metric space $\( M \, d \, o \)$ such that $d \( x \, y \) gt.eq 1$ for distinct points and $cal(F) \( M \)$ has AP but fails $lambda$-BAP for every finite $lambda gt.eq 1$.]
] <thm:main>

The distinction between discrete and uniformly discrete matters here. Smith gives countable complete discrete spaces whose free spaces have AP and fail BAP, without asserting a common positive lower bound on all nonzero distances [16] Theorem 1.3 and the surrounding discussion. 1 supplies that lower bound. The example is necessarily outside the countable proper case: Dalet proved MAP for free spaces over countable proper metric spaces [7] Theorem 2.6. Our example contains an infinite separated subset in a bounded ball. Uniform discreteness also imposes strong sequential structure: Cúth and Kalenda prove a quantitative strengthening of the Schur property for these free spaces [6] Theorem 1.1, so weakly convergent sequences converge in norm. Their April 2026 introduction still records the BAP question addressed here.

The same example has a nonlinear consequence. Kalton asked whether every separable Banach space is #emph[approximable] [13] Problem 1, p. 1260. For such a space $X$, this means that there is an equi-uniformly continuous sequence of maps $psi_n : X arrow.r X$, each with relatively compact range, such that $psi_n \( x \) arrow.r x$ for every $x in X$. Equi-uniform continuity means that the choice of $delta$ for a given $epsilon$ in the uniform-continuity condition works for every $psi_n$. The space $X = cal(F) \( M \)$ in 1 is not approximable, although it has AP. 2.4 explains the short implication from Kalton’s net theorem that gives this consequence.

=== 1.1 A finite obstruction in each bounded block <a-finite-obstruction-in-each-bounded-block>

The main construction concerns a prescribed operator norm bound $p$. It produces a bounded metric space and a finite set of points, called anchors, at which every finite-rank operator of norm at most $p$ makes a definite error. The distinction from earlier finite extension obstructions is important. For a finite pointed metric pair $A subset.eq N$ containing the basepoint, a linear extension operator $E : "Lip"_0 \( A \) arrow.r "Lip"_0 \( N \)$ must satisfy $\( E f \) \|_A = f$ for every $f$. Brudnyi and Brudnyi give finite subsets of integer $ell_1$ cubes for which the least possible norm of an exact linear extension operator grows without bound [5] preprint Lemma 10.5, pp. 46–47. Godefroy and Ozawa [11] Proposition 7 obtain arbitrarily large lower bounds for finite metric pairs from a compact free space failing AP. By finite-dimensional duality, an extension operator corresponds, with the same norm, to a projection from $cal(F) \( N \)$ onto the span of the evaluations from $A$. These bounds therefore concern projections with a prescribed range. On the finite-dimensional space $cal(F) \( N \)$, the identity remains a finite-rank operator of norm at most one. Our block is infinite, and its fixed finite anchor set obstructs approximation by every operator of norm at most $p$ whose range is finite-dimensional.

#thm([Theorem 1.2.])[
  #emph[For each integer $p gt.eq 1$, there are a bounded countably infinite pointed metric space $\( M_p \, d_p \, o \)$ and a finite set $A_p subset.eq M_p$ containing $o$ such that 
$ d_p \( x \, y \) gt.eq 1 quad \( x eq.not y \) \, #h(2em) "diam" M_p lt.eq B_p := 300 p^2 + 150 p + 5 \, $

 and every bounded finite-rank linear operator $T_0 : cal(F) \( M_p \) arrow.r cal(F) \( M_p \)$ with $∥T_0∥ lt.eq p$ satisfies 
$ max_(a in A_p) ∥T_0 delta_a - delta_a∥ gt.eq 1 / 2 . $

]
] <thm:blocks>

Each individual block nevertheless has BAP. The coefficient identification for bounded uniformly discrete spaces appears in [1] Theorem 4.14, with the bounds used here in [6] Lemma 3.4. Our proof in 4 identifies $cal(F) \( M_p \)$ with $ell_1 \( M_p \\ { o } \)$, and coordinate truncations give $2 B_p$-BAP alongside the obstruction at $p$. Transporting the free-space norm to real $ell_1$ gives the following quantitative consequence. It also answers a separate question: does every equivalent norm on real $ell_1$ have MAP? Kalton observed that a positive answer would imply BAP for every uniformly discrete free space [13] p. 1260. The case $p = 1$ below gives a direct negative answer.

#thm([Corollary 1.3.])[
  #emph[For each integer $p gt.eq 1$, real $ell_1$ has an equivalent norm $∥dot.op∥_p$ such that 
$ 1 / 2 ∥c∥_1 lt.eq ∥c∥_p lt.eq B_p ∥c∥_1 \, $

 and $\( ell_1 \, ∥dot.op∥_p \)$ has $2 B_p$-BAP but fails $p$-BAP. For $p = 1$, this norm fails MAP.]
] <cor:renorming>

To pass from the blocks to 1, identify their basepoints and put

$ d \( x \, y \) = d_p \( x \, o \) + d_q \( y \, o \) quad upright("if ") x in M_p \\ { o } \, med y in M_q \\ { o } \, med p eq.not q . $

Each block then has a pointed $1$-Lipschitz retraction from the resulting metric wedge. On free spaces, inclusion and retraction induce contractions whose composite is the identity. Thus a BAP bound for the wedge would be a bound for every block, contradicting 2.

The same decomposition proves AP directly. First retain finitely many blocks by a contractive projection that approximates the chosen compact set. Then approximate its images in those blocks, using their individual BAPs. Only finitely many operator norms occur at this stage, so the resulting operator is bounded. The bound is allowed to grow as more blocks are retained.

=== 1.2 The obstruction: signed measures and opposing tests <the-obstruction-signed-measures-and-opposing-tests>

The block itself consists of two kinds of points: vertices of finite source graphs and anchors that join those graphs into a bounded metric space. After a finite-rank operator is given, we choose a finite subset $S$ of these same points to support the range of a nearby operator. Thus $S$ may contain source vertices or anchors and may depend on the operator.

The source graphs have a fixed large degree. For every fixed radius, the frequencies of their colored neighborhoods approach the corresponding probabilities in a regular tree of that degree with independent uniform vertex colors. A vertex is labeled by its capped distances to the color classes. These labels vary by at most one across an edge, and each label has only a bounded number of coordinates below the cap. Vertices with the same label attach to the same anchor by a long edge. There are only finitely many possible labels, hence finitely many anchors. Joining the anchors makes the whole block bounded, while sufficiently small metric balls remain inside a single source graph and contain a uniformly bounded number of points.

Suppose a finite-rank operator of small norm approximates the anchor evaluations. An arbitrarily small perturbation gives an operator $T$ with $∥T∥ lt.eq 2 p$ whose range has a common finite support $S subset M_p$. Adding a coefficient at the basepoint allows us to write its values as signed measures $mu_x$ on $S$, each of mass one and uniformly bounded total variation. For the height $L = 10 p$, a nonnegative bump $b_x : M_p arrow.r \[ 0 \, L \]$ detects support points whose labels are close to the label of $x$. It takes its maximum $L$ at the anchor $a \( x \)$ attached to $x$ and has a small Lipschitz constant, in particular at most one. The operator norm controls the comparison from $x$ to $a \( x \)$, while the anchor approximation controls the value there. The small slope of $b_x$ makes their combined loss from the anchor value at most $L \/ 4$. The affine representation therefore gives

$ \( T delta_x \) \( b_x - b_x \( o \) \) + b_x \( o \) = integral b_x thin d mu_x gt.eq frac(3 L, 4) . $

No positivity of $mu_x$ is assumed.

A source walk is #emph[nonbacktracking] if it never immediately reverses an edge incidence. The color structure makes it rare for a source vertex to start a long nonbacktracking walk that can be tracked by nearby support points with compatible labels. Such a walk is #emph[matched] if one can choose a support point at each step with a compatible label, while consecutive support points stay within distance $2 L$. For a prescribed support point, compatibility allows only a small set of source colors. A bound on small metric balls limits the possible next support points. On the limiting tree, the source colors along a nonbacktracking walk are independent. Choosing many colors therefore makes long matched walks rare.

Call a vertex #emph[good] if no matched walk of the chosen long length starts there, and #emph[bad] otherwise. At a good vertex, record the longest matched walk beginning in each outgoing direction, for each fixed initial support point. Declare a direction exceptional only when its record is strictly larger than every other record. There is at most one such direction per support point. If nearby support points match the two ends of an edge whose endpoints are good, at least one of the two directions along that edge must be exceptional: otherwise prepending the edge to a longest walk in another direction would force each of two finite records to be larger than the other.

For an oriented incidence $e : x arrow.r y$, let $E_e$ be the support points for which $e$ is exceptional at $x$; at a bad vertex we put every support point in $E_e$. We prescribe $b_x$ on $S \\ E_e$ and $- b_y$ on $S \\ E_(macron(e))$, where $macron(e)$ is the reverse incidence. Within each set the prescribed values satisfy the Lipschitz inequality because the bumps do. For a cross pair $j in S \\ E_e$ and $j' in S \\ E_(macron(e))$, the record argument shows that if $d_p \( j \, j' \) < 2 L$, then both $b_x \( j \)$ and $b_y \( j' \)$ vanish. If the distance is at least $2 L$, their sum is bounded by that distance. Thus all the prescribed values together are $1$-Lipschitz. Scalar extension followed by clipping gives a $1$-Lipschitz test $f_e : M_p arrow.r \[ - L \, L \]$. Its pairing satisfies

$ integral f_e thin d \( mu_x - mu_y \) gt.eq frac(3 L, 2) - 2 L #scale(x: 120%, y: 120%)[\(] \| mu_x \| \( E_e \) + \| mu_y \| \( E_(macron(e)) \) #scale(x: 120%, y: 120%)[\)] . $

Here $\| mu_x \| \( E_e \)$ is the sum of the absolute values of the coefficients of $mu_x$ on $E_e$. Each support point belongs to at most one exceptional set at a good vertex. Averaging over all oriented incidences therefore divides the corresponding variation loss by the graph degree; the small fraction of bad vertices controls the remaining loss. Since source-edge endpoints have $d_p$-distance at most one, the affine pairing bounds each test pairing in absolute value by $∥T∥ lt.eq 2 p$. The averaged lower bound contradicts this upper bound.

The order of choices is essential. The entire deterministic graph sequence, metric block, and anchors are fixed before the operator and its support $S$. We then choose the walk length and one sufficiently large source graph. Local convergence applies to every finite colored event, including the event specified by this already fixed support. There is no assumption that the operator was chosen independently of the graph sequence.

=== 1.3 Methods and organization <methods-and-organization>

For the graph construction we use the independent-permutation model described by Friedman [8] and prove the local convergence we need directly. The empirical rooted-neighborhood viewpoint is that of Benjamini and Schramm [4]. The scalar extension step is an instance of McShane’s classical extension principle [14]; we give the needed formula for finite data and its proof. A related comparison of nonbacktracking continuation lengths is used to select parent directions in the graph algorithm of Ben-David, Childs, Gilyén, Kretschmer, Podder, and Wang [3] §6.1.2. Our continuation records also depend on the support state and are used to construct the scalar tests.

2 proves the coefficient estimate, the renorming corollary, and the wedge reduction, assuming 2, and derives the nonlinear consequence from Kalton’s theorem. 3 constructs the colored graphs and bounded block. Section 4, Section 5, Section 6 prove 2: they pass from an arbitrary finite-rank operator to signed measures, bound matched walks, and derive the contradiction by scalar tests and incidence averaging.

== 2 From bounded blocks to AP without BAP <sec:reduction>

The following sections will construct the blocks of 2. Here we assume that theorem, prove the renorming and wedge results, and derive the nonlinear consequence from Kalton’s theorem. A bounded space with separation at least one has a coefficient description by $ell_1$, with an approximation bound controlled by its diameter. Joining the blocks preserves each of their obstructions, while retractions onto finitely many blocks provide the approximations required for AP.

=== 2.1 The coefficient estimate <the-coefficient-estimate>

The coefficient identification below appears in [1] Theorem 4.14; the coefficient bounds are stated in [6] Lemma 3.4. We include the proof and derive the stated approximation bound from coordinate truncations.

#thm([Proposition 2.1.])[
  #emph[Let $\( N \, d \, o \)$ be a countable pointed metric space such that $d \( x \, y \) gt.eq 1$ for distinct points and $"diam" N lt.eq B < oo$. The map 
$ J : ell_1 \( N \\ { o } \) arrow.r cal(F) \( N \) \, #h(2em) J c = sum_(x eq.not o) c_x delta_x \, $

 is a linear isomorphism onto $cal(F) \( N \)$ and satisfies 
#[#set math.equation(numbering: n => "(2.1)")
 $ 1 / 2 ∥c∥_1 lt.eq ∥J c∥ lt.eq B ∥c∥_1 . $ <eq:coefficient-bounds>]

 If $N eq.not { o }$, then $cal(F) \( N \)$ has $2 B$-BAP. If $N = { o }$, both spaces are zero.]
] <prop:coefficients>

#proof[
  First let $c$ be finitely supported. Since $∥delta_x∥ = d \( x \, o \) lt.eq B$, the triangle inequality gives the upper estimate in (2.1). For the lower estimate, define $f_c : N arrow.r bb(R)$ to be $"sign" \( c_x \) \/ 2$ at each nonbasepoint in the support of $c$, and zero elsewhere. This function vanishes at $o$. Its values differ by at most one, so the separation assumption makes it $1$-Lipschitz. Testing the evaluation combination against $f_c$ gives
  $ ∥J c∥ gt.eq \( J c \) \( f_c \) = 1 / 2 sum_(x eq.not o) \| c_x \| . $
  The upper estimate makes the series defining $J c$ converge in $cal(F) \( N \)$ for every $c in ell_1 \( N \\ { o } \)$. Both estimates pass to this extension by approximation with finitely supported families. In particular, $J$ is injective and its inverse on its range has norm at most two. The range is closed: if $J c_m$ converges, then
  $ ∥c_m - c_j∥_1 lt.eq 2 ∥J c_m - J c_j∥ $
  makes $\( c_m \)$ Cauchy, and continuity of $J$ identifies the limit of $\( J c_m \)$ as the image of the limit of $\( c_m \)$. The range also contains every evaluation $delta_x$, whose span is dense in $cal(F) \( N \)$. It is therefore all of $cal(F) \( N \)$.
  Suppose now that $N eq.not { o }$; then $B gt.eq 1$. Choose increasing finite sets $E_m$ exhausting $N \\ { o }$, and let $q_m$ be the associated coordinate projections on $ell_1 \( N \\ { o } \)$. The operators
  $ S_m = J q_m J^(- 1) : cal(F) \( N \) arrow.r cal(F) \( N \) $
  have finite rank and norm at most $B dot.op 1 dot.op 2 = 2 B$. Since $q_m c arrow.r c$ in $ell_1$, they satisfy $S_m u arrow.r u$ for every $u in cal(F) \( N \)$. This convergence is uniform on compact sets. Indeed, for a nonempty compact $C subset.eq cal(F) \( N \)$ and $epsilon > 0$, choose a finite $epsilon \/ \[ 3 \( 2 B + 1 \) \]$-net in $C$. For all sufficiently large $m$, the error $∥S_m u - u∥$ is less than $epsilon \/ 3$ at every point of the net. Since $∥S_m - "Id"∥ lt.eq 2 B + 1$, the error at any point of $C$ is then less than $2 epsilon \/ 3$, hence less than $epsilon$. The empty compact set imposes no condition. If $N$ is finite, the sequence of coordinate projections is eventually the identity. This proves $2 B$-BAP. The assertion for $N = { o }$ is immediate. ◻
]

#proof[
  Fix $p gt.eq 1$. By 2, the set $M_p \\ { o }$ is countably infinite, so an enumeration identifies its coefficient space with real $ell_1$. Apply 4 with $B = B_p$, denote its coefficient map by $J_p$, and define $∥c∥_p = ∥J_p c∥_(cal(F) \( M_p \))$. Equation (2.1) gives the stated norm inequalities and shows that this is an equivalent norm. For this norm, $J_p$ is a surjective isometry. Conjugation by $J_p$ preserves operator norms, finite rank, and approximation errors on corresponding compact sets. It therefore transfers $2 B_p$-BAP to the new norm, with $2 B_p = 600 p^2 + 300 p + 10$. If the new norm had $p$-BAP, the same conjugation would give $p$-BAP on $cal(F) \( M_p \)$. Applying it with accuracy $1 \/ 2$ to the finite set ${ delta_a : a in A_p }$ would contradict 2. For $p = 1$, this is precisely failure of MAP. ◻
]

=== 2.2 The metric wedge and its retractions <the-metric-wedge-and-its-retractions>

Take disjoint copies of the spaces $M_p$ and identify only their basepoints. Thus, as a set,

$ M = { o } union union.sq.big_(p gt.eq 1) \( M_p \\ { o } \) . $

Keep the distance $d_p$ within each block, and for nonbasepoint points in distinct blocks set

#[#set math.equation(numbering: n => "(2.2)")
 $ d \( x \, y \) = d_p \( x \, o \) + d_q \( y \, o \) #h(2em) \( x in M_p \\ { o } \, med y in M_q \\ { o } \, med p eq.not q \) . $ <eq:wedge-metric>]

These rules define a metric. Symmetry and positivity are immediate. For the triangle inequality, if the endpoints lie in one block, a detour through a point $z$ in another block has length $d_p \( x \, o \) + 2 d_q \( z \, o \) + d_p \( y \, o \) gt.eq d_p \( x \, y \)$. If the endpoints lie in different blocks and the third point lies in one of those blocks, that block’s triangle inequality gives the required bound. A third point in a third block adds twice its distance to $o$, and a third point equal to $o$ gives equality. The remaining case is the triangle inequality within a single block.

The space $M$ is countable. Within a block, distinct points remain at distance at least one; in distinct blocks, nonbasepoint points are at distance at least two. It is also unbounded. To see this using only 2, suppose that $M$ had finite diameter $C_0$. Then $C_0 gt.eq 1$, and every $M_p$ would have diameter at most $C_0$. 4 would give $2 C_0$-BAP on every $cal(F) \( M_p \)$. Choose an integer $p gt.eq max { 1 \, 2 C_0 }$. Applying that property to ${ delta_a : a in A_p }$ with accuracy $1 \/ 2$ would produce a finite-rank operator of norm at most $2 C_0 lt.eq p$ whose error is less than $1 \/ 2$ at every anchor, contrary to 2.

Finally, the closed ball about $o$ of radius $B_1$ contains the countably infinite $1$-separated set $M_1$. If this ball were compact, its cover by open balls of radius $1 \/ 3$ would admit a finite subcover. Each such ball contains at most one point of $M_1$, which is impossible. Thus $M$ is nonproper.

For each $p$, let $i_p : M_p arrow.r M$ be inclusion and let $r_p : M arrow.r M_p$ fix $M_p$ and send all other blocks to $o$. Both are pointed $1$-Lipschitz maps. Inclusion preserves distances. For the retraction, the only case that needs an inequality has $x in M_p$ and $y in M_q \\ { o }$ for $q eq.not p$; then

$ d_p \( r_p \( x \) \, r_p \( y \) \) = d_p \( x \, o \) lt.eq d \( x \, y \) . $

If both points are outside $M_p$, their images coincide, and if both are in $M_p$, their distance is preserved.

We use the elementary linearization property of free spaces; its role in Banach-space geometry is developed in [10] §2. If $u : N arrow.r N'$ is pointed and $1$-Lipschitz, define on finite evaluation combinations

$ hat(u) (sum_x c_x delta_x) = sum_x c_x delta_(u \( x \)) . $

Pullback of pointed scalar tests gives

$ ∥sum_x c_x delta_(u \( x \))∥ & = sup_(f in "Lip"_0 \( N' \)\
parallel f parallel_(upright("Lip")) lt.eq 1) lr(|sum_x c_x \( f compose u \) \( x \)|)\
 & lt.eq ∥sum_x c_x delta_x∥ . $

This inequality makes the definition independent of the representation of the evaluation combination, and it gives a unique continuous linear extension $hat(u) : cal(F) \( N \) arrow.r cal(F) \( N' \)$ of norm at most one. Applying it to $i_p$ and $r_p$ gives contractions

$ I_p : cal(F) \( M_p \) arrow.r cal(F) \( M \) \, #h(2em) P_p : cal(F) \( M \) arrow.r cal(F) \( M_p \) . $

Their composite $P_p I_p$ fixes every evaluation, so it is the identity on $cal(F) \( M_p \)$. In particular, for every $v in cal(F) \( M_p \)$,

$ ∥v∥ = ∥P_p I_p v∥ lt.eq ∥I_p v∥ lt.eq ∥v∥ \; $

thus $I_p$ is an isometry.

=== 2.3 The approximation properties of the wedge <the-approximation-properties-of-the-wedge>

Suppose that $cal(F) \( M \)$ had $lambda$-BAP for some finite $lambda gt.eq 1$. Choose an integer $p gt.eq lambda$ and apply that property with accuracy $1 \/ 2$ to the finite, hence compact, set ${ I_p delta_a : a in A_p }$. Let $U$ be the resulting operator. The compression $P_p U I_p$ has finite rank and norm at most $lambda lt.eq p$, while for every $a in A_p$,

$ ∥P_p U I_p delta_a - delta_a∥ lt.eq ∥U I_p delta_a - I_p delta_a∥ < 1 / 2 . $

This contradicts 2. All blocks and their anchor sets were fixed before $lambda$ and $U$ were chosen.

It remains to prove AP. Kalton’s general theorem [12] Proposition 4.4 gives AP for free spaces over uniformly discrete metric spaces; the wedge structure provides a direct proof here. For $N gt.eq 1$, define $r_(lt.eq N) : M arrow.r M$ to retain the first $N$ blocks and send every other block to $o$. It is pointed and $1$-Lipschitz: distances in the retained part are unchanged, distances in the collapsed part become zero, and (2.2) bounds the image distance for a retained point and a collapsed point. Its linearization is a contractive projection

#[#set math.equation(numbering: n => "(2.3)")
 $ R_N = sum_(p = 1)^N I_p P_p . $ <eq:finite-block-projection>]

The equality follows on each evaluation $delta_x$: the sum retains it when $x$ is in one of the first $N$ blocks and sends it to zero otherwise. The same check gives $R_N^2 = R_N$. Continuity gives both identities on $cal(F) \( M \)$.

Every finite linear combination of evaluations is fixed by $R_N$ for all sufficiently large $N$. These combinations are dense, and $∥"Id" - R_N∥ lt.eq 2$. Thus $R_N u arrow.r u$ for every $u in cal(F) \( M \)$: given a finite evaluation combination $v$ fixed by $R_N$, one has $∥R_N u - u∥ lt.eq 2 ∥u - v∥$. The finite-net argument in the proof of 4, applied now with $∥"Id" - R_N∥ lt.eq 2$, makes this convergence uniform on every norm-compact set.

Now fix a nonempty norm-compact $C subset.eq cal(F) \( M \)$ and $epsilon > 0$. First choose $N gt.eq 1$ such that

$ sup_(u in C) ∥R_N u - u∥ < epsilon \/ 2 . $

For each $1 lt.eq p lt.eq N$, the image $P_p \( C \)$ is compact. By 4, choose a finite-rank operator $T_p : cal(F) \( M_p \) arrow.r cal(F) \( M_p \)$ with $∥T_p∥ lt.eq 2 B_p$ and

$ sup_(u in C) ∥T_p P_p u - P_p u∥ < frac(epsilon, 2 N) . $

The operator

$ T = sum_(p = 1)^N I_p T_p P_p : cal(F) \( M \) arrow.r cal(F) \( M \) $

has finite rank and is bounded, with $∥T∥ lt.eq sum_(p = 1)^N 2 B_p < oo$. By (2.3), for every $u in C$,

$ ∥T u - u∥ lt.eq ∥R_N u - u∥ + sum_(p = 1)^N ∥T_p P_p u - P_p u∥ < epsilon . $

We first chose $N$ so that the contractive projection $R_N$ approximated the whole compact set, and then chose the finitely many block operators. Their combined norm may depend on $C$ and $epsilon$, as AP permits. This proves AP, and the metric properties and the preceding obstruction prove 1 under 2.

=== 2.4 Failure of nonlinear approximability <sec:nonlinear>

We verify the nonlinear consequence stated in the introduction using Kalton’s characterization by nets [13] Theorem 4.4 and p. 1260. Let $X = cal(F) \( M \)$ for the wedge just constructed. It is separable because $M$ is countable, and ${ delta_x : x in M }$ is $1$-separated in $X$. Extend this set to a maximal $1$-separated set $N_X subset.eq X$. Every point of $X$ is then within distance one of $N_X$, so $N_X$ is a net: a separated set within a fixed distance of every point of $X$. If $X$ were approximable, Kalton’s theorem would give one Lipschitz bound $Lambda gt.eq 1$ for maps $g : N_X arrow.r N_X$ with relatively compact range that approximate any prescribed finite subset as closely as desired. Separation makes each such range finite and turns approximation within distance less than one into exact fixing. For a finite $F subset.eq M$ containing $o$, choose $g$ fixing every $delta_x$ with $x in F$. The restriction $x mapsto g \( delta_x \)$ is then a pointed $Lambda$-Lipschitz map from $M$ into $X$. The Banach-valued linearization property of free spaces [12] Lemma 3.2 gives a finite-rank operator $T_F : X arrow.r X$ of norm at most $Lambda$ satisfying $T_F delta_x = g \( delta_x \)$ for all $x in M$. To approximate a compact set, approximate a finite net in it by finite evaluation combinations and put all their supports in $F$. The operator $T_F$ fixes those combinations, and $∥T_F - "Id"∥ lt.eq Lambda + 1$ controls the remaining errors. Thus these operators give BAP, contrary to the preceding obstruction. Hence $X$ is not approximable.

It remains to construct the blocks of 2.

== 3 Colored graphs and the bounded block <sec:blocks>

We now construct the metric space and anchors in 2. The graphs below supply independently colored tree patterns in the empirical limit. We join their disjoint union through finitely many anchors, making the resulting space bounded while keeping the small balls used to count support transitions inside the source graphs. The lower bound for finite-rank operators will use this local limit together with the properties in 6.

We first fix the graph conventions. Multiple edges are distinct edge instances. Each instance has two oriented incidences $e \, macron(e)$, exchanged by reversal, even when the edge is a loop. Thus a loop contributes two to the degree. Write $e : x arrow.r y$ when $x$ and $y$ are the initial and terminal vertices, and let $cal(D) \( x \)$ be the set of outgoing incidences at $x$. A walk is #emph[nonbacktracking] if it never immediately takes the reverse incidence of its preceding step. It may revisit vertices or take the same loop incidence again. Graph distance uses unit edge lengths. A rooted radius-$r$ ball is the induced multigraph on vertices at graph distance at most $r$ from the root; its isomorphism type retains the colors, loops, and edge multiplicities. Throughout the construction, only vertices are points of the metric spaces: edge interiors are not included.

=== 3.1 A deterministic sequence with a colored tree limit <a-deterministic-sequence-with-a-colored-tree-limit>

We use the independent-permutation multigraph model described by Friedman [8] §1, p. 2, in the empirical rooted-neighborhood viewpoint of Benjamini and Schramm [4] §1.2. The precise colored limit and deterministic selection needed here follow from the elementary exploration argument below; no spectral estimate is used.

#thm([Lemma 3.1.])[
  #emph[For every even integer $Delta gt.eq 4$ and positive integer $k$, there is a deterministic sequence of nonempty finite $Delta$-regular multigraphs $G_m$, with vertices colored by ${ 1 \, dots.h \, k }$, such that, for every fixed integer $r gt.eq 0$ and every possible induced rooted colored radius-$r$ type $tau$, the fraction of vertices of $G_m$ whose ball has type $tau$ converges to the probability of $tau$ for the $Delta$-regular tree with independent uniform vertex colors.]
] <lem:local-limit>

#proof[
  On a vertex set of size $N$, choose $Delta \/ 2$ independent uniform permutations $sigma_1 \, dots.h \, sigma_(Delta \/ 2)$. For each pair $\( a \, v \)$, create a distinct undirected edge instance joining $v$ to $sigma_a \( v \)$. For each $a$, every vertex has one incidence directed to its image and one directed to its preimage. A fixed point gives a loop with these two incidences, and a permutation 2-cycle gives two parallel edge instances. The resulting multigraph is therefore exactly $Delta$-regular. Assign independent uniform colors in ${ 1 \, dots.h \, k }$ to its vertices, independently of the permutations.
  Fix $r gt.eq 0$. Explore from a prescribed root in breadth-first order, revealing every permutation image and inverse image at each vertex discovered at distance at most $r$. Record newly discovered vertices at distance $r + 1$ without expanding them. This extra layer reveals every edge of the induced radius-$r$ ball, including edges between boundary vertices. The number of queries and discovered vertices is bounded by a constant $C = C \( Delta \, r \)$, independent of $N$.
  Conditional on all revelations so far, the unrevealed part of each permutation is a uniform bijection between its unused domains and ranges. A query already exposed reuses its edge instance. A genuinely unexposed image or inverse image is uniform among at least $N - C$ unused possibilities, at most $C$ of which are previously discovered vertices. Its conditional probability of such a collision is at most $C \/ \( N - C \)$ when $N > C$. Before a collision, each fresh query adds one vertex and one edge to the exploration tree; reused queries add nothing. In particular, a loop or a second parallel edge is detected when its fresh query hits a known vertex. A union bound over the queries makes the probability of any collision at most $C^2 \/ \( N - C \) = O_(Delta \, r) \( N^(- 1) \)$. Outside this event the induced radius-$r$ ball is the regular-tree ball.
  For two distinct prescribed roots, put both in the initially discovered set and perform the two explorations together. With a larger constant $C \( Delta \, r \)$, the same bound applies, counting a hit on either exploration as a collision. With probability tending to one, the two induced radius-$r$ balls are disjoint tree balls. These events concern only the permutations, so the colors on all their distinct vertices remain independent and uniform.
  For a rooted radius-$r$ colored type $tau$, let $I_v$ indicate that the ball at $v$ has type $tau$, and write
  $ X_(tau \, N) = 1 / N sum_v I_v \, #h(2em) q_tau = bb(P) \( upright("the colored tree ball has type ") tau \) . $
  The one-root exploration gives $bb(E) X_(tau \, N) arrow.r q_tau$. By exchangeability and the two-root exploration,
  $ bb(E) X_(tau \, N)^2 = 1 / N bb(E) I_1 + (1 - 1 / N) bb(E) \( I_1 I_2 \) arrow.r q_tau^2 . $
  This also covers non-tree types, for which $q_tau = 0$. Consequently $"Var" \( X_(tau \, N) \) arrow.r 0$, and each frequency converges in probability to $q_tau$.
  For each $m gt.eq 1$ there are only finitely many possible colored types at radii at most $m$: bounded degree bounds the number of vertices and edge instances in each ball, and the color set is finite. Convergence in probability and a finite union bound show that, for all sufficiently large $N$, with positive probability every one of these frequencies differs from its tree probability by less than $1 \/ m$. Choose such a realization with $N = N_m$ strictly increasing in $m$. For each fixed radius and type the error then tends to zero, which is the asserted deterministic convergence. ◻
]

=== 3.2 Labels, anchors, and the metric <labels-anchors-and-the-metric>

Fix an integer $p gt.eq 1$. We choose the metric scales to meet two requirements of the obstruction. Scalar tests taking values in $\[ - L \, L \]$ automatically satisfy the Lipschitz inequality for opposing values at points separated by at least $2 L$. We make the source-to-anchor attachment length $R$ larger than $2 L$, so paths short enough to require further control cannot cross an attachment edge. The later operator comparison across an attachment has norm error at most $2 p R + 1$. Testing that comparison against a label bump with Lipschitz constant at most $L \/ K$ incurs a loss of at most $L \( 2 p R + 1 \) \/ K$, which must be small compared with its height $L$. Set

#[#set math.equation(numbering: n => "(3.1)")
 $ L = 10 p \, #h(2em) R = 3 L = 30 p = : R_p \, #h(2em) K = 10 p \( R + 1 \) \,\
D = K + 2 L + 5 \, #h(2em) B = 4 R + D \, #h(2em) V = 1 + 4 p B . $ <eq:parameters>]

Substitution gives $B = 300 p^2 + 150 p + 5 = B_p$. These metric scales satisfy $R > 2 L$, $\( 2 p R + 1 \) \/ K lt.eq 1 \/ 5$, and $K + 2 L + 1 = D - 4 < D$. The label coordinates will be capped at $D$. The last inequality leaves room for a label distance below $K$, one source-edge step, and one support step of length at most $2 L$, while still keeping the relevant coordinate below the cap.

The degree and the number of colors serve different purposes. The signed-measure argument will bound total variation by $V = 1 + 4 p B$; choosing a large degree dilutes the loss from at most one exceptional direction per support point. Choose an even integer $Delta gt.eq 4$ with $V \/ Delta < 1 \/ 20$, and put

$ Q = Delta^(2 L + 1) \, #h(2em) H = Delta^(D + 1) . $

The geometry below gives at most $Q$ nearby successors for a support point and at most $H$ label coordinates below the cap, which will bound the possible source colors for that point. A source walk itself has at most $Delta$ choices at each step. Thus larger degree helps the averaging argument but also increases the number of walks in the matching estimate. After fixing $Delta$, choose an integer $k > 2 Delta Q H$, so that the combined matching factor $Delta Q H \/ k$ is less than $1 \/ 2$. All these choices are possible because the preceding quantities are finite. Fix a deterministic sequence $\( G_m \)_(m gt.eq 1)$ from 5 for this $Delta$ and $k$. All constants and the entire sequence are now fixed, before any operator is considered.

Take disjoint copies of the graphs $G_m$, whose vertices we call #emph[source vertices]. For a source vertex $x in G_m$, define $h \( x \) in { 0 \, dots.h \, D }^k$ by

$ h_i \( x \) = min { D \, "dist"_(G_m) \( x \, { upright("vertices of color ") i } \) #scale(x: 120%, y: 120%)[}] #h(2em) \( 1 lt.eq i lt.eq k \) . $

The distance is $+ oo$ if no vertex of color $i$ lies in the component of $x$, so the corresponding coordinate is $D$. These labels are defined using the unit graph distances, before the metric space below is formed.

Let $cal(H) subset.eq { 0 \, dots.h \, D }^k$ be the set of labels realized by all source vertices. For each $v in cal(H)$, add one new vertex $a_v$, called an #emph[anchor], with label $h \( a_v \) = v$. Set $A_p = { a_v : v in cal(H) }$ and $a \( x \) = a_(h \( x \))$. Join each source vertex $x$ to $a \( x \)$ by an edge of length $R$. Join distinct anchors $a_v \, a_w$ by an edge of length $2 R + ∥v - w∥_oo$. Retain every source graph edge with length one. Let $M_p$ be the set of all source vertices and anchors, and let $d_p \( u \, v \)$ be the infimum of lengths of finite paths joining $u$ to $v$ in this weighted graph, allowing the zero-edge path when $u = v$. Choose any anchor $o$ as basepoint; an anchor exists because every $G_m$ is nonempty. 1 shows how vertices sharing a label use one anchor.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.55), [#text(size: 9pt)[$x$]], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.55), [#text(size: 9pt)[$x'$]], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, 0), [#box(inset: 0.1411cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$a_v$]]])])
  content((6, 0), [#box(inset: 0.1411cm, radius: 1pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$a_w$]]])])
  content((8, 0), [#text(size: 9pt)[$y$]], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0.55), (1.724, 0.07591), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1, 0.275), [#text(size: 9pt)[$R$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.55), (1.724, -0.07591), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1, -0.275), [#text(size: 9pt)[$R$]], anchor: "north", padding: 0.1176cm)
  line((2.276, 0), (5.724, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4, 0), [#text(size: 9pt)[$2R+ \|v-w \|_ infinity$]], anchor: "south", padding: 0.1176cm)
  line((6.276, 0), (8, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7, 0), [#text(size: 9pt)[$R$]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The added edges when $x \, x'$ share label $v$ and $y$ has a different label $w$. The source vertices may belong to different graphs. Lines represent weighted edges between vertices; their interiors are not points of $M_p$. Routes through anchors can shorten long distances within a source graph. ],
) <fig:anchors>

#thm([Lemma 3.2.])[
  #emph[The preceding construction has the following properties.]
  + #emph[$\( M_p \, d_p \, o \)$ is a countably infinite pointed metric space with separation at least one and diameter at most $B = B_p$. The anchor set $A_p$ is finite and contains $o$. Each source edge has endpoints at $d_p$-distance at most one.]
  + #emph[The label map $h : M_p arrow.r { 0 \, dots.h \, D }^k$ is 1-Lipschitz for the sup norm. If a source vertex $x$ has color $i$, then $h_i \( x \) = 0$, and $h \( a \( x \) \) = h \( x \)$.]
  + #emph[For every source vertex $x$ and every anchor $a$, 
$ d_p \( x \, a \) gt.eq R = R_p \, #h(2em) d_p \( x \, a \( x \) \) = R . $

 In particular, $d_p \( x \, o \) gt.eq R_p = 30 p$.]
  + #emph[Every closed $d_p$-ball of radius $2 L$ has at most $Q$ points. For every $t in M_p$, at most $H$ coordinates of $h \( t \)$ are strictly below $D$.]
] <lem:block-geometry>

#proof[
  There are at most $\( D + 1 \)^k$ possible labels, so $A_p$ is finite. The disjoint union of the nonempty finite graphs is countably infinite, and adjoining finitely many anchors preserves that cardinality. The added edges connect all vertices. Every edge length is a positive integer: this is clear for source and attachment edges, and the sup distance between two integer labels is an integer. For distinct endpoints the lengths of connecting finite paths therefore form a nonempty subset of the positive integers, which has a least element. Thus the infimum defining $d_p$ is attained. Symmetry and the triangle inequality follow from reversal and concatenation of paths, and distinct points have distance at least one. This also justifies using a shortest path despite the possible infinite degrees of anchors. A source edge itself gives distance at most one between its endpoints; for a loop the distance is zero.
  The sup distance between any two labels is at most $D$. Two source vertices with different anchors can be joined by their two attachment edges and one anchor edge, with total length at most
  $ R + \( 2 R + D \) + R = 4 R + D = B . $
  If their anchors agree, the route through that single anchor has length $2 R$. A source vertex and an anchor have distance at most $3 R + D$, and two anchors have distance at most $2 R + D$, with the coincident-anchor cases shorter. These bounds prove the diameter assertion. Any path from a source vertex to an anchor must enter the anchor set for the first time along an attachment edge of length $R$. Hence $d_p \( x \, a \) gt.eq R$ for every anchor $a$. The edge from $x$ to $a \( x \)$ realizes length $R$, proving (iii).
  Across a source edge, the distances to a fixed color class differ by at most one whenever that color is present in the component: append the edge to a path realizing either distance. Capping at $D$ preserves this bound. If the color is absent from the component, both coordinates are $D$. Thus adjacent source labels have sup distance at most one. Labels agree across an attachment edge, while each anchor edge has length at least the sup distance between its endpoint labels. Summing these inequalities along any path gives
  $ ∥h \( u \) - h \( v \)∥_oo lt.eq d_p \( u \, v \) . $
  The own-color coordinate is zero by its definition, and anchor labels were copied from their assigned vertices. This proves (ii), including paths that use anchor shortcuts.
  Every added edge has length at least $R = 3 L > 2 L$. A shortest path of length at most $2 L$ therefore uses only source edges. The closed radius-$2 L$ ball about an anchor is a singleton, and that about a source vertex is contained in its radius-$2 L$ ball in its own source graph. In a $Delta$-regular multigraph, every vertex at graph distance at most $s$ is reached by a walk of some length at most $s$, and there are at most $Delta^t$ walks of length $t$ from a fixed vertex. Loops, parallel edges, and repeated vertices may cause several counted walks to reach the same vertex. Therefore every such metric ball has at most
  $ sum_(t = 0)^(2 L) Delta^t lt.eq Delta^(2 L + 1) = Q $
  points. The inequality follows from the geometric sum formula and $Delta gt.eq 2$.
  Finally, if $h_i \( x \) < D$ at a source vertex, its integer graph distance to a vertex of color $i$ is at most $D - 1$. Witnesses for distinct colors are distinct vertices, so the number of such coordinates is at most
  $ sum_(t = 0)^(D - 1) Delta^t lt.eq Delta^(D + 1) = H . $
  Every anchor copies a source label, giving the same bound at all points of $M_p$. This proves (iv). ◻
]

Part (iii) also gives a direct geometric proof that the wedge in 2 is unbounded. Each block contains a source vertex, and the wedge preserves its distance from the common basepoint, which is at least $R_p = 30 p$.

The construction has now fixed $M_p$, its finite anchor set, and the entire graph sequence independently of any operator. The ball bound gives at most $Q$ nearby successors for any point in any eventual finite support. The label bound gives a second restriction: if a source vertex $x$ has color $i$ and $∥h \( x \) - h \( t \)∥_oo < D$, then $h_i \( t \) < D$ because $h_i \( x \) = 0$. For each fixed $t$, proximity of labels therefore permits at most $H$ source colors. Both restrictions hold for every possible support, including one containing anchors or vertices from several source graphs.

== 4 Finite-rank operators and signed measures <sec:operators>

Fix an integer $p gt.eq 1$ and the block $\( M_p \, d_p \, o \)$ constructed in 6, with its anchors $A_p$, label map $h$, and parameters from (3.1). We now begin the proof of 2. An operator that approximates the anchors will give a signed measure at each graph vertex. The measure will have bounded total variation and a large integral against a bump determined by that vertex’s label. These two estimates are the inputs for the graph argument.

=== 4.1 A common finite support <a-common-finite-support>

Finite rank does not imply that the range is supported on finitely many evaluations. The following perturbation supplies such a support while retaining the bounds needed later.

#thm([Lemma 4.1.])[
  #emph[Suppose that a bounded finite-rank linear operator $T_0 : cal(F) \( M_p \) arrow.r cal(F) \( M_p \)$ satisfies $∥T_0∥ lt.eq p$ and 
$ ∥T_0 delta_a - delta_a∥ < 1 / 2 #h(2em) \( a in A_p \) . $

 Then there are a finite set $S subset.eq M_p$ containing $o$ and a bounded finite-rank linear operator $T : cal(F) \( M_p \) arrow.r cal(F) \( M_p \)$ such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ T cal(F) \( M_p \) subset.eq "span" { delta_j : j in S } \, #h(2em) ∥T∥ lt.eq 2 p \,\
∥T delta_a - delta_a∥ < 1 #h(2em) \( a in A_p \) . $ <eq:operator-bounds>]

]
] <lem:finite-support>

#proof[
  If $T_0 = 0$, take $T = 0$ and $S = { o }$; the assumed anchor errors already give the required bounds. Otherwise choose a basis $v_1 \, dots.h \, v_r$ of the range of $T_0$. The coordinate functionals on this finite-dimensional range are bounded. Composing them with $T_0$ gives bounded functionals $phi.alt_i$ on $cal(F) \( M_p \)$ such that
  $ T_0 u = sum_(i = 1)^r phi.alt_i \( u \) v_i . $
  Choose $0 < eta < min { p \, 1 \/ \( 2 B \) }$. Finite linear combinations of evaluations are dense in $cal(F) \( M_p \)$, so we can choose such combinations $w_i$ with
  $ sum_(i = 1)^r ∥phi.alt_i∥ ∥w_i - v_i∥ < eta . $
  The operator $T u = sum_i phi.alt_i \( u \) w_i$ then satisfies $∥T - T_0∥ < eta$. Let $S$ be the union of ${ o }$ and the finite supports of the chosen combinations $w_i$. Its range has the asserted support, and $∥T∥ lt.eq p + eta < 2 p$. Since $∥delta_a∥ = d_p \( a \, o \) lt.eq B$, for every $a in A_p$ we also have
  $ ∥T delta_a - delta_a∥ lt.eq ∥T_0 delta_a - delta_a∥ + ∥T - T_0∥ ∥delta_a∥ < 1 / 2 + eta B < 1 . $
  ◻
]

=== 4.2 Measures detected by label bumps <measures-detected-by-label-bumps>

For a source vertex $x$, define a function on all of $M_p$ by

#[#set math.equation(numbering: n => "(4.2)")
 $ b_x \( t \) = L (1 - ∥h \( x \) - h \( t \)∥_oo / K)_(+) \, #h(2em) s_(+) = max { s \, 0 } . $ <eq:bump>]

The label map is $1$-Lipschitz by 6. Hence $b_x$ takes values in $\[ 0 \, L \]$, has Lipschitz constant at most $L \/ K lt.eq 1$, and equals $L$ at the anchor $a \( x \)$, whose label is $h \( x \)$. The small Lipschitz constant will let us compare $T delta_x$ with the nearby anchor evaluation even when $∥T∥$ is as large as $2 p$.

For a signed measure $nu$ on a finite set $S$, write

$ \| nu \| \( E \) = sum_(j in E) \| nu \( { j } \) \| quad \( E subset.eq S \) \, #h(2em) ∥nu∥_(upright("TV")) = \| nu \| \( S \) . $

#thm([Lemma 4.2.])[
  #emph[Let $S subset.eq M_p$ be finite and contain $o$, and let $T : cal(F) \( M_p \) arrow.r cal(F) \( M_p \)$ be a bounded linear operator satisfying (4.1). There is a family $\( mu_x \)_(x in M_p)$ of signed measures on $S$, each of total mass one, such that 
#[#set math.equation(numbering: n => "(4.3)")
 $ integral g thin d mu_x = \( T delta_x \) \( g - g \( o \) \) + g \( o \) $ <eq:affine-pairing>]

 for every real Lipschitz function $g$ on $M_p$. They satisfy 
#[#set math.equation(numbering: n => "(4.4)")
 $ ∥mu_x∥_(upright("TV")) lt.eq V = 1 + 4 p B #h(2em) \( x in M_p \) \, $ <eq:tv-bound>]

 and, for every source vertex $x$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ integral b_x thin d mu_x gt.eq frac(3 L, 4) . $ <eq:bump-mass>]

]
] <lem:measure-bounds>

#proof[
  For each $x$, express $T delta_x = sum_(j in S \\ { o }) c_x \( j \) delta_j$ and set
  $ mu_x \( { j } \) = c_x \( j \) quad \( j eq.not o \) \, #h(2em) mu_x \( { o } \) = 1 - sum_(j in S \\ { o }) c_x \( j \) . $
  The empty sum is zero when $S = { o }$. These masses sum to one, and
  $ integral g thin d mu_x = sum_(j in S \\ { o }) c_x \( j \) #scale(x: 120%, y: 120%)[\(] g \( j \) - g \( o \) #scale(x: 120%, y: 120%)[\)] + g \( o \) \, $
  which is (4.3).
  To estimate the total variation, let $g$ take the sign of $mu_x \( { j } \)$ at each $j in S$ and be zero off $S$, using $"sign" \( 0 \) = 0$. Its values lie in $\[ - 1 \, 1 \]$, so separation by one gives $parallel g parallel_(upright("Lip")) lt.eq 2$. Thus
  $ ∥mu_x∥_(upright("TV")) & = integral g thin d mu_x\
 & = \( T delta_x \) \( g - g \( o \) \) + g \( o \) lt.eq 2 ∥T delta_x∥ + 1 lt.eq 1 + 4 p B . $
  The last inequality uses $∥T∥ lt.eq 2 p$ and $∥delta_x∥ = d_p \( x \, o \) lt.eq B$. In particular, the estimate includes the mass at the basepoint.
  For a source vertex $x$, 6 gives $d_p \( x \, a \( x \) \) lt.eq R$. The anchor bound in (4.1) therefore implies
  $ ∥T delta_x - delta_(a \( x \))∥ & lt.eq ∥T \( delta_x - delta_(a \( x \)) \)∥ + ∥T delta_(a \( x \)) - delta_(a \( x \))∥\
 & lt.eq 2 p R + 1 . $
  Since $b_x \( a \( x \) \) = L$, the affine pairing gives
  $ integral b_x thin d mu_x - L & = \( T delta_x - delta_(a \( x \)) \) \( b_x - b_x \( o \) \)\
 & gt.eq - L / K \( 2 p R + 1 \) . $
  Here $\( 2 p R + 1 \) \/ K lt.eq 1 \/ 5 < 1 \/ 4$, because $K = 10 p \( R + 1 \)$ and $p gt.eq 1$. This proves (4.5). ◻
]

The measures may have coefficients of either sign. Their common total mass means that $mu_x - mu_y$ annihilates constants, so a scalar test can be centered at $o$ without changing its pairing with this difference. Signed representations also occur in Lipschitz almost extension; [15] Proposition 6 and Remark 7 distinguishes them from the restrictions imposed by probability measures. Here the total-variation bound is what permits arbitrary signs in $T$.

== 5 Rare matched walks and continuation records <sec:walks>

Fix a finite set $S subset.eq M_p$ containing $o$. Its points will serve as states, and its labels and metric distances remain fixed throughout the following argument. The set may be the support obtained from an operator in 7; its points may lie in any of the graphs or among the anchors. We will select a graph only after $S$ has been fixed.

Recall the incidence convention from 3. Each edge instance has two distinct oriented incidences $e \, macron(e)$, exchanged by reversal, including when the edge is a loop. A loop therefore counts twice toward degree. Write $e : x arrow.r y$ and let $cal(D) \( x \)$ be the set of $Delta$ outgoing incidences at $x$. A walk is #emph[nonbacktracking] if it never immediately takes the reverse incidence of its preceding step.

In the application to 8, we will compare the measures at the ends of an incidence $e : x arrow.r y$ using a $1$-Lipschitz function that agrees with $b_x$ on one subset of $S$ and with $- b_y$ on another. This section supplies the combinatorial rule for choosing those subsets from the fixed graph sequence and the labels and distances on $S$.

A graph vertex $x$ and a state $j in S$ are #emph[compatible] when

$ ∥h \( x \) - h \( j \)∥_oo lt.eq K + 2 L + 1 = D - 4 . $

A nonbacktracking walk $x_0 \, e_1 \, x_1 \, dots.h \, e_t \, x_t$ in one graph $G_m$ is #emph[matched] if there are states $j_0 \, dots.h \, j_t in S$ such that $\( x_s \, j_s \)$ is compatible for every $s$ and

$ d_p \( j_(s - 1) \, j_s \) lt.eq 2 L #h(2em) \( 1 lt.eq s lt.eq t \) . $

Both the states and the source vertices may repeat. For example, a return along a different parallel edge is allowed; only the reverse of the preceding incidence is forbidden.

The compatibility threshold allows for a label distance below $K$ where a bump is positive, one source-edge step of length at most one, and one state step of length at most $2 L$. The inequality $K + 2 L + 1 < D$ will also restrict the possible source colors.

=== 5.1 A long match is rare <a-long-match-is-rare>

Each state has at most $Q$ possible successors, by the radius-$2 L$ ball bound in 6, while a graph walk encounters many possible colors. We use this disparity to bound the fraction of roots from which a long matched walk starts.

#thm([Lemma 5.1.])[
  #emph[For a fixed integer $n gt.eq 1$, let $beta_m$ be the fraction of vertices of $G_m$ from which a matched walk of length $n$ starts. Then 
#[#set math.equation(numbering: n => "(5.1)")
 $ limsup_(m arrow.r oo) beta_m lt.eq \| S \| H / k (frac(Delta Q H, k))^n . $ <eq:bad-fraction>]

 Consequently one can choose $n gt.eq 2$ and then $m$ so that $beta_m < 1 \/ \( 20 V \)$.]
] <lem:rare-walks>

#proof[
  For $j in S$, set
  $ C_j = { i : h_i \( j \) < D } . $
  6 gives $\| C_j \| lt.eq H$. If $x$ has color $i$ and is compatible with $j$, then $h_i \( x \) = 0$ implies
  $ h_i \( j \) lt.eq K + 2 L + 1 = D - 4 < D . $
  Thus the color of $x$ belongs to $C_j$. This is only a necessary condition for compatibility; it avoids any independence assertion about the full labels.
  Consider the weaker event that a nonbacktracking length-$n$ walk $x_0 \, e_1 \, x_1 \, dots.h \, e_n \, x_n$ from the root has states $j_0 \, dots.h \, j_n in S$ with $d_p \( j_(s - 1) \, j_s \) lt.eq 2 L$ for $1 lt.eq s lt.eq n$ and with the color of $x_s$ in $C_(j_s)$ for $0 lt.eq s lt.eq n$. Its occurrence is determined by the induced colored radius-$n$ ball: every traversed vertex and edge lies in that ball, including loops and parallel edge instances. There are only finitely many such rooted types. With $S$ and $n$ fixed, the sets $C_j$ and the transition relation are fixed, so the event selects the same finite union of these types for every $m$. 5 gives convergence for every type and therefore for this particular finite union. Its empirical frequency converges to its probability on the independently colored $Delta$-regular tree. The support may have been chosen using the entire deterministic graph sequence: once fixed, it only selects the types in the union. No random colors are conditioned on the support.
  On the tree there are at most $Delta^n$ nonbacktracking walks of length $n$ from the root, each visiting $n + 1$ distinct vertices. For each state $j$, its allowed successors lie in $S ∩ overline(B)_(d_p) \( j \, 2 L \)$, which has at most $Q$ points. Thus there are at most $\| S \| Q^n$ allowed state sequences. For a fixed walk and state sequence, independence of the colors gives probability at most $\( H \/ k \)^(n + 1)$ for all required memberships. Repeated states and overlapping sets $C_j$ do not affect this product, because the source vertices on the tree are distinct. A union bound gives
  $ Delta^n \| S \| Q^n \( H \/ k \)^(n + 1) = \| S \| \( H \/ k \) \( Delta Q H \/ k \)^n . $
  Every matched walk satisfies the weaker event, proving (5.1). Finally, $k > 2 Delta Q H$ gives $Delta Q H \/ k < 1 \/ 2$. Choose $n gt.eq 2$ so that the right-hand side of (5.1) is less than $1 \/ \( 40 V \)$, and then choose $m$ with $beta_m < 1 \/ \( 20 V \)$. ◻
]

#prodef([Remark 5.2.])[
  (Adding roots with non-tree neighborhoods).  One may enlarge the set counted by $beta_m$ to include every root whose induced radius-$\( n + 1 \)$ neighborhood is not a tree. For fixed $n$, let $gamma_m$ be the fraction of roots with such a neighborhood and $tilde(beta)_m$ the enlarged fraction. Then $beta_m lt.eq tilde(beta)_m lt.eq beta_m + gamma_m$, while the local limit gives $gamma_m arrow.r 0$. Thus (5.1) remains valid with $tilde(beta)_m$ in place of $beta_m$, and the same successive choices of $n gt.eq 2$ and sufficiently large $m$ give $tilde(beta)_m < 1 \/ \( 20 V \)$.
] <rem:non-tree-bad-set>

=== 5.2 At most one exceptional direction per state <at-most-one-exceptional-direction-per-state>

Fix $n gt.eq 2$ and one graph $G = G_m$. Call a vertex #emph[bad] if a matched walk of length $n$ starts there, and #emph[good] otherwise. The next argument is deterministic. At a good vertex it uses the absence of long matched walks to select at most one direction for each state.

A related comparison of nonbacktracking continuation lengths appears in Ben-David, Childs, Gilyén, Kretschmer, Podder, and Wang [3] §6.1.2, Algorithm 6.1 and Lemma 6.3. Their probabilistic graph algorithm uses such lengths to select parent directions, and their consistency lemma excludes an incompatible pair of choices by symmetric length inequalities. Here the records are deterministic and indexed by support states; the incidence formulation also includes loops and parallel edges. The argument below is self-contained.

For a good vertex $x$, an incidence $e in cal(D) \( x \)$, and a state $j in S$, let $cal(L)_x \( e \, j \)$ be the set of positive integer lengths of matched walks starting through $e$ with initial state $j$. Define

$ r_x \( e \, j \) = max #scale(x: 120%, y: 120%)[\(] { 0 } union cal(L)_x \( e \, j \) #scale(x: 120%, y: 120%)[\)] . $

A matched walk of length at least $n$ has a matched prefix of length $n$, so $cal(L)_x \( e \, j \) subset.eq { 1 \, dots.h \, n - 1 }$. Thus the maximum is well-defined. The value zero means only that no positive-length walk exists; it makes no assertion about compatibility of $\( x \, j \)$.

Declare $e$ #emph[exceptional at $\( x \, j \)$] if its record is strictly greater than every other outgoing record at $\( x \, j \)$. There is at most one such incidence; if largest records are tied, there is none. At a bad vertex, declare all outgoing incidences exceptional at every state. For an incidence $e : x arrow.r y$, set

$ E_e = { j in S : e upright(" is exceptional at ") \( x \, j \) } . $

#thm([Lemma 5.3.])[
  #emph[Let $e : x arrow.r y$ be an incidence of $G$ and let $j \, j' in S$ be states. If $\( x \, j \)$ and $\( y \, j' \)$ are compatible and $d_p \( j \, j' \) lt.eq 2 L$, then $j in E_e$ or $j' in E_(macron(e))$.]
] <lem:exceptional-directions>

#proof[
  If either endpoint is bad, the conclusion follows from the definition. Suppose both are good, and put
  $ A_x = max_(g in cal(D) \( x \) \\ { e }) r_x \( g \, j \) \, #h(2em) A_y = max_(f in cal(D) \( y \) \\ { macron(e) }) r_y \( f \, j' \) . $
  The maxima are over nonempty finite sets, since $Delta gt.eq 4$. If $A_y > 0$, choose a walk realizing it and prepend $e$, with the state transition $j$ to $j'$. The old first incidence is not $macron(e)$, so the resulting walk is nonbacktracking and matched. If $A_y = 0$, the edge alone, with states $j \, j'$, is a matched walk. The same argument after reversing $e$ therefore gives both inequalities
  #[#set math.equation(numbering: n => "(5.2)")
   $ r_x \( e \, j \) gt.eq 1 + A_y \, #h(2em) r_y \( macron(e) \, j' \) gt.eq 1 + A_x . $ <eq:record-inequalities>]
  If neither incidence were exceptional, their records would be at most $A_x$ and $A_y$, respectively. These inequalities would force
  $ A_x gt.eq 1 + A_y gt.eq 2 + A_x \, $
  a contradiction. ◻
]

The proof uses incidence identities, so it also applies to loops and parallel edges. It allows repeated states and vertex revisits, and using the edge by itself covers zero records. The conclusion will let us prescribe opposite scalar values at the two endpoints: whenever nearby states could receive opposing nonzero values, at least one of their prescriptions must be discarded.

== 6 Scalar tests and incidence averaging <sec:tests>

Keep the finite state set $S$, the integer $n gt.eq 2$, and the graph $G = G_m$ from the continuation construction in 5. For an incidence $e : x arrow.r y$, we will prescribe the bump $b_x$ on states outside $E_e$ and the negative bump $- b_y$ on states outside $E_(macron(e))$. The bump bounds handle pairs within one set and cross pairs at distance at least $2 L$. The exceptional-direction lemma handles closer cross pairs, making the combined prescribed values $1$-Lipschitz.

#thm([Lemma 6.1.])[
  #emph[For every incidence $e : x arrow.r y$ of $G$, there is a $1$-Lipschitz function $f_e : M_p arrow.r \[ - L \, L \]$ such that 
$ f_e \( j \) = b_x \( j \) quad \( j in S \\ E_e \) \, #h(2em) f_e \( j' \) = - b_y \( j' \) quad \( j' in S \\ E_(macron(e)) \) . $

]
] <lem:edge-test>

#proof[
  Within either prescription set, the Lipschitz inequality follows from the bump bound. Across the two sets, the difference between the prescribed values at $j \, j'$ is $b_x \( j \) + b_y \( j' \) lt.eq 2 L$. Thus the inequality holds whenever $d_p \( j \, j' \) gt.eq 2 L$.
  Suppose $d_p \( j \, j' \) < 2 L$ and $b_x \( j \) > 0$. Then $∥h \( x \) - h \( j \)∥_oo < K$. Since $d_p \( x \, y \) lt.eq 1$ and $h$ is $1$-Lipschitz, 6 gives
  $ ∥h \( y \) - h \( j' \)∥_oo & lt.eq ∥h \( y \) - h \( x \)∥_oo + ∥h \( x \) - h \( j \)∥_oo + ∥h \( j \) - h \( j' \)∥_oo\
 & < 1 + K + 2 L . $
  The pairs $\( x \, j \)$ and $\( y \, j' \)$ are compatible, and their state distance is at most $2 L$. By 11, both prescriptions cannot be present. The same reasoning applies when $b_y \( j' \) > 0$. Hence whenever two states, one from each prescription set, are less than $2 L$ apart, both prescribed values are zero. This proves the remaining Lipschitz inequalities and, by taking $j = j'$, consistency on the intersection of the two prescription sets.
  Let $P subset.eq S$ be their union and $v : P arrow.r \[ - L \, L \]$ the resulting $1$-Lipschitz data. If $P$ is empty, take $f_e = 0$. Otherwise the classical scalar Lipschitz extension principle [14] can be realized for these finite data by the following formula, followed by clipping:
  $ F \( z \) = min_(j in P) { v \( j \) + d_p \( z \, j \) } \, #h(2em) f_e \( z \) = max { - L \, min { L \, F \( z \) } } . $
  For $z in P$, the Lipschitz inequalities for $v$ give $F \( z \) = v \( z \)$. The triangle inequality gives $F \( z \) lt.eq F \( w \) + d_p \( z \, w \)$ and the same inequality with $z \, w$ exchanged. Thus $F$ is $1$-Lipschitz. Clipping to $\[ - L \, L \]$ preserves both the Lipschitz bound and the prescribed values. ◻
]

=== 6.1 The finite anchor obstruction <the-finite-anchor-obstruction>

Each test compares the signed measures at the ends of its incidence. The comparison loses variation only on exceptional states. At a good vertex each state is exceptional in at most one of the $Delta$ directions, so averaging these losses will give a bound independent of the cardinality of $S$.

#proof[
  For the chosen integer $p$, 6 supplies the countably infinite block, its separation and diameter bounds, and the finite anchor set $A_p$. Suppose that a bounded finite-rank operator $T_0$ of norm at most $p$ has error less than $1 \/ 2$ on every anchor. Choose $T \, S$ by 7 and the measures $mu_x$ by 8. With this state set fixed, choose $n gt.eq 2$ and then $G = G_m$ by 9, so that the fraction $beta$ of bad vertices is less than $1 \/ \( 20 V \)$. Apply 11 and 12 to these choices.
  For an incidence $e : x arrow.r y$, the test prescriptions imply
  #[#set math.equation(numbering: n => "(6.1)")
   $ integral f_e thin d \( mu_x - mu_y \) & gt.eq integral b_x thin d mu_x + integral b_y thin d mu_y\
 & quad - 2 L #scale(x: 120%, y: 120%)[\(] \| mu_x \| \( E_e \) + \| mu_y \| \( E_(macron(e)) \) #scale(x: 120%, y: 120%)[\)]\
 & gt.eq frac(3 L, 2) - 2 L #scale(x: 120%, y: 120%)[\(] \| mu_x \| \( E_e \) + \| mu_y \| \( E_(macron(e)) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:edge-lower>]
  Indeed, $f_e - b_x$ vanishes on $S \\ E_e$ and has absolute value at most $2 L$ elsewhere; the same statement holds for $f_e + b_y$ and $E_(macron(e))$. Integration against the variation measures bounds both errors, regardless of the signs of the coefficients.
  On the other hand, the affine pairing (4.3) gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ lr(|integral f_e thin d \( mu_x - mu_y \)|) = lr(|\( T \( delta_x - delta_y \) \) \( f_e - f_e \( o \) \)|) lt.eq 2 p \, $ <eq:edge-upper>]
  because $∥T∥ lt.eq 2 p$, $parallel f_e parallel_(upright("Lip")) lt.eq 1$, and $∥delta_x - delta_y∥ = d_p \( x \, y \) lt.eq 1$. For a loop, $x = y$ and the left side is zero.
  Choose a uniform vertex $x$ of $G$ and then a uniform incidence $e in cal(D) \( x \)$. At a good vertex each fixed state occurs in at most one exceptional set. Consequently
  $ 1 / Delta sum_(e in cal(D) \( x \)) \| mu_x \| \( E_e \) lt.eq 1 / Delta sum_(j in S) \| mu_x \( { j } \) \| lt.eq V / Delta . $
  At a bad vertex the average is at most $V$. Therefore
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] \| mu_x \| \( E_e \) #scale(x: 120%, y: 120%)[\]] lt.eq V / Delta + V beta < 1 / 10 . $ <eq:average-error>]
  The $Delta$-regularity of $G$ makes this sampling uniform on all oriented incidences. Reversal preserves that uniform distribution, exchanging the two incidences of a loop as well. Hence $bb(E) #scale(x: 120%, y: 120%)[\[] \| mu_y \| \( E_(macron(e)) \) #scale(x: 120%, y: 120%)[\]] < 1 \/ 10$ too. Taking expectations in (6.1) and using (6.2) forces
  $ 2 p > frac(3 L, 2) - frac(4 L, 10) = frac(11 L, 10) = 11 p \, $
  a contradiction.
  The construction fixed $p$, all constants, the entire graph sequence, $M_p$, and $A_p$ before $T_0$ was considered. Only after $T_0$ produced the finite support $S$ were $n$ and then $m$ chosen. Thus the same finite anchor set defeats every operator in the stated class, proving 2. ◻
]

2 now supplies the hypothesis used in 2. The wedge construction there therefore proves 1, and the coefficient identification proves 3. 2.4 then gives failure of nonlinear approximability for the same space $cal(F) \( M \)$.

#prodef([Remark 6.2.])[
  (A sufficient criterion for the anchor obstruction).  The preceding proof gives the same finite-anchor obstruction for any data satisfying the following assumptions. Fix an integer $p gt.eq 1$ and retain the parameter choices $L \, R \, K \, D \, B \, V \, Delta \, Q \, H \, k$ of 3, including (3.1), and the incidence convention of that section.
  + $\( N \, d \, o \)$ is a countable pointed metric space of separation at least one and diameter at most $B$, and $A subset.eq N$ is finite and contains $o$.
  + The $G_m$ are nonempty finite $Delta$-regular multigraphs with disjoint vertex sets in $N$ and colors in ${ 1 \, dots.h \, k }$. Edge endpoints have $d$-distance at most one. For every fixed integer $r gt.eq 0$, the empirical distributions of their induced rooted radius-$r$ colored balls converge to the corresponding distribution on the $Delta$-regular tree with independent uniform colors, as in 5.
  + The map $h : N arrow.r { 0 \, dots.h \, D }^k$ is $1$-Lipschitz for the sup norm. Every graph vertex $x$ of color $i$ satisfies $h_i \( x \) = 0$ and has an anchor $a \( x \) in A$ with $h \( a \( x \) \) = h \( x \)$ and $d \( x \, a \( x \) \) lt.eq R$.
  + Every closed $d$-ball of radius $2 L$ has at most $Q$ points, and for every $t in N$ at most $H$ coordinates of $h \( t \)$ are strictly below $D$.
  If these data are fixed before $T_0$, every bounded finite-rank real linear operator $T_0 : cal(F) \( N \) arrow.r cal(F) \( N \)$ with $∥T_0∥ lt.eq p$ satisfies
  $ max_(a in A) ∥T_0 delta_a - delta_a∥ gt.eq 1 / 2 . $
  Indeed, the support perturbation and signed-measure estimates use only the stated metric, anchor, and label bounds, while the rare-walk, continuation, scalar-test, and averaging steps use only those bounds, the stated graph limit, and the incidence convention.
] <rem:abstract-obstruction>

#heading(level: 1)[References]
#bibitem([1])[F.~Albiac, J.~L. Ansorena, M.~Cúth, and M.~Doucha, #emph[Lipschitz free $p$-spaces for $0 < p < 1$], Israel Journal of Mathematics #strong[240] (2020), no.~1, 65--98. #link("https://doi.org/10.1007/s11856-020-2061-5")[doi:10.1007/s11856-020-2061-5]. #link("https://arxiv.org/abs/1811.01265v2")[Preprint: arXiv:1811.01265v2].]
#bibitem([2])[R.~F. Arens and J.~Eells, Jr., #emph[On embedding uniform and topological spaces], Pacific Journal of Mathematics #strong[6] (1956), no.~3, 397--403. #link("https://doi.org/10.2140/pjm.1956.6.397")[doi:10.2140/pjm.1956.6.397].]
#bibitem([3])[S.~Ben-David, A.~M. Childs, A.~Gilyén, W.~Kretschmer, S.~Podder, and D.~Wang, #emph[Symmetries, graph properties, and quantum speedups], SIAM Journal on Computing #strong[53] (2024), no.~6, FOCS20-368--FOCS20-415. #link("https://doi.org/10.1137/23M1573975")[doi:10.1137/23M1573975].]
#bibitem([4])[I.~Benjamini and O.~Schramm, #emph[Recurrence of distributional limits of finite planar graphs], Electronic Journal of Probability #strong[6] (2001), paper no.~23, 1--13. #link("https://doi.org/10.1214/EJP.v6-96")[doi:10.1214/EJP.v6-96].]
#bibitem([5])[A.~Brudnyi and Yu.~Brudnyi, #emph[Metric spaces with linear extensions preserving Lipschitz condition], American Journal of Mathematics #strong[129] (2007), no.~1, 217--314. #link("https://doi.org/10.1353/ajm.2007.0000")[doi:10.1353/ajm.2007.0000]. #link("https://arxiv.org/abs/math/0404304v4")[Preprint: arXiv:math/0404304v4].]
#bibitem([6])[M.~Cúth and O.~F.~K. Kalenda, #emph[Lipschitz-free spaces over uniformly discrete metric spaces are 3-Schur], preprint (2026), version~1, April~2, 2026. #link("https://arxiv.org/abs/2604.01875v1")[arXiv:2604.01875v1].]
#bibitem([7])[A. Dalet, #emph[Free spaces over some proper metric spaces], Mediterranean Journal of Mathematics #strong[12] (2015), 973--986. #link("https://doi.org/10.1007/s00009-014-0455-5")[doi:10.1007/s00009-014-0455-5]. #link("https://arxiv.org/abs/1404.3939v3")[Preprint: arXiv:1404.3939v3].]
#bibitem([8])[J.~Friedman, #emph[A proof of Alon's second eigenvalue conjecture and related problems], preprint (2004), version~1, May~5, 2004. #link("https://arxiv.org/abs/cs/0405020v1")[arXiv:cs/0405020v1].]
#bibitem([9])[G.~Godefroy, #emph[A survey on Lipschitz-free Banach spaces], Commentationes Mathematicae #strong[55] (2015), no.~2, 89--118. #link("https://doi.org/10.14708/cm.v55i2.1104")[doi:10.14708/cm.v55i2.1104].]
#bibitem([10])[G.~Godefroy and N.~J. Kalton, #emph[Lipschitz-free Banach spaces], Studia Mathematica #strong[159] (2003), no.~1, 121--141. #link("https://doi.org/10.4064/sm159-1-6")[doi:10.4064/sm159-1-6].]
#bibitem([11])[G. Godefroy and N. Ozawa, #emph[Free Banach spaces and the approximation properties], Proceedings of the American Mathematical Society #strong[142] (2014), 1681--1687. #link("https://doi.org/10.1090/S0002-9939-2014-11933-2")[doi:10.1090/S0002-9939-2014-11933-2]. #link("https://arxiv.org/abs/1201.0847v2")[Preprint: arXiv:1201.0847v2].]
#bibitem([12])[N.~J.~Kalton, #emph[Spaces of Lipschitz and Hölder functions and their applications], Collectanea Mathematica #strong[55] (2004), no.~2, 171--217. #link("https://kaltonmemorial.missouri.edu/assets/docs/collect2004.pdf")[Author archive].]
#bibitem([13])[N.~J. Kalton, #emph[The uniform structure of Banach spaces], Mathematische Annalen #strong[354] (2012), 1247--1288. #link("https://doi.org/10.1007/s00208-011-0743-3")[doi:10.1007/s00208-011-0743-3].]
#bibitem([14])[E.~J. McShane, #emph[Extension of range of functions], Bulletin of the American Mathematical Society #strong[40] (1934), no.~12, 837--842. #link("https://doi.org/10.1090/S0002-9904-1934-05978-0")[doi:10.1090/S0002-9904-1934-05978-0].]
#bibitem([15])[A.~Naor, #emph[Impossibility of almost extension], Advances in Mathematics #strong[384] (2021), article 107761. #link("https://doi.org/10.1016/j.aim.2021.107761")[doi:10.1016/j.aim.2021.107761]. #link("https://arxiv.org/abs/2009.11373v2")[Preprint: arXiv:2009.11373v2].]
#bibitem([16])[R.~J. Smith, #emph[Lipschitz-free spaces and Bossard's reduction argument], preprint (2026), version~4, February~23, 2026. #link("https://arxiv.org/abs/2509.00722v4")[arXiv:2509.00722v4].]


