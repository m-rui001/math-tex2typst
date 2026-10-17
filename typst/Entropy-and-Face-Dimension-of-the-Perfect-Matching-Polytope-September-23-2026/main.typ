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

#align(center)[#text(size: 16pt, weight: "bold")[Entropy and Face Dimension of the Perfect-Matching Polytope]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

Prescribing the probability that each edge belongs to a random perfect matching does not prescribe the distribution of the whole matching. The largest possible entropy of such a distribution measures how many matching choices can coexist with those edge probabilities. We bound this entropy by explicit sums of one-coordinate functions, at every feasible mean. The result yields lower counts from uniform marginals and additive estimates for weighted partition functions.

Throughout, a graph is finite, undirected and loopless. Parallel edges are distinguished both as coordinates and as choices in a matching. A perfect matching covers each vertex by exactly one edge. Write $cal(M) \( G \)$ for the set of perfect matchings, $N \( G \) = \| cal(M) \( G \) \|$, and

$ P \( G \) = "conv" { upright(bold(1))_M : M in cal(M) \( G \) } subset.eq bb(R)^(E \( G \)) $

for their polytope. Thus a point $x in P \( G \)$ is exactly a feasible vector of edge probabilities. For a probability law $p$ on the matching family, put $"Ent" \( p \) = - sum_M p_M log p_M$, and define

#[#set math.equation(numbering: n => "(1)")
 $ H \( x \) & = max {"Ent" \( p \) : p upright(" is a probability law on ") cal(M) \( G \) \, med sum_M p_M upright(bold(1))_M = x} \,\
F \( x \) & = - sum_(e in E \( G \)) x_e log x_e \, #h(2em) B \( x \) = - sum_(e in E \( G \)) \( 1 - x_e \) log \( 1 - x_e \) . $ <intro:H>]

All unqualified logarithms are natural, and $0 log 0 = 0$. The maximum in Equation (1) is attained by compactness of the feasible set of laws. No connectedness or bipartiteness is assumed.

#thm([Theorem 1.1.])[
  (Pointwise entropy bounds).  #emph[Let $G$ be a loopless multigraph on $2 m gt.eq 2$ vertices with at least one perfect matching. For every $x in P \( G \)$, 
#[#set math.equation(numbering: n => "(2)")
 $ F \( x \) - (2 - 2 / m) B \( x \) lt.eq H \( x \) lt.eq F \( x \) . $ <intro:main-bound>]

]
] <ent:main>

In particular, $H gt.eq F - 2 B$ throughout the polytope, including its boundary. When $m = 1$, each matching is one of the distinguished edges between two vertices, and the bounds give the exact identity $H = F$. For the empty vertex set the unique empty matching gives $F = B = H = 0$; the formula involving $1 \/ m$ is not used.

The upper bound $H lt.eq F$ is a direct instance of Shearer’s entropy inequality #cite(label("ChungGrahamFranklShearer1986")): each edge occurs in two vertex stars, and a matching chooses exactly one edge at each vertex. Our contribution to Equation (2) is its lower comparison. The coefficient there is obtained from a geometric rank estimate followed by a covariance calculation, with no assumption that the mean is interior to the full polytope.

Edmonds’ matching-polytope theorem #cite(label("Edmonds1965")) describes feasible matching means by degree equations, nonnegativity and odd-cut inequalities. The odd cuts distinguish general graphs from bipartite graphs and are also central to the entropy bound here. Bipartite graphs admit an order-independent coefficient-one comparison: Schrijver’s inequality #cite(label("Schrijver1998Counting")) and the weighted Bethe inequality of Gurvits #cite(label("Gurvits2011SchrijverBethe")) expanded version, Theorem 2.2, together with entropy duality, imply $H \( x \) gt.eq F \( x \) - B \( x \)$. Their permanent setting is essential to this comparison. In Section 5 we give a simple eight-vertex nonbipartite graph with a feasible mean for which $H < F - B$.

=== 1.1 Entropy and structural consequences <entropy-and-structural-consequences>

Anari, Oveis Gharan and Vinzant #cite(label("AnariOveisGharanVinzant2018")) FOCS version, Conjecture 6 proposed a convex-optimization framework for approximate counting and asked whether the maximum binary-coordinate entropy of a perfect matching mean exceeds $log N \( G \)$ by only a linear function of the number of vertices. In our notation their objective is $F + B$. Theorem 1 gives the explicit positive answer

$ log N \( G \) lt.eq max_(x in P \( G \)) \( F \( x \) + B \( x \) \) lt.eq log N \( G \) + 3 m - 2 . $

The pointwise statement also controls arbitrary finite edge weights, through the Gibbs variational formula. The proposed linear-error estimate is therefore an optimized consequence of the prescribed-mean inequality, rather than its definition. Corollary 13 proves the optimized bounds, and Section 6 derives the weighted form.

If $G$ contains $k gt.eq 2$ edge-disjoint perfect matchings, their uniform mixture has marginal $1 \/ k$ on their union. Substituting that mean into Theorem 1 gives

$ N \( G \) gt.eq k^m \( 1 - 1 \/ k \)^(2 \( m - 1 \) \( k - 1 \)) gt.eq e^(- 2 \( m - 1 \)) k^m . $

The same estimate holds for a $k$-regular graph whose every odd cut has at least $k$ edges, because its uniform vector belongs to $P \( G \)$. These consequences and their endpoint cases are proved in Section 4.

For structural counts, the scale of the degree matters. Esperet, Kardoš, King, Kráľ and Norine #cite(label("EsperetEtAl2011")) proved an exponential lower bound for every bridgeless cubic graph. Abdi, Cornuéjols, Dadush and Dalirrooyfard #cite(label("AbdiCornuejolsDadushDalirrooyfard2026")) Corollary 6.6 proved exponential lower bounds for all regular graphs of degree at least four satisfying the corresponding odd-cut condition, including matchings crossing every minimum odd cut exactly once. Ebrahimnejad, Nagda and Oveis Gharan #cite(label("EbrahimnejadEtAl2021")) gave quantitative lower counts for regular nonbipartite graphs under an additional spectral-expansion hypothesis. The estimate $\( k \/ e^2 \)^m$ obtained here has a base growing with the degree $k$. At small fixed degree these earlier exponential results can be stronger: our displayed homogeneous base is greater than one only when $k gt.eq 8$. On the bipartite subclass Schrijver’s bound has the stronger asymptotic base $k \/ e$ per matched pair. Our structural statements concern the explicit odd-cut condition; merely requiring every edge to belong to a perfect matching is a different hypothesis. Esperet et al. formulate the growing-degree question on the broader matching-covered class #cite(label("EsperetEtAl2011")) corrected full version, Conjecture 24. Our regular odd-cut corollary also establishes the even-order connectivity formulation of #cite(label("EbrahimnejadEtAl2021"), form: "prose") arXiv version, Conjecture 1.1.#footnote[The cited arXiv version writes the degree as $d$ but prints an undeclared $k - 1$ in the connectivity condition. We read it as $d - 1$, consistently with its Section 1.2.]

=== 1.2 Face dimension and the entropy argument <face-dimension-and-the-entropy-argument>

For a graph on $2 m gt.eq 2$ vertices and $x in P \( G \)$, let $F_x$ be its minimal face, the smallest face of $P \( G \)$ containing $x$, and let $"supp" x = { e : x_e > 0 }$. The geometric input is the sharp estimate

$ \| "supp" x \| - dim F_x lt.eq 3 m - 2 . $

Edmonds’ theorem identifies the left side with the rank of the tight odd-cut equations on the supported coordinates; singleton cuts supply the degree equations. Abdi et al. #cite(label("AbdiCornuejolsDadushDalirrooyfard2026")) Lemmas 6.4–6.5 bound this rank by $3 m - 1$ using odd laminar families. Their cubic staircase examples already have minimum-odd-cut rank $\| E \| - 2$, attaining $3 m - 2$ #cite(label("AbdiCornuejolsDadushDalirrooyfard2026")) discussion after Corollary 6.6 and Figure 2.

The dimension of the whole perfect-matching polytope was characterized by Naddef #cite(label("Naddef1982")) and by Edmonds, Pulleyblank and Lovász #cite(label("EdmondsPulleyblankLovasz1982")), whose brick decomposition uses cuts crossed once by every perfect matching. Here a cut need only be tight at the prescribed mean: it is crossed once by every matching in that minimal face, but possibly not by every matching of the graph. Section 2 proves the supported bound by contracting such a cut. A direction in the parent face can be assembled from directions in the two contracted faces when their crossing-edge coordinates agree. Each crossing-coordinate sum is zero, by the degree equation at the contracted vertex. Agreement therefore imposes at most $\| C \| - 1$ independent conditions for a cut $C$, rather than $\| C \|$. This saved condition closes an induction with bound $3 m - 2$. Appendix 11 also gives the laminar proof. It uses the standard face-restricted uncrossing argument #cite(label("SvenssonTarnawski2017")) full version, Lemma 2.2 and Appendix A and retains the dependence between complementary root children in the laminar tree.

The analytic step uses the classical exponential form of a maximum-entropy law under mean constraints #cite(label("Jaynes1957")) #cite(label("SinghVishnoi2014")). Its log-partition Hessian is the covariance matrix, as in standard exponential-family theory #cite(label("WainwrightJordan2008")). We restrict the law to the atoms of $F_x$. Its covariance then has image equal to the direction space of that face, even when it is singular in the ambient edge space.

Suppose that $F - c B - H$ has a positive maximum. Removing coordinates fixed at zero or one leaves strictly fractional means and preserves this entropy deficit. Exponential tilts within the resulting minimal face supply smooth curves through the maximum. First-order stationarity cancels the acceleration term in their second derivatives. Summing the second-derivative inequalities over positive covariance eigenvalues bounds the face dimension above, contradicting the geometric lower bound whenever $c > 2 - 2 \/ m$ for the original graph. Passing to the endpoint proves Theorem 1. Section 3 carries this out within the face, without inverting an ambient covariance kernel or differentiating across faces.

Section 5 explains both geometric sharpness and the obstruction to coefficient one. We use the triangle expansions underlying the Klee graphs of Cygan, Pilipczuk and Škrekovski #cite(label("CyganPilipczukSkrekovski2013")) to construct a two-dimensional minimal face on every positive even order. At uniform edge marginals, a matching law is forced onto its three vertices even when the graph has further matchings. These examples attain the geometric bound and give the coefficient-one counterexample; they do not establish optimality of the coefficient two.

=== 1.3 Deterministic counting with binary multiplicities <deterministic-counting-with-binary-multiplicities>

For the algorithmic problem, the input specifies a vertex set and nonnegative integer multiplicities $k_(i j)$ in binary for unordered pairs of distinct vertices; omitted pairs have multiplicity zero. Its count is

$ N \( G \) = sum_M product_({ i \, j } in M) k_(i j) \, $

where $M$ runs over pairings of the vertex set. The input can also list parallel edges explicitly. The algorithm uses the binary multiplicities without expanding them into labelled copies.

#thm([Theorem 1.2.])[
  (Deterministic approximate counting).  #emph[ There is one uniform deterministic algorithm which, on a graph on $n$ vertices with nonnegative binary integer pair multiplicities, returns an integer $A gt.eq 0$ satisfying 
$ N \( G \) \/ 512^n lt.eq A lt.eq N \( G \) . $

 Its running time and output length are polynomial in the input bit length. In particular, $A = 0$ exactly when $N \( G \) = 0$. The guarantee includes a compact input consisting of binary $n$ and a list of positive pair records.]
] <thm:main>

The factor $512^n$ permits a complete implementation with integer and rational arithmetic and a fixed polynomial number of steps. The degree of this polynomial is large; the theorem gives a complexity guarantee, not a practical running-time benchmark. Appendix 13 treats the different convention that a loop covers its one incident vertex. It returns a rational approximation within factor $2^(18 n)$, including when the original vertex count is odd.

===== 1.3.1 Approximation history and computational models. <approximation-history-and-computational-models.>

Exact counting is $\# upright(P)$-complete even for bipartite perfect matchings, through the permanent of a zero–one matrix #cite(label("Valiant1979")) Theorem 1. For an $r times r$ nonnegative matrix, Linial, Samorodnitsky and Wigderson give an $e^r$-factor deterministic strongly polynomial arithmetic algorithm #cite(label("LinialSamorodnitskyWigderson2000")) author version, Theorem 1.1. Jerrum, Sinclair and Vigoda give a fully polynomial randomized approximation scheme for the nonnegative permanent #cite(label("JerrumSinclairVigoda2004")). For nonnegative rational matrices, Kudria, Luo and Majid give certified rational endpoints in polynomial bit time with logarithmic width $O \( r \( log log r \)^2 \/ log r \)$ #cite(label("KudriaLuoMajid2026")) Theorem 1.1, while Dong and Jain give factor $\( 1 + epsilon \)^r$ for every fixed $0 < epsilon lt.eq 1$ in a strongly polynomial arithmetic model #cite(label("DongJain2026")) Theorem 1.1 and Section 1.1. These permanent results concern bipartite graphs on $2 r$ vertices.

The analogous function for a general graph is the #emph[hafnian]: the sum of products over pairings of the indices of a symmetric matrix. Barvinok describes a randomized exponential-factor approximation for nonnegative hafnians #cite(label("Barvinok1999")) author preprint, Section 7. For fixed $delta > 0$ and any $0 < epsilon < 1$, his later theorem approximates $ln "haf" \( A \)$ to additive error $epsilon$ using $r^(O_delta \( log r + log \( 1 \/ epsilon \) \))$ arithmetic operations when the entries of the symmetric $2 r times 2 r$ matrix lie in $\[ delta \, 1 \]$ #cite(label("Barvinok2017")) Theorem 2.1. The diagonal may be filled arbitrarily in this interval, since a hafnian uses no diagonal entry. Yi gives a deterministic fully polynomial approximation scheme for rational hafnian inputs of even order, with zero diagonal, when nonzero entries lie in $\[ theta \, 1 \]$ and the support has minimum degree at least $\( 1 \/ 2 + gamma \)$ times its order, for fixed $0 < theta lt.eq 1$ and $0 < gamma < 1 \/ 2$ #cite(label("Yi2026")) Theorem 1.1(a). These hypotheses differ from arbitrary supports and binary multiplicities in Theorem 2. A separate manuscript treats fully polynomial randomized relative approximation for arbitrary simple graphs #cite(label("OpenAIMatchingFPRAS2026")) Theorem 1.1.

The construction follows the entropy-optimization approach of Anari, Oveis Gharan and Vinzant #cite(label("AnariOveisGharanVinzant2018")) FOCS version, Section I.D, with a rational optimizer and all bit bounds given explicitly here. Section 6 establishes the binary-log weighted interface. Sections 7 and 8 first complete the input to $K_n$, assigning tiny positive dyadic weights to absent pairs. This keeps the optimization polytope nonempty and separates zero from positive original counts. They then replace the weighted entropy objective by an integer-slope dyadic interpolant and an exact penalty on a box. On $K_n$, correcting degrees and then mixing with the uniform feasible point repairs constraint violations. The resulting fixed-grid iteration needs only an active violated row. Section 9 finds that row by a parity-preserving cut recursion, and Section 10 proves the count, zero-detection and bit-complexity guarantees. Minimum odd cuts as matching-constraint separators go back to Padberg and Rao #cite(label("PadbergRao1982")). The exponential matching laws used in the entropy proof remain analytic objects; this algorithm does not query them.

The appendices retain alternative relations between face geometry and entropy. Appendix 11 gives the laminar and quotient-map arguments, then the direct coefficient-three and coefficient-four covariance comparisons and their counting consequences. Appendix 12 proves the nonlinear entropy-defect bound by normalizing positive marginals and taking the inverse covariance on the face’s direction space; Appendix 11 also gives its short scalar deduction. Appendix 13 proves the singleton-loop reduction and its rational bit complexity.

== 2 Faces and tight cuts of the perfect matching polytope <geom:sec-polytope>

The geometric input to the entropy argument is a bound on the number of independent equations defining a face on its positive coordinates. We prove the odd-cut description by gluing matching laws across a tight cut. The same gluing operation then combines directions in the two contracted polytopes. Both directions preserve the total mass on the cut, which saves one compatibility equation and yields the sharp bound $3 m - 2$. The laminar proof of the same estimate is given in Appendix 11.

Throughout this section, $G = \( V \, E \)$ is a finite undirected loopless multigraph of even order $\| V \| = 2 m$. Parallel edges have distinct labels and coordinates. Write $cal(M) \( G \)$ for its perfect matchings, put $a \( M \) = upright(bold(1))_M in { 0 \, 1 }^E$, and define

$ P \( G \) = "conv" { a \( M \) : M in cal(M) \( G \) } . $

The convex hull of an empty matching family is empty. If $V$ is empty, its unique perfect matching is the empty matching and its polytope is a singleton in $bb(R)^diameter$. For $S subset.eq V$, let $delta \( S \)$ be the set of edges with exactly one endpoint in $S$, and put $chi_S = upright(bold(1))_(delta \( S \))$. We abbreviate $delta \( { v } \)$ to $delta \( v \)$, and write $x \( A \) = sum_(e in A) x_e$ for $A subset.eq E$.

=== 2.1 Contraction and the odd-cut description <contraction-and-the-odd-cut-description>

For an odd set $S subset.neq V$, form $G_1$ by retaining $S$ and contracting $overline(S) = V \\ S$ to a new vertex, discarding edges internal to $overline(S)$. Form $G_2$ by interchanging the two sides. Every edge of $C = delta \( S \)$ keeps its original label in both graphs; edges that become parallel are not identified. We call the cut #emph[nontrivial] when both sides have at least three vertices. In that case the contracted graphs have smaller even orders.

#thm([Lemma 2.1.])[
  (Gluing across an odd cut).  #emph[ Suppose $y_i in P \( G_i \)$, for $i = 1 \, 2$, and their coordinates agree on $C$. There is a point $y in P \( G \)$ with the internal coordinates of the two $y_i$ and their common crossing coordinates.]
] <geom:lem-gluing>

#proof[
  Choose a matching law of mean $y_i$ in each contracted graph. A matching uses exactly one edge at the contracted vertex, so the common coordinates $q_e = \( y_1 \)_e = \( y_2 \)_e$, $e in C$, sum to one. Choose a label $e$ with these probabilities, then draw the two matchings independently from their respective laws conditioned on using $e$. A label with $q_e = 0$ is never chosen and needs no conditional law.
  Remove the contracted vertices and replace the two copies of the chosen crossing edge by its original edge. The internal matchings and this edge cover every original vertex once. The crossing marginals are $q_e$, and the law of total probability preserves every internal marginal. The resulting matching law therefore has mean $y$. ◻
]

The following is the perfect-matching form of Edmonds’ theorem #cite(label("Edmonds1965")) Section 2, Theorem (P). We include the proof for loopless multigraphs, with edge labels retained through contractions.

#thm([Theorem 2.2.])[
  (Perfect matching polytope).  #emph[For every graph $G$ as above, 
#[#set math.equation(numbering: n => "(3)")
 $ P \( G \) = {x in bb(R)^E : x_e & gt.eq 0 &  & \( e in E \) \,\
x \( delta \( v \) \) & = 1 &  & \( v in V \) \,\
x \( delta \( S \) \) & gt.eq 1 &  & \( S subset.eq V \, med \| S \| upright(" odd") \)} . $ <geom:eq-polytope>]

]
] <geom:thm-polytope>

#proof[
  Denote the set on the right by $Q$. Every perfect matching has unit degrees and crosses every odd cut, so $P \( G \) subset.eq Q$. The degree equation at either endpoint of an edge gives $0 lt.eq x_e lt.eq 1$ for every $x in Q$. Thus $Q$ is bounded. If it is empty there is nothing to prove.
  We use the elementary fact that a nonempty bounded polytope is the convex hull of its extreme points. Indeed, unless a point is extreme, there is a nonzero direction annihilating all its active constraint rows. The feasible interval in this direction has two endpoints, and the point is a convex combination of them. Each endpoint has a new independent active row: the new row has nonzero directional change, whereas every old active row annihilates the direction. Repeating within the resulting lower-dimensional faces terminates at extreme points.
  We show that the extreme points of $Q$ belong to $P \( G \)$, by induction on the even order. The assertion for order zero is immediate. At order two, $Q$ is the simplex ${ x gt.eq 0 : sum_(e in E) x_e = 1 }$ on the distinguished parallel edges, which is exactly their matching polytope and is empty if there is no edge.
  Now let $\| V \| gt.eq 4$, and let $x$ be an extreme point of $Q$. Suppose that an odd set $S$ with $3 lt.eq \| S \| lt.eq \| V \| - 3$ has $x \( delta \( S \) \) = 1$. Put $C = delta \( S \)$, use the two contracted graphs defined above, and let $x_i$ be the restriction of $x$ to the surviving edge labels of $G_i$.
  Both contracted graphs have smaller even order. The degree equations at retained vertices are unchanged, and the degree sum at the new vertex is $x \( C \) = 1$. To check an odd-cut inequality in a contracted graph, complement its side if necessary so that it excludes the new vertex. The complement remains odd because that graph has even order. Its cut then has exactly the same edge labels and sum as the cut of the corresponding odd set of original vertices. Thus each $x_i$ satisfies the smaller system in Equation (3). By induction, it is the mean of a law on perfect matchings of $G_i$.
  Their crossing coordinates agree, so Lemma 3 gives $x in P \( G \)$.
  It remains to consider an extreme point at which every such nontrivial odd cut is slack. A nonzero vector supported on the positive coordinates of $x$ and preserving all degree equations would allow sufficiently small feasible perturbations in both signs: the positive coordinates stay positive, all nontrivial odd cuts retain positive slack, and singleton cuts and their complements are controlled by the degree equations. Therefore the columns of the unsigned vertex-edge incidence matrix on the positive edges are linearly independent.
  Consider a connected component of the positive-edge graph. There are no isolated vertices, by the degree equations. A vertex incident to only one positive edge forces that edge to have value one; its other endpoint then has no other positive incident edge. These vertices therefore occur in isolated edge components. Every remaining component has minimum degree at least two. Column independence implies that its number of edges is at most its number of vertices. Counting incidences forces equality and degree two at every vertex, so the component is a cycle, possibly a two-edge parallel cycle. An even cycle gives a nonzero alternating-sign dependence among the incidence columns. An odd cycle component has cut sum zero on its odd vertex set, contrary to feasibility. Thus only isolated weight-one edge components remain, and $x$ is a perfect matching vector. This completes the induction. ◻
]

=== 2.2 Directions in the minimal face <directions-in-the-minimal-face>

For $x in P \( G \)$, define

$ T \( x \) = { h in bb(R)^E : x + t h in P \( G \) upright(" for all sufficiently small ") \| t \| } . $

Let $F_x$ be the face obtained by keeping equality in every inequality of Equation (3) that is tight at $x$. Define

$ cal(A)_x = { a \( M \) : M in cal(M) \( G \) \, med a \( M \) in F_x } . $

The next lemma identifies $T \( x \)$ as a linear space and explains why this face is the one relevant to laws with mean $x$.

#thm([Lemma 2.3.])[
  (Minimal face and its directions).  #emph[For every $x in P \( G \)$, the space $T \( x \)$ consists exactly of the vectors satisfying 
#[#set math.equation(numbering: n => "(4)")
 $ h_e & = 0 &  & upright("if ") x_e = 0 \,\
h \( delta \( v \) \) & = 0 &  & \( v in V \) \,\
h \( delta \( S \) \) & = 0 &  & upright("if ") \| S \| upright(" is odd and ") x \( delta \( S \) \) = 1 . $ <geom:eq-directions>]

 Moreover, $F_x$ is the minimal face containing $x$, and 
#[#set math.equation(numbering: n => "(5)")
 $ "aff" F_x = x + T \( x \) \, #h(2em) F_x = "conv" cal(A)_x \, #h(2em) T \( x \) = "span" { a - x : a in cal(A)_x } . $ <geom:eq-face-span>]

 The point $x$ lies in the relative interior of $F_x$, and every law on perfect matching vectors with mean $x$ is supported on $cal(A)_x$.]
] <geom:lem-face>

#proof[
  Feasibility in both signs forces every active constraint row to annihilate the direction. Conversely, the equations in Equation (4) preserve all active constraints, and sufficiently small perturbations in both signs preserve every inactive inequality, since there are finitely many and each has positive slack. This proves the direction characterization.
  The same argument gives a relative neighborhood of $x$ in $x + T \( x \)$ contained in $F_x$. Explicitly, for each inactive inequality $b_i dot.op y gt.eq c_i$ with nonzero normal, choose a radius smaller than its slack at $x$ divided by $2 parallel b_i parallel_2$, and take the minimum of these finitely many positive radii. If no such row exists, any positive radius suffices. All active rows stay equalities on $x + T \( x \)$, and zero-normal rows are constant. Since $F_x subset.eq x + T \( x \)$, this proves its affine hull and relative interiority.
  For any $y in F_x$, a short extension from $y$ through $x$ remains in this relative neighborhood. Thus $x$ lies in the relative interior of a segment in $F_x$ having $y$ as an endpoint. Every face containing $x$ must contain $y$, proving minimality.
  Finally, express a point of $F_x$ as a convex combination of matching vectors. Each inequality defining $F_x$ has nonnegative slack at every vector and zero average slack. Every positive-weight vector must therefore belong to $F_x$. This proves the convex-hull and support assertions. Taking the direction space of this affine hull gives the final equality in Equation (5). ◻
]

Write $d \( x \) = dim F_x = dim T \( x \)$. For a point whose coordinates are all positive, let

$ cal(S)_x = { S subset.eq V : \| S \| upright(" is odd") \, med x \( delta \( S \) \) = 1 } . $

There are no active nonnegativity constraints, and the degree rows are already the cut rows of singletons. Lemma 5 therefore gives the exact identity

#[#set math.equation(numbering: n => "(6)")
 $ \| E \| - d \( x \) = dim "span" { chi_S : S in cal(S)_x } . $ <geom:eq-rank>]

We now bound the rank on the right.

=== 2.3 Sharp codimension from compatible directions <sharp-codimension-from-compatible-directions>

The gluing lemma controls dimensions as well as feasible means. Directions in the two contracted faces can be glued whenever their cut coordinates agree. Their cut-coordinate sums are already zero, so this agreement imposes at most $\| C \| - 1$ independent conditions.

#thm([Proposition 2.4.])[
  (Codimension on positive coordinates).  #emph[Let $\| V \| = 2 m gt.eq 2$, and suppose $x in P \( G \)$ has $x_e > 0$ for every edge. Then 
#[#set math.equation(numbering: n => "(7)")
 $ \| E \| - d \( x \) lt.eq 3 m - 2 . $ <geom:eq-codimension>]

]
] <geom:prop-rank>

#proof[
  We induct on the even order $n = 2 m$. At order two, the polytope is the simplex on the distinguished parallel edges. A positive point has dimension $\| E \| - 1$, giving codimension one as required.
  Let $n gt.eq 4$. If no nontrivial odd cut is tight, positivity and Lemma 5 show that only the $n$ degree equations restrict $T \( x \)$. Thus $\| E \| - d \( x \) lt.eq n lt.eq 3 n \/ 2 - 2$. Otherwise choose a tight nontrivial cut $C = delta \( S \)$, and let $x_i$ be the restricted means in the two contracted graphs $G_i$. The feasibility argument in Theorem 4 gives $x_i in P \( G_i \)$, and every retained coordinate is positive. Put
  $ n_i = \| V \( G_i \) \| \, #h(2em) s_i = \| E \( G_i \) \| \, #h(2em) d_i = dim T \( x_i \) . $
  Each crossing label appears in both graphs, whereas each internal label appears in one. Consequently
  #[#set math.equation(numbering: n => "(8)")
   $ n_1 + n_2 = n + 2 \, #h(2em) s_1 + s_2 = \| E \| + \| C \| \, #h(2em) 4 lt.eq n_i < n . $ <geom:eq-contraction-sizes>]
  Consider the space of compatible directions
  $ W = { \( h_1 \, h_2 \) in T \( x_1 \) xor T \( x_2 \) : \( h_1 \)_e = \( h_2 \)_e upright(" for ") e in C } . $
  Each $h_i$ preserves the degree at its contracted vertex, so $sum_(e in C) \( h_i \)_e = 0$. The linear map $\( h_1 \, h_2 \) mapsto h_1 \|_C - h_2 \|_C$ therefore takes values in
  $ { z in bb(R)^C : sum_(e in C) z_e = 0 } . $
  Since $x \( C \) = 1$, the set $C$ is nonempty and this target has dimension $\| C \| - 1$. Its kernel is $W$, whence
  $ dim W gt.eq d_1 + d_2 - \| C \| + 1 . $
  Map $\( h_1 \, h_2 \) in W$ to the vector $h$ on the original edges with their internal coordinates and common crossing coordinates. This map is injective: restricting $h$ recovers both $h_i$. For any such pair, choose $epsilon > 0$ so that $x_i + t h_i in P \( G_i \)$ for both $i$ and every $\| t \| < epsilon$. Their crossing coordinates agree for each $t$, so Lemma 3 yields $x + t h in P \( G \)$. Thus $h in T \( x \)$ and $d \( x \) gt.eq dim W$. In particular every parent cut tight at $x$ is preserved, including cuts crossing $S$, because both signs of the perturbation are feasible.
  Using Equation (8) and induction gives
  $ \| E \| - d \( x \) & lt.eq \( s_1 - d_1 \) + \( s_2 - d_2 \) - 1\
 & lt.eq \( 3 n_1 \/ 2 - 2 \) + \( 3 n_2 \/ 2 - 2 \) - 1 = 3 n \/ 2 - 2 . $
  The saving of one compatibility condition is exactly what closes this recurrence at the stated constant. ◻
]

No connectedness assumption or strict upper bound $x_e < 1$ was used. Section 5 constructs positive means attaining this codimension at every positive even order.

For an arbitrary mean $x in P \( G \)$ on $2 m gt.eq 2$ vertices, deleting just its zero-coordinate edges leaves the same vertex set and identifies the supported minimal face with the minimal face in the resulting positive-edge graph. Indeed, every law at $x$ omits those edges, and coordinate restriction and zero extension are inverse on the corresponding face. Hence the supported form of the estimate is

#[#set math.equation(numbering: n => "(9)")
 $ \| "supp" x \| - d \( x \) lt.eq 3 m - 2 . $ <geom:eq-supported-rank>]

The next reduction additionally removes coordinates equal to one.

=== 2.4 Removing fixed coordinates <removing-fixed-coordinates>

We finally transfer the rank estimate to an arbitrary polytope point. This reduction will also allow entropy comparisons to be made entirely on the fractional coordinates. For $x in P \( G \)$, set

$ E_f \( x \) = { e in E : 0 < x_e < 1 } \, #h(2em) V_f \( x \) = { v in V : v upright(" meets an edge of ") E_f \( x \) } . $

#thm([Lemma 2.5.])[
  (Fractional coordinates and the minimal face).  #emph[Let $x in P \( G \)$. The number of vertices in $V_f \( x \)$ is even; write $\| V_f \( x \) \| = 2 m_f$. Let $G_f = \( V_f \( x \) \, E_f \( x \) \)$ and $macron(x) = x \|_(E_f \( x \))$. The coordinate extension 
#[#set math.equation(numbering: n => "(10)")
 $ iota \( z \)_e = cases(delim: "{", z_e \, & e in E_f \( x \) \,, x_e \, & e in.not E_f \( x \)) $ <geom:eq-extension>]

 is an affine isomorphism from $P \( G_f \)$ onto the face 
$ Q_x = { y in P \( G \) : y_e = x_e upright(" for ") e in.not E_f \( x \) } . $

 It sends the minimal face of $macron(x)$ onto $F_x$. For every $z in P \( G_f \)$, removing the fixed edges gives a bijection between laws with mean $iota \( z \)$ and laws on perfect matchings of $G_f$ with mean $z$, preserving their probabilities. Moreover, 
#[#set math.equation(numbering: n => "(11)")
 $ sum_(e in E_f \( x \)) x_e = m_f \, #h(2em) d \( x \) gt.eq \| E_f \( x \) \| - 3 m_f + 2 quad upright("if ") m_f gt.eq 1 . $ <geom:eq-fractional-rank>]

 If $m_f = 0$, then $x$ is a matching vector and $d \( x \) = 0$.]
] <geom:lem-reduction>

#proof[
  An edge with coordinate one exhausts the degree sum at both endpoints, so neither endpoint meets a fractional edge. At a vertex outside $V_f \( x \)$, all incident coordinates are zero or one and sum to one; exactly one incident edge therefore has coordinate one. These fixed edges form a perfect matching of $V \\ V_f \( x \)$, so $\| V_f \( x \) \|$ is even.
  Every law of mean $x$ uses each value-one edge and omits each value-zero edge with probability one. Deleting the fixed edges gives a perfect matching law on $G_f$ with mean $macron(x)$, proving $macron(x) in P \( G_f \)$. Conversely, adjoining the fixed edges to any perfect matching of $G_f$ gives a perfect matching of $G$.
  The inequalities $0 lt.eq y_e lt.eq 1$ hold throughout $P \( G \)$, so requiring any of these coordinates to equal zero or one defines a face; their intersection $Q_x$ is a face containing $x$. The preceding matching extension shows $iota \( P \( G_f \) \) subset.eq Q_x$. For the reverse inclusion, express any point of $Q_x$ as a law on perfect matchings. Its fixed zero and one marginals force every positive-probability matching to omit the zero edges and contain the fixed edges. Removing those edges leaves a perfect matching of $G_f$. This proves both equality of the image with $Q_x$ and the stated bijection of laws for every mean. Coordinate restriction is the affine inverse of $iota$.
  An affine isomorphism preserves faces and their relative interiors. The image of the minimal face at $macron(x)$ is thus a face of $Q_x$, and hence of $P \( G \)$, containing $x$ in its relative interior. By Lemma 5, it is exactly $F_x$. In particular, their dimensions are equal. One can also see this directly on directions: a two-sided direction at $x$ vanishes on every fixed zero or one coordinate, and its restriction to $E_f \( x \)$ is a two-sided direction at $macron(x)$; extension gives the inverse correspondence.
  If $m_f gt.eq 1$, every coordinate of $macron(x)$ is positive, and Proposition 6 applied to $G_f$ gives
  $ d \( x \) = dim F_(macron(x)) gt.eq \| E_f \( x \) \| - 3 m_f + 2 . $
  If $m_f = 0$, all coordinates of $x$ are integral, and the degree equations identify $x$ as a single matching vector. Finally, at every vertex of $V_f \( x \)$ the fractional incident coordinates sum to one. Summing those degree equations counts each fractional edge twice and gives $sum_(e in E_f \( x \)) x_e = m_f$. ◻
]

== 3 Entropy and the covariance trace <sec:entropy>

We now turn the geometric rank estimate into the lower bound of Theorem 1. The entropy maximizer has a smooth exponential parameterization on each minimal face. At a hypothetical positive maximum of the entropy deficit, the second derivative along those parameters bounds the face dimension by a covariance trace. The rank estimate makes that trace too small. Boundary points require a separate reduction before taking derivatives.

=== 3.1 Continuity and maximum entropy on a face <continuity-and-maximum-entropy-on-a-face>

For probability laws $p$ and $q$ on the same finite set, write $"Ent" \( p \) = - sum_a p_a log p_a$. We will use the elementary comparison

#[#set math.equation(numbering: n => "(12)")
 $ "Ent" \( p \) lt.eq - sum_(a : p_a > 0) p_a log q_a $ <ent:comparison>]

whenever $q_a > 0$ on the support of $p$; equality holds exactly when $p = q$. Indeed, $log t lt.eq t - 1$ gives $sum_(p_a > 0) p_a log \( q_a \/ p_a \) lt.eq sum_(p_a > 0) q_a - 1 lt.eq 0$, with the asserted equality condition. This also proves $"Ent" \( p \) lt.eq log N$ for a law on $N$ atoms, by comparison with the uniform law.

#thm([Lemma 3.1.])[
  (Continuity at the boundary).  #emph[For a nonempty perfect-matching polytope $P \( G \)$, the maximum mean entropy $H$ is attained, nonnegative, concave and continuous on the whole polytope.]
] <ent:continuity>

#proof[
  The laws of a prescribed mean form a nonempty closed subset of the finite probability simplex. Compactness and continuity of entropy give attainment. Mixing maximizing laws proves concavity, and entropy is nonnegative.
  For upper semicontinuity at $x$, let $y_j arrow.r x$ in $P \( G \)$ and choose maximizing laws at $y_j$. Take a subsequence realizing the upper limit of their entropies and then a convergent subsequence of laws. Its limit has mean $x$, so continuity of entropy on the simplex gives $limsup_j H \( y_j \) lt.eq H \( x \)$.
  For lower semicontinuity, take $y eq.not x$ close to $x$ in $P \( G \)$ and put $t = sqrt(parallel y - x parallel_2)$ and $z = x + \( y - x \) \/ t$. For sufficiently close $y$, we have $0 < t < 1$ and $z in P \( G \)$. To check the latter assertion, use the finite linear description of the polytope. Equalities are preserved; an inequality tight at $x$ is preserved because its slack at $z$ is its slack at $y$ divided by $t$; and every inactive inequality stays satisfied since $z arrow.r x$. There are only finitely many inactive inequalities. Since $y = \( 1 - t \) x + t z$, concavity and nonnegativity give $H \( y \) gt.eq \( 1 - t \) H \( x \)$. Letting $y arrow.r x$ proves the reverse semicontinuity. ◻
]

Let $cal(A)$ be the set of matching incidence vectors, let $F_x$ be the minimal face containing $x$, and put $cal(A)_x = cal(A) ∩ F_x$. The next lemma is the finite maximum-entropy principle on that face. The exponential representation is the standard finite maximum-entropy duality; compare Singh and Vishnoi #cite(label("SinghVishnoi2014")) full version, Definition 2.1 and Lemma 2.3. Jaynes #cite(label("Jaynes1957")) gives the historical maximum-entropy principle, and the covariance identities are standard in exponential-family theory #cite(label("WainwrightJordan2008")) Proposition 3.1. We work on the minimal face so that the relative-interior condition holds, and include the support and boundary arguments needed here.

#thm([Lemma 3.2.])[
  (Exponential laws on the minimal face).  #emph[Every law with mean $x in P \( G \)$ is supported on $cal(A)_x$. Its entropy maximizer is positive on every atom of $cal(A)_x$ and has the form 
#[#set math.equation(numbering: n => "(13)")
 $ p_a = frac(e^(theta dot.op a), sum_(b in cal(A)_x) e^(theta dot.op b)) quad \( a in cal(A)_x \) $ <ent:gibbs>]

 for a finite vector $theta in bb(R)^E$. For every $eta in bb(R)^E$, the law obtained by replacing $theta$ by $eta$ maximizes entropy at its own mean, and that mean has minimal face $F_x$.]
] <ent:exponential>

#proof[
  The active inequalities defining $F_x$ have nonnegative slack at each matching vector. Their expected slack is zero at $x$, so every positive-probability atom belongs to $F_x$. The geometric description also shows that $F_x = "conv" cal(A)_x$ and that $x$ is relatively interior to it.
  Let $b$ be the barycenter of $cal(A)_x$. For sufficiently small $epsilon > 0$, the point $\( x - epsilon b \) \/ \( 1 - epsilon \)$ belongs to $F_x$. Represent it by a law on $cal(A)_x$ and mix in weight $epsilon$ of the uniform law. This produces a law $q$ of mean $x$ positive on every face atom. If a maximizing law $p$ vanished on a nonempty set $Z subset.eq cal(A)_x$, then
  $ "Ent" \( \( 1 - u \) p + u q \) - "Ent" \( p \) = u log \( 1 \/ u \) sum_(a in Z) q_a + O \( u \) > 0 $
  for sufficiently small $u > 0$. The summands outside $Z$ are differentiable at $p_a > 0$, which justifies the $O \( u \)$ term. Thus $p$ is positive.
  Form the matrix with columns $\( 1 \, a \)$, indexed by $a in cal(A)_x$. All sufficiently small perturbations of $p$ in its kernel preserve positivity, mass and mean. The entropy gradient $\( - 1 - log p_a \)_a$ therefore lies in the row space. Because the constant row is present, $log p_a = c + theta dot.op a$ for finite real coefficients; normalization gives Equation (13). No independence of the constraint rows is required.
  For a law of the displayed form with parameter $eta$, all face atoms have positive probability. An inequality is tight at its mean $y$ exactly when it is tight at every atom of $cal(A)_x$, equivalently when it is tight at $x$. Hence $F_y = F_x$, and every law $q'$ of mean $y$ is supported on $cal(A)_x$. Equation (12) gives
  $ "Ent" \( q' \) lt.eq log sum_(a in cal(A)_x) e^(eta dot.op a) - eta dot.op y \, $
  with equality for the exponential law itself. This proves maximality. ◻
]

=== 3.2 The trace obstruction <the-trace-obstruction>

For a real number $c$, define $J_c = F - c B$. The following lemma isolates the analytic consequence of a maximum; it does not yet choose $c$.

#thm([Lemma 3.3.])[
  (Second variation at a fractional maximum).  #emph[Let $G$ have $2 m gt.eq 2$ vertices, and suppose that $x in P \( G \)$ has $0 < x_e < 1$ for every edge. If $J_c - H$ has a local maximum at $x$, then, with $d = dim F_x$ and $s = \| E \|$, 
#[#set math.equation(numbering: n => "(14)")
 $ 0 gt.eq d - s + \( c + 1 \) m . $ <ent:trace-obstruction>]

]
] <ent:trace>

#proof[
  Let $p$ and $theta$ be supplied by Lemma 9, and write $T = "span" \( F_x - x \)$. For $v in bb(R)^E$ and real $t$, set
  $ Phi \( t \) = log sum_(a in cal(A)_x) e^(\( theta + t v \) dot.op a) \, #h(2em) p_a \( t \) = e^(\( theta + t v \) dot.op a - Phi \( t \)) \, #h(2em) y \( t \) = sum_a p_a \( t \) a . $
  The lemma gives $F_(y \( t \)) = F_x$ and
  #[#set math.equation(numbering: n => "(15)")
   $ H \( y \( t \) \) = Phi \( t \) - \( theta + t v \) dot.op y \( t \) . $ <ent:tilt-entropy>]
  All sums are finite, so these curves are smooth. Every coordinate of $y \( t \)$ remains strictly between zero and one, since both coordinate values occur among the positive-probability face atoms.
  Define the covariance matrix
  $ K = sum_(a in cal(A)_x) p_a \( a - x \) \( a - x \)^(sans(T)) . $
  Differentiation gives $p'_a \( 0 \) = p_a v dot.op \( a - x \)$ and $y' \( 0 \) = K v$. For every $w$, we have $w^(sans(T)) K w = sum_a p_a \( w dot.op \( a - x \) \)^2$. Positivity of $p$ and the spanning of $T$ by $a - x$ therefore give
  #[#set math.equation(numbering: n => "(16)")
   $ ker K = T^perp \, #h(2em) "im" K = T \, #h(2em) "rank" K = d . $ <ent:covariance-range>]
  Also $y'' \( 0 \) in T$, since the curve stays in $x + T$.
  Let $g = nabla J_c \( x \)$ and let $D$ be its diagonal Hessian:
  $ g_e = - log x_e - c log \( 1 - x_e \) - \( c + 1 \) \, #h(2em) D_(e e) = - 1 / x_e + frac(c, 1 - x_e) . $
  Since $Phi' \( t \) = v dot.op y \( t \)$, Equation (15) gives $frac(d, d t) H \( y \( t \) \) = - \( theta + t v \) dot.op y' \( t \)$. For $r \( t \) = J_c \( y \( t \) \) - H \( y \( t \) \)$, the first two derivatives at zero are
  $ r' \( 0 \) & = \( g + theta \) dot.op K v \,\
r'' \( 0 \) & = \( K v \)^(sans(T)) D \( K v \) + v^(sans(T)) K v + \( g + theta \) dot.op y'' \( 0 \) . $
  Stationarity gives $r' \( 0 \) = 0$ for every $v$. Since $"im" K = T$ and $y'' \( 0 \) in T$, the last term in $r'' \( 0 \)$ vanishes. The second derivative test is therefore
  #[#set math.equation(numbering: n => "(17)")
   $ 0 gt.eq \( K v \)^(sans(T)) D \( K v \) + v^(sans(T)) K v #h(2em) \( v in bb(R)^E \) . $ <ent:second-variation>]
  This cancellation is why differentiating within the minimal face suffices; no smoothness of $H$ across different faces has been assumed.
  Take orthonormal eigenvectors $u_1 \, dots.h \, u_d$ of $K$ with positive eigenvalues $lambda_1 \, dots.h \, lambda_d$. Substituting $v = u_i$ in Equation (17), dividing by $lambda_i$, and summing gives
  $ 0 gt.eq d + sum_i lambda_i u_i^(sans(T)) D u_i = d + "tr" \( K D \) . $
  Only the spectral decomposition of $K$ is used; $K$ and $D$ need not commute. If $d = 0$, this same statement is the empty sum identity. Each coordinate is Boolean, so $K_(e e) = x_e \( 1 - x_e \)$. Using $sum_e x_e = m$, we obtain
  $ "tr" \( K D \) = sum_e #scale(x: 120%, y: 120%)[\[] - \( 1 - x_e \) + c x_e #scale(x: 120%, y: 120%)[\]] = - s + \( c + 1 \) m \, $
  which proves Equation (14). ◻
]

#proof[
  #emph[Lower bound in Theorem 1.] Write the original vertex count as $2 M gt.eq 2$, and fix $c = 2 - 2 \/ M + epsilon$ with $epsilon > 0$. By Lemma 8, $J_c - H$ attains a maximum on $P \( G \)$. Suppose that this maximum is positive, at $x$. Delete its zero edges and the endpoints of its value-one edges. The exact fractional reduction in Lemma 7 identifies all laws of mean $x$ with laws of the reduced mean and preserves $F \, B \, H$. An empty reduction would give $F = B = H = 0$, contrary to positivity. The reduced graph therefore has $2 m$ vertices for some $1 lt.eq m lt.eq M$, and all retained coordinates are strictly fractional.
  Every feasible mean in the reduced graph extends by the fixed matching edges to a feasible original mean, preserving the same three functions. The reduced mean consequently remains a global maximum of $J_c - H$. The geometric rank bound gives $d gt.eq s - 3 m + 2$, whereas Lemma 10 gives
  $ 0 gt.eq d - s + \( c + 1 \) m gt.eq 2 + \( c - 2 \) m = 2 (1 - m / M) + epsilon m > 0 . $
  This contradiction proves $H gt.eq F - c B$ for every $epsilon > 0$. For each fixed mean, $B$ is finite; letting $epsilon arrow.b 0$ proves $H gt.eq F - \( 2 - 2 \/ M \) B$. The strict coefficient followed by this limit is essential: the displayed geometric comparison can be an equality when $m = M$ and $epsilon = 0$. ◻
]

=== 3.3 The upper bound and componentwise refinement <the-upper-bound-and-componentwise-refinement>

The upper bound is the vertex-star instance of Shearer’s entropy inequality #cite(label("ChungGrahamFranklShearer1986")) Section V, inequality (22). We give the short chain-rule proof to make the counting of parallel edge coordinates explicit.

#proof[
  #emph[Upper bound in Theorem 1.] Let $X = \( X_e \)_(e in E)$ be the incidence vector of any matching law with mean $x$, and order $E$. For a vertex $v$, the chain rule gives
  $ "Ent" \( X_(delta \( v \)) \) = sum_(e in delta \( v \)) "Ent" #scale(x: 120%, y: 120%)[\(] X_e divides X_f : f in delta \( v \) \, med f < e #scale(x: 120%, y: 120%)[\)] gt.eq sum_(e in delta \( v \)) "Ent" #scale(x: 120%, y: 120%)[\(] X_e divides X_f : f < e #scale(x: 120%, y: 120%)[\)] . $
  Conditioning on additional finite random variables decreases conditional entropy, by concavity of entropy applied to the conditional laws. Every edge, including every labelled parallel edge, belongs to exactly two vertex stars. Summing and applying the chain rule again therefore gives $sum_v "Ent" \( X_(delta \( v \)) \) gt.eq 2 "Ent" \( X \)$. At a vertex the star vector makes exactly one choice, with probabilities $\( x_e \)_(e in delta \( v \))$, so
  $ "Ent" \( X \) lt.eq 1 / 2 sum_v [- sum_(e in delta \( v \)) x_e log x_e] = F \( x \) . $
  Taking the maximum over laws proves the upper bound, including fixed coordinates and disconnected graphs. ◻
]

#thm([Corollary 3.4.])[
  (Fractional components).  #emph[For $x in P \( G \)$, remove its zero edges and the endpoints of its value-one edges. Let the nonempty connected components of the remaining graph have $2 m_i$ vertices, and let $B_i$ denote the sum defining $B$ on component $i$. Then 
$ F \( x \) - sum_i \( 2 - 2 \/ m_i \) B_i \( x \) lt.eq H \( x \) lt.eq F \( x \) . $

 If there are no remaining components, $F \( x \) = B \( x \) = H \( x \) = 0$.]
] <ent:components>

#proof[
  The exact reduction preserves the functions. Every residual component has a perfect matching, hence even positive order. A law of a whole matching induces matching laws on the components, whose entropies sum to at least the joint entropy. Conversely, the independent product of component maximizing laws realizes the prescribed mean and the sum of their entropies. Thus $H$, like $F$ and $B$, is additive at these fixed component means. Apply Theorem 1 separately to each component. ◻
]

== 4 Entropy and counting consequences <cons:section>

The pointwise entropy bound has two kinds of counting consequences. Maximizing a separable entropy objective estimates the total matching count, while evaluating it at a feasible uniform mean gives lower counts from structural hypotheses. Throughout this section, unless an empty graph is explicitly mentioned, $G$ is a finite loopless multigraph on $2 m > 0$ vertices with at least one perfect matching. Parallel edges retain their individual labels. Write $P = P \( G \)$, $N = \| cal(M) \( G \) \|$, and recall that $F$, $B$, and $H$ use natural logarithms. For every $x in P$, Theorem 1 gives

#[#set math.equation(numbering: n => "(18)")
 $ F \( x \) - (2 - 2 / m) B \( x \) lt.eq H \( x \) lt.eq F \( x \) . $ <cons:input>]

The elementary scalar estimate

#[#set math.equation(numbering: n => "(19)")
 $ 0 lt.eq - \( 1 - u \) ln \( 1 - u \) lt.eq u #h(2em) \( 0 lt.eq u lt.eq 1 \) $ <cons:complement>]

will be used repeatedly. Indeed, $u + \( 1 - u \) ln \( 1 - u \)$ vanishes at zero and has derivative $- ln \( 1 - u \) gt.eq 0$ on $\[ 0 \, 1 \)$; continuity gives the endpoint. Every perfect matching has $m$ edges, so $sum_e x_e = m$ and

#[#set math.equation(numbering: n => "(20)")
 $ 0 lt.eq B \( x \) lt.eq m . $ <cons:B-bound>]

=== 4.1 Entropy defects and separable counting estimates <entropy-defects-and-separable-counting-estimates>

#thm([Corollary 4.1.])[
  (Entropy-dependent defect).  #emph[For every $x in P$, 
#[#set math.equation(numbering: n => "(21)")
 $ 0 lt.eq F \( x \) - H \( x \) lt.eq min { F \( x \) \, thin 2 m - 2 } . $ <cons:defect-bound>]

]
] <cons:defect>

#proof[
  The first inequality follows from $H lt.eq F$. Nonnegativity of entropy gives $F - H lt.eq F$, while Equations (18) and (20) give $F - H lt.eq \( 2 - 2 \/ m \) B lt.eq 2 m - 2$. This includes $m = 1$, when the defect is zero. ◻
]

Define the binary-coordinate entropy by

$ H_(upright("bin")) \( x \) = sum_e \[ - x_e ln x_e - \( 1 - x_e \) ln \( 1 - x_e \) \] = F \( x \) + B \( x \) . $

The word “binary” refers to an edge indicator’s two values; these entropies are still measured with natural logarithms.

#thm([Corollary 4.2.])[
  (Separable estimates of the matching count).  #emph[One has 
#[#set math.equation(numbering: n => "(22)")
 $ ln N & lt.eq max_(x in P) F \( x \) lt.eq ln N + 2 m - 2 \,\
ln N & lt.eq max_(x in P) H_(upright("bin")) \( x \) lt.eq ln N + 3 m - 2 . $ <cons:F-count>]

]
] <cons:entropy-count>

#proof[
  The entropy comparison in Equation (12), applied to the uniform law, gives entropy at most $ln N$ for every law on $N$ outcomes, with equality for the uniform law. At the mean $macron(x)$ of the uniform matching law we therefore have $H \( macron(x) \) = ln N$. Equation (18) gives $ln N lt.eq F \( macron(x) \) lt.eq H_(upright("bin")) \( macron(x) \)$, proving both lower estimates. Corollary 12 gives $F \( x \) lt.eq H \( x \) + 2 m - 2 lt.eq ln N + 2 m - 2$ at every $x in P$. Also,
  $ H_(upright("bin")) \( x \) - H \( x \) lt.eq (3 - 2 / m) B \( x \) lt.eq 3 m - 2 . $
  Taking maxima proves the upper estimates. The maxima exist because $P$ is compact and both separable functions are continuous. ◻
]

=== 4.2 Uniform marginals and structural lower counts <uniform-marginals-and-structural-lower-counts>

#thm([Theorem 4.3.])[
  (Many edge-disjoint perfect matchings).  #emph[Let $G$ be a finite loopless multigraph on $2 m > 0$ vertices that contains $k gt.eq 1$ pairwise edge-disjoint perfect matchings. If $k = 1$, then $N \( G \) gt.eq 1$. If $k gt.eq 2$, then 
#[#set math.equation(numbering: n => "(23)")
 $ N \( G \) gt.eq k^m \( 1 - 1 \/ k \)^(2 \( m - 1 \) \( k - 1 \)) gt.eq e^(- 2 \( m - 1 \)) k^m gt.eq \( e^(- 2) k \)^m . $ <cons:finite-order-count>]

]
] <cons:structural>

#proof[
  Let $M_1 \, dots.h \, M_k$ be the selected matchings and take their uniform mixture. Its mean
  $ x = 1 / k sum_(i = 1)^k upright(bold(1))_(M_i) in P \( G \) $
  is $1 \/ k$ on their union of $k m$ labeled edges and zero on every other edge. In particular, the hypotheses do not require all ambient edges to belong to that union. We have $F \( x \) = m ln k$. If $k = 1$, the selected matching already gives $N \( G \) gt.eq 1$. For $k gt.eq 2$, direct evaluation yields
  $ B \( x \) = - m \( k - 1 \) ln \( 1 - 1 \/ k \) . $
  Since $H \( x \) lt.eq ln N \( G \)$, Theorem 1 now gives
  $ ln N \( G \) gt.eq m ln k + 2 \( m - 1 \) \( k - 1 \) ln \( 1 - 1 \/ k \) . $
  Exponentiating proves the first inequality in Equation (23). The function $ln \( 1 - u \) + u \/ \( 1 - u \)$ starts at zero and has derivative $u \/ \( 1 - u \)^2 gt.eq 0$ for $0 lt.eq u < 1$. Thus $\( k - 1 \) ln \( 1 - 1 \/ k \) gt.eq - 1$, giving the second inequality; the third uses $m - 1 lt.eq m$. ◻
]

At $m = 1$, the finite-order estimate is simply $N \( G \) gt.eq k$, the exact count on the selected parallel-edge subgraph. We keep $k = 1$ separate to avoid an undefined power at zero.

Only feasibility of the uniform mean enters the preceding proof. It therefore applies to the following class without requiring a partition of its edges into perfect matchings.

#thm([Corollary 4.4.])[
  (Regular graphs with large odd cuts).  #emph[Let $G$ be a finite loopless $k$-regular multigraph on $2 m > 0$ vertices, where $k gt.eq 1$. Suppose $\| delta \( S \) \| gt.eq k$ for every odd vertex set $S$. Then the conclusions of Theorem 14 hold. In particular, they hold for every $\( k - 1 \)$-edge-connected $k$-regular graph of positive even order.]
] <cons:regular>

#proof[
  The vector $x_e = 1 \/ k$ has unit degree sums, and the cut hypothesis gives $x \( delta \( S \) \) gt.eq 1$ for every odd $S$. Theorem 4 implies $x in P \( G \)$; in particular, $G$ has a perfect matching. Since $\| E \| = k m$, the evaluations of $F \( x \)$ and $B \( x \)$ in the preceding proof apply unchanged when $k gt.eq 2$. For $k = 1$, the graph itself is a perfect matching.
  For the final assertion, an odd $S$ is nonempty and proper because $\| V \( G \) \|$ is even. Edge connectivity gives $\| delta \( S \) \| gt.eq k - 1$, while summing degrees in $S$ gives
  $ k \| S \| = 2 \| E \( S \) \| + \| delta \( S \) \| . $
  Consequently $\| delta \( S \) \| equiv k med \( mod med 2 \)$; it cannot equal $k - 1$ and is therefore at least $k$. Parallel edges are counted with multiplicity in this identity. ◻
]

The odd-cut hypothesis is a condition on the uniform vector. Requiring merely that every edge lie in some perfect matching does not assert that condition. At small degree the exponential base in Equation (23) can be below one, so these estimates do not supply the classical cubic exponential lower bound.

The empty graph has one empty perfect matching. Its count is handled directly, without using expressions that divide by $m$; for $k gt.eq 1$, the homogeneous coarse bound $\( e^(- 2) k \)^m$ is interpreted as one. When $k = 0$ and the vertex set is nonempty, the coarse bound is zero, while formulas containing $1 \/ k$ are not asserted. In particular, specifying no selected matchings places no restriction on the ambient edge set.

The weaker separable and nonlinear comparisons and their structural consequences appear with the alternative proofs in Appendix 11. The next section examines sharp face codimension and the obstruction to coefficient one. Section 6 then passes from these entropy estimates to weighted partition functions.

== 5 Triangle expansions and sharp face codimension <ex:sec-triangle-expansions>

Extremal rank examples already occur among the cubic staircases of Abdi et al. #cite(label("AbdiCornuejolsDadushDalirrooyfard2026")) discussion after Corollary 6.6 and Figure 2. They have exactly three perfect matchings meeting every minimum odd cut once, and those cut rows have rank $\| E \| - 2$. We give an explicit triangle-expansion construction and derive the associated prescribed-marginal entropy formulas. This also gives a necessary lower bound on a universal entropy coefficient. The construction underlying Klee graphs is standard; see Cygan, Pilipczuk, and Škrekovski #cite(label("CyganPilipczukSkrekovski2013")) Section 1 and Lemma 2.1 on the triangle expansions and the unique partition into three perfect matchings, up to permutation. We give the construction and the argument needed here. Balanced matching laws on cubic graphs and triangle contractions also occur in the corrected full version of Esperet et al. #cite(label("EsperetEtAl2011")) Claim 3 and Lemma 10. Although an expansion can introduce further perfect matchings, the prescribed uniform edge marginals force a law to remain on three of them.

We retain $P \( G \)$, $a \( M \)$, $F_x$, and $d \( x \) = dim F_x$ from Section 2, and the entropy functions $F \, B \, H$ from Equations (1)–(1). The separable comparison considered below is $H \( x \) gt.eq F \( x \) - c B \( x \)$. All edge labels, including parallel-edge labels, are retained.

=== 5.1 Expansion and contraction <expansion-and-contraction>

Let $v$ be a vertex of degree three in a loopless multigraph $G$ that has a perfect matching, with incident labelled edges $e_i = v u_i$, $1 lt.eq i lt.eq 3$. The vertices $u_i$ need not be distinct. Replace $v$ by a triangle on new vertices $t_1 \, t_2 \, t_3$, reattach $e_i$ to $t_i u_i$, and let $f_i$ denote the triangle edge opposite $t_i$. Call the resulting graph $G'$, and set $T = { t_1 \, t_2 \, t_3 }$. Reattached edges keep their old labels; the $f_i$ receive new labels. Figure 1 shows the local change.

Every perfect matching $M$ of $G$ contains exactly one of $e_1 \, e_2 \, e_3$, say $e_i$. Its unique extension that crosses $delta \( T \)$ once is obtained by retaining its labelled edges and adding $f_i$. Conversely, contracting $T$ in a perfect matching of $G'$ that crosses $delta \( T \)$ once recovers exactly one perfect matching of $G$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.312, 0), (0, 0), stroke: (paint: rgb("#0000bf"), thickness: 1.2pt, miter-limit: 10))
  content((-0.6562, 0), [#text(size: 9pt)[$e_1$]], anchor: "south", padding: 0.1176cm)
  line((0.8925, 0.945), (0, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.4462, 0.4725), [#text(size: 9pt)[$e_2$]], anchor: "south-east", padding: 0.1176cm)
  line((0.8925, -0.945), (0, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.4462, -0.4725), [#text(size: 9pt)[$e_3$]], anchor: "north-east", padding: 0.1176cm)
  circle((0, 0), radius: 0.06985, fill: black, stroke: none)
  content((-0.02495, -0.02495), [$v$], anchor: "north-east")
  circle((-1.312, 0), radius: 0.06985, fill: black, stroke: none)
  content((-1.348, 0), [$u_1$], anchor: "east")
  circle((0.8925, 0.945), radius: 0.06985, fill: black, stroke: none)
  content((0.8925, 0.9803), [$u_2$], anchor: "south")
  circle((0.8925, -0.945), radius: 0.06985, fill: black, stroke: none)
  content((0.8925, -0.9803), [$u_3$], anchor: "north")
  line((1.418, 0), (2.363, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((1.89, 0), [#text(size: 9pt)[expand]], anchor: "south", padding: 0.1176cm)
  line((2.888, 0), (4.2, 0), stroke: (paint: rgb("#0000bf"), thickness: 1.2pt, miter-limit: 10))
  content((3.544, 0), [#text(size: 9pt)[$e_1$]], anchor: "south", padding: 0.1176cm)
  line((6.667, 1.155), (5.46, 0.735), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.064, 0.945), [#text(size: 9pt)[$e_2$]], anchor: "south", padding: 0.1176cm)
  line((6.667, -1.155), (5.46, -0.735), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.064, -0.945), [#text(size: 9pt)[$e_3$]], anchor: "north", padding: 0.1176cm)
  line((4.2, 0), (5.46, 0.735), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.46, 0.735), (4.2, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.2, 0), (5.46, -0.735), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.46, 0.735), (5.46, -0.735), stroke: (paint: rgb("#0000bf"), thickness: 1.2pt, miter-limit: 10))
  content((5.46, 0), [#text(size: 9pt)[$f_1$]], anchor: "west", padding: 0.1176cm)
  circle((4.2, 0), radius: 0.06985, fill: black, stroke: none)
  content((4.175, -0.02495), [$t_1$], anchor: "north-east")
  circle((5.46, 0.735), radius: 0.06985, fill: black, stroke: none)
  content((5.435, 0.7599), [$t_2$], anchor: "south-east")
  circle((5.46, -0.735), radius: 0.06985, fill: black, stroke: none)
  content((5.435, -0.7599), [$t_3$], anchor: "north-east")
  circle((2.888, 0), radius: 0.06985, fill: black, stroke: none)
  content((2.888, -0.03528), [$u_1$], anchor: "north")
  circle((6.667, 1.155), radius: 0.06985, fill: black, stroke: none)
  content((6.667, 1.19), [$u_2$], anchor: "south")
  circle((6.667, -1.155), radius: 0.06985, fill: black, stroke: none)
  content((6.667, -1.19), [$u_3$], anchor: "north")
})],
  caption: [Figure 1: A local triangle expansion. The displayed matching uses $e_1$; its unique extension crossing the triangle cut once adds the opposite edge $f_1$. Thick blue edges are selected. The rest of the graph is unchanged. ],
) <ex:fig-triangle-expansion>

#thm([Lemma 5.1.])[
  (The face of a triangle expansion).  #emph[The set 
$ Q_T = { y in P \( G' \) : y \( delta \( T \) \) = 1 } $

 is a face of $P \( G' \)$ affinely isomorphic to $P \( G \)$. Under this isomorphism an old edge keeps its coordinate and 
$ y_(f_i) = y_(e_i) #h(2em) \( 1 lt.eq i lt.eq 3 \) . $

 If $x in P \( G \)$ has coordinate $1 \/ 3$ on every edge, its image $x'$ has coordinate $1 \/ 3$ on every edge of $G'$. The isomorphism maps the minimal face at $x$ onto the minimal face at $x'$.]
] <ex:lem-expansion-face>

#proof[
  Every perfect matching of $G'$ crosses the odd cut $delta \( T \)$ either once or three times. Hence $y \( delta \( T \) \) gt.eq 1$ is valid on $P \( G' \)$, and its equality set is a face. A convex combination lies in this face exactly when every matching with positive coefficient crosses the cut once. For these matchings the extension and contraction just described are inverse bijections, and the indicator of $f_i$ equals the indicator of $e_i$. They therefore induce the stated affine isomorphism, with inverse given by restriction to the old edge labels.
  The coordinate statement follows directly. Finally, $Q_T$ is a face containing $x'$. The minimal face of $P \( G' \)$ at $x'$ is therefore also the minimal face of $Q_T$ at $x'$; affine isomorphisms preserve minimal faces. ◻
]

=== 5.2 A triangular minimal face for every order <a-triangular-minimal-face-for-every-order>

Begin with two vertices joined by three distinct labelled parallel edges. Its three one-edge perfect matchings partition its edge set. Repeatedly expand any vertex as above. Each expansion adds two vertices and three edges, and all degrees remain three. Denote any graph obtained after $m - 1$ expansions by $G_m$, so that

$ \| V \( G_m \) \| = 2 m \, #h(2em) \| E \( G_m \) \| = 3 m . $

The three initial perfect matchings extend uniquely at each step. Their extensions $M_1 \, M_2 \, M_3$ still partition the edge set: the old edges retain their partition, and $f_i$ belongs to the extension of the matching containing $e_i$. In particular,

$ x^(\( m \)) = 1 / 3 #scale(x: 120%, y: 120%)[\(] a \( M_1 \) + a \( M_2 \) + a \( M_3 \) #scale(x: 120%, y: 120%)[\)] $

has every coordinate equal to $1 \/ 3$ and belongs to the full perfect-matching polytope.

The first expansion gives $K_4$; subsequent expansions preserve simplicity. Thus $G_m$ is simple for every $m gt.eq 2$, and these are Klee graphs. Only the starting case $m = 1$ needs parallel edges.

#thm([Proposition 5.2.])[
  (Sharp codimension and prescribed-marginal entropy).  #emph[For every integer $m gt.eq 1$, the graph $G_m$ and the point $x^(\( m \))$ above satisfy 
$ F_(x^(\( m \))) = "conv" { a \( M_1 \) \, a \( M_2 \) \, a \( M_3 \) } \, #h(2em) d \( x^(\( m \)) \) = 2 . $

 The unique law on perfect matchings with mean $x^(\( m \))$ is the uniform law on $M_1 \, M_2 \, M_3$. Consequently, 
#[#set math.equation(numbering: n => "(24)")
 $ \| E \( G_m \) \| - d \( x^(\( m \)) \) & = 3 m - 2 \,\
H \( x^(\( m \)) \) & = ln 3 \,\
F \( x^(\( m \)) \) & = m ln 3 \,\
B \( x^(\( m \)) \) & = 2 m ln \( 3 \/ 2 \) . $ <ex:eq-klee-values>]

]
] <ex:prop-klee-face>

#proof[
  For $m = 1$, the three matching vectors are the three coordinate vectors in $bb(R)^3$, and $P \( G_1 \)$ is their simplex. Its uniform point is in its relative interior. Repeated application of Lemma 16 shows that the minimal face at $x^(\( m \))$ is the image of this simplex, with vertices $a \( M_1 \) \, a \( M_2 \) \, a \( M_3 \)$. In particular its dimension is two.
  One can also see the restriction on laws directly. For the last inserted triangle, a law with edge marginals $1 \/ 3$ has expected cut-crossing count $3 \( 1 \/ 3 \) = 1$. Since each matching crosses this cut once or three times, it must cross once almost surely. Contraction gives a law on the preceding graph with the same uniform marginals, and the crossing-one extension is unique. Iterating leaves only the three initial matchings. Thus the original law is supported on $M_1 \, M_2 \, M_3$. Since these matchings partition the edges, the marginal of any edge in $M_i$ equals the probability assigned to $M_i$, which must be $1 \/ 3$. This proves uniqueness and the entropy formula.
  There are $3 m$ edges, all with marginal $1 \/ 3$. Substitution in the definitions of $F$ and $B$ gives the remaining formulas. ◻
]

All coordinates here are strictly between zero and one. Equation (24) therefore attains the bound in Proposition 6 for every $m gt.eq 1$. Equivalently, by Equation (6), the tight odd-cut rows have rank $3 m - 2$. The dimension two is the dimension of the minimal face at $x^(\( m \))$; the whole perfect-matching polytope can have additional vertices.

#thm([Corollary 5.3.])[
  (Restriction on a universal entropy coefficient).  #emph[If a constant $c$ satisfies 
$ H \( x \) gt.eq F \( x \) - c B \( x \) $

 for every finite loopless multigraph $G$ and every $x in P \( G \)$, then 
$ c gt.eq frac(ln 3, 2 ln \( 3 \/ 2 \)) . $

 The same necessary bound holds if the assertion is restricted to simple graphs.]
] <ex:cor-coefficient>

#proof[
  Applying the asserted inequality to $G_m \, x^(\( m \))$ gives
  $ c gt.eq frac(\( m - 1 \) ln 3, 2 m ln \( 3 \/ 2 \)) . $
  Let $m$ tend to infinity. The graphs with $m gt.eq 2$ are simple, so the same limit applies under that restriction. ◻
]

The necessary coefficient in Corollary 18 lies strictly between $1$ and the universal coefficient $2$ supplied by Theorem 1. Sharpness of the geometric estimate therefore does not settle the optimal entropy coefficient. The next example makes the failure of coefficient one explicit at a fixed order.

=== 5.3 An eight-vertex obstruction to coefficient one <an-eight-vertex-obstruction-to-coefficient-one>

For a concrete instance, take vertex set ${ 0 \, 1 \, dots.h \, 7 }$ and edge set

$ E = { 01 \, 03 \, 05 \, 14 \, 16 \, 23 \, 24 \, 27 \, 34 \, 56 \, 57 \, 67 } \, $

where $i j$ denotes the undirected edge with endpoints $i \, j$. Contracting the triangles $T = { 2 \, 3 \, 4 }$ and $U = { 5 \, 6 \, 7 }$ gives $K_4$. Thus this graph is obtained by expanding two vertices of $K_4$, and is an instance of $G_4$.

Its five perfect matchings are

$ M_1 & = { 01 \, 27 \, 34 \, 56 } \, & M_2 & = { 03 \, 16 \, 24 \, 57 } \,\
M_3 & = { 05 \, 14 \, 23 \, 67 } \, & N_1 & = { 03 \, 14 \, 27 \, 56 } \,\
 &  & N_2 & = { 05 \, 16 \, 27 \, 34 } . $

This list follows without enumeration software. A matching uses one of $01 \, 03 \, 05$. If it uses $01$, the remaining two odd triangles are joined only by $27$, forcing $M_1$. If it uses $03$, vertex $1$ is matched by $14$ or $16$, after which the remaining edges are forced, giving $N_1$ or $M_2$. If it uses $05$, the same two choices at vertex $1$ force $M_3$ or $N_2$.

The cuts

$ delta \( T \) = { 03 \, 14 \, 27 } \, #h(2em) delta \( U \) = { 05 \, 16 \, 27 } $

both have total marginal one at $x_e = 1 \/ 3$. The matching $N_1$ crosses the first cut three times, and $N_2$ crosses the second cut three times. They therefore have probability zero in every law with those marginals. The remaining three matchings partition $E$, so their probabilities are all $1 \/ 3$. In particular the relevant entropy is $ln 3$, even though the graph has five perfect matchings in total.

At this feasible point of the full polytope,

$ H \( x \) = ln 3 \, #h(2em) F \( x \) - B \( x \) = 4 ln \( 4 \/ 3 \) > ln 3 \, $

because $\( 4 \/ 3 \)^4 = 256 \/ 81 > 3$. The difference $F \( x \) - B \( x \) - H \( x \)$ is $ln \( 256 \/ 243 \) > 0$. This gives a simple eight-vertex counterexample to the coefficient-one lower bound.

== 6 Weighted partition functions <cons:weighted-section>

Let $G$ be a loopless labelled multigraph on $n = 2 m gt.eq 2$ vertices with at least one perfect matching. Write $P = P \( G \)$. We pass from natural-log entropy to binary-log weights, so that the resulting estimate can be used by the rational counting algorithm.

Put

$ h_2 \( x \) = frac(F \( x \), ln 2) = sum_(e in E) - x_e log_2 x_e \, #h(2em) 0 log_2 0 = 0 . $

For $beta in bb(R)^E$, define

#[#set math.equation(numbering: n => "(25)")
 $ Z_beta = sum_(M in cal(M) \( G \)) 2^(beta dot.op upright(bold(1))_M) \, #h(2em) q^(*) = max_(x in P) \[ h_2 \( x \) + beta dot.op x \] . $ <cons:weighted-definitions>]

The maximum exists by continuity on the compact matching polytope.

#thm([Corollary 6.1.])[
  (Weighted counting estimate).  #emph[For every finite real vector $beta$, 
#[#set math.equation(numbering: n => "(26)")
 $ q^(*) - frac(2 m - 2, ln 2) lt.eq log_2 Z_beta lt.eq q^(*) . $ <cons:weighted-bracket>]

]
] <cons:weighted>

#proof[
  Let $p_beta \( M \) = 2^(beta dot.op upright(bold(1))_M) \/ Z_beta$, a positive probability law on the matching family. The finite entropy comparison with this law gives, for any matching law $p$ of mean $x$,
  $ frac(- sum_M p \( M \) ln p \( M \), ln 2) + beta dot.op x lt.eq log_2 Z_beta \, $
  with equality for $p = p_beta$. Indeed, this is the nonnegativity of $sum_(M : p \( M \) > 0) p \( M \) ln \( p \( M \) \/ p_beta \( M \) \)$, which follows from $ln t lt.eq t - 1$. Taking a maximizing law at each mean and then the maximum over means therefore yields
  #[#set math.equation(numbering: n => "(27)")
   $ log_2 Z_beta = max_(x in P) [frac(H \( x \), ln 2) + beta dot.op x] . $ <cons:variational>]
  Corollary 12 says $F \( x \) - \( 2 m - 2 \) lt.eq H \( x \) lt.eq F \( x \)$. Divide by $ln 2$, add $beta dot.op x$, and maximize to obtain Equation (26). ◻
]

The analytical comparison does not itself supply a numerical optimizer. The exact-arithmetic construction in Sections 7–10 uses the following coarser bracket, with fixed constants that leave room for its later rounding and optimization errors.

#thm([Corollary 6.2.])[
  (Conservative weighted bracket).  #emph[For every finite loopless labelled multigraph on an even number $n gt.eq 2$ of vertices with at least one perfect matching, and every finite real vector $beta in bb(R)^E$, 
#[#set math.equation(numbering: n => "(28)")
 $ q^(*) - 4 n lt.eq log_2 Z_beta lt.eq q^(*) + n . $ <d:eq-coarse-weighted>]

]
] <d:coarse-weighted>

#proof[
  With $n = 2 m$, Corollary 19 gives
  $ q^(*) - frac(n - 2, ln 2) lt.eq log_2 Z_beta lt.eq q^(*) . $
  Since $ln 2 = integral_1^2 t^(- 1) thin d t gt.eq 1 \/ 2$, we have $\( n - 2 \) \/ ln 2 lt.eq 2 n - 4 lt.eq 4 n$. Enlarging both sides of this bracket proves the claim. ◻
]

For the empty graph, the matching family consists of the empty matching, $Z_beta = 1$ and $q^(*) = 0$. The counting algorithm handles that input directly. On positive even order it uses exactly Equation (28); all constants in the finite optimization and final estimate below refer to this bracket.

== 7 A rational objective for counting matchings <d:sec-objective>

The weighted entropy estimate reduces counting to a continuous maximum. We now replace that maximum by one computed from exact rational data. Assume throughout this section that $n gt.eq 4$ is even. Let $N$ be the number of perfect matchings in the input graph, with parallel edges counted as distinct choices. We allow the multiplicity $k_e$ of each unordered pair $e in binom(V, 2)$ to be supplied in binary; an absent pair has $k_e = 0$. For a simple graph, every multiplicity is zero or one.

We work on the complete simple graph $K_n$, writing

$ P = P \( K_n \) \, #h(2em) p = binom(n, 2) . $

The objective functions below have one coordinate for each of these $p$ unordered pairs. In particular, $P$ is nonempty even when the input graph has no perfect matching. Small positive weights on absent pairs will encode the input support in the objective. Completion also provides the uniform feasible mean $u_(i j) = 1 \/ \( n - 1 \)$, whose nontrivial odd-cut inequalities are strict. Section 8 uses that slack to repair cut violations after correcting the degree sums.

=== 7.1 Completing the graph with small weights <completing-the-graph-with-small-weights>

Set

#[#set math.equation(numbering: n => "(29)")
 $ b_max & = max #scale(x: 120%, y: 120%)[\(] { 0 } union { floor.l log_2 k_e floor.r : k_e > 0 } #scale(x: 120%, y: 120%)[\)] \,\
L & = 100 \( n + b_max + 1 \)^3 \, #h(2em) beta_e = cases(delim: "{", floor.l log_2 k_e floor.r \, & k_e > 0 \,, - L \, & k_e = 0 .) $ <d:eq-completion-weights>]

For a positive integer $k_e$, its binary bit length minus one equals $floor.l log_2 k_e floor.r$. Thus these coefficients are computed exactly by integer arithmetic, and their numerical magnitudes are polynomial in $n + b_max$.

Use $Z_beta$ and $q^(*)$ from Corollary 20 for $K_n$ with the weights in Equation (29). A term in $Z_beta$ is called valid if its matching uses only pairs with positive input multiplicity; write $Z_(upright("good"))$ and $Z_(upright("bad"))$ for the sums of valid and remaining terms, respectively.

#thm([Lemma 7.1.])[
  (Weighted completion).  #emph[The contribution of matchings using an absent pair satisfies 
$ 0 lt.eq Z_(upright("bad")) lt.eq 2^(- 20 n) . $

 Moreover, 
#[#set math.equation(numbering: n => "(30)")
 $ N = 0 & quad arrow.r.double quad log_2 Z_beta lt.eq - 20 n \,\
N > 0 & quad arrow.r.double quad max { 1 \, 2^(- n \/ 2) N } lt.eq Z_beta lt.eq 2 N . $ <d:eq-penalized-count>]

]
] <d:lem-penalized-count>

#proof[
  For each pair with $k_e > 0$, put $r_e = 2^(floor.l log_2 k_e floor.r)$. Then
  $ k_e / 2 lt.eq r_e lt.eq k_e . $
  For a valid matching of $K_n$, the product of its $k_e$’s is the number of corresponding perfect matchings in the input multigraph. Replacing these $n \/ 2$ factors by $r_e$ and summing therefore gives
  #[#set math.equation(numbering: n => "(31)")
   $ 2^(- n \/ 2) N lt.eq Z_(upright("good")) lt.eq N . $ <d:eq-valid-rounded-count>]
  If $N > 0$, there is at least one valid matching, and its rounded weight is a positive integer. Hence $Z_(upright("good")) gt.eq 1$.
  Every remaining matching uses a pair of weight $2^(- L)$, and each of its other pair weights is at most $2^(b_max)$. There are at most $2^p$ matchings, since each is a subset of the $p$ pairs. Thus
  $ Z_(upright("bad")) lt.eq 2^(p + b_max n \/ 2 - L) lt.eq 2^(- 20 n) . $
  For the last inequality, put $t = n + b_max + 1 gt.eq 5$ and note that
  $ p + frac(b_max n, 2) + 20 n lt.eq t^2 + 20 t lt.eq 100 t^3 = L . $
  When $N = 0$, every term is in $Z_(upright("bad"))$; also $Z_beta > 0$ because $K_n$ has a perfect matching and every assigned weight is positive. This proves the first implication in Equation (30). When $N > 0$, Equation (31) gives the lower bounds, while
  $ Z_beta lt.eq N + 2^(- 20 n) lt.eq 2 N $
  because $N$ is a positive integer. ◻
]

=== 7.2 Interpolating entropy on a dyadic grid <interpolating-entropy-on-a-dyadic-grid>

Let $K$ be the least nonnegative integer such that $2^K gt.eq p$. Define $phi.alt \( t \) = - t log_2 t$ on $\[ 0 \, 1 \]$, with $phi.alt \( 0 \) = 0$, and let $psi$ be its continuous linear interpolant at

$ 0 \, med 2^(- K) \, med 2^(- \( K - 1 \)) \, med dots.h \, med 2^(- 1) \, med 1 . $

The interpolant has the explicit rational formulas

#[#set math.equation(numbering: n => "(32)")
 $ psi \( t \) = cases(delim: "{", K t \, & 0 lt.eq t lt.eq 2^(- K) \,, \( k - 1 \) t + 2^(- k) \, & 2^(- \( k + 1 \)) lt.eq t lt.eq 2^(- k) \, quad 0 lt.eq k < K .) $ <d:eq-dyadic-chords>]

The formulas agree at common endpoints.

#thm([Lemma 7.2.])[
  (Dyadic entropy approximation).  #emph[The function $psi$ is concave, with integer slopes of absolute value at most $K$. For every $x in P$, 
#[#set math.equation(numbering: n => "(33)")
 $ 0 lt.eq h_2 \( x \) - sum_e psi \( x_e \) lt.eq n / 2 + 1 lt.eq n . $ <d:eq-dyadic-entropy-error>]

]
] <d:lem-dyadic-entropy>

#proof[
  At a positive knot, $phi.alt \( 2^(- k) \) = k 2^(- k)$. The chord between $2^(- \( k + 1 \))$ and $2^(- k)$ therefore has slope $k - 1$ and intercept $2^(- k)$, whereas the chord from zero has slope $K$. This proves Equation (32). Reading the intervals from left to right, the slopes are nonincreasing, so $psi$ is concave. Since $p gt.eq 6$, we have $K gt.eq 1$, and all its slopes lie between $- 1$ and $K$.
  The concavity of $phi.alt$ puts every chord below its graph. If $2^(- \( k + 1 \)) lt.eq t lt.eq 2^(- k)$, then
  $ psi \( t \) - k t = 2^(- k) - t gt.eq 0 \, #h(2em) phi.alt \( t \) lt.eq \( k + 1 \) t . $
  Consequently $0 lt.eq phi.alt \( t \) - psi \( t \) lt.eq t$ on this interval. On the interval adjacent to zero, write $t = 2^(- K) r$, where $0 lt.eq r lt.eq 1$. Then
  $ phi.alt \( t \) - psi \( t \) = 2^(- K) \( - r log_2 r \) lt.eq 2^(- K) . $
  Here the expression at $r = 0$ is interpreted by continuity; on $\( 0 \, 1 \]$, differentiation gives the maximum $1 \/ \( e ln 2 \) < 1$.
  For $x in P$, summing the degree equations gives $sum_e x_e = n \/ 2$. Apply the bound $x_e$ on intervals above $2^(- K)$, and the bound $2^(- K)$ on the interval below it. The total error is at most
  $ sum_(e : x_e gt.eq 2^(- K)) x_e + \| { e : x_e < 2^(- K) } #scale(x: 120%, y: 120%)[\|] thin 2^(- K) lt.eq n / 2 + p 2^(- K) lt.eq n / 2 + 1 lt.eq n . $
  This proves Equation (33). ◻
]

Define the concave function $f$ on the entire box $\[ 0 \, 1 \]^p$ by

#[#set math.equation(numbering: n => "(34)")
 $ f \( x \) = sum_e psi \( x_e \) + beta dot.op x \, #h(2em) f^(*) = max_(x in P) f \( x \) . $ <d:eq-surrogate-objective>]

Equation (33) gives $f \( x \) lt.eq h_2 \( x \) + beta dot.op x lt.eq f \( x \) + n$ on $P$. Taking maxima yields

#[#set math.equation(numbering: n => "(35)")
 $ f^(*) lt.eq q^(*) lt.eq f^(*) + n . $ <d:eq-surrogate-gap>]

On each affine piece, $f$ has integer coordinate slopes of absolute value at most $K + L$, since $\| beta_e \| lt.eq L$. All breakpoints and intercepts in Equation (32) have denominators dividing $2^K < 2 p$. Thus $f$ can be evaluated exactly at rational points using rational arithmetic. Section 8 uses these properties to estimate $f^(*)$.

== 8 Optimization by an exact penalty <d:sec-optimization>

Retain the notation of Section 7: $n gt.eq 4$ is even, $P = P \( K_n \)$, $p = binom(n, 2)$, and $f^(*) = max_(x in P) f \( x \)$. We first replace optimization over $P$ by optimization over the box $\[ 0 \, 1 \]^p$. For $x$ in this box, define

#[#set math.equation(numbering: n => "(36)")
 $ w \( x \) = max {0 \, med max_(i in V) \| x \( delta \( i \) \) - 1 #scale(x: 120%, y: 120%)[\|] \, med max_(S subset.eq V\
\| S \| med upright("odd")) #scale(x: 120%, y: 120%)[\(] 1 - x \( delta \( S \) \) #scale(x: 120%, y: 120%)[\)]} . $ <d:eq-max-violation>]

By Theorem 4, $w \( x \) = 0$ exactly when $x in P$.

#thm([Lemma 8.1.])[
  (Feasibility repair).  #emph[Set $A_0 = 10 n^2$. For every $x in \[ 0 \, 1 \]^p$, there is $y in P$ such that 
$ parallel y - x parallel_oo lt.eq \( 2 + A_0 \) w \( x \) . $

]
] <d:lem-feasibility-repair>

#proof[
  Write $w = w \( x \)$, $d_i = 1 - x \( delta \( i \) \)$, and $d_(upright("tot")) = sum_(i in V) d_i$. Correct the degrees by setting
  #[#set math.equation(numbering: n => "(37)")
   $ x'_(i j) = x_(i j) + frac(d_i + d_j, n - 2) - frac(d_(upright("tot")), \( n - 2 \) \( n - 1 \)) #h(2em) \( i eq.not j \) . $ <d:eq-degree-correction>]
  The correction sums to $d_i$ at vertex $i$, since
  $ sum_(j eq.not i) \( d_i + d_j \) = \( n - 2 \) d_i + d_(upright("tot")) . $
  Thus $x' \( delta \( i \) \) = 1$ for every $i$. Since $\| d_i \| lt.eq w$ and $\| d_(upright("tot")) \| lt.eq n w$,
  $ parallel x' - x parallel_oo lt.eq (frac(2, n - 2) + frac(n, \( n - 2 \) \( n - 1 \))) w lt.eq 2 w . $
  Consequently $x'_e gt.eq - 2 w$, and every odd set $S$ satisfies
  #[#set math.equation(numbering: n => "(38)")
   $ x' \( delta \( S \) \) gt.eq 1 - \( 1 + 2 p \) w . $ <d:eq-corrected-cut-bound>]
  Let $u_(i j) = 1 \/ \( n - 1 \)$. This vector has degree sums one, and
  $ u \( delta \( S \) \) = frac(\| S \| \( n - \| S \| \), n - 1) . $
  Cuts with $\| S \| = 1$ or $\| S \| = n - 1$ have value one. For every nontrivial odd cut, $3 lt.eq \| S \| lt.eq n - 3$, and hence, when $n gt.eq 6$,
  $ u \( delta \( S \) \) gt.eq frac(3 \( n - 3 \), n - 1) gt.eq 3 / 2 . $
  There are no nontrivial odd cuts when $n = 4$. In particular, $u in P$.
  Set
  #[#set math.equation(numbering: n => "(39)")
   $ t = min { 1 \, A_0 w } \, #h(2em) y = \( 1 - t \) x' + t u . $ <d:eq-uniform-repair>]
  If $A_0 w gt.eq 1$, including equality, then $y = u in P$. Otherwise $t = A_0 w < 1$. The inequalities
  $ frac(A_0, n - 1) gt.eq 2 \, #h(2em) A_0 / 2 gt.eq 1 + 2 p $
  give
  $ y_e gt.eq - 2 \( 1 - t \) w + frac(A_0 w, n - 1) gt.eq 0 . $
  Equation (38) also gives, for each nontrivial odd cut,
  $ y \( delta \( S \) \) gt.eq 1 - \( 1 - t \) \( 1 + 2 p \) w + frac(A_0 w, 2) gt.eq 1 . $
  The degree sums remain one, so the trivial odd cuts also have value one. Theorem 4 now yields $y in P$ in this branch as well.
  For either branch, use the identity
  $ y - x = \( 1 - t \) \( x' - x \) + t \( u - x \) . $
  Both $u$ and $x$ lie in the box, so
  $ parallel y - x parallel_oo lt.eq 2 \( 1 - t \) w + t parallel u - x parallel_oo lt.eq 2 w + t lt.eq \( 2 + A_0 \) w . $
  This also covers $w = 0$. ◻
]

The repair bound converts constraint violation into a quantitative distance from feasibility. We can therefore penalize violations by a fixed amount large enough to recover exactly the constrained optimum.

Define the positive integers $M_0 \, D_0$ and the function $Phi$ by

#[#set math.equation(numbering: n => "(40)")
 $ M_0 = p \( K + L \) \( 2 + A_0 \) \, #h(2em) Phi \( x \) = f \( x \) - M_0 w \( x \) \, #h(2em) D_0 = p \( K + L + M_0 \)^2 . $ <d:eq-penalty-parameters>]

A vector $g$ is a #emph[supergradient] of $Phi$ at $x$ on the box if

$ Phi \( z \) lt.eq Phi \( x \) + g dot.op \( z - x \) #h(2em) upright("for every ") z in \[ 0 \, 1 \]^p . $

#thm([Lemma 8.2.])[
  (Exact penalty and integral supergradients).  #emph[The function $Phi$ is concave on $\[ 0 \, 1 \]^p$, and 
$ max_(x in \[ 0 \, 1 \]^p) Phi \( x \) = f^(*) . $

 At every point of the box, $Phi$ has an integral supergradient $g$ satisfying $parallel g parallel_2^2 lt.eq D_0$.]
] <d:lem-exact-penalty>

#proof[
  By Lemma 22, the slopes of $psi$ are integers of absolute value at most $K$. Since $\| beta_e \| lt.eq L$, it follows that
  #[#set math.equation(numbering: n => "(41)")
   $ \| f \( x \) - f \( y \) \| lt.eq \( K + L \) sum_e \| x_e - y_e \| lt.eq p \( K + L \) parallel x - y parallel_oo #h(2em) \( x \, y in \[ 0 \, 1 \]^p \) . $ <d:eq-objective-lipschitz>]
  For the point $y in P$ supplied by Lemma 23, Equation (41) gives
  $ Phi \( x \) lt.eq f \( y \) + p \( K + L \) parallel x - y parallel_oo - M_0 w \( x \) lt.eq f \( y \) lt.eq f^(*) . $
  Conversely, $Phi = f$ on $P$, proving equality of the maxima. The function $w$ is a maximum of affine functions and is therefore convex. Since $f$ is concave, $Phi$ is concave.
  Choose a supporting piece slope $sigma_e$ of $psi$ at each $x_e$; at a knot either adjacent slope is allowed. With $b_e = sigma_e + beta_e$, these choices give
  $ f \( z \) lt.eq f \( x \) + b dot.op \( z - x \) #h(2em) \( z in \[ 0 \, 1 \]^p \) . $
  Write each absolute value in Equation (36) as the maximum of its two affine terms. Choose any active affine term $a dot.op z + c$ in this maximum, including the zero term when it is active. Then $a_e in { - 1 \, 0 \, 1 }$, and
  $ w \( z \) gt.eq a dot.op z + c = w \( x \) + a dot.op \( z - x \) . $
  Subtracting the last inequality, multiplied by $M_0$, proves that $g = b - M_0 a$ is a supergradient of $Phi$ on the entire box. The independent choices of supporting pieces and active rows are valid also at endpoints and ties. Finally, $g$ is integral and
  $ \| g_e \| lt.eq K + L + M_0 \, #h(2em) parallel g parallel_2^2 lt.eq p \( K + L + M_0 \)^2 = D_0 . $
  ◻
]

We use the classical projected subgradient method #cite(label("Polyak1967")) Equation (1) to approximate the maximum of $Phi$. Its bounded integral supergradients permit a fixed step size and keep every iterate on one rational grid. The next lemma gives the finite iteration count and value guarantee directly.

#thm([Lemma 8.3.])[
  (Finite projected ascent).  #emph[Let $N_(upright("it")) = p D_0$, set $x^(\( 0 \)) = 0$, and for $j = 0 \, dots.h \, N_(upright("it")) - 1$ choose a supergradient $g^(\( j \))$ as in Lemma 24 and set 
#[#set math.equation(numbering: n => "(42)")
 $ x^(\( j + 1 \)) = Pi_(\[ 0 \, 1 \]^p) (x^(\( j \)) + g^(\( j \)) / D_0) \, $ <d:eq-projected-iterations>]

 where $Pi_(\[ 0 \, 1 \]^p)$ clips each coordinate to $\[ 0 \, 1 \]$. Then 
#[#set math.equation(numbering: n => "(43)")
 $ R = ⌊max_(0 lt.eq j < N_(upright("it"))) Phi \( x^(\( j \)) \)⌋ #h(2em) upright("satisfies") #h(2em) R lt.eq f^(*) lt.eq R + 2 . $ <d:eq-optimization-accuracy>]

]
] <d:lem-projected-ascent>

#proof[
  Choose $z in P$ with $f \( z \) = f^(*)$; then $Phi \( z \) = f^(*)$ by Lemma 24. Clipping cannot increase distance to $z in \[ 0 \, 1 \]^p$. Expanding the squared distance and using the supergradient inequality therefore gives
  #[#set math.equation(numbering: n => "(44)")
   $ parallel x^(\( j + 1 \)) - z parallel_2^2 & lt.eq parallel x^(\( j \)) - z parallel_2^2 + 2 / D_0 g^(\( j \)) dot.op \( x^(\( j \)) - z \) + frac(parallel g^(\( j \)) parallel_2^2, D_0^2)\
 & lt.eq parallel x^(\( j \)) - z parallel_2^2 - 2 / D_0 #scale(x: 120%, y: 120%)[\(] f^(*) - Phi \( x^(\( j \)) \) #scale(x: 120%, y: 120%)[\)] + 1 / D_0 . $ <d:eq-ascent-step>]
  Summing Equation (44) over exactly the indicated $N_(upright("it"))$ indices yields
  $ 2 sum_(j = 0)^(N_(upright("it")) - 1) #scale(x: 120%, y: 120%)[\(] f^(*) - Phi \( x^(\( j \)) \) #scale(x: 120%, y: 120%)[\)] & lt.eq D_0 #scale(x: 120%, y: 120%)[\(] parallel x^(\( 0 \)) - z parallel_2^2 - parallel x^(\( N_(upright("it")) \)) - z parallel_2^2 #scale(x: 120%, y: 120%)[\)] + N_(upright("it"))\
 & lt.eq p D_0 + N_(upright("it")) = 2 N_(upright("it")) . $
  Here $parallel x^(\( 0 \)) - z parallel_2^2 lt.eq p$. Thus the largest of the sampled values, say $V$, satisfies $f^(*) - 1 lt.eq V lt.eq f^(*)$. Since $R = floor.l V floor.r$,
  $ R lt.eq V lt.eq f^(*) \, #h(2em) f^(*) lt.eq V + 1 < R + 2 \, $
  which proves Equation (43). ◻
]

Every iterate in Equation (42) has coordinates that are integer multiples of $1 \/ D_0$: the update adds an integral vector divided by $D_0$, and clipping inserts only $0$ or $1$. To evaluate $w$ and choose an active row, compare the zero term and the $2 n$ signed degree terms with the largest odd-cut violation. Lemma 27 computes a minimum odd cut from the nonnegative integer capacities $D_0 x_e^(\( j \))$ and returns its row in the original edge coordinates. The values of $Phi$ and the floor defining $R$ can then be computed exactly using rational arithmetic. Proposition 28 gives the resulting bit-complexity bound.

== 9 Computing an active odd-cut constraint <d:sec-odd-cuts>

The optimization in Section 8 needs both the value of $w \( x \)$ and an affine function attaining its defining maximum. The degree violations are immediate to compute. We supply the remaining ingredient: an exact minimum odd cut, together with its vertex set. The use of minimum odd cuts for matching-constraint separation goes back to Padberg and Rao #cite(label("PadbergRao1982")). We prove the recursion and its arithmetic bounds here.

Throughout this section, an auxiliary graph has vertex set $W$ and nonnegative integer capacities $c_(i j) = c_(j i)$ for distinct $i \, j in W$. Absent edges have capacity zero. Parallel capacities are summed and loops are discarded. Write

$ c \( S \) = sum_(i in S\
j in W \\ S) c_(i j) \, #h(2em) C = sum_({ i \, j } subset.eq W) c_(i j) \, #h(2em) v = \| W \| . $

We use the classical augmenting-path method of Ford and Fulkerson #cite(label("FordFulkerson1957")) Section 2, specialized here to unit augmentations. The capacity-dependent bound needed below is proved explicitly.

#thm([Lemma 9.1.])[
  (An integral two-terminal minimum cut).  #emph[For distinct $a \, b in W$, a minimum cut separating $a$ from $b$ can be found deterministically using at most $C$ unit augmentations and $O \( v^2 \( C + 1 \) \)$ arithmetic operations on integers of $O \( log_2 \( v + C + 2 \) \)$ bits.]
] <d:lem-unit-mincut>

#proof[
  Maintain integers $b_(i j) = - b_(j i)$ such that $b_(i j) lt.eq c_(i j)$ in both directions and $sum_j b_(i j) = 0$ for $i in.not { a \, b }$. The two directional inequalities give $- c_(i j) lt.eq b_(i j) lt.eq c_(i j)$. Start with zero flow. If a simple directed path from $a$ to $b$ uses only steps with residual capacity $c_(i j) - b_(i j) > 0$, increase the flow on each forward step by one and decrease its reverse by one. Integrality makes this feasible, conservation is preserved, and the net source outflow $q = sum_j b_(a j)$ increases by one. Since
  $ q lt.eq sum_j c_(a j) lt.eq C \, $
  there are at most $C$ augmentations.
  When no such path exists, let $S$ be the vertices reachable from $a$ by positive-residual steps. Then $b in.not S$, and every step from $S$ to its complement is saturated. Antisymmetry cancels internal flows, so conservation gives
  $ q = sum_(i in S\
j in.not S) b_(i j) = sum_(i in S\
j in.not S) c_(i j) = c \( S \) . $
  For every other $a$–$b$ cut, the same conservation identity and $b_(i j) lt.eq c_(i j)$ give capacity at least $q$. Thus $S$ is minimum. A graph search with fixed vertex order finds a simple residual path, or the final reachable set, in $O \( v^2 \)$ operations. There are at most $C + 1$ searches, and all flows and residual capacities have magnitude at most $2 C$. The argument includes $C = 0$. ◻
]

#thm([Lemma 9.2.])[
  (Minimum odd-terminal cut).  #emph[Let $U subset.eq W$ have positive even cardinality. One can deterministically find a set $S subset.eq W$ minimizing $c \( S \)$ subject to $\| S ∩ U \|$ being odd. The algorithm returns the set itself, uses at most $\| U \| - 1$ recursive instances, and requires $O \( \| U \|^3 v^2 \( C + 1 \) \)$ arithmetic operations on integers of $O \( log_2 \( v + C + 2 \) \)$ bits.]
] <d:lem-odd-cut-oracle>

#proof[
  Call a cut #emph[terminal-separating] if both sides meet $U$. Compute a minimum cut for every pair of distinct terminals using Lemma 26, and take the least-capacity result, with sides $A$ and $overline(A) = W \\ A$. This is a minimum terminal-separating cut: every such cut separates some terminal pair, and every recorded pair cut is terminal-separating.
  If $\| A ∩ U \|$ is odd, return $A$. Every admissible odd-terminal cut is terminal-separating, so this answer is optimal. Otherwise both $A ∩ U$ and $overline(A) ∩ U$ have positive even cardinality. Form two children:
  + keep $A$, contract $overline(A)$ to a new nonterminal, and use terminal set $A ∩ U$;
  + keep $overline(A)$, contract $A$ to a new nonterminal, and use terminal set $overline(A) ∩ U$.
  For example, in the first child the capacity from $i in A$ to the new vertex is $sum_(j in overline(A)) c_(i j)$. Recurse on both children and return the better lifted cut. Every call strictly decreases the positive even terminal count; when $\| U \| = 2$, the first cut is already odd.
  ===== 9.1 Lifting cuts. <lifting-cuts.>
  A child cut lifts by replacing its contracted vertex, if included, with the entire block it represents. The crossing capacities are unchanged, and including that block adds an even number of parent terminals. Thus the lift has the same capacity and is terminal-odd.
  This remains true through arbitrarily nested contractions. Relative to the initial instance, current vertices form a partition into blocks. Every current terminal is an original terminal singleton, and every nonterminal block contains an even number of original terminals. Initially the latter count is zero; each contraction combines an even number of current terminals with blocks of even parity, preserving the assertion. Capacities between current vertices are sums of original capacities between their blocks. Consequently every returned subset lifts to an original subset with the same capacity and terminal parity. Figure 2 illustrates the parity rule.
  ===== 9.2 Preserving an optimum. <preserving-an-optimum.>
  Let $S$ be an optimal odd-terminal side in the current instance. Exactly one of $S ∩ A$ and $S ∩ overline(A)$ contains an odd number of terminals; exchange the names of the two sides so that it is $S ∩ A$. Because $\| A ∩ U \|$ is even, replacing $S$ by its complement preserves this odd intersection. Make this replacement if $S$ contains all terminals of $overline(A)$. Now $S union A$ contains terminals of $A$ and omits a terminal of $overline(A)$, so
  $ c \( S union A \) gt.eq c \( A \) . $
  For any two vertex sets, nonnegative undirected capacities satisfy
  #[#set math.equation(numbering: n => "(45)")
   $ c \( S ∩ A \) + c \( S union A \) lt.eq c \( S \) + c \( A \) . $ <d:eq-cut-submodularity>]
  Indeed, the right side minus the left side is twice the capacity between $S \\ A$ and $A \\ S$. It follows that $c \( S ∩ A \) lt.eq c \( S \)$. The set $S ∩ A$ is a feasible odd-terminal side in the first child, avoiding its contracted vertex. Hence at least one child has optimum at most the parent’s. Conversely, lifting shows that every child optimum is at least the parent’s. Induction on $\| U \|$ proves that the better recursive answer attains the parent optimum.
  ===== 9.3 Size and running time. <size-and-running-time.>
  Each nonleaf splits its terminal set into two disjoint nonempty even sets. There are at most $\| U \| \/ 2$ leaves and hence at most $\| U \| - 1$ instances in this binary recursion tree. Each contracted side contains at least two terminals, so a child also has fewer vertices than its parent. Within any one instance, every surviving capacity sums a disjoint set of original edge capacities; original edges internal to blocks are discarded. Its total capacity is therefore at most $C$. Capacities in different children may overlap, and we account for them by multiplying the cost of an instance by the number of instances.
  There are at most $O \( \| U \|^2 \)$ pair computations per instance, each costing $O \( v^2 \( C + 1 \) \)$ by Lemma 26. Contractions and lifted-set bookkeeping fit within the same bound. This proves the stated running time. All comparisons and tie choices may use fixed orderings; zero capacities require no perturbation. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0.25, 1.3), (2.55, 1.3), (2.55, 0.2), (4.55, 0.2), (4.55, 2.25), (0.25, 2.25), close: true, fill: rgb("#e0e0ff"), stroke: none)
  rect((0.15, 0.1), (2.25, 2.35), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  rect((2.45, 0.1), (4.65, 2.35), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((1.2, 2.68), [#text(size: 9pt)[$A$]])
  content((3.55, 2.68), [#text(size: 9pt)[$overline(A)$]])
  circle((1.2, 1.8), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  circle((1.2, 0.65), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  circle((3.55, 1.8), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  circle((3.55, 0.65), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  line((1.2, 1.8), (1.2, 0.65), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  line((1.2, 1.8), (3.55, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  line((1.2, 1.8), (3.55, 0.65), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  line((1.2, 0.65), (3.55, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  line((1.2, 0.65), (3.55, 0.65), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  line((3.55, 1.8), (3.55, 0.65), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  content((2.4, -0.3), [#text(size: 9pt)[lifted side: three terminals]])
  line((4.95, 1.2), (6.35, 1.2), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((5.65, 1.8), [#text(size: 8pt)[contract#linebreak()$overline(A)$]])
  rect((6.7, 1.3), (10.8, 2.25), fill: rgb("#e0e0ff"), stroke: none)
  rect((6.6, 0.1), (8.7, 2.35), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((7.65, 2.68), [#text(size: 9pt)[$A$]])
  circle((7.65, 1.8), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  circle((7.65, 0.65), radius: 0.1147, fill: rgb("#000000"), stroke: none)
  circle((10.2, 1.8), radius: 0.1497, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.7pt, miter-limit: 10))
  line((7.65, 1.8), (7.65, 0.65), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  line((7.65, 1.8), (10.2, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  line((7.65, 0.65), (10.2, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10))
  content((10.2, 0.7), [#text(size: 8pt)[nonterminal#linebreak()even number of#linebreak()original terminals]])
  content((8.7, -0.3), [#text(size: 9pt)[child side: one terminal]])
})],
  caption: [Figure 2: Lifting through an even-terminal contraction. Filled dots are terminals and the open dot represents the contracted block. In this schematic instance each side initially has two terminals. The shaded child side lifts to the shaded parent side by taking the entire contracted block, preserving odd parity. Parallel crossing capacities are added, so the cut capacity is preserved as well. ],
) <d:fig-odd-cut-lift>

===== 9.4 Recovering an active row in the original coordinates. <recovering-an-active-row-in-the-original-coordinates.>

At an optimization trial point, $D_0 x_e$ is a nonnegative integer for every original complete-graph pair $e$. Indeed, the initial point is zero, and an integral supergradient step of size $1 \/ D_0$, followed by clipping to $\[ 0 \, 1 \]$, preserves this grid. Apply Lemma 27 with $U = V$ and capacities $c_e = D_0 x_e$. Store each contracted vertex’s block of original vertices, so the returned cut yields an explicit original set $S subset.eq V$ of odd cardinality. It minimizes $x \( delta \( S \) \)$.

The corresponding affine function in the definition of $w$ is

$ ell_S \( y \) = 1 - sum_(e in delta \( S \)) y_e . $

Its coefficient is $- 1$ on #emph[every] original pair crossing $S$, including pairs with $x_e = 0$, and zero elsewhere. Thus the row is recovered by scanning the original pairs, even if zero-capacity edges were omitted during graph searches. Edges discarded as contraction loops have both endpoints in one block and do not cross a lifted cut. Comparing $ell_S \( x \)$ with zero and the two signed degree violations for every vertex gives $w \( x \)$ and an affine row attaining it, as required in Section 8.

Here the initial total capacity is at most $p D_0$. A merged edge can exceed $D_0$, but the bound on each instance’s total capacity remains $p D_0$; likewise a large reverse residual does not change the source-outflow bound in Lemma 26. One complete violation computation therefore takes

$ O #h(-0.16667em) (n^5 \( p D_0 + 1 \)) $

arithmetic operations. The numerical bounds on $D_0$ and the resulting bit complexity are recorded in Proposition 28.

== 10 The algorithm and its guarantee <d:sec-algorithm>

We now assemble the preceding constructions into a deterministic algorithm. The input consists of a vertex set $V = { 1 \, dots.h \, n }$ and nonnegative integer multiplicities $k_({ i \, j })$ for distinct vertex pairs, written in binary; an omitted pair has multiplicity zero. Listing parallel edges individually is also allowed, since their multiplicities can first be counted. Let $N$ be the number of perfect matchings, with parallel edge choices distinguished. Fix the vertex and pair orderings, and use the deterministic cut procedure of Section 9.

+ #strong[Handle the elementary cases.] If $n = 0$, return $1$. If $n$ is odd, return $0$. If $n = 2$, return $k_({ 1 \, 2 })$. Sort the endpoint labels occurring in positive-multiplicity pair records and count the distinct labels. If fewer than $n$ occur, an isolated vertex forces the count to be zero; return $0$. This test uses the input records even when $n$ is supplied in binary, before allocating any array indexed by all vertices or pairs.
+ #strong[Set up the complete-pair objective.] Now $n gt.eq 4$ is even. Use all $p = binom(n, 2)$ pair coordinates. Compute $b_max \, L \, beta$ from Equation (29), and let $K$ be the least nonnegative integer with $2^K gt.eq p$. Define $psi$ and $f$ by Equations (32) and (34). Set $A_0 = 10 n^2$, define $w$ by Equation (36), and compute $M_0 \, Phi \, D_0$ from Equation (40). Set
  $ N_(upright("it")) = p D_0 \, #h(2em) a^(\( 0 \)) = 0 in bb(Z)^p . $
  The integer vector $a^(\( j \))$ represents $x^(\( j \)) = a^(\( j \)) \/ D_0$.
+ #strong[Evaluate and update $N_(upright("it"))$ trial points.] For $j = 0 \, dots.h \, N_(upright("it")) - 1$, do the following.
  + Apply Lemma 27 to the integral capacities $a_e^(\( j \))$, with every vertex terminal, obtaining a minimum-capacity odd cut $S_j$. At $x = x^(\( j \))$, compare
    $ 0 \, quad x \( delta \( 1 \) \) - 1 \, quad 1 - x \( delta \( 1 \) \) \, quad dots.h \, quad x \( delta \( n \) \) - 1 \, quad 1 - x \( delta \( n \) \) \, quad 1 - x \( delta \( S_j \) \) . $
    Their maximum is $w \( x \)$. Select the first maximizing expression in this list and let $r^(\( j \)) in { - 1 \, 0 \, 1 }^p$ be its linear coefficient vector. Evaluate $Phi \( x \)$ exactly and retain the largest trial value seen so far.
  + In each coordinate choose the right-hand slope $sigma_e^(\( j \))$ of $psi$ at $x_e^(\( j \))$, using the left-hand slope at $1$. Set
    $ g_e^(\( j \)) = sigma_e^(\( j \)) + beta_e - M_0 r_e^(\( j \)) . $
    These are the integral supergradients from Lemma 24.
  + Update the integer numerators by
    $ a_e^(\( j + 1 \)) = min #h(-0.16667em) {D_0 \, thin max { 0 \, a_e^(\( j \)) + g_e^(\( j \)) }} #h(2em) \( e in E \( K_n \) \) . $
+ #strong[Return the estimate.] Let
  $ R = ⌊max_(0 lt.eq j < N_(upright("it"))) Phi \( x^(\( j \)) \)⌋ . $
  If $R < - 10 n$, return $0$. Otherwise return
  $ A = 2^rho \, #h(2em) rho = max { 0 \, R - 5 n } . $

The slope convention and the ordering in Step 3 settle all remaining ties. The numerator update is exactly the clipped step $x^(\( j \)) + g^(\( j \)) \/ D_0$ of Lemma 25.

#proof[
  #emph[Approximation guarantee in Theorem 1.2.] The elementary cases return the exact count, so suppose $n gt.eq 4$ is even and the algorithm reaches the optimization. Lemma 25, Lemma 22, and Corollary 20 give, respectively,
  $ R lt.eq f^(*) lt.eq R + 2 \, #h(2em) f^(*) lt.eq q^(*) lt.eq f^(*) + n \, #h(2em) q^(*) - 4 n lt.eq log_2 Z_beta lt.eq q^(*) + n . $
  Combining them yields
  #[#set math.equation(numbering: n => "(46)")
   $ R - 4 n lt.eq log_2 Z_beta lt.eq R + 2 n + 2 lt.eq R + 3 n . $ <d:eq-algorithm-partition-bracket>]
  If $N = 0$, Lemma 21 gives $log_2 Z_beta lt.eq - 20 n$, hence $R lt.eq - 16 n < - 10 n$. If $N > 0$, the same lemma gives $Z_beta gt.eq 1$, hence $R gt.eq - 3 n > - 10 n$. Thus the zero test is exact.
  Now let $N > 0$. The inequalities $Z_beta lt.eq 2 N$ and $Z_beta gt.eq 2^(- n \/ 2) N$, again from Lemma 21, imply
  #[#set math.equation(numbering: n => "(47)")
   $ R - 5 n lt.eq R - 4 n - 1 lt.eq log_2 N lt.eq R + frac(7 n, 2) lt.eq R + 4 n . $ <d:eq-algorithm-count-bracket>]
  Also $log_2 N gt.eq 0$, so $rho = max { 0 \, R - 5 n } lt.eq log_2 N$. Since $rho gt.eq R - 5 n$, Equation (47) gives $log_2 N - rho lt.eq 9 n$. Exponentiating proves $A lt.eq N lt.eq 2^(9 n) A = 512^n A$. ◻
]

#thm([Proposition 10.1.])[
  (Bit complexity).  #emph[The algorithm above is uniform and deterministic, and its running time and output length are polynomial in the input bit length.]
] <d:prop-bit-complexity>

#proof[
  The elementary cases require only integer operations on the input. In the remaining case put $tau = n + b_max + 1$, so $tau gt.eq 5$. The parameters have polynomial numerical magnitude, not just polynomial bit length. Indeed $p lt.eq tau^2$, $K lt.eq n lt.eq tau$, $2^K < 2 p$, $L = 100 tau^3$, and $A_0 lt.eq 10 tau^2$. Consequently
  #[#set math.equation(numbering: n => "(48)")
   $ M_0 & = p \( K + L \) \( 2 + A_0 \) lt.eq 1212 thin tau^7 \,\
D_0 & = p \( K + L + M_0 \)^2 lt.eq 1313^2 thin tau^16 \,\
N_(upright("it")) & = p D_0 lt.eq 1313^2 thin tau^18 . $ <d:eq-parameter-size-bounds>]
  Here $K + L lt.eq 101 tau^3$ and $2 + A_0 lt.eq 12 tau^2$ give the first inequality, and $K + L + M_0 lt.eq 1313 tau^7$ gives the second. The exponent of each positive multiplicity is obtained from its binary length: $floor.l log_2 k_e floor.r = "bitlen" \( k_e \) - 1$. No logarithm is evaluated numerically.
  The update preserves $a_e^(\( j \)) in { 0 \, dots.h \, D_0 }$, because every supergradient coordinate is integral. Thus every iterate has denominator dividing $D_0$. On a noninitial dyadic interval the affine formula for $psi$ is $\( k - 1 \) t + 2^(- k)$, and on the interval next to zero it is $K t$. The intercept denominators therefore divide $2^K$. Every degree or cut sum, and hence $w \( x^(\( j \)) \)$, has denominator dividing $D_0$. A single common denominator for all trial objectives is
  #[#set math.equation(numbering: n => "(49)")
   $ Q = D_0 thin 2^K . $ <d:eq-fixed-objective-denominator>]
  This denominator does not grow with the number of iterations or with changes of dyadic piece. The piece comparisons, objective comparisons, and the final floor can all be made by exact integer arithmetic.
  For an explicit bound on the operands, $0 lt.eq w \( x \) lt.eq n$ on the box, and
  $ \| f \( x \) \| lt.eq p \( 1 + L \) \, #h(2em) \| Phi \( x \) \| lt.eq p \( 1 + L \) + n M_0 \, #h(2em) x in \[ 0 \, 1 \]^p . $
  Together with Equation (48) and $2^K < 2 p$, these bounds show that all objective numerators with denominator $Q$ have polynomial magnitude in $tau$. The supergradients, scaled capacities, and counters do as well. Their bit lengths are therefore $O \( log tau \)$.
  At any trial point, the cut oracle receives capacities $a_e^(\( j \))$, not the original multiplicities. Their total is at most $p D_0$. After any sequence of contractions, each surviving capacity is a sum of original capacities between two disjoint vertex blocks; internal edges are discarded. Every original edge contributes to at most one surviving pair, so the same total bound holds throughout the recursion. By Lemma 26, each terminal-pair computation uses at most $p D_0$ unit augmentations. Lemma 27 uses $O \( n \)$ recursive calls, each with $O \( n^2 \)$ terminal-pair computations. Dense residual path searches take $O \( n^2 \)$ elementary operations. The entire optimization thus uses at most
  $ O #h(-0.16667em) (N_(upright("it")) thin n^5 \( p D_0 + 1 \)) = O \( tau^41 \) $
  elementary graph and arithmetic operations, on integers of $O \( log tau \)$ bits. Standard integer arithmetic gives a polynomial bit bound.
  It remains to bound the length of the explicit integer output. Lemma 25 gives $R lt.eq f^(*)$. Since $psi \( t \) lt.eq - t log_2 t lt.eq 1$ on $\[ 0 \, 1 \]$, $beta_e lt.eq b_max$, and $sum_e x_e = n \/ 2$ on $P \( K_n \)$, we have $f^(*) lt.eq p + b_max n \/ 2$. This upper bound is nonnegative, so the clamped exponent satisfies
  #[#set math.equation(numbering: n => "(50)")
   $ rho = max { 0 \, R - 5 n } lt.eq max { 0 \, R } lt.eq max { 0 \, f^(*) } lt.eq p + frac(b_max n, 2) . $ <d:eq-clamped-output-size>]
  Writing $2^rho$ as a binary integer therefore takes $O \( n^2 + n b_max + 1 \)$ bits and operations. The zero and exact elementary outputs also have polynomial length.
  For an explicit vertex list, both $n$ and $b_max$ are bounded by the input bit length. The same conclusion holds when $n$ is given in binary and only positive pair records are listed. The coverage test in Step 1 takes polynomial time in the input bit length. If it does not return zero, every vertex appears in a record, so $n$ is at most twice the number of positive pair records. Thus the complete-pair allocation and the optimization are polynomial in this encoding as well. ◻
]

Theorem 1.2 and Proposition 28 give both the approximation guarantee and its uniform polynomial bit implementation. If an upper estimate is preferred, $512^n A$ lies between $N$ and $512^n N$.

== 11 Alternative geometric and entropy arguments <a:section>

We give two other descriptions of supported face codimension: a laminar family of tight cuts, and a quotient-space formulation of contraction. Both recover the bound used in the main proof. We then retain the direct coefficient-three and coefficient-four covariance comparisons and their counting consequences. These comparisons use weaker dimension estimates; they do not require the finite-order entropy theorem.

Throughout, $G = \( V \, E \)$ is a finite loopless labelled multigraph on $n = 2 m gt.eq 2$ vertices with a nonempty matching polytope, denoted by $P = P \( G \)$. We use $F_x$, $T \( x \)$, and $d \( x \) = dim T \( x \)$ from Lemma 5. Its direction-space description and Theorem 4 are the shared geometric preliminaries. Removing the zero coordinates of a mean preserves the dimension of its minimal face: coordinate restriction and zero extension are inverse affine maps on that face. We use this identification whenever we work only on supported edges.

=== 11.1 Uncrossing and a laminar rank bound <uncrossing-and-a-laminar-rank-bound>

This alternative proof uses the laminar uncrossing method for tight odd cuts, as in #cite(label("SvenssonTarnawski2017")) full version, Lemma 2.2 and Appendix A; compare also the tight-cut rank estimate in #cite(label("AbdiCornuejolsDadushDalirrooyfard2026")) Lemma 6.5. We give the spanning argument and the tree count explicitly, retaining the dependence between two complementary children of the root.

Recall that $chi_S = upright(bold(1))_(delta \( S \))$ and that $cal(S)_x$ is the family of odd sets whose cuts are tight at $x$. Equation (6) identifies the supported face codimension with the rank of these cut vectors after zero coordinates are removed. We first choose a laminar spanning family, then bound its rank by a tree count.

A family of sets is #emph[laminar] if every two of its members are disjoint or one contains the other. Two sets #emph[cross] if they intersect and neither contains the other.

#thm([Lemma 11.1.])[
  (Laminar spanning family).  #emph[Suppose $x in P \( G \)$ and $x_e > 0$ for every edge. There is a laminar family $cal(L) subset.eq cal(S)_x$ whose cut vectors are linearly independent and span all the cut vectors $chi_S$, $S in cal(S)_x$.]
] <geom:lem-laminar>

#proof[
  First let $A \, B in cal(S)_x$ cross, and put
  $ I = A ∩ B \, #h(2em) D = A \\ B \, #h(2em) D' = B \\ A \, #h(2em) O = V \\ \( A union B \) . $
  The first three regions are nonempty; $O$ may be empty. If $\| I \|$ is odd, then both $I$ and $A union B$ are odd, and the coordinatewise cut identity is
  #[#set math.equation(numbering: n => "(51)")
   $ chi_A + chi_B = chi_I + chi_(A union B) + 2 upright(bold(1))_(E \( D \, D' \)) . $ <geom:eq-uncross-intersection>]
  Here $E \( D \, D' \)$ denotes the edges joining those two regions. Taking the dot product with $x$, the left side equals two, the first two terms on the right are at least one each, and the last term is nonnegative. Thus both new odd sets are tight and $x \( E \( D \, D' \) \) = 0$. Since every coordinate of $x$ is positive, there are no edges in $E \( D \, D' \)$, so its indicator vector vanishes.
  If $\| I \|$ is even, then $D \, D'$ are odd and instead
  #[#set math.equation(numbering: n => "(52)")
   $ chi_A + chi_B = chi_D + chi_(D') + 2 upright(bold(1))_(E \( I \, O \)) . $ <geom:eq-uncross-difference>]
  The same argument shows that $D \, D'$ are tight and that the last indicator vanishes. Both identities hold edge by edge, including for parallel edges. All replacement sets are nonempty and proper: in the first case $A union B$ is odd and so cannot be the even set $V$, and in the second case the differences are nonempty proper subsets. In particular, if $A union B = V$, only the second case can occur. We have proved that in either case the two replacements $U \, W$ belong to $cal(S)_x$ and satisfy
  #[#set math.equation(numbering: n => "(53)")
   $ chi_A + chi_B = chi_U + chi_W . $ <geom:eq-uncross-tight>]
  Choose an inclusionwise maximal laminar subfamily $cal(L)$ of $cal(S)_x$ with independent cut vectors, and let $R$ be their span. Suppose a tight cut vector lies outside $R$. Among the corresponding tight sets choose $A$ crossing as few members of $cal(L)$ as possible. It crosses some $B in cal(L)$, for otherwise it could be added to the family while preserving both laminarity and independence. Uncross $A \, B$ as above. At least one replacement vector lies outside $R$, since otherwise Equation (53) and $chi_B in R$ would give $chi_A in R$.
  Each replacement is laminar with $B$. Also, neither replacement can cross a member $C in cal(L)$ that did not cross $A$. Indeed, such a set $C$ is laminar with both $A$ and $B$. If $C$ contains $A$, then it meets $B$, and laminarity forces it to contain $B$ as well: the other nesting direction would imply $A subset.eq B$. Thus $C$ contains $A union B$. If $C subset.eq A$, laminarity with $B$ puts $C$ inside $I$ or $D$; it cannot contain $B$, since $B subset.eq.not A$. Finally, if $C$ is disjoint from $A$, its relation to $B$ puts it inside $D'$ or $O$. These cases exhaust the possibilities. Every set among $I \, A union B \, D \, D'$ is laminar with each set in this classification.
  Consequently the replacement whose vector is outside $R$ crosses only previously crossed members of $cal(L)$, and it no longer crosses $B$. This contradicts the minimal crossing count of $A$. Hence $cal(L)$ spans every tight cut vector. ◻
]

#proof[
  #emph[Laminar proof of Proposition 6.] Take the laminar spanning family from Lemma 29. Adjoin all singleton sets, if missing, and then adjoin $V$ as a root. The resulting inclusion tree has $2 m$ singleton leaves. Each internal node is the disjoint union of its children, because all singletons are present. Every proper node has odd cardinality. A nonroot internal node therefore has an odd number of children, at least three. The root has an even number $c$ of children, at least two.
  If $q$ is the number of nonroot internal nodes, the tree identity for the number of leaves gives
  $ 2 m - 1 = sum_(S upright(" internal")) #scale(x: 120%, y: 120%)[\(] \# upright("children of ") S - 1 #scale(x: 120%, y: 120%)[\)] gt.eq \( c - 1 \) + 2 q . $
  Hence the number of proper nodes is $2 m + q lt.eq 3 m - c \/ 2$. If $c gt.eq 4$, their cut vectors have rank at most $3 m - 2$ by this count. If $c = 2$, the two root children are complementary sets, and their cut vectors coincide. The rank is then at most the number of proper nodes minus one, again at most $3 m - 2$. The original laminar spanning family is contained among these proper nodes. Equation (6) now proves the claim. ◻
]

=== 11.2 The quotient-space contraction argument <the-quotient-space-contraction-argument>

The main proof assembles compatible directions in the two contracted graphs. The same dimension count can instead be expressed as a map to the quotient spaces of child constraints. We include both the sharp estimate and the weaker forms used in the entropy comparisons below.

#thm([Proposition 11.2.])[
  (Supported face codimension).  #emph[For a loopless labelled multigraph on $n = 2 m gt.eq 2$ vertices and $x in P \( G \)$, put $A = { e : x_e > 0 }$ and $s_A = \| A \|$. Then $s_A - d \( x \) lt.eq 3 m - 2$. In particular, 
#[#set math.equation(numbering: n => "(54)")
 $ s_A - d \( x \) lt.eq 2 \( n - 2 \) quad \( n gt.eq 4 \) \, #h(2em) s_A - d \( x \) = 1 quad \( n = 2 \) . $ <a:eq-full-support-codimension>]

 Hence $s_A - d \( x \) lt.eq 2 n = 4 m$. For the empty graph, $P \( G \)$ is a singleton in zero coordinates and the codimension is zero.]
] <a:prop-supported-codimension>

#proof[
  Identify $T \( x \)$ with a subspace $U_x$ of $bb(R)^A$. We prove the sharp estimate by induction on the even order $n$. At order two, the supported matching polytope is a simplex, whose positive point has codimension one. For $n gt.eq 4$, if no nontrivial odd cut is tight, only the degree equations constrain $U_x$. Thus its codimension is at most $n lt.eq 3 n \/ 2 - 2$.
  Otherwise choose a tight nontrivial cut $delta \( S \)$. Contract each side in turn as in the main geometric proof, obtaining $x_i in P \( G_i \)$, supported edge sets $A_i = { e : \( x_i \)_e > 0 }$, and direction spaces $U_i = T \( x_i \) subset.eq bb(R)^(A_i)$. The restrictions are feasible by the odd-cut check in the proof of Theorem 4. The orders satisfy $4 lt.eq n_i < n$ and $n_1 + n_2 = n + 2$. Let $C = A ∩ delta \( S \)$; this set is nonempty since $x \( C \) = 1$. Every label in $C$ occurs in both $A_i$.
  Let $r_i : bb(R)^A arrow.r bb(R)^(A_i)$ restrict coordinates, and define
  #[#set math.equation(numbering: n => "(55)")
   $ cal(Q) : bb(R)^A arrow.r \( bb(R)^(A_1) \/ U_1 \) xor \( bb(R)^(A_2) \/ U_2 \) \, #h(2em) cal(Q) \( u \) = \( r_1 \( u \) + U_1 \, r_2 \( u \) + U_2 \) . $ <a:eq-quotient-map>]
  For $u in ker cal(Q)$, both restrictions are child face directions. Choose a common positive radius such that $x_i + t r_i \( u \) in P \( G_i \)$ in both signs of $t$. The perturbed means agree on every cut coordinate. Lemma 3 glues them to give $x + t u in P \( G \)$, so $ker cal(Q) subset.eq U_x$. In particular, all tight parent cuts are preserved, including those crossing $S$: their nonnegative slacks cannot change in opposite signs under these two feasible perturbations.
  There is one dependence between the two quotient requirements. The cut-sum functionals
  $ ell_i : bb(R)^(A_i) \/ U_i arrow.r bb(R) \, #h(2em) ell_i \( z + U_i \) = sum_(e in C) z_e $
  are well-defined because every child direction preserves the degree of the contracted vertex. Each is nonzero, as the class of a unit vector on any cut label has value one. For every $u in bb(R)^A$,
  $ ell_1 \( r_1 \( u \) + U_1 \) = sum_(e in C) u_e = ell_2 \( r_2 \( u \) + U_2 \) . $
  Thus the image of $cal(Q)$ lies in the kernel of the nonzero functional $\( v_1 \, v_2 \) mapsto ell_1 \( v_1 \) - ell_2 \( v_2 \)$. This kernel has codimension one in the full quotient target. Rank–nullity and induction now give
  $ s_A - d \( x \) & = "codim" U_x lt.eq "codim" ker cal(Q) = "rank" cal(Q)\
 & lt.eq "codim" U_1 + "codim" U_2 - 1\
 & lt.eq \( 3 n_1 \/ 2 - 2 \) + \( 3 n_2 \/ 2 - 2 \) - 1 = 3 n \/ 2 - 2 . $
  For $n gt.eq 4$, this is at most $2 \( n - 2 \)$. The order-two simplex and the empty graph give the remaining assertions. ◻
]

=== 11.3 The exact fractional residual cases <the-exact-fractional-residual-cases>

For a general point $x in P \( G \)$, put

$ E_f \( x \) = { e in E : 0 < x_e < 1 } . $

Let $V_f \( x \)$ be the set of vertices incident to these fractional edges, and put $s_f = \| V_f \( x \) \|$. The following consequence isolates the coordinates needed for the entropy estimate.

#thm([Corollary 11.3.])[
  (Fractional coordinates).  #emph[For every $x in P \( G \)$, the integer $s_f$ is even, and 
#[#set math.equation(numbering: n => "(56)")
 $ d \( x \) gt.eq cases(delim: "{", \| E_f \( x \) \| - 2 \( s_f - 2 \) \, & s_f gt.eq 4 \,, \| E_f \( x \) \| - 1 \, & s_f = 2 \,, 0 \, & s_f = 0 \,) #h(2em) sum_(e in E_f \( x \)) x_e = s_f / 2 . $ <a:eq-fractional-dimension>]

]
] <a:cor-fractional-dimension>

#proof[
  An edge with value one exhausts the degree equation at both its endpoints, so neither endpoint meets a fractional edge. Conversely, at a vertex outside $V_f \( x \)$, all incident coordinates are zero or one and sum to one. Exactly one of those edges has value one. Thus the vertices outside $V_f \( x \)$ are covered by disjoint fixed edges, and $s_f$ is even.
  Let $H$ be the graph with vertex set $V_f \( x \)$ and edge set $E_f \( x \)$, and let $macron(x)$ be the restriction of $x$ to $E_f \( x \)$. A matching law with mean $x$ uses every value-one edge and no value-zero edge with probability one. Deleting the fixed edges therefore gives a perfect matching law on $H$ with mean $macron(x)$, whose coordinates are all positive. Conversely, adjoining the fixed edges to any perfect matching of $H$ gives a perfect matching of $G$. This affine extension of $P \( H \)$ into $P \( G \)$ sends $macron(x)$ to $x$, and its linear part injects the two-sided direction space at $macron(x)$ into $T \( x \)$.
  If $s_f gt.eq 4$, Proposition 30 now gives
  $ d \( x \) gt.eq dim T \( macron(x) \) gt.eq \| E_f \( x \) \| - 2 \( s_f - 2 \) . $
  If $s_f = 2$, the residual graph consists of $k = \| E_f \( x \) \| gt.eq 2$ distinguished parallel edges. Its polytope is the simplex ${ z gt.eq 0 : sum_e z_e = 1 }$, and the positive point $macron(x)$ has direction dimension $k - 1$. Hence $d \( x \) gt.eq k - 1 = \| E_f \( x \) \| - 1$. If $s_f = 0$, the point is a matching vector and the dimension inequality is immediate; the minimal face is the singleton consisting of that matching vector.
  Finally, each vertex of $V_f \( x \)$ has total fractional incident value one. Summing these degree equations counts each fractional edge twice, giving the second identity in Equation (56). ◻
]

=== 11.4 The coefficient-three and coefficient-four covariance proofs <the-coefficient-three-and-coefficient-four-covariance-proofs>

The coarser dimension estimates above already imply the following entropy bounds. We use the continuity and face-law results from Lemmas 8 and 9, and the entropy comparison in Equation (12). The calculation keeps fixed coordinates in the ambient space and takes derivatives only on the fractional coordinates. It therefore displays directly how the exact residual cases distinguish coefficients three and four.

#thm([Theorem 11.4.])[
  (Separable entropy bounds by covariance).  #emph[Let $G$ be a finite loopless labelled multigraph of even order $n = 2 m$, with a nonempty perfect-matching family. With natural logarithms and continuous endpoint conventions, define 
$ J_c \( x \) = F \( x \) - c B \( x \) = sum_(e in E) #scale(x: 120%, y: 120%)[\[] - x_e ln x_e + c \( 1 - x_e \) ln \( 1 - x_e \) #scale(x: 120%, y: 120%)[\]] . $

 For each $c in { 3 \, 4 }$ and every $x in P \( G \)$, 
#[#set math.equation(numbering: n => "(57)")
 $ J_c \( x \) lt.eq H \( x \) lt.eq F \( x \) + B \( x \) . $ <a:eq-separable-bounds>]

 For $n = 0$, all displayed quantities are zero.]
] <a:thm-separable>

#proof[
  The empty graph gives the stated trivial case. Assume $n gt.eq 2$. For the upper bound, regard a matching law with mean $x$ as a law on ${ 0 \, 1 }^E$, giving zero probability to nonmatching vectors. Compare it with independent Bernoulli coordinates of respective means $x_e$. This product law is positive wherever the matching law is positive: a coordinate with mean zero or one is necessarily fixed at that value under both laws. Equation (12) now gives the upper bound.
  For the lower bound, fix either $c = 3$ or $c = 4$. Lemma 8 and continuity of $J_c$ imply that $H - J_c$ attains its minimum on the compact set $P$. At an integral mean the only possible law is the point mass at that matching vector, so $H = J_c = 0$. It suffices to rule out a fractional minimizer.
  Suppose, then, that $x$ is such a minimizer. Take its positive maximizing law $p$ and a parameter $theta$ from Lemma 9. For any $v in bb(R)^E$ and $t in bb(R)$, define
  $ p_a \( t \) = frac(exp \( \( theta + t v \) dot.op a \), sum_(b in cal(A)_x) exp \( \( theta + t v \) dot.op b \)) \, #h(2em) x \( t \) = sum_(a in cal(A)_x) p_a \( t \) a . $
  The same lemma shows that $x \( t \)$ stays in the relative interior of $F_x$ and
  #[#set math.equation(numbering: n => "(58)")
   $ H \( x \( t \) \) = Phi \( t \) - \( theta + t v \) dot.op x \( t \) \, #h(2em) Phi \( t \) = ln sum_(a in cal(A)_x) exp \( \( theta + t v \) dot.op a \) . $ <a:eq-tilted-entropy>]
  Thus we may differentiate along these curves without assuming differentiability of $H$ across faces.
  Let
  $ C = sum_(a in cal(A)_x) p_a \( a - x \) \( a - x \)^(sans(T)) $
  be the covariance matrix at $t = 0$. Differentiating the finite sums gives $p'_a \( 0 \) = p_a thin v dot.op \( a - x \)$, hence $x' \( 0 \) = C v$. For any $w in bb(R)^E$,
  $ w^(sans(T)) C w = sum_(a in cal(A)_x) p_a #scale(x: 120%, y: 120%)[\(] w dot.op \( a - x \) #scale(x: 120%, y: 120%)[\)]^2 . $
  All $p_a$ are positive, and $"span" { a - x : a in cal(A)_x } = T \( x \)$. Since $C$ is symmetric, it follows that
  #[#set math.equation(numbering: n => "(59)")
   $ ker C = T \( x \)^perp \, #h(2em) "im" C = T \( x \) \, #h(2em) "rank" C = d \( x \) . $ <a:eq-covariance-face-space>]
  At a fractional mean, some coordinate has variance $C_(e e) = x_e \( 1 - x_e \) > 0$, so $d \( x \) gt.eq 1$. Also $x'' \( 0 \) in T \( x \)$, because the whole curve lies in $"aff" F_x = x + T \( x \)$.
  On the fractional coordinates, write
  $ g_e = - ln x_e - c ln \( 1 - x_e \) - \( c + 1 \) \, #h(2em) D_(e e) = - 1 / x_e + frac(c, 1 - x_e) \; $
  let $D$ be diagonal, and set $g_e = D_(e e) = 0$ on the other coordinates. These entries represent the derivatives of $J_c$ restricted to the face. Indeed, a coordinate with $x_e in { 0 \, 1 }$ has that value on every face atom, so its contribution to $J_c \( x \( t \) \)$ is constantly zero. A fractional coordinate takes both bit values among the face atoms; positivity of $p \( t \)$ keeps $0 < x_e \( t \) < 1$ for every finite $t$. Consequently the usual chain rule on fractional coordinates gives all derivatives of $J_c \( x \( t \) \)$.
  From $Phi' \( t \) = v dot.op x \( t \)$ and Equation (58), we obtain
  $ frac(d, d t) H \( x \( t \) \) = - \( theta + t v \) dot.op x' \( t \) . $
  Both signs of $t$ are permitted. The minimum property at $t = 0$ therefore gives
  $ \( theta + g \) dot.op C v = 0 #h(2em) upright("for every ") v in bb(R)^E . $
  By Equation (59), $theta + g$ is orthogonal to $T \( x \)$, and in particular $\( theta + g \) dot.op x'' \( 0 \) = 0$. The second derivative at the minimum is accordingly
  #[#set math.equation(numbering: n => "(60)")
   $ 0 & lt.eq frac(d^2, d t^2) #scale(x: 120%, y: 120%)[\(] H \( x \( t \) \) - J_c \( x \( t \) \) #scale(x: 120%, y: 120%)[\)]\|_(t = 0)\
 & = - v^(sans(T)) C v - \( theta + g \) dot.op x'' \( 0 \) - \( C v \)^(sans(T)) D \( C v \)\
 & = - v^(sans(T)) C v - \( C v \)^(sans(T)) D \( C v \) . $ <a:eq-entropy-second-variation>]
  Let $u_1 \, dots.h \, u_d$ be orthonormal eigenvectors for the positive eigenvalues $lambda_1 \, dots.h \, lambda_d$ of $C$, where $d = d \( x \)$. Substituting $v = u_i$ in Equation (60) and dividing by $lambda_i > 0$ gives $lambda_i u_i^(sans(T)) \( - D \) u_i gt.eq 1$. Summing and using $C = sum_(i = 1)^d lambda_i u_i u_i^(sans(T))$, we find
  #[#set math.equation(numbering: n => "(61)")
   $ d \( x \) lt.eq sum_(i = 1)^d lambda_i u_i^(sans(T)) \( - D \) u_i = "tr" \( C \( - D \) \) . $ <a:eq-entropy-trace-lower>]
  Only the spectral decomposition of $C$ is used here; no inverse of $C$, or simultaneous diagonalization of $C$ and $D$, is needed.
  Each matching coordinate is Boolean, so $C_(e e) = x_e \( 1 - x_e \)$. Writing $s_f$ for the number of vertices incident with $E_f \( x \)$, Corollary 31 gives
  #[#set math.equation(numbering: n => "(62)")
   $ "tr" \( C \( - D \) \) & = sum_(e in E_f \( x \)) x_e \( 1 - x_e \) (1 / x_e - frac(c, 1 - x_e))\
 & = \| E_f \( x \) \| - \( c + 1 \) sum_(e in E_f \( x \)) x_e = \| E_f \( x \) \| - frac(c + 1, 2) s_f . $ <a:eq-covariance-trace-c>]
  For $c = 4$, the weaker consequence $d \( x \) gt.eq \| E_f \( x \) \| - 2 s_f$ of the residual dimension bound suffices:
  $ "tr" \( C \( - D \) \) = \| E_f \( x \) \| - 5 / 2 s_f < \| E_f \( x \) \| - 2 s_f lt.eq d \( x \) \, $
  because a fractional point has $s_f > 0$. For $c = 3$, the trace is $\| E_f \( x \) \| - 2 s_f$, so we use the exact residual cases. If $s_f gt.eq 4$, then
  $ d \( x \) gt.eq \| E_f \( x \) \| - 2 \( s_f - 2 \) = \| E_f \( x \) \| - 2 s_f + 4 > "tr" \( C \( - D \) \) . $
  If $s_f = 2$, then
  $ d \( x \) gt.eq \| E_f \( x \) \| - 1 > \| E_f \( x \) \| - 4 = "tr" \( C \( - D \) \) . $
  These exhaust the positive even values of $s_f$. For either coefficient, the result contradicts Equation (61). Thus no fractional minimizer exists; the minimum is attained at an integral mean and equals zero. This proves the lower bound for each coefficient by its own covariance contradiction. ◻
]

=== 11.5 Two other entropy comparisons <two-other-entropy-comparisons>

The covariance comparisons just proved give separable counting estimates and a short scalar proof of the nonlinear bound. We give those deductions here before the distinct normalized-covariance proof in Appendix 12. As in Section 4, $N \( G \)$ denotes the number of labelled perfect matchings, and $B \( x \) lt.eq m$ by Equation (20).

#thm([Corollary 11.5.])[
  (Separable and nonlinear consequences).  #emph[For every $x in P \( G \)$ with $\| V \( G \) \| = n = 2 m > 0$, 
#[#set math.equation(numbering: n => "(63)")
 $ F \( x \) - 4 B \( x \) & lt.eq F \( x \) - 3 B \( x \) lt.eq H \( x \) lt.eq F \( x \) + B \( x \) \,\
F \( x \) - H \( x \) & lt.eq min { F \( x \) \, 3 m } lt.eq 8 m #scale(x: 120%, y: 120%)[\(] 1 - e^(- F \( x \) \/ m) #scale(x: 120%, y: 120%)[\)] . $ <cons:legacy-separable>]

 Furthermore, 
#[#set math.equation(numbering: n => "(64)")
 $ ln N \( G \) lt.eq max_(x in P \( G \)) \[ F \( x \) + B \( x \) \] lt.eq ln N \( G \) + 2 n lt.eq ln N \( G \) + 5 / 2 n . $ <cons:legacy-bin-gap>]

]
] <cons:legacy-defect>

#proof[
  Theorem 32 proves $F - 3 B lt.eq H lt.eq F + B$ by the contraction and covariance route; its coefficient-four proof gives $F - 4 B lt.eq H$ as well. Since $B gt.eq 0$, the first two terms are ordered as displayed. Nonnegativity of entropy and $B lt.eq m$ give $F - H lt.eq min { F \, 3 m }$. Put $t = F \( x \) \/ m gt.eq 0$ and $f \( t \) = 8 \( 1 - e^(- t) \)$. On $\[ 0 \, ln 2 \]$, one has $f \( 0 \) = 0$ and $f' \( t \) = 8 e^(- t) gt.eq 4 gt.eq 1$, hence $f \( t \) gt.eq t$. For $t gt.eq ln 2$, one has $f \( t \) gt.eq 4 gt.eq 3$. Thus $min { t \, 3 } lt.eq f \( t \)$, proving the nonlinear inequality including $t = 0$. This deduction is independent of the normalized inverse-covariance proof of Theorem 36.
  For the optimized bound, $H lt.eq ln N$ and $\( F + B \) - \( F - 3 B \) = 4 B lt.eq 4 m = 2 n$ give the upper error $2 n$. Using $F - 4 B$ instead gives the separate original comparison $\( F + B \) - \( F - 4 B \) = 5 B lt.eq 5 m = 5 n \/ 2$. The uniform matching law supplies the lower bound exactly as in Corollary 13. The sharper error $3 m - 2$ in that corollary improves both comparisons on the same domain. ◻
]

=== 11.6 Structural estimates from the other entropy bounds <structural-estimates-from-the-other-entropy-bounds>

For $k gt.eq 1$, put $b_1 = 1$ and $b_k = k \( 1 - 1 \/ k \)^(3 \( k - 1 \))$ for $k gt.eq 2$.

#thm([Corollary 11.6.])[
  (Coefficient-three and nonlinear counts).  #emph[A loopless labelled multigraph $G$ on $2 m > 0$ vertices containing $k gt.eq 1$ pairwise edge-disjoint perfect matchings satisfies 
#[#set math.equation(numbering: n => "(65)")
 $ N \( G \) & gt.eq b_k^m gt.eq \( e^(- 3) k \)^m \,\
N \( G \) & gt.eq #scale(x: 120%, y: 120%)[\[] k exp { - 8 \( 1 - 1 \/ k \) } #scale(x: 120%, y: 120%)[\]]^m gt.eq \( e^(- 8) k \)^m . $ <cons:legacy-three-count>]

 The same two conclusions hold when $G$ is $k$-regular and every odd cut has at least $k$ edges.]
] <cons:legacy-counts>

#proof[
  For the selected matching mixture in Theorem 14, $F \( x \) = m ln k$ and $x$ vanishes outside their labelled union. For $k gt.eq 2$, $F \( x \) - 3 B \( x \) = m ln k + 3 m \( k - 1 \) ln \( 1 - 1 \/ k \)$. Using $H \( x \) lt.eq ln N \( G \)$ and the coefficient-three inequality in Corollary 33, then exponentiating, gives the first bound. The inequality $\( k - 1 \) ln \( 1 - 1 \/ k \) gt.eq - 1$ from the proof of Theorem 14 gives its coarse form. At $k = 1$ the selected matching gives $N \( G \) gt.eq 1 = b_1^m$.
  At this same mean, the nonlinear inequality gives $ln N \( G \) gt.eq m ln k - 8 m \( 1 - 1 \/ k \)$, including $k = 1$. Exponentiating and using $1 - 1 \/ k lt.eq 1$ proves the second line. For a regular graph satisfying the odd-cut hypothesis, Corollary 15 proves that the uniform vector is feasible; the same evaluations then prove both statements without requiring a partition of the edges into perfect matchings. Its cut-parity argument also proves the $\( k - 1 \)$-edge-connected even-order case. ◻
]

For $k gt.eq 2$, the finite-order bound of Theorem 14 implies the coefficient-three bound directly, since $0 < 1 - 1 \/ k < 1$ and $2 \( m - 1 \) \( k - 1 \) lt.eq 3 m \( k - 1 \)$. The coefficient-three logarithmic loss is at most $3$, while $8 \( 1 - 1 \/ k \) gt.eq 4$ for $k gt.eq 2$, so it also dominates the second displayed base. We have nevertheless derived that base from the nonlinear inequality to retain the distinct implication. At $k = 1$, the refined bounds $b_1^m$ and $\[ k exp { - 8 \( 1 - 1 \/ k \) } \]^m$ both equal one.

#thm([Corollary 11.7.])[
  (An exact partition of the ambient edges).  #emph[If the entire edge set of a loopless labelled graph on $2 m > 0$ vertices is partitioned by $k gt.eq 1$ perfect matchings, then 
$ N \( G \) gt.eq #scale(x: 120%, y: 120%)[\[] k exp { - 8 \( 1 - 1 \/ k \) } #scale(x: 120%, y: 120%)[\]]^m gt.eq \( e^(- 8) k \)^m . $

 When $k = 1$ the count is exactly one. If $k = 0$ and the order is positive, the graph is edgeless and its count is zero; only the coarse bound is then asserted. On the empty vertex set there is one empty matching.]
] <cons:legacy-partition>

#proof[
  The partition provides the hypothesis of Corollary 34; its uniform law has marginal $1 \/ k$ on every ambient edge. Thus the nonlinear proof just given applies verbatim. For $k = 1$ the entire graph is a single perfect matching. For $k = 0$ it has no edges. The empty case follows directly from the definition of a matching and does not use expressions containing $1 \/ m$. ◻
]

The exact-partition hypothesis in the last corollary is stronger than containing a selected union. In particular, a graph containing one perfect matching may have more than one, whereas the exact one-matching union has count one.

== 12 A normalized-covariance proof of the nonlinear entropy bound <b:section>

We give a direct proof of the entropy-dependent estimate using the supported-face codimension bound from Proposition 30. The normalization below makes the marginal-entropy Hessian equal to minus the identity, while the covariance trace has an exact combinatorial value. These two identities lead to a contradiction at any positive maximum of the proposed entropy defect. The scalar deduction in Corollary 33 is a separate proof of the same bound.

Throughout this appendix, $G = \( V \, E \)$ is a finite loopless multigraph on $2 m > 0$ vertices with at least one perfect matching. Parallel edges have distinct labels. Write $cal(M)$ for its perfect matchings, $a \( M \) = upright(bold(1))_M$, and $P = P \( G \) = "conv" { a \( M \) : M in cal(M) }$. Recall that, with natural logarithms and $0 ln 0 = 0$,

$ F \( y \) = - sum_(e in E) y_e ln y_e \, #h(2em) H \( y \) = max_(p upright(" a probability law on ") cal(M)\
sum_M p_M a \( M \) = y) (- sum_(M in cal(M)) p_M ln p_M) . $

To distinguish entropy of a law from its maximum at a prescribed mean, write $"Ent" \( p \) = - sum_M p_M ln p_M$.

#thm([Theorem 12.1.])[
  (Nonlinear entropy bound).  #emph[For every $y in P \( G \)$, 
#[#set math.equation(numbering: n => "(66)")
 $ F \( y \) - H \( y \) lt.eq 8 m #scale(x: 120%, y: 120%)[\(] 1 - e^(- F \( y \) \/ m) #scale(x: 120%, y: 120%)[\)] . $ <b:eq-nonlinear>]

]
] <b:thm-nonlinear>

The attainment and continuity of $H$ on the whole polytope follow from Lemma 8. In particular, a continuous defect has a maximum even when that maximum lies on a proper face. The proof below combines the codimension bound with that lemma, the face description, and the exponential law of Lemma 9. These inputs are independent of Theorem 1.

=== 12.1 The face at a hypothetical positive maximum <b:positive-maximum>

#proof[
  Define
  $ f \( t \) = 8 \( 1 - e^(- t) \) \, #h(2em) Psi \( y \) = F \( y \) - H \( y \) - m f #scale(x: 120%, y: 120%)[\(] F \( y \) \/ m #scale(x: 120%, y: 120%)[\)] . $
  Suppose that $Psi$ is positive somewhere. By Lemma 8, it has a positive maximum at some $x in P$. Let $F_x$ be the minimal face containing $x$, and put
  $ A = { e in E : x_e > 0 } \, #h(2em) s = \| A \| \, #h(2em) d = dim F_x \, #h(2em) t = F \( x \) \/ m . $
  Here $s$ counts supported #emph[edges]. Each matching has exactly $m$ edges, so $sum_e x_e = m$ and $0 lt.eq x_e lt.eq 1$. Concavity of $- u ln u$ gives
  $ 0 lt.eq t lt.eq ln \( s \/ m \) . $
  On $\[ 0 \, ln 8 \]$, we have $f \( 0 \) = 0$ and $f' \( t \) gt.eq 1$, so $f \( t \) gt.eq t$. Since $H \( x \) gt.eq 0$, positivity of $Psi \( x \)$ therefore forces $t > ln 8$, and hence $s > 8 m$. The supported-face estimate of Proposition 30 now yields
  #[#set math.equation(numbering: n => "(67)")
   $ d gt.eq s - 4 m > s / 2 > 0 . $ <b:eq-large-dimension>]
  Thus all integral and low-entropy cases have already been excluded before any covariance inverse is introduced.
  Let
  $ cal(M)_x = { M in cal(M) : a \( M \) in F_x } . $
  Every law whose mean is in $F_x$ is supported on $cal(M)_x$. Indeed, each inequality active on this face has nonnegative slack at every matching vector. Expected slack zero forces every atom of positive probability to satisfy its equality. This applies to both zero coordinates and tight odd cuts. Consequently $F_x = "conv" { a \( M \) : M in cal(M)_x }$.
  Discard the coordinates outside $A$ and set
  #[#set math.equation(numbering: n => "(68)")
   $ D = "diag" \( x_e : e in A \) \, #h(2em) cal(T) = D^(- 1 \/ 2) T \( x \) = "span" #scale(x: 120%, y: 120%)[\(] D^(- 1 \/ 2) \( F_x - x \) #scale(x: 120%, y: 120%)[\)] subset.eq bb(R)^A . $ <b:eq-normalization>]
  All diagonal entries of $D$ are positive. By Lemma 5, $x$ is relatively interior to $F_x$. Therefore
  $ z = D^(- 1 \/ 2) \( y - x \) \, #h(2em) y = x + D^(1 \/ 2) z $
  identifies a relative neighborhood of $x$ in the face with a neighborhood of zero in the $d$-dimensional Euclidean space $cal(T)$. Define
  $ b_M = D^(- 1 \/ 2) \( a \( M \) - x \) \, #h(2em) M in cal(M)_x . $
  Their convex hull contains a neighborhood of zero in $cal(T)$. All gradients, Hessians, operator inverses, and operator traces in the remainder of the proof are taken on $cal(T)$. Coordinates with $x_e = 1$ have not been discarded: their centered entries and all tangent directions are zero, so they cause no singularity on this space.
  === 12.2 A finite exponential family on the normalized tangent space <b:exponential-family>
  We now express the face law of Lemma 9 in the normalized coordinates. Let $p$ be the positive maximizing law at $x$, and write its parameter as $theta in bb(R)^A$, restricting to supported coordinates. Since $a \( M \) = x + D^(1 \/ 2) b_M$,
  $ theta dot.op a \( M \) = theta dot.op x + \( D^(1 \/ 2) theta \) dot.op b_M . $
  Every $b_M$ lies in $cal(T)$. Thus only the orthogonal projection $lambda = "proj"_(cal(T)) \( D^(1 \/ 2) theta \)$ affects the normalized law. Define
  $ Phi \( eta \) = ln sum_(M in cal(M)_x) e^(eta dot.op b_M) #h(2em) \( eta in cal(T) \) . $
  The law and its normalized mean then satisfy
  #[#set math.equation(numbering: n => "(69)")
   $ p_M = exp #scale(x: 120%, y: 120%)[\(] lambda dot.op b_M - Phi \( lambda \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) nabla Phi \( lambda \) = 0 . $ <b:eq-exponential-law>]
  The last equality is the zero mean of $b_M$ under $p$. The parameter is finite because the original law is taken on its minimal face.
  For any $eta in cal(T)$, put
  $ p_(eta \, M) = e^(eta dot.op b_M - Phi \( eta \)) \, #h(2em) z \( eta \) = sum_M p_(eta \, M) b_M \, #h(2em) y \( eta \) = x + D^(1 \/ 2) z \( eta \) . $
  This law has exponential parameter $D^(- 1 \/ 2) eta$ in the original coordinates, since the centering term is constant across atoms. Lemma 9 therefore shows that it maximizes entropy at its own mean $y \( eta \)$ and remains on the same minimal face. Differentiating the finite sum defining $Phi$ yields
  #[#set math.equation(numbering: n => "(70)")
   $ z \( eta \) & = nabla Phi \( eta \) \,\
H \( y \( eta \) \) & = Phi \( eta \) - eta dot.op z \( eta \) \,\
C \( eta \) & := nabla^2 Phi \( eta \) = "Cov"_(p_eta) \( b_M \) . $ <b:eq-mean-entropy-covariance>]
  Each $C \( eta \)$ is positive definite on $cal(T)$. Indeed, zero variance in a direction $u in cal(T)$ would make $u dot.op b_M$ constant on all face atoms because $p_eta$ is positive. The affine span of the $b_M$ is $cal(T)$, so this forces $u = 0$. Write $C = C \( lambda \)$.
  === 12.3 The second variation and its trace <b:second-variation>
  We have a positive definite covariance on a space of dimension $d > s \/ 2$. We now compare its inverse with the marginal-entropy Hessian. This comparison uses the smooth exponential parameter; it does not require differentiability of $H$ across faces.
  Set
  $ hat(F) \( z \) = F \( x + D^(1 \/ 2) z \) \, #h(2em) L \( z \) = hat(F) \( z \) - m f #scale(x: 120%, y: 120%)[\(] hat(F) \( z \) \/ m #scale(x: 120%, y: 120%)[\)] . $
  These functions are smooth near zero on $cal(T)$. In the retained coordinates, the Hessian of $F$ at $x$ is $- D^(- 1)$. The change of coordinates in Equation (68) therefore gives
  #[#set math.equation(numbering: n => "(71)")
   $ nabla^2 hat(F) \( 0 \) = - I_(cal(T)) . $ <b:eq-normalized-hessian>]
  By Equation (70), the smooth function
  $ J \( eta \) = L \( z \( eta \) \) - Phi \( eta \) + eta dot.op z \( eta \) = Psi \( y \( eta \) \) $
  has a local maximum at $lambda$. Its gradient is
  $ nabla J \( eta \) = C \( eta \) #scale(x: 120%, y: 120%)[\(] nabla L \( z \( eta \) \) + eta #scale(x: 120%, y: 120%)[\)] . $
  Since $C$ is invertible and $z \( lambda \) = 0$, stationarity implies $nabla L \( 0 \) + lambda = 0$. Differentiating once more at $lambda$, the derivative of $C \( eta \)$ is multiplied by this zero vector. Thus the second-derivative test gives
  $ nabla^2 J \( lambda \) = C nabla^2 L \( 0 \) C + C prec.curly.eq 0 . $
  Congruence by $C^(- 1)$, as an operator on $cal(T)$, yields
  #[#set math.equation(numbering: n => "(72)")
   $ nabla^2 L \( 0 \) + C^(- 1) prec.curly.eq 0 . $ <b:eq-hessian-inequality>]
  Under $p = p_lambda$, the normalized vector $b_M$ has mean zero. For each edge $e$, its indicator in the random matching has variance $x_e \( 1 - x_e \)$, so
  #[#set math.equation(numbering: n => "(73)")
   $ "tr"_(cal(T)) C = bb(E)_p parallel b_M parallel_2^2 = sum_(e in A) frac(x_e \( 1 - x_e \), x_e) = s - m . $ <b:eq-covariance-trace>]
  The trace on $cal(T)$ equals the ambient trace because all the vectors $b_M$ lie in $cal(T)$. For $u > 0$, the inequality $u^(- 1) gt.eq 2 - u$ follows from $\( u - 1 \)^2 \/ u gt.eq 0$. Applying it to the $d$ positive eigenvalues of $C$ gives
  #[#set math.equation(numbering: n => "(74)")
   $ "tr"_(cal(T)) \( - I_(cal(T)) + C^(- 1) \) & gt.eq d - "tr"_(cal(T)) C\
 & = d - s + m gt.eq - 3 m . $ <b:eq-inverse-trace>]
  The last inequality is again the supported-face codimension bound.
  It remains to include the nonlinear correction. Writing $g = nabla hat(F) \( 0 \)$, the full chain rule is
  #[#set math.equation(numbering: n => "(75)")
   $ nabla^2 #h(-0.16667em) [m f #scale(x: 120%, y: 120%)[\(] hat(F) \( z \) \/ m #scale(x: 120%, y: 120%)[\)]]\|_(z = 0) = - f' \( t \) I_(cal(T)) + frac(f'' \( t \), m) g g^(sans(T)) . $ <b:eq-rank-one-correction>]
  In particular, the rank-one term has trace $f'' \( t \) parallel g parallel_2^2 \/ m lt.eq 0$. Since $t lt.eq ln \( s \/ m \)$, we also have $f' \( t \) = 8 e^(- t) gt.eq 8 m \/ s$. Combining Equations (67), (74), and (75), we obtain
  #[#set math.equation(numbering: n => "(76)")
   $ "tr"_(cal(T)) #scale(x: 120%, y: 120%)[\(] nabla^2 L \( 0 \) + C^(- 1) #scale(x: 120%, y: 120%)[\)] & gt.eq - 3 m + f' \( t \) d\
 & gt.eq - 3 m + frac(8 m d, s) > m > 0 . $ <b:eq-strict-contradiction>]
  This contradicts the negative semidefiniteness in Equation (72). Hence $Psi \( y \) lt.eq 0$ throughout $P$, proving Theorem 36. ◻
]

The theorem assumes $m > 0$ because its formula divides by $m$. On the empty vertex set, the unique empty matching has $F = H = 0$; its entropy statement is handled separately without that quotient. If a nonempty graph has no perfect matching, there are no means in $P \( G \)$ to which the theorem applies.

== 13 A convention allowing singleton loops <c:app-loops>

Suppose a loop is allowed to cover its single incident vertex. Let $ell_i$ be the number of distinguished loop choices at vertex $i$, and retain the multiplicities $k_({ i \, j })$ for pairs of distinct vertices. All these integers are given in binary. A matching under this convention covers every vertex exactly once by either a chosen loop or an ordinary pair. Write $N_j$ for the number of such matchings using exactly $j$ loops, and $N_(upright("loop")) = sum_(j = 0)^n N_j$.

#thm([Proposition 13.1.])[
  #emph[There is one deterministic algorithm which, given a graph on $n$ vertices with nonnegative binary integer pair and singleton-loop multiplicities, returns a nonnegative rational number $A_(upright("loop"))$ such that 
$ N_(upright("loop")) / 2^(18 n) lt.eq A_(upright("loop")) lt.eq N_(upright("loop")) . $

 It returns zero exactly when $N_(upright("loop")) = 0$. Its running time and output length are polynomial in the input bit length, including when the input gives $n$ in binary and lists only the positive pair and loop records.]
] <c:prop-loops>

#proof[
  First count the distinct vertices occurring in a positive ordinary pair or having a positive loop count. If any of the $n$ vertices is missing, it cannot be covered, so return zero. This test uses only the listed records, without enumerating the vertex set. Otherwise, if there are $r$ positive pair records and $s$ positive loop records, then $n lt.eq 2 r + s$. Thus the constructions indexed by vertices below have size polynomial in the input length, even for a compact binary vertex count.
  For each $j in { 0 \, dots.h \, n }$, construct an ordinary loopless graph $G_j$ by adjoining $j$ labeled new vertices. Keep all original edges between distinct vertices. There are no edges among the new vertices, and the pair joining original vertex $i$ to any new vertex has multiplicity $ell_i$. Label these parallel edges by the corresponding original loop choices.
  Every perfect matching of $G_j$ pairs the new vertices to $j$ distinct original vertices. Replace those pairs by their labeled loop choices and retain the other edges; this gives a matching counted by $N_j$. Conversely, each matching counted by $N_j$ has exactly $j !$ lifts, one for each bijection from the new vertices to its $j$ loop-covered vertices. Edge labels preserve the loop choices independently of this bijection. Thus, including $j = 0$,
  #[#set math.equation(numbering: n => "(77)")
   $ N \( G_j \) = j ! thin N_j . $ <c:eq-loop-count-identity>]
  Run the ordinary algorithm on each $G_j$, obtaining a nonnegative integer $A_j$, and return
  #[#set math.equation(numbering: n => "(78)")
   $ A_(upright("loop")) = sum_(j = 0)^n frac(A_j, j !) . $ <c:eq-loop-estimate>]
  Parity is tested on each transformed order $n + j$, as part of that ordinary algorithm. There is no initial rejection for odd $n$: a single vertex with a loop is already a positive-count example. The parity of $n + j$ equals that of the number $n - j$ of original vertices that remain to be paired by ordinary edges.
  By Theorem 1.2 and Equation (77),
  $ N_j / 512^(thin n + j) lt.eq frac(A_j, j !) lt.eq N_j . $
  Since $n + j lt.eq 2 n$, summing these inequalities proves the claimed factor $512^(2 n) = 2^(18 n)$. All terms are nonnegative, and $A_j = 0$ exactly when $N_j = 0$, so zero recognition is also exact.
  The construction retains compressed multiplicity records: $G_j$ has at most $r + j s$ positive pair records. No parallel-edge list is expanded. Each transformed graph has at most $2 n$ vertices and uses only multiplicities already present in the input. If $b_max$ is the largest binary exponent of any positive pair or loop multiplicity, taking $b_max = 0$ when all multiplicities are zero, Proposition 28 bounds each call and gives $O \( n^2 + n b_max + 1 \)$ bits for $A_j$. There are only $n + 1$ calls. The rational sum can be represented exactly with the common denominator $n !$:
  #[#set math.equation(numbering: n => "(79)")
   $ A_(upright("loop")) = frac(sum_(j = 0)^n A_j thin frac(n !, j !), n !) . $ <c:eq-loop-common-denominator>]
  The denominator has $O \( n log_2 \( n + 1 \) + 1 \)$ bits, and the numerator has $O \( n^2 + n b_max + n log_2 \( n + 1 \) + 1 \)$ bits. Factorials, exact integer divisions, products, and the sum therefore take polynomial bit time. The case $n = 0$ uses the single term $j = 0$, with $0 ! = 1$ and $A_0 = 1$, so the empty matching is counted exactly. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
