#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A surface counterexample to Shafarevich holomorphic convexity]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Shafarevich asked whether the universal cover of a complete algebraic variety is holomorphically convex #cite(label("Shafarevich1974")). We follow the formulation reproduced by #cite(label("LasellRamachandran1996"), form: "prose") pp. 135–137, who locate the question on p. 407 of Shafarevich’s book. We use its usual smooth-projective formulation, called the #emph[Shafarevich conjecture on holomorphic convexity]: the universal cover of every smooth connected projective complex variety is holomorphically convex. For a complex manifold $V$ and a nonempty compact set $K subset V$, its #emph[holomorphic hull] is

$ hat(K)_V = { v in V : \| g \( v \) \| lt.eq sup_K \| g \| upright(" for every ") g in cal(O) \( V \) } . $

Holomorphic convexity means that every such hull is compact. We disprove the conjecture in complex dimension two.

#thm([Theorem 1.1.])[
  #emph[There is a smooth connected projective complex surface $X$ containing a connected nodal curve $Z_0$ with smooth rational irreducible components such that 
$ "im" #scale(x: 120%, y: 120%)[\(] pi_1 \( Z_0 \) arrow.r pi_1 \( X \) #scale(x: 120%, y: 120%)[\)] quad upright("is infinite") . $

 In the simply connected universal cover of $X$, a connected component above $Z_0$ is a closed, connected, noncompact, locally finite union of compact rational curves. The holomorphic hull of any one of its points is noncompact. In particular, this universal cover is not holomorphically convex.]
] <thm:main>

=== 1.1 Earlier approaches and the obstruction <earlier-approaches-and-the-obstruction>

The conjecture connects projective geometry with the analytic geometry of covering spaces. Gurjar and Shastri proved it for smooth projective elliptic surfaces #cite(label("GurjarShastri1985")) Theorem 2(ii), and Katzarkov proved it for smooth projective varieties with virtually nilpotent fundamental group #cite(label("Katzarkov1997")). Eyssidieux proved holomorphic convexity for the cover defined by the intersection of the kernels of all reductive complex representations of a fixed rank #cite(label("Eyssidieux2004")). Eyssidieux, Katzarkov, Pantev and Ramachandran then established the universal-cover conclusion for smooth projective varieties whose fundamental groups admit faithful finite-dimensional complex representations #cite(label("EyssidieuxKatzarkovPantevRamachandran2012")). Campana, Claudon and Eyssidieux extended this linear Shafarevich theorem to compact Kähler manifolds #cite(label("CampanaClaudonEyssidieux2015")).

Recent results extend this theory beyond smooth projective varieties. Deng and Yamanoi, with an appendix joint with Katzarkov, proved the fixed-rank reductive-cover conclusion for normal projective varieties #cite(label("DengYamanoi2024")) Theorem C(i). Bakker, Brunebarbe and Tsimerman proved that, for a connected normal algebraic space whose fundamental group has a finite-dimensional complex representation with finite kernel, the universal cover is a dense analytic-Zariski open subset of a holomorphically convex complex space #cite(label("BakkerBrunebarbeTsimerman2026")) Theorem 1.1. This last conclusion concerns a partial compactification of the universal cover.

The geometric reduction approach seeks to contract subvarieties for which the fundamental group of the normalization has finite image in the ambient fundamental group. Kollár’s rational Shafarevich maps and Campana’s meromorphic $Gamma$-reduction address this problem through sufficiently general points #cite(label("Kollar1993")) §1 #cite(label("Campana1994")) Theorem 3.5 and Definition 3.8. Such generic reductions do not by themselves provide a proper holomorphic map from the entire universal cover to a Stein space.

The obstruction used in the present construction is classical. Lasell and Ramachandran #cite(label("LasellRamachandran1996")) pp. 136–137 and Katzarkov and Ramachandran #cite(label("KatzarkovRamachandran1998")) pp. 527–528 explain why a connected curve can obstruct holomorphic convexity when its normalized components have finite fundamental-group image but the curve itself has infinite image. A connected lift then has compact irreducible components but is itself noncompact. Such a curve is called an #emph[infinite Nori string] #cite(label("ColtoiuJoita2011")) arXiv version, Definition 3. Every holomorphic function is constant on each compact component, and connectedness makes these constants agree. A closed infinite Nori string therefore cannot lie in a holomorphically convex space. For our rational components the individual fundamental groups are trivial; the decisive issue is the image of the loops in the incidence graph of their whole nodal union.

Bogomolov and Katzarkov proposed constructions from degenerating curves and quotients of their fundamental groups in which this obstruction would occur if the resulting geometric quotient remained infinite after all required relations #cite(label("BogomolovKatzarkov1998")) author manuscript, §4.1, Lemma 4.2 and Conjecture 4.1. That infinitude assertion remained conditional. Eyssidieux and Funar subsequently proved holomorphic convexity for the associated uniform-ramification construction from semistable families of curves of genus at least two, outside explicit finite exceptional ranges #cite(label("EyssidieuxFunar")) Theorems 1.2 and 6.18.

The construction here follows the same broad passage from a family of curves to a group quotient and then to a projective surface. Its input is a marked genus-zero family, with both horizontal marked sections and vertical boundary components. A #emph[meridian] is the boundary of a small disk transverse to a divisor. We kill the meridians of one distinguished fiber and impose high powers of the remaining boundary meridians only after compactification. The argument must establish both infinitude of this particular quotient and its survival in the final surface. The weighted presentation proves the first assertion; finite detection of entire local boundary-group images, followed by transfer to the compact rational fiber, proves the second. These are the steps developed below.

=== 1.2 Consequences and comparisons <consequences-and-comparisons>

By the linear Shafarevich theorem, the fundamental group of the surface in 1 has no faithful finite-dimensional complex representation. Two further comparisons concern restrictions on the surface and on its universal cover.

A smooth compact Kähler manifold $M$ is #emph[special] in Campana’s sense if no holomorphic line bundle $L$ admits a nonzero map $L arrow.r Omega_M^p$ with $kappa \( M \, L \) = p$ for any $1 lt.eq p lt.eq dim M$; here $kappa$ denotes Iitaka dimension #cite(label("Campana2004")) Theorem 2.27. The abelianity theorem for special compact Kähler manifolds gives a virtually abelian fundamental group, and hence a faithful finite-dimensional complex representation. The compact Kähler linear theorem therefore makes their ordinary universal covers holomorphically convex #cite(label("OpenAIAbelianity2026")) Corollary 1.4. Consequently the surface in 1 is not special.

A subset of a complex projective variety is #emph[semialgebraic] if it is given in affine charts by finite Boolean combinations of real polynomial equalities and inequalities. The ordinary universal cover of our surface is not biholomorphic to a semialgebraic open subset of a projective variety, with openness in the complex topology: such a presentation would imply holomorphic convexity by #cite(label("OpenAISemialgebraicCovers2026")) Corollary 8.1, contrary to 1.

=== 1.3 The construction in outline <the-construction-in-outline>

We begin with a family of spheres with $48$ moving punctures. The family comes from multiplication by $4$ on the elliptic curve with an automorphism of order three. Near one parameter value, the punctures collide in $24$ pairs. A double base change and one blowup at each collision produce an unmarked main sphere with $24$ attached spheres, each carrying two marked points. Finite covers of these components, branched only at those points, are again rational.

The main task is to retain an infinite fundamental-group image after filling in this fiber and all other missing fibers. Three features make this possible.

First, we study the moving points on the elliptic curve before taking its sign quotient. Three explicit double covers show that monodromy changes each generator only in higher degree. Deep elements of the free parameter group therefore impose relations of arbitrarily high degree. A surjective map of the actual based fiber groups transfers these equalities to the sphere family.

Second, the multiplication cover has deck group $\( bb(Z) \/ 4 \)^2$. Successive differences under its two translations give a free basis with useful degrees. A calculation with the linear terms of the sign involution selects $24$ relations that impose all sign identifications on this $48$-generator group. These relations leave a strict margin in a weighted Golod–Shafarevich inequality. That margin accommodates the deep monodromy relations and large powers of the remaining boundary loops. The weighted infinitude method builds on #cite(label("GolodShafarevich1964"), form: "prose"), #cite(label("Golod1964"), form: "prose"), #cite(label("Vinberg1965"), form: "prose"), #cite(label("Ershov2011"), form: "prose"), and #cite(label("ErshovJaikinZapirain2013"), form: "prose"). The group construction takes place in inverse limits of finite 2-groups, described in 2.

Third, we choose the finite parameter cover and compactify the marked family. Only then do we impose high powers of the remaining boundary meridians so that their images are finite. We then choose a finite quotient that is injective on each entire local boundary-group image. In the associated cover, this lets the infinite quotient survive normalization and resolution, including every exceptional divisor. The resulting smooth projective surface retains a rational special fiber. A neighborhood deformation retraction and properness transfer the infinite image of a nearby fiber to a connected component of that rational fiber.

The two reusable mechanisms are the economical involution presentation in 12 and the finite-local-group argument in 17. The former retains enough generators relative to relations for the weighted infinitude criterion; the latter extends a homomorphism from the fundamental group of a divisor complement across a smooth projective compactification of a finite cover.

We give the weighted algebra in 2, construct and compare the actual fiber groups in 3, and analyze the involution in 4. 5 constructs the infinite quotient and the compactified marked family. 6 completes the surface and its rational curve.

=== 1.4 Why the rational curve is enough <why-the-rational-curve-is-enough>

The following elementary form of the compact-curve obstruction makes the last step explicit. It is the rational-curve case of the mechanism described in #cite(label("LasellRamachandran1996"), form: "prose") pp. 136–137, #cite(label("KatzarkovRamachandran1998"), form: "prose") pp. 527–528, and #cite(label("BogomolovKatzarkov1998"), form: "prose") author manuscript, §4.1.

#thm([Lemma 1.2.])[
  #emph[Let $X$ be a connected complex manifold and let $Z subset X$ be a compact connected nodal curve whose irreducible components are smooth rational curves. If the image of $pi_1 \( Z \) arrow.r pi_1 \( X \)$ is infinite, then every connected component $W$ of the inverse image of $Z$ in the simply connected universal cover $tilde(X)$ is closed and noncompact. It is a locally finite union of compact rational curves, and every holomorphic function on $tilde(X)$ is constant on $W$. Consequently $accent({ w }, ̂)_(tilde(X))$ is noncompact for every $w in W$.]
] <lem:rational-hull>

#proof[
  The restricted map $W arrow.r Z$ is the connected covering corresponding to
  $ ker #scale(x: 120%, y: 120%)[\(] pi_1 \( Z \) arrow.r pi_1 \( X \) #scale(x: 120%, y: 120%)[\)] . $
  Thus it has infinitely many sheets. A fiber is a closed discrete infinite subset, so $W$ cannot be compact. It is closed in $tilde(X)$, since it is a connected component of the closed inverse image of $Z$.
  Each rational component of $Z$ is simply connected. Its inverse image therefore consists of compact rational curves mapping isomorphically onto it. Choose an evenly covered neighborhood in $X$ of each point of $Z$, small enough that it meets $Z$ in one smooth branch or in the two branches of a node. Each lifted neighborhood meets at most one or two lifted components. These neighborhoods show that the collection is locally finite in the ambient manifold $tilde(X)$; points outside the closed inverse image have a neighborhood meeting none of it. The connected space $W$ is locally path connected; a path in it has compact image and meets only finitely many of these curves. The maximum principle makes a holomorphic function constant on each compact curve, and the constants agree at their intersections. They therefore agree throughout $W$.
  For $w in W$, this proves $W subset accent({ w }, ̂)_(tilde(X))$. A compact hull cannot contain the closed noncompact set $W$. ◻
]

== 2 Weighted free pro-2 groups <sec:weighted>

We will construct an infinite quotient by comparing the weighted number of generators with the weighted number of relations. This section records the precise version of the Golod–Shafarevich argument that we use, including convergence for infinitely many relators.

=== 2.1 Magnus degrees and automorphisms <magnus-degrees-and-automorphisms>

A pro-2 group is an inverse limit of finite groups of order a power of two. The free pro-2 group on a finite set is the pro-2 completion of the discrete free group on that set. Let $F_d$ be free pro-2 on $g_1 \, dots.h \, g_d$, and assign positive integer weights $w_1 \, dots.h \, w_d$. Its Magnus expansion sends

$ g_i mapsto 1 + U_i quad upright("in") quad A = bb(F)_2 chevron.l #h(-0.16667em) chevron.l U_1 \, dots.h \, U_d chevron.r #h(-0.16667em) chevron.r \, #h(2em) deg U_i = w_i . $

Here $A$ is the algebra of formal noncommutative power series, with the filtration $A_(gt.eq n)$ by weighted degree at least $n$. For $g eq.not 1$, let $nu \( g \)$ be the least degree in $g - 1$, and put $nu \( 1 \) = oo$.

For clarity, this expansion is faithful and gives the pro-2 topology. Each truncated algebra is finite, and its group $1 + A_(> 0) \/ A_(gt.eq n)$ is a finite 2-group. Conversely the augmentation ideal of $bb(F)_2 \[ P \]$ is nilpotent for every finite 2-group $P$. To see this, induct on $\| P \|$, choosing a central involution $z$ when $P eq.not 1$. The kernel of $bb(F)_2 \[ P \] arrow.r bb(F)_2 \[ P \/ chevron.l z chevron.r \]$ is generated by $z - 1$ and has square zero. Nilpotence follows by induction. Thus every finite 2-quotient of the free group factors through some Magnus truncation. This proves faithfulness on the pro-2 completion and cofinality of the truncations. Positive finite weights give the same topology as ordinary degree.

Multiplication of series gives

#[#set math.equation(numbering: n => "(1)")
 $ nu \( g h \) gt.eq min { nu \( g \) \, nu \( h \) } \, #h(2em) nu \( \[ g \, h \] \) gt.eq nu \( g \) + nu \( h \) \, #h(2em) nu \( g^(2^e) \) gt.eq 2^e nu \( g \) . $ <eq:degree-rules>]

We use either commutator convention, since only its degree matters. The last inequality follows from $g^(2^e) - 1 = \( g - 1 \)^(2^e)$ in characteristic two.

#thm([Lemma 2.1.])[
  (Substitution).  #emph[Suppose an automorphism $alpha$ of $F_d$ satisfies 
$ nu #scale(x: 120%, y: 120%)[\(] alpha \( g_i \) g_i^(- 1) #scale(x: 120%, y: 120%)[\)] gt.eq w_i + a quad \( 1 lt.eq i lt.eq d \) $

 for an integer $a gt.eq 1$. Then its continuous action on $A$ satisfies 
$ \( alpha - "id" \) \( A_(gt.eq n) \) subset A_(gt.eq n + a) . $

 More generally, substitution of degree-raising operators for Magnus variables is well defined whenever the operator assigned to a variable of weight $w$ raises degree by at least $w$.]
] <lem:substitution>

#proof[
  The hypothesis says that $alpha \( U_i \) - U_i$ has degree at least $w_i + a$. Expand the difference between a monomial and its substituted image. Every summand replaces at least one factor by an error of at least $a$ additional degrees. The estimate follows for polynomials and then for series by completeness. For operator substitution, a word of weighted degree $n$ raises degree by at least $n$; hence only finitely many words contribute in each finite truncation. Multiplication and composition respect these substitutions. ◻
]

We also use the following basis criterion. The #emph[Frattini quotient] of a finitely generated pro-2 group $G$ is

$ G \/ overline(G^2 \[ G \, G \]) \, $

an $bb(F)_2$-vector space. Elements whose images span this space topologically generate $G$: otherwise their closed generated subgroup has proper image in a finite 2-quotient, and is contained in a maximal subgroup of index two there, contradicting the span. Consequently, $d$ elements of $F_d$ whose Frattini images form a basis are again a free pro-2 basis. Indeed, they define a surjective endomorphism of $F_d$, and every finitely generated profinite group is Hopfian. For the latter assertion, a surjective endomorphism permutes, by inverse image, the finite set of open normal subgroups of any fixed index. Its kernel therefore lies in every open normal subgroup and is trivial.

=== 2.2 The infinitude inequality <the-infinitude-inequality>

The infinitude method originates in the work of #cite(label("GolodShafarevich1964"), form: "prose"); #cite(label("Vinberg1965"), form: "prose") developed its filtered form. For the weighted completed-algebra inequality and its pro-$p$ consequence, see #cite(label("Ershov2011"), form: "prose") Theorem 2.1 and Corollary 2.2. The more general language of positive weighted deficiency is developed by #cite(label("ErshovJaikinZapirain2013"), form: "prose") arXiv version, Corollary 4.4. We include the filtered proof needed here to specify exactly the completion and the infinite-relator convention.

#thm([Lemma 2.2.])[
  (Weighted infinitude criterion).  #emph[Let $F_d$ have the weighted basis above, and let $\( r_lambda \)$ be a finite or countable family of relators with positive integer bounds $v_lambda$ satisfying 
$ nu \( r_lambda \) gt.eq v_lambda gt.eq 1 . $

 Assume only finitely many $v_lambda$ lie below any fixed bound. If, for some $0 < t < 1$, the relator series converges and 
#[#set math.equation(numbering: n => "(2)")
 $ 1 - sum_(i = 1)^d t^(w_i) + sum_lambda t^(v_lambda) < 0 \, $ <eq:gs-criterion>]

 then the quotient of $F_d$ by the closed normal subgroup generated by all $r_lambda$ is infinite.]
] <lem:weighted-gs>

#proof[
  Let $I subset A$ be the closed two-sided ideal generated by $f_lambda = r_lambda - 1$, and let $R = A \/ I$ with its quotient filtration. Put
  $ C \( n \) = dim_(bb(F)_2) R \/ R_(gt.eq n) quad \( n gt.eq 1 \) \, #h(2em) C \( n \) = 0 quad \( n lt.eq 0 \) . $
  First-letter decomposition gives a surjective map
  $ xor.big_i R \/ R_(gt.eq n - w_i) arrow.r R_(> 0) \/ R_(gt.eq n) \, #h(2em) \( b_i \)_i mapsto sum_i U_i b_i . $
  Its kernel has dimension at most $sum_lambda C \( n - v_lambda \)$. Here is the filtered justification. Write $f_lambda = sum_i U_i f_(i lambda)$. A vector in the kernel can be lifted to series whose first-letter sum lies in $I + A_(gt.eq n)$. Subtracting the first-letter decomposition of the degree-at-least-$n$ term does not change the truncated vector, so the sum may be taken in $I$. For a product $a f_lambda h$, the positive-degree part of $a$ contributes first-letter coefficients that vanish in $R$; its constant part contributes
  $ \( overline(f_(i lambda)) \)_i thin macron(h) . $
  This vector has shifted degree at least $v_lambda$. Only $macron(h)$ modulo $R_(gt.eq n - v_lambda)$ matters. These vectors therefore span a space of dimension at most $sum_lambda C \( n - v_lambda \)$. Closure adds nothing to a span in a finite-dimensional truncation. Since $dim R_(> 0) \/ R_(gt.eq n) = C \( n \) - 1$, we obtain
  #[#set math.equation(numbering: n => "(3)")
   $ C \( n \) - sum_i C \( n - w_i \) + sum_lambda C \( n - v_lambda \) gt.eq 1 . $ <eq:cumulative-gs>]
  Suppose the stated pro-2 quotient were finite, of order $m$. Its image spans every truncated algebra $R \/ R_(gt.eq n)$: the variables are the images of $g_i - 1$, and their products are linear combinations of group elements. The group map to each truncated unit group kills the relators, hence factors through that quotient. Thus $C \( n \) lt.eq m$ for all $n$. Multiply (3) by $t^(n - 1)$ and sum over $n gt.eq 1$. Boundedness of $C \( n \)$ and convergence of the relator series justify the sums. This gives
  $ (1 - sum_i t^(w_i) + sum_lambda t^(v_lambda)) sum_(n gt.eq 1) C \( n \) t^(n - 1) gt.eq frac(1, 1 - t) \, $
  contradicting (2). ◻
]

The use of lower bounds $v_lambda$ makes the criterion convenient: increasing an actual relator degree can only improve the inequality. In the construction below, the inexpensive relations impose a geometric involution. The remaining relations will be pushed arbitrarily far into the filtration.

== 3 A family of paired punctures <sec:family>

We construct a family of spheres with 48 marked points. Near one missing parameter value these points form 24 disjoint pairs. The purpose of this section is to relate the actual based monodromy of the family to an action on a free group whose weighted Magnus degree it raises. We also identify the quotient obtained by killing the loops around the pairs.

=== 3.1 The family and its torus cover <the-family-and-its-torus-cover>

Put

$ E = bb(C) \/ \( bb(Z) + bb(Z) omega \) \, #h(2em) omega^3 = 1 \, quad omega eq.not 1 \, #h(2em) iota \( z \) = - z . $

Let $q : E arrow.r E \/ chevron.l iota chevron.r = bb(P)^1$ be the quotient map. Multiplication by $omega$ and by $4$ induce maps $macron(omega)$ and $f$ on $bb(P)^1$, respectively. Thus

$ q compose \[ 4 \] = f compose q \, #h(2em) q compose \[ omega \] = macron(omega) compose q . $

Our parameter curve is

#[#set math.equation(numbering: n => "(4)")
 $ B = bb(P)^1 \\ #scale(x: 120%, y: 120%)[\(] q \( E \[ 2 \] \) union q \( ker \( 1 - omega \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:parameter-base>]

For $s in B$, let $cal(A)_s$ be the following subset of the fiber sphere:

#[#set math.equation(numbering: n => "(5)")
 $ cal(A)_s = { z in bb(P)^1 : f \( z \) = macron(omega)^j s upright(" for some ") j in { 0 \, 1 \, 2 } } . $ <eq:sphere-markings>]

#thm([Lemma 3.1.])[
  #emph[The complement defining $B$ consists of five points. The sets $cal(A)_s$ form 48 disjoint points varying as an #emph[étale multisection]: locally on $B$ they are the graphs of 48 distinct holomorphic functions. The point $q \( 0 \)$ belongs to no $cal(A)_s$. If $e_0 in E \[ 2 \] \\ { 0 }$ and $s_(*) = q \( e_0 \)$, then as $s arrow.r s_(*)$ the markings collide in 24 pairs, each at a simple ramification point of $f$.]
] <lem:family>

#proof[
  The group $ker \( 1 - omega \)$ has order three. Its two nonzero points are exchanged by $iota$, and its intersection with $E \[ 2 \]$ is ${ 0 }$. This gives the five excluded values. A fixed point of $macron(omega)$ lifts to a point satisfying $omega z = plus.minus z$; since $1 + omega$ is a unit in $bb(Z) \[ omega \]$, all such values are excluded by (4). The three targets in (5) are therefore distinct. They avoid $q \( E \[ 2 \] \)$, which contains the critical values of the degree-16 map $f$. Also $f \( q \( 0 \) \) = q \( 0 \)$, so $q \( 0 \)$ gives a section of the complement.
  The three points $e_j = omega^j e_0$ are the distinct nonzero elements of $E \[ 2 \]$. A point $p in E$ with $\[ 4 \] p = e_j$ is not two-torsion. Consequently $q$ is unramified at $p$, $\[ 4 \]$ is étale there, and $q$ is simply ramified at $e_j$. Thus $f$ has simple ramification at $q \( p \)$. The sixteen points above each $e_j$ are paired freely by $iota$, giving eight collisions for each $j$ and 24 in total. ◻
]

Choose henceforth $e_0 in E \[ 2 \] \\ { 0 }$ and put $s_(*) = q \( e_0 \)$. Fix $s_0 in B$ sufficiently close to $s_(*)$, and choose $x_0 in q^(- 1) \( s_0 \)$ close to $e_0$. The six points $plus.minus omega^j x_0$ lie, two at a time, in disjoint $iota$-invariant disks $D_j$ about $e_j$, none containing zero. Write

$ T = E \\ { plus.minus omega^j x_0 : 0 lt.eq j lt.eq 2 } \, #h(2em) F = pi_1 \( T \, 0 \) \, #h(2em) Gamma = pi_1 \( B \, s_0 \) . $

The group $Gamma$ is free of rank four. In the core $E \\ union.big_j "int" D_j$, choose handle generators $x \, y$ representing the lattice basis $1 \, omega$. Choose based meridians $a_j \, a_j^(-)$ about the two punctures in $D_j$, with core access paths, so that its boundary loop is $c_j = a_j a_j^(-)$. The choices and ordering can be made so that the surface relation is $\[ x \, y \] c_0 c_1 c_2 = 1$. Hence $F$ is free on

#[#set math.equation(numbering: n => "(6)")
 $ x \, y \, a_0 \, a_1 \, a_2 \, c_0 \, c_1 . $ <eq:torus-free-basis>]

Give the first five generators weight one and the last two weight two. Let $nu_F$ be the resulting Magnus valuation on the pro-2 completion $hat(F)$. The surface relation gives $nu_F \( c_2 \) gt.eq 2$.

The multiplication map $\[ 4 \]$ restricts to an unramified cover of $T$. Its deck group and based covering subgroup are

$ H = \( bb(Z) \/ 4 \)^2 \, #h(2em) K = ker #scale(x: 120%, y: 120%)[\(] F arrow.r H #scale(x: 120%, y: 120%)[\)] \, $

where the map records the two handle coordinates modulo four. Thus $K$ is free of rank $1 + 16 \( 7 - 1 \) = 97$. Its source is

$ T^(\( 4 \)) = \[ 4 \]^(- 1) \( T \) \, #h(2em) K = pi_1 \( T^(\( 4 \)) \, 0 \) \, $

the torus with the 96 preimages of the six punctures removed. Quotienting $T^(\( 4 \))$ by $iota$ gives

$ S = bb(P)^1 \\ cal(A)_(s_0) \, #h(2em) Pi = pi_1 \( S \, q \( 0 \) \) . $

We identify $K$ with the based fundamental group of the source torus through $\[ 4 \]$ and denote by $p : K arrow.r Pi$ the map induced by $q$. The group $Pi$ is free of rank 47.

The two fiber groups serve different purposes. The torus group $F$ has a small basis on which monodromy can be controlled; the sphere group $Pi$ is the fundamental group of the geometric fiber used in the surface. The covering subgroup $K$ will connect these two descriptions. Keeping this connection based, rather than only up to an inner automorphism, is essential when we impose monodromy relations.

=== 3.2 Actual based monodromy <actual-based-monodromy>

Following $x_0$ over a loop $m in Gamma$ ends at $\( - 1 \)^(epsilon.alt \( m \)) x_0$; this defines a character $epsilon.alt : Gamma arrow.r bb(Z) \/ 2$. Follow also the six points $plus.minus omega^j x_0$. Their motion extends to an isotopy $H_u$ of the torus which fixes zero and commutes with $iota$. Indeed, subdivide the path into motions in disjoint small disks, prescribe a vector field in one disk of each sign pair, extend it equivariantly to the other, and use bump functions supported away from zero. Every $H_u$ fixes all four points of $E \[ 2 \]$ pointwise: commutation with $iota$ preserves this discrete fixed-point set, and an isotopy starting at the identity cannot permute it. Define the corrected endpoint and its based action by

#[#set math.equation(numbering: n => "(7)")
 $ iota^(epsilon.alt \( m \)) H_1 \, #h(2em) phi_m in "Aut" \( F \) . $ <eq:corrected-monodromy>]

The correction fixes each of the six punctures individually; this is what #emph[pure] means here.

#thm([Proposition 3.2.])[
  #emph[The actions $phi_m$ form a homomorphism $Gamma arrow.r "Aut" \( F \)$, are pure, and commute with $iota_(*)$. They preserve $K$. If $beta_m in "Aut" \( Pi \)$ is the actual based monodromy of the punctured sphere family, then 
#[#set math.equation(numbering: n => "(8)")
 $ p compose phi_m \|_K = beta_m compose p . $ <eq:actual-monodromy-square>]

 Moreover, $p : K arrow.r Pi$ is surjective.]
] <prop:based-monodromy>

#proof[
  Two extensions of the same point motion differ by an isotopy fixing the initial punctures and zero. Their endpoint actions therefore agree. The disk construction also extends homotopies of parameter paths. With loop composition chosen to agree with composition of the endpoint actions, uncorrected monodromy is a homomorphism. All its maps commute with $iota$, and $epsilon.alt$ is a character, so the corrected actions also compose.
  The uncorrected endpoint acts trivially on the homology of the closed torus; the correction acts there by a sign. It therefore preserves the handle-coordinate kernel $K$ and lifts uniquely through $\[ 4 \]$ fixing zero. The lift commutes with $iota$ by uniqueness: both compositions lift the same map and fix zero. Requiring this fixed basepoint also excludes any nontrivial deck translation. Write $tilde(H)_u$ for the lift of $H_u$ through $\[ 4 \]$ starting at the identity; it fixes zero and gives the actual motion of the $96$ punctures upstairs. The zero-fixed lift of the corrected endpoint is $iota^(epsilon.alt \( m \)) tilde(H)_1$, because $\[ 4 \]$ commutes with sign. After quotienting by sign, this endpoint is the endpoint induced by $tilde(H)_u$, hence gives the actual based sphere monodromy. This proves (8).
  For surjectivity, represent a loop in $S$ based at $q \( 0 \)$ by a path which avoids the four branch values of $q$ except at its endpoints. Its open interval lifts through the ordinary two-sheeted cover away from those values. Both lifted endpoints tend to zero, the unique point above $q \( 0 \)$. Thus the lift is a based loop in the source punctured torus, as required. ◻
]

=== 3.3 Three invariant double covers <three-invariant-double-covers>

We next prove that $phi_m - "id"$ raises the weighted degree on $hat(F)$. The only delicate first step is its action in degree one. Three double covers of the moving torus complement make this action explicit.

#thm([Lemma 3.3.])[
  #emph[Every $phi_m$, and also $iota_(*)$, acts as the identity on the weighted degree-one quotient $V = hat(F) \/ { g : nu_F \( g \) gt.eq 2 }$.]
] <lem:degree-one>

#proof[
  The vector space $V$ over $bb(F)_2$ has the five basis classes $x \, y \, a_0 \, a_1 \, a_2$. Two characters of $F$ are obtained from the handle coordinates modulo two. Uncorrected monodromy preserves them, and $iota$ preserves them modulo two.
  Choose an affine coordinate on the quotient sphere with $q \( 0 \) = oo$, using the same letter $q$ for its pullback to $E$. It is an even meromorphic function with a double pole at zero. Normalize its leading coefficient to one in an additive local coordinate $v$ at zero, so that $v \( iota z \) = - v \( z \)$ and $q \( z \) = v \( z \)^(- 2) + O \( 1 \)$. For $j = 0 \, 1 \, 2$, consider over the moving torus complement the cover
  #[#set math.equation(numbering: n => "(9)")
   $ Y_j^2 = q \( z \) - macron(omega)^j s . $ <eq:character-cover>]
  Here $s$ and $macron(omega)^j s$ are expressed in the chosen affine coordinate. The right side has simple zeros precisely at the two removed $j$-punctures. The cover is unramified elsewhere, including at zero: with $eta = v Y_j$, its local equation is
  $ eta^2 = v^2 \( q \( z \) - macron(omega)^j s \) = 1 + O \( v^2 \) . $
  Thus the points $eta = 1$ and $eta = - 1$ over zero give two global lifts of the fixed basepoint section throughout $B$.
  Let $chi_j : F arrow.r bb(F)_2$ be the character of this double cover on the fiber over $s_0$. A cover of the entire family with a lifted basepoint section gives an extension of $chi_j$ to the fundamental group of its total space. Conjugating a fiber loop by the section loop does not change its value in $bb(F)_2$. Hence uncorrected based monodromy preserves $chi_j$. Sign has the lift
  $ \( z \, Y_j \) mapsto \( - z \, - Y_j \) . $
  This lift fixes each selected sheet over zero, because both $v$ and $Y_j$ change sign and $eta = v Y_j$ does not. It follows that $iota_(*)$ also preserves $chi_j$, and therefore so does the corrected action $phi_m$.
  The character $chi_j$ takes value one on $a_j$ and $a_j^(-)$ and zero on the other puncture meridians. In particular it vanishes on all $c_i$ and factors through $V$. The three characters $chi_j$, together with the two handle characters, form a basis of $V^(*)$: evaluation on the five displayed generators has an invertible block triangular matrix. Their common kernel is therefore ${ g : nu_F \( g \) gt.eq 2 }$. Since all five characters are preserved, this kernel is preserved and the two induced actions on $V$ are trivial. ◻
]

#thm([Proposition 3.4.])[
  #emph[For every $m in Gamma$, the induced operator $phi_m - "id"$ on the weighted completed Magnus algebra of $hat(F)$ raises degree by at least one.]
] <prop:monodromy-raising>

#proof[
  By 7, the changes of the five weight-one generators in (6) have valuation at least two. It remains to check the two weight-two boundaries. Fix one pair, writing $a = a_j$ and $a^(-) = a_j^(-)$. Pureness gives $phi_m \( a \) = w a w^(- 1)$ for some $w in F$. Choose $d in F$ with $iota_(*) \( a \) = d a^(-) d^(- 1)$. Commutation with $iota_(*)$ yields
  $ phi_m \( a^(-) \) = w' a^(-) \( w' \)^(- 1) \, #h(2em) w' = phi_m \( d \)^(- 1) iota_(*) \( w \) d . $
  By 7, $w' w^(- 1)$ has valuation at least two. Replacing $w'$ by $w$ in the conjugation of $a^(-)$ therefore changes it by an element of valuation at least three. On the other hand, conjugating $c_j = a a^(-)$ by $w$ changes it by valuation at least $1 + nu_F \( c_j \) gt.eq 3$. It follows that
  $ nu_F #scale(x: 120%, y: 120%)[\(] phi_m \( c_j \) c_j^(- 1) #scale(x: 120%, y: 120%)[\)] gt.eq 3 . $
  The degree-raising substitution rule of 3 now applies to the entire weighted free basis. ◻
]

=== 3.4 Pinching the pairs and passing to the sphere <pinching-the-pairs-and-passing-to-the-sphere>

We have obtained a degree-raising action on the seven-generator torus group. We now collapse the lifted core to obtain a free group on the individual puncture pairs. This construction will identify both the quotient map from $K$ and its compatibility with the #emph[actual] sphere group $Pi$.

Write

$ T_(upright("core")) = E \\ union.big_j "int" D_j \, #h(2em) T_(upright("core"))^(\( 4 \)) = \[ 4 \]^(- 1) \( T_(upright("core")) \) . $

The lifted core $T_(upright("core"))^(\( 4 \))$ is connected, because the handle loops in $T_(upright("core"))$ map onto $H$. Its complementary disks are indexed by $\( h \, j \) in H times { 0 \, 1 \, 2 }$. For each $j$, choose the index-zero disk to be the one reached by lifting the chosen access path of $a_j$ from zero; use deck translations to label the others. All four fixed points of sign lie in $T_(upright("core"))^(\( 4 \))$, since multiplication by four sends them to zero, outside every $D_j$.

Collapsing $T_(upright("core"))^(\( 4 \))$ kills its fundamental group, including every disk boundary. By van Kampen, the resulting quotient of $K$ is free on one positive meridian for each of the $48$ disks: in each two-puncture disk, killing the boundary makes the negative meridian the inverse of the positive one. Let $L$ be the pro-2 completion of this free group, with generators $a_(h \, j)$. Paths in the lifted core disappear under collapse, so these generators do not depend on the remaining choices of core access paths. Deck translations induce the coordinate shifts $T_1 \, T_2$ on $L$.

We also denote the corresponding elements of the factor $H$ in $L times.r H$ by $T_1 \, T_2$. Define

#[#set math.equation(numbering: n => "(10)")
 $ Phi : F & arrow.r L times.r H \,\
x & mapsto T_1 \, & y & mapsto T_2 \, & a_j & mapsto a_(0 \, j) \, & c_0 \, c_1 & mapsto 1 . $ <eq:torus-substitution>]

The shifts commute and have order four, so $c_2$ also maps to one. On the core group, $Phi$ is exactly the $H$-valued covering character. It therefore kills $pi_1 \( T_(upright("core"))^(\( 4 \)) \, 0 \) subset K$. A positive meridian in disk $\( h \, j \)$ can be based using the lift of $u a_j u^(- 1)$, where $u$ is a core loop with handle coordinate $h$; its image under $Phi$ is exactly $a_(h \, j)$. Thus $Phi \|_K : K arrow.r L$ is the core-collapse map just constructed, followed by pro-2 completion. Its image contains the discrete free group on the $a_(h \, j)$ and is dense in $L$.

Sign preserves the lifted core and pairs its complementary disks freely: their centers map to nonzero two-torsion, whereas $\[ 4 \]$ kills the source two-torsion. Let $b_j in H$ be the index of the negative of the chosen index-zero center. Sign takes a positive puncture in disk $\( h \, j \)$ to the negative puncture in disk $\( b_j - h \, j \)$. Since both core access paths and disk boundaries have been killed, its induced action is exactly

#[#set math.equation(numbering: n => "(11)")
 $ sigma \( a_(h \, j) \) = a_(b_j - h \, j)^(- 1) . $ <eq:pinched-involution>]

If the index-zero center is represented by $v \/ 4$, with $v med mod med \( bb(Z) + bb(Z) omega \) = e_j$, then $b_j$ is represented, up to the deck-coordinate convention, by $- 2 v$ modulo $4 \( bb(Z) + bb(Z) omega \)$. Since $e_j$ is nonzero two-torsion,

#[#set math.equation(numbering: n => "(12)")
 $ b_j med mod med 2 H eq.not 0 . $ <eq:odd-displacement>]

#thm([Lemma 3.5.])[
  #emph[Let $Pi_(upright("pair"))$ be the quotient of $Pi$ obtained by killing the boundary loops of its 24 two-puncture disks. It is free of rank 24, and its pro-2 completion is naturally 
#[#set math.equation(numbering: n => "(13)")
 $ hat(Pi_(upright("pair"))) tilde.eq L \/ overline(chevron.l #h(-0.16667em) chevron.l sigma \( g \) g^(- 1) : g in L chevron.r #h(-0.16667em) chevron.r) . $ <eq:pinched-sphere-group>]

 More precisely, let $lambda : L arrow.r.twohead R$ be a continuous quotient of pro-2 groups satisfying $lambda sigma = lambda$. There is a homomorphism $theta : Pi arrow.r R$ with dense image and 
#[#set math.equation(numbering: n => "(14)")
 $ theta p = lambda Phi \|_K . $ <eq:pinching-square>]

 For $m in Gamma$, the condition 
#[#set math.equation(numbering: n => "(15)")
 $ lambda Phi \( phi_m \( k \) \) = lambda Phi \( k \) #h(2em) \( k in K \) $ <eq:torus-equalizer-condition>]

 implies $theta beta_m = theta$ on the entire unpinched group $Pi$.]
] <lem:pinched-sphere>

#proof[
  Each sign-paired pair of torus disks projects to one two-puncture disk on the sphere, and either disk maps homeomorphically to it. The image $q \( T_(upright("core"))^(\( 4 \)) \)$ is the sphere exterior, a sphere with $24$ holes. Killing its boundary loops kills its fundamental group, so the quotient defining $Pi_(upright("pair"))$ is the quotient induced by collapsing this exterior. Van Kampen identifies it with the free group on one meridian per projected disk.
  The map $q$ commutes with the two core collapses, with the basepoints in their respective cores. Upstairs there is one cyclic generator per disk, and sign identifies them in pairs by $a_(h \, j) = a_(b_j - h \, j)^(- 1)$. This accounts for the entire quotient: every fixed point of sign is already in the collapsed core, and either disk in each remaining pair maps homeomorphically to the corresponding sphere disk. Passing to pro-2 completions proves (13). The based collapse diagram then gives the dense map $theta$ and the exact identity (14).
  Finally, 6 and (15) give
  $ theta beta_m p = theta p phi_m \|_K = lambda Phi phi_m \|_K = lambda Phi \|_K = theta p . $
  The map $p$ is surjective, so $theta beta_m = theta$. This argument does not require the monodromy to preserve the kernel of the pair-pinching map. ◻
]

The maps just constructed are summarized in 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1), [$K$])
  content((2.8, 1), [$L$])
  content((5.6, 1), [$R$])
  content((0, -0.4), [$Pi$])
  line((0.2657, 1), (2.534, 1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.4, 1), [$Phi |_K$], anchor: "south", padding: 0.1176cm)
  line((3.066, 1), (5.334, 1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.2, 1), [$lambda$], anchor: "south", padding: 0.1176cm)
  line((0, 0.7549), (0, -0.1549), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.3), [$p$], anchor: "east", padding: 0.1176cm)
  line((0.2128, -0.3468), (5.334, 0.9336), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.8, 0.3), [$theta$], anchor: "north-west", padding: 0.1176cm)
})],
  caption: [Figure 1: The actual sphere group $Pi$ maps to every pro-$2$ quotient $R$ of $L$ on which sign acts trivially. The triangle records $theta p = lambda Phi \|_K$. The map $p$ is surjective and $Phi \|_K$ has dense image. Monodromy is compared on $K$ and $Pi$ before it is passed to $R$. ],
) <fig:group-maps>

We conclude with two properties of the finite geometric monodromy which will control a parameter cover. Let $gamma_(*) in Gamma$ be the positively oriented local circuit around $s_(*)$ based at the nearby point $s_0$.

#thm([Lemma 3.6.])[
  #emph[The joint action of $Gamma$ on the 48 markings and on the sign of $x_0$ factors through a finite 2-group. The element $gamma_(*)$ has nontrivial sign, whereas $gamma_(*)^2$ fixes every marking and acts trivially on $Pi_(upright("pair"))$.]
] <lem:finite-geometric-monodromy>

#proof[
  Choose a positive representative in the source torus for each marking. Within the $j$th block these representatives are indexed by $H$. Along a parameter loop, their endpoints are obtained by a translation in $H$ and the common sign $\( - 1 \)^(epsilon.alt \( m \))$. The three blocks are preserved individually. Thus the joint action is contained in $H^3 times.r bb(Z) \/ 2$, with sign acting by inversion; this is a finite 2-group.
  The quotient $q$ is simply ramified at $e_0$, so $gamma_(*)$ exchanges the two lifts of the parameter. By the local simple ramification in 5, each marking pair has equation $w^2 = t$ near its collision. Its motion under $gamma_(*)$ is a half twist and under $gamma_(*)^2$ a full twist. These motions are supported in the disjoint pair disks and fix the exterior. A full twist acts on a disk group by conjugation by its boundary; after that boundary is killed, it fixes the remaining cyclic generator. Hence the induced action on $Pi_(upright("pair"))$ is trivial. ◻
]

The groups and their geometric roles are collected below. All ranks are free-group ranks, with pro-$2$ completion understood only in the row for $L$.

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, left, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Group
], table.cell(rowspan: 1, colspan: 1)[Geometric description
], table.cell(rowspan: 1, colspan: 1)[Rank
]),
  table.cell(rowspan: 1, colspan: 1)[$Gamma$
], table.cell(rowspan: 1, colspan: 1)[Five-punctured parameter sphere
], table.cell(rowspan: 1, colspan: 1)[$4$
],
  table.cell(rowspan: 1, colspan: 1)[$F$
], table.cell(rowspan: 1, colspan: 1)[Six-punctured torus
], table.cell(rowspan: 1, colspan: 1)[$7$
],
  table.cell(rowspan: 1, colspan: 1)[$K$
], table.cell(rowspan: 1, colspan: 1)[Its degree-$16$ multiplication cover
], table.cell(rowspan: 1, colspan: 1)[$97$
],
  table.cell(rowspan: 1, colspan: 1)[$Pi$
], table.cell(rowspan: 1, colspan: 1)[Sphere with $48$ punctures
], table.cell(rowspan: 1, colspan: 1)[$47$
],
  table.cell(rowspan: 1, colspan: 1)[$L$
], table.cell(rowspan: 1, colspan: 1)[Lifted torus after killing the core and pair boundaries
], table.cell(rowspan: 1, colspan: 1)[$48$
],
  table.cell(rowspan: 1, colspan: 1)[$Pi_(upright("pair"))$
], table.cell(rowspan: 1, colspan: 1)[Sphere after killing the $24$ pair boundaries
], table.cell(rowspan: 1, colspan: 1)[$24$
],
)
]

The next section keeps the presentation through $L$ in order to retain the degree estimates coming from $F$.

== 4 A weighted presentation for the pinched fiber <sec:involution>

We now equip the free pro-$2$ group $L$ with a filtration adapted to the covering shifts. In this filtration the involution relations from the preceding section can be imposed with a sufficiently small contribution to the weighted relation sum. We also show that the degree bounds on $F$ survive the map $Phi : F arrow.r L times.r H$. Although the pinched sphere group is already free of rank $24$, an arbitrary basis of that quotient would not retain these degree bounds. Keeping $48$ generators and imposing $24$ carefully chosen relations preserves the filtration needed to control all later monodromy relations.

=== 4.1 A basis adapted to the two translations <a-basis-adapted-to-the-two-translations>

Recall that $L$ is free on $a_(h \, j)$, where $h in H = \( bb(Z) \/ 4 \)^2$ and $j in { 0 \, 1 \, 2 }$. The commuting shifts $T_1 \, T_2$ translate the two coordinates of $h$. The involution is

$ sigma \( a_(h \, j) \) = a_(b_j - h \, j)^(- 1) \, #h(2em) b_j med mod med 2 eq.not 0 . $

Thus $sigma T_r sigma = T_r^(- 1)$ for $r = 1 \, 2$. For an automorphism $T$, write $delta_T \( g \) = T \( g \) g^(- 1)$, and define

#[#set math.equation(numbering: n => "(16)")
 $ u_(i ell \, j) = delta_(T_1)^(thin i) delta_(T_2)^(thin ell) \( a_(0 \, j) \) \, #h(2em) 0 lt.eq i \, ell < 4 . $ <eq:shift-basis>]

#thm([Lemma 4.1.])[
  #emph[The elements in (16) form a free pro-$2$ basis of $L$. Give $u_(i ell \, j)$ weight $i + ell + 1$, and denote the resulting Magnus valuation by $nu_L$. Each of $T_1 - "id"$, $T_2 - "id"$, and $sigma - "id"$ raises the degree of the completed Magnus algebra by at least one.]
] <lem:shift-basis>

#proof[
  In the Frattini quotient, the span of the generators in one block is the permutation module
  $ R = bb(F)_2 \[ H \] = bb(F)_2 \[ xi \, eta \] \/ \( xi^4 \, eta^4 \) \, #h(2em) T_1 = 1 + xi \, quad T_2 = 1 + eta . $
  The images of $u_(i ell \, j)$ are its monomial basis $xi^i eta^ell$. The Frattini basis criterion therefore gives the first assertion. We henceforth use the stated weights.
  The proof has three steps: control the last difference of a cyclic shift, propagate the two translation bounds, and then treat sign. We first establish the endpoint estimate needed for a cyclic shift. Suppose $T^4 = "id"$, put $w_i = delta_T^i \( w_0 \)$, and assume
  #[#set math.equation(numbering: n => "(17)")
   $ nu_L \( w_i \) gt.eq d + i #h(2em) \( 0 lt.eq i lt.eq 3 \) \, #h(2em) d gt.eq 1 . $ <eq:cyclic-hypothesis>]
  Then
  #[#set math.equation(numbering: n => "(18)")
   $ nu_L \( w_4 \) gt.eq d + 4 . $ <eq:cyclic-endpoint>]
  This assertion does not assume that $T$ preserves the filtration. To prove it, take formal free generators $z_0 \, z_1 \, z_2 \, z_3$ of weights $d \, d + 1 \, d + 2 \, d + 3$, and define the triangular automorphism
  $ T' \( z_i \) = z_(i + 1) z_i quad \( 0 lt.eq i < 3 \) \, #h(2em) T' \( z_3 \) = z_3 . $
  By 3, $T' - "id"$ raises algebra degree by one. In characteristic two,
  $ \( T' \)^4 - "id" = \( T' - "id" \)^4 \, $
  so $T' ""^4 \( z_0 \) z_0^(- 1)$ has valuation at least $d + 4$. Evaluation at $z_i = w_i$ preserves this bound by (17). The positive word $T' ""^3 \( z_0 \)$ contains $z_3$ exactly once, as its first letter. In passing from the evaluated formal fourth iterate to the actual fourth iterate, the only changed substitution is
  $ T \( w_3 \) = w_4 w_3 quad upright("in place of") quad T' \( z_3 \) = z_3 . $
  Consequently $T^4 \( w_0 \) = w_4 thin T' ""^4 \( z_0 \) \|_(z_i = w_i)$. Since $T^4 \( w_0 \) = w_0$, the bound for the evaluated formal iterate proves (18).
  For each fixed $ell \, j$, apply this estimate to $w_i = u_(i ell \, j)$, $T = T_1$, and $d = ell + 1$. For $i < 3$, the required difference is exactly $delta_(T_1) \( u_(i ell \, j) \) = u_(i + 1 \, ell \, j)$; (18) supplies the case $i = 3$. Thus $T_1 - "id"$ raises degree by one on every basis element, and therefore on the algebra.
  The same argument gives the $T_2$ bounds on the initial sequence $u_(0 ell \, j)$. They propagate along the $T_1$-sequences as follows. If $T_2 \( z \) = v z$, commutativity of the shifts gives
  #[#set math.equation(numbering: n => "(19)")
   $ T_2 \( delta_(T_1) z \) = T_1 \( v \) \( delta_(T_1) z \) v^(- 1) . $ <eq:commuting-difference>]
  Suppose $z$ has assigned weight $d$, the element $v$ has valuation at least $d + 1$, and $delta_(T_1) z$ has valuation at least $d + 1$. The already proved $T_1$ bound gives $nu_L \( T_1 \( v \) v^(- 1) \) gt.eq d + 2$. Conjugating $delta_(T_1) z$ by $v$ changes it only in degree at least $2 d + 2 gt.eq d + 2$. Equation (19) therefore gives the next $T_2$ bound. Induction proves that $T_2 - "id"$ raises degree by one on the full basis.
  It remains to treat $sigma$. Powers of either shift preserve the filtration and differ from the identity by an operator raising degree by one. Since $sigma \( a_(0 \, j) \) = T_1^(\( b_j \)_1) T_2^(\( b_j \)_2) \( a_(0 \, j) \)^(- 1)$, and inversion has the same linear term in characteristic two, we have
  $ nu_L #scale(x: 120%, y: 120%)[\(] sigma \( a_(0 \, j) \) a_(0 \, j)^(- 1) #scale(x: 120%, y: 120%)[\)] gt.eq 2 . $
  We propagate this estimate along the two difference sequences. For either shift $T$, its inverse preserves the filtration, and
  $ T^(- 1) - T = T^(- 1) \( "id" - T^2 \) \, #h(2em) T^2 - "id" = \( T - "id" \)^2 . $
  Hence, if $nu_L \( z \) gt.eq d$, the elements $delta_(T^(- 1)) z$ and $delta_T z$ agree modulo degree $d + 2$. If $sigma \( z \) = v z$, the identity $sigma T = T^(- 1) sigma$ gives
  #[#set math.equation(numbering: n => "(20)")
   $ sigma \( delta_T z \) = T^(- 1) \( v \) \( delta_(T^(- 1)) z \) v^(- 1) . $ <eq:inverting-difference>]
  When $nu_L \( v \) gt.eq d + 1$, the inverse-shift bound and the commutator estimate show that the right side differs from $delta_(T^(- 1)) z$ only in degree at least $d + 2$. The preceding comparison then replaces $delta_(T^(- 1)) z$ by $delta_T z$. Starting with $a_(0 \, j)$, first apply this argument along $delta_(T_2)$ and then along $delta_(T_1)$. It proves that $sigma$ changes each basis element of weight $w$ only in degree at least $w + 1$. A final application of 3 proves the assertion on the completed algebra. ◻
]

=== 4.2 Twenty-four relations impose the involution <twenty-four-relations-impose-the-involution>

There are 24 pairs of generators exchanged, up to inversion, by sign. Choosing one relation per pair in the original basis would impose the involution, but would lose the higher degrees gained from the shifts. We must choose 24 relations whose degrees are measured in the new basis. The Frattini quotient will identify those relations, and its generation criterion will show that they impose the full group action.

#thm([Proposition 4.2.])[
  #emph[Let $L$ be the free pro-$2$ group on $a_(h \, j)$, with $h in \( bb(Z) \/ 4 \)^2$ and $0 lt.eq j lt.eq 2$, and let $sigma \( a_(h \, j) \) = a_(b_j - h \, j)^(- 1)$, where $b_j med mod med 2 eq.not 0$. Equip $L$ with the basis and weights of 11. There are 24 elements $g in L$, with assigned positive weights $w_g$, such that 
$ nu_L \( g \) gt.eq w_g \, #h(2em) nu_L \( r_g \) gt.eq w_g + 1 \, #h(2em) r_g = sigma \( g \) g^(- 1) \, $

 and the closed normal subgroup generated by the $r_g$ imposes $sigma = "id"$ on all of $L$. The basis polynomial and the polynomial of the chosen weights are 
#[#set math.equation(numbering: n => "(21)")
 $ P \( t \) & = sum_(i \, ell \, j) t^(i + ell + 1) = 3 t \( 1 + t + t^2 + t^3 \)^2 \,\
G \( t \) & = sum_g t^(w_g) = 3 t \( 1 + t \) \( 1 + t^2 \)^2 . $ <eq:weight-polynomials>]

 In particular, $P = \( 1 + t \) G$, and these involution relations have degree cost at most $t G \( t \)$.]
] <prop:involution>

#proof[
  The full Magnus degree bounds are already proved. We now use the Frattini quotient to choose enough relations to impose the whole involution; generation is detected in this linear quotient. Consider one block of the Frattini quotient, identified with $R = bb(F)_2 \[ xi \, eta \] \/ \( xi^4 \, eta^4 \)$ as above. Give a homogeneous polynomial of degree $n$ weight $n + 1$. Write $b = \( b_1 \, b_2 \)$ for the shift of this block. The action of $sigma$ on $R$ is
  #[#set math.equation(numbering: n => "(22)")
   $ f \( xi \, eta \) mapsto \( 1 + xi \)^(b_1) \( 1 + eta \)^(b_2) f #scale(x: 120%, y: 120%)[\(] \( 1 + xi \)^(- 1) - 1 \, \( 1 + eta \)^(- 1) - 1 #scale(x: 120%, y: 120%)[\)] . $ <eq:frattini-involution>]
  Here inversion of a group generator disappears in the mod-$2$ Frattini quotient. Since $\( 1 + xi \)^(- 1) - 1 = xi + xi^2 + dots.h.c$, expansion of (22) shows that the part of $sigma - "id"$ raising weight by exactly one is
  #[#set math.equation(numbering: n => "(23)")
   $ d = \( macron(b)_1 xi + macron(b)_2 eta \) + xi^2 frac(partial, partial xi) + eta^2 frac(partial, partial eta) \, #h(2em) \( macron(b)_1 \, macron(b)_2 \) = b med mod med 2 . $ <eq:frattini-differential>]
  The first term means multiplication.
  Set $u = macron(b)_1 xi + macron(b)_2 eta$, which is nonzero, and choose a linear coordinate $v$ independent of $u$ over $bb(F)_2$. The fourth-power relations become $u^4 = v^4 = 0$. Moreover, the vector field $xi^2 partial_xi + eta^2 partial_eta$ sends any linear form over $bb(F)_2$ to its square. In these coordinates,
  #[#set math.equation(numbering: n => "(24)")
   $ R = bb(F)_2 \[ u \, v \] \/ \( u^4 \, v^4 \) \, #h(2em) d = u + u^2 frac(partial, partial u) + v^2 frac(partial, partial v) . $ <eq:even-coordinate-differential>]
  The $u$-part sends $1$ to $u$, $u^2$ to $u^3$, and odd powers to zero. Its square is zero, as is the square of the $v$-part. The two parts commute, so $d^2 = 0$.
  Take the homogeneous subspace
  #[#set math.equation(numbering: n => "(25)")
   $ C = "span"_(bb(F)_2) { u^a v^b : a in { 0 \, 2 } \, med 0 lt.eq b < 4 } . $ <eq:even-complement>]
  On $C$, the odd-$u$ component of $d$ is multiplication by $u$, an isomorphism from $C$ to the span of the odd-$u$ monomials. Thus $d \|_C$ is injective and
  #[#set math.equation(numbering: n => "(26)")
   $ R = C xor d C \, #h(2em) ker d = "im" d = d C . $ <eq:acyclic-frattini>]
  Indeed the direct-sum assertion follows by projecting to the odd-$u$ monomials; both summands have dimension eight. It then follows from $d^2 = 0$ that the image and kernel, each of dimension eight, coincide.
  For each of the eight monomials in (25), expand it in the original homogeneous monomials $xi^i eta^ell$. Choose $g$ to be a product of the corresponding $u_(i ell \, j)$, each appearing with its coefficient in $bb(F)_2$, in any fixed order. Its assigned weight $w_g$ is the polynomial degree plus one. Then $nu_L \( g \) gt.eq w_g$, and 11 gives $nu_L \( r_g \) gt.eq w_g + 1$. In the graded Frattini quotient the leading vectors of $g \, r_g$ are respectively the chosen basis of $C$ and its image under $d$. By (26) these form a homogeneous basis. The actual Frattini vectors therefore form a basis as well: any linear dependence would give one between their lowest nonzero weight components. Doing this in all three blocks shows that the 48 elements $g \, r_g$, equivalently $g \, sigma \( g \)$, generate $L$.
  Let $N$ be the closed normal subgroup generated by these 24 elements $r_g$. It is invariant under $sigma$, because
  $ sigma \( r_g \) = g sigma \( g \)^(- 1) = r_g^(- 1) . $
  The quotient $L \/ N$ is generated by the images of the $g$, since there $sigma \( g \) = g$; its induced involution fixes those generators and hence is the identity. Thus $N$ is exactly the closed normal subgroup imposing $sigma = "id"$.
  Finally, in each block the chosen monomials have weight polynomial
  $ t \( 1 + t^2 \) \( 1 + t + t^2 + t^3 \) = t \( 1 + t \) \( 1 + t^2 \)^2 . $
  Adding the three blocks gives (21). Since each $r_g$ has degree at least $w_g + 1$, its contribution to the relation bound is at most $t^(w_g + 1)$ for $0 < t < 1$. ◻
]

=== 4.3 Transferring the degree bounds <sec:transfer>

The involution relations leave the positive polynomial $G = P - t G$ in the generator-minus-relation count. To control the remaining monodromy relations, we need to compare the two filtrations.

Write $hat(K)$ for the closure of $K$ in $hat(F)$. The normal subgroup $K lt.closed F$ has the induced pro-2 topology: if $N lt.closed K$ has 2-power index, its $F$-core $N_0$ is the intersection of finitely many conjugates of $N$. The group $K \/ N_0$ embeds in a product of finite 2-groups, and $F \/ N_0$ is an extension of $F \/ K$ by $K \/ N_0$, hence is also a finite 2-group. This proves the required cofinality and identifies the pro-2 completion of $K$ with its closure in $hat(F)$.

#thm([Lemma 4.3.])[
  #emph[Let $Phi : hat(F) arrow.r L times.r H$ be the continuous extension of the homomorphism from the preceding section: 
$ x mapsto T_1 \, #h(2em) y mapsto T_2 \, #h(2em) a_j mapsto a_(0 \, j) \, #h(2em) c_0 \, c_1 mapsto 1 . $

 If $f in hat(F)$ has $nu_F \( f \) gt.eq n$, its $L$-component under $Phi$ has $nu_L gt.eq n$. In particular, this holds for the homomorphism $Phi \|_(hat(K)) : hat(K) arrow.r L$.]
] <lem:transfer>

#proof[
  Let $A_L$ be the completed Magnus algebra of $L$. Represent $L times.r H$ on $A_L$ by letting $l in L$ act by left multiplication and letting $H$ act by its shifts. By 11, the operators representing $x - 1$ and $y - 1$ raise degree by one. So does the operator representing $a_j - 1$, which is left multiplication by $a_(0 \, j) - 1$. The operators representing $c_0 - 1 \, c_1 - 1$ are zero, and in particular satisfy their required weight-two bounds.
  Substitute these operators into the weighted Magnus algebra of $hat(F)$. This substitution converges: a monomial of weight at least $n$ becomes an operator raising degree by at least $n$. Consequently the operator representing $f - 1$ raises degree by at least $n$. If $Phi \( f \) = \( l \, h \)$, its action on $1 in A_L$ is $l$, since every shift fixes $1$. Evaluating the operator for $f - 1$ on $1$ therefore gives $l - 1$, proving $nu_L \( l \) gt.eq n$. On $hat(K)$ the $H$-component is trivial, which proves the last assertion. ◻
]

== 5 An infinite quotient compatible with the family <sec:quotient>

We now impose the geometric relations. The order of the choices matters. We first make the parameter monodromy sufficiently deep, then compactify the resulting finite cover of the marked family, and only then choose powers for its finitely many remaining boundary meridians.

=== 5.1 All deep monodromies from a controlled set of relations <all-deep-monodromies-from-a-controlled-set-of-relations>

Write $hat(Gamma)$ for the free pro-2 completion of the rank-four parameter group $Gamma$. Give its four free generators ordinary Magnus degree one, and let

$ D_N = { m in hat(Gamma) : nu_Gamma \( m \) gt.eq N } \, #h(2em) Gamma_N = Gamma ∩ D_N . $

Each $D_N$ is open and normal, and these subgroups form a neighborhood basis of the identity. The leading degree-$N$ Magnus part embeds

$ D_N \/ D_(N + 1) arrow.r.hook bb(F)_2 { upright("words of length ") N upright(" on four letters") } . $

In particular, its dimension is at most $4^N$. Choose a set $cal(M)_N subset Gamma_N$ representing a basis of this quotient. Discrete representatives exist by density and openness. For any integer $J gt.eq 1$, the union of the $cal(M)_N$, $N gt.eq J$, topologically generates $D_J$: successive removal of the leading part approximates every element modulo each $D_N$.

By 8, the automorphisms associated with the four generators of $Gamma$ differ from the identity by operators raising degree on the Magnus algebra of $hat(F)$. Substitute these four operators into the base Magnus expansion, as in 3. It follows that the action extends continuously to $hat(Gamma)$ and that

#[#set math.equation(numbering: n => "(27)")
 $ \( phi_m - "id" \) \( A_(F \, gt.eq d) \) subset A_(F \, gt.eq d + N) #h(2em) \( m in D_N \) . $ <eq:deep-action>]

Indeed, on each finite truncation these actions lie in a finite unipotent 2-group, so completion introduces no extra continuity assumption. The action preserves $hat(K)$, since the actual action on the closed torus is $plus.minus "id"$ and preserves reduction modulo four.

Recall that $K$ is free of rank $97$. Fix a free basis $k_1 \, dots.h \, k_97$. By the completion identification in 4.3, this is a topological generating set of $hat(K)$.

We count monodromies by their depth in the filtration. This lets us control the relation cost without estimating the free rank of the finite-index subgroup $Gamma_J$. The bound $4^N$ will be offset by the higher degree $N + 1$ of the resulting fiber relations.

For every $N gt.eq J$, $m in cal(M)_N$ and $1 lt.eq i lt.eq 97$, impose on $L$ the relator

#[#set math.equation(numbering: n => "(28)")
 $ Phi #scale(x: 120%, y: 120%)[\(] phi_m \( k_i \) k_i^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <eq:monodromy-relators>]

Its argument belongs to $hat(K)$ and has $F$-degree at least $N + 1$ by (27). Its $L$-degree is at least $N + 1$ by 13. Thus these relators have total cost at most

#[#set math.equation(numbering: n => "(29)")
 $ 97 sum_(N gt.eq J) 4^N t^(N + 1) = 97 t frac(\( 4 t \)^J, 1 - 4 t) \, #h(2em) 0 < t < 1 / 4 . $ <eq:monodromy-cost>]

Let $Q_0$ be the quotient of $L$ by the closed normal subgroup generated by these relators and the $24$ involution relators of 12. The following observation is what turns the counted relations into #emph[all] the required equalities.

#thm([Lemma 5.1.])[
  #emph[The homomorphism $f_K : hat(K) arrow.r Q_0$ induced by $Phi$ satisfies 
$ f_K phi_m = f_K #h(2em) \( m in D_J \) . $

 Consequently the induced homomorphism $Pi arrow.r Q_0$ from the punctured sphere is invariant under its actual based monodromy for every $m in Gamma_J$.]
] <lem:deep-invariance>

#proof[
  For each imposed $m$, equality on the basis $k_i$ gives equality of the two continuous homomorphisms on all of $hat(K)$. The set
  $ E_0 = { m in hat(Gamma) : f_K phi_m = f_K upright(" on ") hat(K) } $
  is a closed subgroup. For multiplication, apply one equality to $phi_n \( k \)$ and then the other to $k$; for inverses apply the equality to $phi_m^(- 1) \( k \)$. Closedness follows from continuity. It contains all $cal(M)_N$ with $N gt.eq J$, and hence contains $D_J$.
  The last assertion uses the actual surjection $K arrow.r Pi$ and its exact compatibility with the two based actions, proved in Proposition 3.2, Lemma 3.5. Surjectivity onto the unpinched sphere group is essential here; no invariance of the pinching kernel was assumed in defining the relators. ◻
]

=== 5.2 A finite parameter cover with ramification index two <a-finite-parameter-cover-with-ramification-index-two>

The monodromy series in (29) requires $4 t < 1$. The involution leaves the weighted expression $1 - G \( t \)$, where $G \( t \) = 3 t \( 1 + t \) \( 1 + t^2 \)^2$, so we also need $G \( t \) > 1$. Both conditions hold for $t$ sufficiently close to $1 \/ 4$ from below. We choose the following rational value and check its exact margin in 16:

#[#set math.equation(numbering: n => "(30)")
 $ t = 49 / 200 < 1 / 4 . $ <eq:t-choice>]

We reserve $1 \/ 100$ of the relation bound for deep monodromy and another $1 \/ 100$ for the final boundary powers; the strict inequality below will justify both allowances. Choose $J$ large enough that (29) is less than $1 \/ 100$. Enlarge $J$, if necessary, until $Gamma_J$ kills the finite permutation and sign action of 10. This is possible because that action has finite 2-group image.

Set

$ M = chevron.l gamma_(*)^2 chevron.r Gamma_J subset Gamma . $

Normality of $Gamma_J$ makes this a finite-index subgroup. The action of $gamma_(*)^2$ on the pinched sphere group is trivial, by 10. Together with 14, this proves invariance of $Pi arrow.r Q_0$ under all of $M$. Moreover $M$ fixes every marking and lies in the parameter sign kernel. It contains $gamma_(*)^2$ but not $gamma_(*)$.

Let $B' arrow.r B$ be the connected finite cover corresponding to $M$, and let $C'$ be its smooth projective completion. These are algebraic: Riemann existence applies to finite covers of a complex variety without a properness hypothesis #cite(label("SGA1")) Exposé XII, Théorème 5.1, and normalization compactifies the curve cover. The selected point $c_(*) in C' \\ B'$ has ramification index exactly two over $s_(*)$, since $chevron.l gamma_(*) chevron.r ∩ M = chevron.l gamma_(*)^2 chevron.r$.

The $48$ markings split into disjoint algebraic sections over $B'$. Denote their complement by

$ U subset bb(P)^1 times B' . $

Finite-point isotopy gives a locally trivial punctured-sphere bundle. The open base curve is aspherical, and the fixed section at $q \( 0 \)$ splits its fundamental-group sequence. Therefore

$ pi_1 \( U \) = Pi times.r M . $

The monodromy invariance just proved extends $Pi arrow.r Q_0$ to a homomorphism

#[#set math.equation(numbering: n => "(31)")
 $ rho_0 : pi_1 \( U \) arrow.r Q_0 $ <eq:rho-zero>]

that kills the section subgroup $M$. Its restriction to every punctured fiber has dense image, because the pinched sphere group maps densely onto the pro-2 quotient $Q_0$.

=== 5.3 Separating the sections and filling the distinguished fiber <separating-the-sections-and-filling-the-distinguished-fiber>

Extend the marked sections across $C' \\ B'$ in $bb(P)^1 times C'$. Blow up their collision points until their strict transforms are disjoint, obtaining a smooth projective surface

$ Y arrow.r C' $

with $U$ unchanged. This terminates: at any common point of two sections, a blowup decreases their intersection multiplicity by one, so the sum of all pairwise intersection multiplicities strictly decreases.

All fibers over $C' \\ B'$ stay reduced with simple normal crossings. Here is the local induction, which also ensures that the full boundary is a simple normal crossing divisor. At a smooth point of a reduced vertical component, take the projection coordinate $u$ and write a section as $w = g \( u \)$. Blowing up the origin gives the chart $w = u v$, where the transformed section is $v = g \( u \) \/ u$ and is still transverse to the new multiplicity-one component $u = 0$. In the other chart the projection has the form $u = w b$; its differential vanishes at the vertical node $w = b = 0$. A section cannot pass through that node, because its composite with the projection is the identity. Thus every further collision center is a smooth point of a reduced vertical component. When the sections are disjoint, each meets a single vertical component transversely and avoids all vertical nodes. The boundary

$ D = Y \\ U $

is consequently a simple normal crossing divisor: locally it is defined by $u = 0$ or $u v = 0$ in smooth coordinates. It contains the $48$ horizontal marked sections and every component of the fibers over $C' \\ B'$.

Over $c_(*)$ the local marking equation is $w^2 = s - s_(*)$. After the base change of index two it becomes $w^2 = u^2$, up to analytic coordinate changes. One blowup separates the two branches $w = plus.minus u$. Hence the distinguished fiber $D_(*)$ consists of one main sphere and $24$ tails. Every tail carries two marked sections and meets the main sphere once; the main sphere carries none.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (8.96, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.896, -0.102), (0.896, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0.896, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.896, 0.595), radius: 0.07056, fill: black, stroke: none)
  circle((0.896, 1.147), radius: 0.07056, fill: black, stroke: none)
  content((0.896, 1.7), [tail $1$], anchor: "south", padding: 0.1176cm)
  line((2.464, -0.102), (2.464, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((2.464, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.464, 0.595), radius: 0.07056, fill: black, stroke: none)
  circle((2.464, 1.147), radius: 0.07056, fill: black, stroke: none)
  content((2.464, 1.7), [tail $2$], anchor: "south", padding: 0.1176cm)
  line((6.496, -0.102), (6.496, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((6.496, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.496, 0.595), radius: 0.07056, fill: black, stroke: none)
  circle((6.496, 1.147), radius: 0.07056, fill: black, stroke: none)
  content((6.496, 1.7), [tail $23$], anchor: "south", padding: 0.1176cm)
  line((8.064, -0.102), (8.064, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((8.064, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((8.064, 0.595), radius: 0.07056, fill: black, stroke: none)
  circle((8.064, 1.147), radius: 0.07056, fill: black, stroke: none)
  content((8.064, 1.7), [tail $24$], anchor: "south", padding: 0.1176cm)
  content((4.48, 0.8925), [$dots.h$])
  content((4.48, -0.255), [main $bb(P)^1$: no markings], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: The distinguished fiber $D_(*)$ on $Y$, after the base change of index two and one blowup at each collision. Each of the $24$ rational tails has two markings (solid dots) and one node on the main component (open circles). The middle $20$ tails are omitted. The cover constructed in 6 is unramified at the nodes and can branch only at the markings. Its inverse image may have a different incidence graph. ],
) <fig:distinguished-fiber>

#thm([Lemma 5.2.])[
  #emph[Every meridian around a component of $D_(*)$ has trivial image under $rho_0$.]
] <lem:distinguished-meridians>

#proof[
  A main-component meridian is represented by the circuit along the fixed exterior section, so it is killed by (31).
  For a tail use the blowup chart $w = u v$. A meridian at a sufficiently large fixed slope $v = c$ is represented downstairs by
  $ u = epsilon e^(i theta) \, #h(2em) w = c epsilon e^(i theta) \, #h(2em) 0 lt.eq theta lt.eq 2 pi . $
  Choose $\| c \|$ larger than the two branch slopes and then choose $epsilon$ small. Trivialize the pair motion by an isotopy supported inside the circle containing the two marks but not this meridian. In this trivialization the loop is the base circuit followed by one full pair-boundary loop, up to conjugacy and the choice of multiplication convention. The base circuit is killed by the section splitting; the pair boundary is killed by the pinching map. Both factors therefore have trivial image. ◻
]

=== 5.4 The remaining boundary relations <the-remaining-boundary-relations>

There are finitely many components of $D$ outside $D_(*)$. Choose based meridians $mu_1 \, dots.h \, mu_b$ for them, and choose lifts $tilde(mu)_i in L$ of $rho_0 \( mu_i \) in Q_0$. These lifts exist since $L arrow.r Q_0$ is surjective. Choose an integer $e$ so large that

#[#set math.equation(numbering: n => "(32)")
 $ b thin t^(2^e) < 1 / 100 \, $ <eq:boundary-cost>]

and impose the additional relators $tilde(mu)_i^(2^e)$. This is the high-power method underlying Golod’s construction #cite(label("Golod1964")), applied here to the finitely many boundary elements. Each added relator has degree at least $2^e$ by (1). Denote the resulting pro-2 quotient by $Q$.

#thm([Proposition 5.3.])[
  #emph[The group $Q$ is infinite. The homomorphism 
$ rho : pi_1 \( U \) arrow.r Q $

 induced by $rho_0$ has dense image on every punctured fiber. Each component meridian of $D$ has finite image, and every component meridian of $D_(*)$ has trivial image.]
] <prop:infinite-quotient>

#proof[
  Only infinitude remains to prove. The generators of $L$ have polynomial $P \( t \)$ and the involution relators have cost at most $t G \( t \)$, where 12 gives
  $ P \( t \) = \( 1 + t \) G \( t \) \, #h(2em) G \( t \) = 3 t \( 1 + t \) \( 1 + t^2 \)^2 . $
  At the rational value (30), $t^2 > 3 \/ 50$, so
  $ G \( t \) > frac(3 dot.op 49 dot.op 249 dot.op 53^2, 200^2 dot.op 50^2) = 102817827 / 100000000 > 257 / 250 . $
  The complete weighted expression in 4 is therefore less than
  $ 1 - P \( t \) + t G \( t \) + 1 / 100 + 1 / 100 = 1 - G \( t \) + 1 / 50 < - 1 / 125 < 0 . $
  The infinite monodromy-relator family is finite in each bounded degree and has convergent cost by (29). The remaining families are finite. All hypotheses of 4 hold, proving that $Q$ is infinite. Passage to the quotient preserves all earlier equalities and the density of each fiber image. ◻
]

Notice that $e$ is chosen after the finite cover and compactification. Thus their possibly large number of boundary components introduces no circular parameter choice. The surface construction now uses only the finite local images and the infinite fiber image recorded in 16.

== 6 The projective surface and its rational fiber <sec:surface>

We now turn the quotient of 16 into a fundamental-group image on a smooth projective surface. The construction must retain the distinguished fiber: its rational components will lift compactly, while the fundamental group of their union will have infinite image.

Recall the inputs. The complement $U = Y \\ D$ lies in a smooth connected projective surface $Y$, the boundary $D$ has simple normal crossings, and

$ rho : pi_1 \( U \) arrow.r Q $

has dense image in an infinite pro-$2$ group. Its restriction to a punctured smooth fiber also has dense image. Every component meridian of $D$ has finite image, and the meridians of the distinguished fiber $D_(*)$ have trivial image. This fiber consists of an unmarked main sphere and $24$ tails, each meeting the main sphere once and carrying two horizontal markings.

=== 6.1 A finite cover that kills all compactification meridians <a-finite-cover-that-kills-all-compactification-meridians>

At a crossing, two commuting meridians may have relations that neither cyclic subgroup detects separately. We therefore choose a finite quotient that detects the entire local group at every boundary point.

#thm([Lemma 6.1.])[
  (Finite local detection and descent).  #emph[Let $Y$ be a smooth connected projective complex surface, let $D$ be a simple-normal-crossings divisor, and put $U = Y \\ D$. Suppose $rho : pi_1 \( U \) arrow.r Q$ has dense image in a profinite group and sends every component meridian of $D$ to an element of finite order. There is a finite quotient $Q arrow.r.twohead P_f$ with the following properties.]
  + #emph[The quotient is injective on the image under $rho$ of every sufficiently small local boundary-complement group.]
  + #emph[The connected finite cover $pi : U' arrow.r U$ defined by $ker \( pi_1 \( U \) arrow.r P_f \)$ extends to a projective morphism $p : X arrow.r Y$, where $X$ is smooth and connected and $D_X = X \\ U'$ is a simple-normal-crossings divisor.]
  + #emph[Writing $i : U' arrow.r.hook X$ for inclusion, there is a homomorphism $rho_X : pi_1 \( X \) arrow.r Q$ such that 
#[#set math.equation(numbering: n => "(33)")
 $ rho_X compose i_(*) = rho compose pi_(*) . $ <eq:rho-descent>]

]
  #emph[Moreover, the resolution used to construct $X$ can be chosen to preserve every open subset of the normalization on which the surface is smooth and its reduced boundary has simple normal crossings.]
] <lem:local-detection>

#proof[
  We first find a finite quotient detecting all local boundary images, then compactify and resolve the corresponding cover, and finally check that the original quotient map kills every new boundary meridian.
  Choose a small coordinate polydisk $V$ about a point of $D$. Its boundary complement is
  $ V \\ D tilde.eq \( Delta^(*) \)^r times Delta^(2 - r) \, #h(2em) r in { 1 \, 2 } . $
  After choosing an access path in $U$, let $A_V subset Q$ be the image of its fundamental group. This group is generated by $r$ commuting finite-order elements, so it is finite. Only finitely many such images occur up to conjugacy: there is one meridian type on the smooth part of each boundary component and one local group at each crossing. The smooth part of an irreducible component, with its finitely many crossings removed, is connected; moving the access path along it conjugates the local group.
  For every nonidentity element in representatives of these finite groups, choose an open normal subgroup of $Q$ that does not contain it. Their finite intersection $N$ is open and normal. It satisfies
  #[#set math.equation(numbering: n => "(34)")
   $ N ∩ g A_V g^(- 1) = { 1 } #h(2em) \( g in Q \) $ <eq:local-detection>]
  for every local group. Set $P_f = Q \/ N$. Density makes the map $pi_1 \( U \) arrow.r P_f$ surjective, so its kernel defines a connected finite Galois cover $pi : U' arrow.r U$.
  The cover has the complex structure obtained by lifting local charts. It is algebraic and finite #emph[étale] by the Riemann existence theorem for complex varieties #cite(label("SGA1")) Exposé XII, Théorème 5.1. This theorem applies to the nonproper surface $U$. Normalize $Y$ in the function field of $U'$ and denote the resulting morphism by $n : overline(Y) arrow.r Y$. It is finite: complex varieties are Nagata, so finiteness of relative normalization applies to the finite-type morphism $U' arrow.r Y$ #cite(label("StacksProject")) Tag 03GR. Its restriction over $U$ is $U'$, because the latter is already normal. Finite morphisms are projective, so $overline(Y)$ is projective #cite(label("StacksProject")) Tag 0B3I.
  Resolve $overline(Y)$ by projective blowups, leaving its smooth locus unchanged; strong resolution in characteristic zero has this prescribed-open property #cite(label("EncinasHauser2002")) pp. 822–823. Next resolve the reduced boundary on the resulting smooth surface. For curves on a smooth surface this can be done by point blowups: resolve the singular component germs, decrease tangency intersection multiplicities, and separate crossings of three or more branches #cite(label("StacksProject")) Tag 0BIC and its proof. Choose these centers only where the boundary is not already simple normal crossings. Thus this additional operation preserves every open subset on which the pair was already smooth with simple normal crossings. We obtain
  $ X arrow.r^(med r med) overline(Y) arrow.r^(med n med) Y \, #h(2em) p = n compose r \, $
  with $X$ smooth and projective and with $D_X$ a simple-normal-crossings divisor. The dense open set $U'$ is unchanged, so $X$ is connected.
  We prove the factorization, including the meridians of resolution exceptional curves. The inclusion $i$ is surjective on fundamental groups: a loop can be perturbed off a real-codimension-two divisor. Its kernel is normally generated by the component meridians of $D_X$. Indeed, perturb a null-homotopy disk relative to its boundary so that it avoids the finitely many crossings of $D_X$ and meets its smooth part transversely. Deleting small disks around the finitely many intersection points expresses its boundary loop as a product of conjugates of meridians and their inverses.
  Let $E$ be any component of $D_X$, choose a smooth point $x in E$ away from the other components, and take a small transverse disk $T$ through $x$ with $T \\ { x } subset U'$. Choose a boundary polydisk $V$ about $p \( x \)$ downstairs. By shrinking $T$, we may assume $p \( T \) subset V$. Consequently the projection of a small meridian in $T \\ { x }$ lies in $V \\ D$. After including its access path, its $Q$-image belongs to a conjugate of $A_V$. This argument applies also when $E$ is exceptional and is contracted to a boundary point.
  The projected meridian has trivial image in $P_f$, since its lift is a closed loop in $U'$. Its $Q$-image therefore lies in both $N$ and a conjugate of $A_V$, and is trivial by (34). All generators of $ker i_(*)$ are thus killed by $rho compose pi_(*)$. This proves (33). ◻
]

Apply 17 to the map supplied by 16. Retain its notation $P_f \, N \, U' \, overline(Y) \, X \, p \, rho_X$. We next verify that the normalization is already smooth along the distinguished fiber, so that the resolution can preserve it.

=== 6.2 The distinguished fiber remains a union of spheres <the-distinguished-fiber-remains-a-union-of-spheres>

#thm([Lemma 6.2.])[
  #emph[Let $h : X arrow.r C'$ be the composite of $p$ and $Y arrow.r C'$. The resolution can be chosen so that the reduced fiber 
$ Z = h^(- 1) \( c_(*) \)_(upright("red")) $

 has only smooth rational irreducible components and ordinary transverse crossings.]
] <lem:rational-special-fiber>

#proof[
  Every vertical meridian along $D_(*)$ is trivial in $Q$, and hence in $P_f$, by 15. We describe the normalization locally at every kind of point of $D_(*)$. The restriction of the Galois cover to a boundary-complement polydisk is classified by its local meridian homomorphism to $P_f$; its connected components correspond to cosets of the local image.
  At a smooth unmarked point of $D_(*)$, the sole meridian is trivial. Every connected local cover therefore extends as a copy of the polydisk. At a node between the main component and a tail, both vertical meridians are trivial, and the same assertion holds.
  At a horizontal–vertical intersection choose coordinates $\( u \, v \)$ with the vertical curve $u = 0$ and the horizontal marking $v = 0$. The $u$-meridian is trivial. If the image of the $v$-meridian has order $e$, the kernel of the local map $bb(Z)^2 arrow.r P_f$ is $bb(Z) times e bb(Z)$. Each connected local cover thus has the finite normal extension
  #[#set math.equation(numbering: n => "(35)")
   $ \( u \, w \) mapsto \( u \, v \) = \( u \, w^e \) . $ <eq:distinguished-local-cover>]
  This extension is smooth, and its reduced boundary is $u w = 0$. Analytification preserves finiteness and normality #cite(label("SGA1")) Exposé XII, Propositions 2.1(vi) and 3.2(vi). Thus the local extensions just described agree with $overline(Y)$ by uniqueness of finite normal extension #cite(label("SGA1")) Exposé XII, Proposition 5.3. The entire preimage of $D_(*)$ lies in the smooth simple-normal-crossings locus of the normalized pair. The resolution in 17 can be the identity on this open neighborhood.
  Consider now an irreducible component above the main sphere. Its map to that sphere is unramified, including at the attaching nodes, and there are no horizontal markings on the main component. It is therefore a connected unramified cover of $bb(P)^1$, hence a sphere mapping with degree one. A component above a tail can branch only at its two horizontal markings, and is unramified at the attaching node. Removing those two points downstairs and all their preimages upstairs gives a connected finite cover of $bb(C)^(*)$. Its covering subgroup is $d bb(Z) subset bb(Z)$. Thus it is the covering $z mapsto z^d$ of $bb(C)^(*)$, whose smooth compactification is $bb(P)^1$.
  There are no additional components from resolution over $D_(*)$. The local models show that the components just identified are smooth and meet only in ordinary transverse crossings. This proves the assertion about $Z$. ◻
]

=== 6.3 Infinite image on the compact fiber <infinite-image-on-the-compact-fiber>

Although $D_(*)$ is a tree of spheres, a degree-$d$ component above one of its tails meets $d$ distinct degree-one lifts of the main sphere: the attaching node has $d$ distinct preimages. The incidence graph upstairs therefore need not be a tree. For a connected nodal union of simply connected components, van Kampen identifies its fundamental group with that of its dual graph, which has one vertex for each component and one edge for each node. We now prove that some connected component of $Z$ has infinite fundamental-group image in $X$.

#thm([Lemma 6.3.])[
  #emph[Let $Z = h^(- 1) \( c_(*) \)_(upright("red"))$ be the rational nodal fiber of 18. Some connected component $Z_0$ of $Z$ satisfies 
$ \| "im" #scale(x: 120%, y: 120%)[\(] pi_1 \( Z_0 \) arrow.r pi_1 \( X \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\|] = oo . $

]
] <lem:infinite-special-image>

#proof[
  Let $F_s subset U$ be a punctured smooth fiber, with $s in B'$, and choose access paths when comparing its group with $pi_1 \( U \)$. Its image under $rho$ is dense in $Q$ by 16. In particular its image in $P_f$ is all of $P_f$, so its inverse image $F'_s subset U'$ is connected. Under the covering inclusion, its group is the preimage of $N$ in $pi_1 \( F_s \)$. Thus the image of $pi_1 \( F'_s \)$ in $Q$ is
  $ rho #scale(x: 120%, y: 120%)[\(] pi_1 \( F_s \) #scale(x: 120%, y: 120%)[\)] ∩ N . $
  It is dense in $N$, because $N$ is open and the fiber image is dense in $Q$. The group $N$ is infinite: a finite open subgroup would make its finite-index overgroup $Q$ finite. Consequently the image of $pi_1 \( F'_s \)$ in $Q$ is infinite. By (33), its image in $pi_1 \( X \)$ is infinite as well.
  We transfer this conclusion to $Z$ using an explicit deformation-retract neighborhood. Regard $X$ as a compact real analytic manifold and $Z$ as a closed semianalytic subset. This pair admits a compatible finite triangulation #cite(label("Lojasiewicz1964")) Section 3, Theorem 2, p. 464. Write it as a finite simplicial pair $\( cal(K) \, cal(A) \)$, and barycentrically subdivide so that $cal(A)$ is a full subcomplex: any simplex whose vertices belong to $cal(A)$ belongs to $cal(A)$. For a point of $\| cal(K) \|$, let $s_(cal(A))$ be the sum of its barycentric coordinates at vertices of $cal(A)$. On the open neighborhood
  $ V = { s_(cal(A)) > 0 } $
  retain those coordinates, divide them by $s_(cal(A))$, and set all other coordinates to zero. Fullness ensures that the result belongs to $\| cal(A) \|$. The straight-line homotopy inside each simplex gives a strong deformation retraction $V arrow.r Z$. In particular the inclusion of $V$ into $X$ is homotopic to a map through $Z$.
  Properness of $h$ supplies the needed containment of nearby fibers. The set $h \( X \\ V \)$ is closed in $C'$ and does not contain $c_(*)$. Hence every whole fiber over a sufficiently small neighborhood of $c_(*)$ lies in $V$. Choose $s in B'$ in this neighborhood. Its connected punctured lifted fiber $F'_s$ lies in one connected component of $V$; the deformation retraction takes that component into a connected component $Z_0$ of $Z$. Therefore its inclusion-induced homomorphism to $pi_1 \( X \)$ factors, up to a change-of-basepoint conjugation, through $pi_1 \( Z_0 \)$. Since the former has infinite image, so does the latter. ◻
]

#proof[
  The construction above gives a smooth connected projective surface $X$. By Lemma 6.2, Lemma 6.3, it contains a connected nodal curve $Z_0$ with smooth rational irreducible components and infinite image in $pi_1 \( X \)$.
  2 now applies to $\( X \, Z_0 \)$. In the simply connected universal cover $tilde(X)$, every connected component $W$ above $Z_0$ is a closed noncompact locally finite union of compact rational curves. For every $w in W$, the holomorphic hull of ${ w }$ contains $W$ and is noncompact. This proves all the assertions of 1. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
