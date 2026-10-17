#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 73.7pt, y: 73.7pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Bi-Lipschitz Absorption of $c_0$ \
Without a Linear Copy of $c_0$]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

All Banach spaces in this paper are real. A map $F : X arrow.r Y$ is a #emph[bi-Lipschitz embedding] if there are constants $0 < c lt.eq C < oo$ such that

$ c parallel x - x' parallel_X lt.eq parallel F \( x \) - F \( x' \) parallel_Y lt.eq C parallel x - x' parallel_X #h(2em) \( x \, x' in X \) . $

It is a #emph[bi-Lipschitz equivalence] when it is also onto $Y$. The distinction between these two notions is central here: the result constructs an onto map between whole Banach spaces, while its linear obstruction concerns a subspace.

The nonlinear geometry of Banach spaces asks how much linear structure is retained by maps that control distances but need not respect addition. Ribe proved that uniformly homeomorphic normed spaces have the same finite-dimensional linear structure up to one common distortion bound #cite(label("Ribe76")) Theorem 1. Aharoni and Lindenstrauss constructed nonseparable Banach spaces that are bi-Lipschitz equivalent but not linearly isomorphic, and asked for separable examples #cite(label("AL78")) pp. 281–282. Ribe later produced separable uniformly homeomorphic nonisomorphic spaces, and Aharoni and Lindenstrauss obtained uniformly convex examples that are uniformly homeomorphic but not Lipschitz equivalent #cite(label("Ribe84")) #cite(label("AL85")). Johnson, Lindenstrauss and Schechtman developed both rigidity results and separable examples with different linear structures under the weaker relation of uniform homeomorphism #cite(label("JLS96")) Theorem 5.8 and Section 8(3). These results explain why a separable bi-Lipschitz counterexample requires more than a uniform deformation.

The space $c_0 = c_0 \( bb(N) \)$ consists of real scalar sequences tending to zero, with the supremum norm. Godefroy, Kalton and Lancien proved that a Banach space bi-Lipschitz equivalent to a linear subspace of $c_0$ is linearly isomorphic to a subspace of $c_0$. They also proved that a Banach space bi-Lipschitz equivalent to $c_0$ is linearly isomorphic to $c_0$ #cite(label("GKL00")) Theorems 2.1–2.2. These theorems concern the whole domain of an equivalence. They do not say that a Banach space containing a bi-Lipschitz image of $c_0$ must contain a linear copy of $c_0$. Kalton recorded the latter question as Problem 2, separately from the separable Lipschitz-isomorphism question in Problem 3 #cite(label("Kalton08")) pp. 21–22. Hájek, Johanis and Schlumprecht still described the embedding question as apparently open in their January 2024 preprint (arXiv:2401.00831v1), later published in 2025 #cite(label("HJS25")).

For Banach spaces $X \, Y$, write $X xor_oo Y$ for their product with norm $parallel \( x \, y \) parallel = max { parallel x parallel \, parallel y parallel }$. The main result is the following whole-space form of a negative answer to the $c_0$ embedding question.

#thm([Theorem 1.1.])[
  #emph[There is a separable real Banach space $Z$ containing no closed linear subspace isomorphic to $c_0$, and an onto bi-Lipschitz map 
$ F : Z xor_oo c_0 arrow.r Z . $

]
] <thm:main>

The map is automatically a bijection by its lower Lipschitz bound. The two spaces in Theorem 1 cannot be linearly isomorphic: the direct sum contains a linear copy of $c_0$, whereas $Z$ does not. Restricting $F$ to that summand gives a bi-Lipschitz embedding of $c_0$ into this same $Z$. Aharoni proved that every separable metric space embeds bi-Lipschitzly into $c_0$ #cite(label("Aharoni74")); composition therefore makes this one space $Z$ a bi-Lipschitz universal target for separable metric spaces.

There are related separable constructions with weaker control of small distances. Kalton constructed a separable Schur space, in which weakly convergent sequences converge in norm, uniformly homeomorphic to a space containing complemented $c_0$ #cite(label("Kalton04")) Theorem 4.6 and Propositions 5.1–5.2. The Schur property excludes a linear copy of $c_0$. Interleaving the two $c_0$ summands also gives uniform $c_0$ absorption by that same Schur space, with a nonlinear modulus of continuity. Sarı constructed a coarse-Lipschitz embedding of $c_0$ into a separable dual Banach space, which contains no linear copy of $c_0$ #cite(label("Sari26")) Introduction and Theorem 5. Coarse-Lipschitz distance bounds allow additive errors. Theorem 1 obtains global two-sided Lipschitz bounds and an onto map.

An earlier real-separable counterexample to the Lipschitz-isomorphism question uses a different linear obstruction: one space contains $c_0 \( ell_2 \)$, the space of $ell_2$-valued null sequences, and its bi-Lipschitz equivalent partner contains no linear copy of that space #cite(label("OpenAI2026Baseline")) Theorem 1.1. Its Hilbert-block and localized Lipschitz-free argument is independent of the construction here. The present construction excludes ordinary $c_0$ and yields absorption by the same space.

=== Proof overview <proof-overview>

The first step is algebraic. Suppose $E \, U$ are Banach spaces and $P : E xor_oo U arrow.r U$ is the projection. We seek an onto bi-Lipschitz map $g : E xor_oo U arrow.r U$, a bounded linear map $Q : Z arrow.r U$, and a Lipschitz map $K : E xor_oo U arrow.r Z$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ Q K = g - P . $ <eq:target-lift>]

Section 2 proves that these data make $F \( b \, t \) = b + K \( t \, Q b \)$ an onto bi-Lipschitz map $Z xor_oo E arrow.r Z$. Thus the construction has two concrete tasks: realize (1.1) with $E = c_0$, and arrange that $Z$ contains no linear $c_0$. The identity lifts the correction $g - P$; it imposes no surjectivity or right-inverse requirement on $Q$. This distinction matters because a Lipschitz right inverse of a linear quotient onto a separable Banach space always yields a bounded linear right inverse #cite(label("GK03")) Corollary 3.2.

We first construct $g$. Let $E$ and $U$ be countable-coordinate copies of $c_0$. Section 3 constructs the finite-coordinate weights and their localized correction functions. Split the coordinates of $U$ into finite blocks arranged in rows. In each block choose a vector $v$ and a functional $w$ with $w v = 1$. A scalar entering from the preceding block replaces the scalar $w x$ of the current input block, while the rest of that block is unchanged. Denote this frozen shift at state $s$ by $S_s$. With all $v \, w$ fixed, the output readouts recover the input by an explicit linear inverse. The weights actually depend on the normalized input, so this frozen inverse does not by itself invert the nonlinear map. Section 4 controls the change of the weights to obtain global bi-Lipschitz bounds, then uses Brouwer’s theorem on finite rows. An extra scalar at the end of each row both balances the dimensions and forces the possible output spillover to vanish. Density and a closed-image argument then give onto-ness.

We next construct $Z$ and lift the correction. Record each coordinate of $\( S_s - P \) s$ as a scalar function of $s$ in the unit ball of $E xor_oo U$. These functions depend on finitely many coordinates and have localized supports. Section 5 enlarges them by two local operations, one making a function constant on a small cylinder and one retaining only the change. A strict scale budget keeps their supports localized, and a nonincreasing order of scales controls what happens after a small local change. Tail factors give a second way to separate supports.

Section 6 pairs these tests with mass-zero finite combinations of points. This uses the molecule viewpoint of Arens and Eells #cite(label("AE56")) Section 2 and the Lipschitz-free framework of Godefroy and Kalton #cite(label("GK03")) Sections 1–2. Here the norm is built from lists of selected tests whose signed sums have a common Lipschitz bound. It combines their evaluation norms, with exponents approaching one, in an outer square sum. The square sum prevents a hypothetical $c_0$ basis from escaping through different test classes; the varying exponents then select one scalar test detecting each basis vector. We prove directly the completion and duality properties needed for this norm. The coordinate tests define $Q$, and radial extension of the point molecules defines $K$ with (1.1).

Finally, a hypothetical linear $c_0$ basis in $Z$ has uniformly bounded signed sums. Section 7 extracts one detecting test for each vector from a single class with a common operation budget. A test’s label records its original correction coordinate. Distinct labels can be separated either by tails or by nested coordinate cylinders. For a repeated label, an expansion leaves either disjoint tails or a first small local change. In the latter case, its support shrinks and its value becomes small enough that nested tests still have uniformly Lipschitz signed sums. The norm then forces the signed sums of the vectors to grow, a contradiction. Section 8 combines this obstruction with (1.1) and the onto shift.

== 2 The absorption criterion <sec:absorption>

The passage from a lifted correction to an absorption map is elementary and independent of the coordinate construction. We state it first to specify exactly what that construction must supply. Triangular changes of variables also appear in the quotient-section construction of Aharoni and Lindenstrauss #cite(label("AL78")) pp. 281–282 and in the free-space splitting of Godefroy and Kalton #cite(label("GK03")) Theorem 2.12. The following argument lifts a correction term and supplies its own inverse formula.

#thm([Lemma 2.1.])[
  (Absorption from a lifted correction).  #emph[Let $E \, U \, Z$ be real Banach spaces, let $D = E xor_oo U$, and let $P \( t \, u \) = u$. Suppose $Q : Z arrow.r U$ is bounded linear, $g : D arrow.r U$ is a bi-Lipschitz bijection, and $K : D arrow.r Z$ is Lipschitz. Assume the exact identity 
#[#set math.equation(numbering: n => "(2.1)")
 $ Q K \( t \, u \) = g \( t \, u \) - u #h(2em) \( \( t \, u \) in D \) . $ <eq:absorb-identity>]

 Then 
$ F : Z xor_oo E arrow.r Z \, #h(2em) F \( b \, t \) = b + K \( t \, Q b \) $

 is a bi-Lipschitz bijection. If 
$ q = parallel Q parallel \, #h(2em) L_K = "Lip" \( K \) \, #h(2em) parallel g \( x \) - g \( x' \) parallel_U gt.eq c_g parallel x - x' parallel_D $

 for some arbitrary lower constant $c_g > 0$, then 
#[#set math.equation(numbering: n => "(2.2)")
 $ "Lip" \( F \) lt.eq 1 + L_K max { 1 \, q } \, #h(2em) "Lip" \( F^(- 1) \) lt.eq max {1 + frac(L_K q, c_g) \, q / c_g} . $ <eq:absorb-bounds>]

 No surjectivity or right-inverse assumption is imposed on $Q$.]
] <lem:absorption>

#proof[
  For $d in Z$, define
  #[#set math.equation(numbering: n => "(2.3)")
   $ \( t_d \, u_d \) = g^(- 1) \( Q d \) \, #h(2em) G \( d \) = #scale(x: 120%, y: 120%)[\(] d - K \( t_d \, u_d \) \, t_d #scale(x: 120%, y: 120%)[\)] . $ <eq:absorb-inverse>]
  This is defined for every $d$ because $g$ is onto $U$. Identity (2.1) gives
  $ Q F \( b \, t \) = Q b + Q K \( t \, Q b \) = g \( t \, Q b \) . $
  Thus $g^(- 1)$ reads $\( t \, Q b \)$ from $Q F \( b \, t \)$, and (2.3) gives $G \( F \( b \, t \) \) = \( b \, t \)$. Conversely, write $\( t \, u \) = g^(- 1) \( Q d \)$ and $b = d - K \( t \, u \)$. Then
  $ Q b = Q d - Q K \( t \, u \) = g \( t \, u \) - #scale(x: 120%, y: 120%)[\(] g \( t \, u \) - u #scale(x: 120%, y: 120%)[\)] = u \, $
  so $F \( G \( d \) \) = d - K \( t \, u \) + K \( t \, Q b \) = d$. This proves bijectivity with inverse $G$.
  The map $\( b \, t \) mapsto \( t \, Q b \)$ has Lipschitz constant at most $max { 1 \, q }$, which proves the first estimate in (2.2). For $d \, d' in Z$, the lower bound for $g$ gives
  $ parallel \( t_d \, u_d \) - \( t_(d') \, u_(d') \) parallel_D lt.eq q / c_g parallel d - d' parallel_Z . $
  The two coordinates in (2.3) therefore have Lipschitz constants at most $1 + L_K q \/ c_g$ and $q \/ c_g$, respectively. Their maximum is the second estimate in (2.2), and its reciprocal is a lower Lipschitz constant for $F$. ◻
]

The remaining sections supply this criterion with $E = c_0$. In particular, the inverse calculation uses only $Q K = g - P$. It never asks for an element $b$ with prescribed $Q b$ until the formula $b = d - K \( g^(- 1) \( Q d \) \)$ has already produced one.

== 3 Coordinate weights and localized corrections <sec:weights>

The shift will replace one scalar in each coordinate block by a scalar from the preceding block. We first describe this operation, then choose weights whose dependence on the input is slow and whose correction coordinates have the support properties needed for the later tests.

For a countably infinite set $A$, let $c_0 \( A \)$ have its supremum norm. Write $bb(N) = { 1 \, 2 \, dots.h }$, index levels by $lambda = \( i \, n \) in bb(N)^2$, and put $J_lambda = i + n$. For $j gt.eq 1$ set

$ d_j = 2^(- j) \, #h(2em) cal(A)_j = \( \[ - 1 \, 1 \] ∩ d_j bb(Z) \)^j \, $

and let $cal(A)_0$ consist of one point. The finite coordinate block at $lambda$ is

$ Gamma_lambda = { \( lambda \, j \, xi \) : 0 lt.eq j lt.eq J_lambda \, med xi in cal(A)_j } . $

We use

$ E = c_0 \( bb(N) \) \, #h(2em) U = c_0 #h(-1em) (union.sq.big_(lambda in bb(N)^2) Gamma_lambda) \, #h(2em) D = E xor_oo U \, $

and write $x = \( t \, \( x^lambda \)_lambda \)$. Put $P \( t \, u \) = u$. Fix an enumeration of the disjoint union of the coordinate sets of $E$ and $U$. The map $pi_j : D arrow.r bb(R)^j$ retains the first $j$ coordinates in this enumeration; $pi_0$ is the unique map into $bb(R)^0$. Write $B = { s in D : parallel s parallel_D lt.eq 1 }$. For $n > 1$ let $lambda^(-) = \( i \, n - 1 \)$ and set

$ r_(i \, 1) \( x \) = max { \| t_i \| \, parallel x^(i \, 1) parallel_oo } \, #h(2em) r_(i \, n) \( x \) = max { parallel x^(i \, n - 1) parallel_oo \, parallel x^(i \, n) parallel_oo } . $

Each $r_lambda$ is $1$-Lipschitz. Every input coordinate occurs in at most two of these maxima. Thus, for every fixed $x in D$,

#[#set math.equation(numbering: n => "(3.1)")
 $ r_lambda \( x \) arrow.r 0 quad upright("as ") lambda upright(" leaves finite sets") . $ <eq:radii-tail>]

Indeed, infinitely many radii at least $epsilon > 0$ would require infinitely many input coordinates of modulus at least $epsilon$.

The scalar replacement uses a vector $v in bb(R)^(Gamma_lambda)$ and a row $w in \( bb(R)^(Gamma_lambda) \)^(*)$ with $w v = 1$. For a block vector $z in bb(R)^(Gamma_lambda)$ and an incoming scalar $b in bb(R)$,

$ z = \( z - v w z \) + v \( w z \) \, #h(2em) z + v \( b - w z \) = \( z - v w z \) + v b . $

The first summand belongs to $ker w$, so the operation preserves it and replaces the scalar readout $w z$ by $b$. Along a row of blocks, we will take $b$ from the preceding block’s readout, with $t_i$ entering the first block. Section 4 constructs the inverse for any fixed collection of such pairs. The conditions in (W1) below combine this scalar identity with uniform bounds on the vectors and rows.

The pairs will depend on a state $s in B$. Condition (W2) makes their variation small after multiplication by the local radius, which bounds the size of the input blocks involved in the replacement. This is the estimate that will preserve the frozen shift’s distance bounds when the weights vary with the input.

The bands $j$ in each block serve a different purpose: localization. For $j gt.eq 1$, a correction coordinate indexed by $\( lambda \, j \, xi \)$ will be supported where the first $j$ state coordinates are close to $xi$. Whenever $j < J_lambda$, it will also require a positive lower bound on $r_lambda \( s \)$ depending only on $j$. The first restriction becomes sharper as $j$ grows; the second gives a fixed radial threshold when $j$ is fixed and the level varies. We will prove these two support bounds for the correction coordinates after constructing the weights.

#thm([Lemma 3.1.])[
  (Weights at one level).  #emph[Let $eta = 10^(- 3)$. There are continuous maps 
$ v^lambda : B arrow.r bb(R)^(Gamma_lambda) \, #h(2em) w^lambda : B arrow.r \( bb(R)^(Gamma_lambda) \)^(*) $

 depending on finitely many coordinates of their argument, such that 
#[#set math.equation(numbering: n => "(W1)")
 $ parallel v^lambda \( s \) parallel_oo lt.eq 1 \, #h(2em) parallel w^lambda \( s \) parallel_1 lt.eq 2 \, #h(2em) w^lambda \( s \) v^lambda \( s \) = 1 \, $]

 and, for $s \, s' in B$, 
#[#set math.equation(numbering: n => "(W2)")
 $ min { r_lambda \( s \) \, r_lambda \( s' \) } max #h(-1em) {parallel v^lambda \( s \) - v^lambda \( s' \) parallel_oo \, parallel w^lambda \( s \) - w^lambda \( s' \) parallel_1} lt.eq eta parallel s - s' parallel_D . $]

 More precisely, the $j$th band of either weight is the product of a coefficient $theta_j^(J_lambda) \( r_lambda \( s \) \)$ and a vector or row depending only on $pi_j s$. If $theta_j^(J_lambda) \( r \) > 0$, then 
#[#set math.equation(numbering: n => "(3.2)")
 $ r lt.eq rho_j quad \( j gt.eq 1 \) \, #h(2em) r gt.eq ell_j quad \( j < J_lambda \) \, $ <eq:band-support>]

 for positive constants $rho_j \, ell_j$ defined in the proof.]
] <lem:coordinate-weights>

#proof[
  Fix $j gt.eq 1$ and $s in B$. For $xi in cal(A)_j$ put
  $ b_xi^j \( s \) = (1 - frac(parallel pi_j s - xi parallel_oo, d_j))_(+) \, #h(2em) B_j \( s \) = sum_(xi in cal(A)_j) b_xi^j \( s \) . $
  The grid includes both endpoints in every coordinate. Every point of $\[ - 1 \, 1 \]^j$ is within $d_j \/ 2$ in supremum norm of a grid point, including points on the boundary of the cube. Thus $B_j \( s \) gt.eq 1 \/ 2$; in particular, the following row is defined everywhere on $B$:
  $ w_xi^j \( s \) = frac(b_xi^j \( s \), B_j \( s \)) \, #h(2em) v_xi^j \( s \) = min #h(-1em) {1 \, (2 - frac(parallel pi_j s - xi parallel_oo, d_j))_(+)} . $
  The entries are nonnegative, $parallel w^j \( s \) parallel_1 = 1$ and $parallel v^j \( s \) parallel_oo lt.eq 1$. If $w_xi^j \( s \) > 0$, then $parallel pi_j s - xi parallel_oo < d_j$ and $v_xi^j \( s \) = 1$. Consequently $w^j \( s \) v^j \( s \) = 1$. At band $j = 0$, set both the sole coordinate of $v^0$ and the sole entry of $w^0$ equal to $1$.
  Here are explicit finite Lipschitz bounds. Put $N_j = \| cal(A)_j \| = \( 2^(j + 1) + 1 \)^j$. Since each $b_xi^j$ and $v_xi^j$ has Lipschitz constant at most $d_j^(- 1)$,
  $ parallel b^j \( s \) - b^j \( s' \) parallel_1 lt.eq N_j d_j^(- 1) parallel s - s' parallel_D . $
  Normalizing a nonnegative vector whose $ell_1$ norm is at least $1 \/ 2$ changes distances by at most a factor $4$ in $ell_1$. Indeed,
  $ ∥frac(b, parallel b parallel_1) - frac(b', parallel b' parallel_1)∥_1 lt.eq frac(parallel b - b' parallel_1 + \| parallel b parallel_1 - parallel b' parallel_1 \|, parallel b parallel_1) lt.eq 4 parallel b - b' parallel_1 . $
  Thus $L_j = 4 N_j \/ d_j$ bounds both $"Lip" \( w^j \)$ in $ell_1$ and $"Lip" \( v^j \)$ in the supremum norm.
  Choose $H > 0$ with $pi \/ H lt.eq eta \/ 2$ and inductively choose numbers $rho_j > 0$ so that
  #[#set math.equation(numbering: n => "(3.3)")
   $ 0 < rho_1 < 1 \, #h(2em) rho_(j + 1) < e^(- H) rho_j \, #h(2em) L_j rho_j lt.eq eta \/ 4 quad \( j gt.eq 1 \) . $ <eq:scale-input>]
  Each constraint at stage $j$ has a positive right-hand side, so this choice is possible. Put $ell_j = e^(- H) rho_(j + 1)$ for $j gt.eq 0$. For an integer $J gt.eq 1$ define $theta^J \( r \) = \( theta_0^J \( r \) \, dots.h \, theta_J^J \( r \) \)$ on $\[ 0 \, 1 \]$ as follows. For $r gt.eq rho_1$ take $theta^J \( r \) = e_0$. As $r$ decreases across $\[ e^(- H) rho_j \, rho_j \]$, $1 lt.eq j lt.eq J$, rotate from $e_(j - 1)$ to $e_j$ by setting
  $ theta_(j - 1)^J \( r \) = cos alpha_j \( r \) \, #h(2em) theta_j^J \( r \) = sin alpha_j \( r \) \, #h(2em) alpha_j \( r \) = frac(pi, 2 H) log rho_j / r \, $
  with all other entries zero. Between these transition intervals keep the most recently reached unit vector, and for $0 lt.eq r lt.eq e^(- H) rho_J$ take $theta^J \( r \) = e_J$. The strict inequality in (3.3) makes the intervals disjoint and ordered. At each transition endpoint the formula agrees with the adjacent constant value; this also proves continuity at $r = 0$. Every entry is nonnegative,
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(j = 0)^J theta_j^J \( r \)^2 = 1 \, #h(2em) sum_(j = 0)^J theta_j^J \( r \) lt.eq 2 . $ <eq:theta-sums>]
  For $0 < r lt.eq 1$, the path $u mapsto theta^J \( e^u \)$ is piecewise continuously differentiable and has $ell_1$ speed at most $\( pi \/ \( 2 H \) \) \( \| sin alpha \| + \| cos alpha \| \) lt.eq pi \/ H$. It is therefore $pi \/ H$-Lipschitz in the variable $log r$. The schedule also gives (3.2). For $j = 0$, only the second assertion applies. For $j = J$, only the first assertion applies, and $theta_J^J \( 0 \) = 1$ is allowed.
  For $J = J_lambda$ and $r = r_lambda \( s \)$, concatenate the bands:
  $ v^lambda \( s \) = #scale(x: 120%, y: 120%)[\(] theta_j^J \( r \) v^j \( s \) #scale(x: 120%, y: 120%)[\)]_(j = 0)^J \, #h(2em) w^lambda \( s \) = #scale(x: 120%, y: 120%)[\(] theta_j^J \( r \) w^j \( s \) #scale(x: 120%, y: 120%)[\)]_(j = 0)^J . $
  Every band depends on finitely many coordinates: $pi_j s$ and $r_lambda \( s \)$ involve finite coordinate sets. Continuity includes the cases $r = 0$ and transition endpoints. The bounds on the band weights and (3.4) give
  $ parallel v^lambda \( s \) parallel_oo lt.eq 1 \, quad parallel w^lambda \( s \) parallel_1 = sum_(j = 0)^J theta_j^J \( r \) lt.eq 2 \, quad w^lambda \( s \) v^lambda \( s \) = sum_(j = 0)^J theta_j^J \( r \)^2 = 1 . $
  This proves (W1).
  For (W2), put $r = r_lambda \( s \)$, $r' = r_lambda \( s' \)$, $m = min { r \, r' }$ and $delta = parallel s - s' parallel_D$. If $m = 0$ there is nothing to prove. Otherwise
  $ m \| log r - log r' \| lt.eq \| r - r' \| lt.eq delta . $
  Change the band coefficients first, using the band weights at $s'$. The logarithmic Lipschitz estimate and the bounds $parallel v^j \( s' \) parallel_oo \, parallel w^j \( s' \) parallel_1 lt.eq 1$ show that this part of either norm difference, multiplied by $m$, is at most $\( pi \/ H \) delta lt.eq \( eta \/ 2 \) delta$. Then change the band weights with coefficients fixed at $theta^J \( r \)$. Only positive $j$ vary, and $theta_j^J \( r \) > 0$ implies $m lt.eq r lt.eq rho_j$. Hence this part of either norm difference, multiplied by $m$, is at most
  $ delta sum_(j = 1)^J theta_j^J \( r \) m L_j lt.eq frac(eta delta, 4) sum_(j = 1)^J theta_j^J \( r \) lt.eq frac(eta delta, 2) . $
  The sum of the two contributions proves (W2). ◻
]

We record the support information in the form used by the lifting construction. For $s in B$ define

#[#set math.equation(numbering: n => "(3.5)")
 $ a_(i \, 0) \( s \) = t_i \, #h(2em) a_(i \, n) \( s \) = w^(i \, n) \( s \) s^(i \, n) \, #h(2em) f_(\( lambda \, j \, xi \)) \( s \) = theta_j^(J_lambda) \( r_lambda \( s \) \) v_xi^j \( s \) #scale(x: 120%, y: 120%)[\(] a_(i \, n - 1) \( s \) - a_(i \, n) \( s \) #scale(x: 120%, y: 120%)[\)] . $ <eq:correction-coordinate>]

These functions will be the coordinates of the shift correction. We first prove their support and continuity properties directly from the weights.

#thm([Lemma 3.2.])[
  (Finite dependence and local support).  #emph[For every $gamma = \( lambda \, j \, xi \)$, the function $f_gamma$ is continuous, vanishes at $0$, and depends on a nonempty finite set $I_gamma$ of coordinates of $D$. The sets can be chosen to include the first $j$ coordinates and every coordinate used by $r_lambda$. Uniformly in $gamma$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ \| f_gamma \( s \) \| lt.eq 4 r_lambda \( s \) lt.eq 4 \, #h(2em) "Lip" \( f_gamma \) lt.eq 4 + 12 eta . $ <eq:correction-bounds>]

 Moreover 
#[#set math.equation(numbering: n => "(3.7)")
 $ f_gamma \( s \) eq.not 0 quad arrow.r.double quad cases(delim: "{", parallel pi_j s - xi parallel_oo lt.eq 2 d_j \, & j gt.eq 1 \,, r_lambda \( s \) gt.eq ell_j \, & j < J_lambda \,) $ <eq:correction-support>]

 where both conditions are imposed when both apply.]
] <lem:weight-support>

#proof[
  For $n > 1$, $a_(i \, n - 1)$ uses only $s^(i \, n - 1)$, the local radius $r_(i \, n - 1) \( s \)$, and $pi_(J_(i \, n - 1)) s$. The former radius uses $s^(i \, n - 2)$ when $n > 2$ and $t_i$ when $n = 2$. The current scalar $a_(i \, n)$ uses only $s^(i \, n)$, $r_(i \, n) \( s \)$, and $pi_(J_(i \, n)) s$; for $n = 1$ the predecessor scalar is $t_i$. Since $J_(i \, n - 1) < J_(i \, n)$, one possible common finite set for all coordinates $gamma$ at $lambda = \( i \, n \)$ is the union of the first $J_lambda$ enumerated coordinates, the coordinate $t_i$, and every coordinate of the blocks $Gamma_(i \, k)$ with $k in { n \, n - 1 \, n - 2 } ∩ bb(N)$. Call it $I_gamma$. It is nonempty and contains the coordinates required in the statement.
  The row bound (W1) gives $\| a_(i \, n - 1) \( s \) - a_(i \, n) \( s \) \| lt.eq 4 r_lambda \( s \)$, also when $n = 1$. Thus $\| f_gamma \( s \) \| lt.eq 4 r_lambda \( s \) lt.eq 4$ and $f_gamma \( 0 \) = 0$. To verify the uniform Lipschitz bound, fix $s \, s' in B$ and write $delta = parallel s - s' parallel_D$. At each level choose the pair $\( macron(v)^lambda \, macron(w)^lambda \)$ from whichever of $s \, s'$ has the larger local radius. If $e in { s \, s' }$ is the other endpoint, (W2) gives
  $ r_lambda \( e \) max #h(-1em) {parallel v^lambda \( e \) - macron(v)^lambda parallel_oo \, parallel w^lambda \( e \) - macron(w)^lambda parallel_1} lt.eq eta delta \; $
  the same bound is trivial if $e$ supplied the frozen pair. For $e = s \, s'$, replacing its weights by the frozen weights in the correction vector $v^lambda \( e \) \( a_(i \, n - 1) \( e \) - a_(i \, n) \( e \) \)$ costs at most $4 eta delta$ from the vector and at most $2 eta delta$ from its current and predecessor rows together. At $n = 1$ the predecessor $t_i$ does not change. With all weights frozen, the correction vector is linear in the input and has norm at most $4 r_lambda \( s - s' \) lt.eq 4 delta$. Comparing the two endpoints therefore gives $\| f_gamma \( s \) - f_gamma \( s' \) \| lt.eq \( 4 + 12 eta \) delta$.
  If $f_gamma \( s \) eq.not 0$, its displayed product has both $theta_j^(J_lambda) \( r_lambda \( s \) \) > 0$ and $v_xi^j \( s \) > 0$. For $j gt.eq 1$, the formula for $v_xi^j$ gives $parallel pi_j s - xi parallel_oo < 2 d_j$, which implies the first closed inequality in (3.7). If $j < J_lambda$, the second inequality follows from (3.2). This includes $j = 0$; no grid condition is imposed there. ◻
]

== 4 The state-dependent shift is onto <sec:shift>

The weights of Lemma 3 now provide the map required by the absorption criterion. We first invert arbitrary frozen weights, then bound their variation, and finally solve every target by a finite-dimensional fixed-point argument.

=== 4.1 Frozen and state-dependent shifts <frozen-and-state-dependent-shifts>

First ignore the dependence on $s$. The identity $w v = 1$ supplies an inverse for any independently frozen choice of the pairs.

#thm([Lemma 4.1.])[
  (Frozen shift).  #emph[Choose for every $\( i \, n \)$ a pair $v^(i \, n) \, w^(i \, n)$ satisfying (W1), independently between blocks. Define $S : D arrow.r U$ by 
#[#set math.equation(numbering: n => "(4.1)")
 $ a_(i \, 0) = t_i \, #h(2em) a_(i \, n) = w^(i \, n) x^(i \, n) \, #h(2em) \( S x \)^(i \, n) = x^(i \, n) + v^(i \, n) \( a_(i \, n - 1) - a_(i \, n) \) . $ <eq:frozen-shift>]

 Then $S$ is a bounded linear bijection with $parallel S parallel lt.eq 5$ and $parallel S^(- 1) parallel lt.eq 5$.]
] <lem:frozen>

#proof[
  The row bounds give $\| a_(i \, n - 1) - a_(i \, n) \| lt.eq 4 r_(i \, n) \( x \)$; for $n = 1$, the predecessor is just $t_i$, and the same bound holds. Thus
  $ parallel \( S x \)^(i \, n) parallel_oo lt.eq 5 r_(i \, n) \( x \) . $
  By (3.1), the block norms tend to zero, so $S x in U$ and $parallel S parallel lt.eq 5$.
  For $y in U$, put $b_(i \, n) = w^(i \, n) y^(i \, n)$ and define
  #[#set math.equation(numbering: n => "(4.2)")
   $ t_i = b_(i \, 1) \, #h(2em) x^(i \, n) = y^(i \, n) - v^(i \, n) \( b_(i \, n) - b_(i \, n + 1) \) . $ <eq:frozen-inverse>]
  The block norms of $y$ tend to zero off finite sets: otherwise infinitely many coordinates of $y$ would stay away from zero. Since $\| b_(i \, n) \| lt.eq 2 parallel y^(i \, n) parallel_oo$, the scalar family $\( b_(i \, n) \)$ belongs to $c_0 \( bb(N)^2 \)$. Formula (4.2) therefore gives $t in E$ and block norms of $x$ tending to zero. Because the blocks are finite, this is $x in D$. It also gives $parallel x parallel_D lt.eq 5 parallel y parallel_U$.
  Applying $w^(i \, n)$ to (4.2) yields $w^(i \, n) x^(i \, n) = b_(i \, n + 1)$, so (4.1) gives $S x = y$. Conversely, when $y = S x$, applying $w^(i \, n)$ to (4.1) gives $b_(i \, n) = a_(i \, n - 1)$; (4.2) then recovers $t_i$ and $x^(i \, n)$. The formulas are mutual inverses and prove the inverse bound. ◻
]

For $s in B$, let $S_s$ be the frozen shift using $v^lambda \( s \) \, w^lambda \( s \)$ in every block. Define

#[#set math.equation(numbering: n => "(4.3)")
 $ g \( 0 \) = 0 \, #h(2em) g \( x \) = S_(s_x) x \, quad s_x = frac(x, parallel x parallel_D) quad \( x eq.not 0 \) . $ <eq:g-definition>]

This map is positively homogeneous. Its weights are recomputed from the input, so Lemma 5 alone does not invert $g$.

#thm([Proposition 4.2.])[
  (Global distance bounds).  #emph[For every $x \, x' in D$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ (1 / 5 - 24 eta) parallel x - x' parallel_D lt.eq parallel g \( x \) - g \( x' \) parallel_U lt.eq \( 5 + 24 eta \) parallel x - x' parallel_D . $ <eq:global-bounds>]

 In particular, $g$ is injective and continuous.]
] <prop:global>

#proof[
  Suppose first that $x \, x' eq.not 0$. Put $d = parallel x - x' parallel_D$ and $M = max { parallel x parallel_D \, parallel x' parallel_D }$. If $parallel x parallel_D = M$, splitting $x \/ M - x' \/ parallel x' parallel$ at $x' \/ M$, and using $\| parallel x parallel - parallel x' parallel \| lt.eq d$, gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ parallel s_x - s_(x') parallel_D lt.eq frac(2 d, M) . $ <eq:normalization>]
  The other order is the same.
  At each level $lambda$, freeze the entire pair $\( macron(v)^lambda \, macron(w)^lambda \)$ at whichever of $s_x \, s_(x')$ has larger $r_lambda$, breaking a tie arbitrarily. These choices may vary with $lambda$, but Lemma 5 still applies to the resulting $macron(S)$. For $e = x$ or $x'$, the chosen pair either agrees with the weights at $s_e$ or the radius at $s_e$ is the smaller one. Thus (W2) and (4.5) give
  #[#set math.equation(numbering: n => "(4.6)")
   $ r_lambda \( e \) max { parallel v^lambda \( s_e \) - macron(v)^lambda parallel_oo \, parallel w^lambda \( s_e \) - macron(w)^lambda parallel_1 } lt.eq 2 eta d . $ <eq:frozen-weight-error>]
  This remains valid when $r_lambda \( e \) = 0$.
  In block $lambda = \( i \, n \)$, first change its vector $v^lambda$ while keeping the two scalars computed with the original rows. Their difference has modulus at most $4 r_lambda \( e \)$, so (4.6) bounds this change by $8 eta d$. Changing the current row changes its scalar by at most $2 eta d$, since $parallel e^lambda parallel_oo lt.eq r_lambda \( e \)$. If $n > 1$, changing the predecessor row costs another $2 eta d$, using (4.6) at $\( i \, n - 1 \)$ and $parallel e^(i \, n - 1) parallel_oo lt.eq r_(i \, n - 1) \( e \)$. For $n = 1$, the predecessor $t_i$ does not change. Since $parallel macron(v)^lambda parallel_oo lt.eq 1$, we have
  #[#set math.equation(numbering: n => "(4.7)")
   $ parallel \( S_(s_e) e - macron(S) e \)^lambda parallel_oo lt.eq 12 eta d . $ <eq:frozen-block-error>]
  Taking the supremum over blocks and adding the two endpoint errors,
  $ parallel g \( x \) - g \( x' \) - macron(S) \( x - x' \) parallel_U lt.eq 24 eta d . $
  The two frozen bounds give $1 / 5 d lt.eq parallel macron(S) \( x - x' \) parallel_U lt.eq 5 d$, proving (4.4). If one endpoint is zero, Lemma 5 applied to $S_(s_x) x$ gives the stronger constants $1 \/ 5$ and $5$. Finally, $1 \/ 5 - 24 eta > 0$ for $eta = 10^(- 3)$. ◻
]

=== 4.2 Terminal scalars and Brouwer surjectivity <terminal-scalars-and-brouwer-surjectivity>

The lower bound in (4.4) proves injectivity and will prove that the image is closed. It does not prove that every target has a preimage. For that, we solve finite-coordinate targets with an extra terminal scalar in each row.

#thm([Proposition 4.3.])[
  (Onto-ness of the nonlinear shift).  #emph[The map $g : D arrow.r U$ in (4.3) is onto. Together with Proposition 6, it is a bi-Lipschitz bijection.]
] <prop:onto>

#proof[
  For $N gt.eq 1$, let $U_N$ consist of the blocks with $1 lt.eq i \, n lt.eq N$, all other coordinates zero. Let $D_N$ consist of these blocks and $t_1 \, dots.h \, t_N$, all other input coordinates zero. They are finite-dimensional, and
  #[#set math.equation(numbering: n => "(4.8)")
   $ dim D_N = N + sum_(i \, n lt.eq N) \| Gamma_(i \, n) \| = dim \( U_N xor_oo bb(R)^N \) . $ <eq:finite-dimensions>]
  For $s in B$, set
  #[#set math.equation(numbering: n => "(4.9)")
   $ S_s^(\( N \)) : D_N arrow.r U_N xor_oo bb(R)^N \, #h(2em) S_s^(\( N \)) x = (#scale(x: 120%, y: 120%)[\(] \( S_s x \)^(i \, n) #scale(x: 120%, y: 120%)[\)]_(i \, n lt.eq N) \, #scale(x: 120%, y: 120%)[\(] w^(i \, N) \( s \) x^(i \, N) #scale(x: 120%, y: 120%)[\)]_(i lt.eq N)) . $ <eq:finite-shift>]
  The last $N$ coordinates retain the terminal scalars $a_(i \, N)$.
  For clarity, this finite map has an explicit inverse. Given $\( y \, \( c_i \)_(i lt.eq N) \)$, define
  $ b_(i \, n) = w^(i \, n) \( s \) y^(i \, n) \, #h(2em) a_(i \, 0) = b_(i \, 1) \, #h(2em) a_(i \, n) = b_(i \, n + 1) med \( n < N \) \, #h(2em) a_(i \, N) = c_i \, $
  then put
  #[#set math.equation(numbering: n => "(4.10)")
   $ t_i = a_(i \, 0) \, #h(2em) x^(i \, n) = y^(i \, n) - v^(i \, n) \( s \) \( a_(i \, n - 1) - a_(i \, n) \) quad \( n lt.eq N \) . $ <eq:finite-inverse>]
  Because $a_(i \, n - 1) = b_(i \, n)$, applying $w^(i \, n) \( s \)$ to (4.10) gives $w^(i \, n) \( s \) x^(i \, n) = a_(i \, n)$. Substitution in (4.9) returns $\( y \, c \)$. Conversely, applying the rows to (4.9) recovers the $b_(i \, n)$, and (4.10) recovers every input coordinate. Thus (4.10) is the inverse.
  The same estimates as for the frozen shift give
  #[#set math.equation(numbering: n => "(4.11)")
   $ parallel S_s^(\( N \)) parallel lt.eq 5 \, #h(2em) parallel \( S_s^(\( N \)) \)^(- 1) parallel lt.eq 5 . $ <eq:finite-bounds>]
  For the inverse bound, if $h_0 = parallel \( y \, c \) parallel$, then $\| b_(i \, n) \| lt.eq 2 h_0$, all $a_(i \, n)$ have modulus at most $2 h_0$, and (4.10) has block norm at most $h_0 + 4 h_0$. For the forward bound, the block estimate is $5 parallel x parallel_D$ and the terminal coordinates are at most $2 parallel x parallel_D$. The finitely many weights in (4.10) are continuous in $s$. Hence $s mapsto \( S_s^(\( N \)) \)^(- 1)$ is continuous as a map into the linear operators between these finite-dimensional spaces.
  Figure 1 displays the terminal coordinate and the single possible outgoing block of a finite row.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.1cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$a_(i,0)=t_i$]]])])
  content((3, 0), [#box(width: 2.9cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$y^(i,1)$#linebreak()\(w^i,1y^i,1=a\_i,0\)]]])])
  content((5.2, 0), [#text(size: 9pt)[$dots.h$]])
  content((7.4, 0), [#box(width: 2.9cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$y^(i,N)$#linebreak()\(w^i,Ny^i,N=a\_i,N-1\)]]])])
  content((10.7, 0), [#box(width: 2.1cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$c_i=a_(i,N)$#linebreak()extra target]]])])
  line((1.05, 0), (1.55, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  line((4.45, 0), (5.2, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  line((5.2, 0), (5.95, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((10.7, -1.8), [#box(width: 2.9cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$(i,N+1)$ output#linebreak()\(v^i,N+1c\_i\)]]])])
  line((10.7, -0.4), (10.7, -1.3), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((10.7, -0.9), [#text(size: 9pt)[$x^(i,N+1)=0$]], anchor: "west")
  content((0, -1.8), [#text(size: 9pt)[Finite target: $(y,c)$.#linebreak()Brouwer is applied with $c=0$.]], anchor: "west")
})],
    caption: [Figure 1: A row of length $N$ with frozen weights and independent extra target scalar $c_i = a_(i \, N)$. The block readouts recover the predecessor scalars, while $c_i$ records the scalar not read by any block in the finite row. At the nonlinear fixed point it is set to zero, which kills the only possible output spillover into the next block. ],
  ) <fig:terminal>
  Let $0 eq.not y in U_N$, and set $h = parallel y parallel_U > 0$. On the closed ball ${ x in D_N : parallel x parallel_D lt.eq 5 h }$, define
  #[#set math.equation(numbering: n => "(4.12)")
   $ s \( x \) = frac(x, max { parallel x parallel_D \, h \/ 6 }) \, #h(2em) T \( x \) = \( S_(s \( x \))^(\( N \)) \)^(- 1) \( y \, 0 \) . $ <eq:brouwer-map>]
  The denominator is positive even at $x = 0$, so $s \( x \) in B$ depends continuously on $x$. Equations (4.10)–(4.11) show that $T$ is a continuous self-map of this finite-dimensional closed ball. Brouwer’s fixed-point theorem gives $x = T \( x \)$. At that fixed point,
  $ h = parallel \( y \, 0 \) parallel = parallel S_(s \( x \))^(\( N \)) x parallel lt.eq 5 parallel x parallel_D \, $
  and therefore $parallel x parallel_D gt.eq h \/ 5 > h \/ 6$. The state in (4.12) is now the normalized state $s_x$, not the regularized state used near zero. The blocks of $g \( x \)$ in the $N$-square are $y$, and (4.9) gives $a_(i \, N) = 0$ for every $i lt.eq N$.
  It remains to check the blocks omitted from the finite equation. The input is zero outside $D_N$. The only outside block with a possibly nonzero predecessor scalar is $\( i \, N + 1 \)$ for $i lt.eq N$. There
  $ \( g \( x \) \)^(i \, N + 1) = v^(i \, N + 1) \( s_x \) a_(i \, N) = 0 . $
  All other outside blocks have zero input and zero predecessor scalar. Thus $g \( x \) = y$ in $U$. The zero target is $g \( 0 \)$, so $U_N subset g \( D \)$ for every $N$.
  Every finitely supported element of $U$ belongs to some $U_N$, and such elements are dense. The image $g \( D \)$ is closed: if $g \( x_k \)$ converges in $U$, the positive lower bound (4.4) makes $\( x_k \)$ Cauchy in the Banach space $D$; its limit $x$ satisfies $g \( x_k \) arrow.r g \( x \)$ by continuity. Hence $g \( D \)$ is both dense and closed in $U$, and is all of $U$. ◻
]

Let $P : D arrow.r U$ be the projection and, for $s in B$, put

#[#set math.equation(numbering: n => "(4.13)")
 $ h \( s \) = \( S_s - P \) s . $ <eq:h-definition>]

The frozen lemma ensures $h \( s \) in U$, and (3.5) is exactly its $gamma$-coordinate. Notice that $S_s s$ uses $s$ itself as state even when $parallel s parallel < 1$, whereas $g \( s \)$ uses $s \/ parallel s parallel$. The lifting argument will use (4.13) on $B$ and (4.3) only on normalized states. By (3.6), the correction coordinates have common bounds

#[#set math.equation(numbering: n => "(4.14)")
 $ A := sup_gamma parallel f_gamma parallel_oo lt.eq 4 \, #h(2em) L_0 := sup_gamma "Lip" \( f_gamma \) lt.eq 4 + 12 eta . $ <eq:base-bounds>]

== 5 Selected tests and their supports <sec:tests>

The next goal is to construct a Banach space that lifts the correction $h \( s \) = \( S_s - P \) s$ and contains no linear $c_0$. We use the coordinate functions $f_gamma$ of (3.5), with exactly the finite-dependence and support assertions (3.6)–(3.7). The operations below enlarge the family of tests while retaining quantitative control of where each test can be nonzero.

=== 5.1 Two local operations <two-local-operations>

Fix a label $gamma = \( lambda \, j \, xi \)$ and its nonempty finite set $I = I_gamma$. A function on $B$ depending only on $I$ is identified with its function on the cube $\[ - 1 \, 1 \]^I$, by evaluating at the zero extension of a cube point. Write $s \|_I$ for coordinate restriction. For a dyadic scale $epsilon = 2^(- a)$, $a in bb(N)_0 = { 0 \, 1 \, dots.h }$, let

$ cal(Q)_(I \, epsilon) = #scale(x: 120%, y: 120%)[\(] \[ - 1 \, 1 \] ∩ \( epsilon \/ 8 \) bb(Z) #scale(x: 120%, y: 120%)[\)]^I . $

This is a finite grid including both endpoints in each coordinate. Every point of the cube is within $epsilon \/ 16$, hence within $epsilon \/ 8$, of a grid point in the supremum norm.

Define the $2$-Lipschitz function

$ chi \( t \) = cases(delim: "{", 0 \, & 0 lt.eq t lt.eq 1 \/ 2 \,, 2 t - 1 \, & 1 \/ 2 < t < 1 \,, 1 \, & t gt.eq 1 .) $

For a Lipschitz function $u$ depending on $I$, and $q in cal(Q)_(I \, epsilon)$, put

#[#set math.equation(numbering: n => "(5.1)")
 $ \( G_(q \, epsilon) u \) \( s \) & = u \( q \) + chi #h(-1em) (frac(parallel s \|_I - q parallel_oo, epsilon)) \( u \( s \) - u \( q \) \) \,\
R_(q \, epsilon) u & = G_(q \, epsilon) u - u . $ <eq:G>]

Here $u \( q \)$ means evaluation at the zero extension of $q$. Both operations are linear in $u$, retain dependence on $I$, and $G_(q \, epsilon) u$ is the constant $u \( q \)$ on the open cylinder $parallel s \|_I - q parallel_oo < epsilon \/ 2$. Thus $G$ makes $u$ locally constant and changes it only inside the radius-$epsilon$ cylinder; $R$ records that change. The identity $G = upright("Id") + R$ will separate fixed parts of a test from changes occurring at small scales.

#thm([Lemma 5.1.])[
  (Bounds and geometric support).  #emph[For every such $u \, q \, epsilon$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ parallel R_(q \, epsilon) u parallel_oo & lt.eq epsilon "Lip" \( u \) \, & "Lip" \( R_(q \, epsilon) u \) & lt.eq 3 "Lip" \( u \) \, & "Lip" \( G_(q \, epsilon) u \) & lt.eq 4 "Lip" \( u \) \,\
parallel G_(q \, epsilon) u parallel_oo & lt.eq parallel u parallel_oo \, & parallel R_(q \, epsilon) u parallel_oo & lt.eq 2 parallel u parallel_oo . $ <eq:operation-lip>]

 Let 
$ K_I \( u \) = overline({ s \|_I : s in B \, med u \( s \) eq.not 0 })^(thin \[ - 1 \, 1 \]^I) . $

 In the next display write $G = G_(q \, epsilon)$ and $R = R_(q \, epsilon)$. With $K_epsilon = { p : "dist"_oo \( p \, K \) lt.eq epsilon }$ and $diameter_epsilon = diameter$, one has 
#[#set math.equation(numbering: n => "(5.3)")
 $ K_I \( G u \) \, K_I \( R u \) subset K_I \( u \)_epsilon \, #h(2em) K_I \( R u \) subset overline(B)_oo \( q \, epsilon \) . $ <eq:operation-support>]

]
] <lem:operations>

#proof[
  Set $a \( s \) = 1 - chi \( parallel s \|_I - q parallel_oo \/ epsilon \)$. Then
  $ R_(q \, epsilon) u \( s \) = a \( s \) \( u \( q \) - u \( s \) \) \, #h(2em) 0 lt.eq a lt.eq 1 \, #h(2em) "Lip" \( a \) lt.eq 2 \/ epsilon . $
  If $a \( s \) eq.not 0$, then $parallel s \|_I - q parallel_oo < epsilon$; the cylindrical Lipschitz bound gives $\| u \( q \) - u \( s \) \| lt.eq epsilon "Lip" \( u \)$. This proves the first supremum estimate in (5.2).
  To compare $R u \( s \)$ and $R u \( t \)$, there is nothing to prove if both values of $a$ are zero. Otherwise interchange $s \, t$, if needed, so that $a \( t \) eq.not 0$. The identity
  $ R u \( s \) - R u \( t \) = a \( s \) \( u \( t \) - u \( s \) \) + \( a \( s \) - a \( t \) \) \( u \( q \) - u \( t \) \) $
  bounds the two terms by $"Lip" \( u \) parallel s - t parallel_D$ and $\( 2 \/ epsilon \) parallel s - t parallel_D thin epsilon "Lip" \( u \)$, respectively. Thus $"Lip" \( R u \) lt.eq 3 "Lip" \( u \)$, and $G u = u + R u$ gives $"Lip" \( G u \) lt.eq 4 "Lip" \( u \)$. The formula for $G$ is a convex combination of $u \( q \)$ and $u \( s \)$, so it does not increase the supremum norm. The bound for $R = G - u$ follows.
  For the support assertions, if a new output is nonzero at $s$ while $u \( s \) = 0$, then $u \( q \) eq.not 0$ and $parallel s \|_I - q parallel_oo < epsilon$. If $u \( s \) eq.not 0$, its projection already lies in $K_I \( u \)$. This covers both $G$ and $R$. Taking closures gives their inclusion in $K_I \( u \)_epsilon$; the latter set is closed because the cube is compact. In addition, $R u \( s \) = 0$ whenever $parallel s \|_I - q parallel_oo gt.eq epsilon$, which proves its ball inclusion. If $u = 0$, all statements are immediate. ◻
]

=== 5.2 Scale budgets and tail factors <scale-budgets-and-tail-factors>

For $h gt.eq 1$, let $cal(T)_h$ consist of functions obtained from a single $f_gamma$, $gamma = \( lambda \, j \, xi \)$, by $m lt.eq h$ successive operations $G$ or $R$ on $I_gamma$. A representation with $m = 0$ is allowed. For $m gt.eq 1$, the scales in their order of application must satisfy

#[#set math.equation(numbering: n => "(5.4)")
 $ epsilon_1 gt.eq epsilon_2 gt.eq dots.h.c gt.eq epsilon_m > 0 \, #h(2em) sum_(k = 1)^m epsilon_k < ell_j / 2 . $ <eq:scale-rule>]

The sum is zero for $m = 0$. Each scale is dyadic and each center is in its corresponding finite grid. We refer to $gamma$ as a representing label, since a function may have more than one representation. The strict inequality leaves a positive amount of budget for a further sufficiently small operation. The order will ensure that every operation after a small one has at most that scale.

For a continuous function on $B$, let $"supp"_B u = overline({ s in B : u \( s \) eq.not 0 })^(thin B)$. All support statements refer to these concrete generated functions. Later, molecule pairings will ignore additive constants, but we do not replace a generated function by another representative modulo constants: that could change its support and its constant value on a cylinder.

#thm([Lemma 5.2.])[
  (Propagation of the correction support).  #emph[Suppose $u in cal(T)_h$ has a representation based at $gamma = \( lambda \, j \, xi \)$ with total scale $e = sum_(k = 1)^m epsilon_k$. On $"supp"_B u$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ cases(delim: "{", parallel pi_j s - xi parallel_oo lt.eq 2 d_j + e \, & j gt.eq 1 \,, r_lambda \( s \) gt.eq ell_j - e \, & j < J_lambda .) $ <eq:support-sharp>]

 In particular, on the same support, 
#[#set math.equation(numbering: n => "(5.6)")
 $ cases(delim: "{", parallel pi_j s - xi parallel_oo lt.eq 2 d_j + ell_j \/ 2 \, & j gt.eq 1 \,, r_lambda \( s \) gt.eq ell_j \/ 2 \, & j < J_lambda .) $ <eq:support-coarse>]

]
] <lem:support>

#proof[
  Start with (3.7), which holds on the relative support of $f_gamma$ as well as its nonzero set, because its two inequalities describe closed subsets of $B$. Suppose the claim has been proved for the old function and add an operation of scale $epsilon$. If the new function is nonzero at $s$ and the old one is zero there, the proof of Lemma 8 gives an old nonzero value at the zero extension of $q$, with $parallel s \|_(I_gamma) - q parallel_oo < epsilon$. Otherwise the old support already contains $s$. Both $pi_j$ and $r_lambda$ depend only on $I_gamma$; coordinate restriction has norm one, and $r_lambda$ is $1$-Lipschitz on that cube. The first upper bound therefore increases by at most $epsilon$, and the second lower bound decreases by at most $epsilon$. Induction proves (5.5) on the nonzero set. Taking relative closure preserves the closed inequalities. Finally, (5.4) gives (5.6). ◻
]

For $N gt.eq 1$, define the coordinate tail

#[#set math.equation(numbering: n => "(5.7)")
 $ tau_N \( s \) = sup_(k > N) \| s_k \| \, #h(2em) b_(c \, N) \( s \) = min { 1 \, \( 2 - tau_N \( s \) \/ c \)_(+) } quad \( c > 0 \) \, $ <eq:tail>]

where $a_(+) = max { a \, 0 }$. The function $tau_N$ is $1$-Lipschitz, and $tau_N \( s \) arrow.r 0$ for each $s in B$. Both $b_(c \, N)$ and $b_(c \, N) - 1$ have supremum norm at most one and Lipschitz constant at most $1 \/ c$. Their relative supports satisfy

#[#set math.equation(numbering: n => "(5.8)")
 $ "supp"_B b_(c \, N) subset { tau_N lt.eq 2 c } \, #h(2em) "supp"_B \( b_(c \, N) - 1 \) subset { tau_N gt.eq c } . $ <eq:tail-support>]

For example, the first function vanishes when $tau_N gt.eq 2 c$, and the second vanishes when $tau_N lt.eq c$; closure gives the displayed weak inequalities.

Let $cal(V)_h$ consist of all products

#[#set math.equation(numbering: n => "(5.9)")
 $ u product_(r = 1)^l beta_r $ <eq:Vclass>]

where $u in cal(T)_h$ has a representing label with $j lt.eq h$, $0 lt.eq l lt.eq h$, and each $beta_r$ is $b_(c_r \, N_r)$ or $b_(c_r \, N_r) - 1$, with $N_r gt.eq 1$ and

$ c_r in { 2^(- a) : 0 lt.eq a lt.eq h } . $

The empty product is one. The support of a product is contained in the support of its cylindrical factor $u$, so every such test inherits (5.6). We will use the countable list of classes

#[#set math.equation(numbering: n => "(5.10)")
 $ cal(T)_1 \, cal(V)_1 \, cal(T)_2 \, cal(V)_2 \, dots.h . $ <eq:classes>]

#thm([Lemma 5.3.])[
  (Bounds in each fixed class).  #emph[With $A \, L_0$ from (4.14), the following bounds are uniform over all tests of the indicated class: 
#[#set math.equation(numbering: n => "(5.11)")
 $ & parallel u parallel_oo & "Lip" \( u \)\
u in cal(T)_h & 2^h A & 4^h L_0\
u in cal(V)_h & 2^h A & 4^h L_0 + h 4^h A . $ <eq:class-bounds>]

]
] <lem:class-bounds>

#proof[
  Iterating (5.2)–(5.2) gives the first row. For the second, every tail factor has supremum norm at most one and Lipschitz constant at most $2^h$. A product of at most $h$ such factors has Lipschitz constant at most $h 2^h$, by telescoping the product difference. The product rule then gives
  $ "Lip" #h(-1em) (u product_r beta_r) lt.eq 4^h L_0 + \( 2^h A \) \( h 2^h \) = 4^h L_0 + h 4^h A . $
  Its supremum norm is at most $2^h A$. ◻
]

We have two useful consequences of the support bounds. For a fixed bounded set of bands $j$, the second line of (5.6) gives a positive radial threshold whenever $j < J_lambda$. For $j arrow.r oo$, the first line confines the first $j$ coordinates to a radius $2 d_j + ell_j \/ 2 arrow.r 0$. Section 7 will use precisely these alternatives, after the next section extends the tests from finite molecules to the completed Banach space.

== 6 Molecules and the lifted correction <sec:molecules>

We now turn the selected tests into a Banach space. The norm must do two jobs: control point differences so that the correction can be lifted Lipschitzly, and remember lists of tests whose signed sums have a common Lipschitz bound. The latter feature will rule out linear $c_0$.

=== 6.1 The quotient and its completion <the-quotient-and-its-completion>

Let $cal(M)_0 \( B \)$ be the real vector space of mass-zero finite formal sums

$ m = sum_(s in B) a_s delta_s \, #h(2em) \# { s : a_s eq.not 0 } < oo \, #h(2em) sum_s a_s = 0 . $

For a real function $u$ on $B$, set $chevron.l u \, m chevron.r = sum_s a_s u \( s \)$. Constants pair to zero. This follows the mass-zero molecule construction of Arens and Eells #cite(label("AE56")) and its later Lipschitz-free formulation #cite(label("GK03")). The norm below is built from the selected classes (5.10); no universal property of the usual free space is assumed.

For every triple $d = \( cal(L) \, C \, p \)$, where $cal(L)$ is one of the listed classes, $C in bb(N)$, and $p = 1 + 1 \/ k$ for $k in bb(N)$, define

#[#set math.equation(numbering: n => "(6.1)")
 $ sigma_d \( m \) = sup {(sum_(nu = 1)^l \| chevron.l u_nu \, m chevron.r \|^p)^(1 \/ p) : l gt.eq 0 \, quad u_1 \, dots.h \, u_l in cal(L) \,\
"Lip" #h(-1em) (sum_(nu = 1)^l e_nu u_nu) lt.eq C med upright("for every ") \( e_nu \) in { - 1 \, 1 }^l} . $ <eq:sigma>]

The empty list contributes zero. Lists may contain repetitions and tests with the same representing label; their sole compatibility condition is the displayed Lipschitz bound for every choice of signs. Equivalently, a list is admissible precisely when

#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(nu = 1)^l \| u_nu \( s \) - u_nu \( t \) \| lt.eq C parallel s - t parallel_D #h(2em) \( s \, t in B \) . $ <eq:admissible-increments>]

To obtain this inequality, choose signs matching the increments $u_nu \( s \) - u_nu \( t \)$; the converse follows from the triangle inequality.

Enumerate the triples by $d = 1 \, 2 \, dots.h$, write $C_d$ for their integer component, and set

#[#set math.equation(numbering: n => "(6.3)")
 $ alpha_d = 2^(- d) / C_d^2 \, #h(2em) parallel m parallel_0 = (sum_(d gt.eq 1) alpha_d sigma_d \( m \)^2)^(1 \/ 2) . $ <eq:norm>]

The outer square sum and the exponents approaching one serve distinct purposes in Section 7. The square sum forces one fixed seminorm to detect a subsequence of any hypothetical $c_0$ basis. For that fixed test class and Lipschitz bound, a second exponent $p' < p$ converts detection by a list into detection by one scalar test. Both choices are part of the obstruction, as well as of the norm construction.

#thm([Lemma 6.1.])[
  (Exact completed norm).  #emph[Formula (6.3) is a finite seminorm on $cal(M)_0 \( B \)$. Let $N$ be its kernel, and let $Z$ be the Banach completion of $cal(M)_0 \( B \) \/ N$ with the induced norm. Then $Z$ is separable, and 
#[#set math.equation(numbering: n => "(6.4)")
 $ zeta : B arrow.r Z \, #h(2em) zeta \( s \) = \[ delta_s - delta_0 \] $ <eq:zeta>]

 is $1$-Lipschitz with $zeta \( 0 \) = 0$. Each $sigma_d$ descends and extends continuously to a seminorm on $Z$, and the exact formula 
#[#set math.equation(numbering: n => "(6.5)")
 $ parallel z parallel_Z^2 = sum_(d gt.eq 1) alpha_d sigma_d \( z \)^2 $ <eq:completed-norm>]

 holds for every $z in Z$.]
] <lem:completion>

#proof[
  For $s \, t in B$ and an admissible list for $d$, inequality (6.2) bounds the sum of the absolute increments. Since the $ell_p$ norm is no larger than this sum,
  #[#set math.equation(numbering: n => "(6.6)")
   $ sigma_d \( delta_s - delta_t \) lt.eq C_d parallel s - t parallel_D . $ <eq:molecule-bound>]
  For a fixed list, Minkowski’s inequality makes its expression in (6.1) a seminorm in $m$; the supremum of these expressions is also a seminorm, once finite. Every $m = sum_s a_s delta_s$ of mass zero equals $sum_s a_s \( delta_s - delta_0 \)$. Thus
  $ sigma_d \( m \) lt.eq C_d sum_s \| a_s \| parallel s parallel_D . $
  This proves finiteness both of $sigma_d$ and of $parallel m parallel_0$, because $sum_d alpha_d C_d^2 = sum_d 2^(- d) = 1$. Minkowski’s inequality in $ell_2$, applied to the weighted seminorms, proves subadditivity of $parallel dot.op parallel_0$; homogeneity is immediate. Its kernel is therefore a linear subspace, and quotienting by it produces a norm.
  Equation (6.6) and the same square sum give
  $ parallel delta_s - delta_t parallel_0 lt.eq parallel s - t parallel_D . $
  This proves the assertion about $zeta$. The ball $B$ is separable because $D$ is a countable-coordinate $c_0$ space. If $B_0$ is a countable dense subset, continuity of $zeta$ makes $zeta \( B_0 \)$ dense in $zeta \( B \)$. The real linear span of $zeta \( B \)$ is the quotient molecule space; its rational span over $B_0$ is consequently dense in $Z$. Hence $Z$ is separable.
  For molecules $m \, m'$,
  #[#set math.equation(numbering: n => "(6.7)")
   $ \| sigma_d \( m \) - sigma_d \( m' \) \| lt.eq sigma_d \( m - m' \) lt.eq alpha_d^(- 1 \/ 2) parallel m - m' parallel_0 . $ <eq:sigma-continuity>]
  In particular $sigma_d$ vanishes on $N$, descends, and extends continuously to $Z$; subadditivity and homogeneity pass to limits. Moreover the map
  $ m mapsto \( sqrt(alpha_d) sigma_d \( m \) \)_(d gt.eq 1) $
  is $1$-Lipschitz into $ell_2$, since the coordinate differences are bounded by $sqrt(alpha_d) sigma_d \( m - m' \)$. If molecules converge to $z in Z$, their images therefore converge in $ell_2$. The $d$-th coordinate of the limit is $sqrt(alpha_d) sigma_d \( z \)$ by continuity of each seminorm. The norms of those images are exactly the molecule norms, which converge to $parallel z parallel_Z$. This proves (6.5). ◻
]

=== 6.2 Fixed-class duality <fixed-class-duality>

The obstruction argument will modify a test through a pointwise limit after a vector in $Z$ has already been fixed. The next lemma justifies that passage, and also retains the exact list formula after completion.

#thm([Lemma 6.2.])[
  (Dual tests and pointwise limits).  #emph[Every test in $cal(T)_h$ or $cal(V)_h$ defines a bounded linear functional on $Z$ by its molecule pairing. For each fixed class $cal(L)$, there is a finite common bound $B_(cal(L))$ for these dual norms. For each fixed triple $d = \( cal(L) \, C \, p \)$, formula (6.1) remains exact on $Z$, with the extended test pairings.]
  #emph[If $u_n in cal(L)$ and $u_n \( s \) arrow.r u \( s \)$ for every $s in B$, then the pointwise limit defines a bounded functional on $Z$ of norm at most $B_(cal(L))$, and $chevron.l u_n \, z chevron.r arrow.r chevron.l u \, z chevron.r$ for each fixed $z in Z$. More precisely, for any molecule class $m$ and any $z in Z$, 
#[#set math.equation(numbering: n => "(6.8)")
 $ \| chevron.l u_n - u \, z chevron.r \| lt.eq \| chevron.l u_n - u \, m chevron.r \| + 2 B_(cal(L)) parallel z - m parallel_Z . $ <eq:fixed-vector>]

]
] <lem:duality>

#proof[
  Choose an integer $C_(cal(L))$ no smaller than the uniform Lipschitz bound in Lemma 10. Every singleton $\( u \)$, $u in cal(L)$, is admissible for the one triple $d_(cal(L)) = \( cal(L) \, C_(cal(L)) \, 2 \)$. Thus
  #[#set math.equation(numbering: n => "(6.9)")
   $ \| chevron.l u \, m chevron.r \| lt.eq sigma_(d_(cal(L))) \( m \) lt.eq alpha_(d_(cal(L)))^(- 1 \/ 2) parallel m parallel_0 . $ <eq:dual-bound>]
  It vanishes on $N$ and extends to $Z^(*)$, uniformly with $B_(cal(L)) = alpha_(d_(cal(L)))^(- 1 \/ 2)$.
  For an admissible list $bold(u) = \( u_1 \, dots.h \, u_l \)$ of a fixed triple $d$, its evaluation map $Lambda_(bold(u)) m = \( chevron.l u_nu \, m chevron.r \)_(nu = 1)^l$ into $ell_p^l$ has norm at most $alpha_d^(- 1 \/ 2)$ on the molecule quotient. It therefore extends with that bound to $Z$. The supremum of $parallel Lambda_(bold(u)) z parallel_p$ over all admissible lists is finite and $alpha_d^(- 1 \/ 2)$-Lipschitz as a seminorm in $z$: its change between $z \, z'$ is bounded by the same supremum at $z - z'$. This supremum agrees with $sigma_d$ on the dense molecule quotient. It is therefore the continuous extension of $sigma_d$, which proves the exact formula on $Z$.
  For a pointwise-convergent sequence, the pairings converge on every finite molecule. Inequality (6.9) passes to that pointwise limit, so its molecule functional extends with norm at most $B_(cal(L))$. Applying the two common dual bounds to $z - m$ gives (6.8). For a prescribed $z$ and tolerance $delta > 0$, choose a molecule class $m$ with $parallel z - m parallel_Z < delta \/ \( 4 B_(cal(L)) \)$, and then choose $n$ so large that the finite pairing in (6.8) is less than $delta \/ 2$. This proves convergence on $z$. The choice of $m$ and $n$ may depend on $z$; no convergence uniform over a moving sequence of vectors is asserted. ◻
]

#thm([Lemma 6.3.])[
  (The $c_0$-valued correction map).  #emph[There is a bounded linear map $Q : Z arrow.r U$ such that 
#[#set math.equation(numbering: n => "(6.10)")
 $ Q zeta \( s \) = h \( s \) = \( S_s - P \) s #h(2em) \( s in B \) . $ <eq:Qzeta>]

]
] <lem:Q>

#proof[
  Define on formal molecules
  $ Q_0 m = sum_s a_s h \( s \) in U . $
  This finite sum lies in $U$, not merely in $ell_oo$, because each $h \( s \)$ lies in $U$. Each coordinate function $f_gamma$ belongs to $cal(T)_1$ through its zero-operation representation. Choose an integer $C_0 gt.eq L_0$ and the triple $d_0 = \( cal(T)_1 \, C_0 \, 2 \)$. Every singleton $\( f_gamma \)$ is admissible, whence
  $ parallel Q_0 m parallel_U = sup_gamma \| chevron.l f_gamma \, m chevron.r \| lt.eq sigma_(d_0) \( m \) lt.eq alpha_(d_0)^(- 1 \/ 2) parallel m parallel_0 . $
  Thus $Q_0$ vanishes on $N$, descends, and extends to a bounded linear map into the complete space $U$. Since $h \( 0 \) = 0$, applying it to $delta_s - delta_0$ proves (6.10). ◻
]

=== 6.3 Radial extension <radial-extension>

The point map $zeta$ is defined on $B$. Its radial extension lifts the homogeneous shift correction on all of $D$.

#thm([Lemma 6.4.])[
  (Lipschitz lift).  #emph[Define 
#[#set math.equation(numbering: n => "(6.11)")
 $ K \( 0 \) = 0 \, #h(2em) K \( x \) = parallel x parallel_D thin zeta #h(-1em) (frac(x, parallel x parallel_D)) quad \( x eq.not 0 \) . $ <eq:K>]

 Then $K : D arrow.r Z$ is positively homogeneous and $"Lip" \( K \) lt.eq 3$. It satisfies the exact identity 
#[#set math.equation(numbering: n => "(6.12)")
 $ Q K = g - P . $ <eq:lift>]

]
] <lem:K>

#proof[
  Since $zeta \( 0 \) = 0$ and $"Lip" \( zeta \) lt.eq 1$, $parallel zeta \( s \) parallel_Z lt.eq 1$ for $s in B$. Suppose $a = parallel x parallel_D gt.eq b = parallel x' parallel_D > 0$, and write $s = x \/ a$, $s' = x' \/ b$. Splitting at $b zeta \( s \)$ gives
  $ parallel K \( x \) - K \( x' \) parallel_Z lt.eq \( a - b \) parallel zeta \( s \) parallel_Z + b parallel zeta \( s \) - zeta \( s' \) parallel_Z lt.eq parallel x - x' parallel_D + b parallel s - s' parallel_D . $
  The normalization estimate (4.5) bounds the last term by $2 parallel x - x' parallel_D$. If an endpoint is zero, use $parallel K \( x \) parallel_Z lt.eq parallel x parallel_D$. This proves the Lipschitz bound. For $x eq.not 0$, (6.10), (4.13), and (4.3) give
  $ Q K \( x \) = parallel x parallel_D h \( x \/ parallel x parallel_D \) = S_(x \/ parallel x parallel_D) x - P x = g \( x \) - P x . $
  All terms vanish at zero, and positive homogeneity follows directly from (6.11). ◻
]

We have now obtained the exact data $Q \, K \, g$ of Lemma 2. No surjectivity of $Q$ was used or proved. The remaining task is to show that the completed space $Z$ has no linear copy of $c_0$.

== 7 Detectors exclude linear $c_0$ <sec:no-c0>

A linear copy of $c_0$ would provide vectors bounded away from zero whose finite signed sums are uniformly bounded. We first show that one class of tests detects a subsequence of these vectors. We then identify the additional property needed for a contradiction: the tests’ finite signed sums must have one Lipschitz bound. The rest of the section obtains this property by modifying the detectors and separating or nesting their supports. Supports always refer to the concrete generated functions on $B$.

=== 7.1 From bounded signed sums to individual detectors <from-bounded-signed-sums-to-individual-detectors>

The extraction has two stages. The outer square sum prevents detection from escaping through different seminorms; within one seminorm, the exponents approaching one prevent it from spreading over arbitrarily many small scalar pairings.

#thm([Lemma 7.1.])[
  (One class detects a subsequence).  #emph[Suppose $\( m_i \) subset Z$ satisfies, for some $r \, M > 0$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ parallel m_i parallel_Z gt.eq r \, #h(2em) ∥sum_(i in H) epsilon.alt_i m_i∥_Z lt.eq M quad upright("for all finite ") H upright(" and all signs ") epsilon.alt_i . $ <eq:bounded-signed>]

 Then $u \( m_i \) arrow.r 0$ for every $u in Z^(*)$. After a subsequence, there are tests $F_i$ in one listed class $cal(L)$ and a constant $delta > 0$ with 
#[#set math.equation(numbering: n => "(7.2)")
 $ \| chevron.l F_i \, m_i chevron.r \| gt.eq delta . $ <eq:detected>]

]
] <lem:detectors>

#proof[
  For any fixed $u in Z^(*)$, choosing signs matching $u \( m_i \)$ in (7.1) gives
  $ sum_(i in H) \| u \( m_i \) \| lt.eq M parallel u parallel $
  for every finite $H$. Thus $sum_i \| u \( m_i \) \| < oo$, and in particular $u \( m_i \) arrow.r 0$. Also $parallel m_i parallel lt.eq M$.
  We first prove that one fixed seminorm stays away from zero on a subsequence. Otherwise $sigma_d \( m_i \) arrow.r 0$ for every $d$. The vectors
  $ v_i = \( sqrt(alpha_d) sigma_d \( m_i \) \)_(d gt.eq 1) $
  then converge coordinatewise to zero in $ell_2$, while $r lt.eq parallel v_i parallel_2 = parallel m_i parallel_Z lt.eq M$. A direct gliding-hump selection gives disjoint finite intervals $A_i$ of indices, after a subsequence, such that
  #[#set math.equation(numbering: n => "(7.3)")
   $ sum_(d in A_i) alpha_d sigma_d \( m_i \)^2 gt.eq r^2 \/ 4 . $ <eq:hump-mass>]
  Indeed, once the endpoint of the preceding interval is fixed, coordinatewise convergence makes the squared mass before that endpoint less than $r^2 \/ 4$ for a sufficiently late $v_i$. Then choose a new finite endpoint so that the squared tail mass is less than $r^2 \/ 4$. The mass in between is at least $r^2 \/ 2$, which implies (7.3).
  The function $sigma_d^2$ is even and convex, because a seminorm is convex and squaring is convex and increasing on $\[ 0 \, oo \)$. For fixed $y \, m$, Jensen’s inequality applied to $y + m$ and $- y + m$ gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ frac(sigma_d \( y + m \)^2 + sigma_d \( y - m \)^2, 2) gt.eq sigma_d \( m \)^2 . $ <eq:seminorm-convexity>]
  For independent random signs and a finite $H$, average first over the sign of $m_i$ and use (7.4). Thus
  $ bb(E) thin sigma_d #h(-1em) (sum_(k in H) epsilon.alt_k m_k)^2 gt.eq sigma_d \( m_i \)^2 quad \( i in H \) . $
  The exact norm formula, (7.1), the disjointness of the $A_i$, and (7.3) imply
  $ M^2 gt.eq bb(E) ∥sum_(k in H) epsilon.alt_k m_k∥_Z^2 gt.eq sum_(i in H) sum_(d in A_i) alpha_d sigma_d \( m_i \)^2 gt.eq \| H \| r^2 \/ 4 \, $
  a contradiction for large $H$. Hence some $d = \( cal(L) \, C \, p \)$ has $sigma_d \( m_i \) gt.eq a > 0$ on a subsequence.
  Choose a listed exponent $p' = 1 + 1 \/ k' < p$, with the same $cal(L) \, C$, and call its triple $d'$. Its seminorm is bounded on these vectors by
  $ sigma_(d') \( m_i \) lt.eq alpha_(d')^(- 1 \/ 2) M = : B_0 . $
  For each $i$, choose a finite admissible list for $d$ whose $ell_p$ value on $m_i$ is at least $a \/ 2$. Put $x_nu = \| chevron.l u_nu \, m_i chevron.r \|$. The same list is admissible for $d'$, because only the exponent changed. Consequently
  $ \( a \/ 2 \)^p lt.eq sum_nu x_nu^p lt.eq \( max_nu x_nu \)^(p - p') sum_nu x_nu^(p') lt.eq \( max_nu x_nu \)^(p - p') B_0^(p') . $
  The list is nonempty and $B_0 > 0$. One of its tests therefore has evaluation at least
  $ delta = (frac(\( a \/ 2 \)^p, B_0^(p')))^(1 \/ \( p - p' \)) > 0 . $
  Choosing that test as $F_i$ proves (7.2). ◻
]

=== 7.2 The growth forced by compatible detectors <the-growth-forced-by-compatible-detectors>

Call a sequence of tests #emph[compatible] if all its finite signed sums have a common Lipschitz bound. The norm was defined using precisely such lists. Once compatible tests detect the vectors, a single seminorm forces the following growth.

#thm([Lemma 7.2.])[
  (Growth from compatible detectors).  #emph[Let $\( m_i \) subset Z$, and let $F_i$ belong to one listed class $cal(L)$. Suppose there are $delta > 0$ and an integer $C gt.eq 1$ such that 
$ \| chevron.l F_i \, m_i chevron.r \| gt.eq delta \, #h(2em) "Lip" #h(-1em) (sum_(i in H) epsilon.alt_i F_i) lt.eq C $

 for every $i$, every finite $H$, and all signs $epsilon.alt_i$. For the listed triple $d = \( cal(L) \, C \, 2 \)$, every nonempty finite $H$ satisfies 
#[#set math.equation(numbering: n => "(7.5)")
 $ max_(epsilon.alt_i in { - 1 \, 1 }) ∥sum_(i in H) epsilon.alt_i m_i∥_Z gt.eq sqrt(alpha_d) thin delta sqrt(\| H \|) . $ <eq:detector-growth>]

]
] <lem:detector-growth>

#proof[
  The list $\( F_k \)_(k in H)$ is admissible for $d$, including when labels repeat. For independent real random signs, the exact list formula in Lemma 12 gives
  $ bb(E) thin sigma_d #h(-1em) (sum_(i in H) epsilon.alt_i m_i)^2 & gt.eq bb(E) sum_(k in H) lr(|sum_(i in H) epsilon.alt_i chevron.l F_k \, m_i chevron.r|)^2\
 & = sum_(k in H) sum_(i in H) \| chevron.l F_k \, m_i chevron.r \|^2 gt.eq \| H \| delta^2 . $
  The equality uses cancellation of cross terms under the independent signs; no cross-pairing is assumed to vanish. By (6.5),
  $ max_(epsilon.alt_i in { - 1 \, 1 }) ∥sum_(i in H) epsilon.alt_i m_i∥_Z^2 gt.eq bb(E) ∥sum_(i in H) epsilon.alt_i m_i∥_Z^2 gt.eq alpha_d \| H \| delta^2 . $
  Taking square roots proves (7.5). ◻
]

It remains to make the detectors from Lemma 15 compatible without losing their nonzero pairings. We will use two support configurations: disjoint supports, or later supports contained in cylinders where earlier functions are constant.

=== 7.3 Support conditions for compatibility <support-conditions-for-compatibility>

Localizing detecting Lipschitz functions and combining them with a common Lipschitz bound is also central to Kalton’s arguments for metric free spaces #cite(label("Kalton04")) Lemma 4.5 and proof of Theorem 4.6. Here the supports are finite-coordinate cylinders and tail regions, and their compatibility must be retained within the selected test classes defining $Z$.

#thm([Lemma 7.3.])[
  (Compatible supports).  #emph[Let $B$ be a convex subset of a normed space. Let $u_i \, b_i$ be continuous real functions on $B$, with $b_i$ Lipschitz, and put $F_i = u_i b_i$. Suppose $"Lip" \( F_i \) lt.eq L$ for every $i$.]
  + #emph[If the closed relative supports $"supp"_B F_i$ are pairwise disjoint, every finite signed sum of the $F_i$ has Lipschitz constant at most $L$.]
  + #emph[Suppose that for each $i$ there is a relatively open set $C_i subset B$ and a scalar $e_i$ such that $u_i = e_i$ on $C_i$ and $"supp"_B u_k subset C_i$ for every $k > i$. If $sum_i \| e_i \| "Lip" \( b_i \) < oo$, every finite signed sum of the $F_i$ has Lipschitz constant at most 
$ L + sum_i \| e_i \| "Lip" \( b_i \) . $

 If $b_i = 1$ for every $i$, the summability condition is automatic.]
] <lem:compatible>

#proof[
  Fix a finite set of indices and signs. In the first case, at a given point at most one of the corresponding closed supports contains that point. All other summands vanish on a relative neighborhood, so the sum is locally either zero or a single signed $F_i$, with bound $L$.
  In the second case, choose at a given point the largest selected index $j$ whose $u_j$-support contains the point. If there is no such index, every summand vanishes on a common neighborhood, because there are only finitely many closed supports. Otherwise all selected later functions vanish on a neighborhood. The point lies in $C_i$ for each selected $i < j$, so on a smaller neighborhood all those $u_i$ equal $e_i$. On that neighborhood the sum is
  $ epsilon.alt_j F_j + sum_(i < j\
i upright(" selected")) epsilon.alt_i e_i b_i \, $
  and has the asserted local Lipschitz bound.
  To pass from the uniform local bound to a global bound, take any two points of $B$. The segment between them is contained in $B$. Its compact parameter interval has a finite cover by the relative neighborhoods just obtained and hence a Lebesgue number. Subdivide the segment finely enough that each subsegment lies in one such neighborhood, apply the local estimate to each subsegment, and add. The lengths of the collinear subsegments sum to the distance of the endpoints. This proves both global assertions. ◻
]

#thm([Lemma 7.4.])[
  (Tail separation).  #emph[Suppose $F_i$ belong to one listed class and have representations with bounded band indices. Suppose $m_i in Z$ and 
#[#set math.equation(numbering: n => "(7.6)")
 $ \| chevron.l F_i \, m_i chevron.r \| gt.eq delta > 0 \, #h(2em) "supp"_B F_i subset { tau_(M_i) gt.eq c_(*) } \, quad M_i in bb(N) \, quad M_i arrow.r oo \, quad c_(*) > 0 . $ <eq:tail-hypotheses>]

 Then a subsequence has modified tests in one class $cal(V)_H$, with detection at least $delta \/ 2$, whose relative supports are pairwise disjoint.]
] <lem:tail-separation>

#proof[
  Choose a dyadic $c = 2^(- a)$ with $2 c < c_(*)$. If the original class is $cal(T)_h$, view a test as a cylindrical factor with no tail factors; if it is $cal(V)_h$, keep its chosen product representation. A single integer $H$, larger than $h$, the bounded band indices, and $a$, can be chosen so that both $F_i$ and $F_i b_(c \, N)$ belong to $cal(V)_H$ for all $i \, N$. There is room for one extra tail factor.
  For each fixed $i$, $b_(c \, N) \( s \) arrow.r 1$ at every $s in B$, since $tau_N \( s \) arrow.r 0$. Lemma 12, used in this one class, therefore gives $chevron.l F_i b_(c \, N) \, m_i chevron.r arrow.r chevron.l F_i \, m_i chevron.r$. Choose $N$ large enough that the difference has modulus less than $delta \/ 2$; every sufficiently large $N$ then works. This choice is made for the fixed vector $m_i$.
  Select indices recursively. After choosing an index $i$ and such an $N_i$, take the next original index so far out that its $M_k$ exceeds all previously selected $N_i$, which is possible because $M_k arrow.r oo$. Then choose its own $N_k$ as above. For selected $k > i$, the new $i$-th support requires $tau_(N_i) lt.eq 2 c$ by (5.8). The new $k$-th support requires $tau_(M_k) gt.eq c_(*)$ by (7.6), hence $tau_(N_i) gt.eq tau_(M_k) gt.eq c_(*) > 2 c$. The supports are disjoint, and the detection bound follows from the choice of $N_i$. ◻
]

=== 7.4 Selecting compatible detectors <selecting-compatible-detectors>

The next proposition isolates the geometric part of the argument. It uses only weak nullity of the vectors, one fixed test class, and a uniform lower bound on the pairings. The bounded signed sums will enter again only when we apply Lemma 16.

#thm([Proposition 7.5.])[
  (Selection of compatible detectors).  #emph[Let $\( m_i \) subset Z$ be weakly null, meaning $u \( m_i \) arrow.r 0$ for every $u in Z^(*)$. Suppose $F_i$ belong to one listed class $cal(L)$ and 
#[#set math.equation(numbering: n => "(7.7)")
 $ \| chevron.l F_i \, m_i chevron.r \| gt.eq delta > 0 #h(2em) \( i gt.eq 1 \) . $ <eq:selection-detection>]

 There are a subsequence $\( m_(i_k) \)$, a listed class $cal(L)_1$, tests $tilde(F)_k in cal(L)_1$, $delta_1 > 0$, and an integer $C_1 gt.eq 1$ such that 
$ \| chevron.l tilde(F)_k \, m_(i_k) chevron.r \| gt.eq delta_1 \, #h(2em) "Lip" #h(-1em) (sum_(k in H) epsilon.alt_k tilde(F)_k) lt.eq C_1 $

 for every $k$, every finite $H$, and all signs $epsilon.alt_k$.]
] <prop:compatible-detectors>

#proof[
  We pass to subsequences and relabel their indices throughout the proof. Every fixed test pairs to zero in the limit, by weak nullity and Lemma 12.
  Fix a concrete representation of each detector $F_i$. If its class is $cal(T)_h$, take $F_i = u_i$ and no tail factor. If its class is $cal(V)_h$, write $F_i = u_i b_i$, where $u_i$ is its chosen cylindrical factor and $b_i$ is its product of tail factors. Let $gamma_i = \( lambda_i \, j_i \, xi_i \)$ be the chosen label. After subsequences, either the labels are pairwise distinct or one label is repeated throughout. In the distinct case the bands have a bounded subsequence or a subsequence tending to infinity. We handle these three possibilities separately.
  ===== 7.4.1 Distinct labels with bounded bands. <distinct-labels-with-bounded-bands.>
  Every block $Gamma_lambda$ is finite, so pairwise distinct labels force $lambda_i$ to leave every finite set. Since ${ lambda : J_lambda lt.eq J }$ is finite for every $J$, we have $J_(lambda_i) arrow.r oo$. Pass to a further subsequence with one fixed band $j$. Eventually $j < J_(lambda_i)$, and (5.6) gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ r_(lambda_i) gt.eq c_(*) := ell_j \/ 2 > 0 quad upright("on ") "supp"_B F_i . $ <eq:bounded-band-radius>]
  The coordinates used by these radii escape every fixed initial segment. Indeed, each coordinate occurs in at most two radii, so a finite set of coordinates occurs in only finitely many levels. After discarding finitely many terms, choose integers $M_i arrow.r oo$ so that every coordinate used by $r_(lambda_i)$ has index $> M_i$. Then $r_(lambda_i) \( s \) lt.eq tau_(M_i) \( s \)$. Condition (7.8) is the hypothesis of Lemma 18, which gives detectors in one enlarged class with pairwise disjoint supports. Lemma 17(1) gives a common Lipschitz bound for all their finite signed sums.
  ===== 7.4.2 Distinct labels with bands tending to infinity. <distinct-labels-with-bands-tending-to-infinity.>
  Now take $j_i arrow.r oo$. The fixed class must be $cal(T)_h$, because a $cal(V)_h$ representation has $j lt.eq h$. By diagonal extraction from the compact intervals $\[ - 1 \, 1 \]$, the finite tags $xi_i in \[ - 1 \, 1 \]^(j_i)$ converge coordinatewise to some $v_(*) in \[ - 1 \, 1 \]^(bb(N))$. This point need not be in $c_0$. Only its finite coordinate restrictions will be used.
  Write $a_i = 2 d_(j_i) + ell_(j_i) \/ 2$, which tends to zero. For every fixed nonempty finite coordinate set $I$, once $j_i gt.eq max I$, (5.6) gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ sup_(s in "supp"_B F_i) parallel s \|_I - v_(*) \|_I parallel_oo lt.eq a_i + parallel xi_i \|_I - v_(*) \|_I parallel_oo arrow.r 0 . $ <eq:projected-concentration>]
  For each fixed $i$, consider arbitrarily small positive dyadic scales $theta$, below the last existing scale if there is one and with $theta$ less than the remaining strict budget in (5.4). Choose a grid center $q_i \( theta \)$ within $theta \/ 8$ of $v_(*) \|_(I_(gamma_i))$. The test
  $ F_(i \, theta) = G_(q_i \( theta \) \, theta) F_i $
  belongs to $cal(T)_(h + 1)$, as does $F_i$, and
  $ parallel F_(i \, theta) - F_i parallel_oo lt.eq theta "Lip" \( F_i \) lt.eq theta 4^h L_0 . $
  Thus $F_(i \, theta) arrow.r F_i$ pointwise as $theta arrow.b 0$, even though the centers move. For this fixed $i$, Lemma 12 and (6.8) allow a choice $theta_i$ with
  $ \| chevron.l F_(i \, theta_i) - F_i \, m_i chevron.r \| < delta \/ 2 . $
  This is a separate choice after fixing $m_i$, not a uniform limit over the sequence of vectors. Write $tilde(F)_i = F_(i \, theta_i)$. It detects $m_i$ with bound $delta \/ 2$.
  The function $tilde(F)_i$ is constant on the relatively open cylinder
  #[#set math.equation(numbering: n => "(7.10)")
   $ C_i = { s in B : parallel s \|_(I_(gamma_i)) - v_(*) \|_(I_(gamma_i)) parallel_oo < 3 theta_i \/ 8 } \, $ <eq:plateau-cylinder>]
  because the distance from its grid center is then less than $theta_i \/ 2$. Its enlarged representation still satisfies the strict budget, so (5.6) also applies to $tilde(F)_i$. Therefore (7.9) holds with $tilde(F)_i$ in place of $F_i$. For each fixed earlier $i$, all sufficiently late supports lie in $C_i$. A recursive subsequence makes this true for every later selected index simultaneously. Now Lemma 17(2), with $u_i = tilde(F)_i$ and $b_i = 1$, gives a common Lipschitz bound for finite signed sums.
  ===== 7.4.3 One repeated label. <one-repeated-label.>
  It remains to treat a fixed label $gamma = \( lambda \, j \, xi \)$. Here all cylindrical factors depend on the same finite set $I = I_gamma$. We first expand the tests to isolate a varying term that still detects the vectors. An escaping tail index then gives disjoint supports. Otherwise, a first small remainder $R$ gives shrinking cylindrical supports; a final local modification produces nested plateaux with summably small values.
  Extract a subsequence on which the number $m lt.eq h$ and the types $G \, R$ of cylindrical operations are fixed, as are the number $l lt.eq h$ and the types of tail factors. For each operation position its dyadic scale has a subsequence that is either constant or tends to zero. In the constant case its center can also be made constant, because the permitted grid in the fixed cube is finite. At each tail position the scale $c$ can be made constant, and its integer index $N$ is either constant or tends to infinity. Make all these finitely many extractions together.
  #emph[Expansion and detection.] Call an ingredient fixed when all of its parameters are now constant. The parameters in each concrete representation are frozen before the following algebraic expansion. Replace every nonfixed $G_(q \, epsilon)$ by $upright("Id") + R_(q \, epsilon)$, and every nonfixed factor $b_(c \, N)$ by $1 + \( b_(c \, N) - 1 \)$. The operations are linear in their input functions, so these identities distribute through later operations with no parameters recomputed. The expansion is only of the cylindrical operators and of the tail product separately; it never applies $G$ to a tail-dependent full test.
  There are at most $K_0 = 2^(m + l) lt.eq 2^(2 h)$ resulting term positions. Each cylindrical term retains a chronological subsequence of the original operations, possibly replacing $G$ by $R$ at the same scale. Its scales remain nonincreasing and its total scale does not increase. Omitting a tail factor or replacing $b$ by $b - 1$ also preserves the permitted type and scale. Because $j$ is fixed, all resulting full terms belong to one class $cal(V)_H$ for some fixed $H gt.eq max { h \, j }$, even if the original class was $cal(T)_h$. Write the exact expansion as
  #[#set math.equation(numbering: n => "(7.11)")
   $ F_i = sum_(a = 1)^K F_i^a \, #h(2em) K lt.eq K_0 . $ <eq:label-expansion>]
  A term position containing only fixed ingredients is a fixed concrete test $F^a$. Its pairing with $m_i$ tends to zero by weak nullity; it is not asserted to vanish identically. There are only finitely many such positions, so their total pairing tends to zero. In view of (7.7), for all sufficiently large $i$ the sum of the absolute pairings of the varying terms in (7.11) is at least $delta \/ 2$. One of the at most $K_0$ positions has pairing at least $delta \/ \( 2 K_0 \)$; a subsequence fixes that position. Relabel its tests as
  #[#set math.equation(numbering: n => "(7.12)")
   $ F_i = u_i b_i \, #h(2em) \| chevron.l F_i \, m_i chevron.r \| gt.eq delta_0 > 0 . $ <eq:varying-detection>]
  If $b_i$ contains a nonfixed factor $b_(c \, N_i) - 1$ with $N_i arrow.r oo$, its support is contained in ${ tau_(N_i) gt.eq c }$ by (5.8). The band is fixed, so Lemma 18 applies. We may therefore assume no such factor remains. Every retained nonfixed tail factor would have this form after expansion. The remaining tail product is therefore fixed, and the variation in (7.12) must occur in the cylindrical factor. Every retained nonfixed cylindrical operation is an $R$: a nonfixed $G$ was replaced by an omitted identity or by $R$.
  #emph[A small remainder.] Choose the first retained $R$ whose scale $epsilon_i arrow.r 0$, and call its center $q_i$. All retained operations before it are fixed, so they produce one fixed prefix function $p$ from $f_gamma$. Set
  $ L_(upright("pre")) = "Lip" \( p \) lt.eq 4^h L_0 . $
  This is the Lipschitz bound of the prefix, not the base bound $L_0$; earlier operations may have enlarged it. If $L_(upright("pre")) = 0$, this $R$ and the resulting test vanish, contradicting (7.12). Lemma 8 gives
  $ parallel R_(q_i \, epsilon_i) p parallel_oo lt.eq L_(upright("pre")) epsilon_i \, #h(2em) K_I \( R_(q_i \, epsilon_i) p \) subset overline(B)_oo \( q_i \, epsilon_i \) . $
  Every retained later scale is at most $epsilon_i$, by the nonincreasing order in the original representation. A later $G$ does not increase the supremum norm, a later $R$ increases it by at most a factor two, and either enlarges projected support by at most its scale. Iterating the two parts of Lemma 8 over at most $h$ later operations yields
  #[#set math.equation(numbering: n => "(7.13)")
   $ parallel u_i parallel_oo lt.eq 2^h L_(upright("pre")) epsilon_i \, #h(2em) { s \|_I : s in "supp"_B u_i } subset K_I \( u_i \) subset overline(B)_oo \( q_i \, \( h + 1 \) epsilon_i \) . $ <eq:small-r-support>]
  The first inclusion follows by continuity of coordinate restriction and the definition of relative support. This is where the order of scales is essential: a fixed total budget alone would not make the sum of the later scales tend to zero.
  Pass to a subsequence with $q_i arrow.r v$ in the compact cube $\[ - 1 \, 1 \]^I$. We now make each cylindrical factor constant on a small cylinder about $v$, while preserving (7.12). For a fixed $i$, choose arbitrarily small positive dyadic $theta$ that are below the last retained scale, below the remaining strict budget, and at most $epsilon_i$. Let $q_i^(+) \( theta \)$ be a permitted grid point within $theta \/ 8$ of $v$, and set
  $ tilde(F)_(i \, theta) = \( G_(q_i^(+) \( theta \) \, theta) u_i \) b_i . $
  All these full tests, and $F_i = u_i b_i$, belong to one fixed enlarged class $cal(V)_(H')$, with $H'$ large enough for one more cylindrical operation. The tail product has supremum norm at most one, so
  $ parallel tilde(F)_(i \, theta) - F_i parallel_oo lt.eq theta "Lip" \( u_i \) . $
  For the fixed vector $m_i$, pointwise convergence and (6.8) give an allowed choice $theta_i$ such that
  #[#set math.equation(numbering: n => "(7.14)")
   $ \| chevron.l tilde(F)_(i \, theta_i) - F_i \, m_i chevron.r \| < delta_0 \/ 2 . $ <eq:retained-detection>]
  Again the scale is chosen separately for each $m_i$; no uniform dual convergence on the moving sequence is used.
  Write $tilde(u)_i = G_(q_i^(+) \( theta_i \) \, theta_i) u_i$ and $tilde(F)_i = tilde(u)_i b_i$. It detects with bound $delta_0 \/ 2$. The support enlargement in Lemma 8, (7.13), and $theta_i lt.eq epsilon_i$ give
  #[#set math.equation(numbering: n => "(7.15)")
   $ { s \|_I : s in "supp"_B tilde(u)_i } subset overline(B)_oo \( q_i \, \( h + 2 \) epsilon_i \) . $ <eq:modified-small-support>]
  This conclusion does not require the new grid center to be close to $q_i$: a new nonzero value can be created only near an old nonzero value, which is exactly the support enlargement proved earlier. As $q_i arrow.r v$ and $epsilon_i arrow.r 0$, these cylindrical supports concentrate at $v$.
  On the relatively open cylinder
  $ C_i = { s in B : parallel s \|_I - v parallel_oo < 3 theta_i \/ 8 } \, $
  the function $tilde(u)_i$ is the constant $e_i = u_i \( q_i^(+) \( theta_i \) \)$. Equation (7.13) gives
  #[#set math.equation(numbering: n => "(7.16)")
   $ \| e_i \| lt.eq 2^h L_(upright("pre")) epsilon_i arrow.r 0 . $ <eq:small-plateau>]
  #emph[Nested plateaux.] Choose a recursive subsequence on which $sum_i \| e_i \| < oo$ and $"supp"_B tilde(u)_k subset C_i$ whenever $k > i$. To see that both requirements can be imposed, after selecting finitely many indices use (7.15) to discard a finite initial segment so that all remaining supports lie in their cylinders; then choose the next index with, for example, $\| e_i \| lt.eq 2^(- i)$, using (7.16). Continue.
  The remaining $b_i$ are products of at most $h$ tail factors of supremum norm at most one and Lipschitz constant at most $2^h$. Thus $"Lip" \( b_i \) lt.eq h 2^h$ uniformly. The full $tilde(F)_i$ have a common Lipschitz bound because they are in $cal(V)_(H')$, and
  $ sum_i \| e_i \| "Lip" \( b_i \) < oo . $
  Lemma 17(2), applied to the cylindrical supports in (7.15), gives the required common Lipschitz bound for all finite signed sums. The nesting is of $"supp"_B tilde(u)_i$, not merely the possibly smaller supports of $tilde(F)_i$.
  In each case the modified tests remain in one listed class, retain a positive common lower bound on their pairings, and have a common Lipschitz bound for finite signed sums. Choose an integer $C_1$ no smaller than this last bound. These are the required conclusions. ◻
]

=== 7.5 Excluding a linear copy of $c_0$ <excluding-a-linear-copy-of-c_0>

#thm([Proposition 7.6.])[
  #emph[The Banach space $Z$ contains no linearly isomorphic copy of $c_0$.]
] <prop:no-c0>

#proof[
  Suppose $T : c_0 arrow.r Z$ is an isomorphic embedding and put $m_i = T e_i$. The lower bound for $T$ and the identity $parallel sum_(i in H) epsilon.alt_i e_i parallel_oo = 1$ for nonempty finite $H$ give (7.1) for some $r \, M > 0$. Lemma 15 supplies a weakly null subsequence and detectors in one class. Proposition 19 then supplies compatible detectors with a common nonzero pairing. For their class $cal(L)_1$, bound $C_1$, and pairing constant $delta_1$, set $d_1 = \( cal(L)_1 \, C_1 \, 2 \)$. Lemma 16 gives
  $ M^2 gt.eq alpha_(d_1) \| H \| delta_1^2 $
  for every finite set of selected indices $H$, a contradiction. Thus no such embedding $T$ exists. ◻
]

== 8 Assembly and same-space consequences <sec:assembly>

The construction now supplies both inputs needed after the absorption criterion: a lifted correction and the absence of linear $c_0$.

#proof[
  Lemma 11 gives a separable real Banach space $Z$. Proposition 20 excludes a linearly isomorphic copy of ordinary $c_0$ in $Z$. Propositions 6 and 7 give a bi-Lipschitz bijection
  $ g : E xor_oo U arrow.r U $
  with $E = c_0 \( bb(N) \)$ and lower constant $c_g = 1 \/ 5 - 24 eta > 0$. Lemmas 13 and 14 give a bounded linear $Q : Z arrow.r U$ and a Lipschitz $K : E xor_oo U arrow.r Z$ with $"Lip" \( K \) lt.eq 3$ and $Q K = g - P$. Applying Lemma 2 yields the onto bi-Lipschitz map
  $ F : Z xor_oo E arrow.r Z \, #h(2em) F \( b \, t \) = b + K \( t \, Q b \) \, $
  with the explicit inverse (2.3). Its inverse is the bi-Lipschitz bijection in the opposite direction $Z arrow.r Z xor_oo c_0$. This proves the theorem. ◻
]

#thm([Corollary 8.1.])[
  #emph[For this same separable real Banach space $Z$:]
  + #emph[$Z xor_oo c_0$ and $Z$ are bi-Lipschitz equivalent but not linearly isomorphic.]
  + #emph[$c_0$ embeds bi-Lipschitzly into $Z$, although $Z$ contains no linear copy of $c_0$.]
  + #emph[Every separable metric space embeds bi-Lipschitzly into $Z$.]
] <cor:same-space>

#proof[
  The direct summand ${ 0 } xor c_0$ is a linear isometric copy of $c_0$. A bounded linear isomorphism from the direct sum onto $Z$ would carry it to a closed linear copy in $Z$, contradicting Proposition 20. The restriction $t mapsto F \( 0 \, t \)$ is a bi-Lipschitz embedding, proving the second statement. Aharoni’s theorem #cite(label("Aharoni74")) embeds every separable metric space bi-Lipschitzly into $c_0$; composition with this restriction gives the third statement. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
