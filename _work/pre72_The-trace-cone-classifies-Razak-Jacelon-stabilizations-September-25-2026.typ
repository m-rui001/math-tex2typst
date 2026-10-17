#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
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

#align(center)[#text(size: 16pt, weight: "bold")[The trace cone classifies Razak--Jacelon stabilizations]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The Razak–Jacelon algebra $cal(W)$ is a simple, monotracial, stably projectionless nuclear $C^(*)$-algebra #cite(label("Jacelon")). Tensoring by $cal(W)$ removes the $K$-theoretic part of the classification problem and makes the order on the Cuntz semigroup visible through traces. The question is whether the resulting trace data determine the algebra even when its ideal structure is unrestricted. We prove that they do.

=== 1.1 The invariant and the main theorem <the-invariant-and-the-main-theorem>

For a $C^(*)$-algebra $C$, let $T \( C \)$ consist of all maps $tau : C_(+) arrow.r \[ 0 \, oo \]$ satisfying

$ tau \( 0 \) = 0 \, #h(2em) tau \( a + b \) = tau \( a \) + tau \( b \) \, #h(2em) tau \( r a \) = r tau \( a \) quad \( r > 0 \) \, $

together with $tau \( x^(*) x \) = tau \( x x^(*) \)$ and lower semicontinuity for norm-convergent nets in $C_(+)$. Arithmetic is extended nonnegative arithmetic. We impose no density condition on the finite domain. In particular, every closed two-sided ideal $I$ contributes the weight

#[#set math.equation(numbering: n => "(1.1)")
 $ tau_I \( a \) = cases(delim: "{", 0 \, & a in I_(+) \,, oo \, & a in C_(+) \\ I_(+) .) $ <intro:ideal-weight>]

The canonical topology is specified by

#[#set math.equation(numbering: n => "(1.2)")
 $ tau_i arrow.r tau quad arrow.l.r.double quad limsup_i tau_i \( \( a - epsilon \)_(+) \) lt.eq tau \( a \) lt.eq liminf_i tau_i \( a \) quad \( a in C_(+) \, med epsilon > 0 \) . $ <intro:trace-topology>]

An isomorphism of these topological cones is a homeomorphism preserving addition, the zero weight, and multiplication by every positive real scalar.

#thm([Theorem 1.1.])[
  #emph[Let $A$ and $B$ be separable nuclear complex $C^(*)$-algebras. If $T \( A \)$ and $T \( B \)$ are isomorphic as topological cones, then 
$ A ⊗ cal(W) ⊗ cal(K) med tilde.equiv med B ⊗ cal(W) ⊗ cal(K) \, $

 where $cal(K) = cal(K) \( ell^2 \( bb(N) \) \)$ and all tensor products are spatial.]
] <thm:main>

The conclusion is an actual $C^(*)$-algebra isomorphism. The algebras may be nonunital, may have both finite and infinite subquotients, and may have an arbitrary primitive ideal space. Their only regularity assumptions are separability and nuclearity. Moreover, the isomorphism can realize the prescribed cone map: after transporting the given map to $F : T \( B ⊗ cal(W) ⊗ cal(K) \) arrow.r T \( A ⊗ cal(W) ⊗ cal(K) \)$, we obtain an isomorphism $Phi$ with $tau compose Phi = F \( tau \)$ for every extended trace $tau$. This refinement is proved at the end of 8.

The presence of (1.1) makes the invariant sensitive to this ideal structure. For example,

$ I subset.eq J quad arrow.l.r.double quad tau_I + tau_J = tau_I . $

The finite and zero ideals of a general weight are also encoded by the two limiting operations obtained by letting its positive scalar multiple tend to zero and to infinity. These features will let us localize each approximation on the ideal where its controlling trace is finite.

=== 1.2 History and significance <history-and-significance>

Razak’s classification of simple inductive limits of stably projectionless building blocks made the cone of traces, together with its scale, an effective classification invariant #cite(label("Razak")) Theorems 1.1 and 2.1. Jacelon’s construction singled out the simple monotracial algebra $cal(W)$ in this setting #cite(label("Jacelon")). The existence, uniqueness, and approximate-intertwining organization of those classification arguments also provides the broad method used here, with new local estimates needed for arbitrary ideals.

The trace-cone question is due to Leonel Robert. It was recorded in Santiago’s 2012 conference abstract #cite(label("SantiagoWStable")) and appears as Problem LXVIII in the survey of Schafhauser, Tikuisis, and White #cite(label("STW")). Their formulation retains every extended trace, including the zero/infinity ideal weights. Their May 2026 discussion describes the known simple and traceless cases and the difficulty already presented by one proper nonzero ideal. 1 gives a positive answer to that problem for the full cone and the unrestricted class of separable nuclear algebras in its statement.

Elliott, Robert, and Santiago developed the compact topological cone of extended lower-semicontinuous traces and its relation to functionals on the Cuntz semigroup #cite(label("ERS")). Robert subsequently identified tensoring with $cal(W)$ with realification of that semigroup #cite(label("Robert")) Theorem 5.1.2. Thus the cone in (1.2) determines the Cuntz semigroup of the stabilized algebra, including its ideals and positive real scalar multiplication. The remaining task is to realize this invariant by algebra maps and prove their uniqueness.

In the tracial simple case, the work of Elliott and Niu #cite(label("ElliottNiu")) and the published classification of Elliott, Gong, Lin, and Niu #cite(label("EGLN")) Theorem 7.5 establish classification by scaled traces under the stated $K K$-contractibility and finite-nuclear-dimension hypotheses. Castillejos and Evington’s nuclear-dimension theorem for simple separable nuclear $cal(Z)$-stable algebras supplies the regularity bridge for the simple stabilized case #cite(label("CastillejosEvington")) Theorem A. Nawata gave another proof that $A ⊗ cal(W) tilde.equiv cal(W)$ when $A$ is simple, separable, nuclear, has a unique tracial state, and has no unbounded densely defined traces #cite(label("Nawata")) Corollary 6.2(i). These simple-algebra hypotheses are not imposed on $A$ and $B$ in 1. As a separate regularity consequence, every stabilization $A ⊗ cal(W) ⊗ cal(K)$ in 1 has nuclear dimension at most one, by #cite(label("OpenAINuclearDimension")) Theorem 1.3 together with $cal(W) ⊗ cal(Z) tilde.equiv cal(W)$ from #cite(label("Jacelon")) Corollary 6.3. The classification argument below does not use this nuclear-dimension bound.

The traceless case has a different structure: when every extended trace takes only zero and infinity, the trace cone reduces to ideal information. Rørdam’s absorption criterion #cite(label("RordamZ")) Theorem 5.2 and Kirchberg’s ideal-lattice classification, with a complete proof in #cite(label("GabeO2")) Theorem 6.13, explain the known traceless branch. The present argument must also retain finite trace data and distinguish the regions where a weight is finite from those where it is infinite. That distinction is necessary when finite and infinite subquotients occur in the same algebra.

Restricted nonsimple precedents include Lin and Ng’s classification of certain essential extensions by $cal(W)$, with a universal coefficient theorem assumption, a simple quotient, and an invariant containing $K$-theory and trace data #cite(label("LinNg")) Theorem 9.6. The general cone-only question allows arbitrary ideals.

The main analytic tools have separate roles. Ciuperca, Giordano, Ng, and Niu give unital von Neumann algebra uniqueness from support-rank data #cite(label("CGNN")); we combine this with trace caps and rational averaging to obtain local rank estimates. The stable-uniqueness methods of Dadarlat and Eilers #cite(label("DadarlatEilers")) and the ideal-related absorption and multiplier results of Gabe #cite(label("Gabe")) Sections 11–13 remove the resulting errors in norm. Those intermediate results apply here without pure infiniteness of the auxiliary targets. In the existence argument, Connes’s hyperfiniteness theorem #cite(label("Connes")), nuclear completely positive approximation #cite(label("ChoiEffros")), and measured-field methods #cite(label("VaesWouters")) provide the classical inputs. The fixed controllers, lower ideal-support estimates, and fine-label correction that connect these tools are proved below.

The strategy of lifting tracial data and then correcting a map through an extension has a methodological precedent in Schafhauser’s proof of the Tikuisis–White–Winter theorem #cite(label("Schafhauser")). His setting uses a faithful amenable trace and the universal coefficient theorem (UCT); the present local error ideals and support estimates address a different invariant, with no UCT assumption. The use of quotient cone approximations and carriers in prescribed ideals also has a precedent in Bosa–Gabe–Sims–White #cite(label("BGSW")) Section 3. Here the small UHF fractions must satisfy both upper trace bounds and lower comparisons into fixed positive cuts. The suspension-and-corner passage follows the method in #cite(label("GabeO2")) Remark 6.4 and #cite(label("Gabe")) proof of Theorem 14.1; its trace normalization is proved below for all extended weights.

=== 1.3 The construction <the-construction>

Fix

$ P = A ⊗ cal(W) ⊗ cal(K) \, #h(2em) Q = B ⊗ cal(W) ⊗ cal(K) . $

For a $C^(*)$-algebra $C$, the Cuntz semigroup $"Cu" \( C \)$ consists of Cuntz classes $\[ a \]$ of positive elements in $C ⊗ cal(K)$, with addition by orthogonal sum. The relation $a prec.tilde b$ means that $v_n^(*) b v_n arrow.r a$ in norm for some sequence $\( v_n \)$; it determines the order on these classes. Two elements define the same class when each is Cuntz subequivalent to the other. For a positive contraction $a$, its rank at an extended trace is $d_tau \( a \) = lim_k tau \( a^(1 \/ k) \)$, using unnormalized matrix traces. This depends only on $\[ a \]$. Two obstacles distinguish this setting from one with a single normalized trace. A positive element generating a stable algebra may have infinite rank at every nonzero densely finite trace, so making its rank a small scalar multiple gives no useful finite error bound. Also, a weight can be finite only on a proper ideal. We must control errors separately on these ideals and preserve enough lower support to retain the infinite values outside them.

The given cone isomorphism yields compatible isomorphisms

$ F : T \( Q \) arrow.r T \( P \) \, #h(2em) G : "Cu" \( P \) arrow.r "Cu" \( Q \) \, #h(2em) d_tau \( G \[ a \] \) = d_(F tau) \( a \) . $

We identify the primitive ideal spaces through this correspondence and denote the common space by $X$. For an open $U subset.eq X$, write $P \( U \)$ and $Q \( U \)$ for the corresponding closed ideals. We first construct maps into a sequence algebra, where errors may tend to zero along the coordinates. Norm uniqueness will later allow their coordinate maps to be conjugated into convergent sequences in $Q$. Our intermediate maps take values in

$ D = Q_oo = ell^oo \( Q \) \/ c_0 \( Q \) . $

We regard $Q$ as the constant sequences in $D$. If $omega$ is a free ultrafilter on $bb(N)$ and $tau_n in T \( Q \)$, their regularized limit on bounded positive sequences is

$ rho \( \[ \( x_n \) \] \) = sup_(epsilon > 0) lim_(n arrow.r omega) tau_n \( \( x_n - epsilon \)_(+) \) \, #h(2em) x_n gt.eq 0 . $

Section 3 proves that this defines an extended trace. We use $Y$ equal to a point, a half-open interval, or $bb(R)$, with a full-support Radon measure $m$, finite on the interval. For $nu in T \( P \)$, write $"Fin" \( nu \)$ for the closed ideal generated by the positive elements on which $nu$ is finite. The product trace $m ⊗ nu$ is the integrated densely finite trace on $C_0 \( Y \) ⊗ "Fin" \( nu \)$, extended to be infinity on positive elements outside this ideal. On positive elementary tensors it has value $\( integral f thin d m \) nu \( a \)$, with $0 dot.op oo = 0$. A #emph[model] is a homomorphism $p : C_0 \( Y \) ⊗ P arrow.r D$ satisfying

#[#set math.equation(numbering: n => "(1.3)")
 $ rho compose p = m ⊗ F \( rho \|_Q \) $ <intro:model>]

for every such regularized limit $rho$. The quantifier includes nondensely finite weights. An ideal of $C_0 \( Y \) ⊗ P$ has a fine support, an open subset of $Y times X$; its projection to $X$ is the coarse support used to index local estimates.

The main difficulty is to preserve both the finite and the infinite parts of (1.3). Fix a regularized limit $rho$, put $sigma = rho \|_Q$, and write $Q \( V \) = "Fin" \( sigma \)$. On $C_0 \( Y \) ⊗ P \( V \)$, controlled trace moments will identify the pullback of $rho$. This alone does not prevent the pullback from becoming finite on a larger ideal. A separate lower ideal comparison rules that out. Once the finite ideal is exactly $C_0 \( Y \) ⊗ P \( V \)$, both sides of (1.3) are infinite on every positive element outside it. This two-part recovery is the reason for the following constructions.

===== 1.3.1 Local error ideals and stabilizers. <local-error-ideals-and-stabilizers.>

For each open $U subset.eq X$, we define an ideal $J \( U \) subset.eq D$ using uniform bounds on the ranks of positive cuts. The error at each cut is a scalar tending to zero times the rank of a fixed positive controller $c$ satisfying $c prec.tilde \( b - delta \)_(+)$ for some $b in Q \( U \)_(+)$ and $delta > 0$. Such errors are invisible to every regularized weight that is densely finite on $Q \( U \)$. We construct small homomorphisms whose values belong to these ideals and dominate any prescribed countable family of smaller errors. Compact containment of open ideals supplies a common controller when different approximation stages are combined. The two versions in Section 4 have different inputs: one takes a small fraction of an existing model; the other builds a small cone homomorphism before any model is available.

===== 1.3.2 Tracial approximation with lower ideal support. <tracial-approximation-with-lower-ideal-support.>

Convex separation and von Neumann algebra approximation construct completely positive cone maps with the required first and second trace moments. The construction simultaneously imposes norm tests whose positive averages force lower rank comparisons. The comparison constant is independent of the averaging multiplicities. This lower signal determines the part of the cone on which a weight must remain infinite. Factor representations and their measurable assembly are used only through cut tests controlled by fixed finite-rank constants.

===== 1.3.3 Correction with all ideal labels retained. <correction-with-all-ideal-labels-retained.>

A small stabilizer places the multiplicative errors in a sigma-unital hereditary target. Module Stinespring dilation and absorption then correct the cone map. The support estimate is imposed on the entire projected ideal of each input. It therefore survives scaling of the cone variable and makes every dilation weakly equivariant for the finer primitive-space labels. Compact corrections can be compressed to finitely many terms of the original diagonal repeat, with an explicit tail estimate. A second small homomorphism then dominates the correction itself. Adding it back retains the lower ideal comparison, so the finite and infinite parts combine to give the full model equation in Section 7.

===== 1.3.4 Uniqueness and passage to actual maps. <uniqueness-and-passage-to-actual-maps.>

For two models with the same data, tracial alignment first makes their difference locally small. A stabilizer drawn from a spare model then allows ideal-related stable uniqueness to remove that difference in norm. The spare is supplied by splitting each model into two UHF halves and replacing the halves successively. This argument, in Section 5, assumes that the two models are given; it does not depend on the later existence theorem. Once corrected cone models exist, an exhaustion of the line gives models with Lebesgue data. Translation covariance and a full crossed-product projection give a model for $P$ itself. A finite positive partition identity computes the trace of this corner, including infinite values. Uniqueness for every pair of subsequences gives eventual conjugacy between any two sufficiently late coordinate maps. We use these conjugacies to make a subsequence Cauchy in norm on each input; its limit is an actual homomorphism $P arrow.r Q$. Repeating the construction in the other direction gives a map $Q arrow.r P$. Their compositions have the identity data, so approximate intertwining proves 1.

Figure 1 displays these dependencies. In particular, the uniqueness theorem is conditional on a pair of models; it is available when the existence construction later supplies them.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.912cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Full trace cone#linebreak()Realification and ideal transport \(Section~2\)]]])])
  content((0, -1.6), [#box(width: 6.912cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Fixed-cut comparisons and local error ideals#linebreak()\(Section~3\)]]])])
  content((-3.5, -3.3), [#box(width: 5.612cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Small stabilizers, with or without#linebreak()a given model \(Section~4\)]]])])
  content((3.5, -3.3), [#box(width: 5.612cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Tracial approximation on the cone#linebreak()\(Section~6\)]]])])
  content((-3.5, -5), [#box(width: 5.612cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Norm uniqueness for given models#linebreak()\(Section~5\)]]])])
  content((3.5, -5), [#box(width: 5.612cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Fine-label correction and#linebreak()retained lower support \(Section~7\)]]])])
  content((0, -6.8), [#box(width: 6.912cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Covariant line model and point model#linebreak()\(Section~8\)]]])])
  content((0, -8.4), [#box(width: 6.912cm, inset: 0.1058cm, radius: 1pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Actual homomorphisms and intertwining#linebreak()\(Section~8\)]]])])
  line((0, -0.55), (0, -1.05), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-3.456, -2.15), (-3.5, -2.75), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.456, -2.15), (3.5, -2.75), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-3.5, -3.85), (-3.5, -4.45), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.5, -3.85), (3.5, -4.45), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-0.6942, -3.3), (0, -3.3), (0, -5), (0.6942, -5), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-3.5, -5.55), (-3.456, -6.25), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.5, -5.55), (3.456, -6.25), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -7.35), (0, -7.85), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-6.306, -5), (-7, -5), (-7, -8.4), (-3.456, -8.4), stroke: (thickness: 0.4pt, dash: "dashed"), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: Principal model-construction dependencies. The existence and uniqueness arguments meet in the passage from sequence models to actual maps. Shared auxiliary inputs are not drawn separately: the trace-cap and barycenter lemmas in Section 5 are used in Section 6; the absorption and hereditary-support lemmas of Section 5 are used in Section 7. Norm uniqueness is a statement about models when they are given; its proof does not assume the cone-existence theorem. The dashed arrow records its further use in actual-map extraction and the final two-sided intertwining. ],
) <fig:proof-roadmap>

=== 1.4 Organization and conventions <organization-and-conventions>

Theorem 2.1, Proposition 1 collect the structural input. The sequence comparisons and local diagonalization are proved in Proposition 3, Lemma 6. The stabilizer construction is 3, and norm uniqueness is 4. The two existence stages are Theorem 6.1, Theorem 7.1; the final passage to an isomorphism is 8.

All algebras and Hilbert spaces are complex. A completely positive contractive map is abbreviated c.p.c. Traces on finite matrix amplifications use the unnormalized matrix trace. The universal UHF algebra is denoted by $cal(Q)$, to distinguish it from the target algebra $Q$. Rational diagonal averaging uses the normalized UHF trace only in the averaging direction. The notation $V subset.double U$ denotes compact containment in the lattice of open subsets of $X$, without a Hausdorff assumption.

== 2 The invariant, its ideals, and matrix conventions <sec:structure>

The trace cone supplies three inputs to the construction: pointwise comparison of Cuntz classes in $Q$, a common lattice of ideals for $P$ and $Q$, and positive elements that control finite collections of rank estimates inside those ideals. We establish these inputs before fixing the matrix identifications used in the approximations. All later comparisons are obtained from the coordinate algebra $Q$; passage to a sequence algebra will require bounded witnesses.

=== 2.1 Ranks and realification <ranks-and-realification>

For $a in \( C ⊗ cal(K) \)_(+)$, extend $tau in T \( C \)$ to matrices by the unnormalized matrix trace and put

#[#set math.equation(numbering: n => "(2.1)")
 $ d_tau \( a \) = lim_(k arrow.r oo) tau \( a^(1 \/ k) \) #h(2em) \( 0 lt.eq a lt.eq 1 \) . $ <st:rank>]

Rescaling an element to be contractive does not change its rank. The resulting function depends only on its Cuntz class. We write $d_tau \( x \)$ also for the value at $x in "Cu" \( C \)$. The basic cut and integration identities are

#[#set math.equation(numbering: n => "(2.2)")
 $ d_tau \( a \) = sup_(epsilon > 0) d_tau \( \( a - epsilon \)_(+) \) \, #h(2em) tau \( a \) = integral_0^(parallel a parallel) d_tau \( \( a - t \)_(+) \) thin d t . $ <st:rank-cuts>]

These identities use extended nonnegative arithmetic and apply to all the weights in (1.2).

We use the following form of the trace and realification theorems. The assertion about the functional cone is #cite(label("ERS")) Proposition 4.2, Remark 4.3, and Theorem 4.4; compactness is #cite(label("ERS")) Theorem 3.7. The realification assertions are #cite(label("Robert")) Proposition 3.1.1 and Theorems 3.2.1 and 5.1.2.

#thm([Theorem 2.1.])[
  (Trace realification).  #emph[For every $C^(*)$-algebra $C$, the trace cone with topology (1.2) is compact Hausdorff, and it is second countable when $C$ is separable. If $C$ is exact, the assignment $tau mapsto d_tau$ identifies this cone with the topological cone of functionals on $"Cu" \( C \)$.]
  #emph[For every $C^(*)$-algebra $C$, 
$ "Cu" \( C ⊗ cal(W) \) tilde.equiv "Cu" \( C \)_(bb(R)) . $

 Realification is determined functorially by the topological functional cone. Its realization as functions on that cone has pointwise order, pointwise addition, and multiplication by positive real scalars. It has the same functional cone as $"Cu" \( C \)$.]
  #emph[Consequently the given trace-cone isomorphism induces isomorphisms 
#[#set math.equation(numbering: n => "(2.3)")
 $ F : T \( Q \) arrow.r T \( P \) \, #h(2em) G : "Cu" \( P \) arrow.r "Cu" \( Q \) \, #h(2em) d_tau \( G x \) = d_(F tau) \( x \) . $ <st:transport>]

 In particular, for $x \, y in "Cu" \( Q \)$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ x lt.eq y quad arrow.l.r.double quad d_tau \( x \) lt.eq d_tau \( y \) quad upright("for every ") tau in T \( Q \) . $ <st:pointwise-order>]

 Multiplication by every positive real scalar is an order automorphism preserving increasing suprema and compact containment.]
] <st:realification>

Here the function realization is Robert’s cone $L \( "F" \( "Cu" \( C \) \) \)$, where $"F" \( "Cu" \( C \) \)$ denotes the functional cone. For a functional cone $T$, the cone $L \( T \)$ consists of pointwise suprema $f = sup_n f_n$, where the $f_n : T arrow.r \[ 0 \, oo \]$ are additive, positively homogeneous, lower semicontinuous, and zero at zero. The approximating sequence satisfies, for some $0 < epsilon_n < 1$,

$ f_n lt.eq \( 1 - epsilon_n \) f_(n + 1) \, #h(2em) f_n upright(" is continuous at every ") tau upright(" with ") f_(n + 1) \( tau \) < oo . $

Continuity here is on all of $T$ at the indicated point, with the usual topology on $\[ 0 \, oo \]$, rather than continuity only of a restriction to the finite locus. For the exact algebras considered below the realization is $L \( T \( C \) \)$. This specified approximation condition is essential; arbitrary lower-semicontinuous homogeneous functions are not being identified with Cuntz classes. Composition with a cone homeomorphism preserves all the displayed conditions, which is the functoriality used here. This gives $G$ in (2.3). We fix the normalized trace of $cal(W)$ when identifying the trace cones before and after tensoring; stabilization uses the unnormalized trace of $cal(K)$. The equality of extended lower-semicontinuous quasitraces and traces for exact algebras is included in the cited trace theorem. Its ancestry is Haagerup’s theorem for unital exact algebras #cite(label("Haagerup")) Theorem 5.11 and the Blanchard–Kirchberg reduction recalled in #cite(label("ERS")) Remark 4.3. We use the extended nonunital interface stated there. Thus the functional cone used here is exactly the invariant of the problem.

We also record the tensor-factor properties

#[#set math.equation(numbering: n => "(2.5)")
 $ cal(W) ⊗ cal(Q) tilde.equiv cal(W) \, #h(2em) cal(W) ⊗ cal(W) tilde.equiv cal(W) \, #h(2em) "KK" \( cal(W) \, cal(W) \) = 0 . $ <st:W-properties>]

The first property follows from #cite(label("Jacelon")) Proposition 6.2; the remaining properties are recorded in #cite(label("Nawata")) Section 2.1 and Corollary 6.2. They are properties of the tensor factor $cal(W)$, so their use places no simplicity restriction on $A \, B \, P$, or $Q$. The UHF absorption is used in the foldings below, and the ideal-related use of the last equality is proved in 12.

For completeness, the tensor-square and approximate-inner-flip properties underlying realification have accessible proofs in these same sources. Choose $beta : cal(W) ⊗ cal(W) arrow.r cal(W)$ by #cite(label("Nawata")) Corollary 6.2(i). Conjugating the flip by $beta$ gives a trace-preserving automorphism of $cal(W)$, which is approximately inner by #cite(label("Jacelon")) Corollary 4.6. Pulling the implementing unitaries back through the unitized $beta$ gives approximate inner flip of $cal(W) ⊗ cal(W)$, as in #cite(label("Jacelon")) Remark 5.2. Thus the tensor-square isomorphism and the approximate inner flip needed for realification follow from properties of the factor itself.

=== 2.2 Finite ideals, zero ideals, and open supports <finite-ideals-zero-ideals-and-open-supports>

For $tau in T \( C \)$, let $"Fin" \( tau \)$ be the closed ideal generated by the positive elements on which $tau$ is finite, and let $"Ker" \( tau \)$ be its zero ideal. The restriction of $tau$ to $"Fin" \( tau \)$ is densely finite, whereas $tau \( a \) = oo$ for $a in C_(+) \\ "Fin" \( tau \)$. A useful characterization is

#[#set math.equation(numbering: n => "(2.6)")
 $ a in "Fin" \( tau \) quad arrow.l.r.double quad d_tau \( \( a - epsilon \)_(+) \) < oo quad upright("for every ") epsilon > 0 . $ <st:finite-rank-cuts>]

To verify the forward direction, approximate $a$ in norm by a finite-trace positive element $b$ of $"Fin" \( tau \)$. If $parallel a - b parallel < epsilon \/ 2$, cut comparison gives

$ d_tau \( \( a - epsilon \)_(+) \) lt.eq d_tau \( \( b - epsilon \/ 2 \)_(+) \) lt.eq 2 / epsilon tau \( b \) < oo . $

The finite-trace positives are dense in this ideal: finite sums of terms $x^(*) b x$, with $tau \( b \) < oo$, still have finite trace and generate its positive cone densely. Conversely, finite rank of all positive cuts implies finite trace of those cuts, since $tau \( \( a - epsilon \)_(+) \) lt.eq parallel a parallel d_tau \( \( a - epsilon \)_(+) \)$. Their norm limit is $a$, proving (2.6).

#thm([Proposition 1.])[
  (Transport of ideals).  #emph[The maps $F \, G$ identify the complete ideal lattices of $P$ and $Q$, and these identifications agree. They identify the finite and zero ideals of corresponding weights. The resulting homeomorphism of primitive ideal spaces will be used to regard $"Prim" \( P \) = "Prim" \( Q \) = X$. For an open $U subset.eq X$, write $P \( U \)$ and $Q \( U \)$ for the corresponding ideals. Then 
$ G \( "Cu" \( P \( U \) \) \) = "Cu" \( Q \( U \) \) \, $

 and 
$ "Fin" \( tau \) = Q \( U \) med arrow.l.r.double med "Fin" \( F tau \) = P \( U \) \, #h(2em) "Ker" \( tau \) = Q \( U \) med arrow.l.r.double med "Ker" \( F tau \) = P \( U \) . $

]
] <st:ideals>

#proof[
  The additive idempotents of the trace cone are exactly the ideal weights $tau_I$. Indeed $tau + tau = tau$ forces every value to be zero or infinity, and the zero set is a closed ideal. Moreover
  $ I subset.eq J quad arrow.l.r.double quad tau_I + tau_J = tau_I . $
  Thus $F$ determines an order isomorphism of ideal lattices. If $F \( tau_I \) = tau_J$, then
  $ \[ a \] in "Cu" \( J \) quad arrow.l.r.double quad d_(F tau_I) \( a \) = 0 quad arrow.l.r.double quad d_(tau_I) \( G \[ a \] \) = 0 quad arrow.l.r.double quad G \[ a \] in "Cu" \( I \) . $
  This proves compatibility with $G$.
  The topology recovers the two other ideals through
  #[#set math.equation(numbering: n => "(2.7)")
   $ lim_(r arrow.b 0) r tau = tau_("Fin" \( tau \)) \, #h(2em) lim_(r arrow.t oo) r tau = tau_("Ker" \( tau \)) . $ <st:scalar-limits>]
  These are #cite(label("ERS")) Equation (3.4). They can also be checked directly in (1.2): all positive cuts of an element of $"Fin" \( tau \)$ have finite trace by (2.6), whereas an element outside that ideal has infinite trace; for the second limit use whether its trace is zero or positive. Continuity and positive homogeneity of $F$ therefore preserve both limits.
  An ideal-lattice isomorphism preserves prime ideals and their hull–kernel topology. In a separable $C^(*)$-algebra prime ideals are primitive #cite(label("DixmierPrime")) Corollary 1, which gives the asserted homeomorphism. Finally, the zero algebra is distinguished by the cone: every nonzero algebra has the nonzero weight $tau_({ 0 })$. We may henceforth assume that $P \, Q eq.not 0$. ◻
]

For a positive element $c in Q \( U \)$, we say that $c$ is #emph[compactly Cuntz supported in $Q \( U \)$] if

#[#set math.equation(numbering: n => "(2.8)")
 $ \[ c \] lt.eq \[ \( b - delta \)_(+) \] quad upright("for some ") b in Q \( U \)_(+) \, med delta > 0 . $ <st:compact-controller>]

Equivalently, $\[ c \]$ is below an element compactly contained in a Cuntz class from $Q \( U \)$. This concerns the class of $c$, not compactness of a subset of a possibly non-Hausdorff space.

The next lemma permits one controller to be chosen before an approximation sequence is constructed. Its finite multiplicity may depend on the element being controlled. Later we will compensate for that multiplicity by choosing a sufficiently late coordinate.

#thm([Lemma 1.])[
  (Countable supports and common controllers).  #emph[The open-set lattice of $X$ has a countable basis closed under finite unions such that every open $U$ is the union of basis opens $V subset.double U$. If $V subset.double U$, there is a compactly Cuntz supported $b_(V \, U) in Q \( U \)_(+)$ with 
$ Q \( V \) subset.eq "Ideal"_Q \( b_(V \, U) \) . $

 Every compactly Cuntz supported $c in Q \( V \)_(+)$ then satisfies 
#[#set math.equation(numbering: n => "(2.9)")
 $ \[ c \] lt.eq N \[ b_(V \, U) \] quad upright("for some finite ") N in bb(N) . $ <st:controller-multiple>]

 The element $b_(V \, U)$ is independent of $c$; the integer $N$ need not be.]
] <st:controllers>

#proof[
  Choose a norm-dense sequence $\( a_j \)$ of positive contractions in $Q$. The supports of $\( a_j - r \)_(+)$, for positive rational $r$, form a countable open basis, after taking finite unions. For example, to find such a support inside $U$ and containing $x in U$, choose $a in Q \( U \)_(+)$ nonzero in the quotient at $x$, and approximate it sufficiently closely by some $a_j$. A rational cut larger than the approximation error belongs to $Q \( U \)$, and a cut smaller than the quotient norm remains nonzero at $x$. The support of $\( a_j - r \)_(+)$ is compactly contained, in the ideal lattice, in the support of $\( a_j - r \/ 2 \)_(+)$. Indeed, if a directed union of ideals contains the latter element, norm approximation puts the more deeply cut element in one member of that union. Choosing two rational cut levels inside the preceding construction gives a basis open compactly contained in the prescribed $U$.
  Let $h$ be strictly positive in $Q \( U \)$. The ideals generated by $\( h - 1 \/ k \)_(+)$ increase with dense union $Q \( U \)$. Compact containment gives $k$ such that $Q \( V \) subset.eq "Ideal"_Q \( \( h - 1 \/ k \)_(+) \)$; take this cut as $b_(V \, U)$. If $c$ satisfies (2.8) inside $Q \( V \)$, then $\[ c \] lt.double \[ z \]$ for some $z in Q \( V \)_(+)$. The Cuntz-semigroup ideal generated by $\[ b_(V \, U) \]$ consists of the elements below $sup_N N \[ b_(V \, U) \]$. Thus $\[ z \] lt.eq sup_N N \[ b_(V \, U) \]$, and compact containment proves (2.9). ◻
]

For the domains used below,

$ S_Y = C_0 \( Y \) ⊗ P \, #h(2em) S_Y \( U \) = C_0 \( Y \) ⊗ P \( U \) . $

Their primitive spaces are $Y times X$. For $s in S_Y$, let $U_s$ be the projection to $X$ of the open support of $"Ideal"_(S_Y) \( s \)$. Projection is open, and

#[#set math.equation(numbering: n => "(2.10)")
 $ s in S_Y \( U \) quad arrow.l.r.double quad U_s subset.eq U . $ <st:smallest-label>]

Thus every element has a smallest coarse label. This is the lower-semicontinuity condition on the domain ideal assignment used in absorption. The fine labels on $S_Y$, when used later, are its actual open subsets of $Y times X$.

=== 2.3 Folding and rational averaging <folding-and-rational-averaging>

There are two matrix operations in the proof. Stabilization adds internal matrix corners, whose ranks add with no normalization. Convex averaging instead uses a separate UHF factor, whose normalized trace supplies the convex coefficients. The following identifications allow both operations to have range $Q$ while retaining this distinction and aligning any already chosen finite tests.

#thm([Lemma 2.])[
  (Trace-preserving folding).  #emph[Finite matrix amplifications, including amplifications whose sizes vary with the coordinate, may be folded into $Q$ so as to preserve all trace and rank calculations with unnormalized internal matrix traces. The folding of a fixed first corner can be made arbitrarily close to the identity on any prescribed finite subset of $Q$, by a multiplier-unitary adjustment.]
  #emph[If $h_1 \, dots.h \, h_l$ are c.p.c. maps with values in finite matrix amplifications of $Q$, and $lambda_i > 0$ are rational with $sum_i lambda_i = 1$, their normalized diagonal average is a c.p.c. map $h$ into $Q$ satisfying, for $s gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ tau \( h \( s \) \) & = sum_i lambda_i tau \( h_i \( s \) \) \, & tau \( h \( s \)^2 \) & = sum_i lambda_i tau \( h_i \( s \)^2 \) \,\
d_tau \( \( h \( s \) - epsilon \)_(+) \) & = sum_i lambda_i d_tau \( \( h_i \( s \) - epsilon \)_(+) \) . $ <st:average-traces>]

 The traces on the right include the unnormalized internal matrices. All equalities include zero and infinite values.]
] <st:folding>

#proof[
  Use (2.5) once to exhibit $Q = C ⊗ cal(Q) ⊗ cal(K)$. For a matrix amplification choose a Hilbert-space unitary $U_k : bb(C)^k ⊗ ell^2 arrow.r ell^2$ and fold by $"id"_(C ⊗ cal(Q)) ⊗ "Ad" \( U_k \)$. This preserves the unnormalized matrix extension of every trace. For a finite set $E subset Q$, choose a finite-rank projection $e$ in the last factor such that $parallel a - e a e parallel$ is small for $a in E$. A unitary of $B \( ell^2 \)$ can send the folded first-corner copy of $e ell^2$ back to $e ell^2$, agreeing with the specified identification there. Conjugating the folding by this unitary fixes the compressed finite tests. The two compression errors give the desired approximation on $E$.
  Write $lambda_i = l_i \/ L$. In an additional UHF factor choose orthogonal projections $e_i$ with normalized traces $l_i \/ L$ and sum one. After folding the internal matrices, form
  $ h \( s \) = sum_i h_i \( s \) ⊗ e_i . $
  Orthogonality makes its norm the maximum of the block norms, and functional calculus is blockwise for functions vanishing at zero. This proves complete positivity, contractivity, and (2.11)–(2.11) before the final UHF identification.
  Choose that identification by interleaving tensor factors of a fixed infinite tensor-product realization of $cal(Q)$. Finite tensor permutation unitaries identify its first-factor embedding with the identity to any prescribed accuracy on finite tests. For a finite matrix direction the trace identity on matrix units gives $tilde(tau) \( a ⊗ e \) = "tr" \( e \) tau \( a \)$, where $tau \( a \) = tilde(tau) \( a ⊗ 1 \)$ and $"tr"$ is normalized. Increasing finite matrix algebras and positive cuts give this factorization for the UHF direction, including extended weights. Thus the identification preserves the displayed formulas even when $Q$ is nonunital. Multiplier conjugation also preserves every extended trace, by the trace identity applied to $a^(1 \/ 2) u$. The choices are made separately at each coordinate; finite sets, matrix sizes, and accuracies may therefore vary with that coordinate. ◻
]

We always distinguish the internal matrix directions from the normalized candidate-averaging direction. In particular, an internal sector sum is not divided by its number of sectors. All subsequent padding and foldings use 2 with the existing constant and finite test elements included among the elements to be aligned.

== 3 Sequence models and local error ideals <sec:sequence-models>

Put $D = Q_oo = ell^oo \( Q \) \/ c_0 \( Q \)$, and identify $Q$ with its constant sequences. We use square brackets for sequence classes when the distinction from coordinates matters. The two purposes of this section are to turn trace identities into uniform cut comparisons, and to retain local error bounds when approximation stages and matrix sizes vary.

=== 3.1 Regularized limits and their model data <regularized-limits-and-their-model-data>

#thm([Proposition 2.])[
  (Regularized limits).  #emph[Let $omega$ be a free ultrafilter on $bb(N)$, and let $tau_n in T \( Q \)$ be arbitrary. For a bounded positive sequence $\( x_n \)$, the formula 
#[#set math.equation(numbering: n => "(3.1)")
 $ rho \( \[ \( x_n \) \] \) = sup_(epsilon > 0) lim_(n arrow.r omega) tau_n \( \( x_n - epsilon \)_(+) \) $ <seq:regularization-formula>]

 defines a lower-semicontinuous tracial weight on $D$. Its rank functional is 
#[#set math.equation(numbering: n => "(3.2)")
 $ d_rho \( \[ \( x_n \) \] \) = sup_(epsilon > 0) lim_(n arrow.r omega) d_(tau_n) \( \( x_n - epsilon \)_(+) \) . $ <seq:regularized-rank>]

 If $sigma = lim_(n arrow.r omega) tau_n$ in the canonical topology on $T \( Q \)$, then $rho \|_Q = sigma$.]
] <seq:regularized>

#proof[
  Pull $tau_n$ back to $ell^oo \( Q \)$ by its $n$-th coordinate homomorphism. The compact Hausdorff trace cone has a unique limit along $omega$, say $tilde(rho)$. For every positive $x$ in the product, the defining topology gives
  $ lim_omega tau_n \( \( x_n - epsilon \)_(+) \) lt.eq tilde(rho) \( x \) \, #h(2em) tilde(rho) \( \( x - epsilon \)_(+) \) lt.eq lim_omega tau_n \( \( x_n - epsilon \)_(+) \) . $
  Taking suprema over $epsilon$ proves (3.1) on the product. Every fixed cut of an element of $c_0 \( Q \)_(+)$ is eventually zero, so $tilde(rho)$ vanishes on that ideal and descends to a lower-semicontinuous trace $rho$ on the quotient. This also proves independence of the representative. The same two inequalities for constant sequences give $rho \|_Q = sigma$.
  For completeness, rescale the representatives so that $0 lt.eq x_n lt.eq 1$, and let the right side of (3.2) be $L$. For every $k$ and $t > 0$,
  $ tau_n \( \( x_n^(1 \/ k) - t \)_(+) \) lt.eq d_(tau_n) \( \( x_n - t^k \)_(+) \) . $
  Regularization and then the supremum over $k$ show $d_rho \( x \) lt.eq L$. Conversely, choose a continuous function $g_epsilon$ with values in $\[ 0 \, 1 \]$, zero on $\[ 0 \, epsilon \/ 2 \]$, and one on $\[ epsilon \, 1 \]$. For $0 < t < 1$,
  $ tau_n \( \( g_epsilon \( x_n \) - t \)_(+) \) gt.eq \( 1 - t \) d_(tau_n) \( \( x_n - epsilon \)_(+) \) . $
  The support of $g_epsilon \( x \)$ is below the support of $x$. Thus $d_rho \( x \) gt.eq rho \( g_epsilon \( x \) \)$, and regularization followed by $t arrow.b 0$ gives $d_rho \( x \) gt.eq lim_omega d_(tau_n) \( \( x_n - epsilon \)_(+) \)$. Taking the supremum over $epsilon$ proves the reverse inequality. ◻
]

We call the weights in 2 #emph[regularized limits]. The coordinate weights need not be bounded, normalized, or densely finite. Passing to a subsequence is included by taking an ultrafilter concentrated on its indices.

Let $Y$ be a point, a half-open interval, or $bb(R)$, with a full-support Radon measure $m$. The measure is finite on a cone interval and locally finite on $bb(R)$. Write $S = S_Y$. For $nu in T \( P \)$, the product $m ⊗ nu$ is the integrated densely finite trace on $C_0 \( Y \) ⊗ "Fin" \( nu \)$, extended to be infinity on positives outside that ideal. In particular,

#[#set math.equation(numbering: n => "(3.3)")
 $ d_(m ⊗ nu) \( f ⊗ a \) = m \( { f > 0 } \) d_nu \( a \) #h(2em) \( f in C_0 \( Y \)_(+) \, med a in P_(+) \) . $ <seq:product-rank>]

Here a zero factor makes the product zero, including the expression $0 dot.op oo$. Full support of $m$ ensures that a nonzero positive continuous function has support of positive measure.

#prodef([Definition 1.])[
  (Model).  A model for $\( Y \, m \, F \)$ is a homomorphism $p : S_Y arrow.r D$ such that
  #[#set math.equation(numbering: n => "(3.4)")
   $ rho compose p = m ⊗ F \( sigma \) \, #h(2em) sigma = rho \|_Q \, $ <seq:model-equation>]
  for every regularized limit $rho$.
] <seq:model>

We fix a countable collection of positive elementary tensors for testing this identity. In each basis ideal $P \( V \)$, choose a countable dense positive set, include its positive rational cuts, and include the less deeply cut elements needed as enlarged tests. In $C_0 \( Y \)$, choose countable dense positive sets on a compact exhaustion and their rational cuts, with enlarged compact supports. Take all tensor products of these choices, including the zero tensor and all positive rational cuts of each chosen factor. A cut above a factor’s norm is simply zero, and its rank identity is automatic. For the line or a varying interval, a compact test and its enlarged support are chosen inside one common open interval before an exhaustion index is advanced.

#thm([Lemma 3.])[
  (Elementary determination).  #emph[A trace $theta in T \( S_Y \)$ equals $m ⊗ nu$ if its ranks on the preceding countable test collection satisfy (3.3). In particular, checking those ranks for every regularized limit suffices for (3.4).]
] <seq:elementary-tests>

#proof[
  We first extend the rank identities to all elementary tensors, then identify the ideal where the weights are densely finite, and finally compare their bounded restrictions inside that ideal.
  #emph[Extension of the tests.] Suppose that positive contractions $f_j \, a_i$ approximate $f \, a$ within $eta$. The perturbation cut inequalities and their tensor products give
  $ \( f - 3 eta \)_(+) ⊗ \( a - 3 eta \)_(+) prec.tilde \( f_j - 2 eta \)_(+) ⊗ \( a_i - 2 eta \)_(+) prec.tilde f ⊗ a . $
  The middle tensors belong to the test collection when $eta$ is rational; their enlarged versions give the same comparison with any fixed positive cuts of $f$ and $a$ on the left. Ranks preserve increasing suprema of such cuts. Applying these comparisons to both $theta$ and $m ⊗ nu$, and letting $eta arrow.b 0$, proves (3.3) for every elementary tensor with compact function support. Exhaustion gives the remaining elementary tensors.
  #emph[Identification of the finite ideal.] Set $I = "Fin" \( nu \)$. The finite ideal of $theta$ is exactly $C_0 \( Y \) ⊗ I$. For one inclusion, a compactly supported function and a compactly Cuntz supported positive element of $I$ give a tensor of finite $theta$-rank. Their ideals generate $C_0 \( Y \) ⊗ I$. For the other inclusion, let an open rectangle $V times U$ be contained in the support of $"Fin" \( theta \)$. Take nonzero $f in C_c \( V \)_(+)$ and cut-supported $a in P \( U \)_(+)$. Choose $f_0 in C_c \( V \)_(+)$ equal to one on $"supp" \( f \)$, and $b in P \( U \)_(+)$, $delta > 0$, with $a prec.tilde \( b - delta \)_(+)$. Then
  $ f ⊗ a prec.tilde \( f_0 ⊗ b - delta \/ 2 \)_(+) . $
  The larger tensor belongs to $"Fin" \( theta \)$, so $f ⊗ a$ is compactly Cuntz supported there and has finite $theta$-rank by (2.6). Formula (3.3) and $0 < m \( f > 0 \) < oo$ imply $d_nu \( a \) < oo$. Such elements generate $P \( U \)$, so $P \( U \) subset.eq I$. Rectangles exhaust the open support of any ideal, proving the claim.
  #emph[Equality on the finite ideal.] It remains to identify the densely finite traces on this common ideal; there is nothing to prove if $I = 0$. Choose a strictly positive $h in I$, put $e_n = \( h - 1 \/ n \)_(+)$, and choose increasing positive compactly supported functions $f_n$ whose open supports exhaust $Y$. The hereditary algebras
  $ H_n = "Her" \( f_n ⊗ e_n \) = C_0 \( { f_n > 0 } \) ⊗ "Her" \( e_n \) $
  increase with dense union in $C_0 \( Y \) ⊗ I$. Both traces have finite support rank on $H_n$, because $m \( f_n > 0 \) d_nu \( e_n \) < oo$. Their restrictions are bounded and extend normally to $H_n^(* *)$. For a positive elementary tensor in $H_n$, two-variable spectral integration and the already established elementary rank identities give
  $ theta \( f ⊗ a \) & = integral_0^(parallel f parallel) integral_0^(parallel a parallel) d_theta \( \( f - t \)_(+) ⊗ \( a - u \)_(+) \) thin d u thin d t\
 & = integral_0^(parallel f parallel) integral_0^(parallel a parallel) m \( f > t \) d_nu \( \( a - u \)_(+) \) thin d u thin d t = #scale(x: 180%, y: 180%)[\(] integral_Y f thin d m #scale(x: 180%, y: 180%)[\)] nu \( a \) . $
  The first integrand is the value of the normal extension on the product of the two spectral projections. Tonelli’s theorem applies to these nonnegative functions. Boundedness and algebraic tensor density now give equality of the two traces on $H_n$. Choose a positive contractive approximate unit $\( v_n \)$ of the common ideal with each $v_n$ in the union of the $H_j$. For every $x gt.eq 0$ in that ideal, $v_n x v_n$ belongs to one of these hereditary algebras, and
  $ theta \( v_n x v_n \) = theta \( x^(1 \/ 2) v_n^2 x^(1 \/ 2) \) lt.eq theta \( x \) \, #h(2em) v_n x v_n arrow.r x . $
  Lower semicontinuity gives $theta \( x \) = lim_n theta \( v_n x v_n \)$, and the same argument holds for $m ⊗ nu$. Equality on the localizations therefore gives equality on the common finite ideal. Both weights are infinity outside it. Thus they agree everywhere. ◻
]

=== 3.2 Uniform comparison and cut sandwiches <uniform-comparison-and-cut-sandwiches>

The following elementary estimate is the source of the uniformity needed when rows of models are combined.

#thm([Lemma 4.])[
  (Bounded witnesses into a fixed cut).  #emph[Let $a \, b$ be positive elements in a matrix algebra over any $C^(*)$-algebra, and suppose that $a prec.tilde \( b - delta \)_(+)$, where $delta > 0$. For every $eta > 0$ there is a comparison element $w$ such that 
#[#set math.equation(numbering: n => "(3.5)")
 $ parallel w^(*) b w - a parallel < eta \, #h(2em) parallel w parallel^2 lt.eq frac(parallel a parallel + eta, delta) . $ <seq:witness-bound>]

 The bound is independent of the matrix size.]
] <seq:uniform-witness>

#proof[
  Choose $v$ with $parallel v^(*) \( b - delta \)_(+) v - a parallel < eta$, and put
  $ g_delta \( t \) = cases(delim: "{", sqrt(\( t - delta \)_(+) \/ t) \, & t > 0 \,, 0 \, & t = 0 \,) #h(2em) w = g_delta \( b \) v . $
  Then $w^(*) b w = v^(*) \( b - delta \)_(+) v$, while $g_delta \( b \)^2 lt.eq delta^(- 1) \( b - delta \)_(+)$. This proves (3.5). ◻
]

#thm([Lemma 5.])[
  (Strict comparison from regularized limits).  #emph[Let $x \, y in D_(+)$. If there is $0 < alpha < 1$ such that 
#[#set math.equation(numbering: n => "(3.6)")
 $ d_rho \( x \) lt.eq alpha d_rho \( y \) quad upright("for every regularized limit ") rho \, $ <seq:strict-rank-hypothesis>]

 then $x prec.tilde y$. The same assertion holds after finite matrix amplification and after coordinatewise folding.]
] <seq:strict-comparison>

#proof[
  Choose bounded positive representatives $x_n \, y_n$. If comparison fails, there is $epsilon > 0$ with $\( x - 2 epsilon \)_(+) ≾̸ y$. For every fixed $delta > 0$, there must be arbitrarily late coordinates with
  #[#set math.equation(numbering: n => "(3.7)")
   $ \( x_n - epsilon \)_(+) ≾̸ \( y_n - delta \)_(+) . $ <seq:failed-coordinate-comparison>]
  Otherwise 4, applied for each approximation accuracy, supplies bounded sequences of witnesses showing $\( x - epsilon \)_(+) prec.tilde y$, a contradiction.
  Choose increasing indices $n_k$ where (3.7) holds for $delta = 1 \/ k$. Pointwise order in $"Cu" \( Q \)$, from (2.4), gives a trace whose rank on the source is strictly larger than its rank on the target. The smaller rank is finite. If the larger rank is finite, divide the trace by that rank; if it is infinite, divide by one plus the smaller rank. Thus we may choose $tau_k$ with
  $ d_(tau_k) \( \( x_(n_k) - epsilon \)_(+) \) gt.eq 1 \, #h(2em) d_(tau_k) \( \( y_(n_k) - 1 \/ k \)_(+) \) lt.eq 1 . $
  Take a free ultrafilter on these indices and the corresponding regularized limit. Formula (3.2) gives $d_rho \( x \) gt.eq 1$. For each fixed $t > 0$, the cut $\( y_(n_k) - t \)_(+)$ is eventually below $\( y_(n_k) - 1 \/ k \)_(+)$, so the same formula gives $d_rho \( y \) lt.eq 1$. This contradicts (3.6). All comparisons used to select $tau_k$ took place in $Q$. Matrix folding preserves those comparisons and ranks by 2. ◻
]

#thm([Proposition 3.])[
  (Sandwich comparisons).  #emph[Let $p : S_Y arrow.r D$ be a model, let $s = f ⊗ a gt.eq 0$, and suppose that $0 < m_0 := m \( f > 0 \) < oo$. For $r > 0$, choose $c_r in Q_(+)$ representing $r G \[ a \]$. Then 
#[#set math.equation(numbering: n => "(3.8)")
 $ c_r prec.tilde p \( s \) quad \( 0 < r < m_0 \) \, #h(2em) p \( s \) prec.tilde c_r quad \( r > m_0 \) . $ <seq:uncut-sandwich>]

 The following versions have fixed target cuts.]
  #emph[If $eta \, delta > 0$, $0 < r < m \( f > eta \)$, and $c$ represents $r G \[ \( a - delta \)_(+) \]$, then, for every $0 < kappa < eta delta$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ c prec.tilde \( p \( f ⊗ a \) - kappa \)_(+) . $ <seq:lower-trimmed-sandwich>]

 If $r' > m_0$ and $epsilon > 0$, then a representative $b$ of $r' G \[ a \]$ has a positive cut $\( b - kappa \)_(+)$ such that 
#[#set math.equation(numbering: n => "(3.10)")
 $ \( p \( f ⊗ a \) - epsilon \)_(+) prec.tilde \( b - kappa \)_(+) . $ <seq:upper-trimmed-sandwich>]

 The choices in these two displays can be made independently of the model $p$. The complete collection of such comparisons on the countable compact tests characterizes the model equation.]
] <seq:sandwich>

#proof[
  For a regularized limit $rho$, put $sigma = rho \|_Q$ and $t = d_(F sigma) \( a \)$. The ranks of $c_r$ and $p \( s \)$ are $r t$ and $m_0 t$. Their ratio has the required strict scalar slack in the appropriate direction, so 5 proves (3.8). This reasoning includes $t = 0$ and $t = oo$; the separating normalization in that lemma forces a finite nonzero value whenever it is needed for a contradiction.
  Apply the lower comparison to $s' = \( f - eta \)_(+) ⊗ \( a - delta \)_(+)$. Its support lies in the spectral region $f ⊗ a > eta delta$, so elementary functional calculus gives $s' prec.tilde \( f ⊗ a - kappa \)_(+)$ whenever $0 < kappa < eta delta$. Applying $p$ proves (3.9).
  For the upper comparison, choose $m_0 < r < r'$ and $delta > 0$ with $parallel f parallel delta < epsilon \/ 2$. The norm perturbation from $f ⊗ a$ to $f ⊗ \( a - delta \)_(+)$ gives
  $ \( p \( f ⊗ a \) - epsilon \)_(+) prec.tilde p \( f ⊗ \( a - delta \)_(+) \) prec.tilde c \, #h(2em) \[ c \] = r G \[ \( a - delta \)_(+) \] . $
  Since positive scalar multiplication preserves compact containment,
  $ \[ c \] lt.double r G \[ a \] lt.eq r' G \[ a \] = \[ b \] . $
  There is therefore $kappa > 0$ with $\[ c \] lt.eq \[ \( b - kappa \)_(+) \]$. This choice uses only the indicated constant classes, not $p$.
  Conversely, apply any regularized rank to the fixed-cut comparisons. Let $delta \, eta arrow.b 0$ and let the rational lower and upper scalars approach $m_0$. The resulting inequalities give (3.3) for the pullback trace on every compact test. Supremum of cuts handles zero or infinite ranks, and compact exhaustion handles infinite-measure supports. 3 now gives (3.4). ◻
]

#thm([Corollary 1.])[
  (Constant ideals and all traces).  #emph[For a model $p$ and every $s in S$, 
#[#set math.equation(numbering: n => "(3.11)")
 $ "Ideal"_D \( p \( s \) \) = "Ideal"_D \( Q \( U_s \) \) . $ <seq:constant-ideal>]

 Given countably many models $p_i : S arrow.r D$, there is a separable subalgebra $D_0 subset.eq D$ containing their ranges and the constants $Q$, such that, for every $gamma in T \( D_0 \)$, 
#[#set math.equation(numbering: n => "(3.12)")
 $ gamma compose p_i = m ⊗ F \( gamma \|_Q \) quad upright("for every ") i . $ <seq:all-trace-model-equation>]

 It may also contain any prescribed countable subset of $D$.]
] <seq:all-traces>

#proof[
  For a nonzero elementary tensor of finite function support, the upper sandwiches put its image in the ideal generated by the corresponding constants. The lower trimmed sandwiches recover the ideals of all cuts of $a$, hence the whole constant ideal $Q \( U_a \)$. For general $s$, the ideal generated by $s$ in $S$ is generated by positive elementary tensors whose rectangle supports lie in its open support. Their projected supports exhaust $U_s$. Applying the elementary lower bounds gives $"Ideal"_D \( Q \( U_s \) \) subset.eq "Ideal"_D \( p \( s \) \)$. Approximating $s$ by finite sums of elementary tensors from $S \( U_s \)$ and applying the upper bounds gives the reverse inclusion.
  For the second assertion, start with the separable algebra generated by the stated ranges, constants, and extra elements. For every countable test, every rational cut and scalar in 3, and every model, adjoin the matrix entries of comparison witnesses at accuracies tending to zero. The resulting algebra $D_0$ is separable, and all these comparisons hold in $"Cu" \( D_0 \)$, not just in $"Cu" \( D \)$. For $gamma in T \( D_0 \)$, write $sigma = gamma \|_Q$. The rank of a constant representing $r G \[ a \]$ is $r d_(F sigma) \( a \)$. Applying $d_gamma$ to the retained sandwiches therefore gives the elementary rank formula for each $gamma compose p_i$. The proof of the converse in 3 and 3 applies without requiring $gamma$ to be a regularized limit. This proves (3.12). ◻
]

=== 3.3 The ideals of locally small elements <the-ideals-of-locally-small-elements>

#prodef([Definition 2.])[
  (Local error ideal).  For an open $U subset.eq X$, an element $x = \[ \( x_n \) \] in D$ belongs to $J \( U \)$ if, for every $epsilon > 0$, there are a positive element $c$ compactly Cuntz supported in $Q \( U \)$, a sequence $r_n > 0$ tending to zero, and an index $N$, such that
  #[#set math.equation(numbering: n => "(3.13)")
   $ d_tau \( \( \| x_n \| - epsilon \)_(+) \) lt.eq r_n d_tau \( c \) #h(2em) \( n gt.eq N \, med tau in T \( Q \) \) . $ <seq:smallideal-bound>]
  The controller $c$, the decay sequence, and $N$ may depend on $x \, U \, epsilon$. Once these have been chosen, the same bound holds for all traces and all coordinates in the tail.
] <seq:smallideal>

The scalar $r_n$ is strictly positive; consequently the right side of (3.13) is unambiguously infinity when $d_tau \( c \) = oo$. No estimate on the uncut element is part of this definition.

For example, fix a nonzero positive contraction $a$ compactly Cuntz supported in $Q \( U \)$. In an additional UHF factor choose projections $e_n$ of positive rational traces $t_n arrow.r 0$. After the trace-preserving identification of 2, the elements $x_n = a ⊗ e_n$ satisfy

$ parallel x_n parallel = parallel a parallel \, #h(2em) d_tau \( \( x_n - epsilon \)_(+) \) = t_n d_tau \( \( a - epsilon \)_(+) \) lt.eq t_n d_tau \( a \) . $

Thus $\[ \( x_n \) \]$ belongs to $J \( U \)$ and is nonzero. This is the kind of smallness that allows a stabilizing map to retain its norm while the coefficient in its local rank bound tends to zero.

#thm([Proposition 4.])[
  (Properties of the local error ideals).  #emph[The definition of $J \( U \)$ is independent of representatives and makes it a closed two-sided ideal of $D$. The assignment is order preserving, and 
#[#set math.equation(numbering: n => "(3.14)")
 $ J \( U \) subset.eq "Ideal"_D \( Q \( U \) \) . $ <seq:smallideal-support>]

 If $rho$ is a regularized limit and its restriction $sigma = rho \|_Q$ is densely finite on $Q \( U \)$, then 
#[#set math.equation(numbering: n => "(3.15)")
 $ rho \|_(J \( U \)) = 0 . $ <seq:smallideal-vanishing>]

 All assertions use the same conventions in finite matrix algebras.]
] <seq:smallideal-properties>

#proof[
  We recall the cut estimates that will be used. For bounded operators in a $C^(*)$-algebra and every tracial rank, the following weaker forms of the spectral cut inequalities suffice:
  #[#set math.equation(numbering: n => "(3.16)")
   $ d_tau \( \( \| x + y \| - epsilon \)_(+) \) & lt.eq d_tau \( \( \| x \| - epsilon \/ 4 \)_(+) \) + d_tau \( \( \| y \| - epsilon \/ 4 \)_(+) \) \,\
d_tau \( \( \| b x \| - epsilon \)_(+) \) \, med d_tau \( \( \| x b \| - epsilon \)_(+) \) & lt.eq d_tau \( \( \| x \| - epsilon \/ \( 2 M \) \)_(+) \) quad \( parallel b parallel lt.eq M \, M > 0 \) . $ <seq:sum-cut>]
  Also $d_tau \( \( \| x^(*) \| - t \)_(+) \) = d_tau \( \( \| x \| - t \)_(+) \)$, and
  #[#set math.equation(numbering: n => "(3.17)")
   $ parallel x - y parallel < epsilon \/ 4 quad arrow.r.double quad d_tau \( \( \| x \| - epsilon \)_(+) \) lt.eq d_tau \( \( \| y \| - epsilon \/ 2 \)_(+) \) . $ <seq:perturbation-cut>]
  Here is an explicit cut reduction. Set
  $ x_t = x f_t \( \| x \| \) \, #h(2em) f_t \( s \) = cases(delim: "{", \( s - t \)_(+) \/ s \, & s > 0 \,, 0 \, & s = 0 .) $
  Then $parallel x - x_t parallel lt.eq t$ and $\| x_t \| = \( \| x \| - t \)_(+)$. Use the perturbation comparison $parallel z - w parallel < epsilon arrow.r.double \( \| z \| - epsilon \)_(+) prec.tilde \| w \|$. For the sum take $w = x_(epsilon \/ 4) + y_(epsilon \/ 4)$, and use $\| w \| prec.tilde \| x_(epsilon \/ 4) \| xor \| y_(epsilon \/ 4) \|$. For a product take $w = b x_(epsilon \/ \( 2 M \))$, whose absolute value is Cuntz below $\| x_(epsilon \/ \( 2 M \)) \|$. For (3.17) take $w = y_(epsilon \/ 2)$, so that $parallel x - w parallel < 3 epsilon \/ 4$. The identities for adjoints give the other product order. These comparisons follow from the positive cut perturbation lemma and $\[ v^(*) v \] = \[ v v^(*) \]$; applying the additive rank functional proves the displays for extended weights as well.
  If $x \, y in J \( U \)$, choose their controllers at tolerance $epsilon \/ 4$. A folded finite block sum of the controllers is compactly Cuntz supported in $Q \( U \)$. Taking the maximum of the two decay sequences proves the bound for $x + y$ by (3.16). Equation (3.16) proves closure under multiplication on either side by an arbitrary bounded sequence. The equality for adjoints proves self-adjointness. Equation (3.17) proves independence of the representative. For norm closure, first fix $epsilon$, then choose one element of the approximating sequence within $epsilon \/ 8$ in quotient norm. Its representatives are eventually within $epsilon \/ 4$, so its controller at tolerance $epsilon \/ 2$ works for the desired output cut. Monotonicity in $U$ follows directly from the definition.
  To prove (3.14), fix a cut of $\| x \|$, choose its controller $c prec.tilde \( b - delta \)_(+)$ in $Q \( U \)$, and wait until $r_n lt.eq 1$. Pointwise order in $"Cu" \( Q \)$ gives $\( \| x_n \| - epsilon \)_(+) prec.tilde c prec.tilde \( b - delta \)_(+)$. The bounded witnesses of 4 give comparison with the constant $b$ in the quotient. Every positive cut of $\| x \|$ is consequently in $"Ideal"_D \( Q \( U \) \)$, and so is $x$.
  For vanishing, fix $epsilon$ and the same type of controller. For each coordinate weight,
  #[#set math.equation(numbering: n => "(3.18)")
   $ d_(tau_n) \( c \) lt.eq 4 / delta thin tau_n \( \( b - 3 delta \/ 4 \)_(+) \) . $ <seq:controller-trace-bound>]
  Indeed, on the spectral region $b > delta$, the function $\( b - 3 delta \/ 4 \)_(+)$ is at least $delta \/ 4$. Put $h = \( b - delta \/ 2 \)_(+)$. Dense finiteness on $Q \( U \)$ and (2.6) give $sigma \( h \) < oo$, while the trace-cone convergence inequalities give
  $ lim_omega tau_n \( \( b - 3 delta \/ 4 \)_(+) \) = lim_omega tau_n \( \( h - delta \/ 4 \)_(+) \) lt.eq sigma \( h \) . $
  The ranks in (3.18) are therefore bounded on an $omega$-large set. Multiplying by $r_n arrow.r 0$ in (3.13) and using (3.2) yields $d_rho \( \| x \| \) = 0$. Hence $rho$ vanishes on $J \( U \)_(+)$. The proof uses only finite matrix sums and unnormalized ranks, so it also proves the matrix assertions, with foldings as in 2. ◻
]

=== 3.4 A diagonalization with fixed controllers <a-diagonalization-with-fixed-controllers>

The diagonalizations used below retain two different kinds of control. A fixed positive controller bounds a local error’s rank, while a fixed positive target cut bounds the norm of a comparison witness. Both must be chosen before advancing through the approximation stages. We call each stage’s sequence of coordinate approximations a #emph[row]. Its finite matrix size may depend on the row and on the coordinate; all matrices are folded by 2.

#thm([Lemma 6.])[
  (Local diagonalization).  #emph[Let $cal(A)$ be a countable dense $bb(Q) + i bb(Q)$ $*$-subalgebra of $S = S_Y$, containing the localized dense sets to be tested. For each $j$, let $L_j : cal(A) arrow.r D$ be a map, and choose bounded coordinate representatives $L_(j \, n) \( a \)$ for every $a in cal(A)$. Assume that, for each fixed input, 
$ limsup_(j arrow.r oo) parallel L_j \( a \) parallel lt.eq parallel a parallel \, $

 and that the quotient errors in every fixed rational linearity, involution, and multiplicativity relation tend to zero as $j arrow.r oo$. Only bounds on each fixed input are required. Then one can choose $j \( n \) arrow.r oo$ such that 
$ L \( a \) = \[ \( L_(j \( n \) \, n) \( a \) \) \] $

 extends to a contractive homomorphism $L : S arrow.r D$.]
  #emph[The same diagonal choice can retain the following countable data.]
  + #emph[For each $l$, fix basis opens $V_l subset.double U_l$ and row errors $e_l^(\( j \)) in J \( V_l \)$, for all sufficiently large $j$, with chosen representatives $e_(l \, n)^(\( j \))$. Assume $sup_j parallel e_l^(\( j \)) parallel < oo$. Then their diagonal $e_l = \[ \( e_(l \, n)^(\( j \( n \) \)) \) \]$ belongs to $J \( U_l \)$.]
  + #emph[For each prescribed comparison, let $a^(\( j \)) \, b^(\( j \)) in D_(+)$ have uniformly bounded norms and chosen bounded positive representatives. Suppose $a^(\( j \)) prec.tilde \( b^(\( j \)) - delta \)_(+)$, where $delta > 0$ is independent of $j$. If $a \, b$ are the respective diagonals, then $a prec.tilde \( b - delta' \)_(+)$ for any preselected $0 < delta' < delta$.]
  #emph[For local errors arising from maps on $S$, it suffices to schedule dense localized inputs in these pairs $V subset.double U$. The conclusion then extends to every open $U$ and every input in $S \( U \)$ if the coordinate error maps are uniformly equicontinuous on bounded sets, or if their diagonals are the values of a continuous expression in the resulting quotient maps. This includes differences from fixed equicontinuous coordinate maps and continuous multilinear errors, with the other variables on countable dense lists.]
  #emph[In particular, a diagonal of models is again a model when their data agree on the fixed compact tests and their enlarged versions. This also applies to models on increasing intervals with unchanged measure on these tests. Every subsequence of a model retains its model data.]
] <seq:diagonal>

#proof[
  #emph[The common controller and the coordinate choice.] Enumerate all algebraic relations and positive rational cut tests. Reindex the rows so that row $j$ includes the first $j$ requirements and their quotient norm errors tend to zero. Include the bounds on each prescribed error and comparison element among these requirements. Set any as yet unspecified early-row errors to zero. In the following construction let $l$ enumerate pairs consisting of a prescribed local error and a positive rational tolerance $epsilon_l$; repeat that error’s opens and representatives with each tolerance. Choose once and for all the controller $b_l = b_(V_l \, U_l)$ from 1.
  In row $j$, the $l$-th error has, after folding, a bound
  $ d_tau \( \( \| e_(l \, n)^(\( j \)) \| - epsilon_l \)_(+) \) lt.eq r_(l \, n)^(\( j \)) d_tau \( c_l^(\( j \)) \) \, #h(2em) r_(l \, n)^(\( j \)) arrow.r 0 \, $
  uniformly for $tau in T \( Q \)$ eventually in $n$. The controller $c_l^(\( j \))$ is compactly Cuntz supported in $Q \( V_l \)$. There is therefore a finite integer $N_(j \, l)$ with
  $ \[ c_l^(\( j \)) \] lt.eq N_(j \, l) \[ b_l \] . $
  This integer absorbs internal matrix sizes, repeated blocks, and any other finite multiplicity at that stage. No bound on it as $j arrow.r oo$ is required.
  Fix a sequence $eta_j arrow.b 0$. After the controllers and the integers $N_(j \, l)$ have been chosen for $l lt.eq j$, choose strictly increasing coordinate thresholds $n_j gt.eq j$ so large that
  #[#set math.equation(numbering: n => "(3.19)")
   $ N_(j \, l) r_(l \, n)^(\( j \)) lt.eq eta_j #h(2em) \( n gt.eq n_j \, med l lt.eq j \) . $ <seq:diagonal-delay>]
  At the same threshold impose the first $j$ norm and algebraic requirements, with an additional coordinate error at most $eta_j$. This is possible because a quotient norm is the limsup of the coordinate norms. Choose representatives for the countable values; linearity of those representatives is unnecessary, since the linearity relations themselves are among the tests.
  For $n_j lt.eq n < n_(j + 1)$, put $j \( n \) = j$ and use row $j$. The diagonal norm bounds make each prescribed value a bounded sequence. For any fixed local test $l$, (3.19) then gives, eventually,
  $ d_tau \( \( \| e_(l \, n) \| - epsilon_l \)_(+) \) lt.eq eta_(j \( n \)) d_tau \( b_l \) \, #h(2em) j \( n \) arrow.r oo . $
  The controller on the right is fixed, so this is precisely the required $J \( U_l \)$ bound. Enumerating all rational cut tolerances proves membership in that ideal. The diagonal norm requirements give $parallel L \( a \) parallel lt.eq parallel a parallel$, and all algebraic errors vanish. Thus the quotient values extend uniquely to a contractive homomorphism on $S$.
  #emph[Extension of local errors.] For an arbitrary open $U$, the ideals $S \( V \)$, with basis opens $V subset.double U' subset.eq U$, have dense union in $S \( U \)$. Indeed they generate $S \( U \)$ as a closed sum, and finite sums already lie in one member: replace finitely many pairs $V_i subset.double U'_i$ by their finite unions, using the basis from 1. Thus the union of the scheduled localized dense sets is dense in $S \( U \)$. Each retained error on those sets lies in $J \( U' \) subset.eq J \( U \)$. Closedness of $J \( U \)$ and the assumed continuity extend this containment to every localized input. For errors with several variables, approximate each variable on its scheduled dense set, using the global lists for unrestricted variables. The continuity used here is either uniform equicontinuity of the coordinate errors or continuity of their expression in the completed quotient maps. Continuity of each row separately would not suffice.
  #emph[Comparison witnesses with a fixed target cut.] Suppose a row comparison has uniformly bounded source $a^(\( j \))$ and uniformly bounded $b^(\( j \))$, with target $\( b^(\( j \)) - delta \)_(+)$ and $delta > 0$ independent of $j$. Include both source and target norms in the coordinate requirements, so their diagonals belong to the sequence algebra. For a chosen positive source cut and comparison accuracy, use 4 with uncut target $\( b^(\( j \)) - delta' \)_(+)$ and cut size $delta - delta'$. Its squared norm is bounded by the source norm plus the accuracy, divided by $delta - delta'$. Lift the witness to a bounded coordinate sequence with arbitrarily small additional norm and equation errors, and put its finite-test equation among the requirements imposed at $n_j$. This retained target slack gives bounded witnesses on the diagonal. Enumerating source cuts and accuracies proves the desired Cuntz comparisons there. Thus the order of choices is: fixed tests and target cuts, row controllers and witnesses, comparison multiplicities, and finally the coordinate thresholds.
  For rows of models, the lower bounds (3.9) use target thresholds $kappa < eta delta$ determined by fixed trimmed input factors. The upper bounds (3.10) use cuts of fixed constant representatives, determined by the scalar slack and the fixed source tolerance. Both kinds of target threshold are independent of the row. They can therefore be retained by the preceding procedure. The converse part of 3 identifies the diagonal model data. On increasing intervals the same argument uses the common compact tests and their unchanged measure; no condition is imposed on the moving endpoints. Restriction to any subsequence retains all fixed-cut comparisons, which proves the final assertion. ◻
]

#prodef([Remark 1.])[
  When the resulting quotient map is a homomorphism with nuclear separable domain, the completely positive lifting theorem provides c.p.c. coordinate lifts #cite(label("ChoiEffrosLifting")) Theorem 3.10. Those lifts represent the same quotient values. Consequently all fixed-cut comparisons and all memberships in $J \( U \)$ are unchanged. This permits the diagonal construction to be carried out first on countable algebraic data, while later arguments use actual c.p.c. coordinate maps.
] <seq:lifts>

== 4 Small stabilizers <sm:section>

We construct homomorphisms whose values belong to the local error ideals, but are large enough to absorb a prescribed countable family of errors. All matrix comparisons in this section are stable comparisons. The identifications of 2 are understood; in particular, a rational UHF fraction changes ranks, not operator norms.

#thm([Theorem 4.1.])[
  (Small stabilizers).  #emph[Let $S = C_0 \( Y \) ⊗ P$, and prescribe countably many pairs 
$ x_l in S_(+) \, #h(2em) e_l in J \( U_(x_l) \) \, #h(2em) l in bb(N) . $

 There is a homomorphism $theta : S arrow.r D$ satisfying 
#[#set math.equation(numbering: n => "(4.1)")
 $ theta \( S \( U \) \) subset.eq J \( U \) \, #h(2em) e_l in "Ideal"_D \( theta \( x_l \) \) quad \( U subset.eq X upright(" open") \, med l in bb(N) \) \, $ <sm:local-and-lower>]

 in either of the following situations.]
  + #emph[An existing model $chi : S arrow.r D$ is given. In this case $theta$ can be a slowly vanishing rational UHF fraction of $chi$, and it also satisfies 
#[#set math.equation(numbering: n => "(4.2)")
 $ theta \( S \( U_x \) \) subset.eq "Ideal"_D \( theta \( x \) \) #h(2em) \( x in S_(+) \) . $ <sm:coarse-fullness>]

 For every fixed $N$, $N$ copies of its defining fraction fit in the defining copy of $chi$ at all sufficiently late coordinates.]
  + #emph[$Y = \( 0 \, 1 \]$. No model is needed in this case, and (4.2) is not asserted.]
  #emph[In both cases, for every $l$ and $epsilon > 0$ there is $delta_(l \, epsilon) > 0$ such that 
#[#set math.equation(numbering: n => "(4.3)")
 $ \[ \( \| e_l \| - epsilon \)_(+) \] lt.eq \[ \( theta \( x_l \) - delta_(l \, epsilon) \)_(+) \] quad upright("in ") "Cu" \( D \) . $ <sm:fixed-lower-cut>]

 The construction permits the prescribed errors and the stabilizer to occupy separate matrix corners.]
] <sm:stabilizers>

The cut in (4.3) will remain fixed while the accuracy, matrix sizes, and finite lists change. We first describe the countable tests and the comparison convention used to ensure this.

=== 4.1 Fixed tests and comparison bounds <fixed-tests-and-comparison-bounds>

Choose a countable compact-containment basis for the open ideals as in 1. For every pair $V subset.double U$ in this basis, choose a norm-dense sequence of positive contractions in $S \( V \)$, and include all positive rational cut tolerances. Enumerate the resulting upper tests as

#[#set math.equation(numbering: n => "(4.4)")
 $ \( a_i \, epsilon_i \, V_i \, U_i \) \, #h(2em) a_i in S \( V_i \)_(+) \, quad V_i subset.double U_i \, quad epsilon_i > 0 . $ <sm:upper-tests>]

For each test fix a compactly Cuntz-supported positive $b_i in Q \( U_i \)$ whose generated ideal contains $Q \( V_i \)$. These controllers are chosen once, before the approximation stages. Showing

#[#set math.equation(numbering: n => "(4.5)")
 $ d_tau \( \( theta_n \( a_i \) - epsilon_i \)_(+) \) lt.eq s_(i \, n) d_tau \( b_i \) \, #h(2em) s_(i \, n) arrow.r 0 \, $ <sm:upper-goal>]

uniformly in $tau$, suffices for local smallness. Indeed, 4 first gives the conclusion on the dense positive tests in $S \( V_i \)$. Linearity and norm closure then give it on $S \( V_i \)$, and the ideals with $V_i subset.double U$ exhaust $S \( U \)$.

Choose bounded representatives $e_(l \, n)$ for the errors. Enumerate every error together with a sequence of positive cut tolerances decreasing to zero. Write a lower request as $q = \( l \, eta \)$, and put

#[#set math.equation(numbering: n => "(4.6)")
 $ A_(q \, n) = \( \| e_(l \, n) \| - eta \)_(+) \, #h(2em) d_tau \( A_(q \, n) \) lt.eq r_q \( n \) d_tau \( c_q \) \, #h(2em) r_q \( n \) > 0 \, quad r_q \( n \) arrow.r 0 . $ <sm:error-controllers>]

Here $c_q$ is a fixed compactly Cuntz-supported positive in $Q \( U_(x_l) \)$, and the inequality holds eventually for every $tau in T \( Q \)$. Enlarging finitely many values of $r_q$ will not matter. A request with zero controller has eventually zero source cut and can be omitted.

We will use the fixed-cut comparison bound from 4. Its elementary form is worth recording. If $A prec.tilde \( B - delta \)_(+)$, choose $v$ with $v^(*) \( B - delta \)_(+) v$ close to $A$, and set

$ w = g_delta \( B \) v \, #h(2em) g_delta \( t \) = sqrt(frac(\( t - delta \)_(+), t)) \, #h(2em) g_delta \( 0 \) = 0 . $

Then

#[#set math.equation(numbering: n => "(4.7)")
 $ w^(*) B w = v^(*) \( B - delta \)_(+) v \, #h(2em) parallel w parallel^2 lt.eq frac(parallel A parallel + parallel v^(*) \( B - delta \)_(+) v - A parallel, delta) . $ <sm:witness-bound>]

Thus coordinate comparisons into a fixed positive cut have bounded witnesses into the uncut target. This conclusion is independent of matrix size.

=== 4.2 Fractions of an existing model <fractions-of-an-existing-model>

#proof[
  Take c.p.c. lifts $chi_n : S arrow.r Q$ of $chi$, using nuclearity and the Choi–Effros lifting theorem #cite(label("ChoiEffrosLifting")) Theorem 3.10. The constant-ideal assertion of 1 gives
  $ "Ideal"_D \( chi \( x_l \) \) = "Ideal"_D \( Q \( U_(x_l) \) \) . $
  Compact support of the controller in (4.6), with an extra cut before passing to coordinates, consequently gives an integer $M_q$ and $d_q > 0$ such that
  #[#set math.equation(numbering: n => "(4.8)")
   $ d_tau \( c_q \) lt.eq M_q d_tau \( \( chi_n \( x_l \) - d_q \)_(+) \) quad upright("eventually, for every ") tau . $ <sm:model-lower>]
  Here is the cut detail. Write $\[ c_q \] lt.eq \[ \( z - gamma \)_(+) \]$, with $z in Q \( U_(x_l) \)_(+)$. The constant $\( z - gamma \/ 2 \)_(+)$ lies in the ideal generated by $chi \( x_l \)$. Its suitable smaller cut is therefore below finitely many copies of a positive cut of $chi \( x_l \)$. Leave a further cut between $\( z - gamma \)_(+)$ and that source before lifting the comparison. The source perturbation lemma then gives (4.8) at every late coordinate. Both its multiplicity and target tolerance depend only on the request, not on the coordinate.
  For an upper test, choose a strictly positive $h_i in Q \( V_i \)$. The constant-ideal assertion gives $chi \( a_i \) in "Ideal"_D \( Q \( V_i \) \) = "Ideal"_D \( h_i \)$. Compact containment between two positive cuts of $chi \( a_i \)$ therefore gives a finite integer $N_i$ and $kappa_i > 0$ with
  $ \[ \( chi \( a_i \) - epsilon_i \/ 2 \)_(+) \] lt.eq N_i \[ \( h_i - kappa_i \)_(+) \] . $
  Let $c_i in Q \( V_i \)_(+)$ be the folded sum of these $N_i$ cuts. It is compactly Cuntz supported in $Q \( V_i \)$. The common-controller lemma then gives $\[ c_i \] lt.eq L_i \[ b_i \]$ for a finite integer $L_i$. Lift a comparison for the less deeply cut source with error smaller than the remaining source slack. The positive perturbation lemma gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ d_tau \( \( chi_n \( a_i \) - epsilon_i \)_(+) \) lt.eq L_i d_tau \( b_i \) quad upright("eventually, for every ") tau . $ <sm:model-upper>]
  Thus both the controller $b_i$ and its multiplicity are fixed before the UHF fractions are selected.
  At stage $j$, choose a positive rational $t_j$ with
  $ t_j lt.eq j^(- 1) \, #h(2em) t_j L_i lt.eq j^(- 1) quad \( i lt.eq j \) . $
  Only after choosing $t_j$, choose an increasing sequence of coordinate thresholds $N_j$ so that all the first $j$ coordinate comparisons hold and
  #[#set math.equation(numbering: n => "(4.10)")
   $ M_q r_q \( n \) lt.eq t_j #h(2em) \( q lt.eq j \, n gt.eq N_j \) . $ <sm:model-delay>]
  For $N_j lt.eq n < N_(j + 1)$, let $p_n$ be a projection of normalized trace $t_j$ in an extra UHF factor and use
  $ theta_n \( a \) = chi_n \( a \) ⊗ p_n . $
  After the fixed trace-preserving identifications these are c.p.c. maps into $Q$. Their multiplicative defects tend to zero because those of $chi_n$ do, so they define a homomorphism $theta : S arrow.r D$. Equation (4.9) gives (4.5) with $s_(i \, n) lt.eq j^(- 1)$ on the $j$-th stage. Moreover,
  #[#set math.equation(numbering: n => "(4.11)")
   $ d_tau \( A_(q \, n) \) & lt.eq r_q \( n \) d_tau \( c_q \)\
 & lt.eq M_q r_q \( n \) d_tau \( \( chi_n \( x_l \) - d_q \)_(+) \) lt.eq d_tau \( \( theta_n \( x_l \) - d_q \)_(+) \) . $ <sm:fraction-lower>]
  All inequalities use extended nonnegative arithmetic; the scalar factors are strictly positive. Pointwise order in $"Cu" \( Q \)$ gives the coordinate comparison. Apply (4.7) to the target $\( theta_n \( x_l \) - d_q \/ 2 \)_(+)$, cut further at $d_q \/ 2$. Bounded witnesses now pass to $D$, proving (4.3) for the enumerated tolerances, and hence for every tolerance.
  It remains to check (4.2). If $y in S \( U_x \)_(+)$, then $chi \( y \) in "Ideal"_D \( chi \( x \) \)$. For every source tolerance, a slightly larger source cut is below finitely many copies of a fixed cut of $chi \( x \)$. Passing to coordinates with slack gives this rank inequality eventually. Tensoring both sides with the same $p_n$ multiplies both ranks by its positive trace, so the inequality remains true. Pointwise coordinate order and (4.7) give $\( theta \( y \) - epsilon \)_(+) in "Ideal"_D \( theta \( x \) \)$. Letting $epsilon arrow.b 0$, then using linearity and closure, proves (4.2). Finally $N t_j lt.eq 1$ eventually for every fixed $N$, so $N$ equal rational subprojections fit in the original UHF unit. They give the stated copies inside the spare model. ◻
]

=== 4.3 Cone blocks with a fixed lower signal <cone-blocks-with-a-fixed-lower-signal>

Without a model to cut down, we must first build finite matrix maps whose values detect each requested controller. The construction has three ingredients: a fixed quotient-norm threshold for the controlling input, finitely many positive support elements with plateaux, and finite-dimensional approximations of the corresponding quotient cones. The plateaux convert a matrix norm lower bound into a Cuntz comparison at the fixed threshold. Stage-dependent matrix sizes will change only the rank multiplicities.

We use the following finite approximation form of cone quasidiagonality: for a separable $C^(*)$-algebra $R_0$, a finite subset of $C_0 \( \( 0 \, 1 \] \) ⊗ R_0$, and a positive tolerance, there is a c.p.c. map to a matrix algebra which is multiplicative to that tolerance and preserves the norms of the specified elements to that tolerance. This is Voiculescu’s cone theorem #cite(label("Voiculescu")); a direct proof in precisely this form is #cite(label("Shulman")) Proposition 33.

The ideal-covering strategy in the finite cone stage is inspired by Bosa, Gabe, Sims, and White; compare #cite(label("BGSW")) Lemma 3.5. Their target is $cal(O)_oo$-stable. The fixed-cut estimates and UHF trace-small controls for the present target are proved here, not imported from that lemma.

#thm([Lemma 7.])[
  (A finite cone stage).  #emph[Let $S = C_0 \( \( 0 \, 1 \] \) ⊗ P$. Fix finitely many upper tests (4.4), finitely many lower requests (4.6), and a finite multiplicativity test set. For each lower request one can fix a number $h_q > 0$, independently of all later stages, such that the following holds. For arbitrarily small multiplicativity error there is a c.p.c. map $Phi : S arrow.r M_k \( Q \)$, with finite constants $L_i$ and integers $M_q gt.eq 1$, satisfying 
#[#set math.equation(numbering: n => "(4.12)")
 $ d_tau \( Phi \( a_i \) \) & lt.eq L_i d_tau \( b_i \) \,\
d_tau \( c_q \) & lt.eq M_q d_tau \( \( Phi \( x_l \) - 4 h_q \)_(+) \) #h(2em) \( q = \( l \, eta \) \) \, $ <sm:stage-bounds>]

 for every $tau in T \( Q \)$, with the unnormalized matrix extension of $tau$.]
] <sm:cone-stage>

#proof[
  We first choose the lower threshold, once for each request. Write
  $ \[ c_q \] lt.eq \[ \( z_q - gamma_q \)_(+) \] \, #h(2em) z_q in Q \( U_(x_l) \)_(+) \, quad gamma_q > 0 . $
  For $z in X$, denote by $\( x_l \)_z$ the image in $C_0 \( \( 0 \, 1 \] \) ⊗ \( P \/ P_z \)$, where $P_z$ is the primitive ideal labeled by $z$. The sets
  $ O_q \( h \) = { z : parallel \( x_l \)_z parallel > 8 h } $
  are open and increase to $U_(x_l)$ as $h arrow.b 0$. Approximation in this increasing union of ideals allows us to choose $h_q > 0$ such that
  #[#set math.equation(numbering: n => "(4.13)")
   $ z'_q = \( z_q - gamma_q \/ 2 \)_(+) in Q \( O_q \( h_q \) \) \, #h(2em) \[ c_q \] lt.double \[ z'_q \] . $ <sm:envelope>]
  Keep $h_q$ fixed from now on.
  For a point $z in O_q \( h_q \)$, choose an open neighborhood
  $ N_z subset.eq O_q \( h_q \) ∩ ⋂_({ i : \( a_i \)_z eq.not 0 }) "supp"_X \( b_i \) . $
  It exists because $\( a_i \)_z eq.not 0$ implies $z in V_i$, and $"supp"_X \( b_i \)$ contains $V_i$. Functional calculus on a positive element of $Q \( N_z \)$ nonzero at $z$ gives positive contractions $h_z \, k_z$ with
  #[#set math.equation(numbering: n => "(4.14)")
   $ h_z k_z = k_z \, #h(2em) \( k_z \)_z eq.not 0 \, #h(2em) h_z upright(" compactly Cuntz-supported in ") Q \( N_z \) . $ <sm:plateau>]
  For example, first take a nonzero positive cut, make $h_z$ equal to one on a smaller spectral region, and support $k_z$ inside that region. The ideal supports of all these $k_z$’s cover $O_q \( h_q \)$. By (4.13), finitely many of them suffice for
  #[#set math.equation(numbering: n => "(4.15)")
   $ \[ c_q \] lt.eq M_q sum_(t = 1)^(ell_q) \[ k_(q t) \] $ <sm:finite-cover>]
  for some integer $M_q$. This uses compact containment in the Cuntz semigroup: the ideal generated by all the $k_z$’s contains $z'_q$, and $\[ c_q \] lt.double \[ z'_q \]$ is captured by a finite sum with finite multiplicity. No compactness of the whole open set $O_q \( h_q \)$ is assumed.
  For each selected center $z$, put $S_z = C_0 \( \( 0 \, 1 \] \) ⊗ \( P \/ P_z \)$, and let $alpha_t$, $0 lt.eq t lt.eq 1$, be cone scaling:
  $ \( alpha_t f \) \( r \) = f \( t r \) \, #h(2em) alpha_0 = 0 . $
  The scaled images of a finite test set form norm-compact families. Choose finite nets in those families and their products. Cone quasidiagonality, followed by contractivity to pass from the nets to the families, gives a c.p.c. map $phi.alt_z : S_z arrow.r M_(d_z)$ with the required uniform multiplicativity error and
  #[#set math.equation(numbering: n => "(4.16)")
   $ parallel phi.alt_z \( \( x_l \)_z \) parallel > 7 h_q . $ <sm:matrix-signal>]
  Define a matrix-valued cone function by
  $ t mapsto phi.alt_z \( alpha_t \( s_z \) \) . $
  It is norm-continuous and zero at $t = 0$. Evaluate its entries at $h_z$. The resulting map $psi_z : S arrow.r M_(d_z) \( Q \)$ is c.p.c.; it has the same multiplicativity bound because the evaluation map is a homomorphism. Its range lies in $M_(d_z) \( "Her" \( h_z \) \)$.
  For the lower estimate, choose a unit vector $v in bb(C)^(d_z)$ which is an eigenvector of the positive matrix $phi.alt_z \( \( x_l \)_z \)$ for an eigenvalue $lambda > 7 h_q$. Equation (4.14) implies that evaluation on $k_z^(1 \/ 2)$ is evaluation at parameter one. Consequently the rectangular column
  $ w = \( lambda - 4 h_q \)^(- 1 \/ 2) thin v ⊗ k_z^(1 \/ 2) $
  satisfies
  #[#set math.equation(numbering: n => "(4.17)")
   $ w^(*) \( psi_z \( x_l \) - 4 h_q \)_(+) w = k_z \, #h(2em) parallel w parallel lt.eq \( 3 h_q \)^(- 1 \/ 2) . $ <sm:plateau-witness>]
  Combining these comparisons with (4.15) gives the second inequality of (4.12) for the direct sum of all the selected blocks.
  For an upper test, a block is zero if $\( a_i \)_z = 0$. Otherwise $h_z$ is compactly Cuntz-supported in an ideal contained in $"Ideal"_Q \( b_i \)$. It is therefore below finitely many copies of $b_i$. Since the block range is supported by $1_(d_z) ⊗ h_z$, its rank is at most $d_z d_tau \( h_z \)$. Summing these finite bounds gives the first inequality of (4.12). The direct sum is contractive, since its norm is the maximum of the block norms. Its internal matrix trace is the sum of the block traces. This proves the lemma. ◻
]

The finite stage now has a lower spectral cut independent of the accuracy. To turn these maps into a locally small homomorphism, we choose their UHF fractions next and delay the coordinates until the prescribed errors are smaller than those fractions.

#proof[
  At stage $j$, apply 7 to the first $j$ upper tests, lower requests, and an increasing dense list of algebra tests, with multiplicativity error at most $j^(- 1)$. Write the resulting map as $Phi_j$, and its constants as $L_(i j)$ and $M_(q j)$. Choose a positive rational $t_j$ satisfying
  #[#set math.equation(numbering: n => "(4.18)")
   $ t_j lt.eq j^(- 1) \, #h(2em) t_j L_(i j) lt.eq j^(- 1) quad \( i lt.eq j \) \, #h(2em) beta_(q j) := t_j \/ M_(q j) > 0 . $ <sm:cone-fraction>]
  After all the stage maps and fractions have been chosen, choose increasing coordinate thresholds $N_j$ with
  #[#set math.equation(numbering: n => "(4.19)")
   $ r_q \( n \) lt.eq beta_(q j) #h(2em) \( q lt.eq j \, n gt.eq N_j \) . $ <sm:cone-delay>]
  On $N_j lt.eq n < N_(j + 1)$, tensor $Phi_j$ with a UHF projection of trace $t_j$, and fold its finite matrices to obtain $theta_n : S arrow.r Q$. These maps are c.p.c. and asymptotically multiplicative. Their quotient is therefore a homomorphism $theta$.
  For a fixed upper test, (4.12) and (4.18) give (4.5) eventually with bound $j^(- 1)$. Thus $theta \( S \( U \) \) subset.eq J \( U \)$. For a lower request $q = \( l \, eta \)$,
  #[#set math.equation(numbering: n => "(4.20)")
   $ d_tau \( A_(q \, n) \) lt.eq r_q \( n \) d_tau \( c_q \) lt.eq d_tau \( \( theta_n \( x_l \) - 4 h_q \)_(+) \) $ <sm:cone-coordinate-comparison>]
  eventually at every coordinate. Pointwise trace order in $"Cu" \( Q \)$ converts this into Cuntz comparison. Put $B_(q \, n) = \( theta_n \( x_l \) - 2 h_q \)_(+)$, choose comparison witnesses with error at most $n^(- 1)$, and apply (4.7) with tolerance $2 h_q$. The resulting witnesses have squared norms at most
  $ frac(sup_n parallel A_(q \, n) parallel + 1, 2 h_q) \, $
  independently of the stage, its centers, and its matrix size. They prove
  $ \[ \( \| e_l \| - eta \)_(+) \] lt.eq \[ \( theta \( x_l \) - 2 h_q \)_(+) \] quad upright("in ") "Cu" \( D \) . $
  This establishes (4.3) and then (4.1). A very small $beta_(q j)$ changes only the delay $N_j$; it never changes the fixed cut $h_q$. All comparisons may be made in the common block sequence algebra before folding. Include the finitely many prescribed error representatives in each stage’s folding tests in 2. The coordinate conjugacies then preserve their original quotient classes, and the norm bounds above are unchanged. This proves the separate-corner assertion. ◻
]

=== 4.4 Coefficient families <coefficient-families>

#thm([Corollary 2.])[
  (Simultaneous coefficient domination).  #emph[Suppose that one of the hypotheses of 3 holds. Let $E_j$ be countably many bounded multilinear maps 
$ E_j : S times Z_(j \, 1) times dots.h.c times Z_(j \, r_j) arrow.r D \, $

 where the parameter spaces are separable normed spaces. Assume that 
$ E_j \( S \( U \) \, Z_(j \, 1) \, dots.h \, Z_(j \, r_j) \) subset.eq J \( U \) quad upright("for every open ") U . $

 Then the stabilizer may also be chosen so that, for every $x in S_(+)$, 
#[#set math.equation(numbering: n => "(4.21)")
 $ E_j \( S \( U_x \) \, Z_(j \, 1) \, dots.h \, Z_(j \, r_j) \) subset.eq "Ideal"_D \( theta \( x \) \) . $ <sm:all-coefficients>]

 The same conclusion holds for norm-continuous separably parametrized families of such maps, with local norm bounds, and for any choice of the localized multilinear input.]
] <sm:coefficient-domination>

#proof[
  Choose a countable family $cal(B) subset.eq S_(+)$ of positive cuts which is an ideal basis: for every $x in S_(+)$, the elements of $cal(B) ∩ "Ideal"_S \( x \)$ generate $"Ideal"_S \( x \)$. Such a family is obtained from a countable norm-dense positive set and rational cuts, using the positive-element perturbation lemma. In particular,
  #[#set math.equation(numbering: n => "(4.22)")
   $ U_x = union.big_(y in cal(B) ∩ "Ideal"_S \( x \)) U_y . $ <sm:projected-cover>]
  For each $y in cal(B)$, prescribe the errors $E_j \( a \, z_1 \, dots.h \, z_(r_j) \)$, where $a$ runs through a countable dense set in $S \( U_y \)$, and the other variables run through countable dense sets in their parameter spaces. These are countably many requests with controlling element $y$, to which 3 applies. Continuity gives the desired containment for every input in $S \( U_y \)$ and every parameter value.
  Now fix $x$. If $y in cal(B) ∩ "Ideal"_S \( x \)$, the homomorphism property gives $theta \( y \) in "Ideal"_D \( theta \( x \) \)$. By (4.22), $S \( U_x \)$ is the closed sum of the ideals $S \( U_y \)$ in that equation. Linearity in the localized input and closedness of the target ideal give (4.21). Dense parameter sets and local norm continuity handle the asserted continuous families. Notice that the argument uses $y in "Ideal"_S \( x \)$, not merely $U_y subset.eq U_x$. Thus it does not presume coarse fullness of the cone stabilizer. ◻
]

#prodef([Remark 2.])[
  Two forms of 2 will be used. If $I$ is a separable error algebra and $d : S arrow.r D$ is bounded linear with $d \( S \( U \) \) I subset.eq J \( U \)$, apply the corollary to $E \( a \, b \) = d \( a \) b$, $b in I$, and, when needed, to the adjoint and opposite-product maps. This gives the full projected-support bounds on the hereditary support generators.
  Alternatively, let $H subset.eq D$ be a given $sigma$-unital hereditary algebra, possibly nonseparable, and let $d : S arrow.r M \( H \)$ be a bounded linear map whose localized coefficients lie in $J \( U \)$. Choose a countable approximate unit $\( u_m \)$ for $H$ and prescribe $u_m d \( a \) u_m$ by the corollary. For $h \, k in H$,
  $ h d \( a \) k = lim_m h u_m d \( a \) u_m k . $
  Thus all multiplier coefficients are controlled. The countability needed here comes from $sigma$-unitality, not from separability of $H$.
] <sm:multiplier-coefficients>

== 5 Norm uniqueness of sequence models <sec:uniqueness>

We prove uniqueness for the models of 1, allowing any of the spaces $Y$ and measures $m$ specified there. The uniqueness argument uses the coarse labels

$ S = S_Y = C_0 \( Y \) ⊗ P \, #h(2em) S \( U \) = C_0 \( Y \) ⊗ P \( U \) \, #h(2em) U subset.eq X upright(" open") . $

The same statements apply if the prescribed measure is multiplied by a strictly positive constant. A coordinate unitary will always mean a unitary in $cal(M) \( Q \)$; convergence of coordinate conjugacies is in norm on each fixed input.

#thm([Theorem 5.1.])[
  (Norm uniqueness).  #emph[Let $p \, q : S_Y arrow.r Q_oo$ be models for the same data. For any c.p.c. lifts $p_n \, q_n : S_Y arrow.r Q$, there are $u_n in cal(U) \( cal(M) \( Q \) \)$ such that 
$ lim_(n arrow.r oo) parallel u_n p_n \( a \) u_n^(*) - q_n \( a \) parallel = 0 \, #h(2em) a in S_Y . $

]
] <un:uniqueness>

There are two steps. Equal trace data first give, after conjugacy and rational averaging, a difference in every local error ideal $J \( U \)$. A small fraction of a common spare model then absorbs that difference in norm. Splitting each original model into two UHF halves supplies the spare: change the first half while keeping the second, and then change the second while keeping the first. The intermediate absorption statements allow a general labeling space, so that the cone correction can use them with its finer ideal labels.

=== 5.1 Compact sets of weights and tracial alignment <compact-sets-of-weights-and-tracial-alignment>

#thm([Lemma 8.])[
  (Controlled trace evaluations).  #emph[Let $C$ be a $C^(*)$-algebra and $b in \( C ⊗ cal(K) \)_(+)$. The set 
$ K_b = { gamma in T \( C \) : d_gamma \( b \) lt.eq 1 } $

 is compact and convex. If $x in \( C ⊗ cal(K) \)_(+)$ satisfies $sup_(gamma in K_b) d_gamma \( x \) lt.eq L < oo$, then $gamma mapsto gamma \( x \)$ is finite, continuous, and affine on $K_b$. The constant $L$ may depend on $x$.]
  #emph[Consequently this applies separately to all the first and square evaluations of a fixed completely positive candidate whose tested values have bounded rank on $K_b$. It also applies to 
$ gamma mapsto gamma #scale(x: 120%, y: 120%)[\(] \| u x_1 u^(*) - x_2 \|^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) u in cal(U) \( C^tilde.op \) \, $

 whenever the positive elements $x_1 \, x_2$ have uniformly bounded ranks there, with a rank bound independent of $u$.]
] <un:trace-cap>

#proof[
  Rank evaluation is lower semicontinuous on the compact trace cone, so $K_b$ is closed. Its convexity follows from additivity and positive homogeneity of rank. For $eta > 0$ the assumed rank bound gives
  #[#set math.equation(numbering: n => "(5.1)")
   $ 0 lt.eq gamma \( x \) - gamma \( \( x - eta \)_(+) \) lt.eq eta L \, #h(2em) gamma in K_b \, $ <un:cut-loss>]
  and $gamma \( x \) lt.eq parallel x parallel L$. If $gamma_i arrow.r gamma$ in $K_b$, the defining cut inequalities for the trace topology imply
  $ gamma \( x \) lt.eq liminf_i gamma_i \( x \) lt.eq limsup_i gamma_i \( x \) lt.eq gamma \( x \) + eta L . $
  Letting $eta arrow.b 0$ proves continuity. Affineness follows from the cone operations; it does not require cancellation in that cone. Squaring a positive element does not change its support rank. Finally, support subadditivity and unitary invariance give
  $ d_gamma #scale(x: 120%, y: 120%)[\(] \| u x_1 u^(*) - x_2 \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq d_gamma \( x_1 \) + d_gamma \( x_2 \) \, $
  which proves the last assertion. ◻
]

#thm([Lemma 9.])[
  (Barycenters on a trace cap).  #emph[Let $K_b$ be as in 8. For every probability measure $mu$ on $K_b$ there is $macron(gamma) in K_b$ such that 
#[#set math.equation(numbering: n => "(5.2)")
 $ v \( macron(gamma) \) = integral_(K_b) v thin d mu $ <un:barycenter-formula>]

 for every finite continuous affine real function $v$ on $K_b$. For a positive measure of finite mass $M > 0$, its integral is instead $M v \( macron(gamma) \)$, with $macron(gamma)$ chosen for $mu \/ M$; zero measures contribute zero. Signed measures may be treated by their two positive parts.]
] <un:barycenter>

#proof[
  Approximate $mu$ weakly by finitely supported probability measures $mu_j = sum_k t_(j k) delta_(gamma_(j k))$, omitting terms of weight zero. Their finite barycenters $beta_j = sum_k t_(j k) gamma_(j k)$ belong to $K_b$. Take a subnet converging in the compact set $K_b$ to $macron(gamma)$. For every $v$ in the statement,
  $ v \( macron(gamma) \) = lim_j v \( beta_j \) = lim_j integral v thin d mu_j = integral v thin d mu . $
  The same subnet works for all these functions. Neither uniqueness of $macron(gamma)$ on discontinuous evaluations nor subtraction of extended weights is asserted or used. ◻
]

#thm([Lemma 10.])[
  (Alignment for finitely many weights).  #emph[Let $C$ be separable, let $S$ be separable and nuclear, and let $p \, q : S arrow.r C$ be homomorphisms with equal pullbacks on $T \( C \)$. For a finite list of pairs $\( s_i \, gamma_i \)$, where $s_i in S_(+)$ and 
$ d_(gamma_i) \( p \( s_i \) \) + d_(gamma_i) \( q \( s_i \) \) < oo \, $

 and any $delta > 0$, there is $u in cal(U) \( M_2 \( C \)^tilde.op \)$ such that 
#[#set math.equation(numbering: n => "(5.3)")
 $ \( gamma_i ⊗ "Tr"_2 \) #scale(x: 120%, y: 120%)[\(] \| u \( p \( s_i \) xor 0 \) u^(*) - \( q \( s_i \) xor 0 \) \|^2 #scale(x: 120%, y: 120%)[\)] < delta quad upright("for every ") i . $ <un:finite-L2>]

 The added matrix direction is internal and has unnormalized trace.]
] <un:finite-traces>

#proof[
  The equality of pullback weights implies equality of all their ranks. By #cite(label("CGNN")) Lemma 5.1, the support projections of $p \( s \)$ and $q \( s \)$ are equivalent in $C^(* *)$ for every $s in S_(+)$. Their images remain equivalent under the normal extension of every representation of $C$.
  The finite-rank assumption puts $p \( s_i \)$ and $q \( s_i \)$ in $"Fin" \( gamma_i \)$. After zero padding, $M_2 \( "Fin" \( gamma_i \) \)$ is invariant under $M_2 \( C \)^tilde.op$-unitaries, so the conjugates and squared differences below remain in that finite ideal. For each selected weight, take its trace representation $pi_i$ on its densely finite ideal after quotienting by its zero ideal, and extend it nondegenerately to $C$. Let $"Tr"_i$ be the resulting normal semifinite trace on $M_i = pi_i \( C \)''$. Form $pi = pi_0 xor pi_1 xor dots.h.c xor pi_r$, with $pi_0$ a faithful representation on a separable Hilbert space, and put $M = pi \( C \)''$. The trace representations can also be chosen separably acting: their densely finite ideals are separable and have countable approximate units of finite-trace cuts. Thus $M$ has separable predual. Restriction to the $i$th reducing Hilbert summand gives a normal surjective homomorphism $q_i : M arrow.r M_i$. Its kernel is $M \( 1 - z_i \)$ for a central projection $z_i$, and $q_i$ identifies $M z_i$ with $M_i$. Define
  $ hat(gamma)_i = "Tr"_i compose q_i . $
  This is the transported normal semifinite trace on $M z_i$, extended by zero on $M \( 1 - z_i \)$. The projections $z_i$ may overlap; the construction is made separately for each weight. On the densely finite ideal of $gamma_i$ one has $hat(gamma)_i pi = gamma_i$, so it computes all designated finite-rank tests and their squares.
  We apply von Neumann uniqueness only after a common zero padding and unitization. Let $S^dagger$ be the forced unitization, and define unital homomorphisms into $M_2 \( M \)$ by
  $ hat(p) \( a + lambda 1 \) = \( pi p \( a \) xor 0 \) + lambda 1_(M_2 \( M \)) \, #h(2em) hat(q) \( a + lambda 1 \) = \( pi q \( a \) xor 0 \) + lambda 1_(M_2 \( M \)) . $
  These maps have equal support ranks on every positive element of $S^dagger$. If its scalar part is zero, this follows from the support equivalences already proved. If the scalar part is positive, then on the properly infinite central part of $M$ both support projections contain the second matrix corner, which is equivalent to the unit of $M_2 \( M \)$ there. On the finite central part, every normal finite trace has equal pullbacks along $pi p$ and $pi q$; this follows by restricting it to $C$ and using the hypothesis. The unital extensions also have equal pullbacks, hence equal ranks by monotone spectral calculus. Normal traces determine equivalence of projections in a finite von Neumann algebra. This proves the claim on both parts.
  The source $S^dagger$ is nuclear. We use the unital form of von Neumann uniqueness in #cite(label("CGNN")) Proposition 2.1, Corollary 3.10, and Section 4. For completeness, the properly infinite factor argument needs only the partial-isometry approximation of #cite(label("CGNN")) Lemma 3.6 and the following unital completion. Including $1$ among the inputs gives partial isometries $v$ whose initial projections $e = v^(*) v$ tend strongly to $1$. For finitely many normal states choose $e_0 lt.eq e$ arbitrarily close to $e$ on those states, with $1 - e_0 tilde.op 1 - v e_0 v^(*) tilde.op 1$: take $e_0 = e$ if $e$ is finite, and otherwise remove an infinite tail decreasing strongly to zero. Complete $v e_0$ to a unitary $u$. Since $\( u - v \) e_0 = 0$, Cauchy–Schwarz gives
  $ \| rho \( u^(*) x u - v^(*) x v \) \| lt.eq 4 parallel x parallel rho \( 1 - e_0 \)^(1 \/ 2) . $
  Thus the partial-isometry conjugacies can be replaced by unitary conjugacies in the weak star topology; #cite(label("CGNN")) Lemma 3.9 makes them strong star. Section 4 then assembles these unital factor conclusions by central decomposition; separability lets one impose the support comparisons on one countable dense set of positive cuts before selecting the factorwise unitaries. We obtain $w_j in M_2 \( M \)$ with
  $ w_j \( pi p \( a \) xor 0 \) w_j^(*) arrow.r pi q \( a \) xor 0 quad upright("strong star") \, #h(2em) a in S . $
  The unital extensions are needed here: support ranks of nonunital maps alone do not compare the complements of their support projections.
  For clarity, the passage to $L^2$ uses more than strong convergence. Put $x_j = w_j \( pi p \( s_i \) xor 0 \) w_j^(*)$ and $x = pi q \( s_i \) xor 0$. Write $T_i = hat(gamma)_i ⊗ "Tr"_2$. Their $T_i$-norms are finite and satisfy
  $ parallel x_j parallel_(2 \, T_i)^2 = gamma_i \( p \( s_i^2 \) \) = gamma_i \( q \( s_i^2 \) \) = parallel x parallel_(2 \, T_i)^2 . $
  For a bounded test $y in L^1 \( T_i \) ∩ L^2 \( T_i \)$ supported on trace-finite projections, its pairing with $x_j - x$ is the normal bounded functional $t mapsto T_i \( y^(*) t \)$ and tends to zero. Such tests are dense in $L^2 \( T_i \)$; the common $L^2$ bound therefore gives weak $L^2$ convergence. Equality of norms now gives $parallel x_j - x parallel_(2 \, T_i) arrow.r 0$.
  Choose one $w_j$ meeting the finite list to sufficiently small tolerance. A bounded self-adjoint logarithm of this unitary can be approximated strong star, within its norm bound, by self-adjoint elements of $M_2 \( pi \( C \) \)^tilde.op$, by Kaplansky density #cite(label("KaplanskyDensity")) Theorem 1. Exponentiation gives unitaries from $M_2 \( C \)^tilde.op$ converging strong star to $w_j$. Their conjugates again have the same designated $L^2$ norms, so the preceding finite-trace-test argument gives $L^2$ convergence for this approximation too. On these conjugates the normal traces compute the original weights, since their finite ideals are invariant under $M_2 \( C \)^tilde.op$-unitaries. This proves (5.3). ◻
]

#thm([Lemma 11.])[
  (Tracial alignment).  #emph[If $p \, q : S arrow.r D$ are models with the same data, then rational diagonal averaging, coordinate multiplier conjugacy, and the foldings of 2 give models $tilde(p) \, tilde(q) : S arrow.r D$ with 
#[#set math.equation(numbering: n => "(5.4)")
 $ \( tilde(p) - tilde(q) \) \( S \( U \) \) subset.eq J \( U \) #h(2em) \( U subset.eq X upright(" open") \) . $ <un:local-difference>]

 Each new model is coordinate approximately unitarily equivalent to its respective original model. The operations may be performed in one changing block while a prescribed spare block is carried along unchanged, apart from its common amplification and folding.]
] <un:alignment>

#proof[
  By 1, choose a separable subalgebra $D_0$ containing the two ranges, the required constant representatives, and the comparison witnesses, so that $p$ and $q$ agree on all traces of $D_0$. Work in a common stabilized corner when needed.
  Choose a countable local positive test family $s_i$, dense in linear span in each of the basis ideals used in 6. Each test is cut-supported in both factors and has compact support in $Y$. Choose an enlarged elementary test $macron(s)_i$ and a fixed $kappa_i > 0$ with $s_i prec.tilde \( macron(s)_i - kappa_i \)_(+)$, using the positive cut in each factor. Hence $p \( s_i \) prec.tilde \( p \( macron(s)_i \) - kappa_i \)_(+)$, and the same holds for $q$. The model-independent upper sandwich, applied to this fixed cut of $macron(s)_i$, supplies a common compact-Cuntz-supported constant; dominating it in the chosen containing open gives $b_i in Q \( U_i \)_(+)$ and a finite constant $L_i$ such that
  #[#set math.equation(numbering: n => "(5.5)")
   $ d_gamma \( p \( s_i \) \) + d_gamma \( q \( s_i \) \) lt.eq L_i d_gamma \( b_i \) \, #h(2em) gamma in T \( D_0 \) \, $ <un:controller-rank>]
  for a finite $L_i$. The constants and the comparisons are included in $D_0$. One can retain $b_i$ whenever later finite lists grow.
  Fix a finite initial list and $delta > 0$. For $u in cal(U) \( M_2 \( D_0 \)^tilde.op \)$, define the nonnegative continuous functions
  $ f_(u \, i) \( gamma \) = \( gamma ⊗ "Tr"_2 \) #scale(x: 120%, y: 120%)[\(] \| u \( p \( s_i \) xor 0 \) u^(*) - \( q \( s_i \) xor 0 \) \|^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) gamma in K_(b_i) . $
  Here $"Tr"_2$ is unnormalized: the common zero padding leaves (5.5) unchanged. Continuity follows from 8. We claim that zero lies in the closed convex hull of the tuples $\( f_(u \, i) \)_i$ in $xor.big_i C \( K_(b_i) \, bb(R) \)$. Otherwise a separating real functional would be bounded below by a positive constant on all these tuples. Represent its components by signed measures. Because $f_(u \, i) gt.eq 0$, replacing each measure by its positive part retains that lower bound. By 9, the resulting functional on these functions is a finite sum of positive multiples of evaluations at individual weights in the corresponding caps. 10 makes all these evaluations simultaneously arbitrarily small, a contradiction.
  It follows that a finite convex combination satisfies
  #[#set math.equation(numbering: n => "(5.6)")
   $ sup_(gamma in K_(b_i)) sum_(k = 1)^r t_k f_(u_k \, i) \( gamma \) < delta #h(2em) upright("for every tested ") i . $ <un:uniform-square>]
  The coefficients may be chosen positive and rational: the finite functions being averaged are bounded, so sufficiently small changes of the coefficients preserve the strict inequality. Write $t_k = m_k \/ l$. Before folding, work in $B_l = M_l \( M_2 \( Q \) \)$ with trace $tau ⊗ "Tr"_2 ⊗ "tr"_l$: only this last, additional averaging direction is normalized. The two averaged maps are diagonal copies of $"Ad" \( u_k \) \( p xor 0 \)$ and of $q xor 0$, with $m_k$ occurrences of the $k$th block. The original algebra $D_0$ has the fixed corner embedding
  $ iota_l : D_0 arrow.r \( B_l \)_oo \, #h(2em) x mapsto \( x xor 0 \) ⊗ 1_l . $
  We record explicitly the resulting coordinate estimate. Lift the finitely many unitaries to unitary multiplier sequences, and use c.p.c. representatives of $p \, q$. Write $z_(i \, n)$ for the difference of their averaged values, after folding into $Q$. For every fixed $t > 0$, we first prove the absolute estimate
  #[#set math.equation(numbering: n => "(5.7)")
   $ d_tau \( \( \| z_(i \, n) \| - t \)_(+) \) lt.eq frac(4 delta, t^2) #h(2em) #scale(x: 120%, y: 120%)[\(] d_tau \( b_i \) lt.eq 1 #scale(x: 120%, y: 120%)[\)] $ <un:cap-coordinate-rank>]
  for every sufficiently large $n$, uniformly over this cap. Suppose that this absolute bound fails arbitrarily late, and choose violating coordinates and weights $tau_n$. The trace identities of 2 pull these weights back, before folding, to $tau_n ⊗ "Tr"_2 ⊗ "tr"_l$. The subsequent multiplier conjugations preserve these identities. Positive cuts commute with the coordinate folding maps, so regularization commutes with them as well. Let $rho_l$ be the regularized trace before folding and put $gamma = rho_l compose iota_l$. It is a trace on the same original $D_0$, and 2 gives
  $ d_gamma \( b_i \) = sup_(eta > 0) lim_omega d_(tau_n) \( \( b_i - eta \)_(+) \) lt.eq 1 . $
  Thus $gamma in K_(b_i)$. Put $e_(k \, i) = u_k \( p \( s_i \) xor 0 \) u_k^(*) - \( q \( s_i \) xor 0 \) in M_2 \( D_0 \)$. If $z_i$ denotes the unfolded diagonal difference, matrix-unit traciality and finite additivity give
  #[#set math.equation(numbering: n => "(5.8)")
   $ rho_l \( z_i^(*) z_i \) = sum_k m_k / l \( gamma ⊗ "Tr"_2 \) \( e_(k \, i)^(*) e_(k \, i) \) < delta . $ <un:averaged-limit>]
  Indeed, restriction to the first internal corner gives $gamma$, so the matrix extension on $M_2 \( D_0 \)$ is $gamma ⊗ "Tr"_2$. For every positive $a in M_2 \( D_0 \)$, $rho_l \( a ⊗ e_(j j) \) = \( gamma ⊗ "Tr"_2 \) \( a \) \/ l$: the $l$ averaging corners are equivalent and sum to $a ⊗ 1_l$. This uses only finite positive sums, so also holds when a value is infinite. It follows that (5.8) is valid without a bounded-weight assumption. On the other hand, functional calculus gives
  $ tau #scale(x: 120%, y: 120%)[\(] \( \| z_(i \, n) \|^2 - t^2 \/ 2 \)_(+) #scale(x: 120%, y: 120%)[\)] gt.eq t^2 / 2 d_tau \( \( \| z_(i \, n) \| - t \)_(+) \) . $
  Regularization and the violations of the absolute estimate therefore give a square trace at least $2 delta$, contrary to (5.8). This proves (5.7). If $0 < d_tau \( b_i \) < oo$, apply that estimate to $tau \/ d_tau \( b_i \)$. If $d_tau \( b_i \) = 0$, apply it to every positive multiple of $tau$, forcing the left side to be zero. For $d_tau \( b_i \) = oo$ the desired proportional bound is automatic. Thus, at the same sufficiently late coordinates,
  #[#set math.equation(numbering: n => "(5.9)")
   $ d_tau \( \( \| z_(i \, n) \| - t \)_(+) \) lt.eq frac(4 delta, t^2) d_tau \( b_i \) #h(2em) upright("for all ") tau in T \( Q \) . $ <un:coordinate-rank>]
  At stage $j$ use the first $j$ local tests, the cut tolerances $1 \, 1 \/ 2 \, dots.h \, 1 \/ j$, and choose $delta_j < 2^(- j) \/ \( 4 j^2 \)$. Then advance far enough in that row for (5.9), the chosen algebraic tests, and their norm bounds all to hold. Pass through the rows slowly as in 6. The averaging matrix size is fixed while each row’s uniform coordinate estimate is proved. For a fixed local test and any fixed cut tolerance, this gives its $J \( U_i \)$ estimate against the fixed $b_i$. Closure and the local density of the tests give (5.4) for all open ideals.
  For completeness, these operations preserve the asserted relation to the original maps. At each coordinate, a diagonal sum of conjugates of a map is conjugate, by the diagonal of the same unitaries, to its tensor-first copy in the averaging matrix factor. The coordinate folding can be chosen, using 2, to carry that copy within the stage tolerance of the original on every current input. The first-corner clause of 2 removes the common internal zero padding at the same time. Make that tolerance tend to zero during the same diagonal choice. Inner conjugacy preserves every coordinate weight, and vanishing norm changes preserve regularized values by cuts, so the models keep their data. The argument applies to a designated block of a direct sum, amplifying the spare by the same averaging factor. Its unused part can always be placed in a separate stable corner before folding. ◻
]

=== 5.2 Ideal-related absorption and compact perturbations <ideal-related-absorption-and-compact-perturbations>

Tracial alignment has placed the difference of two models in each local error ideal. To remove that difference in norm, we will dominate its coefficients by a small stabilizer and apply stable uniqueness on a hereditary support. We first state the absorption and compact perturbation results used in that step.

We specify the version of the ideal-related machinery used below. An $X$-structure on a coefficient algebra $H$ is an order-preserving assignment $U mapsto H \( U \)$ of closed ideals. We do not assume that this assignment preserves intersections. Set

$ E_H = ell^2 \( bb(N) \) ⊗ H \, #h(2em) cal(K) \( E_H \) = H ⊗ cal(K) \, #h(2em) cal(K) \( E_H \) \( U \) = H \( U \) ⊗ cal(K) . $

A representation $phi.alt : S arrow.r cal(L) \( E_H \)$ is weakly equivariant if

#[#set math.equation(numbering: n => "(5.10)")
 $ chevron.l xi \, phi.alt \( a \) eta chevron.r in H \( U \) quad \( a in S \( U \) \, med xi \, eta in E_H \) . $ <un:weak-equivariance>]

Equivalently, $phi.alt \( S \( U \) \) E_H subset.eq E_H H \( U \)$. Every adjointable module operator preserves these submodules. The diagonal coefficient maps $a mapsto chevron.l xi \, phi.alt \( a \) xi chevron.r$ are completely positive. For a nuclear $S$ they and their induced quotient maps are nuclear, since ideals and quotients of a nuclear $C^(*)$-algebra are nuclear #cite(label("ChoiEffrosInjectivity")) Corollary 4; other coefficients follow by polarization. Thus weak equivariance here implies weak $X$-nuclearity, also for homotopies.

#thm([Theorem 5.2.])[
  (Ideal-related absorption).  #emph[Let $S$ be separable, exact, and lower semicontinuous over $X$, and let $H$ be sigma-unital. Suppose $theta : S arrow.r H ⊗ cal(K)$ is a nuclear $X$-full homomorphism, meaning 
$ "Ideal"_(H ⊗ cal(K)) \( theta \( a \) \) = H \( U_a \) ⊗ cal(K) #h(2em) \( a in S_(+) \) . $

 Then its infinite repeat is weakly $X$-nuclear and absorbs every weakly $X$-nuclear representation on the standard module, by unitary equivalences with compact errors tending to zero on each input.]
] <un:absorption>

This is #cite(label("Gabe")) Theorem 11.14, applied to $H ⊗ cal(K)$. Neither separability of $H$ nor an absorption hypothesis on $H$ is required. The repeat is taken on the stabilized module. In particular, if a map $theta_0 : S arrow.r H$ is first placed in the compact corner $theta_0 ⊗ e_11$, its stable repeat retains the other, zero module slots. After a permutation it has the form $"diag" \( theta_0 \, 0 \, theta_0 \, 0 \, dots.h \)$. These zero slots remain available when absorbing a degenerate representation.

For weakly equivariant representations $phi.alt \, psi : S arrow.r cal(L) \( E_H \)$ with compact difference, write $\[ phi.alt \, psi \]_X$ for the class of the graded cycle

#[#set math.equation(numbering: n => "(5.11)")
 $ (E_H xor E_H \, mat(delim: "(", phi.alt, 0; 0, psi) \, mat(delim: "(", 0, 1; 1, 0)) . $ <un:pair-cycle>]

The two summands have opposite gradings. The compact-difference condition supplies the compact commutators in this cycle. This notation refers to the pair, without assigning separate classes to the multiplier-valued maps.

#thm([Proposition 5.])[
  (Multiplier stable uniqueness).  #emph[Suppose $S$ is separable, nuclear, and lower semicontinuous over $X$, $H$ is sigma-unital, and $theta : S arrow.r H ⊗ cal(K)$ is an $X$-full homomorphism. Let $phi.alt \, psi : S arrow.r cal(L) \( E_H \)$ be weakly equivariant representations with compact difference and $\[ phi.alt \, psi \]_X = 0$. Writing $theta^oo$ for an infinite repeat, for every finite $cal(F) subset S$ and $epsilon > 0$ there is a unitary $v in 1 + cal(K) \( E_H xor E_H \)$ such that 
#[#set math.equation(numbering: n => "(5.12)")
 $ parallel v \( phi.alt xor theta^oo \) \( a \) v^(*) - \( psi xor theta^oo \) \( a \) parallel < epsilon \, #h(2em) a in cal(F) . $ <un:proper-uniqueness>]

]
] <un:stable-uniqueness>

#proof[
  The multiplier-pair theorem #cite(label("Gabe")) Theorem 13.9 supplies a weakly $X$-nuclear representation $Theta$ and an identity-plus-compact unitary $u$ comparing $phi.alt xor Theta$ with $psi xor Theta$ to any prescribed finite-test tolerance $delta$. Here the pair class may be read in the nuclear theory, since $S$ is nuclear. Put $sigma = Theta xor theta^oo$. By 5, there is a module unitary $V$ from the repeat module to the module of $sigma$ such that
  $ parallel V^(*) sigma \( a \) V - theta^oo \( a \) parallel < eta \, #h(2em) a in cal(F) . $
  With $W_0 = 1 xor V$, set
  $ v = W_0^(*) \( u xor 1 \) W_0 . $
  It is a unitary, and $v - 1$ is compact because conjugating a compact module operator by a module unitary preserves compactness. The error in (5.12) is at most $delta + 2 eta$. Choose these parameters with $delta + 2 eta < epsilon$. This is the finite-test common-stabilizer transfer underlying #cite(label("DadarlatEilers")) Lemmas 2.4 and 3.4; no initial value of a continuous unitary path is needed here. ◻
]

#thm([Lemma 12.])[
  (The trivially labeled factor).  #emph[For the coarse $X$-structure on $S = C_0 \( Y \) ⊗ P$ and every sigma-unital coefficient $X$-algebra $H$, 
$ "KK" \( X \; S \, H \) = 0 . $

 In particular every weakly equivariant multiplier pair with compact difference has zero class in 5.]
] <un:KK-nullity>

#proof[
  Since $cal(W)$ is simple and nuclear, every ideal of its spatial tensor product with another $C^(*)$-algebra is a tensor-product ideal #cite(label("GuptaJain")) Theorem 3.1. Together with the transported labels of 1, this gives, after reordering the tensor factors, an $X$-algebra $C = C_0 \( Y \) ⊗ A ⊗ cal(K)$ such that
  $ S = cal(W) ⊗ C \, #h(2em) S \( U \) = cal(W) ⊗ C \( U \) . $
  The identity of $cal(W)$ has zero ordinary Kasparov class. Exterior tensoring its stabilized cycle relation and its homotopy with $C$ retains weak equivariance. Explicitly, a typical coefficient of the tensor representation, for $c in C \( U \)$, is a finite sum
  $ sum_(i \, j) chevron.l xi_i \, pi \( w \) xi_j chevron.r ⊗ c_i^(*) c c_j med in med cal(W) ⊗ C \( U \) . $
  The same formula applies throughout the homotopy. It follows that the identity cycle of $S$ is zero for these labels. Taking its cycle product with an $S$–$H$ cycle preserves this stabilized null relation. The identity-product homotopy identifies the same product with the original cycle, so that cycle is zero as well.
  The cycle relation and mixed product statements used here are #cite(label("Gabe")) Propositions 12.17 and 12.20 and Lemmas 12.18, 12.19, and 12.23. They require the first algebra to be separable and the remaining coefficient algebras to be sigma-unital. Thus they apply to this $H$ even when it is nonseparable. Nuclearity of $S$ also makes the cycles and homotopies weakly $X$-nuclear, as needed above. ◻
]

#thm([Lemma 13.])[
  (Hereditary support and local multiplication).  #emph[Let $I subset.eq C$ be a separable $C^(*)$-subalgebra with strictly positive element $e$, and let $k in C_(+)$. Set 
$ H = "Her"_(M_2 \( C \)) \( e xor k \) . $

 Then $H$ is sigma-unital, with no separability assertion required. If $r in C$ idealizes $I$, then $r xor 0$ idealizes $H$. If, in addition, $L$ is an ideal of $M_2 \( C \)$ and 
$ \( r I \) xor 0 subset.eq L \, #h(2em) \( I r \) xor 0 subset.eq L \, $

 then 
#[#set math.equation(numbering: n => "(5.13)")
 $ \( r xor 0 \) H + H \( r xor 0 \) subset.eq H ∩ L . $ <un:support-bound>]

 For $x in H$, one has $H ∩ "Ideal"_(M_2 \( C \)) \( x \) = "Ideal"_H \( x \)$.]
] <un:hereditary-support>

#proof[
  The defining positive element is strictly positive in its hereditary algebra, so $H$ is sigma-unital. Since $r e^(1 \/ 2)$ and $e^(1 \/ 2) r$ belong to $I$, multiplication of $\( e^(1 \/ 2) xor k^(1 \/ 2) \) M_2 \( C \) \( e^(1 \/ 2) xor k^(1 \/ 2) \)$ on either side by $r xor 0$ remains in $H$. These elements are dense in $H$. Under the additional hypothesis, the same products also lie in $L$, proving (5.13). The last identity is the ideal correspondence for a hereditary subalgebra: an approximate unit of $H$ compresses the ambient ideal generated by $x$ to the ideal it generates in $H$. ◻
]

#thm([Lemma 14.])[
  (Finite truncation of a proper conjugacy).  #emph[Let $H$ be sigma-unital and let $p \, q : S arrow.r cal(M) \( H \)$ be representations with difference in $H$. Let $theta : S arrow.r H$ be a homomorphism, compact-valued on the module $H$, and form the diagonal representations 
$ A_0 = p xor theta xor theta xor dots.h.c \, #h(2em) B_0 = q xor theta xor theta xor dots.h.c . $

 Identical zero summands may be inserted in these diagonals. If an identity-plus-compact unitary compares $A_0 \, B_0$ arbitrarily well on finite sets, then, for every finite $cal(F)$ and $epsilon > 0$, finitely many copies suffice: for some $N \, M gt.eq 0$ there is a unitary $v_N$ equal to the identity outside the initial summand, the first $N$ repeat summands, and finitely many zero slots, with 
$ max_(a in cal(F)) parallel v_N \( p xor theta^(xor N) xor 0^(xor M) \) \( a \) v_N^(*) - \( q xor theta^(xor N) xor 0^(xor M) \) \( a \) parallel < epsilon . $

 All resulting errors are compact. If the representations are weakly equivariant, their compact errors on $S \( U \)$ belong to the compacts over $H \( U \)$.]
] <un:finite-truncation>

#proof[
  Choose $u = 1 + k$ with error less than $epsilon \/ 2$, and put $R = max \( 1 \, max_(a in cal(F)) parallel a parallel \)$. If $E_N$ denotes the specified finite-summand projection, choose
  $ parallel k - E_N k E_N parallel < eta \, #h(2em) 0 < eta < min { 1 \/ 4 \, epsilon \/ \( 8 R \) } . $
  The operator $z_N = 1 + E_N k E_N$ is within $eta$ of a unitary, so it is invertible and the spectrum of $\| z_N \|$ is contained in $\[ 1 - eta \, 1 + eta \]$. Its polar unitary satisfies
  $ v_N = z_N \( z_N^(*) z_N \)^(- 1 \/ 2) \, #h(2em) parallel v_N - z_N parallel lt.eq eta \, #h(2em) parallel v_N - u parallel lt.eq 2 eta . $
  It is the identity off $E_N$ and differs from the identity by a finite matrix over $H$. Include successively the identical zero slots as well, if present, so that $E_N arrow.r 1$ strongly. The change in the conjugacy error is at most $4 R eta$. Since the two representations are diagonal and agree on the omitted tail, the remaining estimate is exactly the displayed finite-copy estimate.
  For localization, a compact operator which is weakly equivariant on an input in $S \( U \)$ has all matrix coefficients in $H \( U \)$, hence belongs to $H \( U \) ⊗ cal(K)$. All module unitaries preserve the submodules $E_H H \( U \)$, so conjugation preserves this statement. It applies to the compact differences here. ◻
]

=== 5.3 Removing the locally small difference <removing-the-locally-small-difference>

#thm([Proposition 6.])[
  (Uniqueness with a spare model).  #emph[Let $p \, q : S arrow.r D$ be equal-data models satisfying $\( p - q \) \( S \( U \) \) subset.eq J \( U \)$ for every open $U$. Let $chi$ be a model for a strictly positive multiple of the same data. Then $p xor chi$ and $q xor chi$ are coordinate approximately unitarily equivalent, with the matrix and trace conventions of 2.]
] <un:spare>

#proof[
  Put $C_1 = C^(*) \( p \( S \) \, q \( S \) \)$, and let $I$ be the ideal of $C_1$ generated by the differences $p \( a \) - q \( a \)$. This is a separable ideal. For each open $U$,
  #[#set math.equation(numbering: n => "(5.14)")
   $ p \( S \( U \) \) I + q \( S \( U \) \) I + I p \( S \( U \) \) + I q \( S \( U \) \) subset.eq J \( U \) . $ <un:difference-ideal>]
  Indeed, modulo $J \( U \)$, the two maps agree on $S \( U \)$. Their common image is an ideal in the algebra generated by both images, because multiplication from either side by $p \( a \)$ or $q \( a \)$ corresponds to multiplication inside the source ideal. It annihilates each difference: for $s in S \( U \)$,
  $ p \( s \) \( p \( a \) - q \( a \) \) = p \( s a \) - q \( s a \) = 0 med \( mod med J \( U \) \) \, $
  and the other side is identical. It therefore annihilates the ideal generated by the differences, proving (5.14).
  Use the existing-model version of 3, with the spare $chi$, to obtain a locally small homomorphism $theta$. Impose the coefficient dominations
  #[#set math.equation(numbering: n => "(5.15)")
   $ p \( S \( U_x \) \) I + q \( S \( U_x \) \) I + I p \( S \( U_x \) \) + I q \( S \( U_x \) \) subset.eq "Ideal" \( theta \( x \) \) \, #h(2em) x in S_(+) . $ <un:theta-domination>]
  Apply 2 to the four bounded bilinear maps $\( a \, b \) mapsto p \( a \) b$, $q \( a \) b$, $b p \( a \)$, and $b q \( a \)$, with $b in I$. Equation (5.14) gives their local hypotheses, and that corollary supplies the displayed inclusion for every positive $x$. The first version also ensures
  #[#set math.equation(numbering: n => "(5.16)")
   $ theta \( S \( U_x \) \) subset.eq "Ideal" \( theta \( x \) \) . $ <un:theta-range-fullness>]
  Moreover $theta$ is represented by the same coordinate maps as $chi$, tensored with rational UHF projections of trace tending to zero.
  Choose strictly positive elements $e in I$ and $k in theta \( S \)$, and form
  $ H = "Her"_(M_2 \( D \)) \( e xor k \) . $
  The maps $p \, q$, placed in the first corner and zero in the second, idealize $H$, by 13. View them as representations on the module $H$, and then stabilize that module. Equip $H$ with the order-preserving ideals
  #[#set math.equation(numbering: n => "(5.17)")
   $ H \( U \) = "Ideal"_H \( 0 xor theta \( S \( U \) \) \) . $ <un:H-action>]
  No intersection property of this assignment is needed. From (5.15), 13, and its ideal-intersection identity, values of the first-corner maps on $S \( U_x \)$ multiply $H$ into $"Ideal"_H \( 0 xor theta \( x \) \)$. Thus $p \, q$ are weakly equivariant for (5.17). By (5.16), $0 xor theta \( x \)$ generates $H \( U_x \)$, so this compact-valued map is $X$-full. The algebra $H$ is sigma-unital; it is not required to be separable.
  The multiplier pair agrees modulo $H$, since its differences belong to $I xor 0 subset.eq H$. Pad the module $H$ by zero copies to the standard module; the resulting pair class (5.11) is zero by 12. The coarse source action is lower semicontinuous, since the projection $Y times X arrow.r X$ is open. For 5, place $0 xor theta$ in the first compact corner of the standard module. Its infinite repeat is, after reindexing, the diagonal of copies of $theta$ on $H$ with identical zero slots. Thus 14 applies on the original $H$ summands, yielding finite matrices over $H$, rather than retaining an additional untruncated compact direction inside each slot. For any finite $cal(F)$ and $epsilon > 0$ this gives a finite $N$ and an identity-plus-finite-matrix unitary comparing
  #[#set math.equation(numbering: n => "(5.18)")
   $ p xor theta^(xor N) quad upright("and") quad q xor theta^(xor N) $ <un:finite-spare-comparison>]
  within $epsilon$, with zero slots permitted.
  These estimates hold for the actual ambient elements, as follows. If $v = 1 + c$ is the obtained finite unitary and $A \, B$ denote the two finite diagonal maps, then
  #[#set math.equation(numbering: n => "(5.19)")
   $ v A \( a \) v^(*) - B \( a \) = \( A \( a \) - B \( a \) \) + c A \( a \) + A \( a \) c^(*) + c A \( a \) c^(*) . $ <un:ambient-error>]
  Every term belongs to a finite matrix over $H$, because the maps idealize $H$ and their difference belongs to it. The multiplier norm of this element is its intrinsic $H$-norm and hence its ambient norm in the matrix algebra over $D$. This argument does not assume that restriction of the entire ambient idealizer to $cal(M) \( H \)$ is faithful. Only its isometric restriction to $H$ is used.
  There is also no lifting obstruction for the finite unitary. Write it as $1 + c$ in the unitization of a finite matrix algebra over $D$, and choose bounded representatives $c_n$ over $Q$. The two unitary defects of $1 + c_n$ tend to zero. For all sufficiently large $n$ its polar part
  $ v_n = \( 1 + c_n \) #scale(x: 120%, y: 120%)[\(] \( 1 + c_n \)^(*) \( 1 + c_n \) #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) $
  is a unitary in the corresponding matrix multiplier algebra and differs from $1 + c_n$ by a sequence tending to zero. Thus a strict quotient estimate, first obtained with a smaller tolerance, holds at every sufficiently late coordinate.
  Finally fix this $N$ before advancing the coordinates. Since the UHF trace of the projection defining $theta_n$ tends to zero, $N$ disjoint equivalent copies fit inside the positive spare fraction eventually. Using exactly the same $chi_n$ in those copies identifies them with (5.18). Move the unused spare to a separate stable corner and leave it unchanged. Consequently the finite conjugacy need not preserve an internal complement of its original matrix slots. Apply the coordinate folding and the multiplier permutations from 2, on all current inputs and all these blocks. This proves eventual finite-test conjugacy of $p xor chi$ and $q xor chi$. On increasing finite sets with tolerances tending to zero, choose each coordinate beyond the corresponding threshold. The resulting single sequence of multiplier unitaries proves the proposition. ◻
]

#proof[
  Split the tensor-first copy of each map along two equivalent UHF projections of trace $1 \/ 2$. Denote its two halves by $p_0 \, p_1$ and $q_0 \, q_1$. Both halves have the original model data multiplied by $1 \/ 2$, and their sums are coordinate approximately unitarily equivalent to the original maps by 2.
  First compare $p_0 xor p_1$ with $q_0 xor p_1$, retaining $p_1$ as a common spare. Apply 11 in the changing block to put its difference in every appropriate $J \( U \)$, carrying the spare through the same diagonal amplifications. Then 6 gives the required conjugacy. The coordinate conjugacies relating the aligned blocks to the originals may be undone, with their vanishing errors, so the conclusion applies to the displayed original half-sums. Next compare $q_0 xor p_1$ with $q_0 xor q_1$, using $q_0$ as the common spare and interchanging the two matrix positions. The same argument applies. Composing the two coordinate conjugacies and the folding adjustments proves the assertion on every finite test set and tolerance. A diagonal choice on a dense increasing family gives the stated sequence $u_n$.
  Finally, any two c.p.c. lifts of a fixed model differ in norm by a sequence tending to zero on each input. The conclusion therefore holds for the lifts specified in the statement. ◻
]

== 6 Tracial approximation on a cone <tc:section>

Throughout this section, $Y = \( 0 \, 1 \]$, $m$ is a finite Borel measure of full support on $Y$, and $S = C_0 \( Y \) ⊗ P$. We retain the invariant maps $F : T \( Q \) arrow.r T \( P \)$ and $G : "Cu" \( P \) arrow.r "Cu" \( Q \)$, so that

#[#set math.equation(numbering: n => "(6.1)")
 $ d_tau \( G \[ a \] \) = d_(F \( tau \)) \( a \) . $ <tc:transport>]

We seek a completely positive map that is multiplicative modulo the local error ideals. It must carry two kinds of information. Its square moments will identify the prescribed trace wherever that trace is densely finite. The ideal generated by its image of a nonzero elementary tensor must also contain the corresponding constant ideal. This second condition will prevent the corrected map from turning an infinite part of a weight into a finite one.

Matrix traces are unnormalized. The rational averages used below have a separate, normalized UHF tensor factor; 2 identifies their ranges with $Q$ with precisely this trace convention.

Choose a countable family $cal(E)$ of positive elementary tensors $s = f ⊗ a$ as follows. In each ideal in the countable basis, and in each finite union of those ideals, take the positive rational cuts of a norm-dense set of positives. Retain slightly larger positive pre-cuts in the same ideal. Do the same for positive functions in $C_0 \( Y \)$, and include the powers and further cuts of the factors that occur below. Thus the local linear spans of $cal(E)$ are dense, and its rectangle supports exhaust the open subsets of $Y times X$. All elementary tests used in this section may be included in this one countable family.

For a test $s_i = f_i ⊗ a_i$ supported over an open set $U_i$, choose, once and for all, a positive controller $b_i in Q \( U_i \)$ of compact Cuntz support such that

#[#set math.equation(numbering: n => "(6.2)")
 $ G \[ a_i \] lt.eq \[ b_i \] . $ <tc:controller>]

The larger pre-cuts allow this choice inside $Q \( U_i \)$, with room for a further compactly supported upper controller there. When needed, the same test is listed with different containing basis opens. This ensures that the controllers required for a local assertion lie in that open, as in 6.

#thm([Theorem 6.1.])[
  #emph[There is a completely positive contraction $h : S arrow.r D = Q_oo$ with the following properties.]
  #emph[For every open $U subset.eq X$, $s in S \( U \)$, and $z in S$, 
#[#set math.equation(numbering: n => "(6.3)")
 $ h \( s z \) - h \( s \) h \( z \) \, quad h \( z s \) - h \( z \) h \( s \) med in J \( U \) . $ <tc:mixed>]

 If $s = f ⊗ a in cal(E)$ is controlled inside $U$, and $rho$ is a regularized limit trace whose restriction $sigma = rho \|_Q$ is densely finite on $Q \( U \)$, then 
#[#set math.equation(numbering: n => "(6.4)")
 $ rho \( h \( s \)^2 \) = (integral_Y f^2 thin d m) F \( sigma \) \( a^2 \) . $ <tc:square>]

 Finally, for every $f ⊗ a in cal(E)$ with $f eq.not 0$, 
#[#set math.equation(numbering: n => "(6.5)")
 $ Q \( U_a \) subset.eq "Ideal"_D #scale(x: 120%, y: 120%)[\(] h \( f ⊗ a \) #scale(x: 120%, y: 120%)[\)] . $ <tc:lower-ideal>]

 The test family may be enlarged in advance by any countable family of the controlled elementary tests just described.]
] <tc:rough-model>

For a finite-stage completely positive contraction $H : S arrow.r M_k \( Q \)$, we keep three trace coordinates for each positive input $s$: the trace values of $H \( s \)$, $H \( s^2 \)$, and $H \( s \)^2$. Matching the last two makes the positive Schwarz defect small in trace. The first bounds the square mass that could otherwise disappear when a coordinate trace is regularized.

Trace approximation alone does not give the lower ideal inclusion. For that we also approximate positive expressions $y v^(*) g \( H \( s \) \) v y$ by $y^2$, where $y$ is a positive constant from the prescribed ideal of $Q$, $v in M_(k \, 1) \( Q \)$ is a contraction, and the continuous function $g : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ vanishes below a fixed positive cutoff. Their norm approximation will force a lower rank bound even at weights for which the controller has infinite rank. We first realize these finite data in von Neumann algebras, then approximate them in $Q$ and average. A final diagonal choice retains the fixed controllers and cutoffs.

=== 6.1 Realization in von Neumann algebras <realization-in-von-neumann-algebras>

We first record explicitly the trace-preserving embedding needed for extended weights. The embedding is not required to be unital. We write $R$ for the hyperfinite factor of type $upright("II")_1$ and $R_oo = R thin overline(⊗) thin B \( ell^2 \)$ for the hyperfinite factor of type $upright("II")_oo$. Their uniqueness is part of Connes’s classification #cite(label("Connes")); see also the distinct contemporary report #cite(label("ConnesReport")) Theorems 4.2.1 and 4.3.1.

#thm([Lemma 15.])[
  (Trace-preserving semifinite embedding).  #emph[Let $N$ be a hyperfinite von Neumann algebra with separable predual and a faithful normal semifinite trace $T$. There is a normal injective homomorphism from $N$ into the hyperfinite factor $R_oo$ of type $upright("II")_oo$ preserving $T$. Consequently, such an embedding exists into any prescribed infinite corner of a separably acting factor of type $upright("II")_oo$.]
] <tc:semifinite-embedding>

#proof[
  The central decomposition of a semifinite hyperfinite algebra gives a countable direct sum of algebras
  $ L^oo \( X_j \, mu_j^0 \) thin overline(⊗) thin N_j \, #h(2em) N_j in { M_n \, med B \( ell^2 \) \, med R \, med R_oo } . $
  Here the measure spaces are standard and the factor traces are the usual matrix trace or the standard finite or semifinite trace. This is the semifinite form of the hyperfinite central decomposition; see #cite(label("HRS")) Section 6, p. 49, after (6.48) and (6.50). Relative to these traces and a finite measure $mu_j^0$ in the measure class, $T$ has a central Radon–Nikodym density $h_j$. Faithfulness and semifiniteness give $0 < h_j < oo$ almost everywhere. Replacing $mu_j^0$ by $mu_j = h_j mu_j^0$ absorbs the density and leaves a standard $sigma$-finite measure space.
  There is a normal, trace-preserving injection
  $ L^oo \( X_j \, mu_j \) arrow.r L^oo \( \[ 0 \, oo \) \, d t \) . $
  Indeed, partition $X_j$ into countably many pieces of finite measure. On each piece assign an interval of the appropriate length to each atom; the remaining diffuse part is isomorphic, modulo null sets, to the remaining interval. Pullback by the resulting measure-preserving map, extended by zero outside the union of the intervals, gives the injection. Moreover, $L^oo \( \[ 0 \, oo \) \)$ embeds trace-preservingly as $L^oo \( \[ 0 \, 1 \] \) overline(⊗) ell^oo$ in $R overline(⊗ B) \( ell^2 \) = R_oo$.
  Each standard factor $N_j$ embeds trace-preservingly in $R_oo$: use $1_R ⊗ M_n$, $1_R ⊗ B \( ell^2 \)$, $R ⊗ e_11$, or the identity map, respectively. Tensor these embeddings with the preceding abelian embeddings and use the trace-preserving isomorphism $R_oo overline(⊗ R)_oo tilde.equiv R_oo$. The countably many summands can be placed in the diagonal corners of $R_oo overline(⊗ B) \( ell^2 \)$. The orthogonal strong sum is normal, injective, and trace preserving.
  Finally, in an infinite corner of an arbitrary factor of type $upright("II")_oo$, take a projection of trace one, nested unital matrix algebras $M_(2^n)$ in its finite corner, and their weak closure. They give a trace-preserving copy of $R$. Matrix amplification in the infinite corner gives $R_oo$. Composition completes the proof. ◻
]

#thm([Lemma 16.])[
  (Realization in a factor).  #emph[Let $pi : Q arrow.r M$ be a nondegenerate representation with weakly dense range in a separably acting factor. There is a homomorphism $l : S arrow.r M$ with the following rank data. If $M$ is semifinite with faithful dimension trace $T$, then 
#[#set math.equation(numbering: n => "(6.6)")
 $ d_T \( l \( f ⊗ a \) \) = m \( { f > 0 } \) d_(F \( T compose pi \)) \( a \) #h(2em) \( f \, a gt.eq 0 \) . $ <tc:factor-rank>]

 In a type III factor the corresponding support projection is nonzero exactly when the transported ideal data prescribe a nonzero support.]
] <tc:factor-realization>

#proof[
  Stability of $Q$ supplies multiplier isometries whose normal images show that $M$ is properly infinite. Since $M$ is separably acting, the usual scalar trace-dimension comparison applies in its semifinite factor cases; in its type III case all nonzero projections are equivalent #cite(label("Blackadar")) III.1.7.9–10 and III.1.3.7. Suppose first that $M$ is of type I. The rank function $d_(T compose pi)$ on $"Cu" \( Q \)$ takes only the values $0$ and $oo$. Otherwise real scalar divisibility of $"Cu" \( Q \)$, applied to a class of finite nonzero integer rank, would give a class of noninteger rank in a type I factor. Thus the right side of (6.6) also takes only these two values. Its zero ideal on $P$ is the ideal transported from $ker pi$. A faithful separable representation of the corresponding quotient of $S$, repeated with infinite multiplicity and embedded in $M$, realizes the required ranks. For type III the same construction realizes the zero ideal; all nonzero support projections are equivalent. The assertion is also immediate when the prescribed quotient is zero.
  Suppose now that $M$ has type $upright("II")_oo$, and put
  $ nu = m ⊗ F \( T compose pi \) \, #h(2em) I = "Fin" \( nu \) \, #h(2em) K = "Ker" \( nu \) . $
  Here $"Fin" \( nu \)$ is the closed ideal on which $nu$ is densely finite, and $K subset.eq I$ is its zero ideal. The trace representation of $I \/ K$ has weak closure $N$ carrying the faithful normal semifinite trace induced by $nu$. Nuclearity of $I \/ K$ makes $N$ hyperfinite #cite(label("Connes")); the nuclear-representation consequence is also stated in #cite(label("ConnesReport")) Theorem 4.1 and the following paragraph. The algebra $N$ has separable predual. Its nondegenerate representation extends from $I$ to $S$ by the action of $S$ on the ideal $I$. 15 embeds this representation trace-preservingly in one infinite corner of $M$.
  In an orthogonal infinite corner, choose a copy of $B \( ell^2 \)$ whose minimal projections have a fixed positive finite trace. In this copy place an infinite multiple of a faithful separable representation of $S \/ I$. On $I$ this second summand is zero. If $x in S_(+)$ does not belong to $I$, its second image has infinite trace and infinite support rank. This is exactly what is required, since $nu \( x \) = oo$ off $I$. On $I$, the first summand gives $nu$ and all its ranks, including infinite values. The combined homomorphism therefore satisfies $T compose l = nu$, has zero ideal $K$, and proves (6.6). If $I = 0$ or $I = S$, simply omit the empty summand. ◻
]

Factorwise existence is enough only if the maps can be assembled measurably. We encode their rank requirements by partial isometries between support projections. These witnesses assemble along with the maps, and later allow each selected normal trace to evaluate the required ranks directly.

#thm([Lemma 17.])[
  (Measurable realization).  #emph[Let $pi$ be a nondegenerate separably acting representation of $Q$, and put $M = pi \( Q \)''$. There is a homomorphism $l : S arrow.r M$ whose factorwise ranks are those in 16, on any prescribed countable elementary cut-test family. In particular, it may be chosen on the entire family $cal(E)$ and its required cuts.]
] <tc:measurable-realization>

#proof[
  Use the standard central decomposition of $M$, modulo null sets, into separably acting factors $M_x$ #cite(label("Blackadar")) III.5.1.14–15. We explain the measurable selection in a form that does not choose a normalization of the factor traces. For each elementary test $s_j = f_j ⊗ a_j$ fix $c_j in Q_(+)$ with
  #[#set math.equation(numbering: n => "(6.7)")
   $ \[ c_j \] = m \( { f_j > 0 } \) G \[ a_j \] . $ <tc:transported-representative>]
  Realification and stability provide these representatives. Code a contractive homomorphism on a countable dense rational $*$-algebra in $S$ by its values in the strong-$*$ bounded balls of the factor field. Include norm-convergent approximations to the chosen positive tests. Multiplication on bounded balls, adjoints, norm bounds, and membership in the measurable algebra field give countably many Borel conditions. Membership may be checked against the strong-$*$ dense measurable sections of the field. Adjoin contraction coordinates $w_j in M_x$ subject to
  #[#set math.equation(numbering: n => "(6.8)")
   $ w_j^(*) w_j = "supp" \( l_x \( s_j \) \) \, #h(2em) w_j w_j^(*) = "supp" \( pi_x \( c_j \) \) . $ <tc:selection-witness>]
  The support map is the strong limit of $t mapsto t \( t + 1 \/ n \)^(- 1)$, so these are again Borel conditions.
  Thus the augmented admissible-code relation is Borel in a countable product of standard measurable bounded operator fields. Its sections are nonempty by 16: equal factor dimensions give the partial isometries in (6.8). Apply Jankov–von Neumann measurable uniformization to this augmented analytic relation, retaining both the homomorphism coordinates and all the contraction witnesses $w_j$. The selector is measurable for the completed central measure. Replace its countably many coordinates by measurable representatives and discard one common null set on which any selected algebraic equation or support identity fails. This is precisely the measured-field setting, as distinguished from an everywhere Borel field in #cite(label("VaesWouters")) Section 8, especially Lemma 8.6(1), and the proof of Proposition 3.2. The uniform operator bounds make the selected values, including the $w_j$, decomposable operators. Their countably many algebraic relations define a homomorphism $l : S arrow.r M$, and the assembled witnesses establish (6.8) in $M$. Every elementary cut test needed below is included in the code, so its prescribed rank data hold in this field. ◻
]

Here is the finite-trace consequence of this construction that we will use. It specifies the normal trace associated to each selected weight and the finite constants through which the rank data are evaluated.

#thm([Lemma 18.])[
  (Realization for finitely many weights).  #emph[Fix finitely many controlled tests $s_i = f_i ⊗ a_i$ and finitely many traces $tau$ for each $i$, each satisfying $d_tau \( b_i \) < oo$. Take a separably acting representation $pi$ containing the induced trace representations of their densely finite ideals, as well as any prescribed finite family of representations for bounded functionals on $Q$. The homomorphism $l$ in 17 may be chosen so that, for the induced normal trace $tilde(tau)$ on $M = pi \( Q \)''$, 
#[#set math.equation(numbering: n => "(6.9)")
 $ tilde(tau) \( l \( s_i^k \) \) = (integral f_i^k thin d m) F \( tau \) \( a_i^k \) \, #h(2em) k = 1 \, 2 . $ <tc:finite-values>]

 This assertion requires no commutation of $F$ with a direct integral of extended weights.]
] <tc:finite-trace-realization>

#proof[
  Fix one selected $tau$ and put $I = "Fin" \( tau \)$. Its trace representation $pi_tau$ on $I \/ "Ker" \( tau \)$ has weak closure $N_tau$ with faithful normal semifinite trace $T_tau$. The nondegenerate extension of $pi_tau$ to $Q$ still has image in $N_tau$: for an approximate unit $\( u_lambda \)$ of $I$, the operators $pi_tau \( q \) pi_tau \( u_lambda \) in pi_tau \( I \)$ converge strongly to $pi_tau \( q \)$. Hence $pi_tau \( Q \)'' = N_tau$.
  The projection onto this representation summand commutes with $M = pi \( Q \)''$. Restriction to that summand is therefore a normal surjective homomorphism $theta_tau : M arrow.r N_tau$. Its kernel has the form $\( 1 - z_tau \) M$ for a central projection $z_tau$, and its restriction to $z_tau M$ is a normal isomorphism. Define
  $ tilde(tau) = T_tau compose theta_tau . $
  This is a normal semifinite trace, zero on $\( 1 - z_tau \) M$, and it agrees with $tau$ on $pi \( I \)_(+)$. Normality also gives $d_(tilde(tau)) \( pi \( c \) \) = d_tau \( c \)$ for $c in I_(+)$. The projections $z_tau$ for different selected weights may overlap: each trace is defined through its own normal quotient, with no disjointness or additional contribution from other representation summands. The construction includes the zero trace representation. Agreement with $tau$ outside $I$ is neither asserted nor needed.
  Include the rectangle tests $\( f_i - r \)_(+) ⊗ \( a_i - t \)_(+)$ for rational $r \, t gt.eq 0$, and choose $c_(r \, t) in Q_(+)$ with
  $ \[ c_(r \, t) \] = m \( { f_i > r } \) G \[ \( a_i - t \)_(+) \] . $
  Their ranks are at most $m \( Y \) d_tau \( b_i \) < oo$, so $c_(r \, t) in I$. Retaining the selected witness coordinates in (6.8) gives, in $M$, equivalence of the support of $l \( \( f_i - r \)_(+) ⊗ \( a_i - t \)_(+) \)$ with $"supp" \( pi \( c_(r \, t) \) \)$. Applying $tilde(tau)$ directly to these equivalent projections gives
  $ tilde(tau) #scale(x: 120%, y: 120%)[\(] "supp" l \( \( f_i - r \)_(+) ⊗ \( a_i - t \)_(+) \) #scale(x: 120%, y: 120%)[\)] = m \( { f_i > r } \) d_(F \( tau \)) \( \( a_i - t \)_(+) \) . $
  In particular, $"supp" \( l \( s_i \) \)$ has finite $tilde(tau)$-trace.
  In the support corner of $l$, the multiplier images of $f_i ⊗ 1$ and $1 ⊗ a_i$ commute, and their product is $l \( s_i \)$. The last display specifies their finite joint spectral measure on every upper rectangle in the positive quadrant. It is the product of the spectral measure of $f_i$ under $m$ and that of $a_i$ under $F \( tau \)$. Increasing positive step approximations to the product function $\( u \, v \) mapsto u^k v^k$, using rational spectral partitions away from zero, therefore give (6.9) by normal monotone convergence, for $k = 1 \, 2$. All rank identities used here were evaluated on constants in $"Fin" \( tau \)$. ◻
]

=== 6.2 Simultaneous finite approximation <simultaneous-finite-approximation>

The von Neumann algebra realizations attain the prescribed trace and support data. We now approximate finitely many of those data inside $Q$. The approximations must retain a finite rank bound over an entire trace cap, since pointwise trace approximation would not control the local error ideals after diagonalization.

Fix finitely many tests $s_i = f_i ⊗ a_i$, indexed by $1 lt.eq i lt.eq n$, with their fixed controllers. Set

#[#set math.equation(numbering: n => "(6.10)")
 $ K_i = { tau in T \( Q \) : d_tau \( b_i \) lt.eq 1 } \, #h(2em) t_i^(\( k \)) \( tau \) = (integral f_i^k thin d m) F \( tau \) \( a_i^k \) . $ <tc:caps-targets>]

By 8, $K_i$ is compact and convex. The functions $t_i^(\( k \))$ are finite continuous affine functions on $K_i$.

We impose finitely many lower comparisons, whose indices $j$ refer to some of the same tests. Choose $delta_j > 0$ and $r_j > 0$ with

#[#set math.equation(numbering: n => "(6.11)")
 $ r_j < m \( { f_j > delta_j } \) \, #h(2em) \[ y_j \] = r_j G \[ \( a_j - delta_j \)_(+) \] \, #h(2em) y_j in Q_(+) . $ <tc:lower-data>]

Rescale representatives so that $parallel y_j parallel lt.eq 1$. Choose a continuous function $g_j : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ and constants

#[#set math.equation(numbering: n => "(6.12)")
 $ 0 < eta_j < theta_j < delta_j^2 \, #h(2em) g_j \|_(\[ 0 \, eta_j \]) = 0 \, #h(2em) g_j \|_(\[ theta_j \, oo \)) = 1 . $ <tc:fixed-slack>]

These constants are fixed before any finite approximation or averaging.

A candidate consists of a completely positive contraction $H : S arrow.r M_k \( Q \)$ and contractions $v_j in M_(k \, 1) \( Q \)$, with the following whole-cap support condition: for each $i$ there is a finite constant $C_(H \, i)$ such that, for every $tau in T \( Q \)$,

#[#set math.equation(numbering: n => "(6.13)")
 $ d_(tau ⊗ "Tr") \( H \( s_i \) \) & lt.eq C_(H \, i) d_tau \( b_i \) \,\
d_(tau ⊗ "Tr") \( H \( s_i^2 \) \) & lt.eq C_(H \, i) d_tau \( b_i \) . $ <tc:candidate-rank>]

The constants may depend on the candidate. Its vector in the real locally convex space

$ product_(i = 1)^n C \( K_i \, bb(R) \)^3 med times med product_j Q_(upright("sa")) $

is

#[#set math.equation(numbering: n => "(6.14)")
 $ (\( tau \( H \( s_i \) \) \, tau \( H \( s_i^2 \) \) \, tau \( H \( s_i \)^2 \) \)_i \; \( y_j v_j^(*) g_j \( H \( s_j \) \) v_j y_j \)_j) . $ <tc:candidate-vector>]

Here and below $tau$ on matrices means $tau ⊗ "Tr"$. The support bounds and 8 make all three trace coordinates continuous. No bound uniform over all candidates is needed for this assertion.

#thm([Proposition 7.])[
  (Simultaneous finite approximation).  #emph[The target vector 
#[#set math.equation(numbering: n => "(6.15)")
 $ #scale(x: 120%, y: 120%)[\(] \( t_i^(\( 1 \)) \, t_i^(\( 2 \)) \, t_i^(\( 2 \)) \)_i \; \( y_j^2 \)_j #scale(x: 120%, y: 120%)[\)] $ <tc:target-vector>]

 belongs to the closed convex hull of the candidate vectors.]
] <tc:finite-convexity>

#proof[
  #emph[Reduce a separator to finitely many weights.] Suppose a continuous real linear functional strictly separates the target from this convex hull. On each $C \( K_i \, bb(R) \)$ coordinate it is integration against a finite signed measure. Split each measure into its positive and negative parts. By 9, each nonzero part has a barycenter in $K_i$ reproducing every finite continuous affine evaluation used here; its mass is an ordinary scalar coefficient. This holds simultaneously for the candidate evaluations and the target evaluations, including candidates with different support constants. Thus the separating functional involves only finitely many selected traces. On the algebra coordinates it involves finitely many bounded selfadjoint functionals.
  #emph[Realize the selected values exactly.] Choose a faithful separably acting representation $pi$ of $Q$ containing representations for these bounded functionals and the induced representations of the densely finite ideals of the selected traces. Write $M = pi \( Q \)''$ and identify $Q$ with its image. Lemma 17, Lemma 18 give a homomorphism $l : S arrow.r M$ attaining the selected trace values. We next attain the lower norm coordinates in $M$.
  Let $q_j$ be the support projection of $l \( \( f_j - delta_j \)_(+) ⊗ \( a_j - delta_j \)_(+) \)$. Functional calculus in the two commuting factors gives
  $ q_j lt.eq 1_(\( delta_j^2 \, oo \)) \( l \( s_j \) \) . $
  The rank data and (6.11) give, in every factor, $"supp" \( y_j \) prec.tilde q_j$. This comparison also covers zero and infinite dimensions and the type III parts. Comparison of projections in a direct integral therefore gives a partial isometry $v_j in M$ with initial projection $"supp" \( y_j \)$ and final projection at most $q_j$. Hence
  #[#set math.equation(numbering: n => "(6.16)")
   $ y_j v_j^(*) g_j \( l \( s_j \) \) v_j y_j = y_j^2 . $ <tc:exact-norm-signal>]
  #emph[Approximate inside fixed supports.] It remains to approximate these finite data by candidates satisfying (6.13) on the entire caps. A tested value must vanish exactly in a block where its controller vanishes; strong approximation alone would not retain this condition. We therefore split into central sectors and factor each sector map through the required source quotient before approximating it. Let $z_i$ be the central support of $b_i$ in $M$, and form the finitely many central sectors
  $ z_E = product_(i in E) z_i product_(i in.not E) \( 1 - z_i \) \, #h(2em) E subset.eq { 1 \, dots.h \, n } . $
  If $i in.not E$, the rank data and $G \[ a_i \] lt.eq \[ b_i \]$ imply $z_E l \( s_i \) = 0$. Let $J_E^S$ be the ideal of $S$ generated by these $s_i$, and let
  $ I_E = ⋂_(i in E) "Ideal"_Q \( b_i \) \, #h(2em) I_diameter = Q . $
  The weak closure of $I_E$ has central support dominating $z_E$. Choose positive contractions $e_E in I_E$ with compact Cuntz support, tending strongly to the identity on this sector. The maps
  #[#set math.equation(numbering: n => "(6.17)")
   $ psi_E \( s \) = e_E z_E l \( s \) e_E $ <tc:sector-compression>]
  take values in $"Her" \( e_E \)''$, are completely positive contractions, and factor through $S \/ J_E^S$. This quotient is taken before the approximations below. The element $e_E$ itself need not vanish outside the sector; (6.17) does vanish there. Write
  $ D_0 \( s \) = "diag"_E \( z_E l \( s \) \) \, #h(2em) D_e \( s \) = "diag"_E \( e_E z_E l \( s \) e_E \) . $
  Thus $D_0$ is the exact sector representation and $D_e$ is its completely positive compression. As the $e_E$ increase along approximate units, $D_e \( s \) arrow.r D_0 \( s \)$ strongly-$*$ for each $s$.
  For the selected trace belonging to test $i$, the sector contributes zero if $i in.not E$. If $i in E$, the positive operators $z_E l \( s_i \)$ and $z_E l \( s_i^2 \)$ are integrable, and $z_E l \( s_i \)$ is square integrable, by (6.9). Strongly converging bounded approximate units therefore make the compressions converge in the required $L^1$ and $L^2$ seminorms. For the $L^1$ assertion apply $L^2$ convergence to the square root of the integrable positive operator and use Cauchy–Schwarz; for the square evaluation apply it directly to $z_E l \( s_i \)$.
  For the lower signal set $V_j = \( z_E v_j \)_E$. This column is a contraction, and, because $g_j \( 0 \) = 0$, the exact sector representation satisfies
  $ y_j V_j^(*) g_j \( D_0 \( s_j \) \) V_j y_j = y_j^2 . $
  Bounded strong-$*$ functional calculus gives $g_j \( D_e \( s_j \) \) arrow.r g_j \( D_0 \( s_j \) \)$. Fix the $e_E$ sufficiently far out that replacing $D_0$ by $D_e$ makes the errors small against the selected normal functionals, as well as meeting the preceding finite trace requirements. The compressed expression need not equal $y_j^2$ exactly.
  We give the remaining approximation explicitly. Nuclearity of the quotient $R_0 = S \/ J_E^S$ provides completely positive contractive factorizations through finite matrix algebras approximating its identity on the finite tests #cite(label("ChoiEffros")); see also #cite(label("HanPaulsen")) Corollary 3.3. For nonunital $R_0$, apply the latter unital statement to its nuclear unitization. Restrict the incoming map to $R_0$ and compress the outgoing map $beta$ to $x mapsto e beta \( x \) e$, where $e in R_0$ is a positive contractive approximate-unit element. Choose $e$ first so that $parallel e a e - a parallel < delta \/ 2$ on the finite tests, and then choose the factorization with error less than $delta \/ 2$ there. Contractivity bounds the total error by $delta$, and the compressed map takes values in $R_0$. Compose this outgoing map with $psi_E$. A completely positive map from $M_d$ into $"Her" \( e_E \)''$ is specified by its positive Choi matrix. Approximate the square root of that matrix strongly-$*$, with bounded norm, by matrices over $"Her" \( e_E \)$; the products give positive Choi matrices over the hereditary algebra. If the resulting map $beta$ has $t = beta \( 1 \)$, replace it by
  $ x mapsto max \( 1 \, t \)^(- 1 \/ 2) beta \( x \) max \( 1 \, t \)^(- 1 \/ 2) . $
  The functional calculus is in the unitization. This replacement is completely positive and contractive, stays in $"Her" \( e_E \)$, and retains the strong-$*$ limit, because the limiting unit value is at most one. We have obtained completely positive contractions
  $ H_E : S \/ J_E^S arrow.r "Her" \( e_E \) subset.eq Q $
  approximating (6.17) on the required tests.
  The support element $e_E$ was fixed before this Choi-matrix approximation, and every approximating value remains in $"Her" \( e_E \)$. For each $i in E$, compact Cuntz support inside $I_E$ gives a finite integer $N_(E \, i)$ with $\[ e_E \] lt.eq N_(E \, i) \[ b_i \]$. Thus the support of every output in this block has rank at most $N_(E \, i) d_tau \( b_i \)$, for every extended trace $tau$. On the selected traces this is one fixed finite normal trace support. Bounded strong-$*$ convergence on that support gives convergence of the trace and square-trace evaluations, with no loss of mass. For $i in.not E$, the quotient-first factorization kills $s_i$ and $s_i^2$ exactly, so no trace-convergence argument is required in that block. This proves the trace approximation, as well as the required uniformity on the whole caps.
  Put the sector maps in separate matrix blocks: $H = xor.big_E H_E$. This is a completely positive contraction since the norm of a direct sum is the maximum of the norms. Its unnormalized matrix trace is the sum of the sector traces. The blocks with $i in.not E$ kill $s_i$ and $s_i^2$ exactly, while
  $ d_tau \( H \( s_i \) \) \, med d_tau \( H \( s_i^2 \) \) lt.eq (sum_(E in.rev i) N_(E \, i)) d_tau \( b_i \) . $
  The maps $H_E$ approximate the fixed compressed map $D_e$, not the exact map $D_0$. Rectangular Kaplansky density approximates the columns $V_j$ strongly-$*$ by contraction columns over $Q$. Bounded strong-$*$ functional calculus and multiplication therefore make the resulting algebra coordinates arbitrarily close, against the selected normal functionals, to those for $D_e$. Combined with the preceding choice of the $e_E$, this approximates $y_j^2$ to the required functional accuracy. Those functionals are normal in $pi$ by construction.
  Thus candidate vectors approximate the value of every finite functional obtained from a supposed separator, arbitrarily closely to the target value. This contradicts strict separation and proves the proposition. ◻
]

=== 6.3 Averaging and the lower rank bound <averaging-and-the-lower-rank-bound>

The preceding proposition gives finite convex combinations with arbitrarily small uniform errors on the caps and arbitrarily small norm errors in the algebra coordinates. The convex coefficients can be made rational: only finitely many bounded vectors are involved in any one combination. If their common denominator is $N$, put the candidates, with their rational multiplicities, in the $N$ diagonal blocks of a normalized matrix subalgebra of $cal(Q)$. First zero-pad their internal matrix spaces to a common size. Denote the resulting completely positive contraction by $H_(upright("av"))$. Then, for $k = 1 \, 2$,

#[#set math.equation(numbering: n => "(6.18)")
 $ tau \( H_(upright("av")) \( s_i^k \) \) & = sum_alpha lambda_alpha tau \( H_alpha \( s_i^k \) \) \,\
tau \( H_(upright("av")) \( s_i \)^2 \) & = sum_alpha lambda_alpha tau \( H_alpha \( s_i \)^2 \) . $ <tc:average-traces>]

Only the $alpha$ direction is normalized. Internal sector and stabilizing matrix directions keep the unnormalized trace. Folding as in 2 therefore gives the same formulas for a map with range $Q$.

#thm([Lemma 19.])[
  (A lower rank bound preserved by averaging).  #emph[Fix lower data $y \, g \, eta$ as in (6.11)–(6.12). If a finite rational average satisfies 
$ ∥sum_alpha lambda_alpha y v_alpha^(*) g \( H_alpha \( s \) \) v_alpha y - y^2∥ < epsilon^2 \/ 2 \, $

 then for every extended trace on $Q$, 
#[#set math.equation(numbering: n => "(6.19)")
 $ d_tau \( \( y - epsilon \)_(+) \) lt.eq frac(2 parallel y parallel^2, epsilon^2) thin d_tau \( \( H_(upright("av")) \( s \) - eta \)_(+) \) . $ <tc:rank-bound>]

 The constant and the cut $eta$ are independent of the number of candidates, their multiplicities, and their internal matrix sizes.]
] <tc:rank-average>

#proof[
  Write the displayed average as $T$ and let $p = 1_(\( epsilon \, oo \)) \( y \)$ in the bidual. The norm estimate gives $p T p gt.eq \( epsilon^2 \/ 2 \) p$. Since the $v_alpha$ are contractions and $0 lt.eq g \( t \) lt.eq 1_(\( eta \, oo \)) \( t \)$, positivity and traciality give
  $ epsilon^2 / 2 tau \( p \) lt.eq parallel y parallel^2 sum_alpha lambda_alpha d_tau \( \( H_alpha \( s \) - eta \)_(+) \) . $
  The sum is exactly the rank on the right of (6.19), by the normalized averaging convention.
  Here is a justification when $tau$ is not densely finite. If the right side is infinite, there is nothing to prove. If it is finite, discard zero coefficients. Every support of $g \( H_alpha \( s \) \)$ then has finite rank. The norm estimate gives $\( y^2 - epsilon^2 \/ 2 \)_(+) prec.tilde T$, and $T$ is Cuntz below the finite direct sum of the $g \( H_alpha \( s \) \)$, by its finite row factorization. Since $p$ is the support of $\( y^2 - epsilon^2 \)_(+)$, it has finite rank and belongs to the normal trace’s finite part. One may initially use a slightly smaller spectral projection inside $p$. The displayed computation is now a computation for the induced normal trace on this finite part. Let the additional cut slack decrease to zero. This gives the inequality for $p$ by normal monotone convergence and proves the assertion for every extended weight. ◻
]

=== 6.4 The diagonal choice <the-diagonal-choice>

#proof[
  #emph[Fix the comparisons before forming averages.] Fix the test family, its larger pre-cuts, its local controllers, and all lower data before choosing the sequence. For each nonzero $f ⊗ a in cal(E)$, take countably many pairs $\( delta \, r \)$ with
  $ delta arrow.b 0 \, #h(2em) 0 < r < m \( { f > delta } \) \, $
  and positives $y$ representing $r G \[ \( a - delta \)_(+) \]$. Include all positive rational cuts of these $y$ in the lower requirements. Their ideals exhaust $Q \( U_a \)$: multiplication by a positive real scalar does not change a Cuntz ideal, the cuts of $a$ exhaust its ideal, and $G$ identifies ideals. For each requirement fix its function $g$, its lower cutoff $eta$, and its source cutoff $epsilon$. In particular, none of these cutoffs depends on the eventual averaging denominator.
  At stage $n$, apply 7 to the first $n$ trace tests and first $n$ lower requirements. Choose rational averages and fold them into $Q$, obtaining a completely positive contraction $h_n : S arrow.r Q$. Given any prescribed sequence $gamma_n arrow.b 0$, the trace errors can be made to satisfy, for $i lt.eq n$,
  #[#set math.equation(numbering: n => "(6.20)")
   $ \| tau \( h_n \( s_i \) \) - t_i^(\( 1 \)) \( tau \) \| & lt.eq gamma_n d_tau \( b_i \) \,\
\| tau \( h_n \( s_i^2 \) \) - t_i^(\( 2 \)) \( tau \) \| & lt.eq gamma_n d_tau \( b_i \) \,\
\| tau \( h_n \( s_i \)^2 \) - t_i^(\( 2 \)) \( tau \) \| & lt.eq gamma_n d_tau \( b_i \) $ <tc:coordinate-errors>]
  whenever $d_tau \( b_i \) < oo$. Indeed, the uniform estimate on $K_i$ rescales when this rank is nonzero; when it is zero, apply the cap estimate to every positive scalar multiple of $tau$ and let the scalar increase. All evaluations in that argument are finite, by the support bounds. Simultaneously choose the algebra norm errors below $epsilon^2 \/ 2$ for each of the first $n$ fixed lower requirements. 19 then supplies the corresponding lower rank inequalities with their fixed constants.
  #emph[Localize the multiplicative defects.] The coordinate maps define a completely positive contraction $h : S arrow.r D$. Put $Delta_(n \, i) = h_n \( s_i^2 \) - h_n \( s_i \)^2 gt.eq 0$ by Schwarz’s inequality. For $t > 0$, (6.20) gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ d_tau \( \( Delta_(n \, i) - t \)_(+) \) lt.eq frac(2 gamma_n, t) d_tau \( b_i \) . $ <tc:defect-rank>]
  For zero controller rank this follows by the same rescaling argument; for infinite controller rank the upper bound is automatic. Thus $h \( s_i^2 \) - h \( s_i \)^2 in J \( U_i \)$. In $D \/ J \( U_i \)$ the positive element $s_i$ belongs to the multiplicative domain of the induced completely positive contraction. Hence both mixed defects with $s_i$ belong to $J \( U_i \)$, for every $z in S$.
  For an arbitrary open $U$, use the tests localized in basis ideals inside $U$. Their linear spans are dense in $S \( U \)$. Inclusion and closedness of the ideals $J \( V \) subset.eq J \( U \)$ therefore give (6.3) for all $s in S \( U \)$. The local scheduling in 6 ensures the same conclusion when a controller is first selected in a smaller open: dominate it by a finite multiple of a fixed controller in the chosen larger open, and reduce the stage error before passing to the next row. These multiplicities never change an already fixed cut threshold or lower comparison.
  #emph[Recover the square moments.] Let $rho$ now be a regularized limit of coordinate weights $tau_n$, with $sigma = rho \|_Q$ densely finite on the chosen controlling ideal $Q \( U_i \)$. Compact Cuntz support, and the larger controller fixed at the start, imply that $d_(tau_n) \( b_i \)$ is bounded along the defining ultrafilter. The constant restrictions converge to $sigma$ in the trace topology of 2. Bounded-rank continuity from 8, applied also after $F$ using (6.2), gives
  $ lim_omega t_i^(\( k \)) \( tau_n \) = t_i^(\( k \)) \( sigma \) \, #h(2em) k = 1 \, 2 . $
  Consequently (6.20) gives convergence of the uncut square traces to $t_i^(\( 2 \)) \( sigma \)$, and a bounded first moment $lim_omega tau_n \( h_n \( s_i \) \) < oo$.
  There is no loss of square mass on regularization. For $x gt.eq 0$ and $t > 0$, scalar functional calculus gives
  #[#set math.equation(numbering: n => "(6.22)")
   $ 0 lt.eq tau \( x^2 \) - tau \( \( x^2 - t \)_(+) \) lt.eq sqrt(t) thin tau \( x \) $ <tc:square-mass>]
  whenever the right side is finite. Apply this with $x = h_n \( s_i \)$, take the ultralimit, and then let $t arrow.b 0$. The definition of $rho$ and (6.22) yield exactly (6.4).
  #emph[Retain the lower ideal support.] Fix one lower datum $\( y \, epsilon \, eta \)$ for the test $s = f ⊗ a$. For all sufficiently large $n$, 19 gives
  $ d_tau \( \( y - epsilon \)_(+) \) lt.eq C thin d_tau \( \( h_n \( s \) - eta \)_(+) \) quad upright("for every ") tau in T \( Q \) \, #h(2em) C = 2 parallel y parallel^2 \/ epsilon^2 . $
  The order determination in 2 implies
  $ \[ \( y - epsilon \)_(+) \] lt.eq ceil.l C ceil.r \[ \( h_n \( s \) - eta \)_(+) \] . $
  If $\( y - epsilon \)_(+) = 0$, this comparison has no content and needs no witness. Otherwise $C > 0$; set $N = ceil.l C ceil.r gt.eq 1$. The uniform comparison implementation in 4 gives rectangular columns $w_n$ such that
  $ ∥w_n^(*) "diag"_N \( h_n \( s \) \) w_n - \( y - epsilon \)_(+)∥ < 1 \/ n \, #h(2em) parallel w_n parallel^2 lt.eq frac(parallel y parallel + 1 \/ n, eta) . $
  This bound is independent even of $N$. The columns pass to the sequence algebra and put $\( y - epsilon \)_(+)$ in $"Ideal"_D \( h \( s \) \)$. Letting the source cut decrease to zero puts $y$ itself in this ideal. The previously chosen $y$’s and their cuts generate $Q \( U_a \)$, proving (6.5). ◻
]

== 7 Correction of the cone models <cc:section>

Throughout this section,

$ S = C_0 \( \( 0 \, 1 \] \) ⊗ P \, #h(2em) D = Q_oo . $

We first correct the multiplicative defects of the map in 6. The correction takes place on a hereditary support containing the defects and a small cone representation. Its ideal estimates are stronger than equivariance for the projected labels. This strength is what permits the cone homotopy to be used with the finer labels of $"Prim" \( S \)$.

=== 7.1 The error support and its ideal estimates <the-error-support-and-its-ideal-estimates>

#thm([Lemma 20.])[
  (A hereditary support for the defects).  #emph[Let $h : S arrow.r D$ be c.p.c. and suppose that, for every open $U subset X$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ h \( s z \) - h \( s \) h \( z \) \, quad h \( z s \) - h \( z \) h \( s \) in J \( U \) #h(2em) \( s in S \( U \) \, med z in S \) . $ <cc:mixed-defects>]

 Let $E = C^(*) \( h \( S \) \)$ and let $I lt.closed E$ be the ideal generated by $h \( a b \) - h \( a \) h \( b \)$, for $a \, b in S$. Then 
#[#set math.equation(numbering: n => "(7.2)")
 $ h \( S \( U \) \) I + I h \( S \( U \) \) subset J \( U \) . $ <cc:annihilation>]

 There is a locally small cone homomorphism $theta : S arrow.r D$ such that, after placing $h$ and $theta$ in separate matrix corners, a $sigma$-unital hereditary algebra $H subset M_2 \( D \)$ has the following properties. The first-corner map $h$ idealizes $H$, its multiplicative defects belong to $H$, and $theta \( S \) subset H$. Moreover, for every $x in S_(+)$, 
#[#set math.equation(numbering: n => "(7.3)")
 $ h \( S \( U_x \) \) H + H h \( S \( U_x \) \) subset H_x \, #h(2em) H_x := "Ideal"_H \( theta \( x \) \) . $ <cc:strong-support>]

 Here $theta \( S \( U \) \) subset J \( U \)$, with the matrix conventions of 2.]
] <cc:defect-support>

#proof[
  Fix $U$ and pass to $D \/ J \( U \)$, writing bars for the quotient maps. For $s in S \( U \)$ and $a \, b in S$, the mixed multiplication identities give
  $ macron(h) \( s \) #scale(x: 120%, y: 120%)[\(] macron(h) \( a b \) - macron(h) \( a \) macron(h) \( b \) #scale(x: 120%, y: 120%)[\)] = macron(h) \( s a b \) - macron(h) \( s a \) macron(h) \( b \) = 0 . $
  The analogous right product is zero. More generally a word in $macron(h) \( S \)$ between $macron(h) \( s \)$ and a defect can be absorbed into the localized input one factor at a time. The resulting input is still in $S \( U \)$. Polynomial approximation in $E$ therefore proves (7.2) for the whole generated ideal $I$.
  The algebra $E$, and hence $I$, is separable. Apply 2 to the bounded bilinear map $\( s \, b \) mapsto h \( s \) b$, with $b in I$. Include its adjoints in the same countable family. This gives a locally small cone homomorphism $theta$ satisfying, simultaneously for every $x in S_(+)$,
  #[#set math.equation(numbering: n => "(7.4)")
   $ h \( S \( U_x \) \) I + I h \( S \( U_x \) \) subset "Ideal"_(M_2 \( D \)) \( theta \( x \) \) . $ <cc:ambient-domination>]
  The first-corner and second-corner placements are understood in this formula; the ideal on the right is the ambient matrix ideal.
  Choose strictly positive elements $e in I_(+)$ and $k in theta \( S \)_(+)$, omitting a zero summand when necessary, and set
  #[#set math.equation(numbering: n => "(7.5)")
   $ H = "Her"_(M_2 \( D \)) \( e xor k \) . $ <cc:H-definition>]
  It is $sigma$-unital, since $e xor k$ is strictly positive for $H$. No separability assertion about $H$ is needed. Since $I lt.closed E$, $h \( a \) I + I h \( a \) subset I$ for $a in S$. Functional-calculus approximate units of $I$ show that the first-corner map idealizes the first support. They also show that it preserves all the off-diagonal corners in (7.5): on the dense linear span of products
  $ f \( e xor k \) thin z thin g \( e xor k \) \, #h(2em) z in M_2 \( D \) \, $
  left multiplication by $h \( a \)$ replaces the first support factor by an element of $I$, and right multiplication has the corresponding property. Approximation by the support approximate unit proves idealization of $H$. The defects themselves lie in $I subset H$.
  For $a in S \( U_x \)$, the same calculation, now using (7.4), puts $h \( a \) H$ and $H h \( a \)$ in $H ∩ "Ideal"_(M_2 \( D \)) \( theta \( x \) \)$. The hereditary ideal correspondence gives
  $ H ∩ "Ideal"_(M_2 \( D \)) \( theta \( x \) \) = "Ideal"_H \( theta \( x \) \) . $
  This proves (7.3); equivalently, one may apply 13. All matrix placements preserve the local smallness of $theta$. ◻
]

We use the right Hilbert $H$-module convention. Write $cal(L)_H \( cal(E) \)$ and $cal(K)_H \( cal(E) \)$ for adjointable and compact operators on a Hilbert $H$-module $cal(E)$. For an ideal $L lt.closed H$, let $cal(E) L$ denote the closed span of ${ xi b : xi in cal(E) \, b in L }$.

#thm([Lemma 21.])[
  (A dilation compatible with fine ideal labels).  #emph[Let $d : S arrow.r cal(L)_H \( H \) = M \( H \)$ be the multiplier map induced by $h$ in 20. There is a countably generated Hilbert $H$-module $cal(E)'$ and a representation 
#[#set math.equation(numbering: n => "(7.6)")
 $ Pi : S arrow.r cal(L)_H \( H xor cal(E)' \) \, #h(2em) Pi \( a \) = mat(delim: "(", d \( a \), C \( a \); B \( a \), d' \( a \)) \, $ <cc:dilation>]

 whose off-diagonal entries are compact. The maps $d \, d'$ are c.p.c. The module may be stabilized, retaining the first copy of $H$, so that $cal(E)'$ is the standard countable module.]
  #emph[Give $S$ its tight $"Prim" \( S \)$-labels and give $H$ the order-preserving assignment 
#[#set math.equation(numbering: n => "(7.7)")
 $ H \( O \) = "Ideal"_H \( theta \( S \( O \) \) \) #h(2em) \( O subset "Prim" \( S \) upright(" open") \) . $ <cc:fine-labels>]

 Let $alpha_t$ be cone scaling, 
$ \( alpha_t a \) \( r \) = a \( t r \) \, #h(2em) 0 lt.eq t lt.eq 1 \, $

 where $a \( 0 \) = 0$. Every $Pi_t := Pi alpha_t$ is weakly $"Prim" \( S \)$-nuclear for (7.7). The same is true of its diagonal compressions $d_t \, d'_t$.]
] <cc:scaled-dilation>

#proof[
  Use the Hilbert-module Stinespring construction in #cite(label("Kasparov")) proof of Theorem 3, pp. 140–141, applied to the unital extension $d^(+)$ of $d$ on the forced unitization of $S$. The source is separable and $H$ has a countable approximate unit, as required there. The resulting representation acts on the completion of the algebraic Stinespring module. Its adjointable isometry $V : H arrow.r cal(E)$ is given by $V xi = 1 ⊗ xi$ and $V^(*) \( b ⊗ eta \) = d^(+) \( b \) eta$, so $V^(*) Pi \( a \) V = d \( a \)$. The module is countably generated: use a countable dense subset of the unitized source and a countable approximate unit of $H$. Decompose $cal(E) = V H xor cal(E)'$ and identify $V H$ with $H$.
  For $B \( a \) = \( 1 - V V^(*) \) Pi \( a \) V$,
  #[#set math.equation(numbering: n => "(7.8)")
   $ B \( a \)^(*) B \( a \) = d \( a^(*) a \) - d \( a^(*) \) d \( a \) in H = cal(K)_H \( H \) . $ <cc:compact-offdiagonal>]
  An adjointable operator whose square modulus is compact is compact, by functional calculus in the compact-operator ideal. Thus $B \( a \)$ is compact, and so is $C \( a \) = B \( a^(*) \)^(*)$. Kasparov stabilization #cite(label("Kasparov")) Theorem 2 of $cal(E)'$ after adding a zero representation identifies its enlargement with the standard module. This leaves $V H$ fixed and preserves compactness and the indicated diagonal compressions.
  We check the ideal assertion before using the homotopy. For $a in S \( U_x \)$, coefficients on the dense Stinespring generators have the form
  #[#set math.equation(numbering: n => "(7.9)")
   $ chevron.l b ⊗ xi \, Pi \( a \) \( c ⊗ eta \) chevron.r = xi^(*) d \( b^(*) a c \) eta in H_x \, $ <cc:Stinespring-coefficients>]
  where $b \, c$ belong to the forced unitization. The containment uses $b^(*) a c in S \( U_x \)$ and (7.3). It extends to all vectors. Passing to the quotient module by $cal(E) H_x$ shows that $Pi \( a \) cal(E) subset cal(E) H_x$; the same holds for the adjoint. Stabilization and module unitaries preserve these ideal submodules.
  Now take $a in S \( O \)$ and put $x = \| a \|$. Scaling does not enlarge its #emph[projected] support:
  #[#set math.equation(numbering: n => "(7.10)")
   $ alpha_t \( a \) in S \( U_x \) quad \( 0 lt.eq t lt.eq 1 \) . $ <cc:projected-scaling>]
  Indeed a point quotient in the $P$ coordinate which kills $a$ also kills every rescaling of $a$. Since $x in S \( O \)$, $H_x subset H \( O \)$, and (7.9) applied to $alpha_t \( a \)$ proves weak equivariance of $Pi_t$. It proves the same assertion for the compressions. Source ideals and quotients are nuclear, so these coefficient conditions also give weak nuclearity, as in 5.
  This argument does not assert that $alpha_t$ preserves $S \( O \)$. The stronger estimate for the entire projected ideal $S \( U_x \)$ is the reason that the scaled representation has the required fine ideal bounds. ◻
]

For later use, if $U subset X$ and $O_U = \( 0 \, 1 \] times U$, then

#[#set math.equation(numbering: n => "(7.11)")
 $ H \( O_U \) subset H ∩ M_2 \( J \( U \) \) . $ <cc:local-compact-ideal>]

This follows from the ideal property of $J \( U \)$ and the local smallness of $theta$. If a compact-valued map is the difference of two weakly equivariant maps, its value on $S \( O_U \)$ belongs to the compact operators over $cal(E) H \( O_U \)$. To see this, pass to the quotient module by $cal(E) H \( O_U \)$: both maps vanish there on this input, and the kernel of the quotient map on compact operators is precisely $cal(K)_H \( cal(E) H \( O_U \) \)$. Thus every such compact correction is locally in $J \( U \)$.

=== 7.2 A finite correction on the original module <a-finite-correction-on-the-original-module>

The dilation now respects every fine ideal label, including along cone scaling. We will compare nearby times in a finite subdivision of that homotopy. Absorption makes a finite chain of dilations available as a compact perturbation of a repeat of $theta$. Shifting the first summands along this chain pairs each complementary summand with a nearby compression; the unpaired summand lies near the zero endpoint. The resulting map is close to a representation.

We then truncate only the compact perturbation. This produces a finite matrix correction with the original $h$ still in its first corner, so its square moments and lower ideal support remain available.

#thm([Lemma 22.])[
  (A finite correction retaining the original corner).  #emph[Under the hypotheses of 20, let $cal(F)$ be a finite subset of the unit ball of $S$ and let $eta > 0$. There are an integer $N$, a bounded linear $*$-preserving map $L : S arrow.r M_(N + 1) \( M_2 \( D \) \)$, and a bounded linear map $K_N : S arrow.r M_(N + 1) \( H \)$ such that 
#[#set math.equation(numbering: n => "(7.12)")
 $ L \( a \) = h \( a \) xor theta \( a \)^(xor N) + K_N \( a \) \, $ <cc:finite-form>]

 and, for $a \, b in cal(F)$, 
#[#set math.equation(numbering: n => "(7.13)")
 $ parallel L \( a \) parallel lt.eq parallel a parallel + eta \, #h(2em) parallel L \( a b \) - L \( a \) L \( b \) parallel lt.eq 3 eta + 2 eta^2 . $ <cc:finite-estimates>]

 For every open $U subset X$, 
#[#set math.equation(numbering: n => "(7.14)")
 $ K_N \( S \( U \) \) subset M_(N + 1) \( H ∩ M_2 \( J \( U \) \) \) . $ <cc:finite-locality>]

 The first summand in (7.12) is the original $h$, with only zero corner padding.]
] <cc:finite-correction>

#proof[
  #emph[Absorb a finite chain of dilations.] Include $cal(F)^(*)$ and all products from $cal(F)$ in the finite list on which estimates will be imposed. By norm continuity of $t mapsto alpha_t \( a \)$, choose
  $ 0 = t_0 < t_1 < dots.h.c < t_k = 1 $
  so that adjacent values differ in norm by less than $eta$ on this enlarged list. Write $d_i = d_(t_i)$, $d'_i = d'_(t_i)$ and $Pi_i = Pi_(t_i)$, using the same first module $H$ and the same complementary module in all these dilations.
  For the absorption application put $hat(theta) \( a \) = theta \( a \) ⊗ e_11 in H ⊗ cal(K)$, with target labels $H \( O \) ⊗ cal(K)$. If $O_a$ is the fine support of $a in S_(+)$, then $S \( O_a \) = "Ideal"_S \( a \)$ and
  $ "Ideal"_H \( theta \( S \( O_a \) \) \) = "Ideal"_H \( theta \( a \) \) . $
  Thus $hat(theta)$ is full for these fine labels, independently of any coarse fullness assertion. Apply 5 to a literal stable infinite repeat $Theta$ of $hat(theta)$ and the finite sum of the $Pi_i$. On the standard Hilbert $H$-module, this repeat can be reindexed as
  #[#set math.equation(numbering: n => "(7.15)")
   $ Theta \( a \) = "diag" \( theta \( a \) \, 0 \, theta \( a \) \, 0 \, dots.h \) . $ <cc:stable-repeat>]
  Indeed each repeated copy of $hat(theta)$ acts by $theta$ on one $H$ slot and by zero on the other slots of its standard module. Both the active slots and the remaining zero slots are countably infinite, giving (7.15) by a fixed permutation. We retain every zero slot throughout absorption and finite compression. The bare diagonal repeat with all these zero slots removed need not absorb a zero representation. The hypotheses hold: the tightly labeled source is separable, exact and lower semicontinuous; $H ⊗ cal(K)$ is $sigma$-unital and stable; and 21 supplies weak nuclearity of the representations being absorbed. Absorption identifies the repeat module with a module carrying
  $ Theta xor Pi_1 xor dots.h.c xor Pi_k $
  so that its difference from the original repeat is compact on every input. More precisely, absorption in #cite(label("Gabe")) Definition 5.4 gives a repeat-side module unitary $U$ with
  $ U^(*) \( Theta xor xor.big_i Pi_i \) \( a \) U - Theta \( a \) in cal(K)_H \( H^(xor oo) \) #h(2em) \( a in S \) \; $
  the compact membership holds for every input for each chosen unitary, in addition to the finite-test norm approximation. Only this compact-membership conclusion from absorption is needed below. Its finite-test approximation error does not enter our bound: after the unitary identification we keep the absorbed representation itself. All these identifications act on the repeat side; the initial module carrying $d = d_k$ is fixed.
  #emph[Shift the first summands along the chain.] Denote the initial copy of $H$ by $H_0$, the first copy in $Pi_i$ by $H_i$, and its complement by $cal(E)'_i$. Delete the compact off-diagonals of the absorbed $Pi_i$. Apart from the unused repeat, the diagonal summands are
  #[#set math.equation(numbering: n => "(7.16)")
   $ d_k \|_(H_0) med xor xor.big_(i = 1)^k (d_i \|_(H_i) xor d'_i \|_(cal(E)'_i)) . $ <cc:before-regrouping>]
  Pair $H_0$ with $cal(E)'_k$, and, for $i < k$, pair $H_(i + 1)$ with $cal(E)'_i$. The unused first module is $H_1$. Restore the compact off-diagonals of $Pi_i$ in the pair whose second component is $cal(E)'_i$. In this ordered decomposition the resulting map is
  #[#set math.equation(numbering: n => "(7.17)")
   $ T' = Theta xor d_1 xor xor.big_(i = 1)^(k - 1) [Pi_i + mat(delim: "(", d_(i + 1) - d_i, 0; 0, 0)] xor Pi_k . $ <cc:regrouped-map>]
  It is a compact perturbation of the map in (7.16), including its repeat: the diagonal entries were only permuted, and the restored entries are compact. The representation
  #[#set math.equation(numbering: n => "(7.18)")
   $ R' = Theta xor 0 xor xor.big_(i = 1)^(k - 1) Pi_i xor Pi_k $ <cc:comparison-representation>]
  is within $eta$ of $T'$ on the enlarged finite list. Indeed $parallel d_1 \( a \) parallel lt.eq parallel alpha_(t_1) \( a \) parallel < eta$ there, since $alpha_0 = 0$, and every other difference in (7.17) has norm less than $eta$. No compactness of $d_(i + 1) \( a \) - d_i \( a \)$ has been used.
  Pull both maps back through the block permutation and the absorption identification to the original module
  $ cal(L) = H xor H^(xor oo) . $
  Writing $T_0 = d xor Theta$, we obtain
  #[#set math.equation(numbering: n => "(7.19)")
   $ T = T_0 + K \, #h(2em) K \( a \) in cal(K)_H \( cal(L) \) \, #h(2em) parallel T \( a \) - R \( a \) parallel < eta $ <cc:T-plus-K>]
  on the enlarged list, where $R$ is a representation. The maps in this construction are bounded linear and $*$-preserving. They are weakly equivariant: the block compressions and off-diagonal entries have the ideal bounds of 21, and any Hilbert-module unitary preserves the submodule associated to an ideal. Thus (7.11) applies to $K$. For $a \, b in cal(F)$, comparison with the contractive representation $R$ gives
  #[#set math.equation(numbering: n => "(7.20)")
   $ parallel T \( a \) parallel lt.eq parallel a parallel + eta \, #h(2em) parallel T \( a b \) - T \( a \) T \( b \) parallel lt.eq 3 eta + eta^2 . $ <cc:T-estimates>]
  #emph[Compress the compact correction.] Let $E_N$ be the projection onto the initial copy of $H$ and the first $N$ slots in the #emph[original] diagonal repeat (7.15), including both active and zero slots. It commutes with $T_0 \( a \)$ for all $a$. The projections $E_N$ tend strictly to the identity on the compact operators. Choose $N$ so that both tails of every $K \( a \)$ on the enlarged list have norm less than $eta$. Then
  #[#set math.equation(numbering: n => "(7.21)")
   $ & E_N T \( a b \) E_N - E_N T \( a \) E_N T \( b \) E_N\
 & quad = E_N #scale(x: 120%, y: 120%)[\(] T \( a b \) - T \( a \) T \( b \) #scale(x: 120%, y: 120%)[\)] E_N + E_N K \( a \) \( 1 - E_N \) K \( b \) E_N . $ <cc:compression-defect>]
  The second term has norm at most $eta^2$. Compression preserves the norm estimate in (7.20).
  The entries of $E_N K \( a \) E_N$ lie in $H$, so the compressed map has an actual ambient realization with diagonal baseline $h$ followed by the retained $theta$ and zero slots. To obtain exactly (7.12), let $Z_N \( a \)$ be the finite diagonal matrix which places $theta \( a \)$ in each retained zero repeat slot and zero in every other slot, including the initial one. Define
  #[#set math.equation(numbering: n => "(7.22)")
   $ K_N \( a \) = E_N K \( a \) E_N - Z_N \( a \) . $ <cc:zero-slot-rebasing>]
  Replacing each zero baseline slot by $theta \( a \)$ and subtracting it in (7.22) leaves the compressed map $L$ unchanged. The map $Z_N$ is bounded linear and $*$-preserving, has entries in $H$, and is locally in $J \( U \)$ because $theta$ is locally small. Thus $K_N$ has the required compact and local properties. This rebasing is performed only after finite compression; the tail estimate used the original $T_0$ with all its zero slots.
  #emph[Return to the ambient sequence algebra.] To transfer the multiplier estimates, let $p_H$ be the support projection of $H$ in $M_2 \( D \)^(* *)$. Idealization implies that $h \( a \)$ commutes with $p_H$. The correction entries, and the values of $theta$, are supported on $p_H$. On its matrix amplification the ambient map is exactly the compressed multiplier map just estimated. On the orthogonal complement all corrections vanish; the remaining first-corner map $h$ is contractive and multiplicative there, since its defects lie in $I subset H$. Taking the maximum of these two reducing parts proves (7.13) in the ambient norm. Finally (7.14) follows from the local compact ideal statement for $K$. ◻
]

=== 7.3 Passage to a corrected sequence homomorphism <passage-to-a-corrected-sequence-homomorphism>

#thm([Proposition 8.])[
  (Cone correction).  #emph[Suppose $h : S arrow.r D$ is c.p.c. and satisfies (7.1). After trace-preserving coordinate corner padding, there is a homomorphism $lambda : S arrow.r D$ such that 
#[#set math.equation(numbering: n => "(7.23)")
 $ \( lambda - h^(upright("pad")) \) \( S \( U \) \) subset J \( U \) #h(2em) \( U subset X upright(" open") \) . $ <cc:corrected-difference>]

 The padding can be chosen to fix the constant copy of $Q$ in the sequence quotient. Consequently it preserves the constant ideal comparisons and the regularized trace formulas prescribed for $h$.]
] <cc:correction>

#proof[
  If the defect ideal is zero, $h$ is already a homomorphism. Otherwise use the preceding construction. Nuclearity and separability of $S$ provide a c.p.c. coordinate lift of $h$ by #cite(label("ChoiEffrosLifting")) Theorem 3.10; fix one such lift. Fix a countable rational $*$-subalgebra dense in $S$, together with countable dense local tests in $S \( V \)$ for a compact-containment basis and all finite unions of its members. Include rational linear combinations, products, adjoints, and positive cuts needed for the algebraic and ideal tests. Fix $eta_j arrow.b 0$. At stage $j$ rescale the first $j$ tests and their relevant products into the unit ball. Apply 22 with a tolerance small enough that, after rescaling back, its norm and multiplicativity errors on these tests are at most $eta_j$. Denote the resulting map by $L_j$ and its finite repeat size by $N_j$. In particular, $parallel L_j \( a \) parallel lt.eq parallel a parallel + eta_j$ for every current input $a$.
  Write $h^(upright("pad") \, j) = h xor 0^(xor N_j)$ in the current row, and subtract it from $L_j$. The remaining terms are its compact correction and the $N_j$ small copies of $theta$. They belong to the appropriate matrix ideal $J \( V \)$ on every tested input in $S \( V \)$. On each fixed input $a$, these row differences also satisfy
  $ parallel L_j \( a \) - h^(upright("pad") \, j) \( a \) parallel lt.eq 2 parallel a parallel + eta_j $
  for all sufficiently large $j$. Thus they meet the boundedness hypothesis for prescribed errors in 6; no uniform bound on the global norms of the maps $L_j$ is needed. For each fixed positive cut tolerance their row estimates therefore have the form
  #[#set math.equation(numbering: n => "(7.24)")
   $ d_tau #scale(x: 120%, y: 120%)[\(] \( \| z_(j \, n) \| - epsilon \)_(+) #scale(x: 120%, y: 120%)[\)] lt.eq r_(j \, n) thin d_tau \( c_j \) \, #h(2em) r_(j \, n) arrow.r 0 quad \( n arrow.r oo \) \, $ <cc:row-smallness>]
  where $c_j$ is compactly Cuntz supported in $Q \( V \)$ and the bound is uniform in $tau$.
  For each scheduled pair $V subset.double U$, first fix a cut-positive $b_(V \, U) in Q \( U \)$ whose ideal contains $Q \( V \)$. Compact support gives $\[ c_j \] lt.eq M_j \[ b_(V \, U) \]$ for a finite integer $M_j$. At stage $j$, wait in its coordinate row until $M_j r_(j \, n) lt.eq 1 \/ j$ for all the finitely many current tests and cut tolerances. Wait also until their coordinate norm, involution and product estimates agree with the rescaled finite-test bounds, with an additional error tending to zero. The integers $M_j$ and $N_j$ are chosen before this waiting time; neither needs a bound independent of $j$. This is the diagonal procedure of 6.
  Choose coordinate representatives linearly on each finite rational span, preserving the representatives already needed for its displayed algebraic tests. The preceding eventual estimates allow successive rows to be joined. Matrix folding in 2 is applied only after these choices. Its corner identification is adjusted to be within $1 \/ j$ of the identity on the first $j$ constants of a fixed dense subset of $Q$. The resulting corner map on the sequence algebra fixes $Q$ pointwise. Apply the corner embeddings to the fixed coordinate lift of $h$ to define $h^(upright("pad"))$.
  The joined corrected representatives define a contractive, linear, $*$-preserving, multiplicative map on the dense rational $*$-subalgebra: each asserted identity and norm bound is one of the eventually imposed tests. It extends uniquely to a homomorphism $lambda : S arrow.r D$. The joined estimates (7.24), now against the fixed $b_(V \, U)$, put its difference from $h^(upright("pad"))$ in $J \( U \)$ on the tests from $S \( V \)$. Both resulting maps are continuous. Since the ideals $S \( V \)$ with $V subset.double U$ span densely in $S \( U \)$ and $J \( U \)$ is closed, this proves (7.23) for every open $U$.
  For completeness, if $iota_n : Q arrow.r Q$ are the coordinate corner embeddings, they induce a homomorphism $iota : D arrow.r D$ with $iota \|_Q = "id"_Q$ and $h^(upright("pad")) = iota h$. The pullback of a regularized trace along $iota$ is the regularized trace of the coordinate weights $tau_n iota_n$, with the same restriction $sigma$ to $Q$. Thus every prescribed formula for $h$ of this kind is preserved. Applying $iota$ to an ideal comparison involving constants also preserves that comparison and those constants. ◻
]

=== 7.4 Recovery of the full trace formula <recovery-of-the-full-trace-formula>

We record the trace determination used at the last step. A positive element compactly Cuntz supported in the densely finite ideal of a lower-semicontinuous trace has finite rank. Indeed that ideal is generated by finite-trace positives; their positive cuts have finite rank. Compact containment dominates the given element by finitely many such cuts. Conversely, if an ideal is generated by finite-rank positives, the trace is densely finite on it, since their hereditary algebras consist of finite-trace elements.

#thm([Lemma 23.])[
  (Determination on a finite ideal).  #emph[Let $V subset X$ be open. Suppose two lower-semicontinuous traces on $S \( V \)$ agree on all positive even integer powers of the rich elementary positive test supply of 6, and these values are finite. If the cuts of that supply generate $S \( V \)$, the two traces are densely finite and equal on $S \( V \)$.]
] <cc:finite-trace-determination>

#proof[
  Write $omega_1 \, omega_2$ for the traces, and $omega$ for either one when making an estimate. Finite second moments give finite ranks on all positive cuts of a test $s$: for $epsilon > 0$,
  $ d_omega \( \( s - epsilon \)_(+) \) lt.eq epsilon^(- 2) omega \( s^2 \) . $
  The preceding observation proves dense finiteness for both traces. Fix $s$ and a continuous function $g$ on its squared spectrum which vanishes near zero. Approximate $g \( t \) \/ t$ uniformly by polynomials. Equality of the moments $omega \( s^(2 k) \)$ therefore gives equality on $g \( s^2 \)$: the error is bounded by the uniform polynomial error times $omega \( s^2 \)$. Increasing such functions to spectral support indicators gives equality of the ranks of every positive cut of $s^2$.
  The test supply contains cuts from dense sets of the two factors, so these squares approximate every positive elementary tensor in $S \( V \)$. The comparison
  $ parallel a - b parallel < delta quad arrow.r.double quad \( a - t - delta \)_(+) prec.tilde \( b - t \)_(+) #h(2em) \( t gt.eq 0 \) $
  transfers equality of all cut ranks to each such elementary limit, by allowing the cut slack to decrease to zero. Spectral integration now gives equality of trace values on all positive elementary tensors.
  To pass from elementary tensors to the whole algebra, let $L$ be a relatively compact open subset of $\( 0 \, 1 \]$ and let $H_c = "Her" \( c \) subset P \( V \)$, where $c$ is compactly Cuntz supported in $P \( V \)$. Choose $f_0 in C_c \( \( 0 \, 1 \] \)_(+)$ equal to one on $overline(L)$, and write $c prec.tilde \( b - delta \)_(+)$ with $b in P \( V \)_(+)$ and $delta > 0$. Then
  $ f_0 ⊗ c prec.tilde \( f_1 ⊗ b - delta \/ 2 \)_(+) $
  for a compactly supported $f_1$ equal to one on $"supp" \( f_0 \)$. The larger tensor belongs to the common finite ideal $S \( V \)$ already established above. Thus $f_0 ⊗ c$ has finite rank for both traces. The support of $C_0 \( L \) ⊗ H_c$ is below its support, so both traces are bounded on this localized algebra, with norms bounded by that rank. A positive continuous $P$-valued function there is uniformly approximated by finite positive elementary sums, using a scalar partition of unity. Additivity and boundedness yield equality on this localized algebra. Finally take increasing scalar cutoffs and an increasing cut-supported approximate unit of $P \( V \)$. Traciality writes the corresponding compressions as increasing positive approximations under the square root of the element being tested. Lower semicontinuity extends the equality to every positive element of $S \( V \)$. ◻
]

#thm([Theorem 7.1.])[
  (Existence of cone models).  #emph[Let $m$ be a finite full-support Radon measure on $\( 0 \, 1 \]$. There is a homomorphism $p : S arrow.r D$ such that, for every regularized limit trace $rho$ with $sigma = rho \|_Q$, 
#[#set math.equation(numbering: n => "(7.25)")
 $ rho compose p = m ⊗ F \( sigma \) . $ <cc:full-cone-formula>]

 This includes weights whose densely finite ideal is proper or zero.]
] <cc:cone-existence>

#proof[
  We first preserve the lower ideal signal through correction. For a fixed weight we will then identify its trace on the prescribed finite ideal, and use that signal to rule out any larger finite ideal.
  #emph[Preserve the lower signal.] Take $h$ from 6 and correct it by 8. For each controlled positive test $s = f ⊗ a$, put $delta \( s \) = lambda \( s \) - h^(upright("pad")) \( s \)$. It belongs to $J \( U_s \)$. Apply the cone version of 3 once more to obtain a locally small homomorphism $theta_1 : S arrow.r D$ with
  #[#set math.equation(numbering: n => "(7.26)")
   $ delta \( s \) in "Ideal"_D \( theta_1 \( s \) \) $ <cc:second-stabilizer>]
  for every such test. The countable coefficient form permits all the required cuts and localized families simultaneously. Set $p = lambda xor theta_1$ and fold the two corners, again fixing the constants. In the following comparisons we retain matrix notation for this folding.
  The ideal of $p \( s \)$ contains both $lambda \( s \)$ and $theta_1 \( s \)$, hence contains $h^(upright("pad")) \( s \)$ by (7.26). The lower signal of 6 and the preservation of constants give
  #[#set math.equation(numbering: n => "(7.27)")
   $ Q \( U_a \) subset "Ideal"_D \( p \( f ⊗ a \) \) #h(2em) \( f eq.not 0 \) $ <cc:retained-signal>]
  for each controlled test. Also
  #[#set math.equation(numbering: n => "(7.28)")
   $ \( p - h^(upright("pad")) \) \( S \( U \) \) subset J \( U \) \, $ <cc:total-smallness>]
  where zero padding of $h^(upright("pad"))$ is understood.
  #emph[Identify the trace on its prescribed finite ideal.] Fix a regularized trace $rho$ and write $Q \( V \) = "Fin" \( sigma \)$. By 1, $"Fin" \( F sigma \) = P \( V \)$. Put
  $ omega = rho compose p \, #h(2em) nu = m ⊗ F sigma . $
  The trace $rho$ vanishes on $J \( V \)$ by 4. It therefore factors through the quotient by this zero ideal. For each controlled $s = f ⊗ a$ localized with its controller in $V$, 6 and (7.28) give
  #[#set math.equation(numbering: n => "(7.29)")
   $ omega \( s^2 \) = rho #scale(x: 120%, y: 120%)[\(] h^(upright("pad")) \( s \)^2 #scale(x: 120%, y: 120%)[\)] = integral f^2 thin d m thin F sigma \( a^2 \) = nu \( s^2 \) < oo . $ <cc:square-agreement>]
  Apply the same formula to the positive powers in the supply. The cuts of these localized elementary tests generate $S \( V \)$, including when $V$ is obtained as an increasing union of the basis opens. Thus 23 proves
  #[#set math.equation(numbering: n => "(7.30)")
   $ S \( V \) subset "Fin" \( omega \) \, #h(2em) omega \|_(S \( V \)) = nu \|_(S \( V \)) . $ <cc:finite-region>]
  #emph[Exclude an additional finite region.] We show that the first inclusion is equality. Suppose the open set corresponding to $"Fin" \( omega \)$ contains a rectangle $L times U$ not contained in $\( 0 \, 1 \] times V$. Use a scalar test with compact support in $L$ and a cut positive $a$ from the basis supply in $P \( U \)$. The tests may be chosen with slightly enlarged supports still in this rectangle. Their tensor products are then compactly Cuntz supported in $"Fin" \( omega \)$, and consequently have finite $omega$-rank. For any such nonzero scalar test, write $s = f ⊗ a$. If $c in Q \( U_a \)_(+)$ and $epsilon > 0$, (7.27) gives, for suitable finite $M$ and $eta > 0$,
  #[#set math.equation(numbering: n => "(7.31)")
   $ \[ \( c - epsilon \)_(+) \] lt.eq M \[ \( p \( s \) - eta \)_(+) \] quad upright("in ") "Cu" \( D \) . $ <cc:constant-finiteness>]
  It follows that
  $ d_sigma \( \( c - epsilon \)_(+) \) = d_rho \( \( c - epsilon \)_(+) \) lt.eq M d_omega \( s \) < oo . $
  Hence $sigma$ is densely finite on $Q \( U_a \)$, so $U_a subset V$. The supports $U_a$ of these cut tests exhaust $U$. This implies $U subset V$, contradicting the choice of the rectangle. Therefore
  #[#set math.equation(numbering: n => "(7.32)")
   $ "Fin" \( omega \) = S \( V \) = "Fin" \( nu \) . $ <cc:exact-finite-ideal>]
  Both traces take value infinity on positive elements outside this ideal. Together with (7.30), this proves (7.25). The argument also applies when $V$ is empty: there is no finite region to identify, and the retained signal excludes every nonzero additional finite ideal. ◻
]

== 8 Point models and approximate intertwining <pt:section>

We now construct homomorphisms $P arrow.r Q$ and $Q arrow.r P$, and then an isomorphism realizing the prescribed invariant. Cone existence first gives a model on the line. Norm uniqueness makes translation covariant, so the model extends to a crossed product. A trace-normalized projection then gives a point model. A second application of uniqueness makes its late coordinate lifts close modulo unitaries, yielding an actual homomorphism. The final application makes the two compositions approximate identities and completes the intertwining.

The suspension, crossed-product projection, and subsequence extraction also occur in #cite(label("GabeO2")) Remark 6.4. The suspension, crossed-product, and full-corner strategy adapts the proof of #cite(label("Gabe")) Theorem 14.1. The latter theorem has an $cal(O)_oo$-stable target and is not applied directly here. Here each passage must preserve the full extended trace data. We compute the projection’s trace by an identity of finite positive sums, and recover the invariant of the limiting maps through positive cuts. We use $"Ad" \( w \) \( a \) = w a w^(*)$.

=== 8.1 The line and its translation <the-line-and-its-translation>

#thm([Proposition 9.])[
  (A covariant line model).  #emph[There is a model 
$ lambda : C_0 \( bb(R) \) ⊗ P arrow.r D $

 for Lebesgue measure and $F$. Let $alpha \( f \) \( t \) = f \( t - 1 \)$, acting trivially on $P$. For c.p.c. coordinate lifts $lambda_n$, there are unitaries $u_n in M \( Q \)$ such that 
#[#set math.equation(numbering: n => "(8.1)")
 $ parallel "Ad" \( u_n \) \( lambda_n \( s \) \) - lambda_n \( alpha \( s \) \) parallel arrow.r 0 #h(2em) \( s in C_0 \( bb(R) \) ⊗ P \) . $ <pt:coordinate-covariance>]

]
] <pt:suspension>

#proof[
  For $j gt.eq 2$, put $I_j = \( - j \, j \]$ and give it Lebesgue measure. This is a finite full-support cone measure, so 7, transported along a homeomorphism $\( 0 \, 1 \] tilde.equiv I_j$, gives a model $lambda^(\( j \)) : C_0 \( I_j \) ⊗ P arrow.r D$. Choose $0 lt.eq eta_j lt.eq 1$ in $C_c \( \( - j \, j \) \)$, equal to one on $\[ - j + 1 \, j - 1 \]$. The maps
  $ R_j : C_0 \( bb(R) \) ⊗ P arrow.r C_0 \( I_j \) ⊗ P \, #h(2em) R_j \( s \) = eta_j thin s \|_(I_j) \, $
  are c.p.c.: restriction followed by multiplication by the scalar positive contraction $eta_j$ is completely positive and contractive, and its values vanish at the omitted left endpoint. The domain $C_0 \( I_j \) ⊗ P$ of each $lambda^(\( j \))$ is separable and nuclear. The maps $R_j$ are exactly multiplicative on every fixed finite set of compactly supported inputs once $j$ is large enough to contain their supports in the region where $eta_j = 1$.
  Take c.p.c. coordinate lifts of each $lambda^(\( j \))$, by #cite(label("ChoiEffrosLifting")) Theorem 3.10, and compose with $R_j$. Apply 6 to an increasing dense list of compactly supported algebra tests and the elementary rank tests of 3. Here the tests are fixed on the line before increasing $j$: each function, its positive trims, and its enlarged compact support all lie inside $\( - j + 1 \, j - 1 \)$ in every sufficiently late row. Their Lebesgue masses are therefore unchanged by $R_j$. For every sandwich test choose the strict scalar slack, the enlarged source, and the trimmed target before selecting coordinates in that row. The constant Cuntz representatives in $Q$ are the same for all these rows. The fixed target tolerances give the bounded comparison witnesses of 4; thus the row diagonal retains the comparisons in $D$, even when the row thresholds vary. Choose the coordinates for the first $j$ tests only after these choices, with algebra errors at most $j^(- 1)$. The resulting c.p.c. sequence $lambda_n$ is asymptotically multiplicative. Its quotient $lambda$ satisfies the elementary rank identities for every regularized limit, and 3 proves the asserted model identity.
  Lebesgue measure is translation invariant, including the extended product convention. Hence $lambda$ and $lambda compose alpha$ are models for the same data. Apply 4 to their specified coordinate lifts to obtain (8.1). ◻
]

The covariance unitaries belong to $M \( Q \)$, whereas the coordinate model values belong to $Q$. To place them in one unital algebra, let

$ cal(C) = product_(n = 1)^oo M \( Q \) #scale(x: 180%, y: 180%)[\/] xor.big_(n = 1)^oo M \( Q \) . $

The product here consists of bounded sequences and the direct sum of norm-null sequences. There is a natural faithful inclusion $D subset.eq cal(C)$, and $D$ is an ideal in $cal(C)$. The sequence from 9 defines a unitary $u in cal(C)$, and the covariance relation is exact: $"Ad" \( u \) lambda \( s \) = lambda \( alpha \( s \) \)$. Integration of this covariant pair gives a homomorphism

#[#set math.equation(numbering: n => "(8.2)")
 $ Psi : \( C_0 \( bb(R) \) ⊗ P \) times.r_alpha bb(Z) arrow.r D . $ <pt:crossed-map>]

This also applies when $lambda$ is degenerate: in a faithful representation of $cal(C)$ on $cal(H)$, restrict to the reducing subspace $overline(lambda \( C_0 \( bb(R) \) ⊗ P \) cal(H))$, integrate there, and extend by zero. The finite Fourier sums have the form $sum_n lambda \( s_n \) u^n$, which lie in the ideal $D$; norm closure gives the stated target. Because the action on $P$ is trivial and $bb(Z)$ is amenable, the domain is canonically

$ E ⊗ P \, #h(2em) E = C_0 \( bb(R) \) times.r_alpha bb(Z) . $

The identification follows also by matching the commuting representations of $P$ and the covariant representation of $C_0 \( bb(R) \)$. Nuclearity makes the tensor-product norm unambiguous. We denote the canonical implementing multiplier of $E$ by $v$, so $v f v^(*) = alpha \( f \)$.

=== 8.2 An explicit trace-normalized corner <an-explicit-trace-normalized-corner>

For any projection $p in E$, the map $a mapsto p ⊗ a$ is a homomorphism from $P$ to $E ⊗ P$. We seek a projection for which composition with $Psi$ has exactly the point trace data. The next lemma supplies the needed normalization by a finite positive partition identity. It also identifies the corresponding full corner of $E$.

#thm([Lemma 24.])[
  (The corner projection).  #emph[There are $zeta in C_c \( bb(R) \)_(+)$ and a projection $p in E$ such that 
$ sum_(n in bb(Z)) zeta \( t - n \)^2 = 1 \, #h(2em) integral_(bb(R)) zeta \( t \)^2 thin d t = 1 \, $

 and, for any $C^(*)$-algebra $R_0$, any extended trace $omega$ on $E ⊗ R_0$, and every $a in \( R_0 \)_(+)$, 
#[#set math.equation(numbering: n => "(8.3)")
 $ omega \( p ⊗ a \) = omega \( zeta^2 ⊗ a \) . $ <pt:corner-trace>]

 In particular, if the restriction of $omega$ to $C_0 \( bb(R) \) ⊗ R_0$ is Lebesgue measure tensored with $nu$, then $omega \( p ⊗ a \) = nu \( a \)$, including the value infinity. Moreover, $p$ is full and $p E p tilde.equiv C \( bb(R) \/ bb(Z) \)$.]
] <pt:corner>

#proof[
  Choose $eta in C_c \( bb(R) \)_(+)$ strictly positive on $\[ 0 \, 1 \]$, and set
  $ H \( t \) = sum_(n in bb(Z)) eta \( t - n \)^2 \, #h(2em) zeta \( t \) = H \( t \)^(- 1 \/ 2) eta \( t \) . $
  The sum defining $H$ is locally finite, positive, continuous, and one-periodic. The partition identity for $zeta$ follows immediately. Integrating that identity over $\[ 0 \, 1 \]$ gives the asserted normalization. Put
  #[#set math.equation(numbering: n => "(8.4)")
   $ p = sum_(n in bb(Z)) p_n v^n \, #h(2em) p_n \( t \) = zeta \( t \) zeta \( t - n \) . $ <pt:projection-formula>]
  Only finitely many coefficients are nonzero. The involution formula gives $alpha_n \( p_(- n) \) = p_n$, so $p^(*) = p$. Convolution gives, for every $k in bb(Z)$,
  $ \( p^2 \)_k \( t \) = zeta \( t \) zeta \( t - k \) sum_(n in bb(Z)) zeta \( t - n \)^2 = p_k \( t \) . $
  Thus $p$ is a projection.
  Choose finitely many real functions $q_i in C_c \( bb(R) \)$, each supported in an interval of diameter less than one, such that
  $ q := sum_i q_i^2 = 1 quad upright("on ") "supp" \( zeta \) . $
  For completeness, choose bump functions $r_i$ in such intervals whose squared sum is positive near $"supp" \( zeta \)$, and a cutoff $kappa$ equal to one on that support and supported where this sum is positive. Then $q_i = kappa r_i \/ \( sum_j r_j^2 \)^(1 \/ 2)$, extended by zero, have the required properties. The coefficient formula for $p$ yields
  #[#set math.equation(numbering: n => "(8.5)")
   $ q p = p = p q \, #h(2em) sum_i q_i p q_i = zeta^2 . $ <pt:positive-partition>]
  To verify the second identity, its $n$-th coefficient is
  $ zeta \( t \) zeta \( t - n \) sum_i q_i \( t \) q_i \( t - n \) . $
  This vanishes when $n eq.not 0$, because each support has diameter less than one, and equals $zeta \( t \)^2$ when $n = 0$.
  For $a in \( R_0 \)_(+)$, set $y_i = q_i p ⊗ a^(1 \/ 2)$. These are elements of $E ⊗ R_0$, and (8.5) gives the exact positive identities
  $ sum_i y_i^(*) y_i = p ⊗ a \, #h(2em) sum_i y_i y_i^(*) = zeta^2 ⊗ a . $
  Additivity and $omega \( y_i^(*) y_i \) = omega \( y_i y_i^(*) \)$ prove (8.3). There are only finitely many positive summands. In particular, this calculation uses no subtraction of infinite values and requires no finiteness assumption on $omega$. For the Lebesgue trace assertion, the extended product formula on the right has value $\( integral zeta^2 \) nu \( a \) = nu \( a \)$.
  We also verify fullness and the corner description. Equation (8.5) puts $zeta^2$ in $"Ideal"_E \( p \)$. Conjugation by $v^n$ preserves this ideal, so it contains every $alpha_n \( zeta^2 \)$. For $f in C_c \( bb(R) \)$, the partition identity expresses
  $ f = sum_(n in bb(Z)) f thin alpha_n \( zeta^2 \) $
  as a finite sum of elements of that ideal. It therefore contains $C_0 \( bb(R) \)$, and then the dense finite Fourier sums in $E$. Hence $p$ is full.
  For $f in C_c \( bb(R) \)$ and $n in bb(Z)$, direct convolution gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ p \( f v^n \) p = g_(f \, n) p \, #h(2em) g_(f \, n) \( t \) = sum_(k in bb(Z)) zeta \( t - k \) f \( t - k \) zeta \( t - k - n \) . $ <pt:corner-compression>]
  The function $g_(f \, n)$ is continuous and one-periodic. Conversely, for a continuous one-periodic $g$, the element $g p$ belongs to $E$, since all its Fourier coefficients are compactly supported. Periodicity makes $g$ a central multiplier of $E$, so $g p in p E p$, and the map $g mapsto g p$ is a unital homomorphism $C \( bb(R) \/ bb(Z) \) arrow.r p E p$. It is injective: its zeroth coefficient is $g zeta^2$, and every orbit has a point where $zeta eq.not 0$. Equation (8.6) and density of compactly supported Fourier sums prove surjectivity. ◻
]

#thm([Corollary 3.])[
  (Existence of point models).  #emph[There is a homomorphism $phi : P arrow.r Q_oo$ such that 
$ rho compose phi = F \( rho \|_Q \) $

 for every regularized limit $rho$.]
] <pt:point-model>

#proof[
  Use (8.2) and 24 to define $phi \( a \) = Psi \( p ⊗ a \)$. For a regularized limit $rho$, the extended trace $omega = rho compose Psi$ restricts on $C_0 \( bb(R) \) ⊗ P$ to Lebesgue measure tensored with $F \( sigma \)$, where $sigma = rho \|_Q$. Thus, for every $a in P_(+)$,
  $ rho \( phi \( a \) \) = omega \( p ⊗ a \) = omega \( zeta^2 ⊗ a \) = F \( sigma \) \( a \) . $
  The positive partition calculation applies equally when this common value is infinite. ◻
]

=== 8.3 From a point model to an actual map <from-a-point-model-to-an-actual-map>

The coordinate lifts of a point model need not converge. Uniqueness will make their unitary orbits Cauchy on finite sets. We can then conjugate a subsequence so that its successive errors are summable and its limit lies in $Q$.

#thm([Proposition 10.])[
  (An actual homomorphism).  #emph[There is a homomorphism $phi.alt : P arrow.r Q$ satisfying 
$ tau compose phi.alt = F \( tau \) #h(2em) \( tau in T \( Q \) \) \, #h(2em) "Cu" \( phi.alt \) = G . $

 It is injective, and its constant sequence is a point model.]
] <pt:actual-map>

#proof[
  Take c.p.c. lifts $phi_n : P arrow.r Q$ of the point model in 3, using nuclearity and #cite(label("ChoiEffrosLifting")) Theorem 3.10. For every finite $cal(E) subset.eq P$ and every $epsilon > 0$, there is $N$ such that
  #[#set math.equation(numbering: n => "(8.7)")
   $ inf_(w in cal(U) \( M \( Q \) \)) max_(a in cal(E)) parallel "Ad" \( w \) \( phi_m \( a \) \) - phi_n \( a \) parallel < epsilon #h(2em) \( m \, n gt.eq N \) . $ <pt:all-pairs>]
  If this failed, choose pairs $m_k \, n_k arrow.r oo$, with both index sequences strictly increasing, for which the displayed infimum is at least $epsilon$. Every subsequence of a model is a model for the same data: given coordinate traces $tau_k$ on indices $n_k$ and a free ultrafilter $omega$ on $k$, set $tilde(tau)_(n_k) = tau_k$ and use the zero trace at the remaining coordinates. Define $A in tilde(omega)$ if and only if ${ k : n_k in A } in omega$. Then $tilde(omega)$ is a free ultrafilter concentrated on the chosen indices, and every cut ultralimit agrees with the corresponding subsequence ultralimit. Thus $\( phi_(m_k) \)$ and $\( phi_(n_k) \)$ define two point models. 4 contradicts the choice of the pairs.
  Let $cal(E)_k$ be increasing finite sets with dense union in the unit ball of $P$. Use (8.7) to choose an increasing subsequence $n_k$ and $w_k in cal(U) \( M \( Q \) \)$ with
  $ max_(a in cal(E)_k) parallel "Ad" \( w_k \) \( phi_(n_(k + 1)) \( a \) \) - phi_(n_k) \( a \) parallel < 2^(- k) . $
  Choose $n_k$ beyond the threshold for the $k$-th test, so that both indices in this inequality are eligible. Starting with $W_1 = 1$, set $W_(k + 1) = W_k w_k$ and $psi_k = "Ad" \( W_k \) compose phi_(n_k)$. The sequence $psi_k \( a \)$ is Cauchy for every $a$ in the dense union, with summable successive errors, and then for every $a in P$, by contractivity. Its limit $phi.alt : P arrow.r Q$ is c.p.c. and multiplicative, since the multiplicative defects of the original coordinate lifts tend to zero. It is therefore a homomorphism.
  We check the invariant without assuming continuity of unbounded trace evaluation under norm convergence. Fix $tau in T \( Q \)$, and let $rho_tau$ be its regularized constant-coordinate limit. The maps $psi_k$ and the constant map $phi.alt$ give the same homomorphism into $Q_oo$. For every $a in P_(+)$ and every cut tolerance, coordinate unitary invariance gives
  $ tau \( \( psi_k \( a \) - epsilon \)_(+) \) = tau \( \( phi_(n_k) \( a \) - epsilon \)_(+) \) . $
  Regularization and the subsequence model identity therefore imply
  $ tau \( phi.alt \( a \) \) = rho_tau \( \( psi_k \( a \) \)_k \) = F \( tau \) \( a \) . $
  Here $rho_tau \|_Q = tau$ follows from 2. Applying the equality to positive powers gives
  $ d_tau \( phi.alt \( a \) \) = d_(F \( tau \)) \( a \) = d_tau \( G \[ a \] \) . $
  This calculation also applies to finite matrices. If $x = \( x_(i j) \) in M_k \( P \)_(+)$, the unnormalized matrix traces give
  $ \( tau ⊗ "Tr"_k \) \( phi.alt^(\( k \)) \( x \) \) & = sum_i tau \( phi.alt \( x_(i i) \) \) = sum_i F \( tau \) \( x_(i i) \)\
 & = \( F \( tau \) ⊗ "Tr"_k \) \( x \) \, $
  including infinite values. Apply this identity to positive powers and then use positive cuts of finite-matrix approximations in $P ⊗ cal(K)$. Pointwise trace determination in $"Cu" \( Q \)$ gives $"Cu" \( phi.alt \) = G$. Since $G$ is injective, $phi.alt \( a \) = 0$ for positive $a$ implies $\[ a \] = 0$, hence $a = 0$; thus $phi.alt$ is injective. Finally, for any regularized limit $rho$, put $sigma = rho \|_Q$. Its value on the constant map is
  $ rho compose phi.alt = sigma compose phi.alt = F \( sigma \) . $
  So the constant map is itself a point model. ◻
]

=== 8.4 The final intertwining <the-final-intertwining>

#thm([Theorem 8.1.])[
  (Trace-cone classification).  #emph[There is an isomorphism $Phi : P arrow.r Q$ such that 
$ tau compose Phi = F \( tau \) quad \( tau in T \( Q \) \) \, #h(2em) "Cu" \( Phi \) = G . $

 Consequently 1 holds.]
] <pt:intertwining>

#proof[
  Apply 10 to $F$ and to $F^(- 1)$. This gives homomorphisms $phi.alt : P arrow.r Q$ and $psi : Q arrow.r P$ with inverse trace and Cuntz data. Their compositions have identity trace data. The constant maps $psi phi.alt$ and $"id"_P$ are therefore point models for the same data, and similarly for $phi.alt psi$ and $"id"_Q$. By 4, the compositions can be conjugated arbitrarily close to the corresponding identity on each finite set. We give the intertwining construction to ensure that the conclusion is an isomorphism in $P \, Q$.
  Fix increasing finite sets $cal(P)_n \, cal(Q)_n$ with dense unions in the unit balls, and put $epsilon_n = 2^(- n)$. Start with $f_1 = phi.alt$, $g_0 = psi$, and empty $cal(E)_0 \, cal(F)_0$. Suppose $f_n$ and $g_(n - 1)$ have been chosen. Choose a finite set
  $ cal(E)_n supset.eq cal(E)_(n - 1) union cal(P)_n union g_(n - 1) \( cal(F)_(n - 1) \) . $
  The composition $g_(n - 1) f_n$ still has identity trace data, because every adjustment made below is unitary conjugacy. Choose $v_n in cal(U) \( M \( P \) \)$, and set $g_n = "Ad" \( v_n \) compose g_(n - 1)$, so that
  #[#set math.equation(numbering: n => "(8.8)")
   $ parallel g_n f_n \( a \) - a parallel < epsilon_n #h(2em) \( a in cal(E)_n \) . $ <pt:left-intertwining>]
  Next choose a finite set
  $ cal(F)_n supset.eq cal(F)_(n - 1) union cal(Q)_n union f_n \( cal(E)_n \) . $
  Choose $z_n in cal(U) \( M \( Q \) \)$, and set $f_(n + 1) = "Ad" \( z_n \) compose f_n$, with
  #[#set math.equation(numbering: n => "(8.9)")
   $ parallel f_(n + 1) g_n \( b \) - b parallel < epsilon_n #h(2em) \( b in cal(F)_n \) . $ <pt:right-intertwining>]
  This second adjustment is possible by the same identity-data argument for $f_n g_n$.
  The inclusions of the image tests make these sequences Cauchy. If $a in cal(E)_n$, contractivity and (8.8)–(8.9) give
  $ parallel f_(n + 1) \( a \) - f_n \( a \) parallel & lt.eq parallel f_(n + 1) \( a - g_n f_n \( a \) \) parallel\
 & quad + parallel f_(n + 1) g_n \( f_n \( a \) \) - f_n \( a \) parallel < 2 epsilon_n . $
  If $n gt.eq 2$ and $b in cal(F)_(n - 1)$, then $g_(n - 1) \( b \) in cal(E)_n$, and
  $ parallel g_n \( b \) - g_(n - 1) \( b \) parallel & lt.eq parallel g_n \( b - f_n g_(n - 1) \( b \) \) parallel\
 & quad + parallel g_n f_n \( g_(n - 1) \( b \) \) - g_(n - 1) \( b \) parallel < epsilon_(n - 1) + epsilon_n . $
  These summable bounds and density give point-norm limits $f_oo : P arrow.r Q$ and $g_oo : Q arrow.r P$, both homomorphisms. Equations (8.8) and (8.9) imply
  $ g_oo f_oo = "id"_P \, #h(2em) f_oo g_oo = "id"_Q . $
  For example, contractivity controls the moving input $f_n \( a \)$ by its limit $f_oo \( a \)$, after which point-norm convergence of $g_n$ applies to the fixed limit input. Density gives these equalities on the whole algebras. Thus $f_oo$ is the required isomorphism.
  The isomorphism realizes the prescribed trace data as well. Each $f_n$ has Cuntz data $G$, since the changes to $phi.alt$ are unitary conjugacies. For $a in P_(+)$ and $epsilon > 0$, choose $n$ with $parallel f_n \( a \) - f_oo \( a \) parallel < epsilon$. Positive cut comparison gives, for every $tau in T \( Q \)$,
  $ d_(F tau) \( \( a - epsilon \)_(+) \) lt.eq d_tau \( f_oo \( a \) \) \, #h(2em) d_tau \( \( f_oo \( a \) - epsilon \)_(+) \) lt.eq d_(F tau) \( a \) . $
  Taking the supremum over cuts proves equality of ranks; spectral integration gives $tau compose f_oo = F \( tau \)$, including infinite values. This argument uses no continuity of an unbounded weight on an uncut norm-convergent sequence. The matrix argument in 10 also gives $"Cu" \( f_oo \) = G$. Set $Phi = f_oo$. Substituting $P = A ⊗ cal(W) ⊗ cal(K)$ and $Q = B ⊗ cal(W) ⊗ cal(K)$ proves 1. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
