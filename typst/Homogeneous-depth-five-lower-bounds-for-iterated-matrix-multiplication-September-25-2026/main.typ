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

#align(center)[#text(size: 16pt, weight: "bold")[Homogeneous depth-five lower bounds for iterated matrix multiplication]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

We study how many gates are needed to compute iterated matrix multiplication with five homogeneous arithmetic
  layers. For integers $w \, d gt.eq 1$, let $X^(\( 1 \)) \, dots.h \, X^(\( d \))$ be $w times
  w$ matrices whose entries are distinct commuting variables. Define

#[#set math.equation(numbering: n => "(1)")
 $ "IMM"_(w \, d) = #scale(x: 120%, y: 120%)[\(] X^(\( 1 \)) dots.h.c X^(\( d \))
   #scale(x: 120%, y: 120%)[\)]_(1 \, 1) = sum_(i_1 \, dots.h \, i_(d - 1) in \[ w \]) x_(1 \, i_1)^(\( 1 \))
   x_(i_1 \, i_2)^(\( 2 \)) dots.h.c x_(i_(d - 1) \, 1)^(\( d \)) . $ <eq:imm-definition>]

For $d = 1$, the expression means $x_(1 \, 1)^(\( 1 \))$.
  The first index denotes matrix width and the second denotes degree.
  We retain all $d w^2$ matrix-entry variables as ambient variables, including entries absent from the polynomial.
  Our target is $"IMM"_(n \, n)$, of degree $n$ in $n^3$ ambient variables.

=== 1.1 Circuit model and main result <circuit-model-and-main-result>

An arithmetic circuit over a field $K$ is a finite directed acyclic graph.
  Its leaves are variables or elements of $K$. A sum gate computes a $K$-linear combination of its inputs,
  and a product gate computes their product. Fan-in and fan-out are arbitrary and finite.
  Gates may be shared, and a gate may occur repeatedly among another gate’s inputs;
  repeated occurrences at a product gate are counted with their multiplicities.
  Scalar coefficients on sum inputs are part of the circuit and do not require additional gates.

A $Sigma Pi Sigma Pi Sigma$ circuit has five computational layers, listed from output to leaves,
  with respective gate types $+ \, times \, + \, times \, +$ and a single output gate.
  Edges between computational gates join consecutive layers, and the bottom sums read leaves.
  Unary gates are allowed. In particular, no bound is placed on the number of variables in a bottom linear form.

The circuit is #emph[syntactically homogeneous] if it has the following formal-degree assignment:
  variables have degree $1$, constants have degree $0$, product gates add their input degrees with multiplicity,
  and all inputs of a sum gate have the same degree, which is assigned to that gate.
  Empty sums and products, if present, compute $0$ and $1$ and have formal degree $0$.
  Thus a zero polynomial at a gate still carries its assigned formal degree;
  cancellation does not reset that degree. All computations and equalities below concern formal polynomials.

We define #emph[size] to be the number of vertices, including leaves.
  The number of computational gates excludes leaves, whereas wire size counts input occurrences.
  These quantities are not identified: our lower bound is on gates,
  and the circuit analysis also bounds the number of computational gates alone.

#thm([Theorem 1.1.])[
  #emph[There exist absolute constants $c > 0$ and $n_0$ such that, for every integer $n gt.eq n_0$,
    every syntactically homogeneous $Sigma Pi Sigma Pi Sigma$ circuit over $bb(C)$ computing $"IMM"_(n \, n)$ has
    size at least
$ n^(c sqrt(n)) . $

 One may take $c = 1 \/ 400$.]
] <thm:main>

The model permits unrestricted bottom fan-in and support, constants, and shared subcircuits.
  Corollary 9 extends the $n^(sqrt(n) \/ 400)$ lower bound to every field of characteristic zero,
  with the same absolute threshold. Proposition 10 gives an elementary block construction of size at most
  $n^(sqrt(n) + 4)$ over every field for $n gt.eq 2$. It is homogeneous of depth four;
  inserting unary bottom sums makes it depth five, so the lower bound has the matching scale.
  Iterated matrix multiplication nevertheless has polynomial-size circuits when depth is unrestricted.

=== 1.2 Historical context and previous bounds <historical-context-and-previous-bounds>

Iterated matrix multiplication has long served as a test of the cost of restricting arithmetic depth.
  Its path expansion connects matrix products with reachability,
  while its polynomial-size unrestricted circuits make it a natural target for lower bounds on weaker circuit
  models. Nisan and Wigderson used dimensions of partial-derivative spaces to prove lower bounds for homogeneous
  depth-three circuits and for constant-depth set-multilinear circuits.
  They asked for an explicit homogeneous polynomial requiring superpolynomial size at constant depth,
  even at depth five #cite(label("NisanWigderson1995")) Section 2.2 of the linked author journal manuscript.

Depth reduction gave this program a further motivation. Agrawal and Vinay reduced general arithmetic computation
  to depth four, and Koiran and Tavenas sharpened the size bounds #cite(label("AgrawalVinay2008"))
  #cite(label("Koiran2012")) #cite(label("Tavenas2013")). For $d = N^(O \( 1 \))$,
  Tavenas’s theorem converts a circuit of size $N^(O \( 1 \))$ computing a homogeneous degree-$d$ polynomial in
  $N$ variables to a homogeneous depth-four circuit of size $N^(O \( sqrt(d) \))$ #cite(label("Tavenas2013"))
  Theorem 1 of the linked preprint. This explains the square-root scale in depth-four lower bounds and in the
  block construction for IMM used here.

The progress toward this scale involved several distinct restrictions.
  Fournier, Limaye, Malod, and Srinivasan proved IMM lower bounds with bounds on both product-layer fan-ins and,
  separately, for homogeneous multilinear formulas #cite(label("FournierLimayeMalodSrinivasan2015")) Theorems 16
  and 29 of the cited author version. Kayal, Limaye, Saha, and Srinivasan removed the bottom-fan-in restriction
  for homogeneous depth-four formulas, obtaining an exponential lower bound over characteristic zero for a
  Nisan–Wigderson design family #cite(label("KayalLimayeSahaSrinivasan2014")) Theorem 1.
  Kumar and Saraf proved a $d^(Omega \( sqrt(d) \))$ lower bound for homogeneous depth-four circuits computing
  $"IMM"_(d^5 \, d)$, over every field #cite(label("KumarSaraf2014")) Theorem 1.2 and Section 8.2 of the cited
  preprint. In another direction, Kayal, Saha, and Tavenas obtained $w^(Omega \( sqrt(d) \))$ for syntactically
  multilinear depth-four circuits computing $"IMM"_(w \, d)$, without homogeneity, in the range $d gt.eq log^2 w$,
  over every field #cite(label("KayalSahaTavenas2018")) Theorem 1.4 and the following comparison.

At depth five, Bera and Chakrabarti proved a lower bound with a restriction on bottom support.
  Their Theorem 1.1 states that, for every fixed $0 lt.eq mu < 1 \/ 2$, there is an integer $q =
  q \( mu \) > 0$ such that homogeneous $Sigma Pi Sigma Pi Sigma$ circuits computing $"IMM"_(d^q \, d)$, with $N =
  d^(2 q + 1)$ ambient variables and bottom fan-in at most $N^mu$,
  require $N^(Omega_mu \( sqrt(d) \))$ gates over every field #cite(label("BeraChakrabarti2015")) Theorem 1.1.
  Their precise Theorem 4.2 proves the lower bound for a restricted IMM polynomial,
  using the number of distinct variables feeding each bottom linear gate as its support parameter
  #cite(label("BeraChakrabarti2015")) Theorem 4.2. The Kumar–Saraf and Bera–Chakrabarti bounds use different
  width–degree regimes from $w = d = n$, and the latter restricts the bottom linear forms.

For a different hard family, Kumar and Saptharishi proved, over each fixed finite field $bb(F)_q$,
  $exp \( Omega_q \( sqrt(d) \) \)$ lower bounds for homogeneous depth-five circuits without a bottom-support
  restriction #cite(label("KumarSaptharishi2017")) Theorem 1.
  Their family is based on Nisan–Wigderson designs and lies in $upright("VNP")$.
  Armand, Behera, and Tavenas have since extended this finite-field approach to depth-five circuits whose
  top-product fan-in is bounded by a fixed polynomial in the degree $d$,
  without homogeneity #cite(label("ArmandBeheraTavenas2026")) Corollary 1.3.
  These finite-field theorems concern NW polynomials rather than IMM;
  both the field hypothesis and the exponential rate differ from those in Theorem 1.

Superpolynomial lower bounds for unrestricted-bottom depth-five circuits over characteristic zero were already
  established by the constant-depth results of Limaye, Srinivasan,
  and Tavenas #cite(label("LimayeSrinivasanTavenas2021")) #cite(label("LimayeSrinivasanTavenas2025")).
  We use the theorem numbering of their ECCC revision 1. Their product-depth convention counts multiplication
  gates on a path, so our five-layer model has product-depth two.
  In the low-degree regime $d lt.eq \( log w \) \/ 100$, their Corollary 3 gives $w^(Omega \( sqrt(d) \))$ for
  homogeneous product-depth-two circuits over every field #cite(label("LimayeSrinivasanTavenas2021")) Corollary 3.
  Their general-circuit results also imply superpolynomial lower bounds for $"IMM"_(n \, n)$ over $bb(C)$
  #cite(label("LimayeSrinivasanTavenas2021")) Corollary 4 and the following discussion.
  Bhargav, Dutta, and Saxena improved the constant-depth exponents in the low-degree regime
  #cite(label("BhargavDuttaSaxena2022")). Forbes subsequently established low-depth IMM lower bounds over
  arbitrary fields in the regime $d = o \( log w \)$ #cite(label("Forbes2024")) Theorem 10.

Amireddy, Garg, Kayal, Saha, and Thankey gave a direct shifted-partials approach.
  For homogeneous product-depth-two formulas they obtain $2^(- O \( d \)) w^(Omega \( sqrt(d) \))$ when $w =
  omega \( d \)$, over every field #cite(label("AmireddyGargKayalSahaThankey2023")) Theorem 24.
  The degree-dependent loss and the hypothesis $w = omega \( d \)$ prevent direct substitution of $w = d = n$.
  The comparison addressed here is quantitative: we obtain the $sqrt(n)$ exponent in the balanced regime $w = d =
  n$ for homogeneous five-layer circuits with unrestricted bottom linear forms.

=== 1.3 Proof overview <proof-overview>

The proof uses a derivative-based linear-algebraic measure.
  Dimensions of partial-derivative spaces were used by Nisan and Wigderson #cite(label("NisanWigderson1995"));
  shifted partial derivatives were developed in work of Kayal #cite(label("Kayal2012")) and Gupta, Kamath, Kayal,
  and Saptharishi #cite(label("GuptaKamathKayalSaptharishi2014")).
  We define the operator needed here directly and prove its estimates.

Partition the matrix layers into two groups containing $k$ and $m$ layers, where $k + m = n$ and $m -
  k$ is of order $sqrt(n)$. Let $V$ and $U$ be the corresponding variable sets.
  For a homogeneous polynomial $g$ of degree $n$, let $g_(\[ k \, m \])$ be the sum of its monomials having degree
  $k$ in $V$ and degree $m$ in $U$. Replace its $V$-variables by partial derivatives and its $U$-variables by
  multiplication operators. On polynomials of fixed bidegree $\( a \, b \)$ this gives a linear map

$ F_g = g_(\[ k \, m \]) \( partial_V \, U \) $

into polynomials of bidegree $\( a - k \, b + m \)$. We choose $a \, b$ of order $n^(5 \/ 2)$,
  write $D$ for the dimension of the source, and use $R \( g \) = "rank" F_g$ as the complexity measure.
  Differentiation in $V$ commutes with multiplication in $U$; the full substitution therefore respects products,
  while the finite map is linear in $g$ and its rank is subadditive. Section 2 gives the definitions and parameters.

We first bound the rank of a circuit in Section 3. For a product of homogeneous factors,
  resolve each factor into its possible $V$-degrees. Apply first those factors whose $V$-degree exceeds their
  proportional share $k e \/ n$ for a factor of degree $e$.
  Their composition passes through a smaller intermediate polynomial space, which bounds its rank.
  The distance of each proportional share from the integers controls the sum over all such decompositions.
  These are the same integer-degree discrepancies that underlie the residue method of Amireddy, Garg, Kayal, Saha,
  and Thankey #cite(label("AmireddyGargKayalSahaThankey2022Full")) Definition 2.1 and Lemma 3.1;
  here they control intermediate homogeneous dimensions. If all factor degrees are small,
  these distances give the required saving. If some factor has large degree,
  expand just one such factor into its bottom products of linear forms.
  This costs at most one additional factor of the circuit size. Proposition 3 gives, for a size-$S$ circuit,

$ R \( g \) lt.eq 2 S^2 D exp \( C sqrt(n) \) thin n^(- sqrt(n) \/ 100) $

with an absolute constant $C$.

The opposite estimate uses the paths in matrix multiplication.
  Section 4 arranges the two groups of layers in a balanced order, with no adjacent $V$-layers.
  Declare the monomials $z^M \/ sqrt(M !)$ orthonormal, where $M$ is an exponent vector and $M !$ is the product
  of its coordinate factorials. In these bases, differentiation and multiplication have coefficients given by
  square roots of exponents and their successors. For $g = "IMM"_(n \, n)$,
  the first two trace moments of $F_g^(*) F_g$ become weighted counts of paths and quadruples of paths.
  Exact factorial moments for uniform weak compositions compare these weights with independent geometric random
  variables. We verify the coefficient signs needed for that comparison.

At each layer, a contributing quadruple has one of two pairing patterns.
  A change of pattern forces four vertex labels to agree and reduces the number of choices by a factor of $n$.
  Section 5 sums the resulting weights, treating isolated corrections and the two endpoints explicitly.
  The balanced order controls the weight accumulated along each run of one pattern. The trace inequality

$ "rank" H gt.eq frac(\( "tr" H \)^2, "tr" \( H^2 \)) wide \( H eq.not 0 upright(" positive semidefinite") \) $

then yields $R \( "IMM"_(n \, n) \) gt.eq D exp \( - C' sqrt(n) \)$, as stated in Proposition 6.
  Section 6 compares the two rank estimates and proves the field extension and matching upper bound.

== 2 A rank measure from differentiation and multiplication <sec:rank>

We associate a linear map to a polynomial by differentiating in one group of variables and multiplying in a
  disjoint group. The rank of this map is subadditive. More importantly,
  the map associated to a product can be factored through intermediate homogeneous spaces,
  whose dimensions will control the circuit upper bound.

=== 2.1 The operator and its homogeneous spaces <the-operator-and-its-homogeneous-spaces>

Let $K$ be a field, and let $V \, U$ be disjoint finite sets of variables, of cardinalities $v \, u gt.eq 1$.
  For a variable set $E$ and an integer $t gt.eq 0$, write $cal(H)_E \( t \) =
  K \[ E \]_t$ for the vector space of homogeneous polynomials of degree $t$. Its dimension is

$ h \( \| E \| \, t \) \, wide h \( r \, t \) = binom(r + t - 1, t) . $

For $Q in K \[ V \, U \]$, let

$ T_Q = Q \( partial_V \, U \) $

be the operator on $K \[ V \, U \]$ obtained by replacing each variable in $V$ by its formal partial derivative
  and each variable in $U$ by multiplication by that variable.
  These operators commute because the two variable sets are disjoint. Thus $T_(Q_1 Q_2) = T_(Q_1) T_(Q_2)$.
  This identity holds over every field.

Fix integers $k \, m gt.eq 0$, $a gt.eq k$, and $b gt.eq 0$.
  If $g$ is homogeneous of degree $k + m$, denote its component of $V$-degree $k$ and $U$-degree $m$ by
  $g_(\[ k \, m \])$. Define the finite-dimensional map

#[#set math.equation(numbering: n => "(2)")
 $ F_g = g_(\[ k \, m \]) \( partial_V \, U \) : cal(H)_V \( a \) ⊗ cal(H)_U \( b \) arrow.r
   cal(H)_V \( a - k \) ⊗ cal(H)_U \( b + m \) \, wide R \( g \) = "rank" F_g . $ <eq:rank-map>]

The source dimension is $D = h \( v \, a \) h \( u \, b \)$.
  Projection to a bidegree and operator substitution are both linear, so

$ R \( g_1 + g_2 \) lt.eq R \( g_1 \) + R \( g_2 \) \, wide R \( c g \) = R \( g \) quad \( c in K \\ { 0 } \) . $

Also $R \( 0 \) = 0$. The multiplicative identity for $T_Q$ does not assert multiplicativity of $g mapsto F_g$:
  the latter includes a fixed bidegree projection. We will first decompose products into their bidegree components
  and then use multiplicativity of $T_Q$ on each contribution.

=== 2.2 Choosing the degrees <choosing-the-degrees>

We now choose the spaces in (2) for degree-$n$ polynomials on the $n$ matrix layers.
  Throughout the proof $n$ is sufficiently large, and all implicit constants and thresholds are absolute.
  Let $s$ be the largest integer at most $sqrt(n)$ having the same parity as $n$, and put

#[#set math.equation(numbering: n => "(3)")
 $ k = frac(n - s, 2) \, wide m = frac(n + s, 2) \, wide rho = k / m \, wide lambda = k / n = frac(rho, 1 + rho) \,\
v = k n^2 \, wide u = m n^2 \, wide a = ⌈frac(v, sqrt(n) - 1)⌉ \, wide alpha = frac(a, a + v) \,\
b = ⌈frac(u alpha^rho, 1 - alpha^rho)⌉ \, wide beta = frac(b, b + u) \, wide q = alpha^(\( 1 + rho \) \/ 2) \,
  wide D = h \( v \, a \) h \( u \, b \) . $ <eq:parameters>]

For now assign any $k$ full matrix layers to $V$ and the other $m$ layers to $U$.
  Each layer retains all its $n^2$ variables, including variables absent from the endpoint entry of the matrix
  product. Section 4 will specify their order when bounding the rank of $"IMM"_(n \, n)$ from below.

The small excess $m - k = s$ makes the slope $lambda$ slightly less than $1 \/ 2$.
  For small positive even factor degrees $e$, this moves $lambda e$ away from the integers;
  Section 3 quantifies the resulting rank saving. The definitions of $a \,
  b$ balance the dimension decrease caused by differentiation against the dimension increase caused by
  multiplication. Without the ceiling in the definition of $b$, we would have $beta =
  alpha^rho$ and $alpha^k beta^(- m) = 1$. We record the rounding estimates explicitly,
  as their errors must stay small after many factors are combined.

#thm([Lemma 2.1.])[
  #emph[For all sufficiently large $n$, the parameters in (3) satisfy
$ sqrt(n) / 2 lt.eq s lt.eq sqrt(n) \, wide lambda gt.eq 3 / 8 \, wide 0 < rho < 1 \, wide v \, u =
  Theta \( n^3 \) \, wide a \, b = Theta \( n^(5 \/ 2) \) \,\
a gt.eq k \, wide 2 n lt.eq 1 / 2 min \( a \, b \) \, wide n^(- 1 \/ 2) lt.eq alpha =
  n^(- 1 \/ 2) exp \( O \( 1 \/ a \) \) \, wide alpha^(- 1) lt.eq sqrt(n) \,\
alpha^rho lt.eq beta lt.eq alpha^rho exp \( C \/ b \) \, wide beta lt.eq 2 / sqrt(n) \,\
q = n^(- 1 \/ 2) exp #scale(x: 120%, y: 120%)[\(] O \( s log n \/ n + 1 \/ a \) #scale(x: 120%, y: 120%)[\)] \,
  wide n^(- 1 \/ 2) lt.eq q lt.eq 2 / sqrt(n) lt.eq n^(- 2 \/ 5) \, wide q lt.eq 1 / 2 \, $

 where $C$ is an absolute constant.]
] <lem:parameters>

#proof[
  The parity choice gives $sqrt(n) - 2 < s lt.eq sqrt(n)$, and hence the claims about $s \, k \, m \, lambda \,
    rho \, v \, u$. Write $a_0 = v \/ \( sqrt(n) - 1 \)$, so that $a_0 lt.eq a < a_0 +
    1$ and $a_0 \/ \( a_0 + v \) = n^(- 1 \/ 2)$. The function $x \/ \( x + v \)$ is increasing,
    and the derivative of its logarithm is $v \/ \( x \( x + v \) \) lt.eq 1 \/ x$.
    The mean value theorem therefore gives
  $ 0 lt.eq log \( alpha n^(1 \/ 2) \) lt.eq 1 / a_0 = O \( 1 \/ a \) . $
  In particular $a = Theta \( n^(5 \/ 2) \)$ and $alpha^(- 1) lt.eq sqrt(n)$.
  Since $1 - rho = s \/ m = O \( s \/ n \)$, the preceding estimate implies
  $ alpha^rho = n^(- 1 \/ 2) exp #scale(x: 120%, y: 120%)[\(] O \( s log n \/ n + 1 \/ a \)
    #scale(x: 120%, y: 120%)[\)] = n^(- 1 \/ 2) \( 1 + o \( 1 \) \) . $
  Put $b_0 = u alpha^rho \/ \( 1 - alpha^rho \)$. Then $b_0 = Theta \( n^(5 \/ 2) \)$, $b_0 lt.eq b < b_0 + 1$,
    and $b_0 \/ \( b_0 + u \) = alpha^rho$. Applying the same logarithmic derivative bound with $u$ in place of
    $v$ gives
  $ 0 lt.eq log \( beta \/ alpha^rho \) lt.eq 1 \/ b_0 lt.eq C \/ b . $
  This proves the assertions about $b \, beta$, including $beta lt.eq 2 \/ sqrt(n)$ eventually.
    The growth of $a \, b$ also gives $a gt.eq k$ and $2 n lt.eq min \( a \, b \) \/ 2$.
  Finally,
  $ log q = - frac(1 + rho, 4) log n + O \( 1 \/ a \) = - 1 / 2 log n + O \( s log n \/ n + 1 \/ a \) . $
  Because $0 < alpha < 1$ and $\( 1 + rho \) \/ 2 lt.eq 1$, we have $q gt.eq alpha gt.eq n^(- 1 \/ 2)$.
    The remaining upper bounds follow from the last display and $s log n \/ n arrow.r 0$. ◻
]

The estimate $q lt.eq n^(- 2 \/ 5)$ will suffice for the main power savings.
  The sharper $q = O \( n^(- 1 \/ 2) \)$ will be essential when summing the smaller errors contributed by even
  factor degrees.

== 3 The rank of a homogeneous depth-five circuit <sec:circuits>

We now bound the rank measure in terms of circuit size. The argument is uniform over the choice of the $k$ matrix
  layers assigned to $V$. Its first step bounds the rank of a product using only the degrees of its factors.
  We then expand one middle-layer sum when its degree is large, exposing its lower products of linear forms.

#thm([Proposition 3.1.])[
  #emph[There are absolute constants $C > 0$ and $n_0$ with the following property.
    For $n gt.eq n_0$, use the parameters in (3) and any partition of the matrix layers with $k$ layers in $V$ and
    $m$ layers in $U$. Let $K$ be a field, and let $g in K \[ V \, U \]$ be a homogeneous degree-$n$ polynomial
    computed by a syntactically homogeneous $Sigma Pi Sigma Pi Sigma$ circuit of size $S$. Then
$ R \( g \) lt.eq 2 S^2 D exp \( C sqrt(n) \) thin n^(- sqrt(n) \/ 100) . $

]
] <prop:circuit>

All thresholds in this section are absorbed into a single absolute $n_0$, independent of the field, the circuit,
  and the partition. Only the parameter estimates of Lemma 2 will be used.

=== 3.1 Products and intermediate dimensions <products-and-intermediate-dimensions>

For a positive integer $e$, define

$ H_e = sum_(i = 0)^e q^(\| i - lambda e \|) . $

These quantities account for all choices of bidegree in a product.

The quantities $H_e$ use the same integer-degree discrepancies as the residue method of Amireddy, Garg, Kayal,
  Saha, and Thankey #cite(label("AmireddyGargKayalSahaThankey2022Full")) Definition 2.1 and Lemma 3.1.
  In the present argument they control the dimensions of the intermediate homogeneous spaces through which the
  differentiation–multiplication operator factors.

#thm([Lemma 3.2.])[
  #emph[Let $K$ be a field, and let $Q_1 \, dots.h \, Q_r in
    K \[ V \, U \]$ be homogeneous of respective positive degrees $e_1 \, dots.h \, e_r$,
    with $sum_(j = 1)^r e_j = n$. Then
$ R (product_(j = 1)^r Q_j) lt.eq 2 D product_(j = 1)^r H_(e_j) . $

]
] <lem:product-rank>

#proof[
  Decompose each factor into its bidegree components. The component of their product that defines the rank measure is
  $ (product_(j = 1)^r Q_j)_(\[ k \, m \]) = sum_(0 lt.eq i_j lt.eq e_j med \( 1 lt.eq j lt.eq r \)\
sum_j i_j = k) product_(j = 1)^r \( Q_j \)_(\[ i_j \, e_j - i_j \]) . $
  Fix an assignment in this sum, and put $delta_j = i_j - lambda e_j$.
    Since $lambda n = k$, we have $sum_j delta_j = 0$. The operators obtained by substituting $partial_V$ and $U$
    commute, so we may apply first the factors with $delta_j > 0$. Write their total bidegree as
  $ I = sum_(delta_j > 0) i_j \, wide J = sum_(delta_j > 0) \( e_j - i_j \) . $
  The resulting intermediate space is $cal(H)_V \( a - I \) ⊗ cal(H)_U \( b + J \)$.
    It is well defined because $I lt.eq k lt.eq a$; also $J lt.eq m$.
    Its dimension bounds the rank of this contribution, including when the set of positive discrepancies is empty.
  The successive ratios of binomial coefficients give
  $ frac(h \( v \, a - I \), h \( v \, a \)) & = product_(t = 0)^(I - 1) frac(a - t, a + v - 1 - t) lt.eq
    (frac(a, a + v - 1))^I \,\
frac(h \( u \, b + J \), h \( u \, b \)) & = product_(t = 1)^J frac(b + u + t - 1, b + t) lt.eq
  (frac(b + u, b))^J = beta^(- J) . $
  The first inequality follows because $x \/ \( x + v - 1 \)$ is nondecreasing for $x > 0$.
    Since $beta gt.eq alpha^rho$, these inequalities imply
  #[#set math.equation(numbering: n => "(4)")
   $ frac(h \( v \, a - I \) h \( u \, b + J \), D) lt.eq alpha^(I - rho J) (1 - frac(1, a + v))^(- I) lt.eq
     2 alpha^(I - rho J) . $ <eq:intermediate-dimension>]
  The last bound holds uniformly for $I lt.eq n$, because $a + v = Theta \( n^3 \)$.
    Empty products in the ratio formulas equal 1.
  Using $lambda = rho \/ \( 1 + rho \)$ and $sum_j delta_j = 0$, we obtain
  $ I - rho J = \( 1 + rho \) sum_(delta_j > 0) delta_j = frac(1 + rho, 2) sum_j \| delta_j \| . $
  As $q = alpha^(\( 1 + rho \) \/ 2)$, the rank of the fixed-assignment contribution is therefore at most
  $ 2 D product_j q^(\| i_j - lambda e_j \|) . $
  Rank subadditivity permits summing these bounds. Dropping the constraint $sum_j i_j =
    k$ increases the resulting nonnegative sum and makes it factor as $2 D product_j H_(e_j)$.
    Zero bidegree components contribute rank zero throughout. ◻
]

=== 3.2 The cost of integer degrees <the-cost-of-integer-degrees>

The product estimate is effective because $lambda e$ is usually separated from the integers.
  Small even degrees require particular care: their separation can tend to zero,
  so a constant loss for each factor would be too large. We bound their combined error instead.

Put

$ d_e = "dist" \( lambda e \, bb(Z) \) \, wide t_0 = frac(n, 4 s) . $

#thm([Lemma 3.3.])[
  #emph[For every integer $e gt.eq 1$,
#[#set math.equation(numbering: n => "(5)")
 $ H_e lt.eq q^(d_e) #scale(x: 120%, y: 120%)[\(] 1 + 4 q^(1 - 2 d_e) #scale(x: 120%, y: 120%)[\)] lt.eq
   5 . $ <eq:nearest-integer-bound>]

 If $1 lt.eq e < t_0$, then
#[#set math.equation(numbering: n => "(6)")
 $ d_e =
   cases(delim: "{", s e \/ \( 2 n \) \, & e upright(" even") \,, 1 \/ 2 - s e \/ \( 2 n \) \, & e
   upright(" odd") \,) wide d_e gt.eq frac(s e, 2 n) . $ <eq:low-degree-distances>]

 In this range, odd degrees satisfy $H_e lt.eq q^(d_e \/ 2)$, whereas even degrees satisfy
#[#set math.equation(numbering: n => "(7)")
 $ H_e lt.eq q^(d_e) exp #scale(x: 120%, y: 120%)[\(] 4 q^(1 - s e \/ n) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:even-degree-bound>]

 There is an absolute constant $C_1$ such that, for every finite list of positive integers $e_1 \, dots.h \,
   e_r$ with $sum_j e_j lt.eq n$,
#[#set math.equation(numbering: n => "(8)")
 $ sum_(j : med e_j < t_0\
e_j upright(" even")) q^(1 - s e_j \/ n) lt.eq C_1 sqrt(n) . $ <eq:even-corrections>]

]
] <lem:degree-estimates>

#proof[
  Enlarge the sum defining $H_e$ to all integers. Apart from one nearest integer to $lambda e$,
    the terms have total at most $2 q^(1 - d_e) \/ \( 1 - q \)$.
    This remains valid when the nearest integer is not unique.
    Since $q lt.eq 1 \/ 2$, it gives the first inequality in (5); the second follows from $0 lt.eq d_e lt.eq
    1 \/ 2$ and $0 < q < 1$.
  For $e < t_0$, write
  $ lambda e = e / 2 - frac(s e, 2 n) \, wide 0 < frac(s e, 2 n) < 1 / 8 . $
  The nearest integer is consequently $e \/ 2$ for even $e$, and $\( e - 1 \) \/ 2$ for odd $e$. This proves (6).
    For odd $e$ we have $d_e gt.eq 3 \/ 8$. By $q lt.eq n^(- 2 \/ 5)$,
  $ q^(- d_e \/ 2) gt.eq n^(d_e \/ 5) gt.eq n^(3 \/ 40) gt.eq 5 $
  after increasing $n_0$. Thus $H_e lt.eq 5 q^(d_e) lt.eq q^(d_e \/ 2)$.
    For even $e$, substitute $2 d_e = s e \/ n$ in (5) and use $1 + x lt.eq exp \( x \)$ to obtain (7).
  It remains to sum these even-degree errors. Increase $n_0$ so that $t_0 > 2$,
    and for real $z in \[ 2 \, t_0 \]$ define
  $ f \( z \) = q^(1 - s z \/ n) / z . $
  Its logarithm is convex, since $\( log f \)'' \( z \) = 1 \/ z^2 > 0$.
    Hence $f \( z \) lt.eq max { f \( 2 \) \, f \( t_0 \) }$. The sharp estimate for $q$ in Lemma 2 gives
  $ f \( 2 \) = 1 / 2 n^(- 1 \/ 2) exp #scale(x: 120%, y: 120%)[\(] O \( s log n \/ n + 1 \/ a \)
    #scale(x: 120%, y: 120%)[\)] = O \( n^(- 1 \/ 2) \) . $
  At the other endpoint, $s lt.eq sqrt(n)$ and $q lt.eq 2 n^(- 1 \/ 2)$ give
  $ f \( t_0 \) = frac(4 s, n) q^(3 \/ 4) = O \( n^(- 7 \/ 8) \) . $
  Therefore $q^(1 - s e \/ n) lt.eq C_1 e \/ sqrt(n)$ uniformly over the low even degrees.
    Summing and using $sum_j e_j lt.eq n$ proves (8). ◻
]

These estimates control a product of factors below $t_0$ regardless of their coefficients.
  A factor of degree at least $t_0$ will instead supply many linear factors through its bottom-layer expansion.

=== 3.3 From gates to products <from-gates-to-products>

#proof[
  If $g = 0$, the conclusion is immediate. Otherwise its formal output degree is $n$:
    induction on the gates shows that every nonzero polynomial at a formally homogeneous degree-$d$ gate is
    homogeneous of degree $d$.
  We first record exactly what the circuit layers provide. A bottom sum gate computes either a homogeneous linear
    form or a scalar, because all its leaf inputs have the same formal degree.
    A lower product of formal degree $e > 0$ therefore computes a scalar times a product of exactly $e$
    homogeneous linear-form occurrences. Degree-zero factors are absorbed into that scalar.
    A zero factor makes the whole product zero and its contribution can be discarded.
    A gate computing zero need not be assigned a different formal degree.
  At either a middle sum or the output sum, repeated wires from the same predecessor gate can be combined by
    adding their scalar coefficients. There are at most $S$ distinct predecessors.
    Thus $g$ is a sum of at most $S$ scalar multiples of products
  #[#set math.equation(numbering: n => "(9)")
   $ G = product_(j = 1)^r Q_j \, wide deg Q_j = e_j gt.eq 1 \, wide sum_j e_j = n \, $ <eq:circuit-product-form>]
  and each $Q_j$ is a sum of at most $S$ scalar multiples of products of $e_j$ homogeneous linear forms.
    Zero upper terms have been discarded, and degree-zero factors in the remaining terms have been absorbed into
    their coefficients. If empty sums or products are allowed,
    they contribute only zero or a scalar and are handled in the same way.
  In (9), inputs to a product are counted with multiplicity: repeated use of a gate gives repeated factors.
    Their positive degrees add to $n$, so $r lt.eq n$. Shared subcircuits do not affect the bounds on the number
    of distinct additive predecessors. In particular, this description does not charge for wires or impose any
    restriction on the support of a linear form.
  Suppose first that every $e_j < t_0$. By (6),
  $ sum_j d_(e_j) gt.eq frac(s, 2 n) sum_j e_j = s / 2 . $
  Apply Lemmas 4 and 5, weakening $q^(d_(e_j))$ to $q^(d_(e_j) \/ 2)$ for even degrees.
    The combined even-degree correction is at most $exp \( 4 C_1 sqrt(n) \)$. Consequently
  #[#set math.equation(numbering: n => "(10)")
   $ R \( G \) lt.eq 2 D exp \( 4 C_1 sqrt(n) \) q^(s \/ 4) lt.eq
     2 D exp \( 4 C_1 sqrt(n) \) n^(- sqrt(n) \/ 20) \, $ <eq:all-low-product>]
  where we used $q lt.eq n^(- 2 \/ 5)$ and $s gt.eq sqrt(n) \/ 2$.
  Now suppose that one factor occurrence has degree $e gt.eq t_0$.
    Expand that occurrence, using its middle sum, into at most $S$ products of $e$ homogeneous linear forms.
    All other factors remain unexpanded. This includes any other occurrences of the same gate:
    expanding one occurrence in $Q^h$ leaves its other $h - 1$ occurrences unexpanded.
  In each resulting product, the $e$ newly supplied linear factors contribute $H_1^e lt.eq
    q^(lambda e \/ 2)$ to the estimate of Lemma 4, because $d_1 = lambda$ and $1 < t_0$.
    There are at most $n \/ t_0 = 4 s$ remaining factor occurrences of degree at least $t_0$,
    and their $H$-factors are at most 5 each. The remaining low odd degrees contribute at most 1.
    The remaining low even degrees contribute at most $exp \( 4 C_1 sqrt(n) \)$ after their favorable powers of
    $q$ are dropped. Rank subadditivity over the expansion therefore yields
  #[#set math.equation(numbering: n => "(11)")
   $ R \( G \) & lt.eq 2 S D thin 5^(4 s) exp \( 4 C_1 sqrt(n) \) q^(lambda t_0 \/ 2)\
 & lt.eq 2 S D thin 5^(4 s) exp \( 4 C_1 sqrt(n) \) n^(- 3 sqrt(n) \/ 160) . $ <eq:one-high-product>]
  For the last step, $q lt.eq n^(- 2 \/ 5)$ and $lambda gt.eq 3 \/ 8$, $t_0 gt.eq
    sqrt(n) \/ 4$ imply $lambda t_0 \/ 5 gt.eq 3 sqrt(n) \/ 160$.
  Since $5^(4 s) lt.eq exp \( 4 log \( 5 \) sqrt(n) \)$, both (10) and (11) are at most
  $ 2 S D exp \( C sqrt(n) \) n^(- sqrt(n) \/ 100) $
  for an absolute $C$. Multiplication by a nonzero scalar leaves rank unchanged,
    and multiplication by zero gives rank zero. Summing the at most $S$ upper-product contributions proves the
    proposition. ◻
]

== 4 Trace moments for iterated matrix multiplication <sec:moments>

We now choose the partition of the layers and prove that its mixed operator has large rank on iterated matrix
  multiplication. The parameters remain those of (3). Arrange the groups along the matrix product in the order

#[#set math.equation(numbering: n => "(12)")
 $ V U^(ell_1) thin V U^(ell_2) dots.h.c V U^(ell_k) \, wide ell_i =
   1 + ⌊frac(i s, k)⌋ - ⌊frac(\( i - 1 \) s, k)⌋ . $ <eq:balanced-schedule>]

For sufficiently large $n$ we have $0 < s \/ k < 1$, so each $ell_i$ is either one or two.
  Their sum is $k + s = m$. Thus this word has exactly $k$ layers in $V$ and $m$ in $U$,
  and no two $V$ layers are adjacent. Every layer contributes all its $n^2$ variables to its group,
  including the variables of the first and last matrices that do not occur in the $\( 1 \, 1 \)$ entry.

Put $f = "IMM"_(n \, n)$ and $L = n - 1$. A path $P$ is a sequence $\( p_0 \, dots.h \, p_n \)$ with $p_0 = p_n =
  1$ and $p_1 \, dots.h \, p_(n - 1) in \[ n \]$. Its coordinate in layer $t$ is

$ E_t \( P \) = x_(p_(t - 1) \, p_t)^(\( t \)) . $

There are $n^L$ paths, and $f$ is the sum of the products of their layer coordinates.
  In particular, $f$ has bidegree $\( k \, m \)$, so its finite map $F_f$ is the restriction of the full operator
  $T_f = f \( partial_V \, U \)$ to $cal(H)_V \( a \) ⊗ cal(H)_U \( b \)$.

#thm([Proposition 4.1.])[
  #emph[Over $bb(C)$, for the partition (12), there is an absolute constant $C$ such that,
    for all sufficiently large $n$,
$ R \( "IMM"_(n \, n) \) gt.eq D exp \( - C sqrt(n) \) . $

]
] <prop:imm>

The proof uses two trace moments. Give every homogeneous polynomial space the inner product in which

$ z^M / sqrt(M !) \, wide \| M \| = t \, wide M ! = product_i M_i ! \, $

is an orthonormal basis. This is the finite homogeneous part of the Bargmann–Fock polynomial
  normalization #cite(label("Bargmann1962")). Use the tensor product of these inner products for the domain and
  codomain of $F_f$, and write

$ T = "tr" \( F_f^(*) F_f \) \, wide T_2 = "tr" #scale(x: 120%, y: 120%)[\(] \( F_f^(*) F_f \)^2
  #scale(x: 120%, y: 120%)[\)] . $

If $T > 0$, Cauchy–Schwarz applied to the nonzero eigenvalues of $F_f^(*) F_f$ gives

#[#set math.equation(numbering: n => "(13)")
 $ R \( f \) gt.eq T^2 / T_2 . $ <eq:trace-rank>]

Define

$ A = a / v \, wide B = b / u \, wide mu = A^k \( 1 + B \)^m . $

We will prove the bounds

$ T gt.eq D n^L mu exp \( - O \( n^(- 1 \/ 2) \) \) \, wide T_2 lt.eq D n^(2 L) mu^2 exp \( O \( sqrt(n) \) \) . $

This section reduces the second bound to a sum over two-letter words;
  the next section bounds that sum and completes Proposition 6.

=== 4.1 Occupation moments <occupation-moments>

A uniformly chosen basis vector of $cal(H)_V \( a \) ⊗ cal(H)_U \( b \)$ has two independent exponent vectors:
  one is uniform among weak compositions of $a$ into $v$ parts,
  and the other among weak compositions of $b$ into $u$ parts.
  We compare their moments with those of independent geometric variables. For an integer $d gt.eq 0$, write

$ \( z \)_d = z \( z - 1 \) dots.h.c \( z - d + 1 \) \, wide r^(overline(d)) =
  r \( r + 1 \) dots.h.c \( r + d - 1 \) \, $

with both empty products equal to one.

#thm([Lemma 4.2.])[
  #emph[Let $M = \( M_1 \, dots.h \, M_r \)$ be uniform among the weak compositions of an integer $t gt.eq
    0$ into $r gt.eq 1$ parts. For integers $d_i gt.eq 0$ and $H = sum_i d_i$,
#[#set math.equation(numbering: n => "(14)")
 $ bb(E) product_i \( M_i \)_(d_i) = frac(\( t \)_H, r^(overline(H))) product_i d_i ! . $ <eq:composition-moment>]

 The right side is zero when $H > t$.]
  #emph[Let $Z_1 \, dots.h \, Z_r$ be independent geometric variables on the nonnegative integers with mean $G =
    t \/ r$. If a polynomial $P$ has nonnegative coefficients in the basis ${ product_i \( z_i \)_(d_i) }$, then
#[#set math.equation(numbering: n => "(15)")
 $ bb(E) P \( M \) lt.eq bb(E) P \( Z \) . $ <eq:occupation-upper>]

 If $t > 0$ and all terms of that expansion have total order at most $H_0 lt.eq t \/ 2$, then also
#[#set math.equation(numbering: n => "(16)")
 $ bb(E) P \( M \) gt.eq exp (- H_0^2 / t - frac(H_0^2, 2 r)) bb(E) P \( Z \) . $ <eq:occupation-lower>]

]
] <lem:occupation-moments>

#proof[
  For $d gt.eq 0$,
  $ sum_(j gt.eq 0) \( j \)_d y^j = frac(d ! y^d, \( 1 - y \)^(d + 1)) . $
  If $H lt.eq t$, coefficient extraction therefore gives
  $ sum_(\| M \| = t) product_i \( M_i \)_(d_i) = (product_i d_i !) binom(t + r - 1, t - H) . $
  Divide by $binom(t + r - 1, t)$ to obtain (14). If $H > t$, every composition has $M_i < d_i$ for some $i$,
    so every summand is zero, as is $\( t \)_H$.
  For $G > 0$, the geometric law is
  $ Pr \( Z_i = j \) = frac(1, 1 + G) (frac(G, 1 + G))^j quad \( j gt.eq 0 \) \, $
  and its factorial moment is $bb(E) \( Z_i \)_d = d ! G^d$.
    For $H lt.eq t$ the ratio of the moment in (14) to the corresponding independent geometric moment is
  #[#set math.equation(numbering: n => "(17)")
   $ product_(j = 0)^(H - 1) frac(1 - j \/ t, 1 + j \/ r) . $ <eq:occupation-ratio>]
  It is at most one. For $H > t$ the composition moment is zero, so the same upper comparison holds.
    When $H lt.eq H_0 lt.eq t \/ 2$, the inequalities $log \( 1 - x \) gt.eq - 2 x$ for $0 lt.eq x lt.eq
    1 \/ 2$ and $log \( 1 + x \) lt.eq x$ for $x gt.eq 0$ show that the logarithm of (17) is at least
  $ - sum_(j = 0)^(H - 1) (frac(2 j, t) + j / r) gt.eq - H_0^2 / t - frac(H_0^2, 2 r) . $
  Sum these comparisons with the nonnegative coefficients of $P$.
    If $t = 0$, both $M$ and the geometric vector of mean zero are identically zero, giving (15) directly. ◻
]

The comparison is termwise and does not assert independence of the coordinates of $M$.
  We apply it separately in the two groups. By Lemma 2, total orders at most $2
  n$ satisfy the lower-bound hypothesis, and their combined logarithmic loss is

#[#set math.equation(numbering: n => "(18)")
 $ O (n^2 / a + n^2 / v + n^2 / b + n^2 / u) = O \( n^(- 1 \/ 2) \) . $ <eq:occupation-loss>]

=== 4.2 The first trace <the-first-trace>

In the chosen orthonormal bases, differentiation and multiplication act by

$ partial_i z^M / sqrt(M !) = sqrt(M_i) z^(M - upright(bold(e))_i) / sqrt(\( M - upright(bold(e))_i \) !) \, wide
  z_i z^M / sqrt(M !) = sqrt(M_i + 1) z^(M + upright(bold(e))_i) / sqrt(\( M + upright(bold(e))_i \) !) . $

The derivative is zero when $M_i = 0$; its displayed expression is used only when $M_i gt.eq 1$.
  Here $upright(bold(e))_i$ is the coordinate unit vector. In particular,
  repeated differentiation of order $d$ has coefficient $sqrt(\( M_i \)_d)$, with no additional factorial divisor.

Index a domain basis vector by the combined exponent vector $M$ on $V union U$,
  with totals $a$ and $b$ in the two groups. The summand of $F_f$ corresponding to a path $P$ shifts this vector by

$ epsilon.alt_P = - sum_(t : thin V) upright(bold(e))_(E_t \( P \)) + sum_(t : thin U) upright(bold(e))_(E_t \( P \)) $

with coefficient

#[#set math.equation(numbering: n => "(19)")
 $ c_P \( M \) = (product_(t : thin V) M_(E_t \( P \)) product_(t : thin U) \( M_(E_t \( P \)) + 1 \))^(1 \/ 2) .
   $ <eq:path-coefficient>]

A shift requiring a negative occupation contributes zero.
  We extend the coefficient notation by zero to invalid input indices as well.
  Different layers have disjoint coordinates, so a path never repeats a coordinate.
  Moreover, the shifts $epsilon.alt_P$ are distinct: a shift specifies the coordinate in every layer and hence
  every vertex of $P$.

Consequently different paths from the same input reach different output indices.
  Summing the squared entries of $F_f$ gives the exact identity

$ T = D sum_P bb(E) [product_(t : thin V) M_(E_t \( P \)) product_(t : thin U) \( M_(E_t \( P \)) + 1 \)] \, $

where the expectation is over the uniform domain indices.
  Every polynomial inside this expectation has nonnegative falling-factorial coefficients.
  Under independent geometric occupations of means $A$ and $B$, its expectation is $mu$.
  Lemma 7 and (18) therefore imply

#[#set math.equation(numbering: n => "(20)")
 $ T gt.eq D n^L mu exp \( - O \( n^(- 1 \/ 2) \) \) > 0 . $ <eq:first-trace>]

The inactive endpoint coordinates are included in the uniform compositions and in $v \, u$ throughout;
  they introduce no additional factor into this calculation.

=== 4.3 Four paths in the second trace <four-paths-in-the-second-trace>

The matrix entries of $F_f$ in these bases are real and nonnegative.
  An entry of $F_f^(*) F_f$ indexed by $M \, M'$ is the sum of $c_P \( M \)
  c_Q \( M' \)$ over pairs of paths satisfying $M + epsilon.alt_P = M' + epsilon.alt_Q$.
  Squaring its entries and summing yields

#[#set math.equation(numbering: n => "(21)")
 $ T_2 & =
   D thin bb(E)_M sum_(P \, Q \, R \, S : med epsilon.alt_P - epsilon.alt_Q = epsilon.alt_R - epsilon.alt_S)
   c_P \( M \) c_Q \( M' \) c_R \( M \) c_S \( M' \) \,\
 & #h(34mm)  M' = M + epsilon.alt_P - epsilon.alt_Q . $ <eq:four-path-trace>]

The zero convention handles invalid indices. There is no additional sum over $M'$, because $M \, P \, Q$ determine it.

The condition on four paths holds separately in each layer.
  Denoting their four coordinates in that layer by $p \, q \, r \, s$, respectively, it is $upright(bold(e))_p -
  upright(bold(e))_q = upright(bold(e))_r - upright(bold(e))_s$.
  If this difference is zero, then $p = q$ and $r = s$. Otherwise its positive and negative coordinates force $p =
  r$ and $q = s$, with $p eq.not q$. Thus there are exactly two types:

$ cal(N) & p = q = i \, quad r = s = j \,\
cal(D) & p = r = i \, quad q = s = j \, quad i eq.not j . $

The all-equal case belongs to $cal(N)$. For each compatible quadruple,
  the four-coefficient product in (21) is a product over layers of the following polynomials:

#[#set math.equation(numbering: n => "(22)")
 $ & cal(N) & cal(D)\
V & M_i M_j & M_i \( M_j + 1 \)\
U & \( M_i + 1 \) \( M_j + 1 \) & \( M_i + 1 \) M_j . $ <eq:local-polynomials>]

Indeed, the shift from $M$ to $M'$ is zero in type $cal(N)$.
  In a $V$ layer of type $cal(D)$ it is $- upright(bold(e))_i + upright(bold(e))_j$,
  so the two coefficients at $M$ contribute $M_i$ and the two at $M'$ contribute $M_j + 1$.
  In a $U$ layer of type $cal(D)$ the shift is $upright(bold(e))_i - upright(bold(e))_j$,
  giving $\( M_i + 1 \) M_j$ instead.

These polynomial formulas also account for invalid indices.
  In type $cal(D)$, a negative coordinate of $M'$ requires $M_i = 0$ in a $V$ layer or $M_j = 0$ in a $U$ layer,
  and the corresponding table entry vanishes. In type $cal(N)$, an unavailable derivative makes $M_i M_j$ zero.
  Since different layers use distinct coordinates, these exhaust the possible failures.
  Thus the product in (22) equals the zero-extended contribution.

When $i = j$ in type $cal(N)$, the required expansions are

$ z^2 = \( z \)_2 + \( z \)_1 \, wide \( z + 1 \)^2 = \( z \)_2 + 3 \( z \)_1 + 1 . $

All other table entries are products of $\( z \)_1$ and $\( z \)_1 + 1$ on distinct coordinates.
  Hence every product of local entries has nonnegative falling-factorial coefficients,
  with order at most $2 k$ in $V$ and $2 m$ in $U$. Lemma 7 bounds its expectation by the expectation for
  independent geometric occupations.

For a geometric variable $Z$ of mean $G$, $bb(E) Z^2 = 2 G^2 + G$ and $bb(E) \( Z + 1 \)^2 = 2 G^2 + 3 G + 1$.
  Dividing the geometric expectations in each $V$ layer by $A^2$ and in each $U$ layer by $\( 1 + B \)^2$, we obtain

#[#set math.equation(numbering: n => "(23)")
 $ & cal(N) & cal(D)\
V & 1 + alpha^(- 1) upright(bold(1))_({ i = j }) & alpha^(- 1)\
U & 1 + beta upright(bold(1))_({ i = j }) & beta . $ <eq:local-weights>]

Here $\( A + 1 \) \/ A = alpha^(- 1)$ and $B \/ \( B + 1 \) = beta$.
  For example, the repeated-coordinate $V$ entry is $\( 2 A^2 + A \) \/ A^2 = 1 + alpha^(- 1)$,
  so the repeated factorial contribution has been retained.
  The product of the normalizing factors over all layers is $mu^2$.

=== 4.4 A sum over pairing types <a-sum-over-pairing-types>

Assign to a compatible quadruple its type word $tau in { cal(N) \, cal(D) }^n$.
  For each such word, enlarge its class of quadruples by dropping the inequalities $i eq.not
  j$ at all $cal(D)$ layers. Keep their weights equal to $alpha^(- 1)$ and $beta$ as in (23).
  These are assigned weights on the newly admitted tuples, not their geometric occupation moments.
  Every original tuple retains its weight, and every new weight is nonnegative,
  so this enlargement gives an upper bound.

Equality of matrix-entry coordinates equates the path labels at both ends of that layer.
  The relaxed equalities can therefore be counted independently at every internal vertex.
  A layer of type $cal(N)$ pairs the paths as ${ P \, Q } \, { R \, S }$,
  while a layer of type $cal(D)$ pairs them as ${ P \, R } \, { Q \, S }$.
  At a vertex between layers of the same type, there are two free labels in $\[ n \]$.
  At a vertex between different types the two pairings together identify all four labels, leaving one free label.
  These give $n^2$ and $n$ choices, respectively, as illustrated in Figure 1.
  The two external vertex labels are fixed to $1$. Every independent choice at the internal vertices gives four
  paths, because all matrix entries are available, and every relaxed quadruple arises uniquely this way.
  The set of assignments is therefore a Cartesian product over internal vertices. If

$ w \( tau \) = \# { t in { 1 \, dots.h \, n - 1 } : tau_t eq.not tau_(t + 1) } \, $

the number of assignments is exactly $n^(2 L - w \( tau \))$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.65, 1.65), [#text(size: 9pt)[Same neighboring types#linebreak()\($cal(N) , cal(N)$\)]])
  content((7, 1.65), [#text(size: 9pt)[Different neighboring types#linebreak()\($cal(N) , cal(D)$\)]])
  circle((0, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((0, 0.85), [#text(size: 9pt)[$P$]], anchor: "south", padding: 0.1176cm)
  circle((1.1, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((1.1, 0.85), [#text(size: 9pt)[$Q$]], anchor: "south", padding: 0.1176cm)
  circle((2.2, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((2.2, 0.85), [#text(size: 9pt)[$R$]], anchor: "south", padding: 0.1176cm)
  circle((3.3, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((3.3, 0.85), [#text(size: 9pt)[$S$]], anchor: "south", padding: 0.1176cm)
  circle((5.35, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((5.35, 0.85), [#text(size: 9pt)[$P$]], anchor: "south", padding: 0.1176cm)
  circle((6.45, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((6.45, 0.85), [#text(size: 9pt)[$Q$]], anchor: "south", padding: 0.1176cm)
  circle((7.55, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((7.55, 0.85), [#text(size: 9pt)[$R$]], anchor: "south", padding: 0.1176cm)
  circle((8.65, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((8.65, 0.85), [#text(size: 9pt)[$S$]], anchor: "south", padding: 0.1176cm)
  line((0, 0.75), (1.1, 0.75), stroke: (paint: rgb("#0000ff"), thickness: 1.2pt, miter-limit: 10))
  line((2.2, 0.75), (3.3, 0.75), stroke: (paint: rgb("#0000ff"), thickness: 1.2pt, miter-limit: 10))
  line((5.35, 0.75), (6.45, 0.75), stroke: (paint: rgb("#0000ff"), thickness: 1.2pt, miter-limit: 10))
  line((7.55, 0.75), (8.65, 0.75), stroke: (paint: rgb("#0000ff"), thickness: 1.2pt, miter-limit: 10))
  bezier((5.35, 0.75), (7.55, 0.75), (6.007, 0.1985), (6.893, 0.1985), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  bezier((6.45, 0.75), (8.65, 0.75), (7.107, 0.1985), (7.993, 0.1985), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((1.65, -0.35), [#text(size: 9pt)[Two independent labels#linebreak()$n^2$ choices]])
  content((7, -0.35), [#text(size: 9pt)[All four labels equal#linebreak()$n$ choices]])
})],
  caption: [Figure 1: Equality constraints on the four path labels at one internal vertex after the $cal(D)$ inequalities are relaxed. Type $cal(N)$ pairs $P \, Q$ and $R \, S$ (solid edges); type $cal(D)$ pairs $P \, R$ and $Q \, S$ (dashed edges). Equal neighboring types leave two free labels. A change of type identifies all four, contributing a factor $n^(- 1)$ to the count. The same two-label count holds for neighboring types $cal(D) \, cal(D)$. ],
) <fig:pairings>

For a layer $t$ of type $cal(N)$, let $h_t$ be the number of its end vertices that are internal and lie between
  two layers of type $cal(N)$. At each of these vertices the two free labels are independent and uniform in
  $\[ n \]$, so they agree with probability $1 \/ n$. At an external vertex or an interface between different
  types the labels already agree. Consequently the two coordinates $i \,
  j$ of this $cal(N)$ layer agree with probability $n^(- h_t)$.

The end-vertex sets of different $V$ layers are disjoint, because no two $V$ layers are adjacent in (12).
  Under the uniform distribution on the Cartesian product of relaxed vertex assignments,
  the equality events just described are therefore independent for the $cal(N)$ layers in $V$. Their average weight is

$ product_(t : thin tau_t = cal(N) \, med t upright(" in ") V) \( 1 + alpha^(- 1) n^(- h_t) \) . $

For each $cal(N)$ layer in $U$ we instead bound its weight pointwise by $1 + beta$,
  so no independence assertion for these layers is needed.

Write $d_V \( tau \)$ and $d_U \( tau \)$ for the numbers of $cal(D)$ layers in $V$ and $U$, respectively,
  and put $N_V \( tau \) = { t : t upright(" is in ") V \, med tau_t = cal(N) }$.
  Combining the occupation comparison, the relaxed assignment count, and the preceding weight estimates proves

#[#set math.equation(numbering: n => "(24)")
 $ frac(T_2, D n^(2 L) mu^2) lt.eq \( 1 + beta \)^m sum_(tau in { cal(N) \, cal(D) }^n) n^(- w \( tau \))
   alpha^(- d_V \( tau \)) beta^(d_U \( tau \)) product_(t in N_V \( tau \)) \( 1 + alpha^(- 1) n^(- h_t) \) .
   $ <eq:moment-reduction>]

Since $beta lt.eq 2 \/ sqrt(n)$, the factor $\( 1 + beta \)^m$ is $exp \( O \( sqrt(n) \) \)$.
  It remains to prove the same bound for the word sum in (24).
  Lemma 8 establishes this using the spacing of the $V$ layers and the balanced schedule.

== 5 Bounding the path-type sum <sec:path-sum>

We now bound the sum in (24). The coincidence factor at an interior $V$ layer can be large only when both
  neighboring layers have the opposite type. Removing these isolated positions and bounding the endpoint factors
  will leave a sum controlled by the number of runs of $cal(D)$ layers.

#thm([Lemma 5.1.])[
  #emph[For all sufficiently large $n$, use the layer schedule (12) and the parameters $alpha \, beta \,
    rho$ of (3). For a word $tau in { cal(N) \, cal(D) }^n$, let $w \( tau \)$ be its number of switches,
    let $d_V \( tau \) \, d_U \( tau \)$ count its $cal(D)$ positions in the respective variable groups,
    and let $N_V \( tau \)$ be its set of $cal(N)$ positions in group $V$.
    For $t in N_V \( tau \)$, let $h_t$ be the number of internal vertices adjacent to layer $t$ whose two
    incident layers both have type $cal(N)$. There is an absolute constant $C$ such that
#[#set math.equation(numbering: n => "(25)")
 $ sum_(tau in { cal(N) \, cal(D) }^n) n^(- w \( tau \)) alpha^(- d_V \( tau \)) beta^(d_U \( tau \))
   product_(t in N_V \( tau \)) #scale(x: 120%, y: 120%)[\(] 1 +
   alpha^(- 1) n^(- h_t) #scale(x: 120%, y: 120%)[\)] lt.eq exp \( C sqrt(n) \) . $ <eq:word-sum>]

]
] <lem:word-sum>

#proof[
  Denote the summand on the left of (25) by $W \( tau \)$. Call a position isolated if it is an interior $V$ layer
    with type $cal(N)$ and both its neighbors have type $cal(D)$.
    Change every isolated position to type $cal(D)$, obtaining a word $F \( tau \)$.
    No two $V$ layers are adjacent, so none of their neighbors is changed.
    It follows that $F \( tau \)$ has no isolated position, and the values of $h_t$ at its remaining $cal(N)_V$
    positions are unchanged.
  Each changed position has $h_t = 0$ before the change. Its two incident switches disappear, its factor $1 +
    alpha^(- 1)$ disappears, and a factor $alpha^(- 1)$ is introduced.
    Switches removed at distinct positions are distinct, even when those positions are separated by only one $U$
    layer. Thus, if $j$ positions were changed,
  #[#set math.equation(numbering: n => "(26)")
   $ frac(W \( tau \), W \( F \( tau \) \)) = (frac(1 + alpha, n^2))^j . $ <eq:isolated-flip>]
  The preimages can be counted exactly. For a word $y$ with no isolated position,
    let $E \( y \)$ be the set of interior $V$ positions whose type and both neighboring types are $cal(D)$.
    Its preimages are obtained by changing an arbitrary subset of $E \( y \)$ to $cal(N)$.
    These positions are nonadjacent, their neighbors remain unchanged,
    and the operation creates precisely the isolated positions that are changed back by $F$. Consequently
  $ sum_(tau : F \( tau \) = y) W \( tau \) = W \( y \) (1 + frac(1 + alpha, n^2))^(\| E \( y \) \|) lt.eq
    W \( y \) \( 1 + 2 \/ n^2 \)^k \, $
  where $0 < alpha < 1$ and $\| E \( y \) \| lt.eq k$ were used.
  In a word with no isolated position, every interior $cal(N)_V$ position has $h_t gt.eq 1$.
    An endpoint position can have $h_t = 0$; there is at most one endpoint $V$ layer,
    since the schedule starts with $V$ and ends with $U$. Hence
  #[#set math.equation(numbering: n => "(27)")
   $ sum_tau W \( tau \) lt.eq \( 1 + 2 \/ n^2 \)^k \( 1 + alpha^(- 1) \) \( 1 + alpha^(- 1) \/ n \)^k Z \, wide
     Z = sum_tau n^(- w \( tau \)) alpha^(- d_V \( tau \)) beta^(d_U \( tau \)) . $ <eq:correction-removal>]
  Here we enlarged the final sum from words without isolated positions to all words.
    By Lemma 2, $alpha^(- 1) lt.eq sqrt(n)$ and $k lt.eq n \/ 2$, so the logarithm of the prefactor is at most
  $ frac(2 k, n^2) + log \( 1 + sqrt(n) \) + k / sqrt(n) = O \( sqrt(n) \) . $
  It remains to bound $Z$. A run of $cal(D)$ positions is a maximal nonempty interval of such positions.
    Each interior run has two switches, contributing $n^(- 2)$,
    whereas a run meeting exactly one endpoint has one switch.
    We will show that the product of layer weights on every run is at most $n$ times a rounding factor.
    Thus the switch costs leave a factor $n^(- 1)$ for every interior run.
  The relation between $alpha$ and $beta$ reduces the layer weight to a discrepancy between the two layer counts.
    For an interval $I$ of consecutive layers, define
  $ d \( I \) = \# { V upright(" layers in ") I } - rho thin \# { U upright(" layers in ") I } . $
  We claim that
  #[#set math.equation(numbering: n => "(28)")
   $ d \( I \) lt.eq 1 + rho quad upright("for every interval ") I \, wide d \( \[ n \] \) =
     0 . $ <eq:interval-discrepancy>]
  Indeed, $r$ consecutive complete chunks of the schedule, starting after chunk $j$,
    contain $r$ layers in $V$ and $r + E$ layers in $U$, where
  $ E = ⌊frac(\( j + r \) s, k)⌋ - ⌊frac(j s, k)⌋ \, wide \| E - r s \/ k \| < 1 . $
  Using $m = k + s$ and $rho = k \/ m$, their discrepancy is
  $ r - rho \( r + E \) = rho \( r s \/ k - E \) < rho . $
  An interval spanning several chunks consists of consecutive complete chunks,
    possibly preceded by a proper terminal part of one chunk and followed by a proper initial part of another.
    The terminal part contains only $U$ layers and has nonpositive discrepancy;
    the initial part contains at most one $V$ layer and has discrepancy at most $1$.
    An interval contained in a single chunk also has discrepancy at most $1$.
    This proves the first assertion of (28). The second is the identity $k - rho m = 0$.
  By Lemma 2, the product of layer weights on a $cal(D)$ run $I$ is at most
  $ alpha^(- \# V \( I \)) beta^(\# U \( I \)) lt.eq alpha^(- d \( I \)) exp \( C \# U \( I \) \/ b \) lt.eq
    n exp \( C \# U \( I \) \/ b \) . $
  For the last inequality, the sign of $d \( I \)$ causes no difficulty:
  $ alpha^(- d \( I \)) lt.eq alpha^(- \( 1 + rho \)) lt.eq n^(\( 1 + rho \) \/ 2) lt.eq n \, $
  since $0 < alpha < 1$, $alpha gt.eq n^(- 1 \/ 2)$, and $rho < 1$.
    The runs are disjoint, so all their rounding factors together contribute at most $exp \( C n \/ b \)$.
  Consider a mixed word, meaning one containing both types.
    Let $r$ be its number of interior $cal(D)$ runs and $e$ its number of $cal(D)$ runs meeting an endpoint.
    A mixed word has no run meeting both endpoints, so $e in { 0 \, 1 \, 2 }$ and
  $ w \( tau \) = 2 r + e . $
  There are $r + e$ runs. Their weight, including the switch factors, is therefore at most
  $ n^(- \( 2 r + e \)) n^(r + e) exp \( C n \/ b \) = n^(- r) exp \( C n \/ b \) . $
  The initial type and the set of switch positions uniquely specify a word.
    Thus at most $2 binom(n - 1, 2 r + e)$ words have given values of $r \, e$.
    Taking binomial coefficients outside their usual range to be zero, the mixed-word contribution to $Z$ is at most
  $ exp \( C n \/ b \) sum_(e = 0)^2 sum_(r gt.eq 0) 2 binom(n - 1, 2 r + e) n^(- r) lt.eq
    6 n^2 exp \( sqrt(n) + C n \/ b \) . $
  To see the last inequality, for each $e in { 0 \, 1 \, 2 }$ use
  $ sum_(r gt.eq 0) binom(n - 1, 2 r + e) n^(- r) lt.eq sum_(r gt.eq 0) frac(n^(r + e), \( 2 r + e \) !) lt.eq
    n^2 sum_(r gt.eq 0) frac(\( sqrt(n) \)^(2 r), \( 2 r \) !) lt.eq n^2 exp \( sqrt(n) \) . $
  The constant word $cal(N)^n$ has weight $1$. The other constant word has weight
  $ alpha^(- k) beta^m lt.eq alpha^(- k + rho m) exp \( C m \/ b \) = exp \( C m \/ b \) . $
  It follows that
  $ Z lt.eq exp \( C n \/ b \) #scale(x: 120%, y: 120%)[\(] 2 +
    6 n^2 exp \( sqrt(n) \) #scale(x: 120%, y: 120%)[\)] = exp \( O \( sqrt(n) \) \) \, $
  where $b = Theta \( n^(5 \/ 2) \)$. Combining this with (27) proves the lemma. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 6.] Lemma 8, applied to (24), gives
  $ T_2 lt.eq D n^(2 L) mu^2 \( 1 + beta \)^m exp \( C sqrt(n) \) lt.eq D n^(2 L) mu^2 exp \( C' sqrt(n) \) \, $
  because $beta lt.eq 2 \/ sqrt(n)$ and $m lt.eq n$. By (20),
  $ T gt.eq D n^L mu exp \( - C'' n^(- 1 \/ 2) \) > 0 . $
  For the positive semidefinite matrix $H = F_f^(*) F_f$, the Cauchy–Schwarz inequality applied to its nonzero
    eigenvalues yields
  $ \( "tr" H \)^2 lt.eq "rank" \( H \) thin "tr" \( H^2 \) . $
  Since $T > 0$ and $"rank" \( H \) = "rank" \( F_f \) = R \( f \)$, the two moment bounds imply
  $ R \( f \) gt.eq T^2 / T_2 gt.eq D exp \( - C''' sqrt(n) \) . $
  This is the assertion of Proposition 6. ◻
]

== 6 Completion and consequences <sec:completion>

We compare the two rank bounds for the balanced partition of the matrix layers.
  We then transfer the resulting lower bound to every field of characteristic zero and give an elementary upper
  bound of the same order in the exponent.

#proof[
  Let a syntactically homogeneous $Sigma Pi Sigma Pi Sigma$ circuit over $bb(C)$ of size $S$ compute $f =
    "IMM"_(n \, n)$. Use the partition from Proposition 6. For all sufficiently large $n$,
    Propositions 6 and 3 give absolute constants $C_1 \, C_2 > 0$ such that
  $ D exp \( - C_1 sqrt(n) \) lt.eq R \( f \) lt.eq 2 S^2 D exp \( C_2 sqrt(n) \) n^(- sqrt(n) \/ 100) . $
  Since $D > 0$, cancellation and square roots yield
  $ S gt.eq 2^(- 1 \/ 2) exp (- frac(C_1 + C_2, 2) sqrt(n)) n^(sqrt(n) \/ 200) . $
  After increasing the absolute threshold for $n$, the exponential factor and $2^(- 1 \/ 2)$ are absorbed by
    $n^(sqrt(n) \/ 400)$. Therefore $S gt.eq n^(sqrt(n) \/ 400)$, as asserted. ◻
]

The inner products in Proposition 6 were used over $bb(C)$,
  but its conclusion concerns the rank of a matrix defined over the integers.
  This gives a field-independent consequence.

#thm([Corollary 6.1.])[
  #emph[There is an absolute integer $n_0$ such that, for every field $K$ of characteristic zero and every $n
    gt.eq n_0$, every syntactically homogeneous $Sigma Pi Sigma Pi
    Sigma$ circuit over $K$ computing $"IMM"_(n \, n)$ has at least $n^(sqrt(n) \/ 400)$ gates.
    Bottom fan-in and bottom support are unrestricted.]
] <cor:characteristic-zero>

#proof[
  Fix $n$ and the parameters and partition used in Proposition 6.
    Express $F_("IMM"_(n \, n))$ in ordinary monomial bases of both its domain and codomain.
    The coefficients of $"IMM"_(n \, n)$ are integers, multiplication has integral matrix entries,
    and differentiation has integral matrix entries: a repeated derivative acts by a product of falling factorials
    of nonnegative integers. Consequently this finite matrix has entries in $bb(Z)$.
  Every minor is an integer. Under the natural map $bb(Z) arrow.r K$,
    an integer is zero precisely when it was zero in $bb(Z)$, because $K$ has characteristic zero.
    The same holds over $bb(C)$. Thus the largest order of a nonzero minor, and hence the rank,
    is the same over $K$ and over $bb(C)$. Changing from ordinary monomials to the normalized bases used in the
    complex moment argument does not change that complex rank.
    Proposition 6 therefore supplies its lower bound over $K$.
    Proposition 3 holds over every field, with the same constants.
    The preceding comparison proves the corollary with an absolute threshold independent of $K$. ◻
]

A direct block construction gives an upper bound of the form $n^(sqrt(n) + O \( 1 \))$.
  The next count includes variable leaves and permits the computed block entries to be shared.

#thm([Proposition 6.2.])[
  #emph[Let $K$ be any field and $n gt.eq 2$. Put
$ t = ceil.l sqrt(n) ceil.r \, wide r = ⌈n / t⌉ . $

 There is a syntactically homogeneous $Sigma Pi Sigma Pi Sigma$ circuit over $K$ computing $"IMM"_(n \, n)$ whose
   number of gates, including leaves, is at most
#[#set math.equation(numbering: n => "(29)")
 $ 2 n^3 + r n^2 + r n^(t + 1) + n^(r - 1) + 1 lt.eq n^(sqrt(n) + 4) . $ <eq:upper-gate-bound>]

]
] <prop:upper>

#proof[
  Partition the $n$ consecutive matrix layers into $r$ nonempty consecutive blocks, with lengths $ell_1 \,
    dots.h \, ell_r lt.eq t$. For block $j$, let $Y^(\( j \))$ be the product of its matrices.
    An entry $Y_(a \, b)^(\( j \))$ is a sum of $n^(ell_j - 1)$ monomials,
    one for each choice of the internal indices of that block, and each monomial has degree $ell_j$.
  At the bottom sum layer, use one identity sum gate for each variable, sharing it among all its uses.
    This requires at most $n^3$ leaves and $n^3$ bottom sum gates.
    For every block and each of its $n^2$ entries, compute the displayed monomials by lower product gates and add
    them at a middle sum gate. Thus block $j$ uses $n^(ell_j + 1)$ lower product gates and $n^2$ middle sum gates.
    When $ell_j = 1$, the product and sum gates have one input; all five computational layers are still present.
  Set $a_0 = a_r = 1$. Matrix multiplication now gives
  $ "IMM"_(n \, n) = sum_(\( a_1 \, dots.h \, a_(r - 1) \) in \[ n \]^(r - 1)) product_(j = 1)^r
    Y_(a_(j - 1) \, a_j)^(\( j \)) . $
  For $r = 1$ the right-hand side means the single entry $Y_(1 \, 1)^(\( 1 \))$.
    Use one upper product gate for each of the $n^(r - 1)$ summands, and one output sum gate.
    Each block-entry gate is shared by all summands that use it.
    The upper products have formal degree $ell_1 + dots.h.c + ell_r = n$,
    and every middle sum adds monomials of its block’s degree.
    The bottom sums have degree one, so the whole circuit is syntactically homogeneous.
    Any gates that do not feed the output may be discarded.
  The gate count is at most
  $ 2 n^3 + r n^2 + sum_(j = 1)^r n^(ell_j + 1) + n^(r - 1) + 1 \, $
  which proves the first bound in (29). For the second, note that $r lt.eq t lt.eq n$.
    If $n gt.eq 3$, then $t gt.eq 2$ and the first bound is at most
  $ 3 n^3 + n^(t + 2) + n^(t - 1) + 1 lt.eq 3 n^(t + 2) lt.eq n^(t + 3) lt.eq n^(sqrt(n) + 4) . $
  Here $3 n^3 lt.eq n^(t + 2)$ and $n^(t - 1) + 1 lt.eq n^(t + 2)$ justify the middle estimate.
    For $n = 2$, the first bound is $30 lt.eq 2^5$ and $t = 2$, giving the same conclusion. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
