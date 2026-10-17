#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[Complex Matrix Multiplication Below $2.258$ \
and Rectangular Bounds]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Matrix multiplication asks for the bilinear map $\( A \, B \) mapsto A B$, where the two input matrices have compatible sizes. Its arithmetic complexity measures the number of field operations needed to compute all entries of the product. Except in the field-transfer results of Section 14, the field is $bb(C)$, and the constants in an algorithm may belong to $bb(C)$. For $0 lt.eq k lt.eq 1$, let

$ w \( k \) = omega \( 1 \, k \, 1 \) $

be the infimum of exponents for multiplying an $n times ceil.l n^k ceil.r$ matrix by a $ceil.l n^k ceil.r times n$ matrix. The bound $w \( k \) lt.eq tau$ means that for every $epsilon > 0$ these products can be computed using $O \( n^(tau + epsilon) \)$ arithmetic operations. The square exponent is $omega = w \( 1 \)$, and the dual exponent is

$ alpha = sup { k in \[ 0 \, 1 \] : w \( k \) = 2 } . $

The output size gives $w \( k \) gt.eq 2$. Thus $alpha$ measures how far the inner dimension can grow while multiplication retains the exponent of its output size. Square and rectangular multiplication are basic operations in algebraic algorithms; controlling the rectangular shape can matter even when a square bound is already available.

=== 1.1 Context and main result <context-and-main-result>

Strassen’s rank-seven algorithm for $2 times 2$ multiplication gave $omega lt.eq log_2 7$, establishing subcubic arithmetic complexity #cite(label("strassen")). Approximate bilinear algorithms and their conversion to exact algorithms #cite(label("bini")), Schönhage’s asymptotic sum inequality #cite(label("schonhage")), and Strassen’s laser method #cite(label("strassen-laser")) made tensor powers and degenerations central to subsequent advances. Coppersmith and Winograd combined low-border-rank tensors with arithmetic-progression constructions #cite(label("cw")). Their extraction method restricts powers of a small tensor to direct sums of matrix products, whose dimensions enter the asymptotic sum inequality; their tensor-square analysis gave $omega < 2.375477$ #cite(label("cw")) Section 8. Higher powers and more detailed analyses of these tensors led to the improvements of Stothers, Vassilevska Williams, and Le Gall #cite(label("stothers")) #cite(label("williams-powers")) #cite(label("legall-powers")).

Rectangular multiplication requires separate control of the three matrix dimensions. Early work of Coppersmith and of Lotti and Romani developed this direction #cite(label("coppersmith1982")) #cite(label("lottiromani1983")); later constructions of Coppersmith, Le Gall, and Le Gall and Urrutia improved the available rectangular and dual bounds #cite(label("coppersmith-rect")) #cite(label("legall-rect")) #cite(label("legall-urrutia")). Recent advances include the refined laser method of Alman and Vassilevska Williams #cite(label("alman-williams")), the asymmetric hashing of Duan, Wu, and Zhou #cite(label("duan-wu-zhou")), and the square and rectangular analyses of Vassilevska Williams, Xu, Xu, and Zhou #cite(label("vxxz")) and Alman, Duan, Vassilevska Williams, Xu, Xu, and Zhou #cite(label("advxxz")). The four-author work establishes $alpha gt.eq 0.321334$; these two papers also give detailed tables of rectangular estimates. Dupont et al. subsequently optimized the asymmetric framework at a larger scale to obtain $omega < 2.371177$ #cite(label("dupont")), a bound incorporated into the updated table of #cite(label("advxxz")).

The common extraction problem is to separate many candidate products that share variables, while accounting for the cost of every operation used to separate them. We adjoin auxiliary group tensors that both resolve shared labels and supply useful matrix-product factors. Their full rank cost enters the resulting inequalities. This construction gives the following bounds.

#thm([Theorem 1.1.])[
  #emph[ Over $bb(C)$, the arithmetic matrix-multiplication exponents satisfy 
$ omega < 1129 / 500 = 2.258 \, #h(2em) alpha > 0.465 \, #h(2em) w \( 0.709 \) < 2.092 . $

]
] <thm:main>

Corollary 52 transfers the strict square and $k = 0.709$ inequalities to every field of characteristic zero or outside one finite set of positive characteristics, in the same arithmetic-operation model. It selects two fixed exact rank schemes, realizes their coefficients over one number field, and specializes their polynomial identities. The exceptional primes are not computed. Corollary 53 also gives the same dual-exponent bound over every field of characteristic zero. No dual-exponent transfer in positive characteristic is asserted.

The square bound also lowers the arithmetic exponent of basic linear-algebra tasks. Given $A in bb(C)^(n times n)$ and $b in bb(C)^n$, one can compute $det A$ and, when $A$ is nonsingular, $A^(- 1)$ and the solution of $A x = b$, using $O \( n^c \)$ field operations for some fixed $c < 2.258$, with exact zero tests for pivot selection. Choose $omega < c < 2.258$ and apply the fast elimination reductions of Strassen #cite(label("strassen")) and Ibarra, Moran, and Hui #cite(label("ibarra-moran-hui")) Theorem 2.1 and Corollary 2.1.

Two applications of the same separation lemma prove the theorem. The square bound uses finite tensor constructions, a differential comparison for their attainable values, and an exact numerical certificate. The dual and rectangular bounds come from explicit conditional-label trees and rational entropy certificates. We also optimize all leaf probability laws in a specified finite family of such trees, obtaining a bound for every aspect ratio in $\[ 0 \, 1 \]$. The square and rectangular construction families, and the precise way a square estimate augments the latter, are described below.

=== 1.2 Separating labels with an auxiliary tensor <separating-labels-with-an-auxiliary-tensor>

A trilinear tensor is a sum of monomials $x y z$, with variables drawn from three finite coordinate sets $X \, Y \, Z$. Its rank is the least number of products of three linear forms needed to express it. A restriction substitutes linear forms separately on the three sides. A degeneration allows parameter-dependent substitutions and takes a leading coefficient. Border rank is the least rank of tensors approaching the given tensor. These operations are local: a coordinate substitution cannot depend on information visible only on another side.

Suppose that the supported monomials carry $K$ labels, and that each of two sides can independently determine the label from its own coordinate. The third side may still share variables between labels. The pairwise separation lemma, 7, tensors the input with a finite abelian group-addition tensor of rank $K^(1 + o \( 1 \))$. Local projections then give a direct sum over the labels, with a size-$K$ dot-product factor on the two original readers in every summand. The label is now visible on all three sides. Dot-product factors on the three possible reader pairs combine into a matrix multiplication tensor.

The construction combines Fourier diagonalization of the group tensor with tags of equal Euclidean norm and a separate constant-inner-product slice for each tag. Its geometry adapts Behrend’s construction #cite(label("behrend")), following the progression-free constructions of Salem and Spencer #cite(label("salem-spencer")). The use of group algebras also has an established place in the approach of Cohn and Umans #cite(label("cohn-umans")); the local separation identity needed here is proved in full. It preserves every original coordinate and coefficient, including additional tensor indices correlated across occurrences. Consequently the same identity can be applied inside a previously restricted tensor. A separate support argument ensures that every summand counted in an application is nonzero.

Successive separations are organized by exact conditional counts. Once a preceding label is direct on all three sides, each side can locate the positions on which the next operation acts. Fixing the number of each possible continuation makes the next auxiliary tensor and the output dimensions common to all branches. The multinomial counts and entropy chain rule are the standard method-of-types tools #cite(label("shannon1948")) #cite(label("csiszar1998")); locality and the uniform tensor accounting are proved alongside them here.

=== 1.3 The square bound: finite constructions and comparison <the-square-bound-finite-constructions-and-comparison>

The square argument starts from the six-term Coppersmith–Winograd tensor

$ T = sum_(i + j + k = 2\
0 lt.eq i \, j \, k lt.eq 2) x_i y_j z_k \, $

which has border rank three #cite(label("cw")) Section 7, equation (10). A five-term degeneration of $T$ has three groups, each detectable on one designated side. A local degeneration of three copies retains $75$ scalar components. Separating their successive labels gives the elementary estimate $omega lt.eq 9 log 3 \/ log 75 < 2.290108$ in 11. This example displays the auxiliary-rank accounting before the larger construction is introduced.

For a proposed exponent $beta$, suppose a finite construction from $n$ copies of $T$ and an auxiliary tensor of border rank at most $R$ produces $L$ independent matrix products of common dimensions $a times b$ by $b times c$. Its normalized score is

$ frac(log L - log R + \( beta \/ 3 \) log \( a b c \), n) . $

Schönhage’s asymptotic sum inequality implies that a score strictly greater than $log 3$ proves $omega < beta$. Thus the square argument must produce a strict score gain while retaining the entire auxiliary charge.

We organize the finite constructions by their source distribution. There are six collections of original tensor occurrences, called #emph[orientation banks], one for each permutation of the three sides. The distribution records the same exact frequencies in the original coordinates of each bank. This keeps a physical permutation of a tensor distinct from a change of its recorded law. The square sections use $alpha$ for this vector-valued source law; the dual exponent in 1 is a scalar. A construction preserves arbitrary unresolved tensors attached to its original words, and its output labels identify distinct surviving words. Taking the closure of the finite law–score pairs gives a continuous concave attainable-value function. Conditional pooling and a new application of the group separator to each longer pool provide the composition properties needed in the comparison.

The key analytic step uses restrictions on sums of the local grades $i \, j \, k$. Each side can read its own sum. Windows placed at progression-free target indices force the three locally read targets to agree, creating another direct label. The progression-free construction and the matching argument have the ancestry of Behrend and Coppersmith–Winograd #cite(label("behrend")) #cite(label("cw")). To exploit the new labels, a finite-horizon control steers every word allowed by its controls into the assigned terminal window. This every-word guarantee is what permits all the resulting tensor summands to be counted. Exact rational prefix populations then translate the finite control tree into local tensor maps with common auxiliary supplies.

This construction forces a differential inequality on any smooth function touching the attainable value from below. The covariance of the local grades determines the weighted combination of second derivatives in this inequality. Smooth touching tests and strict comparison follow the viscosity-solution methodology of Crandall and Lions and of Crandall, Ishii, and Lions #cite(label("crandalllions1983")) #cite(label("crandallishiilions1992")); the required inequality and comparison are proved directly from the finite tensor constructions. A rational polynomial chart and a polynomial barrier then give the strict score gain at an interior source distribution. Boundary constructions supply the initial lower estimates, while explicit residual, interpolation, and rounding bounds turn the finite integer checks into inequalities on the entire comparison domain.

Finally, a strict gain in the closed attainable set selects one actual finite construction with score greater than $log 3$. Its law may be close to the chart’s central law. All control horizons, rational approximations, group sizes, and bank sizes are fixed before the asymptotic sum inequality is applied.

=== 1.4 Rectangular bounds and finite-family optimization <rectangular-bounds-and-finite-family-optimization>

The rectangular argument tracks the three matrix dimensions separately. A readable label tree partitions a tensor’s support until each leaf is one monomial; at every node, conditional on the preceding labels, the next child is independently readable on two specified sides. Fix a rational probability law on its leaves and apply the tree to an admissible number of copies with those exact leaf frequencies; arbitrary leaf laws follow by approximation. The number of child words at a node is a multinomial coefficient. The product of these coefficients is exactly the number of final direct summands, so the leading auxiliary rank charge is canceled by this multiplicity in the equal-summand inequality. The three remaining logarithmic dimensions are the conditional entropies accumulated on the three reader pairs. This is 40.

Explicit polynomial degenerations giving border-rank bounds two and three supply the initial trees. Their supports have three colors, with a designated side able to detect its own color. A #emph[completion] takes several copies, chooses a center color, and retains color words containing at most one distinct noncenter color. Local color tests implement this leading-term degeneration and preserve the conditional trees. Deleting one color at the end gives a fully readable tree. The family $cal(F)_7$ consists of both bases, at most seven completions of sizes two or three, all center choices, all pairs of retained colors, and all choices of a distinguished side.

For each member of this finite family, a three-state recurrence maximizes every nonnegative weighted sum of its incident and nonincident conditional entropies over all leaf laws. Its support function therefore describes the closed downward convex hull of the normalized rate pairs exactly. 46 turns this description into a maximization over one real parameter for each aspect ratio. An available square estimate contributes one additional rate point. In particular, the square part of 1 supplies the point for $p = 2.258$. This finite-family optimization is distinct from the square attainable-value construction with orientation banks and count windows.

Two explicit laws give the dual and rectangular conclusions. For the dual exponent, an exact conditional-independence identity preserves all the entropy of a uniform coordinate word on its incident reader pairs. This equality certifies exponent two, and the remaining entropy certifies the inner dimension. A small fiber histogram gives the rectangular point. Rational enclosures establish their strict numerical margins. The same finite family also gives an independent square bound below $2.267$ by an integer leaf count.

13 compares the resulting bounds with the specified numerical tables of #cite(label("vxxz")) #cite(label("advxxz")), augmented by the same square point $p = 2.258$ and closed under the ordinary combination operations stated there. The new bounds strictly improve this table baseline for $0.321334 < k < 1$. This comparison concerns recorded upper estimates. Extensions to additional estimates retain their stated separator or envelope hypotheses, and strict improvement is asserted only where the enlarged baseline itself exceeds two.

=== 1.5 Organization <organization>

2 establishes the tensor and arithmetic-exponent conventions. 3 proves the shared separation lemma and the finite tensor constructions. The square argument begins in Section 4, Section 5, which define the attainable values and prove the count-window comparison. 6 establishes the three-state boundary estimate used by the numerical certificate in 7. 8 extracts the finite witness proving the square part of 1. Section 9, Section 10, Section 11 develop conditional entropy, completion trees, and exact finite-family optimization. 12 proves the remaining parts of 1, and 13 gives the baseline comparisons. Section 14 proves the finite-exception field corollary from two exact rank witnesses and the characteristic-zero dual corollary using accuracy-dependent witnesses. The appendices give barrier coefficients and reproduction details.

== 2 Tensors and arithmetic exponents <sec:preliminaries>

We first fix the tensor conventions shared by the square and rectangular constructions, then relate rank and explicit polynomial degenerations to arithmetic exponents. The equal-summand inequality at the end of the section will convert separated tensors into rectangular bounds.

All vector spaces and tensors are over $bb(C)$. A tensor on three finite coordinate sets $X \, Y \, Z$ is identified with a trilinear form

$ T = sum_(x \, y \, z) T_(x y z) thin x y z . $

A restriction is obtained by a linear map on each of the three sides. In particular, a local zeroing-out sets selected variables on each side to zero. A degeneration $U gt.tri.eq V$ permits these maps to depend polynomially or Laurent polynomially on a parameter and extracts the transformed tensor’s first nonzero coefficient, after an overall rescaling. The maps may be composed finitely many times. Finitely many parameters can be replaced by sufficiently separated powers of a single parameter.

The rank $"rank" \( T \)$ is the minimum number of products of three linear forms whose sum is $T$. Its border rank $upright(underline(R)) \( T \)$ is the least integer $r$ such that tensors of rank at most $r$ can approach $T$. Border rank is submultiplicative under tensor product and cannot increase under degeneration. The direct sum $U xor V$ uses disjoint variable spaces on all three sides. A claimed direct sum must therefore have both disjoint pieces and no additional terms joining their variables.

Our matrix-multiplication convention is

$ chevron.l a \, b \, c chevron.r = sum_(i = 1)^a sum_(j = 1)^b sum_(k = 1)^c x_(i j) y_(j k) z_(k i) \, #h(2em) "Vol" chevron.l a \, b \, c chevron.r = a b c . $

For positive integers $l_1 \, l_2 \, l_3$, write $cal(R) \( l_1 \, l_2 \, l_3 \) = "rank" chevron.l l_1 \, l_2 \, l_3 chevron.r$.

For $a_1 \, a_2 \, a_3 gt.eq 0$, let $W \( a_1 \, a_2 \, a_3 \)$ denote the arithmetic exponent for the three dimensions $ceil.l n^(a_i) ceil.r$. The trilinear interpretation makes $W$ invariant under permutations, including those implemented by transposition. In particular $w \( k \) = W \( 1 \, k \, 1 \)$.

#thm([Lemma 2.1.])[
  #emph[For $a_i gt.eq 0$, 
$ W \( a_1 \, a_2 \, a_3 \) = lim_(s arrow.r oo) frac(log cal(R) \( ceil.l e^(s a_1) ceil.r \, ceil.l e^(s a_2) ceil.r \, ceil.l e^(s a_3) ceil.r \), s) . quad "(2.1)" $ <eq:rank-exponent>

 Moreover, $W$ is coordinatewise nondecreasing, homogeneous, subadditive, permutation invariant, and continuous. It satisfies 
$ W \( a_1 \, a_2 \, a_3 \) gt.eq max_(i eq.not j) \( a_i + a_j \) . $

]
] <lem:rank-exponent>

#proof[
  Fix $s > 0$, put $l_i = ceil.l e^(s a_i) ceil.r$, and take a rank-$r$ scheme for this triple. Each of the three flattenings has rank $l_i l_j$, so $r gt.eq max_(i eq.not j) l_i l_j$. The scheme applied recursively to blocks of dimensions $l_i^(h - 1)$ uses $r$ smaller products and at most a fixed constant times $\( max_(i eq.not j) l_i l_j \)^(h - 1)$ linear operations at each level. Its total cost is $O \( \( h + 1 \) r^h \)$. All products keep a left-input block before a right-input block, so rectangular block multiplication is legitimate. Padding with $h = ceil.l t \/ s ceil.r$ proves the corresponding arithmetic upper bound for arbitrary large dimensions. The same padding and tensor-power argument shows that the limsup in (2.1) is at most the infimum over fixed $s > 0$. Hence the rank limit exists.
  Conversely, a straight-line arithmetic computation of the bilinear matrix product gives rank at most a constant times its operation count. Introduce separate formal variables for the two operands and retain bidegrees at most $\( 1 \, 1 \)$. Each gate introduces only a bounded number of new products of a linear form in the first operand and one in the second; the remaining mixed coefficients are linear combinations of earlier ones. For divisions we use Strassen’s division-elimination method #cite(label("strassen-division")), in the following bilinear adaptation. If divisions are allowed, first translate to a generic constant input at which every denominator is nonzero and use the same truncated-series argument. The mixed coefficient of the output is still the desired bilinear map. This proves the converse inequality in (2.1).
  Restriction and padding give monotonicity; tensor products give subadditivity; rescaling $s$ gives homogeneity. These statements include coordinates equal to zero. For continuity, compare two triples through their coordinatewise maximum and use the naive bound on the nonnegative increment: the change in $W$ is at most the sum of absolute coordinate changes. Finally the flattening bounds give the displayed lower bound. ◻
]

All logarithms in this paper are natural. The properties in 2 imply that $w$ is convex. For instance, subadditivity and homogeneity applied to $lambda \( 1 \, k_1 \, 1 \) + \( 1 - lambda \) \( 1 \, k_2 \, 1 \)$ give its usual convexity inequality.

The approximate bilinear algorithms of #cite(label("bini"), form: "prose") and the asymptotic-sum method of #cite(label("schonhage"), form: "prose") motivate the following explicit form of a rank budget. We use polynomial border-rank witnesses. Saying that $T$ has #emph[cost] $R$ means that $T$, up to a nonzero scalar, is the first nonzero coefficient of a polynomial or Laurent polynomial tensor family with a rank-$R$ decomposition. This is a supplied witness and a certified upper bound, which need not be minimal. It implies $upright(underline(R)) \( T \) lt.eq R$; it is not our definition of border rank. All uses of cost below have an explicit witness, so no converse assertion about arbitrary border-rank limits is needed. Coordinate restrictions and monomial leading-term degenerations preserve such witnesses and their budgets. Finitely many parameters can be combined into one by assigning sufficiently separated powers, so a composition of the operations used below again has a univariate witness.

The following interpolation argument is the border-to-exact transfer for polynomial approximate bilinear algorithms #cite(label("bini")).

#thm([Lemma 2.2.])[
  #emph[For a fixed tensor of cost $R$, its $N$-th tensor power has exact rank at most $O \( N + 1 \) R^N$, where the implicit constant may depend on the fixed witness.]
] <lem:border-overhead>

#proof[
  Clear negative parameter powers. The degree of the $N$-th power of the witness is $O \( N \)$, and its desired coefficient is the $N$-th tensor power of the first coefficient. Univariate interpolation expresses that coefficient using $O \( N + 1 \)$ evaluations, each of rank at most $R^N$. ◻
]

A dot tensor on the pair $Y \, Z$ of size $D$ is $x_0 sum_(j = 1)^D y_j z_j$. The product of dot tensors on the three pairs is a matrix-multiplication tensor. More precisely, if their lengths on $X Y \, X Z \, Y Z$ are $d_(X Y) \, d_(X Z) \, d_(Y Z)$, respectively, their product is

$ chevron.l d_(X Z) \, d_(X Y) \, d_(Y Z) chevron.r . $

Thus the edge $X Z$ supplies the index $i$, the edge $X Y$ supplies $j$, and the edge $Y Z$ supplies $k$ in our convention. Dot sizes on the same pair multiply. A tuple of logarithmic edge rates listed in the order $\( X Y \, X Z \, Y Z \)$ therefore gives matrix-dimension rates in the order $\( X Z \, X Y \, Y Z \)$. By the permutation invariance in Lemma 2, either order gives the same value of $W$. This accounts for the edge-rate order used in the later conditional-label entropy bound.

#thm([Lemma 2.3.])[
  (Equal rectangular summands).  #emph[Suppose a tensor of cost $R$ restricts or degenerates to a direct sum of $M$ copies of the matrix-multiplication tensor with dimensions $l_1 \, l_2 \, l_3$. Then 
$ W \( log l_1 \, log l_2 \, log l_3 \) lt.eq log R - log M . quad "(2.2)" $ <eq:rectangular-sum>

]
] <lem:rectangular-sum>

#proof[
  Write the left side as $u$. If $u = 0$, a flattening of the $N$-th power of the direct sum, together with 3, gives $M^N lt.eq O \( N + 1 \) R^N$; thus $R gt.eq M$.
  Otherwise choose an integer $c$ with $c u > log M$. A rank scheme for dimensions $l_i^(c N)$ can be interpreted as requests for products of blocks with dimensions $l_i^N$. The $N$-th power of the direct sum supplies $M^N$ such requests in one batch, at cost $O \( N + 1 \) R^N$. The requests may depend on common inputs: substituting those linear forms into the independent batch inputs is a restriction. Pad the last batch if necessary. Consequently
  $ cal(R) \( l_1^(\( 1 + c \) N) \, l_2^(\( 1 + c \) N) \, l_3^(\( 1 + c \) N) \) lt.eq O \( N + 1 \) R^N ⌈frac(cal(R) \( l_1^(c N) \, l_2^(c N) \, l_3^(c N) \), M^N)⌉ . $
  By 2, the expression inside the ceiling grows exponentially because $c u > log M$. Take logarithms, divide by $N$, and pass to the limit to obtain $\( 1 + c \) u lt.eq log R + c u - log M$, proving the claim. ◻
]

This is the equal-summand rectangular form of the asymptotic-sum principle #cite(label("schonhage")). The proof applies it to each fixed instance before varying that instance. Later auxiliary tensors may therefore grow with a type parameter without any uniformity assumption on the interpolation constant in 3.

== 3 Finite tensor constructions <alg:section>

The elementary construction in this section already gives $omega lt.eq 9 log 3 \/ log 75 = 2.290107196 dots.h$. Its main ingredient separates a label that two parties can read independently. The operation supplies the missing label to the third party and leaves a large dot product. We pay for the auxiliary tensor that performs this operation. At the exponential scale, the new direct labels compensate for that payment, while the dot product remains available for matrix multiplication. We first prove the operation, including its action on unresolved tensor factors, and then give the finite constructions used later for the boundary estimates.

=== 3.1 Pairing conventions and the input rank <alg:conventions>

We use the tensor and matrix-dimension conventions of Section 2. A pairing on $X \, Y$ of length $m$, with a scalar third side, is $chevron.l 1 \, m \, 1 chevron.r$; the other orientations are $chevron.l m \, 1 \, 1 chevron.r$ on $X \, Z$ and $chevron.l 1 \, 1 \, m chevron.r$ on $Y \, Z$. Their tensor products satisfy

$ chevron.l a \, 1 \, 1 chevron.r ⊗ chevron.l 1 \, b \, 1 chevron.r ⊗ chevron.l 1 \, 1 \, c chevron.r tilde.equiv chevron.l a \, b \, c chevron.r . quad "(3.1)" $ <alg:pairing-product>

The logarithmic volumes of such factors therefore add.

The input is the six-term specialization of the Coppersmith–Winograd tensor #cite(label("cw")) Section 7, equation (10),

$ T = C W_1 = x_2 y_0 z_0 + x_0 y_2 z_0 + x_0 y_0 z_2 + x_0 y_1 z_1 + x_1 y_0 z_1 + x_1 y_1 z_0 . quad "(3.2)" $ <alg:cw>

Write $cal(S) = { 200 \, 020 \, 002 \, 011 \, 101 \, 110 }$ for its support, abbreviating $\( i \, j \, k \)$ by $i j k$. At every position the three indices sum to two. The maps in our square construction for this input have algebraic coefficients. The general preservation identities below also allow arbitrary complex coefficients in the unresolved tensors.

#thm([Lemma 3.1.])[
  #emph[The tensor $T$ has border rank three. Consequently $upright(underline(R)) \( T^(⊗ n) \) lt.eq 3^n$ for every integer $n gt.eq 1$.]
] <alg:cw-rank>

#proof[
  Let $zeta = e^(2 pi i \/ 3)$, and put
  $ X_r \( t \) = x_0 + zeta^r t x_1 + zeta^(2 r) t^2 x_2 quad \( r = 0 \, 1 \, 2 \) \, $
  with analogous definitions for $Y_r \, Z_r$. Filtering the degree modulo three gives the exact identity
  $ frac(1, 3 t^2) sum_(r = 0)^2 zeta^r X_r \( t \) Y_r \( t \) Z_r \( t \) = T + t^3 \( x_2 y_2 z_1 + x_2 y_1 z_2 + x_1 y_2 z_2 \) . $
  For every nonzero $t$, the left side has rank at most three. Taking $t arrow.r 0$ proves the upper bound. In the flattening with the $X$ side as rows, the three coefficients of $x_0 \, x_1 \, x_2$ are linearly independent: the monomials $y_0 z_2 \, y_0 z_1 \, y_0 z_0$, respectively, distinguish them. The flattening rank is therefore three, giving the reverse bound. Tensoring the upper-bound construction proves the last assertion. The displayed identity also supplies an explicit polynomial witness of cost three in the terminology of Section 2. ◻
]

We use the following established theorem in exactly its border-rank form; see also the explicit statement in #cite(label("afl"), form: "prose") Theorem 3.1.

#thm([Theorem 3.2.])[
  (Asymptotic sum inequality, #cite(label("schonhage"), form: "prose")).  #emph[If a tensor $U$ degenerates to $xor.big_(ell = 1)^L chevron.l a_ell \, b_ell \, c_ell chevron.r$, with all dimensions positive integers, then 
$ sum_(ell = 1)^L \( a_ell b_ell c_ell \)^(omega \/ 3) lt.eq upright(underline(R)) \( U \) . $

 In particular, if $T^(⊗ n) ⊗ cal(A) gt.tri.eq xor.big_(ell = 1)^L chevron.l a \, b \, c chevron.r$ and $upright(underline(R)) \( cal(A) \) lt.eq R$, then 
$ L \( a b c \)^(omega \/ 3) lt.eq 3^n R . quad "(3.3)" $ <alg:asi-account>

]
] <thm:asi>

The auxiliary rank $R$ in (3.3) is part of the input cost. Thus, for a proposed exponent $beta$, a finite realization with

$ log L - log R + beta / 3 log \( a b c \) > n log 3 quad "(3.4)" $ <alg:strict-score>

proves $omega < beta$. We never cancel an auxiliary tensor as a tensor identity; only its explicitly charged logarithmic rank will be offset by output multiplicity.

=== 3.2 Supplying a label to its missing party <alg:group-section>

Suppose a tensor is partitioned into pieces whose $X$-variables are disjoint and whose $Y$-variables are disjoint. Each of these two parties can then determine the same piece label from its own variable. The $Z$-variables may still be shared. The next lemma resolves this last sharing without resolving the terms inside a piece. We call this operation GROUP.

The construction uses equal-norm shells, following the geometry of #cite(label("behrend"), form: "prose"), together with affine slices that constrain two independently chosen auxiliary indices. Its auxiliary tensor is the multiplication tensor of a finite abelian group, linking the construction to the group-theoretic tensor approach of #cite(label("cohn-umans"), form: "prose"). The identity and its full rank charge are proved below.

#thm([Lemma 3.3.])[
  (Pairwise label separation).  #emph[ Let $U = sum_(s = 1)^K U_s$, where $U_s$ uses $X$-variables in $X_s$ and $Y$-variables in $Y_s$, and the families $\( X_s \)_(s = 1)^K$ and $\( Y_s \)_(s = 1)^K$ are each disjoint. The $Z$-variables may overlap. There are a finite abelian group $G$, its group multiplication tensor $cal(A)_G$, and a positive integer $m$ such that 
$ U ⊗ cal(A)_G gt.tri.eq xor.big_(s = 1)^K #scale(x: 120%, y: 120%)[\(] U_s ⊗ chevron.l 1 \, m \, 1 chevron.r #scale(x: 120%, y: 120%)[\)] . quad "(3.5)" $ <alg:group-identity>

 The degeneration is a zeroing-out on auxiliary coordinates controlled by the original local variables. It preserves all original coordinates and coefficients. For $K arrow.r oo$, the parameters can be chosen with 
$ "rank" \( cal(A)_G \) = upright(underline(R)) \( cal(A)_G \) = \| G \| \, #h(2em) log \| G \| = log K + O \( sqrt(log K) \) \, #h(2em) m = K . quad "(3.6)" $ <alg:group-rates>

 The same statement holds for any other pair of knowing sides.]
] <lem:group>

#proof[
  The case $K = 1$ uses the trivial group and $m = 1$, so no nontrivial auxiliary tensor is needed. For $K gt.eq 2$, set
  $ d = ceil.l sqrt(log K) ceil.r + 3 \, #h(2em) Q = ⌈\( \( d + 1 \) K \)^(1 \/ \( d - 2 \))⌉ \, #h(2em) m = K . $
  Since $d Q^2 + 1 lt.eq \( d + 1 \) Q^2$, these choices give $Q^d \/ \( d Q^2 + 1 \) gt.eq K$. The grid ${ 0 \, dots.h \, Q - 1 }^d$ has $Q^d$ points and at most $d \( Q - 1 \)^2 + 1$ possible squared norms. Pigeonholing supplies at least $K$ distinct points $t_1 \, dots.h \, t_K$ on one Euclidean sphere. Assign $t_s$ to label $s$.
  For each $s$, the integer inner product $t_s dot.op u$, as $u$ ranges over this grid, has at most $d \( Q - 1 \)^2 + 1$ values. A further pigeonhole argument supplies a set $V_s$ of at least $m$ grid points on one affine slice
  $ t_s dot.op u = h_s . $
  Trim each $V_s$ to exactly $m$ points. Only the common inner product within a slice is needed; the points of a slice need not have equal norm.
  Take
  $ G = \( bb(Z) \/ \( 4 Q \) bb(Z) \)^d \, #h(2em) cal(A)_G = sum_(a + b = c) sans(x)_a sans(y)_b sans(z)_c \, $
  using separate auxiliary variables on the three sides. For completeness, character orthogonality gives a rank decomposition
  $ cal(A)_G = frac(1, \| G \|) sum_(chi in hat(G)) (sum_(a in G) chi \( a \) sans(x)_a) (sum_(b in G) chi \( b \) sans(y)_b) (sum_(c in G) chi \( - c \) sans(z)_c) . $
  It has $\| G \|$ summands. The $X$-flattening has $\| G \|$ linearly independent rows, since the coefficient of $sans(y)_0 sans(z)_a$ distinguishes row $a$. This proves both rank equalities.
  For an original $X$-variable in $X_s$, retain auxiliary coordinates $a = u in V_s$. For an original $Y$-variable in $Y_s$, retain $b = t_s - u'$ with $u' in V_s$. On the $Z$ side retain only $c in { t_1 \, dots.h \, t_K }$. Negative coordinates of $t_s - u'$ are interpreted modulo $4 Q$. These are three local variable projections: each knowing side uses the label determined by its original variable, and the third side uses only the prescribed tag set.
  A surviving term satisfies $c equiv t_s + u - u' med \( mod med 4 Q \)$. Each coordinate of $c - t_s - u + u'$ has absolute value at most $2 \( Q - 1 \) < 4 Q$, so the congruence is an equality of integer vectors. The tag norms are equal and $t_s dot.op \( u - u' \) = 0$, whence
  $ 0 = parallel c parallel^2 - parallel t_s parallel^2 = parallel u - u' parallel^2 . $
  Thus $u = u'$ and $c = t_s$. Conversely, every $u in V_s$ gives one surviving triple $\( u \, t_s - u \, t_s \)$. The auxiliary factor in piece $s$ is precisely
  $ sum_(u in V_s) sans(x)_u sans(y)_(t_s - u) sans(z)_(t_s) \, $
  a length-$m$ pairing on the knowing sides. The pieces were already disjoint on those sides and now have distinct auxiliary tags on the third. The calculation also excludes every cross term, proving (3.5).
  Finally, with $L = log K$, the displayed choice of $d \, Q$ satisfies
  $ d log Q lt.eq frac(d, d - 2) #scale(x: 120%, y: 120%)[\(] L + log \( d + 1 \) #scale(x: 120%, y: 120%)[\)] + o \( 1 \) = L + O \( sqrt(L) \) . $
  The rounding error in $log Q$ is exponentially small in $sqrt(L)$. Since $K lt.eq Q^d$ and $\| G \| = \( 4 Q \)^d$, these inequalities and $m = K$ prove (3.6). ◻
]

For repeated uses at different label counts, fix one such group $G_K$ for each $K$, and write $A_K = cal(A)_(G_K)$. This is the auxiliary-tensor notation used in the conditional-label entropy bound.

The geometry rules out a stronger collision than the usual three-term-progression condition: the two slice points $u \, u'$ are chosen independently. Their difference is perpendicular to $t_s$; any nonzero such displacement from $t_s$ lies outside its sphere. Requiring the endpoint to be another tag therefore forces that difference to vanish. Figure 1 shows this displacement argument.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.9, stroke: (paint: rgb("#000099")))
  line((1.9, -2.1), (1.9, 2.4), stroke: (paint: rgb("#b9b9b9"), dash: "dashed"))
  circle((0, 0), radius: 0.05292, fill: black)
  content((0, 0), [$0$], anchor: "north-east")
  line((0, 0), (1.9, 0), mark: (end: ">"))
  content((0.95, 0), [$t_s$], anchor: "north")
  line((1.9, 0), (1.9, 1.65), stroke: (paint: rgb("#bf6000")), mark: (end: ">"))
  content((1.9, 0.825), [$d=u-u'$], anchor: "west")
  line((0, 0), (1.9, 1.65), stroke: (paint: rgb("#606060")), mark: (end: ">"))
  content((0.95, 0.825), [$c=t_s+d$], anchor: "south-east")
  circle((1.9, 0), radius: 0.07056, fill: black)
  content((1.9, 0), [$t_s$], anchor: "north-west")
  circle((1.9, 1.65), radius: 0.07056, fill: black)
  content((1.9, 1.65), [$c$], anchor: "south-west")
  line((1.65, 0), (1.65, 0.25), (1.9, 0.25))
  content((4.1, 0.6), [#text(size: 9pt)[The affine slice gives $t_s dot.op d=0$.#linebreak() The group equation gives $c=t_s+d$.#linebreak() If $c$ is another tag on the same sphere,#linebreak() $"|c|^2=|t_s|^2+|d|^2=|t_s|^2"$,#linebreak() so $d=0$ and $c=t_s$.]], anchor: "west")
})],
  caption: [Figure 1: The separation identity in a two-dimensional slice. The dashed line represents the displacement hyperplane $t_s + t_s^perp$, rather than the slice containing $u \, u'$. A nonzero displacement along it leaves the tag sphere, so no other tag can survive. The argument applies in every dimension. ],
) <fig:group-geometry>

#thm([Lemma 3.4.])[
  (Preservation of unresolved fibers).  #emph[The identity in Lemma 7 holds with arbitrary coefficients and arbitrary unresolved local indices inside the tensors $U_s$, including indices correlated between different original occurrences. Local support projections and monomial leading-term restrictions have the same property. Finite compositions of these operations may leave all previously produced matrix multiplication factors untouched.]
] <alg:payload>

#proof[
  Retain an original basis coordinate on every side throughout the construction. In Lemma 7, a surviving auxiliary triple is characterized solely by the piece label and the equation just proved. The original coefficient is neither changed nor combined with another coefficient. Appending additional local indices to any original variable therefore gives the same identity for every coefficient separately. The extra indices may be arbitrary; no product distribution or independence between occurrences is used.
  A local support projection has the same coefficientwise description. For a monomial restriction, the degree of each term is the sum of three local degrees, and its leading coefficient is either its original coefficient or zero. This too commutes with adjoining unresolved coordinates or earlier local count predicates. The claim for a finite composition follows by induction. At each subsequent stage, tensor the new maps with the identity on all previously produced pairings. ◻
]

This preservation statement is a locality statement, not a nonvanishing statement. If an earlier support restriction makes a designated source word absent, its fiber is zero and cannot be counted as an output. Our finite constructions below explicitly retain every counted word. The later count construction will require a separate guarantee for every complete controlled path.

=== 3.3 Exact types and a finite hierarchy of labels <alg:hierarchy-section>

For a probability vector $p$ on a finite alphabet, write $H \( p \) = - sum_i p_i log p_i$, with $0 log 0 = 0$. Exact types provide the finite counting form of entropy used here; see #cite(label("csiszar1998"), form: "prose") for the method of types. For rational $p$ and admissible integers $N$, the number of words having exactly $N p_i$ occurrences of symbol $i$ is

$ binom(N, \( N p_i \)_i) = exp #scale(x: 120%, y: 120%)[\(] N H \( p \) + O \( log \( N + 1 \) \) #scale(x: 120%, y: 120%)[\)] . quad "(3.7)" $ <alg:type-count>

The implicit constant depends only on the fixed alphabet. We use exact types so that the number of positions assigned to every later conditional operation is independent of the previously selected direct output.

The following lemma makes precise how multiple separation steps share auxiliary tensors and count each label once. Its accounting is the conditional-entropy chain rule #cite(label("shannon1948")), applied to labels that the tensor maps can actually read.

#thm([Lemma 3.5.])[
  (Accounting for a finite label hierarchy).  #emph[Let $b gt.eq 1$, and let $cal(B) subset.eq cal(S)^b$ be nonempty. Suppose local restrictions and degenerations of $T^(⊗ b)$ retain exactly these original scalar components, with their original coordinates and coefficients. Suppose there are finitely many labels $S_1 \, dots.h \, S_t$, each a function of a component in $cal(B)$, with these properties:]
  + #emph[the complete record $\( S_1 \, dots.h \, S_t \)$ determines the original component;]
  + #emph[after the earlier labels are fixed, the next label is independently readable by two fixed sides within that conditional pool;]
  + #emph[every component designated by a retained complete record survives all the local restrictions.]
  #emph[Let $alpha$ be a rational probability distribution on $cal(B)$. For admissible $N arrow.r oo$, there are auxiliary tensors $cal(A)_N$ and degenerations of $T^(⊗ b N) ⊗ cal(A)_N$ into $L_N$ independent matrix multiplication tensors of common volume $v_N$, with $upright(underline(R)) \( cal(A)_N \) lt.eq R_N$, such that 
$ log L_N = N H \( alpha \) + o \( N \) \, #h(2em) log R_N = N H \( alpha \) + o \( N \) \, #h(2em) log v_N = N H \( alpha \) + o \( N \) . quad "(3.8)" $ <alg:hierarchy-rates>

 When $H \( alpha \) > 0$, this gives $omega lt.eq 3 b log 3 \/ H \( alpha \)$.]
] <lem:hierarchy>

#proof[
  Apply the stipulated local restrictions in each of the $N$ blocks. At layer $j$, write $h = \( S_1 \, dots.h \, S_(j - 1) \)$ for a preceding record, let $p_h$ be its probability under $alpha$, and let $p_(s divides h)$ be the conditional law of $S_j$. The earlier layers have made the full preceding-label word direct on all three sides. In every branch there are exactly $N p_h$ block positions in conditional pool $h$. Each knowing side can read the next-label word in those positions. It can therefore zero variables whose next-label word does not have counts $N p_h p_(s divides h)$. This is a genuine local type projection, not a presumed projection onto an unavailable joint type.
  There remain
  $ K_(j \, h) = binom(N p_h, \( N p_h p_(s divides h) \)_s) $
  possible next-label words in this pool. Use Lemma 7 to separate them. A zero-probability pool is omitted, and a deterministic next label needs no auxiliary tensor. For a positive-entropy pool, (3.7) and (3.6) give identical leading logarithmic contributions
  $ N p_h H \( S_j divides h \) + o \( N \) $
  to its direct count, auxiliary rank, and pairing volume.
  The auxiliary tensor for pool $\( j \, h \)$ is appended once. It is reused in every preceding direct branch through a block-diagonal map: on a direct sum, each of the three parties knows the branch, so it may address the appropriate positions using that branch’s label. Equivalently, $\( xor.big_ell V_ell \) ⊗ cal(A)$ is the direct sum of the $V_ell ⊗ cal(A)$, and separate maps may act in its blocks. This does not charge $"rank" \( cal(A) \)$ once per $ell$. The size and physical orientation of every conditional supply depend only on $\( j \, h \)$, whose population is fixed, not on the selected output word.
  There are only finitely many layers and conditional pools. Multiplying their counts, ranks, and pairing volumes, and using the entropy chain rule, gives in each case the leading logarithm
  $ N sum_(j = 1)^t H \( S_j divides S_1 \, dots.h \, S_(j - 1) \) = N H \( alpha \) . $
  All error terms sum to $o \( N \)$. The complete record determines one original scalar component in each block, and every such designated component is nonzero by assumption. Exact conditional counts fix the number of pairings in each physical orientation. Formula (3.1) therefore gives a common matrix multiplication tensor in all final branches. This proves (3.8). Substituting them in (3.3), dividing by $N$, and taking the limit proves the exponent bound. ◻
]

Nothing in this lemma permits arbitrary support deletion. The locally obtainable support and the two-sided readability must be established for each hierarchy. Once they are established, exact conditional types select its desired joint frequencies through accessible labels.

=== 3.4 An explicit four-component construction <alg:four>

First remove the term $101$ from $T$. Scale each of $x_1 \, z_1 \, y_0 \, y_2$ by $t$. The five other terms have degree one in $t$, whereas $101$ has degree three. Dividing by $t$ and taking the limit gives

$ T gt.tri.eq T' = A + B + C \, quad A = x_0 \( y_0 z_2 + y_1 z_1 \) \, quad B = \( x_2 y_0 + x_1 y_1 \) z_0 \, quad C = x_0 y_2 z_0 . quad "(3.9)" $ <alg:five>

A local predicate on each side identifies exactly one group: $Z > 0$ identifies $A$, $X > 0$ identifies $B$, and $Y = 2$ identifies $C$. Exactly one of these predicates holds on every retained term. We call any such three-group partition a #emph[W-partition]; the three predicates, rather than the original numerical indices, are its one-hot flags.

Delete $C$ by setting $y_2 = 0$, and take $\( A + B \)^(⊗ N)$, with $4 divides N$. Retain coarse words with $N \/ 2$ copies of $A$ and $N \/ 2$ copies of $B$. This is local on $X$, since a zero $X$ index means $A$ and a positive one means $B$. The $Z$ side also identifies the word, with the roles reversed. There are $binom(N, N \/ 2)$ coarse words. Lemma 7 separates them by supplying their label to $Y$, and gives each word a pairing on $X \, Z$ of logarithmic length $N log 2 + o \( N \)$.

Inside a fixed coarse word, $A$’s two terms $002 \, 011$ are each identified by $Y$ and by $Z$. Retain $N \/ 4$ occurrences of each among the $N \/ 2$ $A$ positions and separate their words. This adds a pairing on $Y \, Z$ of logarithmic length $\( N \/ 2 \) log 2 + o \( N \)$. Similarly, $B$’s two terms $200 \, 110$ are each identified by $X \, Y$; resolving their equal-frequency words adds a pairing on $X \, Y$ of the same logarithmic length. These restrictions are conditional on the already-direct coarse word and therefore are local.

The three pairings combine by (3.1). The total logarithmic output count, auxiliary rank, and volume are each $N log 4 + o \( N \)$. Theorem 6 consequently gives

$ omega lt.eq frac(3 log 3, log 4) = 2.377443751 dots.h . quad "(3.10)" $ <alg:four-bound>

The scalar original terms alone would not supply any volume to which $omega$ could be applied. Here the three pairing orientations supply that volume, while all three auxiliary rank costs have been included.

=== 3.5 Completion and the 75-component bound <alg:completion-section>

A W-partition has a useful local description even when its three groups contain unresolved tensors: side $i$ knows precisely the positions at which its own group occurs. This permits a degeneration of a block of several occurrences before any group has been made direct. We call the following operation COMPLETE.

#thm([Lemma 3.6.])[
  (Completion).  #emph[Let a tensor have a W-partition with labels $0 \, 1 \, 2$. For an integer $b gt.eq 1$, a local monomial degeneration of its $b$-th power retains exactly the coarse words 
$ { 0 \, 1 }^b med union med { 0 \, 2 }^b . quad "(3.11)" $ <alg:complete-support>

 This support has a new W-partition: the constant word $0^b$, the words containing $1$, and the words containing $2$. Conditional on either nonzero new label, the original binary word is independently readable by two sides. The construction preserves arbitrary unresolved fibers.]
] <alg:completion>

#proof[
  The three local predicates are
  $ upright("every position has label ") 0 \, #h(2em) upright("some position has label ") 1 \, #h(2em) upright("some position has label ") 2 . $
  Each is readable on the correspondingly active side of the original W-partition. Their sum is one on (3.11) and two when both $1$ and $2$ occur. Multiply a variable by $t$ when its predicate holds, divide the tensor by $t$, and take the limit. The surviving predicates form a new one-hot partition. In the nonzero group $i in { 1 \, 2 }$, the word uses only $0 \, i$, so either of those two active sides determines the entire word from the positions of its own label. The degeneration is coefficientwise and hence preserves the fibers by Lemma 8. ◻
]

For the groups $A \, B \, C$ in (3.9), assign labels $0 \, 1 \, 2$ in that order. The group sizes are $2 \, 2 \, 1$. A completed block has three group sizes

$ 2^b \, #h(2em) 4^b - 2^b \, #h(2em) 3^b - 2^b . $

Delete its all-$A$ group: its active $Z$ predicate is that every original index is positive. The remaining groups will be denoted $P_B$ and $P_C$. The $X$ side recognizes $P_B$ by the occurrence of a positive index, and the $Y$ side recognizes $P_C$ by the occurrence of index two. Since only these two groups remain, either side independently determines which group occurs.

#thm([Theorem 3.7.])[
  (Elementary completion bound).  #emph[For every integer $b gt.eq 2$, 
$ omega lt.eq frac(3 b log 3, log \( 4^b + 3^b - 2^(b + 1) \)) . quad "(3.12)" $ <alg:complete-bound>

 In particular, 
$ omega lt.eq frac(9 log 3, log 75) = 2.290107196 dots.h . $

]
] <thm:elementary>

#proof[
  Apply (3.9) to each occurrence, perform the completion of Lemma 10 in blocks of size $b$, and delete the all-$A$ group as just described. This locally retains $s_b = 4^b + 3^b - 2^(b + 1)$ original scalar components per block. Here is a complete hierarchy that separates them.
  First resolve the binary group label $P_B \, P_C$, known on $X \, Y$. After it is direct, resolve the original word inside each group: the $A \, B$ word in $P_B$ is known on $Z \, X$, and the $A \, C$ word in $P_C$ is known on $Z \, Y$. After that word is direct, resolve $002$ versus $011$ in every $A$ position using $Y \, Z$, and $200$ versus $110$ in every $B$ position using $X \, Y$. There is no internal choice in $C$. The complete record identifies one original scalar component. Every such component survives the stated monomial restriction and deletion. The pair of knowing sides at each stage is fixed by the preceding direct labels.
  Give the $s_b$ components equal frequency and apply Lemma 9. Their entropy is $log s_b$, while the original rank cost per block is at most $3^b$. This proves (3.12).
  For $b = 3$, the sizes of $P_B \, P_C$ are $56 \, 19$. The prescribed outer frequencies are $56 \/ 75 \, 19 \/ 75$; the internal component law in each group is uniform. The entropy identity
  $ H \( 56 \/ 75 \, 19 \/ 75 \) + 56 / 75 log 56 + 19 / 75 log 19 = log 75 $
  shows explicitly how the successive choices count each of the 75 terms once. Over $N$ such blocks the three leading logarithms are $log L_N = log R_N = log v_N = N log 75 + o \( N \)$. Using the input cost $3^(3 N) R_N$ in (3.3) and canceling the #emph[logarithmic] multiplicity and auxiliary costs leaves $\( omega \/ 3 \) log 75 lt.eq 3 log 3$, as claimed. ◻
]

The neighboring block lengths illustrate that this particular completion is not monotone in $b$:

table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Block length
], table.cell(rowspan: 1, colspan: 1)[Retained scalar components
], table.cell(rowspan: 1, colspan: 1)[Exponent bound
]),
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[$2.326571610 dots.h$
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[75
], table.cell(rowspan: 1, colspan: 1)[$2.290107196 dots.h$
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[305
], table.cell(rowspan: 1, colspan: 1)[$2.304655406 dots.h$
],
)

No optimization claim over all restrictions of the corresponding power is needed. The length-three construction already gives the stated bound.

=== 3.6 Parity and conditional W constructions <alg:parity-section>

Completion gives one way of making a new W-partition. A different local restriction on three occurrences supplies two useful W labels, which can be resolved in either order. We call this operation PARITY.

#thm([Lemma 3.8.])[
  (Parity restriction).  #emph[In three W-partitioned occurrences, a local monomial degeneration removes exactly the six words in which all three labels occur and retains the other 21 coarse words. On the retained support, the majority label and the odd-count label each define a W-partition. Once both labels are direct, the remaining choice is either deterministic or independently readable by two sides. All statements remain true with arbitrary unresolved fibers.]
] <alg:parity>

#proof[
  Let $n_i$ be the count of label $i$ among the three positions. Side $i$ knows its occurrence set and hence $n_i$. Scale a variable by $t^(n_i med mod med 2)$ on that side. The sum of the three parity exponents is one for count patterns $\( 3 \, 0 \, 0 \)$ and $\( 2 \, 1 \, 0 \)$, up to permutation, and three for $\( 1 \, 1 \, 1 \)$. Division by $t$ and passage to the limit gives the claimed support.
  On this support exactly one label has count at least two, and exactly one has odd count. Both are local unary tests, giving the two W-partitions. Write these labels as $c \, h$. If $c = h$, the word is $c c c$. Otherwise, it consists of two $c$’s and one $h$. The $c$ side knows the two majority positions and the $h$ side knows the singleton position. Either determines which of the three placements occurs, so Lemma 7 applies after $c \, h$ have been made direct. All restrictions and the final separation preserve fibers by Lemma 8. ◻
]

If the three occurrences have internal scalar counts $\( a_i \)_i \, \( b_i \)_i \, \( c_i \)_i$, the fiber with majority $i$ and odd-count label $j$ has size

$ M_(i j) = cases(delim: "{", a_i b_i c_i \, & i = j \,, a_i b_i c_j + a_i b_j c_i + a_j b_i c_i \, & i eq.not j .) quad "(3.13)" $ <alg:parity-weights>

Each term for $i eq.not j$ describes one singleton placement. For the boundary weights $\( 2 \, 2 \, 1 \)$ on all three occurrences, this is

$ \( M_(i j) \) = mat(delim: "(", 8, 24, 12; 24, 8, 12; 6, 6, 1) . $

For example, delete the third majority row and resolve the remaining binary majority label. Within the first direct row delete its first odd-count column; within the second direct row delete its second column. These are permitted conditional local deletions because the majority is already direct. Each row then has size 36, giving 72 original scalar components. Lemma 9 yields $omega lt.eq 9 log 3 \/ log 72 = 2.311966920 dots.h$. This illustrative restriction is weaker than Theorem 11. Parity is useful because its two conditional groupings enlarge the finite construction family at nonuniform distributions.

=== 3.7 Finite recipes and weighted laws <alg:recipes>

We now track the source law and score of a finite tree of W constructions. Fix labels $0 \, 1 \, 2$ on each original W-partitioned occurrence before applying the tree. These are its #emph[canonical labels]: later physical permutations may change which side reads a flag, but the original labels are still counted in this fixed ordering.

For the score calculations below, fix a finite operation tree and its rational conditional laws. Admissible exact-type populations, together with the efficient GROUP tensors of (3.6), give a family of finite realizations. The #emph[limiting score] of this fixed tree and law data is the limit along increasing populations; each member remains one finite recipe with fixed tensor supplies and maps. A later operation may depend on a label only once that label is direct on all three sides. At every stage, previously produced pairings are separate tensor factors; their internal indices are never used to choose subsequent controls.

For a realization on $n$ original occurrences, let $L$ be its direct multiplicity, $R$ its auxiliary rank bound, and $v$ its additional matrix multiplication volume. The rates are

$ D = frac(log L, n) \, #h(2em) A = frac(log R, n) \, #h(2em) M = frac(log v, n) . $

Here $M$ excludes any tensor initially present inside a coarse group. For the W recipes the convenient formal score is $u_gamma = gamma \( D - A \) + M$, where $gamma gt.eq 1$. For $0 < beta lt.eq 3$,

$ u_(3 \/ beta) = 3 / beta (D - A + beta / 3 M) . $

Thus $u_gamma$ rescales the normalized score expression in (3.4) so that the coefficient of the added volume is one. Its definition assumes no bound on $omega$. Definitions 16 and 17 will specify the banked realizations and the closure of their law–score pairs. For a fixed tree consisting only of pairwise separation, completion, parity, and conditional exact types, its total $D - A$ tends to zero when the group/type supplies grow. Consequently its limiting score is independent of $gamma$.

A binary leaf deletes one W label locally and resolves the remaining binary word by Lemma 7. At law $q$ on that pair, its limiting score is $H \( q \)$. If positive numbers $d_i$ are assigned as weights for choosing a law, the weighted score is $H \( q \) + sum_i q_i log d_i$. Maximizing on the retained pair $i \, j$ gives $log \( d_i + d_j \)$. These weights may guide selection of a finite rational law; they do not change the coefficients of a tensor.

For completion of $b$ occurrences with weights $d_(r \, i)$, the three fiber weights are

$ w_0 = product_(r = 1)^b d_(r \, 0) \, #h(2em) w_i = product_(r = 1)^b \( d_(r \, 0) + d_(r \, i) \) - product_(r = 1)^b d_(r \, 0) quad \( i = 1 \, 2 \) . quad "(3.14)" $ <alg:complete-weights>

When the weights are scalar term counts, this is literal counting of the supports in Lemma 10. For arbitrary positive weights it is the corresponding generating polynomial. For parity the analogous matrix is (3.13).

=== 3.8 Physical orientations and canonical laws <physical-orientations-and-canonical-laws>

A physical permutation acts on the full tensor factors of an occurrence or completed block. Each original occurrence keeps both its canonical label and its net physical side permutation. For $sigma in frak(S)_3$, the #emph[orientation bank] $sigma$ is the collection of original occurrences with that net permutation relative to their canonical coordinates. We will arrange that all six banks have the same exact canonical label histogram. Their common normalized histogram is the source law; it is not the aggregate law of the physical flags after the bank orientations are forgotten.

The exact types used below fix canonical histograms within each relative orientation. The next lemma shows how the six global physical permutations then distribute these counts equally among the original banks, while keeping one common auxiliary supply.

#thm([Lemma 3.9.])[
  (Equal physical orientation supplies).  #emph[Fix a finite oriented schedule of operations with prescribed exact conditional populations. Suppose its exact types fix, for each relative physical permutation $tau in frak(S)_3$, the canonical input histogram $H_tau$ of all original occurrences with that permutation, independently of the direct history. Include all six global physical side permutations of this schedule, with the same prescribed populations and histograms in corresponding replicas. Then every original orientation bank has the same exact canonical input histogram. Auxiliary supplies and pairing dimensions are independent of the direct history. All regroupings controlled by preceding direct labels are implementable by local block-diagonal maps.]
] <alg:orientation-banks>

#proof[
  In the replica with global permutation $sigma$, an original occurrence of relative orientation $tau$ has absolute orientation $sigma tau$. Thus an absolute bank $rho$ receives the histogram $H_tau$ from the unique replica $sigma = rho tau^(- 1)$. Its total histogram is
  $ sum_(tau in frak(S)_3) H_tau \, $
  independently of $rho$ and of the direct history. The occurrence positions contributing to a histogram may vary with the history, but its counts are fixed by hypothesis. Each original occurrence is counted once, in its relative-orientation class.
  All parties know a preceding direct label, so each can reorder or address the same specified positions using its own local coordinate map. Corresponding relative permutations address corresponding physical banks; no party is required to read another party’s local flag. Each fixed pool uses a fixed auxiliary tensor and fixed pairing lengths. Tensoring all those supplies once and acting block-diagonally therefore gives uniform rank bounds and dimensions. Previously produced pairings remain untouched. ◻
]

In particular, rotating the flags of an intermediate completed block changes its grouping and its readers, but does not recode the labels of the original occurrences inside it. To recover a canonical label from a physically permuted occurrence, undo that occurrence’s permutation.

=== 3.9 Resolving and composing nested recipes <resolving-and-composing-nested-recipes>

An operation in the finite library may complete two occurrences, physically transpose that completed block, and then complete it with a third occurrence. Resolving its original word calls for a hierarchy inside the final fiber. The following statement supplies that hierarchy for any fixed finite composition of completion gates.

#thm([Lemma 3.10.])[
  (Resolving a tree of completion gates).  #emph[Consider a finite rooted tree whose leaves are W-partitioned occurrences and whose internal nodes apply Lemma 10 to their children. Before a child is used at a parent, allow a fixed physical permutation of that whole child block. The retained support has a W-partition at its root. Once the root label is direct, the original leaf-label word admits a finite hierarchy of pairwise-readable refinements. All refinements preserve arbitrary unresolved leaf fibers.]
  #emph[In a fixed root fiber, let $P$ be any rational law on the retained original leaf-label words. Across $N$ copies of that fiber, exact conditional types and Lemma 7 give direct multiplicity, auxiliary rank bound, and added pairing volume whose logarithms are each $N H \( P \) + o \( N \)$. The auxiliary product and pairing dimensions are common to every direct output. Canonical original labels are unchanged by the intermediate physical permutations.]
] <alg:completion-hierarchy>

#proof[
  Process the nodes from the root toward the leaves. Suppose a node’s label is already direct, and express its children’s W labels in that node’s current physical coordinates. If the node label is zero, completion forces all those child labels to be zero. Otherwise, if its label is $i in { 1 \, 2 }$, its child-label word lies in ${ 0 \, i }^b$, where $b$ is the number of children. Side zero knows the positions with label zero and side $i$ knows the positions with label $i$; either side determines the word. Apply Lemma 7 to separate that word. Every child label is now direct on all three sides. Undo the known physical permutation on its label to identify the child’s own root label, and recurse into that child. Recursion is required even when the parent label was zero: a known child root may still contain unresolved choices.
  There are finitely many nodes. Each successive refinement is a function of the original leaf word, and the complete record recovers that word. For the law $P$, prescribe the induced rational conditional type of each refinement in each preceding direct pool. These types are locally readable by the two sides just identified. They fix all pool populations, so a single prescribed auxiliary product can be used by block-diagonal maps in every branch. They also fix the counts of pairings in every physical orientation. As in the proof of Lemma 9, each pool contributes its conditional entropy to all three leading logarithms. The chain rule sums these contributions to $H \( P \)$, since the complete record and the original leaf word determine one another. The output pairing dimensions are therefore common to all branches.
  The retained support is exactly the intersection of the primitive completion conditions, each implemented by its local monomial degeneration. Every word in $P$’s support satisfies those conditions. Lemma 8 preserves any unresolved leaf fibers through every step. A physical permutation changes the sides reading a node’s flags; the final histogram still counts each leaf in its original canonical coordinates. To apply Lemma 13, let $tau_r$ be the relative physical permutation of original leaf $r$. The exact full-word law $P$ fixes the count of canonical label $i$ in relative orientation $tau$ to be
  $ H_(tau \, i) = N sum_w P \( w \) thin \# { r : tau_r = tau \, med w_r = i } . $
  These counts are independent of the direct output. The lemma therefore supplies equal original orientation banks when this schedule is taken in all six global orientations. No individual occurrence is required to carry a fixed letter. ◻
]

To spell out the three-position case used in the library, let $c \( i \, j \)$ be the two-child completion label: it is zero for $\( i \, j \) = \( 0 \, 0 \)$, and is $a in { 1 \, 2 }$ if both entries belong to ${ 0 \, a }$ and at least one equals $a$. It is undefined on $\( 1 \, 2 \) \, \( 2 \, 1 \)$. Write

$ a = c \( i \, j \) \, #h(2em) z = a - k med \( mod med 3 \) \, #h(2em) s = c \( z \, r \) \, quad k in { 0 \, 1 \, 2 } . $

The subtraction by $k$ represents the physical rotation of the whole first completed block. In a fixed final fiber $s$, first resolve the top-level operand labels $\( z \, r \)$. This fixes $a = z + k med \( mod med 3 \)$, after which the inner word $\( i \, j \)$ can be resolved using the pair of sides belonging to that inner completion, with its physical rotation included. If $C_s$ is an arbitrary rational law on the retained triples, the two levels supply

$ H \( C_s \) = H \( Z \, R divides S = s \) + sum_(z \, r) bb(P) \( Z = z \, R = r divides S = s \) H \( I \, J divides Z = z \, R = r \, S = s \) . quad "(3.15)" $ <alg:nested-completion-entropy>

Here $Z$ is a deterministic function of $I \, J$, so no intermediate label adds a second entropy count. The intermediate rotation changes the grouping flag and its physical reader; it does not recode $I \, J \, R$ when the original canonical word histogram is calculated.

#thm([Proposition 3.11.])[
  (Composition of finite recipe laws).  #emph[Consider a primitive completion, a finite tree of completion gates as in Lemma 14, or a parity operation on $b$ original occurrences. Let $s$ be its outer W label, with a rational law $a_s$, separated by a fixed recipe tree with limiting score $u_0$. In the outer group $s$, let $t$ be a further W label, with conditional rational law $r_(s t)$, separated by a fixed recipe tree with limiting score $u_s$. For completion this label is deterministic and $u_s = 0$. For parity it is the other of the majority and odd-count labels. For each permitted $\( s \, t \)$, choose a rational distribution $P_(s t)$ on its remaining original coarse words. If $n_i \( w \)$ counts canonical input label $i$ in the word $w$, then the resulting original law and limiting score are 
$ q_i & = 1 / b sum_(s \, t) a_s r_(s t) thin bb(E)_(w tilde.op P_(s t)) n_i \( w \) \,\
u & = 1 / b (u_0 + sum_s a_s u_s + sum_(s \, t) a_s r_(s t) H \( P_(s t) \)) . quad "(3.16)" $ <alg:recipe-law>

 The formula is feasible for every stipulated finite collection of child recipes and rational distributions; no optimality assertion is required.]
] <alg:recipe-composition>

#proof[
  Use the outer child recipe while the internal choices remain unresolved fibers. Its coordinate-preserving identity is valid by Lemma 8. Once its label is direct, apply the corresponding conditional child in each group. The group populations are fixed by exact types, so the prescribed auxiliary product is appended once and shared by all branches. After these labels are direct, resolve the remaining words by the hierarchy in Lemma 14 for completion, or by the single remaining pairwise-readable placement in Lemma 12. Prescribe the conditional types induced by $P_(s t)$ at every refinement. Their conditional entropies sum to $H \( P_(s t) \)$, and Lemma 7 supplies exactly this limiting score across the hierarchy. The relative population of that pool is $a_s r_(s t)$.
  The same types provide the histograms required for banking. The outer and conditional child recipes fix the number of macro occurrences assigned to each $\( s \, t \)$ pool in each of their original banks. Within every such pool, impose the full-word law $P_(s t)$ through its readable refinements. For each original leaf position, this law fixes its marginal counts across the pool, just as in the preceding proof. Grouping those contributions by the leaf’s relative physical permutation fixes the total histograms $H_tau$. This uses each child’s whole-bank histogram and the new full-word types, not a fixed letter at an individual position of a child recipe. Lemma 13 now makes the final canonical law common to all six original banks.
  Logarithms of counts, auxiliary rank bounds, and pairing volumes add. Dividing their sum by the number $b$ of original occurrences per new block proves (3.16). Counting the original labels in the same conditional pools proves (3.16). A finite common multiple of the rational denominators and the fixed child bank sizes makes all pool sizes integral. Increasing these supplies makes the finitely many group and type errors vanish. Every counted original coarse word survives the stipulated support restrictions, so the outputs on the scalar W input are nonzero. Arbitrary unresolved fibers are preserved coefficientwise; a zero attached fiber remains zero. ◻
]

The words in (3.16) are counted in their original canonical coordinates. The resulting $q$ is the exact common law of the original orientation banks, providing the finite input to the banked-value construction of the next section.

== 4 Banked constructions and attainable values <val:section>

A local separation identity must remain valid when the positions on which it acts are correlated with positions to be processed later. It is also necessary to distinguish a distribution in the coordinates of a tensor from the aggregate distribution after physically permuting its sides. We make both requirements explicit. This gives the finite objects whose attainable values will enter the differential comparison.

=== 4.1 Canonical banks and preservation of unresolved tensors <val:banks>

Let $cal(S) = { 200 \, 020 \, 002 \, 011 \, 101 \, 110 }$ and $cal(W) = { 100 \, 010 \, 001 }$. The latter is the support of the ordinary three-state tensor

$ sans(W) = x_1 y_0 z_0 + x_0 y_1 z_0 + x_0 y_0 z_1 . $

An element of either alphabet is a triple of local grades. We use $cal(B)$ to denote either alphabet in definitions that apply to both. Write $frak(S)_3$ for the group of permutations of the three tensor sides. A #emph[banked input of size $N$] has $N$ occurrences in each orientation $sigma in frak(S)_3$, for a total of $n = 6 N$ occurrences. Its original component words are

$ w = \( w_(sigma \, t) \)_(sigma in frak(S)_3 \, med 1 lt.eq t lt.eq N) \, #h(2em) w_(sigma \, t) in cal(B) . $

The triple $w_(sigma \, t)$ is expressed in canonical coordinates: its physical grade triple is $sigma w_(sigma \, t)$. Thus physical side $j$ observes the canonical coordinate $sigma^(- 1) \( j \)$. Both $T$ and the ordinary $sans(W)$ tensor are symmetric under these physical permutations, so this banking does not change the underlying input tensor. Its purpose is to record types and permitted transposes accurately.

A banked word has exact law $alpha in Delta \( cal(B) \)$ if, separately for each $sigma$, every symbol $s$ occurs $N alpha_s$ times. In particular, $alpha$ is not the histogram obtained by forgetting the bank orientations. All normalizations below divide by $6 N$.

We allow additional, unresolved local indices. To state the preservation requirement precisely, for every original component word $w$ attach an arbitrary three-tensor $P_w$ on these additional indices. The tensors $P_w$ may share their variable spaces, may correlate all the positions, and may be zero. Denote the resulting input by $cal(T) \( P \)$: its restriction to the original word $w$ is the original scalar component at $w$ tensored with $P_w$. This description includes preceding local count restrictions by setting the corresponding fibers to zero. It does not assert that all such families arise as independent products.

#prodef([Definition 4.1.])[
  (Strong banked realization).  A strong realization consists of a finite auxiliary tensor $cal(A)$, a finite degeneration by three local maps, a set $Lambda$ of direct labels, and positive integers $a \, b \, c$, with the following properties.
  + Every $lambda in Lambda$ designates an original word $w \( lambda \)$, and $lambda mapsto w \( lambda \)$ is injective. All these words have the same exact canonical law in each orientation bank.
  + For every family of unresolved tensors $P = \( P_w \)$ the same maps give
    $ cal(T) \( P \) ⊗ cal(A) gt.tri.eq xor.big_(lambda in Lambda) #scale(x: 120%, y: 120%)[\(] P_(w \( lambda \)) ⊗ chevron.l a \, b \, c chevron.r #scale(x: 120%, y: 120%)[\)] . quad "(4.1)" $ <val:strong-identity>
    In this display the original local coordinates of $w \( lambda \)$ are retained as well; only their fixed basis factors are suppressed. Original coefficients and unresolved local indices are unchanged.
  + The auxiliary input, its charged border-rank bound, and the output dimensions $a \, b \, c$ are independent of $lambda$.
  The identity is required also for zero $P_w$. Such an output is a formal zero fiber and contributes no nonzero direct summand. A realization used in an attainable-value calculation must separately establish that all its counted fibers are nonzero on its specified input.
] <def:strong>

The maps in this paper retain each original local index and act on auxiliary coordinates conditionally on that index and on already direct labels. Consequently they commute with local projections depending only on the original indices. The same statement holds when the maps are expressed as leading monomial degenerations. This observation concerns locality; it does not prove nonvanishing after an earlier projection. Nonvanishing will be checked by support identities for the algebraic primitives and by the universal path condition in Lemma 28 for arithmetic-progression (AP) count constructions.

Lemma 7 supplies (4.1) term by term. Indeed its sphere and slice argument decides the retained auxiliary terms without referring to any coefficient of $P_w$. Local singleton projections and direct matchings have the same preservation property. The conditional composition rules of Section 4.2 use only these identities; they never presume independence of unresolved fibers.

For the banking operation of Lemma 13, group the original input occurrences of a finite schedule by their relative physical orientation $tau$. The lemma requires their total canonical histogram $H_tau$ to be fixed independently of the direct history and shared by all six globally permuted replicas. Exact types of complete original words supply these grouped histograms in the completion and parity recipes. When an already strong child is physically permuted as a whole, each of its original input banks supplies a fixed histogram by Definition 16. The letter at an individual position may still vary between direct outputs.

In outer replica $sigma$, the group of relative orientation $tau$ has absolute orientation $sigma tau$. Each absolute bank therefore receives one copy of $H_tau$ for every $tau$, and has histogram $sum_tau H_tau$. Equal conditional pool sizes alone would not imply this histogram identity. The pool sizes instead fix how many child calls and auxiliary supplies are used; the grouped types or strong child banks supply the required letter counts. A physical permutation of an intermediate macro acts on every original occurrence inside it.

=== 4.2 Finite recipes and the closure of their values <val:recipes>

A #emph[structural recipe] is a finite expression describing local projections and leading degenerations, direct-label-controlled maps, locally imposed exact joint and conditional types, auxiliary GROUP calls, and tensor products on specified collections of positions. Its bank sizes, rational types, and integer group parameters are finite. A conditional choice is permitted only after its controlling label is direct on all three sides. Each byproduct matrix multiplication factor is kept as a separate factor: later decisions use original-word labels and do not read, identify, or spend its indices.

We use the following two classes of such recipes.

+ The $sans(W)$ class starts with singleton projections, binary deletion followed by GROUP, and the finite COMPLETE and PARITY compositions of Proposition 15. It allows rational time-sharing on separate positions, physical permutation banking, and finite AP count compositions of previously constructed recipes.
+ The six-state class starts with singleton projections, the direct matching construction of Proposition 24, and the five-state face substitutions of Proposition 25 using finite $sans(W)$ recipes. It has the same time-sharing, banking, and finite AP closure.

Both classes also allow two explicit finite rearrangements. First, one may reindex the orientation banks by $sigma mapsto sigma tau$ for a fixed $tau in frak(S)_3$, with the corresponding canonical letter relabeling; Lemma 19 proves its precise effect. Second, one may #emph[conditionally recompile] an earlier finite recipe: expand its finite direct-label refinement tree, take finitely many replicas, impose a rational exact type of complete terminal transcripts through its induced conditional types, and replace corresponding GROUP calls by GROUP on the longer conditional pools. All other original support predicates are retained on their old macroblocks. This is a finite construction rule using the same local primitives, not an operation on scores. Its instances must preserve Definition 16 and nonzero support like every other recipe; Lemma 21 proves those requirements for the uniform terminal type used below. Neither rearrangement authorizes an infinite composition.

Here an AP composition is the finite count-window construction of Lemma 28. Its children are finite recipes, not calls to an attainable-value function. The full expression can therefore be expanded to a finite tree. Equivalently, take the union of all finite levels of this construction rule. The $sans(W)$ class is defined independently of the six-state class.

A recipe belongs to these classes only when its local identities establish Definition 16, its counted original words survive all of its restrictions, and its auxiliary profile and output dimensions are fixed across its direct histories. These are algebraic conditions, not inequalities for numerical scores. The primitive support proofs, exact conditional-type composition, and Lemma 28 establish these conditions for the listed generators. In particular, introducing the AP closure here does not assume the differential inequality that it will later prove.

The auxiliary tensor in every recipe is a product of finite group tensors. We charge the product of their ranks, which is also their tensor product’s rank by Fourier diagonalization and flattening. It is harmless to charge a larger certified bound. No tensor already present in an unresolved fiber is included in the byproduct volume.

For a realization with $n = 6 N$ original occurrences, $L = \| Lambda \|$ counted nonzero direct summands, auxiliary rank bound $R$, and common additional volume $v = a b c$, put

$ D = frac(log L, n) \, #h(2em) A = frac(log R, n) \, #h(2em) M = frac(log v, n) . quad "(4.2)" $ <val:rates>

For $0 < beta lt.eq 3$ and $gamma gt.eq 1$, respectively, the two scores are

$ f_beta = D - A + beta / 3 M \, #h(2em) u_gamma = gamma \( D - A \) + M . quad "(4.3)" $ <val:scores>

These are formal tensor rates. Their definitions impose no assumption on $omega$. In particular, on the same realization $u_(3 \/ beta) = \( 3 \/ beta \) f_beta$.

#prodef([Definition 4.2.])[
  (Attainable-value functions).  For each finite realization let $alpha$ be its canonical bank law. Take all pairs $\( alpha \, t \)$ with $t$ no greater than its score, and take their ordinary Euclidean closure in $Delta \( cal(B) \) times bb(R)$. The upper boundaries of these closed sets are denoted by $F_beta \( alpha \)$ for the six-state class and $U_gamma^W \( q \)$ for the $sans(W)$ class.
] <val:def-value>

Allowing smaller scores makes these sets downward closed. The closure allows irrational laws and limits of finite recipes of increasing size; it does not introduce an infinite composition acting on a finite tensor. In particular, if $F_beta \( alpha \) > c$, then some actual finite realization has score greater than $c$, possibly at a law arbitrarily close to $alpha$.

#thm([Proposition 4.3.])[
  (Bounds, concavity, and continuity).  #emph[For $0 < beta lt.eq 3$ and $gamma gt.eq 1$, 
$ 0 lt.eq F_beta \( alpha \) lt.eq H \( alpha \) lt.eq log 6 \, #h(2em) 0 lt.eq U_gamma^W \( q \) lt.eq gamma H \( q \) lt.eq gamma log 3 . quad "(4.4)" $ <val:entropy-cap>

 Both functions are concave and continuous on their closed probability simplices. They have supporting affine functionals at every relative interior point.]
] <prop:values>

#proof[
  Every additional pairing has size at most the rank charged for its group tensor. Because byproducts remain separate, their volumes multiply, and $M lt.eq A$. Source-word injectivity and exact types give
  $ L lt.eq (frac(N !, product_s \( N alpha_s \) !))^6 lt.eq exp \( 6 N H \( alpha \) \) \, #h(2em) D lt.eq H \( alpha \) . $
  The same formula holds with the $sans(W)$ alphabet. Thus $f_beta lt.eq D$ and $u_gamma lt.eq gamma D$, proving the upper bounds also after closure.
  A specified original word can be retained by singleton projections. Taking one such word of any prescribed rational type in each bank gives $L = R = v = 1$ and score zero. Density supplies the lower bound zero at every law.
  To mix two finite constructions, repeat them enough times that a rational fraction $lambda$ of the positions in each orientation is allocated to the first and the remaining fraction to the second. Tensor their maps, auxiliary inputs, and outputs. The new law and score are
  $ lambda alpha^(\( 1 \)) + \( 1 - lambda \) alpha^(\( 2 \)) \, #h(2em) lambda f^(\( 1 \)) + \( 1 - lambda \) f^(\( 2 \)) . $
  Their direct transcripts inject into concatenated original words, all bank histograms and dimensions remain uniform, and all support conditions are preserved. Rational approximation and closure give concavity for real $lambda$ and limiting laws.
  For upper semicontinuity, suppose $alpha_k arrow.r alpha$. The upper bounds in (4.4) give a bounded subsequence of values approaching the limsup. Approximate each value by a pair in the defining closed set. Closedness then places the limiting pair in that set, so its value is at most the value at $alpha$. This also shows that each finite upper boundary is attained in the closed set.
  For lower semicontinuity at any $alpha$, including at a face, set
  $ epsilon_k = max_(s : alpha_s > 0) (1 - alpha_(k \, s) / alpha_s)_(+) . $
  Then $epsilon_k arrow.r 0$. If $epsilon_k > 0$, the vector
  $ r_k = frac(alpha_k - \( 1 - epsilon_k \) alpha, epsilon_k) $
  is a probability vector. Indeed its coordinates are nonnegative, including those where $alpha_s = 0$, and its total is one. Concavity and nonnegativity give $F_beta \( alpha_k \) gt.eq \( 1 - epsilon_k \) F_beta \( alpha \)$. If $epsilon_k = 0$, conservation of total mass implies $alpha_k = alpha$. This proves lower semicontinuity; the proof for $U_gamma^W$ is identical. A finite continuous concave function has a supporting affine functional at each relative interior point, by separation of its hypograph. ◻
]

#thm([Lemma 4.4.])[
  (Symmetry of canonical laws).  #emph[For $tau in frak(S)_3$, define $\( tau_(*) alpha \) \( s \) = alpha \( tau^(- 1) s \)$. Then 
$ F_beta \( tau_(*) alpha \) = F_beta \( alpha \) \, #h(2em) U_gamma^W \( tau_(*) q \) = U_gamma^W \( q \) . $

]
] <val:canonical-symmetry>

#proof[
  Start with a strong realization and move old bank $sigma tau$ to new bank $sigma$, reinterpreting its canonical symbol $s$ as $tau s$. The physical grade is unchanged, because $sigma \( tau s \) = \( sigma tau \) s$. This is a fixed permutation of original occurrence positions, performed identically on all three sides, together with a change of canonical bookkeeping. Conjugate the old local maps by this position permutation. Their coordinatewise identities continue to hold for arbitrary unresolved tensors, with the same relabeling of their original positions. Every new bank has canonical law $tau_(*) alpha$. Source-word injectivity, nonzero support, the auxiliary tensor, and all byproduct dimensions are unchanged. Thus the same $D \, A \, M$ are attained at the permuted law. The inverse rearrangement uses $tau^(- 1)$; taking closures proves both equalities. This canonical law symmetry is distinct from replicating a schedule in all six physical orientations, which preserves its canonical law. ◻
]

#prodef([Remark 4.5.])[
  (A useful exact-law correction).  If a construction or a convex mixture has law $hat(alpha)$, and a desired law $alpha$ has positive coordinates, put
  $ lambda = max_(s : hat(alpha)_s > 0) (1 - alpha_s / hat(alpha)_s)_(+) . $
  For $lambda > 0$, the vector $r = \( alpha - \( 1 - lambda \) hat(alpha) \) \/ lambda$ is a probability law. Mixing the construction with singleton constructions of average law $r$ therefore gives $alpha$ exactly, at loss at most $K lambda$ if the old score is at most $K$, where $K gt.eq 0$. Moreover
  $ lambda lt.eq max_s frac(\( hat(alpha)_s - alpha_s \)_(+), alpha_s) . $
  When the data are rational, this is a finite rational time-sharing operation. For limiting data it is justified by the defining closure. This correction will be used when converting approximate finite laws to exact target laws.
] <val:dilution>

=== 4.3 Conditional pooling and monotonicity in the formal parameter <val:pooling>

A finite GROUP call pays a small excess of auxiliary rank over its number of labels. Tensor-repeating that particular finite map does not remove its normalized excess. The following lemma replaces each GROUP call by a new one acting on a long conditional pool. It is the requisite justification for monotonicity in $gamma$. The face substitution below evaluates the W value at $gamma = 3 \/ beta$; monotonicity will let the certificate use a lower estimate obtained at a smaller formal parameter.

#thm([Lemma 4.6.])[
  (Recompiling a fixed finite recipe).  #emph[Fix a finite recipe on $n$ original occurrences with canonical law $q$, $L$ terminal labels, charged auxiliary rank $R$, and additional volume $v$. Fix $gamma gt.eq 1$. There is a sequence of recipes on larger exact banks, with the same canonical law $q$, such that 
$ liminf u_gamma^(upright("new")) gt.eq frac(gamma log L - gamma log R + log v, n) \, #h(2em) liminf \( D^(upright("new")) - A^(upright("new")) \) gt.eq 0 . quad "(4.5)" $ <val:recompile-goal>

 All source-word restrictions of the old recipe hold separately in every old macroblock of the new recipes.]
] <val:recompile>

#proof[
  Expand the fixed recipe into its finite sequence of conditional refinements, including the finite recipes used at any earlier AP nodes. Refine a history whenever its next local operation, its informed pair, or its auxiliary parameters differ. Terminal histories can be padded by deterministic steps so that every transcript is a leaf of one finite decision tree. Every intermediate label is determined by the designated original word: GROUP labels encode its source label sequence, matching labels identify the word, coarse flags are functions of it, and AP labels are fixed by its disjoint count windows. Thus this expansion adds no terminal multiplicity; its leaves are exactly the $L$ original strong labels. A GROUP context refers to a particular such call with its preceding direct history fixed. If several pools are processed, order them and include their labels in the history. A physical orientation is part of the context when needed.
  Give the $L$ complete terminal transcripts their uniform probability law. At context $c$, let $w_c$ be its visitation probability, let $r_c$ be the conditional law of its GROUP label, and write
  $ h_c & = H \( r_c \) \,\
K_c & = upright("number of available labels") \,\
R_c & = upright("charged group rank") \,\
m_c & = upright("old pairing size") . $
  Repeated calls are regarded as distinct contexts. All probabilities are rational. Every actually used label is among the $K_c$ available tags, so
  $ h_c lt.eq log K_c lt.eq log R_c \, #h(2em) log m_c lt.eq log R_c . quad "(4.6)" $ <val:group-inequalities>
  The last two inequalities follow because there are at most $\| G \|$ tags and at most $\| G \|$ retained pairing coordinates in a group tensor of rank $\| G \|$.
  Choose $B$ through sufficiently divisible multiples. Across $B$ replicas of the old complete recipe, retain precisely the exact type with $B \/ L$ occurrences of each terminal transcript. This condition is implemented in prefix order: at a prefix of probability $w$, impose the induced exact conditional type of its next label on its $B w$ replicas. Each next type is readable on the sides that already read that label. For a direct matching label or an AP target label, all three sides read it; for a GROUP label, its two informed sides read it before the GROUP call. Previously direct labels identify the relevant pool on every side. The conditional type restrictions are therefore local.
  At GROUP context $c$ replace the old $B w_c$ copies of its auxiliary call by one application of Lemma 7 to the entire conditional label sequence of that pool. Its number of possible labels is
  $ K'_c = frac(\( B w_c \) !, product_s \( B w_c r_c \( s \) \) !) \, #h(2em) log K'_c = B w_c h_c + O \( log B \) . $
  Choose the pairing size to be $K'_c$ and choose the efficient group parameters of Lemma 7. Consequently
  $ log R'_c = B w_c h_c + o \( B \) \, #h(2em) log m'_c = B w_c h_c + o \( B \) . quad "(4.7)" $ <val:new-group-rates>
  A deterministic pool requires no auxiliary. The number of contexts is fixed before $B$ increases, so all their errors sum to $o \( B \)$.
  Here are the support and resource details of this replacement. The current pool is selected by previously direct histories. Both informed sides can read its conditional label word independently, so the new GROUP call is legitimate. Its payload comprises every remaining original coordinate and every old support predicate. The pointwise identity preserves that payload. The new direct tag identifies the entire conditional word on all three sides, so each old per-macro GROUP label is locally recoverable from it. Every subsequent old label-controlled map can therefore be implemented using the new tag; the old pairing register is replaced and is never consulted. Other direct operations are retained on the old macroblocks, followed by the specified conditional-type projections. Thus each final tuple consists of old admissible transcripts, and every old per-block count window, COMPLETE/PARITY predicate, and singleton or matching restriction still holds. All its original scalar fibers are nonzero. The exact conditional counts fix every pool and every auxiliary multiplicity independently of the new output history. The auxiliaries can be appended once and the maps used block-diagonally on direct histories. New pairing dimensions may differ from the old ones; this does not affect a later map, since byproduct indices are never used for a later decision.
  The product of the conditional multinomial counts is the full multinomial count of terminal transcript tuples. Hence the new direct multiplicity is
  $ L' = frac(B !, \( \( B \/ L \) ! \)^L) \, #h(2em) log L' = B log L + O \( log B \) . quad "(4.8)" $ <val:new-label-count>
  No terminal transcript is lost beyond these prescribed types: non-GROUP maps act as before, and each replacement GROUP retains every conditional word of its selected type. Conversely, these types specify exactly the chosen leaf counts. This also proves injectivity into original words. Each old terminal word has the same law in every canonical bank. Concatenate the $B$ already banked replicas within corresponding original orientation banks, retaining every old orientation label and internal relative permutation. No additional outer replicas are introduced at this stage. Each resulting canonical bank therefore has the old law $q$. The construction respects Definition 16, not just a total histogram after forgetting orientations, with exactly $B n$ original occurrences as used in the displayed counts.
  The chain rule for the uniform terminal transcript gives
  $ sum_(c upright(" a GROUP context")) w_c h_c lt.eq log L . quad "(4.9)" $ <val:group-chain-rule>
  The omitted contributions are conditional entropies of other direct labels and are nonnegative. Equations (4.7) and (4.8) now prove the second assertion in (4.5).
  For the first assertion, the original auxiliary profile is fixed across terminal histories. Averaging its logarithmic charges and its pairing volumes over those histories therefore gives
  $ sum_c w_c log R_c = log R \, #h(2em) sum_c w_c log m_c = log v . $
  If the old rank bound charges unused resources or is larger than the product rank, the first equality can instead be replaced by $lt.eq$, which only strengthens the conclusion below. Non-GROUP operations have no additional auxiliary charge or byproduct. From (4.7) and (4.8), the limiting improvement of the unnormalized $gamma$-score is at least
  $ & sum_c w_c #scale(x: 120%, y: 120%)[\[] gamma log R_c - log m_c - \( gamma - 1 \) h_c #scale(x: 120%, y: 120%)[\]]\
 & quad = sum_c w_c #scale(x: 120%, y: 120%)[\[] \( log R_c - log m_c \) + \( gamma - 1 \) \( log R_c - h_c \) #scale(x: 120%, y: 120%)[\]] gt.eq 0 \, $
  by (4.6). Dividing by $n$ proves the first assertion. The finite common multiples needed above exist because the expanded tree, its rational laws, and its old block sizes were fixed first. ◻
]

#thm([Proposition 4.7.])[
  (Monotonicity).  #emph[For $1 lt.eq gamma_0 lt.eq gamma_1$ and every $sans(W)$ law $q$, 
$ U_(gamma_1)^W \( q \) gt.eq U_(gamma_0)^W \( q \) . $

]
] <prop:monotonicity>

#proof[
  Apply Lemma 21 to any finite recipe scored at $gamma_0$. On each of the recompiled realizations,
  $ u_(gamma_1) - u_(gamma_0) = \( gamma_1 - gamma_0 \) \( D - A \) . $
  The second assertion of that lemma makes the limiting difference nonnegative, while its first assertion preserves the old $gamma_0$-score. Thus the closure at $gamma_1$ contains a value at least as large at the old law. Approximate an arbitrary pair in the $gamma_0$ closed attainable set by finite recipes and take a diagonal sequence of their recompilations. Their laws converge to the same $q$; closedness proves the claim. ◻
]

=== 4.4 A direct matching lower bound <val:matching-section>

The first boundary estimate separates original scalar components without an auxiliary tensor. The matching argument uses progression-free hashing and collision removal as in #cite(label("cw"), form: "prose") Section 6; we give the details with the bank normalization needed here.

#thm([Lemma 4.8.])[
  (Progression-free labels).  #emph[For all sufficiently large integers $L$ there is a set $J subset.eq { 1 \, dots.h \, L }$ containing no nonconstant three-term arithmetic progression and satisfying 
$ log \| J \| = log L - O \( sqrt(log L) \) . $

 For primes $P arrow.r oo$, a subset of $bb(F)_P$ of size $P exp \( - O \( sqrt(log P) \) \)$ has the same property for progressions modulo $P$.]
] <val:ap-set>

#proof[
  This is the sphere construction of #cite(label("behrend"), form: "prose"). Put $d = floor.l sqrt(log L) floor.r$ and $m = floor.l L^(1 \/ d) \/ 2 floor.r$. Encode vectors in ${ 0 \, dots.h \, m - 1 }^d$ as integers in base $2 m$. Their encodings are nonnegative and smaller than $\( 2 m \)^d lt.eq L$. There are at most $d \( m - 1 \)^2 + 1$ possible squared norms, so one norm shell contains at least $m^d \/ \( d \( m - 1 \)^2 + 1 \)$ vectors. Its logarithmic size is $log L - O \( sqrt(log L) \)$: both the base overhead $d log 2$ and the norm-shell loss $O \( log d + log m \)$ have that order.
  If three encodings satisfy $a + c = 2 b$, digitwise addition on either side produces no carries, so their vectors satisfy the same midpoint relation. If all three have the same squared norm, writing the first and third as $b plus.minus u$ gives $parallel b + u parallel^2 + parallel b - u parallel^2 = 2 parallel b parallel^2 + 2 parallel u parallel^2$ and forces $u = 0$. The three vectors coincide. Translating all encodings by one puts them in ${ 1 \, dots.h \, L }$ without changing this property.
  For a prime $P$, apply the integer construction inside ${ 1 \, dots.h \, floor.l P \/ 4 floor.r }$. An integer of the form $a + c - 2 b$ from this interval has absolute value less than $P$. If it vanishes modulo $P$, it is zero over the integers. This gives the asserted modular set. ◻
]

#thm([Proposition 4.9.])[
  (Banked marginal matching).  #emph[Let $alpha in Delta \( cal(S) \)$, and let $alpha_X \, alpha_Y \, alpha_Z$ be its three canonical local-grade marginals. For every $0 < beta lt.eq 3$, 
$ F_beta \( alpha \) gt.eq H_(upright("marg")) \( alpha \) := frac(H \( alpha_X \) + H \( alpha_Y \) + H \( alpha_Z \), 3) . quad "(4.10)" $ <val:matching-bound>

 The constructions proving this bound are strong realizations with no auxiliary input and no additional matrix multiplication volume.]
] <prop:matching>

#proof[
  First take $alpha$ rational and $N$ through its admissible denominators. Write $p_i = alpha \( 2 e_i \)$ and $E_i = alpha \( upright(bold(1)) - e_i \)$. On canonical side $i$, the frequency of grade two is exactly $p_i$. If $b_i$ is the frequency of grade one, then
  $ b_i = E_(i + 1) + E_(i + 2) \, #h(2em) E_i = 1 / 2 \( b_(i + 1) + b_(i + 2) - b_i \) \, $
  with subscripts modulo three. Thus the three marginal types determine the whole joint type. Local restrictions to those types, separately in each orientation bank, retain precisely the original words of canonical law $alpha$ in every bank. No nonlocal joint-type filter is used.
  View the retained support as a three-partite hypergraph. A vertex is a complete retained local index word on one physical side; an edge is a retained triple of local words. There are
  $ B_N = (frac(N !, product_(s in cal(S)) \( N alpha_s \) !))^6 $
  edges. Each physical side sees each canonical marginal in exactly two banks, so all three vertex parts have the same size
  $ V_N = product_(i = 0)^2 (frac(N !, product_(a = 0)^2 \( N alpha_i \( a \) \) !))^2 . $
  Consequently, with $n = 6 N$,
  $ log B_N = n H \( alpha \) + O \( log N \) \, #h(2em) log V_N = n H_(upright("marg")) \( alpha \) + O \( log N \) . quad "(4.11)" $ <val:matching-counts>
  Permuting positions within each bank acts transitively on each local exact-type vertex set and preserves the edge set. Every vertex therefore has degree $Delta_N = B_N \/ V_N$. Two vertices on different sides determine at most one edge, since the original grades sum to two coordinatewise.
  Choose a prime $P > 3$ between $X_N$ and $2 X_N$, where $X_N = exp \( sqrt(N) \) max \( 3 \, Delta_N \)$; integer rounding or enlarging $X_N$ by a fixed amount is immaterial. Such a prime exists for all sufficiently large $N$ by Bertrand’s postulate. Let $J subset bb(F)_P$ be the set of Lemma 23. Choose independent uniform field elements $d_X \, d_Y$ and $w_1 \, dots.h \, w_n$, and for the three physical index words $I \, J' \, K$ define local hashes
  $ h_X \( I \) & = d_X + sum_t w_t I_t \,\
h_Y \( J' \) & = d_Y + sum_t w_t J'_t \,\
h_Z \( K \) & = 1 / 2 (d_X + d_Y + sum_t w_t \( 2 - K_t \)) . $
  The symbol $J'$ here is an index word; the progression-free set is $J$. On every edge $h_X + h_Y = 2 h_Z$. Retaining variables whose hashes lie in $J$ therefore forces all three hashes on a surviving edge to coincide. A fixed edge survives with probability $\| J \| \/ P^2$.
  For clarity, condition on this edge surviving with common hash $a in J$. The equations fix $d_X$ and $d_Y$ once the vector $\( w_t \)$ is chosen; they leave that vector uniformly distributed. For a different edge sharing its $X$ vertex, survival imposes the nonzero linear equation $sum_t w_t \( J''_t - J'_t \) = 0$. Its conditional probability is $1 \/ P$. The same reasoning holds for a shared $Y$ vertex. For a shared $Z$ vertex, tightness gives $I' + J'' = I + J'$; survival is equivalent to $sum_t w_t \( I'_t - I_t \) = 0$, again of probability $1 \/ P$. The difference vectors are nonzero because two shared vertices would force the edges to agree. Their entries belong to ${ - 2 \, - 1 \, 0 \, 1 \, 2 }$, so they remain nonzero modulo $P$.
  There are fewer than $3 Delta_N$ neighboring edges. A union bound shows that the expected number of isolated surviving edges is at least
  $ frac(B_N \| J \|, P^2) (1 - frac(3 Delta_N, P)) = V_N exp \( - o \( N \) \) . quad "(4.12)" $ <val:isolated-count>
  Here $log \( P \/ Delta_N \) = O \( sqrt(N) \)$, $log \( P \/ \| J \| \) = O \( sqrt(log P) \) = o \( N \)$, and $3 Delta_N \/ P arrow.r 0$. Thus some hash choice attains this many isolated edges. Delete every vertex not belonging to an isolated surviving edge. No extra edge can remain: an extra edge touching any retained vertex would contradict that vertex’s edge being isolated in the filtered hypergraph. The output is therefore a direct sum of scalar original components.
  The restriction preserves each chosen original component, with any unresolved tensor attached to it, unchanged. All chosen words have the same exact canonical type in every bank. Thus it is a strong realization with $A = M = 0$ and $D gt.eq H_(upright("marg")) \( alpha \) - o \( 1 \)$ by (4.11)–(4.12). Passing to the attainable closure proves (4.10) for rational laws. Approximation by rational laws, including on faces, and continuity prove the general statement. ◻
]

=== 4.5 The five-component face <val:face-section>

On one face the six-state tensor has a genuine three-state $sans(W)$ partition. The remaining distinctions within its coarse groups must be separated only after that partition has been resolved. This gives the second boundary estimate used in the certificate.

#thm([Proposition 4.10.])[
  ($sans(W)$ constructions on a face).  #emph[Suppose $alpha = \( p_0 \, p_1 \, p_2 \, E_0 \, E_1 \, E_2 \) in Delta \( cal(S) \)$ satisfies $E_1 = 0$. Put 
$ Q & = \( p_2 + E_0 \, med p_0 + E_2 \, med p_1 \) \,\
J \( alpha \) & = "en" \( p_2 \) + "en" \( E_0 \) + "en" \( p_0 \) + "en" \( E_2 \) - "en" \( Q_0 \) - "en" \( Q_1 \) \, quad "(4.13)" $ <val:face-Q>

 where $"en" \( s \) = - s log s$ and $"en" \( 0 \) = 0$. Then for $0 < beta lt.eq 3$, 
$ F_beta \( alpha \) gt.eq beta / 3 #scale(x: 120%, y: 120%)[\(] U_(3 \/ beta)^W \( Q \) + J \( alpha \) #scale(x: 120%, y: 120%)[\)] . quad "(4.14)" $ <val:face-bound>

 In particular, if $1 lt.eq gamma_0 lt.eq 3 \/ beta$, the same lower bound holds with $U_(gamma_0)^W$ in place of $U_(3 \/ beta)^W$.]
] <prop:face>

#proof[
  Scale $x_1 \, z_1 \, y_0 \, y_2$ by a degeneration parameter. The five terms other than 101 have degree one, whereas 101 has degree three. Dividing by the parameter and taking its leading coefficient leaves
  $ A = x_0 \( y_0 z_2 + y_1 z_1 \) \, #h(2em) B = \( x_2 y_0 + x_1 y_1 \) z_0 \, #h(2em) C = x_0 y_2 z_0 . $
  The local predicates $z > 0$, $x > 0$, and $y = 2$ identify, respectively, $A \, B \, C$, and exactly one holds on each retained term. These are $sans(W)$ flags, with the canonical coarse law $Q$ in (4.13). The fixed permutation identifying the three active parties with the three coarse labels is applied to the physical banks; it bijects their orientations.
  Apply a strong $sans(W)$ recipe to these coarse occurrences. Its unresolved fibers contain the internal binary choices in $A$ and $B$. The strong identity retains those choices without restricting them. Once a coarse word is direct, all sides know its $A$ and $B$ positions. Within $A$, the choice between 002 and 011 is independently readable on $Y$ and $Z$; within $B$, the choice between 200 and 110 is independently readable on $X$ and $Y$. Apply exact conditional types and GROUP to the $A$ and $B$ pools separately in every original orientation bank. Their total entropy per original occurrence is
  $ Q_0 H (p_2 / Q_0 \, E_0 / Q_0) + Q_1 H (p_0 / Q_1 \, E_2 / Q_1) = J \( alpha \) \, $
  with an empty pool contributing zero. Lemma 7 gives this additional logarithmic volume and matching direct multiplicity, with equal auxiliary rank to leading order. Exact types fix pool sizes across all coarse histories, so the internal auxiliary product is charged once. The final labels are distinct original scalar words of the prescribed canonical bank law, and all their fibers are nonzero.
  For a coarse realization scored at $gamma = 3 \/ beta$, its contribution to the six-state score is $\( beta \/ 3 \) u_gamma$ by (4.3). The two internal pools contribute $\( beta \/ 3 \) J \( alpha \)$ in the limit. To obtain the supremum at an interior face law, approximate its $sans(W)$ value by finite recipes, correct their small coarse-law discrepancies by Remark 20, and choose rational conditional types. Every step is finite, with errors made arbitrarily small before taking the attainable closure. This proves (4.14) when the five present coordinates are positive. Both sides are continuous on the closed face by Proposition 18 and continuity of conditional entropy, so limits give the remaining cases. The last assertion is Proposition 22. ◻
]

== 5 Arithmetic-progression restrictions and differential comparison <ap:section>

An attainable value contains information about nearby source laws, not merely about a single tensor restriction. This section makes that information quantitative. If a supporting plane loses too little value when the mean grade changes, one can steer long grade sequences into many disjoint count windows at a total cost smaller than the entropy of the windows. Their labels then give an improved tensor construction, contradicting the supporting plane. The steering argument must control every path permitted by its controls: an estimate that only holds with high probability would not justify counting all the output tensors. We first construct the shared count labels and prove their finite tensor gain. We then build controls whose cost is strictly smaller than that gain.

All source laws in this section are the canonical laws in each of the six physical orientation banks of Definition 16. In particular, they are not the aggregate physical law obtained by forgetting the banks.

Let

$ cal(P) = { x in bb(R)^3 : x_0 + x_1 + x_2 = 0 } . $

We use orthonormal coordinates on this plane when forming covariances, gradients, and Hessians. For the six-state alphabet, the grade of a source letter is its vector in $S = { 2 e_i \, bold(1) - e_i : 0 lt.eq i lt.eq 2 }$. For a law $alpha$, write

$ mu \( alpha \) = bb(E)_alpha g \, #h(2em) C \( alpha \) = bb(E)_alpha \[ \( g - mu \) \( g - mu \)^top \] \|_(cal(P)) . $

The covariance is positive definite when every letter has positive probability. Indeed, the three grades $2 e_i$ alone affinely span the mean plane. For a twice continuously differentiable chart $alpha \( mu \)$ whose grade mean is $mu$, set

$ cal(L) u = C \( alpha \( mu \) \) : D^2 u = "Tr" \( C \( alpha \( mu \) \) D^2 u \) . $

This is the full covariance contraction; the corresponding probabilistic generator has an additional factor $1 \/ 2$.

Smooth touching tests are a standard formulation in viscosity-solution theory #cite(label("crandalllions1983")); see in particular #cite(label("crandallishiilions1992")) Section 2. The differential inequality below is derived directly from finite tensor constructions.

#thm([Theorem 5.1.])[
  (Lower tests for the six-state value).  #emph[Fix $0 < beta lt.eq 3$, and let $alpha \( mu \)$ be a $C^2$ chart of strictly positive six-state laws, parametrized by their means on an open subset of ${ mu : sum_i mu_i = 2 }$. Suppose that a $C^2$ function $phi$ touches $F_beta compose alpha$ from below at an interior point $mu_(*)$. If $g_(*)$ is any supporting supergradient of $F_beta$ at $alpha \( mu_(*) \)$, then 
$ cal(L) phi \( mu_(*) \) lt.eq g_(*) dot.op cal(L) alpha \( mu_(*) \) - 1 . quad "(5.1)" $ <ap:lower-test>

]
] <thm:ap>

Here “touches from below” means equality at the indicated point and the inequality $phi lt.eq F_beta compose alpha$ in a neighborhood. No derivatives of $F_beta$ are assumed. A supporting supergradient is a vector such that

$ F_beta \( q \) lt.eq F_beta \( alpha \( mu_(*) \) \) + g_(*) dot.op \( q - alpha \( mu_(*) \) \) quad upright("for every source law ") q . $

Such vectors exist at positive laws by Proposition 18.

Write $h = F_beta$, $mu_0 = mu_(*)$, $alpha_0 = alpha \( mu_0 \)$, and

$ ell \( q \) = h \( alpha_0 \) + g_(*) dot.op \( q - alpha_0 \) . $

For a finite construction with law $q$ and utility $u$, its #emph[supporting-plane cost] is $ell \( q \) - u$. It is nonnegative because $u lt.eq h \( q \) lt.eq ell \( q \)$. This cost measures lost utility; it is not an additional auxiliary rank charge.

=== 5.1 Locally readable target windows <locally-readable-target-windows>

We require many target indices with no nonconstant three-term arithmetic progression. We use the integer form of the progression-free set construction of Behrend #cite(label("behrend")), proved in Lemma 23. Using such labels to separate tensor products follows the progression-free extraction method of Coppersmith–Winograd #cite(label("cw")) Sections 4–7; the count-window restriction needed here is given explicitly below.

#thm([Lemma 5.2.])[
  #emph[For all sufficiently large integers $L$, there is a set $J subset.eq { 1 \, dots.h \, L }$ with no nonconstant three-term arithmetic progression and 
$ log \| J \| gt.eq log L - O \( sqrt(log L) \) . $

]
] <ap:behrend>

#proof[
  This is the integer assertion of Lemma 23. ◻
]

For a length-$n$ word with grades $g_1 \, dots.h \, g_n$, its centered grade sum is $sum_(t = 1)^n \( g_t - mu_0 \)$. Use the targets

$ y_j^(upright("grade")) = \( j \, j \, - 2 j \) sqrt(n) \/ L \, #h(2em) j in J \, quad "(5.2)" $ <ap:target>

and coordinate windows with radius $rho = sqrt(n) \/ \( 10 L \)$. Each side reads its own centered sum. Because the three centered sums add to zero, a retained triple whose three local window labels are $j_0 \, j_1 \, j_2$ satisfies

$ \| j_0 + j_1 - 2 j_2 \| lt.eq 3 \/ 10 . $

The left side is an integer, and hence is zero. The progression-free property gives $j_0 = j_1 = j_2$. Windows are disjoint on every side, including the side whose target spacing is twice as large. Thus a nonzero retained tensor has a shared direct target label.

In a physical orientation bank $sigma in frak(S)_3$, the mean $mu_0$, the target vector, and the local windows are all permuted by $sigma$. The coordinate-sum test is expressed in canonical coordinates. A physical side reads the corresponding permuted coordinate. The coordinate-sum argument is unchanged, so the target remains shared. There is no averaging of the canonical grade covariance across orientations in this operation.

=== 5.2 Exact finite compilation <exact-finite-compilation>

At each target and prefix, a control specifies a probability law on the source alphabet and a cost. A #emph[permitted path] chooses at every step a letter in the prescribed law’s support. In the next lemma, every node law and utility must be supplied by an earlier finite strong realization. The lemma turns these realizations into tensor maps when every permitted path ends inside its assigned target windows. It is useful to state it for either alphabet, and with a general coefficient $lambda > 0$ on the direct-label logarithm. For the six-state score $D - A + \( beta \/ 3 \) M$ this coefficient is $lambda = 1$; for the W score $gamma \( D - A \) + M$ it is $lambda = gamma$.

The exact populations and multinomial entropy estimates use the method of types #cite(label("csiszar1998")) Section II. The proof also establishes the local tensor maps, their uniform auxiliary supply, and nonvanishing of every counted output.

#thm([Lemma 5.3.])[
  (Compiling a finite tree).  #emph[Fix a finite horizon $n$, a finite set of disjoint shared terminal windows $J$, and a rational target law $a$. At every target and prefix node $v = \( j \, h \)$, prescribe an earlier finite strong realization with exact canonical law $q_v$, utility $u_v$, and uniform auxiliary and byproduct dimensions. Assume that every path permitted by these laws belongs to its target windows. Put 
$ w_(j \, h) = a_j product_(t = 1)^(\| h \|) q_(j \, h_(< t)) \( h_t \) \, #h(2em) overline(q) = 1 / n sum_(\| h \| < n \, med j in J) w_(j \, h) q_(j \, h) . $

 Then finite strong realizations with exact law $overline(q)$ attain, in the limit of their outer bank sizes, 
$ u_(upright("out")) gt.eq frac(lambda H \( a \), n) + 1 / n sum_(\| h \| < n \, med j in J) w_(j \, h) u_(j \, h) . quad "(5.3)" $ <ap:compile-score>

 The limiting notation only removes a multinomial type-count loss; every member of the family is a finite tensor construction using one fixed auxiliary tensor and nonzero counted outputs.]
] <lem:compile>

#proof[
  Use $B$ length-$n$ macroblocks in each of the six physical orientations. Thus the total number of source occurrences is $6 B n$. First apply the local terminal-window projections. On any surviving term, the preceding argument makes the target of each macroblock a shared label. On every orientation restrict the target-label word to the exact type $a$. The number of such words is
  $ binom(B, \( B a_j \)_(j in J)) \, $
  with logarithm $B H \( a \) + O \( log B \)$, since $J$ is fixed. The six orientations have independently chosen target words of this type.
  For each shared target assignment, process sites in order. At the node $v = \( j \, h \)$, there are exactly
  $ b_v = B w_v $
  macroblocks in every orientation having that target and canonical prefix. Apply its prescribed strong realization to their next occurrences, as an equal collection across the six orientations. If that realization consumes $N_v$ occurrences in each orientation, tile $b_v \/ N_v$ copies of it. Its exact per-bank histogram guarantees that the number of these macroblocks receiving next canonical letter $i$ is
  $ b_(j \, h i) = b_(j \, h) q_(j \, h) \( i \) . quad "(5.4)" $ <ap:prefix-count>
  These numbers do not depend on which of its direct output labels occurs. That label does identify, on every side, exactly which macroblocks enter each child node, so the next maps may address the corresponding original occurrence positions conditionally on the shared direct label.
  All the numbers $w_v$ and $q_v$ are rational. There are finitely many nodes and finitely many integers $N_v$. Taking $B$ through common multiples of their denominators and the necessary $N_v$’s makes every nonzero $b_v$ an exact tiling. Zero populations require no call. This proves the induction (5.4) throughout the tree. It also shows that every branch uses the same number of every raw auxiliary tensor. Append their product once. Apply the appropriate maps inside each already direct branch; there is no multiplication of auxiliary rank by the number of branch labels. Uniformity of the raw byproduct dimensions makes the final byproduct dimensions uniform as well. The byproducts remain separate tensor factors.
  We justify carefully why the earlier count restrictions do not invalidate the raw calls. Definition 16 and the pointwise construction in Lemma 8 give a coordinatewise identity for every correlated unresolved payload, preserving the original source coordinates. Conditional maps can address the listed original positions without changing the source word. Their identities therefore commute with the previously applied local count projectors. The same statement holds for a degeneration after taking its leading coefficient. Equivalently, compute the unfiltered raw identity first and then apply the original count projections to its designated fibers.
  This identity alone would allow a formal zero fiber, which must not be counted. Here every complete designated word has, in each macroblock, a path permitted by the chosen controls. It consequently satisfies that macroblock’s target windows. Its local raw words satisfy the support conditions of the corresponding earlier strong realizations. Starting from the independent source tensor, every such complete source word is present, and it survives all of these predicates. Thus every designated output counted here is nonzero. This also proves that every target assignment of the retained exact type supplies all the claimed raw outputs, even though the initial projection may correlate the unprocessed suffixes.
  Bank labels are fixed physical orientations throughout. At a node the child realization supplies law $q_v$ in canonical coordinates in each bank; its physical law in bank $sigma$ is $sigma q_v$. Both the prefix classification and the window centering use that same conversion. This AP compilation introduces no additional relative permutation of a site’s source orientation: all internal physical permutations of a raw recipe are already included in its strong realization identity and its exact per-bank type. The population assigned to an original input bank is not redefined after observing an output label. Summing the node contributions therefore gives the exact final canonical law $overline(q)$ in every bank.
  For clarity about the probability notation, choose one macroblock uniformly from any fixed final output branch, within a fixed canonical orientation. The exact counts give
  $ bb(P) \( j \, h \) = w_(j \, h) \, #h(2em) bb(P) \( upright("next letter") = i divides j \, h \) = q_(j \, h) \( i \) . $
  This is a counting identity. Different macroblocks need not be independent. The law of one sampled block is exactly the law used in the tree’s expected-cost calculation, so its single-step canonical covariance is the covariance of $q_(j \, h)$, not a symmetrization across banks.
  It remains to count multiplicities and charges. If the child realization at $v$ has direct multiplicity $L_v$, rank bound $R_v$, and volume $V_v$, its rates are normalized by $6 N_v$. Its $b_v \/ N_v$ copies therefore contribute precisely $w_v \/ n$ times each raw rate to the rate per $6 B n$ source occurrences. The target types contribute
  $ frac(6 log binom(B, \( B a_j \)_j), 6 B n) = frac(H \( a \), n) + O (frac(log B, B)) $
  to the direct rate and nothing to the auxiliary rate. This proves (5.3) in the limit.
  No extra transcript entropy has been counted: the target is recovered uniquely from the final original word’s disjoint count windows. Once the target and earlier prefixes are fixed, injectivity of each child realization recovers its direct label from its designated original subword. Induction therefore makes the complete output label inject into the complete source word. The coordinatewise identity, exact bank law, uniform dimensions, and nonvanishing just proved are precisely the strong realization invariants. Only finite compositions and tensor products have been used for every admissible finite $B$. ◻
]

For any affine functional $ell$, define the node cost by $c_v = ell \( q_v \) - u_v$. The prefix weights sum to one at each time, so the averaged law in the lemma satisfies

$ 1 / n sum_v w_v ell \( q_v \) = ell \( overline(q) \) . $

Thus (5.3) has the equivalent form

$ u_(upright("out")) gt.eq ell \( overline(q) \) + frac(lambda H \( a \) - bb(E) sum_(t = 1)^n c_t, n) . quad "(5.5)" $ <ap:compile-gain>

The expectation denotes the finite sum $sum_v w_v c_v$. For the six-state supporting plane fixed above, $lambda = 1$ and every node cost is nonnegative. To contradict that plane, it is therefore enough to send every permitted path into its window while keeping the expected cost strictly below $H \( a \)$. The remaining argument constructs such controls from a failed lower test.

=== 5.3 A lower test supplies inexpensive small drifts <ap:local-cost>

At a lower contact, $ell compose alpha - phi$ has a local minimum zero. Thus its first derivative vanishes and

$ Q_0 = g_(*) dot.op D^2 alpha \( mu_0 \) - D^2 phi \( mu_0 \) succ.curly.eq 0 . quad "(5.6)" $ <ap:q0>

If (5.1) fails, $"Tr" \( Q_0 C \( alpha_0 \) \) < 1$. Choose $epsilon > 0$ so small that

$ Q = Q_0 + epsilon I succ 0 \, #h(2em) tau = "Tr" \( Q C \( alpha_0 \) \) < 1 . quad "(5.7)" $ <ap:tau>

Taylor’s theorem and $phi lt.eq h compose alpha$ give, after reducing the neighborhood if necessary,

$ 0 lt.eq c \( v \) := ell \( alpha \( mu_0 + v \) \) - h \( alpha \( mu_0 + v \) \) lt.eq 1 / 2 v^top Q v . quad "(5.8)" $ <ap:local-cost-bound>

By the definition of the closed attainable set, the law and utility in this display can be approximated simultaneously, to any prescribed positive accuracy, by a finite earlier construction. We postpone these finitely many approximations until the entire control tree has been fixed.

Transform centered grades by $Q^(1 \/ 2)$. A grade $g$ then gives the increment $X = Q^(1 \/ 2) \( g - mu_0 \)$. A small prescribed mean $m$ is obtained by taking the law $alpha \( mu_0 + Q^(- 1 \/ 2) m \)$. We call these chart laws soft controls; their ideal cost satisfies

$ c \( m \) lt.eq \| m \|^2 \/ 2 . quad "(5.9)" $ <ap:drift-cost>

There is a fixed bound $B > 0$ on the magnitude of every increment, and

$ bb(E) \| X \|^2 arrow.r tau quad upright("as ") m arrow.r 0 . quad "(5.10)" $ <ap:noise-limit>

The limit concerns the second moment, which equals the covariance trace at mean zero.

We also allow exact singleton controls. The point $mu_0$ is in the relative interior of the grade convex hull, so there is a $kappa > 0$ such that for every unit vector $u in cal(P)$, one singleton increment satisfies $u dot.op X lt.eq - kappa$. Its utility is zero. The costs of the finitely many singleton choices have a finite common upper bound $C_(*)$.

=== 5.4 A control that retains every path <a-control-that-retains-every-path>

We now construct controls for the bounded increments just described whose cost is smaller than the target-label gain in (5.5). The terminal guarantee must hold for every permitted path. Soft controls will be made safe for every letter in the entire source alphabet, so later rational approximation cannot create an unsafe new outcome.

#thm([Lemma 5.4.])[
  (Shrinking-corridor control).  #emph[Assume that every $\| m \| lt.eq m_0$ is available as a soft mean, with cost at most $\| m \|^2 \/ 2$, bounded increments $\| X \| lt.eq B$, and the limit (5.10). Assume also the singleton controls above. Fix $c > 0$ and a target bound $C_y > 0$. For every $eta > 0$ there is a constant $K_eta$, independent of $L$, with the following property. For each integer $L gt.eq 2$, all sufficiently large finite horizons $n$, and every target $y$ with $\| y \| lt.eq C_y sqrt(n)$, there is a finite control tree such that every permitted path satisfies 
$ lr(|sum_(t = 1)^n X_t - y|) < w \, #h(2em) w = c sqrt(n) \/ L \, $

 and its expected total cost is at most 
$ bb(E) sum_(t = 1)^n c_t lt.eq \( tau + 2 eta \) log L + K_eta . quad "(5.11)" $ <ap:total-cost>

 The expectation is only an accounting device for the tree’s transition laws; the terminal inclusion holds for every path.]
] <ap:corridor>

#proof[
  Reduce $m_0$ if necessary so that all its means lie in the available local chart. Choose a wall cutoff $d_0$ such that
  $ d_0 gt.eq 16 B \, #h(2em) d_0 m_0 gt.eq 1024 B^2 . $
  Choose $a$ sufficiently large that
  $ a gt.eq 1024 B^2 \, #h(2em) a log (1 + frac(kappa, 8 d_0)) gt.eq 2 C_(*) + 2 . $
  Finally choose $D_0$ so large that
  $ D_0 > 2 C_y + 1 \, #h(2em) D_0 gt.eq B \, #h(2em) frac(a B^2, D_0^2) < eta \/ 4 . quad "(5.12)" $ <ap:constants>
  The numerical factors are convenient slack, not optimized constants. All these choices are independent of $L$ and $n$.
  If $r$ steps remain, put
  $ s = r + w^2 \/ D_0^2 \, #h(2em) R_s = D_0 sqrt(s) \, #h(2em) J_s \( e \) = frac(\| e \|^2, 2 s) - a log (1 - frac(\| e \|^2, D_0^2 s)) \, $
  where $e$ is the current displacement from the target. The permitted region is $\| e \| < R_s$. Initially $e = - y$, so this region contains the starting point with a fixed relative margin. At the terminal time its radius is $w$.
  Write $delta = R_s - \| e \|$. If $delta gt.eq d_0$, choose the soft mean
  $ m = - "clip"_(m_0) (e / s + frac(2 a e, R_s^2 - \| e \|^2)) \, quad "(5.13)" $ <ap:feedback>
  where clipping truncates the vector’s length to at most $m_0$. If $delta < d_0$, choose an exact singleton with inward radial component at least $kappa$.
  First verify support. In the soft region every increment in the entire alphabet has magnitude at most $B < d_0$, while $R_s - R_(s - 1) = O \( s^(- 1 \/ 2) \)$. Thus every outcome stays in the next region once the minimum $s$ is large. In the singleton region, $\| e \| arrow.r oo$ uniformly as that minimum grows, and the inward radial component gives
  $ \| e + X \| lt.eq \| e \| - kappa \/ 2 $
  for all sufficiently large $s$. It too stays in the next region, whose shrinkage is eventually at most $kappa \/ 4$. Induction proves the support assertion at every time. At fixed $L$, the minimum $s = w^2 \/ D_0^2 = c^2 n \/ \( D_0^2 L^2 \)$ tends to infinity with $n$, so these statements are uniform over the finite horizon.
  We next prove the uniform one-step estimate
  $ c_(upright("step")) + bb(E) J_(s - 1) \( e + X \) - J_s \( e \) lt.eq frac(tau \/ 2 + eta, s) . quad "(5.14)" $ <ap:one-step>
  Here $c_(upright("step"))$ is the cost of the chosen control at the current state; the constant $c$ in $w = c sqrt(n) \/ L$ remains fixed. There are three regimes. We give their estimates explicitly, and then explain uniformity.
  ===== 5.4.1 Interior regime. <interior-regime.>
  Suppose along a sequence with $s arrow.r oo$ that $t = \| e \|^2 \/ \( D_0^2 s \)$ stays bounded away from one. The drift in (5.13) is then unclipped and tends to zero. Taylor expansion in space and in the time variable, with remainder $o \( s^(- 1) \)$, is valid uniformly on any such smaller region. Indeed the third spatial derivatives are $O \( s^(- 3 \/ 2) \)$, and the needed time and mixed derivatives have their corresponding smaller orders, while $\| X \| lt.eq B$. Using $c_(upright("step")) lt.eq \| m \|^2 \/ 2$ and $m = - nabla J_s$, the leading temporal and drift contributions, after multiplication by $s$, sum to
  $ - frac(a t, 1 - t) - frac(2 a^2 t, D_0^2 \( 1 - t \)^2) . $
  For completeness, the temporal contribution is $D_0^2 t \/ 2 + a t \/ \( 1 - t \)$; the combined drift and cost contribution is $- D_0^2 t \/ 2 - 2 a t \/ \( 1 - t \) - 2 a^2 t \/ \[ D_0^2 \( 1 - t \)^2 \]$. The quadratic noise gives $tau \/ 2 + o \( 1 \)$ by (5.10). The remaining barrier noise is at most
  $ frac(a B^2, D_0^2 \( 1 - t \)) + frac(2 a B^2 t, D_0^2 \( 1 - t \)^2) . $
  The second of these terms is absorbed by the negative term quadratic in $a$, since $a gt.eq B^2$. The first, together with $- a t \/ \( 1 - t \)$, is at most $a B^2 \/ D_0^2$, since $D_0^2 gt.eq B^2$. Consequently the limsup of the left side of (5.14) multiplied by $s$ is at most $tau \/ 2 + eta \/ 4$.
  ===== 5.4.2 Soft control near the wall. <soft-control-near-the-wall.>
  Now suppose $delta gt.eq d_0$ and $delta \/ R_s arrow.r 0$. The drift is radial and inward, and
  $ \| m \| = \( 1 + o \( 1 \) \) min { m_0 \, a \/ delta } . quad "(5.15)" $ <ap:wall-mean>
  This follows because the radial length before clipping is $\| e \| \/ s + 2 a \| e \| \/ \[ delta \( R_s + \| e \| \) \]$, whose second term is $\( 1 + o \( 1 \) \) a \/ delta$ and whose first is smaller by $O \( delta \/ sqrt(s) \)$. Define
  $ z_(*) = frac(D_0^2 + 2 e dot.op X + \| X \|^2, R_s^2 - \| e \|^2) . $
  The logarithmic part of the potential changes by
  $ a { - log \( 1 - z_(*) \) + log \( 1 - 1 \/ s \) } . $
  For large $s$, $\| z_(*) \| lt.eq 3 B \/ delta lt.eq 1 \/ 2$. The inequality $- log \( 1 - z \) lt.eq z + 2 z^2$ for $\| z \| lt.eq 1 \/ 2$ therefore gives an upper bound
  $ - \( 1 - o \( 1 \) \) frac(a \| m \|, delta) + frac(20 a B^2, delta^2) + o (frac(a \| m \|, delta)) . quad "(5.16)" $ <ap:wall-barrier>
  To see the orders here, the mean of the linear part is
  $ bb(E) z_(*) = - frac(2 \| e \|, R_s + \| e \|) frac(\| m \|, delta) + O (frac(D_0^2 + B^2, R_s delta)) \, $
  and $bb(E) z_(*)^2 lt.eq 9 B^2 \/ delta^2$ for large $s$. The displayed error in the mean is $o \( \| m \| \/ delta \)$ by (5.15) and $delta \/ R_s arrow.r 0$. We used the harmless constant 20 to absorb the second-moment bound.
  The cost is at most $\( 1 + o \( 1 \) \) a \| m \| \/ \( 2 delta \)$. The quadratic part of the potential has increment
  $ frac(\| e \|^2, 2 s \( s - 1 \)) + frac(e dot.op m, s - 1) + frac(bb(E) \| X \|^2, 2 \( s - 1 \)) . $
  Its middle term is nonpositive, and the other terms are $O \( s^(- 1) \)$, which is $o \( a \| m \| \/ delta \)$ in this regime. Finally,
  $ delta \| m \| gt.eq \( 1 - o \( 1 \) \) min { d_0 m_0 \, a } gt.eq \( 1 - o \( 1 \) \) 1024 B^2 . $
  Thus the noise term in (5.16) is strictly smaller than the remaining negative drift term. The left side of (5.14) is negative for all sufficiently large $s$ along any sequence in this regime.
  ===== 5.4.3 Singleton control near the wall. <singleton-control-near-the-wall.>
  If $delta < d_0$, the support estimate already proved gives the new wall distance $delta' gt.eq delta + kappa \/ 4$. Using $R_s^2 - \| e \|^2 = delta \( R_s + \| e \| \)$, and noting that the other radius factors tend to one uniformly, the logarithmic potential decreases by at least
  $ a log (1 + frac(kappa, 8 d_0)) $
  for sufficiently large $s$. This pays the cost $c_(upright("step")) lt.eq C_(*)$ with fixed slack by the choice of $a$. The quadratic-potential increment is $O \( s^(- 1 \/ 2) \)$ and hence cannot consume that slack. The left side of (5.14) is again negative.
  These estimates imply a uniform threshold for (5.14). Otherwise a sequence of violating states with $s arrow.r oo$ would have a subsequence on which $t$ stays away from one, or tends to one. The former contradicts the interior estimate with its strict $3 eta \/ 4$ margin. The latter has a further subsequence in one of the two wall regimes, where the left side is negative. This also proves that the threshold works for every time in a sufficiently large horizon.
  The initial value of $J_s \( - y \)$ is bounded by a constant depending only on the chosen control constants and $C_y$, not on $L$. The final value is nonnegative. Summing (5.14) and telescoping therefore bounds the expected cost by
  $ \( tau \/ 2 + eta \) sum_(r = 1)^n frac(1, r + w^2 \/ D_0^2) + O_eta \( 1 \) lt.eq \( tau \/ 2 + eta \) log (1 + frac(D_0^2 L^2, c^2)) + O_eta \( 1 \) . $
  Since the logarithm is at most $2 log L + O \( 1 \)$, this is (5.11). The factor two in this logarithmic time ratio cancels the factor $1 \/ 2$ in the one-step covariance contribution. ◻
]

=== 5.5 The contradiction and the order of limits <the-contradiction-and-the-order-of-limits>

#proof[
  Suppose the conclusion fails and choose $Q$ and $tau < 1$ as in (5.7). Choose $eta > 0$ with $tau + 2 eta < 1$. Transform the grade-sum targets in (5.2) by $Q^(1 \/ 2)$. Their norms are at most $C_y sqrt(n)$ for a fixed $C_y$, independent of $L$ and $n$. Choose $c > 0$ so that $c parallel Q^(- 1 \/ 2) parallel lt.eq 1 \/ 10$. A transformed ball of radius $c sqrt(n) \/ L$ then lies inside all three original coordinate windows. Fix the resulting constants of Lemma 29. For each $L$, Lemma 27 gives a target set $J$. Give its targets equal probabilities, so $a_j = 1 \/ \| J \|$ and $H \( a \) = log \| J \|$. The average ideal steering cost is bounded by
  $ bb(E) sum c_t lt.eq \( tau + 2 eta \) log L + K_eta . $
  Choose $L$ so large that
  $ G := log \| J \| - { \( tau + 2 eta \) log L + K_eta } > 0 \, quad "(5.17)" $ <ap:strict-gain>
  using the uniform upper bound on the expectation. Then choose a sufficiently large finite $n$ for all the control estimates and fix the complete finite control tree supplied by Lemma 29 for every target.
  For each soft node the law is the appropriate chart law and the ideal utility is $h$ at that law. Exact singleton nodes stay exact. Include all source letters as possible children of every soft node, whether or not an ideal law assigns them positive probability, and give every such child the safe continuation supplied by the controller. Thus the pathwise window property is independent of small perturbations of the soft transition probabilities.
  There are now only finitely many soft nodes. Approximate each one’s ideal law and utility by an earlier finite strong realization from the closed attainable class. The finite realization has a rational exact law, which need not lie exactly on the smooth chart. This causes no difficulty. Its actual supporting-plane cost is $ell \( q_v \) - u_v gt.eq 0$, and approaches the ideal cost as the law and utility errors tend to zero. In a finite tree, all prefix probabilities, the expected total cost, and the averaged source law depend continuously on these finitely many data. Choose the approximation errors so small that the actual expectation is at most the ideal expectation plus $G \/ 2$. No accuracy bound uniform in $n$ is needed, since this finite $n$ has already been fixed.
  Apply Lemma 28 to these finite realizations. Let $overline(alpha)$ be its exact averaged law. The supporting affine terms sum linearly, because at every time the prefix weights sum to one. Thus its limiting utility satisfies
  $ u_(upright("out")) & gt.eq frac(log \| J \|, n) + 1 / n sum_v w_v { ell \( q_v \) - c_v }\
 & = ell \( overline(alpha) \) + frac(log \| J \| - bb(E) sum_t c_t, n) gt.eq ell \( overline(alpha) \) + frac(G, 2 n) . $
  Taking the finite outer bank size sufficiently large makes its remaining type-count loss less than $G \/ \( 4 n \)$. We have therefore constructed an actual finite admissible realization whose utility exceeds $ell \( overline(alpha) \)$, contradicting the supporting-plane bound $h lt.eq ell$.
  The order of choices was: local control constants; a finite target set; a sufficiently large finite horizon and its full tree; finitely many finite approximating raw recipes; and finally a sufficiently large outer common multiple. Each approximant has finite inductive depth, so their maximum depth is finite and the new macro uses only earlier constructions. The potentially very large common multiple affects existence neither of the maps nor of the strict excess. No infinite-depth realization has been applied to a finite tensor. The contradiction proves $"Tr" \( Q_0 C \) gt.eq 1$, which is exactly (5.1). ◻
]

Write $U_gamma = U_gamma^W$ for the three-state attainable value.

#thm([Corollary 5.5.])[
  (Lower tests for the W value).  #emph[Fix $gamma gt.eq 1$. On the relative interior of the three-letter simplex, put 
$ C_W \( q \) = "diag" \( q \) - q q^top \, #h(2em) cal(L)_W = C_W \( q \) : D^2 . $

 Every $C^2$ lower test $psi$ for $U_gamma$ satisfies 
$ cal(L)_W psi lt.eq - gamma quad "(5.18)" $ <ap:w-test>

 at its contact point.]
] <cor:w-ap>

#proof[
  Use W grades $e_0 \, e_1 \, e_2$, whose means equal their law $q$. The chart is affine, its covariance is $C_W \( q \)$, and the concavity, supporting planes, and boundedness needed above hold by Proposition 18. The argument from a failed lower test again gives a quadratic drift cost and a trace $tau$. All control and target-window proofs apply because the centered grades sum to zero and span the same plane. The sole change in the utility accounting is that a direct target contributes $gamma log \| J \|$. Lemma 28 uses $lambda = gamma$, while the hard-wall cost is still $\( tau + 2 eta \) log L + O_eta \( 1 \)$. Thus a contradiction occurs if $tau < gamma$, proving (5.18). No pre-existing payload volume enters this utility. ◻
]

The following interior-maximum argument is the strict-comparison strategy of viscosity-solution theory #cite(label("crandallishiilions1992")) Section 5.C. Its short proof uses the lower-test inequalities just established.

#thm([Corollary 5.6.])[
  (Strict comparison).  #emph[Let $Omega$ be a bounded domain in the mean plane with compact closure, and let a chart $alpha$ as in Theorem 26 extend continuously to $overline(Omega)$. Suppose $f in C \( overline(Omega) \) ∩ C^2 \( Omega \)$, $f lt.eq F_beta compose alpha$ on $partial Omega$, and, for every $mu in Omega$ and every supporting supergradient $g$ there, 
$ cal(L) f \( mu \) > g dot.op cal(L) alpha \( mu \) - 1 . $

 Then $f lt.eq F_beta compose alpha$ throughout $overline(Omega)$. For the affine W chart, the analogous conclusion holds for $U_gamma$ when $cal(L)_W f > - gamma$.]
] <ap:comparison>

#proof[
  The value functions are continuous by Proposition 18. If $f - F_beta compose alpha$ has a positive maximum $c$, compactness and the boundary inequality place a maximizing point in the interior. The function $f - c$ touches the value from below there. Its derivatives equal those of $f$, contradicting Theorem 26. The W proof uses Corollary 30 in the same way. ◻
]

=== 5.6 Controlling the supporting-plane term <controlling-the-supporting-plane-term>

The lower-test inequality retains $g dot.op cal(L) alpha$ when the chart is not exactly harmonic. Although the supporting supergradient is unknown, concavity and a uniform value bound control this term. The certificate will apply the following estimate where every chart coordinate has a positive lower bound.

#thm([Lemma 5.7.])[
  (Supporting-plane chart error).  #emph[Suppose $0 lt.eq h lt.eq K$ is a concave value on the full source simplex, $alpha$ is an interior law, and $g$ is a supporting supergradient there. For a probability-law chart through $alpha$, 
$ \| g dot.op cal(L) alpha \| lt.eq K max_i frac(\| cal(L) alpha_i \|, alpha_i) . $

 In particular, if $alpha_i gt.eq m > 0$ and $parallel cal(L) alpha parallel_oo lt.eq epsilon$, the right side is at most $K epsilon \/ m$.]
] <ap:chart-error>

#proof[
  Add a multiple of the all-ones vector to $g$ so that $g dot.op alpha = h \( alpha \)$. This leaves its supergradient inequality on the simplex unchanged, and does not change $g dot.op cal(L) alpha$ because $sum_i alpha_i = 1$. The resulting supporting plane is $q mapsto g dot.op q$. Evaluating it at simplex vertices and using $h gt.eq 0$ gives $g_i gt.eq 0$. Therefore
  $ \| g dot.op cal(L) alpha \| lt.eq sum_i g_i \| cal(L) alpha_i \| lt.eq (max_i frac(\| cal(L) alpha_i \|, alpha_i)) sum_i alpha_i g_i lt.eq K max_i frac(\| cal(L) alpha_i \|, alpha_i) . $
  ◻
]

== 6 The three-state boundary seed <cert:w-seed-section>

Proposition 25 bounds the six-state value on a five-component face by a three-state value and an explicit conditional entropy. We now construct the three-state lower bound needed for that estimate. Binary separation gives an entropy baseline throughout the simplex. A finite family of completion and parity constructions improves this baseline on a closed curve in its interior. The lower-test inequality then carries that improvement inside the curve.

Throughout this section put

$ gamma_0 = 300000 / 225925 = 3 / 2.25925 \, #h(2em) U \( q \) = U_(gamma_0) \( q \) \, #h(2em) "en" \( t \) = - t log t \, $

where $"en" \( 0 \) = 0$. As in the definition of the W value, its score is $gamma_0 \( D - A \) + M$, and $M$ excludes the volume of any payload already inside a coarse component. All decimals specifying coefficients or thresholds below denote exact rational numbers.

=== 6.1 The affine chart and the baseline <the-affine-chart-and-the-baseline>

For $q = \( q_0 \, q_1 \, q_2 \)$ in the probability simplex, set

$ z = frac(3 q_0 - 1, 2) + frac(upright(i) sqrt(3), 2) \( q_2 - q_1 \) \, #h(2em) q_i = frac(1 + 2 "Re" \( zeta^i z \), 3) \, #h(2em) zeta = e^(2 pi upright(i) \/ 3) . quad "(6.1)" $ <cert:w-coordinate>

The three deterministic laws correspond to $1 \, zeta^2 \, zeta$. If $Z$ takes these values with probabilities $q_0 \, q_1 \, q_2$, respectively, then $bb(E) Z = z$, $bb(E) Z^2 = macron(z)$, and $bb(E) \| Z \|^2 = 1$. Thus the full covariance contraction, with $partial_z = \( partial_x - upright(i) partial_y \) \/ 2$, is

$ cal(L)_W = \( macron(z) - z^2 \) partial_z^2 + 2 \( 1 - z macron(z) \) partial_z partial_(macron(z)) + \( z - macron(z)^2 \) partial_(macron(z))^2 . quad "(6.2)" $ <cert:w-operator>

There is no factor $1 \/ 2$ in this formula. Equivalently, in affine simplex coordinates it is $\( "diag" \( q \) - q q^(sans(T)) \) : D^2$.

Define

$ F_0 \( q \) = \( gamma_0 - 1 \) sum_(i = 0)^2 "en" \( q_i \) + \( 2 - gamma_0 \) sum_(i = 0)^2 "en" \( 1 - q_i \) . quad "(6.3)" $ <cert:w-baseline>

Since $"en"'' \( t \) = - 1 \/ t$, the diagonal covariance entries give

$ cal(L)_W sum_i "en" \( q_i \) = - sum_i \( 1 - q_i \) = - 2 \, #h(2em) cal(L)_W sum_i "en" \( 1 - q_i \) = - sum_i q_i = - 1 . $

Consequently $cal(L)_W F_0 = - gamma_0$. On each edge the two entropy sums coincide with the binary entropy. Lemma 7 achieves that entropy by binary separation, with $D - A$ tending to zero. Both coefficients in (6.3) are positive. Hence, for $0 < delta < 1$, $\( 1 - delta \) F_0 lt.eq U$ on the boundary and $cal(L)_W \( \( 1 - delta \) F_0 \) > - gamma_0$ in the interior. The comparison consequence of Corollary 30 and continuity of the values prove, upon letting $delta$ decrease to zero, that

$ U \( q \) gt.eq F_0 \( q \) quad upright("on the whole simplex") . quad "(6.4)" $ <cert:w-baseline-bound>

=== 6.2 A polynomial improvement and its domain <a-polynomial-improvement-and-its-domain>

Let

$ rho \( theta \) & = sum_(k = 0)^4 c_k cos \( 3 k theta \) \, #h(2em) Omega_W = { r e^(upright(i) theta) : 0 lt.eq r lt.eq rho \( theta \) } \,\
\( c_0 \, c_1 \, c_2 \, c_3 \, c_4 \) & = \( .28309034 \, - .05388682 \, .00841589 \, .00450821 \, - .00680398 \) . quad "(6.5)" $ <cert:w-shell>

Here and below inequalities on this compact set include its boundary; comparison is applied to its open interior. The proposed improvement is a real polynomial $H_W$. Its exact specification is short despite its degree. Put

$ \( s_0 \, s_1 \, s_2 \, s_3 \) & = \( .0152567903 \, .0002597033 \, - .0014351728 \, - .0017937434 \) \,\
\( s_4 \, s_5 \, s_6 \) & = \( - .0008593989 \, - .0002090472 \, - .0000227468 \) . $

Set $a_(3 k \, 0) = s_k \/ \( .32 \)^(3 k)$ for $0 lt.eq k lt.eq 6$. All other pure coefficients $a_(j \, 0) \, a_(0 \, j)$ are zero, except the already assigned $a_(0 \, 0)$. For $d = 0 \, dots.h \, 110$, and $i + j = d$, define

$ a_(i + 1 \, j + 1) = frac(d \( d - 1 \) a_(i j) - \( i + 2 \) \( i + 1 \) a_(i + 2 \, j - 1) - \( j + 2 \) \( j + 1 \) a_(i - 1 \, j + 2), 2 \( i + 1 \) \( j + 1 \)) . quad "(6.6)" $ <cert:w-recurrence>

A negative index denotes a zero coefficient. Every coefficient on the right has degree at most $d + 1$, so this is a finite rational recursion. Finally set

$ H_W \( z \) = "Re" sum_(i + j lt.eq 112) a_(i j) z^i macron(z)^j . quad "(6.7)" $ <cert:w-polynomial>

Here are explicit bounds on this polynomial; their verification uses only rational arithmetic. Put $R_W = .357$, and, for $k = 0 \, 1 \, 2$, put

$ S_k = sum_(i + j gt.eq k) \| a_(i j) \| \( i + j \) \( i + j - 1 \) dots.h.c \( i + j - k + 1 \) R_W^(i + j - k) \, $

where the empty product is one. The recursion gives

$ S_0 < .058178 \, #h(2em) S_1 < 1.490164 \, #h(2em) S_2 < 53.686778 . quad "(6.8)" $ <cert:w-norms>

For clarity, a finite procedure for checking the residual is as follows. For each $a_(i j)$, add its four contributions

$ upright("monomial") & upright("coefficient")\
z^i macron(z)^j & - \( i + j \) \( i + j - 1 \) a_(i j)\
z^(i - 2) macron(z)^(j + 1) & i \( i - 1 \) a_(i j)\
z^(i + 1) macron(z)^(j - 2) & j \( j - 1 \) a_(i j)\
z^(i - 1) macron(z)^(j - 1) & 2 i j a_(i j) $

and omit negative exponents. Call the resulting coefficients $b_(i j)$. Equation (6.6) makes $b_(i j) = 0$ for $i + j lt.eq 110$, exactly. The remaining rational sum satisfies

$ sum_(i \, j) \| b_(i j) \| R_W^(i + j) < 6.739223 dot.op 10^(- 13) < 7 dot.op 10^(- 13) . quad "(6.9)" $ <cert:w-residual>

This proves $\| cal(L)_W H_W \| < 7 dot.op 10^(- 13)$ on $\| z \| lt.eq R_W$.

The geometry of the shell has similarly direct bounds. Write

$ r_(*) = sum_k \| c_k \| = .35670524 \, quad r_1 = sum_k 3 k \| c_k \| = .33437745 \, quad r_2 = sum_k \( 3 k \)^2 \| c_k \| = 2.13289155 . $

The lower triangle inequality gives $rho gt.eq .20947544 > .2$, whereas $rho lt.eq r_(*) < .357$. Formula (6.1) therefore implies $q_i > .095$ throughout $Omega_W$. For $z \( theta \) = rho \( theta \) e^(upright(i) theta)$,

$ \| z' \| lt.eq r_(*) + r_1 = .69108269 \, #h(2em) \| z'' \| lt.eq r_(*) + 2 r_1 + r_2 = 3.15835169 < 3.16 \, #h(2em) \| q''_i \| < 2.11 . quad "(6.10)" $ <cert:w-curve-derivatives>

Differentiating each monomial in (6.7) gives $\| \( H_W compose z \)'' \| lt.eq S_2 \| z' \|^2 + S_1 \| z'' \| < 30.348$. One can also verify the needed baseline bound without cancellation. For a single summand $f \( t \) = \( gamma_0 - 1 \) "en" \( t \) + \( 2 - gamma_0 \) "en" \( 1 - t \)$, on $.095 < t < .572$ we have $\| f' \( t \) \| < 2.5$ and $\| f'' \( t \) \| < 5.1$. These follow, for example, from $1.32 < gamma_0 < 1.33$, $- log \( .095 \) < 2.4$, and $- log \( .428 \) < .9$. Using $\| q'_i \| lt.eq 2 \| z' \| \/ 3$ and $\| q''_i \| lt.eq 2 \| z'' \| \/ 3$ gives

$ lr(|frac(d^2, d theta^2) #scale(x: 120%, y: 120%)[\(] F_0 \( q \( theta \) \) + H_W \( z \( theta \) \) #scale(x: 120%, y: 120%)[\)]|) < 49.387 < 68 . quad "(6.11)" $ <cert:w-curvature>

The slightly larger bound 68 will be used in interpolation.

=== 6.3 What is certified by the finite library <what-is-certified-by-the-finite-library>

We next describe the mathematical objects in the library. A record fixes a finite tree of completion, parity, binary-separation, and side-permutation operations, with rational conditional distributions on its branches. Proposition 15 compiles this hierarchy into a family of finite realizations using growing exact-type populations and efficient GROUP parameters, preserving arbitrary payloads and the canonical bank convention. The #emph[utility of a record] is the limiting attainable score of this family. Every positive accuracy is achieved with finite supplies, so the record gives a lower bound on the closed value $U$. The arithmetic below evaluates these laws and limiting utilities; the final strict excess over $log 3$ will later select an actual finite realization.

Here is an explicit description of its word groups, which is also useful for checking the library independently. Number the W labels $0 \, 1 \, 2$ and define the partial completion map

$ c \( 0 \, 0 \) = 0 \, quad c \( 0 \, 1 \) = c \( 1 \, 0 \) = c \( 1 \, 1 \) = 1 \, quad c \( 0 \, 2 \) = c \( 2 \, 0 \) = c \( 2 \, 2 \) = 2 \; $

the pairs $\( 1 \, 2 \)$ and $\( 2 \, 1 \)$ are discarded. A two-position completion has outer label $c \( i \, j \)$. A three-position completion has outer label $c \( c \( i \, j \) - k med \( mod med 3 \) \, r \)$, where $k in { 0 \, 1 \, 2 }$; an undefined intermediate label discards the word. Its inner label is deterministic. Independent permutations of the three labels are allowed in the two or three positions. These are precisely finite compositions of the completion restriction. For parity on three positions discard the six words with all labels different. A retained word has a majority label and an odd-count label; on a constant word both equal its sole label. Either label can be the outer label and the other the inner label. A nonconstant outer/inner group has three words and a constant group has one. This is the parity restriction proved earlier, followed by two W separations.

Suppose the block length is $L in { 2 \, 3 }$. Let $t_i$ be the outer law, $v_(i j)$ the inner law conditional on $i$, and $C_(i j)$ the law of the retained words in that group. Let $n \( w \)$ count the original canonical source labels, obtained by undoing each positional reindexing. The intermediate cyclic rotation changes only the completed-block flag and fiber membership, not these source labels. If the child constructions have limiting utilities $u_t \, u_(v_i)$, the original law and limiting utility are given exactly by

$ q_(upright("out")) & = 1 / L sum_(i \, j) t_i v_(i j) bb(E)_(C_(i j)) n \( w \) \,\
u_(upright("out")) & = 1 / L (u_t + sum_i t_i u_(v_i) + sum_(i \, j) t_i v_(i j) H \( C_(i j) \)) . quad "(6.12)" $ <cert:w-law-assembly>

For completion the inner utility is zero. The last term is supplied by Proposition 15: once the outer label is direct, resolve the gate refinements in the order of Lemma 14, using each gate’s own pair of knowing sides. The flattened final word need not be readable by one fixed pair. Exact conditional types fix the populations and canonical histograms of every pool, including under the positional permutations, and the entropy chain rule counts the remaining word law once. For parity, after its two labels are direct, the remaining choice is the primitive three-word group of Lemma 12. These are precisely the hypotheses behind the last term of (6.12). Each auxiliary separation has $D - A arrow.r 0$; hence the limiting utilities of these pure completion/parity records satisfy $u = M lt.eq H \( q \) lt.eq log 3$.

The following finite menu protocol specifies the candidates used in the arithmetic check. Its deterministic integer implementation is #raw("menu.hpp") in the accompanying certificate sources.

+ For weights $d = \( i \/ 64 \, j \/ 64 \, 1 \)$ with $0 lt.eq i lt.eq j lt.eq 64$, the terminal operation deletes a least-weight label and separates the remaining two, with probabilities proportional to their weights, rounded as specified below. The zero pair uses the deterministic record.
+ The initial record repeats two-position completion twelve times, placing a maximum-weight label first at each step, and ends with this terminal operation. Positive integer weights are renormalized at each recursive call, with a lower bound of one integer unit.
+ Fourteen improvement layers may retain an earlier record or assemble earlier records using two-position completion, three-position completion, or either order of the parity labels above. All positional permutations and the three intermediate cyclic offsets are available. A child call also permits terminal binary separation. Candidate comparison uses $u + sum_i q_i log d_i$; lookup examines the nearby indices within two of the nearest $64 d_i \/ max d$ after sorting the weights, and all compatible side permutations. The outer weights in parity may themselves be chosen from the rounded exponentials of such child scores.
+ Each conditional word receives a positive integer weight equal to the rounded product of its positional weights, clamped below by one. The cumulative normalization in (6.13) fixes its #emph[exact] conditional law. Append all six side permutations of the selected final records and the three deterministic records.

The preliminary scores that select operation types, the integer roots or exponentials used as search weights, and ties in selection have no mathematical accuracy requirement: they only choose among the explicitly admissible finite trees just described. In particular, a computed score is never used as the utility of a record. Utilities and laws are evaluated anew by (6.12)–(6.12). The supplied finite program fixes all these selection choices, including ties; the certificate verifies feasible mixtures of its resulting records. Neither global optimization of the records nor optimality of a mixture is needed for the lower bound.

=== 6.4 Arithmetic errors and exact distributions <arithmetic-errors-and-exact-distributions>

Let $B = 2^52$. For positive integer word weights $w_1 \, dots.h \, w_m$ set

$ p_j = 1 / B (⌊frac(B sum_(k lt.eq j) w_k, sum_k w_k)⌋ - ⌊frac(B sum_(k < j) w_k, sum_k w_k)⌋) . quad "(6.13)" $ <cert:w-cumulative>

These probabilities are nonnegative and telescope to one. Zero-probability words are omitted. This formula, not an unrounded idealized weight law, defines every conditional distribution used by a record.

The evaluator represents a real number by an integer divided by $B$. Multiplication and division truncate toward zero, and an input constant $x$ is stored as $floor.l B x + 1 \/ 2 floor.r$. Logs are evaluated by reducing the argument to $x in \[ 1 \, 2 \]$ with powers of two and using

$ log x = 2 sum_(j = 0)^39 frac(t^(2 j + 1), 2 j + 1) + epsilon \( x \) \, #h(2em) t = frac(x - 1, x + 1) \, #h(2em) 0 lt.eq epsilon \( x \) lt.eq frac(2 thin 3^(- 81), 81 \( 1 - 1 \/ 9 \)) . quad "(6.14)" $ <cert:w-log-evaluation>

Since $\| t \| lt.eq 1 \/ 3$, summing the geometric propagation of rounding errors in Horner evaluation gives an error below $7 \/ B$ on $\[ 1 \, 2 \]$. For a probability represented at scale $B$, reduction uses at most 52 doublings. Keeping the factor $p_j$ in $- p_j log p_j$, rather than bounding all reduced-log errors by their worst case separately, gives entropy error less than $400 \/ B$ for any conditional word distribution here (which has at most 27 words). For example, $sum_j p_j \| h_j \| lt.eq 1 + H \( p \) \/ log 2 lt.eq 1 + log_2 27$, where $h_j$ is the reduction exponent; the log errors and the at most 27 final product roundings are already less than $100 \/ B$. The allowance $400 \/ B$ includes the other normalization and evaluation roundings.

Let $e_r^(upright("init"))$ be the $ell^1$ error between the exact law of a record and its stored law after $r$ initial completion steps, and let $f_r^(upright("init"))$ be its utility error. The terminal binary law is exact at scale $B$, with utility error at most $400 \/ B$. In a completion, averaging normalized count vectors contracts the child-law error. There are three groups; rounding the count averages and restoring the missing mass to the first coordinate contributes less than $15 \/ B$. The outer child utility is divided by two. Perturbing its weights in the conditional entropy term contributes at most $2 e_r^(upright("init"))$, and the local entropy and arithmetic errors contribute less than $250 \/ B$. Thus

$ e_r^(upright("init")) lt.eq frac(15 r, B) \, #h(2em) f_r^(upright("init")) lt.eq 1 / 2 f_(r - 1)^(upright("init")) + 2 e_r^(upright("init")) + 250 / B . quad "(6.15)" $ <cert:w-initial-errors>

At $r = 12$ these give $e_0 lt.eq 180 \/ B$ and $f_0 lt.eq 1700 \/ B$ for the improvement layers. (The displayed initial recurrence actually gives $f_12^(upright("init")) lt.eq 1159.991 \/ B$.)

For an improvement layer let $e_h \, f_h$ be uniform errors over its records. A parity assembly combines at most an outer law and an inner law, so their errors total at most $2 e_(h - 1)$. There are at most nine groups. The sum of product and count roundings leaves fewer than 21 missing probability units before restoration; adding that mass to one coordinate costs less than $42 \/ B$ in $ell^1$. The two child utility contributions are divided by three, giving coefficient $2 \/ 3$; completion has the smaller coefficient $1 \/ 2$. Inner utilities are at most $log 3$, and the conditional word entropy is at most $log 27$. Applying these bounds to (6.12), with the just obtained law-error allowance, gives the conservative recurrence

$ e_h lt.eq 2 e_(h - 1) + 42 / B \, #h(2em) f_h lt.eq 2 / 3 f_(h - 1) + 3 e_h + 250 / B . quad "(6.16)" $ <cert:w-layer-errors>

To see that the last fixed allowance is sufficient, the entropy errors contribute at most $400 \/ \( L B \) lt.eq 200 \/ B$; the at most nine group-weight products, their utility products, the three inner-utility products, and the final division contribute less than $50 \/ B$ after normalization. For parity, each conditional group actually has at most three words, so the weight-perturbation estimate in (6.16) has additional slack. Retaining a record from an earlier layer preserves these bounds. At $h = 14$ they give

$ e_14 lt.eq 3637206 / B < 8.5 dot.op 10^(- 10) \, #h(2em) f_14 < 3.635 dot.op 10^(- 9) < 10^(- 8) . quad "(6.17)" $ <cert:w-library-errors>

#thm([Lemma 6.1.])[
  (Correction to an exact target law).  #emph[Let $q$ be a strictly positive probability vector, let $K gt.eq 0$, and suppose a construction has law $hat(q)$ and attainable utility $u lt.eq K$. Then the closed attainable value satisfies 
$ U \( q \) gt.eq u - K max_i \( hat(q)_i - q_i \)_(+) \/ q_i . $

 For rational laws, the correction is realized by finite rational time-sharing; for arbitrary real $q$, the assertion concerns the defining closure.]
] <cert:w-correction>

#proof[
  Apply Remark 20 to the $W$ value with target law $q$, old law $hat(q)$, and score bound $K$. Its singleton mixture gives the stated loss. Rational approximation and closure permit real mixture proportions. ◻
]

For mixture evaluation, project the stored first two coordinates and utility down to scale $2^30$. A feasible triple of projected library points determines nonnegative barycentric weights by exact determinant ratios. Applying those same weights to the true records gives a genuine attainable law $hat(q)$. The singleton points are in the library, so every projected simplex target admits a feasible triple. The implementation’s pivot search is used only to locate a triple with a sufficient utility; feasibility is verified by its nonnegative determinant ratios.

The difference between two floor remainders in a first or second coordinate is less than $2^(- 30)$; the third coordinate is their complement. Combining this with (6.17) gives $\| hat(q)_i - q_i \| < 2.8 dot.op 10^(- 9)$, including the much smaller error in a shell target’s trigonometric evaluation. We may cap the utility claimed for a mixture at $K = 1.5$. Lemma 33 then bounds its correction loss on the shell by $1.5 \( 2.8 dot.op 10^(- 9) \) \/ .095$. Adding the library utility and projection errors proves the following bounds, also recording the grid bound needed later:

table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Absolute error allowance
]),
  table.cell(rowspan: 1, colspan: 1)[True library law versus stored law, $ell^1$
], table.cell(rowspan: 1, colspan: 1)[$8.5 dot.op 10^(- 10)$
],
  table.cell(rowspan: 1, colspan: 1)[True library utility versus stored utility
], table.cell(rowspan: 1, colspan: 1)[$10^(- 8)$
],
  table.cell(rowspan: 1, colspan: 1)[Mixture versus target, each coordinate
], table.cell(rowspan: 1, colspan: 1)[$2.8 dot.op 10^(- 9)$
],
  table.cell(rowspan: 1, colspan: 1)[Mixture evaluation and correction, $q_i > .095$
], table.cell(rowspan: 1, colspan: 1)[$.07 dot.op 10^(- 6)$
],
  table.cell(rowspan: 1, colspan: 1)[Mixture evaluation and correction, $q_i > .03$
], table.cell(rowspan: 1, colspan: 1)[$.16 dot.op 10^(- 6)$
],
  table.cell(rowspan: 1, colspan: 1)[$H_W$ at a shell sample
], table.cell(rowspan: 1, colspan: 1)[$10^(- 9)$
],
  table.cell(rowspan: 1, colspan: 1)[$F_0$ at an exact stored law
], table.cell(rowspan: 1, colspan: 1)[$10^(- 11)$
],
)

The last two bounds can be checked directly as follows. Store the scaled polynomial coefficients $a_(i j) R_W^(i + j)$, evaluate in polar coordinates with $r \/ R_W < 1$, and sum the finitely many roundings. There are 6441 monomials, degree at most 112, and (6.8) bounds the effects of coordinate error. For cosine, reduce the angle to $\[ 0 \, pi \]$ and use its degree-48 Taylor polynomial in Horner form. Its Taylor remainder and propagated fixed-point errors total less than $300 \/ B$. Coefficient rounding, at most 112 radial multiplications, and the two products per monomial give an error well below $10^(- 9)$, including this trigonometric error. Applying (6.14) to the six entropy terms in (6.3) gives the stated $10^(- 11)$ allowance.

=== 6.5 The finite checks and the continuum conclusion <the-finite-checks-and-the-continuum-conclusion>

The finite shell check uses

$ theta_l = frac(l pi, 6480) \, #h(2em) 0 lt.eq l lt.eq 2160 . quad "(6.18)" $ <cert:w-samples>

At each angle it forms $r = rho \( theta_l \)$ and the target law by (6.1), evaluates a feasible library mixture as above, and subtracts the stored values of $F_0$ and $H_W$. Thus the finite statement to check is a collection of 2161 integer inequalities: if $g_l$ is the resulting gap in units of $B^(- 1)$, then

$ min_l g_l = - 4180063084 \, #h(2em) 10^6 g_l > - 5 B quad \( 0 lt.eq l lt.eq 2160 \) . quad "(6.19)" $ <cert:w-finite-check>

In particular the recorded minimum is exactly $- 4180063084 \/ 2^52$ in utility units, approximately $- 0.928160457 dot.op 10^(- 6)$. This finite arithmetic result is reproducible from the coefficient and menu specifications above and the supplied integer checker. Its mathematical meaning is a lower bound from feasible constructions, with the proved error allowances; it is not a claim that the numerical candidate is an optimizer. Using the conservative threshold $- 5 dot.op 10^(- 6)$ in (6.19), subtracting the preceding evaluation and exact-law correction allowances, and transporting from rounded targets to exact sample targets gives

$ U \( q \( theta_l \) \) - F_0 \( q \( theta_l \) \) - H_W \( z \( theta_l \) \) > - 5.2 dot.op 10^(- 6) . quad "(6.20)" $ <cert:w-sample-bound>

It remains to fill the intervals between these samples; no sampling assumption is made here. If a twice differentiable scalar function has $\| f'' \| lt.eq M$ on an interval of length $h$, its difference from its linear interpolant is at most $M h^2 \/ 8$. Mix the two sample constructions with their linear interpolation weights. Their law is the chord between the two sample laws. By (6.10), each coordinate differs from the desired curved law by at most $2.11 h^2 \/ 8$. Correct this discrepancy using Lemma 33; since $q_i > .095$, the utility loss is at most $1.5 \( 2.11 \/ .095 \) h^2 \/ 8$. The interpolation error of $F_0 + H_W$ is at most $68 h^2 \/ 8$ by (6.11). With $h = pi \/ 6480$ their total is

$ (68 + frac(1.5 dot.op 2.11, .095)) h^2 / 8 < 2.977 dot.op 10^(- 6) < 3.1 dot.op 10^(- 6) . quad "(6.21)" $ <cert:w-interpolation>

Both the shell and the polynomial are invariant under rotation by $2 pi \/ 3$ and conjugation: the recurrence preserves $i - j equiv 0 med \( mod med 3 \)$ and has real coefficients. The value is invariant under label permutations. These symmetries extend the interval $\[ 0 \, pi \/ 3 \]$ to the entire boundary.

#thm([Proposition 6.2.])[
  (Certified W seed).  #emph[With the preceding exact coefficients and domain, 
$ U \( q \) gt.eq F_0 \( q \) + H_W \( z \) - 9 dot.op 10^(- 6) quad \( z in partial Omega_W \) \, $

 and 
$ U \( q \) gt.eq F_0 \( q \) + H_W \( z \) - 22 dot.op 10^(- 6) quad \( z in Omega_W \) . quad "(6.22)" $ <cert:w-interior-seed>

]
] <cert:w-seed>

#proof[
  Equations (6.20) and (6.21) give the boundary assertion, with room to spare. Put
  $ f = \( 1 - 10^(- 10) \) F_0 + H_W - 21 dot.op 10^(- 6) . $
  Since $F_0 gt.eq 0$, this is below the boundary lower bound. Furthermore
  $ cal(L)_W f gt.eq - gamma_0 + 10^(- 10) gamma_0 - 7 dot.op 10^(- 13) > - gamma_0 . $
  If $f - U$ had a positive maximum in the interior, subtracting that maximum from $f$ would produce a smooth lower test for $U$, contrary to Corollary 30. Therefore $U gt.eq f$ inside. Finally $F_0 < 2$, so the loss $10^(- 10) F_0$ is absorbed by the remaining $10^(- 6)$ in (6.22). ◻
]

At the target exponent $beta = 1129 \/ 500$, we have $3 \/ beta > gamma_0$. Proposition 22 therefore transfers both the baseline and the seed to $U_(3 \/ beta)$. Together with Proposition 25, this is the promised attainable lower bound on the five-component face.

== 7 A rational certificate for the comparison bound <cert:section>

We now construct a smooth family of six-component laws and a polynomial that lies below the attainable value on its boundary. The polynomial has slightly more curvature than the lower-test inequality permits at an interior contact point. This forces it below the attainable value throughout the family. Its value at the center is strictly greater than $log 3$.

There are two numerical difficulties. First, the chart is only approximately harmonic, so we must retain the supporting-covector term in Theorem 26. Second, a finite list of point evaluations does not prove a differential or boundary inequality on a continuous region. We address the first by moving the boundary slightly into the positive simplex, and the second by coefficient majorants, polynomial interval bounds, and interpolation of actual attainable constructions. All decimal constants in this section that define polynomials or arithmetic thresholds denote exact rational numbers.

#thm([Theorem 7.1.])[
  (The certificate bound).  #emph[Let $beta = 1129 \/ 500$. The construction class defining $F_beta$ satisfies 
$ F_beta \( alpha_(*) \) med gt.eq med 1.098619383270680538 med > med log 3 \, $

 where $alpha_(*) = \( p \, p \, p \, 1 \/ 3 - p \, 1 \/ 3 - p \, 1 \/ 3 - p \)$ and 
$ p = 2^(- 500) ⌊2^500 18623 / 100000 + 1 / 2⌋ . $

]
] <thm:certificate>

The proof occupies this section. The finite checks are specified together with analytic bounds that turn their integer conclusions into uniform inequalities. Section 16 gives the implementation and reproduction interface. In particular, the computations used below are finite certificate verifications; they do not presume convergence of a numerical optimizer or of an infinite harmonic series.

=== 7.1 The chart and its exact coefficients <cert:chart>

Put $zeta = exp \( 2 pi i \/ 3 \)$ and $R = 31 \/ 25$. For a real polynomial $P$ on the complex plane define, with subscripts modulo three,

$ r_i \( z \) = frac(1 + Re \( zeta^i z \), 3) \, #h(2em) p_i \( z \) = P \( zeta^i z \) \, #h(2em) E_i \( z \) = r_i \( z \) + p_i \( z \) - p_(i + 1) \( z \) - p_(i + 2) \( z \) . quad "(7.1)" $ <cert:law>

Their six-coordinate sum is one. In the six-state support, their mean satisfies $mu_i = 1 - r_i$. Thus

$ z = 3 r_0 - 1 + i sqrt(3) \( r_2 - r_1 \) $

is an invertible affine coordinate on the mean plane. Whenever all six coordinates are positive, (7.1) is a chart to which Theorem 26 applies.

#thm([Lemma 7.2.])[
  (Complex covariance normalization).  #emph[For $alpha = \( p_0 \, p_1 \, p_2 \, E_0 \, E_1 \, E_2 \)$, set 
$ r_i = 1 - mu_i \, #h(2em) z = x + i y = 3 r_0 - 1 + i sqrt(3) \( r_2 - r_1 \) \, #h(2em) D_i = r_i \( 1 - r_i \) + 2 p_i . $

 Then $D_i = "Var" \( g_i \)$. In the $\( x \, y \)$ coordinates the covariance contraction has matrix 
$ C = mat(delim: "(", 9 D_0, 3 sqrt(3) \( D_1 - D_2 \); 3 sqrt(3) \( D_1 - D_2 \), - 3 D_0 + 6 D_1 + 6 D_2) . W r i t i n g d = frac(D_0 + D_1 + D_2, 3) \, #h(2em) f = frac(D_0 + zeta D_1 + zeta^2 D_2, 3) \, t h e o p e r a t o r i s cal(L) u = 36 #scale(x: 120%, y: 120%)[\(] d thin u_(z macron(z)) + f thin u_(z z) + macron(f) thin u_(macron(z) macron(z)) #scale(x: 120%, y: 120%)[\)] . quad "(7.2)" $ <cert:operator>

]
] <ap:covariance>

#proof[
  Since $g_i$ takes values zero, one, and two, with probability $p_i$ of the last, $bb(E) g_i^2 = mu_i + 2 p_i$. Hence $"Var" \( g_i \) = mu_i \( 1 - mu_i \) + 2 p_i = D_i$. For the centered grade $xi = g - mu$, the sum of the three coordinates is zero, so
  $ bb(E) xi_i xi_j = frac(D_k - D_i - D_j, 2) quad \( { i \, j \, k } = { 0 \, 1 \, 2 } \) . $
  The induced coordinate increment is $Delta z = - 3 xi_0 + i sqrt(3) \( xi_1 - xi_2 \)$. Substitution gives (7.2), and consequently
  $ bb(E) \| Delta z \|^2 = 18 d \, #h(2em) bb(E) \( Delta z \)^2 = 36 f . $
  For Wirtinger derivatives $partial_z = \( partial_x - i partial_y \) \/ 2$ and $partial_(macron(z)) = \( partial_x + i partial_y \) \/ 2$, a directional derivative is $Delta z thin partial_z + Delta macron(z) thin partial_(macron(z))$. Squaring it and taking expectations proves (7.2). In particular the coefficient 36 belongs to the full contraction used in Theorem 26; it is not the generator divided by two. ◻
]

Here is a finite rational definition of $P$. For integers $N gt.eq 8$ and $b gt.eq 1$, put $Q = 2^b$ and $"rnd" \( t \) = floor.l t + 1 \/ 2 floor.r$. Let

$ \( Z_0 \, dots.h \, Z_7 \) = \( 18623 \, - 2696 \, - 2677 \, 194 \, 393 \, 17 \, 1 \, 8 \) \, #h(2em) Z_k = 0 med \( k gt.eq 8 \) . $

We define symmetric integers $A_(i j) = A_(j i)$ for $i + j lt.eq N$. The pure coefficients are

$ A_(0 k) = A_(k 0) = "rnd" \( Q Z_k \/ 100000 \) . $

Let $c_00 = 8$, $c_10 = c_01 = 2$, $c_20 = c_02 = - 1$, and $c_11 = - 2$, with every other $c_(i j)$ zero; after computing $A_(i j)$ set $C_(i j) = 72 A_(i j) + Q c_(i j)$. For $1 lt.eq i lt.eq j$, in increasing total degree, form the following sum. For $0 lt.eq x < i$, $0 lt.eq y < j$, $\( x \, y \) eq.not \( 0 \, 0 \)$, put

$ h = 1 + y - x med \( mod med 3 \) \, quad h in { 0 \, 1 \, 2 } \, #h(2em) a = i - x - 1 + h \, quad c = j - y + 1 - h \, $

and set

$ w_0 \( a \, c \) = c \( c - 1 \) \, #h(2em) w_1 \( a \, c \) = a c \, #h(2em) w_2 \( a \, c \) = a \( a - 1 \) . $

Then define

$ S_(i j) = sum_(0 lt.eq x < i \, med 0 lt.eq y < j\
\( x \, y \) eq.not \( 0 \, 0 \)) C_(x y) A_(a \, c) w_h \( a \, c \) \, #h(2em) A_(i j) = "rnd" (- frac(S_(i j), C_00 i j)) \, #h(2em) A_(j i) = A_(i j) . quad "(7.3)" $ <cert:chart-rec>

The indices $a \, c$ are nonnegative, and both $a + c$ and $x + y$ are smaller than $i + j$. Thus (7.3) is a definition by finite recursion. For both choices used here, $21 < C_00 \/ Q < 22$, so its denominator is positive. Finally put

$ P_(N \, b) \( z \) = 2^(- b) sum_(i + j lt.eq N) A_(i j) z^i macron(z)^j \, #h(2em) P = P_(780 \, 500) \, #h(2em) P^(upright("ref")) = P_(420 \, 224) . quad "(7.4)" $ <cert:P>

The chart used in the proof is defined by $P$. The smaller polynomial $P^(upright("ref"))$ makes the finite evaluations less expensive; uniform bounds on its difference from $P$ will transfer those evaluations to the chart. The symmetry of the coefficients makes these polynomials real-valued and invariant under conjugation. Rotation permutes the three functions $p_i$; it need not fix $P$ itself.

=== 7.2 Uniform residual and polynomial comparisons <cert:residual>

The reason for the recursion is most transparent at the coefficient level. For the chart $P_(N \, b)$ form

$ cal(C) \( z \, macron(z) \) = sum_(i \, j) \( C_(i j) \/ Q \) z^i macron(z)^j = 36 #scale(x: 120%, y: 120%)[\[] r_0 \( 1 - r_0 \) + 2 P_(N \, b) #scale(x: 120%, y: 120%)[\]] . $

Write $cal(C)^(\[ s \])$ for the terms whose exponent difference is $s$ modulo three. Then

$ cal(L) = cal(C)^(\[ 0 \]) partial_z partial_(macron(z)) + cal(C)^(\[ 2 \]) partial_z^2 + cal(C)^(\[ 1 \]) partial_(macron(z))^2 . $

The coefficient of $z^(i - 1) macron(z)^(j - 1)$ in $cal(L) P_(N \, b)$ is

$ frac(C_00 i j A_(i j) + S_(i j), Q^2) . $

Indeed, the three second derivatives give exactly the shifts and factors in (7.3). A term outside $x < i$, $y < j$ has zero derivative factor. Every other coefficient on the right has already been computed. Nearest rounding therefore leaves a defect of absolute value at most $C_00 i j \/ \( 2 Q^2 \) < 36 i j \/ Q$. Reflection handles $i > j$.

For any polynomial $F = sum f_(i j) z^i macron(z)^j$, the elementary inequality

$ sup_(\| z \| lt.eq R) \| F \( z \) \| lt.eq sum_(i \, j) \| f_(i j) \| R^(i + j) quad "(7.5)" $ <cert:absolute-majorant>

provides a uniform, rather than sampled, bound. A convenient majorant for all low-degree rounding defects is

$ rho = sum_(k = 2)^N frac(36 \( k + 1 \) k^2 R^(k - 2), Q) . $

For the remaining products put, for $s = 0 \, 1 \, 2$,

$ D_(s \, k) = R^k / Q sum_(a + c = k\
a - c equiv s med \( 3 \)) \| C_(a c) \| \, #h(2em) V_(s \, m) = R^(m - 2) / Q sum_(a + c = m) \| A_(a c) \| v_s \( a \, c \) \, $

where $\( v_0 \, v_1 \, v_2 \) = \( a c \, c \( c - 1 \) \, a \( a - 1 \) \)$. A product with covariance degree $k$ and differentiated chart degree $m$ has degree $k + m - 2$. Every coefficient outside the recursion is consequently included in

$ sup_(\| z \| lt.eq R) \| cal(L) P_(N \, b) \( z \) \| lt.eq rho + sum_(s = 0)^2 sum_(k + m > N) D_(s \, k) V_(s \, m) . quad "(7.6)" $ <cert:residual-sum>

All terms on the right are nonnegative rational numbers. They can be bounded using integer arithmetic: set $U = 2^160$, replace each $D_(s \, k)$ and $V_(s \, m)$ by its upper integer multiple at scale $U$, round each summand of $rho$ upwards at the same scale, and divide the two sums by $U^2$ and $U$, respectively. For $N = 780 \, b = 500$ this gives

$ epsilon.alt := sup_(\| z \| lt.eq R) \| cal(L) P \( z \) \| < 3.328667 dot.op 10^(- 22) < 3.329 dot.op 10^(- 22) . quad "(7.7)" $ <cert:epsilon>

The exact upper numerator and denominator, as well as the complete coefficients regenerated by (7.3), form part of the finite certificate. Thus the small low-degree defect is attached to the defined polynomial, not assumed for an arbitrary supplied coefficient list.

For two polynomials, with missing coefficients interpreted as zero, define

$ Delta_a = sum_(i \, j) \| P_(i j) - P'_(i j) \| R^(i + j) \( i + j \)^a \, #h(2em) a = 0 \, 1 \, 2 \, $

using $\( i + j \)^0 = 1$ also at the constant term. A unit real directional derivative of a monomial costs at most $i + j$ and a second one at most $\( i + j \) \( i + j - 1 \)$. Hence

$ \| P - P' \| lt.eq Delta_0 \, quad parallel nabla \( P - P' \) parallel lt.eq Delta_1 \/ R \, quad parallel D^2 \( P - P' \) parallel_(upright("op")) lt.eq Delta_2 \/ R^2 . quad "(7.8)" $ <cert:jet-comparison>

Computing the coefficient differences exactly before taking absolute values, and rounding the resulting positive sums upwards, gives the following bounds on the entire closed disk:

table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Upper bound
]),
  table.cell(rowspan: 1, colspan: 1)[$\| P - P^(upright("ref")) \|$
], table.cell(rowspan: 1, colspan: 1)[$3.517 dot.op 10^(- 17)$
],
  table.cell(rowspan: 1, colspan: 1)[$parallel nabla \( P - P^(upright("ref")) \) parallel$
], table.cell(rowspan: 1, colspan: 1)[$1.233 dot.op 10^(- 14)$
],
  table.cell(rowspan: 1, colspan: 1)[$parallel D^2 \( P - P^(upright("ref")) \) parallel_(upright("op"))$
], table.cell(rowspan: 1, colspan: 1)[$4.327 dot.op 10^(- 12)$
],
  table.cell(rowspan: 1, colspan: 1)[$\| P - P_(lt.eq 236)^(upright("ref")) \|$
], table.cell(rowspan: 1, colspan: 1)[$1.902 dot.op 10^(- 11)$
],
  table.cell(rowspan: 1, colspan: 1)[$\| P - P_(lt.eq 220)^(upright("ref")) \|$
], table.cell(rowspan: 1, colspan: 1)[$7 dot.op 10^(- 11)$
],
)

Here the subscript denotes truncation by total degree. The same sums with factors $k$ and $k \( k - 1 \)$ prove, for either full or reference chart,

$ parallel nabla p_i parallel < .592 \, #h(2em) parallel D^2 p_i parallel_(upright("op")) < 3.05 . quad "(7.9)" $ <cert:chart-jets>

Truncating either chart at degree 40 changes its value by less than $.0002$ and its gradient by less than $.006$. These derivative estimates will control interpolation and root locations; value closeness alone would not suffice.

=== 7.3 Geometry of the domain <cert:geometry>

Work first in the sector $0 lt.eq theta lt.eq pi \/ 3$, writing $z = r e^(i theta)$. Define its probability domain by $r lt.eq R$ and $E_1 gt.eq 0$. We shall prove that the other five coordinates are uniformly positive there. Rotations and conjugation then provide the full domain $Omega$.

From (7.9),

$ parallel nabla E_i parallel < G := 1 / 3 + 3 \( .592 \) < 2.11 \, #h(2em) parallel D^2 E_i parallel_(upright("op")) < 9.15 . quad "(7.10)" $ <cert:E-jets>

Divide the sector into $480$ radial and $480$ angular cells, with centers

$ r_j = frac(R \( 2 j + 1 \), 960) \, #h(2em) theta_l = frac(\( 2 l + 1 \) pi, 2880) \, #h(2em) 0 lt.eq j \, l < 480 . $

Evaluate the degree-40 reference chart at these centers, including its radial derivative and unit-tangential derivative $r^(- 1) partial_theta$. The following are the exact integer center tests, after division by the arithmetic scale:

$ p_i & gt.eq .0516 quad \( i = 0 \, 1 \, 2 \) \, & E_0 \, E_2 & gt.eq .055 \, & d & gt.eq .488 \,\
E_1 < .018 & med arrow.r.double med - partial_r E_1 gt.eq .183 quad upright("and") quad parallel nabla E_1 parallel gt.eq .3208 \,\
E_1 gt.eq - .008 & med arrow.r.double med \( 9 d - 2 \)^2 gt.eq 18 sum_(i = 0)^2 \( D_i - D_(i + 1) \)^2 . quad "(7.11)" $ <cert:geometry-tests>

For completeness, their arithmetic specification uses $T = 2^45$, the rational approximation $3141592653589793238 \/ 10^18$ to $pi$, and sine and cosine series through degree 64 on arguments reduced to $\[ 0 \, 2 pi \)$. Every division in these recurrences is rounded down. The Taylor remainder is below $10^(- 30)$; propagation of rounding errors is bounded by $65 e^(2 pi) \/ T$. Including the argument approximation gives error below $2 dot.op 10^(- 9)$ in either trigonometric value. There are $861$ possible chart coefficients through degree 40; their absolute majorant is below $.921$, and the first-derivative majorant is below $.592$. Product and summation errors consequently leave a common allowance $10^(- 7)$ for the displayed scalar fields and gradient vectors. These rules specify finite integer evaluations at all $230400$ centers, and all tests (7.11) hold.

Let $b = pi \/ 2880$. Every point of a cell is within distance

$ delta lt.eq sqrt(\( R \/ 960 \)^2 + R^2 b^2) < .001870298 $

of its center. Adding the truncation tails, arithmetic allowance, and Lipschitz variation gives

$ p_i & > .0516 - .0002 - .592 delta - 10^(- 7) > .0502926 \,\
E_0 \, E_2 & > .055 - .0006 - G delta - 10^(- 7) > .0504548 . quad "(7.12)" $ <cert:positive-five>

If the true $E_1$ at a point is at most $.01$, its truncated center value is below $.01 + .0006 + G delta + 10^(- 7) < .018$. Thus the derivative tests apply. Using the Hessian variation and the degree-40 gradient tail yields

$ - partial_r E_1 & > .183 - .018 - 9.15 delta - G b - 10^(- 7) > .1455857 \,\
parallel nabla E_1 parallel & > .3208 - .018 - 9.15 delta - 10^(- 7) > .2856866 . quad "(7.13)" $ <cert:radial-slope>

Only the first line needs the term $G b$, accounting for rotation of the radial unit vector between the point and the center.

In particular $- partial_r E_1 > .144$ wherever $E_1 lt.eq .01$. At the origin, $E_1 = 1 \/ 3 - P \( 0 \) > .1471$. Once a ray reaches $.01$, its value decreases strictly while below that level and cannot cross upwards through it. Consequently each ray has at most one zero. Let $r_(*) \( theta \)$ be this zero if it lies below $R$, and $R$ otherwise. Implicit differentiation on the smooth face and clipping at $R$ give

$ \| r'_(*) \| lt.eq G R \/ .144 < 18.2 \, #h(2em) \| r''_(*) \| lt.eq frac(9.15 \( \( r'_(*) \)^2 + R^2 \) + 2.11 \( 2 \| r'_(*) \| + R \), .144) < 22000 \, quad "(7.14)" $ <cert:boundary-coarse>

where the second inequality is used only on intervals wholly in a smooth face. The clipped radius is Lipschitz; its second derivative is not used across a face–cap junction.

The eigenvalues of the matrix in (7.2) are

$ 9 d med plus.minus med 3 sqrt(2 sum_i \( D_i - D_(i + 1) \)^2) . $

The center tests give a smaller eigenvalue at least 2; $d gt.eq .488$ ensures the required sign before taking square roots. A cell containing a point with $E_1 gt.eq 0$ has computed center $E_1 > - .004546$, so the test is active. Throughout the sector $r_i in \[ - .08 \, .746667 \]$, and hence

$ parallel nabla D_i parallel lt.eq 1.16 \/ 3 + 2 \( .592 \) < 1.571 . $

The change from the truncated center to the full value is less than $2 \( .0002 \) + 1.571 \( .001871 \) + 10^(- 7) < .00334$. If all $D_i$ change by at most $t$, then $parallel Delta C parallel_(upright("op")) lt.eq 15 t$: the three coefficients of $D_i$ in a unit-direction quadratic form are $3 + 6 cos \( 2 a + 2 pi i \/ 3 \)$; they sum to 9, at most one is negative, and a negative coefficient has magnitude at most 3. Their absolute sum is at most 15. We conclude

$ lambda_min \( C \) > 2 - 15 \( .00334 \) > 1.949 #h(2em) upright("on ") overline(Omega) . quad "(7.15)" $ <cert:ellipticity>

All full/reference differences in (7.8) fit within the remaining strict slacks, so these conclusions hold for $P_(780 \, 500)$.

=== 7.4 The barrier and the interior inequality <cert:interior>

Finite Taylor polynomials, explicit remainder bounds, and subdivision into certified boxes are standard techniques of validated numerics; see #cite(label("makinoberz2003")) Section 2 and Algorithm 1 and #cite(label("solovyevhales2013")) Section 2. We specify the integer arithmetic and all error allowances for the present certificate below.

Let

$ cal(I) = { \( i \, j \) : 0 lt.eq j lt.eq i \, med i + j lt.eq 22 \, med i - j equiv 0 med \( mod med 3 \) } . $

The $52$ exact rational coefficients $a_(i j)$ in Table 3 define

$ phi \( z \) = Re sum_(\( i \, j \) in cal(I)) a_(i j) z^i macron(z)^j . quad "(7.16)" $ <cert:barrier>

For $i > j$, the real part gives $a_(i j) \( z^i macron(z)^j + z^j macron(z)^i \) \/ 2$; a diagonal term occurs once. This polynomial is invariant under $z mapsto zeta z$ and conjugation. Its constant term is $1.098619383270680538$.

#thm([Lemma 7.3.])[
  (Interior certificate).  #emph[On $overline(Omega)$, 
$ cal(L) phi > - 1 + 9.8 dot.op 10^(- 8) . $

]
] <cert:interior-lemma>

#proof[
  We specify a finite interval verification and its error accounting. Let $q = P_(lt.eq 236)^(upright("ref"))$ and $w = z \/ R$. By (7.8), $\| P - q \| < 1.902 dot.op 10^(- 11)$ on the disk; we reserve the looser allowance $10^(- 10)$ below. Define
  $ A \( w \) = 36 phi_(z macron(z)) \( R w \) \, #h(2em) B \( w \) = 36 phi_(z z) \( R w \) . $
  Differentiating the real-part expression (7.16) assigns a coefficient factor $18 R^(i + j - 2)$ to each conjugate contribution. If $i = j$, the identical contributions combine, correctly counting the original diagonal term once.
  The five real fields to be verified are
  $ cal(L)_q phi \, #h(2em) E_(1 \, q) \, #h(2em) A \, #h(2em) Re B \, #h(2em) Im B . quad "(7.17)" $ <cert:five-fields>
  The first supplies the differential lower bound. The second identifies boxes lying outside $Omega$, and the last three bound the error in the operator when $q$ is replaced by $P$. The subscript $q$ means that the chart probabilities and covariance are formed from $q$. Explicitly, put $r = \( 1 + Re z \) \/ 3$, $D = r \( 1 - r \) + 2 q$, and let $Pi_s$ retain exponent differences congruent to $s$ modulo three. Then
  $ d_q = Pi_0 D \, #h(2em) f_q = Pi_2 D \, #h(2em) cal(L)_q phi = d_q A + 2 Re \( f_q B \) \, #h(2em) E_(1 \, q) = \( r + 2 q \) \( zeta z \) - 3 Pi_0 q \( z \) . $
  All derivative polynomials are evaluated at $w = z \/ R$.
  Convert rational coefficients to integers at scale $U = 2^115$ by truncation toward zero. Divisions in polynomial products are rounded down. Every constituent field has degree below 320 and fewer than $52000$ possible monomials; the checked coefficient absolute sums, divided by $U$, are below $2^36$. Before quantization, $2^36 + 1$ is a valid bound. The sums of coefficient-quantization errors and product-division errors are therefore below $6 dot.op 10^(- 19)$. These errors concern the functions on $\| w \| lt.eq 1$, by (7.5).
  Put $N = 128$, $J = 14$, $h = pi \/ \( 6 N \)$. The boxes
  $ z = R frac(2 u + 1 + v, 2 N) exp #scale(x: 120%, y: 120%)[\(] i \( 2 s + 1 + t \) h #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| t \| \, \| v \| lt.eq 1 \, quad 0 lt.eq s \, u < N \, quad "(7.18)" $ <cert:polar-box>
  cover the whole closed sector. For each field, expand in $t$ and $v$ to degree $J$ in each variable. At scale $T = 2^69$ the resulting integer array $a = \( a_(i j) \)_(0 lt.eq i \, j lt.eq 14)$ represents $T^(- 1) sum a_(i j) t^i v^j$.
  Here are explicit arithmetic rules for generating these arrays. Evaluate $arctan \( 1 \/ m \)$ by the first 36 terms of its alternating power series, flooring each unsigned term magnitude at scale $U$ before applying its alternating sign, and form
  $ h_U = ⌊frac(16 arctan_U \( 1 \/ 5 \) - 4 arctan_U \( 1 \/ 239 \), 6 N)⌋ . $
  For a monomial $w^i macron(w)^j$, let $m = i - j$. Reduce the phase index $m \( 2 s + 1 \)$ modulo $12 N$, multiply by $h_U$, and evaluate sine and cosine with terms of orders $0 \, dots.h \, 83$. Generate the order-$k$ angular Taylor coefficient by differentiating and multiplying by $m h_U \/ \( k U \)$, rounding each division down. An extra phase index $4 N m$ gives the rotated constituent in $E_(1 \, q)$. Sum the monomial contributions by total degree and convert once to scale $T$ with floor division. Finally substitute $\( 2 u + 1 + v \) \/ \( 2 N \)$ by polynomial Horner evaluation, discarding powers above $J$ in $v$ and rounding each division down. These rules produce precisely the arrays for (7.17).
  We next bound what these finite Taylor arrays omit. For each constituent with integer coefficients $v_(i j)$ at scale $U$ (so its polynomial coefficients are $v_(i j) \/ U$), the following rational inequality is checked:
  $ sum_(i \, j) frac(\| v_(i j) \|, U) [frac(\( \( i + j \) pi_(+) \/ \( 6 N \) \)^15, 15 !) + 4 binom(i + j, 15) \( 2 N \)^(- 15)] < 10^(- 10) \, #h(2em) pi_(+) = 22 \/ 7 . quad "(7.19)" $ <cert:taylor-tail>
  The first term is a real sine/cosine Taylor remainder. The second bounds the radial remainder; the angular Taylor polynomial has coefficient sum at most $exp \( 319 pi \/ \( 6 N \) \) < 4$. Taylor’s theorem for the radial monomial on $\[ 0 \, 1 \]$ supplies its binomial factor. The edge field has two constituents, so its tail bound is doubled.
  For clarity, the remaining arithmetic estimates are collected here:
  table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Source of error
], table.cell(rowspan: 1, colspan: 1)[Uniform allowance
]),
  table.cell(rowspan: 1, colspan: 1)[Coefficient assembly
], table.cell(rowspan: 1, colspan: 1)[$6 dot.op 10^(- 19)$
],
  table.cell(rowspan: 1, colspan: 1)[Angular recurrence and conversion to scale $T$
], table.cell(rowspan: 1, colspan: 1)[$4 dot.op 10^(- 16)$
],
  table.cell(rowspan: 1, colspan: 1)[Taylor truncation, edge/other fields
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 10)$ / $10^(- 10)$
],
  table.cell(rowspan: 1, colspan: 1)[Radial Horner floor divisions
], table.cell(rowspan: 1, colspan: 1)[$320 dot.op 15^2 \/ T$
],
  table.cell(rowspan: 1, colspan: 1)[At most 28 subdivisions
], table.cell(rowspan: 1, colspan: 1)[$28 dot.op 15^3 \/ T$
],
  table.cell(rowspan: 1, colspan: 1)[Total, for either sign of any field
], table.cell(rowspan: 1, colspan: 1)[$3 dot.op 10^(- 10)$
],
)
  To justify the angular line, the Machin computation errs by less than $2 \/ U$ in $h$, and reduced phases by less than $3100 \/ U$. Taylor recurrence errors in sine and cosine are below $50000 \/ U$, and each of the 15 angular derivative coefficients errs by less than $300000 \/ U$. Multiplying these bounds by the checked coefficient absolute sums gives the stated conversion allowance. The radial substitutions contract the coefficient absolute norm: their affine coefficients are nonnegative and have sum at most one. A child substitution has the same contraction property after absolute values. Consequently the floor errors add over Horner steps and subdivision levels rather than amplifying. There are at most $15^2$ entries per Horner step and fewer than $15^3$ elementary contributions per subdivision, giving the last two lines.
  For an integer array define
  $ ell_sigma \( a \) = sigma a_00 - sum_(\( i \, j \) eq.not \( 0 \, 0 \)) \| a_(i j) \| \, #h(2em) sigma in { - 1 \, 1 } . $
  The represented polynomial is bounded below by $ell_sigma \( a \) \/ T$ after multiplication by $sigma$. Therefore the exact field satisfies
  $ sigma F gt.eq ell_sigma \( a_F \) \/ T - 3 dot.op 10^(- 10) quad "(7.20)" $ <cert:jet-lower>
  everywhere in the box. If a bound is insufficient, bisect by $\( t \, v \) = \( y \, \( epsilon + x \) \/ 2 \)$, $epsilon = plus.minus 1$, thereby alternating the two subdivision directions. The child coefficient of $y^i x^k$ is
  $ sum_(j gt.eq k) ⌊a_(i j) binom(j, k) epsilon^(j - k) \/ 2^j⌋ . $
  A box is discarded only when
  $ ell_(- 1) \( a_(E_(1 \, q)) \) > floor.l T \/ 10^8 floor.r + 1 . quad "(7.21)" $ <cert:outside-test>
  Its field error and the chart-change allowance $5 dot.op 10^(- 10)$ total less than $10^(- 8)$, so every such box has full-chart $E_1 < 0$.
  To certify the interior inequality, observe that
  $ \| cal(L)_P phi - cal(L)_q phi \| lt.eq 2 dot.op 10^(- 10) \| A \| + 4 dot.op 10^(- 10) \( \| Re B \| + \| Im B \| \) . quad "(7.22)" $ <cert:chart-L-error>
  For each derivative field $F in { A \, Re B \, Im B }$ and either sign put $x_(F \, sigma) = - ell_sigma \( a_F \)$. Use the integer allowance
  $ e = 2 sum_(F in { A \, Re B \, Im B }) sum_(sigma = plus.minus 1\
x_(F \, sigma) > 0) (⌊frac(2 x_(F \, sigma), 10^10)⌋ + 4) . $
  The sum of the two positive negative-part bounds dominates the absolute value of a represented field. Hence $e \/ T$ bounds the right-hand side of (7.22), up to less than $2 dot.op 10^(- 18)$ from the field-approximation errors. The coefficient used for $A$ is deliberately larger than necessary. Each integer cushion exceeds the floor loss in its summand.
  The acceptance condition is
  $ ell_1 \( a_(cal(L)_q phi) \) > - T + floor.l T \/ 10^7 floor.r + e . quad "(7.23)" $ <cert:accept-test>
  Together with (7.20) and (7.22), reserving $2 dot.op 10^(- 9)$ for all evaluation, chart-change, and threshold-rounding errors, it proves $cal(L)_P phi > - 1 + 9.8 dot.op 10^(- 8)$ on the box.
  Start with every pair $\( s \, u \)$ in (7.18), apply the two certification conditions, and recursively subdivide any unresolved box. All $128$ angular executions terminate with every descendant accepted or discarded by these conditions at depth at most 28. The finite certificate records the complete sector inputs and successful termination for all sectors, not a collection of floating-point sample values. Arithmetic can be interpreted as exact integers with the specified floor divisions. For the fixed-width implementation, array norms are below $2^109$, Horner products below $2^117$, and subdivision products below $2^121$, within signed 128-bit range. Section 16 records the machine-semantics checks and reproduced finite coverage. Rotations and conjugation cover the other sectors. This proves the lemma. ◻
]

=== 7.5 The six-component boundary inequality <cert:boundary>

We apply the three-state seed to a face of the six-component domain, and the matching construction to its circular cap. It is important to keep these two sources of attainable values distinct.

Put $U = U_(gamma_0)$, where $gamma_0 = 300000 \/ 225925$. Since $3 \/ beta > gamma_0$, Proposition 22 permits us to use this lower parameter in the face estimate of Proposition 25. At $E_1 = 0$ define

$ Q = \( p_2 + E_0 \, p_0 + E_2 \, p_1 \) \, #h(2em) J = "en" \( p_2 \) + "en" \( p_0 \) + "en" \( E_0 \) + "en" \( E_2 \) - "en" \( Q_0 \) - "en" \( Q_1 \) . quad "(7.24)" $ <cert:face-data>

The face lower bound is

$ B_e = 1129 / 1500 #scale(x: 120%, y: 120%)[\(] U \( Q \) + J #scale(x: 120%, y: 120%)[\)] . quad "(7.25)" $ <cert:Be>

At the cap put $l_h = E_(h + 1) + E_(h + 2)$. The side-$h$ marginal is $\( 1 - l_h - p_h \, l_h \, p_h \)$, so Proposition 24 gives

$ B_c = 1 / 3 sum_(h = 0)^2 #scale(x: 120%, y: 120%)[\[] "en" \( l_h \) + "en" \( p_h \) + "en" \( 1 - l_h - p_h \) #scale(x: 120%, y: 120%)[\]] . quad "(7.26)" $ <cert:Bc>

===== 7.5.1 A finite lower estimate for $U$. <a-finite-lower-estimate-for-u.>

For evaluation in (7.25), use the entropy baseline, the improved shell bound, and finite-library mixtures from Section 6. The library bounds are tabulated on the three-state simplex grid of spacing $1 \/ 500$. Within a grid square whose four vertices are in the simplex, bilinear interpolation is a convex combination of the four vertex laws and reproduces the target law exactly. Concavity of $U$ therefore makes the interpolant of lower utilities a valid lower bound. Every grid vertex used here has all coordinates greater than $.03$.

At each grid vertex subtract $2 dot.op 10^(- 6)$ from the computed library utility. Subtract a further $2 dot.op 10^(- 8)$ from the maximum of this interpolant and $F_0$. Inside the shell also consider $F_0 + H_W - 24 dot.op 10^(- 6)$, using a radial guard $10^(- 8)$ to ensure that the point really lies in the shell. Take the maximum of the available bounds and cap it at $1.45$. The resulting evaluated estimate is nonnegative. The error recurrences, entropy evaluation, and distribution correction proved above allow at most $10^(- 7)$ additional overstatement; we include it in the boundary arithmetic allowance. Neither selection of the maximum nor downward capping requires the library to be optimal.

===== 7.5.2 Locating boundary points. <locating-boundary-points.>

Set

$ K = 65536 \, #h(2em) h = frac(pi, 3 K) . $

Evaluate the boundary at the $K + 1$ endpoint angles. Use the degree-220 reference chart and arithmetic scale $B = 2^52$. The value error relative to $P$ is below $7 dot.op 10^(- 11)$, and each $E$-coordinate error is below $2.5 dot.op 10^(- 10)$. The chart coefficient tail was already bounded in Section 7.2. For evaluation, combine conjugate coefficients as real cosines and evaluate radial powers by Horner’s rule. The fundamental cosine is computed by the degree-48 Taylor polynomial on $\[ 0 \, pi \]$ after symmetry reduction, with error at most $300 \/ B$. Higher angular harmonics are formed by the recurrence $c_(s + 1) = 2 c_1 c_s - c_(s - 1)$; their error amplification is controlled by the $k^2$-weighted coefficient sum. The total absolute coefficient sum of the reference chart on the disk is below $.414$, and its $k^2$-weighted sum is below 6. These majorants bound the additional coefficient, trigonometric, and Horner errors within the stated allowances.

If the computed $E_1 \( R e^(i theta) \)$ is nonnegative, take the clipped radius $R$; otherwise perform 38 bisections on $\[ 0 \, R \]$. By (7.13), the combined evaluation and bisection error in $r_(*) \( theta \)$ is below $2 dot.op 10^(- 9)$: the dominant term is $\( 2.5 dot.op 10^(- 10) \) \/ .144$, and $R 2^(- 38)$ is smaller than the remaining slack. The same bound holds when a sign uncertainty changes whether the root is clipped.

Use the band

$ b_K = 2.7 h + 5 dot.op 10^(- 9) quad "(7.27)" $ <cert:band>

to classify a complete angular cell from its left endpoint. This is valid because $\| partial_theta E_1 \( R e^(i theta) \) \| < G R < 2.62$. A value below $- b_K$ identifies a full face cell; one above $b_K$ identifies a full cap cell. In the other cells, subdivide into $8192$ equal subcells and use the analogous band at that scale. Where the sign remains uncertain, evaluate both bounds.

At an endpoint the face bound is computed whenever the cap value is below $2.1 b_K$, and the cap bound whenever it is above $- 2.1 b_K$. Such a face evaluation may occur at a clipped cap point with $E_1 eq.not 0$. Its three-state law is normalized by setting

$ hat(Q)_0 = p_2 + E_0 \, #h(2em) hat(Q)_1 = p_0 + E_2 \, #h(2em) hat(Q)_2 = 1 - hat(Q)_0 - hat(Q)_1 = p_1 + E_1 . $

On the face, $hat(Q) = Q$. At a sampled point off the face, use $hat(Q)$ in the right side of (7.25), with the same internal coordinates and first two coarse coordinates in (7.24). This is an auxiliary comparison expression; the interpolation and displacement estimates below transport it to actual face laws, where Proposition 25 supplies attainability.

The band rule ensures that both endpoints required for a full-cell test have been evaluated: for example, a left value below $- b_K$ forces the next value below $- b_K + 2.62 h$ plus evaluation error, which is below $2.1 b_K$. This also guarantees the face samples near cap points at which the inset will become active. There are six transition cells in the finite check.

===== 7.5.3 Barrier evaluation and derivative bounds. <barrier-evaluation-and-derivative-bounds.>

For (7.16), store the scaled radial coefficients at $B_phi = 2^44$, rounded to nearest integers. Evaluate powers of $r \/ R$ and the appropriate cosine or sine for angular differentiation. For a term of radial degree $d = i + j$ and angular frequency $s = i - j$, an $a$-th radial and $b$-th angular derivative has multiplier $d \( d - 1 \) dots.h.c \( d - a + 1 \) s^b$ with the appropriate phase shift. Exact coefficient sums give the following value and derivative error bounds:

$ upright("value error") < 1.2 dot.op 10^(- 7) \, #h(2em) upright("error in each derivative through order three") < .002 . quad "(7.28)" $ <cert:barrier-arithmetic>

One may obtain these by summing, for each monomial, its coefficient rounding error, the at most $d$ radial-power division errors, and its trigonometric error, multiplied by the displayed derivative factor. The absolute radial coefficient sums weighted by $d^k$, $k = 0 \, dots.h \, 4$, are respectively below

$ 35000 \, quad 750000 \, quad 15000000 \, quad 300000000 \, quad 6000000000 . $

These conservative rational bounds make the calculation independent of cancellation in the evaluated polynomial.

At every sampled point where a face bound is evaluated, the integer checks in physical polar coordinates give

$ \| partial_r^a partial_theta^b phi \| < cases(delim: "{", 2.9 \, & a + b = 1 \,, 79 \, & a + b = 2 \,, 1999 \, & a + b = 3 .) quad "(7.29)" $ <cert:face-jet-tests>

When evaluated using normalized radius $r \/ R$, the threshold contains $R^a$, converting it to precisely this physical-coordinate statement. Cap samples satisfy $\| phi_theta \| < 999$ and $\| phi_(theta theta) \| < 4999$ before the errors (7.28) are restored.

A useful uniform fourth-derivative bound is

$ sup_(r lt.eq R) \| partial_r^a partial_theta^b phi \| lt.eq sum_(\( i \, j \) in cal(I)\
i + j gt.eq a) \| a_(i j) \| frac(\( i + j \) !, \( i + j - a \) !) R^(i + j - a) \| i - j \|^b < 435 dot.op 10^6 #h(2em) \( a + b = 4 \) . quad "(7.30)" $ <cert:fourth>

These are five finite rational sums. Their largest value is less than $434439204$, so the stated integer bound has spare margin. Taylor’s theorem with (7.30) extends the sampled derivative estimates between boundary samples.

===== 7.5.4 Interpolation on a smooth face. <interpolation-on-a-smooth-face.>

On a full face cell the additional integer secant test is

$ frac(\| hat(r)_(*) \( theta + h \) - hat(r)_(*) \( theta \) \|, h) < 3.05 \, $

where hats denote the computed physical radii. The coarse bound $\| r''_(*) \| < 22000$ and the root-location errors show $\| r'_(*) \| < 3.05 + 22000 h + 4 dot.op 10^(- 9) \/ h < 3.41$. Substitute this in (7.14) to get

$ \| r'_(*) \| < 3.41 \, #h(2em) \| r''_(*) \| < 1000 . quad "(7.31)" $ <cert:boundary-fine>

Write $z \( theta \) = r_(*) \( theta \) e^(i theta)$. Then

$ \| z' \|^2 lt.eq 3.41^2 + R^2 \, #h(2em) \| z'' \| lt.eq 1000 + 2 \( 3.41 \) + R . $

Equations (7.9) and (7.10) now give

$ \| Q''_0 \| \, \| Q''_1 \| < 2900 \, #h(2em) \| J'' \| < 30000 \, #h(2em) \| \( phi compose z \)'' \| < 5100 . quad "(7.32)" $ <cert:face-curvature>

Here are details for the last two estimates. In differentiating $"en" \( s \)$, use $"en"' \( s \) = - 1 - log s$ and $"en"'' \( s \) = - 1 \/ s$. The four internal arguments in $J$ exceed $.05$, and $Q_0 \, Q_1 > .10$. The first-derivative bounds for an internal $p$ and $E$ are $.592 \| z' \|$ and $2.11 \| z' \|$; their second derivatives are bounded by $3.05 \| z' \|^2 + .592 \| z'' \|$ and $9.15 \| z' \|^2 + 2.11 \| z'' \|$. The six entropy chain-rule terms are bounded using $\| "en"' \( s \) \| < 2$ on $\[ .05 \, 1 \]$ and $\| "en"' \( s \) \| < 1.31$ on $\[ .10 \, 1 \]$. Their sum is below 30000. For the barrier, expand its first and second polar derivatives about a sampled endpoint, using (7.29), (7.28), and (7.30). The polar displacement is at most $\( 3.41 + 1 \) h + 4 dot.op 10^(- 9)$. Throughout the cell the first derivatives are below $2.91$ and the second derivatives below $80.3$. Therefore

$ \| \( phi compose z \)'' \| lt.eq 80.3 \( 3.41 + 1 \)^2 + 2.91 \( 1000 \) < 5100 . $

For a function with $\| f'' \| lt.eq M$, its difference from linear interpolation over an interval of length $h$ is at most $M h^2 \/ 8$. Concavity of $U$ lets us interpolate the closed attainable law–utility pairs at neighboring endpoints, giving a lower bound at the chord law. The first two $Q$ coordinates differ from the curved target by at most $2900 h^2 \/ 8$. On the actual face the third coordinate is $Q_2 = p_1$; using it directly gives

$ \| Q''_2 \| lt.eq 3.05 \( 3.41 + 1.24 \)^2 + .592 \( 1000 + 2 \( 3.41 \) + 1.24 \) < 663 . $

Since $Q_0 \, Q_1 > .10$ and $Q_2 > .05$, the curvature divided by a coordinate lower bound is at most $29000$. The exact-law correction of Lemma 33 costs at most $1.5 dot.op 29000 h^2 \/ 8$ in $U$. Adding the conditional-entropy and barrier interpolation costs gives

$ [5100 + .754 #scale(x: 120%, y: 120%)[\(] 30000 + 1.5 \( 29000 \) #scale(x: 120%, y: 120%)[\)]] h^2 / 8 < 2 dot.op 10^(- 6) \, quad "(7.33)" $ <cert:face-interpolation>

where $.754 > 1129 \/ 1500$.

===== 7.5.5 Interpolation on a cap. <interpolation-on-a-cap.>

On an actual cap all entropy arguments in (7.26) exceed $.049$. The chart derivative bounds and $\| z' \| = \| z'' \| = R$ give $\| B''_c \| < 1600$. For example, the gradient bounds for the three marginal arguments are $4.22$, $.592$, and $4.812$, and the Hessian bounds are $18.3$, $3.05$, and $21.35$; substituting these in the entropy chain rule already gives the stated bound. The cap sample derivative checks extend to $\| phi_(theta theta) \| < 10000$. A direct coefficient bound gives $\| phi_(theta theta theta) \| < 3875770$, so the second derivative can move by less than 62 in one full cell. It follows that the full-cap interpolation loss is less than $\( 1600 + 10000 \) h^2 \/ 8 < .4 dot.op 10^(- 6)$.

===== 7.5.6 Transition subcells. <transition-subcells.>

No second derivative across the clipped corner is needed. In a subcell the actual boundary point and its sampled clipped point have complex displacement less than

$ \( 18.2 + R \) h \/ 8192 + 2 dot.op 10^(- 9) < 4.1 dot.op 10^(- 8) . $

This changes $Q_0 \, Q_1$ by less than $1.12 dot.op 10^(- 7)$ each, and their reconstructed third coordinate by less than $2.24 dot.op 10^(- 7)$. The singleton correction costs at most

$ 1129 / 1500 thin 1.5 thin max {frac(1.12 dot.op 10^(- 7), .10) \, frac(2.24 dot.op 10^(- 7), .05)} < 5.06 dot.op 10^(- 6) . $

The conditional-entropy differential for one split is $log \( \( a + b \) \/ a \) thin d a + log \( \( a + b \) \/ b \) thin d b$. All internal coordinates remain above $.049$ on this displacement, so each logarithmic factor is less than $3.1$. Summing the four internal-coordinate changes and multiplying by $1129 \/ 1500$ gives less than $.52 dot.op 10^(- 6)$. The local barrier first derivatives, extended from (7.29) with (7.30), are below 3; its change is less than $.13 dot.op 10^(- 6)$. Thus the total face #emph[displacement] loss is less than $6.5 dot.op 10^(- 6)$. This estimate remains valid if the sampled clipped point is just on the cap: reconstructing $Q_2$ absorbs its small active-coordinate mass into the five-state face law, and the same correction reaches the actual face law.

For a cap transition, evaluate the smooth entropy expression in (7.26) even if the sampled cap point has $E_1 < 0$. Attainability is asserted only at the actual cap target, where Proposition 24 applies; the displacement estimate compares the two entropy expressions. All their arguments stay above $.049$, and $\| B'_c \| < 26$. The cap derivative checks, followed by the local second bound just established, give $\| phi_theta \| < 1001$. The subcell width is below $2 dot.op 10^(- 9)$, so displacement together with the cap endpoint arithmetic allowance costs less than $2.4 dot.op 10^(- 6)$.

===== 7.5.7 Arithmetic checks and retained margins. <arithmetic-checks-and-retained-margins.>

The finite evaluations compare the face and cap lower estimates against $phi$. The smallest recorded integer gaps at scale $B = 2^52$ are

$ g_e = 128315602072 \/ B > 28.49 dot.op 10^(- 6) \, #h(2em) g_c = 152568202355 \/ B > 33.87 dot.op 10^(- 6) . quad "(7.34)" $ <cert:actual-gaps>

All $65536$ cells, and all $8192$ subcells of each of the six transition cells, satisfy the corresponding tests. On full face cells the secant tests used above also hold. The conditional laws and mixture checks used to produce these values are the finite rational constructions of Section 6.

A conservative endpoint arithmetic allowance is $10 dot.op 10^(- 6)$ for a face evaluation and $.2 dot.op 10^(- 6)$ for a cap evaluation. To see that the former suffices, account separately for the $2 dot.op 10^(- 9)$ root-location error with the chart gradient bounds, correct the resulting coarse-law error by singleton dilution with coordinates above $.03$, include the $10^(- 7)$ possible error in the computed lower estimate for $U$, and add the entropy and barrier errors. Each coordinate moves by less than $6 dot.op 10^(- 9)$, with less than $12 dot.op 10^(- 9)$ for the reconstructed coordinate; this dilution costs less than $6 dot.op 10^(- 7)$ before the prefactor. The entropy and barrier evaluation estimates above fit well within the remaining allowance. A cap needs no root correction; the chart error in its entropy arguments and the barrier value error give the stated $.2 dot.op 10^(- 6)$ bound. All trigonometric, logarithmic, coefficient, and integer-division errors have been included.

We use the recorded face minimum in (7.34) and charge the full face arithmetic allowance in transition cells separately from displacement. The resulting bounds are

table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Boundary case
], table.cell(rowspan: 1, colspan: 1)[Gap used
], table.cell(rowspan: 1, colspan: 1)[Arithmetic loss
], table.cell(rowspan: 1, colspan: 1)[Interpolation/displacement loss
]),
  table.cell(rowspan: 1, colspan: 1)[Full face
], table.cell(rowspan: 1, colspan: 1)[$28.49 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$10 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 6)$
],
  table.cell(rowspan: 1, colspan: 1)[Transition face
], table.cell(rowspan: 1, colspan: 1)[$28.49 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$10 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$6.5 dot.op 10^(- 6)$
],
  table.cell(rowspan: 1, colspan: 1)[Full cap
], table.cell(rowspan: 1, colspan: 1)[$8 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$.2 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$.4 dot.op 10^(- 6)$
],
  table.cell(rowspan: 1, colspan: 1)[Transition cap
], table.cell(rowspan: 1, colspan: 1)[$8 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 2)[$2.4 dot.op 10^(- 6)$ combined
],
)

Every entry leaves more than $5.5 dot.op 10^(- 6)$.

All arithmetic has an exact-integer interpretation with specified truncating or floor divisions. In the finite-width implementation, probabilities and counts are below $3 B$, and scores and accumulated utilities below $100 B$. Projected-law determinants and barycentric numerators have magnitude at most $2^60$; utility-gap products are below $2^94$, ratio-test products below $2^122$, and barrier products below $10^36 < 2^127$. Narrowing casts are checked. These bounds justify the integer interpretation independently of the additional runtime checks described in Section 16. We have proved the following uniform statement.

#thm([Lemma 7.4.])[
  (Continuous boundary margin).  #emph[On the boundary of the full six-state probability domain, 
$ F_beta \( alpha \( z \) \) gt.eq phi \( z \) + 5.5 dot.op 10^(- 6) . $

]
] <cert:boundary-lemma>

=== 7.6 The positive inset and the comparison argument <cert:inset>

The supporting-covector estimate requires all six probabilities to be bounded away from zero. Set $eta = 2 dot.op 10^(- 9)$ and replace each active face $E_i = 0$ by $E_i = eta$, retaining the cap where it is reached first. Let the resulting domain be $Omega_eta$. It contains the origin, has compact closure, and all six coordinates are at least $eta$ there. We now transfer Lemma 38 to its boundary.

On a removed terminal segment of a ray, $0 lt.eq E_1 lt.eq eta$ and $- partial_r E_1 > .144$. Its length is at most

$ Delta r lt.eq eta \/ .144 < 1.389 dot.op 10^(- 8) . quad "(7.35)" $ <cert:inset-distance>

This also handles an original cap endpoint with $0 lt.eq E_1 < eta$. The five other coordinates remain greater than $.05$ and each changes by less than $2.11 Delta r < 2.94 dot.op 10^(- 8)$. Write $alpha_b$ and $alpha_eta$ for the original and new endpoint laws. With

$ lambda = max_(i : \( alpha_b \)_i > 0) (1 - frac(\( alpha_eta \)_i, \( alpha_b \)_i))_(+) \, $

the active coordinate contributes nothing, and $lambda < 2.94 dot.op 10^(- 8) \/ .05 = 5.88 dot.op 10^(- 7)$. If $lambda > 0$, the vector

$ s = frac(alpha_eta - \( 1 - lambda \) alpha_b, lambda) $

is a probability distribution. Mix a construction at $alpha_b$ with singleton constructions of average law $s$. Singleton utility is nonnegative, and the original utility is at most $log 6 < 2$. The loss is below $2 lambda < 1.18 dot.op 10^(- 6)$. When $lambda = 0$ no correction is required. The closure of rational mixtures gives the same conclusion for limiting endpoint laws.

To bound the change of the barrier, every point of the inset segment has a face-check sample within angular distance $h = pi \/ \( 3 dot.op 65536 \)$. The band test covers even cap endpoints where the inset becomes active. The radial Lipschitz bound, root error, and inset displacement give total polar-coordinate distance at most

$ d_(*) = 19.2 h + 2 dot.op 10^(- 9) + 1.389 dot.op 10^(- 8) < .000307 . $

Taylor’s theorem for $partial_r phi$, using (7.29), (7.28), and (7.30), gives

$ \| partial_r phi \| < 2.902 + 79.002 d_(*) + 1999.002 / 2 d_(*)^2 + frac(435 dot.op 10^6, 6) d_(*)^3 < 3 . $

Thus the barrier changes by less than $3 Delta r < 4.2 dot.op 10^(- 8)$. The two transfer losses total less than $1.3 dot.op 10^(- 6)$, leaving more than $4.2 dot.op 10^(- 6)$ slack on the inset boundary. At unchanged cap points there is no loss. Symmetry treats all faces.

#proof[
  Let $g$ be a supporting covector of $F_beta$ at a point of the inset, normalized by $g dot.op alpha = F_beta \( alpha \)$. Nonnegativity at simplex vertices implies $g_i gt.eq 0$. Proposition 18 gives $F_beta lt.eq log 6 < 2$. Rotation covariance in (7.2) and the residual bound (7.7) imply $\| cal(L) p_i \| lt.eq epsilon.alt$ and $\| cal(L) E_i \| lt.eq 3 epsilon.alt$. Lemma 32 consequently gives
  $ \| g dot.op cal(L) alpha \| lt.eq 2 max_i frac(\| cal(L) alpha_i \|, alpha_i) lt.eq frac(6 epsilon.alt, eta) < 9.987 dot.op 10^(- 13) < 10^(- 12) . quad "(7.36)" $ <cert:covector-debt>
  The chart and value function are continuous on this compact inset. If $phi - F_beta compose alpha$ had a positive maximum, the boundary slack would place it at an interior point. Subtracting the maximum from $phi$ gives a smooth lower test there. Theorem 26, Lemma 37, and (7.36) would imply
  $ 1 lt.eq g dot.op cal(L) alpha - cal(L) phi < 10^(- 12) + 1 - 9.8 dot.op 10^(- 8) < 1 \, $
  a contradiction. Therefore $F_beta \( alpha \( z \) \) gt.eq phi \( z \)$ throughout the inset. At the origin $alpha \( z \) = alpha_(*)$, and
  $ phi \( 0 \) - log 3 = 1.098619383270680538 - log 3 > 7.094 dot.op 10^(- 6) > 0 . $
  For example, the logarithm inequality follows from its positive $2 sum_(j gt.eq 0) t^(2 j + 1) \/ \( 2 j + 1 \)$ series with $t = \( 3 - 1 \) \/ \( 3 + 1 \) = 1 \/ 2$ and a geometric bound on the tail; no floating-point comparison is needed. This proves the theorem. ◻
]

== 8 From the certificate to the exponent bound <sec:conclusion>

We now pass from the strict comparison to the exponent bound. This last step uses the finite construction class defining the attainable value, rather than a limiting tensor.

#proof[
  Set $beta = 1129 \/ 500$. By 35, at the center $alpha_(*)$ of the certified chart,
  $ F_beta \( alpha_(*) \) gt.eq 1.098619383270680538 > log 3 + 7.094 times 10^(- 6) . $
  By the definition of $F_beta$ as the closure of scores of admissible finite constructions, there is a finite construction whose score is strictly greater than $log 3$. Its law may approximate $alpha_(*)$; exact equality of the law is not needed in the rank inequality.
  Let its six banks contain $N$ original occurrences each and put $n = 6 N$. Let $L$ be its number of nonzero direct labels, $R$ its charged ancillary border-rank bound, and $v = a b c$ its common matrix multiplication volume. The construction gives a finite degeneration
  $ T^(⊗ n) ⊗ cal(A) gt.tri.eq xor.big_(ell = 1)^L chevron.l a \, b \, c chevron.r \, #h(2em) upright(underline(R)) \( cal(A) \) lt.eq R . $
  All parameters here—including group sizes, control horizons, rational approximants and exact bank sizes—have already been chosen. The score inequality reads
  $ frac(log L - log R + \( beta \/ 3 \) log v, n) > log 3 \, $
  or $L v^(beta \/ 3) > 3^n R$. On the other hand, 6 and $upright(underline(R)) \( T \) = 3$ give $L v^(omega \/ 3) lt.eq 3^n R$. Since $v gt.eq 1$, the inequality $omega gt.eq beta$ is impossible. Therefore $omega < 1129 \/ 500$. ◻
]

For the rational exponent in this paper, the sufficient finite inequality has the equivalent integer form

$ L^1500 v^1129 > \( 3^n R \)^1500 . $

Thus the strict comparison does not depend on taking an asymptotic sum inequality at an infinite tensor or discarding an ancillary charge. The argument establishes an arithmetic exponent. It does not estimate the size of a useful finite implementation or its numerical stability.

== 9 Conditional labels and entropy <sec:trees>

Lemma 9 counted the total pairing volume supplied by successive labels. We now keep track of which pair of sides supplies each contribution. The input is a finite tree describing which label each pair can read; the output is a matrix-multiplication bound in terms of the three accumulated conditional entropies. Preserving previously read labels on every side is essential when the next reader pair changes.

#prodef([Definition 9.1.])[
  A #emph[readable label tree] for the support of a tensor is a finite rooted partition tree of the support whose leaves are in bijection with the supported monomials. Each monomial follows exactly one path. At each nonterminal node, conditional on the path to that node, the next child is a function of either of two specified side coordinates separately. The reader pair may vary with the node.
] <def:label-tree>

For a probability law $pi$ on the leaves, write $bb(P) \( nu \)$ for the mass passing through a node $nu$. Assign to each pair $U V$ the rate

$ r_(U V) \( pi \) = sum_(nu : thin upright("reader pair ") U V) bb(P) \( nu \) thin upright(H) \( upright("child") divides nu \) \, #h(2em) upright(H) \( p_1 \, dots.h \, p_q \) = - sum_i p_i log p_i . $

Zero-mass contributions are zero. The sum of the three rates is $upright(H) \( pi \)$.

This identity is the entropy chain rule #cite(label("shannon1948")) Section 6. The exact conditional counts below use the method of types #cite(label("csiszar1998")) Section II; the tensor restrictions and their full auxiliary costs are proved explicitly.

#thm([Theorem 9.2.])[
  (Conditional-label entropy bound).  #emph[If a tensor of cost $e^C$ has a readable label tree, then 
$ W \( r_(X Y) \( pi \) \, r_(X Z) \( pi \) \, r_(Y Z) \( pi \) \) lt.eq C quad "(9.1)" $ <eq:entropy-bound>

 for every leaf law $pi$.]
] <thm:entropy>

#proof[
  First suppose $pi$ is rational and take $n$ with all $n pi_s$ integral. Prescribe the resulting counts at every node. Process nonterminal nodes in any order in which a parent precedes its children.
  The induction invariant is that the current tensor is a direct sum over all processed word choices, and that each side identifies the entire processed prefix. Within a summand, the tensor is the original word-support fiber times the dot factors already introduced. At the root this invariant is trivial.
  Consider a node $nu$ occurring in $s$ positions, with child counts $s_1 \, dots.h \, s_q$. Within a prefix summand, all sides know these positions. The two readers can therefore project to child words with those counts and apply Lemma 3.3 with
  $ K_nu = binom(s, s_1 \, dots.h \, s_q) . $
  The new tag makes the chosen child word visible on the third side. All previous dot indices are carried unchanged, so the invariant continues.
  Exactly one auxiliary tensor is used for this node, even if its positions vary between prefix summands. Indeed,
  $ (xor.big_p T_p) ⊗ A_(K_nu) = xor.big_p \( T_p ⊗ A_(K_nu) \) . $
  The prefix blocks are disjoint on all three sides, so the restrictions within them may depend on $p$. The number $K_nu$ depends only on the prescribed counts, not on the positions of a particular prefix. If $s = 0$, take $K_nu = 1$ and do nothing.
  At the end, every surviving original word is a specified monomial word with leaf histogram $n pi$. Its scalar coefficient is nonzero and can be absorbed by a local rescaling in that summand. The remaining tensor is a matrix product of dot factors, with pair sizes
  $ l_(U V) \( n \) = product_(nu : thin upright("reader pair ") U V) K_nu . $
  These sizes do not depend on the particular surviving word. The number of summands is
  $ M \( n \) = frac(n !, product_s \( n pi_s \) !) = product_nu K_nu . quad "(9.2)" $ <eq:multinomial-telescope>
  The second equality is the cancellation of child factorials with parent factorials; it also counts the successive choices of words. Every such word survives all the restrictions.
  The full cost of this construction is
  $ e^(n C) product_nu \| G_(K_nu) \| . $
  For the fixed finite tree and law, a node with positive conditional entropy has $log K_nu$ linear in $n$ up to $O \( log n \)$; a deterministic node has $K_nu = 1$. The logarithmic factorial estimate and Lemma 3.3 therefore give
  $ frac(log l_(U V) \( n \), n) arrow.r r_(U V) \( pi \) \, #h(2em) log #h(-1em) (product_nu \| G_(K_nu) \|) - log M \( n \) = o \( n \) . $
  Apply 4 at each fixed $n$, divide by $n$, and use homogeneity and continuity from 2. This proves (9.1). Finally approximate an arbitrary law by rational laws. All the finite entropies, and $W$, are continuous. ◻
]

#thm([Corollary 9.3.])[
  (Balancing two axes).  #emph[Fix a side $L$. Let $S$ be the sum of the two rates incident to $L$, and let $T$ be the remaining rate. Then 
$ W \( S \/ 2 \, T \, S \/ 2 \) lt.eq C . quad "(9.3)" $ <eq:balanced-rate>

 For $C > 0$, the normalized pairs $\( S \/ C \, T \/ C \)$ from different constructions may be combined convexly and decreased coordinatewise while retaining the normalized bound.]
] <cor:balance>

#proof[
  Average (9.1) with the estimate exchanging the two incident axes, using permutation invariance, subadditivity and homogeneity. The same properties justify convex combinations after normalizing each bound by its cost. Monotonicity permits coordinatewise decrease, and continuity permits closure. ◻
]

The auxiliary cost in 40 is not suppressed. Its exponential contribution is precisely what the multiplicity (9.2) cancels after 4. This exact accounting is what permits many successive conditional separations.

== 10 Recursive completion trees <sec:completion>

This section constructs the finite trees to which the entropy bound will be applied. Two small tensors supply the starting points; a local degeneration preserves three readable color flags through repeated completions, and a final deletion makes the entire tree readable.

We use colors $sans(B) \, sans(A) \, sans(C)$ owned by $X \, Z \, Y$, respectively. A #emph[three-flag tensor] is a W-partition, as in Section 3.4, together with a conditional readable tree on the support of each color. Thus exactly one color is assigned to each supported monomial, and its owning side reads whether that color’s flag is on. The additional trees will let us continue separating labels after a completion has identified a color word.

=== 10.1 Two starting tensors <two-starting-tensors>

The second starting tensor is the five-term tensor $T'$ from (3.9), obtained from the $q = 1$ Coppersmith–Winograd tensor #cite(label("cw")) Section 7. We retain its color flags and make the conditional trees explicit. The formulas below give short polynomial witnesses for both starting budgets.

The first base has budget $R = 2$ and support

$ sans(B) = { 100 } \, #h(2em) sans(A) = { 001 } \, #h(2em) sans(C) = { 010 } . $

It is the coefficient of order one in

$ \( x_0 + t x_1 \) \( y_0 + t y_1 \) \( z_0 + t z_1 \) - x_0 y_0 z_0 \, $

whose constant coefficient is zero. Its conditional trees are trivial.

The second base has budget $R = 3$ and support

$ sans(A) = { 002 \, 011 } \, #h(2em) sans(B) = { 200 \, 110 } \, #h(2em) sans(C) = { 020 } . quad "(10.1)" $ <eq:five-term-base>

The triples give indices on $X \, Y \, Z$, with unit coefficients. The flag tests are $z > 0$, $x > 0$, and $y = 2$. Within $sans(A)$, the choice is read by $Y \, Z$; within $sans(B)$, it is read by $X \, Y$.

To verify the budget, put

$ P \( t \) = \( x_0 + t x_1 + t^2 x_2 \) \( y_0 + t y_1 + t^2 y_2 \) \( z_0 + t z_1 + t^2 z_2 \) . $

The first coefficient of $P \( t \) + P \( - t \) - 2 P \( 0 \)$ is twice the sum of the six monomials with index sum two; the family has rank at most three. Now give weight one to $x_1 \, z_1 \, y_0 \, y_2$ and weight zero to all other variables. The term $101$ has total weight three and the other five terms have weight one. The leading part is exactly (10.1).

=== 10.2 Completion and termination <completion-and-termination>

#prodef([Definition 10.1.])[
  A completion of size $m gt.eq 2$ with center $i$ takes $m$ copies of a three-flag tensor and retains the color words in which at most one distinct noncenter color occurs. A pure-center word has new color $i$; otherwise its new color is the unique noncenter color $j$ that occurs.
] <def:completion>

#thm([Lemma 10.2.])[
  #emph[Completion is a local leading-term degeneration. It produces another three-flag tensor with conditional readable trees. If the old tensor contains $b$ base factors of budget $R$, the new one has $m b$ such factors and budget $R^(m b)$.]
] <lem:completion>

#proof[
  Use the local tests from Lemma 10, with color $i$ as center. On the center’s owning side, give weight one to coordinates for which all $m$ old center flags are on. On each noncenter’s owning side, give weight one when any old flag of that color is on. All other weights are zero. For a supported color word, the total weight is
  $ upright(bold(1))_({ upright("all center") }) + sum_(j eq.not i) upright(bold(1))_({ upright("some ") j }) . $
  It equals one exactly on the desired words, and two if both noncenter colors occur. The same tests supply the new solo flags.
  Conditional on new color $j eq.not i$, the word uses only $i \, j$ and contains at least one $j$. The owning side of $i$ reads its positions, and the owning side of $j$ reads the complementary positions. Thus either side reads the complete color word. After that word is known, apply the old conditional trees successively in the slots. For new color $i$, the word is already determined and only the old trees are needed. All $m$ copies are charged, including slots with deterministic color. ◻
]

To terminate, delete one color using its owning flag. The choice between the two surviving colors is read by both their owning sides. Follow it with their conditional trees. This is a readable tree to which 40 applies.

A #emph[script] consists of a base, a finite list of completions, and a termination pair. Its base-factor count is

$ b = product_(upright("completions")) m $

(the empty product is one), and its cost before the auxiliary tensors of the readable tree are introduced is $R^b$. No conditional branch is exempt from this cost.

== 11 An exact finite-family optimization <sec:optimization>

For each completion script, the entropy bound gives many possible rate pairs, one for each leaf law. We compute their exact support function by optimizing a weighted sum of rates. A convex-geometric step then selects the best point at a prescribed rectangular shape.

Fix a distinguished side $L$ and a parameter $t gt.eq 0$. For two different colors $i \, j$, let

$ eta_(i j) = cases(delim: "{", 1 \, & upright("if their owning sides include ") L \,, t \, & upright("otherwise") .) $

A label read by those sides contributes with coefficient $eta_(i j)$ to the score $S + t T$.

For a conditional tree of color $i$, denote its maximum score by $V_i$. For base two, all three values start at zero. For base three they start at

$ V_(sans(A)) = eta_(sans(A) sans(C)) log 2 \, #h(2em) V_(sans(B)) = eta_(sans(B) sans(C)) log 2 \, #h(2em) V_(sans(C)) = 0 . quad "(11.1)" $ <eq:initial-scores>

A completion with center $i$ and size $m$ updates them simultaneously:

$ V_i^(upright("new")) & = m V_i \,\
V_j^(upright("new")) & = eta_(i j) log [(e^(V_i \/ eta_(i j)) + e^(V_j \/ eta_(i j)))^m - e^(m V_i \/ eta_(i j))] \, quad j eq.not i . quad "(11.2)" $ <eq:score-center>

For a termination keeping $i \, j$, the score is

$ D_(i j) = eta_(i j) log (e^(V_i \/ eta_(i j)) + e^(V_j \/ eta_(i j))) . quad "(11.3)" $ <eq:termination-score>

At weight zero, these expressions mean their continuous limits. Equivalently, replace a weighted log-sum by the maximum score of the allowed words. In particular, in (11.2) the all-$i$ word remains excluded; its zero-weight value is

$ max_(1 lt.eq q lt.eq m) #scale(x: 120%, y: 120%)[\(] \( m - q \) V_i + q V_j #scale(x: 120%, y: 120%)[\)] . $

#prodef([Definition 11.1.])[
  Let $cal(F)_7$ contain both bases, every list of at most seven completions with sizes $2$ or $3$ and arbitrary centers, every termination pair, and every distinguished side $L$. Define
  $ F \( t \) = max_(cal(F)_7) frac(D_(i j) \( t \), b log R) . quad "(11.4)" $ <eq:F-definition>
  For an available square exponent estimate $p gt.eq w \( 1 \)$, define
  $ F_p \( t \) = max { F \( t \) \, \( 2 + t \) \/ p } . $
] <def:support-function>

All ranges in this definition are finite. The recurrences use only three conditional scores per script, even though the underlying readable tree can be much larger.

The entropy maximization identity used below is the standard conjugacy between log-sum-exp and negative entropy #cite(label("boyd-vandenberghe")) Example 3.25. We include its elementary proof and the conditional-tree argument needed for these recurrences.

#thm([Lemma 11.2.])[
  #emph[The values in (11.1)–(11.3) are the exact maxima of $S + t T$ over their conditional or complete leaf laws. Thus $F$ is the support function, in direction $\( 1 \, t \)$, of the downward convex hull of the normalized rate pairs $\( S \/ \( b log R \) \, T \/ \( b log R \) \)$ from $cal(F)_7$.]
] <lem:score-optimality>

#proof[
  For $lambda > 0$, entropy optimization gives
  $ lambda log sum_d e^(a_d \/ lambda) = max_(\( p_d \)) {lambda upright(H) \( \( p_d \) \) + sum_d p_d a_d} . quad "(11.5)" $ <eq:gibbs>
  Jensen’s inequality applied to the logarithm proves the upper bound; the law proportional to $e^(a_d \/ lambda)$ attains it.
  For a noncenter completion branch, sum over all length-$m$ words in ${ i \, j }$ other than the all-$i$ word. For each such word the old optimal scores add across its slots. Condition on the color word and, as each slot is processed, on the histories already read in preceding slots. The remaining law in that slot is an admissible law for its old conditional tree, so its score is at most the corresponding old optimum. Summing gives the upper bound even for dependent slot laws. Independent conditional maximizing laws attain it. Equation (11.5) now gives (11.2). The center and termination formulas follow in the same way. The zero-weight cases follow by continuity on the compact leaf-law simplex.
  Taking the maximum over scripts gives the claimed support values; convexification and downward closure do not change them for nonnegative weights. ◻
]

The geometric step uses the supporting-halfspace description of a closed convex set #cite(label("rockafellar-wets")) Theorem 8.24. The reduction to a ray and the restriction of the parameter interval are proved below for this family. Let $cal(H)_F$ be the closed downward convex hull of the normalized rate pairs in Lemma 45, and let $cal(H)_(F_p)$ also include the square rate point $\( 2 \/ p \, 1 \/ p \)$ before taking that hull. These hulls are taken in the nonnegative quadrant. Their intersection with the ray $\( S \/ C \, T \/ C \) = \( 2 d \, k d \)$ determines the best balanced bound supplied by these rates.

#thm([Theorem 11.3.])[
  #emph[For $U = F$ or $U = F_p$, and $0 lt.eq k lt.eq 1$, the largest feasible scale on this ray is 
$ d_U \( k \) := max { d gt.eq 0 : \( 2 d \, k d \) in cal(H)_U } = min_(0 lt.eq t lt.eq 1) frac(U \( t \), 2 + k t) . quad "(11.6)" $ <eq:radial-optimum>

 Consequently, 
$ w \( k \) lt.eq frac(1, d_U \( k \)) = max_(0 lt.eq t lt.eq 1) frac(2 + k t, U \( t \)) . quad "(11.7)" $ <eq:functional-bound>

 A maximizing parameter is the leftmost $t in \[ 0 \, 1 \]$ for which 
$ \( 2 + k t \) U'_(+) \( t \) gt.eq k U \( t \) \, quad "(11.8)" $ <eq:contact-rule>

 or $t = 1$ if no such point exists.]
] <thm:shape-optimization>

#proof[
  By 41, a point $\( 2 d \, k d \) in cal(H)_U$ with $d > 0$ yields $w \( k \) lt.eq 1 \/ d$. Supporting hyperplanes in nonnegative directions give
  $ d_U \( k \) = inf_(t gt.eq 0) frac(U \( t \), 2 + k t) . $
  The pure second-coordinate constraint is the limit as $t arrow.r oo$. One may equivalently extend the hull downward to all of $bb(R)^2$; every finite supporting normal is then nonnegative. Continuity of $W$ justifies the closed hull and boundary points.
  At $t = 1$, the score is total leaf entropy and is independent of which side is distinguished. Average a maximizing construction over the three choices of that side. This gives the feasible point
  $ \( 2 U \( 1 \) \/ 3 \, U \( 1 \) \/ 3 \) . $
  The square point already has that ratio if it is a maximizer. Consequently $U \( t \) gt.eq \( 2 + t \) U \( 1 \) \/ 3$, and for $t gt.eq 1$, $k lt.eq 1$,
  $ frac(2 + k t, U \( t \)) lt.eq frac(3 \( 2 + k t \), \( 2 + t \) U \( 1 \)) lt.eq frac(2 + k, U \( 1 \)) . $
  The last value occurs at $t = 1$, so larger $t$ can be omitted. The averaged point is strictly positive in both coordinates, and $U$ is positive and continuous on $\[ 0 \, 1 \]$. Thus the infimum is the minimum in (11.6); taking reciprocals proves (11.7).
  Finally $U$ is convex as a support function. Put $G \( t \) = \( 2 + k t \) U'_(+) \( t \) - k U \( t \)$. For $0 lt.eq x < y$, the convex secant inequality gives $U \( y \) - U \( x \) lt.eq \( y - x \) U'_(+) \( y \)$, and hence
  $ G \( y \) - G \( x \) gt.eq \( 2 + k x \) #scale(x: 120%, y: 120%)[\(] U'_(+) \( y \) - U'_(+) \( x \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  Thus the right derivative of $U \( t \) \/ \( 2 + k t \)$, whose sign is the sign of $G \( t \)$, changes from negative to nonnegative at the first contact in (11.8). This identifies its minimum, including endpoints, upward slope jumps and contact intervals. ◻
]

The theorem supplies a finite mathematical prescription for every aspect ratio. For an active script, (11.5) gives exposed leaf laws. At a nonsmooth contact, convex combinations of points on the exposed face meet the desired ray. Coordinatewise decrease is also allowed. These laws and combinations can be approximated as in 40. No assertion that one center sequence is numerically optimal is needed.

Smaller script lists give valid subfamilies, while allowing more completions gives further valid bounds. The truncation to $t lt.eq 1$ uses all three distinguished-side choices; they should be retained when such subfamilies are formed.

== 12 Three parameter certificates <sec:certificates>

We now select three scripts in $cal(F)_7$ and specify their leaf laws. The first two establish the dual-exponent and rectangular conclusions of Theorem 1.1. The third records the square bound $omega < 2.267$ achieved by this finite family, independently of the stronger square construction in Theorem 1.1. The inequalities in this section use rational enclosures, not numerical feasibility assumptions.

=== 12.1 A dual-exponent witness <subsec:dual>

Use base two, distinguished side $X$, and its color $sans(B)$. After $b$ base factors, regard the $X$-coordinates as binary words of length $b$; the logarithmic base cost is $b log 2$. We seek a final leaf law for which $X$ is uniform on all these words and $S = upright(H) \( X \) = b log 2$. By 41 and the output-size lower bound, such a law gives

$ w #h(-1em) (min { 1 \, 2 T \/ \( b log 2 \) }) = 2 . $

The construction will preserve the exact incident-entropy equality while increasing the nonincident entropy $T$.

To identify what preserves this equality, let $X$ also denote the random coordinate induced by a leaf law on a readable tree, including a tree conditional on one color. At a node $nu$, conditioning means that the path reaches that node, and the conditional mutual information is

$ upright(I) \( X \; upright("child") divides nu \) = upright(H) \( X divides nu \) - upright(H) \( X divides upright("child") \, nu \) . $

Since a leaf determines $X$, successive conditioning at the nonterminal nodes telescopes to

$ upright(H) \( X \) = sum_nu bb(P) \( nu \) thin upright(I) \( X \; upright("child") divides nu \) . $

At an incident node the child is a function of $X$ and the prefix, so its mutual information is $upright(H) \( upright("child") divides nu \)$. Subtracting these incident contributions gives

$ upright(H) \( X \) - S = sum_(nu upright(" nonincident")) bb(P) \( nu \) thin upright(I) \( X \; upright("child") divides nu \) . quad "(12.1)" $ <eq:information-leakage>

The terms on the right are nonnegative. Thus $S = upright(H) \( X \)$ precisely when every nonincident choice at a positive-mass node is independent of $X$, conditional on the preceding choices.

We maintain this equality separately within each color. Partition the binary words into an active set $P$ and its complement $Q$, with the following properties:

+ color $sans(B)$ permits precisely $P$, while each other color permits precisely $Q$;
+ the chosen conditional law of each color makes $X$ uniform on its permitted set;
+ its conditional incident entropy is exactly the logarithm of that set’s size.

Write $rho = \| P \| \/ 2^b$, and let $h_i$ be color $i$’s nonincident entropy; initially $\( rho \, b \, h_i \) = \( 1 \/ 2 \, 1 \, 0 \)$.

#thm([Lemma 12.1.])[
  #emph[The maintained properties are preserved by the following laws. At a completion centered on $sans(B)$ of size $m$, 
$ rho' & = rho^m \, & h'_(sans(B)) & = m h_(sans(B)) \,\
h'_i & = m (frac(rho - rho', 1 - rho') h_(sans(B)) + frac(1 - rho, 1 - rho') h_i) &  & \( i = sans(A) \, sans(C) \) . quad "(12.2)" $ <eq:minus-rho>

 At a completion centered on $i in { sans(A) \, sans(C) }$, with $j$ the other inactive color, 
$ rho' & = 1 - \( 1 - rho \)^m \, & h'_(sans(B)) & = m (rho / rho' h_(sans(B)) + frac(rho' - rho, rho') h_i) \,\
h'_i & = m h_i \, & h'_j & = log [\( e^(h_i) + e^(h_j) \)^m - e^(m h_i)] . quad "(12.3)" $ <eq:plus-rho>

 In both cases $b' = m b$.]
] <lem:uniform-update>

#proof[
  At a $sans(B)$-centered completion, the new active set is $P^m$. A uniform word in its complement determines the $sans(B) \/ i$ pattern from its $P \/ Q$ membership in each slot. This pattern is an incident label. Conditioning on not all slots being active, the expected proportions of old $sans(B)$ and old $i$ slots are
  $ frac(rho - rho^m, 1 - rho^m) \, #h(2em) frac(1 - rho, 1 - rho^m) . $
  Use independent old conditional laws in those slots. They give the required uniform $X$-law and (12.2). Their old nonincident choices retain independence of the relevant $X$-coordinates, so (12.1) gives the incident entropy equality.
  At a completion centered on inactive $i$, the new inactive set is $Q^m$. For new color $sans(B)$, the $sans(B) \/ i$ pattern is again determined by $X$; conditioning on at least one active slot gives the expected proportion $rho \/ rho'$ of old $sans(B)$ slots. This proves (12.3).
  For new color $j$, every slot has an old color in ${ i \, j }$, with at least one $j$. Both old colors have exactly the same uniform $X$-marginal on $Q$. Consequently every such pattern has the same uniform marginal on $Q^m$, independently of the law chosen for the pattern. The pattern label is nonincident, and is independent of the entire $X$-word. Optimize its entropy plus the old nonincident scores by (11.5), with weight one. This gives (12.3). The old independent slot laws preserve the zero terms on the right of (12.1). Pure-center words use only the old $i$-law, proving the remaining formula. ◻
]

Terminate by keeping $sans(B)$ and the inactive color with larger $h$, placing mass $rho$ on $sans(B)$. The incident termination label and the uniform conditional laws make $X$ uniform on all $2^b$ binary words. Hence

$ S = b log 2 \, #h(2em) T = b D \, #h(2em) D = frac(rho h_(sans(B)) + \( 1 - rho \) max \( h_(sans(A)) \, h_(sans(C)) \), b) . quad "(12.4)" $ <eq:flat-rates>

By 41 and the size lower bound,

$ alpha gt.eq min { 1 \, 2 D \/ log 2 } . quad "(12.5)" $ <eq:alpha-certificate>

Use the following seven completions:

$ - 2 \, quad + 2 \, quad + 2 \, quad - 3 \, quad + 2 \, quad - 2 \, quad + 3 . quad "(12.6)" $ <eq:dual-script>

A minus sign means center $sans(B)$. A plus sign means the inactive color with larger $h$, with an arbitrary fixed tie choice. The absolute value is the completion size. Resolving the first tie as $sans(A)$, the centers are $sans(B) \, sans(A) \, sans(C) \, sans(B) \, sans(C) \, sans(B) \, sans(A)$.

For a short certificate, set $delta = \| h_(sans(A)) - h_(sans(C)) \|$. A minus step leaves $D$ unchanged and gives

$ delta' = frac(m \( 1 - rho \), 1 - rho^m) delta . $

At a plus step put

$ z = log #scale(x: 120%, y: 120%)[\(] \( 1 + e^(- delta) \)^m - 1 #scale(x: 120%, y: 120%)[\)] . $

Substitution in 47 yields

$ delta' = \| z \| \, #h(2em) D' = D + frac(1 - rho', m b) max { 0 \, z } . quad "(12.7)" $ <eq:delta-D>

Indeed $h_i$ is the larger inactive entropy, and $h'_j = m h_i + z$, so the new maximum is $m h_i + max { 0 \, z }$.

After the first three steps, at $b = 8$,

$ rho_8 = 1 - \( 3 \/ 4 \)^4 \, #h(2em) delta_8 = log \( 9 \/ 7 \) \, #h(2em) D_8 = 0.5625 / 4 log 3 . $

The two plus steps here have $z = log 3$ and $z = log \( 7 \/ 9 \)$. The subsequent bounds are

$ b & upright("certified information")\
24 & rho_24 = rho_8^3 \, quad 0.3194 < rho_24 < 0.3195 \, quad 0.348 < delta_24 < 0.354\
48 & 1 - rho_48 = \( 1 - rho_24 \)^2 > 0.463 \, quad 0.536 < rho_48 < 0.537 \, quad 0.635 < z_48 < 0.651\
96 & rho_96 = rho_48^2 \, quad delta_96 = 2 delta_48 \/ \( 1 + rho_48 \) < 0.86\
288 & 1 - rho_288 = \( 1 - rho_48^2 \)^3 > 0.360 \, quad z_288 > 0.628 . $

Their elementary verification is given in 12.4. Since $log 2 < 0.6932$ and $log 3 > 1.098$,

$ frac(2 D_288, log 2) & > 2 / 0.6932 [frac(0.5625 dot.op 1.098, 4) + frac(0.463 dot.op 0.635, 48) + frac(0.360 dot.op 0.628, 288)]\
 & = 1548637 / 3327360 > 0.465 . quad "(12.8)" $ <eq:alpha-rational>

This proves the dual-exponent conclusion without any approximate equality being used to certify exponent two.

=== 12.2 A one-parameter rectangular curve <subsec:curve>

Use base three, one size-three completion centered on $sans(A)$, keep $sans(B) \, sans(C)$, and distinguish $X$. This is the 75-component support of 11; the leaf law below tunes its two balanced outer dimensions and its inner dimension. Every word in ${ 0 \, 1 \, 2 }^3$ occurs on $X$. For a nonzero word $x$, its outer color is $sans(B)$, and the number of supported leaves in its fiber is $d \( x \) = 2^(\# { upright("zero entries of ") x })$. For the zero word, its outer color is $sans(C)$, and $d \( 0 \) = 3^3 - 2^3 = 19$. The fiber histogram is therefore

$ d & 1 & 2 & 4 & 19\
\# { x : d \( x \) = d } & 8 & 12 & 6 & 1 . $

The total number of leaves is $75$.

Give $x$ probability proportional to $d \( x \)^t$, and choose a leaf uniformly within its fiber. Put

$ Z \( t \) & = 8 + 12 thin 2^t + 6 thin 4^t + 19^t \,\
g \( t \) & = \( log Z \)' \( t \) \, #h(2em) h \( t \) = log Z \( t \) - t g \( t \) . quad "(12.9)" $ <eq:curve-functions>

Then $upright(H) \( X \) = h \( t \)$ and $upright(H) \( upright("leaf") divides X \) = g \( t \)$. In the nonzero branch, the $sans(A) \/ sans(B)$ pattern and the choices within $sans(B)$ are incident to $X$; the choices within $sans(A)$ are hidden on $Y \, Z$. In the zero branch all choices after branching are on $Y \, Z$. The outer $sans(B) \/ sans(C)$ label is incident to $X$. To check that the hidden choices do not leak information about $X$, fix a nonzero outer branch and its $sans(A) \/ sans(B)$ pattern. Then $d \( x \) = 2^(\# sans(A))$ is constant over that pattern. Each leaf has probability $d \( x \)^(t - 1) \/ Z \( t \)$, so the hidden choices in its $sans(A)$-slots are independent of the remaining $X$-coordinates, including after any preceding slot histories. The zero branch has fixed $X$. The information identity (12.1) therefore gives precisely $S = h \( t \)$, $T = g \( t \)$. Its base cost is $3^3$, and 41 gives

$ w #h(-1em) (frac(2 g \( t \), h \( t \))) lt.eq frac(6 log 3, h \( t \)) . quad "(12.10)" $ <eq:curve-bound>

Here $w \( k \) = W \( 1 \, k \, 1 \)$ can also be read for $k > 1$; we use only aspect ratios in $\[ 0 \, 1 \]$.

At $t = 2 \/ 3$, write $u = 2^(2 \/ 3)$, $v = 19^(2 \/ 3)$. Then

$ g = frac(12 u \( 1 + u \) log 2 + v log 19, 8 + 12 u + 6 u^2 + v) . $

Cubing verifies

$ 1.58739 < u < 1.58742 \, #h(2em) 7.1203 < v < 7.1205 \, #h(2em) 49.2878 < Z < 49.2890 . $

Using the logarithm bounds below gives

$ 1.11844 < g < 1.11856 \, #h(2em) 3.1519 < h < 3.1522 . $

In particular

$ frac(2 g, h) > frac(2 dot.op 1.11844, 3.1522) > 0.709 \, #h(2em) frac(6 log 3, h) < frac(6 dot.op 1.0987, 3.1519) < 2.092 . $

Monotonicity proves $w \( 0.709 \) < 2.092$.

=== 12.3 A finite-family square witness <subsec:square>

Use base three and the completions

$ \( sans(B) \, 2 \) \, quad \( sans(A) \, 3 \) \, quad \( sans(C) \, 2 \) \, quad \( sans(B) \, 2 \) \, quad \( sans(A) \, 3 \) \, $

then keep $sans(B) \, sans(C)$. The number of original factors is $b = 72$. Let $d_i$ be the number of conditional monomials of color $i$. Initially $\( d_(sans(B)) \, d_(sans(A)) \, d_(sans(C)) \) = \( 2 \, 2 \, 1 \)$. A size-$m$ completion at $i$ updates counts to

$ d_i^m quad upright("at ") i \, #h(2em) \( d_i + d_j \)^m - d_i^m quad upright("at ") j eq.not i . $

After three steps the vector is $\( 20691584 \, 13993344 \, 10144225 \)$. After four it is

$ \( 428141648429056 \, #h(0em) 774902581936128 \, #h(0em) 522705468255425 \) med gt.eq med 10^12 \( 428 \, 774 \, 522 \) $

coordinatewise. The final sum of the kept counts is

$ N = 2995461856366867388223311649574852466276480577 \, $

and in particular

$ N gt.eq 10^36 \( 1202^3 + 1296^3 - 2 dot.op 774^3 \) > 2.95 dot.op 10^45 . quad "(12.11)" $ <eq:square-count-lower>

The substitution of lower counts is legitimate: the polynomial $\( a + b \)^3 + \( a + c \)^3 - 2 a^3$ has nonnegative coefficients.

Under the uniform leaf law, the sum of the three pair rates is $log N$. Averaging over permutations balances all three at $log N \/ 3$. Thus 40 gives

$ w \( 1 \) lt.eq frac(3 dot.op 72 log 3, log N) < frac(216 dot.op 1.0987, 1.0817 + 45 dot.op 2.3025) < 2.267 . $

The three constructions above yield their stated bounds once the following elementary enclosures are verified.

=== 12.4 Elementary interval verification <subsec:log-certificate>

For $1 lt.eq y lt.eq 2$, put $s = \( y - 1 \) \/ \( y + 1 \)$. The logarithm series has the rational enclosure

$ 2 sum_(j = 0)^7 frac(s^(2 j + 1), 2 j + 1) lt.eq log y lt.eq 2 sum_(j = 0)^7 frac(s^(2 j + 1), 2 j + 1) + frac(2 s^17, 17 \( 1 - s^2 \)) . quad "(12.12)" $ <eq:log-series>

It follows by summing the positive series for $2 "arctanh" s$ and bounding its tail geometrically. For a positive rational $x$, write $x = 2^a y$ with $1 lt.eq y lt.eq 2$ and use $log x = a log 2 + log y$. Rational substitution in (12.12) gives

$ x & upright("bounds for ") log x\
2 & \( 0.69314 \, #h(0em) 0.69316 \)\
3 & \( 1.098 \, #h(0em) 1.0987 \)\
19 & \( 2.9444 \, #h(0em) 2.9445 \)\
\[ 49.2878 \, 49.2890 \] & \( 3.89765 \, #h(0em) 3.89772 \)\
9 \/ 7 & \( 0.250 \, #h(0em) 0.252 \)\
10 & > 2.3025\
2.95 & > 1.0817 . $

For the dual witness,

$ delta_24 = frac(3 \( 1 - rho_8 \), 1 - rho_8^3) log \( 9 \/ 7 \) \; $

the displayed bounds for $rho_24$ and $delta_24$ now use only rational arithmetic. Alternating Taylor bounds through degrees six and seven give

$ e^(- 0.354) > 0.701 \, #h(2em) e^(- 0.348) < 0.707 \, #h(2em) e^(- 0.86) > 0.4225 . $

Consequently the logarithm series at

$ \( 1 + 0.701 \)^2 - 1 \, quad \( 1 + 0.707 \)^2 - 1 \, quad \( 1 + 0.4225 \)^3 - 1 $

proves $0.635 < z_48 < 0.651$ and $z_288 > 0.628$. Also

$ delta_96 < frac(2 dot.op 0.651, 1 + 0.536) < 0.86 . $

The remaining $rho$ inequalities are direct rational powers. This verifies every inequality used in (12.8). The cube-root brackets and the expression for $g$ similarly verify the curve certificate.

For reference only, evaluation of the exact formulas gives

$ upright("quantity") & upright("approximate value")\
2 D_288 \/ log 2 & 0.466101554898\
2 g \( 2 \/ 3 \) \/ h \( 2 \/ 3 \) & 0.709698932519\
6 log 3 \/ h \( 2 \/ 3 \) & 2.091251835621\
216 log 3 \/ log N & 2.266187438999 . $

The proofs above rely on the rational inequalities, not these decimal approximations. The accompanying certificate scripts reproduce the finite support/count calculations and all stated rational enclosures. In a fresh writable copy of #raw("verification/certificates/"), the command #raw("python3 checks/run_checks.py") uses integer and rational arithmetic from the Python standard library; its three checkers separately verify the numerical inequalities, finite supports and counts, and declared baseline data. The optional numerical diagnostics are not used in these certificates.

== 13 Comparison with ordinary combinations <sec:comparison>

Theorem 1.1 supplies the square estimate needed by 50 at $p = 2.258$. We retain the general statement for any available square estimate $w \( 1 \) lt.eq p$ with $2 < p lt.eq 2.258$, together with the specified baseline and the hypotheses on further inputs below. We also give a comparison through aspect ratio $0.93$ using only the finite-family witnesses of 12 on the new-algorithm side.

We compare upper-bound estimates, not unknown exact values of $W$. A #emph[cost tuple] $\( a \, b \, c \; e \)$ records the certified estimate $W \( a \, b \, c \) lt.eq e$. The operations considered below act on such recorded estimates.

#prodef([Definition 13.1.])[
  For $p > 2$, the table baseline $cal(B)_p$ is generated by:
  + the numerical entries of Table 1 of #cite(label("vxxz")) #cite(label("advxxz")), with the exponent-two endpoint entered as $\( 1 \, 0.321334 \, 1 \; 2 \)$;
  + the square input $\( 1 \, 1 \, 1 \; p \)$;
  + the naive matrix-multiplication estimates.
  We close these inputs under permutations, scaling, tensor products, padding, ordinary blocking and convex interpolation. Ordinary subdivisions into products covering an index box may also be used. More precise input values may be substituted if their separator tests below are verified.
] <def:baseline>

We use Table 1 of arXiv:2307.07970v2 and arXiv:2404.16349v3. The latter’s version 2 has the same listed rectangular entries; the updated square entry does not affect the argument. This definition makes the numerical baseline reproducible. It does not assert that the tables exhaust every possible parameter choice in the source algorithms.

=== 13.1 A separator preserved by the baseline operations <a-separator-preserved-by-the-baseline-operations>

Let

$ q_(*) = 0.45 \, #h(2em) v_p = frac(p - 2, 1 - q_(*)) \, #h(2em) u_p = 1 - frac(q_(*) v_p, 2) \, #h(2em) 2 < p lt.eq 2.258 . quad "(13.1)" $ <eq:plane-parameters>

Then $0 < v_p lt.eq u_p lt.eq 1$. For a triple with smallest coordinate $c$, put

$ P_p \( a \, b \, c \) = u_p \( a + b \) + v_p c . quad "(13.2)" $ <eq:plane>

Equivalently, without ordering the coordinates,

$ P_p \( a \, b \, c \) = u_p \( a + b + c \) + \( v_p - u_p \) min \( a \, b \, c \) \, $

the maximum of the three linear forms that assign $v_p$ to one coordinate and $u_p$ to the other two.

#thm([Lemma 13.2.])[
  #emph[The condition $e gt.eq P_p \( a \, b \, c \)$ is preserved by all the operations in 48. The square input satisfies it with equality, and the naive estimates satisfy it.]
] <lem:plane-preservation>

#proof[
  Each of the three linear-form tests adds under tensor products, positive scaling and convex interpolation; this proves the condition for the maximum as well. It is invariant under permutations and monotone in the dimensions. Padding therefore preserves it. Increasing one dimension’s exponent by $d$ changes $P_p$ by at most $d$, because all slopes lie in $\[ 0 \, 1 \]$; ordinary blocking adds $d$ to the cost.
  The corresponding weighted-box inequality also holds. For a box of side lengths $L_i$, normalize the side lengths of a contained subbox to ratios $r_i in \[ 0 \, 1 \]$. For any of the weight triples $\( u_p \, u_p \, v_p \)$, $product_i r_i^(w_i) gt.eq product_i r_i$. If subboxes cover the original box, their volume ratios sum to at least one. Hence the weighted size of the whole box is at most the sum of the weighted sizes of the covering boxes. Intersecting with the original box first handles boxes extending outside it. Thus summing declared costs for ordinary subdivided products cannot cross the separator either. Precisely, at scale $n$ the tuple $\( a \, b \, c \; e \)$ declares a charge $n^e$ for a box with side lengths $n^a \, n^b \, n^c$. Apply the covering inequality to these charges before taking exponent limits; it remains valid for subdivisions depending on $n$.
  Finally $2 u_p + v_p = 2 + \( 1 - q_(*) \) v_p = p$, and all weights are at most one. These give the square and naive assertions. ◻
]

For any additional old input it suffices to check the plane at $p = 2.258$ together with the usual size bound. Indeed, after ordering,

$ P_p \( a \, b \, c \) = a + b + v_p #scale(x: 120%, y: 120%)[\(] c - q_(*) \( a + b \) \/ 2 #scale(x: 120%, y: 120%)[\)] . $

If the parenthesis is nonnegative, this increases with $p$. Otherwise it is at most the size bound $a + b$.

For shapes $\( 1 \, ell \, 1 \)$, the test at $p = 2.258$ is

$ P_2.258 \( 1 \, ell \, 1 \) = cases(delim: "{", 2 + 0.258 / 0.55 \( ell - 0.45 \) \, & 0 lt.eq ell lt.eq 1 \,, u_2.258 \( 1 + ell \) + v_2.258 \, & ell gt.eq 1 .) quad "(13.3)" $ <eq:shape-plane>

If $ell lt.eq 0.45$, or $ell gt.eq 2 \/ 0.45 - 1$, it already follows from the size bound. Between those regimes the following downward roundings of the published entry values suffice. They are bounds on the #emph[reported costs], not lower bounds on matrix-multiplication exponents.

$ ell & .50 & .527 upright("–") .528 & .55 & .60 & .65 \, .70 & .75 \, .80 & .85 \, .90 \, .95 & 1\
upright("entry at least") & 2.04 & 2.05 & 2.06 & 2.09 & 2.12 & 2.18 & 2.24 & 2.36 $

$ ell & 1.10 \, 1.20 & 1.50 & 2 & 2.50 & 3\
upright("entry at least") & 2.44 & 2.71 & 3.16 & 3.60 & 4.05 . $

For example, the newer entries at $ell = .50 \, .60 \, .70$ are $2.042776 \, 2.092351 \, 2.152770$, respectively #cite(label("advxxz")). All displayed roundings satisfy (13.3) by substitution. The other entries either lie in the automatic size-bound region or are covered by these grouped tests. It follows from 49 that every estimate generated by $cal(B)_p$ remains on or above $P_p$.

=== 13.2 The strict improvement interval <the-strict-improvement-interval>

#thm([Proposition 13.3.])[
  #emph[Assume $2 < p lt.eq 2.258$ and $w \( 1 \) lt.eq p$. Against $cal(B)_p$, the new bounds are strictly better for $0.321334 < k < 1$. More generally they improve any separator-satisfying baseline throughout the part of $0 < k < 1$ on which that baseline exceeds two.]
] <prop:comparison>

#proof[
  For $k lt.eq 0.465$, (12.8) gives $w \( k \) = 2$. For $0.465 < k < 1$, convexity and the available square point give
  $ w \( k \) lt.eq 2 + frac(p - 2, 1 - 0.465) \( k - 0.465 \) . $
  The difference between the separator at $\( 1 \, k \, 1 \)$ and this line is
  $ frac(\( p - 2 \) \( 1 - k \) \( 0.465 - 0.45 \), \( 1 - 0.45 \) \( 1 - 0.465 \)) > 0 . quad "(13.4)" $ <eq:positive-gap>
  This proves the general assertion.
  It remains to identify the exponent-two range of the specified table baseline, including limits of ordinary combinations. Put $q_0 = 0.321334$. For each of the finitely many table inputs, order its dimensions so that $c$ is smallest and write
  $ d = c - q_0 \( a + b \) \/ 2 \, #h(2em) E = e - a - b . $
  Every entry has $E gt.eq 0$, and every entry with $d > 0$ has $E > 0$: the only table entries attaining the size bound have $2 c \/ \( a + b \) lt.eq q_0$. Choose $eta > 0$ such that
  $ eta lt.eq 1 / 2 \, #h(2em) eta lt.eq frac(p - 2, 1 - q_0) \, #h(2em) eta lt.eq E / d quad upright("for every table entry with ") d > 0 . $
  Such a choice exists because the list is finite and all the relevant ratios are positive. Set $u_0 = 1 - q_0 eta \/ 2$. Then $0 < eta lt.eq u_0 lt.eq 1$, and every table input satisfies
  $ e gt.eq u_0 \( a + b \) + eta c = a + b + eta d . $
  For $d lt.eq 0$ this follows from the size bound; for $d > 0$ it follows from the choice of $eta$. The square input satisfies the same test since $2 u_0 + eta = 2 + \( 1 - q_0 \) eta lt.eq p$; naive inputs also satisfy it. The proof of 49 applies verbatim to the weights $\( u_0 \, u_0 \, eta \)$, including its weighted-box argument for subdivisions. Every baseline estimate at $\( 1 \, k \, 1 \)$, and every limit of such estimates, is therefore at least
  $ 2 + eta \( k - q_0 \) > 2 #h(2em) \( k > q_0 \) . $
  The recorded endpoint and padding give cost two for $k lt.eq q_0$. Thus the baseline has flat endpoint exactly $q_0$, and the general assertion gives the claimed open interval. ◻
]

The endpoint at one is excluded because the comparison uses the same square point on both sides. By Theorem 1.1, $w \( 1 \) < 2.258$, so 50 applies at $p = 2.258$ and proves strict improvement over $cal(B)_2.258$ throughout $0.321334 < k < 1$. If a more precise old exponent-two endpoint is supplied, the same statement uses that endpoint in place of the rounded table entry. No strict improvement is asserted where the baseline already gives two.

There is also a comparison using only the constructions in $cal(F)_7$. Interpolate their three proved points

$ \( 0.465 \, 2 \) \, #h(2em) \( 0.709 \, 2.092 \) \, #h(2em) \( 1 \, 2.267 \) . $

Against the numerical $p = 2.258$ separator, the comparisons at $k = 0.465 \, 0.709 \, 0.93$ are

$ k & 0.465 & 0.709 & 0.93\
upright("new line") & 2 & 2.092 & 2.224903780 dots.h\
upright("separator") & 2.007036363 dots.h & 2.121494545 dots.h & 2.225163636 dots.h . $

Both differences are affine on the intervening segments. The smallest endpoint margin is greater than $0.0002598$; these inequalities also follow directly from rational arithmetic. Thus this finite family improves that numerical baseline through $k = 0.93$, in addition to the flat-range improvement.

=== 13.3 A sufficient test for further old estimates <a-sufficient-test-for-further-old-estimates>

The table comparison can be extended without evaluating a large nonconvex parameter program, provided the extra input estimates satisfy an explicit condition. Let $f$ be the convex upper-bound envelope from such old estimates #emph[before] adding the new square point. Suppose

$ f \( .50 \) gt.eq 2.035 \, #h(2em) f \( .60 \) gt.eq 2.087 \, quad "(13.5)" $ <eq:old-envelope-assumption>

and include the known estimates

$ f \( .40 \) lt.eq 2.010 \, quad f \( .50 \) lt.eq 2.043 \, quad f \( .60 \) lt.eq 2.093 \, quad f \( .70 \) lt.eq 2.154 . $

Condition (13.5) concerns the specified envelope of estimates. The published record values alone do not prove it for every possible untabulated parameter choice.

#thm([Proposition 13.4.])[
  #emph[Under (13.5), every such additional input satisfies the separator test.]
] <prop:extra-inputs>

#proof[
  If an input $\( a \, b \, c \; e \)$, with $c$ smallest, violated the test, average its two large axes and normalize by $\( a + b \) \/ 2$. It would give a violating balanced input at $x = 2 c \/ \( a + b \) in \[ 0 \, 1 \]$. The case $x lt.eq .45$ is excluded by the size bound. For the rest, convexity extends a chord beyond its endpoints as a lower bound. Using a lower bound at the nearer endpoint and an upper bound at the farther one gives
  $ x upright(" interval") & upright("lower bound for ") f \( x \) & upright("gap above ") 2 + .258 / .55 \( x - .45 \) upright(" at endpoints") & \
\[ .45 \, .50 \] & 2.035 + .58 \( x - .50 \) & 3 \/ 500 & 127 \/ 11000\
\[ .50 \, .55 \] & 2.035 + .25 \( x - .50 \) & 127 \/ 11000 & 13 \/ 22000\
\[ .55 \, .60 \] & 2.087 + .67 \( x - .60 \) & 29 \/ 4400 & 183 \/ 11000\
\[ .60 \, 1 \] & 2.087 + .44 \( x - .60 \) & 183 \/ 11000 & 1 \/ 200 . $
  The gap is affine and positive at both endpoints in every row, contradicting the hypothetical violation. ◻
]

This is a sufficient inclusion rule for further baseline inputs, not a claim about all future analyses of the source tensors. For an enlarged baseline, 50 gives strict improvement wherever that baseline exceeds two in $0 < k < 1$. The comparison with $cal(B)_2.258$ uses the proved dual-exponent witness together with Theorem 1.1; the extension in 51 still requires (13.5). The finite-family numerical bounds were established independently in 12.

===== 13.3.1 Scope of the result. <scope-of-the-result.>

The family yields asymptotic arithmetic exponents with arbitrarily small positive slack. It does not claim a practical crossover size or global optimality of the chosen seven-completion family. The finite-family entropy argument and parameter certificates are independent of the square construction in Theorem 1.1. In the rectangular support bound and this comparison, an available square estimate enters through its explicitly charged exponent point $\( 2 \/ p \, 1 \/ p \)$.

== 14 Finite-exception characteristic transfer <sec:characteristic-transfer>

For a field $F$ and $0 lt.eq k lt.eq 1$, let $w_F \( k \)$ denote the arithmetic exponent for the dimensions $\( n \, ceil.l n^k ceil.r \, n \)$, defined as in the introduction but counting operations over $F$ and allowing constants from $F$. Put $omega_F = w_F \( 1 \)$ and $alpha_F = sup { k in \[ 0 \, 1 \] : w_F \( k \) = 2 }$. The constants in operation-count bounds may depend on the field and the fixed schemes below; coefficient bit sizes and numerical stability are not part of this model.

#thm([Corollary 14.1.])[
  (Finite-exception field bounds).  #emph[There is a finite set $cal(S)$ of positive primes such that, for every field $F$ with $"char" F = 0$ or $"char" F = p in.not cal(S)$, 
$ omega_F < 1129 / 500 = 2.258 \, #h(2em) w_F #h(-1em) (709 / 1000) < 523 / 250 = 2.092 . $

 The same set $cal(S)$ works for both inequalities and depends on two fixed exact rank schemes selected in the proof.]
] <cor:characteristic-transfer>

#proof[
  First select the schemes over $bb(C)$. The strict square and rectangular bounds in Theorem 1, together with the rank limit in Lemma 2, give fixed exact rank schemes for $chevron.l m \, m \, m chevron.r$ and $chevron.l a \, b \, a chevron.r$, with respective rank budgets $r_(upright("sq"))$ and $r_(upright("rec"))$, such that
  $ r_(upright("sq"))^500 < m^1129 \, #h(2em) r_(upright("rec"))^250 < a^523 \, #h(2em) r_(upright("rec"))^709 < b^2092 . quad "(14.1)" $ <eq:fixed-transfer-witnesses>
  Indeed, choose finite values $s_(upright("sq")) \, s_(upright("rec")) > 0$ at which the rank ratios in that lemma for $\( 1 \, 1 \, 1 \)$ and $\( 1 \, 709 \/ 1000 \, 1 \)$ are respectively below $1129 \/ 500$ and $523 \/ 250$. Take $m = ceil.l e^(s_(upright("sq"))) ceil.r$, $a = ceil.l e^(s_(upright("rec"))) ceil.r$, and $b = ceil.l e^(709 s_(upright("rec")) \/ 1000) ceil.r$. Their lower bounds by the unrounded quantities give (14.1). Thus the two strict margins concern only fixed positive integers; no limiting degeneration is being specialized.
  Write each rank-one term as a product of three linear forms and regard all their coefficients in both schemes as indeterminates. For $j in { upright("sq") \, upright("rec") }$, let $M_j$ be the corresponding matrix tensor. Coefficient matching consists of finitely many equations
  $ sum_(nu = 1)^(r_j) xi_(j \, nu \, x) eta_(j \, nu \, y) zeta_(j \, nu \, z) = \( M_j \)_(x y z) in { 0 \, 1 } . $
  The ideal $I$ generated by these equations in a polynomial ring $bb(Q) \[ upright(bold(u)) \]$ is proper because the selected complex schemes give a joint solution. Choose a maximal ideal containing $I$. Its residue field $K$ is a finite extension of $bb(Q)$ by the Hilbert Nullstellensatz #cite(label("stacks-nullstellensatz")) Theorem 10.34.1, Tag 00FV. The images of the indeterminates give both exact schemes over this one number field. Individual summands are allowed to vanish: only the upper rank budgets matter, so no nonvanishing constraint is needed.
  Fix a $bb(Q)$-basis $e_1 = 1 \, e_2 \, dots.h \, e_d$ of $K$. Choose an integer $D gt.eq 1$ clearing the rational coordinates of all selected coefficients in this basis and the structure constants of all products $e_i e_j$. With $R = bb(Z) \[ 1 \/ D \]$,
  $ cal(A) = xor.big_(i = 1)^d R e_i subset K $
  is then a unital $R$-algebra, free of rank $d$ as an $R$-module, containing the coefficients of both identities. Let $cal(S)$ be the finite set of prime divisors of $D$.
  For any field $F$ in the statement, the canonical map $R arrow.r F$ is defined. The algebra $cal(A) ⊗_R F$ is a nonzero unital $F$-algebra of dimension $d$. A quotient by a maximal ideal is therefore a finite field extension $E \/ F$ of degree at most $d$. The map $cal(A) arrow.r E$ specializes both exact tensor identities with their dimensions and rank budgets unchanged. In positive characteristic this is reduction modulo that characteristic followed by a finite extension; when $F = bb(F)_p$, the quotient $E$ is a finite residue field.
  It remains to measure operations over $F$, not $E$. The recursive blocking and padding upper bound in the proof of Lemma 2 uses only an exact rank scheme and is valid over $E$. Set
  $ sigma = min {log a \, 1000 / 709 log b} > 0 . $
  The integer inequalities (14.1) give
  $ frac(log r_(upright("sq")), log m) < 1129 / 500 \, #h(2em) frac(log r_(upright("rec")), sigma) < 523 / 250 . $
  For the rectangular scheme, depth $q = ceil.l log n \/ sigma ceil.r$ provides outer dimension at least $n$ and inner dimension at least $n^(709 \/ 1000)$, at cost $O \( \( q + 1 \) r_(upright("rec"))^q \)$ operations over $E$; the square scheme has the analogous bound with $q = ceil.l log n \/ log m ceil.r$. Run each whole recursive computation on $F$-valued inputs inside $E$, and express every addition and multiplication in a fixed $F$-basis of $E$ containing $1$. The multiplication table simulates each such operation with a fixed number of $F$-operations, independent of $n$; projection onto the coordinate of $1$ recovers the $F$-valued output. This is a constant factor on the whole operation count, not a new factor in the rank budget at every tensor level. The displayed strict exponent bounds therefore hold over $F$. ◻
]

The argument neither computes $cal(S)$ nor covers its primes. It applies only to the two fixed schemes chosen above.

#thm([Corollary 14.2.])[
  (Characteristic-zero dual bound).  #emph[For every field $F$ of characteristic zero, $alpha_F > 0.465$.]
] <cor:characteristic-zero-dual>

#proof[
  By Theorem 1 and the definition of $alpha$, fix $k in \( 0.465 \, 1 \]$ with $w \( k \) = 2$. For each $epsilon > 0$, Lemma 2 gives a finite $t > 0$ and an exact rank-$r$ scheme for $chevron.l a \, b \, a chevron.r$, where
  $ a = ceil.l e^t ceil.r \, #h(2em) b = ceil.l e^(k t) ceil.r \, #h(2em) frac(log r, t) < 2 + epsilon / 2 . $
  The coefficient-equation descent in the proof of Corollary 52 realizes this finite scheme over a number field $K_epsilon$. A maximal-ideal quotient of $K_epsilon ⊗_(bb(Q)) F$ is a finite field extension $E \/ F$ over which the same exact rank budget holds.
  Recursive blocking and padding at depth $h = ceil.l log n \/ t ceil.r$ cover dimensions $\( n \, ceil.l n^k ceil.r \, n \)$. As in Lemma 2, its operation count over $E$ is
  $ O \( \( h + 1 \) r^h \) = O #h(-1em) (log n thin n^(log r \/ t)) = O \( n^(2 + epsilon) \) . $
  For this fixed accuracy, simulate the whole circuit in a fixed $F$-basis of $E$ containing $1$, as in Corollary 52; this changes the operation count by a constant factor and recovers the $F$-valued outputs. The number field, basis and constants may depend on $epsilon$ and $F$, but not on $n$. Thus $w_F \( k \) lt.eq 2$; the output-size lower bound gives equality, and $alpha_F gt.eq k > 0.465$. ◻
]

The accuracy-dependent schemes in this corollary do not supply a common finite set of exceptional positive characteristics. No transfer of $alpha_F > 0.465$ to positive characteristic is asserted.

== 15 Complete barrier coefficients <cert:coefficients>

The following table completes the rational definition (7.16). Every displayed decimal, including those in scientific notation, is exact. The terms are listed in increasing $i$ and then increasing $j$; no further coefficient file or optimizer is needed to specify the barrier.

#figure(
  table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[#figure(
  [],
  caption: [Figure 2: Exact coefficients $a_(i j)$ of the barrier. ],
) <cert:barrier-coefficients>
], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[]),
  table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$a_(i j)$
],
  table.cell(rowspan: 1, colspan: 1)[#figure(
  [],
  caption: [Figure 3: Exact coefficients $a_(i j)$ of the barrier (continued). ],
)
], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[],
  table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$a_(i j)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$1.098619383270680538 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 4.669442318024533134 times 10^(- 2)$
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$- 1.207736428642643568 times 10^(- 3)$
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$- 3.164446199207870698 times 10^(- 3)$
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$3.636957171420279137 times 10^(- 3)$
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 5.698642428249523157 times 10^(- 4)$
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$- 5.602684605882590763 times 10^(- 2)$
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$2.349877147912796810 times 10^(- 3)$
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$4.903987018649487162 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$- 6.619810434108410737 times 10^(- 4)$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$- 1.285233398877164493 times 10^(- 2)$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$- 2.581864001585385981 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 7.562439376470945357 times 10^(- 3)$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$- 1.804691803008195983 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$7.823901000581444443 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$1.009956438054349509 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$2.660260871536313410 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$- 1.115071770757571024 times 10^1$
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$1.882526999774491094 times 10^(- 3)$
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$- 6.610003066665722793 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$- 1.377536704067965623 times 10^1$
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$2.196480182366505329 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 8.740622126988427387 times 10^(- 2)$
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$1.686430306261204937 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$3.198040977700396681 times 10^1$
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$1.193163475520329975 times 10^1$
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$8.227116674939661811 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$1.713324848501641684 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$- 2.478214558914840637 times 10^1$
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[$4.571667456003526420 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$1.863768838404195050 times 10^(- 2)$
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$- 3.639145985809583372 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$- 1.659314443855491561 times 10^1$
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$- 9.109093370890851915 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 2.842047435780501452 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$6.864502967053094373 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$2.217022739027584421 times 10^1$
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$1.793237083428060208 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$- 8.565115586979872297 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$1.830109002841796784 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$4.474789932033190060 times 10^(- 3)$
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$- 5.076662205259581562 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$- 9.377190570431521266 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 1.401322773505324082 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$5.019408834309503575 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$8.749190654179410664 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$1.353757704697627240 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$- 2.244840043150760772 times 10^(- 2)$
],
  table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$- 1.595227841739267349 times 10^0$
],
  table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$4.228839868431957111 times 10^(- 2)$
],
  table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$1.304516353614300073 times 10^(- 1)$
],
  table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$- 1.101896459249583106 times 10^(- 2)$
],
),
  caption: [Table 6: Exact coefficients $a_(i j)$ of the barrier (continued). ],
)

== 16 Reproducing the finite certificate <cert:reproducibility>

The accompanying certificate verifies the finite arithmetic statements used in 35. The tensor constructions, the passage from grid checks to continuum inequalities, and the error allowances used in that passage are proved in the body of the manuscript.

===== 16.1 Inputs and source identity. <inputs-and-source-identity.>

The directory #raw("verification/certificate/") contains the 52 exact decimal coefficients of the barrier, both integer coefficient charts, all numerical generators and checkers, and their reference outputs. The packet manifest records the size and SHA-256 of every source and input file. The README describes the package, and the supplemental checker verifies the additional arithmetic bounds used in this manuscript.

The two chart hashes are

#raw(block: true, lang: "", "qP420_gmp:\n7dc037ea127cece2216f3219eeeca4cdab0288319a10111a78d272586b776f0b\nqP780_gmp:\nf23c0480f1109509545fdd17bb4de81602f50952411554b337105defbe7a070c")

The barrier coefficient file, #raw("inputs/newc22"), has SHA-256

#raw(block: true, lang: "", "41d42a58936b9da0f01a98a24fc4e998a00b83c9f4032a4ae166b7ef11073912")

The working-copy path substitutions made by the driver are recorded separately from the source hashes. They change input locations and compiler selection, not arithmetic formulas or thresholds.

===== 16.2 Running the check. <running-the-check.>

A standard run requires Python 3.10 or later, a POSIX system supporting #raw("fork"), a C++17 compiler with signed 128-bit integer support and UndefinedBehaviorSanitizer, and the GMP C++ library for chart generation. A preflight checks the additional assumptions of a 64-bit #raw("long") and arithmetic right shift of signed negative integers. Assertions must remain enabled. From #raw("verification/certificate/"), run

#raw(block: true, lang: "", "python3 reproduce.py \\\n  --cxx 'g++ -fsanitize=undefined -fno-sanitize-recover=all' \\\n  --work-dir ../../certificate-run\npython3 verify_manuscript_bounds.py --work-dir ../../certificate-run")

A compatible Clang installation may be selected instead. The commands make no network requests or package installations. They write into a new output directory and refuse to overwrite an existing run or supplemental report. The optional flag #raw("--reuse-charts") uses the supplied chart bytes after hash verification; omitting it regenerates both charts.

This distinction matters mathematically. The low-degree residual calculation uses the rounding-defect bound for the coefficient recurrence. Matching a stored hash alone does not independently establish that recurrence. Both full charts were regenerated with GMP integer arithmetic, with fail-fast undefined-behavior checks, and found to agree byte-for-byte with the supplied inputs. Separate small-degree comparisons also matched the GMP generator against the Python recurrence. The computation of the residual and chart differences then uses exact integer upper bounds.

===== 16.3 Finite coverage. <finite-coverage.>

The complete run passed all stages listed below. The preserved command records include compiler flags, exit codes, source substitutions, hashes, and logs.

table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Check
], table.cell(rowspan: 1, colspan: 1)[Coverage
]),
  table.cell(rowspan: 1, colspan: 1)[Chart generation and norms
], table.cell(rowspan: 1, colspan: 1)[Degrees 420 at scale $2^224$ and 780 at scale $2^500$; coefficient norms, tails, residual and chart differences.
],
  table.cell(rowspan: 1, colspan: 1)[Boundary shell
], table.cell(rowspan: 1, colspan: 1)[All 2,161 endpoints of its 2,160 sampling intervals.
],
  table.cell(rowspan: 1, colspan: 1)[Outer boundary
], table.cell(rowspan: 1, colspan: 1)[All 65,536 coarse intervals; 8,192 subcells in each of the six ambiguous intervals.
],
  table.cell(rowspan: 1, colspan: 1)[Interior
], table.cell(rowspan: 1, colspan: 1)[All 128 angular sectors, with 128 initial radial cells in each; all recursively required child boxes.
],
  table.cell(rowspan: 1, colspan: 1)[Geometry
], table.cell(rowspan: 1, colspan: 1)[All $480 times 480 = 230 \, 400$ grid centers.
],
  table.cell(rowspan: 1, colspan: 1)[Finite tensor examples
], table.cell(rowspan: 1, colspan: 1)[,837 COMPLETE words, 27 PARITY words, five edge atoms, and 40,087 GROUP tangent pairs.
],
)

The finite tensor examples check selected identities; their general forms are proved earlier. For the interior run, the sector identifiers were independently checked to be exactly $0 \, dots.h \, 127$, without omissions or duplicates. Each saved sector-input hash agreed with the corresponding reference hash, and every checker process returned success. The interval checker rejects an unresolved box at its maximum depth rather than accepting it.

The reproduced boundary output is

#raw(block: true, lang: "", "h -4180063084\nb 0 65536 amb 6 terms 7250 edge 128315602072 cap 152568202355")

In particular, the actual edge-sample minimum is

$ 128315602072 / 2^52 > 28.49 dot.op 10^(- 6) . $

The boundary proof uses this stronger measured minimum when paying its conservative endpoint and displacement allowances. It does not replace it by the checker’s weaker acceptance threshold $12 dot.op 10^(- 6)$. A supplemental execution also asserted that each endpoint gap used in a nonambiguous boundary interval had actually been evaluated; its full output was unchanged.

===== 16.4 The interface with the analytic estimates. <the-interface-with-the-analytic-estimates.>

The rational certificate gives

$ epsilon < 3.329 dot.op 10^(- 22) \, #h(2em) frac(6 epsilon, 2 dot.op 10^(- 9)) < 10^(- 12) \, #h(2em) phi \( 0 \) - log 3 > 7.0946 dot.op 10^(- 6) . $

The logarithm comparison uses a finite positive series for $2 "atanh" \( 1 \/ 2 \)$ and an exact geometric remainder. The physical fourth-derivative coefficient sum is also checked exactly to be less than $435 dot.op 10^6$.

The final-summary program takes the analytic interior margin $9.8 dot.op 10^(- 8)$, boundary margin $5.5 dot.op 10^(- 6)$, and inset cost $1.3 dot.op 10^(- 6)$ as inputs; it does not prove those estimates. The supplemental program #raw("verify_manuscript_bounds.py") explicitly records this interface, checks the actual boundary minimum and the exact allowance subtractions, and rechecks the complete interior-sector identities and hashes. The justification of each allowance, and hence of the continuum conclusion, is the analytic argument of 35. These programs are not a proof-assistant formalization and do not claim a practical matrix-multiplication implementation.


#bibliography("refs.bib", style: "ieee", title: [References])
