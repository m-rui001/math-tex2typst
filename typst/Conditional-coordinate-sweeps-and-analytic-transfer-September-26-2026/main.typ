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

#align(center)[#text(size: 16pt, weight: "bold")[Conditional coordinate sweeps and analytic transfer]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

Revealing the paths of selected cards can separate a shuffle’s remaining randomness into local choices, but it also changes the law of those choices. In an ordered coordinate sweep, conditioning still separates by coordinate lines; each residual choice is a bijection between the slots left free by the prescribed paths at that stage. This paper controls the entire remaining bijection while retaining the exact cost of prescribing distinct positions without replacement. That cost makes the estimate stable when further card paths are revealed during the proof.

Fix a positive integer $d$ and put $N = 2^d$. A binary coordinate sweep acts on the slots ${ 0 \, 1 }^d$. In each coordinate direction it independently fixes or swaps the two cards on every parallel edge, with probability $1 \/ 2$ each, and visits the coordinates in order. Write $B_N$ for its law. One card is uniform after a sweep, but the joint permutation retains dependence because cards can use the same switches.

The physical model comes from Thorp’s study of nonrandom shuffling and Faro #cite(label("Thorp1973")). Split a deck into equal halves, pair corresponding cards, and use an independent fair coin to order each pair before interleaving. On binary position strings one physical Thorp shuffle is

$ \( x_1 \, x_2 \, dots.h \, x_d \) mapsto \( x_2 \, dots.h \, x_d \, x_1 + xi_(x_2 \, dots.h \, x_d) \) \, $

where addition is modulo two and the bits $xi$ are independent and fair. Undoing the deterministic coordinate rotation makes successive switch layers act in successive coordinate directions. After $d$ physical shuffles the rotation is the identity, so one binary sweep costs exactly $d$ physical steps; see also Morris #cite(label("Morris2008")) Section 1.1 for the coordinate representation.

Let $q_d$ be the law of one physical step and $U_N$ the uniform probability on $S_N$. We use

$ parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_(g in S_N) \| mu \( g \) - nu \( g \) \| \, #h(2em) t_(upright("mix")) \( d \) = inf { t in bb(Z)_(gt.eq 0) : parallel q_d^(* t) - U_N parallel_(upright("TV")) lt.eq 1 \/ 4 } . $

Translation by a deterministic initial deck preserves the distance to uniform, so this definition is the same for every deterministic initial deck.

For the irreducible unitary representation $rho_lambda$ of $S_N$ indexed by $lambda tack.r N$, put

$ K_lambda = bb(E)_(g tilde.op B_N) rho_lambda \( g \) \, #h(2em) D_lambda = dim rho_lambda . $

The binary consequence of our argument is the following dimension bound.

#thm([Theorem 1.1.])[
  (Binary sweep contraction).  #emph[There are absolute constants $g > 0$ and $d_0$ such that, for $d gt.eq d_0$ and every $lambda tack.r 2^d$, 
$ parallel K_lambda parallel_(upright("op")) lt.eq D_lambda^(- g) . $

 The sign representation is annihilated. There is an absolute positive integer $w$ such that the law after $w$ independent sweeps converges to uniform in total variation as $d arrow.r oo$, uniformly over deterministic initial decks.]
] <thm:binary>

The number of random bits supplies a matching lower bound in order.

#thm([Proposition 1.2.])[
  (Support obstruction).  #emph[For every integer $t gt.eq 0$, 
$ parallel q_d^(* t) - U_N parallel_(upright("TV")) gt.eq 1 - frac(2^(t N \/ 2), N !) . $

 Consequently, 
$ t_(upright("mix")) \( d \) gt.eq ⌈2 / N log_2 #h(-0.16667em) (frac(3 N !, 4))⌉ = 2 d - O \( 1 \) . $

]
] <prop:support>

#proof[
  The $t N \/ 2$ fair bits determine the permutation, whose support therefore has at most $2^(t N \/ 2)$ elements. Testing that support in the definition of total variation gives the first bound. Distance at most $1 \/ 4$ requires its uniform mass to be at least $3 \/ 4$, proving the integer bound. Stirling’s formula gives the asymptotic expression. ◻
]

Theorem 1 and Proposition 2 give $t_(upright("mix")) \( d \) = Theta \( d \)$ in physical shuffle steps. In each fixed dimension, convergence also holds. A sweep can be the identity or any single cube-edge transposition with positive probability, and the edge transpositions of a connected graph generate $S_N$. Padding products with identities therefore gives a power of the sweep law with full support. Its positive minimum probability gives a uniform minorization and convergence by iteration.

=== 1.1 Earlier work <earlier-work>

Morris’s July 2005 author version, published in journal form in 2008, gave the polynomial upper bound $O \( d^44 \)$ physical shuffles for $N = 2^d$ cards #cite(label("Morris2008")). Montenegro and Tetali sharpened this to $O \( d^29 \)$ #cite(label("MontenegroTetali2006")). Morris then obtained $O \( \( log N \)^4 \)$ physical shuffles for every even deck size $N$ #cite(label("Morris2009")), followed by $O \( d^3 \)$ for power-of-two decks #cite(label("Morris2013")).

Earlier analyses already use information revealed about card motion. Morris’s chameleon identity represents a tagged-card law conditioned on the trajectory of an unordered occupied set #cite(label("Morris2008")) Section 4, Lemma 3. In his later entropy proof, complete labeled trajectories in two coupled runs of the reverse Thorp shuffle are exposed successively, and the expected entropy changes are summed to obtain contraction after $d$ physical shuffles #cite(label("Morris2013")) Section 4, proof of Lemma 7. Morris, Rogaway and Stegers analyze selected-card Thorp marginals by averaged conditional one-card bounds and a coupling along the evolution #cite(label("mrs")) Section 3 and Appendix A, Lemma 2. Hoang, Morris and Rogaway use a related conditional squared-discrepancy calculation for the distinct swap-or-not shuffle #cite(label("hmr2014")) Section 3, proof of Theorem 3 and Lemma 4.

Czumaj and Vöcking also studied partial Thorp permutations through non-Markovian coupling. For dyadic decks and each fixed $0 < epsilon < 1$, their result gives nearly uniform joint positions for a fraction $1 - epsilon$ of the labeled cards after $O \( d^2 \)$ physical shuffles #cite(label("CzumajVocking2014")); equivalently, $O \( d \)$ complete coordinate sweeps #cite(label("Czumaj2015")) Section 1.5. That result concerns the endpoint law of selected cards after repeated binary sweeps. Our conditional theorem concerns the entire residual bijection for each feasible fixed family of paths under line laws close to uniform.

The representation ingredients are classical branching, Pieri’s rule, the hook-length formula, and ordinary Schur–Weyl duality #cite(label("Sagan2001")) #cite(label("Stanley1999")). The signed tensor action and its hook support belong to the hook theory of Berele and Regev #cite(label("BereleRegev1983")). Positive domination by mixtures of tensor powers also underlies the postselection method of Christandl, König and Renner #cite(label("ChristandlKonigRenner2009")). We derive the quantitative signed projection estimate needed here from the ordinary Schur–Weyl sectors. The analytic ingredient is the classical subharmonic maximum principle; Section 7 gives the local barrier argument.

=== 1.2 The conditional estimate and the proof <the-conditional-estimate-and-the-proof>

The main conditional input is Theorem 3. It treats an ordered product grid whose coordinate sizes lie in a fixed interval $\[ R \, R^2 \]$ of powers of two. On a coordinate line of size $m$, the law is a mixture $\( 1 - z \) U_m + z B_m$ of a uniform permutation and a binary sweep. The theorem holds on a small real interval $0 lt.eq z lt.eq z_(*)$, where these line laws are uniformly comparable to $U_m$.

In one ordered sweep, a card’s input and output determine its whole path: after stage $j$, the first $j$ coordinates have their output values and the remaining coordinates still have their input values. On the small real interval, a prescribed family is feasible exactly when these forced paths occupy distinct slots at every layer. The conditional theorem bounds a Schatten moment of the remaining random bijection, in every irreducible representation, for each such family. Its bound has a negative term proportional to the logarithm of the representation dimension, an allowance for the number of prescribed cards, and a negative correction for sampling their positions without replacement. On a line of size $m$ with $u$ prescribed assignments, this correction is $log \( m^u \/ \( m \)_u \)$, where $\( m \)_u = m \( m - 1 \) dots.h.c \( m - u + 1 \)$ and $\( m \)_0 = 1$. For a prescribed family $cal(H)$, let $C \( cal(H) \)$ be the sum of these corrections over all stage lines.

The correction is the invariant that permits more paths to be revealed. When a placement of additional cards augments $cal(H)$ to $cal(H)^(+)$, its transition probability is bounded using the difference $C \( cal(H)^(+) \) - C \( cal(H) \)$ of the summed line corrections. Later, branching realizes the removal of boxes from a Young diagram by recording such additional placements. A cyclic trace expansion and Hölder’s inequality use that difference to return the original $- C \( cal(H) \)$ after the placements are summed. Because these fibers carry augmented path constraints, the induction must hold simultaneously for the conditioned laws.

The proof first treats sparse representation levels: types that first appear when only a short list of cards is tracked, together with their sign twists. Alternating the placement probabilities over subsets of the list cancels any tracked path whose stage lines are untouched by all other tracked or prescribed paths. With many coordinates, a count using rooted forests makes it unlikely that every tracked path shares a line. With a bounded number of coordinates, lines are larger and this count is too weak. At $z = 0$, an inverse-gamma moment identity expresses the falling-factorial ratios as expectations. A tracked path may now share lines: if it shares no layer slot with another tracked or prescribed path, and the number of tracked and prescribed paths using each of its lines is a small fraction of that line’s size, alternation produces small differences of the line factors. Factors from particles sharing a line are grouped before their moments are bounded. Once $R$ is fixed, only finitely many grids have this bounded number of coordinates, so continuity extends the estimate to a common small real interval.

To handle the remaining types of large dimension, choose $p$ and first prove an auxiliary estimate for every diagram whose boxes lie in the first $p$ rows or the first $p$ columns, uniformly over all admitted path families on the current grid. Split the coordinate list into two blocks and regard the grid as a rectangle: the first block sweeps within rows, and the second within columns. At their junction the prescribed paths have removed some sites. In the signed tensor representation, each row or column isotypic projection is bounded by a controlled multiple of a probability mixture of tensor powers of positive trace-one matrices. Averaging the chosen row matrices supplies a trace-one reference matrix for bounding the overlap of the row and column projections on the free sites. The child moment estimates then cancel the cost of the subgroup dimensions in that overlap, leaving a strengthened estimate for the full hook type with the same trajectory correction. Finally, adding the boxes outside the hook creates the additional path fibers described above. Branching supplies a factor equal to the dimension of the removed diagram; together with the remaining dimension saving, this pays for the extra paths.

We then set $cal(H) = diameter$. The unconditioned sweep operator is a matrix polynomial in $z$, and the conditional theorem gives a dimension saving on a short real segment. For the finitely many allowed line sizes, the binary line averages have a strict norm gap away from their invariant vectors. This bounds the full polynomial operator by one on a complex disk of radius greater than one. Applying the subharmonic maximum principle to scalar matrix coefficients on the disk with the segment removed transfers the dimension saving to $z = 1$, where the sweep is binary. Finite-group Fourier analysis then gives the fixed number of sweeps in Theorem 1.

Section 2 fixes the representation conventions. Section 3 defines the conditional law and states its moment bound. Section 4 proves the sparse estimate, and Section 5 constructs positive tensor densities for the signed action. Section 6 combines these inputs and completes the moment induction by adding trajectory constraints. Section 7 carries the unconditioned estimate to the binary sweep and proves the mixing consequence.

== 2 Representation facts and normalization <sec:prelim>

A permutation sends each input position to its output, and a product $g h$ applies $h$ first. Thus convolution is the law of composition, and

$ accent(mu * nu, ̂) \( lambda \) = hat(mu) \( lambda \) hat(nu) \( lambda \) \, #h(2em) hat(mu) \( lambda \) = sum_g mu \( g \) rho_lambda \( g \) . $

We use ordinary, unnormalized matrix traces: $parallel A parallel_p^p = "Tr" \| A \|^p$, where $\| A \| = \( A^(*) A \)^(1 \/ 2)$.

The group acts on slots, meaning positions for cards. A random bijection between two slot sets of the same size becomes a random permutation after identifying each set with a fixed reference set. Changing either identification multiplies its average in a unitary representation by unitaries on the two sides, so its singular values do not change. We will use this convention when prescribed paths leave different free slot sets at successive layers.

All representations are over $bb(C)$. For a partition $lambda tack.r l$, write $\[ lambda \]$ for the irreducible representation of $S_l$, $D_lambda$ for its dimension, and $F \( lambda \) = log D_lambda$. The empty diagram, for $l = 0$, has dimension one. All logarithms in the proof are natural. We use the following classical representation facts.

- The dimension $D_lambda$ is the number of standard tableaux of shape $lambda$, given by the hook-length formula. Conjugating the diagram, denoted by $lambda'$, twists the representation by sign. For $0 lt.eq j lt.eq l$, on restriction to $S_(l - j)$ the multiplicity of $\[ sigma \]$ is the number of standard tableaux of the skew shape $lambda \/ sigma$ when $sigma subset.eq lambda$, and is zero otherwise. These are the branching and tableau rules; see Sagan and Stanley #cite(label("Sagan2001")) #cite(label("Stanley1999")) and Vershik–Okounkov #cite(label("VershikOkounkov2005")) Theorem 5.8 and Corollary 7.1. In particular, the representation on placements of $j$ distinguishable cards in $l$ slots contains $\[ lambda \]$ exactly when $lambda_1 gt.eq l - j$.
- Pieri’s rule says that inducing with a trivial representation adds a horizontal strip, while inducing with a sign representation adds a vertical strip #cite(label("Sagan2001")) #cite(label("Stanley1999")).
- In ordinary Schur–Weyl duality, for integers $p gt.eq 1$ and $t gt.eq 0$, the $S_t$-types in $\( bb(C)^p \)^(⊗ t)$ are the partitions $sigma tack.r t$ with at most $p$ rows. Their multiplicity spaces are the polynomial irreducibles of highest weight $sigma$ for the commuting linear group action #cite(label("Sagan2001")) #cite(label("Stanley1999")). Section 5 uses this decomposition separately on two parity classes and records the quantitative multiplicity and weight estimates there.

The induction separates representations close to a row or column from those with exponentially large dimension. For large $l$, put

$ k = min \( l - lambda_1 \, l - lambda'_1 \) . $

If $0 < k lt.eq l \/ 3$, then

#[#set math.equation(numbering: n => "(1)")
 $ D_lambda gt.eq e^(- 1) binom(l, k) . $ <ac:eq:1>]

Indeed, after transposing if necessary, the first row has length $l - k$. Let $mu$ be the diagram of $k$ boxes below it. The hook formula gives

$ D_lambda = binom(l, k) D_mu product_(j = 1)^(l - k) (1 + frac(mu'_j, l - k - j + 1))^(- 1) . $

Only $j lt.eq k$ can contribute a nontrivial factor. Since $sum_j mu'_j = k$, the product is at least $exp \( - k \/ \( l - 2 k \) \) gt.eq e^(- 1)$, proving (1).

If $k > l \/ 3$, then

$ F \( lambda \) gt.eq c_(upright("dim")) l $

for an absolute $c_(upright("dim")) > 0$ and all large $l$. If both the first row and first column have length below $l \/ 8$, every hook is shorter than $l \/ 4$, and the hook formula with Stirling’s bound gives this conclusion. Otherwise transpose if needed so that the first row has length $v in \[ l \/ 8 \, 2 l \/ 3 \]$. Retain that row and a subdiagram of $floor.l v \/ 4 floor.r$ boxes below it. The preceding large-row bound makes the dimension of this retained shape exponential in $v$, and hence in $l$. Branching shows that $D_lambda$ is at least that dimension.

Reducing $c_(upright("dim"))$ if necessary, these estimates imply $F \( lambda \) gt.eq c_(upright("dim")) k$ for every $k$. Conversely the placement criterion, with a sign twist if necessary, places $\[ lambda \]$ inside a representation of dimension $\( l \)_k lt.eq l^k$. Thus

$ c_(upright("dim")) k lt.eq F \( lambda \) lt.eq k log l $

for large $l$. These are the bounds used to enter the sparse range; (1) also controls the sum over representations in the final mixing argument.

== 3 Prescribed trajectories and their cost <sec:paths>

Fix a power of two $R gt.eq 2$, to be chosen sufficiently large. Let $Omega = Omega_1 times dots.h.c times Omega_b$ be an ordered product grid with $b gt.eq 1$, where $m_j = \| Omega_j \|$ is a power of two in $\[ R \, R^2 \]$, and put $s = \| Omega \| = product_j m_j$. Each $Omega_j$ is identified with ${ 0 \, 1 }^(log_2 m_j)$. A sweep first permutes the lines parallel to coordinate 1, then those parallel to coordinate 2, and so on, independently on all lines. A line always belongs to its particular stage.

On a line of size $m$, use

#[#set math.equation(numbering: n => "(2)")
 $ L_m \( z \) = \( 1 - z \) U_m + z B_m \, $ <ac:eq:2>]

where $U_m$ is uniform on the permutations of that line and $B_m$ is a binary sweep on its $log_2 m$ bits. Both laws send each individual slot to a uniform slot. Both also have expected sign zero: for $B_m$, toggling one of its independent fair switches reverses the sign. At $z = 1$, the full grid sweep is the binary sweep with consecutive bits grouped into these coordinates.

Until the analytic argument, $z$ is real, nonnegative, and small. For the fixed $R$, let

$ A_R = max_m max_(g in S_m) m ! B_m \( g \) \, #h(2em) z_(upright("cmp")) \( R \) = min { 1 \/ 2 \, 1 \/ \( A_R + 1 \) } \, $

where $m$ ranges over the allowed line sizes. There are finitely many such sizes, so $z_(upright("cmp")) \( R \) > 0$. For $0 lt.eq z lt.eq z_(upright("cmp")) \( R \)$,

#[#set math.equation(numbering: n => "(3)")
 $ 1 / 2 U_m med lt.eq L_m \( z \) med lt.eq 2 U_m $ <ac:eq:3>]

as measures.

The order of the coordinates determines a path from its endpoints. If a card starts at $u = \( u_1 \, dots.h \, u_b \)$ and ends at $v = \( v_1 \, dots.h \, v_b \)$, then its slot after stage $j$ must be

$ \( v_1 \, dots.h \, v_j \, u_(j + 1) \, dots.h \, u_b \) \, #h(2em) 0 lt.eq j lt.eq b . $

We may therefore prescribe a family $cal(H)$ of $h$ such paths. We require their slots to be distinct at every layer, including input and output. These occupied slots will be called holes. For a stage line $L$ of size $m$, let $h_L$ count the prescribed paths using it, and let $E_L \( cal(H) \)$ be the event that the line permutation realizes their assignments from input to output. Layer disjointness makes these assignments injective, and (3) makes $E_L \( cal(H) \)$ have positive probability. The conditioning event is the intersection of these events over independent lines. Thus the residual line laws are the original laws $L_m \( z \)$ conditioned on their prescribed assignments, and they remain independent. Each acts as a random bijection between the unoccupied input and output slots of its line.

Put $M = s - h$. After the paths in $cal(H)$ are removed, the sweep gives a random bijection between the $M$ remaining input and output slots. For $lambda tack.r M$, let $K_lambda^(cal(H))$ be its average in $\[ lambda \]$, using any fixed identifications of the two slot sets as in Section 2.

For an integer $0 lt.eq u lt.eq m$, define the line cost

$ phi.alt_m \( u \) = log frac(m^u, \( m \)_u) \, #h(2em) \( m \)_u = m \( m - 1 \) dots.h.c \( m - u + 1 \) \, #h(2em) \( m \)_0 = 1 \, $

and set

$ C \( cal(H) \) = sum_(upright("stage lines ") L) phi.alt_(\| L \|) \( h_L \) . $

The summands in $phi.alt_m \( u \) = sum_(r = 0)^(u - 1) log \( m \/ \( m - r \) \)$ are nonnegative and increasing. For $u gt.eq 1$, their mean over the first $u$ terms is at most their mean over all $m$ terms, which is at most one because $m ! gt.eq \( m \/ e \)^m$. The case $u = 0$ is immediate. Hence $0 lt.eq phi.alt_m \( u \) lt.eq u$, and

$ 0 lt.eq C \( cal(H) \) lt.eq b h \, $

since the $h_L$ sum to $h$ at each stage.

For a nonnegative integer $t$, a placement of $t$ distinguishable cards is an injection from $\[ t \] = { 1 \, dots.h \, t }$ into the available slots; for $t = 0$ there is one empty placement. Let $x \, y$ be placements in the remaining input and output slots, and write $p_(cal(H)) \( x \, y \)$ for their conditional transition probability. If this probability is positive, the endpoint pairs determine additional paths that, together with $cal(H)$, form a disjoint family $cal(H)^(+)$ of size $h + t$. Let $v_L$ count the added paths on line $L$, so $h_L + v_L lt.eq \| L \|$. Figure 1 shows how a prescribed path and an added path can share a line while occupying distinct slots at every layer.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.16, -0.16), (0.16, 1.56), fill: rgb("#f0f0f0"), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  rect((4.34, -0.16), (4.66, 1.56), fill: rgb("#f0f0f0"), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((0.5, 2.65), [#text(size: 9pt)[input]])
  line((0, 0), (1, 0), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.7), (1, 0.7), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.4), (1, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (0, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((1, 0), (1, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((1, 0), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((0, 0.7), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((1, 0.7), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((0, 1.4), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((1, 1.4), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  content((5, 2.65), [#text(size: 9pt)[after coordinate 1]])
  line((4.5, 0), (5.5, 0), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((4.5, 0.7), (5.5, 0.7), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((4.5, 1.4), (5.5, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((4.5, 0), (4.5, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((5.5, 0), (5.5, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((4.5, 0), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((5.5, 0), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((4.5, 0.7), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((5.5, 0.7), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((4.5, 1.4), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((5.5, 1.4), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  content((9.5, 2.65), [#text(size: 9pt)[output]])
  line((9, 0), (10, 0), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((9, 0.7), (10, 0.7), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((9, 1.4), (10, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((9, 0), (9, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((10, 0), (10, 1.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((9, 0), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((10, 0), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((9, 0.7), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((10, 0.7), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((9, 1.4), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  circle((10, 1.4), radius: 0.04233, fill: rgb("#acacac"), stroke: none)
  content((2.75, 1.95), [#text(size: 7pt)[coordinate 1#linebreak()vertical lines]])
  content((7.25, 1.95), [#text(size: 7pt)[coordinate 2#linebreak()horizontal lines]])
  bezier((0, 1.4), (4.5, 0.7), (1.759, 1.153), (2.741, 0.9472), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
  bezier((4.5, 0.7), (10, 0.7), (6.572, 1.255), (7.928, 1.255), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
  bezier((0, 0.7), (4.5, 0), (1.759, 0.4528), (2.741, 0.2472), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: rgb("#d96d00"))))
  bezier((4.5, 0), (10, 0), (6.572, -0.5552), (7.928, -0.5552), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: rgb("#d96d00"))))
  circle((0, 1.4), radius: 0.07408, fill: rgb("#0000b2"), stroke: none)
  circle((4.5, 0.7), radius: 0.07408, fill: rgb("#0000b2"), stroke: none)
  circle((10, 0.7), radius: 0.07408, fill: rgb("#0000b2"), stroke: none)
  circle((0, 0.7), radius: 0.05, fill: rgb("#d96d00"), stroke: none)
  circle((4.5, 0), radius: 0.05, fill: rgb("#d96d00"), stroke: none)
  circle((10, 0), radius: 0.05, fill: rgb("#d96d00"), stroke: none)
  content((0.5, -0.75), [#text(fill: rgb("#d96d00"))[#text(size: 9pt)[$(i,j)$]]])
  content((5, -0.75), [#text(fill: rgb("#d96d00"))[#text(size: 9pt)[$(i',j)$]]])
  content((9.5, -0.75), [#text(fill: rgb("#d96d00"))[#text(size: 9pt)[$(i',j')$]]])
})],
  caption: [Figure 1: Schematic of selected slots in three layers of a grid with two coordinates. The first coordinate is drawn vertically and the second horizontally. The solid prescribed path and dashed added path share the highlighted line at the first stage but use distinct slots at every layer. The added path from $\( i \, j \)$ to $\( i' \, j' \)$ must pass through $\( i' \, j \)$. On the shared line this configuration has $h_L = 1$ and $v_L = 1$, illustrating how a prescribed assignment reduces the slots available to an added path. ],
) <fig:trajectory>

On a line used by the added paths, with $m = \| L \|$ and $v = v_L > 0$, the conditional probability is

$ frac(L_m \( z \) \( E_L \( cal(H)^(+) \) \), L_m \( z \) \( E_L \( cal(H) \) \)) lt.eq frac(4, \( m - h_L \)_v) . $

Indeed the corresponding uniform ratio is exactly $\( m - h_L \)_v^(- 1)$; (3) changes its numerator and denominator by factors between $1 \/ 2$ and $2$. The uniform ratio records the increment of the line cost:

$ frac(1, \( m - h_L \)_v) = m^(- v) exp { phi.alt_m \( h_L + v \) - phi.alt_m \( h_L \) } . $

Unused lines contribute one, and at most $t b$ lines are used. Each added path contributes $product_j m_j^(- 1) = s^(- 1)$. Multiplying the line bounds gives

#[#set math.equation(numbering: n => "(4)")
 $ p_(cal(H)) \( x \, y \) lt.eq s^(- t) exp { C \( cal(H)^(+) \) - C \( cal(H) \) + \( log 4 \) t b } . $ <ac:eq:4>]

The difference of potentials is the part of this estimate that permits further paths to be revealed during the induction.

For a positive integer $q$ to be fixed, define the unnormalized Schatten moment

$ T_lambda^(cal(H)) = parallel K_lambda^(cal(H)) parallel_(2 q)^(2 q) . $

#thm([Theorem 3.1.])[
  (Conditional sweep moment estimate).  #emph[There are a power of two $R gt.eq 2$, a positive integer $q$, and $z_(*) > 0$ such that every grid and every family $cal(H)$ of prescribed disjoint trajectories defined above satisfy, for every $z in \[ 0 \, z_(*) \]$ and every $lambda tack.r s - h$, 
#[#set math.equation(numbering: n => "(5)")
 $ log T_lambda^(cal(H)) med lt.eq med - c \( s \) F \( lambda \) + e \( s \) h log s - C \( cal(H) \) . $ <ac:eq:15>]

 Here a zero moment gives $- oo$. Use parameters 
$ a = 1 / 100 \, quad c_0 = e_0 = a / 100 \, #h(2em) c \( s \) = c_0 + 1 / sqrt(log s) \, #h(2em) e \( s \) = e_0 - 1 / sqrt(log s) . $

 The empty diagram has dimension one. If $h = s$, the remaining bijection is the unique empty bijection and its moment is one. The assertion also includes the one-dimensional trivial representation for every $h$.]
] <thm:conditional>

For $cal(H) = diameter$, the estimate is $T_lambda^diameter lt.eq D_lambda^(- c \( s \))$; Section 7 uses this estimate for small real parameters in the analytic transfer. For general $cal(H)$, the term $- C \( cal(H) \)$ is retained because (4) expresses the cost of prescribing additional paths as a difference of potentials. Section 6 uses that difference to recover the original potential after summing over the added placements.

== 4 Contraction at sparse representation levels <sec:sparse>

We now contract an irreducible that first appears on a short list of cards, even after a comparable number of trajectories has been prescribed. The row case uses an alternating placement kernel. The column case uses the same placement representation twisted by sign.

#thm([Lemma 4.1.])[
  (Conditional sparse contraction).  #emph[For every $0 < theta < 1$ and $K_0 gt.eq 1$, there are $rho > 0$ and $R_0$ such that, for each power of two $R gt.eq R_0$, one can choose $z_(upright("sp")) \( R \) > 0$ with the following property. For every allowed grid and prescribed family $cal(H)$, suppose that the integer $k gt.eq 1$ satisfies 
#[#set math.equation(numbering: n => "(6)")
 $ h lt.eq K_0 k \, #h(2em) h + k lt.eq s^(1 - theta) \, $ <ac:eq:5>]

 and let $lambda tack.r M = s - h$ satisfy $lambda_1 = M - k$ or $lambda'_1 = M - k$. Then, for every $z in \[ 0 \, z_(upright("sp")) \( R \) \]$, 
#[#set math.equation(numbering: n => "(7)")
 $ parallel K_lambda^(cal(H)) parallel_(upright("op")) lt.eq s^(- rho k) . $ <ac:eq:6>]

]
] <lem:sparse>

#proof[
  Put $B_0 = ceil.l 8 \/ theta ceil.r$. For $b > B_0$ we use only the line comparison (3). For $b lt.eq B_0$ we first prove the estimate at $z = 0$, then use continuity after fixing $R$. The implicit constants in the entry estimates below are absolute; their absorption into powers of $s$ will determine how large $R$ must be in terms of $theta \, K_0$.
  First assume $lambda_1 = M - k$. For input and output $k$-placements $x \, y$, let $p_A \( x_A \, y_A \)$ be the conditional probability of the paths for the labels in $A subset.eq \[ k \]$, with $p_diameter = 1$. Define a kernel from input placements to output placements by
  #[#set math.equation(numbering: n => "(8)")
   $ Q \( x \, y \) = s^(- k) sum_(A subset.eq \[ k \]) \( - 1 \)^(k - \| A \|) s^(\| A \|) p_A \( x_A \, y_A \) . $ <ac:eq:7>]
  Its $A = \[ k \]$ term is the full placement transition kernel. For a proper subset $A$, the corresponding operator has output range among the pullbacks $y mapsto f \( y_A \)$ of functions on $\| A \|$-placements. This subrepresentation contains only types with first row at least $M - \| A \| > M - k$, by the branching rule in Section 2. Projection to type $lambda$ therefore kills every term for a proper subset. The full placement representation contains $\[ lambda \]$, so its surviving block is a copy of $K_lambda^(cal(H))$. Consequently $parallel K_lambda^(cal(H)) parallel_(upright("op")) lt.eq parallel Q parallel_(upright("HS"))$. The scale $s$ in (8) will cancel the probability $1 \/ s$ of a path whose stage lines are untouched by every other constraint.
  If the paths of $A$ augment $cal(H)$ to a disjoint family $cal(H)_A$, then (4) and $C \( cal(H)_A \) lt.eq b \( h + \| A \| \)$ give a crude bound. Invalid subsets have probability zero. Summing over $A$ yields
  #[#set math.equation(numbering: n => "(9)")
   $ \| s^k Q \( x \, y \) \| lt.eq 2^k exp { b h + \( 1 + log 4 \) b k } . $ <ac:eq:8>]
  To count these entries, extend $Q$ by zero when either endpoint array fails to be an injection into its available input or output slots. On endpoint placements we keep the alternating formula (8), even when the full family of $k$ paths collides at an intermediate layer. Now choose all input and output slots independently and uniformly from the full grid $Omega$, with replacement. The zero extension gives the exact identity
  $ parallel Q parallel_(upright("HS"))^2 = s^(- 2 k) sum_(x \, y in Omega^k) \| s^k Q \( x \, y \) \|^2 = bb(E)_(upright("full")) \| s^k Q \( x \, y \) \|^2 . $
  Every sampled pair of endpoints determines an auxiliary trajectory by the layer formula in Section 3. At any fixed layer its slot is uniform in $Omega$, and the slots for different particles are independent. The following counting estimates use this independence between particles; the conditional shuffle probabilities remain inside $Q$.
  We will count two kinds of sharing: a common slot at a layer, or a common line at a stage. Suppose $omega$ bounds the probability that one independent particle shares with any fixed trajectory. Form the graph whose vertices are the particles and holes, with an edge for each sharing involving a particle. For $0 lt.eq w lt.eq k$, if at least $w$ particles are incident to edges, this graph contains a directed forest with at least $ceil.l w \/ 2 ceil.r$ edges and distinct particle tails. To see this, in a component meeting holes, point each particle to a neighbor one step closer to the nearest hole. Distances decrease along these edges, so they form a forest rooted at holes, with every particle a tail. In a component containing only particles, with $v gt.eq 2$ incident vertices, a rooted spanning tree supplies $v - 1 gt.eq v \/ 2$ particle tails.
  For a fixed directed forest with $j$ edges, condition on all paths except a leaf particle. Its parent is now fixed, its sharing event has probability at most $omega$, and it occurs in no other remaining edge. Removing leaves one by one bounds the forest probability by $omega^j$. There are at most $binom(k, j) \( k + h \)^j$ choices of its tails and parents. Thus, if $r = \( k + h \) omega lt.eq 1$, the probability that at least $w$ particles are incident to sharing is at most
  #[#set math.equation(numbering: n => "(10)")
   $ sum_(j = ceil.l w \/ 2 ceil.r)^k binom(k, j) r^j lt.eq 2^k r^(w \/ 2) . $ <ac:eq:9>]
  For $b > B_0$, take sharing to mean a common stage line. A particle uses a fixed line at stage $j$ with probability $m_j \/ s$, so $omega lt.eq b max_j m_j \/ s$. Since $max_j m_j lt.eq s^(2 \/ b)$,
  $ \( k + h \) omega lt.eq b thin s^(- theta + 2 \/ b) lt.eq s^(- theta \/ 2) $
  for sufficiently large $R$, uniformly in $b > B_0$. Here $2 \/ b < theta \/ 4$, and $b lt.eq s^(theta \/ 4)$ follows uniformly from $s gt.eq R^b$ after increasing $R$.
  If a path shares no stage line with another particle path or a hole, adding it to any subset multiplies that subset’s transition probability by $1 \/ s$. Its lines are independent of all the other constraints, and each uses the uniform marginal for one slot. The statement also holds when the subset has probability zero. The paired terms in (8) therefore cancel. Thus $Q eq.not 0$ requires all $k$ particles to be incident to line sharing. Using (10) with $w = k$ and then (9),
  $ Pr_(upright("full")) \( Q eq.not 0 \) & lt.eq 2^k s^(- theta k \/ 4) \,\
parallel Q parallel_(upright("HS")) & lt.eq 2^(3 k \/ 2) e^(b h + \( 1 + log 4 \) b k) s^(- theta k \/ 8) lt.eq s^(- theta k \/ 16) $
  for large $R$. The last step uses $h lt.eq K_0 k$ and $b \/ log s lt.eq 1 \/ log R$.
  === 4.1 A bounded number of coordinates <ac:part:85>
  When $b lt.eq B_0$, a line can occupy a substantial fraction of the grid, so many paths may share a line. We work at $z = 0$ and use the fact that most paths still see only a small fraction of each line prescribed. Put
  $ xi = frac(1, 10 B_0) \, #h(2em) eta = s^(- xi) \, $
  and increase $R$ so that $eta lt.eq 1 \/ 2$ for all $s gt.eq R$.
  For any endpoint arrays, let $t_L$ be the number of their $k$ auxiliary paths using line $L$, whether or not those paths are jointly feasible. Call $L$ light if $h_L + t_L lt.eq \| L \| eta$. A particle is good if every line on its path is light and it shares no slot at any layer with another particle or a hole. Let $G$ be the set of good particles. We first prove the entry bound
  #[#set math.equation(numbering: n => "(11)")
   $ \| s^k Q \| lt.eq exp \( O \( b \( k + h \) \) \) thin eta^(\| G \| \/ 2) . $ <ac:eq:10>]
  It is immediate for the zero extension outside endpoint placements, so consider an entry of the original placement matrix. For a subset $A$ whose paths are compatible with $cal(H)$ at every layer, the uniform conditional line law gives
  $ s^(\| A \|) p_A \( x_A \, y_A \) = product_L frac(m^(v_L \( A \)), \( m - h_L \)_(v_L \( A \))) \, #h(2em) m = \| L \| \, $
  where $v_L \( A \)$ counts its paths on $L$. For an invalid subset $A$, its probability is zero and this product is not formed.
  Because a good path shares no layer slot with another path or a hole, $J union S$ is valid exactly when $J$ is valid for every $J subset.eq \[ k \] \\ G$ and $S subset.eq G$. We may therefore group the alternating sum by $J$ and discard every invalid $J$ before forming line factors. For a valid $J$, let $r_L \( J \)$ count its paths on $L$, and define
  $ D_J = product_(L upright(" non-light")) frac(m^(r_L \( J \)), \( m - h_L \)_(r_L \( J \))) \, #h(2em) m = \| L \| . $
  All these denominators are positive. The bound for $phi.alt_m$ in Section 3 gives
  $ log D_J & = sum_(L upright(" non-light")) #scale(x: 120%, y: 120%)[\(] phi.alt_(\| L \|) \( h_L + r_L \( J \) \) - phi.alt_(\| L \|) \( h_L \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq sum_L phi.alt_(\| L \|) \( h_L + r_L \( J \) \) lt.eq b \( h + \| J \| \) . $
  At each light line introduce $W_L = m \/ Z_L$, where the $Z_L$ are independent gamma variables with shape $m - h_L + 1$ and unit rate. The elementary identity
  $ bb(E) Z^(- v) = frac(Gamma \( alpha - v \), Gamma \( alpha \)) quad upright("for ") Z tilde.op "Gamma" \( alpha \, 1 \) \, quad 0 lt.eq v < alpha \, $
  follows by integrating the gamma density. It gives $bb(E) W_L^v = m^v \/ \( m - h_L \)_v$ for the exponents used here. Lightness makes these moments finite. If $L_j \( i \)$ denotes the stage-$j$ line of a good path $i$, alternation over the good paths now gives the exact expression
  $ s^k Q \( x \, y \) = sum_(J subset.eq \[ k \] \\ G\
J upright(" valid")) & \( - 1 \)^(k - \| J \| - \| G \|) D_J\
 & times bb(E) #h(-0.16667em) [product_(L upright(" light")) W_L^(r_L \( J \)) product_(i in G) (product_(j = 1)^b W_(L_j \( i \)) - 1)] . $
  Every path using a light line uses the same variable $W_L$. We will group all factors by line before taking moments; independence is available between lines, not between particle factors.
  For nonnegative integers $u \, v$ with $u + v lt.eq t_L$, density tilting gives
  #[#set math.equation(numbering: n => "(12)")
   $ bb(E) W_L^v \| W_L - 1 \|^u = frac(m^(u + v), \( m - h_L \)_(u + v)) thin bb(E) \| 1 - Z' \/ m \|^u lt.eq C_1^(u + v) eta^(u \/ 2) \, $ <ac:eq:11>]
  where $Z'$ has gamma shape $n = m - h_L + 1 - u - v$ and unit rate, and $C_1$ is absolute. Indeed lightness gives the margin
  $ n gt.eq m \( 1 - eta \) + 1 > 0 \, #h(2em) frac(m^(u + v), \( m - h_L \)_(u + v)) lt.eq \( 1 - eta \)^(- \( u + v \)) lt.eq 2^(u + v) . $
  For a gamma variable of shape $n$, the centered moment generating function is $e^(- n t) \( 1 - t \)^(- n)$; its logarithm is at most $C n t^2$ for $\| t \| lt.eq 1 \/ 2$. Chernoff’s inequality gives $Pr \( \| Z' - n \| > x \) lt.eq 2 exp \[ - c min { x^2 \/ n \, x } \]$. Integrating this tail yields
  $ \( bb(E) \| Z' - n \|^u \)^(1 \/ u) lt.eq C \( sqrt(n u) + u \) \, #h(2em) u gt.eq 1 . $
  When $u gt.eq 1$, we have $u \/ m lt.eq eta$, $n lt.eq m + 1$, and $\| 1 - n \/ m \| lt.eq eta + 1 \/ m lt.eq 2 eta$, since $1 lt.eq u lt.eq m eta$. The triangle inequality therefore gives
  $ \( bb(E) \| 1 - Z' \/ m \|^u \)^(1 \/ u) lt.eq \| 1 - n \/ m \| + C / m \( sqrt(n u) + u \) lt.eq C' sqrt(eta) . $
  This proves (12); when $u = 0$, only the prefactor bound is needed.
  For each good path, telescope in stage order:
  $ product_(j = 1)^b W_(L_j \( i \)) - 1 = sum_(a = 1)^b \( W_(L_a \( i \)) - 1 \) product_(j < a) W_(L_j \( i \)) . $
  In one expanded term, let $u_L$ count its factors $W_L - 1$, and $v_L$ its undifferenced factors $W_L$. Each good path supplies one difference, so $sum_L u_L = \| G \|$. A tracked path supplies at most one factor at any line at a given stage, so $u_L + v_L lt.eq t_L$. Independence across lines and (12) bound the expectation of that term in absolute value by $C_1^(b k) eta^(\| G \| \/ 2)$. There are at most $b^(\| G \|)$ telescoping choices and $2^(k - \| G \|)$ choices of valid $J$. Together with the bound on $D_J$, these prove (11).
  It remains to count good particles. All probabilities in this count again refer to the independent endpoint arrays sampled with replacement in the full grid; the holes are fixed. The sparse hypothesis and $xi = 1 \/ \( 10 B_0 \) lt.eq theta \/ 80$ give, for large $R$,
  $ frac(\( b + 1 \) \( k + h \), s) lt.eq s^(- theta \/ 2) \, #h(2em) frac(2 h, s eta) \, med frac(2 k, s eta) lt.eq 2 s^(- \( theta - xi \)) lt.eq s^(- theta \/ 2) . $
  In particular these quantities are at most one.
  If $\| G \| < k \/ 2$, either at least $k \/ 4$ particles share a layer slot with another path, or at least $k \/ 4$ particles use a non-light line. The first event is bounded by (10) with $omega = \( b + 1 \) \/ s$. In the second event, some stage $j$ has at least $k \/ \( 4 B_0 \)$ particles on non-light lines. Each such line satisfies $h_L > m_j eta \/ 2$ or $t_L > m_j eta \/ 2$, so one of these two classes receives at least $a_k = k \/ \( 8 B_0 \)$ particles.
  At a fixed stage, the lines with $h_L > m_j eta \/ 2$ are determined by the holes and occupy a fraction at most $2 h \/ \( s eta \)$ of the slots. The independent occupancy bound for at least $a_k$ particles in this fixed set is $2^k \( 2 h \/ \( s eta \) \)^(a_k)$. For the lines with $t_L > m_j eta \/ 2$, their number is at most $r_j = floor.l 2 k \/ \( m_j eta \) floor.r$. If $r_j = 0$, there are none. Otherwise fix a set of at most $r_j$ lines first. A particle uses it with probability at most $r_j m_j \/ s lt.eq 2 k \/ \( s eta \)$, so its occupancy bound is $2^k \( 2 k \/ \( s eta \) \)^(a_k)$. We then sum over the at most $\( s + 1 \)^(r_j)$ possible fixed sets. Combining the three events gives
  $ Pr_(upright("full")) \( \| G \| < k \/ 2 \) lt.eq  & 2^k (frac(\( b + 1 \) \( k + h \), s))^(k \/ 8) + b thin 2^k (frac(2 h, s eta))^(a_k)\
 & + 2^k sum_(1 lt.eq j lt.eq b\
r_j gt.eq 1) \( s + 1 \)^(r_j) (frac(2 k, s eta))^(a_k) . $
  The thresholds may be nonintegral: taking their ceilings only decreases these powers of bases in $\[ 0 \, 1 \]$.
  The cost of choosing the lines with $t_L > m_j eta \/ 2$ is uniformly small. Since $b lt.eq B_0$ and $R lt.eq m_j lt.eq R^2$,
  $ m_j gt.eq s^(1 \/ \( 2 B_0 \)) \, #h(2em) m_j eta gt.eq s^(2 \/ \( 5 B_0 \)) \, #h(2em) frac(r_j log \( s + 1 \), k log s) lt.eq 2 s^(- 2 \/ \( 5 B_0 \)) frac(log \( s + 1 \), log s) = o_R \( 1 \) . $
  Before the factors $2^k$, the stage sum, and this set count, the vertex term saves $\( theta \/ 16 \) k log s$ and each term for non-light lines saves $\( theta \/ \( 16 B_0 \) \) k log s$. The displayed ratio tends to zero uniformly for $s gt.eq R$; the other two factors also cost $o_R \( k log s \)$. Increasing $R$ therefore gives
  #[#set math.equation(numbering: n => "(13)")
   $ Pr_(upright("full")) \( \| G \| < k \/ 2 \) lt.eq s^(- nu k) \, #h(2em) nu = frac(theta, 100 B_0) > 0 \, $ <ac:eq:12>]
  uniformly over the grids with $b lt.eq B_0$. On $\| G \| gt.eq k \/ 2$, (11) gives the entry saving $s^(- xi k \/ 4)$. On the complement, use (9) and the square root of (13) in the Hilbert–Schmidt expectation. We obtain
  $ parallel Q parallel_(upright("HS")) lt.eq exp \( O \( b \( k + h \) \) \) (s^(- xi k \/ 4) + s^(- nu k \/ 2)) . $
  === 4.2 Column types and the common perturbation interval <column-types-and-the-common-perturbation-interval>
  Suppose now that $lambda'_1 = M - k$. The sign twist of the $k$-placement representation contains $\[ lambda \]$. Its entry for placements $x \, y$ is the conditional average of $"sgn" \( g \) upright(bold(1))_({ g \( x \) = y })$, where $g$ is the remaining bijection in fixed slot identifications. An entry whose full path family is invalid is zero. For a valid entry, condition on all $h + k$ paths.
  On each line, list the assigned paths first in the same order at input and output, followed by the unassigned sites. Deleting the fixed assignments then leaves a residual bijection, and comparison with the original slot orders contributes only a deterministic sign. Applying this to the lines and composing the stages expresses the sign of the remaining bijection as a fixed factor times the product of the residual line signs. The conditioned lines are independent. It is therefore enough to find one line whose residual sign has mean zero.
  For $b > B_0$,
  $ frac(s, max_j m_j) gt.eq s^(1 - 2 \/ b) > s^(1 - theta) gt.eq h + k . $
  Every stage has more lines than paths, so it has a line untouched by all $h + k$ paths. Its residual law is $L_m \( z \)$, which has expected sign zero. For $b lt.eq B_0$ at $z = 0$, fix any stage $j$. The number of unassigned sites satisfies
  $ s - h - k gt.eq s \( 1 - s^(- theta) \) > s / m_j $
  once $R^(- theta) + R^(- 1) < 1$. There are $s \/ m_j$ lines in that stage, so one line has at least two unassigned sites. Its residual bijection under the uniform conditional law is uniform between the unassigned site sets and has expected sign zero. Thus every signed placement entry vanishes in the relevant parameter range of each branch.
  We finish by fixing the constants in the promised order. Set $beta = min { xi \/ 4 \, nu \/ 2 } > 0$. For an absolute constant $C$, the bounded-coordinate row estimate is at most
  $ 2 e^(C b \( 1 + K_0 \) k) s^(- beta k) lt.eq s^(- beta k \/ 2) $
  for all sufficiently large $R$, since $b \/ log s lt.eq 1 \/ log R$. The corresponding column operator is zero at $z = 0$. The many-coordinate row estimate is at most $s^(- theta k \/ 16)$, and its column operator is zero whenever (3) holds. We may therefore choose
  $ rho = min { theta \/ 32 \, beta \/ 4 } > 0 $
  before $R$, then choose $R_0$ large enough for all the preceding estimates. For every $R gt.eq R_0$, the bounded-coordinate bounds at $z = 0$ have strict slack relative to $s^(- rho k)$.
  Fix now a power of two $R gt.eq R_0$. When $b lt.eq B_0$, there are finitely many allowed grids, with $s lt.eq R^(2 B_0)$, and finitely many feasible path families, integers $k$, and partitions. Each conditional operator is a finite expression in line probabilities whose conditioning denominators are positive at $z = 0$; it is therefore continuous there. Strict slack and finiteness give $delta \( R \) > 0$ such that (7) holds for all these bounded-coordinate operators when $0 lt.eq z lt.eq delta \( R \)$. Set
  $ z_(upright("sp")) \( R \) = min { delta \( R \) \, z_(upright("cmp")) \( R \) } > 0 . $
  The many-coordinate proof applies throughout this interval by (3), so it covers every $b$ and completes the lemma. ◻
]

== 5 Positive tensor densities for hook diagrams <sec:density>

The sparse estimate settles small representation dimensions. For the remaining diagrams, the induction will compare row and column symmetry on a rectangle with holes. We construct positive tensor densities that dominate the projections for hook diagrams. Their trace-one normalization will permit that comparison even after sites have been removed.

Let $p in \[ 1 \, s \]$ be an integer and let $V = E xor O$, where $E$ and $O$ each have dimension $p$. On $V^(⊗ l)$, $l lt.eq s$, let $S_l$ permute the slots with signs: interchanging two neighboring odd factors (vectors in $O$) incurs a minus sign, and the other neighboring interchanges do not. On parity-homogeneous tensors the sign is therefore the sign of the induced reordering of the odd factors. This defines a unitary action. An #emph[even density] is a positive semidefinite operator on $V$ of trace one that is block diagonal for $E xor O$.

#thm([Lemma 5.1.])[
  (Signed density domination).  #emph[Let $P_alpha$ be the isotypic projection for $alpha tack.r l$ in this signed tensor representation. The types present are precisely those in the $\( p \, p \)$-hook: all their boxes lie in the first $p$ rows or the first $p$ columns. For every such type there is a probability distribution $mu_alpha$ on even densities such that, in positive semidefinite order, 
#[#set math.equation(numbering: n => "(14)")
 $ P_alpha prec.curly.eq exp { F \( alpha \) + O \( p^2 log \( s + 1 \) \) } bb(E)_(r tilde.op mu_alpha) r^(⊗ l) . $ <ac:eq:13>]

 Its multiplicity is at most $exp \( O \( p^2 log \( s + 1 \) \) \)$, and the number of types present is at most $\( s + 1 \)^(2 p)$. All constants are absolute.]
] <lem:density>

The signed tensor action and its hook support are classical in the hook theory of Berele and Regev #cite(label("BereleRegev1983")). Positive domination by mixtures of tensor powers also underlies the postselection technique of Christandl, König and Renner #cite(label("ChristandlKonigRenner2009")). We derive the needed signed form from ordinary Schur–Weyl sectors, keeping the irreducible dimension $D_alpha$ explicit.

#proof[
  For $l = 0$, the tensor space and its only representation have dimension one, and any density gives the assertion. Suppose $l > 0$. Fix the number $t$ of even factors. A fixed parity pattern has the ordinary tensor powers of $E$ and $O$, with the symmetric-group action on the latter twisted by sign. Summing over parity patterns induces this action from $S_t times S_(l - t)$ to $S_l$. Write $W_sigma \( E \)$ and $W_tau \( O \)$ for the ordinary Schur–Weyl multiplicity spaces, the polynomial irreducibles of highest weights $sigma$ and $tau$. The resulting orthogonal sectors, indexed by $sigma tack.r t$ and $tau tack.r l - t$ with at most $p$ rows each, are
  $ cal(V)_(sigma \, tau) tilde.equiv "Ind"_(S_t times S_(l - t))^(S_l) \( \[ sigma \] times.square \[ tau' \] \) ⊗ W_sigma \( E \) ⊗ W_tau \( O \) . $
  This decomposition records the commuting actions of $S_l$ and $U \( E \) times U \( O \)$: the induction records the positions of the two parities, and the transpose on $tau$ records the odd sign twist.
  The representation $\[ tau' \]$ occurs upon inducing sign representations on subgroups of sizes $tau_1 \, dots.h \, tau_p$, since its columns can be added successively as vertical strips. Thus, if $alpha$ occurs in $cal(V)_(sigma \, tau)$, Pieri’s rule reaches it from $sigma$ by at most $p$ vertical strips. Transposing and interchanging the two factors gives the analogous statement starting from $tau$. Padding by zeros,
  $ alpha_i lt.eq sigma_i + p \, #h(2em) alpha'_j lt.eq tau_j + p . $
  In particular $alpha_(p + 1) lt.eq p$, the hook condition. Conversely, for a hook shape take its first $p$ rows as the even shape, then add its boxes below those rows by columns from left to right. These are at most $p$ vertical strips. In the odd tensor power, words with one basis symbol for each strip and with its prescribed multiplicity carry the corresponding induction of sign representations. Pieri’s rule therefore supplies the given hook shape. The first $p$ row lengths and first $p$ column lengths specify any hook shape, so there are at most $\( s + 1 \)^(2 p)$ of them.
  We next compare the weight of a sector with the dimension of any type $alpha$ occurring there. Put
  $ cal(S) = l log l - sum_i sigma_i log sigma_i - sum_j tau_j log tau_j \, $
  with zero summands interpreted as zero. The horizontal and vertical arm lengths of $alpha$ outside its $p$-by-$p$ core are
  $ H_i = \( alpha_i - p \)_(+) quad \( i lt.eq p \) \, #h(2em) V_j = \( alpha'_j - p \)_(+) quad \( j lt.eq p \) . $
  The strip inequalities give $H_i lt.eq sigma_i$ and $V_j lt.eq tau_j$. Each hook in a horizontal arm is at most its row hook plus $p$. Consequently an arm of length $H_i$ has hook product at most
  $ product_(r = 1)^(H_i) \( r + p \) = H_i ! binom(H_i + p, p) lt.eq H_i ! \( s + p \)^p . $
  The same bound holds for each vertical arm, and the at most $p^2$ core hooks have length at most $s$. The hook-length formula now gives
  $ D_alpha gt.eq \( s + p \)^(- O \( p^2 \)) frac(l !, product_i sigma_i ! product_j tau_j !) . $
  Using $log \( n ! \) = n log n - n + O \( log \( n + 1 \) \)$, whose linear terms cancel because $\| sigma \| + \| tau \| = l$, proves
  #[#set math.equation(numbering: n => "(15)")
   $ cal(S) lt.eq F \( alpha \) + O \( p^2 log \( s + 1 \) \) . $ <ac:eq:14>]
  To obtain a positive density for the sector, define
  $ d_E = "diag" \( sigma_1 \/ l \, dots.h \, sigma_p \/ l \) \, #h(2em) d_O = "diag" \( tau_1 \/ l \, dots.h \, tau_p \/ l \) \, $
  and let $r_U = \( U_E d_E U_E^(*) \) xor \( U_O d_O U_O^(*) \)$, with independent Haar unitaries on $E$ and $O$. This is an even density. Write $m_sigma = dim W_sigma \( E \)$ and $m_tau = dim W_tau \( O \)$. The Weyl dimension formula gives, for $\| sigma \| = t$,
  $ m_sigma = product_(1 lt.eq i < j lt.eq p) frac(sigma_i - sigma_j + j - i, j - i) lt.eq \( t + 1 \)^(p \( p - 1 \) \/ 2) \, $
  and the analogous bound for $m_tau$, with $t$ replaced by $l - t$. The tensor power of $d_E$ is positive and acts on the multiplicity space as $W_sigma \( d_E \)$. Its highest-weight line has eigenvalue $product_i \( sigma_i \/ l \)^(sigma_i)$; all other eigenvalues are nonnegative. The analogous statement holds for $d_O$. These assertions extend to zero eigenvalues by continuity, with $0^0 = 1$.
  The tensor density preserves every Schur–Weyl sector. Averaging over the two unitary groups makes its action scalar on the two irreducible multiplicity spaces. On the whole sector $cal(V)_(sigma \, tau)$ the scalar is
  $ frac("Tr" W_sigma \( d_E \), m_sigma) frac("Tr" W_tau \( d_O \), m_tau) med gt.eq med frac(product_i \( sigma_i \/ l \)^(sigma_i) product_j \( tau_j \/ l \)^(tau_j), m_sigma m_tau) = frac(e^(- cal(S)), m_sigma m_tau) gt.eq e^(- cal(S) - O \( p^2 log \( s + 1 \) \)) . $
  The same scalar acts on every parity pattern: the density preserves those patterns and has the same tensor factors on each. Thus their number does not enter the scalar. If $Q_(sigma \, tau)$ is the orthogonal projection onto this sector, positivity and (15) give
  $ Q_(sigma \, tau) prec.curly.eq exp { F \( alpha \) + O \( p^2 log \( s + 1 \) \) } thin bb(E)_U r_U^(⊗ l) $
  whenever $alpha$ occurs there.
  The relevant sector projections cover $P_alpha$. Their number $N_alpha$ is at most $\( s + 1 \)^(2 p)$, because the two padded partitions are specified by $2 p$ integers between zero and $s$. Sum the last bound over these sectors, and choose a sector uniformly before choosing its two Haar unitaries. The resulting probability distribution $mu_alpha$ satisfies
  $ sum_(upright("relevant sectors")) bb(E)_U r_U^(⊗ l) = N_alpha thin bb(E)_(r tilde.op mu_alpha) r^(⊗ l) . $
  The factor $N_alpha$ is absorbed by $O \( p^2 log \( s + 1 \) \)$, proving (14). Finally, taking traces proves the multiplicity bound: $"Tr" P_alpha = D_alpha "mult" \( alpha \)$, while every tensor density has trace one. ◻
]

When sites are partitioned into blocks, signed unitary reordering makes the action of their product subgroup a tensor product. Applying (14) in each block therefore gives products of densities constant within the blocks. Each density is even, so undoing the signed reordering carries this to the ordinary tensor product with its sites relabeled. In particular, a constant tensor power of an even density commutes with the full signed symmetric-group action.

== 6 The conditional moment induction <sec:induction>

We prove Theorem 3 by induction on the number $b$ of coordinates, simultaneously for every allowed grid, path family, and representation. First fix the constants in the order required by the sparse estimate. Take $theta = a \/ 16$ and $K_0 = 10 \/ e_0$ in Lemma 4. Its exponent $rho$ is uniform for sufficiently large $R$, so we may next choose an integer

$ q gt.eq max { 1 \, ceil.l 2 \/ rho ceil.r } \, #h(2em) 2 q rho gt.eq 4 \, $

and only then choose a sufficiently large power of two $R$. Every largeness requirement below will hold uniformly for $s gt.eq R$. In particular, require

$ 1 / sqrt(log R) lt.eq e_0 / 2 \, #h(2em) frac(1, log R) lt.eq e_0 / 4 . $

Since $b lt.eq log s \/ log R$ and $C \( cal(H) \) lt.eq b h$, these choices give

$ c \( s \) lt.eq 2 c_0 \, #h(2em) e \( s \) gt.eq e_0 \/ 2 \, #h(2em) e \( s \) h log s - C \( cal(H) \) gt.eq \( e_0 \/ 4 \) h log s . $

Further increases of $R$ will absorb the displayed errors below. After $R$ is fixed, choose $z_(*) > 0$ small enough for (3), Lemma 4, and the base case.

Every conditional average is a contraction. Thus when $F \( lambda \) = 0$, its moment is at most one and the nonnegative allowance above proves the theorem. This covers the empty diagram, $M = 1$, and all one-dimensional types. A zero moment satisfies the bound by the convention $log 0 = - oo$.

For $b = 1$ and $z = 0$, conditioning on the prescribed assignments leaves a uniform bijection of the remaining slots. Every nontrivial average is therefore zero. Once $R$ is fixed there are only finitely many one-coordinate grids, path families, and representations, and their conditional operators are continuous at zero. Decreasing $z_(*)$ gives the base case on a common interval.

Now assume $b gt.eq 2$ and the theorem for fewer coordinates. The contraction bound gives $T_lambda^(cal(H)) lt.eq D_lambda$, so the desired inequality is automatic whenever

#[#set math.equation(numbering: n => "(16)")
 $ \( 1 + c \( s \) \) F \( lambda \) lt.eq e \( s \) h log s - C \( cal(H) \) . $ <ac:eq:16>]

Suppose $F \( lambda \) < s^(1 - a \/ 4)$ and (16) fails. The positive allowance above then gives $h log s lt.eq K_0 F \( lambda \)$, and $M = s - h gt.eq s \/ 2$ for large $R$. Put $k = min \( M - lambda_1 \, M - lambda'_1 \)$. The dimension estimates from Section 2 give $c_(upright("dim")) k lt.eq F \( lambda \) lt.eq k log s$. Hence $h lt.eq K_0 k$, and

$ h + k lt.eq s^(1 - theta) $

for large $R$, because $theta = a \/ 16 < a \/ 4$. Also $k gt.eq 1$, since $F \( lambda \) > 0$. Lemma 4 applies. There are $D_lambda$ singular values, so

$ log T_lambda^(cal(H)) lt.eq F \( lambda \) - 2 q rho k log s lt.eq - 3 F \( lambda \) lt.eq - c \( s \) F \( lambda \) + e \( s \) h log s - C \( cal(H) \) . $

This settles the sparse-dimension range.

We are left with $b gt.eq 2$ and the large-dimension range

#[#set math.equation(numbering: n => "(17)")
 $ F \( lambda \) gt.eq s^(1 - a \/ 4) . $ <ac:eq:17>]

=== 6.1 The hook estimate on the current grid <ac:part:199>

Removing the boxes outside a hook will record extra card trajectories. We therefore first prove an estimate that is uniform over the resulting path families. Set

$ p = floor.l s^a floor.r \, #h(2em) hat(c) = c \( s \) + frac(1, 20 sqrt(log s)) \, #h(2em) hat(e) = e \( s \) - frac(1, 20 sqrt(log s)) . $

Under the induction hypothesis for fewer than $b$ coordinates, we claim that every family $cal(H)'$ of $h'$ prescribed trajectories on the current grid, with distinct slots at every layer and satisfying the coordinate rule of Section 3, and every $\( p \, p \)$-hook diagram $gamma tack.r s - h'$, satisfy

#[#set math.equation(numbering: n => "(18)")
 $ log T_gamma^(cal(H)') lt.eq - hat(c) F \( gamma \) + hat(e) h' log s - C \( cal(H)' \) + s^(9 \/ 10) . $ <ac:eq:21>]

There is no lower bound on $F \( gamma \)$ in this claim. It retains the full trajectory potential and improves both coefficients slightly. We will derive it from two shorter coordinate sweeps, then use its dimension reserve when the removed boxes are restored.

Split the coordinate list into consecutive parts of $floor.l b \/ 2 floor.r$ and $ceil.l b \/ 2 ceil.r$ coordinates, with products $s_1$ and $s_2$. Each coordinate contributes between $log R$ and $2 log R$, so

$ 1 / 5 log s lt.eq log s_u lt.eq 4 / 5 log s #h(2em) \( u = 1 \, 2 \) . $

In particular $p lt.eq s_u$. Regard the grid as $s_2$ rows of length $s_1$. The first part of the sweep acts within rows and the second within columns. At their junction, the middle positions of $cal(H)'$ are removed, leaving a fixed board of $s - h'$ free sites. Splitting each prescribed trajectory there gives the path constraints in each row and each column.

Use the signed tensor representation of Section 5 on the free sites at each layer. Let $X$ be the conditional row average from the input layer to the junction, and $Y$ the conditional column average from the junction to the output. The row and column randomizations are conditionally independent under the fixed path constraints, so $Y X$ is the full conditional average. At the junction let $P_gamma$ be the full-group isotypic projection, and let $P_alpha^R \, P_beta^C$ be the row and column subgroup projections. Here $alpha_i$ partitions the number of free sites in row $i$, and $beta_j$ partitions the number of free sites in column $j$; a row or column with no free sites has the empty type. The sums below range over the local types occurring in the signed tensor representation. Put

$ F_R = sum_i F \( alpha_i \) \, #h(2em) F_C = sum_j F \( beta_j \) . $

The full projection commutes with both subgroup projections. Bijections between the layers intertwine their full isotypic projections. Thus, under compatible unitary identifications, the restriction of $Y P_gamma X$ from the input $gamma$-isotypic space to the output $gamma$-isotypic space is $K_gamma^(cal(H)') ⊗ I$, where the identity acts on the tensor multiplicity space. The hook type occurs by Lemma 5, so this multiplicity is at least one. Inserting the subgroup decompositions at the junction gives

#[#set math.equation(numbering: n => "(19)")
 $ \( T_gamma^(cal(H)') \)^(1 \/ \( 2 q \)) & lt.eq parallel Y P_gamma X parallel_(2 q)\
 & lt.eq sum_(alpha \, beta) parallel Y P_beta^C parallel_(2 q) thin parallel P_beta^C P_gamma P_alpha^R parallel_(upright("op")) thin parallel P_alpha^R X parallel_(2 q) . $ <ac:eq:20>]

The first inequality uses the unnormalized trace on at least one copy of $gamma$. The second uses the triangle inequality and the product norm inequality, followed by $parallel A parallel_(upright("op")) lt.eq parallel A parallel_(2 q)$ for an outer factor. We now bound the two child moments and the middle overlap.

Ordering the free sites by rows at both ends of the first part makes $X = ⨂_i X_i$; signed unitary reordering justifies this tensor product. Write $cal(H)_i$ for the path constraints in row $i$ and $"mult" \( alpha_i \)$ for the tensor multiplicity. Then

$ parallel P_alpha^R X parallel_(2 q)^(2 q) = product_i "mult" \( alpha_i \) T_(alpha_i)^(cal(H)_i) . $

The column formula is identical. Lemma 5 bounds each multiplicity by $exp \( O \( p^2 log \( s + 1 \) \) \)$. Apply the induction hypothesis to every local constrained sweep and put

$ c_(*) = min_(u = 1 \, 2) c \( s_u \) \, #h(2em) e_(*) = max_(u = 1 \, 2) e \( s_u \) . $

Each stage line belongs to exactly one child subproblem, so their potentials add to $C \( cal(H)' \)$. Each part has $h'$ prescribed trajectories, and their size weights add as $log s_1 + log s_2 = log s$. Hence

#[#set math.equation(numbering: n => "(20)")
 $ log #h(-0.16667em) (parallel P_alpha^R X parallel_(2 q)^(2 q) parallel Y P_beta^C parallel_(2 q)^(2 q)) lt.eq  & - c_(*) \( F_R + F_C \) + e_(*) h' log s - C \( cal(H)' \)\
 & + O \( \( s_1 + s_2 \) p^2 log \( s + 1 \) \) . $ <ac:eq:18>]

The middle factor in (19) depends only on the fixed free-site board. Its estimate does not use the trajectory probabilities.

#thm([Lemma 6.1.])[
  (Overlap at the junction).  #emph[For the row and column type lists on the free junction sites and the full hook type $gamma$ defined above, 
#[#set math.equation(numbering: n => "(21)")
 $ log parallel P_beta^C P_gamma P_alpha^R parallel_(upright("op"))^2 lt.eq F_R + F_C - F \( gamma \) + h' + O \( \( s_1 + s_2 \) p^2 log \( s + 1 \) \) . $ <ac:eq:19>]

 Here a zero norm has logarithm $- oo$, and the constant is absolute.]
] <lem:overlap>

#proof[
  Since $P_gamma$ commutes with both subgroup projections,
  $ parallel P_beta^C P_gamma P_alpha^R parallel_(upright("op"))^2 lt.eq parallel P_beta^C P_gamma P_alpha^R parallel_(upright("HS"))^2 = "Tr" \( P_alpha^R P_beta^C P_gamma \) . $
  The product $P_beta^C P_gamma$ is a positive projection. We may therefore dominate $P_alpha^R$ inside this trace by Lemma 5. Apart from the factor $exp \( F_R + O \( s_2 p^2 log \( s + 1 \) \) \)$, this leaves a probability mixture of product densities whose one-site matrix in row $i$ is an even density $r_i$.
  For one such row family, average over all $s_2$ rows, including empty ones. For $0 < epsilon < 1$, put
  $ macron(r) = 1 / s_2 sum_i r_i \, #h(2em) macron(r)_epsilon = \( 1 - epsilon \) macron(r) + epsilon I \/ dim V \, #h(2em) A_epsilon = macron(r)_epsilon^(- 1 \/ 2) . $
  The regularized reference density is even. With $n = s - h'$, the positive operator $B_epsilon = macron(r)_epsilon^(⊗ n)$ has trace one and commutes with the full signed group action. On the $gamma$-isotypic space it has the form $I_(D_gamma) ⊗ B_gamma$. Every eigenvalue there is therefore counted at least $D_gamma$ times in its trace, and
  $ B_epsilon P_gamma prec.curly.eq D_gamma^(- 1) P_gamma . $
  It also commutes with $P_beta^C$. Compress this inequality by that projection, use $P_beta^C P_gamma prec.curly.eq P_beta^C$ on the right, and conjugate by $B_epsilon^(- 1 \/ 2)$. The result is
  $ P_beta^C P_gamma prec.curly.eq D_gamma^(- 1) A_epsilon^(⊗ n) P_beta^C A_epsilon^(⊗ n) . $
  Now dominate the column projection by its density mixture. Apart from the corresponding factor $exp \( F_C + O \( s_1 p^2 log \( s + 1 \) \) \)$, each resulting mixture integrand is the tensor-product trace
  $ product_(\( i \, j \) upright(" free")) "tr" \( A_epsilon r_i A_epsilon v_j \) \, $
  where $v_j$ is the even density for column $j$. Each factor is nonnegative: it equals $parallel r_i^(1 \/ 2) A_epsilon v_j^(1 \/ 2) parallel_(upright("HS"))^2$. For every column, summing these factors over all rows gives
  $ sum_i "tr" \( A_epsilon r_i A_epsilon v_j \) = s_2 "tr" \( A_epsilon macron(r) A_epsilon v_j \) lt.eq frac(s_2, 1 - epsilon) . $
  If the column is missing $l < s_2$ sites, AM–GM on its $s_2 - l$ retained sites bounds their product by
  $ \( 1 - epsilon \)^(- \( s_2 - l \)) (frac(s_2, s_2 - l))^(s_2 - l) lt.eq \( 1 - epsilon \)^(- \( s_2 - l \)) e^l . $
  If $l = s_2$, the empty column contributes the empty product one. There are $h'$ missing sites in total. Multiplication over columns, averaging the uniformly bounded integrands, and then letting $epsilon arrow.b 0$ prove (21). ◻
]

We now combine the two estimates. Write $W$ for the right side of (21), including its error. Terms with zero middle factor in (19) contribute nothing. For a nonzero middle factor, its norm is at most one as well as satisfying (21). Since $c_(*) lt.eq 2 c_0 < 1 lt.eq q$,

$ q log parallel P_beta^C P_gamma P_alpha^R parallel_(upright("op"))^2 lt.eq c_(*) min \( 0 \, W \) lt.eq c_(*) W . $

Adding this to (20) cancels $F_R + F_C$. The number of lists of local hook types contributes only $O_q \( \( s_1 + s_2 \) p^2 log \( s + 1 \) \)$ when the sum in (19) is raised to $2 q$. We obtain

$ log T_gamma^(cal(H)') lt.eq - c_(*) F \( gamma \) + e_(*) h' log s - C \( cal(H)' \) + c_(*) h' + O_q \( \( s_1 + s_2 \) p^2 log \( s + 1 \) \) . $

The size split gives the reserves in the claimed coefficients. With $L = log s$,

$ c_(*) - c \( s \) = e \( s \) - e_(*) gt.eq frac(sqrt(5) \/ 2 - 1, sqrt(L)) > frac(1, 10 sqrt(L)) . $

The hats use only $1 \/ \( 20 sqrt(L) \)$ of each reserve. The remaining hole reserve is at least $h' sqrt(L) \/ 20$, which absorbs $c_(*) h'$ for large $R$. Also

$ \( s_1 + s_2 \) p^2 log \( s + 1 \) lt.eq 2 s^(4 \/ 5 + 2 a) log \( s + 1 \) = 2 s^0.82 log \( s + 1 \) . $

For fixed $q$, the corresponding $O_q$ error is at most $s^(9 \/ 10)$ once $R$ is large. These comparisons prove (18) for every allowed $cal(H)'$ and hook type, including the types of small dimension.

=== 6.2 Adding the cells outside the hook <ac:part:245>

Return to the diagram $lambda$ in (17). Keep its $\( p \, p \)$-hook part $gamma$, which is a Young diagram. Translate the remaining boxes by subtracting $p$ from both indices to obtain an ordinary partition $delta$, and put $k = \| delta \|$. The skew shape $lambda \/ gamma$ is a translate of $delta$, so branching and Frobenius reciprocity give multiplicity $D_delta$ for $lambda$ in the representation induced from $\[ gamma \]$ on $S_(M - k)$ to $S_M$. That induced space has dimension $\( M \)_k D_gamma$. In particular,

#[#set math.equation(numbering: n => "(22)")
 $ F \( lambda \) lt.eq F \( gamma \) + k log s . $ <ac:eq:22>]

Realize the induced space with one fiber of type $\[ gamma \]$ for each placement of $k$ distinguishable cards in the free slots. A bijection moves the placement and acts on its fiber by the bijection of the remaining slots; consistent identifications of those slot sets change the fiber maps only by unitaries. The average block from placement $x$ to placement $y$ is $p_(cal(H)) \( x \, y \)$ times the conditional operator in $\[ gamma \]$ after those extra trajectories have been prescribed. If this probability is positive, the endpoints force a feasible augmented family $cal(H)'$ of $h + k$ trajectories. Thus (18) applies to every nonzero block, with no dimension condition on $gamma$.

The $2 q$-moment of the induced average is the sum of the irreducible moments with their multiplicities, and hence is at least $D_delta T_lambda^(cal(H))$. Expand its trace as a sum over cyclic placement indices with $2 q$ edges, alternating between the input and output placement sets. Let $p_j$ be the transition entry on edge $j$, using the transposed transition matrix on an adjoint edge. The fiber map on an adjoint edge is the adjoint of its corresponding forward conditional operator. It has the same singular values and uses the same forward path potential. For a nonzero cyclic term, write $cal(H)'_j$ for these augmented paths on edge $j$. The triangle inequality and matrix trace Hölder give

#[#set math.equation(numbering: n => "(23)")
 $ D_delta T_lambda^(cal(H)) lt.eq sum (product_(j = 1)^(2 q) p_j) product_(j = 1)^(2 q) \( T_gamma^(cal(H)'_j) \)^(1 \/ \( 2 q \)) . $ <ac:eq:23>]

The sum may be restricted to nonzero cyclic terms.

Apply (18). Apart from the potential $- C \( cal(H)'_j \)$, its terms depend only on $s \, h + k \, gamma$, so the same bound applies on every edge. To handle the potentials, apply (4) to a $1 \/ \( 2 q \)$ power of each $p_j$. Multiplication over the edges yields

$ product_(j = 1)^(2 q) (p_j e^(- C \( cal(H)'_j \) \/ \( 2 q \))) lt.eq s^(- k) exp { - C \( cal(H) \) + \( log 4 \) k b } product_(j = 1)^(2 q) p_j^(1 - 1 \/ \( 2 q \)) . $

The augmented potentials have disappeared, leaving the potential of the original path family.

It remains to sum the last product. Put $n_k = \( M \)_k$ and label the $2 q$ placement variables $x_1 \, dots.h \, x_(2 q)$ cyclically. Each edge matrix is the placement transition matrix or its transpose. Both row and column sums are one, because the transition averages bijections of the free slots. For each $r$, let $A_r$ be the product of all edge entries except the $r$th. Then

$ product_(j = 1)^(2 q) p_j^(1 - 1 \/ \( 2 q \)) = product_(r = 1)^(2 q) A_r^(1 \/ \( 2 q \)) . $

Deleting an edge opens the cycle into a chain. Successive summation over an endpoint of that chain uses a row or column sum equal to one; the last placement has $n_k$ possible values. Hence $sum A_r = n_k$ for every $r$, and scalar Hölder gives

$ sum_(x_1 \, dots.h \, x_(2 q)) product_(j = 1)^(2 q) p_j^(1 - 1 \/ \( 2 q \)) lt.eq product_(r = 1)^(2 q) (sum A_r)^(1 \/ \( 2 q \)) = n_k . $

Restricting to the nonzero cyclic terms only decreases this sum. The net counting factor in (23) is therefore $s^(- k) \( M \)_k lt.eq 1$. We have proved

#[#set math.equation(numbering: n => "(24)")
 $ log T_lambda^(cal(H)) lt.eq - hat(c) F \( gamma \) + hat(e) \( h + k \) log s + s^(9 \/ 10) - C \( cal(H) \) + \( log 4 \) k b - F \( delta \) . $ <ac:eq:24>]

We finish by comparing the cost of the extra trajectories with the dimension gained from the removed boxes and from the hook estimate. Since $hat(c) > 0$, (22) gives

$ log T_lambda^(cal(H)) lt.eq  & - hat(c) F \( lambda \) + hat(e) h log s - C \( cal(H) \) + s^(9 \/ 10)\
 & + #scale(x: 120%, y: 120%)[\[] \( hat(c) + hat(e) \) k log s + \( log 4 \) k b - F \( delta \) #scale(x: 120%, y: 120%)[\]] . $

The positive $k$-terms in the bracket are the cost of changing the dimension term from $gamma$ to $lambda$ and prescribing $k$ extra trajectories. The coefficient of $k log s$ is

$ hat(c) + hat(e) = c_0 + e_0 = a / 50 . $

Every row of $delta$ is no longer than the $\( p + 1 \)$st row of $lambda$, and likewise for columns. Those two lengths are at most $s \/ \( p + 1 \)$ by the total size of $lambda$. Thus every hook of $delta$ has length at most $2 s \/ \( p + 1 \)$. If $k gt.eq s^(1 - a \/ 2)$, the hook formula and $k ! gt.eq \( k \/ e \)^k$ give

$ F \( delta \) gt.eq k log frac(k \( p + 1 \), 2 e s) gt.eq k (a / 2 log s - log \( 2 e \)) . $

This dominates the bracket’s positive $k$-terms for large $R$, because $a \/ 50 < a \/ 2$ and $b \/ log s lt.eq 1 \/ log R$. If instead $k < s^(1 - a \/ 2)$, discard $- F \( delta \) lt.eq 0$; the bracket is then at most $O \( s^(1 - a \/ 2) log s \)$.

Finally, (17) gives

$ \( hat(c) - c \( s \) \) F \( lambda \) gt.eq frac(s^(1 - a \/ 4), 20 sqrt(log s)) \, #h(2em) s^(9 \/ 10) + s^(1 - a \/ 2) log s = o #h(-0.16667em) (s^(1 - a \/ 4) / sqrt(log s)) . $

For sufficiently large $R$, the dimension reserve therefore absorbs the remaining errors. Since $hat(e) < e \( s \)$, the old hole allowance also improves. This proves (5).

The induction is complete. All scale requirements, including the error absorptions for every $s gt.eq R$, hold after fixing a sufficiently large absolute power of two $R$ after $q$. The final small-real-$z$ interval is obtained by choosing $z_(*) > 0$ for (3), the sparse estimate, and the finite base case.

== 7 Analytic transfer and repeated binary sweeps <sec:analytic>

We now use Theorem 3 with no prescribed paths to bound binary sweeps. Write $K_lambda \( z \)$ for the resulting sweep operator. It is a product of the line averages in (2), hence a matrix polynomial in $z$. All complex parameters below refer to this unconditioned polynomial. Put $a_0 = c_0 \/ \( 2 q \) > 0$. Since $c \( s \) gt.eq c_0$, (5) gives

$ parallel K_lambda \( z \) parallel_(upright("op")) lt.eq parallel K_lambda \( z \) parallel_(2 q) lt.eq D_lambda^(- a_0) #h(2em) \( 0 lt.eq z lt.eq z_(*) \) . $

A second estimate holds on a disk of radius greater than one. For an allowed line size $m$, averaging by $B_m$ in an irreducible representation is a product of orthogonal projections, one for each independent-switch layer. If the product had norm one, finite dimensionality would give a unit vector attaining that norm. Equality through the successive projections would force this vector to be fixed by every switch group. These groups contain the transpositions along all edges of the connected cube and hence generate $S_m$. Thus the norm is strictly less than one in every nontrivial irreducible. Let $kappa < 1$ be the maximum of these norms over the finitely many allowed $m$ and their nontrivial irreducibles.

Restrict $\[ lambda \]$ to a line subgroup $S_m$, and let $P \, Q$ be the averages of $U_m \, B_m$ there. The operator $P$ is the orthogonal projection onto the line invariants, and $P Q = Q P = P$, because uniform averaging absorbs every group element. Relative to $"ran" P xor ker P$,

$ \( 1 - z \) P + z Q = I_("ran" P) xor z thin Q \|_(ker P) \, #h(2em) parallel \( 1 - z \) P + z Q parallel_(upright("op")) lt.eq max { 1 \, \| z \| kappa } . $

Indeed $Q \|_(ker P)$ is a direct sum of the nontrivial line averages, with arbitrary multiplicities, so its norm is at most $kappa$. Choose $r = 2$ if $kappa = 0$, and otherwise choose $1 < r < kappa^(- 1)$. Every line average is then contractive for $\| z \| lt.eq r$. Independence makes each stage average the product of its commuting line averages, and the full operator is the ordered product of the stage averages. Submultiplicativity gives $parallel K_lambda \( z \) parallel_(upright("op")) lt.eq 1$ for $\| z \| lt.eq r$, uniformly in the grid and $lambda$.

To compare this disk bound with the stronger real bound, choose $0 < u < v < min { z_(*) \, 1 \, r - 1 }$ and set $Omega = { z in bb(C) : \| z \| < r } \\ \[ u \, v \]$. For $epsilon_0 > 0$, the function

$ G \( z \) = epsilon_0 integral_u^v log frac(1, \| z - t \|) thin d t $

is harmonic off the segment. Direct integration of the logarithm gives a continuous extension across the segment, including its endpoints. On $\| z \| = r$, the inequality $\| z - t \| gt.eq r - v > 1$ gives $G \( z \) lt.eq 0$. Its values on the closed segment are bounded, so choose $epsilon_0 > 0$ small enough that $G lt.eq 1$ there. Also $G \( 1 \) > 0$, since $0 < 1 - t < 1$ for every $t in \[ u \, v \]$.

Fix unit vectors $u_0 \, v_0$ and put $f \( z \) = u_0^(*) K_lambda \( z \) v_0$. This is a scalar polynomial. We may assume $f equiv.not 0$, since an identically zero coefficient has $\| f \( 1 \) \| = 0$. Then $log \| f \|$ is subharmonic, with value $- oo$ at its zeros. Put $A = a_0 log D_lambda gt.eq 0$. The function $H = log \| f \| + A G$ is subharmonic on $Omega$. The real and disk estimates, together with continuity at the slit, give

$ limsup_(Omega in.rev z arrow.r xi) H \( z \) lt.eq cases(delim: "{", A G \( xi \) lt.eq 0 \, & \| xi \| = r \,, A #scale(x: 120%, y: 120%)[\(] G \( xi \) - 1 #scale(x: 120%, y: 120%)[\)] lt.eq 0 \, & xi in \[ u \, v \] .) $

The second line includes both sides of the slit and its endpoints; if $f \( xi \) = 0$, the logarithm tends to $- oo$. The boundary-limsup maximum principle for subharmonic functions #cite(label("Demailly2012")) Chapter I, Section 4.C.1, Theorem (4.14) gives $H lt.eq 0$ on $Omega$. Since $1 in Omega$, it follows that $log \| f \( 1 \) \| lt.eq - A G \( 1 \)$. Taking the supremum over the two unit vectors yields

#[#set math.equation(numbering: n => "(25)")
 $ parallel K_lambda \( 1 \) parallel_(upright("op")) lt.eq D_lambda^(- g) \, #h(2em) g = a_0 G \( 1 \) > 0 . $ <ac:eq:25>]

The constants $R \, q \, z_(*)$ were fixed in Theorem 3; the choices of $kappa \, r \, u \, v \, epsilon_0$ depend only on them. Thus $g$ is independent of the grid, its number of coordinates, and $lambda$.

It remains to pass from this operator bound to the full permutation law. Let $ell = log_2 R$. For $d gt.eq ell$, write $d = b ell + t$ with $0 lt.eq t < ell$, and split the consecutive bits into one block of $ell + t$ bits and $b - 1$ blocks of $ell$ bits. Their line sizes lie in $\[ R \, R^2 \]$. At $z = 1$, the binary sweeps on disjoint lines within a block can be interleaved by bit direction, so the grid sweep is exactly $B_N$ for $N = 2^d$. Its sign coefficient is zero: the sign of any one fair switch is independent of the remaining switches and has mean zero.

For $mu_w = B_N^(* w)$, the convolution convention in Section 2 gives $hat(mu)_w \( lambda \) = K_lambda \( 1 \)^w$. The classical finite-group Fourier argument of Diaconis and Shahshahani #cite(label("DiaconisShahshahani1981")) Section 2, Lemma 2, and the proof of Lemma 14 combines Cauchy–Schwarz with matrix Plancherel to give

$ parallel mu_w - U_N parallel_(upright("TV"))^2 lt.eq 1 / 4 sum_(lambda eq.not \( N \)) D_lambda thin parallel K_lambda \( 1 \)^w parallel_2^2 lt.eq 1 / 4 sum_(lambda in.not { \( N \) \, \( 1^N \) }) D_lambda^(thin 2 - 2 g w) . $

The second inequality uses the sign cancellation and $parallel K_lambda \( 1 \)^w parallel_2^2 lt.eq D_lambda parallel K_lambda \( 1 \) parallel_(upright("op"))^(2 w)$. A deterministic initial deck translates $mu_w$ and leaves its distance from uniform unchanged.

Put $beta = 2 g w - 2$ and $k \( lambda \) = min \( N - lambda_1 \, N - lambda'_1 \)$. For a fixed $1 lt.eq k lt.eq N \/ 3$, a diagram with $k \( lambda \) = k$ has first row $N - k$ after transposing if necessary; its remaining $k$ boxes form a partition of $k$. There are therefore at most $2 dot.op 2^k$ such diagrams, and (1) gives $D_lambda gt.eq e^(- 1) \( N \/ k \)^k$. For $k > N \/ 3$ and sufficiently large $N$, Section 2 gives $log D_lambda gt.eq c_(upright("dim")) N$, and there are at most $2^N$ partitions of $N$. Consequently, for $beta > 0$ and sufficiently large $N$,

$ sum_(lambda tack.r N\
1 lt.eq k \( lambda \) lt.eq N \/ 3) D_lambda^(- beta) & lt.eq 2 e^beta sum_(k = 1)^(floor.l N \/ 3 floor.r) #scale(x: 120%, y: 120%)[\[] 2 \( k \/ N \)^beta #scale(x: 120%, y: 120%)[\]]^k \,\
sum_(lambda tack.r N\
k \( lambda \) > N \/ 3) D_lambda^(- beta) & lt.eq exp #scale(x: 120%, y: 120%)[\(] \( log 2 - beta c_(upright("dim")) \) N #scale(x: 120%, y: 120%)[\)] . $

For each fixed $k$, the summand in the first bound tends to zero, and it is at most $\( 2 dot.op 3^(- beta) \)^k$ throughout its range. Thus the first sum tends to zero when $beta > log 2 \/ log 3$, by domination by a summable geometric sequence. The second tends to zero when $beta c_(upright("dim")) > log 2$. Choose an absolute integer $w$ so that $beta = 2 g w - 2 > max { log 2 \/ log 3 \, log 2 \/ c_(upright("dim")) }$. The total variation distance then tends to zero as $d arrow.r oo$, uniformly over deterministic initial decks.

One binary sweep is exactly $d$ physical Thorp shuffles, as shown in the introduction. Hence the distance is at most $1 \/ 4$ after $w d$ physical steps for all sufficiently large $d$, giving $t_(upright("mix")) \( d \) = O \( d \)$. Proposition 2 gives $t_(upright("mix")) \( d \) gt.eq 2 d - O \( 1 \)$, so the mixing time has the optimal order $Theta \( d \)$.


#bibliography("refs.bib", style: "ieee", title: [References])
