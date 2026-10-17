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

#align(center)[#text(size: 16pt, weight: "bold")[Fixed Points of Nonexpansive Maps \
in Reflexive Banach Spaces]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A Banach space has the #emph[fixed point property for nonexpansive maps] if every nonexpansive selfmap of each nonempty closed bounded convex subset has a fixed point. Here nonexpansiveness is measured in the given norm. We prove the following theorem.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a real reflexive Banach space, and let $C subset.eq X$ be nonempty, norm closed, bounded, and convex. If $F : C arrow.r C$ satisfies 
$ ∥F \( a \) - F \( b \)∥ lt.eq ∥a - b∥ #h(2em) \( a \, b in C \) \, $

 then $F$ has a fixed point.]
] <thm:main>

Theorem 1 establishes the positive assertion in the reflexive-space fixed point problem for the given norm.

Bruck’s theorem for commuting families gives a further consequence.

#thm([Corollary 1.2.])[
  (Commuting families).  #emph[Let $X$ be a real reflexive Banach space, and let $C subset.eq X$ be nonempty, norm closed, bounded, and convex. For any pairwise commuting family $cal(S)$ of nonexpansive selfmaps of $C$, the common fixed set 
$ "Fix" \( cal(S) \) = { x in C : T \( x \) = x upright(" for every ") T in cal(S) } $

 is nonempty and is a nonexpansive retract of $C$. That is, there is a nonexpansive map $R : C arrow.r "Fix" \( cal(S) \)$ that is the identity on $"Fix" \( cal(S) \)$.]
] <cor:commuting>

#proof[
  For the empty family, take $R = "id"_C$. Otherwise, Theorem 1 applies to every nonempty closed bounded convex subset $D$ of $C$, since a relatively norm-closed subset of the norm-closed set $C$ is norm closed in $X$. Thus $C$ has Bruck’s hereditary fixed point property and, by taking $D = C$, the fixed point property. If $f : C arrow.r C$ is nonexpansive and such a subset $D$ is $f$-invariant, the same theorem applied to $f \|_D$ gives a fixed point in $D$. Hence $C$ also has Bruck’s conditional fixed point property. The ordinary fixed point and conditional fixed point properties just proved, together with weak compactness of $C$ by reflexivity, satisfy the corresponding hypotheses of #cite(label("Bruck1974"), form: "prose") Theorem 1. That theorem gives the claimed nonempty nonexpansive retract. ◻
]

The classical results of Browder and Göhde prove the fixed point property for uniformly convex spaces #cite(label("Browder1965")) #cite(label("Gohde1965")). Kirk’s theorem applies when the closed bounded convex domain $C$ in a reflexive space has normal structure #cite(label("Kirk1965")): every convex subset $D subset.eq C$ with more than one point must contain a point $a$ with $sup_(z in D) ∥a - z∥ < "diam" D$. Kirk’s proof uses the minimal invariant set reduction employed below, with the normal-structure and center ideas of Brodskiı̆ and Milman credited there #cite(label("Kirk1965")) p. 1004. Karlovitz subsequently proved the fixed point property for a particular norm on $ell_2$ without normal structure #cite(label("Karlovitz1976")). Thus these geometric conditions give sufficient criteria, but normal structure is not necessary for the property.

Further results established the property for substantial classes beyond the uniformly convex case. Maurey proved it for reflexive subspaces of $L^1$ in the inherited norm #cite(label("Maurey1981")) Theorem 1. Lin proved the weak fixed point property for spaces with a $1$-unconditional basis, meaning that changing signs of basis coefficients preserves the norm #cite(label("Lin1985")) Theorem 1. Here the weak fixed point property restricts the domains to weakly compact convex sets; in a reflexive space it is equivalent to the property considered here. García-Falset, Llorens-Fuster, and Mazcuñán-Navarro proved the property for uniformly nonsquare spaces #cite(label("GarciaFalset2006")); see also the proof of #cite(label("Dowling2008"), form: "prose"). This condition requires a uniform gap below $1$ in at least one of $∥\( a + b \) \/ 2∥$ and $∥\( a - b \) \/ 2∥$ for every pair $a \, b$ in the unit ball. These theorems concern the specified norm, with additional structure.

Two other results distinguish the hypotheses of Theorem 1. Alspach constructed a weakly compact convex subset of $L_1 \[ 0 \, 1 \]$ with a fixed-point-free nonexpansive selfmap #cite(label("Alspach1981")). Weak compactness of the domain in an arbitrary Banach space is therefore insufficient. Domínguez Benavides proved that every reflexive Banach space admits an equivalent norm with the fixed point property #cite(label("Benavides2009")) Corollary 1. A change of norm can change which maps are nonexpansive; the theorem here concerns the original norm.

Hanebaly previously proposed a proof of this same original-norm assertion #cite(label("Hanebaly2019")) Theorem 1, and subsequently announced a further proof #cite(label("Hanebaly2021")). More recent discussion of the general question appears in #cite(label("Nourouzi2026"), form: "prose") Section 1, who records it as unresolved. These statements of the literature are distinct from the argument given here. Our proof proceeds through an adaptive anchor, compact families of predicted outputs, and weighted switching on a tree.

===== 1.1 The argument. <the-argument.>

Suppose a counterexample exists. The classical minimal invariant set method reduces the problem to a separable weakly compact convex set $K$ of diameter one. Approximate fixed points in $K$ become asymptotically diametral: their distance from every prescribed point of $K$ tends to one. This is the Goebel–Karlovitz lemma #cite(label("Goebel1975")) #cite(label("Karlovitz1976")), proved in Lemma 5 below.

The proof uses this diametral behavior through two constructions. First, a compact semigroup of nonexpansive maps provides an anchor $x in K$. Finite convex combinations of increasingly accurate approximate fixed point images of $x$ can return arbitrarily close to $x$, even when the accuracy required at each choice depends on all previous choices. Second, these images label an ordered tree. At each node, a compact family contains the required weak limits of ideal root outputs, with parameters for the convex coefficients still to be chosen. These outputs model the state after a prescribed block of leaves has been replaced by a common approximate fixed point.

Replacing the leaves from right to left gives a sequence of actual root outputs. Their consecutive differences telescope, although the maps defining the tree are nonlinear. Weighted estimates for these differences produce, at every finite depth, one vector detected by all the functionals along a branch. A summable error budget controls the total weighted deficit without a lower bound on the individual branch weights. Finally, weak compactness of the unit ball of $overline("span") \( K - K \)$ gives one vector detected along an infinite branch, while the same functionals tend pointwise to zero on that space.

The adaptive choice of the anchor images, the compact families of predicted outputs, and the weighted telescoping estimate are the parts of the argument that go beyond the classical diametral reduction. They are formulated separately so that their dependence on convexity, nonexpansiveness, and compactness is explicit. Section 2 supplies the compactness and separation facts used throughout, with their proofs in Appendix 6; Sections 3 and 4 construct the anchor and tree; Section 5 proves the switching estimate and completes the contradiction.

== 2 Weak compactness and a minimal invariant set <sec:prelim>

We first record the functional-analytic facts needed below, including their compactness ingredients. The weak topology of a normed space is the topology generated by its continuous linear functionals. Its continuous dual $X^(*)$ carries the operator norm, and $X^(* *) = \( X^(*) \)^(*)$. Reflexivity means that the canonical map $J_X : X arrow.r X^(* *)$, defined by $\( J_X x \) \( f \) = f \( x \)$, is onto. We write $overline("conv") A$ for the norm-closed convex hull of $A$.

#thm([Lemma 2.1.])[
  #emph[Let $X$ be a real normed space.]
  + #emph[Every $v in X$ has a norming functional: there is $f in X^(*)$ with $∥f∥ lt.eq 1$ and $f \( v \) = ∥v∥$. Every norm-closed convex set is weakly closed, and the norm is weakly lower semicontinuous.]
  + #emph[On a finite Cartesian power of $X$, the weak topology is the product weak topology. The norm and weak closures of a convex set coincide.]
  + #emph[If $X$ is reflexive and complete, every norm-closed bounded convex subset of $X$ is weakly compact. Arbitrary products of compact Hausdorff spaces are compact.]
] <lem:weak-facts>

The proof, including the compactness details, is given in Appendix 6.

Throughout, $bb(N) = { 1 \, 2 \, dots.h }$. We use the following limit convention. A proper filter is a family of subsets closed under finite intersections and supersets, containing the whole set but not the empty set. An #emph[ultrafilter] is maximal under inclusion among proper filters. Fix an ultrafilter $cal(U)$ on $bb(N)$ extending the filter of cofinite sets. It contains no finite set and is therefore #emph[free]. For a sequence $\( a_j \)$, the notation $a = lim_(j arrow.r cal(U)) a_j$ means that ${ j : a_j in V } in cal(U)$ for every neighborhood $V$ of $a$. The existence of such $cal(U)$, and existence and uniqueness of these limits in compact Hausdorff spaces, are proved in Appendix 6.

#thm([Lemma 2.2.])[
  #emph[If Theorem 1 fails, there are a nonempty separable, weakly compact convex set $K$ and a nonexpansive map $T : K arrow.r K$ without a fixed point such that $K$ has no proper nonempty norm-closed convex $T$-invariant subset. We may take $"diam" K = 1$ by scalar normalization. Moreover, the weak topology on $K$ is metrizable. For 
$ Y = overline("span") \( K - K \) \, #h(2em) B_Y = { y in Y : ∥y∥ lt.eq 1 } \, $

 the ball $B_Y$ is weakly compact, and $Y$ is separable.]
] <lem:reduction>

#proof[
  Start with a fixed-point-free map $F : C arrow.r C$ as in the theorem and a point $a in C$. Set $C_0 = { a }$ and $C_(n + 1) = overline("conv") \( C_n union F \( C_n \) \)$. These sets are increasing and separable: continuous images of separable sets are separable, and rational convex combinations of a countable dense set are dense in its convex hull. Hence $C' = overline(union.big_n C_n)$ is separable, bounded, closed, and convex. Norm continuity of $F$ gives $F \( C' \) subset.eq C'$, and Lemma 3 makes $C'$ weakly compact.
  Every decreasing chain of nonempty norm-closed convex invariant subsets of $C'$ has a nonempty intersection, by weak compactness and the finite intersection property. The intersection is again closed, convex, and invariant. Zorn’s Lemma, with inclusion reversed, therefore supplies a minimal such set $K$. Put $T = F \|_K$. Its diameter $d$ is positive, since a singleton invariant set would give a fixed point. From now on express distances in units of $d$, writing $∥dot.op∥$ for the original norm divided by $d$. This scalar normalization preserves the topologies, nonexpansiveness, and fixed points; it makes $"diam" K = 1$.
  Choose a norm-dense sequence $\( z_i \)_(i gt.eq 1)$ in $K$. Its pairwise differences have dense linear span in $Y$, so $Y$ is separable. Choose a dense sequence $\( u_j \)$ in the unit sphere of $Y$ and norming functionals $g_j in X^(*)$ for these vectors. They separate points of $Y$: if $∥v∥ = 1$ and $∥v - u_j∥ < 1 \/ 2$, then $g_j \( v \) > 1 \/ 2$. Thus the map $a mapsto \( g_j \( a \) \)_(j gt.eq 1)$ continuously injects weakly compact $K$ into $bb(R)^(bb(N))$. The latter is metrizable, for example by $sum_j 2^(- j) min { 1 \, lr(|s_j - t_j|) }$. The injection is a homeomorphism onto its image, since compact subsets of a Hausdorff space are closed. Hence the weak topology on $K$ is metrizable. Finally $B_Y$ is a norm-closed bounded convex subset of $X$, so is weakly compact by Lemma 3. Its inherited weak topology equals its intrinsic weak topology: restriction gives one inclusion of continuous functionals, and the extension argument in Lemma 3 gives the other. ◻
]

We argue by contradiction for the remainder of the proof and fix $K \, T \, Y$, and $\( z_i \)$ as in Lemma 4. A sequence $\( u_j \)$ in $K$ is an #emph[approximate fixed point sequence] if $∥T u_j - u_j∥ arrow.r 0$. The next lemma is the diameter lemma of Goebel and Karlovitz #cite(label("Goebel1975")) #cite(label("Karlovitz1976")); we include its proof. Karlovitz also records independent development of this lemma by P. M. Fitzpatrick #cite(label("Karlovitz1976")) p. 159.

#thm([Lemma 2.3.])[
  #emph[Every approximate fixed point sequence $\( u_j \)$ satisfies 
$ lim_(j arrow.r oo) ∥u_j - z∥ = 1 #h(2em) \( z in K \) . $

]
] <lem:diametral>

#proof[
  First $K = overline("conv") T \( K \)$: this hull is nonempty and contained in $K$, and its image under $T$ is contained in $T \( K \)$ and hence in the hull. Minimality applies. Consider on $K$ the functions
  $ s \( z \) = sup_(w in K) ∥z - w∥ \, #h(2em) r \( z \) = limsup_j ∥z - u_j∥ . $
  Both are convex and $1$-Lipschitz. For a fixed center, the distance function is convex and continuous, so its supremum is unchanged on passing to a norm-closed convex hull. The hull identity and nonexpansiveness give
  $ s \( T z \) = sup_(w in K) ∥T z - T w∥ lt.eq s \( z \) \, #h(2em) r \( T z \) lt.eq r \( z \) \, $
  where the second inequality also uses $∥T u_j - u_j∥ arrow.r 0$. Every nonempty sublevel set of either function is norm closed, convex, and invariant. If the function had two different values, a sublevel strictly between them would contradict minimality. Both functions are therefore constant, and $s = 1$ because its supremum is $"diam" K$. Write $r = R lt.eq 1$.
  Take the weak $cal(U)$-limit $a in K$ of $\( u_j \)$. For every $z in K$ and $eta > 0$, all sufficiently large $j$ satisfy $∥z - u_j∥ lt.eq R + eta$. The corresponding closed ball is weakly closed and the cofinite sets belong to $cal(U)$, so $∥z - a∥ lt.eq R + eta$. Letting $eta$ decrease to zero and taking the supremum over $z$ gives $1 = s \( a \) lt.eq R$, hence $R = 1$. This argument applies to every subsequence of $\( u_j \)$, since each is again an approximate fixed point sequence. As all distances are at most $1$, a failure of the asserted limit would give a subsequence bounded above by $1 - eta$ for some $eta > 0$, contradicting its limsup of $1$. ◻
]

#thm([Lemma 2.4.])[
  #emph[For every nonempty norm-compact set $E subset.eq K$ and every $epsilon > 0$, there exists $delta > 0$ such that each $y in K$ with $∥T y - y∥ lt.eq delta$ admits a single $f in X^(*)$, $∥f∥ lt.eq 1$, satisfying 
$ f \( y - z \) gt.eq 1 - epsilon #h(2em) \( z in E \) . $

]
] <lem:compact-detector>

#proof[
  Choose an $epsilon \/ 2$-net $a_1 \, dots.h \, a_m$ in $E$ and set $a = m^(- 1) sum_(i = 1)^m a_i in K$. Lemma 5 implies that, for some $delta > 0$,
  $ ∥T y - y∥ lt.eq delta quad arrow.r.double quad ∥y - a∥ gt.eq 1 - frac(epsilon, 2 m) . $
  Indeed, otherwise choosing a violating point with defect at most $1 \/ j$ for each $j$ would contradict that lemma. Choose a norming functional $f$ for $y - a$. The numbers $f \( y - a_i \)$ are all at most $1$, whereas their sum is $m f \( y - a \) gt.eq m - epsilon \/ 2$. Each is therefore at least $1 - epsilon \/ 2$. For $z in E$, take $a_i$ with $∥z - a_i∥ < epsilon \/ 2$ and use $∥f∥ lt.eq 1$ to obtain the claimed bound. ◻
]

== 3 An anchor for successive choices <sec:anchor>

We construct a point $x in K$ and a family of nonexpansive maps whose images of $x$ have two useful properties. Their fixed point defects can be made arbitrarily small, even after additional requirements have been imposed by earlier choices, and finite convex combinations of these images can return arbitrarily close to $x$ in norm. The construction uses compactness in a space of maps; finite simultaneous approximation in norm will justify the compositions that occur there.

=== 3.1 Resolvents and displacement estimates <resolvents-and-displacement-estimates>

We begin with the classical resolvent construction; see #cite(label("Goebel1975"), form: "prose") pp. 75–76.

#thm([Lemma 3.1.])[
  (Resolvents).  #emph[For every $n gt.eq 1$ and $a in K$, there is a unique point $R_n \( a \) in K$ satisfying 
#[#set math.equation(numbering: n => "(3.1)")
 $ R_n \( a \) = a / n + (1 - 1 / n) T R_n \( a \) . $ <eq:resolvent-definition>]

 The map $R_n : K arrow.r K$ is nonexpansive, and 
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥T R_n \( a \) - R_n \( a \)∥ lt.eq 1 / n \, #h(2em) ∥R_n \( a \) - a∥ lt.eq \( n - 1 \) ∥T a - a∥ quad \( a in K \) . $ <eq:resolvent-estimates>]

]
] <lem:resolvents>

#proof[
  For $n = 1$, the defining equation gives $R_1 \( a \) = a$. For $n > 1$, the map
  $ u mapsto a / n + (1 - 1 / n) T u $
  takes the complete set $K$ into itself and has Lipschitz constant $q = 1 - 1 \/ n < 1$. Starting from any point of $K$, its iterates have successive displacements bounded by $q^r$ times the first displacement. The geometric series shows that the iterates are Cauchy. Their limit solves (3.1) by norm continuity. Two solutions have distance at most $q$ times their distance and therefore coincide.
  For $u = R_n \( a \)$ and $v = R_n \( b \)$, comparison of their equations gives
  $ ∥u - v∥ lt.eq 1 / n ∥a - b∥ + (1 - 1 / n) ∥u - v∥ \, $
  which proves nonexpansiveness. The identity $T u - u = \( T u - a \) \/ n$ and $"diam" K = 1$ give the first estimate in (3.2). For the second, the defining equation and nonexpansiveness of $T$ give
  $ ∥u - a∥ lt.eq (1 - 1 / n) #scale(x: 120%, y: 120%)[\(] ∥u - a∥ + ∥T a - a∥ #scale(x: 120%, y: 120%)[\)] . $
  Rearranging proves the claim. ◻
]

Let $cal(G)$ be the family generated by the identity map and the maps $R_n$ using finitely many compositions and pointwise finite convex combinations. Every member of $cal(G)$ is a nonexpansive selfmap of $K$. Moreover, for each $G in cal(G)$ there is a finite constant $c_G gt.eq 0$ such that

#[#set math.equation(numbering: n => "(3.3)")
 $ ∥G \( a \) - a∥ lt.eq c_G ∥T a - a∥ #h(2em) \( a in K \) . $ <eq:map-displacement>]

For the generators, take $c_(upright("Id")) = 0$ and $c_(R_n) = n - 1$. Convex combinations preserve the estimate with the same convex combination of the constants. For compositions, nonexpansiveness gives

$ ∥G_1 \( G_2 \( a \) \) - a∥ & lt.eq ∥G_1 \( G_2 \( a \) \) - G_1 \( a \)∥ + ∥G_1 \( a \) - a∥\
 & lt.eq ∥G_2 \( a \) - a∥ + ∥G_1 \( a \) - a∥\
 & lt.eq \( c_(G_2) + c_(G_1) \) ∥T a - a∥ . $

This proves (3.3) throughout $cal(G)$. The same composition estimate underlies Bruck’s semigroup of maps asymptotically fixing a common approximate fixed point sequence #cite(label("Bruck1975")) p. 115.

For $m gt.eq 1$, define the tail family

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(H)_m = { R_n compose G : n gt.eq m \, med G in cal(G) } . $ <eq:tail-family>]

These families are nonempty, contained in $cal(G)$, and decreasing with $m$. Their outer resolvents give the uniform bound

#[#set math.equation(numbering: n => "(3.5)")
 $ ∥T h \( a \) - h \( a \)∥ lt.eq 1 / m #h(2em) \( h in cal(H)_m \, med a in K \) . $ <eq:tail-defect>]

=== 3.2 A compact semigroup of maps <a-compact-semigroup-of-maps>

Convex semigroups of nonexpansive maps, with the topology of pointwise weak convergence, were studied by Bruck #cite(label("Bruck1975")). His common-fixed-point theorem assumes strict convexity and pairwise intersection of the closed convex hulls of the ranges of the maps. Here the semigroup will supply an idempotent anchor, through Ellis’s lemma; the tree and switching arguments will then produce the fixed point. The composition estimates below keep the needed continuity properties explicit.

Give $K^K$, the set of all maps from $K$ into itself, the topology of pointwise weak convergence. It is a compact Hausdorff space by the product compactness in Lemma 3. We write $overline(cal(B))^(thin upright("pw"))$ for closure in this space.

#thm([Lemma 3.2.])[
  (Finite simultaneous approximation).  #emph[Let $cal(B) subset.eq K^K$ be a nonempty convex family of nonexpansive maps. Every map $h in overline(cal(B))^(thin upright("pw"))$ is nonexpansive. For any integer $q gt.eq 1$, points $a_1 \, dots.h \, a_q in K$, and $delta > 0$, there is a single $g in cal(B)$ such that 
$ max_(1 lt.eq i lt.eq q) ∥g \( a_i \) - h \( a_i \)∥ < delta . $

]
] <lem:finite-tuples>

#proof[
  For each fixed pair $a \, b in K$, the condition $∥h \( a \) - h \( b \)∥ lt.eq ∥a - b∥$ is closed in the pointwise weak topology: evaluation at $a \, b$ and subtraction are weakly continuous, and norm balls are weakly closed. Intersecting these conditions over all pairs proves the first assertion.
  For the second, consider the convex subset
  $ V = { \( g \( a_1 \) \, dots.h \, g \( a_q \) \) : g in cal(B) } subset.eq X^q . $
  The tuple $\( h \( a_1 \) \, dots.h \, h \( a_q \) \)$ belongs to its weak closure, by continuity of evaluation. The weak topology of the finite Banach product $X^q$ is the product of its coordinate weak topologies: each continuous linear functional on $X^q$ is the sum of its coordinate restrictions. By separation, the weak and norm closures of a convex subset of $X^q$ agree. Applying this fact with the maximum coordinate norm gives one element of $V$ satisfying all the desired inequalities. ◻
]

We will also use the following elementary compact semigroup argument, the right-translation version of #cite(label("Ellis1958"), form: "prose") Lemma 1, p. 402. Ellis uses the opposite convention for composition. Here a semigroup is a set with an associative multiplication.

#thm([Lemma 3.3.])[
  (Idempotent in a compact semigroup).  #emph[Let $S$ be a nonempty compact Hausdorff semigroup. Suppose that, for each $p in S$, the right translation $h mapsto h p$ is continuous. Then $S$ contains an idempotent: an element $p$ with $p^2 = p$.]
] <lem:idempotent>

#proof[
  The intersection of a chain of nonempty compact subsemigroups of $S$ is nonempty by compactness and is again a compact subsemigroup. Zorn’s lemma therefore gives a minimal nonempty compact subsemigroup $S' subset.eq S$. Fix $p in S'$. The set $S' p$ is a nonempty compact subset of $S'$ by continuity of right translation. It is a subsemigroup because
  $ \( a p \) \( b p \) = \( a p b \) p in S' p #h(2em) \( a \, b in S' \) . $
  Minimality gives $S' p = S'$, so in particular there is an $h in S'$ with $h p = p$. The set
  $ E = { h in S' : h p = p } $
  is thus nonempty. It is compact by continuity of right translation and is a subsemigroup, since $h p = k p = p$ implies $\( h k \) p = h \( k p \) = h p = p$. Minimality gives $E = S'$, and $p in E$ proves $p^2 = p$. ◻
]

Set

#[#set math.equation(numbering: n => "(3.6)")
 $ A_m = overline("conv" cal(H)_m)^(thin upright("pw")) \, #h(2em) A = ⋂_(m gt.eq 1) A_m . $ <eq:map-closures>]

#thm([Proposition 3.4.])[
  (An anchor point).  #emph[The set $A$ is a nonempty compact semigroup of nonexpansive selfmaps of $K$ and contains an idempotent $P$. There is a point $x in K$ with $P \( x \) = x$ such that the nonempty weakly compact set 
#[#set math.equation(numbering: n => "(3.7)")
 $ D_x = ⋂_(m gt.eq 1) overline({ h \( x \) : h in cal(H)_m })^(thin upright("weak")) $ <eq:anchor-tail-set>]

 satisfies 
#[#set math.equation(numbering: n => "(3.8)")
 $ x in overline("conv" D_x)^(thin ∥dot.op∥) . $ <eq:anchor-convex-hull>]

]
] <prop:anchor>

#proof[
  The sets $A_m$ are nonempty, compact, and decreasing. Every member is nonexpansive by Lemma 8.
  First, $"conv" cal(H)_m$ is closed under composition. Indeed, if
  $ g = sum_(r = 1)^s lambda_r \( R_(n_r) compose G_r \) in "conv" cal(H)_m \, #h(2em) k in "conv" cal(H)_m \, $
  then $k in cal(G)$ and
  $ g compose k = sum_(r = 1)^s lambda_r #scale(x: 120%, y: 120%)[\(] R_(n_r) compose \( G_r compose k \) #scale(x: 120%, y: 120%)[\)] in "conv" cal(H)_m . $
  This identity distributes precomposition over the outer convex combination.
  To pass to $A_m$, fix $h \, k in A_m$, arguments $a_1 \, dots.h \, a_q in K$, and $delta > 0$. Lemma 8 gives $k_delta \, h_delta in "conv" cal(H)_m$ with
  $ max_i ∥k_delta \( a_i \) - k \( a_i \)∥ < delta \, #h(2em) max_i ∥h_delta \( k \( a_i \) \) - h \( k \( a_i \) \)∥ < delta . $
  The second application uses the fixed arguments $k \( a_i \)$. Nonexpansiveness of $h_delta$ then gives
  $ & ∥h_delta \( k_delta \( a_i \) \) - h \( k \( a_i \) \)∥\
 & quad lt.eq ∥h_delta \( k_delta \( a_i \) \) - h_delta \( k \( a_i \) \)∥ + ∥h_delta \( k \( a_i \) \) - h \( k \( a_i \) \)∥\
 & quad lt.eq ∥k_delta \( a_i \) - k \( a_i \)∥ + ∥h_delta \( k \( a_i \) \) - h \( k \( a_i \) \)∥ < 2 delta . $
  The composition $h_delta compose k_delta$ belongs to $"conv" cal(H)_m$. Since the finite arguments and $delta$ were arbitrary, these simultaneous norm approximations imply $h compose k in A_m$.
  Thus $A$ is a nonempty compact semigroup, by the nested intersection property. For fixed $k in A$, the right translation $h mapsto h compose k$ is continuous in the pointwise weak topology: its value at an argument $a$ is the evaluation of $h$ at the fixed argument $k \( a \)$. Lemma 9 supplies $P in A$ with $P compose P = P$. Choose any $a in K$ and set $x = P \( a \)$; then $P \( x \) = x$.
  Write
  $ B_m = overline({ h \( x \) : h in cal(H)_m })^(thin upright("weak")) . $
  These are nonempty nested weakly compact subsets of $K$, so $D_x = ⋂_m B_m$ is nonempty and weakly compact. Since $P in A_m$, Lemma 8 at the single argument $x$ shows that
  $ x = P \( x \) in overline("conv" { h \( x \) : h in cal(H)_m })^(thin ∥dot.op∥) subset.eq overline("conv" B_m)^(thin ∥dot.op∥) . $
  Consequently, for each $ell in X^(*)$,
  $ max_(z in B_m) ell \( z \) gt.eq ell \( x \) . $
  The maximum exists because $B_m$ is weakly compact. The sets $B_m ∩ { z : ell \( z \) gt.eq ell \( x \) }$ are nonempty nested compact sets; their intersection gives a point of $D_x$ at which $ell gt.eq ell \( x \)$. Hence
  $ sup_(z in D_x) ell \( z \) gt.eq ell \( x \) #h(2em) \( ell in X^(*) \) . $
  If (3.8) failed, separation from the norm-closed convex hull of $D_x$ would give a functional violating this inequality. This proves the proposition. ◻
]

=== 3.3 Successive choices with prescribed thresholds <successive-choices-with-prescribed-thresholds>

Fix the point $x$ supplied by Proposition 10. Its convex-hull property permits each new map to be selected at a scale that depends on all preceding choices.

#thm([Lemma 3.5.])[
  (Adaptive finite selection).  #emph[Let $tau > 0$. There is a successive selection procedure with the following property. Before the $i$th map is chosen, prescribe any finite integer $m_i gt.eq 1$, allowing this prescription to depend on the entire previous history and on any auxiliary data already fixed at that stage. The procedure chooses $G_i in cal(H)_(m_i)$ and terminates after finitely many steps, say $M$, with nonnegative coefficients $beta_1 \, dots.h \, beta_M$ such that 
#[#set math.equation(numbering: n => "(3.9)")
 $ sum_(i = 1)^M beta_i = 1 \, #h(2em) ∥∥ * sum_(i = 1)^M beta_i G_i \( x \) - x < tau . $ <eq:adaptive-return>]

 The coefficients are assigned on termination. Removing zero coefficients gives a nonempty list with positive coefficients, in the original order of selection.]
] <lem:adaptive-selection>

#proof[
  Choose $d_1 \, dots.h \, d_q in D_x$ and nonnegative coefficients $lambda_1 \, dots.h \, lambda_q$ summing to $1$ such that
  $ ∥∥ * sum_(r = 1)^q lambda_r d_r - x < tau / 2 . $
  Fix a metric $rho$ inducing the weak topology on $K$. Cycle through the targets $d_1 \, dots.h \, d_q$: at step $i$, let $r \( i \)$ be the member of ${ 1 \, dots.h \, q }$ congruent to $i$ modulo $q$. Once the threshold $m_i$ has been prescribed, the membership
  $ d_(r \( i \)) in overline({ h \( x \) : h in cal(H)_(m_i) })^(thin upright("weak")) $
  allows a choice $G_i in cal(H)_(m_i)$ with
  $ rho #scale(x: 120%, y: 120%)[\(] G_i \( x \) \, d_(r \( i \)) #scale(x: 120%, y: 120%)[\)] < 1 / i . $
  Any auxiliary choices associated with this map may now be made before the next threshold is prescribed. Stop as soon as the convex hull of the selected images comes within distance $tau$ of $x$.
  Suppose that the procedure never stops, and let
  $ C_0 = overline("conv" { G_i \( x \) : i gt.eq 1 })^(thin ∥dot.op∥) . $
  For each $r$, the subsequence assigned to target $d_r$ converges weakly to $d_r$. The set $C_0$ is weakly closed by separation, so it contains every $d_r$ and their convex combination $sum_r lambda_r d_r$. By the definition of $C_0$, a finite convex combination of the selected images is within $tau \/ 2$ of this last point. It is therefore within $tau$ of $x$. All its indices occur in some finite prefix of the selection, contradicting the stopping rule. The procedure thus terminates, and a convex combination at the stopping step supplies (3.9). Deleting its zero coefficients leaves the stated positive list. ◻
]

By (3.5), the threshold at each selection may impose any positive upper bound on the defect of that individual image. The convex coefficients in Lemma 11 provide the return to $x$ in norm.

Finally, fix once and for all the sequence

#[#set math.equation(numbering: n => "(3.10)")
 $ b_j = R_j \( x \) #h(2em) \( j gt.eq 1 \) . $ <eq:terminal-sequence>]

Lemma 7 and (3.3) give

#[#set math.equation(numbering: n => "(3.11)")
 $ ∥T b_j - b_j∥ lt.eq 1 / j \, #h(2em) ∥G \( b_j \) - b_j∥ lt.eq c_G / j quad \( G in cal(G) \) . $ <eq:terminal-displacement>]

Thus every fixed finite family of maps in $cal(G)$ acts arbitrarily close to the identity at a common sufficiently late $b_j$. This sequence will be used throughout the remaining construction.

== 4 A tree of maps and separating functionals <sec:tree>

Fix the point $x$ supplied by Proposition 10 and the sequence $b_j = R_j \( x \)$ from Section 3. We construct a single infinite tree. Each node carries a map in $cal(G)$, and each nonroot node also carries a functional. The maps will allow a subtree to approximate its prescribed label or to transmit a common point $b_j$. Each functional must be chosen before the weights in its own sibling group are assigned. A family of possible root outputs parameterized by a compact finite-dimensional set makes this order of choices possible.

=== 4.1 Evaluation on an ordered tree <evaluation-on-an-ordered-tree>

The root is denoted by $r$, and $L_k$ denotes the finite, nonempty level of depth $k$, with $L_0 = { r }$. Every node has a finite, nonempty ordered list of children. The order on $L_(k + 1)$ is obtained by placing these lists consecutively in the order of their parents in $L_k$. Write $hat(v)$ for the parent of $v$, and $p prec v$ when $p$ is a proper ancestor of $v$. In particular, $prec$ does not denote the order within a level.

Each node $v$ is assigned a map $G_v in cal(G)$ and the point $y_v = G_v \( x \)$. At the root, $G_r = "Id"_K$ and $y_r = x$. Each nonroot node has a weight $alpha_v > 0$, with

$ sum_(hat(v) = u) alpha_v = 1 #h(2em) upright("for every node ") u . $

Given outputs at the children of $u$, the output at $u$ is

#[#set math.equation(numbering: n => "(4.1)")
 $ H_u = G_u (sum_(hat(v) = u) alpha_v H_v) . $ <eq:tree-rule>]

Every output belongs to $K$. If outputs $\( H_v \)_(v in L_k)$ are prescribed at a cutoff level, let $Phi_k \( \( H_v \)_(v in L_k) \)$ be the root output obtained by applying this rule strictly above that level. Thus $Phi_0 \( H_r \) = H_r$; a map at the cutoff itself is not applied again.

Define the path weights by

$ W_r = 1 \, #h(2em) W_v = W_(hat(v)) alpha_v quad \( v eq.not r \) . $

An induction gives $sum_(v in L_k) W_v = 1$. More generally, the sum of the weights at any later level below a given node is the weight of that node. Nonexpansiveness and the triangle inequality also give, by induction up the tree,

#[#set math.equation(numbering: n => "(4.2)")
 $ ∥Phi_k \( \( H_v \) \) - Phi_k \( \( H'_v \) \)∥ lt.eq sum_(v in L_k) W_v ∥H_v - H'_v∥ . $ <eq:tree-sensitivity>]

Indeed, at each parent the difference is at most the weighted sum of the child differences. Iterating multiplies the weights along each path. Consequently the root error is at most the largest cutoff error, and changing only the output at $v in L_k$ changes the root by at most $W_v$ times the change at $v$.

=== 4.2 Predictions using earlier candidates <predictions-using-earlier-candidates>

We first describe the information associated with a candidate node $v$ of depth $k gt.eq 1$ during construction. At this stage, all levels of depth less than $k$, including their maps and weights, have already been fixed. Candidates at depth $k$ are selected one parent group at a time, from left to right, and within each group in their order of selection. Let $I_v$ be the finite list of earlier depth-$k$ candidates. We retain their points $y_h$ and parent labels even if some of these candidates have already been discarded from the tree. The map $G_v$ and point $y_v$ have not yet been chosen.

The later switching experiment replaces leaf outputs from right to left. If $v$ is retained, then just after its block has switched, the #emph[ideal] cutoff state uses $y_h$ at nodes strictly left of $v$ and a common point $b$ at $v$ and to its right. The actual subtree outputs will approximate these prescribed values. We must describe the root outputs of this ideal state before the current level’s weights and later children are known.

Put

$ Theta_v = {\( theta_h \)_(h in I_v) : theta_h gt.eq 0 \, quad sum_(h in I_v\
hat(h) = p) theta_h lt.eq 1 quad \( p in L_(k - 1) \)} . $

This is a compact subset of a finite-dimensional space. If $I_v$ is empty, it consists of the single empty tuple. For $b in K$ and $theta in Theta_v$, set

#[#set math.equation(numbering: n => "(4.3)")
 $ a_(v \, p) \( b \; theta \) & = b + sum_(h in I_v\
hat(h) = p) theta_h \( y_h - b \) \, #h(2em) p in L_(k - 1) \,\
Q_v \( b \; theta \) & = Phi_(k - 1) #scale(x: 120%, y: 120%)[\(] \( G_p \( a_(v \, p) \( b \; theta \) \) \)_(p in L_(k - 1)) #scale(x: 120%, y: 120%)[\)] . $ <eq:prediction-definition>]

Each $a_(v \, p)$ is a convex combination of $b$ and the earlier candidates belonging to $p$, so it lies in $K$. The residual coefficient of $b$ represents all children whose outputs are to be replaced by that common point. Only maps and weights at depths less than $k$ enter the evaluation of $Q_v$.

For fixed $v$, the map $theta mapsto Q_v \( b \; theta \)$ is norm Lipschitz, uniformly over $b in K$. In fact, since $"diam" K = 1$,

$ ∥a_(v \, p) \( b \; theta \) - a_(v \, p) \( b \; eta \)∥ lt.eq sum_(h in I_v\
hat(h) = p) lr(|theta_h - eta_h|) . $

Applying the nonexpansive maps $G_p$ and Equation (4.2) gives

#[#set math.equation(numbering: n => "(4.4)")
 $ ∥Q_v \( b \; theta \) - Q_v \( b \; eta \)∥ lt.eq sum_(h in I_v) lr(|theta_h - eta_h|) . $ <eq:prediction-lipschitz>]

For each $theta$, weak compactness of $K$ gives the limit

$ Z_v \( theta \) = "w-lim"_(j arrow.r cal(U)) Q_v \( b_j \; theta \) in K . $

The difference of the two sequences at $theta$ and $eta$ converges weakly along $cal(U)$ to $Z_v \( theta \) - Z_v \( eta \)$. The norm ball of radius $sum_(h in I_v) lr(|theta_h - eta_h|)$ is weakly closed, so Equation (4.4) implies the same bound for $∥Z_v \( theta \) - Z_v \( eta \)∥$. Thus $Z_v$ is continuous into the norm topology, and

#[#set math.equation(numbering: n => "(4.5)")
 $ E_v = { z_1 \, dots.h \, z_k } union Z_v \( Theta_v \) $ <eq:tree-detector-set>]

is a nonempty norm-compact subset of $K$. It is completely determined before $G_v$ is selected. The dense test points will force the branch functionals to tend to zero on the differences $z_i - z_j$, and hence on $Y$; the compact prediction image provides comparison limits for block detection. This argument takes weak limits of the already evaluated root outputs; it does not pass a weak limit through a nonlinear map.

=== 4.3 The inductive construction <the-inductive-construction>

#thm([Proposition 4.1.])[
  (Tree data).  #emph[There is an infinite ordered tree with the maps, points, and positive weights described above. Each nonroot node $v$ also has a budget $e_v > 0$, a functional $f_v in X^(*)$ with $∥f_v∥ lt.eq 1$, and the finite earlier-candidate list and predictions just defined. These data have the following properties:]
  + #emph[The budgets satisfy 
#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(v eq.not r) e_v lt.eq 1 / 128 . $ <eq:tree-budget>]

 Define 
#[#set math.equation(numbering: n => "(4.7)")
 $ tau_0 = 1 / 2 \, #h(2em) tau_k = 2^(- k - 1) min { e_u : u in L_i \, med 1 lt.eq i lt.eq k } quad \( k gt.eq 1 \) . $ <eq:tree-tolerance>]

 Every node $u in L_k$ satisfies 
#[#set math.equation(numbering: n => "(4.8)")
 $ ∥sum_(hat(v) = u) alpha_v y_v - x∥ lt.eq tau_k . $ <eq:child-average>]

]
  + #emph[For every nonroot node $v$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ sum_(p prec v) ∥G_p \( y_v \) - y_v∥ lt.eq e_v \, #h(2em) f_v \( y_v - z \) gt.eq 1 - e_v quad \( z in E_v \) . $ <eq:tree-conditions>]

 In particular, the second inequality holds at every $z_i$ with $i lt.eq k$ when $v in L_k$.]
  #emph[The budgets, functionals, and prediction sets assigned to retained nodes remain fixed when the remaining weights at their level and all later levels are chosen.]
] <prop:tree-data>

#proof[
  Start with the root and $tau_0 = 1 \/ 2$. Number all candidate selections throughout the construction by $ell = 1 \, 2 \, dots.h$, including candidates later discarded. At selection number $ell$, assign the budget
  $ e_v = 2^(- ell - 8) $
  before choosing the candidate’s map. The sum of all such budgets is at most $1 \/ 256$, which is more than sufficient for Equation (4.6) after discarding any candidates.
  Suppose the finite levels through $L_(k - 1)$ have been constructed and $tau_(k - 1)$ has been fixed. Visit the parents in $L_(k - 1)$ from left to right. For a given parent, apply Lemma 11 with tolerance $tau_(k - 1)$. Its successive map choices will be the candidates for this parent’s children. We now specify the threshold to be imposed at every one of these choices.
  Let $v$ be the next candidate. Its budget has just been assigned. Using all earlier candidates at the present level, form $I_v$, $Theta_v$, $Q_v$, and $E_v$ as above. The ancestor maps are fixed, so the number
  $ C_v = sum_(p prec v) c_(G_p) $
  is finite; take $c_(G_r) = 0$. By Lemma 6, there is $delta_v > 0$ such that any $y in K$ with $∥T y - y∥ < delta_v$ admits a functional $f in X^(*)$, $∥f∥ lt.eq 1$, satisfying $f \( y - z \) gt.eq 1 - e_v$ for every $z in E_v$. Choose the integer threshold $m$ so large that
  $ 1 / m < delta_v \, #h(2em) C_v / m lt.eq e_v . $
  This choice uses only data already available, and is made before selecting $G_v$.
  Require the next map in the adaptive selection to belong to $cal(H)_m$. Every such choice has $∥T y_v - y_v∥ lt.eq 1 \/ m$ by Equation (3.5). Equation (3.3) then gives
  $ sum_(p prec v) ∥G_p \( y_v \) - y_v∥ lt.eq C_v ∥T y_v - y_v∥ lt.eq e_v . $
  After selecting $G_v$, choose the functional $f_v$ given by the compact detector. Both requirements in Equation (4.9) now hold. In particular, they hold for every map choice allowed by this step’s threshold, so they are compatible with the weak-neighborhood choices used in Lemma 11.
  That lemma terminates after finitely many candidates for the parent under consideration. Only then choose the convex coefficients whose average of the points $y_v$ lies within $tau_(k - 1)$ of $x$. Discard the candidates with zero coefficient and retain the others, in their original order, as this parent’s children; their positive coefficients are the weights $alpha_v$. The retained list is nonempty, and its weights sum to one. Keep the labels of discarded candidates in the finite lists used to form subsequent predictions. Thus no already defined prediction or functional changes when zero coefficients are discarded.
  There are only finitely many parents, so this completes a finite, nonempty level $L_k$. Every parent in $L_(k - 1)$ now satisfies Equation (4.8). Define $tau_k$ by Equation (4.7); its defining minimum is over a nonempty finite set of positive numbers. Proceed to the next level. This constructs the entire tree and proves the stated properties. ◻
]

Once level $L_k$ is complete, each retained $v in L_k$ has a particular parameter $theta^v in Theta_v$: for $h in I_v$, set $theta_h^v = alpha_h$ if $h$ was retained, and set $theta_h^v = 0$ otherwise. The parent-group sums are at most one, as required. Write $h <_k v$ for the left-to-right order on the retained level. For $b in K$, prescribe the ideal cutoff outputs

$ tilde(H)_h^(v \, b) = cases(delim: "{", y_h \, & h <_k v \,, b \, & h = v med upright("or") med v <_k h .) $

For every parent $p in L_(k - 1)$, their weighted average is exactly

$ sum_(hat(h) = p) alpha_h tilde(H)_h^(v \, b) = b + sum_(h in I_v\
hat(h) = p) theta_h^v \( y_h - b \) . $

Consequently

#[#set math.equation(numbering: n => "(4.10)")
 $ Phi_k \( \( tilde(H)_h^(v \, b) \)_(h in L_k) \) = Q_v \( b \; theta^v \) . $ <eq:prediction-cutoff>]

In a parent group earlier than that of $v$, all retained children contribute their $y_h$ and their weights sum to one. In the group containing $v$, the residual coefficient of $b$ collects $v$ and all later children. In every later parent group, all ideal outputs are $b$, so their average is $b$ regardless of how many children were eventually selected or what their weights are. This explains why the prediction required no information about those future children. Figure 1 illustrates this cutoff state. The actual parameters $theta^v$ are used only after the weights are fixed; the compact sets $E_v$ were chosen to cover all their possible values.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.4), [#text(size: 9pt)[$r$]])
  content((-3, 1.35), [#text(size: 9pt)[$p_1$]])
  content((0, 1.35), [#text(size: 9pt)[$p_2$]])
  content((3, 1.35), [#text(size: 9pt)[$p_3$]])
  line((-0.204, 2.329), (-2.74, 1.441), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.74, 1.441), (-0.204, 2.329), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 2.207), (0, 1.574), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 1.574), (0, 2.207), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.204, 2.329), (2.74, 1.441), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-3.812, -0.2121), (-3.388, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$y_(h_1)$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2.612, -0.2121), (-2.188, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$y_(h_2)$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.8121, -0.2121), (-0.3879, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$y_(h_3)$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.3879, -0.2121), (0.8121, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b$]]], frame: "circle", fill: rgb("#dde2e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.188, -0.2121), (2.612, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b$]]], frame: "circle", fill: rgb("#dde2e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.388, -0.2121), (3.812, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$b$]]], frame: "circle", fill: rgb("#dde2e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-3.099, 1.126), (-3.475, 0.2806), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-3.475, 0.2806), (-3.099, 1.126), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.901, 1.126), (-2.525, 0.2806), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.132, 0.1505), (-0.2596, 1.204), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.09949, 1.126), (-0.4753, 0.2806), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.4753, 0.2806), (-0.09949, 1.126), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.09949, 1.126), (0.4753, 0.2806), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.8676, 0.1505), (2.74, 1.204), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.901, 1.126), (2.525, 0.2806), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.525, 0.2806), (2.901, 1.126), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.099, 1.126), (3.475, 0.2806), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.6, -0.6931), [#text(size: 9pt)[$v$]])
  content((-4.3, 0), [#text(size: 9pt)[cutoff $L_k$]], anchor: "east", padding: 0.1176cm)
  line((3.6, -1), (-3.6, -1), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, -1), [#text(size: 9pt)[order of switching]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: An ideal cutoff state immediately after the block below $v$ has switched. Earlier nodes retain their labels; $v$ and the nodes to its right have output $b$. Each parent applies its map to the weighted average of its children. The diagram displays a two-level example of this rule; in a deeper tree the same evaluation continues up to the root. The coefficients on the earlier labels specify $theta^v$, and their residual mass multiplies $b$. ],
) <fig:cutoff>

== 5 Switching leaves and completing the proof <sec:switching>

Fix the tree supplied by Proposition 12. Write $v prec.curly.eq s$ when $v = s$ or $v prec s$. For $N gt.eq 1$, set

$ cal(T)_N = union.big_(k = 0)^N L_k \, #h(2em) B_N \( v \) = { s in L_N : v prec.curly.eq s } quad \( v in cal(T)_N \) . $

The set $B_N \( v \)$ is a consecutive block in the ordering of $L_N$, and

$ sum_(s in B_N \( v \)) W_s = W_v . $

We first show that some path in each finite truncation has all its functionals large on one vector.

#thm([Proposition 5.1.])[
  (A finite witness).  #emph[For every $N gt.eq 1$, there are a leaf $s in L_N$ and a vector $d in B_Y$ such that 
$ f_v \( d \) gt.eq 1 / 2 #h(2em) \( r eq.not v prec.curly.eq s \) . $

]
] <prop:finite-witness>

#proof[
  Fix $N$. All the maps, weights, functionals, and budgets in $cal(T)_N$ are already fixed. Put
  $ M_k = min { e_v : v in L_1 union dots.h.c union L_k } #h(2em) \( 1 lt.eq k lt.eq N \) . $
  #emph[Choosing a common terminal point.] For each $v in cal(T)_N \\ { r }$, use the parameter $theta^v in Theta_v$ from Section 4: it assigns the actual weight $alpha_h$ to each earlier retained candidate $h in I_v$, and zero to each earlier discarded candidate. The point
  $ q_v = Z_v \( theta^v \) = "w-lim"_(j arrow.r cal(U)) Q_v \( b_j \; theta^v \) $
  belongs to $E_v$ by (4.5). By (4.9), $f_v \( y_v - q_v \) gt.eq 1 - e_v$. The definition of this weak ultrafilter limit therefore gives
  $ { j in bb(N) : f_v #scale(x: 120%, y: 120%)[\(] y_v - Q_v \( b_j \; theta^v \) #scale(x: 120%, y: 120%)[\)] gt.eq 1 - 2 e_v #scale(x: 120%, y: 120%)[}] in cal(U) . $
  There are only finitely many such conditions. Moreover, (3.3) and the approximate fixed point property of $\( b_j \)$ give
  $ sum_(u in cal(T)_N) ∥G_u \( b_j \) - b_j∥ arrow.r 0 . $
  Intersecting the finitely many ultrafilter members above with a suitable cofinite set, choose one $j$ and write $b = b_j$ so that
  #[#set math.equation(numbering: n => "(5.1)")
   $ f_v #scale(x: 120%, y: 120%)[\(] y_v - Q_v \( b \; theta^v \) #scale(x: 120%, y: 120%)[\)] & gt.eq 1 - 2 e_v &  & \( v in cal(T)_N \\ { r } \) \,\
D_N := sum_(u in cal(T)_N) ∥G_u \( b \) - b∥ & lt.eq M_N . $ <eq:terminal-detection>]
  #emph[The switching experiment.] Initially assign the output $H_s = y_s$ to each leaf $s in L_N$. Switch these outputs one at a time to $H_s = b$, proceeding from right to left. At each stage calculate every other output by (4.1). All outputs belong to $K$. For $v in cal(T)_N \\ { r }$, let $U_v$ and $V_v$ be the root outputs immediately before and immediately after the whole block $B_N \( v \)$ is switched.
  We need two estimates for subtrees whose leaves are all in the same state. If none of the leaves below $h in L_k$ have switched, then
  #[#set math.equation(numbering: n => "(5.2)")
   $ ∥H_h - y_h∥ lt.eq epsilon_(k \, N) := sum_(d = k)^(N - 1) tau_d . $ <eq:untouched-error>]
  Here and below an empty sum is zero. At a leaf this is an equality. For an internal node, nonexpansiveness and (4.8) give the induction step
  $ ∥H_h - y_h∥ & lt.eq ∥∥ * sum_(hat(u) = h) alpha_u H_u - x\
 & lt.eq sum_(hat(u) = h) alpha_u ∥H_u - y_u∥ + ∥∥ * sum_(hat(u) = h) alpha_u y_u - x lt.eq epsilon_(k + 1 \, N) + tau_k . $
  The tolerance schedule (4.7) yields, for $k gt.eq 1$ and every $v in L_k$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ epsilon_(k \, N) lt.eq M_k sum_(d = k)^oo 2^(- d - 1) = 2^(- k) M_k lt.eq e_v . $ <eq:uniform-level-error>]
  Thus the error in (5.2) is at most $e_v$ for every unchanged node at depth $k$, regardless of which $v in L_k$ is used in the comparison.
  If all the leaves below $h$ have switched, put $delta_u = ∥G_u \( b \) - b∥$. At each internal node of that subtree,
  $ ∥H_u - b∥ lt.eq sum_(hat(w) = u) alpha_w ∥H_w - b∥ + delta_u . $
  The error at each leaf is zero. Iteration gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ ∥H_h - b∥ lt.eq sum_(u in cal(T)_N \\ L_N\
h prec.curly.eq u) W_u / W_h delta_u lt.eq D_N lt.eq M_N . $ <eq:transmitted-error>]
  The coefficients $W_u \/ W_h$ are products of weights below $h$ and are at most one.
  #emph[Detection of an entire block.] Fix $v in L_k$, where $1 lt.eq k lt.eq N$, and consider the stage immediately before its block switches. Its output is within $e_v$ of $y_v$ by (5.2)–(5.3). Let $p_0 = r \, p_1 \, dots.h \, p_k = v$ be the path to $v$, and put $A_i = ∥H_(p_i) - y_v∥$ at this stage. Since every off-path child output and $y_v$ lie in the diameter-one set $K$, nonexpansiveness gives
  $ A_i lt.eq alpha_(p_(i + 1)) A_(i + 1) + \( 1 - alpha_(p_(i + 1)) \) + ∥G_(p_i) \( y_v \) - y_v∥ #h(2em) \( 0 lt.eq i < k \) . $
  The off-path contributions telescope:
  $ sum_(i = 0)^(k - 1) W_(p_i) \( 1 - alpha_(p_(i + 1)) \) = sum_(i = 0)^(k - 1) \( W_(p_i) - W_(p_(i + 1)) \) = 1 - W_v . $
  Unwinding the recurrence and using (4.9), we obtain
  #[#set math.equation(numbering: n => "(5.5)")
   $ ∥U_v - y_v∥ & lt.eq W_v e_v + \( 1 - W_v \) + sum_(i = 0)^(k - 1) W_(p_i) ∥G_(p_i) \( y_v \) - y_v∥\
 & lt.eq 1 - W_v + 2 e_v . $ <eq:before-block>]
  Immediately after the block has switched, precisely the level-$k$ nodes strictly to the left of $v$ have unchanged leaf blocks. By (5.3), their outputs are within $e_v$ of their labels $y_h$. The outputs at all the other level-$k$ nodes are within $M_N lt.eq e_v$ of $b$ by (5.4). The ideal level-$k$ assignment consisting of these $y_h$ on the left and $b$ elsewhere has root output $Q_v \( b \; theta^v \)$ by (4.10). The sensitivity estimate (4.2) and $sum_(h in L_k) W_h = 1$ therefore imply
  #[#set math.equation(numbering: n => "(5.6)")
   $ ∥V_v - Q_v \( b \; theta^v \)∥ lt.eq e_v . $ <eq:after-block>]
  Together, (5.1), (5.5), and (5.6) give
  #[#set math.equation(numbering: n => "(5.7)")
   $ f_v \( U_v - V_v \) & gt.eq f_v #scale(x: 120%, y: 120%)[\(] y_v - Q_v \( b \; theta^v \) #scale(x: 120%, y: 120%)[\)] - ∥U_v - y_v∥ - ∥V_v - Q_v \( b \; theta^v \)∥\
 & gt.eq \( 1 - 2 e_v \) - \( 1 - W_v + 2 e_v \) - e_v = W_v - 5 e_v . $ <eq:block-detection>]
  #emph[A common witness along one path.] For a single leaf $s$, only its output changes during its switch. By (4.2),
  $ ∥U_s - V_s∥ lt.eq W_s ∥y_s - b∥ lt.eq W_s . $
  Since $W_s > 0$ and both root outputs belong to $K$, the vector
  $ d_s = frac(U_s - V_s, W_s) $
  belongs to $B_Y$. The successive root differences over a consecutive block telescope, so
  $ sum_(s in B_N \( v \)) W_s d_s = U_v - V_v . $
  Applying $f_v$ to this identity and using (5.7) yields
  #[#set math.equation(numbering: n => "(5.8)")
   $ sum_(s in B_N \( v \)) W_s #scale(x: 120%, y: 120%)[\(] 1 - f_v \( d_s \) #scale(x: 120%, y: 120%)[\)] = W_v - f_v \( U_v - V_v \) lt.eq 5 e_v . $ <eq:weighted-deficit>]
  Each summand is nonnegative, because $∥f_v∥ lt.eq 1$ and $∥d_s∥ lt.eq 1$. Summing over the non-root nodes and interchanging the two finite sums gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ sum_(s in L_N) W_s sum_(r eq.not v prec.curly.eq s) #scale(x: 120%, y: 120%)[\(] 1 - f_v \( d_s \) #scale(x: 120%, y: 120%)[\)] lt.eq 5 sum_(v in cal(T)_N \\ { r }) e_v lt.eq 5 / 128 . $ <eq:total-deficit>]
  If a leaf $s$ has $f_v \( d_s \) lt.eq 1 \/ 2$ for any non-root node $v$ on its path, its inner sum in (5.9) is at least $1 \/ 2$. Consequently, the total weight of all such leaves is at most $5 \/ 64$. Since the leaf weights sum to one, some leaf has $f_v \( d_s \) > 1 \/ 2$ for every non-root node $v$ on its path. This proves the proposition. ◻
]

#proof[
  Suppose a counterexample exists. The reduction and constructions in Sections 2–4 give the fixed infinite tree to which Proposition 13 applies. Call a node $v$ #emph[feasible] if some $d in B_Y$ satisfies
  $ f_u \( d \) gt.eq 1 / 2 #h(2em) \( r eq.not u prec.curly.eq v \) . $
  The root is feasible, and every ancestor of a feasible node is feasible. Proposition 13 gives a feasible node at every depth. These nodes therefore form a finitely branching tree with arbitrarily great depth. Starting from the root, choose a child having feasible descendants at arbitrarily great depths, and repeat. Such a child always exists because each node has finitely many children. This produces a branch $r \, v_1 \, v_2 \, dots.h$, with $v_k in L_k$, all of whose nodes are feasible.
  For each $k gt.eq 1$, the set
  $ C_k = { d in B_Y : f_(v_i) \( d \) gt.eq 1 \/ 2 upright(" for ") 1 lt.eq i lt.eq k } $
  is nonempty and weakly closed in $B_Y$, and $C_(k + 1) subset.eq C_k$. The normalized differences used in Proposition 13 are controlled in the whole unit ball $B_Y$. Reflexivity supplies weak compactness of this ball, as established in Section 2. It follows that there is one vector
  #[#set math.equation(numbering: n => "(5.10)")
   $ d in ⋂_(k = 1)^oo C_k \, #h(2em) f_(v_k) \( d \) gt.eq 1 / 2 quad \( k gt.eq 1 \) . $ <eq:common-branch-vector>]
  On the other hand, the functionals on every branch converge pointwise to zero on $Y$. Indeed, for fixed $i \, j$ and $k gt.eq max { i \, j }$, (4.9) and $"diam" K = 1$ give
  $ 1 - e_(v_k) lt.eq f_(v_k) \( y_(v_k) - z_i \) lt.eq 1 \, #h(2em) 1 - e_(v_k) lt.eq f_(v_k) \( y_(v_k) - z_j \) lt.eq 1 . $
  Subtracting these inequalities yields
  $ lr(|f_(v_k) \( z_i - z_j \)|) lt.eq e_(v_k) arrow.r 0 \, $
  where the convergence follows from the summability of the budgets. The linear span of the differences $z_i - z_j$ is dense in $Y = overline("span") \( K - K \)$. Hence the bound $∥f_(v_k)∥ lt.eq 1$ extends this convergence to every $d' in Y$: for any vector $a$ in that span,
  $ lr(|f_(v_k) \( d' \)|) lt.eq ∥d' - a∥ + lr(|f_(v_k) \( a \)|) \, $
  and one first lets $k$ tend to infinity and then lets $a$ approach $d'$. In particular $f_(v_k) \( d \) arrow.r 0$, contradicting (5.10). The assumed counterexample cannot exist. ◻
]

== 6 Separation and compactness <app:foundations>

Here $X$ is a general real normed space, as in Lemma 3.

#proof[
  We begin with the Hahn–Banach extension argument underlying the first two assertions. Suppose that a linear functional $ell$ on a subspace $M$ is dominated by a continuous sublinear function $p$ on $X$. To extend it to $M + bb(R) b$, where $b in.not M$, choose its value at $b$ in the interval
  $ sup_(a in M) #scale(x: 120%, y: 120%)[\(] ell \( a \) - p \( a - b \) #scale(x: 120%, y: 120%)[\)] med lt.eq med ell \( b \) med lt.eq med inf_(c in M) #scale(x: 120%, y: 120%)[\(] p \( c + b \) - ell \( c \) #scale(x: 120%, y: 120%)[\)] . $
  This interval is nonempty because $ell \( a \) + ell \( c \) lt.eq p \( a + c \) lt.eq p \( a - b \) + p \( c + b \)$. Its endpoints are finite, as is seen by setting $a = 0$ or $c = 0$ in this inequality. The displayed bounds give domination on $a + b$ and $a - b$; positive homogeneity then gives domination on $a + t b$ for every real $t$. Unions of chains of dominated extensions remain dominated extensions, so Zorn’s Lemma gives an extension to $X$. It is continuous because domination of both $v$ and $- v$ bounds its absolute value near zero. Applying this construction with $p = ∥dot.op∥$ and $ell \( t v \) = t ∥v∥$ gives a norming functional (use the zero functional when $v = 0$). In particular,
  $ ∥v∥ = sup_(f in X^(*) \, med ∥f∥ lt.eq 1) f \( v \) . $
  For separation, let $q$ lie outside a nonempty norm-closed convex set $D$. Choose $rho > 0$ such that the open convex set $U = D + { v : ∥v∥ < rho }$ still excludes $q$, and fix $u in U$. The gauge
  $ p \( v \) = inf { t > 0 : v in t \( U - u \) } $
  is finite, nonnegative, positively homogeneous, and subadditive. For the last property, if $v in s \( U - u \)$ and $w in t \( U - u \)$, convexity gives $v + w in \( s + t \) \( U - u \)$, and one takes infima. Since $U - u$ is open, convex, and contains zero, ${ v : p \( v \) < 1 } = U - u$: one inclusion follows from convexity, and the other by extending a little past a given point along its ray using openness. A ball about zero contained in $U - u$ gives $p \( v \) lt.eq c ∥v∥$ for some $c$; subadditivity then makes $p$ continuous. On the line through $q - u$, the functional taking the value $p \( q - u \)$ at $q - u$ is dominated by $p$; for negative multiples this follows from $- p \( q - u \) lt.eq p \( u - q \)$. Its extension $f$ therefore satisfies
  $ f \( z - u \) < 1 lt.eq f \( q - u \) #h(2em) \( z in U \) . $
  In particular $f eq.not 0$, and taking the supremum over the ball of radius $rho$ added to any $d in D$ gives $f \( d \) + rho ∥f∥ lt.eq f \( q \)$. Thus $f$ separates $q$ from $D$ with a positive gap. This proves weak closedness of $D$. Applied to closed balls it proves weak lower semicontinuity of the norm. Separation also shows that the weak closure of a convex set equals its norm closure. On $X^r$, equipped with the maximum norm, every continuous linear functional has the form $sum_(i = 1)^r f_i \( x_i \)$, with $f_i in X^(*)$, by restriction to the coordinate subspaces. This proves the assertion about the finite-product topology and allows the same separation argument there.
  Here are the compactness details. A proper filter is a family of subsets closed under finite intersections and supersets, containing the whole space but not the empty set. By Zorn’s Lemma it extends to a maximal proper filter, called an ultrafilter. For every subset an ultrafilter contains either that subset or its complement: if the subset cannot be added while preserving the filter property, an existing filter member misses it. An ultrafilter converges to a point when it contains every neighborhood of that point. In a compact space it converges: the closures of its members have the finite intersection property, and any point in their intersection is a limit by the preceding either-or property. Limits are unique in a Hausdorff space. Conversely, if every ultrafilter converges, extend any family of closed sets with the finite intersection property to an ultrafilter; its limit belongs to all those sets. This is the closed-set criterion for compactness. An ultrafilter on a product of compact spaces has a limit in each coordinate, and the tuple of these limits is its limit, since a basic product neighborhood restricts only finitely many coordinates. This proves product compactness.
  Now let $D subset.eq X$ be bounded, norm closed, and convex, with $X$ reflexive. Given an ultrafilter $cal(V)$ on $D$, each bounded real evaluation has a limit in a compact interval, and
  $ L \( f \) = lim_(cal(V)) f \( d \) #h(2em) \( f in X^(*) \) $
  defines a linear functional with $lr(|L \( f \)|) lt.eq M ∥f∥$, where $M = sup_(d in D) ∥d∥$. Linearity follows by intersecting the filter members on which each of two evaluations is close to its limit. Reflexivity supplies $a in X$ with $L \( f \) = f \( a \)$ for every $f$. Thus $cal(V)$ converges weakly to $a$, and weak closedness gives $a in D$. The ultrafilter criterion proves weak compactness. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
