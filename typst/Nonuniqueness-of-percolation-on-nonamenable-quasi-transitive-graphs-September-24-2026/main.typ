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

#align(center)[#text(size: 16pt, weight: "bold")[Nonuniqueness of percolation on \
nonamenable quasi-transitive graphs]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Bernoulli bond percolation on an infinite graph can have two distinct transitions. Infinite open clusters first appear at a critical parameter $p_c$; uniqueness begins at a second threshold $p_u$. On a nonamenable graph, the expanding geometry can keep infinite clusters apart even after percolation has begun. Benjamini and Schramm conjectured that this mechanism always produces a nonempty nonuniqueness phase when the graph has finitely many vertex orbits #cite(label("BenjaminiSchramm1996")) Conjecture 6. We prove this conjecture for Bernoulli bond percolation, together with the stronger strict inequality for the $ell^2$ operator threshold conjectured by Hutchcroft. This is the equivalent $ell^2$ formulation of his operator-threshold conjecture #cite(label("Hutchcroft2019")) Proposition 2.3 and Conjecture 6.1.

=== 1.1 The graph, the thresholds, and the main result <the-graph-the-thresholds-and-the-main-result>

Let $G = \( V \, E \)$ be an infinite connected locally finite undirected graph. It is #emph[quasi-transitive] if its automorphism group $"Aut" \( G \)$ has finitely many orbits on $V$. In particular its vertex degrees are uniformly bounded. For a finite nonempty set $A subset V$, write

$ partial_V A = { v in V \\ A : v tilde.op a upright(" for some ") a in A } \, #h(2em) h_V \( G \) = inf_(0 < \| A \| < oo) frac(\| partial_V A \|, \| A \|) . $

The graph is #emph[nonamenable] if $h_V \( G \) > 0$. For a bounded-degree graph this is equivalent to positivity of the edge isoperimetric constant. Loops and multiple edges may be allowed; a subdivision reduction in 1 permits the main proof to use a simple graph.

Under $bb(P)_p$, every unordered edge is independently open with probability $p$. Write $C_x$ for the open cluster of $x$, and $x arrow.l.r y$ for connection by a finite open path. Paths of length zero are allowed. If $N_oo \( p \)$ is the number of infinite open clusters, define

$ p_c \( G \) & = inf { p in \[ 0 \, 1 \] : bb(P)_p \( N_oo \( p \) gt.eq 1 \) > 0 } \,\
p_u \( G \) & = inf { p in \[ 0 \, 1 \] : bb(P)_p \( N_oo \( p \) = 1 \) = 1 } . $

The two-point connection kernel is $T_p \( x \, y \) = bb(P)_p \( x arrow.l.r y \)$. We equip $V$ with counting measure and put

$ ell^2 \( V \) = {f : V arrow.r bb(C) : sum_(x in V) \| f \( x \) \|^2 < oo} \, #h(2em) \( T_p f \) \( x \) = sum_(y in V) T_p \( x \, y \) f \( y \) $

initially for finitely supported $f$. Boundedness of $T_p$ means that this action extends to a bounded operator on $ell^2 \( V \)$. Its threshold is

$ p_(2 arrow.r 2) \( G \) = sup { p in \[ 0 \, 1 \] : T_p upright(" is bounded on ") ell^2 \( V \) } . $

All operator norms in this paper use counting measure, including operators restricted to a vertex orbit. The weights introduced later average the choice of root and define a finite trace; they do not change the Hilbert-space measure.

#thm([Theorem 1.1.])[
  #emph[Let $G$ be an infinite connected locally finite quasi-transitive graph with $h_V \( G \) > 0$. For Bernoulli bond percolation on $G$, 
$ sup_(0 lt.eq p < p_c) lr(bar.v.double T_p bar.v.double)_(2 arrow.r 2) = lr(bar.v.double T_(p_c) bar.v.double)_(2 arrow.r 2) < oo \, #h(2em) p_c \( G \) < p_(2 arrow.r 2) \( G \) lt.eq p_u \( G \) . $

 There exist $p_c < p_1 < p_2 < 1$ such that, in the coupling obtained from independent uniform edge labels, almost surely there are infinitely many infinite open clusters simultaneously for every $p in \[ p_1 \, p_2 \]$.]
] <thm:main>

The theorem resolves the bond-percolation nonuniqueness conjecture of Benjamini and Schramm positively, and proves Hutchcroft’s stronger operator-threshold conjecture in the same graph class. The bounds and the interval may depend on $G$. The simultaneous conclusion is a consequence of the strict gap, in accordance with the simultaneous phase theorem of Häggström, Peres, and Schonmann #cite(label("HaggstromPeresSchonmann1999")) Theorem 1.3. We include a direct proof for the compact interval asserted here.

#thm([Corollary 1.])[
  (Arbitrary Cayley graphs).  #emph[Let $Lambda$ be a nonamenable finitely generated group, and let $S$ be any finite symmetric generating set with the identity removed. For Bernoulli bond percolation on the simple undirected Cayley graph with edges ${ x \, x s }$, $x in Lambda$, $s in S$, the critical connection operator is bounded on counting-measure $ell^2 \( Lambda \)$ and 
$ p_c < p_(2 arrow.r 2) lt.eq p_u . $

 The simultaneous nonuniqueness interval in 1 exists for every such fixed generating set. At every fixed $p in \( p_c \, p_u \)$, there are almost surely infinitely many infinite open clusters.]
] <cor:cayley>

#proof[
  Left translations act transitively on this locally finite graph. The graph form of the Følner criterion gives positive isoperimetric constant for every fixed finite generating set of a nonamenable group. Apply 1. The final assertion follows from the phase theorem #cite(label("HaggstromPeresSchonmann1999")) Theorem 1.3. ◻
]

=== 1.2 Proof strategy <proof-strategy>

For $p in \[ 0 \, 1 \]$, write

$ chi_x \( p \) = bb(E)_p \| C_x \| = sum_y T_p \( x \, y \) \, #h(2em) chi_max \( p \) = sup_x chi_x \( p \) \, $

for the susceptibility and its supremum over vertices. These quantities are finite for $p < p_c$ by sharpness (8). The row sums bound the operator norm, but that bound need not remain finite as $p arrow.t p_c$. Our task is to control $lr(bar.v.double T_(p_c) bar.v.double)_(2 arrow.r 2)$ independently of these row sums. The proof first bounds their near-critical growth and then constructs a deformation that reduces row sums while retaining a large operator norm. The nonunimodular case follows from Hutchcroft’s established operator theorem. After the reductions in 2, the new argument therefore concerns a simple graph with a unimodular automorphism group. Its critical clusters are finite by the critical-nonpercolation theorem recalled there.

===== 1.2.1 From local endpoint maps to critical moments. <from-local-endpoint-maps-to-critical-moments.>

A local endpoint map is a randomized rule that either fails or selects a vertex in the root’s critical open cluster, with a fixed cap $M$ on that whole cluster. The roots and selected vertices lie in one vertex orbit. Let $u$ be its success probability, and let $K \( x \, y \)$ be the probability of selecting $y$ conditional on success at $x$. If some critical moment of order $0 < alpha < 1 \/ 2$ were infinite, 4 would construct such maps with $0 < lr(bar.v.double  bar.v.double) K < 1$ and

$ frac(log \( 1 \/ u \) + log M, log \( 1 \/ lr(bar.v.double  bar.v.double) K \)) arrow.r 0 . $

Thus the endpoint kernel becomes dispersive much faster than the success probability deteriorates or the cap grows.

The construction exchanges finite pieces between independent percolation fields. The geometric input, proved in 3, holds outside a stretched-exponentially small event: after any vertex deletion from a capped critical cluster, it bounds the number of bridges separating two vertices in each remaining component that has an open contact with the deleted set, in terms of its number of contacts. An inverse comparison and a joint second-moment bound in 4 control the multiplicity of the exchanges and keep the output mass from concentrating on rare fields. In 5, each fixed map is run just below $p_c$. Its small operator norm forces its iterates to send substantial endpoint mass outside an independently sampled cluster whose law is weighted by its size. Comparing the susceptibility in that deleted domain with the full susceptibility gives a differential inequality. A finite-exploration comparison with critical percolation then contradicts the assumed divergent moment. This proves

$ sup_x bb(E)_(p_c) \| C_x \|^alpha < oo quad \( 0 < alpha < 1 \/ 2 \) . $

A separate decision-tree argument in the same section converts these moments into

$ chi_max \( p \) lt.eq C_eta \( p_c - p \)^(- 1 - eta) #h(2em) upright("for every ") eta > 0 . $

===== 1.2.2 A subpower triangle bound. <a-subpower-triangle-bound.>

The next quantity is the triangle diagram

$ nabla_p \( x \) = sum_(y \, z) T_p \( x \, y \) T_p \( y \, z \) T_p \( z \, x \) . $

6 compares two explorations of a cluster, one in the full graph and one after another cluster has been removed. The difference of their centered edge scores—sums of tested edge bits after subtracting their means—counts the closed contacts between the clusters. Concentration of the scores and the fractional moments above bound those contacts. A differential inequality for the type average of the triangle diagram then yields

$ sup_x nabla_p \( x \) lt.eq C_eta \( p_c - p \)^(- eta) #h(2em) upright("for every ") eta > 0 . $

The supremum and type-average forms are equivalent up to fixed constants because there are finitely many vertex types. This subpower bound is the remaining input to the deformation argument.

===== 1.2.3 Corridor deformation and the spectral contradiction. <corridor-deformation-and-the-spectral-contradiction.>

A corridor is a simple open path whose internal vertices have no other open incident edges. For fixed $p < p_c$, 7 penalizes a connection for each specified corridor all of whose edges are pivotal for it. Raw paths of length $k$ from a symmetric lazy walk specify these corridors by loop erasure; the penalty weights cancel the probabilities of forcing their open edges and closed boundaries.

Nonamenability gives the walk an $ell^2$ norm $rho < 1$. After deformation time $t$, the norm of the connection kernel loses at most $2 t rho^k lr(bar.v.double T_p bar.v.double)^2$. Up to an explicit time-dependent factor, the rate of decrease of its averaged row sum is bounded below by an average of products of the deformed susceptibilities, or weighted row sums, at the two corridor endpoints in the graph with the corridor interior deleted, apart from an error bounded by a constant times $chi_max \( p \)^2 rho^k sup_x nabla_p \( x \)$. 8 finds a positive proportion of raw paths for which both endpoint row sums remain substantial. Geodesic segments at the two ends provide escapes from the raw path, and random-walk smoothing makes the effect of deleting the corridor small at the escape endpoints.

If $T_(p_c)$ were unbounded, sprinkling would imply $lr(bar.v.double T_p bar.v.double) gt.eq c \( p_c - p \)^(- 1)$. The preceding susceptibility bound would make $chi_max \( p \) \/ lr(bar.v.double T_p bar.v.double)$ subpower as well. In 9, these estimates permit a length $k = o \( log \( 1 \/ \( p_c - p \) \) \)$ for which the norm stays large while the averaged row sum decreases quadratically in its own size. The row sum would become too small to bound the surviving operator norm. This contradiction proves critical boundedness. Sprinkling then gives $p_c < p_(2 arrow.r 2)$, the uniqueness comparison gives $p_(2 arrow.r 2) lt.eq p_u$, and a finite-modification argument supplies the simultaneous interval in 1.

=== 1.3 Critical behavior and exponential connectivity <critical-behavior-and-exponential-connectivity>

The operator conclusion gives more than the separation of the two percolation thresholds. It also determines the powers governing the size and radius of critical clusters, and ensures that two-point connections still decay exponentially in part of the supercritical phase. We state these consequences using the following observables. The triangle diagram $nabla_p \( v \)$ and susceptibility $chi_v \( p \)$ were defined above; either may be infinite. For $p in \[ 0 \, 1 \]$ and $v in V$, write

$ theta_v \( p \) = bb(P)_p \( \| C_v \| = oo \) \, $

and let $G \[ p \]$ be the open spanning subgraph. The extrinsic and intrinsic radii of the cluster of $v$ are

$ "rad"_(upright("ext")) \( C_v \) = sup_(x in C_v) "dist"_G \( v \, x \) \, #h(2em) "rad"_(upright("int")) \( C_v \) = sup_(x in C_v) "dist"_(G \[ p \]) \( v \, x \) \, $

with values in $\[ 0 \, oo \]$. Thus the intrinsic radius measures distance along open paths, whereas the extrinsic radius uses the ambient graph.

Say that connection probabilities at $p$ decay exponentially if there are constants $0 < A < oo$ and $a > 0$ such that $T_p \( x \, y \) lt.eq A e^(- a "dist"_G \( x \, y \))$ for every $x \, y in V$, and define

$ p_exp \( G \) = sup { p in \[ 0 \, 1 \] : upright("connection probabilities at ") p upright(" decay exponentially") } . $

This is the exponential-connectivity threshold of #cite(label("Hutchcroft2020L2")) Section 2. We write $f asymp g$ in a stated limit when $c g lt.eq f lt.eq C g$ sufficiently near that limit for some constants $0 < c lt.eq C < oo$.

#thm([Corollary 2.])[
  (Critical laws and exponential connectivity).  #emph[Let $G$ be an infinite connected locally finite quasi-transitive graph with $h_V \( G \) > 0$. For Bernoulli bond percolation on $G$, 
#[#set math.equation(numbering: n => "(1.1)")
 $ nabla_(p_c) \( v \) lt.eq lr(bar.v.double T_(p_c) bar.v.double)_(2 arrow.r 2)^3 < oo #h(2em) upright("for every ") v in V . $ <eq:critical-triangle>]

 For every $v in V$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ chi_v \( p \) & asymp \( p_c - p \)^(- 1) &  & \( p arrow.t p_c \) \,\
theta_v \( p \) & asymp p - p_c &  & \( p arrow.b p_c \) \,\
bb(P)_(p_c) \( \| C_v \| gt.eq n \) & asymp n^(- 1 \/ 2) &  & \( n arrow.r oo \) \,\
bb(P)_(p_c) #scale(x: 120%, y: 120%)[\(] "rad"_(upright("int")) \( C_v \) gt.eq n #scale(x: 120%, y: 120%)[\)] & asymp n^(- 1) &  & \( n arrow.r oo \) \,\
bb(P)_(p_c) #scale(x: 120%, y: 120%)[\(] "rad"_(upright("ext")) \( C_v \) gt.eq n #scale(x: 120%, y: 120%)[\)] & asymp n^(- 1) &  & \( n arrow.r oo \) . $ <eq:meanfield-chi>]

 Here $n$ tends through positive integers. The comparison constants and the one-sided neighborhoods of $p_c$ may depend on $G$ and $v$. Moreover, 
#[#set math.equation(numbering: n => "(1.3)")
 $ p_c \( G \) < p_(2 arrow.r 2) \( G \) lt.eq p_exp \( G \) . $ <eq:exponential-threshold>]

 For each fixed $p in \[ 0 \, p_(2 arrow.r 2) \( G \) \)$, there are constants $0 < A_(G \, p) < oo$ and $a_(G \, p) > 0$ such that 
#[#set math.equation(numbering: n => "(1.4)")
 $ T_p \( x \, y \) lt.eq A_(G \, p) e^(- a_(G \, p) "dist"_G \( x \, y \)) #h(2em) upright("for every ") x \, y in V . $ <eq:exponential-connectivity>]

]
] <cor:critical-laws>

The triangle-condition assertion and the strict inequality $p_c < p_exp$ verify Conjectures 1.2 and 2.1 of #cite(label("Hutchcroft2020L2")). In particular, exponential connectivity persists at $p_c$ and throughout the nonempty interval $\( p_c \, p_(2 arrow.r 2) \)$, even though infinite clusters already exist there. The power laws are applications of earlier conditional theorems: the new input is that the operator condition holds on every graph in the stated class. We give the deduction, including the graph conventions and the distinction between intrinsic and extrinsic radius, in 10.

=== 1.4 Historical context and the methods used here <historical-context-and-the-methods-used-here>

The distinction between existence of an infinite cluster and its uniqueness is central to the program initiated by Benjamini and Schramm #cite(label("BenjaminiSchramm1996")). Their formulation uses almost transitive graphs, meaning the quasi-transitive graphs considered here. Their standing model is site percolation, and they explicitly extend their nonplanar questions to bond percolation on page 72. A regular tree of degree at least three supplies the basic example of separated thresholds. The difficulty is to extract an equally robust separation from nonamenability alone, without a tree structure or an additional geometric hypothesis.

Several earlier results identify additional geometry that guarantees nonuniqueness. Benjamini and Schramm proved $0 < p_c < p_u < 1$ for one-ended nonamenable transitive planar graphs, for both bond and site percolation #cite(label("BenjaminiSchramm2001")) Theorem 1.1. Their result followed Lalley’s work on site percolation on canonical graphs of cocompact Fuchsian groups #cite(label("Lalley1998")). Schonmann established multiple phase transitions in a quantitatively highly nonamenable regime #cite(label("Schonmann2001")). Nachmias and Peres proved nonuniqueness and triangle estimates for nonamenable transitive graphs of sufficiently large girth relative to their spectral radius #cite(label("NachmiasPeres2012")). These results explain the usefulness of geometric separation and random-walk decay, while imposing conditions beyond nonamenability.

A different approach uses harmonic functions of finite Dirichlet energy. Gaboriau proved $p_c < p_u$ for unimodular transitive graphs admitting a nonconstant harmonic Dirichlet function, using $ell^2$ Betti numbers, and extended the argument to quasi-transitive graphs #cite(label("Gaboriau2005")) Theorem 0.6 and Section 5. This supplies a further class in which nonuniqueness follows from a hypothesis stronger than nonamenability alone.

For Cayley graphs, the quantifier over generating sets is significant. Pak and Smirnova-Nagnibeda proved nonuniqueness for a suitable generating multiset #cite(label("PakSmirnovaNagnibeda2000")). Thom proved that a suitable ordinary finite symmetric generating set exists #cite(label("Thom2015")) Corollary 8. These results permit a choice of generators; 1 treats an arbitrary prescribed generating set. The quasi-transitive theorem also permits several vertex orbits and nontrivial vertex stabilizers, for which group coordinates are not available.

Critical nonpercolation is a separate established input. Benjamini, Lyons, Peres, and Schramm proved that critical percolation on every nonamenable Cayley graph has no infinite clusters, and explained the extension to unimodular quasi-transitive graphs #cite(label("BLPS1999")) Theorem 1.1 and Section 2. Hutchcroft established this conclusion on every connected locally finite quasi-transitive graph of exponential growth #cite(label("Hutchcroft2016")) Theorem 1.2. Positive isoperimetry implies exponential growth, so the latter theorem gives the finite critical clusters on which our local constructions operate.

The behavior of infinite clusters in a common coupling has its own history. Häggström and Peres proved uniqueness monotonicity and simultaneous phase statements under unimodularity #cite(label("HaggstromPeres1999")). Schonmann established stability and uniqueness monotonicity for all quasi-transitive graphs #cite(label("Schonmann1999")). Häggström, Peres, and Schonmann then proved simultaneous phase counts away from the two threshold values in that generality #cite(label("HaggstromPeresSchonmann1999")) Theorem 1.3. These results identify the probabilistic consequences of a strict threshold gap; establishing that gap is the task here.

Hutchcroft introduced and developed the operator-threshold framework used here, proved $p_c < p_(2 arrow.r 2)$ for nonamenable Gromov hyperbolic quasi-transitive graphs, and proved it for graphs admitting a quasi-transitive nonunimodular automorphism group #cite(label("Hutchcroft2019")) Section 2 and Theorems 2.1 and 2.9. The nonunimodular result builds on his tilted approach to nonuniqueness and mean-field criticality #cite(label("Hutchcroft2020Nonunimodular")) Theorem 1.2; the stronger operator form used here is Theorem 2.9 of #cite(label("Hutchcroft2019")). Choi and Seo subsequently obtained nonuniqueness and the triangle condition for every Cayley graph of a finitely generated acylindrically hyperbolic group by extending Hutchcroft’s geometric criteria #cite(label("ChoiSeo2025")) Theorems A and B. The nonunimodular theorem is used directly in our reduction. The new argument therefore concerns a unimodular action. Its averaging over vertex types uses the inverse stabilizer-volume weights from the mass-transport theory of Benjamini, Lyons, Peres, and Schramm #cite(label("BLPS1999Invariant")) Corollary 3.5. The corresponding root law and operator trace fit the general framework of Aldous and Lyons #cite(label("AldousLyons2007")) Theorem 3.1 and Section 5. We prove the specific transport and trace identities needed below.

Hutchcroft developed the critical and supercritical consequences of the operator condition in #cite(label("Hutchcroft2020L2")). His Theorem 2.2 compares the operator and exponential-connectivity thresholds, and his Theorem 3.1 gives the critical extrinsic-radius law under the strict operator gap. The critical intrinsic-radius upper bound has its origin in the lattice theorem of Kozma and Nachmias #cite(label("KozmaNachmias2009")) Theorem 1.2(ii). Hutchcroft’s later finite-cluster theorem supplies both radius estimates in the quasi-transitive setting under the operator condition #cite(label("Hutchcroft2022FiniteClusters")) Theorem 1.2. These are the conditional geometric results applied in 10. The upper comparison $p_(2 arrow.r 2) lt.eq p_u$ can be an equality. Hutchcroft and Pan proved $p_(2 arrow.r 2) = p_u$ for the Cartesian product of a regular tree of degree at least three with an infinite amenable Cayley graph #cite(label("HutchcroftPan2024Dimension")) Theorem 1.2. Thus the strict lower comparison established here is compatible with a sharp upper endpoint.

Our probabilistic estimates use Harris’s association inequality and the van den Berg–Kesten inequality for disjoint open witnesses #cite(label("Harris1960")) #cite(label("VanDenBergKesten1985")). Subcritical susceptibility finiteness is obtained by adapting the finite-set sharpness argument of Duminil-Copin and Tassion #cite(label("DuminilCopinTassion2016")) Section 1 to finitely many vertex types. Sharpness originates in the independent work of Aizenman–Barsky and Menshikov #cite(label("AizenmanBarsky1987")) #cite(label("Menshikov1986")); Antunović and Veselić proved the full quasi-transitive susceptibility and exponential-tail statements #cite(label("AntunovicVeselic2008")). The subsequent conversion of critical cluster-size estimates into near-critical susceptibility estimates uses independent vertex marks and a decision-tree covariance inequality of O’Donnell, Saks, Schramm, and Servedio #cite(label("ODonnellSaksSchrammServedio2005")) Section 3.3, Equation (6). This is the same critical-tail-to-susceptibility principle developed by Hutchcroft #cite(label("Hutchcroft2020Exponents")) Theorem 1.1; we give the needed proof uniformly over vertex types and induced domains. The sprinkling comparison that finally opens an interval above $p_c$ is the connection-operator expansion of #cite(label("Hutchcroft2019")) Lemma 2.4, also proved here.

The contact estimates also have a close methodological antecedent in Hutchcroft’s two-ghost inequalities and their critical-tail refinements #cite(label("Hutchcroft2020Locality")) #cite(label("Hutchcroft2021PowerLaw")). Those arguments use independent marks, cluster exploration, and centered edge scores, following the fluctuation method of Aizenman, Kesten, and Newman #cite(label("AizenmanKestenNewman1987")). Here we compare a full-cluster exploration with an exploration in a deleted domain to control the number of closed contacts between two clusters. The triangle diagram and positive connection matrix belong to the tree-graph framework of Aizenman and Newman #cite(label("AizenmanNewman1984")); the triangle-condition work of Barsky–Aizenman and the subsequent quantitative development by Hutchcroft provide further context #cite(label("BarskyAizenman1991")) #cite(label("Hutchcroft2022Triangle")). Our required subpower trace bound and its use in the corridor comparison are proved below.

Finite modifications that join separated clusters, create pivotal edges, and control the multiplicity of their preimages already appear in Kozma’s work on products of trees #cite(label("Kozma2011")) Section 1.4 and Lemmas 7–11. Our local endpoint maps exchange finite pieces between independent percolation fields; the deletion-uniform bridge bounds and paired inverse estimate needed for these exchanges are proved here. Together with the deformation that penalizes forced pivotal corridors, these maps let us compare the spreading of a connection kernel in $ell^2$ with the total mass of its rows. Both constructions are formulated through covariant kernels on vertex orbits.

== 2 Preliminaries and the unimodular reduction <pre:section>

Throughout the proof, all operator norms refer to counting-measure $ell^2 \( V \)$. A kernel is called invariant if its value at $\( g x \, g y \)$ equals its value at $\( x \, y \)$ for every automorphism $g$. For a vertex set $D$, the same letter denotes the induced subgraph on $D$. Write $C_x^D$ for the open cluster of $x$ in $D$, and put

$ C_x = C_x^V \, #h(2em) s_x = \| C_x \| \, #h(2em) T_p^D \( x \, y \) = bb(P)_p \( x arrow.l.r y upright(" in ") D \) \, #h(2em) T_p = T_p^V . $

Quantities requiring a vertex outside their domain are defined to be zero. We use $partial_E A$ for the set of edges with exactly one endpoint in $A$, and $"Nb" \[ A \]$ for $A$ together with all its neighbors.

=== 2.1 Graph reductions and the two established inputs <pre:reductions>

#thm([Lemma 1.])[
  (Reduction to simple graphs).  #emph[It suffices to prove the operator gap and the infinite-cluster conclusion for simple graphs satisfying the hypotheses of 1.]
] <pre:simple-reduction>

#proof[
  Loops never affect connectivity and may be removed. Replace each remaining edge of $G$, including each copy of a multiple edge, by a two-edge path through its own new vertex, obtaining a simple graph $tilde(G)$. Quasi-transitivity and local finiteness give a finite degree bound $d_0$ and finitely many edge orbits in $G$. The lifted automorphisms consequently have finitely many vertex orbits in $tilde(G)$.
  To verify nonamenability, let a finite set $A$ in $tilde(G)$ contain $n$ old vertices and $m$ new vertices. Each distinct boundary neighbor in $G$ of its old-vertex set supplies a distinct boundary vertex of $A$: along a selected subdivided edge, use the new vertex if it is outside $A$, and otherwise use the old boundary neighbor. Hence $\| partial_V A \| gt.eq h_V \( G \) n$. At most $d_0 n$ selected new vertices have an endpoint among the selected old vertices. If $m > 2 d_0 n$, more than $m \/ 2$ selected new vertices have both endpoints outside $A$; bounded degree then gives $\| partial_V A \| gt.eq m \/ \( 2 d_0 \)$. The first estimate when $m lt.eq 2 d_0 n$ and the second otherwise give a positive lower bound for $\| partial_V A \| \/ \( n + m \)$, independent of $A$.
  In percolation of parameter $t$ on $tilde(G)$, declare an original edge open precisely when both its replacement edges are open. These independent declarations have parameter $t^2$. Infinite clusters correspond bijectively: a cluster with only finitely many old vertices is finite by local finiteness. In particular
  $ p_c \( tilde(G) \)^2 = p_c \( G \) \, #h(2em) p_u \( tilde(G) \)^2 = p_u \( G \) . $
  Moreover, $T_(t^2)^G$ is the old-vertex compression of $T_t^(tilde(G))$. Boundedness of the latter implies boundedness of the former. Thus a strict operator gap, and a coupled interval of infinitely many infinite clusters, both transfer to $G$. ◻
]

We henceforth assume that $G$ is simple and fix an integer $d$ bounding its degrees. Write $"Adj" \( x \, y \) = upright(bold(1))_({ x tilde.op y })$ for its adjacency kernel. Positive vertex isoperimetry supplies a constant $iota > 0$ such that $\| partial_E A \| gt.eq iota \| A \|$ for every finite nonempty $A$.

#thm([Lemma 2.])[
  (Critical finiteness).  #emph[We have $0 < p_c < 1$. At $p_c$, all open clusters are finite almost surely, simultaneously at every vertex and in every induced subgraph under restriction of the full configuration.]
] <pre:critical-finiteness>

#proof[
  There are at most $d^n$ length-$n$ paths from a fixed vertex, so no infinite cluster exists when $p d < 1$. For the opposite bound, the number of connected vertex sets of size $n$ containing a fixed vertex is at most $d^(2 n)$: choose a deterministic spanning tree of each set and encode it by a traversal of length $2 n - 2$. If such a set is the root cluster, all its boundary edges are closed. Consequently
  $ bb(P)_p \( \| C_x \| < oo \) lt.eq sum_(n gt.eq 1) d^(2 n) \( 1 - p \)^(iota n) < 1 $
  when $p$ is sufficiently close to $1$.
  For every graph-distance ball,
  $ \| B \( x \, r + 1 \) \| gt.eq \( 1 + h_V \( G \) \) \| B \( x \, r \) \| \, $
  so $G$ has exponential growth. Hutchcroft’s critical-finiteness theorem for connected locally finite quasi-transitive graphs of exponential growth #cite(label("Hutchcroft2016")) Theorem 1.2 therefore applies to bond percolation on $G$. Countability gives simultaneous finiteness at all vertices. Every cluster in a restricted configuration is contained in a full-graph cluster, proving the last assertion. ◻
]

=== 2.2 Product inequalities and operator bounds <pre:product-tools>

The first two assertions below are Harris’s association inequality #cite(label("Harris1960")) and the van den Berg–Kesten (BK) inequality #cite(label("VanDenBergKesten1985")). We include the product-measure proofs.

#thm([Lemma 3.])[
  (Association, disjoint witnesses, and the tree bound).  #emph[Increasing nonnegative functions of independent percolation bits have nonnegative covariance. If increasing events have disjoint finite open witnesses, their joint disjoint-occurrence probability is at most the product of their probabilities. In particular, for all $x \, y \, z$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ bb(P)_p \( x arrow.l.r y \, med x arrow.l.r z \) lt.eq sum_w T_p \( x \, w \) T_p \( w \, y \) T_p \( w \, z \) . $ <eq:s01>]

 The same assertions hold in every induced domain.]
] <pre:probability-tools>

#proof[
  For association in a finite product, condition on the last bit and use induction. The two conditional means are increasing functions of that bit, whose covariance is nonnegative. Truncation and conditional expectations on increasing finite coordinate sets extend this argument to the countable product and to nonnegative functions.
  Here is a finite-product proof of the disjoint-witness inequality. For two increasing events $A \, B$, denote disjoint occurrence by $A square.stroked B$. Suppose first that $p lt.eq 1 \/ 2$, and let $A_0 \, A_1$ and $B_0 \, B_1$ be the sections at the last bit. Write $D_(i j) = A_i square.stroked B_j$. The zero-section of $A square.stroked B$ is contained in $D_00$; its one-section is contained in $D_10 union D_01$. Also $D_00 subset.eq D_10 ∩ D_01$. Thus
  $ bb(P) \( A square.stroked B \) lt.eq \( 1 - 2 p \) bb(P) \( D_00 \) + p bb(P) \( D_10 \) + p bb(P) \( D_01 \) . $
  Apply induction, putting $a_i = bb(P) \( A_i \)$ and $b_i = bb(P) \( B_i \)$. The difference between $bb(P) \( A \) bb(P) \( B \)$ and the resulting upper bound is $p^2 \( a_1 - a_0 \) \( b_1 - b_0 \) gt.eq 0$. For $1 \/ 2 < p < 1$, realize each bit as the logical OR of $m$ independent bits of parameter $q = 1 - \( 1 - p \)^(1 \/ m) lt.eq 1 \/ 2$. Disjoint open witnesses lift to disjoint open witnesses in the enlarged product. The cases $p = 0 \, 1$ are immediate. Iteration proves the assertion for any finite number of events, and exhaustion proves the finite-witness assertion on $G$.
  On ${ x arrow.l.r y \, med x arrow.l.r z }$, take a finite open tree joining the three vertices. Its branch vertex $w$ supplies three edge-disjoint paths to $x \, y \, z$, with zero-length paths permitted. A union bound over $w$, followed by the disjoint-witness inequality, gives (2.1). ◻
]

The tree bound is the three-terminal instance of the tree-diagram method of Aizenman and Newman #cite(label("AizenmanNewman1984")). We repeatedly use two elementary kernel facts. If $\| A \( x \, y \) \| lt.eq B \( x \, y \)$ and $B$ is a nonnegative bounded kernel, then $lr(bar.v.double  bar.v.double) A lt.eq lr(bar.v.double  bar.v.double) B$: test the bilinear form against absolute values of finitely supported vectors. If all row sums and column sums of $B$ are at most $b$, then $lr(bar.v.double  bar.v.double) B lt.eq b$, by Cauchy–Schwarz with the weights $B \( x \, y \)$.

#thm([Lemma 4.])[
  (The operator threshold precedes uniqueness).  #emph[For every quasi-transitive graph under consideration, $p_(2 arrow.r 2) lt.eq p_u$.]
] <pre:threshold-order>

#proof[
  Suppose that there is a unique infinite cluster almost surely at parameter $p$. Some vertex has positive probability of belonging to it, by countability. Association with the event that a fixed finite connecting path is open makes this probability positive at every vertex. There are finitely many vertex types, so $inf_x bb(P)_p \( \| C_x \| = oo \) = theta > 0$. Association and uniqueness give $T_p \( x \, y \) gt.eq theta^2$ for every pair $x \, y$. For finite $F subset V$,
  $ chevron.l upright(bold(1))_F \, T_p upright(bold(1))_F chevron.r gt.eq theta^2 \| F \|^2 \, $
  which rules out boundedness on $ell^2 \( V \)$. Boundedness parameters form a downward interval by entrywise domination. Thus $p_(2 arrow.r 2)$ is at most every parameter of almost-sure uniqueness, proving the claim under the stated supremum and infimum definitions. ◻
]

#thm([Proposition 1.])[
  (Reduction to a unimodular action).  #emph[If $"Aut" \( G \)$ is nonunimodular, then $p_c < p_(2 arrow.r 2) lt.eq p_u$ and $T_(p_c)$ is bounded. For the proof of the operator gap it therefore remains to treat the case in which $Gamma = "Aut" \( G \)$ is unimodular.]
] <pre:unimodular-reduction>

#proof[
  Give $"Aut" \( G \)$ the topology of pointwise convergence on vertices. Vertex stabilizers are open and compact: restrictions to successive finite balls give the usual diagonal compactness argument. Thus $"Aut" \( G \)$ is a locally compact group. If it is nonunimodular, its quasi-transitive action satisfies the hypotheses of #cite(label("Hutchcroft2019")) Theorem 2.9, which gives $p_c < p_(q arrow.r q)$ for every $1 < q < oo$. Take $q = 2$ and apply 4. A bounded kernel at any parameter strictly between $p_c$ and $p_(2 arrow.r 2)$ dominates $T_(p_c)$, proving its boundedness. This cited theorem requires a quasi-transitive nonunimodular automorphism subgroup; hyperbolicity is not among its hypotheses. ◻
]

The remaining assertion, proved in 9, is the principal new estimate.

#thm([Theorem 2.1.])[
  (Critical boundedness for a unimodular action).  #emph[Let $G$ be an infinite connected locally finite simple quasi-transitive graph with $h_V \( G \) > 0$. If $"Aut" \( G \)$ is unimodular, then $lr(bar.v.double T_(p_c) bar.v.double)_(2 arrow.r 2) < oo$.]
] <thm:critical-operator>

=== 2.3 Averaging over types and a finite trace <pre:types>

The inverse stabilizer-volume weights below give the quasi-transitive mass-transport principle of #cite(label("BLPS1999Invariant")) Corollary 3.5; see also #cite(label("AldousLyons2007")) Theorem 3.1 and #cite(label("LyonsPeres2016")) Corollary 8.11 and Section 8.2.

For the rest of the main argument assume that $Gamma$ is unimodular. Let $O_1 \, dots.h \, O_(h_0)$ be its vertex orbits, with representatives $o_1 \, dots.h \, o_(h_0)$. Fix a Haar measure on $Gamma$, and set

$ sigma_i = frac("vol" \( Gamma_(o_i) \)^(- 1), sum_(j = 1)^(h_0) "vol" \( Gamma_(o_j) \)^(- 1)) \, #h(2em) \[ F \( o \) \] = sum_(i = 1)^(h_0) sigma_i F \( o_i \) \, #h(2em) c_sigma = \( min_i sigma_i \)^(- 1) . $

Brackets always mean this finite type average, including when $F$ already contains a probabilistic expectation. These weights determine a law on the root types, not a measure replacing counting measure on $V$. In particular all adjoints, positivity assertions, and operator norms below are those of the previously defined Hilbert space $ell^2 \( V \)$.

#thm([Lemma 5.])[
  (Weighted mass transport).  #emph[For every invariant nonnegative function $m$ on ordered vertex pairs, 
#[#set math.equation(numbering: n => "(2.2)")
 $ [sum_y m \( o \, y \)] = [sum_x m \( x \, o \)] . $ <eq:s02>]

 The identity also applies to the expectation of a covariant random mass and to absolutely summable signed or complex masses. In particular, an invariant stochastic kernel on a single orbit has column sums one, whether or not it is symmetric.]
] <pre:mass-transport>

#proof[
  Decompose the ordered pairs into $Gamma$-orbits. For one such orbit, represented by $\( x \, y \)$ of types $i \, j$, its number of pairs with first coordinate $x$ is
  $ frac("vol" \( Gamma_x \), "vol" \( Gamma_x ∩ Gamma_y \)) \, $
  and its number with second coordinate $y$ is the same expression with $Gamma_y$ in the numerator. Unimodularity makes the volumes of conjugate compact subgroups equal. Multiplication by $sigma_i$ and $sigma_j$ therefore gives the same contribution. Summing proves (2.2); Tonelli’s theorem handles nonnegative infinite sums. Take expectations for random masses, and use absolute convergence for signed or complex ones. Supporting the mass on one orbit cancels its positive type weight, giving the final assertion. ◻
]

The diagonal average gives a normalized trace even though $V$ is infinite. This is the invariant-operator trace discussed in #cite(label("AldousLyons2007")) Section 5; we verify its precise form here.

#thm([Lemma 6.])[
  (The invariant trace).  #emph[For a bounded invariant operator $S$, define $"tr" S = \[ S \( o \, o \) \]$. This is a positive normalized trace: $"tr" I = 1$ and $"tr" \( A B \) = "tr" \( B A \)$ for bounded invariant $A \, B$. If $A$ is positive semidefinite, invariant, and bounded, and $B = B^(*)$ is invariant and bounded, then 
$ \| "tr" \( B A \) \| lt.eq lr(bar.v.double  bar.v.double) B thin "tr" A \, #h(2em) A \( x \, x \) lt.eq c_sigma "tr" A . $

]
] <pre:trace>

#proof[
  Positivity and normalization follow from the diagonal definition. The diagonal product expansion is absolutely summable, since
  $ sum_y \| A \( x \, y \) B \( y \, x \) \| lt.eq lr(bar.v.double A^(*) upright(bold(1))_({ x }) bar.v.double) thin lr(bar.v.double B upright(bold(1))_({ x }) bar.v.double) lt.eq lr(bar.v.double  bar.v.double) A lr(bar.v.double  bar.v.double) B . $
  Apply (2.2) to these products to obtain cyclicity. The positive square root $A^(1 \/ 2)$ is invariant, because $A$ commutes with the unitary action of every automorphism and functional calculus preserves that commutation. The inequalities
  $ - lr(bar.v.double  bar.v.double) B A lt.eq A^(1 \/ 2) B A^(1 \/ 2) lt.eq lr(bar.v.double  bar.v.double) B A $
  and cyclicity prove the trace estimate. Finally the nonnegative diagonal is constant on each type, so its value on type $i$ is at most $sigma_i^(- 1) "tr" A$. ◻
]

=== 2.4 A symmetric walk with a spectral gap <pre:walk-subsection>

We use a symmetric lazy version of the walk so that counting measure is reversible even when degrees differ between vertex types. The spectral estimate below is the discrete Cheeger argument; see #cite(label("Dodziuk1984")) for its isoperimetric background. Define

$ P \( x \, y \) = frac(1, 2 d) quad \( x tilde.op y \) \, #h(2em) P \( x \, x \) = 1 - frac(deg \( x \), 2 d) \, $

with all other entries zero.

#thm([Lemma 7.])[
  (Walk and type chain).  #emph[The kernel $P$ is positive semidefinite and 
#[#set math.equation(numbering: n => "(2.3)")
 $ rho := lr(bar.v.double  bar.v.double) P < 1 . $ <eq:s03>]

 Its projection onto the vertex types is an irreducible lazy finite Markov chain. There exist $c_(*) > 0$ and $l_0 < oo$ such that 
$ sum_(y in O_j) P^l \( x \, y \) gt.eq c_(*) quad upright("for every ") x in V \, med j lt.eq h_0 \, med l gt.eq l_0 . $

]
] <pre:walk>

#proof[
  The kernel $2 P - I$ is symmetric and stochastic, hence a contraction; therefore $P$ is positive semidefinite. For a finitely supported nonnegative $f$, the level-set identity and edge isoperimetry give
  $ sum_({ x \, y } in E) \| f \( x \)^2 - f \( y \)^2 \| = integral_0^oo \| partial_E { f^2 > t } \| thin d t gt.eq iota lr(bar.v.double  bar.v.double) f^2 . $
  Cauchy–Schwarz and $sum_({ x \, y } in E) \( f \( x \) + f \( y \) \)^2 lt.eq 2 d lr(bar.v.double  bar.v.double) f^2$ imply
  $ chevron.l \, chevron.r f \( I - P \) f = frac(1, 2 d) sum_({ x \, y } in E) \( f \( x \) - f \( y \) \)^2 gt.eq frac(iota^2, 4 d^2) lr(bar.v.double  bar.v.double) f^2 . $
  Since $P$ has nonnegative entries, $\| chevron.l \, chevron.r f P f \| lt.eq chevron.l \| f \| \, P \| f \| chevron.r$, so the same norm bound extends to arbitrary finitely supported vectors and then to $ell^2 \( V \)$.
  The transition probabilities between types are well defined by invariance. Connectivity gives irreducibility, and every holding probability is at least $1 \/ 2$. By following a connecting type path and padding it with holds, a sufficiently large common power of this finite transition matrix has every entry positive. Its minimum entry is a lower bound for every later power, because left multiplication by a stochastic matrix takes convex combinations of its rows. ◻
]

=== 2.5 Subcritical susceptibility, differentiation, and sprinkling <pre:subcritical>

Set

$ chi_x \( p \) = bb(E)_p \| C_x \| \, #h(2em) chi \( p \) = \[ chi_o \( p \) \] \, #h(2em) chi_max \( p \) = sup_x chi_x \( p \) . $

The parameter will be suppressed when unambiguous.

#thm([Lemma 8.])[
  (Subcritical finiteness and type comparison).  #emph[For $p < p_c$, $chi_max \( p \) < oo$ and 
$ sup_x bb(E)_p s_x^2 lt.eq chi_max \( p \)^3 \, #h(2em) chi_max \( p \) lt.eq c_sigma chi \( p \) . $

 There is $c > 0$, depending only on $G$, such that $chi_x \( p \) gt.eq c chi \( p \)$ for every $x$ and $p_c \/ 2 lt.eq p < p_c$. The operator $T_p$ is symmetric, positive semidefinite, and bounded with $lr(bar.v.double T_p bar.v.double) lt.eq chi_max \( p \)$.]
] <pre:sharpness>

#proof[
  Susceptibility finiteness on quasi-transitive graphs is established in #cite(label("AntunovicVeselic2008")) Theorem 2, following the sharpness work of Aizenman–Barsky and Menshikov #cite(label("AizenmanBarsky1987")) #cite(label("Menshikov1986")). We give a proof by adapting the finite-set criterion of Duminil-Copin and Tassion #cite(label("DuminilCopinTassion2016")) Section 1 to the finitely many vertex types. For a finite set $S in.rev x$, put
  $ phi_p \( x \, S \) = p sum_(a tilde.op b\
a in S \, b in.not S) bb(P)_p \( x arrow.l.r a upright(" in ") S \) \, $
  and let $p_(*)$ be the supremum of parameters for which every vertex has such an $S$ with $phi_p \( x \, S \) < 1$. This set of parameters is downward closed. If $p < p_(*)$, choose a qualifying larger parameter; finitely many orbit representatives then supply translated test sets with a common size bound $L$ and costs at $p$ bounded by $a < 1$.
  For a finite induced domain $Lambda$, let $H_Lambda$ be its largest susceptibility. A simple open path from $x in Lambda$ to a vertex outside its test set $S$ has a first exit edge from $S$. Its prefix inside $S$, that edge, and its remaining leg have disjoint witnesses. The disjoint-witness inequality gives
  $ bb(E)_p \| C_x^Lambda \| lt.eq L + phi_p \( x \, S \) H_Lambda lt.eq L + a H_Lambda . $
  This remains valid if $S$ is not contained in $Lambda$, since the prefix inside $S ∩ Lambda$ is dominated by the connection in $S$. Maximizing and exhausting $G$ gives $chi_max \( p \) lt.eq L \/ \( 1 - a \)$. Thus $p_c gt.eq p_(*)$.
  For the reverse inequality, choose $p_(*) < r < p < 1$. There is a vertex $x$ such that $phi_r \( x \, S \) gt.eq 1$ for every finite $S in.rev x$. Let $f_Lambda \( u \)$ be the probability that $x$ connects outside a finite set $Lambda in.rev x$. This is a finite-edge event. Finite-product differentiation expresses its derivative as the expected number of closed pivotal edges divided by $1 - u$. Explore from outside $Lambda$, and let $S$ be the vertices of $Lambda$ not connected to its exterior. On disconnection $x in S$. Conditional on this exploration, the edges internal to $S$ remain independent with parameter $u$, and its crossing edges are closed. A crossing edge is pivotal precisely when its inner endpoint connects to $x$ in $S$. Hence, for $r lt.eq u lt.eq p$,
  $ f'_Lambda \( u \) = frac(1, u \( 1 - u \)) bb(E)_u #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ x in S }) phi_u \( x \, S \) #scale(x: 120%, y: 120%)[\]] gt.eq frac(1 - f_Lambda \( u \), u \( 1 - u \)) . $
  Integration gives $f_Lambda \( p \) gt.eq 1 - exp \( - integral_r^p d u \/ \( u \( 1 - u \) \) \) > 0$, uniformly in $Lambda$. Exhaustion yields $p_c lt.eq p$; letting $p arrow.b p_(*)$ proves $p_(*) = p_c$.
  Sum (2.1) over $y \, z$ to obtain the second moment bound. The upper type comparison follows directly from the weights. There is a common finite bound on the length needed to reach a vertex of any prescribed type from any starting vertex: choose paths between representatives and translate them. Association with such a path of length $l$ gives $chi_x \( p \) gt.eq p^l chi_y \( p \)$, proving the lower comparison on the stated parameter interval. Symmetry of $T_p$ and the row/column sum bound prove boundedness. For every finitely supported complex $f$,
  $ sum_(x \, y) overline(f \( x \)) T_p \( x \, y \) f \( y \) = bb(E)_p sum_C lr(|sum_(x in C) f \( x \)|)^2 gt.eq 0 \, $
  where the sum is over open clusters. This proves positive semidefiniteness. ◻
]

#thm([Lemma 9.])[
  (Russo identities in operator norm).  #emph[The map $p mapsto T_p$ is locally absolutely continuous in operator norm on $\( 0 \, p_c \)$, and $chi$ is locally absolutely continuous there. For almost every $p in \( 0 \, p_c \)$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ \( 1 - p \) T'_p \( x \, y \) & = sum_a sum_(b tilde.op a) bb(P)_p \( x in C_a \, med y in C_b \, med C_a eq.not C_b \) \,\
\( 1 - p \) chi' & = [sum_(b tilde.op o) bb(E)_p \( s_o s_b \; med C_o eq.not C_b \)] . $ <eq:s04>]

]
] <pre:russo>

#proof[
  In a finite induced domain, differentiate the connection event by closed pivotals. A closed pivotal edge has a unique orientation $\( a \, b \)$ for which $x in C_a$ and $y in C_b$; these two clusters are distinct. This proves the finite-domain first identity with the factor $1 - p$ and no extra factor of two.
  Fix a compact parameter interval contained in $\( 0 \, p_1 \]$ with $p_1 < p_c$. The summand is bounded, by disjoint witnesses, by $T_(p_1) \( x \, a \) T_(p_1) \( b \, y \)$. Its sum over $a \, b \, y$ is at most $d chi_max \( p_1 \)^2$. Under exhaustion, connection events converge, and distinctness indicators converge as well: if two vertices are connected in the full graph, a finite path eventually witnesses this. Dominated convergence therefore passes the integrated Russo identity to the full graph.
  For each representative $o_i$, its row is thus the integral of an $ell^1 \( V \)$-valued integrand dominated coordinatewise by the fixed summable row of $\( 1 - p_1 \)^(- 1) T_(p_1) "Adj" T_(p_1)$. Lebesgue differentiation gives row differentiation in $ell^1$ almost everywhere. One can see this directly by differentiating a finite set of coordinates and bounding the remaining tails by the same summable majorant. There are finitely many row types. Invariance, symmetry, and the row/column sum bound consequently upgrade these statements to local absolute continuity and differentiation in operator norm. Summing the first identity over $y$ and then applying (2.2) to move the root from $x$ to $a$ gives the second identity. All sums are justified by the same domination. ◻
]

The next connection-operator comparison is #cite(label("Hutchcroft2019")) Lemma 2.4. We include the argument because it is used both before and after the critical bound is proved.

#thm([Lemma 10.])[
  (Sprinkling).  #emph[For $0 lt.eq p \, a lt.eq 1$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ T_(p + \( 1 - p \) a) lt.eq sum_(j gt.eq 0) a^j T_p \( "Adj" T_p \)^j #h(2em) upright("entrywise") . $ <eq:s05>]

 If $T_p$ is bounded and $a d lr(bar.v.double T_p bar.v.double) < 1$, the kernel on the left is bounded. In particular, boundedness of $T_(p_c)$ implies $p_c < p_(2 arrow.r 2)$.]
] <pre:sprinkling>

#proof[
  Take independent fields of parameters $p$ and $a$; their union has parameter $p + \( 1 - p \) a$. A finite simple open path in the union can be split at the distinct ordered edges for which it uses the second field. The intervening first-field legs have disjoint open witnesses. For prescribed legs and $j$ prescribed second-field edges, independence and the disjoint-witness inequality give the corresponding product of $j + 1$ connection probabilities times $a^j$. Summing over all intermediate vertices and $j$ yields (2.5); extra paths and repetitions in that sum only increase the bound. Since $lr(bar.v.double "Adj" bar.v.double) lt.eq d$, the right-hand series converges in operator norm when $a d lr(bar.v.double T_p bar.v.double) < 1$. Entrywise domination gives the assertion. Finally $p_c < 1$ permits a positive $a$ satisfying this condition at $p = p_c$. ◻
]

== 3 Critical clusters remain controlled after deletions <good:section>

The local maps constructed in the next section attach pieces cut from critical clusters. We need a property of the original cluster that controls the separating bridges of every such piece, even after an arbitrary vertex deletion. This section proves that a capped critical cluster fails this property only with stretched-exponentially small probability. All percolation fields in this section have parameter $p_c$.

#prodef([Definition 1.])[
  (Pivotal distance and good clusters).  A bridge of a connected open graph is an open edge whose deletion disconnects that graph. The #emph[pivotal distance] between two vertices is the number of bridges separating them. Equivalently, delete all bridges, contract the resulting connected pieces, and measure distance in the resulting tree. Write $"diam"_(upright("piv"))$ for the maximum pivotal distance and $"rad"_(upright("piv")) \( H \, x \)$ for its maximum from $x$.
  Fix $0 < epsilon.alt < 1 \/ 2$ and set $s = 1 \/ 2 + epsilon.alt$. A finite open cluster $C$ with $\| C \| lt.eq M$ is #emph[good for cap $M$] if the following holds for every set $A subset.eq C$. For every open component $B$ after deleting $A$, let $K$ be the number of original open edges from $B$ to $A$. Whenever $K gt.eq 1$,
  $ "diam"_(upright("piv")) \( B \) lt.eq K M^s . $
  The pivotal distance in this condition is computed inside $B$.
] <good:definition>

#thm([Proposition 2.])[
  (Good critical clusters).  #emph[For each $epsilon.alt in \( 0 \, 1 \/ 2 \)$, uniformly in $x$ and for all sufficiently large $M$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(P)_(p_c) \( s_x lt.eq M \, med C_x upright(" is not good for cap ") M \) lt.eq e^(- M^epsilon.alt) . $ <eq:s06>]

 The event that a cluster has size at most $M$ and is good for cap $M$ is determined by the percolation bits in a deterministic finite-radius ball about its root.]
] <good:good-clusters>

We prove the proposition through a marked-cluster estimate. Independent vertex marks, often called a ghost field, are a standard device in percolation differential inequalities #cite(label("AizenmanBarsky1987")). The exploration-score method is closely related to that used for the two-ghost inequality in #cite(label("Hutchcroft2020Locality")) Section 3; the deletion-uniform estimate below requires the additional inverse comparison at the end of this section. In a deterministic induced domain $D$ containing $x$, mark vertices independently with probability $h in \( 0 \, 1 \/ 2 \]$, independently of the edges. Let $E = E \( D \, x \, h \)$ be the event that $C_x^D$ contains a mark. An edge is pivotal for $E$ if changing its state changes $upright(bold(1))_E$, with the marks held fixed. Let $D_p$ denote the number of open pivotal edges; this notation is confined to the present section and the percolation parameter is $p = p_c$.

#thm([Lemma 11.])[
  (Marked pivotal moments).  #emph[There is a constant $C$, depending only on $d$ and $p_c$, such that, with $A_h = C sqrt(log \( 1 \/ h \) \/ h) gt.eq 1$, for every induced domain $D$, every $x in D$, every integer $i gt.eq 0$, and every $r gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(E) [binom(D_p, i) upright(bold(1))_E] & lt.eq A_h^i bb(P) \( E \) \,\
bb(P) \( E \, med D_p gt.eq r \) & lt.eq 2 bb(P) \( E \) e^(- r \/ \( 4 A_h \)) . $ <eq:s07>]

]
] <good:marked-pivotals>

#proof[
  #emph[The first moment.] Explore the cluster in a fixed mark-independent order, testing the mark of each newly discovered vertex immediately and stopping at the first mark or when the cluster is exhausted. No edge is queried twice. Critical finiteness from 2 makes this a terminating decision procedure, even in an infinite domain. Let $T$ be its number of edge queries. Conditional on the complete percolation configuration, the discovery order is fixed. The first mark index is geometric with parameter $h$, stopped at $\| C_x^D \|$; conditional on success, it is that geometric variable conditioned to be at most $\| C_x^D \|$. In both cases its mean is at most $1 \/ h$. There are at most $d$ edge queries per discovered vertex, so
  $ bb(E) T lt.eq d \/ h \, #h(2em) bb(E) \[ T divides E \] lt.eq d \/ h . $
  Let $Z = sum_(e upright(" queried")) \( omega_e - p_c \)$. The indicator $Q_e$ that edge $e$ is queried is measurable without its own bit, and every pivotal edge must be queried by a procedure deciding $E$. Conditioning on all other edge bits and marks, and then averaging, gives
  $ bb(E) \[ \( omega_e - p_c \) Q_e upright(bold(1))_E \] = p_c \( 1 - p_c \) bb(P) \( e upright(" is pivotal") \) . $
  The identity remains valid after summation, since $bb(E) T < oo$. An open pivotal contributes to $D_p upright(bold(1))_E$, and its bit is independent of its pivotality. Therefore
  #[#set math.equation(numbering: n => "(3.3)")
   $ bb(E) \[ Z upright(bold(1))_E \] = \( 1 - p_c \) bb(E) \[ D_p upright(bold(1))_E \] . $ <good:score-identity>]
  Each queried bit is fresh conditional on the previous transcript. For a centered Bernoulli variable, the logarithmic moment-generating function is at most $lambda^2 \/ 8$: its second derivative is a Bernoulli variance, at most $1 \/ 4$. Successive conditional expectations at the bounded stopping times $T and n$, followed by Fatou’s lemma, give
  $ bb(E) exp \( lambda Z - lambda^2 T \/ 8 \) lt.eq 1 . $
  Put $H = bb(P) \( E \) gt.eq h$, since a mark at $x$ suffices. Conditional Jensen’s inequality yields
  $ lambda bb(E) \[ Z divides E \] lt.eq log \( 1 \/ H \) + lambda^2 / 8 bb(E) \[ T divides E \] lt.eq log \( 1 \/ h \) + frac(lambda^2 d, 8 h) . $
  Taking $lambda = sqrt(8 h log \( 1 \/ h \) \/ d)$ and using (3.3), we obtain
  $ bb(E) \[ D_p divides E \] lt.eq frac(sqrt(d \/ 2), 1 - p_c) sqrt(frac(log \( 1 \/ h \), h)) . $
  This proves the first-moment assertion, uniformly over domains.
  #emph[Higher binomial moments.] On $E$, each open pivotal is a bridge separating $x$ from all marks in its cluster. These pivotals are linearly ordered from $x$ toward the marks. Define
  $ b_i \( D \, x \) = bb(E) [binom(D_p, i) upright(bold(1))_E] \, #h(2em) b_0 \( D \, x \) = bb(P) \( E \) . $
  For an oriented edge $arrow(e) = \( a \, b \)$, let $C_(x \, arrow(e))^D$ be the root cluster when $e$ is forced closed. Decompose a selected set of $i$ pivotals according to its first selected edge, oriented away from $x$. The resulting exact identity is
  #[#set math.equation(numbering: n => "(3.4)")
   $ b_i \( D \, x \) = p_c sum_(arrow(e) = \( a \, b \) in E \( D \)) sum_(W subset D upright(" finite")\
x \, a in W \, b in.not W) bb(P)_(p_c) \( C_(x \, arrow(e))^D = W \) \( 1 - h \)^(\| W \|) b_(i - 1) \( D \\ W \, b \) . $ <good:pivotal-recursion>]
  To verify the conditional law in this formula, force $e$ closed and expose the exact finite root cluster $W$. This reveals internal and boundary information of $W$ but no edges internal to $D \\ W$. The event $C_(x \, arrow(e))^D = W$ ignores the actual bit of $e$. Require that $W$ contain no marks, accounting for $\( 1 - h \)^(\| W \|)$. Opening $e$, with independent probability $p_c$, makes it the sole open contact from $W$ to its exterior. It is then pivotal exactly when $b$ connects to a mark in $D \\ W$. All pivotals after it are precisely those of that exterior event. The exterior edges and marks retain their independent laws. Every selected subset is counted once: if the total number of ordered pivotals is $n$, the count is $sum_(j = 1)^n binom(n - j, i - 1) = binom(n, i)$. All sums are nonnegative, so Tonelli’s theorem justifies the decomposition without a priori moment assumptions.
  Uniform induction in $D \, x$ now gives
  $ b_i \( D \, x \) lt.eq A_h^(i - 1) b_1 \( D \, x \) lt.eq A_h^i b_0 \( D \, x \) . $
  Finally expand $\( 1 + \( 2 A_h \)^(- 1) \)^(D_p)$ and sum these binomial moments to get
  $ bb(E) [(1 + frac(1, 2 A_h))^(D_p) upright(bold(1))_E] lt.eq 2 bb(P) \( E \) . $
  Since $log \( 1 + \( 2 A_h \)^(- 1) \) gt.eq \( 4 A_h \)^(- 1)$ for $A_h gt.eq 1$, Markov’s inequality proves the second part of (3.2). ◻
]

#thm([Lemma 12.])[
  (A capped pivotal-radius tail).  #emph[For the fixed $epsilon.alt in \( 0 \, 1 \/ 2 \)$, there is $c > 0$ such that, uniformly in $x$, all sufficiently large $M$, and integers $1 lt.eq K lt.eq M^(1 - s)$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ bb(P)_(p_c) (s_x lt.eq M \, "rad"_(upright("piv")) \( C_x \, x \) gt.eq K M^s \/ 2) lt.eq exp (- frac(c K^2 M^(2 epsilon.alt), log M)) . $ <eq:s08>]

]
] <good:radius-tail>

#proof[
  On the event on the left, choose a witness vertex $y$ by a fixed ordering. Independently mark vertices with probability $h$. The conditional probability that $y$ is the sole mark in $C_x$ is at least $h \( 1 - h \)^M$. In that case every bridge separating $x$ from $y$ is pivotal for the marked event. By (3.2), with $R = K M^s \/ 2$,
  $ bb(P)_(p_c) \( s_x lt.eq M \, "rad"_(upright("piv")) gt.eq R \) lt.eq frac(2, h \( 1 - h \)^M) exp (- frac(R, 4 A_h)) . $
  Set
  $ X = frac(K^2 M^(2 epsilon.alt), log M) \, #h(2em) h = frac(X, b M) = frac(K^2 M^(- 1 + 2 epsilon.alt), b log M) \, $
  where $b$ will be a sufficiently large fixed constant. The allowed range of $K$ gives $h lt.eq 1 \/ \( b log M \) lt.eq 1 \/ 2$. For all sufficiently large $M$, uniformly in that range, $log \( 1 \/ h \) lt.eq 2 log M$ and
  $ frac(R, 4 A_h) gt.eq frac(X, 8 C sqrt(2 b)) . $
  Using $- log \( 1 - h \) lt.eq 2 h$, the logarithm of the preceding probability bound is therefore at most
  $ O \( log M \) + frac(2 X, b) - frac(X, 8 C sqrt(2 b)) . $
  First choose $b$ large enough that the last two terms have a negative sum bounded above by $- c_1 X$. Then increase $M$: the minimum possible $X$ is $M^(2 epsilon.alt) \/ log M$, which dominates $log M$. This proves (3.5) with a fixed positive $c$. ◻
]

#proof[
  Given a capped cluster violating goodness, choose a deleted set $A$ and a remaining component $B$ witnessing the violation, by a fixed finite ordering. Let $K gt.eq 1$ be the number of original open edges from $B$ to $A$. Since $"diam"_(upright("piv")) \( B \) lt.eq \| B \| - 1 < M$, a violation has $K lt.eq M^(1 - s)$.
  Close its $K$ open contacts, except for one retained contact if $x in.not B$: in that case take a simple open path from $x$ to $B$ and retain its first edge entering $B$. The path before that contact does not use any edge being closed, so the modified root cluster $C'_x$ still contains $B$. If $x in B$, then $C'_x = B$. In either case $B$ has at most one open attachment to the rest of $C'_x$. An internal bridge of $B$ cannot be bypassed outside $B$, because such a bypass would need two attachments. Thus its bridge tree embeds into the bridge tree of $C'_x$ with its distances preserved. The triangle inequality shows that at least one endpoint of a diameter of $B$ is at pivotal distance greater than $K M^s \/ 2$ from $x$. Also $\| C'_x \| lt.eq \| C_x \| lt.eq M$. Hence the modified configuration belongs to the event in (3.5).
  It remains to bound the cost of this configuration change; no independence of its input-dependent choices is needed. At a fixed output, every changed edge is incident to $B subset.eq C'_x$, so there are at most $d M$ candidate edges. For fixed $K$, specifying the subset of at most $K$ changed edges reconstructs the input by reopening them. The number of possible inputs is at most
  $ sum_(j = 0)^K binom(floor.l d M floor.r, j) lt.eq \( K + 1 \) \( d M \)^K \, $
  and their probability ratio to the output is at most $max \( 1 \, p_c \/ \( 1 - p_c \) \)^K$. This is a comparison on a finite product: on the cap event every cluster vertex lies within distance $M - 1$ of $x$, and every incident edge lies in a deterministic slightly larger ball. Condition on all bits outside that ball and apply the pointwise finite-product comparison inside it.
  It follows from (3.5) that the contribution for fixed $K$ is at most
  $ exp (C_1 K log M - frac(c K^2 M^(2 epsilon.alt), log M)) . $
  Uniformly for $K gt.eq 1$, the negative term absorbs the positive one, because $M^(2 epsilon.alt) \/ \( log M \)^2 arrow.r oo$. Summing over the at most $M$ possible values of $K$ gives, for large $M$,
  $ M exp (- frac(c M^(2 epsilon.alt), 2 log M)) lt.eq e^(- M^epsilon.alt) \, $
  as claimed. Finally, explore the root cluster until it is exhausted or more than $M$ vertices are found. This uses only a deterministic ball of radius at most $ceil.l M ceil.r + 1$. In the first case its internal edges and closed boundary are known, and one can test every subset deletion of the finite cluster. In the second case the capped event fails. This proves locality. ◻
]

== 4 Amplifying local endpoint maps <amp:section>

Throughout this section percolation has parameter $p_c$, and the automorphism group is unimodular. We use the weighted transport identity (2.2), the walk bound (2.3), critical finiteness, and the goodness estimate (3.1). The purpose of the construction is to turn a heavy cluster-size tail into a local rule whose endpoint spreads very widely relative to its probability of success and its cluster-size cap. The next section will show that such rules contradict the heavy tail.

Suppose that

#[#set math.equation(numbering: n => "(4.1)")
 $ \[ bb(E)_(p_c) s_o^alpha \] = oo #h(2em) upright("for some ") 0 < alpha < 1 / 2 . $ <eq:s09>]

Choose $beta > alpha$ and $epsilon.alt > 0$ so that, with $s = 1 / 2 + epsilon.alt$, we have $beta + s < 1$. Goodness below always uses this choice of $s$.

=== 4.1 One orbit and a sequence of scales <amp:scales-section>

#thm([Lemma 13.])[
  (Selection of an orbit).  #emph[There are a vertex orbit $O$, a constant $c > 0$, and an unbounded sequence $cal(N)$ of dyadic integers such that, for $n in cal(N)$ and $pi = \[ bb(P)_(p_c) \( n lt.eq s_o < 2 n \) \]$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ pi & gt.eq n^(- beta) \,\
 & lt.eq \( 1 + 2^beta \) pi \,\
bb(E)_(p_c) #scale(x: 120%, y: 120%)[\[] \| C_x ∩ O \| upright(bold(1))_({ n lt.eq s_x < 2 n }) #scale(x: 120%, y: 120%)[\]] & gt.eq c n pi #h(2em) \( x in O \) . $ <eq:s10>]

 The orbit and the sequence can be kept fixed throughout the amplification.]
] <amp:scales>

#proof[
  Put $pi_j = \[ bb(P)_(p_c) \( 2^j lt.eq s_o < 2^(j + 1) \) \]$. The sequence $2^(beta j) pi_j$ is unbounded: a uniform bound would make $sum_j 2^(alpha j) pi_j$ finite, contrary to (4.1). Choose its successive record indices, omitting an initial finite segment so that their record values are at least one. At a record index $j$, $pi_(j - 1) lt.eq 2^beta pi_j$, proving the first two assertions.
  Let $h$ be the number of vertex orbits. Call a vertex of a finite cluster qualifying if its orbit occupies at least $1 \/ h$ of the cluster. At least $1 \/ h$ of the vertices of every cluster qualify. Transport, uniformly within each finite cluster in the chosen bin, gives
  $ \[ bb(P)_(p_c) \( n lt.eq s_o < 2 n \, med o upright(" qualifies") \) \] = [bb(E)_(p_c) [upright(bold(1))_({ n lt.eq s_o < 2 n }) frac(\# { v in C_o : v upright(" qualifies") }, s_o)]] gt.eq pi / h . $
  For at least one type $i$, its contribution to the left side is at least $pi \/ h^2$. At a representative $x$ of this type,
  $ bb(E)_(p_c) #scale(x: 120%, y: 120%)[\[] \| C_x ∩ O_i \| upright(bold(1))_({ n lt.eq s_x < 2 n }) #scale(x: 120%, y: 120%)[\]] gt.eq n / h thin bb(P)_(p_c) \( n lt.eq s_x < 2 n \, med x upright(" qualifies") \) gt.eq frac(n pi, h^3 sigma_i) . $
  One of the finitely many types is selected along an unbounded subsequence of record scales. Keep that subsequence and write $O$ for its orbit. ◻
]

#prodef([Definition 2.])[
  (Local endpoint map).  A local endpoint map on $O$ is a randomized rule at each $x in O$ that reads percolation bits in a deterministic finite ball about $x$ and uses auxiliary randomness independent of those bits. Its conditional rules are covariant under automorphisms. The rule either fails or outputs $y in C_x ∩ O$. A map with integer cap $M$ is required, on every successful input pattern, to have $s_x lt.eq M$ and $C_x$ good for cap $M$.
  Write $u > 0$ for its success probability and
  $ K \( x \, y \) = bb(P) \( upright("output ") y divides upright("success at ") x \) \, #h(2em) r = lr(bar.v.double  bar.v.double) K \,\
U = log \( 1 \/ u \) \, quad m = log M \, quad H = log \( 1 \/ r \) . $
  All probabilities here include the auxiliary randomness, and the operator norm is on counting-measure $ell^2 \( O \)$.
] <amp:map>

Invariance makes $u$ independent of $x in O$. The kernel $K$ has row sums one; transport restricted to $O times O$ gives column sums one as well. Thus $0 < r lt.eq 1$ by the row and column sum bound. Symmetry of $K$ is neither assumed nor needed.

#thm([Proposition 3.])[
  (Efficient endpoint maps).  #emph[Under (4.1), for every $eta > 0$ there is a local endpoint map on the orbit $O$ of 13, with $M gt.eq 2$ and $H > 1$, such that 
$ frac(U + m, H) < eta . $

 Moreover the maps can be chosen so that $H$ tends to infinity. Their radii are finite, but need not be bounded uniformly over the construction.]
] <amp:efficient-maps>

We prove the proposition by constructing a starting map, establishing one amplification step, and then specifying the order of all parameters.

#thm([Lemma 14.])[
  (Starting map).  #emph[There is a local endpoint map on $O$ with $H > 1$, with cap as large as prescribed.]
] <amp:initial>

#proof[
  From $x in O$ sample a length-$ell$ walk with kernel $P$, independently of percolation. Require its endpoint to lie in $O$ and all distinct edges traversed by the walk to be open. If $e$ is the number of distinct traversed edges, accept also an independent coin of probability $p_c^(ell - e)$. Holding steps do not count as edges. Before imposing a cluster cap, the resulting endpoint mass kernel is exactly $p_c^ell P^ell \|_(O times O)$. The finite type chain gives, for all large $ell$, a row sum at least $c_1 p_c^ell$, with $c_1 > 0$ independent of $ell$. Its norm is at most $p_c^ell rho^ell$.
  Fix $ell$ large enough that $2 rho^ell \/ c_1 < e^(- 1)$. Critical finiteness and (3.1) allow us to choose any sufficiently large $M$ and reject unless $s_x lt.eq M$ and $C_x$ is good for cap $M$, losing at most half the preceding lower bound on the row sum. Entrywise domination by the uncut mass kernel gives $r lt.eq 2 rho^ell \/ c_1 < e^(- 1)$. The capped cluster and its goodness can be tested in a deterministic finite ball, so this is a local map. ◻
]

=== 4.2 Splicing independent clusters <amp:splicing-section>

Fix an old map with parameters $\( u \, M \, r \)$, an integer $k gt.eq 1$, and a scale $n in cal(N)$ such that $k M lt.eq n \/ 2$. Constants in what follows may depend on the graph and the fixed choices $beta \, epsilon.alt \, O$, but not on $n \, k$ or the old map unless stated otherwise.

All finite choices can be made covariantly using independent continuous priorities on vertices or edges. More explicitly, keep three independent families of seeds: the old-map seeds, priorities ordering new contact lists, and a uniform random variable $V_i in \[ 0 \, 1 \]$ for the contact choice at each possible index $1 lt.eq i lt.eq k$. Ties in priorities have probability zero and may be rejected. An automorphism permutes the seed indices and preserves their joint law, so this realization does not require a free action or a choice of an automorphism carrying one root to another. A rule with already integrated endpoint probabilities is likewise realized by a categorical draw using its old-map seed. Once those seeds are fixed, old rules can be replayed deterministically.

For fixed $x \, z in O$ perform the following experiment. In a distinguished independent field $D$, require $A = C_x \( D \)$ to satisfy $n lt.eq \| A \| < 2 n$. Independently, start at $z$ and take $k$ old-map steps, using a new independent percolation field and new seeds for each step. Give the experiment mass $1 \/ n$ if every step succeeds and the last endpoint lies in $A$, and zero otherwise. A successful chain, listed in reverse order, has vertices

$ y_0 in A \, quad y_1 \, dots.h \, y_k = z . $

Let $E_i$ be the field used between $y_i$ and $y_(i - 1)$, and let $C_i$ be its whole open cluster containing these vertices. Each $C_i$ is good for cap $M$ and has at most $M$ vertices. This reversal is only a way of listing a realized chain; it makes no reversibility assertion about $K$.

Starting with $S = A$, apply the following switching procedure until $z in S$. Select the largest still eligible index $i$ for which $C_i ∩ S eq.not diameter$; after this selection only indices larger than $i$ remain eligible. Let $B_i$ be the component of $y_i$ in the open subgraph of $E_i$ induced by $V \\ S$. Among its $K_i$ open $E_i$-edges to $S$, choose one edge $e_i$ uniformly. Exchange the $D$ and $E_i$ bits on the mask

$ { e_i } med union  { e : e upright(" is incident to ") B_i upright(" and both endpoints of ") e upright(" lie outside ") S } . $

The field $D$ in this instruction is its current value.

#thm([Lemma 15.])[
  (Geometry of the switching procedure).  #emph[Every step is well defined. Its effect on the distinguished root cluster is exactly $S mapsto S union B_i$. The selected indices increase, and the inserted pieces form a chain, each attached to the preceding piece by one open bridge $e_i$; the first piece is attached to $A$. Every selected bridge separates $x$ from $z$ in the final distinguished field $D'$, and 
#[#set math.equation(numbering: n => "(4.3)")
 $ z in C_x \( D' \) \, #h(2em) s_x \( D' \) lt.eq M' = 2 n + k M . $ <eq:s11>]

]
] <amp:splicing>

#proof[
  Initially an eligible intersecting cluster exists because $y_0 in A$. After a selection at $i$, the new set contains $y_i$, so if $i < k$ and $z$ has not been reached, $C_(i + 1)$ supplies another eligible intersection. The selected $y_i$ lies outside the current $S$: if $i < k$ and $y_i in S$, then $C_(i + 1)$ would intersect $S$, contradicting maximality; if $i = k$, this would contradict the stopping condition. Since $C_i$ is connected and meets $S$, the component $B_i$ has $K_i gt.eq 1$ open contacts with $S$.
  Before the exchange, all $D$-edges leaving $S$ are closed. The exchange imports the internal open connections of $B_i$ and its closed boundary to $V \\ \( S union B_i \)$ from $E_i$, and opens the chosen contact $e_i$. Every other contact to $S$ keeps its closed $D$ bit. No edge internal to $S$ changes. Hence the new root cluster is exactly $S union B_i$, with $e_i$ its sole open contact between the two parts.
  Every index larger than the selected $i$ missed the entire pre-switch $S$. Consequently the next selected cluster can contact the enlarged root cluster only through $B_i$. Applying this observation at each step shows that later pieces attach to their immediate predecessors and do not acquire open contacts with earlier pieces. Thus all the seams remain bridges, and, when the procedure stops, separate $x$ from $z$ in their natural order. There are at most $k$ inserted pieces, each of size at most $M$, proving (4.3). ◻
]

1 illustrates the chain of inserted pieces. The separating seams will let us recover the original fields from the switched fields once the seam locations have been recorded.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0.3, 0), [#box(width: 2cm, height: 1.05cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$A$]]])])
  content((3.1, 0), [#box(width: 1.65cm, height: 1.05cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_(i_1)$]]])])
  content((5.8, 0), [#box(width: 1.65cm, height: 1.05cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_(i_2)$]]])])
  content((8.5, 0), [#box(width: 1.65cm, height: 1.05cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_(i_t)$]]])])
  line((1.3, 0), (2.275, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((1.788, 0), [#text(size: 9pt)[$e_(i_1)$]], anchor: "south", padding: 0.1176cm)
  line((3.925, 0), (4.975, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((4.45, 0), [#text(size: 9pt)[$e_(i_2)$]], anchor: "south", padding: 0.1176cm)
  line((6.625, 0), (7.675, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10, dash: "densely-dotted"))
  content((7.15, 0), [#text(size: 9pt)[$dots.h$]], anchor: "south", padding: 0.1176cm)
  circle((-0.2, 0.1), radius: 0.06985, fill: black, stroke: none)
  content((-0.2, 0.06472), [$x$], anchor: "north")
  circle((8.9, 0.1), radius: 0.06985, fill: black, stroke: none)
  content((8.9, 0.06472), [$z$], anchor: "north")
  content((4.3, -1.25), [#box(width: 10.94cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Each selected piece is attached by one open seam.#linebreak()The seams occur in order among the bridges separating $x$ and $z$.]]])])
})],
  caption: [Figure 1: The chain produced by the switching procedure. Cutting the selected seams recovers the inserted pieces and the initial cluster $A$. The drawing shows vertex sets and selected open seams, with internal edges and other incident edges omitted. ],
) <fig:splicing>

=== 4.3 Coding an inverse and defining its load <amp:coding-section>

#thm([Lemma 16.])[
  (Inverse codes and contact probabilities).  #emph[Fix the output fields, $x \, z$, the old-map seeds, and the priorities ordering contact lists. A valid switching input can be specified by the selected indices and positive gaps locating the selected seams in the ordered list of bridges separating $z$ from $x$, read from $z$ toward $x$. Each fixed code determines at most one input bit tuple, without using the fresh contact uniforms. After integrating those uniforms, the total mass of valid codes is at most 
#[#set math.equation(numbering: n => "(4.4)")
 $ W^k \, #h(2em) W = 1 + sum_(l = 1)^M min { 1 \, 2 M^s \/ l } lt.eq C M^s log M . $ <eq:s12>]

]
] <amp:coding>

#proof[
  List the selected indices in decreasing order, hence their seams in the order encountered from $z$ toward $x$. The code records the number of separating bridges up to each next seam, counting that seam. Cutting the indicated seams in the final root cluster recovers the inserted pieces and $A$, since 15 gives exactly a chain of singly attached connected pieces. Thus it determines every pre-switch set $S$, every $B_i$, and every exchange mask. Undo these masks in reverse chronological order. The candidate input tuple is now fixed, and the old rules can be replayed from $z$ to check all their successes, their endpoints, and the prescribed selection rule. An invalid code is simply discarded.
  Let $l_i$ be the gap ending at seam $e_i$. Other than that seam, its bridges lie inside $B_i$, between the attachment point toward $z$ and the attachment point toward $x$. Therefore $l_i lt.eq \| B_i \| lt.eq M$. Deleting the pre-switch set $S$ from the original good cluster $C_i$ leaves $B_i$ with $K_i$ original open contacts. Goodness bounds its pivotal diameter by $K_i M^s$. Since no later piece supplies a bypass,
  $ l_i lt.eq 1 + K_i M^s \, #h(2em) 1 / K_i lt.eq min { 1 \, 2 M^s \/ l_i } . $
  For the second inequality use $K_i gt.eq 1$ if $l_i = 1$, and $l_i - 1 gt.eq l_i \/ 2$ otherwise.
  The reconstruction just given has not consulted any $V_i$. In the reconstructed input, each contact list and its priority order are fixed. If its prescribed seam has rank $a_i$ among $K_i$ contacts, the fresh uniform must lie in $\[ \( a_i - 1 \) \/ K_i \, a_i \/ K_i \)$. These intervals are determined without any of the fresh uniforms, so their product Lebesgue measure is $product_i K_i^(- 1)$. Any further validity restrictions only decrease it. The priorities are integrated once under their probability law, rather than counted as additional inverse choices. Summing over a skipped index or a gap $1 lt.eq l lt.eq M$ at each index proves the bound $W^k$. Finally the harmonic sum gives $W lt.eq C M^s log M$ for $M gt.eq 2$. ◻
]

For clarity, all measure comparisons here can be made on finite bit spaces. In a successful experiment the chain connects $z$ by at most $k M$ edges to a vertex of the connected set $A$, so $"dist" \( x \, z \) lt.eq 2 n + k M$. A capped whole-cluster test exposes the boundary or stops as soon as the cap is exceeded. The old rule has a fixed query radius, and its successful steps move at most $M$. Consequently a deterministic larger ball about $x$ contains every query and every exchange mask for every successful experiment. There are finitely many candidate endpoints and codes. When checking an inverse, stop at the first failed capped test or failed old step; this uses a deterministic larger ball as well. Conditioning on all bits outside this ball reduces every comparison to finitely many Bernoulli coordinates.

At fixed seeds, the exchanges preserve the total number of open bits among equally distributed fields. Thus each input bit tuple and its output have exactly the same product probability, even though the exchange masks depend on the input. The injective inverse with a fixed code therefore gives the following exact density description. For a single reference iid distinguished field $D'$, let $L_x \( z \, D' \)$ be $1 \/ n$ times the sum of valid inverse-code indicators, integrated over reference iid auxiliary output fields and all independent seeds. The preceding finite comparison says that this is the density of the switched mass at $z$ relative to the law of $D'$. In particular,

$ 0 lt.eq L_x \( z \, D' \) lt.eq W^k \/ n . $

After the auxiliary integrations these are covariant local functions of $D'$, supported on (4.3). Put $L = sum_(z in O) L_x \( z \, D' \)$ and $b_0 = bb(E) L$. The reference product law in this definition is not a claim that the actual output of a switch has independent fields, or that its contact coins remain independent after conditioning on that output.

#thm([Lemma 17.])[
  (Mean load).  #emph[With $F \( x \, z \) = bb(E) L_x \( z \, D' \)$, one has 
#[#set math.equation(numbering: n => "(4.5)")
 $ F \( x \, z \) & = u^k / n sum_(y in O) bb(P)_(p_c) \( y in C_x \, med n lt.eq s_x < 2 n \) K^k \( z \, y \) \,\
c pi u^k & lt.eq b_0 lt.eq C pi u^k \, #h(2em) lr(bar.v.double F \/ b_0 bar.v.double) lt.eq r^k . $ <eq:s13>]

]
] <amp:mean>

#proof[
  The density comparison preserves total mass, so the mean is computed in the original experiment. The $k$ independent old steps have unconditional endpoint kernel $u^k K^k$, giving the displayed formula. Let
  $ B_n \( x \, y \) = bb(P)_(p_c) \( y in C_x \, med n lt.eq s_x < 2 n \) \, #h(2em) x \, y in O . $
  This is symmetric: on $y in C_x$, the two root clusters coincide. Its row sum $b_n$ is constant on $O$, and by (4.2) and $bb(P)_(p_c) \( n lt.eq s_x < 2 n \) lt.eq pi \/ sigma_O$,
  $ c n pi lt.eq b_n lt.eq 2 n pi \/ sigma_O . $
  Here $sigma_O$ is the type weight of $O$. Since $K^k$ has column sums one, $b_0 = u^k b_n \/ n$. Moreover $F \/ b_0 = \( B_n \/ b_n \) \( K^k \)^(*)$, where $*$ denotes transpose. The symmetric stochastic kernel $B_n \/ b_n$ has norm at most one, proving the norm bound. ◻
]

=== 4.4 The second moment <amp:second-moment-section>

The mean kernel already has norm at most $r^k$ after normalization. To turn $L_x \( z \, D' \)$ into output probabilities, however, we must control the fields on which its total load $L$ is large. The next estimate will let us truncate those fields while retaining a fixed fraction of the mean. The distinction between an underlying graph edge and an open edge is essential in its proof.

#thm([Lemma 18.])[
  (Second moment of the load).  #emph[There is a fixed polynomial $Q \( k \, M \) gt.eq 1$ such that 
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) L^2 lt.eq Q \( k \, M \) pi u^(2 k) #h(2em) upright("whenever ") k M lt.eq n \/ 2 upright(" and ") n gt.eq \( W \/ u \)^k . $ <eq:s14>]

]
] <amp:second-moment>

#proof[
  Write $v = k M$. Expand $L^2$ using a common reference distinguished field $D'$ and two independent families of auxiliary output fields and seeds. Thus an individual summand consists of two valid coded inverses with endpoints $z_1 \, z_2$. We divide the summands into three classes.
  ===== 4.4.1 At least one inverse makes no switch. <at-least-one-inverse-makes-no-switch.>
  Let $L_0$ be the integrated part of $L$ with no switch. In this case $A = C_x \( D' \)$ is in the bin and $z in A$. Ignoring any further conditions and summing the old-chain mass gives
  $ L_0 lt.eq u^k / n upright(bold(1))_({ n lt.eq \| A \| < 2 n }) sum_(z in A ∩ O) sum_(y in A ∩ O) K^k \( z \, y \) lt.eq 2 u^k \, $
  by the column sums. Summands with at least one such factor contribute at most $2 bb(E) \[ L_0 L \] lt.eq 4 u^k b_0 lt.eq C pi u^(2 k)$.
  ===== 4.4.2 The two hanging components are nested or adjacent. <the-two-hanging-components-are-nested-or-adjacent.>
  For a nonempty switching inverse, let $B$ be the component beyond its first seam, viewed from $x$ in $C_x \( D' \)$. By 15, $B$ is exactly the union of the inserted pieces, contains its endpoint $z$, and has at most $v$ vertices. Two such hanging components in the same rooted bridge tree are either nested or disjoint.
  Fix the first inverse and its $B^1 \, z_1$. There are at most
  $ N_v = v + v^2 + d v^3 $
  possible second endpoints among pairs for which the hanging components are nested or joined by an underlying graph edge. Indeed, if $B^2 subset.eq B^1$, there are at most $v$ endpoints. If $B^1 subset.eq B^2$, the first seam of $B^2$ is one of the last $v$ separating bridges on the route from $x$ to $z_1$. Each seam determines one hanging component and supplies at most $v$ endpoints when that component is small enough. This gives $v^2$. Finally, for disjoint adjacent components, choose a vertex of $B^2$ neighboring $B^1$ in at most $d v$ ways; its seam is among the last $v$ separating bridges on the route to that vertex, and each resulting component contains at most $v$ possible endpoints. This gives $d v^3$.
  For each endpoint, 16 bounds the integrated second inverse mass by $W^k \/ n$. Integrating the first inverse therefore bounds this class by
  $ b_0 N_v W^k / n lt.eq C N_v pi u^(2 k) \, $
  using $n gt.eq \( W \/ u \)^k$.
  ===== 4.4.3 The hanging components are disjoint and graph-nonadjacent. <the-hanging-components-are-disjoint-and-graph-nonadjacent.>
  Now suppose $B^1$ and $B^2$ are disjoint and no edge of the underlying graph joins them. Every distinguished-field edge exchanged by inverse $a$ is incident to $B^a$. Hence the two collections of masks are disjoint, including their seams. Undo both inverses. In the jointly restored distinguished field $D_00$ the exact root cluster is
  #[#set math.equation(numbering: n => "(4.7)")
   $ A_00 = C_x \( D' \) \\ \( B^1 union B^2 \) \, #h(2em) n - v lt.eq \| A_00 \| < 2 n . $ <amp:joint-root>]
  To verify the first assertion, removing two disjoint hanging components leaves a connected set containing $x$. Its contacts with each removed component are closed by that inverse, and are untouched by the other inverse. Its other boundary edges remain closed. For the size bound, either single inverse starts from $A^a = C_x \( D' \) \\ B^a$ of size in $\[ n \, 2 n \)$, and removing the other component loses at most $v$ vertices.
  The geometry of this joint restoration is shown in 2.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0.4, 0), [#box(width: 2.2cm, height: 1.05cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$A_00$]]])])
  content((4.3, 0.35), [#box(width: 2.1cm, height: 1.05cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B^1$]]])])
  content((4.3, -1.1), [#box(width: 2.1cm, height: 1.05cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B^2$]]])])
  bezier((1.5, 0), (3.25, 0.35), (2.148, 0.2529), (2.554, 0.3341), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((2.357, 0.2639), [#text(size: 9pt)[first seam]], anchor: "south", padding: 0.1176cm)
  bezier((1.5, -0.525), (3.25, -1.1), (2.145, -0.8421), (2.543, -0.9729), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((2.352, -0.8837), [#text(size: 9pt)[first seam]], anchor: "north", padding: 0.1176cm)
  circle((-0.2, -0.05), radius: 0.06985, fill: black, stroke: none)
  content((-0.2, -0.08528), [$x$], anchor: "north")
  circle((4.75, 0.35), radius: 0.06985, fill: black, stroke: none)
  content((4.785, 0.35), [$z_1$], anchor: "west")
  circle((4.75, -1.1), radius: 0.06985, fill: black, stroke: none)
  content((4.785, -1.1), [$z_2$], anchor: "west")
  line((5.7, 0.87), (5.7, -1.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6, -0.35), [#box(width: 3.235cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[No underlying graph edge joins $B^1$ to $B^2$. Their exchange masks are disjoint.]])], anchor: "west")
})],
    caption: [Figure 2: Two hanging components in a common switched root cluster. Undoing both insertions leaves $A_00$. Graph nonadjacency makes the two collections of exchange masks disjoint. The proof recovers each insertion from the jointly restored fields. The open seams shown belong to the switched configuration; internal and other incident edges are omitted. ],
  ) <fig:joint-inverse>
  We claim that, at fixed $z_1 \, z_2$ and all seeds, joint undoing is injective without retaining either code. This stronger assertion removes the factor $W^(2 k)$ from this class. The restored auxiliary fields and old-map seeds first recover both entire old chains by replay from their endpoints; the distinguished field is irrelevant to that replay. Run the first switching procedure virtually from $A_00$ with its restored chain. Here ignore only the original bin test and the test that $y_0 in A$; keep the maximal-index selection and stopping rules. We show inductively that its current set is $S_0 = S \\ B^2$, where $S$ is the corresponding current set in the original first forward run, and that the same index, component, contact and mask are selected.
  Let $i$ be the original selected index and write its seam as $e_i = \( a_i \, b_i \)$ with $a_i in S$ and $b_i in B_i^1 subset.eq B^1$. Graph nonadjacency forces $a_i in.not B^2$, so the selected old cluster still meets $S_0$. Every larger eligible index missed $S$ and therefore misses $S_0$. Thus maximality chooses the same $i$. This remains true when unused trajectory clusters meet $B^2$, or even when the original $y_0$ belongs to $B^2$.
  Replacing $S$ by $S_0$ admits only the vertices of $B^2$ to the slit domain. If the component $B_i^1$ enlarged, an enlarging open path would have a first vertex in $B^2$. The preceding part of that path lies in the old slit domain, hence in $B_i^1$. Its next edge would join $B^1$ to $B^2$, a contradiction. Thus the slit component is unchanged. Its contact list and its exchange mask are also unchanged, since their only possible differences would be edges between $B_i^1$ and $B^2$. The fixed priorities and contact uniform choose the same seam. The other undoing changed no bit on this mask. After the exchange the inductive relation $S_0 = S \\ B^2$ therefore continues to hold. The stopping tests agree because $z_1 in B^1$ and $z_1 in.not B^2$.
  The same proof applies to the second virtual replay. Run the two replays separately from the jointly restored tuple and combine their disjoint distinguished-field changes. This reconstructs the common output field, both auxiliary output families, the seams, and hence both codes. The claimed injection follows. Also the first selected seam in each replay meets $A_00$; thus each restored successful trajectory, meaning the union of its old-map whole clusters, hits $A_00$.
  The joint undo preserves the probability of the full finite Bernoulli bit tuple. More explicitly, fix all seeds and let $N$ be the number of bit coordinates in the finite comparison. A tuple with $a$ open coordinates has weight $p_c^a \( 1 - p_c \)^(N - a)$, and the exchanges preserve $a$. Preservation of this weight by itself would not control multiplicity. The replay just proved makes the map from a valid output bit tuple together with its two codes to the jointly restored bit tuple injective. Summing its weights therefore gives exactly the mass of its image, bounded by the mass of the unrestricted reference experiment. Finally integrate the fixed seeds by Tonelli’s theorem. The injection thus bounds this class by an unrestricted reference product experiment, weighted by $1 \/ n^2$, with an iid root field and two independent old-chain families. Retain only the size window in (4.7), success of both chains, and the condition that each trajectory hits the root cluster. Independence of the two chain families, conditional on that cluster, is invoked in this reference experiment only, after the injective comparison.
  For a deterministic finite set $A$, let $h_z \( A \)$ be the probability that a successful $k$-step old trajectory from $z in O$ hits $A$. Then
  #[#set math.equation(numbering: n => "(4.8)")
   $ sum_(z in O) h_z \( A \) lt.eq C \| A \| v u^k . $ <amp:trajectory-hit>]
  Indeed send unit mass from a starting vertex $z in O$ to every vertex of its trajectory union on success, and send zero from other types. The expected outgoing mass at $z$ is at most $v u^k$, because each fresh step succeeds with probability $u$ and the union has at most $v$ vertices. Weighted transport bounds the expected incoming mass at every vertex by $v u^k \/ min_i sigma_i$. Summing over vertices of $A$ and applying a union bound proves (4.8).
  Conditional on the reference root cluster $A$, the summed contribution of both chains is bounded by the square of (4.8). Since $v lt.eq n \/ 2$, the contribution of this class is at most
  $ frac(C v^2 u^(2 k), n^2) bb(E)_(p_c) #scale(x: 120%, y: 120%)[\[] s_x^2 \; n - v lt.eq s_x < 2 n #scale(x: 120%, y: 120%)[\]] lt.eq C v^2 u^(2 k) bb(P)_(p_c) \( n \/ 2 lt.eq s_x < 2 n \) lt.eq C' v^2 pi u^(2 k) . $
  The final inequality uses (4.2) and the positive type weight $sigma_O$. Combining the three classes proves (4.6); for example a sufficiently large graph-dependent multiple of $1 + v + v^2 + d v^3$ is an admissible polynomial $Q \( k \, M \)$. ◻
]

=== 4.5 Truncation and iteration <amp:iteration-section>

#thm([Lemma 19.])[
  (One amplification step).  #emph[Fix an old map. For $n in cal(N)$ tending to infinity and $k = O \( log n \)$ with $k M lt.eq n \/ 2$ and $n gt.eq \( W \/ u \)^k$, there is, for all sufficiently large such $n$, a new local map with parameters satisfying 
#[#set math.equation(numbering: n => "(4.9)")
 $ u' gt.eq c' pi \/ Q \( k \, M \) \, #h(2em) r' lt.eq 2 r^k \, #h(2em) M' = 2 n + k M . $ <eq:s15>]

 The threshold for $n$ may depend on the fixed old map.]
] <amp:step>

#proof[
  Choose a fixed sufficiently large constant $C_0$ and put $b = C_0 Q \( k \, M \) u^k$. By (4.5) and (4.6), discarding fields on which $L > b$ loses mean mass at most
  $ bb(E) \[ L \; L > b \] lt.eq frac(bb(E) L^2, b) lt.eq b_0 \/ 4 . $
  On the remaining fields, discard also those whose root cluster is not good for cap $M'$. The load is already supported on the cap by (4.3). Thus (3.1) bounds this second loss by $b exp \( - \( M' \)^epsilon.alt \)$. Relative to $b_0 gt.eq c pi u^k$, it is at most
  $ C Q \( k \, M \) n^beta exp \( - \( M' \)^epsilon.alt \) \, $
  which tends to zero when the old map is fixed and $k = O \( log n \)$. For sufficiently large $n$ the second loss is also at most $b_0 \/ 4$.
  On a retained field output $z$ with probability $L_x \( z \, D' \) \/ b$, and fail with the remaining probability. This is legitimate because $L lt.eq b$. It is local and covariant, and every successful input has its endpoint in a good root cluster of size at most $M'$. If $F'$ is the retained, unnormalized endpoint mass kernel, its row sum $b'_0$ satisfies $b'_0 gt.eq b_0 \/ 2$, and $0 lt.eq F' lt.eq F$ entrywise. Hence
  $ u' = b'_0 \/ b gt.eq c' pi \/ Q \( k \, M \) \, #h(2em) r' = lr(bar.v.double F' \/ b'_0 bar.v.double) lt.eq 2 lr(bar.v.double F \/ b_0 bar.v.double) lt.eq 2 r^k . $
  The probabilities defining this rule are now fixed numbers. They can later be applied to percolation at another parameter without changing the rule, and its stated physical success conditions still hold. ◻
]

#proof[
  Choose $xi > 0$ so small that
  $ c_xi = frac(beta + xi + \( s + xi \) \( 1 + xi \), 1 - xi) < 1 \; $
  this is possible because $beta + s < 1$. By 14, start with $H > 1$ and $M$ sufficiently large for the estimates below. For any fixed old map set
  $ t = U + \( s + xi \) m \, #h(2em) a = ⌈C M^s log M \/ u⌉ . $
  Choose $C$ large enough that $a gt.eq max { 2 \, W \/ u }$. For all sufficiently large $M$, uniformly in $0 < u lt.eq 1$, the logarithmic factor and the rounding cost are absorbed by $xi log M$, giving $log a lt.eq t$.
  Only after fixing this old map and $a$ choose $n in cal(N)$ large, and put $k = floor.l log n \/ log a floor.r$. Then $k arrow.r oo$, $k = O \( log n \)$, and $n gt.eq a^k gt.eq \( W \/ u \)^k$. The condition $k M lt.eq n \/ 2$ and all goodness and truncation thresholds eventually hold. Also
  $ k log a lt.eq log n < \( k + 1 \) log a lt.eq \( k + 1 \) t . $
  By (4.9), $pi gt.eq n^(- beta)$, and the polynomial dependence of $Q \( k \, M \)$ on $k$ for fixed $M$, we can make $n$ large enough that
  $ U' lt.eq k \( beta + xi \) t \, #h(2em) m' lt.eq k \( 1 + xi \) t \, #h(2em) H' gt.eq k \( 1 - xi \) H > 1 . $
  For example, the first follows from $U' lt.eq beta log n + log Q \( k \, M \) + O \( 1 \)$, where $log Q \( k \, M \) = O_M \( log \( k + 1 \) \)$; the second follows from $M' lt.eq \( 5 \/ 2 \) n$; the third follows from $r' lt.eq 2 r^k$. Consequently, with $t' = U' + \( s + xi \) m'$,
  $ t' / H' lt.eq c_xi t / H . $
  At each stage choose the new scale still larger if necessary so that $H' gt.eq 2 H$. This changes none of the preceding inequalities. Iterate, keeping the same orbit $O$ and scale sequence $cal(N)$ throughout. Then $t \/ H$ tends to zero and $H$ tends to infinity. Since $U + m lt.eq max { 1 \, \( s + xi \)^(- 1) } thin t$, the desired conclusion follows. Each individual choice uses a finite radius; no uniform radius is used in this iteration. ◻
]

== 5 Critical moments and susceptibility <mom:section>

We first turn the local maps into a lower bound on the rate of growth of the susceptibility. Under the temporary assumption (4.1), 3 supplies maps on a fixed orbit $O$ with

$ U = log \( 1 \/ u \) \, #h(2em) m = log M \, #h(2em) H = log \( 1 \/ lr(bar.v.double  bar.v.double) K \) \, #h(2em) frac(U + m, H) arrow.r 0 . $

The calculations with susceptibilities and second moments take place at $p < p_c$, where the preliminary estimates ensure their finiteness.

#thm([Lemma 20.])[
  (Maximal susceptibility in an intrinsic ball).  #emph[For a deterministic induced domain $D$, put $f_D \( v \) = bb(E)_p \| C_v^D \|$ for $v in D$, and $f_D \( v \) = 0$ otherwise. Let $cal(B)^D \( v \, M \)$ be the vertices reachable from $v$ by an open path in $D$ of length at most the nonnegative integer $M$. If $v in D$ and $0 < p < p_c$, then 
#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E)_p max_(z in cal(B)^D \( v \, M \)) f_D \( z \) lt.eq (1 + frac(1 - p, p) M) f_D \( v \) . $ <eq:s16>]

]
] <mom:maximal-potential>

#proof[
  First let $D$ be finite. Select a maximizer by a fixed tie rule. For each $w in D$, take a percolation configuration $omega$ and expose the exact vertex set $B = C_w^D \( omega \)$. Replace every edge with at least one endpoint in $B$ by an independent Bernoulli($p$) bit, leaving all other edges unchanged; call the resulting configuration $tilde(omega)$. Conditional on $B$, the unchanged exterior edges have product law, and all replaced bits are fresh. Consequently $tilde(omega)$ has product law independent of $B$. If $Z$ is the selected maximizer in $cal(B)^D \( v \, M \; tilde(omega) \)$, this independence gives
  $ sum_(w in D) bb(P) \( Z in B \) = sum_(z in D) bb(P) \( Z = z \) sum_(w in D) T_p^D \( w \, z \) = bb(E)_p max_(z in cal(B)^D \( v \, M \)) f_D \( z \) . $
  Here a separate coupling is used for each $w$; only the marginal law of $Z$ needs to be the same in these couplings.
  If $v in.not B$ and $Z in B$, take the first edge entering $B$ along a simple $tilde(omega)$-open path from $v$ to $Z$ of length at most $M$. This edge was closed in $omega$, and its exterior endpoint was reachable from $v$ in $D \\ B$ by at most $M - 1$ open edges of $omega$. Let $N_w \( omega \)$ count boundary edges with this property, setting it to zero when $v in B$. Then
  $ bb(P) \( Z in B \) lt.eq T_p^D \( v \, w \) + bb(E)_p N_w . $
  To bound the last expectation, open one counted, distinguished edge. In the new configuration it is pivotal for $v arrow.l.r w$: it is the only open edge entering the old cluster $B$. Moreover it is among the first $M$ bridges separating $v$ from $w$, in their order from $v$, because a simple path reaches it using at most $M$ edges. For a fixed output and a distinguished edge, closing that edge recovers the input. There are at most $M$ possible distinguished edges in each connected output. Comparing the two possible values of that one bit therefore gives
  $ bb(E)_p N_w lt.eq frac(1 - p, p) M thin T_p^D \( v \, w \) . $
  Summation over $w$ proves (5.1). For an infinite domain, exhaust $D$ by finite induced domains containing $v$. Their susceptibilities and intrinsic balls increase to the corresponding objects in $D$. The maximum also converges monotonically: the intrinsic $M$-ball is contained in a deterministic finite graph ball, and every witnessing path is finite. Monotone convergence proves the assertion. The case $M = 0$ is immediate. ◻
]

#thm([Lemma 21.])[
  (A local map in a deleted domain).  #emph[Fix one of the maps above, with critical success probability $u > 0$, cap $M gt.eq 2$, and $H > 1$. Run its fixed rule at parameter $p$. On a map-dependent interval $p_0 lt.eq p < p_c$, with $p_0 gt.eq p_c \/ 2$, its success probability $u_p$ and conditional endpoint kernel $K_p$ satisfy 
$ u_p gt.eq u \/ 2 \, #h(2em) lr(bar.v.double K_p bar.v.double) lt.eq e^(- \( H - 1 \)) . $

 For a deterministic set $A subset.eq V$, put $F_A = f_(V \\ A) \/ chi$, with value zero on $A$. There are constants $Z \, C_(upright("map"))$, uniform on this interval, such that $2 lt.eq Z lt.eq C M \/ u$ and, for every $v in O$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ \( K_p F_A \) \( v \) lt.eq Z F_A \( v \) + C_(upright("map")) h_A \( v \) \, #h(2em) h_A \( v \) = sum_(a in A\
"dist" \( v \, a \) lt.eq M) sum_(b tilde.op a) F_A \( b \) . $ <eq:s17>]

 In the action of $K_p$, functions are restricted to $O$. The constant $C$ depends only on the graph.]
] <mom:map-potential>

#proof[
  The unconditional endpoint kernel has finite range and continuous entries as a function of $p$: its rule queries only finitely many edge bits, and its auxiliary randomization has a fixed law. Covariance makes its row sums constant on $O$. The absolute difference of two such kernels is invariant on $O times O$, so (2.2) gives equal row and column sums. The finite range and the row–column norm bound therefore give operator-norm continuity. Dividing by the positive scalar $u_p arrow.r u$ proves the assertions after shortening the interval. The kernel $K_p$ is stochastic and invariant, and hence has column sums one, although it need not be symmetric. The cap and connection conditions are properties of the accepted local patterns, so every success at $p$ still has a simple open path of length at most $M$ to its endpoint.
  Choose such a path on each success. If it avoids $A$, its endpoint lies in the intrinsic $M$-ball in $V \\ A$. Thus 20 bounds its unconditional contribution to the endpoint potential by $#scale(x: 120%, y: 120%)[\(] 1 + \( 1 - p \) M \/ p #scale(x: 120%, y: 120%)[\)] F_A \( v \)$; this case is empty if $v in A$. Endpoints in $A$ contribute zero. In the remaining case let $a tilde.op b$ be the last exit of the chosen path from $A$. Its terminal segment from $b$ to the endpoint $y$ lies in $V \\ A$ and has length $l lt.eq M$. Positive association with the event that this deterministic segment is open yields
  $ f_(V \\ A) \( b \) gt.eq bb(E)_p #scale(x: 120%, y: 120%)[\[] \| C_y^(V \\ A) \| \; upright("the segment is open") #scale(x: 120%, y: 120%)[\]] gt.eq p^l f_(V \\ A) \( y \) . $
  Therefore $F_A \( y \) lt.eq p^(- M) F_A \( b \)$. Since $"dist" \( v \, a \) lt.eq M$, summing over all possible last exits bounds this contribution by $p^(- M) h_A \( v \)$. Divide the two bounds by $u_p$. Because $p gt.eq p_c \/ 2$ and $u_p gt.eq u \/ 2$, the first coefficient can be enlarged to a constant $Z in \[ 2 \, C M \/ u \]$, and the second to a finite constant depending on the fixed map. This proves (5.2). ◻
]

#thm([Proposition 4.])[
  (Critical fractional moments).  #emph[For every $0 < alpha < 1 \/ 2$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ sup_(v in V) bb(E)_(p_c) s_v^alpha < oo . $ <eq:s21>]

]
] <mom:critical-moments>

#proof[
  Assume (4.1), and define
  $ D \( p \) = chi^(- 2) [sum_(b tilde.op o) bb(E)_p \( s_o s_b \; med C_o eq.not C_b \)] . $
  By (2.4), $\( 1 - p \) chi' = chi^2 D \( p \)$. Our first goal is to prove, for every $gamma > 0$, that $D \( p \) gt.eq c_gamma chi^(- gamma)$ when $p$ is sufficiently close to $p_c$. We will compare two bounds on the exterior potential reached by repeated endpoint-map steps: (5.2) bounds it above in terms of $D \( p \)$, while the small norm of $K_p$ bounds the contribution of endpoints in the root’s own cluster and hence leaves a positive exterior contribution.
  Fix a map and its interval as in 21. For $x in O$, expose $A = C_x$ in an independent $p$-field, and use the possibly unnormalized expectation
  $ hat(bb(E)) \[ G \( A \) \] = bb(E)_p [s_x / chi G \( C_x \)] . $
  For each fixed vertex $a$, exposure of the exact cluster $C_a$ leaves fresh exterior edges and hence gives
  $ hat(bb(E)) [upright(bold(1))_({ a in A }) sum_(b tilde.op a) F_A \( b \)] & = chi^(- 2) sum_(b tilde.op a) bb(E)_p [s_a upright(bold(1))_({ x in C_a }) f_(V \\ C_a) \( b \)]\
 & lt.eq chi^(- 2) sum_(b tilde.op a) bb(E)_p \( s_a s_b \; med C_a eq.not C_b \) lt.eq c_sigma D \( p \) \, $
  where $c_sigma = \( min_i sigma_i \)^(- 1)$. The last inequality follows because the preceding nonnegative expression is constant on each vertex type and its type average is $D \( p \)$. Bounded degree now gives $hat(bb(E)) h_A \( v \) lt.eq C_(upright("map")) D \( p \)$ uniformly in $v$. Iterate (5.2), use stochasticity of $K_p$, and note that $F_A \( x \) = 0$. Since $Z gt.eq 2$, the geometric sum gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ hat(bb(E)) \( K_p^j F_A \) \( x \) lt.eq C_(upright("map")) Z^j D \( p \) \, #h(2em) j gt.eq 1 . $ <eq:s18>]
  We next give a lower bound for the same quantity. Fresh exterior exposure identifies it as
  $ hat(bb(E)) \( K_p^j F_A \) \( x \) = chi^(- 2) sum_(v in O) K_p^j \( x \, v \) bb(E)_p \( s_x s_v \; med C_x eq.not C_v \) . $
  Without the distinctness condition, positive association and the uniform near-critical comparison of susceptibilities give a lower bound $c_0 > 0$ for this normalized sum. To control what is removed, write $I = C_x ∩ O$, which is nonempty. Mass transport restricted to $O$ gives the exact identity
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(v in O) K_p^j \( x \, v \) bb(E)_p \( s_x^2 \; med v in C_x \) = bb(E)_p [frac(s_x^2, \| \| I) chevron.l upright(bold(1))_I \, K_p^j upright(bold(1))_I chevron.r] lt.eq lr(bar.v.double K_p bar.v.double)^j bb(E)_p s_x^2 lt.eq C lr(bar.v.double K_p bar.v.double)^j chi^3 . $ <mom:diagonal-loss>]
  For completeness, the transport sends, from $z in O$ to each $y in C_z ∩ O$, the mass
  $ frac(s_z^2, \| C_z ∩ O \|) sum_(v in C_z ∩ O) K_p^j \( z \, v \) . $
  Its outgoing and incoming expectations are the two sides of the identity. The norm bound uses $lr(bar.v.double upright(bold(1))_I bar.v.double)_2^2 = \| \| I$; it does not require symmetry of $K_p$. Finally, the three-arm estimate (2.1) gives $bb(E)_p s_x^2 lt.eq chi_max^3 lt.eq C chi^3$.
  Choose $C_(*) > 1$ large enough that
  $ j = ⌈frac(log \( C_(*) chi \), H - 1)⌉ $
  makes the normalized loss in (5.5) at most $c_0 \/ 2$. Combining this lower bound with (5.4) and $log Z lt.eq U + m + C'$ gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ D \( p \) gt.eq c_(upright("map")) chi^(- \( U + m + C' \) \/ \( H - 1 \)) . $ <eq:s19>]
  Here $C'$ is graph-dependent; the prefactor may depend on the fixed map. Since $U + m gt.eq log 2$, the maps with $\( U + m \) \/ H arrow.r 0$ have $H arrow.r oo$. Thus, for any $0 < gamma < 1$, we can fix a map for which the exponent in (5.6) is at most $gamma$. The susceptibility identity (2.4) then gives, almost everywhere on its interval, $chi' gt.eq c chi^(2 - gamma)$. In particular
  $ frac(d, d p) chi^(- \( 1 - gamma \)) lt.eq - \( 1 - gamma \) c . $
  Integrating from $p$ to $r < p_c$, discarding the nonnegative value at $r$, and then letting $r arrow.t p_c$ yields
  #[#set math.equation(numbering: n => "(5.7)")
   $ chi \( p \) lt.eq C_gamma \( p_c - p \)^(- 1 \/ \( 1 - gamma \)) . $ <eq:s20>]
  Local absolute continuity, established with (2.4), justifies this differential calculation.
  We transfer this bound to a critical tail by an explicit comparison of exploration transcripts. For a large integer $N$, put $p = p_c - N^(- 1 \/ 2)$. From any vertex $v$, explore until the cluster is exhausted or $N$ vertices have been discovered. Use a fixed nonretesting exploration order. There are at most $d N$ fresh edge queries, and the transcript decides the event $s_v gt.eq N$. If $L_N$ is the likelihood ratio of its law at $p_c$ relative to its law at $p$, each active query contributes either $p_c \/ p$ or $\( 1 - p_c \) \/ \( 1 - p \)$. For fixed $b > 1$, its conditional $b$th-moment factor under $p$ is
  $ p \( p_c \/ p \)^b + \( 1 - p \) \( \( 1 - p_c \) \/ \( 1 - p \) \)^b lt.eq 1 + C_b \( p_c - p \)^2 . $
  Indeed this expression is twice continuously differentiable in a fixed neighborhood of the interior point $p_c$, equals one there, and has first derivative zero there. Pad the stopped exploration with inactive factors equal to one. Successive conditioning for the deterministic $d N$ steps gives
  $ bb(E)_p L_N^b lt.eq \( 1 + C_b \/ N \)^(d N) lt.eq e^(d C_b) . $
  Hölder’s inequality and Markov’s inequality therefore imply, uniformly in $v$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ bb(P)_(p_c) \( s_v gt.eq N \) = bb(E)_p \[ L_N upright(bold(1))_({ s_v gt.eq N }) \] lt.eq C'_b (frac(chi_v \( p \), N))^(1 - 1 \/ b) . $ <mom:transcript-comparison>]
  Choose $gamma$ small and then $b$ large enough that
  $ theta = \( 1 - 1 \/ b \) (1 - frac(1, 2 \( 1 - gamma \))) > alpha \, $
  where $alpha$ is the exponent in (4.1). For all sufficiently large $N$, (5.7) applies to the chosen $p$; the uniform type comparison and (5.8) give $bb(P)_(p_c) \( s_v gt.eq N \) lt.eq C N^(- theta)$. Summing $\( \( N + 1 \)^alpha - N^alpha \) bb(P)_(p_c) \( s_v > N \)$ proves a uniform finite $alpha$th moment, contrary to (4.1). This establishes (5.3) for every $0 < alpha < 1 \/ 2$. ◻
]

The next argument uses these moments without the temporary divergence assumption. The conversion from a critical volume tail to a susceptibility estimate is the principle established in #cite(label("Hutchcroft2020Exponents")) Theorem 1.1 for transitive graphs. We prove the version needed here with constants uniform over the finitely many vertex types. We include the covariance form of the O’Donnell–Saks–Schramm–Servedio inequality #cite(label("ODonnellSaksSchrammServedio2005")) Section 3.3, Equation (6), in the form needed for all vertex types and all finite domains.

#thm([Lemma 22.])[
  (A decision-tree covariance bound).  #emph[Let $X$ have a finite product law, let $0 lt.eq g lt.eq 1$, and let an algorithm determine $g \( X \)$ by querying coordinates without repetition. Write $delta_i$ for the probability that it queries coordinate $i$, and let $X^(\( i \))$ replace just that coordinate by an independent copy. For every real function $f$ on the product space, 
#[#set math.equation(numbering: n => "(5.9)")
 $ \| "Cov" \( f \( X \) \, g \( X \) \) \| lt.eq sum_i delta_i bb(E) \| f \( X \) - f \( X^(\( i \)) \) \| . $ <mom:covariance>]

 Independent randomization of the algorithm is allowed.]
] <mom:decision-tree>

#proof[
  Take an independent product copy $Y$. Run the algorithm on $X$, and let $Z^t$ replace the first $t$ queried coordinates of $X$ by their values in $Y$. Include the algorithm’s independent seed in each transcript. Conditional on any pre-query transcript, the unqueried coordinates of $X$ retain their independent original marginals, since that transcript constrains only queried bits. The replaced coordinates of $Y$ are independent of this transcript and of those unqueried bits. Thus the pre-query hybrid has the original product law conditional on the transcript. If the next index is $i$, that index is transcript-measurable and $Y_i$ is still fresh. Consequently
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \| f \( Z^(t - 1) \) - f \( Z^t \) \| divides upright("pre-query transcript") #scale(x: 120%, y: 120%)[\]] = bb(E) \| f \( X \) - f \( X^(\( i \)) \) \| . $
  At the terminal transcript, the same reasoning gives product law for $Z^T$ conditional on the entire transcript. Since the transcript determines $g \( X \)$, it follows that
  $ "Cov" \( f \( X \) \, g \( X \) \) = bb(E) \[ \( f \( X \) - f \( Z^T \) \) g \( X \) \] . $
  Telescope and use $0 lt.eq g lt.eq 1$ before conditioning on partial transcripts. The preceding conditional-increment identity then proves (5.9), because each coordinate is queried at most once. Intermediate hybrids need not be independent of $g \( X \)$. ◻
]

#thm([Proposition 5.])[
  (An almost linear susceptibility bound).  #emph[For every $eta > 0$ there is $C_eta < oo$ such that 
#[#set math.equation(numbering: n => "(5.10)")
 $ chi_max \( p \) lt.eq C_eta \( p_c - p \)^(- 1 - eta) \, #h(2em) 0 lt.eq p < p_c . $ <eq:s22>]

]
] <mom:susceptibility>

#proof[
  Fix $0 < a < 1 \/ 2$. In a finite induced domain, fix a vertex $v$ and an integer $n gt.eq 2$. Let $f$ indicate $\| C_v \| gt.eq n$. Independently mark every vertex with probability $1 \/ n$, and let $g$ indicate that $C_v$ contains a mark. An algorithm deciding $g$ first reveals all marks and then explores the clusters of marked vertices. It queries an edge only if at least one endpoint belongs to a cluster containing a mark. By 4, restriction coupling, and monotonicity in $p lt.eq p_c$, each vertex has this property with probability at most
  $ bb(E)_p \[ 1 - \( 1 - 1 \/ n \)^(s_v) \] lt.eq bb(E)_p min \( 1 \, s_v \/ n \) lt.eq n^(- a) bb(E)_p s_v^a lt.eq C_a n^(- a) . $
  Thus every edge has revealment at most $2 C_a n^(- a)$, uniformly in the domain, the root, and $p lt.eq p_c$. Mark coordinates have zero influence on $f$. For an increasing Boolean edge function, its absolute resampling influence is exactly $2 p \( 1 - p \)$ times the probability that the edge is pivotal. Writing $F \( p \) = bb(P)_p \( s_v gt.eq n \)$, finite-product differentiation and 22 give
  $ "Cov" \( f \, g \) lt.eq C_a n^(- a) thin 2 p \( 1 - p \) F' \( p \) . $
  On the other hand, conditioning on the percolation configuration gives
  $ "Cov" \( f \, g \) gt.eq #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - 1 \/ n \)^n - C_a n^(- a) #scale(x: 120%, y: 120%)[\)] F \( p \) . $
  For all sufficiently large $n$, the factor in parentheses is bounded below by a positive constant. Since $2 p \( 1 - p \) lt.eq 1 \/ 2$, we obtain $F' \( p \) gt.eq c_a n^a F \( p \)$ for $0 < p lt.eq p_c$. Multiplying by $exp \( - c_a n^a p \)$ shows that $exp \( - c_a n^a p \) F \( p \)$ is nondecreasing. Integrating up to $p_c$ therefore gives, including the case $F equiv 0$,
  #[#set math.equation(numbering: n => "(5.11)")
   $ bb(P)_p \( s_v gt.eq n \) lt.eq C_a n^(- a) exp { - c_a \( p_c - p \) n^a } . $ <mom:stretched-tail>]
  We used the critical moment bound to estimate $F \( p_c \)$. Continuity gives the assertion also at $p = 0$. Increasing finite domain exhaustion is legitimate because the event $s_v gt.eq n$ has a finite open witness; all constants are independent of the domain. Enlarge the constant to cover the finitely many smaller values of $n$.
  Put $delta = p_c - p$. The function $x^(- a) e^(- c_a delta x^a)$ is decreasing on $\( 0 \, oo \)$. The substitution $t = c_a delta x^a$ in its integral gives
  $ sum_(n gt.eq 1) n^(- a) e^(- c_a delta n^a) lt.eq C_a delta^(- \( 1 - a \) \/ a) . $
  Summing (5.11) therefore proves the same bound for $chi_max$. Finally take $a = 1 \/ \( 2 + eta \)$, for which $\( 1 - a \) \/ a = 1 + eta$, to obtain (5.10). ◻
]

== 6 A subpower bound for the triangle trace <trace:section>

For $p < p_c$ write

$ T = T_p \, #h(2em) m_p = lr(bar.v.double T_p bar.v.double) \, #h(2em) a_j = "tr" \( T^j \) . $

The quantity $a_3$ is the type average of the triangle diagram. We will prove that it grows more slowly than any prescribed positive power of $\( p_c - p \)^(- 1)$.

Triangle diagrams and positive connection matrices are classical components of the tree-graph method of Aizenman and Newman #cite(label("AizenmanNewman1984")); quantitative relations between triangle diagrams and susceptibility are developed in #cite(label("Hutchcroft2022Triangle")). The closed-contact estimate below is related to the exploration-score and critical-tail refinements of the two-ghost method #cite(label("Hutchcroft2020Locality")) #cite(label("Hutchcroft2021PowerLaw")). We prove the specific contact and trace bounds used here.

For a nonnegative invariant function $F$ of an ordered pair of distinct finite clusters, define the positive summation functional

$ cal(D) \( F \) = [bb(E)_p 1 / s_o sum_(B eq.not C_o) F \( C_o \, B \)] . $

The sum ranges over the other open clusters in the configuration. For a nonnegative invariant kernel $J$, put

$ k_J \( A \, B \) = sum_(x in A) sum_(y in B) J \( x \, y \) \, #h(2em) k_e = k_("Adj") . $

In particular $k_e$ counts graph edges between the two clusters. Mass transport gives the useful rerooting formula

#[#set math.equation(numbering: n => "(6.1)")
 $ cal(D) \( k_J F \) = [bb(E)_p sum_v J \( o \, v \) F \( C_o \, C_v \) upright(bold(1))_({ C_o eq.not C_v })] . $ <trace:rerooting>]

Indeed send from $x$ to each $y in C_x$ the mass $s_x^(- 1) sum_v J \( y \, v \) F \( C_x \, C_v \) upright(bold(1))_({ C_x eq.not C_v })$. The outgoing and incoming sides of (2.2) are precisely the two sides of (6.1). All terms are nonnegative, so no integrability assumption is needed for this identity. Another application, sending $F \( A \, B \) \/ \( \| \| A \| \| B \)$ from every vertex of $A$ to every vertex of $B$, shows that $cal(D) \( F \( A \, B \) \) = cal(D) \( F \( B \, A \) \)$.

#thm([Lemma 23.])[
  (Contacts of two large clusters).  #emph[Fix $0 < alpha < 1 \/ 2$ and $epsilon.alt_1 > 0$ such that $r = 1 \/ 2 + epsilon.alt_1 - 2 alpha < 0$. Uniformly for $p_c \/ 2 lt.eq p < p_c$ and $L gt.eq 1$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ cal(D) (k_e^2 upright(bold(1))_({ min \( \| \| A \, \| \| B \) gt.eq L })) lt.eq C L^(1 \/ 2 + epsilon.alt_1 - 2 alpha) . $ <eq:s24>]

]
] <trace:contact-tail>

#proof[
  Fix an oriented graph edge $\( x \, v \)$ and $n gt.eq 1$. Let
  $ H_n = { C_x eq.not C_v \, med n lt.eq min \( s_x \, s_v \) < 2 n } . $
  On distinct clusters the two size events have disjoint finite open witnesses. The BK inequality, coupling with critical percolation, and (5.3) give
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(P)_p \( H_n \) lt.eq C n^(- 2 alpha) . $ <trace:two-large-clusters>]
  We also need to control their number of contacts, and for this we compare two exploration scores.
  First explore $C_v$ in the full graph, querying every edge incident to each discovered vertex exactly once, including edges whose endpoints have both already been discovered. Stop after $N = ceil.l 2 d n ceil.r$ queries if the exploration has not finished. Let $S_(upright("full"))$ be the sum of $omega_f - p$ over the tested edges. Every active query is a fresh Bernoulli($p$) bit. Padding after stopping by zero increments, the elementary centered Bernoulli exponential bound gives
  $ bb(E)_p e^(lambda S_(upright("full"))) lt.eq e^(N lambda^2 \/ 8) \, #h(2em) bb(P)_p \( \| S_(upright("full")) \| > t \) lt.eq 2 e^(- 2 t^2 \/ N) . $
  This is an unconditional estimate, with no cluster-size event imposed.
  On the same percolation configuration, perform a second exploration by first exposing $A = C_x$ together with its internal bits and closed boundary. If $v in.not A$, explore the cluster of $v$ in $V \\ A$, again querying every incident edge of that domain and using the same deterministic query cap $N$. Let the resulting score be $S_(upright("ext"))$, and set it to zero if $v in A$. Conditional on the exposure, all the queried exterior bits are fresh and independent. The identical tail bound therefore holds conditionally, uniformly in $A$, and hence also unconditionally after averaging over $A$.
  On $H_n ∩ { s_v lt.eq s_x }$, both explorations finish the same cluster $B = C_v$, because $\| \| B < 2 n$ and its number of incident edges is at most $d \| \| B < N$. The completed queried sets are, respectively, all full-graph edges incident to $B$ and all such edges with both ends outside $A$. Their difference consists exactly of the $A$–$B$ contacts, which are closed. Query order is irrelevant to these completed sums, so
  $ S_(upright("full")) - S_(upright("ext")) = - p k_e \( A \, B \) . $
  It follows that the event under consideration with $k_e \( A \, B \) > 2 t \/ p$ is contained in the union of the two score-tail events. Take $t = n^(1 \/ 2 + epsilon.alt_1)$, and use $p gt.eq p_c \/ 2$. Interchanging $x$ and $v$ handles the opposite size order. Thus
  $ bb(P)_p (H_n ∩ { k_e \( C_x \, C_v \) > C n^(1 \/ 2 + epsilon.alt_1) }) lt.eq C e^(- c n^(2 epsilon.alt_1)) . $
  Each score was concentrated in its own fresh law before intersecting with $H_n$; no independence between the scores is asserted. Since $k_e lt.eq d min \( s_x \, s_v \) < 2 d n$ on $H_n$, (6.3) now yields
  $ bb(E)_p \[ k_e \( C_x \, C_v \) upright(bold(1))_(H_n) \] lt.eq C n^(1 \/ 2 + epsilon.alt_1 - 2 alpha) + C n e^(- c n^(2 epsilon.alt_1)) lt.eq C n^r . $
  Apply (6.1) with one contact factor and partition $min \( \| \| A \, \| \| B \) gt.eq L$ into the bins $\[ 2^j L \, 2^(j + 1) L \)$, $j gt.eq 0$. There are at most $d$ neighbors of each root, and $sum_(j gt.eq 0) \( 2^j L \)^r lt.eq C_r L^r$ because $r < 0$. This proves (6.2). ◻
]

#thm([Proposition 6.])[
  (Subpower triangle growth).  #emph[For every $eta > 0$ there is $C_eta < oo$ such that 
#[#set math.equation(numbering: n => "(6.4)")
 $ a_3 \( p \) lt.eq C_eta \( p_c - p \)^(- eta) \, #h(2em) p_c \/ 2 lt.eq p < p_c . $ <eq:s23>]

]
] <trace:subpower>

#proof[
  All operators below are bounded at each subcritical parameter. The operator-norm local absolute continuity supplied by (2.4), and cyclicity of the finite trace, give $a'_3 = 3 "tr" \( T^2 T' \)$ almost everywhere. Set $J = T^2$. For fixed terminals $x \, y$, the first identity in (2.4) can also be written
  $ \( 1 - p \) T'_p \( x \, y \) = bb(E)_p \[ k_e \( C_x \, C_y \) upright(bold(1))_({ C_x eq.not C_y }) \] . $
  Each edge between the two terminal clusters has exactly one orientation from the first cluster to the second. Applying (6.1) to $J$ therefore gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ \( 1 - p \) a'_3 = 3 cal(D) \( k_e k_J \) quad upright("for almost every ") p < p_c . $ <eq:s25>]
  We will use the following square bound:
  #[#set math.equation(numbering: n => "(6.6)")
   $ cal(D) \( k_J^2 \) lt.eq "tr" \( J T J T \) = a_6 lt.eq m_p^3 a_3 . $ <trace:kernel-square>]
  To check the first inequality, reroot one $J$ factor using (6.1) and expand the other one. This gives
  $ [sum_(v \, x' \, y') J \( o \, v \) J \( x' \, y' \) bb(P)_p \( o arrow.l.r x' \, med v arrow.l.r y' \, med C_o eq.not C_v \)] . $
  The two connections on this event have disjoint open witnesses, so BK bounds their probability by $T \( o \, x' \) T \( v \, y' \)$. Symmetry of $J$ and $T$ identifies the resulting sum with $"tr" \( J T J T \)$. Because $J = T^2$, this is $a_6$. Finally, positivity of $T$ gives $T^6 lt.eq m_p^3 T^3$ in quadratic-form order, which proves the remaining inequality after taking the trace.
  Choose $alpha$ and $epsilon.alt_1$ as in 23. Split (6.5) according to whether the smaller terminal cluster has size less than $L$. For the part where $A$ is small, reroot one contact and expose $A = C_o$ with its internal bits and boundary. If $v in.not A$, its exterior cluster is fresh, so
  $ bb(E)_p \[ k_J \( A \, C_v \) divides A upright(" and its exposure") \] lt.eq sum_(y in A) sum_z J \( y \, z \) T \( v \, z \) = sum_(y in A) \( T^3 \) \( y \, v \) . $
  The positive operator $T^3$ satisfies
  $ \| \( T^3 \) \( y \, v \) \| lt.eq sqrt(\( T^3 \) \( y \, y \) \( T^3 \) \( v \, v \)) lt.eq c_sigma a_3 \, $
  since every diagonal entry is bounded by $a_3 \/ min_i sigma_i$. Consequently
  $ cal(D) \( k_e k_J upright(bold(1))_({ \| \| A < L }) \) lt.eq d c_sigma a_3 thin \[ bb(E)_p \( s_o upright(bold(1))_({ s_o < L }) \) \] lt.eq C L^(1 - alpha) a_3 . $
  Here $s upright(bold(1))_({ s < L }) lt.eq L^(1 - alpha) s^alpha$ and (5.3) supply the last bound. Reversing the ordered cluster pair gives the same estimate when $B$ is small, since $k_e$ and $k_J$ are symmetric in their two arguments.
  For the remaining part, Cauchy–Schwarz for the positive measure underlying $cal(D)$, followed by (6.2) and (6.6), gives
  $ cal(D) \( k_e k_J upright(bold(1))_({ min \( \| \| A \, \| \| B \) gt.eq L }) \) lt.eq C L^(1 \/ 4 + epsilon.alt_1 \/ 2 - alpha) m_p^(3 \/ 2) sqrt(a_3) . $
  The factor $\( 1 - p \)^(- 1)$ in (6.5) is uniformly bounded on $\[ p_c \/ 2 \, p_c \)$. Also $a_3 gt.eq 1$, directly from the nonnegative kernel sum and $T \( o \, o \) = 1$. Thus $b = sqrt(a_3) gt.eq 1$ is locally absolutely continuous and satisfies
  #[#set math.equation(numbering: n => "(6.7)")
   $ b' lt.eq C L^(1 - alpha) b + C L^(1 \/ 4 + epsilon.alt_1 \/ 2 - alpha) m_p^(3 \/ 2) quad upright("almost everywhere") . $ <eq:s26>]
  We make the exponent choices explicit. Given $eta > 0$, choose $0 < zeta < min \( 1 \, eta \)$, and then choose $1 \/ 2 - alpha > 0$, $epsilon.alt_1 > 0$, and $eta' > 0$ sufficiently small that $1 \/ 2 + epsilon.alt_1 - 2 alpha < 0$ and
  $ A_(*) & = \( 2 - zeta \) \( 1 - alpha \) < 1 \,\
B_(*) & = \( 2 - zeta \) \( 1 \/ 4 + epsilon.alt_1 \/ 2 - alpha \) + 3 / 2 \( 1 + eta' \) < 1 + eta \/ 2 . $
  These choices are possible by continuity: at the limiting values $alpha = 1 \/ 2$, $epsilon.alt_1 = eta' = 0$, the two expressions are $1 - zeta \/ 2$ and $1 + zeta \/ 4$, respectively. Put $delta = p_c - p$ and $L = delta^(- \( 2 - zeta \)) gt.eq 1$. The susceptibility bound (5.10) implies $m_p lt.eq chi_max \( p \) lt.eq C delta^(- 1 - eta')$, so (6.7) becomes
  $ b' \( p \) lt.eq C delta^(- A_(*)) b \( p \) + C delta^(- B_(*)) . $
  Since $A_(*) < 1$, the integral of the first coefficient from $p_c \/ 2$ to $p_c$ is finite. Multiplication by its integrating factor therefore gives
  $ b \( p \) lt.eq C (b \( p_c \/ 2 \) + integral_(p_c \/ 2)^p \( p_c - r \)^(- B_(*)) thin d r) lt.eq C_eta delta^(- eta \/ 2) . $
  For the last inequality one may bound the integrand by a constant times $\( p_c - r \)^(- 1 - eta \/ 2)$, using $B_(*) < 1 + eta \/ 2$. Squaring proves (6.4). ◻
]

== 7 Deformation by pivotal corridors <def:section>

We now introduce a deformation of connection probabilities. It penalizes a connection whenever that connection must traverse an isolated open corridor. The penalty is calibrated by a random-walk weight. Consequently its effect on the operator norm is small, whereas its effect on the susceptibility can be estimated from the two ends of the corridor.

Throughout this section fix

$ p_c \/ 2 lt.eq p < p_c \, #h(2em) q = 1 - p \, #h(2em) k in bb(N) \, quad k gt.eq 3 . $

Only the deformation parameter $t gt.eq 0$ varies. Write

$ T_0 = T_p \, #h(2em) m_0 = lr(bar.v.double T_0 bar.v.double) \, #h(2em) chi_0 = chi \( p \) \, #h(2em) chi_0^(+) = max_x bb(E)_p \| C_x \| \, #h(2em) c_sigma = \( min_i sigma_i \)^(- 1) . $

The walk kernel $P$, its norm $rho < 1$, and the type weights $sigma_i$ are as in Lemma 5, Lemma 7. All constants in this section depend only on the graph, unless otherwise indicated. In particular, their values are uniform in the displayed range of $p$.

#prodef([Definition 3.])[
  (Templates and weighted connections).  A raw path is a $k$-step path $w = \( w_0 \, dots.h \, w_k \)$ of $P$, including possible holding steps. Its base, endpoint, and probability are
  $ u = w_0 \, #h(2em) v = w_k \, #h(2em) mu_u \( w \) = product_(i = 0)^(k - 1) P \( w_i \, w_(i + 1) \) . $
  Chronological loop erasure, with holding steps removed, gives a simple path $gamma_w$ from $u$ to $v$; write $ell_w$ for its length and $I_w$ for its internal vertices. Retain $w$ as a #emph[template] precisely when $ell_w gt.eq 3$. The #emph[blockers] of a template $w$ are all edges incident to $I_w$ that are not edges of $gamma_w$; write $b_w$ for their number. Give this template the weight
  $ c \( w \) = mu_u \( w \) p^(- ell_w) q^(- b_w) . $
  Different raw paths remain different templates even if they have the same loop erasure.
  For an induced domain $D$, a template is eligible if $gamma_w subset D$. Its raw path need not lie in $D$. Its weight is always the full-graph weight $c \( w \)$ just defined. A blocker absent from the induced graph on $D$ counts as closed.
  If $x \, y in D$ are connected, let $N_(x y)^D$ be the sum of $c \( w \)$ over eligible templates for which every edge of $gamma_w$ is open and pivotal for $x arrow.l.r y$ in $D$, and every blocker is closed or absent. Here an open edge is pivotal when closing it destroys this connection. Set $N_(x y)^D = 0$ on disconnection, and define
  $ W_t^D \( x \, y \) & = upright(bold(1))_({ x arrow.l.r y upright(" in ") D }) e^(- t N_(x y)^D) \,\
X_t^D \( x \) & = sum_(y in D) W_t^D \( x \, y \) \, #h(2em) s_t^D \( x \) = bb(E)_p X_t^D \( x \) . $
  Connections and potentials with a terminal outside $D$ are zero. For $x in D$, $W_t^D \( x \, x \) = 1$. In the full graph put
  $ T_t \( x \, y \) = bb(E)_p W_t^V \( x \, y \) \, #h(2em) chi_t = \[ s_t^V \( o \) \] \, #h(2em) m_t = lr(bar.v.double T_t bar.v.double) . $
] <def:templates>

The fixed weights and the convention for absent blockers will allow us to compare different domains without changing the deformation.

#thm([Lemma 24.])[
  (Basic bounds and monotonicity).  #emph[There is a fixed $C > 0$ such that, with $c_k = e^(C k)$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ sum_(w : thin e in E \( gamma_w \)) c \( w \) lt.eq c_k \/ k quad upright("for every edge ") e . $ <def:edge-weight>]

 On a connection in a finite cluster, $N_(x y)^D lt.eq c_k \| C_x^D \|$. For fixed $t$, $W_t^D \( x \, y \)$ is increasing under edge openings and under domain enlargement, using restriction of the same configuration. The kernel $T_t$ is invariant, symmetric, and entrywise between zero and $T_0$, and 
#[#set math.equation(numbering: n => "(7.2)")
 $ m_t lt.eq sup_x s_t^V \( x \) lt.eq c_sigma chi_t . $ <def:row-norm>]

 The functions $T_t \( x \, y \)$ and $s_t^D \( x \)$ are continuously differentiable for $t gt.eq 0$, with a right derivative at zero, by differentiating $W_t^D \( x \, y \)$ to $- N_(x y)^D W_t^D \( x \, y \)$ under expectation and summation.]
] <def:basic>

#proof[
  Since $ell_w lt.eq k$ and $b_w lt.eq d k$, there is a fixed $B gt.eq 1$ with $p^(- ell_w) q^(- b_w) lt.eq B^k$. For a specified edge $e$, symmetry and stochasticity of $P$ show that the total probability, summed over all bases, of traversing $e$ at a specified step is $1 \/ d$. A union bound over the $k$ steps therefore gives
  $ sum_(w : thin e in E \( gamma_w \)) c \( w \) lt.eq B^k sum_u sum_(w : thin w upright(" traverses ") e) mu_u \( w \) lt.eq B^k k \/ d . $
  Increasing $C$ proves (7.1) for every $k gt.eq 3$. Every counted template has all its path edges on every simple open $x$–$y$ path. Charge it to an edge of one such path, which has fewer than $\| C_x^D \|$ edges, to obtain the asserted bound on $N_(x y)^D$.
  To prove monotonicity, consider a pair already connected before an edge opening or a domain enlargement. Every edge of a template counted afterward belongs to every old simple connection. Its retained path was therefore already eligible, open, and pivotal. Each blocker closed or absent afterward was closed or absent before. Thus every template counted afterward was counted before, with exactly the same weight. Its total penalty cannot increase. A pair previously disconnected has weight zero, so monotonicity holds for all pairs.
  Symmetry in the terminals follows directly from the pivotal condition; it does not require any reversal property of loop erasure. Invariance and entrywise domination are immediate, and the row and column sum bound for operator norms gives (7.2). Finally,
  $ sum_y N_(x y)^D W_t^D \( x \, y \) lt.eq c_k \| C_x^D \|^2 . $
  The right side has finite expectation by (2.1) and subcritical susceptibility finiteness. Dominated convergence proves the differentiation and continuity assertions. These arguments apply to infinite domains: their clusters are almost surely finite, and the preceding bound is uniform under finite exhaustion. In fact, once an exhaustion of $D$ contains the entire cluster $C_x^D$, all weighted connections inside it agree with their limiting values: boundary blockers are closed both before and after their other endpoints enter the domain. ◻
]

#thm([Lemma 25.])[
  (Corridor calibration).  #emph[For a template $w$, let $Q_w$ be the full-graph event that the edges of $gamma_w$ are open and all its blockers are closed. Put $D_w = V \\ I_w$. Then $Q_w$ is independent of the percolation in $D_w$, and 
#[#set math.equation(numbering: n => "(7.3)")
 $ c \( w \) bb(P)_p \( Q_w \) = mu_u \( w \) . $ <def:calibration-identity>]

 On $Q_w$, the template is counted for $x arrow.l.r y$ if and only if one of the following two exterior events occurs: 
$ & x in C_u^(D_w) \, quad y in C_v^(D_w) \, quad C_u^(D_w) eq.not C_v^(D_w) \,\
 & x in C_v^(D_w) \, quad y in C_u^(D_w) \, quad C_u^(D_w) eq.not C_v^(D_w) . $

 In particular, neither terminal belongs to $I_w$.]
] <def:calibration>

#proof[
  All bits specified by $Q_w$ are incident to $I_w$, and there are exactly $ell_w$ specified open edges and $b_w$ specified closed edges. This proves independence and (7.3). On $Q_w$ each internal vertex has exactly the two corridor edges open. The resulting geometry is shown in 3. A simple connection using every corridor edge must traverse the whole corridor consecutively, with both terminals outside its interior. If the two exterior endpoint clusters coincide, there is an exterior bypass, so the corridor edges cannot all be pivotal. If the exterior clusters are distinct, the corridor is their only open link, so all of its edges are pivotal for every terminal pair in either displayed orientation. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1.9, -0.95), (0.3, 0.95), fill: rgb("#f2f2ff"), stroke: none, radius: 12pt)
  rect((-1.9, -0.95), (0.3, 0.95), stroke: (paint: rgb("#00004c"), thickness: 0.4pt, miter-limit: 10), radius: 12pt)
  rect((7.7, -0.95), (9.9, 0.95), fill: rgb("#f2f2ff"), stroke: none, radius: 12pt)
  rect((7.7, -0.95), (9.9, 0.95), stroke: (paint: rgb("#00004c"), thickness: 0.4pt, miter-limit: 10), radius: 12pt)
  content((-1, 0.55), [#text(size: 9pt)[$C_u^(D_w)$]])
  content((8.9, 0.55), [#text(size: 9pt)[$C_v^(D_w)$]])
  circle((-1.35, -0.35), radius: 0.0898, fill: black, stroke: none)
  content((-1.35, -0.3853), [$x$], anchor: "north")
  circle((0, 0), radius: 0.0898, fill: black, stroke: none)
  content((0, 0.03528), [$u$], anchor: "south")
  circle((8, 0), radius: 0.0898, fill: black, stroke: none)
  content((8, 0.03528), [$v$], anchor: "south")
  circle((9.2, -0.35), radius: 0.0898, fill: black, stroke: none)
  content((9.2, -0.3853), [$y$], anchor: "north")
  line((-1.35, -0.35), (-0.8, -0.12), (0, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((8, 0), (8.6, -0.12), (9.2, -0.35), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((1.6, 0), radius: 0.0898, fill: black, stroke: none)
  line((1.6, 0), (1.85, 0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.6, 0), (1.35, -0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.655, 0.37), (1.795, 0.29), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  line((1.405, -0.29), (1.545, -0.37), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  circle((3.2, 0), radius: 0.0898, fill: black, stroke: none)
  line((3.2, 0), (3.45, 0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.2, 0), (2.95, -0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.255, 0.37), (3.395, 0.29), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  line((3.005, -0.29), (3.145, -0.37), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  circle((4.8, 0), radius: 0.0898, fill: black, stroke: none)
  line((4.8, 0), (5.05, 0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((4.8, 0), (4.55, -0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((4.855, 0.37), (4.995, 0.29), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  line((4.605, -0.29), (4.745, -0.37), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  circle((6.4, 0), radius: 0.0898, fill: black, stroke: none)
  line((6.4, 0), (6.65, 0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((6.4, 0), (6.15, -0.7), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((6.455, 0.37), (6.595, 0.29), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  line((6.205, -0.29), (6.345, -0.37), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (8, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((1.3, 1.1), (6.7, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4, 1.276), [#text(size: 9pt)[interior $I_w$]], anchor: "south", padding: 0.1176cm)
  content((4, -1.5), [#box(width: 10.74cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[The corridor edges are open; all other edges incident to $I_w$ are closed.]]])])
})],
  caption: [Figure 3: A forced corridor and its two exterior legs. On the event that the entire corridor is pivotal for $x arrow.l.r y$, its endpoints belong to distinct clusters in $D_w = V \\ I_w$. The event $Q_w$ fixes only bits incident to $I_w$ and is independent of the exterior percolation. Dashed stubs represent closed blocker edges; they are schematic. ],
) <fig:corridor>

#thm([Proposition 7.])[
  (Small change of operator norm).  #emph[For every $t gt.eq 0$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ 0 lt.eq T_0 - T_t lt.eq 2 t thin T_0 P^k T_0 quad upright("entrywise") \, #h(2em) m_t gt.eq m_0 - 2 t rho^k m_0^2 . $ <eq:s27>]

]
] <def:norm>

#proof[
  Expand $- partial_t T_t \( x \, y \)$ as a nonnegative sum over templates and discard the factor $e^(- t N_(x y)^V) lt.eq 1$. By 25, the term for $w$ is at most
  $ mu_u \( w \) #scale(x: 120%, y: 120%)[\(] T_0 \( x \, u \) T_0 \( v \, y \) + T_0 \( x \, v \) T_0 \( u \, y \) #scale(x: 120%, y: 120%)[\)] . $
  Indeed the two exterior connections in each orientation belong to distinct clusters, so BK bounds their joint probability by the product of the corresponding full-graph connection probabilities. Add the discarded raw paths to this upper bound and sum over bases and endpoints. Each orientation gives $T_0 P^k T_0$, since $P^k$ is symmetric. Integration from zero to $t$ proves the entrywise assertion. Domination by a nonnegative kernel gives
  $ lr(bar.v.double T_0 - T_t bar.v.double) lt.eq 2 t lr(bar.v.double T_0 P^k T_0 bar.v.double) lt.eq 2 t rho^k m_0^2 . $
  The triangle inequality proves the norm assertion. In particular, no positive-semidefiniteness assertion for $T_t$ is used. ◻
]

The norm estimate is one half of the comparison. We now state the corresponding lower bound on the rate at which the averaged row sum decreases. Let $bb(E)_(upright("path"))$ denote averaging over the type-weighted root $u = o$ and a length-$k$ $P$-path from $u$. Denote its endpoint by $v$, whether or not the path is retained as a template, and put $a_3 = "tr" \( T_0^3 \)$.

#thm([Proposition 8.])[
  (Decrease of the averaged susceptibility).  #emph[For all $t gt.eq 0$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ - chi'_t gt.eq e^(- t c_k) (bb(E)_(upright("path")) [upright(bold(1))_({ ell_w gt.eq 3 }) s_t^(D_w) \( u \) s_t^(D_w) \( v \)] - C' \( chi_0^(+) \)^2 rho^k a_3) \, $ <eq:s31>]

 where $C' > 0$ depends only on $G$. The product term is defined to be zero for discarded raw paths.]
] <def:decrease>

The product measures the weighted connection mass available at the two exterior endpoints. We will prove this bound by estimating the loss under deletion, separating the two exterior clusters, and comparing their penalties with that of the full connection. To make the product dominate the error, we still need paths on which both endpoint potentials remain large. Constructing such paths is the task of the next section.

#thm([Lemma 26.])[
  (Deletion estimate).  #emph[For $A subset D$, let $"Nb" \[ A \]$ denote $A$ together with all its neighbors in the full graph. For every vertex $v$, 
#[#set math.equation(numbering: n => "(7.6)")
 $ s_t^(D \\ A) \( v \) gt.eq s_t^D \( v \) - chi_0^(+) sum_(z in "Nb" \[ A \]) T_0 \( v \, z \) . $ <eq:s28>]

]
] <def:deletion>

#proof[
  We first compare weighted connections in a fixed configuration. Suppose $W_t^D \( v \, y \) > W_t^(D \\ A) \( v \, y \)$. There was an old connection. If deletion destroys it, an old simple $v$–$y$ path visits $A$; this includes the case of a deleted terminal. Otherwise some positive-weight template is newly counted after deletion. Its retained path already lay in $D$ and was open there. The raw path and its weight have not changed, so there are only two possible reasons it was not counted before.
  First, a path edge may previously have been nonpivotal. An old simple connection avoiding that edge must visit $A$, since otherwise the edge would remain nonpivotal after deletion. Second, a blocker may previously have been open. Since it is now absent, it joins an internal retained-path vertex $z in.not A$ to a vertex of $A$. Every surviving simple connection uses the new template path and therefore visits this $z in "Nb" \[ A \]$. This second case includes a removed pendant branch: its attachment vertex, rather than the removed vertex, lies on the connection.
  The entire positive loss, which is at most one, is thus bounded by the indicator that some old simple $v$–$y$ path visits $"Nb" \[ A \]$. Splitting such a path at a visited vertex $z$ gives edge-disjoint connection witnesses from $v$ to $z$ and from $z$ to $y$. A union bound and BK yield
  $ bb(E)_p #scale(x: 120%, y: 120%)[\(] W_t^D \( v \, y \) - W_t^(D \\ A) \( v \, y \) #scale(x: 120%, y: 120%)[\)] lt.eq sum_(z in "Nb" \[ A \]) T_0 \( v \, z \) T_0 \( z \, y \) . $
  There is no sum over penalty weights in this estimate: a single visiting event bounds the whole loss. Summing over $y$ proves (7.6). For infinite $A$ all sums are interpreted monotonically, with an infinite right-hand error giving a trivial bound. ◻
]

#thm([Lemma 27.])[
  (Two distinct exterior clusters).  #emph[There is a constant $C' > 0$ such that, for every induced domain $D$ and $u \, v in D$, 
#[#set math.equation(numbering: n => "(7.7)")
 $ bb(E)_p #scale(x: 120%, y: 120%)[\(] X_t^D \( u \) X_t^D \( v \) \; med C_u^D eq.not C_v^D #scale(x: 120%, y: 120%)[\)] gt.eq s_t^D \( u \) s_t^D \( v \) - C' \( chi_0^(+) \)^2 T_0^3 \( u \, v \) . $ <eq:s29>]

 The constant is independent of $D \, p \, k \, t$.]
] <def:correlation>

#proof[
  Expose the exact finite cluster $A = C_u^D$, including every internal edge bit and its closed boundary. This determines $X_t^D \( u \)$: every counted template has retained path in $A$, its weight is deterministic, and its blockers leaving $A$ are closed or absent. The edges with both endpoints in $D \\ A$ remain independent Bernoulli variables of parameter $p$.
  For terminals in a cluster outside $A$, weighted connections before and after deleting $A$ agree exactly. All open paths stay in that exterior cluster; every eligible counted retained path stays there too; the only blockers removed were closed contacts with $A$. Raw excursions into $A$ affect neither eligibility nor weight. Consequently, including $v in A$ by the zero convention,
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(E)_p #scale(x: 120%, y: 120%)[\(] X_t^D \( u \) X_t^D \( v \) \; med C_u^D eq.not C_v^D #scale(x: 120%, y: 120%)[\)] = bb(E)_p #scale(x: 120%, y: 120%)[\[] X_t^D \( u \) s_t^(D \\ A) \( v \) #scale(x: 120%, y: 120%)[\]] . $ <def:cluster-exposure>]
  Apply 26 inside this expectation and use $X_t^D \( u \) lt.eq \| A \|$. For adjacent $a \, z$, positive association with the event that their edge is open gives $p T_0 \( v \, z \) lt.eq T_0 \( v \, a \)$. Hence
  $ sum_(z in "Nb" \[ A \]) T_0 \( v \, z \) lt.eq \( 1 + d \/ p \) sum_(a in A) T_0 \( v \, a \) . $
  The three-arm estimate (2.1), summed over a third terminal, gives
  $ bb(E)_p #scale(x: 120%, y: 120%)[\(] \| A \| upright(bold(1))_({ a in A }) #scale(x: 120%, y: 120%)[\)] & = sum_y bb(P)_p \( u arrow.l.r a \, med u arrow.l.r y upright(" in ") D \)\
 & lt.eq sum_b T_0 \( u \, b \) T_0 \( b \, a \) sum_y T_0 \( b \, y \) lt.eq chi_0^(+) T_0^2 \( u \, a \) . $
  The error in (7.8) is therefore at most
  $ \( 1 + d \/ p \) \( chi_0^(+) \)^2 sum_a T_0^2 \( u \, a \) T_0 \( a \, v \) \, $
  which proves (7.7) with $C' = 1 + 2 d \/ p_c$. ◻
]

#thm([Lemma 28.])[
  (Decomposition into two legs).  #emph[On $Q_w$, suppose $x in C_u^(D_w)$, $y in C_v^(D_w)$, and $C_u^(D_w) eq.not C_v^(D_w)$. Then 
#[#set math.equation(numbering: n => "(7.9)")
 $ N_(x y)^V lt.eq c_k + N_(x u)^(D_w) + N_(v y)^(D_w) . $ <eq:s30>]

]
] <def:legs>

#proof[
  The total weight of all templates whose retained paths use any edge of $gamma_w$ is at most $ell_w c_k \/ k lt.eq c_k$, by (7.1). Consider any remaining template counted for $x arrow.l.r y$. Its retained path cannot meet $I_w$: every open edge incident to $I_w$ is an edge of $gamma_w$. Its connected retained path thus lies in one of the two distinct exterior endpoint clusters.
  If it lies in the $u$ cluster, every one of its edges is pivotal for the exterior connection $x arrow.l.r u$. Otherwise an exterior $x$–$u$ path avoiding that edge, followed by the corridor and an exterior $v$–$y$ path, would give a global $x$–$y$ connection avoiding it. Its blockers remain closed or absent on restriction to $D_w$. Thus it is counted, with the same weight, in $N_(x u)^(D_w)$. The $v$ cluster gives $N_(v y)^(D_w)$ in the same way. This proves the bound. ◻
]

#proof[
  Expand the negative derivative of $chi_t$ as the sum over the starting terminal, the other terminal, and all counted templates. Use the mass-transport identity (2.2) to move the root from the starting terminal to the template base. All terms are nonnegative, so this rearrangement is justified by Tonelli’s theorem. For each template retain only the orientation $x in C_u^(D_w)$, $y in C_v^(D_w)$. On $Q_w$ and this exterior event, 28 implies
  $ W_t^V \( x \, y \) gt.eq e^(- t c_k) W_t^(D_w) \( x \, u \) W_t^(D_w) \( v \, y \) . $
  Independence of $Q_w$ from the exterior and (7.3) replace its factor $c \( w \)$ by $mu_u \( w \)$. After summing over $x \, y$, we obtain
  $ - chi'_t gt.eq e^(- t c_k) bb(E)_(upright("path")) [upright(bold(1))_({ ell_w gt.eq 3 }) bb(E)_p #scale(x: 120%, y: 120%)[\(] X_t^(D_w) \( u \) X_t^(D_w) \( v \) \; C_u^(D_w) eq.not C_v^(D_w) #scale(x: 120%, y: 120%)[\)]] . $
  Apply 27. For its nonnegative error kernel, adding discarded paths only increases the average, and
  $ bb(E)_(upright("path")) T_0^3 \( u \, v \) = \[ sum_v P^k \( o \, v \) T_0^3 \( v \, o \) \] = "tr" \( P^k T_0^3 \) lt.eq rho^k "tr" \( T_0^3 \) . $
  The last inequality uses the positive operator $T_0^3$ and the positive trace inequality of 6 for the self-adjoint operator $P^k$. It requires no commutation of $P$ with $T_0$. This proves (7.5). ◻
]

The deletion error can be smaller at a vertex near a corridor endpoint than at the endpoint itself. The following comparison transfers the potential from that vertex back along a fixed path.

#thm([Lemma 29.])[
  (Comparison along a path).  #emph[If a simple path in $D$ joins $b$ to $z$ and has length $l$, then 
#[#set math.equation(numbering: n => "(7.10)")
 $ s_t^D \( b \) gt.eq e^(- t l c_k) p^l s_t^D \( z \) . $ <eq:s32>]

]
] <def:endpoint>

#proof[
  Let $F$ be the event that this fixed path is open. On $F$ and on a connection from $z$ to $y$, there is also a connection from $b$ to $y$. Templates counted for the latter connection whose retained paths use an edge of the fixed path have total weight at most $l c_k$, by (7.1). For any other counted template, every retained edge is pivotal for $z arrow.l.r y$: a $z$–$y$ bypass, concatenated with the fixed $b$–$z$ path, would otherwise give a $b$–$y$ bypass. Its blocker condition is unchanged. Thus, on $F$,
  $ W_t^D \( b \, y \) gt.eq e^(- t l c_k) W_t^D \( z \, y \) . $
  Both $upright(bold(1))_F$ and $W_t^D \( z \, y \)$ are increasing functions of the percolation bits, by 24. Positive association and $bb(P)_p \( F \) = p^l$ give
  $ bb(E)_p W_t^D \( b \, y \) gt.eq e^(- t l c_k) bb(E)_p \[ upright(bold(1))_F W_t^D \( z \, y \) \] gt.eq e^(- t l c_k) p^l bb(E)_p W_t^D \( z \, y \) . $
  Summation over $y$ proves (7.10). ◻
]

== 8 Paths with an escape at each endpoint <path:section>

We retain the notation of the corridor deformation. In particular, $p_c \/ 2 lt.eq p < p_c$, $T_0 = T_p$, and $I_w$ is the interior of the chronological loop erasure of a raw $k$-step $P$-path $w$ from $u$ to $v$. The domain $D_w = V \\ I_w$ depends only on this path. The next lemma finds paths for which deleting $I_w$ leaves useful potentials accessible from both endpoints. All probabilities in the lemma concern auxiliary walks, independently of the percolation configuration.

Rooted reversibility and mass transport provide the general framework for the construction; see #cite(label("AldousLyons2007")) Theorem 4.1. The labeled, type-conditioned experiment below supplies the particular reversal and domination identities needed here. It makes no assertion that chronological loop erasure commutes with path reversal.

#thm([Lemma 30.])[
  (Two endpoint escapes).  #emph[For every $tau > 0$ there are constants $J in bb(N)$, $C_1 > 0$, $k_0 in bb(N)$, and $b_(*) > 0$, depending only on $G$ and $tau$, with the following property. For every $p_c \/ 2 lt.eq p < p_c$, every $k gt.eq k_0$, and every $R gt.eq 1$, a set of paths of $bb(E)_(upright("path"))$-probability at least $b_(*)$ has loop-erased length at least three and admits, from each of $u \, v$, a simple path in $D_w$ of length at most 
$ j = J + ⌈C_1 log \( \( k + 1 \) R \)⌉ $

 to a vertex $z$ satisfying 
#[#set math.equation(numbering: n => "(8.1)")
 $ sum_(b in "Nb" \[ I_w \]) T_0 \( z \, b \) lt.eq tau / R . $ <eq:s33>]

 The constants $J \, C_1 \, k_0 \, b_(*)$ are fixed before $p \, k \, R$ are chosen.]
] <path:selection>

We first record a smoothing bound which does not involve $lr(bar.v.double T_0 bar.v.double)$. It is a quasi-transitive, off-diagonal form of the random-walk averaging estimate known as Schramm’s lemma; see #cite(label("Kozma2011")) Section 1.1 and #cite(label("Hutchcroft2019")) Proposition 6.4. The finite trace gives a short proof adapted to our symmetric lazy walk.

#thm([Lemma 31.])[
  (Smoothing a connection kernel).  #emph[For all vertices $a \, b$ and integers $l gt.eq 0$, 
#[#set math.equation(numbering: n => "(8.2)")
 $ \( P^l T_0 \) \( a \, b \) lt.eq sqrt(c_sigma) thin rho^l . $ <eq:s34>]

]
] <path:smoothing>

#proof[
  Positive-semidefinite Cauchy–Schwarz for $T_0$ gives
  $ \| \( P^l T_0 \) \( a \, b \) \|^2 lt.eq \( P^l T_0 P^l \) \( a \, a \) T_0 \( b \, b \) . $
  Here $T_0 \( b \, b \) = 1$. The invariant positive operator $P^l T_0 P^l$ has every diagonal entry bounded by $c_sigma$ times its weighted trace. Consequently, trace cyclicity and the positive-trace bound give
  $ \( P^l T_0 P^l \) \( a \, a \) lt.eq c_sigma "tr" \( P^(2 l) T_0 \) lt.eq c_sigma lr(bar.v.double P^(2 l) bar.v.double) "tr" \( T_0 \) = c_sigma rho^(2 l) . $
  This argument uses no commutation between $P$ and $T_0$. ◻
]

#proof[
  Let $L_(upright("type"))$ and $c_(*) > 0$ be such that every transition probability of the finite type chain at every time $L gt.eq L_(upright("type"))$ is at least $c_(*)$. The same $c_(*)$ works for all types and will therefore remain fixed as $J$ varies.
  ===== 8.1 The labeled experiment. <the-labeled-experiment.>
  For an integer $J$ to be chosen, take a geodesic segment $gamma = \( gamma_(- J) \, dots.h \, gamma_J \)$. Such segments exist because an infinite connected locally finite graph has infinite diameter. Write $cal(S) = Gamma gamma$ for its orbit as an ordered full segment, $O_i = Gamma gamma_i$, and $theta.alt_i$ for the root weight of $O_i$. Different indices may describe the same vertex orbit. For $x in O_i$, let
  $ N_i = \# { g in cal(S) : g_i = x } . $
  This is a positive finite number independent of the choice of $x$ in $O_i$. Indeed an anchored segment is contained in the finite ball $B \( x \, 2 J \)$, and automorphisms give bijections between anchor sets. The full orbit $cal(S)$ itself need not be finite.
  Fix $u in O_0$ and put $L = k - 2 J gt.eq L_(upright("type"))$. Sample $g$ uniformly among segments with $g_0 = u$. Follow its positive half from $u$ to $g_J$, then run a middle $P$-walk $eta$ of length $L$ conditioned to end in $O_J$. Its conditioning probability
  $ q_L = P^L \( a \, O_J \) \, #h(2em) a in O_J \, $
  is constant on $O_J$ and is at least $c_(*)$. Given $eta$, sample $h$ uniformly among segments with $h_J = eta_L$, and follow $\( h_J \, h_(J - 1) \, dots.h \, h_0 \)$ to $v = h_0$. The resulting raw path $w$ has length $k$.
  Independently, after these choices, take ordinary $P$-walks $alpha$ and $beta$ of a common length $m$ from $g_(- J)$ and $h_(- J)$. Prepend the corresponding negative segment to each walk. These are the two candidate escapes, of length $J + m$; see 4.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.07982, fill: black, stroke: none)
  content((-0.02495, 0.02495), [$u=g_0$], anchor: "south-east")
  circle((1.5, 1.35), radius: 0.07982, fill: black, stroke: none)
  content((1.5, 1.385), [$g_J$], anchor: "south")
  circle((6.5, 1.35), radius: 0.07982, fill: black, stroke: none)
  content((6.5, 1.385), [$h_J$], anchor: "south")
  circle((8, 0), radius: 0.07982, fill: black, stroke: none)
  content((8.025, 0.02495), [$v=h_0$], anchor: "south-west")
  circle((-1.1, -1.1), radius: 0.07982, fill: black, stroke: none)
  content((-1.135, -1.1), [$g_(-J)$], anchor: "east")
  circle((9.1, -1.1), radius: 0.07982, fill: black, stroke: none)
  content((9.135, -1.1), [$h_(-J)$], anchor: "west")
  circle((0, -2.65), radius: 0.07982, fill: black, stroke: none)
  content((0, -2.685), [$z$], anchor: "north")
  circle((8, -2.65), radius: 0.07982, fill: black, stroke: none)
  content((8, -2.685), [$z'$], anchor: "north")
  line((0, 0), (1.5, 1.35), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#0000a6"))))
  content((0.75, 0.675), [#text(size: 9pt)[$J$]], anchor: "south-east", padding: 0.1176cm)
  bezier((1.5, 1.35), (2.6, 1.1), (1.933, 1.274), (2.167, 1.176), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#0000a6"))))
  bezier((2.6, 1.1), (4, 1.3), (3.143, 1.004), (3.448, 1.3), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#0000a6"))))
  bezier((4, 1.3), (6.5, 1.35), (4.975, 1.3), (5.54, 1.181), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#0000a6"))))
  content((4, 2.65), [#text(size: 9pt)[middle walk of length $L$#linebreak()conditioned to end in the type of $g_J$]])
  line((6.5, 1.35), (8, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#0000a6"))))
  content((7.25, 0.675), [#text(size: 9pt)[$J$]], anchor: "south-west", padding: 0.1176cm)
  line((0, 0), (-1.1, -1.1), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  content((-0.55, -0.55), [#text(size: 9pt)[$J$]], anchor: "east", padding: 0.1176cm)
  line((8, 0), (9.1, -1.1), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  content((8.55, -0.55), [#text(size: 9pt)[$J$]], anchor: "west", padding: 0.1176cm)
  bezier((-1.1, -1.1), (-0.3, -1.9), (-1.023, -1.535), (-0.7412, -1.9), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  bezier((-0.3, -1.9), (0.5, -2.1), (0.0216, -1.9), (0.1784, -2.1), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  bezier((0.5, -2.1), (0, -2.65), (0.7899, -2.1), (0.2899, -2.65), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  bezier((9.1, -1.1), (8.3, -1.9), (9.023, -1.535), (8.741, -1.9), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  bezier((8.3, -1.9), (7.5, -2.1), (7.978, -1.9), (7.822, -2.1), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  bezier((7.5, -2.1), (8, -2.65), (7.21, -2.1), (7.71, -2.65), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#b25a00"))))
  content((4, -1.2), [#box(width: 5.235cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Walk tails#linebreak()of length $m=j-J$]]])])
})],
    caption: [Figure 4: The anchored path experiment. The blue raw path has a prescribed prefix, a reversible middle walk, and a prescribed suffix. The two orange escapes use the opposite halves of the same geodesic segments and walk tails that, conditional on $g \, eta \, h$, are independent ordinary $P$-walks before avoidance is imposed. Reversing the middle walk and exchanging the two segments and escape tails gives the reversed raw-path law after transport on the center orbit. Avoidance is tested against the raw path; the escapes may intersect each other. Loop-erasing either escape keeps it outside the corridor interior. ],
  ) <fig:escape-templates>
  Write $Q_u$ for the law of the full labeled object $xi = \( g \, eta \, h \, alpha \, beta \)$, and $mu \( zeta \)$ for the product of the transition probabilities along any walk $zeta$. Its exact probability is
  #[#set math.equation(numbering: n => "(8.3)")
   $ Q_u \( xi \) = frac(mu \( eta \) mu \( alpha \) mu \( beta \), N_0 N_J q_L) . $ <path:labeled-weight>]
  ===== 8.2 Reversal and comparison with the ordinary walk. <reversal-and-comparison-with-the-ordinary-walk.>
  The labeled law serves two purposes. Reversal lets us estimate avoidance at one endpoint and transfer the estimate to the other. Domination by the ordinary walk law then converts successful labeled experiments into a positive mass of the raw paths used in the deformation.
  There is a rooted reversal of this experiment:
  $ xi^dagger = \( h \, arrow.l(eta) \, g \, beta \, alpha \) \, $
  rooted at $v$. Symmetry of $P$ shows that $Q_u \( xi \) = Q_v \( xi^dagger \)$ by (8.3); neither $N_0 = N_J$ nor equality of the center and endpoint type weights is needed. The escape tails are swapped, rather than reversed. For an invariant nonnegative function $F$ of the labeled object, apply (2.2) to
  $ M_F \( x \, y \) = sum_(xi : x arrow.r y) Q_x \( xi \) F \( xi \) \, #h(2em) x \, y in O_0 \, $
  and set this transport to zero off $O_0 times O_0$. Invariance makes the outgoing sum constant on $O_0$, and the common root weight $theta.alt_0$ cancels. The reversal bijection identifies the incoming sum with the outgoing sum for $F compose dagger$. Thus
  #[#set math.equation(numbering: n => "(8.4)")
   $ bb(E)_(Q_u) F = bb(E)_(Q_u) \( F compose dagger \) . $ <path:rooted-reversal>]
  We also need domination after forgetting all labels. For a fixed raw path $w$, let $n_g$ and $n_h$ count the full segments compatible with its visible first and last blocks, respectively. Its middle is fixed, and summing all compatible full segments and all escape tails gives
  $ Q_u \( w \) = frac(mu \( eta \), q_L) n_g / N_0 n_h / N_J lt.eq frac(mu \( eta \), c_(*)) . $
  The two fractions are at most one. In particular, different negative halves which project to the same visible half cause no additional multiplicity. The ordinary walk probability is $mu_u \( w \) = \( 2 d \)^(- 2 J) mu \( eta \)$, so
  #[#set math.equation(numbering: n => "(8.5)")
   $ Q_u \( w \) lt.eq D_J mu_u \( w \) \, #h(2em) D_J = frac(\( 2 d \)^(2 J), c_(*)) . $ <path:domination>]
  ===== 8.3 Avoiding the raw path. <avoiding-the-raw-path.>
  We bound all collisions uniformly in the escape-tail length $m$. First consider the escape from $u$, conditional on $g$. Its deterministic negative half and the positive half of $g$ meet only at $u$, which is allowed. Before conditioning the middle endpoint type, the probability that middle time $r$ visits any one of the $J + 1$ negative-segment vertices is at most $rho^r$, and is zero for $r < J$. Similarly, at escape-tail time $l$ the probability of visiting any one of the $J + 1$ positive-segment vertices is at most $rho^l$, and is zero for $l < J$. For a collision of the random escape tail and the middle at times $l \, r$, their independence and symmetry of $P$ give
  $ sum_x P^l \( g_(- J) \, x \) P^r \( g_J \, x \) = P^(l + r) \( g_(- J) \, g_J \) lt.eq rho^(l + r) . $
  This probability is zero when $l + r < 2 J$. Conditioning the middle endpoint costs at most $c_(*)^(- 1)$ in these estimates. Hence all these collisions have total probability at most
  #[#set math.equation(numbering: n => "(8.6)")
   $ E_J = 1 / c_(*) (2 \( J + 1 \) sum_(r gt.eq J) rho^r + sum_(n gt.eq 2 J) \( n + 1 \) rho^n) \, #h(2em) E_J arrow.r 0 . $ <path:early-collisions>]
  Extending the time sums to infinity is what makes this bound uniform in $L$ and $m$.
  For collisions with the last block, define the anchored-position kernel
  $ H_(a \, b) \( x \, y \) = upright(bold(1))_({ x in O_a }) frac(\# { g in cal(S) : g_a = x \, med g_b = y }, N_a) . $
  Its row sums are one on $O_a$ and zero elsewhere. Its column sum is constant on $O_b$, is zero elsewhere, and, by (2.2), is exactly
  #[#set math.equation(numbering: n => "(8.7)")
   $ sum_x H_(a \, b) \( x \, y \) = theta.alt_a / theta.alt_b quad \( y in O_b \) \, #h(2em) lr(bar.v.double H_(a \, b) bar.v.double) lt.eq sqrt(theta.alt_a / theta.alt_b) lt.eq sqrt(c_sigma) . $ <path:position-kernel>]
  Thus the operator bound is independent of $J$ and of all anchor counts. Conditional on $g$, the middle endpoint distribution $nu$ satisfies $lr(bar.v.double nu bar.v.double)_2 lt.eq c_(*)^(- 1) rho^L$. Each suffix-position distribution $nu H_(J \, i)$, $0 lt.eq i lt.eq J$, therefore has norm at most $sqrt(c_sigma) thin c_(*)^(- 1) rho^L$.
  Conditional on $g$, the first escape is independent of the middle and $h$. Its deterministic positions are point masses, and the distribution at tail time $l$ has norm at most $rho^l$. Cauchy–Schwarz and a union bound now show that its collisions with the suffix have probability at most
  #[#set math.equation(numbering: n => "(8.8)")
   $ F_J rho^L \, #h(2em) F_J = C (\( J + 1 \)^2 + frac(J + 1, 1 - rho)) \, $ <path:suffix-collisions>]
  where $C$ depends only on $G$. The estimate includes all tail times because $sum_(l gt.eq 0) rho^l = \( 1 - rho \)^(- 1)$. The same suffix-position bound at $i = 0$ gives
  $ Q_u \( "dist" \( u \, v \) < 3 \) lt.eq \| B \( u \, 2 \) \|^(1 \/ 2) sqrt(c_sigma) thin c_(*)^(- 1) rho^L lt.eq C_0 rho^L \, $
  with $C_0$ independent of $J$. By (8.4), the second escape has exactly the same avoidance-failure bound as the first: the relevant event refers only to the raw path and its reversed raw path.
  Choose $J$ so large that $2 E_J lt.eq 1 \/ 8$, and then choose $L_0 gt.eq L_(upright("type"))$ so large that $\( 2 F_J + C_0 \) rho^(L_0) lt.eq 1 \/ 8$. For every $L gt.eq L_0$ and every $m$, with probability at least $3 \/ 4$ both candidate escapes avoid every raw path vertex other than their respective starting vertices, and $"dist" \( u \, v \) gt.eq 3$. The escapes need not avoid each other. This choice order is valid because no anchor-count factor occurs in (8.6).
  Avoidance will keep the escape paths inside $D_w$. It remains to choose their endpoints so that the deletion error in 26 is small. For this we use the smoothing bound before imposing avoidance.
  ===== 8.4 Testing the potentials. <testing-the-potentials.>
  Set $lambda = - log rho > 0$, choose $C_1$ with $lambda C_1 > 1$, and put $m = ceil.l C_1 log \( \( k + 1 \) R \) ceil.r$. Conditional on $g \, eta \, h$, and #emph[before imposing any avoidance event], the two tails are independent ordinary $P$-walks. Their terminal vertices $Z_1 \, Z_2$ therefore satisfy, by 31 and $\| "Nb" \[ I_w \] \| lt.eq \( d + 1 \) \( k + 1 \)$,
  $ bb(E) [sum_(b in "Nb" \[ I_w \]) T_0 \( Z_i \, b \) thin mid(bar.v) thin g \, eta \, h] lt.eq C \( k + 1 \) rho^m \, #h(2em) i = 1 \, 2 . $
  Here the loop-erased interior is defined whether or not its length is at least three. Markov’s inequality bounds the sum of the two potential failure probabilities by
  #[#set math.equation(numbering: n => "(8.9)")
   $ 2 C tau^(- 1) R \( k + 1 \) rho^m lt.eq 2 C tau^(- 1) \( \( k + 1 \) R \)^(1 - lambda C_1) . $ <path:potential-failures>]
  Increase a fixed $k_0 gt.eq 2 J + L_0$ until the right-hand side is at most $1 \/ 4$ for all $k gt.eq k_0$ and $R gt.eq 1$. All constants remain independent of $p$ and $R$.
  Subtracting the failure probability in (8.9) from the preceding $3 \/ 4$ success bound leaves probability at least $1 \/ 2$ for both avoidance and both potential tests simultaneously. Since $"dist" \( u \, v \) gt.eq 3$, the retained corridor has length at least three. Its interior is contained in the raw path and excludes $u \, v$. Each escape therefore lies in $D_w$, and erasing its loops gives a simple path to the same terminal vertex of length at most $J + m$. No reversal property of chronological loop erasure is used.
  Project this successful event onto raw paths admitting these witnesses. By (8.5), ordinary walk law from a root in $O_0$ assigns these paths probability at least $1 \/ \( 2 D_J \)$. Averaging over root types proves the lemma with $b_(*) = theta.alt_0 \/ \( 2 D_J \) > 0$. ◻
]

== 9 Critical boundedness and the nonuniqueness interval <con:section>

We combine the preceding estimates to prove the critical operator bound. The argument fixes all path constants before choosing the subcritical parameter and the deformation time. We then transfer the bound to an interval above criticality and prove the simultaneous cluster assertion.

#proof[
  Suppose that the critical connection kernel $T_(p_c)$ is unbounded. Put $p_0 = p_c \/ 2$. For $p_0 lt.eq p < p_c$, use the corridor notation
  $ delta = p_c - p \, #h(2em) S = log \( 1 \/ delta \) \, #h(2em) m_0 = lr(bar.v.double T_p bar.v.double) \, #h(2em) R = chi_0^(+) / m_0 gt.eq 1 \, #h(2em) a_3 = "tr" \( T_p^3 \) . $
  Sprinkling (2.5) with $a = delta \/ \( 1 - p \)$ would bound $T_(p_c)$ if $a d m_0 < 1$. The assumed unboundedness, together with (5.10) and (6.4), therefore gives
  #[#set math.equation(numbering: n => "(9.1)")
   $ m_0 gt.eq frac(1 - p, d delta) \, #h(2em) log R = o \( S \) \, #h(2em) log a_3 = o \( S \) quad \( delta arrow.b 0 \) . $ <eq:s35>]
  Indeed $m_0 gt.eq c delta^(- 1)$, whereas, for every $eta > 0$, $chi_0^(+) lt.eq C_eta delta^(- 1 - eta)$ and $1 lt.eq a_3 lt.eq C_eta delta^(- eta)$. Hence $1 lt.eq R lt.eq C'_eta delta^(- eta)$ for every $eta > 0$.
  #thm([Claim 1.])[
    (Comparison of deformed row sums).  #emph[There is $c_f > 0$, depending only on $G$, such that 
#[#set math.equation(numbering: n => "(9.2)")
 $ s_t^V \( z \) gt.eq c_f chi_t #h(2em) upright("for every ") z in V upright(" whenever ") t c_k lt.eq 1 . $ <eq:s36>]

]
  ] <con:row-comparison>
  #proof[
    Connectedness and the finite number of vertex types give an integer $L_f$ such that every vertex is within distance $L_f$ of every vertex orbit. For fixed $t$, choose an orbit on which $s_t^V$ is maximal and a simple path of length at most $L_f$ from $z$ to that orbit. Equation (7.10), with $p gt.eq p_0$, gives
    $ s_t^V \( z \) gt.eq e^(- L_f) p_0^(L_f) max_x s_t^V \( x \) gt.eq e^(- L_f) p_0^(L_f) chi_t . $
    Thus $c_f = e^(- L_f) p_0^(L_f)$ is admissible. ◻
  ]
  Fix $0 < tau < c_f \/ \( 4 c_sigma \)$ and the constants of 30 for this value of $tau$. They are now fixed throughout the limit $p arrow.t p_c$. Since $j lt.eq J + 1 + C_1 log \( \( k + 1 \) R \)$, there are fixed constants $c > 0$ and $C_2 > 0$ such that
  #[#set math.equation(numbering: n => "(9.3)")
   $ p^(2 j) gt.eq c \( k R \)^(- C_2) #h(2em) \( k gt.eq k_0 \, med R gt.eq 1 \) . $ <eq:s37>]
  For example, one may take $C_2 = 2 C_1 log \( 1 \/ p_0 \)$ and $c = p_0^(2 \( J + 1 \)) 2^(- C_2)$.
  Put $lambda = - log rho > 0$ and choose a fixed $K_(*)$ with $kappa := lambda K_(*) > C_2 + 4$. Set
  $ A_delta = log \( 2 R \) + log \( 2 + a_3 \) + log S \, #h(2em) k = ceil.l K_(*) A_delta ceil.r \, #h(2em) B_(*) = \( k R \)^(C_2 + 2) \, #h(2em) t_(*) = B_(*) / m_0 . $
  By (9.1), $k arrow.r oo$ and $k = o \( S \)$; in particular $k gt.eq k_0$ and $k lt.eq S$ eventually. The estimates needed below are
  #[#set math.equation(numbering: n => "(9.4)")
   $ B_(*) rho^k = o \( 1 \) \, #h(2em) R^2 a_3 rho^k = o \( \( k R \)^(- C_2) \) \, #h(2em) t_(*) j c_k = o \( 1 \) . $ <eq:s38>]
  To check their simultaneous validity, the definition of $k$ gives
  $ rho^k lt.eq \( 2 R \)^(- kappa) \( 2 + a_3 \)^(- kappa) S^(- kappa) . $
  Since $R \, a_3 gt.eq 1$ and $k lt.eq S$, it follows that
  $ B_(*) rho^k lt.eq C S^(C_2 + 2 - kappa) arrow.r 0 \, #h(2em) \( k R \)^(C_2) R^2 a_3 rho^k lt.eq C S^(C_2 - kappa) arrow.r 0 . $
  Finally $c_k = e^(C k)$ and $m_0 gt.eq c e^S$, so
  $ log \( t_(*) j c_k \) lt.eq - S + \( C_2 + 2 \) \( log k + log R \) + log j + C k + O \( 1 \) = - S + o \( S \) . $
  This proves (9.4) with every path constant already fixed.
  Consider the deformation with these values of $p \, k$, on $0 lt.eq t lt.eq t_(*)$. Equation (7.4) and the first estimate in (9.4) give
  #[#set math.equation(numbering: n => "(9.5)")
   $ m_t gt.eq m_0 \( 1 - 2 B_(*) rho^k \) gt.eq m_0 / 2 \, #h(2em) chi_t gt.eq frac(m_0, 2 c_sigma) . $ <con:retained-norm>]
  The second inequality uses the row-sum bound $m_t lt.eq c_sigma chi_t$; it requires no positivity of $T_t$ as an operator.
  For a selected raw path in 30, let $z$ be either of its two escape endpoints. By (7.6), (8.1), (9.2), and (9.5),
  $ s_t^(D_w) \( z \) & gt.eq c_f chi_t - chi_0^(+) tau / R = c_f chi_t - tau m_0\
 & gt.eq \( c_f - 2 c_sigma tau \) chi_t gt.eq c_f / 2 chi_t . $
  The hypotheses of (9.2) hold throughout this interval by the last estimate in (9.4). Apply (7.10) to the two simple escape paths in $D_w$, each of length at most $j$. Their product is bounded below by
  $ s_t^(D_w) \( u \) s_t^(D_w) \( v \) gt.eq e^(- 2 t j c_k) p^(2 j) (c_f / 2 chi_t)^2 . $
  Such paths have $bb(E)_(upright("path"))$-probability at least $b_(*)$, so (9.3) and (9.4) imply
  #[#set math.equation(numbering: n => "(9.6)")
   $ bb(E)_(upright("path")) #h(-0.16667em) [upright(bold(1))_({ ell_w gt.eq 3 }) s_t^(D_w) \( u \) s_t^(D_w) \( v \)] gt.eq c_1 \( k R \)^(- C_2) chi_t^2 \, $ <con:positive-term>]
  uniformly on $\[ 0 \, t_(*) \]$, with $c_1 > 0$ independent of sufficiently small $delta$. On the other hand, the error in (7.5) is at most
  $ C' \( chi_0^(+) \)^2 rho^k a_3 = C' R^2 m_0^2 rho^k a_3 lt.eq 4 C' c_sigma^2 R^2 rho^k a_3 chi_t^2 = o \( \( k R \)^(- C_2) chi_t^2 \) . $
  The prefactor $e^(- t c_k)$ in that equation is uniformly bounded below. We conclude that, for a constant $c_2 > 0$,
  #[#set math.equation(numbering: n => "(9.7)")
   $ - chi'_t gt.eq c_2 \( k R \)^(- C_2) chi_t^2 #h(2em) \( 0 lt.eq t lt.eq t_(*) \) . $ <con:differential-decrease>]
  The differentiability and domination established for the deformation justify integration. Since $chi_t > 0$, it yields
  $ 1 / chi_(t_(*)) gt.eq c_2 \( k R \)^(- C_2) t_(*) = frac(c_2 \( k R \)^2, m_0) . $
  But (9.5) gives $1 \/ chi_(t_(*)) lt.eq 2 c_sigma \/ m_0$. These inequalities are incompatible with $k R arrow.r oo$. Thus $T_(p_c)$ is bounded, proving 2. ◻
]

The next elementary endpoint lemma records the equivalence between critical boundedness and the uniform subcritical formulation in 1.

#thm([Lemma 32.])[
  (Monotone passage to an endpoint).  #emph[Let $G$ be an infinite locally finite graph, let $p_(*) in \( 0 \, 1 \]$, and let $T_p \( x \, y \) = bb(P)_p \( x arrow.l.r y \)$ be its Bernoulli bond connection kernels. Then $T_(p_(*))$ is bounded on counting-measure $ell^2 \( V \)$ if and only if $sup_(0 lt.eq p < p_(*)) lr(bar.v.double T_p bar.v.double)_(2 arrow.r 2) < oo$. In that case the supremum equals $lr(bar.v.double T_(p_(*)) bar.v.double)_(2 arrow.r 2)$.]
] <con:critical-limit>

#proof[
  Each finite-domain connection probability is continuous in $p$, and connectivity in $G$ is the increasing union of finite-domain connectivity events. Thus $T_p \( x \, y \) arrow.t T_(p_(*)) \( x \, y \)$ as $p arrow.t p_(*)$. If the subcritical norms are bounded by $M$, then for finitely supported $f \, g$ the finite sum $chevron.l \, chevron.r f T_p g$ tends to $chevron.l \, chevron.r f T_(p_(*)) g$ and has absolute value at most $M lr(bar.v.double  bar.v.double) f_2 lr(bar.v.double  bar.v.double) g_2$. The limiting sesquilinear form extends by density to a bounded operator with the required matrix entries and norm at most $M$. Conversely, entrywise nonnegativity gives
  $ \| chevron.l \, chevron.r f T_p g \| lt.eq chevron.l \| f \| \, T_p \| g \| chevron.r lt.eq chevron.l \| f \| \, T_(p_(*)) \| g \| chevron.r lt.eq lr(bar.v.double T_(p_(*)) bar.v.double) lr(bar.v.double  bar.v.double) f_2 lr(bar.v.double  bar.v.double) g_2 . $
  The two inequalities prove both equivalence and equality of norms. ◻
]

The simultaneous phase theorem of Häggström, Peres, and Schonmann #cite(label("HaggstromPeresSchonmann1999")) Theorem 1.3 applies to all quasi-transitive graphs and gives one event valid throughout the open nonuniqueness phase. The following direct argument proves the compact interval consequence from operator boundedness alone. It avoids taking an uncountable intersection of events of probability one.

#thm([Proposition 9.])[
  (One coupling for an interval).  #emph[Let $G$ be infinite, connected, locally finite, and quasi-transitive. Suppose $p_c < p_1 < p_2 < 1$ and $T_(p_2)$ is bounded on $ell^2 \( V \)$. In the coupling obtained by assigning independent uniform labels to edges and opening an edge at parameter $p$ when its label is at most $p$, almost surely there are infinitely many infinite clusters simultaneously at every $p in \[ p_1 \, p_2 \]$.]
] <con:coupled-interval>

#proof[
  Let $N_12$ be the number of $p_2$-clusters containing an infinite $p_1$-cluster. First, every automorphism-invariant event of the label field has probability zero or one. Indeed, approximate such an event $E$, within error $epsilon$ in probability, by a finite-coordinate event $A$. Its coordinates lie in a finite ball centered at a vertex in an unbounded orbit; such an orbit exists because there are finitely many orbits and infinitely many vertices. An automorphism can move this ball disjointly from itself. The events $A$ and its translate are then independent, whereas $E$ agrees with its translate. It follows that $\| bb(P) \( E \) - bb(P) \( E \)^2 \| lt.eq 4 epsilon$, and letting $epsilon arrow.b 0$ proves the assertion. In particular the invariant, measurable random variable $N_12 in { 0 \, 1 \, 2 \, dots.h \, oo }$ is constant almost surely. Since $p_1 > p_c$, an infinite $p_1$-cluster exists with positive probability, so this constant is positive.
  It cannot equal one. Write $theta \( x \) = bb(P)_(p_1) \( \| C_x \| = oo \)$. Some $theta \( x \)$ is positive; positive association with a finite path makes $theta$ positive at every vertex. Invariance and the finite number of types give $theta_(*) := inf_x theta \( x \) > 0$. If $N_12 = 1$, any two vertices in infinite $p_1$-clusters belong to the same $p_2$-cluster. Positive association therefore implies
  $ T_(p_2) \( x \, y \) gt.eq theta \( x \) theta \( y \) gt.eq theta_(*)^2 #h(2em) \( x \, y in V \) . $
  For finite sets $F$ of arbitrarily large size this gives $chevron.l upright(bold(1))_F \, T_(p_2) upright(bold(1))_F chevron.r \/ lr(bar.v.double upright(bold(1))_F bar.v.double)_2^2 gt.eq theta_(*)^2 \| F \|$, contradicting boundedness.
  Suppose instead that $N_12 = n$ almost surely for an integer $n gt.eq 2$. By countability there are fixed vertices $x \, y$ which, with positive probability, belong to infinite $p_1$-clusters lying in distinct $p_2$-clusters. Fix a finite path from $x$ to $y$. Replace its edge labels by independent uniform labels in $\[ 0 \, p_1 \]$. The resulting law is absolutely continuous with respect to the original product law: only finitely many coordinates were resampled, each with a bounded density. At both parameters this modification only opens edges, and on the specified positive-probability event it merges two counted $p_2$-clusters.
  Every infinite $p_1$-cluster after the modification contains an infinite $p_1$-cluster from before it. Indeed finitely many added edges can combine only finitely many old clusters into any new cluster; a finite union of finite clusters is finite. Thus each new counted $p_2$-cluster contains an old counted $p_2$-cluster, and old $p_2$-clusters only merge. On the event in question the new count is at most $n - 1$. This contradicts absolute continuity and the almost sure equality $N_12 = n$. Hence $N_12 = oo$ almost surely.
  On this single event, choose an infinite $p_1$-cluster in each of infinitely many distinct counted $p_2$-clusters. For every $p in \[ p_1 \, p_2 \]$, their containing $p$-clusters are infinite and remain distinct because their $p_2$-clusters are distinct. This proves the simultaneous assertion. ◻
]

#proof[
  First suppose $G$ is simple. If $"Aut" \( G \)$ is unimodular, 2 gives $lr(bar.v.double T_(p_c) bar.v.double) < oo$. Since $p_c < 1$, sprinkling (2.5) at $p = p_c$ with any sufficiently small $a > 0$ gives a bounded connection kernel at $p_c + \( 1 - p_c \) a > p_c$. Thus $p_c < p_(2 arrow.r 2)$.
  If $"Aut" \( G \)$ is nonunimodular, 1 supplies both critical boundedness and the strict operator gap. In either case, 4 yields $p_c < p_(2 arrow.r 2) lt.eq p_u$.
  If loops or parallel edges are allowed, use the simple subdivision $H$ from 1. Infinite-cluster counts in $H$ at parameter $t$ agree with those in $G$ at parameter $t^2$, so $p_c \( H \)^2 = p_c \( G \)$. Moreover, on the old vertex set,
  $ T_t^H \|_(V \( G \) times V \( G \)) = T_(t^2)^G . $
  Compression of a bounded operator to this coordinate subspace is bounded. Applying the simple-graph result to $H$ therefore gives boundedness of $T_(p_c \( G \))^G$ and of $T_p^G$ at some $p > p_c \( G \)$. The inequality $p_(2 arrow.r 2) \( G \) lt.eq p_u \( G \)$ again follows from 4. This covers the full graph class in the statement.
  Finally choose $p_c < p_1 < p_2 < 1$ with $T_(p_2)$ bounded, which the strict operator gap permits. 9 supplies the claimed simultaneous nonempty interval of infinitely many infinite clusters. The equality of the uniform subcritical and critical norms is 32, completing the proof. ◻
]

== 10 Consequences of the operator theorem <cons:section>

We now prove Corollary 2. The two parts of the connection-operator conclusion play related but distinct roles. Boundedness at criticality makes the triangle diagram finite, bringing the standard mean-field theory into play. The strict interval of operator boundedness above $p_c$ gives exponential two-point decay there and supplies the stronger input used for the extrinsic-radius law.

#proof[
  For every graph in the corollary, 1 makes $T_(p_c)$ a bounded operator on counting-measure $ell^2 \( V \)$. Tonelli’s theorem identifies its nonnegative matrix product with the triangle sum. If $delta_v$ is the unit vector at $v$, then
  $ nabla_(p_c) \( v \) = chevron.l delta_v \, T_(p_c)^3 delta_v chevron.r lt.eq lr(bar.v.double T_(p_c)^3 bar.v.double)_(2 arrow.r 2) lt.eq lr(bar.v.double T_(p_c) bar.v.double)_(2 arrow.r 2)^3 . $
  This proves (1.1). The same implication is recorded in #cite(label("Hutchcroft2020L2")) Section 1.
  ===== 10.1 Critical laws on simple graphs. <critical-laws-on-simple-graphs.>
  First suppose that $G$ is simple. The susceptibility, percolation-probability, and cluster-size estimates are the classical mean-field consequences of the triangle condition #cite(label("AizenmanNewman1984")) #cite(label("BarskyAizenman1991")); their quasi-transitive form is recorded in #cite(label("Hutchcroft2020L2")) Section 1, Equations (1.1)–(1.3). For explicit applications with the precise quasi-transitive hypotheses, we use the following later results. Under the stronger condition $p_c < p_(2 arrow.r 2)$ available here, we may apply #cite(label("Hutchcroft2022FiniteClusters")) Theorem 1.1 and Corollary 1.4. The corollary with $k = 1$ and $p arrow.t p_c$ gives (1.2), since subcritical clusters are finite. The theorem at $p = p_c$ gives (1.2), since Lemma 2 excludes infinite critical clusters.
  For percolation probability, Lemma 2.1 of #cite(label("Hutchcroft2022FiniteClusters")), whose hypothesis is the triangle condition, bounds the intrinsic-radius tail uniformly over vertices. Letting the radius tend to infinity gives $theta_v \( p \) lt.eq C \( p - p_c \)$ for $p gt.eq p_c$: local finiteness makes an infinite cluster equivalent to an unbounded intrinsic radius. For the lower bound, choose one representative from each vertex orbit, forming a finite set $F$. Theorem 2 and Propositions 11 and 23 of #cite(label("AntunovicVeselic2008")), with $beta = - log \( 1 - p \)$, give
  $ sum_(u in F) theta_u \( p \) gt.eq c \( p - p_c \) $
  for $p > p_c$ sufficiently close to $p_c$. Indeed, their bound is linear in $beta - beta_c$, and this is comparable to $p - p_c$ near $0 < p_c < 1$. Fix $v$ and choose a path of length $l_u$ from $v$ to each $u in F$. Harris association applied to the event that this path is open and the event ${ \| C_u \| = oo }$ gives $theta_v \( p \) gt.eq p^(l_u) theta_u \( p \)$. Hence
  $ theta_v \( p \) gt.eq frac(min_(u in F) p_c^(l_u), \| F \|) sum_(u in F) theta_u \( p \) gt.eq c_v \( p - p_c \) \, $
  which proves (1.2).
  For the radius estimates, it is important to distinguish the two metrics. The intrinsic-radius upper bound under the triangle condition originates in the lattice setting in #cite(label("KozmaNachmias2009")) Theorem 1.2(ii); its quasi-transitive form and the matching general lower bound are described in #cite(label("Hutchcroft2020L2")) Section 3. The extrinsic-radius law uses the stronger condition $p_c < p_(2 arrow.r 2)$ #cite(label("Hutchcroft2020L2")) Theorem 3.1. Both estimates in the exact quasi-transitive form needed here are included in #cite(label("Hutchcroft2022FiniteClusters")) Theorem 1.2, whose hypothesis is $p_c < p_(2 arrow.r 2)$. Set $p = p_c$ in that theorem. Its events require the cluster radius to be finite; Lemma 2 shows that all critical clusters are finite almost surely, so this restriction may be removed. The resulting estimates are (1.2) and (1.2).
  ===== 10.2 Exponential connectivity. <exponential-connectivity.>
  The definition of $p_exp$ above is equivalent to that in #cite(label("Hutchcroft2020L2")) Section 2: a positive exponential rate is equivalent to an estimate with some positive exponent and finite prefactor, uniformly over vertices. Theorem 2.2 of that paper gives $p_(2 arrow.r 2) lt.eq p_exp$. More precisely, its Remark 2.3 gives, for $0 < p < p_(2 arrow.r 2)$,
  $ T_p \( x \, y \) lt.eq 2 lr(bar.v.double T_p bar.v.double)_(2 arrow.r 2) exp (- frac("dist"_G \( x \, y \), e lr(bar.v.double T_p bar.v.double)_(2 arrow.r 2))) #h(2em) \( x \, y in V \) . $
  At $p = 0$ the off-diagonal connection probabilities vanish. Together with $p_c < p_(2 arrow.r 2)$ from 1, this proves (1.3) and (1.4) for simple graphs.
  ===== 10.3 Subdivision and transfer of the laws. <subdivision-and-transfer-of-the-laws.>
  It remains to pass from simple graphs to the full graph class of the corollary. Delete the loops, which change none of the observables, and let $H = tilde(G)$ be the simple subdivided graph in Lemma 1. Denote the set of nonloop edge copies of $G$ by $E_0$, so $V \( H \) = V \( G \) union.sq E_0$. Let $d_0$ bound the number of incident nonloop edges at a vertex of $G$, counting parallel copies. In the coupling of that lemma, parameter $t$ on $H$ induces parameter $p = t^2$ on $G$, old-vertex connection probabilities agree, and $p_c \( H \)^2 = p_c \( G \)$.
  For an old root $v$, write $C_v^G$ and $C_v^H$ for the two coupled clusters, and use the same superscripts for the connection and percolation observables. Their old vertices agree. Every new vertex in $C_v^H$ is joined by an open edge to an old neighbor in the same cluster, and every old vertex has at most $d_0$ new neighbors. Hence, pathwise,
  #[#set math.equation(numbering: n => "(10.1)")
   $ \| C_v^G \| lt.eq \| C_v^H \| lt.eq \( 1 + d_0 \) \| C_v^G \| \, #h(2em) theta_v^G \( t^2 \) = theta_v^H \( t \) . $ <eq:subdivision-size>]
  For two old vertices, both the ambient distance and the distance along open paths in $H$ are twice their counterparts in $G$. A new vertex in the root cluster is at distance at most one from an old vertex in that cluster. Consequently, for either radius,
  #[#set math.equation(numbering: n => "(10.2)")
   $ 2 "rad"_(*) \( C_v^G \) lt.eq "rad"_(*) \( C_v^H \) lt.eq 2 "rad"_(*) \( C_v^G \) + 1 \, #h(2em) * in { upright("int") \, upright("ext") } . $ <eq:subdivision-radius>]
  The statements include infinite values. Applied at $t = p_c \( H \) = sqrt(p_c \( G \))$, these comparisons transfer the three critical tails from $H$ to $G$. They also transfer susceptibility and percolation probability on the appropriate sides of criticality: if $t_c = sqrt(p_c \( G \)) > 0$, then $p - p_c \( G \) = \( t - t_c \) \( t + t_c \)$, whose second factor stays bounded above and away from zero near $t_c$. Multiplicative constants may change, as allowed in the corollary.
  ===== 10.4 Transfer of the operator threshold. <transfer-of-the-operator-threshold.>
  To transfer the full range in (1.4), we also compare the two operator thresholds. Define the incidence operator $B : ell^2 \( E_0 \) arrow.r ell^2 \( V \( G \) \)$ by $B \( x \, e \) = upright(bold(1))_({ x upright(" is an endpoint of ") e })$. Its row sums are at most $d_0$ and its column sums are two. Cauchy–Schwarz at each old vertex gives $lr(bar.v.double B f bar.v.double)_2^2 lt.eq 2 d_0 lr(bar.v.double  bar.v.double) f_2^2$, so $lr(bar.v.double  bar.v.double) B_(2 arrow.r 2) lt.eq sqrt(2 d_0)$. The operator
  $ Q : ell^2 \( V \( G \) \) arrow.r ell^2 \( V \( G \) \) xor ell^2 \( E_0 \) \, #h(2em) Q f = \( f \, B^(*) f \) \, $
  satisfies $lr(bar.v.double  bar.v.double) Q_(2 arrow.r 2)^2 lt.eq 1 + 2 d_0$. For an old-to-new connection in $H$, a simple open path must enter the new vertex through one of its two old endpoints. For a connection between distinct new vertices, choose an old endpoint at each end of a simple open path. Between these old endpoints the path induces a connection in $G$. The union bound, together with equality for old-to-old connections, therefore gives the entrywise inequality
  $ T_t^H lt.eq Q T_(t^2)^G Q^(*) . $
  The product on the right is interpreted entrywise here; each entry is a sum over at most four pairs of old endpoints. This inequality also covers a new diagonal entry: the corresponding diagonal entry of $B^(*) T_(t^2)^G B$ is at least two. If $T_(t^2)^G$ is bounded, entrywise domination of nonnegative kernels makes $T_t^H$ bounded with norm at most $lr(bar.v.double  bar.v.double) Q^2 lr(bar.v.double T_(t^2)^G bar.v.double)$. Conversely, if $T_t^H$ is bounded, compression to the old vertices makes $T_(t^2)^G$ bounded. Thus boundedness is equivalent and, in that case,
  $ lr(bar.v.double T_(t^2)^G bar.v.double)_(2 arrow.r 2) lt.eq lr(bar.v.double T_t^H bar.v.double)_(2 arrow.r 2) lt.eq \( 1 + 2 d_0 \) lr(bar.v.double T_(t^2)^G bar.v.double)_(2 arrow.r 2) . $
  It follows that
  $ p_(2 arrow.r 2) \( H \)^2 = p_(2 arrow.r 2) \( G \) . $
  For every $0 lt.eq p < p_(2 arrow.r 2) \( G \)$, apply the simple-graph exponential bound to $H$ at $t = sqrt(p) < p_(2 arrow.r 2) \( H \)$. Old-vertex connectivity agrees and $"dist"_H \( x \, y \) = 2 "dist"_G \( x \, y \)$ for $x \, y in V \( G \)$, so restriction gives (1.4) with constants depending only on $G$ and $p$. Its validity for every $p < p_(2 arrow.r 2) \( G \)$ implies $p_(2 arrow.r 2) \( G \) lt.eq p_exp \( G \)$, completing the proof. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
