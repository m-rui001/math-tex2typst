#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 10pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: false), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 10.45pt)
#show heading.where(level: 1): set text(size: 11.82pt)
#show link: set text(fill: blue)
#show figure.where(kind: table): set block(breakable: true)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[Constant-factor hardness of uniform sparsest cut]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a finite undirected graph $G$ on $\[ N \]$, with nonnegative rational capacities $c_(i j) = c_(j i)$ and $c_(i i) = 0$, define

#[#set math.equation(numbering: n => "(1)")
 $ Phi \( G \) = min_(diameter eq.not S subset.neq \[ N \]) frac(sum_(i in S \, thin j in.not S) c_(i j), \| S \| \( N - \| S \| \)) . $ <eq:uniform-objective>]

The denominator is the number of unordered pairs separated by the cut. Thus Equation (1) is the sparsest-cut objective with demand exactly one on every pair of distinct vertices. Capacities and thresholds are encoded in binary. A factor-$C$ approximation must return a nonempty proper cut whose ratio is at most $C Phi \( G \)$.

#thm([Theorem 1.1.])[
  #emph[For every fixed real constant $C > 1$, there is a polynomial-time reduction from $3$CNF satisfiability to finite undirected graphs with nonnegative rational capacities and exactly unit demands, together with a positive rational threshold $a$, such that 
$ upright("the formula is satisfiable") & arrow.r.double med Phi \( G \) lt.eq a \,\
upright("the formula is unsatisfiable") & arrow.r.double med Phi \( G \) > C a . $

 The graph size and the bit lengths of all output numbers are polynomial in the formula size, with constants and exponents allowed to depend on $C$. In particular, approximating Uniform Sparsest Cut within any fixed factor $C > 1$ is NP-hard.]
] <thm:main>

The source decision problem is NP-complete #cite(label("Karp1972")) Main Theorem, Problem 11. The reduction uses no unproved complexity hypothesis. It gives an explicit gap for the objective in Equation (1), including every nonempty proper cut, however small either side may be.

=== 1.1 Historical context and significance <historical-context-and-significance>

Uniform Sparsest Cut asks for a partition that separates little capacity relative to the number of vertex pairs it separates. This normalization makes the problem sensitive to bottlenecks at every scale, including cuts with a small side. Its connection with multicommodity flow gives both a way to certify that a graph has no sparse cut and a route to approximation algorithms. Leighton and Rao developed this flow–cut approach and its logarithmic approximation guarantees #cite(label("LeightonRao1999")). Arora, Rao, and Vazirani improved the approximation factor to $O \( sqrt(log N) \)$ using semidefinite programming; their treatment of the unweighted uniform objective appears in #cite(label("ARV2009")) Section 6, Theorem 16.

Exact hardness and approximation hardness address different questions. Matula and Shahrokhi established NP-hardness of finding sparsest cuts #cite(label("MatulaShahrokhi1990")); Bonsma, Broersma, Patel, and Pyatkin proved NP-completeness for unweighted graphs with the cardinality-product denominator used here #cite(label("BBPP2012")) Theorem 15. To rule out a constant-factor approximation, one must create a multiplicative separation between satisfiable and unsatisfiable instances, while preserving the uniform denominator.

Previous approximation lower bounds depend on the complexity assumption and on which pairs carry demand. Ambühl, Mastrolilli, and Svensson proved that a polynomial-time approximation scheme for Uniform Sparsest Cut would yield probabilistic SAT algorithms of time $2^(n^epsilon)$ for every fixed $epsilon > 0$, where $n$ is the SAT input length #cite(label("AMS2011")) Theorem 1.3. Raghavendra and Steurer introduced the Small-Set Expansion hypothesis and its connection with Unique Games #cite(label("RaghavendraSteurer2010")). Raghavendra, Steurer, and Tulsiani established arbitrarily large constant-factor gaps for Balanced Separator from that hypothesis #cite(label("RST2012")) full version, Theorem 3.5 and Corollary 3.6. Their balanced-cut statement measures set size by stationary volume. The standard recursive reduction then yields hardness of every constant factor for Uniform Sparsest Cut under polynomial-time oracle reductions, assuming the same hypothesis.#footnote[The recursive procedure in #cite(label("LeightonRao1999")) Section 3.3 calls sparsest-cut approximation on induced subgraphs while retaining the original vertex masses. For fixed parameters, the masses in the construction of #cite(label("RST2012")) Section 6 are products of a uniform input measure and fixed rational probabilities. Proportional replication, with sufficiently large capacities inside each cluster, realizes these masses by polynomially many vertices with unit all-pairs demand; compare #cite(label("ARV2009")) Section 2. The resulting constant loss is absorbed by the arbitrarily large balanced-cut gap.]

The nonuniform problem permits a selected set $cal(D)$ of distinct demand pairs. In the formulation of Chawla, Krauthgamer, Kumar, Rabani, and Sivakumar, a solution is an edge set $M$ with total capacity $c \( M \)$, and its ratio is $c \( M \) \/ q_(cal(D)) \( M \)$, where $q_(cal(D)) \( M \) > 0$ counts the demand pairs disconnected after deleting $M$. They proved every-constant-factor hardness under the Unique Games Conjecture #cite(label("CKKRS2006")) Corollary 1.3 and p. 99. The independent Unique Games Theorem supplies the required game premise: its unweighted bipartite constraints can be given equal weights summing to one #cite(label("OpenAIUniqueGames2026")) Theorem 1.1 and Corollary 8.3. The resulting nonuniform hardness concerns cutset-output search under polynomial-time Cook reductions. Only the selected pairs carry unit demand; they need not include all distinct vertex pairs. The direct reduction proving Theorem 1 is independent of this nonuniform consequence.

Khot and Vishnoi also developed the connection between Unique Games, cut hardness, and negative-type metrics #cite(label("KhotVishnoi2015")). Ordinary NP-hardness for nonuniform sparsest cut is known even with treewidth-two supply graphs, with a $17 \/ 16 - epsilon$ approximation threshold #cite(label("GuptaTalwarWitmer2013")) Theorem 1.3. The separation between the uniform and nonuniform hardness questions is discussed in #cite(label("ManurangsiTrevisan2018")) Section 1.2 and in the recent work of d’Orsi, Jones, Ruotolo, Vadhan, and Zhang on low-degree Abelian Cayley graphs #cite(label("DOrsiEtAl2025")).

Theorem 1 establishes an unconditional approximation gap with unit demands. Its force comes from controlling all cut masses in a polynomial-size reduction. The proof starts with an explicit algebraic test system for $3$CNF, extracts a Boolean valuation from a rare successful event, and forces that event from any cut whose comparison cost is small relative to its demand variance.

=== 1.2 Proof structure and main constructions <proof-structure-and-main-constructions>

The reduction has four interfaces. A satisfying assignment supplies a low-cost cut; conversely, a cut with small cost relative to its separated demand will determine a satisfying assignment. The main difficulty in this converse is that the separated demand can be arbitrarily small. Errors must therefore be controlled relative to that demand, rather than by one fixed additive tolerance.

===== 1.2.1 Algebraic testing. <algebraic-testing.>

A proof is a bit assignment on an explicitly constructed finite set of positions. A test samples a bounded list of positions and checks their answers. Section 2 constructs a linear-size list of evaluation vectors on which a quadratic form that is nonzero somewhere on the list vanishes only rarely. It uses the Garcia–Stichtenoth tower #cite(label("GS1996")) #cite(label("Stichtenoth2001")); the local algebra, dimension estimates, and finite computation needed here are supplied in that section. Section 3 uses this list to construct tests whose individual query probabilities are bounded by a fixed multiple of uniform measure. Its auxiliary parity-query law has exactly uniform marginals and strongly mixing pairs. It encodes Boolean tables by matrix minors and corrects a nearly passing oracle so that quadratic line identities hold at every base on a high-mass set of directions. Local proof testing belongs to the PCP framework developed by Arora and Safra and by Arora, Lund, Motwani, Sudan, and Szegedy, and subsequently recast through gap amplification by Dinur #cite(label("AroraSafra1998")) #cite(label("ALMSS1998")) #cite(label("Dinur2007")). The correlated test laws and their soundness are proved here.

A #emph[predicate] is a Boolean function of the entire proof assignment. A #emph[valuation] assigns a bit to each actual predicate, so two sampled descriptions of the same function must receive the same answer. Calibration prescribes its mean under each specified predicate-sampling law, and order preservation asks that it usually respect pointwise inclusions of predicates. Section 4 proves that an approximately calibrated, approximately order-preserving valuation would decode a satisfying assignment.

===== 1.2.2 Rare-event extraction. <rare-event-extraction.>

Section 5 studies a Boolean response to a conjunction of many independently sampled predicates. Its success probability may be very small. Conditioning on success and exposing a common prefix produces a density with nearly extremal entropy. Comparisons with the constant-one predicate bound the density from above in mean. An explicit clipping argument then forces it near two values, zero and a fixed positive constant. One threshold gives a single valuation satisfying all required calibrations and comparisons. The bounds depend on the fixed list of predicate types, not on their support sizes or on a smallest atom.

===== 1.2.3 From cut variance to a rare successful event. <from-cut-variance-to-a-rare-successful-event.>

A #emph[score] is a bounded real function of boundedly many proof bits. A candidate cut is a measurable ${ 0 \, 1 }$-valued function of scores. A demand law measures the variance of this color, and comparison measures charge for disagreement between pairs of scores. Sections 6 and 7 construct these measures. The demand score is a sum of rare predicates with independent real amplitudes at several scales. Small resampling cost forces the cut color to retain a signal from at least one amplitude. Smoothed comparison paths preserve enough of this signal to produce the successful conjunction response required above. The conditional experiments ensure that this response depends on the predicate itself. Every error is proportional to the cut variance, so the argument applies to every positive demand mass.

===== 1.2.4 Exact uniform demands. <exact-uniform-demands.>

Section 8 rounds each score to a grid-valued truth table. A #emph[key] consists of that table together with its ordered essential bit names. Equal functions have the same key. Box subdivision gives rational upper capacities and rational lower demand masses. Replicating keys converts these retained masses into vertex counts; heavy edges prevent a cut of small ratio from separating copies. Additional edges from the remaining keys charge for their possible contribution to separated demand. This produces exactly the denominator $\| S \| \( N - \| S \| \)$ with polynomially many vertices and polynomial binary encodings.

=== 1.3 Conventions and parameter dependence <conventions-and-parameter-dependence>

All probabilities refer to the explicitly described experiments. A predicate is a Boolean function of the entire proof-bit assignment; its sampling data may be retained when conditioning, but a response to the predicate depends only on that function. The same convention applies to scores. Thus two presentations of the same function cannot receive different cut colors.

For a probability law $mu$ and a Boolean function $h$,

$ "Var"_mu \( h \) = mu \( h = 1 \) mu \( h = 0 \) = 1 / 2 bb(E)_(B \, B' tilde.op mu) lr(|h \( B \) - h \( B' \)|) \, $

where the last two draws are independent. This identity explains the variance normalization used before the final graph is formed.

The approximation factor is fixed first. Thereafter every numerical constant, field size, arity, and number of repetitions is fixed independently of the input formula. Parameters chosen later may depend on earlier parameters only; the necessary order is specified in the proofs. Bounds written $O \( dot.op \)$ have constants depending only on parameters already fixed at that point. The construction is polynomial in the formula size; no claim is made that its exponent is uniform in $C$.

== 2 An explicit pencil of directions <sec:pencil>

The first ingredient is a short list of vectors on which every quadratic evaluation that is nonzero somewhere on the list has large support. Its length must be linear in the ambient dimension. We construct the list by evaluating functions in an additive tower, and give the local calculations and finite algorithm needed for its uniformity.

#thm([Lemma 2.1.])[
  (Quadratic evaluation pencil).  #emph[For every $0 < lambda_0 < 1$ and every sufficiently large power of two $r$, put $q = r^2$. There is a deterministic algorithm which, given an integer $d gt.eq 1$, constructs a list 
$ u_1 \, dots.h \, u_m in bb(F)_q^d $

 with the following properties:]
  + #emph[$m = O \( d \)$, and the list contains every standard basis vector of $bb(F)_q^d$;]
  + #emph[if a homogeneous quadratic polynomial $Q$ in $d$ variables does not vanish at every point of the list, then 
$ \# { j : Q \( u_j \) = 0 } lt.eq lambda_0 m . $

]
  #emph[The running time is $2^(O \( d \))$ bit operations. The constants in both bounds may depend on $r$, which is fixed independently of $d$.]
] <lem:pencil>

In Section 3, these vectors define rank-one directions for a random walk on a space of matrices. Its spectral estimate needs only quadratic evaluations that are nonzero somewhere on the list, exactly the hypothesis in (ii). The application takes $d = O \( log \( upright("input size") + 1 \) \)$, so the construction time is polynomial in the formula size.

The proof first describes the local branches of the tower and their integral lattices. Their determinant orders bound the conditions imposed on global functions with controlled poles. We then evaluate a sufficiently large space of these functions to obtain the quadratic zero bound, and finally give a finite algorithm with explicit precision and running-time bounds.

Fix a power of two $r$ sufficiently large that, with $D = r + 1$,

#[#set math.equation(numbering: n => "(2)")
 $ frac(2 D, r^2 - r) lt.eq lambda_0 . $ <eq:pencil-parameters>]

All finite fields used below have characteristic two. Write $F = bb(F)_q$ and let $k$ be an algebraic closure of $F$. Define

#[#set math.equation(numbering: n => "(3)")
 $ S \( Y \) = Y^r + Y \, #h(2em) f \( Y \) = frac(Y^(r + 1), Y^r + Y) = frac(Y^r, Y^(r - 1) + 1) = frac(1, S \( 1 \/ Y \)) \, #h(2em) S \( x_(i + 1) \) = f \( x_i \) \, $ <eq:pencil-tower>]

where $x_1$ is transcendental. This is the Garcia–Stichtenoth tower #cite(label("GS1996")); the recurrence also appears in #cite(label("Stichtenoth2001")) Example 3.3. The identities involving inverses are rational-function identities. In particular, the middle expression defines $f$ at zero. We will prove that the tower through $x_l$ is a field of degree $N = r^(l - 1)$ over $k \( x_1 \)$, and that the monomials

#[#set math.equation(numbering: n => "(4)")
 $ e_(bold(a)) = x_2^(a_2) dots.h.c x_l^(a_l) \, #h(2em) 0 lt.eq a_i < r \, $ <eq:pencil-power-basis>]

form a basis. For $l = 1$ this is the one-element basis $1$. The same equations and basis will then define the tower over $F \( x_1 \)$.

=== 2.1 The two local extensions <the-two-local-extensions>

For a formal Laurent series, its order is the least exponent with nonzero coefficient; the order of zero is $+ oo$. An element of $k \( \( z \) \)$ is called integral if it belongs to $k \[ \[ z \] \]$.

Suppose first that the right side of an equation $S \( X \) = b \( z \)$ becomes integral after subtracting $S \( g \)$, for a specified $g in k \( \( z \) \)$. Put $b_0 = b - S \( g \) in k \[ \[ z \] \]$. There are exactly $r$ choices of a constant $beta$ satisfying $beta^r + beta = b_0 \( 0 \)$: the derivative of this polynomial is one, and its roots differ by the elements of $bb(F)_r$. For each choice, there is a unique positive-order series $u$ with $S \( u \) = b_0 - S \( beta \)$. Indeed, if $b_0 - S \( beta \) = sum_(n > 0) b_n z^n$, then

#[#set math.equation(numbering: n => "(5)")
 $ u_n = b_n + upright(bold(1))_({ r divides n }) u_(n \/ r)^r #h(2em) \( n > 0 \) $ <eq:pencil-additive-recursion>]

determines its coefficients successively. Thus the equation splits into $r$ distinct roots $g + beta + u$ in $k \( \( z \) \)$. Its local algebra is a product of $r$ copies of $k \( \( z \) \)$, with integral lattice $k \[ \[ z \] \]^r$.

The second case is a simple pole. It is useful to establish the parameter and degree assertions without first assuming irreducibility.

#thm([Lemma 2.2.])[
  (A simple-pole extension).  #emph[Let $b in k \( \( z \) \)$ have order $- 1$. The polynomial $X^r + X - b$ is irreducible over $k \( \( z \) \)$. Its extension is a Laurent series field $k \( \( w \) \)$, where $w = 1 \/ X$ and $z$ has order $r$ in $w$. Its integral lattice has the basis 
$ 1 \, w \, dots.h \, w^(r - 1) quad upright("over ") k \[ \[ z \] \] \, $

 and the discriminant of this basis has $z$-order $2 \( r - 1 \)$.]
] <lem:pencil-simple-pole>

#proof[
  The series $q_0 \( z \) = 1 \/ b \( z \)$ has order one. Its compositional inverse $psi$ exists: the coefficient of each new term is determined by division by the nonzero linear coefficient of $q_0$. In a new series field $k \( \( w \) \)$, set
  #[#set math.equation(numbering: n => "(6)")
   $ z = psi (frac(w^r, 1 + w^(r - 1))) . $ <eq:pencil-reparameterization>]
  Substitution gives an injective homomorphism from $k \( \( z \) \)$ to $k \( \( w \) \)$, and $z = c w^r + dots.h.c$ for some $c eq.not 0$. Moreover $X = 1 \/ w$ satisfies $X^r + X = b \( z \)$.
  The monomials $w^j z^n$, with $0 lt.eq j < r$ and $n gt.eq 0$, have distinct leading orders $j + r n$, which exhaust the nonnegative integers. Given a power series in $w$, subtract its lowest remaining coefficient using the unique such monomial of that order, and repeat. The subtractions converge formally because their orders tend to infinity. Collecting terms with the same $j$ gives
  $ k \[ \[ w \] \] = xor.big_(j = 0)^(r - 1) w^j k \[ \[ z \] \] . $
  The sum is direct: the leading orders of nonzero summands belong to distinct residue classes modulo $r$. After multiplying a Laurent series by a sufficiently large power of $z$, the same argument applies. Hence $\[ k \( \( w \) \) : k \( \( z \) \) \] = r$ and $k \( \( w \) \) = k \( \( z \) \) \( w \) = k \( \( z \) \) \( X \)$. This proves irreducibility, and separability follows from the derivative $S' \( X \) = 1$.
  The displayed free module is closed under multiplication, so each of its elements is integral over $k \[ \[ z \] \]$ by the characteristic polynomial of its multiplication map. Conversely, an element of negative $w$-order cannot satisfy a monic polynomial over $k \[ \[ z \] \]$: its highest power would be the unique term of smallest order. Thus $k \[ \[ w \] \]$ is precisely the integral closure.
  The $r$ embeddings send $X$ to $X + c$, $c in bb(F)_r$, and therefore send $w$ to $w_c = 1 \/ \( X + c \)$. For distinct $c \, c'$, the difference
  $ w_c - w_(c') = frac(c' - c, \( X + c \) \( X + c' \)) $
  has $w$-order two, or extended $z$-order $2 \/ r$. The evaluation matrix of $1 \, w \, dots.h \, w^(r - 1)$ is Vandermonde. Its determinant squared is the trace-pairing determinant, so the latter has order $2 binom(r, 2) \( 2 \/ r \) = 2 \( r - 1 \)$. ◻
]

Here and below the trace of an element of a finite algebra is the trace of its multiplication map, and its norm is the determinant of that map. For a separable field or product of separable fields, passing to a field containing all embeddings diagonalizes multiplication. Thus trace is the sum of the embedded values, and the trace matrix of a basis is the transpose of its evaluation matrix times that matrix. This also proves the discriminant identity used in Lemma 3.

=== 2.2 All branches of the tower <all-branches-of-the-tower>

At a pole of $Y$, the difference $f \( Y \) - Y$ is integral: from $f \( Y \) = Y \/ \( 1 + Y^(1 - r) \)$, its order is at least zero. Start at infinity with the parameter $t = 1 \/ x_1$. The first right side has a simple pole, and Lemma 3 produces a single branch in which $x_2$ has a simple pole with parameter $1 \/ x_2$. Repeating the lemma gives a single branch at every level. Inductively, the polynomial defining $x_(i + 1)$ is irreducible over this completion of the preceding field, and hence over that field itself. This proves the degree and basis assertions following Equation (4). It also proves them over $F \( x_1 \)$, since an equation irreducible after extending constants to $k$ was already irreducible over $F$.

At a finite point $x_1 = a$, put $t = x_1 - a$. If $a in bb(F)_r \\ { 0 }$, then $S \( x_1 \)$ has a simple zero and $x_1^(r + 1)$ is a unit. Thus the first right side has a simple pole, and all subsequent steps are again simple-pole extensions. If $a in.not bb(F)_r$, the first right side is integral and the extension splits. An integral residue $beta in.not bb(F)_r$ has $f \( beta \) eq.not 0$, so no root of $S \( Y \) = f \( beta \)$ belongs to $bb(F)_r$. Induction therefore gives only unshifted integral splittings at such a point.

It remains to describe every branch above zero. As long as the residues of $x_1 \, x_2 \, dots.h$ are zero, all extensions split without a shift. Since $f \( Y \)$ has order $r$ at zero and $S \( Y \)$ has order one there,

$ "ord"_t \( x_j \) = r^(j - 1) $

along the branch with zero residues. Suppose the first nonzero residue occurs at $x_i$, where $i gt.eq 2$. It is an element $alpha in bb(F)_r^(*)$, and

$ "ord"_t \( x_i - alpha \) = "ord"_t S \( x_i \) = r^(i - 1) . $

The numerator $x_i^(r + 1) - alpha^2$ is divisible by $x_i - alpha$. Consequently, modulo integral series,

#[#set math.equation(numbering: n => "(7)")
 $ f \( x_i \) equiv frac(alpha^2, S \( x_i \)) = S (alpha^2 / x_(i - 1)) . $ <eq:pencil-first-shift>]

The equality uses $S \( x_i \) = f \( x_(i - 1) \)$, the last identity in Equation (3), and $alpha^2 in bb(F)_r$. Thus this step splits after the specified shift, and every resulting root satisfies $x_(i + 1) equiv alpha^2 \/ x_(i - 1)$ modulo integral series.

For any earlier small variable $x_j$, $j > 1$, one has

#[#set math.equation(numbering: n => "(8)")
 $ 1 / x_j equiv frac(1, S \( x_j \)) = S (1 / x_(j - 1)) med \( mod med k \[ \[ t \] \] \) . $ <eq:pencil-descending-shifts>]

Indeed the difference of the first two expressions is $x_j^(r - 2) \/ \( 1 + x_j^(r - 1) \)$, which is integral. Since $f \( Y \) equiv Y$ at a pole, Equations (7) and (8) give successively

$ x_(i + s) equiv alpha^2 / x_(i - s) med \( mod med k \[ \[ t \] \] \) \, #h(2em) 1 lt.eq s lt.eq i - 1 \, $

for as long as those variables occur in the tower. Each step in this list is a splitting step with the indicated shift. The last principal part is $alpha^2 \/ x_1$, a simple pole. From then on every extension is the simple-pole extension of Lemma 3. This description includes branches for which the tower stops before the first nonzero residue, during the descending shifts, or after ramification.

At every step the split factors or the single ramified factor account for the full relative degree $r$. Therefore, at each base place, the scalar extension of the degree-$N$ tower to $k \( \( t \) \)$ is exactly the product of the branch fields just constructed. No additional local factor is omitted.

=== 2.3 Integral lattices and their determinants <integral-lattices-and-their-determinants>

Fix a base place with parameter $t$, and put $R = k \[ \[ t \] \]$. The product of its branch integral rings is a free $R$-module of rank $N$, by the bases constructed above. Express it in coefficient coordinates relative to Equation (4), and denote the resulting lattice in $k \( \( t \) \)^N$ by $Lambda$. If $C$ is a basis matrix of this lattice, define its coefficient determinant order by $delta = "ord"_t det C$.

We use two elementary facts about this order. First, if a square matrix over $R$ has nonzero determinant, invertible row and column operations reduce it to a diagonal matrix. To see this, choose an entry of least order and move it to the first position. It divides every entry in $R$, so row and column subtractions clear its column and row. Continue in the remaining square matrix. The diagonal entries are units times powers of $t$. It follows that the dimension over $k$ of the cokernel equals the determinant order. Second, for a branch $k \( \( z \) \)$ over $k \( \( t \) \)$, multiplication by a unit has determinant a unit on $k \[ \[ z \] \]$, whereas multiplication by $z$ has cokernel $k$ and hence determinant order one. Thus

#[#set math.equation(numbering: n => "(9)")
 $ "ord"_t "Norm"_(k \( \( z \) \) \/ k \( \( t \) \)) \( z^a u \) = a #h(2em) \( a in bb(Z) \, med u in k \[ \[ z \] \]^(*) \) . $ <eq:pencil-norm-order>]

The equality for negative $a$ follows by multiplicativity. The residue field of each branch is $k$; this is why no residue-degree multiplier appears in Equation (9).

For completeness, if $b_1 \, dots.h \, b_n$ is a basis of a separable algebra over a field and $c_1 \, dots.h \, c_r$ is a relative basis for a separable algebra above it, their composed basis satisfies

#[#set math.equation(numbering: n => "(10)")
 $ "disc" \( b_i c_j \) = "disc" \( b_i \)^r "Norm" #scale(x: 120%, y: 120%)[\(] "disc" \( c_j \) #scale(x: 120%, y: 120%)[\)] . $ <eq:pencil-disc-tower>]

Indeed, the evaluation map first applies $r$ copies of the lower evaluation matrix and then, over each lower embedding, its relative evaluation matrix. Taking determinants and squaring gives the formula. For a product algebra choose the relative bases componentwise; the same factorization applies.

The discriminant of the power basis in Equation (4) is a nonzero constant. At every relative step the roots of the additive equation differ by nonzero elements of $bb(F)_r$, so its power-basis Vandermonde discriminant is a nonzero constant; Equation (10) preserves this property. For integral bases, a splitting step has relative discriminant one, using the idempotent basis of its product of rings. A simple-pole step has relative discriminant order $2 \( r - 1 \)$ by Lemma 3.

Suppose the current local algebra has degree $n$, has $B$ branches, and its integral discriminant has base order $d_(upright("int"))$. If $R_0$ of those branches ramify at the next step, then

$ d_(upright(i n t \, n e w)) & = r d_(upright("int")) + 2 \( r - 1 \) R_0 \,\
B_(upright("new")) & = r B - \( r - 1 \) R_0 \, #h(2em) n_(upright("new")) = r n . $

Equation (9) justifies each contribution from a branch that may already be ramified over the base. Starting from $d_(upright("int")) = 0$ and $n = B = 1$, these recurrences give $d_(upright("int")) = 2 \( n - B \)$ at every level. On changing from the power basis to an integral basis, the trace matrix changes to $C^(sans(T)) G C$, where $G$ is the power-basis trace matrix. Since $det G$ is a unit, we obtain

#[#set math.equation(numbering: n => "(11)")
 $ delta = N - B \, #h(2em) 0 lt.eq delta lt.eq N . $ <eq:pencil-lattice-det>]

At a good finite point $a in.not bb(F)_r$ all variables are integral and all extensions split. The power basis is then itself an integral basis: its lattice is contained in the integral lattice, and both have determinant order zero.

We next give a bound that makes the lattice conditions finite. At every exceptional place, and in every partial branch, each nonzero $x_i - c$, $c in bb(F)_r$, has absolute order at most $N^2$ in the current parameter. Before a later ramified extension, the zero-branch orders and the descending pole orders in the preceding subsection are at most $N$; the order of $x_i - c$ is zero unless its residue equals $c$ or it has a pole. Subsequent ramification multiplies these orders by a total factor at most $N$. This proves the bound for every such factor, including variables retained from an earlier level. Set

#[#set math.equation(numbering: n => "(12)")
 $ F_0 = \( l + 1 \) r N^2 \, #h(2em) H = \( 2 N - 1 \) F_0 + D . $ <eq:pencil-FH>]

In every branch, $t^(F_0) e_(bold(a))$ is integral: the pole order of the monomial is at most $\( l - 1 \) \( r - 1 \) N^2$, while $t$ has positive integral order. Hence $t^(F_0) R^N subset.eq Lambda$.

Multiplication by an integral element acts on the integral lattice, so its trace belongs to $R$. Each entry of $G$ therefore has order at least $- 2 F_0$. If $y$ is integral, then $"tr" \( y e_(bold(a)) \)$ has order at least $- F_0$; if $t^D y$ is integral, the lower bound is $- F_0 - D$. The vector of these traces is $G$ times the coefficient vector of $y$. Since $det G$ has order zero, each cofactor has order at least $- 2 F_0 \( N - 1 \)$, and Cramer’s rule yields

#[#set math.equation(numbering: n => "(13)")
 $ t^(F_0) R^N & subset.eq Lambda_a subset.eq t^(- H) R^N &  & \( a in bb(F)_r \) \,\
t^(F_0 - D) R^N & subset.eq t^(- D) Lambda_oo subset.eq t^(- H) R^N . $ <eq:pencil-lattice-sandwich>]

All shifts here are powers of the base parameter, including the shift at infinity. In particular, membership in any target lattice inside $t^(- H) R^N$ is determined by the coefficient jet with exponents from $- H$ through $F_0 - 1$. Changing the omitted tail adds an element of the target lattice. At infinity the smaller upper endpoint $F_0 - D - 1$ would also suffice.

=== 2.4 A large space of global functions <a-large-space-of-global-functions>

In coefficient coordinates, let $V_H$ consist of functions whose every coefficient is a linear combination of

$ 1 \, x_1 \, dots.h \, x_1^H \, #h(2em) \( x_1 - a \)^(- j) quad \( a in bb(F)_r \, 1 lt.eq j lt.eq H \) . $

These rational functions are independent: their principal parts at the distinct finite poles first determine all the negative-power coefficients, and the remaining polynomial determines the others. Consequently

$ dim_k V_H = N \[ 1 + \( r + 1 \) H \] . $

At each of the $r$ bad finite points and at infinity, its coefficient expansion belongs to $t^(- H) k \[ \[ t \] \]^N$. Let $cal(L)_k$ be the subspace of $V_H$ that is integral at every finite place and becomes integral at infinity after multiplication by $t^D$.

The finite-place quotient by $Lambda_a$ has dimension $N H + delta_a$: scale the inclusion into an integral matrix and apply the diagonalization argument preceding Equation (9). At infinity the target is $t^(- D) Lambda_oo$, whose determinant order is $delta_oo - N D$, because all $N$ coefficient coordinates are scaled. The quotient dimension there is therefore $N H + delta_oo - N D$. Expansion followed by these quotient maps gives one linear map from $V_H$ to their direct sum. Its rank is at most the dimension of its target; no independent prescription of local jets is required. Equation (11) gives

#[#set math.equation(numbering: n => "(14)")
 $ dim_k cal(L)_k & gt.eq N \[ 1 + \( r + 1 \) H \] - (\( r + 1 \) N H + sum_(a in bb(F)_r union { oo }) delta_a - N D)\
 & gt.eq N \( D - r \) = N . $ <eq:pencil-dimension>]

There are no conditions to impose elsewhere, since the rational coefficients and the power basis are integral at every other finite place. The space contains the constant function one.

This space is defined over $F$. Indeed, coefficientwise $q$-Frobenius, fixing the formal variables $x_i$, preserves the tower equations and permutes all branches above each exceptional place. It thus preserves the subspace $cal(L)_k$ in the fixed finite rational-coefficient basis of $V_H$. Put a matrix whose rows form a basis of this subspace into reduced row echelon form. Applying Frobenius gives another reduced row echelon basis of the same subspace with the same pivots. Uniqueness of that form forces every entry to be fixed by Frobenius, hence to belong to $F$. Thus the space $cal(L)$ of its $F$-rational coefficient vectors has

#[#set math.equation(numbering: n => "(15)")
 $ dim_F cal(L) = dim_k cal(L)_k gt.eq N . $ <eq:pencil-descent>]

The algorithm below obtains this space by a finite ground-field matrix, not by searching for Frobenius-fixed vectors.

=== 2.5 Evaluation and the quadratic zero bound <evaluation-and-the-quadratic-zero-bound>

There are $\( q - r \) N$ rational evaluation tuples above $x_1 in F \\ bb(F)_r$. To verify this count, if $beta in F \\ bb(F)_r$, then $beta^r + beta in bb(F)_r^(*)$ and $beta^(r + 1) in bb(F)_r^(*)$, so $f \( beta \) in bb(F)_r^(*)$. The map $S : F arrow.r bb(F)_r$ is linear over $bb(F)_r$ with kernel $bb(F)_r$, hence is onto. Each equation $S \( Y \) = f \( beta \)$ has exactly $r$ distinct roots in $F \\ bb(F)_r$. Induction proves the count and describes all tuples. All functions in $cal(L)$ are regular at these tuples, so evaluation is well defined.

Let $a$ be a nonzero element of the span of products of two elements of $cal(L)_k$. It is integral at every finite place, and $t^(2 D) a$ is integral at infinity. Its field norm to $k \( x_1 \)$ is nonzero. At every finite place its local multiplication matrix is integral, so the norm has no finite poles and is a polynomial in $x_1$. At infinity,

$ 0 lt.eq "ord"_t "Norm" \( t^(2 D) a \) = 2 D N + "ord"_t "Norm" \( a \) \, $

and therefore

#[#set math.equation(numbering: n => "(16)")
 $ deg "Norm" \( a \) lt.eq 2 D N . $ <eq:pencil-norm-degree>]

At a good base value $b$, the local algebra is a product of $N$ copies of $k \( \( x_1 - b \) \)$. The local norm is the product of the integral branch values $a_1 \, dots.h \, a_N$, and

$ "ord"_(x_1 - b) "Norm" \( a \) = sum_(j = 1)^N "ord"_(x_1 - b) \( a_j \) . $

Each zero evaluation contributes at least one to this sum. In particular, several zero branches above the same $b$ are counted with their full multiplicity. Equation (16) bounds the total number of zero evaluation positions by $2 D N$.

Evaluation on these positions is injective on $cal(L)$: if a nonzero function vanished everywhere, its product with the constant one would contradict $2 D N < \( q - r \) N$, which follows from Equation (2). Choose $l$ least such that $N = r^(l - 1) gt.eq d$, and choose $d$ independent functions in $cal(L)$. Their $d$ by $\( q - r \) N$ evaluation matrix has rank $d$. Choose $d$ independent columns and left-multiply by the inverse of their square matrix. The new functions still belong to $cal(L)$, and their evaluation vectors include all standard basis vectors.

Call the resulting columns $u_1 \, dots.h \, u_m$. If a homogeneous quadratic $Q$ is nonzero on this list, applying $Q$ to the $d$ functions gives a nonzero element of the product span. The preceding zero bound and Equation (2) give

$ \# { j : Q \( u_j \) = 0 } lt.eq 2 D N lt.eq lambda_0 \( q - r \) N = lambda_0 m . $

Since $N < r d$ for this choice of $l$, we have $m = O_r \( d \)$. This proves the algebraic assertions of Lemma 2; it remains to justify the claimed algorithm and running time.

=== 2.6 A finite algorithm and its precision bounds <a-finite-algorithm-and-its-precision-bounds>

The fixed fields $F$ and $bb(F)_r$ can be constructed once and for all. For example, the roots of $Z^(2^s) - Z$ form the field of $2^s$ elements, and a representation by a binary basis and an irreducible polynomial can be fixed by a finite search when $s$ is fixed. Only the extension degrees below grow with $d$; they will be constructed by linear algebra. Field arithmetic in a binary basis has polynomial bit complexity in the basis dimension.

===== 2.6.1 Finite constant fields. <finite-constant-fields.>

At a splitting step, suppose the constant term of the shifted right side lies in a current finite field $bb(F)_Q$ containing $F$. If $S \( beta \)$ belongs to that field, then $beta^Q - beta in bb(F)_r$, because applying $S$ gives zero. This difference is fixed by $Q$-Frobenius, so in characteristic two $beta^(Q^2) = beta$. Thus a quadratic extension suffices to solve the constant equation. It can be built without enumerating the field: the binary-linear map $y mapsto y^2 + y$ on $bb(F)_Q$ has kernel ${ 0 \, 1 }$ and image of codimension one. Linear algebra finds a vector $b$ outside that image, and $Y^2 + Y + b$ is irreducible and defines the quadratic extension. The equation $S \( beta \) = b_0$ is itself a binary linear system in that extension; all its other solutions differ by elements of $bb(F)_r$.

At most one such quadratic extension is needed at each tower level. We may work in nested fields, one for each level, and finally express all constants in a common field of degree

#[#set math.equation(numbering: n => "(17)")
 $ E = 2^(l - 1) lt.eq N $ <eq:pencil-constant-degree>]

over $F$. Simple-pole reversion introduces no new constants. Thus the use of $k$ in the dimension calculation does not require an algorithm to enumerate an algebraic closure.

===== 2.6.2 Elementary precision rules. <elementary-precision-rules.>

Put $M_0 = N^2$. Suppose a nonzero factor $x_i - c$ has order in $\[ - M_0 \, M_0 \]$ and is known modulo the current parameter to the power $K$, where $K > M_0$. Its relative error has order at least $K - M_0$. Multiplication, integer powers, and inversion preserve this lower bound on relative accuracy: for inversion use $\( a \( 1 + u \) \)^(- 1) = a^(- 1) \( 1 + u \)^(- 1)$ with $u$ of positive order. A product or quotient of at most a fixed number, depending on $r$, of these factors therefore has absolute accuracy at least $K - C_r M_0$, for a fixed constant $C_r$. The functions $f$, the indicated shifts $alpha^2 \/ x_j$, and their images under $S$ are sums of such expressions; one may factor $Y^(r - 1) + 1$ over $bb(F)_r^(*)$ when computing $f$.

Subtraction preserves absolute accuracy even when all the known principal parts cancel. In a splitting step, the branch description already proves that $f \( x_i \) - S \( g \)$ is integral. Computing its input factors through $L + C_r M_0$ therefore determines it through the required order $L$. After the constant equation has been solved, Equation (5) determines positive coefficients through $L$ using only those right-side coefficients. Adding back $g$ has the same finite accuracy bound.

In a simple-pole step, compute $q_0 = 1 \/ f \( x_i \)$, which has order one. Its inverse under composition through any order uses only its coefficients through that order and divides by its nonzero linear coefficient. Substitute $w^r \/ \( 1 + w^(r - 1) \)$ in this inverse to obtain Equation (6). If $z \( w \)$ is known modulo $w^B$, its relative error has order at least $B - r$. An old Laurent series whose pole order in $z$ is at most $M_0$ then changes, after substitution, only in orders at least $B - r - r M_0$. Indeed, for each retained term $a_n z^n$ the relative error is at least $B - r$, and its order is at least $- r M_0$; sums preserve the resulting absolute bound. Thus $B gt.eq L + r \( M_0 + 1 \)$ suffices for output precision $L$. Old coefficients through $⌈L \/ r⌉ + M_0 + 2$ suffice as well, since higher powers of $z \( w \)$ cannot contribute below order $L$. Updating all previously constructed variables increases the number of operations, but not the exponent in these precision bounds.

Choose an integer $a_r$ depending only on $r$ so large that $K_N = \( 2 N \)^(a_r)$ dominates $M_0$ and all fixed constants in the preceding rules, for every $N gt.eq 1$. The rules are all covered by the single backward precision budget

#[#set math.equation(numbering: n => "(18)")
 $ L_(i - 1) = K_N #scale(x: 120%, y: 120%)[\(] L_i + K_N + H + D #scale(x: 120%, y: 120%)[\)] . $ <eq:pencil-precision-recurrence>]

This is an allocated upper budget; the algorithm may retain all coefficients up to that budget. It is uniform over levels, branches, and rational coefficient basis inputs.

===== 2.6.3 The final integrality tests. <the-final-integrality-tests.>

Consider one rational coefficient basis element in $V_H$ times one power-basis monomial. In a final branch its pole order, allowing also the infinity adjustment, is bounded by

#[#set math.equation(numbering: n => "(19)")
 $ P_0 = H N + \( r - 1 \) \( l - 1 \) N^2 + D N . $ <eq:pencil-product-pole>]

The first term bounds a base pole of order at most $H$ after total ramification at most $N$; the second bounds the monomial; the last is a harmless bound for the infinity multiplier. Such an input is a product of powers and inverses of the elementary factors already considered. Knowing each factor with relative error of order greater than $P_0$ makes the unknown remainder of the full input integral. A sufficiently large fixed multiple

#[#set math.equation(numbering: n => "(20)")
 $ L_(upright("end")) = C'_r \( H + D + l + 1 \) N^2 $ <eq:pencil-final-precision>]

as absolute factor precision therefore determines every negative coefficient, including after multiplication by $t^D$ at infinity. Cancellation in a linear combination of these inputs can remove computed negative coefficients but cannot reveal an uncomputed one: each individual unknown remainder is already integral.

Use Equation (18) backwards from $L_(upright("end"))$, and then perform the forward branch expansions at those precisions. The branch type and its prescribed shift are determined by the explicit residue and descending-shift rules above. For each basis input, record all negative coefficients in every branch, with the infinity multiplier included. Their vanishing is exactly the desired system defining $cal(L)$.

===== 2.6.4 Size and running time. <size-and-running-time.>

There are at most $\( r + 1 \) N$ exceptional branches at any level. Since $l = 1 + log_r N$, Equation (12) gives $F_0 = O_r \( N^3 \)$ and $H = O_r \( N^4 \)$. The number of rational coefficient unknowns is $N \[ 1 + \( r + 1 \) H \] = O_r \( N^5 \)$, and $L_(upright("end")) = O_r \( N^6 \)$. Even retaining a full window of this latter length per branch gives only $O_r \( N^7 \)$ negative-coefficient equations over the finite constant fields. Expanding each coefficient in an $F$-basis of the common field in Equation (17) gives at most $O_r \( N^8 \)$ equations over $F$. Solving this explicit matrix computes $cal(L)$; Equation (15) proves that its dimension is at least $N$. The computation does not infer dimension by testing random functions.

Iterating Equation (18) for at most $l - 1$ steps shows that every retained series length is at most

$ \( 2 N \)^(O_r \( l + 1 \)) . $

Elementary truncated addition, multiplication, inversion and composition, and coefficientwise reversion, use a number of field operations polynomial in the retained lengths. All branch counts, field representation sizes and matrix dimensions are polynomial in $N$; allowing every level and every basis input multiplies these bounds by polynomial factors. For $N gt.eq 2$, $log \( \( 2 N \)^(O_r \( l + 1 \)) \) = O_r \( \( log N \)^2 \) = O_r \( N \)$; the case $N = 1$ is a fixed computation. Total bit complexity is consequently $2^(O_r \( N \))$. Enumerating the rational evaluation tuples, evaluating the functions, and selecting the independent columns require only additional polynomial time in $N$ and the matrix sizes. Finally $N < r d$, so the entire construction takes $2^(O_r \( d \))$ time. Together with the evaluation argument, this completes the proof of Lemma 2.

== 3 A bit-test system with mixing parity queries <sec:bit-tests>

Here clauses have three literal positions, with repetitions permitted. Repeat literals to pad a nonempty shorter clause; replace an empty clause by two opposing unit clauses on a fresh variable and then pad them. A formula with no clauses can be replaced by a single tautological clause. These operations preserve satisfiability and take linear time.

We first construct the finite tests from which the reduction will use predicates. A test law consists of a distribution of question lists and, for each sampled list together with its public sampling data, an acceptance predicate on the answers. Repeated questions are allowed and count toward the arity.

#thm([Theorem 3.1.])[
  #emph[For every fixed $lambda > 0$ there are constants $eta > 0$, $B < oo$, and a fixed finite list of bounded-arity test laws with the following properties. From a Boolean $3$CNF formula one can construct, in polynomial time, a finite uniform space $cal(S)$ of bit positions and these test laws on $cal(S)$.]
  + #emph[Every individual question marginal is at most $B$ times uniform measure on $cal(S)$. All samplers are polynomially enumerable finite weighted lists with rational probabilities; every positive seed probability is at least inverse-polynomial in the input size.]
  + #emph[If the formula is satisfiable, there is an assignment $y : cal(S) arrow.r bb(F)_2$ accepted by every test in every support.]
  + #emph[If the formula is unsatisfiable, every assignment fails one of the test laws with probability greater than $eta$.]
  + #emph[There is also an exchangeable law of $\( s_1 \, s_2 \, s_3 \, s_4 \) in cal(S)^4$, with uniform marginals, such that the conditional expectation operator of any coordinate given any other has norm at most $lambda$ on mean-zero $L^2 \( cal(S) \)$. The assignment in (ii) satisfies 
$ y_(s_1) + y_(s_2) + y_(s_3) + y_(s_4) = 0 #h(2em) upright("in ") bb(F)_2 $

 throughout the support of this law.]
  #emph[All constants, including the degrees of the polynomial size and time bounds, depend only on $lambda$. Two independent copies of the law in (iv), paired coordinatewise, have the same pair-operator bound on $cal(S)^2$ and give the corresponding parity identity for the expressions $y_i + y_j$.]
] <thm:bit-test-system>

=== 3.1 The matrix walk and the masked parity law <the-matrix-walk-and-the-masked-parity-law>

Pad the variable set to addresses in ${ 0 \, 1 }^d$, with $d gt.eq 1$ and $d = O \( log \( upright("input size") + 1 \) \)$. Dummy addresses impose no clauses. Choose the fixed square field $bb(F) = bb(F)_q$ of characteristic two and the pencil $u_1 \, dots.h \, u_m in bb(F)^d$ from Lemma 2. The field will be sufficiently large and the pencil parameter $lambda_0$ sufficiently small. Set

$ G_0 = "span"_(bb(F)) { u_j u_j^(sans(T)) : 1 lt.eq j lt.eq m } \, #h(2em) G = "Mat"_(b times b) \( G_0 \) . $

We regard $G$ as a space of $\( b d \) times \( b d \)$ matrices with $d times d$ blocks. We may take $b = 101$; the allocation of its blocks is described below. Since the pencil contains the standard basis, $G_0$ contains every diagonal matrix. Also $dim_(bb(F)) G lt.eq b^2 m = O \( d \)$.

Let $sans(D)$ be the law

#[#set math.equation(numbering: n => "(21)")
 $ h = \( c ⊗ u_j \) \( e ⊗ u_j \)^(sans(T)) \, #h(2em) c \, e med upright("uniform in ") bb(F)^b \, quad j med upright("uniform in ") \[ m \] \, $ <eq:rank-one-direction>]

with the three choices independent. This law is invariant under multiplication by a nonzero scalar, and under simultaneous permutations of block rows and block columns. It may have an atom at zero. Write $sans(T) f \( A \) = bb(E)_(h tilde.op sans(D)) f \( A + h \)$, and give $G$ uniform measure $mu$.

The internal-edge estimate below is the usual centered-indicator spectral calculation; see Alon and Chung #cite(label("AlonChung1988")) Lemma 2.3. We prove the eigenvalue bound for this particular matrix walk directly.

#thm([Lemma 3.2.])[
  #emph[On mean-zero $L^2 \( G \)$, the operator $sans(T)$ has norm at most $lambda_1 = lambda_0 + q^(- 1)$. In particular, for every nonempty $D subset.eq G$, 
#[#set math.equation(numbering: n => "(22)")
 $ frac(chevron.l upright(bold(1))_D \, sans(T) upright(bold(1))_D chevron.r, mu \( D \)) lt.eq mu \( D \) + lambda_1 . $ <eq:internal-edge-bound>]

]
] <lem:matrix-walk>

#proof[
  Fix a nonzero $bb(F)_2$-linear functional $ell : bb(F) arrow.r bb(F)_2$. Every additive character of $G$ is $A mapsto \( - 1 \)^(ell \( L \( A \) \))$ for an $bb(F)$-linear functional $L : G arrow.r bb(F)$. Indeed the pairing $\( a \, x \) mapsto ell \( a x \)$ is nondegenerate: for $a eq.not 0$, choose $x$ with $ell \( a x \) = 1$. Choosing a basis of $G$ and counting then gives all its additive characters.
  For such an $L$, evaluation on Equation (21) gives $L \( h \) = c^(sans(T)) M_j e$, where every entry of $M_j$ is a homogeneous quadratic form in $u_j$. If $L eq.not 0$, some entry is nonzero on the list: the directions span $G$, as is seen by taking $c \, e$ to be coordinate vectors. That entry vanishes on at most $lambda_0 m$ indices. For $M_j eq.not 0$, averaging the character first over $c$ gives zero unless $M_j e = 0$, so its full average is $q^(- "rank" M_j) lt.eq q^(- 1)$. The remaining indices contribute at most one. Orthogonality of additive characters diagonalizes $sans(T)$ and proves the norm bound. Applying it to $upright(bold(1))_D - mu \( D \)$ proves Equation (22). ◻
]

Our field oracle will be a function $P : G arrow.r bb(F)$. Its binary encoding has positions

$ cal(S) = G times bb(F)^(*) \, #h(2em) y_(\( A \, sigma \)) = ell \( sigma P \( A \) \) . $

The vector of all $q - 1$ masks determines $P \( A \)$ uniquely by the same nondegenerate pairing. Any field query below is implemented by querying all these masks and rejecting unless they are the encoding of a field element.

Choose a uniformly ordered tuple of four distinct times $t_1 \, t_2 \, t_3 \, t_4 in bb(F)$, an independent uniform $A in G$, an independent $h tilde.op sans(D)$, and an independent uniform $sigma in bb(F)^(*)$. Put

#[#set math.equation(numbering: n => "(23)")
 $ s_i = \( A + t_i h \, sigma alpha_i \) \, #h(2em) alpha_i = (product_(j eq.not i) \( t_i - t_j \))^(- 1) . $ <eq:four-masked-positions>]

This law is exchangeable and each marginal is uniform. If the restriction of $P$ to every sampled line is a polynomial of degree at most two, Lagrange interpolation gives $sum_i alpha_i P \( A + t_i h \) = 0$; applying $ell \( sigma thin dot.op \)$ gives the required binary parity identity.

#thm([Lemma 3.3.])[
  #emph[Every pair-operator of Equation (23) has mean-zero norm at most 
$ max { lambda_1 \, thin 2 \/ \( q - 3 \) } . $

]
] <lem:masked-pair-mixing>

#proof[
  By exchangeability it suffices to consider the first two times, denoted $a \, b$, and write the other two as $c \, d$. For every fixed $\( a \, b \, c \, d \, h \)$ and every $\( x \, m \) in G times bb(F)^(*)$,
  $ bb(P) \[ \( A + a h \, sigma alpha_a \) = \( x \, m \) divides a \, b \, c \, d \, h \] = frac(1, \| G \| \( q - 1 \)) . $
  Conditioning on the complete first bit position therefore preserves the joint time and direction law. The second position is
  $ #scale(x: 120%, y: 120%)[\(] x + \( b - a \) h \, med m alpha_b \/ alpha_a #scale(x: 120%, y: 120%)[\)] . $
  For every time tuple, $\( b - a \) h$ has law $sans(D)$. Consequently its law is independent of the mask multiplier, and the pair operator is the tensor product of $sans(T)$ and the averaged mask permutation.
  For fixed distinct $a \, b \, c$, let $k = \( b - c \) \/ \( a - c \)$. Direct cancellation, using characteristic two, gives
  $ alpha_a / alpha_b = k frac(b - d, a - d) . $
  The fractional-linear map on the right sends the excluded projective arguments $a \, b \, c \, oo$ to $oo \, 0 \, k^2 \, k$, respectively. It is one-to-one on the projective line. Thus, for allowed $d$, this ratio is uniform on $bb(F)^(*) \\ { k \, k^2 }$. Here $k in.not { 0 \, 1 }$, so the two omitted values are distinct. The inverse ratio likewise omits exactly two nonzero values.
  On mean-zero functions of the uniform mask, the sum of all $q - 1$ multiplicative permutations is zero. The average with two permutations removed therefore has norm at most $2 \/ \( q - 3 \)$, since every permutation is an $L^2$ isometry. Averaging over $a \, b \, c$ preserves this bound. The orthogonal subspaces of functions spatially centered at each mask and of mask-only mean-zero functions are invariant under the tensor operator. The former has norm at most $lambda_1$, and the latter has the bound just proved. These subspaces exhaust the orthogonal complement of the constants. ◻
]

Choose the field and pencil so that

#[#set math.equation(numbering: n => "(24)")
 $ lambda_1 < 10^(- 6) \, #h(2em) max { lambda_1 \, 2 \/ \( q - 3 \) } lt.eq lambda \, #h(2em) frac(6, q - 1) lt.eq 1 / 16 . $ <eq:fixed-field-smallness>]

These are fixed choices. On two independent copies of the bit space, the pair operator is the tensor square. Decomposing each factor into constants and mean-zero functions shows that its nonconstant norm is at most the same bound. This proves the final assertion of Theorem 4 once the promised line-polynomial assignment is constructed.

=== 3.2 Boolean tables and polynomial slack <boolean-tables-and-polynomial-slack>

Evaluation codes formed from spans of matrix minors were studied by Beelen, Ghorpade, and Høholdt as affine Grassmann codes #cite(label("BeelenGhorpadeHoholdt2010")). Here we use principal minors to extend Boolean tables, and products of two minors to retain quadratic restrictions on the chosen rank-one lines.

Let $T$ be the principal matrix on the first three blocks, and put $n = 3 d$. For $I subset.eq \[ n \]$, define $p_I \( T \) = det T_(I \, I)$, including $p_diameter = 1$. On a Boolean diagonal $T = "diag" \( z \)$ these are the monomials $product_(i in I) z_i$. Every table on ${ 0 \, 1 }^n$ has a unique expansion in these monomials: at the indicator of a set $J$, its value is $sum_(I subset.eq J) a_I$, which determines the coefficients successively by increasing $\| J \|$. We extend a Boolean table to matrices by replacing its monomials by the corresponding principal minors.

For each $a = \( a_1 \, a_2 \, a_3 \) in { 0 \, 1 }^3$, let $E_a \( T \)$ be the public extension of the following table on triples of addresses. It equals one if the input contains a clause on that ordered triple whose falsifying answer pattern is $a$, and zero otherwise. Multiple clauses and repeated variables cause no change to this definition.

There is one assignment field $X$, required to depend only on the first diagonal block. For $i = 1 \, 2 \, 3$, let $pi_i$ simultaneously swap block one with block $i$ in rows and columns, with $pi_1$ the identity, and write $X_i \( A \) = X \( pi_i A \)$. For each $a$ define $M_(a \, i) = X_i$ when $a_i = 1$ and $M_(a \, i) = 1 - X_i$ when $a_i = 0$. Introduce gate fields $Y_a \, Z_a$. On Boolean diagonal $T$ we want

#[#set math.equation(numbering: n => "(25)")
 $ X^2 - X = 0 \, #h(2em) Y_a - E_a M_(a \, 1) = 0 \, #h(2em) Z_a - M_(a \, 2) M_(a \, 3) = 0 \, #h(2em) Y_a Z_a = 0 . $ <eq:clause-identities>]

There are $25$ identities. In a satisfying assignment, extend the assignment table to $X$ using the first block. Extend the Boolean tables $E_a M_(a \, 1)$ and $M_(a \, 2) M_(a \, 3)$ to $Y_a \, Z_a$ using $T$. Every left side of Equation (25) is then a linear combination of products $p_I p_J$, and vanishes on all Boolean diagonals. For the last identity, simultaneous nonzero values would exhibit the forbidden pattern of a clause.

We need to enforce these identities at uniform matrix arguments. The following explicit reduction supplies their slack.

#thm([Lemma 3.4.])[
  #emph[A linear combination of products $p_I \( T \) p_J \( T \)$ that vanishes on all Boolean diagonal matrices is a sum of terms of the form 
#[#set math.equation(numbering: n => "(26)")
 $ c M N thin T_(i j) \, #h(2em) c M N thin T_(i j) \( T_(i i) - 1 \) \, #h(2em) c M N thin \( T_(i i)^2 - T_(i i) \) \, $ <eq:slack-coefficient-patterns>]

 where $i eq.not j$ in the first two forms, $c in bb(F)$, and $M \, N$ are arbitrary square minors of $T$, possibly empty.]
] <lem:minor-product-slack>

#proof[
  For $i in K$, write the row-$i$ expansion
  $ p_K = T_(i i) p_(K \\ { i }) + sum_(j eq.not i) T_(i j) C_(i j)^K \, $
  where $C_(i j)^K$ is the signed cofactor when $j in K$, and zero otherwise. Every nonzero cofactor is a scalar sign times an arbitrary minor. We retain minus signs in the identities below although the field has characteristic two.
  If $i in J \\ I$, expansion of $p_J$ and $p_(I union { i })$ along row $i$ cancels the diagonal terms and gives
  #[#set math.equation(numbering: n => "(27)")
   $ p_I p_J - p_(I union { i }) p_(J \\ { i }) = sum_(j eq.not i) T_(i j) #scale(x: 120%, y: 120%)[\(] p_I C_(i j)^J - C_(i j)^(I union { i }) p_(J \\ { i }) #scale(x: 120%, y: 120%)[\)] . $ <eq:minor-move>]
  If $i in I ∩ J$, first expand $p_J - p_(J \\ { i })$ and then expand the $p_I$ multiplying $T_(i i) - 1$. This gives
  #[#set math.equation(numbering: n => "(28)")
   $ p_I p_J - p_I p_(J \\ { i }) =  & \( T_(i i)^2 - T_(i i) \) p_(I \\ { i }) p_(J \\ { i })\
 & + sum_(j eq.not i) T_(i j) p_I C_(i j)^J + sum_(j eq.not i) T_(i j) \( T_(i i) - 1 \) C_(i j)^I p_(J \\ { i }) . $ <eq:minor-delete>]
  Each residual term has a form in Equation (26).
  Starting from $\( I \, J \)$, choose an element of the second set and apply Equation (27) or Equation (28). The new second set loses that element, and the union of the sets is unchanged. After exactly $\| J \|$ steps, the remaining product is $p_(I union J)$. Telescoping therefore reduces every original product to this canonical principal minor plus permitted residuals.
  Applying the reduction to the given linear combination leaves $sum_U b_U p_U$ plus permitted residuals. All residuals vanish on Boolean diagonals. At the indicator diagonal of a set $S$ we obtain $sum_(U subset.eq S) b_U = 0$. Induction on $\| S \|$, beginning with the empty set, gives $b_S = 0$ for every $S$. Thus all canonical terms cancel. ◻
]

Reserve two disjoint tag banks, each consisting of three new blocks. Let $b_r \( i \)$ be the copy of address index $i$ in bank $r in { 1 \, 2 }$. For an arbitrary minor $M \( T \) = det T_(R \, C)$, define

$ sans(E)_(i j)^(\( r \)) M \( A \) = det A_(\( R \, b_r \( i \) \) \, \( C \, b_r \( j \) \)) \, $

where the new row and column are appended to their respective lists. For the empty minor this is just the appended entry. If $V$ is supported in the principal bank $r$, the extended submatrix contains exactly one entry of that bank, its appended corner. Its corner cofactor is $M$. Consequently, with $Delta_V L \( A \) = L \( A + V \) - L \( A \)$,

#[#set math.equation(numbering: n => "(29)")
 $ Delta_V \( sans(E)_(i j)^(\( r \)) M \) = V_(b_r \( i \) \, b_r \( j \)) M . $ <eq:tag-extraction>]

For each of the $25$ identity differences, group the residual terms from Lemma 7 by the three forms in Equation (26). Construct three fields $L_1 \, L_2 \, L_3$ as follows, summing with the same coefficients as the residuals:

$ upright("residual term") & upright("term placed in the field")\
c T_(i j) M N & c \( sans(E)_(i j)^(\( 1 \)) M \) N quad upright("in ") L_1\
c T_(i j) \( T_(i i) - 1 \) M N & c \( sans(E)_(i j)^(\( 1 \)) M \) \( sans(E)_(i i)^(\( 2 \)) N \) quad upright("in ") L_2\
c \( T_(i i)^2 - T_(i i) \) M N & c \( sans(E)_(i i)^(\( 1 \)) M \) N quad upright("in ") L_3 . $

Let $v \( T \)$ copy the off-diagonal part of $T$ into bank one, $w \( T \)$ copy $"diag" \( T \) - I$ into bank two, and $u \( T \)$ copy $"diag" \( T \)^2 - "diag" \( T \)$ into bank one. Here $"diag" \( T \)$ means the diagonal matrix retaining the diagonal entries of $T$. These shifts belong to $G$: copying a full block preserves membership in $G_0$, and removing or replacing diagonal entries is allowed because every diagonal matrix belongs to $G_0$. All these shifts leave $T$ unchanged. Equation (29) therefore proves the identity

#[#set math.equation(numbering: n => "(30)")
 $ F \( A \) = Delta_(v \( T \)) L_1 \( A \) + Delta_(v \( T \)) Delta_(w \( T \)) L_2 \( A \) + Delta_(u \( T \)) L_3 \( A \) $ <eq:identity-with-slack>]

for the honest difference $F$. In addition, $L_1 \, L_3$ are affine under all translations in bank one, and $L_2$ is separately affine under translations in each bank. Indeed its first extended factor depends affinely on bank one and not on bank two, and its second factor has the reverse properties. Cross entries between a tag bank and the address indices do not change under principal-bank translations.

=== 3.3 One oracle, a fixed list of tests, and completeness <one-oracle-a-fixed-list-of-tests-and-completeness>

The one assignment field, sixteen gate fields, and seventy-five slack fields are $92$ fields altogether. Give each its own selector index, using one index in each of $92$ fresh blocks. Together with the three address and six tag blocks, this uses $101$ blocks. Every honest field constructed above is a linear combination of products of two arbitrary minors using address and tag indices only. For a field $F$ with selector index $s_F$, replace the first minor in each of its terms $c M N$ by the minor with appended row and column $s_F$. Sum all such packed terms over the $92$ fields to obtain $P$. If $v_F$ is the unit diagonal matrix at $s_F$, the corner-cofactor calculation gives

#[#set math.equation(numbering: n => "(31)")
 $ Delta_(v_F) P = F . $ <eq:selector-isolation>]

Terms belonging to another field omit $s_F$ completely, so they make no contribution to this difference. The shift $v_F$ belongs to $G$.

Every minor of $A + t h$, with $h$ as in Equation (21), is affine in $t$. To see this, expand the determinant by multilinearity in columns. Terms using two perturbed columns vanish because those columns are proportional. Thus each packed product has line degree at most two, as does $P$.

For an arbitrary oracle $P$, use Equation (31) as the #emph[definition] of all proof fields. The ordinary laws are:

+ The line law samples uniform $A$ and $h tilde.op sans(D)$, queries $P \( A + t h \)$ for all $t in bb(F)$, and checks degree at most two.
+ Each of the $25$ laws checks Equation (30) at uniform $A$, with its own three designated slack fields and the corresponding difference from Equation (25).
+ The assignment invariance law samples a uniform translation $v in G$ whose first diagonal block is zero, and checks $X \( A + v \) = X \( A \)$ at uniform $A$.
+ For each slack field and each bank in which it is required to be affine, let $B_r$ be the subspace of $G$ supported in that principal bank. Test
  #[#set math.equation(numbering: n => "(32)")
   $ Delta_w Delta_v L \( A \) = 0 quad \( v \, w upright(" independent uniform in ") B_r \) \, #h(2em) Delta_(a v) L \( A \) = a Delta_v L \( A \) quad \( v upright(" uniform in ") B_r \) $ <eq:bank-tests>]
  at uniform $A$, with a separate law for each fixed scalar $a in bb(F)$.

Every displayed field value is evaluated through its selector difference and all masks. Queries are made even when a coefficient vanishes, keeping each law’s list length fixed.

All master-oracle query points have uniform marginals on $G$. Translations and block swaps are bijections. The maps $A mapsto A + v \( T \( A \) \)$, and the analogous tag shears, are bijections because they leave their source $T$ fixed; subtraction of the same shift is their inverse. Their compositions with selectors have the same property. Bank-test parameters are independent of the uniform base. A fixed mask at a uniform base is at most $q - 1$ times uniform on $cal(S)$, so we may use $B = q - 1$.

The honest construction above satisfies every law identically and has line degree at most two. It therefore proves perfect completeness, including the auxiliary parity identity. The witness-dependent fields are used only to prove completeness; all public test laws are specified without knowing a satisfying assignment.

=== 3.4 Deterministic correction of almost quadratic lines <deterministic-correction-of-almost-quadratic-lines>

The remaining issue is constant soundness. It is not enough for the identities to hold at most matrices, since the Boolean diagonals may be sparse. We first obtain exact line identities by correcting a small set. This is a local-to-global correction problem in the self-testing framework of Blum, Luby, and Rubinfeld #cite(label("BlumLubyRubinfeld1993")). The modal interpolation and transverse-grid consistency argument in the point-filling step has precedents in polynomial self-testing #cite(label("GemmellEtAl1991")) #cite(label("RubinfeldSudan1996")). The next lemma proves the required correction statement for our restricted distribution of directions, with one common high-mass set of good directions.

#thm([Lemma 3.5.])[
  #emph[Put $gamma = 10^(- 3)$. Suppose the line law of a function $P : G arrow.r bb(F)$ fails with probability at most $delta^2$, where $delta > 0$ satisfies 
#[#set math.equation(numbering: n => "(33)")
 $ 2 delta + lambda_1 & < gamma \/ 2 \,\
1 - 4 gamma - 4 delta - 2 \/ \( q - 1 \) & > delta + lambda_1 \,\
27 gamma + 5 delta & < 1 . $ <eq:correction-smallness>]

 There is a scalar-invariant set $H$ of directions of $sans(D)$-mass at least $1 - delta$, and a function $P'$ differing from $P$ on at most $2 delta$ of $G$, such that $t mapsto P' \( A + t h \)$ has degree at most two for every $A$ and $h in H$.]
] <lem:quadratic-correction>

#proof[
  Let $H$ consist of directions whose fraction of failing bases is at most $delta$. Mark initially those points whose fraction of failing directions is greater than $delta$, obtaining $D_0$ with $mu \( D_0 \) lt.eq delta$. Markov’s inequality also gives $sans(D) \( H \) gt.eq 1 - delta$. Both notions of line failure are unchanged by multiplying a direction by a nonzero scalar.
  Enlarge $D_0$ by adding an outside point $x$ whenever $bb(P)_h \[ x + h in D \] gt.eq gamma$. If $D_0$ has $k gt.eq 1$ points, the first set of size $2 k$, if reached, has internal directed edge mass at least $k gamma \/ \| G \|$: every added source point contributed that amount at its addition and those edges remain internal. Dividing by its density gives at least $gamma \/ 2$, contrary to Equation (22) and $2 delta + lambda_1 < gamma \/ 2$. If $k = 0$, no point can be added. Thus the final $D$ has density at most $2 delta$, and every point outside it has entry probability less than $gamma$ into $D$. Call these outside points clean.
  Fix $h in H$ and four distinct times $t_i$. Let $J$ be the set of bases whose four positions are clean but for which $sum_i alpha_i P \( A + t_i h \) eq.not 0$, using the interpolation coefficients of Equation (23). Then $mu \( J \) lt.eq delta$, because every such base has a failing $h$-line. For $A in J$, put $z_i = A + t_i h$. Sample an independent $k tilde.op sans(D)$ and a uniform $a in bb(F)^(*)$. Since $z_i in.not D_0$, all four functions $s mapsto P \( z_i + s k \)$ are quadratic except on an event of probability at most $4 delta$. On that event’s complement their relation discrepancy is a degree-two polynomial in $s$, nonzero at zero, and so is zero at at most two choices of $a in bb(F)^(*)$. Separately, each $z_i + a k$ is missing with probability at most $gamma$, since $a k$ has exactly law $sans(D)$. We do not condition these cleanliness bounds on line goodness. A union bound gives
  $ bb(P)_(k \, a) \[ A + a k in J \] gt.eq 1 - 4 delta - 4 gamma - frac(2, q - 1) . $
  The step $a k$ has law $sans(D)$, including at zero, so a nonempty $J$ would contradict Equation (22) and Equation (33). All four-position relations whose positions are clean are therefore exact.
  We now fill the missing points one at a time. Maintain that every assigned point has entry probability at most $gamma$ into the current missing set and that every $H$-direction four-position relation on assigned points is exact. If the missing set is nonempty, Equation (22) supplies a point $x$ inside it whose entry probability is at most $gamma$. Removing $x$ can only decrease all entry probabilities.
  Fix three distinct nonzero times $a_1 \, a_2 \, a_3$ and interpolation coefficients $ell_1 \, ell_2 \, ell_3$ for evaluation at zero. A direction $k$ predicts $sum_i ell_i P' \( x + a_i k \)$ if its three positions are already assigned, and gives an arbitrary fixed default otherwise. For independent $h \, k$, require the six axis points $x + a_i h \, x + a_j k$ and the nine grid points $x + a_i h + a_j k$ to be assigned. The six axis failures cost at most $6 gamma$. After an assigned first-axis point is exposed, the independent second direction reaches the missing set with probability at most $gamma$; the nine additional failures cost at most $9 gamma$. No independence among these fifteen events is asserted. Requiring $h \, k in H$ costs at most $2 delta$. On the resulting event, interpolation of the grid first by rows and then by columns shows that the two predictions agree, because all the relations used involve already assigned points.
  Let $pi_x$ be the full prediction distribution, defaults included. Its collision probability is at least $1 - 15 gamma - 2 delta$ and is at most its largest atom. Choose one modal value $m_x$ once and assign it to $x$. A random prediction equals $m_x$ and uses an already assigned triple except with probability at most $18 gamma + 2 delta$. At any old assigned center, the analogous prediction reproduces its value with an old assigned triple except with probability at most $3 gamma + delta$.
  Consider any fixed relation newly enabled by assigning $x$. A zero direction gives an automatic constant-line identity. Otherwise its four positions are distinct and only one is $x$. For a fresh transverse direction $k$, simultaneous correct interpolation from old assigned triples at its four centers fails with probability at most
  $ \( 18 gamma + 2 delta \) + 3 \( 3 gamma + delta \) = 27 gamma + 5 delta < 1 . $
  There is therefore such a $k$. Each of the three translated copies of the relation lies entirely in the old assigned set and is zero. Interpolating those three identities back recovers the old values and the already selected $m_x$, so the original relation is zero. Repeated grid positions cause no problem: they denote the same assigned value. A grid position equal to the still-missing center was already excluded by the old-assignment event.
  The modal value is fixed before the relation is considered. Different transverse directions may establish different deterministic relations for that same value; no union bound over relations or peeling steps is used. This proves the induction. At its completion all four-position relations hold in every direction in $H$. Interpolation at three distinct parameters and then at each fourth parameter proves the asserted line degree. Only the original enlarged set, of density at most $2 delta$, was changed. ◻
]

=== 3.5 Support gaps and exact bank affinity <support-gaps-and-exact-bank-affinity>

#thm([Lemma 3.6.])[
  #emph[Suppose a scalar-invariant set of directions has $sans(D)$-mass at least $1 - rho$, and $F : G arrow.r bb(F)$ has degree at most $D < q - 1$ on every line in those directions. Then either $F = 0$ identically or 
$ mu \( "supp" F \) gt.eq 1 - rho - frac(D, q - 1) - lambda_1 . $

]
] <lem:line-support-gap>

#proof[
  From a point $x$ of the support, sample $h tilde.op sans(D)$ and an independent uniform $a in bb(F)^(*)$. On a good direction, the nonzero line polynomial has at most $D$ roots among those scalars. Thus $x + a h$ is in the support with probability at least $1 - rho - D \/ \( q - 1 \)$. The law of $a h$ is the original direction law. Average over support points and apply Equation (22). ◻
]

Suppose now that every ordinary binary test law fails with probability at most $eta$. Decode the full mask vector to $P \( A \)$ wherever it is valid, and choose $P \( A \)$ arbitrarily otherwise. Acceptance of a binary test certifies both valid encodings at all its queried points and its field relation. Thus every decoded field law also fails with probability at most $eta$.

Let $Q$ be a fixed upper bound on the number of master-field queries in a law, counting repetitions; for example $Q = q + 32$ suffices for the displayed list. Put $delta = sqrt(eta)$ and apply Lemma 8. Replacing $P$ by $P'$ increases any field-law failure probability by at most $2 Q delta$, because each master query is uniform. Write

#[#set math.equation(numbering: n => "(34)")
 $ tau = eta + 2 Q delta . $ <eq:corrected-test-error>]

Intersect the pullbacks of $H$ under the three block permutations $pi_1 \, pi_2 \, pi_3$. Their common scalar-invariant direction set has missing mass at most $K_(upright("sw")) delta$, with $K_(upright("sw")) = 3$. Every fixed translate of every corrected proof field, and of every $X_i$, has line degree at most two on this common set. Lemma 9, with the conservative degree bound six, gives the support lower bound

#[#set math.equation(numbering: n => "(35)")
 $ kappa = 1 - K_(upright("sw")) delta - frac(6, q - 1) - lambda_1 $ <eq:kappa-support>]

for any nonzero discrepancy to which that degree bound applies.

First consider a fixed parameter in the assignment invariance test. Its discrepancy has degree at most two. If it is not identically zero, it fails on at least a $kappa$ fraction of bases. Hence at least a $1 - tau \/ kappa$ fraction of the tested translations preserve $X$ identically. Those translations form an additive subgroup. A subgroup of a finite additive group with density greater than one half is the whole group, since otherwise one of its disjoint cosets has the same size. Thus the assignment invariance is exact provided $tau \/ kappa < 1 \/ 2$.

For a bank $B_r$ and slack field $L$, fix $v$ and let

$ W_v = { w in B_r : Delta_v L \( A + w \) = Delta_v L \( A \) upright(" for every ") A } . $

This is the translation stabilizer of the function $Delta_v L$, hence a subgroup. Each fixed $\( v \, w \)$ discrepancy has line degree at most two. The fraction of pairs for which it is not identically zero is at most $tau \/ kappa$. If $tau \/ kappa < 1 \/ 16$, Markov’s inequality leaves more than three quarters of $v$ for which more than three quarters of $w$ are valid. For these $v$, $W_v = B_r$. The set

$ V = { v in B_r : Delta_v L upright(" is invariant under all ") B_r upright(" translations") } $

is also a subgroup. Indeed, for $u \, v in V$, the difference cocycle gives

$ Delta_(u + v) L \( A \) = Delta_u L \( A + v \) + Delta_v L \( A \) = Delta_u L \( A \) + Delta_v L \( A \) \, $

and $Delta_(- v) L \( A \) = - Delta_v L \( A - v \) = - Delta_v L \( A \)$. Thus $V = B_r$, and the map $v mapsto Delta_v L \( A \)$ is additive for every $A$.

For each fixed scalar $a$, the map $v mapsto \( Delta_(a v) L \( A \) - a Delta_v L \( A \) \)_(A in G)$ is now additive. Its kernel has density at least $1 - tau \/ kappa > 1 \/ 2$ by that scalar’s test and the support gap, and so equals $B_r$. This proves exact $bb(F)$-affinity in each required bank. There are only $q$ scalar laws, with $q$ fixed. The argument has exactified whole translation laws before introducing a basis of any bank.

We may now expand the shifts in Equation (30). For bases $\( e_i \)$ and $\( f_j \)$ of the two banks, exact separate affinity gives

#[#set math.equation(numbering: n => "(36)")
 $ Delta_(v \( T \)) Delta_(w \( T \)) L \( A \) = sum_(i \, j) v_i \( T \) w_j \( T \) Delta_(e_i) Delta_(f_j) L \( A \) . $ <eq:exact-bilinear-shift>]

Each coefficient function on the right is a fixed combination of translates of a selector difference of $P'$, so has line degree at most two. The coordinates of $v \( T \)$ and $w \( T \)$ have degree at most one on an $A$-line. The corresponding coordinates of $u \( T \)$ have degree at most two. The one-bank expansions have the same form with one fixed difference. Thus every slack term has line degree at most four. The main field products have degree at most four, and every public principal minor has degree at most one. The number of coefficients in Equation (36) does not affect the degree of their sum; every coefficient identity is already exact.

Every full identity discrepancy therefore has degree at most four on the common good directions and fails on at most a $tau$ fraction of bases. If $tau < kappa$, the support gap forces it to vanish identically. On Boolean diagonal $T$, the shifts $v \( T \)$ and $u \( T \)$ are zero. Both single differences and the mixed difference with $v \( T \) = 0$ therefore vanish, regardless of $w \( T \)$, and Equation (25) holds exactly. Every triple of Boolean addresses is available because $G_0$ contains all diagonal matrices. Exact invariance makes $X$ a well-defined function of its first block alone. The Booleanity identity assigns a bit to each Boolean address, and the gate identities exclude every falsifying clause pattern: if all three assigned bits matched a forbidden pattern, then $E_a = M_(a \, 1) = M_(a \, 2) = M_(a \, 3) = 1$, forcing $Y_a = Z_a = 1$ and contradicting $Y_a Z_a = 0$. This is a satisfying assignment to the input formula.

All required smallness conditions follow from a single fixed choice. With Equation (24) in force, put

$ d_0 = min {gamma / 16 \, frac(1, 16 K_(upright("sw"))) \, frac(1, 128 \( 1 + 2 Q \))} \, #h(2em) 0 < eta lt.eq d_0^2 . $

Then Equation (33) holds, $kappa gt.eq 1 - 1 \/ 16 - 1 \/ 16 - lambda_1 > 1 \/ 2$, and $tau lt.eq \( 1 + 2 Q \) sqrt(eta) lt.eq 1 \/ 128$. In particular $tau \/ kappa < 1 \/ 16$ and $tau < kappa$. No bound contains $d$ or $\| G \|$. An unsatisfiable formula must therefore have a law failing with probability greater than this $eta$.

Finally, the space $G$ has size $q^(O \( d \)) = 2^(O \( d \))$, and all test samplers enumerate fixed products of this space, fixed finite fields, and the $O \( d \)$-length pencil. Public table interpolation uses at most $2^(3 d)$ addresses and elementary linear algebra. Every arithmetic operation has polynomial bit complexity; seed probabilities are rational products of the reciprocals of these polynomial-size spaces. Query arity, number of laws, and all mask counts are constants. The pencil construction itself takes $2^(O \( d \))$ time by Lemma 2. These observations prove the size and sampler assertions and complete the proof of Theorem 4.

== 4 Primitive events and a valuation obstruction <sec:events>

Let $Omega = { 0 \, 1 }^(cal(S))$ be the cube of bit assignments for Theorem 4. A predicate is a Boolean function $R : Omega arrow.r { 0 \, 1 }$. We identify predicates that are equal as functions, regardless of their sampled descriptions. We write $R subset.eq R'$ when $R \( y \) lt.eq R' \( y \)$ for every $y in Omega$.

A #emph[primitive type] is a probability law $P_s$ on predicates, together with a specified number $p_s in \[ 0 \, 1 \]$. An #emph[ordered comparison] is a coupling of two specified primitive laws supported on pairs $R subset.eq R'$. The type index is part of the sampling data, but is not part of the predicate to which a valuation is applied.

#prodef([Definition 4.1.])[
  A Boolean valuation $H$ on the actual predicates is #emph[$zeta$-calibrated and ordered] if, for every primitive type and every specified comparison,
  #[#set math.equation(numbering: n => "(37)")
   $ lr(|bb(E)_(R tilde.op P_s) H \( R \) - p_s|) lt.eq zeta \, #h(2em) bb(P) \[ H \( R \) > H \( R' \) \] lt.eq zeta . $ <eq:primitive-calibration-order>]
]

#thm([Lemma 4.2.])[
  #emph[There is a fixed finite family of primitive types $\( P_s \, p_s \)$ and ordered comparisons, and a fixed $zeta > 0$, constructible in polynomial time from the input formula, with the following properties.]
  + #emph[Each predicate depends on boundedly many bit positions. All samplers are polynomially enumerable finite rational laws with inverse-polynomial positive seed probabilities.]
  + #emph[Constant-one and constant-zero types are included, with calibrations one and zero. Every comparison marginal is a primitive type, and every type has a comparison to the constant-one type.]
  + #emph[In a satisfiable instance, evaluation at the perfect assignment $y^(*)$ satisfies $bb(E)_(P_s) R \( y^(*) \) = p_s$ for every type.]
  + #emph[In an unsatisfiable instance, no Boolean valuation is $zeta$-calibrated and ordered.]
  #emph[The numbers $p_s$, the number of types and comparisons, and $zeta$ are independent of the input size.]
] <lem:event-obstruction>

=== 4.1 The primitive types <the-primitive-types>

Use Theorem 4 with pair bound $lambda lt.eq 10^(- 6)$. There are two basic literal types:

$ L_i^a \( y \) = upright(bold(1))_({ y_i = a }) \, #h(2em) L_(i \, j)^a \( y \) = upright(bold(1))_({ y_i + y_j = a }) \, $

where $i$ is uniform in $cal(S)$, $\( i \, j \)$ is uniform in $cal(S)^2$, and the target $a in bb(F)_2$ is an independent uniform bit. Both calibrations are $1 \/ 2$.

We use three even-parity tuple experiments:

+ Four base expressions $y_(i_1) \, dots.h \, y_(i_4)$, with $\( i_1 \, dots.h \, i_4 \)$ from the auxiliary law of Theorem 4.
+ Four sum expressions $y_(i_1) + y_(j_1) \, dots.h \, y_(i_4) + y_(j_4)$, using two independent copies of that auxiliary law.
+ The three expressions $y_i \, y_j \, y_i + y_j$, for independent uniform $i \, j$.

For each experiment of length $k in { 3 \, 4 }$, independently sample a uniform even-parity target vector $a in bb(F)_2^k$. Add the type of the match event

$ M \( y \) = upright(bold(1))_({ \( upright("the ") k upright(" expressions at ") y \) = a }) $

and the type of its complement $overline(M) = 1 - M$. Their calibrations are $2^(- \( k - 1 \))$ and $1 - 2^(- \( k - 1 \))$. For each occurrence, add the comparisons

#[#set math.equation(numbering: n => "(38)")
 $ M subset.eq L^(a_ell) \, #h(2em) L^(1 - a_ell) subset.eq overline(M) $ <eq:match-complement-comparisons>]

with the questions and targets sampled in that experiment. Their literal marginals are the basic base or sum type, since each target coordinate is uniform and independent of the questions. In the perfect assignment all three response tuples have even parity, so exactly one of the $2^(k - 1)$ targets matches.

For each ordinary law in Theorem 4, let its arity be $L$ and let $T_e$ be its acceptance predicate for public seed $e$, with questions $i_1 \, dots.h \, i_L$. Independently choose $a in bb(F)_2^L$ uniformly and add the match-and-pass event

#[#set math.equation(numbering: n => "(39)")
 $ R_(e \, a) \( y \) = T_e \( a \) product_(ell = 1)^L L_(i_ell)^(a_ell) \( y \) \, #h(2em) p_s = 2^(- L) . $ <eq:match-and-pass>]

It has the stated calibration in the perfect assignment, which passes every seeded test. Compare it to each containing literal $L_(i_ell)^(a_ell)$, and include the induced literal marginal as a type of calibration $1 \/ 2$. These additional question marginals are at most the fixed factor $B$ times uniform. If the seeded test rejects $a$, Equation (39) is the constant-zero predicate.

Finally include the two constant types and, for every type $P_s$, the comparison $\( R \, 1 \)$ with $R tilde.op P_s$. This specifies all data in Lemma 11. The finite sampling and arity properties follow from Theorem 4, since all products and target spaces have fixed size. We prove its unsatisfiable-instance assertion next.

=== 4.2 A quantitative tag–dictator dichotomy <a-quantitative-tagdictator-dichotomy>

Suppose $H$ satisfies Equation (37). For either the base or sum question space, write

$ B \( q \, a \) = 2 H \( L_q^a \) - 1 in { - 1 \, 1 } \, #h(2em) b \( q \) = frac(B \( q \, 0 \) + B \( q \, 1 \), 2) . $

A question is a #emph[tag] when its two signs agree, in which case $b \( q \) = plus.minus 1$; otherwise it is a #emph[dictator], with $b \( q \) = 0$. Let $delta$ be the tag fraction. Literal calibration gives $\| bb(E) b \| lt.eq 2 zeta$, and $bb(E) b^2 = delta$.

Consider its four-occurrence experiment and a uniform even target vector, and put $B_ell = B \( q_ell \, a_ell \)$. Distinct target bits are independent. The question pair operator has norm at most $lambda$, also for sums by the tensor assertion of Theorem 4. Hence, for $ell eq.not r$,

#[#set math.equation(numbering: n => "(40)")
 $ bb(E) B_ell B_r = bb(E) b \( q_ell \) b \( q_r \) lt.eq 4 zeta^2 + lambda delta . $ <eq:literal-sign-correlation>]

The first comparisons in Equation (38) give

$ bb(P) \[ B_1 = dots.h.c = B_4 = 1 \] gt.eq 1 / 8 - 5 zeta . $

For the second comparisons, the event $H \( overline(M) \) = 0$ has probability at least $1 \/ 8 - zeta$, and outside the four comparison failures all opposite literals have value zero. Complementing all four target bits preserves the uniform even-target law. Therefore

$ bb(P) \[ B_1 = dots.h.c = B_4 = - 1 \] gt.eq 1 / 8 - 5 zeta . $

The squared sum of four signs is $16$ on these two constant-sign vectors, $4$ when their product is negative, and zero otherwise. Combining this identity with Equation (40) gives, for $zeta lt.eq 1$,

#[#set math.equation(numbering: n => "(41)")
 $ bb(P) \[ B_1 B_2 B_3 B_4 = - 1 \] lt.eq 3 lambda delta + 40 zeta + 12 zeta^2 lt.eq 3 lambda delta + 52 zeta . $ <eq:negative-product-bound>]

When some but not all questions are tags, the product of the four signs contains the product of a nonempty proper subset of the target signs. Under uniform even targets that product is an unbiased sign. Thus negative product has conditional probability one half. On the other hand, the probability that the first question is a tag and the second is not is at least $delta \( 1 - delta \) - lambda delta$, by the pair-operator bound applied to the tag indicator. Consequently

$ delta \( 1 - delta \) lt.eq 7 lambda delta + 104 zeta . $

For $lambda lt.eq 1 \/ 28$, if $delta lt.eq 1 \/ 2$ this implies $delta lt.eq 416 zeta$, and if $delta > 1 \/ 2$ it implies $1 - delta lt.eq 7 lambda + 208 zeta$. We have proved

#[#set math.equation(numbering: n => "(42)")
 $ delta lt.eq 416 zeta quad upright("or") quad 1 - delta lt.eq 7 lambda + 208 zeta $ <eq:tag-dichotomy>]

for each of the two basic literal types.

=== 4.3 The tag regime is impossible <the-tag-regime-is-impossible>

We give explicit error bounds for this step. Assume $lambda lt.eq 10^(- 6)$ and $zeta lt.eq 10^(- 8)$, and suppose the base literal type is in the second regime of Equation (42). Put

$ e_0 = 7 lambda + 208 zeta \, #h(2em) h_0 = e_0 + 2 zeta \, #h(2em) D_0 = 3 e_0 + 6 zeta . $

Extend the base tag sign arbitrarily to a sign $b_i$ on all of $cal(S)$. The non-tag fraction is at most $e_0$, so $\| bb(E) b_i \| lt.eq h_0$. If $r_s = bb(P) \[ b_i = s \]$ for $s = plus.minus 1$, then $\| r_s - 1 \/ 2 \| lt.eq h_0 \/ 2$ and $r_s^2 lt.eq 1 \/ 4 + h_0$.

In the triple experiment, match calibration and its three containing-literal comparisons give an all-positive literal-sign vector with probability at least $1 \/ 4 - 4 zeta$ under even targets. Complement calibration and the opposite-literal comparisons give an all-negative vector with the same lower bound under the complemented, now odd, target law. Outside the event that one of the two base questions is not a tag, of probability at most $2 e_0$, these occurrences require $b_i = b_j = 1$ and $b_i = b_j = - 1$, respectively. The sum target is a uniform bit under both target laws, independent of $i \, j$. Subtracting these lower bounds from the respective masses $r_s^2$ yields

#[#set math.equation(numbering: n => "(43)")
 $ bb(P)_(i \, j \, a) #scale(x: 120%, y: 120%)[\[] b_i = b_j = s \, med B \( \( i \, j \) \, a \) eq.not s #scale(x: 120%, y: 120%)[\]] lt.eq h_0 + 4 zeta + 2 e_0 = D_0 \, #h(2em) s = plus.minus 1 . $ <eq:same-class-sum-error>]

If a sum question is not a tag of sign $s$, at least one of its two targets has sign different from $s$. Thus

$ bb(P)_(i \, j) \[ b_i = b_j = s \, med \( i \, j \) upright(" is not a tag of sign ") s \] lt.eq 2 D_0 . $

Since $r_(+)^2 + r_(-)^2 gt.eq 1 \/ 2$, the sum tag fraction is at least $1 \/ 2 - 4 D_0 > 416 zeta$. Its dichotomy in Equation (42) therefore also gives non-tag fraction at most $e_0$.

Let $v \( i \, j \)$ be the sum tag sign, extended to the remaining pairs by a fixed sign. We take a symmetric extension: the literal predicates for $\( i \, j \)$ and $\( j \, i \)$ are equal, so the actual tag statuses and tag signs are already symmetric. In particular

#[#set math.equation(numbering: n => "(44)")
 $ bb(P) \[ b_i = b_j = s \, med v \( i \, j \) eq.not s \] lt.eq 2 D_0 . $ <eq:sum-sign-on-classes>]

For two independent auxiliary four-tuples $bold(i)$ and $bold(j)$, Equation (41) and the at-most $4 e_0$ chance of a non-tag sum question imply

#[#set math.equation(numbering: n => "(45)")
 $ bb(P) [product_(ell = 1)^4 v \( i_ell \, j_ell \) = - 1] lt.eq E_4 := 3 lambda + 52 zeta + 4 e_0 . $ <eq:sum-four-product>]

Exchangeability permits swapping $j_1$ and $j_2$ without changing this bound. Where both fourfold products are positive, cancellation of their last two factors gives

$ v \( i_1 \, j_1 \) v \( i_2 \, j_2 \) = v \( i_1 \, j_2 \) v \( i_2 \, j_1 \) . $

Thus this rectangle identity fails with probability at most $2 E_4$ when $\( i_1 \, i_2 \)$ and $\( j_1 \, j_2 \)$ are independent copies of the auxiliary pair marginal.

We next replace both pair marginals by independent uniform draws. For fixed $i \, i'$, set $f \( j \) = v \( i \, j \) v \( i' \, j \)$. The pair-operator bound gives

$ lr(|bb(E)_(upright("pair")) f \( j \) f \( j' \) - \( bb(E) f \)^2|) lt.eq lambda "Var" \( f \) lt.eq lambda . $

This changes the expectation of the rectangle sign by at most $lambda$. After replacing the $j$ pair, apply the same calculation to the $i$ pair with $j \, j'$ fixed. The rectangle sign has therefore changed in expectation by at most $2 lambda$. Its failure probability for four independent uniform indices is at most

#[#set math.equation(numbering: n => "(46)")
 $ R_0 := 2 E_4 + lambda . $ <eq:independent-rectangle-error>]

Average over an independent reference pair $\( i_0 \, j_0 \)$ and fix one for which the rectangle failure probability over $i \, j$ is at most $R_0$. Define

$ u \( i \) = v \( i \, j_0 \) \, #h(2em) w \( j \) = v \( i_0 \, j \) v \( i_0 \, j_0 \) . $

Then $bb(P) \[ v \( i \, j \) eq.not u \( i \) w \( j \) \] lt.eq R_0$. Symmetry of $v$ gives $bb(P) \[ u \( i \) w \( j \) eq.not u \( j \) w \( i \) \] lt.eq 2 R_0$. Equivalently, the signs $a \( i \) = u \( i \) w \( i \)$ at two independent indices disagree with probability at most $2 R_0$. Choose the majority sign $c$ of $a$. If its minority mass is $m lt.eq 1 \/ 2$, the disagreement probability is $2 m \( 1 - m \) gt.eq m$, so $m lt.eq 2 R_0$. Therefore $w \( i \) = c u \( i \)$ outside a set of mass at most $2 R_0$, and

#[#set math.equation(numbering: n => "(47)")
 $ bb(P) \[ v \( i \, j \) eq.not c thin u \( i \) u \( j \) \] lt.eq 3 R_0 . $ <eq:symmetric-sign-factorization>]

Take the base-sign class $s = - c$. Since $h_0 < 1 \/ 2$, it has mass $r_s gt.eq 1 \/ 4$. On two independent draws from this class, the probability that $u \( i \) u \( j \) = 1$ is at least one half: if the conditional positive mass of $u$ is $a$, this probability is $a^2 + \( 1 - a \)^2 gt.eq 1 \/ 2$. Consequently

$ bb(P) \[ b_i = b_j = s \, med c thin u \( i \) u \( j \) eq.not s \] gt.eq r_s^2 \/ 2 gt.eq 1 \/ 32 . $

Equations (44) and (47) upper-bound the same probability by $2 D_0 + 3 R_0$. But direct substitution gives

$ 2 D_0 + 3 R_0 = 231 lambda + 6564 zeta < 1 \/ 32 $

under the stipulated bounds. The other inequalities used above, $h_0 < 1 \/ 2$ and $1 \/ 2 - 4 D_0 > 416 zeta$, follow from the same bounds. This contradiction excludes the base-tag regime. We conclude

#[#set math.equation(numbering: n => "(48)")
 $ bb(P)_i \[ i upright(" is not a dictator") \] lt.eq 416 zeta . $ <eq:base-dictators>]

=== 4.4 Decoding the ordinary tests <decoding-the-ordinary-tests>

At each dictator question $i$, assign the unique bit $y_i$ whose literal has $H \( L_i^(y_i) \) = 1$; assign arbitrary bits to the other questions. This is one assignment on $cal(S)$, because $H$ is a function of the actual predicates. For an ordinary law of arity $L$, its probability of querying any non-dictator is at most $416 L B zeta$ by Equation (48) and the marginal bound. Its $L$ containing-literal comparisons fail with total probability at most $L zeta$ in the seed-and-target experiment. The constant-zero type has $H \( 0 \) = 0$, since $zeta < 1$.

Outside these two bad events, if $H \( R_(e \, a) \) = 1$ in Equation (39), all targets agree with the assigned bits and $T_e \( a \) = 1$. Conversely, an independent uniform target equals the assigned response vector with probability exactly $2^(- L)$, even with repeated questions. It follows that

$ 2^(- L) - zeta lt.eq bb(E) H \( R_(e \, a) \) lt.eq 2^(- L) bb(P)_e \[ T_e \( y_(i_1) \, dots.h \, y_(i_L) \) = 1 \] + \( 416 L B + L \) zeta . $

Thus the failure probability of this law is at most

$ 2^L \( 1 + L + 416 L B \) zeta . $

There are only finitely many ordinary laws. Choose the fixed $zeta lt.eq 10^(- 8)$ small enough that this expression is at most $eta \/ 2$ for each of them, where $eta$ is the soundness constant of Theorem 4. In an unsatisfiable instance this contradicts that theorem. This completes the proof of Lemma 11.

For the next section, fix any positive mixture weights $\( omega_s \)_s$ with $sum_s omega_s = 1$, for example equal weights, and let $P_(*) = sum_s omega_s P_s$, retaining the type as sampling data. Put

#[#set math.equation(numbering: n => "(49)")
 $ p_(*) = sum_s omega_s p_s . $ <eq:primitive-mixture>]

The two constant types imply $0 < p_(*) < 1$. All these quantities are fixed independently of the instance size. Equal predicates in different types remain the same argument of a valuation; only their sampling probabilities differ.

== 5 From rare conjunctions to a common valuation <sec:entropy>

We prove a general statement about primitive predicates. Its constants do not depend on the number of predicates or on the smallest probability of one of them. This uniformity will allow us to apply the statement to the systems in Section 4 as the input size grows.

Conditioning on successful repetitions and distributing the resulting relative-entropy cost among coordinates appears in the parallel-repetition proofs of Raz #cite(label("Raz1998")) and Holenstein #cite(label("Holenstein2009")) Section 4. Here the entropy estimates feed a clipping and thresholding argument that produces one valuation of actual predicates, simultaneously satisfying the type calibrations and comparison laws. We prove this conclusion with estimates independent of atom probabilities.

Let $cal(X)$ be a finite set, and identify a predicate on $cal(X)$ with its function $R : cal(X) arrow.r { 0 \, 1 }$. Fix a finite set $cal(T)$ of primitive types. Type $s$ has a probability law $P_s$ on predicates and a prescribed number $p_s in \[ 0 \, 1 \]$. Fix weights $omega_s > 0$ with $sum_(s in cal(T)) omega_s = 1$. A sample from $P_(*)$ first chooses $s$ with probability $omega_s$ and then chooses $R$ from $P_s$; we retain the type as part of the sample. Thus identical predicates can occur under different types. Auxiliary sampling presentations may likewise be retained, but all response functions below act on the actual predicates, not their presentations. Write

$ p_(*) = sum_(s in cal(T)) omega_s p_s \, #h(2em) 0 < p_(*) < 1 . $

Assume that a designated type $top$ is concentrated on the constant-one predicate $upright(bold(1))$ and has $p_top = 1$.

Fix also a finite list $cal(C)$ of comparison laws. A comparison $Pi in cal(C)$ couples two primitive predicates $\( R \, R' \)$ with designated marginal laws $P_(s \( Pi \))$ and $P_(s' \( Pi \))$, and satisfies $R lt.eq R'$ pointwise. The list contains, for every type $s$, the comparison from $R tilde.op P_s$ to $upright(bold(1))$. A Boolean valuation is a single function $H$ of actual predicates. Its calibration and order requirements at tolerance $zeta > 0$ are

#[#set math.equation(numbering: n => "(50)")
 $ lr(|bb(E)_(P_s) H \( R \) - p_s|) < zeta quad \( s in cal(T) \) \, #h(2em) bb(P)_Pi #scale(x: 120%, y: 120%)[\(] H \( R \) > H \( R' \) #scale(x: 120%, y: 120%)[\)] < zeta quad \( Pi in cal(C) \) . $ <eq:entropy-valuation-target>]

For an integer $t gt.eq 1$, a type pattern $bold(s) = \( s_1 \, dots.h \, s_t \)$ means independent draws $R_i tilde.op P_(s_i)$. Put

$ r = and.big_(i = 1)^t R_i \, #h(2em) p_(bold(s)) = product_(i = 1)^t p_(s_i) . $

A lifted comparison chooses one coordinate from a prescribed law $\( R \, R' \) tilde.op Pi$, and chooses the other $t - 1$ predicates independently from specified primitive types, independently of $\( R \, R' \)$. It uses these same context predicates on both sides, giving a pair of conjunctions $r lt.eq r'$. Bounds for all such type patterns and comparisons also hold when any of the context types are independently mixed with the weights $omega_s$, simply by averaging.

#thm([Lemma 5.1.])[
  (Rare-event criterion).  #emph[Fix the numerical type data, the comparison-type pairs, positive constants $b_0 \, K_0 \, B_0$, and a tolerance $zeta > 0$. There is an integer $t_0$ such that, for every $t gt.eq t_0$, there is $epsilon_0 \( t \) > 0$ with the following property. Set $p = p_(*)^t$ and take $0 < epsilon lt.eq epsilon_0 \( t \)$. Suppose that $0 < v lt.eq B_0$ and that $W$ is a Boolean function of the actual conjunction predicate satisfying 
#[#set math.equation(numbering: n => "(51)")
 $ bb(P)_(P_(*)^t) \( W \( r \) = 1 \) & gt.eq b_0 v p \,\
bb(P)_(bold(s)) \( W \( r \) = 1 \) & lt.eq v #scale(x: 120%, y: 120%)[\(] K_0 p_(bold(s)) + epsilon #scale(x: 120%, y: 120%)[\)] quad upright("for every type pattern ") bold(s) \,\
bb(P) #scale(x: 120%, y: 120%)[\(] W \( r \) > W \( r' \) #scale(x: 120%, y: 120%)[\)] & lt.eq epsilon v quad upright("for every lifted comparison.") $ <eq:entropy-iid-success>]

 Then there exists a single Boolean valuation $H$ satisfying Equation (50).]
  #emph[The choices of $t_0$ and $epsilon_0 \( t \)$ depend only on $b_0 \, K_0 \, B_0 \, zeta$, the finite type and comparison lists, and $\( omega_s \, p_s \)_(s in cal(T))$. They are uniform in $cal(X)$, the primitive supports, their atom probabilities, and the particular comparison couplings with the prescribed marginals. Types with $p_s = 0$ are allowed.]
] <lem:rare-event>

#proof[
  We first bound the normalization of the successful event, then expose a common conditional density. We control entropy loss in two clipping steps, then deduce concentration near the endpoints of a fixed interval. Finally, one prefix and one threshold will satisfy every calibration and order requirement simultaneously.
  All logarithms are natural, and $0 log 0$ is interpreted as zero. We give quantitative estimates which also establish the asserted uniformity. Throughout the proof, an expectation over a prefix is taken under the success-conditioned law defined below, unless another law is indicated.
  ===== 5.1 Entropy and a lower bound on the normalization. <entropy-and-a-lower-bound-on-the-normalization.>
  Let $Y_i$ be the full marked primitive sample in coordinate $i$, and let $R \( Y_i \)$ denote its predicate. Set
  $ Z = bb(P)_(P_(*)^t) (W (and.big_(i = 1)^t R \( Y_i \)) = 1) \, #h(2em) Q = P_(*)^t (thin dot.op #h(0.27778em) mid(bar.v) #h(0.27778em) W (and.big_(i = 1)^t R \( Y_i \)) = 1) . $
  Equation (51) ensures $Z > 0$. The law $Q$ is exchangeable: permuting its coordinates preserves both the product reference law and the conjunction on which $W$ is evaluated.
  For $0 lt.eq k lt.eq t$, let $Q_k$ be its first-$k$-coordinate marginal and put
  $ I_k = "D" \( Q_k bar.v.double P_(*)^k \) \, #h(2em) I_0 = 0 . $
  For a density $f$ relative to a probability law $P$, we use $"D" \( f P bar.v.double P \) = integral f log f thin upright(d) P$. Factoring joint densities gives the chain rule
  $ I_k - I_(k - 1) = bb(E)_(Q_(k - 1)) "D" #scale(x: 120%, y: 120%)[\(] Q \( Y_k in dot.op divides Y_1 \, dots.h \, Y_(k - 1) \) bar.v.double P_(*) #scale(x: 120%, y: 120%)[\)] . $
  These increments are nondecreasing. Indeed, the conditional law of $Y_(k + 1)$ given $Y_1 \, dots.h \, Y_(k - 1)$ is a mixture of the laws obtained by also conditioning on $Y_k$. Convexity of $x log x$ shows that this extra conditioning can only increase expected relative entropy. Exchangeability identifies the expression with the shorter conditioning with $I_k - I_(k - 1)$. Consequently
  #[#set math.equation(numbering: n => "(52)")
   $ I_j lt.eq j / t I_t \, #h(2em) I_(j + 1) - I_j gt.eq I_j / j quad \( 1 lt.eq j < t \) . $ <eq:entropy-convex-increments>]
  Since $Q$ has density $1 \/ Z$ on the success event,
  #[#set math.equation(numbering: n => "(53)")
   $ I_t = log \( 1 \/ Z \) lt.eq log \( 1 \/ v \) + t L - log b_0 \, #h(2em) L = log \( 1 \/ p_(*) \) > 0 . $ <eq:entropy-total>]
  Take $t gt.eq 4$, set $j = ⌊t \/ 2⌋$ and $m = t - j$, and replace the last $m$ predicates successively by $upright(bold(1))$. If $W$ changes from one to zero during this procedure, at least one of the lifted comparisons to $upright(bold(1))$ fails. At each step the other coordinates are independent mixture draws or already fixed constant-one predicates. Averaging Equation (51) and then taking a union bound gives
  $ delta := Q (W (and.big_(i = 1)^j R \( Y_i \)) = 0) lt.eq frac(m epsilon v, Z) lt.eq frac(t epsilon, b_0 p) . $
  Here and below, adjoining constant-one predicates does not change the argument of $W$. Averaging Equation (51) over the first $j$ types gives
  $ P_(*)^j (W (and.big_(i = 1)^j R \( Y_i \)) = 1) lt.eq v #scale(x: 120%, y: 120%)[\(] K_0 e^(- j L) + epsilon #scale(x: 120%, y: 120%)[\)] . $
  Coarsen the relative entropy to this binary event. Explicitly, if its probabilities under $Q_j$ and $P_(*)^j$ are $q$ and $a$, respectively, then $q = 1 - delta$ by the definition of $delta$. Convexity on the event and its complement yields
  $ I_j gt.eq q log q / a + \( 1 - q \) log frac(1 - q, 1 - a) gt.eq q log \( 1 \/ a \) - log 2 . $
  The last inequality uses the upper bound $log 2$ on binary entropy and $- log \( 1 - a \) gt.eq 0$; endpoint cases follow by limits. Substituting the lower bound on $log \( 1 \/ a \)$ is valid even when that bound is negative, since its multiplier is exactly $q = 1 - delta gt.eq 0$. Thus, with $a_v = log \( 1 \/ v \)$,
  #[#set math.equation(numbering: n => "(54)")
   $ I_j gt.eq \( 1 - delta \) #scale(x: 120%, y: 120%)[\(] a_v + j L - log \( K_0 + epsilon e^(j L) \) #scale(x: 120%, y: 120%)[\)] - log 2 . $ <eq:entropy-prefix-lower>]
  Impose the explicit smallness condition
  #[#set math.equation(numbering: n => "(55)")
   $ frac(t^2 epsilon, p) lt.eq c_0 \, #h(2em) c_0 = min { b_0 \/ 8 \, 1 } . $ <eq:entropy-epsilon-small>]
  It implies $delta lt.eq 1 \/ \( 8 t \)$, $delta j L lt.eq L \/ 16$, $1 - delta - j \/ t gt.eq 3 \/ 8$, and $epsilon e^(j L) lt.eq 1$. Combining Equations (52)–(54) gives
  $ \( 1 - delta - j \/ t \) a_v lt.eq delta j L + \( 1 - delta \) log \( K_0 + epsilon e^(j L) \) + log 2 - \( j \/ t \) log b_0 . $
  Define constants, independent of $t$ and all primitive supports, by
  $ R_0 & = L \/ 16 + log \( K_0 + 1 \) + log 2 + 1 / 2 lr(|log b_0|) \,\
A_v & = 8 / 3 R_0 \, #h(2em) c_v = e^(- A_v) \, #h(2em) c_z = b_0 c_v . $
  The preceding inequality implies $a_v lt.eq A_v$, hence
  #[#set math.equation(numbering: n => "(56)")
   $ v gt.eq c_v \, #h(2em) Z gt.eq c_z p . $ <eq:entropy-normalization-lower>]
  This derivation does not assume $v lt.eq 1$. The other hypothesis, $v lt.eq B_0$, gives the separate bound $\( 1 - delta \) a_v gt.eq - max { log B_0 \, 0 }$. Therefore Equation (54) also gives
  #[#set math.equation(numbering: n => "(57)")
   $ I_j gt.eq j L - C_I \, #h(2em) C_I = L \/ 16 + log \( K_0 + 1 \) + log 2 + max { log B_0 \, 0 } . $ <eq:entropy-prefix-rate>]
  If $c_v > B_0$, the assumptions were inconsistent and there is nothing further to prove.
  ===== 5.2 A common conditional density and concentration of types. <a-common-conditional-density-and-concentration-of-types.>
  For a full ordered prefix $D = \( Y_1 \, dots.h \, Y_j \)$, write $R_D = and.big_(i = 1)^j R \( Y_i \)$ and set
  $ Z_D & = bb(E)_(P_(*)^m) W (R_D and and.big_(i = 1)^m R \( Y_i \)) \,\
U_D \( R \) & = bb(E)_(P_(*)^(m - 1)) W (R_D and R and and.big_(i = 1)^(m - 1) R \( Y_i \)) . $
  The density of the $Q$-prefix law relative to $P_(*)^j$ is $Z_D \/ Z$. In particular $Z_D > 0$ for $Q$-almost every prefix. On those prefixes define
  #[#set math.equation(numbering: n => "(58)")
   $ f_D \( R \) = frac(U_D \( R \), Z_D) . $ <eq:entropy-common-density>]
  Then $f_D \( R \( Y \) \)$ is the conditional next-coordinate density relative to $P_(*)$, so
  $ 0 lt.eq f_D lt.eq 1 \/ Z_D \, #h(2em) integral f_D thin upright(d) P_(*) = 1 . $
  Equation (58) defines its value in terms of the predicate alone, even for predicates with several presentations or occurring in several types. The entropy chain rule and Equations (52) and (57) show that
  #[#set math.equation(numbering: n => "(59)")
   $ bb(E)_D integral f_D log f_D thin upright(d) P_(*) gt.eq L - C_I \/ j . $ <eq:entropy-next-lower>]
  Put
  $ pi_s = frac(omega_s p_s, p_(*)) \, #h(2em) u = frac(epsilon, b_0 p) \, #h(2em) mu_s \( D \) = omega_s bb(E)_(P_s) f_D \( R \) . $
  The vector $pi$ is a probability vector, possibly with zero entries. For every full type sequence $bold(s)$, Equations (51) and (51) give
  #[#set math.equation(numbering: n => "(60)")
   $ Q #scale(x: 120%, y: 120%)[\(] upright("types") = bold(s) #scale(x: 120%, y: 120%)[\)] lt.eq K_0 / b_0 product_(i = 1)^t pi_(s_i) + u product_(i = 1)^t omega_(s_i) . $ <eq:entropy-type-domination>]
  For a fixed $s$, let $F_s$ be its empirical frequency among the $m$ suffix coordinates. Under the product law $pi^(⊗ t)$,
  $ bb(E) lr(|F_s - pi_s|) lt.eq sqrt("Var" \( F_s \)) = sqrt(frac(pi_s \( 1 - pi_s \), m)) lt.eq frac(1, 2 sqrt(m)) . $
  Under any law, $lr(|F_s - pi_s|) lt.eq 1$. Applying the domination in Equation (60) to this nonnegative function therefore gives $bb(E)_Q lr(|F_s - pi_s|) lt.eq R_t$, where
  #[#set math.equation(numbering: n => "(61)")
   $ R_t = frac(K_0, 2 b_0 sqrt(m)) + u . $ <eq:entropy-type-rate>]
  Fixing the entire ordered prefix $D$, including its predicates and any presentation marks, still leaves an exchangeable suffix: its reference law is a product, and its conditioning event depends on that suffix only through its conjunction with $R_D$. Hence $bb(E)_Q \( F_s divides D \) = mu_s \( D \)$. Conditional Jensen gives
  #[#set math.equation(numbering: n => "(62)")
   $ bb(E)_D lr(|mu_s \( D \) - pi_s|) lt.eq R_t . $ <eq:entropy-type-conditional-rate>]
  In particular, with $A = 1 \/ p_(*)$ and $H_max = 1 \/ omega_top$,
  #[#set math.equation(numbering: n => "(63)")
   $ 0 lt.eq f_D \( upright(bold(1)) \) lt.eq H_max \, #h(2em) bb(E)_D lr(|f_D \( upright(bold(1)) \) - A|) lt.eq R_t \/ omega_top . $ <eq:entropy-one-control>]
  Indeed $mu_top \( D \) = omega_top f_D \( upright(bold(1)) \)$ and $pi_top = A omega_top$. Since $p_(*) gt.eq omega_top$, we also have $H_max gt.eq A > 1$.
  ===== 5.3 Cancellation of the prefix likelihood. <cancellation-of-the-prefix-likelihood.>
  For any primitive comparison $\( R \, R' \) tilde.op Pi$, convexity of the positive part and the use of a shared suffix in $U_D \( R \)$ and $U_D \( R' \)$ imply
  #[#set math.equation(numbering: n => "(64)")
   $ bb(E)_D bb(E)_Pi \( f_D \( R \) - f_D \( R' \) \)_(+) & = 1 / Z bb(E)_(D tilde.op P_(*)^j) [upright(bold(1))_({ Z_D > 0 }) bb(E)_Pi #scale(x: 120%, y: 120%)[\(] U_D \( R \) - U_D \( R' \) #scale(x: 120%, y: 120%)[\)]_(+)]\
 & lt.eq 1 / Z bb(E)_(D \, Pi \, upright("suffix")) upright(bold(1))_({ W \( R_D and R and R_(upright("suffix")) \) > W \( R_D and R' and R_(upright("suffix")) \) })\
 & lt.eq frac(epsilon v, Z) lt.eq u . $ <eq:entropy-comparison-density>]
  In the middle expectation the prefix and suffix are independent product mixture draws, independent of the coupled pair. The last bound is thus an average of Equation (51) with its one tested coordinate and $t - 1$ shared context coordinates. The factor $Z_D$ from the prefix law has canceled the denominator of $f_D$. Averaging the comparisons to $upright(bold(1))$ over the first marginal type also gives
  #[#set math.equation(numbering: n => "(65)")
   $ bb(E)_D integral \( f_D - f_D \( upright(bold(1)) \) \)_(+) thin upright(d) P_(*) lt.eq u . $ <eq:entropy-first-clip-mass>]
  ===== 5.4 Clipping, including the rare-prefix entropy loss. <clipping-including-the-rare-prefix-entropy-loss.>
  The density now satisfies the required mean and order estimates. We next retain enough of its entropy during clipping to force concentration near zero and $A$. Write $phi \( x \) = x log x$ for $x > 0$, with $phi \( 0 \) = 0$, and set
  $ g_D = min { f_D \, f_D \( upright(bold(1)) \) } \, #h(2em) hat(f)_D = min { g_D \, A } . $
  The first-moment losses are bounded separately from the entropy:
  #[#set math.equation(numbering: n => "(66)")
   $ bb(E)_D integral \( f_D - g_D \) thin upright(d) P_(*) & lt.eq u \,\
bb(E)_D integral \( g_D - hat(f)_D \) thin upright(d) P_(*) & lt.eq bb(E)_D \( f_D \( upright(bold(1)) \) - A \)_(+) lt.eq R_t \/ omega_top . $ <eq:entropy-clipping-mass>]
  In particular,
  #[#set math.equation(numbering: n => "(67)")
   $ 0 lt.eq 1 - bb(E)_D integral hat(f)_D thin upright(d) P_(*) lt.eq u + R_t \/ omega_top . $ <eq:entropy-clipped-mass>]
  Take $t$ large enough that $beta = p^2 lt.eq e^(- 1)$, and consider the prefix event $cal(B)_beta = { 0 < Z_D < beta }$. Since $f_D lt.eq 1 \/ Z_D$ and $integral f_D thin upright(d) P_(*) = 1$,
  $ integral phi \( f_D \)_(+) thin upright(d) P_(*) lt.eq log \( 1 \/ Z_D \) . $
  Also $phi \( g_D \) gt.eq - 1 \/ e$ pointwise. Using the actual prefix density $Z_D \/ Z$ therefore bounds the signed entropy loss by
  #[#set math.equation(numbering: n => "(68)")
   $ bb(E)_D [upright(bold(1))_(cal(B)_beta) integral #scale(x: 120%, y: 120%)[\(] phi \( f_D \) - phi \( g_D \) #scale(x: 120%, y: 120%)[\)] thin upright(d) P_(*)] & lt.eq 1 / Z bb(E)_(P_(*)^j) [upright(bold(1))_(cal(B)_beta) Z_D log \( 1 \/ Z_D \)] + 1 / e Q_j \( cal(B)_beta \)\
 & lt.eq frac(beta log \( 1 \/ beta \) + beta \/ e, Z)\
 & lt.eq T_t := p / c_z (2 t L + 1 / e) . $ <eq:entropy-rare-prefix-loss>]
  Here $x log \( 1 \/ x \)$ is increasing on $\[ 0 \, beta \]$, $Q_j \( cal(B)_beta \) lt.eq beta \/ Z$, and the final step uses Equation (56). The term $beta \/ \( e Z \)$ is included because the clipped entropy can be negative. Thus Equation (68) controls the signed loss, not just the positive part of the original entropy.
  On the complementary prefixes, $f_D lt.eq 1 \/ beta$. Although $phi' \( x \) = 1 + log x$ is unbounded below at zero, it is bounded above there by $M_beta = 1 + log \( 1 \/ beta \) = 1 + 2 t L$. Integrating this upper derivative bound, including the limit at zero, gives
  $ phi \( x \) - phi \( y \) lt.eq M_beta \( x - y \) #h(2em) \( 0 lt.eq y lt.eq x lt.eq 1 \/ beta \) . $
  Equation (65) bounds the complementary expected entropy loss by $M_beta u$. In the second clipping only values in $\[ A \, H_max \]$ change; on that interval $phi' lt.eq M_H := 1 + log H_max$. Consequently
  $ bb(E)_D integral #scale(x: 120%, y: 120%)[\(] phi \( g_D \) - phi \( hat(f)_D \) #scale(x: 120%, y: 120%)[\)] thin upright(d) P_(*) lt.eq M_H R_t \/ omega_top . $
  Combining these estimates with Equation (59),
  $ bb(E)_D integral phi \( hat(f)_D \) thin upright(d) P_(*) gt.eq L - C_I \/ j - T_t - M_beta u - M_H R_t \/ omega_top . $
  Since $log A = L$ and the mean mass of $hat(f)_D$ is at most one, we obtain the nonnegative endpoint defect bound
  #[#set math.equation(numbering: n => "(69)")
   $ 0 lt.eq bb(E)_D integral hat(f)_D log A / hat(f)_D thin upright(d) P_(*) lt.eq C_I \/ j + T_t + M_beta u + M_H R_t \/ omega_top . $ <eq:entropy-endpoint-defect>]
  ===== 5.5 Thresholding the original density. <thresholding-the-original-density.>
  For $0 lt.eq x lt.eq A$,
  #[#set math.equation(numbering: n => "(70)")
   $ "dist" \( x \, { 0 \, A } \) lt.eq 2 x log \( A \/ x \) . $ <eq:entropy-distance>]
  For $x lt.eq A \/ 2$ this follows from $2 log \( A \/ x \) gt.eq 2 log 2 > 1$. For $A \/ 2 lt.eq x lt.eq A$, set $z = x \/ A$ and use $- log z gt.eq 1 - z$ and $2 z gt.eq 1$. The case $x = 0$ follows by continuity. Define a common valuation, for each admissible prefix, by thresholding the original density:
  $ H_D \( R \) = upright(bold(1))_({ f_D \( R \) > A \/ 2 }) . $
  For every $x gt.eq 0$, including $x > A$ and the tie $x = A \/ 2$, $lr(|x - A upright(bold(1))_({ x > A \/ 2 })|) = "dist" \( x \, { 0 \, A } \)$. Distance to a fixed set is $1$-Lipschitz: for any $x \, y$ and any point $a$ of the set, $\| x - a \| lt.eq \| x - y \| + \| y - a \|$, and taking the infimum proves the assertion. Applying this observation to $f_D$ and $hat(f)_D$, and using Equations (66), (69), and (70), gives
  #[#set math.equation(numbering: n => "(71)")
   $ rho_t & := bb(E)_D integral lr(|f_D - A H_D|) thin upright(d) P_(*)\
 & lt.eq frac(2 C_I, j) + 2 T_t + \( 1 + 2 M_beta \) u + \( 1 + 2 M_H \) R_t / omega_top\
 & lt.eq C (t^(- 1 \/ 2) + t p + \( 1 + t \) epsilon / p) . $ <eq:entropy-l1-rate>]
  Here $C$ depends only on $p_(*) \, omega_top \, b_0 \, K_0 \, B_0$; we used $j gt.eq t \/ 4$, $m gt.eq t \/ 2$, and the explicit preceding definitions. This estimate has no dependence on any primitive atom. In particular, arbitrarily small $Z_D$ have been accounted for by Equation (68), rather than excluded by an assumption of uniformly bounded conditional densities.
  ===== 5.6 One prefix for every calibration and comparison. <one-prefix-for-every-calibration-and-comparison.>
  Let
  $ rho_s \( D \) = bb(E)_(P_s) lr(|f_D \( R \) - A H_D \( R \)|) . $
  The positive mixture weights imply $bb(E)_D rho_s \( D \) lt.eq rho_t \/ omega_s$. Moreover $mu_s \( D \) = omega_s bb(E)_(P_s) f_D$ and $pi_s = A omega_s p_s$. The triangle inequality and Equation (62) yield
  #[#set math.equation(numbering: n => "(72)")
   $ bb(E)_D lr(|bb(E)_(P_s) H_D - p_s|) lt.eq frac(rho_t + R_t, A omega_s) . $ <eq:entropy-calibration-transfer>]
  For a comparison $Pi$ with marginals $P_s \, P_(s')$, the pointwise inequality
  $ A upright(bold(1))_({ H_D \( R \) > H_D \( R' \) }) lt.eq lr(|A H_D \( R \) - f_D \( R \)|) + \( f_D \( R \) - f_D \( R' \) \)_(+) + lr(|f_D \( R' \) - A H_D \( R' \)|) $
  and Equation (64) give
  #[#set math.equation(numbering: n => "(73)")
   $ bb(E)_D bb(P)_Pi #scale(x: 120%, y: 120%)[\(] H_D \( R \) > H_D \( R' \) #scale(x: 120%, y: 120%)[\)] lt.eq frac(rho_t \/ omega_s + rho_t \/ omega_(s') + u, A) . $ <eq:entropy-order-transfer>]
  Only the two marginal laws enter the absolute-error bounds. In particular, no density of $Pi$ relative to a product law is needed. Likewise no $p_s$ is inverted, so these estimates include $p_s = 0$.
  Sum all calibration errors and comparison errors in Equation (50) to form a nonnegative quantity $Theta \( D \)$. Equations (72) and (73) show that
  $ bb(E)_D Theta \( D \) lt.eq sum_(s in cal(T)) frac(rho_t + R_t, A omega_s) + sum_(Pi in cal(C)) frac(rho_t \/ omega_(s \( Pi \)) + rho_t \/ omega_(s' \( Pi \)) + u, A) . $
  The sums have fixed finite length. Since $0 < p_(*) < 1$, $t^(- 1 \/ 2) + t p_(*)^t$ tends to zero. First choose $t_0$ large enough that these terms make the displayed bound less than $zeta \/ 2$ for every $t gt.eq t_0$, and also that $p_(*)^(2 t) lt.eq e^(- 1)$. For each such $t$, choose $epsilon_0 \( t \) > 0$ small enough to satisfy Equation (55) and to make all remaining $epsilon \/ p$ terms contribute less than $zeta \/ 2$. Shrinking $epsilon_0 \( t \)$ if necessary makes the final bound strictly less than $zeta$. Some positive-$Q_j$ prefix then has $Theta \( D \) < zeta$. Every individual required error is nonnegative, so the single valuation $H = H_D$ satisfies all of Equation (50). Its dependence only on actual predicates follows from Equation (58). All choices used only the fixed numerical data stated in the lemma, completing the proof. ◻
]

For the primitive system of Section 4, choose the tolerance from Lemma 11. Lemma 12 then says that, on a NO instance, no common conjunction response can satisfy Equations (51)–(51) for those choices of $t$ and $epsilon$. The constants $b_0 \, K_0 \, B_0$ must be fixed before this choice; the next two sections produce precisely that interface from a putative sparse cut.

== 6 Scores, comparison measures, and an amplitude signal <sec:scores>

A #emph[score] is a real function on the cube of assignments to the bit positions of the test system. All scores below depend on a bounded number of positions. Identical functions are identified, even if their sampling presentations differ. A lookup $h$ is a measurable function from scores to ${ 0 \, 1 }$; measurability means Borel measurability on each finite table of score values. A raw comparison form is a finite positive measure on pairs of scores, evaluated as

$ cal(D) \( h \) = integral \| h \( B \) - h \( B' \) \| thin upright(d) frak(m) \( B \, B' \) . $

Its truth cost at an assignment $x$ is $integral \| B \( x \) - B' \( x \) \| thin upright(d) frak(m) \( B \, B' \)$.

#thm([Theorem 6.1.])[
  (Analytic score gap).  #emph[For each fixed $T_0 gt.eq 1$, the primitive system of Section 4 admits a demand law $mu$ of scores and a finite sum $cal(D)$ of raw comparison forms with the following properties. All arities, score bounds, numerical dimensions, and total comparison weight are bounded by constants independent of the input size. The laws and weights do not depend on a lookup. At a perfect witness $x$, 
$ integral \| B \( x \) - B' \( x \) \| thin upright(d) frak(m) \( B \, B' \) lt.eq 4 \, #h(2em) mu { B : B \( x \) gt.eq 1 \/ 4 } \, med mu { B : B \( x \) lt.eq - 1 \/ 4 } gt.eq 10^(- 4) . $

 In a NO instance, every binary measurable lookup with $nu = "Var"_mu \( h \) > 0$ satisfies $cal(D) \( h \) > T_0 nu$. Conditional on the discrete sampling data, the numerical laws and score entries belong to fixed finite families of polynomials with rational coefficients on rational boxes, with atoms represented as separate cases.]
] <thm:score-gap>

We first construct the demand law and comparison measures, with bounded truth cost at a satisfying assignment. For a putative low-cost coloring, the resampling comparison supplies an amplitude signal. The remaining comparisons preserve enough of this signal to obtain the common conjunction response required by Lemma 12. Section 7 constructs that response and completes the proof of Theorem 13.

It suffices to prove the theorem for rational $T_0 gt.eq 1$, since one can replace a given real $T_0$ by a larger rational number. Choose positive rational mixture weights $omega_s$ for all primitive types, and write $P_(*)$ for their mixture and $p_(*) = sum_s omega_s p_s in \( 0 \, 1 \)$. A length-$t$ conjunction from the independent mixture law has honest probability $p = p_(*)^t$. A fixed pattern of primitive types has honest probability equal to the product of their $p_s$’s. The ordered conjunction couplings change one coordinate by one of the prescribed primitive couplings and use independent, shared, fixed-type samples in all other coordinates. They give actual pointwise inclusions $r lt.eq r'$.

=== 6.1 Demand and random half-freezing <demand-and-random-half-freezing>

Let $M$ be a positive integer. Stage $j$ contains $n_j$ slots, where $n_j$ is even. Choose a positive rational coefficient satisfying

#[#set math.equation(numbering: n => "(74)")
 $ 1 / sqrt(p M n_j) lt.eq s_j lt.eq 2 / sqrt(p M n_j) \, #h(2em) s_j lt.eq 1 . $ <eq:score-scales>]

All stage sizes will be chosen below. In each slot independently sample a primary presentation $cal(R)_i$ of an iid conjunction $r_i$ and an independent amplitude with law

$ lambda = 1 / 2 delta_0 + 1 / 2 "Unif" \[ - 1 \, 1 \] . $

The demand score and its law are

$ B^0 = sum_(j = 1)^M s_j sum_(i upright(" in stage ") j) a_i r_i \, #h(2em) mu = "Law" \( B^0 \) . $

At a perfect witness $x$, each summand is symmetric, centered, and bounded by one, with variance $s_j^2 p \/ 6$. Consequently

$ 1 / 6 lt.eq "Var" \( B^0 \( x \) \) lt.eq 2 / 3 \, #h(2em) bb(E) B^0 \( x \)^4 lt.eq sum_(j \, i) bb(E) \( s_j a_i r_i \( x \) \)^2 + 3 "Var" \( B^0 \( x \) \)^2 < 4 . $

For $X = B^0 \( x \)$, Cauchy–Schwarz gives

$ bb(P) \( \| X \| gt.eq 1 \/ 4 \) gt.eq frac(\( bb(E) X^2 - 1 \/ 16 \)^2, bb(E) X^4) gt.eq 25 / 9216 . $

Symmetry splits this probability equally between the two required tails.

Set $rho = 1 \/ \( 2048 T_0^2 \)$. Include the form with weight $16 T_0$ that compares $B^0$ with $B^(0 \, rho)$, obtained by independently resampling each complete primary slot with probability $rho$. Its truth cost is at most

$ 16 T_0 sqrt(2 rho "Var" \( B^0 \( x \) \)) lt.eq 16 T_0 sqrt(4 rho \/ 3) = 1 \/ sqrt(6) < 1 . $

Throughout the soundness proof suppose, for a contradiction, that

#[#set math.equation(numbering: n => "(75)")
 $ 0 < nu = "Var" \( h \( B^0 \) \) \, #h(2em) cal(D) \( h \) lt.eq T_0 nu . $ <eq:assumed-score-cut>]

In particular,

#[#set math.equation(numbering: n => "(76)")
 $ bb(E) \| h \( B^0 \) - h \( B^(0 \, rho) \) \| lt.eq nu \/ 16 . $ <eq:resampling-bound>]

Independently choose a uniform half of the slots in each stage to freeze. Let $F_j$ be that half, $I_j$ its complement, and $F = union.big_j F_j$. The information $cal(Z)$ consists of the freeze sets and all complete primary variables in frozen slots. Let $cal(B)$ add to $cal(Z)$ the primary presentations of all unfrozen slots, but none of their amplitudes. Define, for $i in I_j$,

$ s_j b_i^0 = bb(E) \[ h \( B^0 \) divides cal(B) \, a_i \] - bb(E) \[ h \( B^0 \) divides cal(B) \] \, #h(2em) g_i^0 = bb(E) \[ b_i^0 divides cal(Z) \, cal(R)_i \, a_i \] . $

Indices in such formulas are fixed after the freeze sets are specified. For any family $b = \( b_i \)$ put

$ parallel b parallel_Sigma^2 = bb(E) sum_j s_j^2 sum_(i in I_j) \| b_i \|^2 . $

#thm([Lemma 6.2.])[
  (Amplitude signal).  #emph[Choose $k = ceil.l rho^(- 1) ceil.r$ and require $n_j gt.eq 4 k$. With $c = 4^(- \( k + 2 \))$, Equation (76) implies 
#[#set math.equation(numbering: n => "(77)")
 $ parallel b^0 parallel_Sigma^2 lt.eq nu \, #h(2em) sum_j s_j^2 sum_(i in I_j) bb(E) \[ \| b_i^0 \|^2 divides cal(B) \] lt.eq 1 / 4 \, #h(2em) parallel g^0 parallel_Sigma^2 gt.eq c nu . $ <eq:amplitude-signal>]

 The constants $k \, c$ depend only on $T_0$.]
] <lem:amplitude-signal>

#proof[
  First consider a single slot. Its erasure observation $O$ is a distinguished symbol $*$ when $a = 0$, and $\( cal(R) \, a \)$ otherwise. For a square-integrable function $psi \( O \)$, write $c_(*) = psi \( * \)$, let $psi_1 \( cal(R) \, u \)$ be its nonerased value, and put $m = bb(E) psi_1$. Then
  $ "Var" \( bb(E) \[ psi \( O \) divides cal(R) \] \) = 1 / 4 "Var" \( bb(E)_u psi_1 \) lt.eq 1 / 4 "Var" \( psi_1 \) \, quad "Var" \( psi \( O \) \) = 1 / 2 "Var" \( psi_1 \) + 1 / 4 \( c_(*) - m \)^2 . $
  Thus the conditional expectation from centered functions of $O$ to functions of $cal(R)$ has norm at most $2^(- 1 \/ 2)$.
  The centered function $f = h \( B^0 \) - bb(E) h \( B^0 \)$ is a function of the independent erasure observations: when a slot has amplitude zero its primary presentation contributes nothing to the score. Decompose $f$ by active sets of observation coordinates, using the classical orthogonal product-space decomposition of Hoeffding and Efron–Stein #cite(label("Hoeffding1948")) #cite(label("EfronStein1981")). If $P_i$ averages observation $i$, the component on $S eq.not diameter$ is $f_S = product_(i in S) \( I - P_i \) product_(i in.not S) P_i f$. These components are orthogonal and separately centered in their active coordinates. Conditional expectation onto all primary presentations preserves this separate centering, so the images of different active sets remain orthogonal. Applying the one-slot bound in each active coordinate gives
  #[#set math.equation(numbering: n => "(78)")
   $ parallel bb(E) \[ f divides \( cal(R)_i \)_i \] parallel_2^2 lt.eq sum_(S eq.not diameter) 2^(- \| S \|) parallel f_S parallel_2^2 lt.eq nu \/ 2 . $ <eq:erasure-contraction>]
  Refine the decomposition on complete primary slots. Let $sans(P)_i$ average the whole slot and $sans(R)_i$ average its amplitude alone. The operators
  $ sans(C)_i = sans(P)_i \, #h(2em) sans(D)_i = sans(R)_i - sans(P)_i \, #h(2em) sans(A)_i = I - sans(R)_i $
  are orthogonal projections onto, respectively, constants, centered functions of primary data, and functions with conditional amplitude mean zero. Operators in distinct slots commute. Write $f_eta = product_i eta_i f$ for $eta_i in { sans(C)_i \, sans(D)_i \, sans(A)_i }$, and let $S \( eta \) = { i : eta_i eq.not sans(C)_i }$ and $A \( eta \) = { i : eta_i = sans(A)_i }$. Equation (78) says that the total squared mass with $A \( eta \) eq.not diameter$ is at least $nu \/ 2$. Slot resampling acts on $f_eta$ by $\( 1 - rho \)^(\| S \( eta \) \|)$; hence
  $ bb(E) \( h \( B^0 \) - h \( B^(0 \, rho) \) \)^2 = 2 sum_eta \[ 1 - \( 1 - rho \)^(\| S \( eta \) \|) \] parallel f_eta parallel_2^2 . $
  Binary differences have equal absolute and squared values. For $\| S \( eta \) \| > k$, the bracketed coefficient multiplied by two is at least one. Equation (76) bounds the mass of these components by $nu \/ 16$. In particular,
  #[#set math.equation(numbering: n => "(79)")
   $ sum_(A \( eta \) eq.not diameter \, med \| S \( eta \) \| lt.eq k) parallel f_eta parallel_2^2 gt.eq 3 nu \/ 8 . $ <eq:low-degree-amplitude>]
  Given $cal(B)$, the unfrozen amplitudes are independent. The variables $s_j b_i^0$ are the orthogonal projections of $h \( B^0 \) - bb(E) \[ h \( B^0 \) divides cal(B) \]$ onto their separate centered amplitude spaces. Bessel’s inequality bounds their conditional squared norms by $"Var" \( h \( B^0 \) divides cal(B) \) lt.eq 1 \/ 4$. Averaging and using total variance proves the first two assertions.
  The tower property and amplitude independence give exactly
  $ s_j g_i^0 = bb(E) \[ h \( B^0 \) divides cal(Z) \, cal(R)_i \, a_i \] - bb(E) \[ h \( B^0 \) divides cal(Z) \, cal(R)_i \] . $
  For a fixed freeze set, this is the projection $sans(A)_i product_(ell in.not F union { i }) sans(P)_ell f$. After averaging the observed frozen values as well, orthogonality yields
  $ parallel g^0 parallel_Sigma^2 = sum_eta parallel f_eta parallel_2^2 sum_(i in A \( eta \)) bb(P)_F \( i in.not F \, med S \( eta \) \\ { i } subset.eq F \) . $
  For one component in Equation (79), distinguish an $i in A \( eta \)$ in stage $j$, put $d = \| S \( eta \) \| lt.eq k$, and let $q_ell$ count its active slots in stage $ell$. With falling factorials, the displayed capture probability is
  $ 1 / 2 frac(\( n_j \/ 2 \)_(q_j - 1), \( n_j - 1 \)_(q_j - 1)) product_(ell eq.not j) frac(\( n_ell \/ 2 \)_(q_ell), \( n_ell \)_(q_ell)) . $
  Each of its $d - 1$ ratio factors is at least $1 \/ 4$: its numerator is at least $n_ell \/ 2 - k + 1 gt.eq n_ell \/ 4$ and denominator at most $n_ell$. The probability is therefore at least $1 / 2 4^(- \( d - 1 \)) gt.eq 4^(- k)$. Keeping just the distinguished contribution and using Equation (79) gives the claimed $c nu$. ◻
]

We must turn this amplitude signal into the response on actual conjunction predicates required by Lemma 12. We will first construct a real response, bound its size under each type pattern, and control its decrease when $r$ is replaced by a containing predicate $r'$. Three kinds of comparison path provide these estimates. Paths between opposite contributions of one conjunction bound the response under each pattern; paths using $r lt.eq r'$ control its order; paths through the random-amplitude contribution carry the signal to that response. The comparison measures sample their path orientations independently of the lookup. A common orientation extracted from the lookup will enter only the analysis. The estimates must retain errors proportional to $nu$ throughout, so that thresholding the response can meet the rare-event criterion even when the cut variance is arbitrarily small.

=== 6.2 The order of the constants <the-order-of-the-constants>

We first fix the signal-loss tolerance $e$, the clipping bound $B_(*)$, and the signal threshold $gamma$, together with the resulting inputs $b_0 \, K_0 \, B_0$ to Lemma 12. Choose rational constants

#[#set math.equation(numbering: n => "(80)")
 $ c_1 = c \/ 4 \, quad 0 < e lt.eq c \/ 160000 \, quad B_(*) gt.eq max \( 1 \, 3200 \( T_0 + 1 \) \/ c \) \, quad K_(*) = 32 \( T_0 + 2 \) \,\
0 < gamma lt.eq c_1 \/ \( 16 K_(*) \) \, quad b_(*) = c_1 \/ \( 128 B_(*)^2 \) \, quad b_0 = b_(*) \/ \[ 8 \( T_0 + 1 \) \] \, quad K_0 = 16 \/ gamma \, quad B_0 = B_(*) . $ <eq:preconjunction-constants>]

These constants have no dependence on conjunction length. Apply Lemma 12 to $b_0 \, K_0 \, B_0$ and choose its length $t$ and tolerance $epsilon > 0$. We can decrease $epsilon$ to make it rational. From now on $p = p_(*)^t$ is fixed. Let $V$ be the number of fixed type patterns together with the iid conjunction law, and let $Q$ be the number of required ordered conjunction couplings, counting the changed coordinate. Our path menu below has $L = V + 2 Q + 2$ entries. Set $A_t = 16 V + 80 Q$, and choose rational $Delta > 0$ so small that

#[#set math.equation(numbering: n => "(81)")
 $ Delta lt.eq b_(*) p gamma \/ 160 \, #h(2em) (frac(16 p, gamma epsilon) + 1) frac(A_t Delta, gamma) lt.eq b_(*) p \/ 4 . $ <eq:delta-choice>]

Choose an integer

#[#set math.equation(numbering: n => "(82)")
 $ M gt.eq frac(32 B_(*) K_(*) \( T_0 + 3 \), c_1 Delta) . $ <eq:stage-number>]

The remaining parameters are chosen sequentially in Subsection 6.5. This order will be justified by estimates whose constants are independent of the later stage sizes.

=== 6.3 Paths, replacements, and formal cells <paths-replacements-and-formal-cells>

Start with the one-cell partition $C_0$ of the assignment cube. At stage $j$, given the preceding partition $C_(j - 1)$, use these path laws $D^(-) arrow.r D^(+)$ for a sign function $tau$ constant on its cells:

+ $- tau r arrow.r + tau r$ for each of the $V$ vertical laws;
+ $+ tau r arrow.r + tau r'$ and $- tau r' arrow.r - tau r$ for each ordered pair $r lt.eq r'$;
+ $- tau r arrow.r a r$ and $a r arrow.r + tau r$, where $r$ is iid and $a tilde.op lambda$ is fresh.

Every endpoint has absolute value at most one, and every coordinate of $tau \( D^(+) - D^(-) \)$ is nonnegative. All predicates and any amplitude in a path are fresh samples from its specified law.

Independently in each unfrozen slot of stage $j$, retain the primary summand with probability $1 - alpha_j$; call this choice shared. Otherwise draw a uniform menu entry, its fresh path data, a uniform descriptor $tau in { - 1 \, + 1 }^(J_(j - 1))$, a uniform time $u in \[ 0 \, 1 \]$, and a fair sign $chi in { - 1 \, + 1 }$. Replace that slot by

$ s_j chi \[ \( 1 - u \) D^(-) + u D^(+) \] . $

Here $J_(j - 1)$ is the number of formal cells at the preceding level. The score after all replacements through stage $j$ is $B^j$; future slots and frozen slots still have their primary summands.

Construct $C_j$ by refining $C_(j - 1)$ with all queried positions in the current unfrozen primary presentations, including those in replaced slots, and all queried positions in the current fresh paths. Use fixed orders and pad each list to a deterministic length with coordinates whose value is identically zero. Retain all formal binary cells, including inconsistent and empty ones. Thus $J_j$ is a deterministic constant once the sizes through stage $j$ are fixed. A descriptor defines the indicated sign function on actual cells; values on empty cells do not matter. This construction inspects neither amplitudes, times, nor signs when forming the partition after its question lists are known. Frozen and future query lists do not enter $C_j$.

The whole experiment first draws primary samples and freeze sets, then performs these independent stage trials given the preceding partitions. Trials use no lookup and no analytic reference signs. Although a reference sign defined below can depend on future primary summands, it never enters the generative history.

At truth, conditional on frozen variables and earlier actual trials, the current summand differences are independent and centered. Their second moments are at most $4 s_j^2 alpha_j$. Thus

#[#set math.equation(numbering: n => "(83)")
 $ bb(E) \| B^j \( x \) - B^(j - 1) \( x \) \| lt.eq delta_j := 4 sqrt(alpha_j \/ \( p M \)) . $ <eq:replacement-truth>]

For each $j$, let $S_j$ be the first $m_j$ indices of $I_j$ in their fixed order. Delete their current summands from $B^j$ to obtain $B_compose^j$, and delete only slot $i$ to obtain $B_(not i)^j$. Conditional on the other summands and preceding history, these deleted bases do not use the variables in the deleted slots. The single-slot deletion will provide the background for varying that slot’s predicate. Deleting all of $S_j$ will let us choose one orientation, from the remaining score and preceding partitions, for every tested slot.

=== 6.4 Smoothing and the comparison measures <smoothing-and-the-comparison-measures>

For $xi > 0$ use the probability density

$ f_xi \( a \) = frac(15, 16 xi) \( 1 - a^2 \/ xi^2 \)^2 upright(bold(1))_(\[ - xi \, xi \]) \( a \) . $

It is even, continuously differentiable after extension by zero, and decreasing on $\[ 0 \, xi \]$. Direct integration gives

#[#set math.equation(numbering: n => "(84)")
 $ integral \| f'_xi \| = frac(15, 8 xi) \, #h(2em) integral_0^xi 2 b \[ - f'_xi \( b \) \] thin upright(d) b = 1 . $ <eq:density-identities>]

For every $z in C_ell$, let $theta_(ell \, z)$ have this density with scale $xi_ell$, independently. Put $Theta_ell = sum_(z in C_ell) theta_(ell \, z) upright(bold(1))_z$ and $Theta_(lt.eq j) = sum_(ell = 0)^j Theta_ell$. With partitions fixed, set

$ h_j \( B \) = bb(E)_theta h \( B + Theta_(lt.eq j) \) \, #h(2em) K_(j \, z) \( B \) = frac(partial, partial a) h_j \( B + a upright(bold(1))_z \)\|_(a = 0) . $

Translation of the last density proves continuous differentiability in all cell shifts, even for merely measurable $h$. Indeed the translated density is continuously differentiable in $L^1$, and $h$ is bounded. Derivatives on empty cells vanish. Write $K_j = K_j \( B^j \)$ and $\| K_j \|_1 = sum_z \| K_(j \, z) \|$. The map $pi$ sums fine coordinates on each parent cell. Define the common reference descriptor

#[#set math.equation(numbering: n => "(85)")
 $ sigma^j = "sign" K_(j - 1) \( B_compose^j \) \, $ <eq:reference-sign>]

with ties positive and using only partitions through level $j - 1$. It is common to every tested index in $S_j$.

For each mode and formal descriptor, a match in a slot means replacement with that mode and descriptor and $chi = + 1$. Its probability is

$ beta_j = frac(alpha_j, 2 L 2^(J_(j - 1))) . $

Mark a consistent cell in $C_j$ if any of these conditions holds:

+ For some mode and descriptor, the match fraction in $S_j$ exceeds $2 beta_j$.
+ For some vertical mode and descriptor, the fraction in $S_j$ of matches whose path predicate is one at the cell exceeds $2 beta_j p_(upright("law"))$.
+ The fraction in $I_j$ that is shared and has primary predicate one at the cell exceeds $2 p$.

The first condition, if it occurs, marks every consistent cell. All these rules use actual query values and trial data, and do not use $h$. Every descriptor is checked, so on an unmarked cell the empirical bounds also hold for the lookup-dependent descriptor $sigma^j$. They will bound match-weighted gradient sums without assuming that the fine gradient is independent of the match indicators. A separate comparison form below will charge for gradient mass on the marked cells. At a fixed perfect witness, condition on frozen data and earlier actual trials. Indicators in each count are independent over current slots. Plain matches have mean $beta_j$, vertical hit matches have mean $beta_j p_(upright("law"))$, and shared hits have mean at most $p$. For $m$ independent indicators of mean $b > 0$, Chebyshev’s inequality bounds the probability that their average exceeds $2 b$ by $1 \/ \( m b \)$. A zero mean gives a zero count almost surely. If $p_min$ is the minimum positive vertical honest probability (including $p$), a union bound gives

#[#set math.equation(numbering: n => "(86)")
 $ bb(P) \( x upright(" lies in a marked cell") \) lt.eq frac(2 L 2^(J_(j - 1)), m_j beta_j p_min) + frac(2, n_j p) . $ <eq:marking-truth>]

We now specify every additional raw form. All expectations below include the indicated score experiment; numerical noises are shared whenever their levels appear in both arguments.

For any set $A$ of level-$j$ cells, define

$ N_j \( B \; A \) = bb(E) sum_(z in A) integral_0^(xi_j) \[ - f'_(xi_j) \( b \) \] \| h \( B + Theta_(lt.eq j)^(z \, + b) \) - h \( B + Theta_(lt.eq j)^(z \, - b) \) \| thin upright(d) b \, $

where the superscript fixes only coordinate $\( j \, z \)$ and all other noises are averaged. Translating the density and pairing $b$ with $- b$ gives

$ K_(j \, z) \( B \) = integral_0^(xi_j) \[ - f'_(xi_j) \( b \) \] bb(E)_(upright(o t h e r med n o i s e s)) \[ h \( B + Theta_(lt.eq j)^(z \, + b) \) - h \( B + Theta_(lt.eq j)^(z \, - b) \) \] thin upright(d) b . $

Thus $N_j$ dominates the expected variation on its tested cells. Its truth cost is at most the probability that the witness cell is in $A$: all other coordinates contribute zero, and the contributing integral is one by Equation (84). Include $N_M \( B^M \; C_M \)$ with weight one and $N_j \( B^j \; upright("marked cells") \)$ with weight $T_0 \/ a_j$, where $a_j = min \( p \, Delta beta_j \)$.

For $A = B^(j - 1)$ or $A = B_compose^j$, include with weight $T_0 M$ the form

$ P_j \( A \) = bb(E) sum_(z in C_(j - 1)) integral_(- xi_(j - 1))^(xi_(j - 1)) \| f'_(xi_(j - 1)) \( b \) \| \| h \( B^j + Theta_(< j)^(z \, b) + Theta_j \) - h \( A + Theta_(< j)^(z \, b) \) \| thin upright(d) b . $

Here the fixed coordinate is $\( j - 1 \, z \)$ and all other preceding noises have their usual law. Differentiating with respect to this preceding coordinate shifts all its children equally in the first term; its derivative is $\( pi K_j \)_z$. The second derivative is $K_(j - 1 \, z) \( A \)$. Taking absolute values under the common integral proves

$ bb(E) \| pi K_j - K_(j - 1) \( A \) \|_1 lt.eq P_j \( A \) . $

With $Lambda_(j - 1) = 15 J_(j - 1) \/ \( 8 xi_(j - 1) \)$, its unweighted truth cost is at most $Lambda_(j - 1) \( delta_j + xi_j \)$ for the first choice of $A$, and $Lambda_(j - 1) \( m_j s_j + xi_j \)$ for the second.

Include also the following ordinary coupled raw differences:

+ Compare $B^0$ to $B^j + Theta_(< j)$, with weight $T_0 M \/ e$.
+ For uniform $i in I_j$ forced shared, compare $B^j + Theta_(lt.eq j)$ to $B^j + Theta_(< j)$, with weight $T_0 \/ \( e thin p thin s_j^2 \)$.
+ For each mode and each of its two endpoints, force uniform $i in S_j$ into that mode with independent uniform descriptor and $chi = + 1$. Rebuild $C_j$ using its fresh path data. For $B = B_(not i)^j + s_j D^plus.minus$, compare $B + Theta_(lt.eq j)$ to $B + Theta_(< j)$, with weight $T_0 \/ \( s_j Delta 2^(- J_(j - 1)) \)$.

The forced trial has its prescribed conditional law given earlier stages, and all other trials retain their ordinary laws. The primary presentation remains in the query list. The two last types of form have unweighted truth cost at most $xi_j$. The first has cost at most $sum_(k lt.eq j) delta_k + sum_(ell < j) xi_ell$.

All coefficients in these measures are nonnegative. Their laws use uniform descriptors; the lookup-dependent descriptor $sigma^j$ in Equation (85) occurs only in the analysis.

=== 6.5 A sequential rational funding schedule <subsec:funding>

The schedule makes all comparison truth costs simultaneously small while retaining the variance-relative estimates needed below. Every choice uses only parameters already fixed.

Put $eta = 1 \/ \[ 100 M \( L + 1 \) \]$ and $d_(upright("cap")) = eta e \/ \( 4 T_0 M^2 \)$. Choose positive rational $xi_0 lt.eq d_(upright("cap"))$. At stage $j$, the numbers $J = J_(j - 1)$ and $Lambda = Lambda_(j - 1)$ are already known. Choose the following parameters in this order:

+ Choose rational $0 < alpha_j lt.eq min \( 1 \/ 2 \, e \)$ so small that
  $ delta_j lt.eq min \( d_(upright("cap")) \, eta \/ \( 2 T_0 M Lambda \) \) . $
  Squaring the right-hand bound supplies a rational sufficient condition. Set $beta_j = alpha_j \/ \( 2 L 2^J \)$ and $a_j = min \( p \, Delta beta_j \)$.
+ Choose an integer
  $ m_j gt.eq frac(2 T_0 \( 2 L 2^J \), eta a_j beta_j p_min) . $
+ Choose an even integer
  $ n_j gt.eq max (2 m_j \, 4 k \, frac(4, p M) \, frac(4 T_0, eta a_j p) \, frac(16 T_0^2 M Lambda^2 m_j^2, eta^2 p)) \, $
  and rational $s_j$ satisfying Equation (74). Such a rational can be found between the two endpoints by rational interval refinement; the bound $n_j gt.eq 4 \/ \( p M \)$ ensures $s_j lt.eq 1$.
+ Choose rational $xi_j > 0$ with
  $ xi_j lt.eq min (d_(upright("cap")) \, frac(eta, 2 T_0 M Lambda) \, frac(eta e p s_j^2, T_0) \, frac(eta s_j Delta 2^(- J), T_0)) . $

The marked form costs at most $eta$ by Equation (86): its two terms cost at most $eta \/ 2$ each after multiplication by $T_0 \/ a_j$. Each projected-gradient form costs at most $eta$; for deletion use $m_j s_j lt.eq eta \/ \( 2 T_0 M Lambda \)$, which follows from the last lower bound on $n_j$. Each forced form costs at most $eta$. The cumulative demand comparison costs at most $\( T_0 M \/ e \) 2 M d_(upright("cap")) = eta \/ 2$. There are $5 + 2 L$ tunable forms per stage, so their total truth cost is less than $M \( 5 + 2 L \) eta < 1$. Together with resampling and final variation this is less than three, and in particular at most four. All earlier truth-cost estimates are uniform over the later primary backgrounds, so subsequent parameter choices preserve the allocated bounds.

The consequences of Equation (75) are

#[#set math.equation(numbering: n => "(87)")
 $ bb(E) \| K_M \|_1 lt.eq T_0 nu \, #h(2em) bb(E) sum_(z upright(" marked")) \| K_(j \, z) \| lt.eq a_j nu \,\
bb(E) \| pi K_j - K_(j - 1) \|_1 lt.eq nu \/ M \, #h(2em) bb(E) \| pi K_j - K_(j - 1) \( B_compose^j \) \|_1 lt.eq nu \/ M \,\
bb(E) \| h \( B^0 \) - h_(j - 1) \( B^j \) \|^2 lt.eq e nu \/ M . $ <eq:funded-bounds>]

The square bound follows by averaging raw comparisons and using $\| u - v \|^2 lt.eq \| u - v \|$ for $u \, v in \[ 0 \, 1 \]$. In addition,

#[#set math.equation(numbering: n => "(88)")
 $ bb(E)^(i med upright(u n i f o r m med s h a r e d)) \| h_j \( B^j \) - h_(j - 1) \( B^j \) \| lt.eq e p s_j^2 nu \, $ <eq:forced-shared-bound>]

and each uniform-descriptor endpoint experiment satisfies

#[#set math.equation(numbering: n => "(89)")
 $ bb(E) \| h_j \( B \) - h_(j - 1) \( B \) \| lt.eq s_j Delta 2^(- J_(j - 1)) nu . $ <eq:forced-endpoint-bound>]

=== 6.6 Orientation and clipping <orientation-and-clipping>

The comparison measures and all numerical parameters are now fixed. It remains to locate a stage at which a common amplitude signal survives the accumulated approximation and clipping errors.

Put

$ U = max_(0 lt.eq j lt.eq M) bb(E) \[ \| K_j \|_1 divides cal(B) \] \, #h(2em) v = bb(E) \[ U divides cal(Z) \] . $

For each $j$, let $E_j = bb(E) \[ \| pi K_j - K_(j - 1) \|_1 divides cal(B) \]$. The pointwise inequality $\| K_(j - 1) \|_1 lt.eq \| K_j \|_1 + \| pi K_j - K_(j - 1) \|_1$ gives $U lt.eq bb(E) \[ \| K_M \|_1 divides cal(B) \] + sum_j E_j$. Therefore

#[#set math.equation(numbering: n => "(90)")
 $ bb(E) U = bb(E) v lt.eq \( T_0 + 1 \) nu . $ <eq:U-mean>]

Define $d_(j \, z) = \| K_(j \, z) \| - sigma_("par" \( z \))^j K_(j \, z) gt.eq 0$. For vectors $a \, b$ and $sigma = "sign" b$, $\| a \|_1 - sigma dot.op a lt.eq 2 \| a - b \|_1$. Applying this with $a = pi K_j$, $b = K_(j - 1) \( B_compose^j \)$, and then the across-stage comparison, gives

$ sum_z d_(j \, z) lt.eq \| K_j \|_1 - \| K_(j - 1) \|_1 + \| pi K_j - K_(j - 1) \|_1 + 2 \| pi K_j - K_(j - 1) \( B_compose^j \) \|_1 . $

Summing and dropping $- \| K_0 \|_1$ proves

#[#set math.equation(numbering: n => "(91)")
 $ sum_j bb(E) sum_z d_(j \, z) lt.eq \( T_0 + 3 \) nu . $ <eq:defect-telescope>]

Call $j$ good when its expected defect is at most $Delta nu$.

Transferring the amplitude signal requires both smoothing levels. A current predicate $r_i$ can split a cell of $C_(j - 1)$, so smoothing along the preceding cells need not permit differentiation in its direction. Fine smoothing $h_j$ does: $r_i$ is constant on every cell of $C_j$. Its smoothing law, however, retains the current query partition and can depend on the predicate’s presentation. The coarse smoothing $h_(j - 1)$ omits that partition, while its score still contains the contribution of $r_i$. Section 7 will use this omission to express the coarse amplitude projection through a common deleted-slot background, depending on the current presentation only through the actual predicate. We therefore preserve the coarse component as the source of the response and use the fine component for derivative estimates.

For $i in I_j$, define $b_i$ as the centered amplitude component of $h_(j - 1) \( B^j \)$ divided by $s_j$ under the experiment forcing $i$ shared:

$ s_j b_i = bb(E)^(i \, upright("sh")) \[ h_(j - 1) \( B^j \) divides cal(B) \, a_i \] - bb(E)^(i \, upright("sh")) \[ h_(j - 1) \( B^j \) divides cal(B) \] . $

Define $b_i^(+)$ by replacing $h_(j - 1)$ with $h_j$, and put $g_i = bb(E) \[ b_i divides cal(Z) \, cal(R)_i \, a_i \]$. Forcing shared does not alter the primary or freeze law. On replacement the score and partition ignore the primary amplitude $a_i$. Thus the corresponding amplitude projection under the ordinary law is exactly $\( 1 - alpha_j \) s_j b_i$. Conditional Bessel inequalities, applied at each stage to the last line of Equation (87), give

$ parallel \( \( 1 - alpha_j \) b_i - b_i^0 \)_i parallel_Sigma^2 lt.eq e nu . $

Since $alpha_j lt.eq e lt.eq 1 \/ 2$ and $parallel b^0 parallel_Sigma lt.eq sqrt(nu)$, solving for $b - b^0$ gives

#[#set math.equation(numbering: n => "(92)")
 $ parallel b - b^0 parallel_Sigma lt.eq 4 sqrt(e nu) \, #h(2em) parallel b^(+) - b parallel_Sigma lt.eq sqrt(2 e nu) . $ <eq:component-approximations>]

For the second bound, projection contraction in each forced experiment bounds $s_j^2 bb(E) \| b_i^(+) - b_i \|^2$ by the expected squared difference of the two smoothed values. Sum over $i$, use Equation (88), and use $\| I_j \| s_j^2 lt.eq 2 \/ \( p M \)$.

Fine differentiation along the primary amplitude gives, for every $a$,

#[#set math.equation(numbering: n => "(93)")
 $ \| b_i^(+) \( a \) \| lt.eq frac(4, 1 - alpha_j) bb(E) [upright(bold(1))_({ i med upright("shared") }) sum_z \| K_(j \, z) \| r_i \( z \) thin mid(bar.v) thin cal(B)] lt.eq 8 U . $ <eq:component-gradient>]

To check the first inequality, bound the centered amplitude value by the integral of absolute derivatives over the whole interval $\[ - 1 \, 1 \]$. The derivative of $h_j$ along $a$ is $s_j sum_z K_(j \, z) r_i \( z \)$. The partition is fixed along this amplitude path. Lebesgue measure on $\[ - 1 \, 1 \]$ is bounded by $4 lambda$, giving the factor four; conditioning a trial to be shared gives $1 \/ \( 1 - alpha_j \)$. Average Equation (93) over $I_j$. On unmarked cells the shared-hit fraction is at most $2 p$, and on marked cells at most one. Equations (87) and (90) imply

#[#set math.equation(numbering: n => "(94)")
 $ bb(E) "avg"_(i in I_j) \| b_i^(+) \| lt.eq 16 p \( T_0 + 1 \) nu + 8 p nu lt.eq K_(*) p nu . $ <eq:component-L1>]

We now clip the fine component to obtain a bounded signal. Set $A = { U lt.eq B_(*) \, med v lt.eq B_(*) }$, which is $cal(B)$-measurable, and define $tilde(b)_i = b_i^(+) upright(bold(1))_A$ and $tilde(g)_i = bb(E) \[ tilde(b)_i divides cal(Z) \, cal(R)_i \, a_i \]$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Notation
], table.cell(rowspan: 1, colspan: 1)[Definition and role
]),
  table.cell(rowspan: 1, colspan: 1)[$b_i^0 \, med g_i^0$
], table.cell(rowspan: 1, colspan: 1)[Centered amplitude component of the demand lookup $h \( B^0 \)$, divided by $s_j$, and its projection onto $\( cal(Z) \, cal(R)_i \, a_i \)$; these supply the initial signal.
],
  table.cell(rowspan: 1, colspan: 1)[$b_i \, med g_i$
], table.cell(rowspan: 1, colspan: 1)[Component of the coarse lookup $h_(j - 1) \( B^j \)$ when $i$ is forced shared, and the same conditional projection; Section 7 expresses $g_i$ through the common deleted-slot background.
],
  table.cell(rowspan: 1, colspan: 1)[$b_i^(+)$
], table.cell(rowspan: 1, colspan: 1)[Component with fine smoothing $h_j$ in the same forced experiment; differentiation gives the pointwise and first-moment bounds.
],
  table.cell(rowspan: 1, colspan: 1)[$tilde(b)_i \, med tilde(g)_i$
], table.cell(rowspan: 1, colspan: 1)[The clipped component $b_i^(+) upright(bold(1))_({ U lt.eq B_(*) \, thin v lt.eq B_(*) })$ and its conditional projection; these give bounded quantities for the following norm comparisons.
],
)
]],
  caption: [Table 1: Amplitude components. The fine and clipped quantities retain a signal in the coarse projection $g_i$. ],
)

The conditional cap in Equation (77), even with its weaker upper bound one, and Markov’s inequality give

$ parallel b^0 upright(bold(1))_(A^c) parallel_Sigma^2 lt.eq bb(P) \( A^c \) lt.eq 2 \( T_0 + 1 \) nu \/ B_(*) . $

Projection contraction, Equation (92), and the triangle inequality now give

#[#set math.equation(numbering: n => "(95)")
 $ parallel tilde(g) - g^0 parallel_Sigma & lt.eq \[ 6 sqrt(e) + sqrt(2 \( T_0 + 1 \) \/ B_(*)) \] sqrt(nu) \,\
parallel tilde(g) - g parallel_Sigma & lt.eq \[ 10 sqrt(e) + sqrt(2 \( T_0 + 1 \) \/ B_(*)) \] sqrt(nu) . $ <eq:clipped-signal-distance>]

For every family $q_i$, Equation (74) implies

#[#set math.equation(numbering: n => "(96)")
 $ p / 2 parallel q parallel_Sigma^2 lt.eq "avg"_j bb(E) "avg"_(i in I_j) \| q_i \|^2 lt.eq 2 p parallel q parallel_Sigma^2 . $ <eq:norm-conversion>]

The first bracket above is at most $sqrt(c) \/ 25$ and the second at most $sqrt(c) \/ 20$ by Equation (80). Using the amplitude signal and Equation (96), we obtain

#[#set math.equation(numbering: n => "(97)")
 $ "avg"_j bb(E) "avg"_(i in I_j) \| tilde(g)_i \|^2 gt.eq c_1 p nu \, #h(2em) "avg"_j bb(E) "avg"_(i in I_j) \| tilde(g)_i - g_i \|^2 lt.eq 1 / 10 c_1 p nu . $ <eq:clipped-signal>]

Also $\| tilde(g)_i \| lt.eq 8 B_(*)$, its averaged first moment is at most $K_(*) p nu$ at each stage by Equation (94), and it vanishes when $v > B_(*)$.

At most $\( T_0 + 3 \) \/ Delta$ stages are bad. Each contributes at most $8 B_(*) K_(*) p nu$ to the unaveraged second moment of $tilde(g)$. Equation (82) bounds their average contribution by $c_1 p nu \/ 4$. On $\| g_i \| < gamma$, the elementary inequality

$ \| tilde(g)_i \|^2 lt.eq 2 gamma \| tilde(g)_i \| + \| tilde(g)_i - g_i \|^2 $

holds, as follows by expanding the last square and using $\| g_i \| < gamma$. Its average is at most $\( 1 \/ 8 + 1 \/ 10 \) c_1 p nu$. Thus at least $c_1 p nu \/ 2$ of the average second moment remains on good stages with $\| g_i \| gt.eq gamma$ and $v lt.eq B_(*)$. The bound $\| tilde(g)_i \|^2 lt.eq 64 B_(*)^2$ proves that some good stage $j$ satisfies

#[#set math.equation(numbering: n => "(98)")
 $ bb(P)_(cal(Z) \, thin i med upright(u n i f o r m med i n) med I_j \, thin cal(R)_i \, a_i) \( \| g_i \| gt.eq gamma \, med v lt.eq B_(*) \) gt.eq b_(*) p nu . $ <eq:good-stage-signal>]

We fix this stage for the rest of the analytic argument.

== 7 Conditional kernels and ordered paths <sec:paths>

Fix the good stage supplied by Equation (98). In this section abbreviate $s = s_j$, $alpha = alpha_j$, $beta = beta_j$, $I = I_j$, $S = S_j$, and $J = J_(j - 1)$. All background experiments are through stage $j$ only. We first identify the conditional laws needed to turn amplitude variation into a common response on predicates.

=== 7.1 The deleted-slot background <the-deleted-slot-background>

Fix an exterior value $cal(Z) = z$. It fixes the freeze sets, the complete frozen variables, and the sets $I \, S$. Let $Y_i = \( cal(R)_i \, a_i \)$ for $i in I$, with common law $P_Y = P_(cal(R)) ⊗ lambda$. Let $X$ contain all unfrozen primary samples and actual trial variables at stages before $j$, all future primary samples, and the fixed frozen contributions. It determines the preceding partition sequence $C^(-) = C_(lt.eq j - 1)$ and the score $B_(upright("out"))$ contributed by slots outside $I$ after earlier stages. It includes no analytic reference gradients or signs as inputs. Actual previous trials used only their preceding query partitions to interpret independent descriptors, so $X$ is independent of the current unfrozen primary samples conditional on $z$.

For a preceding partition sequence $C$, write the current trial kernel as

#[#set math.equation(numbering: n => "(99)")
 $ q_C = \( 1 - alpha \) delta_(upright("shared")) + alpha / L sum_(m = 1)^L P_m \( thin upright(d) E \) "Unif" \( { - 1 \, + 1 }^J \) \( thin upright(d) tau \) "Unif" \[ 0 \, 1 \] \( thin upright(d) u \) "Unif" { - 1 \, + 1 } \( thin upright(d) chi \) \, $ <eq:trial-kernel>]

where $P_m$ is the fresh data law of mode $m$, including its fresh amplitude if required. The descriptor in this formula is interpreted on $C_(j - 1)$. If $T_i$ denotes the current trial, the exact conditional factorization is

#[#set math.equation(numbering: n => "(100)")
 $ P_z \( thin upright(d) X \, thin upright(d) Y \, thin upright(d) T \) = q_z \( thin upright(d) X \) product_(i in I) \[ P_Y \( thin upright(d) Y_i \) q_(C^(-) \( X \)) \( thin upright(d) T_i \) \] . $ <eq:conditional-product>]

This conditional-on-$X$ product is the independence statement we use. After mixing over $X$, no mutual independence of interpreted trials is needed.

Let $V_C \( Y_i \, T_i \)$ be the current slot summand, including its factor $s$. Then

$ B_(not i)^j = B_(upright("out")) + sum_(k in I \\ { i }) V_(C^(-)) \( Y_k \, T_k \) \, #h(2em) B_compose^j = B_(upright("out")) + sum_(k in I \\ S) V_(C^(-)) \( Y_k \, T_k \) . $

For every $i in I$, the pair $\( B_(not i)^j \, C^(-) \)$ uses none of $Y_i$. Equation (100) shows that its conditional law given $z$ is independent of the entire primary presentation and amplitude in that slot. This law is also the same for every $i in I$: permutations of these slots preserve the product law and send one deleted sum to another. Denote the common law by $kappa_z \( thin upright(d) B \, thin upright(d) C \)$. The actual fine partition $C_j$ is not a coordinate of this kernel.

Write $phi.alt_C \( B \)$ for lookup smoothed through the preceding partition sequence $C$. In the experiment forcing $i$ shared, put $F_i = phi.alt_(C^(-)) \( B_(not i)^j + s a_i r_i \)$, where $r_i$ is the predicate represented by $cal(R)_i$. The definition of $b_i$ and the tower property give

$ s g_i = bb(E)^(i \, upright("sh")) \[ F_i divides cal(Z) \, cal(R)_i \, a_i \] - bb(E)^(i \, upright("sh")) \[ F_i divides cal(Z) \, cal(R)_i \] . $

Indeed $sigma \( cal(Z) \, cal(R)_i \, a_i \) subset.eq cal(B) or sigma \( a_i \)$, and $a_i$ is independent of $cal(B)$; averaging the subtracted $cal(B)$-conditional expectation therefore removes $a_i$. Forcing shared preserves the law of the background. The projected response is consequently

#[#set math.equation(numbering: n => "(101)")
 $ s thin g_z \( r \, a \) = integral [phi.alt_C \( B + s a r \) - integral phi.alt_C \( B + s a' r \) thin upright(d) lambda \( a' \)] thin upright(d) kappa_z \( B \, C \) . $ <eq:common-amplitude-kernel>]

It is a version of every $g_i$, evaluated at the predicate represented by $cal(R)_i$ and at $a_i$. It depends on the actual predicate $r$, not its presentation. In particular $g_z \( 0 \, a \) = 0$. An unused queried position in a zero-predicate presentation can change $C_j$, but it cannot change Equation (101), which uses only the preceding partitions. Independent sampled predicates may have overlapping bit names; independence here concerns samples and does not require disjoint supports on the assignment cube.

For $i in S$, extend this background by $sigma = "sign" K_(j - 1) \( B_compose^j \)$. The triple $\( B_(not i)^j \, C^(-) \, sigma \)$ still uses none of $Y_i$ and is unaffected by changing $T_i$. Its conditional law is common to all $i in S$, by permutations within $S$; call it $kappa_z^S$. Its $\( B \, C \)$ marginal is precisely $kappa_z$. This extended independence is asserted only for $i in S$. The sign can be correlated with the remaining background, and indices outside $S$ can enter its definition.

Define the coarse width on any actual predicate $r$ by

#[#set math.equation(numbering: n => "(102)")
 $ F_z \( r \) = integral frac(phi.alt_C \( B + s sigma r \) - phi.alt_C \( B - s sigma r \), s) thin upright(d) kappa_z^S \( B \, C \, sigma \) . $ <eq:coarse-width>]

Fresh $r$ is independent of this background. Averaging over uniform $i in S$ in the ordinary experiment is another description of this integral. Because its two amplitude terms ignore $sigma$, the same extended kernel also represents Equation (101). This supplies one common background for all three values at $a r \, - sigma r \, + sigma r$.

Figure 1 records the two conditional laws and their common marginal.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.2), [#text(size: 9pt)[Fix the exterior $cal(Z) =z$; write $Y_i=( cal(R)_i,a_i)$.]])
  content((-3.95, 0), [#box(width: 6.453cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Every $i in I$#linebreak() $(B^j_( not i),C^-) divides (z,Y_i) tilde.op kappa_z$#linebreak() The current fine partition $C_j$ is absent.]]])])
  content((3.95, 0), [#box(width: 6.453cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Only $i in S$#linebreak() $(B^j_( not i),C^-, sigma ) divides (z,Y_i) tilde.op kappa_z^S$#linebreak() $sigma = "sign" K_(j-1)(B_ compose^j)$]]])])
  line((0.7236, 0), (-0.7236, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  content((0, 0), [#text(size: 7pt)[forget $sigma$]], anchor: "south", padding: 0.1176cm)
  content((-3.95, -2), [#box(width: 6.453cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s#h(0.1667em) g_z(r,a)= bb(E)_( kappa_z) [ phi_C(B+"sar")$#linebreak() $- bb(E)_(a' tilde.op lambda ) phi_C(B+"sa"'r) ]$]]])])
  content((3.95, -2), [#box(width: 6.453cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s#h(0.1667em) F_z(r)= bb(E)_( kappa_z^S) [ phi_C(B+s sigma r)$#linebreak() $- phi_C(B-s sigma r) ]$]]])])
  line((-3.95, -0.675), (-3.95, -1.4), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  content((-3.95, -1.038), [#text(size: 7pt)[amplitude response]], anchor: "west", padding: 0.1176cm)
  line((3.95, -0.675), (3.95, -1.4), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  content((3.95, -1.038), [#text(size: 7pt)[signed width]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The common coarse backgrounds, conditional on $cal(Z) = z$. The displayed laws do not depend on $Y_i$; their index ranges differ. Deleting the whole subbatch $S$ in $B_compose^j$ makes the reference sign independent of each tested $Y_i$, conditional on $z$, while allowing dependence on the remaining background. The $\( B \, C \)$ marginal of $kappa_z^S$ is $kappa_z$, so the amplitude response can also be averaged over the extended kernel. Here $C = C^(-)$, $phi.alt_C$ uses only preceding smoothing, and the fresh predicate and amplitudes are independent of the background conditional on $z$. ],
) <fig:conditional-kernels>

=== 7.2 Forcing a slot and rebuilding the fine state <forcing-a-slot-and-rebuilding-the-fine-state>

Fix a mode $m$ and an index $i in S$. Let $cal(H)_i$ contain $z$, $X$, every current primary pair $Y_k$, and all current trials $T_k$ except $T_i$. In particular it retains $Y_i$, whose original question list still enters the fine partition when its summand is replaced. The preceding partitions, $B_compose^j$, and $sigma$ are $cal(H)_i$-measurable. The event

$ E_i = { T_i upright(" is replacement in mode ") m \, med tau_i = sigma \, med chi_i = + 1 } $

has the exact conditional probability

#[#set math.equation(numbering: n => "(103)")
 $ bb(P) \( E_i divides cal(H)_i \) = frac(alpha, 2 L 2^J) = beta . $ <eq:match-probability>]

The number of formal parent cells is deterministic; empty cells and colliding labels have not reduced $J$. Conditional on $E_i \, cal(H)_i$, the path data have their original mode law and $u$ is independent uniform.

Let $Gamma \( cal(H)_i \, T_i \)$ construct the entire stage-$j$ state, including the score and the fine partition rebuilt from all unchanged primary question lists and the trial’s new path question list. For every nonnegative measurable full-state function $Q_0$, the forced experiment preserves the ordinary marginal law of $cal(H)_i$ and satisfies

#[#set math.equation(numbering: n => "(104)")
 $ bb(E)_(upright("forced")) \[ Q_0 \( Gamma \) divides cal(H)_i \] = bb(E)_(upright("actual")) \[ Q_0 \( Gamma \) upright(bold(1))_(E_i) \/ beta divides cal(H)_i \] . $ <eq:full-state-forcing>]

This is just conditional expectation under the event in Equation (103); it applies because the event constrains only the mode, descriptor, and sign. It also holds for integrable signed functions by subtraction. One may include independent numerical noises in $Gamma$, or integrate them in $h_j$ first.

In particular the identity permits $Q_0$ to depend on the new $C_j$, its fine gradient, marks, and all current questions. There is no conditioning on $C_j$ in Equation (103): that partition is an output of $Gamma$. Deleting the whole subbatch in $B_compose^j$ ensures that the reference sign stays fixed as $T_i$ is redrawn. It is essential here that we do not retain the old trial’s fine partition after replacing its path data.

Apply Equation (104) for each $i in S$, then average. On the resulting single actual state there is one common $C_j$, one $K_j$, and one $sigma$. Put

$ d_z = \| K_(j \, z) \| - sigma_("par" \( z \)) K_(j \, z) \, #h(2em) f_m = "avg"_(i in S) upright(bold(1))_(E_i) . $

Then

#[#set math.equation(numbering: n => "(105)")
 $ "avg"_(i in S) bb(E)_(upright("forced")) sum_z d_z = bb(E)_(upright("actual")) sum_z d_z f_m / beta lt.eq 2 bb(E) sum_z d_z + 2 / beta bb(E) sum_(z upright(" marked")) \| K_(j \, z) \| lt.eq 4 Delta nu . $ <eq:match-defect-transfer>]

Indeed all descriptor counts are tested, so the count for the realized $sigma$ is among them. On an unmarked cell $f_m lt.eq 2 beta$; everywhere $f_m lt.eq 1$ and $0 lt.eq d_z lt.eq 2 \| K_(j \, z) \|$. This is a pointwise empirical inequality. It does not presume any independence of a gradient and its match indicators. Goodness and the marked-gradient budget pay for its last two terms. In particular the unmarked defect is not multiplied by the reciprocal match probability.

For a vertical mode, retain the hit in the empirical fraction: $f_(m \, z)^(upright("hit")) = "avg"_(i in S) upright(bold(1))_(E_i) r_i^(upright("path")) \( z \)$. The same calculation, now conditional on $cal(Z)$, gives

#[#set math.equation(numbering: n => "(106)")
 $ "avg"_(i in S) bb(E)_(upright("forced")) [sum_z \| K_(j \, z) \| r_i^(upright("path")) \( z \) thin mid(bar.v) thin cal(Z)] lt.eq 2 p_(upright("law")) bb(E) \[ \| K_j \|_1 divides cal(Z) \] + beta^(- 1) bb(E) [sum_(z upright(" marked")) \| K_(j \, z) \| thin mid(bar.v) thin cal(Z)] . $ <eq:match-hit-transfer>]

This uses the hit-match marking rule on each unmarked cell and the bound $f_(m \, z)^(upright("hit")) lt.eq 1$ elsewhere.

=== 7.3 Endpoint conversion and path inequalities <endpoint-conversion-and-path-inequalities>

In the forced experiment use $tau = sigma$ and $chi = + 1$. Compared with an independent uniform descriptor, this adaptive choice is dominated by the factor $2^J$: conditional on the remaining variables, the latter gives that descriptor probability $2^(- J)$. The fine state is rebuilt in both experiments by the same rule. Thus Equation (89) implies, for either endpoint,

#[#set math.equation(numbering: n => "(107)")
 $ "avg"_(i in S) bb(E)_(upright("forced")) frac(\| h_j \( B_(not i)^j + s D^plus.minus \) - h_(j - 1) \( B_(not i)^j + s D^plus.minus \) \|, s) lt.eq Delta nu . $ <eq:adaptive-endpoint-bound>]

The background and the sign use none of the forced slot’s fresh path data. This domination therefore changes only the descriptor choice.

For fixed path questions, mode, descriptor, and amplitude data, the rebuilt fine partition is fixed as $u$ varies. Along

$ B \( u \) = B_(not i)^j + s \[ \( 1 - u \) D^(-) + u D^(+) \] $

ordinary differentiation gives

#[#set math.equation(numbering: n => "(108)")
 $ 1 / s frac(thin upright(d), thin upright(d) u) h_j \( B \( u \) \) = sum_z K_(j \, z) \( B \( u \) \) \( D^(+) \( z \) - D^(-) \( z \) \) . $ <eq:path-derivative>]

Each slope is $sigma_("par" \( z \)) w_z$ with $0 lt.eq w_z lt.eq 2$. Its negative part is bounded, conservatively, by $2 sum_z d_z \( B \( u \) \)$: if $sigma K gt.eq 0$ the coordinate contributes no negative part, whereas if $sigma K < 0$, then $- w_z sigma K lt.eq 2 \( - sigma K \) lt.eq 2 d_z$. Integrating in $u$ and using Equation (104) identifies the uniform-time law with the actual gradient law in Equation (105). Converting the two endpoints with Equation (107) proves, for every mode,

#[#set math.equation(numbering: n => "(109)")
 $ "avg"_(i in S) bb(E)_(upright("forced")) (frac(h_(j - 1) \( B_(not i)^j + s D^(-) \) - h_(j - 1) \( B_(not i)^j + s D^(+) \), s))_(+) lt.eq 10 Delta nu . $ <eq:oriented-path-bound>]

Here eight units pay for fine negative variation and two for the endpoints. The estimates are uniform in the number of slots, cells, and descriptors.

For a vertical mode, the absolute slope in Equation (108) is at most $2 sum_z \| K_(j \, z) \| r \( z \)$. Equation (106), together with $bb(E) \[ \| K_j \|_1 divides cal(Z) \] lt.eq v$, bounds its conditional expected integral by $4 p_(upright("law")) v$ plus a nonnegative error whose expectation is at most $2 Delta nu$. The two conditional endpoint errors add at most $2 Delta nu$ in expectation. Conditional Jensen’s inequality and Equation (102) therefore give a nonnegative function $e_(upright("law")) \( cal(Z) \)$ such that

#[#set math.equation(numbering: n => "(110)")
 $ bb(E)_(r tilde.op P_(upright("law"))) \| F_(cal(Z)) \( r \) \| lt.eq 4 p_(upright("law")) v + e_(upright("law")) \( cal(Z) \) \, #h(2em) bb(E) e_(upright("law")) lt.eq 4 Delta nu . $ <eq:width-vertical>]

This statement also covers zero-probability laws: their expected unmarked contribution is zero and no division by their honest probability has been used.

For an ordered coupling $\( r \, r' \)$, write the difference of coarse widths as the sum of the difference of their upper endpoints and the reversed difference of their lower endpoints. The two corresponding menu entries are $+ sigma r arrow.r + sigma r'$ and $- sigma r' arrow.r - sigma r$. The positive part of a sum is at most the sum of positive parts. Applying conditional Jensen and Equation (109) twice yields

#[#set math.equation(numbering: n => "(111)")
 $ bb(E)_(cal(Z) \, r \, r') \( F_(cal(Z)) \( r \) - F_(cal(Z)) \( r' \) \)_(+) lt.eq 20 Delta nu . $ <eq:width-order>]

The same background kernel is used for both endpoints because fresh comparison data are drawn independently after the background.

For the amplitude comparison, use the common extended kernel described after Equation (102). At one realization abbreviate

$ H_a = phi.alt_C \( B + s a r \) \, #h(2em) H_(-) = phi.alt_C \( B - s sigma r \) \, #h(2em) H_(+) = phi.alt_C \( B + s sigma r \) . $

Let $a'$ be an independent fresh amplitude. For any four real numbers of this form,

#[#set math.equation(numbering: n => "(112)")
 $ \| H_a - H_(a') \| lt.eq H_(+) - H_(-) + sum_(b in \( a \, a' \)) \[ \( H_(-) - H_b \)_(+) + \( H_b - H_(+) \)_(+) \] . $ <eq:amplitude-sandwich>]

The sum counts both amplitudes, including when $a = a'$. Indeed write $H_a - H_(a') = \( H_a - H_(+) \) + \( H_(+) - H_(-) \) + \( H_(-) - H_(a') \)$ and bound the first and last terms by their positive parts. Adding the other two nonnegative terms gives the right side of Equation (112). Repeating with $a \, a'$ exchanged bounds the opposite signed difference by the same expression, proving the absolute-value bound without any ordering assumption on $H_(-) \, H_(+)$.

Divide Equation (112) by $s$ and average over the background and $a'$ with $cal(Z) \, r \, a$ fixed. The absolute value of the averaged left difference is $\| g_(cal(Z)) \( r \, a \) \|$ by Equation (101); the width term averages to $F_(cal(Z)) \( r \)$. The four positive-part errors are supplied by the two amplitude modes, once for $a$ and once for $a'$. Integrating the iid predicate and amplitude laws and applying Equation (109) four times proves

#[#set math.equation(numbering: n => "(113)")
 $ bb(E)_(cal(Z) \, r \, a) \( \| g_(cal(Z)) \( r \, a \) \| - F_(cal(Z)) \( r \) \)_(+) lt.eq 40 Delta nu . $ <eq:width-amplitude>]

Equations (110), (111), and (113) have constants $4 \, 20 \, 40$ independent of all later scales. In their proof the oriented-path constant was ten.

=== 7.4 Selecting an exterior and threshold <selecting-an-exterior-and-threshold>

Draw a threshold $theta.alt$ independently and uniformly from $\[ gamma \/ 4 \, gamma \/ 2 \]$. For each exterior $\( cal(Z) \, theta.alt \)$ define the common Boolean response on actual predicates

$ W \( r \) = upright(bold(1))_({ F_(cal(Z)) \( r \) > theta.alt }) . $

Equation (98) concerns a uniform index in $I$; Equation (101) makes its response exactly the common $g_(cal(Z)) \( r \, a \)$ under the independent iid conjunction and amplitude laws. On $\| g_(cal(Z)) \( r \, a \) \| gt.eq gamma$ but $F_(cal(Z)) \( r \) lt.eq gamma \/ 2$, the positive part in Equation (113) is at least $gamma \/ 2$. Consequently the lost mass is at most $80 Delta nu \/ gamma$. By Equation (81),

#[#set math.equation(numbering: n => "(114)")
 $ bb(E)_(cal(Z) \, theta.alt) \[ upright(bold(1))_({ v lt.eq B_(*) }) bb(P)_(P_(*)^t) \( W = 1 \) \] gt.eq b_(*) p nu \/ 2 . $ <eq:threshold-success>]

Indeed $F > gamma \/ 2$ ensures success for every possible threshold, and the event no longer depends on the auxiliary amplitude.

For every vertical law and each fixed exterior, Equation (110) and $theta.alt gt.eq gamma \/ 4$ give

#[#set math.equation(numbering: n => "(115)")
 $ bb(P)_(upright("law")) \( W = 1 \) lt.eq 16 / gamma p_(upright("law")) v + 4 / gamma e_(upright("law")) \( cal(Z) \) . $ <eq:threshold-upper>]

Each final term has expectation at most $16 Delta nu \/ gamma$. For real numbers $u \, u'$, the probability over this random threshold that $upright(bold(1))_({ u > theta.alt }) > upright(bold(1))_({ u' > theta.alt })$ is at most $4 \( u - u' \)_(+) \/ gamma$, since the relevant threshold interval has length at most $\( u - u' \)_(+)$. Thus Equation (111) gives, for each ordered law,

#[#set math.equation(numbering: n => "(116)")
 $ bb(E)_(cal(Z) \, theta.alt) bb(P) \( W \( r \) > W \( r' \) divides cal(Z) \, theta.alt \) lt.eq 80 Delta nu \/ gamma . $ <eq:threshold-order>]

Let $e_(upright("tot")) \( cal(Z) \, theta.alt \)$ be the sum of all $V$ upper-error terms in Equation (115) and all $Q$ conditional violation probabilities in Equation (116). It is nonnegative and

#[#set math.equation(numbering: n => "(117)")
 $ bb(E) e_(upright("tot")) lt.eq A_t Delta nu \/ gamma . $ <eq:total-exterior-error>]

Discard exteriors for which $e_(upright("tot")) > epsilon v$. The iid law is among the vertical laws, so Equation (115) bounds the integrated iid success on this discarded set by

$ (frac(16 p, gamma epsilon) + 1) bb(E) e_(upright("tot")) lt.eq b_(*) p nu \/ 4 . $

This estimate is relative to $nu$ and remains valid for arbitrarily small positive cut variance. Equations (114) and (117) leave at least $b_(*) p nu \/ 4$ integrated success on exteriors satisfying $v lt.eq B_(*)$ and $e_(upright("tot")) lt.eq epsilon v$. An exterior in this set with $v = 0$ has zero success by its iid upper bound. Moreover $bb(E) v lt.eq \( T_0 + 1 \) nu$ by Equation (90). Since $b_0 \( T_0 + 1 \) = b_(*) \/ 8$, there must be a remaining exterior with $v > 0$ and

$ bb(P)_(P_(*)^t) \( W = 1 \) gt.eq b_0 v p . $

Otherwise its integrated success would be at most $b_(*) p nu \/ 8$. At this same exterior, every error summand is at most $epsilon v$. Consequently every fixed type pattern and prescribed ordered law satisfy

$ bb(P)_(upright("pat")) \( W = 1 \) lt.eq v \( K_0 p_(upright("pat")) + epsilon \) \, #h(2em) bb(P) \( W \( r \) > W \( r' \) \) lt.eq epsilon v \, #h(2em) 0 < v lt.eq B_0 . $

This is exactly Lemma 12, with a single response depending only on the conjunction as a predicate. It produces the valuation forbidden by Lemma 11 in a NO instance. The contradiction proves the soundness assertion of Theorem 13.

=== 7.5 The interface for finite compilation <subsec:score-compilation>

We record the effective structure of the construction, including its dependence on input size. The primitive test samplers use fixed mixtures of uniform choices from polynomial-size finite sets. They therefore have polynomially enumerable discrete sample spaces with rational probabilities of polynomial bit length and inverse-polynomial lower bounds on positive seed probabilities. For fixed $T_0$, all choices in Equation (80), the conjunction length, the path menu, $Delta$, $M$, and then the sequential stage parameters are constants. The upper bounds on the required integers and the numerical precision can be arbitrarily large functions of $T_0$; none depends on the instance size.

#thm([Proposition 7.1.])[
  (Finite form structure).  #emph[The demand law and the raw comparison measures in Theorem 13 have polynomially enumerable discrete seeds, whose positive probabilities are bounded below by an inverse polynomial in input size. For each seed, after finitely many fixed subdivisions of numerical boxes, their conditional densities are nonnegative rational polynomials and the score table entries are rational polynomials of bounded degree in a fixed number of numerical variables. There are only finitely many such numerical polynomial patterns, independent of input size. The total raw comparison mass is finite and bounded by a constant. For any fixed finite grid and deterministic entrywise rounding rule, every positive rounded demand mass or comparison-pair mass has an inverse-polynomial lower bound.]
] <prop:score-compilation>

#proof[
  Each sampled predicate has bounded arity and a polynomially enumerable presentation law. A conjunction, a comparison path, and each slot use a fixed number of those samples. The number of slots, stage choices, freeze subsets, formal descriptors, and resampling indicators is fixed. Enumerating their products therefore takes a polynomial number of steps. All discrete probabilities are rational, with polynomial bit length: products involve only a fixed number of primitive probabilities and fixed rational weights. The same observation preserves an inverse-polynomial lower bound for each positive seed probability. Descriptor interpretation and refining the lists require fixed-size truth tables with positions named by the seed. Equality of names and the values of the finite test tables can be computed in polynomial time.
  Separate the amplitude atom at zero from its uniform part. All remaining variables are amplitudes, interpolation times, and noises in rational intervals, together with the integration variables in the derivative forms. Their joint densities are products of rational polynomial densities. Absolute derivative weights become polynomial on the two half intervals, and $- f'_(xi_j)$ is already nonnegative on its integration interval. No lookup-dependent descriptor occurs in any measure. All forms are positive measures on these fixed rectangular pieces.
  Fix a seed and an assignment to its bounded list of queried positions. Each predicate value is then zero or one, each descriptor value is a fixed sign, and each mark is determined by the finite trial counts. The scores are sums of rational multiples of amplitudes, times, products of time and fresh amplitude, and noises, multiplied by these fixed Boolean values. Hence every score entry is a polynomial of bounded degree with rational coefficients. The possible local Boolean tables, label-collision patterns, descriptor vectors, and mark sets all range over fixed finite sets. The numerical coefficients $s_j \, xi_j$ and all external form weights have already been fixed. Therefore the polynomial patterns belong to a fixed finite family; actual bit names only select where a table is evaluated. This also shows a uniform bound on arity and range of every score.
  Finally, each derivative integral has mass at most $15 \/ \( 8 xi_j \)$ per differentiated coordinate, and there are finitely many formal cells. Ordinary comparison measures have mass one before their finite external weights. Summing over the fixed set of forms gives a finite bound on total raw mass.
  Fix now a finite grid and entrywise rounding rule. For one numerical pattern, every possible rounded local table, or pair of tables, has mass equal to the integral of its fixed polynomial density over a fixed region of its numerical box. These regions depend only on the pattern and the fixed rounding rule. There are finitely many patterns and rounded tables, so the minimum of all their positive masses is a positive constant. Renaming the queried positions or identifying collisions does not add numerical patterns. Any positive global rounded mass has at least one contributing discrete seed. Multiplying its inverse-polynomial probability by this fixed positive minimum proves the last assertion; identifying identical scores only adds masses. This completes both the proposition and the remaining effective assertions of Theorem 13. ◻
]

The parameter order can now be read without circular dependencies: $T_0$ fixes the resampling and signal constants; these fix $e \, B_(*) \, gamma \, b_0 \, K_0 \, B_0$; the rare-event lemma fixes $t \, epsilon$; then $Delta$ fixes $M$; finally each stage fixes $alpha_j \, m_j \, n_j \, s_j \, xi_j$ in that order. The path constants above do not grow when any later scale is made smaller or any stage size larger.

== 8 Finite graphs with exactly uniform demands <sec:finite-graph>

We now convert Theorem 13 into the graph promised in Theorem 1. The conversion must retain cuts of arbitrarily small positive mass. In particular, replacing the demand by an additive approximation alone would be insufficient. We keep a multiplicative upper bound on the retained demand and attach every remaining vertex to that demand.

Fix an integer $C' > C$, and set

$ A_0 = 10^12 \, #h(2em) kappa = C' A_0 \, #h(2em) T_0 = 100 kappa . $

Apply Theorem 13 with this $T_0$. Write $mu$ for its demand law, and $cal(D)$ for the sum of its raw comparison forms. Thus, for a perfect witness $x$, the total truth cost is at most $4$, and

#[#set math.equation(numbering: n => "(118)")
 $ bb(P) { B^0 \( x \) gt.eq 1 \/ 4 } gt.eq 10^(- 4) \, #h(2em) bb(P) { B^0 \( x \) lt.eq - 1 \/ 4 } gt.eq 10^(- 4) . $ <eq:demand-tails-finite>]

In a NO instance, every measurable binary lookup $h$ with $nu = "Var"_mu \( h \) > 0$ satisfies $cal(D) \( h \) > T_0 nu$. All arities, numerical parameters, and total raw comparison weights below are constants depending on $C$ only.

=== 8.1 Canonical keys and rational integration <canonical-keys-and-rational-integration>

Let $b$ be the number of bit names in the test system. After fixing all parameters of the score construction, unroll each complete demand or comparison experiment, including both endpoints. Count all primitive query occurrences: retained, frozen, and future primary lists, resampled copies, fresh and forced path lists, and all lists defining formal partitions. Counting repetitions gives an effectively computable bound $Q_(*) = Q_(*) \( C \)$ on the number of distinct queried bit names in any experiment. Descriptors, cell indicators, translations, and numerical noises introduce no names beyond those lists. The finite sampler templates and their sample counts are fixed by $C$, so $Q_(*)$ is independent of input size. Choose $k = Q_(*) + 1$; here $k$ is solely the key-enumeration bound. Choose a bounded rational interval containing the ranges of all score functions in these experiments, and a fixed finite rational grid in that interval. Rounding means nearest-grid-point rounding with a fixed rule at ties. A #emph[key] is a grid-valued function on the bit cube, specified by its ordered list of essential bit names and its truth table. Equal functions have the same key; sampling presentations are not part of a key. Enumerate all such keys of arity at most $k$. If the grid has $g$ values, there are at most

$ sum_(j = 0)^k binom(b, j) g^(2^j) $

keys. This is polynomial in the original instance size.

Write $R \( B \)$ for entrywise rounding of a score. If the entrywise error is at most $delta$ and the total raw comparison weight is $W_0$, then for each truth assignment

$ lr(|R \( B \) \( x \) - R \( tilde(B) \) \( x \)|) lt.eq lr(|B \( x \) - tilde(B) \( x \)|) + 2 delta . $

Take the fixed grid fine enough that $2 delta W_0 lt.eq 1$ and $delta < 1 \/ 16$. The total rounded truth cost is then at most $5$, and the two demand tails remain strictly outside $\[ - 1 \/ 8 \, 1 \/ 8 \]$.

Every coloring of the keys extends to a measurable lookup on the scores: apply $R$ and then the coloring. The range can be truncated outside the interval used by the experiments and the function defined arbitrarily on any unused scores. Measurability follows because each rounded table is specified by finitely many polynomial inequalities in the numerical parameters of each experiment. Consequently the soundness assertion of Theorem 13 applies to every key coloring.

Here and below, $mu_i$ denotes the pushforward demand mass of key $i$. For an unordered pair of distinct keys, let $c_(i j)^0$ be its total raw comparison weight, adding both possible orderings. Self-comparisons contribute zero. Thus

#[#set math.equation(numbering: n => "(119)")
 $ cal(D) \( h \) = sum_(i < j) c_(i j)^0 lr(|h_i - h_j|) . $ <eq:raw-capacities>]

The numbers $c_(i j)^0$ and $mu_i$ need not be rational. The next observation gives the particular approximations we require without exact real integration.

#thm([Lemma 8.1.])[
  (Rational compilation).  #emph[In polynomial time one can compute nonnegative rational numbers $c_(i j)$ and $l_i$ such that 
#[#set math.equation(numbering: n => "(120)")
 $ & c_(i j) gt.eq c_(i j)^0 \, #h(2em) sum_(i < j) \( c_(i j) - c_(i j)^0 \) lt.eq 1 \,\
 & 0 lt.eq l_i lt.eq mu_i \, #h(2em) L := sum_i l_i gt.eq 1 - 10^(- 6) . $ <eq:capacity-upper>]

 Their binary encoding lengths are polynomial. Every positive $l_i$ is at least an inverse polynomial in the input size, with the polynomial depending only on $C$.]
] <lem:rational-compilation>

#proof[
  Enumerate the discrete seeds in the demand and comparison experiments. There are polynomially many seeds: the number of samples per experiment is fixed, and every bit-test sampling space has polynomial size. Their probabilities are rational with polynomial encoding length, and every positive discrete sampling probability is at least an inverse polynomial.
  Conditional on a seed, the remaining numerical variables range over rectangular boxes of fixed dimension. Atoms and signs are separate discrete choices. The smoothing densities and comparison weights are polynomial with rational coefficients on finitely many rectangular pieces; absolute derivative weights are split at their changes of sign. Each score-table entry is a polynomial with fixed rational coefficients in these variables. These assertions also hold for forced-slot comparisons, common-noise comparisons, path interpolation, cell translation, and the formal cell sums: all involve a fixed number of additions and products of the prescribed amplitudes, marks, and shifts. Only the local Boolean tables of the queried predicates and their bit-name identifications enter these formulas. Their sizes are bounded, so, after forgetting the actual bit names, only a fixed finite collection of numerical patterns occurs. In particular, the lookup-dependent reference sign used in the proof of soundness is not used to define any comparison weight. The input-dependent rational seed probabilities remain outside these conditional numerical integrals; they do not enlarge the finite family of polynomial coefficients.
  Subdivide each numerical box into rational boxes. For every grid boundary and every table entry, first check whether the polynomial entry is identically equal to that boundary; if so, resolve the tie by the fixed rounding rule. Otherwise its equality set has Lebesgue measure zero. Indeed, a nonzero polynomial in one variable has finitely many roots; in higher dimension expand in the last variable, apply the induction hypothesis to the simultaneous vanishing of its coefficients, and then apply the one-variable assertion on the remaining fibers. Integration over fibers proves the claim.
  Coefficient bounds on a bounded box give a rational Lipschitz bound for every polynomial entry. Comparing its value at a rational box corner with this bound times the mesh identifies every box on which rounding is determined. Apart from the finitely many null boundary sets, each point is eventually in such a box. Since the weights are bounded, the total weighted mass of unresolved boxes tends to zero.
  On a resolved box integrate its polynomial weight term by term, obtaining an exact rational mass. For demand, discard unresolved boxes. For capacities, assign the full box mass to every table pair that could occur there. One may conservatively use every grid-valued table on the queried coordinates: each has at most $Q_(*) < k$ essential names and hence a key in the enumerated universe. Their number is a constant. This gives an upper bound for each pair mass. Its excess is bounded by that constant times the weighted unresolved mass. Take the mesh fine enough that demand loses at most $10^(- 6)$ and capacity gains at most $1$ in total. Because the numerical patterns form a fixed finite collection, one fixed mesh works for every seed and every input. Equivalently, rational subdivision can continue until the explicit unresolved-mass bounds meet these tolerances. Averaging these bounds with the seed probabilities gives the stated errors; the errors are not summed without those probabilities. More explicitly, let $U_(f \, omega \, ell)$ be the unresolved polynomial mass of rectangular piece $ell$ in comparison form $f$, conditional on seed $omega$, with its external form weight included. If $pi_(f \, omega)$ is the seed probability and $R_(f \, omega \, ell)$ bounds the number of candidate unordered distinct key pairs, require
  $ sum_f sum_omega pi_(f \, omega) sum_ell R_(f \, omega \, ell) U_(f \, omega \, ell) lt.eq 1 . $
  All formal-cell, derivative-coordinate, and rectangular pieces are counted with their multiplicities. The analogous demand sum, with no pair factor, must be at most $10^(- 6)$. These are exact rational stopping tests. A common mesh depth succeeds for every numerical pattern; an input that stops earlier uses a depth no larger than that fixed bound.
  At this fixed mesh, the positive retained conditional demand-box masses belong to a fixed finite set of positive rational numbers. The same is true over all mesh depths up to the fixed bound. Each therefore has a positive constant lower bound. A positive $l_i$ includes one of these masses multiplied by a positive discrete seed probability, proving the inverse-polynomial lower bound. There are polynomially many seeds and a constant number of boxes and table entries per seed. Their rational arithmetic, including the final sums, has polynomial bit complexity. ◻
]

Normalize the retained demand by $hat(mu)_i = l_i \/ L$. From Equations (120) we have, for every key and every set $E$ of keys,

#[#set math.equation(numbering: n => "(121)")
 $ hat(mu)_i lt.eq 2 mu_i \, #h(2em) hat(mu) \( E \) gt.eq mu \( E \) - 10^(- 6) . $ <eq:retained-demand>]

For the second assertion use $hat(mu) \( E \) gt.eq l \( E \)$ and $mu \( E \) - l \( E \) lt.eq 1 - L$.

=== 8.2 Replication and auxiliary vertices <replication-and-auxiliary-vertices>

Let $m$ be the number of keys, and choose an integer $K$ at least $4 kappa m$ and at least the reciprocal of the smallest positive $hat(mu)_i$. Lemma 16 permits $K$ of polynomial magnitude. Replace key $i$ by a cluster of

$ n_i = cases(delim: "{", ceil.l K hat(mu)_i ceil.r \, & hat(mu)_i > 0 \,, 1 \, & hat(mu)_i = 0) $

vertices, designating one representative. Put $N = sum_i n_i$ and $w_i = n_i \/ N$. Since $K lt.eq N lt.eq K + m$, we obtain

#[#set math.equation(numbering: n => "(122)")
 $ 1 / 2 hat(mu)_i lt.eq w_i lt.eq 2 hat(mu)_i quad \( hat(mu)_i > 0 \) \, #h(2em) alpha := sum_(hat(mu)_i = 0) w_i lt.eq frac(1, 4 kappa) . $ <eq:replication-weights>]

For the upper bound use $K hat(mu)_i gt.eq 1$; for the lower bound use $K gt.eq m$. Every key has a positive number of copies.

Place capacity $c_(i j)$ between representatives $i \, j$. Join every other vertex in cluster $i$ to its representative by an edge of capacity $2 kappa$. Finally, if $hat(mu)_i = 0$ and $hat(mu)_j > 0$, add capacity

$ 2 kappa w_i hat(mu)_j $

between their representatives. These last edges are the #emph[tethers]. Add capacities when edges coincide, and set all diagonal capacities to zero. Give every unordered pair of distinct vertices demand exactly one. The output threshold is the positive rational number

#[#set math.equation(numbering: n => "(123)")
 $ a = A_0 / N^2 . $ <eq:final-threshold>]

=== 8.3 Completeness <completeness>

Suppose $x$ is a perfect witness. For a common threshold $theta in \[ - 1 \/ 8 \, 1 \/ 8 \]$, color key $i$ by $h_i = upright(bold(1))_({ i \( x \) > theta })$, and give its copies the same color. The tails in Equation (118), their preservation by rounding, and Equations (121)–(122) show that both sides of every such cut have counting mass at least

$ 1 / 2 \( 10^(- 4) - 10^(- 6) \) gt.eq tau \, #h(2em) tau := 10^(- 4) \/ 4 . $

Thus all these cuts are proper and nonempty.

Take $theta$ uniformly in that interval. For any two real values $u \, v$, the probability that the threshold separates them is at most $4 lr(|u - v|)$. The expected raw rounded comparison capacity is consequently at most $4 dot.op 5 = 20$. The excess in Equation (120) contributes at most $1$, and the total tether capacity is $2 kappa alpha lt.eq 1 \/ 2$. No coherence edge crosses. In particular, the expected cut capacity is at most $22$, so some threshold cut has capacity at most $22$. If its counting mass is $z$, then $z \, 1 - z gt.eq tau$ and

$ frac("cap" \( S \, V \\ S \), \| S \| \( N - \| S \| \)) lt.eq frac(22, N^2 tau^2) < A_0 / N^2 = a \, $

because $A_0 tau^2 = 625 > 22$.

=== 8.4 Soundness <soundness>

Suppose the formula is unsatisfiable and a nonempty proper cut has ratio at most $C' a$. Let $z = \| S \| \/ N$ and let $T$ be its capacity. Then

#[#set math.equation(numbering: n => "(124)")
 $ T lt.eq kappa z \( 1 - z \) lt.eq kappa \/ 4 . $ <eq:putative-small-cut>]

A split cluster would cut an edge of capacity $2 kappa$, so every cluster is monochromatic. The cut therefore determines a binary coloring $h_i$ of the keys and hence a measurable lookup on scores. Set

$ nu = "Var"_mu \( h \) \, #h(2em) L_(upright("aux")) = sum_(hat(mu)_i = 0) w_i sum_j hat(mu)_j lr(|h_i - h_j|) . $

The tethers contribute exactly $2 kappa L_(upright("aux"))$.

We claim

#[#set math.equation(numbering: n => "(125)")
 $ z \( 1 - z \) lt.eq 36 nu + L_(upright("aux")) . $ <eq:variance-transfer>]

To prove this, draw a key with distribution $w$. Retain it if its $hat(mu)$ mass is positive, and otherwise replace it by an independent $hat(mu)$ draw. The color changes with probability $L_(upright("aux"))$. The replacement distribution is

$ rho_j = upright(bold(1))_({ hat(mu)_j > 0 }) w_j + alpha hat(mu)_j lt.eq 3 hat(mu)_j lt.eq 6 mu_j . $

Apply this coupling independently to two $w$ draws. Their original disagreement probability is $2 z \( 1 - z \)$; their replacement disagreement probability is at most $36 dot.op 2 nu$ by the product domination $rho ⊗ rho lt.eq 36 mu ⊗ mu$. A union bound for the two possible color changes proves Equation (125).

Combining the claim with Equation (124) and the tether lower bound gives

$ T lt.eq 36 kappa nu + kappa L_(upright("aux")) lt.eq 36 kappa nu + T \/ 2 \, #h(2em) upright("hence") #h(2em) T lt.eq 72 kappa nu . $

Moreover $nu > 0$: otherwise these inequalities give $T = 0$, then $L_(upright("aux")) = 0$, and Equation (125) gives $z \( 1 - z \) = 0$, contrary to the cut being proper and nonempty. By Equations (119)–(120),

$ cal(D) \( h \) lt.eq T lt.eq 72 kappa nu < T_0 nu . $

This contradicts Theorem 13. Every nonempty proper cut in a NO instance therefore has ratio strictly greater than $C' a$.

=== 8.5 Complexity and conclusion <complexity-and-conclusion>

Every enumeration above is polynomial in the original formula size; its exponent may depend on $C$. The rational compilation has polynomial bit complexity, the replication creates polynomially many vertices, and all capacities and the threshold have polynomial binary encodings. The construction does not inspect a satisfying assignment or a candidate cut. It is therefore a polynomial-time reduction with

$ upright("YES") : med Phi \( G \) lt.eq a \, #h(2em) upright("NO") : med Phi \( G \) > C' a . $

A factor-$C$ approximation outputs a cut of ratio at most $C a < C' a$ in the YES case, whereas every cut has ratio greater than $C' a$ in the NO case. Testing the output ratio against the rational number $C' a$ decides the original satisfiability instance. This proves Theorem 1.


#bibliography("refs.bib", style: "ieee", title: [References])
