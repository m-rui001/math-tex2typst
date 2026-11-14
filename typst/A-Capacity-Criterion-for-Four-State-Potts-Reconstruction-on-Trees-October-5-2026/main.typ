#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Capacity Criterion for Four-State Potts Reconstruction on Trees]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $T$ be an infinite locally finite rooted tree with root $rho$.
  Assume that every vertex has at most $B$ children, where $B$ is a fixed positive integer;
  vertices with zero or one child are allowed. Write $\| v \|$ for the depth of a vertex,
  $"ch" \( v \)$ for its children, and $L_n = { v : \| v \| = n }$. The tree is deterministic and known to the observer.

Fix $0 < lambda < 1$. Give the root a uniform spin in $\[ 4 \]$,
  and transmit spins independently along edges conditional on their parent spins, using

#[#set math.equation(numbering: n => "(1.1)")
 $ P_lambda \( j divides i \) = lambda upright(bold(1))_({ i = j }) + frac(1 - lambda, 4) . $ <eq:channel>]

For the uniform probability vector $sans(u) = \( 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \)$, put

$ a_n \( T \, lambda \) = bb(E) thin "TV" #scale(x: 120%, y: 120%)[\(]
  bb(P) \( sigma_rho in dot.op divides sigma_(L_n) \) \, sans(u) #scale(x: 120%, y: 120%)[\)] \, wide
  "TV" \( p \, sans(u) \) = 1 / 2 sum_(i = 1)^4 \| p_i - 1 \/ 4 \| . $

Data processing makes $a_n$ nonincreasing. We say that #emph[reconstruction occurs] if its limit
  $a_oo \( T \, lambda \)$ is positive.

A nonnegative flow $theta$ to infinity assigns a nonnegative number to each edge,
  with incoming flow equal to the sum of outgoing flows at every nonroot vertex. Its mass is

$ \| theta \| = sum_(w in "ch" \( rho \)) theta \( rho \, w \) . $

For an edge $e$, let $\| e \|$ be the depth of its child endpoint,
  and let $partial T$ denote the infinite rays from the root. Define

#[#set math.equation(numbering: n => "(1.2)")
 $ V_lambda \( theta \, xi \) & = sum_(e in xi) #scale(x: 120%, y: 120%)[\(] lambda^(- 2 \| e \|) theta \( e \)
   #scale(x: 120%, y: 120%)[\)]^2 \, wide xi in partial T \,\
"Cap"_(3 \, lambda) \( T \) & = sup {\| theta \| : sup_(xi in partial T) V_lambda \( theta \, xi \) lt.eq
  1} . $ <eq:potential>]

The zero flow is allowed. This is the $L^3$ nonlinear capacity with edge resistances $lambda^(- 2 \| e \|)$:
  in the standard $L^p$ normalization, the path potential has exponent $p - 1$ #cite(label("PP10")) Section 2.

#thm([Theorem 1.1.])[
  #emph[Let $T$ be an infinite rooted tree with at most $B < oo$ children per vertex, and let $0 < lambda < 1$.
    For the broadcast model (1.1),
$ a_oo \( T \, lambda \) > 0 quad arrow.l.r.double quad "Cap"_(3 \, lambda) \( T \) > 0 . $

]
] <thm:main>

There is no regularity or growth-rate assumption on the tree.
  In particular, the criterion applies at the exponential Kesten–Stigum boundary,
  where an exponential-growth test alone does not settle the question. The exclusion of $lambda = 1$ is essential:
  an infinite ray then reconstructs perfectly, whereas its capacity in (1.2) is zero.

=== History and relation to earlier work <history-and-relation-to-earlier-work>

The second-eigenvalue scale in tree broadcasting originates in the branching-process work of Kesten and Stigum
  #cite(label("KS66")). For a regular tree with $d$ children per vertex,
  the corresponding bound guarantees reconstruction when $d lambda^2 > 1$ #cite(label("MP03")).
  Evans, Kenyon, Peres, and Schulman #cite(label("EKPS00")) developed the relation between broadcasting,
  the Ising model, and electrical capacity. For Potts channels,
  Sly #cite(label("Sly11")) proved sharpness of the second-eigenvalue bound for three states on regular trees of
  sufficiently large degree, including nonreconstruction at equality,
  and proved nonsharpness for at least five states. Mossel, Sly,
  and Sohn #cite(label("MSS25")) established three- and four-state nonreconstruction at and below the bound for
  Galton–Watson families of sufficiently large mean degree,
  under hypotheses covering regular and Poisson offspring. At four states the quadratic correction vanishes,
  making higher-order terms decisive #cite(label("Sly11")) #cite(label("MSS25")).

Pemantle and Peres #cite(label("PP10")) formulated critical Ising criteria on arbitrary trees using nonlinear
  capacities and concave recursions. Their free-boundary criterion uses $L^2$ capacity with squared channel
  resistances, whereas their plus-boundary criterion uses $L^3$ capacity with unsquared channel resistances
  #cite(label("PP10")) Theorems 2.1–2.2. The present four-state reconstruction criterion has the $L^3$ exponent
  but the squared channel resistance $lambda^(- 2 \| e \|)$.
  The nonlinear recursion used below is the $p = 3$ instance of their capacity recursion #cite(label("PP10"))
  Lemma 3.1 and Corollary 3.4; we give the needed flow construction directly.

Our essential probabilistic input is the preserved class of posterior laws and its moment-saving inequality from
  #emph[The Reconstruction Threshold for the Ferromagnetic Four-State Potts Model] #cite(label("OpenAI26Potts"))
  Proposition 3.2. That companion studies the threshold on regular and Poisson Galton–Watson trees.
  Its posterior-law statement allows arbitrary channel parameters and conditionally independent products,
  which is the scope needed here. We state this input precisely in Section 2;
  its polynomial-certificate proof is not repeated. All remaining arguments for Theorem 1 are proved below.

=== Proof strategy <proof-strategy>

We measure a posterior $p$’s information by the quadratic statistic $m = 4 bb(E) \| p - sans(u) \|^2$.
  The companion inequality saves a cubic term when two informative branches are combined.
  For the implication from reconstruction to capacity, a change of variables $m mapsto m +
  K m^3$ turns this branching saving into a nonlinear inequality that also has a strict saving at one-child
  vertices. A direct telescoping construction then produces an admissible flow of positive mass.

The converse starts from a flow and scales it down. At each observation level we add independent noise,
  chosen separately at each vertex $v$ so that its terminal information equals the scaled flow entering $v$
  divided by $lambda^(2 \| v \|)$. The resulting information stays below this depth-weighted flow profile.
  To bound what is lost, we track a signed third moment in addition to $m$.
  In the four-state coordinates, the mixed quadratic term in the product formula cancels.
  The remaining loss is controlled by the third moment, whose propagation along an edge has factor $lambda^3$,
  rather than $lambda^2$.

Sampling a ray according to the flow converts the accumulated loss into sums along a single path.
  The two propagation factors leave a summable kernel $lambda^(j - i)$ between depths $i$ and $j$.
  The capacity bound controls its quadratic path sum, and a single choice of noise scale works at every
  observation depth. This flow-calibrated degradation and third-moment estimate avoid any need for comparable
  branch sizes or a strict exponential growth inequality.

Section 2 introduces the posterior calculus and the companion input.
  Section 3 constructs the flow from reconstruction. Section 4 proves the local moment estimates,
  and Section 5 uses them to prove the converse. Throughout, set

$ r = lambda^2 in \( 0 \, 1 \) . $

== 2 Posterior experiments and the companion input <sec:posteriors>

An experiment consists of an observation about a uniform input spin in $\[ 4 \]$.
  Let $p$ be its posterior vector and $mu$ the law of $p$ under the marginal law of the observation.
  A posterior law is #emph[symmetric] if it is invariant under all permutations of the four entries. Define

$ L = mat(delim: "(", 1, 1, - 1, - 1; 1, - 1, 1, - 1; 1, - 1, - 1, 1) \, wide x = L p \, wide A \( p \) = \| x \|^2 \, $

and put

#[#set math.equation(numbering: n => "(2.1)")
 $ m \( mu \) = bb(E)_mu A \, wide tau \( mu \) = bb(E)_mu \[ x_1 x_2 x_3 \] \, wide
   h \( mu \) = \| tau \( mu \) \| . $ <eq:statistics>]

Here and below, vector norms are Euclidean. The rows of $L$ are orthogonal and span the orthogonal complement of
  the constant vector. Consequently

#[#set math.equation(numbering: n => "(2.2)")
 $ A \( p \) = 4 \| p - sans(u) \|^2 \, wide 0 lt.eq A \( p \) lt.eq 3 \, wide 1 / 8 A \( p \) lt.eq
   "TV" \( p \, sans(u) \) lt.eq 1 / 2 sqrt(A \( p \)) . $ <eq:posterior-bounds>]

The lower bound follows from $\| p_i - 1 \/ 4 \|^2 lt.eq \| p_i - 1 \/ 4 \|$; the upper bound is Cauchy–Schwarz.
  In expectation,

#[#set math.equation(numbering: n => "(2.3)")
 $ 1 / 8 m \( mu \) lt.eq bb(E) thin "TV" \( p \, sans(u) \) lt.eq 1 / 2 sqrt(m \( mu \)) . $ <eq:expected-TV>]

Under degradation of an observation, the new posterior is the conditional expectation of the old one given the new
  observation. Convexity of $A$ therefore makes $m$ nonincreasing under data processing.

=== 2.1 Channels and products <channels-and-products>

In a channel step with parameter $t in \[ 0 \, 1 \]$, first transmit a uniform input $I$ to $J$ through $P_t$,
  then observe an experiment about $J$. The uniform distribution is stationary and the channel is symmetric,
  so the posterior about $I$ is $sans(u) + t \( p - sans(u) \)$. Thus

#[#set math.equation(numbering: n => "(2.4)")
 $ x mapsto t x \, wide m mapsto t^2 m \, wide tau mapsto t^3 tau \, wide h mapsto t^3 h . $ <eq:channel-scaling>]

The completely revealing experiment has $m = 3$, while the uninformative experiment has $m = h = 0$.

If two observations are independent conditional on the same input spin,
  write $mu star.op nu$ for their combined posterior law. The normalized-product rule below is standard in
  posterior recursions for reconstruction; see Mézard and Montanari #cite(label("MM06")) Sections 2.2–2.4.
  Sample $p \, q$ independently from their marginal posterior laws $mu \, nu$.
  The joint marginal law of the observations is obtained by weighting this product law by

#[#set math.equation(numbering: n => "(2.5)")
 $ Z = 4 sum_(i = 1)^4 p_i q_i \, wide P_i = frac(4 p_i q_i, Z) . $ <eq:product-rule>]

The value of $P$ at $Z = 0$ is irrelevant. Indeed, the likelihood of each observation conditional on input $i$,
  relative to its marginal law, is $4 p_i$ or $4 q_i$. Formula (2.5) follows by averaging their product over the
  uniform input. In particular, $bb(E) Z = 1$. Symmetry is preserved by both channel steps and products.

The columns of $L$ are the four sign triples whose product is one.
  Permuting these columns acts on $x$ by coordinate permutations and even sign changes.
  For any symmetric posterior law, it follows that

#[#set math.equation(numbering: n => "(2.6)")
 $ bb(E) x_i = 0 \, wide bb(E) x_i x_j = m / 3 upright(bold(1))_({ i = j }) \, $ <eq:symmetric-moments>]

and every degree-three coordinate monomial except $x_1 x_2 x_3$ has zero expectation. Also $\| x_i \| lt.eq 1$.
  Any coordinate monomial of degree at least two is therefore bounded in absolute value by $\| x \|^2$:
  retain two factors and use $\| x_i x_j \| lt.eq \( x_i^2 + x_j^2 \) \/ 2$,
  or $\| x_i \|^2$ when the indices agree. In particular,

#[#set math.equation(numbering: n => "(2.7)")
 $ h \( mu \) lt.eq m \( mu \) . $ <eq:h-bound>]

=== 2.2 The moment-saving input <the-moment-saving-input>

We use the following statement from the companion manuscript.
  The existence and preservation of the class, not only symmetry, are essential to its upper bound.

#thm([Proposition 2.1.])[
  (Companion input, #cite(label("OpenAI26Potts")) Proposition 3.2 and Equations (3.8)–(3.9)).  #emph[There is a
    class $cal(C)$ of symmetric posterior laws containing the revealing and uninformative laws and preserved by
    channel steps with any parameter in $\[ 0 \, 1 \]$ and by conditionally independent products.
    For $mu \, nu in cal(C)$,
#[#set math.equation(numbering: n => "(2.8)")
 $ m \( mu star.op nu \) lt.eq m \( mu \) + m \( nu \) - c
   (bb(E)_mu \[ A^2 \] m \( nu \) + m \( mu \) bb(E)_nu \[ A^2 \]) \, wide c = 1 / 1000 . $ <eq:moment-saving>]

]
] <prop:companion>

Every finite-depth subtree experiment used here has law in $cal(C)$.
  This includes observations of a descendant level and observations in which each terminal spin is independently
  passed through its own channel $P_t$. At the terminals, membership follows from the revealing law and channel
  closure; an empty observation is uninformative. Working toward the subtree root uses channel steps and products,
  with conditional independence supplied by the broadcast process.
  The same argument covers every partial product at a vertex.
  No assertion about a limiting posterior law belonging to $cal(C)$ will be needed.

== 3 From reconstruction to capacity <sec:necessity>

The nonlinear capacity recursion of Pemantle and Peres #cite(label("PP10")) Lemma 3.1 and Corollary 3.4 has a
  particularly direct flow interpretation in the present normalization.
  We first give that construction, then derive its hypothesis from the posterior information.

#thm([Lemma 3.1.])[
  (A flow from recursive labels).  #emph[Suppose nonnegative finite labels $\( z_v \)_(v in T)$ satisfy
#[#set math.equation(numbering: n => "(3.1)")
 $ z_v lt.eq sum_(w in "ch" \( v \)) frac(r z_w, sqrt(1 + z_w^2)) . $ <eq:label-recursion>]

 Then there is a flow of mass $z_rho$ whose potential (1.2) is at most one on every ray.
   In particular, $"Cap"_(3 \, lambda) \( T \) gt.eq z_rho$.]
] <lem:flow>

#proof[
  At each vertex choose coefficients
  $ 0 lt.eq d_(v w) lt.eq r / sqrt(1 + z_w^2) quad upright("such that") quad z_v =
    sum_(w in "ch" \( v \)) d_(v w) z_w . $
  If the upper-bound sum is positive, multiply all its coefficients by the ratio of $z_v$ to that sum;
    otherwise all labels in the displayed equality are zero and take all coefficients to be zero.
    Set $ell_rho = 1$, $ell_w = ell_v d_(v w)$ recursively, and define
  $ theta \( v \, w \) = ell_w z_w . $
  The displayed equality gives conservation at every nonroot vertex and mass $z_rho$ at the root.
    Put $g_v = r^(- \| v \|) ell_v$. Then
  $ g_w^2 \( 1 + z_w^2 \) lt.eq g_v^2 \, wide #scale(x: 120%, y: 120%)[\(] r^(- \| w \|) theta \( v \, w \)
    #scale(x: 120%, y: 120%)[\)]^2 = \( g_w z_w \)^2 lt.eq g_v^2 - g_w^2 . $
  Summing along any finite initial segment of a ray gives a bound by $g_rho^2 = 1$.
    Monotone convergence of the nonnegative sums proves the assertion for every infinite ray. ◻
]

For a vertex $v$, let $m_v^(\( n \))$ be the quadratic information about $sigma_v$ obtained from its descendants
  at distance $n$, with $m_v^(\( 0 \)) = 3$. Data processing gives limits

$ m_v = lim_(n arrow.r oo) m_v^(\( n \)) in \[ 0 \, 3 \] . $

If reconstruction occurs, (2.3) implies $m_rho > 0$. We show that these limiting numbers yield labels satisfying
  Lemma 3 with a positive root label.

For a fixed vertex $v$, put

$ b_w = r m_w \, wide S = sum_(w in "ch" \( v \)) b_w \, wide D = max_(w eq.not w') b_w b_(w') \( b_w + b_(w') \) \, $

where $D = 0$ if fewer than two children are present. Then

#[#set math.equation(numbering: n => "(3.2)")
 $ m_v lt.eq S - c D . $ <eq:pair-saving>]

At finite depth the parent information is $m_v^(\( n + 1 \))$,
  and the child values after their edge channels are $b_w = r m_w^(\( n \))$.
  Choose any pair of children and combine their branch experiments first.
  Jensen’s inequality gives $bb(E) A^2 gt.eq \( bb(E) A \)^2$,
  so Proposition 2 saves at least $c b_w b_(w') \( b_w + b_(w') \)$.
  Combine the remaining children using the subadditivity part of the same proposition.
  Maximize over the pair and pass to the limit. All sums and maxima are finite.
  With zero or one child, the empty observation or channel scaling gives the assertion directly.

There are at most $B^3$ ordered triples of children, and every mixed product in $S^3$ is at most the largest $b_w$
  squared times the second largest, hence at most $D$. Therefore

#[#set math.equation(numbering: n => "(3.3)")
 $ S^3 lt.eq sum_w b_w^3 + B^3 D . $ <eq:cubic-sum>]

Choose $K > 0$ with $K B^3 lt.eq c$ and set $y_v = m_v + K m_v^3$. Since $m_v lt.eq S$, Equations (3.2) and (3.3) yield

#[#set math.equation(numbering: n => "(3.4)")
 $ y_v & lt.eq S - c D + K S^3 lt.eq S + K sum_w b_w^3\
 & = r sum_w y_w - K r \( 1 - r^2 \) sum_w m_w^3 . $ <eq:renormalized-saving>]

This correction supplies a saving even at a one-child vertex, where the original pair term vanishes:
  the positive factor is $r - r^3$.

The bound $m_w lt.eq 3$ gives $y_w lt.eq \( 1 + 9 K \) m_w$. With

$ delta = frac(K \( 1 - r^2 \), \( 1 + 9 K \)^3) > 0 \, $

Equation (3.4) implies

$ y_v lt.eq r sum_w y_w \( 1 - delta y_w^2 \) lt.eq r sum_w y_w / sqrt(1 + 2 delta y_w^2) . $

The second inequality is the tangent bound $\( 1 + 2 t \)^(- 1 \/ 2) gt.eq 1 - t$ for $t gt.eq 0$.
  Thus $z_v = sqrt(2 delta) thin y_v$ satisfies (3.1), with $z_rho > 0$.
  Lemma 3 proves positive capacity and completes the first implication of Theorem 1.

== 4 Local estimates for information loss <sec:moments>

For the converse, subadditivity alone is not enough: we must bound the information lost when branches are
  combined. The next lemma uses only symmetry and one channel-smoothed input.
  Unlike Proposition 2, it does not require membership in $cal(C)$.

#thm([Lemma 4.1.])[
  #emph[Fix $0 < lambda < 1$. Let $mu \, nu$ be symmetric posterior laws,
    with $nu$ obtained by a channel step of parameter $lambda$.
    There is a finite constant $C = C \( lambda \)$ such that
#[#set math.equation(numbering: n => "(4.1)")
 $ m \( mu star.op nu \) & gt.eq m \( mu \) + m \( nu \) - C #scale(x: 120%, y: 120%)[\(] h \( mu \) m \( nu \) +
   m \( mu \) h \( nu \) #scale(x: 120%, y: 120%)[\)] \,\
h \( mu star.op nu \) & lt.eq h \( mu \) + h \( nu \) + C m \( mu \) m \( nu \) . $ <eq:local-m-lower>]

 The first inequality holds with $C = 7$.]
] <lem:local-moments>

#proof[
  All expectations in this proof are over independent marginal posterior vectors $p \, q$ of laws $mu \, nu$. Put
  $ x = L p \, wide y = L q \, wide s = x dot.op y \, wide a = m \( mu \) \, quad b = m \( nu \) \, quad alpha =
    tau \( mu \) \, quad beta = tau \( nu \) . $
  Since $p = sans(u) + L^(sans(T)) x \/ 4$ and similarly for $q$, the product rule (2.5) becomes
  #[#set math.equation(numbering: n => "(4.2)")
   $ Z = 1 + s \, wide L P = frac(N, 1 + s) \, wide N = x + y + R \, wide R_i = x_j y_k + x_k y_j \,
     $ <eq:product-coordinates>]
  where ${ i \, j \, k } = { 1 \, 2 \, 3 }$. Each coordinate of $q$ is at least $\( 1 - lambda \) \/ 4$, so
  #[#set math.equation(numbering: n => "(4.3)")
   $ 1 + s gt.eq 1 - lambda > 0 \, wide - lambda lt.eq s lt.eq 3 . $ <eq:denominator>]
  ===== 4.1 The quadratic statistic. <the-quadratic-statistic.>
  Using the marginal weight $Z$ in (2.5),
  $ m \( mu star.op nu \) = bb(E) frac(\| N \|^2, 1 + s) . $
  The second moments in (2.6) give
  $ bb(E) \| R \|^2 = 2 / 3 a b \, wide bb(E) s^2 = 1 / 3 a b . $
  In the expansion of $bb(E) \[ \| N \|^2 \( 1 - s \) \]$, the term $bb(E) \| R \|^2$ therefore cancels $2 bb(E)
    s^2$. Terms of degree one in either vector have zero expectation. For the remaining terms,
  $ bb(E) \[ s thin x dot.op R \] = 2 alpha b \, wide bb(E) \[ s thin y dot.op R \] = 2 a beta \, wide
    bb(E) \[ s \| R \|^2 \] = 6 alpha beta . $
  For example, $x dot.op R = 2 \( x_1 x_2 y_3 + x_1 x_3 y_2 + x_2 x_3 y_1 \)$; after multiplication by $s$,
    only terms proportional to $x_1 x_2 x_3$ survive expectation over $x$.
    The last identity follows in the same way by retaining only terms with all three indices in each vector.
    Thus the expansion is exactly
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(E) \[ \| N \|^2 \( 1 - s \) \] = a + b - 4 \( alpha b + a beta \) -
     6 alpha beta . $ <eq:quadratic-cancellation>]
  As $\( 1 + s \)^(- 1) = 1 - s + s^2 \/ \( 1 + s \)$, we obtain
  #[#set math.equation(numbering: n => "(4.5)")
   $ m \( mu star.op nu \) = a + b - 4 \( alpha b + a beta \) - 6 alpha beta +
     bb(E) frac(\| N \|^2 s^2, 1 + s) . $ <eq:exact-m-product>]
  The final term is nonnegative. Moreover, (2.7) implies
  $ \| alpha beta \| lt.eq 1 / 2 #scale(x: 120%, y: 120%)[\(] h \( mu \) b +
    a h \( nu \) #scale(x: 120%, y: 120%)[\)] . $
  This proves (4.1) with constant seven, without any sign assumption on $alpha$ or $beta$.
  ===== 4.2 The third moment. <the-third-moment.>
  The corresponding product formula is
  $ tau \( mu star.op nu \) = bb(E) frac(N_1 N_2 N_3, \( 1 + s \)^2) . $
  Use the exact remainder
  #[#set math.equation(numbering: n => "(4.6)")
   $ \( 1 + s \)^(- 2) - \( 1 - 2 s \) = frac(s^2 \( 3 + 2 s \), \( 1 + s \)^2) . $ <eq:denominator-remainder>]
  The numerator $N_1 N_2 N_3$ is bounded, and (4.3) bounds the multiplier in (4.6) by a constant depending only on
    $lambda$ times $s^2$. The error in replacing the denominator factor by $1 -
    2 s$ is consequently at most $C_0 \( lambda \) a b$.
  In the finite polynomial $N_1 N_2 N_3 \( 1 - 2 s \)$, the only pure terms are $x_1 x_2 x_3 + y_1 y_2 y_3$.
    Every mixed monomial of degree one in one vector has zero expectation.
    Every other mixed monomial has degree at least two in each vector,
    so its absolute expectation is at most $a b$, by independence and the monomial bound following (2.6).
    Summing the finitely many coefficients and taking absolute values proves (4.1).
    Increase the common $C \( lambda \)$ to at least seven to obtain both estimates. ◻
]

== 5 From capacity to reconstruction <sec:sufficiency>

Assume $"Cap"_(3 \, lambda) \( T \) > 0$ and choose an admissible flow $theta$ of positive mass.
  We construct degraded observations at every finite depth and bound their information from below uniformly in
  that depth. The noise scale will be fixed only after the total loss has been estimated.
  Noisy boundary observations also underlie robust reconstruction #cite(label("JM04")).
  Here we choose the noise separately at each vertex from the flow and use the resulting information to bound that
  of the original observations.

=== 5.1 A flow profile and terminal observations <a-flow-profile-and-terminal-observations>

For $0 < epsilon.alt lt.eq 1$, let $Theta \( v \)$ be the flow $epsilon.alt theta$ entering a nonroot vertex $v$,
  and define

$ Theta \( rho \) = M := epsilon.alt \| theta \| \, wide X_v = r^(- \| v \|) Theta \( v \) . $

Conservation becomes

#[#set math.equation(numbering: n => "(5.1)")
 $ X_v = r sum_(w in "ch" \( v \)) X_w . $ <eq:linear-profile>]

Every positive-flow edge extends to an infinite ray: at every positive-flow vertex,
  conservation gives at least one positive-flow child. Hence admissibility implies $X_v lt.eq
  epsilon.alt$ for all nonroot vertices. In particular, $theta \( rho \, w \) lt.eq r$ for each child of the root,
  and $\| theta \| lt.eq B r$. On every ray $xi = \( v_0 = rho \, v_1 \, v_2 \, dots.h \)$, we therefore have

#[#set math.equation(numbering: n => "(5.2)")
 $ sum_(j = 0)^oo X_(v_j)^2 lt.eq Q epsilon.alt^2 \, wide Q = 1 + \( B r \)^2 . $ <eq:path-energy>]

The extra term in $Q$ is needed because $X_rho = M$ need not be at most $epsilon.alt$.

Fix $n gt.eq 1$. At each $v in L_n$, observe its spin only after an additional independent channel $P_(t_v)$, where

#[#set math.equation(numbering: n => "(5.3)")
 $ t_v = sqrt(X_v \/ 3) . $ <eq:terminal-noise>]

These are valid parameters since $X_v lt.eq epsilon.alt lt.eq 1$.
  For $\| v \| lt.eq n$, let $hat(m)_v \, hat(h)_v$ be the statistics of the experiment about $sigma_v$ using
  these degraded terminal observations in its subtree. The dependence on $n$ is suppressed.
  These laws and their partial products belong to $cal(C)$, as explained after Proposition 2.

By channel scaling, at the terminal level

#[#set math.equation(numbering: n => "(5.4)")
 $ hat(m)_v = X_v \, wide hat(h)_v lt.eq X_v wide \( \| v \| = n \) . $ <eq:terminal-values>]

Subadditivity in (2.8), channel scaling, and (5.1) give inductively

#[#set math.equation(numbering: n => "(5.5)")
 $ hat(m)_v lt.eq X_v wide \( \| v \| lt.eq n \) . $ <eq:m-below-profile>]

A vertex with no observed descendants has the uninformative experiment.
  Finite branches carry no flow, so early leaves and zero-flow subtrees are consistent with these bounds.

=== 5.2 Local and accumulated losses <local-and-accumulated-losses>

For $\| v \| < n$, define the deficit from linear addition by

#[#set math.equation(numbering: n => "(5.6)")
 $ D_v = r sum_(w in "ch" \( v \)) hat(m)_w - hat(m)_v . $ <eq:deficit>]

We first prove that, with a fixed finite $C_1$ depending only on $B \, lambda$,

#[#set math.equation(numbering: n => "(5.7)")
 $ hat(h)_v & lt.eq lambda^3 sum_w hat(h)_w + C_1 X_v^2 \,\
0 lt.eq D_v & lt.eq C_1 X_v (lambda^3 sum_w hat(h)_w + X_v^2) . $ <eq:h-recursion>]

The coefficient of the propagated third moment is exactly $lambda^3$; the constant $C_1$ multiplies only the new error.

Combine the child branches one at a time. After the edge channel, their individual statistics,
  now about the spin at $v$, are

$ b_w = r hat(m)_w \, wide h'_w = lambda^3 hat(h)_w . $

Every partial product has $m$ at most the sum of its $b_w$’s, hence at most $X_v$.
  Applying (4.1) at each addition gives the partial bound

$ h lt.eq sum_w h'_w + C X_v sum_w b_w lt.eq H + C X_v^2 \, wide H = sum_w h'_w . $

The sums on the right may be taken over all children, so this also proves (5.7) after increasing $C_1$.
  Every addition has nonnegative deficit by Proposition 2. Its deficit is at most

$ C #scale(x: 120%, y: 120%)[\(] \( H + C X_v^2 \) b_w + X_v h'_w #scale(x: 120%, y: 120%)[\)] $

by (4.1). Summing and using $sum_w b_w lt.eq X_v$ gives $D_v lt.eq 2 C X_v H + C^2 X_v^3$, proving (5.7).
  The second input at every use of Lemma 4 is a single child branch after its channel of parameter $lambda$,
  as required.

Write $u succ.curly.eq v$ when $u$ is a descendant of $v$, including $u = v$.
  Iterating (5.7) in (5.7) and using (5.4) gives, for $i = \| v \| < n$,

#[#set math.equation(numbering: n => "(5.8)")
 $ D_v lt.eq C_2 X_v (sum_(u succ.curly.eq v\
\| u \| < n) lambda^(3 \( \| u \| - i \)) X_u^2 + sum_(u succ.curly.eq v\
\| u \| = n) lambda^(3 \( n - i \)) X_u) . $ <eq:unfolded-loss>]

Here $C_2 = max { C_1 \, C_1^2 }$ suffices. At each internal descendant the term $C_1
  X_u^2$ is inserted once and then propagated with a factor $lambda^3$ per edge; no power of $C_1$ grows with depth.

Telescoping the deficits (5.6) over the finite tree above $L_n$ now yields

#[#set math.equation(numbering: n => "(5.9)")
 $ hat(m)_rho = r^n sum_(v in L_n) X_v - sum_(\| v \| < n) r^(\| v \|) D_v = M -
   sum_(\| v \| < n) r^(\| v \|) D_v . $ <eq:loss-telescope>]

The last equality uses conservation of $Theta$. It remains to show that this total loss is at most a fixed
  fraction of $M$, uniformly in $n$.

=== 5.3 Averaging the losses along a flow path <averaging-the-losses-along-a-flow-path>

Sample a vertex of $L_n$ with probabilities $Theta \( v \) \/
  M$ and let $\( V_0 = rho \, V_1 \, dots.h \, V_n \)$ be its ancestors.
  Conservation gives $sum_(v in L_j) Theta \( v \) = M$ for every $j lt.eq n$ and therefore

#[#set math.equation(numbering: n => "(5.10)")
 $ bb(P) \( V_j = u \) = frac(Theta \( u \), M) wide \( u in L_j \) . $ <eq:path-marginals>]

This remains true with early leaves: their flow is zero. Every path with positive probability extends to an
  infinite ray, so (5.2) bounds the sum of its $X_(V_i)^2$.

For $i lt.eq j$ and $\| u \| = j$, the identity responsible for the summable path kernel is

#[#set math.equation(numbering: n => "(5.11)")
 $ r^i lambda^(3 \( j - i \)) X_u = lambda^(j - i) Theta \( u \) . $ <eq:weight-identity>]

The unique depth-$i$ ancestor of $u$ is specified once $u$ is chosen. Thus, for $0 lt.eq i lt.eq j < n$,

#[#set math.equation(numbering: n => "(5.12)")
 $ & sum_(\| v \| = i) r^i X_v sum_(u succ.curly.eq v\
\| u \| = j) lambda^(3 \( j - i \)) X_u^2\
 & #h(35mm)  = M lambda^(j - i) bb(E) \[ X_(V_i) X_(V_j) \] \, $ <eq:internal-path-sum>]

whereas the terminal terms satisfy

#[#set math.equation(numbering: n => "(5.13)")
 $ sum_(\| v \| = i) r^i X_v sum_(u succ.curly.eq v\
\| u \| = n) lambda^(3 \( n - i \)) X_u = M lambda^(n - i) bb(E) X_(V_i) . $ <eq:terminal-path-sum>]

Combining these identities with (5.8) gives

#[#set math.equation(numbering: n => "(5.14)")
 $ sum_(\| v \| < n) r^(\| v \|) D_v lt.eq C_2 M thin bb(E)
   [sum_(0 lt.eq i lt.eq j < n) lambda^(j - i) X_(V_i) X_(V_j) + sum_(0 lt.eq i < n) lambda^(n - i) X_(V_i)] .
   $ <eq:total-path-loss>]

For each fixed difference $k = j - i gt.eq 0$, Cauchy–Schwarz and (5.2) give, on every path in the support,

$ sum_(i = 0)^(n - 1 - k) X_(V_i) X_(V_(i + k)) lt.eq (sum_(i = 0)^(n - 1 - k) X_(V_i)^2)^(1 \/ 2)
  (sum_(i = 0)^(n - 1 - k) X_(V_(i + k))^2)^(1 \/ 2) lt.eq Q epsilon.alt^2 . $

Each individual $X_(V_i)$ is at most $sqrt(Q) thin epsilon.alt$.
  Summing the geometric weights in (5.14), the expectation there is at most

#[#set math.equation(numbering: n => "(5.15)")
 $ frac(Q epsilon.alt^2, 1 - lambda) + frac(sqrt(Q) thin epsilon.alt, 1 - lambda) . $ <eq:uniform-loss-bound>]

Choose $epsilon.alt in \( 0 \, 1 \]$ so small that $C_2$ times this expression is at most $1 \/ 2$.
  The choice is independent of $n$. Equations (5.9) and (5.14) now give

$ hat(m)_rho gt.eq M \/ 2 > 0 wide upright("for every ") n gt.eq 1 . $

The original, undegraded level observation has at least this much quadratic information by data processing. By (2.3),

$ a_n \( T \, lambda \) gt.eq M \/ 16 wide \( n gt.eq 1 \) . $

Thus $a_oo \( T \, lambda \) > 0$, proving the remaining implication of Theorem 1.
  The degraded experiments may vary with $n$; the proof requires only the same positive lower bound at each depth,
  not their convergence or mutual monotonicity.

#bibliography("refs.bib", style: "ieee", title: [References])
