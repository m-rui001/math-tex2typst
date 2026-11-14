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

#align(center)[#text(size: 16pt, weight: "bold")[Exact Fourier certificates for complex Hadamard matrices of order six]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A complex Hadamard matrix of order six is a matrix $H in bb(T)^(6 times 6)$ with $H^(*) H = 6 I$, where $bb(T) = { z in bb(C) : \| z \| = 1 }$. Its columns become an orthonormal basis after normalization by $1 \/ sqrt(6)$. The same columns are also points of the torus $bb(T)^6$, and their character sums record constraints that orthogonality places on their phases. We study the normalized sums

#[#set math.equation(numbering: n => "(1)")
 $ g_H \( a \) = 1 / 6 sum_(k = 0)^5 product_(i = 0)^5 H \( i \, k \)^(a_i) \, #h(2em) a in bb(Z)^6 \, quad sum_(i = 0)^5 a_i = 0 . $ <eq:g-definition>]

The balancing condition makes these sums invariant under multiplying individual columns by phases. Write $e_0 \, dots.h \, e_5$ for the standard coordinate vectors. Orthogonality gives $g_H \( e_i - e_j \) = 0$ for $i eq.not j$. A more restrictive vanishing at the charge

$ alpha = \( 1 \, 1 \, 1 \, - 1 \, - 1 \, - 1 \) $

was conjectured by Matolcsi, Ruzsa, and Weiner #cite(label("MatolcsiRuzsaWeiner2013")) Conjecture 2.3. It links a degree-six character to the structure of an individual Hadamard matrix, without assuming that the matrix belongs to a larger family of unbiased bases.

The conjecture has one exceptional equivalence class. Here two Hadamard matrices are equivalent if they differ by row and column permutations and by multiplication of individual rows and columns by elements of $bb(T)$. Put $omega = exp \( 2 pi upright(i) \/ 3 \)$, and define $T = \( omega^(t_(i j)) \)_(i \, j = 0)^5$ by

#[#set math.equation(numbering: n => "(2)")
 $ t_(i j) = cases(delim: "{", 0 \, & i = 0 upright(" or ") j = 0 upright(" or ") i = j \,, 1 \, & i \, j in { 1 \, dots.h \, 5 } \, quad i - j equiv plus.minus 1 med \( mod med 5 \) \,, - 1 \, & upright("otherwise") .) $ <eq:cubic-matrix>]

This is the cubic matrix in Tao’s construction #cite(label("Tao2004")) p. 254; the same representative already appears in Moorhouse’s study of $2$-transitive complex Hadamard matrices #cite(label("Moorhouse2001")) Example 1.1. Its five noninitial indices form a cycle: adjacent indices carry the exponent $1$ and nonadjacent distinct indices carry $- 1$. The matrix and its entrywise square are both Hadamard.

#thm([Theorem 1.1.])[
  (Fourier vanishing).  #emph[Let $H$ be a complex Hadamard matrix of order six. If $H$ is not equivalent to the cubic matrix $T$ in (2), then
$ g_H \( pi alpha \) = 0 #h(2em) upright("for every coordinate permutation ") pi . $

]
] <thm:fourier>

Theorem 1 proves the conjecture for arbitrary complex Hadamard matrices. The normalization in (1) divides the character sums used in #cite(label("MatolcsiRuzsaWeiner2013")) by six and therefore leaves the vanishing assertion unchanged. Multiplying rows by phases multiplies each character by a unit scalar; together with the balancing condition, this shows that the assertion respects the stated equivalence relation.

=== 1.1 Fourier methods and mutually unbiased bases <fourier-methods-and-mutually-unbiased-bases>

Two orthonormal bases in $bb(C)^d$ are mutually unbiased if every inner product between their vectors has modulus $d^(- 1 \/ 2)$. Such bases describe complementary measurements and arise in quantum state determination #cite(label("Ivanovic1981")) #cite(label("WoottersFields1989")). A family contains at most $d + 1$ bases, and complete families attaining that bound exist in prime-power dimensions #cite(label("WoottersFields1989")). The first dimension outside that construction is six. Write $N \( 6 \)$ for the maximum size of a mutually unbiased family in $bb(C)^6$.

Fixing one basis identifies every other unbiased basis with a complex Hadamard matrix. Matolcsi developed a Fourier and Delsarte approach to the resulting constraints on torus points #cite(label("Matolcsi2012")). Matolcsi, Ruzsa, and Weiner developed identities for the associated character sums and formulated the vanishing conjecture addressed here #cite(label("MatolcsiRuzsaWeiner2013")). Maxwell and Brierley proved that vanishing for the Karlsson family #cite(label("MaxwellBrierley2015")) Theorem 4.1. Theorem 1 removes the family restriction. The exceptional matrix is usually denoted $S_6$ in the Hadamard literature #cite(label("TadejZyczkowski2006")) Section 5.6.4; Section 4 gives the precise identification with (2).

The structural step has a separate antecedent. Lisoněk introduced #emph[S-Hadamard matrices], for which both $H$ and $H^(compose 2)$ are Hadamard #cite(label("Lisonek2019")) Definition 2.1. Phangara conjectured that every order-six S-Hadamard matrix is equivalent to the cubic example #cite(label("Phangara2026")) Conjecture 3.1.6. Proposition 7 proves this assertion. The uniqueness of the cube-root class itself appears in the Butson classification of Lampio, Östergård, and Szöllősi #cite(label("LampioOstergardSzollosi2020")) Theorem 4.1 and Table 2 and in Liang, Chen, Long, and Qiu #cite(label("LiangChenLongQiu2021")) Lemma 10. The additional step here derives cube-root entries from the two Hadamard conditions on arbitrary phases.

There is also a substantial history of positive certificates for the MUB problem. Brierley and Weigert formulated polynomial and semidefinite approaches #cite(label("BrierleyWeigert2010SDP")). Matolcsi and Weiner strengthened the Delsarte witness method for prescribed Hadamard families #cite(label("MatolcsiWeiner2015")), and Kolountzakis, Matolcsi, and Weiner developed the positive-definite-function approach on compact groups #cite(label("KolountzakisMatolcsiWeiner2018")). Gribling and Polak applied permutation symmetry to positive moment matrices in a tracial noncommutative formulation of the MUB problem #cite(label("GriblingPolak2024")). Our finite invariant-moment certificates belong to this line of work. Their specific character identities and shared-column test functions are described below.

Bandeira, Doppelbauer, and Kunisky proved that positive-definite polynomials of degree at most six in the entries of a single unitary transition matrix and their conjugates cannot improve the seven-basis bound in dimension six #cite(label("BandeiraDoppelbauerKunisky2022")) Theorem 1.10. That result concerns its specified single-matrix relaxation. The mixed certificate here uses products of character sums from several transitions and relations of higher total order.

The individual-matrix statement also supplies an input to a second exact certificate within this paper. It yields the following complete-family obstruction.

#thm([Theorem 1.2.])[
  (No complete family).  #emph[There do not exist seven orthonormal bases $B_r = \( b_(r \, 0) \, dots.h \, b_(r \, 5) \)$ of $bb(C)^6$, $1 lt.eq r lt.eq 7$, such that
$ \| chevron.l b_(r \, i) \, b_(s \, j) chevron.r #scale(x: 120%, y: 120%)[\|]^2 = 1 / 6 #h(2em) \( r eq.not s \, med 0 lt.eq i \, j lt.eq 5 \) . $

]
] <thm:main>

By Weiner’s completion theorem, any $d$ mutually unbiased bases in $bb(C)^d$ extend to a complete family #cite(label("Weiner2013")) Corollary 3.4. Theorem 2 therefore gives $N \( 6 \) lt.eq 5$. Under its stated binary64 arithmetic and compiler conditions and complete-execution certificate contract, the companion paper #cite(label("OpenAI2026MUBMaximum")) Theorem 1.1, Section 7 and Appendix A gives the sharper value $N \( 6 \) = 3$. The Fourier theorem concerns each individual Hadamard matrix; its content is distinct from a bound on the number of bases. For transitions in MUB triplets, Matolcsi, Matszangosz, Varga, and Weiner conjecture both this vanishing and a further condition coupling characters at $3 alpha$ for $H$ and $H^(*)$ #cite(label("MatolcsiEtAl2025")) Conjecture 2. Their route to $N \( 6 \) = 3$ also uses a separate conjecture excluding the Szöllősi family from quadruplets #cite(label("MatolcsiEtAl2025")) Conjecture 3 and Proposition 4.2.

=== 1.2 Proof strategy <proof-strategy>

The main difficulty is to obtain a universal statement about phases from orthogonality without restricting the matrix to a parametrized family. We average monomials in its entries over distinct row and column indices. Summing a row with one exponent $+ 1$ and one exponent $- 1$ against orthogonality expresses its moment in terms of moments with merged rows. A formal seven-row version has no unused physical row; it gives a homogeneous relation among six-row moments. Products of character sums expand into these injective moments by grouping column samples according to which indices coincide.

The first certificate adds an auxiliary absolute square to a product $\| g_H \( alpha \) g_H \( q \) \|^2$ and proves that their finite average is zero. Every summand is nonnegative, so the product vanishes for every row ordering. Two choices of $q$ force a dichotomy: either all permuted $alpha$ characters vanish, or the entrywise square $H^(compose 2)$ is Hadamard. In the latter case, Newton’s identities constrain every row ratio to two rotated triples of cube roots. An orthogonality argument then forces the whole dephased matrix to be cubic, and a five-cycle classifies it as $T$. This proves Theorem 1.

The complete-family obstruction requires more than the vanishing condition on one matrix. We first exclude a cubic transition matrix from such a family by an exact finite character calculation. For the remaining case, we average products of character sums over ordered basis pairs and triples. Sampling one additional column shared by all test functions expresses their Gram entries as combinations of three-factor moments. Six explicitly specified positive quadratic forms have a combined expansion whose constant term dominates, with negative sign, the sum of the absolute values of all other coefficients. Since every retained moment has absolute value at most one, this contradicts positivity.

The certificates are finite rational identities. Modular elimination locates candidate substitutions, and exact integer multiplication proves that they hold for every actual moment vector. The calculation does not require those moment values to be rational. Section 7 explains this distinction and traces the verifier’s operations back to the sampled variables.

Section 2 fixes the character notation. Section 3 constructs the single-matrix certificate and its dichotomy. Section 4 classifies the cubic alternative and proves Theorem 1. Section 5 derives the complete-family identities and excludes a cubic pair. Section 6 constructs the shared-column Gram certificate and proves Theorem 2. Section 7 verifies both exact calculations, and Appendix 8 prints the complete standard-library Python verifier, including all integer weights.

== 2 Characters and phase invariance <sec:preliminaries>

The Hermitian inner product is conjugate-linear in its first argument. We index the coordinates of $bb(C)^6$ by $0 \, dots.h \, 5$, and write $e_0 \, dots.h \, e_5$ for the standard coordinate vectors. For a square Hadamard matrix, $H^(*) H = 6 I$ also implies $H H^(*) = 6 I$. The equivalence relation and normalized character $g_H$ are those of Section 1. Every Hadamard matrix can be #emph[dephased], meaning that its first row and first column are all ones, by multiplying rows and columns by elements of $bb(T)$.

A #emph[charge] is a vector $a in bb(Z)^6$ with $sum_i a_i = 0$. Its order and character are

$ "ord" \( a \) = sum_(a_i > 0) a_i \, #h(2em) x^a = product_(i = 0)^5 x_i^(a_i) quad \( x in bb(T)^6 \) . $

For the column characters in (1), put

$ D = { e_i - e_j : 0 lt.eq i \, j lt.eq 5 \, med i eq.not j } . $

We retain $alpha = \( 1 \, 1 \, 1 \, - 1 \, - 1 \, - 1 \)$ from the introduction. In particular, $\| g_H \( a \) \| lt.eq 1$, $g_H \( 0 \) = 1$, and $g_H \( - a \) = overline(g_H \( a \))$. A permutation $p$ acts by $\( P_p a \)_i = a_(p \( i \))$. When we write a permuted charge, all coordinates are permuted together; we also abbreviate $P_p a$ as $p a$.

Balanced charges make $g_H$ invariant under column phases. Multiplying row $i$ by $u_i$ multiplies $g_H \( a \)$ by $u^a$. Thus products whose total charge is zero are unchanged by row phases as well. These elementary observations will justify dephasing and the invariant moments below.

== 3 Injective moments and a dichotomy for one Hadamard matrix <sec:pair>

For a matrix $H$ and a row permutation $pi$, write $H^pi \( i \, k \) = H \( pi \( i \) \, k \)$. The following dichotomy is the single-matrix step in the proof of Theorem 1.

#thm([Corollary 3.1.])[
  (Dichotomy).  #emph[For every $6 times 6$ Hadamard matrix $H$, at least one of the following conditions holds:]
  + #emph[$g_(H^pi) \( alpha \) = 0$ for every row permutation $pi$;]
  + #emph[the entrywise square $H^(compose 2)$ is a Hadamard matrix.]
] <cor:dichotomy>

Condition (M) is the Fourier condition in Matolcsi, Ruzsa, and Weiner’s conjecture #cite(label("MatolcsiRuzsaWeiner2013")) Conjecture 2.3; Section 4 will classify condition (C). We prove the dichotomy from an exact identity between averages of nonnegative quantities, using only orthogonality and unimodularity of one matrix.

=== 3.1 Injective moments <injective-moments>

Fix a $6 times 6$ Hadamard matrix $H$. An #emph[exponent matrix] is an integer matrix $A = \( A_(u v) \)$ whose row sums and column sums are all zero. For $A$ of size $p times q$, with $p \, q lt.eq 6$, define

#[#set math.equation(numbering: n => "(3)")
 $ m_H \( A \) = bb(E) thin "Re" #h(-0.16667em) [product_(u = 0)^(p - 1) product_(v = 0)^(q - 1) K #scale(x: 120%, y: 120%)[\(] rho \( u \) \, kappa \( v \) #scale(x: 120%, y: 120%)[\)]^(A_(u v))] . $ <eq:injective-moment>]

Here $K$ is $H$ or $H^(sans(T))$ with probability $1 \/ 2$ each, $rho : { 0 \, dots.h \, p - 1 } arrow.r { 0 \, dots.h \, 5 }$ and $kappa : { 0 \, dots.h \, q - 1 } arrow.r { 0 \, dots.h \, 5 }$ are uniformly chosen injections, and these three choices are independent. Negative exponents are well defined because every matrix entry has modulus one. We set $m_H \( diameter \) = 1$ for the empty exponent matrix. In particular,

#[#set math.equation(numbering: n => "(4)")
 $ \| m_H \( A \) \| lt.eq 1 . $ <eq:injective-bound>]

Permuting the rows or columns of $A$ leaves this expectation unchanged. Replacing $A$ by $- A$ conjugates the monomial and therefore leaves its real part unchanged. Also $m_H \( A^(sans(T)) \) = m_H \( A \)$: transposition exchanges the two injections and interchanges the equally weighted choices of $K$. Finally, a zero row or column can be deleted. Indeed, its factor is one, and deleting a coordinate of a uniformly chosen injection leaves a uniformly chosen injection on the remaining coordinates. These facts justify all the identifications of exponent matrices used below.

For a balanced integer row $a$, its order is $"ord" \( a \) = sum_(j : a_j > 0) a_j$, consistently with the notation for charges. The following relation eliminates any row of order one.

#thm([Lemma 3.2.])[
  (Contraction of an order-one row).  #emph[Let $A$ be a balanced exponent matrix with $p$ rows and $q lt.eq 6$ columns, and suppose row $i$ has order one. For $ell eq.not i$, let $A_(i arrow.r ell)$ be obtained by adding row $i$ to row $ell$ and then deleting row $i$. If $p lt.eq 6$, then
#[#set math.equation(numbering: n => "(5)")
 $ \( 7 - p \) m_H \( A \) = - sum_(0 lt.eq ell < p\
ell eq.not i) m_H \( A_(i arrow.r ell) \) . $ <eq:injective-contraction>]

 If $p = 7$, the valid relation is instead
#[#set math.equation(numbering: n => "(6)")
 $ sum_(0 lt.eq ell < 7\
ell eq.not i) m_H \( A_(i arrow.r ell) \) = 0 . $ <eq:seven-row-contraction>]

 Every moment in (6) has at most six rows; no moment with seven injectively sampled rows is defined or used. The analogous relations hold for columns by transposition.]
] <lem:contraction>

#proof[
  Since row $i$ is balanced and has order one, it has a $+ 1$ in one column $v_(+)$, a $- 1$ in another column $v_(-)$, and zeros elsewhere. Fix $K$, the column injection $kappa$, and an injective assignment of the other $p - 1$ rows. Write $M$ for the product of the factors contributed by those rows. The columns $kappa \( v_(+) \)$ and $kappa \( v_(-) \)$ are distinct, so column orthogonality gives
  $ M sum_(t = 0)^5 K #scale(x: 120%, y: 120%)[\(] t \, kappa \( v_(+) \) #scale(x: 120%, y: 120%)[\)] overline(K #scale(x: 120%, y: 120%)[\(] t \, kappa \( v_(-) \) #scale(x: 120%, y: 120%)[\)]) = 0 . $
  Both choices of $K$ are Hadamard matrices: for a square matrix, column orthogonality also gives row orthogonality.
  When $p lt.eq 6$, there are $7 - p$ row labels not yet assigned. The sum over those labels is $7 - p$ times the conditional expectation obtained by assigning row $i$ uniformly to an unused label. Averaging the already fixed assignments produces $\( 7 - p \) m_H \( A \)$. For each occupied label, say that of row $ell$, the corresponding monomial adds the exponents of row $i$ to those of row $ell$. Its average is $m_H \( A_(i arrow.r ell) \)$. Taking real parts and averaging also over $K$ and $kappa$ proves (5). If a contraction creates a zero row or column, deletion is justified by the marginal argument preceding the lemma.
  When $p = 7$, the six other rows occupy all six available labels. There is no unused-label contribution. The same orthogonality equation is therefore precisely the sum of the six contractions in (6). ◻
]

Repeatedly applying Lemma 4 to rows or columns of order one expresses any moment with both dimensions at most six as a rational linear combination of the empty moment and moments whose nonzero rows and columns all have order at least two. Each contraction reduces the number of rows or columns, so this procedure terminates. Choosing representatives under the symmetries above introduces no additional mathematical relation.

=== 3.2 From products of characters to injective moments <from-products-of-characters-to-injective-moments>

For a permutation $pi$ of ${ 0 \, dots.h \, 5 }$, write $K^pi \( i \, k \) = K \( pi \( i \) \, k \)$. We use the notation

#[#set math.equation(numbering: n => "(7)")
 $ chevron.l F \( tilde(H) \) #scale(x: 120%, y: 120%)[chevron.r]_H = frac(1, 2 dot.op 6 !) sum_(K in \( H \, H^(sans(T)) \)) med sum_(pi in S_6) F \( K^pi \) $ <eq:pair-average>]

for the average over the two orientations and all row permutations. The ordered pair $\( H \, H^(sans(T)) \)$ in this formula is counted with multiplicity even when its entries coincide. Column permutations do not change $g_(tilde(H))$ and need not be included.

Let $\( 6 \)_k = 6 dot.op 5 dots.h.c \( 6 - k + 1 \)$, with $\( 6 \)_0 = 1$.

#thm([Lemma 3.3.])[
  (Equality-pattern expansion).  #emph[Let $a_1 \, dots.h \, a_n in bb(Z)^6$ be balanced charges satisfying $sum_(j = 1)^n a_j = 0$, and let $A$ be the matrix with these columns. For a set partition $cal(S)$ of ${ 1 \, dots.h \, n }$, form $A_(cal(S))$ by replacing the columns in each block $S in cal(S)$ by their sum $sum_(j in S) a_j$. Then
#[#set math.equation(numbering: n => "(8)")
 $ ⟨"Re" product_(j = 1)^n g_(tilde(H)) \( a_j \)⟩_H = sum_(cal(S) upright(" a set partition of ") { 1 \, dots.h \, n }\
\| cal(S) \| lt.eq 6) frac(\( 6 \)_(\| cal(S) \|), 6^n) thin m_H \( A_(cal(S)) \) . $ <eq:injective-partitions>]

 The ordering of the blocks of $cal(S)$ is immaterial.]
] <lem:partitions>

#proof[
  Expanding the product of characters samples $n$ columns independently and uniformly from the six columns of $tilde(H)$. Group the summands by their equality pattern: two positions belong to the same block precisely when their column labels coincide. For a specified partition with $k$ blocks, the distinct block labels have $\( 6 \)_k$ possible assignments, each with probability $6^(- n)$. Conditional on this pattern, the block labels form a uniform injection. Multiplying the factors with the same column label adds their exponents, giving $A_(cal(S))$. Averaging over the row permutation, the orientation, and the real part gives exactly its injective moment. Partitions with more than six blocks have no assignments and contribute nothing. ◻
]

The hypotheses on the charges ensure that every matrix in (8) has both row and column sums zero. Moreover, $overline(g_H \( a \)) = g_H \( - a \)$, so absolute squares of products are covered by the lemma. A zero charge may be omitted before applying the expansion, since its factor is $g_H \( 0 \) = 1$; equivalently, integrating out its independently sampled column does not change the distribution of the remaining columns.

For example, if $a$ is a balanced charge and $\[ a \, - a \]$ denotes the two-column exponent matrix, the two possible equality patterns give

$ ⟨\| g_(tilde(H)) \( a \) \|^2⟩_H = 1 / 6 + 5 / 6 m_H \( \[ a \, - a \] \) . $

The first term comes from equal sampled columns, where all exponents cancel; the second comes from two distinct columns. The certificate below uses the same expansion for products with up to four factors.

=== 3.3 An exact identity and its consequence <an-exact-identity-and-its-consequence>

The auxiliary expression below is chosen so that orthogonality yields a sum of nonnegative terms equal to zero. The resulting vanishing products will force the dichotomy.

Retain $alpha = \( 1 \, 1 \, 1 \, - 1 \, - 1 \, - 1 \)$ and put

$ w & = \( - 3 \, - 2 \, 0 \, 1 \, 2 \, 2 \) \,\
a_1 & = \( - 1 \, - 1 \, 0 \, 0 \, 1 \, 1 \) \, & a_2 & = \( - 2 \, 0 \, 0 \, 0 \, 1 \, 1 \) \,\
a_3 & = \( - 1 \, - 1 \, 0 \, 1 \, 0 \, 1 \) \, & a_4 & = \( - 1 \, - 1 \, 0 \, 1 \, 1 \, 0 \) . $

Define

#[#set math.equation(numbering: n => "(9)")
 $ L_H = - g_H \( w \) + sum_(j = 1)^4 c_j g_H \( a_j \) g_H \( w - a_j \) \, #h(2em) \( c_1 \, c_2 \, c_3 \, c_4 \) = \( 2 \, 1 \, 1 \, 1 \) \, $ <eq:pair-L>]

and the two charges

$ q_(upright("cross")) = \( 2 \, 0 \, 0 \, - 2 \, 0 \, 0 \) \, #h(2em) q_(upright("same")) = \( 2 \, - 2 \, 0 \, 0 \, 0 \, 0 \) . $

Every term defining $L_H$ has total charge $w$. The nonzero entries of $q_(upright("cross"))$ lie in opposite sign triples of $alpha$, whereas those of $q_(upright("same"))$ lie in the same triple. These two choices will supply the squared-row inner products in the proof of the dichotomy.

#thm([Proposition 3.4.])[
  (Single-matrix certificate).  #emph[For every $6 times 6$ Hadamard matrix $H$ and for each $q in { q_(upright("cross")) \, q_(upright("same")) }$,
#[#set math.equation(numbering: n => "(10)")
 $ 3 chevron.l \| L_(tilde(H)) \|^2 #scale(x: 120%, y: 120%)[chevron.r]_H + ⟨\| g_(tilde(H)) \( alpha \) g_(tilde(H)) \( q \) \|^2⟩_H = 0 . $ <eq:pair-certificate>]

]
] <prop:pair-certificate>

#proof[
  Expand the two absolute squares and apply Lemma 5 to each resulting product. Every product has total charge zero, at most four factors, and sum of the orders of its charges equal to ten. Consequently the resulting expression is a rational linear combination of injective moments. Apply Lemma 4 until all remaining nonzero row and column orders are at least two, and choose representatives under row and column permutations, negation, and transposition.
  The relations used to reduce this expression further are (6), generated from exponent matrices with seven rows, two through four columns, positive row orders, column orders at least two, and total order at most eleven, with a chosen row of order one. The total order of an exponent matrix is the sum of its row orders, equivalently the sum of its column orders. The right sides of these relations are reduced by the same contraction procedure. Thus all relations used are consequences of Lemma 4 and the stated symmetries.
  Section 7 verifies in exact rational arithmetic that substitution of these relations makes every coefficient of the expanded left side of (10) zero, for each of the two specified charges $q$. In particular, its elimination rules hold for every moment vector satisfying those relations, whether or not there are further relations between the moments. The complete finite computation, including the two coefficient comparisons, is included in Appendix 8. The resulting identity therefore holds for the moment vector of every Hadamard matrix $H$, which proves the proposition. ◻
]

#proof[
  The average in (10) is finite, and each choice of orientation and row permutation has positive weight. Every summand is nonnegative. Proposition 6 therefore implies, separately for every ordering of the rows of $H$,
  $ g_(H^pi) \( alpha \) g_(H^pi) \( q_(upright("cross")) \) = 0 \, #h(2em) g_(H^pi) \( alpha \) g_(H^pi) \( q_(upright("same")) \) = 0 . $
  Suppose (M) fails. The ordering witnessing its failure divides the row indices into two triples $I_(+)$ and $I_(-)$ on which the charge is $+ 1$ and $- 1$, respectively. Permutations within either triple do not change this nonzero character. By placing any chosen $i in I_(+)$ and $j in I_(-)$ in positions $0$ and $3$, the first product identity gives $g_H \( 2 \( e_i - e_j \) \) = 0$. By placing any two distinct indices of $I_(+)$ in positions $0$ and $1$, the second product identity gives the same vanishing for that pair. Interchanging the two triples conjugates the nonzero character, since $g_H \( - a \) = overline(g_H \( a \))$. The same argument therefore treats pairs within $I_(-)$ and all remaining ordered cross pairs. Hence
  $ g_H #scale(x: 120%, y: 120%)[\(] 2 \( e_i - e_j \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) upright("for every ") i eq.not j . $
  For distinct rows $i \, j$, this says
  $ sum_(k = 0)^5 H \( i \, k \)^2 overline(H \( j \, k \)^2) = 6 g_H #scale(x: 120%, y: 120%)[\(] 2 \( e_i - e_j \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Every row of $H^(compose 2)$ has squared norm six. Thus $H^(compose 2) \( H^(compose 2) \)^(*) = 6 I$, which for a square matrix also implies $\( H^(compose 2) \)^(*) H^(compose 2) = 6 I$. Its entries are unimodular, so (C) holds. ◻
]

== 4 The cubic alternative <sec:cubic>

We now classify the second alternative of Corollary 3 and complete the proof of Theorem 1. Throughout this section, put $omega = exp \( 2 pi i \/ 3 \)$. Matrices satisfying the two Hadamard conditions are called S-Hadamard matrices #cite(label("Lisonek2019")) Definition 2.1. The following proposition proves the order-six classification conjectured by Phangara #cite(label("Phangara2026")) Conjecture 3.1.6. Its representative is the matrix in Tao’s construction #cite(label("Tao2004")) p. 254.

#thm([Proposition 4.1.])[
  (Classification of the cubic alternative).  #emph[Suppose that $H$ and its entrywise square $H^(compose 2)$ are Hadamard matrices of order six. By multiplying rows and columns by unit complex numbers and permuting rows and columns, one can transform $H$ into the matrix $T$ in (2). In particular, every entry of the transformed matrix is a cube root of unity.]
] <prop:cubic-classification>

#proof[
  Let $v = \( v_0 \, dots.h \, v_5 \)$ be the entrywise ratio of two distinct rows of $H$, and set $p_k \( v \) = sum_i v_i^k$. The two Hadamard conditions give $p_1 \( v \) = p_2 \( v \) = 0$. If $e_k$ denotes the $k$th elementary symmetric function of these six coordinates, Newton’s identities give $e_1 = e_2 = 0$. Since $\| v_i \| = 1$,
  $ e_(6 - k) = e_6 overline(e_k) \, $
  so $e_4 = e_5 = 0$ as well. Consequently
  $ product_(i = 0)^5 \( z - v_i \) = z^6 - e_3 z^3 + e_6 . $
  Factoring this as a quadratic in $z^3$ shows that the multiset of coordinates of $v$ is the union of two rotated cube-root triples. The triples may coincide. Thus the cubed coordinates have either one value six times or two distinct values three times each. The same conclusion holds for ratios of columns, because both matrices also have orthogonal columns.
  Dephase $H$, making its initial row and column equal to one. This preserves both Hadamard conditions. Every row of $H^(compose 3)$ is now either all ones or has the value $1$ three times and a value $x eq.not 1$ three times. For a nonconstant row, call the three positions carrying $x$ its support; its support excludes column zero.
  All nonconstant rows have the same support. Indeed, suppose two distinct supports $S \, U$ have respective values $x \, y eq.not 1$, and put $k = \| S ∩ U \|$. As $S \, U$ are three-element subsets of five positions, $k in { 1 \, 2 }$. The cubed row ratio has the following values and multiplicities:
  $ upright("value") & 1 & x & y^(- 1) & x y^(- 1)\
upright("multiplicity") & k & 3 - k & 3 - k & k . $
  Every multiplicity is positive, whereas this ratio can have at most two distinct cubed values. The three values $1 \, x \, y^(- 1)$ therefore force $x = y^(- 1)$. Next $x y^(- 1) = x^2$ must equal $1$ or $x$, which forces $x = y = - 1$. The two multiplicities would then be $2 k$ and $6 - 2 k$, namely $2$ and $4$ in some order, contradicting the required multiplicities $3$ and $3$. Applying the same argument to columns proves the corresponding assertion for their supports.
  Suppose that $H^(compose 3)$ is not all ones. Its common nonconstant-row support consists of three columns. Each of those columns has exactly three non-one entries, so exactly three rows are nonconstant. Comparing their values in any one of these columns shows that their non-one values coincide. After arranging these two classes of rows and columns, the cubed matrix therefore has the form
  #[#set math.equation(numbering: n => "(11)")
   $ H^(compose 3) = mat(delim: "(", J_3, J_3; J_3, x J_3) \, #h(2em) x eq.not 1 \, $ <eq:cubic-block>]
  where $J_3$ is the all-ones matrix of order three.
  Restrict each row of $H$ to the three columns of the $x J_3$ block. For rows from opposite classes, the ratio cubes to $x$ or $x^(- 1)$ on these columns and to $1$ on the other three. The two rotated triples in that ratio are therefore separated by this division of the columns. Their sums are zero, so the restrictions of rows from opposite classes are mutually orthogonal.
  Each class spans a space of dimension at least two on these three columns. To see this, suppose that the three restrictions in one class span a line. Each has squared norm three, so the inner product of any two has modulus three. Orthogonality of the full rows forces their complementary restrictions to have inner product of modulus three as well. Equality in Cauchy–Schwarz makes these complementary restrictions proportional. The three full rows would then lie in a space of dimension at most two, contrary to their orthogonality. Thus the two mutually orthogonal restricted spans have dimensions at least two, which is impossible in $bb(C)^3$. This excludes (11). Every entry of the dephased $H$ is consequently a cube root of unity.
  In each noninitial row and column, orthogonality to the initial one implies that each cube root occurs twice. There is therefore exactly one additional entry equal to one in each noninitial row and column. These entries form a matching and may be placed on the diagonal by a column permutation. Write the other entries as $omega^(s_(i j))$, where $s_(i j) in { - 1 \, 1 }$ and $i \, j in { 1 \, dots.h \, 5 }$ are distinct. Each such row has two plus signs and two minus signs.
  For two distinct noninitial rows $i \, j$, their ratio contains each root twice. They agree at column zero, disagree at columns $i \, j$, and hence agree at exactly one of the remaining three columns. There are thus two sign mismatches among those three columns, giving
  $ product_(k in.not { 0 \, i \, j }) s_(i k) s_(j k) = 1 . $
  The product of the four signs in each complete noninitial row is also one. It follows that $s_(i j) s_(j i) = 1$, so $s_(i j) = s_(j i)$. The plus signs define a simple undirected graph of degree two on five vertices. Its components are cycles of length at least three; therefore it is a single five-cycle. A simultaneous permutation of the noninitial rows and columns now gives (2); Figure 1 shows its two off-diagonal exponent classes. For completeness, the displayed $T$ is itself Hadamard: every difference of distinct exponent rows contains each residue modulo three twice, as seen by separating an initial-row pair, an adjacent pair on the cycle, and a nonadjacent pair. Its entrywise square is $overline(T)$ and is Hadamard as well. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((8.037e-17, 1.312), [#text(size: 9pt)[$1$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.248, 0.4056), [#text(size: 9pt)[$2$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.7715, -1.062), [#text(size: 9pt)[$3$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.7715, -1.062), [#text(size: 9pt)[$4$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.248, 0.4056), [#text(size: 9pt)[$5$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.037e-17, 1.312), (0.7715, -1.062), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((8.037e-17, 1.312), (-0.7715, -1.062), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.248, 0.4056), (-0.7715, -1.062), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.248, 0.4056), (-1.248, 0.4056), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.7715, -1.062), (-1.248, 0.4056), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((8.037e-17, 1.312), (1.248, 0.4056), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((1.248, 0.4056), (0.7715, -1.062), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.7715, -1.062), (-0.7715, -1.062), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-0.7715, -1.062), (-1.248, 0.4056), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-1.248, 0.4056), (8.037e-17, 1.312), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2.1, -0.21), (2.625, -0.21), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((2.625, -0.21), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$t_(i j)=1$]]], anchor: "west", padding: 0.1176cm)
  line((2.1, -0.735), (2.625, -0.735), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((2.625, -0.735), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$t_(i j)=-1$]]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The five-cycle determining the noninitial off-diagonal entries of the cubic matrix $T$. Solid edges contribute $omega$ and dashed edges contribute $omega^(- 1)$. The diagonal and the initial row and column consist of ones. ],
) <fig:cubic-cycle>

The classification also settles the Fourier-vanishing conjecture of Matolcsi, Ruzsa, and Weiner #cite(label("MatolcsiRuzsaWeiner2013")) Conjecture 2.3. Here equivalence means multiplication of rows and columns by unit complex numbers and permutation of rows and columns. The matrix $T$ is equivalent to the spectral matrix $S_6$ displayed in #cite(label("TadejZyczkowski2006")) (93)–(94): with our zero-based indices, $T_(i j) = \( S_6 \)_(p \( i \) \, p \( j \))$ for $\( p \( 0 \) \, dots.h \, p \( 5 \) \) = \( 0 \, 1 \, 2 \, 5 \, 4 \, 3 \)$.

#proof[
  If $g_H \( pi alpha \)$ were nonzero for some coordinate permutation $pi$, Corollary 3 would imply that $H^(compose 2)$ is Hadamard. Proposition 7 would then make $H$ equivalent to $T$, a contradiction. ◻
]

== 5 Complete families and the cubic obstruction <sec:complete-family>

We turn to Theorem 2. The first step is to exclude the cubic alternative from a complete family. We begin with the character identities that record mutual unbiasedness and completeness.

=== 5.1 Character identities of a complete family <character-identities-of-a-complete-family>

Suppose that $B_1 \, dots.h \, B_7$ are mutually unbiased orthonormal bases. For $r eq.not s$, define their transition matrix by

$ H_(r s) \( i \, k \) = sqrt(6) thin chevron.l b_(r \, i) \, b_(s \, k) chevron.r . $

Unbiasedness and orthonormality imply that $H_(r s)$ is Hadamard and that $H_(s r) = H_(r s)^(*)$. With a reference basis $r$ fixed, we abbreviate $H_(r s)$ and $g_(H_(r s))$ to $H_s$ and $g_s$.

#thm([Lemma 5.1.])[
  #emph[For each fixed reference basis the following identities hold. First,
#[#set math.equation(numbering: n => "(12)")
 $ g_s \( d \) = 0 quad \( d in D \) \, #h(2em) sum_(s eq.not r) g_s \( a \) = 0 quad \( "ord" \( a \) = 2 \) . $ <eq:order-two>]

 For arbitrary charges $a \, b$ and each coordinate $i$,
#[#set math.equation(numbering: n => "(13)")
 $ sum_(j = 0)^5 g_s \( a + e_i - e_j \) g_s \( b - e_i + e_j \) = g_s \( a + b \) . $ <eq:same-matrix>]

 The same identity holds with both shifts reversed. For distinct external bases $s \, t eq.not r$,
#[#set math.equation(numbering: n => "(14)")
 $ sum_(d in D) g_s \( a + d \) g_t \( b - d \) = 0 . $ <eq:different-matrices>]

]
] <lem:basic>

The complete-set projector identity used in the proof is the second-moment identity for a complex projective $2$-design; see Zauner #cite(label("Zauner1999")) Satz 2.19 and Klappenecker–Rötteler #cite(label("KlappeneckerRotteler2005")) Theorem 3. We give the projection argument in our normalization. The character identities are part of the Fourier approach #cite(label("Matolcsi2012")) #cite(label("MatolcsiRuzsaWeiner2013")).

#proof[
  The first assertion in (12) is row orthogonality. For the second, let $P_(s \, k) = b_(s \, k) b_(s \, k)^(*)$, and let $cal(D)_s^0$ be the complex space of traceless matrices diagonal in $B_s$. If $s eq.not t$, then
  $ "Tr" #scale(x: 120%, y: 120%)[\(] \( P_(s \, k) - I \/ 6 \) \( P_(t \, l) - I \/ 6 \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  The spaces $cal(D)_s^0$ are therefore pairwise orthogonal for the Hilbert–Schmidt inner product. Each has dimension five, and their dimensions sum to $35 = 6^2 - 1$, the dimension of the traceless matrix space. Orthogonal projection consequently gives
  #[#set math.equation(numbering: n => "(15)")
   $ "Tr" \( X Y \) = sum_(s = 1)^7 sum_(k = 0)^5 "Tr" \( X P_(s \, k) \) "Tr" \( Y P_(s \, k) \) #h(2em) \( "Tr" X = "Tr" Y = 0 \) . $ <eq:projector-identity>]
  This is a complex bilinear identity: it follows by pairing the complex-linear projection formula for $X$ with $Y$.
  Any order-two charge is a sum $d_1 + d_2$ of two members of $D$. For $s eq.not r$, write $h_k$ for the $k$th column of $H_s$. In basis $B_r$, choose off-diagonal matrix units $X \, Y$ whose traces against $P_(s \, k)$, for $s eq.not r$, are respectively $h_k^(d_1) \/ 6$ and $h_k^(d_2) \/ 6$. For example, $d_1 = e_i - e_j$ corresponds to $X = E_(j i)$. Since $d_1 + d_2$ has order two, $d_2 eq.not - d_1$, so $"Tr" \( X Y \) = 0$. The reference basis contributes zero to (15), and each external basis contributes $g_s \( d_1 + d_2 \) \/ 6$. This proves the second identity in (12).
  For (13), expand the two character sums and write $x \, y$ for their sampled columns. The left-hand side is
  $ 1 / 36 sum_(x \, y) x^a y^b x_i / y_i sum_(j = 0)^5 y_j / x_j . $
  The inner sum is $6$ when $x = y$ and zero otherwise, by column orthogonality. The result is $g_s \( a + b \)$. Conjugating the inner orthogonality relation proves the version with reversed shifts.
  Finally, if $x$ is a column of $H_s$ and $y$ a column of $H_t$, their inner-product squared modulus is six. Hence
  $ sum_(d in D) \( x \/ y \)^d = lr(|sum_(i = 0)^5 x_i / y_i|)^2 - 6 = 0 . $
  Expanding the products of $g_s$ and $g_t$ proves (14). ◻
]

The identities for one matrix hold for every Hadamard matrix. The order-two sum in (12) uses the completeness of the seven-basis set. The later mixed identities retain this completeness information through averaging over the six external bases.

=== 5.2 The cubic-pair obstruction <the-cubic-pair-obstruction>

Brierley and Weigert proved the stronger fact that the standard basis and the basis defined by $T \/ sqrt(6)$ cannot be extended by a third mutually unbiased basis #cite(label("BrierleyWeigert2009Constructing")) Section 4.1 and Table 1. The following proposition gives an exact Fourier derivation of the complete-family exclusion needed here.

#thm([Proposition 5.2.])[
  #emph[In a set of seven mutually unbiased bases in $bb(C)^6$, no transition Hadamard matrix $H$ can have $H^(compose 2)$ Hadamard.]
] <prop:cubic-exclusion>

To prove the proposition, suppose that such a pair occurs. By Proposition 7, rephasing and reordering its basis vectors allows us to take its transition matrix to be $T$. These operations preserve every mutual unbiasedness condition. Use the first basis of this pair as reference, and call the other five transition matrices $K_1 \, dots.h \, K_5$. Define

$ f \( b \) = 1 / 5 sum_(s = 1)^5 g_(K_s) \( b \) \, #h(2em) G \( b \) = g_T \( b \) . $

Lemma 8 gives $f \( b \) = G \( b \) = 0$ at order one, and Equation (12) gives

#[#set math.equation(numbering: n => "(16)")
 $ f \( b \) = - 1 / 5 G \( b \) #h(2em) \( "ord" \( b \) = 2 \) . $ <eq:cubic-order-two>]

Equation (14), applied with its second charge equal to $- c$ and then averaged over $K_1 \, dots.h \, K_5$, gives

#[#set math.equation(numbering: n => "(17)")
 $ sum_(d in D) f \( a + d \) overline(G \( c + d \)) = 0 #h(2em) upright("for all balanced ") a \, c . $ <eq:cubic-cross>]

Let

#[#set math.equation(numbering: n => "(18)")
 $ S \( b \) = frac(1, 6 !) sum_(pi in S_6) "Re" #scale(x: 120%, y: 120%)[\(] f \( pi b \) overline(G \( pi b \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:cubic-S>]

Because $f \( - b \) = overline(f \( b \))$ and likewise for $G$, this average also equals the average over the distinct elements of the signed permutation orbit of $b$.

Every entry of $T$ has cube one, so $G \( 3 d \) = 1$ for $d in D$. The signed permutation orbit of $3 \( e_5 - e_0 \)$ is precisely ${ 3 d : d in D }$. If $z$ is a uniformly sampled column of a uniformly sampled matrix among $K_1 \, dots.h \, K_5$, then $bb(E) z^b = f \( b \)$. Consequently

#[#set math.equation(numbering: n => "(19)")
 $ 0 lt.eq bb(E) lr(|sum_(i = 0)^5 z_i^3|)^2 = 6 + sum_(d in D) f \( 3 d \) = 6 + 30 S #scale(x: 120%, y: 120%)[\(] 3 \( e_5 - e_0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cubic-positivity>]

Thus this orbit average must be at least $- 1 \/ 5$. We will use (17) to compute it and contradict this lower bound. The next lemma concerns $T$ alone; it lets us calculate the coefficients of those identities one permutation orbit at a time.

=== 5.3 Symmetries of the cubic matrix <symmetries-of-the-cubic-matrix>

The row-permutation symmetry below also follows from the semilinear automorphism group determined by Gillespie, Ó Catháin, and Praeger #cite(label("GillespieOCathainPraeger2018")) Proposition 2. We give a direct proof using the five-cycle classification.

#thm([Lemma 5.3.])[
  #emph[Every permutation of the rows of $T$ can be completed to a symmetry of $T$ by column permutations, row and column phase factors, and, if necessary, complex conjugation. Consequently $\| G \( b \) \|$ is constant on each orbit of balanced charges under permutations and negation.]
] <lem:cubic-symmetry>

#proof[
  A symmetry operation consists of row and column permutations, a choice of whether to conjugate, and row and column phase factors that send $T$ to itself. Normalize the phase factor of output row zero to one. The all-one output row and column then determine all the other phase factors, removing the freedom to multiply the row factors by a common phase and the column factors by its inverse.
  Choose an initial row and column in $36$ ways, choose whether to conjugate, and dephase at the chosen row and column. Proposition 7 applies again. After matching the additional ones on the diagonal, there are exactly $10$ orders of the remaining rows that, together with the matching column orders, make the plus graph the specified five-cycle: choose its initial vertex and its direction. This constructs $36 dot.op 2 dot.op 10 = 720$ symmetry operations. Their row and column permutations recover the chosen initial row and column as the source indices sent to position zero; together with the conjugation choice, their remaining orders recover the chosen cycle isomorphism. Thus these are distinct normalized operations.
  We show that their induced row permutations are distinct. Work with exponents modulo three, and write $t_j = \( t_(i j) \)_(i = 0)^5$ for column $j$ of the exponent matrix. A symmetry fixing the row order acts on the set $X = { t_0 \, dots.h \, t_5 }$ as
  $ X mapsto s X + u \, #h(2em) s in { 1 \, - 1 } . $
  Indeed, because row zero has only zero exponents, the column phase factors are common and may be absorbed into the row factors. The remaining row factors have exponents modulo three, and the image of the zero column shows that $u in X$.
  For $j eq.not 0$, column $t_j$ has exactly one zero in its noninitial positions, at position $j$. Hence $- t_j in.not X$: its zero would force it to equal $t_j$, which it does not. A nonzero translation preserving $X$ would contain both $u$ and $2 u = - u$, and is therefore impossible. Negation with $u = 0$ is impossible for the same reason.
  Finally suppose $s = - 1$ and $u = t_x eq.not 0$. Choose a neighbor $y$ of $x$ on the five-cycle, and let $z$ be their common non-neighbor. Directly from (2), $t_x - t_y$ has its unique noninitial zero at position $z$: at the other two positions outside ${ x \, y \, z }$, exactly one of $x \, y$ is adjacent to that vertex, so the differences are $plus.minus 2$, hence nonzero modulo three. Were $t_x - t_y$ a column, it would have to be $t_z$. But at positions $x \, y$ the former has entries $- 1 \, 1$, while $t_z$ has entries $- 1 \, - 1$, a contradiction modulo three. Thus the only symmetry fixing the row order is the identity, after the irrelevant common phase normalization. Two of the $720$ operations with the same row permutation would have such a quotient, so their row permutations are all distinct. They exhaust the $720$ possible row permutations.
  For a balanced charge, column phases cancel in the defining character, while row phases multiply it by a unit complex number. Conjugation conjugates the character. These observations prove the last assertion, including negation since $G \( - b \) = overline(G \( b \))$. ◻
]

=== 5.4 Coefficients of the cross identities <coefficients-of-the-cross-identities>

Let

$ a = \( - 1 \, - 1 \, 0 \, 0 \, 1 \, 1 \) \, #h(2em) c = \( 0 \, 0 \, 0 \, 0 \, - 1 \, 1 \) \, $

and let $cal(O)$ be the set of distinct simultaneous permutations $\( A \, C \)$ of $\( a \, c \)$. Apply (17) to every $\( A \, C \) in cal(O)$, multiply by $overline(G \( A - C \))$, sum, and take real parts. To record the coefficients explicitly, set

$ Q \( b \) = sum_(\( A \, C \) in cal(O)\
b - A in D) G \( A - C \) G \( b - A + C \) . $

The resulting equality is

$ sum_b "Re" #scale(x: 120%, y: 120%)[\(] f \( b \) overline(Q \( b \)) #scale(x: 120%, y: 120%)[\)] = 0 \, $

where the sum is finite. For a complex number $z$, write $z^(\[ 1 \]) = z$ and $z^(\[ - 1 \]) = overline(z)$. Conjugacy of $f$ permits symmetrizing the coefficient as $R \( b \) = \( Q \( b \) + overline(Q \( - b \)) \) \/ 2$: replacing $b$ by $- b$ in the finite sum above and averaging leaves it unchanged. Explicitly,

#[#set math.equation(numbering: n => "(20)")
 $ R \( b \) = 1 / 2 sum_(\( A \, C \) in cal(O) \, med epsilon.alt in { - 1 \, 1 }\
epsilon.alt b - A in D) #scale(x: 120%, y: 120%)[\[] G \( A - C \) G \( epsilon.alt b - A + C \) #scale(x: 120%, y: 120%)[\]]^(\[ epsilon.alt \]) . $ <eq:cubic-R>]

We have therefore obtained the weighted cross identity

#[#set math.equation(numbering: n => "(21)")
 $ sum_b "Re" #scale(x: 120%, y: 120%)[\(] f \( b \) overline(R \( b \)) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:cubic-weighted-cross>]

Its coefficients depend only on $T$. We now calculate them.

The following table lists representatives $w_j$ of every balanced charge of order at most three, up to permutation and negation. The integer triples in its last two columns satisfy

#[#set math.equation(numbering: n => "(22)")
 $ 6 G \( w_j \) = sum_(m = 0)^2 N_m omega^m \, #h(2em) 72 R \( w_j \) = sum_(m = 0)^2 U_m omega^m . $ <eq:cubic-count-interpretation>]

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (right, left, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$w_j$
], table.cell(rowspan: 1, colspan: 1)[$\( N_0 \, N_1 \, N_2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( U_0 \, U_1 \, U_2 \)$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$\( - 3 \, 0 \, 0 \, 0 \, 0 \, 3 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 0 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \, 0 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$\( - 3 \, 0 \, 0 \, 0 \, 1 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 2 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \, 0 \)$
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( - 3 \, 0 \, 0 \, 1 \, 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 0 \, 3 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \, 0 \)$
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, - 1 \, 0 \, 0 \, 1 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 60 \, 42 \, 42 \)$
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, - 1 \, 0 \, 1 \, 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 2 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 144 \, 144 \, 144 \)$
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, 0 \, 0 \, 0 \, 0 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 2 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \, 0 \)$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, 0 \, 0 \, 0 \, 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 3 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 180 \, 180 \, 72 \)$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, - 1 \, - 1 \, 1 \, 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 3 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 540 \, 540 \, 216 \)$
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, - 1 \, 0 \, 0 \, 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 480 \, 336 \, 336 \)$
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, 0 \, 0 \, 0 \, 0 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 2 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 576 \, 576 \, 576 \)$
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \, 0 \, 0 \, 0 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 0 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \, 0 \)$
],
)
]],
  caption: [Table 1: Exact cube-root counts for $G$ and $R$. ],
)

Here is an explicit summation rule reproducing Table 1. Put

$ v \( b \, k \) = sum_(i = 0)^5 b_i t_(i k) med \( mod med 3 \) \, $

with residues in ${ 0 \, 1 \, 2 }$. For each input $b = w_j$, initialize two separate arrays $N \, U$ of three zero integers and apply these loops:

#quote(block: true)[
  #raw(block: true, lang: "", "for k = 0,...,5:\n    N[v(b,k)] += 1\nfor p,q = 0,...,5 with p != q:\n    for 0 <= h < i <= 5 with {h,i} disjoint from {p,q}:\n        A = e_p + e_q - e_h - e_i\n        u = 2*e_p - e_h - e_i\n        for s in {-1,1} with s*b - A in D:\n            for k,l = 0,...,5:\n                U[(s*(v(u,k) + v(s*b-u,l))) mod 3] += 1")
]

Indeed, the $30 binom(4, 2) = 180$ pairs in $cal(O)$ are uniquely parametrized by

$ A = e_p + e_q - e_h - e_i \, #h(2em) C = e_q - e_p \, $

with precisely the conditions used in the loops; thus $u = A - C$. Each product of two $G$ terms contributes $36$ cube roots with coefficient $1 \/ 36$, and the factor $1 \/ 2$ in (20) accounts for the denominator $72$ in (22).

For example, row $3$ gives $G \( w_3 \) = \( 4 + omega + omega^2 \) \/ 6 = 1 \/ 2$ and $R \( w_3 \) = \( 60 + 42 omega + 42 omega^2 \) \/ 72 = 1 \/ 4$. Using $1 + omega + omega^2 = 0$ in every row gives

#[#set math.equation(numbering: n => "(23)")
 $ R \( b \) = lambda_j G \( b \) \, #h(2em) lambda_3 = 1 / 2 \, quad lambda_6 = 3 \, quad lambda_7 = 9 \, quad lambda_8 = 4 \, $ <eq:cubic-R-multipliers>]

on the signed permutation orbit of $w_j$, and $R \( b \) = 0$ on all other orbits. To justify extending the representative calculation, observe that every factor in (20) has a balanced charge. Its column phases therefore cancel. The two charges in each product add to $epsilon.alt b$, so after the prescribed conjugation its row phase factor is exactly the factor for $G \( b \)$. Row permutations preserve the full set $cal(O)$, and conjugation conjugates both $R$ and $G$. Lemma 10 therefore gives the asserted covariance on every orbit; also $R \( - b \) = overline(R \( b \))$. No other orders can occur in the support of $R$, since $epsilon.alt b = A + d$ with $"ord" \( A \) = 2$ and $d in D$ implies $"ord" \( b \) lt.eq 3$.

=== 5.5 The contradiction <the-contradiction>

#proof[
  #emph[Completion of the proof of Proposition 9.] Write $S_j = S \( w_j \)$ for the representatives in Table 1. The orbit sizes for $j = 3 \, 6 \, 7 \, 8$ are respectively $360 \, 120 \, 20 \, 90$. By (23), their coefficients in (21) are $180 \, 360 \, 180 \, 360$. Dividing by $180$ proves
  #[#set math.equation(numbering: n => "(24)")
   $ S_3 + 2 S_6 + S_7 + 2 S_8 = 0 . $ <eq:cubic-first-relation>]
  Table 1 and Lemma 10 imply
  $ S_1 = S_4 = S_5 = S_9 = 0 . $
  At types $6$ and $8$ the squared modulus of $G$ is $1 \/ 4$, so (16) gives
  #[#set math.equation(numbering: n => "(25)")
   $ S_6 = S_8 = - 1 / 20 . $ <eq:cubic-known-S>]
  Next take $a = c = w_5$ in (17) and average over coordinate permutations. Do the same with $a = c = w_8$. Classifying the $30$ charges $w_j + d$, $d in D$, by their signed permutation orbits gives the following counts:
  $ & 0 & 1 & 3 & 4 & 6 & 7 & 8 & 9\
w_5 + D & 1 & 8 & 12 & 0 & 8 & 0 & 0 & 1\
w_8 + D & 0 & 0 & 4 & 8 & 4 & 2 & 8 & 4 . $
  These counts can be obtained simply by adding each of the $30$ vectors $e_i - e_j$ to the displayed representatives and sorting the coordinates, allowing a simultaneous change of sign. Averaging over permutations turns each resulting charge into its orbit average in (18). Substituting the known values gives
  #[#set math.equation(numbering: n => "(26)")
   $ S_0 + 12 S_3 = 2 / 5 \, #h(2em) 4 S_3 + 2 S_7 = 3 / 5 . $ <eq:cubic-last-relations>]
  Together, (24), (25), and (26) yield
  $ S_3 = S_7 = 1 / 10 \, #h(2em) S_0 = - 4 / 5 . $
  Since $w_0 = 3 \( e_5 - e_0 \)$, equation (19) now gives
  $ bb(E) lr(|sum_(i = 0)^5 z_i^3|)^2 = 6 + 30 S_0 = - 18 \, $
  contradicting nonnegativity. This proves the proposition. ◻
]

== 6 Mixed moments and the remaining case <sec:mixed>

Suppose that a complete set of seven mutually unbiased bases exists and that its transition matrices satisfy

#[#set math.equation(numbering: n => "(27)")
 $ g_(H_(r s)) \( P alpha \) = 0 #h(2em) \( r eq.not s \, #h(0.27778em) P upright(" a coordinate permutation") \) . $ <eq:all-M>]

We seek a nonnegative averaged quadratic form whose expansion in bounded moments has a strictly negative upper bound. Corollary 3 and Proposition 9 will then exclude a complete set.

=== 6.1 Sampling and positive forms <sampling-and-positive-forms>

Choose a reference basis index $r$ uniformly from the seven indices. Given $r$, choose independently a uniform permutation $sigma$ of its six coordinates and a uniform bijection $pi$ from ${ 0 \, dots.h \, 5 }$ to the six other basis indices. In this section write

$ H_s \( i \, k \) = sqrt(6) thin chevron.l b_(r \, sigma \( i \)) \, b_(pi \( s \) \, k) chevron.r \, #h(2em) g_s = g_(H_s) . $

The column order within each basis may remain fixed: each $g_s$ already averages over all six columns. For labels $upright(bold(s)) = \( s_1 \, dots.h \, s_n \)$ and balanced charges $upright(bold(a)) = \( a_1 \, dots.h \, a_n \)$ with $sum_j a_j = 0$, define

#[#set math.equation(numbering: n => "(28)")
 $ cal(M) \( upright(bold(s)) \; upright(bold(a)) \) = bb(E) thin "Re" #h(-0.16667em) (product_(j = 1)^n g_(s_j) \( a_j \)) . $ <eq:mixed-moment>]

Equal labels always denote the same matrix. The marginal assignment of any $l$ distinct labels is a uniform injection into the six nonreference bases. Thus the definition does not depend on which unused labels are included in the sampled bijection. The empty product has moment $1$.

We also use the ordered-pair average of the injective moments of Section 3:

#[#set math.equation(numbering: n => "(29)")
 $ m \( A \) = 1 / 42 sum_(r eq.not s) m_(H_(r s)) \( A \) \, #h(2em) H_(r s) \( i \, k \) = sqrt(6) thin chevron.l b_(r \, i) \, b_(s \, k) chevron.r . $ <eq:average-pair-moment>]

Here $m_H$ is the real injective moment with the transpose averaging specified there. All these actual moments obey

#[#set math.equation(numbering: n => "(30)")
 $ \| m \( A \) \| lt.eq 1 \, #h(2em) \| cal(M) \( upright(bold(s)) \; upright(bold(a)) \) \| lt.eq 1 . $ <eq:moment-bounds>]

For the first inequality the integrand has modulus one. For the second, each $g_s \( a \)$ is an average of six numbers of modulus one.

The next construction expresses the real parts of Gram entries as linear combinations of three-factor mixed moments. The third factor comes from one column shared by all the functions.

In addition to the preceding sampling, choose a uniform column $z$ of $H_0$. For every balanced charge $a$, define functions on this probability space by

#[#set math.equation(numbering: n => "(31)")
 $ F_0 \( a \) = g_0 \( a \) z^(- a) \, #h(2em) F_1 \( a \) = (1 / 5 sum_(s = 1)^5 g_s \( a \)) z^(- a) . $ <eq:F-functions>]

The same sampled column $z$ is used in every function $F_t \( a \)$. This use of moments and positive Gram forms follows the broader polynomial-optimization approach to MUBs #cite(label("BrierleyWeigert2010SDP")) #cite(label("GriblingPolak2024")); the shared-column functions above specify the particular forms used here.

In the formulas below, an index $1$ on $F$ denotes the average over five bases in (31); a label $1$ in $cal(M)$ denotes a representative of those bases after taking expectation.

#thm([Lemma 6.1.])[
  (Gram entries).  #emph[For balanced $a \, v$, put $upright(bold(b)) = \( a \, - v \, v - a \)$. If $\( s \, t \) in { 0 \, 1 }^2$ and $\( s \, t \) eq.not \( 1 \, 1 \)$, then
#[#set math.equation(numbering: n => "(32)")
 $ "Re" thin bb(E) #scale(x: 120%, y: 120%)[\(] F_s \( a \) overline(F_t \( v \)) #scale(x: 120%, y: 120%)[\)] = cal(M) \( \( s \, t \, 0 \) \; upright(bold(b)) \) . $ <eq:gram-first>]

 For the remaining case,
#[#set math.equation(numbering: n => "(33)")
 $ "Re" thin bb(E) #scale(x: 120%, y: 120%)[\(] F_1 \( a \) overline(F_1 \( v \)) #scale(x: 120%, y: 120%)[\)] = 1 / 5 cal(M) \( \( 1 \, 1 \, 0 \) \; upright(bold(b)) \) + 4 / 5 cal(M) \( \( 1 \, 2 \, 0 \) \; upright(bold(b)) \) . $ <eq:gram-second>]

]
] <lem:gram>

#proof[
  Conditioning first on all the matrices and averaging over $z$ gives $bb(E)_z z^(v - a) = g_0 \( v - a \)$. In a term with exactly one $F_1$, the five summands have the same expectation by label exchangeability. In a term with two $F_1$ factors, expand the two sums independently. Of the $25$ ordered choices of labels from ${ 1 \, dots.h \, 5 }$, five have equal labels and twenty have distinct labels. Their marginal distributions give (33). This averaging removes the auxiliary column completely. A zero charge contributes $g_s \( 0 \) = 1$ and may be deleted; removing any unused label preserves the uniform injection law already described. ◻
]

=== 6.2 Reducing the Gram entries <reducing-the-gram-entries>

The three-factor moments in Lemma 11 can be simplified using symmetry, character vanishing, and the identities of a complete family. When all factors refer to one matrix, the injective moments and equations from Section 3 apply as well.

#thm([Lemma 6.2.])[
  (Mixed-moment reductions).  #emph[Under (27), the following operations and identities are valid.]
  + #emph[A common coordinate permutation of all charges, simultaneous negation of all charges, a simultaneous reordering of factors and their labels, and an arbitrary injective renaming of the used labels preserve (28). A zero charge factor may be omitted. Coordinates on which every charge is zero may also be omitted, with the remaining coordinates interpreted as a uniform injection into the six row positions.]
  + #emph[The moment vanishes if any charge has order one or is a coordinate permutation of $alpha$.]
  + #emph[Suppose that $a_j$ has order two and its label $s_j$ occurs only once. Let $S$ be the set of distinct used labels and $l = \| S \|$. For each $t in S \\ { s_j }$, let $upright(bold(s))^(j arrow.r t)$ be obtained from $upright(bold(s))$ by replacing $s_j$ with $t$. Then
#[#set math.equation(numbering: n => "(34)")
 $ cal(M) \( upright(bold(s)) \; upright(bold(a)) \) = - frac(1, 7 - l) sum_(t in S \\ { s_j }) cal(M) \( upright(bold(s))^(j arrow.r t) \; upright(bold(a)) \) . $ <eq:singleton-reduction>]

]
  + #emph[If all labels are equal, the moment is a linear combination of the pair moments (29). More precisely, let $A$ have columns $a_1 \, dots.h \, a_n$, after removing its zero rows. For a set partition $cal(P)$ of ${ 1 \, dots.h \, n }$, let $A_(cal(P))$ have one column $sum_(j in B) a_j$ for each block $B in cal(P)$. Then
#[#set math.equation(numbering: n => "(35)")
 $ cal(M) \( \( s \, dots.h \, s \) \; upright(bold(a)) \) = sum_(cal(P) upright(" a set partition")\
\| cal(P) \| lt.eq 6) frac(\( 6 \)_(\| cal(P) \|), 6^n) thin m \( A_(cal(P)) \) \, $ <eq:single-label-partitions>]

 where $\( 6 \)_k = 6 dot.op 5 dots.h.c \( 6 - k + 1 \)$. Zero rows or columns in $A_(cal(P))$ may be deleted as in Section 3.]
  + #emph[For balanced $a \, b \, c$ with $a + b + c = 0$,
#[#set math.equation(numbering: n => "(36)")
 $ & sum_(j = 0)^5 cal(M) #scale(x: 120%, y: 120%)[\(] \( s \, s \, u \) \; \( a + e_i - e_j \, b - e_i + e_j \, c \) #scale(x: 120%, y: 120%)[\)] = cal(M) #scale(x: 120%, y: 120%)[\(] \( s \, u \) \; \( a + b \, c \) #scale(x: 120%, y: 120%)[\)] \,\
 & sum_(d in D) cal(M) #scale(x: 120%, y: 120%)[\(] \( s \, t \, u \) \; \( a + d \, b - d \, c \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( s eq.not t \) . $ <eq:mixed-same>]

 Equation (36) also holds with the signs of both shifts reversed. The third label $u$ may coincide with another label.]
] <lem:mixed-reductions>

#proof[
  Uniform sampling gives the coordinate and label symmetries in (i), while commutativity gives factor reordering. Simultaneous negation conjugates the whole product, leaving its real part unchanged. A zero charge gives $g_s \( 0 \) = 1$. Removing unused labels or coordinates leaves a uniform injection on those retained. Part (ii) follows from Hadamard orthogonality and (27). In particular, a permuted $alpha$ has six nonzero coordinates; deleting zero coordinate rows cannot change whether a charge is of this type.
  For (iii), fix $r$, the row permutation, and the bases assigned to the $l - 1$ other used labels. There are $6 - \( l - 1 \) = 7 - l$ available bases for the singleton label. For this fixed row order, let $tilde(g)_v$ denote the character average for the external basis $v$. Equation (12) gives
  $ sum_(v eq.not r\
v upright(" not already assigned")) tilde(g)_v \( a_j \) = - sum_(t in S \\ { s_j }) g_t \( a_j \) \, $
  with the same row order throughout. Multiply by the other factors and average over the remaining choices. The marginal distribution of the $l - 1$ retained labels is exactly the distribution defining each moment on the right of (34).
  For (iv), expand each $g_s$ as its column average and group the resulting $n$ column choices by their equality partition. A partition with $k$ blocks has $\( 6 \)_k$ distinct assignments to its blocks, out of $6^n$ choices, giving the displayed coefficient. The retained rows are sampled injectively. It remains to justify the transpose averaging in $m \( A \)$. The marginal ordered pair of bases is uniform, and $H_(s r) = overline(H_(r s))^(thin sans(T))$. Exchanging $r$ and $s$ exchanges the row and column injections and sends an exponent matrix $A$ to $- A^(sans(T))$. Negating all exponents conjugates the monomial, leaving its real part unchanged. Thus the ordered-pair average is already invariant under transposition. This proves (35), including the transpose convention in (29).
  Finally, multiply (13) or (14) by $g_u \( c \)$ and take real expectations. These pointwise identities give (v). ◻
]

In the finite calculation below, a mixed key consists of its factor labels and the matrix whose columns are its charges. The reductions in Lemma 12 apply to these keys. Single-label keys are expanded into the moments $m \( A \)$, and the pair relations from Section 3 may then be used. If a single-label expression vanishes by part (ii), its expansion also gives a valid homogeneous relation among the $m \( A \)$. These steps preserve the interpretation of every remaining symbol as an actual moment.

=== 6.3 The six positive forms <the-six-positive-forms>

Here are the finite collections of functions and integer weights used in the certificate. The exact data are the literal list named #raw("data") in Appendix 8, also supplied in the companion file #raw("certificate/verify.py"). Each record has the form

$ \( lambda \, med mono("ws") \, med e_lambda \, med mono("a") \) . $

The list $mono("ws") = \( \( t_0 \, v_0 \) \, dots.h \, \( t_(m - 1) \, v_(m - 1) \) \)$ specifies $m$ pairs with $t_i in { 0 \, 1 }$ and balanced $v_i in bb(Z)^6$. The integer list $mono("a")$ specifies a symmetric $m times m$ matrix $Z_lambda$ by its lower triangle in row order: with zero-based list indices,

#[#set math.equation(numbering: n => "(37)")
 $ \( Z_lambda \)_(i j) = \( Z_lambda \)_(j i) = mono("a")_(thin i \( i + 1 \) \/ 2 + j) #h(2em) \( 0 lt.eq j lt.eq i < m \) . $ <eq:Z-encoding>]

Thus the data define the matrices and lists without any optimization or choice of numerical tolerances. Their sizes and scales are

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$lambda$
], table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[$e_lambda$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 1 \, 1 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[14
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 1 \, 3 \)$
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[13
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 2 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[13
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 4 \)$
], table.cell(rowspan: 1, colspan: 1)[27
], table.cell(rowspan: 1, colspan: 1)[14
],
  table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 3 \)$
], table.cell(rowspan: 1, colspan: 1)[22
], table.cell(rowspan: 1, colspan: 1)[14
],
  table.cell(rowspan: 1, colspan: 1)[$\( 5 \)$
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[15
],
)
]

For each of these six lists of row lengths $lambda$, place the positions $1 \, dots.h \, 5$, in order, in successive left-justified rows of lengths $lambda_1 \, lambda_2 \, dots.h$. Let $R_lambda$ consist of permutations within these rows, and let $C_lambda$ consist of permutations within the resulting columns. Both groups act on ${ 0 \, dots.h \, 5 }$ by fixing position $0$. Our convention for their action on charges is

$ \( P_p v \)_i = v_(p \( i \)) . $

These signed row and column permutation sums are the usual Young-symmetrizer construction. Symmetry reduction of positive Gram forms is developed generally in #cite(label("GatermannParrilo2004")) and for MUB moment problems in #cite(label("GriblingPolak2024")). Here the finite sums are given explicitly, so their use requires no representation-theoretic decomposition theorem. Define the vector $Y_lambda$ by

#[#set math.equation(numbering: n => "(38)")
 $ \( Y_lambda \)_i = sum_(p in R_lambda\
q in C_lambda) "sgn" \( q \) thin F_(t_i) \( P_p P_q v_i \) #h(2em) \( 0 lt.eq i < m \) . $ <eq:Young-functions>]

In particular, $\( P_p P_q v \)_i = v_(q \( p \( i \) \))$, which is the order implemented by #raw("perm(perm(v,q),p)") in the appendix. Formula (38) defines a finite linear combination of the functions (31) for every listed pair.

#thm([Proposition 6.3.])[
  (Mixed-moment certificate).  #emph[Each matrix $Z_lambda$ specified above is positive definite. Under the mixed-moment identities of Lemma 12, the forms (38) satisfy
#[#set math.equation(numbering: n => "(39)")
 $ 5 sum_lambda 10^(15 - e_lambda) bb(E) #scale(x: 120%, y: 120%)[\(] Y_lambda^(*) Z_lambda Y_lambda #scale(x: 120%, y: 120%)[\)] & lt.eq frac(- 613302797399911 + 179721388988719, 6480)\
 & = - 2007321335237 / 30 < 0 . $ <eq:mixed-certificate>]

]
] <prop:mixed-certificate>

#proof[
  The exact finite calculations establishing the matrix and coefficient claims are detailed in Section 7, with their full integer and rational arithmetic in Appendix 8. We specify here the mathematical expansion to which those checks apply.
  First expand each $Y_lambda$ by (38), and replace every real Gram entry using Lemma 11. Multiplication by five makes its weights either $5$ or the pair $\( 1 \, 4 \)$. Because $Z_lambda$ is real symmetric, summing its diagonal contributions and twice its lower off-diagonal contributions gives the real quantity $bb(E) \( Y_lambda^(*) Z_lambda Y_lambda \)$. The factor $10^(15 - e_lambda)$ is retained for each block.
  Apply the mixed reductions and the homogeneous relations (36)–(36), using the finite selection of relations with total charge order at most $11$ described in Section 7. That selection only restricts which valid relations are used. The exact substitutions give
  #[#set math.equation(numbering: n => "(40)")
   $ 5 sum_lambda 10^(15 - e_lambda) bb(E) #scale(x: 120%, y: 120%)[\(] Y_lambda^(*) Z_lambda Y_lambda #scale(x: 120%, y: 120%)[\)] = f + sum_(rho in cal(R)) beta_rho X_rho \, $ <eq:mixed-residual>]
  where each $X_rho$ is a nonconstant symbol representing one of the original moments $m \( A \)$ or $cal(M) \( upright(bold(s)) \; upright(bold(a)) \)$, and
  #[#set math.equation(numbering: n => "(41)")
   $ f = - 613302797399911 / 6480 \, #h(2em) sum_(rho in cal(R)) \| beta_rho \| = 179721388988719 / 6480 . $ <eq:mixed-coefficients>]
  The linear-algebra verification in Section 7 proves that these substitutions follow from the chosen equations. The bounds (30) applied to (40) now prove (39).
  For each $Z_lambda$, the exact Schur-complement calculation in Section 7 verifies positive pivots and hence positive definiteness. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 2.] If seven mutually unbiased bases existed, Corollary 3 would give case (M) or case (C) for each transition matrix. Proposition 9 excludes case (C), so all pairs satisfy (27) and the preceding construction applies. For a complex vector $Y = x + upright(i) y$ and a real symmetric positive definite matrix $Z$,
  $ Y^(*) Z Y = x^(sans(T)) Z x + y^(sans(T)) Z y gt.eq 0 . $
  Consequently the left side of (39) is nonnegative. Its strictly negative upper bound is a contradiction. This proves Theorem 2. ◻
]

== 7 Exact verification of the two certificates <sec:verification>

We now give the finite calculations establishing Propositions 6 and 13. The complete program and all its data are printed in Appendix 8. It specifies the integer matrices, coordinate orders, and finite enumerations used below. All arithmetic that certifies an equality or inequality is integer or rational arithmetic. Modular arithmetic supplies candidate substitutions, whose validity is then checked exactly. Rational Gram certificates and exact positivity checks are established methods; see Peyrl–Parrilo #cite(label("PeyrlParrilo2008")) Section 3. Our input matrices are specified integers, and the proof below certifies the displayed identities directly from those data.

The calculation has three steps. First, expand each expression in named moments using the identities already proved. Next, use a finite set of true linear equations to substitute for some of these moments. Finally, check either that every coefficient vanishes, for the pair certificate, or that the constant coefficient plus the absolute sum of the remaining coefficients is negative, for the mixed certificate. We first justify the substitutions for arbitrary real moment values, then specify the equations and coefficient checks for each certificate.

=== 7.1 Exact certification of linear substitutions <exact-certification-of-linear-substitutions>

Both certificates use finite systems of linear equations in their moment coordinates. The same substitution procedure applies to either system. Include the constant moment as a coordinate, so that every moment equation is homogeneous in the enlarged coordinate vector. Clearing denominators turns the equations into integer rows. The lists called #raw("I") in the program specify a fixed priority order on the coordinates. This choice affects the form of the answer and, in the mixed calculation, the size of its residual coefficient sum; it does not add any relation.

#thm([Lemma 7.1.])[
  (Exact substitutions).  #emph[Let $W in bb(Z)^(r times N)$ consist of selected moment equations after their denominators have been cleared. Suppose a set $J$ of $r$ columns gives a square submatrix $W_J$ invertible modulo a prime. Put $F = { 1 \, dots.h \, N } \\ J$. If a rational matrix $P in bb(Q)^(N times N)$ satisfies
$ P_(F \, F) = I \, #h(2em) P_(* \, J) = 0 \, #h(2em) W P = 0 \, $

 then every real vector $upright(bold(m))$ satisfying $W upright(bold(m)) = 0$ obeys $upright(bold(m)) = P upright(bold(m))$. Thus the rows of $P$ give valid substitutions for all coordinates in terms of the coordinates indexed by $F$.]
] <lem:exact-elimination>

#proof[
  Invertibility modulo the prime implies that the integer $det W_J$ is nonzero. In the coordinate order $J \, F$, write
  $ W = mat(delim: "(", W_J, W_F) \, #h(2em) P = mat(delim: "(", 0, P_(J \, F); 0, I) . $
  The exact equality $W P = 0$ gives $P_(J \, F) = - W_J^(- 1) W_F$. Every solution of $W upright(bold(m)) = 0$ consequently satisfies $upright(bold(m))_J = P_(J \, F) upright(bold(m))_F$, while the free coordinates of $P upright(bold(m))$ are already $upright(bold(m))_F$. This proves the claim over $bb(R)$, regardless of whether the moment values are rational. Equivalently, $P$ has rank $N - r$, its image equals $ker W$, and its identity rules make it the identity on that kernel. ◻
]

Here is how #raw("eliminate") verifies the hypotheses of the lemma. Its first modular elimination uses the prime $1000000007$. The routine #raw("echelon") retains an original integer equation whenever that equation supplies a new pivot. These retained equations form $W$. Each pivot is at the largest remaining coordinate of its row; normalized elimination therefore proves that $W_J$ is invertible modulo the prime. Back substitution processes pivot coordinates in ascending order. When a smaller pivot is removed, its already reduced row contains only that pivot and free coordinates. The final rule for a pivot thus has no other pivot on its right side.

The program then works modulo the further moduli listed in the source, retaining matching pivot sets, combines coefficients by the Chinese remainder algorithm, and uses #raw("rat") to propose rational rules. These steps preserve the absence of other pivot coordinates. All nonpivot coordinates receive explicit identity rules. Finally, for each retained integer equation the program substitutes every proposed rule, clears all denominators, and checks that every integer coefficient is zero. This is the exact check $W P = 0$ in Lemma 14.

Every actual moment vector satisfies the selected equations, so this check suffices even if additional generated equations have not been used. In particular, the modular pivot count is not asserted to be the full rational rank of the original system. A prime that conceals an additional independent equation merely leaves that true equation unused. The rational reconstruction and its size threshold are ways to find a candidate $P$; the exact check and the lemma establish its validity.

=== 7.2 Pair equations and the vanishing identity <pair-equations-and-the-vanishing-identity>

For an integer array $A$ with zero row and column sums, put

$ "wt" \( A \) = sum_i "ord" \( A_(i \, *) \) . $

This also equals the sum of the column orders. Arrays name the real injective moments $m_H \( A \)$ of Section 3; the empty array names the constant moment $1$. A formal linear expression in these moments is stored as a finite list of rational coefficients indexed by arrays. Coefficients at the same index are added, and zero coefficients are discarded. These are the operations #raw("add") and #raw("lin") in the program.

The routine #raw("canonpair") selects a representative using precisely the symmetries of $m_H$: permutation of either axis, removal of zero rows and columns, global negation, and transposition. More explicitly, after removing zero axes it considers $A \, - A \, A^(sans(T)) \, - A^(sans(T))$, retains orientations with at least as many rows as columns, orders columns by their positive-part orders, and minimizes over the remaining column permutations after lexicographically sorting the rows. Each operation preserves the moment by its definition and Lemma 4. The degree orders and lexicographic choices serve only to select consistent names.

Define $U_0 \( A \)$ recursively as a linear expression in representatives whose nonzero row and column orders are all at least two. If a row of $A$, or of $A^(sans(T))$, has order one, apply Lemma 4 in that orientation:

#[#set math.equation(numbering: n => "(42)")
 $ U_0 \( A \) = - frac(1, 7 - p) sum_(ell eq.not i) U_0 \( A_(i arrow.r ell) \) \, #h(2em) p lt.eq 6 . $ <eq:recursive-pair-reduction>]

Canonicalize each contracted array before continuing. If no such row exists on either axis, retain its moment as a single coordinate. The empty array is retained in the same way. Every contraction reduces the sum of the two axis lengths, so this recursion terminates. This is #raw("evpair"); #raw("expand_degree1") supplies the unsigned sum of contractions. The program checks that every evaluated array has both dimensions at most six and has zero sums on both axes.

The pair table is formed from formal seven-row equations. The exact enumeration restrictions are as follows:

+ Choose a total weight $k in { 7 \, 8 \, 9 \, 10 \, 11 }$ and a column count $q$ with $2 lt.eq q lt.eq min \( 4 \, floor.l k \/ 2 floor.r \)$.
+ Choose nondecreasing sequences of seven row orders $\( r_0 \, dots.h \, r_6 \)$ and $q$ column orders $\( c_0 \, dots.h \, c_(q - 1) \)$. Both sequences sum to $k$, and
  $ 1 lt.eq r_i lt.eq floor.l k \/ 2 floor.r \, #h(2em) 2 lt.eq c_j lt.eq floor.l k \/ 2 floor.r . $
+ Enumerate integer $7 times q$ arrays with zero row and column sums and exactly these orders. Rows of equal order may be put in lexicographic order, and arrays with the same canonical representative may be skipped.

The routines #raw("parts"), #raw("comps"), and #raw("allAB") implement this enumeration. A row is generated as the difference of disjointly supported nonnegative compositions of its prescribed order, within the remaining positive and negative column capacities. The capacities enforce the prescribed column orders. The first row has order one: seven positive integer row orders with sum at most eleven cannot all be at least two, and the orders are sorted.

For each retained array, the seven-row boundary case of Lemma 4 gives the equation

#[#set math.equation(numbering: n => "(43)")
 $ sum_(ell = 1)^6 U_0 \( A_(0 arrow.r ell) \) = 0 . $ <eq:pair-table-equations>]

Here $0 \, dots.h \, 6$ index the formal rows, not coordinates of a charge. Only the contracted arrays, which have at most six rows, are evaluated. The checks in #raw("pairtable") verify the balance, number of formal rows, and order of the first row before forming this equation. Skipping an array can only omit an available true equation; the proof does not require a complete set of moment relations.

Apply Lemma 14 to these equations. Write $U \( A \)$ for the resulting expansion of $U_0 \( A \)$ in the retained moment coordinates. For a product used here, with charge columns $a_1 \, dots.h \, a_n$ and $n lt.eq 4$, let $A_(cal(S))$ be the array obtained by adding the columns in each block of a set partition $cal(S)$ of ${ 1 \, dots.h \, n }$. The final pair expansion is

#[#set math.equation(numbering: n => "(44)")
 $ sum_(cal(S) upright(" a set partition")\
\| cal(S) \| lt.eq 6) frac(\( 6 \)_(\| cal(S) \|), 6^n) thin U \( A_(cal(S)) \) . $ <eq:verified-partition-expansion>]

This is exactly Lemma 5. The routine #raw("partition") enumerates set partitions by numbering blocks in order of first occurrence, and #raw("rep_pair") implements (44). The routine #raw("apair") first forms the array of charge columns. It may remove a zero charge before the expansion, since that removes the factor $g_H \( 0 \) = 1$. Deletion of zero coordinate rows is also legitimate: a uniform injection on the retained positions has the required uniform marginal.

For the pair certificate, #raw("check_pair") forms the displayed polynomial $L_H$ of Proposition 6, with coefficients $- 1 \, 2 \, 1 \, 1 \, 1$. It multiplies each monomial by the conjugate of every monomial, expanding $3 \| L_H \|^2$ through (44). For each of the two stated charges $q$, it adds the expansion with charge columns $\( alpha \, q \, - alpha \, - q \)$. After the exact pair substitutions, the result has no nonzero coefficient, for either $q$. This proves the identity in Proposition 6; all expressions used in the check have been identified with their actual averaged moment values above.

=== 7.3 Mixed keys and the finite mixed table <mixed-keys-and-the-finite-mixed-table>

We use the notation $cal(M) \( upright(bold(s)) \; upright(bold(a)) \)$ and $m \( A \)$ from Section 6. The latter is the average of $m_H \( A \)$ over the ordered basis pairs. A mixed key consists of a label tuple $upright(bold(s))$ and an array $A$ whose columns are the charges. The array has at most six nonzero coordinate rows. Its rows and columns sum to zero. The routine #raw("cmix") chooses representatives by simultaneous factor and label permutations, renaming labels by order of first occurrence, sorting the common coordinate rows, global negation, and removing zero factors and zero coordinate rows. These are exactly the symmetries justified in Lemma 12. The separate tag $\( diameter \, A \)$ names the pair moment $m \( A \)$; the completely empty key names $1$.

The routine #raw("evmix") supplies the following recursive expansion of a key into named moment coordinates:

+ If a charge has order one or is a permutation of $alpha$, the mixed moment is zero.
+ When at most one label remains, expand the product by (44), now using the averaged pair moments $m \( A \)$, and attach the pair tag to its coordinates. If this single-label expression was zero by the preceding rule, also record its pair expansion as a zero equation. These recorded equations are stored in #raw("rows0").
+ Otherwise, if an order-two charge has a label occurring exactly once among the factors, let $l$ be the number of labels in use and replace that label in turn by each of the other $l - 1$ labels. The original moment is $- 1 \/ \( 7 - l \)$ times the sum of the resulting moments. Apply the same rules recursively to each term.
+ If none of these rules applies, retain the key as an original mixed-moment coordinate.

The zero rules and the singleton coefficient follow from Lemma 12. Each singleton replacement decreases the number of distinct labels. The single-label use of the pair table is legitimate because the real average over ordered pairs includes the required transpose symmetry, as proved in that lemma.

The finite enumeration of triples is given by #raw("triples(11)"). For precision, it generates balanced charges $a \, b \, c in bb(Z)^6$ with

$ a + b + c = 0 \, #h(2em) 0 lt.eq "ord" \( c \) lt.eq "ord" \( b \) lt.eq "ord" \( a \) lt.eq 5 \,\
"ord" \( a \) + "ord" \( b \) + "ord" \( c \) lt.eq 11 . $

Choose $a$ up to a coordinate permutation and sign by taking the lesser of its sorted entries and the sorted entries of $- a$. Enumerate all balanced $b$ of orders at most $"ord" \( a \)$, put $c = - a - b$, and retain those meeting the displayed restrictions. Sorting the six rows of the array $\( a \, b \, c \)$ removes common-coordinate duplicates. Balanced vectors of a given order are generated by subtracting two disjointly supported nonnegative compositions of that order, which is the routine #raw("vecs").

For each generated array, #raw("mixeq") first evaluates all five equality patterns on its three labels, registering any single-label zero equations. It then considers the distinct permutations of the three charge columns, choosing $a lt.eq b$ lexicographically to avoid duplicated first-two-column orderings. Write

$ a_(i j) = a + e_i - e_j \, #h(2em) b_(i j) = b - e_i + e_j quad \( 0 lt.eq i \, j lt.eq 5 \) . $

The following equations are included after applying #raw("evmix") to every term:

- For different first two labels, sum the moments with charges $\( a_(i j) \, b_(i j) \, c \)$ over all $i eq.not j$, obtaining zero by (14). For nonzero $c$, use the label tuples $\( 0 \, 1 \, 2 \)$, $\( 0 \, 1 \, 0 \)$, and $\( 0 \, 1 \, 1 \)$; for $c = 0$, use $\( 0 \, 1 \, 0 \)$. Include this equation only if all $36$ shifted triples have total order at most eleven.
- For equal first two labels, fix $i$, sum over all six $j$, and subtract the moment with charges $\( - c \, c \)$ and labels $\( 0 \, u \)$, by (13). Use $\( 0 \, 0 \, u \)$ with $u = 0 \, 1$ when $c eq.not 0$, and $u = 0$ when $c = 0$. Also use the reversed shifts $\( a + e_j - e_i \, b - e_j + e_i \, c \)$. Include each equation only if all its six shifted triples have total order at most eleven.

The third charge is unchanged in these sums because the equations have been multiplied by its factor. On the right side of the equal-label equation, $a + b = - c$, which explains both remaining charges and the labels selected by #raw("s[-2:]") in the source.

Finally add the pair equations recorded in #raw("rows0"). All coordinates encountered by these reductions are registered, including coordinates that cancel in a particular equation. With the specified coordinate order, #raw("mixtable") applies Lemma 14 to the nonzero equations. A vanishing expression encountered later may still be replaced by zero: its vanishing is an independently proved rule, whether or not its pair expansion was used to strengthen this table. No completeness of the enumeration, and no vanishing of unlisted higher-order moments, is assumed.

The exact table dimensions are as follows. The witness column counts the independent equations used in Lemma 14.

#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Table
], table.cell(rowspan: 1, colspan: 1)[Nonzero equations
], table.cell(rowspan: 1, colspan: 1)[Coordinates
], table.cell(rowspan: 1, colspan: 1)[Witness rows
]),
  table.cell(rowspan: 1, colspan: 1)[Pair
], table.cell(rowspan: 1, colspan: 1)[$8871$
], table.cell(rowspan: 1, colspan: 1)[$909$
], table.cell(rowspan: 1, colspan: 1)[$897$
],
  table.cell(rowspan: 1, colspan: 1)[Mixed
], table.cell(rowspan: 1, colspan: 1)[$46041$
], table.cell(rowspan: 1, colspan: 1)[$3429$
], table.cell(rowspan: 1, colspan: 1)[$2767$
],
)
]

=== 7.4 Positive matrices and the negative bound <positive-matrices-and-the-negative-bound>

For the mixed certificate, the literal data in Appendix 8 specify the six lists and lower triangles of the symmetric integer matrices $Z_lambda$. The routine #raw("makeZ") checks the number of entries and reconstructs each symmetric matrix. Positive definiteness is verified without eigenvalue approximation. At each step, #raw("posdef") writes the remaining matrix as

$ B = mat(delim: "(", C, u; u^(sans(T)), p) \, #h(2em) p > 40000 \, $

and replaces it by the exact Schur complement $C - u u^(sans(T)) \/ p$. The identity

$ vec(x, t)^(#h(-0.16667em) *) B vec(x, t) = x^(*) \( C - u u^(sans(T)) \/ p \) x + p lr(|t + frac(u^(sans(T)) x, p)|)^2 $

shows inductively that positive pivots prove positive definiteness, also for complex vectors. All $98$ pivots in the six matrices satisfy the asserted rational inequality.

The routines #raw("permsign") and #raw("polynomial") implement the signed permutation sums defining $Y_lambda$ in Section 6. The convention $\( P_p v \)_i = v_(p \( i \))$ gives $\( P_p P_q v \)_i = v_(q \( p \( i \) \))$, exactly #raw("perm(perm(v,q),p)"). The routine #raw("tagmom") uses the Gram charges $\( a \, - v \, v - a \)$ of Lemma 11. After multiplying the entire form by five, #raw("product") assigns weight five unless both function types are one; in that case the weights for equal and different external labels are one and four. The lower-triangle summation in #raw("gaps") doubles the off-diagonal terms. Since the polynomial coefficients and $Z_lambda$ are real, its real-moment expansion equals the full quadratic form for complex $Y_lambda$.

Consequently the expression formed by #raw("gaps") is exactly

$ cal(Q) = 5 sum_lambda 10^(15 - e_lambda) bb(E) #scale(x: 120%, y: 120%)[\(] Y_lambda^(*) Z_lambda Y_lambda #scale(x: 120%, y: 120%)[\)] . $

Apply #raw("evmix") and then the certified mixed substitutions. On combining coefficients, we obtain the residual expansion in (40), now indexed by the program’s moment keys:

#[#set math.equation(numbering: n => "(45)")
 $ cal(Q) = c_0 + sum_(K eq.not diameter) c_K thin mu_K \,\
c_0 = - 613302797399911 / 6480 \, #h(2em) sum_(K eq.not diameter) \| c_K \| = 179721388988719 / 6480 . $ <eq:exact-residual-coefficients>]

Here $mu_K$ denotes the original moment named by a retained coordinate; the notation $K eq.not diameter$ excludes the completely empty constant key. Both equalities of rational coefficients in (45) are checked exactly by the program, as is their strictly negative sum.

It remains to justify the bound on these residual coordinates. A tagged pair coordinate is a real average of unit-modulus monomials, so $\| m \( A \) \| lt.eq 1$. A mixed coordinate is a real average of products of $g_s \( a \)$, each of absolute value at most one, so $\| cal(M) \( upright(bold(s)) \; upright(bold(a)) \) \| lt.eq 1$. Every coordinate retained by the substitutions is one of these original moments. The new linear combinations occur as expressions in the coordinates, not as newly named coordinates to which a bound is assigned. The constant coordinate is exactly one. Hence

$ 0 lt.eq cal(Q) lt.eq c_0 + sum_(K eq.not diameter) \| c_K \| = - 2007321335237 / 30 < 0 . $

This proves Proposition 13. Together with the pair coefficient check, it completes the exact verification of both certificates using only the finite equations and integer data specified in Appendix 8.

== 8 Complete exact verifier <app:code>

This appendix gives the exact verifier for Propositions 6 and 13. The cubic character counts are specified by the finite sums and loops following Table 1.

The program below uses only the Python standard library and runs with Python 3.8 or later, with assertions enabled. Its standalone file is #raw("verification/verify.py"). The accompanying wrapper #raw("verification/run.py") checks that assertions are enabled and that the verifier has the expected checksum before running it. From the paper directory, execute

#raw("python3 verification/run.py")

The complete expected output is

#raw(block: true, lang: "", "rank table: 8871 909 897\nrank table: 46041 3429 2767\n-613302797399911/6480 179721388988719/6480 5000000000000000")

In each #raw("rank table") line, the three entries give the number of nonzero equations, the number of moment coordinates, and the number of independent witness rows used for substitution, respectively. The final line gives the constant coefficient, the sum of the absolute values of all nonconstant coefficients, and the overall normalizing scale $5 dot.op 10^15$. Dividing the first two entries by this scale gives the constant and residual coefficient norm for $sum_lambda 10^(- e_lambda) bb(E) \( Y_lambda^(*) Z_lambda Y_lambda \)$. Every assertion in the program is checked in integer or rational arithmetic.

For reference, the SHA-256 checksum of #raw("verification/verify.py") is

104a7306205b8544c8f913f6afdb59603f2e 04a207c9ac592c383b80eb0e2aa9

The literal #raw("data") near the end specifies each shape, its ordered list of function types and charges, its decimal scale exponent, and the lower triangle of its symmetric integer matrix, in row order.

Equation numbers in the code comments use the original numbering: the reference in #raw("expand_degree1") is to the contractions of Lemma 4, and those in #raw("mixeq") are to (13) and (14).

#raw(block: true, lang: "Complete exact verifier", "")

#bibliography("refs.bib", style: "ieee", title: [References])
