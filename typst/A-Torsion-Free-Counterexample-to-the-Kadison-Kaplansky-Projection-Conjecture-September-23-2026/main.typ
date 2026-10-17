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

#align(center)[#text(size: 16pt, weight: "bold")[A torsion-free counterexample to the \
Kadison--Kaplansky projection conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The projection form of the Kadison–Kaplansky conjecture asserts that the reduced group $C^(*)$-algebra of a torsion-free discrete group contains no projections other than zero and the identity. For a discrete group $H$, this algebra is the operator-norm closure of its left regular group algebra on $ell^2 \( H \)$, and its canonical trace is $tau_H \( x \) = chevron.l x delta_1 \, delta_1 chevron.r$. The conjecture concerns scalar projections in this completion. We prove the following result.

#thm([Theorem 1.1.])[
  #emph[There exist a finitely generated torsion-free discrete group $G_(upright("proj"))$ and a projection $e in C_r^(*) \( G_(upright("proj")) \)$ such that 
$ 0 < tau_(G_(upright("proj"))) \( e \) < 1 / 2 . $

 In particular, $e$ is neither zero nor the identity.]
] <thm:main>

Theorem 1 resolves the projection form of the Kadison–Kaplansky conjecture negatively. The group is given by an infinite graphical presentation followed by a free product with a finitely generated free group. Every parameter is finite, although no useful bound on its size is sought. The choices of labeling tables and edge voltages are specified by finite distributions and proved simultaneous existence statements.

=== Context <context>

Kadison traces his free-group projection problem to Kaplansky’s question about idempotents in simple unital $C^(*)$-algebras #cite(label("Kadison2008")) pp. 222–224. Pimsner and Voiculescu proved the free-group case by computing the $K$-theory of reduced crossed products by free groups #cite(label("PimsnerVoiculescu1982")) p. 131. A central route to projectionlessness is integrality of the canonical trace on $K_0 \( C_r^(*) \( H \) \)$, where the trace on matrices is the #emph[unnormalized] sum of the diagonal traces. For torsion-free groups, the trace is integral on the image of reduced assembly with trivial coefficients #cite(label("Luck2002")) Theorem 0.3, #cite(label("BGW2016")) Proposition 10.3. Surjectivity therefore gives scalar projectionlessness. The survey #cite(label("GJV2019")) Section 4.5.3 explains the distinct scalar and stable formulations.

This implication covers substantial classes of groups. Higson and Kasparov proved Baum–Connes with coefficients for groups acting properly by affine isometries on Hilbert space, including countable amenable groups #cite(label("HK2001")) Theorem 9.1 and Corollary 9.2. Mineyev and Yu established the coefficient-free hyperbolic case and deduced the projection conjecture for torsion-free subgroups of hyperbolic groups #cite(label("MY2002")) Theorems 20–21; Lafforgue later established the hyperbolic case with arbitrary coefficients #cite(label("Lafforgue2012")) Theorem 0.4. The group constructed here has a different geometry: its presentation encodes an infinite tower through embedded nilpotent covers.

For the group $G_(upright("proj"))$ in Theorem 1, the complex group ring $bb(C) \[ G_(upright("proj")) \]$ has no scalar idempotents other than zero and one #cite(label("OpenAIBass2026")) Corollary 1.2(ii). Thus the projection $e$ lies in the reduced completion but not in the group ring. The companion also gives integer trace range on algebraic $K_0 \( bb(C) \[ G_(upright("proj")) \] \)$ and on its image in $K_0 \( C_r^(*) \( G_(upright("proj")) \) \)$ under the comparison map induced by inclusion #cite(label("OpenAIBass2026")) Corollary 1.2(i) and Remark 10.1. This does not assert integrality on the whole completed $K_0$, where $\[ e \]$ has nonintegral trace.

Expanders also underlie the obstructions of Higson, Lafforgue, and Skandalis for groupoids, coarse spaces, and group actions with coefficients #cite(label("HLS2002")). Their group-action statements concern assembly with coefficients, whereas the trace obstruction here concerns trivial coefficients.

The later analysis of expander index obstructions by Willett and Yu #cite(label("WY2012")) gives another relevant spectral and coarse-geometric precedent. Its group consequences likewise use coefficients.

Austin constructed rational group-ring operators with irrational von Neumann kernel dimension #cite(label("Austin2013")). Such a dimension alone does not imply that the kernel projection lies in the reduced $C^(*)$-algebra. Here a #emph[uniform separated spectral band] for a finite matrix group-algebra operator in its regular representation gives reduced-algebra membership by continuous functional calculus. Scalar compression is applied after this matrix projection has been obtained.

=== The obstruction and the proof strategy <the-obstruction-and-the-proof-strategy>

The first task is to obtain a matrix projection whose unnormalized trace is strictly between zero and $1 \/ 2$. A spectral projection in the group von Neumann algebra is insufficient. We construct a finite self-adjoint matrix $T$ over the group algebra of a torsion-free group $Gamma_(upright("proj"))$ whose regular spectrum has a nonempty band near $+ 1$, separated from all remaining spectrum. Continuous functional calculus then places its upper projection $p_0$ in $M_N \( C_r^(*) \( Gamma_(upright("proj")) \) \)$. The difficult part is to retain that gap while making the unnormalized trace small.

Begin with finite sets $A_i \, B_i$, indexed by $i in bb(Z)$, and bipartite incidences between $A_i$ and $B_k$ for $\| i - k \| lt.eq 1$. Their normalized operators preserve constant vectors and contract the orthogonal complements by a common positive amount. Two versions of the same tower serve different purposes: $Y^0$ provides expansion and $Y^(\#)$ provides recovery of long paths from words in a finite alphabet. They agree after deleting a uniformly small fraction of vertices. The survivor $Y$ is the base of a voltage cover $P$: its vertices are pairs $\( v \, f \)$, with $f$ in a torsion-free nilpotent group, and an edge changes the second coordinate by its assigned group element. The voltages give large girth and will also realize the required operators.

The analytic model is indexed by a central Fourier variable $t$. Twisted-convolution projections with effective parameters $t$ and $t - delta$, for a small positive $delta$, give a nonzero fiber projection for $0 < t < delta$. Normalized combinations of the constant vectors on at most two adjacent layers produce an eigenvalue $+ 1$, while expansion separates all the other positive spectrum. As $t$ approaches either endpoint, these supporting layers move toward an end of the tower and their fiber trace decreases. A finite magnetic representation is essential to obtain small trace at both endpoints. The result is a summable trace estimate even after the geometric weights needed for intersections of copies have been included.

One edge voltage and one matrix weight per edge approximate this model in the full regular norm. The same finite sampling construction enforces the girth required for the group presentation. Long-word recovery then embeds components of $P$ as indexed copies in the Cayley graph of $Gamma_(upright("proj"))$. A common-root order confines every earlier intersection with a copy to one finite tree ball. Removing those intersections leaves disjoint domains; the remaining Cayley edges form a forest. The trace estimate controls the loss in the upper spaces caused by the removed balls, and a forest norm estimate controls the unused edges. Together they preserve the separated band for the finite matrix $T$. For the trace estimate, we restrict a vector to every indexed copy and project to its local upper space. This map is equivariant, although the assignment of domains need not be. Disjointness and the same weighted loss estimate bound its retained and removed parts. Its injectivity on the global upper space then bounds the unnormalized trace by the total trace of the local upper spaces.

The final passage to a scalar projection is a separate free-product argument. Scale and comparison in reduced free products were studied by Dykema and Rørdam #cite(label("DR1998")) #cite(label("DR2000")) #cite(label("DRII2000")). Recent work on selfless reduced free products and comparison by trace #cite(label("FKOP2026")) #cite(label("Robert2025")) also underlies a conditional argument of Sauers #cite(label("Sauers2026")) that turns a nonintegral matrix projection over $C_r^(*) \( H \)$ into a scalar projection over $C_r^(*) \( H * bb(Z) \)$. Such a reduction still requires an actual nonintegral matrix projection. Here Proposition 3 gives a direct quantitative estimate at trace below $1 \/ 2$: adjoining $N$ free generators compresses $p_0$ to a scalar projection of the same trace. This gives $G_(upright("proj")) = Gamma_(upright("proj")) * bb(F)_N$, preserving finite generation and torsion-freeness. The same small trace also places $\[ p_0 \]$ outside the coefficient-free reduced assembly image for $Gamma_(upright("proj"))$.

=== Organization <organization>

Section 2 reduces Theorem 1 to the small unnormalized matrix-trace target stated in Section 3. Sections 4–6 construct the auxiliary graph $Y^0$ with expanding incidences, the gated graph $Y^(\#)$ with path recovery, and their common pruned induced subgraph $Y$.

Section 7 proves the embedding, overlap, forest, and torsion conclusions under a girth hypothesis on the voltage cover $P$. Section 8 constructs the deck group and the small-trace fiber projections. Section 9 identifies the model’s upper band, then chooses voltages and matrix weights satisfying both the girth hypothesis and the regular operator approximation.

Section 10 passes the upper spectral band from the model to the cover and then to the Cayley operator, and bounds its unnormalized trace using all indexed copies. Section 11 applies scalar compression to complete the proof.

== 2 From a small matrix projection to a scalar projection <sec:scalar>

We first isolate a reduction that will be useful independently of the construction. Its trace convention is essential. For related results on the scale and comparison of projections in reduced free products, see Dykema–Rørdam #cite(label("DR1998")) #cite(label("DR2000")) #cite(label("DRII2000")). The explicit row estimate used here is proved below. For a discrete group $Lambda$, let

$ \( lambda_Lambda \( g \) xi \) \( h \) = xi \( g^(- 1) h \) \, #h(2em) C_r^(*) \( Lambda \) = overline(lambda_Lambda \( bb(C) \[ Lambda \] \))^(thin parallel dot.op parallel) . $

The canonical trace is $tau_Lambda \( x \) = chevron.l x delta_1 \, delta_1 chevron.r$. It is tracial on finite group-algebra sums by taking the identity coefficient, and hence on their norm closure. It is faithful: if $x gt.eq 0$ and $tau_Lambda \( x \) = 0$, then $x^(1 \/ 2) delta_1 = 0$. Since $x^(1 \/ 2)$ commutes with the right regular action, it annihilates every basis vector and is zero. On matrices we always use the #emph[unnormalized] extension

#[#set math.equation(numbering: n => "(2.1)")
 $ tau_(Lambda \, N) \( x \) = sum_(j = 1)^N tau_Lambda \( x_(j j) \) . $ <scalar:matrix-trace>]

The same formula applies to positive equivariant operators on finite regular multiples. In particular, $tau_(Lambda \, N) \( p \) > 0$ for a nonzero projection $p$.

#thm([Lemma 2.1.])[
  (Reduced subgroup inclusion).  #emph[If $Lambda$ is a subgroup of a discrete group $K$, the inclusion of group algebras extends to an isometric unital inclusion $C_r^(*) \( Lambda \) subset.eq C_r^(*) \( K \)$, preserving the canonical traces and their finite matrix extensions.]
] <scalar:subgroup>

#proof[
  Choose one representative $v$ from every left $Lambda$-orbit $Lambda v$ in $K$. The unitary $delta_gamma mapsto delta_(gamma v)$ identifies the restriction of the left regular action to $ell^2 \( Lambda v \)$ with the left regular action on $ell^2 \( Lambda \)$. Thus the representation restricted to $bb(C) \[ Lambda \]$ is a direct sum of regular representations, so its norm is precisely the reduced norm on $Lambda$. Taking closures gives the inclusion. The identity diagonal proves preservation of trace; summing diagonal entries proves the matrix statement. ◻
]

#thm([Proposition 2.2.])[
  (Scalar compression after a free product).  #emph[Let $Lambda$ be a discrete group and $p in M_N \( C_r^(*) \( Lambda \) \)$ a projection with 
$ 0 < a := tau_(Lambda \, N) \( p \) < 1 / 2 . $

 Put $K = Lambda * bb(F)_N$, where $t_1 \, dots.h \, t_N$ freely generate $bb(F)_N$, and regard $p$ as a matrix over $C_r^(*) \( K \)$ by Lemma 2. Set 
$ U = \( lambda_K \( t_1 \) \, dots.h \, lambda_K \( t_N \) \) \, #h(2em) A = p U^(*) U p . $

 Then $A$ is invertible in the unital corner $p M_N \( C_r^(*) \( K \) \) p$, and 
#[#set math.equation(numbering: n => "(2.2)")
 $ e = \( U p \) A^(- 1) \( U p \)^(*) $ <scalar:projection-formula>]

 is a projection in the scalar algebra $C_r^(*) \( K \)$ with $tau_K \( e \) = a$. If $Lambda$ is finitely generated and torsion-free, then so is $K$.]
] <scalar:compression>

#proof[
  To bound $U$ below on $p ell^2 \( K \)^N$, we separate noncancelling inputs, whose outputs are disjoint, from cancelling inputs, whose size both before and after applying $U$ is controlled by the trace $a$. Use free-product normal forms, writing entries of the free factor in reduced free letters. Let $cal(R)$ consist of the identity and the normal words whose first factor is in $bb(F)_N$. Every element of $K$ has a unique expression $gamma v$ with $gamma in Lambda$ and $v in cal(R)$: remove its initial $Lambda$-factor, if present. Thus $cal(R)$ is a transversal for the orbits used in Lemma 2.
  Write $a_j = tau_Lambda \( p_(j j) \)$, so $a_j gt.eq 0$ and $sum_j a_j = a$. If $xi = p xi in ell^2 \( K \)^N$, put
  $ m_v = parallel xi \|_(Lambda v) parallel^2 \, #h(2em) sum_(v in cal(R)) m_v = parallel xi parallel^2 . $
  Restriction to an orbit commutes with $p$. Applying Cauchy–Schwarz to the projection on that orbit gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ \| xi_j \( v \) \|^2 = \| chevron.l xi \|_(Lambda v) \, p delta_(\( v \, j \)) chevron.r \|^2 lt.eq a_j m_v . $ <scalar:pointwise>]
  Here $parallel p delta_(\( v \, j \)) parallel^2 = chevron.l p delta_(\( v \, j \)) \, delta_(\( v \, j \)) chevron.r = a_j$.
  In coordinate $j$, call a position bad if its reduced word starts with $t_j^(- 1)$, and good otherwise. Split $xi$ accordingly as $xi = xi_(upright(g)) + xi_(upright(b))$. Every bad position belongs to $cal(R)$; its first letter determines its bad coordinate uniquely. Therefore
  #[#set math.equation(numbering: n => "(2.4)")
   $ parallel xi_(upright(b)) parallel^2 lt.eq a sum_(v in cal(R)) m_v = a parallel xi parallel^2 . $ <scalar:bad-input>]
  Left multiplication by $t_j$ sends every good position to a word starting with $t_j$. These output sets are disjoint for different $j$, and multiplication is injective within each coordinate. Hence
  #[#set math.equation(numbering: n => "(2.5)")
   $ parallel U xi_(upright(g)) parallel^2 = parallel xi_(upright(g)) parallel^2 gt.eq \( 1 - a \) parallel xi parallel^2 . $ <scalar:good-output>]
  Bad outputs may coincide, and require a separate estimate. For an output word $h$, let $J \( h \)$ be the coordinates whose bad input $v_(h \, j) = t_j^(- 1) h$ contributes to $h$. By (2.3),
  $ \| \( U xi_(upright(b)) \) \( h \) \|^2 lt.eq (sum_(j in J \( h \)) a_j) (sum_(j in J \( h \)) m_(v_(h \, j))) lt.eq a sum_(j in J \( h \)) m_(v_(h \, j)) . $
  The map $\( h \, j \) mapsto v_(h \, j)$, restricted to these bad inputs, is injective: the first letter of $v_(h \, j)$ determines $j$, and then $h = t_j v_(h \, j)$. Summing over $h$ gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ parallel U xi_(upright(b)) parallel^2 lt.eq a parallel xi parallel^2 . $ <scalar:bad-output>]
  Equations (2.5) and (2.6), and the triangle inequality, imply
  #[#set math.equation(numbering: n => "(2.7)")
   $ parallel U xi parallel gt.eq c_a parallel xi parallel \, #h(2em) c_a = sqrt(1 - a) - sqrt(a) > 0 . $ <scalar:lower-bound>]
  Consequently $A gt.eq c_a^2 p$ in its C\*-corner. Also $U U^(*) = N 1$, so $A lt.eq N p$. In particular, its inverse belongs to the corner itself: explicitly,
  $ A^(- 1) = 1 / N sum_(k = 0)^oo \( p - A \/ N \)^k $
  converges in norm because $parallel p - A \/ N parallel lt.eq 1 - c_a^2 \/ N < 1$. Continuous functional calculus also supplies $A^(- 1 \/ 2)$ there. The row $V = U p A^(- 1 \/ 2)$ belongs to $M_(1 \, N) \( C_r^(*) \( K \) \)$ and satisfies $V^(*) V = p$. Thus $e = V V^(*)$ is the scalar projection in (2.2). Writing $V = \( V_1 \, dots.h \, V_N \)$ and using traciality,
  $ tau_K \( e \) = sum_j tau_K \( V_j V_j^(*) \) = sum_j tau_K \( V_j^(*) V_j \) = tau_(K \, N) \( p \) = a . $
  It is therefore neither zero nor one.
  Finally, adjoining the finite set $t_1 \, dots.h \, t_N$ preserves finite generation. A nontrivial element of a free product is conjugate either to a nontrivial factor element or to a cyclically reduced word with at least two alternating factor entries. Positive powers of the latter have strictly increasing reduced length. If both factors are torsion-free, neither case has finite order. This proves the last assertion. ◻
]

It remains to construct a finitely generated torsion-free $Gamma_(upright("proj"))$ and a projection satisfying the small #emph[unnormalized] trace hypothesis of Proposition 3. The next sections do so.

== 3 Conventions, parameters, and the matrix target <sec:setup>

We will prove the following intermediate statement.

#thm([Theorem 3.1.])[
  (Matrix construction).  #emph[There exist a finitely generated torsion-free discrete group $Gamma_(upright("proj"))$, a finite integer $N gt.eq 1$, and a self-adjoint element $T in M_N \( bb(C) \[ Gamma_(upright("proj")) \] \)$, in its regular representation, with a nonempty separated spectral subset whose spectral projection $p_0$ satisfies 
$ p_0 in M_N \( C_r^(*) \( Gamma_(upright("proj")) \) \) \, #h(2em) 0 < tau_(Gamma_(upright("proj")) \, N) \( p_0 \) < 1 / 2 . $

]
] <setup:matrix-target>

Here and below a spectral subset is #emph[separated] if its distance from the rest of the spectrum is positive. Its indicator is continuous on the spectrum. The spectral projection therefore belongs to the unital $C^(*)$-algebra containing the operator, by continuous functional calculus. We also use the equivalent contour-resolvent formula. These facts, together with polar decomposition, are standard bounded-operator spectral theory #cite(label("ReedSimon1980")) Chapters VI–VII.

In graph coordinates it is convenient to use right translations

$ \( rho_Lambda \( g \) xi \) \( h \) = xi \( h g \) . $

The unitary $cal(I) xi \( h \) = xi \( h^(- 1) \)$ satisfies $cal(I) rho_Lambda \( g \) cal(I) = lambda_Lambda \( g \)$. This identification fixes the identity vector and leaves finite matrix indices unchanged, so it preserves all traces used here. Thus a finite matrix sum of right translations specifies the same kind of reduced-algebra element as in Theorem 4.

=== 3.1 Graphs and labels <graphs-and-labels>

Edges have length one and may be traversed in either direction. Whenever a positive orientation is specified, reverse traversal carries the formal inverse label. A labeled graph is #emph[folded] if, at each vertex, a prescribed oriented label occurs on at most one outgoing edge. A path is nonbacktracking when it never immediately reverses an edge; a closed path is cyclically nonbacktracking if this also holds across its chosen basepoint. Closed walks and their repeated traversals are allowed as presentation relators.

For a labeled group presentation we retain the formal Cayley edges: a positive generator and its initial vertex specify an edge even if different formal generators have the same group value. All degree and forest assertions are about this graph. This convention also specifies an unambiguous left action on oriented edges. Intrinsic distances and balls in an embedded copy are measured using its own graph edges.

All vertex Hilbert spaces use counting measure. A biregular incidence from a $B$-side of degree $D'$ to an $A$-side of degree $d$ is normalized by $\( d D' \)^(- 1 \/ 2)$. It maps the normalized constant vector on one side to the normalized constant vector on the other. When using probabilities to prove a bound for that operator, we pass explicitly to uniform probability on each side.

=== 3.2 The growing parameter <the-growing-parameter>

Let $ell$ be a positive integer, eventually sufficiently large, and set

#[#set math.equation(numbering: n => "(3.1)")
 $ d & = 2^(4 ell) \, & D & = d^2 \, & s & = 10 ell \, & r & = 7 ell \,\
n_0 & = 1000 \, & H_i & = \( 2 n_0 + 1 \) s + 1 + \| i \| quad \( i in bb(Z) \) . $ <setup:parameters>]

Write $H_0 = \( 2 n_0 + 1 \) s + 1$, and put

#[#set math.equation(numbering: n => "(3.2)")
 $ L_i = frac(100 H_i, log_2 d) \, #h(2em) g_i = frac(H_i, 100 log_2 d) . $ <setup:lengths>]

Inequalities comparing integer walk lengths with these real numbers have their usual literal meaning; a lower required length can equivalently be rounded upward. We may use the fixed bound

#[#set math.equation(numbering: n => "(3.3)")
 $ H_0 lt.eq h_(*) log_2 d \, #h(2em) h_(*) = 5003 \, $ <setup:hstar>]

valid for every $ell gt.eq 1$.

Edges in the base tower change the layer by at most one. Consequently, for any fixed $C < oo$,

#[#set math.equation(numbering: n => "(3.4)")
 $ \| j - i \| lt.eq frac(C H_i, log_2 d) quad arrow.r.double quad lr(|H_j / H_i - 1|) lt.eq frac(C, log_2 d) . $ <setup:nearby>]

The convergence to one is uniform in $i$. Constants such as $C$ may be very large, but are fixed before $ell$ grows.

Unless stated otherwise, a term $o \( 1 \)$ tends to zero as $ell arrow.r oo$, uniformly over all allowed layers, blocks, and choices already declared arbitrary. Fixed constants may depend on fixed accuracies and earlier parameters. They may not depend on $ell$ or a layer index. Later sections record the order of the remaining choices: geometric constants first, then nilpotence and mask scales, then operator accuracies and finite test constants, and finally a sufficiently large finite $ell$. We do not choose different values of $ell$ for different layers.

=== 3.3 The order of choices <the-order-of-choices>

Table 1 records which choices are fixed before which others. It is a guide to the estimates proved below: each indicated section supplies the corresponding inequality. All choices use one final value of $ell$, uniformly over the infinitely many layers.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Choice
], table.cell(rowspan: 1, colspan: 1)[Required conclusion
], table.cell(rowspan: 1, colspan: 1)[Proof location
]),
  table.cell(rowspan: 1, colspan: 1)[Geometric constants $C_(*) \, C_bullet$
], table.cell(rowspan: 1, colspan: 1)[One ball contains each earlier overlap; the unused edges form a forest
], table.cell(rowspan: 1, colspan: 1)[Section 7
],
  table.cell(rowspan: 1, colspan: 1)[Nilpotence and scale constants $m \, E_0 \, A_(*) \, kappa$
], table.cell(rowspan: 1, colspan: 1)[Short words are detected; both endpoint regimes have small weighted trace
], table.cell(rowspan: 1, colspan: 1)[Section 8
],
  table.cell(rowspan: 1, colspan: 1)[Accuracy $eta$, coefficient cutoffs and finite lists
], table.cell(rowspan: 1, colspan: 1)[Uniform approximation in the full regular representation with a finite weight alphabet
], table.cell(rowspan: 1, colspan: 1)[Section 9; Equation (10.7)
],
  table.cell(rowspan: 1, colspan: 1)[Finite-test and moment constants $C_1 \, C_2$
], table.cell(rowspan: 1, colspan: 1)[The sum of all voltage and operator failure bounds is less than one
], table.cell(rowspan: 1, colspan: 1)[Equation (9.21) and Theorem 41
],
  table.cell(rowspan: 1, colspan: 1)[One sufficiently large $ell$
], table.cell(rowspan: 1, colspan: 1)[Deletion loss, weighted trace, and forest error meet all spectral tolerances
], table.cell(rowspan: 1, colspan: 1)[Theorem 55
],
)
]],
  caption: [Table 1: Parameter ledger for the projection construction. Constants in a row may depend on earlier fixed choices; only the final row increases $ell$. The matrix dimension $N$ is a prescribed function of $ell$, and its unnormalized contribution is retained in the trace estimates. ],
)

== 4 The finite-alphabet tower before pruning <tow:section>

This section specifies the vertices, slots, and labels. The choice of the permutation tables needed for expansion is made in Proposition 10. Section 6 then makes the deletions. Throughout, a bit stream means an element of $bb(F)_2^(bb(N)_0)$ with a specified finite set of active coordinates; every inactive coordinate is zero. A prefix of length $a$ comprises coordinates $0 \, dots.h \, a - 1$. In particular, references to a prefix longer than the active stream refer to its zero padding.

The construction separates two requirements that are awkward to impose on one graph at once. An auxiliary graph $Y^0$ will have expanding bipartite blocks between neighboring layers. A graph $Y^(\#)$ on the same vertices will have a single labeling rule from which long path words recover their vertices. Deleting a uniformly vanishing fraction of the vertices makes the two induced graphs agree; their common survivor is $Y$. It retains the constant-vector spaces almost isometrically and has no short cycles. Proposition 13 collects these outputs. The finite alphabet must also remain small enough to control the edges outside the later embedded copies. We begin with the bit coordinates that make all these requirements compatible.

=== 4.1 Stream lengths and slots <stream-lengths-and-slots>

For $h gt.eq 0$, write $h = 2 s q + t$, where $q gt.eq 0$ and $0 lt.eq t < 2 s$, and set

#[#set math.equation(numbering: n => "(4.1)")
 $ l_A \( h \) & = r + n_0 s + q s + max \( t - s \, 0 \) \,\
l_B \( h \) & = n_0 s + q s + min \( t \, s \) . $ <tow:stream-lengths>]

We also write $l_A \( i \) = l_A \( \| i \| \)$ and $l_B \( i \) = l_B \( \| i \| \)$. Thus $l_A \( h \) + l_B \( h \) = r + 2 n_0 s + h$. Increasing $h$ by one increases exactly one of the two lengths by one: first the $B$-length for $s$ consecutive steps, and then the $A$-length for $s$ steps. Let

$ A_i & = bb(F)_2^(l_A \( i \)) times bb(F)_2^(r + 1 + l_B \( i \)) \,\
B_i & = bb(F)_2^(l_B \( i \)) times bb(F)_2^(s - r + 1 + l_A \( i \)) . $

The two coordinates of either vertex are denoted $\( u \, v \)$. Since $2 r - s = log_2 d$, their exact cardinalities are

#[#set math.equation(numbering: n => "(4.2)")
 $ \| A_i \| = d thin 2^(H_i) \, #h(2em) \| B_i \| = 2^(H_i) . $ <tow:cardinalities>]

All four active stream lengths at layer $i$ are at most $H_i$. For example, $l_A \( i \) lt.eq r + n_0 s + \| i \| < H_i$, and the other three bounds follow from the displayed definitions.

Partition every $A$-stream into a first block of length $r$, called block $0$, followed by blocks of length $s$, called $1 \, 2 \, dots.h$. Every $B$-stream has blocks of length $s$, also called $1 \, 2 \, dots.h$. Order the $u$-blocks from the two sides as

#[#set math.equation(numbering: n => "(4.3)")
 $ A \, 0 \; med B \, 1 \; med A \, 1 \; med B \, 2 \; med A \, 2 \; med dots.h . $ <tow:interleaving>]

For every $\| i - k \| lt.eq 1$, the active bits of $u_A$ at $A_i$ and $u_B$ at $B_k$ form an initial segment of this order, including possibly a proper initial part of its last block. Indeed this is true for equal absolute indices by (4.1); adjacent absolute indices differ by adding a single bit of the next available block, and choosing one of the two side lengths from each of these adjacent indices preserves the same property. Consequently the final cutoff has exactly one of the two descriptions

#[#set math.equation(numbering: n => "(4.4)")
 $ l_A \( i \) = r + n s \, quad l_B \( k \) = n s + t \, & 1 lt.eq t lt.eq s \,\
l_B \( k \) = \( n + 1 \) s \, quad l_A \( i \) = r + n s + t \, & 1 lt.eq t lt.eq s . $ <tow:two-cutoffs>]

These descriptions include cutoffs at block ends by taking $t = s$. The initial value of $n_0$ ensures that the four blocks immediately before every such final block are full blocks of length $s$.

For a pair $\( i \, k \)$ with $\| i - k \| lt.eq 1$, put

#[#set math.equation(numbering: n => "(4.5)")
 $ alpha & = 1 + l_B \( i \) - l_B \( k \) \, & p & = r + alpha \,\
beta & = 1 + l_A \( k \) - l_A \( i \) \, & p' & = s - r + beta . $ <tow:offsets>]

Here $alpha \, beta in { 0 \, 1 \, 2 }$, and $p > p' > 0$ for large $ell$. There are $d$ slots at each $A_i$-vertex for this pair, indexed by $a = \( k - i \, j \)$, $1 lt.eq j lt.eq d$. At a $B_k$-vertex the slots are $c = \( i - k \, j \, b \)$, where $b in bb(F)_2^(p - p')$. Thus the desired degree on that side is

#[#set math.equation(numbering: n => "(4.6)")
 $ D_(i k) = d thin 2^(p - p') = D thin 2^(\| i \| - \| k \|) \, #h(2em) D \/ 2 lt.eq D_(i k) lt.eq 2 D . $ <tow:degrees>]

The identity follows from $p - p' = 2 r - s + \| i \| - \| k \|$. In particular, $d \| A_i \| = D_(i k) \| B_k \|$. After all three adjacent pairs are included, the degrees are $3 d$ on $A_i$ and at most $6 D$ on $B_i$.

Set $K = 32 s$. The #emph[family] of a pair is the tuple

$ \( k - i \, "sgn" \( i \) \, "sgn" \( k \) \, \| i \| med mod med K \, \| k \| med mod med K \) \, $

where zero has its own sign. There are at most $27 K^2$ families. The quantities $alpha \, beta \, p \, p'$, the slot conventions, and the phase of the final block are determined by this tuple. For a family that occurs more than once, both indices have the same nonzero sign. Its consecutive occurrences increase both absolute indices by $K$, and hence both side lengths by $K \/ 2 = 16 s$. Their final blocks are therefore separated by $32$ positions in (4.3). Families involving zero occur only once.

=== 4.2 The linear slot evaluations <the-linear-slot-evaluations>

On each side and for each slot define a linear map $cal(K)$ on padded streams and its evaluation

#[#set math.equation(numbering: n => "(4.7)")
 $ Q = v + cal(K) u . $ <tow:evaluation>]

On a diagonal block of length $h in { r \, s }$, $cal(K)$ is multiplication by a coefficient of $bb(F)_(2^h)$, after choosing a linear identification with $bb(F)_2^h$. Only $A$-block $0$ uses $h = r$. From each block it may also send a linear image into the first $alpha$ bits of the following block on side $A$, or into the first $beta$ bits of the following block on side $B$. There are no other off-diagonal terms. These images will be called spills. The same diagonal coefficient and spill matrix are used at every repeated block of length $s$ for a given family and slot. The spill from $A$-block $0$ may, and will, be zero.

Once the preceding input block is known, remove its spills from two slot evaluations on the current block; their difference then cancels the $v$-coordinate. If the diagonal coefficients differ, their difference is invertible and recovers the current $u$-block, followed by the $v$-block. This is the local operation behind recovery from a nonbacktracking path word.

We enforce this distinctness with finite global coefficient pools. On side $A$, a slot name is $\( delta \, j \)$, with $delta in { - 1 \, 0 \, 1 }$ and $1 lt.eq j lt.eq d$, so there are $3 d$ names. On side $B$, include in the slot name the offset, serial number, bucket width and bucket value. The width belongs to ${ log_2 d - 1 \, log_2 d \, log_2 d + 1 }$, so there are at most $\( 21 \/ 2 \) D$ names. Choose separate injections of the two pools into $bb(F)_(2^s)$, and an injection of the $A$-pool into $bb(F)_(2^r)$. They exist because $3 d < 2^r$ and $\( 21 \/ 2 \) D < 2^s$ for large $ell$. Use the resulting coefficients independently of height and family. In particular, any two different incident slots at a vertex have different diagonal coefficients, for every applicable block size. Spills can additionally depend on the family. Finite fields introduce no group elements: they are used only for these maps of bit coordinates. Their existence follows, for example, by taking the roots of $z^(2^h) - z$ in a splitting field over $bb(F)_2$; the roots form a field and, since the derivative is $- 1$, there are exactly $2^h$ of them.

Expansion requires a second property: a uniform bound on the fraction of slots inducing the same input functional from a nonzero output functional, including on partial blocks. The following choice of injections and spills supplies the needed multiplicity bounds.

#thm([Lemma 4.1.])[
  (Choice of coefficients and spills).  #emph[The injections and spills can be chosen so that the following holds for every family, separately on each side. Let $cal(I)$ be the set of slots for its one adjacent pair, let $n_(upright("sl")) = \| cal(I) \|$, and let 
$ M_a : bb(F)_2^s arrow.r bb(F)_2^(s + alpha) quad upright("or") quad M_c : bb(F)_2^s arrow.r bb(F)_2^(s + beta) $

 be diagonal multiplication followed by its spill. For every nonzero linear functional $zeta$ on the output space, every value of the restricted input functional $zeta M_a$, or $zeta M_c$, occurs on at most $0.55 n_(upright("sl"))$ slots after restriction to any nonempty initial segment of the $s$ input bits. On all $s$ input bits, the corresponding bound is $10^(- 3) n_(upright("sl"))$.]
] <tow:coefficient-choice>

#proof[
  Choose each injection uniformly among injections into its field, and, for every family and slot, choose an independent uniform two-row binary spill matrix, retaining just its first $alpha$ or $beta$ rows. Suppose first that the spill component of $zeta$ is nonzero. Conditional on all diagonal coefficients, the full input functionals $zeta M_a$ are independent and uniform among the $2^s$ binary functionals: a nonzero linear combination of independent uniform rows is uniform. Their restrictions to the first input bit are therefore independent fair bits. If the spill component is zero, the diagonal component is nonzero. Multiplication identifies the $2^s$ field coefficients bijectively with the $2^s$ input functionals, so the full functionals are sampled without replacement, and their first-bit values are sampled without replacement from an equally divided population.
  Both sampling rules obey the following form of Hoeffding’s concentration bound #cite(label("Hoeffding1963")); we include the short argument:
  $ bb(P) { S - bb(E) S gt.eq epsilon m } lt.eq exp \( - c_epsilon m \) $
  for the number $S$ of successes in $m$ samples and each fixed $epsilon > 0$; the same bound holds for the lower tail. For independent zero-one variables it follows by exponential Markov and the bound $bb(E) exp \( t \( X - bb(E) X \) \) lt.eq exp \( t^2 \/ 8 \)$. For sampling without replacement, the exponential moment is no larger than for independent samples with the same success proportion. Indeed, the mean product of any fixed number of distinct nonnegative population entries is at most the corresponding power of their mean: replacing two unequal entries by their average increases each elementary symmetric sum, because their sum is unchanged and their product increases. Repeating these replacements proves the inequality. Apply it to the entries $e^(t X)$, for either sign of $t$.
  Apply these bounds to each of the two first-bit values with threshold $0.55 m$. Apply them also to each full functional value with threshold $10^(- 3) m$; its expected proportion is $2^(- s)$, which is less than $10^(- 3) \/ 2$ for large $ell$. In the without-replacement full-functional case the stronger deterministic bound of one occurrence is available. The number of tests is at most $2^(O \( s \)) \( 1 + K \)^(O \( 1 \))$, whereas every test has $m gt.eq d$ and failure probability at most $e^(- c d)$, for an absolute $c > 0$. Their sum tends to zero as $ell arrow.r oo$. Choose an outcome for which all tests pass. Restricting to more than one input bit only splits first-bit multiplicity classes, proving all the asserted prefix bounds simultaneously. ◻
]

The output of $cal(K)$ fits in the active $v$-length at every pair. In fact those lengths equal

#[#set math.equation(numbering: n => "(4.8)")
 $ \| v_A \| = p + l_B \( k \) \, #h(2em) \| v_B \| = p' + l_A \( i \) . $ <tow:output-lengths>]

In the first case of (4.4), the $A$-output ends by $r + n s + alpha$ and the $B$-output by $\( n + 1 \) s + beta$. In the second case they end by $r + \( n + 1 \) s + alpha$ and $\( n + 1 \) s + beta$, respectively. These are bounded by (4.8), including the cases $alpha = 0$, $beta = 0$, and $t = s$.

=== 4.3 One padded permutation rule for each family <one-padded-permutation-rule-for-each-family>

A positive edge label is a triple consisting of a family, a serial number $j$, and a vector $x in bb(F)_2^p$. Write $x = b bar.v.double x'$, where $b$ has length $p - p'$ and $x'$ has length $p'$. The reverse orientation has the formal inverse label. A family and $x$ hence determine both slots, once their serial number is given.

We next define triangular transformations $cal(F)$ of $B$-blocks and $cal(J)$ of $A$-blocks. Their parameters include the family, $j$, and $x$. At each block the rule may also depend on all input $u$-blocks, on both sides, strictly earlier in (4.3). This is the complete list of keys. No transformation depends on input bits in its own block or a later block through its keys.

For each actual pair in the family, mark its last active block and its active prefix length $t$. At this marked block choose, for each possible tuple of preceding keys, a permutation of $bb(F)_2^t$; apply it to the first $t$ bits and leave the other bits of the block unchanged. In the universal rule, apply this permutation only when the four immediately preceding full $s$-blocks of input are not jointly zero. If they are jointly zero, use the identity. At unmarked blocks also use the identity. At a $B$-block the transformation contributes to $cal(F)$, and at an $A$-block to $cal(J)$.

The marked positions of one family are at least $32$ blocks apart, so there is at most one rule at any position. Any finite prefix uses only finitely many tables. On inputs padded at the actual cutoff, every higher marked rule is inactive: the first higher one has four previous blocks past the cutoff, and its gate is closed; the same is then true at every later marked block. All these preceding inputs are zero. Thus the rule preserves the active input lengths. It is triangular and invertible, since its gate and permutation key are known before its current block is inverted. These statements also hold when one side’s entire stream is fixed and the other is solved successively.

The equations defining the endpoints of an edge are

#[#set math.equation(numbering: n => "(4.9)")
 $ Q_A = x bar.v.double cal(F) \( u_B \) \, #h(2em) Q_B = x' bar.v.double cal(J) \( u_A \) . $ <tow:edge-equations>]

They are equations of padded streams. To solve them from a vertex $A_i$ and its slot $a$, compute $Q_A$, read its first $p$ bits as $x$, and obtain $c$ from its bucket. Invert $cal(F)$ successively to recover $u_B$; the known $u_A$ supplies its other keys. Then form $Q_B$ by the second equation and set $v_B = Q_B + cal(K)_c u_B$. Conversely, from $B_k \, c$, the first $p'$ bits of $Q_B$ give $x'$, and the bucket in $c$ gives $x$. Successively invert $cal(J)$, then compute $v_A$ from the first equation. The support bounds above ensure that the resulting streams have the required lengths. In inversion beyond the cutoff, the unmarked blocks copy zeros until the next marked block; its preceding four blocks are zero, so its gate is closed, and induction continues. The two constructions are inverse: they solve the same triangular equations with the same keys.

Let $Y^(\#)$ be the union of the blocks so defined. Every slot has exactly one incident edge, giving the degrees (4.6). Multiedges are allowed and are regarded as distinct slot incidences. The labeling is #emph[folded]: at an $A$-vertex two distinct slots differ in offset or serial number; at a $B$-vertex they differ in these data or in bucket. In every case the labels differ. All outgoing labels at $A$ are positive, and all outgoing labels at $B$ are formal inverses, so no further coincidences are possible. With $m_ell$ denoting the positive alphabet size, we have

#[#set math.equation(numbering: n => "(4.10)")
 $ m_ell lt.eq 27 K^2 d thin 2^(r + 2) = O #scale(x: 120%, y: 120%)[\(] d thin 2^r \( 1 + s \)^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) log_2 \( 2 m_ell \) = 11 ell + O \( log ell \) . $ <tow:alphabet>]

For the auxiliary graph $Y^0$, in each actual pair use the same rule except that its own last-block permutation is applied unconditionally. All rules at lower marked positions retain their gates. Higher rules are inactive on its padded inputs. The slot inversion argument still applies, so the auxiliary block has the same degrees and label set, and is folded as well.

#thm([Lemma 4.2.])[
  (The independent matching variables).  #emph[Fix an actual pair $\( i \, k \)$ and every table at its lower marked positions. The current last-block tables can be sampled so that the remaining random choices in its $Y^0$-block are independent uniform perfect matchings between pairs of clusters, each cluster having $2^t$ slot incidences. There is one matching for each tuple consisting of the family, serial number, $x$, and all preceding $u$-blocks on both sides. Every edge in each cluster pair is a possible edge, and its matching is used only for that pair of clusters.]
] <tow:matching-clusters>

#proof[
  Fix $a$ and $x$. Since adding $cal(K)_a u_A$ to $v_A$ is invertible, the $A_i$-vertices with these data are freely parametrized by $u_A$ and the tail of $Q_A$, of lengths $l_A \( i \)$ and $l_B \( k \)$. On the other side fix the resulting $c$ and $x'$. Its vertices are freely parametrized by $u_B$ and the tail of $Q_B$, of lengths $l_B \( k \)$ and $l_A \( i \)$. Thus both parameter spaces have dimension $l_A \( i \) + l_B \( k \)$.
  The previously fixed transformations bijectively identify all data before the final block, successively in the interleaved order. Fix these preceding $u$-values. In the first case of (4.4), the remaining $B$-incidences are parametrized by the $t$ final bits of $u_B$, while the remaining $A$-incidences are parametrized by the corresponding $t$ bits of the tail of $Q_A$. No extra data remain, since the fixed preceding values and these final bits specify the whole parameter space on each side. The current table of $cal(F)$ is precisely a bijection between these two sets of $2^t$ values. Its variation can change the computed $v_B$, but that coordinate is already determined by the other endpoint data; it is not another independent parameter. In the second case the roles are reversed: the $t$ final bits of $u_A$ are matched to the corresponding tail bits of $Q_B$ by the current $cal(J)$-table. Sampling a uniform permutation for each distinct full key tuple gives the stated independent uniform matchings. Different tuples specify disjoint clusters of slot incidences. The bucket is already part of $x$, so it supplies neither an omitted key nor a further coupling. ◻
]

The coefficient maps are now fixed, but the permutation tables remain to be chosen. The next section proves that the current matchings can be chosen to give a uniform incidence gap, whatever lower-cutoff tables have already been fixed. That result will allow a successive choice in each family: later tables cannot alter an earlier auxiliary block, since their gates are inactive on its padded streams.

== 5 Uniform expansion before pruning <exp:section>

Fix a height pair $\( i \, k \)$, $\| i - k \| lt.eq 1$, and fix all the permutation tables at smaller cutoffs in its family. Throughout this section write $A = A_i$, $B = B_k$, $D' = D_(i k)$, and $E = d \| A \| = D' \| B \|$. We use the stream conventions, coefficient choices, and matching coordinates of Lemma 5 and (4.9); in particular, the independent current permutations are the cluster matchings described in Lemma 6. The graph considered here is $Y^0$: its current last-block gate is open unconditionally. No assertion of expansion after pruning is needed.

On each side use uniform probability measure. If $N$ is the slot-average operator of any realization, then

$ \( N f \) \( a \) = 1 / d sum_(e : thin e_(-) = a) f \( e_(+) \) \, #h(2em) \( N^(*) g \) \( b \) = 1 / D' sum_(e : thin e_(+) = b) g \( e_(-) \) . $

Here slots, hence parallel edges, are counted separately. The adjoint identity follows from $d \| A \| = D' \| B \|$. Both operators preserve constants and are contractions: Jensen’s inequality followed by counting slots gives $parallel N f parallel_2^2 lt.eq parallel f parallel_2^2$, and likewise for $N^(*)$. Let $M = bb(E) N$, with expectation only over the current tables. The same facts hold for $M \, M^(*)$.

We first bound $M$ on centered functions by organizing them according to stream prefixes. The coefficient multiplicity bounds control the full-block terms; averaging the current tables reduces the terminal contribution to the partial-block version of the same variance estimate. We then select actual matchings by a lower bound on every cut and turn that bound into the required normalized incidence gap.

===== 5.1 A conditional variance calculation. <a-conditional-variance-calculation.>

The following elementary estimate specifies, in particular, the mean that is subtracted. Its last assertion is needed when the active input block ends partway through a full block.

#thm([Lemma 5.1.])[
  (Conditional Fourier estimate).  #emph[Let $C$ denote conditioned data. Conditional on $C$, let $U in bb(F)_2^t$ and $V in bb(F)_2^m$ be independent uniform vectors, independent also of auxiliary data $W$. For $1 lt.eq a lt.eq q$ let $M_a : bb(F)_2^t arrow.r bb(F)_2^m$ be linear, let $o_a = o_a \( C \, W \)$, and let $f_a \( C \, z \)$ be complex functions that do not depend separately on $U \, V \, W$. Set 
$ F = 1 / q sum_a f_a \( C \, V + M_a U + o_a \) \, #h(2em) mu \( C \) = 1 / q sum_a 2^(- m) sum_z f_a \( C \, z \) . $

 Suppose that for every nonzero linear functional $zeta : bb(F)_2^m arrow.r bb(F)_2$, every class of indices on which $zeta M_a$ is the same has size at most $theta q$. Then 
#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E) \( F divides C \, W \, U \) & = mu \( C \) \,\
bb(E) \| F - bb(E) \( F divides C \) \|^2 & lt.eq theta thin bb(E) [1 / q sum_a 2^(- m) sum_z \| f_a \( C \, z \) \|^2] . $ <exp:conditional-mean>]

 The conclusion applies with $theta = 10^(- 3)$ for a full active $s$-block and with $theta = 0.55$ for any nonempty active initial part, using the coefficient multiplicity bounds of Lemma 5.]
] <exp:fourier>

#proof[
  Translation of the independent uniform vector $V$ proves (5.1); in particular the right-hand side is independent of both $U$ and $W$. For fixed $C \, W$, write the normalized Fourier coefficients as
  $ hat(f)_a \( zeta \) = 2^(- m) sum_z f_a \( C \, z \) \( - 1 \)^(zeta \( z \)) . $
  Orthogonality first in $V$ and then in $U$ gives the exact identity
  $ bb(E)_(U \, V) \| F - mu \( C \) \|^2 = 1 / q^2 sum_(zeta eq.not 0) sum_(cal(C)) lr(|sum_(a in cal(C)) \( - 1 \)^(zeta \( o_a \)) hat(f)_a \( zeta \)|)^2 \, $
  where $cal(C)$ ranges over the classes with a common $zeta M_a$. Each square is at most $\| cal(C) \| sum_(a in cal(C)) \| hat(f)_a \( zeta \) \|^2$. Sum, use Parseval’s identity, and integrate over $C \, W$. Because the conditional mean is exactly $mu \( C \)$, this integration creates no additional variance term. ◻
]

===== 5.2 Prefixes and causal dependence. <prefixes-and-causal-dependence.>

Let $P_h^A$, $h gt.eq 0$, be conditional expectation onto the first $r + s h$ bits of each of $u_A \, v_A$. Let $P_j^B$, $j gt.eq 0$, be conditional expectation onto the first $s j$ bits of each of $u_B \, v_B$. Only active bits are retained; the others are deterministic zeros. Thus these are finite increasing filtrations, eventually equal to the identity, and $P_0^B$ is the projection onto constants. Denote the constant projection on either side by $C_A \, C_B$.

For a fixed $A$-slot and $j gt.eq 1$, the data needed to evaluate a function in $"ran" P_j^B$ are

#[#set math.equation(numbering: n => "(5.2)")
 $ u_A \|_(\[ 0 \, r + s \( j - 1 \) \)) \, #h(2em) Q_A \|_(\[ 0 \, p + s j \)) . $ <exp:forward-data>]

Indeed the first $p$ evaluation bits supply $x$, including its bucket, and inversion of $cal(F)$ supplies the first $j$ blocks of $u_B$. At the $j$th $B$-block the keys use only preceding interleaved blocks, ending with the $\( j - 1 \)$st $A$-block. To determine $v_B$ through length $s j$, the equation for $Q_B$ uses $cal(J) \( u_A \)$ through length at most

$ s j - p' = r + s \( j - 1 \) - beta lt.eq r + s \( j - 1 \) . $

The diagonal and forward-spill rule for $cal(K)_B$ uses no $u_B$ beyond its first $j$ blocks to produce these $v_B$ bits. This proves (5.2), including when a prefix extends into zero padding.

In the reverse direction, for an input in $"ran" P_h^A$ and a fixed $B$-slot, the needed data are

#[#set math.equation(numbering: n => "(5.3)")
 $ u_B \|_(\[ 0 \, s h \)) \, #h(2em) Q_B \|_(\[ 0 \, p' + r + s h \)) . $ <exp:reverse-data>]

Here $x'$ is read first and the bucket is already part of the slot; inverting $cal(J)$ supplies $u_A$ through $r + s h$. Its keys end with the $h$th $B$-block. Computing $v_A$ through $r + s h$ then uses $cal(F) \( u_B \)$ through at most $s h - alpha lt.eq s h$ bits and the already recovered $u_A$ blocks. These observations prove the reverse assertion also for $h = 0$.

To read a few bits of a diagonal evaluation block one may need its whole input block. Consequently (5.2) and (5.3) imply, for any fixed tables and also after taking their mean,

#[#set math.equation(numbering: n => "(5.4)")
 $ "ran" \( M P_j^B \) subset.eq "ran" P_(j + 1)^A \, #h(2em) "ran" \( M^(*) P_h^A \) subset.eq "ran" P_(h + 2)^B . $ <exp:causality>]

For example $p + s j = r + s j + alpha$ lies at most $alpha lt.eq 2$ bits into the next $A$-block; $p' + r + s h = \( h + 1 \) s + beta$ is handled by the next $B$-block. This explains both shifts in (5.4), including $alpha = 0$ or $beta = 0$, when the stated bounds can simply be non-sharp.

We now apply Lemma 7 to these data. For (5.2), condition on $P_(j - 1)^A$ and put $R = r + s \( j - 1 \)$. All still needed data from the $A$-state occur through its evaluation on $\[ R \, R + s + alpha \)$. If its $j$th input block and this entire $v_A$ interval are active, write that evaluation as

$ Z_a = V + M_a U + o_a . $

Here $U$ is the full $j$th $A$ input block and $V$ consists of the $s + alpha$ new $v_A$ bits. The offset contains the known spill from the preceding block and any diagonal contribution from the next input block to the last $alpha$ output bits. Such next-block input bits are the auxiliary variable $W$ of Lemma 7. They enter nowhere else: (5.2) uses direct $u_A$ only before $R$. Therefore the slot summand is a function $f_a \( C \, Z_a \)$ with no separate $W$-dependence. The $A$ coefficient map does not depend on the bucket extracted from $x$; that bucket may affect $f_a$, but does not change $M_a$. It follows that

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel \( 1 - P_(j - 1)^A \) M P_j^B parallel^2 lt.eq 10^(- 3) quad upright("whenever these full intervals are active.") $ <exp:forward-variance>]

For completeness, the right-hand side of (5.1) is bounded by the squared norm of the original input function, rather than a larger slot-dependent norm. A uniform output vertex with an independent uniform incident slot gives a uniform input vertex, since every input has the same number of slots. Thus the average over slots and vertices of a deterministic neighbor value squared is exactly the input norm squared. When a summand averages random table choices, Jensen’s inequality bounds its square by the corresponding average of those squares. These are precisely the individual norms in (5.1), since $V$ makes each $Z_a$ uniform conditional on all other data.

The identical argument in (5.3), conditioning on $P_h^B$, uses the $B$ input block on $\[ s h \, s \( h + 1 \) \)$ and its extended evaluation interval $\[ s h \, s \( h + 1 \) + beta \)$. It gives

#[#set math.equation(numbering: n => "(5.6)")
 $ parallel \( 1 - P_h^B \) M^(*) P_h^A parallel^2 lt.eq 10^(- 3) quad upright("when that input block and extended ") v_B upright(" interval are full.") $ <exp:reverse-variance>]

The explanation of the conditioned mean is the same in both directions: the means of the slot functions under their uniform evaluation argument depend only on the retained prefix, so no uncontrolled contribution comes from the frozen next-block inputs.

#thm([Lemma 5.2.])[
  (Uniform gap for the mean).  #emph[For every height pair, and every fixed choice of its lower-cutoff tables, the mean incidence $M$ satisfies 
$ parallel M : upright(bold(1))_B^perp arrow.r upright(bold(1))_A^perp parallel lt.eq sqrt(16 dot.op 10^(- 3) + 0.55) < 0.8 . $

 The bound is uniform in the number of full blocks, the final active length $1 lt.eq t lt.eq s$, and $0 lt.eq alpha \, beta lt.eq 2$.]
] <exp:mean-gap>

#proof[
  Use the orthogonal difference spaces
  $ E_0^A = P_0^A - C_A \, quad E_h^A = P_h^A - P_(h - 1)^A med \( h gt.eq 1 \) \, #h(2em) E_j^B = P_j^B - P_(j - 1)^B med \( j gt.eq 1 \) . $
  They decompose the centered spaces; once a filtration saturates, its further difference spaces are zero. Equation (5.4) shows that $E_h^A M E_j^B$ can be nonzero only if
  #[#set math.equation(numbering: n => "(5.7)")
   $ h lt.eq j + 1 \, #h(2em) j lt.eq h + 2 . $ <exp:four-bands>]
  When $h = j$ or $h = j + 1$, the norm of this block is at most $sqrt(10^(- 3))$ by (5.5), provided its full intervals exist. When $j = h + 1$ or $j = h + 2$, the same bound follows by adjointing (5.6). For each fixed value of $h - j$, the input difference spaces are mutually orthogonal, as are their output difference spaces. Hence a sum along any one of these four bands has norm at most $sqrt(10^(- 3))$; their sum has norm at most $4 sqrt(10^(- 3))$.
  There are exactly two forms of terminal cutoff in the interleaved order. We check the full-interval hypotheses and the remaining partial-block estimate in each.
  #emph[Case B: the last active block belongs to $B$.] Write
  $ l_A = r + n s \, #h(2em) l_B = n s + t \, #h(2em) 1 lt.eq t lt.eq s . $
  The active $v$ lengths are
  $ \| v_A \| = r + n s + alpha + t \, #h(2em) \| v_B \| = \( n + 1 \) s + beta . $
  For $1 lt.eq j lt.eq n$, the forward estimate uses the full $j$th $A$ block, and its extended interval ends at $r + j s + alpha lt.eq \| v_A \|$. In the other two bands with $j lt.eq n$, one has $h lt.eq n - 1$, so the reverse estimate uses a full $\( h + 1 \)$st $B$ block, ending at $s \( h + 1 \) + beta lt.eq \| v_B \|$. Thus the four-band argument gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel M \( P_n^B - C_B \) parallel lt.eq 4 sqrt(10^(- 3)) . $ <exp:low-B>]
  Consider now $M^(*) g$ for arbitrary $g in L^2 \( A \)$. Given a $B$-state and a $B$-slot, inversion through the preceding blocks determines $u_A$ and all of $v_A$ except its last $t$ bits. In fact all this determined data use only
  $ u_B \|_(\[ 0 \, n s \)) \, #h(2em) Q_B \|_(\[ 0 \, \( n + 1 \) s + beta \)) . $
  The independent current matching averages the remaining $t$ evaluation bits of $Q_A$ uniformly. These bits occupy $\[ p + n s \, p + n s + t \)$, and $cal(K)_A u_A$ is zero on this interval: its last possible spill ends at $r + n s + alpha = p + n s$. Thus the same bits of $v_A$ are uniformly averaged. Neither their distribution nor the determined part depends separately on the last $t$ bits of $u_B$. The tuple defining the matching uses only the preceding interleaved blocks, the slot, and $x$.
  After conditioning on $P_n^B$, the resulting averaged slot function therefore has the form in Lemma 7, with $U$ the $t$ active bits of the last $B$ block and $V$ the full $s + beta$ bits of $v_B$ starting at $n s$. No current or later input bits occur except through this evaluation. The multiplicity bound for the nonempty input prefix, followed by the slot-stationarity and Jensen argument already given, yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ parallel \( 1 - P_n^B \) M^(*) parallel^2 lt.eq 0.55 . $ <exp:terminal-B>]
  For centered $g$, the two projections $P_n^B$ and $1 - P_n^B$ are orthogonal, and the first component is bounded using the adjoint of (5.8). Consequently $parallel M^(*) g parallel^2 lt.eq \( 16 dot.op 10^(- 3) + 0.55 \) parallel g parallel^2$.
  #emph[Case A: the last active block belongs to $A$.] Write
  $ l_B = \( n + 1 \) s \, #h(2em) l_A = r + n s + t \, #h(2em) 1 lt.eq t lt.eq s . $
  Now
  $ \| v_A \| = r + \( n + 1 \) s + alpha \, #h(2em) \| v_B \| = \( n + 1 \) s + beta + t . $
  Restrict the $A$ input differences to $0 lt.eq h lt.eq n$. In the bands $h = j \, j + 1$, $j lt.eq n$, so the forward estimate uses a full $A$ block and an interval ending by $r + n s + alpha$. In the bands $j = h + 1 \, h + 2$, $h + 1 lt.eq n + 1$, so the reverse estimate uses a full $B$ block and an interval ending by $\( n + 1 \) s + beta$. All these intervals are active. Thus
  #[#set math.equation(numbering: n => "(5.10)")
   $ parallel M^(*) \( P_n^A - C_A \) parallel lt.eq 4 sqrt(10^(- 3)) . $ <exp:low-A>]
  The current permutation in $cal(J)$ averages the final $t$ bits of $Q_B$, starting at $p' + r + n s = \( n + 1 \) s + beta$. The contribution $cal(K)_B u_B$ ends there, so these are exactly the final $t$ bits of $v_B$. Once they are averaged, a slot value of $M f$ depends only on
  $ u_A \|_(\[ 0 \, r + n s \)) \, #h(2em) Q_A \|_(\[ 0 \, p + \( n + 1 \) s \)) . $
  Conditioning on $P_n^A$, use the $t$ active bits of the last $A$ input block and the full $s + alpha$ evaluation interval beginning at $r + n s$. Lemma 7 gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ parallel \( 1 - P_n^A \) M parallel^2 lt.eq 0.55 . $ <exp:terminal-A>]
  Combining this orthogonally with the adjoint bound from (5.10) proves the desired estimate in this case.
  The value $t = s$ is included in both arguments. In particular a cutoff immediately after a full $A$ block is Case A, with $n$ one less than the number of full $A$ blocks following its initial $r$ bits; a cutoff immediately after a full $B$ block is Case B. There is no missing zero-length final block. The actual stream lengths start with $n_0$ full blocks on each side, so the initial $r$-bit block is never terminal. If $n = 0$ is permitted in the displayed cases, (5.8) has zero domain in Case B, whereas in Case A the only low $A$ difference is $E_0^A$, handled by (5.6) with $h = 0$. The argument still applies. When a retained prefix already includes every active bit, the complementary difference spaces are zero and all the estimates remain valid. ◻
]

===== 5.3 Realizing the mean expansion by independent matchings. <realizing-the-mean-expansion-by-independent-matchings.>

We next choose the current tables so that the actual block has a uniform edge-isoperimetric constant. A tail estimate for each cut alone would introduce the number of vertices when summed over all subsets, and hence would not give the height-uniform bound needed here. Instead, we will use connected cuts and the local dependence of the matching variables to select the tables by the local lemma.

Give $A union.sq B$ the degree measure $mu \( a \) = d$, $mu \( b \) = D'$; write $v \( Z \) = sum_(z in Z) mu \( z \)$ and $mu \( A union.sq B \) = 2 E$. The mean random walk on this Hilbert space is

$ R = mat(delim: "(", 0, M; M^(*), 0) . $

The constant-on-each-side subspace has eigenvalues $1 \, - 1$; its orthogonal complement is the sum of the two sidewise centered spaces. Lemma 8 bounds $R$ above by $0.8$ on that complement. On the orthogonal complement of the global constant, the remaining sidewise-constant vector has eigenvalue $- 1$, so the same upper bound $0.8$ holds there. Hence, for $0 < v \( Z \) lt.eq E$, the expected number $b \( Z \)$ of crossing edges obeys

#[#set math.equation(numbering: n => "(5.12)")
 $ bb(E) b \( Z \) & = chevron.l \( 1 - R \) upright(bold(1))_Z \, upright(bold(1))_Z chevron.r_mu\
 & gt.eq 0.2 (v \( Z \) - frac(v \( Z \)^2, 2 E)) gt.eq 0.1 v \( Z \) . $ <exp:mean-cut>]

#thm([Lemma 5.3.])[
  (Tail for a cut).  #emph[With lower tables fixed, for every nonempty $Z$ of volume at most $E$, 
$ bb(P) { b \( Z \) < v \( Z \) \/ 20 } lt.eq exp \( - v \( Z \) \/ 400 \) . $

]
] <exp:cut-tail>

#proof[
  Write $X$ for the number of internal matched edges. Then $b \( Z \) = v \( Z \) - 2 X$. In each independent final cluster, $X$ is a hypergeometric count: it counts the images in the specified opposite subset of a specified subset under a uniform bijection. Orient every cluster from the same side, choosing globally whichever of the $A$- and $B$-sides of $Z$ has fewer incidences. Over all clusters the number of sampled incidences is then
  $ N_Z = min { d \| Z ∩ A \| \, D' \| Z ∩ B \| } lt.eq v \( Z \) \/ 2 . $
  The cluster counts are independent.
  Here is an elementary exponential estimate that also covers clusters of different sizes. For a sample of $m$ entries without replacement from a zero-one population with success fraction $theta.alt$, its exponential moment is at most $\( 1 - theta.alt + theta.alt e^h \)^m$. Indeed this moment is the normalized elementary symmetric polynomial of order $m$ in the positive entries $1$ and $e^h$. Replacing any two entries by their average, while keeping all other entries fixed, increases that polynomial: the only changing term is their product times a nonnegative elementary symmetric polynomial of order $m - 2$. Repeated averaging and continuity compare with the list having all entries equal to their mean. For $m = 0 \, 1$ the assertion is immediate. Finally, for a Bernoulli variable $B$, the second derivative of $log bb(E) e^(h \( B - bb(E) B \))$ is a tilted Bernoulli variance, at most $1 \/ 4$. Its value and first derivative vanish at $0$, so
  $ bb(E) e^(h \( B - bb(E) B \)) lt.eq e^(h^2 \/ 8) #h(2em) \( h in bb(R) \) . $
  Applying these facts cluster by cluster gives
  $ bb(E) e^(h \( X - bb(E) X \)) lt.eq e^(N_Z h^2 \/ 8) . $
  By (5.12), a bad cut requires $X - bb(E) X > v \( Z \) \/ 40$. If $N_Z = 0$ the event is impossible. Otherwise exponential Markov inequality, optimized at $h = 4 \( v \( Z \) \/ 40 \) \/ N_Z$, bounds its probability by
  $ exp (- frac(2 \( v \( Z \) \/ 40 \)^2, N_Z)) lt.eq exp \( - v \( Z \) \/ 400 \) . $
  ◻
]

Let $cal(G)$ be the finite simple graph of possible endpoints of edges in this block. Each cluster has at most $2^s$ vertices on each side. A vertex has at most $max { d \, D' }$ incident slots, so

$ Delta \( cal(G) \) lt.eq Delta := 2 D thin 2^s \, #h(2em) Q := 1 + Delta . $

For every nonempty connected vertex set $Z$ of $cal(G)$ with $v \( Z \) lt.eq E$, introduce the bad event of Lemma 9. It is enough to avoid these events. Indeed every other set splits into its connected components in $cal(G)$; actual edges never join different components, so the crossing counts and volumes add, and each component still has volume at most $E$.

Every matching variable is supported on one pair of clusters, with every edge between their two sides possible. Its support has $cal(G)$-diameter at most two. An event for $Z$ depends only on variables whose supports meet $Z$. Thus two events at distance greater than two use disjoint sets of independent variables. Moreover an event is independent jointly of any collection of such distant events, since all their variables together are disjoint from its own. We may therefore join two events in a dependency graph whenever their vertex sets have distance at most two.

There are at most $z Q^2$ vertices within distance two of a $z$-set. The number of connected $m$-sets containing a specified vertex is at most $Q^(2 \( m - 1 \))$: fix orders of the vertices and their neighbors, choose for each such set its first spanning tree under that order, and traverse this rooted tree in depth-first order. The traversal is a walk of length $2 \( m - 1 \)$ visiting exactly that set, and the orders make the association a well-defined injection into such walks. It follows that a bad event for a $z$-set has at most

#[#set math.equation(numbering: n => "(5.13)")
 $ z Q^(2 m) quad upright("dependent events indexed by ") m upright("-sets") . $ <exp:dependency-count>]

Counting events outside the volume bound or the event itself only enlarges this upper bound.

Set $a = d \/ 800$ and assign weights $x_Z = e^(- a \| Z \|)$. For all sufficiently large $ell$, uniformly in $i \, k$,

#[#set math.equation(numbering: n => "(5.14)")
 $ a gt.eq 2 \, #h(2em) rho := Q^2 e^(- a) lt.eq 1 / 2 . $ <exp:LLL-parameters>]

Indeed $log Q = O \( ell \)$, whereas $d = 2^(4 ell)$; neither bound contains the stream lengths. Equations (5.13) and (5.14) give the explicit uniform sum

#[#set math.equation(numbering: n => "(5.15)")
 $ sum_(Z' tilde.op Z) x_(Z') lt.eq \| Z \| sum_(m gt.eq 1) Q^(2 m) e^(- a m) = \| Z \| frac(rho, 1 - rho) lt.eq \| Z \| . $ <exp:dependency-sum>]

Since every weight is at most $1 \/ 2$, the elementary inequality $log \( 1 - x \) gt.eq - 2 x$ yields

$ x_Z product_(Z' tilde.op Z) \( 1 - x_(Z') \) gt.eq e^(- a \| Z \| - 2 \| Z \|) gt.eq e^(- 2 a \| Z \|) gt.eq bb(P) \( upright("bad ") Z \) . $

The last step uses $v \( Z \) gt.eq d \| Z \|$ and Lemma 9; here $D' gt.eq D \/ 2 gt.eq d$.

We include the finite asymmetric local-lemma argument for this inequality. The local lemma originates with Erdős and Lovász #cite(label("ErdosLovasz1975")); see #cite(label("MoserTardos2010")) Theorem 1.1 for the asymmetric form and #cite(label("AlonSpencer2016")) Section 5.1 for its conditional-probability proof. For any event $A_Z$ and any list $cal(S)$ of other events, induct on $\| cal(S) \|$ to prove

$ bb(P) (A_Z thin mid(bar.v) thin ⋂_(A in cal(S)) A^c) lt.eq x_Z \, $

as well as positivity of the avoidance probabilities used. Split $cal(S)$ into neighbors $cal(N)$ of $A_Z$ and nonneighbors $cal(T)$. Independence gives $bb(P) \( A_Z divides ⋂_(cal(T)) A^c \) = bb(P) \( A_Z \)$. By the induction hypothesis and the product rule,

$ bb(P) (⋂_(cal(N)) A^c thin mid(bar.v) thin ⋂_(cal(T)) A^c) gt.eq product_(A_(Z') in cal(N)) \( 1 - x_(Z') \) . $

If $cal(N)$ is nonempty, each conditional probability used on the left conditions on fewer than $\| cal(S) \|$ avoided events. Dividing by this lower bound proves the desired estimate using the local-lemma inequality above. If $cal(N)$ is empty, independence alone proves it. Beginning with the empty list and multiplying successive survival probabilities also proves their positivity. In particular the probability of avoiding the entire finite list is positive. We have obtained an actual block satisfying

#[#set math.equation(numbering: n => "(5.16)")
 $ b \( Z \) gt.eq 1 / 20 v \( Z \) #h(2em) \( 0 < v \( Z \) lt.eq E \) . $ <exp:actual-cut>]

#thm([Proposition 5.4.])[
  (Expansion of the realized incidence).  #emph[For all sufficiently large $ell$, independently of the height pair and of its previously fixed lower tables, its current tables can be chosen so that (5.16) holds. For this choice, the incidence operator of the actual $Y^0$ block, with each entry normalized by $sqrt(d D')$ in counting Hilbert spaces, sends normalized constants to normalized constants, as does its adjoint, and has norm at most $1 - chi$ between their orthogonal complements, where 
$ chi = 1 / 800 . $

]
] <exp:realized-gap>

#proof[
  Only the passage from (5.16) to the incidence norm remains. We give the weighted discrete Cheeger argument with our biregular normalization; compare Dodziuk #cite(label("Dodziuk1984")) and Alon–Milman #cite(label("AM1985")). Write $R_0$ for the actual random walk, self-adjoint in degree measure. For real $f$ its Dirichlet form is
  $ cal(E) \( f \) = chevron.l \( 1 - R_0 \) f \, f chevron.r_mu = sum_(x y med upright("edge")) \( f \( x \) - f \( y \) \)^2 . $
  Each edge in this sum is counted once, with multiplicity. If $w$ is nonnegative and its positive support has volume at most $E$, integration of (5.16) over the level sets of $w^2$ gives
  $ sum_(x y med upright("edge")) \| w \( x \)^2 - w \( y \)^2 \| = integral_0^oo b \( { w^2 > t } \) thin d t gt.eq 1 / 20 sum_x mu \( x \) w \( x \)^2 . $
  On the other hand Cauchy–Schwarz and $\( w \( x \) + w \( y \) \)^2 lt.eq 2 \( w \( x \)^2 + w \( y \)^2 \)$ show that the square of the left side is at most
  $ cal(E) \( w \) sum_(x y med upright("edge")) \( w \( x \) + w \( y \) \)^2 lt.eq 2 cal(E) \( w \) parallel w parallel_mu^2 . $
  Thus $cal(E) \( w \) gt.eq parallel w parallel_mu^2 \/ 800$, including $w = 0$.
  For an arbitrary real $f$, choose a degree-weighted median $m$: both ${ f > m }$ and ${ f < m }$ have volume at most $E$. Such a value is obtained by ordering the finitely many function values and stopping when cumulative mass reaches half the total. Apply the preceding estimate to $w_(+) = \( f - m \)_(+)$ and $w_(-) = \( m - f \)_(+)$. On each edge,
  $ \( w_(+) \( x \) - w_(+) \( y \) \)^2 + \( w_(-) \( x \) - w_(-) \( y \) \)^2 lt.eq \( f \( x \) - f \( y \) \)^2 . $
  This follows by equality when both endpoints are on the same side of $m$, and by $a^2 + b^2 lt.eq \( a + b \)^2$ otherwise. Consequently, for a degree-centered $f$,
  $ cal(E) \( f \) gt.eq 1 / 800 parallel f - m parallel_mu^2 = 1 / 800 #scale(x: 120%, y: 120%)[\(] parallel f parallel_mu^2 + 2 E m^2 #scale(x: 120%, y: 120%)[\)] gt.eq 1 / 800 parallel f parallel_mu^2 . $
  For complex $f$, apply this to its real and imaginary parts. Hence $R_0 lt.eq 1 - 1 \/ 800$ on the orthogonal complement of the global constant.
  Let $T$ be the counting-space incidence divided by $sqrt(d D')$. Multiplication by $sqrt(d)$ on $A$ and $sqrt(D')$ on $B$ is a unitary from degree measure to counting measure and sends $R_0$ to
  $ mat(delim: "(", 0, T; T^(*), 0) . $
  Biregularity and $d \| A \| = D' \| B \|$ give $T \( \| B \|^(- 1 \/ 2) upright(bold(1))_B \) = \| A \|^(- 1 \/ 2) upright(bold(1))_A$ and the adjoint identity. The centered spaces are invariant in the two directions. On their direct sum the displayed self-adjoint block operator has norm $parallel T \|_(upright(bold(1))_B^perp) parallel$ and spectrum symmetric about zero: conjugation by $"diag" \( 1 \, - 1 \)$ changes its sign. Its largest spectral value therefore equals this norm. Every vector in that direct sum is orthogonal to the global degree constant under the unitary identification, so the preceding upper gap proves the assertion. This also explains why the global anti-constant eigenvalue $- 1$ does not weaken the incidence bound. ◻
]

There are finitely many families. In each family, fix successful current tables successively in increasing cutoff order. A current choice does not alter any smaller-cutoff block, whose padded inputs turn off the higher-cutoff gates. Proposition 10 is uniform over every earlier choice, so this succession defines all the countably many tables. For example, impose a finite ordering on each current collection of tables and choose its first successful element. The construction therefore yields all the required pre-pruning incidences with the same positive constant $chi$.

== 6 Pruning and unique recovery of long paths <prune:section>

To pass from the two towers to one graph, we need both a small deletion fraction in every layer and long words that determine their paths. We first prove that a word recovers padded stream prefixes at interior positions in $Y^(\#)$. This does not yet identify the layer: the labels determine its sign and residue but need not determine its absolute value, and padding can conceal a shorter stream. The subsequent deletions resolve this ambiguity, make the gated and auxiliary graphs agree, and remove short cyclic paths.

A path in this section is a finite edge walk, possibly with repeated vertices. Its radius at a specified position is the smaller of the numbers of edges available in the two directions from that position. A nonbacktracking path never follows an edge immediately by its reverse. A closed path is cyclically nonbacktracking when this also holds at its cyclic junction.

#thm([Lemma 6.1.])[
  (Recovery of stream prefixes).  #emph[Suppose two nonbacktracking paths in $Y^(\#)$ have the same oriented label word. At corresponding $A$-positions of radius at least $2 j + 1$, both padded streams agree through length $r + s j$, for every $j gt.eq 0$. At corresponding $B$-positions of radius at least $2 j$, both padded streams agree through length $s j$, for every $j gt.eq 1$. The compared positions need not be in the same layer.]
] <prune:prefix-recovery>

#proof[
  The orientation of a letter identifies the side of either endpoint. Reading its underlying positive label gives the family, the serial number and $x = b bar.v.double x'$, and therefore both slots. In particular, the same word identifies the same slot names, diagonal coefficients, spill maps, and family rules at corresponding positions. It also identifies the signs and residues modulo $K$ of the layer indices, although their absolute values may differ.
  At an interior position the two incident slots are distinct. Otherwise the incoming and outgoing edges would be the unique edge at the same slot, so the path would backtrack. Write their evaluations on a current block as
  $ Q_h^a = v_h + lambda_a u_h + S_a u_(h - 1) \, #h(2em) Q_h^b = v_h + lambda_b u_h + S_b u_(h - 1) . $
  Here $u_h \, v_h$ are the full padded current blocks, multiplication uses their corresponding field, and the last terms are the spills from the preceding block, extended by zero as needed. For the first block there is no preceding spill. If the two evaluation blocks and the preceding input block have been recovered, subtracting gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ \( lambda_a - lambda_b \) u_h = Q_h^a - Q_h^b - \( S_a - S_b \) u_(h - 1) . $ <prune:block-inversion>]
  The coefficient difference is nonzero and hence invertible. Thus $u_h$, followed by $v_h$, is recovered. Different spill lengths for the two incident slots do not affect this argument.
  Call the asserted $A$-statement at index $j$ the assertion $cal(A)_j$, and the $B$-statement $cal(B)_j$. Interpret $cal(B)_0$ as the vacuous recovery of the empty prefix. At radius one on side $A$, the first $r$ bits of each incident evaluation are present in its label $x$, because $p = r + alpha gt.eq r$. Equation (6.1) for the first block proves $cal(A)_0$.
  Suppose $j gt.eq 1$. At a $B$-position of radius $2 j$, both neighbors satisfy $cal(A)_(j - 1)$; centrally we already have $cal(B)_(j - 1)$. For either incident edge, the second equation of (4.9) shows that to know $Q_B$ through length $s j$, beyond the label prefix $x'$, it suffices to know the $cal(J)$-output through length
  $ s j - p' = r + s \( j - 1 \) - beta lt.eq r + s \( j - 1 \) . $
  All source $A$-blocks involved are known in full at the neighbor. Every key for the transformation of $A$-block $j - 1$, or an earlier block, uses central $B$-blocks at most $j - 1$, together with earlier blocks of that neighbor’s $A$-stream. These are all known. Consequently the indicated output prefix, including every gate decision, agrees in the two paths. Both central evaluation prefixes therefore agree through $s j$. Their preceding spill inputs are already known by $cal(B)_(j - 1)$, so (6.1) recovers the next full $B$-block. This proves $cal(B)_j$.
  At an $A$-position of radius $2 j + 1$, both neighbors satisfy $cal(B)_j$, and centrally we have $cal(A)_(j - 1)$. By the first equation of (4.9), the evaluation prefix through $r + s j$ needs only the $cal(F)$-output through
  $ r + s j - p = s j - alpha lt.eq s j . $
  The required neighbor $B$-blocks through block $j$ are fully known. The keys for such a block use central $A$-blocks only through block $j - 1$, and preceding neighbor $B$-blocks. These again are known, so both evaluation prefixes agree. Subtract the already known preceding spill and apply (6.1). This proves $cal(A)_j$ and completes the alternating induction.
  This proof uses full padded blocks. A permutation may mix all the bits of a block, but its entire source block is already known at the neighbor before it is used. Inactive bits cause no difficulty because the equations are padded-stream equations. When a rule lies beyond one of the compared paths’ actual cutoffs, it is still the same family rule on both paths; equality of the preceding input blocks gives equality of its key and gate. This is precisely why Lemma 11 is proved in $Y^(\#)$, with its family-wide gated rules. The inequalities used above also include $alpha = 0$, $beta = 0$, and a final partial block of any length $1 lt.eq t lt.eq s$. ◻
]

#thm([Corollary 6.2.])[
  (Few short cyclic paths at one layer).  #emph[Fix a layer and a side. A nonempty cyclically reduced oriented label word is the word of at most one based cyclically nonbacktracking closed path with its base on that layer and side. Consequently the number of vertices of $A_i$, or of $B_i$, supporting such a closed path of length at most $g_i$ is at most 
$ sum_(a = 1)^(floor.l g_i floor.r) \( 2 m_ell \)^a . $

 For all sufficiently large $ell$, this is a fraction at most $2^(- 0.9 H_i)$ of either vertex set, uniformly in $i$.]
] <prune:cycle-count>

#proof[
  Repeat two closed paths with the same word arbitrarily many times in both directions. Cyclic nonbacktracking ensures that every such repetition is nonbacktracking. At corresponding base positions, Lemma 11 recovers arbitrarily long prefixes. Since the layer and side are fixed, this eventually recovers all active coordinates of both vertices, making their base states equal. Foldedness then determines their entire based paths. Conversely a cyclically nonbacktracking closed path has a cyclically reduced word: inverse successive letters, including at the cyclic junction, would force a backtrack by foldedness.
  There are at most $\( 2 m_ell \)^a$ words of length $a$; counting all words only enlarges the bound. Both vertex-set sizes are at least $2^(H_i)$, and (4.10) gives
  $ frac(log_2 \( 2 m_ell \), 100 log_2 d) < 1 / 20 $
  for large $ell$. If $floor.l g_i floor.r gt.eq 1$, the geometric sum is at most $2 \( 2 m_ell \)^(g_i)$, so its fraction is at most $2^(1 - 0.95 H_i) lt.eq 2^(- 0.9 H_i)$. If the sum is empty the claim is immediate. Since $H_i gt.eq H_0 arrow.r oo$, the threshold is uniform over all layers. ◻
]

We now specify the deleted sets. They are sets of vertices of the common vertex set of $Y^0$ and $Y^(\#)$.

===== 6.1 Gate deletions. <gate-deletions.>

At each vertex and each adjacent-pair slot evaluate the gate at that pair’s own final block, whether or not the current auxiliary rule actually consults it. Delete the vertex if any of these gates is closed. The inputs before the last block are determined without using its current permutation, so this is a well-defined test on the slot state, identical for the gated and auxiliary prescriptions.

At a fixed $A$-slot, conditional on $x$, the coordinates $u_A$ and the tail of $Q_A$ are independent uniform bits, by the parametrization in Lemma 6. The triangular equations turn them bijectively into the interleaved input $u$-values. Thus all preceding input coordinates are independent uniform bits. The same reasoning at a fixed $B$-slot uses $x'$, its fixed bucket, $u_B$, and the tail of $Q_B$. In particular the four full $s$-blocks preceding the cutoff are jointly zero with probability exactly $2^(- 4 s)$ at either slot. The union bound and the maximum degree $6 D$ show that these deletions have fraction at most

#[#set math.equation(numbering: n => "(6.2)")
 $ epsilon_(upright("gate")) = 6 D thin 2^(- 4 s) . $ <prune:gate-budget>]

On vertices surviving these deletions the induced graphs from $Y^0$ and $Y^(\#)$ are identical. Indeed, from a surviving slot state its current final gate is open, so the two endpoint constructions agree. All lower rules already agree. This argument works from either side of an edge and proves equality of the induced edge sets, including multiplicities and labels.

===== 6.2 Separation of heights. <separation-of-heights.>

The next deletion distinguishes larger-layer vertices from the zero padding of smaller-layer vertices with the same sign and residue. For a vertex on either side at layer $i$, consider every layer $i'$ with

$ "sgn" \( i' \) = "sgn" \( i \) \, #h(2em) \| i' \| equiv \| i \| med \( mod med K \) \, #h(2em) \| i' \| < \| i \| . $

Put $m = \( \| i \| - \| i' \| \) \/ K gt.eq 1$ and

#[#set math.equation(numbering: n => "(6.3)")
 $ q \( i \, i' \) = min { H_(i') \, m K \/ 2 } . $ <prune:zero-window>]

Delete the vertex if all its own $u$-bits immediately after that side’s cutoff at $i'$, for these $q \( i \, i' \)$ positions, are zero. This interval consists of active bits at $i$, because on either side the length increases by exactly $m K \/ 2$ between these two layers. Its zero probability under uniform vertex measure is $2^(- q \( i \, i' \))$. No layers of distinct signs are tested, and zero has no smaller layer with its sign.

The union bound gives, on every side and layer,

#[#set math.equation(numbering: n => "(6.4)")
 $ epsilon_(upright("sep")) & lt.eq sum_(m gt.eq 1) 2^(- m K \/ 2) + sum_(i' in bb(Z)) 2^(- H_(i'))\
 & = frac(2^(- K \/ 2), 1 - 2^(- K \/ 2)) + 3 thin 2^(- H_0) . $ <prune:separation-budget>]

Here $2^(- min \( a \, b \)) lt.eq 2^(- a) + 2^(- b)$, and the second sum is evaluated using $H_(i') = H_0 + \| i' \|$. Thus the estimate stays uniform even when the larger layer has arbitrarily many smaller layers of its residue.

===== 6.3 Short-cycle deletions. <short-cycle-deletions.>

At layer $i$, delete every vertex supporting a nonempty cyclically nonbacktracking closed path in $Y^(\#)$ of length at most $g_i$. By Corollary 12, the fraction deleted on either side is at most $2^(- 0.9 H_i)$. This test is performed in the already specified graph $Y^(\#)$, so it does not depend circularly on the final induced graph.

Let $Y$ be the graph induced on the vertices surviving all three deletions. It is an induced subgraph both of $Y^0$ and of $Y^(\#)$. Combining the three budgets gives a uniform bound

#[#set math.equation(numbering: n => "(6.5)")
 $ epsilon_ell & = 6 D thin 2^(- 4 s) + frac(2^(- K \/ 2), 1 - 2^(- K \/ 2)) + 3 thin 2^(- H_0) + 2^(- 0.9 H_0) arrow.r 0 . $ <prune:total-budget>]

For example, $D 2^(- 4 s) = 2^(- 32 ell)$. Fractions here and below are always taken relative to the original sets $A_i \, B_i$, not relative to an already pruned set.

#thm([Proposition 6.3.])[
  (The tower properties).  #emph[For all sufficiently large $ell$, the preceding choices give a graph $Y^0$ on sets of sizes $\| A_i \| = d 2^(H_i)$ and $\| B_i \| = 2^(H_i)$, and its induced subgraph $Y$, with these properties.]
  + #emph[For every $\| i - k \| lt.eq 1$, the $Y^0$-block between $A_i$ and $B_k$ has degrees $d \, D_(i k)$ with $D_(i k) = D 2^(\| i \| - \| k \|)$. Its counting incidence divided by $sqrt(d D_(i k))$ maps normalized constants to normalized constants, as does its adjoint. On their orthogonal complements its norm is at most $1 - chi$, with the absolute constant $chi$ of Proposition 10.]
  + #emph[The fraction removed from any $A_i$ or $B_i$ is at most $epsilon_ell$ of (6.5).]
  + #emph[The labels of $Y$ are folded, with positive alphabet size at most $m_ell = O \( d 2^r \( 1 + s \)^2 \)$.]
  + #emph[Every nonbacktracking path in $Y$ beginning at layer $i$ and having length at least $L_i$ is determined by its oriented word among all paths in $Y$, including paths beginning in other layers.]
  + #emph[There is no nonempty cyclically nonbacktracking closed path in $Y$, based at layer $i$, of length at most $g_i$.]
] <prune:tower-properties>

#proof[
  Only the fourth item requires further proof. The degree and norm claims are established in (4.6) and Proposition 10. For normalized counting constants, for example, the constant entry after applying normalized incidence is $d \/ \( sqrt(d D_(i k)) sqrt(\| B_k \|) \) = 1 \/ sqrt(\| A_i \|)$, using $d \| A_i \| = D_(i k) \| B_k \|$; the adjoint calculation is the same. The deletion and alphabet claims have already been proved. Any short cyclic path in $Y$ is also one in $Y^(\#)$, and its base vertex was deleted in the third step, proving the fifth item.
  Take a path beginning in layer $i$, and compare it with a path having the same word. By foldedness, any path with this word is also nonbacktracking. It suffices to identify the segment of length $N = ceil.l L_i ceil.r$ at the beginning of each path. Choose a midpoint position, whose radius is at least $floor.l N \/ 2 floor.r$, and let its layer on the first path be $j$. Every edge changes the layer by at most one, so
  $ H_j lt.eq H_i + N . $
  Lemma 11 recovers both padded streams at that position through length at least
  $ frac(s N, 4) - 2 s gt.eq frac(25 s, log_2 d) H_i - 2 s = 62.5 H_i - 2 s . $
  Since $H_i gt.eq H_0$ and $N lt.eq 100 H_i \/ log_2 d + 1$, this quantity is greater than $2 H_j$ for all sufficiently large $ell$, uniformly in $i$. For side $A$ the exact recovered length at radius $R$ is $r + s floor.l \( R - 1 \) \/ 2 floor.r$; on side $B$ it is $s floor.l R \/ 2 floor.r$. These formulas give the displayed lower bound on both sides, including either parity of $N$.
  The common incident labels force the two midpoint layers to have the same sign and residue modulo $K$. If the layer indices are equal, all active coordinates are recovered, since each has length at most $H_j$, and the midpoint vertices coincide. Suppose instead they differ. Write $i_(-)$ and $i_(+)$ for their indices ordered by absolute value, and put $H_(-) = H_(i_(-))$. Then $H_(-) lt.eq H_j$ and $\| i_(+) \| - \| i_(-) \| = m K$ for some $m gt.eq 1$. If $l_(-)$ is the smaller vertex’s own $u$-length, the interval tested at the larger vertex in (6.3) ends no later than
  $ l_(-) + min { H_(-) \, m K \/ 2 } lt.eq 2 H_(-) lt.eq 2 H_j . $
  The smaller vertex’s padding is zero on this entire interval. Prefix recovery forces the larger vertex’s active $u$-bits on the same interval to be zero. It would therefore have been removed by the second deletion, a contradiction. This reasoning also covers the case where the first path has the larger midpoint height. The case of a zero midpoint index was already in the equal-layer case, since its sign is distinguished.
  Thus the midpoint vertices coincide in all cases. Foldedness determines an edge uniquely from its initial vertex and its label; applying this forward and backward from the common midpoint identifies the whole two segments. Continuing forward identifies any remaining part of the compared words. This proves the fourth item. ◻
]

#thm([Corollary 6.4.])[
  (Effect of deletion on constant spaces).  #emph[Let $Pi$ be the orthogonal projection that retains the vertices of $Y$ in the counting Hilbert space of the full tower, with any additional Hilbert-space tensor factor. Let $C$ be the subspace of vectors that are constant on each separate $A_i$ and $B_i$ in the vertex coordinate. Then 
$ parallel \( 1 - Pi \) \|_C parallel lt.eq sqrt(epsilon_ell) . $

 In particular the same bound holds on every subspace of $C$, uniformly in the additional tensor factor.]
] <prune:constant-compression>

#proof[
  On one normalized constant vector the squared mass removed is exactly the fraction of vertices removed from that set. Distinct side and layer sets are orthogonal, so the squared losses add, and each is bounded by $epsilon_ell$ times the corresponding squared input norm. Tensoring changes neither calculation. ◻
]

== 7 Geometry of the voltage cover and torsion-freeness <geo:section>

Embedding the components of the voltage cover in a Cayley graph is not enough for the later operator comparison, because different copies can overlap. We therefore seek disjoint assigned domains, with the removed vertices controlled by one finite ball per copy and the unused Cayley edges forming a forest. The input is the girth condition (7.2), which the later sampling argument must establish; no assertion about an operator’s spectral distribution is used here. The constants in this section are chosen before the voltage values and the final alphabet are chosen.

The use of labeled graphs as relators follows the geometric strategy of Gromov #cite(label("Gromov2003")) Sections 2 and 4.8. Finite alphabets with global separation of long path words are developed by Osajda #cite(label("Osajda2020")) Section 2. The diagrammatic embedding argument is closely related to Ollivier #cite(label("Ollivier2006")) Section 2 and Gruber #cite(label("Gruber2015")) Lemma 4.1. Here the relator graphs are components of a voltage cover, possibly with nontrivial stabilizers. We give the embedding, overlap, and torsion arguments for these precise hypotheses.

=== 7.1 Graphs, presentations, and the conditional input <geo:conventions>

All graphs in this section are combinatorial graphs, possibly with loops or parallel edges. An unoriented edge has two formal orientations, interchanged by a fixed-point-free reversal operation. Traversing an edge and immediately traversing its reverse is a backtrack. A closed walk is cyclically nonbacktracking if it has no backtrack, including at its closing corner. Edge lengths are one, degrees count incidences, and a ball denotes the induced subgraph on the vertices at most its stated distance from its center. A forest has no nonempty finite circuit, with a loop and a pair of parallel edges counted as circuits of lengths one and two. Chains always have finite support. An orientation chosen once for each unoriented edge identifies the space of edge chains over a field $k$ with the free vector space on those edges, with boundary $partial \[ x \, y \] = \[ y \] - \[ x \]$. The cycle space is $Z_1 \( - \; k \) = ker partial$.

Let $Y$ be the surviving tower. The properties of it needed in this section are the following: it is countable, has maximum degree at most $6 D$, and has an integer layer function whose change across an edge is at most one. Its oriented labeling is folded: the labels of the oriented edges leaving any vertex are distinct. Positive labels and their formal inverses are disjoint alphabets. Finally a nonbacktracking path starting in layer $i$, of length at least $L_i = 100 H_i \/ log_2 d$, is determined, including its location in $Y$, by its oriented label word. This uniqueness compares paths anywhere in $Y$. Refining these labels by arbitrary additional tags preserves both foldedness and this uniqueness property.

The following elementary estimate will be used with fixed constants, however large. If two vertices can be joined by a walk of length $a H_i \/ log_2 d$, starting in layer $i$, then

#[#set math.equation(numbering: n => "(7.1)")
 $ lr(|H_j / H_i - 1|) lt.eq frac(a, log_2 d) $ <geo:layer-comparison>]

at every layer $j$ encountered. This follows from $\| H_j - H_i \| lt.eq \| j - i \|$. Consequently all subsequent comparisons become uniform in $i$ by increasing $ell$. Also $L_i > 2$ for all $i$ with the parameters of the construction.

Let $F$ be a countable torsion-free group. Give each positive edge $e$ of $Y$ a voltage $z_e in F$, and give its reverse voltage $z_e^(- 1)$. The ordinary voltage-cover construction of Gross and Gross–Tucker #cite(label("Gross1974")) #cite(label("GT1977")) gives a graph $P$ with vertices $\( v \, f \)$ and an oriented lift

$ \( v \, f \) arrow.r \( v' \, f z_e \) $

over each oriented edge $e : v arrow.r v'$. The left deck action is $delta_a \( v \, f \) = \( v \, a f \)$ for $a in F$. It acts freely on vertices and transitively on the lifts of every fixed base vertex or fixed base path; it can carry one connected component of $P$ to another. Labels, layers, and the distinguished positive orientations are pulled back from $Y$.

We assume that the augmented positive alphabet $S$ is finite and that

#[#set math.equation(numbering: n => "(7.2)")
 $ upright("there is no nonempty cyclically nonbacktracking closed walk in ") P\
upright("based in layer ") i upright(" of length at most ") C_(*) H_i \/ log_2 d \, #h(2em) i in bb(Z) . $ <geo:girth>]

Here $C_(*)$ is a single absolute constant fixed below. This is a condition on the actual cover, not just on $Y$ and not just on simple base circuits. It includes all lifts, although whether a base closed walk has trivial holonomy does not depend on the starting deck coordinate.

Define

#[#set math.equation(numbering: n => "(7.3)")
 $ Gamma_(upright("proj")) = chevron.l S divides upright("label words of all closed walks in ") P chevron.r \, #h(2em) X = "Cay"_(upright("right")) \( Gamma_(upright("proj")) \, S \) . $ <geo:presentation>]

The Cayley graph is formal: its positive edges are the pairs $\( h \, sigma \)$, with endpoints $h \, h sigma$, for $h in Gamma_(upright("proj"))$, $sigma in S$. We do not identify distinct such edges even if their unordered endpoints coincide. Their reverse orientations have labels $sigma^(- 1)$. Left translation preserves every formal edge label and its positive orientation.

For a connected component $C$ of $P$, a vertex $v_0 in C$, and $h in Gamma_(upright("proj"))$, there is a unique label-preserving graph map $phi.alt : C arrow.r X$ with $phi.alt \( v_0 \) = h$: the image of the endpoint of a path from $v_0$ is $h$ times the label word of that path. Independence of the path follows from (7.3). The maps are not assumed injective at this stage.

#thm([Theorem 7.1.])[
  (Geometric conclusion).  #emph[There are absolute constants $C_(*) \, C_bullet$ such that, for sufficiently large $ell$, the preceding hypotheses have the following consequences. Every component map $phi.alt : C arrow.r X$ is an embedding. Index copies by pairs $\( C \, phi.alt \)$ modulo the equivalence 
$ \( C \, phi.alt \) tilde.op \( delta_a C \, phi.alt delta_a^(- 1) \) \, #h(2em) a in F . $

 Thus an indexed copy $Q$ remembers its source component and source vertices up to this deck alignment, in addition to its embedded image. There is a well-order of these copies and an induced intrinsic ball $B \( Q \)$ in each $Q$ such that]
  + #emph[every vertex of $Q$ shared with an earlier copy belongs to $B \( Q \)$;]
  + #emph[the subgraph of $Q$ consisting of all edges with at least one endpoint in $B \( Q \)$ is a forest;]
  + #emph[for every vertex of $B \( Q \)$ lying over layer $i$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ \| V \( B \( Q \) \) \| lt.eq frak(w)_i \, #h(2em) frak(w)_i = 2^(C_bullet H_i) \; $ <geo:weight>]

]
  + #emph[if $D_Q$ is $V \( Q \)$ minus its vertices shared with earlier copies, the domains $D_Q$ are pairwise disjoint, and deleting every edge of $Q$ whose two endpoints lie in $D_Q$, for all $Q$, leaves a forest in $X$.]
  #emph[Furthermore $Gamma_(upright("proj"))$ is torsion-free. None of the constants depends on $F$, the voltage values, the number of components of $P$, or $\| S \|$.]
] <geo:main>

=== 7.2 Plane diagrams and reductions before injectivity <geo:diagrams>

The same short-arc count will first rule out failures of injectivity and later bound intrinsic distances within embedded copies. We retain source paths in the diagrams: merging source walks requires actual deck alignment, not merely equality of label words.

We use the following form of the van Kampen Lemma; see #cite(label("LyndonSchupp1977")) Chapter V, Section 1. If a word is freely equal to a product of $J$ conjugates of defining relators and their inverses, it is the exterior contour word of a finite connected plane labeled multigraph with at most $J$ bounded faces. Each bounded face contour reads a defining relator, with a chosen cyclic start and orientation. Conversely an exterior contour word of such a diagram is freely a product of conjugates of its bounded face words. In this statement a contour is a closed walk around a face, rather than an embedded circle: vertices and bridges may occur more than once. Every application below uses a finite number of relators even though the presentation is infinite.

For completeness, the elementary operations in this version are as follows. Draw a polygon for each relation factor and its conjugating stem, joining the stems at a base vertex in their product order. Empty factors are omitted. The exterior reads the literal product. Exterior insertion of $a a^(- 1)$ is made by attaching a spur. For a cancellation, let the two consecutive exterior traversals have vertices $v \, w \, v'$. If they traverse the same edge, erase the resulting leaf. If they are distinct and $v = v'$, their digon, or the two lobes when both edges are loops, bounds portions which can be discarded, together with these edges. The other exterior contour remains connected at $v$. The consecutiveness at $w$ ensures that no exterior attachment is lost away from that vertex. If $v eq.not v'$, draw an auxiliary edge in the exterior face between the indicated occurrences of $v$ and $v'$, so that it cuts off the two-edge portion as a triangular face. Contract the auxiliary edge. The artificial face is now a digon; delete one of its edges to merge it with the adjacent face. In that adjacent contour the replacement traversal has the same label. Thus the desired exterior cancellation has taken place without increasing the number of relation faces. This operation uses positions on contours and is valid when other vertices or contour portions repeat. Conversely, merging an exterior-adjacent bounded face across a non-bridge edge, repeatedly until a tree remains, proves the product assertion. These operations allow a prescribed literal exterior word to be constructed, after which its required break positions are marked. A marked position crossed by an intermediate cancellation need not retain its previous vertex value. All vertices of a diagram have consistent values in $Gamma_(upright("proj"))$: propagate from one vertex along paths; simple circuits bound subdiagrams, so the product assertion proves path independence.

In our presentation every face comes with an actual closed walk in $P$ reading its contour. This additional assignment matters: equal words alone will not be treated as equal paths. When two source incidences have been aligned by a deck transformation, deleting an edge between their faces splices two genuine source walks into a genuine closed source walk. This is again a permitted relator because the presentation uses all closed walks, including walks with backtracks and singular contours.

Suppose an injectivity failure exists. Choose, over #emph[all] component maps, pairs of distinct source vertices with equal image, paths between them, and diagrams for the resulting closed image word, a choice minimizing first the number $J$ of bounded faces and then the number of edges. The exterior has one adjustable side: it is this source path, with its break vertex marked. Its endpoints in $P$ must remain distinct, but may vary when comparing different failure diagrams. Minimization over all failures, rather than just one originally selected path, is essential below.

We will use the same minimization after injectivity is proved, in a second setting. Adjoin to $X$ one center $c_Q$ for every indexed copy $Q$, and one spoke of length one from $c_Q$ to each vertex of $Q$. Denote this graph by $hat(X)$. For an edge loop in $hat(X)$, started at a group vertex, each generator edge is a fixed side and each consecutive two-spoke passage through a center is an adjustable side. Inflate an adjustable side to any source path in its copy with the indicated endpoints. Mark all side breaks. If there are $m$ sides there are at most $m$ distinct marked vertices. Among diagrams and these adjustable paths minimize $\( J \, upright("number of edges") \)$ lexicographically. If the inflation is empty, retain its one marked vertex. For both minimizations, source data along adjustable sides and bounded contours are retained as part of the diagram.

#thm([Lemma 7.2.])[
  (Reduction rules).  #emph[In either minimum diagram the following statements hold.]
  + #emph[No bounded face has a freely trivial label word.]
  + #emph[No edge separating two distinct bounded faces has aligned source incidences. Nor does an edge between a bounded face and an adjustable exterior side have aligned source incidences.]
  + #emph[There is no unmarked vertex of degree one, and no bridge having both incidences on a bounded face.]
  #emph[Here alignment means that, when both incidences are read in the same direction, a left deck transformation identifies their source edges.]
] <geo:reductions>

#proof[
  A freely trivial face word can be omitted from the face product expression; the van Kampen Lemma then supplies a diagram for the identical exterior with fewer bounded faces. For the second assertion, delete the separating edge. Distinct bounded faces merge into a face whose source walk is obtained by splicing after deck alignment. A bounded face adjacent to an adjustable side can instead be absorbed into that side: replace its edge traversal by the complementary face walk with the appropriate orientation. The source endpoints are unchanged. Deleting an edge separating two faces does not disconnect the plane graph, and repeated contacts elsewhere merely make the new contour singular; they do not prevent the splice. In each case $J$ decreases.
  At an unmarked leaf the contour makes a backtrack. If it is an exterior corner it lies within an adjustable side, since a break between fixed sides would be marked. In all cases foldedness makes it an actual backtrack in the assigned source walk. Erasing the leaf preserves the assignments and contradicts edge minimality.
  Consider now a bridge with both incidences on a bounded face. Removing its open edge splits the diagram in two. The exterior contour and all its marked positions belong to one of them; retain that component. In the affected bounded face contour the other component is visited in one excursion, along the bridge, around its exterior contour, and back. The discarded component, with the bridge as a stem, gives a diagram for the word of this excursion with fewer than $J$ bounded faces: the affected face is not among them. To see the indicated exterior designation, the retained component is connected and accessible from infinity, so lies on the unbounded-contour side of the discarded component. Thus its boundary is exactly the contour traversed in that excursion, with the bridge stem.
  After injectivity, the two endpoints of the source excursion are equal because their images are equal, so the excursion can be removed. Before injectivity, if those source endpoints were distinct, this excursion and its smaller diagram would themselves constitute an injectivity failure, contrary to the global minimal choice of $J$. They therefore agree in this case as well. Delete the excursion, bridge, and discarded component. The retained affected face is still assigned a closed source walk. Its face count does not increase and its edge count decreases, a contradiction. ◻
]

Suppress every unmarked degree-two vertex. Call a resulting edge an #emph[arc]; it remembers its entire original edge path and its length. Loops among these arcs are allowed. There is at least one marked vertex, so an entire degree-two component cannot disappear without a retained vertex. Every side incidence along an arc is constant: it is a bounded face or one exterior side. Indeed a change of exterior side is marked, and a change of face incidence requires branching. Degrees and contours in what follows are those of this compressed plane graph.

#thm([Lemma 7.3.])[
  (Short arcs and Euler count).  #emph[Every arc incident with a bounded face has length less than $L_i$, when read from an endpoint in layer $i$ on that face. Its length is also less than $L_i$ on any adjustable-side incidence with which it is compared. Every bounded face has at least twenty arc incidences. If $b$ is the number of arcs and there are at most $m$ marked vertices, then 
#[#set math.equation(numbering: n => "(7.5)")
 $ b lt.eq 3 J + 3 m - 3 \, #h(2em) 20 J lt.eq 2 b \, #h(2em) b lt.eq 6 m . $ <geo:euler>]

 These statements require only $C_(*) gt.eq 10^4$ and sufficiently large $ell$.]
] <geo:arcs>

#proof[
  An arc of length greater than two is freely reduced. Otherwise an inverse pair with an unmarked bivalent midpoint can be erased, identifying its two outer vertices. Those outer vertices are distinct in the diagram: the interior of a maximal arc has no repetitions, and a loop arc of length greater than two has this property for each such pair. The two-edge path is therefore a tree, and its contraction preserves the number of faces and the plane embedding. Its outer group values agree; its bivalent middle vertex has no other incidences. On every assigned source walk foldedness identifies the inverse pair as a backtrack. The contraction therefore preserves all assignments and decreases the number of edges, which is impossible.
  If an arc has a generator-side incidence it has length one. Otherwise an arc incident with a bounded face has two source assignments. Its other incidence cannot be on the same bounded face, since an edge with the same face on both sides is a bridge, excluded by Lemma 16. If the arc were at least $L_i$ long on either compared assignment, its freely reduced word would determine its projected nonbacktracking path in $Y$. Both projections would be this same path. The two lifts of that path then differ by a single deck transformation, so their source incidences are aligned. Lemma 16 forbids that alignment. Arcs of length at most two already satisfy the claimed inequalities.
  If a face had fewer than twenty arc incidences, select its longest arc, of length $a$, and let $i$ be its initial layer in the face assignment. Its perimeter would be at most $19 a < 20 L_i = 2000 H_i \/ log_2 d$. By (7.1), every layer $j$ on it has $H_j gt.eq H_i \/ 2$ for large $ell$. The face word is not freely trivial. Cancel backtracks in its closed source walk, and then cancel around its cyclic ends. Foldedness makes these actual source cancellations; the remaining walk is nonempty and cyclically nonbacktracking. Its length is at most the displayed perimeter, while $C_(*) H_j \/ log_2 d gt.eq 5000 H_i \/ log_2 d$. This contradicts (7.2).
  Let $v$ be the number of vertices of the compressed diagram. It is connected and satisfies $b = v + J - 1$ by the plane Euler formula, also for loops, parallel edges and bridges. Every unmarked vertex has degree at least three; a graph consisting of one marked vertex and no edges also satisfies the resulting inequality. Hence $2 b gt.eq 3 \( v - m \)$, which gives the first inequality of (7.5). Each arc has two face incidences in total, counting the exterior, so the twenty-incidence bound gives its second inequality. Combining them gives $b lt.eq \( 30 \/ 7 \) \( m - 1 \) lt.eq 6 m$ whenever edges occur; the same final bound holds for the trivial diagram. ◻
]

#thm([Proposition 7.4.])[
  (Embeddings).  #emph[All component label maps $C arrow.r X$ are injective on vertices and formal edges. The indexed copies of Theorem 15 are therefore defined.]
] <geo:embeddings>

#proof[
  Apply Lemma 17 to a minimum injectivity-failure diagram, with $m = 1$. Its first two inequalities imply $20 J lt.eq 6 J$, hence $J = 0$. The uncompressed diagram is a tree, so its exterior word is freely trivial. A path with freely trivial word in a folded graph returns to its starting vertex: erase successive inverse pairs, which are actual backtracks. The chosen source endpoints consequently agree, a contradiction.
  For edges, two oriented source edges with the same formal image have the same initial image and the same oriented label. Vertex injectivity makes their initial vertices equal, and foldedness makes the edges equal. This includes the possibility of parallel edges and establishes the asserted graph embeddings. ◻
]

We henceforth use the post-injectivity minimum diagrams. One additional observation follows immediately from the indexing convention. If paths in two indexed copies have the same word and are deck-aligned, and their maps agree at one source point after alignment, their maps agree everywhere on the connected component: propagate along labeled paths. They are then the same indexed copy. Therefore an arc shared by two different copy assignments has length less than the applicable $L_i$ on either assignment.

=== 7.3 Short chain fillings and an explicit thin-triangle estimate <geo:coned>

We next prepare an ordering of the copy centers by distance from one fixed group vertex, in order to control all earlier intersections with a copy at once. Thin triangles in $hat(X)$ will give uniformly short paths that avoid the copy’s own center. The short-arc estimate will then turn such paths into intrinsic distance bounds in the copy. We first obtain thin triangles from a linear bound on decompositions of loop chains into short loops.

#thm([Lemma 7.5.])[
  (Short chain fillings).  #emph[In $hat(X)$ the integral oriented chain of any edge loop of length $n$ is a sum of at most $12 n$ oriented chains of edge loops of length at most four.]
] <geo:chain-filling>

#proof[
  For a nonempty loop, rotate its start to a group vertex and split it into the sides specified above. There are $m lt.eq n$ sides. Inflate and minimize, and apply Lemma 17. For each arc choose a standard path between the images of its endpoints: use the generator edge if it has a fixed-side incidence, and otherwise use the two-spoke passage through any one of its incident source-copy centers. Choose one direction for the arc, using the reverse standard path for its reverse incidence.
  On a bounded face, replace every incident standard path by the two-spoke passage through that face’s center. Each replacement differs by a closed chain of length at most four; a generator standard path only reduces that length. The sum of the new passages is zero as a chain, because successive spokes telescope at the consecutive contour vertices, with their contour multiplicities. On an exterior adjustable side make the same replacements using that side’s center; the resulting chain telescopes to the original two-spoke side. Exterior fixed sides already have the required standard path. The sum of the standard-path chains around the bounded faces is the exterior standard-path chain, by cancellation of the two oriented incidences of each internal edge, also when an edge is a bridge or a contour is singular. Combining these identities expresses the original loop chain as the asserted sum. At most one short loop is used for each bounded or exterior arc incidence, hence at most $2 b lt.eq 12 m lt.eq 12 n$. ◻
]

The next lemma is a quantitative form of the homological-isoperimetric criterion for hyperbolicity; compare Gersten #cite(label("Gersten1996")) Theorem 6.3. The proof below gives an explicit thin-triangle bound under our chain-filling hypothesis, without assuming local finiteness.

#thm([Lemma 7.6.])[
  (Thin triangles from short chain fillings).  #emph[Let a connected graph with unit edge lengths have the conclusion of Lemma 19. Every geodesic triangle on its vertices is $D_0$-thin, where one may take $D_0 = 10^6$. Thinness here measures distance to the vertices on the other two sides.]
] <geo:thin>

#proof[
  Fix a geodesic triangle $\[ x \, y \] \, \[ x \, w \] \, \[ y \, w \]$, and put
  $ n = d \( x \, y \) \, quad u = d \( x \, w \) \, quad v = d \( y \, w \) \, quad a = \( n + u - v \) \/ 2 \, quad b = u - a = v - \( n - a \) . $
  Let $R$ be the maximum, over its side vertices, of distance to the vertices on the other two sides. Relabel the sides so it is attained at $z in \[ x \, y \]$, at position $j = d \( x \, z \)$. We may assume $R gt.eq 100$. Then $j \, n - j gt.eq R$, and every vertex of either other side has distance at least $R$ from $z$.
  A position $h < a - R$ on $\[ x \, y \]$ is within $R$ of $\[ x \, w \]$. Indeed, if it were within $R$ of position $t$ from $y$ on $\[ y \, w \]$, then $t gt.eq n - h - R$, and the triangle inequality would give
  $ u lt.eq h + R + v - t lt.eq 2 h + 2 R + v - n \, $
  contrary to $h < a - R$. The definition of $R$ supplies closeness to at least one other side. Symmetrically positions $h > a + R$ are within $R$ of $\[ y \, w \]$. Also a position $k > a + R$ on $\[ x \, w \]$ must be within $R$ of $\[ y \, w \]$: closeness to a position $h$ on $\[ x \, y \]$ would imply $h gt.eq k - R$ and $v lt.eq u - k + R + n - h lt.eq u + n - 2 k + 2 R$, again a contradiction.
  We construct a subsegment of $\[ x \, y \]$ containing at least $R$ edges on either side of $z$, and an alternate path between its endpoints whose vertices all have distance at least $R$ from $z$, so that the resulting loop has length at most $200 R$.
  First suppose $j < a - 6 R$. Take the positions $h_(-) = max \( 0 \, j - 4 R \)$ and $h_(+) = j + 4 R$; the latter is less than $a - 2 R < n$. Bridge both to $\[ x \, w \]$ by paths of length at most $R$, taking the trivial bridge at $x$ if $h_(-) = 0$, and join their endpoints along $\[ x \, w \]$. Each nontrivial bridge starts $4 R$ from $z$, so all its vertices are at least $3 R$ from $z$. The side portion on $\[ x \, w \]$ has length at most $h_(+) - h_(-) + 2 R$, since its endpoint coordinates from $x$ differ from $h_(-)$ and $h_(+)$ by at most $R$. Thus the whole loop has length at most $20 R$. The case $j > a + 6 R$ is symmetric.
  In the remaining case $\| j - a \| lt.eq 6 R$, take
  $ h_(-) = max \( 0 \, floor.l a - 10 R floor.r \) \, #h(2em) h_(+) = min \( n \, ceil.l a + 10 R ceil.r \) . $
  Bridge the left endpoint to $\[ x \, w \]$ and the right endpoint to $\[ y \, w \]$, using paths of length at most $R$ and trivial bridges at clipped endpoints. The preceding positional rules supply every nontrivial bridge. Such a bridge starts at least $4 R$ from $z$, so it stays at least $3 R$ from $z$. Write $s_(-)$ and $t_(+)$ for the coordinates of the bridge endpoints from $x$ and $y$, respectively. They satisfy
  $ \| s_(-) - h_(-) \| lt.eq R \, quad \| t_(+) - \( n - h_(+) \) \| lt.eq R \, quad a - h_(-) lt.eq 10 R + 1 \, quad h_(+) - a lt.eq 10 R + 1 . $
  If $b lt.eq 20 R + 2$, join these endpoints through $w$. Each side portion has length at most $31 R + 3$, while $h_(+) - h_(-) lt.eq 20 R + 2$, so the entire loop has length at most $84 R + 8$. If $b > 20 R + 2$, take the vertex $A in \[ x \, w \]$ at position $k = ceil.l a + 20 R ceil.r < u$. It has a bridge of length at most $R$ to a vertex $B in \[ y \, w \]$. If $t = d \( y \, B \)$, comparison of distances to $w$ gives
  $ \| \( u - k \) - \( v - t \) \| lt.eq R \, #h(2em) \| t - \( n - a + 20 R \) \| lt.eq R + 1 . $
  We have $s_(-) lt.eq k$ and $t_(+) lt.eq t$; the intervening portions on the two sides have lengths at most $31 R + 2$ and $32 R + 2$. Including the three bridges and the original segment gives a loop of length at most $86 R + 6$. This last bridge stays far from $z$, since $d \( z \, A \) gt.eq k - j gt.eq 14 R$ and its length is at most $R$. All other vertices of the alternate path lie on the two other sides or the already controlled endpoint bridges. In all cases the selected segment extends at least $R$ on either side of $z$: when clipped, this uses $j \, n - j gt.eq R$; when not clipped it follows from the stated positions. This completes the construction with the claimed $200 R$ bound.
  Put $r_0 = floor.l R \/ 4 floor.r$. In cyclic order partition this loop into four vertex paths: $I_1$ is the segment from $j - r_0$ to $j + r_0$; $I_2$ is the remaining segment toward $h_(+)$; $I_3$ is the alternate path from $h_(+)$ to $h_(-)$; and $I_4$ is the remaining segment back to $j - r_0$. Opposite pairs have vertex-set distances
  $ d \( I_1 \, I_3 \) gt.eq R - r_0 gt.eq R \/ 3 \, #h(2em) d \( I_2 \, I_4 \) = 2 r_0 gt.eq R \/ 2 - 2 gt.eq R \/ 3 . $
  The equality uses that $I_2 \, I_4$ are subsegments of one geodesic. Set $q_0 = R \/ 3$ and define $1$-Lipschitz vertex functions
  $ f \( v' \) = min { q_0 \, d \( v' \, I_1 \) } \, #h(2em) g \( v' \) = min { q_0 \, d \( v' \, I_2 \) } . $
  On an oriented edge $\( v' \, v'' \)$ define the antisymmetric form
  $ omega \( v' \, v'' \) = frac(f \( v' \) + f \( v'' \), 2) #scale(x: 120%, y: 120%)[\(] g \( v'' \) - g \( v' \) #scale(x: 120%, y: 120%)[\)] . $
  The successive arcs have $f = 0$, $g = 0$, $f = q_0$, and $g = q_0$, respectively. Consequently the integral around the loop is exactly $q_0^2$: only $I_3$ contributes, with its $g$ values running from zero to $q_0$. On any loop of length at most four, subtract the initial value of $f$ without changing the integral, since the increments of $g$ sum to zero. The Lipschitz bounds then bound its absolute integral by $16$. The integral depends only on the oriented chain, so the assumed short chain filling gives
  $ \( R \/ 3 \)^2 lt.eq 16 dot.op 12 dot.op 200 R . $
  Thus $R lt.eq 345600 < 10^6$. No local finiteness was used: all triangles, loops and chain decompositions here are finite. Geodesics between vertices exist because nonempty sets of integer path lengths have minima. ◻
]

=== 7.4 Avoidance paths and simultaneous overlap <geo:overlap>

#thm([Lemma 7.7.])[
  (A short path avoiding one center).  #emph[Fix a positive integer $L$. For sufficiently large $ell$, uniformly in $Q$ and $i$, if a path in $hat(X)$ of length at most $L$ joins $u \, x in Q$, with $u$ in layer $i$, and avoids $c_Q$, then 
#[#set math.equation(numbering: n => "(7.6)")
 $ d_Q \( u \, x \) lt.eq 24 \( L + 1 \) L_i . $ <geo:avoidance-bound>]

 Here the threshold for $ell$ can depend on $L$, which will subsequently be an absolute constant.]
] <geo:avoidance>

#proof[
  Close the given path by a designated two-spoke side through $c_Q$, inflate, and minimize. There are at most $L + 1$ sides. We claim every arc occurrence on the designated adjustable side is shorter than its local $L_j$. For an opposite bounded-face incidence this is Lemma 17; an opposite generator incidence has length one. If the opposite incidence is on another adjustable side, that side uses a different center because the original path avoids $c_Q$. A long arc would align the two source paths and then identify the copies, as observed after Proposition 18, which is impossible.
  It remains to exclude an arc with both incidences on the designated side. Its edges are exterior bridges. In the linear order on the designated side, the interval between the two traversals of such a bridge is an excursion through the component cut off by that bridge. All its exterior positions lie within that interval; in particular it contains no side break. Its endpoint group values agree. Injectivity of $Q$ implies that its assigned source endpoints agree, so this excursion can be erased from the adjustable path. Discard the cut-off component and bridge as well. The bounded contours in the retained component are unchanged, and no exterior side break is lost. This reduces the number of faces, or keeps it fixed and decreases the number of edges, contrary to minimality.
  The designated path therefore has at most $2 b lt.eq 12 \( L + 1 \)$ short arc occurrences. For clarity their local length bounds do give a uniform total bound, without presupposing a diameter estimate. If a prefix has length $t$, its next initial layer $j$ has $H_j lt.eq H_i + t$, so the next arc has length at most $L_i + 100 t \/ log_2 d$. Induction over at most $12 \( L + 1 \)$ arcs bounds each encountered $H_j \/ H_i$ by a quantity tending to one as $ell arrow.r oo$. In particular each arc has length at most $2 L_i$ for sufficiently large $ell$. Their total is at most $24 \( L + 1 \) L_i$, proving the claim. ◻
]

#thm([Proposition 7.8.])[
  (One ball for all earlier intersections).  #emph[There is a well-order of the indexed copies for which the first three assertions of Theorem 15 hold.]
] <geo:balls>

#proof[
  Fix one group vertex $o in X$. There are countably many indexed copies: the components of the countable graph $P$ are countable in number and a map from a fixed component is specified by one group value. Enumerate them, and order the centers first by $d_(hat(X)) \( c_Q \, o \)$ and then by this enumeration. This is a well-order, since these distances and the enumeration values are nonnegative integers. Choose for each $A = c_Q$ one geodesic from $A$ to $o$, and let its first vertex after $A$ be $u in Q$. The choice of $u$ is made once for this copy.
  Suppose $x in Q$ also belongs to a distinct copy with center $B$ satisfying $d \( B \, o \) lt.eq d \( A \, o \)$. The path $A \, x \, B$ is a geodesic of length two, since distinct centers have no direct edge. A geodesic from $B$ to $o$ avoids $A$: otherwise its length is at least $2 + d \( A \, o \) > d \( B \, o \)$. Let $k = d \( A \, o \)$. If $k < D_0 + 3$, the path from $x$ through $B$ and $o$ to $u$, using the chosen two geodesics, avoids $A$ and has length at most $1 + k + \( k - 1 \) = 2 k$. If $k gt.eq D_0 + 3$, take the vertex $p$ at position $t = D_0 + 3$ on the chosen $A \, o$ geodesic. Every vertex of $\[ A \, B \]$ is at distance greater than $D_0$ from $p$, since its distance from $A$ is at most two. By Lemma 20, $p$ has a bridge of length at most $D_0$ to a vertex $q$ of the chosen $B \, o$ geodesic. This bridge avoids $A$ because $d \( p \, A \) > D_0$. Furthermore
  $ d \( B \, q \) = d \( B \, o \) - d \( q \, o \) lt.eq k - \( k - t - D_0 \) = t + D_0 . $
  The path $x$ to $B$, along $\[ B \, q \]$, across this bridge to $p$, and back along $\[ p \, u \]$ therefore avoids $A$ and has length at most $2 t + 2 D_0$. Both cases are bounded by the absolute constant
  #[#set math.equation(numbering: n => "(7.7)")
   $ L^(*) = 2 + 2 \( D_0 + 3 \) + 2 D_0 = 4 D_0 + 8 . $ <geo:root-path-length>]
  Let $i$ be the layer of the fixed $u$, and define
  $ R_Q = ⌈25 \( L^(*) + 1 \) L_i⌉ \, #h(2em) B \( Q \) = { v in Q : d_Q \( u \, v \) lt.eq R_Q } \, $
  with the induced edges. Lemma 21 puts every intersection with an earlier copy into this one ball. The root $o$, chosen geodesic, and ball center $u$ have not been changed as the earlier copy varies.
  The short chain and thin-triangle arguments needed only $C_(*) gt.eq 10^4$, so $D_0$ and $L^(*)$ have already been fixed independently of any further increase in $C_(*)$. We now fix, for example,
  #[#set math.equation(numbering: n => "(7.8)")
   $ C_(*) = 10^7 \( L^(*) + 1 \) \, #h(2em) C_bullet = 2 dot.op 10^4 \( L^(*) + 1 \) . $ <geo:constants>]
  There is consequently no circular choice of constants. Increase $ell$ to meet all the fixed-constant comparisons made above and below.
  An induced ball of radius $R_Q$ with a cycle has a circuit of length at most $2 R_Q + 1$: take a shortest-path spanning tree from $u$ in the ball and any edge not in that tree. Such a tree exists by choosing a predecessor at distance one less for each non-root vertex. Likewise, if a vertex outside the ball has two edge incidences into it, those incidences and the tree path between their endpoints give a circuit of length at most $2 R_Q + 2$, including the parallel-edge case. All starting layers involved differ from $i$ by at most $R_Q + 1$, so have $H_j gt.eq H_i \/ 2$ for large $ell$. Since $R_Q lt.eq 2500 \( L^(*) + 1 \) H_i \/ log_2 d + 1$, either circuit would violate (7.2) with (7.8). Thus the ball is a tree, and every outside vertex has at most one edge incidence to it. The graph of edges meeting the ball is precisely this tree with possible leaves attached, and is a forest.
  Finally, its number of vertices is bounded by
  $ \| V \( B \( Q \) \) \| lt.eq \( 1 + 6 D \)^(R_Q + 1) . $
  For large $ell$, $log_2 \( 1 + 6 D \) lt.eq 3 log_2 d$, so the logarithm of this bound is at most $7500 \( L^(*) + 1 \) H_i + 6 log_2 d lt.eq 8000 \( L^(*) + 1 \) H_i$. For every layer $j$ represented in the ball, $H_j gt.eq H_i \/ 2$. Our choice of $C_bullet$ therefore gives $\| V \( B \( Q \) \) \| lt.eq 2^(C_bullet H_j)$, as required at every vertex in the ball. ◻
]

=== 7.5 Cycle coordinates, the residual forest, and copy incidences <geo:cycles>

Because all earlier intersections with a copy lie in one tree, a nonzero cycle in the latest participating copy cannot be canceled by earlier copy cycles. The resulting cycle decomposition will control the unused edges and later supply the acyclic complex used to exclude torsion.

#thm([Proposition 7.9.])[
  (Direct cycle coordinates).  #emph[For every field $k$, inclusion of the indexed copies induces an isomorphism of vector spaces 
#[#set math.equation(numbering: n => "(7.9)")
 $ xor.big_Q Z_1 \( Q \; k \) med arrow.r med Z_1 \( X \; k \) \, #h(2em) \( c_Q \)_Q mapsto sum_Q c_Q . $ <geo:cycle-decomposition>]

 The direct sum is algebraic, so every tuple used has finite support.]
] <geo:cycle-directness>

#proof[
  A finite-support cycle in any graph is a linear combination of finitely many circuit chains: choose a spanning forest of its finite support graph, and subtract for each edge outside that forest the corresponding circuit with its given coefficient. The remainder is a cycle supported on a finite forest, and hence is zero by removing leaves. This proof works over every field and with loop and parallel edges.
  A closed walk in $X$ reads a word trivial in $Gamma_(upright("proj"))$. By the presentation and the van Kampen Lemma it bounds a finite diagram whose faces are assigned closed source walks in $P$. The propagated group values give each such source component its label map into $X$, and therefore its indexed copy. As oriented edge chains, the exterior is the sum of the bounded face contours. Reduction modulo $"char" k$ or multiplication by the circuit coefficients proves that every element of $Z_1 \( X \; k \)$ is a finite sum of copy cycles. This proves surjectivity.
  For injectivity take a finite relation $sum_Q c_Q = 0$ and the latest copy $Q$ with $c_Q eq.not 0$. If an edge has nonzero coefficient in $c_Q$, it has to occur in an earlier coordinate as well. Its endpoints then belong to an earlier copy, and hence both belong to $B \( Q \)$. Thus $c_Q$ is a cycle supported on the tree $B \( Q \)$, which forces $c_Q = 0$. This contradiction proves directness. No claim about independence of infinite sums has been used. ◻
]

#thm([Proposition 7.10.])[
  (Assigned domains and the remaining forest).  #emph[Put 
$ D_Q = V \( Q \) \\ union.big_(R < Q) V \( R \) \, #h(2em) E_(upright("int")) = union.big_Q { e in E \( Q \) : upright(" both endpoints of ") e upright(" lie in ") D_Q } . $

 The $D_Q$ are pairwise disjoint, $V \( Q \) \\ D_Q subset.eq V \( B \( Q \) \)$, and the formal graph $\( V \( X \) \, E \( X \) \\ E_(upright("int")) \)$ is a forest. Each edge in $E_(upright("int"))$ belongs to the displayed set for exactly one $Q$.]
] <geo:forest>

#proof[
  If $R < Q$, a vertex of $R$ cannot belong to $D_Q$; this proves disjointness. The containment follows from Proposition 22. Disjointness also ensures that an edge cannot be internal to two assigned domains.
  If the remaining graph contained a circuit, its edge chain over $bb(F)_2$ would be a nonzero cycle $c$. Use Proposition 23 to write $c = sum_Q c_Q$ with finitely many nonzero coordinates, and take their latest copy $Q$. An edge of $c_Q$ whose endpoints are both outside $B \( Q \)$ cannot occur in an earlier coordinate, since that would put its endpoints into the earlier overlap. If its coefficient were nonzero it would therefore have nonzero coefficient in $c$. But both its endpoints lie in $D_Q$, so it was deleted, contrary to the support of $c$. Consequently $c_Q$ is supported on edges with at least one endpoint in $B \( Q \)$. These edges form a forest by Proposition 22, forcing $c_Q = 0$, a contradiction. ◻
]

#thm([Proposition 7.11.])[
  (The exact incidence count).  #emph[Let 
$ cal(I) = { \( Q \, x \) : Q upright(" an indexed copy") \, med x in V \( Q \) } . $

 There is a canonical bijection 
#[#set math.equation(numbering: n => "(7.10)")
 $ cal(I) arrow.r Gamma_(upright("proj")) times V \( Y \) \, #h(2em) \( Q \, x \) mapsto \( x \, "type"_Q \( x \) \) \, $ <geo:incidence-bijection>]

 where the type is the base vertex under the unique source vertex of the embedding. It intertwines left translation of $Gamma_(upright("proj"))$ with left translation of the first coordinate, with the base type fixed. In particular, for a fixed $x in Gamma_(upright("proj"))$ and $v in V \( Y \)$ there is exactly one incidence at $x$ of type $v$, even when $P$ is disconnected.]
] <geo:incidences>

#proof[
  Embedding makes the source vertex of $x$ unique within a representative $\( C \, phi.alt \)$; deck alignment preserves its base vertex, so the type is well-defined. For given $\( x \, v \)$ choose the lift $\( v \, 1_F \)$ and its component $C$, and choose the unique label map from $C$ sending that lift to $x$. This constructs an incidence. Conversely a representative of any such incidence has its source vertex equal to $\( v \, f \)$ for some $f in F$. Apply $delta_(f^(- 1))$ and change the map by precomposition with $delta_f$. This is the equivalence defining indexed copies and brings that source vertex to $\( v \, 1_F \)$. Its component is now $C$, and its map is the unique one just constructed. This proves uniqueness. Left translation changes $x$ and not the source data, giving equivariance. ◻
]

The next two estimates control different costs of removing overlaps. The first sums over one trimming ball, allowing repeated lifts of a base vertex. The second sums the losses from all copies at one fixed Cayley vertex, retaining the size of each trimming ball. If nonnegative numbers $a_v$ are assigned to base vertices and $a_Q \( x \) = a_("type"_Q \( x \))$, put

$ cal(S)_a = sum_(i in bb(Z)) frak(w)_i sum_(v upright(" in layer ") i) a_v . $

Then, whenever this sum is finite,

#[#set math.equation(numbering: n => "(7.11)")
 $ sum_(x in B \( Q \)) a_Q \( x \) & lt.eq cal(S)_a \,\
sum_(Q : thin x in V \( Q \) \\ D_Q) \| V \( B \( Q \) \) \| a_Q \( x \) & lt.eq cal(S)_a #h(2em) \( x in Gamma_(upright("proj")) \) . $ <geo:ball-weighted-sum>]

For the first inequality, a base vertex in layer $i$ occurs among the lifts in $B \( Q \)$ at most $\| V \( B \( Q \) \) \| lt.eq frak(w)_i$ times. For the second, every incidence being summed has $x in B \( Q \)$, so its ball size is at most the weight of its type’s layer; the types occur at most once by Proposition 25. In particular the equivariant incidence Hilbert space is canonically

$ xor.big_Q ell^2 \( V \( Q \) \) ⊗ bb(C)^N tilde.equiv ell^2 \( Gamma_(upright("proj")) \) ⊗ ell^2 \( V \( Y \) \) ⊗ bb(C)^N . $

For a deck-equivariant family of transported projections with base diagonal matrix sums $a_v$, its direct sum has unnormalized identity diagonal sum $sum_v a_v$. This is a statement about all indexed copies; the well-order and assigned domains need not be equivariant.

=== 7.6 Cone homology and exclusion of torsion <geo:torsion-subsection>

#thm([Lemma 7.12.])[
  (Stabilizers of indexed copies).  #emph[The stabilizer in $Gamma_(upright("proj"))$ of an indexed copy embeds into the subgroup of $F$ preserving any representative source component. In particular that stabilizer has no nonidentity finite-order element.]
] <geo:stabilizers>

#proof[
  Fix a representative $\( C \, phi.alt \)$. If $h$ stabilizes the indexed copy, its definition means that there is a deck transformation $delta_a$ preserving $C$ such that
  $ h phi.alt = phi.alt delta_a quad upright("on ") C . $
  It is unique because $phi.alt$ is injective and the deck action is free on vertices. If $h_1 \, h_2$ correspond to $a_1 \, a_2$, the displayed equality gives $\( h_1 h_2 \) phi.alt = phi.alt delta_(a_1 a_2)$, so the correspondence is a homomorphism. If $a = 1_F$ it implies that $h$ fixes a group vertex, so $h = 1_(Gamma_(upright("proj")))$. Hence it is injective. Torsion-freeness follows from that of $F$. This argument does not assert that the full stabilizer is trivial and does not require a component of $P$ to be the entire cover. ◻
]

Let $Z$ be the two-dimensional cellular complex obtained by attaching the graph cone on each indexed copy to $X$. Its one-skeleton is $hat(X)$. For each positive edge $e : s \( e \) arrow.r t \( e \)$ in $Q$, attach one triangular cell $tau_(Q \, e)$ with boundary

#[#set math.equation(numbering: n => "(7.12)")
 $ partial tau_(Q \, e) = e + sigma_(Q \, s \( e \)) - sigma_(Q \, t \( e \)) \, $ <geo:cone-boundary>]

where $sigma_(Q \, x)$ is the oriented spoke from $c_Q$ to $x$. Edges belonging to different indexed copies give distinct triangular cells, even when their base edge in $X$ is the same. This is a cellular attachment, so repeated incidences would be allowed; the embeddings already proved in fact exclude loops in individual copies in this construction.

#thm([Lemma 7.13.])[
  (Acyclicity of the cone complex).  #emph[For every field $k$, the augmented cellular chain complex 
#[#set math.equation(numbering: n => "(7.13)")
 $ 0 arrow.r C_2 \( Z \; k \) arrow.r^(partial_2) C_1 \( Z \; k \) arrow.r^(partial_1) C_0 \( Z \; k \) arrow.r^epsilon k arrow.r 0 $ <geo:acyclic-complex>]

 is exact.]
] <geo:acyclic>

#proof[
  The graph $X$ is connected and each cone is attached to it, so exactness at $C_0$ and $k$ is immediate. To prove exactness at $C_1$, start with a finite chain cycle in $hat(X)$. For each center its spoke coefficients sum to zero, since its boundary coefficient is zero. Only finitely many spoke coefficients are nonzero. As its copy is connected, a finite zero-sum chain of these copy vertices is the boundary of a finite edge chain in that copy: join each supporting vertex to a fixed one by a finite path and take the corresponding linear combination. Formula (7.12) therefore allows addition of a finite combination of cone triangle boundaries to eliminate all spoke terms. The resulting cycle lies in $X$. By Proposition 23, it is a finite sum of copy cycles, and each copy cycle is the boundary of the same linear combination of its cone triangles, since its spoke terms cancel. Thus every one-cycle is a boundary.
  For injectivity at $C_2$, a finite sum of triangles determines, for each copy, the finite edge chain $c_Q$ of its triangle coefficients. Vanishing of the boundary on that copy’s spokes says exactly $partial c_Q = 0$, by (7.12). The remaining boundary in $X$ is $sum_Q c_Q$. Its vanishing, together with directness in (7.9), implies $c_Q = 0$ for every $Q$. Each triangle corresponds to a distinct oriented edge in that copy, so all triangle coefficients vanish. There are no cells in higher degrees. All these arguments concern finite-support chains, also for infinite copies and an infinite family of cones. ◻
]

#thm([Proposition 7.14.])[
  (Torsion-freeness).  #emph[The finitely generated group $Gamma_(upright("proj"))$ in (7.3) is torsion-free.]
] <geo:torsion>

#proof[
  Left translation acts cellularly on $Z$. A nontrivial finite cyclic subgroup acts freely on its cells. Indeed stabilizing an original group vertex is impossible; stabilizing a formal generator edge preserves its positive orientation and fixes its initial vertex. Stabilizing a center, a spoke, or a triangle entails stabilizing the indexed copy given by that center. Lemma 26 excludes any nonidentity finite-order element doing so. This verifies cell freeness, not merely freeness at generic points, and avoids an assumption about edge inversions.
  If $Gamma_(upright("proj"))$ had a nonidentity torsion element, one of its powers would generate a subgroup $C_p$ of prime order $p$. Over $k = bb(F)_p$, choose orientations and orbit representatives of its cells. Because the action on cells is free, every $C_j \( Z \; k \)$ is a free module over $A = k \[ C_p \]$, possibly of infinite rank. By Lemma 27, (7.13) would be a free resolution of the trivial $A$-module $k$ of length two.
  The obstruction is the standard periodic-resolution argument for finite cyclic groups; see Brown #cite(label("Brown2010")) Examples 1.3 and 2.4(e). We give it here over $k$. Writing $t$ for a generator of $C_p$ and $z = t - 1$, one has $A = k \[ z \] \/ \( z^p \)$, and $k = A \/ \( z \)$. The complex
  #[#set math.equation(numbering: n => "(7.14)")
   $ dots.h.c arrow.r^z A arrow.r^(z^(p - 1)) A arrow.r^z A arrow.r^(z^(p - 1)) A arrow.r^z A arrow.r k arrow.r 0 $ <geo:periodic-resolution>]
  is exact: in the basis $1 \, z \, dots.h \, z^(p - 1)$, the kernel of multiplication by $z$ is $\( z^(p - 1) \)$, and the kernel of multiplication by $z^(p - 1)$ is $\( z \)$. Tensoring it over $A$ with $k$ makes every differential zero, and leaves one copy of $k$ in every nonnegative degree.
  Any two free resolutions of $k$ give the same homology after this tensor operation. Here is the comparison argument, including infinite free ranks. Lift the identity of $k$ to a chain map between the resolutions: on each free basis vector in degree zero choose a preimage of its augmentation; inductively, the image already assigned to a boundary is a cycle, and exactness in the other resolution supplies its preimage. Extend linearly on the free basis. Construct a map in the opposite direction in the same way. Their composites lift the identity, and their differences from the identity are null-homotopic: first lift the degree-zero difference, whose augmentation vanishes, and then lift the difference in each next degree after subtracting the already chosen homotopy term. At each step it is a cycle by the chain-map identity. These chain homotopies persist on tensoring with $k$, proving the claimed equality of homology. Applied to the length-two resolution and (7.14), it would make its homology both zero and equal to $k$ in degrees greater than two. This contradiction rules out $C_p$, and hence all nonidentity torsion.
  Finite generation follows directly from the finiteness of $S$ in (7.3). Combining the preceding results proves Theorem 15 in full. ◻
]

== 8 The nilpotent deck group and small-trace projections <nil:section>

We construct a torsion-free nilpotent deck group that serves both parts of the argument. Its voltages must detect the short holonomy words required by the geometric construction, while its central Fourier fibers must carry nonzero projections of small weighted identity trace. We first fix the word detector, then build the group and the projection field. Section 9 chooses the actual edge voltages and matrix weights that meet the geometric and operator requirements simultaneously.

The constants $C_(*)$ and $C_bullet$ in the geometric construction are fixed throughout this section. Every constant below is independent of the layer index and, unless explicitly a function of $d$, independent of $ell$. Write $upright(e) \( v \) = exp \( 2 pi upright(i) v \)$. All discrete Hilbert spaces have counting measure. Traces on auxiliary matrix indices use their ordinary sum, without division by their number.

=== 8.1 A uniform detector for short walks <a-uniform-detector-for-short-walks>

#thm([Lemma 8.1.])[
  (Rank bound).  #emph[Let $S$ be a finite connected metric graph with positive edge lengths, total length at most $C g$, and girth greater than $g > 0$. Girth means the infimum of lengths of embedded circles, with value $+ oo$ for a tree. Put 
$ B \( C \) = max { 1 \, ceil.l 20 C ceil.r }^(thin 2) . $

 Then $b_1 \( S \) lt.eq B \( C \)$. Vertices of degree one and parallel edges are allowed.]
] <nil:rank>

#proof[
  Give $S$ its intrinsic path metric and put $a = g \/ 10$. Choose a maximal $a$-separated set $cal(P)$, which is an $a$-net. If it has at least two elements, each $p in cal(P)$ is joined to another by a shortest path of length at least $a$, so its open ball of radius $a \/ 2$ contains an interval of length $a \/ 2$. Those balls are disjoint. Therefore
  $ \| cal(P) \| a \/ 2 lt.eq "length" \( S \) lt.eq C g \, #h(2em) \| cal(P) \| lt.eq max { 1 \, ceil.l 20 C ceil.r } . $
  The second bound also covers the singleton case.
  Form an abstract graph $K$ on $cal(P)$, with one edge for each distinct pair at distance at most $3 a$, and map each edge to a chosen shortest path in $S$. This graph is connected and its map surjects on fundamental groups, using a connector for basepoints. Indeed subdivide a path of $S$ into segments of length at most $a$, choose net points within distance $a$ of their endpoints, and replace each segment by the chosen path between its two net points. Each replacement exists. The original segment, its two endpoint connectors, and its replacement form a closed path of length at most $6 a < g$. Such a path is null-homotopic: after subdivision and cancellation of backtracks, a nonempty reduced closed path in a graph contains an embedded circle no longer than itself. Thus replacement preserves homotopy relative to the connected endpoints. Applying this to paths and then loops proves the two assertions about $K$, and hence
  $ b_1 \( S \) lt.eq b_1 \( K \) lt.eq \| cal(P) \|^2 lt.eq B \( C \) . $
  ◻
]

#thm([Lemma 8.2.])[
  (Bounded pivot words and a matrix detector).  #emph[Let $W$ be a nonempty cyclically nonbacktracking closed walk in a unit-edge graph of girth greater than $g$, with length at most $C g$. There is a spanning tree of its support such that, after its edge variables are set equal to the identity, the holonomy word has a nontrivial free reduction of length at most 
$ L \( C \) = ceil.l 3 C B \( C \) ceil.r . $

 If $m > L \( C \)$, that word is not an identity on the group $U_(bb(Z))$ of upper unitriangular $m$-by-$m$ integer matrices. Every entry of any word in generic upper unitriangular matrices and their inverses is a polynomial of total degree at most $m - 1$ in their upper entries. Nonidentity is preserved if each edge variable is multiplied on either side by a fixed upper unitriangular matrix.]
] <nil:word>

#proof[
  Let $S$ be the support and $b = b_1 \( S \)$. A degree-one vertex would force a backtrack, including at the cyclic join, so $S$ has minimum degree at least two and $b gt.eq 1$. If all degrees are two, regard the circle as one arc with a chosen endpoint. Otherwise suppress degree-two vertices. Euler’s formula and minimum degree three give at most $2 b - 2$ vertices and $3 b - 3$ edges. In either case there are at most $3 b$ arcs.
  Arcs shorter than $g \/ \( 3 b \)$ form a forest, since a circuit made of them would have length less than $g$. Extend this forest to a spanning tree of the suppressed graph. From each complementary arc delete one original edge, called its pivot. The remaining original graph is a spanning tree $T$. Cyclically start $W$ at a retained vertex. Nonbacktracking forces it to traverse each arc it enters completely. Every pivot crossing belongs to a distinct traversal of an arc of length at least $g \/ \( 3 b \)$. There are consequently at most $3 b C lt.eq L \( C \)$ pivot crossings, by Lemma 29. Collapsing $T$ is a homotopy equivalence to a bouquet of circles. Its image word is nontrivial since a nonempty cyclically reduced path in a graph is not null-homotopic. Free reduction cannot increase the length.
  For the matrix assertion we use a finite matrix truncation of the Magnus power-series expansion #cite(label("Magnus1935")). Write a nontrivial reduced word in maximal syllables:
  $ w = x_(j_1)^(a_1) dots.h.c x_(j_k)^(a_k) \, #h(2em) a_s in bb(Z) \\ { 0 } \, quad j_s eq.not j_(s + 1) . $
  In formal noncommutative power series set $x_j = 1 + Z_j$, using $\( 1 + Z \)^a = sum_(h gt.eq 0) binom(a, h) Z^h$ also for negative $a$. The coefficient of $Z_(j_1) dots.h.c Z_(j_k)$ is $product_s a_s eq.not 0$. A contributing syllable supplies at most one letter, since the target has no equal adjacent letters; thus all $k$ syllables must supply exactly one. For $m > k$, put
  $ Z_j = sum_({ s : j_s = j }) E_(s \, s + 1) in M_m \( bb(Z) \) . $
  The $\( 1 \, k + 1 \)$ entry detects exactly that monomial. It follows that $w \( 1 + Z_j \) eq.not 1$. Here $k lt.eq "length" \( w \) < m$.
  The inverse of $1 + X$, for strictly upper triangular $X$, is $sum_(h = 0)^(m - 1) \( - X \)^h$. Every contributing product in any matrix entry follows strictly increasing matrix indices, and hence uses at most $m - 1$ upper-entry variables regardless of word length. This proves the degree bound. Multiplication by a fixed unitriangular matrix is a polynomial coordinate bijection with polynomial inverse. Separate such changes in the edge variables preserve a nonzero polynomial. ◻
]

Fix once and for all $m gt.eq 2$ with

#[#set math.equation(numbering: n => "(8.1)")
 $ m > L \( 201 C_(*) \) . $ <nil:choice-m>]

Indeed a walk based in layer $i$ of length at most $C_(*) H_i \/ log_2 d$ stays in layers $j$ with $H_j gt.eq H_i - C_(*) H_i \/ log_2 d$. For sufficiently large $ell$, the tower girth property therefore makes every circuit in its support longer than $H_i \/ \( 201 log_2 d \)$. Lemma 30, with this $g$ and $C = 201 C_(*)$, applies. Lemma 29 can later be applied with any other fixed $C$, without changing $m$.

=== 8.2 An integer affine group and its central product <an-integer-affine-group-and-its-central-product>

The short-word test only requires a quotient onto $U_(bb(Z))$, so we can add coordinates without losing that detector. The affine extension below is chosen for a second purpose: it admits a twisted representation in which Schwartz coefficient functions correspond to Schwartz integral kernels. A rank-one kernel then gives a continuous convolution projection, which we will sample on integer coordinates.

Let $frak(n)$ be the strictly upper triangular real $m$-by-$m$ matrices, let $n_(upright(f)) = m \( m - 1 \) \/ 2$, and let $U = 1 + frak(n)$. Write $x_(i j)$ for the coordinates on $frak(n)$ and $lambda_(i j)$ for their dual coordinates. For $b in U$, put

$ A_b \( x \) = b \( 1 + x \) - 1 = \( b - 1 \) + b x \, #h(2em) L_b \( x \) = b x . $

The maps $A_b$ form an affine action: $A_b A_(b') = A_(b b')$. Let $E$ be the semidirect product of additive affine functions on $frak(n)$ by $U$, acting by $f mapsto f compose A_(b^(- 1))$. Use coordinates $\( lambda \, b \, z \)$, with affine function $x mapsto z + lambda \( x \)$. Explicitly,

#[#set math.equation(numbering: n => "(8.2)")
 $ \( lambda \, b \, z \) \( mu \, b' \, w \) & = #scale(x: 120%, y: 120%)[\(] lambda + mu compose L_(b^(- 1)) \, b b' \, z + w + mu \( b^(- 1) - 1 \) #scale(x: 120%, y: 120%)[\)] \,\
\( lambda \, b \, z \)^(- 1) & = #scale(x: 120%, y: 120%)[\(] - lambda compose L_b \, b^(- 1) \, - z - lambda \( b - 1 \) #scale(x: 120%, y: 120%)[\)] . $ <nil:affine-law>]

Constants $\( 0 \, 1 \, z \)$ are central. Their quotient $macron(E)$ has coordinates $gamma = \( lambda \, b \)$ and section $sigma \( gamma \) = \( lambda \, b \, 0 \)$. For $eta = \( mu \, b' \)$, put

$ gamma eta = \( lambda + mu compose L_(b^(- 1)) \, b b' \) \, #h(2em) c \( gamma \, eta \) = mu \( b^(- 1) - 1 \) . $

Then

#[#set math.equation(numbering: n => "(8.3)")
 $ sigma \( gamma \) sigma \( eta \) = \( 0 \, 1 \, c \( gamma \, eta \) \) sigma \( gamma eta \) \, $ <nil:cocycle>]

and associativity gives

$ c \( gamma \, eta \) + c \( gamma eta \, zeta \) = c \( eta \, zeta \) + c \( gamma \, eta zeta \) . $

The cocycle is normalized at the identity, and $c \( gamma \, gamma^(- 1) \) = c \( gamma^(- 1) \, gamma \)$.

#thm([Lemma 8.3.])[
  (Grading, Haar measure, and integer coordinates).  #emph[The laws above are polynomial with integer coefficients in $\( lambda \, b - 1 \, z \)$. Give the coordinates weights 
$ "wt" \( b - 1 \)_(i j) = j - i \, quad "wt" lambda_(i j) = m - \( j - i \) \, quad "wt" z = m . $

 Scaling weight $a$ by $y^a$ defines an automorphism $Delta_y$, for $y > 0$, and $c \( Delta_y gamma \, Delta_y eta \) = y^m c \( gamma \, eta \)$. Lebesgue coordinate measure is both left and right Haar measure on $E$ and $macron(E)$; inversion preserves it. The Jacobian of $Delta_y$ on $macron(E)$ is $y^(m n_(upright(f)))$. The integer coordinate sets $E_(bb(Z))$ and $macron(E)_(bb(Z))$ are countable nilpotent torsion-free groups.]
] <nil:grading>

#proof[
  The finite geometric series for $b^(- 1)$ proves polynomiality and integrality in Equations (8.2) and (8.2). The usual superdiagonal dilation is an automorphism of $U$. On affine functions use $f \( x \) mapsto y^m f \( Delta_(y^(- 1)) x \)$. The identity $Delta_y A_b = A_(Delta_y b) Delta_y$ shows that these maps intertwine the actions, giving the stated automorphism and cocycle homogeneity. Each paired quotient coordinate $\( lambda_(i j) \, \( b - 1 \)_(i j) \)$ has total weight $m$, proving the dilation Jacobian.
  Order the entries of $b - 1$ by superdiagonal. Left and right multiplication on $U$ are triangular coordinate transformations with diagonal entries one, and thus determinant one. The map $L_b$ on $frak(n)$ has determinant one: on each column it uses a unitriangular initial submatrix of $b$. For a fixed left factor in Equation (8.2), the $mu$-coordinates are transformed by $L_(b^(- 1))^(*)$, the $b'$-coordinates by left multiplication, and the $w$-coordinate has coefficient one. Cross terms do not alter the determinant. For a fixed right factor, the $lambda \, z$ coordinates are translated by functions of $b$, and $b$ is right multiplied. This gives determinant one in both cases, also on omitting $z$. Inversion exchanges these equally normalized left and right Haar measures, or has absolute Jacobian one by the same triangular calculation.
  In a coordinate of weight $a$, multiplication is additive plus a polynomial in smaller-weight coordinates. Each correction monomial uses both factors, by homogeneity and the identity laws. The subgroups whose coordinates of weight less than $a$ vanish form a filtration $E_(gt.eq a)$ with $\[ E \, E_(gt.eq a) \] subset E_(gt.eq a + 1)$. Indeed multiplication modulo weight $a + 1$ by an element of $E_(gt.eq a)$ is simply addition of its weight-$a$ coordinates, so is central there. All weights are at most $m$, proving nilpotence, also in the quotient and the integer groups. A positive power of an element with first nonzero weight $a$ multiplies its weight-$a$ vector by that positive integer. It cannot become zero. This proves torsion-freeness. ◻
]

Take copies $X_(upright(f)) \, Y_(upright(f))$ of $E_(bb(Z))$; these are factor names, unrelated to the graphs. Define

#[#set math.equation(numbering: n => "(8.4)")
 $ F = \( E_(bb(Z)) times E_(bb(Z)) \) \/ { \( \( 0 \, 1 \, k \) \, \( 0 \, 1 \, - k \) \) : k in bb(Z) } . $ <nil:deck>]

Equivalently its coordinates are $\( gamma_X \, gamma_Y \, z \) in macron(E)_(bb(Z))^2 times bb(Z)$, with law

$ \( gamma_X \, gamma_Y \, z \) \( eta_X \, eta_Y \, w \) = \( gamma_X eta_X \, gamma_Y eta_Y \, z + w + c \( gamma_X \, eta_X \) + c \( gamma_Y \, eta_Y \) \) . $

The coordinate map from the product sums its two central integers and has precisely the kernel in Equation (8.4). The opposite-pair subgroup is primitive in $bb(Z)^2$, so the surviving coordinate is an integer coordinate with no finite quotient. The inherited grading and first-nonzero-weight proof show directly that $F$ is countable, nilpotent, and torsion-free. Projection to the upper unitriangular coordinate of either factor is a surjective group homomorphism to $U_(bb(Z))$. Write $z_0 = \( 1 \, 1 \, 1 \)$ for the common central generator and $sigma_X \, sigma_Y$ for the two section maps into $F$.

=== 8.3 Central Fourier transform and equivariant trace <central-fourier-transform-and-equivariant-trace>

Use right translations $\( rho \( g \) xi \) \( f \) = xi \( f g \)$. The inversion unitary $\( cal(I) xi \) \( f \) = xi \( f^(- 1) \)$ satisfies $cal(I) rho \( g \) cal(I) = lambda_F \( g \)$. After inversion, Fourier transform the central coordinate by $delta_j mapsto \( t mapsto upright(e) \( t j \) \)$, with probability Lebesgue measure on $bb(T) = bb(R) \/ bb(Z)$. This identifies

#[#set math.equation(numbering: n => "(8.5)")
 $ ell^2 \( F \) tilde.equiv L^2 #scale(x: 120%, y: 120%)[\(] bb(T) \; ell^2 \( macron(E)_(bb(Z)) \) ⊗ ell^2 \( macron(E)_(bb(Z)) \) #scale(x: 120%, y: 120%)[\)] . $ <nil:fourier>]

The central generator acts by $upright(e) \( t \)$. In either factor, the section acts by

#[#set math.equation(numbering: n => "(8.6)")
 $ u_t \( gamma \) delta_eta = upright(e) \( t c \( gamma \, eta \) \) delta_(gamma eta) . $ <nil:twisted-left>]

Thus

$ u_t \( gamma \) u_t \( eta \) = upright(e) \( t c \( gamma \, eta \) \) u_t \( gamma eta \) \, quad u_t \( gamma \)^(*) = upright(e) \( - t c \( gamma^(- 1) \, gamma \) \) u_t \( gamma^(- 1) \) . $

The two factor representations commute; the full quotient cocycle is their sum. There are commuting right operators

#[#set math.equation(numbering: n => "(8.7)")
 $ v_t \( k \) delta_eta = upright(e) \( t c \( eta \, k \) \) delta_(eta k) . $ <nil:twisted-right>]

The cocycle identity proves that these commute with $u_t$. Under the Fourier transform of the central coordinate on the already inverted copy of $ell^2 \( F \)$, these are the images of right multiplication by $sigma \( k \)$ on basis indices, namely $rho \( sigma \( k \)^(- 1) \)$. They permute quotient basis vectors up to unit phases. Equivariance below means intertwining these right actions, with the identity action on auxiliary indices. Untwisted left or right regular equivariance obeys the same arguments.

#thm([Lemma 8.4.])[
  (Equivariant trace and size).  #emph[Let $L$ be a countable group with a right action as above and let $I \, J$ be finite or countable auxiliary sets. On $cal(H)_I = ell^2 \( L \) ⊗ ell^2 \( I \)$, define, for equivariant positive bounded $B$, 
$ "Tr"_I \( B \) = sum_(i in I) chevron.l B delta_(\( 1 \, i \)) \, delta_(\( 1 \, i \)) chevron.r in \[ 0 \, oo \] . $

 For a bounded equivariant $A : cal(H)_I arrow.r cal(H)_J$, 
#[#set math.equation(numbering: n => "(8.8)")
 $ "Tr"_I \( A^(*) A \) = "Tr"_J \( A A^(*) \) . $ <nil:adjoint-square>]

 This trace is additive on positive operators, monotone, and faithful on projections, and does not depend on the chosen orthonormal basis of the auxiliary Hilbert space. Equivariantly equivalent projections have equal size. A bounded equivariant map injective on the range of a projection $P$, with image there contained in the range of $Q$, gives $"Tr" \( P \) lt.eq "Tr" \( Q \)$. These statements apply to countable orthogonal sums and to each Fourier fiber. Integrating a fiber trace gives the identity trace before Fourier transformation.]
] <nil:trace>

#proof[
  For a matrix entry of $A$, translation on the right by $g^(- 1)$ gives
  $ \| A \( \( g \, j \) \, \( 1 \, i \) \) \| = \| A \( \( 1 \, j \) \, \( g^(- 1) \, i \) \) \| . $
  The phases have absolute value one and the auxiliary indices are fixed. Tonelli’s Theorem for countable nonnegative sums gives
  $ "Tr"_I \( A^(*) A \) & = sum_(i \, j \, g) \| A \( \( g \, j \) \, \( 1 \, i \) \) \|^2\
 & = sum_(j \, i \, g) \| A \( \( 1 \, j \) \, \( g^(- 1) \, i \) \) \|^2 = "Tr"_J \( A A^(*) \) \, $
  including when the sums are infinite. Additivity and monotonicity follow from positive diagonals. Changing the auxiliary orthonormal basis is conjugation by an equivariant unitary $U$. Applying the adjoint-square identity to $U B^(1 \/ 2)$ gives $"Tr" \( U B U^(*) \) = "Tr" \( B \)$, proving basis independence. If a projection $P$ has zero trace, then $parallel P delta_(\( 1 \, i \)) parallel^2 = 0$ for each $i$. Right translates span the Hilbert space, so $P = 0$.
  The polar partial isometry of an equivariant bounded $A$ is equivariant: it is the strong limit of $A \( \| A \| + 1 \/ n \)^(- 1)$. Its initial and final projections are those of $\( ker A \)^perp$ and $overline("ran" A)$. Apply Equation (8.8) to it. This proves projection equivalence and, on applying it to $A P$, the comparison, because its initial projection is $P$ and its final projection is at most $Q$. Countable orthogonal sums are handled by summing identity diagonals.
  A vector at central coordinate zero becomes a constant vector field in Equation (8.5). Its diagonal is the integral of its fiber diagonal. Sum nonnegative diagonals and use Tonelli for the integrated assertion, including countably many auxiliary indices. ◻
]

A measurable uniformly bounded field on a separable Hilbert space defines a bounded operator on its circle $L^2$ space with norm the essential supremum of the fiber norms. Integration proves the upper inequality; for the lower one, use a countable dense set of unit vectors restricted to measurable circle sets where their images exceed a given norm. Products and adjoints act pointwise. Uniform polynomial approximation gives pointwise continuous functional calculus for uniformly bounded self-adjoint fields. Thus a fixed separating continuous function or resolvent contour gives the same projection before and after decomposition.

=== 8.4 A Schwartz convolution projection <a-schwartz-convolution-projection>

Schwartz matrix coefficients and rank-one operators for Heisenberg representations are treated by Rieffel #cite(label("Rieffel1988")) Lemma 2.3, Corollary 2.4, and Theorem 2.18. Here we derive the coefficient-to-kernel correspondence for the affine group above, whose quotient $macron(E)$ is generally nonabelian.

Equip $macron(E)$ with the Haar measure of Lemma 31. Schwartz functions refer to its Euclidean coordinates $\( lambda \, b - 1 \)$, or to the specified product coordinates. For $epsilon.alt in { 1 \, - 1 }$, define

$ \( J *_epsilon.alt K \) \( h \) & = integral_(macron(E)) J \( a \) K \( a^(- 1) h \) upright(e) #scale(x: 120%, y: 120%)[\(] epsilon.alt c \( a \, a^(- 1) h \) #scale(x: 120%, y: 120%)[\)] thin d a \,\
J^(*_epsilon.alt) \( h \) & = overline(J \( h^(- 1) \)) upright(e) #scale(x: 120%, y: 120%)[\(] - epsilon.alt c \( h^(- 1) \, h \) #scale(x: 120%, y: 120%)[\)] . $

The cocycle identity gives associativity and the involution identities. The following kernel realization verifies the operations and gives the idempotents we need.

#thm([Lemma 8.5.])[
  (Schwartz idempotents).  #emph[For each sign $epsilon.alt$, there is a Schwartz function $J_epsilon.alt$ on $macron(E)$ with 
$ J_epsilon.alt^(*_epsilon.alt) = J_epsilon.alt \, #h(2em) J_epsilon.alt *_epsilon.alt J_epsilon.alt = J_epsilon.alt \, #h(2em) parallel J_epsilon.alt parallel_(L^2 \( macron(E) \)) = 1 . $

]
] <nil:schwartz>

#proof[
  For $gamma = \( lambda \, b \)$, define on $L^2 \( frak(n) \)$
  $ \( pi_epsilon.alt \( gamma \) phi.alt \) \( x \) = upright(e) \( epsilon.alt lambda \( x \) \) phi.alt \( A_(b^(- 1)) x \) . $
  The Jacobian of $A_b$ is one, so these operators are unitary. Direct substitution in Equation (8.2) gives
  $ pi_epsilon.alt \( gamma \) pi_epsilon.alt \( eta \) = upright(e) \( epsilon.alt c \( gamma \, eta \) \) pi_epsilon.alt \( gamma eta \) . $
  For a Schwartz $J$, its integrated operator is bounded by $parallel J parallel_1$. Denote partial Fourier transform with positive sign by
  $ hat(J)_(+) \( xi \, b \) = integral_(frak(n)^(*)) J \( lambda \, b \) upright(e) \( lambda \( xi \) \) thin d lambda . $
  Changing variables
  $ y = b^(- 1) \( 1 + x \) - 1 \, #h(2em) b = \( 1 + x \) \( 1 + y \)^(- 1) $
  in that integrated operator gives its kernel
  #[#set math.equation(numbering: n => "(8.9)")
   $ cal(K)_J \( x \, y \) = hat(J)_(+) #scale(x: 120%, y: 120%)[\(] epsilon.alt x \, \( 1 + x \) \( 1 + y \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <nil:kernel>]
  For fixed $x$, the change from $b - 1$ to $y$ has absolute Jacobian one: it is inversion followed by multiplication in $U$, in its Lebesgue Haar coordinates.
  Partial Fourier transform is a bijection on Schwartz spaces and an $L^2$-isometry in the displayed normalization #cite(label("Folland1999")) Chapter 8. The coordinate map
  $ \( x \, y \) mapsto #scale(x: 120%, y: 120%)[\(] epsilon.alt x \, \( 1 + x \) \( 1 + y \)^(- 1) - 1 #scale(x: 120%, y: 120%)[\)] $
  and its inverse are polynomial. Pullback by such a map preserves Schwartz functions bijectively: derivatives introduce polynomial factors, and its polynomial inverse bounds any polynomial weight in the source by a polynomial weight in the target. Its absolute Jacobian is one as just shown. Consequently $J mapsto cal(K)_J$ is a bijection from Schwartz coefficients to Schwartz kernels and an $L^2$-isometry. It is also injective as an operator realization. If a continuous Schwartz kernel gives the zero operator, its pairings against all products of compactly supported smooth test functions vanish, and approximations to point masses show the kernel vanishes.
  Twisted convolution and involution preserve Schwartz coefficients. Indeed
  $ \( a \, h \) mapsto J \( a \) K \( a^(- 1) h \) upright(e) #scale(x: 120%, y: 120%)[\(] epsilon.alt c \( a \, a^(- 1) h \) #scale(x: 120%, y: 120%)[\)] $
  is jointly Schwartz. The map $\( a \, h \) mapsto \( a \, a^(- 1) h \)$ is a polynomial bijection with polynomial inverse, and differentiation of the phase introduces only polynomial factors. Integration in $a$ preserves rapid decay of all derivatives in $h$. The same reasoning with inversion proves the involution assertion. Absolute integrability permits Fubini, so the integrated representations carry these operations to products and adjoints.
  Choose $phi.alt \( x \) = 2^(n_(upright(f)) \/ 4) exp \( - pi \| x \|^2 \)$, of $L^2$ norm one. The orthogonal projection onto its span has Schwartz kernel $phi.alt \( x \) overline(phi.alt \( y \))$. Let $J_epsilon.alt$ be its unique coefficient under Equation (8.9). Product and adjoint correspondence and injectivity give the two identities. The $L^2$-isometry gives
  $ parallel J_epsilon.alt parallel_2^2 = integral \| phi.alt \( x \) \|^2 \| phi.alt \( y \) \|^2 thin d x thin d y = 1 . $
  ◻
]

=== 8.5 The lattice limit in both coefficient norms <the-lattice-limit-in-both-coefficient-norms>

Put $L = macron(E)_(bb(Z))$. For real $theta$, define $C_r^(*) \( L \, theta c \)$ to be the norm closure on $ell^2 \( L \)$ of the span of the operators in Equation (8.6) with $t = theta$. For $a in ell^1 \( L \)$, the series $sum_gamma a_gamma u_theta \( gamma \)$ converges in norm with norm at most $sum_gamma \| a_gamma \|$. Its coefficient $ell^2$ norm equals its norm on $delta_1$, because $c \( gamma \, 1 \) = 0$. The identity diagonal is its identity coefficient and is the trace of Lemma 32. In particular $"tr"_theta \( A^(*) A \) = parallel A delta_1 parallel^2$.

The two coefficient norms have different roles in passing from the continuous idempotent to the lattice. The $ell^1$ defect controls the operator-norm correction by functional calculus. The $ell^2$ defect, compared with the sampled coefficient norm, prevents the resulting projection from being zero, while the squared $ell^2$ size bounds its identity trace. The next lemma supplies both controls.

#thm([Lemma 8.6.])[
  (Weighted rectangular Riemann sums).  #emph[For positive integer weights $w_1 \, dots.h \, w_k$, set 
$ cal(L)_y = product_(a = 1)^k y^(w_a) bb(Z) \, #h(2em) v_y = y^(w_1 + dots.h.c + w_k) \, #h(2em) 0 < y lt.eq 1 . $

 For Schwartz $f$ on $bb(R)^k$, 
$ v_y sum_(a in cal(L)_y) f \( a \) arrow.r integral_(bb(R)^k) f \( x \) thin d x . $

 The corresponding normalized sums of absolute values are uniformly bounded. For jointly Schwartz $G \( a \, h \)$ on $bb(R)^k times bb(R)^k$, and every $M$, 
#[#set math.equation(numbering: n => "(8.10)")
 $ sup_h \( 1 + \| h \| \)^M lr(|v_y sum_(a in cal(L)_y) G \( a \, h \) - integral G \( a \, h \) thin d a|) lt.eq C_(G \, M) y . $ <nil:riemann-weighted>]

]
] <nil:riemann>

#proof[
  Partition Euclidean space into cells $Q_a = a + product_j \[ 0 \, y^(w_j) \)$. They have volume $v_y$ and diameter at most $sqrt(k) y$. For $x in Q_a$, the Mean Value Theorem gives
  $ \| G \( a \, h \) - G \( x \, h \) \| lt.eq sqrt(k) y sup_(z in Q_a) \| nabla_a G \( z \, h \) \| lt.eq C_(K \, M) y \( 1 + \| a \| \)^(- K) \( 1 + \| h \| \)^(- M) . $
  On each cell $1 + \| a \|$ and $1 + \| x \|$ are uniformly comparable. For $K > k$, it follows that
  $ v_y sum_(a in cal(L)_y) \( 1 + \| a \| \)^(- K) lt.eq C integral_(bb(R)^k) \( 1 + \| x \| \)^(- K) thin d x < oo . $
  Integrating the cellwise difference and summing proves Equation (8.10). The same comparison proves the absolute-value bound and the assertion without $h$. ◻
]

#thm([Proposition 8.7.])[
  (Nonzero discrete twisted projections).  #emph[There are constants $theta_0 > 0 \, C < oo$, depending only on $m$ and the two fixed Schwartz functions, with the following properties. For $0 < \| theta \| < theta_0$, set 
$ epsilon.alt = "sign" theta \, quad y = \| theta \|^(1 \/ m) \, quad nu = y^(m n_(upright(f))) = \| theta \|^(n_(upright(f))) \, $

 and define the norm-convergent series 
#[#set math.equation(numbering: n => "(8.11)")
 $ K_theta = sum_(gamma in L) nu J_epsilon.alt \( Delta_y gamma \) u_theta \( gamma \) . $ <nil:K>]

 It is self-adjoint and satisfies, uniformly for both signs, 
#[#set math.equation(numbering: n => "(8.12)")
 $ parallel K_theta parallel_(upright("coeff") \, 1) & lt.eq C \, & parallel K_theta parallel_(upright("coeff") \, 2) & asymp sqrt(nu) \,\
parallel K_theta^2 - K_theta parallel_(upright("coeff") \, 1) & lt.eq C y \, & parallel K_theta^2 - K_theta parallel_(upright("coeff") \, 2) & lt.eq C y sqrt(nu) . $ <nil:Knorms>]

 Continuous functional calculus in $C_r^(*) \( L \, theta c \)$ gives a projection $p_theta$ with 
#[#set math.equation(numbering: n => "(8.13)")
 $ parallel p_theta - K_theta parallel lt.eq C y \, #h(2em) 0 < "tr"_theta \( p_theta \) lt.eq C \| theta \|^(n_(upright(f))) . $ <nil:projection-bounds>]

 These fields are measurable on the intervals $0 < \| theta \| < theta_0$.]
] <nil:projection>

#proof[
  In quotient coordinates, $Delta_y L$ is exactly the rectangular lattice with coordinate spacings prescribed by the weights. Its cell volume is $nu$, by Lemma 31. Lemma 34, applied to $J_epsilon.alt$ and $\| J_epsilon.alt \|^2$, proves Equation (8.12); the normalized squared sum tends to $parallel J_epsilon.alt parallel_2^2 = 1$. Self-adjointness is exact. We have
  $ J_epsilon.alt \( h \) = overline(J_epsilon.alt \( h^(- 1) \)) upright(e) \( - epsilon.alt c \( h^(- 1) \, h \) \) \, $
  $Delta_y \( gamma^(- 1) \) = \( Delta_y gamma \)^(- 1)$, and
  $ epsilon.alt c \( Delta_y gamma^(- 1) \, Delta_y gamma \) = theta c \( gamma^(- 1) \, gamma \) . $
  Together with the adjoint formula for $u_theta$, these identities prove $K_theta^(*) = K_theta$ coefficientwise.
  For output $gamma$, let $h = Delta_y gamma$. The coefficient of $K_theta^2$, divided by $nu$, is
  $ nu sum_(a in Delta_y L) J_epsilon.alt \( a \) J_epsilon.alt \( a^(- 1) h \) upright(e) #scale(x: 120%, y: 120%)[\(] epsilon.alt c \( a \, a^(- 1) h \) #scale(x: 120%, y: 120%)[\)] . $
  Its integral counterpart is $J_epsilon.alt \( h \)$. The summand is a fixed jointly Schwartz function of $\( a \, h \)$, as proved in Lemma 33. Let $D_y \( h \)$ denote the difference between this sum and $J_epsilon.alt \( h \)$. Equation (8.10) gives
  $ \| D_y \( h \) \| lt.eq C_M y \( 1 + \| h \| \)^(- M) $
  for every $M$. The defect coefficient is $nu D_y \( Delta_y gamma \)$. The uniform lattice-sum bound therefore gives
  $ nu sum_(h in Delta_y L) \| D_y \( h \) \| lt.eq C y \, #h(2em) nu^2 sum_(h in Delta_y L) \| D_y \( h \) \|^2 lt.eq C y^2 nu \, $
  which proves both estimates in Equation (8.12).
  Coefficient $ell^1$ controls operator norm, so $parallel K_theta^2 - K_theta parallel lt.eq C y$. For small $y$, the real spectrum of $K_theta$ lies in $\[ - 1 \/ 4 \, 1 \/ 4 \] union \[ 3 \/ 4 \, 5 \/ 4 \]$, by $\| lambda^2 - lambda \| lt.eq C y$ on its spectrum. Apply one fixed continuous real function equal to zero on the first interval and one on the second. It gives a self-adjoint projection $p_theta$ in the actual norm-closed twisted algebra. On these intervals the difference of this function from $lambda$ is $\( lambda^2 - lambda \) f \( lambda \)$, where respectively
  $ f \( lambda \) = \( 1 - lambda \)^(- 1) \, #h(2em) f \( lambda \) = - lambda^(- 1) . $
  Since $\| f \| lt.eq 2$, functional calculus proves the operator approximation in Equation (8.13).
  The upper part is nonempty. If $p_theta = 0$, then $parallel K_theta parallel lt.eq 1 \/ 4$, so
  $ parallel \( K_theta^2 - K_theta \) delta_1 parallel gt.eq parallel K_theta delta_1 parallel - parallel K_theta^2 delta_1 parallel gt.eq 3 / 4 parallel K_theta delta_1 parallel . $
  This contradicts Equations (8.12) and (8.12) for small $y$. On the two spectral intervals, scalar functional calculus also gives $0 lt.eq p_theta lt.eq 4 K_theta^2$. Hence
  $ "tr"_theta \( p_theta \) lt.eq 4 "tr"_theta \( K_theta^2 \) = 4 parallel K_theta delta_1 parallel^2 lt.eq C nu . $
  Strict positivity follows from Lemma 32 and the nonzero projection just established.
  Every matrix entry of every finite partial sum defining $K_theta$ is measurable in $theta$. Pointwise coefficient $ell^1$ convergence yields strong measurability on the separable Hilbert space; the common bound yields a bounded measurable field. Uniform polynomial approximation of the one chosen continuous spectral function on a common compact interval gives measurability of $p_theta$. ◻
]

#thm([Lemma 8.8.])[
  (Compact templates and relative scale changes).  #emph[The functions $J_epsilon.alt$ in Equation (8.11) may be replaced by smooth compactly supported $J_epsilon.alt^flat$ at arbitrarily small uniform coefficient $ell^1$ cost for sufficiently small $\| theta \|$. For fixed such a function, replacing $alpha > 0$ by $beta > 0$, where $\| log \( alpha \/ beta \) \| lt.eq a lt.eq 1$, changes the coefficients 
$ alpha^(n_(upright(f))) J_epsilon.alt^flat \( Delta_(alpha^(1 \/ m)) gamma \) $

 by $ell^1$ amount at most $C a$, uniformly for sufficiently small $alpha \, beta$. These coefficient bounds imply operator bounds when evaluated using any family of unitaries.]
] <nil:templates>

#proof[
  Multiply $J_epsilon.alt$ by a smooth cutoff equal to one on a large coordinate ball. Schwartz decay and the cell comparison of Lemma 34 make the normalized lattice sum of the discarded tail arbitrarily small, uniformly as the mesh goes to zero. For the second assertion set $r = alpha \/ beta$ and $h = Delta_(beta^(1 \/ m)) gamma$. After extracting $beta^(n_(upright(f)))$, the difference is
  $ r^(n_(upright(f))) J_epsilon.alt^flat \( Delta_(r^(1 \/ m)) h \) - J_epsilon.alt^flat \( h \) . $
  For $e^(- 1) lt.eq r lt.eq e$ it is supported on one compact set, and its supremum is at most $C \| log r \|$ by the Mean Value Theorem. The volume-normalized number of lattice points there is uniformly bounded by the cell comparison. Sum to conclude. ◻
]

=== 8.6 A finite magnetic factor and its exact multiplicity <a-finite-magnetic-factor-and-its-exact-multiplicity>

A single small twist makes the trace small near one endpoint of a character interval. We need it small near both endpoints, because the supporting layers will escape in opposite directions there. The finite representation below shifts the second effective twist from $t$ to $t - delta$. The product projection then has trace bounded by a constant times $N t^(n_(upright(f))) \( delta - t \)^(n_(upright(f)))$. The prescribed scales will make this small even after the ordinary matrix multiplicity $N$ and the geometric weights are included.

The global constant $h_(*) = 5003$ satisfies $H_0 lt.eq h_(*) log_2 d$. After $m \, C_(*) \, C_bullet$ are fixed, choose

#[#set math.equation(numbering: n => "(8.14)")
 $ & E_0 > 10 \( C_(*) + C_bullet + 1 \) \,\
 & A_(*) in bb(N) \, #h(2em) A_(*) \/ m > 10 E_0 h_(*) \,\
 & kappa > 0 \, #h(2em) kappa \/ m > 10 \( E_0 + A_(*) + C_bullet + 1 \) . $ <nil:parameter-order>]

Set

#[#set math.equation(numbering: n => "(8.15)")
 $ q = d^(A_(*)) \, #h(2em) delta = q^(- 1) \, #h(2em) N = q^(n_(upright(f))) \, #h(2em) I = H_0 . $ <nil:q>]

The numbers $q \, N \, I$ are integers. We take $ell$ large enough that $delta < theta_0$ in Proposition 35.

Let $frak(n)_q = frak(n)_(bb(Z) \/ q bb(Z))$, a set of $q^(n_(upright(f))) = N$ elements. On $bb(C)^N = ell^2 \( frak(n)_q \)$ define a representation of the second copy $E_(bb(Z))$ by

#[#set math.equation(numbering: n => "(8.16)")
 $ \( R \( lambda \, b \, z \) psi \) \( x \) = upright(e) #scale(x: 120%, y: 120%)[\(] - \( z + lambda \( x \) \) \/ q #scale(x: 120%, y: 120%)[\)] psi #scale(x: 120%, y: 120%)[\(] b^(- 1) \( 1 + x \) - 1 #scale(x: 120%, y: 120%)[\)] . $ <nil:R>]

Use any integer representative in the phase; the exponential is independent of the representative. All arguments on the right are reduced modulo $q$. The affine map is a permutation and the phase has modulus one, so the operator is unitary. Substitution into Equation (8.2), exactly as for $pi_epsilon.alt$, proves that $R$ is a group representation. Its central character is

$ R \( 0 \, 1 \, z \) = upright(e) \( - delta z \) 1_N . $

Write $R_gamma = R \( sigma \( gamma \) \)$.

Reduction of the integer polynomial laws gives a surjective homomorphism $L = macron(E)_(bb(Z)) arrow.r macron(E)_(bb(Z) \/ q bb(Z))$. Its kernel is

$ Lambda_q = { \( lambda \, b \) in L : lambda_(i j) equiv \( b - 1 \)_(i j) equiv 0 med \( mod med q \) } . $

It has index $q^(2 n_(upright(f)))$ and coset representatives with every coordinate in ${ 0 \, dots.h \, q - 1 }$. Equation (8.16) gives exactly

#[#set math.equation(numbering: n => "(8.17)")
 $ R_y = 1_N #h(2em) \( y in Lambda_q \) . $ <nil:congruence-R>]

The next lemma is a form of twisted absorption #cite(label("EchterhoffWilliams2012")) Lemma 2.4. We track the quotient-identity block in its conjugacy to retain the exact unnormalized matrix-trace multiplicity.

#thm([Lemma 8.9.])[
  (Absorption of the finite factor).  #emph[On the second quotient factor, define 
$ V_t \( gamma \) = u_t \( gamma \) ⊗ R_gamma . $

 Its multiplier is $upright(e) \( \( t - delta \) c \)$, and it is unitarily equivalent to $N$ copies of $u_(t - delta)$. The equivalence fixes the quotient-identity fiber, preserving the identity trace with its unnormalized matrix sum. Thus every coefficient sum, and every continuous spectral function of it, has the same operator norm as its evaluation in $u_(t - delta)$; the identity trace of a projection is multiplied by $N$.]
] <nil:absorption>

#proof[
  The section law and the central character of $R$ give
  $ R_gamma R_eta = upright(e) \( - delta c \( gamma \, eta \) \) R_(gamma eta) . $
  Combining this with the multiplier of $u_t$ proves the multiplier assertion. Define a diagonal unitary by
  $ W_t \( delta_eta ⊗ v \) = delta_eta ⊗ R_eta v . $
  Its formula is actually independent of $t$. Then
  $ V_t \( gamma \) W_t \( delta_eta ⊗ v \) & = upright(e) \( t c \( gamma \, eta \) \) delta_(gamma eta) ⊗ R_gamma R_eta v\
 & = upright(e) \( \( t - delta \) c \( gamma \, eta \) \) delta_(gamma eta) ⊗ R_(gamma eta) v\
 & = W_t \( u_(t - delta) \( gamma \) ⊗ 1_N \) \( delta_eta ⊗ v \) . $
  So $W_t^(*) V_t \( gamma \) W_t = u_(t - delta) \( gamma \) ⊗ 1_N$. As $R_1 = 1_N$, $W_t$ fixes $delta_1 ⊗ bb(C)^N$ pointwise, and conjugacy preserves the entire identity matrix block. All conclusions follow first for finite sums and then by norm limits and continuous functional calculus. ◻
]

In the full Fourier quotient space, amplified by $bb(C)^N$, the first factor $u_t$ and the second $V_t$ commute. They are equivariant for the original right quotient actions tensored with $1_N$. For $0 < t < delta$, both $t$ and $t - delta$ fall in Proposition 35. Define

#[#set math.equation(numbering: n => "(8.18)")
 $ p \( t \) = p_t ⊗ p_(t - delta) \[ V_t \] . $ <nil:pt>]

The second-factor notation means coefficient evaluation and continuous functional calculus through Lemma 37. Set $p \( t \) = 0$ outside this interval. It is a measurable bounded field of equivariant projections. Its identity trace $s_p \( t \) = "Tr"_(upright("id") \, N) \( p \( t \) \)$ satisfies

#[#set math.equation(numbering: n => "(8.19)")
 $ 0 < s_p \( t \) & = N thin "tr"_t \( p_t \) "tr"_(t - delta) \( p_(t - delta) \)\
 & lt.eq C N t^(n_(upright(f))) \( delta - t \)^(n_(upright(f))) #h(2em) \( 0 < t < delta \) . $ <nil:two-factor-trace>]

Factor the identity diagonals of the tensor factors and use the identity-block assertion of Lemma 37 for the equality. In subsequent coefficient formulas, an additional shared central power $z_0^n$ acts by $upright(e) \( n t \) 1_N$. The matrix $R_gamma$ is attached to a second-factor section term as in $V_t$; these prescriptions fix all phases.

=== 8.7 The layer window and its weighted trace <the-layer-window-and-its-weighted-trace>

#thm([Lemma 8.10.])[
  (Smooth layer windows).  #emph[There is a smooth nonnegative $h$, supported in $\( - 1 \, 1 \)$ and positive on $\[ - 0.7 \, 0.7 \]$, with $sum_(i in bb(Z)) h \( v - i \)^2 = 1$ for every $v in bb(R)$. For $0 < t < delta$, set 
#[#set math.equation(numbering: n => "(8.20)")
 $ b \( t \) = kappa^(- 1) log_2 frac(t, delta - t) \, #h(2em) h_i \( t \) = h \( b \( t \) - i \) \, $ <nil:h>]

 and extend $h_i$ by zero to the rest of the circle. Each extension is smooth. The active set $J \( t \) = { i : h_i \( t \) eq.not 0 }$ has one or two elements, adjacent if two, and $sum_i h_i \( t \)^2 = 1$ on the open interval. With $w_i = q^(- 1) 2^(- kappa \| i \|)$, its support length and derivatives satisfy 
$ \| "supp" h_i \| lt.eq C_kappa w_i \, #h(2em) parallel partial_t^j h_i parallel_oo lt.eq C_(kappa \, j) w_i^(- j) . $

 On an active index $i$, uniformly in $ell \, i \, t$, 
#[#set math.equation(numbering: n => "(8.21)")
 $ log_2 \( t^(- 1) \) & = log_2 q + kappa max \( - i \, 0 \) + O_kappa \( 1 \) \,\
log_2 \( \( delta - t \)^(- 1) \) & = log_2 q + kappa max \( i \, 0 \) + O_kappa \( 1 \) \,\
t \( delta - t \) & lt.eq 2^kappa q^(- 2) 2^(- kappa \| i \|) . $ <nil:log-t>]

]
] <nil:window>

#proof[
  Choose a smooth nonnegative bump $beta$, supported in $\( - 0.9 \, 0.9 \)$ and positive on $\[ - 0.7 \, 0.7 \]$, and put
  $ h \( v \) = beta \( v \) (sum_(j in bb(Z)) beta \( v - j \)^2)^(- 1 \/ 2) . $
  The denominator is positive, smooth, and one-periodic: some translate lies in $\[ - 1 \/ 2 \, 1 \/ 2 \]$. This proves the square-sum property. An interval of length $1.8 < 2$ contains at most two integers, necessarily adjacent. This proves the assertion about active indices. For each fixed $i$, its support in $b$-coordinates lies in a compact interval strictly inside the inverse image of $\( 0 \, delta \)$; its $t$-support is therefore a compact subset of $\( 0 \, delta \)$, so extension by zero is smooth.
  The inverse map and its derivative are
  $ t \( b \) = delta frac(2^(kappa b), 1 + 2^(kappa b)) \, #h(2em) delta - t \( b \) = frac(delta, 1 + 2^(kappa b)) \, #h(2em) t' \( b \) = kappa \( log 2 \) frac(t \( b \) \( delta - t \( b \) \), delta) . $
  For $\| b - i \| lt.eq 0.9$, $t' \( b \)$ is bounded above and below by positive constants depending on $kappa$ times $w_i$. Every higher $b$-derivative is bounded by a constant times $w_i$, by differentiating the displayed rational function and separating $b gt.eq 0$ from $b lt.eq 0$. The inverse-function differentiation formulas and the fixed derivatives of $h$ give the stated derivative bounds. Integration of the bound on $t'$ proves the support bound.
  The exact logarithmic identities are
  $ log_2 \( t \( b \)^(- 1) \) = log_2 q + log_2 \( 1 + 2^(- kappa b) \) \, quad log_2 \( \( delta - t \( b \) \)^(- 1) \) = log_2 q + log_2 \( 1 + 2^(kappa b) \) . $
  For real $x$, $log_2 \( 1 + 2^x \) - max \( x \, 0 \)$ lies in $\[ 0 \, 1 \]$. Using $\| b - i \| < 1$ proves Equations (8.21) and (8.21). Finally
  $ frac(2^(kappa b), \( 1 + 2^(kappa b) \)^2) lt.eq 2^(- kappa \| b \|) $
  and $\| b - i \| < 1$ prove Equation (8.21). ◻
]

#thm([Proposition 8.11.])[
  (Uniform weighted trace bound).  #emph[For $frak(w)_i = 2^(C_bullet H_i)$, define 
$ mu_ell = sup_(0 < t < delta\
i in J \( t \)) frak(w)_i thin s_p \( t \) . $

 Then $mu_ell arrow.r 0$ as $ell arrow.r oo$. More explicitly, 
#[#set math.equation(numbering: n => "(8.22)")
 $ frak(w)_i N t^(n_(upright(f))) \( delta - t \)^(n_(upright(f))) lt.eq C d^(- \( A_(*) n_(upright(f)) - C_bullet h_(*) \)) 2^(- \( kappa n_(upright(f)) - C_bullet \) \| i \|) #h(2em) \( i in J \( t \) \) . $ <nil:weighted-estimate>]

 The two exponents subtracted on the right are positive.]
] <nil:weighted>

#proof[
  Using $H_i = H_0 + \| i \|$, $H_0 lt.eq h_(*) log_2 d$, $N = q^(n_(upright(f)))$, and Equation (8.21),
  $ 2^(C_bullet H_i) N #scale(x: 120%, y: 120%)[\(] t \( delta - t \) #scale(x: 120%, y: 120%)[\)]^(n_(upright(f))) & lt.eq 2^(kappa n_(upright(f))) 2^(C_bullet H_0) q^(- n_(upright(f))) 2^(- \( kappa n_(upright(f)) - C_bullet \) \| i \|)\
 & lt.eq 2^(kappa n_(upright(f))) d^(- \( A_(*) n_(upright(f)) - C_bullet h_(*) \)) 2^(- \( kappa n_(upright(f)) - C_bullet \) \| i \|) . $
  Equation (8.14), with $m gt.eq 2$ and $n_(upright(f)) gt.eq 1$, implies $A_(*) n_(upright(f)) > C_bullet h_(*)$ and $kappa n_(upright(f)) > C_bullet$. Take the supremum and apply Equation (8.19). ◻
]

The dependency order for subsequent arguments is as follows. Geometry fixes $C_(*) \, C_bullet$; Equation (8.1) then fixes $m$, and Lemma 33 fixes two functions. Equation (8.14) fixes $E_0 \, A_(*) \, kappa$. All accuracies, compact truncations, relative logarithmic mesh sizes, and finite norm-test exponents may now be chosen as fixed constants. Only then is $ell$ increased. In particular the trace estimate requires no accuracy varying with the layer, and the word detector does not depend on subsequent moment orders.

== 9 The model and its simultaneous realization <sam:section>

The expanding incidences and transverse projections now give a model operator with a separated upper band and small unnormalized trace. We then realize its compression to $Y$ by edge voltages and matrix weights, while imposing the girth needed for the geometric construction. All norms in this Section, unless a finite compression is explicitly specified, are operator norms in the full regular representation. In particular, the estimates below do not merely test some finite-dimensional representations of the deck group.

=== 9.1 The upper space of the model <the-upper-space-of-the-model>

Use the notation and parameter choices of the preceding Sections. The vertex space before deletion, with its auxiliary indices, is

$ cal(H)^0 = ell^2 #h(-0.16667em) (product.co_(i in bb(Z)) \( A_i union.sq B_i \)) ⊗ ell^2 \( F \) ⊗ bb(C)^N . $

Let $Pi$ be the orthogonal projection retaining precisely the vertices of $Y$. Let $U_(i k)^0 : ell^2 \( B_k \) arrow.r ell^2 \( A_i \)$ be the normalized $Y^0$ incidence from Proposition 13. It and its adjoint preserve normalized constants, and its norm between their orthogonal complements is at most $1 - chi$. Decrease $chi$, if necessary, so that $0 < chi lt.eq 1 \/ 4$. Write $beta_ell$ for the supremum of the deleted fractions in the individual $A_i \, B_i$, so $beta_ell lt.eq epsilon_ell arrow.r 0$ by Equation (6.5). Equation (8.18) and Lemma 38 provide the transverse projections $p \( t \)$ and nonnegative layer weights $h_i \( t \)$, with

#[#set math.equation(numbering: n => "(9.1)")
 $ sum_i h_i \( t \)^2 = 1 \, #h(2em) J \( t \) := { i : h_i \( t \) eq.not 0 } upright(" consists of at most two adjacent integers") . $ <spec:active-layers>]

These assertions concern $0 < t < delta$. The identity trace of $p \( t \)$ is finite and strictly positive there by Equation (8.19). All identity traces include the ordinary, unnormalized sum over the $N$ matrix indices.

In the central Fourier decomposition define a self-adjoint operator field $O \( t \)$ by its blocks from $B_k$ to $A_i$:

#[#set math.equation(numbering: n => "(9.2)")
 $ O \( t \)_(A_i B_k) = U_(i k)^0 ⊗ h_i \( t \) h_k \( t \) p \( t \) \, #h(2em) \| i - k \| lt.eq 1 . $ <sam:model>]

The blocks in the opposite direction are the adjoints; all remaining blocks vanish. The normalized incidence $U_(i k)^0$ has norm one. Thus the block Schur estimate bounds $O \( t \)$ uniformly, and it defines an operator on $cal(H)^0$. Here and below the formula is zero off $0 < t < delta$. No continuity at the endpoints is needed for defining this bounded measurable field.

Let $a_i = \| A_i \|^(- 1 \/ 2) upright(bold(1))_(A_i)$ and $b_i = \| B_i \|^(- 1 \/ 2) upright(bold(1))_(B_i)$. Denote the transverse fiber Hilbert space, including its $N$ matrix indices, by $cal(H)_t$, and put

$ cal(H)_t^0 = (xor.big_i ell^2 \( A_i \) xor xor.big_i ell^2 \( B_i \)) ⊗ cal(H)_t . $

#thm([Lemma 9.1.])[
  (The model band and its trace).  #emph[For $0 < t < delta$, define an isometry on $p \( t \) cal(H)_t$ by 
#[#set math.equation(numbering: n => "(9.3)")
 $ V_(*) \( t \) zeta = 2^(- 1 \/ 2) (xor.big_i h_i \( t \) a_i ⊗ zeta) xor 2^(- 1 \/ 2) (xor.big_i h_i \( t \) b_i ⊗ zeta) \, #h(2em) E_(*) \( t \) = V_(*) \( t \) V_(*) \( t \)^(*) . $ <spec:model-isometry>]

 Then $O \( t \) E_(*) \( t \) = E_(*) \( t \)$, $parallel O \( t \) parallel lt.eq 1$, and 
#[#set math.equation(numbering: n => "(9.4)")
 $ O \( t \) \|_(\( 1 - E_(*) \( t \) \) cal(H)_t^0) lt.eq \( 1 - chi \) I \, #h(2em) "tr"_(upright("id")) E_(*) \( t \) = "tr"_(upright("id")) p \( t \) . $ <spec:model-gap-trace>]

 Set $E_(*) \( t \) = 0$ outside the window; the same upper bound holds there. Furthermore 
#[#set math.equation(numbering: n => "(9.5)")
 $ parallel \( 1 - Pi \) E_(*) \( t \) parallel lt.eq sqrt(beta_ell) $ <spec:model-cut>]

 uniformly in $t$.]
] <spec:model>

#proof[
  The direct sum of the layerwise constant spaces reduces $O \( t \)$, since each $U_(i k)^0$ and its adjoint preserve the corresponding normalized constants. On these spaces, identify both sides with $ell^2 \( bb(Z) \) ⊗ cal(H)_t$. Every pair of active indices is an allowed pair by Equation (9.1). The upper-right block is therefore
  $ \| h \( t \) chevron.r chevron.l h \( t \) \| ⊗ p \( t \) \, #h(2em) parallel h \( t \) parallel_2 = 1 . $
  The two-sided self-adjoint block has eigenvalue $1$ on the symmetric copy in Equation (9.3), eigenvalue $- 1$ on the antisymmetric copy, and eigenvalue zero on their orthogonal complement.
  On the direct sum of the mean-zero spaces, let $xi = \( xi_k \)_k$ lie on the $B$ side, with transverse coordinates included. Tensoring a bounded operator with the projection $p \( t \)$ does not increase its norm. Thus the upper-right block $C \( t \)$ satisfies
  $ parallel \( C \( t \) xi \)_i parallel lt.eq \( 1 - chi \) h_i \( t \) sum_k h_k \( t \) parallel xi_k parallel . $
  Squaring, summing over $i$, and applying the scalar Cauchy–Schwarz inequality gives $parallel C \( t \) xi parallel lt.eq \( 1 - chi \) parallel xi parallel$. The self-adjoint two-sided block consequently has norm at most $1 - chi$ on these spaces. This proves the norm and spectral assertions.
  At a vertex in $A_i$, the diagonal of $E_(*) \( t \)$ is $h_i \( t \)^2 p \( t \) \/ \( 2 \| A_i \| \)$, and the corresponding formula on $B_i$ is $h_i \( t \)^2 p \( t \) \/ \( 2 \| B_i \| \)$. Summing the identity diagonals over both sides and all layers gives
  $ "tr"_(upright("id")) E_(*) \( t \) = (1 / 2 sum_i h_i \( t \)^2 + 1 / 2 sum_i h_i \( t \)^2) "tr"_(upright("id")) p \( t \) = "tr"_(upright("id")) p \( t \) . $
  The antisymmetric copy is at $- 1$ and makes no contribution to this upper trace. Finally, for $zeta in p \( t \) cal(H)_t$, the squared norm removed from $V_(*) \( t \) zeta$ is at most $1 / 2 sum_i h_i \( t \)^2 \( beta_ell + beta_ell \) parallel zeta parallel^2$. This proves Equation (9.5). ◻
]

The upper space just identified is supported on at most two adjacent layers, as shown in Figure 1. Its vertex factor is a normalized combination of the constant vectors, so its trace equals the fiber trace rather than that trace multiplied by the number of vertices. We must now approximate the compressed model by an actual voltage-cover operator with finitely many matrix weights, while ensuring the cover’s girth. Section 10 will use the model gap and deletion bound to preserve its upper band through this approximation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((2.397, -0.47), (7.003, 1.974), fill: rgb("#ededff"), stroke: none, radius: 4pt)
  content((-0.188, 1.316), [#text(size: 9pt)[$A$-constants]], anchor: "east", padding: 0.1176cm)
  content((-0.188, 0), [#text(size: 9pt)[$B$-constants]], anchor: "east", padding: 0.1176cm)
  content((0.94, 1.316), [#text(size: 9pt)[$a_(i-1)$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.94, 0), [#text(size: 9pt)[$b_(i-1)$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.94, -0.799), [#text(size: 9pt)[layer $i-1$]])
  content((3.478, 1.316), [#text(size: 9pt)[$a_i$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.478, 0), [#text(size: 9pt)[$b_i$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.478, -0.799), [#text(size: 9pt)[layer $i$]])
  content((5.922, 1.316), [#text(size: 9pt)[$a_(i+1)$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.922, 0), [#text(size: 9pt)[$b_(i+1)$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.922, -0.799), [#text(size: 9pt)[layer $i+1$]])
  content((8.46, 1.316), [#text(size: 9pt)[$a_(i+2)$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.46, 0), [#text(size: 9pt)[$b_(i+2)$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.46, -0.799), [#text(size: 9pt)[layer $i+2$]])
  line((3.478, 1.316), (3.478, 0), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  line((3.478, 1.316), (5.922, 0), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  line((5.922, 1.316), (3.478, 0), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  line((5.922, 1.316), (5.922, 0), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  content((4.7, 2.303), [#text(fill: rgb("#0000b2"))[#text(size: 9pt)[$J(t)=\{i,i+1\}$]]])
  line((0.47, -1.598), (3.478, -1.598), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#808080"))))
  line((5.922, -1.598), (8.93, -1.598), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((4.7, -1.598), [#text(size: 9pt)[active layers]])
  content((1.598, -2.068), [#text(size: 9pt)[$t arrow.b 0:#h(0.3333em) b(t) arrow.r - infinity$]])
  content((7.802, -2.068), [#text(size: 9pt)[$t arrow.t delta :#h(0.3333em) b(t) arrow.r + infinity$]])
})],
  caption: [Figure 1: The constant-vector part of the model at a parameter with two active layers. The blue connections represent the four nonzero blocks $h_j \( t \) h_k \( t \) p \( t \)$, not individual graph edges. Their symmetric upper space is given by Equation (9.3). As the parameter approaches either endpoint, the active layers escape in the indicated direction and the fiber trace tends to zero at the weighted rate of Proposition 39. ],
) <fig:moving-band>

=== 9.2 Realizing the model on a voltage cover <realizing-the-model-on-a-voltage-cover>

#thm([Theorem 9.2.])[
  #emph[For every fixed $eta > 0$, and for all sufficiently large $ell$, there are voltages $z_e in F$ and matrices $W_e in M_N \( bb(C) \)$ on the positively oriented edges of $Y$ with the following properties.]
  + #emph[There is a constant $C_eta$, independent of $ell$ and the layer, such that $parallel W_e parallel lt.eq C_eta$. Augmenting an original tower label by its matrix weight gives a finite positive alphabet of size $o \( d D \)$. The normalizing number $D_(i k)$ is determined by the original part of the label.]
  + #emph[The voltage cover has no nonempty cyclically nonbacktracking closed walk based in layer $i$ of length at most $C_(*) H_i \/ log_2 d$.]
  + #emph[Let $T_P$, extended by zero on the deleted vertex indices, have entries from $B_k$ to $A_i$ 
#[#set math.equation(numbering: n => "(9.6)")
 $ \( T_P \)_(a b) = 1 / sqrt(d D_(i k)) sum_(e : a arrow.r b) W_e rho \( z_e \) \, #h(2em) a in A_i \, quad b in B_k \, $ <sam:entries>]

 with the adjoint entries in the opposite direction. Then 
#[#set math.equation(numbering: n => "(9.7)")
 $ parallel T_P - Pi O Pi parallel lt.eq eta . $ <sam:approx>]

 Both operators have layer width one. In particular, their central Fourier fields satisfy the same inequality almost everywhere, including $parallel T_P \( t \) parallel lt.eq eta$ outside the open window.]
  #emph[The matrices $W_e$ are the actual weights of the individual edges of the voltage cover, so $T_P$ reduces on each component of that cover.]
] <sam:realization>

We first reduce regular-norm estimates to finite tests. Finite empirical lists then restrict the possible matrix weights, while a block-specific distribution approximates the model mean and retains wide independent voltage coordinates. After fixing those lists, we draw once on each edge. The girth and centered-moment estimates apply to these same independent draws.

=== 9.3 Finite tests for the full regular norm <finite-tests-for-the-full-regular-norm>

#thm([Lemma 9.3.])[
  #emph[Let $x gt.eq 2$. Suppose a finite set of elements of $F$, including their inverses, has every integral coordinate bounded by $x^a$, where $a$ is fixed. For every fixed $B > 0$ there is a finite coordinate box $cal(B)_x subset F$ with 
$ \| cal(B)_x \| lt.eq x^c \, #h(2em) frac(\| cal(B)_x triangle.stroked.t cal(B)_x g \|, \| cal(B)_x \|) lt.eq C x^(- B) $

 for all the specified elements $g$. Constants $c \, C$ depend on $a \, B \, F$, but not on the number of specified elements or on $x$.]
  #emph[Let $A$ be a self-adjoint finite matrix of right convolution sums on $ell^2 \( J \) ⊗ ell^2 \( F \) ⊗ bb(C)^n$, where $J$ is a finite index set, with these group supports. Write its coefficients as $C_(u v) \( g \) in M_n \( bb(C) \)$, and suppose 
$ max_(u in J) sum_(v in J) sum_g parallel C_(u v) \( g \) parallel lt.eq R . $

 If $P_x$ retains the deck indices in $cal(B)_x$ and all the other indices, then 
#[#set math.equation(numbering: n => "(9.8)")
 $ parallel P_x A P_x parallel lt.eq parallel A parallel lt.eq parallel P_x A P_x parallel + C x^(- B) R . $ <sam:finite-test>]

 The same conclusion holds for a rectangular convolution matrix after self-adjoint off-diagonal doubling, using the larger of its absolute row and column sum bounds. The constants do not depend on the matrix amplification $n$.]
] <sam:boxes>

#proof[
  The integral coordinates and their positive integer weights are those of Lemma 31. Let a coordinate of weight $j$ range between $- floor.l T^j floor.r$ and $floor.l T^j floor.r$, and denote the resulting box by $cal(B) \( T \)$. If $f in cal(B) \( T \)$, the weight-$j$ coordinate of $f g$ minus that of $f$ is a sum of finitely many graded monomials. Every monomial contains a coordinate of $g$, and consequently the total weight contributed by coordinates of $f$ is at most $j - 1$. The same observation includes the pure $g$ term. Since the multiplication polynomials are fixed, there are constants $P \, C$ such that, when $T gt.eq x$, all these changes have absolute value at most $C x^P T^(j - 1)$.
  It follows that a point whose coordinate of every weight $j$ is at distance more than $C x^P T^(j - 1)$ from the two corresponding faces stays in the box after right multiplication by $g$. The fraction of points in the union of these boundary strips is at most $C' x^P \/ T$; the rounding of the side lengths changes only the constant. Right multiplication is a bijection, so the same bound, with a factor two, controls the relative symmetric difference. Take $T = ceil.l x^(P + B + 2) ceil.r$. The number of coordinates and their weights are fixed, so $\| cal(B) \( T \) \| lt.eq x^c$ after enlarging a fixed exponent. This proves the first assertion, uniformly for all the possible supports.
  For the norm assertion, let $P_s$ retain deck indices in the left translate $s cal(B)_x$. Right convolution commutes with left translation, and therefore all $P_s A P_s$, acting on their ranges, have the same norm as $P_x A P_x$. For a finitely supported vector $xi$,
  $ sum_(s in F) parallel P_s xi parallel^2 = \| cal(B)_x \| thin parallel xi parallel^2 . $
  Indeed any fixed deck index belongs to exactly $\| cal(B)_x \|$ left translates. Averaging $chevron.l A P_s xi \, P_s xi chevron.r$ over $s$, and dividing by $\| cal(B)_x \|$, multiplies the coefficient of $rho \( g \)$ by
  $ alpha_x \( g \) = frac(\| cal(B)_x ∩ cal(B)_x g^(- 1) \|, \| cal(B)_x \|) . $
  Call the resulting self-adjoint convolution matrix $A_x$. The averaged quadratic form satisfies
  $ \| chevron.l A_x xi \, xi chevron.r \| lt.eq parallel P_x A P_x parallel thin parallel xi parallel^2 . $
  Moreover, $\| 1 - alpha_x \( g \) \| lt.eq C x^(- B)$. Self-adjointness gives the same coefficient norm bound for columns as for rows. The scalar Schur estimate, applied to the norms of the matrix entries, gives $parallel A - A_x parallel lt.eq C x^(- B) R$. Density and the self-adjoint quadratic form formula now prove (9.8). No coordinate within $bb(C)^n$ was estimated separately; this explains the asserted uniformity in amplification. For a rectangular $S$, apply the argument to $mat(delim: "(", 0, S; S^(*), 0)$, whose norm equals $parallel S parallel$, before and after the indicated compressions. ◻
]

#thm([Lemma 9.4.])[
  #emph[Set $M = floor.l d^(1 \/ 32) floor.r$, with $q = d^(A_(*))$ and $A_(*)$ fixed. Consider at most $C \( 1 + log q \)$ finite distributions of operators $W rho \( g \)$ on $ell^2 \( F \) ⊗ bb(C)^N$. Suppose $parallel W parallel lt.eq B_0$, every possible group coordinate is bounded by $q^a$, and $N lt.eq q^a$, for fixed constants $a \, B_0 \, C$. For each fixed $epsilon > 0$, and sufficiently large $ell$, each expectation has an $M$-term empirical average within $epsilon$ in the full regular norm. The averages may be chosen for all the distributions simultaneously.]
] <sam:empirical>

#proof[
  For each distribution take $M$ independent samples. Apply Lemma 42 at $x = q$ to the difference of their average and their expectation, after off-diagonal doubling. Its absolute coefficient row and column sums are bounded by $2 B_0$. Choose the box to make the error less than $epsilon \/ 2$. The resulting self-adjoint test matrix has dimension at most $q^(c_0)$, with $c_0$ fixed. If $Z_j$ is its compressed, centered $j$-th sample, then $bb(E) Z_j = 0$ and $parallel Z_j parallel lt.eq 2 B_0$.
  Expand the trace of $\( M^(- 1) sum_j Z_j \)^(2 k)$. If an index occurs exactly once in a term, conditioning on all other samples makes that term zero. This argument is valid for a noncommutative product: the unique occurrence has the form $L Z_j R$ with $L \, R$ fixed under the conditioning. At most $k$ different indices occur in a remaining term. The number of sequences using at most $k$ indices is at most $sum_(a = 1)^k M^a a^(2 k)$. Bounding the absolute trace of each product by its dimension times the product of its factor norms gives
  $ bb(E) "Tr" (M^(- 1) sum_(j = 1)^M Z_j)^(2 k) lt.eq q^(c_0) \( 2 B_0 \)^(2 k) M^(- 2 k) sum_(a = 1)^k M^a a^(2 k) lt.eq q^(c_0) k (frac(4 B_0^2 k^2, M))^k . $
  For $k = ceil.l log q ceil.r$, Markov’s inequality therefore bounds the probability of test norm greater than $epsilon \/ 2$ by
  $ q^(c_0) k (frac(16 B_0^2 k^2, M epsilon^2))^k . $
  Its logarithm is at most $- c \( log q \)^2 + O \( log q log log q \)$, since $log M = \( 32 A_(*) \)^(- 1) log q + O \( 1 \)$. The bound tends to zero even after multiplication by $C \( 1 + log q \)$. Thus all the tests succeed with positive probability. Lemma 42 transfers their bounds to the full regular norm. Fix one such list for each distribution. ◻
]

=== 9.4 Compact coefficient templates and masks <compact-coefficient-templates-and-masks>

Fix a small accuracy $epsilon > 0$, to be chosen in terms of $eta$ at the end. In this Subsection all auxiliary errors can be made smaller than any prescribed fixed multiple of $epsilon$. The constants they require are fixed before increasing $ell$.

By Lemma 36, choose smooth compactly supported functions $J_epsilon.alt^flat$ and a fixed relative logarithmic mesh size $0 < u lt.eq 1$ so that truncation and coefficient rounding have arbitrarily small prescribed $ell^1$ errors. These choices depend only on $epsilon$ and the previously fixed data. The estimates apply uniformly on the active window because $t \, delta - t in \( 0 \, delta \)$ and $delta arrow.r 0$ as $ell arrow.r oo$; they give operator estimates for every unitary family used below. Throughout rounding, the translating operators, and consequently their multipliers, keep their actual parameter; only the coefficients are rounded.

Choose a sufficiently fine fixed log-grid spacing. A nonnegative smooth bump on the real line whose translates at that spacing cover the line, divided by the positive sum of those translates, gives a smooth partition of unity. Pull one such partition back under $log_2 \( t \/ delta \)$, and another under $log_2 \( \( delta - t \) \/ delta \)$. Denote them by $psi_nu \( t \)$ and $theta_omega \( t \)$, and denote their associated positive magnitude templates by $a_nu \, b_omega$. On the supports in question,

$ \| log \( a_nu \/ t \) \| lt.eq u \, #h(2em) \| log \( b_omega \/ \( delta - t \) \) \| lt.eq u . $

Both partitions sum to one on $0 < t < delta$.

For a fixed block $\( i \, k \)$, keep precisely the template pairs whose supports intersect the support of $h_i h_k$, and call their set $cal(T)_(i k)$. Its cardinality is bounded by a constant $K_epsilon$, uniformly in $i \, k \, ell$. Indeed $h_i h_k eq.not 0$ implies $\| b \( t \) - i \| < 1$; each of $log_2 \( t \/ delta \)$ and $log_2 \( \( delta - t \) \/ delta \)$ varies by at most $2 kappa$ there. Only boundedly many members of either fixed-spacing grid can meet these ranges. The specified positivity of $h$ ensures that the nonzero incidence blocks have some such pairs.

For any twisted representation $U'$ of $macron(E)_(bb(Z))$ define the finite sum

$ cal(L)_epsilon.alt \( alpha \; U' \) = sum_(gamma in macron(E)_(bb(Z))) alpha^(n_(upright(f))) J_epsilon.alt^flat \( Delta_(alpha^(1 \/ m)) gamma \) U' \( gamma \) . $

By Proposition 35, Lemma 36, and the chosen truncation and rounding accuracies, the block field

#[#set math.equation(numbering: n => "(9.9)")
 $ sum_(\( nu \, omega \) in cal(T)_(i k)) f_(i k nu omega) \( t \) thin cal(L)_(+) \( a_nu \; u_t \) cal(L)_(-) \( b_omega \; V_t \) \, #h(2em) f_(i k nu omega) = h_i h_k psi_nu theta_omega \, $ <sam:template-field>]

approximates $h_i h_k p \( t \)$ to an arbitrarily small fixed error, uniformly on the window, for sufficiently large $ell$. The two factors act on their separate transverse indices. The error estimate uses the uniformly bounded coefficient $ell^1$ norms, positivity of the scalar partition, and its sum-one property. Extend each scalar mask by zero off the window.

The masks have a useful scale uniform in the layer. Put

$ w_i = q^(- 1) 2^(- kappa \| i \|) . $

On the support of $h_i$, the identities $t = delta 2^(kappa b \( t \)) \/ \( 1 + 2^(kappa b \( t \)) \)$ and $delta - t = delta \/ \( 1 + 2^(kappa b \( t \)) \)$ show that the shorter distance to an endpoint is comparable to $w_i$, with constants depending on $kappa$. They also show that the support has length at most $C w_i$. The chain rule for the two logarithmic charts gives, for every fixed integer $j gt.eq 0$,

#[#set math.equation(numbering: n => "(9.10)")
 $ parallel f_(i k nu omega)^(\( j \)) parallel_oo lt.eq C_j w_i^(- j) \, #h(2em) parallel f_(i k nu omega)^(\( j \)) parallel_1 lt.eq C_j w_i^(1 - j) . $ <sam:mask-derivative>]

The compact support of the original bumps makes the zero extension smooth; each individual support is at positive distance from the endpoints. In particular, its Fourier coefficients satisfy

#[#set math.equation(numbering: n => "(9.11)")
 $ \| hat(f)_(i k nu omega) \( n \) \| lt.eq C_j w_i \( 1 + \| n \| w_i \)^(- j) \, #h(2em) n in bb(Z) . $ <sam:fourier>]

For $\| n \| w_i lt.eq 1$ this follows from the $L^1$ bound. Otherwise integrate by parts $j$ times, use (9.10), and combine the two bounds. Consequently

$ sum_n \| hat(f)_(i k nu omega) \( n \) \| lt.eq C \, #h(2em) sum_(\| n \| > L \/ w_i) \| hat(f)_(i k nu omega) \( n \) \| lt.eq C_j \( 1 + L \)^(1 - j) . $

Choose a fixed sufficiently large $L$, and truncate at $K_i = ceil.l L \/ w_i ceil.r$. These are uniform approximations on the entire circle. In particular, the approximating trigonometric polynomials have small values outside the active supports; exact vanishing there is neither claimed nor used.

=== 9.5 Finite matrix lists on the second factor <finite-matrix-lists-on-the-second-factor>

The scalar masks vary through infinitely many layers, but the final group must have a finite alphabet of matrix weights. Using a new matrix list at every layer would not meet that requirement. The range $i < I$ uses only finitely many second-factor templates, and hence finitely many empirical lists; in the remaining range a congruence subgroup factorization replaces all the matrix factors by one common list. The next estimates justify this replacement in the full regular norm.

In blocks with $i < I$, every second-factor template satisfies

#[#set math.equation(numbering: n => "(9.12)")
 $ log_2 b_omega^(- 1) lt.eq log_2 q + kappa \( I + 1 \) + C . $ <sam:ordinary-range>]

This follows from the formula for $delta - t$ on the support of $h_i$, followed by the fixed log rounding. Thus there are only $O \( 1 + log q \)$ distinct such templates over all these blocks, and their coordinate supports are bounded by a fixed power of $q$. Choose a coordinate rectangle containing each compact template support, with side radii fixed multiples of $b_omega^(- j \/ m)$ in weight $j$. The rectangle has $n_omega$ lattice points. Uniform sampling of $v'$ in it, with the term

$ n_omega b_omega^(n_(upright(f))) J_(-)^flat \( Delta_(b_omega^(1 \/ m)) v' \) R \( sigma \( v' \) \) rho \( sigma_Y \( v' \) \) \, $

has expectation equal to the ordinary lifted template. The scalar multiplier is bounded uniformly, because $n_omega b_omega^(n_(upright(f))) lt.eq C$. Lemma 43 gives, for each such template, a fixed $M$-term list approximating that expectation in the full regular norm. Its entries retain their original scalar multipliers and matrices. Fix all these lists now.

For the remaining blocks a single common matrix list suffices. Let $Lambda = Lambda_q$ be the subgroup of $macron(E)_(bb(Z))$ whose coordinates are all divisible by $q$. Reduction modulo $q$ is a surjective homomorphism by the integral polynomial group law; its kernel is $Lambda$, and

#[#set math.equation(numbering: n => "(9.13)")
 $ \[ macron(E)_(bb(Z)) : Lambda \] = q^(2 n_(upright(f))) = : Q_q . $ <sam:index>]

Choose a set $cal(V)_q$ of representatives for the cosets $Lambda v$, with each coordinate in ${ 0 \, dots.h \, q - 1 }$. Every $gamma$ is uniquely $y v$, with $y in Lambda$, $v in cal(V)_q$. Equation (8.17) gives $R \( sigma \( y \) \) = 1$ for $y in Lambda$: its affine shift is the identity modulo $q$, and its modulation exponent is an integer. The finite average

#[#set math.equation(numbering: n => "(9.14)")
 $ C_q = Q_q^(- 1) sum_(v in cal(V)_q) R \( sigma \( v \) \) rho \( sigma_Y \( v \) \) $ <sam:coset-average>]

has an $M$-term empirical approximation in the full regular norm, again by Lemma 43. Fix one such list, common to all $i gt.eq I$.

For those blocks replace an ordinary second-factor template by the product

#[#set math.equation(numbering: n => "(9.15)")
 $ (Q_q sum_(y in Lambda) b_omega^(n_(upright(f))) J_(-)^flat \( Delta_(b_omega^(1 \/ m)) y \) rho \( sigma_Y \( y \) \)) C_q . $ <sam:subgroup-product>]

We next prove the needed comparison with the ordinary template, including its phase and normalization.

The scale estimates from the window and the choices of parameters give, uniformly for $i gt.eq I$ and active templates,

#[#set math.equation(numbering: n => "(9.16)")
 $ b_omega^(- 1 \/ m) \/ q gt.eq 2^(2 E_0 H_i) $ <sam:second-width>]

when $ell$ is sufficiently large. Here is the explicit calculation. Log rounding contributes a bounded constant, and

$ log_2 \( b_omega^(- 1 \/ m) \/ q \) gt.eq kappa / m i - (A_(*) - A_(*) / m) log_2 d - C . $

Since $i gt.eq I = H_0 gt.eq log_2 d$ and $H_i = H_0 + i lt.eq 2 i$, the hypothesis $kappa \/ m > 10 \( E_0 + A_(*) + C_bullet + 1 \)$ leaves more than the margin needed for (9.16). It follows that every side length of the dilated subgroup mesh tends to zero uniformly. Counting its cells shows that the coefficient $ell^1$ norm of the first parenthesis in (9.15) is bounded.

In the fiber with $tau = t - delta$, the relevant projective operators satisfy

$ V_t \( y \) V_t \( v \) = exp \( 2 pi upright(i) tau c \( y \, v \) \) V_t \( y v \) . $

This is the multiplier identity, not a replacement of $t$ by a template in the translating operators. It can also be checked by multiplying the actual section lifts and then using the center parameter $- delta$ of $R$. As $R \( sigma \( y \) \) = 1$, the first parenthesis in (9.15) is precisely its prescribed factor in this product. The coefficient at $y v$, before empirical replacement of $C_q$, is therefore

$ b_omega^(n_(upright(f))) J_(-)^flat \( Delta_(b_omega^(1 \/ m)) y \) exp \( 2 pi upright(i) tau c \( y \, v \) \) . $

The factor $Q_q$ in the subgroup sum has canceled the factor $Q_q^(- 1)$ in the representative average; no matrix trace normalization occurs here.

Set $beta = b_omega^(1 \/ m)$. On all the compact supports in this calculation the elements $Delta_beta v$, with $v in cal(V)_q$, tend to the identity uniformly, since their coordinates of weight $j$ have absolute value at most $q beta^j lt.eq q beta$. The polynomial group law implies $Delta_beta \( y v \) = \( Delta_beta y \) \( Delta_beta v \)$ and that this differs from $Delta_beta y$ by a quantity tending to zero uniformly on those compacts. Homogeneity of the cocycle gives

$ tau c \( y \, v \) = tau / b_omega c \( Delta_beta y \, Delta_beta v \) . $

On an active template $\| tau \| \/ b_omega$ is bounded, while the last cocycle tends uniformly to zero. Smoothness of the compact coefficient function thus gives a uniformly vanishing difference between the preceding coefficient and $b_omega^(n_(upright(f))) J_(-)^flat \( Delta_beta \( y v \) \)$. All possibly nonzero differences lie in one fixed enlarged compact set in the scaled coordinates. The normalized number of ordinary lattice points there is bounded. Summing the coefficient differences therefore gives $o \( 1 \)$, uniformly in the active blocks and parameters. This proves the comparison with the ordinary template in operator norm. Finally, replacing $C_q$ by its empirical list costs at most its regular-norm error times the bounded coefficient $ell^1$ norm of the subgroup factor. The same bound holds almost everywhere in every central fiber.

All the coefficient sums used above have bounded absolute norms even at parameters where their templates are inactive. Thus multiplication by the masks and replacement of those masks by their Fourier truncations preserve the error estimates globally on the circle. More explicitly, on a mask support use its active comparison; off that support the untruncated mask is zero. The error made by substituting the truncated mask is bounded everywhere by its Fourier tail times the coefficient norm bounds. Sum over at most $K_epsilon$ pairs. This controls the inactive leakage as well as the active approximation.

=== 9.6 One draw per edge and the finite alphabet <one-draw-per-edge-and-the-finite-alphabet>

We now specify a finite distribution of a single pair $\( W \, z \)$ for each block $\( i \, k \)$. This will be sampled independently on its undirected edges, using the positive orientation and taking the adjoint weight and inverse voltage for the reverse orientation. The choices in different parts of the prescription are independent conditional on the template pair.

First choose $\( nu \, omega \)$ uniformly in $cal(T)_(i k)$, then choose an integer $n$ uniformly in ${ - K_i \, dots.h \, K_i }$. Use the total central power $n$ with scalar multiplier

$ \| cal(T)_(i k) \| \( 2 K_i + 1 \) hat(f)_(i k nu omega) \( n \) . $

By (9.11) this multiplier is bounded uniformly. These additional central powers carry no matrix modulation.

Choose $x in macron(E)_(bb(Z))$ uniformly in a full coordinate rectangle containing the support of $J_(+)^flat \( Delta_(a_nu^(1 \/ m)) x \)$. In each coordinate of weight $j$, its radius is a fixed positive constant times $a_nu^(- j \/ m)$, rounded up to an integer. Write $n_nu^(+)$ for its number of lattice points. Use $sigma_X \( x \)$, with scalar multiplier

$ n_nu^(+) a_nu^(n_(upright(f))) J_(+)^flat \( Delta_(a_nu^(1 \/ m)) x \) . $

It is uniformly bounded by the rectangle cell-volume estimate.

If $i < I$, choose one of the fixed $M$ entries in the ordinary second-factor list for $b_omega$, uniformly, and use its section lift, its matrix $R \( sigma \( v' \) \)$, and its scalar multiplier. Uniform averaging supplies the list’s normalization $1 \/ M$.

If $i gt.eq I$, choose $y in Lambda$ uniformly in the analogous full subgroup rectangle, and independently choose one entry $v$ uniformly from the fixed representative list. Use $sigma_Y \( y \) sigma_Y \( v \)$, the matrix $R \( sigma \( v \) \)$, and scalar multiplier

$ n_omega^Lambda Q_q b_omega^(n_(upright(f))) J_(-)^flat \( Delta_(b_omega^(1 \/ m)) y \) \, $

where $n_omega^Lambda$ is the subgroup rectangle’s number of points. Its normalized cell volume is $Q_q b_omega^(n_(upright(f)))$. By (9.16), each scaled side mesh is at most one, so this scalar multiplier is also bounded uniformly.

Let $z$ be the product of the prescribed group elements, in the indicated order. Let $c_e$ be the product of the scalar multipliers, and let $R_v$ be the one indicated matrix. The raw weight is $c_e R_v$, with $\| c_e \| lt.eq C_epsilon$. Fix a finite grid in the complex disk of radius $C_epsilon + 1$, and round $c_e$ deterministically to a grid value $c_e^flat$ at distance at most a prescribed $epsilon'$. Define

$ W = c_e^flat R_v . $

Since $R_v$ is unitary, the rounding changes the expectation norm by at most $epsilon'$. The voltage $z$ is retained even when the weight is zero. In particular, the support of the voltage distribution is not conditioned on a nonzero weight.

All distributions in this prescription are finite. Linearity of expectation shows, term by term, that the raw expectation is the sum of the truncated Fourier masks times the appropriate first and second coefficient templates. Uniform sampling of a rectangle cancels exactly its point-count multiplier, and uniform sampling of a template pair and a frequency cancels their two count multipliers. The empirical lists give their specified averages. The preceding Subsections and the last rounding consequently show that we can arrange

#[#set math.equation(numbering: n => "(9.17)")
 $ upright(e s s thin s u p)_t parallel bb(E) \[ W rho \( z \) \] \( t \) - h_i \( t \) h_k \( t \) p \( t \) #scale(x: 120%, y: 120%)[parallel] lt.eq epsilon $ <sam:edge-mean>]

uniformly in $\( i \, k \)$.

Only the empirical-list matrices enter the tags. Their total number is at most $C_epsilon \( 1 + log q \) M$, from the ordinary lists and the single representative list. The final scalar grid has fixed finite cardinality depending on $epsilon$ alone. Thus the total number of weight tags has the same stated bound. The original tower alphabet has size $O \( d 2^r \( 1 + s \)^2 \)$. As $2^r = d^(7 \/ 4)$, their product is

$ O_epsilon #scale(x: 120%, y: 120%)[\(] d^(89 \/ 32) \( 1 + log d \)^3 #scale(x: 120%, y: 120%)[\)] = o \( d^3 \) = o \( d D \) . $

In particular, neither the possibly very large group-coordinate rectangles nor the number of different first-factor templates enlarge the label alphabet. Voltages are separate data of the cover.

There is a fixed constant $C$, independent of $i \, ell$, such that every coordinate of every possible $z$ in a block with first index $i$, and of its inverse, is bounded by

#[#set math.equation(numbering: n => "(9.18)")
 $ 2^(C H_i) . $ <sam:support>]

Indeed the logarithms of the template radii and of $K_i$ are $O \( log q + kappa \| i \| + 1 \) = O \( H_i \)$. The representative coordinates are bounded by $q$; the ordinary empirical terms lie in their specified rectangles. Fixed polynomial multiplication and inversion preserve a bound of the form (9.18).

The first factor supplies wide independent coordinates in a range overlapping that of (9.16). Namely, for every active first-factor template with $i lt.eq 2 I$,

#[#set math.equation(numbering: n => "(9.19)")
 $ a_nu^(- 1 \/ m) gt.eq 2^(2 E_0 H_i) $ <sam:first-width>]

for sufficiently large $ell$. For $0 lt.eq i lt.eq 2 I$, the lower bound $log_2 a_nu^(- 1) gt.eq log_2 q - C$, together with $H_i lt.eq 3 H_0 lt.eq 3 h_(*) log_2 d$ and $A_(*) \/ m > 10 E_0 h_(*)$, proves it. For $i < 0$, use instead

$ log_2 a_nu^(- 1) gt.eq log_2 q + kappa \| i \| - C $

and $H_i = H_0 + \| i \|$, with the same inequality for $A_(*)$ and the stronger chosen inequality for $kappa$. Every upper unitriangular entry in this first rectangle is sampled independently on an integer interval containing at least $2^(E_0 H_i)$ points. For $i gt.eq I$, every corresponding entry of the second-factor subgroup rectangle has at least that many possibilities in its step-$q$ interval. Fixed rectangle radii and integer rounding are harmless because (9.19) and (9.16) have an exponential margin.

=== 9.7 Girth with the same independent edge draws <girth-with-the-same-independent-edge-draws>

We use the Schwartz–Zippel polynomial zero bound, whose short proof we include. The sharp total-degree bound is due to Schwartz #cite(label("Schwartz1980")) Lemma 1, p. 702, and Corollary 1; Zippel’s sparse-interpolation work #cite(label("Zippel1979")) §3.1, Theorem 1 gives related coordinate-degree zero estimates, and DeMillo and Lipton #cite(label("DeMilloLipton1978")) earlier used random evaluations for polynomial identity testing. The minimum-side bound below is an immediate consequence of Schwartz’s estimate for unequal coordinate sets. If a nonzero polynomial of total degree at most $r$, over a field, is evaluated on independent uniform choices from finite sets of sizes at least $L$, its probability of vanishing is at most $r \/ L$. This follows by induction on the number of variables. Regard the polynomial as a polynomial of degree $s$ in the last variable; its leading coefficient is a nonzero polynomial of degree at most $r - s$. The probability that this coefficient vanishes is at most $\( r - s \) \/ L$; otherwise the one-variable root bound gives at most $s \/ L$. The constant case starts the induction. Arithmetic progressions of distinct integers are allowed as the finite sets.

Fix a nonempty cyclically nonbacktracking base walk $w$, based in layer $i$, of length $a lt.eq C_(*) H_i \/ log_2 d$. The layer indices along it satisfy $\| H_j - H_i \| lt.eq a + 1$, so their ratios to $H_i$ tend uniformly to one. If some positive-edge block encountered has first index $j_0 < I$, then all such first indices are at most $2 I$ when $ell$ is sufficiently large. To verify this also for very negative $j_0$, the length estimate and $H_i lt.eq H_(j_0) + a + 1$ give $a + 1 lt.eq epsilon.alt_ell H_(j_0)$, with $epsilon.alt_ell arrow.r 0$. The maximum first index is at most $j_0 + epsilon.alt_ell \( I + \| j_0 \| \)$. If $j_0 gt.eq 0$, this is at most $\( 1 + 2 epsilon.alt_ell \) I$; if $j_0 < 0$, it is at most $epsilon.alt_ell I$. In this case use the first-factor quotient of $F$ onto the upper unitriangular group. If there is no such block, every first index is at least $I$, and use the second upper unitriangular quotient. These are the two overlapping wide ranges just proved.

Assign an independent formal upper unitriangular matrix to each undirected edge in the support of $w$, using its inverse when the edge is traversed backwards. Lemma 30 says that the resulting word is not identically the identity. Its hypotheses apply because the support has the tower girth and the present walk has length at most the fixed $C_(*)$ scale. In particular, the integer $m$ used for this assertion was fixed at that scale. Some entry of this word minus the identity is therefore a nonzero polynomial in the upper entries of those edge matrices. Its total degree is at most $m - 1$. Indeed every term in the $\( u \, v \)$ entry of a product of upper unitriangular matrices, including inverse matrices expanded by the finite geometric series, has total superdiagonal weight $v - u$. Each variable has positive integer superdiagonal weight, so its ordinary total degree is at most $v - u lt.eq m - 1$. This bound is independent of the number of factors in the word.

Condition on the template choices, frequencies, empirical-list choices, the other transverse factor, and the other independently sampled coordinates. Do not condition on the final scalar weights. In the first-factor case the remaining upper entries have their independent uniform interval distributions. In the second-factor case the edge matrix is a random subgroup upper matrix multiplied on the right by its fixed representative upper matrix. Right multiplication by that fixed matrix is an invertible polynomial coordinate change over the reals. Replacing the subgroup entries by their multiples of $q$ is likewise an invertible linear coordinate change over the reals. Thus the nonzero word polynomial remains nonzero in the independently sampled entries. This also explains why weights that happen to vanish do not remove a voltage variable from this argument.

Each variable set has at least $2^(E_0 H_j)$ points at its local layer $j$. The polynomial estimate therefore bounds the conditional, and hence unconditional, probability of trivial holonomy by

$ \( m - 1 \) 2^(- E_0 min_j H_j) . $

There are at most

$ \( d + 1 \) 2^(H_i) sum_(1 lt.eq a lt.eq C_(*) H_i \/ log_2 d) \( 6 D \)^a lt.eq 2^(\( 3 C_(*) + 3 \) H_i) $

walks to test from all vertices of layer $i$, for sufficiently large $ell$. Here the rough bound counts all walks, and the maximum degree is at most $6 D$. Since $min_j H_j gt.eq \( 1 - o \( 1 \) \) H_i$ and $E_0 > 10 \( C_(*) + C_bullet + 1 \)$, the union bound is at most $C 2^(- 2 H_i)$ after increasing $ell$. Summing over all $i in bb(Z)$ gives a bound tending to zero.

A closed lift projects under a graph covering to a closed walk, and nonbacktracking, including the cyclic condition, is preserved. Trivial holonomy depends only on the base walk, not on which lift of its initial vertex is used. Consequently the tests just counted exclude every forbidden closed walk in the voltage cover.

=== 9.8 Centered moments, with cycle edges included <centered-moments-with-cycle-edges-included>

To control deviations from the block means, we expand even moments of the centered edge operators. Independence and centering make a term vanish whenever its base walk traverses an undirected edge exactly once. The next lemma counts the remaining walks when their supports have bounded cycle rank; its constants do not affect the earlier nilpotence parameter.

#thm([Lemma 9.5.])[
  #emph[Let a finite graph have maximum degree $Delta gt.eq 1$. Fix a vertex $v$ and an integer $l gt.eq 1$. Suppose the support of every closed walk under consideration has first Betti number at most $b$. The number of length-$2 l$ closed walks from $v$ in which no undirected edge occurs exactly once is at most 
$ C_b^l Delta^l . $

 Multiple edges, if present, are treated as distinct edges.]
] <sam:walk-count>

#proof[
  The support of such a walk is connected and has at most $l$ edges. Prune leaves other than $v$ successively, and retain the resulting rooted core $K$. If the support is a tree, the core is the single vertex $v$. Otherwise the core contains $v$, has no vertex of degree one other than possibly $v$, and has the same first Betti number as the support. Write $a$ for its edge count. The identity
  $ sum_(x in K) \( deg_K \( x \) - 2 \) = 2 b_1 \( K \) - 2 $
  gives a maximum-degree bound of $2 b + 2$. If $K$ has no edges, its maximum degree is zero. Otherwise all terms in the sum are nonnegative except possibly the root term, which is at least $- 1$. The parts removed by pruning are trees, each attached at exactly one core vertex. Otherwise a remaining cycle, or a path joining two core vertices, could not have been removed by the leaf procedure.
  There are at most $4^a Delta^a$ possibilities for a rooted connected subgraph $K$ with $a$ edges. We give an encoding that includes its cycle edges. Starting at $v$, when an as yet unmarked incident edge of $K$ is available, mark it, traverse it, and push that edge onto a stack. Explore recursively at its other endpoint, even if that vertex has been visited before. When this recursive call has exhausted its available unmarked edges, return along the pushed edge and pop it. Marking #emph[edges], rather than vertices, ensures that each edge, including every edge closing a cycle, is pushed exactly once and popped exactly once. The process explores the connected subgraph, and it has a balanced push/pop word of length $2 a$, at most $4^a$ possibilities. At a push, record the chosen incident edge, with at most $Delta$ possibilities. At a pop the edge is determined by the stack. Given the starting vertex, this code reconstructs the complete traversal and hence its edge set. One may make the encoding deterministic using fixed orders on incident edges. This proves the bound; it does not assume that the explored subgraph is a tree.
  Fix a possible core $K$. Encode a walk by declaring each step to be a core step, a tree descent away from the core, or a tree return toward the core. There are at most $3^(2 l)$ such words. For each core step there are at most $2 b + 2$ choices. A descent has at most $Delta$ choices, while a return is forced by the stack of the current tree excursion. Let $c$ be the number of core steps and $t$ the number of descents. Returns and descents are equally numerous, since each excursion begins and ends at its attachment vertex. Thus $2 t + c = 2 l$. Every core edge is used at least twice, by the no-singleton assumption, whence $c gt.eq 2 a$ and $t lt.eq l - a$.
  The number for this fixed core is bounded by $3^(2 l) \( 2 b + 2 \)^(2 l) Delta^(l - a)$. This is an upper bound even if some of the formal encodings fail to be valid tree excursions. Multiply by the core count and sum over $0 lt.eq a lt.eq l$. Since $l + 1 lt.eq 2^l$ and $4^a lt.eq 4^l$, the resulting bound is $#scale(x: 120%, y: 120%)[\(] 72 \( 2 b + 2 \)^2 #scale(x: 120%, y: 120%)[\)]^l Delta^l$, as required. ◻
]

Fix a block $\( i \, k \)$ of the actual surviving graph. Before degree normalization let $X_(i k)$ be its centered rectangular convolution matrix, with entries

$ \( X_(i k) \)_(a b) = sum_(e : a arrow.r b) #scale(x: 120%, y: 120%)[\(] W_e rho \( z_e \) - bb(E) \[ W_e rho \( z_e \) \] #scale(x: 120%, y: 120%)[\)] . $

Double it off the diagonal to a self-adjoint matrix. By (9.18), Lemma 42 applies with $x = 2^(H_i)$, simultaneously for every possible assignment of these finitely many edges. The row and column coefficient bounds are $O_epsilon \( D \)$. Choose the boundary exponent so that the absolute error in (9.8) tends uniformly to zero. Its finite test dimension, including all vertex, deck, and matrix indices, is bounded by

#[#set math.equation(numbering: n => "(9.20)")
 $ 2^(C_1 H_i) $ <sam:dimension>]

for a fixed $C_1$. To check this, the block has $O \( \( d + 1 \) 2^(H_i + 1) \)$ vertices, the deck box has $2^(O \( H_i \))$ points, and $N = q^(n_(upright(f))) = 2^(A_(*) n_(upright(f)) log_2 d) lt.eq 2^(O \( H_i \))$.

At this point fix a constant

#[#set math.equation(numbering: n => "(9.21)")
 $ C_2 > 2 \( C_1 + 4 \) \, #h(2em) l = ⌈C_2 H_i \/ log_2 d⌉ . $ <sam:C2-order>]

The tower girth implies that the support of every length-$2 l$ walk with no singleton edge has cycle rank bounded by a constant depending on $C_2$ alone, using Lemma 29. Indeed it has at most $l$ edges and lies in the two fixed layers $i \, k$, whose girth lower bounds are comparable to $H_i \/ \( 100 log_2 d \)$. The ratio of the edge count to that lower bound is bounded in terms of $C_2$. This use of Lemma 29 requires no identity test for a longer word. In particular $m$, which was fixed for the $C_(*)$ girth tests, is not increased when $C_2$ is chosen.

Let $hat(X)_(i k)$ denote the finite self-adjoint compression. Every centered compressed edge entry has norm at most $2 C_epsilon$. Expand $bb(E) "Tr" \( hat(X)_(i k)^(2 l) \)$ along the base-vertex indices. A summand whose walk has a singleton undirected edge has expectation zero: condition on the other edges, and the sole remaining factor is a centered entry or its adjoint. This remains true after deck compression. For the other walks, the absolute trace of the product on a fixed vertex’s deck and matrix indices is at most their dimension times $\( 2 C_epsilon \)^(2 l)$. Lemma 44, with $Delta lt.eq 6 D$, now gives

#[#set math.equation(numbering: n => "(9.22)")
 $ bb(E) "Tr" \( hat(X)_(i k)^(2 l) \) lt.eq 2^(C_1 H_i) \( C_4 D \)^l \, $ <sam:block-moment>]

where $C_4$ is fixed after $C_2$ and the accuracies have been chosen. It is independent of $i \, ell$. The exponent in the dimension bound has not changed in this argument.

Use the finite norm test and Markov’s inequality at threshold $epsilon sqrt(d D_(i k))$. For large $ell$, the absolute box error is less than half this threshold. Since $D \/ 2 lt.eq D_(i k) lt.eq 2 D$, (9.22) implies

#[#set math.equation(numbering: n => "(9.23)")
 $ bb(P) { parallel X_(i k) parallel > epsilon sqrt(d D_(i k)) } lt.eq 2^(C_1 H_i) \( C_5 \/ d \)^l . $ <sam:block-probability>]

The constant $C_5$ can be very large and can depend on $C_2$. Nevertheless it is fixed before increasing $ell$. Increase $ell$ so that $C_5 lt.eq d^(1 \/ 2)$. The right side is then at most $2^(\( C_1 - C_2 \/ 2 \) H_i) lt.eq 2^(- 4 H_i)$, by (9.21). Summing over the at most three blocks with each first index gives a total failure bound tending to zero.

=== 9.9 A simultaneous choice and the global norm <a-simultaneous-choice-and-the-global-norm>

For sufficiently large $ell$, the sum of the girth failure bounds and the block-norm failure bounds is less than one. In the countable independent product of the finite edge distributions, the union bound therefore gives positive probability that all requirements hold. There is also an elementary compactness formulation which avoids any need for an infinite sampling construction. Enumerate the countably many edge choices and the countably many requirements. Every requirement depends on only finitely many edges: this is immediate for a fixed walk, and a fixed block contains finitely many edges even though its convolution norm acts on an infinite deck space. Any finite collection of requirements is satisfiable by the finite-product union bound, using the same total budget below one. Choose assignments satisfying the first $n$ requirements and extend them arbitrarily to all other edges. Successive subsequences make the choice at each edge constant, since every edge has finitely many possible outcomes. The diagonal limit satisfies every requirement: once its finite set of edges has stabilized, the corresponding operators and voltages are exactly the same. Fix such an assignment.

It remains to combine the block errors. Because the distribution is common to all edges in a block, the expected normalized block equals the actual surviving normalized incidence tensored with its single-edge expectation. The surviving incidence is the compression of $U_(i k)^0$ and has norm at most one. Equation (9.17) therefore bounds its difference from the corresponding block of $Pi O Pi$ by $epsilon$. The simultaneous success of (9.23) bounds the centered normalized block by $epsilon$. A matrix with layer width one and block norms bounded by $epsilon$ has norm at most $3 epsilon$: apply Cauchy–Schwarz to each row and sum, or apply the scalar row-and-column Schur bound. Its self-adjoint off-diagonal doubling has the same norm. Consequently

$ parallel T_P - Pi O Pi parallel lt.eq 6 epsilon . $

Taking $epsilon < eta \/ 6$ proves (9.7). All expectation errors used above were made smaller than this chosen $epsilon$ by first fixing compact cutoffs, log-grid spacing, empirical accuracies, Fourier cutoffs, and scalar rounding, and then increasing $ell$. The order of the constants is thus: the geometric and nilpotence parameters; the fixed desired accuracy and its coefficient data; the finite test exponent $C_1$; the moment constant $C_2$; and finally $ell$. All estimates are uniform in the layers. This proves Theorem 41.

== 10 From the cover band to the Cayley projection <spec:section>

Lemma 40 identifies the model’s separated upper space; Theorem 41 supplies a voltage-cover approximation to its compression. We now transfer the band to that cover and then to the Cayley graph. Disjoint assigned domains give the spectral comparison, while all indexed copies will give an equivariant comparison of traces.

Retain the gap $chi$, deleted fraction $beta_ell$, model $O \( t \)$, and upper projection $E_(*) \( t \)$ from the preceding section. With $frak(w)_i = 2^(C_bullet H_i)$, Proposition 39 gives

#[#set math.equation(numbering: n => "(10.1)")
 $ mu_ell := sup_(0 < t < delta\
i in J \( t \)) frak(w)_i thin "tr"_(upright("id")) p \( t \) = o \( 1 \) . $ <spec:weighted-input>]

The trace here and throughout this section includes the ordinary, #emph[unnormalized] sum over the $N$ matrix indices.

Theorem 41 supplies, for any fixed accuracy $eta > 0$ and all sufficiently large $ell$, an actual self-adjoint weighted adjacency $T_P$ on the voltage cover, satisfying Equation (9.7). Thus

#[#set math.equation(numbering: n => "(10.2)")
 $ parallel T_P - Pi O Pi parallel lt.eq eta \, $ <spec:approx-input>]

where $Pi$ deletes the removed base vertices, and $T_P$ is extended by zero on those vertices. Both operators in Equation (10.2) have layer width one. Every edge weight before normalization has norm at most a fixed $C_eta$, the normalized weight is determined by its augmented label, and the finite positive alphabet $S$ satisfies $\| S \| = o \( d D \)$. The cover satisfies the girth hypothesis of Theorem 15. That Theorem provides the indexed embedded copies, their disjoint assigned domains, the finite trimming balls, the incidence count, the remaining forest, and the torsion-freeness of $Gamma_(upright("proj"))$. In particular these are conclusions proved before this section, rather than additional spectral assumptions.

=== 10.1 Compression and norm perturbation <compression-and-norm-perturbation>

We record quantitative Hilbert-space estimates, including the projection equivalences needed later for the trace.

#thm([Lemma 10.1.])[
  (Compression of a separated upper space).  #emph[Let $A = A^(*)$ on a Hilbert space, with $parallel A parallel lt.eq 2$, and let $E$ be a reducing projection such that 
$ parallel \( A - I \) E parallel lt.eq a \, #h(2em) A \|_(\( 1 - E \) cal(H)) lt.eq \( 1 - b \) I \, #h(2em) 0 < b < 1 . $

 Let $J$ be an orthogonal projection with $epsilon := parallel \( 1 - J \) E parallel lt.eq 1 \/ 2$. The operator $J E$ has closed range. Writing $E^J$ for the projection onto that range, put, on $J cal(H)$, 
#[#set math.equation(numbering: n => "(10.3)")
 $ B_J = E^J + \( J - E^J \) A \( J - E^J \) . $ <spec:compression-model>]

 Then 
#[#set math.equation(numbering: n => "(10.4)")
 $ parallel J A J - B_J parallel lt.eq a + 20 epsilon \, #h(2em) B_J \|_(\( J - E^J \) cal(H)) lt.eq \( 1 - b \) I \, #h(2em) parallel B_J parallel lt.eq 2 . $ <spec:compression-error>]

 There is a partial isometry $V$ with $V^(*) V = E$, $V V^(*) = E^J$, and $parallel V - E parallel lt.eq 2 epsilon$. If $A \, E \, J$ commute with a specified unitary or projective unitary action, then so do all the projections and maps just constructed. In particular, in a setting with the identity trace of Lemma 32, $E$ and $E^J$ have equal identity traces. These statements include $E = 0$.]
] <spec:compression>

#proof[
  In the corner $E cal(H)$,
  $ \( 1 - epsilon^2 \) E lt.eq E J E lt.eq E . $
  Thus $J E$ is bounded below on $E cal(H)$, and
  $ V = J E \( E J E \)^(- 1 \/ 2) $
  is the asserted partial isometry. The inverse is taken in the $E$ corner. For $epsilon lt.eq 1 \/ 2$, functional calculus gives $parallel \( E J E \)^(- 1 \/ 2) - E parallel lt.eq 2 epsilon^2$, whence $parallel V - E parallel lt.eq epsilon + 2 epsilon^2 lt.eq 2 epsilon$. Every vector in $\( J - E^J \) cal(H)$ is orthogonal to $E cal(H)$: if $J y = y$ and $y perp J E cal(H)$, then $chevron.l y \, E x chevron.r = chevron.l y \, J E x chevron.r = 0$. This proves the complementary upper bound in Equation (10.4).
  Transporting the $E^J$ corner by $V$ yields
  $ parallel V^(*) A V - E parallel lt.eq a + 2 parallel A parallel thin parallel V - E parallel lt.eq a + 8 epsilon . $
  Reduction by $E$ and the preceding orthogonality also give
  $ parallel \( J - E^J \) A V parallel = parallel \( J - E^J \) A \( V - E \) parallel lt.eq 4 epsilon . $
  The difference between $J A J$ and Equation (10.3) has just this pair of adjoint off-diagonal blocks and the estimated upper diagonal block. The norm of the paired off-diagonal blocks is the norm of either one. Its total norm is at most $a + 12 epsilon$, and therefore at most the stated $a + 20 epsilon$. The orthogonal two-part form of $B_J$ gives $parallel B_J parallel lt.eq 2$. Equivariance follows from the formulas and functional calculus. Equality of the two traces follows from the adjoint-square identity for $V$ in Lemma 32. ◻
]

#thm([Lemma 10.2.])[
  (An elementary contour estimate).  #emph[Suppose $B = B^(*)$ has a reducing projection $F$ with $B F = F$, and its complementary spectrum is contained in $\[ - 2 \, 1 - b \]$, where $0 < b < 1$. Let $r_0 > 0$ satisfy $r_0 lt.eq b \/ 2$ and $r_0 < 1$. If $A = A^(*)$ and $parallel A - B parallel lt.eq u < r_0$, the circle $cal(C)_(r_0) = { z : \| z - 1 \| = r_0 }$ lies in the resolvent sets of both operators. The enclosed spectral projection $F_A$ satisfies 
#[#set math.equation(numbering: n => "(10.5)")
 $ parallel F_A - F parallel lt.eq frac(u, r_0 - u) . $ <spec:projection-distance>]

 Its enclosed spectrum lies in $\[ 1 - u \, 1 + u \]$; all the other spectrum of $A$ is at most $1 - b + u$. If $u < r_0 \/ 2$, the projections $F_A$ and $F$ are equivalent by a partial isometry belonging to the algebra of bounded operators generated by them. This equivalence preserves any common equivariance and its identity trace.]
] <spec:perturbation>

#proof[
  On $cal(C)_(r_0)$ one has $parallel \( z - B \)^(- 1) parallel lt.eq r_0^(- 1)$. The resolvent Neumann series gives $parallel \( z - A \)^(- 1) parallel lt.eq \( r_0 - u \)^(- 1)$. The resolvent identity and integration around the circle then give Equation (10.5). For a real number at distance greater than $u$ from $"spec" B$, the same Neumann argument proves it is outside $"spec" A$. This yields the asserted spectral intervals.
  For completeness, if projections $F_1 \, F_2$ have $parallel F_1 - F_2 parallel < 1$, the map $F_2 F_1$ is bounded below on $F_1 cal(H)$, since $parallel F_2 x parallel gt.eq \( 1 - parallel F_1 - F_2 parallel \) parallel x parallel$ there. Its range is all of $F_2 cal(H)$: a vector in that space orthogonal to its range would satisfy $F_1 x = 0$ and hence $parallel \( F_2 - F_1 \) x parallel = parallel x parallel$. Its polar normalization
  $ F_2 F_1 \( F_1 F_2 F_1 \)^(- 1 \/ 2) $
  therefore has initial projection $F_1$ and final projection $F_2$. Apply this with $F_1 = F$, $F_2 = F_A$. The equivariance and trace conclusions follow from these formulas and Lemma 32. ◻
]

Set

#[#set math.equation(numbering: n => "(10.6)")
 $ alpha = chi \/ 1000 \, #h(2em) r_0 = chi \/ 3 \, #h(2em) C_chi = 4 \/ chi . $ <spec:accuracy-constants>]

Choose the fixed approximation accuracy $eta > 0$ so small that

#[#set math.equation(numbering: n => "(10.7)")
 $ eta lt.eq alpha \/ 2 \, #h(2em) theta := C_chi eta lt.eq 1 \/ 2 \, #h(2em) 2^(C_bullet) theta^2 lt.eq 1 \/ 2 . $ <spec:eta-choice>]

The other fixed parameters of the construction have already been chosen; Theorem 41 permits this accuracy. We subsequently take $ell$ sufficiently large that

#[#set math.equation(numbering: n => "(10.8)")
 $ 20 sqrt(beta_ell) lt.eq alpha \/ 2 . $ <spec:deletion-choice>]

All inequalities below concern such $ell$ and are uniform in the layers.

#thm([Proposition 10.3.])[
  (The actual cover projection and its exact fiber trace).  #emph[The operator $T_P$ has a separated upper spectral projection $E_P$, obtained by integration around $cal(C)_(r_0)$. It satisfies 
#[#set math.equation(numbering: n => "(10.9)")
 $ parallel T_P parallel lt.eq 2 \, #h(2em) parallel \( T_P - I \) E_P parallel lt.eq alpha \, #h(2em) T_P \|_(\( 1 - E_P \) cal(H)) lt.eq \( 1 - chi + alpha \) I . $ <spec:cover-gap>]

 In the central direct integral, for almost every $t$, 
#[#set math.equation(numbering: n => "(10.10)")
 $ "tr"_(upright("id")) E_P \( t \) = cases(delim: "{", "tr"_(upright("id")) p \( t \) \, & 0 < t < delta \,, 0 \, & t in.not \( 0 \, delta \) .) $ <spec:exact-fiber-trace>]

 The projection $E_P$ is nonzero and reduces to the connected components of $P$. Its diagonal at a lifted vertex depends only on the base vertex.]
] <spec:cover-projection>

#proof[
  Apply Lemma 45 to $O \( t \) \, E_(*) \( t \) \, Pi$ with $a = 0$ and $b = chi$. Extend its two-part comparison operator by zero on $\( 1 - Pi \) cal(H)_t^0$. The extended complementary part is still at most $1 - chi$, because $1 - chi > 0$. Denote its upper projection by $E_(*)^Pi \( t \)$. Equations (10.2), (10.8), and (10.7) show that $T_P \( t \)$ differs from this comparison operator by at most $alpha$ for almost every $t$. The passage from the full regular norm in Equation (10.2) to this almost-everywhere statement is the direct-integral norm formula from the fiber construction. Lemma 46 with $r_0 = chi \/ 3$ gives a common contour, Equation (10.9), and
  $ parallel E_P \( t \) - E_(*)^Pi \( t \) parallel lt.eq frac(alpha, r_0 - alpha) < 1 . $
  All these fields are measurable by the resolvent formulas, and their uniform bounds define the corresponding bounded direct-integral operators. The norm bound also follows directly from $parallel Pi O Pi parallel lt.eq 1$ and $eta < 1$.
  Both the compression equivalence and the close-projection equivalence commute with the fiber right actions used to define the identity trace. Lemma 32 and Lemma 40 therefore imply the equality of traces in Equation (10.10), with no approximation error. Outside the window the model is zero and $parallel T_P \( t \) parallel lt.eq eta$ almost everywhere. Consequently its contour projection is exactly zero there. This conclusion uses the small norm of the Fourier-mask leakage supplied by Theorem 41; it does not require the finite Fourier masks to vanish exactly.
  Since $"tr"_(upright("id")) p \( t \) > 0$ on the interval of positive measure $\( 0 \, delta \)$, Equation (10.10) makes $E_P$ nonzero. Every component subspace reduces the actual adjacency $T_P$, and hence its resolvent and $E_P$. Left deck translations commute with $T_P$, since its entries are right deck translations with the prescribed matrix coefficients. They therefore commute with $E_P$. They send any lift of a fixed base vertex to every other lift, proving the last assertion, even when they permute different connected components. ◻
]

=== 10.2 Localization of identity trace <localization-of-identity-trace>

For a surviving base vertex $v$, let

#[#set math.equation(numbering: n => "(10.11)")
 $ e_v = sum_(j = 1)^N chevron.l E_P \( delta_(\( v \, 1_F \)) ⊗ e_j \) \, delta_(\( v \, 1_F \)) ⊗ e_j chevron.r gt.eq 0 \, #h(2em) cal(S) = sum_(i in bb(Z)) frak(w)_i sum_(v in V \( Y \) ∩ \( A_i union B_i \)) e_v . $ <spec:weighted-size>]

Here $e_j$ denotes the standard matrix basis; put $e_v = 0$ at a deleted base vertex when summing over $Y^0$. These are regular identity diagonals before the central Fourier decomposition.

The weights record the two counts in Equations (7.11) and (7.11). A fixed base type may have many lifts inside one trimming ball, while the sum of losses over copies carries a ball-size factor from Cauchy–Schwarz. Controlling $cal(S)$ will keep both forms of overlap loss small.

#thm([Proposition 10.4.])[
  (The weighted size tends to zero).  #emph[For the fixed choice of $eta$ in Equation (10.7), 
#[#set math.equation(numbering: n => "(10.12)")
 $ cal(S) lt.eq 96 mu_ell = o \( 1 \) . $ <spec:S-small>]

 In particular the bound contains no additional factor equal to a layer cardinality or to the matrix dimension already included in $mu_ell$.]
] <spec:localization>

#proof[
  Write $A_0 \( t \) = Pi O \( t \) Pi$ and $Delta \( t \) = T_P \( t \) - A_0 \( t \)$. The comparison operator in the proof of Proposition 47 is within $alpha \/ 2$ of $A_0 \( t \)$. Therefore on $cal(C)_(r_0)$,
  #[#set math.equation(numbering: n => "(10.13)")
   $ R_0 \( z \, t \) = \( z - A_0 \( t \) \)^(- 1) \, #h(2em) parallel R_0 \( z \, t \) parallel lt.eq \( r_0 - alpha \/ 2 \)^(- 1) lt.eq C_chi . $ <spec:model-resolvent>]
  Let $P_i$ be the projection to both sides of layer $i$, including all transverse and matrix coordinates. The operator $A_0 \( t \)$ is supported on the active layers $J \( t \)$. Thus its resolvent is $z^(- 1) I$ on the orthogonal sum of the other layers, and has no matrix entries between that sum and the active layers. Since $Delta \( t \)$ has layer width one, its resolvent expansion is the norm-convergent series
  #[#set math.equation(numbering: n => "(10.14)")
   $ \( z - T_P \( t \) \)^(- 1) = sum_(n = 0)^oo R_0 \( z \, t \) \( Delta \( t \) R_0 \( z \, t \) \)^n . $ <spec:resolvent-series>]
  If $k = "dist" \( i \, J \( t \) \)$ and $n < k$, all layer paths contributing after multiplication on the left by $P_i$ remain outside $J \( t \)$. Each resolvent factor along such a path equals $z^(- 1) I$; equivalently, by induction on the number of width-one factors,
  $ P_i R_0 \( z \, t \) \( Delta \( t \) R_0 \( z \, t \) \)^n = z^(- n - 1) P_i Delta \( t \)^n #h(2em) \( n < k \) . $
  Its contour integral is zero, because the circle excludes zero. Integrate the remaining terms of Equation (10.14) and use Equation (10.13). On the window this gives
  #[#set math.equation(numbering: n => "(10.15)")
   $ parallel P_i E_P \( t \) parallel lt.eq frac(r_0 C_chi, 1 - theta) theta^k lt.eq 4 theta^("dist" \( i \, J \( t \) \)) . $ <spec:layer-norm>]
  This estimate is also valid when $k = 0$; there is then no vanishing initial segment to remove.
  Let $frak(t)_t$ denote the identity trace, summed over all base and matrix indices of the fiber. It applies to the countable amplification by Lemma 32. Since $P_i$ and $E_P \( t \)$ are equivariant, the adjoint-square identity and positivity imply
  #[#set math.equation(numbering: n => "(10.16)")
   $ frak(t)_t \( P_i E_P \( t \) P_i \) & = frak(t)_t \( E_P \( t \) P_i E_P \( t \) \)\
 & lt.eq parallel P_i E_P \( t \) parallel^2 thin frak(t)_t \( E_P \( t \) \)\
 & lt.eq 16 theta^(2 "dist" \( i \, J \( t \) \)) "tr"_(upright("id")) p \( t \) . $ <spec:layer-trace>]
  The middle inequality follows from the operator inequality $0 lt.eq E_P \( t \) P_i E_P \( t \) lt.eq parallel P_i E_P \( t \) parallel^2 E_P \( t \)$. Thus it is the #emph[total trace of the projection], rather than the dimension of the layer, that occurs.
  The elementary bound $\| H_i - H_j \| lt.eq \| i - j \|$ implies $frak(w)_i lt.eq frak(w)_j 2^(C_bullet \| i - j \|)$. Assign every integer to one of its closest points in the nonempty set $J \( t \)$. At most two integers at each positive distance can be assigned to a given point. Since $\| J \( t \) \| lt.eq 2$, Equation (10.7) gives
  $ sum_i frak(w)_i theta^(2 "dist" \( i \, J \( t \) \)) & lt.eq 2 max_(j in J \( t \)) frak(w)_j (1 + 2 sum_(k gt.eq 1) \( 2^(C_bullet) theta^2 \)^k)\
 & lt.eq 6 max_(j in J \( t \)) frak(w)_j . $
  Multiplying Equation (10.16) by $frak(w)_i$ and summing proves a pointwise bound of $96 mu_ell$ for the weighted fiber trace. The projection vanishes off the window by Equation (10.10). Central Fourier decomposition identifies $e_v$ with the integral of its fiber identity diagonal. Tonelli’s Theorem applies to the nonnegative diagonals and sums, so integrating over the probability circle proves Equation (10.12). ◻
]

=== 10.3 An actual element of the matrix reduced group algebra <an-actual-element-of-the-matrix-reduced-group-algebra>

Use the finite alphabet supplied by Theorem 41 to form the group $Gamma_(upright("proj"))$ of Theorem 15. For a positive label $sigma$, let $W_sigma$ be its matrix weight and let $D_sigma = D_(i k)$ be its label-determined degree normalizer. Put

#[#set math.equation(numbering: n => "(10.17)")
 $ w_sigma = \( d D_sigma \)^(- 1 \/ 2) W_sigma \, #h(2em) \( T xi \) \( g \) = sum_(sigma in S) #scale(x: 120%, y: 120%)[\(] w_sigma xi \( g sigma \) + w_sigma^(*) xi \( g sigma^(- 1) \) #scale(x: 120%, y: 120%)[\)] . $ <spec:Cayley-operator>]

This is a finite sum of bounded matrix coefficients times right regular translations. It is self-adjoint, and inversion of the group coordinate identifies it with an element of $M_N \( bb(C) \[ Gamma_(upright("proj")) \] \)$ in the left regular convention. In particular $T in M_N \( C_r^(*) \( Gamma_(upright("proj")) \) \)$. We use the right convention in the proof, so that $T$ commutes with left translations of $Gamma_(upright("proj"))$.

For an indexed copy $Q$, let $T_Q$ be the adjacency using just its own formal edges. The embedding and labels identify it with the restriction of $T_P$ to the source component. Let $E_Q$ be its upper spectral projection on $cal(C)_(r_0)$. Equation (10.9) holds for $T_Q \, E_Q$, and if an incidence $\( Q \, u \)$ has base type $v$,

#[#set math.equation(numbering: n => "(10.18)")
 $ "Tr"_(bb(C)^N) E_Q \( u \, u \) = e_v . $ <spec:copy-diagonal>]

The equation follows from component reduction and deck equivariance in Proposition 47; it does not require the connected component to be invariant under every deck translation.

#thm([Lemma 10.5.])[
  (Finite trimming costs little operator norm).  #emph[Let $D_Q$ and $B \( Q \)$ be the assigned domain and trimming ball from Theorem 15. Then 
#[#set math.equation(numbering: n => "(10.19)")
 $ parallel upright(bold(1))_(B \( Q \)) E_Q parallel^2 lt.eq cal(S) . $ <spec:ball-HS>]

 For $cal(S) lt.eq 1 \/ 4$, the compression of $T_Q$ to $ell^2 \( D_Q \) ⊗ bb(C)^N$ is within $alpha + 20 sqrt(cal(S))$ of an operator $C_Q$ which is $1$ on a projection $F_Q$ equivalent to $E_Q$, has norm at most $2$, and is at most $1 - chi + alpha$ on the complementary space. In particular $F_Q eq.not 0$ whenever $E_Q eq.not 0$.]
] <spec:copy-cut>

#proof[
  The ball is finite. For the ordinary Hilbert–Schmidt norm on vertex and matrix indices, the projection identity gives
  $ parallel upright(bold(1))_(B \( Q \)) E_Q parallel^2 lt.eq parallel upright(bold(1))_(B \( Q \)) E_Q parallel_(upright("HS"))^2 = sum_(u in B \( Q \)) "Tr"_(bb(C)^N) E_Q \( u \, u \) . $
  A fixed base vertex $v$ can occur at multiple lifts in the ball. Its multiplicity is at most $\| B \( Q \) \|$, and whenever it occurs in layer $i$, the ball bound in Theorem 15 gives $\| B \( Q \) \| lt.eq frak(w)_i$. Grouping the nonnegative sum by base vertex, using Equation (10.18), bounds it by $sum_i frak(w)_i sum_(v in A_i union B_i) e_v = cal(S)$. This proves Equation (10.19) with repetitions included.
  The missing vertices $V \( Q \) \\ D_Q$ lie in $B \( Q \)$. Apply Lemma 45 with $A = T_Q$, $E = E_Q$, $J = upright(bold(1))_(D_Q)$, $a = alpha$, $b = chi - alpha$, and $epsilon lt.eq sqrt(cal(S))$. Its operator $B_J$ is the required $C_Q$ and its projection $E^J$ is $F_Q$. The explicit partial isometry in Lemma 45 proves the nonvanishing assertion. ◻
]

#thm([Lemma 10.6.])[
  (Matrix adjacency on a forest).  #emph[Suppose a countable forest has maximum degree at most $m_1$, and a self-adjoint adjacency on it has matrix edge weights of norms at most $w_1$. Its norm is at most $2 w_1 sqrt(m_1)$.]
] <spec:forest-norm>

#proof[
  Choose one root in each tree and orient every edge from parent to child. Let $B$ carry the contribution from the parent coordinate to the child coordinate, with the corresponding matrix weight. Every nonroot vertex has only one parent. Hence for a finitely supported vector $xi$,
  $ parallel B xi parallel^2 lt.eq w_1^2 sum_x \# { upright("children of ") x } thin parallel xi \( x \) parallel^2 lt.eq m_1 w_1^2 parallel xi parallel^2 . $
  The self-adjoint adjacency is $B + B^(*)$, which proves the assertion first on finitely supported vectors and then by bounded extension. Infinite trees cause no extra term; each connected tree is rooted at an ordinary vertex and its finite-distance parent relation is well-defined. ◻
]

#thm([Proposition 10.7.])[
  (A nonzero upper band in the reduced representation).  #emph[For sufficiently large $ell$, the operator in Equation (10.17) satisfies 
#[#set math.equation(numbering: n => "(10.20)")
 $ "spec" T subset \( - oo \, 1 - chi + 4 alpha \] thin union \[ 1 - 3 alpha \, 1 + 3 alpha \] . $ <spec:global-spectrum>]

 The second spectral part is nonempty. Its projection 
#[#set math.equation(numbering: n => "(10.21)")
 $ p_0 = upright(bold(1))_(\[ 1 - chi \/ 4 \, oo \)) \( T \) in M_N \( C_r^(*) \( Gamma_(upright("proj")) \) \) $ <spec:p0>]

 is consequently nonzero.]
] <spec:global-gap>

#proof[
  Increase $ell$ so that
  #[#set math.equation(numbering: n => "(10.22)")
   $ cal(S) < min { 1 \/ 4 \, 1 \/ 1000 } \, #h(2em) 20 sqrt(cal(S)) lt.eq alpha . $ <spec:S-final-choice>]
  The assigned domains are disjoint. Form the bounded orthogonal direct sum
  $ C = xor.big_Q C_Q xor 0 \, #h(2em) F_D = xor.big_Q F_Q xor 0 \, $
  where the extra zero acts on all unassigned vertices. The uniform norm bound in Lemma 49 proves these are bounded operators on the ambient $ell^2 \( Gamma_(upright("proj")) \) ⊗ bb(C)^N$. The direct sum $C$ is $1$ on $F_D$, has norm at most $2$, and is at most $1 - chi + alpha$ on $1 - F_D$. The zero summand satisfies this upper bound because $1 - chi + alpha > 0$.
  At least one component of $P$ has a nonzero upper projection, since $E_P eq.not 0$. Its label maps give indexed copies, and Lemma 49 preserves the nonzero upper space in every such copy. Thus $F_D eq.not 0$. This argument uses the ordinary direct sum and does not assert that the domain assignment is equivariant.
  Let $T_D$ denote the direct sum of the compressed $T_Q$, extended by zero on unassigned vertices. Lemma 49 gives $parallel T_D - C parallel lt.eq 2 alpha$. On every formal edge internal to an assigned copy domain, $T_D$ has exactly the same matrix coefficient as $T$, because that coefficient is determined by the label. Disjointness of the domains and the formal-edge embeddings prevent double counting of these internal edges. By the forest conclusion of Theorem 15, the remaining formal edges form a forest. Consequently $T - T_D$ is precisely a matrix adjacency of the kind in Lemma 50. Its maximum degree is at most $2 \| S \|$ and its weight norm is at most
  $ w_1 lt.eq frac(sqrt(2) C_eta, sqrt(d D)) . $
  It follows that
  #[#set math.equation(numbering: n => "(10.23)")
   $ f_ell := parallel T - T_D parallel lt.eq 4 C_eta sqrt(frac(\| S \|, d D)) = o \( 1 \) . $ <spec:forest-error>]
  Take $ell$ still larger so that $f_ell lt.eq alpha$. Then $parallel T - C parallel lt.eq 3 alpha$. Lemma 46, with $b = chi - alpha$ and the same $r_0 = chi \/ 3$, proves Equation (10.20). It also shows that the enclosed projection of $T$ has distance at most $3 alpha \/ \( r_0 - 3 alpha \) < 1$ from the nonzero projection $F_D$, so it is nonzero. Since $alpha = chi \/ 1000$, the number $1 - chi \/ 4$ lies strictly between the two intervals in Equation (10.20).
  The represented reduced algebra is a unital $C^(*)$-subalgebra of the bounded operators and contains $T$. For clarity, its spectrum for this self-adjoint element equals the operator spectrum: a resolvent away from the real spectrum is obtained by continuous functional calculus, or by uniformly approximating the reciprocal on that compact spectrum with polynomials in $T$ and the identity. The function that equals zero on the lower interval and one on the upper interval is continuous on the spectrum. Continuous functional calculus therefore gives precisely the spectral projection in Equation (10.21) as an element of $M_N \( C_r^(*) \( Gamma_(upright("proj")) \) \)$. ◻
]

=== 10.4 Equivariant size of all local upper spaces <equivariant-size-of-all-local-upper-spaces>

The comparison with the assigned domains proves spectral separation, but their ordering need not be equivariant. Thus the ordinary equivalence with $F_D$ does not by itself compare canonical traces. For the trace estimate we return to all indexed copies. Their upper spaces form an equivariant space of small trace, and we will show that the common kernel of the corresponding restrictions contains no nonzero vector of the global upper space.

Write $cal(H) = ell^2 \( Gamma_(upright("proj")) \) ⊗ bb(C)^N$. For a left $Gamma_(upright("proj"))$-equivariant positive operator $Z$ on $ell^2 \( Gamma_(upright("proj")) \) ⊗ cal(K)$, with a fixed countable orthonormal basis $\( k_a \)$ of $cal(K)$, its identity trace is

#[#set math.equation(numbering: n => "(10.24)")
 $ "Tr"_(Gamma_(upright("proj"))) Z = sum_a chevron.l Z \( delta_1 ⊗ k_a \) \, delta_1 ⊗ k_a chevron.r in \[ 0 \, oo \] . $ <spec:equivariant-trace>]

The size of a closed invariant subspace is the identity trace of its orthogonal projection. Lemma 32 proves basis independence, the adjoint-square trace identity, and invariance under equivariant partial isometries in these countably amplified spaces. In particular the size of $p_0 cal(H)$ is

$ tau_(Gamma_(upright("proj")) \, N) \( p_0 \) = sum_(j = 1)^N tau_(Gamma_(upright("proj"))) \( \( p_0 \)_(j j) \) \, $

with no division by $N$.

Consider the Hilbert space and projection

#[#set math.equation(numbering: n => "(10.25)")
 $ cal(L) = xor.big_Q #scale(x: 120%, y: 120%)[\(] ell^2 \( V \( Q \) \) ⊗ bb(C)^N #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(E) = xor.big_Q E_Q . $ <spec:all-copies>]

Left translation acts simultaneously on $Q$ and its vertices. The incidence bijection of Proposition 25 identifies this representation, including matrix indices, with

#[#set math.equation(numbering: n => "(10.26)")
 $ cal(L) tilde.equiv ell^2 \( Gamma_(upright("proj")) \) ⊗ ell^2 \( V \( Y \) \) ⊗ bb(C)^N . $ <spec:incidence-identification>]

More explicitly, $\( Q \, u \)$ is sent to $\( u \, v \)$ where $v$ is its base type. For each $u in Gamma_(upright("proj"))$ and $v in V \( Y \)$ there is exactly one such incidence: choose any lift of $v$, map its component with that lift sent to $u$, and use the deck-alignment equivalence in the definition of indexed copies. Different lift choices give the same incidence, and any incidence arises this way. The injective label maps ensure that the base type is unambiguous. This count is valid for disconnected covers and for copies with nontrivial, possibly infinite stabilizers. The action on the pairs $\( Q \, u \)$ is free because it is free on their group vertex $u$; freeness of the action on the set of copies is unnecessary.

The operator $cal(E)$ is equivariant in this representation. Its identity diagonal at the base type $v$ has matrix sum $e_v$, by Equation (10.18). Hence

#[#set math.equation(numbering: n => "(10.27)")
 $ "Tr"_(Gamma_(upright("proj"))) cal(E) = cal(S)_0 := sum_(v in V \( Y \)) e_v lt.eq cal(S) < oo . $ <spec:all-copies-size>]

Thus $cal(U) := cal(E) cal(L)$ is a closed invariant space of finite identity trace, even though there are countably many copies and base vertices.

#thm([Lemma 10.8.])[
  (The total loss from earlier intersections).  #emph[Put $I_Q = V \( Q \) \\ D_Q subset B \( Q \)$. For every $xi in cal(H)$, 
#[#set math.equation(numbering: n => "(10.28)")
 $ sum_Q parallel E_Q \( xi \|_(I_Q) \) parallel^2 lt.eq cal(S) parallel xi parallel^2 \, $ <spec:all-copy-cut-loss>]

 where restrictions are extended by zero inside their copies.]
] <spec:lost-restrictions>

#proof[
  Write $v \( Q \, u \) = "type"_Q \( u \)$ for the base type of an incidence, and $i \( v \)$ for the layer of a base vertex $v$. For a vector $z in bb(C)^N$ supported at $u in V \( Q \)$, positivity of the diagonal matrix and Equation (10.18) give
  $ parallel E_Q \( delta_u ⊗ z \) parallel^2 = chevron.l E_Q \( u \, u \) z \, z chevron.r lt.eq e_(v \( Q \, u \)) parallel z parallel^2 . $
  The set $I_Q$ is finite. Cauchy–Schwarz for its sum therefore gives
  #[#set math.equation(numbering: n => "(10.29)")
   $ parallel E_Q \( xi \|_(I_Q) \) parallel^2 lt.eq \| B \( Q \) \| sum_(u in I_Q) e_(v \( Q \, u \)) thin parallel xi \( u \) parallel^2 . $ <spec:finite-cut-CS>]
  The right-hand side is zero for an empty cut. If $u in I_Q$ has base type in layer $i$, the ball bound gives $\| B \( Q \) \| lt.eq frak(w)_i$. Rearranging nonnegative terms yields
  $ sum_Q parallel E_Q \( xi \|_(I_Q) \) parallel^2 & lt.eq sum_(u in Gamma_(upright("proj"))) parallel xi \( u \) parallel^2 sum_(Q : u in I_Q) \| B \( Q \) \| e_(v \( Q \, u \))\
 & lt.eq sum_(u in Gamma_(upright("proj"))) parallel xi \( u \) parallel^2 sum_(Q : u in V \( Q \)) frak(w)_(i \( v \( Q \, u \) \)) e_(v \( Q \, u \))\
 & = cal(S) parallel xi parallel^2 . $
  The final equality is the all-copy incidence count at the fixed vertex $u$. In particular the factor $\| B \( Q \) \|$ from Cauchy–Schwarz is paid by the layer weight in $cal(S)$; it is not discarded or assumed uniformly bounded. ◻
]

Together with disjointness of the $D_Q$, this controls the restriction map to all upper spaces.

#thm([Lemma 10.9.])[
  (A bounded restriction operator and a size bound).  #emph[The formula 
#[#set math.equation(numbering: n => "(10.30)")
 $ A xi = #scale(x: 120%, y: 120%)[\(] E_Q \( xi \|_(V \( Q \)) \) #scale(x: 120%, y: 120%)[\)]_Q quad \( xi in cal(H) \) $ <spec:analysis-operator>]

 defines a bounded equivariant operator $A : cal(H) arrow.r cal(U)$, with $parallel A parallel lt.eq 1 + sqrt(cal(S))$. Its kernel $K$ is a closed invariant subspace, and every $xi in K$ satisfies 
#[#set math.equation(numbering: n => "(10.31)")
 $ E_Q \( xi \|_(V \( Q \)) \) = 0 quad upright("for every indexed ") Q . $ <spec:kernel-restrictions>]

 Moreover, 
#[#set math.equation(numbering: n => "(10.32)")
 $ "Tr"_(Gamma_(upright("proj"))) P_(K^perp) lt.eq cal(S)_0 . $ <spec:kernel-complement-size>]

]
] <spec:restriction>

#proof[
  Since the $D_Q$ are pairwise disjoint and each $E_Q$ is a contraction,
  $ sum_Q parallel E_Q \( xi \|_(D_Q) \) parallel^2 lt.eq sum_Q parallel xi \|_(D_Q) parallel^2 lt.eq parallel xi parallel^2 . $
  Together with Lemma 52, this shows that both terms on the right in
  $ A xi = #scale(x: 120%, y: 120%)[\(] E_Q \( xi \|_(D_Q) \) #scale(x: 120%, y: 120%)[\)]_Q + #scale(x: 120%, y: 120%)[\(] E_Q \( xi \|_(I_Q) \) #scale(x: 120%, y: 120%)[\)]_Q $
  belong to $cal(L)$. The triangle inequality there gives the asserted norm bound. Each coordinate belongs to the range of $E_Q$, so the image is in the closed space $cal(U)$. Although the decomposition used to prove boundedness depends on the ordering of copies, the formula (10.30) does not. Left translation permutes the copies and intertwines their $E_Q$, so $A$ is equivariant. Its kernel is therefore closed and invariant, and Equation (10.31) follows directly from the coordinate formula.
  The polar partial isometry of $A$ has initial projection $P_(K^perp)$ and final projection onto $overline("ran" A)$, a subspace of $cal(U)$. It is equivariant by the polar-decomposition argument in Lemma 32. The adjoint-square identity and monotonicity of that trace, together with Equation (10.27), prove Equation (10.32). ◻
]

#thm([Lemma 10.10.])[
  (The upper global space injects into the small complement).  #emph[With the choices in Equations (10.22) and (10.23), 
#[#set math.equation(numbering: n => "(10.33)")
 $ chevron.l T xi \, xi chevron.r lt.eq \( 1 - chi + 3 alpha \) parallel xi parallel^2 quad \( xi in K \) . $ <spec:kernel-form-bound>]

 Consequently the bounded equivariant map $P_(K^perp) : p_0 cal(H) arrow.r K^perp$ is injective, and 
#[#set math.equation(numbering: n => "(10.34)")
 $ 0 < tau_(Gamma_(upright("proj")) \, N) \( p_0 \) lt.eq cal(S)_0 lt.eq cal(S) < 1 \/ 2 . $ <spec:strict-trace>]

]
] <spec:kernel-form>

#proof[
  For $xi in K$, Equation (10.31) gives
  $ E_Q \( xi \|_(D_Q) \) = - E_Q \( xi \|_(I_Q) \) . $
  Lemma 52 therefore implies
  #[#set math.equation(numbering: n => "(10.35)")
   $ sum_Q parallel E_Q \( xi \|_(D_Q) \) parallel^2 lt.eq cal(S) parallel xi parallel^2 . $ <spec:domain-upper-loss>]
  The local spectral estimates in Equation (10.9) imply, for every vector $y$ on $Q$,
  $ chevron.l T_Q y \, y chevron.r lt.eq \( 1 - chi + alpha \) parallel y parallel^2 + chi parallel E_Q y parallel^2 . $
  Apply this to the zero-extended restrictions to $D_Q$, sum over the disjoint domains, and use Equation (10.35). The coefficient $1 - chi + alpha$ is positive, so the unassigned part can be included in its norm bound. Equation (10.23) gives
  $ chevron.l T xi \, xi chevron.r lt.eq \( 1 - chi + alpha + chi cal(S) + f_ell \) parallel xi parallel^2 lt.eq \( 1 - chi + 3 alpha \) parallel xi parallel^2 \, $
  because $cal(S) lt.eq 1 \/ 1000$ and $f_ell lt.eq alpha$. This proves Equation (10.33) for every $xi in K$ directly; no approximation by finitely supported kernel vectors is used.
  On $p_0 cal(H)$, Equation (10.20) gives $chevron.l T xi \, xi chevron.r gt.eq \( 1 - 3 alpha \) parallel xi parallel^2$. Since $1 - 3 alpha > 1 - chi + 3 alpha$, this upper space intersects $K$ only at zero. The map $P_(K^perp)$ restricted to that space is therefore injective. Both projections are equivariant, so its polar decomposition identifies $p_0 cal(H)$ with a closed invariant subspace of $K^perp$. Equations (10.32) and (10.27) prove the non-strict upper bounds in Equation (10.34).
  Finally a nonzero equivariant projection on $ell^2 \( Gamma_(upright("proj")) \) ⊗ bb(C)^N$ has strictly positive identity trace. If all its identity diagonal entries were zero, their values as squared projection-column norms would make all columns at the identity zero; equivariance would make every group translate of those columns zero, and hence the projection itself zero. Proposition 51 proved $p_0 eq.not 0$, so the lower bound is strict. The final upper bound follows from Equation (10.22). ◻
]

#thm([Theorem 10.11.])[
  (The matrix projection supplied by the construction).  #emph[For the fixed choices made above and some sufficiently large integer $ell$, the construction defines a finitely generated torsion-free group $Gamma_(upright("proj"))$, a positive integer $N$, and the self-adjoint finite group-algebra matrix $T$ in Equation (10.17). Its spectrum in the reduced representation has the separation in Equation (10.20). The resulting projection $p_0$ in Equation (10.21) belongs to $M_N \( C_r^(*) \( Gamma_(upright("proj")) \) \)$ and obeys 
$ 0 < sum_(j = 1)^N tau_(Gamma_(upright("proj"))) \( \( p_0 \)_(j j) \) < 1 / 2 . $

]
] <spec:matrix-projection>

#proof[
  The alphabet is finite by Theorem 41, so the group presentation in Theorem 15 has finitely many generators; Theorem 15 proves torsion-freeness. Equation (10.17) is a finite sum in the actual reduced regular representation. Proposition 51 proves its spectral separation and the reduced-algebra membership and nonvanishing of $p_0$. Lemma 54 supplies the stated unnormalized trace inequality. The order of choices is consistent: the geometry and transverse parameters are fixed first; Equation (10.7) then fixes a single accuracy; the uniform vanishing of $beta_ell$, $mu_ell$, and $\| S \| \/ \( d D \)$ permits all subsequent displayed inequalities by one sufficiently large $ell$. No limit group or limit projection is taken in this final step. ◻
]

== 11 Completion of the construction <sec:conclusion>

#proof[
  Theorem 55 establishes the matrix target of Theorem 4. It supplies a finitely generated torsion-free group $Gamma_(upright("proj"))$, a finite matrix size $N$, and a projection $p_0 in M_N \( C_r^(*) \( Gamma_(upright("proj")) \) \)$ with
  $ 0 < tau_(Gamma_(upright("proj")) \, N) \( p_0 \) < 1 / 2 . $
  Now set $G_(upright("proj")) = Gamma_(upright("proj")) * bb(F)_N$ and apply Proposition 3. With $U = \( lambda_(G_(upright("proj"))) \( t_1 \) \, dots.h \, lambda_(G_(upright("proj"))) \( t_N \) \)$, it gives the scalar projection
  $ e = \( U p_0 \) \( p_0 U^(*) U p_0 \)_(p_0 M_N \( C_r^(*) \( G_(upright("proj")) \) \) p_0)^(- 1) \( U p_0 \)^(*) in C_r^(*) \( G_(upright("proj")) \) . $
  The same Proposition proves that $G_(upright("proj"))$ is finitely generated and torsion-free and that $tau_(G_(upright("proj"))) \( e \) = tau_(Gamma_(upright("proj")) \, N) \( p_0 \) in \( 0 \, 1 \/ 2 \)$. Thus $e eq.not 0 \, 1$, proving Theorem 1. ◻
]

The nonintegral trace also places $\[ p_0 \] in K_0 \( C_r^(*) \( Gamma_(upright("proj")) \) \)$ outside the image of the degree-zero reduced assembly map with trivial coefficients, by #cite(label("BGW2016")) Proposition 10.3.


#bibliography("refs.bib", style: "ieee", title: [References])
