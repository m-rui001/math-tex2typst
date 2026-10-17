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

#align(center)[#text(size: 16pt, weight: "bold")[Invariant anticanonical indices and conversion of twisted differentials]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

Two questions about anticanonical bundles motivate this paper. First, when a torus acts on a compact complex manifold, can the invariant Euler characteristic at the trivial power force invariant cohomology at large anticanonical powers? Second, on a smooth projective variety, can a fixed pseudoeffective error be removed from an unbounded sequence of effective anticanonical twists? We answer the first question without a positivity assumption and the second under smooth metric semipositivity. They meet in an application to differential forms: invariant cohomology supplies forms that descend through monodromy, and conversion is applied only after that descent.

=== 1.1 The invariant index and its value at zero <the-invariant-index-and-its-value-at-zero>

Let $T$ be a compact real torus acting smoothly by holomorphic automorphisms on a compact complex manifold $F$. Its differential acts on the anticanonical line $L_F = - K_F = det T_F$. We call this the #emph[natural linearization]. The corresponding action on a section is $\( t dot.op s \) \( x \) = t_(L_F) s \( t^(- 1) x \)$; tensor powers carry the induced action. For each integer $m gt.eq 0$, define

$ I_T \( m \) = sum_(q gt.eq 0) \( - 1 \)^q dim H^q \( F \, L_F^m \)^T . $

Thus $I_T \( m \)$ is the multiplicity of the trivial representation in the Dolbeault index of $L_F^m$.

#thm([Theorem 1.1.])[
  (Invariant anticanonical index).  #emph[Let a compact real torus $T$ act holomorphically on a compact complex manifold $F$, and give $- K_F$ its natural linearization. There are an integer $a > 0$ and a polynomial $P in bb(Q) \[ t \]$ such that 
$ I_T \( m \) = P \( m \) quad upright("for every positive multiple ") m upright(" of ") a \, #h(2em) P \( 0 \) = I_T \( 0 \) . $

]
] <thm:index>

The theorem has no projectivity, Kählerness, or positivity premise. Its endpoint is essential: when $I_T \( 0 \) eq.not 0$, the polynomial cannot vanish at all large divisible exponents. Some fixed cohomological degree therefore contains invariant classes at unbounded exponents. Eventual polynomiality alone would give no information about whether that polynomial is zero.

The natural linearization is equally essential. On a point, twisting the trivial line by a nonzero torus character gives invariant dimension zero at every positive power and dimension one at power zero. For the natural anticanonical action, by contrast, the fiber character at a fixed component is the sum of the normal tangent characters. This identity controls the endpoint.

Our calculation uses the holomorphic Lefschetz framework of Atiyah–Bott #cite(label("AtiyahBott1966")) and its compact-group, fixed-component form due to Atiyah–Segal and Atiyah–Singer #cite(label("AtiyahSegal1968")) #cite(label("AtiyahSinger1968")). Polarizing its denominators expresses the invariant multiplicity as polynomially weighted lattice counts on rational polytopes with specified coordinate faces removed. Weighted Ehrhart theory supplies polynomiality on divisible exponents #cite(label("BaldoniBerlineDeLoeraKoeppeVergne2012")) preprint §2.4 and §3.1. To determine the value at zero, we prove the count directly, retaining all small divisible exponents, and then show that the anticanonical character gives a deformation retraction onto the removed faces. The cancellation is a difference of Euler characteristics of compact polyhedra. Stanley’s treatment of deleted boundary already identifies this constant term and singles out boundary visible from an exterior point #cite(label("Stanley1974Reciprocity")) Proposition 8.2 and the discussion and proof of Proposition 8.3. Here the anticanonical character produces such an exterior point in the affine counting space. We give a direct weighted argument and an explicit retraction, including degenerate polytopes.

When $F$ is Kähler and $L_F$ has a smooth semipositive metric, hard Lefschetz with semipositive coefficients #cite(label("DPS2001")) Theorem 0.1 gives

$ H^0 \( F \, Omega_F^(n - q) ⊗ L_F^(m + 1) \) arrow.r H^q \( F \, L_F^m \) \, #h(2em) n = dim F \, $

surjectively. An invariant Kähler form makes this map equivariant; compact averaging then preserves surjectivity on invariant subspaces. The coefficient is $L_F^(m + 1)$ because the cohomological target is $K_F ⊗ L_F^(m + 1) = L_F^m$. Thus Theorem 1 supplies invariant twisted differential forms when $I_T \( 0 \) eq.not 0$. The use of hard Lefschetz and a nonzero Euler characteristic to obtain infinitely many twisted forms already appears for canonical powers in #cite(label("DPS2001")) Theorem 2.7.3; here the invariant anticanonical index requires a separate argument to retain its value at exponent zero.

=== 1.2 Removing a fixed error <removing-a-fixed-error>

We use additive notation for line bundles and Cartier divisors. A divisor is #emph[pseudoeffective] if its numerical class lies in the closure of the effective cone. Smooth semipositivity means the existence of a smooth Hermitian metric with nonnegative Chern curvature; it implies nefness. The next theorem is an ordinary section theorem, with no group action.

#thm([Theorem 1.2.])[
  (Pseudoeffective-error conversion).  #emph[Let $S$ be a smooth connected projective complex variety, and suppose that $L = - K_S$ has a smooth Hermitian metric with semipositive Chern curvature. Let $D$ be a pseudoeffective Cartier divisor. If 
$ H^0 \( S \, cal(O)_S \( m_j L - D \) \) eq.not 0 $

 for a strictly increasing sequence of positive integers $m_j$, then $H^0 \( S \, cal(O)_S \( k L \) \) eq.not 0$ for some integer $k > 0$.]
] <thm:conversion>

The fixed error need not be effective. No rational-connectedness or Euler-characteristic assumption on $S$ is used. The argument begins with a rational map whose base has maximal dimension among maps $S arrow.r.dashed Y$ for which a multiple of $L$ dominates an ample base divisor in pseudoeffective order. Maximality forces ratios of the relevant sections to be base functions. Their horizontal zero orders consequently vary affinely with the exponent.

After birational modifications, a normalization along base divisors produces a line bundle $B$ on a smooth base $Y$ and a nonzero map

$ sigma : f^(*) B arrow.r ell pi^(*) L \, #h(2em) ell > 0 \, $

where $V$ is smooth, $pi : V arrow.r S$ is birational, and $f : V arrow.r Y$ is a morphism. This map will be used to transfer the sections constructed on the base to positive multiples of $L$ on $S$. The same maximality gives rank-one adjoint direct images, whose integral metrics yield a semipositive metric on $B$ by Berndtsson’s positivity theorem #cite(label("Berndtsson2009")). The normalization of $sigma$ makes the resulting weights locally bounded, including near singular fibers.

These bounds allow Fujino’s Kollár–Nadel theorem #cite(label("Fujino2018")) to give vanishing at every nonnegative base twist. A single Euler polynomial therefore equals the corresponding section dimension even at zero, where the exceptional canonical section makes it positive. Some positive exponent gives a section, which $sigma$ transfers back to $S$. As in the invariant-index argument, control at zero is what rules out the zero polynomial; the two constructions of that control are independent.

This criterion applies to differential forms through a determinant construction. The generic-span method of Lazić–Peternell #cite(label("LP2018")) Lemma 4.1, adapted in Lazić–Matsumura–Peternell–Tsakanikas–Xie #cite(label("LMPTX2023")) Lemma 5.1, extracts one fixed determinant line from infinitely many twisted forms. We give the argument for an unbounded positive sequence, including the numerically trivial case excluded by the hypotheses of those two cited lemmas. The cotangent subsheaf theorem #cite(label("LMPTX2023")) Theorem 4.1, with Ou’s generic nefness result #cite(label("Ou2023")) Theorem 1.4 as an antecedent, makes the negative of that line pseudoeffective. Theorem 2 then removes the error.

=== 1.3 Application through monodromy <application-through-monodromy>

For a smooth connected projective $X$, anticanonical nonvanishing asks for a section of $- m K_X$ for some $m > 0$. The positive-multiple question under smooth semipositivity is associated with Yau’s anticanonical-section problem #cite(label("Yau1994")) Problem 75. The prescribed-Ricci theorem #cite(label("Yau1978")) and the structure theorems of Demailly–Peternell–Schneider and Campana–Demailly–Peternell #cite(label("DPS1996")) #cite(label("CDP2015")) identify a compact rationally connected factor of the universal cover. Residual monodromy can still act on it through a compact torus, so a section on that factor alone need not descend. Müller’s equivariant theorem produces invariant plurisections under semiampleness #cite(label("Muller2025")) Theorem C. His Theorem A proves nonvanishing for projective klt pairs with nef anti-log-canonical divisor when its restriction to the general fiber of the maximal rationally connected fibration is semiample; Corollary B proves nonvanishing for projective klt threefold pairs with nef anti-log-canonical divisor. Our smooth application assumes metric semipositivity and imposes no fiber-semiampleness condition.

We apply the invariant index on the compact factor $F$ and ordinary conversion on a finite cover $S$ of $X$; descending forms is the step that connects those two spaces.

The companion #emph[Anticanonical nonvanishing from smooth semipositivity] #cite(label("CompanionH")) proves a finite-cover description with the residual torus and invariant canonical frames retained, as well as the finite étale norm of a section. We use only these geometric inputs. We prove locally that invariant twisted forms on the compact factor descend injectively to the finite cover. Theorem 1 and hard Lefschetz provide those forms, and Theorem 2 is applied after descent. Taking the norm then proves that $- m K_X$ has a nonzero section for some $m > 0$.

Passing to a positive multiple is necessary. On an Enriques surface $E$, $K_E$ has order two and $H^0 \( E \, - K_E \) = 0$ #cite(label("Dolgachev2016")). Consequently $E times bb(P)^1$ has a smoothly semipositive, non-torsion anticanonical bundle without a first-power section. In dimension two, the classification of Chen–Filip–Sun–Tosatti–Zhang #cite(label("CFSTZ2026")) Theorem 1.3 gives complementary geometric context.#footnote[Their introduction credits ChatGPT 5.6 Sol with suggesting a preliminary version of Lemma 5.2, which the authors reformulated and developed into its geometric statement and proof.]

Section 2 proves the index theorem and derives invariant twisted forms. Section 3 proves conversion by constructing the normalized relative section and bounded base metric. Section 4 gives the determinant argument. Section 5 proves form descent and the global application. The two principal theorems are independent of one another; their combination takes place only in that last application.

== 2 The invariant index, including exponent zero <sec:index>

The proof of Theorem 1 rests on two facts about weighted lattice counts, which we establish before applying localization. Here is the counting problem that explains their role. For a fixed component, polarization of the fixed-point formula produces integral vectors $alpha_1 \, dots.h \, alpha_s \, w in bb(Z)^r$, where $r = dim T$, and a subset $I subset { 1 \, dots.h \, s }$. Its counting equation is

$ sum_(i = 1)^s alpha_i b_i = - m w \, #h(2em) b_i > 0 med \( i in I \) \, quad b_i gt.eq 0 med \( i in.not I \) . $

The vectors $alpha_i$ are positive under one linear functional; $w$ is the natural anticanonical character; and $I$ records the denominators whose expansions start at a positive exponent. Section 2.2 derives these data from the normal tangent action. For now this equation explains the two counting tasks.

First, the closed count, in which every inequality is weak, is polynomial at every divisible exponent; its polynomial value at zero is the weight at zero. Second, imposing the strict inequalities removes coordinate faces. The anticanonical character gives a retraction onto their union, so its Euler characteristic cancels the constant of the closed count. Only the constant terms from contributions with no deleted faces survive. At actual exponent $m = 0$, positivity of the $alpha_i$ forces $b = 0$, allowed exactly in that same case. Matching these two endpoint calculations completes the index proof.

Polynomially weighted Ehrhart sums and fundamental parallelepipeds are classical; see #cite(label("BaldoniBerlineDeLoeraKoeppeVergne2012")) preprint §2.4 and §3.1. We give the count directly to retain the low divisible powers and the value at zero, before proving the special deleted-face assertion.

#thm([Lemma 2.1.])[
  (A weighted lattice count at zero).  #emph[Let $D subset bb(R)^s$ be a nonempty closed rational polytope, and let $W \( x \, m \)$ be a polynomial in $x$ and $m$. For sufficiently divisible positive integers $m$, 
$ sum_(x in m D ∩ bb(Z)^s) W \( x \, m \) $

 is polynomial in $m$, and its polynomial value at zero is $W \( 0 \, 0 \)$. The same assertion holds with coefficients in any finite-dimensional vector space.]
] <lem:ehrhart>

#proof[
  Choose a positive integer $a$ clearing all vertex denominators. Writing $m = a n$, replace $D$ by the lattice polytope $a D$ and the weight by $W \( x \, a n \)$. Its value at $\( 0 \, 0 \)$ is unchanged. We may therefore prove the assertion for a lattice polytope and again call the dilation variable $m$. Triangulate into closed lattice simplices, using lattice vertices. It suffices first to treat a $d$-dimensional simplex with vertices $v_0 \, dots.h \, v_d$.
  The vectors $\( v_i \, 1 \)$ are linearly independent. Use the lattice $bb(Z)^(s + 1) ∩ "span"_(bb(R)) { \( v_i \, 1 \) : 0 lt.eq i lt.eq d }$ in their real linear span. Every lattice point in their nonnegative cone has a unique expression
  $ p + sum_(i = 0)^d l_i \( v_i \, 1 \) \, #h(2em) l_i in bb(Z)_(gt.eq 0) \, $
  where $p$ is a lattice point of the half-open fundamental parallelepiped for these generators. This permits a lower-dimensional simplex, a nonunimodular simplex, and a simplex not containing the origin. The height $h$ of $p$ is an integer with $0 lt.eq h lt.eq d$, and height $m$ imposes $sum l_i = m - h$. For fixed $p$, substitute this expression into $W$ and expand the resulting polynomial in the basis $product_i binom(l_i, u_i)$, with coefficients polynomial in $m$. The identity
  #[#set math.equation(numbering: n => "(2.1)")
   $ sum_(l_i gt.eq 0\
sum l_i = m - h) product_(i = 0)^d binom(l_i, u_i) = binom(m - h + d, d + sum_i u_i) $ <eq:binomial>]
  follows by multiplying the generating functions $z^(u_i) \/ \( 1 - z \)^(u_i + 1)$. For $m gt.eq h$ it is the desired counting identity. For $0 lt.eq m < h$, the upper entry on the right is an integer between zero and $d - 1$, so the binomial polynomial also vanishes. Thus the polynomial formula is valid for every $m gt.eq 0$.
  At $m = 0$, every term with $h > 0$ vanishes. The only parallelepiped point of height zero is the origin. For it, only $u_i = 0$ for all $i$ contributes in (2.1), giving $W \( 0 \, 0 \)$. This proves the assertion for a simplex of any dimension.
  Apply inclusion–exclusion to the closed simplices in the triangulation. Each nonempty intersection is a lattice face and has the same constant term $W \( 0 \, 0 \)$. The alternating sum of these constant terms is $chi \( D \) W \( 0 \, 0 \) = W \( 0 \, 0 \)$, because a nonempty convex polytope is contractible. The vector-valued assertion follows coefficientwise. ◻
]

=== 2.1 The deleted boundary <the-deleted-boundary>

Polarizing a fixed-point denominator may exclude some coordinate faces. The next lemma proves the cancellation needed for those exclusions. Its geometry is simple: a point outside the nonnegative orthant lies in the affine space containing the polytope, and rays from that point first enter the polytope through the faces being removed.

#thm([Lemma 2.2.])[
  (Deleted faces).  #emph[Let $alpha_1 \, dots.h \, alpha_s$ be vectors admitting a linear functional positive on each, and let $I subset { 1 \, dots.h \, s }$. Put $u_i = - 1$ for $i in I$, $u_i = 1$ otherwise, and set 
$ D = {x_i gt.eq 0 : med sum_i alpha_i x_i = sum_i alpha_i u_i} . $

 If $D eq.not diameter$ and $I eq.not diameter$, the union 
$ A = union.big_(i in I) #scale(x: 120%, y: 120%)[\(] D ∩ { x_i = 0 } #scale(x: 120%, y: 120%)[\)] $

 is a deformation retract of $D$. In particular $chi \( A \) = 1$.]
] <lem:faces>

#proof[
  The positivity of the functional makes $D$ compact. For $x in D$, put
  $ t \( x \) = max_(i in I) frac(1, x_i + 1) \, #h(2em) r \( x \) = u + t \( x \) \( x - u \) . $
  Then $0 < t \( x \) lt.eq 1$, and $r \( x \)$ lies in the same affine equation space as $x$ and $u$. For $i in I$, its $i$-th coordinate is $- 1 + t \( x \) \( x_i + 1 \) gt.eq 0$, with equality for at least one index. For $i in.not I$, it is $1 - t \( x \) + t \( x \) x_i gt.eq 0$. Hence $r \( x \) in A$. If $x in A$, then $t \( x \) = 1$, so $r \( x \) = x$. The continuous straight homotopy from $x$ to $r \( x \)$ stays in the convex set $D$ and fixes $A$. This proves the assertion. ◻
]

Figure 1 illustrates this retraction when all three vectors $alpha_i$ are $1$ and $I = { 1 }$. The proof above also applies when $D$ has smaller dimension or consists of one point.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (3.15, 0), (0, 3.15), close: true, fill: rgb("#f0f0ff"), stroke: none)
  line((0, 0), (3.15, 0), (0, 3.15), close: true, stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.15, 0), (0, 3.15), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10))
  line((3.15, 3.15), (1.35, 1.8), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.63, 1.26), (1.35, 1.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  circle((3.15, 3.15), radius: 0.05292, fill: black, stroke: none)
  content((3.15, 3.15), [#text(size: 9pt)[$u=(-1,1,1)$]], anchor: "south-west", padding: 0.1176cm)
  circle((0.63, 1.26), radius: 0.05292, fill: black, stroke: none)
  content((0.63, 1.26), [#text(size: 9pt)[$x$]], anchor: "north-east", padding: 0.1176cm)
  circle((1.35, 1.8), radius: 0.05292, fill: black, stroke: none)
  content((1.138, 1.8), [#text(size: 9pt)[$r(x)$]], anchor: "east", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$(1,0,0)$]], anchor: "north-east", padding: 0.1176cm)
  content((3.15, 0), [#text(size: 9pt)[$(0,1,0)$]], anchor: "north-west", padding: 0.1176cm)
  content((0, 3.15), [#text(size: 9pt)[$(0,0,1)$]], anchor: "south-east", padding: 0.1176cm)
  content((0.6825, 0.5775), [#text(size: 9pt)[$D$]])
  content((2.257, 1.05), [#text(size: 9pt)[$A=\{x_1=0\} inter D$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The affine plane $x_1 + x_2 + x_3 = 1$, drawn using $\( x_2 \, x_3 \)$ as coordinates. The triangle is $D$, and its thick edge is the deleted union $A$. The point $r \( x \)$ is the first point of $D$ on the ray from $u$ through $x$; the homotopy moves $x$ along the indicated segment to that edge. ],
) <fig:deleted-face>

#prodef([Remark 2.3.])[
  (The visible-face alternative).  Stanley discusses the visible-boundary case in #cite(label("Stanley1974Reciprocity")) discussion preceding and proof of Proposition 8.3. Here it also gives a short geometric proof covering degenerate polytopes. With $D eq.not diameter$ and $I eq.not diameter$, the preceding coordinate calculation identifies $A$ as exactly the first entry points of rays from $u$ into $D$. Indeed, for $a in A$, a coordinate with $a_i = 0$, $i in I$, stays negative on the segment from $u$ preceding $a$. By strict separation, choose a linear functional $f$ and $c > 0$ with $f \( x - u \) > c$ on $D$, and project centrally onto $H = { z : f \( z - u \) = c }$:
  $ pi \( x \) = u + frac(c \( x - u \), f \( x - u \)) . $
  There is one first entry point on each ray meeting $D$, so $pi \|_A$ is a continuous bijection onto $pi \( D \)$, hence a homeomorphism by compactness. The image is convex: it is the section by $H$ of the convex cone with vertex $u$ generated by $D$. Thus $A$ is homeomorphic to a nonempty compact convex set and $chi \( A \) = 1$, also for lower-dimensional and singleton polytopes. Both proofs concern $chi \( D \) - chi \( A \)$; one must not replace that difference by the ordinary Euler characteristic of the nonclosed set $D \\ A$.
] <rem:visible-faces>

=== 2.2 Localization and the anticanonical character <subsec:localization>

We now identify the lattice domains in the fixed-point formula. The two lemmas above will determine their constant terms component by component.

#proof[
  Write $Lambda = "Hom" \( T \, S^1 \)$ for the character lattice and $t^lambda$ for the value at $t in T$ of a character $lambda in Lambda$. The invariant index is the coefficient of $t^0$ in the alternating character.
  The Dolbeault complex is an equivariant elliptic complex on any compact complex manifold; a Kähler metric is not needed for its index. For elements generating dense cyclic subgroups of $T$, the fixed locus is $F^T$. If $F^T$ is empty, the fixed-point theorem makes the entire alternating character zero on these elements. Such elements are dense in $T$, and the character of a finite-dimensional virtual representation is continuous, hence identically zero. In this case $I_T \( m \) = 0$ for all $m$, including zero, and we take $P = 0$. Otherwise apply the equivariant Dolbeault fixed-point formula on the dense set of these elements. Clearing its finitely many denominators gives an identity of rational characters. Its compact-group form, including fixed components, follows from #cite(label("AtiyahSegal1968")) Theorem 2.12 and §3 and #cite(label("AtiyahSinger1968")) Theorems 3.9 and 4.3. For a component $Z$ of $F^T$, write $nu_i eq.not 0$ for the normal tangent characters, repeated with their ranks, and $x_i$ for the corresponding formal Chern roots. The natural anticanonical fiber weight is
  $ w = sum_i nu_i . $
  Writing $L = K_F^(- 1)$, the contribution to the alternating character is
  #[#set math.equation(numbering: n => "(2.2)")
   $ integral_Z "td" \( Z \) thin e^(m c_1 \( L \|_Z \)) thin t^(m w) product_i frac(1, 1 - t^(- nu_i) e^(- x_i)) . $ <eq:localization>]
  The action on sections uses the inverse action on arguments, accounting for the conormal characters in the denominator. Choose an integral one-parameter direction pairing nontrivially with every normal character at every fixed component. For a component $Z$, let $I$ be the indices with positive pairing. Put $alpha_i = nu_i$ on $I$, and $alpha_i = - nu_i$ otherwise. All $alpha_i$ pair positively with the chosen direction. The pairings are positive integers, hence at least one. Expand the denominators toward exponents with positive pairing:
  $ frac(1, 1 - t^(- nu_i) e^(- x_i)) = cases(delim: "{", - sum_(b_i > 0) t^(b_i alpha_i) e^(b_i x_i) \, & i in I \,, sum_(b_i gt.eq 0) t^(b_i alpha_i) e^(- b_i x_i) \, & i in.not I .) $
  These expansions respect the identity of rational characters in a completion in which there are only finitely many terms below each pairing bound. In particular, each trivial-character coefficient is a finite sum.
  The coefficient of the trivial character in (2.2) is therefore a polynomially weighted lattice count satisfying
  $ sum_i alpha_i b_i = - m w \, #h(2em) b_i > 0 med \( i in I \) \, quad b_i gt.eq 0 med \( i in.not I \) . $
  Before integration, the polynomial weight in the truncated root space is
  #[#set math.equation(numbering: n => "(2.3)")
   $ W \( b \, m \) = \( - 1 \)^(\| I \|) ["td" \( Z \) exp #h(-0.16667em) (m c_1 \( L \|_Z \) + sum_(i in I) b_i x_i - sum_(i in.not I) b_i x_i)]_(lt.eq dim Z) . $ <eq:lattice-weight>]
  The bracket retains complex cohomological degrees at most $dim Z$, so only finitely many terms contribute and $W$ is polynomial in $b \, m$. The sign is part of this weight. All root expressions are interpreted by the splitting principle in truncated cohomological degrees. Operations are first performed coefficientwise with formal roots. Individual root monomials or individual face terms need not define cohomology classes. Permuting roots within an equal-character normal bundle, together with the corresponding lattice coordinates, preserves the entire lattice domain and its total weighted sum. Thus the complete sum is symmetric at every positive divisible exponent. Its polynomial continuation is symmetric coefficient by coefficient, by uniqueness of a polynomial on an infinite progression. Only after taking this complete sum do we interpret the symmetric polynomials as characteristic classes and integrate on $Z$.
  For positive $m$, the domain is the dilation by $m$ of the rational compact polytope
  #[#set math.equation(numbering: n => "(2.4)")
   $ D = {b_i gt.eq 0 : med sum_i alpha_i b_i = - w} \, $ <eq:D>]
  with the union $A$ of its faces $b_i = 0$, $i in I$, removed.
  If $I = diameter$, then $- w = sum_i alpha_i$, so $D eq.not diameter$. Lemma 3 gives the polynomial continuation, whose constant term is the weight at $\( b \, m \) = \( 0 \, 0 \)$. If $I eq.not diameter$ and $D$ is empty, the contribution is zero. Otherwise the vector with coordinates $- 1$ on $I$ and $1$ elsewhere belongs to the affine equation space in (2.4), since the linearization is anticanonical. Lemma 4 gives $chi \( A \) = chi \( D \) = 1$. By inclusion–exclusion and Lemma 3, the polynomial constant term of the count on $D \\ A$ is
  $ #scale(x: 120%, y: 120%)[\(] chi \( D \) - chi \( A \) #scale(x: 120%, y: 120%)[\)] W \( 0 \, 0 \) = 0 . $
  These constants are exactly the actual trivial-character contributions at $m = 0$. Indeed, positivity of the pairing forces every $b_i = 0$ when $sum alpha_i b_i = 0$; this is permitted precisely when $I = diameter$. Summing over fixed components and taking a common divisibility integer proves both polynomiality and $P \( 0 \) = I_T \( 0 \)$. An empty normal list gives the one-point lattice domain in $bb(R)^0$, with no deleted faces; its contribution is the ordinary index integral on that fixed component. This also handles a trivial torus. The empty fixed set was handled before localization. Finally, the polynomial has rational coefficients because its values at all positive points of an integral progression are integers. ◻
]

=== 2.3 Invariant twisted forms <invariant-twisted-forms>

The index theorem is independent of positivity. For its geometric application we now assume Kählerness and introduce the analytic map that turns cohomology into holomorphic forms.

#thm([Theorem 2.4.])[
  (Hard Lefschetz with semipositive coefficients).  #emph[Let $F$ be compact Kähler of dimension $n$, with Kähler form $omega$, and let $A$ have a smooth semipositive Hermitian metric. For every $0 lt.eq q lt.eq n$, wedge multiplication by $omega^q$ induces a surjection 
$ H^0 \( F \, Omega_F^(n - q) ⊗ A \) arrow.r H^q \( F \, K_F ⊗ A \) . $

]
] <thm:lef>

This is the smooth-metric case of #cite(label("DPS2001")) Theorem 0.1; its multiplier ideal is trivial. The smooth-coefficient Lefschetz theorem of Mourougane #cite(label("Mourougane1999")) Theorem 2.6 and the earlier nef-coefficient cohomology work of Takegoshi #cite(label("Takegoshi1997")) Theorem 1 are antecedents of this statement. We use the formulation in #cite(label("DPS2001")). If a compact group preserves the data, the map is equivariant. Averaging over the group then preserves surjectivity on invariant subspaces.

#thm([Corollary 2.5.])[
  #emph[Let $F$ be compact Kähler with smoothly semipositive $L_F = - K_F$, and let a compact torus $T$ act holomorphically, with the natural linearization on $L_F$. If 
$ sum_q \( - 1 \)^q dim H^q \( F \, cal(O)_F \)^T eq.not 0 \, $

 then for some fixed $p gt.eq 0$ and arbitrarily large positive integers $m$, 
$ H^0 \( F \, Omega_F^p ⊗ L_F^(m + 1) \)^T eq.not 0 . $

]
] <cor:invariantforms>

#proof[
  By Theorem 1, $I_T \( m \) eq.not 0$ for all but finitely many positive integers in a divisible progression. Some fixed $q$ therefore has $H^q \( F \, L_F^m \)^T eq.not 0$ for unbounded $m$. Average a Kähler form over $T$, and apply Theorem 6 with $A = L_F^(m + 1)$. Its target is
  $ H^q \( F \, K_F ⊗ L_F^(m + 1) \) = H^q \( F \, L_F^m \) . $
  The wedge map is equivariant, and compact averaging gives an invariant preimage of each invariant target class. Take $p = dim F - q$. Indeed the map is $u mapsto \[ omega^q and u \]$; it depends on the averaged Kähler form and the natural linearization, not on the coefficient metric used to establish surjectivity. Averaging a chosen preimage over Haar probability measure therefore leaves its invariant target unchanged. ◻
]

== 3 Removing a pseudoeffective error <sec:conversion>

We prove Theorem 2. Throughout this section $L = - K_S$ carries a fixed smooth semipositive metric, and we choose effective integral divisors

#[#set math.equation(numbering: n => "(3.1)")
 $ N_j tilde.op m_j L - D \, #h(2em) m_1 < m_2 < dots.h.c . $ <eq:effective-sequence>]

We use additive notation for line bundles. A divisor is pseudoeffective when its numerical class lies in the closed effective cone; on a smooth projective variety it is equivalent to admitting a singular Hermitian metric with semipositive curvature current #cite(label("DPS2001")). Such classes pull back under dominant maps between smooth projective varieties and push forward under birational morphisms.

The proof builds a resolution $pi : V arrow.r S$, a morphism $f : V arrow.r Y$, and a line bundle $B$ on the base, together with a nonzero map $f^(*) B arrow.r ell pi^(*) L$. The map will be used to transfer the sections constructed on the base to positive multiples of $L$ on $S$. Its normalization will also supply the bounds needed to construct those base sections.

=== 3.1 The base and the relative section <the-base-and-the-relative-section>

===== 3.1.1 A maximal base. <a-maximal-base.>

Call a dominant rational map $S arrow.r.dashed Y$ #emph[dominated by $L$] if, after resolving it to a morphism $f : V arrow.r Y$,

#[#set math.equation(numbering: n => "(3.2)")
 $ c pi^(*) L - f^(*) H quad upright("is pseudoeffective") $ <eq:domination>]

for some positive integer $c$ and ample Cartier divisor $H$ on the integral projective variety $Y$. The constant map is allowed: the trivial line on a point is ample, and $L$ is pseudoeffective. There is therefore a dominated map of largest possible base dimension.

We may choose its base smooth and its function field relatively algebraically closed in $bb(C) \( S \)$. Indeed, normalize the original base in its relative algebraic closure in $bb(C) \( S \)$, a finite extension, and then resolve the base and the rational map. The pullback of the original ample divisor to the new smooth base is big. A large multiple of this pullback dominates an ample divisor in pseudoeffective order, which preserves (3.2). The same argument permits further birational modifications of the base and higher smooth source models.

This choice has a useful maximality property. If $A$ is a line bundle on $S$ and $c' L - A$ is pseudoeffective for some $c' > 0$, then the ratio of any two nonzero sections of $A$ lies in $bb(C) \( Y \)$. To prove this, suppose their ratio is nonconstant and resolve the corresponding pencil. Its moving line is the pullback of $cal(O)_(bb(P)^1) \( 1 \)$, and its fixed divisor is effective, so the pencil is dominated by $L$. The joint map of this pencil and $S arrow.r.dashed Y$ is dominated as well: add their two inequalities on a common resolution and restrict the ample product line to the joint image. Normalizing and resolving that image preserves domination. By maximality its dimension is $dim Y$, so the pencil’s function is algebraic over $bb(C) \( Y \)$. Relative algebraic closedness places it in $bb(C) \( Y \)$, as asserted. A constant ratio already has this property. When necessary, increasing $c'$ to an integer preserves pseudoeffectivity because $L$ is pseudoeffective.

Apply this property to the effective divisors in

#[#set math.equation(numbering: n => "(3.3)")
 $ \( m_j - m_2 \) N_1 + \( m_2 - m_1 \) N_j tilde.op \( m_j - m_1 \) N_2 \, #h(2em) j > 2 . $ <eq:interpolation>]

Their common class is $\( m_j - m_1 \) \( m_2 L - D \)$, which is bounded above by $\( m_j - m_1 \) m_2 L$ in pseudoeffective order. The equivalence function in (3.3) thus belongs to $bb(C) \( Y \)$. On any normal model resolving the map to $Y$, a prime is called #emph[horizontal] if it dominates $Y$, and #emph[vertical] otherwise. A base function has order zero at a horizontal prime. If $a_j$ is the coefficient of the pullback of $N_j$ at such a prime, then (3.3) gives

$ a_j = a_1 + frac(m_j - m_1, m_2 - m_1) \( a_2 - a_1 \) . $

Since $a_j gt.eq 0$ along an unbounded sequence, $a_2 gt.eq a_1$. Consequently the pullback of $N_2 - N_1$ has effective horizontal part.

If $Y$ is a point, apply this calculation on $S$ itself: every prime is horizontal, and $N_2 - N_1$ is effective. Its class is $\( m_2 - m_1 \) L$, proving the theorem in this case. Henceforth $dim Y > 0$. The remaining task is to remove the negative vertical coefficients by subtracting a divisor from the base.

===== 3.1.2 Normalization along base divisors. <normalization-along-base-divisors.>

For that subtraction to see every vertical coefficient, we need each vertical prime to dominate a base divisor. We construct a normal intermediate model with this property:

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$V$])
  content((2.057, 0), [$U$])
  content((4.115, 0), [$S$])
  content((2.057, -1.239), [$Y$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$rho$]])
  bezier((0.2466, -0.1485), (1.811, -1.09), (0.7408, -0.6611), (1.126, -0.8933), mark: (end: ">"))
  content((1.129, -0.4535), [#text(size: 0.73em)[$f$]])
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  content((3.086, 0.2266), [#text(size: 0.73em)[$b$]])
  line((2.057, -0.2725), (2.057, -0.9661), mark: (end: ">"))
  content((2.38, -0.6193), [#text(size: 0.73em)[$h$]])
})
$#h(2em) pi = b rho \, quad f = h rho .$

Here $b$ and $rho$ are birational, $V$ and $Y$ are smooth projective, and every prime divisor of $U$ that fails to dominate $Y$ dominates a prime divisor of $Y$.

For this construction, begin with a smooth resolution $V_0 arrow.r Y_0$ of the maximal map. On a dense open of $Y_0$, its fibers form a flat family of subschemes of $V_0$ with a fixed Hilbert polynomial. Resolve the induced rational map from $Y_0$ to the projective Hilbert scheme, obtaining a smooth projective birational base $Y$ #cite(label("Grothendieck1961Hilbert")) Theorem 3.2, p. 260; p. 265. Pull back the universal family. Every fiber of this family has dimension $r = dim S - dim Y$. The reduced closure $W$ of the original flat family is integral and maps birationally to $V_0$. Its fibers are closed subschemes of the pulled-back Hilbert fibers, so have dimension at most $r$. The normalization $U arrow.r W$ is finite, and hence has the same fiber-dimension bound over $Y$. A prime divisor $Q subset U$ mapping into a subset of codimension at least two would satisfy

$ dim Q lt.eq dim Y - 2 + r = dim S - 2 \, $

which is impossible. Resolve $U$ to obtain $V$. The dimension bound is needed on $U$; the smooth space $V$ will be used for metrics and vanishing. The preceding maximality argument preserves (3.2) throughout these modifications.

On this model, let $s_0$ be the rational section of $\( m_2 - m_1 \) b^(*) L$ whose divisor is $b^(*) \( N_2 - N_1 \)$. Its horizontal part is effective by the preceding calculation. The base divisor to be subtracted is now determined one prime at a time.

For each prime divisor $P subset Y$, subtract the smallest normalized vertical order:

#[#set math.equation(numbering: n => "(3.4)")
 $ b_P = min_(Q mapsto P) frac("ord"_Q \( s_0 \), "ord"_Q \( h^(*) P \)) . $ <eq:minima>]

The minimum runs over the finitely many components of $h^(*) P$ dominating $P$. This set is nonempty and its denominators are positive. Only finitely many $b_P$ are nonzero, because $"div" \( s_0 \)$ has finite support. Every vertical prime of $U$ occurs in one of these minima. Together with horizontal effectivity, this proves

$ "div" \( s_0 \) - h^(*) #scale(x: 180%, y: 180%)[\(] sum_P b_P P #scale(x: 180%, y: 180%)[\)] gt.eq 0 . $

Choose a positive integer $a$ clearing all denominators and set

$ ell = a \( m_2 - m_1 \) \, #h(2em) B = a sum_P b_P P . $

Smoothness of $Y$ makes $B$ Cartier. On the normal variety $U$, the resulting rational section of $ell b^(*) L - h^(*) B$ has nonnegative order at every prime, so is regular. Pulling it back to $V$ gives

#[#set math.equation(numbering: n => "(3.5)")
 $ sigma : cal(O)_V \( f^(*) B \) arrow.r cal(O)_V \( ell pi^(*) L \) . $ <eq:sigma>]

For every base prime $P$, some component of $f^(*) P$ dominating $P$ has order zero in $sigma$: take the strict transform of a prime attaining (3.4). Its strict transform defines the same divisorial valuation, since $U$ is normal and hence regular at its generic point. The new exceptional divisors on $V$ acquire no poles because the pulled-back section is regular. This is the normalization we will use near singular fibers; equidimensionality of $V$ is unnecessary.

===== 3.1.3 Rank one of the adjoint direct images. <rank-one-of-the-adjoint-direct-images.>

We now have the map that will transfer sections from the base. To construct a semipositive metric on its source line $B$, we will use adjoint integral metrics. Their direct images must first be shown to have rank one. The anticanonical identity enters at this point. Put

#[#set math.equation(numbering: n => "(3.6)")
 $ E = K_V - pi^(*) K_S = K_V + pi^(*) L . $ <eq:discrepancy>]

The divisor $E$ is effective and $pi$-exceptional; denote its canonical section by $e$. For every integer $k gt.eq 0$, we claim that

#[#set math.equation(numbering: n => "(3.7)")
 $ cal(G)_k = f_(*) cal(O)_V \( E + k ell pi^(*) L \) quad upright("has generic rank one.") $ <eq:rank-one>]

The section $e sigma^k$, after trivializing $B$ over the generic point, shows that the rank is at least one, also when $k = 0$. If it were larger, Serre’s global generation theorem would give, for some positive $t$, two sections of $E + k ell pi^(*) L + t f^(*) H$ independent over $bb(C) \( Y \)$. Their ratio would lie outside that field.

Push their zero divisors forward to $S$. They become two effective divisors in one Cartier class

$ A tilde.op k ell L + t pi_(*) f^(*) H \, $

with the same rational-function ratio. Indeed, choose a Cartier divisor representing the upstairs line and express both sections as rational functions; birational pushforward preserves their principal divisors, and $pi_(*) E = 0$. Smoothness makes the common downstairs divisor Cartier. Pushing forward (3.2) gives

$ \( k ell + t c \) L - A quad upright("pseudoeffective") . $

The maximality property then places the ratio in $bb(C) \( Y \)$, a contradiction. The coefficient $k ell + t c$ is positive even at $k = 0$, proving (3.7) in its full stated range.

=== 3.2 The bounded base metric <the-bounded-base-metric>

We have constructed $B$ and $sigma$; the next task is a semipositive metric on $B$ with locally bounded weights. For a local frame $beta$, our weight convention is $- log \| beta \|^2$, so semipositive curvature means that the weights are plurisubharmonic. We obtain them as limits of adjoint integral metrics. We use Berndtsson’s direct-image theorem in the following form #cite(label("Berndtsson2009")) Theorem 1.2: for a proper holomorphic submersion with Kähler total space and a smoothly semipositive line bundle $A$, the natural $L^2$ metric on $f_(*) \( K_(V \/ Y) + A \)$ has semipositive curvature wherever the adjoint sections form a vector bundle. The coefficient metric may be semipositive; strict positivity along the fibers is not required.

Let $h_L$ denote the pulled-back smooth metric on $pi^(*) L$. Choose a dense Zariski open $Y^compose$ on which $f$ is smooth and $e$ and $sigma$ are not identically zero on any fiber. The fibers there are connected: relative algebraic closedness of $bb(C) \( Y \)$ in $bb(C) \( S \)$ makes the finite part of the Stein factorization trivial. For a local frame $beta$ of $B$, set $sigma_beta = sigma \( f^(*) beta \)$ and

#[#set math.equation(numbering: n => "(3.8)")
 $ phi_beta \( y \) = - log max_(V_y) \| sigma_beta \|_(h_L^ell)^(thin 2) \, #h(2em) y in Y^compose . $ <eq:max-weight>]

The fiberwise maximum is positive and continuous on this open set.

To see that $phi_beta$ is plurisubharmonic, take a local frame $tau$ of $K_Y$. Equation (3.6) gives

#[#set math.equation(numbering: n => "(3.9)")
 $ K_(V \/ Y) + \( 1 + k ell \) pi^(*) L = E + k ell pi^(*) L - f^(*) K_Y . $ <eq:adjoint>]

Thus $e sigma_beta^k \/ f^(*) tau$ is an adjoint section. By (3.7) and generic base change, it spans the adjoint direct image on a dense open subset of $Y^compose$. For every integer $k gt.eq 1$, Berndtsson’s theorem makes

#[#set math.equation(numbering: n => "(3.10)")
 $ phi_(beta \, k) \( y \) = - 1 / k log integral_(V_y) \| sigma_beta \|_(h_L^ell)^(thin 2 k) lr(|e \/ f^(*) tau|)_(h_L)^(thin 2) $ <eq:moment-weights>]

plurisubharmonic on that dense open. The integral is smooth and strictly positive throughout $Y^compose$; its curvature inequality therefore holds on all of $Y^compose$ by continuity.

The final factor in the integral is the smooth nonnegative measure obtained from a $pi^(*) L$-valued relative canonical form. It has positive mass and full support on each fiber, because a nonzero holomorphic section on a connected smooth fiber cannot vanish on an open subset. Denote this measure by $mu_y$, its mass by $M \( y \) > 0$, and put

$ q_beta = \| sigma_beta \|_(h_L^ell)^(thin 2) \, #h(2em) A_k \( y \) = (frac(1, M \( y \)) integral_(V_y) q_beta^k thin d mu_y)^(1 \/ k) . $

Hölder’s inequality for the probability measure $M \( y \)^(- 1) mu_y$ shows that $A_k \( y \)$ increases with $k$. Full support gives $A_k \( y \) arrow.r max_(V_y) q_beta$. The moments and their limit are continuous, so Dini’s theorem makes this convergence uniform on every compact subset of a coordinate open in $Y^compose$. The limit is positive there. Since

$ phi_(beta \, k) = - log A_k - 1 / k log M \, $

the weights in (3.10) converge locally uniformly to $phi_beta$. Their limit is plurisubharmonic.

It remains to establish local bounds near the omitted fibers. Properness of $f$ and smoothness of the upstairs metric bound $q_beta$ above over every relatively compact base neighborhood. Equation (3.8) therefore gives a local lower bound for $phi_beta$, even as one approaches the boundary.

For the upper bound, let $P$ be a divisorial component of $Y \\ Y^compose$. The normalization of $sigma$ supplies a component $Q$ above $P$ on which $sigma$ is generically nonzero. Choose a general point of $Q$ where $P \, Q$ are smooth, $Q arrow.r P$ is submersive, no other component of $f^(*) P$ passes through the point, and $sigma eq.not 0$. In suitable local coordinates, a transverse coordinate to $P$ pulls back to a unit times $z_1^r$, with $r > 0$, while the other base coordinates pull back to independent coordinates along $Q$. Taking a local root absorbs the unit. This local form shows that a small source neighborhood maps onto a base neighborhood. On a still smaller source neighborhood, $q_beta$ has a positive lower bound. Every sufficiently nearby fiber meets this neighborhood, so its maximum has the same lower bound. This gives an upper bound for $phi_beta$ near a general point of $P$.

The removable-singularity theorem for plurisubharmonic functions now extends $phi_beta$ across dense open subsets of all boundary divisors. These opens can be taken Zariski open: nonvanishing and the required differential ranks hold on algebraic opens of $Q$, whose dominant constructible images contain dense Zariski opens of $P$. The set still omitted is therefore contained in a closed analytic set $A subset Y$ of codimension at least two.

We recall why no upper-bound obstruction remains at $A$. Near a point of $A$, choose a small affine complex disk centered there whose boundary misses $A$, and a compact neighborhood of that boundary disjoint from $A$. The plurisubharmonic function has a common upper bound on this neighborhood. For every nearby $y in.not A$, choose a disk of the same radius centered at $y$, with direction sufficiently close to the original one that its boundary stays in this fixed neighborhood. Its direction can also be chosen so that the whole disk misses $A$: the radial image of $A$, viewed from $y$, in the space of complex line directions has real dimension at most $2 dim Y - 4$, smaller than the direction space dimension $2 dim Y - 2$. The submean inequality gives a common upper bound at all such $y$. Removable singularities therefore extend the function across $A$ as well. The upper-limit extension preserves the lower bound already supplied by properness.

We have obtained locally bounded plurisubharmonic weights on all of $Y$. Under $beta' = g beta$, formula (3.8) gives

$ phi_(beta') = phi_beta - log \| g \|^2 . $

The same relation holds after extension, so the weights define a semipositive singular Hermitian metric $h_B$ on $B$, with locally bounded weights.

=== 3.3 Vanishing at every nonnegative exponent <vanishing-at-every-nonnegative-exponent>

The bounded metric on $B$ is now available. To produce sections, we combine it with a metric on $pi^(*) L$ that is positive in base directions and has no multiplier-ideal loss. Recall that $cal(J) \( h \)$ consists locally of holomorphic functions $g$ for which $\| g \|^2 e^(- phi_h)$ is integrable.

The domination (3.2) gives a singular metric on $pi^(*) L$ whose curvature is positive in base directions. More precisely, combine a semipositive singular metric on $c pi^(*) L - f^(*) H$ with a positive smooth metric on $H$, and take the $c$-th root. The resulting metric $h_1$ satisfies

$ Theta_(h_1) \( pi^(*) L \) gt.eq c^(- 1) f^(*) omega_H . $

Mix its local weights with those of the smooth semipositive metric $h_L$: for some $0 < delta < 1$, put $h = h_L^(1 - delta) h_1^delta$. The local exponential-integrability consequence of Skoda’s theorem #cite(label("Skoda1972")) Proposition 7.1, p. 389 supplies, near each point, a sufficiently small positive exponent for which the negative exponential of the singular weight is integrable. We use its arbitrary-plurisubharmonic-weight formulation in #cite(label("DemaillyKollar2001")) Definition 0.1 and 1.4(8): for a nontrivial psh weight $phi$, the local integrability threshold of $e^(- 2 gamma phi)$ is positive. This formulation also includes complex dimension one. In our squared-norm convention, take $gamma = delta \/ 2$. A finite coordinate cover of the compact space $V$ gives one common $delta > 0$. The smooth part changes integrability by bounded factors. Hence

#[#set math.equation(numbering: n => "(3.11)")
 $ Theta_h \( pi^(*) L \) gt.eq epsilon.alt f^(*) omega_H \, #h(2em) cal(J) \( h \) = cal(O)_V \, #h(2em) epsilon.alt = delta \/ c > 0 . $ <eq:small-metric>]

For each integer $k gt.eq 0$, tensor this metric with $f^(*) h_B^k$. Its curvature is still at least $epsilon.alt f^(*) omega_H$, and its multiplier ideal is still trivial: for every fixed $k$, the added weight is locally bounded. Thus the same choice of $h$ works at all the required exponents.

We use Fujino’s Kollár–Nadel vanishing theorem in the following form #cite(label("Fujino2018")) Theorem 1.3. If $f : V arrow.r Y$ is a surjective morphism from a compact Kähler manifold to a projective variety and a line bundle $A$ has a singular metric $h_A$ with $Theta_(h_A) \( A \) gt.eq epsilon.alt f^(*) omega_H$, then

$ H^i #scale(x: 120%, y: 120%)[\(] Y \, R^q f_(*) \( cal(O)_V \( K_V + A \) ⊗ cal(J) \( h_A \) \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( i > 0 \, med q gt.eq 0 \) . $

Fujino derives this form from the injectivity and multiplier-ideal Bertini theorems of Fujino–Matsumura #cite(label("Fujino2018")) Theorems 1.1–1.3. The metric need not have analytic singularities. Apply the theorem to $A = pi^(*) L + k f^(*) B$, with the metric just constructed, and take $q = 0$. Since $K_V + pi^(*) L = E$, the projection formula gives

#[#set math.equation(numbering: n => "(3.12)")
 $ H^i #scale(x: 120%, y: 120%)[\(] Y \, cal(G) ⊗ cal(O)_Y \( k B \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( i > 0 \, med k gt.eq 0 \) \, #h(2em) cal(G) = f_(*) cal(O)_V \( E \) . $ <eq:all-vanishing>]

Riemann–Roch on the smooth projective base makes

$ Q \( k \) = chi #scale(x: 120%, y: 120%)[\(] Y \, cal(G) ⊗ cal(O)_Y \( k B \) #scale(x: 120%, y: 120%)[\)] = integral_Y "ch" \( cal(G) \) e^(k c_1 \( B \)) "td" \( Y \) $

a polynomial in $k$, whether or not $B$ is ample. By (3.12), this polynomial equals $h^0 \( Y \, cal(G) ⊗ cal(O)_Y \( k B \) \)$ at every nonnegative integer. At zero the canonical section $e$ gives a nonzero section, so $Q \( 0 \) > 0$. This is why vanishing at $k = 0$ is indispensable: without it, the existence of $e$ would not determine the Euler characteristic. The polynomial is nonzero, and hence cannot vanish at every positive integer. For some $k > 0$ there is a nonzero section of $E + k f^(*) B$ on $V$.

Multiply this section by $sigma^k$ from (3.5). The result is a nonzero section of $E + k ell pi^(*) L$. Finally, $pi_(*) cal(O)_V \( E \) = cal(O)_S$: a rational function with possible poles only on the effective exceptional divisor $E$ is regular away from its codimension-two image, and extends across that image by normality of $S$. The projection formula therefore sends our section to a nonzero section of $k ell L$, completing the proof of Theorem 2.

The two appearances of $L = - K_S$ explain the strength and the scope of the criterion. The identity $K_V + pi^(*) L = E$ supplies the adjoint section used in the integral metric and turns adjoint vanishing into the fixed sheaf $f_(*) cal(O)_V \( E \)$ at exponent zero. These steps connect the positive base metric to an Euler polynomial with a known nonzero value.

== 4 From twisted differentials to effective divisors <sec:differentials>

Theorem 2 accepts any fixed pseudoeffective error. We now construct one from differential forms, so that the invariant forms obtained in Section 2 can be used after descent. The construction has two steps: take a fixed determinant line of a generic span, then control the sign of that line by generic nefness.

#thm([Theorem 4.1.])[
  (Cotangent subsheaves).  #emph[Let $S$ be smooth projective with $- K_S$ nef. If a line bundle $M$ is a saturated subsheaf of $\( Omega_S^1 \)^(⊗ b)$, where $b > 0$, then $- M$ is pseudoeffective.]
] <thm:subsheaf>

This is the smooth, zero-boundary, rank-one case of #cite(label("LMPTX2023")) Theorem 4.1; Ou’s generic-nefness theorem #cite(label("Ou2023")) Theorem 1.4 is an antecedent of the cotangent result.

#thm([Lemma 4.2.])[
  (Determinants of twisted differentials).  #emph[Let $S$ be smooth connected projective with $- K_S = L$ nef. Suppose that, for a fixed $p > 0$, 
$ H^0 \( S \, Omega_S^p ⊗ cal(O)_S \( m L \) \) eq.not 0 $

 for arbitrarily large positive integers $m$. Then there is a pseudoeffective Cartier divisor $D$ and a strictly increasing sequence $d_j > 0$ with effective integral divisors 
$ N_j tilde.op d_j L - D . $

]
] <lem:determinant>

The generic-span construction below adapts #cite(label("LP2018")) Lemma 4.1 and #cite(label("LMPTX2023")) Lemma 5.1. We give the proof for the present unbounded positive sequence, including the numerically trivial case excluded by the numerical-nontriviality premises of those two cited lemmas, and include the saturation argument needed for the negative first-Chern-class conclusion of #cite(label("LMPTX2023")) Theorem 4.1.

#proof[
  Choose one nonzero section at each of an unbounded set of exponents. Over $bb(C) \( S \)$, trivialize $L$ rationally and let $W$ be the span of the chosen vectors. Take a basis $u_1 \, dots.h \, u_r$ of $W$ from among them. For infinitely many unbounded exponents, the corresponding vector has nonzero coefficient along one fixed $u_a$. Wedging that section with the other $r - 1$ basis sections gives a nonzero section of
  $ and.big^r Omega_S^p ⊗ cal(O)_S \( d_j L \) \, $
  where, if the fixed basis sections have exponents $a_1 \, dots.h \, a_r$, the new exponent is $d_j = m_j + sum_(i eq.not a) a_i$. The sum is fixed, so the $d_j$ are unbounded and may be taken strictly increasing. Every such wedge spans the same line $and.big^r W$.
  Let $M$ be its saturation in $and.big^r Omega_S^p$. A saturated rank-one subsheaf of a vector bundle on a smooth variety is reflexive: its double dual maps into that vector bundle by extension across codimension two, and any enlargement would give torsion in the quotient. Hence $M$ is a line bundle. Each wedge factors through $M \( d_j L \)$, since its image in the torsion-free quotient is generically zero.
  In characteristic zero, exterior powers are direct summands of tensor powers. Thus $and.big^r Omega_S^p$ is a direct summand of $\( Omega_S^1 \)^(⊗ r p)$, and $M$ remains saturated in that tensor power: the additional summand is a vector bundle, so the enlarged quotient is still torsion-free. Theorem 8 makes $D = - M$ pseudoeffective. The zero divisors of the induced nonzero sections of $M \( d_j L \)$ are the required $N_j$. ◻
]

#thm([Corollary 4.3.])[
  (Conversion of twisted differentials).  #emph[Let $S$ be smooth connected projective with smoothly semipositive $L = - K_S$. If, for one fixed $p gt.eq 0$, 
$ H^0 \( S \, Omega_S^p ⊗ cal(O)_S \( m L \) \) eq.not 0 $

 for arbitrarily large positive integers $m$, then some positive multiple of $L$ has a nonzero section.]
] <cor:conversion>

#proof[
  For $p = 0$ this is immediate. For $p > 0$, apply Lemma 9 and Theorem 2. ◻
]

== 5 Descent before conversion <sec:descent>

We now combine the two principal theorems. The geometric input describes a finite cover while retaining its residual torus action. Invariant forms on a compact factor then descend to that cover, where the ordinary conversion theorem applies.

We use the following finite-cover structure statement from #cite(label("CompanionH")) Theorem (Finite cover with compact torus monodromy). If $X$ is smooth connected projective and $- K_X$ is smoothly semipositive, there is a connected finite étale projective cover $nu : S arrow.r X$ whose universal cover is

$ tilde(S) = bb(C)^b times C times F . $

Here $C$ and $F$ are compact simply connected projective factors; $C$ is Ricci-flat, and $F$ has smoothly semipositive anticanonical bundle and no positive-degree holomorphic forms. The deck group acts by translations on $bb(C)^b$, trivially on $C$, and through a compact real torus $T$ of holomorphic isometries on $F$. The first two factors have nowhere-zero holomorphic canonical forms invariant under the deck group. Empty products are points and have unit canonical frame.

The proof of this statement in the companion starts from Yau’s prescribed-Ricci theorem and the Ricci-semipositive structure theory #cite(label("Yau1978")) #cite(label("DPS1996")) #cite(label("CDP2015")). Its finite-cover construction preserves monodromy and the invariant frames. It also proves the vanishing of holomorphic forms by the Bochner argument on irreducible non-Ricci-flat factors, independently of the rational-connectedness conclusion of the refined structure theorem. Kähler Hodge symmetry therefore gives

#[#set math.equation(numbering: n => "(5.1)")
 $ H^q \( F \, cal(O)_F \) = 0 quad \( q > 0 \) \, #h(2em) H^0 \( F \, cal(O)_F \) = bb(C) \, #h(2em) I_T \( 0 \) = 1 . $ <eq:factor-euler>]

This deduction includes a point factor.

#thm([Proposition 5.1.])[
  (Descent of invariant twisted forms).  #emph[Let $nu : S arrow.r X$, $F$, and $T$ be the finite-cover data just specified. After choosing invariant canonical frames on $bb(C)^b$ and $C$, there is, for every $r gt.eq 0$ and $0 lt.eq p lt.eq dim F$, an injective linear map 
$ H^0 \( F \, Omega_F^p ⊗ \( - K_F \)^r \)^T arrow.r H^0 \( S \, Omega_S^p ⊗ \( - K_S \)^r \) . $

 For some fixed $p$, the target is nonzero at unbounded positive integers $r$.]
] <prop:descent>

#proof[
  Let $eta$ be the product of the chosen canonical frames on $bb(C)^b$ and $C$. For an invariant form $u$ in the displayed source, pull back its differential part along the projection to $F$ and use $eta^(- r)$ for the other anticanonical factors. This gives
  $ eta^(- r) ⊗ "pr"_F^(*) u in H^0 #scale(x: 120%, y: 120%)[\(] tilde(S) \, Omega_(tilde(S))^p ⊗ K_(tilde(S))^(- r) #scale(x: 120%, y: 120%)[\)] . $
  Translations preserve the Euclidean frame, the action on $C$ is trivial, and the action on $F$ lies in $T$, with its natural induced action on both tensor factors of $u$. The tensor is therefore deck-invariant and descends holomorphically to $S$. Pullback along the projection is injective on differential forms, tensoring with $eta^(- r)$ is invertible, and local covering charts preserve nonvanishing. Hence the descent map is injective. Its holomorphic sections are algebraic because $S$ is projective.
  By (5.1) and Corollary 7, there are a fixed $p$ and invariant sections in $H^0 \( F \, Omega_F^p ⊗ \( - K_F \)^(m + 1) \)$ for unbounded positive $m$. Apply the constructed map with $r = m + 1$. If $F$ is a point, its constant section gives the same assertion with $p = 0$. ◻
]

#thm([Corollary 5.2.])[
  (Smooth anticanonical nonvanishing).  #emph[Let $X$ be a smooth connected projective complex variety. If $- K_X$ has a smooth Hermitian metric with semipositive Chern curvature, then $H^0 \( X \, - m K_X \) eq.not 0$ for some integer $m > 0$.]
] <cor:global>

#proof[
  Choose the finite cover above. Proposition 11 gives nonzero anticanonically twisted differential forms on $S$ in one fixed degree and at unbounded positive exponents. The anticanonical metric on $S$ is the smooth semipositive pullback metric. Apply Corollary 10 on $S$ to obtain a nonzero section of $- k K_S$, $k > 0$.
  The finite étale norm of a section #cite(label("CompanionH")) Lemma (Finite étale norm) sends a nonzero section of $nu^(*) A$ to a nonzero section of $A^(⊗ d)$, where $d = deg nu$; a Galois hypothesis is unnecessary. With $A = - k K_X$, the identity $K_S = nu^(*) K_X$ therefore gives a section of $- d k K_X$. For zero-dimensional connected $X$, the canonical line is trivial and the assertion is immediate. ◻
]

The ordering of the argument matters. The torus-invariant objects are the forms on $F$; they descend before any section-conversion theorem is applied. Consequently no equivariant strengthening of Theorem 2 is required, and the finite cover is never treated as a global product.


#bibliography("refs.bib", style: "ieee", title: [References])
