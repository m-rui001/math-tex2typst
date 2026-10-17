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

#align(center)[#text(size: 16pt, weight: "bold")[An Upper Bound of $9 \/ 4$ for the \
Matrix Multiplication Exponent]]
#align(center)[OpenAI]
#align(center)[October 2, 2026]

== 1 Introduction <sec:intro>

The exponent $omega$ of matrix multiplication over $bb(C)$ is the infimum of the real numbers $tau$ such that, for every $epsilon > 0$, two $n times n$ matrices can be multiplied in $O_epsilon \( n^(tau + epsilon) \)$ scalar arithmetic operations. The dimension $n$ tends to infinity; the algorithm and its constants may depend on $epsilon$. We prove the following bound.

#thm([Theorem 1.1.])[
  #emph[For every $epsilon > 0$, two $n times n$ complex matrices can be multiplied using $O_epsilon \( n^(9 \/ 4 + epsilon) \)$ arithmetic operations. In particular, $omega lt.eq 9 \/ 4$.]
] <thm:main>

Strassen’s seven-product algorithm for two-by-two matrices showed that recursion can reduce the arithmetic exponent below three [13]. Bilinear algorithms can be represented by trilinear coefficient arrays, or tensors; linear substitutions and tensor products then express reductions and recursive composition. Approximate bilinear algorithms enlarge the available constructions, and Bini’s interpolation argument converts them into exact asymptotic algorithms [3]. Schönhage’s asymptotic sum inequality turns efficient simultaneous computations of independent matrix products into bounds on the exponent [11]. Strassen’s laser method extracts such independent products from tensor powers [14,15]. His asymptotic spectrum describes asymptotic tensor comparisons through numerical invariants compatible with sums, products, and restrictions [16,4].

Coppersmith and Winograd combined tensor powers with progression-free sets to extract independent products from an auxiliary form [5]. Higher-power analyses by Stothers [12] and Davie–Stothers [6], Vassilevska Williams [18], and Le Gall [10] developed this construction; Le Gall formulated its analysis through convex optimization. Alman and Vassilevska Williams refined the extraction of independent components [2]. Duan, Wu, and Zhou analyzed losses caused by combining components across recursion levels [7]. Further asymmetric analyses by Vassilevska Williams, Xu, Xu, and Zhou [19] and Alman et al. [1] improved the resulting bounds. Dupont et al. report $omega < 2.371177$ by optimizing this combination-loss framework [8].

The present proof combines explicit tensor degenerations with the spectral viewpoint. It derives inequalities for character values on polynomial multiplication, then uses their discrete growth to bound the values on matrix multiplication. Interpolation, counting words with prescribed frequencies, and balancing the tensor legs retain their roles from the earlier tensor-power methods. The central finite construction here separates blocks that already have independent variables on two of their three legs. Theorem 1 concerns the asymptotic arithmetic exponent; its proof does not specify a competitive finite matrix size.

===== 1.1 Separation and polynomial multiplication. <separation-and-polynomial-multiplication.>

The three variable groups of a trilinear form are called legs. A basic difficulty in tensor constructions is that useful pieces can share variables. A full direct sum requires independent variables on all three tensor legs. Our principal construction starts with blocks that are independent on two legs and share the third. A finite Fourier projection supplies a tentative block label on the shared leg, and a degeneration whose total weight is the square of the label mismatch retains exactly the correct labels. The resulting independent blocks each carry an auxiliary dot product. The number of output blocks compensates for the cost of the Fourier copies at the exponential scale. Proposition 5 and Corollary 6 give this construction and its entropy consequence for arbitrary tensors with this block structure.

We apply the separation inequality to ordinary polynomial multiplication. A determinant filtration compares neighboring input degrees, while a three-sector decomposition compares one input length with roughly three times that length. The determinant filtration is preserved by every multiplication map, so one choice of bases and weights works simultaneously for all first-input slices.

===== 1.2 Route to the exponent. <route-to-the-exponent.>

We use Strassen’s spectral viewpoint [16,4]: tensor characters are normalized numerical invariants that add on direct sums, multiply on tensor products, and are monotone under restriction. The detecting-character result, Lemma 3, makes it sufficient to bound these invariants on matrix multiplication for every character. Each character has value $n^(3 t)$ there for a positive parameter $t$. Multiplication of polynomials with coefficient vectors of lengths $a \, b$ has an output vector of length $a + b - 1$. We measure this tensor by a normalized geometric mean of its character values under all six permutations of the legs. The resulting profile $P \( a \, b \)$ is positive and symmetric in the input lengths. Polynomial interpolation gives $P \( a \, b \) lt.eq \( a + b - 1 \)^(1 \/ t)$. The two constructions above show that its successive increments do not increase in either input length and that

$ P \( a \, 3 h + a - 1 \) gt.eq 3 P \( a \, h \) . $

Together with $P \( 1 \, b \) = b$, these properties force $P \( a \, a \) gt.eq a^(4 \/ 3)$. Comparing the two growth rates yields $t lt.eq 3 \/ 4$, hence $3 t lt.eq 9 \/ 4$.

Section 2 introduces the character framework and states the required existence result. Section 3 proves the separation inequality, and Section 4 derives the two polynomial inequalities. Section 5 proves the discrete growth estimate and completes the arithmetic argument. Appendix 6 gives a complete proof of the character-existence result used here.

== 2 Tensors and their characters <sec:characters>

We first describe the numerical invariants to which the constructions will be applied. Throughout, tensors are finite trilinear forms over $bb(C)$. Their three variable groups are called the $X$-, $Y$-, and $Z$-legs. A #emph[restriction] applies an independent linear substitution on each leg. We write $A gt.eq B$ if $B$ is a restriction of $A$.

The tensor product multiplies coefficient arrays and pairs the corresponding variable indices on each leg. Let $S$ be the set of tensors modulo mutual restriction. Full direct sum and tensor product make $S$ a commutative semiring, and restriction induces an order compatible with both operations. We write products either by juxtaposition or by $⊗$. The zero tensor is $0$, the scalar tensor $x y z$ is $1$, and the integer $m gt.eq 0$ denotes the direct sum of $m$ copies of $1$. Thus $m A = A^(xor m)$. In a full direct sum, the summands have disjoint variables on all three legs.

The tensor rank $"R" \( A \)$ is the least integer $m$ with $m gt.eq A$. It is finite by expansion in bases. Every nonzero tensor restricts to $1$, by evaluating its three arguments on suitable lines, so

#[#set math.equation(numbering: n => "(2.1)")
 $ "R" \( A \) gt.eq A gt.eq 1 #h(2em) \( A eq.not 0 \) . $ <eq:boundedness>]

Rank is monotone, subadditive, and submultiplicative. We do not assume its additivity. A #emph[leg flattening] is the matrix obtained by placing that leg against the pair of other legs. Its matrix rank is restriction-monotone, additive on full direct sums, and multiplicative on tensor products.

The trilinear form encoding $n times n$ matrix multiplication and its exact-rank exponent are

#[#set math.equation(numbering: n => "(2.2)")
 $ T_n = sum_(i \, j \, k = 1)^n x_(i j) y_(j k) z_(k i) \, #h(2em) nu = inf_(n gt.eq 2) log_n "R" \( T_n \) . $ <eq:mm>]

Reindexing identifies $T_n T_m$ with $T_(n m)$. Flattening and the displayed expansion give $n^2 lt.eq "R" \( T_n \) lt.eq n^3$, so $2 lt.eq nu lt.eq 3$ and $"R" \( T_n \) gt.eq n^nu$. At the end of the proof we convert the bound on $nu$ into the asserted arithmetic bound.

#prodef([Definition 2.1.])[
  A #emph[tensor character] is an additive, multiplicative, restriction-monotone map $lambda : S arrow.r bb(R)_(gt.eq 0)$ with $lambda \( 1 \) = 1$.
] <def:character>

The three flattening ranks are examples. Characters are the spectral points of the tensor semiring [16,4]. They satisfy $lambda \( m \) = m$ and $1 lt.eq lambda \( A \) lt.eq "R" \( A \)$ for $A eq.not 0$. The following special case of spectral separation is the only existence statement needed. Its proof in Appendix 6 uses finite dimensional separation, compactness, and a fixed-point theorem.

#thm([Lemma 2.2.])[
  (Detecting characters).  #emph[Let $d gt.eq 2$ and $k gt.eq 0$ be integers with $k < d^nu$, where $nu$ is defined by (2.2). There is a tensor character $lambda$ with $lambda \( T_d \) gt.eq k$.]
] <lem:existence>

=== 2.1 Dot-product exponents <dot-product-exponents>

For $m gt.eq 1$, define the oriented dot products by

$ B_X \( m \) = x sum_(i = 1)^m y_i z_i \, $

and $B_Y \( m \) \, B_Z \( m \)$ obtained by cyclically permuting the legs. For any character there are numbers $p_X \, p_Y \, p_Z in \[ 0 \, 1 \]$ such that

#[#set math.equation(numbering: n => "(2.3)")
 $ lambda \( B_X \( m \) \) = m^(p_X) \, #h(2em) lambda \( B_Y \( m \) \) = m^(p_Y) \, #h(2em) lambda \( B_Z \( m \) \) = m^(p_Z) . $ <eq:dot>]

Indeed, $f \( m \) = lambda \( B_X \( m \) \)$ is positive and nondecreasing, satisfies $f \( m n \) = f \( m \) f \( n \)$, and lies between $1$ and $m$. Put $p_X = log_2 f \( 2 \)$. For $r gt.eq 1$, let $ell = floor.l r log_2 m floor.r$. Comparison with $2^ell lt.eq m^r < 2^(ell + 1)$ gives $f \( 2 \)^ell lt.eq f \( m \)^r lt.eq f \( 2 \)^(ell + 1)$. Taking logarithms and letting $r arrow.r oo$ proves the first identity; the other two follow in the same way.

The product $B_X \( m \) B_Y \( m \) B_Z \( m \)$ has variables $x_(b c) \, y_(a c) \, z_(a b)$ and monomials $x_(b c) y_(a c) z_(a b)$, so it is isomorphic to $T_m$. Consequently

#[#set math.equation(numbering: n => "(2.4)")
 $ lambda \( T_m \) = m^(p_X + p_Y + p_Z) . $ <eq:character-mm>]

Setting all off-diagonal variables of $T_m$ to zero leaves $m$ independent scalar products. Hence $T_m gt.eq m$, and $p_X + p_Y + p_Z gt.eq 1$. In particular, the parameter $t = \( p_X + p_Y + p_Z \) \/ 3$ used below is always positive.

=== 2.2 Degenerations and interpolation <degenerations-and-interpolation>

We use only the following elementary form of degeneration. After fixed linear substitutions, give each variable an integer weight, multiply it by the corresponding power of a parameter $epsilon$, and retain the terms of minimum total weight. Write $A arrow.r.squiggly B$ if this procedure takes $A$ to $B$, with the convention $0 arrow.r.squiggly 0$. Individual weights may be negative. Shifting the minimum total weight to zero makes the resulting tensor a polynomial in $epsilon$ with constant coefficient $B$.

#thm([Lemma 2.3.])[
  (Interpolation).  #emph[If $A arrow.r.squiggly B$, then $lambda \( A \) gt.eq lambda \( B \)$ for every tensor character $lambda$.]
] <lem:interpolation>

#proof[
  This is the interpolation passage from approximate to exact bilinear algorithms [3], applied to characters. Let $F \( epsilon \) = B + epsilon F_1 + dots.h.c + epsilon^L F_L$ be the transformed tensor. For each nonzero $epsilon$, it is a restriction of $A$. The polynomial $F \( epsilon \)^(⊗ j)$ has degree at most $j L$ and constant coefficient $B^(⊗ j)$. Interpolation at $j L + 1$ distinct nonzero points writes this coefficient as a linear combination of specializations. A linear combination of tensors on common spaces is a restriction of their full direct sum: identify the corresponding variables and absorb each scalar coefficient into one leg. Therefore
  $ lambda \( B \)^j lt.eq \( j L + 1 \) lambda \( A \)^j . $
  Taking $j$th roots and letting $j arrow.r oo$ proves the result. The degeneration, and hence $L$, is fixed during this limit. ◻
]

== 3 Separating a shared tensor leg <sec:separation>

Suppose blocks share their first leg, while each of the other two legs determines the same block label. The following construction makes the blocks fully independent. Its auxiliary factor is retained in the output and will supply the entropy gain.

#thm([Proposition 3.1.])[
  (Finite separation).  #emph[Let $M gt.eq 1$ and 
$ A = sum_(h = 1)^M A_h \, #h(2em) A_h in X ⊗ Y_h ⊗ Z_h \, $

 where the $Y_h$ are disjoint coordinate spaces and so are the $Z_h$. There are no terms between unmatched second- and third-leg sectors. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ A^(xor 5 M) arrow.r.squiggly xor.big_(h = 1)^M #scale(x: 120%, y: 120%)[\(] A_h ⊗ B_X \( M \) #scale(x: 120%, y: 120%)[\)] . $ <eq:finite-separation>]

 Each $A_h$ on the right has its own copy of $X$.]
] <prop:separation>

#proof[
  Choose a common first-leg basis $x_a$ and sector bases $y_(h \, b) \, z_(h \, c)$, and write
  $ A = sum_(h \, a \, b \, c) c_(h \, a \, b \, c) x_a y_(h \, b) z_(h \, c) . $
  The internal index ranges may depend on $h$. Set $L = 5 M$, and choose a primitive $L$th root of unity $zeta$. Index the $L$ source copies by $r = 0 \, dots.h \, L - 1$. Introduce target variables $X_(a \, g) \, Y_(h \, b \, u) \, Z_(h \, c \, v)$, where $g \, u \, v in { 1 \, dots.h \, M }$. The index $g$ is a tentative sector label; $u \, v$ will supply the retained dot product. Make the substitutions
  $ x_a^(\( r \)) & mapsto sum_(g = 1)^M zeta^(2 r g) X_(a \, g) \,\
y_(h \, b)^(\( r \)) & mapsto sum_(u = 1)^M zeta^(r \( u - h \)) Y_(h \, b \, u) \,\
z_(h \, c)^(\( r \)) & mapsto 1 / L sum_(v = 1)^M zeta^(r \( - v - h \)) Z_(h \, c \, v) . $
  All copies map into the same target spaces. Summing over $r$ multiplies each target coefficient by
  $ 1 / L sum_(r = 0)^(L - 1) zeta^(r \[ u - v + 2 \( g - h \) \]) . $
  This is the indicator of equality modulo $L$. Since $\| u - v + 2 \( g - h \) \| lt.eq 3 \( M - 1 \) < L$, precisely the terms satisfying
  #[#set math.equation(numbering: n => "(3.2)")
   $ u - v + 2 \( g - h \) = 0 $ <eq:fourier>]
  survive. The phase on each leg uses only indices already present on that leg.
  To force the tentative label $g$ to equal $h$, give the target variables the weights
  $ w \( X_(a \, g) \) = g^2 \, #h(2em) w \( Y_(h \, b \, u) \) = h u - h^2 \, #h(2em) w \( Z_(h \, c \, v) \) = - h v . $
  On every surviving term, (3.2) gives
  $ g^2 + h u - h^2 - h v = \( g - h \)^2 gt.eq 0 . $
  The weight-zero tensor is therefore
  $ D = sum_(h \, a \, b \, c \, u) c_(h \, a \, b \, c) X_(a \, h) Y_(h \, b \, u) Z_(h \, c \, u) . $
  All three variable groups distinguish $h$. For each fixed $h$, the remaining equality of the $u$ indices supplies exactly $B_X \( M \)$. Thus $D$ is the full direct sum in (3.1). The transformed tensor has degree at most $\( M - 1 \)^2$, even though some individual variable weights are negative. ◻
]

The source in (3.1) uses $5 M$ copies in total. The output has $M$ full direct-sum blocks, each with an $M$-dimensional dot product. These are two different multiplicities: the dot-product index does not label additional full direct-sum blocks.

#thm([Corollary 3.2.])[
  (Shared-leg entropy inequality).  #emph[Let $T = sum_(i = 1)^s T_i$ be a sum of nonzero tensors with a common first space and matched, pairwise disjoint sectors on the other two legs, as in Proposition 5. For every tensor character $lambda$ and every probability vector $q = \( q_1 \, dots.h \, q_s \)$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ lambda \( T \) gt.eq e^(p_X H \( q \)) product_(i = 1)^s lambda \( T_i \)^(q_i) \, #h(2em) H \( q \) = - sum_(i = 1)^s q_i log q_i . $ <eq:entropy>]

 Here logarithms are natural and $0 log 0 = 0$.]
] <cor:entropy>

#proof[
  We use the fixed-frequency counting familiar from tensor-power arguments; see, for example, [10] Appendix A of the full version. Proposition 5 turns the number of words of a given frequency into the entropy factor in (3.3). First take $q$ rational and let $N$ run through multiples of a common denominator. On the second and third legs of $T^(⊗ N)$, retain only words with $N q_i$ occurrences of sector $i$. Every supported term has the same sector word on these two legs. The retained tensor $A$ therefore has
  $ M = frac(N !, product_i \( N q_i \) !) $
  matched sectors, with the first leg still shared. Each sector is a product of the prescribed $T_i$, up to reordering factors, and hence has character value $C_N = product_i lambda \( T_i \)^(N q_i)$. Proposition 5 and Lemma 4 give
  $ 5 M lambda \( T \)^N gt.eq 5 M lambda \( A \) gt.eq M^(1 + p_X) C_N . $
  Cancel $M$ and take $N$th roots. Stirling’s formula gives $N^(- 1) log M arrow.r H \( q \)$, proving (3.3) for rational $q$. For each fixed $N$, degeneration monotonicity was established first; no uniform bound on its degree as $N$ grows is required. Finally, $lambda \( T_i \) gt.eq 1$, so the right side of (3.3) is continuous on the probability simplex. Rational approximation proves the result for all $q$. ◻
]

== 4 Two inequalities for polynomial multiplication <sec:polynomial>

We now apply the shared-leg inequality to a family with a simple rank bound. For positive integers $a \, b$, let

#[#set math.equation(numbering: n => "(4.1)")
 $ C \( a \, b \) = sum_(i = 0)^(a - 1) sum_(j = 0)^(b - 1) x_i y_j z_(i + j) . $ <eq:convolution>]

This is multiplication of homogeneous binary forms of degrees $a - 1$ and $b - 1$, paired with the dual of the output space. Evaluation at $a + b - 1$ distinct points followed by interpolation gives $"R" \( C \( a \, b \) \) lt.eq a + b - 1$. Its output flattening has rank $a + b - 1$, since every output monomial is a product of input monomials. Hence

#[#set math.equation(numbering: n => "(4.2)")
 $ "R" \( C \( a \, b \) \) = a + b - 1 . $ <eq:convolution-rank>]

Fix a character $lambda$, put $t = \( p_X + p_Y + p_Z \) \/ 3 > 0$, and let $lambda_pi \( A \)$ denote its value after permuting the legs of $A$ by $pi in S_3$. Each $lambda_pi$ is again a character; denote its first-leg dot-product exponent by $p_X^(\( pi \))$. Each of the three original exponents occurs twice, so

#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(pi in S_3) p_X^(\( pi \)) = 2 \( p_X + p_Y + p_Z \) = 6 t . $ <eq:permutation-sum>]

Products over permuted legs are a standard balancing device in tensor-power analysis [10] Appendix A.3 of the full version. Here all six permutations make the profile insensitive to the leg exchanges used below. Define the #emph[symmetrized profile]

#[#set math.equation(numbering: n => "(4.4)")
 $ P \( a \, b \) = (product_(pi in S_3) lambda_pi \( C \( a \, b \) \))^(1 \/ \( 6 t \)) . $ <eq:profile>]

Interchanging the input legs permutes the factors in this product. Also $C \( 1 \, b \) = B_X \( b \)$. Together with (4.2) and (4.3), these observations give

#[#set math.equation(numbering: n => "(4.5)")
 $ P \( a \, b \) = P \( b \, a \) > 0 \, #h(2em) P \( 1 \, b \) = b \, #h(2em) P \( a \, b \) lt.eq \( a + b - 1 \)^(1 \/ t) . $ <eq:profile-basic>]

The next two lemmas give the additional constraints that force the diagonal values of $P$ to grow.

=== 4.1 A determinant filtration <a-determinant-filtration>

We obtain neighboring input lengths by tensoring with $B_X \( 2 \)$, which doubles the second-input and output spaces, and retaining the multiplication induced on suitable quotient and kernel spaces. The filtration must be preserved by multiplication by every first input, so that the resulting comparison is a degeneration of the whole tensor.

#thm([Lemma 4.1.])[
  (Discrete concavity).  #emph[For $a gt.eq 1$ and $b gt.eq 2$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ 2 P \( a \, b \) gt.eq P \( a \, b + 1 \) + P \( a \, b - 1 \) . $ <eq:concavity>]

 By symmetry, the analogous inequality holds in the first argument.]
] <lem:concavity>

#proof[
  Let $V_e$ be the degree-$e$ homogeneous forms in $u \, v$, and set $W_1 = "span" \( s \, w \)$ for a second pair of variables. The tensor $C \( a \, b \) ⊗ B_X \( 2 \)$ represents multiplication
  $ V_(a - 1) times \( V_(b - 1) ⊗ W_1 \) arrow.r V_(a + b - 2) ⊗ W_1 . $
  Put $D = u w - v s$. For $e gt.eq 1$, diagonal substitution $\( s \, w \) = \( u \, v \)$ gives the exact sequence
  #[#set math.equation(numbering: n => "(4.7)")
   $ 0 arrow.r D V_(e - 1) arrow.r V_e ⊗ W_1 arrow.r V_(e + 1) arrow.r 0 . $ <eq:det-sequence>]
  The last map is surjective on monomials. Its kernel contains $D V_(e - 1)$; multiplication by $D$ is injective, and both the kernel and $V_(e - 1)$ have dimension $e$, proving exactness. This is the determinant exact sequence underlying the degree-one Clebsch–Gordan construction [9] Section 2.6 of the author version. We next check the compatibility with all multiplication maps that is needed for the tensor degeneration.
  Choose quotient lifts $u^(e - i) v^i s$ for $0 lt.eq i lt.eq e$, followed by $v^e w$, and append the kernel basis $D u^(e - 1 - j) v^j$ for $0 lt.eq j < e$. Their diagonal images and their kernel factors are the standard monomial bases. Use these bases at degrees $b - 1$ and $a + b - 2$. For every $f in V_(a - 1)$, multiplication commutes with diagonal substitution and sends $D g$ to $D \( f g \)$. Thus every slice has the form
  #[#set math.equation(numbering: n => "(4.8)")
   $ & upright("input quotient") & upright("input kernel")\
upright("output quotient") & M_f^(+) & 0\
upright("output kernel") & * & M_f^(-) $ <eq:block>]
  in these fixed bases. Here $M_f^(+)$ is multiplication $V_b arrow.r V_(a + b - 1)$, and $M_f^(-)$ is multiplication $V_(b - 2) arrow.r V_(a + b - 3)$. In particular, the two diagonal tensor blocks are exactly $C \( a \, b + 1 \)$ and $C \( a \, b - 1 \)$.
  Give weight zero to the first leg and to all quotient coordinates, weight $- 1$ to the second-leg kernel coordinates, and weight $+ 1$ to the output-dual kernel coordinates. The only potentially negative block in (4.8) is zero. The block marked $*$ has weight $+ 1$ and disappears. The weight-zero tensor therefore consists of $C \( a \, b + 1 \)$ and $C \( a \, b - 1 \)$, with a common first leg and disjoint second and third legs. For example, when $a = b = 2$, the identity $u \( v w \) = v^2 s + v D$ shows that multiplication of a quotient lift can have both quotient and kernel components.
  Applying degeneration monotonicity and Corollary 6 to these two blocks, for any probability pair $q = \( q_(+) \, q_(-) \)$ we obtain
  $ 2^(p_X^(\( pi \))) lambda_pi \( C \( a \, b \) \) gt.eq e^(p_X^(\( pi \)) H \( q \)) lambda_pi \( C \( a \, b + 1 \) \)^(q_(+)) lambda_pi \( C \( a \, b - 1 \) \)^(q_(-)) . $
  Use the same $q$ for all six characters. By (4.3), multiplication and the power $1 \/ \( 6 t \)$ yield
  $ 2 P \( a \, b \) gt.eq e^(H \( q \)) P \( a \, b + 1 \)^(q_(+)) P \( a \, b - 1 \)^(q_(-)) . $
  For positive $A \, B$, the maximum of $e^(H \( q \)) A^(q_(+)) B^(q_(-))$ is $A + B$, attained at $q = \( A \, B \) \/ \( A + B \)$. For positive $q_(+) \, q_(-)$, this follows from the weighted arithmetic-geometric mean inequality applied to $A \/ q_(+)$ and $B \/ q_(-)$; the boundary follows by continuity. Taking this common maximizing pair proves (4.6). ◻
]

=== 4.2 Three sectors <three-sectors>

#thm([Lemma 4.2.])[
  (Shifted tripling).  #emph[For all positive integers $a \, h$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ P \( a \, 3 h + a - 1 \) gt.eq 3 P \( a \, h \) . $ <eq:tripling>]

]
] <lem:tripling>

#proof[
  Put $B = 3 h + a - 1$. A supported term of $C \( a \, B \)$ has indices $0 lt.eq x < a$, $0 lt.eq y < B$, and $z = x + y$. Partition the $Y$-indices and $Z$-indices as follows:
  $ & upright("left") & upright("middle") & upright("right")\
Y & \[ 0 \, h - 1 \] & \[ h \, 2 h + a - 2 \] & \[ 2 h + a - 1 \, 3 h + a - 2 \]\
Z & \[ 0 \, h + a - 2 \] & \[ h + a - 1 \, 2 h + a - 2 \] & \[ 2 h + a - 1 \, 3 h + 2 a - 3 \] . $
  Give weight $+ 1$ to middle $Y$-coordinates, weight $- 1$ to middle $Z$-coordinates, and zero to all other coordinates. A left $Y$-index forces a left $Z$-index, because $x + y lt.eq h + a - 2$; a right $Y$-index forces a right $Z$-index. Thus no supported term has negative weight. The weight-zero part consists exactly of the three matched sectors. Figure 1 shows the smallest nontrivial example.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((2, 3.1), [#text(size: 9pt)[$Z$-index]])
  content((0.4, 2.728), [#text(size: 9pt)[$0$]])
  content((1.2, 2.728), [#text(size: 9pt)[$1$]])
  content((2, 2.728), [#text(size: 9pt)[$2$]])
  content((2.8, 2.728), [#text(size: 9pt)[$3$]])
  content((3.6, 2.728), [#text(size: 9pt)[$4$]])
  content((-0.16, 2.17), [#text(size: 9pt)[$y=0$]], anchor: "east", padding: 0.1176cm)
  content((-0.16, 1.55), [#text(size: 9pt)[$y=1$]], anchor: "east", padding: 0.1176cm)
  content((-0.16, 0.93), [#text(size: 9pt)[$y=2$]], anchor: "east", padding: 0.1176cm)
  content((-0.16, 0.31), [#text(size: 9pt)[$y=3$]], anchor: "east", padding: 0.1176cm)
  rect((0, 1.86), (1.6, 2.48), fill: rgb("#e6e6e6"), stroke: none)
  rect((1.6, 0.62), (2.4, 1.86), fill: rgb("#e6e6e6"), stroke: none)
  rect((2.4, 0), (4, 0.62), fill: rgb("#e6e6e6"), stroke: none)
  line((0, 0), (0, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0.8, 0), (0.8, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.6, 0), (1.6, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.4, 0), (2.4, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.2, 0), (3.2, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((4, 0), (4, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (4, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.62), (4, 0.62), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.24), (4, 1.24), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.86), (4, 1.86), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.48), (4, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  rect((0, 1.86), (1.6, 2.48), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((1.6, 0.62), (2.4, 1.86), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((2.4, 0), (4, 0.62), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.4, 2.17), [#text(size: 9pt)[$x_0$]])
  content((1.2, 2.17), [#text(size: 9pt)[$x_1$]])
  content((1.2, 1.55), [#text(size: 9pt)[$x_0$]])
  content((2, 1.55), [#text(size: 9pt)[$x_1$]])
  content((2, 0.93), [#text(size: 9pt)[$x_0$]])
  content((2.8, 0.93), [#text(size: 9pt)[$x_1$]])
  content((2.8, 0.31), [#text(size: 9pt)[$x_0$]])
  content((3.6, 0.31), [#text(size: 9pt)[$x_1$]])
  line((0.96, 1.364), (1.44, 1.736), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.56, 0.744), (3.04, 1.116), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.4, 1.984), [#text(size: 9pt)[Shaded: weight $0$]], anchor: "west", padding: 0.1176cm)
  content((4.4, 1.364), [#text(size: 9pt)[Crossed: weight $+1$]], anchor: "west", padding: 0.1176cm)
  content((4.4, 0.744), [#text(size: 9pt)[Blank: no term]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: The degeneration of $C \( 2 \, 4 \)$, with $a = 2 \, h = 1$. A cell $\( y \, z \)$ contains $x_i$ when $z = y + i$. The three shaded blocks survive, and the two crossed terms disappear. The blocks have disjoint $Y$- and $Z$-coordinates but share $x_0 \, x_1$. The middle block is $C \( 2 \, 1 \)$ with its second and third legs exchanged and its first-leg basis reversed. ],
  ) <fig:tripling>
  Translations identify the two outer branches with $C = C \( a \, h \)$. The middle branch is
  $ sum_(u = 0)^(a - 1) sum_(r = 0)^(h - 1) x_(a - 1 - u) y_(h + u + r) z_(h + a - 1 + r) . $
  It is $C$ with its second and third legs exchanged and its first-leg basis reversed. The reversal identifies this individual branch; no different first-leg maps are applied to the three branches of the whole tensor.
  Let $sigma$ exchange the second and third legs. The uniform probability vector on the three branches gives
  $ lambda_pi \( C \( a \, B \) \) gt.eq 3^(p_X^(\( pi \))) lambda_pi \( C \)^(2 \/ 3) lambda_pi \( C^sigma \)^(1 \/ 3) . $
  Composition with $sigma$ permutes the six leg permutations. Thus $product_pi lambda_pi \( C^sigma \) = product_pi lambda_pi \( C \)$. Multiplying the six inequalities and taking the power $1 \/ \( 6 t \)$ proves (4.9). ◻
]

== 5 Discrete growth and the arithmetic exponent <sec:growth>

The tensor constructions are complete. The following lemma turns the profile’s concavity and shifted tripling into growth along the diagonal.

#thm([Lemma 5.1.])[
  (Diagonal growth).  #emph[Let $P : bb(N)_(> 0)^2 arrow.r bb(R)_(> 0)$ be symmetric, with $P \( 1 \, b \) = b$. Suppose it satisfies (4.6) for $a gt.eq 1 \, b gt.eq 2$ and (4.9) for $a \, h gt.eq 1$. Then $P \( a \, a \) gt.eq a^(4 \/ 3)$ for every $a gt.eq 1$.]
] <lem:growth>

#proof[
  For fixed $a$, concavity makes the increments $Delta_(a \, h) = P \( a \, h + 1 \) - P \( a \, h \)$ nonincreasing in $h$. Set $D_a = P \( a \, a \)$ and $H_a = 2 D_a \/ \( 3 a - 1 \)$. Tripling with $h = a$ gives
  $ 2 D_a lt.eq P \( a \, 4 a - 1 \) - D_a = sum_(h = a)^(4 a - 2) Delta_(a \, h) lt.eq \( 3 a - 1 \) Delta_(a \, a) . $
  Thus $Delta_(a \, a) gt.eq H_a$. For $a gt.eq 2$, symmetry and concavity bound the two increments between consecutive diagonal values:
  #[#set math.equation(numbering: n => "(5.1)")
   $ D_a - D_(a - 1) = Delta_(a - 1 \, a - 1) + Delta_(a \, a - 1) gt.eq H_(a - 1) + H_a . $ <eq:diagonal-rec>]
  Substituting $D_a = \( 3 a - 1 \) H_a \/ 2$, rearranging, and iterating from $H_1 = 1$ gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ H_a & gt.eq (1 + frac(1, 3 \( a - 1 \))) H_(a - 1) &  & \( a gt.eq 2 \) \,\
H_a & gt.eq product_(m = 1)^(a - 1) (1 + frac(1, 3 m)) &  & \( a gt.eq 1 \) . $ <eq:normalized-growth>]
  For $a = 1$ the product is empty and equals $1$. For $m gt.eq 1$, the elementary inequality $\( 1 + 1 \/ \( 3 m \) \)^3 gt.eq 1 + 1 \/ m$ now gives
  $ H_a^3 gt.eq product_(m = 1)^(a - 1) (1 + frac(1, 3 m))^3 gt.eq product_(m = 1)^(a - 1) (1 + 1 / m) = a . $
  Since $\( 3 a - 1 \) \/ 2 gt.eq a$, we conclude $D_a gt.eq a H_a gt.eq a^(4 \/ 3)$. ◻
]

#proof[
  For every character, the profile (4.4) satisfies all hypotheses of Lemma 9. Combining it with (4.5) gives
  $ a^(4 \/ 3) lt.eq P \( a \, a \) lt.eq \( 2 a - 1 \)^(1 \/ t) . $
  Letting $a arrow.r oo$ forces $t lt.eq 3 \/ 4$. Equation (2.4) therefore gives $lambda \( T_d \) lt.eq d^(9 \/ 4)$ for every character.
  For each integer $d gt.eq 2$, take $k_d = ceil.l d^nu ceil.r - 1$. Then $d^nu - 1 lt.eq k_d < d^nu$, so Lemma 3 supplies a character with $lambda \( T_d \) gt.eq k_d$. Hence
  $ d^nu lt.eq d^(9 \/ 4) + 1 . $
  Taking logarithms and letting $d arrow.r oo$ yields $nu lt.eq 9 \/ 4$. The detecting character may depend on $d$; the upper bound applies uniformly to every character.
  To obtain an arithmetic algorithm, fix $epsilon > 0$ and choose $0 < delta < epsilon$. The definition of $nu$ supplies a fixed integer $u gt.eq 2$ and an exact rank decomposition of $T_u$ of length $r < u^(9 \/ 4 + delta)$. Its bilinear identities remain valid on matrix blocks: their coefficients are central scalars, and each product has its left-input block before its right-input block. For $N$ a power of $u$, recursive application therefore has cost
  $ S \( N \) lt.eq r S \( N \/ u \) + C_(u \, r) \( N \/ u \)^2 . $
  Flattening gives $r gt.eq u^2$. Summing the recursion levels gives $S \( N \) = O \( N^(log_u r) \)$ if $r > u^2$, and $S \( N \) = O \( N^2 log N \)$ if $r = u^2$. Both are $O_epsilon \( N^(9 \/ 4 + epsilon) \)$. Padding an arbitrary $n$ to the next power of $u$ increases its size by less than the fixed factor $u$ and proves the theorem. ◻
]

#prodef([Remark 5.2.])[
  All coefficients of the recursive algorithm are fixed once $epsilon$ is chosen. The argument is in the complex arithmetic model. If algebraic coefficients are desired, the equations for an exact rank decomposition have rational coefficients; a complex solution therefore implies a solution over $overline(bb(Q))$, by the Nullstellensatz. The finitely many resulting coefficients lie in one number field.
]

== 6 Existence of detecting characters <sec:existence>

We prove Lemma 3 directly within the asymptotic-spectrum framework [16,4]. A #emph[state] is a normalized, additive, restriction-monotone map $S arrow.r bb(R)_(gt.eq 0)$. Every state satisfies $0 lt.eq lambda \( s \) lt.eq "R" \( s \)$, and $lambda \( s \) gt.eq 1$ for $s eq.not 0$. A character is a state that is also multiplicative.

Fix integers $d gt.eq 2$ and $k gt.eq 0$ with $k < d^nu$. To obtain a character with $lambda \( T_d \) gt.eq k$, we will construct states satisfying the stronger family of inequalities

#[#set math.equation(numbering: n => "(6.1)")
 $ lambda \( T_d s \) gt.eq k lambda \( s \) #h(2em) \( s in S \) . $ <eq:detect-state>]

This family is preserved by normalized tensor multiplication: for any nonzero $z$, replacing $lambda \( x \)$ by $lambda \( z x \) \/ lambda \( z \)$ preserves every inequality by applying (6.1) to $z s$. The next lemma explains why this invariance produces multiplicativity in a nonempty compact convex family of states. We will then prove that the required family is nonempty. An empty family would give tensors $D$ and $s eq.not 0$ with $D + k s gt.eq D + T_d s$. Repeating this conversion while keeping $D$ fixed would contradict $k < d^nu$.

=== 6.1 Obtaining multiplicativity <obtaining-multiplicativity>

#thm([Lemma 6.1.])[
  #emph[Let $cal(K)$ be a nonempty compact convex set of states in the topology of coordinatewise convergence. Suppose that, for every nonzero $z in S$, the map 
$ \( P_z lambda \) \( x \) = frac(lambda \( z x \), lambda \( z \)) $

 takes $cal(K)$ into itself. Then $cal(K)$ contains a multiplicative state.]
] <lem:multiplicativity>

#proof[
  Since $lambda \( z \) gt.eq 1$, each $P_z$ is continuous in the product topology. The space $bb(R)^S$ is Hausdorff and locally convex, so the Schauder–Tychonoff fixed-point theorem [17] applies: a continuous self-map of a nonempty compact convex subset of such a space has a fixed point. Choose a fixed point $mu$ of $P_z$ and freeze $c = mu \( z \)$. The subset
  $ cal(K)' = { lambda in cal(K) : lambda \( z x \) = c lambda \( x \) upright(" for every ") x in S } $
  is nonempty and compact. Because $c$ is fixed, its defining equations are linear in $lambda$, so it is convex. Taking $x = 1$ shows that $lambda \( z \) = c$ throughout $cal(K)'$, so all its members are fixed by $P_z$. Moreover, every $P_w$ with $w eq.not 0$ preserves it:
  $ \( P_w lambda \) \( z x \) = frac(lambda \( z w x \), lambda \( w \)) = c frac(lambda \( w x \), lambda \( w \)) = c \( P_w lambda \) \( x \) . $
  The construction can be repeated in $cal(K)'$, retaining all earlier frozen equations. By induction, every finite collection of the original maps $P_z$ has a common fixed point in $cal(K)$. Their fixed sets are closed, so compactness and the finite intersection property give a simultaneous fixed point for all nonzero $z$. It satisfies $lambda \( z x \) = lambda \( z \) lambda \( x \)$ for $z eq.not 0$. Additivity implies $lambda \( 0 \) = 0$, which handles multiplication by zero. ◻
]

=== 6.2 Constructing the detecting state space <constructing-the-detecting-state-space>

#proof[
  For the fixed integers $d \, k$ above, let $cal(K)$ be the subset of $product_(s in S) \[ 0 \, "R" \( s \) \]$ defined by normalization, additivity, monotonicity, and (6.1). These conditions are closed affine equalities and inequalities. The product is compact, so $cal(K)$ is compact and convex. We must first show that it is nonempty.
  Suppose it were empty. Compactness supplies a finite inconsistent subsystem of the defining conditions. Let $E subset S$ contain every coordinate appearing in this subsystem, together with $0$ and $1$. Adjoin $lambda \( 0 \) = 0$, $lambda \( 1 \) = 1$, and write each coordinate bound homogeneously as
  $ lambda \( s \) gt.eq 0 \, #h(2em) "R" \( s \) lambda \( 1 \) - lambda \( s \) gt.eq 0 quad \( s in E \) . $
  The resulting finite system remains inconsistent.
  Let $e_s$, $s in E$, be the coordinate vectors of $bb(R)^E$. Quotient by the span of the selected additive relation vectors and $e_0$, and write $u$ for the image of $e_1$. Let $C$ be the cone generated by the images of all inequality vectors. Before taking the quotient, these vectors have the forms
  $ e_b - e_a med \( b gt.eq a \) \, #h(2em) e_(T_d s) - k e_s \, #h(2em) e_s \, #h(2em) "R" \( s \) e_1 - e_s . $
  The finitely generated cone $C$ is closed. If $- u in.not C$, separation gives a linear functional $L$ nonnegative on $C$ with $L \( u \) > 0$. Dividing by $L \( u \)$ would give a normalized solution of the finite subsystem, including its bounds. This contradicts inconsistency, so $- u in C$.
  All vectors and relations have integer coefficients. Membership $- u in C$ is a feasible rational linear system, so there are rational nonnegative cone coefficients and rational coefficients for the relation vectors. Clearing denominators yields a positive integer $m$ and an identity with nonnegative integer coefficients on the inequality vectors.
  Map this identity to the additive Grothendieck group of $S$ by sending $e_s$ to $\[ s \]$. This group adjoins formal additive inverses to the commutative monoid $\( S \, + \)$; in particular, all additive relation vectors map to zero. The bound vectors map to the order differences $\[ s \] - \[ 0 \]$ and $\[ "R" \( s \) \] - \[ s \]$. Direct sums combine the ordinary order differences into $\[ y \] - \[ x \]$ with $y gt.eq x$. Distributivity combines the special differences into $\[ T_d s \] - k \[ s \]$ for one $s in S$. We obtain
  $ - m \[ 1 \] = \[ y \] - \[ x \] + \[ T_d s \] - k \[ s \] \, #h(2em) y gt.eq x . $
  Equality in this group means equality after adding a common element of the monoid. Thus there is $c in S$ with
  $ m + y + T_d s + c = x + k s + c . $
  Put $D = y + c$. Using $y gt.eq x$ gives the catalytic comparison
  #[#set math.equation(numbering: n => "(6.2)")
   $ D + k s gt.eq D + m + T_d s . $ <eq:catalyst>]
  Here $s eq.not 0$: otherwise $D gt.eq D + m$, contradicting the additivity and monotonicity of any flattening rank.
  #emph[Ruling out the obstruction.] The tensor $D$ is a fixed additive cost. Reusing (6.2) converts $n k$ copies of $s$ into $n$ copies of $T_d s$ while paying for $D$ only once. We show that this contradicts the definition of $nu$. Additive iteration gives, for every integer $n gt.eq 1$,
  $ D + n k s gt.eq D + n m + n T_d s gt.eq n T_d s . $
  Since $s gt.eq 1$, we have $"R" \( D \) s gt.eq "R" \( D \) gt.eq D$. With $K = n k + "R" \( D \)$, it follows that
  #[#set math.equation(numbering: n => "(6.3)")
   $ K s gt.eq n T_d s \, #h(2em) K^j s gt.eq n^j T_(d^j) s quad \( j gt.eq 1 \) . $ <eq:amplification>]
  For the induction, multiply the $j$th comparison by $K$, then use $K s gt.eq n T_d s$:
  $ K^(j + 1) s gt.eq n^j T_d^j \( K s \) gt.eq n^(j + 1) T_d^(j + 1) s . $
  This keeps a single factor $s$ and requires no cancellation. Also $K > 0$, since the first right-hand side in (6.3) is nonzero.
  We next use the $n^j$ scalar copies to obtain a second matrix-multiplication factor. Its matrix dimension will multiply $d^j$, while the auxiliary tensor $s$ still occurs only once. Fix $n$ and $delta > 0$. By the definition of $nu$, choose a fixed integer $u gt.eq 2$ with $"R" \( T_u \) lt.eq u^(nu + delta)$, and set
  $ ell_j = ⌊frac(j log_u n, nu + delta)⌋ \, #h(2em) g_j = u^(ell_j) . $
  Submultiplicativity gives
  $ "R" \( T_(g_j) \) lt.eq "R" \( T_u \)^(ell_j) lt.eq u^(\( nu + delta \) ell_j) lt.eq n^j . $
  Thus the diagonal tensor $n^j$ restricts to $T_(g_j)$. Multiplying this restriction by $T_(d^j) s$ and using $s gt.eq 1$, we obtain
  $ K^j s gt.eq n^j T_(d^j) s gt.eq T_(d^j g_j) s gt.eq T_(d^j g_j) . $
  A direct sum of $K^j$ copies of $s$ has rank at most $K^j "R" \( s \)$. Therefore
  $ "R" \( s \) K^j gt.eq "R" \( T_(d^j g_j) \) gt.eq \( d^j g_j \)^nu . $
  First let $j arrow.r oo$, keeping $n \, delta \, u$ fixed. Since $g_j^(1 \/ j) arrow.r n^(1 \/ \( nu + delta \))$, taking $j$th roots gives
  $ n k + "R" \( D \) gt.eq d^nu n^(nu \/ \( nu + delta \)) . $
  Next let $delta arrow.b 0$ at fixed $n$; the choice of $u$ has disappeared from the inequality. We get $n k + "R" \( D \) gt.eq n d^nu$. Finally divide by $n$ and let $n arrow.r oo$. The catalyst $D$ is fixed, so $k gt.eq d^nu$, a contradiction. Consequently $cal(K)$ is nonempty.
  #emph[Completing the construction.] For nonzero $z$, the map $P_z$ of Lemma 11 preserves normalization, additivity, and monotonicity. It preserves (6.1), because
  $ \( P_z lambda \) \( T_d s \) = frac(lambda \( T_d z s \), lambda \( z \)) gt.eq k frac(lambda \( z s \), lambda \( z \)) = k \( P_z lambda \) \( s \) . $
  Its coordinate bounds follow from $z x lt.eq "R" \( x \) z$. Lemma 11 supplies a multiplicative state in $cal(K)$, hence a character. Taking $s = 1$ in (6.1) gives $lambda \( T_d \) gt.eq k$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[J. Alman, R. Duan, V. Vassilevska Williams, Y. Xu, Z. Xu, and R. Zhou, More asymmetry yields faster matrix multiplication, in #emph[Proc. 2025 Annual ACM-SIAM Symposium on Discrete Algorithms], SIAM, 2025, 2005--2039. #link("https://doi.org/10.1137/1.9781611978322.63")[doi:10.1137/1.9781611978322.63].]
#bibitem([2])[J. Alman and V. Vassilevska Williams, A refined laser method and faster matrix multiplication, #emph[TheoretiCS] #strong[3] (2024), Article 21, 1--32. #link("https://doi.org/10.46298/theoretics.24.21")[doi:10.46298/theoretics.24.21]. Conference version in SODA 2021, 522--539.]
#bibitem([3])[D. Bini, Relations between exact and approximate bilinear algorithms. Applications, #emph[Calcolo] #strong[17] (1980), 87--97. #link("https://doi.org/10.1007/BF02575865")[doi:10.1007/BF02575865].]
#bibitem([4])[M. Christandl, P. Vrana, and J. Zuiddam, Universal points in the asymptotic spectrum of tensors, #emph[J. Amer. Math. Soc.] #strong[36] (2023), 31--79. #link("https://doi.org/10.1090/jams/996")[doi:10.1090/jams/996].]
#bibitem([5])[D. Coppersmith and S. Winograd, Matrix multiplication via arithmetic progressions, #emph[J. Symbolic Comput.] #strong[9] (1990), 251--280. #link("https://doi.org/10.1016/S0747-7171(08)80013-2")[doi:10.1016/S0747-7171(08)80013-2].]
#bibitem([6])[A. M. Davie and A. J. Stothers, Improved bound for complexity of matrix multiplication, #emph[Proc. Roy. Soc. Edinburgh Sect. A] #strong[143] (2013), 351--369. #link("https://doi.org/10.1017/S0308210511001648")[doi:10.1017/S0308210511001648].]
#bibitem([7])[R. Duan, H. Wu, and R. Zhou, Faster matrix multiplication via asymmetric hashing, in #emph[Proc. 64th IEEE Annual Symposium on Foundations of Computer Science], IEEE, 2023, 2129--2138. #link("https://doi.org/10.1109/FOCS57990.2023.00130")[doi:10.1109/FOCS57990.2023.00130].]
#bibitem([8])[E. Dupont, M. Eisenberger, B. Kozlovskii, A. Mehrabian, F. J. R. Ruiz, A. See, R. Zhou, J. Alman, V. Vassilevska Williams, and M. Balog, Improving the matrix multiplication exponent with modern optimization and AlphaEvolve, preprint, 2026. #link("https://arxiv.org/abs/2608.16884")[arXiv:2608.16884].]
#bibitem([9])[E. Kowalski, #emph[An introduction to the representation theory of groups], Graduate Studies in Mathematics #strong[155], American Mathematical Society, 2014. #link("https://doi.org/10.1090/gsm/155")[doi:10.1090/gsm/155]. Author version: #emph[Representation theory], February 17, 2017, #link("https://people.math.ethz.ch/~kowalski/representation-theory.pdf")[Section~2.6].]
#bibitem([10])[F. Le Gall, Powers of tensors and fast matrix multiplication, in #emph[Proc. 39th International Symposium on Symbolic and Algebraic Computation], ACM, 2014, 296--303. Full version: #link("https://arxiv.org/abs/1401.7714v1")[arXiv:1401.7714v1].]
#bibitem([11])[A. Schönhage, Partial and total matrix multiplication, #emph[SIAM J. Comput.] #strong[10] (1981), 434--455. #link("https://doi.org/10.1137/0210032")[doi:10.1137/0210032].]
#bibitem([12])[A. J. Stothers, #emph[On the complexity of matrix multiplication], Ph.D. thesis, University of Edinburgh, 2010. #link("https://hdl.handle.net/1842/4734")[hdl:1842/4734].]
#bibitem([13])[V. Strassen, Gaussian elimination is not optimal, #emph[Numer. Math.] #strong[13] (1969), 354--356. #link("https://doi.org/10.1007/BF02165411")[doi:10.1007/BF02165411].]
#bibitem([14])[V. Strassen, The asymptotic spectrum of tensors and the exponent of matrix multiplication, in #emph[Proc. 27th Annual Symposium on Foundations of Computer Science], IEEE, 1986, 49--54. #link("https://doi.org/10.1109/SFCS.1986.52")[doi:10.1109/SFCS.1986.52].]
#bibitem([15])[V. Strassen, Relative bilinear complexity and matrix multiplication, #emph[J. Reine Angew. Math.] #strong[375/376] (1987), 406--443. #link("https://doi.org/10.1515/crll.1987.375-376.406")[doi:10.1515/crll.1987.375-376.406].]
#bibitem([16])[V. Strassen, The asymptotic spectrum of tensors, #emph[J. Reine Angew. Math.] #strong[384] (1988), 102--152. #link("https://doi.org/10.1515/crll.1988.384.102")[doi:10.1515/crll.1988.384.102].]
#bibitem([17])[A. Tychonoff, Ein Fixpunktsatz, #emph[Math. Ann.] #strong[111] (1935), 767--776. #link("https://doi.org/10.1007/BF01472256")[doi:10.1007/BF01472256].]
#bibitem([18])[V. Vassilevska Williams, Multiplying matrices faster than Coppersmith--Winograd, in #emph[Proc. 44th Annual ACM Symposium on Theory of Computing], ACM, 2012, 887--898. #link("https://doi.org/10.1145/2213977.2214056")[doi:10.1145/2213977.2214056]. Expanded corrected author version: #emph[Multiplying matrices in $O \( n^2.373 \)$ time], July 1, 2014.]
#bibitem([19])[V. Vassilevska Williams, Y. Xu, Z. Xu, and R. Zhou, New bounds for matrix multiplication: from alpha to omega, in #emph[Proc. 2024 Annual ACM-SIAM Symposium on Discrete Algorithms], SIAM, 2024, 3792--3835. #link("https://doi.org/10.1137/1.9781611977912.134")[doi:10.1137/1.9781611977912.134].]


