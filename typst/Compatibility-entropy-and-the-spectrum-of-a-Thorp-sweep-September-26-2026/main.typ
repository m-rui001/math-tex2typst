#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Compatibility entropy and the spectrum of a Thorp sweep]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

A single coordinate sweep of the Thorp shuffle sends each card to a uniform position. This marginal statement leaves open the correlations among cards that have used the same switches. Those correlations are the object of this paper. We ask how much simultaneous row and column structure a permutation can retain, and how that restriction controls all the singular values of the sweep.

Let $n = 2^d$ and identify the positions with ${ 0 \, 1 }^d$. A sweep visits the coordinates in order. At a visit it independently swaps, with probability $1 \/ 2$, the two cards on each edge in that coordinate direction. Write $T_n$ for its convolution operator on $ell^2 \( S_n \)$. One sweep is $d$ physical Thorp shuffles after removing the deterministic rotation of coordinates; Section 2 gives the exact convention. The adjoint reverses the coordinate order. Thus $T_n^(*) T_n$ is a positive operator for a forward sweep followed by a reverse sweep, with fresh independent switches. Powers of $T_n$ instead describe repeated forward sweeps.

Thorp introduced the shuffle in 1973 while studying imperfect shuffling in Faro; his original description already makes the independent pair choices explicit #cite(label("Thorp1973")) Section 3.1. The distinction between one card and the whole deck is fundamental. One sweep uses $n d \/ 2$ random bits, whereas a uniform permutation has entropy $log_2 \( n ! \)$ bits. More generally, the support after $t$ physical shuffles has size at most $2^(t n \/ 2)$, giving the lower bound $2 d - O \( 1 \)$ for fixed-error mixing. Uniformity of every one-card marginal therefore leaves a substantial global problem.

The first polylogarithmic full-deck bound was Morris’s $O \( d^44 \)$ theorem, announced in 2005 and published in 2008 #cite(label("Morris2008")). Montenegro and Tetali sharpened its evolving-set analysis to $O \( d^29 \)$ #cite(label("MontenegroTetali2006")) Section 6.4, Theorems 6.14–6.15. Morris then introduced entropy contraction arguments giving $O \( \( log n \)^4 \)$ shuffles for every even deck size #cite(label("Morris2009")), and $O \( d^3 \)$ for $n = 2^d$ #cite(label("Morris2013")). These comparisons count physical shuffles at fixed total-variation error. The present paper obtains $Theta \( d \)$ mixing for power-of-two decks from a stronger statement about the entire singular spectrum of one sweep. The upper bound uses a fixed number of complete sweeps.

Partial-card laws lead to a related but different question. Morris, Rogaway and Stegers obtained bounds for designated labeled cards and used them to analyze enciphering on small domains #cite(label("mrs")) #cite(label("MorrisRogawayStegers2018")). Czumaj and Vöcking proved mixing of any fixed fraction less than one of the labeled cards after $O \( \( log n \)^2 \)$ ordinary Thorp shuffles #cite(label("CzumajVocking2014")). Their passage to a full random permutation uses additional indistinguishable cards which are discarded afterward. Czumaj also constructed switching networks that mix a full permutation with $O \( n log n \)$ switches and $O \( \( log n \)^2 \)$ depth #cite(label("Czumaj2015")). These results explain the importance of shared-switch correlations beyond individual marginals; their state spaces or networks differ from the ordinary full-deck chain studied here.

Splitting the coordinate list in half identifies the positions with a rectangle. The first part of the sweep acts independently within its rows and the second independently within its columns. This is a recursion into smaller sweeps, but its two symmetry decompositions do not commute. We measure this obstruction by the following concrete event.

Take an $A$-by-$D$ rectangle with $A D = n$, and let $R = \( S_D \)^A$ and $C = \( S_A \)^D$ be its row and column permutation groups. A row permutation $r = \( r_i \)$ followed by a column permutation $c = \( c_k \)$ sends $\( i \, j \)$ to $\( c_(r_i \( j \)) \( i \) \, r_i \( j \) \)$. We call $\( r \, c \)$ #emph[compatible] if this permutation can also be performed by a column permutation followed by a row permutation. Equivalently, for each original column $j$, the $A$ values $c_(r_i \( j \)) \( i \)$ are distinct. The opposite-order factorization, if it exists, is unique. Let $cal(I) subset R times C$ denote this event and let $U$ denote independent uniform permutations in all the lines.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.89), [$(i,j)$])
  content((4.41, 1.89), [$(i,k)$])
  content((0, 0), [$(w,j)$])
  content((4.41, 0), [$(w,k)$])
  line((0.5656, 1.89), (3.844, 1.89), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000ff"))))
  content((2.205, 1.89), [$r_i(j)=k$], anchor: "south", padding: 0.1176cm)
  line((4.41, 1.589), (4.41, 0.301), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#b20000"))))
  content((4.41, 0.945), [$c_k(i)=w$], anchor: "west", padding: 0.1176cm)
  line((0, 1.589), (0, 0.301), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#b20000"))))
  content((0, 0.945), [$tilde(c)_j(i)=w$], anchor: "east", padding: 0.1176cm)
  line((0.5656, 0), (3.844, 0), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#0000ff"))))
  content((2.205, 0), [$tilde(r)_w(j)=k$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The two routings of one labeled position. The solid route uses a row permutation and then a column permutation. Compatibility means that the dashed routes of all positions can be assembled into column and row permutations; this is exactly the distinctness condition for the values $w$ in each original column $j$. ],
) <fig:compatibility>

The first main result allows weights on every line. It retains the cost of marginal concentration instead of assuming the line laws remain uniform after compatibility is imposed.

#thm([Theorem 1.1.])[
  (Weighted compatibility).  #emph[ There are absolute constants $L \, C_0 > 0$ such that the following holds. Put $m = sqrt(n)$, assume $m \/ 2 lt.eq A \, D lt.eq 2 m$, and take $m$ sufficiently large that $theta = 1 - L \/ log m > 0$. For all nonnegative functions $w_i : S_D arrow.r \[ 0 \, oo \)$ and $v_k : S_A arrow.r \[ 0 \, oo \)$, 
#[#set math.equation(numbering: n => "(1)")
 $ frac(n !, \| R \| \| C \|) thin bb(E)_U #h(-0.16667em) [upright(bold(1))_(cal(I)) product_(i = 1)^A w_i \( r_i \) product_(k = 1)^D v_k \( c_k \)] lt.eq e^(C_0 n^.54) product_(i = 1)^A \( bb(E) w_i^(1 \/ theta) \)^theta product_(k = 1)^D \( bb(E) v_k^(1 \/ theta) \)^theta . $ <tra:duality:eq5>]

 The expectations on the right are uniform on the indicated symmetric groups, and logarithms are natural.]
] <tra:duality:weighted>

The factor $n ! \/ \( \| R \| \| C \| \)$ is forced by regular trace normalization. Its leading logarithm is $n$. The entropy argument supplies a compatibility cost with leading logarithm $- n$, so those terms cancel. What remains is small enough to be absorbed by the multiplicity of a large irreducible representation.

To state the resulting spectral estimate, write $T_(n \, lambda)$ for the Fourier matrix on one copy of the irreducible representation of $S_n$ indexed by $lambda tack.r n$, and let $D_lambda$ be its dimension. Throughout, traces and Schatten norms are unnormalized. For $p > 0$, the ordinary regular trace is

$ Z_n \( p \) = "Tr"_(upright("reg")) \( T_n^(*) T_n \)^p = sum_(lambda tack.r n) D_lambda "Tr" \( T_(n \, lambda)^(*) T_(n \, lambda) \)^p . $

The factor $D_lambda$ records the number of copies in the regular representation.

#thm([Theorem 1.2.])[
  (A bounded regular moment).  #emph[There is an absolute finite $p_(*) > 0$ such that, for every dyadic $n$, 
#[#set math.equation(numbering: n => "(2)")
 $ Z_n \( p_(*) \) lt.eq 1 + 1 / 16 . $ <tra:duality:eq7>]

 For every integer $M gt.eq p_(*)$, $M$ independent forward sweeps have worst-start total-variation distance at most $1 \/ 8$ from uniform.]
] <tra:duality:moment>

The moment records both the size and the number of nonconstant singular values. Its concrete consequences are as follows; Section 4 proves the conversion with the regular multiplicities included.

#thm([Corollary 1.3.])[
  (Singular ranks and full-deck mixing).  #emph[For every nontrivial $lambda tack.r n$ and $1 lt.eq r lt.eq D_lambda$, 
$ s_r \( T_(n \, lambda) \) lt.eq \( 16 D_lambda r \)^(- 1 \/ \( 2 p_(*) \)) . $

 If $s_j \( T_n \)$ denotes the full regular singular list, including all multiplicities and zeros, then 
$ s_j \( T_n \) lt.eq j^(- 1 \/ \( 2 p_(*) \)) #h(2em) \( 1 lt.eq j lt.eq n ! \) . $

 The constant singular value is the first value. The physical Thorp chain has worst-start $1 \/ 4$ mixing time $Theta \( d \)$; more precisely its lower bound is $2 d - O \( 1 \)$. For every fixed integer $M > p_(*)$, the worst-start total-variation distance after $M d$ physical shuffles tends to zero as $d arrow.r oo$.]
] <cor:intro-consequences>

The lower bound uses only support size. The upper bounds use the regular moment and Schatten Hölder for the matrix product $T_n^M$. They do not require the sweep to be normal. The sign block vanishes, and the dimensions of the remaining nonconstant blocks tend to infinity; the extra power when $M > p_(*)$ therefore makes the error vanish. The proof does not optimize the constant multiplying $d$ or establish a cutoff profile.

===== 1.1 The first complete proof. <the-first-complete-proof.>

Section 3 proves both theorems without using any of the later recursions. It starts with the exceptional representations, those whose Young diagram has a long first row. Such a representation first appears on ordered tuples of a corresponding number of cards. Subtracting all smaller-tuple kernels cancels every path configuration with an isolated card. The remaining configurations contain a forest of interactions. The probability of each forest edge, together with a deterministic bound on shared switches, gives the required sparse estimate.

For the other representations, the proof returns to the rectangle. Under an arbitrary law supported on compatible pairs, expose the row permutations and then the column permutations in a random order. Each light, unclumped entry costs nearly one nat because previously exposed columns forbid values. Repeated row images and large atoms of the local prediction are excluded from this calculation; their losses are charged to the corresponding marginal relative entropies. The resulting inequality still retains nearly the full sum of marginal deficits. Entropy duality then gives Theorem 1.

The final step is analytic. A positive-matrix trace inequality reduces a singular moment to four alternating row and column factors. The identity coefficient of that product is exactly a weighted compatibility sum. Inverse Hausdorff–Young bounds its line weights by the smaller sweeps’ moments. This first gives a subexponential bound on the regular trace. Each singular value in a large-dimensional irreducible occurs many times, so a small increase in the moment exponent makes that part of the trace small. The sparse estimate treats the remaining part. The exponent increases by $1 + O \( 1 \/ d \)$ at a split into approximately $d \/ 2$ coordinates; the product of these increases stays bounded.

===== 1.2 The additional estimates. <the-additional-estimates.>

Sections 2–4 contain the common conventions, the first complete proof, and the conversion to ranks and mixing. The subsequent arguments provide alternative proofs and several finer estimates. Some capped or weighted compatibility bounds already follow from Theorem 1; their separate proofs offer different ways to expose the grid. The conditional correlation, exceptional-set, sparse representation and level estimates retain further structure, as described below.

The first group refines the entropy at the middle split. Section 5 keeps conditional column deficits after the row array is known, together with projection ranks. Sections 6–8 successively use inverse-color availability, survival-tilted predictions, and fractional integrability of coefficient densities. These formulations permit different changes of measure while retaining a quantitative charge for the concentration of the line laws. Section 9 permits a very unequal rectangle; fixed chunks of coordinates provide its sparse estimate.

A second group keeps track of representation structure. Section 10 estimates the loss of diagram level under matching deletion and restriction to two halves. Section 11 organizes the sparse cancellation by first interactions. Section 12 lifts harmonic functions from smaller tuples and bounds both operator and Hilbert–Schmidt overlaps. Section 13 carries the full regular singular list through its recursion, whereas Section 14 retains positive level sums weighted by dimensions of the tail tableaux. The collision generating function in the latter argument preserves positivity before the missing regular multiplicity is restored.

The final three sections develop further ways to cross the middle grid. In Section 15, a convex weight in the diagram level and logarithmic dimension compensates for levels lost under restriction. In Section 16, a fourth-moment estimate for singular bands transfers a profile without summing those bands prematurely. Finally, Section 17 constructs a positive operator series that majorizes arbitrary matrix-coefficient squares by densities whose low-level restrictions can be controlled pointwise. The bound holds for each line permutation, so it remains valid after conditioning on a complete compatible grid while the auxiliary Bernoulli subsets are still sampled independently. The proof uses a tableau restriction estimate and finite-lattice association, and then telescopes the costs of smoothing along the exposure.

===== 1.3 Methodological context. <methodological-context.>

The rectangular geometry has a close precedent in Håstad’s square lattice shuffle, which alternates independent uniform permutations within all rows and within all columns #cite(label("Hastad2006")) #cite(label("Hastad2016")). The corrected theorem gives full-permutation mixing in a constant number of such layers. In the Thorp recursion each line is acted on by a smaller sweep. Thus the middle-grid estimate has to accept nonuniform line densities and their Fourier blocks. This is the purpose of the marginal entropy terms in Theorem 1.

Random-order exposure belongs to the entropy method used by Radhakrishnan in his proof of Brégman’s theorem and by Linial and Luria for high-dimensional permutation counting #cite(label("Radhakrishnan1997")) #cite(label("LinialLuria2014")). Our exposure estimates keep relative entropies of nonuniform marginal laws; we prove those estimates here. The passage from those deficits to weighted product inequalities is the finite-space entropy–Brascamp–Lieb duality of Carlen and Cordero-Erausquin #cite(label("CarlenCorderoErausquin2009")) Theorem 2.1. The operator transfer uses the Araki–Lieb–Thirring inequality #cite(label("araki1990")) #cite(label("audenaert2007")) and the classical inverse Hausdorff–Young inequality, in the compact-group normalization stated in #cite(label("garcia-cuerva-parcet2004")) Lemma 5.1(2). We specify their normalization at use. The representation arguments use branching, Pieri, the hook-length formula and the content formula in the conventions of Sagan, Stanley and Vershik–Okounkov #cite(label("Sagan2001")) #cite(label("Stanley1999")) #cite(label("VershikOkounkov2005")).

The sparse estimates also use an occupied-set product inequality preserved by fair swaps. We prove the needed two-site calculation directly. It is consistent with the stronger preservation of negative dependence under partial symmetrization proved by Borcea, Brändén and Liggett #cite(label("BorceaBrandenLiggett2009")) Theorems 4.9 and 4.20. The pointwise smoothing argument uses the finite distributive-lattice association theorem of Fortuin, Kasteleyn and Ginibre #cite(label("FortuinKasteleynGinibre1971")) Proposition 1; the required tableau monotonicities and the subsequent operator construction are established here.

The companion on routing densities #cite(label("OpenAIRouting2026")) Lemma 3.2 proves the deterministic contact lemma, with contacts counted as shared switches; we also give an entropy proof of its local form when it enters the sparse estimate. Counting both participating endpoints doubles that bound. All sparse probability estimates and entropy-to-spectrum closures needed here are proved in this paper. The short companion #emph[Optimal-order mixing of the Thorp shuffle] #cite(label("OpenAIOptimal2026")) Theorem 1.1 uses conditional marginals and an eight-block representation lift to prove optimal-order mixing of the full deck. Its mixing theorem is not an input to the compatibility arguments here.

== 2 The sweep, Fourier norms and common estimates <sec:prelim>

We fix physical time and Fourier normalization, then record the representation and positive-matrix estimates used throughout the paper.

=== 2.1 Binary positions and sweep operators <binary-positions-and-sweep-operators>

Number positions by $x = \( x_1 \, dots.h \, x_d \) in bb(F)_2^d$, most significant bit first. One shuffle sends

$ x mapsto \( x_2 \, dots.h \, x_d \, x_1 + xi_(x_2 \, dots.h \, x_d) \) \, $

where the $2^(d - 1)$ bits $xi$ are independent and fair. Denote this physical-shuffle law by $q_d$, and define $t_(upright("mix")) \( d \)$ to be the least time at which its worst-start total-variation distance from uniform is at most $1 \/ 4$. Write $R$ for the cyclic rotation and $h_t$ for the pair switches at physical time $t$, so the time-$t$ permutation is $R h_t dots.h.c R h_1$. Factoring out $R^t$ conjugates the switches into the successive coordinate directions. This deterministic left multiplication preserves distance to uniform. At time $d$, $R^d = I$, and one sweep has exactly the law of $d$ physical shuffles.

Permutations send each input position to its output. A product $g h$ applies $h$ first. For measures, $mu * nu$ denotes the law of $g h$ for independent $g tilde.op mu \, h tilde.op nu$. In a unitary representation $rho_lambda$, define

$ hat(mu) \( lambda \) = sum_g mu \( g \) rho_lambda \( g \) \, #h(2em) accent(mu * nu, ̂) = hat(mu) thin hat(nu) . $

A fair switch layer averages the subgroup generated by its disjoint transpositions, and hence is an orthogonal projection $Pi_i$. With chronological coordinate order $1 \, dots.h \, d$, put

$ T_n = Pi_d dots.h.c Pi_1 \, #h(2em) Q_n = T_n^(*) T_n \, #h(2em) P_n = T_n T_n^(*) \, #h(2em) n = 2^d . $

Both positive squares have the same singular spectrum, including zero multiplicities; they correspond to opposite chronological orientations.

#thm([Lemma 2.1.])[
  (Annihilated shapes).  #emph[The sign representation is annihilated by every nonempty fair layer. Every irreducible of $S_n$ indexed by a shape with more than $n \/ 2$ rows is annihilated by a sweep.]
] <lem:annihilation>

#proof[
  The sign average contains a fair transposition. For the second assertion, by Young’s rule, the permutation module induced from the trivial representation of $\( S_2 \)^(n \/ 2)$ has only shapes dominating $\( 2^(n \/ 2) \)$, hence at most $n \/ 2$ rows. ◻
]

#thm([Lemma 2.2.])[
  (Finite-size norm gap).  #emph[For every fixed dyadic $n gt.eq 2$, $parallel T_n \( lambda \) parallel_(upright("op")) < 1$ on every nontrivial irreducible.]
] <lem:finitegap>

#proof[
  Equality on a unit vector would force equality at every orthogonal projection in the product. The vector would be fixed by all coordinate-pair transpositions. The edges of the cube form a connected graph, and its edge transpositions generate $S_n$, contradicting nontrivial irreducibility. ◻
]

#thm([Lemma 2.3.])[
  (Support obstruction).  #emph[ For every integer $t gt.eq 0$, 
$ parallel q_d^(* t) - U_(S_n) parallel_(upright("TV")) gt.eq 1 - 2^(t n \/ 2) \/ n ! . $

 Consequently $t_(upright("mix")) \( d \) gt.eq ceil.l \( 2 \/ n \) log_2 \( 3 n ! \/ 4 \) ceil.r = 2 d - O \( 1 \)$.]
] <lem:support>

#proof[
  At most $2^(t n \/ 2)$ coin strings are available, so the law is supported on at most that many permutations. Comparing this support set with its uniform mass proves the first assertion. Distance at most $1 \/ 4$ requires support mass at least $3 \/ 4$, giving the exact integer lower bound. Stirling’s formula gives the final expression. In particular, for $t lt.eq d$ the support has size at most $2^(n d \/ 2) = n^(n \/ 2)$. ◻
]

=== 2.2 Plancherel and powers of a nonnormal sweep <plancherel-and-powers-of-a-nonnormal-sweep>

All matrix traces and Schatten norms are unnormalized. Thus $parallel A parallel_(S^p)^p = "Tr" \| A \|^p$, with $S^2 = upright("HS")$ and $S^oo = upright("op")$. If $D_lambda$ is the irreducible dimension, finite-group orthogonality gives

$ \| G \| sum_g \| mu \( g \) \|^2 = sum_lambda D_lambda parallel hat(mu) \( lambda \) parallel_(upright("HS"))^2 . $

It applies to signed measures and subprobabilities as well as probabilities. For a measure $v$ of mass $m$,

#[#set math.equation(numbering: n => "(3)")
 $ parallel v - m U_G parallel_1^2 lt.eq sum_(lambda eq.not upright(bold(1))) D_lambda parallel hat(v) \( lambda \) parallel_(upright("HS"))^2 . $ <eq:plancherel>]

For a probability the left side is $4 parallel v - U_G parallel_(upright("TV"))^2$. If $0 lt.eq v lt.eq mu$ and $mu$ is a probability, then

#[#set math.equation(numbering: n => "(4)")
 $ parallel mu - U_G parallel_(upright("TV")) lt.eq 1 - m + 1 / 2 parallel v - m U_G parallel_1 . $ <eq:lostmass>]

Both follow from Cauchy–Schwarz and the triangle inequality, respectively.

#thm([Lemma 2.4.])[
  (Safe use of sweep powers).  #emph[For integers $r gt.eq s gt.eq 1$ and any matrix $T$, setting $Q = T^(*) T$, 
$ parallel T^r parallel_(upright("HS"))^2 lt.eq parallel Q parallel_(upright("op"))^(r - s) "Tr" Q^s . $

]
] <lem:schatten>

#proof[
  Schatten Hölder gives $parallel T^s parallel_(upright("HS")) lt.eq parallel T parallel_(S^(2 s))^s$, and multiplying the remaining $r - s$ factors costs at most $parallel T parallel_(upright("op"))^(r - s)$. Squaring proves the claim. No normality of $T$ is used. ◻
]

=== 2.3 Injection multiplicities and inverse-degree sums <injection-multiplicities-and-inverse-degree-sums>

We use the standard indexing of complex irreducibles of $S_n$ by partitions $lambda tack.r n$, with $D_lambda = f^lambda$ equal to the number of standard tableaux #cite(label("Sagan2001")) #cite(label("Stanley1999")). Write $k = n - lambda_1$ and $macron(lambda) = \( lambda_2 \, lambda_3 \, dots.h \)$. Young branching and Frobenius reciprocity show that the representation on ordered distinct $r$-tuples contains $lambda$ with multiplicity

$ f^(lambda \/ \( n - r \)) . $

At $r = k$ this is $f^(macron(lambda))$, and $lambda$ does not occur on fewer slots. If $k lt.eq r lt.eq n - k$, the remaining first-row boxes are separated from the tail, giving

#[#set math.equation(numbering: n => "(5)")
 $ m_lambda \( r \) = binom(r, k) f^(macron(lambda)) \, #h(2em) D_lambda lt.eq binom(n, k) f^(macron(lambda)) . $ <eq:tuplemultiplicity>]

The inequality follows by choosing the entries below the first row and forgetting cross-row tableau constraints. The same hook formula gives the useful quantitative refinement

#[#set math.equation(numbering: n => "(6)")
 $ D_lambda gt.eq binom(n, k) f^(macron(lambda)) exp (- frac(k, n - 2 k + 1)) #h(2em) \( 0 lt.eq k lt.eq n \/ 2 \) . $ <eq:near-row-hooks>]

Indeed the hook inflation along the top row, relative to $\( n - k \) !$, is

$ product_(j lt.eq lambda_2) (1 + frac(lambda'_j - 1, n - k - j + 1)) . $

The denominators are at least $n - 2 k + 1$ and $sum_j \( lambda'_j - 1 \) = k$. Taking logarithms bounds this product by $exp \( k \/ \( n - 2 k + 1 \) \)$. The remaining hooks are exactly those of $macron(lambda)$. In particular for $k lt.eq .14 n$ the loss is $exp \( O \( k \/ n \) \)$, which also supplies the weaker $exp \( O \( k log n \/ n + k \/ n \) \)$ loss when that form is convenient.

We record two useful degree estimates. They will also specify exactly which negative dimension powers are available to the different proofs. The inverse-degree assertions below are special cases of the stronger asymptotics of Liebeck and Shalev #cite(label("liebeck-shalev2004")) Theorem 2.6, who prove $sum_(lambda tack.r n) D_lambda^(- s) = 2 + O \( n^(- s) \)$ for every fixed $s > 0$. We include the elementary estimates needed here.

#thm([Lemma 2.5.])[
  (Degree sums).  #emph[Uniformly in $n$, $sum_(lambda tack.r n) D_lambda^(- 1)$ is bounded, and 
$ sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(- 1) arrow.r 0 . $

 If $ell = n - max \( lambda_1 \, lambda'_1 \)$, then 
$ log D_lambda gt.eq \( log 2 \) sqrt(ell) \/ 2 \, #h(2em) sup_n sum_(lambda tack.r n) D_lambda^(- 32) < oo . $

]
] <lem:degrees>

#proof[
  Transpose if necessary so that the first row has length $r = max \( lambda_1 \, lambda'_1 \)$. If $r lt.eq n \/ 8$, the hook formula gives $D_lambda gt.eq n ! \/ \( 2 r \)^n$, exponential in $n$. If $n \/ 8 < r lt.eq 3 n \/ 4$, retain the first row and $floor.l r \/ 4 floor.r$ further boxes. Their tableaux extend to the whole diagram. A first row of length $r$ and a tail of size $j lt.eq r$ have at least
  $ binom(r + j, j) frac(r - j + 1, r + 1) $
  tableaux: ballot interleavings of the first row with any fixed standard order of the tail respect all column inequalities. This is exponential in $n$ in the present range. There are $exp \( O \( sqrt(n) \) \)$ partitions, so these ranges contribute $o \( 1 \)$ to the inverse-degree sum. If $r > 3 n \/ 4$, write $j = n - r$. The same ballot bound is at least a fixed multiple of $binom(n, j)$. There are at most $2 p \( j \)$ possible shapes up to transpose, and $binom(n, j) gt.eq 4^j$ for $j < n \/ 4$. Since $p \( j \) = exp \( O \( sqrt(j) \) \)$ and each fixed positive $j$ gives a divergent binomial coefficient, dominated convergence proves the first assertion.
  For the square-root estimate, put $b = lambda_2$ and $h = lambda'_1$, so $b \( h - 1 \) gt.eq ell$. If $h - 1 gt.eq sqrt(ell)$, a hook with row and column length $h$ has at least $2^(h - 1)$ tableaux. Otherwise $b > sqrt(ell)$, and for $ell > 0$ this implies $b gt.eq 2$. The two-row rectangle of width $b$ has the Catalan number of tableaux, at least $2^(b - 1) gt.eq 2^(sqrt(ell) \/ 2)$. Subdiagram tableaux extend; the case $ell = 0$ is immediate. This proves the displayed bound. Finally $p \( j \) lt.eq e^(3 sqrt(j))$ follows by evaluating the partition generating product at $e^(- 1 \/ sqrt(j))$. Summing $2 e^(3 sqrt(ell)) e^(- 16 \( log 2 \) sqrt(ell))$ proves the inverse-32 bound. ◻
]

=== 2.4 Positive powers and coefficient densities <positive-powers-and-coefficient-densities>

Two analytic operations recur at a grid split. Positive powers trade a small increase in the moment exponent for a fourth-moment overlap. Fourier inversion then turns a child trace budget into an integrability bound for its coefficient density. We state their normalizations once.

#thm([Lemma 2.6.])[
  (Positive-power comparison).  #emph[For square matrices $A_1 \, A_2$ and real $P gt.eq q gt.eq 1$, 
#[#set math.equation(numbering: n => "(7)")
 $ parallel A_2 A_1 parallel_(S^P) lt.eq parallel \| A_2 \|^(P \/ q) \| A_1^(*) \|^(P \/ q) parallel_(S^q)^(q \/ P) . $ <eq:positive-power-comparison>]

 In particular, if $T = K_C K_R$, $X = K_R K_R^(*)$ and $Y = K_C^(*) K_C$, then for $p gt.eq 2$, 
#[#set math.equation(numbering: n => "(8)")
 $ "Tr" \( T^(*) T \)^p lt.eq "Tr" \( X^(p \/ 2) Y^(p \/ 2) X^(p \/ 2) Y^(p \/ 2) \) . $ <eq:fourth-positive-trace>]

 All Schatten norms and traces are unnormalized.]
] <lem:positive-power-comparison>

#proof[
  Extend the polar partial isometries to unitaries. Removing these outside factors reduces (7) to positive matrices $A = \| A_2 \|$ and $B = \| A_1^(*) \|$. Put $h = P \/ q$. The case $h = 1$ is equality. For $h > 1$ use the analytic family $F \( z \) = A^(h z) B^(h z)$ on $0 lt.eq Re z lt.eq 1$. A positive matrix power here is defined on each positive eigenvalue by its complex power and is zero on the kernel for every $z$. Thus on $Re z = 0$ the operator norm is at most one, while
  $ F \( 1 + i t \) = A^(i h t) \( A^h B^h \) B^(i h t) \, #h(2em) parallel F \( 1 + i t \) parallel_(S^q) = parallel A^h B^h parallel_(S^q) . $
  The equality holds because the imaginary powers are unitary on the supports containing the range and domain of the middle product.
  Schatten interpolation between these two boundaries gives $parallel F \( theta \) parallel_(S^(q \/ theta)) lt.eq parallel A^h B^h parallel_(S^q)^theta$. For completeness, this follows from scalar three-lines by testing against a dual matrix. If $r = q \/ theta$ and $C = U "diag" \( c_i \) V^(*)$ has $sum_i c_i^(r') = 1$, use the analytic test $V "diag" \( c_i^(r' \( 1 - z \/ q \)) \) U^(*)$. Its boundary norms are $S^1$ and $S^(q')$, respectively, both one; zero singular values give identically zero terms. At $z = theta$ it is $C^(*)$, proving the assertion by duality. Take $theta = 1 \/ h$. Finally use $P = 2 p$, $q = 4$ and cyclicity to obtain (8).
  This is the form of the Araki–Lieb–Thirring comparison used below #cite(label("araki1990")) #cite(label("audenaert2007")). In positive-matrix notation it also gives $"Tr" \( B^(1 \/ 2) A B^(1 \/ 2) \)^(r a) lt.eq "Tr" \( B^(r \/ 2) A^r B^(r \/ 2) \)^a$ for $r \, a gt.eq 1$. ◻
]

#thm([Lemma 2.7.])[
  (Inverse Fourier bound).  #emph[Let $G$ be a finite group, let $cal(L) \( g \)$ denote left regular translation, and let $f$ be a complex coefficient density, so its convolution operator is $\| G \|^(- 1) sum_g f \( g \) cal(L) \( g \)$. Write $E_rho = bb(E)_g f \( g \) rho \( g \)$ for its matrix on an irreducible carrier of dimension $D_rho$. For $2 lt.eq u lt.eq oo$ and $u' = u \/ \( u - 1 \)$, with $u' = 1$ at infinity, 
#[#set math.equation(numbering: n => "(9)")
 $ parallel f parallel_(L^u \( U_G \)) lt.eq (sum_rho D_rho "Tr" \| E_rho \|^(u'))^(1 \/ u') . $ <eq:inverse-fourier-bound>]

]
] <lem:inverse-fourier-bound>

#proof[
  At $u = 2$ this is Plancherel. At $u = oo$, inversion and trace norm duality give
  $ \| f \( g \) \| = lr(|sum_rho D_rho "Tr" \( E_rho rho \( g^(- 1) \) \)|) lt.eq sum_rho D_rho "Tr" \| E_rho \| . $
  Interpolation gives the intermediate exponents. One may carry it out by the same three-lines test as above, using the direct sum of matrix spaces with trace $sum_rho D_rho "Tr"$ and the uniform scalar measure on $G$. This is inverse Hausdorff–Young in the finite-group normalization of #cite(label("garcia-cuerva-parcet2004")) Lemma 5.1(2). ◻
]

#thm([Lemma 2.8.])[
  (Products of leading singular values).  #emph[If $A \, C$ are positive semidefinite matrices of size $N$ and $v gt.eq 1$, then for every $1 lt.eq j lt.eq N$, 
#[#set math.equation(numbering: n => "(10)")
 $ product_(i = 1)^j s_i \( C A \) lt.eq (product_(i = 1)^j s_i \( C^v A^v \))^(1 \/ v) . $ <eq:power-product-comparison>]

]
] <lem:power-product-comparison>

#proof[
  For positive definite matrices apply three-lines to $and.big^j \( C^(v z) A^(v z) \)$. Its operator norm on the imaginary boundary is one. On $Re z = 1$ its outside imaginary powers are unitary, so its norm is $parallel and.big^j \( C^v A^v \) parallel_(upright("op"))$. Evaluation at $z = 1 \/ v$ proves the claim, since the norm of an exterior power is the product of the leading singular values. Replacing $A \, C$ by $A + epsilon I \, C + epsilon I$ and letting $epsilon arrow.b 0$ covers the semidefinite case. ◻
]

The last lemma concerns products, not individual singular values. When a later recursion returns from powers to a specified index, it must also control the preceding indices.

== 3 From compatibility entropy to a regular moment <tra:duality>

The next estimate allows an arbitrary joint law on compatible row and column permutations. Keeping the individual marginal entropy deficits gives a weighted inequality by entropy duality. Inverse Hausdorff–Young then converts that inequality directly into a recursion for singular moments.

Put $l = log_2 n$ and write $T_n$ for one sweep on $n = 2^l$ points. Set

$ Z_n \( p \) = "Tr" \( T_n^(*) T_n \)^p = sum_(lambda tack.r n) D_lambda "tr" \( T_(n \, lambda)^(*) T_(n \, lambda) \)^p . $

The trace includes regular multiplicities. We use the positive-power comparison and inverse Fourier bound from Lemmas 9 and 10, with their unnormalized regular traces.

=== 3.1 A sparse path second moment <a-sparse-path-second-moment>

#thm([Lemma 3.1.])[
  #emph[ There is an absolute $b > 0$ such that for all sufficiently large $n$, on all $\( n - h \, dots.h \)$ representations with $1 lt.eq h lt.eq n^.60$, 
#[#set math.equation(numbering: n => "(11)")
 $ parallel T_(n \, lambda) parallel lt.eq n^(- b h) . $ <tra:duality:eq1>]

]
] <tra:duality:sparse>

#proof[
  To see this, use the permutation representation on ordered distinct $h$-tuples. Every irrep in (11) occurs here and not on ordered $\( h - 1 \)$-tuples, by Young’s rule. Thus we may bound the sweep on functions in the tuple representation orthogonal to functions of any proper subset of the coordinates.
  Take distinct input and output tuples $x \, y$. The paths between corresponding positions in a sweep are determined (each dimension is used just once). A path at each stage uses one of the pair switches. Say two paths touch if they use the same switch at some stage. For $I subset.eq \[ h \]$ let
  $ D_I = n^(\| I \|) bb(P) { upright("sweep maps ") x_i upright(" to ") y_i \, med i in I } . $
  This is zero if the paths call for incompatible routes. On compatible paths it is $2^(e_I)$, where $e_I$ counts switches used by two of the paths in $I$: we save one bit at each such switch. In particular if one path touches none of the others in the full list, including or omitting that index has no effect on $D_I$.
  The transition density relative to uniform on tuples is $\( n \)_h D_(\[ h \]) \/ n^h$, where $\( n \)_h = n \( n - 1 \) dots.h.c \( n - h + 1 \)$. For an operator bound on the indicated irreps, we can replace $D_(\[ h \])$ here by
  $ F = sum_(I subset.eq \[ h \]) \( - 1 \)^(h - \| I \|) D_I . $
  All terms changed act by zero on the irreps, being kernels depending on fewer tuple coordinates. And $F = 0$ unless in the touching graph on $\[ h \]$ there are no isolated vertices.
  We estimate the second moment of $F$ over uniform distinct input and output tuples. Let $E$ be the event that both tuples are distinct and their full touching graph has no isolated vertices. By Cauchy–Schwarz, it suffices, up to a factor exponential in $h$, to bound $bb(E)_(upright("iid")) \[ D_I^2 upright(bold(1))_E \]$ for every $I subset.eq \[ h \]$. Here the expectation first samples all input and output positions independently and uniformly. Passing from this law to uniform distinct tuples costs at most $\( n^h \/ \( n \)_h \)^2 lt.eq C^h$.
  One factor $D_I$ can be incorporated into the sampling law:
  $ bb(E)_(upright("iid")) \[ D_I^2 upright(bold(1))_E \] = bb(E)_(mu_I) \[ D_I upright(bold(1))_E \] . $
  Under $bb(E)_(mu_I)$, sample a sweep and all input positions independently; for $i in I$ take the sweep’s output, and for $i in.not I$ sample an independent uniform output. This identity uses the probability definition of $D_I$ on all endpoint lists; its formula $2^(e_I)$ will be used only on $E$. Conditional on the sampled sweep, the individual paths are independent. A path indexed by $I$ is uniform among the $n$ realized deck paths, and at most two of these occupy a given switch at a given stage. For a path outside $I$, its independently sampled endpoints likewise make its switch uniform among the $n \/ 2$ switches at each stage. In either case, its probability of touching a fixed path is at most $2 l \/ n$. Integrating the children of a specified forest after their parents therefore bounds its contact probability by $\( 2 l \/ n \)^(\# upright("edges"))$.
  The remaining task is to control the second density factor without paying for every possible encounter. There is a deterministic bound on the other factor $D_I$ still left from the square. In any list of $s$ distinct realized deck paths the number of their mutual switches is at most $\( s \/ 2 \) log_2 s$. This is the butterfly contact lemma of #cite(label("OpenAIRouting2026")) Lemma 3.2; its endpoint-counted version is $s log_2 s$. Here each shared switch saves one coin, so we use the half-sized, shared-switch count. The following entropy argument also proves exactly the local form we need. To see the deterministic bound, let a walker start uniformly on one of the $s$ selected paths. It follows that path except at a switch shared by two selected paths, where it chooses either continuation fairly. The walker remains uniform among the $s$ current positions. If the paths share $e$ switches, the expected number of fair choices is therefore $2 e \/ s$. Given the starting position, the final position determines the whole butterfly route. The chain rule for entropy consequently gives $2 e \/ s lt.eq log_2 s$, proving the claimed bound. Thus if the components of the full touching graph have sizes $s_1 \, dots.h \, s_c$, $D_I lt.eq product_j s_j^(s_j \/ 2)$.
  Let $Gamma$ be the event that the touching graph has no isolated vertices. The preceding Cauchy–Schwarz and change-of-law estimates give
  $ bb(E)_(upright("distinct")) \| F \|^2 lt.eq C_0^h max_(I subset.eq \[ h \]) bb(E)_(mu_I) \[ D_I upright(bold(1))_Gamma upright(bold(1))_(upright("distinct")) \] \, $
  where $mu_I$ is the sampling law obtained by weighting once by $D_I$. We now sum the forest witnesses while keeping the remaining density factor. For a realized graph on $Gamma$, choose a rooted spanning tree in every component. If there are $c$ components, their sizes $s_1 \, dots.h \, s_c$ satisfy $s_j gt.eq 2$ and $sum_j s_j = h$. There are at most $2^h h^(h - c)$ rooted forests with $c$ components: choose their roots, then give each nonroot a parent. For each such forest the probability of its edges is at most $\( 2 l \/ n \)^(h - c)$, and the density factor on the event that these are the actual components is at most $product_j s_j^(s_j \/ 2)$. After extracting this deterministic bound, discard the exact-component and distinctness restrictions only in the forest probability. Consequently
  $ bb(E)_(mu_I) \[ D_I upright(bold(1))_Gamma upright(bold(1))_(upright("distinct")) \] lt.eq 2^h sum_(c = 1)^(floor.l h \/ 2 floor.r) max_(s_1 + dots.h.c + s_c = h\
s_j gt.eq 2) product_(j = 1)^c (frac(2 l h, n))^(s_j - 1) s_j^(s_j \/ 2) . $
  This bound is uniform in $I$. It also shows explicitly why the extra density factor does not consume the forest probability. For sufficiently large $n$, $2 l lt.eq n^.01$; since $h lt.eq n^.60$, the factor of a component of size $s gt.eq 8$ is at most
  $ n^(- .39 \( s - 1 \) + .30 s) = n^(- .09 s + .39) lt.eq n^(- s \/ 25) . $
  For $2 lt.eq s lt.eq 7$, use instead $s^(s \/ 2) lt.eq n^(.01 s)$; then the same bound follows from $- .39 \( s - 1 \) + .01 s lt.eq - s \/ 25$. Thus every product in the preceding sum is at most $n^(- h \/ 25)$, and
  $ bb(E)_(upright("distinct")) \| F \|^2 lt.eq h \( 2 C_0 \)^h n^(- h \/ 25) lt.eq n^(- h \/ 50) $
  after enlarging the absolute size threshold. For $h = 1$ the alternating kernel is identically zero. The tuple transition density has the additional factor $\( n \)_h \/ n^h lt.eq 1$, so its Hilbert–Schmidt norm on the new tuple constituents is at most $n^(- h \/ 100)$. This proves (11), for example with $b = 1 \/ 100$. ◻
]

=== 3.2 The compatibility entropy inequality <tra:duality:grid-definition>

Our other estimate is a trace estimate for crossing row and column sweeps. Splitting the dimensions near the middle gives a grid of size $A times D$ (rows indexed up to $A$, columns up to $D$), $A D = n$, both lengths within a factor 2 of $m = sqrt(n)$. We will need to estimate the event that permutations acting within rows and within columns can be commuted with changed values. We include the entropic counting bound for this event in detail. Logs in it (and in relative entropy) are natural. For probability laws $P \, Q$ on a finite set, we use

$ cal(D) \( P parallel Q \) = sum_(x : P \( x \) > 0) P \( x \) log frac(P \( x \), Q \( x \)) \, $

with value $+ oo$ if $P \( x \) > 0 = Q \( x \)$ for some $x$, and with $0 log 0 = 0$.

Write

$ R = \( S_D \)^A \, #h(2em) C = \( S_A \)^D $

for the row and column groups. For $r in R \, med c in C$ use notation $r_i \( j \) = k \, med c_k \( i \) = w$. Let $cal(I)$ be the event that row action followed by column action can also be written in opposite order. This is exactly that for each $j$, the $A$ outputs $w$ as $i$ varies are distinct. Indeed that is necessary, and gives the first column action in the opposite-order routing, after which the row actions are also determined. Factorizations in either given order are unique.

#thm([Proposition 3.2.])[
  #emph[ Here is the relative entropy estimate. Use $epsilon.alt = 1 \/ 100$. If $Q$ is any distribution supported on $cal(I)$, with marginals $Q_(r_i) \, Q_(c_k)$, then (for sufficiently large $m$) 
#[#set math.equation(numbering: n => "(12)")
 $ cal(D) \( Q parallel U_(R times C) \) med gt.eq med n - O \( n^.54 \) + (1 - frac(L, log m)) (sum_i cal(D) \( Q_(r_i) parallel U_(S_D) \) + sum_k cal(D) \( Q_(c_k) parallel U_(S_A) \)) \, $ <tra:duality:eq2>]

 for an absolute $L$.]
] <tra:duality:entropy>

#proof[
  First put $D_R = cal(D) \( Q_r parallel U_R \)$, for the joint row marginal. Call entries of the $r$ array clumped if for their $j \, k$ the number $N_(j k) = \# { i : r_i \( j \) = k }$ is greater than $m^epsilon.alt$, and let $T \( r \)$ count clumped entries. Then
  #[#set math.equation(numbering: n => "(13)")
   $ bb(E)_Q T med lt.eq med O \( \( D_R + 1 \) \/ log m \) . $ <tra:duality:eq3>]
  We verify the useful strength of this bound. Under $U_R$, $bb(E) e^(z T) lt.eq 2$ for $z = c_0 log m$, $c_0 > 0$ sufficiently small. To bound the contribution with some clumps, union-sum over sets of distinct cells $\( j \, k \)$ and lists of $h_(j k) > m^epsilon.alt$ rows mapping accordingly, using the weight $e^(z sum h_(j k))$. Any compatible prescribed positions in row permutations cost probability at most $\( e \/ D \)^(sum h_(j k))$, by the falling-factorial bound. So after summing over rows, the factor per cell of size $h$ is at most $\( C e^z \/ h \)^h$, negligible to arbitrary polynomial order even after summing over sizes and choosing a cell, for $c_0 < epsilon.alt$. Summing products proves the exponential bound, which implies (13) by relative entropy.
  Use the chain rule with $r$ revealed first. Reveal column permutations in random order (each column $k$ given an independent uniform priority in $\[ 0 \, 1 \]$, earlier revealed first), and within each permutation in increasing order of $i$. Besides $D_R$ the chain rule gives at least the sum of the column marginal entropies #emph[relative to uniform], that is the column relative entropy deficits $cal(D) \( Q_(c_k) parallel U \)$, plus contributions from comparing successive conditional probabilities to those in $Q_(c_k)$ alone. We next lower bound those contributions, averaged over the orders; explicitly we are using the decomposition
  $ cal(D) \( Q parallel U_(R times C) \) = D_R + sum_k cal(D) \( Q_(c_k) parallel U \) + sum_(k \, i) bb(E) thin cal(D) \( P_(upright("past")) parallel P \) . $
  Here $P$ gives probabilities for $c_k \( i \)$ conditional just on $c_k \( i' \)$ for $i' < i$; $P_(upright("past"))$ conditions also on $r$ and earlier columns in the random order. The expectation includes $Q$-data (and we can average freely over orders).
  There are $u_i = A - i + 1$ unused possible values inside permutation $c_k$. Call atoms of $P$ heavy when $P \( w \) > m^epsilon.alt \/ u_i$, and write $t$ for their mass. We have
  #[#set math.equation(numbering: n => "(14)")
   $ sum_(k \, i) bb(E) t lt.eq O (sum_k cal(D) \( Q_(c_k) parallel U \) \/ log m) . $ <tra:duality:eq4>]
  In fact the relative entropy in each internal prediction (reference uniform on $u_i$) bounds the heavy mass times $\( epsilon.alt log m - 1 \)$, by grouping heavy and other atoms. These entropies sum to the column deficits.
  Consider a step with $t lt.eq 1 \/ 2$, and let $cal(L)$ be the light class. Write $P_(upright("light")) = P \( thin dot.op divides cal(L) \)$ and let $A_(upright("past"))$ be the set of values not forbidden by the previously exposed columns. Given the row array, the unique $j$ with $r_i \( j \) = k$ determines these forbidden values: they are the output rows already obtained from original column $j$. Compatibility forces $P_(upright("past"))$ to be supported on $A_(upright("past"))$. Splitting relative entropy between the light and heavy classes gives
  $ cal(D) \( P_(upright("past")) parallel P \) gt.eq P_(upright("past")) \( cal(L) \) cal(D) \( P_(upright("past")) \( thin dot.op divides cal(L) \) parallel P_(upright("light")) \) gt.eq P_(upright("past")) \( cal(L) \) \[ - log P_(upright("light")) \( A_(upright("past")) \) \] \, $
  with the product interpreted as zero when $P_(upright("past")) \( cal(L) \) = 0$. After averaging over the data, the factor $P_(upright("past")) \( cal(L) \)$ may be replaced by the indicator that the actual value lies in $cal(L)$.
  Now fix all data drawn under $Q$, with $t lt.eq 1 \/ 2$ and the actual value light, and average only over the column priorities. The internal predictor $P$, its light class, and $P_(upright("light"))$ are fixed during this averaging. Conditional on priority $x$ for column $k$, each output row value from another column is forbidden with probability $x$. The exceptions have total $P_(upright("light"))$-mass $alpha$, where
  $ alpha lt.eq min \( 1 \, 2 N_(j k) m^epsilon.alt \/ u_i \) . $
  The expected allowed mass is $1 - x + x alpha$. Jensen’s inequality for $- log$ and then averaging over $x$ give the lower bound $integral_0^1 - log \( 1 - x + x alpha \) thin d x$. This argument compares with a light-class distribution to keep the loss on discarding heavy atoms proportional to their actual mass. In particular dropping $t > 1 \/ 2$ cases and actual-heavy cases loses in expectation at most three times the expected heavy mass from the potential one nat per entry, using the marginal prediction law $P$. Dropping clumped entries loses at most $bb(E) T$, since as $i \, k$ vary the corresponding $i \, j$ go once through the row array.
  For all remaining entries the integral bound falls short of 1 by at most $O \( a log \( e \/ a \) \)$ where $a = min \( 1 \, 2 m^(2 epsilon.alt) \/ u_i \)$, by direct integration. Their total loss on this account is at most $O \( D m^(2 epsilon.alt) log^2 m \) = O \( n^.54 \)$. Consequently the sum of the entropy comparisons is at least
  $ n - O \( n^.54 \) - O (\( 1 + D_R + sum_k cal(D) \( Q_(c_k) parallel U \) \) \/ log m) . $
  Together with $D_R gt.eq sum_i cal(D) \( Q_(r_i) parallel U \)$ this proves (12). ◻
]

#proof[
  This is the finite-space entropy–Brascamp–Lieb duality of Carlen and Cordero-Erausquin #cite(label("CarlenCorderoErausquin2009")) Theorem 2.1. We give its specialization here. Suppose first that all weights are positive, and put
  $ V \( r \, c \) = sum_i log w_i \( r_i \) + sum_k log v_k \( c_k \) . $
  The finite Gibbs variational formula, with the event incorporated into the reference measure, is
  $ log bb(E)_U \[ upright(bold(1))_(cal(I)) e^V \] = sup_(Q : thin Q \( cal(I) \) = 1) { bb(E)_Q V - cal(D) \( Q parallel U \) } . $
  Insert (12). Each row marginal then contributes at most
  $ bb(E)_(Q_(r_i)) log w_i - theta cal(D) \( Q_(r_i) parallel U_(S_D) \) lt.eq theta log bb(E)_(U_(S_D)) w_i^(1 \/ theta) \, $
  and the same inequality holds for each column marginal. Dropping the requirement that those marginals arise from a common compatible law only increases the supremum. Hence
  $ log bb(E)_U \[ upright(bold(1))_(cal(I)) e^V \] lt.eq - n + O \( n^.54 \) + theta sum_i log bb(E) w_i^(1 \/ theta) + theta sum_k log bb(E) v_k^(1 \/ theta) . $
  Stirling’s bound gives $log \( n ! \/ \( \| R \| \| C \| \) \) lt.eq n + O \( m log n \)$. It cancels the leading $- n$, and $m log n = O \( n^.54 \)$. Exponentiating proves the claim for positive weights. Replace each zero weight by a positive number tending to zero to obtain the general case, since all spaces are finite. The error is independent of the weights. ◻
]

=== 3.3 Positive coefficients and compatibility <positive-coefficients-and-compatibility>

We isolate the algebraic passage from line operators to a compatibility probability. It applies to every rectangle; balance will enter only through the entropy estimate used afterward. The two quantities attached to a positive line operator $Z_v$ have different roles: the squared coefficient density has total mass $"Tr" Z_v^2$, while the regular rank bounds its normalized density.

#thm([Lemma 3.3.])[
  (Positive line coefficients).  #emph[Let $R \, C lt.eq S_n$ be the row and column groups of a rectangle. For each line $v$, let $Z_v eq.not 0$ be a positive operator in that line’s group algebra, acting on its regular representation. Write $z_v$ for its coefficient density relative to uniform measure, and put 
$ w_v = "Tr"_(upright("reg")) Z_v^2 \, #h(2em) R_v = "rank"_(upright("reg")) Z_v \, #h(2em) rho_v = \| z_v \|^2 \/ w_v . $

 Then $rho_v$ is a probability density and $parallel rho_v parallel_oo lt.eq R_v$. Let $F$ and $G$ be the tensor products of the row and column operators, respectively, acting on the full regular representation of $S_n$. For the compatibility event $cal(I) = { \( r \, c \) : c r in R C }$, 
#[#set math.equation(numbering: n => "(15)")
 $ "Tr"_(upright("reg")) \( F G F G \) lt.eq frac(n !, \| R \| \| C \|) (product_v w_v) bb(P)_(⊗_v rho_v) \( cal(I) \) . $ <e:positive-coefficient-probability>]

 For projections, $w_v = R_v$. A projection of carrier rank $r$ in an irreducible of dimension $D$ has regular rank $R_v = D r$.]
] <lem:coefficient-compatibility>

#proof[
  For a line group $H_v$, the coefficient identity and Parseval give
  $ z_v \( g \) = "Tr" \( cal(L) \( g^(- 1) \) Z_v \) \, #h(2em) bb(E)_(H_v) \| z_v \|^2 = "Tr" Z_v^2 = w_v . $
  Since $Z_v$ is positive and $cal(L) \( g^(- 1) \)$ is unitary,
  $ \| z_v \( g \) \| lt.eq "Tr" Z_v \, #h(2em) \( "Tr" Z_v \)^2 lt.eq R_v "Tr" Z_v^2 . $
  These prove the assertions about $rho_v$. Write $f \( r \) = product_i z_i \( r_i \)$ and $g \( c \) = product_k z_k \( c_k \)$ for the coefficient densities of $F \, G$. Their coefficients in the group algebra are $f \/ \| R \|$ and $g \/ \| C \|$. The trace picks out words whose permutations cancel. More precisely,
  #[#set math.equation(numbering: n => "(16)")
   $ "Tr" \( F G F G \) = frac(n !, \| R \|^2 \| C \|^2) sum_(r_1 c_1 r_2 c_2 = e\
r_1 \, r_2 in R \, med c_1 \, c_2 in C) f \( r_1 \) g \( c_1 \) f \( r_2 \) g \( c_2 \) . $ <e:four-factor-identity>]
  The factor $n !$ is the dimension of the full regular representation. Each subgroup coefficient contributes its density divided by its subgroup order.
  Let $cal(J) = { \( r \, c \) : r c in C R }$. Since $R ∩ C = { e }$, every $\( r \, c \) in cal(J)$ has a unique pair $\( r' \, c' \) in R times C$ satisfying $r c thin r' c' = e$. The map $Psi \( r \, c \) = \( r' \, c' \)$ is an involution of $cal(J)$: the same equality also gives $r' c' r c = e$. Cauchy–Schwarz therefore gives
  $ sum_(\( r \, c \) in cal(J)) \| f \( r \) g \( c \) f \( r' \) g \( c' \) \| lt.eq sum_(\( r \, c \) in cal(J)) \| f \( r \) \|^2 \| g \( c \) \|^2 . $
  Finally, $\( r \, c \) mapsto \( r^(- 1) \, c^(- 1) \)$ maps $cal(J)$ bijectively to the compatibility event $cal(I) = { \( r \, c \) : c r in R C }$. Self-adjointness gives $f \( r^(- 1) \) = overline(f \( r \))$ and $g \( c^(- 1) \) = overline(g \( c \))$, so this inversion leaves the last weight unchanged. Thus
  #[#set math.equation(numbering: n => "(17)")
   $ "Tr" \( F G F G \) lt.eq frac(n !, \| R \| \| C \|) thin bb(E)_(R times C) \[ upright(bold(1))_(cal(I)) \| f \( r \) \|^2 \| g \( c \) \|^2 \] . $ <e:four-factor>]
  Dividing each squared line coefficient by its mass $w_v$ gives (15). ◻
]

=== 3.4 Trace recursion and completion <trace-recursion-and-completion>

#thm([Proposition 3.4.])[
  #emph[ #strong[Grid trace estimate.] Suppose at the two child sizes $A \, D$ we have $Z_A \( p \) \, Z_D \( p \) lt.eq 2$, $p gt.eq 4$. Splitting a sweep into independent sweeps within rows, then independent sweeps within columns, we have 
#[#set math.equation(numbering: n => "(18)")
 $ Z_n \( t \) med lt.eq med exp \( O \( n^.54 \) \) \, #h(2em) t = p \( 1 + O \( 1 \/ log m \) \) \, $ <tra:duality:eq6>]

 where $t$ can be taken as $p \( 1 + L' \/ log m \)$ for a suitable absolute $L'$, for sufficiently large $m$.]
] <tra:duality:recursion>

#proof[
  Write $T_n = K_C K_R$ for the chronological row–column factorization, and set $X = K_R K_R^(*)$, $Y = K_C^(*) K_C$. The positive-power comparison (8), with $p = t$, gives
  $ Z_n \( t \) lt.eq "Tr" \( X^(t \/ 2) Y^(t \/ 2) X^(t \/ 2) Y^(t \/ 2) \) . $
  The line factors of $X^(t \/ 2)$ and $Y^(t \/ 2)$ have coefficient densities $f_i$ and $g_k$. Lemma 14, in its unnormalized form (17), now bounds the right side by the weighted compatibility expectation with line weights $\| f_i \|^2 \, \| g_k \|^2$. Thus we may use (1) and need only bound norms with exponent $nu = 2 \/ theta$ at each fiber. By Lemma 10,
  $ parallel f_i parallel_nu lt.eq [Z_D (t / 2 thin frac(nu, nu - 1))]^(1 - 1 \/ nu) $
  (and likewise using $Z_A$ for $g_k$). The child exponent is exactly $t \/ \( 2 - theta \)$. Thus $t = p \( 2 - theta \) = p \( 1 + L \/ log m \)$ makes it $p$; taking a larger absolute $L'$ also works. The norms are bounded by hypothesis, since the unpowered matrices are contractions. The product of bounds takes only $exp \( O \( m \) \)$, establishing (18). ◻
]

#proof[
  The trace bound is not yet small. We now split it into small diagram levels, already controlled by the forest argument, and large-dimensional blocks, where regular multiplicity amplifies any increase in the moment exponent. To justify treating all remaining representations as large after (11), here are the dimension details. Those with first column of length greater than $n \/ 2$ have zero sweep block: a single parallel dimension projects onto invariants of $\( S_2 \)^(n \/ 2)$, which by Young’s rule can occur only if $lambda$ dominates $\( 2 \, dots.h \, 2 \)$, thus has at most $n \/ 2$ rows. Among the remaining shapes, except $lambda = \( n - h \, dots.h \)$ for $0 lt.eq h lt.eq n^.60$, we can use
  #[#set math.equation(numbering: n => "(19)")
   $ D_lambda med gt.eq med exp \( n^.58 \) $ <tra:duality:eq8>]
  for sufficiently large $n$. In fact if a first row or column has length at least $n \/ 10$, it also has at least $s = floor.l n^.59 floor.r$ boxes off it. Transposing if needed, take the full long row and a subdiagram with $s$ boxes below. Filling the first $s$ boxes in the long row first, we may interleave its remaining boxes and a standard ordering below, giving (19) by tableau count and branching. If neither is long, all hook lengths are bounded by $2 n \/ 10$, giving even exponential growth in $n$. On the other hand at levels $h lt.eq n^.60$ we may use $D_lambda lt.eq n^(2 h)$, immediately by branching or the ordered tuple representation.
  For large $n$ let the baseline $p$ in (18) be at least a sufficiently large absolute constant, so that by (11) the contribution to $Z_n \( p \)$ from levels 1 through $n^.60$ is $o \( 1 \)$: for each partition at level $h$ it is at most $n^(4 h - 2 p b h)$, and there are at most $2^h$ such partitions. For the shapes in (19), (18) forces every squared singular value there to obey
  $ \( upright("squared singular value") \)^t lt.eq exp \( - 1 / 2 n^.58 \) $
  for sufficiently large $n$, by multiplicity in the regular representation. Put $delta = 1 \/ log m$, and list the squared singular values in block $lambda$ as $q_(lambda \, j)$, $1 lt.eq j lt.eq D_lambda$, including repetitions. Their total contribution over the large-dimensional blocks at exponent $t \( 1 + delta \)$ is bounded by
  $ sum_(lambda upright(" large")) D_lambda sum_(j = 1)^(D_lambda) q_(lambda \, j)^(t \( 1 + delta \)) & lt.eq Z_n \( t \) (max_(lambda upright(" large") \, j) q_(lambda \, j)^t)^delta\
 & lt.eq exp #h(-0.16667em) (C n^.54 - frac(n^.58, 2 log m)) = o \( 1 \) . $
  The exponent increase therefore makes both the sparse and the large-dimensional contributions small. We have therefore proved for sufficiently large $n$: if the two child bounds $Z \( p \) lt.eq 2$ hold at parameter $p$ at least the baseline constant, we get (2)’s bound at $n$ at parameter
  $ p \( 1 + L'' \/ log n \) $
  for an absolute $L''$. The sufficiently-large threshold need not depend on $p$.
  For the remaining bounded sizes we can take a fixed baseline parameter large enough to get (2); indeed no nonconstant part has norm 1, since the sweep composes orthogonal projections and their common invariants are constants (cube swaps generate all permutations). Now the parameter increases over the dimension splitting recursion stay absolutely bounded: child log sizes are about half the parent log size, so the product of $1 + L'' \/ log n$ over internal sizes above the threshold along any path is bounded. By monotonicity this proves (2).
  Finally take a fixed integer $M gt.eq p_(*)$. After $M$ sweeps the chi-squared distance to uniform is at most $Z_n \( M \) - 1$: indeed it is the squared Hilbert-Schmidt norm of the regular convolution matrix minus constants after taking the sweeps (all starting rows have the same density norm), and Schatten Hölder bounds this on the nonconstant space by the indicated singular moment minus the constant contribution. Thus total variation is at most $1 / 2 sqrt(1 \/ 16) = 1 \/ 8$, giving the asserted order upper bound. ◻
]

== 4 Regular moments, singular ranks and recursive exponents <sec:spectral-conversion>

We have completed one entropy-to-moment route. Before changing the entropy or sparse input, we record its consequences for singular ranks and repeated sweeps. We then isolate the moment amplification used by several later balanced recursions. Their entropy laws, sparse estimates and representation cutoffs remain separate inputs.

Let $G$ be a finite group and $B$ convolution by a probability law on $G$, acting on $ell^2 \( G \)$ with counting measure. Both $B$ and $B^(*)$ fix constants and preserve their orthogonal complement. Write $B_0$ for the restriction to that complement. For an irreducible unitary representation $rho$, let $D_rho$ be its dimension and $B_rho$ its Fourier matrix on one copy. Its singular values appear $D_rho$ times in the regular representation. We include zeros in every singular list, ordered decreasingly.

#thm([Proposition 4.1.])[
  (Moment and rank conversion).  #emph[Suppose, for $p > 0$ and $0 < epsilon lt.eq 1 \/ 2$, that 
#[#set math.equation(numbering: n => "(20)")
 $ sum_(rho eq.not upright(bold(1))) D_rho "Tr" \| B_rho \|^p lt.eq epsilon . $ <e:nonconstant-moment>]

 Then every nontrivial $rho$ and every $1 lt.eq r lt.eq D_rho$ satisfy 
#[#set math.equation(numbering: n => "(21)")
 $ s_r \( B_rho \) lt.eq (frac(epsilon, D_rho r))^(1 \/ p) . $ <e:block-rank>]

 The full regular singular list, with its constant value at index $1$, satisfies 
#[#set math.equation(numbering: n => "(22)")
 $ s_j \( B \) lt.eq j^(- 1 \/ p) #h(2em) \( 1 lt.eq j lt.eq \| G \| \) . $ <e:regular-rank>]

 For every integer $M$ with $2 M gt.eq p$, $M$ independent convolution steps have worst-start total-variation distance at most $1 / 2 sqrt(epsilon)$ from uniform.]
  #emph[Conversely, if $s_j \( B \) lt.eq j^(- c)$ for an absolute $c > 0$ over a family of finite groups and their convolution operators, then for each fixed $epsilon > 0$ there is a fixed $p' > 0$, independent of the group, for which (20) holds with $p'$ in place of $p$.]
] <e:nonnormal-moment-conversion>

#proof[
  The first $r$ singular values in $B_rho$ are at least $s_r \( B_rho \)$, so their regular contribution is at least $D_rho r thin s_r \( B_rho \)^p$. This proves (21). It applies also when that singular value is zero.
  The left side of (20) is precisely the sum of the $p$th powers of all nonconstant regular singular values. In particular none equals $1$. Thus the distinguished constant singular value is the first value and is simple. For $j gt.eq 2$,
  $ \( j - 1 \) s_j \( B \)^p lt.eq epsilon lt.eq frac(j - 1, j) . $
  This proves (22); at $j = 1$ it is equality.
  The power estimate uses the matrix product, rather than a spectral identification. Schatten Hölder with $M$ factors gives
  #[#set math.equation(numbering: n => "(23)")
   $ parallel B_0^M parallel_(upright("HS"))^2 lt.eq parallel B_0 parallel_(2 M)^(2 M) = sum_(j gt.eq 2) s_j \( B \)^(2 M) lt.eq sum_(j gt.eq 2) s_j \( B \)^p lt.eq epsilon . $ <e:holder-power>]
  The last comparison uses $s_j \( B \) lt.eq 1$. If $mu_M$ is the convolution law after $M$ steps and $Pi$ projects onto constants, every row of $B^M - Pi$ is a permutation of $mu_M - \| G \|^(- 1)$. Consequently
  $ parallel B_0^M parallel_(upright("HS"))^2 = \| G \| sum_(g in G) \| mu_M \( g \) - \| G \|^(- 1) \|^2 . $
  Cauchy–Schwarz bounds total variation by one half of this square root, uniformly over the starting group element.
  For the converse the nonconstant regular moment is at most
  $ sum_(j = 2)^(\| G \|) j^(- c p') lt.eq sum_(j = 2)^oo j^(- c p') . $
  For $q > 1$ the last series with exponent $q$ is at most $2^(- q) + 2^(1 - q) \/ \( q - 1 \)$, by integral comparison. It tends to zero as $q arrow.r oo$. Choosing $q = c p'$ sufficiently large proves the uniform assertion. ◻
]

#thm([Corollary 4.2.])[
  (Vanishing error after a fixed number of sweeps).  #emph[Fix $p > 0$ and $0 < epsilon lt.eq 1 \/ 2$. Suppose (20) holds uniformly for a sequence of groups, and every nonconstant block which is not zero has dimension at least $D_min arrow.r oo$. For any fixed integer $M$ with $2 M > p$, 
$ 4 parallel mu_M - U_G parallel_(upright("TV"))^2 lt.eq epsilon (epsilon / D_min)^(\( 2 M - p \) \/ p) arrow.r 0 . $

]
] <e:vanishing-mixing>

#proof[
  Equation (21) with $r = 1$ bounds $parallel B_0 parallel_(upright("op")) lt.eq \( epsilon \/ D_min \)^(1 \/ p)$. Retain the extra powers in (23) and bound each by this supremum:
  $ sum_(j gt.eq 2) s_j \( B \)^(2 M) lt.eq parallel B_0 parallel_(upright("op"))^(2 M - p) sum_(j gt.eq 2) s_j \( B \)^p . $
  The preceding proof identifies this bound with an upper bound for four times total variation squared. ◻
]

For $S_n$, the sign block of a sweep vanishes by Lemma 4. The minimum dimension among the other nonconstant irreducibles tends to infinity: otherwise their reciprocal-degree sum could not tend to zero in Lemma 8. Thus Theorem 2 gives vanishing worst-start error after any fixed integer $M > p_(*)$. Its positive moment has exponent $p_(*)$, whereas its Schatten moment has exponent $2 p_(*)$. This factor of two will remain explicit when later estimates use one convention or the other.

There is also a useful consequence when an argument gives only irreducible indexed bounds. If $s_r \( B_rho \) lt.eq \( D_rho r \)^(- a)$, then $parallel B_rho parallel_(upright("op")) lt.eq D_rho^(- a)$ and

$ D_rho parallel B_rho^M parallel_(upright("HS"))^2 lt.eq D_rho^(2 - 2 a M) . $

For symmetric groups, taking $2 a M gt.eq 3$, annihilating sign separately, and using Lemma 8 makes the sum tend to zero. This deduction does not assume normality either. It compares the final absolute-power conclusions; it does not identify the constants, sparse ranges, or retained weights in the proofs that follow.

=== 4.1 Closing a balanced moment recursion <closing-a-balanced-moment-recursion>

#thm([Lemma 4.3.])[
  (Exponent losses under rounded halving).  #emph[Fix $gamma > 0$ and an integer base $d_0 gt.eq 3$. Along any branch obtained by replacing $d > d_0$ with $floor.l d \/ 2 floor.r$ or $ceil.l d \/ 2 ceil.r$, the sum of $d^(- gamma)$ over the terms above the base is uniformly bounded. For each fixed $C gt.eq 0$, products of $1 + C d^(- gamma)$ are uniformly bounded, and products of $1 - C d^(- gamma)$ are bounded away from zero if each factor is at least $1 \/ 2$.]
] <lem:dyadic-exponents>

#proof[
  Each child is at most $2 \/ 3$ of its parent. Read upward from the last term above the base: the summands decrease by a factor at most $\( 2 \/ 3 \)^gamma$, so their sum is bounded by a geometric series. The product assertions follow from $log \( 1 + x \) lt.eq x$ and $log \( 1 - x \) gt.eq - 2 x$ for $0 lt.eq x lt.eq 1 \/ 2$. ◻
]

The grid estimates below first give a large bound on a regular trace. Such a bound is useful because a singular value in a high-dimensional irreducible occurs many times in that trace. Increasing the moment exponent then removes the large-dimensional contribution. The following lemma separates this common step from the estimates specific to each entropy exposure.

Fix $nu in { 1 \, 2 }$ and write

$ Z_n \( p \) = "Tr"_(upright("reg")) \| T_n \|^(nu p) . $

Thus $nu = 2$ uses the positive-square convention, whereas $nu = 1$ uses the singular-value convention. The parameter $p$ has this same meaning throughout one application of the lemma.

#thm([Lemma 4.4.])[
  (Moment amplification at a balanced split).  #emph[Fix $0 < epsilon < 1$ and $P > 0$. Suppose that, above an absolute bit length $d_0 gt.eq 3$, the nonconstant irreducible blocks at $n = 2^d$ are divided into two classes with the following properties. Each class includes all regular copies of every singular value in its blocks.]
  + #emph[For every $p gt.eq P$, the first class contributes at most $epsilon \/ 2$ to $Z_n \( p \)$.]
  + #emph[Each value in the second class occurs with its irreducible regular multiplicity at least $e^(H_n)$.]
  + #emph[Put $a = 2^(floor.l d \/ 2 floor.r)$ and $b = 2^(ceil.l d \/ 2 ceil.r)$. For every $p gt.eq P$, 
$ Z_a \( p \) \, Z_b \( p \) lt.eq 1 + epsilon quad arrow.r.double quad Z_n \( alpha_d p \) lt.eq e^(E_n) \, $

 where $alpha_d gt.eq 1$ and the size threshold is independent of $p$.]
  #emph[Suppose further that numbers $delta_d > 0$ satisfy 
$ \( 1 + delta_d \) E_n - delta_d H_n lt.eq log \( epsilon \/ 2 \) \, #h(2em) alpha_d \( 1 + delta_d \) lt.eq 1 + C d^(- gamma) $

 for some fixed $C < oo$ and $gamma > 0$. Then $Z_n \( p_(*) \) lt.eq 1 + epsilon$ for all dyadic $n$, at one finite exponent $p_(*)$.]
] <lem:balanced-moment-closure>

#proof[
  Assume the child bounds at parameter $p$ and set $t = alpha_d p$. If $s$ belongs to the second class, regular multiplicity and the rough trace estimate imply
  $ s^(nu t) lt.eq e^(E_n - H_n) . $
  Consequently its entire class contributes, at the increased parameter $t \( 1 + delta_d \)$, at most
  $ sum_(s upright(" in second class")) s^(nu t \( 1 + delta_d \)) lt.eq e^(delta_d \( E_n - H_n \)) Z_n \( t \) lt.eq e^(\( 1 + delta_d \) E_n - delta_d H_n) lt.eq epsilon \/ 2 . $
  The sums here list regular multiplicities. The first class contributes at most $epsilon \/ 2$ by monotonicity and the first hypothesis. The constant singular value contributes exactly one. This proves the parent bound.
  At the finitely many sizes $d lt.eq d_0$, Lemma 5 allows one common parameter $P_0 gt.eq P$ for which the desired bound holds. Set $p_d = P_0$ in this base range, and above it define
  $ p_d = alpha_d \( 1 + delta_d \) max { p_(floor.l d \/ 2 floor.r) \, p_(ceil.l d \/ 2 ceil.r) } . $
  The preceding parent estimate proves $Z_(2^d) \( p_d \) lt.eq 1 + epsilon$ by induction. Lemma 18 bounds the product of the exponent multipliers along every branch of rounded halvings. Thus $p_(*) := sup_d p_d$ is finite; contraction and monotonicity give the asserted bound at this common parameter. ◻
]

== 5 Conditional column entropy and projection ranks <tra:conditional>

We now retain information after the entire row array is known. Under a law supported on compatible pairs, the column permutations can remain correlated even after this conditioning. The first lemma bounds that conditional correlation in terms of the separate conditional column deficits. The estimate retains conditional information that the unconditional marginal comparison in Section 3 does not record. Its projection consequence also follows from the weighted compatibility theorem; the proof here shows how it follows from the conditional estimate itself.

Throughout this section $T_n$ is the sweep from Section 2. Traces and Schatten norms are unnormalized and include regular multiplicities. The geometry is balanced, with both side lengths within a factor two of $sqrt(n)$.

=== 5.1 Conditional information and projection overlap <tra:conditional:compatibility>

Write $n = r c$, $m = sqrt(n)$, with $m \/ 2 lt.eq r \, c lt.eq 2 m$, and let $H = \( S_c \)^r$ and $K = \( S_r \)^c$ be the row and column groups. A pair $\( h \, u \) in H times K$ is compatible when the row move $h$ followed by the column move $u$ can be performed in the opposite order, that is, $u h in H K$. Equivalently, every original column has its entries sent to distinct destination rows. Regarding cells after the row move as edges between original and intermediate columns, the column permutations then give a proper edge coloring by the $r$ destination rows.

#thm([Lemma 5.1.])[
  (Entropy after the row array is revealed).  #emph[Let $Q$ be any probability law on compatible pairs $\( h \, u \)$, and write $u_k$ for the permutation in intermediate column $k$. Let $H_Q$ denote Shannon entropy in nats under $Q$. Define 
$ F = cal(D) \( Q_h parallel U_H \) \, #h(2em) J = sum_(k = 1)^c bb(E)_h cal(D) \( Q_(u_k divides h) parallel U_(S_r) \) \, #h(2em) I = sum_(k = 1)^c H_Q \( u_k divides h \) - H_Q \( u divides h \) . $

 For all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(24)")
 $ I gt.eq n - O \( n^.57 \) - O \( \( F + J \) \/ log n \) . $ <tra:conditional:eq4>]

 The constants are absolute, uniformly over $Q$.]
] <lem:conditional-column-entropy>

To compare this with unconditional column marginals, put $D_C = sum_k cal(D) \( Q_(u_k) parallel U_(S_r) \)$ and $S = sum_k I_Q \( h \; u_k \)$, where $I_Q$ denotes mutual information. Then

$ J = D_C + S \, #h(2em) sum_k H_Q \( u_k \) - H_Q \( u divides h \) = I + S . $

Thus the lemma retains the conditional information $I$ itself; replacing it by the latter expression would include the columns’ separate information about the row array.

#proof[
  Fix $h$, and expose intermediate columns according to independent continuous uniform priorities between 0 and 1. Inside each column expose edge colors in a fixed order. For a current edge let $p$ be the color law conditional only on the previously exposed colors #strong[in that column] (and $h$). If $R$ colors remain in the column, mark as heavy colors those with
  $ p_i > m^.04 \/ R \, $
  and write $w$ for the light mass. The relative entropy of $p$ from uniform on the $R$ remaining colors is at least
  $ \( 1 - w \) \( .04 log m - 1 \) . $
  Indeed the heavy terms contribute at least $\( 1 - w \) .04 log m$, and by the log-sum inequality the rest contribute at least $w log w$. The sum over edges of the expected relative entropies here, also averaged over $h$, is exactly $J$.
  Call an edge bad if the multiplicity $b$ of its (original column, intermediate column) pair is greater than $m^.04$. Averaging over $h$, the expected number of bad edges is $O \( \( F + 1 \) \/ log n \)$. To see this, under uniform row permutations the number $T$ of bad edges has $bb(E) exp \( c_0 T log m \) lt.eq 2$ with some absolute $c_0 > 0$ for sufficiently large $m$. In detail, to count configurations with $T = l > 0$, list the column pairs of high multiplicity and the rows producing those occurrences. For $a lt.eq l \/ m^.04$ such pairs, listing them costs at most $\( c^2 \)^a$, and their sizes can be given in at most $2^l$ ways. Listing the sets of rows costs at most
  $ \( e r \/ m^.04 \)^l $
  by the binomial bound. The probability of the specified images is at most $\( e \/ c \)^l$, using $\( c \)_x = c \( c - 1 \) dots.h.c \( c - x + 1 \) gt.eq \( c \/ e \)^x$ in every row. This proves the exponential estimate by summing (since $r \, c$ differ only by a bounded factor). Now use the standard entropy variational inequality with $F$.
  By the entropy chain rule, each contribution to $I$ in the exposure procedure is the information the earlier columns give about the current edge color beyond the local (within-column) history. We detail a lower bound on the average contribution for a nonbad edge. Fix the local history for this calculation. By also classifying the current color as light or heavy, a lower bound is $w$ times that mutual information calculated under the condition of a light color (discard if $w = 0$). This uses that the classification is a function of the color given the local history, and column order is independent. Under the light condition, the local color probabilities are the light part of $p$, normalized. Once earlier columns are seen, colors used there at this original column are forbidden. Thus relative entropy from the local light distribution is at least minus log of its mass still allowed, by the support bound for relative entropy.
  Average this last estimate for a column priority $t$, with the other priorities random. Even given the entire valid coloring with current color light, any color at the original column that is used in a #emph[different] intermediate column is forbidden with probability $t$, since the priorities are independent. The $b$ colors used within the current column at the same original column have normalized local light mass at most $b m^.04 \/ \( R w \)$. Jensen’s inequality for the minus log therefore bounds our information contribution below, on average, by
  $ w integral_0^1 - log (1 - t + t thin min { 1 \, b m^.04 \/ \( R w \) }) thin d t . $
  The bound indeed concerns information with the column order known throughout (and is averaged over it). Since $integral_0^1 - log \( 1 - t \) thin d t = 1$, this is at least
  $ w - O (m^.08 / R log \( e m \)) $
  for a nonbad edge. For example this follows directly by integrating, using a loss $O \( x log \( e \/ x \) \)$ inside the factor $w$ when the minimum in braces is $x$; if the minimum is 1 the stated looser bound also suffices. Within any column the $1 \/ R$ sum is $O \( log \( e m \) \)$. The total losses of this latter form are $O \( m^1.08 log^2 \( e m \) \) = O \( n^.57 \)$. The bounds on expected bad edges and summed expected heavy mass thus give (24). ◻
]

#thm([Proposition 5.2.])[
  #emph[ For the balanced grid above, let $A \, D$ be nonzero orthogonal projections in the group algebras of $H \, K$, respectively, each a tensor product over its individual lines. Let $q \, s$ be their ranks in the regular representations of $H \, K$. For all sufficiently large $n$, in the regular representation of $S_n$, 
#[#set math.equation(numbering: n => "(25)")
 $ parallel A D parallel_4^4 lt.eq \( q s \)^(1 + C \/ log n) exp \( O \( n^.57 \) \) . $ <tra:conditional:eq2>]

]
] <tra:conditional:crossing>

#proof[
  First sample $h \, u$ independently with product laws across their lines and densities, relative to uniform on $H \, K$, bounded by $q \, s$. We show that their compatibility probability is at most
  #[#set math.equation(numbering: n => "(26)")
   $ exp { - n + O \( n^.57 \) + \( C \/ log n \) log \( q s \) } . $ <tra:conditional:eq3>]
  If this probability is $e^(- L) > 0$, condition on compatibility and use $F \, J \, I$ from Lemma 20 for the conditioned law. The chain rule against the original product law, and then the density caps against uniform, give
  $ L gt.eq I \, #h(2em) L gt.eq F + J + I - log \( q s \) . $
  Write the losses in (24) as $E + delta \( F + J \)$, where $E = O \( n^.57 \)$ and $delta = O \( 1 \/ log n \)$. Substitution gives
  $ L gt.eq n - E - delta \( F + J \) \, #h(2em) L gt.eq n - E + \( 1 - delta \) \( F + J \) - log \( q s \) . $
  Taking $\( 1 - delta \)$ times the first bound and $delta$ times the second proves (26). A zero probability needs no argument.
  Apply Lemma 14 to the individual line projections forming $A \, D$. Their squared coefficient masses equal their line regular ranks. The normalized squared densities have the same ranks as caps, so the products of masses and caps on the two sides are $q \, s$. Consequently
  $ parallel A D parallel_4^4 = "Tr" \( A D A D \) lt.eq frac(n !, \| H \| \| K \|) thin q s thin bb(P) \( upright("compatibility") \) . $
  The probability has precisely the independent product laws covered by (26). Since $log \( n ! \/ \( \| H \| \| K \| \) \) = n + O \( m log m \)$, the leading $n$ cancels and (25) follows. ◻
]

=== 5.2 Harmonic cancellation at small levels <harmonic-cancellation-at-small-levels>

#thm([Lemma 5.3.])[
  #emph[ Let $V_lambda$ be the irreducible representation indexed by $lambda tack.r n$, with first row $n - k$. For sufficiently large $n$, the sweep on $V_lambda$ satisfies 
#[#set math.equation(numbering: n => "(27)")
 $ parallel T_n \( lambda \) parallel_(upright("op")) lt.eq n^(- .005 k) \, #h(2em) 1 lt.eq k lt.eq n^.61 . $ <tra:conditional:eq5>]

]
] <tra:conditional:sparse>

#proof[
  By branching, $V_lambda$ occurs on ordered $k$-slot injections but not on $\( k - 1 \)$-slot injections. It therefore lies in the orthogonal complement of functions of proper subtuples. We will bound the sweep on that complement by cancellation of isolated paths.
  For input and output $k$-tuples of distinct positions $x \, y$, the paths in one pass are uniquely prescribed (change the input bits in sequence to the output bits). Make a graph on paths, connecting any two touching the same switch anywhere. For $V subset \[ 1 \, k \]$, let $M_V$ be $n^(\| V \|)$ times the probability that the paths indexed by $V$ are realized. This is zero for an incompatible collection and otherwise $2^e$, where $e$ counts switches used by two members, since coins on different switches are independent. In projecting the pass to the part orthogonal to functions of proper subtuples of the $k$ cards, we can replace the kernel entries $n^(- k) M_(\[ 1 \, k \])$ by
  $ n^(- k) sum_V \( - 1 \)^(k - \| V \|) M_V . $
  Terms depending on a proper subtuple do not contribute, and the irreducible in question is in this orthogonal part. If there is any isolated path the sum vanishes because adding that path does not change $M_V$.
  Bound the squared Hilbert-Schmidt norm of this replacement. By Cauchy-Schwarz, up to factors $exp \( O \( k \) \)$, it suffices to bound, uniformly for $V$,
  $ n^(- 2 k) sum_(x \, y med upright(a s med a b o v e)) M_V^2 upright(bold(1))_({ upright("no isolated path") }) . $
  One factor $M_V$ allows the following path sampling upper bound on this expression:
  - For $V$, sample a uniform input injection and run one pass, keeping those paths.
  - For the rest, sample independent uniform input-output slot pairs.
  - Take expected $2^e$ on the no-isolated event, with $e$ counting shared switches among $V$.
  This is an upper bound because the normalization factor from requiring a distinct input for $V$ is at most 1, and restrictions on the independent pairs may be dropped.
  Condition first on the complete switch settings for that pass, so $V$ samples without replacement from $n$ routes using those settings. For a prescribed rooted spanning forest of the touch graph with $a$ components, the probability of the required touches is bounded by
  $ \( 4 d \/ n \)^(k - a) . $
  Indeed expose outward from roots. For a child among $V$, given the parent path, at most $2 d$ of the full routes can touch the path, with at least $n - k$ routes still to choose from. For an independent input-output pair the marginal at each layer is uniform, giving the same bound by a union bound. Moreover, within a component of size $l$, shared switches among compatible pass routes (here the $V$ routes) number at most $l log_2 \( l \) \/ 2$. This deterministic bound follows by splitting after the first layer into output-bit halves and inducting over remaining layers: for child group sizes $l_1 \, l_2$ of a collection of routes the first layer contributes at most $min \( l_1 \, l_2 \)$, at most half the binary entropy gain $\( l_1 + l_2 \) log_2 \( l_1 + l_2 \) - sum_i l_i log_2 l_i$, by concavity.
  Thus, taking a union bound with spanning forest witnesses for the actual components, all of sizes $l gt.eq 2$, the weight $2^e$ costs a factor at most $product_l l^(l \/ 2)$ (product over components). Forests can be counted by selecting roots and specifying a parent for each nonroot, at most $2^k k^(k - a)$ choices with a given $a$. These bounds give at most $n^(- .02 k)$, even including any of the $exp \( O \( k \) \)$ factors above, for sufficiently large $n$. To make the exponent check explicit, before those exponential factors the cost for a given number of components, allowing the worst sizes, is bounded using factors per component
  $ \( 4 d k \/ n \)^(l - 1) l^(l \/ 2) . $
  For $l gt.eq 10$, the power saving from $\( n \/ k \)^(l - 1)$ after paying $l^(l \/ 2)$ is at least $n^(\( .39 dot.op .9 - .305 \) l)$ since $k lt.eq n^.61$. For smaller sizes $l^(l \/ 2)$ costs only exponential constants. Polylog factors per vertex and summing over $a$ do not affect the stated looser bound $n^(- .02 k)$. Taking square roots gives (27). ◻
]

=== 5.3 A bounded moment exponent <a-bounded-moment-exponent>

#thm([Theorem 5.4.])[
  #emph[There is an absolute $p_(*) gt.eq 4$ such that 
#[#set math.equation(numbering: n => "(28)")
 $ upright("Tr") \| T_n \|^(p_(*)) med lt.eq med 1 + 1 \/ 8 $ <tra:conditional:eq1>]

 for every power of two $n$.]
] <tra:conditional:moment>

#proof[
  For the sweep recursion take $n = 2^d$, $r = 2^(ceil.l d \/ 2 ceil.r)$ and $c = 2^(floor.l d \/ 2 floor.r)$. Fix $p'_0 gt.eq 10000$ and suppose the child sweeps satisfy $"Tr" \| T_r \|^(p'_0) \, "Tr" \| T_c \|^(p'_0) lt.eq 1 + 1 \/ 8$. We first obtain a rough parent bound, uniformly in $p'_0$. Write $X = K_C$ for the column sweep and $Y = K_R$ for the row sweep, so the chronological convention gives $T_n = X Y$. We will show
  #[#set math.equation(numbering: n => "(29)")
   $ upright("Tr") \| X Y \|^p lt.eq exp \( O \( n^.58 \) \) \, #h(2em) p = p'_0 \( 1 + C_1 \/ log n \) \, $ <tra:conditional:eq6>]
  for a sufficiently large absolute $C_1$.
  Lemma 9 gives
  $ upright("Tr") \| X Y \|^p lt.eq parallel thin \| X \|^(p \/ 4) \| Y^(*) \|^(p \/ 4) thin parallel_4^4 quad \( p gt.eq 4 \) . $
  We explain the summation bounding the right hand side to keep (29) uniform in $p$. Decompose each local positive factor (for a single row or column) by bins of singular values of the local pass, grouping singular values whose $p'_0$-powers lie in $\( e^(- j - 1) \, e^(- j) \]$, integer $j gt.eq 0$; zero parts can be omitted. Expand into products by choosing one bin per row or column. This works within the group algebras by spectral calculus. In the local regular representation the projection rank for such a bin is at most $2 e^(j + 1)$, by the child moment bound. For any term in the expansion of $\| X \|^(p \/ 4) \| Y^(*) \|^(p \/ 4)$, let $x$ be the sum of all its $j$’s. Its fourth norm power is bounded, by (25) for the two support projections and the operator norm bounds on the factors, by
  $ exp { - x p \/ p'_0 + \( 1 + C \/ log n \) \( x + O \( m \) \) + O \( n^.57 \) } . $
  Taking $C_1 > C + 1$, fourth roots can be summed by the triangle inequality at additional cost at most $\( O \( log n \) \)^(O \( m \))$, by geometric series. This proves (29).
  The projection calculation has supplied only the rough bound (29). To reduce it to a fixed small remainder, we separate the sparse levels just bounded from representations whose regular multiplicity is exponentially large.
  Partitions neither having first row of length at least $n - n^.61$, nor first column that long, have dimension at least
  $ exp \( n^.60 \) $
  for large $n$. Here is one direct check. If the longest row and column are shorter than $2 n^.61$, the hook formula suffices immediately, all hooks being at most $4 n^.61$. Otherwise (transpose if necessary) use a subdiagram with first row of length about $2 n^.61$ and about $n^.61$ boxes below (round down, discarding excess). By branching it suffices to lower bound dimension there. After filling the initial portion of the first row of length equal to the number of lower boxes, the remaining first row entries and lower boxes can be interleaved freely in a standard tableau (with any one standard ordering of lower boxes), giving the claimed bound.
  The first-row levels $1 lt.eq k lt.eq n^.61$ have at most $2^k$ shapes at each $k$, each of dimension at most $n^k$. Therefore (27) bounds their regular contribution at any exponent $u gt.eq 10000$ by
  $ sum_(1 lt.eq k lt.eq n^.61) 2^k n^(2 k - .005 u k) = o \( 1 \) . $
  The shapes with first column at least $n - n^.61$ are annihilated by Lemma 4, since this height exceeds $n \/ 2$ for large $n$. Together these form the first class in Lemma 19; its contribution is at most $1 \/ 16$ above an absolute threshold, uniformly in $u$.
  For the remaining class take $H_n = n^.60$ from the dimension bound, $E_n = C_2 n^.58$ from (29), and $delta_d = 1 \/ log n$. Then
  $ \( 1 + delta_d \) E_n - delta_d H_n = \( 1 + 1 \/ log n \) C_2 n^.58 - n^.60 \/ log n arrow.r - oo . $
  The common lemma applies with singular convention $nu = 1$, $epsilon = 1 \/ 8$, $P = 10000$, and $alpha_d = 1 + C_1 \/ log n$. The combined multiplier is $1 + O \( 1 \/ d \)$. It supplies one finite $p_(*)$ and proves (28), including the finite initial sizes.  The invariant in (28) has singular exponent $p_(*)$ and remainder $1 \/ 8$. Its conversion to forward sweep powers is therefore the case $2 b gt.eq p_(*)$ of Proposition 16. ◻
]

== 6 Inverse-color exposure and balanced trace moments <tra:inverse-color>

The density-cap compatibility bound below is a consequence of the weighted theorem in Section 3. We give a different proof by exposing inverse colors. It compares the laws of remaining positions through their original-column labels, charges large atoms directly to column entropy, and handles repeated labels by a separate exponential moment. The row array is first fixed; within that probability calculation, inverse permutations are exposed by destination color rather than by column prefixes.

The operator application uses spectral projection ranks. Its separate sparse input is an exact endpoint-kernel product formula, which gives a forest estimate through first-row level $n^.64$.

Put $P_n = T_n T_n^(*)$ and define $Z_n \( s \) = "Tr" P_n^s$ for $s > 0$. Thus $Z_n \( s \) = "Tr" Q_n^s$; the two positive squares have the same eigenvalues, although they are generally different operators. Traces retain regular multiplicities.

=== 6.1 A compatibility bound from inverse colors <a-compatibility-bound-from-inverse-colors>

#thm([Proposition 6.1.])[
  #emph[ Let $n = q m$, with $m lt.eq q lt.eq 2 m$ and $m$ sufficiently large. On a $q times m$ grid choose all row and column permutations independently. Relative to uniform in each line, suppose their laws have bounded densities, and let $L_R \, L_C$ be the sums for rows and columns, respectively, of the logarithms of these density bounds.]
  #emph[Consider the product of the row permutation layer and then the column permutation layer. Call the product reversible in order if it can also be written as a column layer followed by a row layer (this just refers to a factorization of a permutation). With $C$ an absolute constant, 
#[#set math.equation(numbering: n => "(30)")
 $ Pr \( upright("reversible in order") \) med lt.eq med exp (- n + n^0.58 + frac(C, log n) \( L_R + L_C \)) . $ <tra:inverse-color:eq1>]

]
] <tra:inverse-color:compatibility>

#proof[
  To see what the condition means, write the row permutations as $a_i$, column permutations as $b_j$, and at each intermediate cell $\( i \, j \)$ put
  $ X_(i j) = a_i^(- 1) \( j \) \, #h(2em) Y_(i j) = b_j \( i \) . $
  Then the condition is precisely that the $n$ pairs $\( X_(i j) \, Y_(i j) \)$ are all distinct. In fact in a column-first factorization, all cards from any one original column must have different destination rows, and this is also sufficient, since then one can first put all cards in the correct row by column permutations, before going to their destinations by row permutations.
  Fix the array $X$. For each $j \, x$ let $M_(j x) = \| { i : X_(i j) = x } \|$, and let
  $ W = sum_(j \, x : med M_(j x) > m^0.05) M_(j x) . $
  With only column randomness now, let $p_(upright("ok"))$ be the probability of the condition. We claim
  #[#set math.equation(numbering: n => "(31)")
   $ log p_(upright("ok")) lt.eq - n + W + n^0.57 + frac(C, log m) L_C . $ <tra:inverse-color:eq2>]
  Assume the probability is positive, and let $nu$ be the conditional law of the column permutations given success. Denote column laws before conditioning by $mu_j$, and the marginals of $nu$ by $nu_j$. With relative entropy denoted by $D_(upright("KL"))$, put
  $ I = D_(upright("KL")) \( nu med parallel med product_j nu_j \) \, #h(2em) D = sum_j D_(upright("KL")) \( nu_j med parallel med mu_j \) . $
  We have
  #[#set math.equation(numbering: n => "(32)")
   $ - log p_(upright("ok")) = I + D \, #h(2em) sum_j D_(upright("KL")) \( nu_j med parallel med upright("uniform") \) lt.eq D + L_C . $ <tra:inverse-color:eq3>]
  Estimate $I$ by revealing inverse permutations $i_j \( y \) = b_j^(- 1) \( y \)$ in the order of colors $y = 1 \, dots.h \, q$ (destination row is the color), and within each color in uniformly random order of columns, independent of the configuration. For each color we can order by independent uniform priorities in $\[ 0 \, 1 \]$, low priority number revealed first. In the chain rule for $I$, consider the divergence contribution when $i_j \( y \)$ is revealed. Under the reference product of the marginals, the prediction law $u_i$ on possible $i$’s for $i_j \( y \)$ is determined by the previously revealed colors in that column only. Let
  $ v_x = sum_(i : X_(i j) = x) u_i . $
  Under the true conditional reveal law from $nu$, the $x$ value this color gets from column $j$ cannot have already been used by this color in another column. So the KL contribution (conditional divergence) is at least minus the log of the total $v$-mass of $x$’s not yet used by the color.
  We average this last bound. Fix a full sample from $nu$, and for column $j$ in that color fix its priority $t$; the vector $v$ does not depend on the other priorities. Every $x$ except the actual value $x_(*) = X_(i_j \( y \) \, j)$ of the sample at this reveal is used by the color in another column, hence has probability $t$ of being used earlier. By Jensen the expected lower bound on divergence from the allowed mass is at least
  $ - log \( 1 - t + t v_(x_(*)) \) . $
  Integrating over $t$, this is
  $ 1 - h \( v_(x_(*)) \) \, #h(2em) h \( z \) = frac(- z log z, 1 - z) \, $
  using continuous limit values. Here $0 lt.eq h \( z \) lt.eq 1$, and $h \( z \) lt.eq C z log \( e \/ z \)$ on $\[ 0 \, 1 \]$.
  For the whole sum of errors $h \( v_(x_(*)) \)$, the terms with $M_(j x_(*)) > m^0.05$ cost at most $W$ since all cells in each column are revealed. To bound the other errors, for column $j$ and color $y$ condition just on the previous colors in that column. Then under sampling from $nu$ the conditional law of $x_(*)$ is $v$. Write $R = q - y + 1$ for the number of remaining rows. For $M_(j x) lt.eq m^0.05$:
  - Those $x$ with $v_x lt.eq m^0.1 \/ R$ have $h \( v_x \) lt.eq C \( log m \) m^0.1 \/ R$, using also $R lt.eq 2 m$.
  - The total $v$-probability of the others with $M_(j x) lt.eq m^0.05$ is at most
  $ frac(C, log m) D_(upright("KL")) \( u med parallel med U_R \) \, $
  where $U_R$ is uniform among the remaining $i$’s in this column. Indeed under $U_R$, the induced probability of any such $x$ is at most $m^0.05 \/ R$; compare this induced law with $v$, writing the divergence as a sum of nonnegative terms $a log \( a \/ b \) - a + b$, and use the data processing inequality. On the $x$’s in question we have probability ratio at least $m^0.05$.
  Sum the expected errors. For the first bullet the summed bound is at most $C m^1.1 \( log m \)^2 lt.eq n^0.57$ for sufficiently large $m$. For the second bullet we can use $h lt.eq 1$; the divergences in the bound sum (in expectation) to the left side of the second inequality in (32), by the chain rule for the column marginals. We conclude
  $ I gt.eq n - W - n^0.57 - frac(C, log m) \( D + L_C \) . $
  Combining with (32) proves (31), since $m$ is sufficiently large.
  The inverse-color exposure has reduced the loss to repeated original column labels. We now average over the row permutations by bounding the exponential cost of $W$. First under uniform row permutations,
  #[#set math.equation(numbering: n => "(33)")
   $ bb(E)_(upright("unif")) exp \( c \( log m \) W \) lt.eq 2 $ <tra:inverse-color:eq4>]
  for some absolute $c > 0$ and sufficiently large $m$. Here are details of the count. Groups of entries contributing to $W$ are specified by a pair $j \, x$, a size $l > m^0.05$, and $l$ chosen rows where $X_(i j) = x$. For any collection with distinct indexing pairs $j \, x$, fulfilling its requirements has probability at most $\( e \/ m \)^(sum l)$ (or zero if requirements conflict). In fact if $b$ entries are prescribed in a row their probability is at most $1 \/ \( m \)_b lt.eq \( e \/ m \)^b$, with falling factorial notation. Sum over collections with the exponential weight for their total size; this bounds the moment because we can take the collection of all actual contributing groups, and include the empty collection. We obtain the upper bound
  $ (1 + sum_(l > m^0.05)^q binom(q, l) \( e \/ m \)^l m^(c l))^(m^2) \, $
  where the sum uses integral $l$. By $binom(q, l) lt.eq \( 2 e m \/ l \)^l$, say $c = 0.01$ suffices for (33). Changing the row laws to the ones in (30), the joint density of rows is at most $exp \( L_R \)$. Thus by Hölder, putting $B = c log m > 1$,
  $ bb(E) exp W lt.eq \( 2 exp L_R \)^(1 \/ B) . $
  Averaging (31) in its exponential form and increasing constants gives (30). ◻
]

=== 6.2 Balanced spectral buckets <balanced-spectral-buckets>

#thm([Proposition 6.2.])[
  #emph[ #strong[Trace bound on splitting the cube.] We next show the following implication when $d$ is sufficiently large. Split the $d$ bits contiguously into groups of $floor.l d \/ 2 floor.r \, ceil.l d \/ 2 ceil.r$, and put $m \, q$ equal to 2 to those respective powers. Suppose for some $s gt.eq 2$ that 
$ Z_m \( s \) \, Z_q \( s \) lt.eq 2 . $

 Then for $p = s \( 1 + C_0 \/ log n \)$, with an absolute constant $C_0$, we have 
#[#set math.equation(numbering: n => "(34)")
 $ Z_n \( p \) lt.eq exp \( n^0.60 \) . $ <tra:inverse-color:eq5>]

 In particular the loss here has $log$ much smaller than $n$; the order multiplier matters as well, and has been chosen to work with balanced splitting.]
] <tra:inverse-color:recursion>

#proof[
  Regard positions as cells in the grid above, with column index coming from the first group of bits. Write $H$ for the subgroup permuting positions independently within rows, $J$ that within columns. The full sweep is a product of independent sweeps within rows followed by independent sweeps within columns. Let $K_H \, K_J$ denote the respective group algebra operators, lifted to the full regular representation, so that $T_n = K_J K_H$, with the row sweeps acting first. Products over individual lines in $H$ or $J$ correspond within that subgroup’s group algebra to tensor products. Use the positive semidefinite operators
  $ D_H = K_H K_H^(*) \, #h(2em) D_J = K_J^(*) K_J . $
  Each local factor has the same positive-square moments as the corresponding child sweep. With these orientations, Lemma 9 gives
  #[#set math.equation(numbering: n => "(35)")
   $ Z_n \( p \) lt.eq ∥D_H^(p \/ 4) D_J^(p \/ 4)∥_4^4 . $ <tra:inverse-color:eq6>]
  For the operator of a row in $D_H$ divide positive eigenvalues $alpha$ into buckets indexed by nonnegative integers $ell$, according to
  $ ell lt.eq - s log alpha < ell + 1 . $
  Use its spectral projections onto the buckets, obtained as elements of the row group algebra (e.g. by polynomial calculus in the row regular representation). Do likewise for each column in $D_J$. For any choice of one nonempty bucket per row and per column, denote the ranks of the projections within their individual regular representations by $r_z$, where $z$ ranges over lines (rows and columns). We have
  #[#set math.equation(numbering: n => "(36)")
   $ r_z lt.eq 2 e^(ell_z + 1) $ <tra:inverse-color:eq7>]
  by the trace moment hypothesis in the respective smaller cubes. Denote the combined row projection in the big regular representation by $E$, and the combined column projection by $F$; projections of individual lines within rows (and likewise within columns) combine by product in the subgroup. All projections and spectral restrictions can be lifted from the subgroup algebras as used here, since restriction of the regular representation to a subgroup acts by copies of its regular representation.
  The spectral buckets preserve the child trace budget as a bound on regular rank. The next calculation converts the probability estimate into the overlap needed to sum those buckets:
  #[#set math.equation(numbering: n => "(37)")
   $ parallel E F parallel_4^4 lt.eq exp \( n^0.59 \) product_z r_z^(thin 1 + C_1 \/ log n) $ <tra:inverse-color:eq8>]
  with an absolute $C_1$. Apply Lemma 14 to these line projections. Their squared coefficient masses and the caps of their normalized squared densities are both $r_z$. Hence
  $ parallel E F parallel_4^4 lt.eq frac(n !, \| H \| \| J \|) (product_z r_z) bb(P)_rho \( upright("reversible in order") \) \, $
  where $rho$ is an independent product of line densities bounded by $r_z$. The lemma’s inversion step matches the chronological convention of Proposition 24. Applying that proposition with $L_R + L_C = sum_z log r_z$, and using
  $ log frac(n !, \| H \| \| J \|) = n + O \( sqrt(n) log n \) \, $
  proves (37).
  Expand the product in (35) according to the bucket assignments (zero eigenvalues contribute nothing). For one assignment, the term $D_H^(p \/ 4) E F D_J^(p \/ 4)$ in the product has Schatten 4-norm at most
  $ exp (- frac(p, 4 s) sum_z ell_z) parallel E F parallel_4 . $
  This follows by the ideal property of that norm with the outside operators restricted by the projections (using their operator norms). Use (36),(37) and the triangle inequality. Choose $C_0 > C_1 + 1$. For an absolute $C'$, we get
  $ parallel D_H^(p \/ 4) D_J^(p \/ 4) parallel_4 & lt.eq exp \( n^0.59 \/ 4 \) [C' sum_(ell gt.eq 0) e^(- ell \/ \( 4 log n \))]^(q + m) . $
  Since $q + m = O \( sqrt(n) \)$, (35) gives (34) for sufficiently large $n$, uniformly in $s$. ◻
]

=== 6.3 An exact endpoint kernel and sparse forests <an-exact-endpoint-kernel-and-sparse-forests>

#thm([Lemma 6.3.])[
  #emph[ The loss in (34) requires a separate bound for sparse first-row levels. Call $k = n - lambda_1$ the level of an irreducible, where $lambda_1$ is the length of the first row of its diagram. We show, for some absolute $c_2 > 0$, all sufficiently large $n$, and 
$ 1 lt.eq k lt.eq n^0.64 \, $

 that the sweep has squared operator norm (square of its largest singular value), within each level $k$ irreducible, bounded by 
#[#set math.equation(numbering: n => "(38)")
 $ n^(- c_2 k) . $ <tra:inverse-color:eq9>]

]
] <tra:inverse-color:sparse>

#proof[
  Use the permutation action on ordered injective $k$-tuples of positions. The level $k$ irreducibles occur there but are orthogonal to functions missing any of the coordinates, since such functions are in tuple modules for $k - 1$. Indeed by the branching rule (or Young’s rule) the tuple module for $b$ coordinates contains the irreducibles whose first rows have length at least $n - b$; it is induced from a trivial representation on $n - b$ positions. We bound the sweep kernel on the part in question in the tuple module.
  Consider an entry for input positions $x$ and output positions $y$ (ordered tuples). Orientation of the kernel, or taking its transpose, will not matter for the estimates. Paths of these cards through the sweep, if they realize the entry, are uniquely specified by the endpoints, since at stage $r$ bits $1 \, dots.h \, r$ have been set to their end values and the other bits have the start values. For two cards $u \, v$ in the tuple let
  - $b_(u v)$ be the last bit where their starts differ;
  - $a_(u v)$ be the first bit where their ends differ.
  The entry probability is
  #[#set math.equation(numbering: n => "(39)")
   $ n^(- k) Q_(\[ k \]) \( x \, y \) \, #h(2em) Q_T \( x \, y \) = product_({ u \, v } subset T) w \( b_(u v) \, a_(u v) \) \, quad w \( b \, a \) = cases(delim: "{", 1 & a < b \,, 2 & a = b \,, 0 & a > b .) $ <tra:inverse-color:eq10>]
  In fact $a > b$ gives impossible paths (collision), $a = b$ means they share the switch at that bit and use distinct exits, and in the other case they do not meet at a switch. If no collision occurs, at a switch used by both cards of some pair the probability factor is $1 \/ 2$ rather than the product $1 \/ 4$; other used switches with one card just give the factor $1 \/ 2$. This also explains (39) for any smaller tuple, using the corresponding number of cards instead of $k$ in the prefactor.
  On projecting onto the sum of the level $k$ irreducibles we can replace $Q_(\[ k \])$ by
  $ tilde(Q) = sum_(T subset \[ k \]) \( - 1 \)^(k - \| T \|) Q_T . $
  Indeed the added matrices have entries that omit at least one tuple coordinate and vanish between the indicated projected parts. Consider the graph on tuple labels whose edges indicate that the paths specified by $x \, y$ touch a common switch, whether or not they could occur jointly. If this graph has an isolated vertex, $tilde(Q) = 0$, by cancellation. The square of the Hilbert-Schmidt norm of the sweep on the projected part is therefore at most
  #[#set math.equation(numbering: n => "(40)")
   $ 2^k n^(- 2 k) sum_(T subset \[ k \]) sum_(x \, y) Q_T \( x \, y \)^2 thin upright(bold(1))_({ upright("no isolates") }) . $ <tra:inverse-color:eq11>]
  Here are probabilistic bounds for (40). For fixed $T$, change measure using one factor $Q_T$. Up to a total mass factor at most 1, and dropping distinctness constraints on the additional paths for upper bounds, the law now can be sampled as follows:
  - Realize an independent full random sweep on all positions. Pick $\| T \|$ distinct start positions uniformly and use their start/end paths for $T$.
  - For the other labels, use independent paths with starts and ends all uniform independent positions.
  This follows from (39): on distinct tuples, $n^(- 2 k) Q_T \( x \, y \)$ gives exactly this weight with the factor $\( n \)_(\| T \|) \/ n^(\| T \|)$, $\( n \)_a$ denoting the falling factorial. Only the positions within $T$ are needed to evaluate the remaining factor $Q_T$, which in this construction equals $2$ to the power the number of meetings at switches among the paths in $T$.
  Condition on the full sweep realization used in this sampling. We need two bounds.
  ===== 6.3.1 Meeting count. <meeting-count.>
  The number of meetings among any set of $b gt.eq 1$ realized full-sweep paths is at most $b log_2 \( b \) \/ 2$. To see this split paths by last input bit. All meetings before the last stage respect this split, and the two parts have sweeps on smaller cubes up to then. Meetings at the last stage contribute a matching between the two parts. Induction gives the bound, since for part sizes $b' \, b - b'$,
  $ b log_2 b - b' log_2 b' - \( b - b' \) log_2 \( b - b' \) med gt.eq med 2 min \( b' \, b - b' \) $
  (with zero summands interpreted by continuity); this follows also by concavity of binary entropy.
  ===== 6.3.2 Forest probability. <forest-probability.>
  For any specified forest on the $k$ labels, the probability all its edges indicate common switches is at most
  $ \( C d \/ n \)^(\# upright("edges")) . $
  Indeed sample its paths along the forest in parent-before-child order. If a child is one of the additional independent paths, for each stage its switch (out of $n \/ 2$) is uniform, from the uniform endpoints. If it belongs to $T$, we sample among at least $n - k$ remaining full-sweep paths, of which at most two at each stage use the switch in question on its parent’s path. The estimate follows by testing the edges as the child paths are sampled, since $k lt.eq n^0.64$.
  For the event with no isolates, take spanning trees in each component of the common-switch graph. For component sizes $b_1 \, dots.h \, b_j gt.eq 2$, the first bound above shows that the remaining weight $Q_T$ is at most $product b_i^(b_i \/ 2)$, since paths from $T$ in different components cannot meet. For an upper bound on its expectation on the event, sum over spanning forests using this weight for forest component sizes and using the probability bound from the second estimate (we can thereby count outcomes more than once). Forests with $j$ components number at most $2^k k^(k - j)$, by choosing roots and parents. Also $b^(b \/ 2) lt.eq C^b k^(\( b - 1 \) \/ 2)$ for $b lt.eq k$, since $b^(\( b - 1 \) \/ 2) lt.eq k^(\( b - 1 \) \/ 2)$ and $sqrt(b) lt.eq C^b$. Thus (40) is bounded by
  #[#set math.equation(numbering: n => "(41)")
   $ C^k sum_(1 lt.eq j lt.eq k \/ 2) (frac(C d thin k^(3 \/ 2), n))^(k - j) \, $ <tra:inverse-color:eq12>]
  where the constants absorb the subset counts. If there is no such $j$, (40) is zero. Otherwise $d = log_2 n$, $k^(3 \/ 2) lt.eq n^0.96$, and $k - j gt.eq k \/ 2$; (41) is at most $n^(- c_2 k)$ with some absolute $c_2 > 0$ for sufficiently large $n$. Since the tuple action applies the group algebra operator within the irreducibles (taking adjoints if using the other kernel orientation), we have proved (38). ◻
]

#thm([Lemma 6.4.])[
  #emph[ We specify why this covers the relevant small dimensional part. Any irreducible with diagram height bigger than $n \/ 2$ is killed by a switch-layer average: the switch subgroup is a Young subgroup with $n \/ 2$ parts of size 2, and by Young’s rule such an irreducible has no invariants there (cannot have a strictly increasing column for a semistandard filling with $n \/ 2$ symbols). Moreover for all sufficiently large $n$, any remaining irreducible not of level $lt.eq n^0.64$ has dimension at least 
$ exp \( n^0.62 \) . $

]
] <tra:inverse-color:dimension>

#proof[
  Here is one quick verification. If both row and column lengths (longest in the diagram) are smaller than $n \/ 10$, every hook is bounded by $n \/ 5$, giving the result by the hook-length formula. Otherwise take a direction with length at least $n \/ 10$, transposing if necessary (dimension unchanged). Outside this long row there are at least $floor.l n^0.64 floor.r$ boxes by hypothesis (if transposed, by original height at most $n \/ 2$). Take a subdiagram with this row and just $b = floor.l n^0.64 floor.r$ boxes below it, shrinking from corners. Its standard tableaux already give the required dimension lower bound, since they extend to the full diagram. In fact one may fill the first $b$ places of the row first, then interleave a standard order on the lower $b$ boxes with the rest of the first row arbitrarily. For large $n$ this gives at least $2^(Omega \( b \))$ ways. ◻
]

=== 6.4 The bounded-order induction <the-bounded-order-induction>

#thm([Theorem 6.5.])[
  #emph[There is an absolute finite $s_(*) > 0$ such that $Z_n \( s_(*) \) lt.eq 1 + 1 \/ 8$ for every dyadic $n$.]
] <tra:inverse-color:moment>

#proof[
  Choose a fixed $P gt.eq 2$ with $P c_2 gt.eq 4$, where $c_2$ is the constant in (38). At first-row level $1 lt.eq k lt.eq n^.64$ there are at most $2^k$ shapes, each of dimension at most $n^k$. Thus for every $u gt.eq P$, their contribution to $Z_n \( u \)$ is at most
  $ sum_(k = 1)^(floor.l n^.64 floor.r) 2^k n^(2 k - u c_2 k) = o \( 1 \) . $
  Lemma 27 annihilates shapes of height more than $n \/ 2$ and gives dimension at least $exp \( n^.62 \)$ for all remaining shapes outside this sparse range.
  Apply Lemma 19 with positive-square convention $nu = 2$ and $epsilon = 1 \/ 8$. The sparse and annihilated shapes form its first class and contribute at most $1 \/ 16$ for large $n$, uniformly above $P$. Proposition 25 supplies the rough bound from child moments at most $1 + 1 \/ 8 < 2$, with
  $ E_n = n^.60 \, #h(2em) H_n = n^.62 \, #h(2em) alpha_d = 1 + C_0 \/ log n \, #h(2em) delta_d = 1 \/ log n . $
  The required attenuation follows from
  $ \( 1 + delta_d \) E_n - delta_d H_n = \( 1 + 1 \/ log n \) n^.60 - n^.62 \/ log n arrow.r - oo . $
  All size thresholds are independent of the inherited exponent, and $alpha_d \( 1 + delta_d \) = 1 + O \( 1 \/ d \)$. The common lemma therefore gives a finite $s_(*)$ such that $Z_n \( s_(*) \) lt.eq 1 + 1 \/ 8$ for all dyadic $n$.
  This is a positive-square moment, with matching singular exponent $2 s_(*)$. Proposition 16 gives chi-square divergence at most $1 \/ 8$ after every integer number $l gt.eq s_(*)$ of forward sweeps. ◻
]

== 7 Tilted array predictions and unordered tuple exceptions <tra:tilted-arrays>

We give a survival-tilted proof of the weighted compatibility interface from Section 3. It retains the integrability costs of arbitrary line weights through marginal deficits and entropy duality. The comparison distribution is tilted by reciprocal survival probabilities, giving another way to charge the exceptional atoms.

At each cell the proof multiplies the probabilities of available light symbols by the reciprocal survival probability for symbol pairs located in other columns. Pairs in the current column are exceptions, whose contribution is included in the normalizing cost. The logarithm of the multiplier supplies the entropy gain. Its normalizing cost remains small after fixing the full compatible array, so rare heavy atoms are charged by their number without an additional logarithmic loss.

The sparse step retains a second piece of information. An average interaction estimate identifies exceptional input tuples, but an operator norm also requires control of how much mass those tuples can receive from every output tuple. We prove that control for every exceptional set determined by unordered input positions, then use it in two Schur bounds.

Here $N = 2^d$, $d gt.eq 1$. Write $T_N$ for a sweep and $cal(Z)_N \( u \) = "Tr" \( T_N^(*) T_N \)^u$ for $u > 0$, with unnormalized regular trace. One sweep costs $d$ physical shuffles as in Section 2. Products act right-to-left, as in Section 2; a row move followed by a column move therefore places the column operator on the left. All coefficient functions below are densities relative to uniform probability on the indicated subgroup.

=== 7.1 Weighted compatibility of two permutation arrays <tra:tilted-arrays:array-definition>

We first prove the weighted array inequality independently of the sweep. Consider an $n$-by-$m$ grid with $m lt.eq n lt.eq 2 m$; in this estimate write $N = n m$. Arrays $A \, B$ satisfy:

- each row $A_i$ of $A$ gives the $m$ symbols once each;
- each column $B_j$ of $B$ gives the $n$ symbols (of a second alphabet) once each.

#thm([Proposition 7.1.])[
  #emph[ Use as reference $U$ independent uniform permutations in these rows and columns. Say $A \, B$ are #strong[compatible] if the symbol pairs $\( A_(i j) \, B_(i j) \)$ are all distinct. There are absolute $C_0 \, C_1 \, epsilon > 0$ such that, for $m$ sufficiently large, putting 
$ alpha = 1 - frac(C_0, log m) > 0 \, $

 we have the following bound on nonnegative weights, with uniform expectations on its right: 
#[#set math.equation(numbering: n => "(42)")
 $ upright(bold(E))_U [upright(bold(1))_(upright("comp")) product_i L_i \( A_i \) product_j M_j \( B_j \)] med lt.eq med & exp { - N + C_1 N m^(- epsilon) }\
 &  dot.op product_i (upright(bold(E)) L_i^(1 \/ alpha))^alpha product_j (upright(bold(E)) M_j^(1 \/ alpha))^alpha . $ <tra:tilted-arrays:eq2>]

]
] <tra:tilted-arrays:weighted>

#proof[
  To prove this, let $q$ be any probability law on compatible arrays, with the entropy $H$ below computed in this law. Define the deficits
  $ D_A = n log \( m ! \) - H \( A \) \, #h(2em) D_B = m log \( n ! \) - sum_j H \( B_j \) . $
  In particular $D_A$ is for the full $A$ array (so dominates the sum of marginal deficits in the rows). Let
  $ I = sum_j H \( B_j \) - H \( B divides A \) . $
  The column marginal entropies here are unconditional. Thus $I$ includes both the conditional correlation of the columns given $A$ and the sum of their separate mutual informations with $A$, as in the comparison after Lemma 20. We claim
  #[#set math.equation(numbering: n => "(43)")
   $ I med gt.eq med N - C_1 N m^(- epsilon) - frac(C_0, log m) \( D_A + D_B \) . $ <tra:tilted-arrays:eq3>]
  Reveal $A$ and go through the columns $j$ of $B$ in order of iid priorities $x_j$ uniform on $\[ 0 \, 1 \]$ (from small to large), these priorities independent of $A \, B$. Within each column use row order $i = 1 \, dots.h \, n$. At cell $i \, j$, use the marginal conditional probabilities $p_b$ for the column $B_j$ itself, given its prefix, as comparison. Then $I$ is the sum over cells of the expected KL divergences of the true conditional (including $A$, priorities and earlier revealed $B$) against $p$. This follows from the conditional entropy chain rule in this order, since log probabilities from the $p$’s are just marginal-column log probabilities in total.
  Use the following tilt of $p$. Say an atom $b$ here is light if $p_b lt.eq m^(- 3 \/ 10)$. Write $a = A_(i j)$ and let the multiplicity $v$ be the number of times $a$ occurs in the $j$-th column of $A$. Write $y = 1 - x_j$. If $v > m^(1 \/ 10)$ or $y < m^(- 1 \/ 10)$, skip the tilt, using factors $t_b = 1$. Otherwise let $t_b = 1$ on the non-light atoms, and on the light atoms set
  $ t_b = cases(delim: "{", 1 \/ y \, & upright("pair ") \( a \, b \) upright(" not present in any earlier column") \,, 0 \, & upright("otherwise") .) $
  These factors use only data known at this point and the normalizer $Z = sum_b p_b t_b$ is positive on histories of positive conditional probability (with comparisons understood for almost every priority choice), by compatibility. Thus the divergence contribution is bounded below in expectation by the expected
  $ log t_(B_(i j)) - log Z . $
  We can bound the normalizer cost by holding the #emph[full] compatible arrays and $x_j$ fixed and taking expectation in other priorities. In particular $p$ has not depended on those priorities, because within-column revelation is in fixed order. Except for the $v$ symbols paired with $a$ in column $j$, any $b$ has its pair with $a$ in a different column, so the pair is available (not in an earlier column) with probability $y$. Consequently in non-skipped cases
  $ upright(bold(E))_(upright("other priorities")) Z lt.eq 1 + v m^(- 3 \/ 10) \/ y lt.eq 1 + m^(- 1 \/ 10) . $
  Log-normalizer cost in expectation is then at most $m^(- 1 \/ 10)$. On the other hand if multiplicity is not too high and the actual atom is light, we earn in expectation over priorities $integral_(m^(- 1 \/ 10))^1 log \( 1 \/ y \) thin d y = 1 - O \( m^(- 1 \/ 10) log m \)$. This use of column priorities lets the potential loss from skipping non-light atoms be counted without a large logarithmic penalty per lost cell.
  The tilt has supplied almost one nat at each retained light cell, while its expected normalizing cost is small. Two exclusions remain: a heavy actual symbol, and a symbol occurring too often in its column of $A$. We pay for these using, respectively, $D_B$ and the full-array deficit $D_A$.
  - Non-light actual atoms have expected count
  #[#set math.equation(numbering: n => "(44)")
   $ O (N m^(- c) + frac(D_B, log m)) $ <tra:tilted-arrays:eq4>]
  for an absolute $c > 0$. Indeed, we may ignore the last $ceil.l m^(4 \/ 5) ceil.r$ entries in each column, counting those as losses. At any remaining cell, the non-light atoms are at most fraction $O \( m^(- 1 \/ 2) \)$ of the alphabet remaining in a uniform permutation. If their conditional $p$-mass $h$ is at least $m^(- 1 \/ 4)$, KL divergence versus that uniform choice is $Omega \( h log m \)$, by divergence on the related binary event ($h log \( h \/ p_(upright("unif")) \( upright("event") \) \) - h$ suffices for a lower bound). Else the mass is already small. The expected divergences of $p$ versus the uniform remaining choices sum to $D_B$, proving (44).
  - For $A$, let $J$ count cells at which the multiplicity in the column of the cell’s symbol exceeds $m^(1 \/ 10)$. We have
  #[#set math.equation(numbering: n => "(45)")
   $ upright(bold(E))_q J lt.eq C (N m^(- 1 \/ 50) + frac(D_A, log m)) . $ <tra:tilted-arrays:eq5>]
  To see it, under independent uniform rows, for integer $z gt.eq z_0 = ceil.l N m^(- 1 \/ 50) ceil.r$,
  $ bb(P) \( J gt.eq z \) lt.eq exp \( - 0.05 z log m \) $
  for large $m$. In fact, to witness the event, in each of the $m$ columns choose the list of symbols having high multiplicity (size at most $2 m^(9 \/ 10)$) and prescribe $z$ cells to take symbols from the lists of their columns. The log number of choices of lists is $O \( N m^(- 1 \/ 10) log m \)$, and cells have log cost at most $z log \( e N \/ z \) lt.eq z \( 0.02 log m + 1 \)$. For a row with $u$ prescribed cells the uniform success probability is bounded by $\( 2 m^(9 \/ 10) \)^u \/ \( m \)_u lt.eq \( 2 e m^(- 1 \/ 10) \)^u$, where subscript denotes falling factorial. (We use $\( m \)_u gt.eq \( m \/ e \)^u$, following e.g. from the factorial bound and prefix geometric means.) These estimates give the probability bound. Applying exponential-moment comparison by relative entropy with parameter $0.02 log m$ now gives (45): log of the uniform exponential moment is at most $0.02 z_0 log m + O \( 1 \)$, whereas $D_A$ bounds parameter times expected $J$ under $q$ minus this log.
  This proves (43), adjusting constants and using, say, a sufficiently small $epsilon in \( 0 \, 1 \/ 50 \)$. The full KL divergence of $q$ relative to $U$ is $D_A + D_B + I$, so (43) implies (42) by entropy variational comparison: the divergence pays $N - C_1 N m^(- epsilon)$ and still pays $alpha$ times the sum of the row and column marginal deficits, against which expected log weights are bounded using $alpha log upright(bold(E)) L_i^(1 \/ alpha)$, $alpha log upright(bold(E)) M_j^(1 \/ alpha)$. More explicitly, for a weight $L_i$, $upright(bold(E))_q log L_i$ minus $alpha$ times marginal deficit is at most the former of these log expressions, and likewise for $M_j$; then take the supremum over $q$ for the left side log of (42). These variational facts follow as usual by nonnegativity of divergence from a tilted law; weights with zeros are allowed by limits or restriction. This completes the grid estimate. ◻
]

=== 7.2 The intermediate singular moment <tra:tilted-arrays:operator-split>

The weighted inequality applies to squared absolute coefficient densities. We now check their norm exponents, so that the child moment bounds produce a weak parent moment with only a factor $1 + O \( 1 \/ d \)$ increase in the exponent.

Take $m = 2^(floor.l d \/ 2 floor.r)$, $n = 2^(ceil.l d \/ 2 ceil.r)$, for $d$ large, and assign positions to an $n$-by-$m$ grid so the bits for the column are the first $floor.l d \/ 2 floor.r$ bits. Write $cal(L)$ for the group of row-preserving permutations, $cal(R)$ for the column-preserving group. On the regular representation,

$ T_N = K_(cal(R)) K_(cal(L)) \, $

where $K_(cal(L))$ uses independent $T_m$ sweeps on the rows and $K_(cal(R))$ uses independent $T_n$ sweeps on the columns. Set $X = K_(cal(L)) K_(cal(L))^(*)$ and $Y = K_(cal(R))^(*) K_(cal(R))$. Thus $T_N^(*) T_N = K_(cal(L))^(*) Y K_(cal(L))$ has the same eigenvalues, including zeros, as $Y^(1 \/ 2) X Y^(1 \/ 2)$.

#thm([Proposition 7.2.])[
  #emph[ Suppose 
$ cal(Z)_m \( u_m \) lt.eq 6 \/ 5 \, #h(2em) cal(Z)_n \( u_n \) lt.eq 6 \/ 5 $

 with $u_m \, u_n gt.eq 2$, and, using $alpha$ from (42), set 
$ macron(r) = \( 2 - alpha \) max \( u_m \, u_n \) \, #h(2em) p = macron(r) \/ 2 . $

 Then for some absolute $eta in \( 0 \, 1 \)$, 
#[#set math.equation(numbering: n => "(46)")
 $ cal(Z)_N \( macron(r) \) lt.eq exp (N^(1 - eta)) . $ <tra:tilted-arrays:eq6>]

]
] <tra:tilted-arrays:recursion>

#proof[
  Lemma 9, with $macron(r) = 2 p gt.eq 2$, gives
  #[#set math.equation(numbering: n => "(47)")
   $ cal(Z)_N \( macron(r) \) lt.eq "Tr" \( X^p Y^p X^p Y^p \) . $ <tra:tilted-arrays:eq7>]
  Within their respective subgroups express $X^p \, Y^p$ by densities $F \, G_1$ on the uniform probability measures (a density here is just a coefficient function, not required to be nonnegative). They are products over rows, respectively columns, of the individual densities for the smaller problems: $F \( l \)$ uses a factor $f \( l_i \)$ for each of the row permutations $l_i$ of $l in cal(L)$, and $G_1 \( r \)$ uses a factor $f_1 \( r_j \)$ for each column permutation of $r in cal(R)$. Here $f$ is for $\( T_m T_m^(*) \)^p$, and $f_1$ for $\( T_n^(*) T_n \)^p$. Both orientations have the child trace moments appearing in the hypothesis. This follows by tensor products and the fact that restriction of the regular action to a subgroup gives copies of its regular action, so these powers in a subgroup convolution algebra simply embed in the full group even when using real positive powers.
  Apply Lemma 10 to each individual density with $a = 2 \/ alpha$ and $a' = 2 \/ \( 2 - alpha \)$. For the row density, the regular Fourier moment on its right is $cal(Z)_m \( p a' \)$, with
  $ p a' = macron(r) \/ \( 2 - alpha \) = max \( u_m \, u_n \) gt.eq u_m . $
  The column calculation uses $cal(Z)_n \( p a' \)$ and $p a' gt.eq u_n$. Since the sweep operators are contractions, we get
  #[#set math.equation(numbering: n => "(48)")
   $ parallel f parallel_(2 \/ alpha) \, med parallel f_1 parallel_(2 \/ alpha) med lt.eq 2 . $ <tra:tilted-arrays:eq8>]
  Use Lemma 14, in its unnormalized form (17), on the positive line factors of $X^p \, Y^p$. It gives
  #[#set math.equation(numbering: n => "(49)")
   $ cal(Z)_N \( macron(r) \) lt.eq frac(\| S_N \|, \| cal(L) \| \| cal(R) \|) bb(E)_(l \, r) #h(-0.16667em) [upright(bold(1))_(r l in cal(L) cal(R)) \| F \( l \) \|^2 \| G_1 \( r \) \|^2] \, $ <tra:tilted-arrays:eq9>]
  where $l \, r$ are independent subgroup uniforms. In the grid between the row move $l$ and the column move $r$, the original-column labels are $A_(i j) = l_i^(- 1) \( j \)$ and the destination-row labels are $B_(i j) = r_j \( i \)$. The event in (49) is exactly that all pairs $\( A_(i j) \, B_(i j) \)$ are distinct. The row weights expressed in these arrays are $\| f \( A_i^(- 1) \) \|^2$, whose uniform norms equal those of $\| f \|^2$; the column weights are $\| f_1 \( B_j \) \|^2$. Thus the weighted estimate (42) and (48) give
  $ log bb(E)_(l \, r) #h(-0.16667em) [upright(bold(1))_(r l in cal(L) cal(R)) \| F \( l \) \|^2 \| G_1 \( r \) \|^2] lt.eq - N + C_1 N m^(- epsilon) + C \( n + m \) . $
  Also $log \[ \| S_N \| \/ \( \| cal(L) \| \| cal(R) \| \) \] lt.eq N + O \( log N \)$ by applying the upper bound $log \( N ! \) lt.eq N log N - N + O \( log N \)$ to the numerator and the lower bounds $log \( m ! \) gt.eq m log m - m$, $log \( n ! \) gt.eq n log n - n$ to the denominator. This one-sided bound is all the recursion needs. This proves (46), taking a sufficiently small fixed positive $eta$ (e.g. less than $epsilon \/ 3$ and $1 \/ 4$), for all sufficiently large $d$. ◻
]

=== 7.3 Unordered bad rows at sparse levels <unordered-bad-rows-at-sparse-levels>

The weak regular moment controls representations of large dimension. The remaining input is an operator bound when the first row is long. We first cancel isolated paths, then estimate the mean of the resulting absolute kernel, and finally control exceptional input rows in every output column.

#thm([Lemma 7.3.])[
  #emph[ Fix $0 < delta < 1$. We need the following bound: if $lambda_1 = N - k$ where $1 lt.eq k lt.eq N^(1 - delta)$, then the operator norm in this representation of $T_N$ is at most 
#[#set math.equation(numbering: n => "(50)")
 $ N^(- b k) $ <tra:tilted-arrays:eq10>]

 for some $b = b \( delta \) > 0$ and $d$ sufficiently large. On the sign twist it is even zero (this latter statement also holds for $k = 0$).]
] <tra:tilted-arrays:sparse>

#proof[
  To prove this, let $cal(X)$ be ordered $k$-tuples of distinct positions, measure $nu$ uniform on $cal(X)$. Functions on $cal(X)$ are acted on by position permutations. The shape $lambda$ occurs here and does not occur in functions of any proper subset of the coordinates. Indeed occurrence on $k$-tuples is having invariants under $S_(N - k)$, by the action on tuples and its stabilizer, and the branching rule says this holds for shapes with first row at least $N - k$. Smaller coordinate subsets would require a larger first row.
  For $S subset.eq \[ k \]$, put $s = \| S \|$, and for $x \, y in cal(X)$ let
  $ R_S \( x \, y \) = N^s thin bb(P) \( g \( x_S \) = y_S \) \, $
  using the pass permutation. The full $R_(\[ k \])$ as an integral kernel against $nu$ represents $T_N^(*)$ on tuple functions (the forward transition kernel is the adjoint under our action convention), up to the factor $N^k \/ \( N \)_k$. Also, in bilinear forms on a copy of $lambda$, the proper subset terms give zero since they only involve those subsets of coordinates. Thus we can bound the desired norm by giving an operator norm bound on
  $ Z_(*) \( x \, y \) = sum_(S subset.eq \[ k \]) \( - 1 \)^(k - \| S \|) R_S \( x \, y \) . $
  A path of a card from one address to another in the $d$-layer pass is unique: at each coordinate it must go to the bit given by its destination address. It occurs with probability $1 \/ N$; it is prescribed by individual switch choices. Make a graph on $\[ k \]$ using $x \, y$, putting an edge whenever the two associated paths use the same switch at some layer (in the same or different directions, including use of the same switch input). If there is an isolated vertex, $Z_(*) = 0$. In fact such a path then imposes switch choices independent of those for any other subset of paths, which gives cancellation in pairs due to the scaling by $N$. Writing $Gamma$ for the event the graph has no isolated vertex, define
  $ W \( x \) = integral sum_S R_S \( x \, y \) upright(bold(1))_Gamma thin d nu \( y \) \, $
  an upper bound on the absolute row integral. We have $W \( x \) lt.eq e^(C k)$, since the row integral of each $R_S$ is $N^s \/ \( N \)_s lt.eq e^s$. Likewise $e^(C k)$ bounds columns using the inverse pass. We will obtain much smaller bounds by controlling typical rows and showing their exceptions cannot concentrate in any column.
  First, for some $gamma = gamma \( delta \) > 0$,
  #[#set math.equation(numbering: n => "(51)")
   $ upright(bold(E))_nu W lt.eq N^(- gamma k) . $ <tra:tilted-arrays:eq11>]
  For $k = 1$ the no-isolated-vertex event is impossible, so take $k gt.eq 2$. In bounding each average over $x \, y$, we can take all $x_i \, y_i$ iid addresses and relax distinctness at cost at most $e^(2 k)$, using the same $R_S$ definition also on repeats. Weighting that iid law by $R_S$ gives a simple sampling rule: sample a full pass network, take all $x_i$ iid, use $y_i = g \( x_i \)$ on $S$, and sample the other $y_i$ iid. Conditional on this network the resulting single-card paths are independent. At each layer the switch used by each such path is uniform among $N \/ 2$ switches: on $S$ this is by uniform start through the fixed network, and outside $S$ by iid start and finish (the address along the path uses respective bits of these). Therefore for any forest on the cards with $u$ edges, the probability its edges are all path interactions is at most $\( 2 d \/ N \)^u$: for a leaf relative to its parent path this bound per edge follows by union over layers, and leaves can be peeled off using independence conditional on network. If $Gamma$ holds, there is a forest with $u$ between $k \/ 2$ and $k - 1$ edges. At each such size there are at most $\( C k \)^u$ to try, by choosing edges. Hence we have upper bound
  $ 2^k e^(2 k) sum_(ceil.l k \/ 2 ceil.r lt.eq u lt.eq k - 1) \( C k d \/ N \)^u $
  for (51), proving the claim for the indicated range of $k$.
  The mean estimate alone does not control a matrix norm: a small collection of input rows might carry a large operator. The next domination estimate rules this out in each fixed output column.
  Next, for any set $cal(B)$ of $x$’s depending only on the unordered set of their entries, we have, for every fixed $y in cal(X)$,
  #[#set math.equation(numbering: n => "(52)")
   $ integral_(cal(B)) R_S \( x \, y \) thin d nu \( x \) lt.eq e^(C k) nu \( cal(B) \) . $ <tra:tilted-arrays:eq12>]
  To see it we can again use iid $x$ at cost at most $e^k$, asking also for distinctness along with $cal(B)$. Weighting by $R_S$ amounts here to setting $x_S = g^(- 1) \( y_S \)$ and sampling remaining $x_i$ iid. Under this inverse network, the set occupied by the $s$ paths satisfies, for each set of sites $T$ at any stage, probability of containing $T$ at most product over $T$ of the current site marginals. Indeed this property holds initially for the deterministic set at $y_S$, and remains true through each fair random transposition, which suffices as these give the layers. For $T$ using one of the switched sites, average the previous bounds with that site exchanged, and for using both, use that product of the two site marginals is bounded by product after averaging the two; other marginals have not changed. At the end the site marginals are $s \/ N$ by the uniform single-position transition. Thus probability for the set of $s$ sites to equal any particular $s$-set is at most $\( s \/ N \)^s$, interpreted as 1 for $s = 0$. For all of $x$ to have as entries a given $k$-set, distinctly, in this law, probability is thus at most
  $ binom(k, s) \( s \/ N \)^s \( k - s \) ! \/ N^(k - s) lt.eq e^k k ! \/ N^k . $
  The probability for that set under $nu$ is $k ! \/ \( N \)_k$, giving (52) as desired.
  Now $W \( x \)$ is unordered-set measurable by simultaneous reindexing of $x \, y$, so the rows with $W > N^(- gamma k \/ 2)$ make a bad set of the kind in (52), having $nu$-probability at most $N^(- gamma k \/ 2)$. For $Z_(*)$ restricted to good rows, its absolute row and column integrals are at most $N^(- gamma k \/ 2) \, e^(C k)$, respectively; on bad rows, bounds $e^(C k) \, e^(C' k) N^(- gamma k \/ 2)$ apply respectively by (52) and $\| Z_(*) \| lt.eq sum_S R_S$. Schur’s operator norm bound (square root of product of row and column bounds) proves (50), decreasing positive constants in exponents as needed. Here in passing to the copy of $lambda$ we indeed multiply the integral kernel by at most 1 to account for the earlier factor $N^k \/ \( N \)_k$.
  Finally if we twist the tuple representation by sign, for $k < N \/ 2$ averaging even one network layer already gives the zero operator. For each tuple there is a switched pair fixing all its positions (i.e. using two unoccupied positions), so the signed subgroup average there cancels. This proves the sign twist claim. ◻
]

=== 7.4 A bounded recursive exponent <a-bounded-recursive-exponent>

#thm([Theorem 7.4.])[
  #emph[ There is a sequence $r \( d \) gt.eq 2$ with $sup_d r \( d \) < oo$ such that 
#[#set math.equation(numbering: n => "(53)")
 $ cal(Z)_N \( r \( d \) \) lt.eq 6 \/ 5 #h(2em) \( d gt.eq 1 \) . $ <tra:tilted-arrays:eq1>]

 For every deterministic initial deck and every integer $w gt.eq sup_d r \( d \)$, the law after $w d$ physical shuffles has chi-square divergence at most $1 \/ 5$ from uniform, and hence total-variation distance at most $1 / 2 sqrt(1 \/ 5)$ from uniform.]
] <tra:tilted-arrays:moment>

#proof[
  The weak moment and the sparse operator bound are independent inputs. We now show that they cover every representation and that the exponent increases at successive splits have a bounded product.
  We spell out which representations are covered by (50) and its sign version, taking $delta = eta \/ 4$ for the $eta$ in (46). Write $D_lambda$ for dimensions. For large $d$, unless
  #[#set math.equation(numbering: n => "(54)")
   $ log D_lambda med gt.eq med N^(1 - eta \/ 2) \, $ <tra:tilted-arrays:eq13>]
  we necessarily have
  #[#set math.equation(numbering: n => "(55)")
   $ k = N - max \( lambda_1 \, lambda_1^(sans(t)) \) med lt.eq med N^(1 - delta) . $ <tra:tilted-arrays:eq14>]
  Here is one way to check. Put $h = max \( lambda_1 \, lambda_1^(sans(t)) \)$, and if $h lt.eq N \/ 10$, the hook-length formula already gives at least $\( 5 \/ e \)^N$ from hooks at most $2 h$. Else we can transpose if needed and take $h$ as the first row length. If there are at least $z = floor.l N^(1 - delta) floor.r$ boxes below the row, take a subdiagram consisting of the row and just $z$ such boxes. The dimension of the original is at least the number of standard fillings of this subdiagram, which is at least $binom(h, z)$. In fact one can fill the first $z$ boxes of the top row first (having $z < h$), then freely interleave its remainder with the lower part in a fixed standard order on that part, since all lower boxes are in columns at most $z$; and fillings extend to the original. This suffices for (54), proving (55) when (54) fails.
  Choose a fixed $r_min gt.eq 2$ with $2 b r_min gt.eq 4$, where $b$ is the sparse constant for $delta = eta \/ 4$. At each level $k$ in (55) there are at most $2^(k + 1)$ shapes, allowing transpose, and each has dimension at most $N^k$. The sign twists are annihilated by the sparse lemma; for the other nonconstant shapes, (50) bounds their regular contribution at every $u gt.eq r_min$ by
  $ sum_(1 lt.eq k lt.eq N^(1 - delta)) 2^(k + 1) N^(2 k - 2 b k u) = o \( 1 \) . $
  The sign representation itself also contributes zero. These are the first class in Lemma 19, with $epsilon = 1 \/ 5$; their contribution is at most $1 \/ 10$ above an absolute threshold.
  The remaining class satisfies (54). Use the positive-square convention $nu = 2$ and set
  $ E_N = N^(1 - eta) \, #h(2em) H_N = N^(1 - eta \/ 2) \, #h(2em) alpha_d = 2 - alpha \, #h(2em) delta_d = d^(- 1 \/ 2) . $
  Proposition 30 supplies its child-to-parent hypothesis uniformly for inherited exponents at least $r_min$. The decisive comparison is
  $ \( 1 + delta_d \) E_N - delta_d H_N = \( 1 + d^(- 1 \/ 2) \) N^(1 - eta) - d^(- 1 \/ 2) N^(1 - eta \/ 2) arrow.r - oo . $
  Also $\( 2 - alpha \) \( 1 + d^(- 1 \/ 2) \) = 1 + O \( d^(- 1 \/ 2) \)$. The common lemma therefore supplies bounded recursive exponents $r \( d \)$ satisfying (53), including the finite initial sizes.  Its positive-square convention means the matching singular exponent is $2 sup_d r \( d \)$. Proposition 16 gives chi-square divergence at most $1 \/ 5$ after every integer $w gt.eq sup_d r \( d \)$ of forward sweeps, uniformly over initial decks. Since each sweep is $d$ physical shuffles, the stated total-variation bound follows. ◻
]

== 8 Fractional densities and a harmonic infinity bound <tra:fractional-density>

This section gives an alternative proof of the balanced compatibility bound using fractional integrability and a softened survival potential. Theorem 1 already implies the compatibility estimate below for sufficiently large sizes. The proof here obtains its coefficient integrability by spectral bins, without inverse Hausdorff–Young, and carries that bound through the entropy exposure. Its separate sparse result is an infinity-norm estimate on harmonic tuples, with an explicit constant and the full range $k lt.eq n \/ \( 2 d \)$.

One sweep is $d$ physical shuffles. All regular traces are unnormalized. We use $T_n$ and $Q_n = T_n^(*) T_n$ as in Section 2.

We will use the left regular representation of $S_n$. For a finite group $G$ in general, write $cal(L) \( g \)$ for the left regular operators. We identify group algebra elements with operators in this representation, calling $f$ the density of $Z$ if

$ Z = frac(1, \| G \|) sum_(g in G) f \( g \) cal(L) \( g \) $

(where $f$ need not be a probability density). With ordinary, #emph[unnormalized] trace, we have

#[#set math.equation(numbering: n => "(56)")
 $ f \( g \) = "Tr" cal(L) \( g^(- 1) \) Z \, #h(2em) bb(E)_(g med upright(u n i f .)) \| f \( g \) \|^2 = "Tr" \( Z^(*) Z \) . $ <tra:fractional-density:eq1>]

For $S_n$, let $Pi_i$ be the average operator for the random swap layer at bit $i$. This is an orthogonal projection, since it averages over the subgroup generated by all the disjoint transpositions in the layer. Set

$ T_n = Pi_d dots.h.c Pi_1 \, #h(2em) Q_n = T_n^(*) T_n \, #h(2em) M_n \( p \) = "Tr" \( Q_n^p \) quad \( p > 0 \) . $

We have $0 lt.eq Q_n lt.eq I$, and $M_n \( p \) gt.eq 1$ by the constants. We use the notation $T_n \, Q_n \, M_n$ also with other powers of two as the size (using that size’s own scan).

For later comparison, a positive integer $L$ satisfies

#[#set math.equation(numbering: n => "(57)")
 $ n ! sum_g Pr \( g med upright("is the movement in ") L med upright("scans") \)^2 = "Tr" #scale(x: 120%, y: 120%)[\(] \( T_n^L \)^(*) T_n^L #scale(x: 120%, y: 120%)[\)] med lt.eq med M_n \( L \) . $ <tra:fractional-density:eq3>]

The inequality is Schatten Hölder, as used in Proposition 16. A positive-square moment of order $p$ is a singular moment of order $2 p$, so $M_n \( p \) lt.eq 1 + 1 \/ 8$ supplies Proposition 16 with singular exponent $2 p$ and remainder $1 \/ 8$.

The positive-power comparison, Lemma 9, with $P = 4 r$ and $q = 4$, also gives the form used below:

#[#set math.equation(numbering: n => "(58)")
 $ "Tr" \( B^(1 \/ 2) A B^(1 \/ 2) \)^(2 r) lt.eq "Tr" \( A^r B^r A^r B^r \) #h(2em) \( A \, B gt.eq 0 \, med r gt.eq 1 \) . $ <tra:fractional-density:eq4>]

=== 8.1 The induction step and rough moment <tra:fractional-density:induction-budgets>

All logarithms in the proof below are natural logs. Fix the constants

$ alpha = 1 / 64 \, #h(2em) beta = 1 / 256 \, #h(2em) c_0 = 1 / 8 \, $

and let

$ a = 2^(ceil.l d \/ 2 ceil.r) \, #h(2em) b = 2^(floor.l d \/ 2 floor.r) \, #h(2em) n = a b \, #h(2em) delta = d^(- 1 \/ 2) . $

#thm([Proposition 8.1.])[
  #emph[]
  #emph[ For all sufficiently large $d$, if a real $q gt.eq 16 \/ beta$ satisfies 
#[#set math.equation(numbering: n => "(59)")
 $ M_b \( q \) \, M_a \( q \) med lt.eq med 1 + c_0 \, $ <tra:fractional-density:eq5>]

 then $p_0 = \( 1 + delta \) q$ satisfies 
#[#set math.equation(numbering: n => "(60)")
 $ M_n \( \( 1 + delta \) p_0 \) lt.eq 1 + c_0 $ <tra:fractional-density:eq6>]

 and 
#[#set math.equation(numbering: n => "(61)")
 $ M_n \( p_0 \) lt.eq exp \( n^(1 - alpha) \) . $ <tra:fractional-density:eq7>]

 The lower threshold for $d$ is absolute and independent of $q$.]
] <tra:fractional-density:step>

We first prove the rough estimate (61) by splitting the array. Its sublinear exponent will control the large-dimensional representations in (60); small levels will be bounded directly on tuples of positions.

#strong[Rough bound via a balanced split.] View positions as an $\[ a \]$-by-$\[ b \]$ array with row index made from the last $ceil.l d \/ 2 ceil.r$ bits and column index from the first $floor.l d \/ 2 floor.r$ bits (using $\[ m \] = { 1 \, dots.h \, m }$). The scan first operates by horizontal permutations in

$ H = \( S_b \)^a $

and then by vertical permutations in

$ V = \( S_a \)^b $

where these are the subgroups preserving each row and each column, respectively. In fact the first part of the scan just does independent size-$b$ scans, one in each row, and then the second part does independent size-$a$ scans, one in each column. Write the average operators of those two parts as $K_H \, K_V$, so $T_n = K_V K_H$. Set

$ A = K_H K_H^(*) \, #h(2em) B = K_V^(*) K_V \, #h(2em) r = p_0 \/ 2 . $

Since $Q_n = K_H^(*) B K_H$, it has the same eigenvalues as $B^(1 \/ 2) A B^(1 \/ 2)$. Thus (58) gives

#[#set math.equation(numbering: n => "(62)")
 $ M_n \( p_0 \) lt.eq "Tr" \( A^r B^r A^r B^r \) . $ <tra:fractional-density:eq8>]

The line factors of $A^r$ and $B^r$ are $\( T_b T_b^(*) \)^r$ and $\( T_a^(*) T_a \)^r$, respectively. Let their coefficient densities be $f_R \, f_D$. Their squared masses are $M_b \( p_0 \) \, M_a \( p_0 \)$, both in $\[ 1 \, 2 \]$ by (59) and $p_0 gt.eq q$.

For $h = \( h_i \) in H$ and $v = \( v_j \) in V$, the entropy exposure uses arrays

$ X_(i j) = h_i \( j \) in \[ b \] \, #h(2em) Y_(i j) = v_j^(- 1) \( i \) in \[ a \] \, #h(2em) cal(E) = { \( X_(i j) \, Y_(i j) \) upright(" are all distinct") } . $

This is the domain $h v in V H$ in the proof of Lemma 14: at the intermediate cell $\( i \, j \)$, after $v$ and before $h$, the input row is $Y_(i j)$ and the output column is $X_(i j)$. Opposite-order routing is possible exactly when each input row sends one card to each output column. Define the product probability law $nu$ on these arrays by the independent line densities

$ rho_R \( x \) = frac(\| f_R \( x \) \|^2, M_b \( p_0 \)) \, #h(2em) rho_D \( y \) = frac(\| f_D \( y^(- 1) \) \|^2, M_a \( p_0 \)) . $

The same lemma, using the equivalent $h v in V H$ form of its four-factor calculation, gives

#[#set math.equation(numbering: n => "(63)")
 $ M_n \( p_0 \) lt.eq frac(n !, \| H \| \| V \|) M_b \( p_0 \)^a M_a \( p_0 \)^b thin nu \( cal(E) \) . $ <tra:fractional-density:eq10>]

We estimate the last probability, keeping the estimate robust under the density changes in $nu$.

First consider a single row or column law $nu_(*)$ in this product, on $S_m$ with $m = b$ or $a$. For the row case let $T = \( T_m T_m^(*) \)^q$; for the column case let $T = \( T_m^(*) T_m \)^q$. By hypothesis $0 lt.eq T lt.eq I$ and $"Tr" T lt.eq 2$ in the regular representation for this $m$. We deal with the density of $F = T^(\( 1 + delta \) \/ 2)$, evaluated on permutations for the row case and on their inverses for the column case. Divide the positive eigenvalues of $T$ into intervals

$ \( e^(- l - 1) \, e^(- l) \] #h(2em) \( l = 0 \, 1 \, dots.h \) \, $

and correspondingly write $F = sum_l F_l$ using spectral parts (only finitely many nonzero). Then

$ "Tr" F_l lt.eq 2 e^(\( 1 - delta \) \( l + 1 \) \/ 2) \, #h(2em) "Tr" F_l^2 lt.eq 2 e^(- delta l) . $

Write $f_l$ for the associated density (evaluated on inverses in the column case). By (56),

$ parallel f_l parallel_oo lt.eq "Tr" F_l lt.eq 2 e^(\( l + 1 \) \/ 2) \, #h(2em) parallel f_l parallel_2^2 lt.eq 2 e^(- delta l) \, $

where the first inequality follows because $F_l$ is positive semidefinite and the $cal(L) \( g \)$ are unitary. Norms for functions here are with uniform measure. Thus

$ parallel f_l parallel_(2 + delta)^(2 + delta) lt.eq C e^(- delta l \/ 2) $

for an absolute $C$, taking $d$ large so $0 < delta lt.eq 1$. Adding the norms gives

$ ∥sum_l f_l∥_(2 + delta) lt.eq C' \/ delta $

by summing a geometric series, with $C'$ absolute. Therefore the density $rho$ of $nu_(*)$, which equals the square modulus of $sum_l f_l$ divided by a number at least 1, satisfies

#[#set math.equation(numbering: n => "(64)")
 $ bb(E)_(U_m) rho^(1 + delta \/ 2) lt.eq \( C' \/ delta \)^(2 + delta) $ <tra:fractional-density:eq11>]

where $U_m$ denotes uniform on $S_m$.

We use relative entropy $D \( P parallel R \) = bb(E)_P log \( P \/ R \)$ for probability laws, infinite if $P$ is not supported on the support of $R$. From (64), with

$ epsilon.alt = frac(delta, 2 + delta) \, $

any law $mu$ on $S_m$ satisfies

#[#set math.equation(numbering: n => "(65)")
 $ D \( mu parallel nu_(*) \) med gt.eq med epsilon.alt D \( mu parallel U_m \) - O \( log d \) . $ <tra:fractional-density:eq12>]

In fact we use the elementary variational inequality

#[#set math.equation(numbering: n => "(66)")
 $ D \( P parallel R \) med gt.eq med bb(E)_P W - log bb(E)_R e^W $ <tra:fractional-density:eq13>]

for potentials $W$ (also allowing $- oo$ on points outside the support of $P$ with the exponential expectation positive). This follows by changing the reference measure by the exponential tilt and using nonnegativity of relative entropy. In (65), assuming finite divergence, apply (66) with $P = mu$, $R = U_m$, and $W = \( 1 + delta \/ 2 \) log rho$, and use $D \( mu parallel nu_(*) \) = D \( mu parallel U_m \) - bb(E)_mu log rho$. This gives (65) because of (64) and $delta = d^(- 1 \/ 2)$.

#thm([Lemma 8.2.])[
  #emph[]
  #emph[ The compatibility probability satisfies 
#[#set math.equation(numbering: n => "(67)")
 $ nu \( cal(E) \) med lt.eq med exp (- n + O (n a^(- 1 \/ 16) log a + \( a + b \) log d)) . $ <tra:fractional-density:eq14>]

]
] <tra:fractional-density:compatibility>

#proof[
  Consider any law $zeta$ on arrays supported on $cal(E)$, assuming $D \( zeta parallel nu \) < oo$. Write $X_i = X_(i \, dot.op)$ for the row permutations and $Y_j = Y_(dot.op \, j)$ for the column permutations (using single subscripts for these permutations). We use $zeta_X \, zeta_(X_i) \, zeta_(Y_j)$, etc., for the laws of parts of the arrays under $zeta$. Put
  $ D_X = D \( zeta_X parallel U_b^(⊗ a) \) \, #h(2em) D_Y = sum_(j in \[ b \]) D \( zeta_(Y_j) parallel U_a \) \, #h(2em) J = bb(E)_(X tilde.op zeta_X) D #scale(x: 180%, y: 180%)[\(] zeta_(Y divides X) med parallel med ⨂_(j in \[ b \]) zeta_(Y_j) #scale(x: 180%, y: 180%)[\)] . $
  By (65),
  #[#set math.equation(numbering: n => "(68)")
   $ D \( zeta parallel nu \) med gt.eq med J + epsilon.alt \( D_X + D_Y \) - O \( \( a + b \) log d \) . $ <tra:fractional-density:eq15>]
  Indeed, decomposing the joint divergence against the product law $nu$, we get $J$, plus $D \( zeta_X parallel ⨂_i nu_(X_i) \)$, plus the divergences of the $zeta_(Y_j)$ against their individual laws in $nu$. For the $X$ term, decompose further into $D \( zeta_X parallel ⨂_i zeta_(X_i) \)$ and the sum of individual marginal divergences. Applying (65) to the individual divergences and keeping at least an $epsilon.alt$ fraction of $D \( zeta_X parallel ⨂_i zeta_(X_i) \) gt.eq 0$ gives (68).
  To lower bound $J$, consider drawing the arrays from $zeta$, with $X$ revealed first. Take independent uniform priorities $t_j in \[ 0 \, 1 \]$, independent also of the arrays, and expose $Y$ column by column, in order of #emph[decreasing] $t_j$. Within each column reveal its entries in increasing order of $i$. For any fixed priorities (ignoring null events of ties), the chain formula for relative entropy gives $J$ as a sum of expected conditional divergences, one per cell $\( i \, j \)$. In that cell the divergence is between:
  - the conditional distribution of $Y_(i j)$ under $zeta$, given $X$, earlier columns, and earlier entries in column $j$;
  - the law $u$ with
  $ u_y = zeta_(Y_j) \( Y_(i j) = y divides Y_(1 j) \, dots.h \, Y_(i - 1 \, j) \) \, #h(2em) y in \[ a \] . $
  The second (reference) law depends just on previous entries in the #emph[same] column. Though we suppress its cell and history indices on $u \, u_y$, we always take conditionals at histories arising under $zeta$. Since we know $X$, the first distribution is supported on candidates that are not #emph[blocked], where $y$ is blocked if $\( X_(i j) \, y \)$ has already occurred as a pair in an earlier column.
  Put
  $ g \( j \, x \) = \| { i' : X_(i' j) = x } \| . $
  Call the cell bad if $g \( j \, X_(i j) \) > a^(1 \/ 8)$, good otherwise. Call a candidate $y$ high if $u_y > a^(- 1 \/ 4)$, low otherwise. Let $R_X$ count bad cells, and $R_Y$ cells whose actual $Y_(i j)$ is high. These counts depend on the outcome arrays (and law $zeta$ for defining high), but not the priorities.
  For a good cell in the chain formula, apply (66) to the conditional divergence, using $eta = a^(- 1 \/ 16)$ and this potential:
  $ W \( y \) = cases(delim: "{", 0 \, & y med upright("high") \,, - oo \, & y med upright("low and blocked") \,, - log \( t_j + eta \) \, & y med upright("low and not blocked") .) $
  On bad cells just take $W \( y \) = 0$. These choices depend only on what is given before the cell, besides the priorities and the law. The actual choice under $zeta$ is not blocked and has $u_y > 0$ almost surely, so the reference normalization in (66) is positive as needed.
  For the log normalization term of (66), condition now on the entire outcome arrays $\( X \, Y \)$ and on $t_j$, and average over the other priorities. Assume the cell is good and write $x = X_(i j)$. For each $y$, including each low candidate, the pair $\( x \, y \)$ occurs exactly once in the outcome arrays, since $cal(E)$ holds and there are $a b$ cells. If its occurrence is in another column, the probability the candidate is not blocked is $t_j$, since the priority of that column is uniform independent. The candidates occurring in the current column with $x$ number at most $g \( j \, x \)$, so the total $u$ mass of those among them which are low is at most $a^(1 \/ 8) a^(- 1 \/ 4)$. Writing $Z = sum_y u_y e^(W \( y \))$, this gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] Z divides X \, Y \, t_j #scale(x: 120%, y: 120%)[\]] med lt.eq med sum_(y med upright("high")) u_y + frac(t_j, t_j + eta) sum_(y med upright("low")) u_y + frac(a^(1 \/ 8) a^(- 1 \/ 4), eta) med lt.eq med 1 + a^(- 1 \/ 16) . $
  This computation uses that $u$ is fixed in this conditioning, as the within-column order is fixed. On a bad cell $Z = 1$. We get in particular $bb(E) log Z lt.eq a^(- 1 \/ 16)$ by Jensen’s inequality.
  For the expected-potential term in (66), averaging over histories under $zeta$ amounts to using the actual score $W \( Y_(i j) \)$. For each good cell whose actual choice is low, since good/low status for the actual choice is independent of the priorities, its score with the priorities averaged is
  $ integral_0^1 - log \( t + eta \) thin d t = 1 - \( 1 + eta \) log \( 1 + eta \) + eta log eta = 1 - O \( a^(- 1 \/ 16) log a \) \, $
  and it is 0 on the other cells. The displayed integral lies between 0 and 1 for sufficiently large $a$. Since the chain formula for $J$ holds for each fixed priority vector with distinct entries, averaging our lower bounds over priorities and summing all cells gives
  #[#set math.equation(numbering: n => "(69)")
   $ J med gt.eq med n - bb(E)_zeta \[ R_X + R_Y \] - O \( n a^(- 1 \/ 16) log a \) . $ <tra:fractional-density:eq16>]
  The counts lost in (69) can be paid for by the deficits $D_X \, D_Y$. First, for $D_Y$, use its chain formula for the marginal column laws against uniform permutations, within each column in increasing $i$. While the number remaining to be revealed in the column (including the current cell) is at least $sqrt(a)$, the high subset has uniform conditional probability at most $a^(- 1 \/ 4)$, since it has size at most $a^(1 \/ 4)$. Use (66) with potential $\( log a \) \/ 8$ on the high subset and 0 outside, to see that the conditional divergence at this cell, from $u$ against the uniform choice among those remaining, is at least
  $ frac(log a, 8) sum_(y med upright("high")) u_y - a^(- 1 \/ 8) . $
  Skipping fewer than $sqrt(a)$ cells at the end of each column (their conditional divergences are nonnegative), taking marginal expectations, and summing gives
  #[#set math.equation(numbering: n => "(70)")
   $ D_Y med gt.eq med frac(log a, 8) #scale(x: 120%, y: 120%)[\(] bb(E)_zeta R_Y - n a^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] - n a^(- 1 \/ 8) . $ <tra:fractional-density:eq17>]
  For $D_X$, we claim for large $a$,
  #[#set math.equation(numbering: n => "(71)")
   $ D_X med gt.eq med frac(log a, 16) bb(E)_zeta R_X - 1 . $ <tra:fractional-density:eq18>]
  To verify this let $gamma = \( log a \) \/ 16$ and $h_0 = a^(1 \/ 8)$. Under $U_b^(⊗ a)$, the reference law for $D_X$, the probability of any specification of $z$ different cells to prescribed values in $X$ is at most $\( e \/ b \)^z$. For a compatible specification this follows row by row because for $z_i$ cells in one row its probability is $1 \/ \( b \( b - 1 \) dots.h.c \( b - z_i + 1 \) \)$, at most $\( e \/ b \)^(z_i)$ by $b ! gt.eq \( b \/ e \)^b$ (the geometric mean in the descending product for the row is at least that from $b !$). Incompatible specifications have probability zero. Also,
  $ e^(gamma R_X) = product_(j \, x in \[ b \]) (1 + #scale(x: 120%, y: 120%)[\(] e^(gamma g \( j \, x \)) - 1 #scale(x: 120%, y: 120%)[\)] upright(bold(1))_({ g \( j \, x \) > h_0 })) . $
  To bound its expectation, expand this product. For each selected $\( j \, x \)$ with $g \( j \, x \) = s > h_0$, bound by specifying $s$ rows having $X_(i j) = x$, summing over the choices and using factor $e^(gamma s)$ (for the probability bound we do not need to require that there are no further matching entries). In a term with several selected $\( j \, x \)$, if the specifications conflict they have probability zero, and otherwise they require distinct cells. Thus
  $ bb(E)_(U_b^(⊗ a)) e^(gamma R_X) lt.eq (1 + sum_(s > h_0) binom(a, s) \( a^(1 \/ 16) e \/ b \)^s)^(b^2) lt.eq e $
  for all sufficiently large $a$. Indeed the sum inside is at most $sum_(a gt.eq s > h_0) \( 2 e^2 a^(1 \/ 16) \/ s \)^s$ using $a \/ b lt.eq 2$; this goes to zero faster than any inverse power of $a$. Applying (66) proves (71).
  Since $epsilon.alt log a$ tends to infinity, (70)-(71) in (68) absorb the terms $bb(E)_zeta \[ R_X + R_Y \]$ from (69). We conclude
  $ D \( zeta parallel nu \) med gt.eq med n - O (n a^(- 1 \/ 16) log a + \( a + b \) log d) . $
  Taking $zeta = nu \( dot.op divides cal(E) \)$ when $nu \( cal(E) \) > 0$, this proves (67). ◻
]

===== 8.1.1 Completion of the rough moment estimate. <completion-of-the-rough-moment-estimate.>

Stirling’s formula gives

$ log frac(n !, \| H \| \| V \|) = log n ! - a log \( b ! \) - b log \( a ! \) = n + O \( \( a + b \) log n \) . $

Hence (63), (67), and $M_b \( p_0 \) \, M_a \( p_0 \) lt.eq 2$ bound $M_n \( p_0 \)$ by the exponential of at most $O \( n^(31 \/ 32) log n \)$, using $a \, b = Theta \( sqrt(n) \)$. This proves (61) for all sufficiently large $d$.

=== 8.2 An infinity estimate on harmonic tuples <an-infinity-estimate-on-harmonic-tuples>

#thm([Proposition 8.3.])[
  #emph[]
  #emph[ Let $n = 2^d$ with $d gt.eq 1$, let $T_n$ be one coordinate sweep, and put $Q_n = T_n^(*) T_n$. Take $1 lt.eq k lt.eq n \/ \( 2 d \)$ and consider the representation on functions on ordered injective $k$-tuples of positions, with $g in S_n$ acting by 
$ \( pi_k \( g \) F \) \( v \) = F \( g^(- 1) v \) $

 where the notation on $v$ acts on all its positions. Write $pi_k$ also for the corresponding action of group algebra elements. Call a function harmonic here if the sum in any one coordinate with the others fixed is 0 (taking the sum over the remaining available positions for that coordinate). The space of these functions is invariant under the permutation actions. We claim an infinity norm bound on this space: 
#[#set math.equation(numbering: n => "(72)")
 $ parallel pi_k \( Q_n \) F parallel_oo med lt.eq med (frac(C_(*) d k, n))^(k \/ 2) parallel F parallel_oo #h(2em) \( F med upright("harmonic") \) $ <tra:fractional-density:eq19>]

 with $C_(*) = 2 \( 4 e \)^2$.]
] <tra:fractional-density:harmonic>

#proof[
  In fact $\( pi_k \( Q_n \) F \) \( v \)$ is the expectation of $F$ on the tuple after moving $v$ through a scan and then an independent reverse scan (layers in reverse order). This follows from $Q_n = T_n^(*) T_n$ and the representation action. Start the tuple at $v$ and let its ordered midpoint tuple between the scans be $w$. For any set $D$ of $k$ positions, we have
  #[#set math.equation(numbering: n => "(73)")
   $ Pr \( { w_1 \, dots.h \, w_k } = D \) lt.eq \( k \/ n \)^k . $ <tra:fractional-density:eq20>]
  To see this, during the first scan consider just the occupied set of the $k$ labels. At any point its law, with occupancy marginal probabilities $p_x$ on positions, satisfies the bound $Pr \( D' med upright("all occupied") \) lt.eq product_(x in D') p_x$ for any subset $D'$. This holds initially, and is preserved through any one independent fair pair swap: the marginals of the two positions are replaced by their average. For a subset containing exactly one of these positions, averaging the two previous bounds gives the new bound; for a subset containing both, the probability stays the same and the product bound can only increase; for subsets containing neither there is no change. We can apply this through the sequence of all individual swaps. At the midpoint each card separately is uniform on the positions, since in its path each bit has been randomized with a fresh fair choice. Therefore $p_x = k \/ n$ for the occupancy marginals, giving (73).
  Condition on $w$. Index the $k$ labels in the tuple by $\[ k \]$. For $S subset.eq \[ k \]$, consider a law $cal(P)_(S \, w)$ of $k$ paths in the second (reverse) scan with the following dynamics:
  - the labels in $S$ follow a common reverse scan with its random switches;
  - every other label (omitted from $S$) just follows a path using its own independent choices to stay or swap in the scheduled bit at each stage.
  We allow the path positions under these laws not to form injective tuples across all the labels; extend $F$ by 0 on noninjective tuples. For $S eq.not \[ k \]$, the expectation of $F$ at the endpoint under $cal(P)_(S \, w)$ is 0. Indeed any omitted label has a uniform final position independent of the others. If the other final positions are distinct we use harmonicity and the extension by 0, and if not, $F$ is already 0. Thus applying the signed sum of path laws
  #[#set math.equation(numbering: n => "(74)")
   $ sum_(S subset.eq \[ k \]) \( - 1 \)^(k - \| S \|) cal(P)_(S \, w) $ <tra:fractional-density:eq21>]
  to $F$ at the endpoint gives the same expectation as the true second scan.
  For any tuple of paths in these laws consider its encounter graph on $\[ k \]$, joining two labels if they enter the same switch in some stage (possibly at the same position). The signed sum (74) vanishes on any path tuple whose encounter graph has an isolated vertex. In fact if a vertex is isolated, toggling it in or out of $S$ doesn’t change the path tuple probability. To realize fixed paths in the common switches just requires the corresponding values of the switch coins, with probability zero in case of conflict. The isolated path uses $d$ switches disjoint from those of any other paths (indexing switches by stage as well as pair), so it imposes its values independently, with probability $2^(- d)$, just as if using its own omitted-label choices. This proves the cancellation.
  Consequently the absolute conditional endpoint expectation in the true second scan is at most $parallel F parallel_oo G \( w \)$, where
  $ G \( w \) = sum_(S subset.eq \[ k \]) cal(P)_(S \, w) \( upright("encounter graph has no isolated vertex") \) . $
  The function $G \( w \)$ is symmetric under reordering $w$: all choices of $S$ are summed and the dynamics and condition correspond under renaming labels. Therefore (73) gives
  #[#set math.equation(numbering: n => "(75)")
   $ bb(E) G \( w \) lt.eq frac(\( k \/ n \)^k, k !) sum_(w med upright("injective ordered")) G \( w \) . $ <tra:fractional-density:eq22>]
  To bound the last sum, fix $S$ and fix its entire set of common switch coins and the separate stay/swap choice coins for omitted labels, using the same coins simultaneously for any starting $w$. For each individual label, the map from its own starting position to its position entering any given stage is then a permutation of the $n$ positions. This is true for a label in $S$ by the common switch layers; for any other label the fixed choices apply bit flips or not, also giving permutations. For these coins, count the starting $w$’s whose encounter graph has no isolated vertex. Each such graph contains a spanning forest with $c lt.eq k \/ 2$ components each of size at least 2; take a root in each component. (If $k = 1$ there are no such graphs.) For given $c$, the number of rooted forests involved is at most $binom(k, c) k^(k - c)$, by choosing roots and parents. For a fixed forest, the starting positions of its roots can be chosen in at most $n^c$ ways. For every other vertex, once the parent’s starting position has been chosen, there are at most $2 d$ choices, since at some stage the child’s path must enter the switch that the parent enters. At a given stage there are at most two choices of the child’s starting position by the permutation property. Hence the number of $w$’s satisfying all the encounters of this forest is at most $n^c \( 2 d \)^(k - c)$, not even needing to enforce injectivity in this bound. Using this count and averaging over coins for each $S$, (75) implies
  $ bb(E) G \( w \) & lt.eq frac(\( k \/ n \)^k, k !) thin 2^k sum_(1 lt.eq c lt.eq k \/ 2) binom(k, c) \( 2 d k \)^(k - c) n^c\
 & lt.eq \( 2 e \)^k sum_(1 lt.eq c lt.eq k \/ 2) binom(k, c) \( 2 d k \/ n \)^(k - c) med lt.eq med (frac(C_(*) d k, n))^(k \/ 2) . $
  In the last inequality we used $2 d k \/ n lt.eq 1$ and can take $C_(*) = 2 \( 4 e \)^2$. This establishes (72). ◻
]

#thm([Corollary 8.4.])[
  (Singular values at a first-row level).  #emph[Let $lambda tack.r n$ have first row $n - k$, where $1 lt.eq k lt.eq n \/ \( 2 d \)$. Then 
$ parallel Q_n \( lambda \) parallel_(upright("op")) lt.eq (frac(2 \( 4 e \)^2 d k, n))^(k \/ 2) \, #h(2em) parallel T_n \( lambda \) parallel_(upright("op")) lt.eq (frac(2 \( 4 e \)^2 d k, n))^(k \/ 4) . $

]
] <e:harmonic-singular-conversion>

#proof[
  The ordered $k$-tuple module is induced from the trivial representation of $S_(n - k)$. Branching and Frobenius reciprocity show that $V_lambda$ occurs in it, by removing the $k$ boxes below the first row. It does not occur in any $\( k - 1 \)$-tuple module: every diagram there has first row at least $n - k + 1$. The span of functions lifted by omitting one coordinate therefore has no $lambda$-isotypic component. Its orthogonal complement is exactly the harmonic space, because orthogonality to every such lift means that each coordinate sum vanishes.
  The operator $Q_n \( lambda \)$ is positive. Every eigenvector in a copy of $V_lambda$ inside the harmonic space satisfies the infinity-norm bound of Proposition 8.3; dividing by its nonzero infinity norm bounds its eigenvalue. This proves the first inequality. The second follows from $Q_n \( lambda \) = T_n \( lambda \)^(*) T_n \( lambda \)$. ◻
]

=== 8.3 Closing the trace recursion <closing-the-trace-recursion>

#proof[
  Put $s = floor.l n^(1 - beta) floor.r$. For large $d$, $s < n \/ \( 2 d \)$, so Corollary 36 applies to all first-row levels $1 lt.eq k lt.eq s$. Its positive-eigenvalue bound is
  #[#set math.equation(numbering: n => "(76)")
   $ \( C_(*) d k \/ n \)^(k \/ 2) lt.eq n^(- beta k \/ 4) \, $ <tra:fractional-density:eq23>]
  since $k \/ n lt.eq n^(- beta)$. There are at most $2^k$ shapes of level $k$, each of dimension $r_lambda lt.eq n^k$. Thus their complete regular contribution at any $p gt.eq 16 \/ beta$ is at most
  #[#set math.equation(numbering: n => "(77)")
   $ sum_(1 lt.eq k lt.eq s) 2^k n^(2 k - p beta k \/ 4) = o \( 1 \) . $ <tra:fractional-density:eq24>]
  This uses the bound at the smallest allowed $p$, so the size threshold is uniform over the inherited exponent.
  A matching layer annihilates every shape with more than $n \/ 2$ rows, as in the proof of Theorem 2. In particular all shapes with $n - lambda'_1 lt.eq s$ vanish, since $n - s > n \/ 2$ for sufficiently large $n$.
  Treat the one-row shape separately: it is the trivial representation and contributes 1 to $M_n \( p \)$. All shapes not handled so far have
  $ n - lambda_1 > s \, #h(2em) n - lambda'_1 > s . $
  For them we have
  #[#set math.equation(numbering: n => "(78)")
   $ r_lambda gt.eq exp \( c s \) $ <tra:fractional-density:eq25>]
  for some absolute $c > 0$ when $d$ is sufficiently large. For if $lambda_1 gt.eq s$, we can find a subdiagram consisting of a first row of length $s$ and $s$ more boxes below it forming a tail partition (as there are at least $s$ boxes available below, taking a subpartition of size $s$, of width necessarily at most $s$). The number of standard tableaux of this subdiagram is at least the Catalan number $frac(1, s + 1) binom(2 s, s)$. Indeed interleave filling the top row and filling the $s$-box tail in the order of any fixed standard tableau on the tail, keeping the number of filled top row boxes always at least the number of filled tail boxes. This ballot condition ensures any tail box being filled already has the required top-row box above in its column (the column index is at most the number reached in filling the tail). Each resulting tableau extends to the original shape by filling the rest after the subdiagram. This proves (78) in the case considered; the case $lambda'_1 gt.eq s$ follows as well by transposing. If both lengths are smaller than $s$, then every hook length is at most $2 s$, so
  $ r_lambda gt.eq n ! \/ \( 2 s \)^n \, $
  which also gives (78) for large enough $d$, since $n \/ \( 2 s \)$ tends to infinity.
  Apply the one-step estimate of Lemma 19 with the positive-square convention $nu = 2$, remainder $epsilon = 1 \/ 8$, low-level baseline $P = 16 \/ beta$, and
  $ E_n = n^(1 - alpha) \, #h(2em) H_n = c s \, #h(2em) alpha_d = 1 + d^(- 1 \/ 2) \, #h(2em) delta_d = d^(- 1 \/ 2) . $
  Here (61) is the rough child-to-parent bound, (77) makes the low-level remainder at most $1 \/ 16$, and (78) provides the regular multiplicity of every remaining block. The large-block remainder is bounded by
  $ exp { \( 1 + d^(- 1 \/ 2) \) n^(1 - alpha) - c d^(- 1 \/ 2) floor.l n^(1 - beta) floor.r } = o \( 1 \) \, $
  because $beta < alpha$. It is therefore at most $1 \/ 16$ above an absolute threshold independent of $q$. Adding the constant contribution proves (60). ◻
]

#thm([Theorem 8.5.])[
  #emph[]
  #emph[ There are numbers $p \( d \) > 0$, with $sup_d p \( d \) < oo$, such that for every $n = 2^d$, 
#[#set math.equation(numbering: n => "(79)")
 $ M_n \( p \( d \) \) lt.eq 1 + c_0 \, #h(2em) c_0 = 1 / 8 . $ <tra:fractional-density:eq2>]

]
] <tra:fractional-density:moment>

#proof[
  The application of Lemma 19 just verified has exponent multiplier $\( 1 + d^(- 1 \/ 2) \)^2 = 1 + O \( d^(- 1 \/ 2) \)$. The lemma supplies the common finite base and bounds the product of these multipliers over rounded halvings. It therefore gives the asserted bounded sequence $p \( d \)$. Proposition 16 applies with singular exponent $2 sup_d p \( d \)$ and remainder $1 \/ 8$. ◻
]

== 9 Asymmetric grids and integrated spectral projections <tra:asymmetric>

All the preceding grids have comparable side lengths. We now change the aspect ratio itself. Short cycles in the resulting array and fixed-size coordinate chunks supply estimates adapted to unequal child scales.

A split into a short coordinate block and a long block produces a different trace recursion. Sparse partitions are first controlled by interpolation on an enlarged tuple space, with fixed-size coordinate chunks. For the dense estimate, the associated bipartite graph has few edges belonging to a parallel pair or a four-cycle. Those edges account for the entropy error, and a support cutoff in each spectral integral pays for the number of local partition types.

Write $n = 2^e$ in this section, and let $T_n$ be one sweep. Schatten norms are unnormalized, and $d_lambda$ is the dimension of the irreducible indexed by $lambda tack.r n$. The operator is a product of subgroup projections and has a strict norm gap off constants at each fixed size by Lemma 5.  We use the strip interpolation established in the proof of Lemma 9. For a bounded analytic matrix family $F$ on $0 lt.eq Re z lt.eq 1$, continuous on the boundary,

$ parallel F \( i u \) parallel_(upright("op")) lt.eq 1 \, #h(2em) parallel F \( 1 + i u \) parallel_(S^q) lt.eq B quad arrow.r.double quad parallel F \( theta \) parallel_(S^(q \/ theta))^(q \/ theta) lt.eq B^q . $

Below $q$ is $2$ or $4$. Complex powers are zero on their kernels, as in that proof.

=== 9.1 Fixed-size coordinate chunks on enlarged tuples <fixed-size-coordinate-chunks-on-enlarged-tuples>

#thm([Proposition 9.1.])[
  #emph[ #strong[Long first row.] For all sufficiently large powers of two $n$, if 
$ 1 lt.eq k = n - lambda_1 lt.eq n^.995 \, $

 there is a bound 
#[#set math.equation(numbering: n => "(80)")
 $ d_lambda thin upright("Tr") \| T_n \( lambda \) \|^p lt.eq n^(- 10 k) #h(2em) \( p gt.eq p_(*) \) $ <tra:asymmetric:eq1>]

 with $p_(*) < oo$ absolute.]
] <tra:asymmetric:sparse>

#proof[
  Use the permutation representation on ordered $K$-tuples of distinct positions, where $K = floor.l k n^.001 floor.r$; thus $K \/ n lt.eq n^(- .004)$. Split the coordinate sequence into chunks of lengths between $ell$ and $2 ell$, where $ell$ will just be a sufficiently large #emph[constant], and $e$ can be taken sufficiently large. So the positions are tuples of macro coordinates, ranging in sets of sizes $L_j$, each between $2^ell$ and $2^(2 ell)$. A sweep updates these macro coordinates in sequence, doing sweeps $T_(L_j)$ independently in every fibre of coordinate $j$, by which we mean with all other macro coordinates fixed. For the ordered $K$-tuples this means the operator of a chunk is block diagonal, with a block specified by the allocation of tuple members to fibres. On such a block it is a tensor product: for a fibre with $t$ members use $T_(L_j)$ acting on ordered $t$-tuples (using fixed ordering of the members in this factor).
  For any such local operator $T$ write $T = V \| T \|$ with unitary polar factor, and replace it by
  $ T \( z \) = V \| T \|^(Q z \/ 2) . $
  Apply these replacements in every block, and let $F \( z \)$ be the product of the resulting chunk operators in the sweep order. We can take $Q > 2$ a sufficiently large constant depending on $ell$. On the first line of the strip the operator norms are at most 1. On the second line $T \( z \)$ is arbitrarily close to the matrix averaging uniformly on its local tuple space, since $T$ preserves constants with all other singular values strictly less than 1 by the generation observation; only finitely many local sizes are used. For $t = 0 \, 1$ we have the averaging exactly on this line (a sweep gives a single point all fresh fair bits). In particular we take $Q$ so that on this line, with $L = L_j$, each entry of $T \( z \)$ in absolute value is at most
  #[#set math.equation(numbering: n => "(81)")
   $ frac(1 + delta_L \( t \), \( L \)_t) \, #h(2em) delta_L \( 0 \) = delta_L \( 1 \) = 0 \, quad delta_L \( t \) = L^(- 2) med \( t gt.eq 2 \) \, $ <tra:asymmetric:eq2>]
  with $\( L \)_t$ a falling factorial.
  Between any given input and output ordered tuple, there is at most one trajectory of tuples through the chunk product: at each boundary of chunks, the already processed macro coordinates of each point must be its output ones and the others its input ones. A valid such trajectory, under #emph[ideal] routing doing full uniform permutations independently in each fibre at each chunk, has probability given by multiplying $1 \/ \( L \)_t$ for its fibres. Thus (81) bounds the sum of squared entries of $F \( z \)$ by
  #[#set math.equation(numbering: n => "(82)")
   $ \( n \)_K med bb(E) product_(upright("fibres over chunks")) frac(\( 1 + delta_L \( t \) \)^2, \( L \)_t) med lt.eq med bb(E) product_(upright("fibres over chunks")) W_L \( t \) \, #h(2em) W_L \( t \) = \( 1 + delta_L \( t \) \)^2 frac(L^t, \( L \)_t) . $ <tra:asymmetric:eq3>]
  Here we sample the starting $K$-tuple uniformly and do the ideal routing, $t$ referring to the occupancy by those routed points; we used $product_j L_j = n$.
  We detail why clustering of the $K$ points in this estimate is harmless. Condition on the full ideal routing of all $n$ points, let $X$ be the uniform size $K$ sample of input points, and use the graph on $n$ points connecting any two that visit the same fibre at any chunk. Maximum degree is $O_ell \( log n \)$. Consider a component $Y$ of the induced graph on the sample, of size $v$. Over all chunks its fibre occupancies satisfy
  #[#set math.equation(numbering: n => "(83)")
   $ sum t log t lt.eq v log v . $ <tra:asymmetric:eq4>]
  In fact, group the inputs by their not-yet-processed coordinates: form the tree starting with all inputs and splitting by the input coordinate of the last chunk, then the next-to-last, and so on. Take any node specified by coordinates later than $j$, split into children by coordinate $j$. The points of $Y$ here (say of number $v_0 > 0$) when routed up to chunk $j$ are distributed over fibres still within the specified later coordinates, and the $t$ in one fibre come from $t$ different children because their $j$-coordinates are distinct and not yet processed. Hence the sum of $t log t$ over these fibres is at most $v_0$ times the entropy of the child proportions: average the distributions over children given by each fibre (each distribution uniform on $t$ children with weight $t \/ v_0$) and use concavity. Summing the bounds at nodes telescopes, giving (83). There is no shared occupied fibre of two different components.
  For $t gt.eq 2$,
  $ log W_L \( t \) lt.eq frac(C, log L) thin t log t $
  with $C$ absolute. Up to $sqrt(L)$ use $log \( L^t \/ \( L \)_t \) = O \( t^2 \/ L \)$; above that, it suffices that this log is at most $t$, using the average over the full increasing sequence $log \( L \/ \( L - i \) \) \, thin 0 lt.eq i < L$. Choose $ell$ so large that by this and (83) the product in (82) is bounded by the product over nonsingleton components of $v^(zeta v)$, $zeta = .0005$.
  With $Delta = O_ell \( log n \)$ a degree bound (at least 1), and $u = K \/ n$, the expectation of this last product is at most
  $ exp (sum_(v = 2)^K n Delta^(2 \( v - 1 \)) u^v v^(zeta v)) . $
  Indeed we can sum products over collections of disjoint connected sets included in $X$, charging the components in particular; the probability cost for such a collection is at most $u$ to the power of total size. The count of connected sets uses a spanning tree walk of length $2 \( v - 1 \)$; allowing arbitrary collections with the product cost gives the exponential bound. The sum in this exponential is $O \( n Delta^2 u^2 \)$: for $v gt.eq 3$ compare after factoring $n Delta^2 u^2$ to powers of $Delta^2 u n^(3 zeta)$, which goes to zero. Thus (82) is at most $exp \( O \( k \) \)$, since $Delta^2 K^2 \/ n = O \( k \)$ for our $k \, K$.
  The enlarged tuple space has now supplied a Schatten budget $exp \( O \( k \) \)$. Its large branching multiplicity will convert that budget into decay on each first-row level. We now interpolate. We have $parallel F \( 1 + i y \) parallel_2^2 lt.eq exp \( O \( k \) \)$, whereas $F \( 2 \/ Q \)$ is the sweep operator on the $K$-tuple space, so its Schatten $Q$-norm to power $Q$ has the same upper bound. By branching and Frobenius reciprocity for the pointwise stabilizer of $K$ positions, the multiplicity of $lambda$ in this space is the number of standard tableaux of the skew shape obtained by removing the row of length $n - K$ from $lambda$. Since $lambda_2 lt.eq n - K$ here (for large enough $n$), there are at least $binom(K, k)$ such tableaux: the tail of size $k$ is separate from the remaining $K - k$ entries of the first row. The Schatten estimate with this multiplicity thus gives, say,
  $ parallel T_n \( lambda \) parallel_(upright("op"))^Q lt.eq n^(- .0004 k) $
  for all sufficiently large $n$ (use $K \/ k gt.eq n^.001 \/ 2$). As $d_lambda lt.eq n^k$ (it occurs even on ordered $k$-tuples), increasing to a suitably large constant power $p_(*)$ proves (80). ◻
]

#thm([Lemma 9.2.])[
  #emph[ We record two further partition details. If $lambda$ has length greater than $n \/ 2$, we have $T_n \( lambda \) = 0$. Indeed there are no invariants under even one full pair layer subgroup. This also follows immediately in the Specht module realization: the irrep is spanned by column-antisymmetrized vectors (polytabloids) from tableaux, and the column of length greater than $n \/ 2$ must contain both endpoints of some pair, so averaging kills such vectors. For all sufficiently large $n$, for the partitions of length at most $n \/ 2$ with $k > n^.995$, we have 
#[#set math.equation(numbering: n => "(84)")
 $ log d_lambda med gt.eq med n^.995 . $ <tra:asymmetric:eq5>]

 In fact if the first row has length $r gt.eq n \/ 10$, keep a subshape of the diagram with this row and $t = floor.l n^.995 \/ 2 floor.r$ boxes below. Even on this shape we get at least $binom(r, t)$ tableaux: after the first $t$ boxes of the first row are filled we can interleave the rest of that row and a standard filling of the lower boxes. They extend to the whole shape. This count suffices for (84). We can do the same with the first column if it has length at least $n \/ 10$ (there are enough boxes outside the column by the length condition). If neither holds, (84) follows by the hook length formula with all hooks at most $n \/ 5$.]
] <tra:asymmetric:dimension>

=== 9.2 Short-cycle entropy on an asymmetric grid <tra:asymmetric:grid-sizes>

For the regular-representation part of the proof, take, with $n = 2^e$ large,

$ a = 2^(floor.l e \/ 10 floor.r) \, #h(2em) b = n \/ a . $

#thm([Proposition 9.3.])[
  #emph[ Arrange the points in $b$ rows of $a$ cells each. We need a probability bound, which we prove first. Independently in each row $i$, assign the labels $h_(i j) in \[ a \]$ by a permutation, with an arbitrary law of density at most $D_i$ relative to uniform. Independently each column $j$ has labels $l_(i j) in \[ b \]$ likewise assigned by a permutation, say with density at most $D'_j$, also independent across columns and from the row assignments. Put $D_H = product_i D_i \, med D_L = product_j D'_j$. Then, with an absolute constant $C$, the probability that the pairs $\( h_(i j) \, l_(i j) \)$ are all distinct is at most 
#[#set math.equation(numbering: n => "(85)")
 $ exp (- n + C n^.98 + frac(C, log n) log \( D_H D_L \)) . $ <tra:asymmetric:eq6>]

]
] <tra:asymmetric:compatibility>

#proof[
  For the proof, the $l$-array gives a bipartite multigraph on sides of size $b$, with one edge from $i$ to $l_(i j)$ per cell; it has degree $a$. Call an edge bad if contained in a parallel pair or in a 4-cycle. Write $L_(upright("bad"))$ for the number of bad edges (cells).
  Here is a useful moment bound for these edges under the uniform independent column assignments $cal(U)$:
  #[#set math.equation(numbering: n => "(86)")
   $ log bb(E)_(cal(U)) exp \( c \( log n \) L_(upright("bad")) \) = O \( n^.9 \) $ <tra:asymmetric:eq7>]
  for some absolute $c > 0$. Compare any law $xi$ of column assignments to $cal(U)$ by KL divergence (relative entropy). Use the chain rule revealing one cell at a time in an order given by independent uniform priorities. For a current cell, if at least $b \/ 3$ values are still available in its column, test the event that its new edge closes a parallel pair or a 4-cycle with edges already visible; otherwise use an empty event as test. Under the $cal(U)$-conditional distribution, chance of the test event is $O \( a^3 \/ b \) = O \( n^(- .6) \)$; the possible targets from paths of length 1 or 3 are bounded in number by $a + a^3$. Thus each conditional KL divergence is bounded below by
  $ .25 \( log n \) Pr_xi \( upright("test event") divides upright("past") \) - O \( n^(- .35) \) \, $
  where the order is given (use the entropy inequality with $.25 log n$ times the indicator as test function). For a given completed array, each bad edge will score the event with at least absolute positive probability over order. Indeed fix up to three witnessing other edges; with probability bounded below the cell priority is in $\( .3 \, .4 \)$ and these witnesses precede it, and at least $b \/ 3$ column choices are still available. For the last condition one can use just concentration of the number of other cells of that column seen, with at most three additional cells forced earlier. Averaging and summing, the divergence of $xi$ from $cal(U)$ is at least $c \( log n \) bb(E)_xi L_(upright("bad")) - O \( n^.9 \)$, giving (86), for example by taking $xi$ the exponential tilt. Hence for our possibly nonuniform column laws, by Hölder (with exponent $c log n$ on $exp L_(upright("bad"))$, and using density at most $D_L$ of the product law),
  #[#set math.equation(numbering: n => "(87)")
   $ log bb(E) exp L_(upright("bad")) lt.eq O \( n^.9 \) + frac(log D_L, c log n) . $ <tra:asymmetric:eq8>]
  The short-cycle estimate controls the column geometry. We next condition on that geometry and expose the row permutations; the restriction to edges belonging to neither a parallel pair nor a four-cycle makes the blocking rows distinct.
  Fix columns and upper bound the conditional probability $p$ of distinct pairs, assuming it is positive. The conditional law of row assignments #strong[given] distinct pairs has divergence $- log p$ from the product of the original row laws. Reveal rows in a random order, again using independent uniform priorities. At row $i$, a conditional divergence term is at least minus log of the original row-law mass of candidates fitting with previously revealed rows (no reused pairs), since the conditional law is supported on such candidates.
  To bound these masses, fix any full realization from the law given distinct pairs. In row $i$ let $g_i$ be the number of cells whose column-array edge is not bad. For each such cell $i j$ where a candidate for the row changes the $h$-label, the new pair (new $h$, $l_(i j)$) occurs in the full realization and must occur on some other row (as $l_(i j)$ doesn’t repeat within row $i$). Moreover all the blocking rows identified this way for the candidate are distinct: otherwise two such $l$ values connect row $i$ and another row by a 4-cycle. If $v_i$ is the priority of $i$, put
  $ x = min { - log \( 1 - v_i \) \, .25 log a } . $
  Thus for a given candidate matching the realized row permutation at $M$ cells (total matches), the probability over remaining priorities of fitting is at most $exp \( - x g_i + x M \)$, since none of the blocking rows can have come before it. So the expected log of the mass fitting, given the realization and $v_i$, by Jensen is at most
  $ - x g_i + log bb(E)_(nu_i) exp \( x M \) $
  where $nu_i$ is the original candidate law on row $i$. For uniform permutations the log of the moment $bb(E) exp \( t M \)$, $t gt.eq 0$, is at most $exp \( t \) - 1$, by counting subsets of matches. Thus by Hölder using exponent $.5 \( log a \) \/ x$ on the moment function for $x > 0$, we get
  $ log bb(E)_(nu_i) exp \( x M \) lt.eq frac(2 x, log a) \( log D_i + a^.5 \) . $
  We integrate these log mass bounds keeping in mind $bb(E) x = 1 - a^(- 1 \/ 4)$. They apply uniformly when histories are taken from the full law conditioned on distinct pairs (which can be sampled independently of the priorities). So by the divergence bound for $- log p$,
  $ log p lt.eq - \( 1 - a^(- 1 \/ 4) \) \( n - L_(upright("bad")) \) + frac(2, log a) (log D_H + b a^.5) lt.eq - n + L_(upright("bad")) + O \( n^.98 \) + frac(C, log n) log D_H . $
  This along with (87) proves (85). ◻
]

#thm([Corollary 9.4.])[
  #emph[ We apply the estimate to products of group projections. Use $R$ and $Y$ for the subgroups of $S_n$ permuting within rows and within columns, respectively. For each row of size $a$, let $P_i$ be an orthogonal projection in its group algebra supported just on one irrep $mu_i$, of rank $r_i > 0$ there (so acting on the regular representation, this block action is repeated with multiplicity $d_(mu_i)$). Put $D_i = d_(mu_i) r_i$. Likewise take projections for the columns in their group algebras with $D'_j$ defined similarly. Write $P_R \, P_Y$ for the two product projections, viewed also in the group algebra of $S_n$. On its regular representation, 
#[#set math.equation(numbering: n => "(88)")
 $ parallel P_Y P_R parallel_4^4 lt.eq exp \( C n^.98 \) thin (product_i D_i product_j D'_j)^(1 + C \/ log n) $ <tra:asymmetric:eq9>]

 for an absolute $C$.]
] <tra:asymmetric:projection-crossing>

#proof[
  Apply Lemma 14 with the line projections as its positive operators. Their regular ranks and squared masses are $D_i = d_(mu_i) r_i$ and $D'_j$, so the normalized squared coefficient densities have these same caps. At an intermediate cell between row action $r$ and column action $y$, the column of origin is given by $r^(- 1)$ and the row of destination by $y$. Thus opposite-order routing is exactly the distinct-pair event in Proposition 40; inversion preserves the coefficient caps. The lemma and (85) give
  $ parallel P_Y P_R parallel_4^4 lt.eq frac(n !, \| R \| \| Y \|) (product_i D_i product_j D'_j) exp {- n + C n^.98 + frac(C, log n) log (product_i D_i product_j D'_j)} . $
  Finally $n ! \/ \( \| R \| \| Y \| \) = n ! \/ \( \( a ! \)^b \( b ! \)^a \) lt.eq e^(n + O \( log n \))$, which proves (88). ◻
]

=== 9.3 Spectral integrals with a dimension cutoff <spectral-integrals-with-a-dimension-cutoff>

#thm([Theorem 9.5.])[
  #emph[ We prove that for each sweep size there is $p_n gt.eq 4$, all bounded above by an absolute constant, such that 
#[#set math.equation(numbering: n => "(89)")
 $ d_lambda thin upright("Tr") \| T_n \( lambda \) \|^(p_n) med lt.eq med exp \( n^.99 \) #h(2em) upright("for all ") lambda . $ <tra:asymmetric:eq10>]

 For all sufficiently large $n$, the proof also bounds the complete regular Schatten power by $exp \( n^.99 \)$.]
] <tra:asymmetric:trace>

#proof[
  Let $B gt.eq 1$ be a fixed constant sufficiently large for (88), so we can use exponent $Gamma_n = 1 + B \/ log n$ in that bound. We use a sufficiently large absolute cutoff $n_0$, which can be taken above all fixed thresholds as needed in the proof below (in particular the estimates requiring sufficiently large sizes in the induction step will not depend on the base choice of power). Choose $p_(upright("base")) gt.eq max { 4 \, p_(*) }$, also sufficiently large to make the left side of (89) with $p_(upright("base"))$ at most 1 for every size up to the cutoff; this is possible by strict contraction on nontrivial sectors. Use $p_(upright("base"))$ up to the cutoff. Above, with $a \, b$ from the grid estimate, set
  $ p_n = (1 + frac(B + 1, log n)) max \( p_a \, p_b \) . $
  This is bounded absolutely: down any recursion path above the cutoff, the logs of sizes decrease by at least a constant factor (i.e. next at most, say, .95 times the current log), so the sum of their reciprocals there is bounded.
  Split the coordinates into the first $log_2 a$ and the remaining $log_2 b$, arranging the wires so that $T_n = T_Y T_R$ with $T_R$ a product over rows of copies of $T_a$, and $T_Y$ likewise over columns with $T_b$. Use the ambient regular representation. Put $X = \| T_Y \| \, med Z = \| T_R^(*) \|$. We can drop outer unitary polar factors, and use
  #[#set math.equation(numbering: n => "(90)")
   $ parallel T_n parallel_(p_n)^(p_n) lt.eq parallel X^(p_n \/ 4) Z^(p_n \/ 4) parallel_4^4 . $ <tra:asymmetric:eq11>]
  This is Lemma 9 with $P = p_n$ and $q = 4$.
  The positive powers on the right factor as corresponding products commuting within the line subgroups (row factors amongst themselves, and likewise columns), since the operations factor in the respective subgroup algebras and lift to the ambient group algebra. Write $p = p_n$. On a line of size $m$ ($a$ or $b$), according to orientation, use the spectral projections within irrep $mu$ of that group’s $\| T_m \|$ or $\| T_m^(*) \|$; write $E_(mu \, t)$ for the projection for singular values at least $t > 0$ (zero on other irreps), of rank $r_mu \( t \)$ on the irrep. The line power for (90) is
  $ sum_mu integral_0^1 p / 4 thin t^(p \/ 4 - 1) E_(mu \, t) thin d t $
  lifted as an element of the corresponding group algebra. Expand in all lines and use the triangle inequality and (88) on the right of (90). This gives
  #[#set math.equation(numbering: n => "(91)")
   $ parallel T_n parallel_p^p lt.eq exp \( C n^.98 \) product_(upright("lines")) (sum_mu integral_0^1 p / 4 thin t^(p \/ 4 - 1) #scale(x: 120%, y: 120%)[\(] d_mu r_mu \( t \) #scale(x: 120%, y: 120%)[\)]^(Gamma_n \/ 4) thin d t)^4 . $ <tra:asymmetric:eq12>]
  The spectral support cutoff supplies a negative power of a large child dimension. This compensates for the number of local partition types: a slight surplus in the parent exponent becomes a dimension saving because the integral ends before $t = 1$. We show that each integral in (91) is $O \( log n \)$. Write $W = d_mu upright("Tr") \| T_m \( mu \) \|^(p_m)$. Then
  $ d_mu r_mu \( t \) lt.eq W t^(- p_m) \, #h(2em) r_mu \( t \) = 0 med upright(" if ") med t > \( W \/ d_mu \)^(1 \/ p_m) . $
  If $W lt.eq 1$ then simply integrating with the first bound gives at most $p \/ \( p - Gamma_n p_m \) = O \( log n \)$. This applies for sizes up to the cutoff, and also in larger sizes for the trivial irrep, for the cases from (80), and for the sectors killed by the pair layer. For the remaining cases, we can use $W lt.eq H = exp \( m^.99 \)$ inductively and have $log d_mu gt.eq m^.995$ by (84). Using the support bound as well gives at most
  $ frac(p, p - Gamma_n p_m) H^(Gamma_n \/ 4) \( H \/ d_mu \)^(\( p \/ p_m - Gamma_n \) \/ 4) . $
  Since $p \/ p_m - Gamma_n gt.eq 1 \/ log n$, this is $O \( log n \)$ as claimed (for $m$ above the cutoff), using $m^.995 gt.double m^.99 log n$ for large sizes here, as $log n = O \( log m \)$.
  The count of partitions of $m$ is at most $exp \( O \( sqrt(m) log \( m + 1 \) \) \)$, for example by describing rows and columns out from the diagonal. Therefore (91) with $b$ lines of size $a$ and $a$ lines of size $b$ yields
  $ parallel T_n parallel_p^p lt.eq exp \( n^.99 \) \, $
  since $b sqrt(a) = O \( n^.95 \)$, $a sqrt(b) = O \( n^.55 \)$. All the estimates needed here for sufficiently large $n$ have constants independent of $p_(upright("base"))$, so a fixed cutoff as specified suffices. We have bounded the regular-representation sum, proving in particular (89) and closing the induction. ◻
]

#thm([Corollary 9.6.])[
  (Vanishing regular remainder).  #emph[Let $p^(*) = sup_n p_n < oo$ be the bound obtained above and let $Pi$ be uniform averaging. For every integer $j gt.eq 2 p^(*)$, $parallel T_n^j - Pi parallel_(upright("HS"))^2 arrow.r 0$ as $n arrow.r oo$.]
] <tra:asymmetric:mixing>

#proof[
  Finally take a constant integer number of sweeps $j$ at least twice the upper bound on the $p_n$’s. For nontrivial sectors with $1 lt.eq k lt.eq n^.995$, (80) shows for large sizes
  $ d_lambda parallel T_n \( lambda \)^j parallel_2^2 lt.eq d_lambda^2 parallel T_n \( lambda \) parallel_(upright("op"))^(2 j) lt.eq d_lambda^2 \( n^(- 10 k) \/ d_lambda \)^4 $
  where the first norm after the dimension factor is Hilbert-Schmidt. This is negligible even summed (there are at most $2^k$ partitions for a given $k$). For remaining sectors not already killed we similarly have by (89)
  $ d_lambda parallel T_n \( lambda \)^j parallel_2^2 lt.eq d_lambda^2 \( exp \( n^.99 \) \/ d_lambda \)^4 $
  which by (84) is again negligible summed over partitions. Thus the squared Hilbert-Schmidt norm in the regular representation of $T_n^j$ minus uniform averaging tends to zero. The identification with the squared $L^2$ distance of the permutation density is the one in Proposition 16. All powers above are controlled by operator submultiplicativity; no normality of $T_n$ is required. ◻
]

== 10 Representation level under coordinate deletion <tra:projection-deletion>

We turn from the choice of entropy law to the sparse representation input. The first question is how much diagram level can disappear when a coordinate is deleted.

A split into two coordinate halves changes the representation in which a vector is decomposed. The useful quantity here is how much of its original level disappears in that decomposition. For a partition $lambda tack.r m$, its level is $m - lambda_1$. We control the loss of level by averaging tuple coordinates while retaining their side assignments. A content formula gives a lower bound for the resulting projection norms; random orientations of the matching pairs give an upper bound. Comparing them supplies a tail estimate for the lost level.

The dense part retains different information: an entropy inequality valid for every joint law supported on compatible row and column moves. Correlations within the column family remain in the entropy budget until the final step. These two estimates give a complete moment recursion below.

Throughout this section $n = 2^d$, $d gt.eq 1$, $G_n = S_n$, and $T_n$ is the sweep from Section 2. Its regular trace is unnormalized, and one sweep corresponds to $d$ physical shuffles.

=== 10.1 The content formula and coordinate deletion <tra:projection-deletion:content-and-injection-preliminaries>

We use standard facts from complex representation theory of symmetric groups. To specify these: irreducibles are indexed by Young diagrams $lambda$, have dimension $d_lambda$ the number of standard tableaux, are self-dual, and each has multiplicity $d_lambda$ in the regular representation. The level for $G_m$ is $m - lambda_1$. We will use the Pieri rule (special case of Young diagram induction/restriction, or the Littlewood-Richardson rule): the possible types $rho$ of $G_l$ paired with the trivial representation of $G_(m - l)$ when restricting a type $lambda$ to $G_l times G_(m - l)$ are obtained by removing a horizontal strip of size $m - l$ from $lambda$, with multiplicity one. We also use the content formula (equivalently the Young–Jucys–Murphy formula) for the sum of transpositions #cite(label("VershikOkounkov2005")) Eq. (2.1), Proposition 5.3, Theorem 5.8. Thus the element $sum_(1 lt.eq h < i lt.eq m) \( 1 - \( h i \) \)$ acts on type $lambda$ by

#[#set math.equation(numbering: n => "(92)")
 $ D_m \( lambda \) = binom(m, 2) - sum_(\( u \, v \) in lambda) \( v - u \) $ <tra:projection-deletion:eq2>]

where $u \, v$ are row and column.

The representation on ordered injections (ordered distinct sites) of length $l$ contains only types of level at most $l$; a type of level $l$ does occur, by Pieri taking $rho = \( lambda_2 \, lambda_3 \, dots.h \)$. These statements use the realization as functions of a permutation invariant under the right group on $m - l$ indices, with $G_m$ acting on the left; the right $G_l$ acting on the length-$l$ ordering thus has types given by Pieri in each left isotypic component. In particular, in the realization of level $l$ by functions of $l$ distinct sites, summing out any one of the $l$ sites (others fixed) gives zero since that projection is equivariant with image in functions of $l - 1$ sites.

#thm([Proposition 10.1.])[
  #emph[ There are absolute $alpha > 0$, $M_0 < oo$, and $0 < h < 1$, with 
#[#set math.equation(numbering: n => "(93)")
 $ parallel T_n parallel_lambda^2 med lt.eq med h (frac(M_0 k, n))^(alpha k) \, #h(2em) k = n - lambda_1 gt.eq 1 \, $ <tra:projection-deletion:eq3>]

 where the norm is operator norm on the indicated representation.]
] <tra:projection-deletion:level>

#proof[
  It suffices to obtain a nontrivial estimate when $k \/ n$ is sufficiently small; outside that range, choosing $M_0$ large will make the right side at least one. For $k = 1$ the norm is zero: on single-site functions the switches average each bit, giving global averaging as the product.
  We induct on the number of coordinates. The main step is a tail bound for the level lost after the first matching projection. Once this bound is established, we will check the constants in the norm recursion.
  For induction, write $n = 2 m$, use the pairs of a dimension for the rightmost projection in $T_n$, and call their flip subgroup $K$, with projection $P_K$. There are two sides of size $m$, with the sites of each pair in opposite sides. The other factors act separately in these two sides, so that
  $ T_n = \( T_m ⊗ T_m \) P_K \, $
  with the tensor product here in the subgroup algebra of $G_m times G_m$. We use level $k$ realized on the injection tuples $x = \( x_1 \, dots.h \, x_k \)$. It suffices to bound the squared norm after the two side operators starting with a $K$-invariant unit vector $f$ of our type there. Norms of tuple functions can use uniform counting probability. Such $f$ has zero sum in each of its coordinates as explained above.
  Restrict $f$ to the different assignments of the $k$ indices to sides, with $j$ indices in the first side for a given assignment. Decompose in types within the two sides, of levels $s_1 \, s_2$, where $s_1 lt.eq j$, $s_2 lt.eq k - j$. We get a probability law on these data by squared norms of the orthogonal parts. Under it put $R = k - s_1 - s_2$. We give two controls on this law:
  - $j$ has subgaussian tails around $k \/ 2$, in particular $Pr \( \| j - k \/ 2 \| gt.eq t \) lt.eq 2 exp \( - 2 t^2 \/ k \)$, and $Pr \( j = 0 med upright("or") med k \) lt.eq 2^(1 - k)$.
  - For $k \/ n$ sufficiently small, there is an absolute $C_0$ such that
  #[#set math.equation(numbering: n => "(94)")
   $ Pr \( R gt.eq r \) med lt.eq med \( C_0 k \/ n \)^(r \/ 2) \, #h(2em) 1 lt.eq r lt.eq k . $ <tra:projection-deletion:eq4>]
  The first property follows from $K$-invariance and averaging by randomizing the pair orientations for the side assignment. Each tuple then uses some double-occupied pairs contributing one index each in the first side, and singles with independent fair side assignment.
  To prove (94), consider projections indexed by sets $I$ of $r$ indices to be ignored, that is, average the positions of those indices knowing the positions of the other indices and #strong[the sides of all indices]. Write these as $L_I$. All these averages use the uniform injection law conditioned on the complete side-assignment vector. When an index is deleted, its side remains part of the conditioning and only its position is integrated out. Successive deletions are therefore conditional expectations onto nested sigma-algebras: their composition is the single average over the deleted set. We apply the one-slot bound on each resulting shorter tuple space, retaining the same two left representation types.
  We first record why
  #[#set math.equation(numbering: n => "(95)")
   $ sum_(\| I \| = r) parallel L_I f parallel^2 med gt.eq med 2^(- r) Pr \( R gt.eq r \) $ <tra:projection-deletion:eq5>]
  when $k \/ n$ is sufficiently small. Work conditionally on assigned sides. Within one side with a tuple of $l lt.eq k$ positions and left type $mu$ of level $s$, the sum of the projections which average out one coordinate has eigenvalues
  $ l - frac(D_m \( mu \) - D_l \( rho \), m - l + 1) $
  on the corresponding right types $rho$ described by Pieri. Indeed the single-coordinate average for coordinate $i$, on functions of a permutation, acts on the right by $\( 1 + sum_(l < q lt.eq m) \( i q \) \) \/ \( m - l + 1 \)$. Sum over $i lt.eq l$, and use (92) and invariance on the right under $G_(m - l)$. Now $rho$ contains the diagram $macron(mu) = \( mu_2 \, mu_3 \, dots.h \)$ since $mu \/ rho$ is a horizontal strip. Thus $D_l \( rho \) gt.eq D_s \( macron(mu) \)$ by adding boxes (each addition to size $v$ to go to size $v + 1$ has content at most $v$). Also $D_m \( mu \) - D_s \( macron(mu) \) = \( m - s + 1 \) s$. This gives the projection sum lower bound
  $ \( l - s \) (1 - frac(s, m - l + 1)) med gt.eq med \( l - s \) \/ 2 . $
  It holds also with zero indices and the trivial type. For both sides together, summing over the coordinate to remove thus gives squared norms summing to at least half the excess of current tuple length over total level, times the squared norm before removal. After an averaging we can work on the shorter tuples with their marginal law; the averaging preserves the left types when nonzero. On a component of total level $k - R$, iterating this bound through $r$ successive deletions gives $2^(- r) \( R \)_r$ times the original squared norm, where $\( R \)_r = R \( R - 1 \) dots.h.c \( R - r + 1 \)$. At each stage the conditional expectation acts on the shorter tuple space, with all side assignments retained. The tower property identifies the result with averaging all removed coordinates, and each set $I$ is counted $r !$ times through its possible deletion orders. After division by $r !$, the lower bound is $2^(- r) binom(R, r)$, which is at least $2^(- r)$ for $R gt.eq r$. Summing the components proves (95). All projections in (95) respect assignments and the left types of the side groups.
  We have expressed a large loss of level as a large sum of coordinate-projection norms. We now bound the same sum from above using the matching-pair symmetries of $f$.
  For the upper bound on the left hand side of (95), we can average it with the side partition randomized by $K$, because $f$ is invariant under $K$. Write $epsilon.alt \( x_i \)$ for the side sign of the position $x_i$ under the random orientations. Given the retained positions $z$, the numerator sum in an average over the other positions constrained by a specified vector of side signs $\( eta_i \)_(i in I)$ equals
  #[#set math.equation(numbering: n => "(96)")
   $ sum_(x \| z) f \( x \) product_(i in I) frac(1 + eta_i epsilon.alt \( x_i \), 2) = 2^(- r) (product_(i in I) eta_i) sum_(x \| z) f \( x \) product_(i in I) epsilon.alt \( x_i \) \, $ <tra:projection-deletion:eq6>]
  where $x \| z$ indicates all distinct-site extensions. The equality uses the zero sums. In computing the squared norm, we sum squared absolute numerator sums divided by the number of extensions with the given side constraints, over $z$ and $\( eta_i \)$, with the overall tuple space normalization. These denominators are at least $\( m - k \)^r$. Thus we can use this lower bound before expanding the averaged squares on the right in (96).
  Two tuples in that expansion, $x \, y$ agreeing off $I$, must among their $I$-entries together hit each pair an even number of times for the sign expectation not to vanish. We bound the resulting nonnegative majorant on absolute values of $f$ by a row sum (the matrix is symmetric). For fixed $x$, classify $I$ as using $u$ single entries in pairs and $v$ doubles, $u + 2 v = r$, counting just $x_I$. The number of choices of $I$ with these data is at most $k^(u + v) \/ \( u ! thin v ! \)$: choose $v$ full pairs in $x$, then the other entries. For each, the possibilities for $y_I$ are bounded by $2^u r ! n^v \/ v !$, since they have to use the same $u$ singleton pairs, and $v$ doubles. The sum over sign specifications costs $2^r$, with a factor $2^(- 2 r)$ in the square in (96). It follows, using $r ! \/ \( u ! v ! v ! \) lt.eq 3^r$, that the left hand side of (95) is at most
  $ frac(2^(- r), \( m - k \)^r) sum_(u + 2 v = r) frac(k^(u + v), u ! thin v !) dot.op frac(2^u r ! n^v, v !) med lt.eq med C_1^r \( k \/ n \)^(r \/ 2) $
  for an absolute $C_1$ and $k \/ n$ sufficiently small. This proves (94).
  The lost-level tail (94) is now proved. It remains to show that its cost is smaller than the contraction supplied by the two child sweeps.
  To finish the induction for (93), use the inductive bound in each side (factor 1 for level 0). For the squared output norm, divided by the desired bound, this gives the upper bound by the expectation of
  #[#set math.equation(numbering: n => "(97)")
   $ h^(\# { i : s_i > 0 } - 1) (frac(n, M_0 k))^(alpha R) exp (alpha sum_(i = 1)^2 s_i log \( 2 s_i \/ k \)) \, $ <tra:projection-deletion:eq7>]
  where zero terms in the sum are set to zero. The sum in this exponent before multiplying by $alpha$ is bounded above by
  #[#set math.equation(numbering: n => "(98)")
   $ C_2 #scale(x: 120%, y: 120%)[\(] \( j - k \/ 2 \)^2 \/ k + R #scale(x: 120%, y: 120%)[\)] $ <tra:projection-deletion:eq8>]
  for some absolute $C_2$. For $s_1 = j \, s_2 = k - j$ this follows by the binary entropy formula or Taylor expansion near $k \/ 2$, and boundedness away from the middle. If $j \/ k$ is in $\[ 1 \/ 4 \, 3 \/ 4 \]$ and $R < k \/ 8$, changing to $s_i$ changes the terms by at most $O \( R \)$; outside these conditions the crude upper bound $O \( k \)$ suffices.
  Here are details that constants can be fixed in the induction. Take $h = 1 \/ 20$, and $alpha > 0$ sufficiently small, with $alpha < 1 \/ 4$. On $R = 0$ and $k gt.eq 2$, cases with $j = 0$ or $k$ contribute to the expectation at most $2^(1 - k) 2^(alpha k) lt.eq 0.6$ by making $alpha$ small. The other cases with $R = 0$ contribute at most $2 h$, by (98) and the subgaussian estimate, which by taking $alpha$ small gives $bb(E) exp \( 2 alpha C_2 \( j - k \/ 2 \)^2 \/ k \) lt.eq 2$. For $R = r gt.eq 1$, Cauchy-Schwarz with (98), the same subgaussian estimate, and (94) bound the total contribution summed over $r gt.eq 1$, for $M_0 gt.eq 1$, by
  $ sqrt(2) / h sum_(r gt.eq 1) (e^(C_2 alpha) \( n \/ k \)^alpha \( C_0 k \/ n \)^(1 \/ 4))^r . $
  Choose $M_0$ so large that whenever $h \( M_0 k \/ n \)^(alpha k) < 1$, $k \/ n$ is small enough to apply all the estimates and make this last contribution at most $1 \/ 5$. Thus (97) gives the bound required. When $h \( M_0 k \/ n \)^(alpha k) gt.eq 1$ we need no induction by contractivity, and level 1 was settled already. This proves (93) (with the recursion starting trivially at a single site). ◻
]

=== 10.2 An entropy bound for arbitrary compatible laws <tra:projection-deletion:grid-law-definition>

The norm estimate controls low representation levels. For the remaining levels we bound the regular trace using an entropy estimate for an array with $b$ rows and $a$ columns ($a b = n$, $a lt.eq b lt.eq 2 a$). We will use it for large $a$. Row switches now mean general row permutations $A = \( A_i \)_(1 lt.eq i lt.eq b)$, each $A_i$ a permutation on $a$; and write $B = \( B_c \)_(1 lt.eq c lt.eq a)$ for column permutations, each on $b$. We compose right-to-left, so $B A$ sends $\( i \, j \)$ to row $B_(A_i \( j \)) \( i \)$ and column $A_i \( j \)$.

Call $\( A \, B \)$ valid if, for each $j$, the values

$ B_(A_i \( j \)) \( i \) \, quad 1 lt.eq i lt.eq b $

are distinct. Consider any probability law $nu$ supported on valid configurations. Write divergences $D$ with uniform reference as follows:

- $D_(upright("joint"))$ for both families together relative to uniform independent permutations,
- $D_(A_i) \, D_(B_c)$ for individual marginal permutations,
- $D_B$ for the joint marginal on all column permutations relative to their uniform product law.

#thm([Proposition 10.2.])[
  #emph[ For every probability law $nu$ supported on valid configurations, with absolute constants and all sufficiently large $a$, 
#[#set math.equation(numbering: n => "(99)")
 $ D_(upright("joint")) med gt.eq med n - O \( n a^(- 1 \/ 16) \) + (1 - frac(C_3, log a)) (sum_i D_(A_i) + sum_c D_(B_c)) . $ <tra:projection-deletion:eq9>]

]
] <tra:projection-deletion:entropy>

#proof[
  For clarity, by entropy chain rules,
  #[#set math.equation(numbering: n => "(100)")
   $ D_(upright("joint")) = D_B + sum_i D_(A_i) + I \, #h(2em) I = sum_i H \( A_i \) - H \( A divides B \) $ <tra:projection-deletion:eq10>]
  with $H$ Shannon entropy. We expose all $B_c$, then the rows $A_i$ in random order given by increasing independent uniform priorities $t_i in \[ 0 \, 1 \]$ independent of the configuration. Within each row expose the entries in column index order $j = 1 \, dots.h \, a$. The contribution for a cell to $I$ is the expected relative entropy of its full conditional law given the information available before exposure (including the order), relative to $p$, its marginal conditional law based on just the history in the same row. Here both laws are for $A_i \( j \)$, using $nu$ to form the laws. These expected contributions sum to $I$.
  For this cell let the light set consist of $c$ with $p \( c \) lt.eq a^(- 1 \/ 2)$; denote it by $L$, and use $p_L$ for the conditional probability on $L$ when it has mass. An allowed set is given by the candidates $c$ for which $B_c \( i \)$ does not appear among the previously exposed rows’ outputs $B_(A_(i') \( j \)) \( i' \)$ for this column index $j$. The expected relative entropy for the cell is at least
  #[#set math.equation(numbering: n => "(101)")
   $ bb(E) [upright(bold(1))_({ A_i \( j \) in L }) #scale(x: 120%, y: 120%)[\(] - log p_L \( upright("allowed set") \) #scale(x: 120%, y: 120%)[\)]] . $ <tra:projection-deletion:eq11>]
  Indeed one decomposes relative entropy according to whether the entry is light, then keeps only the divergence (weighted by conditional probability) when light, whose support condition gives the log bound. The log expression for the weight only needs to be evaluated when the entry is light and is then finite almost surely.
  Say a realized cell is good if $A_i \( j \) in L$, $p \( L \) gt.eq a^(- 1 \/ 8)$, and
  #[#set math.equation(numbering: n => "(102)")
   $ \# { c : B_c \( i \) = B_(A_i \( j \)) \( i \) } lt.eq a^(1 \/ 4) . $ <tra:projection-deletion:eq12>]
  Condition on the realized configuration for a good cell and on $t_i$, but not on the priorities of other rows. Each candidate $c$ giving an output distinct from the actual output is forbidden with probability $t_i$, since precisely one other row gives that candidate output value in column index $j$. The mass under $p_L$ of candidates giving the actual output is at most $a^(- 1 \/ 8)$, by (102) and the bounds defining light and good. Consequently the expected allowed mass is at most $1 - t_i + t_i a^(- 1 \/ 8)$. Notice that goodness and $p_L$ depend on data of the configuration but not on the priorities. By nonnegativity in (101) we can restrict there to good cells, and Jensen’s inequality and integration in $t_i$ now yield the lower bound
  #[#set math.equation(numbering: n => "(103)")
   $ Pr \( upright("cell good") \) (1 - O \( a^(- 1 \/ 16) \)) $ <tra:projection-deletion:eq13>]
  for (101). This uses $integral_0^1 - log \( 1 - t + t a^(- 1 \/ 8) \) thin d t gt.eq 1 - O \( a^(- 1 \/ 16) \)$.
  Each good cell has supplied almost one nat of entropy. To obtain a total saving of almost $n$, we must pay for the cells excluded by the three goodness conditions.
  We detail how the expected number of bad cells is bounded by
  #[#set math.equation(numbering: n => "(104)")
   $ O \( n a^(- 1 \/ 16) \) + frac(C_4, log a) (sum_i D_(A_i) + D_B) . $ <tra:projection-deletion:eq14>]
  For heavy actual entries, consider in each row the exposure under its marginal law, relative to drawing a uniform permutation sequentially. Ignore its last at most $O \( a^(3 \/ 4) \)$ cells so that all considered draws have at least $a^(3 \/ 4)$ positions left. Under the conditional uniform reference, the set ${ c : p \( c \) > a^(- 1 \/ 2) }$ has probability at most $a^(- 1 \/ 4)$. For any laws $q \, q_0$ the variational inequality for divergence gives, for an event $E$ and $v gt.eq 0$,
  #[#set math.equation(numbering: n => "(105)")
   $ D \( q parallel q_0 \) gt.eq v q \( E \) - log \( 1 + q_0 \( E \) \( e^v - 1 \) \) . $ <tra:projection-deletion:eq15>]
  Applying this conditionally with $v = \( log a \) \/ 8$ and summing by the chain rule gives the desired heavy-entry part of (104). Cases with $p \( L \) < a^(- 1 \/ 8)$ and a light actual entry have expectation count at most $n a^(- 1 \/ 8)$ without any entropy cost.
  It remains to address (102). Its exceptional count is the same computed over $i \, c$ instead of $i \, j$, looking at the multiplicity of the value $B_c \( i \)$ in row $i$ of the column-permutation data. For groups of cells with equal such value and multiplicity $> a^(1 \/ 4)$, a constant fraction of each group have already had that value appear at least $a^(1 \/ 4) \/ 2$ times in earlier columns (up to harmless rounding, or use threshold $a^(1 \/ 4) \/ 3$). Reveal the data of $B$ row by row in deterministic order, with columns in order within each. Ignore rows near the end with fewer than $b a^(- 1 \/ 8)$ entries remaining available in a uniform column permutation. The conditional uniform reference probability that the revealed value has already appeared at least $a^(1 \/ 4) \/ 3$ times within the row is at most $3 a^(3 \/ 4) \/ \( b a^(- 1 \/ 8) \) lt.eq 3 a^(- 1 \/ 8)$. Apply (105) with $v = \( log a \) \/ 16$ and the chain rule for $D_B$. This proves the remaining exceptional count bound, hence (104).
  Summing (103) and using (100), (104) proves (99), using $D_B gt.eq sum_c D_(B_c)$ once the coefficient on $D_B$ is positive. ◻
]

#thm([Corollary 10.3.])[
  #emph[ Here is a useful weighted form. Put $theta = C_3 \/ log a$ (increasing the absolute constant if needed), so $0 < theta < 1$ for sufficiently large $a$. Under uniform independent permutations, for nonnegative functions $z_i$ of a row permutation and $w_c$ of a column permutation, 
#[#set math.equation(numbering: n => "(106)")
 $ log bb(E)_(upright("unif")) [upright(bold(1))_(upright("valid")) product_i z_i \( A_i \)^2 product_c w_c \( B_c \)^2] med lt.eq med & - n + O \( n a^(- 1 \/ 16) \)\
 & + 2 sum_i log parallel z_i parallel_(2 \/ \( 1 - theta \)) + 2 sum_c log parallel w_c parallel_(2 \/ \( 1 - theta \)) $ <tra:projection-deletion:eq16>]

 where the norms are under the marginal uniform probabilities.]
] <tra:projection-deletion:weighted>

#proof[
  This is the finite-space entropy–Brascamp–Lieb duality of Carlen and Cordero-Erausquin #cite(label("CarlenCorderoErausquin2009")) Theorem 2.1, applied to the compatibility event. We give the specialization to fix the coefficient of every marginal deficit.
  The log integral on the left is given by the entropy variational formula, maximizing the expected log product minus $D_(upright("joint"))$ over allowed laws supported on valid pairs. After (99) the remaining marginal terms are each bounded by the separate variational formulas with coefficient $1 - theta$. Zero weights can also be treated by a limit. ◻
]

=== 10.3 The dense trace recursion <tra:projection-deletion:operator-split>

We now apply the weighted entropy estimate to coefficient densities of positive powers of the two smaller sweeps. The fourth trace turns their product into the validity constraint just analyzed. Split $d$ into parts as equally as possible for $n = 2^d$, thus taking $a = 2^(floor.l d \/ 2 floor.r)$, $b = 2^(ceil.l d \/ 2 ceil.r)$. Make the array of cube positions accordingly. In group algebra, $T_n = T^(upright("row")) T^(upright("col"))$ where the row factor consists of independent runs with operator $T_a$ in every row, and the column factor similarly uses $T_b$. Indeed we just divide the dimensions into two consecutive groups; the grouping and naming is in product-of-operators order here. Put

$ X = \( T^(upright("row")) \)^(*) T^(upright("row")) \, #h(2em) Y = T^(upright("col")) \( T^(upright("col")) \)^(*) $

positive operators. Within the subgroup algebras these are products on separate permutations, with individual operators $X_i$ and $Y_c$ of the forms $T_a^(*) T_a$ and $T_b T_b^(*)$, respectively. For traces or norms on subgroup factors we can use their own regular representations. Positive powers stay in the algebra and are likewise products there.

#thm([Proposition 10.4.])[
  #emph[ Suppose for some $p gt.eq 2$ we have 
#[#set math.equation(numbering: n => "(107)")
 $ "Tr"_(G_a) \| T_a \|^(2 p) lt.eq 2 \, #h(2em) "Tr"_(G_b) \| T_b \|^(2 p) lt.eq 2 . $ <tra:projection-deletion:eq17>]

 Let $p' = p \( 1 + theta \)$ with $theta$ as in (106). We claim 
#[#set math.equation(numbering: n => "(108)")
 $ log "Tr"_(G_n) \| T_n \|^(2 p') med lt.eq med O \( n a^(- 1 \/ 16) + sqrt(n) log n \) . $ <tra:projection-deletion:eq18>]

]
] <tra:projection-deletion:recursion>

#proof[
  First, a positive-matrix trace comparison gives
  #[#set math.equation(numbering: n => "(109)")
   $ "Tr" \| T_n \|^(2 p') med lt.eq med "Tr" (X^(p' \/ 2) Y^(p' \/ 2) X^(p' \/ 2) Y^(p' \/ 2)) . $ <tra:projection-deletion:eq19>]
  Apply Lemma 9 with $A_2 = T^(upright("row"))$, $A_1 = T^(upright("col"))$, $P = 2 p'$ and $q = 4$. Then $X = \| A_2 \|^2$, $Y = \| A_1^(*) \|^2$, giving exactly (109).
  Write $x \( A \) = product_i x_i \( A_i \)$ for the coefficients as a density relative to uniform row permutations of $X^(p' \/ 2)$; similarly $y \( B \) = product_c y_c \( B_c \)$ for $Y^(p' \/ 2)$. The individual positive line operators are $X_i^(p' \/ 2)$ and $Y_c^(p' \/ 2)$. Applying Lemma 14 to these operators, before normalizing their squared coefficient masses, gives
  #[#set math.equation(numbering: n => "(110)")
   $ "Tr" \| T_n \|^(2 p') med lt.eq med frac(n !, \( a ! \)^b \( b ! \)^a) med bb(E)_(upright("unif")) [upright(bold(1))_(upright("valid")) \| x \( A \) \|^2 \| y \( B \) \|^2] . $ <tra:projection-deletion:eq20>]
  For the line norms we use Lemma 10 in each subgroup’s own regular representation. With $q = 2 \/ \( 1 + theta \)$, the Schatten $q$ norm of $X_i^(p' \/ 2)$ in its own regular representation is at most $2^(1 \/ q)$ by (107), and similarly for $Y_c^(p' \/ 2)$. Consequently the individual densities in (110) have the needed $2 \/ \( 1 - theta \)$-norms bounded by 2. Apply (106) to their absolute values. Since by Stirling’s estimate
  $ log (frac(n !, \( a ! \)^b \( b ! \)^a)) = n + O \( sqrt(n) log n \) \, $
  (110) proves (108). ◻
]

#thm([Theorem 10.5.])[
  #emph[There are real numbers $p_n gt.eq 2$, indexed by dyadic $n gt.eq 2$, with $sup_n p_n < oo$ such that  
#[#set math.equation(numbering: n => "(111)")
 $ "Tr"_(G_n) \| T_n \|^(2 p_n) med lt.eq med 1 + 1 / 8 . $ <tra:projection-deletion:eq1>]

]
] <tra:projection-deletion:moment>

#proof[
  The rectangle estimate leaves a subexponential regular-trace error. We remove it by separating the low levels, controlled by Proposition 44, from the higher levels, whose regular multiplicities are large. For large $n$, use $n^0.995$ as the threshold for level. On all types with $1 lt.eq k lt.eq n^0.995$, we already have, independently of (107), enough decay for the trace estimate (111) at a sufficiently large absolute power $p_(upright("low"))$. Indeed each $d_lambda lt.eq n^k$ by occurrence on injection tuples, and there are at most $2^k$ diagrams at that level. Using (93), for $n$ sufficiently large and any $s gt.eq p_(upright("low"))$, the total contribution of these types to $"Tr" \| T_n \|^(2 s)$ is $o \( 1 \)$; for example $M_0 k \/ n lt.eq n^(- 0.004)$ there, so we can sum the bounds $2^k n^(2 k) \( n^(- 0.004) \)^(alpha k p_(upright("low")))$.
  For any type not annihilated by $T_n$, the number of rows of the diagram is at most $n \/ 2$. Indeed it needs invariants for the flip subgroup of one dimension, a product of $n \/ 2$ copies of the two-point symmetric group, so the Pieri rule builds its diagram by adding $n \/ 2$ horizontal strips. For such diagrams with $k > n^0.995$ and sufficiently large $n$, we have
  #[#set math.equation(numbering: n => "(112)")
   $ d_lambda med gt.eq med exp \( c n^0.995 \) $ <tra:projection-deletion:eq21>]
  with absolute $c > 0$. One quick count of tableaux is by ordering the boxes according to increasing sum of their two coordinates, with arbitrary order within each antidiagonal. If there are $l$ antidiagonals the factorials of their sizes give a product at least $2^(n - l)$. Here $l = max_i \( i + lambda_i - 1 \) lt.eq sqrt(n) + max \( lambda_1 \, n \/ 2 \)$ since $i lambda_i lt.eq n$, proving (112).
  When (107) holds and $n$ is sufficiently large, (108) gives
  $ "Tr" \| T_n \|^(2 p') lt.eq exp \( n^0.99 \) . $
  We apply Lemma 19 with $nu = 2$, $epsilon = 1 \/ 8$ and $P = max \( p_(upright("low")) \, 2 \)$. The low class consists of the first-row levels $1 lt.eq k lt.eq n^0.995$ together with the annihilated blocks; its contribution is at most $1 \/ 16$ above an absolute threshold. The remaining blocks satisfy (112). Thus the parameters in the common lemma are
  $ E_n = n^0.99 \, #h(2em) H_n = c n^0.995 \, #h(2em) alpha_d = 1 + C_3 \/ log a \, #h(2em) delta_d = 1 \/ log n . $
  The child bound $1 + 1 \/ 8$ implies the bound $2$ required in (107), and all size thresholds are independent of the inherited exponent. Moreover,
  $ \( 1 + delta_d \) E_n - delta_d H_n = \( 1 + 1 \/ log n \) n^0.99 - c n^0.995 \/ log n arrow.r - oo \, $
  while $alpha_d \( 1 + delta_d \) = 1 + O \( 1 \/ d \)$. The lemma supplies bounded parameters $p_n$ and proves (111).
  Proposition 16, with singular moment exponent $2 sup_n p_n$ and remainder $1 \/ 8$, now gives the mixing bound after an absolute number of sweeps. The lower bound in physical shuffle units is Lemma 6. ◻
]

== 11 First interactions and indexed singular values <tra:first-interactions>

Coordinate deletion tracks a representation statistic through a split. The next argument instead stops paths at their first interactions. We combine its sparse norm estimate with a projection overlap bound to retain the singular rank inside each irreducible block.

This method controls every singular index within an irreducible representation. Its sparse argument orders the first interactions of labels and deletes them in reverse order. Its dense argument charges coloring constraints to conditional total correlation. The resulting rank estimate closes under a balanced split of the bit directions.

Write $T_n$ for the sweep operator, $V_lambda$ for an irreducible representation of $S_n$, and $D_lambda = dim V_lambda$. Each trace is unnormalized. The index in the next theorem belongs to a single irreducible block; its contribution to a regular trace is repeated $D_lambda$ times. We first control blocks close to the trivial representation directly from their paths. A compatibility estimate then handles the other blocks and permits induction on the bit length.

#thm([Theorem 11.1.])[
  #emph[]
  #emph[ There is an absolute finite $p_(*) > 0$ such that, for every dyadic $n$, every partition $lambda tack.r n$, and every $1 lt.eq i lt.eq D_lambda$, 
#[#set math.equation(numbering: n => "(113)")
 $ s_i \( T_n \( lambda \) \) lt.eq \( D_lambda i \)^(- 1 \/ \( 2 p_(*) \)) . $ <tra:first-interactions:eq1>]

 The singular values are listed in decreasing order within one copy of $V_lambda$.]
] <tra:first-interactions:singular>

=== 11.1 A sparse estimate by deleting first interactions <a-sparse-estimate-by-deleting-first-interactions>

A representation whose first row has length $n - k$ first occurs in the action on $k$ ordered distinct cards. On its new part, any term that ignores a card vanishes. This cancellation forces every tracked card to interact with another one. Our immediate task is to show that such complete coverage has small operator norm when $k lt.eq n^.99$. The following occupation estimate will control the exceptional starting configurations.

#thm([Lemma 11.2.])[
  (Occupation bounds for partially coupled paths).  #emph[Start a set of $r$ cards at distinct sites of the binary cube and move them by one complete coordinate sweep. Independently, move $s$ further walkers, each by its own fair bit in every coordinate; these walkers may have coincident endpoints. For disjoint sets of sites $A_1 \, dots.h \, A_L$, let $N_i$ count all $r + s$ endpoints in $A_i$, with repetitions counted for the independent walkers. For nonnegative integers $h_i$, 
$ bb(E) product_i binom(N_i, h_i) lt.eq product_i frac(\( \( r + s \) \| A_i \| \/ n \)^(h_i), h_i !) . $

 In particular the same right side bounds $Pr { N_i gt.eq h_i upright(" for every ") i }$. The assertion also holds with the coordinate order reversed.]
] <grid:occupation>

#proof[
  Let $eta \( x \)$ be the occupation indicator for the $r$ jointly moved cards, and $p_x = bb(E) eta \( x \)$. At the deterministic initial set, $bb(E) product_(x in A) eta \( x \) lt.eq product_(x in A) p_x$ for every set $A$. A fair switch on $u \, v$ preserves this family of inequalities. If $A$ contains neither endpoint there is no change. If it contains one endpoint, averaging the two old inequalities replaces its marginal by $\( p_u + p_v \) \/ 2$. If it contains both, the occupation product is unchanged and $p_u p_v lt.eq \( \( p_u + p_v \) \/ 2 \)^2$. Disjoint switches can be applied successively, proving preservation through the sweep. At its end every $p_x = r \/ n$, because the endpoint of each individual card is uniform. Summing over distinct tested sites in the disjoint $A_i$ therefore bounds the joint binomial moments for these cards by $product_i \( r \| A_i \| \/ n \)^(h_i) \/ h_i !$.
  The independent walkers have multinomial factorial moments bounded by the same expression with $s$ in place of $r$: assign the tested hits to distinct walkers, and use their uniform independent endpoints. Expand each binomial coefficient of the sum of the two counts using Vandermonde’s identity. Independence of the two populations and the binomial theorem replace $r$ and $s$ by $r + s$. This proves the stated bound. No part of this proof depends on which coordinate is updated first. ◻
]

#thm([Lemma 11.3.])[
  #emph[]
  #emph[ For some absolute $c_s > 0$ and all sufficiently large $n$, if $1 lt.eq k = n - lambda_1 lt.eq n^.99$, then 
#[#set math.equation(numbering: n => "(114)")
 $ parallel T_n \( lambda \) parallel_(upright("op")) lt.eq n^(- c_s k) . $ <tra:first-interactions:eq2>]

]
] <tra:first-interactions:sparse>

#proof[
  To see this, take the sweep kernel on $k$-tuples, with row variable $x = \( x_1 \, dots.h \, x_k \)$ the input tuple and column variable $y$ the output tuple. Actions on tuples, or on functions of them, estimate the same singular values on $lambda$. For two tuple labels $u \, v$, set
  $ h = h \( u \, v \) = max { i : \( x_u \)_i eq.not \( x_v \)_i } \, #h(2em) l = l \( u \, v \) = min { i : \( y_u \)_i eq.not \( y_v \)_i } $
  for distinct tuple entries as here. Define
  $ w \( h \, l \) = cases(delim: "{", 1 & l < h \,, 2 & l = h \,, 0 & l > h .) $
  Then the tuple kernel is
  #[#set math.equation(numbering: n => "(115)")
   $ n^(- k) product_(u < v) w \( h \( u \, v \) \, l \( u \, v \) \) . $ <tra:first-interactions:eq3>]
  Indeed given endpoints, paths replace one bit after another in $x$ by the corresponding bit of $y$. They must remain nonoverlapping as paths through positions. For a pair, if the output bits below $h$ (indices $< h$) agree, the paths would use the same switch at $h$, where output bits must be opposite. When compatible they use either no common switch or that one, by the bit replacement order. Thus pair conditions suffice, and each shared switch gains a factor 2 compared to probabilities for independent paths.
  For $J subset \[ k \]$, put
  $ Q_J \( x \, y \) = n^(- k) product_({ u \, v } subset J) w \( h \( u \, v \) \, l \( u \, v \) \) . $
  This is the restriction (to our distinct tuples) of the kernel using the joint shuffle only on labels in $J$, and placing the other output labels independently uniformly; likewise its transpose is restricted from using the reverse shuffle jointly only on $J$. In particular each of its row and column sums is at most 1. In bounding the block on $lambda$ we can replace (115) by
  $ Z = sum_(J subset \[ k \]) \( - 1 \)^(k - \| J \|) Q_J . $
  Indeed proper-subset terms can be dropped on compression to the $lambda$-isotypic space. Their images or the images of their transposes are in subspaces of functions depending only on a shorter tuple, which have no $lambda$ part.
  Make the interaction graph on $\[ k \]$ for $\( x \, y \)$ by using an edge for $u \, v$ if $\( y_u \)_i = \( y_v \)_i$ for all $i < h \( u \, v \)$; the edge time is $h \( u \, v \)$. The sum for $Z$ vanishes if there is an isolated label, by cancellation. Thus it suffices for norm bounds to use nonnegative kernels $Q_J$, summed but restricted by the coverage condition (all labels have an interaction).
  Put $epsilon.alt = .01$, so that $k lt.eq n^(1 - epsilon.alt)$, and take $alpha = epsilon.alt \/ 2$. We use the dyadic cells from the input hierarchy: a cell of size $2^h$ specifies the bits of index $> h$. For an input $x$, call a label bad if it is in some such cell of size $t$ where the label count $r$ from $x$ satisfies
  $ r gt.eq 2 \, #h(2em) r > t n^(- alpha) . $
  Otherwise call the label good. Split rows into bad rows (at least $k \/ 2$ bad labels) and the other rows (called good rows).
  Here are two probability bounds for this split.
  - Given $y$, the column sum of $Q_J$ over bad rows is $n^(- Omega \( k \))$, meaning bounded by $n^(- c k)$ for an absolute $c > 0$ for all sufficiently large $n$, uniformly. In the transpose experiment the output considered here is $x$. We will use factorial moment bounds on counts in cells. Lemma 50, with $r = \| J \|$ and $s = k - \| J \|$, gives, for disjoint cells of sizes $t_i$ and required counts $r_i$,
    #[#set math.equation(numbering: n => "(116)")
     $ Pr { N_i gt.eq r_i upright(" for all ") i } lt.eq product_i frac(\( k t_i \/ n \)^(r_i), r_i !) . $ <tra:first-interactions:eq4>]
    This bound is used before restriction to distinct output tuples; that restriction can only decrease a column sum of the nonnegative kernel.
    A bad row gives a family of disjoint cells (take maximal ones from the bad-label definition), where
    $ r_i gt.eq 2 \, #h(2em) t_i \/ r_i lt.eq n^alpha \, #h(2em) k \/ 2 lt.eq R_0 = sum r_i lt.eq k $
    with $r_i$ their counts. We spell out a union bound. For choices of ordered sizes and counts, multiplying (116) by $product_i n \/ t_i$ allows the choices of locations. Using $r ! gt.eq \( r \/ e \)^r$, the result is at most
    $ product_i [e^(r_i) k / r_i (frac(k t_i, n r_i))^(r_i - 1)] lt.eq e^k k^L n^(- \( epsilon.alt - alpha \) \( R_0 - L \)) . $
    In summing over ordered lists we divide by $L !$, since we seek unordered families of distinct cells. The factor $k^L \/ L !$ is at most $e^k$. The remaining number of size and count lists over lengths and totals is bounded by $\( C \( d + 1 \) \)^(C k)$ using compositions, for some absolute $C$. Since $R_0 - L gt.eq R_0 \/ 2 gt.eq k \/ 4$, this proves the column bound.
  - Given $x$ in a good row, the row sum of $Q_J$ subject to coverage is $n^(- Omega \( k \))$, uniformly. Simulate $Q_J$ before restriction by using independent personal fair bits for each label at each time. Labels outside $J$ just use these bits; labels in $J$ also do, except that when two in $J$ use the same switch we use one of their bits (chosen, say, by label index) and its opposite for the two respective new position bits. This generates the kernel since placements of the $J$ labels need only this joint use of bits, independently at each switch. Only $J$-labels count for this bit-sharing rule.
    We track the first interaction of a label in the interaction graph (now defined by the output bits whether or not all outputs end up distinct). Until its first interaction its output bits come from its own personal bits. Indeed an actual $J$-pair at a switch at time $h$ must have highest differing input bit $h$ and matching lower output bits, as the $J$-positions have stayed distinct.
    If all good labels have interactions, we can select a subset $D$ of them of size at least half the number of good labels, and for each $u in D$ specify a partner $v \( u \)$ witnessing its first interaction, so that if the partner also belongs to $D$, its first time is strictly earlier. To justify the selection, look at labels having their first interaction at a given switch, defined by its time $h$, the fixed higher input bits, and the common lower output bits. On either of the two sides of this switch there is at most one label having its first interaction there. Two labels on that same side, arriving with the same lower output bits, would have an interaction at their own highest differing input bit, which would be earlier. Hence at most two have their first interaction there. In case two good labels first interact there, we can omit one to avoid ties; one good label alone with first interaction there needs no omission (partners not required to be selected).
    For fixed specifications with times $h_u = h \( u \, v \( u \) \)$, the probability of these witnesses with the stated first-time property is bounded by
    #[#set math.equation(numbering: n => "(117)")
     $ product_(u in D) 2^(- \( h_u - 1 \)) . $ <tra:first-interactions:eq5>]
    To see this without independence assumptions about the partners, take labels in $D$ of largest specified time $h$, and compare with the simulation deleting those labels, using the same personal bits of the rest. On the witness event the rest follow the deletion simulation through time $h - 1$, since no deleted label has interacted before then. Earlier witnessing events persist in that simulation. Each deleted label must match its specified partner on the first $h - 1$ output bits, and on the event uses personal bits up to then. Its partner belongs to the rest by the selection condition. With the rest’s personal bits given, these necessary matches have probability $2^(- \( h - 1 \))$ per deleted label, independently for the purpose of this bound. This gives (117) by successive deletion; equivalently we sum specifications only where within $D$ partners are of strictly earlier specified time.
    For one good label $u$, the sum over possible partners of $2^(- \( h \( u \, v \) - 1 \))$ is at most $2 d n^(- alpha)$. For a contributing level $h$, the cell of size $2^h$ containing $u$ contains a partner and so contains at most $2^h n^(- alpha)$ labels since $u$ is good. Because in a good row there must be a witness specification with $\| D \| gt.eq k \/ 4$ if coverage holds, summing (117) over the subsets and partners gives the row bound for large $n$.
  For $Z$ we can sum these bounds with a $2^k$ factor. On the good-row portion, one has small row sums in absolute value by the second bound and at most $2^k$ for absolute column sums. On the bad-row portion, the first bound gives small column sums, and row sums in absolute value are at most $2^k$. The row-column sum bound on operator norm now gives $parallel Z parallel_(upright("op")) lt.eq n^(- Omega \( k \))$. This proves (114). ◻
]

=== 11.2 Conditional total correlation in a rectangle <tra:first-interactions:balanced-grid-setup>

The sparse argument is complete: ignoring any one label kills the new representation level, and the remaining path systems are rare on good rows or on bad columns. We now turn to the large-dimensional blocks. A balanced split reduces them to products of smaller sweep operators. The missing input is a bound on the overlap of their Fourier subspaces, which we obtain by estimating the probability of row–column compatibility. In it we regard positions as an $a times b$ rectangle, $a b = n$, with

$ a \, b in \[ sqrt(n) \/ sqrt(2) \, sqrt(2) sqrt(n) \] . $

Use subgroups $H \, J_0$ of the symmetric group $G$ on the rectangle: $H$ permutes positions separately within each column (so $H = \( S_a \)^b$ in symmetric group notation), and $J_0$ does so in each row. Below, logs for entropy and estimates are natural. We continue to allow all bound constants to be absolute and to consider sufficiently large sizes.

We will need the following probability estimate.

#thm([Proposition 11.4.])[
  #emph[]
  #emph[ Draw elements $h in H$ (column permutations $h_v \, med 1 lt.eq v lt.eq b$) and $j in J_0$ (row permutations $j_r \, med 1 lt.eq r lt.eq a$) with all permutations independent, from possibly nonuniform laws. Suppose on each factor the pointwise density versus uniform is bounded, with the product of those upper bounds $e^z$. Then 
#[#set math.equation(numbering: n => "(118)")
 $ Pr { h j in J_0 H } lt.eq exp { - n + C n^.98 + C z \/ log n } . $ <tra:first-interactions:eq6>]

 Here $h j$ means apply $j$ and then $h$. The coefficient of $- n$ is essential: the later regular-trace normalization contributes $+ n$ to leading order.]
] <tra:first-interactions:grid>

#proof[
  For given $j$, make a bipartite multigraph between left vertices $u$ and right vertices $v$, both sets indexing columns. Each initial site $\( r \, u \)$ gives an edge, of row $r$, from $u$ to $v = j_r \( u \)$. Each vertex has degree $a$. Color this edge by $h_v \( r \)$, a color from $\[ a \]$, so colors are all used once at each right vertex. If $h j in J_0 H$, every left vertex also sees every color once, since cards of each initial column must go one to each final row. Call this a valid coloring. (This condition also suffices, though necessity is enough.)
  Condition the experiment on the event in (118), assuming positive probability. Its log inverse probability is the relative entropy of this new law with respect to the original experiment. Write it as
  $ L = L_j + L_h + L_(upright("corr")) \, $
  where:
  - $L_j$ is the relative entropy paid for the new marginal of $j$;
  - $L_h$ is the sum, averaged over this marginal of $j$, of relative entropies paid for the individual column permutation marginals conditional on $j$, versus their original independent laws;
  - $L_(upright("corr"))$ is the conditional total correlation among the column permutations given $j$, i.e., the relative entropy against the product of their conditional marginals (averaged over $j$).
  All are nonnegative. Write $z_j \, z_h$ for the parts of $z$ from the row, column factors, respectively. The relative entropy of the new marginal of $j$ versus independent uniform row permutations is at most $L_j + z_j$. The sum of relative entropies of the column permutation marginals given $j$, each versus uniform, is in expectation at most $L_h + z_h$. These comparisons follow from the density upper bounds.
  Estimate $L_(upright("corr"))$ by exposing right vertices one by one. In this argument we are in the conditioned experiment, in particular the coloring is valid. Fix $j$, and take an order from independent uniform priorities in $\[ 0 \, 1 \]$ for the right vertices, independent of everything else. By the chain rule, the conditional total correlation is the sum of the mutual informations between each $h_v$ and the preceding $h$-variables (for fixed order, given $j$). Within $h_v$ expose entries in row order $1 \, dots.h \, a$ and use the chain rule again. Consider the entry corresponding to a particular edge, from left vertex $u$ to $v$, and condition also on earlier entries at $v$, but not yet other columns’ information. Denote by $p_c$, $c in \[ a \]$, the conditional law of this entry. We use mutual information of the color with the preceding vertices, for the conditional law (and average over these conditionings). For a fixed set of preceding vertices, if the color is $c$, none of those vertices can have color $c$ on an edge from $u$. Thus, writing mutual information as the average relative entropy of the preceding vertices’ variables given the color versus their marginal here, a lower bound for this term is
  #[#set math.equation(numbering: n => "(119)")
   $ sum_c p_c (- log Pr { upright("color ") c upright(" not used from ") u upright(" at preceding vertices") }) . $ <tra:first-interactions:eq7>]
  This uses the marginal not given the color inside the $- log$, with the conditioning on $j$ and earlier entries at $v$ still in force; the bound follows from relative entropy for a law supported on an event.
  If $v$’s priority is $t$, average the preceding set over the other priorities. For color $c$, write
  $ delta_c = Pr { upright("the edge from ") u upright(" colored ") c upright(" goes to ") v } $
  in the same conditional law not given the entry. Validity implies that the survival probability inside (119), averaged over priorities at the other vertices, is $1 - t + t delta_c$. Jensen’s inequality and integrating in $t$ now lower bound the expected term by
  #[#set math.equation(numbering: n => "(120)")
   $ sum_c p_c integral_0^1 - log \( 1 - t + t delta_c \) thin d t . $ <tra:first-interactions:eq8>]
  For $delta_c = 0$ the integral is 1. For all $0 lt.eq s lt.eq 1$, the integral with $delta_c = s$ is nonnegative and at least $1 - C sqrt(s)$: the loss from 1 in the interior is $s log \( 1 \/ s \) \/ \( 1 - s \)$.
  Call an edge heavy in parallelism if its endpoints have edge multiplicity greater than $a^(1 \/ 2)$. We may discard (120) for these edges. On another edge $sum_c delta_c lt.eq a^(1 \/ 2)$. For the colors with $p_c lt.eq a^(- .7)$, we have
  $ sum_(c : p_c lt.eq a^(- .7)) p_c sqrt(delta_c) med lt.eq med #scale(x: 180%, y: 180%)[\(] sum_(c : p_c lt.eq a^(- .7)) p_c delta_c #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) med lt.eq med a^(- .1) . $
  For the other colors we allow a loss up to their total $p_c$-mass instead in (120). Consequently, summed over edges and averaged, (120) bounds $L_(upright("corr"))$ below by $n$, less the expected number of edges heavy in parallelism, the sum of the exceptional masses with $p_c > a^(- .7)$ (averaged), and $C n a^(- .1)$.
  We check the sizes of these losses using the marginal divergences above. We use the elementary estimate
  #[#set math.equation(numbering: n => "(121)")
   $ D \( P bar.v.double Q \) med gt.eq med s P \( F \) - log \( 1 + Q \( F \) \( e^s - 1 \) \) $ <tra:first-interactions:eq9>]
  for $s > 0$ and an event $F$, by the entropy inequality (or just projecting to $F$). For $h_v$ given $j$, in the chain of exposing entries use as reference a uniform permutation. Except at most $ceil.l a^.9 ceil.r$ late entries per column, it has at least $a^.9$ remaining possibilities. The uniform conditional chance to hit the exceptional set for the current $p$ is then at most $a^(- .2)$ (there are at most $a^.7$ such colors). Use (121) with $s = .09 log a$ at these exposures, with the set fixed conditional on earlier entries and $j$. The relative entropies sum by the chain rule. This bounds the total expected exceptional mass over the edges, including the late-entry loss, by
  #[#set math.equation(numbering: n => "(122)")
   $ C #scale(x: 120%, y: 120%)[\(] \( L_h + z_h \) \/ log a + n a^(- .1) #scale(x: 120%, y: 120%)[\)] . $ <tra:first-interactions:eq10>]
  For parallelism, consider the new marginal law of $j$ against the reference of independent uniform permutations. Expose $j$ by rows (all of one row permutation, then the next) and within each by successive entries. For an entry corresponding to left vertex $u$, count a hit if the target vertex has occurred as target from $u$ already at least $a^.4$ times before the entry. There are at most $a^.6$ possible hit targets given the earlier entries. At least half the edges heavy in parallelism give hits (in the sense that their endpoint pairs with multiplicity above $a^(1 \/ 2)$ give hits on at least half those occurrences, for large $a$). Again discount at most $ceil.l b^.9 ceil.r$ late exposures per permutation where the number of possibilities under uniform may be small. Otherwise the uniform conditional chance of a hit is at most $C b^(- .3)$, since $a \, b$ are comparable. Applying (121) with $s = .09 log b$ as before, the expected number of edges heavy in parallelism is at most
  #[#set math.equation(numbering: n => "(123)")
   $ C #scale(x: 120%, y: 120%)[\(] \( L_j + z_j \) \/ log b + n b^(- .1) #scale(x: 120%, y: 120%)[\)] . $ <tra:first-interactions:eq11>]
  This bounds the loss even if $j$ acquires strong correlations upon conditioning.
  The lower bound from (120), with (122) and (123), gives
  $ L_(upright("corr")) gt.eq n - C n^.98 - C thin \( L_h + L_j + z \) \/ log n $
  where we use comparability and have loosened the numerical power. In $L$, the losses involving $L_h \, L_j$ are paid for by those terms themselves. Thus for sufficiently large $n$ this proves (118). ◻
]

=== 11.3 Crossing projections and dyadic singular bands <tra:first-interactions:subgroup-product-setup>

Here is how we use the rectangle estimate. By splitting the bit list into segments of lengths $floor.l d \/ 2 floor.r \, ceil.l d \/ 2 ceil.r$, the sweep product takes the form

$ A B \, $

where $A \, B$ are group-algebra operators on $H \, J_0$, respectively. The roles of rows and columns may be named to have this form. Each operator on its own subgroup is a tensor product (law of independent sweeps) on the separate columns or rows, with the corresponding smaller sizes $a \, b$. All estimates below are unchanged if using adjoint operators consistently.

#thm([Lemma 11.5.])[
  #emph[]
  #emph[ For orthogonal projections $P \, Q$ in the subgroup algebras of $H \, J_0$, suppose each is a tensor product over that subgroup’s factors. Let their regular ranks, meaning their ranks in the regular representation of the respective subgroup, be $r_H \, r_J$, assumed nonzero. Put $z = log \( r_H r_J \)$. We claim that on any irreducible $lambda$ of $G$, 
#[#set math.equation(numbering: n => "(124)")
 $ D_lambda parallel \( P Q \) \( lambda \) parallel_4^4 med lt.eq med exp #scale(x: 120%, y: 120%)[\(] C n^.98 + \( 1 + C \/ log n \) z #scale(x: 120%, y: 120%)[\)] \, $ <tra:first-interactions:eq12>]

 where $parallel dot.op parallel_4$ is Schatten 4-norm.]
] <tra:first-interactions:crossing>

#proof[
  It suffices to bound the full regular trace of $P Q P Q$, since its irreducible contributions are nonnegative fourth powers with regular multiplicity. Lemma 14, applied to the local projections, gives
  #[#set math.equation(numbering: n => "(125)")
   $ "Tr"_(upright("reg")) \( P Q P Q \) lt.eq frac(\| G \|, \| H \| \| J_0 \|) thin r_H r_J thin Pr { h j in J_0 H } . $ <tra:first-interactions:eq13>]
  Here the line permutations are independent under their normalized squared-coefficient laws, each with density bounded by its local regular rank. These ranks multiply to $r_H r_J = e^z$, so (118) applies with exactly the chosen $z$. Finally
  $ frac(\| G \|, \| H \| thin \| J_0 \|) = frac(n !, \( a ! \)^b \( b ! \)^a) med lt.eq med exp \( n + C sqrt(n) log n \) $
  by Stirling’s formula. Combining in (125) proves (124), allowing adjustment of the constant in $C n^.98$. The main exponential here is why we used the coloring estimate in addition to ranks. ◻
]

#proof[
  We perform the singular-value induction. The preceding fourth-moment estimate has an error independent of the eventual Schatten exponent. We retain that property while summing the spectral bands; it lets the induction begin from any sufficiently large finite exponent without changing the cutoff in $n$. Suppose for the two smaller sizes the bound in (113) holds with $p_0$ (in place of $p_(*)$), where we can take the larger of the two parameters, always at least 2. We will show how along induction it suffices to increase this parameter by factors at most $1 + O \( 1 \/ log n \)$ for all sufficiently large sizes.
  Take
  $ p = p_0 \( 1 + C_0 \/ log n \) $
  with $C_0$ large enough, absolute. For each $lambda$, we will bound a Schatten trace of $A B$ on the irreducible. Write $X = A^(*) A$, $Y = B B^(*)$. Lemma 9, applied on the irreducible block with $A_2 = A$, $A_1 = B$, $P = 2 p$ and $q = 4$, gives
  #[#set math.equation(numbering: n => "(126)")
   $ "Tr" \| A B \|^(2 p) med lt.eq med parallel X^(p \/ 4) Y^(p \/ 4) parallel_4^4 . $ <tra:first-interactions:eq14>]
  Decompose in the subgroup algebras to bound the right side. For $X$, on each of the $b$ column factors take the irreducible matrix-block decomposition and, within each irreducible, the eigenbasis of the corresponding factor of $X$, in order of decreasing eigenvalue. Group indices within this matrix-block into dyadic intervals $\[ R \, 2 R \)$ truncated at its dimension (here $R = 1 \, 2 \, 4 \, dots.h$). Each such interval gives a projection in that factor group algebra of regular rank
  $ m dot.op \( upright("length of interval") \) \, $
  where $m$ is the dimension of this smaller irreducible. Taking tensor products gives projections $P$ as in (124) for $H$ that sum to identity. By the smaller-size hypothesis, for each such choice
  #[#set math.equation(numbering: n => "(127)")
   $ parallel P X^(p \/ 4) parallel_(upright("op")) lt.eq r_H^(- p \/ \( 4 p_0 \)) \, $ <tra:first-interactions:eq15>]
  where the norm bound holds also after lifting to $G$. Indeed squared singular values from an interval on a factor are at most $\( m R \)^(- 1 \/ p_0)$; the interval length is at most $R$. The analogous decomposition of $Y$ over row factors gives $Q$ with $parallel Q Y^(p \/ 4) parallel_(upright("op")) lt.eq r_J^(- p \/ \( 4 p_0 \))$.
  The total number of pairs $P \, Q$ in these decompositions is at most
  #[#set math.equation(numbering: n => "(128)")
   $ exp \( C n^.8 \) . $ <tra:first-interactions:eq16>]
  In fact per factor of size $a$ or $b$, the number of partitions for its irreducibles is at most $exp \( C sqrt(a) \)$ or $exp \( C sqrt(b) \)$, and the number of dyadic intervals in each is at most polynomial in the factor size since dimensions are at most the factorial. The partition bound here is the standard elementary one; for example it follows by using $s = 1 \/ sqrt(a)$ and bounding the partition generating function at $e^(- s)$ by $exp \( C \/ s \)$, using its product formula (and likewise with $b$).
  Use the triangle inequality for Schatten 4-norm to sum terms on the right of (126), inserting these projections. For each $P \, Q$, by (124), (127) and the ideal property of Schatten norm, we have, on $lambda$,
  $ D_lambda parallel X^(p \/ 4) P Q Y^(p \/ 4) parallel_4^4 & lt.eq exp #scale(x: 120%, y: 120%)[\(] - \( p \/ p_0 \) z + C n^.98 + \( 1 + C \/ log n \) z #scale(x: 120%, y: 120%)[\)]\
 & lt.eq exp \( C n^.98 \) \, $
  with our choice of $C_0$. Now summing by (128) (triangle inequality before taking fourth powers) still gives by (126)
  #[#set math.equation(numbering: n => "(129)")
   $ D_lambda "Tr" \| T_n \( lambda \) \|^(2 p) lt.eq exp \( C_1 n^.98 \) \, $ <tra:first-interactions:eq17>]
  where $C_1$ is absolute. The placement of the Schatten powers in this proof means we do not have a loss from summing norm bounds raised later to a possibly very large $p$.
  To use (129) and finish the induction, we record simple dimension bounds. For shapes of height exceeding $n \/ 2$ the singular bound was automatic. For the rest with $k = n - lambda_1 gt.eq n^.99$, we have
  #[#set math.equation(numbering: n => "(130)")
   $ log D_lambda gt.eq c n^.99 $ <tra:first-interactions:eq18>]
  for large $n$, with an absolute $c > 0$. Here and later we can see this type of lower bound as follows. Transpose a partition if needed and let $u$ be its first row length after taking the larger of width and height. If $u < n \/ 8$, the hook lengths are at most $2 u$, so the dimension is at least $\( n \/ \( 2 e u \) \)^n$ by the hook formula. For $u gt.eq n \/ 8$, put $t = n - u$. The hook formula gives at least
  #[#set math.equation(numbering: n => "(131)")
   $ binom(n, t) exp (- C t / u log \( u + 1 \)) \, $ <tra:first-interactions:eq19>]
  since we may drop the dimension (a factor at least 1) of the partition below that row, and the correction to row factorial uses log factors $log \( 1 + c_j \/ \( u - j + 1 \) \)$, where $c_j$ counts cells below in column $j$. Indeed $j c_j lt.eq t$, and
  $ sum_(j = 1)^u log (1 + frac(c_j, u - j + 1)) lt.eq t sum_(j = 1)^u frac(1, j \( u - j + 1 \)) = frac(2 t, u + 1) sum_(j = 1)^u 1 / j . $
  This proves the displayed correction, including the range in which the tail is not small. For $n \/ 8 lt.eq u lt.eq n \/ 2$, (131) gives log dimension of order at least $c' n$. For $u > n \/ 2$ under our height restriction before transposition, $u = lambda_1$, so $t = k$; (130) follows using (131) and $binom(n, t) gt.eq \( n \/ t \)^t$.
  Hence in this dense case (129) yields
  $ s_i \( T_n \( lambda \) \) & lt.eq (frac(exp \( C_1 n^.98 \), D_lambda i))^(1 \/ \( 2 p \)) lt.eq \( D_lambda i \)^(- 1 \/ \( 2 p' \)) \, $
  where we can take $p' = p \( 1 + C_2 \/ log n \)$ for a suitable absolute $C_2$ and sufficiently large $n$, by (130).
  For $1 lt.eq k lt.eq n^.99$, (114) suffices, with a fixed absolute induction parameter, since $D_lambda i lt.eq n^(2 k)$ using occurrence on tuples and $i lt.eq D_lambda$. And for $k = 0$ the induction bound just says $1 lt.eq 1$. This completes the bounds used in the induction step.
  To formalize uniformity, use a fixed threshold for sufficiently large sizes, and below that threshold take a common finite induction parameter making the singular inequality true. This is possible by the strict finite-size gap in Lemma 5. Enlarge this starting parameter if necessary to be at least 2 and to handle the fixed parameter from (114). For $n = 2^d$ above threshold, by the step just proved the desired parameter need only multiply the larger child parameter (children of bit lengths $floor.l d \/ 2 floor.r \, ceil.l d \/ 2 ceil.r$) by at most $1 + C \/ d$, changing absolute constants. Their product is uniformly bounded by Lemma 18 with $gamma = 1$. Thus an absolute $p_(*)$ works for all sizes. This proves (113). ◻
]

=== 11.4 Mixing after a bounded number of sweeps <tra:first-interactions:fourier-summation-and-time-normalization>

The estimate (113) is an indexed bound on each irreducible block, with exponent $a = 1 \/ \( 2 p_(*) \)$ in the notation of Section 4. Its final conversion gives

$ 4 parallel mu_q - U parallel_(upright("TV"))^2 lt.eq sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(thin 2 - q \/ p_(*)) arrow.r 0 $

for any fixed integer $q$ with $q \/ p_(*) gt.eq 3$; sign and all taller annihilated shapes contribute zero. This uses matrix powers through Schatten or operator norm bounds and does not require normality of a sweep. Hence an absolute number of sweeps gives vanishing error and $t_(upright("mix")) \( d \) = O \( d \)$. Lemma 6 supplies the physical-time lower bound $2 d - O \( 1 \)$.

== 12 Harmonic lifting and two overlap estimates <tra:harmonic-overlaps>

First-interaction deletion is effective at very small levels. Harmonic lifting gives a different overlap estimate whose loss is exponential only in the diagram deficit. It can then be interpolated with a dense entropy estimate.

This proof obtains dimension decay from two different overlap estimates. A cell-by-cell entropy argument controls the full regular trace with a subexponential error. A harmonic tuple decomposition supplies a bound with an error exponential only in the deficit. Interpolating the two local singular decompositions preserves a positive exponent through the recursion.

All logarithms are natural unless specified otherwise. We use the rotating-coordinate sweep of Section 2; it is denoted by $T_n$ here.

Use the following grid for the sweep. Split the bits into its first $floor.l d \/ 2 floor.r$ and its remaining bits, and let $m = 2^(floor.l d \/ 2 floor.r) \, q = n \/ m$. The $q$ rows each have $m$ positions (columns). Put

$ H = S_m^q \, #h(2em) J = S_q^m $

for the row and column subgroups acting within rows and within columns, respectively. The first part of the sweep has independent $T_m$’s as components in $H$, and the second has independent $T_q$’s in $J$. Thus $T_n$ is a product with those two factors (we can take $T_1$ trivial).

Put $G = S_n$. All representation statements will be over $bb(C)$, with unitary models. By singular values in $lambda$ we mean in the irreducible $V_lambda$ of shape $lambda$; denote its dimension by $D_lambda$. We use Schatten norms (operator norm for $p = oo$); matrix traces and Schatten norms use ordinary, not dimension-divided, trace. We use the following uniform exponent.

#thm([Theorem 12.1.])[
  #emph[There is an absolute $a > 0$ such that]
  #emph[ 
#[#set math.equation(numbering: n => "(132)")
 $ s_r \( T_n upright(" in ") lambda \) med lt.eq med \( D_lambda r \)^(- a) \, #h(2em) 1 lt.eq r lt.eq D_lambda \, quad n upright(" a power of ") 2 \, $ <tra:harmonic-overlaps:eq1>]

 with singular values ordered largest first. The claim as written allows 1 on a one-dimensional representation; on the nontrivial sign we can in fact use 0.]
] <tra:harmonic-overlaps:singular>

We recall some standard results of representation theory that we use. We use symmetric group irreducibles indexed by partitions, with dimensions given by standard tableaux or the hook-length formula; transpose shapes have equal dimension. We use the content formula #cite(label("VershikOkounkov2005")) Eq. (2.1), Proposition 5.3, Theorem 5.8 that the sum of all transpositions acts in shape $lambda$ as the sum of contents (column minus row) of its boxes. We also use the Pieri rule: in restriction to a product of two symmetric groups, the components trivial on the factor of size $b$ are given on the other factor by removing a horizontal strip of size $b$, with multiplicity one per such shape. Equivalently one can use induction with the trivial representation of the indicated factor. In particular, invariance under the subgroup of independent switches at the first layer requires a shape obtainable by adding $n \/ 2$ horizontal strips of size 2, so

#[#set math.equation(numbering: n => "(133)")
 $ T_n upright(" in ") lambda = 0 quad upright("if ") lambda'_1 > n \/ 2 \, $ <tra:harmonic-overlaps:eq2>]

where prime denotes transpose.

For $mu tack.r M$, set $j = M - mu_1$, the deficit, and let $macron(mu)$ be the shape below the top row. Write

$ B_mu = D_mu \/ D_(macron(mu)) . $

The hook formula, taking the contribution of just the top row, gives

#[#set math.equation(numbering: n => "(134)")
 $ 2^(- j) binom(M, j) med lt.eq B_mu lt.eq binom(M, j) . $ <tra:harmonic-overlaps:eq3>]

Indeed the factor by which the hook product along that row exceeds $mu_1 !$ is at most $2^j$, by the numbers of boxes below the boxes along the row. Also throughout we can use

#[#set math.equation(numbering: n => "(135)")
 $ \( M \)_t \/ M^t med gt.eq med e^(- C t) #h(2em) \( 0 lt.eq t lt.eq M \) \, $ <tra:harmonic-overlaps:eq4>]

with $\( M \)_t = M \( M - 1 \) dots.h.c \( M - t + 1 \)$; for example average the negative logs of the factors, bounding by the average for $t = M$.

We will work with projections specified locally in the grid as follows. In one row take an orthogonal projection in the matrix algebra of one specified irreducible $mu tack.r m$, of rank $l$, extended by zero on the other irreducibles. We may suppose projections are nonzero. Regard it as a group algebra projection on the row group. Its rank in the regular representation of that group is $D_mu l$. Suppose we choose such projections in every row, which tensor together to give $P_H$, and similarly choose a projection $P_J$ using columns. Use $R_H$, $R_J$ to denote products of the regular ranks of the local projections on the respective sides, or upper bounds given by products of local upper bounds. We study the overlap $P_H P_J$, including in individual irreducibles of $G$.

=== 12.1 A regular overlap from cell entropy <a-regular-overlap-from-cell-entropy>

#thm([Proposition 12.2.])[
  #emph[]
  #emph[ For the balanced sizes $m \, q$ here, let $L = log n$, and for sufficiently large $n$ write $epsilon.alt = L^(- 1 \/ 5)$. We claim 
#[#set math.equation(numbering: n => "(136)")
 $ parallel P_H P_J parallel_(4 \, upright("reg") \( G \))^4 lt.eq \( R_H R_J \)^(1 + epsilon.alt) exp { n exp \( - L^(1 \/ 2) \) } . $ <tra:harmonic-overlaps:eq5>]

 This estimate in particular bounds the Schatten norm within shape $lambda$, with the fourth power on the right divided by $D_lambda$, by the multiplicity in the regular representation.]
] <tra:harmonic-overlaps:dense>

#proof[
  Write the ordinary group algebra coefficients of the projections as $p \( h \) \, w \( y \)$ on $H \, J$, so their sums give the operators without a uniform-measure prefactor. Lemma 14, applied to the local projections in this normalization, bounds $parallel P_H P_J parallel_(4 \, upright("reg") \( G \))^4$ by
  #[#set math.equation(numbering: n => "(137)")
   $ n ! sum_(\( h \, y \) : thin \( h y \)^(- 1) in H J) \| p \( h \) \|^2 \| w \( y \) \|^2 . $ <tra:harmonic-overlaps:eq6>]
  The condition has a useful description. In the grid of middle positions in a product $h y$, the column permutation step leading up to a middle position gives a source-row symbol, and the row permutation step from it gives a target-column symbol. Thus there is one column symbol at each cell $\( i \, b \)$, with these symbols a permutation of $\[ m \]$ along each row $i$; and there is one row symbol there, a permutation of $\[ q \]$ along each column $b$. The condition is that the pairs of symbols cover the $m q = n$ possibilities once each. In fact, to go back by another product in $H J$, each target column must send the ending row indices to the prescribed source rows by a permutation, which requires and, for this part, is ensured by this pair condition. Then within any resulting source row we get the prescribed permutation to restore the source columns as well.
  The same lemma normalizes the squared line coefficients as independent probability laws whose densities relative to uniform are bounded by the local regular ranks. Consequently (137) is at most
  #[#set math.equation(numbering: n => "(138)")
   $ frac(n ! R_H R_J, \| H \| \| J \|) thin Pr \( upright("pair covering condition") \) \, $ <tra:harmonic-overlaps:eq7>]
  where permutations across rows and columns are independent with tilted laws, each having density against uniform bounded by the local regular rank (we can use its upper bound; the laws come from the normalized squares). Inverses of permutations in setting up the array of symbols are immaterial.
  Here is the needed estimate for the probability. Suppose it is positive, and consider the law of the entire array conditioned on pair covering; in the entropy argument this law already includes the tilts. Let $cal(E)$ denote entropy, using $X$ for the array; let $X_i$ denote the vector of column symbols along row $i$, and $Y_b$ the vector of row symbols down column $b$. For a density against uniform, its expected log at any law is bounded above by that law’s relative entropy against uniform. It is also bounded above by the log of the sup of the density. Using weights $1 - epsilon.alt \, epsilon.alt$ on these two bounds, writing the log of the probability from (138) by entropy of the conditioned law gives
  #[#set math.equation(numbering: n => "(139)")
   $ log Pr \( upright("pair covering") \) med lt.eq med & cal(E) \( X \) - \( 1 - epsilon.alt \) #scale(x: 180%, y: 180%)[\(] sum_i cal(E) \( X_i \) + sum_b cal(E) \( Y_b \) #scale(x: 180%, y: 180%)[\)]\
 & - epsilon.alt log \( \| H \| \| J \| \) + epsilon.alt log \( R_H R_J \) . $ <tra:harmonic-overlaps:eq8>]
  We bound the entropy difference here by exposing cells in random order. The following details, in particular keeping the marginal entropies, help make the rank power loss in (136) small. Give every cell an independent uniform $\[ 0 \, 1 \]$ priority, exposing in decreasing order. At cell $e = \( i \, b \)$, for given order, use the conditional distributions
  - $u$ of its column symbol given just the previous column symbols along row $i$;
  - $v$ of its row symbol given just the previous row symbols along column $b$.
  These are for the marginal laws appearing in (139). They are supported on at most $M_e \, Q_e$ choices respectively, the counts not already used in that row or column, including the current symbol. By the entropy chain rule and the variational bound for log sums, the contribution in the entropy difference from exposing this cell is at most the expectation of
  #[#set math.equation(numbering: n => "(140)")
   $ log sum_(\( c \, s \) med upright("available")) u \( c \)^(1 - epsilon.alt) v \( s \)^(1 - epsilon.alt) \, $ <tra:harmonic-overlaps:eq9>]
  where we also require that the pair has not been used in any previous cell. Indeed the conditional array law uses only available possibilities, and the negative marginal entropy contributions are computed exactly by averaging logs of $u \, v$.
  The unrestricted sum divided by $\( M_e Q_e \)^epsilon.alt$ is at most 1. Condition on the full array assignment, the priority $x$ of cell $e$, and priorities in its row or column. The distributions $u \, v$ depend, given the assignment, only on the respective in-row, in-column previous data; they do not depend on the remaining priorities. Take the cell owning each pair in this full assignment. Owners outside row $i$ and column $b$ leave their pair still unused with probability $x$. The contribution of owners inside row $i$ to the normalized sum is at most $Q_e^(- epsilon.alt)$, since each $c$ has only one such pair there. That of owners in column $b$ is at most $M_e^(- epsilon.alt)$. Therefore Jensen bounds the conditional expectation of (140) minus $epsilon.alt log \( M_e Q_e \)$ by
  $ log \( x + Q_e^(- epsilon.alt) + M_e^(- epsilon.alt) \) . $
  We can always replace a positive bound on this difference by 0.
  Averaging this last estimate gives, uniformly as $n$ gets large, at most
  $ - 1 + O \( exp \( - L^(3 \/ 5) \) \) . $
  To see this, when $x gt.eq x_0 = exp \( - L^(2 \/ 3) \)$, except with probability smaller than $exp \( - n^(c_0) \)$ for some $c_0 > 0$, both remaining counts are at least $n^(1 \/ 5)$, by usual binomial bounds. Thus on the range $x gt.eq x_0$ the result follows by comparison with the integral of $log x$, since $2 exp \( - L^(4 \/ 5) \/ 5 \)$ is sufficiently small; the negligible binomial error can use the bound 0, as can $x < x_0$, with the missing integral there of order $x_0 \( 1 + \| log x_0 \| \)$.
  Summing (140), the terms $epsilon.alt log \( M_e Q_e \)$ sum to $epsilon.alt log \( \| H \| \| J \| \)$ in any order. We obtain from (139)
  $ log Pr \( upright("pair covering") \) lt.eq - n + O \( n exp \( - L^(3 \/ 5) \) \) + epsilon.alt log \( R_H R_J \) . $
  Finally $n ! \/ \( \| H \| \| J \| \) lt.eq exp \( n + O \( log n \) \)$ by factorial estimates. This proves (136). ◻
]

=== 12.2 Lifting harmonic functions on injections <lifting-harmonic-functions-on-injections>

For the second overlap estimate we use representations on ordered distinct tuples. Here and elsewhere functions on finite sets are given uniform-measure norms unless indicated.

For $0 lt.eq t lt.eq M$, let $cal(I)_(M \, t)$ be functions on injections of $t$ ordered slots into $\[ M \]$, with label action by $S_M$ (in application the labels $\[ M \]$ here are positions). Functions of only a subset of the slots lift isometrically to $cal(I)_(M \, t)$. Say a function is harmonic here if it sums to zero when varying any one slot with the others fixed. Equivalently the projection on ignoring any one slot is zero. Its extension by zero on repetitions is centered in every slot even under independent uniform sampling with replacement.

#thm([Lemma 12.3.])[
  #emph[]
  #emph[ The harmonic part of $cal(I)_(M \, t)$ consists exactly of the shapes $mu tack.r M$ with $M - mu_1 = t$, each with multiplicity $D_(macron(mu))$. More generally an occurring shape has $j = M - mu_1 lt.eq t$. Also, in the component of such a shape, if we write functions on $t$ slots as sums of lifts from just $j$ slots, we can take coefficient functions from the same shape with sum of squared norms bounded by $e^(C t)$ times the squared norm on $t$ slots, using a linear choice of coefficients. The coefficient selection respects group algebra projections acting on the $S_M$ shape.]
] <tra:harmonic-overlaps:lifting>

#proof[
  We first identify the harmonic part through the spectrum of coordinate deletion, then bound the lifting loss uniformly over the full range $0 lt.eq t lt.eq M$.
  The tuple representation is that on cosets of $S_(M - t)$, with commuting slot action. Multiplicity space for $mu$ is given, up to dual convention, by the $S_(M - t)$-invariants, and under the slot group $S_t$ it has types $nu tack.r t$ with $mu \/ nu$ a horizontal strip of size $s = M - t$, by Pieri, each once. This in particular requires $j lt.eq t$. Let $Q_t$ be the sum of projections ignoring one slot, over the $t$ slots. It acts within $mu \, nu$ with eigenvalue
  #[#set math.equation(numbering: n => "(141)")
   $ frac(t + upright("ct") \( mu \) - upright("ct") \( nu \) - binom(s, 2), s + 1) \, $ <tra:harmonic-overlaps:eq10>]
  where $upright("ct")$ is the content sum. In fact in the coset model each projection averages the identity and swapping the slot with any of the $s$ unused ones; the cross-transposition sum in $Q_t$ is the full transposition sum minus those of the two sets of slots.
  For strip columns $c$, using one-based column numbers, put
  $ p = sum_(upright("strip")) c - s \( s + 1 \) \/ 2 gt.eq 0 . $
  Then (141) is at least
  #[#set math.equation(numbering: n => "(142)")
   $ \( t - j + p \) \/ \( s + 1 \) \, $ <tra:harmonic-overlaps:eq11>]
  since the contribution to the content difference in each such column is $c - mu'_c$, and the total excess of heights over 1 is $j$. Thus $Q_t > 0$ on the indicated components with $t > j$. When $j = t$, the shape does not occur if we drop a slot, and here the strip removes one box in every column so the multiplicity is $D_(macron(mu))$. This proves the statement about harmonic functions (also immediate at $t = 0$).
  Within shape $mu$ in $cal(I)_(M \, u)$, let $L_S$ be the isometric lift from the slots in $S$, and put
  $ cal(A)_u = sum_(\| S \| = j) L_S L_S^(*) \, #h(2em) a_u = lambda_min \( cal(A)_u \) . $
  Here $j lt.eq u lt.eq t$, and $cal(A)_j = I$. For $u > j$, let $L_i$ lift from all slots except $i$, and let $cal(A)_(u - 1)^(\( i \))$ be the corresponding operator on those slots. Each $j$-subset omits exactly $u - j$ slots, so
  $ \( u - j \) cal(A)_u = sum_(i = 1)^u L_i cal(A)_(u - 1)^(\( i \)) L_i^(*) med gt.eq med a_(u - 1) sum_(i = 1)^u L_i L_i^(*) = a_(u - 1) Q_u . $
  All lifts preserve the label type $mu$. Thus $a_u$ is bounded below by $a_(u - 1)$ times the minimum of (141) at slot count $u$, divided by $u - j$. We show that the product of these lower factors, capped at 1 if desired, is at least $exp \( - C t \)$.
  Here is the product check. Shape $mu$ stays fixed. Write $w = M - j$, the width, and at a slot count $u$ with $j < u lt.eq t$, write $s_u = M - u$, $l = u - j = w - s_u$. By (142), the lower factor is at least
  #[#set math.equation(numbering: n => "(143)")
   $ \( l + p \) \/ \( \( s_u + 1 \) l \) \, $ <tra:harmonic-overlaps:eq12>]
  taking the worst allowable strip, now of size $s_u$. If $t < M \/ 4$, the last band of columns of $mu$, of height 1, has length $b gt.eq M - 2 j$. In any band of equal height removed columns must form a suffix. Thus the sum of the $l$ unremoved column numbers is at most the sum from taking the first $l$ columns of the last band (using $l lt.eq b$). Consequently
  $ p gt.eq l \( b - l \) \, #h(2em) frac(l + p, \( s_u + 1 \) l) gt.eq frac(1 + b - l, s_u + 1) gt.eq 1 - frac(j, s_u + 1) > 2 / 3 . $
  The product therefore loses at most a constant to the power $t$.
  If $t gt.eq M \/ 4$, we bound the total log loss by $O \( M \) = O \( t \)$. View each size $s_u$ as a cut after column $s_u$, and let $b_r$ be the band lengths, indexed by height $r$. If a cut lies inside a band, let $v$ be its distance to the nearer boundary; at a boundary put $v = 0$. Compare a permissible strip with the first $s_u$ columns. The number $h$ of missed columns before the cut equals the number of selected columns after it. Within the band the selected columns form a suffix, so either all columns before the cut are missed or all columns after it are selected. Hence $h gt.eq v$. Even the cheapest exchange of $h$ columns across the cut increases the column sum by $h^2$, giving
  $ p gt.eq h^2 gt.eq v^2 \, #h(2em) frac(l + p, \( s_u + 1 \) l) gt.eq frac(\( 1 + v \)^2, 4 M^2) . $
  A bound for the logarithmic loss in (143) is therefore
  $ 2 log \( C M \/ \( 1 + v \) \) . $
  Summing within each band, including its endpoints, gives $O \( sum_r b_r log \( e M \/ b_r \) \)$ by a factorial estimate. To bound this sum, put $pi_r = b_r \/ w$. This probability distribution on positive heights has mean $M \/ w$. Comparison with the geometric law of that mean gives its entropy $cal(E) \( pi \) = - sum_r pi_r log pi_r lt.eq log \( e M \/ w \)$. Therefore
  $ sum_r b_r log frac(e M, b_r) = w log frac(e M, w) + w cal(E) \( pi \) lt.eq 2 w log frac(e M, w) lt.eq 2 M . $
  Since $M lt.eq 4 t$, the product has the required lower bound $exp \( - C t \)$.
  Let $cal(L)$ add the lifts from the direct sum of the $j$-slot spaces to the $t$-slot space, within shape $mu$. Then $cal(L) cal(L)^(*) = cal(A)_t$, so $cal(L)^(*) cal(A)_t^(- 1)$ selects coefficients linearly, with squared norm at most $a_t^(- 1) lt.eq exp \( C t \)$. This map is label-equivariant and hence preserves the image of every group algebra projection on the shape. This proves the lifting facts. ◻
]

=== 12.3 A sparse-deficit overlap <a-sparse-deficit-overlap>

#thm([Proposition 12.4.])[
  #emph[]
  #emph[ For every $lambda tack.r n$ with deficit $k = n - lambda_1 gt.eq 1$, 
#[#set math.equation(numbering: n => "(144)")
 $ parallel P_H P_J parallel_(4 \, lambda)^4 lt.eq exp \( C k \) thin frac(R_H R_J, D_lambda) . $ <tra:harmonic-overlaps:eq13>]

]
] <tra:harmonic-overlaps:sparse-overlap>

The loss here is exponential in $k$. For large deficits we will instead use the regular-trace estimate (136).

#proof[
  Consider the harmonic representation in $cal(I)_(n \, k)$. It contains $D_(macron(lambda))$ copies of $lambda$, so suffices for getting the estimate with this multiplicity taken into account. Both projections preserve this representation. We estimate their angle operator: that between their ranges, with entries given by inner product, whose singular values are those for the product apart from zeros.
  Tuples will have row and column vectors $a = \( a_i \)_(i = 1)^k$, $b = \( b_i \)_(i = 1)^k$ respectively, and put $D \( a \, b \) = 1$ if the cells are distinct and 0 otherwise. We compare norms and probabilities to the model with $a \, b$ independent uniform, including across slots (called iid sampling below). Within row $r$ suppose the specified shape of $P_H$ is $mu_r$, of deficit $j_r$, with local projection rank $l_r^(*)$ in that shape. Fixing $a$, let $t_r$ be the number of slots in row $r$. On a tuple fiber with this assignment the row group acts just on the corresponding injection of $t_r$ columns. For $P_H$ to be nonzero here we need $j_r lt.eq t_r$; in particular we can assume
  #[#set math.equation(numbering: n => "(145)")
   $ sum_r j_r lt.eq k $ <tra:harmonic-overlaps:eq14>]
  (and analogously in columns).
  For $f$ in the harmonic representation in the range of $P_H$, we can therefore expand on distinct tuples into lifts of the form
  #[#set math.equation(numbering: n => "(146)")
   $ F_S \( a \, b_S \) \, $ <tra:harmonic-overlaps:eq15>]
  indexed by sets $S$ of slots of size $sum_r j_r$. Each term only uses assignments $a$ whose restriction $a_S$ has exactly $j_r$ slots in each row; outside such assignments take it as zero. As a function of $b_S$, it uses the projection range on the respective $j_r$ fine slots over each row, in the corresponding shape there. In particular that range, taking all these rows together and extending by zero off distinct column values in the same row among the indicated slots, is a space $W \( a_S \)$ of rank
  #[#set math.equation(numbering: n => "(147)")
   $ T_H = product_r l_r^(*) D_(macron(mu)_r) lt.eq R_H #scale(x: 180%, y: 180%)[\/] product_r B_(mu_r) . $ <tra:harmonic-overlaps:eq16>]
  We will give this fine-slot space the iid $b_S$ norm. It depends only on the assignments $a_S$. It is the natural relabeling to those slots of a tensor product of row spaces, each invariant under slot permutations there (group algebra on positions commutes with slot permutations).
  The expansion (146) follows by the injection lifting fact, used given the row assignment, with the coefficient maps tensored within that assignment. Ranging over assignments and using iid norms, the terms are obtained linearly with
  #[#set math.equation(numbering: n => "(148)")
   $ sum_S parallel F_S parallel_(upright("iid"))^2 lt.eq exp \( C k \) parallel f parallel^2 . $ <tra:harmonic-overlaps:eq17>]
  For this, conditional tuple measure on a possible assignment gives independent uniform injections over the row fibers, and assignment weights are comparable to uniform iid weights up to $exp \( C k \)$ on possible assignments: the ratio is given by the falling factorials within rows and the overall one, so we can use (135). We use zero on impossible assignments; extension by zero for the fine-slot functions also respects the norm bound. The product of the lifting bounds over all rows costs only $exp \( C sum_r t_r \) = exp \( C k \)$.
  Similarly expand harmonic $g$ in the range of $P_J$ into lifts
  #[#set math.equation(numbering: n => "(149)")
   $ G_T \( b \, a_T \) \, $ <tra:harmonic-overlaps:eq18>]
  where, using letters $c$ for columns, column shapes are $gamma_c$ of deficits $d_c^(*)$ and $T$ has $sum_c d_c^(*) lt.eq k$ slots. Required $b_T$ assignments use these counts. The analogous fine-slot space $W' \( b_T \)$ has rank $T_J lt.eq R_J \/ product_c B_(gamma_c)$.
  We now express the overlap through the coefficient spaces of these expansions. For each $S$, let $cal(H)_S$ consist of functions $F \( a \, b_S \)$ whose fine section lies in $W \( a_S \)$, with zero values unless $a_S$ has the required row counts. Give it the norm
  $ parallel F parallel_(cal(H)_S)^2 = bb(E)_a bb(E)_(b_S) \| F \( a \, b_S \) \|^2 $
  under iid sampling. Define $cal(K)_T$ analogously for $E \( b \, a_T \)$ with fine sections in $W' \( b_T \)$. Outside the marked slots, the coarse assignments are unrestricted. Orthonormal fine-slot bases identify these norms with Euclidean coefficient norms averaged over the coarse vectors.
  Let $A_S f = F_S$ and $B_T g = G_T$ be the linear coefficient selections above, on the harmonic ranges of $P_H$ and $P_J$, respectively. Equation (148) and its column analogue give
  $ sum_S parallel A_S f parallel_(cal(H)_S)^2 lt.eq e^(C k) parallel f parallel^2 \, #h(2em) sum_T parallel B_T g parallel_(cal(K)_T)^2 lt.eq e^(C k) parallel g parallel^2 . $
  Their individual operator norms are therefore at most $e^(C k)$, after adjusting the constant.
  Write $sans(C)_U = product_(i in U) \( upright("Id") - bb(E)_(b_i) \)$. The zero extension of harmonic $f$ is centered in every whole cell-slot under iid sampling. Against it, we may first center each $G_T \( b \, a_T \)$ in the slots outside $T$. Since $G_T$ is independent of $a_i$ there, this applies exactly $sans(C)_(\[ k \] \\ T)$. Now expand $f$ on distinct tuples. For each $S \, T$, put
  $ I = \[ k \] \\ \( S union T \) \, #h(2em) i_0 = \| I \| . $
  The independence of $F_S$ from $b_I$ and self-adjointness of centering give
  $ bb(E)_(upright("iid")) \[ D thin overline(F_S) thin sans(C)_(\[ k \] \\ T) G_T \] = bb(E)_(upright("iid")) \[ C_I thin overline(F_S) thin sans(C)_(S \\ T) G_T \] \, #h(2em) C_I = sans(C)_I D . $
  The remaining centering acts only on coarse coordinates outside $T$. It is a contraction on $cal(K)_T$ and leaves $W' \( b_T \)$ unchanged.
  Define $cal(M)_(S \, T) : cal(K)_T arrow.r cal(H)_S$, abbreviated to $cal(M)$ when the pair is fixed, by
  #[#set math.equation(numbering: n => "(150)")
   $ chevron.l F \, cal(M) E chevron.r = bb(E)_(upright("iid")) #scale(x: 120%, y: 120%)[\[] C_I \( a \, b \) overline(F \( a \, b_S \)) E \( b \, a_T \) #scale(x: 120%, y: 120%)[\]] . $ <tra:harmonic-overlaps:eq19>]
  In orthonormal fine-slot bases, its kernel entries from coarse $b$ to coarse $a$ are $C_I \( a \, b \)$ times the conjugate and unconjugated fine basis evaluations at $b_S \, a_T$. With $c_k = n^k \/ \( n \)_k$, the angle operator between the two harmonic projection ranges is therefore
  #[#set math.equation(numbering: n => "(151)")
   $ cal(O) = c_k sum_(S \, T) A_S^(*) cal(M)_(S \, T) sans(C)_(S \\ T) B_T . $ <tra:harmonic-overlaps:angle-factorization>]
  Here $c_k lt.eq e^(C k)$, and there are at most $4^k$ pairs $S \, T$.
  The purpose of the two norm estimates below is the inequality
  $ parallel cal(M) parallel_4^4 lt.eq parallel cal(M) parallel_(upright("op"))^2 parallel cal(M) parallel_(upright("HS"))^2 . $
  The residual slots will supply a factor $\( k \/ n \)^(i_0 \/ 2)$ in each squared norm. Counting the marked slots will supply the remaining factor $\( k \/ n \)^(\| S union T \|)$ in the Hilbert–Schmidt estimate, together with $R_H R_J$. Since $i_0 + \| S union T \| = k$, their product gives $\( k \/ n \)^k$. Finally, the $D_(macron(lambda))$ copies of $lambda$ in the harmonic representation convert this estimate to the $D_lambda$ denominator in (144). All coefficient maps and subset sums will cost only $exp \( C k \)$.
  First, with $delta = k \/ n$, uniformly given the values in all marked slots $S union T$, there is the residual estimate
  #[#set math.equation(numbering: n => "(152)")
   $ bb(E)_(a_I \, b_I) \| C_I \( a \, b \) \|^2 lt.eq exp \( C k \) delta^(i_0 \/ 2) . $ <tra:harmonic-overlaps:eq20>]
  For clarity, expand the centering operators using independent alternatives to $b_i \, med i in I$. In the alternating differences, if a slot $i in I$ cannot create a duplicate cell with some other slot (allowing the displayed and alternative values in any slots with alternatives), the difference sum is zero. The squared quantity can thus be bounded with a factor at most $4^k$ by the probability of the potential-duplicate coverage event, using also Jensen over alternatives. The residual slots are sampled independently, with their alternatives (same row in the two values for the slot). In the collision graph every one of these slots must be incident to an edge. To bound the probability, in components with a connection to a marked slot use edges of a forest leading to marked roots, and in other components use a forest leading to a free root; there are at least two slots in any free component. If the number of edges chosen is $e$, then $e gt.eq i_0 \/ 2$. The choices are bounded by $2^(O \( k \)) k^e$, for example by giving nonroots parents. Ordered from the roots, edge conditions each have probability at most $4 \/ n$ for a new slot, since each allowed cell-value version in it is uniform. A union bound proves (152), also when the desired estimate is loose because $delta$ is not small.
  Fix all marked cell values. In the residual variables, $F$ depends only on $a_I$ and $E$ only on $b_I$, so
  $ lr(|bb(E)_(a_I \, b_I) \[ C_I overline(F) E \]|) lt.eq (bb(E)_(a_I \, b_I) \| C_I \|^2)^(1 \/ 2) (bb(E)_(a_I) \| F \|^2)^(1 \/ 2) (bb(E)_(b_I) \| E \|^2)^(1 \/ 2) . $
  Apply (152), then average over the marked values and use Cauchy–Schwarz once more. The resulting norms are exactly $parallel F parallel_(cal(H)_S)$ and $parallel E parallel_(cal(K)_T)$, since marked coordinates absent from a function integrate out. Hence
  #[#set math.equation(numbering: n => "(153)")
   $ parallel cal(M) parallel_(upright("op"))^2 lt.eq exp \( C k \) delta^(i_0 \/ 2) . $ <tra:harmonic-overlaps:eq21>]
  The full Hilbert-Schmidt bound takes more accounting for marks. In a normalized finite sampling measure it is the expected squared kernel size (sum of squared entries in the bases), thus uses
  #[#set math.equation(numbering: n => "(154)")
   $ \| C_I \( a \, b \) \|^2 thin U \( a_S \, b_S \) thin V \( b_T \, a_T \) \, $ <tra:harmonic-overlaps:eq22>]
  where $U \, V$ are the sums of squared basis evaluations of the fine-slot spaces, set to zero at assignments not having the required counts. After integrating out residual slots we are bounded using (152), leaving the expectation involving just $U \, V$.
  Write
  $ O = S ∩ T \, quad z = \| O \| \, quad x = \| S \\ T \| \, quad y = \| T \\ S \| . $
  We evaluate this expectation by fixing the $a_S \, b_T$ assignments and averaging the fine evaluations in the non-overlap coordinates $b_(S \\ T) \, a_(T \\ S)$. Suppose the counts of the overlap slots in those assignments are $h_r lt.eq j_r$ in rows and $v_c lt.eq d_c^(*)$ in columns. The numbers of non-overlap assignments, given overlap assignments, are
  #[#set math.equation(numbering: n => "(155)")
   $ frac(x !, product_r \( j_r - h_r \) !) \, #h(2em) frac(y !, product_c \( d_c^(*) - v_c \) !) . $ <tra:harmonic-overlaps:eq23>]
  The averaged $U$ value is $T_H m^z$ times the probability of the evaluation values $b_O$ in a probability distribution on those slots. Indeed $U \/ T_H$ is a probability density on $b_S$ against iid measure. Moreover this is a product over rows, supported on distinct values per row before and after marginalization, with the overlap distribution permutation invariant within each row. And per row it is always the same distribution up to slot naming for the given $h_r$, regardless of which overlap slots were assigned or how the assignment was extended to the non-overlap slots. These properties follow from the tensor description and slot invariance of the spaces giving sums of squared basis evaluations. Similarly the averaged $V$ is $T_J q^z$ times a probability of $a_O$, with the analogous properties over columns.
  In summing over overlap assignments $a_O \, b_O$ at fixed counts $h_r \, v_c$, the sum of products of these two probabilities is at most
  #[#set math.equation(numbering: n => "(156)")
   $ frac(z !, product_r h_r ! product_c v_c !) . $ <tra:harmonic-overlaps:eq24>]
  To verify this, each contributing overlap with positive products forms a simple bipartite graph between the rows and columns with edges labeled by overlap slots: no repeated cell is allowed by the supports. A given simple graph with these degrees has $z !$ labelings. The row-side probability of the ordered column values is the probability of the corresponding unordered neighbor choices independently by rows, divided by $product h_r !$; likewise on the other side. Summing products of the unordered probabilities over such graphs costs at most 1.
  The normalization for $a_S \, b_T$ is $q^(- \( x + z \)) m^(- \( y + z \))$, which with the $m^z q^z$ above leaves $q^(- x) m^(- y)$. Thus (154), after all averaging, is bounded by a sum over overlap counts $h_r \, v_c$ using terms at most
  #[#set math.equation(numbering: n => "(157)")
   $ exp \( C k \) delta^(i_0 \/ 2) T_H T_J q^(- x) m^(- y) frac(x ! y ! z !, product_r \( j_r - h_r \) ! h_r ! thin product_c \( d_c^(*) - v_c \) ! v_c !) . $ <tra:harmonic-overlaps:eq25>]
  There are at most $exp \( C k \)$ count choices, using (145). Use (147) and its analogue, with $B_(mu_r) gt.eq exp \( - C j_r \) m^(j_r) \/ j_r !$ by (134), (135), and likewise in columns. Since $sum j_r = x + z \, med sum d_c^(*) = y + z$, (157) shows
  #[#set math.equation(numbering: n => "(158)")
   $ parallel cal(M) parallel_(upright("HS"))^2 lt.eq exp \( C k \) R_H R_J thin delta^(i_0 \/ 2 + x + y + z) . $ <tra:harmonic-overlaps:eq26>]
  Here $x ! y ! z ! lt.eq k^(x + y + z)$, and the split factorials within rows or columns versus their combined factorials only cost $exp \( C k \)$.
  Now (153), (158) give
  $ parallel cal(M) parallel_4^4 lt.eq exp \( C k \) R_H R_J thin delta^k . $
  Apply the Schatten ideal and triangle inequalities to (151). The coefficient-map bounds, centering contractions, injection normalization and at most $4^k$ pairs give
  $ parallel cal(O) parallel_4^4 lt.eq e^(C k) max_(S \, T) parallel cal(M)_(S \, T) parallel_4^4 lt.eq e^(C k) R_H R_J delta^k . $
  This bounds the angle operator in the harmonic representation, which contains $D_(macron(lambda))$ copies of $lambda$. Since $D_lambda \/ D_(macron(lambda)) lt.eq \( e n \/ k \)^k$ by (134), division by that multiplicity proves (144). ◻
]

=== 12.4 Very small deficits by path coverage <very-small-deficits-by-path-coverage>

#thm([Lemma 12.5.])[
  #emph[]
  #emph[ There is one more preparatory bound. We can deal with $1 lt.eq k = n - lambda_1 lt.eq n^0.51$ directly using the binary layers in the sweep. For all sufficiently large $n$ we will have 
#[#set math.equation(numbering: n => "(159)")
 $ parallel T_n upright(" in ") lambda parallel_(upright("op")) lt.eq n^(- c k) $ <tra:harmonic-overlaps:eq27>]

 for an absolute $c > 0$.]
] <tra:harmonic-overlaps:very-sparse>

#proof[
  We prove this on the harmonic part of $cal(I)_(n \, k)$. Use distinct input and output tuples $xi \, zeta$. Given them a card has a unique required path through the sweep (it changes each bit to the output value when that bit is handled). For $A subset.eq \[ k \]$ write $p_A$ for the probability the cards in $A$ get the required outputs, and $r_A = n^(\| A \|) p_A$. These probabilities are just obtained by imposing switch outcomes along paths. Two paths can pose conditions on a common switch only if they use the same switch in some layer. Call such paths adjacent, also when the needed outcomes may conflict. When the demands are compatible, the card paths being used cannot occupy the same wire at a time, and there is a factor of 2 in $r_A$ for each shared switch, with no more than two cards sharing; a pair of cards in a compatible routing shares at most once (once they take opposite outputs on a switch, they stay different in that bit).
  The centered kernel
  #[#set math.equation(numbering: n => "(160)")
   $ sum_(A subset.eq \[ k \]) \( - 1 \)^(k - \| A \|) r_A $ <tra:harmonic-overlaps:eq28>]
  can be used instead of $r_(\[ k \])$ on harmonic functions of $zeta$, since dropped-slot terms integrate to zero. This is for the slot transition forward on cards, acting on functions by output averaging (using an adjoint convention if necessary). The kernel $r_(\[ k \])$ itself is the transition kernel against uniform on injections up to the factor from $n^k$ versus $\( n \)_k$. Thus for (159) it is enough to bound the Hilbert-Schmidt norm from (160), ignoring such a factor or allowing $exp \( C k \)$. The centered kernel is zero unless every slot’s path is adjacent to some other: isolated slots give cancellation since their normalized path factor is 1 and independent of the conditions on others.
  It remains to bound the integrals of $r_A^2$ on this coverage event for each $A$, since this controls the squared norm up to $exp \( C k \)$. We can do the integral against iid inputs and outputs restricted to distinct tuples, at cost $exp \( C k \)$ by (135). One power of $r_A$ gives a sampling using actual routed paths for the slots in $A$: take a random full routing (choose all switches), and sample those input cards uniformly without replacement. Indeed under this sampling outputs for those cards have the probability $p_A$ given their distinct inputs. Other slots can still just use iid input and output samples, ignoring distinctness for upper bounds. The factors from these measure comparisons can again be allowed as $exp \( C k \)$. In this setting the remaining weight $r_A$ on distinct tuples just counts factors 2 as above. Condition on the full routing. For probability bounds on constraints involving sampled paths, the actual routed paths can also be compared to sampling from them with replacement with a factor $exp \( C k \)$, still evaluating any weight bound for distinct samples.
  There are two useful observations here:
  ===== 12.4.1 Conditional path adjacency. <conditional-path-adjacency.>
  Given a path of either type (from the actual full routing or from independent endpoints), a new independent choice of a path of either type, using with-replacement sampling conditional on the full routing, has probability at most $2 log_2 \( n \) \/ n$ to be adjacent to it. Per switch of the given path there are only two paths in the full routing using that switch, and for independently sampled endpoints the path goes through a uniform position at any fixed layer.
  ===== 12.4.2 Shared-switch count. <shared-switch-count.>
  For any $b$ distinct members of a full routing the number of switches shared within that set is at most $\( b \/ 2 \) log_2 b$. Indeed split inputs into halves according to the last bit handled in the sweep. Within halves before the last layer use induction, and for the last layer cross edges add at most the smaller half-count within the set. The bound follows since the binary entropy at any proportion is at least twice the smaller proportion.
  For each component of the path adjacency graph of size $b'$ the weight $r_A$ therefore uses at most a factor $\( b' \)^(b' \/ 2)$, using observation 2 on actual slots. On the coverage event all components have size at least two. Use spanning forests of these components to bound the probabilities: with $l$ total tree edges they can be counted with a bound $2^(O \( k \)) k^l$ by orienting toward roots, and for any one forest the edge requirements cost probability at most $\( 2 log_2 \( n \) \/ n \)^l$, by observation 1 under with-replacement sampling. Here we may sum by forests describing the exact components from the event for which the weight bound is used, and just drop non-edge constraints for the probability upper bound.
  These give a power saving $n^(- c' k)$ even with the weights for components and all $exp \( C k \)$ factors. Explicitly $2 k log_2 \( n \) \/ n lt.eq n^(- 0.47)$ for $n$ large. In a component of size 2 we use one such factor and weight at most 2; in one of size $b' gt.eq 3$ we use $b' - 1$ such factors, and weight bounded by $n^(0.255 b')$. This comparison applies uniformly in the forest count bound (multiply the maximum of each bound with $l$ edges by the number of such forests). It proves the required Hilbert-Schmidt estimate and hence (159). ◻
]

=== 12.5 Interpolation through the split <interpolation-through-the-split>

#proof[
  We now combine the estimates. We only need to give the large-$n$ induction step, with some absolute threshold for it chosen large enough throughout.
  As before set $L = log n$. We organize the cases as follows apart from (133):
  - Very small deficits as in (159) can already use (132) with any sufficiently small absolute $a > 0$, since, for example, $D_lambda lt.eq n^k$ by occurring in the tuple representation.
  - For remaining shapes with $k lt.eq n exp \( - L^(1 \/ 4) \)$ use the sparse-deficit overlap estimate (144). Here $k > n^0.51$, and
  #[#set math.equation(numbering: n => "(161)")
   $ log D_lambda gt.eq c k L^(1 \/ 4) $ <tra:harmonic-overlaps:eq29>]
  by (134).
  - For the other shapes not killed by (133), we can use the regular trace overlap estimate (136); we have
  #[#set math.equation(numbering: n => "(162)")
   $ log D_lambda gt.eq n exp \( - L^(1 \/ 3) \) . $ <tra:harmonic-overlaps:eq30>]
  To justify the last dimension assertion, we give the elementary checks. If $max \( lambda_1 \, lambda'_1 \) < n \/ \( 4 e \)$, the hook bound gives exponential dimension since hook lengths are less than $n \/ \( 2 e \)$. Otherwise take width $w gt.eq n \/ \( 4 e \)$ using one of the shape or its transpose. If the number of remaining boxes is at least $floor.l w \/ 8 floor.r$, we may just keep the full width and that many more boxes in a subshape; dimension is nondecreasing under adding boxes of a shape, and (134) gives exponential dimension for the subshape. The case with fewer than that many remaining boxes in the transposed orientation would be killed by (133). With fewer in the original orientation we again get the claimed lower bound from (134) when $k > n exp \( - L^(1 \/ 4) \)$. This proves (162).
  Suppose (132) holds for the smaller sizes $m \, q$ with exponents at least $a_(*)$, where without loss $a_(*) lt.eq 1 \/ 8$. In any row factor take its matrix singular decomposition in each shape, and similarly in columns. We need the bases meeting in multiplying across the two factors of $T_n$. That is, removing outside unitaries, we bound singular values of the product of positive factors, using on one side left singular projections of its component operators and on the other right singular projections. This can all be done in the respective group algebras and then taken inside shape $lambda$, by ordinary group Fourier decomposition (the polar unitaries can be completed on nullspaces). Equivalently, in restriction of $lambda$ to the product subgroup, each component operator acts on its own irreducible by the corresponding matrix with identity on multiplicities.
  In each component group and shape $mu$, group singular indices into dyadic blocks from $r_0$ through at most $2 r_0 - 1$, $r_0$ a power of 2. Use the projections onto these blocks in the meeting bases just described. Take $R = D_mu r_0$ as upper bound of regular rank in our estimates. Thus on the two sides we have orthogonal decompositions by the $P_H \, P_J$, respectively, with the regular rank product bounds $R_H \, R_J$; and the positive singular-value factors can use eigenvalue upper bounds
  #[#set math.equation(numbering: n => "(163)")
   $ R_H^(- a_(*)) \, #h(2em) R_J^(- a_(*)) $ <tra:harmonic-overlaps:eq31>]
  on the respective blocks. In fact for purposes of bounding any singular value of the product we can replace the factors by the indicated weights: individually the singular-value factors are then the weighted projection sums times commuting contractions, which can be taken to the outsides.
  In shape $lambda$ consider the analytic matrix product of projection sums with weights, in the product order needed, i.e. of
  #[#set math.equation(numbering: n => "(164)")
   $ sum_(P_H) R_H^(- z beta) P_H \, #h(2em) sum_(P_J) R_J^(- z beta) P_J \, #h(2em) 0 lt.eq "Re" z lt.eq 1 . $ <tra:harmonic-overlaps:eq32>]
  Use either overlap estimate, with $beta$ chosen according to it:
  - For shapes using (136), $beta = \( 1 + epsilon.alt \) \/ 4$. On the line $"Re" z = 1$, Schatten 4 norm of the product is bounded by
  #[#set math.equation(numbering: n => "(165)")
   $ (frac(exp \( E_n \), D_lambda))^(1 \/ 4) \, quad E_n = n exp \( - L^(1 \/ 2) \) + O \( n^(4 \/ 5) \) . $ <tra:harmonic-overlaps:eq33>]
  Indeed expand in projection pairs and use the triangle inequality and (136), with regular trace paying for $D_lambda$ copies. The number of pairs can be absorbed with the additive $O \( n^(4 \/ 5) \)$ in the exponent. For a group of size-parameter $M = m$ or $q$, there are just $exp \( O \( sqrt(M) \) \)$ shapes and at most $O \( M log M \)$ dyad choices for each. We use here the usual partition count bound, also seen directly by using $exp \( - 1 \/ sqrt(M) \)$ as argument in the partition generating function $product_(i gt.eq 1) \( 1 - x^i \)^(- 1)$, whose log at this argument is $O \( sqrt(M) \)$.
  - For shapes using (144) in the sparse range, take $beta = 1 \/ 4$, and (165) holds instead with exponent
  $ E_n = O \( k log log n \) . $
  Here (145) on both sides is necessary for nonzero terms, by restriction in the tuple calculation. Vectors of local deficits summing to at most $k$ have at most $exp \( O \( k \) \)$ choices since $k > n^0.51$ exceeds both $m \, q$ for large $n$. For positive deficit $j$, shape choices cost at most $2^j$, and dyad choices at most $O \( j log n \)$ by the dimension bound $n^j$; for zero deficit there is just the trivial rank and shape. So the claimed exponent absorbs the number of terms and (144)’s losses.
  On $"Re" z = 0$, (164) gives operator norm at most 1 with no counting, by orthogonality within each of the two projection sums. We interpolate the whole product, which in particular allows counting costs in (165) to be scaled by the interpolation parameter. By standard three-lines Schatten interpolation (between operator norm and Schatten 4), at parameter
  $ theta = a_(*) \/ beta $
  we obtain the bound (165), raised to power $theta$, in Schatten $4 \/ theta$. The dual-matrix three-lines argument is the one given in the proof of Lemma 9; here its analytic family is the full product (164).
  This parameter gives just the weights (163), so ranking the resulting singular values at the root shows
  #[#set math.equation(numbering: n => "(166)")
   $ log s_r \( T_n upright(" in ") lambda \) lt.eq - frac(a_(*), 4 beta) #scale(x: 120%, y: 120%)[\(] log \( D_lambda r \) - E_n #scale(x: 120%, y: 120%)[\)] . $ <tra:harmonic-overlaps:eq34>]
  Use (162) in the case using (136), or (161) in the case using (144). With an absolute $C$, say we conclude for all sufficiently large $n$ the desired bound (132) at the root with exponent at least
  #[#set math.equation(numbering: n => "(167)")
   $ a_(*) \( 1 - C \/ L^(1 \/ 10) \) \, $ <tra:harmonic-overlaps:eq35>]
  provided we keep initial exponents small enough to allow the very small deficits as well. Crucially the choice of large-size threshold in these comparisons of exponents can be absolute and independent of how small $a_(*)$ might be.
  Finally these induction steps give (132) with uniform positive exponent. Choose a large absolute base threshold, also large enough that the factors in (167) are positive and, say, at least $1 \/ 2$. At or below the threshold, Lemma 5 gives (132) with a common positive exponent, chosen small enough for the very small deficits. Lemma 18, with $gamma = 1 \/ 10$, then bounds the product of the losses in (167) away from zero. This proves (132). ◻
]

=== 12.6 Fourier summation and physical time <tra:harmonic-overlaps:fourier-completion>

This is the classical finite-group Fourier/Plancherel-to-total-variation method of Diaconis and Shahshahani #cite(label("DiaconisShahshahani1981")) Section 2, Lemma 2; Section 3, proof of Lemma 14. We use the noncentral matrix form, not the random-transposition specialization; the harmonic lifting and overlap estimates above are proved here.

Apply the indexed-bound conversion in Section 4 to (132). After an integer $u$ of sweeps, the chi-square divergence is at most

#[#set math.equation(numbering: n => "(168)")
 $ sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(thin 2 - 2 a u) . $ <tra:harmonic-overlaps:eq36>]

Sign and the other blocks in (133) vanish. If $2 a u gt.eq 3$, Lemma 8 makes the displayed sum tend to zero. Thus a fixed number of sweeps gives vanishing total-variation error, uniformly over the starting deck. Lemma 6 gives the lower bound $2 d - O \( 1 \)$ in physical shuffle units.

== 13 Sparse row defects and the full singular list <tra:regular-ranks>

The preceding estimates keep an irreducible dimension and an index within that block. We next keep the index in the full regular representation throughout the induction. This requires controlling the exceptional input rows before forming the grid trace.

The conclusion is qualitatively comparable with a bounded regular moment, but the proof follows the singular list itself. Its sparse argument measures the weighted neighborhoods of the starting tuple, rather than deleting first interactions. Its entropy argument groups parallel edges at a subexponential threshold. Together these estimates permit approximation by an operator of prescribed rank at each balanced split.

Let $s_j \( T_N \)$ be the singular values of one sweep, in decreasing order and counting all regular multiplicities.

#thm([Theorem 13.1.])[
  #emph[There is an absolute $c > 0$ such that 
#[#set math.equation(numbering: n => "(169)")
 $ s_j \( T_N \) lt.eq j^(- c) #h(2em) \( 1 lt.eq j lt.eq N ! \) $ <tra:regular-ranks:eq1>]

 for every power of two $N$.]
] <tra:regular-ranks:main>

=== 13.1 Sparse input rows and their exceptional set <sparse-input-rows-and-their-exceptional-set>

#thm([Lemma 13.2.])[
  #emph[ Fix an absolute $delta > 0$, small (we can take $10^(- 4)$). On the representation indexed by a first row of length $N - k$, $1 lt.eq k lt.eq N^(1 - delta)$, the following estimate holds 
#[#set math.equation(numbering: n => "(170)")
 $ parallel T_N parallel lt.eq exp \( - b k log N \) $ <tra:regular-ranks:eq2>]

 for all sufficiently large $N$, with fixed $b > 0$. For $k = 1$ this follows from uniform one-card marginals, so we consider $k gt.eq 2$.]
] <tra:regular-ranks:sparse>

#proof[
  Use the representation on $k$ distinguished cards, that is, on tuples of distinct positions. The representation in (170) occurs here and does not occur for $k - 1$ cards. Thus we need only work on the space orthogonal to functions dropping at least one coordinate. Write $x \, y$ for input and output tuples, $P \( x \, y \)$ for the sweep kernel on the tuples and $P_I$ for the marginals on subtuples indexed by $I subset \[ k \]$. The kernel, between these orthogonal-complement spaces with counting measure, can be replaced by
  $ D \( x \, y \) = sum_(I subset \[ k \]) \( - 1 \)^(k - \| I \|) P_I \( x_I \, y_I \) N^(- \( k - \| I \| \)) . $
  Paths in the sweep between specified endpoints are unique. Draw the $k$ paths and put an interaction between two indices if their paths use any common two-way gate, irrespective of feasibility. If there is an isolated index, $D = 0$: in every term that index if included multiplies path probability independently by $1 \/ N$.
  Here are bounds for the absolute kernel thus obtained. Put $p = k \/ N$. For distinct input tuple $x$ write $r \( x_i \, x_j \) in \[ 1 \, d \]$ for the largest coordinate in which the two positions differ. Call $x$ good if, except at fewer than $k \/ 20$ of the indices,
  #[#set math.equation(numbering: n => "(171)")
   $ sum_(j eq.not i) 8 thin 2^(- r \( x_i \, x_j \)) lt.eq p^(1 \/ 8) . $ <tra:regular-ranks:eq3>]
  On a good input row $x$, fix $I subset.eq \[ k \]$ and sample the nonnegative kernel $P_I N^(- \( k - \| I \| \))$ before restricting the outputs to be distinct. The labels in $I$ use one common switch field; the other labels use independent fair bits. Let $Gamma$ be the event that their complete path interaction graph has no isolated vertex. We prove
  $ Pr \( Gamma divides x \) lt.eq p^(c_1 k) \, #h(2em) p = k \/ N \, $
  uniformly in $I$. Restricting the final tuple to be injective can only decrease this row sum.
  First fix an order in which to reveal the full paths. Given the paths already exposed, the switch coins used by the exposed labels in $I$ are fixed, and all other switch coins remain independent and fair. This follows directly from the path specification: it prescribes a value for each visited switch, and imposes no condition on any other switch. The exposed independent walkers prescribe only their own private bits. Explore the next path $i$ until it first reaches a switch visited by an exposed path. Before that time, its updated bits are fresh fair bits, whether $i$ uses the common field or private bits.
  For an earlier path $j$, the two paths cannot share a switch before $r \( x_i \, x_j \)$: a higher unupdated bit still separates them. At time $t gt.eq r \( x_i \, x_j \)$, reaching that path’s switch requires one specified prefix of $t - 1$ updated bits. The event that this is a first encounter is a subset of that prefix event in the stopped exploration. Its conditional probability is therefore at most $2^(- \( t - 1 \))$. We have not conditioned on avoiding the earlier switches; that avoidance remains part of the event being bounded. A union bound gives
  $ Pr { i upright(" meets an earlier path") divides upright("exposed paths") } lt.eq sum_(j upright(" earlier")) sum_(t = r \( x_i \, x_j \))^d 2^(- \( t - 1 \)) lt.eq sum_(j eq.not i) 4 thin 2^(- r \( x_i \, x_j \)) . $
  For every index satisfying (171), this is at most $p^(1 \/ 8)$. Thus these encounter indicators have a uniform conditional upper bound in every fixed revelation order.
  Now choose the revelation order uniformly, independently of the sampled paths. In any fixed graph without isolated vertices, each vertex has an earlier neighbor with probability at least $1 \/ 2$. The number $A$ of vertices with an earlier neighbor therefore has mean at least $k \/ 2$ and is at most $k$. It follows that $Pr { A gt.eq k \/ 4 } gt.eq 1 \/ 3$. On a good row fewer than $k \/ 20$ indices violate (171); hence, with this probability over the order, at least $k \/ 6$ indices satisfying that inequality meet an earlier path.
  For a fixed order and any prescribed set of $h$ such indices, successive conditioning in revelation order bounds the probability that all their encounters occur by $p^(h \/ 8)$. Take $h = ceil.l k \/ 6 ceil.r$ and sum over the at most $2^k$ possible sets. Averaging the order and using the preceding $1 \/ 3$ bound gives
  $ Pr \( Gamma divides x \) lt.eq 3 dot.op 2^k p^(k \/ 48) lt.eq p^(k \/ 96) $
  for sufficiently large $N$, since $p lt.eq N^(- delta)$. This proves the required good-row estimate. The backward occupation estimate below will supply the corresponding column bound on the exceptional input rows.
  For the bad rows we give the corresponding small bound on column sum, even without requiring any interactions. Running any of the $I$-processes backwards from the column tuple $y$, the probability that any specified set of $h$ distinct input sites are all occupied among the $k$ paths is at most $p^h$. Apply Lemma 50 to singleton sets, using $\| I \|$ jointly switched cards and $k - \| I \|$ independent walkers in the reverse coordinate order. The bound counts all endpoints before restriction to distinct input tuples, so it remains an upper bound for the restricted kernel.
  We include details that, on distinct input sites, having too many violations of (171) has probability at most $p^(c_2 k)$ under this bound. Dyadic boxes of size $2^r$ consist of vectors agreeing in coordinates above $r$. Every violating site is in some such box with occupancy $h gt.eq 2$ and with
  $ h med gt.eq med frac(p^(1 \/ 8) thin 2^r, 8 d) . $
  Take maximal such boxes. If a bad row is produced, they are disjoint and together witness total occupancy $q gt.eq k \/ 20$. For $l lt.eq q \/ 2$ boxes with sizes $a_i = 2^(r_i)$, occupancies $h_i$, sum $q$, union bound over occupied sites costs at most the sum, with box lists counted unordered, of
  $ p^q product_(i = 1)^l \( N \/ a_i \) \( e a_i \/ h_i \)^(h_i) . $
  Thus summing ordered specifications of sizes and occupancies we divide by $l !$. Using $a_i \/ h_i lt.eq 8 d p^(- 1 \/ 8)$, the site-cost sum at fixed $q \, l$ is at most
  $ p^q thin 2^(O \( q \)) \( C d^2 p^(- 1 \/ 8) \)^q thin N^l \/ l ! med lt.eq med \( C' d^2 \)^q thin p^(7 q \/ 8 - l) . $
  In the last bound we used $N = k \/ p \, med k^l \/ l ! lt.eq exp \( O \( q \) \)$ in this range. This proves the stated bad-row probability with room to spare.
  The terms of the absolute bound on $D$ have row and column sums trivially at most 1 (per term); on good rows with required interactions, or on columns when keeping just the bad rows, we have the small bounds on one of these two sums. Therefore the matrix norm is at most $2^(k + 1) p^(c_3 k)$, with fixed $c_3 > 0$, by the row/column test. This proves (170). ◻
]

=== 13.2 Conditional coloring entropy <conditional-coloring-entropy>

#thm([Proposition 13.3.])[
  #emph[ Suppose sites, $N = m n$, are arranged in $m$ rows and $n$ columns, with $sqrt(N) \/ 2 lt.eq m \, n lt.eq 2 sqrt(N)$. Let $K \, L$ be the row and column permutation groups. Consider orthogonal convolution projections on these groups, and denote also by $Q_K \, Q_L$ the operators given by them in the regular representation on $G = S_N$. We require that the projections separately on the subgroups be tensor products over the rows and over the columns. Write 
$ R = "rank"_K Q_K \, #h(2em) S = "rank"_L Q_L $

 for nonzero ranks in the regular representations on the subgroups. Then 
#[#set math.equation(numbering: n => "(172)")
 $ "Tr"_G \( Q_K Q_L Q_K Q_L \) med lt.eq med R S thin exp #h(-0.16667em) (O #h(-0.16667em) (N^.995 + frac(log \( R S \), sqrt(log N)))) . $ <tra:regular-ranks:eq4>]

]
] <tra:regular-ranks:crossing>

#proof[
  Let $q_K \, q_L$ be the coefficient densities of the two projections on their own groups. Their squared masses are $R \, S$. Lemma 14, in its projection case, gives
  #[#set math.equation(numbering: n => "(173)")
   $ "Tr"_G \( Q_K Q_L Q_K Q_L \) lt.eq R S thin frac(\| G \|, \| K \| \| L \|) Pr \( upright("compatibility") \) \, $ <tra:regular-ranks:eq5>]
  where now $k \, l$ are drawn independently with densities $\| q_K \|^2 \/ R \, med \| q_L \|^2 \/ S$. The $n$ column permutations in $l$ are independent with individual densities at most their projection ranks $S_v$, $product S_v = S$.
  For clarity, using row moves followed by column moves to describe compatibility, fix $k$. It gives a bipartite multigraph from old to new columns, with one edge per row at each column: how the card in that row moves to a new column. Degree is $m$. The permutations in $l$ assign colors (new rows) to edges at the new-column vertices, giving each color once there. Compatibility is exactly that each color also appears once at each old-column vertex. Indeed this permits performing the two moves in the opposite order, coloring at old columns and then moving within the new rows. Other composition conventions give the same estimate with harmless inversions.
  We will need the following entropy bound. Take any distribution $Y$ on proper such colorings (each-side requirement), writing $Y_v$ for the incident permutation at each new-column vertex. Write $D_v = log \( m ! \) - H \( Y_v \)$, using nats. Put $u = log m \, med L_(*) = exp \( sqrt(u) \)$, calling edge bundles (parallel sets) bad if their size exceeds $L_(*)$; let $b_(*)$ be the number of edges in bad bundles. For sufficiently large sizes the total correlation satisfies
  #[#set math.equation(numbering: n => "(174)")
   $ sum_v H \( Y_v \) - H \( \( Y_v \)_v \) med gt.eq med N - b_(*) - O \( N m^(- .03) \) - O \( 1 \/ sqrt(u) \) sum_v D_v . $ <tra:regular-ranks:eq6>]
  We give details to get power-saving error along with the small coefficient of the deficits.
  Order the edges within a vertex $v$ with bundles contiguous, and compare revealing its permutation alone versus revealing after previously exposed vertices in a uniform random order of vertices given by iid $\[ 0 \, 1 \]$ priorities. For an edge $e = \( v \, w \)$ let $a$ be the number of remaining colors when it is revealed locally, $P$ its conditional law given the earlier local colors. Put $d_e = D \( P parallel upright("unif")_a \)$ (random from these earlier colors), so $sum_(e upright(" at ") v) bb(E) d_e = D_v$. The entropy gap in (174) sums the conditional entropy drops on knowing the earlier vertices, which equal expected conditional relative entropies to these $P$’s. The global conditional law has to avoid colors used by earlier vertices at $w$; hence the drop is at least the expectation of minus log of the $P$-mass available after this exclusion. Condition to evaluate this latter expectation on the entire actual coloring and on priority $z$ of $v$, and use Jensen on other priorities. Any color at $w$ whose edge there is from a different vertex is excluded with probability $z$, giving at least
  $ integral_0^1 - log \( 1 - z + z t_e \) thin d z = 1 - F \( t_e \) \,\
t_e = P \( upright("actual colors on bundle ") \( v \, w \) \) \, #h(2em) F \( t \) = frac(t log \( 1 \/ t \), 1 - t) . $
  with continuous endpoint conventions. The cost lost here is at most 1. Discard the bad bundles, and also each good bundle meeting the last $ceil.l m^.8 ceil.r$ edges at its vertex. The latter removal costs at most $O \( m^.8 + L_(*) \)$ edges per vertex and leaves at least $m^.8$ colors at every edge of each retained bundle. We bound the loss for each other edge in a good bundle as follows.
  Call colors heavy for $P$ if $P \( c \) > m^(- .3)$. If heavy mass is $T$, we have
  #[#set math.equation(numbering: n => "(175)")
   $ T lt.eq C d_e \/ u + C m^(- .2) . $ <tra:regular-ranks:eq7>]
  Indeed $a gt.eq m^.8$, and one may use $D \( P parallel U \) = sum_i \[ P_i log \( a P_i \) - P_i + 1 \/ a \]$ with nonnegative summands. The contribution of light colors to $t_e$ is at most $L_(*) m^(- .3)$. If $T gt.eq L_(*)^(- 5)$, the bound $t_e lt.eq T + L_(*) m^(- .3)$, monotonicity of $F$, and (175) show
  #[#set math.equation(numbering: n => "(176)")
   $ F \( t_e \) lt.eq O \( d_e \/ sqrt(u) + m^(- .1) \) . $ <tra:regular-ranks:eq8>]
  For a good bundle, write $cal(B)$ for its edge set and put $b = \| cal(B) \| lt.eq L_(*)$. For a current edge $e in cal(B)$, let $cal(F)_e$ be the local history just before revealing it, and let $a_e$ be the number of remaining colors. Write $P_e$ for the current conditional law and $T_e$ for its heavy mass. The heavy set $H_e = { c : P_e \( c \) > m^(- .3) }$ is determined by $cal(F)_e$ and has size at most $m^.3$. If the heavy mass is less than $L_(*)^(- 5)$, the loss is $O \( m^(- .1) \)$ unless some still unrevealed edge $f in cal(B)$ has color in $H_e$; on that event the loss is at most $C L_(*)^(- 4)$.
  Let $P_(f \| e)$ be the conditional law of the color of $f$ given $cal(F)_e$. The same entropy estimate used above gives
  $ P_(f \| e) \( H_e \) lt.eq C (m^(- .1) + frac(D \( P_(f \| e) parallel upright("unif")_(a_e) \), u)) . $
  The histories are nested. Conditional entropy decreases between $cal(F)_e$ and $cal(F)_f$, while contiguity of the bundle gives $0 lt.eq a_e - a_f lt.eq L_(*)$. Since the retained edges have $a_f gt.eq m^.8$,
  $ bb(E) D \( P_(f \| e) parallel upright("unif")_(a_e) \) lt.eq bb(E) d_f + log \( a_e \/ a_f \) lt.eq bb(E) d_f + C L_(*) \/ m^.8 . $
  A union bound over the remaining edges and then a sum over current edges therefore charge each $bb(E) d_f$ at most $L_(*)$ times. The small-heavy-mass losses satisfy
  $ sum_e bb(E) \[ upright("loss")_e \; med T_e < L_(*)^(- 5) \] & lt.eq O \( N m^(- .05) \) + frac(C L_(*)^(- 4), u) sum_(cal(B)) sum_(e in cal(B)) sum_(f in cal(B)\
f upright(" not before ") e) bb(E) d_f\
 & lt.eq O \( N m^(- .05) \) + frac(C L_(*)^(- 3), u) sum_v D_v\
 & lt.eq O \( N m^(- .05) \) + frac(C L_(*)^(- 2), u) sum_v D_v . $
  Here $upright("loss")_e$ denotes the bounded loss $F \( t_e \)$ after the light-color error has been included in the displayed additive term. This proves the asserted small-heavy-mass contribution. Together with (176) and the discarded edges, it proves (174).
  Consequently, for fixed $k$, under the possibly weighted column laws used in (173), we have
  #[#set math.equation(numbering: n => "(177)")
   $ Pr_l \( upright("compatibility") divides k \) lt.eq exp #h(-0.16667em) (- N + b_(*) + O (N m^(- .03) + \( log S \) \/ sqrt(u))) . $ <tra:regular-ranks:eq9>]
  Indeed take the distribution conditioned on compatibility as $Y$ in (174), if it has positive probability. Minus log of that probability is the relative entropy to the product column laws, equaling the total correlation plus sum of local relative entropies to the respective laws. Each $D_v$ is bounded by the latter local relative entropy plus $log S_v$.
  It remains to average the bad-edge factor over $k$. Under uniform row permutations,
  #[#set math.equation(numbering: n => "(178)")
   $ bb(E) exp \( c_4 sqrt(u) thin b_(*) \) = O \( 1 \) $ <tra:regular-ranks:eq10>]
  for a fixed $c_4 > 0$. To verify, we can choose bad cells in the table of old against new columns, each with $h > L_(*)$ rows moving accordingly. For total $q$ such prescriptions, assignment probabilities in the independent row permutations are at most $\( e \/ n \)^q$, by the falling factorial bound (or are zero). Lists of cell sizes summing to $q$ can be counted with $2^q$; choices of cells with factor at most $\( n^2 \)^(q \/ L_(*))$; choices of rows with factor at most $\( e m \/ L_(*) \)^q$. Applying this also for the event $b_(*) = q$ proves (178). Thus under weighted rows (density bounded by $R$), averaging $exp b_(*)$ costs at most $exp \( O \( 1 + log R \/ sqrt(u) \) \)$, by Hölder. Finally $\| G \| \/ \( \| K \| \| L \| \) lt.eq exp \( N + O \( sqrt(N) log N \) \)$ by factorial estimates. Equations (173), (177), (178) yield (172). ◻
]

=== 13.3 Regular singular-number induction <regular-singular-number-induction>

#proof[
  Fix thresholds with room between the preceding power exponents; we use
  $ X_N = N^.998 . $
  We show (169) by an induction with a small summable exponent loss. More precisely, there will be exponents $c_N$ bounded away from zero, $lt.eq a_0 = 1 \/ 32$ (and chosen sufficiently small absolutely), giving (169) at each size.
  Split the bit list into halves as close as possible, forming the $m$-by-$n$ array of (row, column), column bits those updated first. The sweep factors as independent row sweeps then independent column sweeps; their sizes meet the assumption of (172). Work in the regular representation of $G$. By singular/polar decompositions the singular numbers of $T_N$ are those of $E D$, where $D \, E$ are positive semidefinite contractions: the output-side singular magnitude for the first factor, respectively the input-side singular magnitude for the second factor (with the unitary pieces on the outside removed). In particular, the operators $D$ and $E$ are induced from tensor products of such operators on the row subgroup and column subgroup, respectively.
  Suppose we have child bounds (169) with common $c' lt.eq a_0$, the smaller of our exponents available for $m \, n$. To keep cutoffs in this proof independent of the possibly tiny size of $c'$, first bound $E^r D^r$ with
  $ r = a_0 \/ c' gt.eq 1 . $
  We will show, for $x = log j gt.eq X_N$,
  #[#set math.equation(numbering: n => "(179)")
   $ s_j \( E^r D^r \) lt.eq exp (- a_0 \( 1 - O \( epsilon.alt_N \) \) x) \, #h(2em) epsilon.alt_N = \( log N \)^(- 1 \/ 4) . $ <tra:regular-ranks:eq11>]
  Decompose $D \, E$ into spectral bands, tensor factor by tensor factor. Here are useful conventions to accommodate repetitions and regular representation projections. Separately for each row or column site-group operator use a band per dyadic range of ending indices of distinct nonzero eigenvalues in its regular list, taking index 1 (the constant eigenvalue) by itself. Eigenvalue 1 is simple in such regular lists: attaining norm 1 in a sweep product of switch-averaging projections requires belonging to their common invariant space, and all cube-edge swaps together generate the symmetric group. If rank in one band is $t$, every eigenvalue in it is at most $\( t \/ 2 \)^(- c')$, by the ending-index convention. The projections themselves are convolution operators, including for bands constructed this way. Take tensor combinations of bands over rows for $D$ and over columns for $E$, obtaining projections $Q_K \, Q_L$ as in (172), of ranks $R \, S$ on the subgroups. Write $y = log \( R S \)$ in this paragraph and the next one (distinct from output tuples earlier). There are at most $M = exp \( O \( sqrt(N) log N \) \)$ pairs of tensor combinations, by e.g. counting dyadic bands. Thus $E^r D^r$ is the sum of these pieces (ignoring zero eigenvalues). Each piece is, up to contractions on the outside, $Q_L Q_K$ times a scale of at most
  $ W = exp \( - a_0 y + C sqrt(N) \) . $
  The fourth-power singular sum of $Q_L Q_K$ on $G$ is the trace (172).
  To check (179), approximate each piece to error
  $ zeta = exp \( - a_0 \( 1 - 10 epsilon.alt_N \) x \) \/ M $
  in norm. It can be dropped if $W lt.eq zeta$; otherwise by (172) its necessary rank for this approximation is at most
  $ exp \( y + O \( N^.995 + y \/ sqrt(log N) \) \) \( W \/ zeta \)^4 . $
  In this second case
  $ y lt.eq \( 1 - 10 epsilon.alt_N \) x + O \( sqrt(N) log N \/ a_0 \) . $
  Including the sum over at most $M$ pieces, the logarithm of the necessary rank is at most
  $ \( 1 - 4 a_0 \) y + 4 a_0 \( 1 - 10 epsilon.alt_N \) x + O #h(-0.16667em) (N^.995 + y / sqrt(log N) + sqrt(N) log N) lt.eq \( 1 - 8 epsilon.alt_N \) x . $
  To obtain the last inequality, use $1 - 4 a_0 > 0$ and substitute the upper bound on $y$. The errors are $o \( epsilon.alt_N x \)$ because $x gt.eq N^.998$ and $a_0 = 1 \/ 32$ is fixed. This gives a total rank less than $j$ and proves (179). All large-size conditions here are independent of $c'$.
  Lemma 11 transfers the powered estimate to the original positive product: for every $j$,
  $ product_(i = 1)^j s_i \( E D \) lt.eq (product_(i = 1)^j s_i \( E^r D^r \))^(1 \/ r) . $
  Hence (179), geometric averaging over first $j$ (using trivial contraction on earlier indices), gives for $x = log j gt.eq 2 X_N$
  #[#set math.equation(numbering: n => "(180)")
   $ s_j \( T_N \) lt.eq exp \( - c' \( 1 - C_0 epsilon.alt_N \) x \) $ <tra:regular-ranks:eq12>]
  with an absolute $C_0$. For example, all but $O \( j e^(- epsilon.alt_N x \/ 4) \)$ of the indices up to $j$ have log index at least $\( 1 - epsilon.alt_N \/ 2 \) x$ and are covered by (179).
  The induction now controls all indices whose logarithm is at least $2 X_N$. We still have to control the beginning of the regular list. Multiplicity forces a large irreducible block to reach the range just handled. The remaining small-dimensional blocks have a long first row or column, where the sparse estimate or annihilation applies. Any singular value on an irrep of dimension $f$ occurs with multiplicity at least $f$. Thus irreps with $f gt.eq exp \( 2 X_N \)$ can always have their singular values tested by (180) at least at that threshold, even for values contributing to the start of the regular list. Smaller dimensions come only from shapes near row or column, and (170) (or vanishing) handles these.
  Here are details of these statements about smaller dimensions. For sufficiently large $N$, if dimension $< exp \( 2 X_N \)$, either first row or first column has length $N - k$ with $k lt.eq N^.999$. Indeed if longest length out of both is less than $N \/ 10$, the hook formula already gives dimension exponentially large in $N$. Otherwise put a length at least $N \/ 10$ first as a row, transposing if needed. If at least $floor.l N^.999 floor.r$ boxes are left in the tail, take a subdiagram retaining exactly that many in the tail and the same first row; its dimension is a lower bound. Writing row length $l$, new tail size $a$, the hook formula gives at least $binom(l + a, a) exp \( - O \( a \/ \( l - a \) \) \)$: tail hook lengths give at least dimension 1 there, and the first-row hook additions are on the first $a$ (leftmost) boxes with total addition $a$, giving the correction displayed relative to $l !$. This suffices. These arguments use equality of dimensions on transposing. If first column has length $N - k$ in that range, the switches annihilate the representation: there are no invariants on the matching subgroup of one layer, since the partition does not dominate the content $\( 2 \, 2 \, dots.h \, 2 \)$, by Young’s rule (take $N$ large here). Shapes with first row $N - k$, $1 lt.eq k lt.eq N^.999$, are covered by (170). The constant shape contributes just the singular number at 1.
  For $2 lt.eq j$ with $x = log j < 2 X_N$, take the exponent $c'' = c' \( 1 - C_1 epsilon.alt_N \)$, with $C_1 gt.eq C_0$. Irreps of dimension with log at least $2 X_N$ have norm at most $exp \( - c'' x \)$, by (180) with their multiplicity (ceiling/real thresholds can equivalently use integer indices). It suffices to count singular values exceeding this test among row shapes of smaller dimensions. Those levels would require by (170) $1 lt.eq k < c'' x \/ \( b log N \)$. The total dimension in the regular list of nonconstant shapes through any such level $k$ is at most $N^(4 k)$, say, just by occurrence in tuple representations or dimension bounds and counting shapes. Taking our exponents restricted once for all to less than $b \/ 16$, the number exceeding the test including the trivial value is then less than $j$ (if the range of levels is empty just use $1 < j$). So (169) holds at all indices with $c''$.
  This proves the induction step, with conditions that $N$ be larger than an absolute cutoff and exponent loss by a factor $1 - C_1 epsilon.alt_N$. We emphasize that no cutoff for the array or spectral-band estimates was dependent on the choice of starting exponent in this induction. For finitely many smaller powers of two there is a common positive starting exponent, as small as required, by simplicity of norm 1 noted above. We can take cutoff already large enough that loss factors used are at least $1 \/ 2$. Lemma 18, with $gamma = 1 \/ 4$, bounds the product of the loss factors away from zero along every recursive branch. Thus the induction proves (169) as claimed. ◻
]

#thm([Corollary 13.4.])[
  #emph[For an absolute integer $t$, $t$ sweeps meet the total-variation threshold $1 \/ 4$.]
] <tra:regular-ranks:mixing>

#proof[
  Apply the converse direction of Proposition 16 to (169), choosing a singular moment with nonconstant remainder at most $1 \/ 4$. The forward direction then gives total variation at most $1 \/ 4$ after an absolute number of sweeps. A sweep costs $d$ physical steps, and Lemma 6 gives the matching-order lower bound. ◻
]

== 14 Positive collision series and spectral bins <tra:collision-series>

A regular-rank bound does not retain the distribution of moment mass across diagram levels. The positive series below does: its coefficients include the tail-tableau multiplicities, and Cauchy bounds can extract individual level contributions.

A tuple collision calculation retains a positive sum of traces at each representation level. The weight of a representation in this sum is the dimension of the diagram below its first row. Branching extracts these weighted sums from the exponential generating function for tuple traces. We estimate the resulting coefficients through the collision graph of a single realized sweep. Positivity then permits a high-power estimate before the regular multiplicities are restored.

For the dense trace, the input is a compatibility bound under independent component laws with specified supremum densities. We divide positive subgroup operators into spectral bins. Each bin has a controlled rank and therefore a controlled supremum density after its squared coefficient kernel is normalized. This gives the weak trace estimate to which the positive collision coefficients will be applied.

Let $n = 2^d$, $d gt.eq 1$. Write $T_n$ for a sweep and $cal(Q)_n = T_n T_n^(*)$, acting on the regular representation. One sweep corresponds to $d$ physical shuffles by Section 2. Products act right-to-left, as in Section 2; a row move followed by a column move therefore places the column operator on the left. Traces are unnormalized.

=== 14.1 Supremum-density compatibility bounds <supremum-density-compatibility-bounds>

#thm([Proposition 14.1.])[
  #emph[ The following estimate holds for sufficiently large $n$ factored as $n = l m$ with $1 \/ 2 lt.eq l \/ m lt.eq 2$. Let $G$ be the permutation group of $\[ l \] times \[ m \]$, with $H$ its subgroup of permutations acting separately in each row and $K$ the subgroup acting separately in each column. For $h in H \, med k in K$, consider the event 
#[#set math.equation(numbering: n => "(181)")
 $ h k in K H . $ <tra:collision-series:eq2>]

 Suppose $h \, k$ are chosen with independent component permutations (all $l + m$ permutations independent). Use $L_v$ as bounds on the supremum densities, relative to uniform, for the individual permutation laws, indexing these components by $v$. Then for an absolute $C$, 
#[#set math.equation(numbering: n => "(182)")
 $ bb(P) { h k in K H } med lt.eq med exp (- n + C n^0.55 + frac(C, log n) sum_v log L_v) . $ <tra:collision-series:eq3>]

]
] <tra:collision-series:compatibility>

#proof[
  To prove this, first invert the permutations: $h k in K H$ if and only if $k^(- 1) h^(- 1) in H K$. The latter event concerns a row move $h^(- 1)$ followed by a column move $k^(- 1)$. Inversion preserves independence of the component laws and their supremum density bounds. We describe this event as a constraint on two arrays. For intermediate cell $\( i \, t \)$ (after $h^(- 1)$ and before $k^(- 1)$), let $J_i \( t \)$ be its column of origin and $R_t \( i \)$ its row of destination. Thus $J_i$, $i in \[ l \]$, are permutations of $\[ m \]$, and $R_t$, $t in \[ m \]$, are permutations of $\[ l \]$. Constraint (181) says that the pairs
  $ #scale(x: 120%, y: 120%)[\(] J_i \( t \) \, R_t \( i \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \( i \, t \) in \[ l \] times \[ m \] \, $
  are all distinct. Indeed this is necessary to be obtainable with a column layer first and a row layer second; if it holds, the column layer can first give every point its intended destination row, after which a row layer can give the intended columns. Here by row or column layer we mean a permutation in $H$ or $K$, respectively. Call arrays satisfying the constraint valid.
  The random-order exposure below is related to Radhakrishnan’s entropy proof of Brégman’s theorem #cite(label("Radhakrishnan1997")) and its higher-dimensional development by Linial and Luria #cite(label("LinialLuria2014")) Sections 2.2–3.2. Here the conditional predictions need not be uniform: the estimate retains the component entropy deficits and separately charges concentrated entries.
  Use now an arbitrary distribution $nu$ supported on valid arrays; entropies, denoted by $sans(h)$, are in nats. Write $D_(upright(u))$ for relative entropy to uniform on permutations (or product uniform when applied to a group of array components), using the marginal under $nu$ in this notation. We will show
  #[#set math.equation(numbering: n => "(183)")
   $ sans(h) \( J \, R \) med lt.eq med & sum_i sans(h) \( J_i \) + sum_t sans(h) \( R_t \) - n + C n^0.55\
 & #h(4mm)  + frac(C, log n) (sum_i D_(upright(u)) \( J_i \) + sum_t D_(upright(u)) \( R_t \)) . $ <tra:collision-series:eq4>]
  Fix $eta = 1 \/ 100$, $B = ceil.l n^eta ceil.r$, and write
  $ b_(i t) = \# { t' : R_(t') \( i \) = R_t \( i \) } \, #h(2em) W = \# { \( i \, t \) : b_(i t) gt.eq B } . $
  There is an absolute $c > 0$ (we can use $c = eta \/ 4$) such that
  #[#set math.equation(numbering: n => "(184)")
   $ bb(E)_nu W med lt.eq med frac(D_(upright(u)) \( R \) + log 2, c log n) . $ <tra:collision-series:eq5>]
  In fact, consider first independent uniform column permutations. A bundle consists of a row $i$, a row value $r$, and $B$ columns, with a prescription that all those columns have $R_t \( i \) = r$. A disjoint family of bundles means the prescribed cells do not overlap. For any such family of size $s$, the probability of satisfying it is at most $\( e \/ l \)^(B s)$. Indeed, each column with $a$ cells specified gives either probability zero or $1 \/ \( l \)_a$, where $\( l \)_a$ denotes a falling factorial, and $\( l \)_a gt.eq \( l \/ e \)^a$. For any outcome we can pack bundles it satisfies so as to have $2 B$ times their number at least $W$: use disjoint bundles for each row and value with count at least $B$. Thus $n^(c W)$ is at most the sum of $n^(2 c B s)$ over satisfied disjoint families, including the empty family. Its expectation under product uniform is bounded by
  $ sum_(s gt.eq 0) (l^2 binom(m, B) \( e \/ l \)^B n^(2 c B))^s med lt.eq med 2 $
  for large $n$, by $m \/ l lt.eq 2$. This moment bound gives (184) by the relative entropy inequality (or changing measure and using Jensen’s inequality).
  The bundle estimate charges repeated destination values to the joint entropy deficit of the column array. We now expose the row array to obtain one nat of compatibility saving per cell, except for these repetitions and for heavy conditional atoms.
  We bound the conditional entropy for $J$ given $R$ by revealing its rows sequenced by independent uniform priorities in $\[ 0 \, 1 \]$, independent of the arrays. Use decreasing priority, so given the current row’s priority $x$, each other row has probability $x$ of being later. Within a row reveal cells in fixed order. For cell $\( i \, t \)$, use $p_j$ to denote the conditional probabilities for its value $J_i \( t \) = j$ under the marginal law of $J_i$, given the previously revealed part of just that row. There are $u$ remaining columns to fill in the row, so $p$ is supported on $u$ remaining values (allowed to have zero probabilities there). The sum of expected $- log p_j$ for the true values over cells gives $sum_i sans(h) \( J_i \)$.
  We give the savings in the entropy upper bound arising from earlier rows. Call a candidate $j$ heavy if $p_j > B \/ u$, and otherwise light. Let their class masses be $P_(upright("heavy")) \, P_(upright("light"))$. For light candidates, consider availability, meaning that the pair with this $j$ and current $R_t \( i \)$ has not appeared in earlier rows. Use as test probabilities for the entropy bound $p_j$ unchanged for heavy candidates; for light candidates redistribute their class mass on available light candidates proportionally to $p_j$. If no such positive mass is available, omit the light class. These probabilities (possibly a subprobability) use only the permitted history with $R$ known, and the true value has positive test probability almost surely. By the entropy or cross-entropy inequality at every step, this gives the upper bound on conditional entropy equal to the base terms from $- log p_j$, plus terms of the following form:
  - a contribution zero if the true value is heavy;
  - for a light true value, the logarithm of the fraction of $P_(upright("light"))$ available in positive-probability light candidates.
  Here and below it is the expectation of such contributions that enters the bound.
  The cell gives an expected contribution of about $- 1$ outside of some losses, as follows. Fix the full arrays first, and suppose the true value is light, $P_(upright("light")) gt.eq 1 \/ 2$, and $b_(i t) < B$. Every pair in question occurs exactly once in the valid arrays. The total fraction in the light class from pairs located within row $i$ is at most $2 B^2 \/ u$: there are at most $b_(i t)$ of them and each light mass is at most $B \/ u$. For pairs outside this row the probability of availability is $x$, given the current priority. Hence the average log fraction, bounding by Jensen’s inequality and integrating priority, is at most
  $ integral_0^1 log \( x + 2 B^2 \/ u \) thin d x med lt.eq med - 1 + C' B^2 / u log n $
  with an absolute $C'$; this follows by integration, for large $n$, also when $2 B^2 \/ u > 1$. We have used the independence of the row priorities from the full arrays.
  Always, the contribution is at most zero. The losses (missed savings of 1) on summing from $b_(i t) gt.eq B$ can thus be charged to $bb(E)_nu W$; the total losses from heavy true value or $P_(upright("light")) < 1 \/ 2$ are bounded by 3 times the sum of expected $P_(upright("heavy"))$. Conditionally using just the row history, heavy mass is bounded by
  $ P_(upright("heavy")) med lt.eq med frac(D \( p parallel "Unif"_u \), log B - 1) $
  for large $n$, using $"Unif"_u$ on the remaining values. To see this use $z log z - z + 1 gt.eq 0$ with $z = u p_j$ in the divergence, and bound it below by $z \( log B - 1 \)$ for heavy values. The sum of these expected conditional divergences (the numerators) is $sum_i D_(upright(u)) \( J_i \)$.
  Applying the entropy chain rule (with independent priorities) now gives
  $ sans(h) \( J divides R \) med lt.eq med sum_i sans(h) \( J_i \) - n + C' sum_i sum_(u = 1)^m \( B^2 \/ u \) log n + bb(E)_nu W + frac(3, log B - 1) sum_i D_(upright(u)) \( J_i \) . $
  The double sum error with its prefactor is at most $C'' n^0.55$, as $l = O \( sqrt(n) \)$ and $B = ceil.l n^(1 \/ 100) ceil.r$. In adding $sans(h) \( R \)$, use
  $ cal(C)_R = sum_t sans(h) \( R_t \) - sans(h) \( R \) med gt.eq med 0 \, #h(2em) D_(upright(u)) \( R \) = sum_t D_(upright(u)) \( R_t \) + cal(C)_R . $
  Then (184) shows we get (183) (the positive error coming from $cal(C)_R \/ \( c log n \)$ is absorbed by the saving of $cal(C)_R$). This proves the entropy claim.
  To conclude (182), take $nu$ to be the law of the independent components conditioned on validity, assuming positive probability. Write $rho = ⨂_v rho_v$ for the independent law before conditioning, and $nu_v$ for the marginal at $v$. In passing between permutation components and the arrays we may have taken inverses, which does not affect the given supremum bounds. Minus the log probability of validity equals
  $ D \( nu parallel rho \) = sum_v D \( nu_v parallel rho_v \) + sum_v sans(h) \( nu_v \) - sans(h) \( nu \) . $
  In (183), the individual deficits $D_(upright(u))$ are at most $D \( nu_v parallel rho_v \) + log L_v$. Using (183) and $C \/ log n lt.eq 1$ for sufficiently large $n$, we get (182). ◻
]

=== 14.2 Spectral bins in the fourth trace <tra:collision-series:balanced-split>

The compatibility estimate concerns probability laws, whereas subgroup coefficient kernels may be signed. Squaring a coefficient kernel produces a nonnegative law after normalization, and splitting first into spectral bins gives the density control the estimate requires. From now on, split $d$ into $floor.l d \/ 2 floor.r + ceil.l d \/ 2 ceil.r$. Use

$ m = 2^(floor.l d \/ 2 floor.r) \, #h(2em) l = 2^(ceil.l d \/ 2 ceil.r) \, $

and take $d$ large enough that both are at least 2. The first part of the pass works independently within the $l$ rows of size $m$ and the second works independently within the $m$ columns of size $l$. They are products of the corresponding smaller passes on these subgroups, extended in convolution action to $G$. Denote them by $F_H \, F_K$, so $T_n = F_K F_H$.

#thm([Proposition 14.2.])[
  #emph[ Suppose the two smaller sizes satisfy 
$ "Tr" cal(Q)_m^(q_m) lt.eq 1 + 1 / 8 \, #h(2em) "Tr" cal(Q)_l^(q_l) lt.eq 1 + 1 / 8 \, #h(2em) q_m \, q_l gt.eq 300 . $

 No uniform upper bound on these powers is needed at this step. These are the child bounds for the invariant (192) closed below. There is an absolute $A$ such that with 
$ p = \( 1 + A \/ log n \) max \( q_m \, q_l \) $

 we have 
#[#set math.equation(numbering: n => "(185)")
 $ "Tr" cal(Q)_n^p med lt.eq med exp \( n^0.57 \) $ <tra:collision-series:eq6>]

 for all sufficiently large $n$.]
] <tra:collision-series:weak-moment>

#proof[
  Set $X = F_H F_H^(*) \, med Y = F_K^(*) F_K$, positive operators. Since $T_n^(*) T_n = F_H^(*) Y F_H$, the positive operators $T_n^(*) T_n$, $cal(Q)_n$, and $Y^(1 \/ 2) X Y^(1 \/ 2)$ have the same eigenvalues, including zeros. Their $p$-th powers therefore have the same trace. Lemma 9, with exponent $p gt.eq 2$, gives
  $ "Tr" cal(Q)_n^p med lt.eq med "Tr" (X^(p \/ 2) Y^(p \/ 2) X^(p \/ 2) Y^(p \/ 2)) . $
  Use $x \( h \) \, y \( k \)$ for the kernels of $X^(p \/ 2) \, Y^(p \/ 2)$, respectively, normalized on their own groups, meaning that $X^(p \/ 2)$ acts by convolution with $x \( h \) \/ \| H \|$, and similarly for $Y^(p \/ 2)$. The powers here indeed come from these groups, as extension to $G$ acts by the same matrix blocks on corresponding cosets. Both $x$ and $y$ factor as products over permutation components in their respective groups. Apply Lemma 14 to the positive line powers composing $X^(p \/ 2)$ and $Y^(p \/ 2)$. In the present orientation compatibility is $h k in K H$; the lemma gives the unnormalized squared-coefficient form
  #[#set math.equation(numbering: n => "(186)")
   $ "Tr" cal(Q)_n^p med lt.eq med frac(\| G \|, \| H \| \| K \|) bb(E)_(H \, K) #h(-0.16667em) [bold(1)_(h k in K H) thin \| x \( h \) y \( k \) \|^2] \, $ <tra:collision-series:eq7>]
  where expectation is independent uniform. This is where we can apply the grid estimate, but the kernels should first be split into sizes.
  Each permutation component $v$ of $H \, K$ uses a group of degree $a = m$ or $l$. Its kernel factor in $x$ or $y$ is for $D_v^(p \/ 2)$, where $D_v$ is a copy of $T_a^(*) T_a$ or $T_a T_a^(*)$ on the regular representation of the component. Split according to spectral bins indexed by $b = 0 \, 1 \, dots.h$, grouping eigenvalues of $D_v^(q_a)$ in
  $ #scale(x: 120%, y: 120%)[\(] e^(- \( b + 1 \)) \, e^(- b) #scale(x: 120%, y: 120%)[\]] . $
  Only nonzero eigenvalues matter. These pieces, also of convolution form by spectral calculus, have ranks $r_(v \, b) lt.eq 2 e^(b + 1)$ by the input trace bound. Write $z_(v \, b)$ for the normalized kernel for $D_v^(p \/ 2)$ restricted to the bin, zero on the orthogonal complement. For expectation uniform on the component group, using the stated child trace bounds, we have
  $ w_(v \, b) := bb(E) \| z_(v \, b) \|^2 med lt.eq med r_(v \, b) exp \( - b p \/ q_a \) med lt.eq med 2 e thin exp (- b A \/ log n) . $
  In the first inequality we used that uniform mean square equals the squared Hilbert-Schmidt norm (ordinary, for the convolution matrix in the regular representation). Also, for each nonempty bin,
  $ frac(sup \| z_(v \, b) \|^2, w_(v \, b)) med lt.eq med r_(v \, b) . $
  This is the rank bound for a positive coefficient density in Lemma 14, applied to the bin operator.
  Each nonempty bin now supplies a probability density $\| z_(v \, b) \|^2 \/ w_(v \, b)$ bounded by its rank. Its total mass before normalization is $w_(v \, b)$. These are exactly the two quantities needed in the grid estimate.
  Expand $x \( h \) y \( k \)$ using the bins in each component. For a term with a single bin $b_v$ in each (take nonempty bins), its squared norm for the expectation on the right of (186), including the indicator, is by (182) at most
  $ & (product_v w_(v \, b_v)) exp (- n + C n^0.55 + frac(C, log n) sum_v log r_(v \, b_v))\
 & #h(2em) lt.eq exp \( - n + C n^0.55 \) product_v (C_1 thin e^(- \( A - C \) b_v \/ log n)) . $
  where $C \, C_1$ are absolute, and $A$ can now be fixed greater than $C + 2$. Indeed (182) applies to the independent laws given by the squared kernels in the bins, normalized to probabilities. By triangle inequality on taking square roots for the sum over bins, geometric summation, and squaring again, we obtain
  $ bb(E)_(H \, K) #h(-0.16667em) [bold(1)_(h k in K H) \| x \( h \) y \( k \) \|^2] med lt.eq med exp \( - n + C n^0.55 \) (C_2 log n)^(2 \( l + m \)) $
  with another absolute $C_2$. Finally,
  $ log (frac(\| G \|, \| H \| \| K \|)) = log (frac(n !, \( m ! \)^l \( l ! \)^m)) = n + O \( sqrt(n) log n \) . $
  Substitution in (186) proves (185). ◻
]

=== 14.3 The positive tuple collision series <tra:collision-series:representation-normalization>

The preceding argument gave a weak bound for the complete regular trace. We next prove a separate low-level bound, keeping a weighted sum of positive single-copy traces throughout.

All sufficiently-large requirements here are absolute. This step will use standard symmetric group representation theory (parametrization by partitions, the branching rule, sign twist, hook length formula and regular representation multiplicities). For clarity, let $"Tr"_lambda$ indicate a trace on a single copy of the irreducible indexed by $lambda tack.r n$, and $f^lambda$ its dimension, the number of standard tableaux. Our operators specified by group convolution can be considered in unitary representations throughout. Thus the trace in the regular representation has contributions $f^lambda "Tr"_lambda$.

#thm([Lemma 14.3.])[
  #emph[ For small levels $k$, by which we refer to $k = n - lambda_1$, we use the following estimate, independent of (185), for all large enough $n$: 
#[#set math.equation(numbering: n => "(187)")
 $ B_k := sum_(lambda : med n - lambda_1 = k) f^(macron(lambda)) "Tr"_lambda cal(Q)_n med lt.eq med n^(- 0.01 k) \, #h(2em) 1 lt.eq k lt.eq n^0.62 . $ <tra:collision-series:eq9>]

 Here $macron(lambda)$ is the partition obtained by omitting the first row. We include $B_0$ in the notation in deriving the estimate, with empty tableau dimension 1.]
] <tra:collision-series:sparse-trace>

#proof[
  To prove (187), let $R_j^(*)$ in this paragraph and the derivation denote a number, namely the trace of $cal(Q)_n$ on the permutation representation on ordered $j$-tuples of distinct positions (including $j = 0$). By branching, for $j lt.eq n \/ 2$ we have
  $ R_j^(*) = sum_(k = 0)^j binom(j, k) B_k . $
  Indeed the representation on tuples is induced from the trivial representation on a subgroup permuting $n - j$ points. By Frobenius reciprocity and branching the multiplicity of $lambda$ is the number of standard tableaux for the skew diagram left by omitting a first row segment of length $n - j$ (zero if the segment does not fit). Here if $k lt.eq j$ the skew part of the top row does not interact with $macron(lambda)$ as $j lt.eq n \/ 2$, giving the formula. Consequently
  #[#set math.equation(numbering: n => "(188)")
   $ B_k = k ! thin \[ z^k \] e^(- z) sum_(j = 0)^n R_j^(*) z^j \/ j ! \, quad k lt.eq n \/ 2 . $ <tra:collision-series:eq10>]
  There is a path expression for these tuple traces. Perform one pass on all the labels, and in its collision graph place an edge between two labels when they face each other at a switch. Labels may for this purpose be identified with their initial positions. This is a simple graph: once two paths face each other they differ in the bit produced there, which is not changed again, so they cannot face again. For $s gt.eq 0$ let $h_s$ for this graph be the number of edge subsets with exactly $s$ vertices in their support (thus $h_0 = 1$). We claim the polynomial identity
  #[#set math.equation(numbering: n => "(189)")
   $ sum_(j = 0)^n R_j^(*) z^j \/ j ! = bb(E) sum_(s = 0)^n h_s \( z \/ n \)^s \( 1 + z \/ n \)^(n - s) . $ <tra:collision-series:eq11>]
  In computing the tuple trace, we sum squared probabilities for the $j$-tuple to move between prescribed positions over a pass, since its operator from the pass is multiplied by its adjoint. For a tuple start, sample a finish by using the switches. Given this start and finish, the trajectory of every marked label is determined, because each bit is used exactly once. The probability of the sampled tuple finish from the given start is
  $ n^(- j) 2^(thin \# { upright("edges between marked labels") }) . $
  This follows since each marked path determines a bit at each layer, each a $1 \/ 2$ factor, except that two facing paths use the same coin. Compatibility at collisions holds since we took a sampled finish. Taking the mean of this probability exactly gives the sum of squared probabilities for that start. Now choose an ordered uniform tuple start, so the marked set $M$ is a uniform $j$-set independent of the collision graph in the full shuffle, and there are $\( n \)_j$ tuple starts. Expanding $2^(thin \# { upright("edges in ") M })$ by counting edge subsets, the expansion multiplies $h_s$, in expectation over $M$, by $\( j \)_s \/ \( n \)_s$ (interpreted as zero for $s > j$). Including factors $\( n \)_j n^(- j)$ and summing proves (189).
  For any realized graph the maximum degree is at most $d$, and the number of induced edges within any set of $u$ vertices is at most
  #[#set math.equation(numbering: n => "(190)")
   $ 1 / 2 u log_2 u . $ <tra:collision-series:eq12>]
  For (190), consider each layer, grouping these vertices by their common initial suffix of bits after the layer coordinate. The suffix and the current layer coordinate are not yet updated before that layer. Within each suffix group every collision then is between the two subgroups for the values of that coordinate, with number at most $min \( a \, b \)$ if their sizes are $a \, b$. Use
  $ 2 min \( a \, b \) lt.eq \( a + b \) log_2 \( a + b \) - a log_2 a - b log_2 b \, $
  by concavity of binary entropy, taking zero terms as zero. Summing these bounds telescopes through the groupings by suffix and proves (190).
  The exact generating identity has reduced the weighted representation trace to edge subsets in one collision graph. The induced-edge bound controls the connected edge subsets on each support. We use it next to estimate the degree-$k$ coefficient uniformly over the required range.
  For coefficient $k$ we may truncate (189) by omitting $s > k$. Bound the resulting expression times $e^(- z)$ on $\| z \| = r = k n^0.015$. Here $1 lt.eq k lt.eq n^0.62$ and $r < n \/ 2$ for large $n$. Its modulus is at most
  #[#set math.equation(numbering: n => "(191)")
   $ exp \( O \( r^2 \/ n \) \) med bb(E) sum_(s = 0)^k h_s (frac(r, n - r))^s \, $ <tra:collision-series:eq13>]
  bounding $e^(- z) \( 1 + z \/ n \)^n$ and $\| n + z \|^(- 1)$. To control the sum, the number of connected edge subsets of support size $u gt.eq 2$, in any of the graphs above, is at most
  $ n thin d^(2 u) thin u^(u \/ 2) . $
  Indeed the connected vertex sets can be found by walks of length $2 \( u - 1 \)$ through a spanning tree, and given the set use (190). A general edge subset is a collection of connected edge subsets. Dropping disjointness and truncation on totals, but still using $u lt.eq k$ for individual components, shows that the sum inside the expectation in (191) is at most
  $ exp (sum_(u = 2)^k n (d^2 sqrt(u) thin frac(r, n - r))^u) . $
  The exponent here is $o \( k \)$ uniformly. For $2 lt.eq u < 40$ the total is $O \( n \( d^2 r \/ n \)^2 \) = o \( k \)$, since $d = O \( log n \)$ and $k lt.eq n^0.62$; for $u gt.eq 40$ the number inside the parentheses raised to $u$, before taking that power, is at most $n^(- 0.05)$ for all sufficiently large $n$, so the total for those $u$ is $o \( 1 \)$. Also $r^2 \/ n = o \( k \)$. By Cauchy’s coefficient bound in (188), we get $B_k lt.eq k ! r^(- k) exp \( o \( k \) \)$, proving (187). ◻
]

=== 14.4 Closing the regular moment <closing-the-regular-moment>

#thm([Theorem 14.4.])[
  #emph[ There are uniformly bounded real exponents $q_n gt.eq 300$, for the powers of two $n gt.eq 2$, such that 
#[#set math.equation(numbering: n => "(192)")
 $ "Tr" cal(Q)_n^(q_n) med lt.eq med 1 + 1 / 8 . $ <tra:collision-series:eq1>]

 An absolute integer number of sweeps therefore has chi-square divergence at most $1 \/ 8$.]
] <tra:collision-series:moment>

#proof[
  The small-level input to the common moment closure is the positive mass $B_k$, rather than a separate bound on each block. We first convert that mass into a bound for the low-level regular trace.
  First, the total contribution in the regular trace of $cal(Q)_n^q$, for any $q gt.eq 300$, from levels $1 lt.eq k lt.eq n^0.62$, tends to zero. Indeed each such representation occurs in the corresponding $k$-tuple representation, so $f^lambda lt.eq n^k$. The sum of the single-copy positive traces of $cal(Q)_n$ at level $k$ is at most $B_k$, hence the sum of their traces for the power $q$ is at most $B_k^q$. Thus the contributions including multiplicities are at most $sum_(1 lt.eq k lt.eq n^0.62) n^k B_k^q = o \( 1 \)$.
  If the transposed partition has level $k lt.eq n^0.62$, the original diagram has height $n - k > n \/ 2$ for large $n$, and its block vanishes by Lemma 4.
  All remaining diagrams, other than the trivial representation, have dimension at least $exp \( n^0.60 \)$ for large $n$. Here are details of this coarse dimension bound. Let $b = floor.l n^0.62 floor.r$; the numbers outside the first row and outside the first column both exceed $b$. If neither the first row nor first column has length $5 b$ or greater, all hook lengths are at most $10 b$, so the hook length formula gives a sufficient lower bound. Otherwise transpose if needed, which does not change dimension, to suppose the first row has length at least $5 b$. Use a subdiagram with first row of length $4 b$ and $b$ more cells below it, chosen forming a partition there. This is possible by selecting a subdiagram of that size below the top row; in particular those cells have width at most $b$. Its tableau dimension is a lower bound for the full dimension by extension of tableaux. By filling the first $b$ cells in the top row first, and then interleaving a standard filling order in the lower $b$ cells with the remaining top row cells, we get at least $binom(4 b, b)$ standard tableaux. This suffices as well.
  Apply Lemma 19 with $nu = 2$, $epsilon = 1 \/ 8$ and $P = 300$, since $"Tr" cal(Q)_n^q = "Tr" \| T_n \|^(2 q)$. The low class consists of the levels $1 lt.eq k lt.eq n^0.62$ and the annihilated blocks. Its contribution is at most $1 \/ 16$ for all large $n$, uniformly for $q gt.eq 300$. The dimension calculation above and Proposition 64 supply
  $ H_n = n^0.60 \, #h(2em) E_n = n^0.57 \, #h(2em) alpha_d = 1 + A \/ log n . $
  With $delta_d = 1 \/ log n$,
  $ \( 1 + delta_d \) E_n - delta_d H_n = \( 1 + 1 \/ log n \) n^0.57 - n^0.60 \/ log n arrow.r - oo \, $
  and $alpha_d \( 1 + delta_d \) = 1 + O \( 1 \/ d \)$. All thresholds are independent of the child exponent. The lemma therefore proves (192) with bounded $q_n$.
  Taking an integer $s gt.eq sup_n q_n$, the Schatten-power estimate (23) bounds the nonconstant regular squared norm of $T_n^s$ by $1 \/ 8$. For convolution this is the chi-square divergence from uniform; Proposition 16 gives total variation less than $1 \/ 4$. Thus an absolute number of sweeps suffices. Lemma 6 gives the lower bound $2 d - O \( 1 \)$ in physical shuffle units. ◻
]

== 15 Level loss and a convex singular-value weight <rec:sec-grid>

The final three sections give alternative recursions across a balanced coordinate split. Their final indexed power bounds are equivalent up to the choice of an absolute exponent. The estimates preserved during the induction carry different information: the first records the level lost on restriction to the lines, the second keeps the ranks and norms of local Fourier bands, and the third supplies a pointwise smoothing bound that remains valid after conditioning a completed grid on compatibility.

Put $a = 2^(floor.l d \/ 2 floor.r)$, $b = 2^(ceil.l d \/ 2 ceil.r)$ and $n = a b$. The positions form an $a$ by $b$ grid, and $T_n = Y X$, where $X$ is the tensor product of the row sweeps and $Y$ the tensor product of the column sweeps. At this split the analytic difficulty is the overlap between the row and column Fourier subspaces. We estimate that overlap before applying the decay available in the smaller sweeps.

=== 15.1 The weight and the level deficit <the-weight-and-the-level-deficit>

For $lambda = \( n - k \, beta \)$ and $1 lt.eq j lt.eq D_lambda$, put $M = k log n$, $D = log \( D_lambda j \)$, and

#[#set math.equation(numbering: n => "(193)")
 $ cal(W) \( M \, D \) = M max { 10^(- 8) D \/ M \, \( D \/ M \)^3 } \, #h(2em) cal(W) \( 0 \, 0 \) = 0 . $ <rec:perspective-weight>]

For $k > 0$, the dimension bound $D_lambda lt.eq n^k$ gives $0 lt.eq D \/ M lt.eq 2$; the trivial type uses the convention at $\( 0 \, 0 \)$. The linear term prevents the weight from becoming too small at low dimension. The cubic term compensates for loss of level on restriction: at fixed $D$, the expression $D^3 \/ M^2$ increases when the available level mass $M$ decreases. To verify the property needed in the recursion, write $f \( u \) = max { 10^(- 8) u \, u^3 }$. It is convex on $\[ 0 \, oo \)$ and $f \( 0 \) = 0$. If $M > 0$ and $M' = sum_i M_i lt.eq M$, Jensen’s inequality, with an additional term of weight $M - M'$ and argument zero, gives

#[#set math.equation(numbering: n => "(194)")
 $ sum_i cal(W) \( M_i \, D_i \) = sum_i M_i f \( D_i \/ M_i \) gt.eq M f (frac(sum_i D_i, M)) . $ <grid:perspective-jensen>]

Terms with $M_i = 0$ have $D_i = 0$ and contribute zero. On the range $0 lt.eq D \/ M lt.eq 2$ we also have $10^(- 8) D lt.eq cal(W) \( M \, D \) lt.eq 4 D$. We will preserve the full weight through the proof, since this comparison alone does not explain how it closes under restriction.

#thm([Theorem 15.1.])[
  #emph[There is an absolute $c > 0$ such that, for every dyadic $n gt.eq 2$, every nontrivial partition $lambda tack.r n$, and $1 lt.eq j lt.eq D_lambda$, 
$ s_j \( T_n \|_(V_lambda) \) lt.eq exp { - c cal(W) \( k log n \, log \( D_lambda j \) \) } . $

 In particular all singular values are bounded by a fixed negative power of $D_lambda j$.]
] <rec:perspective-singular>

Here and below representations with more than $n \/ 2$ rows are killed by the first matching average. We therefore omit them when using dimension lower bounds.

For each direction, sum $q - rho_1$ over its line types $rho tack.r q$, and call these total levels $k_A \, k_B$. The second-overlap estimate below incurs the explicit loss

$ frac(log \( n \/ k \), 2) (k - frac(k_A + k_B, 2)) . $

The cubic perspective compensates for this term. Large-dimensional parent blocks instead use a fourth-overlap estimate, and the smallest levels are controlled directly on a larger tuple module. We establish these inputs before closing the induction. The interpolation at the end of the argument will allow an arbitrarily small positive exponent from the finite base cases.

=== 15.2 Fourth and second overlap bounds <fourth-and-second-overlap-bounds>

#thm([Lemma 15.2.])[
  #emph[There is an absolute constant $C > 0$ such that the following holds for every $n = 2^d$ with $d gt.eq 1$, on the balanced grid $a = 2^(floor.l d \/ 2 floor.r)$, $b = 2^(ceil.l d \/ 2 ceil.r)$. For each row or column line $i$, choose an irreducible type $rho_i$ of its line symmetric group. Let $V_(rho_i)$ be one carrier, put $D_(rho_i) = dim V_(rho_i)$, and choose an orthogonal projection $E_i$ on $V_(rho_i)$, extended by zero on the other Fourier types. Let $R$ and $S$ be the tensor products of these projections over the rows and columns, respectively, viewed as group-algebra operators for $S_n$. If any $E_i$ is zero, then $R S = 0$. Otherwise put 
$ r_i = "rank"_(V_(rho_i)) E_i \, #h(2em) D_c = sum_i log \( D_(rho_i) r_i \) \, $

 where the sum includes both directions. Thus $r_i$ is a positive carrier rank, and the corresponding line group-algebra projection has rank $D_(rho_i) r_i$ in the regular representation. For every $lambda tack.r n$, write $R_lambda \, S_lambda$ for the actions on one copy of $V_lambda$. Then, with unnormalized trace, 
$ D_lambda "Tr"_(V_lambda) \( R_lambda S_lambda R_lambda S_lambda \) lt.eq exp { D_c + C D_c \/ log n + C n^(1 - 1 \/ 40) } . $

 The factor $D_lambda$ is the multiplicity in the regular representation. No restriction is imposed on the parent partition $lambda$.]
] <rec:biased-grid-fourth>

#proof[
  Let $K$ and $L$ be the row and column permutation subgroups. A line projection of type $rho$ and carrier rank $r$ has regular rank $D_rho r$. Its coefficient density $f$ therefore satisfies $bb(E) \| f \|^2 = D_rho r$, and $\| f \|^2 \/ \( D_rho r \)$ is a probability density bounded by $D_rho r$, by Lemma 14. Applying that lemma to the tensor products gives
  $ D_lambda "Tr"_(V_lambda) \( R_lambda S_lambda R_lambda S_lambda \) lt.eq "Tr"_(upright("reg")) \( R S R S \) lt.eq e^(D_c) frac(n !, \| K \| \| L \|) Pr \( cal(S) \) \, $
  where row and column permutations are independent, their line laws are these squared-coefficient densities, and $cal(S)$ is their compatibility event. The lemma includes the unique-completion and inversion changes that identify this event with the four-factor trace.
  Fix the column permutations. Write $j_i \( t \)$ for the original column in row $i$ sent by the row permutation to column $t$, and $k_t \( i \)$ for the subsequent output row under the column permutation. Success requires the pairs $\( k_t \( i \) \, j_i \( t \) \)$, over all cells $\( i \, t \)$, to be distinct. Put $r_(i k)^compose = \| { t : k_t \( i \) = k } \|$. Call a cell bad if $r_(i \, k_t \( i \))^compose > b^(1 \/ 8)$, and let $H$ count the bad cells. This designation depends only on the fixed column permutations.
  Let $rho_i$ be the original law of row $i$, with density at most $K_i$ relative to its uniform law $U_i$. Put $p = Pr_(⊗_i rho_i) \( cal(S) \)$ and assume $p > 0$; the zero-probability case needs no estimate. Let $Q = \( ⊗_i rho_i \) \( thin dot.op divides cal(S) \)$, and write $Q_i$ for its row marginals. Define
  $ I = "KL" \( Q bar.v.double ⊗_i Q_i \) \, #h(2em) D = sum_i "KL" \( Q_i bar.v.double rho_i \) \, #h(2em) L_i = "KL" \( Q_i bar.v.double U_i \) . $
  The relative-entropy chain rule and the density caps give the exact identity and inequality
  #[#set math.equation(numbering: n => "(195)")
   $ - log p = I + D \, #h(2em) sum_i L_i lt.eq D + sum_i log K_i . $ <rec:biased-success-KL>]
  Indeed $"KL" \( Q bar.v.double ⊗_i rho_i \) = - log p$, and $L_i = "KL" \( Q_i bar.v.double rho_i \) + bb(E)_(Q_i) log \( d rho_i \/ d U_i \)$. These formulas retain the extra relative entropy created by conditioning on success.
  Reveal rows in independent continuous uniform priority order, and within each row use an independent uniform order of its cells. At a cell of row $i$, let $P \( j \)$ be the prediction under $Q_i$ given only the already exposed cells of that row. A symbol is called heavy at this revelation when $P \( j \) > b^(- 1 \/ 2)$. Heavy symbols are different from the bad cells defined above. Except at the last $ceil.l b^(4 \/ 5) ceil.r$ revelations of a row, the uniform permutation prediction assigns each available symbol probability at most $b^(- 4 \/ 5)$. On a heavy symbol, the nonnegative divergence term $u log \( u \/ v \) - u + v$ is at least $c u log b$. Summing the prediction divergences by the chain rule therefore gives
  #[#set math.equation(numbering: n => "(196)")
   $ bb(E)_Q \# { upright("heavy outcomes") } lt.eq C a b^(4 \/ 5) + frac(C, log b) sum_i L_i . $ <rec:biased-heavy-count>]
  Consider a good cell $\( i \, t \)$ and write $y = 1 - upright("priority") \( i \)$. In the chain-rule expression for $I$, the reference prediction is $P$, whereas the actual prediction conditions on the full past. Only symbols not already used at output row $k_t \( i \)$ are allowed. Use the unnormalized reference $P_(*) \( j \) = y P \( j \)$ on heavy symbols and $P_(*) \( j \) = P \( j \)$ on the others. If $A$ is the set of allowed symbols and $q$ is the actual conditional prediction, normalization of $P_(*) upright(bold(1))_A$ gives
  $ "KL" \( q bar.v.double P \) gt.eq - log sum_(j in A) P_(*) \( j \) + q \( upright("heavy") \) log y . $
  Conditional on the complete successful assignment, the within-row order, and $y$, every symbol at this output row belongs to exactly one packet. If that packet comes from a different input row, its row has not yet been exposed with probability $y$. There are at most $b^(1 \/ 8)$ exceptions coming from the current row. Their light symbols contribute at most $b^(1 \/ 8) b^(- 1 \/ 2)$; their heavy symbols are covered by the factor $y$. Thus the conditional expected allowed mass is at most $y + b^(- 3 \/ 8)$. Jensen’s inequality and integration over $y in \[ 0 \, 1 \]$ make the first term at least $1 - O \( b^(- 1 \/ 4) \)$. The expected cost of the second term is the heavy-outcome probability, since the assignment and within-row order are independent of the row priority and $integral_0^1 log y thin d y = - 1$.
  For bad cells retain the nonnegative raw conditional KL contribution and charge no unit saving. Summing good cells and using (196) yields $I gt.eq n - H - C n^(1 - 1 \/ 40) - a_b sum_i L_i$, where $a_b = C \/ log b$. Consequently (195) gives
  #[#set math.equation(numbering: n => "(197)")
   $ - log p gt.eq n - H - C n^(1 - 1 \/ 40) - a_b sum_i log K_i + \( 1 - a_b \) D . $ <rec:biased-entropy-absorption>]
  For sufficiently large $b$, $a_b < 1$. Discarding the nonnegative last term proves the conditional success estimate
  #[#set math.equation(numbering: n => "(198)")
   $ log p lt.eq - n + H + C n^(1 - 1 \/ 40) + frac(C, log b) sum_i log K_i . $ <rec:biased-grid-success>]
  In particular the main saving remains exactly $- n$.
  It remains to average the factor $e^H$ over the biased columns. We give the required bundle count. Put $B = floor.l b^(1 \/ 8) floor.r + 1$. A bundle chooses an input row $i$, a destination row $k$, and $B$ columns in which $k_t \( i \) = k$. A family of bundles is disjoint if its prescribed cells are disjoint. Under independent uniform column permutations, a fixed family of $s$ bundles has probability at most $\( e \/ a \)^(B s)$: a column with $u$ consistent prescribed images has probability $1 \/ \( a \)_u lt.eq \( e \/ a \)^u$. For each repeated row value with count $v gt.eq B$, pack $floor.l v \/ B floor.r$ disjoint bundles. Thus every outcome has a satisfied disjoint family with $2 B s gt.eq H$. For $c = 1 \/ 64$, summing over all possible such families, including the empty one, proves
  $ bb(E)_U b^(c H) lt.eq sum_(s gt.eq 0) {a^2 binom(b, B) \( e \/ a \)^B b^(2 c B)}^s lt.eq 2 $
  for sufficiently large $b$. Indeed the expression in braces is at most $a^2 \( 2 e^2 b^(2 c) \/ B \)^B$, which tends to zero. The joint biased column law has a density $rho$ bounded by $e^(x_C)$, where $x_C$ is the column part of $D_c$, and has mean one. Hölder with $r = c log b > 1$ yields
  $ bb(E)_U rho e^H lt.eq \( bb(E)_U rho^(r \/ \( r - 1 \)) \)^(\( r - 1 \) \/ r) \( bb(E)_U e^(r H) \)^(1 \/ r) lt.eq exp { \( x_C + log 2 \) \/ \( c log b \) } . $
  Together with (198), this supplies a compatibility probability at most $exp { - n + C n^(1 - 1 \/ 40) + C D_c \/ log n }$. The exact $- n$ cancels the factorial factor, since $log \( n ! \/ \( \| K \| \| L \| \) \) = n + O \( \( a + b \) log n \)$. Multiplication by $e^(D_c)$ from the squared coefficient masses proves the claimed bound for all sufficiently large $b$. For bounded $n gt.eq 2$, the same constant can be enlarged uniformly over all local projections. Indeed $R_lambda \, S_lambda$ are orthogonal projections, so
  $ D_lambda "Tr" \( R_lambda S_lambda R_lambda S_lambda \) lt.eq D_lambda^2 lt.eq n ! . $
  Since $D_c gt.eq 0$, a fixed multiple of $n^(39 \/ 40)$ absorbs $log \( n ! \)$ over the finitely many remaining sizes. This includes the grid $\( a \, b \) = \( 1 \, 2 \)$; a one-site line has only the trivial carrier. No estimate with denominator $log 1$ is needed. ◻
]

The middle range needs a different estimate. If $n^(3 \/ 5) < k < n^(1 - 1 \/ 250)$, set $b_0 = log \( n \/ k \)$, and let $k_A \, k_B$ be the total row and column levels of the product projections. We may assume both types occur in the restriction of $V_lambda$, since otherwise the overlap is zero. The Littlewood–Richardson rule then gives $k_A \, k_B lt.eq k$. If $"Tr" \( R S \) = 0$, the exponentiated inequality below is automatic. Otherwise assume $"Tr" \( R S \) > 0$, so that its logarithm is defined. We claim

#[#set math.equation(numbering: n => "(199)")
 $ log { D_lambda "Tr" \( R S \) } lt.eq D_c + b_0 / 2 \( k - k_A \/ 2 - k_B \/ 2 \) + C k \( log n \)^(3 \/ 4) . $ <rec:tuple-grid-second>]

To prove this, take $l = ceil.l sqrt(n k) ceil.r$ labelled marks and put $z = l \/ n$. By branching, the multiplicity of $V_lambda$ in this tuple module is $binom(l, k) D_beta$; the first-row strip and the lower diagram occupy disjoint columns. Moreover

$ binom(l, k) D_beta gt.eq D_lambda z^k e^(- C k) \, $

because $D_lambda lt.eq binom(n, k) D_beta$ and $binom(l, k) \/ binom(n, k) gt.eq \( l \/ n \)^k e^(- C k)$ in this range.

Choose now the $l$ marked sites independently and uniformly, allowing repetitions, and let $U$ be the event that they are distinct. Let $u_i$ and $v_j$ be their row and column counts. In a trace term for a row move followed by a column move, every mark must be fixed individually. Since the second move cannot change its column, the first move must fix it; the second then fixes it as well. Thus only the pointwise stabilizers of the marked sites contribute.

For a row projection of type $rho$ and carrier rank $r$, write $P_rho$ for that carrier projection. If $A$ is the set of marked sites in the row, put

$ h_rho \( A \) = r^(- 1) "Tr" \( P_rho Pi_(S_(\[ b \] \\ A)) \) \, $

where $Pi$ denotes averaging over the displayed pointwise stabilizer. This lies in $\[ 0 \, 1 \]$. The sum of the projection’s group-algebra coefficients over that stabilizer is $D_rho r thin h_rho \( A \) \/ \( b \)_(\| A \|)$. Multiplying these formulas in both directions gives the exact tuple trace identity

$ "Tr"_(\[ l \]) \( R S \) = e^(D_c) bb(E) { upright(bold(1))_U w_A w_B h_A h_B } \, #h(2em) w_A = product_i frac(b^(u_i), \( b \)_(u_i)) \, quad w_B = product_j frac(a^(v_j), \( a \)_(v_j)) . $

Here $"Tr"_(\[ l \])$ is the trace on ordered injective $l$-tuples, and $h_A \, h_B$ are the products of the corresponding local overlaps. Outside the event that all counts are admissible set the weights to zero; only $U$ contributes to the identity.

We need two bounds for this expectation. First, if a row type has level $h = b - rho_1$, then averaging its stabilizer projection over uniform marked sets of size $u$ gives a scalar projection average. The scalar is the invariant dimension divided by $D_rho$. Branching bounds the numerator by $binom(u, h) D_(macron(rho))$, while

$ D_rho gt.eq 2^(- h) binom(b, h) D_(macron(rho)) . $

For the latter inequality, construct the lower diagram one box at a time; each added box increases a top-row hook by a factor at most two. Averaging over the multinomial row counts therefore gives

$ bb(E) \( upright(bold(1))_U h_A \) lt.eq product_i frac(2^(h_i), \( b \)_(h_i)) bb(E) product_i \( u_i \)_(h_i) lt.eq \( 2 e \)^(k_A) z^(k_A) . $

We used $sum_i h_i = k_A$, $bb(E) product_i \( u_i \)_(h_i) = \( l \)_(k_A) a^(- k_A)$, and $\( b \)_h gt.eq \( b \/ e \)^h$. Conditional on row counts, dropping the probability of distinct marked columns can only increase this bound. The column argument gives $bb(E) \( upright(bold(1))_U h_B \) lt.eq \( 2 e \)^(k_B) z^(k_B)$.

Second, with $r = \( log n \)^(1 \/ 4)$,

#[#set math.equation(numbering: n => "(200)")
 $ log parallel w_A w_B parallel_r lt.eq C { l^2 \/ n + \( a + b \) log n } . $ <grid:occupancy-weight>]

Here are details of the occupancy bound. For the row counts, first use independent Poisson variables of mean $lambda = b z$ and condition their sum to be $l$. This produces the multinomial law, and the conditioning costs only $O \( log n \)$ in the logarithm of the moment. For $0 lt.eq u lt.eq b$, Stirling’s bounds give

$ log frac(b^u, \( b \)_u) lt.eq b phi.alt \( u \/ b \) + C log \( b + 1 \) \, #h(2em) phi.alt \( s \) = s + \( 1 - s \) log \( 1 - s \) . $

Use $phi.alt \( s \) lt.eq C s^2$ for $s lt.eq 1 \/ 2$ and $phi.alt \( s \) lt.eq s$ throughout $\[ 0 \, 1 \]$. The Poisson rate function is $I_lambda \( u \) = u log \( u \/ lambda \) - u + lambda$. For every $1 lt.eq s_0 lt.eq 2 r$, and all sufficiently large $n$, these inequalities imply

$ s_0 b phi.alt \( u \/ b \) lt.eq C s_0 lambda^2 \/ b + 1 / 2 I_lambda \( u \) . $

Indeed $u lt.eq C lambda$ is paid by the first term. For larger $u lt.eq b \/ 2$, compare $s_0 u^2 \/ b$ with $u log \( u \/ lambda \)$; their ratio is small uniformly because $s_0 z = o \( 1 \)$ and $s_0 \/ log \( 1 \/ z \) = o \( 1 \)$. For $u > b \/ 2$, the latter condition compares $s_0 u$ with the same rate function. Summing the Poisson probabilities times the weight to power $s_0$ now costs at most $C s_0 lambda^2 \/ b + C s_0 log n$ in its logarithm, since there are at most $b + 1$ admissible counts. Product over rows and conditioning the total give $log parallel w_A parallel_(2 r) lt.eq C \( l^2 \/ n + a log n \)$. The column bound is analogous, and Hölder proves (200); no independence between row and column counts is required.

Finally apply Hölder with exponents $r \, 2 r \/ \( r - 1 \) \, 2 r \/ \( r - 1 \)$. Since $0 lt.eq h_A \, h_B lt.eq 1$, the logarithm of the tuple trace is at most

$ D_c + C { k + \( a + b \) log n } + frac(1 - r^(- 1), 2) \( k_A + k_B \) log z + C \( k_A + k_B \) . $

All irreducible contributions to $"Tr"_(\[ l \]) \( R S \)$ are nonnegative. Divide by the multiplicity lower bound above. As $k_A \, k_B lt.eq k$, $- log z = b_0 \/ 2 + O \( 1 \)$, and $k > n^(3 \/ 5)$, the resulting error is bounded by $C k \( log n \)^(3 \/ 4)$. This is (199).

=== 15.3 Small levels and power-product interpolation <small-levels-and-power-product-interpolation>

The small-level input is an explicit contraction, rather than a finite-dimensional base case:

#[#set math.equation(numbering: n => "(201)")
 $ k lt.eq n^(3 \/ 5) quad arrow.r.double quad parallel T_n \|_(V_lambda) parallel_(upright("op")) lt.eq e^(- c k log n) . $ <rec:perspective-small-level>]

Use $l = ceil.l k n^(1 \/ 50) ceil.r$ and the permutation module on ordered injective $l$-tuples. Denote its sweep operator by $T_n^(\[ l \])$. For a fixed realization $pi$ and an $l$-set $I$ of initial sites, the endpoint of each tracked card determines its entire route through the sweep: each bit takes its final value at its unique update. An independent realization $pi'$ therefore agrees on all endpoints with probability $n^(- l) 2^(e \( I \))$, where $e \( I \)$ counts switches visited by two tracked cards. The requirements are consistent because $pi$ realizes them. Summing the squared transition probabilities over ordered initial and final tuples gives

#[#set math.equation(numbering: n => "(202)")
 $ parallel T_n^(\[ l \]) parallel_(upright("HS"))^2 = frac(\( n \)_l, n^l) bb(E)_(pi \, I) 2^(e \( I \)) lt.eq bb(E)_(pi \, I) 2^(e \( I \)) \, $ <rec:perspective-tuple-HS>]

where $I$ is uniform among $l$-subsets. This is the full tuple Hilbert–Schmidt norm; no centering is needed here.

For fixed wiring, the co-visit graph has maximum degree at most $d$. Its induced graph on any $s$ sites has at most $s log_2 s \/ 2$ edges. Indeed the recursive split into two subcubes adds at most $min \( s_0 \, s_1 \)$ edges, and $s_0 log_2 s_0 + s_1 log_2 s_1 + 2 min \( s_0 \, s_1 \) lt.eq \( s_0 + s_1 \) log_2 \( s_0 + s_1 \)$. There are at most $n d^(2 s)$ connected vertex sets of size $s$, by encoding a root and a walk along a spanning tree.

Expand an upper bound using unordered collections of disjoint connected subsets, each of size between $2$ and $l$, weighted by the product of $s^(s \/ 2)$. For a given $I$, its actual nontrivial components occur in this sum and their product bounds $2^(e \( I \))$. A collection on $u$ sites has inclusion probability $\( l \)_u \/ \( n \)_u lt.eq \( l \/ n \)^u$. After taking expectation, dropping disjointness and then using $1 + x lt.eq e^x$ gives the finite expansion

#[#set math.equation(numbering: n => "(203)")
 $ log bb(E) 2^(e \( I \)) lt.eq sum_(s = 2)^l n d^(2 s) \( l \/ n \)^s s^(s \/ 2) = O \( d^4 l^2 \/ n \) . $ <rec:perspective-finite-encounters>]

Consecutive summands have ratio at most $C d^2 \( l \/ n \) sqrt(l + 1)$. Since $l lt.eq 2 n^(31 \/ 50)$ in the stated range, this is $O \( d^2 n^(- 7 \/ 100) \) = o \( 1 \)$. The finite sum is thus bounded by a constant times its $s = 2$ term. No extension to arbitrarily large $s$ is made.

The tuple multiplicity of $V_lambda$ is $f^(lambda \/ \( n - l \))$ by branching. For all sufficiently large $n$, $n - l gt.eq k gt.eq lambda_2$, so the remaining first-row strip of length $l - k$ and the lower diagram $beta$ occupy disjoint columns. Their tableau entries can be interleaved freely, giving

#[#set math.equation(numbering: n => "(204)")
 $ f^(lambda \/ \( n - l \)) = binom(l, k) D_beta . $ <rec:perspective-tuple-multiplicity>]

The tuple action is the orthogonal sum of its irreducible blocks, with these multiplicities. Positivity of their Hilbert–Schmidt squares, (202), and (203) imply

$ parallel T_n \|_(V_lambda) parallel_(upright("op"))^2 lt.eq frac(exp \( C d^4 l^2 \/ n \), binom(l, k) D_beta) . $

Now $binom(l, k) gt.eq \( l \/ k \)^k gt.eq n^(k \/ 50)$, while $d^4 l^2 \/ n = o \( k log n \)$ uniformly for $k lt.eq n^(3 \/ 5)$. Taking square roots proves (201), for example with any fixed $c < 1 \/ 100$ after increasing the absolute starting dimension.

We first record the interpolation step that allows the exponent in the induction hypothesis to be arbitrarily small. Its conclusion concerns products of singular values, which is why the last step of the proof below treats all indices up to the requested index.

#thm([Lemma 15.3.])[
  #emph[If $A \, C$ are positive semidefinite operators on a finite-dimensional Hilbert space and $v gt.eq 1$, then, for every admissible $j$, 
#[#set math.equation(numbering: n => "(205)")
 $ product_(i = 1)^j s_i \( C A \) lt.eq (product_(i = 1)^j s_i \( C^v A^v \))^(1 \/ v) . $ <grid:perspective-power-products>]

]
] <grid:perspective-power-interpolation>

#proof[
  This is Lemma 11, including its continuity argument at zero eigenvalues. ◻
]

=== 15.4 Closing the convex-weight induction <closing-the-convex-weight-induction>

#proof[
  Write $eta = 10^(- 8)$ and $u_0 = 3 \/ 1000$. Fix a constant $c_s in \( 0 \, 1 \/ 100 \)$ for which (201) holds above an absolute cutoff, and put
  $ c_0 = min { 1 \/ 1000 \, c_s \/ 16 } . $
  In particular $12 c_0 < 1 \/ 4$. We will specify an absolute starting exponent $d_0$ after estimating the errors; its choice will depend on $c_0$ and the absolute constants in the two overlap estimates, but not on the exponent supplied by the finite base cases.
  Induct on $d = log_2 n$. Denote the available exponents for the two child sizes by $c_(floor.l d \/ 2 floor.r)$ and $c_(ceil.l d \/ 2 ceil.r)$, and set
  $ c = min { c_(floor.l d \/ 2 floor.r) \, c_(ceil.l d \/ 2 ceil.r) } \, #h(2em) v = c_0 \/ c . $
  All these exponents will lie in $\( 0 \, c_0 \]$, so $v gt.eq 1$. Fix a nontrivial $lambda = \( n - k \, beta \)$ that is not annihilated and put $M = k log n$. Since $cal(W) \( M \, D \) lt.eq 4 D lt.eq 8 M$, the range $k lt.eq n^(3 \/ 5)$ already follows from (201), with any exponent at most $c_0$. We henceforth assume $k > n^(3 \/ 5)$.
  Here is the band decomposition used at a split. For a child size $m in { a \, b }$ and a type $rho tack.r m$, let $h = m - rho_1$, $q = D_rho$, and $M_rho = h log m$. Choose an orthonormal eigenbasis, in decreasing eigenvalue order, of the appropriate absolute value $\| T_m \|$ or $\| T_m^(*) \|$ of the child sweep. For each integer $0 lt.eq t lt.eq floor.l log_2 q floor.r$, the $t$th band is the span of the eigenvectors with indices
  $ I_t = { 2^t \, dots.h \, min \( 2^(t + 1) - 1 \, q \) } . $
  Its starting index $r = 2^t$ bounds its carrier rank from above. Associate to it the number $D_rho \( r \) = log \( q r \)$. The induction hypothesis bounds the operator norm on this band by
  $ exp { - c cal(W) \( M_rho \, D_rho \( r \) \) } . $
  For the trivial type there is one band, with $M_rho = D_rho \( 1 \) = 0$. An annihilated type contributes the zero operator and may be omitted. The bound $q lt.eq m^h$ shows that every band satisfies $0 lt.eq D_rho \( r \) lt.eq 2 M_rho$.
  A row profile specifies a type and a band on each of the $a$ rows; a column profile does the same on each of the $b$ columns. We keep only product types occurring in the restriction of $V_lambda$. If their total levels are $k_A$ and $k_B$, respectively, the Littlewood–Richardson rule gives $k_A \, k_B lt.eq k$. Indeed a constituent of an induced product of the local types has first row at most the sum of their first rows. For a pair of profiles write
  #[#set math.equation(numbering: n => "(206)")
   $ D_c & = sum_i D_i \, #h(2em) F_c = sum_i cal(W) \( M_i \, D_i \) \,\
M' & = sum_i M_i = k_A log b + k_B log a lt.eq k log n = M . $ <grid:perspective-profile-parameters>]
  The sums include both directions. Thus $D_c lt.eq 2 M' lt.eq 2 M$, and (194) gives $F_c gt.eq cal(W) \( M \, D_c \)$.
  We will need a count of these profiles before using any decay exponent. There are at most $\( k + 1 \)^a$ row-level lists. For any such list $\( h_i \)$ with $sum h_i lt.eq k$, the number of row types is at most
  $ product_(i = 1)^a p \( h_i \) lt.eq exp (3 sum_(i = 1)^a sqrt(h_i)) lt.eq exp \( 3 sqrt(a k) \) . $
  Here $p \( 0 \) = 1$ and $p \( h \) lt.eq e^(3 sqrt(h))$ for $h gt.eq 1$. On each line the number of bands is at most $1 + log_2 \( m ! \) lt.eq n^2$ for $n gt.eq 4$. Since $log \( k + 1 \) lt.eq 2 log n$, the number of row profiles is at most $exp \( 4 a log n + 3 sqrt(a k) \)$. The same count for columns shows that the number $L$ of pairs of nonzero profiles satisfies
  #[#set math.equation(numbering: n => "(207)")
   $ log L lt.eq B \, #h(2em) B = 4 \( a + b \) log n + 3 \( sqrt(a) + sqrt(b) \) sqrt(k) . $ <grid:perspective-profile-count>]
  If there are no nonzero pairs, the required operator is zero and the conclusion is immediate. Hence assume $L gt.eq 1$.
  Take polar decompositions in the row and column group algebras, writing $X = A U_X$ and $Y = U_Y C$, where $A = \| X^(*) \|$ and $C = \| Y \|$. The partial isometries can be extended to unitaries in each local carrier space. Thus $T_n = U_Y C A U_X$ has the singular values of $C A$. Put $Z = C^v A^v$. If $R$ and $S$ are the projections of a row and a column profile, respectively, then
  $ Z = sum_(\( R \, S \)) C^v S R A^v . $
  The projections commute with the positive factors in their own direction. The local band estimates therefore give, for every index $r gt.eq 1$,
  #[#set math.equation(numbering: n => "(208)")
   $ s_r \( C^v S R A^v \) lt.eq e^(- c_0 F_c) s_r \( S R \) . $ <grid:perspective-profile-singular>]
  This also follows directly by factoring out the two band norms and using $s_r \( B_1 H B_2 \) lt.eq parallel B_1 parallel_(upright("op")) parallel B_2 parallel_(upright("op")) s_r \( H \)$. If a band’s actual rank is less than its starting index, the overlap estimates are still applicable: their actual parameter $sum_i log \( D_(rho_i) "rank" R_i \)$ is at most $D_c$, and each displayed upper bound increases with that parameter.
  For $1 lt.eq j lt.eq D_lambda$ set
  $ D = log \( D_lambda j \) \, #h(2em) r_j = ceil.l j \/ L ceil.r . $
  The singular-value sum inequality, or rank-$\( r_j - 1 \)$ approximations to all $L$ summands, gives
  #[#set math.equation(numbering: n => "(209)")
   $ s_j \( Z \) lt.eq L max_(\( R \, S \)) s_(r_j) \( C^v S R A^v \) \, #h(2em) log r_j gt.eq log j - B . $ <grid:perspective-rank-allocation>]
  In fact the sum of those approximations has rank at most $L \( r_j - 1 \) < j$, which verifies the index in this inequality even when $j < L$.
  First suppose $log D_lambda gt.eq n^(99 \/ 100)$. Since $"Tr" \( R S R S \) = parallel S R parallel_(S^4)^4$, Lemma 68 implies
  $ s_r \( S R \) lt.eq exp [- 1 / 4 {log \( D_lambda r \) - D_c - frac(C_4 D_c, log n) - C_4 n^(39 \/ 40)}_(+)] $
  for an absolute $C_4$. Combining this with (208) and (209) yields the indexed bound
  #[#set math.equation(numbering: n => "(210)")
   $ log s_j \( Z \) lt.eq B - min_(\( R \, S \)) [c_0 F_c + 1 / 4 {D - D_c - frac(C_4 D_c, log n) - C_4 n^(39 \/ 40) - B}_(+)] . $ <grid:perspective-dense-indexed>]
  As usual a zero singular value satisfies every such upper bound.
  The function $f \( u \) = max \( eta u \, u^3 \)$ is increasing and is $12$-Lipschitz on $\[ 0 \, 2 \]$. If $D_c gt.eq D$, Jensen’s inequality already gives $F_c gt.eq cal(W) \( M \, D \)$. Otherwise put $x = D - D_c > 0$ and
  $ E_4 = frac(C_4 D, log n) + C_4 n^(39 \/ 40) + B . $
  Jensen and the Lipschitz bound give $F_c gt.eq cal(W) \( M \, D \) - 12 x$. Since $12 c_0 lt.eq 1 \/ 4$,
  $ - 12 c_0 x + 1 / 4 \( x - E_4 \)_(+) gt.eq - 12 c_0 E_4 . $
  Thus both cases of $D_c$ in (210) imply
  #[#set math.equation(numbering: n => "(211)")
   $ log s_j \( Z \) lt.eq - c_0 cal(W) \( M \, D \) + B + 12 c_0 E_4 . $ <grid:perspective-dense-error>]
  To quantify this error, use $k lt.eq n$, $a + b lt.eq 3 sqrt(n)$ and $sqrt(a) + sqrt(b) lt.eq 3 n^(1 \/ 4)$. Above an absolute cutoff, $B lt.eq C_B n^(3 \/ 4)$ for an absolute $C_B$. Since $cal(W) \( M \, D \) gt.eq eta D$ and $D gt.eq n^(99 \/ 100)$, there is an absolute $K_4$, depending only on the already fixed $c_0 \, eta$ and $C_4$, such that
  #[#set math.equation(numbering: n => "(212)")
   $ frac(B + 12 c_0 E_4, c_0 cal(W) \( M \, D \)) lt.eq K_4 (\( log n \)^(- 1) + n^(- 3 \/ 200) + n^(- 6 \/ 25)) . $ <grid:perspective-dense-relative-error>]
  In particular none of these constants depends on $c$.
  We next justify exactly the dimension range in the other case. Suppose $log D_lambda < n^(99 \/ 100)$. The surviving shape has height at most $n \/ 2$. It must have first row longer than $n \/ 2$ once $n$ is sufficiently large. Indeed, otherwise both its width and height are at most $n \/ 2$. Transpose if necessary so that the first row has length $q = max \( lambda_1 \, lambda'_1 \)$. If $q lt.eq n \/ 8$, every hook has length at most $2 q lt.eq n \/ 4$, and the hook formula gives $D_lambda gt.eq \( 4 \/ e \)^n$. If $q > n \/ 8$, retain that first row and a subdiagram of $t = floor.l q \/ 4 floor.r$ tail boxes. Such a subdiagram exists because $n - q gt.eq n \/ 2 gt.eq t$. Its tableaux extend to the full shape. Applying (6) to the retained diagram gives
  $ D_lambda gt.eq binom(q + t, t) exp (- frac(t, q - t + 1)) gt.eq 4^t e^(- 1 \/ 3) . $
  For large $n$, $t gt.eq q \/ 8 > n \/ 64$. Both alternatives give $log D_lambda gt.eq c_1 n$ for an absolute $c_1 > 0$, contradicting the assumed upper bound. Hence $k < n \/ 2$.
  If nevertheless $k gt.eq n^(249 \/ 250)$, retain the first row of length $q = n - k > n \/ 2$ and $t = floor.l n^(249 \/ 250) floor.r$ tail boxes. For sufficiently large $n$ we have $t lt.eq q \/ 2$, so the same hook estimate implies
  $ log D_lambda gt.eq t log \( q \/ t \) - 1 gt.eq 1 / 2000 n^(249 \/ 250) log n > n^(99 \/ 100) . $
  For the middle inequality, use $t gt.eq n^(249 \/ 250) \/ 2$ and $log \( q \/ t \) gt.eq \( log n \) \/ 250 - log 2 gt.eq \( log n \) \/ 500$, and increase the cutoff to absorb the subtracted $1$. We have proved $k < n^(249 \/ 250)$. Moreover (6), now applied to $lambda$ itself, gives
  #[#set math.equation(numbering: n => "(213)")
   $ log D_lambda gt.eq k log \( n \/ k \) - 1 \, #h(2em) u := D / M gt.eq frac(log \( n \/ k \), log n) - 1 / M gt.eq u_0 . $ <grid:perspective-middle-u>]
  Here $k \/ \( n - 2 k + 1 \) lt.eq 1$ for all sufficiently large $n$, and $k > n^(3 \/ 5)$ makes $1 \/ M lt.eq 1 \/ 1000$. In particular $eta u < u^3$, so $cal(W) \( M \, D \) = M u^3$ throughout this range.
  We can therefore apply (199). Write $ell = log n$, $b_0 = log \( n \/ k \)$, $Delta = M - M' gt.eq 0$, and $tau = k - \( k_A + k_B \) \/ 2$. If $epsilon = \( log b - log a \) \/ 2 in \[ 0 \, \( log 2 \) \/ 2 \]$, then
  $ Delta = tau ell - epsilon \( k_A - k_B \) \, #h(2em) \| tau ell - Delta \| lt.eq k log 2 . $
  By (213), $b_0 \/ ell lt.eq u + 1 \/ M$. Consequently
  #[#set math.equation(numbering: n => "(214)")
   $ frac(b_0 tau, 2) lt.eq frac(u Delta, 2) + 1 / 2 + frac(k log 2, 2) lt.eq frac(u Delta, 2) + 2 k . $ <grid:perspective-middle-mass-loss>]
  The identity $"Tr" \( R S \) = parallel S R parallel_(S^2)^2$, the second-moment overlap estimate, and rank allocation now give
  #[#set math.equation(numbering: n => "(215)")
   $ log s_j \( Z \) lt.eq B - min_(\( R \, S \)) [c_0 F_c + 1 / 2 { D - D_c - 1 / 2 u Delta - E_2 }_(+)] \, #h(2em) E_2 = C_2 k ell^(3 \/ 4) + 2 k + B \, $ <grid:perspective-middle-indexed>]
  where $C_2$ is the absolute constant in (199).
  For clarity, the required tangent inequality follows directly from $x^3 gt.eq u^3 + 3 u^2 \( x - u \)$ for $x gt.eq 0$. Since $f \( x \) gt.eq x^3$ and $f \( u \) = u^3$, multiplication by each $M_i$ and summation give
  #[#set math.equation(numbering: n => "(216)")
   $ F_c & gt.eq 3 u^2 D_c - 2 u^3 M' = M u^3 - 3 u^2 G \,\
G & = D - D_c - 2 / 3 u Delta . $ <grid:perspective-middle-tangent>]
  Zero-mass terms contribute zero. Put $H = D - D_c - 1 / 2 u Delta$. The exact relation $G = H - u Delta \/ 6 lt.eq H$ is favorable in the direction needed here. If $H lt.eq E_2$, the tangent inequality gives $F_c gt.eq M u^3 - 3 u^2 E_2$. If $H > E_2$, it gives
  $ c_0 F_c + 1 / 2 \( H - E_2 \) gt.eq c_0 M u^3 - 3 c_0 u^2 E_2 + \( 1 / 2 - 3 c_0 u^2 \) \( H - E_2 \) gt.eq c_0 M u^3 - 3 c_0 u^2 E_2 \, $
  because $u lt.eq 2$ and $12 c_0 < 1 \/ 4$. Thus in either case (215) implies
  #[#set math.equation(numbering: n => "(217)")
   $ log s_j \( Z \) lt.eq - c_0 cal(W) \( M \, D \) + B + 12 c_0 E_2 . $ <grid:perspective-middle-error>]
  The count (207) and $k > n^(3 \/ 5)$ give the explicit bounds
  $ B / M lt.eq C_B (n^(- 1 \/ 10) + frac(n^(- 1 \/ 20), log n)) \, #h(2em) E_2 / M lt.eq C_2 \( log n \)^(- 1 \/ 4) + frac(2, log n) + B / M . $
  Since $cal(W) \( M \, D \) = M u^3 gt.eq u_0^3 M$, an absolute $K_2$ therefore satisfies
  #[#set math.equation(numbering: n => "(218)")
   $ frac(B + 12 c_0 E_2, c_0 cal(W) \( M \, D \)) lt.eq K_2 (\( log n \)^(- 1 \/ 4) + n^(- 1 \/ 20)) . $ <grid:perspective-middle-relative-error>]
  Again the bound is independent of $c$.
  We can now make all choices in the induction. Let $A gt.eq 1$ be an absolute constant and enlarge $d_0 gt.eq 5$ so that, whenever $d > d_0$ and $n = 2^d$, both right sides of (212) and (218) are at most $A d^(- 1 \/ 8)$. This is possible because their ratios to $d^(- 1 \/ 8)$ tend to zero. Enlarge $d_0$ further to include all previous absolute cutoffs, to have $2 A d_0^(- 1 \/ 8) lt.eq 1 \/ 2$, and to ensure
  #[#set math.equation(numbering: n => "(219)")
   $ 12 lt.eq A d^(- 1 \/ 8) cal(W) \( M \, log \( D_lambda j \) \) $ <grid:perspective-top-index-error>]
  in both remaining regimes. The last choice is uniform in $j$: in the dense regime the weight is at least $eta n^(99 \/ 100)$, and in the middle regime it is at least $u_0^3 n^(3 \/ 5) log n$. The two error inequalities prove, simultaneously for every $1 lt.eq i lt.eq D_lambda$,
  #[#set math.equation(numbering: n => "(220)")
   $ s_i \( Z \) lt.eq exp { - c_0 \( 1 - A d^(- 1 \/ 8) \) cal(W) \( M \, log \( D_lambda i \) \) } . $ <grid:perspective-powered-final>]
  Apply Lemma 69 and use that a decreasing singular-value sequence satisfies $s_j \( C A \)^j lt.eq product_(i = 1)^j s_i \( C A \)$. We obtain
  $ log s_j \( T_n \|_(V_lambda) \) lt.eq - c \( 1 - A d^(- 1 \/ 8) \) 1 / j sum_(i = 1)^j cal(W) \( M \, log \( D_lambda i \) \) . $
  No individual-singular-value interpolation is being assumed. The same $12$-Lipschitz bound used above gives
  $ cal(W) \( M \, log \( D_lambda i \) \) gt.eq cal(W) \( M \, log \( D_lambda j \) \) - 12 log \( j \/ i \) . $
  Since $log \( j ! \) gt.eq j log j - j$, the average of $log \( j \/ i \)$ over $1 lt.eq i lt.eq j$ is at most $1$. Thus the average weight is at least $cal(W) \( M \, log \( D_lambda j \) \) - 12$. In view of (219), this proves the inductive conclusion with exponent
  #[#set math.equation(numbering: n => "(221)")
   $ c_d = \( 1 - 2 A d^(- 1 \/ 8) \) min { c_(floor.l d \/ 2 floor.r) \, c_(ceil.l d \/ 2 ceil.r) } . $ <grid:perspective-exponent-recursion>]
  The small-level estimate, considered at the start, also holds with this exponent.
  For $1 lt.eq d lt.eq d_0$ choose a common $c_(*) in \( 0 \, c_0 \]$ so small that the desired inequality holds for every nontrivial type and every singular index. Such a choice exists by Lemma 5, because there are only finitely many matrices, $cal(W) lt.eq 8 k log n$, and zero operators need no restriction on $c_(*)$. Define $c_d = c_(*)$ on this finite range and use (221) thereafter. This does not change the previously chosen cutoff.
  Every multiplier in (221) is at least $1 \/ 2$ by the choice of $d_0$. The minimum selects a branch of rounded halvings. Lemma 18, with $gamma = 1 \/ 8$, therefore gives $inf_d c_d > 0$. Taking this infimum as the theorem’s exponent completes the proof. ◻
]

== 16 Fourth moments of singular bands <rec:sec-bands>

We now retain the carrier rank of each local singular band directly in a fourth moment. The overlap estimate applies to local factors with a specified Fourier type, rank and operator norm. Raising the child factors to a suitable power cancels the rank cost, and interpolation returns to the original sweep. The resulting indexed power bound is equivalent, after changing an absolute exponent, to Theorem 67; this proof does not carry its level–dimension weight.

=== 16.1 The sparse estimate from coordinate chunks <the-sparse-estimate-from-coordinate-chunks>

The sparse argument uses a complete sweep followed by a partially coupled reversed sweep. Cancellation forces every tracked label to meet another during the second sweep. A fixed number of coordinate chunks converts this coverage event into an occupation bound supplied by the first sweep.

Here the sparse input works up to any fixed power less than one. For each fixed $0 < delta < 1$, there are $c_delta > 0$ and $n_delta < oo$ such that, for every dyadic $n gt.eq n_delta$ and every $lambda tack.r n$,

#[#set math.equation(numbering: n => "(222)")
 $ 0 lt.eq k = n - lambda_1 lt.eq n^(1 - delta) quad arrow.r.double quad parallel T_n \|_(V_lambda) parallel_(upright("op")) lt.eq e^(- c_delta k log n) . $ <rec:chunk-sparse>]

We will use this with $delta = 1 \/ 200$.

#proof[
  For $k = 0$ the type is trivial and the assertion is $1 lt.eq 1$. We specify the tuple kernels and their normalization first. Let $cal(X)_k$ be the ordered injective $k$-tuples of sites. Write $P \( x \, y \)$ for the forward sweep transition probability on this space, with input index $x$ and output index $y$. As an operator on tuple functions this is the adjoint of the homomorphic sweep action, and has the same singular values on every irreducible block. For $I subset.eq \[ k \]$, define
  #[#set math.equation(numbering: n => "(223)")
   $ Q_I \( x \, y \) = n^(- \( k - \| I \| \)) Pr { g \( x_I \) = y_I } \, #h(2em) x \, y in cal(X)_k . $ <rec:sparse-partial-kernel>]
  Before restriction to injective outputs, this kernel moves the $I$-labels with one common sweep and moves every other label by its own independent fair bit at each coordinate. The latter endpoints are independent uniform sites. Thus $Q_I$ has row sums at most $1$. Its transpose has the same description using the reversed sweep, and has row sums at most $1$ as well. All sums here are counting sums of transition probabilities. Rescaling the tuple inner product to uniform probability does not change the operator or its norm.
  The block $lambda = \( n - k \, beta \)$ occurs on $cal(X)_k$ and does not occur on any proper subset of its slots. For $I eq.not \[ k \]$, both the range of $Q_I$ and the range of $Q_I^(*)$ consist of functions of the $I$-coordinates. These ranges have no $lambda$-part by branching. Consequently
  #[#set math.equation(numbering: n => "(224)")
   $ Z = sum_(I subset.eq \[ k \]) \( - 1 \)^(k - \| I \|) Q_I quad upright("satisfies") quad Z \|_lambda = P \|_lambda \, #h(2em) Z^(*) \|_lambda = P^(*) \|_lambda . $ <rec:sparse-centered-kernel>]
  Here and below a restriction to $lambda$ may include all its copies in the tuple module.
  Given endpoints $x \, y$, the path of each label through a sweep is unique: its updated coordinates have their values in $y$ and its remaining coordinates have their values in $x$. Join two labels when these paths use the same switch at some time, including an inconsistent use of the same switch input. Let $Gamma \( x \, y \)$ mean that this graph has no isolated vertex. If a label is isolated, its prescribed switches are independent of those prescribed by all the other labels. Adding this label to $I$ therefore multiplies its joint endpoint probability by $1 \/ n$, exactly canceled by the change in the prefactor in (223). Pairing terms with and without that label proves
  #[#set math.equation(numbering: n => "(225)")
   $ \| Z \( x \, y \) \| lt.eq upright(bold(1))_(Gamma \( x \, y \)) sum_(I subset.eq \[ k \]) Q_I \( x \, y \) . $ <rec:sparse-cover-majorant>]
  For $k = 1$ the two terms are identical, so $Z = 0$ and the assertion follows. Henceforth take $k gt.eq 2$.
  On the $lambda$-part, $P Z^(*) = P P^(*)$ is positive semidefinite. An absolute row-sum bound for $P Z^(*)$ therefore bounds $parallel P \|_lambda parallel_(upright("op"))^2$: apply the operator to an eigenvector of $P P^(*) \|_lambda$ and choose a coordinate of maximum absolute value. By (225), it suffices to bound, uniformly in an initial injective tuple, the following experiment for each $I$. Run a full sweep, obtaining an injective intermediate tuple $z$; then run a partially coupled reversed sweep, jointly on $I$ and independently on the other labels, and ask for $Gamma$ in this second sweep. Dropping injectivity of the final tuple only increases the nonnegative bound. This description follows exactly by multiplying $P \( x \, z \) Q_I \( y \, z \)$ and summing over $z \, y$; no replacement of the two-sweep law is made.
  The occupied set of $z$ satisfies
  #[#set math.equation(numbering: n => "(226)")
   $ Pr { A subset.eq { z_1 \, dots.h \, z_k } } lt.eq \( k \/ n \)^(\| A \|) $ <rec:chunk-intermediate-occupation>]
  for every fixed set of sites $A$. This is the case $r = k$, $s = 0$ of Lemma 50, applied to singleton test sets. Its hypotheses hold because this first sweep moves all $k$ labels jointly from distinct sites.
  Put $L = floor.l delta d \/ 2 floor.r$ and partition the second sweep’s chronological coordinate list into $J = ceil.l d \/ L ceil.r$ nonempty consecutive chunks, each of length at most $L$. For sufficiently large $d$, $L gt.eq 1$ and $J lt.eq J_delta := ceil.l 4 \/ delta ceil.r + 1$. A chunk of length $ell$ partitions sites into bins of size $s = 2^ell lt.eq n^(delta \/ 2)$, according to all the coordinates outside that chunk. Each path stays in its bin throughout the chunk. Every contact therefore lies in a bin containing at least two labels at the start of that chunk.
  On $Gamma$, every label is in such a bin in at least one chunk. Thus some chunk has at least $k \/ J$ labels in bins of occupancy at least two. Define
  $ r = max { 1 \, floor.l k \/ \( 2 J \) floor.r } . $
  If $k gt.eq 2 J$, then $2 r lt.eq k \/ J$. If there are at least $r$ multiply occupied bins, take any $r$ of them. Otherwise take all of them and pad to $r$ bins: their total occupancy is still at least $k \/ J gt.eq 2 r$. If $k < 2 J$, coverage supplies at least one contact, so some chunk has one bin with two labels and the same conclusion holds with $r = 1$. There are enough bins for padding, since $n \/ s gt.eq n^(1 - delta \/ 2) > k gt.eq r$ for large $n$. In all cases
  #[#set math.equation(numbering: n => "(227)")
   $ r gt.eq k \/ \( 4 J \) \, #h(2em) Gamma med arrow.r.double med upright("some chunk has ") r upright(" bins containing at least ") 2 r upright(" labels") . $ <rec:chunk-selected-bins>]
  Fix a chunk and a specified union $A$ of $r$ of its bins. Then $\| A \| = r s$. Presample the partially coupled motion from the beginning of the second sweep to this chunk. Use one common random permutation $phi.alt$ for the $I$-labels. Independently, for every possible starting site $v$, sample one independent walk with endpoint $xi_v$ after that prefix. If $z_i = v$ and $i in.not I$, use this walk for label $i$. The $z_i$ are distinct, so this site-indexed construction gives exactly independent walks for those labels. All these random maps are independent of the first sweep.
  Put $C = phi.alt^(- 1) \( A \)$ and $D = { v : xi_v in A }$. The number of labels in $A$ at the start of the chunk is at most the number of occupied intermediate sites in $C union D$. We have $\| C \| = r s$, while $W = \| D \|$ is a sum of independent Bernoulli variables with mean $r s$. Indeed the transition matrix of any coordinate prefix is doubly stochastic, so $sum_v Pr \( xi_v in A \) = \| A \|$. Consequently $bb(E) binom(W, j) lt.eq \( r s \)^j \/ j !$. Conditioning on the presampled maps and using (226), then averaging, gives
  $ Pr { upright("at least ") 2 r upright(" labels in ") A } & lt.eq \( k \/ n \)^(2 r) bb(E) binom(r s + W, 2 r)\
 & lt.eq \( k \/ n \)^(2 r) sum_(j = 0)^(2 r) frac(\( r s \)^(2 r - j), \( 2 r - j \) !) frac(\( r s \)^j, j !)\
 & = \( k \/ n \)^(2 r) frac(\( 2 r s \)^(2 r), \( 2 r \) !) . $
  This is an unconditional preimage calculation. It does not condition the intermediate tuple on previous contacts. Summing over choices of the $r$ bins yields
  $ binom(n \/ s, r) \( k \/ n \)^(2 r) frac(\( 2 r s \)^(2 r), \( 2 r \) !) lt.eq (frac(e^3 k^2 s, n r))^r lt.eq \( C J k s \/ n \)^r . $
  Now $k s \/ n lt.eq n^(- delta \/ 2)$. For all sufficiently large $n$, depending only on $delta$, this last bound is at most $n^(- delta r \/ 4) lt.eq n^(- delta k \/ \( 16 J_delta \))$. Union over the $J$ chunks and the $2^k$ choices of $I$ therefore gives
  $ sup_x sum_y \| \( P Z^(*) \) \( x \, y \) \| lt.eq 2^k J_delta n^(- delta k \/ \( 16 J_delta \)) lt.eq n^(- delta k \/ \( 32 J_delta \)) . $
  The positive-block eigenvalue argument above and a square root prove (222), for example with $c_delta = delta \/ \( 64 J_delta \)$ after increasing the starting size. The separate $k = 1$ argument supplies the smallest level without any padding or rounding exception. ◻
]

=== 16.2 A fourth moment with local ranks <a-fourth-moment-with-local-ranks>

#thm([Lemma 16.1.])[
  #emph[Put $m = min \( a \, b \)$ and assume $a \, b lt.eq 2 m$, with $m$ sufficiently large. Write $K = \( S_b \)^a$ and $L = \( S_a \)^b$ for the row and column groups. Let $Y = Y_L Y_K$, where $Y_K$ and $Y_L$ are tensor products of operators on the row and column permutation groups. Assume each local factor is supported in one irreducible Fourier matrix of dimension $D_i$, has rank at most $r_i$, and has operator norm at most $b_i$. If a local factor is zero, then $Y = 0$. Otherwise $r_i > 0$ for every $i$; put $x = sum_i log \( D_i r_i \)$. In this case, for every $lambda tack.r n = a b$, 
$ D_lambda "Tr" \| Y_lambda \|^4 lt.eq exp { C n m^(- 1 \/ 16) + C x \/ log m } product_i D_i r_i b_i^4 . $

]
] <rec:band-grid-entropy>

#proof[
  The combinatorial assertion needed after expanding matrix coefficients is a bound on compatibility between biased row and column permutations:
  $ frac(\| S_n \|, \| K \| \| L \|) Pr \( upright("compatible") \) lt.eq exp { C n m^(- 1 \/ 16) + C \( x_K + x_L \) \/ log m } . $
  Here a row law has density at most $e^(x_i)$ and a column law $q_c$ has density at most $e^(x'_c)$ relative to the appropriate uniform permutation law; set $x_K = sum_i x_i$ and $x_L = sum_c x'_c$. Fix the row permutations $sigma_i$. Form a bipartite multigraph whose left vertices are output columns $c$ and whose right vertices are original columns $j$, with an edge of index $i$ when $sigma_i \( j \) = c$. Its degree is $a$ and its edge multiplicities are $m_(c j)$. The column permutation $tau_c$ assigns color $tau_c \( i \)$ to that edge. Compatibility is exactly the requirement that these colors are proper also at the right vertices. Put $H = sum_(c \, j : thin m_(c j) gt.eq m^(1 \/ 2)) m_(c j)$.
  Let $p$ be the probability of proper coloring under $⊗_c q_c$. For $p > 0$, let $nu$ be that law conditioned on proper coloring, with column marginals $nu_c$. Write $cal(H)$ for Shannon entropy, and define
  #[#set math.equation(numbering: n => "(228)")
   $ h_c & = log \( a ! \) - cal(H) \( nu_c \) = "KL" \( nu_c bar.v.double U_c \) \,\
I & = sum_c cal(H) \( nu_c \) - cal(H) \( nu \) \, & D & = sum_c "KL" \( nu_c bar.v.double q_c \) . $ <rec:band-conditioned-KL>]
  Here $U_c$ is uniform on the $a !$ column permutations. The same chain rule as in (195) gives $- log p = I + D$ and $sum_c h_c lt.eq D + x_L$.
  Reveal colors in order, and for each color expose its edges in an independent random priority order of the left vertices $c$. Let $p_c$ be the prediction of its edge under the marginal $nu_c$ given its own earlier colors, and let $P_j$ be the resulting target distribution. The chain-rule sum of the true predictions’ expected KL divergences from these marginal predictions is $I$. At a successful coloring, only targets unused by earlier vertices in this color are allowed. Conditional on the coloring and current priority, each target other than the actual target $j^(*)$ belongs to one other vertex in the color matching. It remains available with probability $t$, where $t$ is uniform on $\[ 0 \, 1 \]$. Jensen therefore gives the integrated lower bound
  $ integral_0^1 - log \( t + \( 1 - t \) P_(j^(*)) \) thin d t = 1 - ell \( P_(j^(*)) \) \, #h(2em) ell \( z \) = frac(- z log z, 1 - z) lt.eq min \( 1 \, C sqrt(z) \) \, $
  with continuous endpoint values.
  The last $ceil.l m^(3 \/ 4) ceil.r$ colors cost at most $b m^(3 \/ 4)$ in lost unit contributions. Targets with multiplicity at least $m^(1 \/ 2)$ cost at most $H$. At any other exposure, with at least $v gt.eq m^(3 \/ 4)$ colors remaining, a light target has mass at most $m^(- 1 \/ 4)$ under the image of the uniform prediction on the $v$ remaining edges. If $P_j < m^(- 1 \/ 8)$, its loss is at most $C m^(- 1 \/ 16)$. For the other light targets let $z$ be their total $P$-mass. Projecting the prediction divergence $e = log v - cal(H) \( p_c \)$ onto the target distribution and using log-sum on the complement gives $e gt.eq z \( log m \) \/ 8 - z$. Hence $z lt.eq C e \/ log m$ for large $m$. The expected sum of these prediction divergences at vertex $c$ is exactly $h_c$ by the marginal entropy chain rule. Summing all losses proves
  #[#set math.equation(numbering: n => "(229)")
   $ I gt.eq n - C n m^(- 1 \/ 16) - H - a_m sum_c h_c \, #h(2em) a_m = C \/ log m . $ <rec:band-total-correlation>]
  Adding $D$ and using (228) now gives, with the same positive remainder as in (197),
  #[#set math.equation(numbering: n => "(230)")
   $ - log p gt.eq n - C n m^(- 1 \/ 16) - H - a_m x_L + \( 1 - a_m \) D . $ <rec:band-entropy-absorption>]
  For large $m$, discard the last term. Thus, conditionally on the rows, $p lt.eq exp \( - n + C n m^(- 1 \/ 16) + H + C x_L \/ log m \)$. When $p = 0$ this bound is automatic.
  Under uniform independent row permutations, a witness count gives, for an absolute $eta > 0$,
  $ bb(E) exp \( eta log m thin H \) lt.eq 2 . $
  Indeed, if $H = h > 0$, its heavy cells number at most $h \/ m^(1 \/ 2)$. Choosing those cells and their row incidences, and then specifying the row-permutation images, gives probability at most $h b^(2 h \/ m^(1 \/ 2)) \( e^2 a \/ \( b m^(1 \/ 2) \) \)^h lt.eq e^(- c h log m)$. Here a consistent specification of $u$ images in one row has probability $1 \/ \( b \)_u lt.eq \( e \/ b \)^u$; inconsistent specifications have probability zero. Summing this tail proves the displayed moment. The biased row density has mean one and is bounded by $e^(x_K)$. Hölder with exponent $eta log m$ therefore gives $bb(E)_(upright("biased")) e^H lt.eq \( 2 e^(x_K) \)^(1 \/ \( eta log m \))$. Average the conditional success bound and use the factorial normalization $log \( \| S_n \| \/ \( \| K \| \| L \| \) \) lt.eq n + C log n$. The exact $- n$ term cancels, leaving the asserted compatibility bound.
  To pass to arbitrary local factors, put $X_L = Y_L^(*) Y_L$ and $X_K = Y_K Y_K^(*)$. Cyclicity identifies $"Tr" \| Y \|^4$ with $"Tr" \( X_L X_K X_L X_K \)$. A local positive factor has regular rank at most $D_i r_i$ and regular squared Hilbert–Schmidt norm at most $D_i r_i b_i^4$. Lemma 14 therefore bounds the regular four-factor trace by the compatibility probability just estimated, multiplied by $product_i D_i r_i b_i^4$. The lemma’s squared-coefficient densities have caps at most $D_i r_i$, so the parameter in that probability estimate is $x = sum_i log \( D_i r_i \)$. Each irreducible contribution is nonnegative and has multiplicity $D_lambda$, proving the displayed bound. ◻
]

=== 16.3 Closing the singular-band recursion <closing-the-singular-band-recursion>

#thm([Theorem 16.2.])[
  #emph[There is an absolute $alpha > 0$ such that $s_t \( T_n \|_(V_lambda) \) lt.eq \( D_lambda t \)^(- alpha)$ for every dyadic $n gt.eq 2$, every $lambda tack.r n$, and every $1 lt.eq t lt.eq D_lambda$.]
] <rec:all-rank-power>

#proof[
  Lemma 9 gives, for square matrices $A_1 \, A_2$ and real $P gt.eq q gt.eq 1$,
  #[#set math.equation(numbering: n => "(231)")
   $ parallel A_2 A_1 parallel_(S^P) lt.eq parallel \| A_2 \|^(P \/ q) \| A_1^(*) \|^(P \/ q) parallel_(S^q)^(q \/ P) . $ <rec:band-power-interpolation>]
  This applies to noninvertible factors and uses unnormalized norms.
  We now prove the recursive estimate. Suppose that the two smaller sweeps satisfy the theorem with a common exponent $0 < macron(alpha) lt.eq 1 \/ 8$. A smaller exponent weakens the assertion, so later we will take the minimum of the two inherited exponents. Write $m = min \( a \, b \)$, $ell = log m$, and
  $ p = frac(1 + K_0 \/ ell, 4 macron(alpha)) \, $
  where the absolute constant $K_0$ will be fixed below. In particular $p gt.eq 2$. Recall the row-first factorization $T_n = Y X$. The positive matrices $\| Y \|$ and $\| X^(*) \|$ are tensor products of the corresponding local absolute values on the column and row groups. Each local absolute value has exactly the singular values of a child sweep.
  Here is a finite band decomposition whose bounds do not depend on how small $macron(alpha)$ is. On a local type $rho tack.r q$, with $q = a$ or $b$, put $D = D_rho$ and list the positive eigenvalues of its absolute value $S_rho$ in nonincreasing order: $sigma_1 gt.eq dots.h.c gt.eq sigma_R > 0$, where $R lt.eq D$. Fix an orthonormal eigenbasis, including an arbitrary choice within a repeated eigenspace. For each nonempty index block
  $ I_v = { 2^v \, dots.h \, min \( 2^(v + 1) - 1 \, R \) } \, #h(2em) v gt.eq 0 \, $
  let $E_(rho \, v)$ be the projection onto those eigenvectors and let $r_(rho \, v) = \| I_v \|$. Then $r_(rho \, v) lt.eq 2^v$, and the inductive estimate gives the exact bound
  #[#set math.equation(numbering: n => "(232)")
   $ parallel S_rho^p E_(rho \, v) parallel_(upright("op")) lt.eq \( D_rho thin 2^v \)^(- p macron(alpha)) lt.eq \( D_rho r_(rho \, v) \)^(- p macron(alpha)) . $ <rec:band-local-rank-bound>]
  There is no contribution from a zero eigenspace. This also handles a local trivial type: its only eigenvalue is $1$ and $D_rho r_(rho \, 0) = 1$. A local type killed by the child sweep has no bands.
  Fourier inversion realizes each $S_rho^p E_(rho \, v)$ as a local group-algebra operator supported in that one Fourier matrix, zero in every other type. Summing these operators over types and bands gives the local positive power. Tensoring over lines and distributing the two products therefore expresses $\| Y \|^p \| X^(*) \|^p$ as a finite sum of operators $Z_pi$. A profile $pi$ chooses a type and one nonempty band on each of the $a + b$ lines. No restriction multiplicity has to be counted separately: each such local Fourier operator already acts on all its multiplicity copies when extended to $S_n$. Profiles whose extensions vanish on $V_lambda$ may be discarded, and keeping them only enlarges the count below.
  Let $frak(p) \( q \)$ denote the number of partitions of $q$. The partition generating product, evaluated at $e^(- q^(- 1 \/ 2))$, gives $frak(p) \( q \) lt.eq e^(C sqrt(q))$. Also $D_rho lt.eq q !$, so the number of nonempty index bands in any type is at most $1 + log_2 D_rho lt.eq C q log \( q + 1 \)$. Consequently the number $N_q$ of type-band choices on a line of size $q$ satisfies
  $ N_q lt.eq e^(C sqrt(q)) thin C q log \( q + 1 \) . $
  Since $m lt.eq a \, b lt.eq 2 m$, the number $cal(N)$ of profiles obeys
  #[#set math.equation(numbering: n => "(233)")
   $ log cal(N) lt.eq a log N_b + b log N_a lt.eq C m^(3 \/ 2) log m . $ <rec:band-profile-count>]
  The elementary partition bound used here can also be seen by expanding the logarithm of the generating product: $sum_(j \, r gt.eq 1) e^(- j r \/ sqrt(q)) \/ r lt.eq sqrt(q) sum_(r gt.eq 1) r^(- 2)$. In particular every constant in (233) is independent of $macron(alpha)$.
  For a profile put $x_pi = sum_i log \( D_i r_i \)$. Lemma 70 and (232) give
  $ D_lambda parallel Z_pi \|_(V_lambda) parallel_(S^4)^4 & lt.eq exp { C_0 n m^(- 1 \/ 16) + \( 1 + C_0 \/ ell - 4 p macron(alpha) \) x_pi }\
 & = exp { C_0 n m^(- 1 \/ 16) + \( C_0 - K_0 \) x_pi \/ ell } . $
  Fix $K_0 gt.eq C_0 + 1$. Because $x_pi gt.eq 0$, the last quantity is at most $exp \( C_0 n m^(- 1 \/ 16) \)$. Summation uses the triangle inequality for $S^4$, rather than an unjustified addition of fourth powers:
  $ parallel \( \| Y \|^p \| X^(*) \|^p \) \|_(V_lambda) parallel_(S^4) & lt.eq sum_pi parallel Z_pi \|_(V_lambda) parallel_(S^4)\
 & lt.eq cal(N) D_lambda^(- 1 \/ 4) exp \( C_0 n m^(- 1 \/ 16) \/ 4 \) . $
  For all sufficiently large $m$, the counting error in (233) is smaller than a constant multiple of $n m^(- 1 \/ 16)$. Thus, with a fixed absolute $C_1$ and $E_n = C_1 n m^(- 1 \/ 16)$,
  #[#set math.equation(numbering: n => "(234)")
   $ D_lambda parallel \( \| Y \|^p \| X^(*) \|^p \) \|_(V_lambda) parallel_(S^4)^4 lt.eq e^(E_n) . $ <rec:band-summed-fourth>]
  Indeed $4 log cal(N) = O \( m^(3 \/ 2) log m \)$, whereas $n m^(- 1 \/ 16) gt.eq m^(31 \/ 16)$. None of the thresholds or constants in this step depends on $p$ or $macron(alpha)$.
  Apply (231) on $V_lambda$, with $P = 4 p$ and $q = 4$. Equation (234), with $T_lambda = T_n \|_(V_lambda)$, yields
  $ "Tr" \| T_lambda \|^(4 p) lt.eq e^(E_n) \/ D_lambda . $
  For each $1 lt.eq t lt.eq D_lambda$, decreasing order of the singular values gives $t thin s_t \( T_n \|_(V_lambda) \)^(4 p) lt.eq "Tr" \| T_lambda \|^(4 p)$. We have proved
  #[#set math.equation(numbering: n => "(235)")
   $ s_t \( T_n \|_(V_lambda) \) lt.eq exp {- frac(macron(alpha), 1 + K_0 \/ log m) #scale(x: 120%, y: 120%)[\(] log \( D_lambda t \) - E_n #scale(x: 120%, y: 120%)[\)]} . $ <rec:band-interpolation-loss>]
  If the singular value is zero the inequality is automatic. This argument derives the factor $t$ from a Schatten moment; it does not require the sweep to be normal.
  We give the dimension estimate needed to absorb $E_n$. For every shape with at most $n \/ 2$ rows,
  #[#set math.equation(numbering: n => "(236)")
   $ log D_lambda gt.eq c_1 k \, #h(2em) k = n - lambda_1 \, $ <rec:band-dimension-lower>]
  for an absolute $c_1 > 0$ and all sufficiently large $n$. To check it, put $r = max \( lambda_1 \, lambda'_1 \)$ and transpose temporarily if necessary. If $r lt.eq n \/ 8$, all hooks have length at most $2 r$, so the hook formula gives $D_lambda gt.eq n ! \/ \( 2 r \)^n gt.eq e^(c n)$. If $n \/ 8 < r lt.eq 3 n \/ 4$, retain a first row of length $r$ and $j = floor.l r \/ 4 floor.r$ boxes below it. Fill its first $j$ top-row boxes first, and then freely interleave the remaining top row with a fixed standard order on the lower diagram. Its width is at most $j$, so these are standard tableaux, and there are $binom(r, j) gt.eq e^(c r)$ of them. They extend to the full diagram. Finally, $r > 3 n \/ 4$ must mean $r = lambda_1$, because $lambda'_1 lt.eq n \/ 2$. Now $k < n \/ 4$ and the same construction with $j = k$ gives $D_lambda gt.eq binom(r, k) gt.eq \( r \/ k \)^k gt.eq 3^k$. These three cases prove (236); the case $k = 0$ requires no lower bound.
  For the dense range $k > n^(1 - 1 \/ 200)$ and a shape not killed by the matching average, let $L = log \( D_lambda t \)$. Then $L gt.eq c_1 n^(1 - 1 \/ 200)$. Since $m^2 lt.eq n lt.eq 2 m^2$,
  $ E_n / L lt.eq C n^(thin 1 \/ 200 - 1 \/ 32) = C n^(- 21 \/ 800) lt.eq 1 / d $
  for all sufficiently large $d$, with a threshold independent of $macron(alpha)$. For $d gt.eq 3$ also $K_0 \/ log m lt.eq c_2 \/ d$, where $c_2 = 3 K_0 \/ log 2$. It follows that
  $ frac(1 - E_n \/ L, 1 + K_0 \/ log m) gt.eq frac(1 - 1 \/ d, 1 + c_2 \/ d) gt.eq 1 - C_(*) / d \, #h(2em) C_(*) = 1 + c_2 . $
  Thus (235) proves the inductive claim in this range with exponent $macron(alpha) \( 1 - C_(*) \/ d \)$.
  For $1 lt.eq k lt.eq n^(1 - 1 \/ 200)$, write $c_(upright(s)) > 0$ for the fixed constant in (222). The elementary bound $D_lambda lt.eq n^k$ and $t lt.eq D_lambda$ give $L lt.eq 2 k log n$. Consequently
  $ s_t \( T_n \|_(V_lambda) \) lt.eq e^(- c_(upright(s)) k log n) lt.eq \( D_lambda t \)^(- c_(upright(s)) \/ 2) . $
  This handles the sparse range whenever the exponent being proved is at most $c_(upright(s)) \/ 2$. The trivial representation has $D_lambda = t = 1$ and sweep equal to $1$, so the theorem is equality there. The sign representation is zero. Every other shape killed by a matching layer, and every further null block, satisfies the assertion with every positive exponent.
  It remains to choose the base and verify a uniform positive exponent. Choose an absolute integer $d_0 > 2 C_(*)$ so large that every large-size estimate just used holds for $d > d_0$, including the sparse input, the line-group entropy estimate, the profile absorption, and $E_n \/ L lt.eq 1 \/ d$. This choice has been made without specifying an inherited exponent. Lemma 5 then supplies a common positive base exponent $alpha_0 lt.eq min \( 1 \/ 8 \, c_(upright(s)) \/ 2 \)$ at the finitely many sizes $1 lt.eq d lt.eq d_0$, exactly as in the finite-base step of Theorem 67. Indeed each nonzero, nonconstant block has norm below one and only finitely many ranks; zero blocks impose no restriction. The trivial and sign blocks were handled above.
  Set $alpha_d = alpha_0$ for $d lt.eq d_0$, and, for $d > d_0$, define
  $ alpha_d = (1 - C_(*) / d) min { alpha_(floor.l d \/ 2 floor.r) \, alpha_(ceil.l d \/ 2 ceil.r) } . $
  The preceding argument proves the theorem with $alpha_d$ by induction. All these numbers are at most $alpha_0$, so both the condition $macron(alpha) lt.eq 1 \/ 8$ in interpolation and the sparse comparison remain valid. The minimum selects a branch of rounded halvings, and all multipliers $1 - C_(*) \/ d$ are at least $1 \/ 2$. By Lemma 18 with $gamma = 1$, their products are bounded away from zero. Thus $alpha := inf_d alpha_d > 0$ is a common exponent for every type and rank. For example, a fixed integer $R$ with $2 alpha R gt.eq 3$ then gives $D_lambda parallel T_n \( lambda \)^R parallel_(upright("HS"))^2 lt.eq D_lambda^(thin 2 - 2 alpha R) lt.eq D_lambda^(- 1)$, the inverse-dimension estimate used in the common mixing conversion. ◻
]

== 17 Pointwise smoothing and conditioned grid entropy <sec:smoothed-grid>

We now construct line densities whose smoothing estimate holds at each permutation. It can therefore be used after the entire row–column grid has been conditioned on compatibility, provided each auxiliary subset retains its Bernoulli law independently of the completed array. This pointwise estimate is the additional output of the present route. Its final indexed singular-value bound has the same form as that of Section 16.

For the final recursion, put $n = 2^d$, $a = 2^(floor.l d \/ 2 floor.r)$ and $b = 2^(ceil.l d \/ 2 ceil.r)$. Write $T_n = Y X$, where $X$ is the tensor product of row sweeps on the $a$ by $b$ grid and $Y$ the tensor product of column sweeps. The pointwise construction first treats one line. We then use it in a complete-grid entropy exposure, prove a separate sparse estimate by chronological mergers, and combine the two estimates at a split.

=== 17.1 A pointwise density construction <a-pointwise-density-construction>

#thm([Lemma 17.1.])[
  #emph[Let $mu tack.r q$, $j = q - mu_1$, and $ell = log m$, where $m lt.eq q lt.eq 2 m$ and $m$ is sufficiently large. Let $cal(C)_mu$ be the space spanned by the matrix coefficients of $V_mu$, with the $L^2$ inner product for uniform measure on $S_q$. Put 
$ p_t = e^(- sqrt(ell) - t) \, quad 0 lt.eq t lt.eq floor.l ell \/ 32 - sqrt(ell) floor.r \, #h(2em) h_0 = floor.l ell^(- 4) j floor.r . $

 For each $a in cal(C)_mu$ with $bb(E) \| a \|^2 = 1$, there is a positive sum $Y$ of squared functions in $cal(C)_mu$ such that $bb(E) Y = 1$, $\| a \( g \) \|^2 lt.eq 2 Y \( g \)$, and $Y \( g \) lt.eq D_mu^2$ for every $g in S_q$. For every allowed $t$, every $g$ with $Y \( g \) > 0$, and a Bernoulli-$p_t$ subset $A$ of sites, 
#[#set math.equation(numbering: n => "(237)")
 $ bb(E)_A log frac(Y \( g \), \( Q_A Y \) \( g \)) lt.eq log 4 + C ell^(- 4) j log q . $ <rec:smoothing-ratio>]

 Here $\( Q_A Y \) \( g \) = \| S_A \|^(- 1) sum_(h in S_A) Y \( g h \)$, where $S_A$ fixes every site outside $A$. The same assertion holds if the initial $\| a \|^2$ is any positive sum of squared coefficient functions of mean one.]
] <rec:pointwise-smoothing>

#proof[
  Let $Z_A$ be the projection onto restriction types of level greater than $h_0$. Averaging over $A$ commutes with the full symmetric group, so $bb(E) Z_A = c_t I$. We identify the finite comparison underlying the bound for $c_t$. Let $cal(S)$ be the increasing lists $\( a_1 < dots.h.c < a_j \)$ in ${ 1 \, dots.h \, q }$, ordered coordinatewise. Coordinatewise minimum and maximum are again increasing lists; thus $cal(S)$ is a finite distributive lattice. Its uniform weight is log-supermodular (the lattice inequality is equality). The finite FKG association inequality therefore applies to this uniform measure #cite(label("FortuinKasteleynGinibre1971")) Proposition 1.
  Fix a relative standard ordering of the $j$ boxes below the first row. For a chosen list in $cal(S)$, put its entries in those boxes in the fixed order and put the complementary entries increasingly in the first row. The event that this filling is a standard tableau is increasing on $cal(S)$: moving bottom entries later preserves all comparisons within the lower diagram, moves each complementary first-row entry earlier, and hence preserves every comparison from the first row to the second row. Conditional on this relative lower ordering, a uniform standard tableau is exactly a uniform list conditioned on that increasing event. The event that at least $h$ bottom entries occur among $1 \, dots.h \, b$ is decreasing on $cal(S)$. FKG, applied to its complement and the increasing validity event, shows that conditioning on validity can only lower this early-count tail. Averaging over the possible relative lower orderings preserves the inequality.
  By branching, conditional on $\| A \| = b$, the restriction level equals the number of bottom entries among the first $b$ entries of that uniform tableau. Its upper tail is therefore bounded by the count for a uniform $j$-subset of ${ 1 \, dots.h \, q }$. Averaging $b tilde.op "Binomial" \( q \, p_t \)$ turns the latter count into $"Binomial" \( j \, p_t \)$. With $k_0 = h_0 + 1$, its tail is at most $\( e j p_t \/ k_0 \)^(k_0)$ when $k_0 lt.eq j$, and is zero otherwise. Since $j p_t \/ k_0 lt.eq ell^4 e^(- sqrt(ell))$, this is at most $ell^(- 10)$ for all sufficiently large $ell$, uniformly in $j \, t$. This proves the asserted bound for $c_t$.
  We next turn this small average high-level projection into an estimate valid at each permutation. Right translations act on $cal(C)_mu$ as copies of $V_mu$; use the corresponding projection $Z_A$ on this coefficient space. The identity $bb(E)_A Z_A = c_t I$ is still valid, including all copies. For a positive operator $W$ on $cal(C)_mu$, define
  $ cal(A)_t \( W \) = bb(E)_A Z_A W Z_A \, #h(2em) cal(A) \( W \) = ell^4 sum_t cal(A)_t \( W \) . $
  There are $O \( ell \)$ values of $t$, and $c_t lt.eq ell^(- 10)$. Consequently $"Tr" cal(A) \( W \) lt.eq 1 / 2 "Tr" W$ for sufficiently large $ell$. The positive series
  $ W' = sum_(r gt.eq 0) cal(A)^r \( W \) $
  converges in trace norm, satisfies $W' gt.eq W$, has trace at most $2 "Tr" W$, and obeys $ell^4 cal(A)_t \( W' \) lt.eq W'$ for every $t$.
  Here is the concrete interpretation of these positive operators. For $g in S_q$, let $e_g in cal(C)_mu$ represent evaluation at $g$. Orthogonality gives $bb(E)_g e_g e_g^(*) = I$ and $parallel e_g parallel^2 = dim cal(C)_mu = D_mu^2$. The function $f_W \( g \) = chevron.l e_g \, W e_g chevron.r$ is a positive sum of squared coefficient functions, and $bb(E) f_W = "Tr" W$. Start with the rank-one operator $W = a a^(*)$, or with the positive operator representing the given sum, so that $"Tr" W = 1$. Set
  $ tilde(W) = W' \/ "Tr" W' \, #h(2em) Y \( g \) = chevron.l e_g \, tilde(W) e_g chevron.r . $
  The trace bound proves the majorization and normalization in the statement, and $Y \( g \) lt.eq parallel e_g parallel^2$ proves its pointwise upper bound.
  Fix $g$ with $Y \( g \) > 0$. Write $Y_(upright(h i \, A))$ and $Y_(upright(l o \, A))$ for the positive functions obtained from $tilde(W)$ by compression with $Z_A$ and $I - Z_A$. The operator inequality above gives
  $ bb(E)_A Y_(upright(h i \, A)) \( g \) lt.eq ell^(- 4) Y \( g \) . $
  Thus $Y_(upright(h i \, A)) \( g \) lt.eq Y \( g \) \/ 4$ except on an event of probability at most $4 ell^(- 4)$. The scalar inequality $\| u + v \|^2 lt.eq 2 \| u \|^2 + 2 \| v \|^2$, applied to a spectral decomposition of $tilde(W)$, gives $Y lt.eq 2 Y_(upright(l o \, A)) + 2 Y_(upright(h i \, A))$. On the complementary event, $Y_(upright(l o \, A)) \( g \) gt.eq Y \( g \) \/ 4$.
  We spell out the evaluation estimate used here. On $S_A$, every coefficient of restriction level at most $h$ lies in the sum of the coefficient spaces of representations occurring on ordered $min \( h \, \| A \| \)$-tuples. That sum has dimension at most $q^(2 h)$. For a translation-invariant coefficient space of dimension $D$, Cauchy–Schwarz at the identity bounds evaluation squared by $D$ times its uniform squared norm. Applying this fact to each squared coefficient in $Y_(upright(l o \, A))$ gives
  $ \( Q_A Y \) \( g \) gt.eq \( Q_A Y_(upright(l o \, A)) \) \( g \) gt.eq q^(- 2 h_0) Y_(upright(l o \, A)) \( g \) . $
  The first inequality uses orthogonality of the high- and low-level parts after averaging over $S_A$; their cross terms vanish. Every restriction of $V_mu$ has level at most $j$, so the same evaluation argument without truncation always gives $\( Q_A Y \) \( g \) gt.eq q^(- 2 j) Y \( g \)$. Therefore
  $ bb(E)_A log frac(Y \( g \), \( Q_A Y \) \( g \)) lt.eq log 4 + 2 h_0 log q + 8 ell^(- 4) j log q \, $
  which is (237).
  Every estimate in this last paragraph holds for each fixed $g$. In particular one may subsequently condition the grid permutation on compatibility, or average $g$ under any other law, provided the auxiliary subset $A$ retains its independent Bernoulli law. The bound is uniform in that changed law of $g$. This is the conditioning invariant supplied by the positive series. ◻
]

=== 17.2 Entropy after conditioning on a complete grid <entropy-after-conditioning-on-a-complete-grid>

The pointwise estimate now controls the line-density terms in an entropy calculation under the law conditioned on compatibility. The cell priorities used to expose that law will remain independent of the completed array.

#thm([Lemma 17.2.])[
  #emph[Let $m = min \( a \, b \) gt.eq 2$, with $a \, b lt.eq 2 m$. For product Fourier projections $I \, J$ in the line groups, of local types $mu_i$ with at most half as many rows as line sites and carrier ranks $r_i$, a zero local rank makes $I$ or $J$ zero. Otherwise put $D_0 = sum_i log \( D_(mu_i) r_i \)$. Then 
$ "Tr"_(upright("reg")) \| J I \|^4 lt.eq exp { \( 1 + C \/ sqrt(log m) \) D_0 + C n m^(- 1 \/ 40) } . $

]
] <rec:smoothed-grid-fourth>

#proof[
  Write $K = \( S_b \)^a$ for the row group and $L = \( S_a \)^b$ for the column group, where $n = a b$ and $m lt.eq a \, b lt.eq 2 m$. The trace is the unnormalized trace on the regular representation of $S_n$. We prove the estimate for sufficiently large $m$; the finitely many sizes $2 lt.eq m < m_0$ are covered by increasing the absolute constant $C$. Let $cal(L)$ be the set of all $a + b$ lines. For $gamma in cal(L)$, denote its length by $q_gamma$, its Fourier type by $mu_gamma$, its dimension by $d_gamma = D_(mu_gamma)$, and its carrier projection by $P_gamma$. Its rank is $r_gamma$. A zero rank makes $I$ or $J$ zero, so we assume $1 lt.eq r_gamma lt.eq d_gamma$. The hypotheses are $m lt.eq q_gamma lt.eq 2 m$ and $ell \( mu_gamma \) lt.eq q_gamma \/ 2$. Set
  $ j_gamma = q_gamma - \( mu_gamma \)_1 \, #h(2em) ell = log m \, #h(2em) D_0 = sum_(gamma in cal(L)) log \( d_gamma r_gamma \) . $
  Here $ell \( mu_gamma \)$ denotes the number of rows of the partition; the unadorned symbol $ell$ denotes $log m$.
  We first identify the probability whose entropy will be estimated. Choose unitary realizations $rho_gamma$ and put
  $ f_gamma \( g \) = d_gamma "Tr" #scale(x: 120%, y: 120%)[\(] P_gamma rho_gamma \( g^(- 1) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) eta_gamma \( g \) = frac(\| f_gamma \( g \) \|^2, d_gamma r_gamma) . $
  All averages on a line group are with respect to its uniform probability measure $U_gamma$. Matrix-coefficient orthogonality and $P_gamma = P_gamma^(*) = P_gamma^2$ give
  #[#set math.equation(numbering: n => "(238)")
   $ bb(E)_(U_gamma) \| f_gamma \|^2 = d_gamma r_gamma \, #h(2em) f_gamma \( g^(- 1) \) = overline(f_gamma \( g \)) \, #h(2em) bb(E)_(U_gamma) eta_gamma = 1 . $ <rec:smoothed-line-normalization>]
  Thus $eta_gamma$ is an inversion-invariant probability density. For each local projection, the regular rank and squared coefficient mass in Lemma 14 are both $d_gamma r_gamma$. Applying that lemma to $I \, J$ gives
  #[#set math.equation(numbering: n => "(239)")
   $ "Tr"_(upright("reg")) \| J I \|^4 lt.eq e^(D_0) frac(n !, \| K \| \| L \|) thin bb(P)_eta \( cal(S) \) . $ <rec:smoothed-trace-probability>]
  We now describe $cal(S)$ and $bb(P)_eta$ explicitly.
  Let $r = \( r_i \) in K$ and $c = \( c_t \) in L$ have the independent product line law $bb(P)_eta$. At the intermediate cell $x = \( i \, t \) in \[ a \] times \[ b \]$, write
  $ X_(i t) = r_i^(- 1) \( t \) \, #h(2em) Z_(i t) = c_t \( i \) . $
  The vector $X_i = \( X_(i t) \)_(t in \[ b \])$ is a permutation of $\[ b \]$, and $Z_t = \( Z_(i t) \)_(i in \[ a \])$ is a permutation of $\[ a \]$. The event $cal(S)$ is that the $n$ pairs $\( X_(i t) \, Z_(i t) \)$ are all different. Equivalently they give a bijection from the intermediate cells to $\[ b \] times \[ a \]$. Indeed the row-then-column permutation $c r$ admits a column-then-row factorization exactly when, for each initial column and each final row, there is exactly one such intermediate cell. This is the stated distinctness condition. Inversion invariance in (238) ensures that the use of $r_i^(- 1)$ in the row variable preserves its line density. Under $bb(P)_eta$ all the line permutations $X_i \, Z_t$ are independent, with densities $eta_gamma$ relative to $U_gamma$. This also specifies the orientation of every line variable used below.
  Apply Lemma 72 to $f_gamma \/ \( d_gamma r_gamma \)^(1 \/ 2)$. It gives a density $Y_gamma$ satisfying
  #[#set math.equation(numbering: n => "(240)")
   $ eta_gamma lt.eq 2 Y_gamma \, #h(2em) bb(E)_(U_gamma) Y_gamma = 1 \, #h(2em) Y_gamma lt.eq d_gamma^2 \, $ <rec:smoothed-line-densities>]
  and the pointwise estimate (237) with $j = j_gamma$ and $q = q_gamma$. For the trivial type $mu_gamma = \( q_gamma \)$ take $Y_gamma = eta_gamma = 1$, so no factor two is needed on that line. Let $N_(*)$ be the number of nontrivial line types and define the product law
  $ bb(M) = ⨂_(gamma in cal(L)) \( Y_gamma U_gamma \) quad upright("on") quad Omega = product_(i = 1)^a S_b times product_(t = 1)^b S_a . $
  Then
  #[#set math.equation(numbering: n => "(241)")
   $ bb(P)_eta \( cal(S) \) lt.eq 2^(N_(*)) bb(M) \( cal(S) \) . $ <rec:smoothed-majorization-cost>]
  Put $z = bb(M) \( cal(S) \)$. If $z = 0$ the assertion follows already. Otherwise set $bb(N) = bb(M) \( thin dot.op divides cal(S) \)$. The remaining task is to show that this conditioning costs almost $n$ units of relative entropy, after a small charge for the line densities.
  Independently of the array, assign each cell $x$ a uniform priority $tau_x in \( 0 \, 1 \)$ and reveal the pair $\( X_x \, Z_x \)$ in increasing priority order. Ties have probability zero. Conditional on the complete vector of priorities and the values already revealed, let $q_x$ be the prediction of the next pair under $bb(N)$, and let $pi_x$ be its prediction under $bb(M)$. If $x = \( i \, t \)$, let $B_x$ be the symbols of $\[ b \]$ not yet revealed in row $i$ and $C_x$ the symbols of $\[ a \]$ not yet revealed in column $t$. Write $R_x = \| B_x \|$ and $S_x = \| C_x \|$. The uniform product law on $Omega$ predicts the reference distribution
  $ pi_(0 \, x) \( u \, v \) = frac(1, R_x S_x) \, #h(2em) \( u \, v \) in B_x times C_x . $
  The product structure of $bb(M)$ implies that $pi_x$ is the product of the two line predictions, one for row $i$ and one for column $t$. In particular, it depends only on the revealed values in those two lines, even though the conditioning specifies the entire past. Let $A_x subset.eq B_x times C_x$ consist of the pairs that have not appeared at any previously revealed cell. The prediction $q_x$ is supported on $A_x$ and is absolutely continuous with respect to $pi_x$. The entropy chain rule gives the exact equality
  #[#set math.equation(numbering: n => "(242)")
   $ - log z = bb(E)_(bb(N) \, tau) sum_x "KL" \( q_x bar.v.double pi_x \) . $ <rec:smoothed-exposure-KL>]
  We use a slowly changing interpolation with the uniform reference law. Put
  $ T = ⌊ell \/ 32 - sqrt(ell)⌋ \, #h(2em) p_t = e^(- sqrt(ell) - t) quad \( 0 lt.eq t lt.eq T \) \, #h(2em) p_min = m^(- 1 \/ 32) \, $
  and define, for $0 < p < 1$,
  #[#set math.equation(numbering: n => "(243)")
   $ epsilon.alt \( p \) = 8 / sqrt(ell) + 8 / ell sum_(t = 0)^T upright(bold(1))_({ p < p_t }) . $ <rec:smoothed-epsilon-schedule>]
  For sufficiently large $m$, $0 < epsilon.alt \( p \) < 1 \/ 2$. Moreover
  #[#set math.equation(numbering: n => "(244)")
   $ p^(- 1 \/ epsilon.alt \( p \)) lt.eq m^(1 \/ 8) #h(2em) \( p gt.eq p_min \) . $ <rec:smoothed-epsilon-bound>]
  To check this, put $s = - log p$. For $s lt.eq sqrt(ell)$ the ratio $s \/ epsilon.alt \( p \)$ is at most $ell \/ 8$. In each later interval the number of crossed thresholds is an integer $h$ with $s lt.eq sqrt(ell) + h$, while $epsilon.alt \( p \) = 8 \( sqrt(ell) + h \) \/ ell$. This remains true in the last interval up to $s = ell \/ 32$, by the definition of $T$.
  At cell $x$, put $p = 1 - tau_x$ and abbreviate $epsilon.alt = epsilon.alt \( p \)$. Define the mixed available mass
  $ Z_x^(*) = sum_(v in A_x) pi_x \( v \)^(1 - epsilon.alt) pi_(0 \, x) \( v \)^epsilon.alt . $
  It is positive on every history with positive $bb(N)$ probability. Normalizing the summands on $A_x$ and taking their relative entropy from $q_x$ yields
  #[#set math.equation(numbering: n => "(245)")
   $ "KL" \( q_x bar.v.double pi_x \) gt.eq - log Z_x^(*) - epsilon.alt \( p \) thin bb(E)_(q_x) log pi_x / pi_(0 \, x) . $ <rec:smoothed-mixed-KL>]
  This is an identity with a nonnegative relative-entropy term discarded; it does not replace $pi_x$ by a conditioned line marginal. Hölder’s inequality also gives $Z_x^(*) lt.eq 1$.
  We next bound the first term in (245) uniformly over the successful array. Fix a full array $g in cal(S)$ with $bb(M) \( g \) > 0$, the current priority $tau_x = 1 - p$, and all priorities in the current row and column. The two predictions $pi_x \, pi_(0 \, x)$ and their common candidate set $B_x times C_x$ are now fixed. Each candidate pair $v$ occurs at a unique cell $y \( v \)$ in $g$. Call it special if $y \( v \)$ is in the current row or column; there are at most $a + b - 1$ such pairs. For every other candidate, $v in A_x$ exactly when $tau_(y \( v \)) gt.eq tau_x$, an event of conditional probability $p$. These outside priorities remain independent uniform variables under the present conditioning. No independence between different blocking events is needed. Thus, writing $E_x$ for the set of special candidates,
  $ bb(E)_(upright("outside")) Z_x^(*) & lt.eq sum_(v in B_x times C_x) pi_x \( v \)^(1 - epsilon.alt) pi_(0 \, x) \( v \)^epsilon.alt c \( v \) \,\
c \( v \) & = cases(delim: "{", 1 \, & v in E_x \,, p \, & v in.not E_x .) $
  Hölder, with exponents $1 \/ \( 1 - epsilon.alt \)$ and $1 \/ epsilon.alt$, therefore gives the precise mixed-mass estimate
  #[#set math.equation(numbering: n => "(246)")
   $ bb(E)_(upright("outside")) Z_x^(*) lt.eq (sum_v pi_(0 \, x) \( v \) c \( v \)^(1 \/ epsilon.alt))^epsilon.alt lt.eq #scale(x: 120%, y: 120%)[\(] p^(1 \/ epsilon.alt) + pi_(0 \, x) \( E_x \) #scale(x: 120%, y: 120%)[\)]^epsilon.alt . $ <rec:smoothed-competitor-mass>]
  The first Hölder factor is one because $sum_v pi_x \( v \) = 1$.
  Conditional on $g$ and $p$ alone, the two available counts have laws
  $ R_x = 1 + "Binomial" \( b - 1 \, p \) \, #h(2em) S_x = 1 + "Binomial" \( a - 1 \, p \) . $
  The priorities other than $tau_x$ in these two lines are independent. A binomial lower-tail bound shows that
  $ bb(P)_tau { R_x < b p \/ 2 med upright("or") med S_x < a p \/ 2 divides g \, p } lt.eq C e^(- c p m) . $
  On the complementary event, uniformity of $pi_(0 \, x)$ gives $pi_(0 \, x) \( E_x \) lt.eq C \/ \( m p^2 \)$. For $p gt.eq p_min$, (244) consequently implies
  $ log bb(E)_(upright("outside")) Z_x^(*) & lt.eq log p + epsilon.alt log (1 + frac(C p^(- 1 \/ epsilon.alt), m p^2))\
 & lt.eq log p + C m^(- 13 \/ 16) lt.eq log p + C m^(- 1 \/ 2) . $
  On the exceptional count event we still have $log Z_x^(*) lt.eq 0$. Jensen’s inequality for the outside priorities, followed by averaging the priorities on the two lines, now gives
  $ bb(E)_tau \[ log Z_x^(*) divides g \, p \] lt.eq log p + C m^(- 1 \/ 2) + C \| log p \| e^(- c p m) lt.eq log p + C m^(- 1 \/ 2) #h(2em) \( p gt.eq p_min \) . $
  Here $p m gt.eq m^(31 \/ 32)$ absorbs the last term, uniformly in this range. For $p < p_min$ use only $- log Z_x^(*) gt.eq 0$. Since $p = 1 - tau_x$ is uniform independently of $g$, integration gives
  #[#set math.equation(numbering: n => "(247)")
   $ bb(E)_tau \[ - log Z_x^(*) divides g \] gt.eq integral_(p_min)^1 \( - log p \) thin d p - C m^(- 1 \/ 2) gt.eq 1 - C m^(- 1 \/ 40) . $ <rec:smoothed-slot-saving>]
  This bound holds for every such completed successful array and therefore also after averaging under $bb(N)$.
  It remains to account for the second term in (245). We do this by an exact telescoping identity on each line. Fix a line $gamma$ and its completed permutation $g_gamma$. Its domain sites carry the priorities of the corresponding cells. For $0 lt.eq u lt.eq 1$, let
  $ A_gamma \( u \) = { v : tau_v > u } \, #h(2em) F_gamma \( u \) = \( Q_(A_gamma \( u \)) Y_gamma \) \( g_gamma \) \, #h(2em) H_gamma \( u \) = log F_gamma \( u \) . $
  The quantity $F_gamma \( u \)$ is exactly the density, relative to the uniform line law, of the images already exposed on that line. In fact, permutations agreeing with $g_gamma$ on the exposed domain sites form the right coset $g_gamma S_(A_gamma \( u \))$; averaging $Y_gamma$ over its uniform completions is precisely the displayed $Q_A$ average. This verifies the orientation of the averaging operator required by Lemma 72. Since $bb(M) \( g \) > 0$, all these quantities are positive, and
  $ H_gamma \( 0 \) = 0 \, #h(2em) H_gamma \( 1 \) = log Y_gamma \( g_gamma \) . $
  At a revelation in this line, the log ratio of its conditional prediction to its uniform prediction is the corresponding increment of $H_gamma$. The factorization of $pi_x$ shows that $log \( pi_x \/ pi_(0 \, x) \)$ at the actual outcome is the sum of the row and column increments.
  Put $u_t = 1 - p_t$. From (243), the weighted sum of the increments on line $gamma$ is exactly
  #[#set math.equation(numbering: n => "(248)")
   $ C_gamma \( g \, tau \) & := sum_(v in gamma) epsilon.alt \( 1 - tau_v \) thin Delta H_gamma \( tau_v \)\
 & = 8 / sqrt(ell) log Y_gamma \( g_gamma \) + 8 / ell sum_(t = 0)^T log frac(Y_gamma \( g_gamma \), \( Q_(A_gamma \( u_t \)) Y_gamma \) \( g_gamma \)) . $ <rec:smoothed-telescoping>]
  For each threshold, the increments occurring after $u_t$ sum to $H_gamma \( 1 \) - H_gamma \( u_t \)$, which proves this identity. The schedule is kept constant after its final jump all the way to the last revelation. In particular, discarding the small interval $p < p_min$ in (247) has not discarded any term in the telescoping identity.
  Conditional on the full array $g$, each $A_gamma \( u_t \)$ is an independent-site Bernoulli-$p_t$ subset of the domain of this line. The subsets for different $t$ are nested, but their independence from $g$ and their individual Bernoulli laws are all that is needed. The pointwise estimate (237) and (240) yield
  #[#set math.equation(numbering: n => "(249)")
   $ bb(E)_tau C_gamma \( g \, tau \) lt.eq 16 / sqrt(ell) log d_gamma + C + C ell^(- 4) j_gamma log q_gamma . $ <rec:smoothed-line-charge>]
  Here $\( 8 \/ ell \) \( T + 1 \)$ is bounded by an absolute constant. For a trivial line $Y_gamma = 1$, the exact charge is zero, so no constant is charged to that line. This is the point at which smoothing before conditioning on success is essential: (237) holds for the fixed $g_gamma$, although $g$ is now distributed according to $bb(N)$.
  Take expectations in (245), sum over the cells, and use (242). Conditional expectation replaces the $q_x$ expectation by the actual revealed value. Its total weighted log ratio is $sum_gamma C_gamma \( g \, tau \)$. Equations (247) and (249) therefore give
  #[#set math.equation(numbering: n => "(250)")
   $ log z lt.eq - n + C n m^(- 1 \/ 40) + sum_(gamma : thin mu_gamma eq.not \( q_gamma \)) (16 / sqrt(ell) log d_gamma + C + C ell^(- 4) j_gamma log q_gamma) . $ <rec:smoothed-success-before-absorption>]
  All conditioning and normalization terms are retained in this inequality; in particular there is no assumption that the line laws remain independent after conditioning on $cal(S)$.
  For completeness, the dimension estimate used to absorb the last two terms is
  #[#set math.equation(numbering: n => "(251)")
   $ log D_mu gt.eq c j \, #h(2em) log D_mu gt.eq c log q \, quad j = q - mu_1 gt.eq 1 \, quad ell \( mu \) lt.eq q \/ 2 \, $ <rec:smoothed-dimension-absorption>]
  for sufficiently large $q$. The first bound is (236), applied at size $q$. If $1 lt.eq j lt.eq q \/ 4$, (6) gives $D_mu gt.eq e^(- 1 \/ 2) binom(q, j) gt.eq e^(- 1 \/ 2) q$, proving the second. If $j > q \/ 4$, the first bound gives $log D_mu gt.eq c q \/ 4$ and hence the second bound as well, after changing the absolute constant.
  Since $q_gamma in \[ m \, 2 m \]$, that estimate implies
  $ 1 + ell^(- 4) j_gamma log q_gamma lt.eq C / sqrt(ell) log d_gamma #h(2em) \( mu_gamma eq.not \( q_gamma \) \) . $
  It absorbs both the constants in (250) and the cost $N_(*) log 2$ in (241). We conclude that
  #[#set math.equation(numbering: n => "(252)")
   $ log bb(P)_eta \( cal(S) \) lt.eq - n + C n m^(- 1 \/ 40) + C / sqrt(ell) sum_(gamma in cal(L)) log d_gamma . $ <rec:smoothed-success-final>]
  Finally $\| K \| = \( b ! \)^a$, $\| L \| = \( a ! \)^b$, and Stirling’s estimate gives
  $ log frac(n !, \( b ! \)^a \( a ! \)^b) lt.eq n + C \( a + b \) log n lt.eq n + C n m^(- 1 \/ 40) $
  for sufficiently large $m$. Substitution in (239) cancels the $- n$ in (252). Since $sum_gamma log d_gamma lt.eq D_0$, the result is
  $ "Tr"_(upright("reg")) \| J I \|^4 lt.eq exp {(1 + C / sqrt(log m)) D_0 + C n m^(- 1 \/ 40)} . $
  The local ranks have already been included exactly through $bb(E) \| f_gamma \|^2 = d_gamma r_gamma$ in (239); there is no additional rank or regular-multiplicity factor to insert. For bounded $m gt.eq 2$, the same conclusion follows by enlarging $C$, using $"Tr"_(upright("reg")) \| J I \|^4 lt.eq n !$. The case $m = 1$ belongs to the finite base cases of the recursion rather than to an estimate with denominator $sqrt(log m)$. ◻
]

=== 17.3 A sparse estimate from chronological mergers <a-sparse-estimate-from-chronological-mergers>

The entropy estimate will handle large-dimensional parent blocks. For small diagram levels we use a separate sparse estimate, obtained from a chronological merger forest and a bound on exceptional columns. For each fixed $delta > 0$, there are $c_delta > 0$ and $n_delta < oo$ such that, for every dyadic $n gt.eq n_delta$ and every $lambda tack.r n$,

#[#set math.equation(numbering: n => "(253)")
 $ 0 lt.eq k = n - lambda_1 lt.eq n^(1 - delta) quad arrow.r.double quad parallel T_n \|_(V_lambda) parallel_(upright("op")) lt.eq n^(- c_delta k) . $ <rec:forest-sparse-general>]

#proof[
  The case $k = 0$ again gives $1 lt.eq 1$. Use the tuple space, partial kernels $Q_I$, and centered kernel $Z$ from (223)–(225). The proof below estimates $Z$ directly by good rows and bad columns; it does not use the preceding two-sweep chunk bound. The case $k = 1$ again has $Z = 0$. For $delta gt.eq 1$ this is the only possible positive level for sufficiently large $n$, so assume $0 < delta < 1$ and $k gt.eq 2$. Choose a fixed $0 < zeta < delta \/ 8$.
  Fix an injective starting tuple $x$ and a subset $I$. Use the unreduced probability experiment for the row of $Q_I$: a common sweep for $I$ and independent fair-bit paths for its complement, without conditioning on distinct final sites. Coordinates are numbered in their chronological order. For $u eq.not v$, define
  $ w_(u v) \( x \) = sum_(1 lt.eq r lt.eq d :\
\( x_u \)_(r + 1 : d) = \( x_v \)_(r + 1 : d)) 2^(- \( r - 1 \)) . $
  Sharing the switch at time $r$ requires the displayed suffix agreement and agreement of the two already updated prefixes of length $r - 1$. Scan all such contacts in chronological order, breaking ties by a fixed order of label pairs. Retain a contact precisely when its endpoints are in different components of the contacts already scanned. The retained edges form a forest. On $Gamma$ this forest has no isolated vertices.
  We need an unnormalized comparison for this exploration. For any fixed forest with prescribed merger times $r_e$ satisfying the requisite initial suffix agreements,
  #[#set math.equation(numbering: n => "(254)")
   $ Pr { upright("the retained merger history is this forest") } lt.eq product_e 2^(- \( r_e - 1 \)) . $ <rec:forest-history-mass>]
  Here is a construction proving it without a conditional independence assertion after nonmeeting events. Start with one component for every label. In a reference experiment different components use independent switch fields for their $I$-labels, and independent fair bits for their other labels. At each prescribed merger, require only equality of the two indicated updated prefixes and join the component measures. Discard any configuration in which two $I$-labels in the joined component occupy the same site. Then evolve the joined component with a common switch field for its $I$-labels and independent bits for its remaining labels. Several prescribed mergers at the same time are performed in the fixed tie order before updating that bit. Do not impose the conditions that the distinct components failed to meet at earlier times. The reference measures are subprobability measures, with their lost mass retained in the calculation.
  Just before time $r$, each component measure is invariant under adding the same vector of $bb(F)_2^(r - 1)$ to all its updated prefixes. This follows inductively. Initially there are no updated bits. A required equality of two prefixes preserves invariance under a common shift of the joined component, as does the restriction excluding coincident $I$-positions. A switch update preserves equivariance under shifts of the earlier coordinates and is invariant under flipping the new output bit of every label in the component. The latter operation flips fair coins and preserves the requirement that two jointly moved labels leaving one switch use opposite outputs. It supplies invariance in the newly updated coordinate. Thus the invariant holds through all updates and mergers.
  Before a prescribed merger the two component measures are independent as unnormalized measures in the reference construction. If they have masses $a_1 \, a_2$, invariance makes the indicated endpoint prefix uniform in each, with total mass $a_i$. The mass after requiring equality is exactly $a_1 a_2 thin 2^(- \( r - 1 \))$. Discarding invalid $I$-configurations can only decrease it. All intervening Markov updates preserve mass. Multiplying over mergers proves that the reference subprobability has mass at most the right side of (254).
  To compare it with the original law, restrict to histories having exactly the specified retained forest. Until a prescribed merger no switch is shared by labels in distinct current components; otherwise the chronological scan would have merged those components. After all mergers at a given time, every shared switch has its labels in one component. On these histories the original and reference transition weights therefore agree: a used switch of the joint $I$-motion contributes one fair coin in either construction, and every other label contributes its own fair bit. The original history also satisfies all the prefix and injectivity restrictions of the reference construction. Its probability is thus bounded by the total reference mass. This proves (254). In particular we have never divided by the probability of having avoided earlier meetings; such a division would not justify a uniform-prefix assertion.
  Summing the time choices in (254) gives
  #[#set math.equation(numbering: n => "(255)")
   $ Pr_(Q_I \( x \, dot.op \)) \( Gamma \) lt.eq sum_(F upright(" a forest on ") \[ k \]\
F upright(" has no isolated vertex")) product_({ u \, v } in F) w_(u v) \( x \) . $ <rec:forest-cover-sum>]
  Keeping the final injectivity restriction would only decrease the left side. The estimate is uniform in $I$.
  A suffix block of size $b = 2^r$ fixes coordinates $r + 1 \, dots.h \, d$. Call it dense for $x$ if its occupancy is at least two and at least $b n^(- zeta)$. Call a vertex bad when it lies in some dense block. A row is good when fewer than $k \/ 8$ vertices are bad. Since the starting sites are distinct, for every vertex $u$ one has
  $ sum_(v eq.not u) w_(u v) \( x \) lt.eq sum_(r = 1)^d 2^(- \( r - 1 \)) 2^r = 2 d . $
  If $u$ is not bad, every block in this sum containing a partner has occupancy less than $2^r n^(- zeta)$, so
  #[#set math.equation(numbering: n => "(256)")
   $ sum_(v eq.not u) w_(u v) \( x \) lt.eq 2 d n^(- zeta) . $ <rec:forest-good-row-sum>]
  Root each tree of a forest in (255) and orient its edges toward the root. There are at most $k \/ 2$ roots, because no tree is a singleton. On a good row at least $3 k \/ 8$ good vertices are therefore nonroots. Choose the root set in at most $2^k$ ways and sum the parent of each nonroot independently, dropping acyclicity and the other restrictions to get an upper bound. The row sums above give the explicit rooted-forest estimate
  $ Pr_(Q_I \( x \, dot.op \)) \( Gamma \) lt.eq 2^k \( 2 d \)^k n^(- 3 zeta k \/ 8) lt.eq n^(- zeta k \/ 4) $
  for sufficiently large $n$. This bound uses the merger comparison, rather than independence of all contact events.
  We next bound every column on the set $cal(B)$ of bad rows. The transpose of $Q_I$ is a reversed joint sweep on $\| I \|$ labels together with $k - \| I \|$ independent reversed walkers, restricted to injective outputs. This is exactly the partially coupled experiment in Lemma 50. In particular, for each set of distinct sites $A$, its unrestricted endpoint law satisfies
  #[#set math.equation(numbering: n => "(257)")
   $ Pr { upright("every site of ") A upright(" is occupied") } lt.eq \( k \/ n \)^(\| A \|) . $ <rec:forest-mixed-occupation>]
  Use singleton test sets and $h_i = 1$ in that lemma: the product of endpoint counts is at least one on the event. Thus the comparison applies also when independent walkers can coincide. Imposing distinct outputs can only lower the column mass we are estimating.
  The maximal dense suffix blocks of an injective bad row are disjoint, because suffix blocks form a laminar family. They contain at least $k \/ 8$ occupied sites in total. Put $M = n^zeta$ and $q = M k \/ n$. For a chosen disjoint family, specify its occupied subsets $A_B$, with $j_B = \| A_B \| gt.eq 2$ and $j_B gt.eq \| B \| \/ M$. By (257), the probability of occupying their union is at most $\( k \/ n \)^(sum_B j_B)$. The condition $sum_B j_B gt.eq k \/ 8$ allows multiplication by $M^(sum_B j_B - k \/ 8) gt.eq 1$. Summing the specified subsets, then dropping disjointness and maximality of the block family, gives
  #[#set math.equation(numbering: n => "(258)")
   $ sum_(x in cal(B)) Q_I \( x \, y \) lt.eq M^(- k \/ 8) exp {sum_(b upright(" dyadic")\
1 lt.eq b lt.eq n) n / b sum_(2 lt.eq j lt.eq b\
j gt.eq b \/ M) binom(b, j) q^j} . $ <rec:forest-bad-column-generating>]
  Indeed the sum over all families is bounded by the product, over blocks, of one plus their total subset weight, and this product is at most the displayed exponential. No independence of different occupied blocks is being asserted.
  We bound that exponent explicitly. Put $epsilon = e M q = e M^2 k \/ n = o \( 1 \)$. For $b lt.eq 2 M$, $b q = o \( 1 \)$, and $sum_(j gt.eq 2) binom(b, j) q^j lt.eq C \( b q \)^2$. Summing these dyadic sizes contributes at most $C n q^2 M$. For $b > 2 M$, let $j_0 = ceil.l b \/ M ceil.r$. The successive terms $\( b q \)^j \/ j !$ have ratio at most $M q$ for $j gt.eq j_0$. Hence their tail is at most $2 \( e M q \)^(j_0) = 2 epsilon^(j_0)$ for large $n$. The dyadic values of $b \/ M$ in this range at least double, so
  $ sum_(b > 2 M) n / b thin 2 epsilon^(ceil.l b \/ M ceil.r) lt.eq C n / M epsilon^2 lt.eq C n M q^2 . $
  Thus the whole exponent in (258) is at most
  $ C n M q^2 = C M^3 k^2 \/ n lt.eq C k n^(3 zeta - delta) = o \( k \) . $
  Since $zeta < delta \/ 8$, the last assertion is uniform over the required range of $k$. It follows that
  #[#set math.equation(numbering: n => "(259)")
   $ sup_y sum_(x in cal(B)) Q_I \( x \, y \) lt.eq n^(- zeta k \/ 16) $ <rec:forest-small-bad-column>]
  for all sufficiently large $n$, uniformly in $I$.
  Finally split $Z = Z_(upright(g)) + Z_(upright(b))$ according to whether its row belongs to $cal(B)$. Every $Q_I$ has row and column sums at most one. The good-row coverage estimate and (225) therefore give absolute row sums at most $2^k n^(- zeta k \/ 4)$ and column sums at most $2^k$ for $Z_(upright(g))$. Equation (259) gives column sums at most $2^k n^(- zeta k \/ 16)$ and row sums at most $2^k$ for $Z_(upright(b))$. Schur’s row-column bound yields
  $ parallel Z parallel_(upright("op")) lt.eq 2^k n^(- zeta k \/ 8) + 2^k n^(- zeta k \/ 32) lt.eq n^(- zeta k \/ 64) $
  after increasing the starting size. There is no additional falling-factorial normalization: the $Q_I$ throughout are probability-mass kernels on $cal(X)_k$, and the uniform tuple inner product differs from counting measure by a single constant. Restriction to the $lambda$-part in (224) proves (253), with $c_delta = zeta \/ 64$. ◻
]

=== 17.4 Closing the singular-value recursion <closing-the-singular-value-recursion>

We combine the fourth-overlap estimate with the sparse norm bound. The child exponents will enter only through positive powers; all large-size thresholds are chosen independently of their values.

#thm([Theorem 17.3.])[
  #emph[There is a bounded sequence $p_d gt.eq 8$ such that $s_r \( T_n \|_(V_lambda) \) lt.eq \( D_lambda r \)^(- 1 \/ p_d)$ for every $n = 2^d$, every $lambda tack.r n$, and $1 lt.eq r lt.eq D_lambda$. One may take, above a fixed base dimension, 
$ p_d = \( 1 + A \/ sqrt(d) \) max { p_(floor.l d \/ 2 floor.r) \, p_(ceil.l d \/ 2 ceil.r) } . $

]
] <rec:smoothed-singular>

#proof[
  We use rank-index bands, so that the number of bands and their normalizations do not depend on the exponent inherited from the children. For a child irreducible of dimension $D_mu$, partition its positive singular values into the index intervals $\[ 2^b \, 2^(b + 1) - 1 \]$. A nonempty band has rank $r lt.eq 2^b$ and norm at most $\( D_mu 2^b \)^(- 1 \/ p') lt.eq \( D_mu r \)^(- 1 \/ p')$, where $p' = max \( p_(floor.l d \/ 2 floor.r) \, p_(ceil.l d \/ 2 ceil.r) \)$. The zero singular subspace contributes nothing. The row bands give range projections $I$ for $X$, and the column bands give domain projections $J$ for $Y$, in the factorization $T_n = Y X$.
  A profile chooses one type and one band on every row and column. There are at most $exp \( C sqrt(q) \)$ types at a line of size $q$ and at most $1 + log_2 \( q ! \) lt.eq C q log \( q + 1 \)$ index bands per type. Thus the number $N_d$ of profiles satisfies
  #[#set math.equation(numbering: n => "(260)")
   $ log N_d lt.eq C { a sqrt(b) + b sqrt(a) + \( a + b \) log n } lt.eq C n^(3 \/ 4) log n . $ <rec:smoothed-profile-count>]
  Types with more than half as many rows as line sites have zero sweep operator by matching annihilation, and are omitted. For a remaining profile put $D_0 = sum_i log \( D_(mu_i) r_i \)$.
  Fix a nontrivial surviving parent type $lambda$ and write $L = log D_lambda$. Lemma 73, together with regular multiplicity, gives
  $ a_lambda := "Tr" \| \( J I \)_lambda \|^4 lt.eq A_0 \/ D_lambda \, #h(2em) A_0 = exp { \( 1 + eta \) D_0 + E_d } \, quad eta = C_1 \/ sqrt(d) \, $
  where $E_d = n^(1 - 1 \/ 200)$ absorbs $C n m^(- 1 \/ 40)$ for all sufficiently large $d$. The compression $\( J I \)_lambda$ is a contraction. If its singular values are $u_j$, then $sum_j u_j^8 lt.eq sum_j u_j^4 = a_lambda$ and $sum_j u_j^8 lt.eq \( sum_j u_j^4 \)^2 = a_lambda^2$. Consequently
  #[#set math.equation(numbering: n => "(261)")
   $ D_lambda "Tr" \| \( J I \)_lambda \|^8 lt.eq A_0 min { 1 \, A_0 \/ D_lambda } . $ <rec:smoothed-eighth>]
  Set $p_d = \( 1 + A \/ sqrt(d) \) p'$ and $h = p_d \/ 8 gt.eq 1$. Resolve $\| Y \|^h \| X^(*) \|^h$ into its profile terms. A term has the form $B_J \( J I \) A_I$, with $A_I \, B_J$ supported on the indicated projections. The product of their operator norms is at most $e^(- h D_0 \/ p')$. The ideal property of Schatten norms and (261) therefore show that the logarithm of its eighth power norm, after multiplication by $D_lambda$, is at most
  #[#set math.equation(numbering: n => "(262)")
   $ - frac(A - C_1, sqrt(d)) D_0 + E_d + min { 0 \, \( 1 + eta \) D_0 + E_d - L } . $ <rec:smoothed-profile-saving>]
  This bound is independent of the size of $p'$.
  Choose $A > C_1 + 8$. In the dense range $k > n^(1 - 1 \/ 400)$, (236) gives $L gt.eq c n^(1 - 1 \/ 400)$. Hence $E_d = o \( L \/ sqrt(d) \)$ and $log N_d = o \( L \/ sqrt(d) \)$, with thresholds independent of $p'$. If $D_0 gt.eq L \/ 4$, the first two terms in (262) are at most $- c_1 L \/ sqrt(d)$. If $D_0 < L \/ 4$, then $\( 1 + eta \) D_0 + E_d lt.eq L \/ 2$ for large $d$, and the same expression is at most $- L \/ 3$. Thus every profile term $F_gamma$ satisfies
  $ D_lambda parallel F_gamma parallel_8^8 lt.eq e^(- c_2 L \/ sqrt(d)) . $
  The triangle inequality, followed by (260), gives
  #[#set math.equation(numbering: n => "(263)")
   $ D_lambda parallel \| Y \|^h \| X^(*) \|^h parallel_8^8 lt.eq N_d^8 e^(- c_2 L \/ sqrt(d)) lt.eq 1 . $ <rec:smoothed-powered-moment>]
  All norms in this paragraph are on the single parent irreducible.
  Apply Lemma 9 with $q = 8$:
  #[#set math.equation(numbering: n => "(264)")
   $ parallel Y X parallel_p lt.eq parallel \| Y \|^(p \/ 8) \| X^(*) \|^(p \/ 8) parallel_8^(8 \/ p) \, #h(2em) p gt.eq 8 . $ <rec:smoothed-power-interpolation>]
  Combining this with (263) yields $sum_r s_r \( T_n \|_(V_lambda) \)^(p_d) lt.eq D_lambda^(- 1)$. Since the singular values decrease, their first $r$ terms imply the required bound $\( D_lambda r \)^(- 1 \/ p_d)$.
  In the sparse range $1 lt.eq k lt.eq n^(1 - 1 \/ 400)$, use (253) with $delta = 1 \/ 400$ and $log \( D_lambda r \) lt.eq 2 k log n$. It suffices to keep all exponents at least $2 \/ c_(1 \/ 400)$, which is achieved by increasing the common finite base exponent. Lemma 5 supplies a sufficiently large common base exponent for the finitely many nonconstant blocks and singular indices at those sizes. The trivial block has $D_lambda = r = 1$ and singular value one, and the killed blocks have singular value zero, so both satisfy the statement directly.
  Finally the large-size threshold depends only on the absolute constants in the overlap and dimension bounds, not on the finite base exponent. Lemma 18, with $gamma = 1 \/ 2$, bounds the product of $1 + A \/ sqrt(d)$ along every rounded-halving branch. Hence $sup_d p_d < oo$. ◻
]

The indexed power bounds of Sections 15–17 now give the same fixed-sweep mixing consequence by the conversion in Section 4. Their usable operator exponents are, respectively, $10^(- 8) c$, $alpha$, and $1 \/ sup_d p_d$. For any of these exponents $a > 0$, an integer $R$ with $2 a R gt.eq 3$ makes the regular contribution $D_lambda parallel T_n \( lambda \)^R parallel_(upright("HS"))^2$ of each nontrivial nonzero block at most $D_lambda^(- 1)$. The sign block vanishes, and Lemma 8 makes the sum tend to zero. Thus $R$ forward sweeps, or $R d$ physical shuffles, converge to uniform in total variation. The matching order lower bound is Lemma 6.


#bibliography("refs.bib", style: "ieee", title: [References])
