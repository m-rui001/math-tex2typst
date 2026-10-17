#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Radius of comparison equals \
half the mean dimension]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Mean dimension measures the dimension needed per orbit coordinate. Introduced by Gromov and developed by Lindenstrauss and Weiss, it remains informative for compact dynamical systems whose ordinary covering dimension is infinite #cite(label("Gromov1999")) #cite(label("LindenstraussWeiss2000")). Toms introduced the radius of comparison to measure the tracial gap needed for comparison of positive elements of a C\*-algebra #cite(label("Toms2006")) Definition 6.1. The Phillips–Toms conjecture relates these dynamical and operator-algebraic quantities. We prove its integer-action case, with the factor one half suggested by the relation between complex vector-bundle rank and real dimension.

=== 1.1 The statement and conventions <the-statement-and-conventions>

For a finite open cover $cal(V)$ of a compact space, let $D \( cal(V) \)$ be the least order of a finite open refinement, where the order is one less than the largest number of members with a nonempty common intersection. For a homeomorphism $h : X arrow.r X$, put

$ cal(U)^(\[ a \, b \)) = or.big_(j = a)^(b - 1) h^(- j) cal(U) \, #h(2em) "mdim" \( X \, h \) = sup_(cal(U)) lim_(N arrow.r oo) frac(D \( cal(U)^(\[ 0 \, N \)) \), N) . $

The supremum ranges over finite open covers. The limit for each cover exists by subadditivity and is finite; the supremum may be infinite.

We use the tracial formulation of the radius of comparison for nuclear C\*-algebras #cite(label("Niu2024")) Definition 2.10; in this setting quasitraces are traces. Let $A$ be a unital nuclear C\*-algebra with tracial states. Write $M_oo \( A \) = union.big_(q gt.eq 1) M_q \( A \)$, using the upper-left corner inclusions. For positive elements $a \, b in M_oo \( A \)$, $a prec.tilde b$ denotes Cuntz subequivalence: there are matrices $x_j$, after passage to compatible finite corners, such that $x_j^(*) b x_j arrow.r a$ in norm. For a normalized tracial state $tau$, set

$ d_tau \( a \) = lim_(m arrow.r oo) \( tau ⊗ "Tr" \) \( a^(1 \/ m) \) \, $

where $"Tr"$ is the unnormalized matrix trace. We say that a finite $r gt.eq 0$ is a #emph[comparison bound] for $A$ if

#[#set math.equation(numbering: n => "(1.1)")
 $ #scale(x: 120%, y: 120%)[\(] d_tau \( a \) + r < d_tau \( b \) med upright("for every normalized trace ") tau #scale(x: 120%, y: 120%)[\)] quad arrow.r.double quad a prec.tilde b $ <eq:comparison-bound>]

for all such positive elements. The radius of comparison $"rc" \( A \)$ is the infimum of the comparison bounds, with $inf diameter = oo$.

#thm([Theorem 1.1.])[
  #emph[Let $h$ be a minimal homeomorphism of an infinite compact metrizable space $X$. Then 
#[#set math.equation(numbering: n => "(1.2)")
 $ "rc" #scale(x: 120%, y: 120%)[\(] C \( X \) times.r_h bb(Z) #scale(x: 120%, y: 120%)[\)] = 1 / 2 "mdim" \( X \, h \) #h(2em) upright("in ") \[ 0 \, oo \] . $ <eq:main>]

]
] <thm:main>

Infinitude and minimality imply that the action is free: a periodic orbit would be a finite closed invariant subset equal to $X$. The crossed product is nuclear #cite(label("ElliottNiu2017")) Section 3 and has tracial states, obtained from invariant probability measures and the canonical conditional expectation. Thus the conventions above apply. In particular, 1 asserts that infinite mean dimension forces infinite radius of comparison, as well as identifying the exact constant at finite positive mean dimension.

=== 1.2 Prior results and the remaining lower bound <prior-results-and-the-remaining-lower-bound>

The two invariants arose in different settings. Toms’s radius of comparison records the dimension-to-rank obstruction to comparing positive elements, extending the role of vector-bundle obstructions in C\*-algebra classification #cite(label("Toms2006")) Section 6. Giol–Kerr brought this obstruction into dynamics: they constructed minimal systems of positive mean dimension whose crossed products have arbitrarily large radii of comparison #cite(label("GiolKerr2010")) Section 2 and Theorem 2.2. The Phillips–Toms conjecture predicts an exact quantitative relation. Its integer-action formulation is recorded in Elliott–Niu #cite(label("ElliottNiu2017")) Introduction and as Problem XXXVI in Schafhauser–Tikuisis–White #cite(label("SchafhauserTikuisisWhite2026")). Niu states the broader formulation for free minimal actions of discrete amenable groups #cite(label("Niu2024")) Introduction. Our theorem concerns minimal homeomorphisms of infinite compact metrizable spaces.

The upper bounds developed from a coarse dimension estimate to the conjectured constant. Phillips proved $"rc" \( C \( X \) times.r_h bb(Z) \) lt.eq 1 + 36 "mdim" \( X \, h \)$ #cite(label("Phillips2016")) Corollary 4.8, while Elliott–Niu settled the zero-mean-dimension case #cite(label("ElliottNiu2017")) Theorem 4.7. Niu then proved the optimal upper bound

#[#set math.equation(numbering: n => "(1.3)")
 $ "rc" #scale(x: 120%, y: 120%)[\(] C \( X \) times.r_h bb(Z) #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 2 "mdim" \( X \, h \) $ <eq:known-upper-bound>]

for free minimal integer-lattice actions, including the systems considered here #cite(label("Niu2024")) Theorem 5.6. Thus equality at zero mean dimension is already known. Niu’s open tower theorem, with an arbitrarily small uniform orbit remainder, is a second input to our proof #cite(label("Niu2024")) Theorem 4.2.

Hirshberg–Phillips obtained lower bounds for actions of countable amenable groups using mean cohomological independence, which detects nonzero cup products of translated cohomology classes #cite(label("HirshbergPhillips2022")) Theorems 3.3 and 4.5 in the author preprint. For the minimal subshifts constructed by Dou #cite(label("Dou2017")) Section 4 over positive even-dimensional polyhedra with nonzero top rational cohomology, their bound is strictly greater than one half of the mean dimension minus one #cite(label("HirshbergPhillips2022")) Corollary 4.6 in the author preprint. Their arguments turn finite-support comparison witnesses into bundle embeddings and obstruct small target rank with inverse Chern classes.

Covering dimension itself can also yield comparison lower bounds: Phillips proved $"rc" \( C \( Y \) \) gt.eq \( dim Y - 7 \) \/ 2$ for every compact Hausdorff space $Y$, using extension of sphere-valued maps #cite(label("Phillips2023")) Corollary 3.4. This commutative result does not control comparison in the larger crossed product. The remaining dynamical problem is to recover every orbit-cover rate from crossed-product comparison. Our argument retains the connection between comparison and bundles, but converts the bundle information directly into a reduction in covering order. It therefore applies to every finite open cover, without a cohomological independence hypothesis or a finite-dimensionality hypothesis on $X$.

=== 1.3 Zero mean dimension and regularity <zero-mean-dimension-and-regularity>

For $E subset X$, define its orbit capacity by

$ "ocap"_h \( E \) = lim_(N arrow.r oo) 1 / N sup_(x in X) sum_(j = 0)^(N - 1) upright(bold(1))_E \( h^j x \) . $

The limit exists by subadditivity. The system $\( X \, h \)$ has the #emph[small boundary property] if every $x in X$ and every open neighborhood $U$ of $x$ admit an open neighborhood $V$ of $x$ with $V subset U$ and $"ocap"_h \( partial V \) = 0$. A C\*-algebra $A$ is #emph[Jiang–Su stable] if $A tilde.equiv A ⊗ cal(Z)$, where $cal(Z)$ is the Jiang–Su algebra and the tensor product is spatial. Nuclear dimension $dim_(upright("nuc")) \( A \)$ is defined through finite-dimensional completely positive approximations, with a bound $n$ permitting $n + 1$ contractive order-zero return pieces. An order-zero map preserves orthogonality of positive elements; the nuclear dimension is $oo$ when there is no finite bound.

The zero endpoint has a further consequence: it characterizes the regularity of the crossed product. The dynamical and operator-algebraic conditions in this characterization use different established inputs.

#thm([Corollary 1.2.])[
  (Zero mean dimension and crossed-product regularity).  #emph[Let $h$ be a minimal homeomorphism of an infinite compact metrizable space $X$, and put $A = C \( X \) times.r_h bb(Z)$. The following conditions are equivalent:]
  + #emph[$"mdim" \( X \, h \) = 0$;]
  + #emph[$\( X \, h \)$ has the small boundary property;]
  + #emph[$A tilde.equiv A ⊗ cal(Z)$;]
  + #emph[$dim_(upright("nuc")) \( A \) < oo$;]
  + #emph[$dim_(upright("nuc")) \( A \) lt.eq 1$.]
  #emph[In particular, if $"mdim" \( X \, h \) in \( 0 \, oo \]$, then $A tilde.nequiv A ⊗ cal(Z)$ and $dim_(upright("nuc")) \( A \) = oo$.]
] <cor:regularity>

The equivalence of zero mean dimension and the small boundary property is due to Lindenstrauss–Weiss and Lindenstrauss #cite(label("LindenstraussWeiss2000")) Theorem 5.4 #cite(label("Lindenstrauss1999")) Theorem 6.2; the latter theorem applies because our system is itself an infinite minimal factor. Elliott–Niu proved that zero mean dimension implies Jiang–Su stability #cite(label("ElliottNiu2017")) Theorem 4.7. Conversely, Jiang–Su stability gives comparison at zero by Rørdam’s theorem #cite(label("Rordam2004")) Corollary 4.6, and 1 then forces zero mean dimension. The remaining equivalences use the published simple-algebra nuclear-regularity theorems #cite(label("CastillejosEvingtonTikuisisWhiteWinter2021")) Theorems A and B. We verify their hypotheses and the matrix-trace conventions in 6.

=== 1.4 The proof: comparison, compression, and colors <the-proof-comparison-compression-and-colors>

Fix a finite comparison bound $r$ and a finite open cover $cal(U)$. The main task is to prove that the cover rate

$ d_(cal(U)) = lim_(k arrow.r oo) frac(D \( cal(U)^(\[ 0 \, k \)) \), k) $

is at most $2 r$. Assume instead that $d_(cal(U)) > 2 r$. A subordinate nerve represents one long orbit block by a point in a finite simplicial complex of dimension $m = D \( cal(U)^(\[ 0 \, k \)) \)$. After barycentric subdivision, its vertices can be colored with $m + 1$ colors, distinct on every simplex. The barycentric weight of a color is the sum of the weights of vertices of that color.

For a large positive integer $p$, group colors into packets of $2 p + 2$. Their proportions give points in a $\( 2 p + 1 \)$-dimensional simplex, which we identify with a cube. Since proportions are undefined at zero packet mass, we regularize them to obtain continuous cube-valued maps. We call each cube factor a #emph[slot]. To replace slot maps while retaining their cover information, we must preserve every originally absent color. The compression theorem from the companion paper #emph[Filtered products and boundary-preserving compression in complex cobordism] #cite(label("OpenAICompression2026")) supplies precisely the needed control: after passing to arbitrarily large product powers, it puts a positive fraction of the slots on their boundaries and fixes the entire vector in every original boundary slot. Its full statement and bundle hypothesis appear in 2.

Here is how comparison supplies that hypothesis. In each slot fix a small framed torus $\( bb(T)^2 \)^p$ and a rank-$p$ bundle formed from one degree-one line bundle on each two-torus factor. The compression hypothesis tests the slot maps after translations by parameters supported in only a small fraction of the slots. The resulting torus loci carry a sum of these rank-$p$ bundles. In 3, an open tower allocates orbit blocks with continuous alignment labels on most starting points. A single finite-propagation Cuntz witness embeds the sum of the aligned bundle fibers. Two fixed linear maps handle the varying coordinate supports, including sparse parameters and the few blocks without full alignment. This produces one continuous embedding over the entire parameter locus, with target rank less than twice the source rank (7). The continuity through changes of sparse support is needed by the compression theorem.

It remains to interpret its output as an actual smaller cover. 4 proves a packet reconstruction lemma. It discards packets of sufficiently small total weight; on retained packets, exact boundary preservation prevents any originally absent color from appearing. Together these operations preserve every original zero vertex coordinate, while each boundary output leaves at least one color absent from its packet. 5 applies this reconstruction on aligned orbit blocks. The two edge blocks retain the beginning and end of each interval; a join with an unchanged description handles points where alignment disappears. A count of the cells containing the resulting image places it in one finite complex of smaller dimension. Its open-star cover then refines the entire orbit cover, contradicting the rate $d_(cal(U))$.

The conversion from $p$ complex lines to $2 p + 2$ colors has ratio $p \/ \( 2 p + 2 \)$, which tends to one half. We choose all tower, sparse-parameter, rounding, and compression losses within the initial strict margin $d_(cal(U)) > 2 r$. In particular, one orbit-window length is fixed before invoking the arbitrarily large product powers. The final passage takes the supremum over covers and the infimum over comparison bounds; when mean dimension is infinite, the individual-cover bound excludes every finite comparison bound. Niu’s upper bound then completes 1.

== 2 The boundary-preserving compression input <sec:compression-interface>

This section states the complete topological input to the lower bound. Its proof is given in OpenAI, #emph[Filtered products and boundary-preserving compression in complex cobordism], September 25, 2026, Theorem 1.3 #cite(label("OpenAICompression2026")). The input is one bundle embedding on a compact parameter locus; the output is a uniform number of boundary slots, with exact preservation of the boundary data.

=== 2.1 Slots, sparse parameters, and the fixed torus bundle <slots-sparse-parameters-and-the-fixed-torus-bundle>

For positive integers $t \, n$, set

$ C_t = \[ - 1 \, 1 \]^t \, #h(2em) C \( t \, n \) = C_t^n \, #h(2em) T \( t \, n \) = \( \[ - 2 \, 2 \]^t \)^n . $

Points have $n$ ordered slots in $bb(R)^t$; all distances use the maximum norm. A boundary slot belongs to the whole boundary $partial C_t$. For a real number $s$ define

#[#set math.equation(numbering: n => "(2.1)")
 $ Z_s \( t \, n \) = { z in T \( t \, n \) : \# { j : z_j eq.not 0 } lt.eq s } . $ <eq:sparse-slots>]

Here $z_j eq.not 0$ means that the whole $t$-vector is nonzero. Thus the count is at most $floor.l s floor.r$; $Z_s$ is empty for $s < 0$ and is $T \( t \, n \)$ for $s gt.eq n$. For $0 lt.eq s < n$ it is a finite union of coordinate cubes of dimension $t floor.l s floor.r$, so in particular it is compact.

Fix a positive integer $p$ and put $t = 2 p + 1$. The geometric data of the companion theorem consist of a smooth embedding

$ L tilde.equiv \( bb(T)^2 \)^p subset \( - 1 \/ 32 \, 1 \/ 32 \)^t $

with a framed real normal line, and line bundles $lambda_1 \, dots.h \, lambda_p$ pulled back from the indicated two-torus factors. Each is a line subbundle of a trivial $bb(C)^2$-bundle, obtained from a degree-one map to $bb(C P)^1$ and the orthogonal complement of its tautological line. Fix the product orientation so that

$ H = xor.big_(i = 1)^p lambda_i subset L times bb(C)^(2 p) \, #h(2em) ⟨product_(i = 1)^p c_1 \( lambda_i \) \, \[ L \]⟩ = 1 . $

The companion constructs such a framed embedding and these bundles; we fix them for each $p$ throughout. The integer $p$ is a rank parameter, with no primality assumption. Write $Q : L arrow.r M_(2 p) \( bb(C) \)$ for the orthogonal projection onto $H$.

For $n gt.eq 1$, the bundle

$ H_n = xor.big_(j = 1)^n "pr"_j^(*) H subset L^n times bb(C)^(2 p n) $

has complex rank $p n$. If $Y$ is compact metrizable, $f : Y arrow.r C \( t \, n \)$ is continuous, and $Z subset T \( t \, n \)$ is closed, define

$ cal(T) \( f \, Z \) = { \( y \, z \) in Y times Z : f \( y \) - z in L^n } \, #h(2em) d_f \( y \, z \) = f \( y \) - z . $

This is a compact space. Its #emph[slot bundle] is $E_f = d_f^(*) H_n$, with fiber $xor.big_(j = 1)^n H_(f_j \( y \) - z_j)$. The embedding used below is defined on this entire space, allowing the set of nonzero parameter slots to vary.

=== 2.2 The imported theorem and its role <the-imported-theorem-and-its-role>

#thm([Theorem 2.1.])[
  (Torus compression #cite(label("OpenAICompression2026")) Theorem 1.3).  #emph[Let $p \, n gt.eq 1$ be integers, put $t = 2 p + 1$, and use the fixed framed torus $L$ and rank-$p$ bundle $H$ specified above. Let $0 < a < 1 \/ 16$, let $Y$ be any compact metrizable space, and let $f : Y arrow.r C \( t \, n \)$ be continuous. Suppose there are a nonnegative integer $K < 2 p n$ and one continuous complex bundle monomorphism 
$ d_f^(*) H_n arrow.r cal(T) \( f \, Z_(a n) \( t \, n \) \) times bb(C)^K $

 over the full compact locus $cal(T) \( f \, Z_(a n) \( t \, n \) \)$. Then, for every integer $U gt.eq 1$, there are an integer $u gt.eq U$ and a continuous map 
$ G : Y^u arrow.r C \( t \, u n \) $

 such that for every $upright(bold(y)) = \( y_0 \, dots.h \, y_(u - 1) \) in Y^u$:]
  + #emph[at least $\( a \/ 8 \) u n$ slots of $G \( upright(bold(y)) \)$ lie in $partial C_t$;]
  + #emph[for every $0 lt.eq b < u$ and $1 lt.eq j lt.eq n$, 
$ f_j \( y_b \) in partial C_t quad arrow.r.double quad G_(b \, j) \( upright(bold(y)) \) = f_j \( y_b \) . $

]
  #emph[The slots of $f^(times u)$ and $G$ are ordered first by copy $b$ and then by original slot $j$.]
] <thm:torus-compression>

The integer boundary count in the theorem is therefore at least $ceil.l \( a \/ 8 \) u n ceil.r$. The hypothesis includes the empty torus locus; on a nonempty locus it itself forces $K gt.eq p n$. It requires a single continuous embedding as $\( y \, z \)$ varies, including at changes in the support of $z$. The conclusion preserves each entire boundary vector, including its scalar coordinates of magnitude less than one. This will preserve a specified missing color, not merely the existence of some missing color. There is no covering-dimension bound on $Y$.

For a piecewise linear cube map on a finite polyhedron, the companion uses the bundle embedding and the inverse total Chern class to make a relative point class vanish in complex cobordism. Coherent products and quantitative nilpotence lead to stable avoidance; padding and boundary restoration then yield the stated fraction for arbitrarily large powers. For compact metrizable inputs, the companion first factors the cube map exactly through a finite polyhedron while preserving the bundle-embedding hypothesis. Pulling the resulting compression back preserves each original boundary vector exactly. Only the displayed theorem is used here. Our task in the next section is to construct its single continuous embedding from a comparison bound.

== 3 Comparison along uniformly allocated orbit blocks <sec:dynamical-comparison>

We now obtain the bundle embedding needed in 3 from a comparison assumption in the crossed product. There are two losses to control. Only a small fraction of orbit blocks fail to have a continuous choice of alignment, and only a small fraction of the sparse parameter slots are nonzero. The corresponding bundle summands will be embedded separately. All other summands are handled simultaneously by a single Cuntz comparison witness.

Throughout this section, $h : X arrow.r X$ is a minimal homeomorphism of an infinite compact metrizable space and $A = C \( X \) times.r_h bb(Z)$. Write $cal(M)_h \( X \)$ for the invariant Borel probability measures. We use comparison bounds in the sense of (1.1), with normalized traces on $A$ and unnormalized matrix traces.

=== 3.1 Open towers and uniformly good starting points <open-towers-and-uniformly-good-starting-points>

The dynamical input is the following special case of #cite(label("Niu2024")) Theorem 4.2. Niu obtains this tower from the continuous equivariant tilings of Gutman, Lindenstrauss and Tsukamoto #cite(label("GutmanLindenstraussTsukamoto2016")) Lemma 4.2. For a tower of height $L$ with negative iterates and base $Omega$, take $V = h^(- \( L - 1 \)) Omega$: its positive levels give the same tower in reverse order.

#thm([Theorem 3.1.])[
  (Niu’s open tower theorem).  #emph[For every integer $L gt.eq 1$ and every $epsilon > 0$, there is an open set $V subset X$ such that $V \, h V \, dots.h \, h^(L - 1) V$ are pairwise disjoint and, writing $cal(T) = union.big_(j = 0)^(L - 1) h^j V$, 
$ lim_(m arrow.r oo) 1 / m sup_(x in X) sum_(s = 0)^(m - 1) upright(bold(1))_(X \\ cal(T)) \( h^s x \) < epsilon . $

 In particular, $mu \( cal(T) \) > 1 - epsilon$ for every $mu in cal(M)_h \( X \)$.]
] <thm:niu-open-tower>

Niu’s theorem assumes the marker property. That hypothesis holds here: there are no periodic points, since a finite orbit would be a nonempty closed invariant subset of $X$. Given a finite collection of nonzero integers, freeness provides a nonempty open set disjoint from its translates by those integers, and minimality makes all its translates cover $X$. This is the marker property. Thus 4 requires no restriction on the covering dimension of $X$. The assertion about invariant measures follows by integrating each finite orbit average before taking the limit.

For positive integers $k \, H_0$ with $H_0 gt.eq 2$, put $e = k H_0$. Whatever the offset $0 lt.eq i < k$, the $H_0 - 1$ length-$k$ intervals

$ \[ i + D k \, i + \( D + 1 \) k \) \, #h(2em) 0 lt.eq D lt.eq H_0 - 2 \, $

lie in $\[ 0 \, e \)$. The next lemma supplies a common open set $B$ for their starting states and disjoint open regions $O_i$ on which the offset $i$ can be used. A continuous weight $w$ vanishes outside these regions and equals one at all but a uniformly small fraction of the $e$-spaced starts along every orbit.

#thm([Lemma 3.2.])[
  (Uniform block allocation).  #emph[Let $k \, H_0$ be positive integers with $H_0 gt.eq 2$, put $e = k H_0$, and let $b_0 > 0$. Suppose that $gamma > 0$ and $r gt.eq 0$ satisfy $gamma \/ k > r$. There exist an open set $B subset X$, pairwise disjoint open sets $O_0 \, dots.h \, O_(k - 1) subset X$, a continuous function $w : X arrow.r \[ 0 \, 1 \]$, a compact set $K subset B$, and an integer $J_0 gt.eq 1$ with the following properties:]
  + #emph[$B \, h B \, dots.h \, h^(k - 1) B$ are pairwise disjoint, and $gamma mu \( B \) > r$ for every $mu in cal(M)_h \( X \)$.]
  + #emph[For $0 lt.eq i < k$ and $0 lt.eq D lt.eq H_0 - 2$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ h^(i + D k) O_i subset B . $ <eq:allocated-block-starts>]

]
  + #emph[The support of $w$ is contained in $O = union.big_(i = 0)^(k - 1) O_i$, and 
#[#set math.equation(numbering: n => "(3.2)")
 $ h^(i + D k) \( "supp" \( w \) ∩ O_i \) subset K quad \( 0 lt.eq i < k \, med 0 lt.eq D lt.eq H_0 - 2 \) . $ <eq:compact-selected-starts>]

]
  + #emph[For every $x in X$, every $v in bb(Z)$, and every $J gt.eq J_0$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ \# { 0 lt.eq q < J : w \( h^(v + q e) x \) < 1 } lt.eq b_0 J . $ <eq:uniform-bad-block-count>]

]
  #emph[In particular, the alignment label $i$ is locally constant on a neighborhood of $"supp" \( w \)$.]
] <lem:uniform-block-allocation>

#proof[
  Choose $eta > 0$ so small that
  #[#set math.equation(numbering: n => "(3.4)")
   $ gamma / k \( 1 - eta \) > r \, #h(2em) 3 eta < frac(b_0, 4 e) \, #h(2em) eta < 1 / 8 . $ <eq:allocation-error-budget>]
  Choose a multiple $L$ of $k$ with $L > e$ and $e \/ L < eta$. Apply 4 with height $L$ and error $eta$, and denote its base by $V$. Set
  $ B = union.big_(a = 0)^(L \/ k - 1) h^(a k) V . $
  Its first $k$ translates partition the tower. Hence they are pairwise disjoint, and
  $ k mu \( B \) = mu (union.big_(s = 0)^(L - 1) h^s V) > 1 - eta . $
  The first requirement follows from (3.4).
  For each integer $s$ with $0 lt.eq s < L - e$, let $i \( s \)$ be the unique integer in ${ 0 \, dots.h \, k - 1 }$ satisfying $s + i \( s \) equiv 0 med \( mod med k \)$, and put
  $ O_i = union.big_(0 lt.eq s < L - e\
i \( s \) = i) h^s V . $
  These are pairwise disjoint open sets. For the indicated values of $D$, the integer $s + i \( s \) + D k$ is a multiple of $k$ between $0$ and $L - 1$, which proves (3.1). Also
  $ mu \( O \) gt.eq mu (union.big_(s = 0)^(L - 1) h^s V) - e mu \( V \) > 1 - eta - e / L > 1 - 2 eta . $
  We next shrink $O$ uniformly over invariant measures. Take continuous functions $phi_j : X arrow.r \[ 0 \, 1 \]$ increasing pointwise to $upright(bold(1))_O$, each with compact support in $O$. Such functions are obtained from increasing cutoffs of the distance to $X \\ O$; if $O = X$, use the constant function one. For each invariant measure, monotone convergence gives $integral phi_j thin d mu arrow.r mu \( O \) > 1 - 2 eta$. The sets
  $ {mu in cal(M)_h \( X \) : integral phi_j thin d mu > 1 - 3 eta} $
  are increasing open sets covering the compact space $cal(M)_h \( X \)$. One of them therefore equals that whole space. Fix the corresponding function $phi$ and set $U = { phi > 0 }$. The continuous function $mu mapsto integral phi thin d mu$ attains its minimum, which is still strictly greater than $1 - 3 eta$. Since $mu \( U \) gt.eq integral phi thin d mu$, we obtain $overline(U) subset O$ and
  #[#set math.equation(numbering: n => "(3.5)")
   $ C = X \\ U upright(" is closed") \, #h(2em) sup_(mu in cal(M)_h \( X \)) mu \( C \) < 3 eta < frac(b_0, 4 e) . $ <eq:closed-exception-measure>]
  Choose $w : X arrow.r \[ 0 \, 1 \]$ equal to one on $overline(U)$ and with $"supp" \( w \) subset O$.
  For completeness, the uniform orbit estimate for the closed set $C$ is
  #[#set math.equation(numbering: n => "(3.6)")
   $ limsup_(m arrow.r oo) sup_(x in X) 1 / m sum_(s = 0)^(m - 1) upright(bold(1))_C \( h^s x \) lt.eq sup_(mu in cal(M)_h \( X \)) mu \( C \) . $ <eq:closed-set-uniform-orbit-estimate>]
  Indeed, a sequence violating this estimate has a subsequence of its orbit empirical measures converging weakly to an invariant probability measure. The closed-set inequality for weak convergence bounds the limsup of their masses on $C$ by the mass of that limit measure, a contradiction. Thus, by (3.5), (3.6), there is $m_0$ such that every orbit interval of length $m gt.eq m_0$ spends less than $b_0 \/ \( 2 e \)$ of its times in $C$.
  The set ${ w < 1 }$ is contained in $C$. For $e J gt.eq m_0$ and any $y in X$,
  $ \# { 0 lt.eq q < J : w \( h^(q e) y \) < 1 } & lt.eq sum_(s = 0)^(e J - 1) upright(bold(1))_C \( h^s y \)\
 & < frac(b_0, 2 e) thin e J lt.eq b_0 J . $
  Taking $y = h^v x$ proves (3.3) for a suitable $J_0$. This argument counts all integer times before passing to $e$-spaced starts; it makes no assumption about invariant measures for $h^e$.
  Finally, each $"supp" \( w \) ∩ O_i$ is compact: the $O_i$ form a finite open partition of a neighborhood of $"supp" \( w \)$. Let $K$ be the union of their images under the finitely many maps in (3.2). It is a compact subset of $B$ by (3.1), as required. ◻
]

=== 3.2 A fixed linear map for changing coordinate supports <a-fixed-linear-map-for-changing-coordinate-supports>

The following elementary observation will be used twice. It avoids making a discontinuous choice of a projection for each support pattern.

#thm([Lemma 3.3.])[
  #emph[Let $E$ be a finite index set and let $b \, q$ be nonnegative integers. There is a complex linear map 
$ L : xor.big_(s in E) bb(C)^b arrow.r bb(C)^(b q) $

 whose restriction to every coordinate subspace supported on at most $q$ indices is injective.]
] <lem:finite-coordinate-compression>

#proof[
  For each $Lambda subset E$ with $\| Lambda \| lt.eq q$, failure of injectivity on $xor.big_(s in Lambda) bb(C)^b$ is a proper determinantal algebraic condition on $L$: it is proper because a map injective on that particular subspace plainly exists. There are only finitely many such conditions, so their union does not fill the vector space of linear maps. Any map outside their union works. The cases $b = 0$ or $q = 0$ are immediate. ◻
]

Only injectivity on each individual coordinate subspace is asserted. Injectivity on the sum of all possible support subspaces would require a much larger target and is not needed.

=== 3.3 The parametrized bundle embedding <the-parametrized-bundle-embedding>

Fix $p gt.eq 1$ and put $t = 2 p + 1$. Use the framed torus $L subset \( - 1 \/ 32 \, 1 \/ 32 \)^t$ and the rank-$p$ bundle $H subset L times bb(C)^(2 p)$ from 3. Recall that $Q : L arrow.r M_(2 p) \( bb(C) \)$ is the orthogonal projection onto $H$. In the notation of (2.1), $Z_(a n) \( t \, n \)$ consists of the parameters with at most $a n$ nonzero whole slots.

#thm([Proposition 3.4.])[
  (Comparison gives a parametrized bundle embedding).  #emph[Let $r$ be a comparison bound for $A$. Fix positive integers $p \, g \, k \, H_0$ with $H_0 gt.eq 2$, numbers $0 < a < 1 \/ 16$ and $b_0 > 0$, and an integer $R$ such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ frac(R H_0, p g \( H_0 - 1 \)) + 2 \( a + b_0 \) < 2 \, #h(2em) frac(R - p g, k) > r . $ <eq:comparison-bundle-budgets>]

 Let $F_1 \, dots.h \, F_g : X arrow.r \[ - 1 \, 1 \]^t$ be arbitrary continuous maps. Choose $B \, \( O_i \)_(i = 0)^(k - 1) \, w \, K$ as in 5, with $gamma = R - p g$ and $e = k H_0$.]
  #emph[For all sufficiently large integers $J$, put 
$ N = e J \, #h(2em) n = J \( H_0 - 1 \) g . $

 There is a continuous map $f_J : X arrow.r \[ - 1 \, 1 \]^(t n)$, with slots indexed by 
$ \( q \, D \, j \) \, #h(2em) 0 lt.eq q < J \, quad 0 lt.eq D lt.eq H_0 - 2 \, quad 1 lt.eq j lt.eq g \, $

 such that 
#[#set math.equation(numbering: n => "(3.8)")
 $ \( f_J \)_(q \, D \, j) \( x \) = F_j \( h^(q e + i + D k) x \) quad upright("when ") h^(q e) x in O_i upright(" and ") w \( h^(q e) x \) > 0 . $ <eq:aligned-slot-agreement>]

 The agreement holds, more strongly, on a neighborhood of each compact set $h^(- q e) \( "supp" \( w \) ∩ O_i \)$.]
  #emph[Over the compact space 
#[#set math.equation(numbering: n => "(3.9)")
 $ cal(L)_J = { \( x \, z \) in X times Z_(a n) \( t \, n \) : f_J \( x \) - z in L^n } \, $ <eq:dynamical-torus-locus>]

 the direct sum of the $n$ pullbacks of $H$, by the slot maps $\( x \, z \) mapsto \( f_J \)_alpha \( x \) - z_alpha$, embeds continuously in a trivial complex bundle of rank strictly less than $2 p n$. The same allocation $B \, \( O_i \) \, w \, K$ works for every such $J$.]
] <prop:comparison-bundle>

The two inequalities in (3.7) control different parts of the construction. The tracial comparison will use source rank at most $p g$ and target rank $R$ on $B$. Since the tower can make $mu \( B \)$ uniformly as close to $1 \/ k$ as needed, the excess $\( R - p g \) \/ k > r$ supplies the required strict trace gap. For the bundle embedding, each of the $J$ intervals contributes $\( H_0 - 1 \) g$ source slots, giving rank $p n = p g \( H_0 - 1 \) J$. The comparison witness will have a fixed propagation bound $M$; the $k$-separation of its active output times will give a target of rank $R H_0 J + O \( 1 \)$. A second map for the sparse slots and the starts where $w < 1$ will use at most $2 p \( a + b_0 \) n + O \( 1 \)$ further dimensions. The bounded terms are independent of $J$. Dividing these target costs by $p n$ explains the first inequality: it leaves a strict margin below the factor two required by 3.

#proof[
  We retain the allocation data throughout the proof. In particular, all cutoffs and the Cuntz witness below are fixed before $J$ is chosen.
  ===== 3.3.1 Extension of the aligned functions. <extension-of-the-aligned-functions.>
  Put $W_i = "supp" \( w \) ∩ O_i$ and choose open sets $V_i$ with
  $ W_i subset V_i subset overline(V)_i subset O_i \; $
  an empty $W_i$ may be assigned $V_i = diameter$. For fixed $D \, j$, the maps $x mapsto F_j \( h^(i + D k) x \)$ on the disjoint closed sets $overline(V)_i$ combine to a continuous cube-valued map. Coordinatewise extension gives a continuous map $hat(F)_(D \, j) : X arrow.r \[ - 1 \, 1 \]^t$ agreeing with it on their union. For every $J$, set
  #[#set math.equation(numbering: n => "(3.10)")
   $ \( f_J \)_(q \, D \, j) \( x \) = hat(F)_(D \, j) \( h^(q e) x \) . $ <eq:extended-aligned-functions>]
  This proves the asserted agreement, including the neighborhood assertion. The extension maps $hat(F)_(D \, j)$ are independent of $J$.
  ===== 3.3.2 Positive matrix functions. <positive-matrix-functions.>
  We now encode the $g$ torus bundles by positive elements of the crossed product. Their tracial rank gap will supply a single witness for all the aligned orbit blocks. Take a tubular neighborhood $cal(V)$ of $L$ inside $\( - 1 \, 1 \)^t$, with retraction $pi_L : cal(V) arrow.r L$, and write $tilde(Q) = Q compose pi_L$. Choose a continuous function $psi : \[ - 1 \, 1 \]^t arrow.r \[ 0 \, 1 \]$ with compact support in $cal(V)$ and equal to one on a neighborhood of $L$. The matrix function $psi tilde(Q)$ extends by zero outside $cal(V)$. By compactness there is $delta > 0$ such that, for $y in L$ and $v in \[ - 1 \, 1 \]^t$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ parallel v - y parallel_oo < delta quad arrow.r.double quad psi \( v \) = 1 \, quad v in cal(V) \, quad parallel tilde(Q) \( v \) - Q \( y \) parallel < 1 / 2 . $ <eq:nearby-bundle-projections>]
  Consequently $tilde(Q) \( v \)$ maps $H_y$ injectively onto $"ran" tilde(Q) \( v \)$ in this situation.
  Choose continuous scalar functions $rho_0 \, rho_1 : X arrow.r \[ 0 \, 1 \]$ such that
  $ rho_0 \|_K = 1 \, #h(2em) "supp" \( rho_0 \) subset B \, #h(2em) { rho_1 > 0 } = B . $
  The compact containment $K subset B$ gives $rho_0$, and a cutoff of the distance to $X \\ B$ gives $rho_1$; if $B = X$, take $rho_1 = 1$. Define positive matrix functions $P_0 in M_(2 p g) \( C \( X \) \)_(+)$ and $P_1 in M_R \( C \( X \) \)_(+)$ by
  #[#set math.equation(numbering: n => "(3.12)")
   $ P_0 \( x \) & = rho_0 \( x \) xor.big_(j = 1)^g psi \( F_j \( x \) \) tilde(Q) \( F_j \( x \) \) \,\
P_1 \( x \) & = rho_1 \( x \) 1_R . $ <eq:comparison-positive-functions>]
  The summands of $P_0$ are understood to be zero where $F_j \( x \)$ lies outside $cal(V)$.
  If $tau$ is a normalized trace on $A$, its restriction to $C \( X \)$ is integration against some $mu in cal(M)_h \( X \)$. Functional calculus and bounded convergence give, for every positive matrix function $P$,
  $ d_tau \( P \) = integral_X "rank" \( P \( x \) \) thin d mu \( x \) . $
  The unnormalized matrix trace is essential in this formula. The rank of $P_0 \( x \)$ is at most $p g$ on $B$ and is zero off $B$, whereas $P_1$ has rank $R$ precisely on $B$. Therefore
  $ d_tau \( P_0 \) + r lt.eq p g mu \( B \) + r < R mu \( B \) = d_tau \( P_1 \) . $
  Here the strict inequality is supplied by 5. Since $r$ is a comparison bound, it follows that
  #[#set math.equation(numbering: n => "(3.13)")
   $ P_0 prec.tilde_A P_1 . $ <eq:allocated-cuntz-comparison>]
  ===== 3.3.3 A finite-propagation witness and simultaneous injection. <a-finite-propagation-witness-and-simultaneous-injection.>
  Finite-support compression witnesses and bundle obstructions also enter the lower-bound arguments of Hirshberg–Phillips #cite(label("HirshbergPhillips2022")) proofs of Theorems 3.3 and 4.5 in the author preprint. Here we retain the sparse parameter throughout and require simultaneous injectivity on the entire sum of the selected fibers. Taking the appropriate rectangular corner of a Cuntz witness for (3.13), and then approximating its entries by finite Fourier sums, gives $T_0 in M_(R \, 2 p g) \( A \)$ such that
  #[#set math.equation(numbering: n => "(3.14)")
   $ parallel T_0^(*) P_1 T_0 - P_0 parallel < 1 / 2 \, #h(2em) T_0 = sum_(ell = - M)^M A_ell u^ell $ <eq:finite-propagation-witness>]
  for some fixed $M gt.eq 0$ and continuous matrix functions $A_ell$. For example, first choose a witness with error less than $1 \/ 4$; norm continuity of $T mapsto T^(*) P_1 T$ permits the Fourier approximation while keeping the error below $1 \/ 2$.
  In the orbit representation at $x$, a function $a in C \( X \)$ acts by
  $ \( pi_x \( a \) xi \) \( s \) = a \( h^s x \) xi \( s \) \, #h(2em) s in bb(Z) \, $
  and the implementing unitary acts by a shift, with direction determined by the crossed-product convention. Thus $T_0$ has propagation at most $M$. Let
  $ I_J = { - M \, - M + 1 \, dots.h \, N - 1 + M } . $
  Restricting the input to times $0 \, dots.h \, N - 1$ and the output to $I_J$ gives a continuous finite matrix
  $ W_J \( x \) : xor.big_(s = 0)^(N - 1) bb(C)^(2 p g) arrow.r xor.big_(s in I_J) bb(C)^R $
  representing $pi_x \( P_1 \)^(1 \/ 2) pi_x \( T_0 \)$ on that input window. There is no output outside $I_J$. If an input vector $xi$ in the window satisfies $pi_x \( P_0 \) xi = xi$, then
  #[#set math.equation(numbering: n => "(3.15)")
   $ parallel W_J \( x \) xi parallel^2 = chevron.l pi_x \( T_0^(*) P_1 T_0 \) xi \, xi chevron.r gt.eq 1 / 2 parallel xi parallel^2 . $ <eq:whole-projection-sum-injection>]
  This holds on the whole sum of any selected genuine projection ranges, including sums involving different times and different bundle blocks.
  ===== 3.3.4 The rank cost of separated output rows. <the-rank-cost-of-separated-output-rows.>
  The map $W_J \( x \)$ initially has $\( N + 2 M \) R$ output coordinates. We now bound the target rank needed to retain the injectivity in (3.15), using the spacing of the rows that can be nonzero. The output row at time $s$ vanishes unless $h^s x in B$. These active times are separated by at least $k$, because $B \, h B \, dots.h \, h^(k - 1) B$ are disjoint. There are at most
  $ q_J = ⌈frac(N + 2 M, k)⌉ = H_0 J + c_M \, #h(2em) c_M = ⌈frac(2 M, k)⌉ \, $
  of them in $I_J$. By 6, choose one fixed linear map
  $ C_J : xor.big_(s in I_J) bb(C)^R arrow.r bb(C)^(R q_J) $
  injective on every coordinate subspace supported at at most $q_J$ times. Hence $C_J$ is injective on the range of $W_J \( x \)$ for every $x$. The matrix $C_J$ is chosen once for this finite window and does not depend on $x$ or on the sparse parameter.
  ===== 3.3.5 The first bundle map. <the-first-bundle-map.>
  Let $alpha = \( q \, D \, j \)$ index a slot. On $cal(L)_J$, write
  $ y_alpha = \( f_J \)_alpha \( x \) - z_alpha in L \, #h(2em) E_(\( x \, z \)) = xor.big_alpha H_(y_alpha) subset xor.big_alpha bb(C)^(2 p) . $
  This describes the rank-$p n$ bundle $E$ in the proposition. Choose a continuous $chi : \[ - 2 \, 2 \]^t arrow.r \[ 0 \, 1 \]$ with $chi \( 0 \) = 1$ and support contained in ${ z : parallel z parallel_oo < delta }$. Set
  #[#set math.equation(numbering: n => "(3.16)")
   $ theta_alpha \( x \, z \) = w \( h^(q e) x \) chi \( z_alpha \) . $ <eq:slot-weights>]
  Where $theta_alpha > 0$, there is a unique $i$ with $h^(q e) x in O_i$. Put $s_alpha = q e + i + D k$. By (3.8), (3.11),
  $ tilde(Q) \( F_j \( h^(s_alpha) x \) \) : H_(y_alpha) arrow.r "ran" tilde(Q) \( F_j \( h^(s_alpha) x \) \) $
  is injective. Furthermore, $h^(s_alpha) x in K$, so the indicated range is a genuine projection range of the $j$th block of $P_0 \( h^(s_alpha) x \)$.
  Define a bundle map
  $ Xi : E arrow.r cal(L)_J times xor.big_(s = 0)^(N - 1) bb(C)^(2 p g) $
  by sending $v_alpha in H_(y_alpha)$, where $theta_alpha > 0$, to
  $ theta_alpha tilde(Q) \( F_j \( h^(s_alpha) x \) \) v_alpha $
  in the $j$th block of the row at time $s_alpha$, and by setting that contribution to zero where $theta_alpha = 0$. All such times lie in the $q$th interval $\[ q e \, \( q + 1 \) e \)$. Within an interval the pairs $\( i + D k \, j \)$ are distinct, and intervals are disjoint. Thus different active slots occupy different time/block pairs.
  This map is continuous on the entire space $cal(L)_J$. Indeed, on a region with positive weight the label is locally constant and the formula is continuous. The projection factor has norm at most one, so the norm of its weighted contribution is at most $theta_alpha parallel v_alpha parallel$ and tends to zero wherever the weight vanishes. This also handles a change of label, which can occur only outside the positive-weight region. More formally, one can use the matrix $tilde(Q) \( F_j \( h^(s_alpha) x \) \) Q \( y_alpha \)$ on the ambient $bb(C)^(2 p)$ and extend its weighted entries by zero; the same bound proves their continuity. No nearby-projection map is needed at zero weight.
  The image of $Xi_(\( x \, z \))$ lies in the subspace on which $pi_x \( P_0 \)$ is the identity. The first bundle map is therefore
  $ Phi_1 \( x \, z \) = C_J W_J \( x \) Xi_(\( x \, z \)) : E_(\( x \, z \)) arrow.r bb(C)^(R q_J) . $
  By (3.15), the defining property of $C_J$, and the distinct time/block placements,
  #[#set math.equation(numbering: n => "(3.17)")
   $ ker Phi_1 \( x \, z \) = xor.big_(alpha : theta_alpha \( x \, z \) = 0) H_(y_alpha) . $ <eq:first-map-kernel>]
  ===== 3.3.6 The exceptional summands. <the-exceptional-summands.>
  The first map now controls every positive-weight summand. To complete one embedding over the full parameter locus, we give its kernel a second map whose target rank is charged only to the sparse slots and the infrequent starts at which $w < 1$. Using the given embeddings $H_y subset bb(C)^(2 p)$, define
  $ Psi_(\( x \, z \)) : E_(\( x \, z \)) arrow.r xor.big_alpha bb(C)^(2 p) \, #h(2em) \( v_alpha \)_alpha mapsto \( \( 1 - theta_alpha \) v_alpha \)_alpha . $
  If $1 - theta_alpha eq.not 0$, then either $z_alpha eq.not 0$ or $w \( h^(q e) x \) < 1$: when both $z_alpha = 0$ and $w \( h^(q e) x \) = 1$, (3.16) gives $theta_alpha = 1$. The sparse condition bounds the first kind by $a n$ slots. For $J gt.eq J_0$, (3.3) bounds the second kind by
  $ b_0 J \( H_0 - 1 \) g = b_0 n $
  slots. The range of $Psi_(\( x \, z \))$ is therefore supported on at most $\( a + b_0 \) n$ coordinate groups, each of dimension $2 p$.
  Put $s_J = ceil.l \( a + b_0 \) n ceil.r$. Another application of 6 gives a fixed linear map
  $ D_J : xor.big_alpha bb(C)^(2 p) arrow.r bb(C)^(2 p s_J) $
  injective on all the relevant coordinate subspaces. Set $Phi_2 \( x \, z \) = D_J Psi_(\( x \, z \))$. The direct sum $Phi_1 xor Phi_2$ is fiberwise injective. In fact, (3.17) says that a vector killed by $Phi_1$ has components only where $theta_alpha = 0$. On those components $1 - theta_alpha = 1$. Injectivity of $D_J$ on the range support of $Psi$ shows that a vector also killed by $Phi_2$ must be zero.
  Both maps are continuous in $\( x \, z \)$, including when the support of $z$ changes. They thus give a continuous bundle embedding into the trivial bundle of rank
  #[#set math.equation(numbering: n => "(3.18)")
   $ K_J = R q_J + 2 p s_J . $ <eq:comparison-bundle-target-rank>]
  One may also verify the bundle assertion locally by representing the map in a trivialization of $E$: its Gram matrix is positive definite, so its image is a continuous rank-$p n$ subbundle. The base $cal(L)_J$ is compact.
  ===== 3.3.7 The strict rank estimate. <the-strict-rank-estimate.>
  Let
  $ zeta = 2 - frac(R H_0, p g \( H_0 - 1 \)) - 2 \( a + b_0 \) > 0 . $
  Since $n = J \( H_0 - 1 \) g$, (3.18) gives
  $ frac(K_J, p n) lt.eq frac(R H_0, p g \( H_0 - 1 \)) + 2 \( a + b_0 \) + frac(R c_M + 2 p, p J \( H_0 - 1 \) g) = 2 - zeta + frac(R c_M + 2 p, p J \( H_0 - 1 \) g) . $
  For all sufficiently large $J gt.eq J_0$ this is strictly less than two. Hence $K_J < 2 p n$, which proves the proposition. ◻
]

== 4 Colored covers and exact packet reconstruction <sec:cover-reconstruction>

We prepare the passage from the boundary slots supplied by 3 to a decrease of covering order. The reconstruction must retain the original open-cover information exactly. A coloring of a subdivided nerve makes this possible: a boundary output leaves at least one color absent from its packet. To preserve the original zero coordinates, reconstruction discards packets of small total weight. On every retained packet, fixing the original boundary value prevents an originally absent color from appearing.

=== 4.1 Polyhedral models for finite covers <polyhedral-models-for-finite-covers>

For a finite simplicial complex $S$, write $lambda_v : S arrow.r \[ 0 \, 1 \]$ for the barycentric coordinate of a vertex $v$. The #emph[carrier] of $y in S$ is the unique simplex whose relative interior contains $y$; its vertices are precisely those for which $lambda_v \( y \) > 0$. In particular, its dimension is the number of positive vertex coordinates minus one.

We will use the following elementary refinement principle.

#thm([Lemma 4.1.])[
  (Polyhedral refinement).  #emph[Let $Y$ be a compact space, let $K$ be a finite polyhedron of dimension at most $q$, and let $Phi : Y arrow.r K$ be continuous. Let $cal(V)$ be a finite open cover of $Y$. Suppose that every point of $Phi \( Y \)$ has an open neighborhood $W$ in $K$ such that $Phi^(- 1) \( W \)$ is contained in a member of $cal(V)$. Then $D \( cal(V) \) lt.eq q$.]
] <lem:polyhedral-refinement>

#proof[
  Choose finitely many such neighborhoods covering the compact set $Phi \( Y \)$, and add $K \\ Phi \( Y \)$ to obtain a finite open cover of $K$. A sufficiently fine simplicial subdivision has its open vertex stars subordinate to this cover. These stars have order at most $q$: a collection of stars with nonempty intersection corresponds to vertices of a single simplex. Their pullbacks under $Phi$, with empty sets omitted, form a finite open refinement of $cal(V)$ of order at most $q$. ◻
]

#thm([Lemma 4.2.])[
  (Colored subordinate nerve).  #emph[Let $cal(V)$ be a finite open cover of a compact metrizable space $Y$, and put $m = D \( cal(V) \)$. There are a finite simplicial complex $S$ of dimension at most $m$, a continuous map $phi.alt : Y arrow.r S$, a coloring of the vertices of $S$ by $1 \, dots.h \, m + 1$ that is injective on every simplex, and, for each vertex $v$, a member $V \( v \) in cal(V)$ such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ { y in Y : lambda_v \( phi.alt \( y \) \) > 0 } subset V \( v \) . $ <eq:vertex-subordination>]

]
] <lem:colored-subordinate-nerve>

#proof[
  Choose a finite open refinement of $cal(V)$ of order $m$ and a subordinate partition of unity. The partition defines a map to the nerve $S_0$ of that refinement, whose dimension is at most $m$. Assign each vertex of $S_0$ a containing member of $cal(V)$.
  Take $S$ to be the barycentric subdivision of $S_0$, and regard the same map as a map to $S$ under the canonical identification of their realizations. A vertex of $S$ is a nonempty face $F$ of $S_0$; give it color $dim F + 1$ and choose one original vertex $v_F in F$. Faces in a simplex of $S$ form a strictly increasing chain, so their colors are distinct. If the coordinate at the barycenter of $F$ is positive, then the original coordinate at $v_F$ is positive: the contribution of that barycenter to this coordinate is its positive coefficient divided by the number of vertices of $F$. Assign to the new vertex the member of $cal(V)$ already assigned to $v_F$. This proves (4.1). ◻
]

For completeness, these models also explain the finite-cover limits used below. Given two finite covers, take subordinate nerve maps and their product. Around every point of the product, choose a positive vertex in each factor. The corresponding product of positive-coordinate neighborhoods pulls back into a member of the joined cover. By 8,

#[#set math.equation(numbering: n => "(4.2)")
 $ D \( cal(V) or cal(W) \) lt.eq D \( cal(V) \) + D \( cal(W) \) . $ <eq:cover-subadditivity>]

Here a product of finite polyhedra has dimension at most the sum of their dimensions, as is also seen from its product cells. For a finite open cover $cal(U)$ of $X$, write

$ cal(U)^(\[ a \, b \)) = or.big_(s = a)^(b - 1) h^(- s) cal(U) \, #h(2em) m_k = D \( cal(U)^(\[ 0 \, k \)) \) . $

Invariance of $D$ under homeomorphisms and (4.2) give $m_(k + l) lt.eq m_k + m_l$. Consequently

#[#set math.equation(numbering: n => "(4.3)")
 $ d_(cal(U)) = lim_(k arrow.r oo) m_k / k = inf_(k gt.eq 1) m_k / k lt.eq D \( cal(U) \) < oo . $ <eq:finite-cover-rate>]

This finiteness concerns one cover and does not require finite mean dimension or finite covering dimension of $X$.

=== 4.2 Color packets and exact reconstruction <color-packets-and-exact-reconstruction>

Recall $C_t = \[ - 1 \, 1 \]^t$ and fix a homeomorphism $kappa : Delta^t arrow.r C_t$ carrying the whole boundary of the simplex onto the whole boundary of the cube. Such a map may, for example, be obtained by radial extension from interior points of these two convex bodies.

#thm([Lemma 4.3.])[
  (Packet reconstruction).  #emph[Let $S$ be a finite simplicial complex of dimension at most $m$ whose vertices are colored by $1 \, dots.h \, m + 1$, with distinct colors on each simplex. Fix an integer $t gt.eq 1$ and put 
$ g = ⌊frac(m + 1, t + 1)⌋ . $

 There exist continuous maps $cal(F)_j : S arrow.r C_t$, $1 lt.eq j lt.eq g$, with the following property.]
  #emph[Let $Y$ be any topological space, let $y : Y arrow.r S$ be continuous, and let $v_j : Y arrow.r C_t$ be continuous replacements satisfying 
#[#set math.equation(numbering: n => "(4.4)")
 $ v_j \( z \) = cal(F)_j \( y \( z \) \) quad upright("whenever ") cal(F)_j \( y \( z \) \) in partial C_t . $ <eq:packet-boundary-condition>]

 There is then a continuous reconstructed map $tilde(y) : Y arrow.r S$ such that, for every $z in Y$,]
  + #emph[$lambda_v \( tilde(y) \( z \) \) > 0$ implies $lambda_v \( y \( z \) \) > 0$ for every vertex $v$;]
  + #emph[if $s \( z \) = \# { j : v_j \( z \) in partial C_t }$, then the carrier of $tilde(y) \( z \)$ has dimension at most $m - s \( z \)$.]
  #emph[In particular, reconstruction preserves every vertex subordination relation such as (4.1).]
] <lem:packet-reconstruction>

#proof[
  For a color $ell$, let
  $ c_ell \( y \) = sum_(v upright(" of color ") ell) lambda_v \( y \) . $
  These continuous color weights sum to one. At any point of $S$ at most one vertex of a given color has positive weight. Partition the first $\( t + 1 \) g$ colors into packets
  $ I_j = { \( j - 1 \) \( t + 1 \) + 1 \, dots.h \, j \( t + 1 \) } \, #h(2em) 1 lt.eq j lt.eq g \, $
  and retain the remaining colors individually. Let $w_j \( y \)$ be the vector of the $t + 1$ color weights in $I_j$, and let $M_j \( y \)$ be their sum. At positive mass, the proportions $w_j \/ M_j$ record each missing color by a zero coordinate, but division by $M_j$ is undefined at zero mass. We first regularize these proportions near zero to obtain continuous slot maps. During reconstruction we discard packets in this range, so any colors introduced by regularization do not enter the reconstructed point. Choose
  #[#set math.equation(numbering: n => "(4.5)")
   $ 0 < tau < frac(1, 4 \( m + 1 \)) \, #h(2em) b = (frac(1, t + 1) \, dots.h \, frac(1, t + 1)) in Delta^t . $ <eq:packet-threshold>]
  Define a continuous simplex-valued function by
  #[#set math.equation(numbering: n => "(4.6)")
   $ q_j \( y \) = cases(delim: "{", w_j \( y \) \/ M_j \( y \) \, & M_j \( y \) gt.eq tau \,, b + #scale(x: 120%, y: 120%)[\(] w_j \( y \) - M_j \( y \) b #scale(x: 120%, y: 120%)[\)] \/ tau \, & M_j \( y \) lt.eq tau .) $ <eq:regularized-proportions>]
  The formulas agree at $M_j = tau$. For $0 < M_j lt.eq tau$, the second is the convex combination of $b$ and $w_j \/ M_j$ with coefficients $1 - M_j \/ tau$ and $M_j \/ tau$; at $M_j = 0$ it equals $b$. Thus it takes values in $Delta^t$ throughout. Set $cal(F)_j = kappa compose q_j$.
  To implement this deletion, choose a continuous function $eta : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ that is zero on $\[ 0 \, tau \]$ and one on $\[ 2 tau \, 1 \]$. For data as in the statement, give packet $j$ the unnormalized new color vector
  #[#set math.equation(numbering: n => "(4.7)")
   $ hat(w)_j \( z \) = eta \( M_j \( y \( z \) \) \) M_j \( y \( z \) \) kappa^(- 1) \( v_j \( z \) \) \, $ <eq:reconstructed-packet>]
  and give each leftover color its original weight. Denote all these new color weights by $hat(c)_ell \( z \)$, and their sum by $Z \( z \)$. Then
  $ Z \( z \) = 1 - sum_(j = 1)^g \( 1 - eta \( M_j \( y \( z \) \) \) \) M_j \( y \( z \) \) gt.eq 1 - 2 g tau > 0 . $
  The last inequality follows from (4.5). Thus division by $Z$ is defined and continuous, even if some packets have been discarded completely.
  We first verify that a missing original color stays missing. For a leftover color this is immediate. For a packet whose factor $eta \( M_j \) M_j$ is zero it is also immediate. In the remaining case $M_j > tau$, so $q_j = w_j \/ M_j$ exactly. If one original color in that packet has weight zero, $q_j$ lies on $partial Delta^t$ and $cal(F)_j$ lies on $partial C_t$. (4.4) forces $kappa^(- 1) \( v_j \) = q_j$, and the new weight of that color is zero. We have proved
  #[#set math.equation(numbering: n => "(4.8)")
   $ c_ell \( y \( z \) \) = 0 quad arrow.r.double quad hat(c)_ell \( z \) = 0 . $ <eq:no-new-colors>]
  Assign the normalized color weights to the originally present vertices. More explicitly, for a vertex $v$ of color $ell$, put
  #[#set math.equation(numbering: n => "(4.9)")
   $ tilde(lambda)_v \( z \) = cases(delim: "{", frac(lambda_v \( y \( z \) \), c_ell \( y \( z \) \)) frac(hat(c)_ell \( z \), Z \( z \)) \, & c_ell \( y \( z \) \) > 0 \,, 0 \, & c_ell \( y \( z \) \) = 0 .) $ <eq:reconstructed-vertices>]
  This function is continuous at points where $c_ell = 0$ as well: the first ratio lies in $\[ 0 \, 1 \]$, while the second tends to zero by (4.8) and the positive lower bound for $Z$. The new vertex weights are nonnegative, sum to one, and have support contained in the original carrier. They therefore define a continuous map $tilde(y)$ into $S$, with the first asserted property.
  Finally, if $v_j \( z \) in partial C_t$, the vector $kappa^(- 1) \( v_j \( z \) \)$ has a zero coordinate. Thus packet $j$ contributes at most $t$ positive colors in (4.7); if the packet is discarded, it contributes none. The $s \( z \)$ successful packets use disjoint sets of colors. Hence at most $m + 1 - s \( z \)$ colors, and therefore at most $m + 1 - s \( z \)$ vertices, are positive in the reconstructed point. Its carrier has dimension at most $m - s \( z \)$. ◻
]

Notice that the loss in 10 is measured from the common bound $m$, not from the dimension of the original carrier. A packet already missing a color may already have a boundary input, and is counted correctly by this formulation. Nor do discarded packets cause a loss of the asserted gain: a discarded packet has all of its colors absent.

== 5 The individual-cover bound and the equality <sec:lower-bound>

All ingredients are now available. We apply the continuous bundle embedding of 7 to the packet maps, use 3, and reconstruct one finite target complex for the full orbit cover. The proof keeps the rank margin and the cover-order saving in the same strict parameter budget.

=== 5.1 A comparison bound controls every cover rate <a-comparison-bound-controls-every-cover-rate>

We use comparison bounds in the sense of (1.1). In particular, traces on $A$ are normalized and their matrix extensions use the unnormalized matrix trace.

#thm([Theorem 5.1.])[
  #emph[Let $h$ be a minimal homeomorphism of an infinite compact metrizable space $X$, and let $A = C \( X \) times.r_h bb(Z)$. For every finite comparison bound $r$ for $A$ and every finite open cover $cal(U)$ of $X$, 
$ lim_(k arrow.r oo) frac(D \( cal(U)^(\[ 0 \, k \)) \), k) lt.eq 2 r . $

]
] <thm:cover-bound>

#proof[
  Suppose, to the contrary, that a cover has rate $d > 2 r$. By (4.3), $d$ is finite. We choose the parameters so that the bundle embedding and the covering-order decrease have simultaneous strict margins.
  ===== 5.1.1 Choice of parameters. <choice-of-parameters.>
  First choose an integer $p gt.eq 1$ such that, for $t = 2 p + 1$,
  $ frac(p d, t + 1) > r . $
  This is possible because $p \/ \( 2 p + 2 \) arrow.r 1 \/ 2$. Set $c_0 = d \/ \( t + 1 \) > 0$, and choose $0 < a < 1 \/ 16$ so small that
  #[#set math.equation(numbering: n => "(5.1)")
   $ \( 1 - 11 a \) p c_0 > r . $ <eq:cover-a-choice>]
  Choose an integer $H_0 gt.eq 2$ so large that
  #[#set math.equation(numbering: n => "(5.2)")
   $ frac(2 - 10 a, H_0 - 1) < 2 a \, #h(2em) d / H_0 < frac(a c_0, 32) . $ <eq:cover-height-choice>]
  Next choose $b_0 > 0$ satisfying
  #[#set math.equation(numbering: n => "(5.3)")
   $ b_0 < a / 32 \, #h(2em) b_0 \( d + c_0 \) < frac(a c_0, 64) . $ <eq:cover-bad-choice>]
  These choices precede the choice of $k$.
  For $m = m_k$, put
  #[#set math.equation(numbering: n => "(5.4)")
   $ g = ⌊frac(m + 1, t + 1)⌋ \, #h(2em) R = floor.l \( 2 - 10 a \) p g floor.r . $ <eq:cover-g-r-choice>]
  As $k arrow.r oo$,
  $ m / k arrow.r d \, #h(2em) g / k arrow.r c_0 \, #h(2em) frac(R - p g, k) arrow.r \( 1 - 10 a \) p c_0 > r . $
  For every $k$ with $g > 0$, the first inequality in (5.2) gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ frac(R H_0, p g \( H_0 - 1 \)) + 2 \( a + b_0 \) & lt.eq 2 - 8 a + frac(2 - 10 a, H_0 - 1) + 2 b_0 < 2 . $ <eq:cover-comparison-parameters>]
  The strict inequality follows from $b_0 < a \/ 32$.
  The cover construction below treats each interval of length $k H_0$ with $H_0 - 1$ reconstructed length-$k$ blocks and two unchanged edge blocks. Their nerve factors have total dimension at most $\( H_0 + 1 \) m$ before counting the missing colors. An alternative description uses $H_0$ unchanged blocks. Joining the two descriptions can add at most $H_0 m + 1$ dimensions, and this extra cost will occur on at most a $b_0$ fraction of the intervals. Each interval has $\( H_0 - 1 \) g$ slots. Compression puts at least an $a \/ 8$ fraction of all slots on the boundary; discarding those in these exceptional intervals loses at most a $b_0$ fraction of all slots. The retained boundary slots therefore reduce the dimension bound by at least $\( a \/ 8 - b_0 \) \( H_0 - 1 \) g$ per interval on average. These three contributions give the prospective cover-rate bound
  #[#set math.equation(numbering: n => "(5.6)")
   $ E_k = frac(\( H_0 + 1 \) m + b_0 \( H_0 m + 1 \) - \( a \/ 8 - b_0 \) \( H_0 - 1 \) g, k H_0) . $ <eq:cover-rate-budget>]
  Its limiting excess over $d$ is
  $ lim_(k arrow.r oo) \( E_k - d \) & = d / H_0 - a / 8 (1 - 1 / H_0) c_0 + b_0 (d + (1 - 1 / H_0) c_0)\
 & < frac(a c_0, 32) - frac(a c_0, 16) + frac(a c_0, 64) = - frac(a c_0, 64) . $
  Here we used $H_0 gt.eq 2$ and (5.2), (5.3). We may therefore fix $k$ large enough that $g gt.eq 1$ and
  #[#set math.equation(numbering: n => "(5.7)")
   $ frac(R - p g, k) > r \, #h(2em) E_k < d . $ <eq:cover-final-parameters>]
  In particular $R > p g$. All of $p \, t \, a \, H_0 \, b_0 \, k \, m \, g \, R$ are now fixed. Put $e = k H_0$.
  ===== 5.1.2 The subordinate functions and their compression. <the-subordinate-functions-and-their-compression.>
  Apply 9 to $cal(U)^(\[ 0 \, k \))$, and write $phi.alt : X arrow.r S$ for the resulting map. For every vertex $v$ of $S$, fix members $U \( v \, s \) in cal(U)$, $0 lt.eq s < k$, such that
  #[#set math.equation(numbering: n => "(5.8)")
   $ lambda_v \( phi.alt \( x \) \) > 0 quad arrow.r.double quad h^s x in U \( v \, s \) quad \( 0 lt.eq s < k \) . $ <eq:time-vertex-subordination>]
  These members come from the assigned element of the orbit join. Use 10 to define
  $ F_j = cal(F)_j compose phi.alt : X arrow.r C_t \, #h(2em) 1 lt.eq j lt.eq g . $
  The estimates in (5.5), (5.7) allow us to use Lemma 3.2, Proposition 3.4. Keep the open labeled regions $O_i$, $0 lt.eq i < k$, and the continuous weight $w : X arrow.r \[ 0 \, 1 \]$ supplied there. For some $J_0$, their uniform frequency property is
  #[#set math.equation(numbering: n => "(5.9)")
   $ \# { 0 lt.eq q < J : w \( h^(q e) y \) < 1 } lt.eq b_0 J #h(2em) \( y in X \, med J gt.eq J_0 \) . $ <eq:cover-macro-frequency>]
  Choose and fix one $J gt.eq J_0$ sufficiently large for 7, and put
  $ N = e J \, #h(2em) n = J \( H_0 - 1 \) g . $
  The proposition gives a continuous map $f : X arrow.r C_t^n$ whose coordinates are indexed by
  $ \( q \, D \, j \) \, #h(2em) 0 lt.eq q < J \, quad 0 lt.eq D < H_0 - 1 \, quad 1 lt.eq j lt.eq g . $
  Whenever $w \( h^(q e) y \) > 0$ and $h^(q e) y in O_i$, these coordinates satisfy
  #[#set math.equation(numbering: n => "(5.10)")
   $ f_(q \, D \, j) \( y \) = F_j \( h^(q e + i + D k) y \) . $ <eq:cover-aligned-f>]
  Moreover the rank-$p n$ torus bundle over the sparse test locus for $f$ embeds in a trivial bundle of rank strictly less than $2 p n$.
  By 3, for arbitrarily large integers $u$ there is a continuous map
  $ G : X^u arrow.r C_t^(u n) $
  with at least $\( a \/ 8 \) u n$ boundary slots at every point, agreeing with each original slot of $f^(times u)$ whenever that slot is on its boundary. Pull it back along the map of actual orbit starts
  $ iota_u : X arrow.r X^u \, #h(2em) iota_u \( x \) = \( x \, h^N x \, dots.h \, h^(\( u - 1 \) N) x \) . $
  Denote the resulting slot functions by $tilde(F)_(b \, q \, D \, j) \( x \)$, with $0 lt.eq b < u$ and the other indices as above. They retain the boundary agreement and the pointwise count
  #[#set math.equation(numbering: n => "(5.11)")
   $ \# { \( b \, q \, D \, j \) : tilde(F)_(b \, q \, D \, j) \( x \) in partial C_t } gt.eq a / 8 u n . $ <eq:cover-total-successes>]
  ===== 5.1.3 Aligned and fallback descriptions. <aligned-and-fallback-descriptions.>
  The orbit pullback has provided the boundary slots. We next encode their reconstructed nerve points in a fixed finite polyhedron, including the points where the alignment label is unavailable. Fix one of these integers $u$. The $u J$ successive macro-intervals have starting times
  $ T_(b \, q) = b N + q e \, #h(2em) 0 lt.eq b < u \, quad 0 lt.eq q < J . $
  On the open set where $w \( h^(T_(b \, q)) x \) > 0$, let $i$ be the unique label with $h^(T_(b \, q)) x in O_i$. The label is locally constant there. For each $0 lt.eq D < H_0 - 1$, use 10 at the original point
  $ phi.alt \( h^(T_(b \, q) + i + D k) x \) in S $
  with replacements $tilde(F)_(b \, q \, D \, j) \( x \)$, $1 lt.eq j lt.eq g$. (4.4) holds by (5.10) and the boundary agreement of $G$. Let the resulting continuous map on this open set be $psi_(b \, q \, D) \( x \) in S$. It has exact vertex subordination to the displayed original point. If $s_(b \, q \, D) \( x \)$ of these $g$ replacement slots are on their boundaries, then
  #[#set math.equation(numbering: n => "(5.12)")
   $ dim "car" \( psi_(b \, q \, D) \( x \) \) lt.eq m - s_(b \, q \, D) \( x \) . $ <eq:cover-updated-carrier>]
  Use the finite polyhedra
  $ cal(A) = product.co_(i = 0)^(k - 1) S^(H_0 + 1) \, #h(2em) cal(B) = S^(H_0) \, #h(2em) cal(J) = cal(A) * cal(B) . $
  The aligned point in the copy of $cal(A)$ labeled $i$ is
  #[#set math.equation(numbering: n => "(5.13)")
   $ A_(b \, q) \( x \) = #scale(x: 120%, y: 120%)[\(] i \; phi.alt \( h^(T_(b \, q)) x \) \, psi_(b \, q \, 0) \( x \) \, dots.h \, psi_(b \, q \, H_0 - 2) \( x \) \, phi.alt \( h^(T_(b \, q) + e - k) x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cover-aligned-description>]
  Its first and last factors retain the two edge blocks. The fallback point, defined on all of $X$, is
  #[#set math.equation(numbering: n => "(5.14)")
   $ B_(b \, q) \( x \) = #scale(x: 120%, y: 120%)[\(] phi.alt \( h^(T_(b \, q)) x \) \, phi.alt \( h^(T_(b \, q) + k) x \) \, dots.h \, phi.alt \( h^(T_(b \, q) + \( H_0 - 1 \) k) x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cover-fallback-description>]
  In the join, give the aligned branch weight $w \( h^(T_(b \, q)) x \)$ and the fallback branch weight $1 - w \( h^(T_(b \, q)) x \)$. Although the aligned coordinates are needed only where their weight is positive, this defines a continuous map to $cal(J)$. To see this directly, embed the finitely many copies of the product polyhedra in Euclidean space. Every aligned coordinate, including the label indicator, is bounded and continuous where its weight is positive; multiplying it by that weight and setting it to zero at weight zero is continuous. These are the usual coordinates for the join. Taking all the macro-intervals gives a continuous map
  #[#set math.equation(numbering: n => "(5.15)")
   $ Phi_u : X arrow.r cal(K)_u := cal(J)^(u J) . $ <eq:cover-total-description>]
  ===== 5.1.4 The descriptions retain the entire orbit cover. <the-descriptions-retain-the-entire-orbit-cover.>
  We give a finite open cover of $cal(K)_u$ whose pullback under $Phi_u$ refines $cal(U)^(\[ 0 \, u N \))$. In one join factor let $omega$ be the weight of its aligned branch. For an aligned label $i$, a factor index $0 lt.eq ell lt.eq H_0$, and a vertex $v$ of $S$, the function
  $ alpha_(i \, ell \, v) = omega thin upright(bold(1))_({ upright("aligned label ") i }) lambda_v \( a_ell \) $
  is continuous on the join when extended by zero where the aligned branch is collapsed. Similarly, for $0 lt.eq ell < H_0$,
  $ beta_(ell \, v) = \( 1 - omega \) lambda_v \( b_ell \) $
  is continuous, with value zero where the fallback branch is collapsed. Here $a_ell$ and $b_ell$ denote the simplicial factors in the two descriptions.
  Form open sets of two kinds: choose a label $i$ and one vertex in each aligned factor, requiring all the corresponding $alpha$’s to be positive; or choose one vertex in each fallback factor, requiring all the corresponding $beta$’s to be positive. These finitely many sets cover $cal(J)$, because at every point some branch has positive weight and every simplicial factor has a positive vertex coordinate. Their products form a finite open cover of $cal(K)_u$.
  Fix one member of this product cover. In each macro-interval it fixes a branch, its label when aligned, and one positive vertex per simplicial factor. Under $Phi_u$, an updated factor with positive vertex $v$ has that same vertex positive in its original point, by 10. Thus (5.8) applies to every chosen factor, updated or unchanged, and gives fixed members of $cal(U)$ along its length-$k$ orbit block.
  For a fallback description the block starts relative to the macro-interval are $0 \, k \, dots.h \, \( H_0 - 1 \) k$, so these blocks cover $\[ 0 \, e \)$. For an aligned description the starts are
  $ 0 \, quad i + D k med \( 0 lt.eq D < H_0 - 1 \) \, quad e - k . $
  Their length-$k$ intervals also cover $\[ 0 \, e \)$: the middle blocks cover $\[ i \, i + \( H_0 - 1 \) k \)$, the first edge covers the beginning since $0 lt.eq i < k$, and the last edge covers the end since $i + \( H_0 - 1 \) k gt.eq e - k$. All of these blocks lie within the macro-interval. For each time in it, choose one of its covering blocks. The fixed vertex and the offset within that block select one fixed member of $cal(U)$ by (5.8).
  Figure 1 shows the two edge overlaps and the fallback partition for one macro-interval.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 4.12), (13.9, 4.12), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((0, 4.064), (0, 4.176), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 4.184), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.07056cm)
  line((0, 3.984), (0, 3.024), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((3.474, 4.064), (3.474, 4.176), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.474, 4.184), [#text(size: 9pt)[$k$]], anchor: "south", padding: 0.07056cm)
  line((3.474, 3.984), (3.474, 3.024), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((6.948, 4.064), (6.948, 4.176), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.948, 4.184), [#text(size: 9pt)[$2k$]], anchor: "south", padding: 0.07056cm)
  line((6.948, 3.984), (6.948, 3.024), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((10.42, 4.064), (10.42, 4.176), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.42, 4.184), [#text(size: 9pt)[$3k$]], anchor: "south", padding: 0.07056cm)
  line((10.42, 3.984), (10.42, 3.024), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((13.9, 4.064), (13.9, 4.176), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((13.9, 4.184), [#text(size: 9pt)[$e=4k$]], anchor: "south", padding: 0.07056cm)
  line((13.9, 3.984), (13.9, 3.024), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  content((0, 3.72), [#text(size: 9pt)[Fallback: $H_0$ unchanged blocks]], anchor: "west", padding: 0.07056cm)
  rect((0, 3.08), (3.474, 3.44), fill: rgb("#ebebeb"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10))
  content((1.737, 3.26), [#text(size: 9pt)[$D=0$]])
  rect((3.474, 3.08), (6.948, 3.44), fill: rgb("#ebebeb"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10))
  content((5.211, 3.26), [#text(size: 9pt)[$D=1$]])
  rect((6.948, 3.08), (10.42, 3.44), fill: rgb("#ebebeb"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10))
  content((8.685, 3.26), [#text(size: 9pt)[$D=2$]])
  rect((10.42, 3.08), (13.9, 3.44), fill: rgb("#ebebeb"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10))
  content((12.16, 3.26), [#text(size: 9pt)[$D=3$]])
  content((0, 2.496), [#text(size: 9pt)[Aligned: two edges and $H_0-1$ reconstructed blocks]], anchor: "west", padding: 0.07056cm)
  rect((1.32, 0.904), (3.474, 2.12), fill: rgb("#dbdbdb"), stroke: none)
  rect((10.42, 0.904), (11.74, 2.12), fill: rgb("#dbdbdb"), stroke: none)
  line((0, 2.12), (0, 0.904), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((3.474, 2.12), (3.474, 0.904), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((6.948, 2.12), (6.948, 0.904), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((10.42, 2.12), (10.42, 0.904), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((13.9, 2.12), (13.9, 0.904), stroke: (paint: rgb("#b8b8b8"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  rect((0, 1.736), (3.474, 2.096), fill: rgb("#ebebeb"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10))
  rect((10.42, 1.736), (13.9, 2.096), fill: rgb("#ebebeb"), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10))
  content((1.737, 1.916), [#text(size: 9pt)[unchanged edge]])
  content((12.16, 1.916), [#text(size: 9pt)[unchanged edge]])
  rect((1.32, 0.944), (4.794, 1.304), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#00008c"), thickness: 0.55pt, miter-limit: 10))
  content((3.057, 1.124), [#text(size: 9pt)[$D=0$]])
  rect((4.794, 0.944), (8.268, 1.304), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#00008c"), thickness: 0.55pt, miter-limit: 10))
  content((6.531, 1.124), [#text(size: 9pt)[$D=1$]])
  rect((8.268, 0.944), (11.74, 1.304), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#00008c"), thickness: 0.55pt, miter-limit: 10))
  content((10, 1.124), [#text(size: 9pt)[$D=2$]])
  line((1.32, 0.88), (1.32, 0.944), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((1.32, 0.88), [#text(size: 8pt)[$i$]], anchor: "north", padding: 0.07056cm)
  line((4.794, 0.88), (4.794, 0.944), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((4.794, 0.88), [#text(size: 8pt)[$i+k$]], anchor: "north", padding: 0.07056cm)
  line((8.268, 0.88), (8.268, 0.944), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((8.268, 0.88), [#text(size: 8pt)[$i+2k$]], anchor: "north", padding: 0.07056cm)
  line((11.74, 0.88), (11.74, 0.944), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((11.74, 0.88), [#text(size: 8pt)[$i+3k$]], anchor: "north", padding: 0.07056cm)
  line((1.32, 1.504), (3.474, 1.504), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2.397, 1.504), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$k-i$]]])])
  line((10.42, 1.504), (11.74, 1.504), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((11.08, 1.504), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$i$]]])])
  content((0, 0.32), [#text(size: 8pt)[Shaded columns mark the two edge--middle overlaps.]], anchor: "west", padding: 0.07056cm)
})],
    caption: [Figure 1: Aligned and fallback coverage of one macro-interval, translated to $\[ 0 \, e \)$. The schematic uses $H_0 = 4$ and $0 < i < k$; every bar denotes a half-open interval of length $k$. In general, $e = k H_0$, and the middle blocks, with starts $i + D k$ for $0 lt.eq D < H_0 - 1$, cover $\[ i \, e - k + i \)$. The unchanged edges $\[ 0 \, k \)$ and $\[ e - k \, e \)$ complete the coverage. Their overlaps with the middle union are $\[ i \, k \)$ and $\[ e - k \, e - k + i \)$, of lengths $k - i$ and $i$. All blocks lie in $\[ 0 \, e \)$. The fallback blocks partition $\[ 0 \, e \)$; at $i = 0$, the first middle block duplicates the left edge. ],
  ) <fig:block-allocation>
  Doing this in all $u J$ macro-intervals shows that the whole preimage of the chosen target open set is contained in one fixed member of $cal(U)^(\[ 0 \, u N \))$. The assertion is about the whole preimage; no injectivity of $Phi_u$ is required.
  ===== 5.1.5 A finite subcomplex of smaller dimension. <a-finite-subcomplex-of-smaller-dimension.>
  The target description now retains every member of the orbit-cover information. It remains to bound the dimension of a single subcomplex containing its image; this is where the pointwise boundary count produces the strict decrease in cover rate. Equip the products of copies of $S$ with their product cells, the joins with the joins of those cells and their endpoint cells, and $cal(K)_u$ with the resulting product cell structure. These are finite polytopal complexes and admit compatible simplicial subdivisions. In a join, the carrier dimension is the dimension of the retained branch at an endpoint and is the sum of the two carrier dimensions plus one when both weights are positive. Product carrier dimensions add.
  Call a macro-interval good at $x$ if $w \( h^(T_(b \, q)) x \) = 1$, and bad otherwise. Apply (5.9) to $y = h^(b N) x$ in each of the $u$ windows. The number $B_u \( x \)$ of bad macro-intervals satisfies
  #[#set math.equation(numbering: n => "(5.16)")
   $ B_u \( x \) lt.eq b_0 u J . $ <eq:cover-bad-count>]
  Each macro-interval has $\( H_0 - 1 \) g$ replacement slots. Consequently at most $b_0 u n$ of the boundary slots in (5.11) can belong to bad intervals. If $S_u^(upright("good")) \( x \)$ is the number of boundary slots in good intervals, then
  #[#set math.equation(numbering: n => "(5.17)")
   $ S_u^(upright("good")) \( x \) gt.eq \( a \/ 8 - b_0 \) u n . $ <eq:cover-good-successes>]
  At a good interval the join is at its aligned endpoint. The two unchanged edge factors cost at most $2 m$, and (5.12) bounds the other factors. Thus its carrier dimension is at most
  $ \( H_0 + 1 \) m - sum_(D = 0)^(H_0 - 2) s_(b \, q \, D) \( x \) . $
  At a bad interval we may ignore all successful slots. Its carrier dimension is at most $\( 2 H_0 + 1 \) m + 1$: this bounds the sum of the aligned and fallback dimensions plus one, and also bounds the fallback endpoint. Using (5.16), (5.17), the carrier dimension of $Phi_u \( x \)$ is therefore at most
  $ & \( u J - B_u \( x \) \) \( H_0 + 1 \) m + B_u \( x \) \( \( 2 H_0 + 1 \) m + 1 \) - S_u^(upright("good")) \( x \)\
 & #h(2em) lt.eq u J #scale(x: 120%, y: 120%)[\(] \( H_0 + 1 \) m + b_0 \( H_0 m + 1 \) #scale(x: 120%, y: 120%)[\)] - \( a \/ 8 - b_0 \) u n\
 & #h(2em) = u J #scale(x: 120%, y: 120%)[\(] \( H_0 + 1 \) m + b_0 \( H_0 m + 1 \) - \( a \/ 8 - b_0 \) \( H_0 - 1 \) g #scale(x: 120%, y: 120%)[\)] = u N E_k . $
  It follows that $Phi_u \( X \)$ lies in the finite subcomplex consisting of all cells of dimension at most $floor.l u N E_k floor.r$, together with their faces. In particular this is an actual subcomplex dimension bound, not a bound on dimensions of fibers or on a varying family of images.
  Restrict the finite target open cover constructed above to this subcomplex, triangulate it compatibly, and apply 8. We obtain
  $ D \( cal(U)^(\[ 0 \, u N \)) \) lt.eq floor.l u N E_k floor.r \, #h(2em) frac(D \( cal(U)^(\[ 0 \, u N \)) \), u N) lt.eq E_k < d . $
  By (4.3), $d$ is the infimum of all normalized cover orders, so even one such $u$ gives a contradiction. This proves the theorem. ◻
]

=== 5.2 The extended-real equality <the-extended-real-equality>

#proof[
  Put $A = C \( X \) times.r_h bb(Z)$. Minimality and infinitude imply that $h$ is free: a periodic orbit would be a finite nonempty closed invariant subset of $X$, and hence all of $X$. Niu’s upper bound therefore gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ "rc" \( C \( X \) times.r_h bb(Z) \) lt.eq 1 / 2 "mdim" \( X \, h \) $ <eq:final-niu-upper-bound>]
  in the extended nonnegative reals #cite(label("Niu2024")) Theorem 5.6.
  Let $cal(R)$ be the set of finite comparison bounds in the definition of the radius of comparison. For every $r in cal(R)$, 11 and the supremum over all finite open covers give
  $ "mdim" \( X \, h \) lt.eq 2 r . $
  If $cal(R)$ is nonempty, taking its infimum yields $"mdim" \( X \, h \) \/ 2 lt.eq "rc" \( A \)$. This passage does not require the infimum itself to belong to $cal(R)$. If $cal(R)$ is empty, the same lower inequality holds because $"rc" \( A \) = oo$ by definition. Together with (5.18), this proves the equality.
  Explicitly, when $"mdim" \( X \, h \) = oo$, 11 excludes every finite comparison bound, so $"rc" \( A \) = oo$. When $"mdim" \( X \, h \) = 0$, (5.18) and nonnegativity give $"rc" \( A \) = 0$. The argument above covers all intervening finite values with the same trace normalization. ◻
]

== 6 Zero mean dimension and regularity <sec:regularity-proof>

We now prove the characterization stated in 2. The new equality supplies the implication from crossed-product regularity back to zero mean dimension; the other directions use the established results identified in the introduction.

#proof[
  Write $A = C \( X \) times.r_h bb(Z)$ as in the corollary. This crossed product is simple and nuclear #cite(label("ElliottNiu2017")) Section 3. It is also separable and unital, since $C \( X \)$ is separable and unital and the acting group is countable. The canonical inclusion $C \( X \) subset A$ makes $A$ infinite-dimensional because $X$ is infinite.
  Lindenstrauss–Weiss proved that the small boundary property implies zero mean dimension #cite(label("LindenstraussWeiss2000")) Theorem 5.4. Lindenstrauss proved the reverse implication for systems with an infinite minimal factor #cite(label("Lindenstrauss1999")) Theorem 6.2; here the identity map supplies that factor. These directions are also recalled together in #cite(label("ElliottNiu2017")) Theorem 2.3. Elliott–Niu’s Theorem 4.7 gives Jiang–Su stability from zero mean dimension.
  For the converse, suppose that $A$ is Jiang–Su stable. Take $a \, b in M_oo \( A \)_(+)$ with $d_tau \( a \) < d_tau \( b \)$ for every normalized trace $tau$ on $A$, and place both elements in a common finite corner $M_q \( A \)$. This algebra is simple, exact, unital and Jiang–Su stable. Every normalized trace on $M_q \( A \)$ is $tau ⊗ "tr"_q$ for a normalized trace $tau$ on $A$, where $"tr"_q = "Tr"_q \/ q$. Thus, for $c in M_q \( A \)_(+)$, its rank function for that normalized matrix trace is
  $ lim_(m arrow.r oo) \( tau ⊗ "tr"_q \) \( c^(1 \/ m) \) = 1 / q d_tau \( c \) \, $
  where the right side uses the unnormalized matrix extension fixed in (1.1). The strict rank inequalities therefore hold for every normalized trace on $M_q \( A \)$. Rørdam’s comparison theorem #cite(label("Rordam2004")) Corollary 4.6 gives $a prec.tilde_(M_q \( A \)) b$, hence $a prec.tilde b$ in the convention of this paper. Thus $0$ itself is a comparison bound, so $"rc" \( A \) = 0$, and 1 gives $"mdim" \( X \, h \) = 0$.
  Finally, the crossed product satisfies all the hypotheses of #cite(label("CastillejosEvingtonTikuisisWhiteWinter2021")) Theorems A and B: it is simple, separable, unital, nuclear and infinite-dimensional. Finite nuclear dimension implies Jiang–Su stability by Winter’s theorem #cite(label("Winter2012")); the converse, with nuclear dimension at most one, is supplied by Castillejos–Evington–Tikuisis–White–Winter. Thus Jiang–Su stability, finite nuclear dimension and nuclear dimension at most one are equivalent for $A$. This proves the five equivalences. If $"mdim" \( X \, h \) > 0$, including the value $oo$, their contrapositives give the final assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
