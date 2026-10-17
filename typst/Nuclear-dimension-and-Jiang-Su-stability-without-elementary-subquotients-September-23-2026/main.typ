#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Nuclear dimension and Jiang--Su stability \
without elementary subquotients]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Nuclear dimension and Jiang–Su absorption describe two forms of regularity in a nuclear $C^(*)$-algebra. Nuclear dimension counts the order-zero pieces needed in finite-dimensional completely positive approximations; an order-zero map preserves orthogonality of positive elements. Jiang–Su stability means an isomorphism $A tilde.equiv A ⊗ cal(Z)$, where $cal(Z)$ is the algebra introduced by Jiang and Su [14]. The first condition gives a bound on approximation complexity, while the second expresses invariance under tensoring with a fixed infinite-dimensional algebra. Their relationship connects noncommutative dimension with the structure and classification of nuclear $C^(*)$-algebras.

The obstruction to passing from finite dimension to absorption is already visible in a matrix algebra: it has nuclear dimension zero but does not absorb $cal(Z)$. The relevant exclusion must apply throughout the ideal structure. A $C^(*)$-algebra $A$ is #emph[nowhere scattered] if no quotient $I \/ J$, for closed two-sided ideals $J subset.eq I subset.eq A$, is a nonzero elementary algebra $cal(K) \( H \)$. This is equivalent to the absence of finite-dimensional irreducible representations in every hereditary subalgebra [28] Theorem 3.1.

#thm([Theorem 1.1.])[
  (Nonsimple nuclear regularity).  #emph[ Let $A$ be a separable nuclear complex $C^(*)$-algebra with no nonzero elementary ideal subquotients. The following conditions are equivalent:]
  + #emph[$dim_(upright("nuc")) \( A \) < oo$;]
  + #emph[$A tilde.equiv A ⊗ cal(Z)$;]
  + #emph[$dim_(upright("nuc")) \( A \) lt.eq 1$.]
] <thm:main>

The implication from finite nuclear dimension to absorption proves Conjecture (C1) of Robert and Tikuisis [23]. Together the two implications establish the nuclear-dimension equivalence in the nonsimple Toms–Winter regularity question of Schafhauser–Tikuisis–White [26] Section 22, Problem LXXV. Here and throughout, unadorned tensor products are spatial. The maximal tensor products used in the independent splitting theorem below carry an explicit subscript.

The companion [19] Corollaries 1.3 and 1.4 adds Cuntz-semigroup criteria to the main equivalence.

#thm([Corollary 1.2.])[
  (Regularity and Cuntz-semigroup criteria).  #emph[Under the hypotheses of Theorem 1, let $iota_A : A arrow.r A ⊗ cal(Z)$ be $iota_A \( a \) = a ⊗ 1_(cal(Z))$. The conditions of that theorem are also equivalent to each of the following:]
  + #emph[the canonical map $upright("Cu") \( iota_A \) : upright("Cu") \( A \) arrow.r upright("Cu") \( A ⊗ cal(Z) \)$ is an isomorphism in $upright(bold(C u))$;]
  + #emph[there is an abstract isomorphism $upright("Cu") \( A \) tilde.equiv upright("Cu") \( A ⊗ cal(Z) \)$ in $upright(bold(C u))$.]
  #emph[The abstract isomorphism need not be induced by a $*$-homomorphism.]
] <cor:regularity-cu>

The proof, including the nonunital naturality argument for the canonical map, follows the proof of Theorem 1 in Section 9.1.

The dimension construction has a broader formulation, without a separate assumption on elementary subquotients.

#thm([Theorem 1.3.])[
  (Sharp bound after Jiang–Su absorption).  #emph[For every separable nuclear complex $C^(*)$-algebra $A_0$, 
$ dim_(upright("nuc")) \( A_0 ⊗ cal(Z) \) lt.eq 1 . $

]
] <intro:main>

The bound is optimal uniformly over this class. Nuclear dimension zero for a separable algebra implies the AF property [34] Remarks 2.2(iii), whereas $cal(Z)$ is unital and infinite-dimensional with no projections other than $0$ and $1$. Thus $dim_(upright("nuc")) \( cal(Z) \) = 1$.

The absorption implication uses a separate theorem. A positive element is #emph[full] if it generates the whole ambient algebra as a closed two-sided ideal, and a #emph[character] is a nonzero $*$-homomorphism to $bb(C)$.

#thm([Theorem 1.4.])[
  (Full signs in a finite maximal tensor power).  #emph[For every nonzero unital complex $C^(*)$-algebra $D$ with no characters, there is a finite integer $n gt.eq 1$ such that $D^(⊗_max n)$ contains two full orthogonal positive elements.]
] <thm:tensor-intro>

No separability or nuclearity is assumed in this theorem. Its finite conclusion answers affirmatively Kirchberg and Rørdam’s Question 6.2 [17], which asks for this splitting property in the infinite maximal tensor power. The passage to the infinite power is by its canonical unital inclusion, which preserves fullness and orthogonality.

The companion [20] Theorems 1.1 and 1.2 obtains another finite endpoint under the same hypotheses on $D$: for some $m gt.eq 1$, there is a unital $*$-homomorphism from the prime dimension-drop algebra $I \( 2 \, 3 \)$ to $D^(⊗_max m)$. For every free ultrafilter $omega$ on $bb(N)$, it also proves that a nonzero unital separable complex $C^(*)$-algebra $A$ is $cal(Z)$-stable exactly when its norm central-sequence algebra $A_omega ∩ A'$ has no characters. The proof below uses only the full-sign endpoint of Theorem 4.

=== 1.1 Background and the two obstacles <background-and-the-two-obstacles>

Winter and Zacharias introduced nuclear dimension as a noncommutative covering dimension and established its basic permanence properties [34]. Their order-zero structure theorem [33] makes a colour into a homomorphism multiplied by a commuting positive weight. Toms and Winter’s theory of strongly self-absorbing algebras [31] explains why absorption can supply commuting tensor factors without changing the isomorphism class. In the simple setting, Matui–Sato proved that a unital separable simple nuclear quasidiagonal algebra with a unique trace has decomposition rank at most one after tensoring with the universal UHF algebra [18] Theorem 4.2. Decomposition rank requires the same order-zero decomposition as nuclear dimension, together with contractivity of the entire return map; its bounds therefore also bound nuclear dimension. Sato–White–Winter established the bound three for separable unital simple nuclear $cal(Z)$-stable algebras with a unique trace [25] Theorem B. The two-coloured classification work of Bosa–Brown–Sato–Tikuisis–White–Winter obtained nuclear dimension one for non-AF separable unital simple nuclear $cal(Z)$-stable algebras whose trace simplex is nonempty and Bauer [3] Theorem F. Castillejos–Evington–Tikuisis–White–Winter removed the trace-boundary restriction in the unital case [7] Theorem B, and Castillejos–Evington treated the nonunital case [6] Theorem A.

Nonsimple antecedents reduce dimension in specific structural classes. Tikuisis–Winter proved decomposition rank at most two after $cal(Z)$-stabilization for algebras locally approximable by hereditary subalgebras of $C \( X \, cal(K) \)$, with $X$ compact Hausdorff [30] Theorem 4.1. Elliott–Niu–Santiago–Tikuisis extended the bound two to locally subhomogeneous $cal(Z)$-stable algebras [9] Theorem A. In the purely infinite direction, Szabó proved $dim_(upright("nuc")) \( A ⊗ cal(O)_oo \) lt.eq 3$ for every separable nuclear $A$ [27] Theorem 2.3. Bosa–Gabe–Sims–White then established nuclear dimension at most one for separable nuclear $cal(O)_oo$-stable algebras [4] Theorem A. Their homomorphism theorem gives the same bound for a nuclear $cal(O)_oo$-stable homomorphism from a separable exact domain to an arbitrary target [4] Theorem C.

The nonsimple dimension problem has an additional difficulty: a trace may be bounded on one ideal and infinite outside it, and stably finite and purely infinite ideal quotients may coexist. The appropriate trace cone therefore consists of all lower semicontinuous extended traces, as developed by Elliott–Robert–Santiago [10]. Our estimates are relative to the support rank of a spectral cut generating the ideal being tested. This rank measures the trace of the support, rather than the trace value of the cut itself. When it is finite, a relative estimate controls the error; rank zero forces the error rank to vanish. When it is infinite, a separate ideal-containment argument forces the comparison target to have infinite rank. The construction begins with the convex order-zero approximations of Hirshberg–Kirchberg–White [13], in the refinement of Brown–Carrión–White with asymptotically order-zero incoming maps [5]. It localizes them inside hereditary corners, and rounds their convex weights to obtain one matrix-valued order-zero return map.

The comparison stage uses two distinct forms of regularity. At each coordinate, exactness and $cal(Z)$-stability turn a uniform extended-rank gap into Cuntz comparison, using Rørdam’s almost-unperforation theorem [24] and Elliott–Robert–Santiago’s comparison criterion [10] Proposition 6.2. In the supported relative commutant of the ultrapower, we instead use abstract dimension functions. Gabe’s order-zero formulation [11] of the Kirchberg–Rørdam cone criterion [16] supplies finite compression sums from pointwise ideal containment. Packing these sums yields comparisons inside that commutant. Fullness, divisibility in a full corner, and almost unperforation verify a further hereditary-subalgebra condition. The unitary-equivalence criterion of Bosa–Brown–Sato–Tikuisis–White–Winter [3], which adapts Robert–Santiago’s positive-element classification method [22], turns the comparisons into two weighted conjugacies.

For the reverse implication, Winter proved that a separable simple unital nonelementary algebra of finite nuclear dimension absorbs $cal(Z)$ [32] Corollary 6.3. Tikuisis extended this to separable algebras of finite nuclear dimension with finitely many ideals and no elementary quotient of an ideal [29] Corollary 8.7. Robert–Tikuisis obtained further nonsimple cases under restrictions on the primitive ideal space and subquotients [23] Corollaries 7.11 and 7.16, and reduced absorption for separable algebras of finite nuclear dimension to the existence of two full orthogonal positive elements in the central sequence algebra [23] Theorem 1.2. Winter–Zacharias’s finite covering-number bound [34] Proposition 4.3 rules out characters in that algebra under the nowhere-scattered hypothesis. The remaining step is precisely a full splitting construction. Kirchberg and Rørdam isolated the character and tensor-splitting questions in [17]. Our finite tensor construction supplies the needed splitting by combining a uniform Gaussian sign estimate with pure-state excision. The latter is the method of Akemann–Anderson–Pedersen [1]; we include its short proof using Kadison transitivity [15].

Recent Cuntz-semigroup approaches provide a complementary perspective. Antoine–Perera–Thiel–Vilalta relate finite nuclear dimension and the Global Glimm Property to comparison and divisibility [2] Theorem 6.5; Perera–Thiel–Vilalta characterize absorption through the corresponding regularity of central sequence algebras [21] Theorem 3.6. Our reverse implication instead uses the finite covering bound and the full-sign theorem to meet the Robert–Tikuisis criterion directly.

=== 1.2 Proof overview <proof-overview>

The two implications are independent until the final assembly. Figure 1 records their interfaces.

For the dimension bound, we first work with a unital separable nuclear $A$, without absorption. In Section 3, quasicentral ideal cuts give finitely many families of hereditary pieces. The pieces are orthogonal within each fixed threshold family, and averaging the family compressions retains the prescribed tests. We fix the pieces and their comparison bounds by finite sums of ideal generators before choosing inner approximation errors. This ordering turns norm errors into bounds relative to the support ranks of those generators, uniformly over all traces for which the ranks are finite.

Section 4 places the matrix model in $A ⊗ cal(Z)_1 ⊗ cal(Z)_2 ⊗ cal(Z)_3$. The first $cal(Z)$ factor carries the model. In the norm ultrapower, a positive contraction $q$ identifies a part on which the model agrees with the original inclusion. The second factor supplies arbitrarily many orthogonal copies of a norm-one positive contraction. Relative trace estimates compare the error part with this common part, and a spare spectral cut bounds the comparison witnesses before they pass to the ultrapower.

Section 5 constructs a supporting map and uses approximate domination to pack the error into the common part. This controls dimension functions in a supported relative commutant without assuming that commutant exact. A full corner, its divisibility, and almost unperforation give the hereditary-subalgebra condition needed for unitary equivalence. The constant third factor supplies a full-spectrum positive contraction $k$. Functional-calculus comparison gives unitary conjugacies for the two weights $k$ and $1 - k$. Their sum gives exactly two colours for a corner inclusion. In Section 6, stabilization and hereditary permanence preserve those two colours, and unitization handles the nonunital algebra. This proves Theorem 3.

For absorption, Section 7 constructs a real tensor that takes both signs on every product of sufficiently separated pairs of unit vectors. A Hamming packing provides exponentially many weakly correlated Gaussian evaluations. Their failure probability decays fast enough to control a net of all admissible configurations. In Section 8, a finite commutator witness converts the absence of characters into uniform separation of pure-state expectation vectors. Excision transfers the tensor evaluations to every irreducible representation of the maximal tensor product. The positive and negative parts of the resulting selfadjoint element are therefore both full.

Finally, Section 9 uses the norm central sequence algebra $F \( A \)$, with its annihilator quotient in the nonunital case. Finite covering excludes characters; a separable characterless subalgebra containing $1_(F \( A \))$ has a finite tensor splitting by Theorem 4. Commuting reindexed copies give a unital homomorphism from that tensor power into $F \( A \)$. Fullness survives this map, so Robert–Tikuisis’s criterion gives absorption and completes Theorem 1.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[#strong[Dimension bound]
], table.cell(rowspan: 1, colspan: 1)[#strong[Absorption]
],
  table.cell(rowspan: 1, colspan: 1)[$A$ unital, separable, nuclear (later $A = tilde(A_0) ⊗ cal(Z)$)
], table.cell(rowspan: 1, colspan: 1)[$A$ separable, nowhere scattered, $dim_(upright("nuc")) \( A \) < oo$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
], table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[Localized matrix model; relative ranks and bounded witnesses
], table.cell(rowspan: 1, colspan: 1)[Finite covering makes $F \( A \)$ characterless; choose separable characterless $D subset.eq F \( A \)$ with $1_D = 1_(F \( A \))$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
], table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[Supported commutant comparison; hereditary condition and weights $k$, $1 - k$
], table.cell(rowspan: 1, colspan: 1)[Independent splitting theorem: every nonzero unital characterless $D$ has full orthogonal signs in some $D^(⊗_max n)$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
], table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[Two-colour corner approximation; stabilization and hereditary permanence
], table.cell(rowspan: 1, colspan: 1)[Reindex commuting copies to obtain $D^(⊗_max n) arrow.r F \( A \)$ unital; the full signs pass to $F \( A \)$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
], table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[$dim_(upright("nuc")) \( A_0 ⊗ cal(Z) \) lt.eq 1$
], table.cell(rowspan: 1, colspan: 1)[Robert–Tikuisis criterion: $A tilde.equiv A ⊗ cal(Z)$
],
)
]],
  caption: [Figure 1: The two proof branches. The left branch uses spatial tensor products, first constructs the unital model, and then passes to $A_0 ⊗ cal(Z)$ by hereditary permanence. The splitting theorem in the right column requires neither separability nor nuclearity of $D$; its application to $F \( A \)$ uses the displayed unital map. The branches meet only in the main equivalence. ],
) <fig:proof>

== 2 Preliminaries <sec:preliminaries>

We collect the approximation, comparison and diagonalization tools for the dimension bound, including comparison from a uniform rank gap for all lower semicontinuous extended traces. The central-sequence inputs for the independent absorption implication are stated in Section 9.

All $C^(*)$-algebras are complex. An unadorned tensor product is spatial; maximal tensor products are explicitly marked $⊗_max$. Representations are nondegenerate. We write $D_(+)$ for the positive cone of a $C^(*)$-algebra $D$, $tilde(D)$ for its unitization, and

$ "her"_D \( h \) = overline(h D h) quad \( h in D_(+) \) . $

For any subset $S subset D$, let $"Ideal"_D \( S \)$ denote the closed two-sided ideal generated by $S$; for $x in D$ we abbreviate $"Ideal"_D \( x \) = "Ideal"_D \( { x } \)$. The ambient algebra is omitted when it is clear. For $epsilon > 0$, $\( h - epsilon \)_(+)$ denotes the usual spectral cut. A full element is one generating the whole ambient algebra as a closed ideal. A nonzero $h in D_(+)$ is #emph[totally full] if $f \( h \)$ is full for every nonzero $f in C_0 \( \( 0 \, parallel h parallel \] \)_(+)$. For a subset $S$ of an ambient algebra, $S^perp$ consists of the elements annihilating $S$ on both sides.

=== 2.1 Order zero and finite-dimensional approximation <order-zero-and-finite-dimensional-approximation>

A completely positive contractive map is abbreviated to c.p.c. A completely positive map $sigma : D arrow.r E$ has order zero if $sigma \( a \) sigma \( b \) = 0$ whenever $a \, b in D_(+)$ and $a b = 0$. For a c.p.c. order-zero map $sigma$, the structure theorem of Winter–Zacharias [33] Theorem 3.3 and Corollaries 4.1–4.2 gives a $*$-homomorphism $sigma_(upright("hom"))$ and a commuting positive contraction $h$ in the multiplier algebra of $C^(*) \( sigma \( D \) \)$ such that

$ sigma \( a \) = h sigma_(upright("hom")) \( a \) . $

For $f in C_0 \( \( 0 \, 1 \] \)_(+)$, the formula $f \( sigma \) \( a \) = f \( h \) sigma_(upright("hom")) \( a \)$ defines an order-zero map into $E$, contractive when $parallel f parallel lt.eq 1$. We write $sigma^(1 \/ l)$ for $f \( t \) = t^(1 \/ l)$. In particular,

#[#set math.equation(numbering: n => "(2.1)")
 $ parallel sigma \( a \) sigma \( b \) parallel lt.eq parallel a b parallel quad \( a \, b in D \) \, #h(2em) sigma \( a \) sigma \( b \) = sigma \( 1 \) sigma \( a b \) quad upright("if ") D upright(" is unital") . $ <prelim:order-zero>]

The first inequality follows by writing the product as $h^2 sigma_(upright("hom")) \( a b \)$. Multiplication of a c.p.c. order-zero map by a positive contraction commuting with its entire range again gives a c.p.c. order-zero map.

#prodef([Definition 2.1.])[
  (Winter–Zacharias [34] Definition 2.1).  For an integer $d gt.eq 0$, a $C^(*)$-algebra $D$ has nuclear dimension at most $d$, written $dim_(upright("nuc")) \( D \) lt.eq d$, if for every finite $cal(F) subset D$ and $epsilon > 0$ there are finite-dimensional algebras $E_0 \, dots.h \, E_d$, a c.p.c. map $psi : D arrow.r xor.big_(j = 0)^d E_j$, and c.p.c. order-zero maps $phi_j : E_j arrow.r D$ such that
  $ ∥sum_(j = 0)^d phi_j psi_j \( a \) - a∥ < epsilon #h(2em) \( a in cal(F) \) . $
  The $d + 1$ summands are called colours. The sum of the return maps need not be contractive; each coloured return map must be contractive.
] <prelim:nuclear-dimension>

We use the following approximation theorem in hereditary subalgebras as well as in unital algebras.

#thm([Theorem 2.2.])[
  (Brown–Carrión–White).  #emph[For every separable nuclear $D$ there are finite-dimensional algebras $F_n$ and c.p.c. maps 
$ D arrow.r^(alpha_n) F_n arrow.r^(beta_n) D $

 such that $beta_n alpha_n arrow.r upright("id")_D$ in point-norm, $parallel alpha_n \( a \) alpha_n \( b \) parallel arrow.r 0$ for orthogonal $a \, b in D_(+)$, and each $beta_n$ is a finite convex combination of c.p.c. order-zero maps $F_n arrow.r D$.]
] <prelim:bcw>

The convex order-zero decomposition is due to Hirshberg–Kirchberg–White [13] Theorem 1.4; the asymptotic orthogonality refinement used here is [5] Theorem 3.1. In particular, the map induced by the $alpha_n$ in $product_n F_n \/ xor.big_n F_n$ is order zero, so

#[#set math.equation(numbering: n => "(2.2)")
 $ limsup_n parallel alpha_n \( a \) alpha_n \( b \) parallel lt.eq parallel a b parallel #h(2em) \( a \, b in D \) . $ <prelim:asymptotic-product>]

Nuclearity passes to hereditary subalgebras and to unitizations. A c.p.c. map from a separable nuclear algebra to a quotient has a c.p.c. lift by the Choi–Effros lifting theorem [8] Theorem 3.10. Every completely positive map from a nuclear algebra is nuclear, by composition with finite-dimensional approximations of its domain.

=== 2.2 Comparison and extended traces <comparison-and-extended-traces>

Write $cal(K)$ for the compact operators on a separable infinite-dimensional Hilbert space. For $u \, v in \( D ⊗ cal(K) \)_(+)$, write $u prec.tilde v$ if $s_n^(*) v s_n arrow.r u$ in norm for some $s_n in D ⊗ cal(K)$. Mutual comparison is Cuntz equivalence. The semigroup $upright("Cu") \( D \)$ consists of the resulting classes, with block-sum addition and the order induced by $prec.tilde$. Its subsemigroup $W \( D \)$ consists of classes represented in finite matrices over $D$. We use the following standard properties:

$ \[ u + v \] lt.eq \[ u \] + \[ v \] \, #h(2em) \[ u + v \] = \[ u \] + \[ v \] med upright("if ") u v = 0 \, #h(2em) \[ s^(*) s \] = \[ s s^(*) \] . $

Positive domination implies Cuntz comparison; elements of $"her" \( v \)_(+)$ are Cuntz below $v$. If $u in "Ideal" \( v \)_(+)$, then, for every $epsilon > 0$, there is $N < oo$ with $\[ \( u - epsilon \)_(+) \] lt.eq N \[ v \]$. Also

$ \[ u \] = sup_(epsilon > 0) \[ \( u - epsilon \)_(+) \] \, #h(2em) \[ \( u - epsilon \)_(+) \] lt.double \[ u \] \, $

where $x lt.double y$ means that any increasing sequence with supremum at least $y$ has a term dominating $x$. Spectral cuts are cofinal below $\[ u \]$ for this relation. Projection classes are compact, and if a projection $p$ is Cuntz below $v$, then $"her" \( v \)$ contains a projection Murray–von Neumann equivalent to $p$ (with matrix amplification when needed). These properties hold without simplicity or unitality; see [24] Section 4 and [10] Sections 2 and 4.

#thm([Lemma 2.3.])[
  (Finite compressions of a full element).  #emph[If $v in D_(+)$ is full and $D$ is unital, then there are $y_1 \, dots.h \, y_N in D$ such that 
$ sum_(l = 1)^N y_l^(*) v y_l = 1_D . $

]
] <prelim:full-compressions>

#proof[
  The ideal criterion above, applied to the projection $1_D$, gives $\[ 1_D \] lt.eq N \[ v \]$ for some $N$. A sufficiently accurate Cuntz approximation, compressed to the $1_D$ corner, gives $x_1 \, dots.h \, x_N in D$ with $parallel 1_D - sum_l x_l^(*) v x_l parallel < 1$. The positive element $z = sum_l x_l^(*) v x_l$ is invertible. Taking $y_l = x_l z^(- 1 \/ 2)$ gives the identity. ◻
]

A dimension function on $W \( D \)$ is an additive order-preserving map $d : W \( D \) arrow.r \[ 0 \, oo \]$ with $d \( 0 \) = 0$; no continuity is implicit. The semigroup is #emph[almost unperforated] when $\( m + 1 \) x lt.eq m y$ implies $x lt.eq y$, for $m in bb(N)$.

#thm([Theorem 2.4.])[
  (Rørdam’s comparison criterion).  #emph[If $D tilde.equiv D ⊗ cal(Z)$, then $W \( D \)$ is almost unperforated. More generally, if $W \( D \)$ is almost unperforated, $u \, v in D_(+)$, $u in "Ideal"_D \( v \)$, and 
$ d \( \[ u \] \) < d \( \[ v \] \) quad upright("for every dimension function ") d upright(" with ") d \( \[ v \] \) = 1 \, $

 then $u prec.tilde v$.]
] <prelim:comparison>

These are [24] Theorem 4.5 and Corollary 4.7. The second assertion uses abstract dimension functions, and requires neither exactness nor a trace-space hypothesis.

A lower semicontinuous extended trace on $D$ is an additive homogeneous map $tau : D_(+) arrow.r \[ 0 \, oo \]$ satisfying $tau \( x^(*) x \) = tau \( x x^(*) \)$ and norm lower semicontinuity. We allow traces that are not densely finite. Their extensions to finite matrices use the unnormalized matrix trace, and their extensions to the stabilization are understood. For a positive contraction $z$, put

$ d_tau \( z \) = lim_(l arrow.r oo) tau \( z^(1 \/ l) \) . $

Scaling a nonzero positive element to a contraction gives the same definition for arbitrary $z gt.eq 0$. We use $tau \( z \) lt.eq d_tau \( z \)$ for contractions and

#[#set math.equation(numbering: n => "(2.3)")
 $ d_tau \( \( z - eta \)_(+) \) lt.eq eta^(- 1) tau \( z \) #h(2em) \( eta > 0 \) . $ <prelim:trace-cut>]

The next lemma follows from Elliott–Robert–Santiago’s comparison criterion [10] Proposition 6.2 in the presence of a uniform rank gap. If $upright("Cu") \( D \)$ is almost unperforated, their criterion gives $x lt.eq y$ for $x \, y in upright("Cu") \( D \)$ from the ideal containment $x lt.eq sup_n n y$ and the strict inequalities $lambda \( x \) < lambda \( y \)$ for every functional $lambda$ with $lambda \( y \) = 1$. A functional is an additive order-preserving map to $\[ 0 \, oo \]$ that vanishes at zero and preserves increasing suprema. For exact algebras, the extended trace correspondence converts the rank gap into these inequalities, while the trace that is zero on an ideal and infinite outside it detects ideal containment. We give the direct regularization proof.

#thm([Lemma 2.5.])[
  (Comparison with a uniform rank gap).  #emph[Let $D$ be exact and $cal(Z)$-stable. If $u \, v in D_(+)$ satisfy 
$ d_tau \( u \) lt.eq 1 / 2 d_tau \( v \) quad upright("for every lower semicontinuous extended trace ") tau upright(" on ") D \, $

 then $u prec.tilde v$.]
] <prelim:half-comparison>

#proof[
  Let $I = "Ideal"_D \( v \)$. The map that is zero on $I_(+)$ and infinity on $D_(+) \\ I$ is a lower semicontinuous extended trace: additivity follows from heredity of $I$, the trace identity from $x^(*) x in I arrow.l.r.double x x^(*) in I$, and lower semicontinuity from closedness of $I$. The assumed inequality for this trace forces $u in I$.
  Work in $D ⊗ cal(K)$, whose $W$-semigroup identifies with $upright("Cu") \( D \)$ and is almost unperforated. Fix a dimension function $d$ on this semigroup with $d \( \[ v \] \) = 1$. Its regularization is
  $ overline(d) \( \[ z \] \) = sup_(delta > 0) d \( \[ \( z - delta \)_(+) \] \) . $
  By [10] Lemma 4.7 and the spectral-cut description of compact containment, $overline(d)$ is a functional on $upright("Cu") \( D \)$. The correspondence in [10] Proposition 4.2 realizes it as $d_lambda$ for a lower semicontinuous extended $2$-quasitrace. Haagerup proved that finite-valued $2$-quasitraces on exact unital algebras are traces. Blanchard–Kirchberg extended this conclusion to lower semicontinuous $2$-quasitraces on exact algebras, allowing a possibly proper finite-domain ideal [10] Remarks 4.3 and 4.5. Thus $lambda$ is a trace. Restrict $lambda$ to the original corner $D$. For each fixed $eta > 0$ the hypothesis gives
  $ d \( \[ \( u - eta \)_(+) \] \) & lt.eq overline(d) \( \[ u \] \) = d_lambda \( u \) lt.eq 1 / 2 d_lambda \( v \) = 1 / 2 overline(d) \( \[ v \] \)\
 & lt.eq 1 / 2 < 1 = d \( \[ v \] \) . $
  The strict inequality is against $d \( \[ v \] \)$, so it remains valid when $overline(d) \( \[ v \] \) = 0$. Theorem 8 now compares every $\( u - eta \)_(+)$ with $v$. Taking the supremum over cuts gives $u prec.tilde v$. Finally, comparisons between elements of the original corner can be witnessed in that corner, by compressing each witness on both sides by its multiplier projection. ◻
]

#thm([Lemma 2.6.])[
  (Extended traces on finite matrices).  #emph[Let $A$ be unital, let $k gt.eq 1$, and let $lambda$ be a lower semicontinuous extended trace on $A ⊗ M_k$. Set $tau \( a \) = lambda \( a ⊗ 1_k \)$ and $L_k = upright("id")_A ⊗ "tr"_k$, with normalized matrix trace. Then 
$ lambda \( z \) = tau \( L_k \( z \) \) #h(2em) \( z in \( A ⊗ M_k \)_(+) \) . $

 No finiteness assumption on $lambda$ is needed.]
] <prelim:matrix-traces>

#proof[
  Write $e_(i j) = 1_A ⊗ e_(i j)$. Additivity and the trace identity give
  $ lambda \( z \) = sum_(i = 1)^k lambda \( z^(1 \/ 2) e_(i i) z^(1 \/ 2) \) = sum_(i = 1)^k lambda \( e_(i i) z e_(i i) \) . $
  Unitary equivalence of the diagonal corners gives $lambda \( a ⊗ e_(i i) \) = k^(- 1) tau \( a \)$ for $a in A_(+)$. Summing proves the formula. Only finite sums and multiplication by positive scalars occur, so the argument also applies to infinite values. ◻
]

=== 2.3 Ultraproducts and bounded witnesses <ultraproducts-and-bounded-witnesses>

Fix a free ultrafilter $omega$ on $bb(N)$. For a sequence $\( D_n \)$ we use the norm ultraproduct

$ product_omega D_n = product_n D_n #scale(x: 120%, y: 120%)[\/] { \( x_n \) : lim_(n arrow.r omega) parallel x_n parallel = 0 } . $

For a constant sequence this is denoted $D_omega$; the ordinary sequence algebra is $D_oo = ell^oo \( D \) \/ c_0 \( D \)$.

The following form of Kirchberg’s $epsilon$-test is recorded in [3] Lemma 1.10; we include the diagonal proof.

#thm([Lemma 2.7.])[
  (Kirchberg’s $epsilon$-test).  #emph[Let $X_n$ be nonempty sets and let $f_(j \, n) : X_n arrow.r \[ 0 \, oo \)$ be given for $j \, n in bb(N)$. Suppose that for every $m$ and $delta > 0$ there is $\( x_n \) in product_n X_n$ with $lim_(n arrow.r omega) f_(j \, n) \( x_n \) < delta$ for $1 lt.eq j lt.eq m$. Then there is a single $\( x_n \)$ for which all these ultralimits are zero.]
] <prelim:epsilon-test>

#proof[
  Choose $\( x_n^(\( m \)) \)$ solving the first $m$ conditions with ultralimits less than $1 \/ \( 2 m \)$. Choose $A_m in omega$ on which the first $m$ errors of this choice are less than $1 \/ m$, and set $E_m = A_1 ∩ dots.h.c ∩ A_m$. These sets are decreasing and belong to $omega$. At coordinate $n$, use $x_n^(\( l \( n \) \))$, where $l \( n \) = max { m lt.eq n : n in E_m }$, using any element of $X_n$ if the set is empty. Then $l \( n \) arrow.r_omega oo$, and every fixed error tends to zero. ◻
]

We apply this to countably many norm relations on contractions and on variables with fixed, separately prescribed norm bounds. Nuclear c.p.c. lifting permits the same procedure for maps out of a separable nuclear algebra; a countable dense set records linear relations, complete positivity and the needed order-zero relations. Countably many extra commutators or norms after a fixed contractive map can be included among the tests. The following elementary estimate supplies the bounds for Cuntz witnesses.

#thm([Lemma 2.8.])[
  (A spare spectral cut gives bounded witnesses).  #emph[Let $u \, y in D_(+)$ and $0 lt.eq a < b$. If $u prec.tilde \( y - b \)_(+)$, then for every $epsilon > 0$ there is $r in D$ such that 
$ parallel u - r^(*) \( y - a \)_(+) r parallel < epsilon \, #h(2em) parallel r parallel^2 lt.eq frac(parallel u parallel + epsilon, b - a) . $

 Here $\( y - 0 \)_(+) = y$. In particular the bound is uniform in a family of contractions $u$ with a common gap $b - a > 0$.]
] <prelim:bounded-witness>

#proof[
  Choose $s$ with $parallel u - s^(*) \( y - b \)_(+) s parallel < epsilon$ and put
  $ f \( t \) = (frac(\( t - b \)_(+), \( t - a \)_(+)))^(1 \/ 2) \, #h(2em) r = f \( y \) s \, $
  where the ratio is zero when its denominator vanishes. This is a continuous function vanishing near zero, and
  $ f \( y \) \( y - a \)_(+) f \( y \) = \( y - b \)_(+) \, #h(2em) f \( t \)^2 lt.eq \( b - a \)^(- 1) \( t - b \)_(+) . $
  Consequently
  $ r^(*) \( y - a \)_(+) r = s^(*) \( y - b \)_(+) s \, #h(2em) parallel r parallel^2 lt.eq \( b - a \)^(- 1) parallel s^(*) \( y - b \)_(+) s parallel \, $
  which proves the claim. If the original comparison is formulated in the stabilization, compression to the original corner gives $s in D$. ◻
]

The choices $\( a \, b \) = \( c \, 2 c \)$ and $\( a \, b \) = \( 0 \, c \)$ will both be used. Together with Lemma 11, the estimate permits coordinatewise comparisons with a fixed spare cut to pass to the norm ultraproduct. Coordinatewise Cuntz comparison without such control does not itself supply bounded representatives.

=== 2.4 Domination and unitary equivalence <domination-and-unitary-equivalence>

#thm([Theorem 2.9.])[
  (Gabe’s approximate domination theorem).  #emph[Let $D$ be exact and let $Phi \, Psi : D arrow.r E$ be nuclear completely positive maps, with $Psi$ of order zero. Suppose 
$ Phi \( a \) in "Ideal"_E \( Psi \( a \) \) #h(2em) \( a in D_(+) \) . $

 For every finite $cal(F) subset D$ and $epsilon > 0$ there are $y_1 \, dots.h \, y_N in E$ such that 
$ ∥Phi \( a \) - sum_(l = 1)^N y_l^(*) Psi \( a \) y_l∥ < epsilon #h(2em) \( a in cal(F) \) . $

]
] <prelim:domination>

This is the implication from pointwise ideal containment to approximate domination in [11] Theorem 3.3, building on the ideal-separation method of [16] Proposition 4.2. The approximation is in norm simultaneously on $cal(F)$, and the codomain may be a nonexact norm ultraproduct. No bound on the individual $y_l$ is asserted.

#thm([Lemma 2.10.])[
  (Relative-commutant unitary equivalence).  #emph[Let $D_n$ be separable unital $cal(Z)$-stable algebras, put $D_omega = product_omega D_n$, and let $A$ be separable and unital. For a c.p.c. order-zero map $rho : A arrow.r D_omega$ set 
$ C = D_omega ∩ rho \( A \)' ∩ { 1 - rho \( 1 \) }^perp . $

 Assume that $C$ is full in $D_omega$ and that every full hereditary subalgebra $E subset C$ has the following property: whenever $x in E$ admits totally full $e_l \, e_r in E_(+)$ with $e_l x = x e_r = 0$, there is a full $s in E$ satisfying $s x = x s = 0$. If $h_0 \, h_1 in C_(+)$ are totally full contractions and 
$ f \( h_0 \) tilde.op f \( h_1 \) quad upright("in ") C #h(2em) upright("for every ") f in C_0 \( \( 0 \, 1 \] \)_(+) \, $

 then $u h_1 u^(*) = h_0$ for some unitary $u in tilde(C)$.]
] <prelim:unitary>

This is [3] Lemma 5.3, whose proof adapts the positive-element classification method of Robert–Santiago [22]; $tilde.op$ here denotes Cuntz equivalence. We will verify the hereditary-subalgebra condition directly. After adjoining the ambient unit, the implementing unitary belongs to $D_omega$ and commutes with $rho \( A \)$. More explicitly, if $C$ already has a unit $p_C$ different from the ambient unit, replace a unitary $u in C$ by $u + \( 1 - p_C \)$; otherwise use the canonical map from the unitization to $C + bb(C) 1_(D_omega)$.

== 3 Matrix models with local trace control <sec:model>

Throughout this section, $A$ is a nonzero separable unital nuclear $C^(*)$-algebra; no absorption hypothesis is imposed. We construct a matrix model with trace estimates localized to finitely many ideals. The point is that a norm error inside a suitable hereditary corner becomes a trace error relative to the rank of the positive element generating the relevant ideal. For $k gt.eq 1$, write

$ L_k = upright("id")_A ⊗ upright("tr")_k : A ⊗ M_k arrow.r A \, #h(2em) L_k \( \( z_(r s) \)_(r \, s = 1)^k \) = 1 / k sum_(r = 1)^k z_(r r) \, $

where $upright("tr")_k$ is the normalized matrix trace. We may choose all matrix sizes to be powers of $2$; this convenient restriction costs nothing in the finite probability-rounding argument below.

Each test uses a positive contraction $a$ and a number $0 < gamma < 1$. We keep the uncut element $a$ for the later comparison target, estimate the model error on the deeper cut $x = \( a - gamma \)_(+)$, and use the shallower cut $b = \( a - gamma \/ 2 \)_(+)$ to specify both the ideal and the rank scale for that estimate. The two cuts have distinct roles: $x$ lies in the hereditary subalgebra generated by $b$, whose rank $d_tau \( b \)$ will control the trace error.

Choose a countable dense subset $cal(D)$ of the positive unit ball of $A$ which is closed under cuts $a mapsto \( a - r \)_(+)$ for positive rational $r$. Such a set is obtained from any countable dense subset by adjoining its successive rational cuts. Enumerate all pairs $\( a \, gamma \) in cal(D) times \( \( 0 \, 1 \) ∩ bb(Q) \)$ as $\( a_j \, gamma_j \)_(j gt.eq 1)$, and set

#[#set math.equation(numbering: n => "(3.1)")
 $ x_j = \( a_j - gamma_j \)_(+) \, #h(2em) b_j = \( a_j - gamma_j \/ 2 \)_(+) \, #h(2em) I_j = "Ideal" \( b_j \) . $ <model:tests>]

In particular, $x_j in "her" \( b_j \)$ and $d_tau \( x_j \) lt.eq d_tau \( b_j \)$ for every lower semicontinuous extended trace $tau$.

#thm([Lemma 3.1.])[
  (Matrix model).  #emph[There are finite-dimensional $C^(*)$-algebras $F_n$, powers $k_n$ of $2$, and completely positive contractive maps 
$ A arrow.r^(alpha_n) F_n arrow.r^(beta_n) A ⊗ M_(k_n) \, #h(2em) theta_n = beta_n alpha_n \, $

 with the following properties.]
  + #emph[Each $beta_n$ has order zero, and 
$ parallel alpha_n \( c \) alpha_n \( d \) parallel arrow.r 0 quad \( c \, d in A_(+) \, med c d = 0 \) . $

]
  + #emph[For every $a in A$, 
$ parallel L_(k_n) \( theta_n \( a \) \) - a parallel arrow.r 0 . $

]
  + #emph[For every $n \, j gt.eq 1$ there is a positive contraction $w_(n \, j) in A ⊗ M_(k_n)$, and there are nonnegative numbers $eta_(n \, j) \, delta_(n \, j)$ tending to zero as $n arrow.r oo$ for each fixed $j$, such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ parallel w_(n \, j) - theta_n \( x_j \) parallel & lt.eq eta_(n \, j) \,\
tau \( L_(k_n) \( w_(n \, j) \) \) & lt.eq tau \( x_j \) + delta_(n \, j) d_tau \( b_j \) $ <model:retained-norm>]

 for every lower semicontinuous extended trace $tau$ on $A$ with $d_tau \( b_j \) < oo$.]
  #emph[The coefficients in (3.2) are independent of $tau$. One may take $delta_(n \, j) = 2^(- n)$ for all $n \, j$.]
] <model:construction>

We first establish the finite-stage construction. Its trace estimates will be obtained within hereditary subalgebras on which the relevant extended traces are bounded.

#thm([Lemma 3.2.])[
  (Trace bounds in a hereditary subalgebra).  #emph[Let $P \, b in A_(+)$ be contractions, and suppose that $\[ P \] lt.eq K \[ b \]$ for a finite positive integer $K$. If $tau$ is a lower semicontinuous extended trace with $d_tau \( b \) < oo$, then its restriction to $D = "her" \( P \)$ extends to a bounded positive linear functional satisfying 
#[#set math.equation(numbering: n => "(3.3)")
 $ parallel tau \|_D parallel lt.eq d_tau \( P \) lt.eq K d_tau \( b \) . $ <model:corner-bound>]

 Consequently, for $y \, z in D_(+)$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ \| tau \( y \) - tau \( z \) \| lt.eq parallel y - z parallel K d_tau \( b \) . $ <model:corner-error>]

]
] <model:corner-traces>

#proof[
  Choose an approximate unit $\( e_l \)$ for $D$ consisting of positive contractive continuous functions of $P$ which vanish at zero. Such elements satisfy $d_tau \( e_l \) lt.eq d_tau \( P \)$. For any positive contraction $z in D$, the elements $e_l z e_l$ converge to $z$ in norm, and
  $ tau \( e_l z e_l \) lt.eq tau \( e_l^2 \) lt.eq d_tau \( P \) . $
  Lower semicontinuity therefore gives $tau \( z \) lt.eq d_tau \( P \)$. Monotonicity and additivity of $d_tau$ on Cuntz classes give the second inequality in (3.3). Thus $tau$ is bounded on the positive unit ball of $D$ and extends to the asserted bounded positive functional. Its norm bound proves (3.4). This argument also applies when $d_tau \( b \) = 0$, in which case the restriction is identically zero. ◻
]

#thm([Lemma 3.3.])[
  (Finite ideal slicing).  #emph[Fix $m \, N gt.eq 1$, and let $cal(T) = { 1 \, dots.h \, N }^m$. For every $t in cal(T)$ and $S subset.eq { 1 \, dots.h \, m }$, there are positive contractions $\( P_(S \, t \, i) \)_(i gt.eq 1)$ in $A$ with the following properties.]
  + #emph[For fixed $t \, i$, the family $\( P_(S \, t \, i) \)_S$ is orthogonal; in particular, $sum_S P_(S \, t \, i) lt.eq 1$.]
  + #emph[For every $a in A$, $parallel \[ P_(S \, t \, i) \, a \] parallel arrow.r 0$. If $1 lt.eq j lt.eq m$ and $j in.not S$, then 
$ parallel P_(S \, t \, i)^(1 \/ 2) x_j P_(S \, t \, i)^(1 \/ 2) parallel arrow.r 0 . $

]
  + #emph[If $j in S$, then $P_(S \, t \, i) in I_j$, and there is a finite positive integer $K_(S \, t \, i \, j)$ such that 
#[#set math.equation(numbering: n => "(3.5)")
 $ \[ P_(S \, t \, i) \] lt.eq K_(S \, t \, i \, j) \[ b_j \] . $ <model:finite-rank-bound>]

]
  + #emph[For every $a in A$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ limsup_(i arrow.r oo) ∥1 / N^m sum_(t in cal(T)) sum_S P_(S \, t \, i)^(1 \/ 2) a P_(S \, t \, i)^(1 \/ 2) - a∥ lt.eq m / N parallel a parallel . $ <model:slicing-approximation>]

]
] <model:slicing>

#proof[
  Write $A_oo = ell^oo \( A \) \/ c_0 \( A \)$, identifying $A$ with its constant sequences. There are commuting positive contractions $u_1 \, dots.h \, u_m in A_oo ∩ A'$ such that $u_j$ is represented by positive contractions in $I_j$ and $u_j x_j = x_j$. Indeed, at coordinate $i$ choose successively an element of a quasicentral approximate unit of each $I_j$. Require its commutators with the first $i$ elements of a fixed dense subset of $A$ to have norm less than $1 \/ i$, require that it act on $x_j$ within $1 \/ i$, and require that it commute within $1 \/ i$ with the elements already chosen at that coordinate. These are finitely many approximate-unit and quasicentrality requirements. They give exactly the stated relations on passing to $A_oo$.
  Choose $N$ pairwise disjoint closed intervals contained in $\( 0 \, 1 \)$. For the $r$th interval choose continuous functions $g_r^(-) \, g_r^(+) : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ satisfying
  $ g_r^(-) g_r^(+) = 0 \, #h(2em) 0 lt.eq g_r^(-) + g_r^(+) lt.eq 1 \, $
  whose sum is one outside that interval. We choose $g_r^(-)$ equal to one below the interval and zero above it, and $g_r^(+)$ equal to zero below the interval and one above it. Within the interval the two functions can decrease and increase, respectively, meeting at zero. Set $h_r = g_r^(-) + g_r^(+)$. At every point of $\[ 0 \, 1 \]$ at most one interval can contribute a loss, so
  #[#set math.equation(numbering: n => "(3.7)")
   $ 1 - 1 / N lt.eq 1 / N sum_(r = 1)^N h_r lt.eq 1 . $ <model:threshold-average>]
  For $t = \( t_1 \, dots.h \, t_m \) in cal(T)$ define
  $ P_(S \, t) = product_(j in S) g_(t_j)^(+) \( u_j \) product_(j in { 1 \, dots.h \, m } \\ S) g_(t_j)^(-) \( u_j \) . $
  These are central positive contractions, and for fixed $t$ they are pairwise orthogonal as $S$ varies. Families for different values of $t$ may overlap and are combined by averaging. Joint functional calculus and independent averaging of the coordinates of $t$ give
  #[#set math.equation(numbering: n => "(3.8)")
   $ Q & = 1 / N^m sum_(t in cal(T)) sum_S P_(S \, t) = product_(j = 1)^m (1 / N sum_(r = 1)^N h_r \( u_j \)) \,\
\( 1 - 1 \/ N \)^m 1 & lt.eq Q lt.eq 1 \, #h(2em) parallel 1 - Q parallel lt.eq m \/ N . $ <model:mean-slice>]
  If $j in S$, then $P_(S \, t)$ belongs to the image of $ell^oo \( I_j \)$ in $A_oo$, since $g_(t_j)^(+) \( 0 \) = 0$. If $1 lt.eq j lt.eq m$ and $j in.not S$, then $g_(t_j)^(-) \( u_j \) x_j = g_(t_j)^(-) \( 1 \) x_j = 0$, whence $P_(S \, t) x_j = 0$.
  We construct the required orthogonal representatives directly, before imposing exact ideal membership. Start with positive contractive representatives of a finite orthogonal family, whose pairwise products tend to zero. To separate a first representative $a_i$ from a later representative $b_i$, choose $r_i > 0$ tending to zero slowly enough that $parallel a_i b_i parallel \/ r_i arrow.r 0$. Let $f_i : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ be one on $\[ 0 \, r_i \/ 2 \]$ and zero on $\[ r_i \, 1 \]$, with $1 - f_i \( t \) lt.eq 2 t \/ r_i$. Replace the first element by $\( a_i - r_i \)_(+)$ and every later one by $f_i \( a_i \) b_i f_i \( a_i \)$. These replacements are orthogonal to the first cut, and
  $ parallel b_i - f_i \( a_i \) b_i f_i \( a_i \) parallel lt.eq 4 parallel a_i b_i parallel \/ r_i arrow.r 0 . $
  Choose $r_i$ using the maximum of the finitely many relevant products. Repeating with the later elements preserves orthogonality already obtained and changes no quotient element. This gives, for every $t$, orthogonal positive contractive lifts $R_(S \, t \, i)$ of $P_(S \, t)$.
  For $j in S$, the distance from $R_(S \, t \, i)$ to $I_j$ tends to zero. Let $epsilon_i > 0$ tend to zero and dominate all these distances, over the finite collection of triples $\( S \, t \, j \)$ under consideration. The first cuts
  $ T_(S \, t \, i) = \( R_(S \, t \, i) - 2 epsilon_i \)_(+) $
  belong exactly to every $I_j$ with $j in S$: their images in $A \/ I_j$ vanish by functional calculus. Choose another sequence $sigma_i > 0$ tending to zero, and put
  $ P_(S \, t \, i) = \( T_(S \, t \, i) - sigma_i \)_(+) . $
  Because $T_(S \, t \, i) in "Ideal" \( b_j \)$, the usual ideal criterion for Cuntz comparison gives a finite integer $K_(S \, t \, i \, j)$ for which (3.5) holds. Here the strict positivity of the second cut is essential: every positive cut of an element in $"Ideal" \( b_j \)$ is Cuntz below a finite direct sum of copies of $b_j$. Both cuts preserve orthogonality and change the representatives by at most $2 epsilon_i + sigma_i arrow.r 0$. Consequently they preserve all the quotient relations established above, while imposing all the ideal and finite-multiple conditions simultaneously.
  Finally, centrality of $P_(S \, t)$ gives $P_(S \, t)^(1 \/ 2) a P_(S \, t)^(1 \/ 2) = P_(S \, t) a$ in $A_oo$. Thus (3.8) implies (3.6), and $P_(S \, t) x_j = 0$ proves the required vanishing of the omitted compressions. No bound on $K_(S \, t \, i \, j)$ uniform in $i$ has been asserted or used. ◻
]

#thm([Lemma 3.4.])[
  (Finite-stage model).  #emph[Fix $m gt.eq 1$, a finite subset $cal(F)$ of the unit ball of $A$, a finite family $cal(O)$ of pairs of orthogonal positive contractions in $A$, and $epsilon > 0$. There are a finite-dimensional $C^(*)$-algebra $F$, a power $k$ of $2$, completely positive contractive maps 
$ A arrow.r^alpha F arrow.r^beta A ⊗ M_k \, #h(2em) theta = beta alpha \, $

 and positive contractions $w_1 \, dots.h \, w_m in A ⊗ M_k$ such that $beta$ has order zero and 
#[#set math.equation(numbering: n => "(3.9)")
 $ parallel L_k \( theta \( a \) \) - a parallel & < epsilon &  & \( a in cal(F) \) \,\
parallel alpha \( c \) alpha \( d \) parallel & < epsilon &  & \( \( c \, d \) in cal(O) \) \,\
parallel w_j - theta \( x_j \) parallel & < epsilon &  & \( 1 lt.eq j lt.eq m \) \,\
tau \( L_k \( w_j \) \) & lt.eq tau \( x_j \) + epsilon d_tau \( b_j \) &  & \( 1 lt.eq j lt.eq m \, d_tau \( b_j \) < oo \) . $ <model:finite-approx>]

 The last inequality holds for every lower semicontinuous extended trace $tau$ satisfying the indicated finite-rank condition.]
] <model:finite-stage>

#proof[
  #emph[Fixing the corners.] Choose $N$ so large that $m \/ N < epsilon \/ 4$, and use Lemma 17. Write
  $ l_(S \, t \, i) \( a \) = P_(S \, t \, i)^(1 \/ 2) a P_(S \, t \, i)^(1 \/ 2) . $
  Asymptotic centrality implies, for $\( c \, d \) in cal(O)$,
  $ parallel l_(S \, t \, i) \( c \) l_(S \, t \, i) \( d \) parallel = parallel P_(S \, t \, i)^(1 \/ 2) c P_(S \, t \, i) d P_(S \, t \, i)^(1 \/ 2) parallel arrow.r 0 . $
  Together with (3.6) and the omitted compression estimates, this permits us to fix one coordinate $i$ such that
  #[#set math.equation(numbering: n => "(3.10)")
   $ ∥1 / N^m sum_(t \, S) l_(S \, t \, i) \( a \) - a∥ & < epsilon \/ 3 &  & \( a in cal(F) \) \,\
parallel l_(S \, t \, i) \( x_j \) parallel & < epsilon &  & \( 1 lt.eq j lt.eq m \, med j in.not S \) \,\
parallel l_(S \, t \, i) \( c \) l_(S \, t \, i) \( d \) parallel & < epsilon \/ 2 &  & \( \( c \, d \) in cal(O) \) . $ <model:fixed-average>]
  All these requirements range over finite sets. From now on this coordinate is fixed. For each occurrence indexed by $\( S \, t \)$, suppress $i$ and write
  $ P = P_(S \, t \, i) \, quad D_P = "her" \( P \) \, quad l_P \( a \) = P^(1 \/ 2) a P^(1 \/ 2) \, quad K_(P \, j) = K_(S \, t \, i \, j) . $
  Every subscript $P$ below retains this $\( S \, t \)$ occurrence index. Thus coincident positive elements, including zero pieces, still receive separate corner approximations and outcome labels. In particular, the finitely many constants $K_(P \, j)$ have already been fixed before any approximation accuracy within $D_P$ is chosen.
  #emph[Approximating within the corners.] Each $D_P$ is separable and nuclear. The Brown–Carrión–White approximation theorem, Theorem 6, supplies finite-dimensional approximations with asymptotically order-zero first maps and return maps which are finite convex combinations of completely positive contractive order-zero maps. For a fixed corner, take a sequence of these first maps $zeta_r : D_P arrow.r E_r$. The asymptotic product estimate (2.2) gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ limsup_(r arrow.r oo) parallel zeta_r \( y \) zeta_r \( z \) parallel lt.eq parallel y z parallel #h(2em) \( y \, z in D_P \) . $ <model:quotient-product-bound>]
  Thus sufficiently late first maps have product norm less than $epsilon$ on the finitely many pairs $\( l_P \( c \) \, l_P \( d \) \)$ in (3.10). This uses the approximation sequence for the fixed corner; it requires no uniformity in a varying hereditary subalgebra.
  Choose positive numbers $xi_P$ such that
  #[#set math.equation(numbering: n => "(3.12)")
   $ max_P xi_P < epsilon \/ 3 \, #h(2em) 1 / N^m sum_(t in cal(T)) sum_(S in.rev j) K_(P_(S \, t \, i) \, j) xi_(P_(S \, t \, i)) < epsilon \/ 2 quad \( 1 lt.eq j lt.eq m \) . $ <model:inner-tolerances>]
  There are only finitely many constants in these requirements, so such choices are possible. Choose a corresponding approximation in each $D_P$, denoted
  $ D_P arrow.r^(zeta_P) E_P arrow.r^(phi_P) D_P \, #h(2em) phi_P = sum_(r = 1)^(h_P) lambda_(P \, r) beta_(P \, r) \, $
  where the $lambda_(P \, r)$ are nonnegative and sum to one, and each $beta_(P \, r)$ is completely positive contractive and order zero. All component return maps for this corner have the same domain $E_P$ and use the same first map $zeta_P$. Arrange that
  #[#set math.equation(numbering: n => "(3.13)")
   $ parallel phi_P zeta_P l_P \( a \) - l_P \( a \) parallel & < xi_P &  & #scale(x: 120%, y: 120%)[\(] a in cal(F) union { x_1 \, dots.h \, x_m } #scale(x: 120%, y: 120%)[\)] \,\
parallel zeta_P l_P \( c \) zeta_P l_P \( d \) parallel & < epsilon &  & \( \( c \, d \) in cal(O) \) . $ <model:inner-approx>]
  For a zero corner take $E_P = 0$ and the zero maps, with a single return component of weight one.
  #emph[Individual outcomes and their retained parts.] Consider the finite probability space whose outcomes $nu$ consist of a tuple $t in cal(T)$ and, for each subset $S$, a choice $r_S in { 1 \, dots.h \, h_(P_(S \, t \, i)) }$. Give $t$ uniform probability and make the return-map choices independently with the probabilities $lambda_(P \, r)$. Write $lambda_nu$ for the resulting probability, and let
  $ E_t = xor.big_S E_(P_(S \, t \, i)) \, #h(2em) alpha_t \( a \) = xor.big_S zeta_(P_(S \, t \, i)) l_(P_(S \, t \, i)) \( a \) \, $
  $ beta_nu \( \( z_S \)_S \) = sum_S beta_(P_(S \, t \, i) \, r_S) \( z_S \) \, #h(2em) T_nu = beta_nu alpha_t . $
  The map $alpha_t$ is completely positive contractive because a finite direct sum has the maximum norm. The hereditary subalgebras $D_(P_(S \, t \, i))$ are mutually orthogonal for the single tuple $t$ used by the outcome. Consequently $beta_nu$ is completely positive contractive and order zero: each summand has these properties, and products between distinct summand ranges vanish. Moreover, (3.13) bounds the product defect of every $alpha_t$ by $epsilon$, uniformly over the outcomes.
  Independence of the return-map choices gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_nu lambda_nu T_nu \( a \) = 1 / N^m sum_(t in cal(T)) sum_S phi_(P_(S \, t \, i)) zeta_(P_(S \, t \, i)) l_(P_(S \, t \, i)) \( a \) . $ <model:expected-map>]
  For each fixed $t$, the differences in (3.13) lie in orthogonal hereditary subalgebras, so their sum has norm at most $max_P xi_P$. Equations (3.10), (3.12), and (3.14) therefore imply
  #[#set math.equation(numbering: n => "(3.15)")
   $ ∥sum_nu lambda_nu T_nu \( a \) - a∥ < 2 epsilon \/ 3 #h(2em) \( a in cal(F) \) . $ <model:expected-approximation>]
  For $1 lt.eq j lt.eq m$, retain only the corners indexed by $S in.rev j$:
  #[#set math.equation(numbering: n => "(3.16)")
   $ W_(nu \, j) = sum_(S in.rev j) beta_(P_(S \, t \, i) \, r_S) zeta_(P_(S \, t \, i)) l_(P_(S \, t \, i)) \( x_j \) . $ <model:outcome-retained>]
  This is a positive contraction. Contractivity of each component and orthogonality of the omitted corners give, for every individual outcome,
  #[#set math.equation(numbering: n => "(3.17)")
   $ parallel T_nu \( x_j \) - W_(nu \, j) parallel lt.eq max_(S in.rev.not j) parallel l_(P_(S \, t \, i)) \( x_j \) parallel < epsilon . $ <model:before-averaging>]
  The maximum over an empty family is taken to be zero. In particular, the estimate holds before taking any average.
  #emph[The uniform relative trace estimate.] Fix $j$ and a lower semicontinuous extended trace $tau$ with $d_tau \( b_j \) < oo$. In every retained corner, Lemma 16 applies with the already fixed constant $K_(P \, j)$. Thus (3.13) implies
  $ tau \( phi_P zeta_P l_P \( x_j \) \) lt.eq tau \( l_P \( x_j \) \) + xi_P K_(P \, j) d_tau \( b_j \) #h(2em) \( j in S \) . $
  All quantities in this inequality are finite. For each fixed $t$, traciality and $sum_(S in.rev j) P_(S \, t \, i) lt.eq 1$ give
  $ sum_(S in.rev j) tau \( l_(P_(S \, t \, i)) \( x_j \) \) & = tau (x_j^(1 \/ 2) #scale(x: 180%, y: 180%)[\(] sum_(S in.rev j) P_(S \, t \, i) #scale(x: 180%, y: 180%)[\)] x_j^(1 \/ 2))\
 & lt.eq tau \( x_j \) . $
  Taking expectations in (3.16) and using (3.12) proves
  #[#set math.equation(numbering: n => "(3.18)")
   $ sum_nu lambda_nu tau \( W_(nu \, j) \) lt.eq tau \( x_j \) + \( epsilon \/ 2 \) d_tau \( b_j \) . $ <model:expected-trace>]
  For later use there is also an individual bound
  #[#set math.equation(numbering: n => "(3.19)")
   $ tau \( W_(nu \, j) \) lt.eq M_(nu \, j) d_tau \( b_j \) \, #h(2em) M_(nu \, j) = sum_(S in.rev j) K_(P_(S \, t \, i) \, j) < oo . $ <model:individual-trace>]
  Every coefficient here was chosen independently of $tau$. If $d_tau \( b_j \) = 0$, then each retained output has trace exactly zero, as does $x_j$. Hence the same inequalities hold in this case without an absolute additive error. No condition is being placed on traces for which $d_tau \( b_j \) = oo$.
  #emph[Rounding the probabilities and forming the matrix model.] After all corner maps and the constants $M_(nu \, j)$ have been fixed, choose $k = 2^s$ and nonnegative integers $n_nu$ with $sum_nu n_nu = k$ so that $mu_nu = n_nu \/ k$ satisfies
  #[#set math.equation(numbering: n => "(3.20)")
   $ sum_nu \| mu_nu - lambda_nu \| < epsilon \/ 3 \, #h(2em) sum_nu \| mu_nu - lambda_nu \| M_(nu \, j) < epsilon \/ 2 quad \( 1 lt.eq j lt.eq m \) . $ <model:rounding-errors>]
  Such choices exist for arbitrarily large $s$: round the finitely many numbers $k lambda_nu$ down to integers and distribute the remaining units among the outcomes. The resulting probabilities stay in the probability simplex, and their total absolute error tends to zero as $s arrow.r oo$. Contractivity of the $T_nu$ shows that replacing $lambda_nu$ by $mu_nu$ changes the expected map on the unit ball by less than $epsilon \/ 3$. Equations (3.19) and (3.20) show that the expected retained trace changes in absolute value by at most $\( epsilon \/ 2 \) d_tau \( b_j \)$.
  List the outcomes with their multiplicities as $nu_1 \, dots.h \, nu_k$, and write $t_l$ for the threshold tuple in $nu_l$. Define
  $ F = xor.big_(l = 1)^k E_(t_l) \, #h(2em) alpha \( a \) = xor.big_(l = 1)^k alpha_(t_l) \( a \) \, #h(2em) beta \( \( z_l \)_(l = 1)^k \) = "diag" #scale(x: 120%, y: 120%)[\(] beta_(nu_l) \( z_l \) #scale(x: 120%, y: 120%)[\)]_(l = 1)^k . $
  The map $alpha$ is completely positive contractive, and $beta$ is completely positive contractive and order zero, by the orthogonality of the matrix diagonal positions. We have
  $ theta \( a \) = "diag" \( T_(nu_l) \( a \) \)_(l = 1)^k \, #h(2em) L_k \( theta \( a \) \) = sum_nu mu_nu T_nu \( a \) . $
  Consequently (3.15) and (3.20) give (3.9), and the maximum norm in the direct sum gives (3.9). Finally, put
  $ w_j = "diag" \( W_(nu_l \, j) \)_(l = 1)^k . $
  These are positive contractions, and the estimate for individual outcomes in (3.17) proves (3.9). Since $L_k \( w_j \) = sum_nu mu_nu W_(nu \, j)$, (3.18) and the trace part of the rounding estimate prove (3.9). ◻
]

#proof[
  Fix a countable dense subset $\( c_l \)_(l gt.eq 1)$ of the unit ball of $A$. The space
  $ { \( c \, d \) in A_(+) times A_(+) : parallel c parallel \, parallel d parallel lt.eq 1 \, med c d = 0 } $
  is a separable metric space, so choose a countable dense family $\( c'_l \, d'_l \)_(l gt.eq 1)$ in this space. At stage $n$, apply Lemma 18 to the first $n$ tests, $cal(F)_n = { c_1 \, dots.h \, c_n }$, $cal(O)_n = { \( c'_1 \, d'_1 \) \, dots.h \, \( c'_n \, d'_n \) }$, and $epsilon = 2^(- n)$. Denote the resulting maps by $alpha_n$ and $beta_n$, and the retained elements by $w_(n \, j)$ for $j lt.eq n$.
  Contractivity extends (3.9) from the dense family to point-norm convergence on $A$. Likewise, if $c \, d$ are orthogonal positive contractions and $\( c' \, d' \)$ is one of the chosen orthogonal pairs, then
  $ parallel alpha_n \( c \) alpha_n \( d \) parallel lt.eq parallel c - c' parallel + parallel d - d' parallel + parallel alpha_n \( c' \) alpha_n \( d' \) parallel . $
  First taking the limit superior in $n$, then approximating $\( c \, d \)$ by such pairs, proves asymptotic preservation of orthogonality. Scaling proves the assertion for arbitrary orthogonal positive elements.
  For $j > n$ set $w_(n \, j) = 0$. Take $delta_(n \, j) = 2^(- n)$ for all $n \, j$, and set
  $ eta_(n \, j) = cases(delim: "{", 2^(- n) \, & j lt.eq n \,, 1 \, & j > n .) $
  Equations (3.2) and (3.2) now hold for every $n \, j$, and both error sequences tend to zero for each fixed $j$. At each stage the trace inequality holds simultaneously for all the indicated extended traces. Thus the diagonalization involves only the countable lists of elements, tests, and orthogonal pairs; it requires neither a countable family of traces nor a restriction on the ideal lattice of $A$. ◻
]

#prodef([Remark 3.5.])[
  The composites $theta_n$ also asymptotically preserve orthogonality. Indeed, the order-zero product estimate gives
  $ parallel theta_n \( c \) theta_n \( d \) parallel lt.eq parallel alpha_n \( c \) alpha_n \( d \) parallel #h(2em) \( c \, d in A_(+) \) . $
  Consequently they induce a c.p.c. order-zero map into $product_n \( A ⊗ M_(k_n) \) \/ xor.big_n \( A ⊗ M_(k_n) \)$, and into the corresponding norm ultraproduct. The same conclusion holds after composing the $beta_n$ with any c.p.c. order-zero maps into a fixed target algebra: the displayed product estimate remains valid for each composite return map.
] <model:composite-order-zero>

== 4 The common part and localized trace comparison <sec:traces>

The matrix model will now be placed in a Jiang–Su tensor factor by an order-zero map. Its expectation is still asymptotically the identity. This produces a common part of the model and the original inclusion. The remaining part is small in a sense that can be compared uniformly over all lower semicontinuous extended traces, including traces that are infinite away from an ideal.

=== 4.1 Order-zero maps into the Jiang–Su algebra <order-zero-maps-into-the-jiangsu-algebra>

Write $tau_(cal(Z))$ for the unique tracial state of $cal(Z)$. We first construct order-zero matrix maps and positive contractions with arbitrarily many orthogonal copies.

#thm([Lemma 4.1.])[
  #emph[For every integer $k gt.eq 1$ and every $xi > 0$ there is a c.p.c. order-zero map $iota : M_k arrow.r cal(Z)$ such that 
$ tau_(cal(Z)) \( iota \( 1 \) \) > 1 - xi \, #h(2em) parallel iota \( e_11 \) parallel = 1 . $

]
] <supplies:order-zero>

#proof[
  Choose a multiple $d gt.eq 2$ of $k$ with $\( d + 1 \)^(- 1) < xi$, and fix a unital embedding $mu : M_k arrow.r M_d$. Put $p = e_(d + 1 \, d + 1) in M_(d + 1)$. In $M_d ⊗ M_(d + 1)$, the complement of $1 ⊗ p$ is the tensor product of two $d$-dimensional spaces. Let $V$ be the flip on this complement, extended by the identity on the range of $1 ⊗ p$. The unitary group of each finite matrix block is path connected. There is therefore a continuous unitary path $U \( t \)$, $0 lt.eq t lt.eq 1$, from $1$ to $V$, all of whose members commute with $1 ⊗ p$.
  Define
  $ iota_0 \( x \) \( t \) = U \( t \) #scale(x: 120%, y: 120%)[\(] mu \( x \) ⊗ \( 1 - t p \) #scale(x: 120%, y: 120%)[\)] U \( t \)^(*) . $
  This is a c.p.c. order-zero map into $C \( \[ 0 \, 1 \] \, M_d ⊗ M_(d + 1) \)$. Its endpoint values are
  $ iota_0 \( x \) \( 0 \) = mu \( x \) ⊗ 1 \, #h(2em) iota_0 \( x \) \( 1 \) = 1 ⊗ "diag" \( mu \( x \) \, 0 \) . $
  Consequently its range lies in the prime dimension-drop algebra
  $ I_(d \, d + 1) = { f in C \( \[ 0 \, 1 \] \, M_d ⊗ M_(d + 1) \) : f \( 0 \) in M_d ⊗ 1 \, med f \( 1 \) in 1 ⊗ M_(d + 1) } . $
  The commutation of $U \( t \)$ with $1 ⊗ p$ gives the exact defect
  $ 1 - iota_0 \( 1 \) = #scale(x: 120%, y: 120%)[\(] t mapsto t \( 1 ⊗ p \) #scale(x: 120%, y: 120%)[\)] . $
  For $1 lt.eq r lt.eq d + 1$, the functions
  $ y_r \( t \) = sqrt(t) thin \( 1 ⊗ e_(r \, d + 1) \) $
  belong to $I_(d \, d + 1)$ and satisfy
  $ y_r^(*) y_r = 1 - iota_0 \( 1 \) \, #h(2em) sum_(r = 1)^(d + 1) y_r y_r^(*) = \( t mapsto t 1 \) lt.eq 1 . $
  Thus every tracial state $sigma$ on $I_(d \, d + 1)$ satisfies
  $ \( d + 1 \) sigma \( 1 - iota_0 \( 1 \) \) = sigma (sum_(r = 1)^(d + 1) y_r y_r^(*)) lt.eq 1 . $
  The prime dimension-drop algebra $I_(d \, d + 1)$ embeds unitally into $cal(Z)$ by [24] Theorem 2.1(i). Composing such an embedding with $iota_0$ gives the trace estimate. Finally, $parallel iota_0 \( e_11 \) \( 0 \) parallel = 1$, so isometry of the embedding gives the asserted norm. ◻
]

#thm([Lemma 4.2.])[
  #emph[For every integer $m gt.eq 2$ there are a positive contraction $D_m in cal(Z)$ of norm one, contractions $v_(m \, 1) \, dots.h \, v_(m \, m) in cal(Z)$, and a finite positive integer $K_m$ such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ v_(m \, r)^(*) v_(m \, s) = delta_(r s) D_m \, #h(2em) 1 = sum_(l = 1)^(K_m) y_(m \, l)^(*) \( D_m - 1 \/ 2 \)_(+) y_(m \, l) $ <supplies:copy-relations>]

 for suitable $y_(m \, l) in cal(Z)$.]
] <supplies:copies>

#proof[
  Take $iota : M_m arrow.r cal(Z)$ from Lemma 20, and set
  $ D_m = iota \( e_11 \) \, #h(2em) v_(m \, r) = iota^(1 \/ 2) \( e_(r 1) \) . $
  Order-zero functional calculus and the product identity (2.1) give the first identity in (4.1). The element $\( D_m - 1 \/ 2 \)_(+)$ is nonzero, hence full in the simple unital algebra $cal(Z)$. Lemma 7 supplies the second identity. ◻
]

We fix these choices once and for all. No uniform bound on $K_m$ is required.

=== 4.2 The model and its common part <the-model-and-its-common-part>

Throughout this section, $A$ is a nonzero separable unital nuclear $C^(*)$-algebra. Set

#[#set math.equation(numbering: n => "(4.2)")
 $ R = A ⊗ cal(Z)_1 ⊗ cal(Z)_2 ⊗ cal(Z)_3 \, #h(2em) B = R_omega \, #h(2em) B_1 = \( A ⊗ cal(Z)_1 \)_omega subset B . $ <setup:ambient>]

The first Jiang–Su factor carries the model and its common part; the second supplies positive contractions with arbitrarily many orthogonal copies. The constant third factor is reserved for the complementary weights in the unitary-equivalence argument. The tensor-factor inclusions are unital. Write $pi : A arrow.r B_1 subset B$ for the constant first-factor inclusion. Nuclearity and strong self-absorption of $cal(Z)$ [31] Examples 1.14 imply that $R$ is nuclear, exact, and $cal(Z)$-stable.

Use the tests $a_j \, gamma_j \, x_j \, b_j$ from (3.1). The matrix-model construction, Lemma 15, gives finite-dimensional algebras $F_n$, powers $k_n$ of two, and c.p.c. maps

$ A arrow.r^(alpha_n) F_n arrow.r^(beta_n) A ⊗ M_(k_n) \, $

where $beta_n$ is order zero, $alpha_n$ is asymptotically order zero, and $L_(k_n) beta_n alpha_n \( a \) arrow.r a$ for every $a in A$. Denote the lemma’s retained positive contractions by $W_(n \, j) in A ⊗ M_(k_n)$. For each fixed $j$ they satisfy

#[#set math.equation(numbering: n => "(4.3)")
 $ parallel W_(n \, j) - beta_n alpha_n \( x_j \) parallel arrow.r 0 $ <setup:model-retained>]

and

#[#set math.equation(numbering: n => "(4.4)")
 $ tau \( L_(k_n) \( W_(n \, j) \) \) lt.eq tau \( x_j \) + delta_(n \, j) d_tau \( b_j \) #h(2em) #scale(x: 120%, y: 120%)[\(] d_tau \( b_j \) < oo #scale(x: 120%, y: 120%)[\)] . $ <setup:model-traces>]

Here $tau$ ranges over all lower semicontinuous extended traces on $A$, and the nonnegative constants $delta_(n \, j)$ are independent of $tau$ and tend to zero for fixed $j$.

Choose maps $iota_n : M_(k_n) arrow.r cal(Z)_1$ from Lemma 20 with $s_n := tau_(cal(Z)) \( iota_n \( 1 \) \) arrow.r 1$. Define

#[#set math.equation(numbering: n => "(4.5)")
 $ T_n & = upright("id")_A ⊗ iota_n \, & beta'_n & = T_n beta_n \,\
theta_n & = beta'_n alpha_n \, & w_(n \, j) & = T_n \( W_(n \, j) \) . $ <setup:transformed-model>]

These maps and elements take values in $A ⊗ cal(Z)_1$, which we regard as a subalgebra of $R$.

The order-zero product identity for $iota_n$ tensors with $upright("id")_A$, first on elementary tensors and then by continuity. Thus $T_n$ and $beta'_n$ are c.p.c. order-zero maps. Put

$ L = upright("id")_A ⊗ tau_(cal(Z)) : A ⊗ cal(Z)_1 arrow.r A . $

The functional $tau_(cal(Z)) compose iota_n$ is a positive trace on $M_(k_n)$. Indeed, the square-root order-zero map satisfies

$ iota_n^(1 \/ 2) \( z \)^(*) iota_n^(1 \/ 2) \( z \) = iota_n \( z^(*) z \) \, #h(2em) iota_n^(1 \/ 2) \( z \) iota_n^(1 \/ 2) \( z \)^(*) = iota_n \( z z^(*) \) . $

Its mass is $s_n$, so

$ L T_n = s_n L_(k_n) . $

It follows that $L theta_n \( a \) arrow.r a$ for every $a in A$. The product estimate for an order-zero map also gives

$ parallel theta_n \( c \) theta_n \( d \) parallel lt.eq parallel alpha_n \( c \) alpha_n \( d \) parallel arrow.r 0 #h(2em) \( c \, d in A_(+) \, med c d = 0 \) . $

Consequently the maps $theta_n$ induce a c.p.c. order-zero map

#[#set math.equation(numbering: n => "(4.6)")
 $ theta : A arrow.r B_1 \, #h(2em) theta \( a \) = \( theta_n \( a \) \)_omega \, #h(2em) \( w_(n \, j) \)_omega = theta \( x_j \) . $ <setup:theta>]

The same letter $L$ will denote the induced unital completely positive map $B_1 arrow.r A_omega$. With the constant inclusion of $A$ into $A_omega$ understood, we have $L theta = L pi = upright("id")_A$.

#thm([Lemma 4.3.])[
  (The common part).  #emph[There is a positive contraction $e in B_1$ such that, with $q = 1 - e$, 
#[#set math.equation(numbering: n => "(4.7)")
 $ L \( e \) = 0 \, #h(2em) \[ e \, pi \( a \) \] = \[ e \, theta \( a \) \] = 0 \, #h(2em) q theta \( a \) = q pi \( a \) quad \( a in A \) . $ <setup:common-equations>]

 In particular, if $h = theta \( 1 \)$, then $q h = q$.]
] <setup:common>

#proof[
  Both ranges $pi \( A \)$ and $theta \( A \)$ belong to the multiplicative domain of $L$. For $theta$, the two Schwarz inequalities give
  $ a^(*) a = L \( theta \( a \) \)^(*) L \( theta \( a \) \) lt.eq L \( theta \( a \)^(*) theta \( a \) \) lt.eq L \( theta \( a^(*) a \) \) = a^(*) a . $
  The analogous equalities hold with $a$ and $a^(*)$ interchanged. The assertion for $pi$ follows in the same way, or directly from its multiplicativity.
  Let $D_0 = C^(*) \( pi \( A \) \, theta \( A \) \) subset B_1$. This is a separable unital algebra, $L \|_(D_0)$ is a homomorphism, and
  $ J = ker \( L \|_(D_0) \) $
  is an ideal containing $theta \( a \) - pi \( a \)$ for every $a in A$. Choose a positive contractive quasicentral approximate unit $\( f_l \)$ for $J$ in $D_0$. Then $L \( f_l \) = 0$, the commutators of $f_l$ with both ranges tend to zero, and
  $ \( 1 - f_l \) \( theta \( a \) - pi \( a \) \) arrow.r 0 #h(2em) \( a in A \) . $
  Lift the $f_l$ to positive contractive sequences in $A ⊗ cal(Z)_1$. Apply the countable diagonalization of Lemma 11 to the preceding equations on dense countable subsets, together with the coordinate test $parallel L \( f_(l \, n) \) parallel$. The latter tends to zero along $omega$ for each fixed $l$. The resulting positive contraction $e in B_1$ satisfies (4.7). Taking $a = 1$ gives $q h = q$. ◻
]

Fix positive contractive representatives $e_n in A ⊗ cal(Z)_1$ of $e$, and write

#[#set math.equation(numbering: n => "(4.8)")
 $ q_n = 1 - e_n \, #h(2em) ell_n = parallel L \( e_n \) parallel . $ <setup:representatives>]

Thus $ell_n arrow.r_omega 0$. Exact vanishing of $L \( e_n \)$ at any coordinate is neither asserted nor needed.

=== 4.3 Rank estimates on a prescribed ideal <rank-estimates-on-a-prescribed-ideal>

Fix $j$ temporarily, and abbreviate

$ a = a_j \, quad gamma = gamma_j \, quad x = x_j \, quad b = b_j \, quad w_n = w_(n \, j) . $

Inside $A ⊗ cal(Z)_1 subset R$, set

#[#set math.equation(numbering: n => "(4.9)")
 $ u_(n \, 0) & = x^(1 \/ 2) e_n x^(1 \/ 2) \,\
u_(n \, 1) & = w_n^(1 \/ 2) e_n w_n^(1 \/ 2) \,\
z_n & = a^(1 \/ 2) \( q_n - 1 \/ 2 \)_(+) a^(1 \/ 2) . $ <trace:coordinate-positives>]

These are positive contractions.

#thm([Lemma 4.4.])[
  (Localized rank estimates).  #emph[For each $j$ there are nonnegative numbers $epsilon_(n \, j) arrow.r_omega 0$, independent of the trace, with the following properties. Let $lambda$ be any lower semicontinuous extended trace on $R$, and let $tau = lambda \|_A$. If $d_tau \( b \) < oo$, then, for $i = 0 \, 1$ and $eta > 0$, 
#[#set math.equation(numbering: n => "(4.10)")
 $ d_lambda \( \( u_(n \, i) - eta \)_(+) \) lt.eq eta^(- 1) epsilon_(n \, j) d_tau \( b \) . $ <trace:small-rank>]

 If $ell_n lt.eq 1 \/ 4$, then, with no finiteness assumption, 
#[#set math.equation(numbering: n => "(4.11)")
 $ d_lambda \( \( z_n - gamma \/ 16 \)_(+) \) gt.eq \( gamma \/ 16 \) d_tau \( b \) . $ <trace:large-rank>]

]
] <trace:rank>

#proof[
  We first work under the hypothesis $d_tau \( b \) < oo$. On the hereditary subalgebra $"her"_A \( b \) ⊗ cal(Z)_1$ one has
  #[#set math.equation(numbering: n => "(4.12)")
   $ lambda \( y \) = tau \( L \( y \) \) #h(2em) \( y gt.eq 0 \) . $ <trace:localized-expectation>]
  To justify this formula, every positive contraction in $"her"_R \( b ⊗ 1 \)$ has $lambda$-value at most $d_lambda \( b ⊗ 1 \) = d_tau \( b \)$. The restriction of $lambda$ to $"her"_A \( b \) ⊗ cal(Z)_1$ therefore extends to a bounded trace; the same holds for $tau$ on $"her"_A \( b \)$. For a positive $s in "her"_A \( b \)$, the functional
  $ v mapsto lambda \( s ⊗ v \) $
  is a bounded positive trace on $cal(Z)_1$, of mass $tau \( s \)$. Its trace identity follows by applying the trace identity for $lambda$ to $s^(1 \/ 2) ⊗ z$. Uniqueness of the tracial state of $cal(Z)$ gives $lambda \( s ⊗ v \) = tau \( s \) tau_(cal(Z)) \( v \)$. Linearity and density prove (4.12). In particular,
  #[#set math.equation(numbering: n => "(4.13)")
   $ lambda \( u_(n \, 0) \) = tau \( x^(1 \/ 2) L \( e_n \) x^(1 \/ 2) \) lt.eq ell_n tau \( x \) lt.eq ell_n d_tau \( b \) . $ <trace:first-small-part>]
  There is a separate estimate for $w_n$, which need not lie in that hereditary subalgebra. Define
  $ rho_n = lambda compose T_n \, #h(2em) sigma_n \( s \) = rho_n \( s ⊗ 1 \) quad \( s in A_(+) \) . $
  Order-zero square-root calculus shows that $rho_n$ is an extended trace; its lower semicontinuity follows from continuity of $T_n$. Furthermore,
  $ sigma_n \( s \) = lambda \( s ⊗ iota_n \( 1 \) \) lt.eq lambda \( s ⊗ 1 \) = tau \( s \) . $
  Lemma 10, applied to $rho_n$, gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ rho_n \( Y \) = sigma_n \( L_(k_n) \( Y \) \) #h(2em) \( Y in \( A ⊗ M_(k_n) \)_(+) \) . $ <trace:matrix-formula>]
  This identity includes infinite values. It follows from (4.4) that
  #[#set math.equation(numbering: n => "(4.15)")
   $ lambda \( w_n \) lt.eq tau \( L_(k_n) \( W_(n \, j) \) \) lt.eq tau \( x \) + delta_(n \, j) d_tau \( b \) < oo . $ <trace:retained-finite>]
  Put
  $ S_n = w_n^(1 \/ 2) q_n w_n^(1 \/ 2) \, #h(2em) S'_n = x^(1 \/ 2) q_n x^(1 \/ 2) \, #h(2em) Delta_(n \, j) = parallel S_n - S'_n parallel . $
  The common-part identity implies $Delta_(n \, j) arrow.r_omega 0$: in the quotient, the two expressions are respectively $q theta \( x \)$ and $q pi \( x \)$. Compressing $S'_n lt.eq S_n + Delta_(n \, j) 1$ by $x^(1 \/ \( 2 r \))$ gives
  $ lambda \( x^(1 \/ \( 2 r \)) S'_n x^(1 \/ \( 2 r \)) \) lt.eq lambda \( S_n \) + Delta_(n \, j) tau \( x^(1 \/ r) \) lt.eq lambda \( S_n \) + Delta_(n \, j) d_tau \( b \) . $
  Here the compression of $S_n$ has trace at most $lambda \( S_n \)$, by traciality and contractivity of $x^(1 \/ \( 2 r \))$. The compressed $S'_n$ converges in norm to $S'_n$ as $r arrow.r oo$. Lower semicontinuity yields
  #[#set math.equation(numbering: n => "(4.16)")
   $ lambda \( S'_n \) lt.eq lambda \( S_n \) + Delta_(n \, j) d_tau \( b \) . $ <trace:localized-norm-error>]
  All of $lambda \( w_n \)$, $lambda \( S_n \)$, $lambda \( S'_n \)$, and $tau \( x \)$ are finite in the case under consideration. We may therefore subtract these trace values. Since $x = S'_n + u_(n \, 0)$ and $w_n = S_n + u_(n \, 1)$, (4.15) and (4.16) give
  $ lambda \( u_(n \, 1) \) lt.eq lambda \( u_(n \, 0) \) + \( delta_(n \, j) + Delta_(n \, j) \) d_tau \( b \) . $
  Together with (4.13), this proves, for both $i = 0 \, 1$,
  $ lambda \( u_(n \, i) \) lt.eq \( delta_(n \, j) + Delta_(n \, j) + ell_n \) d_tau \( b \) . $
  Set
  #[#set math.equation(numbering: n => "(4.17)")
   $ epsilon_(n \, j) = delta_(n \, j) + Delta_(n \, j) + ell_n . $ <trace:error-coefficient>]
  The trace-cut estimate (2.3) proves (4.10). In particular, when $d_tau \( b \) = 0$ the right side is exactly zero, not an absolute error term.
  We now prove (4.11). Suppose $ell_n lt.eq 1 \/ 4$ and write
  $ t_n = \( z_n - gamma \/ 16 \)_(+) . $
  Because $\( q_n - 1 \/ 2 \)_(+) gt.eq 1 \/ 2 - e_n$ and $t_n gt.eq z_n - \( gamma \/ 16 \) 1$, we have
  #[#set math.equation(numbering: n => "(4.18)")
   $ L \( t_n \) gt.eq \( 1 \/ 2 - ell_n \) a - \( gamma \/ 16 \) 1 . $ <trace:expectation-lower>]
  On the support of $b$, the element $a$ is at least $gamma \/ 2$. Consequently compression by $b^(1 \/ \( 2 r \))$ gives
  #[#set math.equation(numbering: n => "(4.19)")
   $ b^(1 \/ \( 2 r \)) L \( t_n \) b^(1 \/ \( 2 r \)) gt.eq \( gamma \/ 16 \) b^(1 \/ r) . $ <trace:compressed-lower>]
  If $d_tau \( b \) < oo$, the compression $b^(1 \/ \( 2 r \)) t_n b^(1 \/ \( 2 r \))$ belongs to $"her"_A \( b \) ⊗ cal(Z)_1$, so (4.12) and traciality imply
  $ lambda \( t_n \) gt.eq tau \( b^(1 \/ \( 2 r \)) L \( t_n \) b^(1 \/ \( 2 r \)) \) gt.eq \( gamma \/ 16 \) tau \( b^(1 \/ r) \) . $
  Let $r arrow.r oo$ and use $d_lambda \( t_n \) gt.eq lambda \( t_n \)$, since $t_n$ is a contraction. This proves (4.11) in the finite-rank case, including rank zero.
  For the infinite-rank case we use ideals, without appealing to (4.12). First,
  #[#set math.equation(numbering: n => "(4.20)")
   $ L \( t_n \) ⊗ 1 in "Ideal"_R \( t_n \) . $ <trace:expectation-ideal>]
  To see this, apply the domination theorem, Theorem 13, on $cal(Z)_1$ to $v mapsto tau_(cal(Z)) \( v \) 1$ and the identity map. The source is exact, the maps are nuclear, the identity has order zero, and the required pointwise ideal containment follows from simplicity of $cal(Z)$. There are therefore completely positive maps of the form
  $ V_l \( v \) = sum_s z_(l \, s)^(*) v z_(l \, s) $
  converging pointwise in norm to $tau_(cal(Z)) \( v \) 1$. Including $1$ in the approximation tests allows us to require $parallel V_l parallel lt.eq 2$. Tensoring with $upright("id")_A$ then preserves pointwise norm convergence: it holds first on elementary tensors, and the uniform norm bound extends it to their completion. Each resulting approximation to $L \( t_n \) ⊗ 1$ is a sum of compressions of $t_n$ in $R$, proving (4.20).
  Let $I = "Ideal"_R \( t_n \)$. In $R \/ I$, equation (4.18) and (4.20) give
  $ 0 gt.eq \( 1 \/ 2 - ell_n \) \( a + I \) - \( gamma \/ 16 \) \( 1 + I \) . $
  Thus $parallel a + I parallel lt.eq gamma \/ 4$, and $\( a - gamma \/ 4 \)_(+) in I$. Taking one more positive cut gives
  $ b = #scale(x: 120%, y: 120%)[\(] \( a - gamma \/ 4 \)_(+) - gamma \/ 4 #scale(x: 120%, y: 120%)[\)]_(+) \, #h(2em) \[ b \] lt.eq M \[ t_n \] $
  for some finite positive integer $M$. If $d_tau \( b \) = oo$, then $d_lambda \( b \) = oo$, so this comparison forces $d_lambda \( t_n \) = oo$. This finishes the proof in all cases. ◻
]

=== 4.4 Slowly chosen corners and bounded comparison witnesses <slowly-chosen-corners-and-bounded-comparison-witnesses>

We let the number of available orthogonal copies in the second Jiang–Su factor grow slowly with the coordinate, so that the localized comparisons remain valid.

#thm([Proposition 4.5.])[
  (Localized comparison).  #emph[There is a sequence $m \( n \) gt.eq 2$ with $m \( n \) arrow.r_omega oo$ such that, on putting 
$ P_n = D_(m \( n \)) in cal(Z)_2 \, #h(2em) P = \( P_n \)_omega in B \, #h(2em) Psi \( a \) = P \( q - 1 \/ 2 \)_(+) pi \( a \) \, $

 the map $Psi : A arrow.r B$ is c.p.c. order zero and, for every $j gt.eq 1$, 
#[#set math.equation(numbering: n => "(4.21)")
 $ e pi \( x_j \) \, med e theta \( x_j \) prec.tilde \( Psi \( a_j \) - c_j \)_(+) quad upright("in ") B \, #h(2em) c_j = gamma_j \/ 64 . $ <trace:small-part-comparison>]

]
] <trace:comparison>

#proof[
  Temporarily fix $m gt.eq 2$ and $j$, and keep the abbreviations from the preceding proof. The copy of $D_m$ is now in $cal(Z)_2$, separate from $z_n$ and $t_n = \( z_n - gamma \/ 16 \)_(+)$. The compression identity in (4.1) gives
  #[#set math.equation(numbering: n => "(4.22)")
   $ \[ t_n \] lt.eq K_m \[ t_n \( D_m - 1 \/ 2 \)_(+) \] lt.eq K_m \[ \( z_n D_m - gamma \/ 32 \)_(+) \] quad upright("in ") W \( R \) . $ <trace:separate-leg-comparison>]
  For the second inequality, use joint functional calculus and the scalar inequality
  $ \( s - gamma \/ 16 \)_(+) \( t - 1 \/ 2 \)_(+) lt.eq \( s t - gamma \/ 32 \)_(+) #h(2em) \( 0 lt.eq s \, t lt.eq 1 \) . $
  Where the left side is positive, the difference between the uncut expression on the right and the left side is $s \/ 2 + \( gamma \/ 16 \) t - gamma \/ 16 gt.eq 0$; elsewhere the assertion is immediate.
  Enumerate the countable set of pairs $\( j \, eta \)$ with $j gt.eq 1$ and $eta in bb(Q)_(> 0)$. For each $m gt.eq 2$ let $Omega_m$ be an $omega$-large set on which $ell_n lt.eq 1 \/ 4$ and
  #[#set math.equation(numbering: n => "(4.23)")
   $ eta^(- 1) epsilon_(n \, j) lt.eq frac(gamma_j, 32 K_m) $ <trace:slow-requirement>]
  for all the first $m$ pairs. Such a set exists because the finitely many error coefficients tend to zero along $omega$. Define
  $ E_m = { n : n gt.eq m } ∩ ⋂_(r = 2)^m Omega_r . $
  The sets $E_m$ are decreasing and $omega$-large. If $n$ belongs to at least one $E_m$, let $m \( n \)$ be the largest such $m$; otherwise put $m \( n \) = 2$. The largest value exists since membership in $E_m$ requires $m lt.eq n$. This construction gives $m \( n \) arrow.r_omega oo$ and ensures that, for every fixed pair $\( j \, eta \)$, condition (4.23) with $m = m \( n \)$ holds on an $omega$-large set.
  Set $P_n = D_(m \( n \))$. For each fixed $\( j \, eta \)$, on the preceding $omega$-large set and for every lower semicontinuous extended trace $lambda$ on $R$, we claim
  #[#set math.equation(numbering: n => "(4.24)")
   $ d_lambda \( \( u_(n \, i) - eta \)_(+) \) lt.eq 1 / 2 d_lambda \( \( z_n P_n - gamma_j \/ 32 \)_(+) \) #h(2em) \( i = 0 \, 1 \) . $ <trace:uniform-gap>]
  When $d_tau \( b_j \) < oo$, combine (4.10), (4.11), (4.22), and (4.23):
  $ d_lambda \( \( u_(n \, i) - eta \)_(+) \) & lt.eq frac(gamma_j, 32 K_(m \( n \))) d_tau \( b_j \)\
 & lt.eq 1 / 2 d_lambda \( \( z_n P_n - gamma_j \/ 32 \)_(+) \) . $
  This includes $d_tau \( b_j \) = 0$. If $d_tau \( b_j \) = oo$, then (4.11) gives $d_lambda \( t_n \) = oo$, and (4.22), with finite $K_(m \( n \))$, forces the right side of (4.24) to be infinite. Thus (4.24) also holds in that case. Its coordinate set is independent of $lambda$.
  The element $P$ commutes with the entire first subsystem $B_1$. Also $q$ commutes with $pi \( A \)$. Hence $Psi$ is a homomorphism $pi$ multiplied by commuting positive contractions, and is c.p.c. order zero. In $B$ we have
  #[#set math.equation(numbering: n => "(4.25)")
   $ \( u_(n \, 0) \)_omega = e pi \( x_j \) \, #h(2em) \( u_(n \, 1) \)_omega = e theta \( x_j \) \, #h(2em) \( z_n P_n \)_omega = Psi \( a_j \) . $ <trace:coordinate-identifications>]
  Since $R$ is exact and $cal(Z)$-stable, Lemma 9 applies to (4.24). Thus, on an $omega$-large set,
  $ \( u_(n \, i) - eta \)_(+) prec.tilde \( z_n P_n - 2 c_j \)_(+) . $
  We explain the passage to the ultrapower, because the norm bound on witnesses is essential. Fix $j$, a positive rational $eta$, $i in { 0 \, 1 }$, and an accuracy $epsilon.alt > 0$, and let $u_i = \( u_(n \, i) \)_omega$. By Lemma 12, choose witnesses $r_n in R$ on this large set such that
  $ parallel r_n^(*) \( z_n P_n - c_j \)_(+) r_n - \( u_(n \, i) - eta \)_(+) #scale(x: 120%, y: 120%)[parallel] & < epsilon.alt \,\
parallel r_n parallel^2 & lt.eq \( 1 + epsilon.alt \) \/ c_j . $
  Set $r_n = 0$ elsewhere. This is a bounded sequence, so it defines $r in B$. By (4.25),
  $ parallel r^(*) \( Psi \( a_j \) - c_j \)_(+) r - \( u_i - eta \)_(+) #scale(x: 120%, y: 120%)[parallel] lt.eq epsilon.alt . $
  As $epsilon.alt$ is arbitrary, each displayed source cut is Cuntz below $\( Psi \( a_j \) - c_j \)_(+)$. Letting positive rational $eta$ decrease to zero proves (4.21). ◻
]

#thm([Lemma 4.6.])[
  #emph[For every positive integer $L$ there are contractions $v_1 \, dots.h \, v_L in B$, represented entirely in the $cal(Z)_2$ leg, such that 
#[#set math.equation(numbering: n => "(4.26)")
 $ v_l^(*) v_(l') = delta_(l l') P #h(2em) \( 1 lt.eq l \, l' lt.eq L \) . $ <trace:ultrapower-copies>]

 In particular these elements commute with $B_1$, and hence with $pi \( A \)$ and $q$.]
] <trace:copies>

#proof[
  At coordinates where $m \( n \) gt.eq L$, use the elements $v_(m \( n \) \, l)$ from Lemma 21; at all other coordinates use zero. The representatives have norm at most one. Since $m \( n \) arrow.r_omega oo$, their relations in (4.1) give (4.26). Their tensor-factor location gives the stated commutation. ◻
]

== 5 The supporting map and its relative commutant <sec:commutant>

We retain the notation of the preceding section. In particular,

$ R = A ⊗ cal(Z)_1 ⊗ cal(Z)_2 ⊗ cal(Z)_3 \, #h(2em) B = R_omega \, $

where $A$ is nonzero, separable, unital and nuclear. The maps $pi \, theta : A arrow.r B$ have ranges in the first subsystem $\( A ⊗ cal(Z)_1 \)_omega$, with $pi$ the constant first-factor homomorphism. The positive contractions $e \, q = 1 - e$ satisfy (4.7). The second-leg contraction $P$ defines

$ Psi \( a \) = P \( q - 1 \/ 2 \)_(+) pi \( a \) \, #h(2em) a in A . $

We shall use both the cut comparisons (4.21) and the arbitrarily long finite families of second-leg elements in (4.26). The constant third leg will remain available for the functional-calculus argument.

=== 5.1 A supporting map preserving the relevant ideals <a-supporting-map-preserving-the-relevant-ideals>

Put $h = theta \( 1_A \)$. An abstract supporting homomorphism for an order-zero map need not take values in its codomain. We therefore seek a c.p.c. order-zero map $hat(theta) : A arrow.r B$ with three roles. Its factorization $h hat(theta) = theta$ recovers the model and gives $h hat(theta) \( 1_A \) = h$, the support identity for $h$ in the second matrix corner below. The equality $q hat(theta) = q pi$ preserves the common supported part. Finally, pointwise ideal containment of $e hat(theta) \( a' \)$ and $e pi \( a' \)$ in $"Ideal"_B \( Psi \( a' \) \)$ supplies the hypothesis for Gabe’s theorem, Theorem 13, to approximate the error maps by finite sums of compressions of $Psi$.

#thm([Proposition 5.1.])[
  (A supporting map preserving ideals).  #emph[There is a c.p.c. order-zero map $hat(theta) : A arrow.r B$ whose range commutes with the constant copy of $cal(Z)_3$ and such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ h hat(theta) \( a \) = hat(theta) \( a \) h & = theta \( a \) \, #h(2em) a in A \,\
 & = 0 \, #h(2em) q hat(theta) \( a \) = q pi \( a \) \, #h(2em) a in A \,\
e hat(theta) \( a' \) \, med e pi \( a' \) & in "Ideal"_B \( Psi \( a' \) \) \, #h(2em) a' in A_(+) . $ <support:factorization>]

]
] <support:map>

#proof[
  Consider the order-zero root maps $theta^(1 \/ l)$, for $l gt.eq 1$. They commute with $e$ and the constant third leg. Indeed, each value $theta^(1 \/ l) \( a \)$ is a norm limit of sandwiches of $theta \( a \)$ by bounded continuous functions of $h$. One obtains these sandwiches by truncating $t^(\( 1 \/ l - 1 \) \/ 2)$ from above; the resulting scalar weights converge uniformly to $t^(1 \/ l)$ after multiplication by $t$. The same observation gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ e theta^(1 \/ l) \( x_j \) prec.tilde e theta \( x_j \) . $ <support:root-comparison>]
  Here $e$ commutes with the values involved, so the sandwiches also approximate the positive element on the left.
  Taking $a = 1_A$ in (4.7) gives $q h = q$. Continuous functional calculus therefore gives $q h^(1 \/ l) = q$, and the sandwich formula together with (4.7) yields
  $ q theta^(1 \/ l) \( a \) = q pi \( a \) \, #h(2em) a in A . $
  Moreover,
  $ h theta^(1 \/ l) \( a \) = theta^(1 \/ l) \( a \) h arrow.r theta \( a \) quad \( l arrow.r oo \) \, $
  by the uniform convergence of $t^(1 + 1 \/ l)$ to $t$ on $\[ 0 \, 1 \]$.
  For every fixed $j$, combining (5.2) with (4.21) gives
  $ e theta^(1 \/ l) \( x_j \) prec.tilde \( Psi \( a_j \) - c_j \)_(+) \, #h(2em) c_j = gamma_j \/ 64 > 0 . $
  The bounded-witness estimate of Lemma 12, with the spare cut $c_j$, now shows that this positive element can be approximated arbitrarily closely by $r_j^(*) Psi \( a_j \) r_j$, with
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel r_j parallel^2 lt.eq 2 \/ c_j . $ <support:witness-bound>]
  The bound depends on $j$ but, crucially, not on $l$.
  We apply the countable diagonalization principle of Lemma 11. To make the boundedness issue explicit, lift each root map to a sequence of c.p.c. maps into $R$ by the Choi–Effros lifting theorem. Keep fixed representatives of $e \, q \, h \, theta \, Psi$ and $pi$. The tests impose the factorization and common-part identities on countable dense subsets of $A$, commutation with $e$ and a dense subset of the constant third leg, and order zero on a countable dense family of orthogonal pairs of positive contractions. For each $j$ include a witness variable with a fixed representative bound strictly larger than $sqrt(2 \/ c_j)$, and impose
  $ e hat(theta) \( x_j \) = r_j^(*) Psi \( a_j \) r_j . $
  Every finite list is approximately solvable: take $l$ sufficiently large for the factorization tests, and then use the witnesses above with sufficiently small errors. Their fixed bounds allow the ultrapower tests to be realized by bounded coordinate variables. The diagonalization produces a c.p.c. map satisfying all the tests. Continuity extends the identities and commutations to all the specified elements; the dense orthogonality tests make the map order zero. This proves (5.1) and (5.1), as well as the witness identities for all $j$.
  It remains to extend ideal containment from the listed cuts in (3.1) to an arbitrary positive contraction $a' in A$. Such an $a'$ can be approximated arbitrarily closely by $x_j$ with $a_j in "Ideal"_A \( a' \)$. To see this, choose $d$ in the fixed dense positive family close to $a'$, and a small positive rational $r > parallel d - a' parallel$. The image of $d$ in $A \/ "Ideal"_A \( a' \)$ has norm less than $r$, so $\( d - r \)_(+) in "Ideal"_A \( a' \)$. This cut belongs to the chosen family; take it as $a_j$ and choose the accompanying rational $gamma_j$ small. Then $x_j = \( a_j - gamma_j \)_(+)$ is as close to $a'$ as desired.
  The map $Psi$ is a positive weight times the homomorphism $pi$, and the weight commutes with $pi \( A \)$. Consequently
  $ a_j in "Ideal"_A \( a' \) quad arrow.r.double quad Psi \( a_j \) in "Ideal"_B \( Psi \( a' \) \) : $
  apply $Psi$ to finite sums of products through $a'$ and pass to norm limits. The witness identity places $e hat(theta) \( x_j \)$ in this ideal. The comparison (4.21) similarly places $e pi \( x_j \)$ there. Taking norm limits, and then scaling, proves (5.1) for every $a' in A_(+)$. ◻
]

=== 5.2 Comparison inside the supported relative commutant <comparison-inside-the-supported-relative-commutant>

Define the c.p.c. order-zero map

$ rho = "diag" \( rho_0 \, rho_1 \) : A arrow.r M_2 \( B \) \, #h(2em) rho_0 = pi \, quad rho_1 = hat(theta) \, $

and its supported relative commutant

#[#set math.equation(numbering: n => "(5.4)")
 $ C = M_2 \( B \) ∩ rho \( A \)' ∩ { 1 - rho \( 1_A \) }^perp . $ <comm:definition>]

The last condition means annihilation on both sides. A matrix in $C$ supported in position $\( 0 \, 1 \)$ has an entry that intertwines $rho_1$ with $rho_0$ and satisfies both support conditions. The matrix’s two modulus squares lie in the diagonal corners of $C$ and have the same Cuntz class, allowing comparison of positive elements in the two corners inside one semigroup. For $b in B$, write $b^(\( i \))$ for the matrix with entry $b$ in position $\( i \, i \)$ and zeros elsewhere, using indices $i = 0 \, 1$. Put

$ C_i = { b in B : b^(\( i \)) in C } \, #h(2em) Q_i = q^(\( i \)) \, #h(2em) H = 1_B^(\( 0 \)) . $

The common-part identities show that $Q_i \, H in C$. They also imply that the matrix with $q^(1 \/ 2)$ in position $\( 0 \, 1 \)$ belongs to $C$: positive-support functional calculus passes the intertwining and support identities from $q$ to $q^(1 \/ 2)$. Its two modulus squares are $Q_1$ and $Q_0$. Thus

#[#set math.equation(numbering: n => "(5.5)")
 $ \[ Q_0 \] = \[ Q_1 \] quad upright("in ") W \( C \) . $ <comm:common-equivalence>]

#thm([Proposition 5.2.])[
  (Packing the error part).  #emph[For $i in { 0 \, 1 }$ and every positive contraction $c in C_i$, 
#[#set math.equation(numbering: n => "(5.6)")
 $ m \[ \( c^(1 \/ 2) e c^(1 \/ 2) \)^(\( i \)) \] & lt.eq \[ Q_0 \] \, &  & m in bb(N) \,\
 & lt.eq 2 \[ Q_0 \] &  & upright("in ") W \( C \) . $ <comm:small-part>]

]
] <comm:packing>

#proof[
  Fix $m gt.eq 1$ and set $t = c^(1 \/ 2) e c^(1 \/ 2)$. This positive contraction commutes with $rho_i \( A \)$ and satisfies $t rho_i \( 1_A \) = t$. The order-zero product identity therefore gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ t rho_i \( a \) rho_i \( b \) = t rho_i \( a b \) \, #h(2em) a \, b in A . $ <comm:supported-product>]
  Apply Theorem 13 to
  $ Phi \( a \) = t rho_i \( a \) \, #h(2em) Psi \( a \) = P \( q - 1 \/ 2 \)_(+) pi \( a \) . $
  Both maps are completely positive and nuclear, since their domain is nuclear, and $Psi$ is order zero. For $a in A_(+)$,
  $ Phi \( a \) = c^(1 \/ 2) e rho_i \( a \) c^(1 \/ 2) in "Ideal"_B \( Psi \( a \) \) $
  by Proposition 26. Hence finite sums $sum_(l = 1)^L y_l^(*) Psi \( thin dot.op thin \) y_l$ approximate $Phi$ pointwise in norm.
  Write $h_q = \( q - 1 \/ 2 \)_(+)$. For one such approximation, take $m L$ second-leg elements $v_(s l)$ from (4.26) and set
  $ r_s = sum_(l = 1)^L v_(s l) h_q^(1 \/ 2) y_l \, #h(2em) 1 lt.eq s lt.eq m . $
  These second-leg elements commute with $q$ and $pi \( A \)$, and satisfy $v_(s l)^(*) v_(s' l') = delta_(s s') delta_(l l') P$. Expanding the products therefore gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ r_s^(*) pi \( a \) r_(s') = delta_(s s') sum_(l = 1)^L y_l^(*) Psi \( a \) y_l \, #h(2em) a in A . $ <comm:packed-approximation>]
  For $f \( u \) = min { 1 \, 2 u }$ on $\[ 0 \, 1 \]$ one also has $f \( q \) r_s = r_s$, since $f \( q \) h_q^(1 \/ 2) = h_q^(1 \/ 2)$. Include $1_A$ in the approximation set. As $Phi \( 1_A \) = t$ and $parallel t parallel lt.eq 1$, sufficiently accurate approximations in (5.8) have $parallel r_s parallel^2 lt.eq 2$. Thus, for this fixed $m$, there is a fixed bound on every packed variable, independent of $L$ and of the approximation accuracy.
  Using bounded coordinate lifts and the diagonalization principle of Lemma 11 on a countable dense subset of $A$, we obtain $r_1 \, dots.h \, r_m in B$ with
  #[#set math.equation(numbering: n => "(5.9)")
   $ f \( q \) r_s = r_s \, #h(2em) r_s^(*) pi \( a \) r_(s') = delta_(s s') t rho_i \( a \) \, #h(2em) a in A . $ <comm:packed-exact>]
  These elements are intertwiners. Indeed, using (5.7) and (5.9), the right modulus square of $pi \( a \) r_s - r_s rho_i \( a \)$ is
  $ t rho_i \( a^(*) a \) - t rho_i \( a^(*) \) rho_i \( a \) = 0 . $
  Consequently $pi \( a \) r_s = r_s rho_i \( a \)$ for all $a in A$. Taking $a = 1_A$ gives $r_s rho_i \( 1_A \) = r_s$ as well. The matrix $R_s$ with $r_s$ in position $\( 0 \, i \)$ thus belongs to $C$, including its support condition.
  For the row $V = \( R_1 \, dots.h \, R_m \)$ over $C$, the positive matrix $V^(*) V$ has $m$ diagonal entries equal to $t^(\( i \))$ and all other entries zero. Meanwhile $V V^(*) in "her"_C \( Q_0 \)$: (5.9) gives $f \( Q_0 \) V V^(*) f \( Q_0 \) = V V^(*)$, and $f \( 0 \) = 0$. Equality of the Cuntz classes of the two modulus squares now proves (5.6).
  Finally,
  $ c = c^(1 \/ 2) e c^(1 \/ 2) + c^(1 \/ 2) q c^(1 \/ 2) . $
  The second summand, placed in corner $i$, is Cuntz below $Q_i$ inside $C$. Apply (5.6) with $m = 1$, the subadditivity of Cuntz classes of positive sums, and (5.5). This proves (5.6). ◻
]

#thm([Corollary 5.3.])[
  #emph[The elements $Q_0 \, Q_1$ and $H$ are full in $C$, and $C$ is full in $M_2 \( B \)$.]
] <comm:fullness>

#proof[
  Every positive element of $M_2 \( B \)$ is bounded by twice its diagonal part. For an element of $C_(+)$, each diagonal corner also lies in $C$, because $rho$ and its support condition are diagonal. After scaling, (5.6) shows that these corners belong to the ideal generated by $Q_0$. Hence so does the original positive element. Thus $Q_0$ is full; the same holds for $Q_1$ by (5.5), and for $H$ because $Q_0 lt.eq H$. The corner projection $H$ is full in the ambient matrix algebra $M_2 \( B \)$, so the latter also contains $C$ as a full subalgebra. ◻
]

#thm([Proposition 5.4.])[
  #emph[The ordered semigroup $W \( C \)$ is almost unperforated.]
] <comm:unperforated>

#proof[
  Suppose $\( N + 1 \) x lt.eq N y$ in $W \( C \)$, with $N gt.eq 1$. Choose a separable $C^(*)$-subalgebra $C_(*) subset C$ containing the matrix entries of representatives of $x \, y$ and of countably many comparison witnesses. The inequality then already holds over $C_(*)$.
  There is a unital copy of $cal(Z)$ in $M_2 \( B \)$ commuting with both $C_(*)$ and $rho \( A \)$. Here is the coordinate argument, which also allows the representatives of $C_(*)$ to vary with the coordinate. Choose isomorphisms $sigma_l : cal(Z) ⊗ cal(Z) arrow.r cal(Z)$ with $sigma_l \( d ⊗ 1 \) arrow.r d$, and put $nu_l \( z \) = sigma_l \( 1 ⊗ z \)$. For fixed $d in cal(Z)$,
  $ parallel \[ nu_l \( z \) \, d \] parallel lt.eq 2 parallel z parallel thin parallel d - sigma_l \( d ⊗ 1 \) parallel . $
  Thus the commutators tend to zero uniformly for $z$ in the unit ball. Place these embeddings diagonally on the third tensor leg of $M_2 \( R \)$. Tensor approximation gives the same uniform commutation property with any fixed element of $M_2 \( R \)$. At coordinate $n$, choose $l$ sufficiently large for the entries of representatives of the first $n$ elements of countable dense commutation data, with tolerance tending to zero. The resulting coordinate embeddings induce a unital embedding $nu : cal(Z) arrow.r M_2 \( B \)$ commuting with $C_(*)$ and $rho \( A \)$. It is isometric because each coordinate embedding is isometric.
  Multiplication gives a homomorphism
  $ C_(*) ⊗ cal(Z) arrow.r C \, #h(2em) c ⊗ z mapsto c nu \( z \) . $
  Commutation gives a homomorphism on the maximal tensor product; nuclearity of $cal(Z)$ identifies it with the spatial tensor product. The range satisfies the support condition because $c$ does and $nu \( z \)$ commutes with $rho \( 1_A \)$. This homomorphism restricts to the original inclusion on $C_(*) ⊗ 1$.
  The algebra $C_(*) ⊗ cal(Z)$ is $cal(Z)$-stable. Its Cuntz semigroup is therefore almost unperforated by Theorem 8. Tensoring the original inequality with $1_(cal(Z))$ gives comparison of the images of $x$ and $y$ there. Mapping the comparison back to $C$ yields $x lt.eq y$.
  Here the reindexed copy $nu \( cal(Z) \)$ is used for this inequality alone. The constant third-leg copy retained above is the separate source of the weight $k$ below; no commutation between these two copies is required. ◻
]

We next use the full projection $H$, the corner divisibility supplied by Lemma 21, and almost unperforation of $W \( C \)$ to verify the structural hereditary hypothesis of the BBSTWW criterion recalled in Lemma 14.

#thm([Proposition 5.5.])[
  #emph[Let $D subset C$ be a full hereditary subalgebra. Suppose that $y in D$ and that totally full positive elements $e_l \, e_r in D$ satisfy 
$ e_l y = y e_r = 0 . $

 Then there is a full element $s in D$ with $s y = y s = 0$.]
] <conjugacy:hereditary>

#proof[
  Fullness of $e_l \, e_r$ in $D$ and fullness of $D$ in $C$ imply that both elements are full in $C$. Since $H$ is a projection, there is a common finite integer $N gt.eq 1$ such that
  #[#set math.equation(numbering: n => "(5.10)")
   $ \[ H \] lt.eq N \[ e_l \] \, #h(2em) \[ H \] lt.eq N \[ e_r \] quad upright("in ") W \( C \) . $ <conjugacy:projection-domination>]
  Use the positive contraction $D_(N + 1)$ from the order-zero supplies on a constant $cal(Z)$ leg, and put $p_0 = \( D_(N + 1) \)^(\( 0 \))$. It belongs to $C$, since the first-corner map is $pi$, and it has norm one. Simplicity of the constant leg gives fullness of $p_0$ in the corner with unit $H$; because $H$ is full in $C$, so is $p_0$.
  The $N + 1$ accompanying elements from Lemma 21, placed in this corner, form a row over $C$ whose right modulus square is the diagonal sum of $N + 1$ copies of $p_0$, while its left modulus square belongs to $H C H$. Hence
  $ \( N + 1 \) \[ p_0 \] lt.eq \[ H \] . $
  Combining this with (5.10) and Proposition 29 gives $p_0 prec.tilde e_l \, e_r$ in $C$. We may therefore choose $w_l \, w_r in C$ so that
  $ A_l = w_l^(*) e_l w_l \, #h(2em) A_r = w_r^(*) e_r w_r $
  are as close to $p_0$ as prescribed.
  We specify the accuracy before choosing these witnesses. Fullness of $p_0^2$ in the constant simple leg gives fixed $z_1 \, dots.h \, z_L in H C H$ with
  $ sum_(j = 1)^L z_j^(*) p_0^2 z_j = H . $
  Choose $epsilon > 0$ such that
  #[#set math.equation(numbering: n => "(5.11)")
   $ \( 2 epsilon + epsilon^2 \) sum_(j = 1)^L parallel z_j parallel^2 < 1 \, $ <conjugacy:fullness-tolerance>]
  and choose $w_l \, w_r$ with $parallel A_l - p_0 parallel \, parallel A_r - p_0 parallel < epsilon$. Set
  $ s = e_r^(1 \/ 2) w_r w_l^(*) e_l^(1 \/ 2) . $
  Heredity gives $s in D$, since $D C D subset D$. Functional calculus applied to the annihilation identities gives $e_l^(1 \/ 2) y = y e_r^(1 \/ 2) = 0$, so $s y = y s = 0$.
  Let $J = "Ideal"_C \( s \)$. It contains
  $ w_r^(*) e_r^(1 \/ 2) s thin e_l^(1 \/ 2) w_l = A_r A_l \, #h(2em) parallel A_r A_l - p_0^2 parallel lt.eq 2 epsilon + epsilon^2 . $
  Thus the element $b = sum_j z_j^(*) A_r A_l z_j in J$ satisfies $parallel H - b parallel < 1$ by (5.11). The image of $H$ in $C \/ J$ is a projection of norm less than one, and is therefore zero. Since $H$ is full in $C$, this forces $J = C$.
  It remains to prove that $s$ is full inside $D$. Let $I = "Ideal"_D \( s \)$. For any ideal $I$ of a hereditary subalgebra $D subset C$, one has
  $ D thin "Ideal"_C \( I \) thin D subset I . $
  Indeed, the ideal in the middle is the closed linear span of products through elements of $I$. By linear decomposition it is enough to use a positive middle element $i in I_(+)$, and then
  $ d c i c' d' = \( d c thin i^(1 \/ 3) \) thin i^(1 \/ 3) thin \( i^(1 \/ 3) c' d' \) in I : $
  the two outer factors lie in $D$ by heredity. Here $"Ideal"_C \( I \)$ contains $J = C$, so the displayed inclusion and an approximate identity of $D$ give $D subset I$. Hence $I = D$, proving that $s$ is full in $D$. ◻
]

=== 5.3 Full-spectrum weights and unitary equivalence <full-spectrum-weights-and-unitary-equivalence>

The structural conditions on $C$ in Lemma 14 are now verified. We turn to the remaining input: totally full contractions with matching Cuntz classes under positive functional calculus.

Fix a positive contraction $k$ of spectrum $\[ 0 \, 1 \]$ in the retained constant third leg. Such a $k$ is obtained from the scalar interval coordinate in a prime dimension-drop algebra embedded in $cal(Z)_3$. When necessary, a third-leg element also denotes its diagonal copy in $M_2 \( B \)$. Set

#[#set math.equation(numbering: n => "(5.12)")
 $ h_0 = k^(\( 0 \)) \, #h(2em) h_1 = \( k h \)^(\( 1 \)) . $ <conjugacy:weights>]

These are positive contractions in $C$. In the second corner, the support condition follows from $h hat(theta) \( 1_A \) = h$; commutation follows from Proposition 26.

#thm([Proposition 5.6.])[
  #emph[The elements $h_0 \, h_1$ are totally full in $C$. For every $g in C_0 \( \( 0 \, 1 \] \)_(+)$, the elements $g \( h_0 \)$ and $g \( h_1 \)$ are Cuntz equivalent in $C$.]
] <conjugacy:functions>

#proof[
  The case $g = 0$ is immediate. Otherwise rescale so that $parallel g parallel lt.eq 1$, and put
  $ G_i = g \( h_i \) \, #h(2em) T_i = Q_i G_i \, #h(2em) E_i = G_i - T_i = e^(\( i \)) G_i . $
  All these elements are positive and belong to $C$. The factors commute because $e$ commutes with $h$ and is represented in the first subsystem. Since $q h = q$, functional calculus gives $T_i = Q_i g \( k \)$. The matrix with $q^(1 \/ 2) g \( k \)^(1 \/ 2)$ in position $\( 0 \, 1 \)$ belongs to $C$ and has modulus squares $T_1 \, T_0$. Consequently
  #[#set math.equation(numbering: n => "(5.13)")
   $ \[ T_0 \] = \[ T_1 \] quad upright("in ") W \( C \) . $ <conjugacy:common-functions>]
  The positive element $g \( k \)$ is nonzero in the simple unital constant third leg. Choose finitely many elements $z_1 \, dots.h \, z_K$ in that leg with
  $ sum_(l = 1)^K z_l^(*) g \( k \) z_l = 1 . $
  For $delta > 0$ let
  $ b_delta \( u \) = cases(delim: "{", \( \( u - delta \)_(+) \/ u \)^(1 \/ 2) \, & u > 0 \,, 0 \, & u = 0 .) $
  The diagonalized $z_l$ commute with $Q_i$ and $rho \( A \)$ and multiply $C$ into itself. In particular $z_l b_delta \( Q_i \) in C$, and
  $ \( Q_i - delta \)_(+) = sum_(l = 1)^K \( z_l b_delta \( Q_i \) \)^(*) T_i \( z_l b_delta \( Q_i \) \) . $
  Taking all cuts proves
  #[#set math.equation(numbering: n => "(5.14)")
   $ \[ Q_i \] lt.eq K \[ T_i \] lt.eq K \[ G_i \] quad upright("in ") W \( C \) . $ <conjugacy:fullness-bound>]
  Since $Q_i$ is full, this shows that $g \( h_i \)$ is full for every nonzero $g$. In particular the two elements in (5.12) are totally full; the same argument also ensures that every such functional calculus is nonzero.
  Let $d$ be any dimension function on $W \( C \)$ normalized at either $\[ G_0 \]$ or $\[ G_1 \]$, if one exists. Equations (5.6) and (5.14), together with (5.5), imply
  $ 0 < d \( \[ Q_0 \] \) = d \( \[ Q_1 \] \) < oo . $
  Apply (5.6) with $c^(\( i \)) = G_i$. Since $G_i$ commutes with $e^(\( i \))$, it follows that $m \[ E_i \] lt.eq \[ Q_0 \]$ for every $m$, and hence $d \( \[ E_i \] \) = 0$. The inequalities
  $ \[ T_i \] lt.eq \[ G_i \] lt.eq \[ T_i \] + \[ E_i \] $
  and (5.13) now give
  #[#set math.equation(numbering: n => "(5.15)")
   $ d \( \[ G_0 \] \) = d \( \[ G_1 \] \) = 1 . $ <conjugacy:dimension-equality>]
  Fix $eta > 0$. By continuity, $g \( 0 \) = 0$, and $g eq.not 0$, there is a nonzero continuous function $g'$ with $0 lt.eq g' lt.eq g$ and support contained in the open set where $0 < g < eta$. For the dimension functions under consideration, (5.14) applied to $g'$ gives $d \( \[ g' \( h_i \) \] \) > 0$. This element is orthogonal to $\( G_i - eta \)_(+)$, and their sum is bounded by $G_i$. Therefore (5.15) gives
  $ d \( \[ \( G_i - eta \)_(+) \] \) + d \( \[ g' \( h_i \) \] \) lt.eq 1 \, #h(2em) d \( \[ \( G_i - eta \)_(+) \] \) < 1 = d \( \[ G_(1 - i) \] \) . $
  This holds for every dimension function normalized at $\[ G_(1 - i) \]$. The target $G_(1 - i)$ is full, so the ideal condition for the comparison criterion in Theorem 8 holds. Proposition 29 and that criterion yield $\( G_i - eta \)_(+) prec.tilde G_(1 - i)$. This use of the criterion also permits an empty family of normalized dimension functions. Taking all positive cuts, and then exchanging $i = 0 \, 1$, proves the required Cuntz equivalence. ◻
]

#thm([Proposition 5.7.])[
  (Weighted unitary equivalence).  #emph[Put $k^(\[ 0 \]) = k$ and $k^(\[ 1 \]) = 1 - k$, in the constant third leg. There are unitaries $U_0 \, U_1 in M_2 \( B \)$ such that 
#[#set math.equation(numbering: n => "(5.16)")
 $ U_i #scale(x: 120%, y: 120%)[\(] k^(\[ i \]) theta \( a \) #scale(x: 120%, y: 120%)[\)]^(\( 1 \)) U_i^(*) = #scale(x: 120%, y: 120%)[\(] k^(\[ i \]) pi \( a \) #scale(x: 120%, y: 120%)[\)]^(\( 0 \)) \, #h(2em) a in A \, quad i = 0 \, 1 . $ <conjugacy:weighted-equation>]

 They can be chosen to commute with $rho \( A \)$.]
] <conjugacy:weighted>

#proof[
  Apply the relative-commutant unitary-equivalence criterion of Lemma 14, namely [3] Lemma 5.3, to (5.4). Its coordinate algebras are $M_2 \( R \)$, which are separable, unital and $cal(Z)$-stable, and its domain is the separable unital algebra $A$. The map $rho$ is c.p.c. order zero. Corollary 28 verifies fullness of $C$ in the ambient ultrapower; Proposition 30 verifies the required condition in every full hereditary subalgebra. Proposition 31 supplies total fullness and all the functional-calculus comparisons. Thus there is a unitary in the unitization of $C$ conjugating $h_1$ to $h_0$.
  Realizing this unitary in the ambient algebra as explained after Lemma 14 gives $U_0 in M_2 \( B \)$ commuting with $rho \( A \)$. Multiplying $U_0 h_1 U_0^(*) = h_0$ by $rho \( a \)$ and using (5.1) gives
  $ U_0 \( k theta \( a \) \)^(\( 1 \)) U_0^(*) = \( k pi \( a \) \)^(\( 0 \)) . $
  The element $1 - k$ also has spectrum $\[ 0 \, 1 \]$ in the constant third leg. Repeating the same argument with this element, with all the previously constructed maps unchanged, gives $U_1$ and the other identity in (5.16). ◻
]

Complementary weights are part of the two-coloured approximation framework developed in [25,3,7]. Here the required ideal-sensitive comparisons have been proved above. The two identities in (5.16) add to the first-corner inclusion because $k + \( 1 - k \) = 1$. The next section passes from these ultrapower identities to finite-dimensional approximations with exactly two order-zero return maps.

== 6 Two colours and hereditary permanence <sec:endgame>

We first turn the ultrapower conjugacies into finite-dimensional approximations of a corner inclusion. We then use stabilization to retain the same two colours when the target is the algebra itself.

#thm([Proposition 6.1.])[
  (Two-colour corner approximation).  #emph[Let $A$ be a nonzero separable unital nuclear $C^(*)$-algebra and put $R = A ⊗ cal(Z)^(⊗ 3)$. For every finite $cal(F) subset A$ and $epsilon > 0$, the map 
$ kappa_A : A arrow.r M_2 \( R \) \, #h(2em) kappa_A \( a \) = mat(delim: "(", a ⊗ 1, 0; 0, 0) $

 admits a finite-dimensional approximation with two colours: there are a finite-dimensional algebra $F$, a c.p.c. map $alpha : A arrow.r F$, and c.p.c. order-zero maps $phi_0 \, phi_1 : F arrow.r M_2 \( R \)$ such that 
$ parallel phi_0 alpha \( a \) + phi_1 alpha \( a \) - kappa_A \( a \) parallel < epsilon #h(2em) \( a in cal(F) \) . $

]
] <end:corner>

#proof[
  Use the notation and the two unitaries of Proposition 32. Write $k^(\[ 0 \]) = k$ and $k^(\[ 1 \]) = 1 - k$. Each unitary $U_i in M_2 \( R_omega \)$ has unitary representatives $U_(i \, n) in M_2 \( R \)$. Indeed, a bounded representative is asymptotically unitary on both sides. On an $omega$-large set its coordinates are invertible and polar correction gives unitaries with the same quotient class; put the identity on the remaining coordinates.
  For the matrix-model maps $alpha_n : A arrow.r F_n$ and $beta'_n : F_n arrow.r A ⊗ cal(Z)_1 subset R$, define
  $ phi_(i \, n) \( b \) = U_(i \, n) mat(delim: "(", 0, 0; 0, k^(\[ i \]) beta'_n \( b \)) U_(i \, n)^(*) . $
  Each map is c.p.c. order zero: its weight is a positive contraction in the third tensor factor, commuting with the range of $beta'_n$; corner inclusion and unitary conjugation preserve these properties. The conjugacies in Proposition 32 give, for every $a in A$,
  $ lim_(n arrow.r omega) parallel phi_(0 \, n) alpha_n \( a \) + phi_(1 \, n) alpha_n \( a \) - kappa_A \( a \) parallel = 0 \, $
  since $k^(\[ 0 \]) + k^(\[ 1 \]) = 1$. Choose one coordinate in the intersection of the finitely many $omega$-large approximation sets for $a in cal(F)$. This proves the assertion. The first map into $F_n xor F_n$ is $a mapsto \( alpha_n \( a \) \, alpha_n \( a \) \)$; it is contractive because the direct-sum norm is the maximum norm. ◻
]

#prodef([Remark 6.2.])[
  (Keeping two colours under stabilization).  To pass from the corner inclusion to the algebra itself, we first amplify by finite matrices. Matrix amplification preserves each order-zero return map, and the stabilization accommodates the second diagonal block of the amplified target. The resulting approximations still have two colours.
]

#thm([Lemma 6.3.])[
  (Passing from a corner to the stabilization).  #emph[Let $A$ be unital. Suppose that the first-corner inclusion $A arrow.r M_2 \( A \)$ has finite-dimensional approximations with two colours, with a c.p.c. first map and c.p.c. order-zero return maps. Then $dim_(upright("nuc")) \( A ⊗ cal(K) \) lt.eq 1$.]
] <end:stabilize>

#proof[
  Fix $m gt.eq 1$. For a finite set of elements of $A ⊗ M_m$, choose a two-colour approximation of $A arrow.r M_2 \( A \)$ accurate on all their matrix entries. Amplify every map by $upright("id")_(M_m)$. The intermediate algebra is still the direct sum of two finite-dimensional algebras, namely $E_0 ⊗ M_m$ and $E_1 ⊗ M_m$. The first map remains c.p.c. Each amplified return map remains c.p.c. order zero: if $phi = h phi_(upright("hom"))$, then
  $ \( phi ⊗ upright("id")_(M_m) \) \( x \) = \( h ⊗ 1 \) \( phi_(upright("hom")) ⊗ upright("id")_(M_m) \) \( x \) \, $
  with a commuting positive contractive weight.
  Embed $M_2 \( A \) ⊗ M_m$ into $A ⊗ cal(K)$ so that its first diagonal $m times m$ block is the prescribed first $m$-corner. The amplified approximation then approaches the inclusion of $A ⊗ M_m$ into $A ⊗ cal(K)$. Entrywise accuracy suffices: an $m times m$ matrix with entries of norm at most $delta$ has norm at most $m delta$.
  Let $p_m = 1_A ⊗ sum_(r = 1)^m e_(r r)$. Precompose the amplified first map with the c.p.c. compression $x mapsto p_m x p_m$ on $A ⊗ cal(K)$. For an arbitrary prescribed finite set in the stabilization, first choose $m$ so that these compressions approximate every element, then approximate the compressed finite set as above. The resulting composite has the same value on $x$ and $p_m x p_m$, so the total error is bounded by the compression error plus the finite-corner approximation error. This gives the required two-colour approximation on the stabilization. ◻
]

#proof[
  First let $A_0$ be nonzero and unital, and set $A = A_0 ⊗ cal(Z)$. Strong self-absorption gives isomorphisms
  $ sigma_l : cal(Z) ⊗ cal(Z) arrow.r cal(Z) \, #h(2em) sigma_l \( z ⊗ 1 \) arrow.r z . $
  Identify the three extra copies of $cal(Z)$ with one copy by a fixed unital isomorphism. The maps $upright("id")_(A_0) ⊗ sigma_l$ then give isomorphisms
  $ Gamma_l : A ⊗ cal(Z)^(⊗ 3) arrow.r A \, #h(2em) Gamma_l \( a ⊗ 1 \) arrow.r a quad \( a in A \) . $
  The convergence holds first on elementary tensors and then on all of $A$ by contractivity.
  Given a finite subset of $A$, choose $l$ so that $Gamma_l$ has the required accuracy on its first-factor images. Apply Proposition 33 with a sufficiently small error, and postcompose its return maps with $upright("id")_(M_2) ⊗ Gamma_l$. This gives two-colour approximations to $A arrow.r M_2 \( A \)$. Lemma 35 shows that $dim_(upright("nuc")) \( A ⊗ cal(K) \) lt.eq 1$.
  Nuclear dimension decreases on hereditary subalgebras [34] Proposition 2.5. Applying this to the first corner $A ⊗ e_11$ gives $dim_(upright("nuc")) \( A_0 ⊗ cal(Z) \) lt.eq 1$. For nonunital separable nuclear $A_0$, its unitization $tilde(A)_0$ is separable and nuclear. The unital case applies to $tilde(A)_0 ⊗ cal(Z)$, and $A_0 ⊗ cal(Z)$ is a closed two-sided ideal, hence a hereditary subalgebra, of that algebra. The same permanence result gives the bound. The zero algebra is immediate.
  Finally, if $A_0 tilde.equiv A_0 ⊗ cal(Z)$, transport these finite-dimensional approximations across the isomorphism. The first map is c.p.c., the two return maps are individually c.p.c. order zero, and their sum approximates the identity, exactly as in Definition 5. ◻
]

== 7 A real tensor with uniform sign separation <sec:gaussian>

The dimension bound is now proved. We turn to the independent splitting theorem that will supply absorption from finite nuclear dimension. Its first ingredient is purely real and finite-dimensional: one tensor must take both signs on every sufficiently separated product of two-point sets. The following lemma obtains this simultaneously over all such configurations. We equip real tensor powers with the Euclidean tensor product inner product.

#thm([Lemma 7.1.])[
  #emph[Fix $k gt.eq 2$ and $0 < r < 1$. There are $n gt.eq 1$ and $G in \( bb(R)^k \)^(⊗ n)$ such that, for every list of pairs of unit vectors $\( u_j^0 \, u_j^1 \)_(j = 1)^n$ satisfying 
$ \| chevron.l u_j^0 \, u_j^1 chevron.r \| lt.eq r #h(2em) \( 1 lt.eq j lt.eq n \) \, $

 the numbers 
$ chevron.l G \, u_1^(alpha_1) ⊗ dots.h.c ⊗ u_n^(alpha_n) chevron.r \, #h(2em) alpha in { 0 \, 1 }^n \, $

 include a value greater than $1 \/ 2$ and a value less than $- 1 \/ 2$.]
] <lem:gaussian>

#proof[
  Choose
  $ 0 < a < min {log 2 - log \( 4 \/ 3 \) - 1 / 4 log 3 \, med - 1 / 4 log r} . $
  The first expression is positive. A binary Hamming ball of radius $floor.l n \/ 4 floor.r$ has cardinality at most
  $ sum_(b = 0)^(floor.l n \/ 4 floor.r) binom(n, b) lt.eq 3^(n \/ 4) sum_(b = 0)^n binom(n, b) 3^(- b) = 3^(n \/ 4) \( 4 \/ 3 \)^n . $
  Gilbert’s greedy deletion argument [12] Theorem 1 therefore produces, for all sufficiently large $n$, a set $S_n subset { 0 \, 1 }^n$ of cardinality $N = floor.l e^(a n) floor.r$ whose distinct words have Hamming distance at least $n \/ 4$.
  Let the coordinates of $G$ be independent standard real Gaussian variables. Fix an admissible list and set
  $ X_alpha = chevron.l G \, u_1^(alpha_1) ⊗ dots.h.c ⊗ u_n^(alpha_n) chevron.r quad \( alpha in S_n \) . $
  These variables are jointly centered Gaussian. Their covariance matrix $Sigma$ has diagonal entries one and off-diagonal entries of absolute value at most $r^(n \/ 4)$. Consequently its eigenvalues lie in $\[ 1 - lambda_n \, 1 + lambda_n \]$, where
  $ lambda_n = N r^(n \/ 4) arrow.r 0 . $
  For large $n$, the density of this Gaussian vector is bounded pointwise by
  $ (frac(1 + lambda_n, 1 - lambda_n))^(N \/ 2) $
  times the density of $N$ independent centered Gaussians of variance $1 + lambda_n$. Indeed, $det Sigma gt.eq \( 1 - lambda_n \)^N$ and $Sigma^(- 1) gt.eq \( 1 + lambda_n \)^(- 1) I$.
  Writing $Phi$ for the standard normal distribution function gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ Pr \( X_alpha lt.eq 1 med forall alpha in S_n \) lt.eq [sqrt(frac(1 + lambda_n, 1 - lambda_n)) thin Phi #scale(x: 120%, y: 120%)[\(] \( 1 + lambda_n \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)]]^N lt.eq q^N $ <eq:prob>]
  for one $q < 1$ and every sufficiently large $n$. The last inequality is uniform over admissible lists because the bracket tends to $Phi \( 1 \) < 1$. By symmetry the same bound holds for the event $X_alpha gt.eq - 1$ for all $alpha$.
  Set $eta_n = \( 4 n k^(n \/ 2) \)^(- 1)$. The compact space of admissible lists has an $eta_n$-net, in the maximum Euclidean distance between corresponding vectors, of size at most
  $ \( C_k \/ eta_n \)^(2 k n) . $
  For example, mesh the coordinate cubes and select an admissible representative from each occupied box. The logarithm of this bound is $O \( n^2 \)$. A union bound using (7.1) shows that the probability that some net list lacks a value above $1$ or below $- 1$ is at most
  $ 2 \( C_k \/ eta_n \)^(2 k n) q^N arrow.r 0 . $
  Also $bb(E) parallel G parallel^2 = k^n$, so $Pr \( parallel G parallel lt.eq 2 k^(n \/ 2) \) gt.eq 3 \/ 4$. For large $n$, both the successful-net event and this norm bound therefore hold for some $G$.
  If an admissible list is approximated by a net list, telescoping the elementary tensors of unit vectors bounds the change of each evaluation by
  $ parallel G parallel thin n eta_n lt.eq 1 / 2 . $
  The two evaluations exceeding $1$ and below $- 1$ on the net list retain values above $1 \/ 2$ and below $- 1 \/ 2$, respectively. This proves the assertion for every admissible list. ◻
]

== 8 Testing signs in maximal tensor products <sec:tensor>

The goal is to prove Theorem 4: the two signs of one selfadjoint element will survive in every irreducible representation. Such representations of a maximal tensor product need not be spatial. The following factor argument and the pure-state excision method of Akemann–Anderson–Pedersen [1] Proposition 2.2 let us transfer the real evaluations of Lemma 36 without a spatial representation hypothesis. We include the required excision proof.

#thm([Lemma 8.1.])[
  (Products in commuting factors).  #emph[Let $M_1 \, dots.h \, M_n subset.eq cal(B) \( H \)$ be mutually commuting unital von Neumann factors. If $e_j in M_j$ is positive and $parallel e_j parallel = 1$, then 
$ ∥product_(j = 1)^n e_j∥ = 1 . $

]
] <lem:factors>

#proof[
  First, a product of nonzero projections $p_j in M_j$ is nonzero. Induct on $n$. By induction $q = p_2 dots.h.c p_n$ is a nonzero projection commuting with $M_1$. The restriction $M_1 arrow.r cal(B) \( q H \)$ is a nonzero normal representation. Its kernel is a weak-\* closed ideal in a factor and is therefore zero. Thus $p_1 q eq.not 0$.
  For $0 < epsilon < 1$, the spectral projections $p_j = upright(bold(1))_(\( 1 - epsilon \, 1 \]) \( e_j \)$ are nonzero. Their product is nonzero, and on its range the positive product $product_j e_j$ is at least $\( 1 - epsilon \)^n$. Letting $epsilon arrow.b 0$ proves the lower bound one; the reverse bound follows from contractivity. ◻
]

#thm([Lemma 8.2.])[
  (Pure-state excision).  #emph[Let $E$ be a unital $C^(*)$-algebra and $rho$ a pure state. Given a finite set $cal(F) subset E$ and $epsilon > 0$, there is a positive contraction $f in E$ with $parallel f parallel = 1$ such that 
$ parallel f x f - rho \( x \) f^2 parallel < epsilon #h(2em) \( x in cal(F) \) . $

]
] <lem:excision>

#proof[
  Let $\( gamma \, H \, xi \)$ be the irreducible GNS representation of $rho$, with $parallel xi parallel = 1$, and put
  $ L = { z in E : gamma \( z \) xi = 0 } . $
  We first show that $ker rho = L + L^(*)$. The inclusion from right to left is immediate. If $rho \( x \) = 0$, write $eta = gamma \( x \) xi perp xi$. If $eta = 0$, then $x in L$. Otherwise, on $"span" { xi \, eta }$ let $T$ be the rank-one operator with $T xi = eta$ and $T eta = 0$; thus $T^(*) xi = 0$. Apply the selfadjoint form of Kadison transitivity [15] Theorem 1 separately to the real and imaginary parts of $T$. This gives $y in E$ such that
  $ gamma \( y \) xi = eta \, #h(2em) gamma \( y^(*) \) xi = 0 . $
  Then $x - y in L$ and $y in L^(*)$, as desired.
  The algebra $L ∩ L^(*)$ is hereditary. Let $\( g_lambda \)$ be a positive contractive approximate identity for it. If $z in L$, then $z^(*) z in L ∩ L^(*)$, whence
  $ parallel z \( 1 - g_lambda \) parallel^2 = parallel \( 1 - g_lambda \) z^(*) z \( 1 - g_lambda \) parallel arrow.r 0 . $
  The adjoint assertion holds for elements of $L^(*)$. Therefore, with $f_lambda = 1 - g_lambda$, the equality $ker rho = L + L^(*)$ gives
  $ parallel f_lambda \( x - rho \( x \) 1 \) f_lambda parallel arrow.r 0 #h(2em) \( x in E \) . $
  Each $f_lambda$ is a positive contraction of norm one because $gamma \( f_lambda \) xi = xi$. One sufficiently large $lambda$ works for $cal(F)$. ◻
]

#proof[
  The closed ideal generated by commutators is all of $D$; otherwise a nonzero unital commutative quotient would supply a character. Decomposing elements into selfadjoint parts and rescaling, choose selfadjoint contractions $s_i \, t_i$ and elements $v_i \, w_i$, for $1 lt.eq i lt.eq m$, such that
  #[#set math.equation(numbering: n => "(8.1)")
   $ ∥1 - sum_(i = 1)^m v_i \[ s_i \, t_i \] w_i∥ < 1 / 2 . $ <eq:commutator>]
  Put $s_0 = 1$, $k = m + 1$, and $M = sum_i parallel v_i parallel parallel w_i parallel > 0$. Under any nonzero unital representation $sigma$, some represented commutator has norm greater than $delta = \( 2 M \)^(- 1)$. Since
  $ parallel \[ S \, T \] parallel lt.eq 2 parallel S - c 1 parallel parallel T parallel lt.eq "diam" \( "sp" S \) $
  when $S = S^(*)$, $parallel T parallel lt.eq 1$, and $c$ is the midpoint of $"sp" S$, the spectrum of some $sigma \( s_i \)$ has diameter at least $delta$.
  There are pure states $rho^0 \, rho^1$ of $sigma \( D \)$ taking that element to its two spectral endpoints. Indeed, a state attaining an endpoint extends from the unital abelian algebra $C^(*) \( 1 \, sigma \( s_i \) \)$, and the states attaining that endpoint form a nonempty weak-\* compact face of the state space. An extreme point of this face is pure. The associated real expectation vectors
  $ v^alpha = #scale(x: 120%, y: 120%)[\(] rho^alpha \( sigma \( s_b \) \) #scale(x: 120%, y: 120%)[\)]_(b = 0)^m in { 1 } times \[ - 1 \, 1 \]^m #h(2em) \( alpha = 0 \, 1 \) $
  differ by at least $delta$ in one coordinate. The set of pairs in $#scale(x: 120%, y: 120%)[\(] { 1 } times \[ - 1 \, 1 \]^m #scale(x: 120%, y: 120%)[\)]^2$ with $parallel v^0 - v^1 parallel_oo gt.eq delta$ is compact. Consequently there is $0 < r < 1$, independent of $sigma$, such that
  #[#set math.equation(numbering: n => "(8.2)")
   $ lr(|⟨frac(v^0, parallel v^0 parallel) \, frac(v^1, parallel v^1 parallel)⟩|) lt.eq r . $ <eq:angle>]
  To justify the strict bound, two vectors in this compact set cannot be negatively collinear because both first coordinates are one; positive collinearity forces them to coincide, contrary to their separation.
  Choose $G \, n$ from Lemma 36 for $k \, r$ and form the selfadjoint element
  #[#set math.equation(numbering: n => "(8.3)")
   $ h = sum_(b_1 \, dots.h \, b_n = 0)^m G_(b_1 dots.h b_n) s_(b_1) ⊗ dots.h.c ⊗ s_(b_n) in D^(⊗_max n) . $ <eq:h>]
  Let $pi$ be any nonzero irreducible representation of this tensor product, with factor restrictions $pi_j : D arrow.r cal(B) \( H \)$. For each $j$, choose the two pure states of $pi_j \( D \)$ described above. By (8.2) and Lemma 36, choosing one state $rho_j$ from each pair makes
  #[#set math.equation(numbering: n => "(8.4)")
   $ p = sum_(b_1 \, dots.h \, b_n = 0)^m G_(b_1 dots.h b_n) product_(j = 1)^n rho_j \( pi_j \( s_(b_j) \) \) $ <eq:p>]
  strictly positive for one choice and strictly negative for another. Removing the normalizations multiplies each tensor evaluation by a positive number and so preserves its sign.
  The von Neumann algebras $M_j = pi_j \( D \)''$ are mutually commuting factors: a central element of any $M_j$ commutes with every factor image and hence with the irreducible joint representation, so is scalar. For one of the choices in (8.4), use Lemma 38 to choose positive norm-one elements $e_j in pi_j \( D \)$ with
  $ parallel e_j pi_j \( s_b \) e_j - rho_j \( pi_j \( s_b \) \) e_j^2 parallel < epsilon quad \( 0 lt.eq b lt.eq m \) . $
  The product $e = product_j e_j$ is positive and has norm one by Lemma 37. Commuting distinct factors and telescoping their products in (8.3) yields
  #[#set math.equation(numbering: n => "(8.5)")
   $ parallel e pi \( h \) e - p e^2 parallel lt.eq n epsilon sum_(b_1 \, dots.h \, b_n) \| G_(b_1 dots.h b_n) \| . $ <eq:compression>]
  All factors in this estimate are contractions.
  If $p > 0$ and $pi \( h \) lt.eq 0$, then $p e^2 - e pi \( h \) e gt.eq p e^2$, so the left side of (8.5) is at least $p$. Choosing $epsilon$ sufficiently small is a contradiction. The negative choice of $p$, with its own excisers, similarly rules out $pi \( h \) gt.eq 0$. Thus
  $ pi \( h_(+) \) eq.not 0 \, #h(2em) pi \( \( - h \)_(+) \) eq.not 0 $
  for every nonzero irreducible $pi$. Each positive part is full: a proper closed ideal containing it would yield a nonzero quotient and hence an irreducible representation killing it. The two positive parts are orthogonal by functional calculus. ◻
]

The canonical unital map from the finite tensor power into the infinite maximal tensor power preserves fullness and orthogonality. Thus Theorem 4 also gives the affirmative answer to [17] Question 6.2.

== 9 Central sequence algebras <sec:central>

We now transfer the full signs of Theorem 4 to the central sequence algebra and apply the absorption criterion of Robert and Tikuisis. This completes the implication from finite nuclear dimension to absorption.

Retain the free ultrafilter $omega$ on $bb(N)$. For a $C^(*)$-algebra $A$, let

$ A_omega = ell^oo \( A \) \/ { \( a_l \) : lim_(l arrow.r omega) parallel a_l parallel = 0 } \, #h(2em) F \( A \) = \( A_omega ∩ A' \) \/ "Ann" \( A \) \, $

where $A$ is embedded diagonally and

$ "Ann" \( A \) = { b in A_omega : b a = a b = 0 upright(" for every ") a in A } . $

For nonzero separable $A$, this quotient is nonzero and unital. If $\( e_l \)$ is a sequential positive contractive approximate identity, its class is central and represents the unit. Indeed, for a bounded central sequence $\( b_l \)$ and $a in A$, commuting $b_l$ past $a$ shows $\( e_l b_l - b_l \) a arrow.r_omega 0$, and likewise on the other side. Also $e_l a arrow.r a$, so the unit is nonzero.

We use the following two results.

#thm([Theorem 9.1.])[
  (Winter–Zacharias and Robert–Tikuisis).  #emph[Let $A eq.not 0$ be separable with $dim_(upright("nuc")) A lt.eq d < oo$.]
  + #emph[If no hereditary subalgebra of $A$ has a finite-dimensional irreducible representation, then there are finitely many finite-dimensional algebras $E_j$, completely positive order-zero maps $phi_j : E_j arrow.r F \( A \)$, and elements $c_j in F \( A \)$ such that every matrix summand of every $E_j$ has size at least two and 
$ 1_(F \( A \)) = sum_j c_j^(*) phi_j \( 1_(E_j) \) c_j . $

 This is the matrix-threshold-two consequence of the covering-number bound $"cov" \( F \( A \) \) lt.eq \( d + 1 \)^2$ [34] Definition 4.1 and Proposition 4.3.]
  + #emph[If $F \( A \)$ contains two full orthogonal positive elements, then $A tilde.equiv A ⊗_min cal(Z)$ [23] Theorem 1.2.]
  #emph[Both assertions apply to nonunital $A$, with the annihilator quotient just defined.]
] <thm:imports>

#thm([Lemma 9.2.])[
  #emph[If $A eq.not 0$ is separable, nowhere scattered, and has finite nuclear dimension, then $F \( A \)$ has no characters.]
] <lem:nocharacters>

#proof[
  A hereditary subalgebra $H$ is strongly Morita equivalent to the ideal $I$ it generates. If $H$ had a matrix quotient, ideal correspondence would give an ideal $J subset.eq I$ for which $I \/ J$ is strongly Morita equivalent to a matrix algebra, hence to $bb(C)$. By imprimitivity, $I \/ J$ would be elementary. Ideals of $I$ are ideals of $A$, contradicting nowhere scatteredness. This is also the equivalence in [28] Theorem 3.1.
  Apply Theorem 39(1) to $A$, put $B = F \( A \)$, and retain its maps $phi_j : E_j arrow.r B$, elements $c_j$, and displayed identity.
  If $chi : B arrow.r bb(C)$ were a character, its compositions with these maps would be order-zero positive functionals. Such a functional on $M_r$, $r gt.eq 2$, is zero. To see this, a nonzero positive functional has a positive density matrix with an eigenvector $xi$ of positive eigenvalue. For a unit eigenvector $eta perp xi$, the orthogonal rank-one projections onto $\( xi + eta \) \/ sqrt(2)$ and $\( xi - eta \) \/ sqrt(2)$ both have strictly positive values, contrary to order zero. Thus $chi compose phi_j = 0$ for every $j$, contradicting the displayed identity and $chi \( 1_B \) = 1$. ◻
]

#thm([Lemma 9.3.])[
  (Commuting reindexed copies).  #emph[Let $A eq.not 0$ be separable, and let $D subset.eq F \( A \)$ be a separable unital subalgebra with the same unit. For every finite $n$, there is a unital $*$-homomorphism 
$ D^(⊗_max n) arrow.r F \( A \) . $

]
] <lem:reindex>

#proof[
  It suffices to prove that for every separable subalgebra $C subset.eq F \( A \)$, there is a unital $*$-homomorphism from $D$ into $F \( A \)$ with range commuting with $C$. This is Kirchberg’s reindexing mechanism, in the form recorded in [17] Proposition 2.2 and Corollary 2.3 for unital $A$. We include the annihilator details needed for nonunital $A$.
  Choose a countable dense unital $*$-algebra $D_0 subset D$ over $bb(Q) + i bb(Q)$. For each $x in D_0$, choose a bounded lift $\( a_l^x \)_l$ in $A$ that represents a central element mapping to $x$, with
  #[#set math.equation(numbering: n => "(9.1)")
   $ sup_l parallel a_l^x parallel lt.eq 2 parallel x parallel . $ <eq:liftbound>]
  Take the zero lift for zero and the approximate identity for $1$. The quotient norm permits these choices: first lift within a bound strictly below $2 parallel x parallel$, then truncate coordinate norms without changing the ultrapower class. The additive, scalar, multiplicative, and adjoint relation defects between these lifts annihilate $A$ on both sides along $omega$.
  Choose a countable dense family in $C$ with bounded lifts $\( b_s^u \)_s$ in $A$. Also fix a countable dense subset of $A$. List the following countably many requirements on an old index $l$: centrality of each $a_l^x$ against that subset; left and right products of every relation defect with that subset tending to zero; and
  $ a_l^1 a arrow.r a \, #h(2em) a a_l^1 arrow.r a $
  for its elements $a$. All these requirements hold along $omega$.
  For each output index $s$, choose $l \( s \)$ so that the first $s$ requirements hold with error less than $1 \/ s$, and also
  $ parallel \[ a_(l \( s \))^x \, b_s^u \] parallel < 1 \/ s $
  for the first $s$ pairs $\( x \, u \)$ in an enumeration. For this fixed $s$, the finitely many $b_s^u$ are fixed elements of $A$. Original centrality therefore makes all these commutator conditions $omega$-large as conditions on $l$. A finite intersection with the other $omega$-large conditions is nonempty, so the choice is possible.
  The new sequences $\( a_(l \( s \))^x \)_s$ are central, and all their relation defects annihilate $A$ on both sides: the tests hold in the ordinary limit, and the uniform bounds extend them from the dense subset to all of $A$. Thus they define a unital rational-complex $*$-homomorphism on $D_0$ into $F \( A \)$. The unit assertion follows from the approximate-identity tests. Bound (9.1) permits continuous extension to a complex unital $*$-homomorphism on $D$. Its range commutes with the dense family in $C$, hence with $C$. Injectivity is not needed.
  Starting with one copy and repeatedly taking $C$ to be generated by the previous images gives $n$ commuting unital images of $D$. The universal property of the maximal tensor product gives the stated homomorphism. ◻
]

#proof[
  The assertion is immediate for $A = 0$, so assume $A eq.not 0$. Assume first that $dim_(upright("nuc")) \( A \) < oo$; we prove (1)$arrow.r.double$(2). By Lemma 40, $B = F \( A \)$ has no characters. Choose in $B$ a finite commutator witness as in (8.1), and let $D$ be the unital $C^(*)$-subalgebra generated by all its entries. Then $D$ is separable and has no characters, since applying a character of $D$ to that inequality would give $1 < 1 \/ 2$.
  By Theorem 4, some $D^(⊗_max n)$ contains full orthogonal positive elements $a \, b$. Lemma 41 supplies a unital homomorphism into $B$. Their images remain orthogonal and full: applying a unital homomorphism to finite ideal combinations approximating the unit proves that fullness passes to the target. Theorem 39(2) now gives $A tilde.equiv A ⊗_min cal(Z)$. Conversely, for separable nuclear $A$, absorption and Theorem 3 imply $dim_(upright("nuc")) \( A \) lt.eq 1$. This bound implies finite nuclear dimension, completing all three equivalences in Theorem 1. ◻
]

#prodef([Remark 9.4.])[
  The same argument proves that $F \( A \)$ has two full orthogonal positive elements whenever $A eq.not 0$ is separable and $F \( A \)$ has no characters. Finite nuclear dimension enters the proof of Theorem 1 only through the two imported results in Theorem 39.
]

=== 9.1 Cuntz-semigroup consequence <subsec:cu-consequence>

We use the completed stabilized Cuntz semigroup $upright("Cu") \( X \)$ formed from $\( X ⊗ cal(K) \)_(+)$, with no distinguished scale. Isomorphisms in $upright(bold(C u))$ preserve zero, addition, order, increasing sequential suprema, and the way-below relation in both directions. The isomorphism in Corollary 2(ii) need not agree with $upright("Cu") \( iota_A \)$.

#proof[
  Theorem 1 gives the equivalence of its three conditions. The companion [19] Corollaries 1.3 and 1.4 gives that (i) implies absorption and that (ii) is equivalent to absorption, even without the exclusion on elementary ideal subquotients.
  To prove that absorption implies (i), the case $A = 0$ is immediate. Put $D = A ⊗ cal(Z)$ and $j_X \( x \) = x ⊗ 1_(cal(Z))$, so $j_A = iota_A$. Strong self-absorption gives an isomorphism $phi : cal(Z) arrow.r cal(Z) ⊗ cal(Z)$ approximately unitarily equivalent to $z mapsto z ⊗ 1_(cal(Z))$. The companion’s nonunital calculation [19] proof of Corollary 1.4 gives $upright("Cu") \( j_D \) = upright("Cu") \( upright("id")_A ⊗ phi \)$, an isomorphism: the implementing unitaries $u_n in cal(Z) ⊗ cal(Z)$ act through $1_(M \( A \)) ⊗ u_n in M \( A ⊗ cal(Z) ⊗ cal(Z) \)$, and positive cuts and approximate units after stabilization give equality of the completed Cuntz maps.
  For an absorption isomorphism $theta : A arrow.r D$, both sides of the first identity below send $a$ to $theta \( a \) ⊗ 1_(cal(Z))$. Functoriality then gives
  $ \( theta ⊗ upright("id")_(cal(Z)) \) compose j_A & = j_D compose theta \,\
upright("Cu") \( j_A \) & = upright("Cu") \( theta ⊗ upright("id")_(cal(Z)) \)^(- 1) compose upright("Cu") \( j_D \) compose upright("Cu") \( theta \) . $
  All three factors on the right are isomorphisms, proving (i). Thus (ii) reaches the canonical condition (i) through absorption, not by identifying its abstract isomorphism with $upright("Cu") \( iota_A \)$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Charles A. Akemann, Joel Anderson, and Gert K. Pedersen, #emph[Excising states of $C^(*)$-algebras], Canad. J. Math. #strong[38] (1986), no.~5, 1239--1260. #link("https://doi.org/10.4153/CJM-1986-063-7")[doi:10.4153/CJM-1986-063-7].]
#bibitem([2])[Ramon Antoine, Francesc Perera, Hannes Thiel, and Eduard Vilalta, #emph[Pure $C^(*)$-algebras], preprint, #link("https://arxiv.org/abs/2406.11052v3")[arXiv:2406.11052v3], 2024.]
#bibitem([3])[Joan Bosa, Nathanial P. Brown, Yasuhiko Sato, Aaron Tikuisis, Stuart White, and Wilhelm Winter, #emph[Covering dimension of $C^(*)$-algebras and 2-coloured classification], Mem. Amer. Math. Soc. #strong[257] (2019), no.~1233, vii+97 pp. #link("https://doi.org/10.1090/memo/1233")[doi:10.1090/memo/1233]. #link("https://arxiv.org/abs/1506.03974v3")[arXiv:1506.03974v3].]
#bibitem([4])[Joan Bosa, James Gabe, Aidan Sims, and Stuart White, #emph[The nuclear dimension of $cal(O)_oo$-stable $C^(*)$-algebras], Adv. Math. #strong[401] (2022), 108250. #link("https://doi.org/10.1016/j.aim.2022.108250")[doi:10.1016/j.aim.2022.108250]. #link("https://arxiv.org/abs/1906.02066")[arXiv:1906.02066].]
#bibitem([5])[Nathanial P. Brown, José R. Carrión, and Stuart White, #emph[Decomposable approximations revisited], in #emph[Operator Algebras and Applications: The Abel Symposium 2015] (Toke M. Carlsen, Nadia S. Larsen, Sergey Neshveyev, and Christian Skau, eds.), Abel Symposia, vol.~12, Springer, Cham, 2016, pp.~45--65. #link("https://doi.org/10.1007/978-3-319-39286-8_2")[doi:10.1007/978-3-319-39286-8\_2]. #link("https://arxiv.org/abs/1602.00021v4")[arXiv:1602.00021v4].]
#bibitem([6])[Jorge Castillejos and Samuel Evington, #emph[Nuclear dimension of simple stably projectionless $C^(*)$-algebras], Anal. PDE #strong[13] (2020), no.~7, 2205--2240. #link("https://doi.org/10.2140/apde.2020.13.2205")[doi:10.2140/apde.2020.13.2205]. #link("https://arxiv.org/abs/1901.11441v4")[arXiv:1901.11441v4].]
#bibitem([7])[Jorge Castillejos, Samuel Evington, Aaron Tikuisis, Stuart White, and Wilhelm Winter, #emph[Nuclear dimension of simple $C^(*)$-algebras], Invent. Math. #strong[224] (2021), no.~1, 245--290. #link("https://doi.org/10.1007/s00222-020-01013-1")[doi:10.1007/s00222-020-01013-1]. #link("https://arxiv.org/abs/1901.05853v3")[arXiv:1901.05853v3].]
#bibitem([8])[Man-Duen Choi and Edward G. Effros, #emph[The completely positive lifting problem for $C^(*)$-algebras], Ann. of Math. (2) #strong[104] (1976), no.~3, 585--609. #link("https://doi.org/10.2307/1970968")[doi:10.2307/1970968].]
#bibitem([9])[George A. Elliott, Zhuang Niu, Luis Santiago, and Aaron Tikuisis, #emph[Decomposition rank of approximately subhomogeneous $C^(*)$-algebras], Forum Math. #strong[32] (2020), no.~4, 827--889. #link("https://doi.org/10.1515/forum-2020-0018")[doi:10.1515/forum-2020-0018]. #link("https://arxiv.org/abs/1505.06100")[arXiv:1505.06100].]
#bibitem([10])[George A. Elliott, Leonel Robert, and Luis Santiago, #emph[The cone of lower semicontinuous traces on a $C^(*)$-algebra], Amer. J. Math. #strong[133] (2011), no.~4, 969--1005. #link("https://doi.org/10.1353/ajm.2011.0027")[doi:10.1353/ajm.2011.0027]. #link("https://arxiv.org/abs/0805.3122v2")[arXiv:0805.3122v2].]
#bibitem([11])[James Gabe, #emph[A new proof of Kirchberg's $cal(O)_2$-stable classification], J. Reine Angew. Math. #strong[761] (2020), 247--289. #link("https://doi.org/10.1515/crelle-2018-0010")[doi:10.1515/crelle-2018-0010]. #link("https://arxiv.org/abs/1706.03690v2")[arXiv:1706.03690v2].]
#bibitem([12])[Edward N. Gilbert, #emph[A comparison of signalling alphabets], Bell System Tech. J. #strong[31] (1952), no.~3, 504--522. #link("https://doi.org/10.1002/j.1538-7305.1952.tb01393.x")[doi:10.1002/j.1538-7305.1952.tb01393.x].]
#bibitem([13])[Ilan Hirshberg, Eberhard Kirchberg, and Stuart White, #emph[Decomposable approximations of nuclear $C^(*)$-algebras], Adv. Math. #strong[230] (2012), no.~3, 1029--1039. #link("https://doi.org/10.1016/j.aim.2012.03.028")[doi:10.1016/j.aim.2012.03.028]. #link("https://arxiv.org/abs/1109.2379")[arXiv:1109.2379].]
#bibitem([14])[Xinhui Jiang and Hongbing Su, #emph[On a simple unital projectionless $C^(*)$-algebra], Amer. J. Math. #strong[121] (1999), no.~2, 359--413. #link("https://doi.org/10.1353/ajm.1999.0012")[doi:10.1353/ajm.1999.0012].]
#bibitem([15])[R.~V.~Kadison, #emph[Irreducible operator algebras], Proc. Natl. Acad. Sci. USA #strong[43] (1957), 273--276. #link("https://doi.org/10.1073/pnas.43.3.273")[doi:10.1073/pnas.43.3.273].]
#bibitem([16])[Eberhard Kirchberg and Mikael Rørdam, #emph[Purely infinite $C^(*)$-algebras: ideal-preserving zero homotopies], Geom. Funct. Anal. #strong[15] (2005), no.~2, 377--415. #link("https://arxiv.org/abs/math/0312286")[arXiv:math/0312286].]
#bibitem([17])[E.~Kirchberg and M.~Rørdam, #emph[When central sequence $C^(*)$-algebras have characters], Int. J. Math. #strong[26] (2015), no.~7, 1550049, 32 pp. #link("https://doi.org/10.1142/S0129167X15500494")[doi:10.1142/S0129167X15500494].]
#bibitem([18])[Hiroki Matui and Yasuhiko Sato, #emph[Decomposition rank of UHF-absorbing $C^(*)$-algebras], Duke Math. J. #strong[163] (2014), no.~14, 2687--2708. #link("https://doi.org/10.1215/00127094-2826908")[doi:10.1215/00127094-2826908]. #link("https://arxiv.org/abs/1303.4371v2")[arXiv:1303.4371v2].]
#bibitem([19])[OpenAI, #emph[Cuntz comparison and Jiang--Su absorption], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Cuntz-comparison-and-Jiang-Su-absorption-September-23-2026/paper.pdf")[OAI:Cuntz-comparison-and-Jiang-Su-absorption-September-23-2026], 2026. Corollaries~1.3 and~1.4.]
#bibitem([20])[OpenAI, #emph[The Kirchberg--Rørdam character criterion], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-Kirchberg-Rordam-character-criterion-September-25-2026/paper.pdf")[OAI:The-Kirchberg-Rordam-character-criterion-September-25-2026], 2026. Theorems~1.1 and~1.2.]
#bibitem([21])[Francesc Perera, Hannes Thiel, and Eduard Vilalta, #emph[Centrally pure $C^(*)$-algebras], J. Funct. Anal. #strong[291] (2026), 111578. #link("https://doi.org/10.1016/j.jfa.2026.111578")[doi:10.1016/j.jfa.2026.111578]. #link("https://arxiv.org/abs/2512.17261")[arXiv:2512.17261].]
#bibitem([22])[Leonel Robert and Luis Santiago, #emph[Classification of $C^(*)$-homomorphisms from $C_0 \( 0 \, 1 \]$ to a $C^(*)$-algebra], J. Funct. Anal. #strong[258] (2010), no.~3, 869--892. #link("https://doi.org/10.1016/j.jfa.2009.06.025")[doi:10.1016/j.jfa.2009.06.025].]
#bibitem([23])[L.~Robert and A.~Tikuisis, #emph[Nuclear dimension and $cal(Z)$-stability of non-simple $C^(*)$-algebras], Trans. Amer. Math. Soc. #strong[369] (2017), no.~7, 4631--4670. #link("https://doi.org/10.1090/tran/6842")[doi:10.1090/tran/6842]. #link("https://arxiv.org/abs/1308.2941v2")[arXiv:1308.2941v2].]
#bibitem([24])[Mikael Rørdam, #emph[The stable and the real rank of $cal(Z)$-absorbing $C^(*)$-algebras], Internat. J. Math. #strong[15] (2004), no.~10, 1065--1084. #link("https://doi.org/10.1142/S0129167X04002661")[doi:10.1142/S0129167X04002661]. #link("https://arxiv.org/abs/math/0408020v2")[arXiv:math/0408020v2].]
#bibitem([25])[Yasuhiko Sato, Stuart White, and Wilhelm Winter, #emph[Nuclear dimension and $cal(Z)$-stability], Invent. Math. #strong[202] (2015), no.~2, 893--921. #link("https://doi.org/10.1007/s00222-015-0580-1")[doi:10.1007/s00222-015-0580-1]. #link("https://arxiv.org/abs/1403.0747")[arXiv:1403.0747].]
#bibitem([26])[Christopher Schafhauser, Aaron Tikuisis, and Stuart White, #emph[Nuclear $C^(*)$-algebras: 99 problems], preprint, #link("https://arxiv.org/abs/2506.10902v2")[arXiv:2506.10902v2], 2025, revised 8 May 2026.]
#bibitem([27])[Gábor Szabó, #emph[On the nuclear dimension of strongly purely infinite $C^(*)$-algebras], preprint, #link("https://arxiv.org/abs/1510.01917v2")[arXiv:1510.01917v2], 2015, revised 9 November 2016.]
#bibitem([28])[H.~Thiel and E.~Vilalta, #emph[Nowhere scattered $C^(*)$-algebras], J. Noncommut. Geom. #strong[18] (2024), 231--263. #link("https://ems.press/content/serial-article-files/42631")[Publisher's text].]
#bibitem([29])[Aaron Tikuisis, #emph[Nuclear dimension, $cal(Z)$-stability, and algebraic simplicity for stably projectionless $C^(*)$-algebras], preprint, #link("https://arxiv.org/abs/1210.2237v2")[arXiv:1210.2237v2], 2012, revised 29 May 2013.]
#bibitem([30])[Aaron Tikuisis and Wilhelm Winter, #emph[Decomposition rank of $cal(Z)$-stable $C^(*)$-algebras], Anal. PDE #strong[7] (2014), no.~3, 673--700. #link("https://doi.org/10.2140/apde.2014.7.673")[doi:10.2140/apde.2014.7.673].]
#bibitem([31])[Andrew S. Toms and Wilhelm Winter, #emph[Strongly self-absorbing $C^(*)$-algebras], Trans. Amer. Math. Soc. #strong[359] (2007), no.~8, 3999--4029. #link("https://doi.org/10.1090/S0002-9947-07-04173-6")[doi:10.1090/S0002-9947-07-04173-6].]
#bibitem([32])[Wilhelm Winter, #emph[Nuclear dimension and $cal(Z)$-stability of pure $C^(*)$-algebras], preprint, #link("https://arxiv.org/abs/1006.2731v2")[arXiv:1006.2731v2], 2010, revised 20 May 2011.]
#bibitem([33])[Wilhelm Winter and Joachim Zacharias, #emph[Completely positive maps of order zero], Münster J. Math. #strong[2] (2009), 311--324. #link("https://www.uni-muenster.de/FB10/mjm/vol_2/mjm_vol_2_14.pdf")[Published version].]
#bibitem([34])[Wilhelm Winter and Joachim Zacharias, #emph[The nuclear dimension of $C^(*)$-algebras], Adv. Math. #strong[224] (2010), no.~2, 461--498. #link("https://doi.org/10.1016/j.aim.2009.12.005")[doi:10.1016/j.aim.2009.12.005]. #link("https://arxiv.org/abs/0903.4914v1")[arXiv:0903.4914v1].]


