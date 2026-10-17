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

#align(center)[#text(size: 16pt, weight: "bold")[A power saving for square-difference-free sets]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a positive integer $N$, write $\[ N \] = { 1 \, dots.h \, N }$. A set $A subset.eq \[ N \]$ is #emph[square-difference-free] if

$ \( A - A \) ∩ { m^2 : m in bb(N) \, med m gt.eq 1 } = diameter . $

Thus the restriction concerns differences in the integers. Define

$ s \( N \) = max { \| A \| : A subset.eq \[ N \] upright(" is square-difference-free") } . $

Our main result is a fixed power saving in this extremal problem.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $c > 0$ and $C < oo$ such that, for every integer $N gt.eq 1$ and every square-difference-free set $A subset.eq \[ N \]$, 
$ \| A \| lt.eq C N^(1 - c) . $

 Equivalently, every subset of $\[ N \]$ larger than $C N^(1 - c)$ contains distinct elements whose absolute difference is the square of a positive integer.]
] <thm:main>

The exponent obtained here is positive and absolute, but extremely small. The argument does not yield a useful numerical value or an optimal exponent. All finite constructions in the proof are fixed independently of $N$ and $A$; their size affects the constants and the exponent.

#prodef([Remark 1.2.])[
  (Square-difference colorings).  Theorem 1 gives a polynomial bound for the classical square-difference coloring problem #cite(label("BeigelGasarch2008")) Section 4. Fix its constants $c \, C$, reducing $c$ so that $0 < c < 1$ if necessary. Whenever integers $r \, N gt.eq 1$ satisfy $N > \( C r \)^(1 \/ c)$, every $r$-coloring of $\[ N \]$ has same-colored elements $a \, a + d^2$ with $d gt.eq 1$. Indeed, a largest color class has size at least $N \/ r > C N^(1 - c)$. Only the two endpoints must share a color; no color restriction is imposed on $d$. Equivalently, if $G_N$ is the graph on $\[ N \]$ joining distinct integers whose absolute difference is a square, then
  $ chi \( G_N \) gt.eq frac(N, s \( N \)) gt.eq C^(- 1) N^c \, $
  since its independent sets are exactly the square-difference-free sets.
]

=== 1.1 Previous work <previous-work>

The problem originates in a question of Lovász. Furstenberg #cite(label("Furstenberg1977")) Theorem 1.2 and Sárközy #cite(label("Sarkozy1978I")) proved independently that $s \( N \) = o \( N \)$, using ergodic theory and the circle method, respectively. Sárközy’s quantitative estimate has the form $s \( N \) lt.eq N \/ \( log N \)^(1 \/ 3 + o \( 1 \))$; see also the historical account in #cite(label("BloomMaynard2022")). Pintz, Steiger and Szemerédi #cite(label("PSS1988")) Theorem 1 strengthened this to

$ s \( N \) lt.double frac(N, \( log N \)^(c_(upright("PSS")) log log log log N)) $

for an absolute $c_(upright("PSS")) > 0$. Their argument combines concentration on arithmetic progressions with an iteration that increases the collection of large Fourier coefficients. Bloom and Maynard #cite(label("BloomMaynard2022")) subsequently obtained

$ s \( N \) lt.double frac(N, \( log N \)^(c_(upright("BM")) log log log N)) $

for an absolute $c_(upright("BM")) > 0$, using bounds for the additive energy of rational numbers with small denominators to improve the density-increment argument.

Green and Sawhney #cite(label("GreenSawhney2025")) Theorem 1.1 prove

$ s \( N \) lt.double N exp #scale(x: 120%, y: 120%)[\(] - c_1 sqrt(log N) #scale(x: 120%, y: 120%)[\)] $

for an absolute $c_1 > 0$. Their arithmetic level-$d$ inequality transfers product-space hypercontractive estimates to rational Fourier coefficients. Theorem 1 answers affirmatively the fixed-power question posed in #cite(label("GreenSawhney2025")) Section 1.1. Adajar et al. #cite(label("AdajarEtAl2026")) Theorem 1.1 extend the arithmetic level-$d$ approach to fixed integer polynomials having a root modulo every positive integer. For degree at least two they obtain a density saving $exp \( - c \( log N \)^mu \)$ for every fixed $0 < mu < 1 \/ 2$, with constants depending on the polynomial and $mu$.

In the opposite direction, Ruzsa #cite(label("Ruzsa1984")) Theorems 1 and 2 constructed square-difference-free sets of size $gt.double N^(gamma_0)$, where

$ gamma_0 = 1 / 2 (1 + frac(log 7, log 65)) = 0.733077 dots.h . $

His construction uses a set of residues with no square differences modulo a squarefree integer to restrict selected digits of an integer expansion. Beigel and Gasarch #cite(label("BeigelGasarch2008")) Lemma 3.6 and the proof of Theorem 3.7 and Lewko #cite(label("Lewko2015")) Theorem 3 obtained the improved exponent

$ gamma_1 = 1 / 2 (1 + frac(log 12, log 205)) = 0.733411797 dots.h $

by exhibiting suitable sets of twelve residues modulo $205$. Krachun’s construction #cite(label("Krachun2026")) Theorem 1 passes the three-quarter threshold and gives

$ liminf_(N arrow.r oo) frac(log s \( N \), log N) gt.eq 0.752796455874514 dots.h . $

A substantial gap remains between this lower exponent and the upper exponent $1 - c$ in Theorem 1.

Reflection positivity yields multilinear inequalities through the chessboard method of Fröhlich and Lieb #cite(label("FrohlichLieb1978")) Theorem 2.2 and its abstract formulation by Fröhlich, Israel, Lieb and Simon #cite(label("FILS1978ReflectionI")) Theorem 4.1. Hatami #cite(label("Hatami2010")) Theorem 2.8 of the arXiv version characterizes graph seminorms through mixed Hölder inequalities. Conlon and Lee #cite(label("ConlonLee2017Reflection")) Theorems 1.2 and 1.3 use finite reflection groups to obtain such inequalities for absolute-value inputs, and also for real-valued inputs when the two defining sets of simple reflections are disjoint. The signed mixed inequality is a classical feature of the chessboard method; its role here is to permit Fourier lifts that can change sign. We construct a finite-field probability law with the particular cycle support, reflection positivity and conditional mixing needed for the integer problem, and prove the signed inequality for that law directly.

The rational-frequency energy estimates of Bloom and Maynard #cite(label("BloomMaynard2022")) and the product-space methods of Green and Sawhney #cite(label("GreenSawhney2025")) are methodological precedents for the arithmetic part. The argument retains rational Fourier analysis and rescaling along square-step progressions. Here the quantity compared between scales is a multilinear functional of a signed Fourier lift.

=== 1.2 Outline of the proof <outline-of-the-proof>

The proof constructs a nonnegative quantity that dominates a fixed power of the density, and then proves that this quantity decreases by a power of the interval length. The comparison with shorter intervals is available for every residue specification. A separate estimate makes a fixed positive proportion of those specifications negligible; these two estimates produce the contraction.

Here is the quantity to be controlled. Choose a fixed even integer $d$ and a fixed set $V$ of $d$ labels. For a finite set $cal(P)$ of sufficiently large primes, put $X_(cal(P)) = product_(p in cal(P)) bb(F)_p$. We will construct a probability law for a tuple $\( z_v \)_(v in V)$ in $X_(cal(P))$, and for a real function $g$ on this space define

$ Z_(cal(P)) \( g \) = bb(E) product_(v in V) g \( z_v \) . $

Its $d$-th root will be a seminorm satisfying $\| bb(E) g \| lt.eq Z_(cal(P)) \( g \)^(1 \/ d)$. To apply it to $A subset.eq \[ N \]$, take $cal(P)$ to be the primes between a fixed threshold $P$ and $N^beta$, where $beta > 0$ is fixed and small. Let $G$ retain the rational Fourier coefficients of $1_A$ at frequencies of squarefree reduced denominator at most $N^beta$ whose prime factors all belong to $cal(P)$, including the zero frequency. Section 5 defines this #emph[Fourier lift] precisely. It is real and its mean is exactly $\| A \| \/ N$, although its values may have either sign. With these choices, write $Y \( N \, A \) = Z_(cal(P)) \( G \)$. The seminorm bound gives

$ \( \| A \| \/ N \)^d lt.eq Y \( N \, A \) . $

Thus a fixed power decay for $Y$ proves the theorem.

The tuple law is constructed separately over each prime field, then multiplied over the primes, collecting the field labels into vectors $z_v in X_(cal(P))$. Every individual field label is uniform. The law has two further properties with distinct purposes. First, it is reflection positive: specified involutions of $V$ exchange two halves, and the matrix coupling the half-tuples is symmetric positive semidefinite. Repeated Cauchy–Schwarz across these cuts proves the signed mixed inequality and seminorm bound (Proposition 11). Second, outside a part of mass at most $p^(- 4)$, a designated directed cycle of $24$ labels has nonzero square differences in $bb(F)_p$, and each of its edge pairs is uniform among pairs with such a difference. This exact pair law supplies the arithmetic input below. The full reflection-positive law and its normalized nonexceptional part also satisfy conditional mixing, which makes inputs with large Fourier denominators negligible (Lemma 13). Section 3 constructs these laws from the graph estimates of Section 2.

The approximation errors require control of signed lifts beyond their means. Every fixed moment of $G$ grows more slowly than any fixed positive power of $N$, uniformly in the prime set and in every retained family of complete denominator classes. Lemma 15 proves this by a conditional square-function estimate and symmetrization. The same bounds, with an explicit fiber-size cost, remain available after specifying some prime coordinates. Combined with conductor decay, they justify the Fourier truncations used in both estimates that follow.

For the change of scale, fixing prime coordinates whose product is at most a sufficiently small fixed power of $N$ makes the low Fourier coefficients exact averages on an integer residue class modulo an integer $D$. Splitting that class into progressions of common difference $D^2$ and rescaling preserves square-difference avoidance: a square difference in a rescaled set would give a square difference in $A$. The seminorm’s square-affine symmetries therefore compare the specialized functional with the same functional at length $ceil.l N \/ D^2 ceil.r$, up to a factor tending to one and a power-decaying error (Proposition 20). This comparison applies to all specified residues, without using the exceptional splitting.

The arithmetic cancellation uses the normalized nonexceptional prime laws. Set aside the finitely many primes below the tuple-law threshold, together with modulus $8$, in one fixed modulus $M_0$. Independently choose one residue modulo $M_0$ for each slot. A fixed positive proportion of these assignments has strict square differences along the designated cycle: they are $1$ modulo $8$ and nonzero squares modulo every odd prime dividing $M_0$. For such an assignment, divide $\[ N \]$ into ordered intervals. Unless all cycle slots choose the same interval, one directed edge goes from an earlier interval to a later one. Truncating and expanding the other slots reduces its contribution to the selected pair law. A signed kernel supported on actual shifts $m^2$ then bounds that contribution using the absence of integer square differences (Propositions 17 and 22). The event that all cycle slots choose one interval is itself small.

Finally, Section 9 expands the exceptional submeasures by inclusion–exclusion. Exceptional prime sets of large product are bounded directly by moment estimates. A smaller exceptional prime set with product $q_B$ leads to the shorter scale approximately $N \/ \( M_0 q_B \)^2$. Its mass remains summable even after multiplication by $q_B$; this absorbs the factor $q_B^(2 a_0)$ incurred by a sufficiently small proposed decay exponent $a_0$. Combining this bound with the universal scale comparison and the cancellation on a positive proportion of small-residue assignments gives a strict weighted recurrence. Induction proves $Y \( N \, A \) lt.double N^(- a_0)$, and the density inequality above gives Theorem 1 with $c = a_0 \/ d$. Figure 1 records the principal inputs to this assembly.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-4.9, 0), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Graph mixing#linebreak()Section~2]]])])
  content((0, 0), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Tuple laws#linebreak()Section~3]]])])
  content((4.9, 0), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Signed seminorm and#linebreak()conductor decay#linebreak()Section~4]]])])
  content((-3.5, -2), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Uniform lift moments#linebreak()Section~5]]])])
  content((3.5, -2), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Actual-square kernel#linebreak()Section~6]]])])
  content((-3.5, -4), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Square-step comparison#linebreak()Section~7]]])])
  content((3.5, -4), [#box(width: 3.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Ordered-interval cancellation#linebreak()Section~8]]])])
  content((0, -6), [#box(width: 6.753cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Exceptional-measure expansion,#linebreak()weighted recurrence and induction#linebreak()Section~9]]])])
  line((-2.949, 0), (-1.951, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((1.951, 0), (2.949, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((-3.5, -2.55), (-3.5, -3.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((-1.549, -2.55), (1.549, -3.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((3.5, -2.55), (3.5, -3.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((6.851, 0), (7.1, 0), (7.1, -4), (5.451, -4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((2.949, -0.55), (1.9, -0.95), (-6.1, -0.95), (-6.1, -4), (-5.451, -4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((0, -0.55), (0, -1.25), (0, -3.2), (1.549, -3.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((-2.537, -4.55), (-0.9625, -5.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
  line((2.537, -4.55), (0.9625, -5.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: black)))
})],
  caption: [Figure 1: Principal proof inputs. The full tuple law supplies reflection positivity for the signed seminorm; the normalized nonexceptional law supplies the strict-square pair law for cancellation. Both have the conditional mixing used in conductor decay. The two lower branches are combined only in the weighted recurrence. Arrows indicate dependencies, not equivalences. ],
) <fig:proof-map>

=== 1.3 Conventions <conventions>

All averages on finite sets are with respect to uniform probability measure unless another measure is displayed. All $L^r$ norms of functions on $X_(cal(P))$ use its uniform product measure. Empty products are $1$; the product over an empty prime set is a one-point space. We write $e \( t \) = exp \( 2 pi i t \)$ and identify rational frequencies modulo $1$. The #emph[conductor] of a rational frequency is its reduced positive denominator; the conductor of $0$ is $1$.

For nonnegative quantities, $U lt.double V$ means $U lt.eq C V$ for a constant with the dependencies stated in context. A uniform bound $U = N^(o \( 1 \))$ means that for every $epsilon > 0$ there is a constant $C_epsilon$ such that $U lt.eq C_epsilon N^epsilon$ for all allowed data. Fixed tuple sizes and fixed moment orders may affect $C_epsilon$; sets, intervals, chosen residues and retained frequency families may not. All final choices of parameters are made independently of $N$ and $A$.

== 2 Finite-field square constraints <sec:finite-field-graphs>

This section controls systems of square constraints on independent field variables. A single constraint is close to a constant kernel in operator norm. Replacing constraints one at a time then counts any fixed directed graph without loops or opposite edges. Applying this count to a four-cycle of two lists gives the operator estimate needed for the tuple measures.

Throughout, finite sets carry uniform probability measure, and $e \( t \) = exp \( 2 pi i t \)$. For an odd prime $p$, write

$ Q_p^(*) = { u^2 : u in bb(F)_p^times } \, #h(2em) A_p \( t \) = 1_(Q_p^(*)) \( t \) \, #h(2em) delta_p = frac(sqrt(p) + 1, 2 p) lt.eq p^(- 1 \/ 2) . $

For finite sets $X \, Y$, the operator associated with a kernel $K : X times Y arrow.r bb(R)$ is

$ T_K f \( x \) = bb(E)_(y in Y) K \( x \, y \) f \( y \) . $

We use $parallel K parallel_(upright("op"))$ to mean the norm of $T_K$ from $L^2 \( Y \)$ to $L^2 \( X \)$. A constant kernel $c$ therefore denotes the operator $f mapsto c thin bb(E) f$.

#thm([Lemma 2.1.])[
  (Counting directed square constraints).  #emph[Let $p$ be an odd prime and let $G = \( W \, E \)$ be a finite directed graph with no loops and at most one edge on each unordered pair of distinct vertices. Put $m = \| E \|$, and let $\( z_w \)_(w in W)$ be independent uniform elements of $bb(F)_p$. Then 
$ lr(|bb(E) product_(\( u \, v \) in E) A_p \( z_v - z_u \) - 2^(- m)|) lt.eq m delta_p . $

 The assertion includes the empty graph, whose product is $1$.]
] <lem:graph-count>

#proof[
  We first show that the kernel $b_p \( x \, y \) = A_p \( y - x \) - 1 \/ 2$ has operator norm at most $delta_p$. The characters $x mapsto e \( k x \/ p \)$, $k in bb(F)_p$, are an orthonormal eigenbasis. The constant eigenvalue is
  $ frac(\| Q_p^(*) \|, p) - 1 / 2 = - frac(1, 2 p) . $
  For $k eq.not 0$, put $G_p \( k \) = sum_(u in bb(F)_p) e \( k u^2 \/ p \)$. The corresponding eigenvalue is
  $ 1 / p sum_(t in Q_p^(*)) e \( k t \/ p \) = frac(G_p \( k \) - 1, 2 p) . $
  Here the subtraction of $1$ removes the zero square, and division by $2$ removes the multiplicity of every nonzero square. Since $\( u \, v \) mapsto \( u - v \, u + v \)$ is a bijection on $bb(F)_p^2$,
  $ \| G_p \( k \) \|^2 = sum_(u \, v in bb(F)_p) e #scale(x: 120%, y: 120%)[\(] k \( u^2 - v^2 \) \/ p #scale(x: 120%, y: 120%)[\)] = sum_(a \, b in bb(F)_p) e \( k a b \/ p \) = p . $
  Thus all eigenvalues have absolute value at most $delta_p$. In particular,
  #[#set math.equation(numbering: n => "(2.1)")
   $ lr(|bb(E)_(x \, y) f \( x \) g \( y \) #scale(x: 120%, y: 120%)[\(] A_p \( y - x \) - 1 / 2 #scale(x: 120%, y: 120%)[\)]|) lt.eq delta_p parallel f parallel_2 parallel g parallel_2 . $ <eq:single-square-mixing>]
  The same bound holds with $x - y$ in place of $y - x$, since the transposed operator has the same norm.
  Now replace the $m$ edge indicators one at a time by $1 \/ 2$. In a telescoping error for an edge $\( u \, v \)$, fix every variable except $z_u \, z_v$. No other edge has both these endpoints. Consequently all the other factors separate as $C f \( z_u \) g \( z_v \)$, where $\| C \| \, \| f \| \, \| g \| lt.eq 1$. Equation (2.1) bounds the conditional error by $delta_p$. Averaging the fixed variables and summing over the edges proves the assertion. ◻
]

We next divide the variables into two independent lists. Only constraints between the lists enter the following kernel; constraints within either list must be treated separately.

#thm([Lemma 2.2.])[
  (Mixing between two lists).  #emph[Let $I \, J$ be finite disjoint sets, and let $G$ be a directed graph on $I union.sq J$ whose $m$ edges all join $I$ to $J$, with at most one edge on each unordered pair. The directions may vary from edge to edge. For $x in bb(F)_p^I$, $y in bb(F)_p^J$, write $z_i = x_i$ for $i in I$, $z_j = y_j$ for $j in J$, and set 
$ K \( x \, y \) = product_(\( u \, v \) in E \( G \)) A_p \( z_v - z_u \) . $

 Then 
#[#set math.equation(numbering: n => "(2.2)")
 $ parallel K - 2^(- m) parallel_(upright("op")) lt.eq \( 32 m \)^(1 \/ 4) p^(- 1 \/ 8) . $ <eq:list-mixing>]

 For $m = 0$, both sides are zero. In particular, the implied constant for any fixed pair of lists is independent of $p$.]
] <lem:list-mixing>

#proof[
  Put $c = 2^(- m)$ and $B = K - c$. With respect to the normalized point-mass bases, $T_B$ has matrix entries $B \( x \, y \) \/ sqrt(\| bb(F)_p^I \| thin \| bb(F)_p^J \|)$. If $s_r$ are its singular values, then
  #[#set math.equation(numbering: n => "(2.3)")
   $ parallel B parallel_(upright("op"))^4 & lt.eq sum_r s_r^4 = "tr" #scale(x: 120%, y: 120%)[\(] \( T_B T_B^(*) \)^2 #scale(x: 120%, y: 120%)[\)]\
 & = bb(E)_(x^0 \, x^1 \, y^0 \, y^1) B \( x^0 \, y^0 \) B \( x^0 \, y^1 \) B \( x^1 \, y^0 \) B \( x^1 \, y^1 \) \, $ <eq:list-four-cycle>]
  where the four lists are independent and uniform. The kernel is real, so no conjugates appear in the last expression.
  Let $Omega = { 0 \, 1 }^2$. Expanding the last line gives
  $ sum_(F subset.eq Omega) \( - c \)^(4 - \| F \|) bb(E) product_(\( a \, b \) in F) K \( x^a \, y^b \) . $
  For each $F$, its product is the constraint indicator of a graph on
  $ \( I times { 0 \, 1 } \) union.sq \( J times { 0 \, 1 } \) . $
  Every base edge between $i in I$ and $j in J$ is copied, in its original direction, between $\( i \, a \)$ and $\( j \, b \)$ for every $\( a \, b \) in F$. The two endpoints determine the base unordered pair and the corner $\( a \, b \)$. Hence this graph has no loops or repeated unordered edges, and has exactly $m \| F \|$ edges. Lemma 3 therefore gives
  $ bb(E) product_(\( a \, b \) in F) K \( x^a \, y^b \) = c^(\| F \|) + E_F \, #h(2em) \| E_F \| lt.eq m \| F \| delta_p . $
  The main terms sum to $\( c - c \)^4 = 0$. The remaining terms have absolute value at most
  $ m delta_p sum_(t = 0)^4 binom(4, t) t c^(4 - t) = 4 m \( 1 + c \)^3 delta_p lt.eq 32 m p^(- 1 \/ 2) . $
  Combining this with (2.3) and taking fourth roots proves (2.2). ◻
]

== 3 Finite reflection-positive probability laws <sec:tuple-laws>

We construct probability laws on a fixed set of field labels. Their nonexceptional parts enforce a directed cycle of square differences. The full laws also satisfy positivity across a family of reflection cuts. To obtain both properties, we add a finite hierarchy of measures in which successively more blocks of the index set are marked. A marked block provides a positive quadratic form that dominates the small negative part at the corresponding unmarked cut.

=== 3.1 The index set and the required properties <the-index-set-and-the-required-properties>

Fix the integers

#[#set math.equation(numbering: n => "(3.1)")
 $ h = 24 \, #h(2em) t_0 = 80 \, #h(2em) ell = 2 t_0 + 1 = 161 . $ <eq:tuple-fixed-parameters>]

Let $Pi$ be the set of permutation words on $\[ h \] = { 1 \, dots.h \, h }$, viewed as bijections from positions to symbols. Write

$ K = h ! \, #h(2em) r = K \/ 2 \, #h(2em) V = Pi^ell \, #h(2em) d = \| V \| = K^ell \, #h(2em) n = d \/ 2 . $

The coordinates of a vertex $v in V$ are called its blocks. Fix a cycle $c$ of length $h$ on the positions. Composition on the right, $w mapsto w c$, cyclically shifts a word. Define $v_0 \, dots.h \, v_(h - 1) in V$ by giving every block of $v_j$ the word $c^j$, and put $v_h = v_0$.

A reflection is specified by a block $b in \[ ell \]$ and two distinct symbols $alpha \, beta$. It acts on $V$ by swapping these symbols on the left in block $b$; denote this involution by $theta$. Its associated cut is

$ V_(+) = { v : alpha upright(" precedes ") beta upright(" in block ") b } \, #h(2em) V_(-) = theta V_(+) . $

The reflection has no fixed vertices, and both halves have size $n$.

For a finite alphabet $X$, a measure $nu$ on $X^V$ defines a matrix whose row index is $\( z_v \)_(v in V_(+))$ and whose column index is $\( z_(theta v) \)_(v in V_(+))$. We say that $nu$ is #emph[reflection positive] if this matrix is symmetric positive semidefinite for every cut above. Equivalently, symmetry holds and

$ integral F \( \( z_v \)_(v in V_(+)) \) F \( \( z_(theta v) \)_(v in V_(+)) \) thin d nu \( z \) gt.eq 0 $

for every real function $F : X^(V_(+)) arrow.r bb(R)$.

Recall that $Q_p^(*) = { u^2 : u in bb(F)_p^times }$ for an odd prime $p$. The following proposition summarizes the construction.

#thm([Proposition 3.1.])[
  (Tuple laws).  #emph[There is an absolute integer $P$ such that, for every prime $p gt.eq P$, there are a probability measure $mu_p$ on $bb(F)_p^V$ and a nonnegative submeasure $epsilon_p lt.eq mu_p$ whose mass satisfies 
$ eta_p = epsilon_p \( bb(F)_p^V \) lt.eq p^(- 4) . $

 Writing 
$ mu_p^compose = frac(mu_p - epsilon_p, 1 - eta_p) \, $

 the following properties hold.]
  + #emph[The full law $mu_p$ is reflection positive. Both $mu_p$ and $epsilon_p$ are invariant under simultaneous changes $z_v mapsto q z_v + a$, where $a in bb(F)_p$ and $q in Q_p^(*)$. Every single-label marginal of $mu_p$ and $mu_p^compose$ is uniform on $bb(F)_p$.]
  + #emph[On the support of $mu_p^compose$, 
$ z_(v_(j + 1)) - z_(v_j) in Q_p^(*) #h(2em) \( 0 lt.eq j < h \) . $

 The marginal of each ordered pair $\( z_(v_j) \, z_(v_(j + 1)) \)$ under $mu_p^compose$ is uniform on ${ \( x \, y \) : y - x in Q_p^(*) }$.]
  + #emph[Put $gamma = 1 \/ 64$. For either $rho_p = mu_p$ or $rho_p = mu_p^compose$, every $v in V$, and every $f : bb(F)_p arrow.r bb(C)$ with uniform mean zero, 
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥bb(E)_(rho_p) #scale(x: 120%, y: 120%)[\[] f \( z_v \) divides \( z_w \)_(w eq.not v) #scale(x: 120%, y: 120%)[\]]∥_2 lt.eq p^(- gamma) parallel f parallel_2 . $ <eq:tuple-conditional-bound>]

 The norm on the left uses the other-label marginal of $rho_p$; the norm on the right uses uniform measure on $bb(F)_p$.]
] <prop:tuple-laws>

The cycle length $h$ and the total tuple size $d$ are fixed before any prime or integer interval is chosen. Thus constants depending on this finite construction remain absolute throughout the proof.

The construction and reflection estimates are given below. Lemma 10 will establish the final assertion and the precise pair marginal.

=== 3.2 Measures with marked blocks <measures-with-marked-blocks>

Start with one independent uniform label at each vertex of $V$. Require a strict square difference from $v$ to $w$ whenever $w_a = v_a c$ in at least $t_0 + 1$ blocks. In particular these constraints include every edge of the designated cycle. Multiplying the uniform product measure by the indicator of all these constraints gives the leading component, an unnormalized measure. Its cut matrices need not be positive semidefinite; the graph estimates control their negative parts.

To compensate for those negative parts, we introduce components in which vertices that agree outside a set of marked blocks draw their labels from a common list. A positive weight couples their choices of list entries. Marking a block then provides a lower bound at its reflection cuts, while leaving enough unmarked blocks to retain the cycle constraints until the last level. The following definitions implement this construction.

For $S subset.eq \[ ell \]$ with $s = \| S \| lt.eq t_0 + 1$, regard the blocks in $S$ as marked; blocks outside $S$ are called #emph[clean]. We call the marking nonterminal if $s lt.eq t_0$ and terminal if $s = t_0 + 1$. The terminal components will form the exceptional measure. Let

$ U_S = Pi^(\[ ell \] \\ S) \, #h(2em) m_s = r^s \, $

and let $u_S : V arrow.r U_S$ forget the marked blocks. At every address $u in U_S$, choose a list $\( Y_(u \, i) \)_(i in \[ m_s \])$ of independent uniform elements of $bb(F)_p$. All lists are independent. The total number of list entries is

#[#set math.equation(numbering: n => "(3.3)")
 $ \| U_S \| m_s = K^(ell - s) r^s = d \/ 2^s lt.eq d . $ <eq:tuple-list-count>]

For $s lt.eq t_0$, draw an address edge $u arrow.r u'$ exactly when

#[#set math.equation(numbering: n => "(3.4)")
 $ \# { a in.not S : u'_a = u_a c } gt.eq ell - t_0 = t_0 + 1 . $ <eq:tuple-address-edge>]

For each such edge require

#[#set math.equation(numbering: n => "(3.5)")
 $ Y_(u' \, i') - Y_(u \, i) in Q_p^(*) quad upright("for all ") i \, i' in \[ m_s \] . $ <eq:tuple-list-constraint>]

Let $I_S \( Y \)$ be the indicator of all these conditions. For $s = t_0 + 1$, impose no conditions and set $I_S = 1$. The graph on list entries defined by (3.5) will be denoted by $cal(G)_S$.

There are no loops in the address graph: a permutation word cannot equal its nontrivial position shift. Nor can both directions occur between two addresses. Indeed, the clean blocks counted for the two directions are disjoint, since a block counted for both would imply $c^2 = 1$. Their combined required size is $2 \( t_0 + 1 \) > ell$, which is impossible. Each unordered pair of list entries therefore supports at most one directed edge in $cal(G)_S$. Lemma 3 applies to this graph and all its induced subgraphs.

Set

$ delta = frac(1, 10 h^2) . $

For distinct $v \, w in V$, define a symmetric interaction $H_(v w)^S$ as follows. It is zero unless $v \, w$ differ by a symbol transposition in exactly one marked block. In that case, if the positions of the swapped symbols have gap $g$, put $H_(v w)^S = delta^g$. Independently of the lists, choose all indices $j_v in \[ m_s \]$ uniformly and independently, and give their joint distribution the unnormalized weight

#[#set math.equation(numbering: n => "(3.6)")
 $ W_S \( j \) = exp (sum_({ v \, w } subset.eq V) H_(v w)^S 1_({ j_v = j_w })) . $ <eq:tuple-index-weight>]

Every sum over ${ v \, w }$ is over unordered pairs of distinct vertices, so each interaction is counted once.

Define the finite measure $nu_(p \, S)$ by the identity

#[#set math.equation(numbering: n => "(3.7)")
 $ integral G \( z \) thin d nu_(p \, S) \( z \) = bb(E)_Y bb(E)_j I_S \( Y \) W_S \( j \) G #scale(x: 120%, y: 120%)[\(] \( Y_(u_S \( v \) \, j_v) \)_(v in V) #scale(x: 120%, y: 120%)[\)] $ <eq:tuple-component-law>]

for all functions $G$ on $bb(F)_p^V$. Both expectations on the right are uniform probability averages. In particular, $nu_(p \, S)$ has not been normalized to have mass one. We also write $nu \( 1 \)$ for the total mass of a finite measure $nu$.

Each vertex has at most $s binom(h, 2)$ neighbors with nonzero interaction, and each interaction is at most $delta$. Thus, with the fixed constant

#[#set math.equation(numbering: n => "(3.8)")
 $ B = exp (frac(d \( t_0 + 1 \) binom(h, 2) delta, 2)) \, $ <eq:tuple-weight-bound>]

we have

#[#set math.equation(numbering: n => "(3.9)")
 $ 1 lt.eq W_S \( j \) lt.eq B \, #h(2em) nu_(p \, S) \( bb(F)_p^V \) lt.eq B . $ <eq:tuple-component-mass-upper>]

For a cut with reflection $theta$, define the quadratic form

#[#set math.equation(numbering: n => "(3.10)")
 $ Q_(p \, S)^b \( F \) = integral F \( \( z_v \)_(v in V_(+)) \) F \( \( z_(theta v) \)_(v in V_(+)) \) thin d nu_(p \, S) \( z \) . $ <eq:tuple-cut-form>]

The notation suppresses the two symbols that specify the cut. Every component has a symmetric matrix at every cut, as we now verify.

#thm([Lemma 3.2.])[
  (Symmetry of the component matrices).  #emph[For every allowed mark set $S$ and every reflection $theta$, the measure $nu_(p \, S)$ is invariant under the permutation $\( z_v \) mapsto \( z_(theta v) \)$. Its matrix at that cut is symmetric.]
] <lem:tuple-component-symmetry>

#proof[
  The array $H^S$ is invariant under simultaneous application of $theta$ to both endpoints. In the reflected block, conjugating a symbol transposition changes only the names of the swapped symbols, not their positional gap. Interactions in other blocks retain their gap as well. Hence relabeling indices by $j_v mapsto j_(theta v)$ preserves their uniform law and weight.
  If the reflected block is marked, $u_S \( theta v \) = u_S \( v \)$, so no relabeling of lists is needed. If it is unmarked, $theta$ acts on addresses. Left symbol permutations commute with the right position shift $c$; therefore it preserves the directed address relation (3.4), including its orientation. Relabeling lists by this address involution preserves their uniform law and $I_S$. In either case these bijections in (3.7) send the output label at $v$ to the label at $theta v$, proving invariance. At the cut this invariance exchanges the two matrix indices, which is symmetry. ◻
]

=== 3.3 Strict positivity at a marked cut <strict-positivity-at-a-marked-cut>

The next estimate is the source of domination between successive mark sets. It must remain valid when different index assignments produce identical field labels.

#thm([Lemma 3.3.])[
  (Marked-cut lower bound).  #emph[Put 
$ kappa = 9 / 10 delta^(h - 1) \, #h(2em) lambda = \( e^kappa - 1 \)^n \, #h(2em) c_(*) = lambda m_(t_0 + 1)^(- n) > 0 . $

 For every $S$ with $\| S \| lt.eq t_0 + 1$, every cut in a marked block $b in S$, and every real $F : bb(F)_p^(V_(+)) arrow.r bb(R)$, 
#[#set math.equation(numbering: n => "(3.11)")
 $ Q_(p \, S)^b \( F \) gt.eq lambda m_s^(- n) thin bb(E)_(Y \, j_(+)) I_S \( Y \) F \( \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) \)^2 . $ <eq:tuple-marked-lower>]

 Here the expectation uses all uniform lists and only the uniform indices on $V_(+)$. In particular, the coefficient in (3.11) is at least $c_(*)$, independently of the prime and of the field-list values.]
] <lem:marked-positive>

#proof[
  Index an $n times n$ matrix by $x \, y in V_(+)$ and set
  $ sans(A)_(x y) = H_(x \, theta y)^S . $
  The invariance of $H^S$ used in Lemma 6, together with its symmetry, gives $sans(A)_(x y) = sans(A)_(y x)$.
  Suppose the two cut symbols occupy positions $i < j$ in the reflected block of $x$, and set $g = j - i$. The diagonal entry is $sans(A)_(x x) = delta^g$. A transposition taking $x$ across the cut must act in this block and involve a cut symbol. Apart from swapping the two cut symbols themselves, it must either move the first symbol from $i$ to a position $k > j$, or move the second from $j$ to a position $k < i$. Its gap is therefore at least $g + 1$. There are fewer than $h^2$ such transpositions, so
  $ sum_(y eq.not x) \| sans(A)_(x y) \| lt.eq h^2 delta^(g + 1) = 1 / 10 sans(A)_(x x) . $
  For every real vector $a$, using $2 \| a_x a_y \| lt.eq a_x^2 + a_y^2$ gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ a^T sans(A) a & gt.eq sum_x (sans(A)_(x x) - sum_(y eq.not x) \| sans(A)_(x y) \|) a_x^2\
 & gt.eq 9 / 10 delta^(h - 1) sum_x a_x^2 = kappa sum_x a_x^2 . $ <eq:tuple-cross-interaction-lower>]
  Write $m = m_s$ and $cal(J) = \[ m \]^(V_(+))$. For $j in cal(J)$, define a vector with one nonzero coordinate for each vertex $x in V_(+)$ by
  $ u \( j \) = \( 1_({ j_x = i }) \)_(x in V_(+) \, med i in \[ m \]) . $
  Using the reflected indices on the minus side, the cross factor of (3.6) is the matrix
  $ sans(C) \( j \, k \) = exp #scale(x: 120%, y: 120%)[\(] u \( j \)^T \( sans(A) ⊗ I_m \) u \( k \) #scale(x: 120%, y: 120%)[\)] . $
  Each unordered cross pair is uniquely ${ x \, theta y }$ with $x \, y in V_(+)$, so no extra factor of two appears in this formula.
  By (3.12), $sans(D) = \( sans(A) - kappa I_n \) ⊗ I_m$ is positive semidefinite. The matrix
  $ sans(R) \( j \, k \) = exp #scale(x: 120%, y: 120%)[\(] u \( j \)^T sans(D) u \( k \) #scale(x: 120%, y: 120%)[\)] $
  is positive semidefinite: after taking a square root of $sans(D)$, the bilinear form is an inner product, and each term of the exponential series is a Gram matrix of tensor powers with a nonnegative coefficient. The convergent sum is positive semidefinite. Moreover $sans(R) \( j \, j \) gt.eq 1$.
  The remaining factor is
  $ sans(E) \( j \, k \) = exp (kappa sum_(x in V_(+)) 1_({ j_x = k_x })) . $
  As a matrix this is
  $ sans(E) = ⨂_(x in V_(+)) #scale(x: 120%, y: 120%)[\(] \( e^kappa - 1 \) I_m + upright(bold(1)) upright(bold(1))^T #scale(x: 120%, y: 120%)[\)] . $
  Every factor dominates $\( e^kappa - 1 \) I_m$, also for $m = 1$. It follows that $sans(E)$ dominates $lambda I_(cal(J))$. The entrywise product of positive semidefinite matrices is positive semidefinite: if they are Gram matrices, the products of their entries are the Gram matrix of pairwise tensor products. Denoting entrywise multiplication by $compose$, we therefore obtain
  #[#set math.equation(numbering: n => "(3.13)")
   $ sans(C) = \( sans(E) - lambda I_(cal(J)) \) compose sans(R) + lambda \( I_(cal(J)) compose sans(R) \) succ.curly.eq lambda I_(cal(J)) . $ <eq:tuple-exponential-lower>]
  The internal weight on the plus half is
  $ a \( j \) = exp (sum_({ x \, y } subset.eq V_(+)) H_(x y)^S 1_({ j_x = j_y })) gt.eq 1 . $
  The reflected minus weight is the same function of its indices. Thus the full index matrix is $"diag" \( a \) sans(C) "diag" \( a \)$, which still dominates $lambda I_(cal(J))$ by (3.13).
  Fix the lists. Since $b in S$, the two reflected vertices $v \, theta v$ have the same address. Consequently both sides of the quadratic form use the same vector
  $ f_Y \( j \) = F \( \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) \) . $
  This vector may have repeated entries. No injectivity of the map from index assignments to field assignments is required for the matrix lower bound. Since $\| cal(J) \| = m^n$, the full uniform index average is bounded below by
  $ lambda m^(- 2 n) sum_(j in cal(J)) f_Y \( j \)^2 = lambda m^(- n) bb(E)_(j in cal(J)) f_Y \( j \)^2 . $
  Multiply by $I_S \( Y \)$ and average over the lists. This proves (3.11). The stated uniform coefficient follows from $m_s lt.eq m_(t_0 + 1)$. ◻
]

=== 3.4 The error at an unmarked cut <the-error-at-an-unmarked-cut>

At an unmarked cut, the lists themselves split into two independent families. Lemma 4 controls the possible negative part of the cut form.

#thm([Lemma 3.4.])[
  (Unmarked-cut error).  #emph[Let $b in.not S$ specify a cut and suppose $s = \| S \| lt.eq t_0$. Let $Y_(+)$ consist of the lists at plus addresses, and let $I_(+) \( Y_(+) \)$ impose only the constraints internal to those addresses. For a real half-label function $F$, put 
$ D_(p \, S)^b \( F \) = bb(E)_(Y_(+) \, j_(+)) I_(+) \( Y_(+) \) F \( \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) \)^2 . $

 Then, with the fixed constant $C_(*) = \( 32 d^2 \)^(1 \/ 4) B^2$, 
#[#set math.equation(numbering: n => "(3.14)")
 $ Q_(p \, S)^b \( F \) gt.eq - C_(*) p^(- 1 \/ 8) D_(p \, S)^b \( F \) . $ <eq:tuple-unmarked-error>]

 If instead $s = t_0 + 1$, the form $Q_(p \, S)^b$ is nonnegative.]
] <lem:unmarked-error>

#proof[
  Use $theta$ to identify the minus-address list space with a second copy of the plus-address space. Symmetry of the directed graph gives the factorization
  $ I_S \( Y_(+) \, Y_(-) \) = I_(+) \( Y_(+) \) I_(+) \( Y_(-) \) K_b \( Y_(+) \, Y_(-) \) \, $
  where $K_b$ is the product of the constraints crossing the cut. Its graph is bipartite, simple on unordered pairs, and may contain both orientations on different pairs. If it has $e_b$ edges, then $e_b lt.eq d^2$ by (3.3). Lemma 4 yields
  $ parallel K_b - 2^(- e_b) parallel_(upright("op")) lt.eq \( 32 d^2 \)^(1 \/ 4) p^(- 1 \/ 8) . $
  Every nonzero index interaction changes a marked block, and so preserves the unmarked word in block $b$. No such interaction crosses the cut. The index weight therefore factors as $W_(+) \( j_(+) \) W_(+) \( j_(-) \)$, with the same function on the reflected halves and $1 lt.eq W_(+) lt.eq B$. Set
  $ G \( Y_(+) \) = I_(+) \( Y_(+) \) bb(E)_(j_(+)) W_(+) \( j_(+) \) F \( \( Y_(u_S \( v \) \, j_v) \)_(v in V_(+)) \) . $
  Then $Q_(p \, S)^b \( F \) = chevron.l G \, T_(K_b) G chevron.r$. The constant kernel contributes the nonnegative quantity $2^(- e_b) \( bb(E) G \)^2$. Cauchy–Schwarz in the uniform index average, followed by $I_(+)^2 = I_(+)$ and $W_(+) lt.eq B$, gives
  $ parallel G parallel_2^2 lt.eq B^2 D_(p \, S)^b \( F \) . $
  The operator error proves (3.14). For $s = t_0 + 1$, no field constraints are present, so the same factorization gives exactly $Q_(p \, S)^b \( F \) = \( bb(E) G \)^2 gt.eq 0$. ◻
]

=== 3.5 Domination and the reflection-positive mixture <domination-and-the-reflection-positive-mixture>

We now compare the two preceding lemmas. Marking a further block combines all its plus-side lists into one longer list. The precise length $m_s = r^s$ ensures that this identification preserves the uniform product distribution.

#thm([Lemma 3.5.])[
  (Domination after marking a block).  #emph[Let $b in.not S$, $\| S \| lt.eq t_0$, and set $S' = S union { b }$. For the cut in block $b$ and every real half-label function $F$, 
#[#set math.equation(numbering: n => "(3.15)")
 $ Q_(p \, S')^b \( F \) gt.eq c_(*) r^(- n) D_(p \, S)^b \( F \) . $ <eq:tuple-marking-domination>]

 Consequently the measure $nu_(p \, S) + p^(- 1 \/ 16) nu_(p \, S')$ has a positive semidefinite matrix at this cut whenever 
#[#set math.equation(numbering: n => "(3.16)")
 $ p gt.eq P_(upright("ref")) := max { 3 \, \( C_(*) r^n \/ c_(*) \)^16 } . $ <eq:tuple-reflection-threshold>]

]
] <lem:tuple-marking-domination>

#proof[
  Let $Pi_(+) subset.eq Pi$ consist of words in which the first cut symbol precedes the second. It has $r = K \/ 2$ elements. Above each address in $U_(S')$, the old plus addresses are indexed by $w in Pi_(+)$. Identify the new list of length $m_(s + 1) = r m_s$ with the entries indexed by $\( w \, i \) in Pi_(+) times \[ m_s \]$ in those old lists. Applied at every new address, this identifies the entire new list collection with the old plus list collection; both have the same uniform product law. Figure 2 separates this relabeling from the index restriction used below.
  #figure(
    [
$ underbrace((\( Y_(\( u \, w \) \, i) \)_(i in \[ m_s \]))_(w in Pi_(+)), r upright(" lists, each of length ") m_s) quad arrow.l.r quad underbrace(\( Y'_(u \, \( w \, i \)) \)_(\( w \, i \) in Pi_(+) times \[ m_s \]), upright("one list of length ") m_(s + 1) = r m_s) $

 
$ j'_v = \( w \, i \) med upright(" uniform in ") Pi_(+) times \[ m_s \] quad arrow.r^(med upright("restrict to ") w = v_b med) quad Y'_(u \, \( v_b \, i \)) = Y_(\( u \, v_b \) \, i) \,\
bb(P) \( w = v_b \) = r^(- 1) \, #h(2em) bb(P) \( upright("all ") v in V_(+) upright(" select their own sublist") \) = r^(- n) . $

],
    caption: [Figure 2: The two steps when marking a block $b$. For a new address $u in U_(S union { b })$, the old plus addresses above it are $\( u \, w \)$, where $w in Pi_(+)$ is the word in block $b$; the prime on $Y'$ marks only a relabeling of the same entries. Regrouping the independent lists preserves their distribution without a loss. For each $v in V_(+)$, with $u = u_(S union { b }) \( v \)$, restricting its independent new index to $w = v_b$ recovers its old emitted label. This second step has the total probability $r^(- n)$. ],
  ) <fig:list-regrouping>
  If $s + 1 lt.eq t_0$, any new address edge already has at least $t_0 + 1$ matching blocks outside $b$. Every pair of old plus addresses above its endpoints therefore satisfies the old address edge condition, regardless of their block words in $b$. Old internal validity imposes the square constraint on all entries of every such pair of lists, and hence implies every new validity condition. If $s = t_0$, the new component is terminal and imposes no conditions, so the same implication holds. Thus under this identification
  $ I_(+) \( Y \) lt.eq I_(S') \( Y \) . $
  Apply Lemma 7 to $S'$. In the expectation on its right-hand side, restrict every new half index $j'_v$ to the sublist labeled by the actual word $v_b in Pi_(+)$. There are $n$ independent indices, each selecting that sublist with probability $1 \/ r$. The restriction therefore has probability exactly $r^(- n)$. Conditional on it, the residual indices in $\[ m_s \]$ remain independent uniform variables, and the emitted half labels are exactly the old half labels. Since the test function is squared, restricting the expectation and then using $I_(+) lt.eq I_(S')$ gives
  $ Q_(p \, S')^b \( F \) gt.eq c_(*) bb(E)_(Y \, j'_(+)) I_(S') \( Y \) F \( z_(+) \)^2 gt.eq c_(*) r^(- n) D_(p \, S)^b \( F \) . $
  This is (3.15).
  By Lemma 8, the sum of the two cut forms is at least
  $ #scale(x: 120%, y: 120%)[\(] c_(*) r^(- n) p^(- 1 \/ 16) - C_(*) p^(- 1 \/ 8) #scale(x: 120%, y: 120%)[\)] D_(p \, S)^b \( F \) . $
  The bracket is nonnegative under (3.16). Symmetry follows from Lemma 6, completing the proof. ◻
]

Define the unnormalized mixture and its mass by

#[#set math.equation(numbering: n => "(3.17)")
 $ M_p = sum_(S subset.eq \[ ell \]\
\| S \| lt.eq t_0 + 1) p^(- \| S \| \/ 16) nu_(p \, S) \, #h(2em) Z_p = M_p \( bb(F)_p^V \) . $ <eq:tuple-mixture>]

For any fixed cut block $b$, it has the exact decomposition

#[#set math.equation(numbering: n => "(3.18)")
 $ M_p =  & sum_(b in.not S\
\| S \| lt.eq t_0) p^(- \| S \| \/ 16) #scale(x: 120%, y: 120%)[\(] nu_(p \, S) + p^(- 1 \/ 16) nu_(p \, S union { b }) #scale(x: 120%, y: 120%)[\)]\
 & + p^(- \( t_0 + 1 \) \/ 16) sum_(b in.not S\
\| S \| = t_0 + 1) nu_(p \, S) . $ <eq:tuple-exact-pairing>]

Every component containing $b$ appears exactly once, paired with the component obtained by removing $b$. Every component not containing $b$, except those of size $t_0 + 1$, is the first member of one pair. The remaining components are terminal and are positive semidefinite at this unmarked cut by Lemma 8. Thus Lemma 9 and (3.18) show that $M_p$ is reflection positive for $p gt.eq P_(upright("ref"))$. The threshold is uniform in the block, cut symbols, and mark sets.

=== 3.6 Normalization, exceptional mass, and cycle support <normalization-exceptional-mass-and-cycle-support>

Let $e_0$ be the number of edges of the leading list graph $cal(G)_diameter$. For this component $m_0 = 1$ and $W_diameter = 1$. Lemma 3 gives

$ lr(|nu_(p \, diameter) \( bb(F)_p^V \) - 2^(- e_0)|) lt.eq e_0 p^(- 1 \/ 2) . $

Put

#[#set math.equation(numbering: n => "(3.19)")
 $ c_0 = 2^(- e_0 - 1) \, #h(2em) P_(upright("mass")) = max { 3 \, \( 2^(e_0 + 1) e_0 \)^2 } . $ <eq:tuple-mass-constants>]

For every prime $p gt.eq P_(upright("mass"))$,

#[#set math.equation(numbering: n => "(3.20)")
 $ c_0 lt.eq nu_(p \, diameter) \( bb(F)_p^V \) lt.eq Z_p lt.eq 2^ell B . $ <eq:tuple-normalizer-bounds>]

The upper bound uses (3.9) and $p^(- \| S \| \/ 16) lt.eq 1$.

We can therefore define

#[#set math.equation(numbering: n => "(3.21)")
 $ mu_p = M_p / Z_p \, #h(2em) epsilon_p = p^(- \( t_0 + 1 \) \/ 16) / Z_p sum_(\| S \| = t_0 + 1) nu_(p \, S) \, #h(2em) eta_p = epsilon_p \( bb(F)_p^V \) . $ <eq:tuple-normalized-laws>]

The full law is a probability measure, and $epsilon_p$ is a nonnegative submeasure. Moreover

#[#set math.equation(numbering: n => "(3.22)")
 $ eta_p lt.eq C_(upright("exc")) p^(- 81 \/ 16) \, #h(2em) C_(upright("exc")) = c_0^(- 1) binom(ell, 81) B . $ <eq:tuple-exception-bound>]

Since $81 \/ 16 - 4 = 17 \/ 16$, taking $p gt.eq C_(upright("exc"))^(16 \/ 17)$ ensures $eta_p lt.eq p^(- 4) < 1$. This defines the normalized nonexceptional law $mu_p^compose = \( mu_p - epsilon_p \) \/ \( 1 - eta_p \)$. Positive normalization preserves reflection positivity of $mu_p$.

For later use, in either the full mixture or the normalized nonexceptional mixture, the total probability of components with $S eq.not diameter$ is at most

#[#set math.equation(numbering: n => "(3.23)")
 $ frac(2^ell B, c_0) p^(- 1 \/ 16) . $ <eq:tuple-nonleading-mass>]

Indeed their unnormalized weights are at most $p^(- 1 \/ 16) nu_(p \, S) \( bb(F)_p^V \)$, and the relevant total unnormalized mass is at least the leading mass $c_0$ in both cases.

Each component is invariant under simultaneous square-affine changes of field labels. To see this directly, apply $Y_(u \, i) mapsto q Y_(u \, i) + a$ to every list entry, where $q in Q_p^(*)$. This bijection preserves the uniform list law, every strict-square difference condition, and the index weights. The output labels undergo the same affine map. Invariance therefore holds for $mu_p$, $epsilon_p$, and $mu_p^compose$. Translations act transitively on $bb(F)_p$, so every single-label marginal of each positive-mass normalized component, and of each of these normalized mixtures, is uniform.

For $\| S \| lt.eq t_0$, the designated vertices $v_j \, v_(j + 1)$ have clean words related by $c$ in all $ell - \| S \| gt.eq t_0 + 1$ clean blocks. Their addresses therefore form an edge in (3.4). Its conditions apply to every pair of list entries, including the two chosen by the indices. It follows that every nonterminal component is supported on

#[#set math.equation(numbering: n => "(3.24)")
 $ z_(v_(j + 1)) - z_(v_j) in Q_p^(*) quad upright("for all ") 0 lt.eq j < h . $ <eq:tuple-cycle-support>]

The same support assertion holds for $mu_p^compose$.

The construction has now supplied the probability normalization, all reflection inequalities, affine invariance, the exceptional-mass bound, and the cycle support. It remains to verify conditional mixing and identify the selected pair marginals. Those facts use only the graph estimates, component masses, and invariance just established.

=== 3.7 Conditional mixing and the selected pair marginals <subsec:tuple-conditional-mixing>

The leading component of the construction has one independent field variable at each vertex before the constraints are imposed. We first show that, in this component, knowing all other labels predicts little about a mean-zero function of one label. The other components have small total mass, which permits the same conclusion with a weaker fixed exponent. We also identify the selected pair marginals that will supply the square-difference kernel.

#thm([Lemma 3.6.])[
  (Conditional mixing and pair marginals).  #emph[For the fixed index set $V$ and the measures constructed above, there is an absolute threshold $P$ such that the following statements hold for every prime $p gt.eq P$. Both probability measures 
$ mu_p \, #h(2em) mu_p^compose = frac(mu_p - epsilon_p, 1 - eta_p) \, #h(2em) eta_p = epsilon_p \( 1 \) \, $

 have uniform marginals in each individual label. If $rho$ is either measure, $v in V$, and $lambda$ is its marginal on $bb(F)_p^(V \\ { v })$, then every function $f : bb(F)_p arrow.r bb(C)$ with $bb(E)_x f \( x \) = 0$ satisfies 
#[#set math.equation(numbering: n => "(3.25)")
 $ ∥bb(E)_rho #scale(x: 120%, y: 120%)[\[] f \( z_v \) divides \( z_w \)_(w eq.not v) #scale(x: 120%, y: 120%)[\]]∥_(L^2 \( lambda \)) lt.eq p^(- 1 \/ 64) parallel f parallel_(L^2 \( bb(F)_p \)) . $ <eq:tuple-conditional-mixing>]

 The threshold is uniform in the choice of $v$ and $rho$.]
  #emph[For every selected cycle edge $v_j arrow.r v_(j + 1)$, its pair marginal under $mu_p^compose$ is uniform on 
$ Omega_p = { \( x \, y \) in bb(F)_p^2 : y - x in Q_p^(*) } . $

 Its pair marginal under $mu_p$ is 
#[#set math.equation(numbering: n => "(3.26)")
 $ \( 1 - eta_p \) "Unif" \( Omega_p \) + eta_p "Unif" \( bb(F)_p^2 \) . $ <eq:tuple-full-pair-law>]

]
] <lem:conditional-mixing>

#proof[
  Choose a fixed threshold $P_0$ beyond which the construction and its component mass bounds hold. By (3.20), the leading mass is at least $c_0 = 2^(- e_0 - 1)$. The affine invariance proved above gives uniform single-label marginals in every normalized positive-mass component. Thus a function with uniform mean zero is centered in each component separately, and its input $L^2$ norm is the same in each component.
  Fix $v$. Write $x = z_v$ and $y = \( z_w \)_(w eq.not v)$, and use independent uniform measures in these variables until otherwise stated. Since $m_0 = 1$, the density of $nu_(p \, diameter)$ is $L \( y \) K \( x \, y \)$, where $K$ is the product of the incident edge indicators and $L$ is the product of all other edge indicators. Both are indicator functions. If $m_v$ is the number of incident edges, put
  $ c_v = 2^(- m_v) \, #h(2em) a \( y \) = bb(E)_x K \( x \, y \) \, #h(2em) b_f \( y \) = bb(E)_x f \( x \) K \( x \, y \) . $
  For $m_v > 0$, Lemma 4, with its operator transposed if necessary, gives
  #[#set math.equation(numbering: n => "(3.27)")
   $ parallel a - c_v parallel_2 lt.eq Delta_v \, #h(2em) parallel b_f parallel_2 lt.eq Delta_v parallel f parallel_2 \, #h(2em) Delta_v = \( 32 m_v \)^(1 \/ 4) p^(- 1 \/ 8) . $ <eq:conditional-numerator-bounds>]
  The incident constraints form a cross-list graph between the single variable $x$ and the other labels. Incoming and outgoing edges are both allowed by that lemma. The first inequality applies the centered kernel to the constant function, while the second uses $bb(E) f = 0$. All norms in (3.27) use the uniform base measures.
  Put $Z_0 = nu_(p \, diameter) \( 1 \)$, and let $T_0$ be the conditional operator for the normalized leading component. Its other-label marginal is $Z_0^(- 1) L \( y \) a \( y \) thin d y$, and therefore
  #[#set math.equation(numbering: n => "(3.28)")
   $ parallel T_0 f parallel_2^2 = Z_0^(- 1) bb(E)_y L \( y \) frac(\| b_f \( y \) \|^2, a \( y \)) . $ <eq:conditional-leading-norm>]
  The ratio is defined as zero where $a \( y \) = 0$, a set of zero marginal mass. On ${ a gt.eq c_v \/ 2 }$, its contribution to (3.28) is at most $2 c_0^(- 1) c_v^(- 1) Delta_v^2 parallel f parallel_2^2$. On the complementary set, Chebyshev’s inequality gives
  $ bb(P)_y \( a < c_v \/ 2 \) lt.eq 4 Delta_v^2 \/ c_v^2 . $
  Weighted Cauchy–Schwarz gives the pointwise bound
  $ \| b_f \( y \) \|^2 lt.eq a \( y \) bb(E)_x \| f \( x \) \|^2 K \( x \, y \) \, #h(2em) frac(\| b_f \( y \) \|^2, a \( y \)) lt.eq parallel f parallel_2^2 \, $
  again with the zero-ratio convention. Thus no lower bound for $a \( y \)$ is needed on this small set. Since $L lt.eq 1$, its contribution is at most $4 c_0^(- 1) c_v^(- 2) Delta_v^2 parallel f parallel_2^2$. We conclude that
  $ parallel T_0 f parallel_2^2 lt.eq c_0^(- 1) \( 2 \/ c_v + 4 \/ c_v^2 \) Delta_v^2 parallel f parallel_2^2 lt.eq C_(upright("lead")) p^(- 1 \/ 4) parallel f parallel_2^2 \, $
  where the fixed constant
  $ C_(upright("lead")) = c_0^(- 1) #scale(x: 120%, y: 120%)[\(] 2^(e_0 + 1) + 2^(2 e_0 + 2) #scale(x: 120%, y: 120%)[\)] sqrt(32 e_0) $
  works for every slot, since $m_v lt.eq e_0$. If $m_v = 0$, the label is independent of all others in this component, so $T_0 f = 0$ and the same bound holds.
  Now let $rho$ be either $mu_p$ or $mu_p^compose$. Represent it as a mixture of the normalized positive-mass components:
  $ rho = sum_S alpha_S rho_S \, #h(2em) rho_S = frac(nu_(p \, S), nu_(p \, S) \( 1 \)) . $
  The components with zero mass are omitted. In the nonexceptional law, the terminal components $\| S \| = t_0 + 1$ are also omitted. In either case $alpha_S$ is $p^(- \| S \| \/ 16) nu_(p \, S) \( 1 \)$ divided by the sum of these masses over the retained components. By (3.23),
  #[#set math.equation(numbering: n => "(3.29)")
   $ sum_(S eq.not diameter) alpha_S lt.eq C_(upright("mix")) p^(- 1 \/ 16) \, #h(2em) C_(upright("mix")) = 2^ell B \/ c_0 . $ <eq:conditional-mixture-mass>]
  Introduce the component index $S$ as a latent random variable and condition on it as well as the other labels. Conditional Jensen and the tower property imply
  $ parallel bb(E)_rho \[ f \( z_v \) divides y \] #scale(x: 120%, y: 120%)[parallel]_2^2 & lt.eq bb(E)_rho \| bb(E) \[ f \( z_v \) divides y \, S \] #scale(x: 120%, y: 120%)[\|]^2\
 & = sum_S alpha_S parallel T_S f parallel_2^2\
 & lt.eq #scale(x: 120%, y: 120%)[\(] C_(upright("lead")) p^(- 1 \/ 4) + C_(upright("mix")) p^(- 1 \/ 16) #scale(x: 120%, y: 120%)[\)] parallel f parallel_2^2 . $
  For the nonleading components we used only conditional-expectation contraction. Its input norm is the same uniform $L^2$ norm in each component, by the marginal statement proved above. Set $C_(upright("cond")) = C_(upright("lead")) + C_(upright("mix"))$. Enlarging the fixed prime threshold so that $P gt.eq max { P_0 \, 3 \, C_(upright("cond"))^32 }$ ensures
  $ C_(upright("cond")) p^(- 1 \/ 16) lt.eq p^(- 1 \/ 32) #h(2em) \( p gt.eq P \) . $
  Taking square roots proves (3.25). All constants involved depend only on the fixed finite construction. In particular, this is one threshold for both laws and all slots, with no residual multiplicative constant in the operator estimate.
  It remains to identify the pair marginals. By (3.24), the $mu_p^compose$-pair is supported on $Omega_p$. The square-affine group acts transitively on this set: the map taking $\( x \, y \)$ to $\( x' \, y' \)$ has
  $ q = frac(y' - x', y - x) in Q_p^(*) \, #h(2em) a = x' - q x . $
  The affine invariance already proved forces the probability of every pair in $Omega_p$ to equal $2 \/ \[ p \( p - 1 \) \]$.
  In a terminal component, there are still $ell - \( t_0 + 1 \) = 80$ clean blocks. The two selected vertices have distinct clean addresses, and there are no field constraints. Conditional on every index choice, their labels are therefore selected from two independent uniform lists and form an independent uniform pair. The index weight is independent of the field entries, so this remains true after averaging the indices. The normalized exceptional mixture consequently has pair law $"Unif" \( bb(F)_p^2 \)$. Combining it with the nonexceptional part gives (3.26). ◻
]

Equivalently, a selected pair under $mu_p^compose$ has the form $\( X \, X + U \)$, where $X$ is uniform on $bb(F)_p$ and $U$ is independently uniform on $Q_p^(*)$. This exact description will be used only for the normalized nonexceptional law. The full law has the additional term displayed in (3.26); its conditional mixing estimate is nevertheless the same.

#proof[
  Choose one integer $P$ at least $P_(upright("ref"))$, $P_(upright("mass"))$, $C_(upright("exc"))^(16 \/ 17)$, and the threshold in Lemma 10. All these numbers depend only on the fixed parameters (3.1). Equations (3.18)–(3.21) give the normalized reflection-positive measure and its exceptional submeasure. The invariance and uniform marginals were proved above; (3.22) and (3.24) give the exceptional-mass bound and cycle support. Lemma 10 supplies the selected pair laws and (3.2). This proves all assertions. ◻
]

== 4 Signed multilinear forms and conductor decay <sec:functional>

The tuple laws provide two estimates for functions on products of prime fields. The first follows the reflection and chessboard method of #cite(label("FrohlichLieb1978")) Theorem 2.2 and #cite(label("FILS1978ReflectionI")) Theorem 4.1; the finite proof below verifies the required inequality for this particular tuple law. Reflection positivity gives a Hölder inequality for signed inputs and a seminorm that dominates the uniform mean. The conditional mixing estimate gives a separate bound for inputs supported on large Fourier denominators. This second estimate also applies to the nonexceptional laws.

Retain the index set $V = Pi^ell$, where $Pi$ consists of the permutation words on $\[ h \]$, $h = 24$, and $ell = 161$, and put $d = \| V \|$. In particular, $d$ is even. Fix the prime threshold $P$ from Proposition 5 and Lemma 10, and put $gamma = 1 \/ 64$. For a finite set $cal(P)$ of primes at least $P$, define

$ X_(cal(P)) = product_(p in cal(P)) bb(F)_p \, #h(2em) mu_(cal(P)) = ⨂_(p in cal(P)) mu_p . $

We regard $mu_(cal(P))$ as a probability law on $X_(cal(P))^V$ by collecting, for each slot $v$, its labels at all primes into $z_v in X_(cal(P))$. Every single-slot marginal is uniform on $X_(cal(P))$. Unless another measure is specified, norms and expectations on $X_(cal(P))$ use uniform probability measure. Set

#[#set math.equation(numbering: n => "(4.1)")
 $ cal(Z)_(cal(P)) \( \( g_v \)_(v in V) \) = integral product_(v in V) g_v \( z_v \) thin d mu_(cal(P)) \( z \) \, #h(2em) Z_(cal(P)) \( g \) = cal(Z)_(cal(P)) \( \( g \)_(v in V) \) . $ <eq:functional-definition>]

For an empty prime set, $X_diameter$ is a singleton and the product law has mass one; thus $Z_diameter \( g \) = g^d$.

=== 4.1 A finite signed reflection inequality <a-finite-signed-reflection-inequality>

#thm([Proposition 4.1.])[
  (Signed Hölder inequality).  #emph[For every finite prime set $cal(P)$ as above and real functions $g \, g_v : X_(cal(P)) arrow.r bb(R)$, one has 
#[#set math.equation(numbering: n => "(4.2)")
 $ Z_(cal(P)) \( g \) gt.eq 0 \, #h(2em) lr(|cal(Z)_(cal(P)) \( \( g_v \)_(v in V) \)|) lt.eq product_(v in V) Z_(cal(P)) \( g_v \)^(1 \/ d) . $ <eq:signed-holder>]

 The inequality includes inputs with zero diagonal integral.]
] <prop:signed-holder>

#proof[
  Across any reflection cut, the matrix of $mu_(cal(P))$ is the tensor product of the corresponding matrices of the $mu_p$. It is therefore symmetric positive semidefinite. This also holds for the empty prime set. We first record precisely what a reflection does to an assignment of functions.
  Fix a block and two distinct symbols. Let $theta$ exchange those symbols in that block, and let $V_(+)$ be the vertices in which the first symbol occurs before the second. Put $V_(-) = theta V_(+)$. Define the two fold maps $phi.alt_(+) \, phi.alt_(-) : V arrow.r V$ by
  $ phi.alt_(+) \( v \) = cases(delim: "{", v \, & v in V_(+) \,, theta v \, & v in V_(-) \,) #h(2em) phi.alt_(-) \( v \) = cases(delim: "{", theta v \, & v in V_(+) \,, v \, & v in V_(-) .) $
  For an assignment $a : V arrow.r bb(R)^(X_(cal(P)))$, abbreviate $cal(Z)_(cal(P)) \( \( a \( v \) \)_(v in V) \)$ by $Lambda \( a \)$. The bilinear form of the cut matrix is evaluated on the two real functions
  $ F \( x \) = product_(v in V_(+)) a \( v \) \( x_v \) \, #h(2em) G \( x \) = product_(v in V_(+)) a \( theta v \) \( x_v \) . $
  Its mixed value is $Lambda \( a \)$; its two quadratic values are $Lambda \( a compose phi.alt_(+) \)$ and $Lambda \( a compose phi.alt_(-) \)$. Cauchy–Schwarz for this positive semidefinite form gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| Lambda \( a \) \|^2 lt.eq Lambda \( a compose phi.alt_(+) \) Lambda \( a compose phi.alt_(-) \) \, #h(2em) Lambda \( a compose phi.alt_plus.minus \) gt.eq 0 . $ <eq:folding-cauchy-schwarz>]
  This remains valid when the form has a nontrivial null space. For a constant assignment, $F = G$; hence $Z_(cal(P)) \( g \) gt.eq 0$.
  We next specify a finite sequence of folds whose composition is constant. For a word $w$ in block $b$, write $p_i = w^(- 1) \( i \)$ for the position of symbol $i$. Let $phi.alt_(b \, i)$ be the fold onto $p_i < p_(i + 1)$, where $1 lt.eq i < h$. Swapping symbols $i \, i + 1$ on the left exchanges precisely the two entries $p_i \, p_(i + 1)$. Thus this fold compares these adjacent entries and puts them in increasing order.
  In each block use the fixed sequence of comparisons
  $ \( 1 \, 2 \) \, \( 2 \, 3 \) \, dots.h \, \( h - 1 \, h \) \, $
  repeated $h - 1$ times. One sweep moves the largest entry to the last position. Once the last $k$ entries are the largest $k$ entries in increasing order, the next sweep leaves them there and puts the largest remaining entry immediately before them. Induction shows that these sweeps sort every position array to $\( 1 \, dots.h \, h \)$. Concatenating the sequences for all $ell$ blocks gives fold maps $phi.alt_1 \, dots.h \, phi.alt_T$, with $T = ell \( h - 1 \)^2$, such that
  #[#set math.equation(numbering: n => "(4.4)")
   $ phi.alt_T compose dots.h.c compose phi.alt_1 \( v \) = v_(*) quad upright("for every ") v in V \, $ <eq:constant-fold-composition>]
  where $v_(*)$ has the identity word in every block.
  To use this sequence, fix any finite nonempty list of real functions $f_1 \, dots.h \, f_k$ and set
  $ M = max_(a : V arrow.r \[ k \]) lr(|cal(Z)_(cal(P)) \( \( f_(a \( v \)) \)_(v in V) \)|) . $
  The maximum ranges over all assignments, with repetition, and exists because there are only $k^d$ assignments. If $M > 0$, choose a maximizer. Each of its folded assignments still takes values in the same finite list, so each folded integral is at most $M$ in absolute value. Equation (4.3) says that those two integrals are nonnegative and their product is at least $M^2$. They must therefore both equal $M$. In particular, either fold of any maximizing assignment is again maximizing.
  Apply the folds in reverse sorting order, $phi.alt_T \, phi.alt_(T - 1) \, dots.h \, phi.alt_1$. Pullbacks compose on the right, so the resulting assignment is $a compose phi.alt_T compose dots.h.c compose phi.alt_1$, which is constant by (4.4). Every intermediate integral is $M$, and the last is one of the diagonal values $Z_(cal(P)) \( f_i \)$. Conversely, every constant assignment was included in the maximum. It follows that
  #[#set math.equation(numbering: n => "(4.5)")
   $ M = max_(1 lt.eq i lt.eq k) Z_(cal(P)) \( f_i \) . $ <eq:finite-folding-maximum>]
  When $M = 0$, all these diagonal values are zero, so the same identity holds. This is a finite argument and requires no limiting sequence of folds. The maximizing-assignment argument is analogous to the proof of the abstract chessboard estimate in #cite(label("FILS1978ReflectionI")) Theorem 4.1.
  Finally, for $epsilon.alt > 0$, apply (4.5) to the list
  $ f_v = frac(g_v, \( Z_(cal(P)) \( g_v \) + epsilon.alt \)^(1 \/ d)) \, #h(2em) v in V . $
  Every denominator is positive and $Z_(cal(P)) \( f_v \) lt.eq 1$. Multilinearity consequently gives
  $ lr(|cal(Z)_(cal(P)) \( \( g_v \)_(v in V) \)|) lt.eq product_(v in V) \( Z_(cal(P)) \( g_v \) + epsilon.alt \)^(1 \/ d) . $
  Letting $epsilon.alt arrow.b 0$ proves (4.2), including zero diagonal values. ◻
]

=== 4.2 The seminorm and its symmetries <the-seminorm-and-its-symmetries>

Proposition 11 allows us to define, for real $g$,

$ parallel g parallel_(cal(P)) = Z_(cal(P)) \( g \)^(1 \/ d) . $

For $B subset.eq cal(P)$, let $bb(E)_B g$ denote uniform averaging over the coordinates in $B$, holding the other coordinates fixed. We may regard this either as a function on $X_(cal(P))$ independent of $B$, or as a function on $X_(cal(P) \\ B)$.

#thm([Lemma 4.2.])[
  (Seminorm properties).  #emph[The map $g mapsto parallel g parallel_(cal(P))$ is a seminorm on the real functions on $X_(cal(P))$, and 
#[#set math.equation(numbering: n => "(4.6)")
 $ \| bb(E) g \| lt.eq parallel g parallel_(cal(P)) . $ <eq:functional-mean>]

 For $a_p in bb(F)_p$ and $r_p in Q_p^(*)$, let $A \( x \)_p = r_p x_p + a_p$. Then 
#[#set math.equation(numbering: n => "(4.7)")
 $ parallel g compose A parallel_(cal(P)) = parallel g parallel_(cal(P)) . $ <eq:functional-affine>]

 For every $B subset.eq cal(P)$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ parallel bb(E)_B g parallel_(cal(P) \\ B) = parallel bb(E)_B g parallel_(cal(P)) lt.eq parallel g parallel_(cal(P)) . $ <eq:functional-projection>]

]
] <lem:functional-properties>

#proof[
  Nonnegativity is already proved. Since $d$ is even, homogeneity of the diagonal form gives $parallel c g parallel_(cal(P)) = \| c \| parallel g parallel_(cal(P))$ for every real $c$. For real functions $g_1 \, g_2$, expand $Z_(cal(P)) \( g_1 + g_2 \)$ multilinearly and apply (4.2) to each term. With $a = parallel g_1 parallel_(cal(P))$ and $b = parallel g_2 parallel_(cal(P))$, this gives
  $ 0 lt.eq Z_(cal(P)) \( g_1 + g_2 \) lt.eq sum_(S subset.eq V) a^(\| S \|) b^(d - \| S \|) = \( a + b \)^d . $
  Taking the nonnegative $d$-th root proves the triangle inequality, also when one of the seminorms vanishes.
  The probability normalization gives $Z_(cal(P)) \( 1 \) = 1$. Insert $g$ in one slot and $1$ in all others in (4.2). The uniform single-slot marginal identifies the left side with $\| bb(E) g \|$, proving (4.6). The simultaneous affine invariance of each $mu_p$ proves (4.7); its parameters may be chosen independently at different primes.
  Let $G_B$ be the additive subgroup of $X_(cal(P))$ consisting of vectors supported on $B$. Then
  $ \( bb(E)_B g \) \( x \) = frac(1, \| G_B \|) sum_(t in G_B) g \( x + t \) . $
  The triangle inequality and translation invariance show that this average has seminorm at most $parallel g parallel_(cal(P))$. Since the averaged function is independent of $B$, integration over the prime laws in $B$, each of mass one, gives
  $ Z_(cal(P)) \( bb(E)_B g \) = Z_(cal(P) \\ B) \( bb(E)_B g \) . $
  This proves (4.8). All statements include the empty prime set, for which the seminorm is absolute value. ◻
]

=== 4.3 Conductor decay <conductor-decay>

The characters of $X_(cal(P))$ are indexed by $xi in bb(Q) \/ bb(Z)$ whose reduced denominator $q \( xi \)$ divides $product_(p in cal(P)) p$, with $q \( 0 \) = 1$. We write such a character as $e \( z xi \)$: it means $e \( n xi \)$ for any integer $n$ satisfying $n equiv z_p med \( mod med p \)$ for all $p in cal(P)$. This is well defined by the Chinese remainder theorem. The Fourier coefficient of $g$ is

$ hat(g) \( xi \) = bb(E)_(z in X_(cal(P))) g \( z \) e \( - z xi \) . $

For $U subset.eq cal(P)$, put $q_U = product_(p in U) p$, including $q_diameter = 1$. The exact prime support of a character is the set of primes at which it is nontrivial; its denominator is exactly the product of these primes.

Recall the exceptional mass and the normalized nonexceptional law,

$ eta_p = epsilon_p \( bb(F)_p^V \) \, #h(2em) mu_p^compose = frac(mu_p - epsilon_p, 1 - eta_p) . $

Proposition 5 gives $eta_p lt.eq p^(- 4) < 1$.

#thm([Lemma 4.3.])[
  (Conductor decay).  #emph[Let $cal(P)$ be a finite set of primes at least $P$, and at each prime choose $rho_p$ to be either $mu_p$ or $mu_p^compose$. Let $R gt.eq 1$, and let $g_w : X_(cal(P)) arrow.r bb(C)$, $w in V$, be functions. Suppose that for one slot $v$, $hat(g)_v \( xi \) = 0$ whenever $q \( xi \) lt.eq R$. Then 
#[#set math.equation(numbering: n => "(4.9)")
 $ lr(|integral product_(w in V) g_w \( z_w \) thin d #h(-0.16667em) ⨂_(p in cal(P)) rho_p \( z \)|) lt.eq R^(- gamma) parallel g_v parallel_2 product_(w eq.not v) parallel g_w parallel_(2 \( d - 1 \)) . $ <eq:conductor-decay>]

 All norms on the right use uniform probability measure on $X_(cal(P))$. The constant in the inequality is one.]
] <lem:conductor-decay>

#proof[
  Fix the distinguished slot $v$. For each $p$, let $Y_p = bb(F)_p^(V \\ { v })$, let $lambda_p$ be the marginal law of the other labels under $rho_p$, and define
  $ T_p f \( y \) = bb(E)_(rho_p) \[ f \( z_v \) divides \( z_w \)_(w eq.not v) = y \] . $
  This is an operator from $L^2 \( bb(F)_p \, upright("unif") \)$ to $L^2 \( Y_p \, lambda_p \)$; its values on marginal-null points are irrelevant. It preserves constants, and the tower property gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ T_p 1 = 1 \, #h(2em) integral T_p f thin d lambda_p = bb(E)_(x in bb(F)_p) f \( x \) . $ <eq:conditional-centering>]
  For uniform-mean-zero $f$, Lemma 10 gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ parallel T_p f parallel_(L^2 \( lambda_p \)) lt.eq p^(- gamma) parallel f parallel_(L^2 \( upright("unif") \)) . $ <eq:local-conductor-contraction>]
  Let $H_p^0$ be the mean-zero subspace of $L^2 \( bb(F)_p \, upright("unif") \)$, and let $K_p^0$ be the mean-zero subspace of $L^2 \( Y_p \, lambda_p \)$. Thus
  $ L^2 \( bb(F)_p \, upright("unif") \) = bb(C) 1 xor H_p^0 \, #h(2em) L^2 \( Y_p \, lambda_p \) = bb(C) 1 xor K_p^0 \, $
  with orthogonal sums. Equation (4.10) says that $T_p H_p^0 subset.eq K_p^0$. Notice that centering in the codomain refers to $lambda_p$, which need not be uniform.
  For $U subset.eq cal(P)$, let $H_U$ be the tensor subspace with factor $H_p^0$ when $p in U$ and factor $bb(C) 1$ otherwise; define $K_U$ in the same way using $K_p^0$. The $H_U$ form an orthogonal direct sum of $L^2 \( X_(cal(P)) \, upright("unif") \)$. Distinct $K_U \, K_W$ are also orthogonal: at a prime in the symmetric difference of $U \, W$, one tensor factor is constant and the other has mean zero. Inner products of pure tensors therefore vanish, and linearity gives the assertion for the whole subspaces.
  Under the product law $⨂_p rho_p$, the marginal of all the other labels is $lambda = ⨂_p lambda_p$. Conditional independence across primes shows that the operator from the distinguished slot to all other labels is
  $ T = ⨂_(p in cal(P)) T_p . $
  For completeness, on an input $product_p f_p \( z_(v \, p) \)$, the conditional expectation is $product_p T_p f_p$, since the conditional law is a product over primes. Such pure tensors span the finite-dimensional domain, proving the operator identity. Consequently
  #[#set math.equation(numbering: n => "(4.12)")
   $ T \( H_U \) subset.eq K_U \, #h(2em) parallel T \|_(H_U) parallel lt.eq product_(p in U) p^(- gamma) = q_U^(- gamma) . $ <eq:exact-support-contraction>]
  The norm bound follows by applying (4.11) one tensor factor at a time; on the constant factors the norm is one.
  Nontrivial characters at $p$ form an orthonormal basis for $H_p^0$. Thus $H_U$ consists precisely of Fourier sums with exact denominator $q_U$. Decompose the distinguished input as $g_v = sum_(q_U > R) g_(v \, U)$, with $g_(v \, U) in H_U$. The images of distinct summands are orthogonal by (4.12) and the orthogonality of the $K_U$. Hence
  $ parallel T g_v parallel_(L^2 \( lambda \))^2 & = sum_(q_U > R) parallel T g_(v \, U) parallel_(L^2 \( lambda \))^2\
 & lt.eq sum_(q_U > R) q_U^(- 2 gamma) parallel g_(v \, U) parallel_2^2 lt.eq R^(- 2 gamma) parallel g_v parallel_2^2 . $
  Only distinct exact supports need have orthogonal images; no such assertion is made for different characters within a single support.
  Finally condition the multilinear integral on all labels except those in slot $v$, and apply Cauchy–Schwarz. Its absolute value is at most
  $ R^(- gamma) parallel g_v parallel_2 ∥product_(w eq.not v) g_w \( z_w \)∥_(L^2 \( lambda \)) . $
  Hölder’s inequality with $d - 1$ factors and the uniform marginal in each remaining slot give
  $ ∥product_(w eq.not v) g_w \( z_w \)∥_(L^2 \( lambda \)) lt.eq product_(w eq.not v) (bb(E)_lambda \| g_w \( z_w \) \|^(2 \( d - 1 \)))^(1 \/ \( 2 \( d - 1 \) \)) = product_(w eq.not v) parallel g_w parallel_(2 \( d - 1 \)) . $
  This proves (4.9). If $cal(P)$ is empty, the support hypothesis forces $g_v = 0$, so the assertion holds there too. No reflection positivity of the laws $rho_p$ was used. ◻
]

== 5 Uniform moment bounds for Fourier lifts <sec:lift-moments>

We now transfer a bounded function on an integer interval to the product of its prime residue spaces. Keeping rational frequencies of bounded denominator need not preserve pointwise bounds or positivity. The replacement we require is a uniform bound for every fixed moment, valid also after retaining arbitrary complete denominator classes. We first control a square function of the exact prime supports, then recover the sum by symmetrization. For related arithmetic moment estimates and Fourier lifting, see #cite(label("BloomMaynard2022")) Theorem 2 of the arXiv version and #cite(label("GreenSawhney2025")) Section 3; the uniform estimate used here is proved below.

Let $cal(P)$ be a finite set of primes, and give

$ X_(cal(P)) = product_(p in cal(P)) bb(F)_p $

uniform probability measure. A character is indexed by $xi = sum_(p in cal(P)) a_p \/ p med \( mod med 1 \)$, where $a_p in { 0 \, dots.h \, p - 1 }$, and we write

$ e \( z xi \) = product_(p in cal(P)) e \( a_p z_p \/ p \) \, #h(2em) e \( t \) = exp \( 2 pi i t \) . $

Its exact prime support is ${ p : a_p eq.not 0 }$, and its reduced denominator is the product of these primes. In particular $q \( 0 \) = 1$. Summing a geometric progression in each coordinate shows that these characters form an orthonormal basis. For $U subset.eq cal(P)$, put $q_U = product_(p in U) p$, with $q_diameter = 1$.

Let $I$ be a nonempty consecutive interval of integers, of length $L$, and let $f : I arrow.r bb(C)$. Define

$ hat(f)_I \( xi \) = 1 / L sum_(n in I) f \( n \) e \( - n xi \) \, #h(2em) f_U \( z_U \) = sum_(q \( xi \) = q_U) hat(f)_I \( xi \) e \( z_U xi \) . $

For $Q gt.eq 1$, the Fourier lift is

$ cal(L)_(I \, cal(P) \, Q) f = sum_(U subset.eq cal(P)\
q_U lt.eq Q) f_U . $

If $cal(F)$ is a subfamily of these supports, write $cal(L)_(I \, cal(P) \, Q)^(cal(F)) f = sum_(U in cal(F)) f_U$. Thus retaining a support means retaining all frequencies of its exact denominator. Each $f_U$ depends only on $z_U$ and has mean zero in each coordinate belonging to $U$. Real $f$ gives real $f_U$, because the summation set is closed under negation.

#prodef([Remark 5.1.])[
  (A lift need not be nonnegative).  Take distinct primes $p \, q$ with $p \, q lt.eq Q < p q$ and $cal(P) = { p \, q }$. Let $I$ have length divisible by $p q$, and let $f$ be the indicator of the simultaneous congruences $n equiv a med \( mod med p \)$ and $n equiv b med \( mod med q \)$. The cutoff retains the supports $diameter \, { p } \, { q }$ and omits ${ p \, q }$. Since each residue pair occurs $\| I \| \/ \( p q \)$ times, summing these three components gives
  $ cal(L)_(I \, cal(P) \, Q) f \( z_p \, z_q \) = 1_(z_p = a) / q + 1_(z_q = b) / p - frac(1, p q) . $
  In particular, the lift equals $- 1 \/ \( p q \)$ when both coordinates miss the prescribed residues. This is why the multilinear estimates must allow signed inputs even when the original function is an indicator.
]

#thm([Lemma 5.2.])[
  (Uniform moments of Fourier lifts).  #emph[Let $Q gt.eq 1$, let $I$ have length $L gt.eq 10 Q^6$, and suppose $parallel f parallel_oo lt.eq M$. Let $cal(F)$ be any subfamily of ${ U subset.eq cal(P) : q_U lt.eq Q }$, and put 
$ k = max { \| U \| : U subset.eq cal(P) \, med q_U lt.eq Q } . $

 For every integer $r gt.eq 1$, define 
$ K_(2 r) = (frac(\( 2 r \) !, 2^r r !))^(1 \/ \( 2 r \)) \, #h(2em) A_r = 2 e K_(2 r) thin 2^(\( r + 3 \) \/ 4) . $

 Then 
#[#set math.equation(numbering: n => "(5.1)")
 $ ∥cal(L)_(I \, cal(P) \, Q)^(cal(F)) f∥_(2 r) lt.eq 2 M \( k + 1 \) A_r^k . $ <eq:lift-explicit-moment>]

 Consequently, for fixed $r$, this norm is at most $M Q^(o_r \( 1 \))$ as $Q arrow.r oo$, uniformly in $I \, f \, cal(P)$, and $cal(F)$.]
] <lem:lift-moments>

#proof[
  #emph[Conditional square-sum bound.] We establish a conditional square-sum bound before estimating moments. For every $B subset.eq cal(P)$ with $q_B lt.eq Q$, and every fixed value $z_B$, we claim that
  #[#set math.equation(numbering: n => "(5.2)")
   $ sum_(U in cal(F)\
U supset.eq B) bb(E) #scale(x: 120%, y: 120%)[\(] \| f_U \|^2 divides z_B #scale(x: 120%, y: 120%)[\)] lt.eq 4 M^2 4^(\| B \|) . $ <eq:lift-core-bound>]
  The conditional expectation here integrates the coordinates outside $B$; those outside $U$ are irrelevant to its summand.
  To compute its coefficients, write $U = B union.sq A$ and uniquely decompose a frequency on $U$ as $xi = xi_B + eta$, with exact supports $B$ and $A$, respectively. After fixing $z_B$, the coefficient of the outside character $e \( z_A eta \)$ is
  #[#set math.equation(numbering: n => "(5.3)")
   $ c_B \( eta \; z_B \) = 1 / L sum_(n in I) f \( n \) e \( - n eta \) product_(p in B) #scale(x: 120%, y: 120%)[\(] p 1_(n equiv z_p med \( p \)) - 1 #scale(x: 120%, y: 120%)[\)] . $ <eq:lift-core-coefficient>]
  Indeed, the sum over the nonzero frequencies at $p$ is
  $ sum_(a = 1)^(p - 1) e #scale(x: 120%, y: 120%)[\(] a \( z_p - n \) \/ p #scale(x: 120%, y: 120%)[\)] = p 1_(n equiv z_p med \( p \)) - 1 . $
  Let $Omega_B$ denote the union of the outside-frequency sets arising from $U in cal(F)$ with $U supset.eq B$. Different outside supports give disjoint frequency sets, and all their denominators are at most $Q \/ q_B$ and coprime to $q_B$. Conditional Parseval therefore identifies the left side of (5.2) with $sum_(eta in Omega_B) \| c_B \( eta \; z_B \) \|^2$.
  Expand the product in (5.3) by subsets $J subset.eq B$. Apart from its sign, the corresponding coefficient vector is
  #[#set math.equation(numbering: n => "(5.4)")
   $ c_J \( eta \) = q_J / L sum_(n in I\
n equiv z_J med \( q_J \)) f \( n \) e \( - n eta \) \, #h(2em) eta in Omega_B . $ <eq:lift-progression-coefficient>]
  The congruence in this expression is the simultaneous congruence at the primes of $J$, or equivalently its unique class modulo $q_J$. For $J = diameter$ it imposes no restriction.
  Write its progression as $n = a + q_J t$, where $t$ ranges over a consecutive interval $T$ of length $L_J$. Since $q_J lt.eq Q$ and $L gt.eq 10 Q^6$,
  $ \| L_J - L \/ q_J \| lt.eq 1 \, #h(2em) L_J gt.eq 0.9 L \/ q_J \, #h(2em) q_J L_J \/ L lt.eq 1.1 . $
  After removing the phase $e \( - a eta \)$, (5.4) is $q_J L_J \/ L$ times the normalized Fourier analysis of $t mapsto f \( a + q_J t \)$ at frequencies $q_J eta$.
  These frequencies remain distinct. In fact the denominator of $eta - eta'$ is coprime to $q_J$, so $q_J \( eta - eta' \) in bb(Z)$ implies $eta = eta' med \( mod med 1 \)$. Multiplication by $q_J$ also preserves each reduced outside denominator. Thus all the resulting frequencies have denominators at most $Q$, are pairwise separated in circle distance by at least $Q^(- 2)$, and number at most $sum_(q lt.eq Q) phi \( q \) lt.eq Q^2$, where $phi \( 1 \) = 1$ accounts for the zero frequency.
  This is a separated-frequency estimate of large-sieve type; compare #cite(label("MontgomeryVaughan1973")) Theorem 1. The length hypothesis permits the following elementary Gram-matrix bound. Consider the Gram matrix of these normalized exponential vectors in $L^2 \( T \)$. Its diagonal is 1. For distinct frequencies $theta \, theta'$, geometric summation gives
  $ lr(|1 / L_J sum_(t in T) e #scale(x: 120%, y: 120%)[\(] t \( theta - theta' \) #scale(x: 120%, y: 120%)[\)]|) lt.eq frac(1, 2 L_J parallel theta - theta' parallel_(bb(R) \/ bb(Z))) lt.eq frac(Q^2, 2 L_J) . $
  Its operator norm is at most its maximum absolute row sum, hence at most
  $ 1 + frac(Q^4, 2 L_J) lt.eq 1 + frac(Q^4 q_J, 1.8 L) lt.eq 1 + frac(1, 18 Q) lt.eq 19 / 18 . $
  The norm squared of the Fourier analysis map equals this Gram-matrix norm. Consequently
  $ (sum_(eta in Omega_B) \| c_J \( eta \) \|^2)^(1 \/ 2) lt.eq 1.1 sqrt(19 \/ 18) thin (1 / L_J sum_(t in T) \| f \( a + q_J t \) \|^2)^(1 \/ 2) lt.eq 2 M . $
  The Euclidean triangle inequality over the $2^(\| B \|)$ subsets $J$ proves (5.2).
  #emph[Square-function moments.] We next use this bound to control
  $ S \( z \) = (sum_(U in cal(F)) \| f_U \( z_U \) \|^2)^(1 \/ 2) . $
  Put $T_r = bb(E) S^(2 r)$ and $T_0 = 1$. Expand the first $r - 1$ factors in this moment and fix their supports $U_1 \, dots.h \, U_(r - 1)$. Their product depends only on coordinates in $W = U_1 union dots.h.c union U_(r - 1)$, and $\| W \| lt.eq \( r - 1 \) k$. For a last support $U$, let $B = U ∩ W$. Integrating outside $W$ gives exactly $bb(E) \( \| f_U \|^2 divides z_B \)$, because the coordinates of $f_U$ outside $B$ are fresh. For each fixed intersection $B$, its sum over $U ∩ W = B$ is bounded by (5.2). Only $B$ with $q_B lt.eq Q$ can occur, and there are at most $2^(\( r - 1 \) k)$ possible intersections. It follows that
  $ T_r lt.eq 4 M^2 4^k 2^(\( r - 1 \) k) T_(r - 1) . $
  Induction gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ T_r lt.eq \( 4 M^2 \)^r 4^(k r) 2^(k r \( r - 1 \) \/ 2) \, #h(2em) parallel S parallel_(2 r) lt.eq 2 M thin 2^(k \( r + 3 \) \/ 4) . $ <eq:lift-square-function>]
  This conditioning argument permits arbitrary overlaps among supports. The remaining task is to recover their sum from this square function.
  #emph[Recovering the sum.] Fix a size $j gt.eq 1$ and color the coordinates independently and uniformly with $j$ colors. A support is called transversal if it contains exactly one coordinate of each color. Each support of size $j$ is transversal with probability $pi_j = j ! \/ j^j$. Fix one coloring $c$, and let $cal(T)$ be its retained transversal supports in $cal(F)$.
  Take independent copies $X_p^0 \, X_p^1$ of every coordinate. Write $"swap"_p$ for interchanging that pair, and define
  $ D_U = product_(p in U) \( I - "swap"_p \) f_U \( X^0 \) . $
  Coordinatewise centering gives $bb(E)_(X^1) D_U = f_U \( X^0 \)$: in the expanded product, every term using at least one copied coordinate has zero conditional mean. Jensen’s inequality therefore gives
  $ ∥sum_(U in cal(T)) f_U∥_(2 r) lt.eq ∥sum_(U in cal(T)) D_U∥_(L^(2 r) \( X^0 \, X^1 \)) . $
  Swapping independent copies coordinate by coordinate is a standard symmetrization device; see #cite(label("DeLaPenaMontgomerySmith1995")) Section 4 of the arXiv version. Independently swapping each coordinate pair preserves their joint law and multiplies $D_U$ by the product of the associated signs. With independent random signs $\( epsilon.alt_p \)_(p in cal(P))$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ ∥sum_(U in cal(T)) D_U∥_(L^(2 r) \( X^0 \, X^1 \)) = ∥sum_(U in cal(T)) D_U product_(p in U) epsilon.alt_p∥_(L^(2 r) \( X^0 \, X^1 \, epsilon.alt \)) . $ <eq:lift-sign-symmetrization>]
  The signs here are indexed by individual coordinates, not merely by colors. Each monomial contains one coordinate sign from each color class.
  For completeness, the scalar random-sign bound with the constant $K_(2 r)$ above is
  #[#set math.equation(numbering: n => "(5.7)")
   $ ∥sum_i a_i epsilon.alt_i∥_(2 r) lt.eq K_(2 r) (sum_i \| a_i \|^2)^(1 \/ 2) . $ <eq:lift-scalar-khintchine>]
  For nonnegative coefficients $b_i$, expansion of the even moment retains only multiplicities $2 m_i$ with $sum_i m_i = r$. Since $\( 2 m \) ! gt.eq 2^m m !$, that moment is at most
  $ frac(\( 2 r \) !, 2^r) sum_(sum m_i = r) product_i frac(b_i^(2 m_i), m_i !) = frac(\( 2 r \) !, 2^r r !) (sum_i b_i^2)^r . $
  For complex $a_i$, expand $\( sum a_i epsilon.alt_i \)^r \( sum overline(a_i) epsilon.alt_i \)^r$ and take absolute values termwise; its surviving terms are bounded by the expansion with $b_i = \| a_i \|$. This proves (5.7) in the required generality.
  For fixed copies $X^0 \, X^1$, iterate (5.7) through the $j$ color classes. At each stage one uses Minkowski in $L^r$, in the form
  $ ∥(sum_i \| B_i \|^2)^(1 \/ 2)∥_(2 r) lt.eq (sum_i parallel B_i parallel_(2 r)^2)^(1 \/ 2) . $
  Induction on the number of color classes therefore gives
  $ ∥sum_(U in cal(T)) D_U product_(p in U) epsilon.alt_p∥_(L^(2 r) \( epsilon.alt \)) lt.eq K_(2 r)^j (sum_(U in cal(T)) \| D_U \|^2)^(1 \/ 2) . $
  To estimate this difference square function, index the choices of copies by $eta in { 0 \, 1 }^j$, one choice for each color. Since each $U in cal(T)$ has one coordinate of every color,
  $ D_U = sum_(eta in { 0 \, 1 }^j) \( - 1 \)^(\| eta \|) f_U #scale(x: 120%, y: 120%)[\(] \( X_p^(eta_(c \( p \))) \)_(p in U) #scale(x: 120%, y: 120%)[\)] . $
  For each fixed $eta$, the selected full coordinate vector has the original product law. Minkowski in $L^(2 r) \( ell^2 \( cal(T) \) \)$ consequently yields
  $ ∥(sum_(U in cal(T)) \| D_U \|^2)^(1 \/ 2)∥_(2 r) lt.eq 2^j ∥(sum_(U in cal(T)) \| f_U \|^2)^(1 \/ 2)∥_(2 r) lt.eq 2^j parallel S parallel_(2 r) . $
  Together with (5.6), this proves the transversal bound $\( 2 K_(2 r) \)^j parallel S parallel_(2 r)$.
  Average over colorings. Since every support is retained with probability $pi_j$, another application of Minkowski gives
  $ ∥sum_(U in cal(F)\
\| U \| = j) f_U∥_(2 r) lt.eq frac(j^j, j !) \( 2 K_(2 r) \)^j parallel S parallel_(2 r) lt.eq \( 2 e K_(2 r) \)^j parallel S parallel_(2 r) . $
  Here $j ! gt.eq \( j \/ e \)^j$, which also follows by integrating $log x$ from 1 to $j$. The term of size zero is constant and bounded in absolute value by $S$. Summing over $0 lt.eq j lt.eq k$ and using (5.5) proves (5.1).
  Finally, the product of $k$ distinct primes is at least $\( k + 1 \) !$, so $\( k + 1 \) ! lt.eq Q$. The bound $log \( k ! \) gt.eq k log k - k$ gives $k = O \( log Q \/ log log Q \)$. For fixed $r$, the logarithm of the right side of (5.1), after removing $M$, is therefore $o \( log Q \)$. Every bound used above was independent of the interval’s location, the ambient prime set, and the retained family. This proves the asserted uniformity. ◻
]

We record separately the cost of fixing residue coordinates. This cost is a power of the size of the fixed fiber, and must remain explicit when the moment bound is used in multilinear estimates.

#thm([Lemma 5.3.])[
  (Specialization of lifts).  #emph[Let $B subset.eq cal(P)$, let $z_B in X_B$, and let $G : X_(cal(P)) arrow.r bb(C)$. For every finite $p gt.eq 1$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ parallel G \( z_B \, dot.op \) parallel_(L^p \( X_(cal(P) \\ B) \)) lt.eq q_B^(1 \/ p) parallel G parallel_(L^p \( X_(cal(P)) \)) . $ <eq:lift-specialization>]

 In the setting of Lemma 15, this gives, for every fixed $z_B$, 
$ ∥#scale(x: 120%, y: 120%)[\(] cal(L)_(I \, cal(P) \, Q)^(cal(F)) f #scale(x: 120%, y: 120%)[\)] \( z_B \, dot.op \)∥_(2 r) lt.eq 2 M q_B^(1 \/ \( 2 r \)) \( k + 1 \) A_r^k . $

 The same bound holds for either part obtained by cutting the remaining denominator at any $H gt.eq 1$: before specialization these parts correspond to the whole-support families 
$ cal(F)_(lt.eq H \, B) = { U in cal(F) : q_(U \\ B) lt.eq H } \, #h(2em) cal(F)_(> H \, B) = { U in cal(F) : q_(U \\ B) > H } . $

 After specialization their Fourier supports lie, respectively, at remaining denominators at most $H$ and greater than $H$.]
] <lem:lift-specialization>

#proof[
  The specified fiber has uniform probability $1 \/ q_B$. Its contribution to $bb(E) \| G \|^p$ is
  $ q_B^(- 1) bb(E)_(z_(cal(P) \\ B)) \| G \( z_B \, z_(cal(P) \\ B) \) \|^p . $
  Discarding all other nonnegative contributions proves (5.8). Apply Lemma 15 to each displayed family. Every character of $f_U$, when specialized on $B$, retains exactly the coordinate support $U \\ B$. Combining such characters can cancel coefficients but cannot create frequencies outside the asserted remaining-denominator ranges. This proves the last assertion. ◻
]

In particular, for $d gt.eq 2$, a multilinear estimate using one $L^2$ norm and $d - 1$ norms in $L^(2 \( d - 1 \))$, with the same coordinates fixed in every slot, incurs the total specialization factor

$ q_B^(1 \/ 2) (q_B^(1 \/ \( 2 \( d - 1 \) \)))^(d - 1) = q_B . $

Two specialized $L^2$ factors likewise incur $q_B$. Multiplying the original bounded function by a fixed constant simply multiplies every norm bound by the absolute value of that constant.

For later uniform estimates one can make the subpower dependence entirely explicit. Put

$ k_(*) \( Q \) = max { j in bb(Z)_(gt.eq 0) : \( j + 1 \) ! lt.eq Q } \, #h(2em) frak(M)_r \( Q \) = 2 #scale(x: 120%, y: 120%)[\(] k_(*) \( Q \) + 1 #scale(x: 120%, y: 120%)[\)] A_r^(k_(*) \( Q \)) . $

The moment bound is at most $M frak(M)_r \( Q \)$, and for every fixed $r$ and $epsilon.alt > 0$, one has $frak(M)_r \( Q \) lt.eq Q^epsilon.alt$ for sufficiently large $Q$. The threshold may depend on $r \, epsilon.alt$, but on none of the intervals, functions, fibers, or retained families. Thus any fixed finite product of the envelopes $frak(M)_r \( Q \)$ remains subpower, even when their fixed moment orders are very large. The displayed input bounds and specialization powers remain explicit.

== 6 A signed kernel for actual square differences <sec:square-kernel>

The preceding tuple measures impose square-difference constraints in residue fields. This section supplies the passage to actual positive integer squares. We construct a signed measure supported on such squares and approximate its Fourier transform uniformly by a sum over small rational frequencies. Because every actual square shift vanishes between the supports under consideration, the signs of the measure cause no difficulty. The weighted square sums and major/minor-arc analysis have a direct antecedent in #cite(label("GreenSawhney2025")) Section 5. Here the signed divisor weight is chosen to match the strict-square pair law of our finite-field tuples.

For the remainder of the paper, fix

#[#set math.equation(numbering: n => "(6.1)")
 $ beta = 10^(- 5) . $ <eq:kernel-beta>]

Write $e \( t \) = exp \( 2 pi i t \)$, and let $q \( xi \)$ be the reduced denominator of $xi in bb(Q) \/ bb(Z)$, with $q \( 0 \) = 1$. For every rational frequency define the normalized unit quadratic sum

#[#set math.equation(numbering: n => "(6.2)")
 $ frak(g) \( xi \) = frac(1, phi \( q \( xi \) \)) sum_(m in \( bb(Z) \/ q \( xi \) bb(Z) \)^times) e \( xi m^2 \) \, #h(2em) frak(g) \( 0 \) = 1 . $ <eq:kernel-unit-gauss>]

Here $phi$ is Euler’s totient function. If $D = 8 d_0$ with $d_0$ odd and squarefree, call a residue modulo $D$ a #emph[strict square class] if it is $1$ modulo $8$ and a nonzero square modulo every prime dividing $d_0$.

#thm([Proposition 6.1.])[
  (Ordered square-kernel estimate).  #emph[Let $N gt.eq 1$ be an integer, put $H = N^(beta \/ 2)$, and let $D = 8 d_0 lt.eq N^beta$, where $d_0$ is odd and squarefree. Suppose $F \, J : \[ N \] arrow.r bb(C)$ satisfy $\| F \| \, \| J \| lt.eq 1$ and are supported in residue classes $a \, b$ modulo $D$, respectively. Assume that $b - a$ is a strict square class, that $x < y$ whenever $x in "supp" F$ and $y in "supp" J$, and that no such difference $y - x$ is the square of a positive integer. With 
$ hat(F) \( xi \) = 1 / N sum_(n = 1)^N F \( n \) e \( - n xi \) \, #h(2em) hat(J) \( xi \) = 1 / N sum_(n = 1)^N J \( n \) e \( - n xi \) \, $

 one has 
#[#set math.equation(numbering: n => "(6.3)")
 $ D lr(|sum_(xi in bb(Q) \/ bb(Z) : med q \( xi \) lt.eq H\
q \( xi \) med upright("squarefree") \, med \( q \( xi \) \, D \) = 1) frak(g) \( xi \) hat(F) \( - xi \) hat(J) \( xi \)|) lt.double H^(- 1 \/ 3) . $ <eq:kernel-conclusion>]

 The implied constant is absolute and is independent of all the data in the statement.]
] <prop:square-kernel>

#proof[
  Put $r = b - a$ modulo $D$, and denote the frequency set in (6.3) by $Xi$. We first define the model and actual-square kernels. We then compare their Fourier transforms on minor and major arcs, and finish with the exact bilinear Fourier identity.
  ===== 6.1 The two kernels. <the-two-kernels.>
  For every odd prime $p divides d_0$, choose one root $c_p$ of $r$ modulo $p$. The conditions $m equiv c_p med \( mod med p \)$ for all such primes, together with $m$ odd, specify one residue class modulo $D' = 2 d_0 = D \/ 4$. Let $rho_D$ be $D'$ times the indicator of this class. Thus $rho_D$ has periodic mean one and supremum $D'$. For every odd prime $p divides.not D$, set
  #[#set math.equation(numbering: n => "(6.4)")
   $ w_p \( m \) = frac(p upright(bold(1))_(p divides m) - 1, p - 1) = frac(1, p - 1) sum_(j = 1)^(p - 1) e \( j m \/ p \) \, #h(2em) w_u \( m \) = product_(p divides u) w_p \( m \) \, $ <eq:kernel-sieve-weight>]
  where $u$ is squarefree and coprime to $D$, and $w_1 = 1$. The second equality follows by summing all characters modulo $p$. In particular $\| w_u \| lt.eq 1$.
  The factor $1 - w_p \( m \) = p \( p - 1 \)^(- 1) 1_(p divides.not m)$ is the density of the uniform unit law modulo $p$ relative to the uniform law. Hence for any positive integer $q$ coprime to $D$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ sum_(u divides "rad" \( q \)) \( - 1 \)^(omega \( u \)) w_u \( m \) = product_(p divides q) \( 1 - w_p \( m \) \) = frac(q, phi \( q \)) 1_(\( m \, q \) = 1) . $ <eq:kernel-complete-sieve>]
  Here $omega \( u \)$ counts the distinct prime divisors of $u$, and $"rad" \( q \)$ is the product of the distinct primes dividing $q$. Thus the complete divisor sum converts a uniform residue into a uniform unit, whose square has Fourier multiplier $frak(g)$. We truncate this sum at $u lt.eq H$ in the actual-square kernel. At a rational frequency with denominator $q lt.eq H$ coprime to $D$, all divisors of $"rad" \( q \)$ remain present; the periodic mean of every term containing a prime outside $q$ vanishes. This will give the exact low-denominator comparison. The other rational coefficients will be bounded by quadratic Gauss sums.
  Define two finitely supported functions on $bb(Z)$ by
  #[#set math.equation(numbering: n => "(6.6)")
   $ k_0 \( n \) & = D / N upright(bold(1))_(1 lt.eq n lt.eq N) upright(bold(1))_(n equiv r med \( D \)) sum_(xi in Xi) frak(g) \( xi \) e \( - xi n \) \,\
k \( n \) & = sum_(1 lt.eq m lt.eq sqrt(N)) upright(bold(1))_(n = m^2) frac(2 m, N) rho_D \( m \) sum_(u lt.eq H med upright("squarefree")\
\( u \, D \) = 1) \( - 1 \)^(omega \( u \)) w_u \( m \) . $ <eq:kernel-model>]
  The first kernel represents the rational expression in the proposition; the second is supported on actual positive integer squares. The factor $2 m \/ N$ is the discrete counterpart of the substitution $d n = 2 m thin d m$, matching the uniform weight $1 \/ N$ in the model kernel. For these kernels use the positive-sign Fourier transforms
  $ S_0 \( alpha \) = sum_(n in bb(Z)) k_0 \( n \) e \( alpha n \) \, #h(2em) S \( alpha \) = sum_(n in bb(Z)) k \( n \) e \( alpha n \) \, #h(2em) alpha in bb(R) \/ bb(Z) . $
  Our immediate goal is
  #[#set math.equation(numbering: n => "(6.7)")
   $ sup_(alpha in bb(R) \/ bb(Z)) \| S \( alpha \) - S_0 \( alpha \) \| lt.double H^(- 1 \/ 3) . $ <eq:kernel-uniform-approximation>]
  Put $V_N \( t \) = N^(- 1) sum_(n = 1)^N e \( t n \)$. Expanding the congruence indicator in (6.6) gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ S_0 \( alpha \) = sum_(xi in Xi) sum_(j med mod med D) frak(g) \( xi \) e \( - j r \/ D \) V_N \( alpha - xi + j \/ D \) . $ <eq:kernel-model-centers>]
  There are at most $D H^2$ terms, each of coefficient modulus at most one, and their centers have denominators at most $D H$. The centers are distinct. Indeed, an equality $xi - j \/ D = xi' - j' \/ D$ would make $xi - xi'$ have denominator both coprime to $D$ and dividing $D$, so that $xi = xi'$ and $j = j'$ modulo $D$.
  Every $alpha_0 in bb(Q) \/ bb(Z)$ has a unique decomposition $alpha_0 = alpha_D + alpha_1$ in which the denominator of $alpha_D$ has only prime factors dividing $D$ and $q_1 = q \( alpha_1 \)$ is coprime to $D$. Thus the coefficient of the center $alpha_0$ in (6.8), taken to be zero when it is absent, is
  #[#set math.equation(numbering: n => "(6.9)")
   $ c_0 \( alpha_0 \) = cases(delim: "{", e \( alpha_D r \) frak(g) \( alpha_1 \) \, & q \( alpha_D \) divides D \, quad q_1 lt.eq H \, quad q_1 upright(" squarefree") \,, 0 \, & upright("otherwise") .) $ <eq:kernel-model-coefficient>]
  The sign is worth recording: in (6.8), $alpha_D = - j \/ D$, and its coefficient contains $e \( - j r \/ D \)$.
  ===== 6.2 Minor arcs. <minor-arcs.>
  We initially assume $N$ is sufficiently large by an absolute amount. Take the major arcs to be the closed balls of radius $2 N^(- 9 \/ 10)$ about all reduced rationals of denominator at most $N^(1 \/ 10)$. They are disjoint for sufficiently large $N$, since two distinct centers are at least $N^(- 1 \/ 5)$ apart. The minor arcs are their complement. We write $parallel t parallel$ for the distance of a real number $t$ to the nearest integer.
  For $alpha$ on the minor arcs, Dirichlet approximation with $Q_0 = floor.l N^(9 \/ 10) floor.r$ gives coprime integers $a \, q$ satisfying
  $ 1 lt.eq q lt.eq Q_0 \, #h(2em) \| alpha - a \/ q \| lt.eq frac(1, q Q_0) lt.eq 1 / q^2 \, $
  where the difference is represented by a real number of least absolute value. For completeness, partitioning the circle into $Q_0$ intervals and placing the $Q_0 + 1$ points $0 \, alpha \, dots.h \, Q_0 alpha$ in them gives integers $1 lt.eq h lt.eq Q_0$ and $b$ with $\| h alpha - b \| lt.eq Q_0^(- 1)$. Reducing $b \/ h$ to $a \/ q$ gives the displayed bounds. If $q lt.eq N^(1 \/ 10)$, the first approximation bound would put $alpha$ within $2 N^(- 9 \/ 10)$ of a major-arc center. Consequently
  #[#set math.equation(numbering: n => "(6.10)")
   $ N^(1 \/ 10) < q lt.eq N^(9 \/ 10) . $ <eq:kernel-minor-denominator>]
  Let $M = floor.l sqrt(N) floor.r$. Uniformly in real $theta$ and integers $1 lt.eq L lt.eq M$, differencing and a geometric sum give
  #[#set math.equation(numbering: n => "(6.11)")
   $ lr(|sum_(m = 1)^L e \( alpha m^2 + theta m \)|)^2 lt.double M + sum_(j = 1)^M min #scale(x: 120%, y: 120%)[\(] M \, parallel 2 alpha j parallel^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <eq:kernel-differencing>]
  Indeed, pairs at distance $j$ leave a linear phase with coefficient $2 alpha j$ in the inner sum. Its remaining factors, including $e \( theta j \)$, have modulus one. This also proves the asserted uniformity in the linear twist.
  Partition the $j$ indices into consecutive blocks of length $floor.l q \/ 4 floor.r$. Two distinct indices in a block differ by $0 < h < q \/ 4$. The residue $2 a h$ is nonzero modulo $q$: since $\( a \, q \) = 1$, its vanishing would force $q divides 2 h$, whereas $0 < 2 h < q \/ 2$. This argument includes even $q$. Hence
  $ parallel 2 alpha h parallel gt.eq parallel 2 a h \/ q parallel - 2 h \/ q^2 gt.eq frac(1, 2 q) . $
  In each block the points $2 alpha j$ are therefore separated on the circle by at least $1 \/ \( 2 q \)$. Ordering their distances to zero bounds the contribution of one block by $O \( M + q log \( 2 q \) \)$: only a bounded number can lie within distance $1 \/ q$ of zero, and the others contribute a harmonic sum. There are $O \( M \/ q + 1 \)$ blocks, so
  #[#set math.equation(numbering: n => "(6.12)")
   $ sum_(j = 1)^M min #scale(x: 120%, y: 120%)[\(] M \, parallel 2 alpha j parallel^(- 1) #scale(x: 120%, y: 120%)[\)] lt.double \( M \/ q + 1 \) #scale(x: 120%, y: 120%)[\(] M + q log \( 2 q \) #scale(x: 120%, y: 120%)[\)] . $ <eq:kernel-spacing-sum>]
  By (6.10), (6.11)–(6.12) imply
  $ sup_(theta in bb(R)) med max_(L lt.eq M) lr(|sum_(m = 1)^L e \( alpha m^2 + theta m \)|) lt.double N^(9 \/ 20) sqrt(log N) . $
  Partial summation with the weight $2 m \/ N$ gives
  #[#set math.equation(numbering: n => "(6.13)")
   $ sup_(theta in bb(R)) lr(|sum_(m lt.eq sqrt(N)) frac(2 m, N) e \( alpha m^2 + theta m \)|) lt.double N^(- 1 \/ 20) sqrt(log N) . $ <eq:kernel-minor-quadratic>]
  For a periodic function, use Fourier coefficients normalized by its period. The Fourier coefficient $ell^1$ norm of $rho_D$ is $D'$: its character expansion has $D'$ coefficients of modulus one. By (6.4), the corresponding norm of each $w_p$ is one, and that of $w_u$ is at most one by the convolution inequality. The entire periodic weight multiplying the quadratic phase in $S$ thus has Fourier coefficient $ell^1$ norm at most $D' floor.l H floor.r lt.eq D H$. Expansion into these characters and (6.13) yield
  #[#set math.equation(numbering: n => "(6.14)")
   $ \| S \( alpha \) \| lt.double D H N^(- 1 \/ 20) sqrt(log N) #h(2em) \( alpha upright(" on the minor arcs") \) . $ <eq:kernel-minor-actual>]
  Every center in (6.8) has denominator at most $D H lt.eq N^(3 beta \/ 2) < N^(1 \/ 10)$, so it is a major-arc center. On the minor arcs its distance from $alpha$ exceeds $2 N^(- 9 \/ 10)$. The elementary estimate
  $ \| V_N \( t \) \| lt.eq min #scale(x: 120%, y: 120%)[\(] 1 \, \( 2 N parallel t parallel \)^(- 1) #scale(x: 120%, y: 120%)[\)] $
  therefore gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ \| S_0 \( alpha \) \| lt.double D H^2 N^(- 1 \/ 10) #h(2em) \( alpha upright(" on the minor arcs") \) . $ <eq:kernel-minor-model>]
  ===== 6.3 Reduction on a major arc to periodic means. <reduction-on-a-major-arc-to-periodic-means.>
  Write $alpha = alpha_0 + y$, where $q = q \( alpha_0 \) lt.eq N^(1 \/ 10)$ and $\| y \| lt.eq 2 N^(- 9 \/ 10)$. If $alpha_c eq.not alpha_0$ is a center in (6.8), rational separation gives $parallel alpha_c - alpha_0 parallel gt.eq 1 \/ \( q D H \)$. Because $q D H lt.eq N^(1 \/ 10 + 3 beta \/ 2)$, for all sufficiently large $N$ we have $parallel alpha - alpha_c parallel gt.eq 1 \/ \( 2 q D H \)$. The contributions of these other centers sum to
  #[#set math.equation(numbering: n => "(6.16)")
   $ S_0 \( alpha \) = c_0 \( alpha_0 \) V_N \( y \) + O \( q D^2 H^3 \/ N \) . $ <eq:kernel-major-model>]
  For an admissible $u$, put
  $ a_u \( m \) = rho_D \( m \) w_u \( m \) e \( alpha_0 m^2 \) \, #h(2em) A_u = 1 / T_u sum_(m med mod med T_u) a_u \( m \) \, #h(2em) T_u = "lcm" \( q \, D' \, u \) . $
  The sequence $a_u$ has period $T_u lt.eq q D u$ and supremum at most $D$. Breaking a partial sum into complete periods and one remaining interval shows, for every real $t gt.eq 0$, that
  $ lr(|sum_(1 lt.eq m lt.eq t) a_u \( m \) - A_u t|) lt.double D T_u . $
  This includes the fractional part of $t$. For $f_y \( x \) = \( 2 x \/ N \) e \( y x^2 \)$ on $\[ 0 \, sqrt(N) \]$, direct differentiation gives
  $ \| f_y \( sqrt(N) \) \| + integral_0^(sqrt(N)) \| f'_y \( x \) \| thin d x lt.double frac(1 + \| y \| N, sqrt(N)) . $
  Stieltjes partial summation consequently gives
  $ sum_(m lt.eq sqrt(N)) frac(2 m, N) e \( y m^2 \) a_u \( m \) & = A_u integral_0^(sqrt(N)) frac(2 x, N) e \( y x^2 \) thin d x\
 & #h(5mm)  + O #h(-0.16667em) (frac(q D^2 u \( 1 + \| y \| N \), sqrt(N))) . $
  The integral equals $N^(- 1) integral_0^N e \( y t \) thin d t$. Comparing the integral to its integer Riemann sum bounds its difference from $V_N \( y \)$ by $O \( \( 1 + \| y \| N \) \/ N \)$. Since $\| A_u \| lt.eq D$, that error is dominated by the preceding displayed error. Summing over $u lt.eq H$ proves
  #[#set math.equation(numbering: n => "(6.17)")
   $ S \( alpha \) = c \( alpha_0 \) V_N \( y \) + O #h(-0.16667em) (frac(q D^2 H^2 \( 1 + \| y \| N \), sqrt(N))) \, #h(2em) c \( alpha_0 \) = sum_(u lt.eq H med upright("squarefree")\
\( u \, D \) = 1) \( - 1 \)^(omega \( u \)) A_u . $ <eq:kernel-major-actual>]
  The use of $sqrt(N)$ as a real endpoint in this calculation accounts for rounding, while the sum itself contains only integers $m$ with $m^2 lt.eq N$.
  We have reduced the major-arc comparison to $c \( alpha_0 \)$ and $c_0 \( alpha_0 \)$. We next compute the contribution at primes dividing $D$, and then the divisor sieve on the coprime denominator $q_1$.
  ===== 6.4 The prescribed roots, including the prime two. <the-prescribed-roots-including-the-prime-two.>
  At an odd prime $p divides D$, the local factor of $rho_D$ is $p upright(bold(1))_(m equiv c_p med \( p \))$. For every $j gt.eq 1$, squaring maps the lifts of $c_p$ modulo $p^j$ bijectively to the residues congruent to $r$ modulo $p$. Indeed, if $x$ is such a lift, then
  $ \( x + t p^k \)^2 equiv x^2 + 2 x t p^k med \( mod med p^(k + 1) \) \, $
  and $2 x$ is invertible modulo $p$. This proves the bijection inductively over $k$. For a primitive additive character $e \( a m^2 \/ p^j \)$, its expectation under this normalized root restriction is therefore $e \( a r \/ p \)$ if $j = 1$, and zero if $j gt.eq 2$: in the latter case one averages a nontrivial character over all the lifts of a single residue modulo $p$. If no $p$-part is present in the character, the expectation is one.
  At two the local factor of $rho_D$ is $2 upright(bold(1))_(m upright(" odd"))$. For $j lt.eq 3$, every odd square is $r$ modulo $2^j$, so the expectation of $e \( a m^2 \/ 2^j \)$ is $e \( a r \/ 2^j \)$. For $j gt.eq 3$, the kernel of the squaring homomorphism on $\( bb(Z) \/ 2^j bb(Z) \)^times$ has exactly four elements. To see this, if $\( x - 1 \) \( x + 1 \)$ is divisible by $2^j$, exactly one of these two consecutive even factors has 2-adic valuation one, and the other is divisible by $2^(j - 1)$. The four solutions modulo $2^j$ are $1 \, - 1 \, 1 + 2^(j - 1) \, - 1 + 2^(j - 1)$. The image of squaring thus has $2^(j - 3)$ elements. Every element of this image is $1$ modulo $8$, and this residue class also has $2^(j - 3)$ elements. The square of a uniform odd residue modulo $2^j$ is consequently uniform among all residues equal to $1$ modulo $8$. For $j > 3$, a primitive character averages to zero on that class.
  Apply these local facts to the decomposition $alpha_0 = alpha_D + alpha_1$ already used in (6.9). Chinese remaindering shows that the factor at primes dividing $D$ is
  #[#set math.equation(numbering: n => "(6.18)")
   $ bb(E)_m rho_D \( m \) e \( alpha_D m^2 \) = cases(delim: "{", e \( alpha_D r \) \, & q \( alpha_D \) divides D \,, 0 \, & q \( alpha_D \) divides.not D .) $ <eq:kernel-root-law>]
  The expectation here is the uniform average over any common period. The normalized odd-root restrictions, and the normalized oddness restriction at two, are precisely responsible for the factor $D$ in the model kernel. In particular, choosing only one odd root introduces no additional factor in (6.18).
  ===== 6.5 The coprime divisor sieve. <the-coprime-divisor-sieve.>
  Every prime of an admissible $u$ is coprime to $D$. If such a prime does not divide $q_1$, its mean-zero factor $w_p$ is independent of the exponential and all other factors by the Chinese remainder theorem. Thus $A_u = 0$ unless $u divides "rad" \( q_1 \)$.
  Suppose first that $q_1 lt.eq H$. All divisors of $"rad" \( q_1 \)$ then occur in the sum. By (6.5), the divisor weight is the density of the uniform unit law modulo $q_1$ relative to the uniform law. If $p^j$ exactly divides $q_1$ with $j gt.eq 2$, its local primitive unit quadratic average vanishes. Indeed, conditional on a unit $x$ modulo $p^(j - 1)$, the $p$ lifts $x + t p^(j - 1)$ have phase factors differing by $e \( 2 a t x \/ p \)$, where $p divides.not 2 a x$. Their sum is zero. If $q_1$ is squarefree, the unit average is exactly $frak(g) \( alpha_1 \)$. Together with (6.18), this proves
  #[#set math.equation(numbering: n => "(6.19)")
   $ c \( alpha_0 \) = c_0 \( alpha_0 \) #h(2em) \( q_1 lt.eq H \) . $ <eq:kernel-small-coefficient>]
  For $q_1 > H$ the model coefficient is zero, and we need a bound for the truncated divisor sum. We give the prime-power calculation explicitly. For an odd prime $p$, an integer $j gt.eq 1$, and $p divides.not a$, write
  $ G_j \( a \) = 1 / p^j sum_(m med mod med p^j) e \( a m^2 \/ p^j \) \, #h(2em) G_0 \( a \) = 1 . $
  Because two is invertible modulo $p^j$, the substitution $\( m \, n \) mapsto \( m - n \, m + n \)$ is a bijection. Consequently
  #[#set math.equation(numbering: n => "(6.20)")
   $ \| G_j \( a \) \|^2 = 1 / p^(2 j) sum_(u \, v med mod med p^j) e \( a u v \/ p^j \) = p^(- j) . $ <eq:kernel-prime-power-gauss>]
  Let $T_j = bb(E)_(m med mod med p^j) upright(bold(1))_(p divides m) e \( a m^2 \/ p^j \)$. For $j = 1$ one has $T_1 = 1 \/ p$; for $j gt.eq 2$, substituting $m = p t$ gives $T_j = p^(- 1) G_(j - 2) \( a \)$. It follows that
  #[#set math.equation(numbering: n => "(6.21)")
   $ B_j := bb(E)_(m med mod med p^j) w_p \( m \) e \( a m^2 \/ p^j \) = frac(p T_j - G_j \( a \), p - 1) \, #h(2em) \| B_j \| lt.eq 2 p^(- j \/ 2) . $ <eq:kernel-weighted-prime-power-gauss>]
  For $j gt.eq 2$, the last bound follows from $\( p + 1 \) \/ \( p - 1 \) lt.eq 2$ and (6.20). For $j = 1$, the bound obtained from the formula is $\( 1 + p^(- 1 \/ 2) \) \/ \( p - 1 \)$; its ratio to $p^(- 1 \/ 2)$ is $1 \/ \( sqrt(p) - 1 \) lt.eq 2$. Thus the exponent-one case is included.
  For a fixed divisor $u divides "rad" \( q_1 \)$, the coprime local mean is a product of factors from (6.20) and (6.21). Its modulus is at most $2^(omega \( u \)) q_1^(- 1 \/ 2)$. The factor at primes of $D$ has modulus at most one by (6.18). Dropping the restriction $u lt.eq H$ after taking absolute values therefore gives
  #[#set math.equation(numbering: n => "(6.22)")
   $ \| c \( alpha_0 \) \| lt.eq q_1^(- 1 \/ 2) sum_(u divides "rad" \( q_1 \)) 2^(omega \( u \)) = 3^(omega \( q_1 \)) q_1^(- 1 \/ 2) lt.double q_1^(- 1 \/ 3) lt.eq H^(- 1 \/ 3) . $ <eq:kernel-large-coefficient>]
  The penultimate implied constant is absolute. For example, one may use
  $ C_(*) = product_(p < 729\
p upright(" odd prime")) max \( 1 \, 3 p^(- 1 \/ 6) \) \, $
  since $3 lt.eq p^(1 \/ 6)$ for every prime $p gt.eq 729$. Repeated prime powers only increase $q_1^(1 \/ 6)$. This argument covers all prime powers in $q_1$, and if $q \( alpha_D \) divides.not D$, every coefficient under discussion is already zero by (6.18).
  ===== 6.6 Completion of the uniform comparison. <completion-of-the-uniform-comparison.>
  On the minor arcs, (6.14) and (6.15) apply. On a major arc, (6.16), (6.17), (6.19) and (6.22) apply, with $\| V_N \( y \) \| lt.eq 1$. For clarity, every approximation error is bounded here using the fixed value (6.1):
  $ D H N^(- 1 \/ 20) sqrt(log N) & lt.eq N^(- 0.049985) sqrt(log N) \,\
D H^2 N^(- 1 \/ 10) & lt.eq N^(- 0.09998) \,\
q D^2 H^3 \/ N & lt.eq N^(- 0.899965) \,\
frac(q D^2 H^2 \( 1 + \| y \| N \), sqrt(N)) & lt.eq 3 N^(- 0.29997) . $
  In the last two lines $q lt.eq N^(1 \/ 10)$ and $\| y \| lt.eq 2 N^(- 9 \/ 10)$. Each bound is $O \( N^(- beta \/ 6) \) = O \( H^(- 1 \/ 3) \)$ with an absolute constant. Together with the coefficient bound this proves (6.7) for all sufficiently large $N$. All size and separation thresholds used above are absolute. For the bounded remaining range, the elementary bounds $parallel S parallel_oo lt.double D H$ and $parallel S_0 parallel_oo lt.eq D H^2$ absorb that range by increasing the absolute constant. Thus (6.7) is uniform in all the data of the proposition.
  ===== 6.7 The directional bilinear identity. <the-directional-bilinear-identity.>
  It remains to pass from the Fourier comparison to the supports in the statement. Extend $F$ and $J$ by zero to $bb(Z)$. For any finitely supported kernel $h$ define
  $ cal(B)_h \( F \, J \) = 1 / N sum_(x in bb(Z)) sum_(n in bb(Z)) h \( n \) F \( x \) J \( x + n \) . $
  Both sums use counting measure; the displayed $1 \/ N$ normalizes only the base variable. Let
  $ tilde(F) \( alpha \) = sum_(x in bb(Z)) F \( x \) e \( - x alpha \) \, #h(2em) tilde(J) \( alpha \) = sum_(y in bb(Z)) J \( y \) e \( - y alpha \) \, #h(2em) S_h \( alpha \) = sum_(n in bb(Z)) h \( n \) e \( alpha n \) . $
  Expanding and integrating the characters imposes $y = x + n$, giving the bilinear identity
  $ cal(B)_h \( F \, J \) = 1 / N integral_0^1 S_h \( alpha \) tilde(F) \( - alpha \) tilde(J) \( alpha \) thin d alpha . $
  There are no conjugates in this identity. Cauchy–Schwarz and counting-measure Plancherel now give
  #[#set math.equation(numbering: n => "(6.23)")
   $ \| cal(B)_(k - k_0) \( F \, J \) \| & lt.eq frac(parallel S - S_0 parallel_oo, N) parallel F parallel_(ell^2 \( bb(Z) \)) parallel J parallel_(ell^2 \( bb(Z) \)) lt.double H^(- 1 \/ 3) \, $ <eq:kernel-plancherel-error>]
  because each of the last two norms is at most $sqrt(N)$.
  Every term in $cal(B)_k \( F \, J \)$ contains $F \( x \) J \( x + m^2 \)$ with $m gt.eq 1$, and this product is zero by hypothesis. Thus $cal(B)_k \( F \, J \) = 0$ term by term, regardless of the signed weights in (6.6). For a pair $x \, y$ with $F \( x \) J \( y \) eq.not 0$, the ordering assumption gives $1 lt.eq y - x lt.eq N - 1$, and the residue conditions give $y - x equiv r med \( mod med D \)$. Consequently both indicators in (6.6) are automatic for every contributing pair. Its expansion is exactly
  $ cal(B)_(k_0) \( F \, J \) & = D / N^2 sum_(x \, y in \[ N \]) F \( x \) J \( y \) sum_(xi in Xi) frak(g) \( xi \) e \( - xi \( y - x \) \)\
 & = D sum_(xi in Xi) frak(g) \( xi \) hat(F) \( - xi \) hat(J) \( xi \) . $
  Combining this with (6.23) proves (6.3). ◻
]

#prodef([Remark 6.2.])[
  The normalization for later interval restrictions follows directly from the proposition. Suppose $I_1 \, I_2 subset.eq \[ N \]$ are nonempty intervals with $max I_1 < min I_2$, and let $Xi$ be the frequency set in (6.3). Suppose $F_i$ is the indicator of the restriction of a square-difference-free set to $I_i$ and a class $a_i$ modulo $D$, where $a_2 - a_1$ is a strict square class. The coefficients
  $ c_i \( xi \) = frac(D, \| I_i \|) sum_(n in I_i) F_i \( n \) e \( - n xi \) = frac(D N, \| I_i \|) hat(F)_i \( xi \) $
  satisfy
  $ lr(|sum_(xi in Xi) frak(g) \( xi \) c_1 \( - xi \) c_2 \( xi \)|) lt.double H^(- 1 \/ 3) frac(D N^2, \| I_1 \| \| I_2 \|) . $
  This conclusion uses the integer supports of the restrictions; it requires no pointwise positivity of a Fourier lift.
] <rem:kernel-interval-normalization>

== 7 Comparison along square-step progressions <sec:scale-transfer>

We next compare the product-space functional with the same functional on shorter intervals. Fixing a few prime coordinates makes its low Fourier coefficients exact averages on a residue class. Splitting that class into progressions with square step preserves the forbidden integer differences and permits a change of scale. The comparison proved here uses no induction hypothesis. Restriction to square-step progressions is already a key feature of quantitative square-difference arguments; see the Main Lemma of #cite(label("PSS1988")) and #cite(label("GreenSawhney2025")) Lemma 6.2. Here it is used to compare the signed multilinear functional itself.

Keep the constants $gamma = 1 \/ 64$ and $beta = 10^(- 5)$ fixed as above. Enlarge the fixed prime threshold $P$, if necessary, so that the tuple measures are available for every prime $p gt.eq P$ and

#[#set math.equation(numbering: n => "(7.1)")
 $ product_(p gt.eq P\
p med upright("prime")) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 \, #h(2em) \| frak(g) \( xi \) \| lt.eq q \( xi \)^(- 1 \/ 3) $ <eq:prime-threshold-conditions>]

whenever $q \( xi \)$ is squarefree and all its prime factors are at least $P$. Such a choice is possible: the product converges, while the prime Gauss estimate used in Proposition 17 gives

$ lr(|frac(1, p - 1) sum_(x in bb(F)_p^times) e \( a x^2 \/ p \)|) lt.eq frac(sqrt(p) + 1, p - 1) = frac(1, sqrt(p) - 1) lt.eq p^(- 1 \/ 3) $

for all sufficiently large $p$ and all $a eq.not 0$ in $bb(F)_p$. Chinese remaindering then gives the second inequality in (7.1), including $q \( xi \) = 1$. Define the fixed integer

#[#set math.equation(numbering: n => "(7.2)")
 $ M_0 = 8 product_(3 lt.eq p < P\
p med upright("prime")) p . $ <eq:fixed-small-modulus>]

In particular $M_0 gt.eq 8$.

For every positive integer $N$, put

#[#set math.equation(numbering: n => "(7.3)")
 $ Q = N^beta \, #h(2em) H = N^(beta \/ 2) \, #h(2em) cal(P)_N = { p med upright("prime") : P lt.eq p lt.eq Q } \,\
tau = frac(beta gamma, 1000 \( d + 1 \)) \, #h(2em) sigma_0 = frac(gamma tau, 4) . $ <eq:scale-parameters>]

For a square-difference-free set $A subset.eq \[ N \]$, the quantity that will eventually be estimated by induction is

#[#set math.equation(numbering: n => "(7.4)")
 $ Y \( N \, A \) = Z_(cal(P)_N) #scale(x: 120%, y: 120%)[\(] cal(L)_(\[ N \] \, cal(P)_N \, Q) 1_A #scale(x: 120%, y: 120%)[\)] . $ <eq:induction-functional>]

It is nonnegative by Proposition 11. We also set

#[#set math.equation(numbering: n => "(7.5)")
 $ f_s \( n \) = M_0 thin 1_({ n equiv s med \( mod med M_0 \) }) 1_A \( n \) quad \( s in bb(Z) \/ M_0 bb(Z) \) \, #h(2em) 1_A = bb(E)_(s med mod med M_0) f_s . $ <eq:small-residue-input>]

The factor $M_0$ in this definition will be retained in the estimates. All constants below may depend on $P \, d \, beta \, gamma$ and the earlier fixed construction parameters.

#thm([Lemma 7.1.])[
  (Exact coefficients on a fiber).  #emph[Let $N gt.eq 1$, let $A subset.eq \[ N \]$, and define $f_s$ by (7.5). Let $I subset.eq \[ N \]$ be a nonempty interval, let $B subset.eq cal(P)_N$, and put 
$ q_B = product_(p in B) p \, #h(2em) cal(S) = cal(P)_N \\ B \, #h(2em) D = M_0 q_B . $

 Fix $s med mod med M_0$ and $z_B in X_B$, and let $a med mod med D$ be their combined residue class. If 
$ g_I = \( cal(L)_(I \, cal(P)_N \, Q) f_s \) \( z_B \, dot.op \) \, $

 then every character $xi$ on $X_(cal(S))$ satisfying $q \( xi \) q_B lt.eq Q$ has coefficient 
#[#set math.equation(numbering: n => "(7.6)")
 $ hat(g)_I \( xi \) = frac(D, \| I \|) sum_(n in I\
n equiv a med \( mod med D \)) 1_A \( n \) e \( - n xi \) . $ <eq:interval-fiber-coefficient>]

 Here $q_diameter = 1$, and the hat denotes the normalized Fourier coefficient on the remaining product space.]
] <lem:exact-fiber>

#proof[
  Write $chi_xi \( z \) = e \( z xi \)$ for a product-space character. Each original character has a unique decomposition $xi + eta$, where $xi$ is supported on $cal(S)$ and $eta$ on $B$. Their denominators are coprime, so $q \( xi + eta \) = q \( xi \) q \( eta \)$. The hypothesis ensures that every character $eta$ on $X_B$ is retained in the lift. Orthogonality over this entire character group gives
  $ hat(g)_I \( xi \) & = sum_(eta med upright("on") med X_B) frac(1, \| I \|) sum_(n in I) f_s \( n \) e \( - n \( xi + eta \) \) chi_eta \( z_B \)\
 & = frac(q_B, \| I \|) sum_(n in I\
n equiv z_p med \( mod med p \) med \( p in B \)) f_s \( n \) e \( - n xi \) . $
  Substituting (7.5) proves (7.6). ◻
]

#thm([Proposition 7.2.])[
  (Comparison with a shorter interval).  #emph[There are constants $C_(upright("tr")) < oo$ and $N_(upright("tr"))$ with the following property. Let $N gt.eq N_(upright("tr"))$, let $A subset.eq \[ N \]$ be square-difference-free, and let $B subset.eq cal(P)_N$ satisfy $q_B lt.eq N^tau$. Put 
$ cal(S) = cal(P)_N \\ B \, #h(2em) D = M_0 q_B \, #h(2em) N' = ceil.l N \/ D^2 ceil.r \, #h(2em) lambda = frac(D^2 N', N) . $

 For any $s med mod med M_0$ and $z_B in X_B$, define 
$ g = \( cal(L)_(\[ N \] \, cal(P)_N \, Q) f_s \) \( z_B \, dot.op \) . $

 Then $1 lt.eq N' < N$, and 
#[#set math.equation(numbering: n => "(7.7)")
 $ Z_(cal(S)) \( g \) lt.eq lambda^d max_(A' subset.eq \[ N' \]\
A' med upright("square") upright("-") d i f f e r e n c e upright("-") f r e e) Y \( N' \, A' \) + C_(upright("tr")) N^(- sigma_0) . $ <eq:scale-transfer-diagonal>]

 Moreover, for arbitrary choices $s_v med mod med M_0$ and $z_(B \, v) in X_B$, one for every $v in V$, the functions 
$ g_v = \( cal(L)_(\[ N \] \, cal(P)_N \, Q) f_(s_v) \) \( z_(B \, v) \, dot.op \) $

 satisfy 
#[#set math.equation(numbering: n => "(7.8)")
 $ \| cal(Z)_(cal(S)) \( \( g_v \)_(v in V) \) \| lt.eq lambda^d max_(A' subset.eq \[ N' \]\
A' med upright("square") upright("-") d i f f e r e n c e upright("-") f r e e) Y \( N' \, A' \) + C_(upright("tr")) N^(- sigma_0) . $ <eq:scale-transfer-mixed>]

 All constants are uniform in $N \, A \, B \, s \, z_B$ and the mixed specifications. Finally, 
#[#set math.equation(numbering: n => "(7.9)")
 $ 1 lt.eq lambda < 1 + D^2 / N \, #h(2em) lambda^d = 1 + O_d \( D^2 \/ N \) = 1 + O_(d \, M_0) \( N^(- 1 + 2 tau) \) . $ <eq:scale-transfer-factor>]

]
] <prop:scale-transfer>

#proof[
  We first record the parameter inequalities that make both lifts available. Since $tau < beta \/ 2$,
  $ H q_B lt.eq N^(beta \/ 2 + tau) lt.eq Q . $
  Also
  #[#set math.equation(numbering: n => "(7.10)")
   $ N' gt.eq N / D^2 gt.eq M_0^(- 2) N^(1 - 2 tau) . $ <eq:shorter-scale-lower-bound>]
  Because $1 \/ 2 - 2 tau > 0$, this lower bound is at least $N^(1 \/ 2)$ for sufficiently large $N$. As $D gt.eq 8$, we have $N' < N$ for every integer $N gt.eq 2$. Hence, with $Q' = \( N' \)^beta$,
  #[#set math.equation(numbering: n => "(7.11)")
   $ H lt.eq Q' lt.eq Q \, #h(2em) N gt.eq 10 Q^6 \, #h(2em) N' gt.eq 10 \( Q' \)^6 $ <eq:scale-transfer-cutoffs>]
  once $N$ is sufficiently large. The length conditions follow from $6 beta < 1$ and the uniform growth of $N'$ in (7.10).
  #emph[Removing large remaining conductors.] Split $g = g_(lt.eq H) + g_(> H)$ according to the denominator on the remaining prime coordinates $cal(S)$. Before specialization, these pieces retain exactly the denominator families
  $ { U subset.eq cal(P)_N : q_U lt.eq Q \, med q_(U \\ B) lt.eq H } \, #h(2em) { U subset.eq cal(P)_N : q_U lt.eq Q \, med q_(U \\ B) > H } . $
  Thus Lemma 15 applies to both pieces. For a function $u$ on $X_B times X_(cal(S))$, uniform counting gives the specialization bound
  $ parallel u \( z_B \, dot.op \) parallel_r lt.eq q_B^(1 \/ r) parallel u parallel_r #h(2em) \( r gt.eq 1 \) \; $
  this is also the estimate in Lemma 16. Since $\| f_s \| lt.eq M_0$, it follows that, for $g_(*) in { g \, g_(lt.eq H) \, g_(> H) }$ and every fixed even $r$,
  #[#set math.equation(numbering: n => "(7.12)")
   $ parallel g_(*) parallel_r lt.eq M_0 q_B^(1 \/ r) N^(o \( 1 \)) . $ <eq:specialized-lift-moments>]
  All subpower bounds in this proof are uniform over the indicated sets and fibers.
  Telescope the $d$ inputs in the diagonal integral from $g$ to $g_(lt.eq H)$. Each difference has one input $g_(> H)$. Lemma 13 and (7.12) imply, for every fixed $epsilon > 0$,
  #[#set math.equation(numbering: n => "(7.13)")
   $ \| Z_(cal(S)) \( g \) - Z_(cal(S)) \( g_(lt.eq H) \) \| lt.eq C_epsilon H^(- gamma) q_B N^epsilon . $ <eq:scale-transfer-first-error>]
  Indeed the specialization powers in that lemma add to
  $ 1 / 2 + frac(d - 1, 2 \( d - 1 \)) = 1 . $
  The factors $d$ and $M_0^d$ are fixed and are included in $C_epsilon$. Applying the moment lemma with sufficiently small individual exponents makes the aggregate moment loss at most $N^epsilon$.
  #emph[Splitting the exact fiber into square-step progressions.] Let $a med mod med D$ combine $s$ and $z_B$. By Lemma 19, for every remaining $xi$ with $q \( xi \) lt.eq H$,
  #[#set math.equation(numbering: n => "(7.14)")
   $ hat(g) \( xi \) = D / N sum_(n lt.eq N\
n equiv a med \( mod med D \)) 1_A \( n \) e \( - n xi \) . $ <eq:scale-transfer-fiber>]
  Let
  $ J_a = { j in \[ D^2 \] : j equiv a med \( mod med D \) } \, #h(2em) c_j = j - D^2 \,\
A'_j = { n' in \[ N' \] : D^2 n' + c_j in A } . $
  There are exactly $D$ elements of $J_a$. The map $\( n' \, j \) mapsto D^2 \( n' - 1 \) + j$ bijects $\[ N' \] times \[ D^2 \]$ with $\[ D^2 N' \]$. Restricting $j$ to $J_a$ selects exactly the residue class $a med mod med D$. The definition of $A'_j$ assigns zero to all padded points greater than $N$, so this decomposition incurs no additive error.
  Each $A'_j$ is square-difference-free: a difference $m^2 > 0$ between its elements would give the difference $D^2 m^2 = \( D m \)^2$ between the corresponding elements of $A$. This argument concerns actual integer squares.
  For $p in cal(S)$, the integer $D$ is invertible modulo $p$. Define
  $ T_j \( z \)_p = D^(- 2) \( z_p - c_j \) med \( mod med p \) \, #h(2em) h_j^H = cal(L)_(\[ N' \] \, cal(S) \, H) 1_(A'_j) . $
  Each $T_j$ is a translation followed by multiplication by the nonzero square $\( D^(- 1) \)^2$. Multiplication of a remaining frequency by $D^2$ preserves its exact denominator, so changing variables $eta = D^2 xi$ in the Fourier expansion of (7.14) gives the exact identity
  #[#set math.equation(numbering: n => "(7.15)")
   $ g_(lt.eq H) \( z \) = lambda / D sum_(j in J_a) h_j^H \( T_j \( z \) \) . $ <eq:scale-transfer-affine-average>]
  For clarity, the coefficient of $e \( z xi \)$ on the right is
  $ frac(D N', N) sum_(j in J_a) e \( - c_j xi \) (1 / N' sum_(n' lt.eq N') 1_(A'_j) \( n' \) e \( - D^2 n' xi \)) \, $
  which is exactly (7.14).
  The seminorm triangle inequality and affine invariance in Lemma 12 now imply
  $ Z_(cal(S)) \( g_(lt.eq H) \)^(1 \/ d) lt.eq lambda / D sum_(j in J_a) Z_(cal(S)) \( h_j^H \)^(1 \/ d) lt.eq lambda max_(j in J_a) Z_(cal(S)) \( h_j^H \)^(1 \/ d) . $
  Consequently,
  #[#set math.equation(numbering: n => "(7.16)")
   $ Z_(cal(S)) \( g_(lt.eq H) \) lt.eq lambda^d max_(j in J_a) Z_(cal(S)) \( h_j^H \) . $ <eq:scale-transfer-progressions>]
  The averaging by $D$ is essential: the number of progressions causes no further loss.
  #emph[Recovering the smaller-scale functional.] Set
  $ h_j^(Q') = cal(L)_(\[ N' \] \, cal(S) \, Q') 1_(A'_j) . $
  The difference $h_j^(Q') - h_j^H$ has conductor greater than $H$. By (7.11), the moment lemma applies at scale $N'$ to these lifts and their pieces. A second telescoping application of Lemma 13, this time without specialization, gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ \| Z_(cal(S)) \( h_j^H \) - Z_(cal(S)) \( h_j^(Q') \) \| lt.eq C_epsilon H^(- gamma) \( N' \)^epsilon $ <eq:scale-transfer-second-error>]
  uniformly in $j$.
  The lift $h_j^(Q')$ depends only on coordinates in $cal(S)' = cal(P)_(N') \\ B$, because every prime in a denominator at most $Q'$ is itself at most $Q'$. On the other hand, the full lift
  $ u'_j = cal(L)_(\[ N' \] \, cal(P)_(N') \, Q') 1_(A'_j) $
  becomes exactly $h_j^(Q')$ after uniform averaging over $B ∩ cal(P)_(N')$. Character orthogonality removes precisely the denominators containing one of those primes. By Lemma 12, coordinate averaging contracts the seminorm; unused probability factors integrate to one. Therefore
  #[#set math.equation(numbering: n => "(7.18)")
   $ Z_(cal(S)) \( h_j^(Q') \) = Z_(cal(S)') \( h_j^(Q') \) lt.eq Z_(cal(P)_(N')) \( u'_j \) = Y \( N' \, A'_j \) . $ <eq:scale-transfer-projection>]
  This also covers primes of $B$ larger than $Q'$, which are absent from $cal(P)_(N')$ already.
  Combining (7.13), (7.16), (7.17), and (7.18) proves (7.7) with error
  #[#set math.equation(numbering: n => "(7.19)")
   $ C_epsilon (H^(- gamma) q_B N^epsilon + lambda^d H^(- gamma) \( N' \)^epsilon) . $ <eq:scale-transfer-explicit-error>]
  #emph[Uniform error bounds and mixed inputs.] The definition of $N'$ gives $1 lt.eq lambda < 1 + D^2 \/ N$, and
  $ D^2 \/ N lt.eq M_0^2 N^(- 1 + 2 tau) = o \( 1 \) . $
  Since $d$ is fixed, these inequalities prove (7.9) and show that $lambda^d$ is bounded for large $N$. Choose $epsilon = beta gamma \/ 8$ in (7.19). Its two terms, before the bounded factor $lambda^d$, are at most
  $ N^(- 3 beta gamma \/ 8 + tau) quad upright("and") quad N^(- 3 beta gamma \/ 8) \, $
  respectively. As $tau lt.eq beta gamma \/ 1000$ and $sigma_0 = gamma tau \/ 4 lt.eq tau \/ 4$, they are $O \( N^(- sigma_0) \)$. This establishes the diagonal bound with constants independent of any inductive estimate for $Y$.
  Every $g_v$ in the mixed statement is real and satisfies the same diagonal bound. Its right-hand side is nonnegative and independent of $v$. Proposition 11 therefore gives (7.8). ◻
]

In particular, the mixed estimate holds pointwise after specifying all labels at primes in $B$, regardless of the law used to choose those labels. It can therefore be integrated against any such probability law. When the prime laws form a product, the remaining coordinates still carry the full laws used in Proposition 20. No reflection positivity is required of the law on the specified labels.

== 8 Contraction on ordered intervals <sec:ordered-contraction>

A tuple of residue classes $bold(s) = \( s_v \)_(v in V) in \( bb(Z) \/ M_0 bb(Z) \)^V$ is called #emph[good] if

$ s_(v_(j + 1)) - s_(v_j) quad upright("is a strict square class modulo ") M_0 #h(2em) \( 0 lt.eq j < 24 \) \, $

where $v_24 = v_0$. Thus each difference is $1$ modulo $8$ and a nonzero square at every odd prime dividing $M_0$. Let

#[#set math.equation(numbering: n => "(8.1)")
 $ rho = M_0^(- d) \| { bold(s) in \( bb(Z) \/ M_0 bb(Z) \)^V : bold(s) upright(" is good") } #scale(x: 120%, y: 120%)[\|] . $ <eq:good-residue-proportion>]

We will bound the contribution of each good tuple when every prime uses the nonexceptional part of its measure. First we show that these assignments have a fixed positive proportion; the proof also explains the cycle length $24$. We retain the parameters and lifts from the preceding section.

#thm([Lemma 8.1.])[
  (Existence of good residue assignments).  #emph[The proportion $rho$ defined in (8.1) satisfies 
$ rho gt.eq M_0^(- 23) > 0 . $

]
] <lem:good-residues>

#proof[
  We construct a length-$24$ sequence of admissible increments with sum zero at each factor of $M_0$. Modulo $8$, take all the increments equal to $1$; their sum is $24 equiv 0 med \( mod med 8 \)$.
  Let $p < P$ be an odd prime. If $- 1$ is a square modulo $p$, repeat the pair $\( 1 \, - 1 \)$ twelve times. Both entries are nonzero squares and each pair has sum zero. If $- 1$ is not a square, put
  $ S = { x^2 : x in bb(F)_p } . $
  The sets $S$ and $- 1 - S$ each have $\( p + 1 \) \/ 2$ elements, so they intersect. Thus $- 1 = a + b$ for some $a \, b in S$. Neither $a$ nor $b$ is zero, since otherwise $- 1$ would be a square. The triple $\( a \, b \, 1 \)$ consists of nonzero squares and has sum zero. Repeat this triple eight times. This also covers $p = 3$, where the triple is $\( 1 \, 1 \, 1 \)$.
  The Chinese remainder theorem now gives increments $Delta_0 \, dots.h \, Delta_23 med \( mod med M_0 \)$, each a strict square class, with $sum_(j = 0)^23 Delta_j = 0$. For each initial residue $a med \( mod med M_0 \)$, prescribe
  $ s_(v_0) = a \, #h(2em) s_(v_j) = a + sum_(i = 0)^(j - 1) Delta_i quad \( 1 lt.eq j < 24 \) . $
  The last edge has increment $Delta_23$ because the sum of all the increments is zero. The slots $v_0 \, dots.h \, v_23$ are distinct, since their block words are the distinct cyclic shifts of the identity word. Repetition of residue values at nonadjacent slots causes no difficulty. The other $d - 24$ residues are unrestricted. We have therefore exhibited at least $M_0 dot.op M_0^(d - 24)$ good assignments among the $M_0^d$ possible assignments, which proves the bound. ◻
]

The length $24$ is divisible by $8$, $2$, and $3$, exactly the three local cycle lengths used in this construction. Thus this choice works uniformly for every prime included in the fixed modulus.

We now prove the analytic estimate for each good assignment.

#thm([Proposition 8.2.])[
  (Contraction for good residue assignments).  #emph[There are absolute constants $C$ and $N_0$ such that, whenever $N gt.eq N_0$, $A subset.eq \[ N \]$ has no positive square difference, and $bold(s)$ is good, one has 
#[#set math.equation(numbering: n => "(8.2)")
 $ lr(|integral product_(v in V) cal(L)_(\[ N \] \, cal(P)_N \, Q) f_(s_v) \( z_v \) thin d ⨂_(p in cal(P)_N) \( mu_p - epsilon_p \)|) lt.eq C N^(- sigma_0) . $ <eq:nonexceptional-contraction>]

 The constants are uniform in $A$ and $bold(s)$.]
] <prop:nonexceptional-contraction>

#proof[
  Write $eta_p$ for the total mass of $epsilon_p$, and set
  $ mu_p^compose = frac(mu_p - epsilon_p, 1 - eta_p) \, #h(2em) Lambda^compose = ⨂_(p in cal(P)_N) mu_p^compose . $
  It suffices to prove the assertion with $Lambda^compose$ in place of the measure in (8.2), since the latter is $product_p \( 1 - eta_p \) Lambda^compose$ and $0 lt.eq product_p \( 1 - eta_p \) lt.eq 1$. The single-slot marginals of $Lambda^compose$ are uniform. Moreover, at each prime its marginal on any directed cycle edge is uniform on strict square pairs. We use conductor decay for $Lambda^compose$, without any claim that this normalized measure is reflection positive.
  #emph[Selecting an ordered pair.] Put $K = floor.l N^tau floor.r$, and partition $\[ N \]$ into ordered consecutive intervals $I_1 \, dots.h \, I_K$ of sizes differing by at most one. Writing $w_i = \| I_i \| \/ N$, we have the exact identity
  $ cal(L)_(\[ N \] \, cal(P)_N \, Q) f_s = sum_(i = 1)^K w_i cal(L)_(I_i \, cal(P)_N \, Q) f_s . $
  Thus the integral is an average over independent interval choices in all slots, with probabilities $w_i$. For large $N$, every interval has length at least $1 / 2 N^(1 - tau)$. Since $1 - tau > 6 beta$, this length is at least $10 Q^6$. Lemma 15 therefore applies uniformly to every interval lift and every exact-denominator truncation used below. Its application to $f_s$, which is bounded by the fixed constant $M_0$, changes only the constants. All occurrences of $N^(o \( 1 \))$ in this proof are uniform over these interval choices, residues and sets.
  First consider assignments for which all 24 cycle slots choose the same interval. Their total probability is
  $ sum_(i = 1)^K w_i^24 lt.eq \( max_i w_i \)^23 lt.double N^(- 23 tau) . $
  For every assignment, ordinary Hölder and the uniform single-slot marginals give
  $ lr(|integral product_v G_v \( z_v \) thin d Lambda^compose|) lt.eq product_v parallel G_v parallel_d = N^(o \( 1 \)) \, #h(2em) G_v = cal(L)_(I \( v \) \, cal(P)_N \, Q) f_(s_v) . $
  Here $d$ is even, so the required moment is supplied directly by Lemma 15. The contribution of these assignments is therefore $O \( N^(- 23 tau + o \( 1 \)) \)$; there is no restriction on the interval choices in the other slots.
  In every remaining assignment there is a directed cycle edge $u arrow.r v$ whose first interval precedes its second. Indeed, if the cyclic sequence of interval indices had no ascent, it would be nonincreasing all the way around the cycle, and hence constant. Fix one ascending edge, and denote its two intervals by $I_1 \, I_2$ for the rest of this argument. All integers in $I_1$ precede all integers in $I_2$.
  #emph[Eliminating the other slots.] Retain these two lifts in full. In each of the other $d - 2$ slots, truncate the lift to exact conductors at most $T = N^tau$. Lemma 13, applied during a telescoping replacement of these slots, bounds the total error by
  #[#set math.equation(numbering: n => "(8.3)")
   $ O \( T^(- gamma) N^(o \( 1 \)) \) = O \( N^(- gamma tau + o \( 1 \)) \) . $ <eq:interval-truncation-error>]
  Every norm used here is controlled by Lemma 15: the retained and discarded pieces are subfamilies of complete exact denominator pieces. This error is estimated before the Fourier expansion that follows.
  Each Fourier coefficient in a truncated slot has modulus at most $M_0$, and there are at most $sum_(q lt.eq T) phi \( q \) lt.double T^2$ frequencies. The product expansion of all other slots consequently has total coefficient absolute sum at most
  #[#set math.equation(numbering: n => "(8.4)")
   $ C_(d \, M_0) T^(2 \( d - 2 \)) lt.double N^(2 d tau) . $ <eq:interval-fourier-cost>]
  For one term in this expansion, let $B subset.eq cal(P)_N$ be the union of the prime supports of its characters, and put
  $ R = product_(p in B) p . $
  The conductors are squarefree, so their least common multiple satisfies
  #[#set math.equation(numbering: n => "(8.5)")
   $ R lt.eq T^(d - 2) lt.eq N^(d tau) . $ <eq:interval-mode-modulus>]
  Condition on all slot labels at the primes in $B$. The expanded characters become constants of modulus one. Since $Lambda^compose$ is a product over primes, the tuple laws at the remaining primes are unchanged and independent. The two selected labels now have fixed coordinates $a_(1 \, B) \, a_(2 \, B)$ at $B$, whose difference is a nonzero square at each prime in $B$. At every remaining prime their pair marginal is still uniform on strict square pairs.
  Let $cal(S) = cal(P)_N \\ B$, let $s_1 = s_u$ and $s_2 = s_v$, and define functions on $X_(cal(S))$ by
  $ g_i \( z \) = #scale(x: 120%, y: 120%)[\(] cal(L)_(I_i \, cal(P)_N \, Q) f_(s_i) #scale(x: 120%, y: 120%)[\)] \( a_(i \, B) \, z \) \, #h(2em) i = 1 \, 2 . $
  With Fourier coefficients normalized for uniform measure on $X_(cal(S))$, their conditional pair integral is exactly
  #[#set math.equation(numbering: n => "(8.6)")
   $ sum_(xi upright(" on ") X_(cal(S))) hat(g)_1 \( - xi \) hat(g)_2 \( xi \) frak(g) \( xi \) . $ <eq:interval-pair-fourier>]
  To see this, simultaneous translation kills character pairs whose frequencies do not sum to zero. For a matching pair, the multiplier is the character average of the difference of the labels. At every odd prime a uniform nonzero square is the square of a uniform nonzero unit. The Chinese remainder theorem therefore identifies this average with the unit-square multiplier $frak(g) \( xi \)$ used in Proposition 17.
  #emph[Estimating the selected pair.] Specialization on a uniform coordinate block of size $R$ costs at most $R^(1 \/ 2)$ in $L^2$: for every function $G$,
  $ parallel G \( a_B \, dot.op \) parallel_2^2 lt.eq R parallel G parallel_2^2 . $
  This inequality holds at every specified fiber, independently of the law under which that fiber was selected. Hence $parallel g_i parallel_2 lt.eq R^(1 \/ 2) N^(o \( 1 \))$. By the bound $\| frak(g) \( xi \) \| lt.eq q \( xi \)^(- 1 \/ 3)$, Parseval and Cauchy–Schwarz, the part of (8.6) with conductor exceeding $H$ has modulus at most
  #[#set math.equation(numbering: n => "(8.7)")
   $ H^(- 1 \/ 3) parallel g_1 parallel_2 parallel g_2 parallel_2 lt.eq H^(- 1 \/ 3) R N^(o \( 1 \)) . $ <eq:interval-pair-tail>]
  We next identify the remaining coefficients with actual integer fibers. Put $D = M_0 R$. The parameter inequalities
  #[#set math.equation(numbering: n => "(8.8)")
   $ d tau < frac(beta gamma, 1000) < beta / 2 $ <eq:interval-parameter-room>]
  imply $R H lt.eq Q$ and, for sufficiently large $N$, $D lt.eq N^beta$. For a remaining frequency $xi$ with $q \( xi \) lt.eq H$, all frequencies $xi + eta$, where $eta$ ranges over the character group on $B$, therefore occur in the original lift. Summing this entire character group gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ hat(g)_i \( xi \) & = sum_(eta upright(" on ") B) frac(1, \| I_i \|) sum_(n in I_i) f_(s_i) \( n \) e \( - n \( xi + eta \) \) e \( a_(i \, B) eta \)\
 & = frac(D, \| I_i \|) sum_(n in I_i\
n equiv a_i med \( mod med D \)) 1_A \( n \) e \( - n xi \) \, $ <eq:interval-selected-fiber>]
  where $a_i med \( mod med D \)$ combines $s_i med \( mod med M_0 \)$ and the coordinates $a_(i \, B)$ by the Chinese remainder theorem. Character orthogonality supplies the factor $R$, while the definition of $f_(s_i)$ supplies $M_0$. Goodness of $bold(s)$ and the constraints at the conditioned primes show that $a_2 - a_1$ is a strict square class modulo $D$.
  The remaining frequencies of conductor at most $H$ are precisely the frequencies with squarefree conductor at most $H$ coprime to $D$. Indeed, $D$ contains every prime less than $P$; every prime divisor of such a conductor is consequently an available prime at least $P$, at most $H lt.eq Q$, and outside $B$. This includes the zero frequency under the convention $q \( 0 \) = 1$.
  Define functions on $\[ N \]$ by
  $ F_i \( n \) = 1_A \( n \) 1_(I_i) \( n \) 1_(n equiv a_i med \( mod med D \)) . $
  They are bounded by one, their supports are ordered, and there is no positive square difference from the first support to the second. Moreover, $D$ is eight times an odd squarefree number and $D lt.eq N^beta$. All hypotheses of Proposition 17 hold. If the Fourier coefficients of $F_i$ use normalization $N^(- 1)$, then (8.9) gives $hat(g)_i \( xi \) = D N hat(F)_i \( xi \) \/ \| I_i \|$. Thus the part of (8.6) of conductor at most $H$ is bounded in modulus by
  #[#set math.equation(numbering: n => "(8.10)")
   $ & frac(D^2 N^2, \| I_1 \| \| I_2 \|) lr(|sum_(q \( xi \) lt.eq H \, med q \( xi \) upright(" squarefree")\
\( q \( xi \) \, D \) = 1) frak(g) \( xi \) hat(F)_1 \( - xi \) hat(F)_2 \( xi \)|)\
 & #h(2cm)  lt.double H^(- 1 \/ 3) D frac(N^2, \| I_1 \| \| I_2 \|) lt.double H^(- 1 \/ 3) D N^(2 tau) . $ <eq:interval-kernel-cost>]
  The factor $D$ in Proposition 17 has canceled one of the two fiber-normalization factors.
  Combining (8.7) and (8.10) bounds each conditional pair integral by $O \( N^(- beta \/ 6 + \( d + 2 \) tau + o \( 1 \)) \)$. This is uniform over all conditionings of positive probability. Averaging them, and then summing the Fourier expansion using (8.4), bounds the truncated integral for each unequal-cycle interval assignment by
  $ O #scale(x: 120%, y: 120%)[\(] N^(- beta \/ 6 + \( 3 d + 2 \) tau + o \( 1 \)) #scale(x: 120%, y: 120%)[\)] . $
  Averaging interval assignments incurs no further loss. Including the equal-cycle contribution and (8.3), the original integral has modulus at most
  #[#set math.equation(numbering: n => "(8.11)")
   $ C (N^(- 23 tau + o \( 1 \)) + N^(- gamma tau + o \( 1 \)) + N^(- beta \/ 6 + \( 3 d + 2 \) tau + o \( 1 \))) . $ <eq:interval-three-errors>]
  Finally, $23 tau = 5888 sigma_0$, $gamma tau = 4 sigma_0$, and
  $ beta / 6 - \( 3 d + 2 \) tau > beta (1 / 6 - 3 / 64000) > beta / 7 > 2 sigma_0 . $
  The finitely many uniform moment losses in each term can be bounded by $N^(sigma_0)$, after increasing the absolute threshold in $N$. Equation (8.11) is consequently $O \( N^(- sigma_0) \)$, as required. All estimates used absolute values of signed Fourier lifts; no pointwise positivity of a lift was needed. ◻
]

== 9 Exceptional terms and the power-saving induction <sec:induction>

We now combine the scale comparison, which applies to every small-residue assignment, with the cancellation obtained for good assignments. For good assignments the nonexceptional contribution is already negligible; we control the exceptional parts by expanding the prime measures. The other assignments are bounded directly by the scale comparison. Expanding measures rather than comparing integrands pointwise keeps the argument valid for signed Fourier lifts throughout.

The finite set $V$ and the constants $P \, M_0 \, beta \, gamma \, tau \, sigma_0$ have now been fixed. Lemma 21 has also established the fixed positive proportion $rho$ of good small-residue assignments. The prime threshold $P$ was chosen so that

#[#set math.equation(numbering: n => "(9.1)")
 $ product_(p gt.eq P) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 . $ <eq:exceptional-euler-budget>]

For every positive integer $n$, define

#[#set math.equation(numbering: n => "(9.2)")
 $ cal(Y) \( n \) = max_(A subset.eq \[ n \]\
A upright(" square-difference-free")) Y \( n \, A \) . $ <eq:maximal-functional>]

This is a finite nonnegative number, by Proposition 11. Write $eta_p = epsilon_p \( bb(F)_p^V \)$ for the mass of the exceptional measure, so $0 lt.eq eta_p lt.eq p^(- 4)$. For $B subset.eq cal(P)_N$, put

#[#set math.equation(numbering: n => "(9.3)")
 $ q_B = product_(p in B) p \, #h(2em) eta_B = product_(p in B) eta_p \, #h(2em) n_B = ⌈frac(N, \( M_0 q_B \)^2)⌉ . $ <eq:exceptional-subset-notation>]

Empty products have value $1$, so $q_diameter = eta_diameter = 1$ and $n_diameter = ceil.l N \/ M_0^2 ceil.r$.

#thm([Proposition 9.1.])[
  #emph[There are absolute constants $K < oo$ and $N_1 gt.eq 2$ such that, for every integer $N gt.eq N_1$, 
#[#set math.equation(numbering: n => "(9.4)")
 $ cal(Y) \( N \) & lt.eq K N^(- sigma_0) + \( 1 + u_N \) (\( 1 - rho \) cal(Y) \( n_diameter \) + rho #h(-0.16667em) sum_(diameter eq.not B subset.eq cal(P)_N\
q_B lt.eq N^tau) eta_B cal(Y) \( n_B \)) \,\
u_N & = \( 1 + M_0^2 N^(2 tau - 1) \)^d - 1 . $ <eq:functional-recurrence>]

 In particular, $u_N arrow.r 0$ as $N arrow.r oo$. The constants $K \, N_1$ do not depend on any proposed induction bound for $cal(Y)$.]
] <prop:induction-recurrence>

#proof[
  Fix a square-difference-free set $A subset.eq \[ N \]$. Write
  $ G_s = cal(L)_(\[ N \] \, cal(P)_N \, Q) f_s \, #h(2em) Phi_(upright(bold(s))) \( \( z_v \)_(v in V) \) = product_(v in V) G_(s_v) \( z_v \) \, $
  where $upright(bold(s)) = \( s_v \)_(v in V)$ is a small-residue assignment. By (7.5), $1_A = bb(E)_s f_s$. The lift is linear, and the product-space integral is multilinear, so
  #[#set math.equation(numbering: n => "(9.5)")
   $ Y \( N \, A \) = bb(E)_(upright(bold(s))) integral Phi_(upright(bold(s))) thin d ⨂_(p in cal(P)_N) mu_p . $ <eq:residue-average-functional>]
  For $B subset.eq cal(P)_N$, define the nonnegative finite measure
  $ kappa_B = ⨂_(p in B) epsilon_p ⊗ ⨂_(p in cal(P)_N \\ B) mu_p . $
  Its mass is $eta_B$. The finite product expansion gives the following identity of signed measures:
  #[#set math.equation(numbering: n => "(9.6)")
   $ ⨂_(p in cal(P)_N) mu_p - ⨂_(p in cal(P)_N) \( mu_p - epsilon_p \) = sum_(diameter eq.not B subset.eq cal(P)_N) \( - 1 \)^(\| B \| + 1) kappa_B . $ <eq:signed-measure-inclusion-exclusion>]
  For any real integrand $Phi$, integration followed by the triangle inequality therefore yields
  #[#set math.equation(numbering: n => "(9.7)")
   $ integral Phi thin d ⨂_p mu_p lt.eq lr(|integral Phi thin d ⨂_p \( mu_p - epsilon_p \)|) + sum_(B eq.not diameter) lr(|integral Phi thin d kappa_B|) . $ <eq:exceptional-signed-bound>]
  This step makes no sign assumption on $Phi$. Notice also that the measure outside $B$ in each summand is the full measure $mu_p$.
  We first bound the summands with $q_B > N^tau$. A summand of zero mass is zero, so assume $eta_B > 0$. Each normalized exceptional measure $epsilon_p \/ eta_p$ has uniform single-label marginals: its invariance under simultaneous translation implies that any one label is uniformly distributed on $bb(F)_p$. The same uniformity holds for $mu_p$. Consequently every single-slot marginal of $kappa_B \/ eta_B$ is uniform on $X_(cal(P)_N)$. No independence between different slots is needed. Ordinary Hölder’s inequality gives
  #[#set math.equation(numbering: n => "(9.8)")
   $ lr(|integral Phi_(upright(bold(s))) thin d kappa_B|) lt.eq eta_B product_(v in V) parallel G_(s_v) parallel_(L^d \( X_(cal(P)_N) \)) lt.eq C_epsilon.alt eta_B N^epsilon.alt #h(2em) \( epsilon.alt > 0 \) . $ <eq:exceptional-holder-moment>]
  The last inequality is Lemma 15, applied at the fixed even order $d$ and with the loss in each factor chosen sufficiently small. The bound $\| f_s \| lt.eq M_0$ only introduces a fixed factor. The constant $C_epsilon.alt$ is independent of $B$, $A$, $N$, and $upright(bold(s))$.
  The exceptional masses are summable with the extra factor $q_B$:
  #[#set math.equation(numbering: n => "(9.9)")
   $ sum_(diameter eq.not B subset.eq cal(P)_N) q_B eta_B = product_(p in cal(P)_N) \( 1 + p eta_p \) - 1 lt.eq product_(p gt.eq P) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 . $ <eq:weighted-exceptional-mass>]
  It follows from (9.8) that
  $ sum_(diameter eq.not B subset.eq cal(P)_N\
q_B > N^tau) lr(|integral Phi_(upright(bold(s))) thin d kappa_B|) lt.eq C_epsilon.alt / 4 N^(- tau + epsilon.alt) . $
  Choose $epsilon.alt = tau \/ 2$. Since $sigma_0 = gamma tau \/ 4 < tau \/ 2$, we obtain
  #[#set math.equation(numbering: n => "(9.10)")
   $ sum_(q_B > N^tau) lr(|integral Phi_(upright(bold(s))) thin d kappa_B|) lt.eq K_1 N^(- sigma_0) \, $ <eq:large-exceptional-tail>]
  uniformly in the residue assignment. Thus the number of exceptional subsets has already been accounted for by the convergent product (9.9).
  Now suppose $q_B lt.eq N^tau$ and $eta_B > 0$. Condition on all the labels at primes in $B$ under $kappa_B \/ eta_B$. The remaining prime law is exactly $⨂_(p in cal(P)_N \\ B) mu_p$. For each realization, the function in slot $v$ is $G_(s_v)$ specialized at its prescribed labels in $B$. The mixed assertion of Proposition 20 applies to these arbitrary slotwise residues and labels. With
  $ D_B = M_0 q_B \, #h(2em) lambda_B = frac(D_B^2 n_B, N) \, $
  it gives
  #[#set math.equation(numbering: n => "(9.11)")
   $ lr(|integral Phi_(upright(bold(s))) thin d kappa_B|) lt.eq eta_B (lambda_B^d cal(Y) \( n_B \) + K_2 N^(- sigma_0)) . $ <eq:small-exceptional-transfer>]
  The same inequality is trivially true when $eta_B = 0$. Crucially, the error and its lower threshold for $N$ are uniform in $B$ and in every conditioned tuple. No induction hypothesis has been used.
  The ceiling in the smaller scale produces a uniform multiplicative error. For $q_B lt.eq N^tau$,
  $ 1 lt.eq lambda_B lt.eq 1 + D_B^2 / N lt.eq 1 + M_0^2 N^(2 tau - 1) \, $
  and hence $lambda_B^d lt.eq 1 + u_N$. Moreover, $sum_(B eq.not diameter) eta_B lt.eq 1 \/ 4$ by (9.9). Summing the errors in (9.11) is therefore harmless.
  If $upright(bold(s))$ is good, Proposition 22 bounds the first term on the right of (9.7) by $K_3 N^(- sigma_0)$. Combining this with (9.10) and (9.11), we obtain
  $ integral Phi_(upright(bold(s))) thin d ⨂_p mu_p lt.eq K_4 N^(- sigma_0) + \( 1 + u_N \) sum_(diameter eq.not B subset.eq cal(P)_N\
q_B lt.eq N^tau) eta_B cal(Y) \( n_B \) . $
  For a nongood $upright(bold(s))$, apply the mixed scale comparison directly with $B = diameter$:
  $ lr(|integral Phi_(upright(bold(s))) thin d ⨂_p mu_p|) lt.eq \( 1 + u_N \) cal(Y) \( n_diameter \) + K_2 N^(- sigma_0) . $
  Averaging these two estimates in (9.5) gives (9.4), since the good assignments have probability $rho$. The estimate is uniform in $A$, so we may take its maximum. Finally, $2 tau < 1$ by the fixed parameter choice, and $M_0 \, d$ are fixed, so $u_N arrow.r 0$. All constants in the proof came from the preceding estimates and fixed parameters; none depended on an induction constant. ◻
]

#thm([Theorem 9.2.])[
  #emph[There are absolute constants $a_0 > 0$ and $C_0 < oo$ such that, for every positive integer $N$ and every square-difference-free set $A subset.eq \[ N \]$, 
$ Y \( N \, A \) lt.eq C_0 N^(- a_0) . $

]
] <thm:functional-decay>

#proof[
  We make all remaining parameter choices before starting the induction. The finite construction fixes $h \, t_0 \, ell \, d$; the conditional and kernel estimates fix $gamma$ and $beta$. The threshold $P$ was then chosen, and with it $M_0$, $tau$, and $sigma_0$. In particular the probability $rho$ of Lemma 21 is already a fixed positive number. We shall not enlarge $P$ after choosing the exponent below.
  Put $r = 1 - 3 rho \/ 4$, so $1 \/ 4 lt.eq r < 1$, and choose
  #[#set math.equation(numbering: n => "(9.12)")
   $ a_0 = min {1 / 4 \, sigma_0 / 2 \, frac(log \( 1 \/ r \), 4 log M_0)} . $ <eq:absolute-exponent-choice>]
  Table 1 summarizes the roles of the parameters; among the listed quantities, only those in the last row vary with the interval length.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Parameters
], table.cell(rowspan: 1, colspan: 1)[Role and order of choice
]),
  table.cell(rowspan: 1, colspan: 1)[$h \, t_0 \, ell \, d$
], table.cell(rowspan: 1, colspan: 1)[Fixed cycle length, marking depth, block count, and tuple size (Section 3).
],
  table.cell(rowspan: 1, colspan: 1)[$gamma \, beta$
], table.cell(rowspan: 1, colspan: 1)[Fixed conductor-decay and rational-frequency cutoff exponents (Sections 4 and 6).
],
  table.cell(rowspan: 1, colspan: 1)[$P \, M_0$
], table.cell(rowspan: 1, colspan: 1)[Prime-law threshold and modulus containing all smaller primes; fixed before choosing the decay exponent (Section 7).
],
  table.cell(rowspan: 1, colspan: 1)[$tau \, sigma_0$
], table.cell(rowspan: 1, colspan: 1)[Fixed partition exponent and common error exponent; chosen in (7.3).
],
  table.cell(rowspan: 1, colspan: 1)[$rho \, a_0$
], table.cell(rowspan: 1, colspan: 1)[Fixed positive residue proportion and induction exponent; $a_0$ is chosen only after $M_0$ and $rho$ in (9.12).
],
  table.cell(rowspan: 1, colspan: 1)[$Q \, H \, cal(P)_N$
], table.cell(rowspan: 1, colspan: 1)[Scale-dependent cutoffs and prime set, defined from $N$ in (7.3).
],
)
]],
    caption: [Table 1: Parameter roles. Every construction size and exponent is fixed independently of $N$ and $A$; the Fourier cutoffs and available prime coordinates change with $N$. ],
  )
  Every quantity in (9.12) is fixed and positive. Thus $0 < a_0 < min \( 1 \/ 2 \, sigma_0 \)$, and
  #[#set math.equation(numbering: n => "(9.13)")
   $ theta := M_0^(2 a_0) \( 1 - rho + rho \/ 4 \) = M_0^(2 a_0) r lt.eq sqrt(r) < 1 . $ <eq:strict-induction-contraction>]
  There is no requirement that $a_0$ be numerically useful.
  For every finite $cal(P)_N$, the bound $eta_p lt.eq p^(- 4)$ and $2 a_0 lt.eq 1$ give
  #[#set math.equation(numbering: n => "(9.14)")
   $ sum_(diameter eq.not B subset.eq cal(P)_N) eta_B q_B^(2 a_0) = product_(p in cal(P)_N) \( 1 + eta_p p^(2 a_0) \) - 1 lt.eq product_(p gt.eq P) \( 1 + p^(- 3) \) - 1 lt.eq 1 / 4 . $ <eq:induction-weighted-mass>]
  Let $kappa = \( 1 - theta \) \/ 2 > 0$. Choose an integer $N_(*) gt.eq N_1$ so large that, for every $N gt.eq N_(*)$,
  #[#set math.equation(numbering: n => "(9.15)")
   $ theta u_N lt.eq kappa \, #h(2em) K N^(a_0 - sigma_0) lt.eq kappa \, $ <eq:induction-threshold-choice>]
  where $K \, N_1$ are supplied by Proposition 23. This is possible because $u_N arrow.r 0$ and $a_0 < sigma_0$. The choice of $N_(*)$ is independent of $C_0$. Choose $C_0 gt.eq 1$ large enough that
  #[#set math.equation(numbering: n => "(9.16)")
   $ cal(Y) \( n \) lt.eq C_0 n^(- a_0) #h(2em) \( 1 lt.eq n < N_(*) \) . $ <eq:finite-induction-base>]
  Only finitely many values are involved, so such a finite constant exists. For an elementary bound, the lift in $Y \( n \, A \)$ has at most $2 n^(2 beta)$ frequencies and each coefficient has modulus at most $1$. Since its tuple law is a probability measure, $0 lt.eq Y \( n \, A \) lt.eq \( 2 n^(2 beta) \)^d$. Thus, for example, $C_0 = max { 1 \, 2^d N_(*)^(2 beta d + a_0) }$ suffices in (9.16). This also covers $n = 1$ and the cases of an empty prime set.
  Suppose now that $N gt.eq N_(*)$ and $cal(Y) \( n \) lt.eq C_0 n^(- a_0)$ for every positive integer $n < N$. Every smaller scale appearing in (9.4) lies in this range. Indeed, $M_0 q_B gt.eq 8$ gives
  $ 1 lt.eq n_B lt.eq N \/ 64 + 1 < N #h(2em) \( N gt.eq 2 \) . $
  The ceiling goes in the favorable direction for a negative exponent:
  $ n_B^(- a_0) lt.eq N^(- a_0) M_0^(2 a_0) q_B^(2 a_0) . $
  Apply the induction hypothesis at every such scale in (9.4), and then use (9.14). Extending the positive subset sum to all nonempty $B$ can only increase the bound, and therefore
  $ cal(Y) \( N \) & lt.eq K N^(- sigma_0) + \( 1 + u_N \) C_0 N^(- a_0) M_0^(2 a_0) (1 - rho + rho sum_(B eq.not diameter) eta_B q_B^(2 a_0))\
 & lt.eq K N^(- sigma_0) + \( 1 + u_N \) theta C_0 N^(- a_0)\
 & lt.eq kappa N^(- a_0) + \( 1 - kappa \) C_0 N^(- a_0) lt.eq C_0 N^(- a_0) . $
  In the third line we used (9.15) and $theta + kappa = 1 - kappa$; in the last line we used $C_0 gt.eq 1$. This closes strong induction. In particular, increasing $C_0$ to cover the finite base range does not change the validity of the large-scale step. ◻
]

#proof[
  Let $N gt.eq 1$ and let $A subset.eq \[ N \]$ have no positive integer-square difference. Put $G = cal(L)_(\[ N \] \, cal(P)_N \, Q) 1_A$. Its constant Fourier coefficient is $\| A \| \/ N$, and every nonconstant character on $X_(cal(P)_N)$ has uniform mean zero. The mean inequality in Lemma 12 and Theorem 24 yield
  $ frac(\| A \|, N) = \| bb(E) G \| lt.eq Z_(cal(P)_N) \( G \)^(1 \/ d) = Y \( N \, A \)^(1 \/ d) lt.eq C_0^(1 \/ d) N^(- a_0 \/ d) . $
  Thus $C = C_0^(1 \/ d) < oo$ and $c = a_0 \/ d > 0$ are absolute constants for which $\| A \| lt.eq C N^(1 - c)$ for every such $N$ and $A$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
