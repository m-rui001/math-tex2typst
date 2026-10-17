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

#align(center)[#text(size: 16pt, weight: "bold")[A linear list-coloring bound in terms \
of the Hadwiger number]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A clique minor records a form of complete interaction inside a graph: its vertices are represented by disjoint connected sets, and every two sets have an edge between them. For a finite nonempty simple graph $G$, let $h \( G \)$ be the largest order of a clique minor in $G$. Hadwiger conjectured that the chromatic number always satisfies $chi \( G \) lt.eq h \( G \)$ #cite(label("Hadwiger1943")). The companion manuscript #cite(label("OpenAIHadwigerCounterexample2026")) Corollary 1.2 constructs finite simple graphs with $chi \( G \) > h \( G \)$, disproving this ordinary coefficient-one assertion. Its linear relaxation asks whether an absolute constant can replace the coefficient one. We prove a bound of this form even when allowable colors vary from vertex to vertex.

A #emph[list assignment] $cal(L)$ assigns a finite set of colors to each vertex. An $cal(L)$-coloring is a proper coloring $c$ satisfying $c \( v \) in cal(L) \( v \)$ at every vertex. The list chromatic number $ell \( G \) = chi_(upright("list")) \( G \)$ is the least integer $k$ for which every assignment with $\| cal(L) \( v \) \| gt.eq k$ is colorable. List coloring was introduced independently by Vizing #cite(label("Vizing1976")) and by Erdős, Rubin, and Taylor #cite(label("ErdosRubinTaylor1980")). The linear list version of Hadwiger’s conjecture was formulated by Kawarabayashi and Mohar #cite(label("KawarabayashiMohar2007")) Conjecture 1.3.

#thm([Theorem 1.1.])[
  #emph[There is an absolute integer $C gt.eq 1$ such that every finite nonempty simple graph $G$ satisfies 
$ ell \( G \) lt.eq C h \( G \) . $

]
] <thm:main>

Thus the Linear List Hadwiger conjecture has an affirmative resolution. The constant is independent of the graph order, the list assignment, and the number of distinct colors appearing in its union. Taking the same list at every vertex immediately gives the ordinary conclusion.

#thm([Corollary 1.2.])[
  #emph[Every finite nonempty simple graph $G$ satisfies $chi \( G \) lt.eq C h \( G \)$, with the constant $C$ in Theorem 1.]
] <cor:ordinary>

#proof[
  A coloring from the common list ${ 1 \, dots.h \, ell \( G \) }$ shows that $chi \( G \) lt.eq ell \( G \)$. ◻
]

=== 1.1 Prior work and the two obstacles <prior-work-and-the-two-obstacles>

The density theorems of Kostochka #cite(label("Kostochka1982")) #cite(label("Kostochka1984")) and Thomason #cite(label("Thomason1984")) show that every $K_t$-minor-free graph has a vertex of degree $O \( t sqrt(log t) \)$, as does each of its subgraphs. Greedy coloring in reverse deletion order therefore gives this bound for arbitrary lists. Norin, Postle, and Song #cite(label("NorinPostleSong2023")) went beyond that degeneracy threshold for ordinary coloring, proving $O \( t \( log t \)^beta \)$ for every fixed $beta > 1 \/ 4$. Norin and Postle #cite(label("NorinPostle2023")) extended such bounds to list coloring using the structure of highly connected minor-free graphs.

The coefficient in a linear list bound has a different role from the coefficient in ordinary Hadwiger’s conjecture. Voigt #cite(label("Voigt1993")) constructed planar graphs that are not $4$-choosable. Barát, Joret, and Wood #cite(label("BaratJoretWood2011")) constructed graphs with no $K_(3 s + 2)$ minor that are not $4 s$-choosable for every integer $s gt.eq 1$, and Steiner #cite(label("Steiner2022List")) proved that for every $epsilon > 0$ and all sufficiently large $t$ there are $K_t$-minor-free graphs with list chromatic number at least $\( 2 - epsilon \) t$. Thus a universal constant in Theorem 1 must be at least two. Our constants are not optimized.

The fractional coloring theorem of Reed and Seymour #cite(label("ReedSeymour1998")) gives $chi_f \( G \) lt.eq 2 h \( G \)$, where fractional coloring permits weighted stable sets in place of color classes. It provides a linear supply of stable sets but does not directly give a linear ordinary or list coloring: naive repeated sampling introduces a factor depending on the graph order. Delcourt and Postle #cite(label("DelcourtPostle2021")) obtained the ordinary bound $O \( t log log t \)$ for graphs excluding a $K_t$ minor and reduced a linear ordinary bound to coloring suitably small subgraphs. Liu and Luo #cite(label("LiuLuo2026")) subsequently proved the ordinary bound $O \( t log log log t \)$ and developed bounded stable-set sampling that we use below.#footnote[Liu and Luo explicitly acknowledge assistance from ChatGPT Codex; their declaration does not identify an underlying model version.] These ordinary-coloring statements do not by themselves give colorings from arbitrary vertex lists.

For list coloring, Postle proved an $O \( t \( log log t \)^6 \)$ bound for $K_t$-minor-free graphs #cite(label("Postle2020")) Theorem 1.8. His separability and woven-minor constructions provide the structural framework for our passage from small graphs to arbitrary orders. Delcourt and Postle outlined an $O \( t \( log log t \)^2 \)$ list bound in the first version of their paper #cite(label("DelcourtPostle2021v1")) Section 6, leaving the details to the reader. In subsequent work posted on October 1, 2026, Gu and Xu #cite(label("GuXu2026")) Theorem 1.3 proved an $O \( t log log t \)$ list bound. Connectivity extraction by the constraint-budget method of Girão and Narayanan #cite(label("GiraoNarayanan2022")), and the highly linked graph theorem of Bollobás and Thomason #cite(label("BollobasThomason1996")), are further key antecedents. We reproduce the list transfer, density, path accounting, and recursion arguments in the forms required here.

Two difficulties remain after these reductions. Even on a small graph, a sampled stable set cannot be given a single color unless that color is available at every vertex receiving it. In a graph of unrestricted order, the paths used to assemble a minor may themselves contain arbitrarily many vertices. Their deletion must therefore be charged through their structure, rather than through their order. The proof addresses these two difficulties separately.

=== 1.2 Proof strategy <proof-strategy>

First, Proposition 9 proves that a $K_t$-minor-free graph on at most $t^(11 \/ 10)$ vertices is $L t$-choosable, for an absolute $L$ and all sufficiently large $t$. We partition the union of all lists into bins, assigning each color to a single bin throughout the graph. A vertex is eligible for a bin precisely when its own list contains a color in that bin. A random partition gives every vertex enough eligible bins at every stage, before any remaining graph is chosen. Lemma 10 then repeatedly halves an upper bound on the fractional chromatic number using sampled stable sets restricted to eligible vertices. Vertices assigned to the same bin lie in one stable set, so each can choose its own allowable color from that bin; colors in different bins cannot conflict.

To prove the thinning lemma, suppose every sampling outcome leaves a fractional chromatic number greater than half the current bound. A deterministic separator decomposition finds a fixed highly connected subgraph in which a remainder still has large expected fractional chromatic number. Independent repetitions produce disjoint private vertex sets, each supporting a clique model. A small, fixed family of matching tests shows that the complement of the union of the sampled remainders remains highly connected. Connecting equally labeled bags through this complement produces the excluded clique minor. The proof uses bounded stable-set sampling and ordinary-chromatic connectivity extraction, with the full argument given in Section 3. Summing the costs of successive halving stages requires only $O \( t \)$ bins.

Second, Lemma 17 extracts highly connected subgraphs with a linear loss of list chromatic number. The additive list-deletion estimate, Lemma 19, reserves colors for a small set and controls its interaction with all remaining vertices. Its probabilistic estimate tests only polynomially many exceptional vertices, independently of the ambient graph order and palette size. Minimum-length path systems give the sparsity needed to apply this estimate even when the paths are long. The density argument also supplies small highly connected subgraphs in which clique models can be built while connecting paths are rerouted.

The sequential construction in Lemma 34 then shows that a graph of sufficiently large list chromatic number either contains the desired clique minor or splits into two disjoint subgraphs retaining nearly all of that list chromatic number. At each step, one small district supplies new adjacencies between model bags and a separate junction joins the paths carrying those bags forward. The deletion estimate applies to the complete history of original minimizing paths, including vertices no longer used by the growing model.

Finally, Theorem 36 builds a clique model whose bags contain prescribed roots, together with paths for prescribed terminal pairs. After reserving the paths for the terminal pairs, the remaining task is a rooted model inside a fresh region. Separability supplies three disjoint districts for recursive calls. Partitioning the root labels into three blocks and assigning one district to each pair of blocks reduces each call to about two thirds as many roots, while every pair of labels still occurs together in one district. Connectivity extraction and the case with no prescribed pairs complete the theorem.

Section 2 fixes the external inputs and probabilistic tools. Section 3 proves the small-graph list bound, and Section 4 establishes list extraction and deletion. Section 5 constructs small highly connected districts; Section 6 develops their routing interfaces. Sections 7 and 8 prove separability and the final recursive theorem. The only structural results used without proof are the fractional minor bound, ordinary-chromatic connectivity extraction, and the terminal grouping theorem, whose precise statements follow.

== 2 Preliminaries and probabilistic tools <sec:preliminaries>

All graphs are finite, simple, and undirected. A #emph[stable set] is a set of pairwise nonadjacent vertices. For a vertex set $X$, write $P \[ X \]$ for the induced subgraph and $P - X = P \[ V \( P \) \\ X \]$. A clique model consists of disjoint nonempty connected vertex sets, called #emph[bags], with an edge between every two bags. Models lift through edge contractions and vertex deletions, so $h$ is nonincreasing under taking minors. Whenever a subgraph is specified by its vertices, it is induced. Adding edges to a connected or highly connected subgraph preserves the corresponding property, so the subgraphs produced below may be replaced by induced subgraphs on their vertices.

A graph is $k$-connected if it has more than $k$ vertices and remains connected after deletion of fewer than $k$ vertices. Such a graph has minimum degree at least $k$. A separator split is a partition $V \( P \) = A dot(union) Z dot(union) A'$, with $A \, A'$ nonempty and anticomplete. If $\| V \( P \) \| > k$ and $P$ is not $k$-connected, there is such a split with $\| Z \| < k$. Deleting $z < k$ vertices from a $k$-connected graph leaves a $\( k - z \)$-connected graph. All logarithms are natural. The null graph has $h = ell = chi = f = 0$. Integer parameters include minor orders, connectivity requirements, and numbers of paths; powers bounding graph orders need not be integers.

=== 2.1 Fractional coloring and established structural results <fractional-coloring-and-established-structural-results>

The fractional chromatic number $f \( P \)$ is the minimum total weight of nonnegative weights on the stable sets of $P$ that cover every vertex with weight at least one. Finite linear-programming duality #cite(label("galekuhntucker1951")) gives

#[#set math.equation(numbering: n => "(1)")
 $ f \( P \) = max {sum_(v in V \( P \)) w \( v \) : w \( v \) gt.eq 0 \, quad sum_(v in I) w \( v \) lt.eq 1 upright(" for every stable set ") I} . $ <eq:fractional-dual>]

The primal is feasible, using singleton stable sets, and has a finite optimum; thus this use of duality has no feasibility or boundedness exception. For $r > 0$, $f \( P \) lt.eq r$ is equivalent to a distribution on stable sets with every vertex included with probability at least $1 \/ r$. Indeed, divide a fractional coloring by $r$ and put any missing mass on the empty set; conversely multiply such a distribution by $r$. Restriction to an induced subgraph cannot increase $f$, and adding one vertex increases it by at most one.

#thm([Theorem 2.1.])[
  (Fractional minor bound).  #emph[Every graph $P$ satisfies $f \( P \) lt.eq 4 h \( P \)$.]
] <thm:fractional>

This follows from the stronger bound $f \( P \) lt.eq 2 h \( P \)$ of Reed and Seymour #cite(label("ReedSeymour1998")) Statement (1.3). We keep the factor four throughout.

#thm([Theorem 2.2.])[
  (Ordinary-chromatic connectivity extraction).  #emph[If $k gt.eq 1$ is an integer and $chi \( P \) gt.eq 7 k$, then $P$ has a $k$-connected subgraph $J$ with $chi \( J \) gt.eq chi \( P \) - 6 k$.]
] <thm:ordinary-extraction>

We use the form stated in #cite(label("DelcourtPostle2021")) Theorem 5.1, attributed there to Girão and Narayanan. There is no minor-exclusion hypothesis. In particular the theorem applies to auxiliary clique blow-ups, which need not inherit any minor exclusion.

#thm([Theorem 2.3.])[
  (Grouping terminals).  #emph[There is an absolute integer $gamma gt.eq 1$ such that the following holds. In a $gamma m$-connected graph, every partition of $m gt.eq 1$ distinct terminals into nonempty groups can be realized by pairwise disjoint connected vertex sets, one containing each group.]
] <thm:grouping>

This is a consequence of the highly linked graph theorem of Bollobás and Thomason #cite(label("BollobasThomason1996")); we use the case with second knitting parameter one in #cite(label("DelcourtPostle2021")) Definition 5.7 and Theorem 5.8. The constant $gamma$ is uniform in the number and sizes of the groups. For a group of size two, a path within its connected set joins its terminals. We will apply this observation to any prescribed pairing of distinct terminals.

=== 2.2 Bounded sampling and concentration <bounded-sampling-and-concentration>

The following real-parameter form of bounded stable-set sampling is convenient. Its integer-parameter form appears in #cite(label("LiuLuo2026")) Lemma 4.1; we include the short proof.

#thm([Lemma 2.4.])[
  #emph[Suppose $\| V \( P \) \| lt.eq n$, where $n gt.eq 1$, and $f \( P \) lt.eq r$, where $r gt.eq 1$. There is a distribution on stable sets $I$ such that 
$ \| I \| lt.eq ceil.l n \/ r ceil.r \, #h(2em) Pr \( v in I \) = frac(1, 2 r) quad \( v in V \( P \) \) . $

]
] <lem:bounded>

#proof[
  Start with a stable-set distribution having inclusion probabilities at least $1 \/ r$. Conditional independent deletion of each included vertex reduces every marginal to exactly $1 \/ r$ and preserves stability. Put $M = ceil.l n \/ r ceil.r$. Partition each resulting stable set $I$ into parts of size at most $M$, assigning its probability mass to each part. This gives a finite measure of total mass at most
  $ bb(E) #scale(x: 120%, y: 120%)[\(] 1 + \| I \| \/ M #scale(x: 120%, y: 120%)[\)] = 1 + \| V \( P \) \| \/ \( r M \) lt.eq 2 . $
  Every vertex still has mass $1 \/ r$. Add mass on the empty set to make the total exactly two and divide by two. ◻
]

We also record the standard bounded-martingale-difference estimate #cite(label("azuma1967")) #cite(label("mcdiarmid1989")), with its short exponential-moment proof.

#thm([Lemma 2.5.])[
  (Bounded differences).  #emph[Let $Z$ be a function of $s gt.eq 1$ independent finite random variables. If changing one variable changes $Z$ by at most $b > 0$, then 
$ Pr #scale(x: 120%, y: 120%)[\(] \| Z - bb(E) Z \| gt.eq u #scale(x: 120%, y: 120%)[\)] lt.eq 2 exp #scale(x: 120%, y: 120%)[\(] - u^2 \/ \( 2 s b^2 \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( u > 0 \) . $

]
] <lem:concentration>

#proof[
  Expose the variables in order. The martingale of conditional expectations has differences of conditional mean zero and absolute value at most $b$. Convexity bounds the conditional exponential moment of a difference at $lambda$ by $cosh \( lambda b \) lt.eq exp \( lambda^2 b^2 \/ 2 \)$. Multiplying these bounds and applying Markov’s inequality with $lambda = u \/ \( s b^2 \)$ gives the upper tail. Apply the same argument to $- Z$ and add the two bounds. ◻
]

=== 2.3 A small family of connectivity tests <a-small-family-of-connectivity-tests>

The next test replaces an enumeration of arbitrary vertex cuts by an enumeration of unions of a few open neighborhoods. The family is fixed before the random deleted set is chosen.

#thm([Lemma 2.6.])[
  (Cut test).  #emph[Let $P$ be a $k$-connected graph on at most $n$ vertices, where $k$ is a sufficiently large integer. Set 
$ s = ⌈10 \( n \/ k \) log \( 2 n \)⌉ . $

 There is a family of at most $\( n + 1 \)^(s + 1)$ matchings, each of size $floor.l k \/ 8 floor.r$, with the following property. If $U subset.eq V \( P \)$, every vertex of $P$ has at least $k \/ 2$ neighbors outside $U$, and fewer than $k \/ 32$ endpoints of each matching belong to $U$, then $P - U$ is $floor.l k \/ 32 floor.r$-connected.]
] <lem:cut-test>

#proof[
  For every set $R$ of at most $s$ vertices, put $B_R = union.big_(v in R) N_P \( v \)$. Whenever both $B_R$ and its complement have size at least $k \/ 3$, fix a matching of size $floor.l k \/ 8 floor.r$ across this cut. Such a matching exists: otherwise the endpoints of a maximal smaller matching form a vertex cover of the crossing edges, of size less than $k \/ 4$. Both sides remain nonempty after their removal, contradicting $k$-connectivity. The number of possible sets $R$, and hence of matchings, is at most $\( n + 1 \)^(s + 1)$.
  The neighborhood assumption ensures that $P - U$ has more than $floor.l k \/ 32 floor.r$ vertices. If it fails the asserted connectivity, there are a set $Z subset.eq V \( P \) \\ U$ with $\| Z \| < k \/ 32$ and nonempty anticomplete sides $A \, A'$ partitioning $V \( P \) \\ \( U union Z \)$. Every vertex of either side has more than $k \/ 3$ neighbors in that same side, since it has at least $k \/ 2$ neighbors outside $U$ and loses fewer than $k \/ 32$ to $Z$. In particular both sides have size at least $k \/ 3$.
  Make $s$ independent uniform draws from $A$. For each vertex $v in A$, the probability that none of the draws is an open neighbor of $v$ is at most $exp \( - k s \/ \( 3 n \) \)$. The union bound over $A$ is less than one by the choice of $s$. Thus the set $R$ of drawn vertices, after repetitions are removed, satisfies $A subset.eq B_R$. Since $A \, A'$ are anticomplete, $A' ∩ B_R = diameter$. The matching fixed for this cut has every edge incident with $U union Z$, for otherwise an edge would join $A$ to $A'$. But $U$ contains fewer than $k \/ 32$ of its endpoints, and $Z$ contains fewer than $k \/ 32$ vertices. They cannot cover its $floor.l k \/ 8 floor.r$ disjoint edges. This contradiction proves the lemma. ◻
]

== 3 List coloring small graphs <small:section>

#thm([Proposition 3.1.])[
  #emph[There are an absolute positive integer $L$ and an absolute integer $t_0$ such that, for every integer $t gt.eq t_0$ and every graph $G$, 
$ h \( G \) < t \, #h(2em) \| V \( G \) \| lt.eq t^(11 \/ 10) quad arrow.r.double quad ell \( G \) lt.eq L t . $

]
] <prop:small-list>

We will color the graph in stages, halving an upper bound on its fractional chromatic number at each stage. For each sampled stable set, only a specified subset of vertices is eligible to be removed. The next lemma allows these eligibility restrictions to be fixed in advance. In the final application they will come from one partition of the actual colors appearing in the lists, chosen before the successive remaining graphs are determined.

#thm([Lemma 3.2.])[
  (Eligible thinning).  #emph[There is an absolute positive integer $B$ such that the following holds for all sufficiently large integers $t$. Let $n \, r$ be real parameters with 
$ 1 lt.eq n lt.eq t^(11 \/ 10) \, #h(2em) frac(t, log t) lt.eq r lt.eq 4 t \, $

 and let $P$ be a graph with $\| V \( P \) \| lt.eq n$, $h \( P \) < t$, and $f \( P \) lt.eq r$. Set 
$ N = ⌈B r log #scale(x: 120%, y: 120%)[\(] 2 max { 1 \, t \/ r } #scale(x: 120%, y: 120%)[\)]⌉ . $

 Suppose $E_1 \, dots.h \, E_N subset.eq V \( P \)$ contain every vertex at least $N \/ 2$ times. There are stable sets $I_1 \, dots.h \, I_N$ of $P$, each of size at most $ceil.l n \/ r ceil.r$, such that 
$ f (P - union.big_(j = 1)^N \( I_j ∩ E_j \)) lt.eq r \/ 2 . $

 The cutoff for $t$ is uniform over $P \, n \, r$ and the eligibility sets.]
] <small:eligible-thinning>

We prove the lemma by contradiction. If every sampled remainder has fractional chromatic number greater than $r \/ 2$, we first find a fixed highly connected subgraph $H$ where a remainder still has large expected fractional chromatic number. Fresh independent remainders then contain disjoint subsets, each carrying a clique model. The complement in $H$ of the union of the remainders remains highly connected. To assemble a $K_t$ model, partition its $t$ labels into small blocks and use one of these disjoint models for each block and each pair of blocks. The complement connects all bags assigned to the same label. Every pair of labels is represented together in one model, so the resulting label sets are adjacent. The estimates below provide the models and the connectivity for this construction.

=== 3.1 Eligible samples and uniform concentration <eligible-samples-and-uniform-concentration>

We prove Lemma 10 with the following fixed choice of $B$. Let $gamma$ be the integer in Theorem 5. Fix

#[#set math.equation(numbering: n => "(2)")
 $ D_0 = 10^6 gamma \, #h(2em) Q_0 = 401^2 \, $ <small:constants>]

and choose a positive integer $B$ such that

#[#set math.equation(numbering: n => "(3)")
 $ B gt.eq 16 \, #h(2em) 2^(B \/ 4) gt.eq max { 2000 \( D_0 + 1 \) \, thin 10^4 Q_0^2 #scale(x: 120%, y: 120%)[}] . $ <small:B-choice>]

These constants remain fixed throughout this section.

Consider an integer $t$ and real parameters $n \, r$ satisfying

#[#set math.equation(numbering: n => "(4)")
 $ 1 lt.eq n lt.eq t^(11 \/ 10) \, #h(2em) frac(t, log t) lt.eq r lt.eq 4 t . $ <small:range>]

Let $P$ be a graph on at most $n$ vertices with $h \( P \) < t$ and $f \( P \) lt.eq r$. Set

#[#set math.equation(numbering: n => "(5)")
 $ y = max { 1 \, t \/ r } \, #h(2em) x = floor.l r \/ 200 floor.r \, #h(2em) q = ceil.l t \/ x ceil.r^2 \, #h(2em) k = ceil.l D_0 t y ceil.r \,\
N = ceil.l B r log \( 2 y \) ceil.r \, #h(2em) M = ceil.l n \/ r ceil.r . $ <small:parameters>]

Here $x$ bounds the size of a label block, $q$ bounds the number of disjoint clique models, and $k$ is the connectivity required of $H$. The parameters $N$ and $M$ are the number of trials and the maximum size of one sampled stable set. We always take $t$ above an absolute cutoff large enough that $r gt.eq 400$. In particular $x gt.eq 1$. The following bounds hold uniformly in (4):

#[#set math.equation(numbering: n => "(6)")
 $ 1 lt.eq y lt.eq log t \, #h(2em) t / y lt.eq r lt.eq frac(4 t, y) \, #h(2em) x gt.eq r / 400 \,\
q lt.eq Q_0 y^2 \, #h(2em) x q lt.eq 403 t y \, #h(2em) D_0 t y lt.eq k lt.eq \( D_0 + 1 \) t y . $ <small:parameter-bounds>]

Indeed, $t \/ x lt.eq 400 t \/ r lt.eq 400 y$, so $ceil.l t \/ x ceil.r lt.eq 401 y$. Also

$ x ceil.l t \/ x ceil.r^2 lt.eq t^2 / x + 2 t + x lt.eq 400 t^2 / r + 2 t + r / 200 lt.eq 403 t y . $

Our choice of $D_0$ consequently gives, for all sufficiently large $t$,

#[#set math.equation(numbering: n => "(7)")
 $ k gt.eq r \, #h(2em) 2 x q < k / 64 \, #h(2em) ⌊k / 32⌋ gt.eq gamma \( 2 x q \) . $ <small:attachment-budget>]

Fix sets $E_1 \, dots.h \, E_N subset.eq V \( P \)$ such that each vertex belongs to at least $N \/ 2$ of them. These are the eligibility sets and are fixed before sampling. Independently for each $j in { 1 \, dots.h \, N }$, sample a stable set $I_j$ from the distribution in Lemma 6, with

$ \| I_j \| lt.eq M \, #h(2em) Pr \( v in I_j \) = frac(1, 2 r) . $

The covered vertices at trial $j$ are $I_j ∩ E_j$, and the remainder is

#[#set math.equation(numbering: n => "(8)")
 $ W = V \( P \) \\ union.big_(j = 1)^N \( I_j ∩ E_j \) . $ <small:remainder>]

For every vertex $v$, independence of the trials and the eligibility condition imply

#[#set math.equation(numbering: n => "(9)")
 $ Pr \( v in W \) lt.eq (1 - frac(1, 2 r))^(N \/ 2) lt.eq p := exp (- frac(N, 4 r)) lt.eq \( 2 y \)^(- B \/ 4) . $ <small:survival>]

In particular, (3) and (6) give

#[#set math.equation(numbering: n => "(10)")
 $ 2 k p lt.eq r / 1000 \, #h(2em) q^2 p lt.eq 10^(- 4) . $ <small:sparseness>]

For the first inequality, divide by $r$ and use

$ frac(2 k p, r) lt.eq 2 \( D_0 + 1 \) y^2 \( 2 y \)^(- B \/ 4) lt.eq 2 \( D_0 + 1 \) 2^(- B \/ 4) . $

For the second, use $q^2 p lt.eq Q_0^2 y^4 \( 2 y \)^(- B \/ 4) lt.eq Q_0^2 2^(- B \/ 4)$.

#thm([Lemma 3.3.])[
  #emph[Take at most $q$ independent copies of the experiment (8). Let $Z$ be any one of the following quantities, where the vertex set $A subset.eq V \( P \)$ is fixed before sampling: 
$ \| A ∩ W_i \| \, #h(2em) lr(|A ∩ union.big_i W_i|) \, #h(2em) f \( P \[ A ∩ W_i \] \) . $

 For each fixed $delta > 0$, and all sufficiently large $t$, 
#[#set math.equation(numbering: n => "(11)")
 $ Pr #scale(x: 120%, y: 120%)[\(] \| Z - bb(E) Z \| gt.eq delta r #scale(x: 120%, y: 120%)[\)] lt.eq 2 exp \( - t^(7 \/ 10) \) \, $ <small:uniform-tail>]

 uniformly over all the data in (4) and all eligibility sets satisfying the stated condition.]
] <small:concentration>

#proof[
  Changing one sampled stable set changes $W_i$ on at most $2 M$ vertices. It changes a union of remainders on at most the same number of vertices. Adding or deleting a vertex changes fractional chromatic number by at most one, so all the quantities in the statement have bounded differences at most $2 M$ per trial.
  For sufficiently large $t$, $r log \( 2 y \) gt.eq 1$, and hence $N lt.eq \( B + 1 \) r log \( 2 y \)$. With $A_0 = 4 Q_0 \( B + 1 \)$, we obtain
  $ q N lt.eq A_0 t y log \( 2 y \) \, #h(2em) M lt.eq 2 t^(1 \/ 10) y . $
  Lemma 7 therefore gives
  $ Pr #scale(x: 120%, y: 120%)[\(] \| Z - bb(E) Z \| gt.eq delta r #scale(x: 120%, y: 120%)[\)] & lt.eq 2 exp (- frac(delta^2 r^2, 2 \( q N \) \( 2 M \)^2))\
 & lt.eq 2 exp (- frac(delta^2 t^(4 \/ 5), 32 A_0 y^5 log \( 2 y \))) . $
  Since $1 lt.eq y lt.eq log t$, the exponent in the last line has magnitude at least $t^(7 \/ 10)$ for all sufficiently large $t$. The cutoff depends only on $delta$ and the fixed constants. Independence between different vertices is not used. ◻
]

All asymptotic probability estimates below are uniform over these data. Only finitely many fixed positive values of $delta$ will be used in Lemma 11, so their cutoffs can be combined.

=== 3.2 Localizing a failure of thinning <localizing-a-failure-of-thinning>

#thm([Lemma 3.4.])[
  #emph[Suppose that every outcome of the experiment (8) having positive probability satisfies $f \( P \[ W \] \) > r \/ 2$. Then there is a fixed induced $k$-connected subgraph $H subset.eq P$ such that 
#[#set math.equation(numbering: n => "(12)")
 $ bb(E) f \( H \[ W ∩ V \( H \) \] \) > r \/ 4 . $ <small:region-expectation>]

 The subgraph $H$ is chosen before any fresh copies of the experiment are sampled.]
] <small:fixed-region>

#proof[
  Build a binary decomposition of $P$, making all choices before sampling. A node is an induced subgraph. Stop at a node of order at most $2 k$, and also at a larger node which is $k$-connected. Otherwise choose a separator of size less than $k$, partition the vertices outside it into two nonempty anticomplete sides, and form two children by adding the separator to each side.
  There are $O \( n^2 + 1 \)$ nodes. To see this, give a node of order $u > 2 k$ potential $u - k$. Each large child’s potential is strictly smaller than its parent’s, since the other exclusive side is nonempty. If both children are large, their potentials sum to at most their parent’s: their orders sum to $u + \| S \| < u + k$, where $S$ is the separator. If just one child is large, its potential alone is at most the parent’s. Thus at each depth the sum of the large-node potentials is at most $n$, while the depth of a large-node branch is at most $n$. The small leaves contribute at most two children per large node, in addition to a possible small root.
  Every separator and every small leaf has order at most $2 k$. Its expected intersection size with $W$ is at most $2 k p lt.eq r \/ 1000$. Lemma 11 and a union bound over the decomposition show that, with probability $1 - o \( 1 \)$, all these intersections have fewer than $r \/ 100$ vertices. If every $k$-connected leaf had expected fractional chromatic number at most $r \/ 4$ after restriction to $W$, the same lemma would give, again with probability $1 - o \( 1 \)$, fractional chromatic number less than $3 r \/ 10$ in every such leaf. A small leaf has this latter bound as well, since its fractional chromatic number is at most its order.
  Fix an outcome satisfying all these conclusions. Write $F = P \[ W \]$. The assumption of the lemma gives $f \( F \) > r \/ 2$, whereas every leaf restriction has fractional chromatic number less than $3 r \/ 10$. We compare these bounds by replacing every vertex of $F$ with a clique of the same large order. Ordinary-chromatic connectivity extraction in this larger graph will produce a subgraph of large chromatic number that cannot cross any of the blown-up separators. It must lie in one blown-up leaf, giving the contradiction.
  For a positive integer $m$, form $F^(\( m \))$ by replacing each vertex of $F$ with a clique of order $m$, and replacing each edge with a complete join between its two replacement cliques. Every color class of $F^(\( m \))$ projects to a stable set of $F$ and uses at most one vertex of each replacement clique. Dividing the multiplicities of these projected stable sets by $m$ therefore gives a fractional coloring of $F$. Consequently
  #[#set math.equation(numbering: n => "(13)")
   $ chi \( F^(\( m \)) \) gt.eq m f \( F \) > m r \/ 2 . $ <small:blowup-lower>]
  For each leaf restriction, choose a fractional coloring of weight less than $3 r \/ 10$. Round its finitely many stable-set weights up to multiples of $1 \/ m$. Give a distinct color slot to each unit of weight $1 \/ m$. Every original vertex belongs to at least $m$ slots, so its $m$ copies can be assigned distinct slots containing that vertex. A slot is a stable set upstairs: it contains at most one copy of any original vertex, and its original vertices form a stable set. The rounding adds only a bounded number of slots, independent of $m$ for this fixed leaf. There are finitely many leaves, so for all sufficiently large $m$, every blown-up leaf restriction has a coloring with fewer than $31 m r \/ 100$ colors.
  Apply Theorem 4 to $F^(\( m \))$ with the integer parameter $k' = ceil.l m r \/ 50 ceil.r$. For sufficiently large $m$, (13) exceeds $7 k'$. We obtain a $k'$-connected subgraph $J$ with
  $ chi \( J \) gt.eq chi \( F^(\( m \)) \) - 6 k' > frac(19 m r, 50) - 6 > frac(31 m r, 100) . $
  Each restricted separator of the decomposition has fewer than $r \/ 100$ vertices, so its blow-up has fewer than $m r \/ 100 < k'$ vertices. Thus $J$ cannot meet both exclusive sides of any such split: deleting its vertices in the separator would disconnect $J$ with fewer than $k'$ deletions. Nor can $J$ be contained in the separator, because its order is greater than $k'$. Descending the decomposition places $J$ inside a single blown-up leaf restriction, contradicting that leaf’s coloring bound.
  It follows that some $k$-connected leaf satisfies (12). This argument also covers the case where $P$ is too small to be $k$-connected: if all leaves were small, the same contradiction would apply. Finally, the blow-up is only an auxiliary graph for the extraction theorem, which requires no minor exclusion; no bound on its clique-minor number was used. ◻
]

=== 3.3 Private models and a connected complement <private-models-and-a-connected-complement>

Assume the failure hypothesis of Lemma 12, and fix the resulting subgraph $H$. Sample $q$ fresh independent copies $W_1 \, dots.h \, W_q$ of (8). Put

$ T_i = V \( H \) ∩ (W_i \\ union.big_(j eq.not i) W_j) \, #h(2em) U = V \( H \) ∩ union.big_(i = 1)^q W_i . $

The sets $T_i$ are pairwise disjoint subsets of $U$.

#thm([Lemma 3.5.])[
  #emph[With failure probability at most $4 q \( q - 1 \) p + o \( 1 \)$, every $H \[ T_i \]$ has fractional chromatic number greater than $r \/ 8$, and hence contains a $K_(2 x)$ model.]
] <small:private>

#proof[
  By (12) and Lemma 11, the events
  $ cal(A)_i = { f \( H \[ W_i ∩ V \( H \) \] \) > r \/ 5 } $
  all hold with probability $1 - o \( 1 \)$: the individual failure probability is at most $2 exp \( - t^(7 \/ 10) \)$, and $q lt.eq Q_0 \( log t \)^2$.
  For each outcome of $W_i$ satisfying $cal(A)_i$, choose optimal dual weights on $H \[ W_i ∩ V \( H \) \]$ of total weight $a_i > r \/ 5$. Choose these weights as a function of $W_i$ alone. Conditional on this one copy, each other copy still satisfies the vertex survival bound (9). Therefore the expected weight on vertices belonging to some other copy is at most $\( q - 1 \) p a_i$. Markov’s inequality shows that the probability of $cal(A)_i$ together with the loss of more than $a_i \/ 4$ is at most $4 \( q - 1 \) p$.
  Taking a union bound over $i$, we conclude that, except with probability $4 q \( q - 1 \) p + o \( 1 \)$, all private sets retain weight at least $3 a_i \/ 4 > 3 r \/ 20 > r \/ 8$. Restriction to $T_i$ preserves dual feasibility: each stable set in $H \[ T_i \]$ is also a stable set in $H \[ W_i ∩ V \( H \) \]$. Hence $f \( H \[ T_i \] \) > r \/ 8$. In this calculation we have conditioned only on a single copy at a time, not on the simultaneous events $cal(A)_1 \, dots.h \, cal(A)_q$.
  Theorem 3 now gives
  $ h \( H \[ T_i \] \) > r \/ 32 > 2 floor.l r \/ 200 floor.r = 2 x \, $
  so each private set contains the required model. The models are vertex-disjoint because the private sets are disjoint. ◻
]

#thm([Lemma 3.6.])[
  #emph[With probability $1 - o \( 1 \)$, every vertex of $H$ has at least $k \/ 2$ neighbors in $H - U$, and $H - U$ is $floor.l k \/ 32 floor.r$-connected.]
] <small:complement>

#proof[
  Each fixed vertex belongs to $U$ with probability at most $q p lt.eq 10^(- 4)$ by (10). Before sampling, fix $k$ neighbors of each vertex of $H$, possible since $H$ is $k$-connected. The expected number of those neighbors in $U$ is at most $k \/ 10000$. Having at least $k \/ 2$ of them in $U$ thus requires a deviation greater than $k \/ 3 gt.eq r \/ 3$. Lemma 11 and a union bound over at most $n$ vertices prove the neighborhood assertion with probability $1 - o \( 1 \)$. This assertion holds for all vertices of $H$, including those in $U$.
  For the connectivity assertion, use the family of test matchings in Lemma 8 for the fixed graph $H$, with order bound $n$ and connectivity parameter $k$. Fix this family before sampling the fresh copies, and set
  $ s = ⌈10 n / k log \( 2 n \)⌉ . $
  The number of tests is at most
  $ \( n + 1 \)^(s + 1) & = exp #scale(x: 120%, y: 120%)[\(] O \( \( 1 + n \/ k \) log^2 \( 2 n \) \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( t^(1 \/ 10) log^2 t \) #scale(x: 120%, y: 120%)[\)] . $
  Here the constants are absolute, since $D_0$ is fixed.
  The endpoint set of each test matching is a fixed set to which Lemma 11 applies. It has size at most $k \/ 4$, so its expected intersection size with $U$ is at most $k \/ 40000$. A count of at least $k \/ 32$ therefore requires a deviation greater than $k \/ 64 gt.eq r \/ 64$. Lemma 11 and the displayed bound on the number of tests show that, with probability $1 - o \( 1 \)$, every test matching has fewer than $k \/ 32$ endpoints in $U$. Together with the neighborhood assertion, these are the hypotheses of Lemma 8, which gives the claimed connectivity. ◻
]

#proof[
  If $P$ is empty, take all the stable sets empty. Otherwise use the experiment (8) and suppose that every outcome of positive probability has $f \( P \[ W \] \) > r \/ 2$. Lemma 12 supplies a fixed $H$. By (10), the failure probability in Lemma 13 is at most $4 dot.op 10^(- 4) + o \( 1 \)$. Thus Lemmas 13 and 14 hold simultaneously with positive probability for sufficiently large $t$. Fix such an outcome, including its $q$ disjoint $K_(2 x)$ models.
  Partition the $t$ labels of a prospective $K_t$ model into $b = ceil.l t \/ x ceil.r$ nonempty blocks of size at most $x$. Assign a different private model to each single block and each unordered pair of distinct blocks. There are $b + binom(b, 2) = b \( b + 1 \) \/ 2 lt.eq b^2 = q$ assignments. In a model assigned to one block, retain one bag for each label of that block. In a model assigned to two blocks, retain one bag for each label in their union. At most $2 x$ bags are retained from each model, and every pair of distinct labels appears together in one assigned model.
  Choose a port vertex in every retained bag. There are at most $2 x q$ ports, and each has at least $k \/ 2$ neighbors in $H - U$. By (7), we can choose a distinct such neighbor for every port, greedily. Let $m$ be the actual number of chosen neighbors, so $1 lt.eq m lt.eq 2 x q$. Their labels partition them into $t$ nonempty groups. The graph $H - U$ has connectivity at least
  $ ⌊k / 32⌋ gt.eq gamma \( 2 x q \) gt.eq gamma m \, $
  so Theorem 5 provides pairwise disjoint connected sets in $H - U$ containing these groups.
  For each label, unite its connected set in $H - U$ with all its assigned private bags and their port edges. This set is nonempty and connected. Different labels give disjoint sets: their connected sets in $H - U$ are disjoint, all private bags are disjoint, and the bags lie in $U$. Every two label sets are adjacent because their labels occur together in an assigned clique model. These sets form a $K_t$ model in $P$, contrary to $h \( P \) < t$. Some outcome of the sampling experiment must therefore have fractional chromatic number at most $r \/ 2$, as required. ◻
]

=== 3.4 Assigning the colors to bins <assigning-the-colors-to-bins>

#proof[
  Fix a sufficiently large integer $t$, and let $G$ satisfy the hypotheses of the proposition. The empty graph needs no colors, so suppose that $G$ is nonempty. Set
  $ r_j = 4 t 2^(- j) \, #h(2em) y_j = max { 1 \, t \/ r_j } \, $
  and let $J$ be the largest nonnegative integer for which $r_J gt.eq t \/ log t$. For each $j in { 0 \, dots.h \, J }$, allocate a separate block of
  $ N_j = ceil.l B r_j log \( 2 y_j \) ceil.r $
  bins. Allocate a further $16 t$ bins for cleanup. All these bins are distinct. Their total number $n_(upright("bin"))$ is at most a fixed constant times $t$. Indeed, $y_j lt.eq 2^j$, so
  $ n_(upright("bin")) & lt.eq 4 B t log 2 sum_(j gt.eq 0) \( j + 1 \) 2^(- j) + \( J + 1 \) + 16 t\
 & = 16 B \( log 2 \) t + \( J + 1 \) + 16 t . $
  Also $J + 1 = O \( log log t \)$, since $2^J lt.eq 4 log t$. Choose an integer
  $ D_(upright("bin")) gt.eq 16 B log 2 + 18 . $
  For all sufficiently large $t$, we have $n_(upright("bin")) lt.eq D_(upright("bin")) t$. Finally choose a positive integer $L$ such that
  #[#set math.equation(numbering: n => "(14)")
   $ frac(L, 2 D_(upright("bin"))) > log 2 + 1 . $ <small:L-choice>]
  Let $cal(L)$ be any finite list assignment on $G$ with $\| cal(L) \( v \) \| gt.eq L t$ at every vertex. Map each color in the finite union $union.big_v cal(L) \( v \)$ independently and uniformly to one of the $n_(upright("bin"))$ bins. We claim that a map can be fixed such that every vertex has an allowable color in at least half the bins of every block, including cleanup.
  For a fixed vertex and a block of $u$ bins, failure of this property implies that a subset of $ceil.l u \/ 2 ceil.r$ bins is missed by its list. For a specified such subset, the probability of being missed is at most
  $ (1 - frac(u, 2 n_(upright("bin"))))^(\| cal(L) \( v \) \|) lt.eq exp (- frac(L t thin u, 2 n_(upright("bin")))) lt.eq exp (- frac(L u, 2 D_(upright("bin")))) . $
  There are at most $2^u$ choices for the missed subset, so (14) bounds the failure probability by $e^(- u)$. Every nonfinal block has $u gt.eq B \( log 2 \) t \/ log t$, and the cleanup block has $u = 16 t$. Thus, with $c_B = min { B log 2 \, 16 } > 0$ and $log t gt.eq 1$, a union bound over all vertices and blocks gives failure probability at most
  $ \( J + 2 \) t^(11 \/ 10) exp (- frac(c_B t, log t)) = o \( 1 \) . $
  For sufficiently large $t$, the desired map therefore exists; fix one. This probability estimate depends on the list sizes, but not on the number of distinct colors in their union.
  Call a vertex eligible for a bin if its list has a color assigned to that bin. It remains eligible whenever it survives to a later stage. At the start, Theorem 3 gives $f \( G \) lt.eq 4 t = r_0$. At stage $j$, let $P$ be the current induced remainder. If it is empty, stop. Otherwise $h \( P \) < t$, $\| V \( P \) \| lt.eq t^(11 \/ 10)$, and inductively $f \( P \) lt.eq r_j$. For each bin of that stage, take its eligible vertex set inside $P$. Every vertex belongs to at least half these sets. Lemma 10, with $n = t^(11 \/ 10)$, supplies a stable set for each bin such that deleting the eligible covered vertices leaves fractional chromatic number at most $r_j \/ 2 = r_(j + 1)$. Retain one covering bin for every vertex removed at this stage.
  After stage $J$, the remaining graph has fractional chromatic number at most $r_(J + 1) < t \/ log t$. If it is nonempty, put $rho = t \/ log t$ and independently sample a stable set in each cleanup bin from a fractional coloring distribution having every vertex inclusion probability at least $1 \/ rho$. Such a distribution exists because $f lt.eq rho$. Every remaining vertex is eligible in at least $8 t$ cleanup bins, so its probability of being missed by all eligible samples is at most
  $ \( 1 - 1 \/ rho \)^(8 t) lt.eq exp \( - 8 t \/ rho \) = t^(- 8) . $
  The probability that any remaining vertex is missed is therefore at most $t^(11 \/ 10) t^(- 8) = t^(- 69 \/ 10) < 1$. Choose an outcome covering every remaining vertex and again retain one covering bin for each vertex.
  Every vertex now has a retained bin and belongs to the stable set associated with that bin. Choose any color in its original list which maps to that bin. If two vertices receive the same color, the global map sends that color to their common retained bin. Both vertices lie in that bin’s stable set and are therefore nonadjacent. This is a proper $cal(L)$-coloring of $G$.
  The choices of constants were made in the order $gamma$, $B$, $D_(upright("bin"))$, and $L$. All subsequent cutoffs depend only on these constants, and every thinning estimate is uniform over the intermediate graphs and eligibility sets. Enlarging one absolute $t_0$ to satisfy the finitely many cutoff requirements proves the proposition. ◻
]

== 4 Extraction and additive deletion for lists <sec:list-transfer>

We first establish a list-coloring form of connectivity extraction. We then show that deleting a small set together with a suitably sparse set costs only linearly many colors. Throughout this section, list assignments may have arbitrary finite palettes.

#thm([Lemma 4.1.])[
  #emph[The following hold for every finite graph $P$.]
  + #emph[If $H$ is a subgraph of $P$, then $ell \( H \) lt.eq ell \( P \)$.]
  + #emph[For every $Z subset.eq V \( P \)$, 
$ ell \( P - Z \) gt.eq ell \( P \) - \| Z \| . $

]
  + #emph[If $P$ is $q$-degenerate, where $q$ is a nonnegative integer, then $ell \( P \) lt.eq q + 1$.]
] <list:elementary>

#proof[
  For the first assertion, extend any list assignment on $H$ with lists of size at least $ell \( P \)$ to the other vertices of $P$, retaining the given lists on $V \( H \)$. A list coloring of $P$ restricts to one of $H$; additional edges among $V \( H \)$ cause no difficulty.
  For the second assertion, write $s = ell \( P - Z \)$ and give every vertex of $P$ a list of size at least $s + \| Z \|$. Greedily color $P \[ Z \]$. At any such step there are at most $\| Z \| - 1$ colors to avoid. Delete from each remaining list the colors used on its neighbors in $Z$. At most $\| Z \|$ entries are removed, so $P - Z$ can be colored from the remaining lists. This proves $ell \( P \) lt.eq s + \| Z \|$; the empty-graph cases hold as well under our convention.
  For the third assertion, repeatedly remove a vertex of degree at most $q$ from the current graph. In the reverse order, every vertex has at most $q$ already colored neighbors, so lists of size at least $q + 1$ suffice. ◻
]

We use the constraint-budget method of Girão and Narayanan #cite(label("GiraoNarayanan2022")), with slack chosen to obtain the extraction estimate needed here; see also #cite(label("Postle2020")) Section 3.4. The precoloring invariant pays for the constraints introduced when a separator is colored. A proper list precoloring on $A$ means a proper coloring of $P \[ A \]$ assigning to each $v in A$ a color in its given list.

#thm([Lemma 4.2.])[
  #emph[Let $k gt.eq 1$ and $m gt.eq 0$ be integers. Suppose every induced $k$-connected subgraph of $P$ has list chromatic number at most $m$. Give each vertex $v$ a list $cal(L) \( v \)$ of size at least $m + 6 k$. Suppose also that:]
  + #emph[a set $A subset.eq V \( P \)$ has a proper list precoloring $phi$;]
  + #emph[for each $v in.not A$, a finite set $B_v$ of forbidden colors is specified, with $\| B_v \| < k$;]
  + #emph[the constraints satisfy 
#[#set math.equation(numbering: n => "(15)")
 $ k \| A \| + sum_(v in.not A) \| B_v \| lt.eq 2 k^2 . $ <list:eq-budget>]

]
  #emph[Then $P$ has a proper $cal(L)$-coloring extending $phi$ and avoiding $B_v$ at every $v in.not A$.]
] <list:constrained-coloring>

#proof[
  We induct on $\| V \( P \) \|$. The hypothesis about induced $k$-connected subgraphs is inherited by induced subgraphs of $P$. The budget gives $\| A \| lt.eq 2 k$.
  If $\| V \( P \) \| lt.eq 2 k$, extend $phi$ greedily. At each vertex there are at most $2 k - 1$ colors used by already colored vertices and at most $k - 1$ forbidden colors. Since the lists have size at least $m + 6 k$, a choice is available. This includes the empty graph.
  If $P$ is $k$-connected, then $ell \( P \) lt.eq m$ by hypothesis. For every $v in.not A$, remove $B_v$ and the colors on its precolored neighbors from $cal(L) \( v \)$. The remaining list has size at least
  $ m + 6 k - \| A \| - \| B_v \| gt.eq m + 3 k + 1 gt.eq m . $
  By Lemma 15, $ell \( P - A \) lt.eq m$, so these lists color $P - A$. Combining this coloring with $phi$ proves the assertion in this case. If $P - A$ is empty there is nothing to extend.
  It remains to consider $\| V \( P \) \| > 2 k$ when $P$ is not $k$-connected. Choose a partition
  $ V \( P \) = V_1 thin dot(union) thin Z thin dot(union) thin V_2 \, $
  where $V_1 \, V_2$ are nonempty, there are no edges between them, and $\| Z \| < k$. Assign to each vertex its constraint cost
  $ w \( v \) = cases(delim: "{", k \, & v in A \,, \| B_v \| \, & v in.not A \,) #h(2em) w \( U \) = sum_(v in U) w \( v \) . $
  Interchange the sides if necessary so that $w \( V_1 \) gt.eq w \( V_2 \)$. We color the side with the larger constraint cost first, leaving the other side to absorb the cost of precoloring the whole separator. In particular,
  #[#set math.equation(numbering: n => "(16)")
   $ w \( V_2 \) lt.eq k^2 . $ <list:eq-second-side-cost>]
  We first color $P_1 = P \[ V_1 union Z \]$. Retain the precoloring on $A_1 = A ∩ \( V_1 union Z \)$. At its other vertices use forbidden sets
  $ B'_v = cases(delim: "{", B_v union { phi \( x \) : x in A ∩ V_2 \, med x v in E \( P \) } \, & v in Z \\ A \,, B_v \, & v in V_1 \\ A .) $
  These extra prohibitions make the eventual separator coloring compatible with the precolored vertices on the other side. Their total cost obeys
  #[#set math.equation(numbering: n => "(17)")
   $ k \| A_1 \| + sum_(v in V \( P_1 \) \\ A_1) \| B'_v \| & lt.eq w \( V \( P \) \) - w \( V_2 \) + \| Z \| thin \| A ∩ V_2 \|\
 & lt.eq w \( V \( P \) \) - k \| A ∩ V_2 \| + \( k - 1 \) \| A ∩ V_2 \|\
 & lt.eq 2 k^2 . $ <list:eq-first-side-cost>]
  Repeated occurrences of the same color can only reduce the left side.
  The sets $B'_v$ need not all have size less than $k$, but each satisfies
  $ \| B'_v \| lt.eq \( k - 1 \) + \| A ∩ V_2 \| lt.eq 3 k - 1 . $
  We now convert every vertex with $\| B'_v \| gt.eq k$ into a precolored vertex. Process these vertices one at a time. Choose a color from $cal(L) \( v \)$ avoiding $B'_v$ and all colors on its currently precolored neighbors in $P_1$, and then discard the forbidden set at this newly precolored vertex. Its contribution to the constraint cost changes from $\| B'_v \|$ to $k$, so the total cost does not increase. In particular, throughout this procedure there are at most $2 k$ precolored vertices. Each choice therefore avoids at most
  $ \( 3 k - 1 \) + 2 k = 5 k - 1 < m + 6 k $
  colors and is possible. Every promoted vertex lies in $Z \\ A$, since the original forbidden sets on $V_1 \\ A$ had size less than $k$. Its chosen color also avoids all precolored neighbors in $V_2$, by the definition of $B'_v$.
  After the conversions, the constraints on $P_1$ satisfy all the hypotheses of the lemma: its precoloring is proper, its remaining forbidden sets have size less than $k$, and its total cost is at most $2 k^2$. Since $V_2$ is nonempty, $\| V \( P_1 \) \| < \| V \( P \) \|$, and induction supplies a coloring $psi_1$ of $P_1$. It respects all the original constraints in $P_1$. It also avoids every color $phi \( x \)$ at a separator neighbor of $x in A ∩ V_2$: this was enforced either by an original precoloring, by a conversion, or by a retained forbidden set.
  Next consider $P_2 = P \[ V_2 union Z \]$. Precolor $Z$ according to $psi_1$ and retain $phi$ on $A ∩ V_2$. The resulting precoloring on $Z union \( A ∩ V_2 \)$ is proper by the preceding compatibility property. For each vertex of $V_2 \\ A$, retain its original forbidden set $B_v$. The new constraint cost is
  $ k \| Z \| + k \| A ∩ V_2 \| + sum_(v in V_2 \\ A) \| B_v \| = k \| Z \| + w \( V_2 \) lt.eq k \( k - 1 \) + k^2 < 2 k^2 \, $
  using (16). All its remaining forbidden sets have size less than $k$. Since $V_1$ is nonempty, induction applies to $P_2$. Its coloring agrees with $psi_1$ on $Z$. The two colorings therefore combine into a proper coloring of $P$, because there are no edges between $V_1$ and $V_2$. They extend the original precoloring and respect every original forbidden set. ◻
]

#thm([Lemma 4.3.])[
  (List connectivity extraction).  #emph[For every integer $k gt.eq 1$, if $ell \( P \) > 6 k$, then some induced $k$-connected subgraph $H$ of $P$ satisfies 
$ ell \( H \) gt.eq ell \( P \) - 6 k . $

]
] <lem:list-extraction>

#proof[
  Suppose otherwise and put $m = ell \( P \) - 6 k - 1$, a nonnegative integer. Every induced $k$-connected subgraph then has list chromatic number at most $m$. Apply Lemma 16 with no precolored vertices and no forbidden colors. It says that every list assignment of size at least $m + 6 k = ell \( P \) - 1$ is colorable, contradicting the definition of $ell \( P \)$. ◻
]

The deletion estimate will reserve colors for a small vertex set. Only vertices with many neighbors in that set need a probabilistic upper bound on the number of reserved colors in their lists. Minor exclusion gives a bound on their number independent of the order of the whole graph.

#thm([Lemma 4.4.])[
  #emph[Let $t gt.eq 2$ be an integer, let $h \( P \) < t$, and let $X subset.eq V \( P \)$. Then 
$ \| { v in V \( P \) \\ X : \| N_P \( v \) ∩ X \| gt.eq t } #scale(x: 120%, y: 120%)[\|] lt.eq binom(\| X \|, 2) . $

]
] <list:high-neighbor-count>

#proof[
  Process the indicated outside vertices in any order. Assign each one an as yet unused unordered pair of its neighbors in $X$. Suppose this fails when processing a vertex $v$. Choose $t$ distinct vertices in $N_P \( v \) ∩ X$. Every pair of the chosen vertices has already been assigned to a different previously processed outside vertex adjacent to both. The corresponding paths of length two have mutually distinct internal vertices, all outside $X$. They form a subdivision of $K_t$ and hence give a $K_t$ minor, a contradiction. Thus the assignment never fails and is an injection into the unordered pairs from $X$. ◻
]

#thm([Lemma 4.5.])[
  (Additive list-coloring loss).  #emph[Let $L gt.eq 1$ be the integer constant in Proposition 9. For each fixed integer $d gt.eq 0$, put 
$ c_d = 4 L + d + 5 . $

 For every sufficiently large integer $t$, the following holds. Suppose $h \( P \) < t$ and $X \, Y subset.eq V \( P \)$ are disjoint sets such that]
  + #emph[$\| X \| lt.eq t^(11 \/ 10)$;]
  + #emph[$P \[ Y \]$ is $d t$-degenerate;]
  + #emph[every vertex outside $X union Y$ has at most $d t$ neighbors in $Y$.]
  #emph[Then 
$ ell \( P - X - Y \) gt.eq ell \( P \) - c_d t . $

 The cutoff is independent of $P$, its order, and all list assignments and their palettes.]
] <lem:additive-deletion>

#proof[
  Write $R = P - X - Y$ and $s = ell \( R \)$, and set
  $ u = s + \( 4 L + d + 5 \) t . $
  We show that $P$ is $u$-choosable. Given any lists of size at least $u$, first restrict each list to exactly $u$ entries. Denote the resulting assignment by $cal(L)$. Its total palette $cal(C) = union.big_(v in V \( P \)) cal(L) \( v \)$ is finite, but its size is otherwise unrestricted.
  Independently for each color in $cal(C)$, reserve that color with probability
  $ p = frac(2 L t, u) . $
  Since $u gt.eq \( 4 L + d + 5 \) t > 2 L t$, this is a probability strictly between zero and one. Reservation is global: all occurrences of a color are reserved together. For each vertex $v$, the number $Z_v$ of reserved entries in $cal(L) \( v \)$ has distribution $"Bin" \( u \, p \)$ and mean $mu = 2 L t$. This mean is independent of $s$, and overlaps between different lists do not affect this marginal distribution.
  For completeness, for every real $lambda$ its exponential moment obeys
  $ bb(E) e^(lambda Z_v) = \( 1 - p + p e^lambda \)^u lt.eq exp #scale(x: 120%, y: 120%)[\(] mu \( e^lambda - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Markov’s inequality with $lambda = - log 2$ and $lambda = log 2$, respectively, gives
  #[#set math.equation(numbering: n => "(18)")
   $ Pr \( Z_v < mu \/ 2 \) & lt.eq exp #scale(x: 120%, y: 120%)[\(] - frac(1 - log 2, 2) mu #scale(x: 120%, y: 120%)[\)] \,\
Pr \( Z_v > 2 mu \) & lt.eq exp #scale(x: 120%, y: 120%)[\(] - \( 2 log 2 - 1 \) mu #scale(x: 120%, y: 120%)[\)] . $ <list:eq-lower-tail>]
  Let
  $ T = { v in V \( P \) \\ X : \| N_P \( v \) ∩ X \| gt.eq t } . $
  By Lemma 18, $\| T \| lt.eq binom(\| X \|, 2)$. Put $eta = min { \( 1 - log 2 \) \/ 2 \, thin 2 log 2 - 1 } > 0$. A union bound using (18) and (18) shows that the probability of either of the failures
  $ Z_x < L t quad upright("for some ") x in X \, #h(2em) Z_v > 4 L t quad upright("for some ") v in T $
  is at most
  $ \( \| X \| + \| T \| \) e^(- 2 eta L t) lt.eq 2 t^(11 \/ 5) e^(- 2 eta L t) < 1 $
  for sufficiently large $t$. There are only polynomially many tested vertices even if $P$ has arbitrarily many vertices. No independence between different vertices’ failure events is required. Fix a reservation for which neither failure occurs.
  Use the reserved entries to color $P \[ X \]$. They provide at least $L t$ colors at each of its vertices, and Proposition 9 applies because $\| X \| lt.eq t^(11 \/ 10)$ and $h \( P \[ X \] \) < t$. If $X$ is empty this step is vacuous. Write the coloring as $phi_X$.
  For each vertex $v in.not X$, delete from its list the colors on its neighbors in $X$:
  $ cal(L)_1 \( v \) = cal(L) \( v \) \\ { phi_X \( x \) : x in N_P \( v \) ∩ X } . $
  If $v in T$, every deleted entry is reserved, so at most $4 L t$ entries are deleted. If $v in.not T$, fewer than $t$ entries are deleted because $v$ has fewer than $t$ neighbors in $X$. In particular, the uniform bound
  #[#set math.equation(numbering: n => "(19)")
   $ \| cal(L)_1 \( v \) \| gt.eq u - \( 4 L + 1 \) t = s + \( d + 4 \) t $ <list:eq-first-pruning>]
  holds. We have removed only colors actually used on neighbors in $X$; there is no need to discard all reserved entries at the other vertices.
  The bound in (19) is at least $d t + 1$. By Lemma 15, the $d t$-degenerate graph $P \[ Y \]$ therefore has a coloring $phi_Y$ from these lists. This coloring has no conflict with $phi_X$.
  Finally, at each vertex of $R$ delete from $cal(L)_1 \( v \)$ the colors used by its neighbors in $Y$. There are at most $d t$ such neighbors, so its resulting list has size at least
  $ u - \( 4 L + 1 \) t - d t = s + 4 t gt.eq s . $
  The definition of $s = ell \( R \)$ supplies a coloring of $R$ from these lists, with nothing to do if $R$ is empty. The three colorings combine properly, since both pruning steps excluded colors used on neighbors in the previously colored parts. We have colored every $u$-list assignment on $P$, proving
  $ ell \( P \) lt.eq u = ell \( P - X - Y \) + c_d t . $
  Only the fixed cutoff in Proposition 9 and the last exponential-versus-polynomial estimate impose a sufficiently-large-$t$ requirement. Neither depends on the graph order or palette size. ◻
]

== 5 Density and small connected districts <sec:density>

The sharp order of growth of the density threshold for clique minors was established by Kostochka #cite(label("Kostochka1982")) #cite(label("Kostochka1984")) and Thomason #cite(label("Thomason1984")). We prove below a coarser estimate sufficient for our purpose. We need two consequences of density. The incidence estimate of Lemma 21 will control exceptional vertices in the path-history bound, Lemma 35, after paths are contracted. Lemma 23 supplies small highly connected districts in which the later constructions can route paths and build clique models.

Write $e \( R \) = \| E \( R \) \|$ and $d \( R \) = e \( R \) \/ \| V \( R \) \|$ for a nonempty graph $R$. Throughout this section, fix

$ epsilon.alt = 1 / 200 . $

All assertions involving sufficiently large $t$ have a cutoff independent of the graph. When a fixed parameter $K$ is present, the cutoff may depend on $K$. An upper bound on an integer order by a real power of $t$ is understood as an ordinary real inequality.

#thm([Lemma 5.1.])[
  #emph[There is an absolute constant $C_(*) > 0$, for example $C_(*) = 10^4$, such that, for every integer $t gt.eq 2$ and every nonempty graph $P$ with $h \( P \) < t$, 
$ d \( P \) lt.eq C_(*) t log \( 2 t \) . $

 Consequently, every graph $P$ with $h \( P \) < t$ satisfies 
$ ell \( P \) lt.eq 2 C_(*) t log \( 2 t \) + 1 . $

]
] <lem:coarse-density>

#proof[
  Choose a nonempty minor $R$ of $P$ whose density $d$ is as large as possible. If $d < 10^4$, the claimed density estimate holds with $C_(*) = 10^4$. We may therefore assume $d gt.eq 10^4$. Put $n = \| V \( R \) \|$. The graph $R$ has no isolated vertex, since deleting one would increase its positive density. Contracting an edge $x y$ with $c_(x y)$ common neighbors loses exactly $1 + c_(x y)$ edges. The maximality of $d$ gives
  $ frac(d n - 1 - c_(x y), n - 1) lt.eq d \, #h(2em) upright("and hence") #h(2em) c_(x y) gt.eq d - 1 . $
  There is a vertex $v$ of degree at most $2 d$. Therefore $J = R \[ N_R \( v \) \]$ has at most $2 d$ vertices and minimum degree at least $d - 1$.
  We first record a bound for connected dominating sets in any connected graph $C$ of order at most $2 d$ and minimum degree at least $d \/ 2$. Take
  $ m = ceil.l 4 log \( 2 d \) ceil.r + 1 $
  independent uniform samples from $V \( C \)$. A fixed vertex has a neighbor in each draw with probability at least $1 \/ 4$, so the probability that some vertex has no sampled neighbor is at most
  $ 2 d \( 3 \/ 4 \)^m lt.eq 2 d exp \( - m \/ 4 \) < 1 . $
  Consequently, some choice of at most $m$ sampled vertices dominates $C$. The diameter of $C$ is at most $11$: along a shortest path, the open neighborhoods of the vertices at positions $0 \, 3 \, 6 \, dots.h$ are pairwise disjoint, each has at least $d \/ 2$ vertices, and the graph has at most $2 d$ vertices. There are at most four such positions. Joining each sampled vertex to one fixed sampled vertex along a shortest path therefore gives a connected dominating set of size at most $11 m lt.eq 66 log \( 2 d \)$, which is at most
  $ M = ceil.l 100 log \( 2 d \) ceil.r . $
  We have $M lt.eq 101 log \( 2 d \)$ and $d gt.eq 6 M$. For the latter inequality, $x \/ log \( 2 x \)$ is increasing for $x gt.eq 10^4$, and $10^4 > 606 log \( 20000 \)$.
  We now construct
  $ q = ⌊frac(d, 3 M)⌋ $
  pairwise adjacent, disjoint connected sets. Start with $J_0 = J$. At step $i$, choose a component $C_i$ of $J_i$, take a connected dominating set $B_i$ of $C_i$ of size at most $M$, and put $J_(i + 1) = C_i - B_i$. For every retained vertex, passing to a component deletes no neighbor. Its neighbors in the original graph $J$ that have disappeared are therefore all in previously chosen bags. As long as at most $q M lt.eq d \/ 3$ bag vertices have been deleted, each retained vertex has degree at least
  $ d - 1 - q M gt.eq d \/ 2 . $
  In particular, each chosen component has at least $d \/ 2 + 1$ vertices, whereas $M lt.eq d \/ 6$; its deletion of $B_i$ leaves a nonempty graph. The construction consequently continues for all $q$ steps.
  Every later bag lies inside $C_i - B_i$, so it has an edge to $B_i$ by domination. The bags form a $K_q$ model. Since $d \/ \( 3 M \) gt.eq 2$,
  $ h \( P \) gt.eq q gt.eq frac(d, 6 M) gt.eq frac(d, 606 log \( 2 d \)) . $
  The hypothesis $h \( P \) < t$ implies $d \/ log \( 2 d \) < 606 t$. The elementary inequality $log \( 2 d \) lt.eq 2 sqrt(d)$ for $d gt.eq 1$ first gives $d < \( 1212 t \)^2$. Since $2 dot.op 1212^2 < 2^22$ and $t gt.eq 2$,
  $ log \( 2 d \) < 22 log 2 + 2 log t lt.eq 12 log \( 2 t \) . $
  It follows that $d < 7272 t log \( 2 t \)$. Together with the case $d < 10^4$ and the inequality $d \( P \) lt.eq d$, this proves the density claim with $C_(*) = 10^4$.
  Every nonempty subgraph of $P$ has average degree at most $2 C_(*) t log \( 2 t \)$, and hence has a vertex of degree at most $floor.l 2 C_(*) t log \( 2 t \) floor.r$. Successively deleting such vertices and coloring in the reverse order proves the asserted list-coloring bound. The empty graph causes no exception. ◻
]

#thm([Lemma 5.2.])[
  #emph[There is an absolute positive integer $B_(*)$ such that, for all sufficiently large integers $t$, every graph $P$ with $h \( P \) < t$ and disjoint vertex sets $A \, T$ satisfies 
#[#set math.equation(numbering: n => "(20)")
 $ sum_(v in T\
\| N_P \( v \) ∩ A \| gt.eq B_(*) t) \| N_P \( v \) ∩ A \| lt.eq t^(1 + 2 epsilon.alt) \| A \| . $ <density:incidence-bound>]

 In particular, 
$ \| { v in T : \| N_P \( v \) ∩ A \| gt.eq B_(*) t } #scale(x: 120%, y: 120%)[\|] lt.eq t^(2 epsilon.alt) \| A \| . $

]
] <lem:incidence>

#proof[
  Choose a fixed positive even integer $s$ with $epsilon.alt s \/ 2 > 4$, and put $B_(*) = 2 s$. We first show that, in any graph without a $K_t$ minor, every set $U$ of size $b gt.eq B_(*) t$ contains a vertex with at least $t^(- epsilon.alt) b$ nonneighbors in $U$ distinct from itself. Suppose otherwise, and set $delta = t^(- epsilon.alt)$. Sample an ordered sequence of $s t$ distinct vertices of $U$ uniformly, and divide its positions into $t$ batches of size $s$.
  After any previously exposed sampled positions have been fixed, a further position is uniform among at least $b - s t gt.eq b \/ 2$ remaining vertices. For any already exposed vertex, the conditional probability that this new vertex is a nonneighbor is consequently at most $2 delta$. Consider a fixed nontrivial cut of one batch. Expose a fixed position on its smaller side first, and then the positions on its larger side. If the cut has no crossing edge, at least $s \/ 2$ successive exposures must all be nonneighbors of the first vertex. The probability is at most $\( 2 delta \)^(s \/ 2)$. Taking the union over at most $2^s$ cuts, the probability that the batch is disconnected is at most $2^s \( 2 delta \)^(s \/ 2)$. For two fixed batches to be anticomplete, every position of the second batch must be a nonneighbor of one fixed position of the first; this has probability at most $\( 2 delta \)^s$. Thus the probability that some batch is disconnected or some two batches are anticomplete is at most
  $ t 2^s \( 2 t^(- epsilon.alt) \)^(s \/ 2) + binom(t, 2) \( 2 t^(- epsilon.alt) \)^s = o \( 1 \) . $
  For large $t$, the batches can therefore be chosen connected and pairwise adjacent, giving a $K_t$ model. This contradiction proves the claim.
  Let $T_0$ consist of the vertices appearing in the sum in (20). If $A$ or $T_0$ is empty, there is nothing to prove. Otherwise, delete all vertices outside $A union T_0$ and all edges with both ends in $T_0$. Process the vertices of $T_0$ one at a time. Throughout the procedure, the vertices representing $A$ carry a graph that only gains edges. Each unprocessed vertex retains precisely its original neighborhood in $A$, because there were no edges between vertices of $T_0$.
  For an unprocessed vertex $v$, put $b_v = \| N_P \( v \) ∩ A \|$. Apply the preceding claim to its neighborhood in the current graph on $A$, which is a subgraph of a minor of $P$. Choose there a vertex with at least $t^(- epsilon.alt) b_v$ missing neighbors in that neighborhood, and contract $v$ onto this vertex. This operation adds at least $t^(- epsilon.alt) b_v$ new edges to the graph on $A$. After all vertices have been processed, the resulting graph on $A$ is a minor of $P$. By Lemma 20,
  $ t^(- epsilon.alt) sum_(v in T_0) b_v lt.eq e_(upright("final")) - e \( P \[ A \] \) lt.eq C_(*) t log \( 2 t \) \| A \| . $
  For sufficiently large $t$, $C_(*) log \( 2 t \) lt.eq t^epsilon.alt$, proving (20). Dividing by $B_(*) t$, and then using $B_(*) gt.eq 1$, proves the last assertion. ◻
]

The following density-to-connectivity lemma is Mader’s theorem #cite(label("Mader1972")); see also #cite(label("DelcourtPostle2021")) Lemma 4.4. We include the elementary proof needed here.

#thm([Lemma 5.3.])[
  #emph[For every positive integer $k$, a graph of density greater than $2 k$ contains an induced $k$-connected subgraph.]
] <density:connectivity>

#proof[
  Choose an induced subgraph $H$ of smallest order $v gt.eq 2 k$ such that
  $ e \( H \) > 2 k \( v - k \) . $
  Such a subgraph exists: the given graph has density greater than $2 k$ and, being simple, has more than $4 k + 1$ vertices. The equality $v = 2 k$ is impossible because $binom(2 k, 2) < 2 k^2$. Deleting any one vertex therefore leaves at least $2 k$ vertices, and minimality implies
  $ deg_H \( x \) = e \( H \) - e \( H - x \) > 2 k \( v - k \) - 2 k \( v - 1 - k \) = 2 k $
  for every $x in V \( H \)$.
  Suppose that $H$ is not $k$-connected. There is a separator $Z$ of size $z < k$ and nonempty anticomplete sides $A \, B$ partitioning $V \( H \) \\ Z$. Every neighbor of a vertex of $A$ lies in $A union Z$, and likewise for $B$. Both $H \[ A union Z \]$ and $H \[ B union Z \]$ therefore have at least $2 k$ vertices and are proper induced subgraphs of $H$. Their minimality bounds give
  $ e \( H \) & = e \( H \[ A union Z \] \) + e \( H \[ B union Z \] \) - e \( H \[ Z \] \)\
 & lt.eq 2 k #scale(x: 120%, y: 120%)[\(] \| A \| + z - k + \| B \| + z - k #scale(x: 120%, y: 120%)[\)] - e \( H \[ Z \] \)\
 & lt.eq 2 k \( v + z - 2 k \) < 2 k \( v - k \) \, $
  a contradiction. Thus $H$ is $k$-connected. ◻
]

The next argument uses the maximal-contraction method of Delcourt and Postle #cite(label("DelcourtPostle2021")). The edge-loss estimates below give the particular order and connectivity bounds needed here.

#thm([Lemma 5.4.])[
  #emph[For every fixed positive integer $K$, there is an integer 
$ D_K > max \( 400 B_(*) \, 12800 K \) $

 such that, for all sufficiently large integers $t$, every nonempty graph $P$ with 
$ h \( P \) < t \, #h(2em) d \( P \) gt.eq D_K t $

 contains an induced $\( K t \)$-connected subgraph of order at most $t^1.06$.]
] <lem:district>

#proof[
  Choose an integer $D_K$ satisfying the displayed inequality, and keep it fixed. Write $n = \| V \( P \) \|$. Delete edges to obtain a spanning subgraph $P_0$ with exactly $d n$ edges, where $d = D_K t$. This is possible because $D_K t n$ is an integer. Restoring deleted edges at the end preserves the connectivity of any induced subgraph. Put
  $ p_0 = floor.l t^(5 epsilon.alt) floor.r \, #h(2em) lambda = d / 100 . $
  We take $t$ large enough that $p_0 gt.eq 2$.
  We will find a small dense subgraph on vertices untouched by the contractions. First we contract a maximum family of connected $p_0$-vertex sets within an edge-loss budget. We then retain untouched vertices whose degrees have not fallen too far. A second maximal choice of a connected set will stop before reaching $p_0$, since reaching that order would enlarge the first family. The failure of its one-vertex extensions will force a dense neighborhood, even after the contracted vertices are removed.
  Choose a family $cal(C)$ of as many pairwise disjoint connected vertex sets of $P_0$, each of size $p_0$, as possible subject to
  #[#set math.equation(numbering: n => "(21)")
   $ e \( P_0 \) - e \( P_0 \/ cal(C) \) lt.eq lambda sum_(C in cal(C)) \( \| C \| - 1 \) . $ <density:family-budget>]
  Here $P_0 \/ cal(C)$ denotes the simple graph obtained by contracting each set in the family and suppressing loops and parallel edges. The empty family is allowed, so a maximum exists. Let $R = P_0 \/ cal(C)$, and let $X$ be the set of contracted vertices. The vertices outside $X$ are identified with their original vertices in $P_0$, and edges between two such vertices are unchanged. We have
  #[#set math.equation(numbering: n => "(22)")
   $ \| X \| lt.eq n / p_0 \, #h(2em) \( d - lambda \) n lt.eq e \( R \) lt.eq d n . $ <density:quotient-bounds>]
  Indeed the total vertex loss in the contractions is at most $n$, so (21) gives the lower edge bound.
  Let $B$ be the union of the following three sets:
  $ X \, #h(2em) { v in V \( R \) \\ X : \| N_R \( v \) ∩ X \| gt.eq lambda \/ 4 } \, #h(2em) { v in V \( R \) : deg_R \( v \) gt.eq d t^(4 epsilon.alt) } . $
  The first exclusion ensures that the vertices retained below are original vertices. The second limits how many neighbors a retained vertex can lose when $X$ is removed from the eventual neighborhood. The third bounds the order of that neighborhood by bounding the degrees of the vertices that define it. Since $lambda \/ 4 = D_K t \/ 400 gt.eq B_(*) t$, Lemma 21 bounds the second set by $t^(2 epsilon.alt) \| X \|$. The degree sum and (22) bound the third set by $2 n \/ t^(4 epsilon.alt)$. For sufficiently large $t$, $p_0 gt.eq t^(5 epsilon.alt) \/ 2$, and hence
  #[#set math.equation(numbering: n => "(23)")
   $ \| B \| lt.eq \( 1 + t^(2 epsilon.alt) \) n / p_0 + frac(2 n, t^(4 epsilon.alt)) lt.eq 6 n t^(- 3 epsilon.alt) . $ <density:bad-size>]
  By Lemma 20, the number of edges within $B$ is at most
  $ C_(*) t log \( 2 t \) \| B \| lt.eq 6 C_(*) n t^(1 - 3 epsilon.alt) log \( 2 t \) . $
  To bound the edges from $B$ to its complement, first count the vertices outside $B$ with fewer than $B_(*) t$ neighbors in $B$: their contribution is at most $B_(*) t n$. Lemma 21 bounds all remaining crossing edges by
  $ t^(1 + 2 epsilon.alt) \| B \| lt.eq 6 n t^(1 - epsilon.alt) . $
  The same bounds hold if $B$ is empty. It follows that
  $ e \( R - B \) & gt.eq \( d - lambda \) n - 6 C_(*) n t^(1 - 3 epsilon.alt) log \( 2 t \) - B_(*) t n - 6 n t^(1 - epsilon.alt)\
 & gt.eq d n (99 / 100 - B_(*) / D_K - frac(6 C_(*), D_K) t^(- 3 epsilon.alt) log \( 2 t \) - 6 / D_K t^(- epsilon.alt)) > frac(d n, 2) $
  for sufficiently large $t$, since $D_K > 400 B_(*)$.
  Starting with $R - B$, repeatedly delete a vertex $v$ whose degree in the current graph is less than $d \/ 4$, or less than $deg_R \( v \) \/ 8$. Charge each deleted edge to the endpoint deleted first. The total charge is at most
  $ d / 4 n + 1 / 8 sum_(v in V \( R \)) deg_R \( v \) lt.eq frac(d n, 2) . $
  The process cannot delete every vertex, because $R - B$ initially has more than $d n \/ 2$ edges. The surviving nonempty set $S$ satisfies
  #[#set math.equation(numbering: n => "(24)")
   $ deg_(R \[ S \]) \( v \) gt.eq d \/ 4 \, #h(2em) deg_(R \[ S \]) \( v \) gt.eq deg_R \( v \) \/ 8 quad \( v in S \) . $ <density:surviving-degrees>]
  The second degree bound will let us compare a neighborhood in $R$ with the part remaining in $S$, once the loss caused by contracting its defining set is controlled.
  For a nonempty connected vertex set $U$ in $R$, let $cal(L) \( U \)$ be the number of edges lost when $U$ is contracted to one vertex. If $N_R \( U \)$ denotes its external neighborhood, then the exact loss is
  #[#set math.equation(numbering: n => "(25)")
   $ cal(L) \( U \) = e \( R \[ U \] \) + sum_(w in N_R \( U \)) #scale(x: 120%, y: 120%)[\(] \| N_R \( w \) ∩ U \| - 1 #scale(x: 120%, y: 120%)[\)] . $ <density:loss-identity>]
  The first term counts the internal edges that become loops. At each outside neighbor, all but one of its edges into $U$ become parallel edges and are suppressed, giving the second term.
  Choose a connected set $H subset.eq S$ of largest possible order $u lt.eq p_0$ subject to
  #[#set math.equation(numbering: n => "(26)")
   $ cal(L) \( H \) lt.eq lambda \( u - 1 \) . $ <density:new-budget>]
  A singleton is admissible. We have $u < p_0$. Indeed $H$ contains only untouched original vertices, so it is connected in $P_0$ as well. If $u = p_0$, append it to $cal(C)$. Contracting the old family and then $H$ gives the same graph as contracting the enlarged family. The actual edge losses add, as do the vertex losses; combining (21) and (26) would make this a larger admissible family, a contradiction.
  Write $N = N_R \( H \)$, and put
  $ a = sum_(v in H) deg_(R \[ S \]) \( v \) \, #h(2em) b = sum_(v in H) deg_R \( v \) . $
  We first show that at least one sixteenth of $N$ lies in $S$. By (25),
  $ a - \| N ∩ S \| & = 2 e \( R \[ H \] \) + sum_(w in N ∩ S) #scale(x: 120%, y: 120%)[\(] \| N_R \( w \) ∩ H \| - 1 #scale(x: 120%, y: 120%)[\)]\
 & lt.eq 2 cal(L) \( H \) lt.eq 2 lambda \( u - 1 \) lt.eq 2 lambda u . $
  By (24), $a gt.eq d u \/ 4 = 25 lambda u$ and $a gt.eq b \/ 8$. As $\| N \| lt.eq b$, this gives
  #[#set math.equation(numbering: n => "(27)")
   $ \| N ∩ S \| gt.eq a - 2 lambda u gt.eq 23 / 25 a gt.eq 23 / 200 b gt.eq frac(\| N \|, 16) . $ <density:neighborhood-ratio>]
  In particular $N ∩ S$ is nonempty, since $a gt.eq 25 lambda u > 0$.
  Fix $w in N ∩ S$, and contract $H$ to a vertex $h$. Contracting the edge $h w$ next loses exactly
  $ 1 + \| N_R \( w \) ∩ N \| $
  edges: the common neighbors of $h$ and $w$ are precisely $N_R \( w \) ∩ N$. If this loss were at most $lambda$, the connected set $H union { w }$, whose order is at most $p_0$, would satisfy the budget $cal(L) \( H union { w } \) lt.eq lambda u$. This would contradict the maximality of $u$. Thus $w$ has more than $lambda - 1$ neighbors in $N$. Since $w in S$ is not in $B$, it has fewer than $lambda \/ 4$ neighbors in $X$. For $lambda gt.eq 4$, it follows that
  $ deg_(R \[ N \\ X \]) \( w \) > frac(3 lambda, 4) - 1 gt.eq lambda / 2 . $
  Using $N ∩ S subset.eq N \\ X$ and (27), we obtain
  $ 2 e \( R \[ N \\ X \] \) gt.eq lambda / 2 \| N ∩ S \| gt.eq lambda / 32 \| N \| . $
  Consequently,
  #[#set math.equation(numbering: n => "(28)")
   $ d \( R \[ N \\ X \] \) gt.eq frac(lambda \| N \|, 64 \| N \\ X \|) gt.eq lambda / 64 . $ <density:small-neighborhood-density>]
  Every vertex of $H subset.eq S$ has degree less than $d t^(4 epsilon.alt)$ in $R$. Therefore
  $ \| N \\ X \| lt.eq \| N \| lt.eq sum_(v in H) deg_R \( v \) < u thin d t^(4 epsilon.alt) lt.eq D_K t^(1 + 9 epsilon.alt) = D_K t^1.045 . $
  Since $D_K$ is fixed, this is at most $t^1.06$ once $t^(3 epsilon.alt) gt.eq D_K$. Also,
  $ lambda / 64 = frac(D_K t, 6400) > 2 K t . $
  Lemma 22, applied to $R \[ N \\ X \]$, now gives an induced $\( K t \)$-connected subgraph of order at most $t^1.06$. All vertices in $N \\ X$ are untouched original vertices, and the edges between them in $R$ are exactly their edges in $P_0$. Restoring the deleted edges on the same vertex set gives the required induced subgraph of $P$. ◻
]

#thm([Corollary 5.5.])[
  #emph[Fix $K$ and $D_K$ as in Lemma 23. For all sufficiently large integers $t$, if 
$ h \( P \) < t \, #h(2em) ell \( P \) > 2 D_K t + 2 \, $

 then $P$ contains an induced $\( K t \)$-connected subgraph of order at most $t^1.06$.]
] <density:list-district>

#proof[
  If every nonempty subgraph had a vertex of degree at most $2 D_K t + 1$, reverse deletion order would color arbitrary lists of size $2 D_K t + 2$. Thus some subgraph has minimum degree at least $2 D_K t + 2$. Passing to the induced subgraph on its vertices preserves this degree bound, so that induced subgraph has density at least $D_K t + 1$. Apply Lemma 23 there. ◻
]

== 6 Routing, rooted models, and minimizing path systems <sec:routing>

The minor constructions in the next two sections require two kinds of control over their connecting paths. We must insert rooted clique models inside districts while preserving the paths’ prescribed ends. We must also bound the list-coloring cost of deleting long path systems. We first establish the packing and replacement tools, then prove the sparsity bounds for minimum-length systems and show how to combine two families sharing a target set.

All paths in this section are simple; a path with one vertex is allowed when its two prescribed ends coincide. The length of a path is its number of edges. A family of paths is vertex-disjoint unless explicitly permitted to share prescribed starting vertices. When a path is oriented from its source to its target, its first and last vertices refer to that orientation.

=== 6.1 Packing paths and rooting a clique minor <packing-paths-and-rooting-a-clique-minor>

We begin with the vertex-capacity form of Menger’s theorem #cite(label("menger1927")), proved here by the integral max-flow/min-cut argument of Ford and Fulkerson #cite(label("fordfulkerson1956")).

#thm([Lemma 6.1.])[
  (Vertex path packing).  #emph[Let $A \, B$ be disjoint vertex sets in a graph $P$, and let $j gt.eq 1$ be an integer. Suppose that for every $X subset.eq V \( P \)$ with $\| X \| < j$, the graph $P - X$ contains a path from $A \\ X$ to $B \\ X$. Then there are $j$ pairwise vertex-disjoint paths from distinct vertices of $A$ to distinct vertices of $B$. Each path can be chosen to meet $A union B$ only at its two ends.]
] <lem:packing>

#proof[
  Replace each vertex $v$ by two vertices $v^(-) \, v^(+)$ and an arc $v^(-) v^(+)$ of capacity one. For each edge $u v$, add arcs $u^(+) v^(-)$ and $v^(+) u^(-)$, both of capacity $j$. Add a source $s$ with arcs $s a^(-)$ of capacity $j$ for $a in A$, and a sink $z$ with arcs $b^(+) z$ of capacity $j$ for $b in B$.
  Start with zero flow. Whenever the residual directed graph has an $s$–$z$ path, augment by one unit along it. Residual capacities remain integral. Stop upon reaching value $j$, or if no residual $s$–$z$ path exists. In the latter case let $R$ be the vertices reachable from $s$ in the residual graph. Every original arc from $R$ to its complement is saturated, and every original arc entering $R$ from its complement has zero flow. Flow conservation therefore shows that the capacity of the outgoing cut equals the current flow value.
  If this value is less than $j$, no capacity-$j$ arc crosses the cut. Its outgoing arcs are consequently unit arcs $v^(-) v^(+)$, for a set $X$ of fewer than $j$ original vertices. Any $A$–$B$ path in $P - X$ would give an $s$–$z$ path avoiding those cut arcs, which is impossible. This contradicts the hypothesis. Thus an integral flow of value $j$ is reached.
  Decompose that flow into unit $s$–$z$ paths and directed cycles, and discard the cycles. Each original vertex is used by at most one of the unit paths because its unit arc has capacity one. The corresponding paths in $P$ are therefore vertex-disjoint. On each such path, take its first visit to $B$ and its last preceding visit to $A$, and retain the segment between them. This gives the asserted endpoint convention without changing the number or disjointness of the paths. ◻
]

#thm([Lemma 6.2.])[
  (Two paths from every source).  #emph[Let $A \, B$ be disjoint vertex sets in a graph $P$, where $r = \| A \| gt.eq 1$. If $P$ is $2 r$-connected and $\| B \| gt.eq 2 r$, there are two paths starting at each vertex of $A$, ending at $2 r$ distinct vertices of $B$, with no intersections other than the two paths sharing their prescribed start. Their internal vertices lie outside $A union B$.]
] <lem:double-packing>

#proof[
  Replace each vertex of $A$ by two copies. For every original edge, join all copies of one endpoint to all copies of the other, treating a vertex outside $A$ as having a single copy. Write $A^(*)$ for the $2 r$ source copies. The target set $B$ is unchanged.
  Let $X^(*)$ be a set of fewer than $2 r$ vertices of this new graph. At least one source copy and at least one target survive. In the original graph delete the set $X$ of vertices all of whose copies were deleted. Then $\| X \| lt.eq \| X^(*) \| < 2 r$, so the surviving original source and target are connected in $P - X$. A simple path between them lifts to a path in the copy graph minus $X^(*)$ by choosing a surviving copy at each vertex. Thus $X^(*)$ cannot separate $A^(*)$ from $B$.
  Lemma 25 now gives $2 r$ vertex-disjoint paths from $A^(*)$ to $B$. Every source copy is an endpoint of one path, so no source copy is internal to another path. Identifying the two copies of each source therefore introduces exactly the permitted common starts and no other overlaps. The endpoint convention in Lemma 25 also excludes internal vertices in $B$. ◻
]

A stronger rooted-minor theorem of Kawarabayashi is recorded in #cite(label("DelcourtPostle2021")) Lemma 5.14. We include a proof of the form needed here.

#thm([Lemma 6.3.])[
  (Rooting a large clique minor).  #emph[Let $k gt.eq 1$. If $P$ is $2 k$-connected and $h \( P \) gt.eq 4 k$, then any given $k$ distinct vertices are roots of a $K_k$ model: its bags can be indexed by the given vertices so that each bag contains its indexing root.]
] <lem:rooting>

#proof[
  We use two successive path packings. The first sends two paths from each root towards the given clique model and leaves some model bags untouched. Its path–bag unions may overlap, but each vertex lies in at most two of them. This bound will certify a second packing to untouched bags, producing the disjoint rooted model.
  Let $R$ be the prescribed root set. Start with $4 k$ disjoint bags of a clique model. At most $k$ of these bags meet $R$, so choose $3 k$ bags disjoint from $R$ and call them eligible. Choose one representative in each eligible bag. Lemma 26, applied to these representatives as targets, gives two paths from each root, with their $2 k$ ends in distinct eligible bags.
  Among all such double systems, now allowing arbitrary endpoints within the eligible bags but still requiring distinct end bags, choose one of minimum total length. No path meets an eligible bag that is not an end bag of the system: its first such visit would allow that path to be truncated and assigned the unused bag, strictly reducing total length. Consequently at least $k$ eligible bags are untouched by every path. Choose $k$ of them and contract each to a single target vertex; let $T$ be the resulting set of $k$ targets.
  For each of the $2 k$ paths of the double system, take its union with its own end bag. These $2 k$ connected sets are unchanged by the contractions just made. Every vertex belongs to at most two of them. Indeed, a vertex outside $R$ belongs to at most one path and at most one eligible bag, whereas a root belongs to its two paths and to no eligible bag. Paths may pass through other used end bags; this observation already allows for those intersections.
  In the contracted graph, delete fewer than $k$ vertices. They meet fewer than $2 k$ of the connected sets just described, so at least one such set survives intact, including its root. At least one vertex of $T$ also survives. The surviving set has an edge to every surviving vertex of $T$, because its end bag was adjacent to every one of the contracted eligible bags. Hence these deletions cannot separate $R$ from $T$.
  Apply Lemma 25 with $j = k$. All $k$ roots and all $k$ targets are used as endpoints, and none is internal on another path. Expand each contracted target bag and add to it the vertices of its root-to-target path. The resulting bags are connected and disjoint. They remain pairwise adjacent through the original edges between the target bags, and each contains its assigned root. ◻
]

=== 6.2 Wovenness and replacement inside districts <wovenness-and-replacement-inside-districts>

Wovenness records the simultaneous rooted-model and path property used in Postle’s framework #cite(label("Postle2020")) Section 3.3; see also #cite(label("DelcourtPostle2021")) Definition 5.12. We specify the endpoint coincidences because the recursive construction uses them.

#prodef([Definition 6.4.])[
  For integers $a gt.eq 1$ and $b gt.eq 0$, a graph $J$ is #emph[$\( a \, b \)$-woven] if the following holds. Prescribe $a$ distinct roots $R = { r_1 \, dots.h \, r_a }$ and at most $b$ pairs $\( x_1 \, y_1 \) \, dots.h \, \( x_p \, y_p \)$ of vertices of $J$. The endpoint sets ${ x_i \, y_i }$ must be disjoint for different $i$, but $x_i = y_i$ is allowed, and endpoints may belong to $R$. Then there are a $K_a$ model with bags $M_1 \, dots.h \, M_a$ satisfying $r_j in M_j$, and pairwise vertex-disjoint $x_i$–$y_i$ paths $Q_i$, such that
  $ V \( Q_i \) ∩ union.big_(j = 1)^a M_j med subset.eq med R ∩ { x_i \, y_i } #h(2em) \( 1 lt.eq i lt.eq p \) . $
  For a coincident pair the path is the single prescribed vertex. Because the model bags are disjoint and contain all the roots, any allowed intersection at $r_j$ belongs to the designated bag $M_j$.
] <def:woven>

We use the woven-subgraph replacement argument of #cite(label("DelcourtPostle2021")) Lemma 5.15, recording its intersection conclusions at the first and last district visits of each path.

#thm([Lemma 6.5.])[
  (Rerouting through a woven district).  #emph[Let $J$ be an $\( a \, b \)$-woven subgraph of a graph $P$, and prescribe $a$ distinct roots in $J$. Let $Q_1 \, dots.h \, Q_q$ be vertex-disjoint paths in $P$, where $q lt.eq b$. Orient each path arbitrarily. For every path meeting $J$, let $x_i \, y_i$ be its first and last vertices in $J$. There are vertex-disjoint paths $Q'_1 \, dots.h \, Q'_q$ with the same respective endpoints, and a model rooted at the prescribed roots in $J$, such that the following properties hold:]
  + #emph[every vertex added to a path belongs to $J$; more precisely, $V \( Q'_i \) \\ V \( J \) subset.eq V \( Q_i \) \\ V \( J \)$;]
  + #emph[a path originally disjoint from $J$ is unchanged;]
  + #emph[the intersection of $Q'_i$ with the model is contained in the prescribed roots among $x_i \, y_i$.]
  #emph[The construction can be applied successively in disjoint districts. If some prescribed roots are endpoints of the original path system, the bags for these roots meet the resulting paths only at their own roots, including after all subsequent replacements in other districts.]
] <lem:rerouting>

#proof[
  The pairs $\( x_i \, y_i \)$ are admissible in Definition 28: their endpoint sets are disjoint across paths, and a path meeting $J$ only once gives a permitted coincident pair. Apply wovenness to all these pairs. On each path meeting $J$, replace the entire segment from $x_i$ to $y_i$ by the path supplied inside $J$. Its retained prefix and suffix have no vertices in $J$ except their attachment endpoints. They are disjoint from the interiors of all the replacement paths. The retained pieces of different original paths are themselves disjoint, and the replacement paths are disjoint by wovenness. The resulting concatenations are therefore simple, vertex-disjoint paths with the required endpoints and intersections. Notice that a replaced segment may have made excursions outside $J$; those excursions are removed, explaining the inclusion rather than equality in (i).
  For successive replacements, the new vertices at a later step lie in a district disjoint from every earlier district and its model. Thus no new intersection with an earlier model is introduced. A prescribed root that is an original path endpoint remains that endpoint at every step. In its own district it is a first or last visit of that path, and no other path contains it. Its bag therefore has precisely the allowed path intersection. ◻
]

#prodef([Remark 6.6.])[
  The last conclusion does not require every prescribed root to be a path endpoint. An auxiliary root can be a first or last visit of an unrelated path, and its bag can then meet that path at this root. If only bags whose roots are designated path endpoints are retained, discarding the auxiliary bags removes this issue. A root that was strictly between the first and last district visits need not remain on that path after rerouting.
] <routing:padding-roots>

Fix the positive integer $gamma$ from Theorem 5, and set

#[#set math.equation(numbering: n => "(29)")
 $ K_0 = 10^5 gamma . $ <routing:K0>]

#thm([Lemma 6.7.])[
  (Small districts are woven).  #emph[For all sufficiently large integers $t$, every $\( K_0 t \)$-connected graph $J$ of order at most $t^1.06$ is $\( s \, 3 t \)$-woven whenever 
$ 1 lt.eq s lt.eq 2 ⌈frac(t, \( log t \)^2)⌉ . $

 The cutoff is absolute and uniform in $s$ and $J$. No minor-exclusion hypothesis on $J$ is required.]
] <lem:small-woven>

#proof[
  We set aside the prescribed roots and pair endpoints, then split the remaining vertices into one part containing an unrooted clique model and a second, still highly connected part in which to join its bags to the roots and route all prescribed pairs.
  Fix an admissible root set and a system of at most $3 t$ pairs. Let $Z$ be the union of the roots and all pair endpoints. For sufficiently large $t$ the displayed upper bound on $s$ is at most $t$, so $\| Z \| lt.eq 7 t$. Put $k' = floor.l K_0 t \/ 2 floor.r$. Deleting $Z$ leaves a $k'$-connected graph: deleting a further set of fewer than $k'$ vertices still deletes fewer than $K_0 t$ vertices in total, and the order condition also follows from $\| V \( J \) \| > K_0 t$. Every vertex of $J$, including each vertex of $Z$, has at least $K_0 t - \| Z \| gt.eq k'$ neighbors outside $Z$.
  Independently place each vertex of $J - Z$ in $A$ with probability $1 \/ 1000$, and write $B' = V \( J \) \\ \( Z union A \)$. We show that with probability tending to one both of the following hold:
  #[#set math.equation(numbering: n => "(30)")
   $ \| N_J \( v \) ∩ A \| & gt.eq k' \/ 2000 \, & \| N_J \( v \) ∩ B' \| & gt.eq k' \/ 2 &  & \( v in V \( J \) \) \,\
J \[ B' \] & upright(" is ") floor.l k' \/ 32 floor.r upright("-connected") . $ <routing:split-degrees>]
  For each vertex of $J$, fix $k'$ of its neighbors outside $Z$. The number of these neighbors placed in $A$ is a sum of $k'$ independent indicators with mean $k' \/ 1000$. By Lemma 7, the probability that it is below $k' \/ 2000$ or above $k' \/ 2$ is $exp \( - Omega \( k' \) \)$. A union bound over at most $t^1.06$ vertices proves (30) with probability tending to one.
  For (30), form in advance the cut-test matchings of Lemma 8 for $J - Z$, with connectivity parameter $k'$ and order bound $n = t^1.06$. The number of tests is at most
  $ exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] O \( t^0.06 \( log t \)^2 \) #scale(x: 120%, y: 120%)[\)] . $
  A test matching has at most $k' \/ 4$ endpoints. The expected number of its endpoints in $A$ is at most $k' \/ 4000$, whereas the cut test allows fewer than $k' \/ 32$. This leaves a fixed positive multiple of $k'$ as a deviation margin. Lemma 7, applied to at most $k' \/ 4$ independent indicators, bounds each failure probability by $exp \( - Omega \( k' \) \)$. Their union has probability tending to zero. On the degree event (30), every vertex of $J - Z$ has at least $k' \/ 2$ neighbors outside $A$. Thus all hypotheses of Lemma 8 hold simultaneously with positive probability, and it gives (30). Fix such a split.
  The graph $J \[ A \]$ is nonempty and has minimum degree at least $k' \/ 2000$; hence its density is at least $k' \/ 4000 = Omega \( t \)$. Uniformly for the allowed values of $s gt.eq 2$,
  $ s log \( 2 s \) = O #h(-0.16667em) (frac(t, log t)) = o \( t \) . $
  Lemma 20 therefore implies that $J \[ A \]$ contains a $K_s$ model, for all sufficiently large $t$. If $s = 1$, a single vertex of $A$ supplies the model. Denote the model bags by $M_1^0 \, dots.h \, M_s^0$ and select a port $p_j in M_j^0$ from each bag.
  Choose distinct representatives in $B'$ for all the following roles: each port, each root, and each of the two endpoints of every noncoincident prescribed pair. A representative is required to be a neighbor of the vertex it represents. When a root is also a pair endpoint, its two roles receive different representatives. There are at most $2 s + 6 t lt.eq 8 t$ roles. By (30), each has at least $k' \/ 2$ available neighbors in $B'$, so greedy distinct selection is possible.
  Partition the representatives into groups of size two: the port and root representatives for each $j$, and the two endpoint representatives for each noncoincident pair. By (29), for sufficiently large $t$,
  $ ⌊k' / 32⌋ gt.eq gamma \( 2 s + 6 t \) . $
  Theorem 5 in $J \[ B' \]$ gives disjoint connected sets for these groups. Write $C_j$ for the set joining the representatives of $p_j$ and $r_j$. The set
  $ M_j = M_j^0 union C_j union { r_j } $
  is connected, using the two representative attachment edges. These sets are disjoint and remain pairwise adjacent through the original model on $A$.
  In each other grouping set choose a path joining its two representatives, and extend it by their attachment edges to the original pair endpoints. Use the trivial path for every coincident pair. The nontrivial paths are disjoint inside $B'$, all their original endpoints lie in $Z$, and different pairs have disjoint endpoint sets. The model bags contain no vertices of $Z$ except their own roots. Consequently the only model–path intersections are roots that are endpoints of the respective pairs, exactly as in Definition 28. ◻
]

=== 6.3 Minimum-length systems with free target assignments <minimum-length-systems-with-free-target-assignments>

The bounds below use the unpaired geodesic-path argument of Postle #cite(label("Postle2020")) Lemma 4.14, extended here to two paths at each source. The freedom to reassign targets is essential: the proof shortens a system by exchanging its path suffixes.

The graph in which a path system is minimized matters: all shortcut and degree statements below concern edges of that same graph. We shall use two kinds of systems with disjoint source and target sets $A \, B$:

+ two paths from each vertex of $A$, ending at distinct vertices of $B$, with intersections allowed only at their prescribed repeated starts;
+ a specified number $q$ of vertex-disjoint paths from arbitrary distinct vertices of $A$ to arbitrary distinct vertices of $B$.

In either case there is no prescribed pairing between sources and targets. For type (1), the total number of paths is $q = 2 \| A \|$.

#thm([Lemma 6.8.])[
  (Bounds from unpaired path minimization).  #emph[Let $A \, B$ be disjoint vertex sets in a graph $P$. Suppose that a system of one of the two types above is feasible, and choose one of minimum total length. Let $q$ be its number of paths and $U$ its vertex union. Then:]
  + #emph[the paths have no internal vertices in $A union B$;]
  + #emph[each vertex of $V \( P \) \\ U$ has at most three neighbors on any one path;]
  + #emph[$P \[ U \\ A \]$ is $2 q$-degenerate for type (1), and $P \[ U \]$ is $2 q$-degenerate for type (2).]
] <lem:path-minimization>

#proof[
  An internal visit to $B$ would allow truncation at that visit, strictly shortening a path. Its new target cannot be the target of another path, by disjointness. For type (2), an internal visit to $A$ likewise allows deletion of the initial segment, making that visit the new source. For type (1), all sources are already prescribed starts, and the allowed-intersection rule excludes any internal visit to $A$. This proves (i).
  For (ii), let $v in.not U$ have at least four neighbors on a path $x_0 x_1 dots.h.c x_l$, ordered from source to target. Its first and last neighbor indices $i < j$ satisfy $j - i gt.eq 3$. If $v in.not A union B$, replace the segment from $x_i$ to $x_j$ by $x_i v x_j$. This saves at least one edge and introduces no intersection with another path. If $v in B$, truncate the path after $x_i$ and use $v$ as its target; here $i + 1 lt.eq l - 2 < l$. If $v in A$, the system must have type (2), since all type (1) sources belong to $U$. Start instead at $v$ and follow the suffix from $x_j$ to $x_l$; its length is $1 + l - j lt.eq l - 2$. These are valid systems with new free endpoint choices, contradicting minimality in every case.
  To prove (iii), put $U_0 = U \\ A$ for type (1) and $U_0 = U$ for type (2). Suppose that some nonempty induced subgraph $P \[ S \]$, $S subset.eq U_0$, has minimum degree greater than $2 q$. For every path meeting $S$, mark its first two vertices in $S$, or its only such vertex if there is just one. At most $2 q$ vertices are marked. Each vertex of $S$ belongs to exactly one path: the only possible overlaps were the repeated starts, which were removed in type (1).
  For a path $Q_i$ meeting $S$, let $u_i$ be its first vertex in $S$. Its degree in $P \[ S \]$ is greater than $2 q$, so it has a neighbor $v_i$ in $S$ which is not marked. This vertex belongs to some path $Q_j$ and is at least its third vertex in $S$. Direct an arrow from $i$ to $j$, recording the edge $u_i v_i$. Every participating path has one outgoing arrow, so these arrows contain a directed cycle, possibly a loop.
  For each arrow $i arrow.r j$ on this cycle, form a new path from the prefix of $Q_i$ ending at $u_i$, the edge $u_i v_i$, and the suffix of $Q_j$ starting at $v_i$. Leave all paths outside the cycle unchanged. On each cycle path $Q_j$, the retained prefix ends at $u_j$, while the retained suffix begins at the incoming arrow’s vertex, at least the third vertex of $S$ on $Q_j$. The two retained pieces are disjoint and separated by at least two original path edges. Pieces lying on different original paths are disjoint except for the permitted repeated starts. Thus the new concatenations are simple and satisfy precisely the original disjointness conditions.
  Every original source prefix is retained, so the required sources and their multiplicities are unchanged. This remains true if both paths with the same source belong to the directed cycle: only their suffixes are exchanged, and their shared initial vertex remains their only intersection. The target suffixes are permuted, preserving distinct targets. Such a permutation is allowed because no pairing was prescribed.
  If the cycle has $c$ paths, at least $2 c$ original edges are removed between their retained prefixes and suffixes, and precisely $c$ joining edges are inserted. The total length decreases by at least $c > 0$. This final contradiction proves (iii). ◻
]

=== 6.4 Combining two doubled families <combining-two-doubled-families>

#thm([Lemma 6.9.])[
  (Combining paths by pairing temporary sources).  #emph[Let $Z \, D \, V \( H \)$ be pairwise disjoint vertex sets in a graph $P$, and let $m gt.eq 1$. Suppose there are:]
  + #emph[two paths from each vertex of $Z$ to distinct vertices of $D$, with all target ends distinct, with intersections only at their prescribed repeated starts, and avoiding $V \( H \)$;]
  + #emph[$2 m$ vertex-disjoint paths from distinct vertices of $H$ to distinct vertices of $D$, avoiding $Z$ and meeting $H$ only at their starting vertices.]
  #emph[Then, using only vertices of these two families, one can obtain $\| Z \| + m$ vertex-disjoint paths to distinct vertices of $D$, one starting at each vertex of $Z$ and one starting at each of $m$ distinct vertices of $H$. These paths meet $D$ and $H$ only at their appropriate ends. Moreover, after any partition of the $2 m$ second-family starts into $m$ pairs, the $m$ selected starts in $H$ can be required to include exactly one vertex from each pair. No unselected second-family start is visited by any of the resulting paths.]
] <lem:combine>

#proof[
  First truncate every input path at its first visit to $D$ if necessary. Within either family this preserves all distinctness and disjointness requirements. Work in the graph consisting only of the vertices and edges of the two resulting path families; ambient edges are unnecessary. For each prescribed pair of second-family starts, identify its two vertices to form one temporary source. The paths of that family have no other vertices in $H$, and the first family avoids $H$, so each original path still gives a path after identification.
  Write $N = \| Z \| + m$. There are now $N$ sources, namely $Z$ together with the $m$ temporary sources, and there are two given routes from each source to $D$. Across these $2 N$ routes, every vertex has congestion at most two, where congestion counts the number of routes containing the vertex. At a vertex of $Z$ there are only its two first-family routes, since the second family avoids $Z$. At a temporary source there are only its two second-family routes, since the first family avoids $H$. Elsewhere there is at most one route from each family. This includes vertices of $D$, whose ends are distinct within each family but need not be distinct between the two families.
  Deleting fewer than $N$ vertices meets fewer than $2 N$ routes. Some entire source-to-$D$ route therefore survives. By Lemma 25, there are $N$ disjoint paths from the full source set to $D$, with no internal source or target vertices. Every source is used, since the source set has cardinality $N$.
  Each temporary source occurs on exactly one packed path and only as its starting endpoint. Lift the first edge of that path to whichever one of its two original starts supplied this edge, and keep the rest of the path unchanged. This selects exactly one original start from the pair. No switching between the two original starts is needed, because the identified vertex was not internal. Different temporary sources came from disjoint pairs, so all the lifted paths remain vertex-disjoint.
  The only vertices of $H$ in the graph of the original families were the $2 m$ second-family starts. All their images were source vertices and could not be internal in the packing. Thus the lifted paths meet $H$ exactly at the $m$ selected starts; all unselected starts are absent. The target-end convention survives lifting, and every used vertex belongs to an original path family, as required. ◻
]

== 7 Separating two subgraphs of large list chromatic number <sec:separability>

We adapt the list-chromatic separability framework of Postle #cite(label("Postle2020")) Definition 2.4 and Lemmas 2.5–2.6. The next lemma allows the construction to branch. Its proof treats the alternative in which two disjoint subgraphs cannot both retain nearly all of the list chromatic number. In that alternative, successive highly connected regions must overlap substantially. We use these overlaps to extend a clique model through $O \( log^4 t \)$ small districts. Figure 1 illustrates one extension.

#thm([Lemma 7.1.])[
  (Separability).  #emph[There is an absolute positive integer $S$ such that, for all sufficiently large integers $t$, every graph $G$ satisfying 
$ h \( G \) < t \, #h(2em) r = ell \( G \) gt.eq 2 S t $

 has two vertex-disjoint induced subgraphs $G_1 \, G_2$ with 
$ ell \( G_1 \) \, ell \( G_2 \) gt.eq r - S t . $

]
] <lem:separability>

To understand the construction behind the lemma, suppose that no such pair of subgraphs exists. We carry $t$ disjoint connected label bags, each with one tip in a highly connected region of large list chromatic number. Alongside the bags we keep a #emph[footprint]: the set of all vertices recorded so far, including unused path vertices. A round adds adjacencies among a selected group of labels. Inside the current region, choose two disjoint small districts outside the footprint: one will supply a rooted clique model on these labels, while the other serves as a junction. Choose a minimum-total-length system of two paths from every old tip and every selected model root to distinct junction vertices.

Deleting the accumulated footprint, the districts, and these paths leaves enough list chromatic number to extract a fresh highly connected region. The supposition on $G$ forces the old and fresh regions to overlap. This overlap makes a second family of $2 t$ paths to the junction feasible, with distinct freely chosen starts in the fresh region; again minimize their total length. The two families may intersect. Lemma 33 combines them into disjoint paths from every old tip and model root, and from $t$ selected new tips. Rerouting through the model district installs the clique model; grouping the path ends in the junction joins each old bag to its new tip and, for a selected label, to its assigned model bag. Repeating the construction for suitably chosen groups makes every two label bags adjacent.

Every district and both original minimizing systems remain in the footprint. The paths actually extending the bags may have been rerouted and need not still minimize length; all deletion estimates use the recorded originals. These paths can have arbitrarily many vertices. The next lemma bounds the list-coloring cost of the whole footprint. By Lemma 19, it suffices to put a small set of vertices in $X$ and show that the remaining footprint $Y$ is $O \( t \)$-degenerate and that every vertex outside $X union Y$ has $O \( t \)$ neighbors in $Y$.

Throughout this section put

$ m_0 = ⌈\( log t \)^2⌉ \, #h(2em) R_t = frac(m_0 \( m_0 + 1 \), 2) . $

We take $t$ sufficiently large that $m_0 lt.eq t$. For a family of paths $cal(Q)$, write $V \( cal(Q) \)$ for the union of their vertex sets.

#thm([Lemma 7.2.])[
  (Deleting a history of paths).  #emph[Let $h \( G \) < t$. Start with $F_0 = W_0$, where $\| W_0 \| = t$, and perform at most $R_t$ rounds with the following rules. At the start of a round there is a footprint $F$ and a set $W subset.eq F$ of $t$ tips.]
  + #emph[Choose disjoint sets $J \, D subset.eq V \( G \) \\ F$, each of size at most $t^1.06$, and a set $R subset.eq J$ of at most $t$ vertices. Put $Z = W union R$.]
  + #emph[In the induced graph $G - \( F \\ W \)$, choose a minimum-total-length double system $cal(Q)_1$ from $Z$ to $D$: two paths from each vertex of $Z$, otherwise vertex-disjoint, with distinct target ends. Set 
$ F^(-) = F union J union D union V \( cal(Q)_1 \) . $

]
  + #emph[Choose a source set $A subset.eq V \( G \) \\ F^(-)$. In the induced graph $G - \( F union R \)$, choose a minimum-total-length system $cal(Q)_2$ of $2 t$ vertex-disjoint paths from arbitrary distinct vertices of $A$ to arbitrary distinct vertices of $D$. Set 
$ F^(+) = F^(-) union V \( cal(Q)_2 \) \, $

 and choose $t$ tips $W^(+) subset.eq F^(+)$ for the next round.]
  #emph[Only histories in which the indicated systems exist are considered. The final round may end after step (ii).]
  #emph[There is an absolute integer 
#[#set math.equation(numbering: n => "(31)")
 $ c_f = c_(6 B_(*) + 20) = 4 L + 6 B_(*) + 25 $ <separate:cf>]

 such that, for all sufficiently large $t$, every final footprint $F_(upright("last"))$ of such a history satisfies 
$ ell \( G - F_(upright("last")) \) gt.eq ell \( G \) - c_f t . $

 The same assertion holds for the initial footprint.]
] <separate:footprint>

#proof[
  We use $c_d$ from Lemma 19 and $B_(*)$ from Lemma 21. All constants and cutoffs in this proof are independent of the history and of the lengths of its paths.
  ===== 7.1 The two path collections. <the-two-path-collections.>
  Remove the starting vertex from each first-system path, and collect all the resulting nonempty paths in a family $cal(A)$. These paths are pairwise vertex-disjoint. Within one round the only intersections of first-system paths are their prescribed starts, which have been removed. Across rounds, a new first system avoids the old footprint except at its tips $W$. Every tip is a prescribed start, and no such start is internal on any path of the system. After stripping starts, the new paths therefore avoid the entire old footprint.
  Let $cal(B)$ consist of the full second-system paths from all rounds. These too are pairwise vertex-disjoint: each new second system avoids the entire old footprint, which contains every earlier second-system path. No disjointness between $cal(A)$ and $cal(B)$ is asserted or needed. There are at most $4 t$ first paths and $2 t$ second paths per round, so, if $q lt.eq R_t$ rounds have been started,
  #[#set math.equation(numbering: n => "(32)")
   $ \| cal(A) \| + \| cal(B) \| lt.eq 6 t q lt.eq 6 t R_t . $ <separate:path-count>]
  ===== 7.2 Small sets and exceptional vertices. <small-sets-and-exceptional-vertices.>
  Let $X_0$ contain all districts $J \, D$, all tip sets appearing in the history, and the ends of every path in both systems. Counting repetitions only increases the following bound:
  #[#set math.equation(numbering: n => "(33)")
   $ \| X_0 \| lt.eq 2 R_t t^1.06 + \( 13 R_t + 1 \) t . $ <separate:x0>]
  Indeed, there are at most $R_t + 1$ tip sets; the two systems together have at most $12 t$ path-end occurrences per round.
  Consider the footprints at the start of each round and also $F_(upright("last"))$; call these at most $R_t + 1$ sets the snapshots. The final snapshot will control neighbors of vertices outside the final footprint. Earlier snapshots will control the neighbors that a newly entering vertex has on older paths. At a snapshot $T$, let $cal(A)_T \, cal(B)_T$ be the two collections formed by systems already included in $T$. They use the original recorded paths, with only each first path’s own start removed; no vertices of the set $X$ defined below have yet been removed from these collections. For either collection $cal(C)$, declare a vertex $v in V \( G \) \\ T$ exceptional if it has a neighbor on at least $B_(*) t$ distinct members of $cal(C)$.
  To count these vertices, contract the disjoint connected paths of $cal(C)$ to a set of $\| cal(C) \|$ vertices. Vertices outside $T$ are not contracted. Their numbers of distinct neighbors in the contracted set are exactly the numbers of paths they see. The resulting graph is a minor of $G$, so Lemma 21 implies that the number of exceptional vertices is at most
  $ frac(t^(1 + 2 epsilon.alt) \| cal(C) \|, B_(*) t) lt.eq t^(2 epsilon.alt) \| cal(C) \| . $
  Apply this separately to $cal(A)_T$ and $cal(B)_T$. By (32), the number at one snapshot is at most $6 R_t t^(1 + 2 epsilon.alt)$. Let $X$ be $X_0$ together with the exceptional vertices from all snapshots, including exceptional vertices outside $F_(upright("last"))$. Then
  #[#set math.equation(numbering: n => "(34)")
   $ \| X \| & lt.eq 2 R_t t^1.06 + \( 13 R_t + 1 \) t + 6 R_t \( R_t + 1 \) t^(1 + 2 epsilon.alt)\
 & = O \( t^1.06 log^4 t \) + O \( t^1.01 log^8 t \) lt.eq t^(11 \/ 10) $ <separate:x-bound>]
  for sufficiently large $t$, since $epsilon.alt = 1 \/ 200$. Thus every required snapshot has been counted.
  Put $Y = F_(upright("last")) \\ X$. The sets $X \, Y$ are disjoint, and every vertex of $Y$ lies on a recorded path.
  ===== 7.3 Neighbors from outside the footprint. <neighbors-from-outside-the-footprint.>
  Let $v in.not X union Y$. Then $v in.not F_(upright("last"))$, so it was outside every recorded path union. Moreover, it belonged to the graph in which each system was minimized: every excluded set $F \\ W$ or $F union R$ is contained in $F_(upright("last"))$. By Lemma 32, it has at most three neighbors on each path. Nonexceptionality at the final snapshot bounds the number of paths it sees by fewer than $B_(*) t$ in each collection. All stripped starts lie in $X_0$. Consequently
  #[#set math.equation(numbering: n => "(35)")
   $ \| N_G \( v \) ∩ Y \| lt.eq 6 B_(*) t . $ <separate:external-degree>]
  ===== 7.4 Degeneracy inside the footprint. <degeneracy-inside-the-footprint.>
  Order the vertices of $Y$ by their round of first entry into the footprint. Within a round, put vertices on $cal(Q)_1$ first, and then the remaining new vertices on $cal(Q)_2$. This partitions $Y$ into at most two phases per round, because district vertices and all initial tips lie in $X_0$.
  A vertex $v$ entering in a given round was outside that round’s old footprint $F$. If $v in Y$, it was not exceptional at the snapshot $F$. For every earlier system, its forbidden vertices belong to $F$, while $v in.not F$; hence $v$ was eligible in the graph of that minimization and was outside its path union. The preceding argument therefore gives at most $6 B_(*) t$ neighbors of $v$ in $Y$ from earlier rounds.
  A first phase is contained in the union of at most $4 t$ first-system paths with their starts removed. Lemma  32 makes its induced graph $8 t$-degenerate. A second phase is contained in the union of $2 t$ minimizing second-system paths, so its induced graph is $4 t$-degenerate, and in particular $8 t$-degenerate. These are assertions about the induced graphs in $G$: all vertices of the relevant phase belong to the graph used for that minimization, which was an induced subgraph of $G$.
  Finally, a vertex in the second phase of a round lies outside the entire first-system union and outside the old footprint. It therefore belongs to $G - \( F \\ W \)$. Lemma 32 bounds its neighbors in the first phase by $3 \( 4 t \) = 12 t$.
  In any nonempty subgraph of $G \[ Y \]$, select the latest represented phase and a vertex of degree at most $8 t$ within that phase. It has no neighbors in a later represented phase, at most $12 t$ neighbors in an earlier phase of the same round, and at most $6 B_(*) t$ neighbors in earlier rounds. Hence $G \[ Y \]$ is $\( 6 B_(*) + 20 \) t$-degenerate.
  Equations (34) and (35) now verify every hypothesis of Lemma 19, with $d = 6 B_(*) + 20$. It follows that
  $ ell \( G - X - Y \) gt.eq ell \( G \) - c_f t . $
  Since $F_(upright("last")) subset.eq X union Y$, the graph $G - F_(upright("last"))$ contains $G - X - Y$ as an induced subgraph. Monotonicity of list chromatic number proves the assertion. For the initial footprint the same proof has $Y = diameter$ and $X = W_0$. ◻
]

#proof[
  Let $K_0 = 10^5 gamma$ be the integer fixed in Lemma 31, and put $k = K_0 t$. Let $D_(K_0)$ be supplied by Lemma 23. Use $c_f$ from (31), put
  #[#set math.equation(numbering: n => "(36)")
   $ c_h = c_f + 6 \( K_0 + 1 \) + 2 \, $ <separate:ch>]
  and let $c_0 = 4 L + 5$ be the deletion constant for $d = 0$. Choose a positive integer $S$ satisfying
  #[#set math.equation(numbering: n => "(37)")
   $ S & > c_h + K_0 + 2 \,\
2 S - c_f & > 6 \( K_0 + 1 \) + 2 \,\
2 S - c_h - 1 - c_0 & > 2 D_(K_0) + 3 . $ <separate:S>]
  These choices involve only constants already fixed. We then take $t$ sufficiently large for Lemmas 23, 31, 19, and 35 with the fixed parameters used below, and for all displayed size inequalities in the construction.
  Suppose that $r = ell \( G \) gt.eq 2 S t$, $h \( G \) < t$, but no two vertex-disjoint induced subgraphs of $G$ both have list chromatic number at least $r - S t$. We will construct a $K_t$ model.
  ===== 7.5 Labels, rounds, and invariants. <labels-rounds-and-invariants.>
  Partition the label set ${ 1 \, dots.h \, t }$ into $m_0$ nonempty blocks, each of size at most $ceil.l t \/ m_0 ceil.r$. Schedule one round for each individual block and one for each unordered pair of distinct blocks. There are $R_t$ rounds. The labels treated in a round form a set $I$, which is either a block or the union of its two assigned blocks. Its size $s$ satisfies, for sufficiently large $t$,
  #[#set math.equation(numbering: n => "(38)")
   $ 1 lt.eq s lt.eq 2 ⌈t / m_0⌉ lt.eq 2 ⌈frac(t, \( log t \)^2)⌉ lt.eq t . $ <separate:s>]
  Every pair of distinct labels occurs together in a scheduled round.
  At the start of a round we maintain the following data.
  + Pairwise disjoint nonempty connected vertex sets $B_1 \, dots.h \, B_t$, with all adjacencies obtained in earlier rounds.
  + A footprint $F$ containing these sets and arising from the history rules of Lemma 35. It retains all vertices of every district and of both original minimizing path systems from every completed round.
  + A $k$-connected induced region $H$ with
    $ ell \( H \) gt.eq r - c_h t \, #h(2em) V \( H \) ∩ F = W \, $
    where $W = { w_1 \, dots.h \, w_t }$ consists of distinct tips with $w_j in B_j$.
  In particular, no vertex of $H - W$ belongs to an earlier footprint. The distinction between the footprint and the sets $B_j$ is useful: unused path vertices remain in the footprint and are accounted for by Lemma 35.
  The inequalities in (37) imply $r > 6 k$. Lemma 17 supplies a $k$-connected induced subgraph $H$ with $ell \( H \) gt.eq r - 6 k gt.eq r - c_h t$. It has more than $k gt.eq t$ vertices. Choose distinct tips $w_j$ there and initialize $B_j = { w_j }$ and $F = W$.
  ===== 7.6 Two districts and the first minimizing system. <two-districts-and-the-first-minimizing-system.>
  Consider a round with label set $I$ of size $s$. Deleting its current tips gives
  $ ell \( H - W \) gt.eq r - \( c_h + 1 \) t . $
  Corollary 24 states that if $ell \( P \) > 2 D_(K_0) t + 2$ and $h \( P \) < t$, then $P$ contains an induced $k$-connected district of order at most $t^1.06$.
  First obtain such a district $J subset.eq H - W$. Delete it using Lemma 19 with $X = V \( J \)$ and $Y = diameter$, losing at most $c_0 t$. The remaining list chromatic number is at least
  $ r - \( c_h + 1 + c_0 \) t gt.eq \( 2 S - c_h - 1 - c_0 \) t > \( 2 D_(K_0) + 3 \) t > 2 D_(K_0) t + 2 . $
  The same district consequence supplies a second district $D subset.eq H - W - J$. Both $J \, D$ are $k$-connected and have order at most $t^1.06$, and both are disjoint from $F$. Choose distinct roots $R_J = { u_j : j in I }$ in $J$, and put
  $ Z = W union R_J \, #h(2em) \| Z \| = t + s lt.eq 2 t . $
  The graph $H$ is a subgraph of $G - \( F \\ W \)$, is $2 \| Z \|$-connected, and contains the disjoint source and target sets $Z \, D$. Also $\| D \| > k gt.eq 2 \| Z \|$. Lemma 26 therefore gives a feasible double system. Among all such systems in the full induced graph
  #[#set math.equation(numbering: n => "(39)")
   $ G - \( F \\ W \) $ <separate:first-domain>]
  choose a minimum-total-length system $cal(Q)_1$. Its only intersections with $F$ are its prescribed starts in $W$. Set
  $ F^(-) = F union V \( J \) union V \( D \) union V \( cal(Q)_1 \) . $
  The history ending with this first system satisfies Lemma 35, and hence
  #[#set math.equation(numbering: n => "(40)")
   $ ell \( G - F^(-) \) gt.eq r - c_f t . $ <separate:intermediate-loss>]
  ===== 7.7 The next region and the second minimizing system. <the-next-region-and-the-second-minimizing-system.>
  By (37), the right side of (40) is greater than $6 \( K_0 + 1 \) t$. Lemma 17 gives a $\( K_0 + 1 \) t$-connected induced region $H' subset.eq G - F^(-)$ with
  #[#set math.equation(numbering: n => "(41)")
   $ ell \( H' \) gt.eq r - #scale(x: 120%, y: 120%)[\(] c_f + 6 \( K_0 + 1 \) #scale(x: 120%, y: 120%)[\)] t . $ <separate:new-region-list>]
  We claim that $\| V \( H' \) ∩ V \( H \) \| gt.eq k$. Otherwise deleting this intersection from $H'$ gives an induced subgraph disjoint from $H$, of list chromatic number at least
  $ r - #scale(x: 120%, y: 120%)[\(] c_f + 6 \( K_0 + 1 \) + K_0 #scale(x: 120%, y: 120%)[\)] t gt.eq r - S t . $
  The other graph $H$ has list chromatic number at least $r - c_h t gt.eq r - S t$. This contradicts the supposition on $G$.
  It follows that the graph induced by $V \( H \) union V \( H' \)$ is $k$-connected. After deleting fewer than $k$ vertices, each of its two regions is connected and at least one vertex of their intersection survives. This union meets $F$ only in $W$. Deleting $Z = W union R_J$ leaves a graph of connectivity at least
  $ k - \| Z \| gt.eq \( K_0 - 2 \) t gt.eq 2 t \, $
  contained in the induced graph
  #[#set math.equation(numbering: n => "(42)")
   $ G - \( F union R_J \) . $ <separate:second-domain>]
  Neither $H'$ nor $D$ meets $Z$, these two endpoint sets are disjoint, and each has more than $2 t$ vertices. Lemma 25 supplies $2 t$ disjoint paths between them.
  Choose $cal(Q)_2$ of minimum total length among all $2 t$-path systems from arbitrary distinct vertices of $H'$ to arbitrary distinct vertices of $D$, in the full graph (42). This is an unpaired minimization. Its paths meet $H'$ and $D$ only at their respective ends. Let $T' subset.eq V \( H' \)$ be their $2 t$ starting vertices, and put
  $ F^(+) = F^(-) union V \( cal(Q)_2 \) . $
  In particular,
  #[#set math.equation(numbering: n => "(43)")
   $ V \( H' \) ∩ F^(+) = T' . $ <separate:region-footprint>]
  This completes another round of the history in Lemma 35.
  ===== 7.8 Combining the systems and inserting the district model. <combining-the-systems-and-inserting-the-district-model.>
  The sets $Z \, V \( H' \) \, V \( D \)$ are pairwise disjoint. The first system avoids $H'$, since it lies in $F^(-)$; the second avoids $Z$, by its domain (42). Lemma 33, with $m = t$, gives
  $ q = \| Z \| + t = 2 t + s lt.eq 3 t $
  vertex-disjoint paths to distinct vertices of $D$, one from each vertex of $Z$ and one from each vertex of a selected set $W^(+) subset.eq T'$ of size $t$. They meet $D \, H'$ only at their designated ends, use only vertices of the two systems, and meet $F$ only in the $W$-ends. In particular, they do not visit the unused starts $T' \\ W^(+)$. Assign $W^(+) = { w_1^(+) \, dots.h \, w_t^(+) }$ bijectively to the labels.
  By (38) and Lemma 31, the district $J$ is $\( s \, 3 t \)$-woven. Apply Lemma 29 to the $q$ combined paths and the roots $R_J$. It produces in $J$ a rooted $K_s$ model with bags $C_j$, $j in I$, and reroutes the combined paths without changing their ends. Each root $u_j$ was already the endpoint of its own path. Thus the model meets the paths only at these roots, each on its corresponding path and in its corresponding bag.
  The new vertices of the rerouted paths lie in $J subset.eq F^(+)$. Since $J$ is disjoint from $F \, H' \, D$, all the previous endpoint-only intersection statements with these sets persist. All rerouted paths and all bags $C_j$ lie in $F^(+)$. We continue to record the original minimizing systems in the history; the rerouted paths are used only to extend the label bags.
  ===== 7.9 Grouping in $D$ and restoring the invariants. <grouping-in-d-and-restoring-the-invariants.>
  For each label $j$, group the terminals in $D$ belonging to the paths from $w_j$, from $w_j^(+)$, and, if $j in I$, from $u_j$. These groups partition the $q$ distinct terminals. Since
  $ gamma q lt.eq 3 gamma t lt.eq K_0 t \, $
  Theorem 5 supplies pairwise disjoint connected sets $E_1 \, dots.h \, E_t$ in $D$ containing their respective groups. For the next region put
  $ H^(+) = H' - \( T' \\ W^(+) \) . $
  Figure 1 now shows how these pieces fit into one extended label bag.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 6.55), [#text(size: 9pt)[\(a\) Original minimizing systems]], anchor: "west", padding: 0.1176cm)
  rect((0.1, 3.85), (2.35, 5.75), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((1.22, 5.38), [#text(size: 8pt)[$F$]])
  content((1.22, 5.02), [#text(size: 8pt)[old footprint]])
  circle((2.35, 4.45), radius: 0.07056, fill: black, stroke: none)
  content((2.32, 4.43), [#text(size: 8pt)[$W$]], anchor: "north-east", padding: 0.1176cm)
  rect((4.1, 5.2), (6.35, 6.1), fill: rgb("#f5f5ff"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((4.6, 5.77), [#text(size: 8pt)[$J$]])
  circle((6.35, 5.52), radius: 0.07056, fill: black, stroke: none)
  content((6.32, 5.53), [#text(size: 8pt)[$R_J$]], anchor: "south-east", padding: 0.1176cm)
  rect((7.6, 3.85), (9.8, 5.75), fill: rgb("#f5f5ff"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((8.7, 5.4), [#text(size: 8pt)[$D$]])
  circle((7.6, 4.45), radius: 0.07056, fill: black, stroke: none)
  circle((7.6, 5.02), radius: 0.07056, fill: black, stroke: none)
  circle((9.8, 4.45), radius: 0.07056, fill: black, stroke: none)
  rect((11.35, 3.85), (13.6, 5.75), fill: rgb("#fff9f2"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((12.47, 5.38), [#text(size: 8pt)[$H'$]])
  content((12.47, 5.02), [#text(size: 8pt)[new region]])
  circle((11.35, 4.45), radius: 0.07056, fill: black, stroke: none)
  content((11.38, 4.43), [#text(size: 8pt)[$T'$, $|T'|=2t$]], anchor: "north-west", padding: 0.1176cm)
  line((2.35, 4.45), (7.6, 4.45), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10), mark: (end: ">"))
  content((4.5, 4.45), [#text(fill: rgb("#0000b2"))[#text(size: 8pt)[$cal(Q)_1$: two paths per start]]], anchor: "south", padding: 0.1176cm)
  bezier((6.35, 5.52), (7.6, 5.02), (6.857, 5.384), (7.124, 5.242), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10), mark: (end: ">"))
  line((11.35, 4.45), (9.8, 4.45), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10, dash: "dashed"), mark: (end: ">"))
  content((10.6, 4.45), [#text(fill: rgb("#d96d00"))[#text(size: 8pt)[$cal(Q)_2$]]], anchor: "south", padding: 0.1176cm)
  content((0, 3.38), [#text(size: 9pt)[\(b\) One label after combination, rerouting, and grouping]], anchor: "west", padding: 0.1176cm)
  rect((0.1, 0.25), (2.6, 1.6), fill: rgb("#ebf5eb"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((1.05, 1.21), [#text(size: 8pt)[old bag $B_j$]])
  circle((2.6, 0.75), radius: 0.07056, fill: rgb("#003300"), stroke: none)
  content((2.57, 0.72), [#text(size: 8pt)[$w_j$]], anchor: "north-east", padding: 0.1176cm)
  rect((6.45, 0.25), (8.95, 1.6), fill: rgb("#e0f0e0"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((7.7, 0.9), [#text(size: 8pt)[$E_j subset.eq D$]])
  rect((6.3, 2), (9.1, 2.85), fill: rgb("#ebf5eb"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((7.7, 2.57), [#text(size: 8pt)[$C_j subset.eq J$, if $j in I$]])
  circle((7.7, 2), radius: 0.07056, fill: rgb("#003300"), stroke: none)
  content((7.76, 2.03), [#text(size: 8pt)[$u_j$]], anchor: "south-west", padding: 0.1176cm)
  line((7.7, 2), (7.7, 1.6), stroke: (paint: rgb("#003300"), thickness: 1.2pt, miter-limit: 10))
  rect((11.35, 0.25), (13.6, 1.6), fill: rgb("#fff9f2"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((12.47, 1.21), [#text(size: 8pt)[$H^+$]])
  circle((11.35, 0.75), radius: 0.07056, fill: rgb("#003300"), stroke: none)
  content((11.46, 0.65), [#text(size: 8pt)[$w_j^+$]], anchor: "west", padding: 0.1176cm)
  line((2.6, 0.75), (6.45, 0.75), stroke: (paint: rgb("#003300"), thickness: 1.2pt, miter-limit: 10))
  line((8.95, 0.75), (11.35, 0.75), stroke: (paint: rgb("#003300"), thickness: 1.2pt, miter-limit: 10))
})],
    caption: [Figure 1: A separability round, shown schematically. The upper arrows represent families of paths; the two families may intersect, and their entire vertex sets remain in the footprint. Below, $E_j$ joins label $j$’s path ends in $D$. The region $H^(+)$ is obtained from $H'$ by removing unused starts; it meets the footprint exactly in the new tips $W^(+)$. ],
  ) <fig:separability-round>
  Extend $B_j$ by the two or three corresponding paths, by $E_j$, and by $C_j$ when $j in I$. The resulting set $B_j^(+)$ is connected: its old bag contains $w_j$; the paths join every attached piece to $E_j$; and it contains the new tip $w_j^(+)$. The sets $B_j^(+)$ are pairwise disjoint. Indeed, the old bags are disjoint and meet the added paths only at their own $W$-ends; the paths are disjoint; the sets $E_j$ are disjoint and meet paths only at the designated terminals; and the bags $C_j$ are disjoint, lie outside $F union D$, and meet paths only at their own roots. All these sets lie in $F^(+)$. Old adjacencies persist because $B_j subset.eq B_j^(+)$, and every pair of labels in $I$ gains an adjacency through its bags in the district model.
  It remains to check the next-region invariant. Exactly $t$ vertices were deleted from the $\( K_0 + 1 \) t$-connected graph $H'$, so $H^(+)$ is $K_0 t$-connected. By (41) and (36),
  $ ell \( H^(+) \) gt.eq r - #scale(x: 120%, y: 120%)[\(] c_f + 6 \( K_0 + 1 \) + 1 #scale(x: 120%, y: 120%)[\)] t gt.eq r - c_h t . $
  Equation (43) gives
  $ V \( H^(+) \) ∩ F^(+) = W^(+) . $
  Thus $F^(+) \, H^(+) \, W^(+)$, and the bags $B_j^(+)$ restore every invariant for the next round.
  After all $R_t$ rounds, every pair of labels has an adjacency. The $t$ disjoint connected label bags therefore form a $K_t$ model in $G$, contradicting $h \( G \) < t$. This proves Lemma 34. ◻
]

== 8 Recursive weaving and the universal bound <sec:recursion>

The recursive use of woven districts follows the framework of Postle #cite(label("Postle2020")) Section 6 and Delcourt and Postle #cite(label("DelcourtPostle2021")) Section 7. We now use separability to replace the successive small steps of the preceding section by a recursion with a fixed shrinkage factor.

#thm([Theorem 8.1.])[
  #emph[There are absolute positive integers $K \, Q$ such that, for every integer $a gt.eq 1$, every $K a$-connected graph $P$ with $ell \( P \) gt.eq Q a$ is $\( a \, 3 a \)$-woven.]
] <thm:recursive-woven>

#proof[
  The main inductive step concerns $h \( P \) < 64 a$ and sufficiently large $a$. It separates the paths for prescribed pairs from the clique-model construction. Give each root and each end of a noncoincident pair its own neighboring proxy outside the original terminal set, with all proxies distinct, and delete the original terminals. Choose a minimum-total-length system of two paths per proxy to a small highly connected district $D$. Deleting the proxies, $D$, and these paths costs only $O \( a \)$ in list chromatic number. We can therefore extract a highly connected region $H'$ disjoint from the first path system. Further connections from $H'$ to $D$ and Lemma 33 produce disjoint paths from all proxies and from a set $W$ of $a$ vertices of $H'$ to $D$, meeting $H'$ only at $W$. It then suffices to build a clique model rooted at $W$ inside $H'$: grouping the path ends in $D$ attaches the model to the root proxies and completes the prescribed pair paths.
  For this internal model, divide the labels of $W$ into three blocks. Separability and connectivity extraction supply three disjoint districts for recursive calls, one for each pair of blocks. A call needs at most $2 ceil.l a \/ 3 ceil.r$ roots. Each label receives two bags to be joined to its vertex of $W$. The $2 a$ joining paths may pass through the recursive districts; wovenness lets us reroute them while constructing the child models, keeping the retained bags disjoint from the paths except at their designated roots. Every pair of labels shares a district and hence receives an adjacency.
  We specify the order of the constants first. Fix all constants in the preceding sections, including $L \, C_(*) \, B_(*) \, K_0 \, D_(K_0)$, the deletion constants $c_d$, and the separability constant $S$. Choose an integer $K gt.eq 100$ such that
  #[#set math.equation(numbering: n => "(44)")
   $ K - 14 > 128 D_(K_0) . $ <recursive:K>]
  Choose an absolute integer $a_0 gt.eq 24$ so large that all sufficiently-large parameter conclusions used below hold with $t = 64 a$ whenever $a > a_0$. Enlarge $a_0$ if necessary so that
  #[#set math.equation(numbering: n => "(45)")
   $ a' = 2 ceil.l a \/ 3 ceil.r lt.eq 3 a \/ 4 #h(2em) \( a > a_0 \) \, $ <recursive:shrink>]
  and $t^1.06 + 7 a lt.eq t^(11 \/ 10)$ for $t = 64 a$, $a > a_0$. All these requirements involve only constants already fixed, and none involves $Q$. Finally choose an integer $Q$ satisfying
  #[#set math.equation(numbering: n => "(46)")
   $ Q \/ 4 & > 10 + 64 \( c_42 + 6 K_0 + 2 S \) + \( 9 \/ 2 \) K \,\
Q & > 10 + 64 \( c_42 + 6 K_0 + 3 S \) \,\
Q & > 128 C_(*) log \( 128 a_0 \) + 1 . $ <recursive:Q-induction>]
  We prove the assertion by strong induction on $a$.
  ===== 8.1 Separating the terminal roles. <separating-the-terminal-roles.>
  Fix $a$ distinct roots and at most $3 a$ pairs as in Definition 28. Let $Z_0$ be their union, so $\| Z_0 \| lt.eq 7 a$. For each root, and for each end of each noncoincident pair, choose a neighbor outside $Z_0$ as its #emph[proxy]. All proxies are distinct, even for different roles of the same original vertex. This is possible greedily because $delta \( P \) gt.eq K a$ and fewer than $14 a$ vertices are forbidden at any choice. Coincident pairs will ultimately use trivial paths at their original vertices and need no proxies.
  Put $G = P - Z_0$ and let $Z$ be the proxy set. Then
  #[#set math.equation(numbering: n => "(47)")
   $ a lt.eq \| Z \| lt.eq 7 a \, #h(2em) G upright(" is ") \( K - 7 \) a upright("-connected") \, #h(2em) ell \( G \) gt.eq Q a - 7 a . $ <recursive:proxy-bounds>]
  It suffices to find in $G$ a clique model rooted at the root proxies and paths for the other proxy pairs, with all model bags and all these paths pairwise disjoint. Adding the proxy edges and the original vertices then restores precisely the root–path coincidences allowed by wovenness. Different prescribed pairs have no common original endpoint; a coincident pair at a root meets only that root’s expanded bag.
  ===== 8.2 A large minor and the finite base range. <a-large-minor-and-the-finite-base-range.>
  Set $t = 64 a$. If $h \( P \) gt.eq t$, delete from a $K_t$ model every bag meeting $Z_0$. This leaves a $K_(57 a)$ model in $G$. Since $57 a gt.eq 4 \| Z \|$ and $\( K - 7 \) a gt.eq 2 \| Z \|$, Lemma 27 gives a clique model rooted at all of $Z$. Retain the root-proxy bags. For each other proxy pair, a path through its two bags and an edge between them joins the pair. These paths and the retained bags are disjoint because all proxies and their bags are distinct. This proves the required conclusion in the large-minor case, for every $a$.
  Suppose $h \( P \) < 64 a$. Lemma 20 gives
  $ ell \( P \) lt.eq 128 C_(*) a log \( 128 a \) + 1 . $
  For $1 lt.eq a lt.eq a_0$ this is strictly less than $Q a$ by (46). Thus the minor-free case is impossible throughout the base range. We may henceforth assume $a > a_0$.
  ===== 8.3 A junction district and a fresh region. <a-junction-district-and-a-fresh-region.>
  Every vertex of $G - Z$ has degree at least $\( K - 14 \) a$, which is greater than $2 D_(K_0) t$ by (44). In particular this graph is nonempty and has density greater than $D_(K_0) t$. Apply Lemma 23 to find a $K_0 t$-connected district $D subset.eq G - Z$ with $\| V \( D \) \| lt.eq t^1.06$.
  The connectivity of $G$ and the order of $D$ permit two paths per proxy from $Z$ to distinct vertices of $D$, with only the prescribed repeated starts in common, by Lemma 26. Choose such a system $cal(Q)_1$ of minimum total length in $G$. It has at most $14 a$ paths. Put
  $ X = Z union V \( D \) \, #h(2em) Y = V \( cal(Q)_1 \) \\ X . $
  We have $\| X \| lt.eq t^(11 \/ 10)$ by the choice of $a_0$. Lemma 32 gives $28 a$-degeneracy of $G \[ Y \]$ and at most $42 a$ neighbors in $Y$ for every vertex outside $X union Y$. These bounds are at most $42 t$, so Lemma 19 with parameter $42$ gives
  #[#set math.equation(numbering: n => "(48)")
   $ ell \( G - X - Y \) gt.eq Q a - 7 a - c_42 t . $ <recursive:after-paths>]
  By (46) the right-hand side exceeds $6 K_0 t$. Lemma 17 therefore supplies a $K_0 t$-connected induced subgraph $H' subset.eq G - X - Y$ such that
  #[#set math.equation(numbering: n => "(49)")
   $ ell \( H' \) gt.eq Q a - 7 a - \( c_42 + 6 K_0 \) t . $ <recursive:Hprime>]
  In $G - Z$, the sets $H'$ and $D$ have order greater than $K_0 t$, and the connectivity is at least $\( K - 14 \) a > 2 a$. Hence there are $2 a$ disjoint $H'$-to-$D$ paths. Truncate them at their last visit to $H'$ and their first subsequent visit to $D$, so they have no internal vertex in either set. They avoid $Z$. Lemma 33, applied to these paths and $cal(Q)_1$, gives disjoint paths to $D$ from all proxies in $Z$ and from a set $W$ of $a$ distinct vertices of $H'$. These paths meet $H'$ and $D$ only at their appropriate ends.
  It is now enough to construct a clique model rooted at $W$ entirely inside $H'$. Indeed, in $D$ group the terminal ends of the outside paths as follows: pair each root proxy with a different member of $W$, and pair the other proxies as prescribed. There are at most $\| Z \| + a lt.eq 8 a$ terminals, so Theorem 5 applies because $K_0 t gt.eq 8 gamma a$. These disjoint groups and the outside paths attach the rooted model to the root proxies and supply all other required paths. The model inside $H'$ has no unwanted intersection with the outside paths, since their only vertices in $H'$ are precisely $W$.
  ===== 8.4 Three recursive districts. <three-recursive-districts.>
  For each $w in W$ choose two neighbors in $H' - W$, all $2 a$ choices distinct. Minimum degree at least $K_0 t$ permits this greedy choice. Let $N$ be their set and put $H'' = H' - W - N$. Then
  #[#set math.equation(numbering: n => "(50)")
   $ ell \( H'' \) gt.eq r_0 := Q a - 10 a - \( c_42 + 6 K_0 \) t . $ <recursive:r0>]
  Equation (46) gives $r_0 > 3 S t$. Apply Lemma 34 to $H''$, and then to one of the two resulting subgraphs. The first application is legal because $ell \( H'' \) gt.eq r_0 > 2 S t$. Each of its subgraphs has list chromatic number at least $r_0 - S t > 2 S t$, making the second application legal as well. We obtain three disjoint subgraphs each of list chromatic number at least $r_0 - 2 S t$.
  Take $a' = 2 ceil.l a \/ 3 ceil.r$. After the loss of $2 S t$ to separability, each subgraph must still pay $6 K a'$ for connectivity extraction and retain $Q a'$ for the recursive call. If $A = 10 + 64 \( c_42 + 6 K_0 + 2 S \)$, then
  $ r_0 - 2 S t - 6 K a' - Q a' & = Q \( a - a' \) - A a - 6 K a'\
 & gt.eq #scale(x: 120%, y: 120%)[\[] Q \/ 4 - A - \( 9 \/ 2 \) K #scale(x: 120%, y: 120%)[\]] a > 0 $
  by (45) and (46). In particular $r_0 - 2 S t > 6 K a'$, and list extraction in each subgraph produces disjoint $K a'$-connected induced districts $J_1 \, J_2 \, J_3$ with list chromatic number at least $Q a'$. Since $a' < a$, induction makes each district $\( a' \, 3 a' \)$-woven.
  Partition the labels of $W$ into three nonempty blocks $B_1 \, B_2 \, B_3$, each of size at most $ceil.l a \/ 3 ceil.r$. Assign one district to each pair of blocks, relabeling them $J_12 \, J_13 \, J_23$ accordingly. In its district, designate a distinct root for each label of the corresponding two blocks, and add arbitrary distinct padding roots to bring the total to $a'$. The districts have enough vertices for this choice. Every label has exactly two designated roots, in different districts; every pair of labels occurs together in at least one district, including two labels in the same block; see Figure 2.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 2), [#box(width: 2.15cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.6pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_1$]]])])
  content((3.8, 2), [#box(width: 2.15cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.6pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_2$]]])])
  content((7.6, 2), [#box(width: 2.15cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.6pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_3$]]])])
  content((0, 0), [#box(width: 2.15cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.6pt, miter-limit: 10), fill: rgb("#f2f9f2"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$J_12: B_1 union B_2$]]])])
  content((3.8, 0), [#box(width: 2.15cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.6pt, miter-limit: 10), fill: rgb("#f2f9f2"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$J_13: B_1 union B_3$]]])])
  content((7.6, 0), [#box(width: 2.15cm, height: 0.75cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.6pt, miter-limit: 10), fill: rgb("#f2f9f2"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$J_23: B_2 union B_3$]]])])
  line((0, 1.625), (0, 0.375), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((1.075, 1.625), (2.725, 0.375), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((2.725, 1.625), (1.075, 0.375), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((4.875, 1.625), (6.525, 0.375), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((6.525, 1.625), (4.875, 0.375), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((7.6, 1.625), (7.6, 0.375), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
})],
    caption: [Figure 2: The three recursive districts. The blocks $B_1 \, B_2 \, B_3$ partition the labels, and a label has one designated root in each of the two districts receiving its block. Arrows indicate label assignments, not graph edges. Every pair of labels is represented together in a district. ],
  ) <fig:three-districts>
  Inside $H' - W$, join the two chosen neighbors of each $w$ to its two designated roots, respectively, using disjoint paths. This is an application of Theorem 5 to $4 a$ distinct terminals: the neighbors lie in $N$, while the districts were chosen in $H''$ and hence avoid $N$. The connectivity is at least $K_0 t - a gt.eq 4 gamma a$. There are $2 a$ paths. Apply Lemma 29 successively in the three districts to incorporate their rooted clique models while retaining these path ends. Each district has sufficient weaving capacity, since
  $ 2 a lt.eq 3 a' = 6 ceil.l a \/ 3 ceil.r . $
  Discard all padding bags. Each designated root remains an endpoint of its path; the retained bags meet the rerouted paths only at their own designated roots. Since the districts are disjoint, later rerouting does not introduce an intersection in a previously retained bag.
  For each $w$, unite its two designated bags with their respective paths, the two edges to $w$, and $w$ itself. The resulting $a$ sets are connected and disjoint, rooted at $W$. Two labels have an edge between their sets because they occur together in one of the district clique models. This constructs the required rooted $K_a$ model inside $H'$ and completes the induction. ◻
]

#proof[
  Let $K \, Q$ be as in Theorem 36. We first show that, for every integer $t gt.eq 2$,
  #[#set math.equation(numbering: n => "(51)")
   $ h \( G \) < t quad arrow.r.double quad ell \( G \) lt.eq \( Q + 6 K \) t . $ <recursive:final-minor-free>]
  Otherwise Lemma 17, with connectivity parameter $K t$, gives a $K t$-connected induced subgraph $P$ with $ell \( P \) gt.eq ell \( G \) - 6 K t > Q t$. Theorem 36 makes $P$ $\( t \, 3 t \)$-woven. Its order is greater than $K t gt.eq t$, so we may choose $t$ roots and no pairs. Wovenness then supplies a $K_t$ model, contradicting $h \( G \) < t$.
  For a nonempty graph, $h \( G \) gt.eq 1$. Taking $t = h \( G \) + 1 lt.eq 2 h \( G \)$ in (51) proves
  $ ell \( G \) lt.eq 2 \( Q + 6 K \) h \( G \) . $
  Thus the absolute integer $C = 2 \( Q + 6 K \)$ has all the claimed uniformity. The finite base range was covered before the induction began, so no small-parameter exception remains. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
