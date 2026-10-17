#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Tracial projection methods and uniform property $Gamma$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Uniform property $Gamma$ asks for central projections that divide every trace while preserving its values on prescribed coefficients. This form of central divisibility is central to the regularity theory of nuclear $C^(*)$-algebras. It was introduced by Castillejos, Evington, Tikuisis, White and Winter #cite(label("CETWW")) Definition 2.1, and developed systematically by Castillejos, Evington, Tikuisis and White #cite(label("CETW")). For simple separable unital nuclear algebras with traces, strict comparison together with uniform property $Gamma$ is equivalent to absorption of the Jiang–Su algebra #cite(label("CETW")) Theorem 5.6. We give three independent constructions of this central divisibility. The first derives uniform property $Gamma$ from real rank zero of a completion ultrapower, answering a question of Schafhauser, Tikuisis and White. The second derives Jiang–Su absorption from strict comparison in the unital setting, completing the unital Toms–Winter equivalence. The third treats stably projectionless algebras with bounded densely finite traces and a compact normalized trace base. The common task is to make projections central while preserving every coefficient trace; the hypotheses and the averaging arguments differ in the three routes.

The underlying finite-factor notion goes back to Murray and von Neumann #cite(label("MurrayVonNeumann1943")). Dixmier developed its central projection formulation #cite(label("Dixmier1969")), while McDuff studied the stronger central matrix structure associated with absorption of the hyperfinite factor #cite(label("McDuff1970")). Connes’ classification of injective factors #cite(label("Connes")) supplies the pointwise von Neumann regularity used in our nonunital construction. The uniform $C^(*)$-algebraic question asks for a single family of projections that works simultaneously across the trace space and retains every coefficient identity. Pointwise tracial approximation must therefore be combined with a uniform construction.

The first construction starts with real rank zero in a uniform tracial ultrapower. A unital $C^(*)$-algebra has #emph[real rank zero] when its selfadjoint elements can be approximated in norm by selfadjoint elements with finite spectrum #cite(label("BP91")). We first describe precisely the resulting trace identities. For a unital algebra $A$ with nonempty tracial-state space $T \( A \)$, put

$ parallel a parallel_(2 \, T \( A \)) = sup_(tau in T \( A \)) tau \( a^(*) a \)^(1 \/ 2) . $

The uniform tracial completion belongs to the framework initiated by Ozawa #cite(label("Ozawa13")) and developed in #cite(label("CCEGSTW")). The algebra $B = overline(A)^(T \( A \))$ consists of bounded uniformly $2$-Cauchy sequences modulo sequences tending to zero in this seminorm. Each $tau in T \( A \)$ extends to a designated trace $macron(tau)$ on $B$. For a fixed free ultrafilter $omega$ on $bb(N)$, the uniform tracial ultrapower $B^omega$ is the quotient of bounded sequences in $B$ by those whose uniform $2$-norm tends to zero along $omega$. The family $Lambda_omega$ consists of exactly the traces

$ lambda \( \[ \( b_j \) \] \) = lim_(j arrow.r omega) macron(tau)_j \( b_j \) \, #h(2em) tau_j in T \( A \) . $

These constructions and their quotient norms are specified in Section 2.

#thm([Theorem 1.1.])[
  (Real rank zero and uniform property $Gamma$).  #emph[Let $A$ be a unital, separable, simple, infinite-dimensional, nuclear, stably finite $C^(*)$-algebra with $T \( A \) eq.not diameter$, and let $B = overline(A)^(T \( A \))$. Fix any free ultrafilter $omega$ on $bb(N)$. If $B^omega$ has real rank zero in its quotient $C^(*)$-norm, then there is a projection $p in B^omega ∩ B'$ such that 
$ lambda \( p x \) = 1 / 2 lambda \( x \) #h(2em) \( x in B \, med lambda in Lambda_omega \) . $

 In particular, $A$ has uniform property $Gamma$.]
] <r:thm:main>

This gives a positive resolution of Problem XXI of Schafhauser, Tikuisis and White #cite(label("STW")) Section 6. Their Definition 16 uses precisely this completion and halving formulation. In the usual formulation, uniform property $Gamma$ requires, for every $m gt.eq 1$, orthogonal projections $p_1 \, dots.h \, p_m in A^omega ∩ A'$ summing to one such that

$ lambda \( a p_i \) = 1 / m lambda \( a \) quad \( a in A \, med lambda in T_omega \( A \) \) . $

Here $A^omega$ is the uniform tracial ultrapower formed directly from $A$, and $T_omega \( A \)$ is its family of varying limit traces. The completion formulation and the all-$m$ formulation agree by #cite(label("CCEGSTW")) Propositions 5.7, 5.20 and 5.23; we record the interfaces beside the definitions in Section 2. The coefficient $a$ is essential: equality of scalar traces of the $p_i$ alone does not give uniform property $Gamma$.

The additional centrality in Theorem 1 is the main issue. Vaccaro derives tracial almost divisibility from real rank zero of the tracial ultrapower: hereditary subalgebras admit tracially large matrix order-zero maps, without a centrality requirement #cite(label("Vac26")) Proposition 2.2. Combined with tracially locally finite nuclear dimension, this yields uniform McDuffness and hence uniform property $Gamma$ #cite(label("Vac26")) Theorem 2.3. Kessinger and Toms obtain uniform property $Gamma$ from subquadratic growth in recursive-subhomogeneous inductive limits and from a tracial local approximation condition #cite(label("KT26")) Theorems 1.2 and 7.11. Their results exclude nonzero finite-dimensional representations; the local theorem also assumes nonempty traces. Their argument supplies both ultrapower real rank zero and tracially locally finite nuclear dimension, then uses this divisibility route. We instead construct central coefficient splittings using nuclear averaging under the hypotheses of Theorem 1. Nuclearity alone does not ensure uniform property $Gamma$: Toms constructs a simple separable unital AH algebra without it #cite(label("Toms26")) Theorem 1.

There are also implications in the other direction. For simple separable unital infinite-dimensional nuclear algebras with traces, Fu proves that uniform property $Gamma$ implies the real-rank and divisibility conditions of #cite(label("Fu26")) Theorems 1.1 and 10.6. Uniform property $Gamma$ also passes to the tracial completion and supplies complemented partitions of unity #cite(label("CCEGSTW")) Proposition 5.20 and Theorem 1.4. For factorial tracially complete algebras, complemented partitions of unity imply real rank zero of their tracial ultrapowers #cite(label("CCEGSTW")) Proposition 7.2; Evington and Tikuisis strengthen this to real rank zero of the tracially complete algebra itself #cite(label("EvingtonTikuisis26")) Theorem A. These results assume the uniform partition structure from which projections can be assembled. Theorem 1 constructs central splittings from the ultrapower real-rank-zero assumption.

The same hypotheses also identify all traces on the completion.

#thm([Corollary 1.2.])[
  (Traces on the completion).  #emph[Under the hypotheses of Theorem 1, including real rank zero of $B^omega$ in its quotient $C^(*)$-norm, every tracial state of $B$ is the designated extension of a unique trace in $T \( A \)$. Thus restriction is an affine homeomorphism $T \( B \) arrow.r T \( A \)$, with inverse $tau mapsto macron(tau)$. Moreover, 
$ \| sigma \( b \) \| lt.eq parallel b parallel_(2 \, T \( A \)) #h(2em) \( b in B \, med sigma in T \( B \) \) \, $

 so every tracial state of $B$ is continuous for the designated uniform $2$-norm.]
] <r:cor:completion-traces>

The proof appears at the end of Section 6.

The construction is useful outside an ultrapower. A projection is called #emph[full] when the closed two-sided ideal it generates is the entire ambient algebra.

#thm([Theorem 1.3.])[
  (Finite-set central splitting).  #emph[Let $A subset.eq D$ be a unital inclusion of $C^(*)$-algebras, with $A$ nuclear, $D$ of real rank zero, and $T \( D \) eq.not diameter$. Suppose that for every $delta > 0$ there is a full projection $g in D$ with $sup_(tau in T \( D \)) tau \( g \) < delta$. For every finite $K subset.eq cal(U) \( A \)$ and $epsilon > 0$ there is a projection $P in D$ such that, for every $x in K$, 
$ sup_(tau in T \( D \)) parallel \[ P \, x \] parallel_(2 \, tau) < epsilon \, #h(2em) sup_(tau in T \( D \)) \| tau \( P x \) - 1 / 2 tau \( x \) \| < epsilon . $

]
] <r:thm:finite>

The ambient algebra in this result need not be nuclear or simple. Its tracial states need not be faithful. In the application $D = B^omega$, simplicity and infinite dimensionality of $A$ provide the full projections of small trace uniformly over #emph[all] abstract tracial states of $D$. The last diagonal argument then uses the specified family $Lambda_omega$ to obtain a single projection commuting with all of $B$.

=== 1.1 Strict comparison and Jiang–Su absorption <strict-comparison-and-jiangsu-absorption>

The next two results obtain uniform property $Gamma$ directly from strict comparison. Each supplies its own projections and is independent of the real-rank-zero hypothesis in Theorem 1. For positive $a \, b in A ⊗ cal(K)$, Cuntz subequivalence $a prec.tilde b$ means that $x_n^(*) b x_n arrow.r a$ in norm for a sequence $x_n in A ⊗ cal(K)$. Here $cal(K)$ denotes the compact operators, tensor products are spatial, and each trace is extended using the unnormalized matrix trace. Set

$ d_tau \( a \) = lim_(n arrow.r oo) \( tau ⊗ "Tr" \) \( a^(1 \/ n) \) in \[ 0 \, oo \] . $

For simple unital algebras we use the comparison convention

$ b eq.not 0 \, quad d_tau \( a \) < d_tau \( b \) med \( tau in T \( A \) \) quad arrow.r.double quad a prec.tilde b . $

If $T \( A \)$ is empty, this convention requires comparison with every nonzero positive target; it is more than the absence of traces.

The Jiang–Su algebra $cal(Z)$ was introduced by Jiang and Su #cite(label("JS")); $cal(Z)$-stability means $A tilde.equiv A ⊗ cal(Z)$. For simple, separable, unital, infinite-dimensional nuclear algebras, the Toms–Winter conjecture asks for the equivalence #cite(label("WZNuc")) Conjecture 9.3

$ upright("finite nuclear dimension") quad arrow.l.r.double quad cal(Z) upright("-stability") quad arrow.l.r.double quad upright("strict comparison") . $

Finite nuclear dimension requires completely positive approximations through finite-dimensional algebras with a fixed finite number of outgoing pieces that preserve orthogonality of positive elements. The implications from finite nuclear dimension to $cal(Z)$-stability, from $cal(Z)$-stability to strict comparison, and from $cal(Z)$-stability to finite nuclear dimension are known #cite(label("WinterNuc")) #cite(label("Rordam")) #cite(label("CETWW")). Theorem 4 proves the remaining comparison-to-absorption implication, giving a positive resolution in the unital setting. The empty-trace case is included with the comparison convention stated above; its purely infinite absorption argument is given in Section 11.

#thm([Theorem 1.4.])[
  (The direct unital comparison route).  #emph[Let $A$ be a simple, separable, unital, infinite-dimensional nuclear $C^(*)$-algebra with strict comparison in the preceding sense. Then $A tilde.equiv A ⊗ cal(Z)$. When $T \( A \) eq.not diameter$, the proof constructs uniform property $Gamma$ directly.]
] <u:thm:main>

In the tracial case, Matui and Sato established the absorption implication for finitely many extremal traces using comparison and property (SI) #cite(label("MS")) Theorem 1.1. The compact finite-dimensional boundary case was obtained independently by Kirchberg and Rørdam #cite(label("KR14")) Corollary 7.9, Sato #cite(label("Sato12")) Corollary 1.2, and Toms, White and Winter #cite(label("TWW15")) Corollary 4.7. Later results reach other trace spaces: Lin proves the implication under his condition (C) together with stable rank one, and removes the stable-rank assumption in its countable-boundary case #cite(label("Lin24")) Theorem 5.6 and Corollary 5.7. Condition (C) decomposes the extreme boundary into countably many finite-dimensional compact pieces with additional compatibility requirements on their convex faces #cite(label("Lin24")) Definition 2.13. Evington and Schafhauser subsequently obtained uniform property $Gamma$ from fibrewise property $Gamma$ under the compact finite-dimensional boundary hypothesis without assuming nuclearity #cite(label("EvingtonSchafhauser26")) Theorem 1.1. The uniform divisibility criterion of #cite(label("CETW")) Theorem 5.6 explains why constructing central projections is the decisive task for the comparison-to-absorption implication.

For the nonunital result, write $T_(upright("lsc")) \( A \)$ for the cone of densely finite lower-semicontinuous traces and $T_1 \( A \)$ for its bounded traces of norm one. The next theorem has a distinct trace hypothesis.

#thm([Theorem 1.5.])[
  (The direct stably projectionless route).  #emph[Let $A$ be a nonzero simple, separable, nuclear $C^(*)$-algebra such that $A ⊗ cal(K)$ has no nonzero projections. Suppose that every trace in $T_(upright("lsc")) \( A \)$ is bounded on the positive unit ball and that $T_1 \( A \)$ is nonempty and weak-$*$ compact. Assume that, for $a \, b in \( A ⊗ cal(K) \)_(+)$ with $b eq.not 0$, 
$ d_tau \( a \) < 1 quad upright("for every ") tau in T_(upright("lsc")) \( A \) upright(" with ") d_tau \( b \) = 1 quad arrow.r.double quad a prec.tilde b . $

 Then $A$ has uniform property $Gamma$ and $A tilde.equiv A ⊗ cal(Z)$.]
] <n:thm:main>

Boundedness of the entire densely finite trace cone and compactness of its normalized base are separate assumptions. The comparison tests are exactly those trace rays with positive finite target rank; ranks in the stabilization may be infinite. The construction leads through the nonunital uniform McDuffness and absorption criteria of Castillejos, Evington, Tikuisis and White #cite(label("CETW")) and Castillejos, Li and Szabó #cite(label("CLS")). Jacelon’s work on nonunital algebras with finite-dimensional trace boundary and continuous rank functions is an earlier part of this development #cite(label("Jacelon")).

=== 1.2 The three constructions and their interfaces <the-three-constructions-and-their-interfaces>

The common problem is to turn projections that split traces into projections that are central and split #emph[coefficient] traces. Figure 1 shows the separate routes. Each is proved in full, and the first uses no comparison assumption.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Real rank zero#linebreak()and nuclear averaging]]])])
  content((4.982, 0), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Weighted blocks#linebreak()and orthogonal packing]]])])
  content((9.964, 0), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Halving in $B^ omega$#linebreak()against all $x in B$]]])])
  content((0, -1.8), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Unital comparison#linebreak()and rank rounding]]])])
  content((4.982, -1.8), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Centered symmetries#linebreak()and a Gaussian limit]]])])
  content((9.964, -1.8), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Uniform $Gamma$#linebreak()and absorption]]])])
  content((0, -3.6), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Nonunital comparison#linebreak()with bounded traces#linebreak()and a compact base]]])])
  content((4.982, -3.6), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Cost selection#linebreak()and bounded truncation]]])])
  content((9.964, -3.6), [#box(width: 4.482cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Uniform $Gamma$#linebreak()and nonunital absorption]]])])
  line((2.241, 0), (2.741, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((7.223, 0), (7.723, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((2.241, -1.8), (2.741, -1.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((7.223, -1.8), (7.723, -1.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((2.241, -3.6), (2.741, -3.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((7.223, -3.6), (7.723, -3.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
})],
  caption: [Figure 1: Three routes to central coefficient-tested trace splitting. The upper route uses real rank zero of the completion ultrapower. The lower routes use comparison and supply their own projections in $A^omega$. Absorption is a consequence of the two comparison routes through the published criteria verified in the text. ],
) <fig:routes>

For the real-rank-zero route, Haagerup’s convex virtual diagonal #cite(label("Haa83")) Theorem 3.1 provides nuclear averaging maps chosen before any input projection. Finite scalar compressions turn their outputs into weighted matrix blocks. A small proportion of a base projection can be sampled inside each block without making that subprojection central: scalar matrix compressions retain the coefficient traces and squared commutators. Orthogonal insertion then packs two labelled families with matching target traces. The estimates use total weighted mass and energy, so they remain independent of the number and sizes of the blocks. A bounded diagonal argument yields the desired projection for the original ultrafilter, and uniform $2$-density extends its identities from $A$ to its completion.

For the unital comparison route, a full positive element of small rank receives an exact trace-preserving compression of a given positive element. Integer spectral cuts approximate that trace by a finite-matrix rank, as proved in Section 8; this elementary step needs neither nuclearity nor comparison. Comparison then produces projections with exact spectral support in $A^omega$. Scalar compressions and matrix-unit transport construct symmetries centered against any prescribed separable coefficient algebra. The convex order-zero approximations of Hirshberg, Kirchberg and White #cite(label("HKW")) Theorem 1.4 give a square-root-weighted sum of these symmetries with fourth moment at most three. Its norm may grow with the number of summands. Clipping at a fixed radius supplies bounded relative moment estimates; successively adjoining commuting variables gives normalized sums with a common Gaussian limit in coefficient traces. Continuous approximations to equal-measure Gaussian intervals then yield the required central projections.

For the stably projectionless route, spectral allocation supplies small projections with a one-sided cost bound. A single cost records both overlap with earlier projections and error in a finite-dimensional model. A block-matrix functional-calculus estimate passes aggregate squared commutators to a truncated sum without a factor for the number of models. The resulting small splittings have trace and projection errors of order $lambda^(3 \/ 2)$. Reindexing and multiplication amplify them to exact splittings. The final passage distinguishes the uniform tracial ultrapower $A^omega$, the norm ultrapower $A_omega$, and the annihilator quotient $F_omega \( A \)$, and checks generalized limit traces explicitly.

Sections 2–6 prove the real-rank-zero route, including the finite-set theorem. Sections 7–11 give the direct unital route and handle its empty-trace case. Sections 12– 16 give the bounded-trace nonunital route. The elementary small-support lemma in Section 3 serves both unital routes; Section 8 proves the trace-transfer and integer-rounding argument at its point of use.

== 2 Notation and the tracial completion <r:sec:preliminaries>

For a unital $C^(*)$-algebra $D$, write $"T" \( D \)$ for its normalized tracial states and $cal(U) \( D \)$ for its unitary group. For $tau in "T" \( D \)$, put

$ ∥d∥_(1 \, tau) = tau \( \| d \| \) \, #h(2em) ∥d∥_(2 \, tau) = tau \( d^(*) d \)^(1 \/ 2) . $

These may be seminorms. We use the finite von Neumann algebra obtained from the tracial GNS representation when taking support projections, polar decompositions, or signs in a trace calculation. In particular, tracial Cauchy–Schwarz and trace-norm duality give

#[#set math.equation(numbering: n => "(2.1)")
 $ \| tau \( a b \) \| & lt.eq ∥a∥_(2 \, tau) ∥b∥_(2 \, tau) \, #h(2em) \| tau \( a b \) \| lt.eq ∥∥ a ∥∥_(1 \,) b tau \,\
∥a d b∥_(s \, tau) & lt.eq ∥∥ a ∥∥ b ∥∥ d_(s \, tau) #h(2em) \( s = 1 \, 2 \) . $ <r:eq:trace-inequalities>]

In the last expression, $∥∥ d_(s \, tau)$ denotes the corresponding tracial seminorm. All uses of these inequalities also apply to the unnormalized matrix trace $"Tr" ⊗ tau$. We always reserve $"Tr"$ for the unnormalized scalar matrix trace. A scalar matrix over a corner $q D q$ is written $G ⊗ q$.

A projection is #emph[full] if the closed two-sided ideal it generates is the whole algebra. For projections $e \, f in D$, the notation $e prec.tilde f$ means that there is a partial isometry $v in D$ with $v^(*) v = e$ and $v v^(*) lt.eq f$. Thus all projection comparisons used below are implemented inside $D$. Real rank zero means that finite-spectrum self-adjoint elements are norm dense in $D_(upright("sa"))$.

Every contraction in a unital $C^(*)$-algebra is a linear combination of four unitaries whose coefficient absolute values sum to at most two. Indeed, write $a = h + i k$, where $h \, k$ are self-adjoint contractions, and use

$ h = frac(u_h + u_h^(*), 2) \, #h(2em) u_h = h + i \( 1 - h^2 \)^(1 \/ 2) \, $

and the same formula for $k$. Consequently, statements about a finite set of elements can be reduced to statements about a finite set of unitaries, with controlled constants.

=== 2.1 The specified completion and limit traces <the-specified-completion-and-limit-traces>

Let $A$ be as in Theorem 1. For $a in A$, write

$ ∥∥_(2 \,) a "T" \( A \) = sup_(tau in "T" \( A \)) tau \( a^(*) a \)^(1 \/ 2) . $

Let $C$ be the $C^(*)$-algebra of operator-norm-bounded sequences in $A$ which are Cauchy for this norm, and let $J$ consist of those sequences whose uniform tracial 2-norm tends to zero. The uniform tracial completion is $B = C \/ J$, equipped with its quotient $C^(*)$-norm. The designated traces on $B$ are precisely

$ macron(tau) \( \[ \( a_j \) \] \) = lim_j tau \( a_j \) \, #h(2em) tau in "T" \( A \) . $

These extensions define $∥dot.op∥_(2 \, "T" \( A \))$ on $B$. No additional abstract traces of $B$ enter this notation.

For a fixed free ultrafilter $omega$ on $bb(N)$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ B^omega = ell^oo \( bb(N) \, B \) \/ I_omega \, #h(2em) I_omega = { \( b_j \) : lim_(j arrow.r omega) ∥b_j∥_(2 \, "T" \( A \)) = 0 } . $ <r:eq:ultrapower>]

Here and below the sequences in $I_omega$ are operator-norm bounded. For each sequence $\( tau_j \)$ in $"T" \( A \)$, its #emph[limit trace] is

#[#set math.equation(numbering: n => "(2.3)")
 $ lambda \( \[ \( b_j \) \] \) = lim_(j arrow.r omega) macron(tau)_j \( b_j \) . $ <r:eq:limit-trace>]

Write $Lambda_omega$ for exactly this family of traces.

The copies of $A$ and $B$ given by constant sequences are faithful. For $A$, each trace is faithful by simplicity. For $B$, uniform 2-Cauchyness shows that the functions $tau mapsto tau \( a_j^(*) a_j \)$ converge uniformly. If all their limits vanish, then $∥a_j∥_(2 \, "T" \( A \)) arrow.r 0$, so the class in $B$ is zero. The same observation identifies the constant copy of $B$ in $B^omega$.

We say that $B$ has property $Gamma$, or equivalently that $A$ has #emph[uniform property $Gamma$], if there is a projection $p in B^omega ∩ B'$ such that

#[#set math.equation(numbering: n => "(2.4)")
 $ lambda \( p x \) = 1 / 2 lambda \( x \) quad \( x in B \, med lambda in Lambda_omega \) . $ <r:eq:gamma-definition>]

This is the tracial-completion formulation of uniform property $Gamma$; see #cite(label("STW")) Definition 16. The relation with the standard all-$m$ formulation uses the following interfaces. The framework of #cite(label("CCEGSTW")) takes the closed convex hull of $Lambda_omega$ as its designated ultrapower trace space. For fixed $p \, x$, the identity in (2.4) extends to this closed convex hull by affine weak-star continuity, and the supremum tracial 2-norm is unchanged. The ultrapower identification and transfer of relative commutants are given in #cite(label("CCEGSTW")) Proposition 5.7, and #cite(label("CCEGSTW")) Proposition 5.20 identifies uniform property $Gamma$ of $A$ with that of its completion. The passage from a halving projection to equal coefficient-trace partitions is given by #cite(label("CCEGSTW")) Proposition 5.23 and Remark 5.24. Our proof establishes (2.4) directly for the specified completion and the originally fixed ultrafilter.

== 3 Projection tools <r:sec:projections>

Throughout this section, $D$ is a unital $C^(*)$-algebra of real rank zero with $"T" \( D \) eq.not diameter$. The trace estimates below hold simultaneously for all $tau in "T" \( D \)$. The finite-set construction needs subprojections with prescribed values on finitely many trace tests, followed by a way to move them off previously occupied projections. Scalar compressions and proportional splitting provide the first step; the last lemma controls the trace loss and displacement in the second.

#thm([Lemma 3.1.])[
  (Scalar compressions).  #emph[Every projection corner $r D r$ has real rank zero. Moreover, given a projection $r in D$, a finite set $cal(F) subset D$, and $gamma > 0$, there is a finite family of nonzero orthogonal projections $q_1 \, dots.h \, q_m$ with sum $r$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ "dist" \( q_j h q_j \, bb(C) q_j \) < gamma #h(2em) \( h in cal(F) \, med 1 lt.eq j lt.eq m \) . $ <r:proj:compress-estimate>]

 The family is empty when $r = 0$.]
] <r:proj:compress>

#proof[
  Let $r eq.not 0$ and $h = h^(*) in r D r$. Choose $R > ∥h∥ + 2$ and finite-spectrum self-adjoints $a_n in D$ converging in norm to $h + R r$. The spectrum of the limit is contained in ${ 0 } union \( 2 \, oo \)$, so the spectral projections $f_n = 1_(\( 1 \, oo \)) \( a_n \)$ converge in norm to $r$. For all sufficiently large $n$, the element
  $ r f_n + \( 1 - r \) \( 1 - f_n \) $
  is invertible. Its unitary polar part $u_n$ satisfies $u_n f_n u_n^(*) = r$ and $u_n arrow.r 1$ in norm. Since $a_n$ commutes with $f_n$, the compression $r u_n a_n u_n^(*) r$ has finite spectrum in $r D r$. Subtracting $R r$ gives finite-spectrum approximations to $h$ in that corner.
  For the second assertion, first replace $cal(F)$ by its real and imaginary parts. Compress the first self-adjoint test to $r D r$, approximate it by a finite-spectrum self-adjoint, and partition $r$ by the latter’s spectral projections. Repeat for each subsequent test in every current corner. An estimate $∥q h q - lambda q∥ < delta$ persists on every subprojection of $q$. Thus this finite refinement procedure preserves all earlier estimates. Using tolerance less than $gamma \/ 2$ for the real and imaginary parts proves (3.1); zero pieces are discarded. ◻
]

The next fact concerns a simple unital algebra alone. It uses neither real rank zero nor nuclearity nor comparison, and will also supply the small hereditary support for the rank approximation in Section 8.

#thm([Lemma 3.2.])[
  (Full positive elements with small tracial support).  #emph[Let $A$ be simple, unital and infinite dimensional, with $T \( A \) eq.not diameter$. For every $delta > 0$ there is a full positive element $e in A$ with $∥∥ e = 1$ such that 
$ tau \( "supp" \( e \) \) < delta #h(2em) \( tau in T \( A \) \) . $

 Here supports and traces are taken in each tracial von Neumann representation.]
] <u:lem:thin-full>

#proof[
  First we obtain arbitrarily many mutually orthogonal nonzero positive elements. Choose a maximal abelian unital $C^(*)$-subalgebra $E subset A$. Suppose that $E$ were finite dimensional, with minimal projections $p_1 \, dots.h \, p_m$ summing to $1$. Every selfadjoint element of $p_i A p_i$ commutes with $E$, so maximality implies $p_i A p_i = bb(C) p_i$. If $0 eq.not x in p_i A p_j$, then
  $ x^(*) x = ∥x∥^2 p_j \, #h(2em) x x^(*) = ∥x∥^2 p_i . $
  Thus $u = x \/ ∥x∥$ satisfies $u^(*) u = p_j$ and $u u^(*) = p_i$. For any $y in p_i A p_j$, the element $u^(*) y$ is scalar on $p_j$, and $y = u \( u^(*) y \)$. Consequently each $p_i A p_j$ has dimension at most one. The decomposition $A = sum_(i \, j) p_i A p_j$ would make $A$ finite dimensional, a contradiction. Hence $E tilde.equiv C \( X \)$ for an infinite compact Hausdorff space $X$. Given $k in bb(N)$, choose $k$ distinct points of $X$, pairwise disjoint neighborhoods, and nonzero positive continuous functions supported in those neighborhoods. Their images give mutually orthogonal nonzero positive elements $c_1 \, dots.h \, c_k in A$.
  For two nonzero positive elements $c \, d in A$, simplicity gives $c A d eq.not 0$. Indeed, if $c A d = 0$, then $c$ annihilates the ideal generated by $d$; this ideal is $A$, which would force $c = 0$. Choose $y in A$ such that $z = c y d eq.not 0$. Then $z^(*) z in overline(d A d)$ and $z z^(*) in overline(c A c)$. In each tracial von Neumann representation, the polar decomposition of $z$ gives a partial isometry with initial projection $"supp" \( z^(*) z \)$ and final projection $"supp" \( z z^(*) \)$. The normal tracial state therefore gives
  $ tau \( "supp" \( z^(*) z \) \) = tau \( "supp" \( z z^(*) \) \) lt.eq min { tau \( "supp" \( c \) \) \, tau \( "supp" \( d \) \) } #h(2em) \( tau in T \( A \) \) . $
  The elements $y \, z$ are chosen independently of $tau$; the support comparison holds in every tracial representation. Start with $c = c_1$. For $j = 2 \, dots.h \, k$, apply the preceding construction with $d = c_j$ and replace $c$ by $z z^(*)$. The support trace never increases and is at most the support trace of $c_j$. The final nonzero positive element $e = c$ therefore has support trace at most that of each $c_i$, at every trace. Since the support projections of the $c_i$ are orthogonal,
  $ k thin tau \( "supp" \( e \) \) lt.eq sum_(i = 1)^k tau \( "supp" \( c_i \) \) lt.eq 1 #h(2em) \( tau in T \( A \) \) . $
  Choose $k$ with $1 \/ k < delta$ and rescale $e$ to have norm one, which does not change its support. It is full because $A$ is simple. ◻
]

We return to the ambient algebra $D$. Real rank zero will produce a projection by a spectral cut; the norm-one normalization will let us prove that this projection is full by testing proper quotients of $D$.

#thm([Lemma 3.3.])[
  (Small full projections).  #emph[Suppose that $D$ contains a unital simple infinite-dimensional $C^(*)$-subalgebra $A$. For every $delta > 0$, there is a full projection $g in D$ such that 
$ sup_(tau in "T" \( D \)) tau \( g \) < delta . $

]
] <r:proj:small>

#proof[
  The restriction to $A$ of any trace in $"T" \( D \)$ is a tracial state, so $"T" \( A \) eq.not diameter$. Given a positive integer $n$, apply Lemma 7 to obtain $b in A_(+)$ with $∥∥ b = 1$ and
  #[#set math.equation(numbering: n => "(3.2)")
   $ rho \( b \) lt.eq rho \( "supp" \( b \) \) < 1 / n #h(2em) \( rho in "T" \( A \) \) . $ <r:proj:small-positive>]
  Choose a finite-spectrum self-adjoint $a in D$ with $∥a - b∥ < 1 \/ 8$, and set $g = 1_(\[ 1 \/ 2 \, oo \)) \( a \)$. Then $g b g gt.eq \( 3 \/ 8 \) g$, so restriction of any $tau in "T" \( D \)$ to $A$ gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ tau \( g \) lt.eq 8 / 3 tau \( b \) lt.eq frac(8, 3 n) . $ <r:proj:small-projection-bound>]
  We claim that $g$ is full in $D$. Otherwise, let $pi : D arrow.r D \/ I$ be the quotient by the proper closed ideal generated by $g$. The inequalities $a gt.eq - 1 \/ 8$ and $a \( 1 - g \) lt.eq \( 1 \/ 2 \) \( 1 - g \)$ imply $∥pi \( a \)∥ lt.eq 1 \/ 2$, and hence $∥pi \( b \)∥ lt.eq 5 \/ 8$. On the other hand, $pi \|_A$ is a unital homomorphism from the simple algebra $A$ to a nonzero unital algebra. It is injective and therefore isometric, contradicting $∥b∥ = 1$. Thus $g$ is full, and choosing $n$ with $8 \/ \( 3 n \) < delta$ finishes the proof. ◻
]

We will use an elementary splitting procedure with different target projections. Zero projections are allowed among the resulting pieces.

#thm([Lemma 3.4.])[
  (Splitting a column).  #emph[Let $f \, g_1 \, dots.h \, g_m$ be projections in $D$, where $m gt.eq 1$. Suppose that $v_1 \, dots.h \, v_m in D$ satisfy 
$ v_i = g_i v_i f \, #h(2em) sum_(i = 1)^m v_i^(*) v_i = f . $

 There are orthogonal projections $e_1 \, dots.h \, e_m$ with sum $f$ and $e_i prec.tilde g_i$ for every $i$.]
] <r:proj:columns>

#proof[
  If $f = 0$, take all $e_i = 0$. We argue by induction on $m$; for $m = 1$, $v_1$ itself implements $f prec.tilde g_1$. Suppose that $m > 1$. Apply Lemma 6 to choose a finite-spectrum self-adjoint $a in f D f$ within $1 \/ 8$ of $v_1^(*) v_1$. Set
  $ e_1 = 1_(\[ 1 \/ 2 \, oo \)) \( a \) \, #h(2em) r = f - e_1 . $
  The inequality $e_1 v_1^(*) v_1 e_1 gt.eq \( 3 \/ 8 \) e_1$ shows that, when $e_1 eq.not 0$,
  $ v_1 e_1 \( e_1 v_1^(*) v_1 e_1 \)^(- 1 \/ 2) $
  is a partial isometry with initial projection $e_1$ and final projection below $g_1$. On the remaining corner,
  $ Q := sum_(i = 2)^m r v_i^(*) v_i r = r - r v_1^(*) v_1 r gt.eq 3 / 8 r . $
  If $r = 0$, take $e_2 = dots.h.c = e_m = 0$. Otherwise define $w_i = v_i r Q^(- 1 \/ 2)$ for $i = 2 \, dots.h \, m$, with the inverse taken in $r D r$. These elements satisfy $w_i = g_i w_i r$ and $sum_(i = 2)^m w_i^(*) w_i = r$. The induction hypothesis partitions $r$ as required. ◻
]

Approximate projection halving in non-elementary simple real-rank-zero algebras was developed by Zhang #cite(label("Zhang1991")) Theorem 1.1(i). More directly, Zhang’s ordered-decomposition lemma #cite(label("Zhang1990")) Lemma 1.1, as used in Vaccaro’s divisibility argument #cite(label("Vac26")) Lemma 2.1, version 1, applies without simplicity: a projection can be partitioned into finitely many pieces ordered by subequivalence and each subequivalent to any given full projection. We give this projection construction below and then use a common rounding rule to obtain proportional trace splitting uniformly over all traces.

#thm([Proposition 3.5.])[
  (Uniform proportional subprojections).  #emph[Assume that for every $delta > 0$ there is a full projection $g in D$ with $sup_(tau in "T" \( D \)) tau \( g \) < delta$. For every projection $f in D$, every $s in \[ 0 \, 1 \]$, and every $epsilon > 0$, there is a projection $e lt.eq f$ such that 
#[#set math.equation(numbering: n => "(3.4)")
 $ sup_(tau in "T" \( D \)) \| tau \( e \) - s tau \( f \) \| < epsilon . $ <r:proj:split-estimate>]

]
] <r:proj:split>

#proof[
  The case $f = 0$ is immediate. Choose a full projection $g$ with $sup_tau tau \( g \) < epsilon$. Fullness provides a finite sum $sum_i x_i g y_i$ within distance less than one of $1$. Write $X = \[ x_1 med dots.h.c med x_m \]$ and let $Y$ be the column with entries $g y_i$. Then $X Y$ is invertible, so $Y$ has a bounded left inverse $L = \( X Y \)^(- 1) X$. In particular,
  $ 1 = Y^(*) L^(*) L Y lt.eq ∥L∥^2 Y^(*) Y \, $
  and $Y^(*) Y$ is invertible. The entries of $Y \( Y^(*) Y \)^(- 1 \/ 2) f$ form a column as in Lemma 9, with every target projection equal to $g$. We obtain an orthogonal family with sum $f$, each member subequivalent to $g$.
  We next replace this family by one, say $s_1 \, dots.h \, s_m$, satisfying
  #[#set math.equation(numbering: n => "(3.5)")
   $ s_1 prec.tilde s_2 prec.tilde dots.h.c prec.tilde s_m prec.tilde g . $ <r:proj:ordered-partition>]
  This ordering makes the trace weights increase in the same order for every trace, so that one choice of rounding coefficients will work simultaneously for all of them. Here is the pair operation that makes this possible. Suppose that $x \, y$ are orthogonal pieces, both subequivalent to a common projection $h$. Choose partial isometries $w \, u$ with
  $ w^(*) w = x \, quad w w^(*) = x' lt.eq h \, #h(2em) u^(*) u = y \, quad u u^(*) lt.eq h . $
  Since $u^(*) x' u + u^(*) \( h - x' \) u = y$, Lemma 9 applied to the column with entries $x' u \, \( h - x' \) u$ gives $y = k + l$ and partial isometries $alpha \, beta$ with
  $ alpha^(*) alpha = k \, quad alpha alpha^(*) lt.eq x' \, #h(2em) beta^(*) beta = l \, quad beta beta^(*) lt.eq h - x' . $
  Set $xi = w^(*) alpha + l$ and $zeta = w + beta$. Then
  $ xi^(*) xi & = y \, & xi xi^(*) & = w^(*) alpha alpha^(*) w + l lt.eq x + l \,\
zeta^(*) zeta & = x + l \, & zeta zeta^(*) & = x' + beta beta^(*) lt.eq h . $
  The cross terms vanish by orthogonality of the initial and final components: $x perp l$ and $x' perp \( h - x' \)$. Thus replacing $x \, y$ by $k \, x + l$ preserves their sum and orthogonality, and
  $ k prec.tilde x lt.eq x + l \, #h(2em) x \, y prec.tilde x + l prec.tilde h . $
  After each adjacent comparison, the new right-hand piece dominates every piece already passed: it contains the previous moving piece. Thus a left-to-right pass with common bound $g$ leaves a last piece dominating all earlier pieces. Freeze that last piece and repeat on the shorter list, now using it as the common bound. Induction gives (3.5). All operations take place inside $D$ and preserve the orthogonal sum $f$.
  Set
  $ c_i = floor.l s i floor.r - floor.l s \( i - 1 \) floor.r in { 0 \, 1 } \, #h(2em) e = sum_(i = 1)^m c_i s_i . $
  For a fixed $tau in "T" \( D \)$, put $t_i = tau \( s_i \)$ and $D_j = floor.l s j floor.r - s j$. Then $t_1 lt.eq dots.h.c lt.eq t_m lt.eq tau \( g \)$ and $- 1 lt.eq D_j lt.eq 0$. Summation by parts gives
  $ tau \( e \) - s tau \( f \) = D_m t_m + sum_(i = 1)^(m - 1) D_i \( t_i - t_(i + 1) \) . $
  The first term lies in $\[ - t_m \, 0 \]$, while the sum lies in $\[ 0 \, t_m - t_1 \]$. It follows that $\| tau \( e \) - s tau \( f \) \| lt.eq t_m lt.eq tau \( g \)$, proving (3.4) uniformly in $tau$. ◻
]

#thm([Corollary 3.6.])[
  (Splitting finite linear tests).  #emph[Under the small-full-projection hypothesis of Proposition 10, let $q in D$ be a projection, $s in \[ 0 \, 1 \]$, and $cal(F) subset D$ a finite set. For every $epsilon > 0$, there is a projection $e lt.eq q$ such that 
#[#set math.equation(numbering: n => "(3.6)")
 $ \| tau \( e h \) - s tau \( q h \) \| < epsilon #h(2em) \( h in cal(F) \, med tau in "T" \( D \) \) . $ <r:proj:tests-estimate>]

]
] <r:proj:tests>

#proof[
  The assertion is immediate if $q = 0$ or $cal(F)$ is empty. Choose $gamma > 0$ with $2 gamma < epsilon \/ 2$ and use Lemma 6 to write $q = sum_(j = 1)^m q_j$ with
  $ ∥q_j h q_j - lambda_(j \, h) q_j∥ < gamma #h(2em) \( h in cal(F) \) $
  for suitable scalars $lambda_(j \, h)$. These scalars satisfy $\| lambda_(j \, h) \| lt.eq ∥h∥ + gamma$. Put $M = max_(h in cal(F)) ∥h∥ + gamma$ and choose $delta > 0$ with $m M delta < epsilon \/ 2$. By Proposition 10, choose $e_j lt.eq q_j$ so that $\| tau \( e_j \) - s tau \( q_j \) \| < delta$ for every $tau$, and set $e = sum_j e_j$. Traciality removes all off-diagonal compressions and gives
  $ \| tau \( e h \) - s tau \( q h \) \| & lt.eq gamma #scale(x: 120%, y: 120%)[\(] tau \( e \) + s tau \( q \) #scale(x: 120%, y: 120%)[\)] + sum_(j = 1)^m \| lambda_(j \, h) \| \| tau \( e_j \) - s tau \( q_j \) \|\
 & lt.eq 2 gamma + m M delta < epsilon . $
  ◻
]

The last tool moves a projection off an occupied corner. Its linear trace estimate retains the scale of the projection being moved.

#thm([Lemma 3.7.])[
  (Orthogonal insertion).  #emph[For projections $z \, y in D$, there is a projection $t lt.eq 1 - z$ such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ tau \( y \) - 3 tau \( y z \) & lt.eq tau \( t \) lt.eq tau \( y \) \,\
∥t - y∥_(2 \, tau)^2 & lt.eq 5 tau \( y z \) $ <r:proj:move-mass>]

 for every $tau in "T" \( D \)$. For every contraction $x in D$, it also satisfies 
#[#set math.equation(numbering: n => "(3.8)")
 $ \| tau \( \( t - y \) x \) \| lt.eq 2 sqrt(tau \( y \)) thin ∥t - y∥_(2 \, tau) . $ <r:proj:move-linear>]

]
] <r:proj:move>

#proof[
  If $y = 0$, take $t = 0$. Otherwise choose, in $y D y$, a finite-spectrum self-adjoint $a$ with $∥a - y z y∥ < 1 \/ 8$, and let $f = 1_(\( - oo \, 1 \/ 2 \)) \( a \)$. Writing $d = y - f$, we have
  $ d \( y z y \) d gt.eq 3 / 8 d \, #h(2em) f \( y z y \) f lt.eq 5 / 8 f . $
  Since $y z y gt.eq 0$, this implies
  #[#set math.equation(numbering: n => "(3.9)")
   $ tau \( y - f \) lt.eq 8 / 3 tau \( y z \) \, #h(2em) A_f := f \( 1 - z \) f gt.eq 3 / 8 f . $ <r:proj:discarded-mass>]
  If $f = 0$, put $t = 0$. Otherwise the element
  $ v = \( 1 - z \) f A_f^(- 1 \/ 2) $
  is a partial isometry with $v^(*) v = f$; set $t = v v^(*) lt.eq 1 - z$. In both cases,
  $ tau \( t \) = tau \( f \) \, #h(2em) f t f = f \( 1 - z \) f . $
  The mass bounds (3.7) follow from (3.9). As $f lt.eq y$,
  $ tau \( t y \) gt.eq tau \( t f \) = tau \( f \) - tau \( f z \) . $
  Consequently,
  $ ∥t - y∥_(2 \, tau)^2 & = tau \( t \) + tau \( y \) - 2 tau \( t y \)\
 & lt.eq tau \( y - f \) + 2 tau \( f z \) lt.eq (8 / 3 + 2) tau \( y z \) lt.eq 5 tau \( y z \) \, $
  which proves (3.7).
  Finally, decompose $t - y = t \( t - y \) + \( 1 - t \) \( t - y \)$. The first summand has left support below $t$, and the second equals $- \( 1 - t \) y$ and has right support below $y$. Tracial Cauchy–Schwarz therefore gives
  $ ∥t - y∥_(1 \, tau) lt.eq #scale(x: 120%, y: 120%)[\(] sqrt(tau \( t \)) + sqrt(tau \( y \)) #scale(x: 120%, y: 120%)[\)] ∥t - y∥_(2 \, tau) lt.eq 2 sqrt(tau \( y \)) thin ∥t - y∥_(2 \, tau) . $
  Trace-norm duality proves (3.8). ◻
]

== 4 Nuclear averaging and weighted matrix blocks <r:sec:weighted>

In this section $A subset.eq D$ is a unital inclusion, $A$ is nuclear, and $D$ has real rank zero and nonempty tracial state space. For a prescribed finite set of unitary tests, nuclear averaging turns a projection into a nearly central positive contraction. We will approximate this contraction in trace by a weighted sum of projections, keeping their total weighted squared commutator norm small. Each projection will also be represented as a matrix block over a projection $q$, with each compressed test close to a scalar matrix over $q$. This lets us sample a subprojection $e lt.eq q$ simultaneously in the matrix coordinates while retaining trace and commutator estimates, without requiring $e$ to be central. We first choose the averaging map, independently of its input projection.

#thm([Lemma 4.1.])[
  (Averaging with trace control).  #emph[For a finite $K subset.eq cal(U) \( A \)$ and $mu > 0$, there are contractions $v_1 \, dots.h \, v_m in A$ and numbers $lambda_l gt.eq 0$ with $sum_l lambda_l = 1$ such that the map 
$ Phi \( b \) = sum_(l = 1)^m lambda_l v_l b v_l^(*) \, #h(2em) b in D \, $

 satisfies, for every projection $q in D$, every $x in K$, and every $tau in "T" \( D \)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ 0 lt.eq Phi \( q \) & lt.eq 1 \, #h(2em) tau \( q \) - mu lt.eq tau \( Phi \( q \) \) lt.eq tau \( q \) \,\
∥Phi \( q \) - x Phi \( q \) x^(*)∥_(1 \, tau) & lt.eq mu tau \( q \) . $ <r:eq:diagonal-mass>]

]
] <r:weighted:diagonal>

#proof[
  Let $E = A accent(⊗ A, ̂)$ denote the Banach projective tensor product, with norm $∥dot.op∥_pi$, multiplication map $m_A \( a ⊗ b \) = a b$, and bimodule actions $x dot.op \( a ⊗ b \) = x a ⊗ b$ and $\( a ⊗ b \) dot.op x = a ⊗ b x$. Haagerup’s virtual diagonal theorem #cite(label("Haa83")) Theorem 3.1 gives a virtual diagonal $M in E^(* *)$ in the weak-star closed convex hull of ${ v ⊗ v^(*) : v in A \, med ∥∥ v lt.eq 1 }$. Its bimodule commutators vanish and $m_A^(* *) \( M \) = 1$. Apply the second adjoint of the bounded linear map
  $ T : E arrow.r E^K xor A \, #h(2em) T \( d \) = #scale(x: 120%, y: 120%)[\(] \( x dot.op d - d dot.op x \)_(x in K) \, m_A \( d \) #scale(x: 120%, y: 120%)[\)] . $
  Its value at $M$ is $\( 0 \, dots.h \, 0 \, 1 \)$, in the canonical copy of $E^K xor A$. Weak-star convergence in the bidual restricts to weak convergence in this copy, so this point lies in the weak closure of the image of the finite convex hull. A convex subset of a Banach space has the same weak and norm closures, by Hahn–Banach separation. We may therefore choose a finite convex combination $d = sum_l lambda_l v_l ⊗ v_l^(*)$ such that
  #[#set math.equation(numbering: n => "(4.2)")
   $ ∥x dot.op d - d dot.op x∥_pi < mu quad \( x in K \) \, #h(2em) ∥1 - sum_l lambda_l v_l v_l^(*)∥ < mu . $ <r:eq:approx-diagonal>]
  Both sums $sum_l lambda_l v_l v_l^(*)$ and $sum_l lambda_l v_l^(*) v_l$ are positive contractions. By traciality, the positive element $c = 1 - sum_l lambda_l v_l^(*) v_l$ satisfies $0 lt.eq tau \( c \) < mu$. Since $tau \( q \) - tau \( Phi \( q \) \) = tau \( q c \)$, this proves (4.1). For the centrality estimate, the map $a ⊗ b mapsto a q b$ has norm at most $tau \( q \)$ from the projective tensor norm to the tracial 1-seminorm: indeed,
  $ ∥a q b∥_(1 \, tau) lt.eq ∥a q∥_(2 \, tau) ∥q b∥_(2 \, tau) lt.eq ∥∥ a ∥∥ b thin tau \( q \) . $
  Apply this map to the first inequality in (4.2) and multiply by the unitary $x^(*)$. ◻
]

The following tracial square-root estimate is the form of the Powers–Størmer inequality needed below. Their original #cite(label("PowersStormer1970")) Lemma 4.1 concerns positive Hilbert-space operators with the ordinary trace; the short proof here gives the arbitrary tracial $C^(*)$-algebra version directly.

#thm([Lemma 4.2.])[
  (A square-root trace estimate).  #emph[For positive $b \, c in D$ and $tau in "T" \( D \)$, 
$ ∥sqrt(b) - sqrt(c)∥_(2 \, tau)^2 lt.eq ∥b - c∥_(1 \, tau) . $

]
] <r:weighted:square-root>

#proof[
  Work in the tracial von Neumann algebra and put $d = sqrt(b) - sqrt(c)$. Traciality and $b - c = sqrt(b) thin d + d sqrt(c)$ give
  $ tau \( "sgn" \( d \) \( b - c \) \) = tau \( \( sqrt(b) + sqrt(c) \) \| d \| \) . $
  Since $sqrt(b) + sqrt(c) gt.eq d$ and $sqrt(b) + sqrt(c) gt.eq - d$, tracing against the positive and negative parts $d_(+)$ and $d_(-)$, respectively, bounds the right-hand side below by $tau \( d_(+)^2 \) + tau \( d_(-)^2 \) = tau \( d^2 \)$. Trace-norm duality bounds the left-hand side by $∥b - c∥_(1 \, tau)$. ◻
]

#thm([Proposition 4.3.])[
  (Weighted matrix blocks).  #emph[Let $K subset.eq cal(U) \( A \)$ be finite and $0 < eta < 1$. There are contractions $v_1 \, dots.h \, v_m in A$ and nonnegative numbers $lambda_1 \, dots.h \, lambda_m$ summing to one, chosen using only $K \, eta$, such that the map 
#[#set math.equation(numbering: n => "(4.3)")
 $ Phi : D arrow.r D \, #h(2em) Phi \( b \) = sum_(l = 1)^m lambda_l v_l b v_l^(*) \, $ <r:eq:averaging-map>]

 satisfies (4.1) with $mu = eta^2$. For every projection $r in D$, there is a finite family consisting of weights $0 < w_j lt.eq 1$, nonzero projections $q_j lt.eq r$, integers $k_j gt.eq 1$, and rows $U_j in M_(1 \, k_j) \( D \)$, such that, with $p_j = U_j U_j^(*)$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ U_j^(*) U_j & = 1_(k_j) ⊗ q_j \,\
"dist" #scale(x: 120%, y: 120%)[\(] U_j^(*) x U_j \, M_(k_j) \( bb(C) \) ⊗ q_j #scale(x: 120%, y: 120%)[\)] & < eta &  & \( x in K \) \,\
∥sum_j w_j p_j - Phi \( r \)∥_(1 \, tau) & lt.eq eta^2 \,\
sum_j w_j ∥\[ x \, p_j \]∥_(2 \, tau)^2 & lt.eq 6 eta &  & \( x in K \) . $ <r:eq:block-isometry>]

 The last two estimates hold for every $tau in "T" \( D \)$. The family may be empty; the base projections $q_j$ may repeat, and the projections $p_j$ need not be mutually orthogonal.]
] <r:weighted:family>

#proof[
  Put $mu = eta^2$ and choose $Phi$ by Lemma 13. In particular, the coefficient list is fixed before $r$. Choose $0 < sigma < 1$, then $beta > 0$, so that
  #[#set math.equation(numbering: n => "(4.5)")
   $ beta < sigma \/ 2 \, #h(2em) m \( sigma + 2 beta \) < mu \, #h(2em) frac(2 beta, sigma) + frac(\( 2 + sqrt(2) \) beta, sigma^2) < eta . $ <r:eq:block-parameters>]
  This is possible by choosing $sigma$ with $m sigma < mu$ first.
  ===== 4.1 Scalar matrix approximation. <scalar-matrix-approximation.>
  Partition $r$ by Lemma 6, using the finite list
  $ v_l^(*) v_n \, quad v_l^(*) x v_n #h(2em) \( 1 lt.eq l \, n lt.eq m \, med x in K \) . $
  Take the compression tolerance smaller than $beta \/ \( 2 m \)$. For a nonzero partition piece $q$, set
  $ V = \[ sqrt(lambda_l) thin v_l q \]_(l = 1)^m \, quad h_q = V V^(*) = Phi \( q \) \, quad M = V^(*) V \, quad N_x = V^(*) x V . $
  These are contractions in their respective matrix spaces. Apply any state of $q D q$ entrywise to $M \, N_x$, obtaining scalar matrices $G \, H_x$. Positivity and contractivity of a state at matrix levels give $0 lt.eq G lt.eq 1$ and $∥H_x∥ lt.eq 1$. The compression tolerance implies
  #[#set math.equation(numbering: n => "(4.6)")
   $ ∥M - G ⊗ q∥ < beta \, #h(2em) ∥N_x - H_x ⊗ q∥ < beta . $ <r:eq:scalar-gram>]
  Indeed, each unweighted entry differs from its scalar state value by less than twice the compression tolerance, and an $m$-by-$m$ matrix of entries of norm at most $c$ has norm at most $m c$.
  ===== 4.2 Construction of the blocks. <construction-of-the-blocks.>
  Rotate the columns of $V$ by a scalar unitary diagonalizing $G$. Retain the columns corresponding to eigenvalues at least $sigma$, forming a row $W$ with $k$ columns and scalar diagonal matrix $G_(+)$. The cutoff gives the uniform lower bound needed to normalize the retained row by an inverse square root. If $k = 0$, set $b_q = 0$. Otherwise put
  #[#set math.equation(numbering: n => "(4.7)")
   $ X = W^(*) W gt.eq \( sigma \/ 2 \) \( 1_k ⊗ q \) \, #h(2em) U = W X^(- 1 \/ 2) \, #h(2em) b_q = U \( G_(+) ⊗ q \) U^(*) . $ <r:eq:polar-block>]
  Then $U^(*) U = 1_k ⊗ q$, so $b_q$ is a finite-spectrum positive contraction. Writing $W_(-)$ for the row of deleted columns, we have $∥W_(-)^(*) W_(-)∥ lt.eq sigma + beta$, and therefore
  $ tau \( W_(-) W_(-)^(*) \) = \( "Tr" ⊗ tau \) \( W_(-)^(*) W_(-) \) lt.eq m \( sigma + beta \) tau \( q \) . $
  The contribution is zero if no columns are deleted. Also
  $ b_q - W W^(*) = U \( G_(+) ⊗ q - X \) U^(*) $
  has norm at most $beta$, supported on a projection of trace $k tau \( q \)$. Consequently, including the case $k = 0$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ ∥b_q - h_q∥_(1 \, tau) lt.eq m \( sigma + 2 beta \) tau \( q \) lt.eq mu tau \( q \) . $ <r:eq:finite-spectrum-close>]
  We verify explicitly that the compression estimate is independent of the corner and its matrix size. For positive invertible $X \, Y gt.eq a 1$, the resolvent formula for inverse square roots gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ ∥X^(- 1 \/ 2) - Y^(- 1 \/ 2)∥ lt.eq ∥X - Y∥ / pi integral_0^oo frac(t^(- 1 \/ 2), \( a + t \)^2) thin d t = frac(∥X - Y∥, 2 a^(3 \/ 2)) . $ <r:eq:inverse-root>]
  Use $Y = G_(+) ⊗ q$ and $a = sigma \/ 2$. If $H ⊗ q$ denotes the corresponding retained corner of $H_x ⊗ q$, then $∥∥ H lt.eq 1$, and (4.6) gives $∥W^(*) x W - H ⊗ q∥ < beta$. Expanding the difference between
  $ U^(*) x U = X^(- 1 \/ 2) \( W^(*) x W \) X^(- 1 \/ 2) quad upright("and") quad Y^(- 1 \/ 2) \( H ⊗ q \) Y^(- 1 \/ 2) $
  and using (4.9) bounds its norm by
  $ frac(2 beta, sigma) + frac(\( 2 + sqrt(2) \) beta, sigma^2) < eta . $
  The second expression is a scalar matrix over $q$. The tolerances $sigma \, beta$ were chosen before the partition of $r$, so the compression bound is uniform over its pieces.
  Write $b_q$ as the finite sum of its nonzero upper spectral projections, weighted by the lengths of their level intervals:
  #[#set math.equation(numbering: n => "(4.10)")
   $ b_q = integral_0^1 1_(\( a \, oo \)) \( b_q \) thin d a = sum_(j in J_q) w_j p_j . $ <r:eq:layer-cake>]
  Each $p_j$ is the image of a scalar coordinate projection under $U$. It therefore has a subrow $U_j$ satisfying (4.4), with $q_j = q$. Taking matrix corners gives (4.4). Summing (4.8) over the partition gives (4.4).
  ===== 4.3 Averaged commutators. <averaged-commutators.>
  For a finite-spectrum positive contraction $b = sum_s s e_s$, include its kernel projection in this spectral resolution. Tracial orthogonality gives, for unitary $x$,
  #[#set math.equation(numbering: n => "(4.11)")
   $ integral_0^1 ∥\[ x \, 1_(\( a \, oo \)) \( b \) \]∥_(2 \, tau)^2 thin d a & = sum_(s \, t) \| s - t \| ∥e_s x e_t∥_(2 \, tau)^2\
 & lt.eq 2 sqrt(tau \( b \)) thin ∥\[ x \, sqrt(b) \]∥_(2 \, tau)\
 & lt.eq 2 sqrt(tau \( b \) ∥b - x b x^(*)∥_(1 \, tau)) . $ <r:eq:spectral-energy>]
  For the middle inequality, factor $\| s - t \| = \| sqrt(s) - sqrt(t) \| \( sqrt(s) + sqrt(t) \)$ and apply Cauchy–Schwarz to the sum. The second squared sum is at most $2 sum_(s \, t) \( s + t \) ∥e_s x e_t∥_(2 \, tau)^2 = 4 tau \( b \)$. The last inequality is Lemma 14.
  For $b = b_q$, equations (4.1), (4.1), and (4.8) give
  $ tau \( b_q \) lt.eq \( 1 + mu \) tau \( q \) \, #h(2em) ∥b_q - x b_q x^(*)∥_(1 \, tau) lt.eq 3 mu tau \( q \) . $
  Thus the contribution of $J_q$ in (4.4) is at most $2 sqrt(3 \( 1 + mu \)) thin eta tau \( q \) lt.eq 6 eta tau \( q \)$. Summing over $q$ proves the assertion. ◻
]

== 5 Sampling and orthogonal packing <r:sec:packing>

Continue with the inclusion $A subset.eq D$ from Section 4. The matrix compressions from Proposition 15 allow us to sample a projection without making the sampled corner central. We isolate the precise estimate before carrying out the packing.

#thm([Lemma 5.1.])[
  (Sampling a matrix block).  #emph[Let $q in D$ be a nonzero projection and let $U in M_(1 \, k) \( D \)$ satisfy $U^(*) U = 1_k ⊗ q$. Put $p = U U^(*)$. Suppose $x in cal(U) \( D \)$, $0 < eta < 1$, and 
$ "dist" \( U^(*) x U \, M_k \( bb(C) \) ⊗ q \) < eta . $

 For a projection $e lt.eq q$, set $y = U \( 1_k ⊗ e \) U^(*)$. Then, for $0 lt.eq c lt.eq 1$, every $tau in "T" \( D \)$, and $delta_tau = \| tau \( y \) - c tau \( p \) \|$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ \| tau \( y x \) - c tau \( p x \) \| & lt.eq eta #scale(x: 120%, y: 120%)[\(] tau \( y \) + c tau \( p \) #scale(x: 120%, y: 120%)[\)] + 2 delta_tau \,\
lr(|∥\[ x \, y \]∥_(2 \, tau)^2 - c ∥\[ x \, p \]∥_(2 \, tau)^2|) & lt.eq 6 eta #scale(x: 120%, y: 120%)[\(] tau \( y \) + c tau \( p \) #scale(x: 120%, y: 120%)[\)] + 10 delta_tau . $ <r:eq:sampling-linear>]

]
] <r:packing:sampling>

#proof[
  Write $T = U^(*) x U$, $P_e = 1_k ⊗ e$, and choose $T_0 in M_k \( bb(C) \)$ with $∥T - T_0 ⊗ q∥ < eta$. Since $T$ is a contraction, $∥T_0∥ lt.eq 2$. The map $a mapsto U a U^(*)$ identifies the relevant matrix corner with its image in $D$, and therefore
  $ tau \( y x \) = \( "Tr" ⊗ tau \) \( P_e T P_e \) \, #h(2em) tau \( \| y x y \|^2 \) = \( "Tr" ⊗ tau \) \( \| P_e T P_e \|^2 \) . $
  The scalar matrix $T_0 ⊗ q$ commutes with $P_e$, whether or not $e$ commutes with any entry of $T$. Thus replacing $P_e T P_e$ by $T_0 ⊗ e$ changes these two traces by at most $eta tau \( y \)$ and $3 eta tau \( y \)$, respectively. For the latter estimate use
  $ ∥R^(*) R - S^(*) S∥ lt.eq \( ∥∥ R + ∥∥ S \) ∥R - S∥ \, quad R = P_e T P_e \, quad S = T_0 ⊗ e \, $
  and the fact that the trace of the corner unit is $\( "Tr" ⊗ tau \) \( P_e \) = k tau \( e \) = tau \( y \)$. The same estimates hold with $e$ replaced by $q$.
  Set
  $ alpha = frac("Tr" \( T_0 \), k) \, #h(2em) beta_0 = frac("Tr" \( T_0^(*) T_0 \), k) . $
  Then $\| alpha \| lt.eq 2$ and $0 lt.eq beta_0 lt.eq 4$. The scalar reference traces for $y$ are $alpha tau \( y \)$ and $beta_0 tau \( y \)$; for $p$, they are $alpha tau \( p \)$ and $beta_0 tau \( p \)$. This proves (5.1). For the second estimate, the exact identity
  #[#set math.equation(numbering: n => "(5.2)")
   $ ∥\[ x \, f \]∥_(2 \, tau)^2 = 2 tau \( f \) - 2 tau \( \| f x f \|^2 \) #h(2em) \( f upright(" a projection") \, med x upright(" unitary") \) $ <r:eq:unitary-energy>]
  follows by expansion and traciality. Applying it to $y \, p$ and using the squared compression estimates proves (5.1); the mass-discrepancy coefficient is bounded by $2 + 2 beta_0 lt.eq 10$. In particular, (5.2) also accounts for the part of $x$ that leaves the larger block $p$. ◻
]

#thm([Lemma 5.2.])[
  (Energy of orthogonal sums).  #emph[If $t_1 \, dots.h \, t_M$ are mutually orthogonal projections and $z = sum_a t_a$, then for $x in D$ and $tau in "T" \( D \)$, 
$ ∥\[ x \, z \]∥_(2 \, tau)^2 lt.eq sum_a ∥\[ x \, t_a \]∥_(2 \, tau)^2 . $

 The same bound holds for a sum over any subfamily.]
] <r:packing:orthogonal>

#proof[
  The two off-diagonal corners of the commutator are orthogonal in the tracial 2-seminorm, so its square is
  $ ∥\( 1 - z \) x z∥_(2 \, tau)^2 + ∥z x \( 1 - z \)∥_(2 \, tau)^2 . $
  Splitting the $z$-corner into the orthogonal $t_a$’s writes each term as a sum of squared norms. Since $1 - z lt.eq 1 - t_a$, the respective summands are bounded by $∥\( 1 - t_a \) x t_a∥_(2 \, tau)^2$ and $∥t_a x \( 1 - t_a \)∥_(2 \, tau)^2$. ◻
]

#proof[
  Fix a finite $K subset.eq cal(U) \( A \)$. We construct orthogonal projections $P \, S$ such that $P$ nearly commutes with $K$, their coefficient traces nearly agree, and $P + S$ nearly fills the unit in trace. The identity
  $ 2 tau \( P x \) - tau \( x \) = tau \( \( P - S \) x \) - tau \( \( 1 - P - S \) x \) #h(2em) \( x in K \) $
  then gives the required halving estimate. We obtain $P \, S$ as two labelled sums, sampling equal proportions for the two signs in each round and moving the samples into the unoccupied corner. We use $H > 0$ and $N in bb(N)$, with $eta = H \/ N < 1$. First $H$ is chosen to reduce the unoccupied mass; then $N$ is increased at fixed $H$ to reduce the errors.
  ===== 5.1 Preparing the averaging maps. <preparing-the-averaging-maps.>
  When an averaging map acts on the remaining corner, the projections inserted earlier must already approximately commute with its coefficient contractions. Since the map is chosen independently of its input projection, we can arrange these coefficient tests in advance, working backwards through the rounds. Construct finite sets of unitaries
  $ K_1 supset.eq K_2 supset.eq dots.h.c supset.eq K_N = K $
  backward. Having chosen $K_i$, choose the map $Phi_i$ from Proposition 15 for $K_i \, eta$. If $i > 1$, express each of its coefficient contractions $v_l$ as a linear combination of unitaries with coefficient absolute sum at most two, and include these unitaries, together with $K_i$, in $K_(i - 1)$.
  ===== 5.2 The induction. <the-induction.>
  We insert finitely many projections in each of $N$ rounds. All inserted projections will be mutually orthogonal and each will carry a label $+$ or $-$. Let $Z_i$ be their cumulative sum after round $i$, with $Z_0 = 0$. Set
  #[#set math.equation(numbering: n => "(5.3)")
   $ E_0 = 0 \, #h(2em) E_i - E_(i - 1) = 1000 eta \( E_(i - 1) + eta \) . $ <r:eq:energy-recurrence>]
  We maintain the bound
  #[#set math.equation(numbering: n => "(5.4)")
   $ sum_(t upright(" inserted through round ") i) ∥\[ x \, t \]∥_(2 \, tau)^2 lt.eq E_i quad \( x in K_i \, med tau in "T" \( D \) \) . $ <r:eq:energy-induction>]
  In particular, Lemma 17 gives the same bound for the squared commutator of any subfamily sum.
  In round $i$, let $r = 1 - Z_(i - 1)$ and choose the weighted family from Proposition 15 for $Phi_i \, r$. For every $tau in "T" \( D \)$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ tau \( Z_(i - 1) Phi_i \( r \) \) = sum_l lambda_l ∥Z_(i - 1) v_l r∥_(2 \, tau)^2 lt.eq 4 E_(i - 1) . $ <r:eq:old-overlap>]
  For $i = 1$ the left-hand side is zero. Otherwise each unitary in the chosen decomposition of $v_l$ lies in $K_(i - 1)$, so the induction and Lemma 17 give $∥\[ Z_(i - 1) \, v_l \]∥_(2 \, tau) lt.eq 2 sqrt(E_(i - 1))$. Also $Z_(i - 1) v_l r = \[ Z_(i - 1) \, v_l \] r$, proving (5.5).
  ===== 5.3 One round of sampling and insertion. <one-round-of-sampling-and-insertion.>
  Within this round we suppress $i$ from the block and signed-index notation, and process the finite signed index set $a = \( j \, plus.minus \)$ in any fixed order. Both indices for $j$ have the target proportion
  $ c_a = eta w_j \/ 2 . $
  Let $z_a$ be the occupied projection just before index $a$, starting with $Z_(i - 1)$. We choose
  $ y_a = U_j \( 1_(k_j) ⊗ e_a \) U_j^(*) \, #h(2em) e_a lt.eq q_j \, $
  so that, uniformly over all $tau in "T" \( D \)$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ sum_a \| tau \( y_a \) - c_a tau \( p_j \) \| & lt.eq eta^2 \,\
sum_a \| tau \( z_a y_a \) - c_a tau \( z_a p_j \) \| & lt.eq eta^2 . $ <r:eq:sample-mass-errors>]
  Here $j$ always denotes the block index of $a$. To make these choices precise, assign positive budgets $epsilon_a$ with $sum_a epsilon_a lt.eq eta^2$ before processing the family. At step $a$, apply Corollary 11 with proportion $c_a$, tests $q_j$ and
  $ h_a = sum_(d = 1)^(k_j) \( U_j^(*) z_a U_j \)_(d d) in q_j D q_j \, $
  and tolerance $epsilon_a \/ k_j$. Traciality gives
  $ tau \( y_a \) = k_j tau \( e_a \) \, #h(2em) tau \( z_a y_a \) = tau \( e_a h_a \) \, #h(2em) tau \( z_a p_j \) = tau \( q_j h_a \) . $
  Thus both errors at this step are at most $epsilon_a$. The test $h_a$, which satisfies $0 lt.eq h_a lt.eq k_j q_j$, is known when it is used. This application may refine $q_j$ internally, but only returns a subprojection $e_a$; it does not change the fixed weighted family.
  Use Lemma 12 to replace $y_a$ by a projection $t_a lt.eq 1 - z_a$, retaining its sign, such that
  #[#set math.equation(numbering: n => "(5.7)")
   $ tau \( y_a \) - 3 tau \( z_a y_a \) lt.eq tau \( t_a \) lt.eq tau \( y_a \) \, #h(2em) ∥t_a - y_a∥_(2 \, tau)^2 lt.eq 5 tau \( z_a y_a \) . $ <r:eq:movement>]
  Update the occupied projection to $z_a + t_a$. At the end of the round this is $Z_i$.
  ===== 5.4 Mass and overlap. <mass-and-overlap.>
  For the estimates in this round, fix $tau in "T" \( D \)$, and put
  $ C_i \( tau \) = sum_a c_a tau \( p_j \) \, quad Y_i \( tau \) = sum_a tau \( y_a \) \, quad L_i \( tau \) = sum_a tau \( z_a y_a \) . $
  These are the target mass, sampled mass, and overlap with the occupied projection in this round. All subsequent bounds hold for every $tau$ with the same constants; we suppress $tau$ in these three quantities. Equations (4.1) and (4.4) give
  $ eta tau \( r \) - 2 eta^3 lt.eq C_i lt.eq eta \( 1 + eta^2 \) lt.eq 2 eta . $
  Using (5.6), we obtain
  #[#set math.equation(numbering: n => "(5.8)")
   $ eta tau \( r \) - 3 eta^2 lt.eq Y_i lt.eq 3 eta . $ <r:eq:round-mass>]
  For the overlap, first use $z_a lt.eq Z_i$, then apply the single weighted-operator estimate (4.4):
  #[#set math.equation(numbering: n => "(5.9)")
   $ L_i & lt.eq eta^2 + eta sum_j w_j tau \( Z_i p_j \)\
 & lt.eq eta^2 + eta #scale(x: 120%, y: 120%)[\(] eta^2 + tau \( Z_i Phi_i \( r \) \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq eta^2 + eta #scale(x: 120%, y: 120%)[\(] eta^2 + 4 E_(i - 1) + Y_i #scale(x: 120%, y: 120%)[\)]\
 & lt.eq 4 eta E_(i - 1) + 5 eta^2 . $ <r:eq:round-overlap>]
  In the third line we used (5.5), $0 lt.eq Phi_i \( r \) lt.eq 1$, and $tau \( Z_i - Z_(i - 1) \) lt.eq Y_i$, the last following from (5.7). In particular,
  #[#set math.equation(numbering: n => "(5.10)")
   $ L_i lt.eq E_i - E_(i - 1) . $ <r:eq:overlap-summable>]
  ===== 5.5 Commutators and linear tests. <commutators-and-linear-tests.>
  For $x in K_i$, sum Lemma 16 over this round. Equations (5.6) and (5.8) give
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_a \| tau \( y_a x \) - c_a tau \( p_j x \) \| & lt.eq eta \( Y_i + C_i \) + 2 eta^2 lt.eq 7 eta^2 \,\
sum_a ∥\[ x \, y_a \]∥_(2 \, tau)^2 & lt.eq eta sum_j w_j ∥\[ x \, p_j \]∥_(2 \, tau)^2 + 6 eta \( Y_i + C_i \) + 10 eta^2\
 & lt.eq 46 eta^2 lt.eq 60 eta^2 . $ <r:eq:round-linear>]
  Here the first term in the second estimate is at most $6 eta^2$ by (4.4). Passing to the inserted projections, (5.7) implies
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_a ∥\[ x \, t_a \]∥_(2 \, tau)^2 & lt.eq 2 sum_a ∥\[ x \, y_a \]∥_(2 \, tau)^2 + 8 sum_a ∥t_a - y_a∥_(2 \, tau)^2\
 & lt.eq 120 eta^2 + 40 L_i\
 & lt.eq 160 eta E_(i - 1) + 320 eta^2 lt.eq E_i - E_(i - 1) . $ <r:eq:round-inserted-energy>]
  Together with $K_i subset.eq K_(i - 1)$, this proves (5.4). The mass left after the round satisfies
  #[#set math.equation(numbering: n => "(5.13)")
   $ tau \( 1 - Z_i \) lt.eq \( 1 - eta \) tau \( 1 - Z_(i - 1) \) + 3 eta^2 + 3 L_i \, $ <r:eq:remaining-mass>]
  by (5.8) and the first inequality in (5.7). All sums in this argument are controlled by weighted projection masses or energies. No bound on the raw sum $sum_j w_j$, or on the number of blocks, has been used.
  ===== 5.6 Completing the packing. <completing-the-packing.>
  Let $P \, S$ be the sums of all inserted projections labelled $+$ and $-$, respectively. Then $P + S = Z_N$, and for $x in K$, $tau in "T" \( D \)$,
  #[#set math.equation(numbering: n => "(5.14)")
   $ ∥\[ x \, P \]∥_(2 \, tau)^2 & lt.eq E_N \,\
tau \( 1 - Z_N \) & lt.eq e^(- H) + 3 N eta^2 + 3 E_N \,\
\| tau \( P x \) - tau \( S x \) \| & lt.eq 7 N eta^2 + 2 sqrt(15 H E_N) . $ <r:eq:final-energy>]
  The first follows from Lemma 17. For the second, iterate (5.13), use $\( 1 - eta \)^N lt.eq e^(- H)$, and sum (5.10). For the third, the $+$ and $-$ targets $c_a tau \( p_j x \)$ cancel for every block in every round. Their total sampling error is at most $7 N eta^2$, by (5.11). The remaining displacement error is, by Lemma 12 and Cauchy–Schwarz over all signed indices,
  $ sum_(i \, a) \| tau \( \( t_a - y_a \) x \) \| & lt.eq 2 sum_(i \, a) sqrt(tau \( y_a \)) ∥t_a - y_a∥_(2 \, tau)\
 & lt.eq 2 sqrt(sum_i Y_i) sqrt(5 sum_i L_i) lt.eq 2 sqrt(15 H E_N) . $
  Solving (5.3) gives
  $ E_N = eta #scale(x: 120%, y: 120%)[\(] \( 1 + 1000 eta \)^N - 1 #scale(x: 120%, y: 120%)[\)] lt.eq eta e^(1000 H) \, #h(2em) N eta^2 = H eta . $
  Since $x$ is a contraction, $\| tau \( \( 1 - Z_N \) x \) \| lt.eq tau \( 1 - Z_N \)$. Equations (5.14) and (5.14) therefore yield
  #[#set math.equation(numbering: n => "(5.15)")
   $ lr(|tau \( P x \) - 1 / 2 tau \( x \)|) lt.eq 1 / 2 e^(- H) + 5 H eta + 3 / 2 E_N + sqrt(15 H E_N) . $ <r:eq:halving-error>]
  Choose $H$ large enough to make the first term small. With this $H$ fixed, let $N$ increase through integers and put $eta = H \/ N$. Then every other term in (5.15), and $sqrt(E_N)$ in (5.14), tends to zero. This proves the two desired uniform estimates. ◻
]

== 6 The projection in the prescribed ultrapower <r:sec:completion>

We now pass from the finite-set result to one projection, keeping the designated trace family and the fixed ultrafilter throughout.

#thm([Lemma 6.1.])[
  (Detection by limit traces).  #emph[For a bounded sequence $d = \( d_j \)$ in $B$, with class $\[ d \] in B^omega$, one has 
#[#set math.equation(numbering: n => "(6.1)")
 $ sup_(lambda in Lambda_omega) lambda \( \[ d \]^(*) \[ d \] \) & = lim_(j arrow.r omega) sup_(tau in "T" \( A \)) macron(tau) \( d_j^(*) d_j \) \,\
sup_(lambda in Lambda_omega) \| lambda \( \[ d \] \) \| & = lim_(j arrow.r omega) sup_(tau in "T" \( A \)) \| macron(tau) \( d_j \) \| . $ <r:eq:limit-two>]

 In particular, if $∥∥_(2 \,) z lambda = 0$ for every $lambda in Lambda_omega$, then $z = 0$ in $B^omega$.]
] <r:completion:detection>

#proof[
  The upper bounds follow from the definition of a limit trace. For the reverse bound in (6.1), choose $tau_j$ whose value on $d_j^(*) d_j$ is within $1 \/ j$ of the supremum. The associated limit trace gives equality. For (6.1), choose approximate maximizers of $\| macron(tau) \( d_j \) \|$. Absolute value commutes with the ultralimit of a bounded complex sequence, so this choice also gives equality. The final assertion is (6.1) and the definition of $I_omega$. ◻
]

#proof[
  Set $D = B^omega$. It is a unital real-rank-zero $C^(*)$-algebra by hypothesis and has the tracial states in $Lambda_omega$. The inclusion $A subset.eq D$ is unital and faithful. Lemma 8 supplies full projections of uniformly arbitrarily small trace over all $"T" \( D \)$. Thus Theorem 3 applies.
  Choose increasing finite subsets $F_n subset.eq cal(U) \( A \)$ whose union is norm dense in $cal(U) \( A \)$, including $1$ in each $F_n$. Theorem 3 gives projections $P_n in D$ with
  #[#set math.equation(numbering: n => "(6.2)")
   $ ∥\[ P_n \, x \]∥_(2 \, tau) < 1 \/ n \, #h(2em) lr(|tau \( P_n x \) - 1 / 2 tau \( x \)|) < 1 \/ n quad \( x in F_n \, med tau in "T" \( D \) \) . $ <r:eq:finite-stage>]
  Lift $P_n$ to positive contractions $\( c_(n \, j) \)_j$ in $B$. Such lifts exist by first taking a self-adjoint lift and then applying the continuous function which clips the real line to $\[ 0 \, 1 \]$. Since $P_n$ is a projection,
  $ lim_(j arrow.r omega) ∥c_(n \, j)^2 - c_(n \, j)∥_(2 \, "T" \( A \)) = 0 . $
  For each fixed $n$, Lemma 18, applied to the commutators and the linear errors in (6.2), gives an $omega$-large set of coordinates on which
  $ ∥c_(n \, j)^2 - c_(n \, j)∥_(2 \, "T" \( A \)) & < 1 \/ n \,\
∥\[ c_(n \, j) \, x \]∥_(2 \, "T" \( A \)) & < 2 \/ n &  & \( x in F_n \) \,\
sup_(tau in "T" \( A \)) lr(|macron(tau) \( c_(n \, j) x \) - 1 / 2 macron(tau) \( x \)|) & < 2 \/ n &  & \( x in F_n \) . $
  There are finitely many conditions, so their good coordinate sets have an $omega$-large intersection. Choose one coordinate $j \( n \)$ in that intersection and put $b_n = c_(n \, j \( n \))$.
  The sequence $\( b_n \)$ consists of positive contractions. Its projection defect, and every eventually included test error, converge to zero in the ordinary sense. Hence $p = \[ \( b_n \) \] in B^omega$ is a projection, commutes with the tested unitaries, and satisfies $lambda \( p x \) = lambda \( x \) \/ 2$ on those unitaries for every $lambda in Lambda_omega$. Norm density and linear spanning by unitaries extend both conclusions to every $x in A$. This construction has used the original $omega$; no further ultrapower is taken.
  Finally, $A$ is dense in $B$ for the designated uniform tracial 2-norm. Indeed, if $x = \[ \( a_j \) \] in C \/ J = B$, then
  $ ∥x - a_m∥_(2 \, "T" \( A \))^2 = sup_(tau in "T" \( A \)) lim_j tau \( \( a_j - a_m \)^(*) \( a_j - a_m \) \) arrow.r 0 $
  by uniform 2-Cauchyness. Given $x in B$, choose $a in A$ with $∥x - a∥_(2 \, "T" \( A \)) < delta$. For every $lambda in Lambda_omega$, multiplication by the contraction $p$ and tracial Cauchy–Schwarz give
  $ ∥\[ p \, x \]∥_(2 \, lambda) lt.eq 2 delta \, #h(2em) lr(|lambda \( p x \) - 1 / 2 lambda \( x \)|) lt.eq 3 / 2 delta . $
  Let $delta$ tend to zero. The first assertion, together with Lemma 18, gives $\[ p \, x \] = 0$ in $D$ itself; the second is the required trace identity. Thus the same $p$ works for the entire constant copy of $B$, even when $B$ is not norm separable. ◻
]

We finish by identifying all abstract traces of the completion, as stated in Corollary 2.

#proof[
  Put $X_B = { macron(tau) : tau in T \( A \) }$. By #cite(label("CCEGSTW")) Proposition 3.23(ii)–(iv), $X_B$ is a compact face of $T \( B \)$ and the designated uniform $2$-norm is complete on the unit ball of $B$. In the terminology of that paper, $\( B \, X_B \)$ is a factorial tracially complete pair. Theorem 1 and #cite(label("CCEGSTW")) Proposition 5.20 give property $Gamma$ for this pair, and hence complemented partitions of unity by #cite(label("CCEGSTW")) Theorem 1.4. Evington’s trace theorem #cite(label("EvingtonTraces25")) Theorem B then gives $T \( B \) = X_B$ provided the pair is of type $upright("II")_1$: each designated GNS von Neumann algebra must have no nonzero type I central summand.
  For every $tau in T \( A \)$, the finite von Neumann algebra $pi_tau \( A \)''$ has no nonzero type I central summand. Otherwise it would have a nonzero homogeneous summand $M_n \( Z \)$ with $Z$ abelian; composing the representation of $A$ into this summand with a character of $Z$ would give a unital finite-dimensional representation of $A$. Simplicity would make that representation injective, contrary to the infinite dimensionality of $A$. Thus every such GNS algebra is of type $upright("II")_1$. Their preservation under completion #cite(label("CCEGSTW")) Proposition 3.23(vi) makes $\( B \, X_B \)$ a type $upright("II")_1$ pair, so the cited trace theorem applies. Restriction is therefore a continuous affine bijection between compact Hausdorff trace spaces, and hence a homeomorphism. Finally, for $sigma = macron(tau)$, tracial Cauchy–Schwarz gives $\| sigma \( b \) \| lt.eq macron(tau) \( b^(*) b \)^(1 \/ 2) lt.eq parallel b parallel_(2 \, T \( A \))$. ◻
]

== 7 Comparison and the tracial ultrapower <u:sec:preliminaries>

We now begin the direct unital comparison construction. Its input is the strict comparison in Theorem 4; its output will be uniform property $Gamma$ without a real-rank-zero assumption. This section fixes the distinct ultrapower $D = A^omega$, its limit traces, and the bounded diagonal principle used to turn approximate coefficient tests into exact identities.

For a $C^(*)$-algebra $E$, write $E_(+)$ for its positive cone, $E_(upright("sa"))$ for its selfadjoint part, and

$ "her" \( b \) = overline(b E b) #h(2em) \( b in E_(+) \) $

for the hereditary subalgebra generated by $b$. We use $\( b - t \)_(+)$ for the positive part of $b - t 1$, computed in the unitization when necessary. Spectral projections, including $"supp" \( b \) = 1_(\( 0 \, oo \)) \( b \)$, are taken in the indicated bidual or von Neumann algebra. All tensor products in the proof are minimal.

=== 7.1 Traces and comparison conventions <traces-and-comparison-conventions>

Let $cal(K)$ be the compact operators on a separable infinite-dimensional Hilbert space. For $a \, b in \( A ⊗_min cal(K) \)_(+)$, Cuntz subequivalence $a prec.tilde b$ means that there are $x_n in A ⊗_min cal(K)$ with

$ ∥x_n^(*) b x_n - a∥ arrow.r 0 . $

Cuntz equivalence is mutual subequivalence. Its classes form the ordered abelian semigroup $"Cu" \( A \)$, with $\[ a \] lt.eq \[ b \]$ when $a prec.tilde b$ and addition given by orthogonal direct sum.

The tracial-state space is denoted by $T \( A \)$. Each $tau in T \( A \)$ extends to the usual lower semicontinuous trace $tau ⊗ "Tr"$ on $A ⊗_min cal(K)$, where $"Tr"$ is unnormalized. Set

$ d_tau \( a \) = lim_(n arrow.r oo) \( tau ⊗ "Tr" \) \( a^(1 \/ n) \) in \[ 0 \, oo \] . $

In particular, on $M_j \( A \)$ the trace of the unit is $j$, not $1$. Matrix traces will have this normalization throughout.

#prodef([Definition 7.1.])[
  (Strict comparison).  The algebra $A$ has strict comparison if, whenever $a \, b in \( A ⊗_min cal(K) \)_(+)$ and $b eq.not 0$, the inequalities
  $ d_tau \( a \) < d_tau \( b \) #h(2em) \( tau in T \( A \) \) $
  imply $a prec.tilde b$. When $T \( A \) = diameter$, this requires $a prec.tilde b$ for every positive $a$ and every nonzero positive $b$ in the stabilization.
] <u:def:strict-comparison>

Suppose for now that $A$ is simple and unital and that $T := T \( A \) eq.not diameter$. The set $T$ is weak star compact: it is the closed subset of the state space defined by the trace identities. Every $tau in T$ is faithful. Indeed, ${ x in A : tau \( x^(*) x \) = 0 }$ is a closed two-sided ideal, by the trace identity and the inequalities for multiplication in the tracial $2$-seminorm, and it does not contain $1$.

We specify the trace extensions used in spectral calculations. The bounded trace $tau ⊗ "Tr"_j$ on $M_j \( A \)$ has its canonical normal extension to $M_j \( A \)^(* *)$. It is tracial, as follows by extending the trace identity in each variable using separate weak star continuity. We use the same symbol for this extension. Spectral calculus gives

$ d_tau \( v \) = tau \( "supp" \( v \) \) #h(2em) \( v in M_j \( A \)_(+) \) . $

For the entire stabilization one may instead work in $M_tau thin overline(⊗) thin cal(B) \( ell^2 \)$, where $M_tau = pi_tau \( A \)''$ is the tracial GNS von Neumann algebra, with its normal semifinite trace induced by $tau ⊗ "Tr"$. The same support formula holds there, with the value $oo$ permitted. To see it, first rescale a positive element to a contraction and then use monotone convergence on its spectral resolution. Scalar rescaling leaves the limiting rank unchanged.

Here is the comparison convention needed for the known absorption criterion. A functional on $"Cu" \( A \)$ is an additive, order-preserving map $phi : "Cu" \( A \) arrow.r \[ 0 \, oo \]$ that vanishes at $0$ and preserves suprema of increasing sequences; let $F \( "Cu" \( A \) \)$ denote these functionals. The functional formulation of strict comparison used in #cite(label("CETW")) Section 5, pp. 20–21 of the arXiv version requires $\[ u \] lt.eq \[ v \]$ if

$ phi \( \[ u \] \) lt.eq phi \( \[ v \] \) quad upright("for every ") phi in F \( "Cu" \( A \) \) \, #h(2em) phi \( \[ u \] \) < phi \( \[ v \] \) quad upright("whenever ") 0 < phi \( \[ v \] \) < oo . $

#thm([Lemma 7.2.])[
  (Compatibility of comparison conventions).  #emph[Let $A$ be simple and unital with $T \( A \) eq.not diameter$. Strict comparison in Definition 19 implies the functional formulation just stated.]
] <u:lem:comparison-convention>

#proof[
  For every $tau in T$, the map $\[ a \] mapsto d_tau \( a \)$ is a functional on $"Cu" \( A \)$, by #cite(label("ERS")) Proposition 4.2, applied to the lower semicontinuous trace $tau ⊗ "Tr"$. Only this direction of the trace–functional correspondence is needed.
  Let $u \, v in \( A ⊗_min cal(K) \)_(+)$ satisfy the functional inequalities. If $v = 0$, any $tau in T$ gives $d_tau \( u \) = 0$. The faithful stabilized trace then gives $u = 0$, so $u prec.tilde v$. Assume $v eq.not 0$. Faithfulness implies $d_tau \( v \) > 0$ for every $tau in T$. Thus
  $ d_tau \( u \) < d_tau \( v \) quad upright("whenever ") d_tau \( v \) < oo . $
  Fix $s > 0$. There is a positive element $c in M_k \( A \)$ in a finite matrix corner such that $∥u - c∥ < s \/ 2$: compress $u$ by a sufficiently large finite-rank corner projection. In the tracial von Neumann representation for any $tau in T$, put $P = 1_(\( s \, oo \)) \( u \)$. Then
  $ P c P gt.eq s / 2 P . $
  The polar decomposition of $c^(1 \/ 2) P$ therefore has initial projection $P$ and final projection dominated by $"supp" \( c \)$. Taking the normal semifinite trace shows that
  $ d_tau \( \( u - s \)_(+) \) = tau \( P \) lt.eq tau \( "supp" \( c \) \) lt.eq k . $
  This finite bound uses the same $k$ for every $tau$. Consequently, if $d_tau \( v \) = oo$, then $d_tau \( \( u - s \)_(+) \) < d_tau \( v \)$ as well. For the remaining traces, monotonicity gives
  $ d_tau \( \( u - s \)_(+) \) lt.eq d_tau \( u \) < d_tau \( v \) . $
  Definition 19 now yields $\( u - s \)_(+) prec.tilde v$ for every $s > 0$. For each $n$, choose a comparison witness $y_n$ such that
  $ ∥y_n^(*) v y_n - \( u - 1 \/ n \)_(+)∥ < 1 \/ n . $
  Since $∥u - \( u - 1 \/ n \)_(+)∥ lt.eq 1 \/ n$, these witnesses prove $u prec.tilde v$. ◻
]

=== 7.2 The uniform tracial ultrapower <the-uniform-tracial-ultrapower>

Fix a free ultrafilter $omega$ on $bb(N)$. For a tracial state $tau$ on any unital $C^(*)$-algebra, and a nonempty set $X$ of such states, write

$ ∥x∥_(2 \, tau) = tau \( x^(*) x \)^(1 \/ 2) \, #h(2em) ∥x∥_(2 \, X) = sup_(tau in X) ∥x∥_(2 \, tau) . $

Define

$ I = {\( a_l \) in ell^oo \( bb(N) \, A \) : lim_(l arrow.r omega) ∥a_l∥_(2 \, T) = 0} \, #h(2em) D = ell^oo \( bb(N) \, A \) \/ I . $

The inequalities

$ ∥x y∥_(2 \, tau) lt.eq ∥x∥ ∥y∥_(2 \, tau) \, #h(2em) ∥y x∥_(2 \, tau) lt.eq ∥x∥ ∥y∥_(2 \, tau) \, #h(2em) ∥x^(*)∥_(2 \, tau) = ∥x∥_(2 \, tau) $

show that $I$ is a two-sided $*$-ideal. It is norm closed because $∥x∥_(2 \, tau) lt.eq ∥x∥$. Thus $D$ is a unital $C^(*)$-algebra. Faithfulness of the traces makes the map from $A$ given by constant sequences injective; we henceforth identify $A$ with its image in $D$.

Let $Lambda = T_omega \( A \)$ be the set of limit traces on $D$. Its members are the tracial states

$ \( a_l \) + I mapsto lim_(l arrow.r omega) tau_l \( a_l \) \, #h(2em) tau_l in T . $

Cauchy–Schwarz makes this formula independent of the representative, and positivity, traciality and normalization follow coordinatewise. For every bounded lift $\( a_l \)$ of $x in D$ one has

#[#set math.equation(numbering: n => "(7.1)")
 $ ∥x∥_(2 \, Lambda) & = lim_(l arrow.r omega) ∥a_l∥_(2 \, T) \,\
sup_(tau in Lambda) \| tau \( x \) \| & = lim_(l arrow.r omega) sup_(sigma in T) \| sigma \( a_l \) \| . $ <u:eq:limit-trace-norm>]

For either identity, the inequality from left to right follows directly from the definition of a limit trace. For the reverse inequality choose at each coordinate a trace whose value is within $1 \/ l$ of the corresponding supremum. For the first identity apply this observation to $a_l^(*) a_l$ and take square roots; for the second use continuity of absolute value under bounded scalar ultralimits. In particular, $∥x∥_(2 \, Lambda) = 0$ implies $x = 0$ in $D$. These identities concern the specified set $Lambda$ and require no description of the other traces on $D$.

Whenever $tau in Lambda$ is evaluated on $D^(* *)$, we mean its canonical normal extension from $D$, again denoted by $tau$. It is tracial by the same separate continuity argument used above. Neither this extension nor the extension of a faithful trace from $A$ to $A^(* *)$ is asserted to be faithful on the entire bidual. All spectral trace inequalities below use positivity and normality of the extension, which suffice for those inequalities.

=== 7.3 A bounded diagonal principle <a-bounded-diagonal-principle>

We give explicitly the form of the $epsilon$-test used below. A $*$-polynomial with parameters in $D$ is a finite linear combination of words in the variables, their adjoints, and finitely many fixed elements of $D$ and their adjoints.

#thm([Lemma 7.3.])[
  (Tracial diagonal principle).  #emph[Fix finitely many variables $x_1 \, dots.h \, x_m$. For each variable prescribe one of the following domains, with a fixed radius $0 lt.eq R_i < oo$: the closed ball of $D$, its selfadjoint part, or its positive part. Let $\( P_k \)_(k gt.eq 1)$ be countably many $*$-polynomials in these variables with parameters in $D$. For each $k$ choose a test 
$ t_k \( x \) = ∥P_k \( x \)∥_(2 \, Lambda) quad upright("or") quad t_k \( x \) = sup_(tau in Lambda) \| tau \( P_k \( x \) \) \| \, $

 and a number $c_k gt.eq 0$. Suppose that for every $n gt.eq 1$ and every $epsilon > 0$ there is an admissible tuple $x in D^m$ with 
$ t_k \( x \) < c_k + epsilon #h(2em) \( 1 lt.eq k lt.eq n \) . $

 Then there is an admissible tuple with $t_k \( x \) lt.eq c_k$ for every $k$. In particular, when every $c_k = 0$, all the prescribed tracial equations hold exactly. A polynomial with zero uniform $2$-norm is zero as an element of $D$.]
] <u:lem:tracial-diagonal>

#proof[
  First, elements in each prescribed domain have lifts in the corresponding coordinate domains with the same radius. For a selfadjoint element, symmetrize an arbitrary lift and apply the continuous clipping function to $\[ - R_i \, R_i \]$. For a positive element clip to $\[ 0 \, R_i \]$ instead. For a general element with radius $R_i > 0$, if $a$ is any lift, replace it by $a f \( a^(*) a \)$, where
  $ f \( t \) = cases(delim: "{", 1 \, & 0 lt.eq t lt.eq R_i^2 \,, R_i \/ sqrt(t) \, & t gt.eq R_i^2 .) $
  This continuous functional calculus has norm at most $R_i$ and does not change the quotient element. Radius zero has only the zero lift.
  Only countably many parameters occur in the polynomials. Fix one bounded representative sequence for each of them, once and for all. No multiplicative compatibility among these chosen lifts is required. Given an admissible lifted tuple, let $t_(k \, l)$ be the coordinate test obtained by evaluating the lifted polynomial in $A$ and replacing $Lambda$ by $T$. Equation (7.1) and evaluation of polynomials in the quotient give
  $ t_k \( x \) = lim_(l arrow.r omega) t_(k \, l) . $
  Each of these coordinate sequences is bounded, since its polynomial involves only finitely many bounded parameters and variables in fixed balls.
  For each $n$, choose an admissible trial tuple $x^(\( n \))$ with $t_k \( x^(\( n \)) \) < c_k + 1 \/ \( 2 n \)$ for $k lt.eq n$, and choose lifts $x_(i \, l)^(\( n \))$ in the prescribed coordinate domains. The set
  $ E_n = {l : t_(k \, l) \( x_(1 \, l)^(\( n \)) \, dots.h \, x_(m \, l)^(\( n \)) \) < c_k + 1 \/ n upright(" for all ") k lt.eq n} $
  belongs to $omega$. Put
  $ F_n = { l gt.eq n } ∩ ⋂_(j = 1)^n E_j . $
  These are decreasing members of $omega$ with empty intersection. For each $l$ that belongs to at least one $F_n$, let $r \( l \) = max { n : l in F_n }$, which is finite and at most $l$, and set $x_(i \, l) = x_(i \, l)^(\( r \( l \) \))$. At the remaining coordinates set $x_(i \, l) = 0$.
  The resulting sequences remain in their fixed balls. If $n gt.eq k$ and $l in F_n$, then $r \( l \) gt.eq n$ and $l in E_(r \( l \))$, so
  $ t_(k \, l) \( x_(1 \, l) \, dots.h \, x_(m \, l) \) < c_k + 1 \/ r \( l \) lt.eq c_k + 1 \/ n . $
  Taking the ultralimit, and then letting $n arrow.r oo$, proves the claim. The last assertion follows from Equation (7.1). ◻
]

The lemma also explains precisely where separability is used. Conditions involving every element of a norm-separable algebra can be imposed first on countable norm-dense subsets of the appropriate balls. On fixed balls, polynomial evaluation is uniformly norm continuous in each coefficient, and both test seminorms are bounded by the operator norm. Thus the resulting identities and inequalities extend to every coefficient by continuity. For example,

$ ∥\[ x \, a \] - \[ x \, b \]∥_(2 \, Lambda) lt.eq 2 ∥x∥ ∥a - b∥ \, #h(2em) sup_(tau in Lambda) \| tau \( \( a - b \) x \) \| lt.eq ∥a - b∥ ∥x∥ . $

In particular, a zero $2$-norm commutator gives exact commutation in $D$. The number of variables and their norm bounds are fixed throughout each application of Lemma 21.

=== 7.4 The absorption criterion <the-absorption-criterion>

#prodef([Definition 7.4.])[
  (Uniform property $Gamma$).  For a simple separable unital $A$ with $T \( A \) eq.not diameter$, uniform property $Gamma$ means that for every $m gt.eq 1$ there are projections $p_1 \, dots.h \, p_m in D ∩ A'$ satisfying
  $ sum_(i = 1)^m p_i = 1 \, #h(2em) tau \( a p_i \) = 1 / m tau \( a \) quad \( a in A \, med tau in Lambda \, med 1 lt.eq i lt.eq m \) . $
  This is #cite(label("CETW")) Definition 2.1 and Equation (2.1), in the uniform tracial ultrapower notation used here.
] <u:def:uniform-gamma>

#thm([Theorem 7.5.])[
  (Castillejos–Evington–Tikuisis–White).  #emph[Let $A$ be simple, separable, unital and nuclear, with $T \( A \) eq.not diameter$. If $A$ has strict comparison in the functional formulation and uniform property $Gamma$, then 
$ A tilde.equiv A ⊗_min cal(Z) . $

]
] <u:thm:gamma-criterion>

This is the implication (ii)$arrow.r.double$(i) of #cite(label("CETW")) Theorem 5.6. Together with Lemma 20, it applies to the strict comparison assumed in Theorem 4. We shall establish uniform property $Gamma$ in the following sections.

== 8 Rank approximation and projections in the tracial ultrapower <u:sec:ranks>

Let $A$ be simple, unital and infinite dimensional, with $T = T \( A \) eq.not diameter$. We first approximate the trace function of a positive element by the rank of a finite-matrix positive element. The construction transfers the trace function exactly to a hereditary subalgebra of small support rank, then takes integer spectral cuts. The numerical argument requires neither separability, nuclearity nor comparison. We will then add strict comparison to place these rank approximants in prescribed hereditary subalgebras and obtain projections in the uniform tracial ultrapower. All matrix traces are unnormalized.

The spectral discretization of traces into dimension functions is related to the rank approximation argument of Dădărlat and Toms #cite(label("DadarlatToms")) proof of Theorem 5.1. The trace-preserving compression below concentrates the rounding error on one small hereditary support; we prove every step under the displayed elementary hypotheses.

The small-support input is Lemma 7, which was proved in Section 3 under these same elementary hypotheses. In the notation of Section 7, it provides, for every $delta > 0$, a norm-one full positive element $e$ with $d_tau \( e \) < delta$ for every $tau in T$.

#thm([Proposition 8.1.])[
  (Uniform approximation of trace values by ranks).  #emph[Let $A$ be a simple, unital, infinite-dimensional $C^(*)$-algebra with $T = T \( A \) eq.not diameter$. For every $b in A_(+)$ and $delta > 0$ there are an integer $L gt.eq 1$ and $v in M_L \( A \)_(+)$ such that 
#[#set math.equation(numbering: n => "(8.1)")
 $ tau \( b \) - delta < d_tau \( v \) lt.eq tau \( b \) #h(2em) \( tau in T \) . $ <u:eq:rank-approximation>]

 This statement requires neither separability, nuclearity nor strict comparison. There is no asserted bound on $L$ independent of $b$ and $delta$.]
] <u:prop:rank-approximation>

#proof[
  Take $e$ from Lemma 7. We first extract an exact finite identity from its fullness. Since the linear span of $A e A$ is dense in $A$, choose $u_i \, v_i in A$, $1 lt.eq i lt.eq n$, so that
  $ s = sum_(i = 1)^n u_i e v_i \, #h(2em) ∥1 - s∥ < 1 . $
  Thus $s$ is invertible. Form the row and column
  $ U = \( u_1 e^(1 \/ 2) \, dots.h \, u_n e^(1 \/ 2) \) \, #h(2em) V = \( e^(1 \/ 2) v_1 \, dots.h \, e^(1 \/ 2) v_n \)^(sans(T)) . $
  Since $s = U V$, the element $y = V^(*) V = sum_i v_i^(*) e v_i$ satisfies
  $ ∥s^(- 1)∥^(- 2) 1 lt.eq s^(*) s = V^(*) U^(*) U V lt.eq ∥U∥^2 y . $
  In particular $y$ is invertible. Setting $x_i = v_i y^(- 1 \/ 2)$ gives the exact identity
  #[#set math.equation(numbering: n => "(8.2)")
   $ sum_(i = 1)^n x_i^(*) e x_i = 1 . $ <u:eq:fullness-frame>]
  Define
  $ c = sum_(i = 1)^n e^(1 \/ 2) x_i b x_i^(*) e^(1 \/ 2) in "her" \( e \)_(+) . $
  Additivity and traciality, followed by Equation (8.2), give, for every $tau in T$,
  #[#set math.equation(numbering: n => "(8.3)")
   $ tau \( c \) = sum_i tau \( b x_i^(*) e x_i \) = tau \( b \) \, #h(2em) d_tau \( c \) lt.eq d_tau \( e \) < delta . $ <u:eq:trace-compression>]
  The norm of $c$ is finite but may be large. Choose an integer $L gt.eq max { 1 \, ∥c∥ }$ and put
  $ v = xor.big_(j = 1)^L \( c - j \)_(+) in M_L \( A \)_(+) . $
  For $0 lt.eq s lt.eq ∥c∥$, let $N_L \( s \) = sum_(j = 1)^L upright(bold(1))_(\( j \, oo \)) \( s \)$. The elementary counting identity gives
  #[#set math.equation(numbering: n => "(8.4)")
   $ 0 lt.eq s - N_L \( s \) lt.eq upright(bold(1))_(\( 0 \, oo \)) \( s \) . $ <u:eq:integer-cuts>]
  For nonintegral positive $s$ the count is $floor.l s floor.r$; at a positive integer $s$ it is $s - 1$, so the difference is exactly one. At $s = 0$ the difference is zero. This also checks the upper endpoint when $∥c∥ = L$.
  Apply bounded Borel functional calculus and the normal extension of $tau$ to Equation (8.4). The unnormalized matrix trace adds the support ranks of the direct summands, and hence
  $ d_tau \( v \) = sum_(j = 1)^L tau #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(\( j \, oo \)) \( c \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 lt.eq tau \( c \) - d_tau \( v \) lt.eq d_tau \( c \) < delta . $
  Together with Equation (8.3), this is Equation (8.1). ◻
]

We now assume in addition that $A$ has strict comparison as in Definition 19, and retain its uniform tracial ultrapower $D$ and limit traces $Lambda$ from Section 7. Comparison will first place the rank approximants inside a prescribed hereditary subalgebra of $A$. Passing to $D$ will turn them into projections with exact spectral support.

We use the support and normal-trace conventions of Section 7. In particular, for $a in M_n \( A \)_(+)$,

$ d_tau \( a \) = \( tau ⊗ "Tr" \) \( "supp" \( a \) \) \, #h(2em) "supp" \( a \) = upright(bold(1))_(\( 0 \, oo \)) \( a \) in M_n \( A \)^(* *) . $

The right side uses the normal extension of the matrix trace. Every element of $"her" \( a \)$ is supported on both sides by $"supp" \( a \)$.

#thm([Lemma 8.2.])[
  (Almost projections in a prescribed hereditary subalgebra).  #emph[For $b in A_(+)$ with $∥b∥ < 1$ and $delta > 0$, there is a positive contraction $p_0 in "her" \( b \)$ such that, for every $tau in T$, 
#[#set math.equation(numbering: n => "(8.5)")
 $ tau \( b \) - 2 delta < tau \( p_0 \) lt.eq tau \( b \) \, #h(2em) 0 lt.eq tau \( p_0 - p_0^2 \) < 2 delta . $ <u:eq:almost-projection>]

]
] <u:lem:almost-projection>

#proof[
  If $b = 0$, take $p_0 = 0$. Otherwise choose $v in M_L \( A \)_(+)$ as in Proposition 24. Faithfulness of each trace and the support formula give
  $ 0 < d_tau \( b \) \, #h(2em) d_tau \( v \) lt.eq tau \( b \) lt.eq ∥b∥ thin d_tau \( b \) < d_tau \( b \) . $
  Strict comparison, applied in $A ⊗ cal(K)$, gives $v prec.tilde b$.
  There is a single $t > 0$ such that
  #[#set math.equation(numbering: n => "(8.6)")
   $ d_tau \( \( v - 3 t \)_(+) \) > tau \( b \) - 2 delta #h(2em) \( tau in T \) . $ <u:eq:uniform-rank-cut>]
  Here is the uniformity argument. For fixed $t > 0$, the rank on the left is a lower semicontinuous function of $tau$: it is the supremum over $m in bb(N)$ of the continuous functions
  $ tau mapsto \( tau ⊗ "Tr" \) #scale(x: 120%, y: 120%)[\(] min { 1 \, m \( v - 3 t \)_(+) } #scale(x: 120%, y: 120%)[\)] . $
  Moreover, these cut ranks increase to $d_tau \( v \)$ as $t$ decreases to zero. Thus the open sets
  $ U_t = { tau in T : d_tau \( \( v - 3 t \)_(+) \) > tau \( b \) - 2 delta } $
  increase as $t$ decreases and cover $T$, by Equation (8.1). Compactness of $T$ supplies a finite subcover. The smallest of its cut parameters gives Equation (8.6).
  We next obtain a comparison witness of the required matrix shape. Regard $b$ as supported in the first matrix corner of $A ⊗ cal(K)$, and $v$ as supported in its first $L$ corners. Let $P_1$ and $P_L$ denote the corresponding corner projections. From $v prec.tilde b$, choose $X in A ⊗ cal(K)$ with $∥X^(*) b X - v∥ < t$. The row $x = P_1 X P_L in M_(1 \, L) \( A \)$ satisfies
  $ w = x^(*) b x = P_L X^(*) b X P_L \, #h(2em) ∥w - v∥ < t . $
  Set $alpha = ∥w - v∥$ and $gamma = t - alpha > 0$. In $M_L \( A \)^(* *)$ put $E = upright(bold(1))_(\( 3 t \, oo \)) \( v \)$ and $F = upright(bold(1))_(\( t \, oo \)) \( w \)$. The order inequalities $\( w - 2 t \)_(+) gt.eq w - 2 t 1$ and $w gt.eq v - alpha 1$ give
  $ E \( w - 2 t \)_(+) E gt.eq E \( v - \( 2 t + alpha \) 1 \) E gt.eq gamma E . $
  Similarly,
  $ F v F gt.eq F \( w - alpha 1 \) F gt.eq gamma F . $
  For a positive element $a$ in a von Neumann algebra and a projection $Q$ with $Q a Q gt.eq gamma Q$, $gamma > 0$, the polar decomposition of $a^(1 \/ 2) Q$ has initial projection $Q$ and final projection at most $"supp" \( a \)$. Indeed its absolute square is $Q a Q$, which is invertible in the $Q$-corner, while its range is contained in the support of $a$. Applying this observation to the preceding two inequalities and then applying each normal trace gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ d_tau \( \( v - 3 t \)_(+) \) lt.eq d_tau \( \( w - 2 t \)_(+) \) \, #h(2em) d_tau \( \( w - t \)_(+) \) lt.eq d_tau \( v \) . $ <u:eq:perturbed-ranks>]
  The positive constant $gamma$ is independent of $tau$.
  Set $a = b^(1 \/ 2) x in M_(1 \, L) \( A \)$ and $w' = a a^(*) = b^(1 \/ 2) x x^(*) b^(1 \/ 2) in "her" \( b \)_(+)$. In the bidual of the linking matrix algebra, the polar decomposition $a = u \| a \|$ identifies the positive spectral projections of $a^(*) a = w$ and $a a^(*) = w'$:
  $ upright(bold(1))_(\( s \, oo \)) \( w' \) = u upright(bold(1))_(\( s \, oo \)) \( w \) u^(*) #h(2em) \( s > 0 \) . $
  Consequently $w$ and $w'$ have the same cut ranks, with the unnormalized matrix trace on the $w$ corner and $tau$ on the $w'$ corner.
  Choose continuous $g : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ which is zero on $\[ 0 \, t \]$ and one on $\[ 2 t \, oo \)$, and put $p_0 = g \( w' \)$. This is a positive contraction in $"her" \( b \)$ since $g \( 0 \) = 0$. Scalar functional calculus gives
  $ upright(bold(1))_(\( 2 t \, oo \)) lt.eq g lt.eq upright(bold(1))_(\( t \, oo \)) \, #h(2em) 0 lt.eq g - g^2 lt.eq upright(bold(1))_(\( t \, oo \)) - upright(bold(1))_(\( 2 t \, oo \)) . $
  Taking traces and using the equality of cut ranks yields
  $ d_tau \( \( w - 2 t \)_(+) \) & lt.eq tau \( p_0 \) lt.eq d_tau \( \( w - t \)_(+) \) \,\
tau \( p_0 - p_0^2 \) & lt.eq d_tau \( \( w - t \)_(+) \) - d_tau \( \( w - 2 t \)_(+) \) . $
  Equations (8.1), (8.6) and (8.7) now imply Equation (8.5). All ranks here are finite, so the displayed differences are well defined. The argument also allows $v = 0$; its rank approximation then gives $tau \( b \) < delta$ at every trace, and $x = 0$ is a permissible witness. ◻
]

#thm([Proposition 8.3.])[
  (Projection supply with exact spectral support).  #emph[For every positive contraction $h in D$ and $0 < eta < 1$, there is a projection $p in D$ such that 
#[#set math.equation(numbering: n => "(8.8)")
 $ p lt.eq upright(bold(1))_(\[ eta \, 1 \]) \( h \) quad upright("in ") D^(* *) \, #h(2em) tau \( p \) = tau \( \( h - eta \)_(+) \) quad \( tau in Lambda \) . $ <u:eq:projection-supply>]

 In addition, for $k_eta \( s \) = min { s \/ eta \, 1 }$ on $\[ 0 \, 1 \]$, one has 
#[#set math.equation(numbering: n => "(8.9)")
 $ k_eta \( h \) p = p = p k_eta \( h \) quad upright("in ") D . $ <u:eq:projection-cutoff>]

]
] <u:prop:projection-supply>

#proof[
  Choose positive contractive lifts $\( h_ell \)_(ell in bb(N))$ of $h$. For $b_ell = \( h_ell - eta \)_(+)$ we have $∥b_ell∥ lt.eq 1 - eta < 1$. Apply Lemma 25 with $delta = 1 \/ ell$ to obtain positive contractions $p_ell in "her" \( b_ell \)$ satisfying
  $ sup_(tau in T) \| tau \( p_ell \) - tau \( b_ell \) \| lt.eq 2 \/ ell \, #h(2em) sup_(tau in T) tau \( p_ell - p_ell^2 \) lt.eq 2 \/ ell . $
  Let $p$ be the class of $\( p_ell \)$ in $D$. Since $p_ell$ is a positive contraction,
  $ 0 lt.eq \( p_ell - p_ell^2 \)^2 lt.eq p_ell - p_ell^2 . $
  Its projection defect therefore has uniform tracial $2$-norm tending to zero, so $p = p^(*) = p^2$ in $D$. For an arbitrary limit trace $tau = lim_omega tau_ell$ on represented sequences, the first estimate gives
  $ tau \( p \) = lim_(ell arrow.r omega) tau_ell \( b_ell \) = tau \( \( h - eta \)_(+) \) . $
  For the support assertion, functional calculus in $A^(* *)$ gives
  $ "supp" \( b_ell \) = upright(bold(1))_(\( eta \, 1 \]) \( h_ell \) \, #h(2em) k_eta \( h_ell \) "supp" \( b_ell \) = "supp" \( b_ell \) . $
  Every element of $"her" \( b_ell \)$ is supported on both sides by this projection. Hence $k_eta \( h_ell \) p_ell = p_ell$ exactly at every coordinate. Passing to the quotient and taking adjoints proves Equation (8.9).
  Finally represent $D^(* *)$ faithfully on a Hilbert space. The identity $\( 1 - k_eta \( h \) \) p = 0$ says that the range of $p$ lies in the kernel of $1 - k_eta \( h \)$. Its kernel projection is
  $ upright(bold(1))_({ 1 }) \( k_eta \( h \) \) = upright(bold(1))_(\[ eta \, 1 \]) \( h \) . $
  Thus $p$ has the asserted order bound in $D^(* *)$. This argument uses an exact identity in $D$ and does not require any normal trace on $D^(* *)$ to be faithful. ◻
]

#thm([Corollary 8.4.])[
  (Trace-zero symmetries in every projection corner).  #emph[For every projection $q in D$ there is $r = r^(*) in q D q$ such that 
$ r^2 = q \, #h(2em) tau \( r \) = 0 quad \( tau in Lambda \) . $

]
] <u:cor:corner-symmetry>

#proof[
  Apply Proposition 26 to $h = q$ and $eta = 1 \/ 2$. It gives a projection $p lt.eq q$ with $tau \( p \) = tau \( q \) \/ 2$ for all $tau in Lambda$. Then $r = 2 p - q$ belongs to $q D q$, is selfadjoint, and satisfies $r^2 = 4 p - 4 p + q = q$ and $tau \( r \) = 0$. This includes $q = 0$. ◻
]

== 9 Scalar compressions and coefficient centering <u:sec:centering>

Continue with a simple, unital, infinite-dimensional $A$ with strict comparison and $T \( A \) eq.not diameter$, and with $D$ and $Lambda$ as in Section 7. We use the projection supply from Proposition 26 to partition most of a projection into blocks on which prescribed coefficients have nearly scalar compressions. Trace-zero symmetries in those blocks will then be centered against the coefficients. All estimates are uniform over $Lambda$. Traces on spectral projections in $D^(* *)$ mean the normal extensions of the traces on $D$; faithfulness of these extensions is not required.

#thm([Lemma 9.1.])[
  (Finite scalar compressions).  #emph[Let $q in D$ be a projection, let $x_1 \, dots.h \, x_n in D$ be selfadjoint contractions, and let $epsilon \, delta > 0$. There are finitely many pairwise orthogonal projections $p_1 \, dots.h \, p_L lt.eq q$ and numbers $mu_(s \, j) in \[ - 1 \, 1 \]$ such that 
#[#set math.equation(numbering: n => "(9.1)")
 $ ∥p_s x_j p_s - mu_(s \, j) p_s∥ & lt.eq epsilon quad \( 1 lt.eq j lt.eq n \, med 1 lt.eq s lt.eq L \) \,\
tau #h(-0.16667em) (q - sum_(s = 1)^L p_s) & lt.eq delta quad \( tau in Lambda \) . $ <u:eq:scalar-compressions>]

 The family may be empty. No commutation of the $p_s$ with the $x_j$ is asserted.]
] <u:lem:scalar-compressions>

#proof[
  It suffices to treat $0 < epsilon \, delta < 1$. We first consider a single selfadjoint contraction $x$. Choose continuous functions $f_1 \, dots.h \, f_m : \[ - 1 \, 1 \] arrow.r \[ 0 \, 1 \]$ and $lambda_1 \, dots.h \, lambda_m in \[ - 1 \, 1 \]$ such that
  $ sum_(j = 1)^m f_j = 1 \, #h(2em) "supp" \( f_j \) subset.eq { t in \[ - 1 \, 1 \] : \| t - lambda_j \| lt.eq epsilon } . $
  For example, piecewise linear hat functions on a sufficiently fine finite subdivision give such a partition of unity.
  We will repeatedly apply these functions inside the current residual corner and remove a projection supported where the corresponding function is nonzero. At any trace where a run starts with residual trace greater than $delta$, a full pass through all the functions will remove a fixed positive trace mass. To prove this uniformly, we first estimate how the traces of the functional-calculus values change when the corner shrinks.
  If $v in D$ is a projection, write $f^v \( v x v \)$ for functional calculus in the corner $v D v$, whose unit is $v$; the value in the zero corner is defined to be zero. In particular, for a polynomial $P \( t \) = sum_(k = 0)^d a_k t^k$,
  #[#set math.equation(numbering: n => "(9.2)")
   $ P^v \( v x v \) = a_0 v + sum_(k = 1)^d a_k \( v x v \)^k . $ <u:eq:corner-polynomial>]
  We give an explicit uniform continuity estimate for this changing corner functional calculus. Suppose $v lt.eq u$ are projections and fix $tau in Lambda$. Put $t = tau \( u - v \)$. Since $u - v$ is a projection,
  $ ∥u - v∥_(2 \, tau) = sqrt(t) \, #h(2em) ∥u x u - v x v∥_(2 \, tau) lt.eq 2 sqrt(t) . $
  The second inequality follows by writing the difference as $\( u - v \) x u + v x \( u - v \)$ and using the tracial $2$-norm multiplication inequalities. The usual telescoping identity, with all powers of $u x u$ and $v x v$ contractive, gives
  $ ∥\( u x u \)^k - \( v x v \)^k∥_(2 \, tau) lt.eq 2 k sqrt(t) #h(2em) \( k gt.eq 1 \) . $
  Consequently, by $\| tau \( a \) \| lt.eq ∥a∥_(2 \, tau)$ and Equation (9.2),
  $ lr(|tau #scale(x: 120%, y: 120%)[\(] P^u \( u x u \) #scale(x: 120%, y: 120%)[\)] - tau #scale(x: 120%, y: 120%)[\(] P^v \( v x v \) #scale(x: 120%, y: 120%)[\)]|) lt.eq C_P sqrt(t) \, #h(2em) C_P = \| a_0 \| + 2 sum_(k = 1)^d k \| a_k \| . $
  The term $\| a_0 \|$ records the change of corner units. If $f in C \( \[ - 1 \, 1 \] \)$ and $∥f - P∥_oo lt.eq a$, functional calculus in each corner and $tau \( u \) \, tau \( v \) lt.eq 1$ yield
  #[#set math.equation(numbering: n => "(9.3)")
   $ lr(|tau #scale(x: 120%, y: 120%)[\(] f^u \( u x u \) #scale(x: 120%, y: 120%)[\)] - tau #scale(x: 120%, y: 120%)[\(] f^v \( v x v \) #scale(x: 120%, y: 120%)[\)]|) lt.eq 2 a + C_P sqrt(tau \( u - v \)) . $ <u:eq:moving-corner-modulus>]
  This estimate does not depend on $x$, the two projections, or the chosen trace.
  For each $j$ choose a polynomial $P_j$ with $∥f_j - P_j∥_oo lt.eq delta \/ \( 16 m \)$, and set
  $ C = max { 1 \, C_(P_1) \, dots.h \, C_(P_m) } \, #h(2em) alpha = frac(delta, 4 m) \, #h(2em) kappa = min {frac(delta, 4 m) \, (frac(delta, 8 m C))^2} > 0 . $
  Thus whenever $v lt.eq u$ and $tau \( u - v \) < kappa$, Equation  (9.3) gives, for every $j$,
  #[#set math.equation(numbering: n => "(9.4)")
   $ lr(|tau #scale(x: 120%, y: 120%)[\(] f_j^u \( u x u \) #scale(x: 120%, y: 120%)[\)] - tau #scale(x: 120%, y: 120%)[\(] f_j^v \( v x v \) #scale(x: 120%, y: 120%)[\)]|) lt.eq frac(delta, 4 m) . $ <u:eq:moving-corner-bound>]
  Starting with an arbitrary residual projection $u$, perform one run through the functions as follows. Put $v_0 = u$ and, successively, let
  $ y_j = f_j^(v_(j - 1)) \( v_(j - 1) x v_(j - 1) \) in v_(j - 1) D v_(j - 1) #h(2em) \( 1 lt.eq j lt.eq m \) . $
  Apply Proposition 26 to $y_j$ with cutoff $alpha$ to obtain a projection $a_j in D$ satisfying
  $ a_j lt.eq upright(bold(1))_(\[ alpha \, 1 \]) \( y_j \) lt.eq "supp" \( y_j \) lt.eq v_(j - 1) \, #h(2em) tau \( a_j \) = tau \( \( y_j - alpha \)_(+) \) gt.eq tau \( y_j \) - alpha quad \( tau in Lambda \) \, $
  and put $v_j = v_(j - 1) - a_j$. The trace estimate uses the stronger scalar bound $0 lt.eq y_j - \( y_j - alpha \)_(+) lt.eq alpha v_(j - 1)$. The projections removed during the run are mutually orthogonal. In the bidual corner, $"supp" \( y_j \)$ lies under the spectral projection of $v_(j - 1) x v_(j - 1)$ for $\[ lambda_j - epsilon \, lambda_j + epsilon \] ∩ \[ - 1 \, 1 \]$. Compressing the corresponding spectral order bounds by $a_j$ gives
  $ - epsilon a_j lt.eq a_j x a_j - lambda_j a_j lt.eq epsilon a_j \, #h(2em) ∥a_j x a_j - lambda_j a_j∥ lt.eq epsilon . $
  These are norm estimates in $D$ and do not require $a_j$ to commute with $x$.
  For every run and every $tau in Lambda$ we claim that
  #[#set math.equation(numbering: n => "(9.5)")
   $ tau \( u \) > delta quad arrow.r.double quad tau \( u - v_m \) gt.eq kappa . $ <u:eq:scalar-run-progress>]
  Indeed, suppose $tau \( u \) > delta$ but $tau \( u - v_m \) < kappa$. The partition identity in the initial corner implies
  $ sum_(j = 1)^m tau #scale(x: 120%, y: 120%)[\(] f_j^u \( u x u \) #scale(x: 120%, y: 120%)[\)] = tau \( u \) > delta \, $
  so one index $j$ has $tau \( f_j^u \( u x u \) \) > delta \/ m$. Because $v_(j - 1) lt.eq u$ and $tau \( u - v_(j - 1) \) < kappa$, Equation (9.4) applies at that step. Therefore
  $ tau \( a_j \) gt.eq tau \( y_j \) - alpha > delta / m - frac(delta, 4 m) - frac(delta, 4 m) = frac(delta, 2 m) > kappa \, $
  contradicting $a_j lt.eq u - v_m$. The index used to prove progress may depend on the trace, but every run processes all $m$ indices and the constant $kappa$ is fixed beforehand.
  Now start at $q$ and perform $K = floor.l 1 \/ kappa floor.r + 1$ runs, each on the preceding residual projection. Collect all removed projections as $p_1 \, dots.h \, p_L$, discarding zero projections if desired, and let $w = q - sum_s p_s$ be the final residual. If some $tau in Lambda$ satisfied $tau \( w \) > delta$, the residual at the start of every run would have trace greater than $delta$ at this same $tau$. Equation (9.5) would imply
  $ tau \( q - w \) gt.eq K kappa > 1 \, $
  which is impossible. Thus $tau \( w \) lt.eq delta$ simultaneously for all $tau in Lambda$. This is a fixed finite construction; it uses no compactness of $Lambda$. Each removed projection retains its scalar compression estimate, proving the one-coefficient case.
  For the finite family, begin with the single block $q$. At stage $j = 1 \, dots.h \, n$, suppose there are $L_(j - 1)$ current blocks. Apply the one-coefficient case for $x_j$ inside each of them, with compression tolerance $epsilon$ and trace-loss tolerance
  $ frac(delta, n max { 1 \, L_(j - 1) }) . $
  Replace the old blocks by their new subprojections. The total trace lost at this stage is at most $delta \/ n$, at every trace. All prior compression bounds survive: if $p lt.eq p_0$ and $∥p_0 x_k p_0 - mu p_0∥ lt.eq epsilon$, then
  $ p x_k p - mu p = p \( p_0 x_k p_0 - mu p_0 \) p \, #h(2em) ∥p x_k p - mu p∥ lt.eq epsilon . $
  There are finitely many blocks at every stage. Summing the trace losses over the $n$ stages proves Equation (9.1). For an empty coefficient family, simply take the block $q$. ◻
]

#thm([Lemma 9.2.])[
  (Symmetries centered against finitely many coefficients).  #emph[For a projection $q in D$, a finite set $H subset D$, and $zeta > 0$, there is $r = r^(*) in q D q$ such that 
#[#set math.equation(numbering: n => "(9.6)")
 $ r^2 = q \, #h(2em) sup_(tau in Lambda) \| tau \( b r \) \| < zeta quad \( b in H \) . $ <u:eq:coefficient-symmetry>]

]
] <u:lem:coefficient-symmetry>

#proof[
  The assertion is immediate if $q = 0$ or $H$ is empty. Otherwise put $M = max { 1 \, max_(b in H) ∥b∥ }$ and choose $0 < theta lt.eq min { 1 \/ 4 \, zeta \/ \( 8 M \) }$. Apply Lemma 28, with both tolerances $theta$, to the real and imaginary parts of every $b \/ M$, $b in H$. It gives orthogonal projections $p_s lt.eq q$, a residual $w = q - sum_s p_s$, and complex scalars $nu_(s \, b)$ such that
  $ ∥p_s b p_s - nu_(s \, b) p_s∥ lt.eq 2 M theta \, #h(2em) tau \( w \) lt.eq theta quad \( tau in Lambda \) . $
  By Corollary 27, choose $r_s = r_s^(*) in p_s D p_s$ with $r_s^2 = p_s$ and $tau \( r_s \) = 0$ for every $tau in Lambda$. Set
  $ r = w + sum_s r_s . $
  Orthogonality of the supporting projections gives $r = r^(*) in q D q$ and $r^2 = w + sum_s p_s = q$. For a trace $tau$, its restriction to $p_s D p_s$ has norm $tau \( p_s \)$. Traciality therefore gives
  $ \| tau \( b r_s \) \| & = lr(|tau #scale(x: 120%, y: 120%)[\(] \( p_s b p_s - nu_(s \, b) p_s \) r_s #scale(x: 120%, y: 120%)[\)]|) lt.eq 2 M theta thin tau \( p_s \) \,\
\| tau \( b w \) \| & = \| tau \( w b w \) \| lt.eq M tau \( w \) . $
  Summing these estimates, using $sum_s tau \( p_s \) lt.eq 1$, yields
  $ \| tau \( b r \) \| lt.eq 2 M theta sum_s tau \( p_s \) + M theta lt.eq 3 M theta lt.eq frac(3 zeta, 8) < zeta . $
  The error is weighted by the traces of the blocks, so their number does not enter the bound. ◻
]

#thm([Proposition 9.3.])[
  (Centered symmetries in finite-dimensional commutants).  #emph[Let $E subset D$ be a finite-dimensional $C^(*)$-subalgebra, possibly nonunital, and let $S subset D$ be a unital norm-separable $C^(*)$-subalgebra. There is a selfadjoint unitary $r in D ∩ E'$ such that 
#[#set math.equation(numbering: n => "(9.7)")
 $ tau \( s r \) = 0 #h(2em) \( s in S \, med tau in Lambda \) . $ <u:eq:centered-symmetry>]

]
] <u:prop:centered-symmetry>

#proof[
  Adjoin $1_D$ to $E$. This preserves finite dimensionality: if $e$ is the unit of $E$, it adds only the scalar summand $bb(C) \( 1_D - e \)$ when $e eq.not 1_D$ (and if $E = 0$, take $e = 0$). It therefore suffices to work with the resulting unital finite-dimensional algebra. Choose matrix units
  $ { e_(i j)^(\( ell \)) : 1 lt.eq i \, j lt.eq n_ell } \, #h(2em) 1 lt.eq ell lt.eq a \, #h(2em) sum_(ell = 1)^a sum_(i = 1)^(n_ell) e_(i i)^(\( ell \)) = 1_D . $
  We first impose finitely many coefficient tests. Fix a finite $H subset S$ and $xi > 0$, and write $N_0 = sum_ell n_ell$. For each block apply Lemma 29 in the corner $e_11^(\( ell \)) D e_11^(\( ell \))$ to the finite family
  $ H_ell = { e_(1 i)^(\( ell \)) s e_(i 1)^(\( ell \)) : s in H \, med 1 lt.eq i lt.eq n_ell } \, $
  with tolerance $xi \/ N_0$. Denote the resulting corner symmetry by $u_ell$, and put
  $ R = sum_(ell = 1)^a sum_(i = 1)^(n_ell) e_(i 1)^(\( ell \)) u_ell e_(1 i)^(\( ell \)) . $
  Each summand is selfadjoint, and the matrix-unit relations give
  $ R^2 = sum_(ell \, i) e_(i i)^(\( ell \)) = 1_D \, #h(2em) R e_(j k)^(\( ell \)) = e_(j 1)^(\( ell \)) u_ell e_(1 k)^(\( ell \)) = e_(j k)^(\( ell \)) R . $
  Terms from distinct matrix blocks have orthogonal supports. Thus $R$ is a selfadjoint unitary commuting with $E$. For every $s in H$ and $tau in Lambda$, cyclicity gives
  $ tau \( s R \) = sum_(ell = 1)^a sum_(i = 1)^(n_ell) tau #scale(x: 120%, y: 120%)[\(] e_(1 i)^(\( ell \)) s e_(i 1)^(\( ell \)) u_ell #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| tau \( s R \) \| < N_0 xi / N_0 = xi . $
  The complementary scalar block in the nonunital case is included in these formulas, so the square of $R$ is the full unit of $D$.
  Choose a norm-dense sequence $\( s_k \)_(k gt.eq 1)$ in the unit ball of $S$. Apply Lemma 21 to one variable in the selfadjoint unit ball of $D$, with the tests
  $ ∥r^2 - 1_D∥_(2 \, Lambda) = 0 \, #h(2em) ∥\[ r \, e_(i j)^(\( ell \)) \]∥_(2 \, Lambda) = 0 \, #h(2em) sup_(tau in Lambda) \| tau \( s_k r \) \| = 0 quad \( k gt.eq 1 \) . $
  Every finite list is satisfiable to arbitrary precision by the unitaries $R$ just constructed; the square and commutation relations already hold exactly for those trial solutions. The diagonal lemma provides $r = r^(*) in D$ satisfying every test. Since the uniform tracial $2$-norm detects zero in $D$, we have $r^2 = 1_D$ and $\[ r \, e_(i j)^(\( ell \)) \] = 0$ in $D$. Thus $r$ is a selfadjoint unitary in $E'$. Finally,
  $ \| tau \( \( s - s_k \) r \) \| lt.eq ∥s - s_k∥ ∥r∥ $
  extends the trace identities from the dense sequence to the unit ball of $S$, and scaling gives Equation (9.7) for all $s in S$. ◻
]

The proposition supplies exact commutation with $E$ and exact coefficient centering over $S$. It does not assert commutation with $S$. In the next section, this distinction permits successive choices of symmetries centered against the algebra generated by their predecessors.

== 10 Nuclear averaging and bounded conditional moments <u:sec:averaging>

Throughout this section, $A$ is simple, separable, unital, infinite dimensional, and nuclear, has strict comparison as in Definition 19, and satisfies $T \( A \) eq.not diameter$. Retain $D$ and $Lambda$ from Section 7. Nuclearity will provide finite-dimensional approximations whose errors are small on average. The centered symmetries of Proposition 30 then turn those averages into one selfadjoint observable. A fourth-moment estimate permits a norm cutoff with controlled loss of its first two coefficient moments. The symmetries used here need not commute with one another. The bounded local moment estimates obtained after the cutoff will allow us to construct commuting variables in the next section, by enlarging the coefficient algebra at each step.

=== 10.1 Convex approximations and homomorphism replacement <convex-approximations-and-homomorphism-replacement>

A completely positive map has #emph[order zero] if it preserves orthogonality of positive elements: $x y = 0$ for $x \, y gt.eq 0$ implies $phi.alt \( x \) phi.alt \( y \) = 0$. We use the following external approximation theorem in its full nuclear scope.

#thm([Theorem 10.1.])[
  (Hirshberg–Kirchberg–White, #cite(label("HKW")) Theorem 1.4).  #emph[Let $N$ be a nuclear $C^(*)$-algebra, let $K subset N$ be finite, and let $epsilon > 0$. There are a finite-dimensional $C^(*)$-algebra $F$ and completely positive contractive maps 
$ N arrow.r^psi F arrow.r^phi.alt N $

 such that $∥phi.alt psi \( x \) - x∥ < epsilon$ for $x in K$, and 
$ phi.alt = sum_(i = 1)^M beta_i phi.alt_i \, #h(2em) beta_i gt.eq 0 \, #h(2em) sum_(i = 1)^M beta_i = 1 \, $

 where each $phi.alt_i : F arrow.r N$ is completely positive, contractive, and of order zero. The number $M$ is finite for the chosen approximation; no bound on $M$ independent of $K$ and $epsilon$ is asserted.]
] <u:thm:hkw-approximation>

In particular, we may write an approximating map in the form $sum_i beta_i phi.alt_i psi_i$ with finite-dimensional $F_i$ and completely positive contractive maps $N arrow.r^(psi_i) F_i arrow.r^(phi.alt_i) N$, each $phi.alt_i$ of order zero: simply take $F_i = F$ and $psi_i = psi$. This theorem does not assume a bound on nuclear dimension. Its unrestricted number of summands is the reason for the cutoff at the end of this section.

#thm([Lemma 10.2.])[
  (Homomorphism replacement).  #emph[Let $F$ be finite dimensional, let $phi.alt : F arrow.r D$ be a completely positive contractive order-zero map, and put $h = phi.alt \( 1_F \)$. For $0 < eta < 1$ there is a possibly nonunital $*$-homomorphism $rho : F arrow.r D$ such that, writing $P = rho \( 1_F \)$, for every $tau in Lambda$, 
#[#set math.equation(numbering: n => "(10.1)")
 $ tau \( P \) gt.eq tau \( h \) - eta \, #h(2em) ∥phi.alt \( c \) - rho \( c \)∥_(2 \, tau)^2 lt.eq 4 \( 1 - tau \( h \) \) + 2 eta quad \( c in F \, med ∥c∥ lt.eq 1 \) . $ <u:eq:homomorphism-replacement>]

]
] <u:lem:homomorphism-replacement>

#proof[
  We first construct a supporting homomorphism $pi$ in $D^(* *)$, then use the supplied projections to transport its matrix units into $D$. The final estimates measure the total trace lost in this transport, independently of the matrix sizes. The supporting-homomorphism step is the finite-dimensional case of the order-zero structure theorem #cite(label("WZ")) Theorem 3.3; we include the details to specify the support used below. Put $q = "supp" \( h \) in D^(* *)$. For every projection $e in F$, the positive elements $phi.alt \( e \)$ and $phi.alt \( 1_F - e \)$ are orthogonal. Consequently $phi.alt \( e \)$ commutes with their sum $h$. Projections linearly span $F$, so $h$ commutes with $phi.alt \( F \)$. For $t > 0$ define
  $ pi_t \( x \) = \( h + t 1 \)^(- 1 \/ 2) phi.alt \( x \) \( h + t 1 \)^(- 1 \/ 2) = \( h + t 1 \)^(- 1) phi.alt \( x \) . $
  This map is completely positive and contractive, since $0 lt.eq pi_t \( 1_F \) = h \( h + t 1 \)^(- 1) lt.eq 1$. If $e$ is a projection, orthogonality of $phi.alt \( e \)$ and $phi.alt \( 1_F - e \)$ gives
  $ pi_t \( e \) = phi.alt \( e \) \( phi.alt \( e \) + t 1 \)^(- 1) med arrow.r med "supp" \( phi.alt \( e \) \) quad upright("strongly as ") t arrow.b 0 . $
  Because projections span $F$, $pi_t$ has a pointwise strong limit $pi : F arrow.r D^(* *)$. Positivity at every matrix level passes to this limit. Thus $pi$ is completely positive, $pi \( 1_F \) = q$, and $pi$ takes every projection to a projection. Its range lies in $q D^(* *) q$: indeed, for positive $x in F$ one has $0 lt.eq pi \( x \) lt.eq ∥x∥ q$, and then one uses linearity. Viewed as a unital completely positive map into that corner, $pi$ is multiplicative. To recall the multiplicative-domain argument, equality in the Schwarz inequality at a projection $e$ forces $pi \( e x \) = pi \( e \) pi \( x \)$ and $pi \( x e \) = pi \( x \) pi \( e \)$ for every $x$; this follows by applying Schwarz to $e + z x$ for all $z in bb(C)$ and comparing the linear terms. Applying this to all projections and using their linear span proves multiplicativity. Finally,
  $ h pi_t \( x \) = phi.alt \( x \) - t pi_t \( x \) arrow.r phi.alt \( x \) quad upright("in norm") \, $
  so $h pi \( x \) = phi.alt \( x \)$. The commutation with $h$ passes to the strong limit, and hence
  #[#set math.equation(numbering: n => "(10.2)")
   $ phi.alt \( x \) = h pi \( x \) = pi \( x \) h \, #h(2em) pi \( 1_F \) = "supp" \( h \) = q . $ <u:eq:order-zero-support>]
  The zero map is included, with $q = 0$.
  Write $F = xor.big_alpha M_(n_alpha)$, and choose matrix units $e_(s t)^(\( alpha \))$. Work first in one block and omit its superscript. Set $a = phi.alt \( e_11 \)$. Proposition 26 supplies a projection $p in D$ with
  $ p lt.eq upright(bold(1))_(\[ eta \, 1 \]) \( a \) lt.eq pi \( e_11 \) \, #h(2em) tau \( p \) = tau \( \( a - eta \)_(+) \) quad \( tau in Lambda \) . $
  The final support inequality follows from $pi \( e_11 \) = "supp" \( phi.alt \( e_11 \) \)$. On $\[ 0 \, 1 \]$ define
  $ k \( s \) = min \( s \/ eta \, 1 \) \, #h(2em) g \( s \) = cases(delim: "{", k \( s \) \/ s \, & s > 0 \,, 1 \/ eta \, & s = 0 .) $
  Both functions are continuous, and $k \( s \) = s g \( s \)$. The spectral containment of $p$ gives $k \( a \) p = p k \( a \) = p$. In particular the elements
  #[#set math.equation(numbering: n => "(10.3)")
   $ v_s = pi \( e_(s 1) \) k \( a \) = phi.alt \( e_(s 1) \) g \( a \) in D $ <u:eq:replacement-membership>]
  are in $D$, even though the individual $pi \( e_(s 1) \)$ were constructed only in $D^(* *)$. The equality uses $pi \( e_(s 1) \) a = phi.alt \( e_(s 1) \)$, which follows from Equation (10.2). Define
  $ rho \( e_(s t) \) = v_s p v_t^(*) = pi \( e_(s 1) \) p pi \( e_(1 t) \) in D . $
  Since $p lt.eq pi \( e_11 \)$, multiplication gives
  $ rho \( e_(s t) \) rho \( e_(u v) \) = delta_(t u) rho \( e_(s v) \) \, #h(2em) rho \( e_(s t) \)^(*) = rho \( e_(t s) \) . $
  For different blocks the products vanish, because their supporting matrix units are orthogonal. Thus these formulas extend to a $*$-homomorphism $rho : F arrow.r D$. Direct multiplication by the matrix units also shows that, for $P = rho \( 1_F \)$,
  $ P lt.eq q \, #h(2em) P pi \( x \) = pi \( x \) P = rho \( x \) quad \( x in F \) . $
  This construction uses the support containment of $p$; it does not require $p$ to commute with $a$, nor $P$ to commute with $h$.
  Fix $tau in Lambda$. In all expressions on $D^(* *)$ use its canonical normal tracial extension, still denoted by $tau$. Faithfulness of this extension is not needed. Scalar functional calculus gives, in each block,
  $ 0 lt.eq a - \( a - eta \)_(+) lt.eq eta pi \( e_11 \) \, #h(2em) 0 lt.eq tau \( a \) - tau \( p \) lt.eq eta tau \( pi \( e_11 \) \) . $
  Traciality and the partial isometries $pi \( e_(s 1) \)$ imply that $phi.alt \( e_(s s) \)$, $rho \( e_(s s) \)$, and $pi \( e_(s s) \)$ have the same traces as $a$, $p$, and $pi \( e_11 \)$, respectively. Summing over all diagonal entries of all blocks therefore gives
  #[#set math.equation(numbering: n => "(10.4)")
   $ 0 lt.eq tau \( h \) - tau \( P \) lt.eq eta tau \( q \) lt.eq eta . $ <u:eq:replacement-unit-loss>]
  The total loss is measured by the trace of $q$, so no matrix-size factor appears.
  For a contraction $c in F$, Equation (10.2) and commutation with $pi \( c \)$ give
  $ ∥phi.alt \( c \) - pi \( c \)∥_(2 \, tau)^2 & lt.eq tau \( \( q - h \)^2 \) lt.eq tau \( q - h \) lt.eq 1 - tau \( h \) \,\
∥rho \( c \) - pi \( c \)∥_(2 \, tau)^2 & lt.eq tau \( q - P \) lt.eq 1 - tau \( h \) + eta . $
  Here $q - h$ is a positive contraction and $q - P$ is a projection; both commute with $pi \( c \)$. The squared triangle inequality now yields Equation (10.1). ◻
]

=== 10.2 Averaging the centered symmetries <averaging-the-centered-symmetries>

#thm([Proposition 10.3.])[
  (An observable with exact coefficient moments).  #emph[Let $E subset A$ be a finite set of selfadjoint contractions and let $0 < eta < 1$. There is a selfadjoint $z in D$ such that, for every $tau in Lambda$, 
#[#set math.equation(numbering: n => "(10.5)")
 $ ∥\[ z \, a \]∥_(2 \, tau)^2 & lt.eq 72 eta &  & \( a in E \) \,\
tau \( b z \) & = 0 \, #h(2em) tau \( b z^2 \) = tau \( b \) &  & \( b in A \) \,\
tau \( z^4 \) & lt.eq 3 . $ <u:eq:averaged-observable>]

 The construction gives $z = sum_(i = 1)^M sqrt(beta_i) thin r_i$, where the $r_i$ are selfadjoint unitaries, $beta_i gt.eq 0$, and $sum_i beta_i = 1$. In fact, $tau \( z^4 \) lt.eq 3 - 2 sum_i beta_i^2$. There is no asserted norm bound on $z$ independent of $M$.]
] <u:prop:averaged-observable>

#proof[
  Apply Theorem 31 to the finite set
  $ { 1_A } union E union { a^2 : a in E } $
  with error $eta$. In the finite-family notation following that theorem, put $T_i = phi.alt_i psi_i$ and $T_0 = sum_i beta_i T_i$. Thus $∥T_0 \( x \) - x∥ < eta$ on this set. Regard the outgoing maps as taking values in $D$ and write $h_i = phi.alt_i \( 1_(F_i) \)$. Fix one trace $tau in Lambda$ throughout the following weighted estimates. Positivity and contractivity give $T_i \( 1_A \) lt.eq h_i lt.eq 1$, and hence
  #[#set math.equation(numbering: n => "(10.6)")
   $ sum_i beta_i \( 1 - tau \( h_i \) \) lt.eq tau \( 1 - T_0 \( 1_A \) \) < eta . $ <u:eq:averaged-unit-defect>]
  For $a in E$, the Schwarz inequality for the completely positive contraction $T_i$ gives $T_i \( a \)^2 lt.eq T_i \( a^2 \)$. Expansion of the squares and traciality imply
  #[#set math.equation(numbering: n => "(10.7)")
   $ sum_i beta_i ∥a - T_i \( a \)∥_(2 \, tau)^2 & lt.eq tau \( a^2 \) - 2 tau \( a T_0 \( a \) \) + tau \( T_0 \( a^2 \) \)\
 & = - 2 tau \( a \( T_0 \( a \) - a \) \) + tau \( T_0 \( a^2 \) - a^2 \) lt.eq 3 eta . $ <u:eq:averaged-three>]
  In the last inequality each trace term is bounded by the norm of its argument, and $∥a∥ lt.eq 1$.
  Apply Lemma 32, with the same $eta$, to each $phi.alt_i$, obtaining $rho_i : F_i arrow.r D$. Since $psi_i \( a \)$ is a contraction, Equations (10.1) and (10.6) give
  $ sum_i beta_i ∥T_i \( a \) - rho_i psi_i \( a \)∥_(2 \, tau)^2 lt.eq 4 sum_i beta_i \( 1 - tau \( h_i \) \) + 2 eta lt.eq 6 eta . $
  A second squared triangle inequality and Equation (10.7) yield
  #[#set math.equation(numbering: n => "(10.8)")
   $ sum_i beta_i ∥a - rho_i psi_i \( a \)∥_(2 \, tau)^2 lt.eq 2 \( 3 eta \) + 2 \( 6 eta \) = 18 eta . $ <u:eq:averaged-eighteen>]
  Choose the $r_i$ successively. At step $i$ apply Proposition 30 with
  $ E_i = rho_i \( F_i \) \, #h(2em) S_i = C^(*) \( A \, r_1 \, dots.h \, r_(i - 1) \) . $
  The algebra $S_i$ is unital and norm separable, while $E_i$ is finite dimensional and may be nonunital. We obtain
  #[#set math.equation(numbering: n => "(10.9)")
   $ r_i = r_i^(*) \, quad r_i^2 = 1 \, quad r_i in E'_i \, quad tau \( s r_i \) = 0 quad \( s in S_i \, med tau in Lambda \) . $ <u:eq:successive-centering>]
  Because $r_i$ commutes with $rho_i psi_i \( a \)$ and multiplication by a unitary preserves the tracial $2$-seminorm,
  $ ∥\[ r_i \, a \]∥_(2 \, tau) lt.eq 2 ∥a - rho_i psi_i \( a \)∥_(2 \, tau) . $
  Thus Equation (10.8) gives
  #[#set math.equation(numbering: n => "(10.10)")
   $ sum_i beta_i ∥\[ r_i \, a \]∥_(2 \, tau)^2 lt.eq 72 eta quad \( a in E \) . $ <u:eq:averaged-seventytwo>]
  Every weighted estimate has been obtained at the same fixed $tau$; their constants are independent of that trace.
  Set $z = sum_i sqrt(beta_i) thin r_i$. We spell out the cancellation that converts Equation (10.10) into a bound for $z$. If a word contains $r_j$ exactly once and all its other letters belong to $S_j$, cyclicity writes its trace as $tau \( s r_j \)$ for some $s in S_j$. It vanishes by Equation (10.9). For $i < j$, each of the four terms in $\[ r_i \, a \]^(*) \[ r_j \, a \]$ has this form, since $a \, r_i in S_j$. The reverse mixed term is its adjoint and also has zero trace. Therefore
  $ ∥\[ z \, a \]∥_(2 \, tau)^2 = sum_i beta_i ∥\[ r_i \, a \]∥_(2 \, tau)^2 lt.eq 72 eta . $
  For any $b in A$, the same argument gives $tau \( b r_i \) = 0$ and $tau \( b r_i r_j \) = 0$ for $i eq.not j$. The diagonal terms use $r_i^2 = 1$ and $sum_i beta_i = 1$, proving $tau \( b z \) = 0$ and $tau \( b z^2 \) = tau \( b \)$. These are coefficient identities, and do not require the different $r_i$ to commute.
  For the fourth moment write $z_i = sum_(j lt.eq i) sqrt(beta_j) thin r_j$, with $z_0 = 0$. At step $i$ put $X = z_(i - 1)$, $r = r_i$, and $c = sqrt(beta_i)$. The full noncommutative expansion, grouped only after applying the trace, is
  $ tau \( \( X + c r \)^4 \) =  & tau \( X^4 \) + 4 c tau \( X^3 r \)\
 & + c^2 #scale(x: 120%, y: 120%)[\(] 4 tau \( X^2 \) + 2 tau \( X r X r \) #scale(x: 120%, y: 120%)[\)] + 4 c^3 tau \( X r \) + c^4 . $
  Indeed, the four words with one $r$ are cyclic permutations of $X^3 r$. The four words with three $r$ reduce, by cyclicity and $r^2 = 1$, to $X r$. Of the six words with two $r$’s, four have trace $tau \( X^2 \)$, and two are alternating. The terms with one or three $r$ vanish by Equation (10.9). Tracial Cauchy–Schwarz gives
  $ \| tau \( X r X r \) \| lt.eq ∥X r∥_(2 \, tau) ∥r X∥_(2 \, tau) = tau \( X^2 \) . $
  The already proved second-moment cancellation, applied to the partial sum, gives $tau \( X^2 \) = sum_(j < i) beta_j$. Consequently
  $ tau \( z_i^4 \) lt.eq tau \( z_(i - 1)^4 \) + 6 beta_i sum_(j < i) beta_j + beta_i^2 . $
  Summing over $i$ proves the claimed bound, including its sharper form:
  #[#set math.equation(numbering: n => "(10.11)")
   $ tau \( z^4 \) lt.eq 6 sum_(j < i) beta_i beta_j + sum_i beta_i^2 = 3 #scale(x: 180%, y: 180%)[\(] sum_i beta_i #scale(x: 180%, y: 180%)[\)]^2 - 2 sum_i beta_i^2 = 3 - 2 sum_i beta_i^2 lt.eq 3 . $ <u:eq:averaged-fourth>]
  Finally, $∥z∥ lt.eq sum_i sqrt(beta_i) lt.eq sqrt(M)$, which explains why this construction alone does not give a common norm bound as the approximation data vary. ◻
]

=== 10.3 Clipping and the local assertion in $A$ <clipping-and-the-local-assertion-in-a>

#thm([Lemma 10.4.])[
  (Tracial clipping).  #emph[Let $z = z^(*) in D$, let $R > 0$, and set 
$ g_R \( s \) = max \( - R \, min \( s \, R \) \) \, #h(2em) d = g_R \( z \) . $

 For every $a in D$ and $tau in Lambda$, 
#[#set math.equation(numbering: n => "(10.12)")
 $ ∥\[ d \, a \]∥_(2 \, tau) lt.eq ∥\[ z \, a \]∥_(2 \, tau) . $ <u:eq:clipping-commutator>]

 Moreover, for every contraction $b in D$, 
#[#set math.equation(numbering: n => "(10.13)")
 $ \| tau \( b \( d - z \) \) \| & lt.eq R^(- 3) tau \( z^4 \) \,\
\| tau \( b \( d^2 - z^2 \) \) \| & lt.eq R^(- 2) tau \( z^4 \) \,\
tau \( d^4 \) & lt.eq tau \( z^4 \) . $ <u:eq:clipping-tails>]

 In particular, if $z$ is obtained from Proposition 33, then $∥d∥ lt.eq R$ and, for every $tau in Lambda$, 
#[#set math.equation(numbering: n => "(10.14)")
 $ ∥\[ d \, a \]∥_(2 \, tau) & lt.eq sqrt(72 eta) &  & \( a in E \) \,\
\| tau \( b d \) \| & lt.eq 3 \/ R^3 &  & \( b in A \, med ∥b∥ lt.eq 1 \) \,\
\| tau \( b \( d^2 - 1 \) \) \| & lt.eq 3 \/ R^2 &  & \( b in A \, med ∥b∥ lt.eq 1 \) \,\
tau \( d^4 \) & lt.eq 3 $ <u:eq:clipped-moments>]

]
] <u:lem:clipping>

#proof[
  Fix $tau$ and form the Hilbert space $L^2 \( D \, tau \)$ by quotienting out the zero vectors of the tracial seminorm and completing. Left and right multiplication by the bounded selfadjoint $z$ define commuting bounded selfadjoint operators $L_z$ and $R_z$ on this space. Continuous functional calculus gives $g_R \( L_z \) = L_d$ and $g_R \( R_z \) = R_d$. Let $E_z$ be their joint spectral measure, and let $mu_a$ be the finite positive measure $mu_a \( U \) = chevron.l E_z \( U \) a \, a chevron.r$. The scalar $1$-Lipschitz inequality for $g_R$ gives
  $ ∥\[ d \, a \]∥_(2 \, tau)^2 & = integral_(bb(R)^2) \| g_R \( s \) - g_R \( t \) \|^2 thin d mu_a \( s \, t \)\
 & lt.eq integral_(bb(R)^2) \| s - t \|^2 thin d mu_a \( s \, t \) = ∥\[ z \, a \]∥_(2 \, tau)^2 . $
  This proves Equation (10.12) in tracial $L^2$.
  For real $s$, the scalar inequalities
  $ \| s - g_R \( s \) \| lt.eq frac(\| s \|^4, R^3) \, #h(2em) \| s^2 - g_R \( s \)^2 \| lt.eq frac(\| s \|^4, R^2) \, #h(2em) \| g_R \( s \) \|^4 lt.eq \| s \|^4 $
  follow by considering $\| s \| lt.eq R$ and $\| s \| > R$. Functional calculus therefore bounds the traces of $\| z - d \|$ and $\| z^2 - d^2 \|$ by the first two right-hand sides of Equation (10.13). For completeness, the trace inequality that permits arbitrary contractive coefficients is
  #[#set math.equation(numbering: n => "(10.15)")
   $ \| tau \( b x \) \| lt.eq tau \( \| x \| \) quad \( ∥b∥ lt.eq 1 \) . $ <u:eq:trace-coefficient-bound>]
  To see it, take the polar decomposition $x = u \| x \|$ in $D^(* *)$ and use the normal tracial extension of $tau$. With $y = \| x \|^(1 \/ 2)$ and $c = b u$, traciality and Cauchy–Schwarz give
  $ \| tau \( b x \) \| = \| tau \( y c y \) \| lt.eq tau \( y^2 \)^(1 \/ 2) tau \( y c^(*) c y \)^(1 \/ 2) lt.eq tau \( y^2 \) = tau \( \| x \| \) . $
  This proves Equation (10.13) without a commutation assumption on $b$. Combining it with Equation (10.5) proves Equation (10.14). ◻
]

#thm([Proposition 10.5.])[
  (Local bounded moments in $A$).  #emph[Fix $R gt.eq 1$. For every finite set $E subset A$ of selfadjoint contractions, every finite set $H subset A$ of contractions, and every $sigma > 0$, there is a selfadjoint $d in A$ with $∥d∥ lt.eq R$ such that, simultaneously, 
#[#set math.equation(numbering: n => "(10.16)")
 $ ∥\[ d \, a \]∥_(2 \, T) & < sigma &  & \( a in E \) \,\
sup_(tau in T) \| tau \( b d \) \| & lt.eq 3 \/ R^3 + sigma &  & \( b in H \) \,\
sup_(tau in T) \| tau \( b \( d^2 - 1 \) \) \| & lt.eq 3 \/ R^2 + sigma &  & \( b in H \) \,\
sup_(tau in T) tau \( d^4 \) & lt.eq 3 + sigma . $ <u:eq:local-moments>]

]
] <u:prop:local-moments>

#proof[
  Choose $0 < eta < 1$ so that $sqrt(72 eta) < sigma \/ 2$. Proposition 33 and Lemma 34 give $macron(d) = macron(d)^(*) in D$ with $∥macron(d)∥ lt.eq R$ satisfying Equation (10.14). Choose a selfadjoint lift of $macron(d)$ to $ell^oo \( bb(N) \, A \)$ and apply $g_R$ at every coordinate. The resulting lift $\( d_l \)$ remains a lift of $macron(d)$ and satisfies $d_l = d_l^(*)$ and $∥d_l∥ lt.eq R$ for every $l$.
  By Equation (7.1) and the trace-test identity in Lemma 21,
  $ lim_(l arrow.r omega) ∥\[ d_l \, a \]∥_(2 \, T) & = ∥\[ macron(d) \, a \]∥_(2 \, Lambda) < sigma \/ 2 \,\
lim_(l arrow.r omega) sup_(tau in T) \| tau \( b d_l \) \| & = sup_(tau in Lambda) \| tau \( b macron(d) \) \| lt.eq 3 \/ R^3 \,\
lim_(l arrow.r omega) sup_(tau in T) \| tau \( b \( d_l^2 - 1 \) \) \| & = sup_(tau in Lambda) \| tau \( b \( macron(d)^2 - 1 \) \) \| lt.eq 3 \/ R^2 \,\
lim_(l arrow.r omega) sup_(tau in T) tau \( d_l^4 \) & = sup_(tau in Lambda) tau \( macron(d)^4 \) lt.eq 3 . $
  There are only finitely many tests, indexed by $E$, $H$, and the one fourth-moment test. For each test the desired bound in Equation (10.16) holds on a set in $omega$, using the strict margin $sigma \/ 2$ for commutators and the positive margin $sigma$ for moments. Their finite intersection belongs to $omega$ and is nonempty. Any coordinate in it supplies the required $d$. ◻
]

For fixed $R$ the two coefficient errors retained in Equation (10.16) are $3 \/ R^3$ and $3 \/ R^2$; only the additional error $sigma$ is arbitrarily small. The norm bound $R$ is independent of the nuclear approximation and its number of summands. These are the precise features needed for the passage to separable coefficient algebras in the next section.

== 11 A conditional central limit argument and uniform Gamma <u:sec:gamma>

Throughout the construction of uniform property $Gamma$, let $A$ satisfy the hypotheses of Theorem 4 with $T \( A \) eq.not diameter$, and retain $D$ and $Lambda$ from Section 7. We turn the bounded moment estimates of Section 10 into central projections that split every coefficient trace equally. A common atomless limiting distribution will let us use the same scalar cutoff functions for every trace. We first transfer the local estimates to arbitrary norm-separable coefficient algebras in $D$, then adjoin commuting variables successively. Their normalized sums will have Gaussian limiting characteristic functions, and equal-measure Gaussian intervals will give the required projections.

=== 11.1 Transfer to separable coefficient algebras <transfer-to-separable-coefficient-algebras>

The local conclusion of Proposition 35 applies to coordinate lifts of elements of any norm-separable subalgebra of $D$.

#thm([Proposition 11.1.])[
  (Relative moment estimates).  #emph[Let $C subset D$ be a unital norm-separable $C^(*)$-subalgebra and fix $R gt.eq 1$. There is a selfadjoint element $d in D ∩ C'$ with $∥d∥ lt.eq R$ such that, for every $b in C$ with $∥b∥ lt.eq 1$ and every $tau in Lambda$, 
#[#set math.equation(numbering: n => "(11.1)")
 $ \| tau \( b d \) \| lt.eq 3 / R^3 \, #h(2em) \| tau \( b \( d^2 - 1 \) \) \| lt.eq 3 / R^2 \, #h(2em) tau \( d^4 \) lt.eq 3 . $ <u:eq:relative-moments>]

]
] <u:prop:relative-moments>

#proof[
  Choose a norm-dense sequence $\( c_k \)_(k gt.eq 1)$ in the unit ball of $C$ and a norm-dense sequence $\( x_k \)_(k gt.eq 1)$ in its selfadjoint unit ball. Choose lifts $\( c_(k \, l) \)_(l gt.eq 1)$ consisting of contractions in $A$ and lifts $\( x_(k \, l) \)_(l gt.eq 1)$ consisting of selfadjoint contractions in $A$. These lifts are chosen separately for each element; no multiplicative lifting of $C$ is needed.
  At coordinate $l$, use Proposition 35 with the finite sets
  $ H_l = { c_(1 \, l) \, dots.h \, c_(l \, l) } \, #h(2em) E_l = { x_(1 \, l) \, dots.h \, x_(l \, l) } \, $
  with tolerance $1 \/ l$, and with the same fixed number $R$ at every coordinate. Obtain $d_l = d_l^(*) in A$, $∥d_l∥ lt.eq R$, such that for $k lt.eq l$,
  $ ∥\[ d_l \, x_(k \, l) \]∥_(2 \, T) & < 1 \/ l \,\
sup_(rho in T) \| rho \( c_(k \, l) d_l \) \| & lt.eq 3 \/ R^3 + 1 \/ l \,\
sup_(rho in T) \| rho \( c_(k \, l) \( d_l^2 - 1 \) \) \| & lt.eq 3 \/ R^2 + 1 \/ l \,\
sup_(rho in T) rho \( d_l^4 \) & lt.eq 3 + 1 \/ l . $
  The local proposition permits arbitrary finite subsets of $A$, so their dependence on $l$ causes no change in its hypotheses. The common bound $R$ makes $\( d_l \)_l$ a bounded sequence. Let $d$ be its image in $D$.
  For a fixed $k$, the displayed estimates hold for all $l gt.eq k$. Taking ultralimits, using Equation (7.1) for the commutators and the definition of limit traces for the moment tests, gives
  $ ∥\[ d \, x_k \]∥_(2 \, Lambda) = 0 \, #h(2em) \| tau \( c_k d \) \| lt.eq 3 \/ R^3 \, #h(2em) \| tau \( c_k \( d^2 - 1 \) \) \| lt.eq 3 \/ R^2 \, #h(2em) tau \( d^4 \) lt.eq 3 $
  for every $tau in Lambda$. Since the uniform tracial $2$-norm detects zero in $D$, $\[ d \, x_k \] = 0$. Norm continuity and linearity give $d in C'$. For completeness, the relevant continuity estimates are
  $ ∥\[ d \, x - y \]∥_(2 \, Lambda) & lt.eq 2 R ∥x - y∥ \,\
\| tau \( \( b - c \) d \) \| & lt.eq R ∥b - c∥ \,\
\| tau \( \( b - c \) \( d^2 - 1 \) \) \| & lt.eq \( R^2 + 1 \) ∥b - c∥ . $
  They extend the two moment bounds from $\( c_k \)_k$ to the entire unit ball of $C$, uniformly over $Lambda$. Nuclearity was used in obtaining the local assertion in $A$; this transfer places no nuclearity hypothesis on $C$. ◻
]

=== 11.2 Commuting rows and their characteristic functions <commuting-rows-and-their-characteristic-functions>

#thm([Proposition 11.2.])[
  (A conditional central limit construction).  #emph[For every integer $N gt.eq 1$ there exist mutually commuting selfadjoint elements $d_(N \, 1) \, dots.h \, d_(N \, N) in D ∩ A'$, each of norm at most $N$, with the following properties. Put 
$ C_(N \, j) = C^(*) \( A \, d_(N \, 1) \, dots.h \, d_(N \, j - 1) \) \, #h(2em) s_N = 1 / sqrt(N) sum_(j = 1)^N d_(N \, j) . $

 For every contraction $b in C_(N \, j)$ and $tau in Lambda$, 
#[#set math.equation(numbering: n => "(11.2)")
 $ \| tau \( b d_(N \, j) \) \| lt.eq 3 / N^3 \, #h(2em) \| tau \( b \( d_(N \, j)^2 - 1 \) \) \| lt.eq 3 / N^2 \, #h(2em) tau \( d_(N \, j)^4 \) lt.eq 3 . $ <u:eq:row-moments>]

 For every fixed $t in bb(R)$, 
#[#set math.equation(numbering: n => "(11.3)")
 $ lim_(N arrow.r oo) sup_(tau in Lambda\
a in A \, med ∥a∥ lt.eq 1) lr(|tau \( a e^(i t s_N) \) - e^(- t^2 \/ 2) tau \( a \)|) = 0 . $ <u:eq:uniform-characteristic-functions>]

]
] <u:prop:conditional-clt>

#proof[
  Fix $N$. At the $j$th step, apply Proposition 36 with $R = N$ to $C_(N \, j)$. This algebra is unital and norm separable, since $A$ is separable and only finitely many elements have been adjoined. The resulting $d_(N \, j)$ commutes exactly with $A$ and its predecessors and satisfies Equation (11.2). This constructs each row separately.
  We prove the asserted convergence quantitatively. Fix $t in bb(R)$, $tau in Lambda$, and a contraction $a in A$. Define
  $ P_0 = 1 \, #h(2em) P_j = product_(k = 1)^j e^(i t d_(N \, k) \/ sqrt(N)) \, #h(2em) u_j = tau \( a P_j \) \, #h(2em) q_N = 1 - frac(t^2, 2 N) . $
  At step $j$, the coefficient $b = a P_(j - 1)$ belongs to $C_(N \, j)$ and has norm at most one. Write $d = d_(N \, j)$. Scalar Taylor expansion with its integral remainder gives
  $ \| e^(i x) - 1 - i x + x^2 \/ 2 \| lt.eq \| x \|^3 \/ 6 #h(2em) \( x in bb(R) \) . $
  Functional calculus, followed by the tracial inequality $\| tau \( b y \) \| lt.eq tau \( \| y \| \)$ for a contraction $b$, therefore yields
  $ & lr(|tau \( b e^(i t d \/ sqrt(N)) \) - tau \( b \) - frac(i t, sqrt(N)) tau \( b d \) + frac(t^2, 2 N) tau \( b d^2 \)|)\
 & #h(35mm)  lt.eq frac(\| t \|^3, 6 N^(3 \/ 2)) tau \( \| d \|^3 \) lt.eq frac(3^(3 \/ 4) \| t \|^3, 6 N^(3 \/ 2)) . $
  The last inequality is Hölder’s inequality for the probability measure associated with $d$ and the tracial state $tau$, since $tau \( \| d \|^3 \) lt.eq tau \( d^4 \)^(3 \/ 4)$. Inserting the two conditional moment bounds from Equation (11.2) proves, for every $1 lt.eq j lt.eq N$,
  #[#set math.equation(numbering: n => "(11.4)")
   $ \| u_j - q_N u_(j - 1) \| & lt.eq epsilon.alt_N \( t \) \,\
epsilon.alt_N \( t \) & = frac(3^(3 \/ 4) \| t \|^3, 6 N^(3 \/ 2)) + frac(3 \| t \|, N^(7 \/ 2)) + frac(3 t^2, 2 N^3) . $ <u:eq:clt-recurrence>]
  Every bound here holds for all $tau in Lambda$ and all contractions $a in A$, with the same right-hand side.
  For fixed $t$, one has $\| q_N \| lt.eq 1$ once $N gt.eq t^2 \/ 4$. Telescoping the recurrence gives
  $ u_N - q_N^N u_0 = sum_(j = 1)^N q_N^(N - j) \( u_j - q_N u_(j - 1) \) \, #h(2em) \| u_N - q_N^N tau \( a \) \| lt.eq N epsilon.alt_N \( t \) . $
  Since the elements in a row commute, $P_N = e^(i t s_N)$. Consequently
  #[#set math.equation(numbering: n => "(11.5)")
   $ & sup_(tau in Lambda\
a in A \, med ∥a∥ lt.eq 1) \| tau \( a e^(i t s_N) \) - e^(- t^2 \/ 2) tau \( a \) \|\
 & #h(2em) lt.eq frac(3^(3 \/ 4) \| t \|^3, 6 sqrt(N)) + frac(3 \| t \|, N^(5 \/ 2)) + frac(3 t^2, 2 N^2) + lr(|(1 - frac(t^2, 2 N))^N - e^(- t^2 \/ 2)|) arrow.r 0 . $ <u:eq:quantitative-clt>]
  This proves Equation (11.3). The coefficients $a P_(j - 1)$ are exactly why moment bounds against the whole earlier algebra were required. No independence of the variables or equality of their distributions has been assumed. ◻
]

Each $s_N$ is a single element of $D ∩ A'$. The available estimate $∥s_N∥ lt.eq N^(3 \/ 2)$ is sufficient here: the family $\( s_N \)_N$ is not used as a bounded sequence representing an element of an ultrapower.

=== 11.3 Uniform weak convergence and Gaussian partitions <uniform-weak-convergence-and-gaussian-partitions>

Let $gamma$ be the standard Gaussian probability measure on $bb(R)$, so that

$ d gamma \( x \) = \( 2 pi \)^(- 1 \/ 2) e^(- x^2 \/ 2) thin d x \, #h(2em) integral_(bb(R)) e^(i t x) thin d gamma \( x \) = e^(- t^2 \/ 2) . $

#thm([Lemma 11.3.])[
  (Uniform weak convergence with a fixed coefficient).  #emph[For every fixed positive contraction $a in A$ and every fixed bounded continuous function $f : bb(R) arrow.r bb(C)$, 
#[#set math.equation(numbering: n => "(11.6)")
 $ lim_(N arrow.r oo) sup_(tau in Lambda) lr(|tau \( a f \( s_N \) \) - tau \( a \) integral_(bb(R)) f thin d gamma|) = 0 . $ <u:eq:uniform-weak-convergence>]

]
] <u:lem:uniform-weak-convergence>

#proof[
  Suppose the conclusion fails. Then $∥f∥_oo > 0$, and there are $delta > 0$, integers $N_k arrow.r oo$, and traces $tau_k in Lambda$ such that
  #[#set math.equation(numbering: n => "(11.7)")
   $ lr(|tau_k \( a f \( s_(N_k) \) \) - tau_k \( a \) integral_(bb(R)) f thin d gamma|) gt.eq delta #h(2em) \( k gt.eq 1 \) . $ <u:eq:weak-failure>]
  The positive functional $x mapsto tau_k \( a^(1 \/ 2) x a^(1 \/ 2) \)$ has norm $tau_k \( a \)$ and agrees with $x mapsto tau_k \( a x \)$ by traciality. Thus the left side of Equation (11.7) is at most $2 ∥f∥_oo tau_k \( a \)$, and in particular
  $ tau_k \( a \) gt.eq c := frac(delta, 2 ∥f∥_oo) > 0 . $
  On the compact spectrum of $s_(N_k)$, the formula
  $ h mapsto frac(tau_k \( a h \( s_(N_k) \) \), tau_k \( a \)) $
  defines a positive unital functional. Its representing probability measure, viewed as a measure $mu_k$ on $bb(R)$, satisfies
  $ integral_(bb(R)) h thin d mu_k = frac(tau_k \( a h \( s_(N_k) \) \), tau_k \( a \)) $
  for every bounded continuous $h$ on $bb(R)$. By Equation (11.3), for every fixed $t in bb(R)$,
  $ lr(|integral_(bb(R)) e^(i t x) thin d mu_k \( x \) - e^(- t^2 \/ 2)|) lt.eq 1 / c sup_(tau in Lambda) \| tau \( a e^(i t s_(N_k)) \) - e^(- t^2 \/ 2) tau \( a \) \| arrow.r 0 . $
  The classical Lévy continuity theorem for characteristic functions #cite(label("Dobler")) Theorem 1.1 now implies $mu_k arrow.r gamma$ weakly: the limiting characteristic function is that of a probability measure and is continuous at zero. Hence $integral f thin d mu_k arrow.r integral f thin d gamma$. Multiplying by $0 < tau_k \( a \) lt.eq 1$ contradicts Equation (11.7). This argument permits the testing trace to vary with $k$, which proves the asserted uniformity. It also accommodates the varying spectra of $s_(N_k)$; no common spectral bound is needed for the continuity theorem. ◻
]

#thm([Theorem 11.4.])[
  (Uniform property Gamma).  #emph[Let $A$ be a simple, separable, unital, infinite-dimensional nuclear $C^(*)$-algebra with nonempty tracial-state space and strict comparison as in Definition 19. For every integer $m gt.eq 1$ there exist pairwise orthogonal projections $p_1 \, dots.h \, p_m in D ∩ A'$ such that 
#[#set math.equation(numbering: n => "(11.8)")
 $ sum_(i = 1)^m p_i = 1 \, #h(2em) tau \( a p_i \) = frac(tau \( a \), m) quad \( a in A \, med tau in Lambda \, med 1 lt.eq i lt.eq m \) . $ <u:eq:gamma-projections>]

 In particular, $A$ has uniform property $Gamma$.]
] <u:thm:uniform-gamma>

#proof[
  For $m = 1$, take $p_1 = 1$. Suppose $m gt.eq 2$, and choose the Gaussian quantiles
  $ - oo = q_0 < q_1 < dots.h.c < q_(m - 1) < q_m = + oo $
  so that the consecutive intervals $I_i$ between $q_(i - 1)$ and $q_i$ each have $gamma$-measure $1 \/ m$. The assignment of the finite endpoints is immaterial because $gamma$ has no atoms.
  Fix a finite set $H$ of positive contractions in $A$ and a tolerance $epsilon > 0$. Choose $theta > 0$ so small that
  $ 2 theta < epsilon \, #h(2em) frac(17 theta, 16) < epsilon^2 . $
  Choose pairwise disjoint open intervals about the finitely many quantiles $q_1 \, dots.h \, q_(m - 1)$ whose union $U$ has $gamma \( U \) < theta$. Interpolating linearly across these intervals gives continuous functions $f_1 \, dots.h \, f_m : bb(R) arrow.r \[ 0 \, 1 \]$ with
  $ sum_(i = 1)^m f_i = 1 \, #h(2em) f_i = 1_(I_i) med upright("on ") bb(R) \\ U . $
  At a transition around $q_i$, only $f_i$ and $f_(i + 1)$ vary, with one decreasing from one to zero and the other its complement. In particular,
  #[#set math.equation(numbering: n => "(11.9)")
   $ lr(|integral f_i thin d gamma - 1 / m|) < theta \, #h(2em) integral \( f_i - f_i^2 \)^2 thin d gamma < theta / 16 . $ <u:eq:gaussian-partition-errors>]
  The second estimate uses $\( u - u^2 \)^2 lt.eq 1 \/ 16$ for $0 lt.eq u lt.eq 1$, and the integrand vanishes outside $U$.
  Keep these functions fixed. Apply Lemma 38 to every pair $\( a \, f_i \)$ with $a in H$, and to $\( 1 \, \( f_i - f_i^2 \)^2 \)$ for each $i$. For all sufficiently large $N$, all of these finitely many convergence errors are less than $theta$. Set $v_i = f_i \( s_N \)$. These are positive contractions in $D ∩ A'$ and satisfy $sum_i v_i = 1$. Equation (11.9) gives
  $ sup_(tau in Lambda) \| tau \( a v_i \) - tau \( a \) \/ m \| & < 2 theta < epsilon #h(2em) \( a in H \) \,\
∥v_i - v_i^2∥_(2 \, Lambda)^2 & = sup_(tau in Lambda) tau #scale(x: 120%, y: 120%)[\(] \( f_i - f_i^2 \)^2 \( s_N \) #scale(x: 120%, y: 120%)[\)] < frac(17 theta, 16) < epsilon^2 . $
  Thus arbitrarily accurate finite sets of trace-splitting and projection tests can be met by $m$ positive contractions that already commute with $A$ and sum to one.
  Choose a countable norm-dense family $\( a_k \)_(k gt.eq 1)$ in the positive unit ball of $A$. Apply Lemma 21 to the $m$ variables constrained to be positive contractions, with the countable tests
  $ ∥p_i^2 - p_i∥_(2 \, Lambda) & = 0 &  & \( 1 lt.eq i lt.eq m \) \,\
∥∥ * sum_(i = 1)^m p_i - 1_(2 \, Lambda) & = 0 \,\
∥\[ p_i \, a_k \]∥_(2 \, Lambda) & = 0 &  & \( 1 lt.eq i lt.eq m \, med k gt.eq 1 \) \,\
sup_(tau in Lambda) \| tau \( a_k p_i - a_k \/ m \) \| & = 0 &  & \( 1 lt.eq i lt.eq m \, med k gt.eq 1 \) . $
  The preceding finite construction verifies the hypotheses of that lemma. In this application the diagonal variables are only the $m$ positive contractions $v_i$; the elements $s_N$ are not diagonal variables. In particular all required lifts lie in fixed norm balls. The sum-to-one equation is included among the tests, regardless of which positive contractive lifts of a trial tuple are chosen.
  The resulting positive contractions $p_i$ are projections, commute with $A$, and sum to one, because the uniform tracial $2$-norm detects zero in $D$ and commutation extends by norm density and linearity. They are pairwise orthogonal: for each $i$,
  $ 0 = p_i \( 1 - p_i \) p_i = sum_(j eq.not i) p_i p_j p_i = sum_(j eq.not i) \( p_j p_i \)^(*) \( p_j p_i \) \, $
  and positivity forces $p_j p_i = 0$ for $j eq.not i$. The trace equations extend from the dense family to every positive contraction, uniformly over $Lambda$, and then by scaling and linearity to every element of $A$. This proves Equation (11.8), which is uniform property $Gamma$ as in Definition 22. ◻
]

=== 11.4 Jiang–Su absorption and the traceless case <jiangsu-absorption-and-the-traceless-case>

#proof[
  If $T \( A \) eq.not diameter$, Theorem 39 gives uniform property $Gamma$. Lemma 20 converts the assumed stabilized comparison to the convention used in Theorem 23. That theorem therefore gives $A tilde.equiv A ⊗_min cal(Z)$.
  Suppose now that $T \( A \) = diameter$. The comparison convention in the hypothesis says that every positive element of the stabilization is Cuntz subequivalent to every nonzero positive element. We show directly that every nonzero hereditary subalgebra of $A$ contains an infinite projection.
  Given $0 eq.not b in A_(+)$, the stipulated comparison gives $1 prec.tilde b$. The comparison witnesses can be taken in $A$: view $1$ and $b$ in the corner determined by $e = 1_A ⊗ e_11$, and compress every stabilized witness $z_n$ to $x_n = e z_n e$. Then
  $ x_n^(*) b x_n = e z_n^(*) b z_n e arrow.r e \, $
  which is $x_n^(*) b x_n arrow.r 1$ after identifying this corner with $A$. Choose $x in A$ for which $t = x^(*) b x$ is invertible and put
  $ w = b^(1 \/ 2) x t^(- 1 \/ 2) . $
  Then $w^(*) w = 1$, while
  $ p = w w^(*) = b^(1 \/ 2) x t^(- 1) x^(*) b^(1 \/ 2) in "her" \( b \) $
  is a projection Murray–von Neumann equivalent to $1$.
  There are orthogonal nonzero positive elements $b \, c in A$: take nonnegative continuous functions with disjoint supports near two distinct spectral points of a nonscalar selfadjoint element. For this $b$, the projection $p in "her" \( b \)$ above annihilates $c$, so $p eq.not 1$. Thus $1$ is an infinite projection. For any nonzero hereditary subalgebra $E subset A$, choose $0 eq.not h in E_(+)$ and repeat the construction to obtain a projection $p_h in "her" \( h \) subset E$ equivalent to $1$. It is infinite inside $E$: an isometry $w_h$ with $w_h^(*) w_h = 1$ and $w_h w_h^(*) = p_h$ identifies $A$ with $p_h A p_h subset E$, and carries a proper subprojection equivalent to $1$ to a proper subprojection equivalent to $p_h$. We have proved the hereditary-subalgebra definition of pure infiniteness for the simple algebra $A$.
  Kirchberg–Phillips’ absorption theorem #cite(label("KP")) Theorem 3.14 now gives $A ⊗_min cal(O)_oo tilde.equiv A$. The algebra $cal(O)_oo$ is strongly self-absorbing #cite(label("TW")) Examples 1.14(ii), and Winter’s theorem gives $cal(O)_oo ⊗_min cal(Z) tilde.equiv cal(O)_oo$ #cite(label("WinterSSA")) Theorem 3.1. Associativity of the minimal tensor product therefore yields
  $ A ⊗_min cal(Z) & tilde.equiv \( A ⊗_min cal(O)_oo \) ⊗_min cal(Z)\
 & tilde.equiv A ⊗_min \( cal(O)_oo ⊗_min cal(Z) \)\
 & tilde.equiv A ⊗_min cal(O)_oo tilde.equiv A . $
  The absorption theorems used here require no Universal Coefficient Theorem hypothesis. This completes both trace-space cases. ◻
]

== 12 Ultrapowers and preliminary inputs <n:sec:framework>

We begin a separate nonunital construction, using the hypotheses of Theorem 5. The immediate goal is a unital tracial quotient $D = A^omega$ with a specified family of limit traces. Compactness of the normalized trace base supplies its unit; the later projection and model constructions take place in this quotient.

Throughout the proof, $A$ satisfies the hypotheses of Theorem 5. Set $T := T_1 \( A \)$. In particular, every nonzero densely finite trace is a positive scalar multiple of a unique member of $T$. Simplicity makes all members of $T$ faithful. Projectionlessness implies that $A$ is non-elementary and has no nonzero finite-dimensional quotient.

Fix a free ultrafilter $omega$ on $bb(N)$. For a trace $sigma$, write $parallel x parallel_(2 \, sigma) = sigma \( x^(*) x \)^(1 \/ 2)$, and use a set of traces in the subscript to denote the supremum. Set

$ D = A^omega = ell^oo \( A \) \/ I_T \, #h(2em) I_T = { \( a_n \) : lim_omega parallel a_n parallel_(2 \, T) = 0 } . $

The tracial inequalities make $I_T$ a closed ideal. Let $Lambda$ be the family of limit traces on $D$, namely the traces given by

$ tau \( \[ \( a_n \) \] \) = lim_omega sigma_n \( a_n \) \, #h(2em) sigma_n in T . $

We regard $A$ as a subalgebra of $D$ through constant sequences.

#thm([Lemma 12.1.])[
  #emph[The algebra $D$ is unital, $Lambda$ consists of tracial states, and every $tau in Lambda$ restricts to an element of $T$. Moreover, 
$ parallel \[ \( a_n \) \] parallel_(2 \, Lambda) = lim_omega parallel a_n parallel_(2 \, T) \, $

 and this norm detects zero in $D$.]
] <n:lem:unit>

#proof[
  Choose an increasing sequential contractive approximate unit $\( u_n \)$. The continuous functions $sigma mapsto sigma \( u_n \)$ increase to $1$ on compact $T$, so Dini’s theorem gives uniform convergence. In a tracial von Neumann representation, for any bounded sequence $\( a_n \)$,
  $ parallel \( 1 - u_n \) a_n parallel_(2 \, sigma)^2 lt.eq parallel a_n parallel^2 sigma \( \( 1 - u_n \)^2 \) lt.eq parallel a_n parallel^2 \( 1 - sigma \( u_n \) \) . $
  The same estimate holds on the right. Thus $\( u_n \)$ represents $1_D$. Its value under every limit trace is $1$. Uniform convergence on the constant approximate units also shows that the restriction of each limit trace to $A$ has norm one. The norm identity follows by choosing a trace at each coordinate within an arbitrarily small error of the supremum. Its last assertion is the definition of the quotient. ◻
]

We will repeatedly use the following consequence. Bounds on finitely many continuous expressions in the limit-trace values of bounded tuples give uniform coordinate bounds along $omega$, with any additional positive slack. If such a bound failed, choosing witnessing traces on the offending coordinates would give a contradicting limit trace. Positive contractions and self-adjoint contractions in a $C^(*)$-quotient have lifts of the same kind, by continuous functional calculus.

We record the external inputs used before the final absorption step. A completely positive map is #emph[order zero] if it preserves orthogonality of positive elements. All order-zero maps below are contractive. Matrix order-zero maps lift across arbitrary $C^(*)$-quotients #cite(label("CETW")) Proposition 1.8. For such a map $theta$ from a unital algebra there is a supporting homomorphism $pi$ in the bidual of its target such that

$ theta \( d \) = h pi \( d \) \, #h(2em) h = theta \( 1 \) \, #h(2em) \[ h \, pi \( d \) \] = 0 . $

If $f in C \( \[ 0 \, 1 \] \)$ and $f \( 0 \) = 0$, then $f \( h \) pi \( d \)$ is in the target algebra #cite(label("WZ")) Theorem 3.3 and Corollary 4.2.

A homomorphism from a finite direct sum of matrix algebras into a quotient consequently has an order-zero lift. Indeed, for two orthogonal image units $e_1 \, e_2$ in the quotient, lift $e_1 - e_2$ as a self-adjoint contraction. Its positive and negative parts generate orthogonal hereditary subalgebras mapping onto the corners at $e_1 \, e_2$. Recurse through the summands and lift each matrix map in its hereditary target. The ranges are orthogonal, so their sum is contractive and order zero.

For $sigma in T$, let $M_sigma = pi_sigma \( A \)''$. Kaplansky density gives a surjection

#[#set math.equation(numbering: n => "(12.1)")
 $ ell^oo \( A \) arrow.r M_sigma^omega . $ <n:eq:kaplansky>]

To see surjectivity, approximate the $n$th entry of a bounded sequence in $M_sigma$ by an element of the same ball of $A$, with $2$-norm error less than $1 \/ n$. This works also for the unit of $M_sigma$. Consequently, the inclusion of any finite-dimensional unital subalgebra of $M_sigma$ into $M_sigma^omega$ has a coordinatewise order-zero lift to $A$. This same quotient and lifting argument appears in #cite(label("CETW")) Proof of Lemma 4.4. Finally, nuclearity and Connes’ injectivity theorem make $M_sigma$ hyperfinite, with separable predual, for every $sigma$, including nonextreme traces #cite(label("Connes")); see also #cite(label("CETW")) Proof of Lemma 4.5.

For a positive element $b$ in an ambient $C^(*)$-algebra $C$, write $"her" \( b \) = overline(b C b)$. All trace calculations involving supports or supporting homomorphisms may be made in the relevant tracial von Neumann representation. Matrix extensions always use $"Tr"$, not the normalized matrix trace.

== 13 Selecting projections with a prescribed trace <n:sec:selection>

Our first goal is a projection in $D$ with a prescribed trace function and exact support under a positive contraction. Comparison tests support ranks, whereas this goal prescribes ordinary traces. The next lemma connects the two: it approximates a trace by a finite-matrix positive contraction whose excess support rank is small. After constructing the projection, we refine the selection by a one-sided cost bound that will control overlaps and model errors.

#thm([Lemma 13.1.])[
  #emph[For $g in A_(+)$ and $xi > 0$ there is a positive contraction $k$ in a finite matrix algebra over $A$ such that, for every $sigma in T$, 
#[#set math.equation(numbering: n => "(13.1)")
 $ \| sigma \( k \) - sigma \( g \) \| < xi \, #h(2em) 0 lt.eq d_sigma \( k \) - sigma \( k \) < xi . $ <n:eq:rank>]

]
] <n:lem:rank>

#proof[
  First choose a nonzero $b in A_(+)$ with $d_sigma \( b \) < xi$ for all $sigma in T$. An extreme point of the compact convex set $T$ has a factorial tracial GNS representation. This factor cannot be finite dimensional: the representation is faithful, and would make $A$ finite dimensional. It is therefore a $upright("II")_1$ factor and contains unital matrices of every size. By (12.1) and order-zero lifting, there is a nonzero order-zero map $M_l arrow.r A$ for every $l$. The support projections of its diagonal images are orthogonal and equivalent in every tracial representation. Their sum has trace at most one, so each diagonal has dimension at most $1 \/ l$. Taking $l > 1 \/ xi$ gives $b$.
  Simplicity now gives $c in "her" \( b \)_(+)$ satisfying $\| sigma \( c \) - sigma \( g \) \| < xi$ on $T$, without a norm bound on $c$. Here are details of this trace transfer. Approximate $g^(1 \/ 2)$ in the ideal generated by $b$ by $U D_b V$, with $U$ a row, $V$ a column, and $D_b = "diag" \( b \, dots.h \, b \)$, so that $\( U D_b V \)^(*) \( U D_b V \)$ is within $xi$ of $g$. Set
  $ C = \( D_b U^(*) U D_b \)^(1 \/ 2) in M_N \( "her" \( b \) \) \, #h(2em) v = C V . $
  Each entry $v_j$ belongs to $overline(b A)$. Thus $c = sum_j v_j v_j^(*) in "her" \( b \)_(+)$, and traciality gives $sigma \( c \) = sigma \( v^(*) v \)$, proving the assertion.
  For an integer $N gt.eq parallel c parallel$, put
  $ f_j \( s \) = min \( 1 \, max \( 0 \, s - j + 1 \) \) \, #h(2em) k = xor.big_(j = 1)^N f_j \( c \) . $
  On the spectrum of $c$, the functions sum to $s$, while
  $ 0 lt.eq sum_(j = 1)^N 1_({ f_j \( s \) > 0 }) - s lt.eq 1_({ s > 0 }) . $
  Hence $sigma \( k \) = sigma \( c \)$ and $d_sigma \( k \) - sigma \( k \) lt.eq d_sigma \( c \) lt.eq d_sigma \( b \) < xi$. ◻
]

#thm([Proposition 13.2.])[
  #emph[Let $h \, z \, a in D$ be positive contractions satisfying $h z = z$ and $tau \( a \) lt.eq tau \( z \)$ for all $tau in Lambda$. There is a projection $p in D$ such that 
$ h p = p \, #h(2em) tau \( p \) = tau \( a \) quad \( tau in Lambda \) . $

]
] <n:prop:selection>

#proof[
  We first compare finite-matrix approximations to the desired trace with a spectral cut of the target. A small auxiliary matrix corner supplies the strict rank inequality needed for comparison. We then discard that corner and obtain elements of $A$ whose trace and projection defects vanish along $omega$.
  Take positive contraction lifts $h_n \, z_n \, a_n$. Set
  $ alpha_n = sup_(sigma in T) \( sigma \( a_n \) - sigma \( z_n \) \)_(+) \, #h(2em) beta_n = parallel \( 1 - h_n \) z_n parallel_(2 \, T) . $
  Both tend to zero along $omega$. Choose $0 < delta_n < 1$ tending to zero slowly enough that $beta_n \/ delta_n arrow.r_omega 0$, and put
  $ gamma_n = alpha_n + beta_n \/ delta_n + delta_n \, #h(2em) H_n = \( h_n - 1 + delta_n \)_(+) . $
  In a tracial representation, the support $Q$ of $H_n$ satisfies $delta_n \( 1 - Q \) lt.eq 1 - h_n$. Since $0 lt.eq z_n lt.eq 1$, tracial Cauchy–Schwarz gives
  $ sigma \( z_n \) lt.eq sigma \( Q \) + sigma \( \( 1 - Q \) z_n \) lt.eq d_sigma \( H_n \) + beta_n \/ delta_n . $
  Consequently $sigma \( a_n \) lt.eq d_sigma \( H_n \) + gamma_n$.
  Apply Lemma 41 with $g = a_n$ and $xi = gamma_n$ to obtain $k_n$. Also choose a positive contraction $u in A$ with $inf_T sigma \( u \) > 7 \/ 8$, and apply that lemma to $8 gamma_n u$ with the same tolerance. Its output $c_n$ satisfies
  $ 5 gamma_n lt.eq d_sigma \( c_n \) lt.eq 10 gamma_n . $
  Thus, in disjoint finite matrix blocks,
  #[#set math.equation(numbering: n => "(13.2)")
   $ d_sigma \( k_n \) lt.eq d_sigma \( H_n \) + 3 gamma_n < d_sigma \( H_n xor c_n \) #h(2em) \( sigma in T \) . $ <n:eq:buffer>]
  The target is nonzero, and all these ranks are finite at each coordinate. Every densely finite trace is a multiple of a state in $T$; hence the comparison hypothesis gives $k_n prec.tilde H_n xor c_n$.
  We use the cutdown in a form that also controls its trace. Suppress $n$, and write $b = H_n xor c_n$. Choose $x$ with $parallel x^(*) b x - k parallel < 1 \/ 4$ and set $d = \( k - 1 \/ 2 \)_(+)^(1 \/ 2)$, $y = b^(1 \/ 2) x d$. Then $\| y \|^2 gt.eq d^2 \/ 4$. For the polar decomposition $y = v \| y \|$ in the bidual, the support of $d$ lies under $v^(*) v$, and
  $ parallel \( \| y \| + epsilon.alt \)^(- 1) d parallel lt.eq 2 \, #h(2em) parallel v d - y \( \| y \| + epsilon.alt \)^(- 1) d parallel lt.eq 2 epsilon.alt . $
  The first inequality follows by conjugating $d^2 lt.eq 4 \| y \|^2$ with $\( \| y \| + epsilon.alt \)^(- 1)$ and taking norms. The second proves that $v d$ belongs to the closed right ideal supported by $b$. Therefore
  $ w = sqrt(2) v d \, #h(2em) w^(*) w = 2 \( k - 1 \/ 2 \)_(+) \, #h(2em) r = w w^(*) in "her" \( b \) \, #h(2em) 0 lt.eq r lt.eq 1 . $
  For $f \( s \) = 2 \( s - 1 \/ 2 \)_(+)$ on $\[ 0 \, 1 \]$,
  $ 0 lt.eq s - f \( s \) lt.eq 1_({ s > 0 }) - s \, #h(2em) 0 lt.eq f \( s \) - f \( s \)^2 lt.eq 1_({ s > 0 }) - f \( s \) . $
  Traciality transfers these estimates from $f \( k_n \) = w^(*) w$ to $r_n = w w^(*)$. By (13.1), both $\| sigma \( r_n \) - sigma \( a_n \) \|$ and $sigma \( r_n - r_n^2 \)$ tend uniformly to zero along $omega$.
  Compress $r_n$ to its $H_n$ matrix slot, and identify the resulting positive contraction $p_n$ with an element of $A$. The complementary corner is supported by $c_n$, so this removes at most $10 gamma_n$ of trace. If $P$ is the first-slot projection, the defect identity is
  $ P r_n P - \( P r_n P \)^2 = P \( r_n - r_n^2 \) P + P r_n \( 1 - P \) r_n P . $
  The last term has trace at most $d_sigma \( c_n \)$, since $r_n^2 lt.eq r_n$. In particular, both $\| sigma \( p_n \) - sigma \( a_n \) \|$ and $sigma \( p_n - p_n^2 \)$ are at most $12 gamma_n$, uniformly on $T$. Moreover $p_n in "her" \( H_n \)$, so $parallel \( 1 - h_n \) p_n parallel lt.eq delta_n$. The class $p = \[ \( p_n \) \]$ is a projection: its positive contraction defects have vanishing trace, hence vanishing uniform $2$-norm. It has all the required properties. ◻
]

#thm([Lemma 13.3.])[
  #emph[Let $q in D$ be a projection, $Y in \( q D q \)_(+)$, $0 < t < 1$, and $epsilon > 0$. There is a projection $r lt.eq q$ such that, for $tau in Lambda$, 
#[#set math.equation(numbering: n => "(13.3)")
 $ tau \( r \) = t tau \( q \) \, #h(2em) tau \( r Y \) lt.eq t #scale(x: 120%, y: 120%)[\(] tau \( Y \) + epsilon tau \( q \) #scale(x: 120%, y: 120%)[\)] . $ <n:eq:cost-corner>]

]
] <n:lem:cost>

#proof[
  If $q = 0$, take $r = 0$; if $Y = 0$, apply Proposition 42 to $\( h \, z \, a \) = \( q \, q \, t q \)$. Scaling $Y$ and the tolerance reduces to $0 lt.eq Y lt.eq q$. All functions below are evaluated at $Y$ in the unital corner $q D q$.
  Choose a large integer $m$. Let $F_0 = 0$, $F_m = 1$; for $1 lt.eq j < m$ let $F_j$ be $1$ up to $\( j - 1 \/ 2 \) \/ m$, decrease linearly to $0$ at $j \/ m$, and vanish thereafter. Let $G_j$ be $1$ up to $j \/ m$, decrease to $0$ by $\( j + 1 \/ 3 \) \/ m$, and vanish thereafter for $j < m$; put $G_m = 1$. These functions satisfy
  $ G_j F_j = F_j \, #h(2em) F_(j + 1) G_j = G_j . $
  Construct orthogonal projections $r_j$ recursively with
  $ G_j r_j = r_j \, #h(2em) tau \( r_j \) = t tau \( F_j - F_(j - 1) \) . $
  Indeed, if $R = sum_(i < j) r_i$, then $F_j R = G_j R = R$ and $tau \( R \) = t tau \( F_(j - 1) \)$. Apply Proposition 42 to
  $ h = G_j - R \, #h(2em) z = F_j - R \, #h(2em) a = t \( F_j - F_(j - 1) \) . $
  They are positive contractions, $h z = z$, and $tau \( z \) - tau \( a \) = \( 1 - t \) tau \( F_j \) gt.eq 0$. The selected projection is orthogonal to $R$, lies under $q$, and is fixed by $G_j$.
  Now $r = sum_j r_j$ has trace $t tau \( q \)$. The spectral support conditions give
  $ r_j Y r_j lt.eq frac(j + 1 \/ 3, m) r_j \, $
  whereas $F_j - F_(j - 1)$ is supported at values at least $\( j - 3 \/ 2 \) \/ m$. The difference of these thresholds is $11 \/ \( 6 m \) < 2 \/ m$. Summing therefore gives
  $ tau \( r Y \) lt.eq t sum_j frac(j + 1 \/ 3, m) tau \( F_j - F_(j - 1) \) lt.eq t #scale(x: 120%, y: 120%)[\(] tau \( Y \) + \( 2 \/ m \) tau \( q \) #scale(x: 120%, y: 120%)[\)] . $
  Take $2 \/ m < epsilon$. ◻
]

#thm([Corollary 13.4.])[
  #emph[If $E subset D$ is finite dimensional and unital, $Y in D_(+)$, $0 < t < 1$, and $epsilon > 0$, there is a projection $p in D ∩ E'$ with 
#[#set math.equation(numbering: n => "(13.4)")
 $ tau \( p d \) = t tau \( d \) quad \( d in E \) \, #h(2em) tau \( p Y \) lt.eq t #scale(x: 120%, y: 120%)[\(] tau \( Y \) + epsilon #scale(x: 120%, y: 120%)[\)] quad \( tau in Lambda \) . $ <n:eq:cost>]

]
] <n:cor:cost>

#proof[
  For a matrix summand of size $l$ with matrix units $e_(i j)$, apply Lemma 43 in $e_11 D e_11$ to the observable $l^(- 1) sum_j e_(1 j) Y e_(j 1)$. Repeat the resulting projection along the diagonal, using the matrix units. The repeated projection commutes with the summand and splits its traces proportionally. Its cost is $l$ times the selected corner cost. Adding over the orthogonal summands gives (13.4), since their units sum to $1_D$. ◻
]

== 14 Small central splittings from finite-dimensional models <n:sec:small>

We now construct a positive contraction that approximately splits each coefficient trace in a small proportion $lambda$. The trace and projection errors will be of order $lambda^(3 \/ 2)$, small enough to vanish under the amplification in Section 15. We first state the output, then construct finite-dimensional models and control the sum of projections selected to commute with them.

#thm([Proposition 14.1.])[
  #emph[Let $0 < lambda < 1$, let $cal(F)$ be a finite set of self-adjoint contractions in $A$, and let $rho > 0$. There is a positive contraction $e in A$ such that, for $sigma in T$ and $x in cal(F)$, 
#[#set math.equation(numbering: n => "(14.1)")
 $ parallel \[ e \, x \] parallel_(2 \, sigma) & < rho \,\
\| sigma \( e x \) - lambda sigma \( x \) \| & < lambda^(3 \/ 2) + rho \,\
sigma \( e - e^2 \) & < lambda^(3 \/ 2) + rho . $ <n:eq:small>]

]
] <n:prop:small>

=== 14.1 Averaged finite-dimensional models <n:sec:models>

We now approximate a finite tuple from $A$ by finite-dimensional subalgebras of $D$. Hyperfiniteness first supplies an order-zero model at each trace. Convex averaging makes their weighted squared error uniformly small, and projection selection replaces each order-zero model by a finite-dimensional subalgebra of $D$. The number of models may grow as the accuracy improves; only their weighted total error will enter the next construction.

#thm([Proposition 14.2.])[
  #emph[For a finite set $cal(F)$ of self-adjoint contractions in $A$ and $Delta > 0$, there are unital finite-dimensional subalgebras $D_i subset D$, self-adjoint contractions $x^(\( i \)) in D_i$ for each $x in cal(F)$, and positive weights $w_i$ summing to one, such that 
#[#set math.equation(numbering: n => "(14.2)")
 $ E_i = sum_(x in cal(F)) \( x - x^(\( i \)) \)^2 \, #h(2em) sum_i w_i tau \( E_i \) < Delta quad \( tau in Lambda \) . $ <n:eq:models>]

]
] <n:prop:models>

#proof[
  Consider all finite-dimensional unital $E^0$, order-zero maps $theta : E^0 arrow.r A$, and self-adjoint contractions $b_x in E^0$. Their error functions
  $ L \( sigma \) = 1 - sigma \( theta \( 1 \) \) + sum_(x in cal(F)) sigma \( \( x - theta \( b_x \) \)^2 \) $
  are nonnegative continuous affine functions on $T$. At each fixed $sigma$, hyperfiniteness of $M_sigma$ supplies a unital finite-dimensional subalgebra approximating the tuple in $2$-norm by self-adjoint contractions. Lift its inclusion through (12.1) and choose a coordinate. This makes $L \( sigma \)$ arbitrarily small, including its unit-defect term.
  For every $kappa > 0$, a finite convex combination of these functions has maximum less than $kappa$. Otherwise separate their convex hull from the open convex set ${ f in C \( T \, bb(R) \) : max_T f < kappa }$. The separating functional is positive, since this set is closed under adding arbitrary negative functions. Normalize it to a probability measure $mu$. Its barycenter $sigma_mu$ belongs to compact convex $T$, and affinity gives $L \( sigma_mu \) = integral L thin d mu gt.eq kappa$ for every candidate $L$, a contradiction. Denote the resulting data by $D_i^0 \, theta_i \, b_(i \, x) \, w_i$.
  We next replace each $theta = theta_i$, now viewed in $D$, by a homomorphism on a projection, controlling the loss of unit trace by the original unit defect. Write $theta = h pi$, and put $f \( s \) = \( 2 s - 1 \)_(+)$, $g \( s \) = min \( 1 \, 2 s \)$. For the $e_11$ corner of a matrix summand, apply Proposition 42 to
  $ \( g \( theta \( e_11 \) \) \, f \( theta \( e_11 \) \) \, f \( theta \( e_11 \) \) \) . $
  The support condition holds because $g f = f$, and the trace inequality is equality. We obtain a projection $v$ with
  $ g \( theta \( e_11 \) \) v = v \, #h(2em) tau \( v \) = tau \( f \( theta \( e_11 \) \) \) quad \( tau in Lambda \) . $
  It lies under $pi \( e_11 \)$. The elements $pi \( e_(j 1) \) v$ belong to $D$, because
  $ pi \( e_(j 1) \) g \( theta \( e_11 \) \) = pi \( e_(j 1) \) g \( h \) in D . $
  Repeating $v$ along each matrix diagonal and summing over the summands gives a projection $Q in D$ commuting with $pi \( D_i^0 \)$, with $Q pi \( d \) in D$ for $d in D_i^0$. Traciality and repetition give
  $ tau \( Q \) = tau \( f \( h \) \) quad \( tau in Lambda \) . $
  Set $D_i = bb(C) \( 1 - Q \) + Q pi \( D_i^0 \)$ and $x^(\( i \)) = Q pi \( b_(i \, x) \)$. This is a unital finite-dimensional subalgebra; zero image summands are simply absent. No commutation of $Q$ with $h$ is needed. For a contraction $b in D_i^0$, tracial $L^2$ contractivity and the triangle inequality give
  $ parallel theta \( b \) - Q pi \( b \) parallel_(2 \, tau) & lt.eq parallel 1 - h parallel_(2 \, tau) + parallel 1 - Q parallel_(2 \, tau)\
 & lt.eq \( 1 + sqrt(2) \) tau \( 1 - h \)^(1 \/ 2) \, $
  since $1 - f \( s \) lt.eq 2 \( 1 - s \)$. With $m = \| cal(F) \|$ and $C_0 = \( 1 + sqrt(2) \)^2$, this implies
  $ tau \( E_i \) lt.eq 2 sum_(x in cal(F)) tau \( \( x - theta_i \( b_(i \, x) \) \)^2 \) + 2 m C_0 tau \( 1 - theta_i \( 1 \) \) . $
  The weighted sum is at most $\( 2 + 2 m C_0 \) kappa$. Take $kappa$ sufficiently small. Limit traces restrict to $T$ by Lemma 40, so the bound holds on $Lambda$. ◻
]

=== 14.2 Truncation and the combined cost <truncation-and-the-combined-cost>

We will use Corollary 44 to select one projection for each model, commuting with that model. Its cost will control both its overlap with earlier choices and its error against the prescribed coefficients. The sum need not be a contraction. The following estimate permits truncation while retaining bounds independent of the number of models.

#thm([Lemma 14.3.])[
  #emph[Let $p_1 \, dots.h \, p_N$ be projections in a unital $C^(*)$-algebra with a tracial state $tau$. Put 
$ s = sum_i p_i \, #h(2em) e = min \( s \, 1 \) \, #h(2em) lambda = sum_i tau \( p_i \) \, #h(2em) R = sum_i tau #scale(x: 180%, y: 180%)[\(] p_i sum_(j < i) p_j #scale(x: 180%, y: 180%)[\)] . $

 For every self-adjoint $x$, 
#[#set math.equation(numbering: n => "(14.3)")
 $ parallel \[ e \, x \] parallel_(2 \, tau) lt.eq 2 #scale(x: 180%, y: 180%)[\(] 2 sum_i parallel \[ p_i \, x \] parallel_(2 \, tau)^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $ <n:eq:trunc-comm>]

 Moreover, 
#[#set math.equation(numbering: n => "(14.4)")
 $ tau \( s - e \) \, med tau \( e - e^2 \) lt.eq sqrt(2 lambda R) . $ <n:eq:trunc-trace>]

]
] <n:lem:truncation>

#proof[
  Use the unnormalized matrix trace and set
  $ W = \( p_1 \, dots.h \, p_N \) \, quad V = mat(delim: "(", 0, W; W^(*), 0) \, quad Z = "diag" \( x \, dots.h \, x \) . $
  For $l \( r \) = min \( r^2 \, 1 \)$, the first diagonal corner of $l \( V \)$ is $e$. The function $l$ is globally 2-Lipschitz. Left and right multiplication by $V$ are commuting self-adjoint operators on tracial $L^2$, so their joint spectral calculus gives
  $ parallel \[ l \( V \) \, Z \] parallel_2 lt.eq 2 parallel \[ V \, Z \] parallel_2 . $
  The squared norm on the right before the factor $4$ is $2 sum_i parallel \[ p_i \, x \] parallel_(2 \, tau)^2$. Compressing the left side to the first corner proves (14.3). This argument uses scalar Lipschitzness on $L^2$, not operator-norm Lipschitzness.
  Let $S$ be the support of $s$ in the tracial von Neumann representation. The row $W$ is supported on the right by $"diag" \( p_1 \, dots.h \, p_N \)$, so its polar decomposition gives $tau \( S \) lt.eq lambda$. Since $tau \( s^2 \) = lambda + 2 R$,
  $ tau \( \( s - S \)^2 \) = 2 R - lambda + tau \( S \) lt.eq 2 R . $
  Both $s - e$ and $e - e^2$ are positive, supported under $S$, and bounded above by $\| s - S \|$. Cauchy–Schwarz gives
  $ tau \( \| s - S \| \) lt.eq tau \( S \)^(1 \/ 2) tau \( \( s - S \)^2 \)^(1 \/ 2) lt.eq sqrt(2 lambda R) \, $
  which proves (14.4). ◻
]

#proof[
  We first work in $D$. Choose a large parameter $K > 1$, and apply Proposition 46 with $Delta = K^(- 2)$. Recursively use Corollary 44 to choose $p_i in D ∩ D'_i$ with
  $ t_i = lambda w_i \, #h(2em) Y_i = s_(i - 1) + K E_i \, #h(2em) s_j = sum_(i lt.eq j) p_i \, $
  and tolerance $K^(- 1)$. In particular, $tau \( p_i \) = t_i$ and $tau \( p_i x^(\( i \)) \) = t_i tau \( x^(\( i \)) \)$. For each $tau in Lambda$, write
  $ R_tau = sum_i tau \( p_i s_(i - 1) \) \, #h(2em) H_tau = sum_i tau \( p_i E_i \) . $
  Both are nonnegative, and the single selected cost controls both:
  #[#set math.equation(numbering: n => "(14.5)")
   $ R_tau + K H_tau & lt.eq sum_i t_i #scale(x: 180%, y: 180%)[\(] sum_(j < i) t_j + K tau \( E_i \) + K^(- 1) #scale(x: 180%, y: 180%)[\)] lt.eq lambda^2 \/ 2 + 2 lambda \/ K . $ <n:eq:joint-cost>]
  In particular $H_tau lt.eq lambda^2 \/ \( 2 K \) + 2 lambda \/ K^2$, uniformly in $tau$ and independently of the number of models.
  Since $\[ p_i \, x^(\( i \)) \] = 0$, for $x in cal(F)$,
  $ sum_i parallel \[ p_i \, x \] parallel_(2 \, tau)^2 lt.eq 4 H_tau . $
  The positive functional $z mapsto tau \( p_i z \)$ has norm $t_i$, whence
  $ \| tau \( p_i \( x - x^(\( i \)) \) \) \| lt.eq sqrt(t_i tau \( p_i E_i \)) . $
  Scalar Cauchy–Schwarz and (14.2) therefore give, for $s = s_N$,
  #[#set math.equation(numbering: n => "(14.6)")
   $ \| tau \( s x \) - lambda tau \( x \) \| lt.eq sqrt(lambda H_tau) + lambda \/ K . $ <n:eq:sum-moment>]
  Set $e_D = min \( s \, 1 \)$. Lemma 47 gives
  $ parallel \[ e_D \, x \] parallel_(2 \, tau) lt.eq 2 sqrt(8 H_tau) \, #h(2em) tau \( s - e_D \) \, med tau \( e_D - e_D^2 \) lt.eq sqrt(2 lambda R_tau) . $
  Replacing $s$ by $e_D$ in (14.6) costs at most $tau \( s - e_D \)$. By (14.5), the upper bounds for the trace and projection errors tend to $lambda^(3 \/ 2)$ as $K arrow.r oo$, while the commutator bound tends to zero. Choose $K$ giving the desired inequalities with slack strictly smaller than $rho$. A positive contraction lift of $e_D$ and one good coordinate then give (14.1) in $A$. ◻
]

== 15 Amplification to uniform property $Gamma$ <n:sec:amplification>

The small splittings from Section 14 have errors of order $lambda^(3 \/ 2)$. At a fixed target proportion, a number of steps proportional to $lambda^(- 1)$ therefore accumulates an error of order $lambda^(1 \/ 2)$. We transfer the small splittings to arbitrary separable coefficient algebras and multiply commuting complements. This gives any fixed trace proportion with vanishing error, after which a bounded diagonal argument gives exact projections.

#thm([Lemma 15.1.])[
  #emph[For every separable unital $E subset D$ and $0 < lambda < 1$, there is a positive contraction $e in D ∩ E'$ such that, for $tau in Lambda$, 
#[#set math.equation(numbering: n => "(15.1)")
 $ \| tau \( e x \) - lambda tau \( x \) \| lt.eq lambda^(3 \/ 2) quad \( x in E_(upright("sa")) \, med parallel x parallel lt.eq 1 \) \, #h(2em) tau \( e - e^2 \) lt.eq lambda^(3 \/ 2) . $ <n:eq:relative-small>]

]
] <n:lem:relative-small>

#proof[
  Choose a dense sequence of self-adjoint contractions in $E$ and represent each by self-adjoint contractions in $A$. At coordinate $n$, apply Proposition 45 to the first $n$ entries of these representatives, with $rho = 1 \/ n$. The resulting sequence gives a positive contraction in $D$ whose commutators with the dense sequence have zero uniform $2$-norm. They are therefore zero in $D$. Passing to the limit traces proves the inequalities on the dense sequence, and norm continuity extends them to the entire self-adjoint unit ball. ◻
]

#thm([Proposition 15.2.])[
  #emph[For every separable unital $E subset D$ and $0 < c < 1$, there is a projection $f in D ∩ E'$ such that 
#[#set math.equation(numbering: n => "(15.2)")
 $ tau \( f x \) = c tau \( x \) #h(2em) \( x in E \, med tau in Lambda \) . $ <n:eq:split>]

]
] <n:prop:split>

#proof[
  For an integer $m gt.eq 1$, put $lambda = 1 - c^(1 \/ m)$. Successively choose $e_1 \, dots.h \, e_m$ from Lemma 48, enlarging $E$ to contain the previous choices at each step. They commute, and
  $ P_j = product_(i = 1)^j \( 1 - e_i \) \, #h(2em) P_0 = 1 \, $
  are positive contractions commuting with $E$. For a self-adjoint contraction $x in E$, the element $P_(j - 1) x$ is a permitted test at step $j$. The resulting recurrence gives
  $ \| tau \( P_m x \) - c tau \( x \) \| lt.eq m lambda^(3 \/ 2) . $
  For commuting positive contractions $a \, b$,
  $ a b - \( a b \)^2 = b \( a - a^2 \) + a^2 \( b - b^2 \) lt.eq \( a - a^2 \) + \( b - b^2 \) . $
  Thus $tau \( P_m - P_m^2 \) lt.eq m lambda^(3 \/ 2)$ as well. Since $lambda lt.eq \( - log c \) \/ m$, both errors tend to zero.
  We spell out the diagonal passage because $E$ need not consist of constant sequences. Fix representatives for a dense sequence of self-adjoint contractions of $E$. For each $k$, choose $m$ large enough and a positive contraction lift $P_n^(\( k \))$ so that on an $omega$-large set $G_k$, the first $k$ commutators and trace moments, and the uniform $2$-norm projection defect, are all within $1 \/ k$ of their targets. Such a set exists by the uniform limit-trace estimates and exact commutation in $D$; use $tau \( \( P_m - P_m^2 \)^2 \) lt.eq tau \( P_m - P_m^2 \)$ for the defect. Put
  $ F_k = { n : n gt.eq k } ∩ G_1 ∩ dots.h.c ∩ G_k . $
  These sets decrease, belong to $omega$, and have empty intersection. At coordinate $n in F_1$, use $P_n^(\( k \( n \) \))$ for the largest $k \( n \)$ with $n in F_(k \( n \))$; use zero off $F_1$. Then $k \( n \) arrow.r_omega oo$. The resulting class is a projection commuting with $E$ and satisfying (15.2) on the dense sequence. Continuity and complex linearity complete the proof. ◻
]

#thm([Theorem 15.3.])[
  #emph[For every $n gt.eq 2$ there are orthogonal projections $f_1 \, dots.h \, f_n in D ∩ A'$ summing to $1_D$ such that 
$ tau \( f_i a \) = 1 / n tau \( a \) #h(2em) \( a in A \, med tau in Lambda \) . $

 In particular, $A$ has uniform property $Gamma$.]
] <n:thm:gamma>

#proof[
  Start with the separable unital algebra $C^(*) \( A \, 1_D \)$. At step $j = 1 \, dots.h \, n - 1$, adjoin the previously selected projections, apply Proposition 49 with $c = 1 \/ \( n - j + 1 \)$, and multiply its projection by the remaining complement $q$. The factors commute, so this gives a projection $f_j lt.eq q$. Apply (15.2) to $q a$ in the enlarged algebra. Inductively $tau \( q a \) = \( n - j + 1 \) tau \( a \) \/ n$, so $tau \( f_j a \) = tau \( a \) \/ n$. Take the final complement for $f_n$. These are exactly the projection identities in the definition of uniform property $Gamma$ #cite(label("CETW")) Definition 2.1. ◻
]

== 16 The nonunital absorption step <n:sec:absorption>

By #cite(label("CETW")) Theorem 4.6 and Definition 4.2, a separable nuclear algebra with no finite-dimensional quotients, compact nonempty $T$, and uniform property $Gamma$ admits unital homomorphisms

#[#set math.equation(numbering: n => "(16.1)")
 $ M_n arrow.r D ∩ A' #h(2em) \( n gt.eq 1 \) . $ <n:eq:mcduff>]

The theorem permits nonunital algebras. We verify the passage from (16.1) to the nonunital absorption criterion explicitly.

Let

$ A_omega = ell^oo \( A \) \/ { \( a_n \) : lim_omega parallel a_n parallel = 0 } \, quad J = ker \( A_omega arrow.r D \) \, quad F_omega \( A \) = \( A_omega ∩ A' \) \/ \( A_omega ∩ A^perp \) . $

Here the annihilator consists of the elements whose products on either side with $A$ are zero.

#thm([Lemma 16.1.])[
  #emph[The quotient $F_omega \( A \)$ is unital, the annihilator is contained in $J$, and the map $A_omega ∩ A' arrow.r D ∩ A'$ is onto. Consequently, for each $n$ there is an order-zero map $psi : M_n arrow.r A_omega ∩ A'$ satisfying $psi \( 1 \) + J = 1_D$. Denote its composition with the quotient map to $F_omega \( A \)$ by $phi$.]
] <n:lem:central-lift>

#proof[
  The approximate-unit sequence defines $u in A_omega ∩ A'$ with $u a = a = a u$ for constant $a in A$. For $y in A_omega ∩ A'$, $\( u y - y \) a = \( u a - a \) y = 0$, and likewise on the left. Thus $u$ is the unit modulo the annihilator.
  If $y$ annihilates $A$, choose a bounded representative $\( y_n \)$ of norm at most $M$. For each fixed $k$, $parallel y_n u_k parallel arrow.r_omega 0$, while
  $ parallel y_n \( 1 - u_k \) parallel_(2 \, T)^2 lt.eq M^2 sup_(sigma in T) \( 1 - sigma \( u_k \) \) arrow.r 0 quad \( k arrow.r oo \) . $
  Taking these limits in order proves $y in J$.
  For surjectivity, let $v in A_omega$ lift a member of $D ∩ A'$. Its commutators with $A$ lie in $J$. A quasicentral approximate unit for this ideal gives positive contractions $d^(\( k \)) in J$ that commute with the first $k$ elements of a dense sequence in $A$ to within $1 \/ k$, and satisfy $d^(\( k \)) \[ v \, a \] = \[ v \, a \]$ to that accuracy on those elements. Choose positive contraction representatives. On an $omega$-large set their uniform $2$-norms are below $1 \/ k$, and their coordinate norm errors are below $2 \/ k$. The decreasing-set selection used in Proposition 49 now gives $d in J ∩ A'$ satisfying $d \[ v \, a \] = \[ v \, a \]$ for every $a in A$. Hence $v - d v$ is a central lift of the prescribed element. This is also the central-surjectivity statement of #cite(label("CETW")) Lemma 1.2.
  Apply matrix order-zero lifting to the resulting quotient map and (16.1) to obtain $psi$, and compose with the quotient to $F_omega \( A \)$ to obtain $phi$. The image of $psi \( 1 \)$ in $D$ is $1_D$. ◻
]

A generalized limit trace on $A_omega$ comes from lower-semicontinuous traces $nu_n$ on $A$ by

#[#set math.equation(numbering: n => "(16.2)")
 $ nu \( \[ \( b_n \) \] \) = sup_(epsilon.alt > 0) lim_omega nu_n \( \( b_n - epsilon.alt \)_(+) \) quad \( b_n gt.eq 0 \) . $ <n:eq:generalized>]

The coordinate traces here need not initially be densely finite. Write $"Ped" \( A \)$ for the Pedersen ideal, the smallest dense two-sided ideal of $A$. For nonzero $a in "Ped" \( A \)_(+)$ with $nu \( a \) < oo$, multiplication by $a$ on the norm relative commutant induces a trace $nu_a$ on $F_omega \( A \)$. The relevant largeness condition for $phi$ is $nu_a \( phi \( 1 \) \) = nu \( a \)$ #cite(label("CLS")) Definition 2.4.

We give the normalization argument explicitly under our trace hypotheses; compare #cite(label("CLS")) Lemma 2.3 and the discussion after Definition 2.4. For a generalized trace finite at a fixed nonzero element of $A_(+)$, boundedness expresses the relevant coordinate traces as scalar multiples of states in $T$, and compactness bounds these scalars uniformly.

#thm([Lemma 16.2.])[
  #emph[Every generalized limit trace $nu$ finite at a fixed nonzero $a in A_(+)$ is a finite nonnegative multiple of a limit trace through $D$. The induced maps $phi$ in Lemma 51 are therefore tracially large for all the required Pedersen-ideal tests.]
] <n:lem:generalized>

#proof[
  Choose $epsilon.alt > 0$ such that $b = \( a - epsilon.alt \)_(+) eq.not 0$. Every member of $T$ is faithful, so compactness gives
  $ m = min_(sigma in T) sigma \( b \) > 0 . $
  Since $nu \( a \) < oo$, (16.2) gives an $omega$-large set on which $nu_n \( b \) lt.eq C$ for some finite $C$. A lower-semicontinuous trace $eta$ finite on a nonzero positive element of a simple algebra is necessarily densely finite. Indeed, the set $N_eta = { x : eta \( x^(*) x \) < oo }$ is linear by $\( x + y \)^(*) \( x + y \) lt.eq 2 x^(*) x + 2 y^(*) y$. Traciality and positivity give
  $ eta \( \( x y \)^(*) \( x y \) \) = eta \( x y y^(*) x^(*) \) lt.eq parallel y parallel^2 eta \( x^(*) x \) \, #h(2em) eta \( \( y x \)^(*) \( y x \) \) lt.eq parallel y parallel^2 eta \( x^(*) x \) . $
  Thus $N_eta$ is a nonzero two-sided ideal and is norm dense by simplicity. Approximating square roots shows that finite-trace positives are dense. Therefore, on this set, our trace hypothesis gives $nu_n = r_n sigma_n$ with $sigma_n in T$ and $0 lt.eq r_n lt.eq C \/ m$. The zero trace is included by $r_n = 0$, and the trace infinite on every nonzero positive element cannot occur there. Extend the scalars and states boundedly off this set.
  For every bounded positive representative $z_n$ and $delta > 0$,
  $ 0 lt.eq r_n sigma_n \( z_n \) - r_n sigma_n \( \( z_n - delta \)_(+) \) lt.eq \( C \/ m \) delta . $
  The regularization in (16.2) can therefore be removed, and
  $ nu = \( lim_omega r_n \) \( lim_omega sigma_n \) . $
  This is a finite, possibly zero multiple of a trace through $D$. For $z = psi \( 1 \)$ from Lemma 51, the image of $z$ in $D$ is $1_D$. Consequently $nu_a \( phi \( 1 \) \) = nu \( a z \) = nu \( a \)$ for every permitted test. The formula is independent of the representative modulo the annihilator, since that ideal annihilates $a$. ◻
]

The Cuntz semigroup $"Cu" \( A \)$ consists of Cuntz classes of positive elements of $A ⊗ cal(K)$, ordered by subequivalence and added by orthogonal sum. It is #emph[almost unperforated] if $\( k + 1 \) \[ x \] lt.eq k \[ y \]$ implies $\[ x \] lt.eq \[ y \]$ for every integer $k gt.eq 1$.

#proof[
  Theorem 50 and (16.1), followed by Lemmas 51 and 52, give tracially large order-zero maps $M_n arrow.r F_omega \( A \)$ for every $n$. This is uniform McDuffness in the nonunital sense of #cite(label("CLS")) Definition 2.4.
  Our comparison hypothesis also makes $"Cu" \( A \)$ almost unperforated. Indeed, if $\( k + 1 \) \[ x \] lt.eq k \[ y \]$ with $y eq.not 0$, then additivity and monotonicity of dimension functions give
  $ d_tau \( x \) lt.eq frac(k, k + 1) < 1 #h(2em) upright("whenever ") d_tau \( y \) = 1 . $
  The stated comparison gives $\[ x \] lt.eq \[ y \]$. The case $y = 0$ is immediate. This uses precisely the specified finite-target-rank tests, including the case that this family is empty. Dimension-function monotonicity follows from cutdown under subequivalence, as in the proof of Proposition 42, followed by increasing the supports of the cutdowns.
  For simple algebras, almost unperforation is the strict comparison formulation used in #cite(label("CLS")) Section 2.3. Its nonunital absorption criterion #cite(label("CLS")) Proposition 5.4 states that a simple, separable, nuclear algebra with this comparison and nontrivial lower-semicontinuous traces is $cal(Z)$-stable if it is uniformly McDuff. All these hypotheses have now been verified. Hence $A tilde.equiv A ⊗ cal(Z)$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
