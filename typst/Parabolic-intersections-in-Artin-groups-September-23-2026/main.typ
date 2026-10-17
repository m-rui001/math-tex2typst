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

#align(center)[#text(size: 16pt, weight: "bold")[Parabolic Intersections in Artin Groups]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:intro>

Let $S$ be finite, and let $M = \( m_(s t) \)_(s \, t in S)$ be a symmetric Coxeter matrix. Thus $m_(s s) = 1$ and, for $s eq.not t$, $m_(s t) in { 2 \, 3 \, dots.h } union { oo }$. The associated Artin group is

$ A = A_M = ⟨sigma_s med \( s in S \) med mid(bar.v) med underbrace(sigma_s sigma_t sigma_s dots.h.c, m_(s t)) = underbrace(sigma_t sigma_s sigma_t dots.h.c, m_(s t)) quad \( m_(s t) < oo \)⟩ . $

For $X subset.eq S$, write $A_X = chevron.l sigma_s : s in X chevron.r$, with $A_diameter = { 1 }$. A #emph[parabolic subgroup] is a conjugate of some $A_X$. The rank here refers to the cardinality of the defining set; no finiteness assumption on the associated Coxeter group is understood. The Coxeter group is obtained by imposing $sigma_s^2 = 1$ for all $s$; a type, or a parabolic of that type, is called #emph[spherical] when its Coxeter group is finite.

#thm([Theorem 1.1.])[
  (Parabolic intersections).  #emph[For every Coxeter matrix $M$ on a finite set $S$, subsets $X \, Y subset.eq S$, and $g \, h in A_M$, there are $Z subset.eq S$ and $k in A_M$ such that 
$ g A_X g^(- 1) ∩ h A_Y h^(- 1) = k A_Z k^(- 1) . $

]
] <thm:main>

In particular, the result applies to arbitrary conjugates of nonspherical parabolics and to diagrams with infinite labels. The passage from pairwise intersections to arbitrary intersections and parabolic closure is established in #cite(label("MoellerParisVarghese2024")) Proposition 1.5 and Corollary 1.6. Our inside-parabolic description gives the following form, whose proof in Section 8.1 also records a finite witness bound.

#thm([Corollary 1.2.])[
  (Arbitrary intersections and parabolic closure).  #emph[For every family $cal(F)$ of parabolic subgroups of $A$, there is a subfamily $cal(F)_0 subset.eq cal(F)$ with $\| cal(F)_0 \| lt.eq \| S \|$ such that 
$ ⋂_(P in cal(F)) P = ⋂_(P in cal(F)_0) P . $

 Here the intersection of an empty family is $A$. In particular, arbitrary intersections of parabolic subgroups are parabolic, and every subset $E subset.eq A$ is contained in a unique smallest parabolic subgroup.]
] <cor:arbitrary-intersections>

Writing $"PC" \( E \)$ for this parabolic closure, the parabolic subgroups form a complete lattice: their meet is intersection and the join of a family is the parabolic closure of its union.

The same stabilizer description gives an effective membership test. Here the conjugating element and the tested element are supplied as words in the standard generators and their inverses.

#thm([Corollary 1.3.])[
  (Word and parabolic membership problems).  #emph[There is an algorithm which, given a finite Coxeter matrix $M$, a subset $X subset.eq S$, and words $u \, v$ in the standard generators of $A_M$ and their inverses, decides whether the element represented by $v$ belongs to $u A_X u^(- 1)$. In particular, the word problem is decidable for every finite-rank Artin group.]
] <cor:membership>

The proof in Section 8.3 constructs the finite algebra with exact algebraic coefficients and tests a single transported projective by Gaussian elimination.

The intersection theorem also supplies the hypothesis of a published criterion for Artin groups with a visual splitting. We state the result with the resulting trivial-intersection witness; its proof is in Section 8.1.

#thm([Corollary 1.4.])[
  (Non-clique Artin-group dynamics).  #emph[Suppose $M$ is irreducible, meaning that there is no nontrivial partition $S = S_1 union.sq S_2$ with $m_(s t) = 2$ for every $s in S_1$, $t in S_2$, and suppose $m_(s t) = oo$ for some pair. Then $A$ is acylindrically hyperbolic. Every proper parabolic subgroup $P$ has a conjugate meeting it trivially: there is $g in A$ such that $P ∩ g P g^(- 1) = { 1 }$.]
] <cor:nonclique-dynamics>

The acylindrical-hyperbolicity conclusion in this entire non-clique scope already appears in #cite(label("KatoOguni2025")) Theorem 1.2. Corollary 4 records the deduction through the parabolic-intersection criterion, not a new acylindrical-hyperbolicity class.

Theorem 1 also removes the intersection hypothesis from the fixed-point and locally compact group results of #cite(label("MoellerParisVarghese2024")); their precise consequences are stated in Section 8.2.

=== 1.1 Context and method <context-and-method>

Standard parabolic subgroups retain the Artin presentation of their submatrix: this unrestricted embedding theorem is due to van der Lek #cite(label("VanDerLek1983")), with subsequent treatments in #cite(label("Paris1997")) #cite(label("CharneyParis2014")). Charney and Paris also prove convexity of standard parabolics in the standard word metric #cite(label("CharneyParis2014")) Theorem 1.2. Blufstein and Paris prove the general nesting theorem: an ambient parabolic subgroup contained in a parabolic subgroup $Q$ is parabolic as a subgroup of $Q$ #cite(label("BlufsteinParis2023")) Theorem 1.1. The intersection problem asks whether the intersection of two arbitrary ambient parabolics is itself parabolic. It is the Parabolic Intersection Conjecture; precise formulations appear in #cite(label("Godelle2023")) Conjecture 1 and #cite(label("Cumplido2026Survey")) Section 3, Conjecture 4. Theorem 1 resolves it affirmatively.

Several approaches established this closure in substantial classes. For right-angled Artin groups, Duncan, Kazachkov and Remeslennikov proved even the arbitrary-family intersection statement #cite(label("DuncanKazachkovRemeslennikov2007")) Proposition 2.8. In spherical type, Cumplido, Gebhardt, González-Meneses and Wiest proved pairwise closure using Garside theory and parabolic closures #cite(label("CumplidoEtAl2019")) Theorem 9.5. Their argument builds on the finite-type positive-monoid structure developed by Brieskorn and Saito and by Deligne #cite(label("BrieskornSaito1972")) #cite(label("Deligne1972")). Such positive fractions are available inside spherical subgroups; they are not available as a general premise for the ambient groups considered here.

Geometric methods provide a different route. Cumplido, Martin and Vaskou obtained arbitrary intersections in large type through fixed paths in the Artin complex and stabilizer induction #cite(label("CumplidoMartinVaskou2023")) Theorem A and Theorem 11. Blufstein extended this approach to $\( 2 \, 2 \)$-free two-dimensional Artin groups #cite(label("Blufstein2022")) Theorem 1.3. Haettel proved the result for affine types $tilde(A)$ and $tilde(C)$ using geodesic bicombings #cite(label("Haettel2024")) Corollary 8.3; Cumplido, Gavazzi and Paris later gave a short alternative proof in type $tilde(A)$ #cite(label("CumplidoGavazziParis2024")) Theorem 1.

The distinction between the ambient group and the two intersected subgroups is especially important in FC type. Morris-Wright proved the result for two spherical parabolics in an FC-type group, using its CAT$\( 0 \)$ Deligne complex #cite(label("MorrisWright2021")) Theorem 3.1. Möller, Paris and Varghese showed that one spherical parabolic suffices #cite(label("MoellerParisVarghese2024")) Corollary 1.2. Antolín and Foniqi proved full pairwise closure for even FC-type groups by retractions and Bass–Serre theory #cite(label("AntolinFoniqi2022")) Theorem 1.1. The full FC-type question also appears explicitly in #cite(label("CharneyMartinMorrisWright2026")) Question 3.6. These results distinguish the closure problem for arbitrary conjugates from the embedding and nesting properties of standard subgroups.

The word problem has a parallel history. Brieskorn and Saito and Deligne solved it in spherical type through positive normal forms and the finite-type monoid structure #cite(label("BrieskornSaito1972")) Section 6, especially Theorem 6.6, #cite(label("Deligne1972")) Section 4.20. For nonspherical examples, Holt and Rees construct shortlex normal forms in large type #cite(label("HoltRees2012")) Theorem 3.2. Blasco-García, Cumplido, Holt, Morris-Wright and Rees give a quadratic-time reduction to geodesic words when the Coxeter diagram has no $A_3$ or $B_3$ subdiagram #cite(label("BlascoGarciaEtAl2026")) Theorem 1.1. Their introduction explicitly poses the general decidability question; Corollary 3 gives a uniform decision procedure with the finite Coxeter matrix as part of the input. No complexity bound is asserted here.

Our proof also reduces intersections to stabilizers and then to smaller parabolic types. The space on which we measure a stabilizer is supplied by a categorical action and a relative harmonic height. The algebraic construction belongs to the zigzag and braid-action framework of Huerfano–Khovanov and Khovanov–Seidel #cite(label("HuerfanoKhovanov2001")) #cite(label("KhovanovSeidel2002")), with fusion-labelled Artin actions as in Heng–Licata #cite(label("HengLicata2024")). The positive-factor tests are related to Brav–Thomas #cite(label("BravThomas2011")). We construct the required bimodule action and prove the layer and local rigidity statements, using finite spherical tensor categories and the standard long exact cohomology sequence as background inputs. In particular the proof does not use asphericity of a Salvetti complex.

Heng and Licata give a Gaussian-elimination algorithm for the word problem in the image of their spherical-twist action #cite(label("HengLicata2024")) Proposition 7.11, and formulate faithfulness of their original Artin-group action as Conjecture 7.10. Our relative construction instead detects standard-parabolic membership by a single framing projective. At the level of decidability, this membership problem also follows from the word problem and Charney–Paris convexity: for an input word of length $n$, test all words of length at most $n$ in the specified parabolic generators and their inverses. A supplied conjugate is handled by first conjugating the input word.

=== 1.2 From relative families to stabilizers <from-relative-families-to-stabilizers>

Fix $X subset.eq S$. Adjoin a vertex $f$ which commutes with the colors in $X$ and has braid label $3$ with the colors in $S \\ X$. Section 2 constructs a finite-dimensional graded algebra $Z$, an action $x mapsto B_x$ of $A$ on the homotopy category of bounded complexes of graded projective $Z$-modules, and a distinguished finite family of projectives $\( P_(f \, L) \)_L$. The index $L$ ranges over the simple labels of a finite semisimple tensor category. Write $E_L \( x \) = B_x P_(f \, L)$ for the transported family. For $Y subset.eq S$ put

$ H \( Y \, x \) = { a in A_Y : E_L \( a x \) tilde.eq E_L \( x \) upright(" for every ") L } \, $

where equivalence means graded chain homotopy equivalence. The two claims that drive the proof are

$ H \( S \, 1 \) = A_X \, #h(2em) H \( Y \, x \) upright(" is conjugate inside ") A_Y upright(" to a standard parabolic") . $

The first claim translates membership in $A_X$ into a condition on the initial family. Transport by $x$ then turns the intersection into

$ A_X ∩ x^(- 1) A_Y x = x^(- 1) H \( Y \, x \) x . $

The second claim therefore supplies the required parabolic type and conjugator. The difficulty is to prove that claim when $Y$ is nonspherical, without using positive fractions in $A_Y$.

We measure this family by counting its projective generators, with positive weights, separately at each color and each integer level. The level is the sum of the generator’s cochain and internal degrees. On a spherical color set these counts have a harmonic interpolation: the prescribed boundary values extend uniquely to a vector annihilated there by the Coxeter Cartan matrix. Sections 3–5 relate these numerical extensions to actual complexes and cosets. The key obstruction rules out a nonzero isolated layer whose count vector is a positive null vector. The relative frame requires this obstruction at #emph[every integer level]; connected support supplies the necessary boundary data.

The resulting height is defined on cosets $A_T z$, where $T subset.eq Y$ is spherical and $z in A_Y x$. Two vertices are joined when the types and cosets are nested. Section 6 proves that a finite path between minimum-height vertices can be lowered until it stays entirely among minima. Comparable vertices can have equal height, so this argument must also lower whole tied segments. Its conclusion is connectedness of the minimum set. In spherical type, Section 7 supplies a different reduction when some acted test has nonzero cohomology: a sequence of positive operations, each using every color, cannot have bounded height. A finite path bound for the algebra turns prolonged vanishing of tested cohomology into an empty cochain placement, contradicting the indecomposability of a transported projective.

These two reductions have complementary roles. Harmonic minima either place a stabilizer in a conjugate of smaller type or isolate a trivially acting direct factor. If the operated set itself is spherical, however, a minimum can have that whole set as its type, so harmonic containment alone need not decrease rank. The positive-height argument gives a proper-type reduction unless every test is acyclic and the entire group already fixes the family. Rank induction then closes the argument without assuming an intersection theorem at any intermediate step.

=== 1.3 Organization and conventions <organization-and-conventions>

Sections 2 and 3 construct the categorical family and its layer calculus. Section 4 proves cap geometry and the spherical two-point lemma. Section 5 proves the relative null-layer obstruction. Section 6 builds the harmonic filtration and its stabilizer containment; Section 7 supplies the spherical positive-height containment. Section 8 proves the stabilizer theorem and Theorem 1, then derives the further consequences.

All complexes are bounded and have cochain differential of degree $1$. Internal grading is separate from cochain grading; the shift $\[ 1 \]$ lowers cochain placements by one. A #emph[generator level] is the sum of its cochain and internal placements. Unless explicitly qualified as ordinary cochain degree, test heights use the sum of the two degrees. A coset $A_T z$ is a right coset. Every order on cosets below requires both inclusion of types and actual inclusion of cosets. Connectivity of such a poset always means finite-path connectivity of its undirected comparability graph.

== 2 The relative categorical family <sec:category>

We construct an action on bounded complexes of graded projectives and a family whose stabilizer will eventually be identified with $A_X$. Fusion labels realize the possibly nonintegral entries of the Coxeter form by an ordinary finite-dimensional algebra. The construction belongs to the fusion-labelled zigzag framework of Heng and Licata #cite(label("HengLicata2024")) Sections 4–5. We supply the algebraic details needed for our relative family, including braid relations as bimodule chain homotopies. This strength will allow us to act on right simple modules as well as on left projective complexes in Section 4.

=== 2.1 Classical inputs and the relative frame <classical-inputs-and-the-relative-frame>

Write $A = A_M$. For $T subset.eq S$, let $W_T$ denote the Coxeter group defined by the restricted matrix, and call $T$ #emph[spherical] if $W_T$ is finite. A positive word means a word in the generators $sigma_i$, with no inverses. Its support is the set of letters that occur; positive braid relations preserve this set.

#thm([Theorem 2.1.])[
  (Classical Artin and Coxeter inputs).  #emph[The group defined by the Artin presentation on $T subset.eq S$ embeds in $A$, with image $A_T$. No sphericity hypothesis is needed here. For a spherical $T$, the positive Artin monoid $A_T^(+)$ embeds in $A_T$, is cancellative, and has greatest common divisors on both sides. Every element of $A_T$ is both a left fraction and a right fraction of positive elements. Any two elements $a \, b in A_T$ thus have a common positive extension $p a = q b$, with $p \, q in A_T^(+)$.]
  #emph[Reduced expressions in any Coxeter system are related by braid moves. They therefore define a positive lift $iota \( w \)$ of a Coxeter element $w$. If $T$ is spherical and $w_T$ is its longest element, the left and right divisors of $Delta_T = iota \( w_T \)$ are precisely ${ iota \( w \) : w in W_T }$. In the finite geometric representation, root signs detect descents, the group acts simply transitively on chambers, and the translates of a closed fundamental chamber cover the entire dual space.]
] <cat:classical>

The embedding statement is #cite(label("VanDerLek1983")) Chapter II, Section 4, Theorem 4.13(i); see also #cite(label("CharneyParis2014")) Section 1, p. 2. For the positive monoid, cancellation, fractions, and greatest common divisors are #cite(label("BrieskornSaito1972")) Propositions 2.3, 4.2, and 5.5; Theorem 5.6 and #cite(label("Deligne1972")) Theorem 4.14; the description of the divisors of $Delta_T$ is #cite(label("BrieskornSaito1972")) Lemma 5.4 and Propositions 5.5 and 5.7. The common-extension assertion follows by writing $b a^(- 1) = q^(- 1) p$. The Coxeter assertions are #cite(label("Bourbaki2002")) Chapter IV, §1; Chapter V, §3, no. 3, and §4, nos. 4 and 6; see also #cite(label("Davis2008")) Theorems 3.4.2(ii), 4.1.6(i), and Appendix D. Throughout the proof, positive fractions, greatest common divisors, and the finite chamber covering are used only after the relevant subsystem has been shown to be spherical.

Fix $X subset.eq S$. Add a color $f$ with label $2$ to every color of $X$ and label $3$ to every color of $S \\ X$. Add one further color $o$, with label $3$ to every color of $S union.sq { f }$, and put

$ hat(S) = S union.sq { f \, o } . $

Only colors of $S$ will act. The color $f$ specifies the initial family, while $o$ is an auxiliary frame in the algebraic construction. Set $C = 2 I - b$, where $b$ is symmetric, has zero diagonal, and

$ b_(i j) = 2 cos \( pi \/ m_(i j) \) quad \( m_(i j) < oo \) \, #h(2em) b_(i j) = 2 quad \( m_(i j) = oo \) . $

Thus $b_(i f) = 0$ for $i in X$, $b_(i f) = 1$ for $i in S \\ X$, and $b_(i o) = 1$ for $i eq.not o$. Two colors are adjacent when $b_(i j) > 0$. The boundary $partial T$ of a color set consists of its exterior neighbors in $hat(S)$. All vector inequalities below are coordinatewise.

On root-coefficient vectors, the geometric reflection at $i$ is

#[#set math.equation(numbering: n => "(2.1)")
 $ s_i v = v - \( C v \)_i epsilon_i . $ <cat:reflection>]

The restriction to a color subsystem is its geometric representation. The finite-type criterion says that $T$ is spherical exactly when $C_T$ is positive definite #cite(label("Bourbaki2002")) Chapter V, §4, no. 8, Theorem 2, #cite(label("Davis2008")) Theorem 6.12.9.

#thm([Lemma 2.2.])[
  (Positive and null Cartan data).  #emph[For spherical $T$, the inverse $C_T^(- 1)$ is nonnegative, and is strictly positive in each connected block. Prescribed exterior coordinates consequently have a unique extension $p$ satisfying $\( C p \)_T = 0$. This extension is nonnegative if the prescribed coordinates are nonnegative.]
  #emph[If $G$ is nonempty and connected, $v_G > 0$, and $C_G v_G gt.eq 0$, then either $C_G$ is positive definite or $C_G v_G = 0$.]
] <cat:cartan>

#proof[
  For $C_T = 2 I - b_T > 0$, the nonnegative symmetric matrix $b_T$ has spectral radius less than $2$. Hence
  $ C_T^(- 1) = 1 / 2 sum_(n gt.eq 0) \( b_T \/ 2 \)^n \, #h(2em) p_T = C_T^(- 1) b_(T \, hat(S) \\ T) p_(hat(S) \\ T) . $
  The first formula gives nonnegativity; a path between two vertices in one connected block gives a strictly positive entry in some power, proving strict positivity there. The second formula gives the assertions about harmonic extension.
  For the final assertion, the following identity holds for every real vector $u$ on $G$:
  #[#set math.equation(numbering: n => "(2.2)")
   $ u^(sans(T)) C_G u = sum_(i < j\
i \, j in G) b_(i j) v_i v_j (u_i / v_i - u_j / v_j)^2 + sum_(i in G) frac(\( C_G v \)_i, v_i) u_i^2 . $ <cat:scaled-form>]
  If one entry of $C_G v$ is positive, vanishing of the first sum makes all ratios $u_i \/ v_i$ equal, and the corresponding term of the second sum makes that common ratio zero. The form is then positive definite. Otherwise the assumed nonnegative vector $C_G v$ is zero. ◻
]

We call this extension the #emph[harmonic interpolation on $T$]. Coordinates outside $T$ are not changed by interpolation.

=== 2.2 Labels and the finite algebra <labels-and-the-finite-algebra>

We use a finite semisimple spherical $bb(C)$-linear tensor category $cal(C)$ with positive categorical dimensions. Here is an explicit choice valid for arbitrary Coxeter labels on a finite set. For each individual finite edge of label $m gt.eq 4$, take an independent Temperley–Lieb–Jones category at circle value $2 cos \( pi \/ m \)$. Its simple objects $F_0 \, dots.h \, F_(m - 2)$ have dimensions

$ dim F_a = frac(sin \( \( a + 1 \) pi \/ m \), sin \( pi \/ m \)) > 0 \, #h(2em) F_1 ⊗ F_a tilde.equiv F_(a - 1) xor F_(a + 1) \, $

where nonexistent endpoint summands are omitted. These are the spherical semisimplifications of the planar pairing categories. For the negligible quotient, finite semisimplicity and spherical structure, see #cite(label("Chen2014")) Sections 5.1–5.4, especially Theorems 5.4.4–5.4.5 and the discussion following Definition 5.4.7; the displayed simple list and fusion rule also appear in #cite(label("HengLicata2024")) Section 4.1, Equations (10)–(11). More explicitly, the Jones–Wenzl idempotents with $a lt.eq m - 2$ have the positive dimensions displayed above, while the next idempotent has trace zero and is killed in the semisimplification. Thus the resulting category has finitely many simples, not merely finitely many specified edge objects.

Take the tensor product of these finitely many categories, or finite dimensional vector spaces if there are no such edges. For an oriented edge $\( i \, j \)$ of label $m gt.eq 4$, let $D_(i j)^1$ be $F_1$ in its factor and the unit in the other factors. This per-edge $F_1$ choice is a variation of the fusion-label choices in #cite(label("HengLicata2024")) Section 4.3, Equation (15), and Remark 4.4. On a label-$3$ edge take $D_(i j)^1 = upright(bold(1))$, and on an infinite edge take $D_(i j)^1 = upright(bold(1)) xor upright(bold(1))$. Choose opposite edge objects as pivotal duals. Then

#[#set math.equation(numbering: n => "(2.3)")
 $ dim_(cal(C)) D_(i j)^1 = b_(i j) \, #h(2em) dim_(bb(C)) "Hom"_(cal(C)) \( L \, D_(i j)^1 ⊗ H \) lt.eq 1 quad upright("on every finite edge") $ <cat:edge-labels>]

for simple $L \, H$. The dimension bound follows from the displayed fusion rule in a single factor. No such bound is required on infinite edges.

Let $"Irr" \( cal(C) \)$ be a set of simple representatives, and write

$ w_L = dim_(cal(C)) L > 0 \, #h(2em) D_0 = sum_(L in "Irr" \( cal(C) \)) w_L^2 . $

We always tensor labels on the right. No symmetry of the tensor category is used. Duality and semisimplicity give the useful identity

#[#set math.equation(numbering: n => "(2.4)")
 $ sum_L w_L \[ D ⊗ L : H \] = w_H dim_(cal(C)) D #h(2em) \( H upright(" simple") \) \, $ <cat:weighted-labels>]

because the multiplicities on the left are those of $L$ in $D^(*) ⊗ H$.

For each $i in hat(S)$ and $D in cal(C)$, introduce an additive projective symbol $P_(i \, D)$. Put $D_(i i)^0 = D_(i i)^2 = upright(bold(1))$, use the edge objects in degree one, and set all remaining $D_(i j)^a$ to zero. Define

#[#set math.equation(numbering: n => "(2.5)")
 $ "Hom"^a \( P_(i \, D) \, P_(j \, E) \) = "Hom"_(cal(C)) \( D \, D_(i j)^a ⊗ E \) . $ <cat:projective-hom>]

Degree-zero maps compose as label maps. The product of two degree-one maps is zero unless their colors backtrack; on a backtrack, compose their label maps and apply the pivotal evaluation $D_(i j)^1 ⊗ D_(j i)^1 arrow.r upright(bold(1))$. Opposite orientations use the two pivotal evaluations. All other products of positive lengths are zero. This multiplication is associative: compatibility with degree zero is functoriality, while both bracketings of three positive lengths vanish.

An #emph[unfolded vertex] is a pair $alpha = \( i \, L \)$ with $L$ simple; write $tilde(T) = T times "Irr" \( cal(C) \)$. The finite basic graded algebra $Z$ is defined by

$ e_alpha Z e_beta = "Hom" \( P_alpha \, P_beta \) $

with multiplication in path order. Thus $P_alpha = Z e_alpha$ is a left projective and $"Hom"_Z \( P_alpha \, P_beta \) = e_alpha Z e_beta$. Let $Q_alpha = e_alpha Z$ be the right projective and $U_alpha$ its simple top. For $alpha = \( i \, L \)$, write $t_alpha$ for the degree-two element corresponding to $upright("id")_L$. We call it the #emph[token]. The only path lengths are $0 \, 1 \, 2$, and lengths zero and two each have a one-dimensional space on every diagonal and vanish off the diagonal.

#thm([Lemma 2.3.])[
  (Trace and adjoint duality).  #emph[The functional 
$ tau \( t_(i \, L) \) = w_L \, #h(2em) tau \( Z^0 xor Z^1 \) = 0 $

 is a symmetric Frobenius trace of degree $- 2$. Opposite arrow spaces pair perfectly by multiplication followed by $tau$. The radical of $Z$ is $Z^(> 0)$, and the socle of every indecomposable left or right projective is its token line.]
  #emph[For a finite graded bimodule $N$, its adjoint dual satisfies 
#[#set math.equation(numbering: n => "(2.6)")
 $ N^or := "Hom"_(Z upright("-left")) \( N \, Z \) tilde.equiv D_(bb(C)) \( N \) chevron.l 2 chevron.r \, #h(2em) \( P_alpha ⊗_(bb(C)) Q_beta \)^or tilde.equiv \( P_beta ⊗_(bb(C)) Q_alpha \) chevron.l - 2 chevron.r . $ <cat:adjoint-dual>]

 This is an involutive contravariant equivalence, fixes the regular bimodule, and preserves additive radicals.]
] <cat:frobenius>

#proof[
  Units and tokens pair perfectly. For arrows, pivotal adjunction identifies a map $H arrow.r D_(j i)^1 ⊗ L$ with a map $D_(i j)^1 ⊗ H arrow.r L$. Pairing it against $L arrow.r D_(i j)^1 ⊗ H$ is a semisimple trace pairing, nondegenerate because the trace on each simple matrix block is multiplied by a nonzero dimension. The two orders of a backtrack have the same trace by the pivotal partial-trace identity. Hence $tau \( a b \) = tau \( b a \)$, with no sign from internal degree.
  The positive-length ideal is nilpotent and its quotient is the semisimple diagonal, proving the radical assertion. A token is annihilated by the radical. A nonzero arrow pairs with an opposite arrow, and a nonzero degree-zero element pairs with a token; neither can lie in the projective socle. This proves the socle assertion.
  The map $f mapsto tau compose f$ gives the first identification in (2.6). A map of degree $k$ gives a functional of degree $k - 2$, which accounts for $chevron.l 2 chevron.r$. With the bimodule convention $\( a f b \) \( n \) = f \( n a \) b$, symmetry gives
  $ tau \( f \( n a \) b \) = tau \( b f \( n a \) \) = tau \( f \( b n a \) \) \, $
  exactly the vector-dual bimodule action. The trace identifies $D_(bb(C)) \( P_alpha \) = Q_alpha chevron.l - 2 chevron.r$ and $D_(bb(C)) \( Q_beta \) = P_beta chevron.l - 2 chevron.r$. Reversing the tensor factors and then applying the shift $2$ proves the second formula. Shifted vector duality squares to the identity. Any contravariant equivalence preserves the additive radical, characterized by invertibility of $1 - g f$ for all opposite maps $g$. ◻
]

=== 2.3 Finite unfoldings <finite-unfoldings>

Let $tilde(C)$ have diagonal entries $2$ and off-diagonal entries $- dim_(bb(C)) \( e_alpha Z^1 e_beta \)$, and set

#[#set math.equation(numbering: n => "(2.7)")
 $ \( phi.alt v \)_(i \, L) = w_L v_i . $ <cat:phi>]

The arrow pairing makes $tilde(C)$ symmetric, and (2.4) gives

#[#set math.equation(numbering: n => "(2.8)")
 $ tilde(C) phi.alt = phi.alt C . $ <cat:intertwining>]

Both statements remain true on every color submatrix.

#thm([Lemma 2.4.])[
  (Finite unfolding).  #emph[For spherical $T subset.eq S$, the matrix $tilde(C)_(tilde(T))$ is positive definite and simply laced. Replacing an original reflection $s_i$ by the product of the commuting reflections in its color gives a homomorphism from $W_T$ to the resulting finite Coxeter group. Under this homomorphism, 
$ D_L \( tilde(w) \) = accent(D_L \( w \), ̃) \, #h(2em) D_R \( tilde(w) \) = accent(D_R \( w \), ̃) \, $

 where $D_L$ and $D_R$ are the left and right descent sets. Every reduced expression lifts to a reduced expression. In particular, the longest element lifts to the longest element.]
] <cat:unfolding>

#proof[
  The strictly positive vector $v = phi.alt \( C_T^(- 1) upright(bold(1)) \)$ satisfies $tilde(C)_(tilde(T)) v = phi.alt upright(bold(1)) > 0$. Applying (2.2) to each connected unfolded block proves positive definiteness on the whole unfolded space, including directions outside $phi.alt \( bb(R)^T \)$. An infinite edge cannot occur inside $T$, since its two-by-two Cartan matrix is singular. Equation (2.3) therefore makes every off-diagonal entry of $tilde(C)_(tilde(T))$ either $0$ or $- 1$. The finite Coxeter criterion applies to this simply laced matrix.
  There are no arrows between distinct vertices of one color. The corresponding reflections commute, and their product acts on the folded space as $s_i$, by (2.8). Choose $p$ with $C_T p > 0$. Then $phi.alt p$ is strictly inside a full unfolded fundamental chamber. For an arbitrary word representing $w$, let $g$ be its lifted product; then $g phi.alt p = phi.alt \( w p \)$. A root has coefficients either all nonnegative or all nonpositive in the simple-root basis, so pairing it with a chamber-interior point detects its sign. The row at $\( i \, L \)$ of $tilde(C) phi.alt \( w p \)$ is $w_L \( C w p \)_i$. These row signs are the signs of the pairings with $g^(- 1) epsilon.alt_(\( i \, L \))$ and $w^(- 1) epsilon.alt_i$, respectively. Consequently the unfolded left descents are exactly all vertices over the original left descents. Applying the same reasoning to inverse words proves the right-descent assertion.
  A word representing the identity fixes $phi.alt p$. The stabilizer of a chamber-interior point in a finite Coxeter group is trivial, so its lift is the identity. Thus the lifted product depends only on $w$. If an original reduced expression is extended by an ascent, every vertex of the added color is an ascent of the lifted prefix. Acting at one of those vertices does not change the signs at the others because they are mutually orthogonal. The whole block is therefore a sequence of ascents. Induction proves reducedness of the lift. The longest original element has every simple descent; its lift has every unfolded simple descent, so is the longest unfolded element. ◻
]

=== 2.4 Twists as bimodule homotopies <twists-as-bimodule-homotopies>

The evaluation and coevaluation complexes below adapt the zigzag bimodule twists of #cite(label("KhovanovSeidel2002")) Proposition 2.4 and Theorem 2.5 and #cite(label("HuerfanoKhovanov2001")) Section 4.6, Proposition 7; compare also #cite(label("HengLicata2024")) Definition 5.2 and Proposition 5.3. We keep the full bimodule homotopies, because later tensor products will involve nonprojective right simples.

All complexes are bounded cochain complexes of finite internally graded modules. The differential has cochain degree $1$ and internal degree $0$. The shift $chevron.l a chevron.r$ raises internal placements by $a$, while $\[ 1 \]$ lowers cochain placements by $1$. Only cochain degrees contribute signs to tensor products and Hom complexes.

Set $M_alpha = P_alpha ⊗_(bb(C)) Q_alpha$, with multiplication $mu_alpha : M_alpha arrow.r Z$. Choose homogeneous dual bases $p_a in P_alpha$, $q_a in Q_alpha$ for the trace pairing, so $tau \( q_a p_b \) = delta_(a b)$. The element $sum_a p_a ⊗ q_a$ is central and has internal degree $2$: centrality is the invariance of the perfect pairing under the two $Z$ actions. It defines a bimodule map $delta_alpha : Z arrow.r M_alpha chevron.l - 2 chevron.r$. Put

#[#set math.equation(numbering: n => "(2.9)")
 $ B_alpha = \[ M_alpha arrow.r^(mu_alpha) Z \] \, #h(2em) D_alpha = \[ Z arrow.r^(delta_alpha) M_alpha chevron.l - 2 chevron.r \] \, $ <cat:elementary-twists>]

with $Z$ in cochain degree zero. Thus the projective terms lie in cochain degrees $- 1$ and $1$, respectively.

#thm([Proposition 2.5.])[
  (The categorical action).  #emph[There are bimodule chain homotopy equivalences $B_alpha D_alpha tilde.eq Z tilde.eq D_alpha B_alpha$. For a color $i in S$, define 
$ B_i = product_(alpha in accent({ i }, ̃)) B_alpha \, #h(2em) D_i = product_(alpha in accent({ i }, ̃)) D_alpha . $

 These products are independent of their order up to bimodule homotopy, are mutually inverse, and satisfy all the defining Artin relations. They define an action of $A$ by invertible graded bimodule homotopy classes, denoted $B_x$ for $x in A$. In particular, 
#[#set math.equation(numbering: n => "(2.10)")
 $ F_i \( E \) := B_i ⊗_Z E = "Cone" (xor.big_(alpha in accent({ i }, ̃)) P_alpha ⊗_(bb(C)) e_alpha E arrow.r E) . $ <cat:color-evaluation>]

 Every $B_x$ preserves bounded projective complexes and preserves the cohomology of their bigraded Hom complexes. Its adjoint dual $B_x^or$ represents its inverse. All the action identities are actual bimodule chain homotopy equivalences and remain valid after tensoring with any finite module complex, whether or not projective.]
  #emph[For $H in cal(C)$, right tensoring of labels defines an additive functor 
$ T_H \( P_(i \, D) \) = P_(i \, D ⊗ H) $

 on graded projectives. It preserves path lengths, extends to bounded homotopy categories, and commutes naturally up to homotopy with $B_x ⊗_Z -$ for every $x in A$.]
] <cat:action>

#proof[
  We first verify the inverse explicitly. The product $B_alpha D_alpha$ has $M_alpha$ in degree $- 1$,
  $ Z xor P_alpha ⊗_(bb(C)) \( e_alpha Z e_alpha \) ⊗_(bb(C)) Q_alpha chevron.l - 2 chevron.r $
  in degree zero, and $M_alpha chevron.l - 2 chevron.r$ in degree $1$. Write $theta_alpha = t_alpha \/ w_L$ when $alpha = \( i \, L \)$, so that $tau \( theta_alpha \) = 1$. Split the middle factor into its unit and $theta_alpha$ lines. The incoming differential onto the token summand is an isomorphism, up to the tensor sign: its coefficient is the dual-basis identity
  $ sum_a tau \( q p_a \) q_a = q . $
  The token has degree $2$, so this summand is unshifted $M_alpha$. Cancel that isomorphism. The remaining unit summand maps identically onto $M_alpha chevron.l - 2 chevron.r$ by multiplication with $e_alpha$; cancel it as well. Only the regular bimodule $Z$ remains. In the opposite product $D_alpha B_alpha$, the dual-basis identity gives the same incoming cancellation, followed by the unit cancellation. These cancellations take place in bimodule complexes, not just after evaluating on projectives.
  We next prove the elementary braid relation using the twist-conjugation argument of #cite(label("SeidelThomas2001")) Lemma 2.11 and Propositions 2.12–2.13. For a bounded perfect left complex $P$, let its evaluation twist be the bimodule cone
  $ T_P = "Cone" #scale(x: 120%, y: 120%)[\(] P ⊗_(bb(C)) "Hom"_Z \( P \, Z \) arrow.r Z #scale(x: 120%, y: 120%)[\)] . $
  It is unchanged by an internal or cochain shift of $P$. A homotopy equivalence of $P$ identifies its evaluation map, and hence its cone, up to homotopy. If $B$ is a product of the elementary invertible complexes, each of its terms is projective on both sides. Tensor–Hom adjunction identifies its tensor adjoint with $B^or = "Hom"_Z \( B \, Z \)$; the evaluation and coevaluation identities hold at chain level. Since $B$ is invertible, this adjoint is its inverse in the bimodule homotopy category. Lemma 7 keeps its terms in the same class. Tensor–Hom and evaluation now give
  #[#set math.equation(numbering: n => "(2.11)")
   $ B T_P B^(- 1) tilde.eq T_(B P) . $ <cat:twist-conjugation>]
  If distinct vertices $alpha \, beta$ have no arrows between them, $M_alpha M_beta = M_beta M_alpha = 0$, so both $B_alpha B_beta$ and $B_beta B_alpha$ are the simultaneous evaluation cone with projective term $M_alpha xor M_beta$. If there is exactly one arrow in each direction, the complexes
  $ B_alpha P_beta = \[ P_alpha chevron.l 1 chevron.r arrow.r P_beta \] \, #h(2em) D_beta P_alpha = \[ P_alpha arrow.r P_beta chevron.l - 1 chevron.r \] $
  have degrees $\( - 1 \, 0 \)$ and $\( 0 \, 1 \)$. Both maps are nonzero by the perfect backtrack pairing, and their common arrow space is one-dimensional. Rescaling one term gives
  $ B_alpha P_beta tilde.eq \( D_beta P_alpha \) chevron.l 1 chevron.r \[ 1 \] . $
  Using $T_(P_gamma) = B_gamma$ in (2.11) therefore gives $B_alpha B_beta D_alpha tilde.eq D_beta B_alpha B_beta$. Multiplication on the left by $B_beta$ and on the right by $B_alpha$ proves
  $ B_alpha B_beta B_alpha tilde.eq B_beta B_alpha B_beta . $
  Vertices within one color are orthogonal. Their twists commute, their inverse products are the $D_i$, and all mixed terms in the expansion vanish. This proves the simultaneous cone (2.10). For $m_(i j) < oo$, the two alternating color words of length $m_(i j)$ are reduced expressions for the longest element of the spherical rank-two subsystem. Lemma 8 lifts both to reduced expressions for the same longest unfolded element. Matsumoto’s Theorem relates them by commutations and three-term braid moves, which we have just proved as bimodule homotopies. For $m_(i j) = oo$ there is no relation to impose. This proves the action for arbitrary labels.
  It remains to verify the natural commutation with labels. On (2.5), $T_H$ tensors the label map on the right by $upright("id")_H$. Evaluation of an edge and its dual always occurs to the left of the label, so composition and path length are preserved. On $P_(j \, D)$, the evaluation term for color $i$ has the canonical semisimple description
  $ xor.big_(a \, L) P_(i \, L) chevron.l a chevron.r ⊗_(bb(C)) "Hom"_(cal(C)) \( L \, D_(i j)^a ⊗ D \) tilde.equiv xor.big_a P_(i \, D_(i j)^a ⊗ D) chevron.l a chevron.r . $
  Its evaluation is the tautological label map. Tensoring by $H$ replaces $D$ by $D ⊗ H$ in this description, naturally in $D$ and in every projective morphism. Thus $T_H$ commutes with the positive evaluation cone. Composing this natural identification with the inverse equivalence on both sides proves the inverse commutation without requiring $T_H$ to be invertible.
  Invertible functors preserve all morphism spaces, including both shifts, and hence preserve bigraded Hom cohomology between projective complexes. Finally, tensoring an explicit chain homotopy with any module complex preserves its defining equations with the usual cochain signs. No flatness assertion about the additional module complex is needed. ◻
]

=== 2.5 The transported family and folded counts <the-transported-family-and-folded-counts>

For $x in A$ and a simple label $L$, define

#[#set math.equation(numbering: n => "(2.12)")
 $ E_L \( x \) = B_x P_(f \, L) . $ <cat:family-definition>]

The forthcoming layer construction is summarized here to specify the data used throughout the proof. A minimal projective complex has no path-length-zero entries in its differential. A generator in cochain placement $p$ and internal placement $a$ has #emph[level] $p + a$. A length-$j$ differential entry changes level by $1 - j$. The pure layer $Y^d \( E \)$ takes the generators of level $d$ and the length-one differential. Lemma 11 proves the existence and uniqueness of minimal models and the functorial layer and truncation properties used below. Dimensions of pure layers always count their projective generators, not the dimensions of the underlying $Z$-modules.

#thm([Proposition 2.6.])[
  (Relative-family properties).  #emph[There are nonnegative folded vectors $m^d \( x \)$ characterized by 
#[#set math.equation(numbering: n => "(2.13)")
 $ phi.alt m^d \( x \) = sum_L w_L dim Y^d \( E_L \( x \) \) . $ <cat:folded-counts>]

 They have finite level support. Each individual coordinate ranges over a locally finite subset of $bb(R)_(gt.eq 0)$. Weighted counts of tops and socles of the layers are likewise proportional within a color: a nonzero top or socle in that color occurs at every unfolded vertex of the color in some member of the family. The same proportionality holds for families of subobjects obtained functorially by twists and layer truncations.]
  #emph[If only colors of $T subset.eq S$ act, all generator spaces with their cochain and internal placements outside $tilde(T)$ stay unchanged up to isomorphism. In particular, each $E_L \( x \)$ has exactly its original $f$-generator in placements $\( 0 \, 0 \)$, and 
$ m_f^0 \( x \) = 1 \, #h(2em) m_f^d \( x \) = 0 quad \( d eq.not 0 \) . $

 Every $E_L \( x \)$ is indecomposable in the graded homotopy category. The color support of its minimal complex is connected and contains $f$.]
] <cat:family>

#proof[
  Proposition 9 gives $E_L \( x \) tilde.eq T_L \( E_(upright(bold(1))) \( x \) \)$. Tensoring labels preserves the positive path length of a minimal differential, and therefore preserves minimality. If a multiplicity object $D$ occurs at a fixed color and pair of placements in the unit-label complex, its contribution in the $L$-member is $D ⊗ L$. For each target simple $H$, Equation (2.4) says that the weighted multiplicity is $w_H dim_(cal(C)) D$. Summing over placements of one level proves (2.13).
  Lemma 17 proves that label tensoring commutes with layers, truncations, and the top and socle tests. Its proof uses the exactness of tensoring in the semisimple category, together with (2.5) and (2.4). It gives the stated proportionality for functorially constructed subobjects and for tops and socles. Positivity of all label weights then proves the assertion about occurrence at every vertex of a color.
  There are finitely many labels and finitely many terms in each complex. To see local finiteness, fix one target label $H$. For a bound $R$, Equation (2.13) expresses $w_H m_i^d lt.eq w_H R$ as a nonnegative integer combination of the finitely many fixed positive numbers $w_L$. Each coefficient is bounded separately. There are thus only finitely many possible values below $R$.
  For an unfolded vertex $beta$ outside color $i$, $U_beta e_alpha = 0$ for every $alpha$ in that color. The explicit complexes (2.9) consequently give $U_beta B_i = U_beta = U_beta D_i$. Tensoring a minimal left complex with $U_beta$ kills its radical differential, leaving exactly its generator spaces at $beta$ in their two placements. This proves exterior invariance, and in particular the statement about the $f$-generator and its folded counts.
  The initial projective $P_(f \, L)$ is indecomposable, and an equivalence preserves indecomposability, proving the first final assertion. A disconnected color support would split its minimal complex into the summands on different components: a differential uses only arrows, which join adjacent colors, and tokens, which stay at one color. Every nonzero minimal summand is noncontractible, since reducing a putative contracting homotopy equation modulo the radical would give an identity equal to zero. Such a splitting contradicts indecomposability. Exterior invariance ensures that $f$ belongs to the support. ◻
]

== 3 Layers and positive divisors <sec:layers>

We develop the layer calculus needed to compare representatives of a parabolic coset. The underlying linear heart and twist calculations are related to #cite(label("HengLicata2024")) Sections 5 and 6.1. We prove the statements used here, with particular attention to the degree conventions and to the arbitrary inputs allowed in the cohomological divisor test. None of the results in this section requires the initial projective to be attached to every operated color.

=== 3.1 The linear heart <the-linear-heart>

Work in the homotopy category of bounded complexes of finite graded left projective $Z$-modules. A differential has cochain degree $1$ and internal degree $0$. The shift $chevron.l u chevron.r$ raises internal degrees by $u$, and $\[ 1 \]$ lowers cochain placements by one. A generator of $P_alpha chevron.l u chevron.r$ in cochain placement $c$ has #emph[level]

#[#set math.equation(numbering: n => "(3.1)")
 $ d = c + u . $ <lay:level>]

Throughout, generator dimensions mean multiplicities of projective summands, not dimensions of those projectives as vector spaces.

A complex is #emph[minimal] if its differential entries belong to the graded radical. Gaussian elimination removes an invertible entry between shifted indecomposable projectives by splitting off a contractible two-term complex. Since the number of summands is finite, this produces a minimal model. A homotopy equivalence between minimal models is an isomorphism modulo the radical in every cochain degree: the homotopy terms in its composites with a homotopy inverse contain a radical differential. Consequently its term maps are invertible. Thus a minimal model is unique up to chain isomorphism, in particular with uniquely determined generator multiplicities and placements.

In a minimal model the differential has only path lengths $1$ and $2$. An entry of length $a$ changes generator placements by $\( 1 \, - a \)$, hence changes the level by $1 - a$. The linear differential preserves level, and the token differential lowers it by one. Define $Y^d \( E \)$ to be the generators of level $d$ with their linear differential. The path-length $2$ part of the equation $partial^2 = 0$ says that this is a complex.

For clarity, its coefficient description has spaces

$ V_(alpha \, c)^d \( E \) \, #h(2em) P_alpha chevron.l d - c chevron.r ⊗ V_(alpha \, c)^d \( E \) upright(" in cochain placement ") c . $

Each arrow entry gives a coefficient map from $V_(alpha \, c)^d \( E \)$ to $V_(beta \, c + 1)^d \( E \)$. At each vertex these maps satisfy the backtrack relation obtained from the opposite-arrow pairing in $Z^2$; all other products of two arrows in $Z$ vanish. We call such a finite graded array a #emph[coefficient representation]. Its arrow maps raise cochain placement and are therefore jointly nilpotent. Its top and socle at $alpha$ are, respectively,

$ "top"_alpha M = frac(xor.big_c V_(alpha \, c) \( M \), upright("images of incoming coefficient maps")) \, #h(2em) "soc"_alpha M = ⋂ ker \( upright("outgoing coefficient maps") \) \, $

with the inherited placements. Write $dim M$ for the vector of generator multiplicities summed over placements.

#thm([Lemma 3.1.])[
  (Layer structure).  #emph[The full subcategories defined by minimal generator levels at most $0$ and at least $0$ form a bounded $t$-structure. The truncation $tau_(lt.eq k) E$ is the subcomplex of levels at most $k$, and the complementary quotient is $tau_(gt.eq k + 1) E$.]
  #emph[The heart is the abelian category of finite graded coefficient representations. In particular, subobjects of a pure layer are exactly its graded subrepresentations. Its unshifted cohomology layer at $d$ is $Y^d \( E \)$.]
] <lay:structure>

#proof[
  Differentials do not raise level, so the indicated low terms form a subcomplex. A degree-zero map from a generator of level $d$ to one of level $e$ requires a path of length $d - e$. There are no such maps from levels at most $0$ to levels at least $1$. This proves the required orthogonality. The cochain shift $\[ 1 \]$ lowers levels by one, giving the shift-closure axioms, and the short exact sequence of low subcomplex, full complex and high quotient gives the truncation triangle. Finitely many occupied levels give boundedness.
  A degree-zero map between pure complexes at the same level has only length-zero entries. It is precisely a map of graded coefficient representations. A homotopy between two such maps would require path length $- 1$, so there are no homotopies to quotient out. Conversely a finite coefficient representation gives a pure complex, since its backtrack relations say exactly that the differential squares to zero. Kernels and cokernels, formed in each coefficient space, retain the relations. This identifies the heart, its subobjects and its cohomology layers. ◻
]

We use the long exact cohomology sequence associated with a distinguished triangle in a $t$-structure #cite(label("BBD1982")) Section 1.3, Theorem 1.3.6. Denote its heart-valued cohomology by $H_(upright("lay"))^d$; with our conventions,

$ H_(upright("lay"))^d \( E \) = Y^d \( E \) \[ d \] \, #h(2em) H_(upright("lay"))^d \( E \[ 1 \] \) = H_(upright("lay"))^(d + 1) \( E \) . $

An exact functor has #emph[layer amplitude] $\[ a \, b \]$ if it sends a pure layer at $d$ into levels $\[ d + a \, d + b \]$. Bounded truncation then gives the corresponding bounds on any interval of input levels.

#thm([Lemma 3.2.])[
  (Adjacent layers).  #emph[For an exact functor $F$ of layer amplitude $\[ 0 \, 1 \]$ there is a short exact sequence of pure level-$d$ objects 
#[#set math.equation(numbering: n => "(3.2)")
 $ 0 arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^(d - 1) \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r Y^d \( F E \) arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^d \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $ <lay:adjacent-positive>]

 For amplitude $\[ - 1 \, 0 \]$ the corresponding sequence is 
#[#set math.equation(numbering: n => "(3.3)")
 $ 0 arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^d \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r Y^d \( F E \) arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^(d + 1) \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $ <lay:adjacent-negative>]

 All terms are shifted by $\[ d \]$ to regard these as sequences in the heart. In particular, generator dimensions are additive.]
] <lay:adjacent>

#proof[
  In the positive case apply $F$ to the triangle
  $ tau_(lt.eq d - 1) E arrow.r tau_(lt.eq d) E arrow.r Y^d \( E \) . $
  The first term after applying $F$ has levels at most $d$; the last has levels $d \, d + 1$. Hence the flanking groups $H_(upright("lay"))^(d - 1) F \( Y^d \( E \) \)$ and $H_(upright("lay"))^(d + 1) F \( tau_(lt.eq d - 1) E \)$ vanish, giving a short exact sequence at $d$. Input levels at most $d - 2$ contribute nothing there, identifying the left term in (3.2); input levels at least $d + 1$ contribute nothing there, identifying its middle term. For the negative case apply the same argument to $tau_(lt.eq d) E arrow.r tau_(lt.eq d + 1) E arrow.r Y^(d + 1) \( E \)$. After $F$, its first term has levels at most $d$ and its last has levels $d \, d + 1$. Discarding input levels below $d$ and above $d + 1$ gives (3.3). ◻
]

#thm([Lemma 3.3.])[
  (Composition at the bottom).  #emph[Let $F_1 \, dots.h \, F_r$ be exact functors with no negative change of level. On input pure at $d$, the level-$d$ part of $F_r dots.h.c F_1$ is obtained by retaining only level $d$ after every operation. Relations between these composite functors induce the same relations between their bottom-layer operations.]
] <lay:bottom>

#proof[
  After the first operation the quotient by the level-$d$ truncation has levels at least $d + 1$. All subsequent operations preserve that bound. Its long exact layer sequence shows that discarding this quotient does not change the final level $d$. Repeat after each operation. ◻
]

=== 3.2 Extremal tests and single twists <extremal-tests-and-single-twists>

For a bigraded vector complex $V$, write $H^t \( V \)$ for the direct sum of its cohomology spaces with cochain degree plus internal degree equal to $t$. This #emph[total test degree] is distinct from the cochain degree alone. Differentials raise total degree by one; only cochain degrees determine their signs.

#thm([Lemma 3.4.])[
  (Extremal tests).  #emph[If $M$ is pure at level $d$, then 
#[#set math.equation(numbering: n => "(3.4)")
 $ H^d \( e_alpha M \) tilde.equiv "soc"_alpha M \, #h(2em) H^(d + 2) \( e_alpha M \) tilde.equiv \( "top"_alpha M \) chevron.l 2 chevron.r . $ <lay:extremal-formula>]

 The second shift records the token’s internal placement. More generally, if a minimal complex $E$ has no generators above $d$ at $alpha$ or its neighbors, its degree-$\( d + 2 \)$ test is the top of $Y^d \( E \)$ at $alpha$, shifted internally by $2$, and all higher test cohomology there vanishes. If there are no generators below $d$ at those vertices, its degree-$d$ test is the socle of $Y^d \( E \)$ there.]
  #emph[A nonzero pure layer supported on a vertex set has a nonzero top and a nonzero socle somewhere in that set. The same assertions hold for right projective complexes, tested by $M e_alpha$.]
] <lay:extremal>

#proof[
  The test of a pure layer has path lengths $0 \, 1 \, 2$, in total degrees $d \, d + 1 \, d + 2$. Its length-zero cycles are the common kernels of the outgoing coefficient maps. At the token end, the images of the incoming differential are exactly the incoming coefficient images, by the perfect opposite-arrow pairings. This proves (3.4).
  Every term of $e_alpha E$ comes from a generator at $alpha$ or a neighbor, and its total degree is the generator level plus the path length. Under the upper bound, only level-$d$ tokens can occur at $d + 2$. A token differential into them from length zero would require a generator at level $d + 1$, which is absent. The remaining boundaries are the same incoming linear images. The lower statement follows from the length-zero end in the same way. Finally, coefficient arrows strictly raise cochain placement in a finite array. A nonzero array therefore cannot have zero socle everywhere, or be generated by its incoming images everywhere. Reversing module sides proves the right statements. ◻
]

Let $F_i = B_(sigma_i) \( - \)$ be the color twist of Proposition 9. Denote by $r_i$ the product of the commuting coordinate reflections in its unfolded fiber. Thus, on folded vectors,

$ r_i phi.alt \( v \) = phi.alt #scale(x: 120%, y: 120%)[\(] v - \( C v \)_i epsilon_i #scale(x: 120%, y: 120%)[\)] . $

#thm([Lemma 3.5.])[
  (Positive layers).  #emph[Each $F_i$ has layer amplitude $\[ 0 \, 1 \]$. For a pure input $M$ at $d$, its upper layer is supported on color $i$, has zero linear differential, and has multiplicity $dim "top"_alpha M$ at each $alpha$ of that color. Its bottom layer has unchanged multiplicities at all other vertices, and 
#[#set math.equation(numbering: n => "(3.5)")
 $ dim Y^d \( F_i M \)_alpha = sum_beta \( 2 I - tilde(C) \)_(alpha beta) dim M_beta - dim M_alpha + dim "top"_alpha M quad \( alpha upright(" of color ") i \) . $ <lay:positive-count>]

 The bottom layer has zero socle in color $i$. If $i in J$ and $M$ has zero socle on every color of $J$, its bottom layer after $F_i$ has zero socle on all of $J$.]
  #emph[For any bounded complex $E$ of graded left modules, with no projectivity requirement on its terms, 
#[#set math.equation(numbering: n => "(3.6)")
 $ e_alpha F_i E tilde.eq \( e_alpha E \) chevron.l 2 chevron.r \[ 1 \] quad \( alpha upright(" of color ") i \) . $ <lay:positive-shift>]

 There is an identical homotopy equivalence for right actions and right tests. Thus an acted test shifts up one in total degree and down one in cochain degree.]
] <lay:positive>

#proof[
  For pure input at $d$, the evaluation cone inserts generators in the acted color at levels $d + a - 1$, where $a = 0 \, 1 \, 2$ is the path length. The length-zero insertions at $d - 1$ map by identities, modulo the radical, to the old generators in that color. Cancelling those pairs removes every generator below $d$. No generator was inserted above $d + 1$, and only the acted color can occur above $d$.
  For one vertex $alpha$ of color $i$, put $A = e_alpha E$. Distinct vertices of that color are orthogonal, so the acted test is
  #[#set math.equation(numbering: n => "(3.7)")
   $ "Cone" #scale(x: 120%, y: 120%)[\(] A xor A chevron.l 2 chevron.r arrow.r^(\( upright("id") \, theta_alpha \)) A #scale(x: 120%, y: 120%)[\)] . $ <lay:token-cone>]
  Projection to the token source $A chevron.l 2 chevron.r \[ 1 \]$ is a chain map with contractible kernel $"Cone" \( upright("id")_A \)$, proving (3.6). This is a homotopy calculation for any $A$, so it neither assumes projectivity nor merely asserts a quasi-isomorphism. The right calculation uses the same cone.
  For pure input, the degree-$\( d + 3 \)$ output test equals the old degree-$\( d + 2 \)$ test. Lemma 14 identifies the latter with the old top. Since the upper layer is supported on a color with no internal arrows, the former counts its generators. This proves the upper-layer assertion.
  For the multiplicity formula, count generators with sign $\( - 1 \)^d$. The signed contributions of a cancelled scalar pair sum to zero, because its levels are consecutive. In the evaluation cone the inserted signed contribution from a generator at $beta$ to an acted vertex $alpha$ is minus the alternating path count
  $ 2 delta_(alpha beta) - \( 2 I - tilde(C) \)_(alpha beta) . $
  Consequently the total signed vector transforms by $r_i$. On pure input the bottom vector minus the upper vector is therefore $r_i dim M$, proving (3.5). The same calculation also shows, for general inputs, that
  #[#set math.equation(numbering: n => "(3.8)")
   $ sum_d \( - 1 \)^d dim Y^d \( F_i E \) = r_i sum_d \( - 1 \)^d dim Y^d \( E \) . $ <lay:signed-reflection>]
  By (3.6), the degree-$d$ test at an acted vertex is zero. Lemma 14 identifies it with the socle of the bottom layer. At another vertex $beta$, the first term in the tested evaluation triangle is a sum of $\( e_alpha M \) chevron.l 1 chevron.r$, over adjacent acted vertices. It has no degree-$d$ cohomology, and its degree-$\( d + 1 \)$ cohomology is the sum of the old socles at those vertices. If these socles and the old socle at $beta$ vanish, the long exact sequence gives zero degree-$d$ cohomology after the move. This proves preservation of socle vanishing on $J$. ◻
]

In particular, Lemma 12 says that the new layer at $d$ under $F_i$ is just its bottom operation on $Y^d \( E \)$ whenever the old top at color $i$ in level $d - 1$ vanishes. By Lemma 13 and the braid relations, the bottom operations of positive twists themselves satisfy the positive braid relations.

#thm([Lemma 3.6.])[
  (Inverse amplitude and exterior invariance).  #emph[An exact equivalence of layer amplitude $\[ 0 \, 1 \]$ has inverse amplitude $\[ - 1 \, 0 \]$. In particular $F_i^(- 1)$ has that amplitude, and 
#[#set math.equation(numbering: n => "(3.9)")
 $ e_alpha F_i^(- 1) E tilde.eq \( e_alpha E \) chevron.l - 2 chevron.r \[ - 1 \] quad \( alpha upright(" of color ") i \) . $ <lay:negative-shift>]

 This test identity is valid for arbitrary bounded module complexes and also on the right. For either sign, acting in color $i$ leaves the minimal generator spaces at other colors unchanged up to isomorphism, with both placements retained. Formula (3.8) also holds for $F_i^(- 1)$.]
] <lay:inverse>

#proof[
  Let $F$ be the equivalence and let $N$ lie in the heart. For any $A$ in levels at most $- 2$, its image $F A$ has levels at most $- 1$, so
  $ "Hom" \( A \, F^(- 1) N \) = "Hom" \( F A \, N \) = 0 . $
  The orthogonal characterization of the $t$-structure implies that $F^(- 1) N$ has levels at least $- 1$. If $B$ has levels at least $1$, then so does $F B$, and
  $ "Hom" \( F^(- 1) N \, B \) = "Hom" \( N \, F B \) = 0 . $
  Hence $F^(- 1) N$ has levels at most $0$. Shifting proves the amplitude bound on every pure input. Applying (3.6) to $F_i^(- 1) E$ and using the bimodule homotopy inverse proves (3.9), including for nonprojective inputs and for right complexes. Applying (3.8) and $r_i^2 = 1$ proves the inverse reflection formula.
  For a vertex $beta$ outside color $i$, the right simple satisfies
  $ U_beta B_(sigma_i)^(plus.minus 1) tilde.eq U_beta . $
  Indeed the inserted projective bimodule terms have left vertex in color $i$ and are annihilated by $U_beta$. Tensoring a minimal left projective complex with $U_beta$ kills its radical differential and records precisely the generators at $beta$ with both placements. The displayed equivalence proves the exterior assertion. ◻
]

All assertions about projective layers have their right-handed versions, obtained by using the opposite algebra. In particular the inverse layer-amplitude statement does not assert a projective-layer description for a nonprojective input; for such an input the test identities (3.6) and (3.9) still hold. The normalized layers containing a residual right simple will be treated separately in Section 4.

#thm([Lemma 3.7.])[
  (Compatibility with labels).  #emph[Layer truncations commute with the exact label functors $T_H$. For the family $E_L \( x \)$ of Proposition 10, the weighted generator, top and socle dimensions in each layer are proportional on every color fiber. In particular, a top or socle occurring in one member at a vertex of color $i$ occurs at every vertex of color $i$ in some member of the family. The same proportionality holds for families constructed from this one by twists and layer truncations.]
] <lay:labels>

#proof[
  Tensoring a projective label by $H$ preserves its cochain and internal placements. It preserves radical path lengths, hence commutes with the low-level subcomplex and the high-level quotient. On coefficient representations it is exact, since the label category is semisimple. At a fixed color and placements, the coefficient spaces, tests and their cohomology are obtained by applying $"Hom"_(cal(C)) \( K \, - \)$ to the corresponding label objects. Exact label tensoring also tensors these objects and their cohomology. The weighted multiplicity identity
  $ sum_L w_L \[ D ⊗ L : K \] = w_K dim_(cal(C)) D $
  therefore gives proportionality for generators and for the extremal tests, hence for tops and socles by Lemma 14. All weights are positive, proving the occurrence assertion. Twists and truncations commute with label tensoring, so the argument applies to the constructed families as well. ◻
]

=== 3.3 The highest-test divisor <the-highest-test-divisor>

We next recover a positive divisor from a highest cohomological test. This is the mechanism used by Brav and Thomas to detect finite-type Garside factors #cite(label("BravThomas2011")) Proposition 3.1 and Lemma 3.3. Here we prove the version for arbitrary bounded test inputs; right simple modules in Section 4 will require precisely that generality.

Fix a spherical color set $J$. By Lemma 8, its unfolded graph is finite simply laced. In the next two lemmas the letters are individual unfolded vertices; $B_alpha$ denotes their single-vertex evaluation twist. For an input $E$ define

#[#set math.equation(numbering: n => "(3.10)")
 $ h_J \( E \) = max { t : H^t \( e_alpha E \) eq.not 0 upright(" for some ") alpha in tilde(J) } \, $ <lay:test-height>]

with value $- oo$ when all these tests vanish. For right inputs use $E e_alpha$. The following arguments require only bounded test cohomology and the indicated action, not projective terms. They apply in particular to bounded complexes containing right simples.

#thm([Lemma 3.8.])[
  (Change of test height).  #emph[If $h_J \( E \)$ is finite, then 
$ h_J \( E \) lt.eq h_J \( B_alpha E \) lt.eq h_J \( E \) + 1 . $

 Height increases exactly when $alpha$ was a highest-test vertex; in that case it is the only new highest-test vertex. Vanishing of all tests on $tilde(J)$ persists. The same statements hold for right actions. Consequently height is nondecreasing under positive color words in $J$.]
] <lay:height-change>

#proof[
  The acted test shifts up by one in total degree, and nonneighboring tests are unchanged. At a neighboring vertex $beta$ the evaluation triangle is
  #[#set math.equation(numbering: n => "(3.11)")
   $ \( e_alpha E \) chevron.l 1 chevron.r arrow.r e_beta E arrow.r e_beta B_alpha E . $ <lay:neighbor-triangle>]
  If the old maximum is $t$, the last term has no test cohomology above $t$. Thus precisely the asserted condition produces height $t + 1$, and only at $alpha$. If the old test at $alpha$ has maximum $t - 1$, its shifted test reaches $t$. If it has maximum below $t - 1$, an old degree-$t$ test elsewhere survives: in (3.11) the map into that degree has zero source. This proves monotonicity. The same triangles preserve total vanishing. Reversing sides proves the right case; a color twist is a product of the commuting unfolded twists in its fiber. ◻
]

#thm([Lemma 3.9.])[
  (Top-divisor test).  #emph[Let $b$ be a positive word in the unfolded finite-type generators. If $h_J \( B_b E \) > h_J \( E \)$, every vertex attaining the highest test cohomology of $B_b E$ is a left divisor of $b$ in the positive Artin monoid. For a right action, such a vertex is a right divisor of $b$. These conclusions hold for arbitrary inputs with bounded test cohomology, including right-simple complexes.]
] <lay:top-divisor>

#proof[
  We prove the left statement by induction on word length. Write $b = alpha b'$ and $N = B_(b') E$. If the final action raises height, its unique new highest vertex is $alpha$ by Lemma 18, and there is nothing to prove. Otherwise
  $ h_J \( N \) = h_J \( B_alpha N \) = t > h_J \( E \) . $
  The vertex $alpha$, when it is a highest vertex, already divides $b$. If a highest vertex $beta eq.not alpha$ is not adjacent to $alpha$, it was a highest vertex of $N$. By induction it divides $b'$, and it commutes past $alpha$.
  Suppose instead that $beta$ is adjacent to $alpha$. Since height did not increase, $H^t \( e_alpha N \) = 0$. The long exact sequence of (3.11) gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ H^t \( e_beta B_alpha N \) tilde.equiv "coker" #scale(x: 120%, y: 120%)[\(] H^(t - 1) \( e_alpha N \) arrow.r H^t \( e_beta N \) #scale(x: 120%, y: 120%)[\)] . $ <lay:divisor-cokernel>]
  This cokernel is nonzero, so $beta$ is a highest vertex of $N$. Induction gives a positive factorization $b' = beta v$. Put $N_0 = B_v E$, so $N tilde.eq B_beta N_0$.
  We now identify the arrow in (3.12); this is the step that permits nonprojective inputs. Set $A_0 = e_beta N_0$ and $C_0 = e_alpha N_0$, and choose opposite arrows
  $ r in e_alpha Z e_beta \, #h(2em) s in e_beta Z e_alpha \, #h(2em) s r = kappa theta_beta \, quad kappa eq.not 0 . $
  The evaluated cones are
  $ e_beta N & = "Cone" #scale(x: 120%, y: 120%)[\(] A_0 xor A_0 chevron.l 2 chevron.r arrow.r^(\( upright("id") \, theta_beta \)) A_0 #scale(x: 120%, y: 120%)[\)] \,\
e_alpha N & = "Cone" #scale(x: 120%, y: 120%)[\(] A_0 chevron.l 1 chevron.r arrow.r^r C_0 #scale(x: 120%, y: 120%)[\)] . $
  Let $pi : e_beta N arrow.r A_0 chevron.l 2 chevron.r \[ 1 \]$ be the token projection in (3.7). Multiplication by $s$ gives $\( e_alpha N \) chevron.l 1 chevron.r arrow.r e_beta N$. On its cone source, the product $s r$ is $kappa$ times the token, whereas its cone target lands in the target $A_0$, killed by $pi$. Therefore $pi s$ is, up to the cochain sign and the nonzero scalar $kappa$, exactly the connecting projection of the second cone.
  Since $pi$ is a homotopy equivalence, the image of the map in (3.12), identified in $H^(t - 1) \( e_beta N_0 \)$, is
  $ ker #scale(x: 120%, y: 120%)[\(] H^(t - 1) \( e_beta N_0 \) arrow.r H^t \( e_alpha N_0 \) #scale(x: 120%, y: 120%)[\)] . $
  Its cokernel is nonzero, so this last arrow has nonzero image. In particular $H^t \( e_alpha N_0 \) eq.not 0$. By height monotonicity, $h_J \( N_0 \) lt.eq h_J \( N \) = t$, hence $h_J \( N_0 \) = t > h_J \( E \)$. Applying induction to $v$ gives $v = alpha v'$ in the positive monoid. The simply-laced braid relation now extracts the required vertex:
  $ b = alpha beta alpha v' = beta alpha beta v' . $
  This completes the induction. On the right, use the right evaluation cones and opposite arrows, with the final action on the right. The same proof gives right divisibility. ◻
]

#prodef([Remark 3.10.])[
  Divisibility here is on the #emph[last-action side]: the left side for left complexes and the right side for right complexes. Passing from an unfolded vertex divisor to an original color divisor requires the finite-type greedy argument of Lemma 29; preservation of descents for reduced words alone does not suffice for an arbitrary positive word.
]

#thm([Corollary 3.11.])[
  (Reduced-word amplitude).  #emph[For a spherical set $J$, the positive lift of a reduced Coxeter word has layer amplitude $\[ 0 \, 1 \]$. The negative lift, obtained by replacing each letter by its inverse without reversing the word, has amplitude $\[ - 1 \, 0 \]$. These bounds hold on every pure projective input, and hence on arbitrary bounded intervals of layers, on either module side.]
] <lay:reduced>

#proof[
  First consider a reduced unfolded word. Its test height can increase at most once. Otherwise at a second increase the new letter was a highest-test vertex of the preceding result, whose height already exceeded the starting value. By Lemma 19 it can be extracted on the last-action side of that preceding positive word. Adding it there would give two equal consecutive Coxeter generators, contradicting reducedness.
  A pure input at $d$ has test height at most $d + 2$. Positive twists never produce levels below $d$. If the output had highest layer $a > d + 1$, exterior invariance would force that layer to be supported on $tilde(J)$. It has a nonzero top there, so Lemma 14 gives a nonzero test at $a + 2 > d + 3$. This contradicts the single-increase bound. If the initial tests vanish, they stay zero and give the same contradiction. This proves amplitude $\[ 0 \, 1 \]$ for reduced unfolded words.
  By Lemma 8, reduced color words unfold to reduced words, proving the positive assertion. The inverse of a negative reduced lift is the positive lift of the reversed reduced expression. Lemma 16 therefore proves the negative assertion. The right argument has the same degree bounds. ◻
]

== 4 Caps and two-point uniqueness <sec:caps>

The next two sections supply the local input for the harmonic-height argument. A cap controls the interaction with generators outside the operated colors. On a spherical coset, this control gives both a convex description of a layer and a uniqueness theorem for its possible minima. We retain the family $E_L \( x \) = B_x P_(f \, L)$ throughout. In particular, no adjacency assumption between $f$ and the operated colors is made. The two-point conclusion must identify the actual coset, rather than only its numerical layer data. We first build convex subobjects of a capped layer and then use right simple modules to recover that coset.

=== 4.1 Accessibility of a cap <accessibility-of-a-cap>

#prodef([Definition 4.1.])[
  (Cap).  For $q in bb(Z)$ and a color set $D$, the family at $x$ is #emph[capped at $q$ on $D$] if
  $ m_i^d \( x \) = 0 #h(2em) \( i in D \, med d > q \) . $
  Equivalently, every family member has no generator in those colors above level $q$. We write $partial J$ for the exterior neighbors of $J$ in $hat(S)$.
] <cap:definition>

Positivity of the family weights proves the equivalence in the definition. By Proposition 10, data outside $J$ are fixed on $A_J x$, so a cap on $partial J$ is independent of its representative.

#thm([Lemma 4.2.])[
  (A capped negative operation).  #emph[Let $E$ be a bounded projective complex capped at $q$ on $J union partial J$, and let $G$ be any word of negative twists in $J$. Then $G E$ has the same cap, and 
#[#set math.equation(numbering: n => "(4.1)")
 $ Y^q \( G E \) tilde.eq Y^q #scale(x: 120%, y: 120%)[\(] G \( Y^q \( E \) \) #scale(x: 120%, y: 120%)[\)] . $ <cap:negative-layer>]

]
] <cap:capped-negative>

#proof[
  The high quotient $R = tau_(gt.eq q + 1) E$ is supported outside $J union partial J$. Its tests at $J$ vanish termwise, so every evaluation or coevaluation term in $J$ vanishes and $G R tilde.eq R$. Apply $G$ to the truncation triangle $tau_(lt.eq q) E arrow.r E arrow.r R$. Negative twists do not increase levels. The low term therefore remains at levels at most $q$, while the unchanged quotient is at levels at least $q + 1$. The long exact layer sequence identifies all higher layers with those of $R$ and identifies level $q$ with that of $G tau_(lt.eq q) E$. Apply $G$ next to $tau_(lt.eq q - 1) E arrow.r tau_(lt.eq q) E arrow.r Y^q \( E \)$. Its first term stays below $q$, proving (4.1). ◻
]

#thm([Lemma 4.3.])[
  (Cap accessibility).  #emph[Let $J subset.eq S$ be spherical and suppose $A_J x$ has a cap at $q$ on $partial J$. It has a representative capped at $q$ also on $J$. Every negative letter in $J$ preserves this joint cap. A positive letter in $J$ preserves it whenever the top at that color in the level-$q$ layer vanishes in every family member.]
] <cap:access>

#proof[
  Negative preservation is Lemma 23. For the positive assertion use the same high quotient $R$. It is unchanged. On the low truncation, the only possible level-$q + 1$ output is the upper part of the old level-$q$ layer. By Lemma 15 this is precisely its top in the operated color; it vanishes by hypothesis.
  For accessibility, let $d > q$ be the greatest occupied level on $J$. The joint cap at $d$ holds. At that level the portion on $J$ is a nonzero direct summand of a pure layer, since the boundary is absent. It has a nonzero top somewhere on $J$. Apply a negative letter at such a color and continue while level $d$ remains.
  The selected colors form a reduced Coxeter expression. Indeed, suppose the letters already selected form a reduced word $w$, with the last operation on the left. If the next color $j$ were a left descent, Matsumoto moves could put $j$ at the last-action end of a reduced expression for $w$. The corresponding negative words give the same action. Every intermediate negative operation preserves the joint $d$-cap. Immediately before the last inverse twist, the tests in color $j$ vanish above $d + 2$; after it they vanish at $d + 2$ as well, by the negative test shift. Lemma 14 would then make the current level-$d$ top at $j$ zero, contrary to its selection. Thus each choice is a Coxeter ascent. The longest length in $W_J$ bounds the number of choices before level $d$ disappears. No larger level is recreated. Repeating at successive excess levels reaches $q$ in finitely many stages. The empty set $J$ requires no operations. ◻
]

=== 4.2 Candidate cosets and the uniqueness problem <candidate-cosets-and-the-uniqueness-problem>

Fix a nonempty spherical set $T subset.eq S$, an element $x_0 in A$, and an integer $q$. Suppose the family $\( E_L \( x_0 \) \)_L$ is capped at $q$ on $partial T$. Exterior invariance preserves this cap throughout $A_T x_0$. In the comparison below, all candidates refer to this family, this coset and this level.

#prodef([Definition 4.4.])[
  (Candidate).  A candidate is $\( J \, A_J z \)$ with $J subset.neq T$ and $z in A_T x_0$. Put $V = T \\ J$, let $p$ harmonically interpolate $m^q \( z \)$ on $J$, and put $a = - \( C p \)_T$. The requirements are:
  + the open colors $V$ are capped at $q$;
  + $a$ is strictly positive on $V$ and zero on $J$;
  + every representative $y in A_J z$ capped at $q$ on $T$ satisfies $m_J^q \( y \) gt.eq p_J$.
] <two:definition>

These are properties of the typed coset: its exterior counts, hence $p$ and $a$, are fixed. The representatives in the third condition exist by Lemma 24, since $partial J subset.eq V union partial T$.

#thm([Proposition 4.5.])[
  (Two-point uniqueness).  #emph[Let $T subset.eq S$ be nonempty and spherical, let $x_0 in A$, and let $q in bb(Z)$ cap $\( E_L \( x_0 \) \)_L$ on $partial T$. There is at most one typed coset $\( J \, A_J z \)$ satisfying Definition 25 in $A_T x_0$ at level $q$.]
] <two:uniqueness>

The proof first identifies the harmonic vectors of two candidates; the positivity condition then identifies their open colors and types. It must also show that their representatives differ by an element of the common parabolic subgroup. Capped-layer subobjects will supply the numerical comparison, while transported right simple modules will detect this relation between representatives.

=== 4.3 Convex subobjects of a capped layer <convex-subobjects-of-a-capped-layer>

We first express the excess of a capped layer over its harmonic interpolation through dimensions of subobjects. The weak form below will apply to candidates; the strict form will also be needed in Section 5.

For a spherical $J$, harmonic interpolation of exterior data is unique: $p$ agrees with those data outside $J$ and satisfies $\( C p \)_J = 0$. It is nonnegative for nonnegative exterior data and is fixed by $W_J$, by Lemma 6.

#thm([Proposition 4.6.])[
  (The capped-layer hull).  #emph[Suppose $x$ is capped at $q$ on $J union partial J$, with $J$ spherical. Let $p$ be the harmonic interpolation of $m^q \( x \)$ on $J$. Assume 
#[#set math.equation(numbering: n => "(4.2)")
 $ m_j^q \( y \) gt.eq p_j quad \( j in J \) quad upright("for every jointly capped ") y in A_J x . $ <cap:universal>]

 Put $e = m^q \( x \) - p$, which is supported on $J$. Then $e_J$ belongs to the convex hull of finitely many vectors $s_J$ for which $s$ is supported on $J$ and there are graded subrepresentations 
#[#set math.equation(numbering: n => "(4.3)")
 $ cal(S)_L subset.eq Y^q \( E_L \( x \) \) \, #h(2em) "supp" cal(S)_L subset.eq tilde(J) \, #h(2em) sum_L w_L dim cal(S)_L = phi.alt s . $ <cap:subobjects>]

 If every inequality in (4.2) is strict, $e_J$ is in the ordinary interior of such a hull in $bb(R)^J$. For $J = diameter$ this uses the convention that ${ 0 }$ is open in $bb(R)^0$.]
] <cap:hull>

#proof[
  For each $w in W_J$ choose a negative reduced lift $G_w$. Put $M_L = Y^q \( E_L \( x \) \)$. The reduced-word amplitude in Corollary 21 places $G_w M_L$ at levels $q - 1 \, q$. Apply $G_w^(- 1)$ to its low/high truncation triangle, obtaining
  $ A_L arrow.r M_L arrow.r C_L . $
  The endpoint bounds are $\[ q - 1 \, q \]$ and $\[ q \, q + 1 \]$. The long exact layer sequence forces the possible level $q - 1$ of $A_L$ and level $q + 1$ of $C_L$ to vanish. Thus both are pure at $q$ and
  #[#set math.equation(numbering: n => "(4.4)")
   $ 0 arrow.r A_L arrow.r M_L arrow.r C_L arrow.r 0 $ <cap:short-exact>]
  is exact in the shifted heart. Its subobject is an actual graded subrepresentation by Lemma 11. The low part of $G_w M_L$ is supported on $tilde(J)$, since outside-color counts are unchanged, and applying $G_w^(- 1)$ keeps that support.
  The inclusion in (4.4) is obtained by twisting, canonical truncation, and inverse twisting. These operations commute with label tensoring, including their morphisms into $M_L$. The weighted fusion identity therefore gives (4.3) for a vector $s_w$. This does not require compatible choices of Gaussian eliminations among the family members.
  The quotient has folded dimension $m^q \( x \) - s_w$. Applying $G_w$ recovers the high part at level $q$, whose signed generator count is therefore $w \( m^q \( x \) - s_w \)$. Lemma 23 identifies it with the actual level-$q$ layer at the operated representative. That representative is jointly capped, so (4.2) and $w p = p$ give
  #[#set math.equation(numbering: n => "(4.5)")
   $ #scale(x: 120%, y: 120%)[\(] w \( e - s_w \) #scale(x: 120%, y: 120%)[\)]_J gt.eq 0 . $ <cap:chamber-inequality>]
  In the strict case all these coordinates are strictly positive.
  On the root-coordinate space supported on $J$, finite Coxeter chambers cover the dual space. Thus every real functional has the form $lambda \( v \) = sum_(j in J) c_j \( w v \)_j$ for some $w$ and $c_j gt.eq 0$. Equation (4.5) gives
  $ lambda \( e \) gt.eq lambda \( s_w \) gt.eq min_(s in cal(V)) lambda \( s \) \, #h(2em) cal(V) = { s_w : w in W_J } union { 0 } . $
  Separation proves membership in this finite convex hull. If the inequalities are strict and $lambda eq.not 0$, some $c_j > 0$, so the first inequality is strict. A boundary point, including a point of a hull in a proper affine subspace, would admit a nonzero supporting functional with equality. This proves ordinary interior membership. For $J = diameter$ all the vectors are zero. ◻
]

The convex description permits a linear estimate proved for those subobjects to be applied to the excess vector, even when that vector is not itself the dimension vector of a subobject.

=== 4.4 Right simples, duality, and parabolic detection <right-simples-duality-and-parabolic-detection>

Fix a nonempty spherical $T subset.eq S$. For $ell in tilde(T)$ and $h in A_T$ let

$ R_ell \( h \) = U_ell B_h . $

Expanding a word for $B_h$ gives one residual simple $U_ell$ in placements $\( 0 \, 0 \)$ and shifted right projectives $Q_beta$ with $beta in tilde(T)$. Minimize in the additive category generated by these graded terms. Its indecomposable endomorphism rings are local, so the usual radical cancellation and uniqueness argument applies. The simple cannot cancel with a projective, which has both top and token socle. Hence exactly one residual simple remains. Denote by $K_(ell beta)^r \( h \)$ the number of projective generators of type $Q_beta$ at total generator degree $r$, summed over both placements.

For representatives $z \, z'$ of two candidates, set $h = z' z^(- 1)$. The identity

$ R_ell \( h \) ⊗_Z E_H \( z \) tilde.eq U_ell E_H \( z' \) $

relates the transported right simple to the two left families. Later we will use their caps to bound the projective terms of $R_ell \( h \)$. The detection lemma below states exactly which vanishing will suffice: once the two open sets agree and are denoted by $V$, vanishing of $K_(ell beta)^r \( h \)$ for all $r$ and $ell \, beta in tilde(V)$ forces $h in A_(T \\ V)$. We establish this criterion, together with the invariance of the block under changing representatives, before estimating it.

#thm([Lemma 4.7.])[
  (Right duality and exterior invariance).  #emph[For all $ell \, beta in tilde(T)$ and $r in bb(Z)$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ K_(ell beta)^r \( h \) = K_(beta ell)^(- 2 - r) \( h^(- 1) \) . $ <two:duality-equation>]

 For $J \, J' subset.eq T$, left multiplication of $h$ by $A_(J')$ leaves all rows outside $tilde(J)'$ unchanged. Right multiplication by $A_J$ leaves all columns outside $tilde(J)$ unchanged.]
] <two:duality>

#proof[
  First minimize the bimodule complex $B_h$. Before minimization it has one regular bimodule $Z$ at $\( 0 \, 0 \)$, and all other terms are shifts of $P_alpha ⊗_(bb(C)) Q_beta$, with indices in $tilde(T)$; tensoring two such terms has the same form because their middle tensor factor is a graded path space.
  No indecomposable regular summand is isomorphic to a projective bimodule of this form. A connected-component regular bimodule is indecomposable: a central idempotent would separate its vertices, contrary to the nonzero arrows connecting them. Modulo the left and right radicals, its top contains the diagonal simple at every vertex of that component. The top of $P_alpha ⊗ Q_beta$ contains only the pair $\( alpha \, beta \)$. The only remaining possibility is a singleton component with $alpha = beta$; there the regular bimodule has dimension two and the projective bimodule has dimension four. Shifts do not change this obstruction. Thus all regular summands survive, only at $\( 0 \, 0 \)$.
  A radical differential between projective bimodules is a sum of path tensors with positive length on at least one side: a nonzero scalar component with both lengths zero would be an invertible entry and would have been canceled. Tensoring by $U_ell$ kills positive left lengths; every surviving projective differential has positive right length. Maps involving the regular term specialize to radical maps between the simple and a projective. There is no differential between residual simples, since they occur only in cochain degree zero. The specialized right complex is therefore already minimal, and its counts are the bimodule counts with first index $ell$.
  The Frobenius trace gives adjoint duality
  $ "Hom"_(Z upright("-left")) \( M \, Z \) tilde.equiv "Hom"_(bb(C)) \( M \, bb(C) \) chevron.l 2 chevron.r . $
  It preserves additive radicals and sends $P_ell ⊗ Q_beta$ to $\( P_beta ⊗ Q_ell \) chevron.l - 2 chevron.r$. On complexes it reverses cochain placements as well. Thus $\( c \, u \)$ becomes $\( - c \, - u - 2 \)$. The adjoint of the invertible complex $B_h$ is its inverse $B_(h^(- 1))$, by Proposition 9. Minimality and the preceding specialization give (4.6).
  If $ell in.not tilde(J)'$, every letter of $A_(J')$ fixes $U_ell$: its inserted bimodule terms tensor to zero. This proves row invariance. Apply (4.6) to $\( h a \)^(- 1) = a^(- 1) h^(- 1)$ to obtain column invariance for $a in A_J$. ◻
]

To descend a cohomologically detected unfolded letter to a color, we record the required finite-type greedy argument. A simple positive element is a reduced-word lift of an element of $W_T$. By the finite-type monoid facts in Theorem 5, a positive element $b$ has a greatest simple right divisor $t \( b \)$, its right gcd with the Garside element.

#thm([Lemma 4.8.])[
  (Greedy divisibility and unfolding).  #emph[For nonidentity simple factors $d_1 \, dots.h \, d_k$, repeated extraction of the greatest simple suffix gives $d_1 dots.h.c d_k$ precisely when 
#[#set math.equation(numbering: n => "(4.7)")
 $ D_R \( d_i \) subset.eq D_L \( d_(i + 1) \) #h(2em) \( 1 lt.eq i < k \) . $ <two:greedy-condition>]

 If an unfolded vertex right-divides the unfolding of a positive element of $A_T$, its color right-divides the original element. The analogous assertion holds for left divisors.]
] <two:greedy>

#proof[
  An atom $s$ right-divides a simple $d$ exactly when $s in D_R \( d \)$, and $s d$ is simple exactly when $s in.not D_L \( d \)$. Failure of (4.7) therefore transfers a final atom of $d_i$ to the beginning of $d_(i + 1)$ and enlarges the simple suffix at that extraction stage. This proves necessity.
  For sufficiency, induct on prefixes. Suppose $P = d_1 dots.h.c d_(j - 1)$ has greatest simple suffix $d_(j - 1)$ and write $t \( P d_j \) = c d_j$, since $d_j$ is itself a simple suffix. If $c eq.not 1$, choose a final atom $s$ of $c$. Then $s d_j$ is a factor of a simple element, so it is simple. Cancellation in $P d_j = b c d_j$ gives $P = b c$, whence $s$ right-divides $P$ and thus $t \( P \) = d_(j - 1)$. This contradicts $D_R \( d_(j - 1) \) subset.eq D_L \( d_j \)$. Hence $c = 1$, completing the induction and the successive extraction proof.
  Unfold a greedy factorization. By Lemma 8, its factors remain simple and their descent sets become full color preimages. Condition (4.7) still holds, so the unfolded factorization is greedy. Any final unfolded atom divides its last simple factor. Descent reflection makes its color a final divisor of the last original factor, hence of the original element. Word reversal preserves all positive braid relations and interchanges left and right divisors, proving the left version. ◻
]

The following detector adapts the common-divisor cancellation used in cohomological Garside detection; compare the proof of #cite(label("BravThomas2011")) Theorem 3.1. Here the tests are right simples, and the conclusion identifies a standard parabolic subgroup.

#thm([Lemma 4.9.])[
  (Spherical parabolic detection).  #emph[If $diameter eq.not V subset.eq T$ and 
#[#set math.equation(numbering: n => "(4.8)")
 $ K_(ell beta)^r \( h \) = 0 #h(2em) \( r in bb(Z) \, med ell \, beta in tilde(V) \) \, $ <two:zero-block>]

 then $h in A_(T \\ V)$.]
] <two:detection>

#proof[
  Fix $ell in tilde(V)$. A right projective has a nonzero map to or from $U_ell$ only when it is $Q_ell$, via its top quotient or token socle. Equation (4.8) excludes that projective from $R_ell \( h \)$, so its residual simple splits off as a complex. Tensoring with $B_h$ preserves indecomposability. Therefore the other summand is zero in the homotopy category, and $U_ell B_h tilde.eq U_ell$.
  Write $h = h_1 h_2^(- 1)$ with $h_1 \, h_2$ positive, and set $U_V = xor.big_(ell in tilde(V)) U_ell$. Then
  #[#set math.equation(numbering: n => "(4.9)")
   $ U_V B_(h_1) tilde.eq U_V B_(h_2) . $ <two:positive-equality>]
  Use the maximum total test height on $tilde(T)$, which is zero on $U_V$. A positive word avoiding $V$ fixes $U_V$. If it contains a color of $V$, all operations before the first such color fix $U_V$, and that first operation raises height by acting on a highest test. Positive monotonicity then keeps the height positive. Thus final height zero is equivalent to avoiding $V$.
  If the common height in (4.9) is positive, choose a highest-test vertex. The right version of Lemma 19, valid for bounded tests including right simples, extracts that vertex as a final atom of both unfolded words. Lemma 29 extracts a common final original color $s$. Write $h_i = g_i sigma_s$ and tensor (4.9) on the right by $B_(sigma_s)^(- 1)$. The equality persists for $g_1 \, g_2$, while $h_1 h_2^(- 1) = g_1 g_2^(- 1)$. Their total positive length decreases by two. Iteration terminates at height zero, when both words avoid $V$ and their fraction lies in $A_(T \\ V)$. ◻
]

=== 4.5 Normalized right levels <normalized-right-levels>

We next arrange the right-simple rows so that their highest layer can be compared with a capped left layer. For projective terms, the tensor calculation has three columns, indexed by the length $j = 0 \, 1 \, 2$ of the middle path in $Z$. A right generator of level $u$ and a left generator of level $v$ contribute in total degree $u + v + j$. Tensoring the residual simple, which stays in placements $\( 0 \, 0 \)$, with a left projective is nonzero only when their vertices agree, and then has total degree $v$. We place these simple tensors in column one. To retain the same degree formula, we assign the residual simple #emph[normalized level] $- 1$. This is a bookkeeping level; its actual cochain and internal placements remain $\( 0 \, 0 \)$.

Projective terms retain their usual generator level, the sum of their cochain and internal placements. A projective-to-simple differential entry is a top quotient with source placements $\( - 1 \, 0 \)$; a simple-to-projective entry is a token inclusion with target placements $\( 1 \, - 2 \)$. Their two endpoints consequently have normalized level $- 1$. Give these entries effective length one, as for an ordinary arrow entry. Every entry then changes normalized level by one minus its effective length. At each normalized level retain the effective length-one entries. At a projective vertex, the resulting right top is its coefficient space modulo incoming images, including those from the residual simple.

If $r gt.eq - 1$ bounds the normalized levels, then

#[#set math.equation(numbering: n => "(4.10)")
 $ H^(r + 2) \( R_ell \( h \) e_beta \) upright(" has dimension ") dim "top"_beta \( R_ell \( h \)^r \) \, #h(2em) H^t \( R_ell \( h \) e_beta \) = 0 quad \( t > r + 2 \) . $ <two:right-top>]

Indeed, only level-$r$ projective tokens can occur in degree $r + 2$. Their incoming images are the arrow-coefficient images, by the perfect backtrack pairing, together with the simple’s token inclusions when $r = - 1$. An additional incoming token differential would require a level-$\( r + 1 \)$ source, which is absent. The residual simple itself has degree zero, below $r + 2$. The same argument applies to a common bound for a finite family of rows.

#thm([Lemma 4.10.])[
  (Negative right normalization).  #emph[A right inverse twist, followed by minimization, preserves an upper normalized bound $r gt.eq - 1$ for a complex with one residual simple at $\( 0 \, 0 \)$ and shifted right projectives. At its operated vertex $alpha$ the tests satisfy 
#[#set math.equation(numbering: n => "(4.11)")
 $ \( R D_alpha \) e_alpha tilde.eq \( R e_alpha \) chevron.l - 2 chevron.r \[ - 1 \] . $ <two:negative-test>]

 Both assertions hold for a full color twist as well.]
] <two:negative-bound>

#proof[
  For an individual unfolded vertex the inverse bimodule is
  $ D_alpha = \[ Z arrow.r \( P_alpha ⊗ Q_alpha \) chevron.l - 2 chevron.r \] \, $
  with its second term in cochain degree one. A projective at $\( c \, u \)$ and a middle path of length $a$ insert $Q_alpha$ at $\( c + 1 \, u + a - 2 \)$, of level $c + u + a - 1$. Only the insertions with $a = 2$ can exceed the old level, and they come from old $Q_alpha$ terms.
  These offending terms can be canceled simultaneously, even in the presence of the old differential. In $cal(E) = "Tot" \( R D_alpha \)$ let $A$ be the sum of old $Q_alpha$ terms in the $Z$ column and $B$ their inserted length-two copies. The latter are at $\( c + 1 \, u \)$, and the token–unit part of coevaluation gives an invertible block $Phi = pi_B d \|_A : A arrow.r B$, consisting of signed scalar identities. The old differential stays within a tensor column and does not enter this block. The subcomplex
  $ cal(K) = A xor d \( A \) $
  is contractible: projection onto $B$ identifies $d \( A \)$ with $B$, and its differential maps $A$ isomorphically to $d \( A \)$ and kills the latter. It is a direct summand as a bigraded module. Writing $cal(E) = A xor B xor W$, the quotient is homotopy equivalent to $cal(E)$ and has underlying terms $W$ with
  #[#set math.equation(numbering: n => "(4.12)")
   $ d'_W = d_(W W) - d_(W A) Phi^(- 1) d_(B W) . $ <two:pivot>]
  Thus scalar entries induced among the inserted terms cause no problem; their absence was not assumed.
  The remaining projectives are the old terms of other vertices and the length-zero and length-one insertions. Their levels are, respectively, the old level, the old level minus one, and the old level. The simple remains at normalized level $- 1$; if its vertex is $alpha$, it also inserts $Q_alpha$ at $\( 1 \, - 2 \)$, again level $- 1$. All remaining terms have level at most $r$. Subsequent minimization only removes summands and so preserves the bound.
  The right-handed positive test identity follows from the same token-cone cancellation as its left-handed version in Lemma 15. Inverting it gives (4.11), of total shift $- 1$. This is a bimodule homotopy before tensoring, so it holds for simple inputs too. Finally the vertices in one color are orthogonal, and their twists commute; successive application proves the color statements. ◻
]

=== 4.6 Comparing two candidates <comparing-two-candidates>

We now compare two candidates with data $\( J \, V \, p \, a \, z \)$ and $\( J' \, V' \, p' \, a' \, z' \)$. Initially choose $z$ capped on $T$ by accessibility, while $z'$ need only have its prescribed cap on $V'$. Put $h = z' z^(- 1) in A_T$. Use right rows $R_ell \( h \)$ for $ell = \( i \, L \) in tilde(V)'$, with weights $a'_i w_L$, and independently give the left member $E_(L') \( z \)$ weight $w_(L')$. Since

$ R_ell \( h \) ⊗_Z E_(L') \( z \) tilde.eq U_ell E_(L') \( z' \) \, $

their weighted actual cohomology in total degree $d$ has dimension

#[#set math.equation(numbering: n => "(4.13)")
 $ D_0 sum_(i in V') a'_i m_i^d \( z' \) . $ <two:actual-cohomology>]

Indeed tensoring a minimal left complex with $U_ell$ kills its radical differential and counts its generators at $ell$. Summing over $L'$ first gives $w_L m_i^d \( z' \)$, and then the row sum gives (4.13). It vanishes for $d > q$.

Let $r gt.eq - 1$ be the highest normalized level of these right rows, and let $N$ be their coefficient data at level $r$, retaining the row index. Put $M_(L') = Y^q \( E_(L') \( z \) \)$. The linear tensor complex at the pair $\( r \, q \)$ has columns of middle path lengths $0 \, 1 \, 2$, with simple tensors assigned to column one. Denote its cohomology by $H_j \( N \, M \)$ and its weighted dimensions by $dim_(upright("wt"))$.

#thm([Lemma 4.11.])[
  (The highest tensor pair).  #emph[One has $H_2 \( N \, M \) = 0$, and $H_1 \( N \, M \)$ survives in actual total degree $r + q + 1$. At any projective vertex the token cokernel surjects onto the tensor product of the right and left top quotients. In particular a highest right top in a color $j in J$ forces all level-$q$ left-family tops in that color to vanish.]
] <two:tensor>

#proof[
  Filter the entire tensor by middle path length. Radical projective entries increase length by one or two. A top quotient into the simple takes a length-zero tensor to its assigned length one; a token inclusion out of it takes assigned length one to length two. A left radical map tensored with a right simple vanishes. Every differential therefore increases this index.
  For a pair of normalized levels $\( u \, v \)$ and middle length $j$, actual total degree is $u + v + j$. This also holds for simple tensors, since their assigned right level and middle length are $- 1$ and $1$. The length-one differential preserves the two levels. After its cohomology the only remaining possible differential goes from column zero to column two. In particular every column-one class survives. This assertion can also be seen directly: writing the differential as $d_1 + d_2$, the cycle conditions are $d_1 u_0 = 0$ and $d_2 u_0 + d_1 u_1 = 0$; the only secondary obstruction is the class of $d_2 u_0$ in column two.
  Every nonzero tensor uses a left vertex in $T union partial T$, because right projectives are supported at vertices of $T$ and only equal-vertex or adjacent paths exist. Hence all relevant left levels are at most $q$. A secondary differential hitting column two at $\( r \, q \)$ would originate at a level pair of sum $r + q + 1$, since the differential raises total degree by one and length by two. Right levels are at most $r$ and relevant left levels at most $q$, so no such source exists. Therefore $H_2 \( N \, M \)$ also survives. It lies in degree $r + q + 2 > q$, where (4.13) is zero.
  Project the token tensors at a vertex to the tensor of its two coefficient spaces modulo incoming images. Each length-one boundary has an incoming coefficient on one side, so the projection annihilates boundaries and is surjective onto the tensor of the top quotients. A nonzero right top thus forces every left top at that vertex to vanish. Family proportionality in Proposition 10 makes a left top occurring anywhere in one color occur at every label in some member. Thus the entire left-family top in that color vanishes. ◻
]

#thm([Lemma 4.12.])[
  (Removal of highest right tops).  #emph[Changing $z$ within $A_J z$, while keeping its cap on $T$, one can arrange that no highest right top occurs on $tilde(J)$.]
] <two:normalization>

#proof[
  For a highest right top in $j in J$, Lemma 32 licenses the cap-preserving positive move $z mapsto sigma_j z$. It changes $h$ to $h sigma_j^(- 1)$ and applies the corresponding inverse twist to the right rows. Lemma 31 shows that $r$ cannot increase. Candidate data $p \, a$ are unchanged, and the tensor products still compute the same target at $z'$, so the next move is licensed anew.
  At a fixed $r$, the chosen negative right moves form a reduced word in $W_J$. Otherwise a right descent could be placed last by braid moves. All intermediate negative moves in that expression preserve the upper bound $r$. Its final acted-color test shifts down by one, so its degree-$r + 2$ test vanishes, contradicting the currently chosen right top by (4.10). Sphericity bounds the length of such a sequence. Thus after finitely many moves either the relevant tops disappear or $r$ decreases. The residual simple bounds $r$ below by $- 1$, so the procedure terminates. If $J$ is empty no move is required. ◻
]

=== 4.7 The weighted Euler estimate <the-weighted-euler-estimate>

Use the representative in Lemma 33 and retain $r \, N \, M$. Put $m = m^q \( z \)$ and $e = m - p$. The universal candidate inequality verifies Proposition 27 for $A_J z$: the cap on $T \\ J$ is fixed, so its joint $J$-cap is equivalent to the additional cap on $T$. Hence $e$ is a convex combination of folded dimensions $s$ of subfamilies $cal(S) subset.eq M$ supported on $tilde(J)$.

#thm([Lemma 4.13.])[
  (Tensoring a subobject).  #emph[For each such subfamily, 
$ H_0 \( N \, cal(S) \) arrow.r.hook H_0 \( N \, M \) \, #h(2em) H_2 \( N \, cal(S) \) = 0 . $

]
] <two:subobject-tensor>

#proof[
  Column-zero cohomology is a kernel with no incoming boundaries, so inclusion of its vector spaces gives the first assertion.
  For the second work row by row and member by member, retaining cochain placements. At a projective vertex of $tilde(J)$, each right coefficient is a sum of incoming images because its top vanishes. We use this fact inside the token cokernel. Suppose an image at $beta$ comes from a coefficient at $gamma$ through a right arrow entry. Choose a middle arrow dual to that entry under the backtrack pairing and tensor it with the predecessor coefficient and a left coefficient in $cal(S)_beta$. Its differential has two possible token contributions: the chosen right image paired with the unchanged left coefficient at $beta$, and the predecessor paired with the corresponding left-arrow image at $gamma$, with its cochain sign. Non-backtrack products vanish; dual arrow bases isolate the selected coefficient even for arrow spaces of dimension greater than one. Modulo boundaries, therefore, the former token tensor equals the latter, up to a nonzero scalar and sign.
  The new left coefficient remains in $cal(S)$ by the subrepresentation property. Each substitution decreases the right cochain placement by one, so boundedness forces termination. At a projective vertex outside $tilde(J)$ the left coefficient is zero. An incoming image from the simple is a boundary directly: the assigned length-one simple tensor maps to that token inclusion, and its left differential is zero. Thus every token tensor dies in the cokernel, proving $H_2 \( N \, cal(S) \) = 0$. ◻
]

Define a nonnegative vector supported on $T$ by

#[#set math.equation(numbering: n => "(4.14)")
 $ n_j = 1 / D_0 sum_H w_H sum_(i in V') sum_L a'_i w_L K_(\( i \, L \) \, \( j \, H \))^r \( h \) . $ <two:right-weight>]

For a left family of weighted dimension $phi.alt y$, its weighted length Euler characteristic with $N$, divided by $D_0$, is

#[#set math.equation(numbering: n => "(4.15)")
 $ chi \( n \, y \) = n^(sans(T)) C y - upright(bold(1))_({ r = - 1 }) \( a' \)^(sans(T)) y_T . $ <two:euler-formula>]

For completeness, let $N_beta^(upright("wt")) = sum_(i in V' \, L) a'_i w_L K_(\( i \, L \) \, beta)^r \( h \)$. The projective terms contribute

$ sum_(beta \, gamma) N_beta^(upright("wt")) tilde(C)_(beta gamma) \( phi.alt y \)_gamma = sum_(j \, H) N_(\( j \, H \))^(upright("wt")) w_H \( C y \)_j = D_0 n^(sans(T)) C y . $

The unit and token contribute plus signs, and the middle arrows minus signs. We used $tilde(C) phi.alt = phi.alt C$. At $r = - 1$ the residual simples contribute in column one $- sum_(i \, L) a'_i w_L \( w_L y_i \) = - D_0 \( a' \)^(sans(T)) y_T$. At higher $r$ there is no residual simple. This proves (4.15), including its normalization.

#thm([Lemma 4.14.])[
  (The two-point Euler estimate).  #emph[At the normalized representative, 
#[#set math.equation(numbering: n => "(4.16)")
 $ frac(dim_(upright("wt")) H_1 \( N \, M \), D_0) gt.eq n_T^(sans(T)) a + upright(bold(1))_({ r = - 1 }) \( a' \)^(sans(T)) p_T . $ <two:estimate>]

]
] <two:euler>

#proof[
  For each hull vector $s$, Lemma 34 gives
  $ chi \( n \, s \) = frac(dim_(upright("wt")) H_0 \( N \, cal(S) \) - dim_(upright("wt")) H_1 \( N \, cal(S) \), D_0) lt.eq frac(dim_(upright("wt")) H_0 \( N \, M \), D_0) . $
  Linearity gives the same upper bound for $chi \( n \, e \)$, since $e$ is a convex combination of these vectors. Lemma 32 gives $chi \( n \, m \) = \( dim_(upright("wt")) H_0 \( N \, M \) - dim_(upright("wt")) H_1 \( N \, M \) \) \/ D_0$. Subtracting yields
  $ frac(dim_(upright("wt")) H_1 \( N \, M \), D_0) gt.eq chi \( n \, e \) - chi \( n \, m \) = - chi \( n \, p \) . $
  Now $n$ is supported on $T$ and $\( C p \)_T = - a$, so (4.15) is exactly (4.16). ◻
]

#proof[
  Normalize the first representative as above. If $r > - 1$, its highest right layer has nonzero projective coefficients and no residual simple. Some coefficient lies in $tilde(V)$: otherwise all would lie in $tilde(J)$, where their tops vanish, and iterating incoming images toward smaller cochain placements would force the entire layer to vanish. All row weights are positive, so $n_T^(sans(T)) a > 0$. Equation (4.16) gives nonzero middle cohomology surviving in degree $r + q + 1 > q$, contradicting (4.13). Therefore $r = - 1$.
  The surviving middle part now lies in degree $q$ and has dimension at most the actual degree-$q$ cohomology. Since $a'$ is supported on $V'$, where $p'_i = m_i^q \( z' \)$, we obtain
  #[#set math.equation(numbering: n => "(4.17)")
   $ \( a' \)^(sans(T)) \( p'_T - p_T \) gt.eq n_T^(sans(T)) a gt.eq 0 . $ <two:forward>]
  Interchanging the candidates gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ a^(sans(T)) \( p_T - p'_T \) gt.eq 0 . $ <two:reverse>]
  The two normalizations may use different representatives, but their harmonic vectors and open-color vectors belong to the candidate cosets and are unchanged. The exterior values of $p \, p'$ outside $T$ agree. With $delta = p'_T - p_T$ this gives $a' - a = - C_T delta$. Adding (4.17) and (4.18) yields $- delta^(sans(T)) C_T delta gt.eq 0$. Positive definiteness forces $p = p'$, hence $a = a'$, $V = V'$ and $J = J'$, with equality throughout and $n_T^(sans(T)) a = 0$.
  It remains to identify the cosets. Fix any original comparison $h_0 = z' z^(- 1)$. Replacing the two representatives by $b z$ and $c z'$, with $b in A_J$, $c in A_(J')$, replaces $h_0$ by $c h_0 b^(- 1)$. Lemma 28 preserves its block with rows in $tilde(V)'$ and columns in $tilde(V)$. These are now the same set $tilde(V)$.
  The forward comparison has no right generators above level $- 1$. At level $- 1$, equality $n_T^(sans(T)) a = 0$ and (4.14) imply $K_(ell beta)^(- 1) = 0$ for $ell \, beta in tilde(V)$, since every coefficient weighting such a count is strictly positive. Block invariance therefore gives the same zero block for $h_0$ in all degrees $r gt.eq - 1$. The reverse comparison gives its zero block for $h_0^(- 1)$ in all degrees $r gt.eq - 1$, regardless of its chosen representatives. Duality (4.6) transposes this into vanishing for $h_0$ in all degrees $r lt.eq - 1$. Together the two ranges cover every integer. By Lemma 30, $h_0 in A_(T \\ V) = A_J$. Thus $A_J z' = A_J z$, proving uniqueness of the typed candidate. ◻
]

== 5 Null layers with a relative frame <sec:null>

The next obstruction will resolve the null-vector ties in the harmonic filtration. The frame $f$ need not neighbor every operated color, so its fixed generator alone does not provide a boundary coordinate for a given color set. We instead use the connected support of an individual family member. This gives the required obstruction at every integer level.

#thm([Proposition 5.1.])[
  (Relative null-layer obstruction).  #emph[Let $I subset.eq S$ be nonempty and connected, let $c_I > 0$ satisfy $C_I c_I = 0$, and extend $c$ by zero outside $I$. Let $J subset.eq I$ be spherical, possibly empty, let $q in bb(Z)$, and fix $A_J x$. Suppose its fixed data on $\( I \\ J \) union partial I$ are capped at $q$ and satisfy 
#[#set math.equation(numbering: n => "(5.1)")
 $ m^q \|_(\( I \\ J \) union partial I) = c \|_(\( I \\ J \) union partial I) . $ <null:exterior>]

 It is impossible that every representative $z in A_J x$ capped at $q$ on $I$ satisfies 
#[#set math.equation(numbering: n => "(5.2)")
 $ m_j^q \( z \) > c_j #h(2em) upright("for every ") j in J . $ <null:strict>]

 Thus, if $J eq.not diameter$, some such representative has $m_j^q \( z \) lt.eq c_j$ for at least one $j in J$. If $J = diameter$, the exterior hypotheses themselves are impossible.]
] <null:obstruction>

We first develop the linear Hom calculation used in the proof. All complexes, maps, and pairings retain both gradings, and all differential signs use cochain degree.

=== 5.1 Linear Hom and its permanent middle column <linear-hom-and-its-permanent-middle-column>

For pure projective layers $V \, W$ of levels $l \, k$, respectively, let $cal(L)_j^(n \, v) \( V \, W \)$ be the space of maps of path length $j$, cochain degree $n$, and internal degree $v$. It is zero unless $j in { 0 \, 1 \, 2 }$ and

#[#set math.equation(numbering: n => "(5.3)")
 $ n + v = k - l + j . $ <null:hom-degree>]

Indeed, between generator placements $\( a \, u \)$ and $\( a' \, u' \)$, these degrees are $n = a' - a$ and $v = u' + j - u$. Write $delta_V \, delta_W$ for the linear differentials. The differential

$ D_1 g = delta_W g - \( - 1 \)^n g delta_V $

raises path length and cochain degree by one and preserves internal degree. Denote its cohomology in the displayed space by $sans(H)_j^(n \, v) \( V \, W \)$, and put

$ h_j \( V \, W \) = sum_(n \, v) dim_(bb(C)) sans(H)_j^(n \, v) \( V \, W \) . $

The sums are finite. In length zero there are no incoming boundaries: a cocycle is a homogeneous map of coefficient arrays commuting with their arrows up to its cochain sign. Its image is a graded subrepresentation, with the corresponding shift in placements.

#thm([Lemma 5.2.])[
  (Pairing and middle vanishing).  #emph[For pure layers, including layers obtained from graded subrepresentations, there are perfect pairings 
#[#set math.equation(numbering: n => "(5.4)")
 $ sans(H)_j^(n \, v) \( V \, W \) med times med sans(H)_(2 - j)^(- n \, thin 2 - v) \( W \, V \) arrow.r bb(C) . $ <null:pairing>]

 In particular, 
#[#set math.equation(numbering: n => "(5.5)")
 $ h_2 \( V \, W \) & = h_0 \( W \, V \) \,\
\( dim V \)^(sans(T)) tilde(C) thin dim W & = h_0 \( V \, W \) + h_0 \( W \, V \) - h_1 \( V \, W \) \, $ <null:euler>]

 where dimensions count projective generators, summed over placements. For every $z in A$, every pair of labels $L \, H$, and all levels $l \, k$, 
#[#set math.equation(numbering: n => "(5.6)")
 $ h_1 #scale(x: 120%, y: 120%)[\(] Y^l \( E_L \( z \) \) \, Y^k \( E_H \( z \) \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <null:middle>]

 The vanishing persists after replacing either layer by a direct summand as a pure layer.]
] <null:hom>

#proof[
  The symmetric Frobenius trace pairs opposite paths of complementary lengths, with total internal degree two. On a complex use the cochain supertrace
  $ "Str"_W \( a \) = sum_c \( - 1 \)^c tau #scale(x: 120%, y: 120%)[\(] "tr"_(upright("mat")) \( a \|_(W^c) \) #scale(x: 120%, y: 120%)[\)] \, $
  where the matrix trace sums diagonal path entries and $tau$ is the Frobenius trace, not the ordinary trace of the underlying linear map. Composition and this trace give perfect pairings between the corresponding length spaces in Equation (5.4). Cyclicity gives
  $ chevron.l D_1 g \, h chevron.r + \( - 1 \)^n chevron.l g \, D_1 h chevron.r = 0 $
  in complementary degrees. Finite-dimensional duality yields the pairings on cohomology. Units and tokens each contribute the equal-vertex pairing to the length Euler characteristic; arrows contribute minus the adjacency multiplicities. This proves Equation (5.5). The argument only uses the linear differentials and therefore also applies to subrepresentations.
  For Equation (5.6), take minimal models of $E_L \( z \)$ and $E_H \( z \)$ and filter their full bigraded Hom complex by paths of length at least $j$. Its differential is $D_1 + D_2$, with $D_a$ raising path length by $a$. The first nonzero differential is $D_1$, whose cohomology splits by the ordered source and target layer levels. There are only three columns. After this linear page, the only possible differential goes from length zero to length two; every middle-column class is therefore permanent.
  The action in Proposition 9 preserves actual bigraded Hom cohomology. Between the initial projectives $P_(f \, L) \, P_(f \, H)$ it is zero for $L eq.not H$; for $L = H$ it is one-dimensional in each of bidegrees $\( 0 \, 0 \)$ and $\( 0 \, 2 \)$ and zero elsewhere. Both diagonal dimensions already have permanent representatives. The identity of the full complex is a nonzero length-zero class: a boundary has no length-zero component. For the other class, put a normalized token on one diagonal projective summand of a nonzero minimal model and put zero on the other entries. This is a cycle of bidegree $\( 0 \, 2 \)$, because a token multiplied by a radical entry is zero. Its supertrace is $\( - 1 \)^c eq.not 0$ if that summand lies in cochain placement $c$, whereas every Hom boundary has zero supertrace. It is thus a nonzero actual class in filtration two; filtration three is zero.
  The identity and token exhaust the actual diagonal dimensions, and the off-diagonal cohomology vanishes. Hence every permanent middle class is zero, proving Equation (5.6). A direct summand of a pure layer gives a direct summand of its linear Hom complex, so the same vanishing holds for it. This last assertion does not require the summand to split off the full transported complex. ◻
]

For finite label-indexed families $cal(V) = \( V_L \)_L$ and $cal(W) = \( W_H \)_H$, define the weighted dimensions

#[#set math.equation(numbering: n => "(5.7)")
 $ h_j^(upright("wt")) \( cal(V) \, cal(W) \) = sum_(L \, H) w_L w_H h_j \( V_L \, W_H \) . $ <null:weighted-dimension>]

They need not be integers. If the two weighted generator arrays are $phi.alt v$ and $phi.alt y$, then

$ sum_(L \, H) w_L w_H \( dim V_L \)^(sans(T)) tilde(C) dim W_H = D_0 v^(sans(T)) C y . $

Equation (5.5) therefore becomes

#[#set math.equation(numbering: n => "(5.8)")
 $ D_0 v^(sans(T)) C y = h_0^(upright("wt")) \( cal(V) \, cal(W) \) + h_0^(upright("wt")) \( cal(W) \, cal(V) \) - h_1^(upright("wt")) \( cal(V) \, cal(W) \) . $ <null:weighted-euler>]

=== 5.2 The capped secondary injection <the-capped-secondary-injection>

Fix a representative $z$, and abbreviate $cal(Y)^d = \( Y^d \( E_L \( z \) \) \)_L$. The following lemma uses a cap to remove one of the two possible blocks of the secondary Hom differential.

#thm([Lemma 5.3.])[
  (Secondary injection).  #emph[Suppose the family at $z$ is capped at $q$ on $I subset.eq S$. For each $L$, let $M_L$ be a direct summand of $Y^q \( E_L \( z \) \)$ as a pure layer, supported on $tilde(I)$, and put $cal(M) = \( M_L \)_L$. For $d < q$ there are injections 
#[#set math.equation(numbering: n => "(5.9)")
 $ sans(H)_0^(n \, v) #scale(x: 120%, y: 120%)[\(] M_L \, Y^d \( E_H \( z \) \) #scale(x: 120%, y: 120%)[\)] arrow.r.hook sans(H)_2^(n + 1 \, v) #scale(x: 120%, y: 120%)[\(] M_L \, Y^(d - 1) \( E_H \( z \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) n + v = d - q . $ <null:secondary-map>]

 Consequently, 
#[#set math.equation(numbering: n => "(5.10)")
 $ h_0^(upright("wt")) \( cal(M) \, cal(Y)^d \) lt.eq h_0^(upright("wt")) \( cal(Y)^(d - 1) \, cal(M) \) . $ <null:secondary-bound>]

]
] <null:injection>

#proof[
  Extend a length-zero linear cocycle $g : M_L arrow.r Y^d \( E_H \( z \) \)$ by zero on the other source summands. Because $M_L$ is a direct summand for the linear differential, this embeds its class into the linear page of $"Hom" \( E_L \( z \) \, E_H \( z \) \)$. No length-zero boundary is present. The secondary differential is represented by
  $ d_(E_H)^(\( 2 \)) g - \( - 1 \)^n g d_(E_L)^(\( 2 \)) \, $
  where the superscript denotes the length-two part of the differential. The two possible ordered layer pairs of its image are
  $ \( q \, d - 1 \) quad upright("and") quad \( q + 1 \, d \) \, $
  respectively. The latter term would require a level-$\( q + 1 \)$ source at a vertex of $tilde(I)$, since a length-two entry is a token at a single vertex. The cap excludes it. Thus the secondary image lies in the first block and gives Equation (5.9).
  If this image were zero, the length-zero class would be permanent: there are no incoming differentials and no later possible outgoing differential. Its total degree is $n + v = d - q < 0$, but actual Hom cohomology between the transported family members vanishes in every negative total degree by the initial projective calculation in Lemma 37. The class is therefore zero. Finally, sum the resulting dimension inequalities with weights $w_L w_H$ and use Equation (5.4), interchanging the two label indices. This proves Equation (5.10). ◻
]

=== 5.3 Convex separation from a null diagram <convex-separation-from-a-null-diagram>

The convex-hull conclusion of Proposition 27 interacts with the Hom calculation through the sign of a null vector at its exterior neighbors.

#thm([Lemma 5.4.])[
  (Separation).  #emph[Let $I subset.eq S$ be nonempty and connected, with $c_I > 0$ and $C_I c_I = 0$, and extend $c$ by zero. Let $J subset.eq I$. Suppose $cal(M) = \( M_L \)_L$ consists of direct summands of a single layer family $cal(Y)^q$, supported on $tilde(I)$, with weighted generator array $phi.alt m$. Assume $m - c$ is supported on $J$, and $\( m - c \)_J$ is an interior point in $bb(R)^J$ of the convex hull of finitely many vectors $s_J$. Each such $s$ is zero off $J$, and $phi.alt s$ is the weighted generator array of a family of graded subrepresentations $cal(S) subset.eq cal(M)$ supported on $tilde(J)$.]
  #emph[If the socle of $cal(Y)^d$ vanishes on $J$, and its folded weighted vector is $y = m^d \( z \)$, then 
#[#set math.equation(numbering: n => "(5.11)")
 $ y \|_(partial I) = 0 \, #h(2em) \( C y \)_J = 0 \,\
h_0^(upright("wt")) \( cal(M) \, cal(Y)^d \) = h_0^(upright("wt")) \( cal(Y)^d \, cal(M) \) = 0 . $ <null:separation-conclusions>]

 The usual zero-dimensional interior convention is used when $J = diameter$.]
] <null:separation>

#proof[
  Write $cal(Y) = cal(Y)^d$, and fix one of the subfamilies $cal(S)$. A nonzero homogeneous length-zero cocycle from a member of $cal(S)$ to one of $cal(Y)$ has a nonzero graded image supported on $tilde(J)$. That image has a socle: in its highest occupied cochain placement every outgoing coefficient arrow is zero, since arrows raise that placement. This gives a socle of the target on $J$, contrary to the hypothesis. Hence
  $ h_0^(upright("wt")) \( cal(S) \, cal(Y) \) = 0 . $
  Inclusion of $cal(S)$ in $cal(M)$ also gives
  $ h_0^(upright("wt")) \( cal(Y) \, cal(S) \) lt.eq h_0^(upright("wt")) \( cal(Y) \, cal(M) \) \, $
  because length-zero cocycles have no boundaries to quotient out. Apply Equation (5.8) to these two families. Only nonnegativity of $h_1^(upright("wt")) \( cal(S) \, cal(Y) \)$ is needed; for $cal(M)$, middle vanishing does hold by Lemma 37. Subtraction gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ D_0 \( m - s \)^(sans(T)) C y gt.eq h_0^(upright("wt")) \( cal(M) \, cal(Y) \) gt.eq 0 . $ <null:convex-inequality>]
  This inequality is affine-linear in $s$, so it holds on the entire hull. At its interior point $e = m - c$, its left side is $D_0 c^(sans(T)) C y$. Symmetry of $C$ and the null equation give
  #[#set math.equation(numbering: n => "(5.13)")
   $ c^(sans(T)) C y = - sum_(a in.not I) sum_(i in I) b_(a i) c_i y_a lt.eq 0 . $ <null:boundary-sign>]
  It is strictly negative if $y$ meets $partial I$. Comparing with Equation (5.12) proves boundary vanishing, $c^(sans(T)) C y = 0$, and $h_0^(upright("wt")) \( cal(M) \, cal(Y) \) = 0$.
  For each $j in J$, ordinary interior membership supplies the two nearby hull points $e plus.minus epsilon upright(bold(e))_j$. Their inequalities, whose value at $e$ is zero, force $\( C y \)_j = 0$. Therefore
  $ m^(sans(T)) C y = c^(sans(T)) C y + \( m - c \)_J^(sans(T)) \( C y \)_J = 0 . $
  The Euler identity for $\( cal(M) \, cal(Y) \)$ now gives the remaining Hom vanishing. When $J$ is empty, $m = c$ and no coordinate variation is required. ◻
]

=== 5.4 Proof of the obstruction <proof-of-the-obstruction>

#proof[
  Assume Equation (5.2) holds at every representative capped on $I$. Since $partial J subset.eq \( I \\ J \) union partial I$, cap accessibility in Lemma 24 supplies a representative capped on $J$ and hence on all of $I$. We will use only cap-preserving moves in $J$, so the exterior data in Equation (5.1) remain fixed throughout.
  #emph[The convex data at each capped representative.] Let $M_L$ be the part of $Y^q \( E_L \( z \) \)$ supported on $tilde(I)$. It is a direct summand of the pure layer, because the level-$q$ coefficients on $partial I$ vanish. This does not assert a splitting of $E_L \( z \)$. Its weighted generator array is $phi.alt m$, where $m$ agrees with $m^q \( z \)$ on $I$ and is zero elsewhere. In particular, $m - c$ is supported on $J$.
  The harmonic prescription on $J$ is $c_J$: its boundary data are those of $c$, and $C_I c_I = 0$. Remote coordinates outside $I union partial I$ do not enter those equations. The strict part of Proposition 27 and the universal hypothesis Equation (5.2) therefore give
  #[#set math.equation(numbering: n => "(5.14)")
   $ \( m - c \)_J in "int"_(bb(R)^J) "conv" { s_J } \, $ <null:interior>]
  with the subrepresentation families required in Lemma 39. They lie in $cal(M)$ because their support is in $tilde(J)$. The assertion is renewed after every capped move: both $cal(M)$ and its hull may change, but the strict hypothesis is quantified over every capped representative.
  #emph[An occupied boundary below $q$.] The set $I \\ J$ is nonempty, since $C_J$ is positive definite whereas $C_I$ has a positive null vector. Choose a color there. Its prescribed positive level-$q$ multiplicity occurs in some member $E_L \( z \)$. By the family properties in Proposition 10, the minimal color support of that member is connected and contains $f$, which lies outside $I$. A support path from the chosen color to $f$ meets $partial I$. There is consequently an occupied boundary level. Let $d_b$ be the lowest such level over the family. The boundary cap and zero boundary data at level $q$ give
  #[#set math.equation(numbering: n => "(5.15)")
   $ d_b < q . $ <null:boundary-level>]
  All boundary colors lie outside $J$, so $d_b$ is fixed in the coset. No adjacency of $f$ to $I$, and no sign restriction on $q$, was used.
  #emph[The upward induction.] Choose $d_min$ below or equal to every initially occupied layer. Positive amplitude preserves this lower bound. At the beginning of a stage $d in { d_min \, dots.h \, d_b }$, maintain, for every $k < d$,
  #[#set math.equation(numbering: n => "(5.16)")
   $ "soc"_(tilde(J)) cal(Y)^k = 0 \, #h(2em) \( C m^k \)_J = 0 \,\
h_0^(upright("wt")) \( cal(M) \, cal(Y)^k \) = h_0^(upright("wt")) \( cal(Y)^k \, cal(M) \) = 0 . $ <null:induction>]
  Here $cal(M)$ always refers to the current level-$q$ summand. Initially these conditions are vacuous below the lower bound. Since $d lt.eq d_b < q$, Lemma 38 and the condition at $d - 1$ imply
  #[#set math.equation(numbering: n => "(5.17)")
   $ h_0^(upright("wt")) \( cal(M) \, cal(Y)^d \) = 0 . $ <null:current-hom>]
  Suppose $cal(Y)^d$ has a socle in color $j in J$. Then the top of $cal(M)$ at that color vanishes. Otherwise the proportionality of tops across the full label family supplies a simple coefficient-array quotient at the same unfolded vertex as the chosen socle, in some member of $cal(M)$. Composing that quotient with the socle inclusion gives a nonzero homogeneous length-zero cocycle. Explicitly, a functional killing the incoming coefficient images followed by a vector killed by the outgoing coefficients has both differential compositions zero. This contradicts Equation (5.17). The top of $cal(M)$ there is the top of the full level-$q$ layer. Thus $F_j$ preserves the cap by Lemma 24.
  #emph[Preservation of earlier stages.] For this single move, compare the old and new data by ascending through $k < d$. Suppose the old top at $j$ in level $k - 1$ has already been shown to vanish; this is vacuous below the lower bound. The adjacent layer sequence in Lemma 12 identifies
  #[#set math.equation(numbering: n => "(5.18)")
   $ cal(Y)_(upright("new"))^k tilde.equiv Y^k #scale(x: 120%, y: 120%)[\(] F_j cal(Y)_(upright("old"))^k #scale(x: 120%, y: 120%)[\)] . $ <null:unshifted>]
  There is no contribution from the old level $k - 1$, precisely because its top at $j$ vanishes. The zero socle on $J$ is preserved by this unshifted operation, by Lemma 15.
  The new representative is capped and satisfies Equation (5.14). Lemma 39 therefore gives all the new conditions in Equation (5.16) at level $k$. In particular the old and new Cartan rows at $j$ both vanish. Multiplicities outside $j$ are unchanged, and $C_(j j) = 2$, so $m_(upright("new") \, j)^k = m_(upright("old") \, j)^k$. If $t_j^k gt.eq 0$ is the folded weighted old top at $j$ in level $k$, the pure positive layer formula gives
  $ m_(upright("new") \, j)^k = m_(upright("old") \, j)^k - \( C m_(upright("old"))^k \)_j + t_j^k . $
  Hence $t_j^k = 0$. Positivity of all label weights makes every old top in that color zero. This supplies the premise for the next level; in particular, it proves Equation (5.18) also at $k = d$. It also restores the preceding-stage conditions needed to apply Lemma 38 after this move.
  This order avoids circularity: top vanishing at $k - 1$ first identifies the operation at $k$; separation and the row comparison then establish top vanishing at $k$.
  #emph[Termination and contradiction.] Continue firing a color of $J$ whenever a socle remains at level $d$. At that level the operations are the unshifted pure-layer operations. By Lemma 13, they satisfy the positive braid relations, and by Lemma 15 a last acted color has zero socle after its operation. Write the most recent letter on the left. If the next chosen color were a left descent of the reduced Coxeter word already fired, Matsumoto’s Theorem would move that letter to the left end, presenting the current layer as the result of its operation acting last. Its socle would then be zero, a contradiction. Every choice is therefore a Coxeter ascent. Sphericity of $J$ bounds the number of choices by the length of its longest element.
  When the firing stops, the socle on $J$ at level $d$ vanishes. Lemma 39 supplies Equation (5.16) for this level and, if $d < d_b$, permits the next stage. There are only finitely many stages. At $d = d_b$ the same lemma gives $m^(d_b) \|_(partial I) = 0$, contradicting its fixed occupied boundary level. If $J = diameter$, there are no firing steps: the hull has its zero-dimensional meaning and the separation lemma already gives the same contradiction. This proves the proposition. ◻
]

== 6 Harmonic heights and connected minima <sec:heights>

Our goal is to put a height on the spherical cosets inside $A_Y x$, for arbitrary $Y subset.eq S$, whose minimum set is connected. A stabilizer preserves that set, so its connectedness will constrain the colors in which the stabilizer can act. Lowering a path requires connected choices for each local descent. Inside a spherical coset these choices are described by strict inequalities against the harmonic prescription. On an isolated null component we must also allow equality; the null-layer obstruction supplies the nonemptiness needed for this closed sublevel. We establish both local connectivity statements before defining the height.

Only connectedness by finite paths is needed. Accordingly, every poset in this section is used through its undirected comparability graph: two distinct vertices are adjacent when they are comparable. For coset vertices, comparability always means both nested types and actual coset inclusion.

=== 6.1 Spherical sublevels <spherical-sublevels>

We first record the elementary filtration principle used below.

#thm([Lemma 6.1.])[
  (Connected attaching neighborhoods).  #emph[Let a poset be well-ordered by an auxiliary order. Suppose that, for each vertex, its earlier neighbors are empty or connected in the graph on earlier vertices. Then each connected component contains exactly one vertex with no earlier neighbor.]
] <ht:vertex-filtration>

#proof[
  Insert the vertices in the auxiliary order. A vertex with no earlier neighbor starts a new component. Otherwise all its earlier neighbors belong to one existing component, so insertion enlarges that component and cannot merge two components. At a limit stage, any finite path has already appeared at an earlier stage: its finitely many vertices have indices bounded below the limit. Thus components cannot merge at a limit either. Every component has a least vertex, which has no earlier neighbor, proving the assertion. ◻
]

Fix a spherical $T subset.eq S$, a right coset $A_T x$, and a cap at an integer $q$ on $partial T$. Let $b^(*)$ be the harmonic interpolation of $m^q \( x \)$ on $T$:

$ b_i^(*) = m_i^q \( x \) quad \( i in.not T \) \, #h(2em) \( C b^(*) \)_T = 0 . $

Exterior invariance makes $b^(*)$ independent of the representative. Define $cal(R)_(<) \( T \, A_T x \; q \)$ to consist of pairs

$ v = \( J \, A_J z \) \, #h(2em) J subset.neq T \, quad z in A_T x \, $

such that every open color $i in T \\ J$ is capped at $q$ and has $m_i^q \( z \) < b_i^(*)$.

For a second sublevel, suppose additionally that

#[#set math.equation(numbering: n => "(6.1)")
 $ T subset.eq I subset.eq S \, quad I eq.not diameter med upright("connected") \, quad c_I > 0 \, quad C_I c_I = 0 \,\
c = 0 med upright("outside ") I \, #h(2em) m^q = c med upright("on ") \( I \\ T \) union partial I \, quad upright("with a cap at ") q upright(" there") . $ <ht:closed-data>]

Then $b_T^(*) = c_T$. The #emph[special closed sublevel] $cal(R)_lt.eq \( T \, A_T x \; q \, I \, c \)$ has the same definition except that its open inequalities are $m_i^q \( z \) lt.eq c_i$. In both definitions the type is proper, and a cap bounds every higher level, not merely level $q$.

#thm([Proposition 6.2.])[
  (Spherical sublevel connectivity).  #emph[The strict sublevel is empty or connected. Under Equation (6.1), the special closed sublevel is nonempty and connected. For $T = diameter$, the strict sublevel is empty and the special closed exterior data cannot occur. These statements hold for every integer $q$.]
] <ht:sublevels>

#proof[
  For $T = diameter$, there is no proper type. The closed exterior data would prescribe $m^q = c$ and a cap on $I union partial I$, contrary to the empty-set case of Proposition 36.
  In the nonempty closed case, Lemma 24 supplies a representative capped on $T$, hence on $I$. If the closed sublevel were empty, every representative capped on $I$ would satisfy $m_j^q > c_j$ for every $j in T$: a coordinate with $m_j^q lt.eq c_j$ could be opened alone, giving type $T \\ { j }$. This contradicts Proposition 36. Thus this sublevel is nonempty.
  We prove both connectivity assertions by induction on $\| T \|$. For a vertex $v = \( J \, A_J z \)$ in either sublevel, let $p_v$ be the harmonic interpolation of $m^q \( z \)$ on $J$, and set
  $ u_v = \( p_v \)_T - b_T^(*) . $
  The open inequalities and nonnegative interpolation give
  #[#set math.equation(numbering: n => "(6.2)")
   $ u_v lt.eq 0 \, #h(2em) \( u_v \)_J = - C_J^(- 1) C_(J \, T \\ J) \( u_v \)_(T \\ J) \, #h(2em) \( C p_v \)_T = C_T u_v . $ <ht:local-difference>]
  Order vertices first by increasing $sum_(i in T) \( u_v \)_i$. At an equal negative sum put larger types first; at sum zero put smaller types first. Refine the remaining ties by any well-order. Only finitely many sums occur: open counts lie in bounded intervals with finitely many possible values, the exterior is fixed, and there are finitely many types. The resulting order is well founded. Remaining ties are between incomparable vertices, since distinct comparable cosets of the same type cannot occur.
  Consider first $u = u_v eq.not 0$, and write $V = T \\ J$. Put
  $ N = { i in V : \( C_T u \)_i gt.eq 0 } . $
  An upper extension has the form $\( K \, A_K z \)$, with $J subset.neq K subset.neq T$, and is still allowed. The harmonic change is zero outside $K$ and on $K$ equals
  #[#set math.equation(numbering: n => "(6.3)")
   $ \( p_(\( K \, A_K z \)) - p_v \)_K = - C_K^(- 1) \( C_T u \)_K . $ <ht:local-upper-change>]
  The old rows on $J$ vanish. If $K \\ J$ avoids $N$, the nonnegative inverse with positive diagonal makes the sum strictly increase. If $diameter eq.not K \\ J subset.eq N$, the change is nonpositive; a strict decrease makes the extension earlier, and equality favors its larger type at the negative sum. Moreover $N eq.not V$, because otherwise $C_T u gt.eq 0$ would imply $u = C_T^(- 1) C_T u gt.eq 0$.
  Every earlier upper extension therefore contains a new color in $N$. Removing its other new colors gives a comparable earlier extension whose type is contained in $J union N$. These extensions all connect through the maximum $\( J union N \, A_(J union N) z \)$. Thus the earlier upper part is empty or connected.
  An earlier lower neighbor of $v$ must strictly decrease the sum. Write it as $\( R \, A_R w \)$, where $R subset.neq J$, $w in A_J z$. The difference of its harmonic vector and $p_v$ is zero outside $J$, has prescribed values
  $ m_i^q \( w \) - \( p_v \)_i #h(2em) \( i in J \\ R \) \, $
  and is harmonically interpolated on $R$. If all these values were nonnegative, the sum could not decrease. Hence the set of newly opened colors satisfying $m_i^q \( w \) < \( p_v \)_i$ is nonempty. Close the other newly opened colors. This produces a comparable earlier lower vertex in the strict sublevel $cal(R)_(<) \( J \, A_J z \; q \)$, with harmonic bound $p_v$.
  The boundary of $J$ is capped: its colors lie in $V$ or $partial T$. Every vertex of this inner strict sublevel is conversely an allowed earlier lower vertex in the original sublevel, because $p_v lt.eq b^(*)$ and its harmonic difference from $p_v$ has strictly negative sum. Induction makes the inner sublevel empty or connected. Since each earlier lower vertex is comparable with a vertex in it, the whole earlier lower part is empty or connected as well.
  If $u_v = 0$, we are in the special closed case. An upper extension keeps the same harmonic vector and has larger type, so is later. Every allowed lower neighbor is earlier, and these neighbors form $cal(R)_lt.eq \( J \, A_J z \; q \, I \, c \)$. Its exterior data are supplied by Equation (6.1) together with the equalities and caps on $V$. The empty $J$ case is impossible by Proposition 36; otherwise induction makes this lower part nonempty and connected.
  If both earlier parts are nonempty, every earlier lower vertex is below every earlier upper vertex, so their union is connected. Lemma 40 now applies. A vertex with no earlier neighbor must have $u_v eq.not 0$, $N = diameter$, and empty inner strict sublevel. Therefore
  $ - \( C p_v \)_i > 0 quad \( i in V \) \, #h(2em) \( C p_v \)_J = 0 . $
  At every representative $w in A_J z$ capped on $T$ one also has $m_J^q \( w \) gt.eq \( p_v \)_J$; otherwise opening a failing coordinate alone would give a vertex in the inner strict sublevel. Together with the caps on $V$, these are exactly the candidate conditions of Proposition 26. There is at most one such vertex in the fixed spherical residue. Every component has one by Lemma 40, so a nonempty sublevel is connected. ◻
]

=== 6.2 The global relative height <the-global-relative-height>

Fix $Y subset.eq S$ and $x in A$, without a sphericity assumption on $Y$. Let $cal(P) \( Y \, x \)$ be the poset of

$ v = \( T \, A_T z \) \, #h(2em) T subset.eq Y med upright("spherical") \, quad z in A_Y x . $

Its graph is connected. Indeed singleton cosets $\( diameter \, { z } \)$ are joined to their left-generator translates through the corresponding rank-one cosets, and every vertex contains a singleton vertex.

Choose $d_(*) lt.eq 0$ at or below every occupied level of the exterior data $m^k \( x \) \|_(hat(S) \\ Y)$. These data are fixed throughout $A_Y x$. For $v = \( T \, A_T z \)$, let $p^k \( v \)$ be the harmonic interpolation of $m^k \( z \)$ on $T$. It is independent of $z$ in its coset.

For each $k gt.eq d_(*)$, assign a sign $eta_i^k \( v \)$ as follows. It is zero if $p_i^k \( v \) = 0$, and is $- 1$ at positive entries, except that it is $+ 1$ on a whole positive-support component $I$ when

#[#set math.equation(numbering: n => "(6.4)")
 $ I subset.eq S \, #h(2em) \( C p^k \( v \) \)_I = 0 \, #h(2em) p^d \( v \) \|_(I union partial I) = 0 quad upright("for every ") d > k . $ <ht:null-sign>]

Here support components use adjacency in the full diagram $hat(S)$. Fix an ordering of those coordinates and form the block

#[#set math.equation(numbering: n => "(6.5)")
 $ B_k \( v \) = (sum_(i in hat(S)) p_i^k \( v \) \, med \( p_i^k \( v \) \)_(i in hat(S)) \, med \( upright(bold(1))_({ i in T }) eta_i^k \( v \) \)_(i in hat(S))) . $ <ht:block>]

Blocks are ordered lexicographically, with smaller earlier. The #emph[height] of $v$ compares these finite-support blocks from the highest level downward, stopping at $d_(*)$. Distinct vertices may have equal height.

The final coordinates of each block break numerical ties. When the recorded interpolated vectors are unchanged, adding a positive color to the type changes its coordinate from zero to $eta_i^k$: sign $- 1$ favors closing that color, while sign $+ 1$ favors opening it. The exceptional $+ 1$ case in Equation (6.4) is an isolated highest positive null component. An entire such component is nonspherical, so it cannot all be added to a spherical type. Openings whose counts are at most the prescribed null vector are instead controlled by the special closed sublevel of Proposition 41.

#thm([Lemma 6.3.])[
  (Well-founded heights).  #emph[The possible heights are well ordered. Their least block is the zero block.]
] <ht:well-order>

#proof[
  All entries of $p^k$ are nonnegative by Lemma 6. Bounding a block’s first coordinate bounds every exterior count for its type. Those counts have finitely many possible values in a bounded interval by Proposition 10. There are finitely many types, their harmonic interpolations are fixed linear maps, and there are finitely many sign masks. Thus the block alphabet has finite initial segments. Its least element is zero.
  An infinite strictly descending sequence of heights would have no nonzero block above the largest occupied level of its first term. It would therefore involve only finitely many levels $k gt.eq d_(*)$. At the highest level the block can decrease only finitely often, so eventually stays fixed. The same argument then applies to the next level, and successively to all remaining levels, contradicting strict descent. Equivalently, if $r \( B \)$ is the finite rank of a block in its alphabet, the heights are ordered by the finite Cantor sums $sum_(k gt.eq d_(*)) omega^(k - d_(*)) r \( B_k \)$, with decreasing exponents. ◻
]

A neighbor is called #emph[descending] when it has strictly smaller height. We analyze upper and lower neighbors separately.

=== 6.3 Active upper colors <active-upper-colors>

Fix $v = \( T \, A_T z \)$. For $i in Y \\ T$, let $ell_i$ be the highest recorded level with a positive entry on $i$ or one of its neighbors, if such a level exists. Call $i$ #emph[active] if

#[#set math.equation(numbering: n => "(6.6)")
 $ \( C p^(ell_i) \( v \) \)_i > 0 quad upright("or") quad \( C p^(ell_i) \( v \) \)_i = 0 \, quad eta_i^(ell_i) \( v \) = - 1 . $ <ht:active>]

An active color has a positive entry at that level: otherwise incidence would make its row strictly negative.

#thm([Lemma 6.4.])[
  (Upper neighbors).  #emph[The union of $T$ with all active colors is spherical. The descending upper neighbors of $v$ are empty or connected using only descending upper neighbors.]
] <ht:upper>

#proof[
  An upper neighbor has the form $v' = \( U \, A_U z \)$, where $T subset.neq U$ is spherical. Compare at the highest incidence level of its new colors. Above that level, the new colors and their neighbors have zero entries, so interpolation changes neither vectors nor signs. At the comparison level $k$, the change is zero outside $U$ and is
  #[#set math.equation(numbering: n => "(6.7)")
   $ \( p^k \( v' \) - p^k \( v \) \)_U = - C_U^(- 1) \( C p^k \( v \) \)_U . $ <ht:global-upper-change>]
  Rows on $T$ vanish. If no new color is active, all the new rows at this level are nonpositive. A negative row strictly increases the sum. If all vanish, the vector and its intrinsic signs stay fixed, and the incident positive new coordinates have sign $+ 1$. Closing them increases the sign mask. If the new colors have no recorded incidence at all, the heights tie. Consequently every descending upper neighbor adds an active color.
  Conversely, suppose only active colors are added. At their highest incidence level all new rows are nonnegative. A positive row strictly decreases the sum; if all vanish, the vector is fixed and the positive new coordinates have sign $- 1$, so the sign mask decreases. Thus such an extension is descending whenever its type is spherical.
  Let $G$ be a connected component of $T$ together with all active colors, and suppose $G$ contains an active color. Choose the highest recorded level $k$ incident to $G$. All full rows on $G$ are nonnegative: closed rows vanish, while an active color either has its highest incidence at $k$, or has zero data on itself and its neighbors there. Hence
  #[#set math.equation(numbering: n => "(6.8)")
   $ C_G p_G^k = \( C p^k \)_G + b_(G \, hat(S) \\ G) p_(hat(S) \\ G)^k gt.eq 0 . $ <ht:active-cartan>]
  The vector $p_G^k$ is nonzero, since otherwise incidence would give a negative full row. It is strictly positive by connectedness: a zero coordinate adjacent to a positive one would again have a negative row.
  If $G$ were nonspherical, Lemma 6 would give $C_G p_G^k = 0$. Both nonnegative terms on the right of Equation (6.8) would vanish. Thus $G$ is the entire positive-support component, and higher levels vanish on $G union partial G$ by the choice of $k$. Equation (6.4) assigns sign $+ 1$ to $G$. Every active color in it has highest incidence $k$ and zero full row, contradicting Equation (6.6). Therefore $G$ is spherical. Components with no active color lie in the old spherical type $T$. The whole union is consequently spherical.
  Every descending upper neighbor can now be joined to the one obtained by removing all its nonactive new colors. The latter is descending and still contains a new color. All these reduced extensions connect through the extension by every active color, which is spherical by the preceding argument. If there are no active colors, there is no descending upper neighbor. ◻
]

=== 6.4 Eligible lower colors and null blocks <eligible-lower-colors-and-null-blocks>

A connected diagram component of $T$ is #emph[visible] if its harmonic entries are positive at some recorded level. Whenever they are nonzero at a level, all its entries are positive, by positivity of the inverse Cartan block. It therefore has a common highest such level $q$. Its boundary data are capped there: at every higher level its zero harmonic entries force all neighboring nonnegative entries to vanish. Its entries also have a common sign at level $q$.

For a lower coset, call a newly opened color $i$ #emph[eligible] when it belongs to a visible component with highest level $q$, its actual data are capped at $q$, and

#[#set math.equation(numbering: n => "(6.9)")
 $ m_i^q < p_i^q \( v \) quad upright("or") quad m_i^q = p_i^q \( v \) \, quad eta_i^q \( v \) = + 1 . $ <ht:eligible>]

Nonvisible colors are not eligible.

#thm([Lemma 6.5.])[
  (Lower neighbors).  #emph[Every descending lower neighbor opens an eligible color. Opening a nonempty set of eligible colors and no others gives a descending neighbor. The descending lower neighbors of $v$ are empty or connected using only descending lower neighbors.]
] <ht:lower>

#proof[
  Write a lower neighbor as $\( R \, A_R w \)$, with $R subset.neq T$ and $w in A_T z$. Its vector difference from $p^k \( v \)$ is zero outside $T$, has actual-minus-prescribed values on the newly opened colors $T \\ R$, and is harmonically interpolated on $R$. Consider the highest recorded level at which an opened coordinate has either prescribed or actual positive data. Above it both vectors and sign masks agree.
  Suppose no opened color is eligible. At the comparison level the actual-minus-prescribed values are all nonnegative. Indeed any positive prescribed coordinate is at its component’s highest visible level, and its actual cap holds, because there is no higher incidence among the opened coordinates. Failure of eligibility then gives the nonnegative difference. A strict difference increases the sum after interpolation. If all differences vanish, the full vectors and intrinsic signs agree, and every positive opened coordinate has sign $- 1$. Its mask changes from $- 1$ to zero, increasing the block. Without a comparison level there is a tie. This proves that a descending lower neighbor must open an eligible color.
  If all opened colors are eligible, the reverse comparison applies. At the highest visible level among them their differences are nonpositive, and the other opened coordinates have zero difference. A strict difference decreases the sum. With equality, some positive opened coordinate has sign $+ 1$, and every nonzero mask change is from $+ 1$ to zero. Thus the neighbor is descending.
  From any descending lower neighbor, close its ineligible opened colors. This gives a comparable descending lower neighbor opening only eligible colors. It remains to connect all such choices.
  First take a visible component with sign $- 1$ at its highest level $q$. The proper eligible choices in that component are exactly its strict spherical sublevel, with the fixed exterior cap at $q$. This factor is empty or connected by Proposition 41.
  For sign $+ 1$, components must be grouped more carefully. Let $I$ be their whole positive-support component at level $q$; group together all the diagram components of $T$ contained in $I$. Their union is precisely $T ∩ I$. No other closed color is in $partial I$: a closed zero harmonic entry cannot neighbor positive support. The sign rule says that $I subset.eq S$, that its positive vector $c_I = p_I^q \( v \)$ satisfies $C_I c_I = 0$, and that all higher incident data vanish. Since $\( I \\ T \) union partial I$ is outside $T$, its harmonic data are the fixed actual data. They therefore satisfy Equation (6.1) for the spherical block $T ∩ I$. Its proper eligible choices form the special closed sublevel for this entire block, which is nonempty and connected by Proposition 41. No separate closed-sublevel assertion for its possibly disconnected diagram components is being used.
  All these blocks are unions of components of $T$; nonvisible components stay closed. The Artin presentation and standard parabolic embedding give the direct product of the block groups. Thus a subcoset in $A_T z$ is specified by its block subcosets acting from the common representative $z$. Operations in another block change no counts in a given block. Consequently the all-eligible lower choices are exactly the product of the proper-choice factors just described, each with its top (the choice to open nothing) adjoined, with the all-top tuple deleted.
  This product is empty or connected. Every tuple can be joined upward to one with a single non-top coordinate. Such tuples connect within a fixed coordinate because its proper-choice factor is connected. Tuples supported in two different coordinates connect through the tuple carrying both choices. Empty factors merely force their coordinates to stay top. Hence all-eligible neighbors are empty or connected; adjoining the other descending neighbors through their comparable all-eligible choices proves the result. ◻
]

#thm([Corollary 6.6.])[
  (Descending neighborhoods).  #emph[The descending neighbors of each vertex are empty or connected in its strict height sublevel.]
] <ht:descending>

#proof[
  Lemmas 43 and 44 handle the two parts. If both are nonempty, each lower neighbor is below each upper neighbor, so they are joined by edges. ◻
]

=== 6.5 Ties and minimum-height paths <ties-and-minimum-height-paths>

For $v = \( T \, A_T z \)$, define its invisible and visible closed sets by

#[#set math.equation(numbering: n => "(6.10)")
 $ K \( v \) & = { i in Y : p^k \( v \) \|_({ i } union partial { i }) = 0 upright(" for every ") k gt.eq d_(*) } \,\
T_(+) \( v \) & = T \\ K \( v \) . $ <ht:invisible>]

These definitions do not assert absence of internal generators below the recorded cutoff.

#thm([Lemma 6.7.])[
  (Compatibility across a tie).  #emph[If $v < v'$ have equal height, then $K \( v \) = K \( v' \)$ and $T_(+) \( v \) = T_(+) \( v' \)$. There is no adjacency between these common visible and invisible sets. Moreover either both descending neighborhoods are empty, or they are nonempty and belong to the same connected component of their common strict height sublevel.]
] <ht:ties>

#proof[
  Write $v = \( T \, A_T z \)$ and $v' = \( U \, A_U z \)$, with $T subset.neq U$. All recorded vectors agree. Equality of each sign-mask coordinate forces every new closed color in $U \\ T$ to have zero entry at every recorded level: at a positive entry its mask would change from zero to $+ 1$ or $- 1$. Harmonicity on $U$ then forces all its neighboring entries to vanish too. Hence $U \\ T subset.eq K \( v \)$, the invisible sets agree, and
  $ T \\ K \( v \) = U \\ K \( v \) . $
  A visible closed color is positive at some recorded level; it therefore cannot neighbor an invisible color. This proves the first assertions.
  Active colors are common, because they depend only on the recorded vectors and their signs; no new closed color is active. If there is an active color, its upper extension from the larger coset is descending and comparable with both vertices. Corollary 45 then places both entire descending neighborhoods in the same strict-sublevel component.
  Suppose instead that there are no active colors. Both upper descending parts are empty, so only lower neighbors matter. Their visible components, highest levels, signs, and grouped eligibility blocks agree. If the larger coset has a descending lower neighbor, it has an eligible opening after a move $g in A_U$. The nonadjacency already proved gives
  $ A_U = A_(T_(+)) times A_(U ∩ K) . $
  Write $g = g_(+) g_0$ in these factors. Omitting $g_0$ cannot change any actual count at a visible color: it commutes with $g_(+)$ and operates only in invisible colors. Since $g_(+) in A_T$, the same eligible color can be opened in the smaller coset, using the representative $g_(+) z$. Opening that single color gives a descending lower neighbor of the smaller vertex by Lemma 44. Conversely every descending lower neighbor of the smaller vertex is also one of the larger, by transitivity of coset inclusion and equality of their heights. Thus nonemptiness agrees and, when nonempty, the two neighborhoods share a lower vertex. Corollary 45 finishes the proof. ◻
]

#thm([Proposition 6.8.])[
  (Connected minima).  #emph[The minimum-height vertices in $cal(P) \( Y \, x \)$ form a nonempty connected graph. Their sets $K$ and $T_(+)$ are constant along this graph.]
] <ht:minima>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.7, 1.35), (7.6, 1.35), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.8, 1.35), [#text(size: 9pt)[height $H$]], anchor: "east", padding: 0.1176cm)
  content((-0.8, -0.15), [#text(size: 9pt)[strict sublevel#linebreak()of $H$]], anchor: "east", padding: 0.1176cm)
  line((0, -0.1), (1.2, 1.35), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((1.2, 1.35), (3.3, 1.35), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3.3, 1.35), (5.4, 1.35), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((5.4, 1.35), (6.6, -0.1), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((1.2, 1.35), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((1.2, 1.385), [$v_0$], anchor: "south")
  circle((3.3, 1.35), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((3.3, 1.385), [$v_1$], anchor: "south")
  circle((5.4, 1.35), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((5.4, 1.385), [$v_2$], anchor: "south")
  content((3.3, 2.02), [#text(size: 9pt)[maximal tied segment]])
  line((0, -0.1), (1.4, -0.8), stroke: (paint: rgb("#224b57"), thickness: 0.8pt, miter-limit: 10))
  line((1.4, -0.8), (3.3, -0.45), stroke: (paint: rgb("#224b57"), thickness: 0.8pt, miter-limit: 10))
  line((3.3, -0.45), (5.2, -0.8), stroke: (paint: rgb("#224b57"), thickness: 0.8pt, miter-limit: 10))
  line((5.2, -0.8), (6.6, -0.1), stroke: (paint: rgb("#224b57"), thickness: 0.8pt, miter-limit: 10))
  circle((1.4, -0.8), radius: 0.0898, fill: rgb("#224b57"), stroke: none)
  circle((3.3, -0.45), radius: 0.0898, fill: rgb("#224b57"), stroke: none)
  circle((5.2, -0.8), radius: 0.0898, fill: rgb("#224b57"), stroke: none)
  circle((0, -0.1), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((-0.03528, -0.1), [$a$], anchor: "east")
  circle((6.6, -0.1), radius: 0.0898, fill: rgb("#000000"), stroke: none)
  content((6.635, -0.1), [$b$], anchor: "west")
  content((3.3, -1.2), [#text(fill: rgb("#224b57"))[#text(size: 9pt)[replacement path]]])
})],
  caption: [Figure 1: Lowering a maximal tied segment, as in Proposition 47. Its two descending attachments $a \, b$ belong to the same component of the strict height sublevel, so a finite path there replaces the segment. The drawing represents comparability paths and a connectivity argument. ],
) <fig:tied-path>

#proof[
  A minimum exists by Lemma 42. Take a finite path between two minimum-height vertices in the connected full graph. If its greatest height is above the minimum, consider a maximal contiguous segment at that height. Consecutive vertices of the segment are comparable and tied. The segment has descending attachments at its two ends. Lemma 46 and Corollary 45 put these attachments in one connected component of the strict sublevel. Replace the segment by a finite path in that component.
  Doing this for all segments at the current greatest height removes that height entirely and introduces no vertex at or above it. If the resulting path is still not a minimum path, repeat. An infinite repetition would give a strictly descending sequence of greatest heights, contrary to Lemma 42. The process therefore ends with a path entirely among minima. The constancy of $K \, T_(+)$ along its edges is Lemma 46. ◻
]

=== 6.6 The stabilizer containment <the-stabilizer-containment>

For later use define the simultaneous graded-homotopy stabilizer

#[#set math.equation(numbering: n => "(6.11)")
 $ H \( Y \, x \) = { a in A_Y : E_L \( a x \) tilde.eq E_L \( x \) upright(" for every simple label ") L } . $ <ht:stabilizer>]

This is a subgroup because the $B_a$ are equivalences. Choose a minimum $v = \( T \, A_T z \)$, and abbreviate its invisible and visible sets by $K \, T_(+)$.

#thm([Proposition 6.9.])[
  (Containment from a minimum).  #emph[Put $D = T_(+) union K subset.eq Y$. The set $T_(+)$ is spherical and nonadjacent to $K$, and 
#[#set math.equation(numbering: n => "(6.12)")
 $ x^(- 1) H \( Y \, x \) x subset.eq z^(- 1) A_D z . $ <ht:containment-equation>]

 Equivalently, with $b = z x^(- 1) in A_Y$, $H \( Y \, x \) subset.eq b^(- 1) A_D b$.]
] <ht:containment>

#proof[
  The set $T_(+)$ is contained in the spherical type $T$. Every visible closed color is positive at some recorded level, so Equation (6.10) excludes adjacency to $K$.
  Along any minimum path starting at $v$, the sets $T_(+) \, K \, D$ are constant by Proposition 47, and every type is contained in $D$. All cosets on that path lie in $A_D z$. Indeed this holds initially because $T subset.eq D$. A downward inclusion preserves it; for an upward inclusion, the larger coset has type contained in $D$ and contains a point of $A_D z$, so the whole larger coset also lies in $A_D z$.
  Let $a in H \( Y \, x \)$ and set $r = x^(- 1) a x$. Right multiplication by $r$ is an automorphism of the coset poset, preserving types. At a representative $c x$, where $c in A_Y$,
  $ E_L \( c x r \) = E_L \( c a x \) tilde.eq B_c E_L \( a x \) tilde.eq B_c E_L \( x \) = E_L \( c x \) . $
  It therefore preserves all layer counts and heights. The translated vertex $\( T \, A_T z r \)$ is a minimum, so Proposition 47 joins it to $v$ by a minimum path. The coset containment along that path gives $z r in A_D z$, hence $r in z^(- 1) A_D z$, proving Equation (6.12). The equivalent formulation follows from $z = b x$. ◻
]

== 7 Bounded positive height in spherical colors <sec:spherical>

We now prove the containment needed for a stabilizer inside a spherical standard parabolic. If the tests on the operated colors are not all acyclic, the stabilizer lies in a conjugate of a proper standard parabolic. In this case, the main step rules out an infinite sequence of positive words, each containing every operated color, along which total test height is bounded.

Suppose such a sequence existed. Positive amplitude gives a fixed lower bound on generator levels; bounded total test height and the fixed exterior generators give a fixed upper bound. Every member of the family therefore has its generator levels in one interval $\[ d_1 \, d_2 \]$. Meanwhile the greatest ordinary cochain degree of tested cohomology drops by at least one after each word. We will convert the resulting test vanishing on a long cochain interval below all exterior generators into an empty cochain placement. The finite path bound below removes one layer after another, at a uniformly bounded cost in placement. At a sufficiently late stage, nonzero test cohomology still lies below the empty placement and the fixed $f$-generator lies above it. One transported projective would split, contradicting its indecomposability.

=== 7.1 A bound on coefficient paths <a-bound-on-coefficient-paths>

The underlying path calculation is the essential-path construction associated with Ocneanu and the Jones–Wenzl projections; see #cite(label("Coquereaux2002")) Sections 3.1–3.2 and #cite(label("Cooper2007")) Theorem 5.4.3 and Proposition 5.6.10. We give its projection argument explicitly so that the resulting nilpotence bound can be applied on an interval of cochain placements, where the coefficient maps may depend on the placement.

#thm([Lemma 7.1.])[
  #emph[Let $Y subset.eq S$ be spherical. There is an integer $N = N \( Y \) gt.eq 1$ with the following property. Consider a minimal bounded complex of projectives and an integer interval of cochain placements on which all its generator vertices lie in $tilde(Y)$. In each pure layer, every composition of $N$ successive arrow coefficient maps vanishes, provided all $N + 1$ placements of the composition lie in that interval.]
] <sph:path-bound>

#proof[
  By Lemma 8, the graph on $tilde(Y)$ is a disjoint union of finite simply laced graphs whose Cartan matrices are positive definite. We first establish a path identity on one connected component with an edge. Write $sans(B)$ for its adjacency matrix.
  There is a strictly positive vector $mu$ with
  $ sans(B) mu = delta mu \, #h(2em) 0 < delta < 2 . $
  For completeness, maximize the Rayleigh quotient of $sans(B)$ on the unit sphere. Replacing a maximizing vector by its coordinatewise absolute value does not decrease the quotient. The resulting nonnegative eigenvector is strictly positive: the eigenvalue equation at a zero coordinate would force its neighbors to be zero, and connectedness would then force the entire vector to vanish. An edge makes the maximum eigenvalue positive, and positivity of $2 I - sans(B)$ makes it less than $2$.
  Choose opposite arrow bases on each edge so that the trace of their product, in either order, is $sqrt(mu_i mu_j)$. The nondegenerate opposite-arrow pairing and ordinary symmetry of the Frobenius trace allow this choice. For coefficient maps of a pure layer, the length-two component of the square of the differential is therefore the relation
  #[#set math.equation(numbering: n => "(7.1)")
   $ sum_(j tilde.op i) sqrt(mu_j \/ mu_i) thin \( i thin j thin i \) = 0 . $ <sph:eq:path-relation>]
  Here a path denotes the corresponding composition of coefficient maps, at successive cochain placements. Indeed, before division by $mu_i$, its coefficient in the token trace is $sqrt(mu_i mu_j)$. Minimality excludes length-zero differential entries, so only two length-one entries contribute to this part of $d^2$. The relation is valid on the prescribed interval because every intervening generator there is in $tilde(Y)$.
  We prove that all sufficiently long abstract paths lie in the span of insertions of (7.1). Let $cal(V)_n$ be the finite-dimensional Hilbert space with orthonormal basis the paths $\( a_0 \, dots.h \, a_n \)$ of length $n$. For $n gt.eq 2$ and $1 lt.eq i lt.eq n - 1$, define
  $ c_i^(\( n \)) : cal(V)_n arrow.r cal(V)_(n - 2) $
  by zero unless $a_(i - 1) = a_(i + 1)$. On a backtrack $\( a \, b \, a \)$ at these positions, delete its two edges and multiply the shortened path by $sqrt(mu_b \/ mu_a)$. The adjoint inserts exactly the weighted sum in (7.1), with the surrounding path fixed. All these maps preserve the two endpoints.
  The contraction and insertion operators satisfy
  #[#set math.equation(numbering: n => "(7.2)")
   $ c_i^(\( n \)) \( c_i^(\( n \)) \)^(*) & = delta thin upright("id")_(cal(V)_(n - 2)) \,\
c_i^(\( n \)) \( c_(i - 1)^(\( n \)) \)^(*) & = c_(i - 1)^(\( n \)) \( c_i^(\( n \)) \)^(*) = upright("id")_(cal(V)_(n - 2)) quad \( 2 lt.eq i lt.eq n - 1 \) . $ <sph:eq:loop>]
  In (7.2), the scalar at the insertion vertex $a$ is $sum_(b tilde.op a) mu_b \/ mu_a = delta$. For (7.2), the subsequent contraction forces the inserted detour to use the adjacent edge already present in the path. Its two factors are reciprocal square roots, so their product is $1$. In particular, both identities in (7.2) use the same ambient length $n$.
  Let
  $ cal(E)_n = ⋂_(i = 1)^(n - 1) ker c_i^(\( n \)) \, #h(2em) cal(E)_0 = cal(V)_0 \, quad cal(E)_1 = cal(V)_1 \, $
  and let $Pi_n$ be the orthogonal projection onto $cal(E)_n$. Since these spaces decompose by endpoints, $Pi_n$ preserves endpoints. We may therefore extend $Pi_k$ to longer path spaces by applying it to the first $k$ edges while keeping the tail fixed.
  Write
  $ delta = 2 cos theta \, #h(2em) 0 < theta < pi \/ 2 \, #h(2em) \[ u \] = frac(sin \( u theta \), sin theta) \, #h(2em) h = min { j in bb(Z)_(gt.eq 1) : j theta gt.eq pi } . $
  Then $\[ n \] > 0$ for $1 lt.eq n < h$, and $\[ n \] = delta \[ n - 1 \] - \[ n - 2 \]$. For $2 lt.eq n < h$, denote by $sans(Q)_n$ the extension of $Pi_(n - 1)$ to the first $n - 1$ edges of a length-$n$ path. We claim
  #[#set math.equation(numbering: n => "(7.3)")
   $ c_(n - 1)^(\( n \)) sans(Q)_n \( c_(n - 1)^(\( n \)) \)^(*) = frac(\[ n \], \[ n - 1 \]) Pi_(n - 2) quad upright("on ") cal(V)_(n - 2) \, $ <sph:eq:scalar>]
  and
  #[#set math.equation(numbering: n => "(7.4)")
   $ Pi_n = sans(Q)_n - frac(\[ n - 1 \], \[ n \]) thin sans(Q)_n \( c_(n - 1)^(\( n \)) \)^(*) c_(n - 1)^(\( n \)) sans(Q)_n . $ <sph:eq:projection>]
  At $n = 2$, $sans(Q)_2$ is the identity, and (7.3) is (7.2), since $\[ 2 \] \/ \[ 1 \] = delta$. To pass from $n - 1$ to $n$, let $sans(R)_n$ be the extension of $Pi_(n - 2)$ to the first $n - 2$ edges. Extending (7.4) for $n - 1$ by one edge gives
  $ sans(Q)_n = sans(R)_n - frac(\[ n - 2 \], \[ n - 1 \]) thin sans(R)_n \( c_(n - 2)^(\( n \)) \)^(*) c_(n - 2)^(\( n \)) sans(R)_n . $
  Endpoint preservation gives the identities
  $ c_(n - 1)^(\( n \)) sans(R)_n = Pi_(n - 2) c_(n - 1)^(\( n \)) \, #h(2em) sans(R)_n \( c_(n - 1)^(\( n \)) \)^(*) = \( c_(n - 1)^(\( n \)) \)^(*) Pi_(n - 2) . $
  They concern $sans(R)_n$, whose prefix stops before the last pair, not $sans(Q)_n$. Substitution, followed by (7.2) and the two adjacent identities, yields
  $ c_(n - 1)^(\( n \)) sans(Q)_n \( c_(n - 1)^(\( n \)) \)^(*) & = delta Pi_(n - 2) - frac(\[ n - 2 \], \[ n - 1 \]) thin Pi_(n - 2) c_(n - 1)^(\( n \)) \( c_(n - 2)^(\( n \)) \)^(*) c_(n - 2)^(\( n \)) \( c_(n - 1)^(\( n \)) \)^(*) Pi_(n - 2)\
 & = (delta - frac(\[ n - 2 \], \[ n - 1 \])) Pi_(n - 2)\
 & = frac(\[ n \], \[ n - 1 \]) Pi_(n - 2) . $
  This proves (7.3).
  To justify the projection formula, set $T_n = c_(n - 1)^(\( n \)) sans(Q)_n$. The identity just proved reads
  $ T_n T_n^(*) = frac(\[ n \], \[ n - 1 \]) Pi_(n - 2) . $
  In finite-dimensional Hilbert spaces, an operator and its product with its adjoint have the same image: their orthogonal complements are both the kernel of the adjoint. Thus $T_n$ maps onto $cal(E)_(n - 2)$. Restricted to $"im" sans(Q)_n$, its kernel is $cal(E)_n$, because the prefix projection has already imposed all contractions except the last one. To verify the projection explicitly, put $lambda = \[ n \] \/ \[ n - 1 \] > 0$. The established range identity gives
  $ \( T_n^(*) T_n \)^2 = lambda T_n^(*) T_n \, #h(2em) sans(Q)_n T_n^(*) T_n = T_n^(*) T_n = T_n^(*) T_n sans(Q)_n . $
  Consequently $sans(Q)_n - lambda^(- 1) T_n^(*) T_n$ is self-adjoint and idempotent. It has image in $"im" sans(Q)_n ∩ ker T_n$ and is the identity on that subspace. This is the projection (7.4), completing the induction.
  It remains to prove that $cal(E)_n$ vanishes for some $n$. The endpoint-dimension recurrence below will give that finite path bound. Let $sans(d)_n \( i \, j \)$ be the dimension of $cal(E)_n$ with endpoints $i \, j$. Extending a path of length $n - 1$ by one edge makes the endpoint-dimension matrix of $"im" sans(Q)_n$ equal to $sans(d)_(n - 1) sans(B)$. The restricted surjection $T_n : "im" sans(Q)_n arrow.r cal(E)_(n - 2)$ preserves endpoints and has kernel $cal(E)_n$. Hence, for $2 lt.eq n < h$,
  $ sans(d)_n = sans(d)_(n - 1) sans(B) - sans(d)_(n - 2) \, #h(2em) sans(d)_0 = I \, quad sans(d)_1 = sans(B) . $
  Multiplication by $mu$ and induction give $sans(d)_n mu = \[ n + 1 \] mu$. In particular, the recursion is valid at $n = h - 1$. No denominator $\[ h \]$ has been used. Since $pi lt.eq h theta < pi + theta < 3 pi \/ 2$,
  $ 0 lt.eq sans(d)_(h - 1) mu = \[ h \] mu lt.eq 0 . $
  The entries of $sans(d)_(h - 1)$ are nonnegative and $mu$ is strictly positive. It follows that $sans(d)_(h - 1) = 0$, and therefore $cal(E)_(h - 1) = 0$. The same equality also forces $\[ h \] = 0$; no classification of the graph was needed.
  In finite-dimensional inner product spaces,
  $ cal(E)_n^perp = sum_(i = 1)^(n - 1) "im" \( c_i^(\( n \)) \)^(*) . $
  Thus every individual path of length $h - 1$ is a linear combination of insertions of (7.1). Evaluate such an identity on the coefficient maps, starting at any fixed cochain placement in the prescribed interval. Each inserted relation is then a valid length-two part of $d^2 = 0$ at the corresponding placement. The coefficient maps may depend on the placement; no translation invariance of them is required. The entire composition vanishes.
  For a connected component without an edge, use the bound $N = 1$. There are finitely many components; take the maximum of their bounds. A longer path factors through an initial segment of the relevant vanishing length, and no path crosses components. The empty set $Y$ is vacuous and may also be assigned $N = 1$. ◻
]

=== 7.2 Two height bounds force a gap <two-height-bounds-force-a-gap>

Fix now a nonempty spherical $Y subset.eq S$ and $x in A$. Write $H^(p \, u) \( e_alpha E \)$ for the cohomology in ordinary cochain degree $p$ and internal degree $u$. For $a in A_Y$, define the total test height

#[#set math.equation(numbering: n => "(7.5)")
 $ h \( a \) = max { p + u : H^(p \, u) \( e_alpha E_L \( a x \) \) eq.not 0 upright(" for some ") alpha in tilde(Y) \, L } \, $ <sph:eq:height>]

with value $- oo$ if all these tests vanish. There are finitely many labels and vertices, and all the complexes are bounded, so this maximum is finite whenever it is nonempty. For the moment suppose that $h \( 1 \)$ is finite. Lemma 18 shows that it remains finite and nondecreasing under positive words in $A_Y^(+)$.

#thm([Lemma 7.2.])[
  #emph[Suppose that all tests on $tilde(Y)$ in a bounded family have ordinary cochain cohomology in degrees at most $m$. Positive operations in $Y$ preserve this bound. After a positive word containing every color of $Y$, the bound improves to $m - 1$.]
] <sph:cochain-drop>

#proof[
  For an acted vertex, Lemma 15 gives the test shift $chevron.l 2 chevron.r \[ 1 \]$, which lowers the ordinary cochain bound by one. At an unacted vertex $beta$, applying the vertex test to the evaluation cone gives a triangle
  $ xor.big_(alpha in accent({ i }, ̃)) e_beta P_alpha ⊗_(bb(C)) e_alpha E arrow.r e_beta E arrow.r e_beta F_i E . $
  When $beta$ is adjacent to color $i$, the first term is a sum of acted tests shifted only in internal degree, because each $e_beta P_alpha$ is an arrow space. It consequently has ordinary cochain cohomology at most $m$. The long exact sequence gives zero above $m$ for the new test and a surjection
  $ H_(upright("coch"))^m \( e_beta E \) arrow.r H_(upright("coch"))^m \( e_beta F_i E \) \, $
  where each group retains its internal grading. For a nonneighbor the first term vanishes and the test is unchanged.
  Thus once cohomology at degree $m$ has vanished at a vertex, later operations at other colors cannot restore it: the later groups in that degree are quotients of zero. Another operation at its own color still gives zero in degree $m$, using the bound above $m$. After every color has been operated, degree $m$ has vanished everywhere. The vertices of a single color are pairwise nonadjacent, so the simultaneous color operation satisfies the same conclusions. ◻
]

#thm([Lemma 7.3.])[
  #emph[Let a minimal bounded projective complex have generator levels in $\[ d_1 \, d_2 \]$. Suppose that on an integer cochain interval $\[ l \, r \]$ all its generators lie in $tilde(Y)$, and all vertex tests on $tilde(Y)$ have zero cohomology in each ordinary cochain degree in this interval, in every internal degree. With $N = N \( Y \)$ from Lemma 49, there are no generators at any placement 
$ l + N \( d_2 - d_1 + 1 \) lt.eq p lt.eq r . $

]
] <sph:empty-placement>

#proof[
  Fix a vertex and a generator coefficient in layer $d_2$ at placement $p$, with $l < p lt.eq r$. Multiplying its projective generator by its token gives a cycle in the corresponding vertex test. Every differential entry is of positive path length and every product of a token with such an entry is zero. The tested cohomology vanishes at $p$, so this token coefficient is a boundary from placement $p - 1$.
  Project such a boundary onto its token coefficient space. A length-one differential entry can contribute only through an opposite arrow in the test, giving an incoming arrow-coefficient image from the same layer. A length-two entry can contribute only through a unit path, and its source generator would lie in layer $d_2 + 1$. This latter layer is absent. These exhaust the possibilities, since minimality excludes length-zero entries. The perfect opposite-arrow pairing therefore shows that the full coefficient space at placement $p$ is spanned by incoming arrow-coefficient images at $p - 1$.
  For $p gt.eq l + N$, iterate this spanning assertion $N$ times. Every path involved has its placements in $\[ l \, r \]$, so Lemma 49 makes its coefficient composition zero. Layer $d_2$ is therefore empty for $l + N lt.eq p lt.eq r$.
  Proceed downward through the layers. Suppose that the higher layers have already been removed on $\[ l + j N \, r \]$. For layer $d_2 - j$ and $p > l + j N$, a possible token source from the next higher layer at $p - 1$ is absent on that interval. The same argument expresses the coefficient space by incoming arrows, and then by $N$-step paths. It removes this layer on $\[ l + \( j + 1 \) N \, r \]$. The successive conclusions are
  $ upright("layer") & upright("interval proved empty")\
d_2 & \[ l + N \, r \]\
d_2 - 1 & \[ l + 2 N \, r \]\
dots.v & dots.v\
d_1 & \[ l + N \( d_2 - d_1 + 1 \) \, r \] . $
  On the last interval every possible generator layer has been removed, proving the assertion. ◻
]

#thm([Proposition 7.4.])[
  #emph[Assume $h \( 1 \) > - oo$. There is no sequence 
$ a_0 = 1 \, #h(2em) a_(k + 1) = w_k a_k \, #h(2em) w_k in A_Y^(+) \, quad "supp" \( w_k \) = Y \, $

 for which the integers $h \( a_k \)$ have a common upper bound.]
] <sph:no-chain>

#proof[
  Suppose that $h \( a_k \) lt.eq h_(*)$ for all $k$. Choose a common lower bound $d_1$ on the generator levels of the initial family $E_L \( x \)$. Positive amplitude, Lemma 15 and the bounded-layer formalism of Lemma 11, preserves this bound at every stage.
  All generator placements outside $Y$ are fixed by the family properties in Proposition 10. Let $d_(upright("ext"))$ be their largest occupied level. The exterior includes the unchanged f generator at placement $\( 0 \, 0 \)$, so this is defined. If a current global highest layer has degree $d > d_(upright("ext"))$, it is supported entirely in $tilde(Y)$. A nonzero such layer has a nonzero top: incoming coefficient maps increase cochain placement in a finite array and cannot generate a nonzero array indefinitely. Lemma 14 then gives a nonzero test in total degree $d + 2$. It follows that every current generator has level in the fixed interval
  $ \[ d_1 \, d_2 \] \, #h(2em) d_2 = max \( d_(upright("ext")) \, h_(*) - 2 \) . $
  By Lemma 50, the common upper bound on ordinary cochain test cohomology drops by at least one at every step $a_k arrow.r a_(k + 1)$. It therefore tends to $- oo$. Let $p_(upright("ext"))$ be the least exterior generator cochain placement, over the initial finite family. It is fixed, and $p_(upright("ext")) lt.eq 0$ because of the f generator. Set
  $ N = N \( Y \) \, quad K_0 = N \( d_2 - d_1 + 1 \) \, quad r = p_(upright("ext")) - 1 \, quad l = r - K_0 . $
  At a sufficiently late stage all tested cohomology on $tilde(Y)$ lies in cochain degrees strictly below $l$. Every generator in $\[ l \, r \]$ lies in $tilde(Y)$, since $r < p_(upright("ext"))$. Lemma 51 consequently shows that every member of the family has no term at cochain placement $r = l + K_0$.
  Some member nevertheless has nonzero test cohomology, by positive height monotonicity from $h \( 1 \) > - oo$. For that member there is a term in a cochain degree below $l$, while its unchanged f generator is in degree $0 > r$. The absent term in degree $r$ splits its minimal complex into two nonempty bounded minimal complexes, one on either side of that degree. Neither summand is contractible. Indeed a contracting homotopy would express its identity as $d h + h d$; every component of the latter lies in the additive radical because all entries of $d$ do. Reduction modulo the radical would give a nonzero identity equal to zero. This contradicts the indecomposability of $E_L \( a_k x \)$ from Proposition 10. ◻
]

=== 7.3 Positive extensions and a proper support <positive-extensions-and-a-proper-support>

#thm([Lemma 7.5.])[
  #emph[For $a \, b in A_Y$, there are $p \, q in A_Y^(+)$ and $u in A_Y$ such that 
$ u = p a = q b \, #h(2em) h \( u \) lt.eq max \( h \( a \) \, h \( b \) \) . $

 The same upper bound holds for a common positive left extension of any finite family.]
] <sph:common-extension>

#proof[
  The finite-type fraction property in Theorem 5 first gives $u = p a = q b$ with $p \, q$ positive. Whenever $p$ and $q$ have a common left atom, write $p = sigma_i p'$, $q = sigma_i q'$ and cancel it. This replaces the common extension by $p' a = q' b$. The sum of positive lengths decreases by two, so the process terminates with no common left atom.
  Suppose the resulting extension satisfies $h \( u \) > max \( h \( a \) \, h \( b \) \)$. Choose one label $L$ and one unfolded vertex $alpha in tilde(Y)$ attaining $h \( u \)$ for $E_L \( u x \)$. For this same family member, its starting test height on each side is smaller than $h \( u \)$. If one starting set of tests vanished, persistence of vanishing under positive words would contradict the final nonzero test. Otherwise Lemma 19 applies to each side. It makes $alpha$ a left divisor of both unfolded positive words.
  Lemma 29 reflects this divisibility to a common original color. In its right-divisor form this lemma is transferred to left divisors by word reversal: every Artin braid relation is preserved by reversal, and a color unfolds to a product of commuting letters whose reversal represents the same element. Thus the original positive elements $p \, q$ have a common left atom, a contradiction. This proves the stated inequality. Repeated pairwise application constructs a common extension of any finite family, with height no larger than the maximum of its starting heights. ◻
]

Positive support is well defined on $A_Y^(+)$: the positive monoid embeds, and every positive Artin relation preserves the set of colors occurring in a word. In particular, the support of a positive divisor is contained in the support of the element it divides.

#thm([Lemma 7.6.])[
  #emph[Assume $h \( 1 \) > - oo$, and put $h_0 = h \( 1 \)$. There exist $p in A_Y^(+)$ with $h \( p \) lt.eq h_0$ and one proper subset $J subset.neq Y$ such that 
$ b in A_Y^(+) \, quad h \( b p \) lt.eq h_0 quad arrow.r.double quad "supp" \( b \) subset.eq J . $

]
] <sph:proper-support>

#proof[
  If no such $p$ existed, then for every positive $p$ with $h \( p \) lt.eq h_0$ the union of supports of all its permitted continuations would equal $Y$. For each color $i in Y$, choose a continuation $b_i$ whose support contains $i$ and for which $h \( b_i p \) lt.eq h_0$. Lemma 53 gives a common positive left extension of these endpoints:
  $ u = c_i b_i p quad \( i in Y \) \, #h(2em) c_i in A_Y^(+) \, #h(2em) h \( u \) lt.eq h_0 . $
  Cancelling $p$ shows that $w = u p^(- 1) = c_i b_i$ is a positive element independent of $i$. Every $b_i$ is a right divisor of $w$, so $"supp" \( w \) = Y$. This constructs a new positive endpoint $w p$ with height at most $h_0$. At every intermediate letter of this operation the height also stays at most $h_0$, by positive monotonicity.
  Starting from $p = 1$ and repeating gives an infinite sequence forbidden by Proposition 52. Therefore some $p$ has a proper union of the supports of all its permitted continuations. Take $J$ to be precisely that union. This establishes one common proper subset, not merely a separately missing color for each continuation. ◻
]

#thm([Proposition 7.7.])[
  #emph[Let $Y subset.eq S$ be spherical and $x in A$. For the family stabilizer 
$ H \( Y \, x \) = { s in A_Y : E_L \( s x \) tilde.eq E_L \( x \) upright(" for every ") L } \, $

 one of the following holds:]
  + #emph[all tests on $tilde(Y)$ at $x$ are acyclic and $H \( Y \, x \) = A_Y$;]
  + #emph[there exist $p in A_Y^(+)$ and $J subset.neq Y$ such that 
#[#set math.equation(numbering: n => "(7.6)")
 $ H \( Y \, x \) subset.eq p^(- 1) A_J p . $ <sph:eq:containment>]

]
] <sph:containment>

#proof[
  Suppose first that some test is nonzero. Use $p \, J$ from Lemma 54. For $s in H \( Y \, x \)$, the equivalences of family members are preserved by every prefix of the action. In particular
  $ h \( p s \) = h \( p \) \, #h(2em) h \( b p s \) = h \( b p \) quad \( b in A_Y^(+) \) . $
  Apply Lemma 53 to $p \, p s$, obtaining
  $ a p = b p s \, #h(2em) a \, b in A_Y^(+) \, #h(2em) h \( a p \) = h \( b p s \) lt.eq h \( p \) lt.eq h_0 . $
  Thus $a$ is a permitted continuation of $p$. The equality $h \( b p \) = h \( b p s \)$ shows that $b$ is also permitted. Both have support in $J$, so
  $ s = p^(- 1) b^(- 1) a p in p^(- 1) A_J p . $
  This proves (7.6).
  If all the tests are acyclic, the evaluation term for each positive color twist is a bounded acyclic complex of graded vector spaces tensored with projectives. It is contractible, since a bounded acyclic vector-space complex splits degreewise, in each internal degree. The evaluation cone is consequently equivalent to the original family member. Every positive generator fixes the family, and its inverse fixes it as well by applying the inverse equivalence. The generators therefore give $H \( Y \, x \) = A_Y$. This argument includes $Y = diameter$, when there are no tests and the group is trivial. ◻
]

== 8 Stabilizers and parabolic intersections <sec:stabilizers>

We now combine the two containment arguments. Throughout this section, $X subset.eq S$ and its relative family are fixed. The element $x in A$ is arbitrary; in particular, it need not belong to the subgroup that is currently acting.

#thm([Lemma 8.1.])[
  (Conjugating a stabilizer).  #emph[Let $D subset.eq Y subset.eq S$ and $b in A_Y$. If $H \( Y \, x \) subset.eq b^(- 1) A_D b$, then 
$ b H \( Y \, x \) b^(- 1) = H \( D \, b x \) . $

]
] <stab:conjugation>

#proof[
  For $c in A_D$, invertibility of $B_b$ gives
  $ E_L \( c b x \) tilde.eq E_L \( b x \) quad upright("for all ") L quad arrow.l.r.double quad E_L \( b^(- 1) c b x \) tilde.eq E_L \( x \) quad upright("for all ") L . $
  Since $b^(- 1) c b in A_Y$, the right side says that $b^(- 1) c b in H \( Y \, x \)$. Thus $H \( D \, b x \) = A_D ∩ b H \( Y \, x \) b^(- 1)$. The assumed containment removes the intersection. ◻
]

#thm([Theorem 8.2.])[
  (Relative stabilizers are parabolic).  #emph[For every $Y subset.eq S$ and $x in A$, there exist $R subset.eq Y$ and $c in A_Y$ such that 
$ H \( Y \, x \) = c^(- 1) A_R c . $

]
] <stab:parabolic>

#proof[
  We induct on $\| Y \|$, allowing every $x in A$ at every rank. The assertion is immediate for $Y = diameter$. By Lemma 56, it suffices to place $H \( Y \, x \)$ inside $b^(- 1) A_D b$ for some $b in A_Y$ and proper $D subset.neq Y$: the conjugated stabilizer is then $H \( D \, b x \)$, to which induction applies.
  Suppose first that $Y$ is spherical. If all its tests on the family at $x$ are acyclic, every generator in $Y$ fixes every member, so $H \( Y \, x \) = A_Y$. Otherwise Proposition 55 gives the required proper-type containment.
  Now suppose that $Y$ is nonspherical. Choose a minimum vertex $P = \( T \, A_T z \)$ of the relative harmonic filtration of $A_Y x$. Let $K$ be its invisible set and put $T_(+) = T \\ K$, as in Section 6. Proposition 48 gives
  $ x^(- 1) H \( Y \, x \) x subset.eq z^(- 1) A_D z \, #h(2em) D = T_(+) union K subset.eq Y . $
  Since $z in A_Y x$, the element $b = z x^(- 1)$ belongs to $A_Y$, and this is exactly $H \( Y \, x \) subset.eq b^(- 1) A_D b$. If $D eq.not Y$, the induction step is complete.
  It remains to treat $D = Y$. The sets $T_(+)$ and $K$ are disjoint and nonadjacent, and $T_(+)$ is spherical because it is a subset of $T$. We claim that the entire $K$-factor fixes the family at $x$.
  Let $j in.not Y$ be an exterior neighbor of $K$. At every recorded level, the definition of $K$ makes its harmonic coordinate zero. Outside $Y$ these coordinates are actual generator counts, fixed throughout $A_Y x$. The cutoff was chosen at or below #emph[every] occupied exterior level, so there are no generators of color $j$ at any level, for any member of the family at any $w in A_Y x$. There is also no edge from $K$ to $T_(+) = Y \\ K$. If a member $E_L \( w \)$ had a generator in $K$, its connected color support, which contains $f in.not Y$, would have to cross an exterior neighbor of $K$. We have just excluded every such generator. This applies in particular at $w = x$: the family there has no generators in $K$ or any of its neighbors, even at levels below the cutoff.
  Every test at a color of $K$ is therefore zero termwise. The evaluation cone shows that its positive generator fixes each member, and its inverse does so as well. The Artin presentation and standard embedding give
  $ A_Y = A_K times A_(T_(+)) \, #h(2em) H \( Y \, x \) = A_K times H \( T_(+) \, x \) . $
  Since $Y$ is nonspherical, the spherical subset $T_(+)$ is proper. Induction supplies $R subset.eq T_(+)$ and $c in A_(T_(+))$ with $H \( T_(+) \, x \) = c^(- 1) A_R c$. Commutation with $A_K$ now gives
  $ H \( Y \, x \) = c^(- 1) \( A_K times A_R \) c = c^(- 1) A_(K union R) c . $
  This also covers $T_(+) = diameter$. ◻
]

#thm([Proposition 8.3.])[
  (The initial stabilizer).  #emph[The relative family associated with $X$ satisfies $H \( S \, 1 \) = A_X$.]
] <stab:initial>

#proof[
  Every color of $X$ is nonadjacent to $f$. Its evaluation on every $P_(f \, L)$ is zero, so its twist fixes that projective. This proves $A_X subset.eq H \( S \, 1 \)$.
  Consider the filtration for $Y = S$ and $x = 1$. The empty-type vertex $P_0 = \( diameter \, { 1 } \)$ has only one nonzero layer vector, namely the unit vector at $f$ in level zero. This vertex has minimum height. Indeed a competitor with any nonzero higher block is later. At level zero, every competitor retains the exterior coordinate $p_f^0 = 1$, and all coordinates are nonnegative. Its coordinate sum is therefore at least one. Equality forces its entire vector to be the unit vector at $f$, and then every closed-type sign coordinate is zero, since the type lies in $S$. Every lower block of $P_0$ is zero and is least.
  At this minimum $T_(+) = diameter$. A color of $S$ is invisible precisely when it is nonadjacent to $f$, so $K = X$. Applying Proposition 48 with $z = x = 1$ gives $H \( S \, 1 \) subset.eq A_X$. ◻
]

#proof[
  Simultaneous conjugation reduces the assertion to the intersection $A_X ∩ x^(- 1) A_Y x$, with $x in A$. For $a in A_Y$, invertibility of $B_x$ and Proposition 58 give
  $ x^(- 1) a x in A_X & med arrow.l.r.double med E_L \( x^(- 1) a x \) tilde.eq E_L \( 1 \) quad upright("for every ") L\
 & med arrow.l.r.double med E_L \( a x \) tilde.eq E_L \( x \) quad upright("for every ") L\
 & med arrow.l.r.double med a in H \( Y \, x \) . $
  Consequently
  $ A_X ∩ x^(- 1) A_Y x = x^(- 1) H \( Y \, x \) x . $
  By Theorem 57, write $H \( Y \, x \) = c^(- 1) A_Z c$ with $Z subset.eq Y$ and $c in A_Y$. The displayed intersection is then $\( c x \)^(- 1) A_Z \( c x \)$, hence is parabolic. Conjugating back proves the assertion for the originally specified $g$ and $h$. ◻
]

=== 8.1 Parabolic closure and dynamics <sec:consequences>

The inside-parabolic description obtained above makes the rank decrease in an intersection explicit. We use it to prove the introductory consequences, then record the fixed-point and continuity implications.

#proof[
  If $Q = g A_Y g^(- 1)$ and $P = h A_X h^(- 1)$, put $x = g^(- 1) h$. The proof of Theorem 1 and Theorem 57 give
  $ Q ∩ P = g c^(- 1) A_R c g^(- 1) quad upright("for some ") R subset.eq Y upright(" and ") c in A_Y . $
  If this intersection is strictly smaller than $Q$, then $R eq.not Y$, since conjugation by $c in A_Y$ preserves $A_Y$. Thus a strict intersection step decreases the size of the displayed defining set.
  Start with $Q = A = A_S$ and no selected members of $cal(F)$. Whenever $Q$ is not contained in some $P in cal(F)$, replace $Q$ by $Q ∩ P$ and select that member. The preceding strict decrease permits at most $\| S \|$ steps. The resulting $Q$ is contained in every member of $cal(F)$ and is the intersection of the selected subfamily, proving the displayed equality and parabolicity. Finally, the family of parabolics containing $E$ is nonempty because it contains $A$; its intersection is the unique smallest such subgroup. ◻
]

#proof[
  In the presentation graph in which every finite label is an edge, the infinite-label pair gives the visual splitting over $A_(S \\ { s \, t })$ of #cite(label("CharneyMartinMorrisWright2026")) Definition 2.4. Theorem 1 makes intersections of two conjugates of this edge group parabolic in $A$. Hence #cite(label("CharneyMartinMorrisWright2026")) Theorem 3.2 gives acylindrical hyperbolicity and weak malnormality of the edge group, and #cite(label("CharneyMartinMorrisWright2026")) Proposition 4.2 gives weak malnormality of every proper parabolic.
  The finite intersection supplied by weak malnormality is parabolic by Theorem 1. A nontrivial parabolic contains a conjugate of some $sigma_s$, which has infinite order: the exponent-sum homomorphism $A arrow.r bb(Z)$ sends every standard generator to $1$. Thus a finite parabolic is trivial, giving the stated witness. ◻
]

=== 8.2 Fixed-point subgroups and locally compact groups <sec:fixed-point-consequences>

A parabolic subgroup is #emph[complete] if it is conjugate to $A_T$ for a set $T$ with no infinite label; it need not be spherical. A group has property $upright("FA")'$ if, in every simplicial action on a tree without inversions, each element fixes a vertex. A locally compact Hausdorff group $L$ is #emph[almost connected] if $L \/ L^compose$ is compact. A discrete group is #emph[lcH-slender] if every abstract homomorphism into it from a locally compact Hausdorff group is continuous.

#thm([Corollary 8.4.])[
  (Reduction to complete parabolics).  #emph[Let $A = A_M$ with $S$ finite.]
  + #emph[Every subgroup of $A$ with property $upright("FA")'$ lies in a complete parabolic subgroup.]
  + #emph[Every abstract homomorphism $L arrow.r A$ from an almost-connected locally compact Hausdorff group has image in a complete parabolic.]
  + #emph[If every complete standard parabolic of $A$ is lcH-slender, then $A$ is lcH-slender.]
] <cor:complete-parabolics>

#proof[
  Theorem 1 places $A$ in the class of groups whose parabolics are closed under pairwise intersections. Apply #cite(label("MoellerParisVarghese2024")) Proposition 1.3 and Theorem 1.7. ◻
]

=== 8.3 Faithfulness and effective membership <sec:algorithms>

The unit-label projective already detects membership in $A_X$. Indeed, label compatibility in Proposition 10 and the initial stabilizer calculation give

#[#set math.equation(numbering: n => "(8.1)")
 $ B_w P_(f \, upright(bold(1))) tilde.eq P_(f \, upright(bold(1))) quad arrow.l.r.double quad w in A_X . $ <stab:single-detector>]

For the forward implication, tensoring labels by each simple $L$ gives $B_w P_(f \, L) tilde.eq P_(f \, L)$, so Proposition 58 applies. The reverse implication follows from the same proposition. In particular, for $X = diameter$ the constructed action is faithful: an element acting by the identity functor fixes $P_(f \, upright(bold(1)))$ and is therefore the identity of $A$. This is the action for our framed, per-edge-labelled algebra; the faithfulness question for the original unframed construction of #cite(label("HengLicata2024")) Conjecture 7.10 concerns a different category.

To make (8.1) an algorithm, we must compute in the chosen algebra exactly. The related twist-group algorithm of #cite(label("HengLicata2024")) Proposition 7.11 also uses Gaussian elimination. We give the coefficient-field construction here, so finite-dimensionality over $bb(C)$ is not being used as an effectiveness assumption.

#proof[
  Fix the supplied $M$ and $X$, and use their relative construction. Let $N$ be the least common multiple of the integers $2 m$ for finite edge labels $m gt.eq 4$, and take $K = bb(Q) \( exp \( 2 pi i \/ N \) \)$; take $K = bb(Q)$ if there is no such label. Then $K$ contains every parameter $q_m = exp \( pi i \/ m \)$. This field and its exact arithmetic are computable from the finite matrix $M$.
  We realize each Temperley–Lieb–Jones factor in its planar model. Loop-free pairing diagrams give finite bases for each required underlying planar morphism space; stacking diagrams evaluates every closed loop as $q_m + q_m^(- 1)$. The Jones–Wenzl recursion computes the simple idempotents $p_0 \, dots.h \, p_(m - 2)$ over $K$, with nonzero denominators in this range #cite(label("Chen2014")) Definition 2.1.1, Remark 2.1.3, and Theorem 2.3.2. Negligible maps are kernels of finite trace-pairing matrices, so their quotient spaces and basis reductions are obtained by exact linear algebra. For idempotents $p \, q$, their corner morphism space is the image of $f mapsto q f p$ in that quotient #cite(label("Chen2014")) Definition 2.4.1, Lemma 2.4.3, and Definition 5.2.1. Composition, tensoring and pivotal evaluation are consequently computable in these finite diagram spaces. These finite kernels, quotients and corner images commute with scalar extension to $bb(C)$, recovering the model used in Section 2.
  The known simple list also makes decomposition effective. For any object $U$ needed in a product, compute bases of $"Hom" \( p_a \, U \)$ and $"Hom" \( U \, p_a \)$. Their composition pairing takes values in $"End" \( p_a \) = K$ and is nondegenerate; invert its matrix to obtain dual inclusions and projections. The sum of the resulting simple-block projections is $upright("id")_U$, by the complete semisimple decomposition of #cite(label("Chen2014")) Theorems 5.4.4–5.4.5. These identities hold over $K$: they hold after extension to $bb(C)$, and scalar extension is faithful. Thus no search for an unspecified categorical decomposition is required. Finite products of the factors and direct sums are handled by tensor products and matrices of these maps.
  It follows that every space $"Hom" \( L \, D_(i j)^a ⊗ H \)$ and every multiplication map defining $Z$ has computable structure constants over $K$. Let $Z_K$ denote this finite algebra. Its trace weights belong to $K$, and matrix inversion computes trace-dual bases, hence the coevaluation maps as well as the evaluation maps. All terms and differentials of $B_i \, D_i$ are now explicit over $K$. Unnormalized planar bases suffice; the square-root normalization used only in the proof of Lemma 49 is not needed for this construction.
  Given the input words $u \, v$, form the word $w = u^(- 1) v u$ and compute the bounded projective complex $B_w P_(f \, upright(bold(1)))$ by finite tensor products. Cancel invertible scalar differential entries between equal shifted projectives until none remain, as in Section 3. Each cancellation uses exact arithmetic in $K$ and removes two summands, so the process terminates.
  The positive-path-length ideal of $Z_K$ is nilpotent and its quotient is a product of copies of $K$. It is therefore the radical, and it remains the radical after extension to $bb(C)$. The computed minimal complex stays minimal under that extension. By uniqueness of minimal models, it is equivalent over $bb(C)$ to $P_(f \, upright(bold(1)))$ precisely when its only generator is that projective in placements $\( 0 \, 0 \)$. This is a finite check of its summands; when it succeeds there is no differential left. Equation (8.1) identifies success with $w in A_X$, equivalently $v in u A_X u^(- 1)$. Taking $X = diameter$ decides whether a word is the identity, and applying this test to the quotient of two words decides their equality. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
