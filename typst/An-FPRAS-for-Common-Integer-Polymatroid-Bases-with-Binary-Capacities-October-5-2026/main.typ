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

#align(center)[#text(size: 16pt, weight: "bold")[An FPRAS for Common Integer Polymatroid Bases \
with Binary Capacities]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

An integral polymatroid describes nonnegative integer allocations subject to submodular capacity constraints. Intersecting two such systems is a natural common generalization of matroid intersection and capacitated transportation problems. Exact feasibility and optimization are accessible through rank-value oracles. Counting the feasible integer allocations poses additional difficulties: a large capacity permits exponentially many coordinate values, and replacing it by labelled copies changes both the size of the instance and the weight assigned to each allocation.

This paper gives an approximation algorithm whose cost depends polynomially on the binary encoding of the capacities. The proof builds on the common-matroid-base counting framework and its two-lift extension for cell-bounded contingency tables #cite(label("Parent")) #cite(label("CB")). The new reduction keeps only part totals with polynomially many possible values as discrete variables. It treats the remaining degrees of freedom by weighted volume approximation and proves the discrete quadratic inequalities needed by the counting framework after this integration.

=== 1.1 The problem and the result <the-problem-and-the-result>

Let $E = { 1 \, dots.h \, n }$. For $i in { 1 \, 2 }$, let $r_i : 2^E arrow.r bb(Z)_(gt.eq 0)$ be normalized, nondecreasing, and submodular:

$ r_i \( diameter \) = 0 \, #h(2em) r_i \( A \) lt.eq r_i \( B \) quad \( A subset.eq B \) \, #h(2em) r_i \( A \) + r_i \( B \) gt.eq r_i \( A union B \) + r_i \( A ∩ B \) . $

Assume their total ranks agree, and write $R = r_1 \( E \) = r_2 \( E \)$. For $x in bb(R)^E$ and $A subset.eq E$, put $x \( A \) = sum_(j in A) x_j$. The set of common integer bases is

#[#set math.equation(numbering: n => "(1.1)")
 $ Omega \( r_1 \, r_2 \) = {x in bb(Z)_(gt.eq 0)^E : x \( E \) = R \, quad x \( A \) lt.eq r_i \( A \) upright(" for every ") A subset.eq E \, med i in { 1 \, 2 }} . $ <eq:counting-problem>]

Write $Z = \| Omega \( r_1 \, r_2 \) \|$. Every vector has weight one. A representation of a vector by labelled copies is not another object to be counted.

The input supplies $R$ in binary and exact value oracles for $r_1 \, r_2$. A query is an $n$-bit subset indicator; its answer is the binary integer $r_i \( A \)$, between zero and $R$. No decomposition, explicit inequality list, sampler, or counting oracle is part of the input. Let $ell$ be the binary encoding length of $n \, R \, epsilon \, delta$, where the rational numbers $0 < epsilon \, delta < 1$ are given by their numerators and denominators. Oracle computation itself is excluded from the bit-operation count, but writing queries and reading answers are included.

#thm([Theorem 1.1.])[
  #emph[There is a single uniform randomized algorithm which, for every input described above, outputs a nonnegative rational $hat(Z)$ satisfying 
$ bb(P) #scale(x: 120%, y: 120%)[\(] \( 1 - epsilon \) Z lt.eq hat(Z) lt.eq \( 1 + epsilon \) Z #scale(x: 120%, y: 120%)[\)] gt.eq 1 - delta . $

 If $Z = 0$, the algorithm outputs zero on every execution. On every execution, both its number of oracle calls and its number of other bit operations are bounded by one fixed polynomial in 
$ n \, #h(2em) ell \, #h(2em) epsilon^(- 1) \, #h(2em) log \( delta^(- 1) \) . $

 The bit-operation bound includes rational arithmetic, generation of independent unbiased random bits, and the encoding of the output.]
] <thm:main>

The theorem includes lower-dimensional feasible sets, arbitrary pairs of rank functions, and binary ranks of unrestricted magnitude. When $R = 0$, there is one common base, the zero vector; this includes the empty vector when $n = 0$. The algorithm’s polynomial has large fixed exponents. The issue here is dependence on the input encoding, not an optimized running time.

=== 1.2 Context and prior work <context-and-prior-work>

The polyhedral theory begins with Edmonds’ work on submodular functions, matroids, and polymatroid intersection #cite(label("Edmonds1970")). It explains why the intersection considered here is integral and why optimization admits an oracle formulation. The exact algorithms used below come from submodular minimization #cite(label("IFF2001")) and the rational separation–optimization theory of Grötschel, Lovász, and Schrijver #cite(label("GLS1988")). The representation of an integer polymatroid by a matroid on groups of interchangeable elements also has a classical history, in Helgason’s theory of hypermatroids #cite(label("Helgason1974")). This representation preserves the feasible occupancy vectors, but its explicit size and the number of labelled realizations of a vector matter for counting. The distinction becomes essential when capacities are encoded in binary.

Contingency tables provide a concrete instance of this distinction. Such a table is a nonnegative integer matrix with prescribed row and column sums; cell bounds impose additional upper bounds on its entries. Dyer, Kannan, and Mount obtained approximate counting and sampling algorithms under lower bounds on the margins, using the relation between lattice counts and transportation-polytope volumes #cite(label("DKM1997")). Cryan and Dyer gave an FPRAS with arbitrary margins when the number of rows is fixed #cite(label("CD2003")), and Cryan, Dyer, and Randall extended that fixed-row result to cell-bounded tables #cite(label("CDR2010")). For fixed-row tables without cell bounds, Gopalan et al. subsequently gave a deterministic FPTAS #cite(label("GKM2011")) Theorem 1.3. These results already address numerical data through their binary encodings, within their respective restrictions. For tables with $0 \/ 1$ entries, Bezáková, Bhatnagar, and Vigoda gave an annealing-based FPRAS for arbitrary margins #cite(label("BBV2007")). The companion manuscript #cite(label("CB")) treats cell-bounded tables with both dimensions variable. Its paired encoding and two factorial corrections are the immediate counting tools used here; the present reduction must additionally handle arbitrary submodular rank constraints available only through value queries.

Another line of work develops the concavity behind matroid counting. Adiprasito, Huh, and Katz proved the Hodge–Riemann relations for matroid Chow rings and deduced log concavity of characteristic-polynomial coefficients #cite(label("AHK2018")). Anari, Liu, Oveis Gharan, and Vinzant used log-concave polynomials and high-dimensional walks to obtain an independence-oracle FPRAS for the bases of a single arbitrary matroid #cite(label("ALOV2024")). Brändén and Huh’s theory of Lorentzian polynomials includes matroid basis polynomials and factorial-normalized generating polynomials of integer polymatroid bases #cite(label("BH2020")). These statements concern an individual matroid or polymatroid; taking common bases need not preserve the exchange property of its support. Moreover, the factorial normalization weights integer bases nonuniformly. They therefore do not directly yield the uniform common-base count considered here. Our proof verifies the needed quadratic inequalities for its particular auxiliary weights.

For common bases of two rank-$r$ matroids, Anari, Oveis Gharan, and Vinzant obtained a deterministic polynomial-time $2^(O \( r \))$-approximation and a randomized relative approximation with running time $2^(O \( r \)) "poly" \( n \, epsilon^(- 1) \, log delta^(- 1) \)$ #cite(label("AOV2021")) Theorem 1.3 and Corollary 1.4. The companion manuscript #cite(label("Parent")) gives an FPRAS for common bases of two arbitrary matroids on an explicitly listed ground set. It uses positive rank-deficiency weights, transport of a single defect, variance bounds for specified observables, and mixing of a trace chain. The cell-bounded companion #cite(label("CB")) develops the two complementary factorial lifts that cancel labelled multiplicities on the target states. These constructions are related to the perfect- and near-perfect matching ensemble and learned defect weights in the permanent FPRAS of Jerrum, Sinclair, and Vigoda #cite(label("JSV2004")). Restricted Poincaré inequalities for the hole-pattern observables identifying unmatched vertices also appear in the recent permanent algorithm of Chen, Vigoda, and Yang #cite(label("CVY2026")). The formal transport and counting inputs to this paper are the specific statements from the two companions; our contribution is the reduction to an instance whose explicit size is polynomial in the original binary input.

The continuous part uses two classical results with different roles. Prékopa’s marginal theorem preserves log concavity when free coordinates are integrated out #cite(label("Prekopa1973")) Theorem 6. The randomized convex-volume algorithm of Dyer, Frieze, and Kannan #cite(label("DFK1991")), in the rational oracle formulation described by Dyer and Frieze #cite(label("DyerFrieze1991")), supplies approximate evaluations of the resulting weights. Our rational-center construction uses determinant replacement, closely related to the barycentric-spanner construction of Awerbuch and Kleinberg #cite(label("AK2004")) Proposition 2.4; we give the affine simplex argument needed here. These continuous tools supply the weights and their evaluations, while the discrete signature argument establishes the additional inequalities required by the counting chain.

=== 1.3 Proof strategy <proof-strategy>

The first obstacle is the scale of the coordinate ranges. The expansion matroid of an integral polymatroid can represent each unit of capacity by a separate element, but a direct construction can have size proportional to $n R$. In addition, an occupancy vector has a product of binomial coefficients worth of labelled realizations. Applying a common-base counter to that expansion would therefore address neither the required runtime nor the required weights.

We begin with an exact feasibility test and a rational center of the common base polytope. Near-tight rank inequalities at this center define two partitions of $E$. Their part totals will be the discrete variables retained by the algorithm. A coarser partition identifies directions in which pairs of bases can be shifted without significantly changing their count. Directional log concavity makes this comparison quantitative. Within suitable fixed-total slices, a small homothety then shows that enlarging the original base polytopes in the remaining directions changes the count by only a small relative error.

For the retained part totals, an incidence graph joins a part of the first partition to a part of the second whenever they share a coordinate. Choosing spanning trees expresses all other coordinates through free variables and the part totals. The retained integer ranges have polynomial cardinality. Large free ranges are integrated out, with soft penalties for rank violations. The preceding comparison proves that the resulting weighted count approximates $Z$.

Integration preserves ordinary log concavity, but that property alone does not give the discrete quadratic inequalities used by the counting algorithm. We convolve the integrated weights with a smooth compactly supported kernel and add a small strictly concave quadratic term. Derivative estimates bound the errors between discrete second differences and the continuous Hessian. The added curvature dominates these errors at every annealing power, giving both required quadratic tests throughout the counting algorithm.

Finally, each bounded part-total variable is represented by a polynomial number of paired labels. Two factorially corrected lifts agree on transversals, where their multiplicities cancel exactly, and satisfy the complementary signature conditions of the paired counting framework. We state the imported transport and trace estimates precisely, verify their hypotheses, and give the capped annealing algorithm. A separate convex-volume construction evaluates its weights with bounded rational computation. This last distinction is essential: all large expansions and slice subdivisions used for comparison are proof devices, whereas every instance actually sampled has polynomial size.

Section 2 supplies the oracle and polyhedral tools. Section 3 proves the integer signature and shift-count statements. Section 4 establishes the geometric comparison, and Section 5 constructs the regularized polynomial-range model. Section 6 evaluates its weights. Section 7 performs the paired counting and proves Theorem 1.

== 2 Polyhedral tools and a feasible center <sec:polyhedra>

The first step is to work with the exponentially many rank inequalities without enumerating them. We record the exact oracle algorithms we use, then establish the geometric estimates needed to replace large coordinate ranges by short ranges of part totals. In particular, the distance estimate below depends on the dimension, not on the numerical value of the rank.

Recall that for $x in bb(R)^E$ and $A subset.eq E$ we write $x \( A \) = sum_(j in A) x_j$. A set function $f : 2^E arrow.r bb(R)$ is #emph[normalized] if $f \( diameter \) = 0$. For any normalized submodular function, including one that is not nondecreasing, put

#[#set math.equation(numbering: n => "(2.1)")
 $ B \( f \) = { x in bb(R)^E : x \( E \) = f \( E \) \, quad x \( A \) lt.eq f \( A \) upright(" for every ") A subset.eq E } . $ <eq:base-polytope>]

This convention lets us translate and reflect base polytopes. The singleton and complementary-singleton inequalities give

$ f \( E \) - f \( E \\ { j } \) lt.eq x_j lt.eq f \( { j } \) #h(2em) \( x in B \( f \) \) . $

Thus $B \( f \)$ is bounded; for a nondecreasing $f$, its coordinates are nonnegative. Throughout, integrals in free coordinates use ordinary Lebesgue measure with unit lattice mesh. An integral in zero coordinates means evaluation of its integrand.

=== 2.1 Exact oracle operations <exact-oracle-operations>

We use the following standard algorithmic results. Their encoding requirements are relevant because the capacity $R$ is given in binary.

#thm([Proposition 2.1.])[
  (Oracle algorithms).  #emph[The following operations have deterministic oracle and bit complexity bounded by fixed polynomials in the indicated input sizes.]
  + #emph[An integer-valued submodular function on a finite ground set can be minimized, with a minimizing set returned, from an exact value oracle and a bound on the binary lengths of its values. The size parameters are the ground-set cardinality and that value-length bound.]
  + #emph[Let $Q subset.eq bb(R)^d$ be a bounded rational polytope, supplied by strong separation, a coordinate bound, and a bound on the binary encoding length of each individual defining inequality. The separator returns inequalities of length polynomial in the query length and the supplied description bounds. Exact rational linear optimization, including an emptiness decision and the production of an optimal vertex when $Q$ is nonempty, is polynomial in $d$, these bounds, and the objective length. This assertion includes lower-dimensional polytopes. All separation queries have polynomial encoding length.]
  #emph[The first operation also applies to an integer submodular function with a rational modular term added, and with prescribed elements required to belong or not to belong to the minimizing set.]
] <prop:oracle-tools>

For the first assertion we use the submodular minimization theorem of Iwata, Fleischer, and Fujishige #cite(label("IFF2001")) Theorems 3.3 and 3.7. For the second we use the strong separation–optimization equivalence for well-described rational polyhedra #cite(label("GLS1988")) Definition 6.2.2, Theorem 6.4.9, and Remark 6.5.2. The description size in that theorem bounds the encoding of one inequality, and does not count the number of inequalities. Its vertex encoding bound also permits optimal-vertex selection by successive rational face restrictions. The LP bound counts calls to its separation oracle and additional bit operations separately. In our applications each such call is implemented by submodular minimization and the explicit rational arithmetic described next.

Here is how we supply these algorithms with the required oracles. At a rational point $x$, separation from $B \( r_i \)$ minimizes $r_i \( A \) - x \( A \)$ and checks the total equation. Multiply this set function by the product of the denominators of the coordinates of $x$. The resulting integer submodular function has values of polynomial binary length: the length of that product is at most the sum of the denominator lengths. Requiring inclusion of $F$ and exclusion of $G$, where $F ∩ G = diameter$, amounts to minimizing $A mapsto r_i \( A union F \) - x \( A union F \)$ on $E \\ \( F union G \)$. Restrictions, contractions, and ranks on unions of partition parts are handled in the same way. All rational modular translations used below have explicitly known denominators and polynomial-length coefficients, so the same clearing of denominators applies to them. Additional coordinate bounds and part-total equations are explicit linear constraints.

In particular, the original intersection

#[#set math.equation(numbering: n => "(2.2)")
 $ P = B \( r_1 \) ∩ B \( r_2 \) $ <eq:original-polytope>]

has a strong separation oracle and lies in $\[ 0 \, R \]^n$. Its inequalities have $0$–$1$ normals and right sides of $O \( 1 + log \( R + 1 \) \)$ bits. Exact feasibility and optimization on $P$ therefore satisfy Proposition 2 without any dependence polynomial in the numerical value of $R$.

=== 2.2 Base-polytope calculus <base-polytope-calculus>

The following greedy identities, originating in the theory of polymatroid polyhedra #cite(label("Edmonds1970")), identify the polytopes appearing in translations, projections, and expansions later in the proof.

#thm([Lemma 2.2.])[
  (Base-polytope identities).  #emph[Let $f \, g : 2^E arrow.r bb(R)$ be normalized submodular functions and let $v in bb(R)^E$.]
  + #emph[If $w_(pi \( 1 \)) gt.eq dots.h.c gt.eq w_(pi \( n \))$ and $A_k = { pi \( 1 \) \, dots.h \, pi \( k \) }$, the vector 
$ b_(pi \( k \)) = f \( A_k \) - f \( A_(k - 1) \) $

 belongs to $B \( f \)$ and maximizes $w dot.op x$ there.]
  + #emph[With $\( f + v \) \( A \) = f \( A \) + v \( A \)$ and $f^(upright("ref")) \( A \) = f \( E \\ A \) - f \( E \)$, one has 
$ B \( f + g \) = B \( f \) + B \( g \) \, #h(2em) B \( f + v \) = B \( f \) + v \, #h(2em) B \( f^(upright("ref")) \) = - B \( f \) . $

]
  + #emph[For a partition $cal(D)$ of $E$, define $pi_(cal(D)) \( x \) = \( x \( D \) : D in cal(D) \)$ and $macron(f) \( cal(J) \) = f \( union.big_(D in cal(J)) D \)$. Then $pi_(cal(D)) \( B \( f \) \) = B \( macron(f) \)$.]
  + #emph[For distinct $a \, b in E$ and $t gt.eq 0$, the segment $\[ - t \, t \] \( e_a - e_b \)$ is $B \( q_(a b) \)$, where 
$ q_(a b) \( A \) = t thin \| upright(bold(1))_A \( a \) - upright(bold(1))_A \( b \) \| . $

 In particular, adding any collection of these segments to a base polytope again gives a base polytope, with integral rank if $f$ and the segment lengths are integral.]
] <lem:base-calculus>

#proof[
  When $E = diameter$, all assertions are immediate, so assume $n gt.eq 1$. Submodularity implies decreasing marginal increments: if $C subset.eq D$ and $j in.not D$, then $f \( C union { j } \) - f \( C \) gt.eq f \( D union { j } \) - f \( D \)$. Apply this inequality to the elements of any $A$ in their $pi$-order. The increments defining $b \( A \)$ are no greater than those along the induced chain in $A$, and hence $b \( A \) lt.eq f \( A \)$. Also $b \( E \) = f \( E \)$. Summation by parts gives, for every $x in B \( f \)$,
  $ w dot.op x = w_(pi \( n \)) f \( E \) + sum_(k = 1)^(n - 1) \( w_(pi \( k \)) - w_(pi \( k + 1 \)) \) x \( A_k \) . $
  All coefficients in the sum are nonnegative, and $b$ attains equality in each of the resulting upper bounds. This proves the first assertion and, in particular, nonemptiness of $B \( f \)$.
  The displayed support-function formula is additive in $f$. Since nonempty compact convex sets are determined by their support functions, it proves the Minkowski-sum identity. Translation follows directly from the inequalities. For reflection, the equation $x \( E \) = f \( E \)$ converts $- x \( A \) lt.eq f \( E \\ A \) - f \( E \)$ into the inequality on $E \\ A$ for $x$. The reflected function is normalized and submodular.
  For the projection identity, containment in $B \( macron(f) \)$ follows from the inequalities on unions of parts. Conversely, maximize a linear functional on the projected coordinates. Its lift to $bb(R)^E$ is constant on each part. In the greedy formula, place the parts in decreasing order of these constants and place each part’s elements consecutively. The increments telescope to the greedy formula for $macron(f)$. The two projected sets thus have the same support function.
  Finally, $q_(a b)$ is the cut function of a single edge and is submodular, as is checked from its four possible membership patterns on ${ a \, b }$. Its base inequalities force every other coordinate to be zero, force $x_a + x_b = 0$, and give $\| x_a \| lt.eq t$. This proves the last assertion. ◻
]

The next construction is the expansion of an integral polymatroid to its natural matroid #cite(label("Helgason1974")). We use it only to prove inequalities for weights. Its ground set may have size comparable with $R$, and we never construct that ground set in the algorithm.

#thm([Lemma 2.3.])[
  (The expansion matroid).  #emph[Let $r : 2^E arrow.r bb(Z)_(gt.eq 0)$ be normalized, nondecreasing, and submodular. Replace each $j in E$ by any finite number of labelled copies. Declare a set of copies independent when its occupancy vector $z$ satisfies $z \( A \) lt.eq r \( A \)$ for every $A subset.eq E$. This defines a matroid. A set of copies with occupancy vector $v$ has matroid rank 
#[#set math.equation(numbering: n => "(2.3)")
 $ m \( v \) = min_(A subset.eq E) { r \( A \) + v \( E \\ A \) } . $ <eq:expansion-rank>]

]
] <lem:expansion-matroid>

#proof[
  Hereditary closure is immediate. Let $I \, J$ be independent copy sets with occupancy vectors $z \, z'$ and $\| I \| < \| J \|$. If no element of $J \\ I$ can be added to $I$, then, for every coordinate $j$ with $z'_j > z_j$, some set $A_j$ containing $j$ is tight for $z$. Indeed, failure of the increment $z + e_j$ yields such a set because both its slack and its rank are integral. Tight sets are closed under union and intersection: submodularity and modularity give
  $ r \( A \) + r \( B \) = z \( A \) + z \( B \) = z \( A union B \) + z \( A ∩ B \) lt.eq r \( A union B \) + r \( A ∩ B \) lt.eq r \( A \) + r \( B \) . $
  Their union $A$ is therefore tight. On $E \\ A$ we have $z'_j lt.eq z_j$, whereas $z' \( A \) lt.eq r \( A \) = z \( A \)$. This contradicts $\| J \| > \| I \|$ and proves augmentation.
  Every independent subprofile $z lt.eq v$ has $z \( E \) lt.eq r \( A \) + v \( E \\ A \)$ for every $A$. Choose a maximal independent subprofile of $v$. Each coordinate where $z_j < v_j$ is blocked by a tight set containing $j$. The union $A$ of these sets is tight, and $z = v$ outside $A$. Thus $z \( E \) = r \( A \) + v \( E \\ A \)$, proving equality in (2.3). If no coordinate is blocked, take $A = diameter$. ◻
]

=== 2.3 Integrality and quantitative stability <integrality-and-quantitative-stability>

We require two kinds of systems: the intersection of two base polytopes, and a single base polytope with prescribed totals on the parts of a partition. These systems share a useful structure at every feasible point. The structure persists after coordinate bounds are added, including bounds defining a cube. We give the uncrossing proof of the classical integrality assertion #cite(label("Edmonds1970")) together with the distance and slope bounds that we need.

#thm([Lemma 2.4.])[
  (Polyhedral controls).  #emph[Let $Q subset.eq bb(R)^E$ be nonempty and be defined either by $B \( f_1 \) ∩ B \( f_2 \)$ or by $B \( f \)$ together with equations $x \( D \) = a_D$ for the parts $D$ of a partition of $E$. The functions are normalized and submodular. In either case arbitrary coordinate lower and upper bounds may also be imposed.]
  + #emph[If the ranks and all other right sides are integral, every vertex of $Q$ is integral.]
  + #emph[Suppose $x in bb(R)^E$ satisfies every defining inequality with additive violation at most $b gt.eq 0$, and every defining equality with absolute error at most $b$. Then 
#[#set math.equation(numbering: n => "(2.4)")
 $ "dist"_oo \( x \, Q \) lt.eq 10 \( n + 1 \)^2 b . $ <eq:polyhedral-distance>]

]
  + #emph[Fix $a in Q$ and an affine function $F$ whose linear part is integral. The function 
$ phi.alt \( l \) = max { F \( y \) : y in Q \, med parallel y - a parallel_oo lt.eq l } \, #h(2em) l gt.eq 0 \, $

 is continuous, nondecreasing, concave, and piecewise affine. Every positive slope of an affine piece is an integer and hence at least one. Eventually $phi.alt \( l \) = max_Q F$. Consequently, if $F gt.eq 0$ on $Q$ and $phi.alt \( L \) < L$ for some $L > 0$, then $phi.alt \( L \) = max_Q F$.]
] <lem:polyhedral-controls>

#proof[
  We first establish the structure of the tight constraint normals. For a fixed rank system at $y in B \( f \)$, the tight sets are closed under union and intersection by the calculation in the preceding proof. Choose a maximal strictly increasing chain of tight sets from $diameter$ to $E$. No tight set can cut a difference between successive members of this chain: otherwise intersecting that set with the upper member and adjoining the lower member inserts another tight set. Every tight-set indicator is therefore a sum of these difference indicators. In particular, the chain indicators span all tight rank normals.
  A second version preserves nonnegative coefficients. Any nonnegative combination of tight-set indicators can be expressed as a nonnegative combination of indicators from a chain. To see this, keep the resulting vector and the total coefficient fixed, allowing a coefficient on the empty set, and maximize the sum of the coefficients times $\| A \|^2$. The feasible coefficient set is compact. Two incomparable sets with positive coefficients can be replaced, with the smaller coefficient, by their union and intersection. The vector and total coefficient are unchanged, while the maximized quantity increases by $2 \| A \\ B \| thin \| B \\ A \|$ times that coefficient. Thus no such pair remains. Signed multiples of the total equation can be kept separately.
  The matrix formed by the indicators of two chains is totally unimodular. More generally this holds for two laminar families, and therefore for a chain and a partition. We apply Ghouila-Houri’s row-signing criterion #cite(label("GH1964")) Chapter II, Section 3, fundamental theorem. For any selection of rows from the first family, alternate signs along nested selected sets, starting with $+ 1$ on the maximal sets. In any column their sum is either $0$ or $1$. Start with $- 1$ in the second family, obtaining $0$ or $- 1$. Their combined sum is in ${ - 1 \, 0 \, 1 }$. Coordinate rows may be added: choose their signs separately in each column to retain this bound. Negating rows or adding signed copies also preserves total unimodularity. Thus the same conclusion holds with either orientation of equality normals and with coordinate bounds.
  At a vertex, the tight normals span $bb(R)^E$. Replace the tight rank rows by their chain spans, retain the partition and coordinate rows, and choose $n$ independent rows. Their square matrix is unimodular. With integral right sides its unique solution is integral, proving the first assertion.
  For the distance estimate, let $y in Q$ minimize $parallel x - y parallel_oo$ and write $t = parallel x - y parallel_oo$. If $t = 0$ there is nothing to prove. The optimality condition for this convex minimization supplies a normal $g$ to $Q$ at $y$ satisfying
  $ parallel g parallel_1 = 1 \, #h(2em) g dot.op \( x - y \) = t . $
  Express $g$ as a nonnegative combination of the active inequality normals and the two orientations of active equality normals. Uncross the rank contributions separately as above. The remaining normals belong to a totally unimodular matrix. A conic representation can be chosen with linearly independent normals, say $g = sum_(k = 1)^m mu_k a_k$ with $m lt.eq n$ and $mu_k gt.eq 0$. Choose $m$ columns giving a nonsingular square minor of the row matrix. That minor has determinant $plus.minus 1$ and every cofactor is $0$ or $plus.minus 1$. Solving for the coefficients gives $mu_k lt.eq parallel g parallel_1 = 1$. Each active oriented row satisfies $a_k dot.op \( x - y \) lt.eq b$, so
  $ t = sum_(k = 1)^m mu_k a_k dot.op \( x - y \) lt.eq n b . $
  This stronger estimate implies (2.4).
  For the last assertion, the cube constraint is $y_j lt.eq a_j + l$ and $- y_j lt.eq - a_j + l$. Every vertex of the constrained system has a basis selected by the same chain-span argument. Its basis matrix is unimodular and its right side has the form $b_0 + l b_1$ with $b_1$ integral. Thus that vertex depends affinely on $l$, with integral derivative wherever the basis is feasible. There are only finitely many possible bases. Optimizing $F$ consequently gives a piecewise affine function whose slopes are integers. Inclusion of cubes gives monotonicity; convex combinations of feasible points for radii $l_1 \, l_2$ give concavity. Continuity on $\( 0 \, oo \)$ follows from finite concavity, and at zero from $\| F \( y \) - F \( a \) \| lt.eq parallel nabla F parallel_1 l$. Boundedness of $Q$ gives eventual equality with its unrestricted maximum.
  If $phi.alt \( L \) < max_Q F$, concavity and monotonicity exclude a zero-slope interval before $L$. Every preceding affine piece then has slope at least one, so $phi.alt \( L \) gt.eq phi.alt \( 0 \) + L gt.eq L$ when $F gt.eq 0$ on $Q$. This proves the stated consequence. ◻
]

=== 2.4 Constructing a feasible center <constructing-a-feasible-center>

The distance estimate controls the effect of changing part totals. We also need one feasible point at which a small slack certifies that the same slack is small throughout the feasible polytope. The following construction works for any bounded rational polytope supplied by the oracle interface, including the lower-dimensional slices used later. It is the affine-simplex version of the determinant-replacement construction for barycentric spanners #cite(label("AK2004")) Section 2.3 and Proposition 2.4; we include the argument to obtain the precise slack and encoding bounds.

#thm([Lemma 2.5.])[
  (A center for affine slacks).  #emph[Let $Q subset.eq bb(R)^n$ be a nonempty bounded rational polytope satisfying the hypotheses of Proposition 2. One can find a rational $c in Q$, with polynomial encoding length, such that every affine $F$ nonnegative on $Q$ satisfies 
#[#set math.equation(numbering: n => "(2.5)")
 $ max_(x in Q) F \( x \) lt.eq 4 \( n + 1 \) F \( c \) . $ <eq:center-slack>]

 The construction has polynomial oracle and bit complexity. It also returns an affinely spanning vertex simplex of $Q$ such that every point of $Q$ has all barycentric coordinates of absolute value at most two with respect to that simplex.]
] <lem:center>

#proof[
  Start from a vertex $v_0$ obtained by linear optimization. Given vertices whose affine span has direction space $L$, optimize both signs of a rational basis of $L^perp$. Either every optimum equals its value at $v_0$, proving that $Q$ lies in the current span, or an optimal vertex extends the span. After at most $n$ extensions this gives $d + 1$ affinely independent vertices, where $d = dim Q$. For $d = 0$, take $c = v_0$ and stop.
  Choose a rational coordinate projection that is one-to-one on the affine hull. For the current simplex $v_0 \, dots.h \, v_d$, let $lambda_0 \, dots.h \, lambda_d$ be its affine barycentric-coordinate functions on that hull. Optimize both signs of each $lambda_j$ over $Q$. If some value has absolute value greater than two, replace $v_j$ by an attaining vertex. The absolute determinant of the simplex in the fixed coordinate projection is multiplied by $\| lambda_j \| > 2$.
  All vertices of a well-described rational polytope have polynomial encoding length #cite(label("GLS1988")) Lemma 6.2.4. Consequently every nonzero simplex determinant encountered lies between $2^(- B)$ and $2^B$ for a polynomially bounded $B$. There are at most $2 B + 1$ replacements. Determinants, barycentric functions, objectives, and returned vertices throughout the procedure have polynomial encoding length, so the entire construction has polynomial cost.
  At termination, $\| lambda_j \( x \) \| lt.eq 2$ for every $x in Q$ and every $j$. Set $c = \( d + 1 \)^(- 1) sum_(j = 0)^d v_j$. If $F gt.eq 0$ on $Q$, then $F \( v_j \) gt.eq 0$, and for every $x in Q$,
  $ F \( x \) = sum_(j = 0)^d lambda_j \( x \) F \( v_j \) lt.eq 2 sum_(j = 0)^d F \( v_j \) = 2 \( d + 1 \) F \( c \) . $
  This implies (2.5). ◻
]

We can now make the preliminary branches of the counting algorithm exact. If $R = 0$, return $1$; the only feasible vector is zero, including when $E = diameter$. Otherwise use Proposition 2 to test $P$ in (2.2). If it is empty, return $0$. If it is nonempty, Lemma 5 gives an integral vertex, so $Z gt.eq 1$. Obtain a rational center $c in P$ from Lemma 6. Henceforth this nonempty case is understood. In particular the algorithm will return zero on every execution for every instance with $Z = 0$.

== 3 Integer signatures and difference counts <sec:signatures>

The geometric comparison will require log-concavity of lattice-pair counts along the directions $e_j - e_k$. The eventual counting algorithm will require two quadratic inequalities for positive weights on integer boxes. We develop a common argument for both purposes: rank penalties satisfy the inequalities, and summing paired coordinates preserves them. The quadratic viewpoint comes from the rank-deficiency construction in #cite(label("Parent")) Section 3, “Quadratic signature inequalities”. That paper derives its forms from the Lorentzian property of homogenized matroid Tutte polynomials and closure under nonnegative linear substitutions #cite(label("BH2020")) Theorems 4.10 and 2.10. Here we prove the integer statements directly.

=== 3.1 The two tests and balanced summation <the-two-tests-and-balanced-summation>

For a finite index set $I$, capacities $m in bb(Z)_(gt.eq 0)^I$, and an integer $r$, write

$ cal(B) \( m \, r \) = { z in bb(Z)^I : 0 lt.eq z_i lt.eq m_i \, med sum_i z_i = r } . $

A #emph[box-valid display] is any integer vector in $product_i \[ 0 \, m_i \]$, with its total specified separately. Weights on $cal(B) \( m \, r \)$ are extended by zero outside this slice.

#prodef([Definition 3.1.])[
  (Integer quadratic signatures).  A strictly positive weight $F$ on all of $cal(B) \( m \, r \)$ has the #emph[removal signature] if, for every box-valid display $z$ of total $r + 2$, the matrix
  #[#set math.equation(numbering: n => "(3.1)")
   $ #scale(x: 120%, y: 120%)[\(] F \( z - e_i - e_j \) #scale(x: 120%, y: 120%)[\)]_(i \, j in I) quad upright("has at most one positive eigenvalue") . $ <eq:integer-removal-test>]
  It has the #emph[addition signature] if, for every box-valid display $z$ of total $r - 2$, the same conclusion holds for
  #[#set math.equation(numbering: n => "(3.2)")
   $ #scale(x: 120%, y: 120%)[\(] F \( z + e_i + e_j \) #scale(x: 120%, y: 120%)[\)]_(i \, j in I) . $ <eq:integer-addition-test>]
  Diagonal entries represent two changes in the same coordinate. All invalid changes have weight zero. A test with no box-valid display is vacuous.
] <def:integer-signatures>

If $Q$ is symmetric with at most one positive eigenvalue and $u^(sans(T)) Q u > 0$, then $Q$ is nonpositive on ${ v : v^(sans(T)) Q u = 0 }$. Otherwise this subspace and $u$ would contain a two-dimensional positive-definite subspace. Consequently

#[#set math.equation(numbering: n => "(3.3)")
 $ v^(sans(T)) Q v lt.eq frac(\( v^(sans(T)) Q u \)^2, u^(sans(T)) Q u) . $ <eq:signature-projection>]

We will also use its null-axis version: if $e^(sans(T)) Q e = 0$ and $Q e eq.not 0$, then $Q$ is nonpositive on ${ v : v^(sans(T)) Q e = 0 }$. Indeed, take $w = Q e$ and apply (3.3) with $u = e + t w$ for sufficiently small $t > 0$. For $v^(sans(T)) Q e = 0$, its right-hand side is $t^2 \( v^(sans(T)) Q w \)^2 \/ \( 2 t parallel Q e parallel^2 + t^2 w^(sans(T)) Q w \)$, which tends to zero.

For two coordinates $a \, b$ of the same capacity $M$, summing #emph[at balance] means summing their values $\( k \, M - k \)$, $0 lt.eq k lt.eq M$. The next lemma separates this operation from the particular factors used to construct the weight. Its proof is the balanced-summation induction of #cite(label("CB")) Section 3, Lemma 3.1, “Integer signature under balanced summation”, applied to a general positive weight. Only positivity and the initial quadratic signature enter the induction.

#thm([Lemma 3.2.])[
  (Balanced summation).  #emph[Let $F > 0$ on the entire slice $cal(B) \( m \, r \)$ and suppose it has the removal signature. Choose disjoint coordinate pairs ${ a_t \, b_t }$ with $m_(a_t) = m_(b_t) = M_t gt.eq 1$. Their balanced sum 
$ Phi \( z \) = sum_(0 lt.eq k_t lt.eq M_t) F #scale(x: 120%, y: 120%)[\(] z \, \( k_t \, M_t - k_t \)_t #scale(x: 120%, y: 120%)[\)] $

 is strictly positive on the entire remaining box slice of total $r - sum_t M_t$ and has the removal signature. The same statement holds with “addition” in place of “removal”. Fixing coordinates at prescribed box-valid values preserves either signature and positivity on the resulting valid slice.]
] <lem:balanced-summation>

#proof[
  Fixing coordinates restricts each test to a principal submatrix of the original test. For summation it suffices to remove one pair at a time. Suppose earlier pairs have been summed, giving a positive weight $Psi$, and the next pair has capacity $M$. Fix a box-valid display $z$ on the other coordinates, two above their required total after this pair is summed. For $0 lt.eq k lt.eq M$, the removal matrix at $\( z \, k \, M - k \)$ is
  #[#set math.equation(numbering: n => "(3.4)")
   $ N_k = mat(delim: "(", V_k, S \( k - 1 \), S \( k \); S \( k - 1 \)^(sans(T)), u_(k - 1), u_k; S \( k \)^(sans(T)), u_k, u_(k + 1)) \, $ <eq:balanced-matrices>]
  where
  $ \( V_k \)_(i j) & = Psi \( z - e_i - e_j \, k \, M - k \) \,\
S \( l \)_i & = Psi \( z - e_i \, l \, M - 1 - l \) \,\
u_k & = Psi \( z \, k - 1 \, M - 1 - k \) . $
  Each $N_k$ has at most one positive eigenvalue by induction. Out-of-box terms are zero, so $S \( - 1 \) = S \( M \) = 0$ and $u_k = 0$ unless $1 lt.eq k lt.eq M - 1$. The matrix we must control is $sum_(k = 0)^M V_k$. We will find one common subspace of codimension at most one on which its quadratic form is nonpositive.
  When $M = 1$, put $S = S \( 0 \)$. After discarding a zero axis, the two matrices in (3.4) are
  $ mat(delim: "(", V_0, S; S^(sans(T)), 0) \, #h(2em) mat(delim: "(", V_1, S; S^(sans(T)), 0) . $
  If $S eq.not 0$, the null-axis form of (3.3) makes both $V_0$ and $V_1$ nonpositive on ${ a : a^(sans(T)) S = 0 }$. If some $z_i > 0$, positivity gives $S_i = Psi \( z - e_i \, 0 \, 0 \) > 0$. Thus $S = 0$ implies $z = 0$, and then both $V_k$ are zero because all removals are invalid. This proves the assertion for $M = 1$.
  Let $M gt.eq 2$. Positivity on the full slice gives $u_k > 0$ for $1 lt.eq k lt.eq M - 1$. Take a vector $a$ on the old coordinates with
  $ a^(sans(T)) sum_(l = 0)^(M - 1) S \( l \) = 0 \, $
  and define
  $ g_k = frac(a^(sans(T)) sum_(l = 0)^(k - 1) S \( l \), u_k) quad \( 1 lt.eq k lt.eq M - 1 \) \, #h(2em) g_k = 0 quad upright("otherwise") . $
  The definition and the condition on $a$ give, including the endpoints,
  #[#set math.equation(numbering: n => "(3.5)")
   $ a^(sans(T)) S \( l \) = u_(l + 1) g_(l + 1) - u_l g_l #h(2em) \( 0 lt.eq l lt.eq M - 1 \) . $ <eq:balanced-cumulative>]
  For $v_k = \( a \, g_k \, - g_k \)$, its products under the form $N_k$ with the two new coordinate axes are
  $ u_(k - 1) \( g_k - g_(k - 1) \) \, #h(2em) u_(k + 1) \( g_(k + 1) - g_k \) \, $
  respectively. If at least one axis has positive square, (3.3) applied to that axis bounds $v_k^(sans(T)) N_k v_k$ by its corresponding term in
  #[#set math.equation(numbering: n => "(3.6)")
   $ v_k^(sans(T)) N_k v_k lt.eq u_(k - 1) \( g_k - g_(k - 1) \)^2 + u_(k + 1) \( g_k - g_(k + 1) \)^2 . $ <eq:balanced-projection>]
  Adding the other, nonnegative term preserves the bound. If both axis squares vanish, $u_(k - 1) = u_(k + 1) = 0$. At $k = 0$ or $M$ the other neighboring $u$ is positive, so this case is interior and $u_k > 0$. The sum of the two axes then has square $2 u_k > 0$ and product zero with $v_k$. Applying (3.3) to that sum proves (3.6), with right-hand side zero.
  Expanding (3.6) and substituting (3.5) cancels the mixed terms and gives
  $ a^(sans(T)) V_k a + 2 u_k g_k^2 - u_(k - 1) g_(k - 1)^2 - u_(k + 1) g_(k + 1)^2 lt.eq 0 . $
  Summing over $0 lt.eq k lt.eq M$ cancels every $u_k g_k^2$ term. Hence $sum_k V_k$ is nonpositive on the kernel of the single linear functional $a mapsto a^(sans(T)) sum_l S \( l \)$, as required. Every remaining box-valid profile has positive weight because any balanced choices of the summed pairs supply a positive summand. This completes the removal induction.
  For addition, reflect all coordinates in their boxes, $z_i mapsto m_i - z_i$. This interchanges the two signatures. It preserves balance and commutes with the balanced sum, so the removal result for the reflected weight gives the addition result. ◻
]

The one-positive-eigenvalue property is preserved by matrix limits. All sums above are finite, so we may also pass to limits of the positive weights after summation. Positivity is needed #emph[before] this passage: the proof divides by the interior quantities $u_k$. We will use global interpolation for positive approximations before taking limits, since adjacent log-concavity inequalities alone would not rule out gaps in the limiting support.

=== 3.2 Rank penalties, grouped coordinates, and reflection <rank-penalties-grouped-coordinates-and-reflection>

We next construct positive weights to which the summation lemma applies. Let $r$ be an integral normalized nondecreasing submodular function on a finite ground set $E$. For $v in bb(Z)_(gt.eq 0)^E$, put

$ m_r \( v \) = min_(A subset.eq E) { r \( A \) + v \( E \\ A \) } . $

By Lemma 4, this is the rank of a set with occupancy vector $v$ in a sufficiently large copy matroid. For $H gt.eq 0$, define

#[#set math.equation(numbering: n => "(3.7)")
 $ Phi_(r \, H) \( v \) = exp #h(-0.16667em) {- H [2 #scale(x: 120%, y: 120%)[\(] v \( E \) - m_r \( v \) #scale(x: 120%, y: 120%)[\)] + r \( E \) - v \( E \)]} . $ <eq:rank-soft-weight>]

The bracket equals $\( v \( E \) - m_r \( v \) \) + \( r \( E \) - m_r \( v \) \)$ and is nonnegative. It vanishes exactly on $B \( r \) ∩ bb(Z)^E$. Thus $Phi_(r \, H)$ is positive for finite $H$ and converges to the indicator of integer bases as $H arrow.r oo$.

For a positive factor $G$ defined on a whole box, the normalized matrix for steps of sign $sigma in { 1 \, - 1 }$ is

#[#set math.equation(numbering: n => "(3.8)")
 $ Q_(i j) = frac(G \( z \) G \( z + sigma e_i + sigma e_j \), G \( z + sigma e_i \) G \( z + sigma e_j \)) . $ <eq:signature-normalization>]

Only coordinates permitting one step are retained; an invalid repeated step is assigned $Q_(i i) = 0$. The unnormalized test is obtained from $Q$ by a positive scalar and positive diagonal congruence. In particular, $upright(bold(1)) upright(bold(1))^(sans(T)) - Q succ.curly.eq 0$ implies the required signature.

#thm([Lemma 3.3.])[
  (Rank-factor signatures).  #emph[Partition a set of count coordinates $I$ into groups indexed by $E$, allowing empty groups, and let $b in bb(Z)_(gt.eq 0)^E$. For either of the two consistent orientations 
$ v_e = b_e + sum_(i upright(" in group ") e) z_i \, #h(2em) upright("or") #h(2em) v_e = b_e + sum_(i upright(" in group ") e) \( m_i - z_i \) \, $

 the factor $G \( z \) = Phi_(r \, H) \( v \)$ satisfies $upright(bold(1)) upright(bold(1))^(sans(T)) - Q succ.curly.eq 0$ for both signs in (3.8). The product of such factors on disjoint sets of count coordinates has both integer signatures on every total slice. The assertion holds for every nonnegative power of the product, and for any coordinates fixed at box-valid values.]
  #emph[More generally, a base constraint for an arbitrary integral normalized submodular rank, with a fixed integer translation and either consistent orientation of its grouped arguments on a finite box, can be imposed as a limit of factors of this kind.]
] <lem:rank-signatures>

#proof[
  First take the increasing orientation and an addition test. Realize the displayed $v$ by a set $S$ in the expansion matroid, and assign two distinct spare copies to each retained count coordinate, with these assignments disjoint even when several count coordinates feed the same physical coordinate. Contract $S$; equivalently, contract a basis of $S$ and delete its remaining loops. A new copy increases rank exactly when it is a nonloop in this contraction. Two individually rank-increasing copies increase rank by only one precisely when they are parallel, meaning that their two-element set has rank one. In every other case their rank increments add.
  The affine terms in the exponent of (3.7) cancel in (3.8). Thus, when both steps are valid, $Q_(i j)$ is $exp \( - 2 H \)$ if their two nonloop copies are parallel, and is $1$ otherwise. For a repeated step we use two distinct copies from that count coordinate. Copies from one physical coordinate are interchangeable by matroid automorphisms fixing $S$. If the representative of one count coordinate is parallel to that of another, exchange the first representative with its second copy while fixing the other representative. This shows that the second copy is parallel to the other representative and hence to the first. It follows that each nontrivial parallel class of retained count indices has normalized entry $exp \( - 2 H \)$ throughout its block, including every valid repeated-step diagonal. A single index whose two copies are parallel contributes a singleton block. All remaining valid diagonal entries are $1$. Consequently
  #[#set math.equation(numbering: n => "(3.9)")
   $ upright(bold(1)) upright(bold(1))^(sans(T)) - Q = \( 1 - e^(- 2 H) \) sum_C upright(bold(1))_C upright(bold(1))_C^(sans(T)) + "diag" \( eta_i \) \, #h(2em) eta_i gt.eq 0 . $ <eq:rank-parallel-psd>]
  Here $C$ ranges over these disjoint parallel classes. The diagonal correction replaces an invalid repeated-step entry by zero; this only increases the diagonal of the left-hand side. This proves the addition assertion, including box boundaries.
  For removals, use a finite expansion on a ground set $Omega$ with enough copies to realize every display and with rank $r \( E \)$. The complement $Omega \\ S$ in its dual matroid has rank
  $ m^(*) \( Omega \\ S \) = \| Omega \\ S \| - r \( E \) + m_r \( v \) . $
  Writing $r^(*) = \| Omega \| - r \( E \)$, we obtain the exact identity
  $ \| S \| + r \( E \) - 2 m_r \( v \) = \| Omega \\ S \| + r^(*) - 2 m^(*) \( Omega \\ S \) . $
  A removal from $S$ is an addition to its dual complement. Realize $S$ using $b_e$ fixed copies and disjoint sets of $z_i$ copies for the count coordinates in physical group $e$. Choose one representative from every nonempty such set, and a second copy when $z_i gt.eq 2$. A transposition of those two copies fixes every other representative, preserves $S$, and preserves the dual contraction. The preceding parallel-class argument therefore gives the same block description (3.9). When only one removal is allowed in a count coordinate, its diagonal is zero and the nonnegative correction in that formula handles it. No nonexistent second copy is required.
  Reflection $z_i mapsto m_i - z_i$ on the entire coordinate set of one factor exchanges addition and removal, proving both tests for the decreasing orientation. Fixed coordinates merely become part of $b$. For factors on disjoint groups, normalized entries between different groups equal one; hence the matrix $upright(bold(1)) upright(bold(1))^(sans(T)) - Q$ is the direct sum of their nonnegative definite matrices. Unused coordinates contribute zero blocks, apart from the permitted diagonal corrections. This proves the product assertion. Raising to a nonnegative power replaces each $H$ by that power times $H$.
  Finally let $f$ be an integral normalized submodular function that need not be nondecreasing. Choose an integer vector $a$ large enough that $f' \( A \) = f \( A \) + a \( A \)$ is nondecreasing and that every translated lower endpoint of the grouped arguments plus $a$ is nonnegative. This is possible: there are finitely many marginal differences $f \( A union { e } \) - f \( A \)$ and finitely many box endpoints. The equation $B \( f' \) = B \( f \) + a$ follows from Lemma 3. Apply the proved construction to the shifted argument and $f'$, then let $H arrow.r oo$. This gives exactly the desired base indicator on the finite box. The copy matroids and these possibly large boxes are used only to prove the inequalities; the algorithm does not construct them. ◻
]

=== 3.3 Log-concavity of difference counts <log-concavity-of-difference-counts>

We now combine the preceding lemmas. The result concerns ordinary counts of integer vectors, with no copy multiplicities.

#thm([Proposition 3.4.])[
  (Root-direction log-concavity).  #emph[Let $f_1 \, f_2$ be integral normalized submodular functions on $E$, not necessarily nondecreasing, and define 
$ Y \( d \) = \# { \( x_1 \, x_2 \) in \( B \( f_1 \) ∩ bb(Z)^E \) times \( B \( f_2 \) ∩ bb(Z)^E \) : x_1 - x_2 = d } . $

 For $d_0 in bb(Z)^E$ and distinct $j \, k in E$, put $y \( t \) = Y \( d_0 + t \( e_j - e_k \) \)$, $t in bb(Z)$. The positive support of $y$ is an integer interval, possibly empty or a singleton. For integers $a < t < b$ with $y \( a \) \, y \( b \) > 0$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ y \( t \) gt.eq y \( a \)^(\( b - t \) \/ \( b - a \)) y \( b \)^(\( t - a \) \/ \( b - a \)) . $ <eq:shift-interpolation>]

]
] <prop:shift-logconcavity>

#proof[
  Every base polytope here is bounded: its $e$th coordinate lies between $f_i \( E \) - f_i \( E \\ { e } \)$ and $f_i \( { e } \)$. Fix any finite integer interval $\[ A \, B \]$ of parameter values, with $B - A = M gt.eq 2$. For each $e in E$, choose an integer interval $\[ L_e \, U_e \]$ containing all $e$th coordinates of $B \( f_2 \)$ and having width $D_e = U_e - L_e gt.eq 2$. Introduce two count coordinates $a_e \, b_e$, each of capacity $D_e$, and two further coordinates $p \, q$, each of capacity $M$. Use the full box slice of total $sum_e D_e + M$. Define physical arguments by
  #[#set math.equation(numbering: n => "(3.11)")
   $ w_(2 \, e) & = U_e - b_e \,\
w_(1 \, e) & = L_e + a_e + \( d_0 \)_e + A upright(bold(1))_({ e = j }) - B upright(bold(1))_({ e = k }) + p upright(bold(1))_({ e = j }) + q upright(bold(1))_({ e = k }) . $ <eq:difference-pair-encoding>]
  The first rank factor uses the increasing counts $\( a_e \)_e \, p \, q$; the second uses the decreasing counts $\( b_e \)_e$. These sets of count coordinates are disjoint. In the first factor, the coordinates $a_j \, p$ feed the same physical coordinate, as do $a_k \, q$, exactly as allowed in Lemma 9.
  On this finite box, choose modular translations $c_1 \, c_2$ so that $f_i + c_i$ is nondecreasing and every lower endpoint of $w_i + c_i$ is nonnegative. For finite $H$, the product
  $ F_H = Phi_(f_1 + c_1 \, H) \( w_1 + c_1 \) Phi_(f_2 + c_2 \, H) \( w_2 + c_2 \) $
  is strictly positive on the full slice and has both signatures. Sum every ordinary pair $\( a_e \, b_e \)$ at balance, leaving the pair $\( p \, q \)$ of total $M$. By Lemma 8, the resulting weight has the removal signature. Let $y_H \( t \)$ denote its value at $\( p \, q \) = \( t - A \, B - t \)$. It is positive for every integer $A lt.eq t lt.eq B$.
  For $A < t < B$, add one to each coordinate of this retained pair. This is a box-valid display of total $M + 2$, whose removal matrix is
  $ mat(delim: "(", y_H \( t - 1 \), y_H \( t \); y_H \( t \), y_H \( t + 1 \)) . $
  It has positive trace and at most one positive eigenvalue, so $y_H \( t \)^2 gt.eq y_H \( t - 1 \) y_H \( t + 1 \)$. Because all entries are positive, the successive differences of $log y_H$ are nonincreasing. It follows that, for all $A lt.eq a < t < b lt.eq B$,
  $ y_H \( t \) gt.eq y_H \( a \)^(\( b - t \) \/ \( b - a \)) y_H \( b \)^(\( t - a \) \/ \( b - a \)) . $
  At balance $a_e + b_e = D_e$, the vector $w_2$ equals $L + a$. At $\( p \, q \) = \( t - A \, B - t \)$, formula (3.11) therefore gives $w_1 - w_2 = d_0 + t \( e_j - e_k \)$. Each possible integer $x_2$ in the chosen intervals has exactly one balanced encoding. Letting $H arrow.r oo$ thus gives $y_H \( t \) arrow.r y \( t \)$ term by term, since the finite product of rank penalties converges to the two base indicators. Pass the global interpolation inequality to this limit. Positive endpoint counts give a positive lower bound at every intermediate integer. The interval $\[ A \, B \]$ was arbitrary, proving both (3.10) and the assertion about support. ◻
]

Proposition 10 supplies both the interval support and the secant inequalities used in Section 4 to compare nearby shift counts. The positive approximations are what make both conclusions survive the limit. The integrated weights of Section 5 require a separate quantitative argument for their signatures.

== 4 Partitions, shift averages, and controlled expansion <sec:geometry>

We continue with a nonempty common-base polytope $P = B \( r_1 \) ∩ B \( r_2 \)$, and its center $c$ from Lemma 6. The purpose of this section is to enlarge the two base polytopes in carefully chosen directions while changing their common lattice-point count by only a small relative error. The enlargement will allow small rank violations in the subsequent reduction. Its proof uses averages of counts with a small displacement between the two bases.

Three scales organize the comparison: $S$ is a slack threshold for the difference polytope, $W$ is a larger slack threshold for the individual base polytopes, and $T$ is the amount of enlargement. For the remaining estimates fix the integer scales

#[#set math.equation(numbering: n => "(4.1)")
 $ N = 10^10 + n + ell + ceil.l epsilon^(- 1) ceil.r \, #h(2em) K = N^5 \,\
S = N^5000 \, #h(2em) W = N^20000 \, #h(2em) T = W \/ N^300 . $ <eq:scales>]

Every exponent used in this paper is an absolute constant. Thus quantities polynomial in $N$ are polynomial in the required size parameters, although the degree is large. We repeatedly use the coarse bound $e^K$ for counts and box volumes. More precisely,

#[#set math.equation(numbering: n => "(4.2)")
 $ product_(j = 1)^m a_j lt.eq e^K quad upright("if") quad m lt.eq 100 n + 100 \, quad 0 lt.eq a_j lt.eq N^100000 \( R + 2 \) . $ <eq:coarse-size-bound>]

Indeed, when all factors are positive, the logarithm of the product is at most $\( 100 n + 100 \) \( 100000 log N + log \( R + 2 \) \) < N^5$, using $log \( R + 2 \) lt.eq ell + 2$ and $N gt.eq 10^10$. Zero factors cause no difficulty. When applying (4.2) to a lattice count, the factors are the numbers of allowed integer coordinate values; for volume they are interval lengths. These scales supply room for successive approximations without any assumption on the widths of the input polytope. The precise bound proved in this section is an enlargement factor of at most $e^(20 N^(- 8))$.

=== 4.1 Partitions determined by small slack <partitions-determined-by-small-slack>

For $A subset.eq E$, define

#[#set math.equation(numbering: n => "(4.3)")
 $ s_i \( A \) = r_i \( A \) - c \( A \) \, #h(2em) s_(*) \( A \) = s_1 \( A \) + s_2 \( E \\ A \) = r_1 \( A \) + r_2 \( E \\ A \) - R . $ <eq:slack-functions>]

These are nonnegative submodular functions, equal to zero at $diameter$ and $E$. By Lemma 3, $B \( s_(*) \) = B \( r_1 \) - B \( r_2 \)$.

The atoms of a family of subsets of $E$ are the nonempty classes of elements with identical membership in every set of the family. Let $cal(D)_i$ be the partition into atoms of ${ A : s_i \( A \) < W }$. Let $cal(G)$ be the partition into atoms of ${ A : s_(*) \( A \) < S }$; its parts will be called #emph[superblocks]. We say that $A$ cuts a part $D$ if both $A ∩ D$ and $D \\ A$ are nonempty. Thus a set that cuts a $cal(D)_i$-part has $s_i \( A \) gt.eq W$, and a set that cuts a superblock has $s_(*) \( A \) gt.eq S$.

We first record how bounds on a short generating family control the totals on all its atoms.

#thm([Lemma 4.1.])[
  (Prefixes and part totals).  #emph[Let $cal(A) = \( A_1 \, dots.h \, A_m \)$ be a family of subsets of $E$. Its atoms admit an order such that every prefix is a union of at most $n$ intersections of members of $cal(A)$, allowing $E$ as the empty intersection. If $s$ is normalized, nonnegative, and submodular, $s \( E \) = 0$, and $s \( A_j \) lt.eq b$ for every $j$, where $b gt.eq 0$, then in this order every prefix $F$ satisfies 
$ s \( F \) lt.eq n \( m + 1 \) b . $

 Consequently, suppose that $Q subset.eq B \( r \)$ and $r \( A_j \) - x \( A_j \) lt.eq b$ for all $x in Q$ and all $j$. For every atom $D$ of $cal(A)$ and every $x \, y in Q$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ \| x \( D \) - y \( D \) \| lt.eq 2 n \( m + 1 \) b . $ <eq:part-range>]

]
] <lem:generator-prefixes>

#proof[
  For an atom $D$, intersect all generators containing $D$, obtaining $H_D$. This is the union of atoms whose membership sets contain the membership set of $D$. Order the atoms so that a strict superset of memberships comes first. Every prefix is then the union of $H_D$ over its own atoms. Nonnegative submodularity gives $s \( U union V \) \, s \( U ∩ V \) lt.eq s \( U \) + s \( V \)$, which proves the prefix bound. At any $x in Q$, apply that bound to the nonnegative slack function $r \( dot.op \) - x \( dot.op \)$. For a fixed prefix its value lies in $\[ 0 \, n \( m + 1 \) b \]$, so the prefix total varies by at most $n \( m + 1 \) b$. Subtract consecutive prefix totals to obtain (4.4). ◻
]

#thm([Lemma 4.2.])[
  (Computable partitions and compatible orders).  #emph[Each part of $cal(D)_i$ is contained in a superblock. The three partitions can be found with polynomially many oracle calls and bit operations. Each has a generating family of at most $n^2$ sets satisfying its defining strict slack bound.]
  #emph[Fix a superblock order $G_1 \, dots.h \, G_g$ supplied by Lemma 11 for the $s_(*)$-generators. Every prefix $F_k = G_1 union dots.h.c union G_k$, including the empty and full prefixes, satisfies 
#[#set math.equation(numbering: n => "(4.5)")
 $ s_(*) \( F_k \) lt.eq N^4 S . $ <eq:superblock-prefix-slack>]

 For system 1 use this order, and for system 2 use its reverse. The sets preceding a superblock $G_k$ in these orders are therefore 
#[#set math.equation(numbering: n => "(4.6)")
 $ A_(1 G_k) = F_(k - 1) \, #h(2em) A_(2 G_k) = E \\ F_k . $ <eq:superblock-prefixes>]

]
] <lem:partitions>

#proof[
  If $s_(*) \( A \) < S$, then $s_1 \( A \) < W$ and $s_2 \( E \\ A \) < W$, since $S < W$. Thus neither $A$ nor its complement cuts a fine part, proving the containment.
  For each ordered pair of distinct elements $\( a \, b \)$, minimize the relevant slack function subject to $a in A$, $b in.not A$. Restricted submodular minimization, with rational modular terms for $s_i$, applies as in Section 2. If the minimum is below the threshold, retain a minimizer. Two elements separable by any set below the threshold are separated by a retained set in one of the two orientations. The retained family therefore has exactly the required atoms, and contains at most $n \( n - 1 \)$ sets. Its values and all comparisons have polynomial encoding length. The prefix bound is now Lemma 11, because $n \( n^2 + 1 \) S lt.eq N^4 S$. ◻
]

Consider the bipartite multigraph with one vertex for every part of $cal(D)_1$, one vertex for every part of $cal(D)_2$, and one edge labeled $j$ for each $j in E$, joining the two parts containing $j$. Parallel edges are retained as distinct coordinates. Every connected component lies in a single superblock. In each component $C$, choose a representative coordinate $e_C in E$. In each superblock $G$, choose a root component $C_0 \( G \)$ and put $j_G = e_(C_0 \( G \))$. These choices require only the computed partitions. They will also be used in the port parametrization of Section 5.

=== 4.2 Two averages over small shifts <two-averages-over-small-shifts>

For integral base polytopes $B_1 \, B_2$ of total $R$, put

$ Y_(B_1 \, B_2) \( d \) = \# { \( x_1 \, x_2 \) in \( B_1 ∩ bb(Z)^E \) times \( B_2 ∩ bb(Z)^E \) : x_1 - x_2 = d } . $

Write $Y \( d \)$ for the original pair, so $Y \( 0 \) = Z$. We shall also use the integral base polytopes

#[#set math.equation(numbering: n => "(4.7)")
 $ B_i^(+) = B \( r_i \) + Delta_i \, #h(2em) Delta_i = sum_(D in cal(D)_i) med sum_({ a \, b } subset.eq D) \[ - T \, T \] \( e_a - e_b \) \, $ <eq:expanded-bases>]

where each inner sum is over unordered two-element subsets. The notation $e_a$ in this formula denotes a unit vector, whereas $e_C$ denotes a chosen coordinate label. The rank function of $B_i^(+)$ is

#[#set math.equation(numbering: n => "(4.8)")
 $ r_i^(+) \( A \) = r_i \( A \) + T sum_(D in cal(D)_i) \| A ∩ D \| thin \| D \\ A \| . $ <eq:expanded-rank>]

Indeed, each segment has rank $T$ on sets separating its two endpoints and rank zero on other sets; use Lemma 3 for the sum. In particular $r_i^(+)$ is integral and submodular, but need not be increasing. Define $Y^(+) \( d \) = Y_(B_1^(+) \, B_2^(+)) \( d \)$ and $Z^(+) = Y^(+) \( 0 \)$.

Every real vector with sum zero on each superblock has a unique expression

#[#set math.equation(numbering: n => "(4.9)")
 $ d \( l \) = sum_(G in cal(G)) med sum_(j in G \\ { j_G }) l_j \( e_j - e_(j_G) \) \; #h(2em) l_j = d_j . $ <eq:star-coordinates>]

Call this the full set of star coordinates. Its restricted version uses only $j = e_C$ for nonroot components $C subset.eq G$, with all other coefficients zero. Set

#[#set math.equation(numbering: n => "(4.10)")
 $ h = S \/ N^50 \, #h(2em) M = N^2000 \, #h(2em) omega \( l \) = exp (- frac(sum_j \| l_j \|, h)) \, #h(2em) psi \( l \) = exp (- frac(sum_C l_(e_C)^2, M^2)) . $ <eq:shift-kernels>]

Here $omega$ uses the full star and $psi$ the restricted star. Let their unrestricted integer normalizers be

#[#set math.equation(numbering: n => "(4.11)")
 $ A_omega = sum_(l in bb(Z)^(n - g)) omega \( l \) \, #h(2em) J = sum_(l in bb(Z)^(sum_G \( \# { C subset.eq G } - 1 \))) psi \( l \) . $ <eq:shift-normalizers>]

The sums factor into one-dimensional sums. An empty star has a single coefficient vector, weight one, and normalizer one.

#thm([Lemma 4.3.])[
  (Shift averages).  #emph[For $F = Y$ and for $F = Y^(+)$, every integral full or restricted star shift with $\| l_j \| lt.eq S \/ N^25$ satisfies 
#[#set math.equation(numbering: n => "(4.12)")
 $ e^(- N^(- 8)) lt.eq frac(F \( d \( l \) \), F \( 0 \)) lt.eq e^(N^(- 8)) . $ <eq:small-shift-ratio>]

 For $\( kappa \, A_kappa \) = \( omega \, A_omega \)$ or $\( psi \, J \)$, on its corresponding star lattice, 
#[#set math.equation(numbering: n => "(4.13)")
 $ e^(- 3 N^(- 8)) F \( 0 \) lt.eq 1 / A_kappa sum_l kappa \( l \) F \( d \( l \) \) lt.eq e^(3 N^(- 8)) F \( 0 \) . $ <eq:average-comparison>]

 The lower bound remains valid if the sum is restricted to $max_j \| l_j \| lt.eq S \/ N^25$.]
] <lem:shift-average>

#proof[
  First, $Y \( d \) gt.eq 1$ for every integral $d$ with zero superblock sums and $parallel d parallel_1 lt.eq S \/ 2$. If a set $A$ cuts no superblock then $d \( A \) = 0 lt.eq s_(*) \( A \)$; otherwise $d \( A \) lt.eq parallel d parallel_1 lt.eq S \/ 2 < s_(*) \( A \)$. Thus $d in B \( s_(*) \)$, so $B \( r_1 \) ∩ \( B \( r_2 \) + d \)$ is nonempty. Its integrality, from Lemma 5, supplies an integer point. Inclusion gives the same positivity for $Y^(+)$.
  All coordinates of an expanded base lie in $\[ - n T \, R + n T \]$. The product-of-lengths bound (4.2) therefore gives $Y \( d \) \, Y^(+) \( d \) lt.eq e^K$ for every $d$. In the positive region just proved, their logarithms lie between zero and $K$. By Proposition 10, these logarithms are concave on integer lines parallel to $e_j - e_k$.
  Introduce the star shifts successively. Each partial shift has $ell^1$-norm at most $2 n S \/ N^25$. On the line for the next shift, an integer interval of radius $floor.l S \/ 10 floor.r$ about that partial shift remains in the positive region. A concave integer sequence taking values in $\[ 0 \, K \]$ on this interval has successive slopes of absolute value at most $100 K \/ S$ within distance $S \/ N^25$ of its center: compare each slope with the secants to the two ends of the interval. Adding at most $n$ changes proves
  $ \| log F \( d \( l \) \) - log F \( 0 \) \| lt.eq frac(100 K, S) sum_j \| l_j \| lt.eq 100 n K \/ N^25 < N^(- 8) . $
  For completeness, put $b = S \/ N^25$. For an individual $omega$-coordinate the normalized tail beyond $b$ is at most $4 e^(- b \/ \( 2 h \))$, by summing a geometric series. For an individual $psi$-coordinate it is at most $4 e^(- b^2 \/ \( 2 M^2 \))$: compare the decreasing Gaussian tail with its integral and use $b gt.eq 2 M$. The full normalized tail is at most the sum of these one-coordinate tails. Since $b \/ h = N^25$, $b^2 \/ M^2 = N^5950$, and $K = N^5$, in either case the tail probability $tau$ satisfies
  $ e^K tau lt.eq e^(- N^20) . $
  On the complementary region use (4.12); on the tail use $F lt.eq e^K$ and $F \( 0 \) gt.eq 1$. The resulting lower bound $\( 1 - tau \) e^(- N^(- 8)) F \( 0 \)$ and upper bound $e^(N^(- 8)) F \( 0 \) + e^K tau$ imply (4.13), including its truncated version. All assertions are exact when the star is empty. ◻
]

The full-star average is only a device for comparing $Z^(+)$ and $Z$. The algorithm will use the restricted average, whose shift variables are determined by polynomial-length part totals.

=== 4.3 Subdivision into slices with slack <subdivision-into-slices-with-slack>

The full-star numerator is a weighted sum over pairs of lattice points with equal superblock totals. Once these totals are fixed, the two systems can be subdivided independently. We will contract them toward separate points in their respective slices; this preserves the common superblock totals but may introduce differences away from the representative coordinates. The full star allows these differences, which is why it is used for this comparison. Fix such a vector of integer totals $w = \( w_G : G in cal(G) \)$, and write

#[#set math.equation(numbering: n => "(4.14)")
 $ Q_i \( w \) = { x in B \( r_i \) : x \( G \) = w_G med \( G in cal(G) \) } . $ <eq:original-slices>]

Whenever both expanded slices are nonempty, both original slices are nonempty as well. Every direction in $Delta_i$ preserves the superblock totals, so the corresponding expanded slice is exactly $Q_i \( w \) + Delta_i$.

The following refinement is an existence argument for these slices. Its subdivisions can differ between the two systems, and can depend on $w$. Their number need not be polynomial; the algorithm never enumerates them.

#thm([Lemma 4.4.])[
  (Refinement witnesses).  #emph[Fix integer $w$ for which both $Q_i \( w \)$ are nonempty. For each system separately, its lattice points and those of its expanded slice can be partitioned by fixing integer totals on successively finer parts. Each resulting original slice has the form 
$ Q = { x in B \( r_i \) : x \( D \) = v_D med \( D in cal(P) \) } \, $

 where $cal(P)$ refines $cal(G)$ and every part of $cal(P)$ is a union of $cal(D)_i$-parts. Its expanded partner is exactly $Q + Delta_i$. Every nonempty terminal slice has a point $a^(*) in Q$ satisfying 
#[#set math.equation(numbering: n => "(4.15)")
 $ parallel a^(*) - c parallel_oo & lt.eq N^60 S \,\
r_i \( A \) - a^(*) \( A \) & gt.eq S &  & upright("if ") A upright(" cuts a part of ") cal(P) \,\
r_i \( A \) - a^(*) \( A \) & gt.eq W \/ 2 &  & upright("if ") A upright(" cuts a part of ") cal(D)_i . $ <eq:witness-distance>]

]
] <lem:refinement-witnesses>

#proof[
  We first control the starting totals. If $A$ is one of the $s_(*)$-generators, it is a union of superblocks. For any $x_1 in Q_1 \( w \)$, $x_2 in Q_2 \( w \)$,
  $ \[ r_1 \( A \) - x_1 \( A \) \] + \[ r_2 \( E \\ A \) - x_2 \( E \\ A \) \] = s_(*) \( A \) < S . $
  Both terms are nonnegative. Thus on the whole first slice every generator has slack below $S$, and on the whole second slice its complement has slack below $S$. The same assertions hold at $c$. Apply Lemma 11 to $Q_i \( w \) union { c }$, using complemented generators for system 2. It gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ \| w_G - c \( G \) \| lt.eq 2 n \( n^2 + 1 \) S lt.eq N^6 S . $ <eq:initial-total-distance>]
  The distance bound in Lemma 5, applied to one rank system and these partition equalities, gives a point $a in Q_i \( w \)$ with $parallel a - c parallel_oo lt.eq N^10 S$. Choose such a point rationally: its allowed set is a nonempty rational polytope, since $c$ and the cube radius are rational.
  We now describe one refinement step on one system. Maintain a nonempty original slice $Q$, its partition $cal(P)$, and a point $a in Q$. A list of generators produces $cal(P)$; initially it is the list just described. The list has at most $n^2 + n$ members. Each initial generator has slack at most $S$ throughout the current slice, and every subsequently added generator will have slack at most $N^3 S$ throughout the slice on which it is added and all its descendants.
  Intersect $Q$ with the cube of radius $L = N^10 S$ about $a$, and choose a center $b$ of this boxed slice with the property of Lemma 6. If every rank inequality cutting a current part has slack at least $S$ at $b$, stop on this branch with $a^(*) = b$. Otherwise select a set $A$ cutting a current part with $r_i \( A \) - b \( A \) < S$. The center property implies
  $ max_(x in Q \, med parallel x - a parallel_oo lt.eq L) \( r_i \( A \) - x \( A \) \) lt.eq 4 \( n + 1 \) S < N^3 S . $
  The slack $x mapsto r_i \( A \) - x \( A \)$ is nonnegative on $Q$ and has integral linear part $- upright(bold(1))_A$. Since its displayed maximum is less than $N^3 S < L$, the last assertion of Lemma 5 identifies this maximum with the unrestricted maximum on $Q$. Thus the new generator has slack at most $N^3 S$ throughout the current slice.
  We check simultaneously that the selected set does not cut a fine part and that proximity to $c$ survives refinement. At depth $t$, maintain
  #[#set math.equation(numbering: n => "(4.17)")
   $ parallel a - c parallel_oo lt.eq N^10 S + t N^17 S . $ <eq:refinement-distance-induction>]
  As each refinement increases the number of parts, $t lt.eq n$. Every tested center $b$, being within $L$ of $a$, is therefore within $N^60 S$ of $c$. If $A$ cut a fine part, then its slack at $c$ would satisfy $s_i \( A \) = r_i \( A \) - c \( A \) gt.eq W$, and so
  $ r_i \( A \) - b \( A \) gt.eq W - n N^60 S gt.eq W \/ 2 > S \, $
  a contradiction. The refined partition obtained by adding $A$ still consists of unions of fine parts.
  On this refined partition prescribe every integer vector of part totals that occurs in the expanded current slice. Every such vector occurs in the original real slice: in a decomposition $x + v in Q + Delta_i$, the vector $v$ preserves the new totals, since it preserves each fine-part total. Thus each retained original child slice is nonempty, and its expanded partner remains its Minkowski sum with $Delta_i$. The new generator list has slack at most $N^3 S$ throughout $Q$. By (4.4), the range of every new part total over $Q$ is at most
  $ 2 n \( n^2 + n + 1 \) N^3 S lt.eq N^12 S . $
  The current $a$ consequently satisfies all the child’s new equalities with error at most $N^12 S$. The distance bound in Lemma 5 supplies a point in the child within $N^17 S$ of $a$. As before, choose this point rationally within the indicated rational cube. This proves (4.17) at the next depth.
  Each branch stops after at most $n - 1$ strict refinements. There are finitely many branches because the slices are bounded. The stopping rule gives (4.15); the distance induction gives (4.15); and the same comparison with $c$ gives (4.15) for every fine-cutting inequality. Prescribing totals partitions lattice points without multiplicity. Integral prescribed totals are compatible with the unit lattice in every terminal affine space; in particular, nonempty original terminal slices contain integer points by Lemma 5. ◻
]

=== 4.4 From expanded cells to original cells <from-expanded-cells-to-original-cells>

We have produced points with two different slack guarantees. The $S$-slack will absorb unit-cell rounding. The larger $W \/ 2$-slack will also absorb the expansion in (4.7). Both can be obtained by contracting each slice by a tiny fraction toward its witness.

#thm([Proposition 4.5.])[
  (Expansion costs little).  #emph[The expanded common-base count satisfies 
#[#set math.equation(numbering: n => "(4.18)")
 $ Z lt.eq Z^(+) lt.eq e^(20 N^(- 8)) Z . $ <eq:expansion-comparison>]

]
] <prop:expansion>

#proof[
  The lower bound follows from inclusion. For the upper bound, define the full-star weighted pair sums
  $ cal(W) = sum_l omega \( l \) Y \( d \( l \) \) \, #h(2em) cal(W)^(+) = sum_l omega \( l \) Y^(+) \( d \( l \) \) . $
  Fix common integer superblock totals $w$, and perform the two independent subdivisions of Lemma 14. We compare one pair of terminal slices $Q_1 \, Q_2$ and its expanded pair $Q_1 + Delta_1 \, Q_2 + Delta_2$. Their partitions $cal(P)_1 \, cal(P)_2$ may differ. Let their witnesses be $a_1^(*) \, a_2^(*)$, and put $a^(*) = \( a_1^(*) \, a_2^(*) \)$.
  For each system use the affine coordinates obtained by retaining all but one physical coordinate in each terminal part. The omitted coordinate is the prescribed integer total minus the retained coordinates. The integral points in this affine space therefore form precisely a unit grid. Lebesgue measure below is the product measure in these free coordinates, independently for the two systems. The slack in (4.15) ensures that each original slice is full-dimensional in its specified affine space: every inequality not fixed by its part totals is strict at the witness. An affine space of dimension zero is given measure one.
  Tile these affine spaces by half-open unit cells based at all their integral points. In physical coordinates any point of a cell differs from its base point by at most $2 n$ in sup norm; the same bound applies when rounding to the base of the containing cell. This uses the formula for the omitted coordinate and is valid for negative coordinates as well. No truncation at zero is made: the expanded bases can have negative coordinates, and feasibility will be checked using their full rank inequalities.
  Let $cal(C)$ be the union of cells based at pairs of original feasible lattice points in these terminal slices, and let $cal(C)^(+)$ be the corresponding expanded union. Extend the weight to their whole product affine space by
  $ omega \( x_1 \, x_2 \) = e^(- Phi \( x_1 \, x_2 \)) \, #h(2em) Phi \( x_1 \, x_2 \) = 1 / h sum_(G in cal(G)) sum_(j in G \\ { j_G }) \| x_(1 j) - x_(2 j) \| . $
  The common superblock totals ensure that this is the weight in (4.9). It is continuous and $Phi$ is convex. Its logarithm varies by at most
  #[#set math.equation(numbering: n => "(4.19)")
   $ kappa_0 = 4 n^2 \/ h $ <eq:cell-weight-variation>]
  within any one of our product cells relative to the base point. Thus integration over $cal(C)$ or $cal(C)^(+)$ approximates the corresponding weighted lattice sum within a factor $e^(kappa_0)$.
  Put $theta = N^(- 200)$ and apply the homothety
  $ H \( x \) = \( 1 - theta \) x + theta a^(*) . $
  We claim that $H \( cal(C)^(+) \) subset.eq cal(C)$. Fix $x in cal(C)^(+)$, and round $H \( x \)$ to the base point $y = \( y_1 \, y_2 \)$ of its containing cell. All prescribed terminal totals are preserved. In system $i$, the rank inequality for $A$ is satisfied by the expanded lattice point under $x$ with additional allowance
  $ sigma_i \( A \) = T sum_(D in cal(D)_i) \| A ∩ D \| thin \| D \\ A \| lt.eq n^2 T . $
  The move to $x$ and the final rounding each change a subset sum by at most $2 n^2$. If $A$ cuts a terminal part but no fine part, then $sigma_i \( A \) = 0$, and
  $ y_i \( A \) - r_i \( A \) lt.eq 4 n^2 - theta S < 0 . $
  If $A$ cuts a fine part, it also cuts a terminal part, and
  $ y_i \( A \) - r_i \( A \) lt.eq 4 n^2 + n^2 T - theta W \/ 2 < 0 . $
  These strict inequalities follow from the chosen scales: $theta S = N^4800$ and $theta W \/ T = N^100$. Finally, if $A$ cuts no terminal part, its total is fixed on the affine space and equals a feasible original total. Every original rank inequality holds at $y_i$, proving the claim. This also enforces nonnegativity of $y_i$, since it follows from the original base constraints.
  Write $d lt.eq 2 n$ for the product free dimension. The map $H$ is injective, with Jacobian $\( 1 - theta \)^d$. Convexity and nonnegativity of $Phi$ give
  $ Phi \( H \( x \) \) lt.eq \( 1 - theta \) Phi \( x \) + theta Phi \( a^(*) \) lt.eq Phi \( x \) + theta Phi \( a^(*) \) . $
  Moreover, (4.15) gives
  $ theta Phi \( a^(*) \) lt.eq theta thin 2 n N^60 S \/ h < N^(- 80) . $
  Integration and the inclusion just proved imply
  $ integral_(cal(C)) omega gt.eq \( 1 - theta \)^d e^(- theta Phi \( a^(*) \)) integral_(cal(C)^(+)) omega . $
  Together with (4.19), this bounds the expanded weighted lattice sum in this pair of slices by the original weighted sum times
  $ exp { 2 kappa_0 + theta Phi \( a^(*) \) - d log \( 1 - theta \) } lt.eq e^(N^(- 8)) . $
  The same argument holds in dimension zero, with Jacobian and cell measure one. Summing over the terminal pairs and then over $w$ yields $cal(W)^(+) lt.eq e^(N^(- 8)) cal(W)$. Finally, Lemma 13 gives
  $ Z^(+) lt.eq e^(3 N^(- 8)) cal(W)^(+) / A_omega lt.eq e^(4 N^(- 8)) cal(W) / A_omega lt.eq e^(7 N^(- 8)) Z lt.eq e^(20 N^(- 8)) Z . $
  ◻
]

Only the original partitions, their orders, and the representative coordinates are computed. The expanded polytopes, the full-star sum, and all terminal subdivisions were used to prove the comparison. The next section uses the restricted Gaussian average and part totals to construct a finite counting problem whose capacities are polynomial in $N$.

== 5 Polynomial port ranges and positive weights <sec:ports>

The restricted Gaussian average in Lemma 13 approximates $Z$ by a normalized weighted count of pairs of original bases whose difference is supported on the representative edges. We now describe these pairs by part totals and free edge coordinates. Only the part totals will be discrete variables in the counting algorithm. The free coordinates, whose ranges may depend on the numerical value of $R$, will be integrated out. The resulting positive weights must satisfy the two signatures of Definition 7 at every annealing power; this is the main purpose of the smoothing below.

=== 5.1 Part totals and an integral coordinate map <part-totals-and-an-integral-coordinate-map>

For each $D in cal(D)_i$, define integer endpoints

$ L_(i D) = max { 0 \, floor.l c \( D \) - N^20 W floor.r } \, #h(2em) U_(i D) = min { R \, ceil.l c \( D \) + N^20 W ceil.r } . $

A #emph[port] is the part total $u_(i D)$, restricted to $\[ L_(i D) \, U_(i D) \] ∩ bb(Z)$. Its length $d_(i D) = U_(i D) - L_(i D)$ is at most $N^21 W$. Write

$ macron(r)_i \( cal(A) \) = r_i (union.big_(D in cal(A)) D) \, #h(2em) cal(A) subset.eq cal(D)_i . $

By Lemma 3, the projection of $B \( r_i \)$ onto its part totals is $B \( macron(r)_i \)$.

These ranges contain every term of the original restricted Gaussian average, supported on representative edges, with $\| l_j \| lt.eq S \/ N^25$. Here is a quantitative justification. The center property bounds the slack of every generator of $cal(D)_i$ throughout $P$ by $4 \( n + 1 \) W$. The prefix construction in Lemma 11, followed by subtraction of consecutive prefix totals, therefore gives

#[#set math.equation(numbering: n => "(5.1)")
 $ \| x \( D \) - c \( D \) \| lt.eq N^10 W #h(2em) \( x in P \, D in cal(D)_i \) . $ <eq:part-total-range>]

Indeed there are at most $n^2$ generators and at most $n$ intersections per prefix, so $8 \( n + 1 \) n \( n^2 + 1 \) W$ suffices. If $x_1 in B \( r_1 \)$, $x_2 in B \( r_2 \)$, and $x_1 - x_2 = d \( l \)$ with these bounds on $l$, then $x_1$ violates any inequality of the second system by at most $lr(bar.v.double d \( l \) bar.v.double)_1 lt.eq 2 n S$. Lemma 5 gives a point of $P$ within $N^6 S$ of $x_1$ in sup norm. The same assertion holds for $x_2$. Consequently their part totals differ from $c \( D \)$ by at most $N^10 W + n N^6 S < N^20 W$. Nonnegativity and total rank put those totals in $\[ 0 \, R \]$ as well.

Use the bipartite graph, component representatives $e_C$, and root components $C_0 \( G \)$ fixed in Section 4. For arbitrary real port values, define

#[#set math.equation(numbering: n => "(5.2)")
 $ t_C \( u \) = sum_(D in C ∩ cal(D)_1) u_(1 D) - sum_(D in C ∩ cal(D)_2) u_(2 D) . $ <eq:component-imbalance>]

Choose a spanning tree $cal(T)_C$ in each component, containing $e_C$. Let $z_e$, for edges outside these trees, be free coordinates. We seek $X_1$ with side-1 margins $u_(1 D)$ and side-2 margins $u_(2 D)$, except that $t_C$ is added to the side-2 margin incident to $e_C$. The two margin sums in a component now agree. Define $X_2$ by subtracting $t_C$ from $X_1$ on $e_C$, leaving all other edges unchanged. Figure 1 shows this correction and a free coordinate in a component with one cycle.

#thm([Lemma 5.1.])[
  (Integral tree coordinates).  #emph[There is a unique pair $X_i \( u \, z \)$ with these properties and $X_(1 e) = z_e$ on nontree edges. Its coordinates are integral linear functions of $\( u \, z \)$, with coefficients of absolute value at most $10 \( n + 1 \)$. Each coordinate depends only on variables in its superblock. For integral $\( u \, z \)$ this is a bijection onto integral pairs with the specified $cal(D)_1$-totals for $X_1$ and $cal(D)_2$-totals for $X_2$, and with $X_1 - X_2$ supported on the representatives.]
] <lem:tree-coordinates>

#proof[
  Remove the prescribed nontree contributions from each vertex margin. A leaf of the remaining tree determines its unique incident edge; subtract that value from the neighboring margin and delete the leaf. The final equation holds because the two margin sums agree. This proves existence, uniqueness, and integrality. Equivalently, deleting a tree edge divides the vertices into two sets; its value is the signed sum of the residual margins on either one of those sets. Every original port has coefficient $0$, $1$, or $- 1$ in that sum before the representative correction, and every free edge contributes with coefficient of absolute value at most one. Substituting (5.2) gives the stated loose coefficient bound. Conversely, the prescribed margins of any such pair give $sum_(e in C) \( X_(1 e) - X_(2 e) \) = t_C$. Representative support forces its discrepancy on $e_C$ to equal $t_C$, so it obeys exactly the equations just solved. The inverse map reads off the part totals and nontree values. Thus there is no multiplicity or lattice determinant in this parametrization. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.3182, 1.282), (0.3182, 1.918), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$D_1$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.3182, -0.3182), (0.3182, 0.3182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$D_2$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.682, 1.282), (4.318, 1.918), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$D'_1$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.682, -0.3182), (4.318, 0.3182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$D'_2$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.4571, 1.6), (3.543, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((2, 1.6), [#text(size: 9pt)[$e_C$]], anchor: "south", padding: 0.1176cm)
  line((0.4244, 1.43), (3.576, 0.1697), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.4244, 0.1697), (3.576, 1.43), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.4571, 0), (3.543, 0), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((2, 2.45), [#text(size: 9pt)[$X_(1e_C)-X_(2e_C)=t_C$]])
  content((2, -0.8), [#text(size: 9pt)[$z_e=X_1e=X_2e$]])
  content((-0.55, 1.6), [#text(size: 9pt)[$u_(1D_1)$]], anchor: "east", padding: 0.1176cm)
  content((-0.55, 0), [#text(size: 9pt)[$u_(1D_2)$]], anchor: "east", padding: 0.1176cm)
  content((4.55, 1.6), [#text(size: 9pt)[$u_(2D'_1)+t_C$]], anchor: "west", padding: 0.1176cm)
  content((4.55, 0), [#text(size: 9pt)[$u_(2D'_2)$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: A schematic component with four edges. The solid edges form the chosen tree; the dashed edge is a free coordinate. The displayed right-hand margins are those for $X_1$. After solving the tree equations, subtracting $t_C$ on $e_C$ gives the prescribed margins for $X_2$. The construction applies to arbitrary bipartite multigraph components. ],
) <fig:tree-ports>

Let $cal(F)_G$ denote the nontree edges in a superblock $G$. In discrete sums we take $z in { 0 \, dots.h \, R }^(cal(F)_G)$; for integration we use $Q_G = \[ 0 \, R + 1 \]^(cal(F)_G)$. These choices include every original base pair. They also fix the measure: it is ordinary Lebesgue measure in $z$, with a zero-dimensional integral equal to its integrand.

=== 5.2 Convex penalties and comparison with the count <convex-penalties-and-comparison-with-the-count>

For each superblock $G$, let $A_(i G)$ be the union of blocks preceding $G$ in the order for system $i$, with the reversed order for system 2. Define the contracted ranks and their violation penalty by

#[#set math.equation(numbering: n => "(5.3)")
 $ r_(i G) \( U \) & = r_i \( A_(i G) union U \) - r_i \( A_(i G) \) &  & \( U subset.eq G \) \,\
V_G \( u \, z \) & = sum_(i = 1)^2 max_(U subset.eq G) { X_i \( u \, z \) \( U \) - r_(i G) \( U \) } \, & lambda & = N^320 \/ W . $ <eq:block-penalty>]

Each maximum includes the empty set, so $V_G$ is nonnegative and convex. The hard conditions on ports are

#[#set math.equation(numbering: n => "(5.4)")
 $ u_i in B \( macron(r)_i \) quad \( i = 1 \, 2 \) \, #h(2em) sum_(C subset.eq G) t_C = 0 quad upright("for every ") G . $ <eq:hard-port-conditions>]

#thm([Lemma 5.2.])[
  (What the penalties enforce).  #emph[An original base pair with a representative shift satisfies (5.4) and $sum_G V_G lt.eq N^7 S$. Conversely, if (5.4) holds, then 
$ X_i \( A \) - r_i \( A \) lt.eq sum_G V_G #h(2em) \( A subset.eq E \, i = 1 \, 2 \) . $

 If in addition $sum_G V_G lt.eq T$, then $X_i in B_i^(+)$ for both $i$, where $B_i^(+)$ is defined in (4.7).]
] <lem:port-penalties>

#proof[
  The representative shift has sum zero on each superblock, proving the hard conditions. For an original pair, every forward superblock prefix $A$ satisfies $x_1 \( A \) = x_2 \( A \)$. Its two complementary rank slacks therefore add to $s_(*) \( A \) lt.eq N^4 S$. The system-2 prefixes are complements of such forward prefixes. In particular the slack at either prefix $A_(i G)$ is at most $N^4 S$. The inequality on $A_(i G) union U$ gives
  $ x_i \( U \) - r_(i G) \( U \) lt.eq r_i \( A_(i G) \) - x_i \( A_(i G) \) \, $
  so summing over the two systems and at most $n$ blocks proves the first bound.
  For the converse, fix $i$ and put $U_G = A ∩ G$. Diminishing marginal returns, applied successively in the order of system $i$, gives
  $ sum_G #scale(x: 120%, y: 120%)[\(] r_i \( A_(i G) union U_G \) - r_i \( A_(i G) \) #scale(x: 120%, y: 120%)[\)] lt.eq r_i \( A \) . $
  Indeed the prefix of the already selected pieces of $A$ is contained in $A_(i G)$; its marginal increment from $U_G$ is at least the increment from the full prefix. Summing the defining inequalities for $V_G$ proves the claim. The hard rank conditions enforce the correct total and every inequality on a union of parts of $cal(D)_i$. Any other set cuts at least one part. Its rank bound in $B_i^(+)$ increases by $T$ for every pair of coordinates in that part separated by the set, and hence by at least $T$. This absorbs the remaining violation. ◻
]

Write $J = sum_l exp \( - sum_j l_j^2 \/ M^2 \)$ for the normalizer of the representative average of Lemma 13. Consider

#[#set math.equation(numbering: n => "(5.5)")
 $ cal(A) = sum_(u upright(" in the integer port boxes")\
upright("satisfying ") upright("(5.4)")) med sum_(z in { 0 \, dots.h \, R }^(union.big_G cal(F)_G)) exp (- lambda sum_G V_G \( u \, z \) - sum_G sum_(C eq.not C_0 \( G \)) t_C \( u \)^2 \/ M^2) . $ <eq:discrete-port-sum>]

Under the hard block equality, the nonroot values $t_C$ are precisely the independent representative star coordinates. Lemma 16 therefore identifies every summand with one representative-shift pair. For a lower bound, retain original pairs with $\| l_j \| lt.eq S \/ N^25$. Their ports and free coordinates are in the chosen boxes, and their additional penalty is at most $lambda N^7 S = N^327 S \/ W < N^(- 20)$. For an upper bound, the summands with $sum_G V_G lt.eq T$ form a subset of the expanded representative average. The remaining summands have total at most

$ e^K e^(- lambda T) = exp \( K - N^20 \) . $

The product bound associated with (4.1) justifies $e^K$ here. Since $J Z gt.eq 1$, this last bound is negligible also as a relative error. Lemma 13 and Proposition 15 now give

#[#set math.equation(numbering: n => "(5.6)")
 $ lr(|log frac(cal(A), J Z)|) lt.eq 40 N^(- 8) . $ <eq:discrete-proxy-bound>]

Define the continuous block weights

#[#set math.equation(numbering: n => "(5.7)")
 $ I_G \( u \) = integral_(Q_G) exp \( - lambda V_G \( u \, z \) \) thin upright(d) z . $ <eq:block-integral>]

They are positive. They are log concave by the theorem on marginals of log-concave functions #cite(label("Prekopa1973")), applied to the integrand times the indicator of its convex integration box. The tree coefficient bound implies, globally in the joint variables $\( u \, z \)$,

#[#set math.equation(numbering: n => "(5.8)")
 $ \| lambda V_G \( u \, z \) - lambda V_G \( u' \, z' \) \| lt.eq L_0 lr(bar.v.double \( u \, z \) - \( u' \, z' \) bar.v.double)_oo \, #h(2em) L_0 = N^330 \/ W . $ <eq:port-lipschitz>]

For example, at most $3 n$ input variables, at most $n$ edge coordinates per subset sum, and coefficients bounded by $10 \( n + 1 \)$ give a Lipschitz constant at most $100 \( n + 1 \)^4 lambda < L_0$. Integrating the corresponding pointwise ratio bounds proves the same bound for $log I_G$ in $u$. Define the hard integrated mass

$ cal(I)_(upright("hard")) = sum_(u upright(" in the integer port boxes")\
upright("satisfying ") upright("(5.4)")) product_G I_G \( u \) exp (- sum_G sum_(C eq.not C_0 \( G \)) t_C \( u \)^2 \/ M^2) . $

Tiling $Q_G$ by unit cells anchored at ${ 0 \, dots.h \, R }^(cal(F)_G)$ gives

#[#set math.equation(numbering: n => "(5.9)")
 $ lr(|log cal(I)_(upright("hard")) / cal(A)|) lt.eq 2 n L_0 . $ <eq:sum-integral-comparison>]

=== 5.3 Smoothing and the paired count model <smoothing-and-the-paired-count-model>

We have obtained positive log-concave block integrals, but log concavity alone does not imply either integer signature. We arrange a quantitative version by smoothing on a scale on which the weights barely change, then adding a smaller strictly concave quadratic. Its strict Hessian margin will absorb the error between second derivatives and the discrete differences in the signature test. Set

#[#set math.equation(numbering: n => "(5.10)")
 $ b_0 = W \/ N^400 \, #h(2em) alpha = N^(- 100) \/ W^2 \, #h(2em) H = N^10 . $ <eq:smoothing-scales>]

In every port coordinate independently, let $kappa_(b_0)$ be the law of a sum of six uniform variables on $\[ - b_0 \/ 6 \, b_0 \/ 6 \]$. Convolve $I_G$ in its port variables with the product of these kernels, writing the result as $tilde(I)_G$. The kernel and the integral are log concave, so their convolution is log concave as well #cite(label("Prekopa1973")). Its support displacement has sup norm at most $b_0$; hence

#[#set math.equation(numbering: n => "(5.11)")
 $ e^(- L_0 b_0) I_G \( u \) lt.eq tilde(I)_G \( u \) lt.eq e^(L_0 b_0) I_G \( u \) . $ <eq:smoothing-error>]

Define

#[#set math.equation(numbering: n => "(5.12)")
 $ F_G \( u \) = tilde(I)_G \( u \) exp {- alpha / 2 sum_(i \, D subset.eq G) \( u_(i D) - c \( D \) \)^2 - sum_(C eq.not C_0 \( G \)) frac(t_C \( u \)^2, M^2) - H lr(|sum_(C subset.eq G) t_C \( u \)|)} . $ <eq:block-factor>]

For a rank $r$ on part indices, let

$ m_r \( v \) = min_A { r \( A \) + v \( E_r \\ A \) } \, #h(2em) Phi_(r \, H) \( v \) = exp { - H \[ v \( E_r \) + r \( E_r \) - 2 m_r \( v \) \] } \, $

where $E_r$ is its index set. This is the soft rank factor of (3.7). On nonnegative integral inputs its penalty is nonnegative, is zero exactly on $B \( r \)$, and is at least $H$ otherwise. The positive port weight is

#[#set math.equation(numbering: n => "(5.13)")
 $ w \( u \) = Phi_(macron(r)_1 \, H) \( u_1 \) Phi_(macron(r)_2 \, H) \( u_2 \) product_G F_G \( u \) . $ <eq:positive-port-weight>]

On the hard profiles the softened penalties vanish, and hence

$ lr(|log frac(sum_(u upright(" satisfying ") upright("(5.4)")) w \( u \), cal(I)_(upright("hard")))|) lt.eq n L_0 b_0 + alpha n \( N^21 W \)^2 < N^(- 50) . $

Every profile violating a hard condition has an integral nonzero penalty and hence an extra factor at most $e^(- H)$. All other exponential factors are at most one, and $tilde(I)_G lt.eq \( R + 1 \)^(\| cal(F)_G \|)$. Thus

$ 0 lt.eq sum_u w \( u \) - sum_(u upright(" satisfying ") upright("(5.4)")) w \( u \) lt.eq e^(K - H) . $

Combining these estimates with (5.6) proves

#[#set math.equation(numbering: n => "(5.14)")
 $ lr(|log frac(sum_u w \( u \), J Z)|) lt.eq 100 N^(- 7) . $ <eq:positive-proxy-bound>]

The weighted port sum now approximates $J Z$. It remains to represent this sum as a balanced mass of weights with both integer signatures.

To expose the disjoint factor groups needed for signatures, give each positive-length port two count coordinates $\( a_(i D) \, b_(i D) \)$, each of capacity $d_(i D)$. The coordinate $a$ feeds a rank factor; $b$ feeds a block factor. Their interpreted port values are

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[rank argument
], table.cell(rowspan: 1, colspan: 1)[block argument
]),
  table.cell(rowspan: 1, colspan: 1)[$i = 1$
], table.cell(rowspan: 1, colspan: 1)[$U_(1 D) - a_(1 D)$
], table.cell(rowspan: 1, colspan: 1)[$L_(1 D) + b_(1 D)$
],
  table.cell(rowspan: 1, colspan: 1)[$i = 2$
], table.cell(rowspan: 1, colspan: 1)[$L_(2 D) + a_(2 D)$
], table.cell(rowspan: 1, colspan: 1)[$U_(2 D) - b_(2 D)$.
],
)
]

They agree exactly when $a_(i D) + b_(i D) = d_(i D)$. Length-zero ports are fixed at their endpoint and omitted. All count coordinates are integers. Let

#[#set math.equation(numbering: n => "(5.15)")
 $ p = sum_(i \, D) d_(i D) \, #h(2em) cal(S) = { \( a \, b \) : 0 lt.eq a_(i D) \, b_(i D) lt.eq d_(i D) \, quad sum_(i \, D) \( a_(i D) + b_(i D) \) = p } . $ <eq:paired-count-slice>]

Let $h$ on $cal(S)$ be the product in (5.13), using rank and block arguments from the corresponding columns. The factors now use disjoint count coordinates. The side-2 reflection makes every retained block coordinate enter its component imbalance with coefficient $+ 1$:

$ t_C = sum_(D in C ∩ cal(D)_1) L_(1 D) - sum_(D in C ∩ cal(D)_2) U_(2 D) + sum_(\( i \, D \) : D in C) b_(i D) \, $

where omitted count coordinates are understood as zero. This common orientation is needed for both imbalance factors in the signature test.

=== 5.4 The quantitative signature estimate <the-quantitative-signature-estimate>

#thm([Lemma 5.3.])[
  (Derivatives after smoothing).  #emph[In block count coordinates, $g = log tilde(I)_G$ is $C^3$, is concave, and satisfies, everywhere, 
#[#set math.equation(numbering: n => "(5.16)")
 $ \| g''_(i j) \| lt.eq A_2 = N^800 \/ W^2 \, #h(2em) \| g'''_(i j k) \| lt.eq A_3 = N^1250 \/ W^3 . $ <eq:smooth-derivative-bounds>]

]
] <lem:smooth-derivatives>

#proof[
  A uniform density on an interval of length $b_0 \/ 3$ has distributional derivative of total variation $6 \/ b_0$. Assigning at most three derivatives to distinct uniform factors in each sixfold convolution shows that every product-kernel derivative of total order $q lt.eq 3$ has total variation at most $6^q b_0^(- q)$. The remaining convolutions give continuous derivatives through order three. Every positive-order derivative has integral zero. Subtracting $I_G \( u \)$ inside its integral, and using (5.8), bounds each relative derivative of $tilde(I)_G$ of order $q = 1 \, 2 \, 3$ by
  $ 10^11 L_0 b_0^(1 - q) . $
  Here $e^(L_0 b_0) - 1 lt.eq 2 L_0 b_0$, and $tilde(I)_G \( u \) gt.eq e^(- L_0 b_0) I_G \( u \)$. The identities for derivatives of a logarithm give second derivatives bounded by a constant times $L_0 \/ b_0 + L_0^2$, and third derivatives bounded by a constant times $L_0 \/ b_0^2 + L_0^2 \/ b_0 + L_0^3$; the constants from the preceding display are absorbed by the powers in (5.16). For example $L_0 \/ b_0 = N^730 \/ W^2$ and $L_0 \/ b_0^2 = N^1130 \/ W^3$. Reflection of side-2 coordinates only changes derivative signs and conjugates the Hessian by a diagonal sign matrix. Thus the bounds and concavity hold in the count convention as claimed. ◻
]

#thm([Lemma 5.4.])[
  (Block signatures at every power).  #emph[For $0 lt.eq s lt.eq 1$, every block factor $F_G^s$ has both normalized positive-semidefinite tests of (3.8): $upright(bold(1)) upright(bold(1))^(sans(T)) - Q succ.curly.eq 0$, for additions and removals.]
] <lem:block-signatures>

#proof[
  Fix a display $b$ and a direction $sigma in { - 1 \, 1 }$. Initially allow repeated changes outside the box, where the defining positive formula still makes sense. The normalized entry for a factor $F$ is
  $ Q_(i j) = frac(F \( b \) F \( b + sigma e_i + sigma e_j \), F \( b + sigma e_i \) F \( b + sigma e_j \)) . $
  Ignore the last, absolute-value term of (5.12) for the moment. The finite difference of the smoothed logarithm integrates its Hessian along two unit segments. Comparing it with the Hessian at $b$ costs at most $4 A_3$ in every entry, also when $i = j$. The auxiliary quadratic has exact finite difference $- alpha upright(bold(1))_(i = j)$. Thus these two factors contribute
  $ exp \( s D_(i j) \) \, #h(2em) D_(i j) = g''_(i j) \( b \) - alpha upright(bold(1))_(i = j) + e_(i j) \, quad \| e_(i j) \| lt.eq 4 A_3 . $
  The imbalance Gaussian contributes $gamma = exp \( - 2 s \/ M^2 \)$ when $i \, j$ belong to the same nonroot component, and contributes one otherwise. Let $B$ be the matrix of these latter entries. Its complement is explicitly positive semidefinite:
  $ upright(bold(1)) upright(bold(1))^(sans(T)) - B = \( 1 - gamma \) sum_(C eq.not C_0 \( G \)) upright(bold(1))_C upright(bold(1))_C^(sans(T)) succ.curly.eq 0 \, $
  where $upright(bold(1))_C$ indicates the block coordinates incident to $C$.
  We next compare $Q = B compose exp \( s D \)$, with entrywise operations, to its linear approximation. The inequalities $1 - e^(- 2 s \/ M^2) lt.eq 2 s \/ M^2$ and $\| e^x - 1 - x \| lt.eq 2 x^2$ for $\| x \| lt.eq 1$ give
  #[#set math.equation(numbering: n => "(5.17)")
   $ upright(bold(1)) upright(bold(1))^(sans(T)) - Q = \( upright(bold(1)) upright(bold(1))^(sans(T)) - B \) - s g'' \( b \) + s alpha I + E \, #h(2em) \| E_(i j) \| lt.eq s cal(E) \, $ <eq:signature-error>]
  where one may take
  $ cal(E) = 10 A_3 + 100 \( A_2 + alpha + 4 A_3 \)^2 + 10 \( A_2 + alpha \) \/ M^2 . $
  More explicitly, the error entries in this identity are
  $ E_(i j) = - s B_(i j) e_(i j) + s \( 1 - B_(i j) \) \( g''_(i j) \( b \) - alpha upright(bold(1))_(i = j) \) - B_(i j) \( e^(s D_(i j)) - 1 - s D_(i j) \) . $
  All entries of $D$ have absolute value below one. The three terms are bounded respectively by $4 s A_3$, $2 s^2 \( A_2 + alpha \) \/ M^2$, and $2 s^2 \( A_2 + alpha + 4 A_3 \)^2$. Since $s^2 lt.eq s$, they give the displayed budget uniformly even for arbitrarily small positive $s$. There are at most $2 n$ block coordinates, so $lr(bar.v.double E bar.v.double)_(upright("op")) lt.eq 2 n s cal(E)$. The scale choices give
  $ frac(2 n cal(E), alpha) lt.eq N^4 (N^1350 / W + N^1700 / W^2 + N^(- 3100)) < 1 / 2 . $
  Both the first term on the right of (5.17) and $- s g'' \( b \)$ are positive semidefinite. The term $s alpha I$ therefore absorbs the error for every $s > 0$. At $s = 0$ the assertion is immediate.
  Finally the total imbalance in a block is the sum of all its count coordinates plus a constant. Put $v = sum_(C subset.eq G) t_C \( b \)$. Its absolute-value penalty multiplies every normalized entry by the same number
  $ beta = exp { - s H \( \| v + 2 sigma \| - 2 \| v + sigma \| + \| v \| \) } in \( 0 \, 1 \] . $
  Since $upright(bold(1)) upright(bold(1))^(sans(T)) - beta Q = \( 1 - beta \) upright(bold(1)) upright(bold(1))^(sans(T)) + beta \( upright(bold(1)) upright(bold(1))^(sans(T)) - Q \)$, the test persists. Discard unavailable single changes and set the diagonal to zero for invalid repeated changes. These operations take principal matrices and add a nonnegative diagonal to their complements, so they also preserve the test. ◻
]

#thm([Proposition 5.5.])[
  (The positive port model).  #emph[For every nonempty input after the deterministic feasibility test, the preceding construction gives at most $2 n$ paired ports of lengths $d_(i D) lt.eq N^21 W$, with $p = sum d_(i D)$ polynomial in $N$, and a strictly positive weight $h$ on the entire slice (5.15). For every real $s in \[ 0 \, 1 \]$, $h^s$ has both integer signatures of Definition 7. Its balanced mass 
$ cal(Z)_(upright("port")) = sum_(\( a \, b \) in cal(S)\
a_(i D) + b_(i D) = d_(i D) med forall \( i \, D \)) h \( a \, b \) $

 satisfies $\| log \( cal(Z)_(upright("port")) \/ \( J Z \) \) \| lt.eq 100 N^(- 7)$. These statements include $p = 0$, when there is a single profile.]
] <prop:port-model>

#proof[
  The balanced profiles are in bijection with the original integer port settings, and their weights are $w \( u \)$, so (5.14) proves the comparison. Positivity is explicit in the definitions. Lemma 9 applies to the rank factors, including the simultaneous reflection on side 1. Lemma 19 applies to every block factor. The coordinate groups of all these factors are disjoint; hence the full normalized complement is the direct sum of their normalized complements. The signature criterion in Section 3 proves the result. ◻
]

== 6 Evaluating the weights with bounded rational computation <sec:evaluation>

The block integrals in Section 5 are definitions of weights, not oracles supplied with the input. We now construct their evaluators. The central step expresses a close approximation to an exponential integral as the volume of a rational polytope. We check its separation oracle, encoding lengths, and inner and outer geometric guarantees. These checks also explain why a free-coordinate interval of length $R + 1$ causes only polynomial dependence on $log \( R + 1 \)$.

=== 6.1 Magnitude bounds before numerical approximation <magnitude-bounds-before-numerical-approximation>

#thm([Lemma 6.1.])[
  (Integral and point-weight bounds).  #emph[For every block and every port argument in its box, 
#[#set math.equation(numbering: n => "(6.1)")
 $ e^(- N^50000) lt.eq tilde(I)_G \( u \) lt.eq e^K . $ <eq:integral-bounds>]

 For the weight $h$ on the full paired slice of Proposition 20, 
#[#set math.equation(numbering: n => "(6.2)")
 $ \| log h \( a \, b \) \| lt.eq N^60000 . $ <eq:weight-log-bound>]

 All rational coefficients needed to define or evaluate its factors have polynomial encoding length in the input and in the query.]
] <lem:weight-bounds>

#proof[
  The integral’s upper bound is its free-box volume, $\( R + 1 \)^(\| cal(F)_G \|) lt.eq e^K$, since smoothing uses probability kernels. For the lower bound put $u_(i D)^c = c \( D \)$ and $z_e^c = c_e$ on free edges. The tree solve gives $X_1 = X_2 = c$, so the prefix-slack argument of Lemma 17 gives $V_G \( u^c \, z^c \) lt.eq 2 N^4 S$. For each free coordinate choose $z_e^(*) = max { c_e \, 1 \/ 4 }$. It lies in $\[ 0 \, R + 1 \]$ with at least $1 \/ 4$ clearance from its boundary and differs from $c_e$ by at most $1 \/ 4$. On the cube of sup radius $1 \/ 8$ about $z^(*)$, and for every smoothing displacement, the port and free-coordinate displacements from $\( u^c \, z^c \)$ are at most $N^21 W + b_0 + 1$. Therefore
  #[#set math.equation(numbering: n => "(6.3)")
   $ lambda V_G \( u - v \, z \) lt.eq 2 lambda N^4 S + L_0 \( N^21 W + b_0 + 1 \) < N^5000 . $ <eq:near-center-penalty>]
  Integrating over this cube and over the whole probability kernel gives $tilde(I)_G \( u \) gt.eq 4^(- \| cal(F)_G \|) e^(- N^5000) gt.eq e^(- N^50000)$. This proof includes $cal(F)_G = diameter$.
  For the rank factors, choose any common integral base $x^(*)$, which exists by the feasibility and integrality results of Section 2. Its projected totals $v_i^(*)$ satisfy the rank constraint and are within $N^10 W$ of the center totals by (5.1). For any nonnegative vector $v$ on a rank index set, its rank penalty is
  $ v \( E_r \) + r \( E_r \) - 2 m_r \( v \) = max_(A subset.eq E_r) { v \( A \) - v \( E_r \\ A \) + r \( E_r \) - 2 r \( A \) } . $
  Every affine function on the right has coordinate slopes $plus.minus 1$. Thus this penalty is 1-Lipschitz in the $1$-norm. It vanishes at $v_i^(*)$, so throughout a port box it is at most $N^23 W$, independently of the numerical value of $R$. Multiplication by $H$ still gives a fixed power of $N$. For each component, $t_C$ vanishes at the center and has absolute value at most $N^23 W$ throughout the boxes. Consequently all Gaussian and absolute-value exponents in (5.12) have absolute value bounded by fixed powers below $N^40000$; the auxiliary quadratic is smaller than one. Summing these bounds and (6.1) over at most $n$ blocks proves (6.2).
  The center, endpoints, scales, and tree coefficients have polynomial encoding length. Ranks of unions and contracted ranks require ordinary rank queries. For the minima defining $m_r$ and the maxima defining $V_G$, rational modular terms are handled by clearing their common denominator and applying Proposition 2. The binary length of that denominator is at most the sum of the individual denominator lengths. Thus the size parameter is polynomial in bits; no bound on its numerical value is needed. ◻
]

=== 6.2 A rational volume problem <a-rational-volume-problem>

We use the following form of the classical randomized volume theorem #cite(label("DFK1991")) #cite(label("DyerFrieze1991")). In dimension $d$, a full-dimensional rational polytope supplied by strong separation, a polynomial bound on each inequality’s encoding length, and rational inner and outer ball guarantees admits a relative volume approximation with success probability at least $3 \/ 4$. Its oracle and bit complexity is polynomial in $d$, these encoding lengths, and the reciprocal error. The radii enter through their binary lengths. We use the finite-precision volume algorithm in the rational oracle model of #cite(label("DyerFrieze1991")) Section 2. Its polynomial random-bit bound is recorded in #cite(label("DyerFrieze1991")) Section 6; finite-grid sampling within cubes and its error analysis appear in #cite(label("DFK1991")) algorithm Step 2 and its finite-grid error analysis. Finite uniform integer choices can be generated from unbiased bits by rejection using fewer than two expected trials. The resulting expected polynomial bound includes bit operations, rational arithmetic, and oracle calls; we cap and amplify this procedure below. Strong separation supplies the weak membership required in the volume theorem.

We first round each volume input by a rational change of coordinates. Apply Lemma 6 to the full-dimensional polytope and send its returned simplex vertices to $0 \, e_1 \, dots.h \, e_d$. The image contains the standard simplex and lies in $\[ - 2 \, 2 \]^d$, because its nonconstant barycentric coordinates have absolute value at most two. The standard simplex contains a Euclidean ball about its barycenter of radius at least $\( d + 1 \)^(- 2)$. Translating that barycenter to zero and scaling by $\( d + 1 \)^2$ therefore give an inner unit ball and an outer ball of polynomial radius. The affine map, its determinant, and the inverse images of rational separation queries have polynomial encoding length. Correcting the returned volume by the determinant is exact rational arithmetic. The required optimization uses the rational separation theorem #cite(label("GLS1988")), through Proposition 2. This supplies a rounded input even when the original geometric aspect ratio is numerically large.

Fix a block and a rational port vector $u$ in its box. Let $m$ be the number of its port arguments, including fixed length-zero ports, and $f = \| cal(F)_G \|$ its number of free variables. Length-zero ports are omitted only from the count slice; they remain arguments of the smoothing convolution. Replace its $6 m$ uniform variables by $q_(j a) in \[ 0 \, 1 \]$, putting

$ v_j \( q \) = b_0 / 3 sum_(a = 1)^6 \( q_(j a) - 1 \/ 2 \) \, #h(2em) cal(B) = \[ 0 \, R + 1 \]^f times \[ 0 \, 1 \]^(6 m) \, #h(2em) D \( z \, q \) = lambda V_G \( u - v \( q \) \, z \) . $

The normalized uniform density has been absorbed by this unit-interval parametrization, so there is no further Jacobian factor:

#[#set math.equation(numbering: n => "(6.4)")
 $ tilde(I)_G \( u \) = integral_(cal(B)) e^(- D \( x \)) thin upright(d) x \, #h(2em) x = \( z \, q \) . $ <eq:exponential-box-integral>]

Here $D$ is nonnegative, convex, and piecewise affine. Its value and an attaining affine piece can be computed exactly at rational points: submodular minimization returns a maximizing subset for each of the two maxima in $V_G$, and their sum is such a piece.

For $0 < rho < 1$, define

#[#set math.equation(numbering: n => "(6.5)")
 $ E_0 = N^51000 + ceil.l log_2 \( 100 \/ rho \) ceil.r \, #h(2em) d_0 = ceil.l 1000 E_0^2 \/ rho ceil.r . $ <eq:volume-lift-scales>]

The ceiling of the logarithm can be found by integer comparisons of powers of two, without numerical logarithms. Consider the polytope

#[#set math.equation(numbering: n => "(6.6)")
 $ cal(Q) = { \( x \, y \) : x in cal(B) \, med y in bb(R)_(gt.eq 0)^(d_0) \, quad D \( x \) + d_0 y_a lt.eq d_0 med \( 1 lt.eq a lt.eq d_0 \) } . $ <eq:volume-lift>]

Each inequality involving $D$ means all the affine-piece inequalities in its finite maximum representation. This makes $cal(Q)$ a convex rational polytope, although its inequalities are not enumerated. Integrating over its $y$-fiber gives the exact identity

#[#set math.equation(numbering: n => "(6.7)")
 $ "vol" \( cal(Q) \) = integral_(cal(B)) \( 1 - D \( x \) \/ d_0 \)_(+)^(d_0) thin upright(d) x . $ <eq:fiber-volume>]

#thm([Lemma 6.2.])[
  (Accuracy and guarantees for the volume lift).  #emph[The polytope (6.6) has dimension $f + 6 m + d_0$, a polynomial facet-encoding bound, and an exact polynomial-time strong separation oracle. It contains a known rational ball of radius $1 \/ 32$ and has an outer ball of polynomial encoding length. Furthermore, 
#[#set math.equation(numbering: n => "(6.8)")
 $ \( 1 - rho \/ 10 \) tilde(I)_G \( u \) lt.eq "vol" \( cal(Q) \) lt.eq tilde(I)_G \( u \) . $ <eq:volume-lift-accuracy>]

 All polynomial bounds are in the original input length, the encoding lengths of $u$ and $rho$, $N$, and $rho^(- 1)$, with absolute fixed exponents.]
] <lem:volume-lift>

#proof[
  The pointwise upper inequality follows from $1 - t lt.eq e^(- t)$. For $0 lt.eq D lt.eq E_0$, expansion of $- log \( 1 - t \)$, or integration of its derivative, gives
  $ 0 lt.eq - d_0 log \( 1 - D \/ d_0 \) - D lt.eq frac(D^2, 2 d_0 \( 1 - D \/ d_0 \)) < rho \/ 100 . $
  The part of (6.4) where $D > E_0$ has integral at most $e^(K - E_0)$. Dividing by the lower bound in (6.1) makes its relative contribution at most
  $ exp \( K + N^50000 - E_0 \) < rho \/ 100 . $
  These two errors prove (6.8).
  For separation, first test the box inequalities and $y gt.eq 0$. Compute $D \( x \)$ and choose an index $a$ with largest $y_a$. If $D \( x \) + d_0 y_a > d_0$, the attaining affine piece of $D$ gives a rational hyperplane separating the point from $cal(Q)$. Otherwise all inequalities hold. The coefficient bounds follow from the integral tree map, the rank-answer bit bound, the rational scales, and the input port encodings. At a rational query, clearing denominators for the two submodular minimizations takes polynomial bit work as in Lemma 21. Each inequality, rather than the number of possible subsets, is the encoding parameter.
  For the inner ball choose
  $ x^(*) = \( z^(*) \, q^(*) \) \, #h(2em) z_e^(*) = max { c_e \, 1 \/ 4 } \, #h(2em) q_(j a)^(*) = 1 \/ 2 \, #h(2em) y_a^(*) = 1 \/ 4 . $
  All box coordinates have clearance at least $1 \/ 4$. A Euclidean perturbation of radius $1 \/ 32$ changes each free coordinate by at most $1 \/ 32$ and each $v_j$ by at most $2 b_0 \/ 32$. By (5.8) its change in $D$ is at most $L_0 max { 1 \, 2 b_0 } \/ 32 < 1$. The near-center estimate (6.3) therefore gives $D < N^5000 + 1 < d_0 \/ 2$ throughout this ball. Also $0 < y_a lt.eq 9 \/ 32$, so $D + d_0 y_a < 25 d_0 \/ 32 < d_0$. This proves the inner guarantee, including $f = 0$. Every point of $cal(Q)$ has $x in cal(B)$ and $0 lt.eq y_a lt.eq 1$. If $d = f + 6 m + d_0$, the ball centered at the origin with rational radius $d \( R + 2 \)$ is therefore an outer ball. Its binary encoding length is polynomial.
  Finally, the numerical value of $d_0$ is polynomial in $N$ and $rho^(- 1)$: the exponents in (6.5) are fixed. Thus even its explicitly added coordinates can be written and processed within one fixed polynomial bound. The original capacity appears only in the box endpoint $R + 1$ and the encoding lengths just verified. ◻
]

=== 6.3 Positive rational outputs and deterministic caps <positive-rational-outputs-and-deterministic-caps>

#thm([Proposition 6.3.])[
  (A bounded weight evaluator).  #emph[Given a profile in the entire slice $cal(S)$, rational $0 < rho \, beta < 1$, and a rational power $s in \[ 0 \, 1 \]$ with denominator $q_s$, there is an evaluator using fresh random bits and returning a strictly positive rational $hat(h)_s$ such that 
$ bb(P) #scale(x: 120%, y: 120%)[\[] \( 1 - rho \) h^s lt.eq hat(h)_s lt.eq \( 1 + rho \) h^s #scale(x: 120%, y: 120%)[\]] gt.eq 1 - beta . $

 Its output length, number of rank queries, and other bit operations are bounded on every execution by fixed polynomials in $N$, the input encoding lengths, $rho^(- 1)$, $log \( beta^(- 1) \)$, and $q_s$. In particular an equally spaced schedule with a polynomial number of phases has polynomially bounded denominators. Moreover $J$ admits a deterministic positive rational approximation $hat(J)$ with $\| log \( hat(J) \/ J \) \| lt.eq N^(- 7)$ in polynomial work.]
] <prop:weight-evaluator>

#proof[
  First evaluate a single smoothed block integral. Round $cal(Q)$ by the rational affine construction above, apply the volume theorem with relative error $rho \/ 10$, and restore the exact determinant factor. Use the same parameter $rho$ in (6.5). By Lemma 22, its successful output is a relative $rho \/ 2$ approximation to $tilde(I)_G$.
  For completeness, all resource bounds here are bounds on actual finite-bit executions. Let $B$ be a furnished polynomial upper bound on the expected combined number of bit operations and oracle calls of one volume run, including the cost of its separation queries. If the chosen version already has a deterministic bound, use that bound instead. Interrupt the run after $16 B$ operations; Markov’s inequality increases the failure probability by at most $1 \/ 16$. The resulting success probability is at least $11 \/ 16$. On interruption, a declared failure (including a zero denominator), or an invalid or nonpositive output, substitute a fixed positive rational. Repeat independently $O \( 1 + log beta^(- 1) \)$ times and take the median. The binomial tail bound gives failure probability at most $beta$. Cap construction, query lengths, arithmetic, and random-bit generation are all included. Clip each output to
  $ \[ 2^(- 2 N^50000) \, med 2^(2 N^50000) \] . $
  This interval has polynomial-bit endpoints and strictly contains all successful relative approximations from (6.1). Clipping therefore retains the success guarantee and ensures bounded positive outputs even on failed or interrupted runs.
  Evaluate all rank penalties and the other rational exponents exactly, and allocate relative error $rho \/ \( 100 \( n + 1 \) \)$ and failure allowance $beta \/ \( n + 1 \)$ to each of the at most $n$ block integrals. Evaluate the remaining exponentials and all rational arithmetic to another $rho \/ \( 100 \( n + 1 \) \)$ relative error per factor. The log bounds in Lemma 21 ensure that these relative accuracies require only polynomial absolute precision. One elementary implementation uses the exponential Taylor series and factorial tail bounds: an exponent of magnitude at most $D_(*)$ and absolute precision $2^(- k)$ require polynomially many terms and bits in $D_(*) + k + 1$. Negative exponents can be evaluated by inversion of a positive exponential approximation. Here $D_(*)$ is a fixed polynomial in $N$, not in $R$.
  Multiplying the factors gives a positive relative approximation to $h$. Before taking any power, clip this product to $\[ 2^(- 3 N^60000) \, 2^(3 N^60000) \]$. This interval contains $h$ by (6.2), so clipping cannot increase its relative error; it also gives valid bisection bounds even after failed block evaluations. On the simultaneous success event the sum of the factor logarithmic errors is below $rho \/ 10$, after reducing the indicated constants if necessary. To obtain $h^s$ for $s = a_s \/ q_s$, apply bisection to the $q_s$th root and integer powering to $a_s$, with positive rational endpoints whose binary exponents are bounded by $3 N^60000$. Each comparison is an integer-power comparison, and $a_s lt.eq q_s$; the number of bisections, lengths of operands, and bit work are polynomial in $q_s$, $N$, and $log rho^(- 1)$. Taking a power in $\[ 0 \, 1 \]$ cannot increase the preceding logarithmic error. Approximate the root to logarithmic error at most $rho \/ \[ 100 \( q_s + 1 \) \]$ before taking the $a_s$th power; the resulting additional logarithmic error is at most $rho \/ 100$. This proves the required relative bound. For $s = 0$ return one exactly. All steps have prescribed finite bounds; clipping the final output to $\[ 2^(- 3 N^60000) \, 2^(3 N^60000) \]$ gives the same positivity and encoding guarantee on every failure event. This proves the asserted evaluator without conditioning any future computation on its success.
  To approximate $J$, let $k$ be the number of nonroot components, so
  $ J = (sum_(j in bb(Z)) e^(- j^2 \/ M^2))^k \, #h(2em) 0 lt.eq k lt.eq n . $
  For $k = 0$ return one. Otherwise truncate at the integer $B_J = M N^10$, a polynomial in $N$. The omitted two-sided tail is at most
  $ 2 integral_(B_J)^oo e^(- x^2 \/ M^2) thin upright(d) x lt.eq M^2 / B_J e^(- B_J^2 \/ M^2) = M N^(- 10) e^(- N^20) . $
  The sum is at least one. Approximate each of its $2 B_J + 1$ retained terms to absolute error at most $N^(- 7) \/ \[ 100 \( n + 1 \) \( 2 B_J + 1 \) \]$, keeping the term at zero exactly one and the remaining terms nonnegative. The elementary exponential procedure above is bounded since each exponent has magnitude at most $N^20$. Adding the terms and raising to the integer power $k$ gives a positive rational result whose logarithmic error is below $N^(- 7)$. No random choices or numerical grid of length $R$ occurs. ◻
]

== 7 Counting the balanced port profiles <sec:counting>

The port model of Proposition 20 and the evaluator of Proposition 23 give a sum of positive weights on polynomially short ranges whose individual terms we can approximate. We now approximate the entire sum. The factorial encoding below is essential: its transversals have exactly the mass of the unlabelled port profiles. The two resulting binary weights allow us to use the transport and trace estimates of the common-base framework, in the two-weight form proved in #cite(label("CB")).

Write $cal(P)$ for the positive-length ports and $d_v$ for the length of port $v in cal(P)$. Thus $p = sum_v d_v$, and the weight $h$ of Proposition 20 is positive on the entire slice

$ cal(B)_p = {\( a \, b \) : 0 lt.eq a_v \, b_v lt.eq d_v \, quad sum_v \( a_v + b_v \) = p} . $

All count coordinates in this section are integers. The quantity to be estimated is

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(Z)_(upright("port")) = sum_(\( a \, b \) in cal(B)_p\
a_v + b_v = d_v med \( v in cal(P) \)) h \( a \, b \) \, #h(2em) lr(|log frac(cal(Z)_(upright("port")), J Z)|) lt.eq 100 N^(- 7) . $ <eq:counting-target>]

Length-zero ports have already been fixed in $h$. If $p = 0$, the sum has one term; we evaluate it directly at the end of the proof. Until then assume $p gt.eq 1$.

=== 7.1 Two factorial weights and their signatures <two-factorial-weights-and-their-signatures>

For every port $v$, introduce $d_v$ labelled pairs, each containing an $a$-element and a $b$-element. Let $cal(E)$ be this ground set of $2 p$ elements and number its pairs $1 \, dots.h \, p$. For every $p$-subset $S subset.eq cal(E)$, its counts $\( a \( S \) \, b \( S \) \)$ belong to $cal(B)_p$. Given a positive count weight $k$ on this slice, define

#[#set math.equation(numbering: n => "(7.2)")
 $ f \( S \) = k \( a \, b \) product_(v in cal(P)) frac(a_v ! b_v !, d_v !) \, #h(2em) tilde(f) \( S \) = k \( a \, b \) product_(v in cal(P)) frac(\( d_v - a_v \) ! \( d_v - b_v \) !, d_v !) . $ <eq:counting-lifts>]

Both weights are defined and positive on #emph[every] $p$-subset, including subsets with several empty or full pairs.

Let $cal(A)$ consist of the transversals, which select exactly one element from each pair. For distinct labels $i \, l$, let $cal(A)_(i l)$ consist of the subsets with pair $i$ empty, pair $l$ full, and every other pair singly occupied. On a transversal the two factors in (7.2) coincide and equal $product_v binom(d_v, a_v)^(- 1)$. Exactly $product_v binom(d_v, a_v)$ transversals realize any balanced profile. Consequently

#[#set math.equation(numbering: n => "(7.3)")
 $ C := sum_(S in cal(A)) f \( S \) = sum_(S in cal(A)) tilde(f) \( S \) = sum_(a + b = d) k \( a \, b \) . $ <eq:counting-multiplicity>]

This identity concerns transversals, rather than all subsets with the same coordinate counts.

For a positive weight on all $r$-subsets of a finite set, the #emph[addition property] means that, after any $r - 2$ elements have been fixed included, the matrix of weights obtained by adding two distinct further elements, with zero diagonal, has at most one positive eigenvalue. It is vacuous for $r < 2$. The #emph[omission property] is the addition property of the complement-set weight.

#thm([Lemma 7.1.])[
  #emph[If $k$ has both integer signatures of Definition 7, then $f$ has the omission property and $tilde(f)$ has the addition property. Both properties persist under fixing included or excluded elements and summing disjoint labelled pairs at occupancy one, on each resulting full valid-degree domain. Moreover, with $q = \( p + 1 \)^2$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ q^(- 1) f \( S \) lt.eq tilde(f) \( S \) lt.eq q f \( S \) quad (S in cal(A) union union.big_(i eq.not l) cal(A)_(i l)) . $ <eq:counting-comparison>]

]
] <lem:counting-lifts>

#proof[
  We give the factorial cancellation in #cite(label("CB")) Lemma 4.2, “Signatures of the two lifts”, since it also explains the roles of the two weights. In an omission test for $f$, the display has $p + 2$ elements. Group these by count coordinate and let $n_u$ be the number in group $u$. On the subspace of vectors constant within each group, the ordered-copy multiplicities $n_u n_w$ for $u eq.not w$ and $n_u \( n_u - 1 \)$ for $u = w$ cancel the factorial reductions from removing two elements. The quadratic form becomes
  $ frac(product_u n_u !, product_v d_v !) sum_(u \, w) k \( n - e_u - e_w \) t_u t_w \, $
  where invalid removals contribute zero. Its positive index is at most one by the integer removal signature. Vectors summing to zero within each group have nonpositive quadratic form and are orthogonal for this form to the group-constant subspace: within a group the matrix has constant nonnegative off-diagonal entries and zero diagonal. This proves the omission assertion. For $tilde(f)$, group the elements available after fixing $p - 2$ inclusions. The remaining-capacity factorials cancel the same multiplicities, leaving a positive multiple of the integer addition matrix. This proves the addition assertion. The closure assertions are precisely #cite(label("CB")) Lemma 4.1, “Binary contractions”; their hypothesis of positivity on the full domain has been checked here.
  For the comparison, if the empty and full pair are in the same port, all ports remain balanced and the ratio is one. Otherwise the port containing the hole has $a + b = d - 1$, and contributes $\( a + 1 \) \( b + 1 \)$ to $tilde(f) \/ f$. The port containing the full pair has $a + b = d + 1$ and contributes $1 \/ \( a b \)$. Both positive integer products lie between $1$ and $\( p + 1 \)^2$. Their quotient proves (7.4). ◻
]

=== 7.2 The transport input and the chain it controls <the-transport-input-and-the-chain-it-controls>

We state the precise consequence of the companion transport argument that will be used. This isolates the long transport proof from the algorithm and makes its hypotheses available for verification. Fix $f \, tilde(f)$ as above and put $c_(i l) = sum_(S in cal(A)_(i l)) f \( S \)$. These numbers are positive. For positive multipliers $w_(i l)$ define, on $cal(X) = cal(A) union union.big_(i eq.not l) cal(A)_(i l)$,

$ lambda \( S \) = cases(delim: "{", f \( S \) \, & S in cal(A) \,, w_(i l) f \( S \) \, & S in cal(A)_(i l) \,) quad Lambda = sum_(S in cal(X)) lambda \( S \) \, quad pi \( S \) = lambda \( S \) \/ Lambda \, quad mu \( S \) = f \( S \) \/ C quad \( S in cal(A) \) . $

Call the multipliers #emph[good] when

#[#set math.equation(numbering: n => "(7.5)")
 $ frac(C, 4 c_(i l)) lt.eq w_(i l) lt.eq frac(4 C, c_(i l)) #h(2em) \( i eq.not l \) . $ <eq:counting-good>]

In this case

#[#set math.equation(numbering: n => "(7.6)")
 $ Lambda lt.eq 5 p^2 C \, #h(2em) pi \( cal(A) \) gt.eq \( 5 p^2 \)^(- 1) \, #h(2em) pi \( cal(A)_(i l) \) gt.eq \( 20 p^2 \)^(- 1) . $ <eq:counting-type-mass>]

The chain holds with probability $1 \/ 2$. Otherwise it chooses independently a uniform element of $S$ and a uniform element of $cal(E) \\ S$, and proposes their exchange. A proposal outside $cal(X)$ is rejected; a proposal $S' in cal(X)$ is accepted with probability $min \( 1 \, lambda \( S' \) \/ lambda \( S \) \)$. Write $P$ for this kernel. A defect state can reach a transversal by moving an element of its full pair to its empty pair, and transversals are connected by flips within pairs. Thus positivity makes $P$ irreducible. It is lazy and reversible, with Dirichlet form

#[#set math.equation(numbering: n => "(7.7)")
 $ cal(E)_P \( g \) = chevron.l g \, \( I - P \) g chevron.r_pi = frac(frak(D) \( g \), 2 p^2 Lambda) \, #h(2em) frak(D) \( g \) = sum_({ S \, S' }) min \( lambda \( S \) \, lambda \( S' \) \) \( g \( S \) - g \( S' \) \)^2 \, $ <eq:counting-energy>]

where the sum is over unordered exchange edges. Let $cal(Q) g$ agree with $g$ at each transversal and replace its values on each defect class by their conditional $pi$-mean.

#thm([Proposition 7.2.])[
  (Companion transport and simulation input).  #emph[Suppose $f$ is positive on all $p$-subsets and has the omission property, $tilde(f)$ is positive on that domain and has the addition property, the weights agree on $cal(A)$, and (7.4) holds with $q gt.eq 1$. For good multipliers put 
#[#set math.equation(numbering: n => "(7.8)")
 $ C_(upright(p)) = p \( 1 + 8 p q^2 \) \, #h(2em) C_(upright(d)) = 8 + 32 p q^3 \, #h(2em) K_(upright("obs")) = 10 p^4 \( 9 C_(upright(p)) + 2 C_(upright(d)) \) . $ <eq:counting-constants>]

 Then for every real function $g$ on $cal(X)$, 
#[#set math.equation(numbering: n => "(7.9)")
 $ C "Var"_mu \( g \) lt.eq C_(upright(p)) frak(D) \( g \) \, #h(2em) "Var"_pi \( cal(Q) g \) lt.eq \( 9 C_(upright(p)) + 2 C_(upright(d)) \) frac(frak(D) \( g \), C) lt.eq K_(upright("obs")) cal(E)_P \( g \) . $ <eq:counting-variance>]

 If $cal(Q) G = G$ and an initial law satisfies $nu lt.eq D pi$ pointwise, then $m gt.eq 1$ consecutive observations satisfy 
#[#set math.equation(numbering: n => "(7.10)")
 $ bb(E)_nu [(m^(- 1) sum_(t = 0)^(m - 1) G \( S_t \) - bb(E)_pi G)^2] lt.eq frac(2 D K_(upright("obs")), m) "Var"_pi \( G \) . $ <eq:counting-time-average>]

 The trace on $cal(A)$, counting every strictly positive return as one step, is lazy and reversible with stationary law $mu$ and inverse spectral gap at most $2 p^2 C_(upright(p)) lt.eq K_(upright("obs"))$. In particular, 
#[#set math.equation(numbering: n => "(7.11)")
 $ lr(|frac(P_(upright("tr"))^t \( x \, y \), mu \( y \)) - 1|) lt.eq mu_min^(- 1) exp \( - t \/ K_(upright("obs")) \) . $ <eq:counting-trace-mixing>]

 If a trace starts from $nu lt.eq D mu$, the expected cost of $t$ trace steps in underlying transitions is at most $t D \/ pi \( cal(A) \)$; at each deterministic trace index its law is still at most $D mu$.]
] <prop:counting-transport>

#proof[
  #emph[Source and applicability.] These are #cite(label("CB")) Propositions 5.2 and 5.4 and Lemmas 5.5–5.6, with $q$ left as the comparison parameter in their proofs. Their structural inputs are Lemma 5.1 (one-hole transport) and Lemma 4.4 (pair inequalities for defect masses). We spell out why the stated hypotheses are the complete interface. For a partial transversal assignment $sigma$, let $z_sigma$ be its transversal mass and let $tilde(c)_(i l)^sigma$ be the mass of its extensions in $cal(A)_(i l)$ under $tilde(f)$. Binary contraction, including the full-index cubic contraction clause of #cite(label("CB")) Lemma 4.1, and the addition property give
  $ 4 tilde(c)_(i l)^sigma tilde(c)_(l i)^sigma lt.eq z_sigma^2 \, #h(2em) tilde(c)_(i l)^sigma tilde(c)_(l k)^sigma lt.eq z_sigma tilde(c)_(i k)^sigma quad \( i \, l \, k upright(" distinct and unassigned") \) . $
  Agreement on transversals identifies $z_sigma$ for the two weights. The omission property supplies one-hole transport for $f$, including its auxiliary displays outside $cal(X)$; this is why positivity and the signature were required on all $p$-subsets. Comparison on actual defect classes costs $q^2$ in the transversal variance bound and $q^3$ in the defect-mean bound, giving exactly $C_(upright(p)) \, C_(upright(d))$ above. The remaining observable and trace arguments use only these inequalities, reversibility, and laziness. They impose no condition on the origin of the count weight. This is the two-lift version of the transport, observable-Poincare, and trace-restart framework of #cite(label("Parent")) Sections 4–6. ◻
]

=== 7.3 Power annealing and exact initialization <power-annealing-and-exact-initialization>

Lemma 21 gives $\| log h \| lt.eq N^60000$, and Proposition 20 gives both integer signatures for $h^s$ at every $0 lt.eq s lt.eq 1$. Choose

#[#set math.equation(numbering: n => "(7.12)")
 $ U = N^61000 \, #h(2em) H_o = 10 U \, #h(2em) k_j = \( 2^(- U) h \)^(j \/ H_o) quad \( 0 lt.eq j lt.eq H_o \) \, #h(2em) K_o = 10 \( p + U + 1 \) . $ <eq:counting-schedule>]

Apply (7.2) to $k_j$, obtaining $f_j \, tilde(f)_j$, and denote their transversal and defect masses by $C_j \, c_(i l) \( j \)$. Lemma 24 verifies every structural hypothesis of Proposition 25 at every phase, with $q = \( p + 1 \)^2$. In particular

#[#set math.equation(numbering: n => "(7.13)")
 $ C_(H_o) = 2^(- U) cal(Z)_(upright("port")) . $ <eq:counting-final-scale>]

#thm([Lemma 7.3.])[
  (Initialization and adjacent phases).  #emph[For every $p$-subset and $0 lt.eq j < H_o$, 
#[#set math.equation(numbering: n => "(7.14)")
 $ 1 / 2 lt.eq frac(f_(j + 1) \( S \), f_j \( S \)) lt.eq 1 . $ <eq:counting-adjacent>]

 Thus $C_j \/ c_(i l) \( j \)$ changes by a factor in $\[ 1 \/ 2 \, 2 \]$ between consecutive phases, and $mu_j = f_j \/ C_j$ on $cal(A)$ satisfies $mu_j lt.eq 2 mu_(j + 1)$. Moreover 
#[#set math.equation(numbering: n => "(7.15)")
 $ min_(S in cal(A)) mu_j \( S \) gt.eq 2^(- \( H_o + p + K_o \)) . $ <eq:counting-minimum>]

 The initial masses are exact rational numbers computable in polynomial bit time, and $mu_0$ can be sampled by independent uniform port counts followed by uniform subsets of the pairs realizing those counts.]
] <lem:counting-initialization>

#proof[
  The logarithm of $2^(- U) h$ lies between $- U log 2 - N^60000$ and $- U log 2 + N^60000 < 0$. Dividing by $H_o = 10 U$ proves (7.14). Summing that bound within each type proves the multiplier comparison and domination. On a transversal the factorial factor is at least $2^(- p)$, while $k_j gt.eq 2^(- H_o)$. Also
  $ C_j lt.eq C_0 = product_(v in cal(P)) \( d_v + 1 \) lt.eq 2^p lt.eq 2^(K_o) \, $
  which proves (7.15).
  Here are explicit formulas for the initializer, as in #cite(label("CB")) Lemma 7.1, “Exact initialization”. Fix $i eq.not l$. For each port put
  $ u_v = upright(bold(1))_({ i upright(" lies in ") v }) \, quad v_v = upright(bold(1))_({ l upright(" lies in ") v }) \, quad m_v = d_v - u_v - v_v . $
  There are $m_v$ singly occupied pairs left in this port, so
  #[#set math.equation(numbering: n => "(7.16)")
   $ c_(i l) \( 0 \) = product_(v in cal(P)) [frac(1, d_v !) sum_(k = 0)^(m_v) binom(m_v, k) \( k + v_v \) ! \( m_v - k + v_v \) !] . $ <eq:counting-initial-defect>]
  All factorial arguments are at most $p$. If $i \, l$ are in the same port, that port has at least two pairs, so $m_v gt.eq 0$ also in this case. Each bracket equals, respectively, $d_v + 1$, $1$, $\( d_v + 1 \) \( d_v + 2 \) \/ 6$, or $\( d_v + 1 \) \/ 6$ according as the port contains neither designated pair, only $i$, only $l$, or both. Writing $v \( i \)$ for the port containing pair $i$, we can therefore use the particularly simple exact initial multipliers
  #[#set math.equation(numbering: n => "(7.17)")
   $ w_(i l)^(\( 0 \)) = frac(C_0, c_(i l) \( 0 \)) = cases(delim: "{", 6 \, & v \( i \) = v \( l \) \,, frac(6 \( d_(v \( i \)) + 1 \), d_(v \( l \)) + 2) \, & v \( i \) eq.not v \( l \) .) $ <eq:counting-initial-multipliers>]
  The finite sums or these simplified expressions give polynomial bit bounds, including all $p \( p - 1 \)$ initial multipliers. Finally choose $a_v$ uniformly from ${ 0 \, dots.h \, d_v }$ and choose a uniform $a_v$-subset of that port’s pairs to use their $a$-elements. The probability of a particular transversal is $product_v \[ \( d_v + 1 \) binom(d_v, a_v) \]^(- 1) = f_0 \( S \) \/ C_0$. ◻
]

=== 7.4 Capped restarts and ratio estimates <capped-restarts-and-ratio-estimates>

The next experiment uses exact real transition probabilities only for its analysis. Its finite implementation follows in the next subsection. Use (7.8) with $q = \( p + 1 \)^2$ and choose

#[#set math.equation(numbering: n => "(7.18)")
 $ epsilon_0 & = epsilon \/ 100 \, & eta & = frac(epsilon_0, 200 \( H_o + 1 \)) \,\
tau & = 2 K_(upright("obs")) \( H_o + p + K_o + 5 \) \, & B_(upright("ret")) & = 2000 p^2 \( H_o + 1 \)^2 tau \,\
N_(upright("av")) & = ⌈frac(10^8 p^8 K_(upright("obs")) \( H_o + 1 \), eta^2)⌉ . $ <eq:counting-caps>]

These are integers except for the tolerances. We write $P_(j \, w)$ for the chain at phase $j$ and multiplier collection $w$. Starting with (7.17), perform the following operations for $j = 0 \, dots.h \, H_o - 1$.

+ Draw a fresh transversal from $mu_0$. For $a = 1 \, dots.h \, j$, run $tau$ trace steps of $P_(a \, w^(\( a \)))$, continuing from the transversal reached at the preceding stage. Each trace step ends at the next transversal after at least one underlying transition; holding at a transversal counts as a return. Allow at most $B_(upright("ret"))$ underlying transitions across the entire restart. If another is needed, abort and return zero. When $j = 0$ the fresh $mu_0$ draw itself is the restart endpoint.
+ From that endpoint take $N_(upright("av"))$ consecutive observations of $P_(j \, w^(\( j \)))$, including the initial state. Label the transversal type by $0$ and the other types by $i l$. Let $n_T$ be the number of observations of type $T$, and set $hat(p)_T = n_T \/ N_(upright("av"))$. Also compute the empirical mean $hat(u)_j$ of
  $ G_j \( S \) = upright(bold(1))_(cal(A)) \( S \) frac(f_(j + 1) \( S \), f_j \( S \)) . $
  If any type count is zero, abort and return zero.
+ Set $hat(R)_j = hat(u)_j \/ hat(p)_0$ and, if $j + 1 < H_o$, store the exact rational updates
  #[#set math.equation(numbering: n => "(7.19)")
   $ w_(i l)^(\( j + 1 \)) = w_(i l)^(\( j \)) n_0 / n_(i l) . $ <eq:counting-update>]

All randomness in a phase, including its initial sample, is fresh. If no abort occurs, return $Y_(upright("ref")) = C_0 product_(j = 0)^(H_o - 1) hat(R)_j$. The multipliers in a restart have already been stored by earlier phases.

#thm([Proposition 7.4.])[
  #emph[With probability at least $1 - 1 \/ 50$, this experiment does not abort, every stored multiplier collection is good at its own phase, and 
#[#set math.equation(numbering: n => "(7.20)")
 $ lr(|log Y_(upright("ref")) / C_(H_o)|) lt.eq 4 H_o eta . $ <eq:counting-reference-error>]

]
] <prop:counting-reference>

#proof[
  This is the reference experiment of #cite(label("CB")) Section 7.2 and Proposition 7.2. We include its probabilistic argument to specify the treatment of the restart caps. Fix a history of successful phases before $j$. Its stored multipliers are now fixed and good. For this one phase, consider a virtual restart that ignores the transition cap, followed by its observation trajectory. At any trace stage $a$, (7.15) and (7.11) bound the pointwise relative error after $tau$ steps by
  $ 2^(H_o + p + K_o) exp \( - 2 \( H_o + p + K_o + 5 \) \) < 1 . $
  The endpoint law is thus at most $2 mu_a$. Stage one starts at $mu_0 lt.eq 2 mu_1$, and each later stage starts at a law bounded by $2 mu_(a - 1) lt.eq 4 mu_a$. Trace stationarity preserves the bound $4 mu_a$ at every deterministic trace index in that stage. By the return-cost assertion and (7.6), each such trace step has expected cost at most $20 p^2$. There are at most $H_o tau$ trace steps in a restart. Markov’s inequality therefore bounds its cap-failure probability by
  #[#set math.equation(numbering: n => "(7.21)")
   $ frac(20 p^2 H_o tau, B_(upright("ret"))) lt.eq frac(1, 100 \( H_o + 1 \)) . $ <eq:counting-cap-error>]
  The virtual endpoint has law at most $2 mu_j$, hence at most $10 p^2 pi_(j \, w^(\( j \)))$ on $cal(X)$. Under this stationary law, write $p_T$ for the type probabilities and $u_j = bb(E)_pi G_j$. Direct summation gives
  #[#set math.equation(numbering: n => "(7.22)")
   $ u_j / p_0 = C_(j + 1) / C_j \, #h(2em) w_(i l)^(\( j \)) p_0 / p_(i l) = frac(C_j, c_(i l) \( j \)) . $ <eq:counting-observables>]
  The type indicators and $G_j$ are fixed by $cal(Q)$, take values in $\[ 0 \, 1 \]$, and have means at least $\( 20 p^2 \)^(- 1)$, by (7.6) and (7.14). The mean squared error of each average is at most $20 p^2 K_(upright("obs")) \/ N_(upright("av"))$ by (7.10). There are $p \( p - 1 \) + 2 lt.eq 2 p^2$ observables. Markov’s inequality applied to their squared errors and a union bound show that the probability some empirical mean has relative error greater than $eta$ is at most
  #[#set math.equation(numbering: n => "(7.23)")
   $ frac(16000 p^8 K_(upright("obs")), N_(upright("av")) eta^2) lt.eq frac(1, 100 \( H_o + 1 \)) . $ <eq:counting-observation-error>]
  These estimates concern the uncapped virtual phase. On the event that its cost meets the cap it agrees with the capped phase. Failure of the latter is contained in the union of the two failure events just bounded; no endpoint law is conditioned on meeting a cap.
  On empirical success every type count is positive. Equation (7.22) shows that the update estimates the current ideal multiplier directly, with factor error at most $\( 1 + eta \) \/ \( 1 - eta \) lt.eq 2$. Its ideal value changes by at most a further factor two for the next phase, so (7.5) holds there. The same empirical bounds give
  $ lr(|log frac(hat(R)_j, C_(j + 1) \/ C_j)|) lt.eq 4 eta . $
  The initial multipliers are ideal. Summing the probabilities of the first unsuccessful phase bounds total failure by $2 H_o \/ \[ 100 \( H_o + 1 \) \] < 1 \/ 50$. On success the ratios telescope and their log errors sum to (7.20). ◻
]

=== 7.5 Implementation with bounded fair-bit computation <implementation-with-bounded-fair-bit-computation>

To turn the experiment into an algorithm, put

#[#set math.equation(numbering: n => "(7.24)")
 $ J_(*) = 100 \( H_o + 1 \) \( B_(upright("ret")) + N_(upright("av")) + p + 2 n + 1 \) \, #h(2em) xi = frac(eta, 10000 \( J_(*) + 1 \)) . $ <eq:counting-bit-parameters>]

To evaluate $k_j$, call Proposition 23 freshly for $h^(j \/ H_o)$ with relative tolerance $xi \/ 4$ and failure probability $xi$. Approximate the known factor $2^(- U j \/ H_o) = 2^(- j \/ 10)$ deterministically to relative error $xi \/ 4$ by rational bisection of the tenth root of $2^(- j)$. Its endpoints have $O \( j + log xi^(- 1) \)$ bits, so this is bounded polynomial arithmetic. The product is a positive rational evaluation of $k_j$ with relative error at most $xi$ and failure probability at most $xi$. Multiply by the exact factorial factor to evaluate $f_j$. Use fresh evaluations for the two weights in each valid proposed Metropolis ratio and in each positive observation of $G_j$. The multipliers and type-count updates remain exact rationals. Cap each acceptance ratio at one and implement it with a downward-rounded dyadic threshold using $ceil.l log_2 \( 1 \/ xi \) ceil.r$ bits. The half-hold uses one exact fair bit.

Here is a bounded implementation of every other finite uniform draw. To draw from ${ 0 \, dots.h \, v - 1 }$, choose a uniform $b$-bit integer $Y$ with $2^b gt.eq v \/ xi$ and return $floor.l v Y \/ 2^b floor.r$. Each output has either $floor.l 2^b \/ v floor.r$ or $ceil.l 2^b \/ v ceil.r$ preimages, so its total variation distance from uniform is at most $v \/ 2^b lt.eq xi$. For a subset of size $a_v$ use $v = binom(d_v, a_v)$ and decode its index by successive binomial inclusion and exclusion counts. This takes at most $d_v$ decisions. Thus initialization needs two finite draws per port, and each proposal needs two finite draws. No rejection loop is used.

#thm([Lemma 7.5.])[
  #emph[The implemented experiment has deterministic polynomial bounds on oracle calls, bit operations, and output length, on every execution. It can be coupled to the capped reference experiment so that, except with probability at most $20 J_(*) xi$, all states, type counts, multiplier updates, and cap decisions coincide, every weight evaluation meets its tolerance, and each positive observed ratio differs from its reference value by log error at most $4 xi$.]
] <lem:counting-bits>

#proof[
  There are at most $T_max = H_o \( B_(upright("ret")) + N_(upright("av")) \)$ underlying transitions. Each requires at most two weight calls and four outer draws (hold, two proposal choices, and acceptance). The observations require at most $2 H_o N_(upright("av"))$ further calls, and the restarts at most $2 H_o \| cal(P) \|$ initialization draws. Including transition counts, the number of these elementary actions is at most
  $ 7 T_max + 2 H_o N_(upright("av")) + 2 H_o \| cal(P) \| < J_(*) . $
  Counter initialization and arithmetic on all defect multipliers add only deterministic polynomial work.
  For the coupling, expose the joint past immediately before each call or draw. Until a discrepancy, the states and multipliers agree. The new evaluation input is then fixed by that past, and fresh bits give conditional evaluation failure probability at most $xi$. This uses no conditioning on future successful evaluations. Conditional on accurate evaluations, a computed weight ratio $r'$ and its exact value $r$ satisfy
  $ frac(1 - xi, 1 + xi) lt.eq r' / r lt.eq frac(1 + xi, 1 - xi) \, #h(2em) \| min \( 1 \, r' \) - min \( 1 \, r \) \| lt.eq frac(2 xi, 1 - xi) < 4 xi . $
  Dyadic rounding contributes at most another $xi$. Couple reference and implemented acceptance decisions with a common uniform variable. Formally, the algorithm’s uniform $b$-bit integer can be supplemented, only in the proof, by an independent uniform point inside its dyadic interval. The resulting continuous uniform variable gives the exact reference marginal and realizes the stated probability of disagreement. Couple each other finite draw at its total variation cost, at most $xi$. A union bound over the action budget, including call failures, gives the generous bound $20 J_(*) xi$. Matching paths have identical integer type counts; consequently (7.19) gives exactly identical stored multipliers, even though the ratio observations differ. Trace returns and cap decisions also agree. Successful positive ratios have log error at most $4 xi$, as claimed. This is the bounded coupling argument of #cite(label("CB")) Lemma 7.3 and Section 7.3, with the evaluator furnished here.
  For the unconditional resource bound, $\| cal(P) \| lt.eq 2 n$ and $d_v lt.eq N^21 W = N^20021$, so $p lt.eq 2 n N^20021$. All numerical quantities $U \, H_o \, K_o \, q \, C_(upright(p)) \, C_(upright(d)) \, K_(upright("obs"))$, the displayed caps, and $xi^(- 1)$ are bounded by fixed polynomials in $N$ and $epsilon^(- 1)$. Their exponents are absolute constants. Every state has a $2 p$-bit representation; its count profile and type are recovered by a bounded scan. Factorials and binomial coefficients have $O \( p log \( p + 1 \) \)$ bits and are computed by bounded integer arithmetic. Each weight evaluation has deterministic polynomial work and output length by Proposition 23, even on its failure event. The scale $2^(- U j \/ H_o)$ and rational powers have polynomial descriptions and evaluation precision; restoring $2^U$ ultimately requires only $U + 1$ bits.
  The sizes of the stored multipliers are controlled without any accuracy assumption. On a nonaborting history,
  $ w_(i l)^(\( a \)) = w_(i l)^(\( 0 \)) product_(j = 0)^(a - 1) n_0^(\( j \)) / n_(i l)^(\( j \)) \, #h(2em) 1 lt.eq n_T^(\( j \)) lt.eq N_(upright("av")) . $
  Thus each numerator and denominator has at most its initial bit length plus $H_o ceil.l log_2 \( N_(upright("av")) + 1 \) ceil.r$ bits, up to a fixed additive constant, even without fraction reduction. A zero count causes an abort before division. Acceptance thresholds therefore have polynomial-length operands on every history. Adding at most $N_(upright("av"))$ positive rational observations using a product denominator, and multiplying at most $H_o$ phase estimates, also creates only polynomial-length integers. These estimates include the cost of writing the rational output. All outer loops have the specified caps, all evaluator loops are bounded, and every random draw uses finitely many fair bits. The resource conclusions are independent of successful coupling, good multipliers, and statistical accuracy. ◻
]

=== 7.6 Completion of the approximation <completion-of-the-approximation>

#proof[
  First perform the exact feasibility test from Section 2. Its integrality guarantee makes an empty real intersection equivalent to $Z = 0$, in which case the algorithm returns zero on every execution. If $R = 0$, the only feasible vector is zero and the algorithm returns one; this includes the promised case $n = 0$. In all other feasible cases perform the partition and port constructions proved above.
  If $p gt.eq 1$, let $Y$ be the implemented ratio product. By Proposition 27 and Lemma 28, outside an event of probability at most $1 \/ 50 + 20 J_(*) xi < 1 \/ 4$, the run does not abort and
  $ lr(|log Y / C_(H_o)|) lt.eq 4 H_o \( eta + xi \) < epsilon \/ 100 . $
  Indeed the multiplicative bounds on each positive observation persist under summation, while the type counts agree exactly. Restore the scale by setting $hat(cal(Z))_(upright("port")) = 2^U Y$. If $p = 0$, evaluate its sole count profile directly with relative tolerance $epsilon \/ 100$ and failure probability $1 \/ 16$; then $\| log \( hat(cal(Z))_(upright("port")) \/ cal(Z)_(upright("port")) \) \| lt.eq epsilon \/ 50$ on success. This branch invokes none of the $p$-dependent chain parameters. When $p = 1$, the chain proof already applies: there are no defect classes or multipliers and every state is a transversal.
  Obtain the deterministic positive rational estimate $hat(J)$ from Proposition 23, with $\| log \( hat(J) \/ J \) \| lt.eq N^(- 7)$, and output, for this run, $hat(Z) = hat(cal(Z))_(upright("port")) \/ hat(J)$. Aborted runs output zero. On the success event in either branch, (7.1) gives
  $ lr(|log hat(Z) / Z|) lt.eq epsilon \/ 50 + 101 N^(- 7) < epsilon \/ 10 . $
  Here $N gt.eq 10^10$ and $N gt.eq epsilon^(- 1)$, so $101 N^(- 7) lt.eq 101 epsilon N^(- 6) < epsilon \/ 100$. For $0 < epsilon < 1$, $e^(- epsilon \/ 10) gt.eq 1 - epsilon$ and $e^(epsilon \/ 10) lt.eq 1 + epsilon$; hence a single run has the required relative accuracy with probability greater than $3 \/ 4$.
  For the requested failure probability, let $s_delta = ceil.l log_2 \( delta^(- 1) \) ceil.r$ and take $m_delta = 10 s_delta + 1$ independent runs, returning their median. If $F$ is their number of failures, independence implies $bb(E) 2^F lt.eq \( 5 \/ 4 \)^(m_delta)$. A bad median requires at least $m_delta \/ 2$ failures, so
  $ bb(P) { upright("bad median") } lt.eq (frac(5, 4 sqrt(2)))^(10 s_delta + 1) lt.eq 2^(- s_delta) lt.eq delta . $
  The middle inequality follows from $\( 5 \/ \( 4 sqrt(2) \) \)^10 < 1 \/ 2$. Exact comparison of the rational outputs and median selection have polynomial bit cost.
  Finally, $N = 10^10 + n + ell + ceil.l epsilon^(- 1) ceil.r$ is bounded by a fixed polynomial in the parameters of the theorem. All construction, evaluation, and counting bounds established above are fixed polynomials in $N$ and the input encoding length. Multiplying them by $m_delta = O \( 1 + log delta^(- 1) \)$ gives the required separate bounds on rank-oracle calls and other bit operations on every execution, including reading answers, writing queries and output, and generating random bits. The only explicitly constructed labelled set has $2 p$ elements, with $p$ bounded by the short port ranges. The large expansion matroids, geometric subdivisions, and transport flows used in the proofs are never constructed or queried. This completes the algorithm and its approximation and bit-complexity proofs. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
