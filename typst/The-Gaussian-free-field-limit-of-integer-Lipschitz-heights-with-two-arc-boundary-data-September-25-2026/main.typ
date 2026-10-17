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

#align(center)[#text(size: 16pt, weight: "bold")[The Gaussian free field limit of integer Lipschitz heights with two-arc boundary data]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Uniform Lipschitz heights are among the simplest random surface models with a hard local constraint. Their planar fluctuations are expected to be governed by the Gaussian free field. We prove this for integer heights on the triangular lattice with the two-arc boundary condition proposed by Schramm. The conclusion concerns the field, including all joint test-function limits and distributional tightness.

=== 1.1 The model and the limit <the-model-and-the-limit>

Write

$ bb(T) = bb(Z) \( 1 \, 0 \) + bb(Z) \( 1 \/ 2 \, sqrt(3) \/ 2 \) $

for the unit triangular lattice. Let $D subset bb(R)^2$ be bounded, smooth, and simply connected, and let $a \, b$ be distinct points of $partial D$. They divide the boundary into open arcs $A_(+)$ and $A_(-)$. For $delta arrow.b 0$, let $D_delta$ be simply connected polygonal domains made of triangles of $delta bb(T)$, whose marked boundary parametrizations converge uniformly to that of $\( D \, a \, b \)$. Put the discrete marks at the midpoints of distinct boundary edges. The boundary vertices then split into disjoint sets $A_(+ \, delta)$ and $A_(- \, delta)$; no vertex receives two prescriptions.

Choose $h_delta$ uniformly among the odd integer functions on the vertices of $D_delta$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ h_delta = 1 upright(" on ") A_(+ \, delta) \, #h(2em) h_delta = - 1 upright(" on ") A_(- \, delta) \, #h(2em) \| h_delta \( x \) - h_delta \( y \) \| in { 0 \, 2 } quad \( x tilde.op y \) . $ <eq:odd-model>]

Extend the function affinely on every triangle. For a test function $f in C_c^oo \( D \)$, write $h_delta \( f \) = integral h_delta \( x \) f \( x \) thin d x$ once its support lies in $D_delta$. This convention is used for every smeared height below.

Our Dirichlet Gaussian free field $Phi_D$ has covariance

#[#set math.equation(numbering: n => "(1.2)")
 $ bb(E) \[ Phi_D \( f \) Phi_D \( g \) \] = integral.double_(D times D) f \( x \) G_D \( x \, y \) g \( y \) thin d x thin d y \, #h(2em) G_D = \( - Delta_D \)^(- 1) . $ <eq:gff-convention>]

In particular, the logarithmic singularity of $G_D \( x \, y \)$ is $\( 2 pi \)^(- 1) log \( 1 \/ \| x - y \| \)$. Let $macron(g)$ be the bounded harmonic extension of the boundary data $+ 1$ on $A_(+)$ and $- 1$ on $A_(-)$.

#thm([Theorem 1.1.])[
  #emph[Let $D$ be a bounded smooth simply connected planar domain with two distinct marked boundary points. Let $D_delta$ be simply connected triangular-lattice polygonal approximations with uniformly converging marked boundary parametrizations and edge-midpoint marks, and let $h_delta$ have the uniform odd-height law (1.1). There is a constant $sigma > 0$, depending only on the unit triangular-lattice model, such that 
$ h_delta med arrow.r.double med macron(g) + sigma Phi_D #h(2em) upright("in ") cal(D)' \( D \) . $

 For every $f in C_c^oo \( D \)$, $bb(E) h_delta \( f \) arrow.r integral_D macron(g) f$. Consequently 
#[#set math.equation(numbering: n => "(1.3)")
 $ frac(h_delta - bb(E) h_delta, sigma) med arrow.r.double med Phi_D #h(2em) upright("in ") cal(D)' \( D \) . $ <eq:main-centered>]

 All finite vectors of test-function integrals converge jointly to the corresponding Gaussian vectors, and all their mixed moments converge. The constant is specified by the absolutely convergent finite-volume series in 29; in the spectral convention below, $sigma = 4 pi sqrt(c_(*))$.]
] <thm:main>

It is convenient to prove the theorem for

#[#set math.equation(numbering: n => "(1.4)")
 $ H_delta = \( h_delta - 1 \) \/ 2 \, #h(2em) g = 0 upright(" on ") A_(+) \, quad g = - 1 upright(" on ") A_(-) . $ <eq:integer-height>]

Thus $H_delta$ is integer valued and $\| H_delta \( x \) - H_delta \( y \) \| lt.eq 1$ on edges. Write $m$ for the bounded harmonic extension of $g$, so $macron(g) = 1 + 2 m$. We will show that $H_delta$ converges to $m + sqrt(v) thin Phi_D$, where

#[#set math.equation(numbering: n => "(1.5)")
 $ v = \( 2 pi \)^2 c_(*) \, #h(2em) sigma^2 = 4 v . $ <eq:normalization-relations>]

There is no logarithmic rescaling of the distribution-valued field. The logarithmic divergence of point fluctuations is consistent with a finite limit after smooth spatial averaging.

=== 1.2 History and significance <history-and-significance>

Schramm’s 2006 problem collection asks about the scaling limits of this height function and its zero interface #cite(label("Schramm2007")) Problem 2.2, p. 527. 1 resolves the field part of that problem for smooth simply connected domains, with the covariance convention made explicit in (1.2). The interface assertion is a separate question. The real-valued Lipschitz model in Schramm’s Problem 2.3, p. 528, is also distinct from the integer model studied here.

Glazman and Manolescu proved logarithmic fluctuations for the uniform integer Lipschitz model and developed a two-spin representation with positive association and scale estimates for loops #cite(label("GM2021")). Those estimates are the probabilistic starting point of this paper. Glazman and Lammers subsequently proved delocalisation across a larger parameter range and quantified it logarithmically. Their 2025 article discusses the Gaussian free field limit as a conjecture #cite(label("GL2025")) Section 1.2.4. Logarithmic fluctuations alone do not determine a Gaussian scaling limit. The additional work here is to obtain comparisons under rare pinning, identify the covariance, control the imposed boundary values, and determine all joint moments.

For real-valued gradient fields with smooth uniformly convex interactions, Miller proved a bounded-domain GFF limit with continuous perturbations of affine boundary data #cite(label("Miller2011")) Theorem 1.1. The integer-valued law studied here, with its hard constraint on every edge increment, lies outside those hypotheses.

Besides the loop estimates, we use the discrete midpoint Prékopa–Leindler inequality of Klartag–Lehec #cite(label("KlartagLehec2019")) Theorem 1.4, in the nonnegative-function form of Gozlan–Roberto–Samson–Tetali #cite(label("GRST2019")) Theorem 3. Its role is to turn central probability estimates into uniform higher moments. The rounding and parity conditions needed for this application are verified in 4.

Reflection positivity is a classical method for converting spatial symmetry and positivity into spectral information #cite(label("FILS1978")). The reflection quotient and positive transfer used here are closely related to the constructions in #cite(label("Usui2012")) Sections 3.1–3.3 and 4.1. We establish their exact site-row and auxiliary-phase versions directly. The final moment argument has a related predecessor in Kenyon’s identification of dimer height moments by matching collision poles in a determinant pairing identity #cite(label("Kenyon2001")) Lemma 3.1 and Proposition 3.2; here the collision coefficients come from local cut mixing rather than a determinant formula.

Duminil-Copin–Kozlowski–Lammers–Manolescu prove a full-plane GFF limit for the zero-slope square-lattice six-vertex state with $a = b = 1$ and $c in \[ sqrt(3) \, 2 \]$ #cite(label("DCKLM2026")) Theorems 2.2 and 2.8. Their transfer representations, analytic translation arguments, harmonic correlations and collision analysis are substantial methodological precedents #cite(label("DCKLM2026")) Theorems 4.12 and 4.15; Sections 7–9. The argument below uses triangular site reflections and a finite-rotation angular sum to determine the plane covariance. Separated rare pins and boundary attachments then connect this information to the actual two-arc bounded-domain law. The normalization is specified by finite counts and Fourier coefficients in 6.

For comparison, the prescribed iterated balanced-torus limit of the square-lattice six-vertex model with $a = b = 1$ gives a balanced zero-slope plane state with a GFF scaling limit for each fixed $0 < c lt.eq 2$ #cite(label("OpenAIBalancedSixVertex2026")) Theorem 1.1. This plane-state result does not identify the present two-arc triangular-lattice law or its normalization.

A companion article proves the GFF limit for weighted integer Lipschitz heights with zero boundary, for each fixed edge weight $x in \[ 1 \/ sqrt(2) \, 1 \]$ #cite(label("OpenAIWeighted2026")) Theorem 1.2. Its weighted conditional laws and moment estimates are proved there. The present two-arc boundary theorem and normalization series are retained separately; neither field theorem is used as a premise for the other.

=== 1.3 Proof strategy <proof-strategy>

The main task is to identify every subsequential limit $H$ of the integer height field. A key intermediate conclusion is

#[#set math.equation(numbering: n => "(1.6)")
 $ bb(E) [H \( Delta phi.alt \) product_(i = 1)^q H \( f_i \)] = 0 \, $ <eq:strategy-harmonicity>]

for smooth compactly supported tests $phi.alt \, f_1 \, dots.h \, f_q$ in $D$ with pairwise disjoint supports, including $q = 0$. This says that the moment distributions are harmonic in each variable away from collisions. Boundary traces and the singularities at collisions will then determine those moments. The difficulty is to obtain this identity for absolute heights: reflection positivity first gives a plane identity, and moving pins initially permits only observations of local height differences.

===== 1.3.1 A spectral identity from reflection positivity. <a-spectral-identity-from-reflection-positivity.>

The height gradient has a stationary plane limit. Reflection through rows of lattice sites gives a positive normal transfer operator. Its spectral representation expresses the covariance as a mixture of Cauchy kernels in the normal frequency. The fourth angular harmonic averages to zero under the six lattice rotations, whereas its Cauchy average is nonnegative up to a summable lattice error. Comparing the two gives an integrable nonnegative dispersion defect. This forces every small-frequency limit to have density $c_(*) \/ \| p \|^2$, and a signed angular sum determines $c_(*)$ uniquely. For a test $phi.alt$ supported on one side of a reflection line, the covariance formula makes the covariance of the height average against $Delta phi.alt$ with its reflected copy tend to zero. This is the reflection-null identity; it does not assert that the ordinary variance vanishes. The signed angular sum also gives the finite-volume normalization formula in 6. The spectral argument uses positivity and the additional rotation directions rather than an explicit solution of the model.

===== 1.3.2 Moving rare pins and recovering the boundary. <moving-rare-pins-and-recovering-the-boundary.>

We encode the height modulo four by two spins taking values $plus.minus 1$ at each vertex; boundary pins prescribe these signs. Boundary pins surround a typical interior insertion, so they cannot all initially lie behind one reflection line. We open short gaps inside boundary windows on which only one of the two spins is pinned. A multiplicative comparison for separated pinning events controls the resulting reflection norms even when the pin events are rare. Positive transfer powers permit analytic continuation of translations in several lattice-normal directions, adapting the method of #cite(label("DCKLM2026")) Section 7.1. This moves the pins past the reflection-null insertion while preserving its limiting identity against observations of local height differences. Circuits carrying the prescribed spin sign then close the gaps and force the disconnected pin arcs to use one common height offset.

To recover the original boundary condition, we prove height-path estimates at a constant boundary arc. The key attachment estimate derives an open level-line connection from a synthetic mean comparison, with explicit stopping rules that preserve the Gibbs law in the unexamined region. The estimate survives the small boundary pieces created when windows are removed behind additional arches. It identifies the harmonic mean and supplies deterministic boundary reference averages.

===== 1.3.3 Harmonic moments and Gaussianity. <harmonic-moments-and-gaussianity.>

Averaging near distinct points of one constant boundary arc gives its prescribed value in the limit, with depths sent to zero before the number of points increases. These reference averages fix the additive constant left undetermined by local height differences and yield (1.6) for absolute observations. The resulting moment functions have only logarithmic collision singularities. Local cut mixing and the plane covariance determine each singular coefficient. Subtracting the associated Green functions gives the Gaussian moment recursion. Uniform moment bounds supply both tightness and the passage from moment identities to the centered distributional limit.

=== 1.4 Conventions and limit order <conventions-and-limit-order>

The symbols $C \, c \, alpha$ denote positive constants, whose values may change between occurrences. Dependence on a fixed finite macroscopic arrangement is allowed when stated. A normalized test at radius $r$ is supported in a ball of radius $r$ and has size $O \( r^(- 2) \)$; a zero-total test has integral zero. The Euclidean Fourier convention is $hat(f) \( p \) = integral e^(- i p dot.op x) f \( x \) thin d x$.

All arguments with prescribed boxes, collars, or tubes first fix their positive widths and send the lattice mesh to zero. Later limits that shrink windows, refine grids, or approach the boundary are taken only after this mesh limit. In particular, a lower bound depending on a fixed aspect ratio is never used as a uniform bound for a degenerating shape. When comparison curves are random, the specified exploration is stopped before inspecting the region whose conditional law is used.

The proof follows this order. Section 2, Section 3, Section 4 establish the spin tools, conditional cuts, and moments. Section 5, Section 6 identify the plane covariance and its coefficient. Section 7, Section 8 transfer the reflection identity and prove the boundary estimate. Section 9, Section 10 identify all subsequential limits and complete the proof of 1.

== 2 Heights, two spins, and exact cuts <sec:spin>

Our first objective is to replace the height constraint by a finite spin law whose conditional distributions can be read exactly. The loop description will connect this law to the scale estimates in 3; the one-color cuts will remain available when rare boundary pins are imposed later. We use the coherent-pair and double-path framework of Glazman–Manolescu #cite(label("GM2021")) Proposition 1.4 and Sections 2.1–2.3, and establish the versions with equality constraints and stopping cuts needed below.

We use lattice units in the discrete arguments. A finite triangular domain is a finite, simply connected triangular cell complex, with its vertex and edge sets understood. A polygonal boundary, or a separating lattice curve, includes the adjacent fixed vertices when a Gibbs interior is taken. In particular, a free vertex has its full incident star up to fixed boundary vertices. This convention avoids an additional interaction across the boundary of a conditional problem.

Write $H = \( h - 1 \) \/ 2$. Thus $H$ is integer-valued and $lr(|H \( x \) - H \( y \)|) lt.eq 1$ on each edge. Associate two spins to a height by

#[#set math.equation(numbering: n => "(2.1)")
 $ B = + 1 quad upright("on residues ") 0 \, 1 \, #h(2em) W = + 1 quad upright("on residues ") - 1 \, 0 med \( mod med 4 \) . $ <eq:gray-code>]

A pair $\( B \, W \)$ is #emph[coherent] if the two spins never both change across one edge. A free spin law means uniform counting of coherent pairs, without boundary conditions.

#thm([Lemma 2.1.])[
  (The lift and the loop representation).  #emph[On a simply connected triangular domain, a coherent pair determines integer height increments 
#[#set math.equation(numbering: n => "(2.2)")
 $ d H \( x \, y \) = frac(W_x B_y - B_x W_y, 2) . $ <eq:height-increment>]

 They have zero curl. Fixing the height at one vertex gives a bijection between coherent pairs whose Gray state there matches that prescribed integer and admissible heights with that value. Uniform counting has the height Gibbs property.]
  #emph[With a constant boundary height, the nonzero height steps form disjoint closed honeycomb loops. Conditional on their geometry, the inward jumps are independent fair signs; the unoriented loop weight is $2^(\# upright("loops"))$. The same conclusion holds in a bounded face of a connected skeleton of fixed lattice edges carrying one constant height.]
] <lem:gray>

#proof[
  The four Gray states, in increasing residue order, are $\( + \, + \) \, \( + \, - \) \, \( - \, - \) \, \( - \, + \)$. Inspection of consecutive states gives (2.2). On a triangle, if $B$ is not constant, it changes on two incident edges; coherence forces $W$ to be constant on all three vertices. Interchanging the colors gives the alternative case. The sum of (2.2) around that triangle is therefore zero. Every closed path is generated by triangle boundaries, proving path independence and the asserted bijection. Given a separating height trace, all compatible interiors have the same weight, which proves the Gibbs assertion.
  A triangle has either no nonzero step or two nonzero steps. In the latter case its three heights take two consecutive values, so the two associated dual edges join into one contour separating those same levels. Contours cannot branch. A constant boundary has no contour endpoints, and each loop may independently be assigned an inward jump $+ 1$ or $- 1$. Summing these jumps from the boundary constructs the inverse height configuration. Thus every unoriented loop configuration has exactly $2^(\# upright("loops"))$ compatible orientations. A loop in a bounded complementary face cannot enclose only part of a connected fixed skeleton: a path in the skeleton from that part to the rest would cross the loop. The same construction consequently applies in such a face. ◻
]

The spin comparison must tolerate more than constant boundary conditions. In a finite free domain let $E_0$ be any set of edges on which $W$ is required to be constant, and prescribe arbitrary $B$ values on an arbitrary vertex set. Write $mu^(E_0 \, eta)$ for this constrained pair law. An empty set of $B$ prescriptions is allowed. These constraints are always feasible: take $W$ constant and then assign $B$ arbitrarily.

#thm([Lemma 2.2.])[
  (Spin FKG with equality constraints).  #emph[The $B$ marginal of $mu^(E_0 \, eta)$ satisfies the FKG lattice condition. The assertion remains true after any further $B$ pinnings. In particular, fixing additional $B$ spins to $+ 1$ increases increasing events, and fixing them to $- 1$ decreases such events.]
  #emph[Conditional on $B$, the spin $W$ consists of independent fair signs on the components of the graph generated by $E_0$ and the $B$-changing edges.]
] <lem:spin-fkg>

#proof[
  Encode a $W$ wall by a binary variable on each edge. Such variables are the differences of vertex signs if and only if their sum around every triangle is zero over $bb(F)_2$. Simple connectivity makes these triangle equations sufficient; each solution has two vertex lifts. Coherence and $E_0$ require the wall variable to vanish except on equal-$B$ edges outside $E_0$.
  Let $A$ be the fixed triangle–edge incidence matrix over $bb(F)_2$. For a set $F$ of allowed columns put $n \( F \) = lr(||) F - "rank" \( A_F \)$. This nullity is increasing and supermodular. Indeed, adding one column increases rank by at most one, and submodularity of matrix rank gives
  $ n \( F ∩ G \) + n \( F union G \) gt.eq n \( F \) + n \( G \) . $
  Let $F_(+) \( B \)$ and $F_(-) \( B \)$ be the allowed edges whose two $B$ endpoints are respectively $+ 1$ and $- 1$. A triangle cannot contain both a $+ +$ edge and a $- -$ edge. Its parity equations thus split into two disjoint systems, and the number of compatible $W$ configurations is
  #[#set math.equation(numbering: n => "(2.3)")
   $ w \( B \) = 2^(1 + n \( F_(+) \( B \) \) + n \( F_(-) \( B \) \)) . $ <eq:spin-nullity-weight>]
  For the plus edge set,
  $ F_(+) \( B and B' \) = F_(+) \( B \) ∩ F_(+) \( B' \) \, #h(2em) F_(+) \( B or B' \) supset.eq F_(+) \( B \) union F_(+) \( B' \) . $
  Monotonicity and supermodularity of $n$ give its contribution to $w \( B and B' \) w \( B or B' \) gt.eq w \( B \) w \( B' \)$. For the minus edge set the same argument has meet and join interchanged. Multiplication proves the lattice condition. An indicator of fixed coordinate values preserves this condition, including when one of the compared weights is zero. The standard FKG conditional comparison gives the stated monotonicity.
  Alternatively describing $W$ by its vertices, coherence forces equality exactly across $B$-changing edges, in addition to the equalities in $E_0$. There are no other restrictions. Uniform counting gives one independent fair sign per resulting component. ◻
]

We also need association and boundary comparison for heights. Coordinatewise minimum and maximum of two integer Lipschitz functions are integer Lipschitz. If their boundary values are ordered, sorting by minimum and maximum preserves the respective boundary conditions. This is the finite-lattice setting of Fortuin–Kasteleyn–Ginibre #cite(label("FKG1971")). A fixed boundary or anchor bounds every height by graph distance, so the height coordinates lie in finite chains.

The following finite-state argument proves height association and monotonicity in the boundary values, as well as the spin comparison consequences of 3. Update one unfixed coordinate at a time by its conditional quantile, using independent uniforms and a deterministic cyclic schedule. For heights its conditional support is the integer interval

$ \[ max_(w tilde.op v) H \( w \) - 1 \, med min_(w tilde.op v) H \( w \) + 1 \] \, $

intersected with the fixed coordinate bounds; both endpoints are increasing in the neighboring heights. For the first spin the lattice condition makes its conditional plus probability increasing in all other unfixed spins. Thus each update is increasing in the current configuration and in its uniform random variable. Starting from the least feasible configuration, each finite sequence of updates is an increasing function of independent variables and hence is positively associated, by the one-dimensional Chebyshev inequality and induction on the independent coordinates. The same uniforms couple ordered boundary prescriptions in their indicated order.

These finite chains converge to their counting laws. The spin marginal is positive on every assignment of the unpinned first-color spins, because a constant second color is always coherent. For heights, any configuration can be decreased to the coordinatewise minimum with a second one: lower a discrepant vertex of largest current height by one. A higher neighbor already at its target would contradict the target’s Lipschitz condition, so this move is feasible. Repeating and reversing the corresponding moves for the second configuration proves irreducibility. Each single-coordinate conditional law has a positive holding probability. A cyclic sweep therefore gives an irreducible aperiodic chain preserving the desired law. Passing to its stationary limit proves association and the ordered couplings, including the specified first-color pinnings and second-color equalities.

#prodef([Definition 2.3.])[
  (Double paths).  A dual edge is #emph[double-$B$ of sign $t$] if the two primal endpoints of the crossed edge both have $B = t$. A double path or circuit uses only such edges, with one fixed sign throughout. The analogous terminology applies with the colors interchanged.
]

#thm([Lemma 2.4.])[
  (Exact cut law).  #emph[Let $C$ be a simple double-$B$ circuit of sign $t$. Suppose that no edge of $E_0$ crosses $C$. Conditional on the exterior pair configuration and on the $B = t$ values on the inner boundary layer of $C$, the interior law is the uniform coherent-pair law with that $B$ boundary layer, free $W$ boundary values, and just the constraints situated inside $C$.]
  #emph[This assertion also holds for a circuit selected by a stopping exploration which reveals only exterior $B$ spins and the $B = t$ cut sites. No $W$ spins need be revealed during that exploration. Along the inner boundary face chain, a height lift takes values in one pair of consecutive integers.]
] <lem:double-cut>

#proof[
  Every interaction crossing $C$ is on an edge with $B$ equal at both endpoints. Coherence places no restriction on $W$ across such an edge, and the hypothesis excludes an $E_0$ equality there. Once the cut $B$ values are fixed, the counting weight therefore factors into an exterior factor and the stated interior factor. Fixed constraints inside and outside occur in their respective factors.
  For the stopping version, explore from the designated exterior side through primal edges not blocked by a good dual edge, querying the two endpoint $B$ values when needed. If a surrounding double circuit exists in the search collar, this exploration cannot pass it. The separating boundary contains a simple double circuit. The queried sites on its inner side are only its good cut sites; bounded pockets may be filled on the already explored side. Thus, conditional on the exploration record, the same factorization applies. This is a finite exploration statement, so it also applies after arbitrary exterior conditioning of the allowed type.
  At a dual vertex of a double path, its two used edges force all three adjacent $B$ spins to equal $t$. The inner face sites of a double circuit therefore form a connected constant-$B$ chain. The two residues with this $B$ value are consecutive. An integer Lipschitz lift along a connected constant-$B$ chain stays in one translated copy of that pair, proving the last assertion. ◻
]

We shall impose $W = + 1$ along a bounded number of connected paths. It is useful to separate their equality constraints from their labels. First put their edges in $E_0$. Conditional on $B$, each path then has one component label. If there are $m$ paths, the conditional probability of all labels being $+ 1$ lies between $2^(- m)$ and $1$. If there is just one connected path, this probability is exactly $1 \/ 2$, independently of $B$; requiring its plus label does not change the $B$ marginal. We will always account for these labels after an argument involving the $B$ marginal.

== 3 Buffered circuits, mixing, and rare pins <sec:cuts>

This section converts two loop estimates into the conditional comparisons needed throughout the proof. The progression is from a circuit under an extreme one-color boundary condition, to circuits in fixed geometric buffers, to a plane law and multiplicative estimates for rare pins. At each step the selected cut leaves its strict interior unexamined.

We first fix the geometry of the loop estimates imported from the literature. Let $bb(H) = bb(T)^(*)$ be the honeycomb lattice. Its hexagonal faces are identified with the height vertices of $bb(T)$; face distance means graph distance in $bb(T)$. For a center face $x$, let $Gamma_n \( x \)$ be the outer honeycomb contour of the union of closed faces at distance at most $n$ from $x$. Let $Lambda_n \( x \)$ be the honeycomb domain strictly inside that contour, excluding its vertices and edges, and write $Lambda_n$ when $x = 0$. These are face balls in the honeycomb lattice, not balls of elementary triangular faces.

The #emph[graph inradius] of a simple contour surrounding $x$ is the largest integer $n$ for which $Lambda_n \( x \)$ and its bounding contour lie strictly inside it. This differs by a universal additive constant from the minimum graph distance to a face incident to the contour: the smaller connected face balls cannot cross the contour, and the next incident face layer reaches it. Edge, vertex, and integer-rounding conventions change only this bounded offset.

Glazman–Manolescu #cite(label("GM2021")) Theorem 1.2(iv), equations (1.1)–(1.2) prove the following facts for the loop $O \( 2 \)$ model with edge weight one and empty exterior condition:

+ A domain containing $Lambda_(2 n)$ has probability at least $c_0 > 0$ of a loop contained in $Lambda_(2 n)$ and surrounding $Lambda_n$.
+ There are $0 < rho < 1$ and $c_0 > 0$ such that, if the graph inradius about the center face is $n$, the probability of two loops surrounding $Lambda_(rho n)$ is at most $1 - c_0$.

All radii in these estimates use the face-graph convention just defined. The estimates are uniform for sufficiently large integer radii. The source’s contour-distance convention differs by a bounded additive offset; choose $rho$ slightly larger than its upper-bound constant, still below one, to absorb that offset and target-ball rounding for all large radii. No comparison with Euclidean distance is used in this adjustment. The domains are interiors of simple honeycomb contours: loops are strictly inside the contour and do not use its vertices. When we use the second estimate in a more general height domain, we first expose an enclosing level loop; its interior has exactly this empty-exterior law by 2.

#thm([Lemma 3.1.])[
  (A circuit under the opposite cut condition).  #emph[There are fixed $K < oo$ and $c > 0$ with the following property. Inside a regular dual cut of radius $K n$, fix $B = - t$ on the inner boundary layer and leave $W$ free. With probability at least $c$, there is a double-$B$ circuit of sign $t$ between radii $n$ and $2 n$. The constants are independent of $n$, for all sufficiently large $n$.]
] <lem:worst-cut>

#proof[
  It is enough to take $t = + 1$. In a larger auxiliary flat height domain, choose the constant boundary residue uniformly from the four Gray residues. Require enclosing loops in three separated annuli, with the inner annulus $Lambda_(2 n) \\ Lambda_n$, and with the outer annulus still strictly inside the prospective deterministic cut. For example, annuli at radii $n$, $4 n$, and $16 n$ fit inside a cut of a fixed sufficiently large multiple of $n$.
  To bound the probability, find an outer qualifying loop from the exterior and then repeat inside it. Each remaining target annulus is contained with its required buffer in the free interior left by the preceding loop. The lower loop estimate and 2 give a probability at least $c_0^3$ for the three-loop event.
  Conditional on all loop geometry, list the enclosing loops in order. Their jump signs are independent fair coins. At any height residue, the two possible jumps flip different spin colors. Thus the sequence of flipped colors is also a sequence of independent fair choices, conditional on the initial height parity. The initial $B$ sign is fair independently of that parity. There is consequently a fixed positive conditional probability that an outer selected loop flips $W$ with unchanged $B = - 1$ and that an inner selected loop flips $W$ with unchanged $B = + 1$. An intervening selected loop supplies a free color choice to set the parity of the intervening $B$ flips. Additional intervening loops do not reduce this bound: condition on their color choices first. A loop that flips $W$ is itself a double-$B$ circuit of the unchanged $B$ sign.
  Let $A$ be the desired inner plus-circuit event, and search from the exterior for a minus double circuit $C$ in the outer annulus. The construction just given yields $bb(P) \( C upright(" is found") \, A \) gt.eq c_1 > 0$. The stopping cut law says that, conditional on this search, the interior is the free-$W$, minus-$B$ cut law inside $C$. Write its probability of $A$ as $q_C$.
  In the deterministic farther minus-cut law, condition additionally on $B = - 1$ on both layers of this fixed realized $C$. Since $A$ is increasing, 3 says that this conditioning can only decrease its probability. By 5, the resulting inner probability is $q_C$. If $q$ is the desired probability in the deterministic cut law, then $q gt.eq q_C$ for every such $C$. Integrating over the auxiliary stopping search gives $q gt.eq c_1$, as required. ◻
]

For clarity, a #emph[buffer] below means an open neighborhood in which the local annuli, together with their larger worst-condition cuts, fit with positive clearance. Thus an obstacle can lie in the hole of a collar without lying in the buffers used to construct the collar circuit. We distinguish these local buffers from the entire disk bounded by the eventual circuit.

#thm([Lemma 3.2.])[
  (Circuits in buffers).  #emph[Consider a fixed positive-width polygonal collar, or a fixed positive-width tube following a polygonal arc. Suppose it has a buffer disjoint from $E_0$ and from all prescribed $B$ spins. At sufficiently fine mesh, conditional on arbitrary $B$ values away from the buffer, there is a probability at least $c > 0$ of a double-$B$ circuit around the collar’s hole, or a connected double-$B$ path following the tube, of either specified sign. For a sign-$t$ event, arbitrary additional $B = t$ pins in the buffer are allowed. The constant depends on the fixed geometry, not on the mesh, the number of pins elsewhere, or their values.]
  #emph[Finitely many separated such requirements have a uniformly positive joint probability, even if different buffers request different signs. For a logarithmic stack of separated similar annular buffers between radii $r$ and $L$, the probability that no circuit of a prescribed sign occurs is at most 
#[#set math.equation(numbering: n => "(3.1)")
 $ C \( r \/ L \)^alpha $ <eq:stack-failure>]

 for some $alpha > 0$. In lattice units this holds uniformly for $L gt.double r gt.eq 1$, after adjustment of $C$.]
] <lem:buffer-circuits>

#proof[
  First consider a small regular annulus whose larger cut lies in the buffer. Delete any favorable pins in that cut. This can only lower the probability of the desired event in the order toward $t$. Fix the opposite sign on both sides of the larger deterministic cut. FKG lowers the desired probability again, and the exact cut law identifies the remaining problem with 6. This gives a uniform local lower bound under every allowed exterior conditioning.
  We explain the geometric gluing, including why a thin collar requires no stronger imported loop estimate. Cover the center curve of the tube or collar by finitely many small regular annuli. Choose their common inner radius much smaller than the tube width. Consecutive centers may be separated by, for example, $3 \/ 2$ times that radius in the graph-distance norm. Their inner balls intersect, and each inner ball protrudes beyond the other’s outer ball. Two surrounding circuits in these annuli must therefore intersect: disjoint Jordan curves would have disjoint interiors or nested interiors, and the two geometric conditions exclude these possibilities. Their union is connected and follows the prescribed tube. Around a closed center curve, its outer boundary contains a simple circuit enclosing the hole; the annuli are small enough that their union does not fill that hole. At a common dual vertex, double paths of the same sign have all three adjacent spin sites of that sign, so the gluing does not lose the double-path property. Bounded lattice rounding is absorbed by the positive geometric clearances.
  All the small annulus events for one sign are increasing in the same order. FKG multiplies their local lower bounds, giving a positive constant depending only on the finite cover. For separated buffers, condition successively on the configurations outside the next buffer; the preceding lower bound applies under each such conditioning. This also permits different signs in different buffers.
  Finally choose a fixed scale ratio large enough that the enlarged buffers of successive annular slots are disjoint. There are at least $c_2 log \( L \/ r \) - C_2$ slots. At each trial, conditional on the previously examined slots, success has probability at least $c_3 > 0$. Failure in all slots has probability at most $\( 1 - c_3 \)^(c_2 log \( L \/ r \) - C_2)$, which is (3.1). The finitely many bounded lattice scales can be absorbed in its prefactor. ◻
]

We record the coupling mechanism behind our use of these circuits. Take two pair laws whose domains contain a large ball, with no constraints there. On a slightly smaller deterministic dual cut, compare each $B$ marginal with the law having minus fixed on both boundary layers. Exact cutting makes this lower interior law common to both comparisons.

Run the exterior exploration of 5 in the lower law, querying the same sites in the other two laws. At every stage retain, for each marginal, its conditional law given its own queried values. If these values are ordered, conditional FKG orders the next site’s plus probabilities: fixing the outer minus layer and then lowering the queried values can only decrease that probability. A fresh uniform random variable therefore samples all three next spins in their required order. The next query depends only on the revealed record, so this recursive conditional sampling preserves each marginal.

Stop when the lower configuration has a plus double circuit. Its cut sites are plus in all three configurations. The exploration has queried only their exterior and these cut sites, so their remaining conditional interior laws coincide. Fill that interior identically. Sample $W$ only after this $B$ exploration; its components are free across the cut and can also be matched. The construction allows arbitrary constraints outside the large ball, including $E_0$ equalities there.

The same construction compares a law with one obtained by adding extreme $B$ pins in a small region. Explore outward from that region in the more adverse configuration. A double circuit of the added sign matches the configurations on the far side. This version will be used when filling small gaps in a pin curve.

#thm([Proposition 3.3.])[
  (Plane law and quantitative local comparison).  #emph[Free coherent pairs in expanding regular hexagons converge on cylinder events to a law $mu_oo$. This law is invariant under lattice translations, lattice symmetries, global sign changes, and interchange of the colors. If the domain of a finite pair law $mu^(E_0 \, eta)$ contains a ball of radius $L$ and has no constraints in that ball, then its restriction to a concentric ball of radius $r$ differs from that of $mu_oo$ in total variation by at most $C \( r \/ L \)^alpha$, for $L gt.double r gt.eq 1$.]
  #emph[The associated plane height increments exist and have the same spatial symmetries. Every finite feasible prescription of $B$ pins together with $W = + 1$ on finitely many connected paths has positive plane probability.]
] <prop:plane-mixing>

#proof[
  Apply the preceding common-lower-law coupling and search for a plus circuit in a stack between the inner ball and the deterministic outer cut. Its failure probability is bounded by (3.1). On success the full pair configurations agree in the inner ball. This bounds the total variation distance between any two sufficiently large free-volume laws, and proves the Cauchy property on each cylinder. It gives the same bound with one constrained law and one expanding free volume; then let the latter volume tend to the plane. Constants do not depend on the constraints outside the empty ball.
  Translated or reflected exhausting volumes give the same limit by this comparison, proving the spatial symmetries. The finite laws have the stated spin symmetries. Formula (2.2) determines increments on every fixed path, and its vanishing curl persists in the limit. It therefore defines the plane height modulo one additive integer.
  To check positivity of a finite pin event, enclose all its sites and paths by a double-$B$ cut. Such a cut has positive probability by 7. In its finite interior, take $W$ everywhere plus and choose $B$ with the prescribed values and the cut value. This is a coherent extension and has positive conditional counting probability. The exact cut law proves the assertion. Uniform finite-volume estimates pass to this positive-probability plane conditioning. ◻
]

When height increments rather than the two spin labels are considered, one may equivalently anchor a free height at zero. The global Gray rotation $\( B \, W \) mapsto \( W \, - B \)$ preserves (2.2) and cycles the four residues at the anchor. Each anchored height consequently has the same four representatives in the free pair law. This observation will let us apply counting inequalities directly to anchored height arrays.

=== 3.1 A comparison for separated rare pin events <a-comparison-for-separated-rare-pin-events>

A family of #emph[separated obstacles] consists of finitely many supports, each contained in a bounded simply connected polygonal neighborhood $U_i$, with the closures $overline(U)_i$ pairwise disjoint. Each support has a surrounding polygonal collar inside $U_i$, with positive clearance for all its local buffers and larger comparison cuts. Their filled interiors also lie in $U_i$. Thus an isolating cut encloses only its own obstacle; disjoint annular collars alone would not impose this condition. After rescaling, these neighborhoods, collars, and clearances are fixed. For example, finitely many lattice paths converging uniformly to disjoint compact simple arcs admit such neighborhoods: choose sufficiently thin regular neighborhoods of the arcs, with endcaps, and approximate their boundaries polygonally. Their closures remain disjoint at fine mesh. On obstacle $i$, an event $P_i$ prescribes arbitrary $B$ values and requires $W = + 1$ on at most $m_i$ connected subpaths. There is a fixed bound on $sum_i m_i$, but no bound on the number of pinned sites along a subpath. We use the same notation $P_i$ for the event and write $p_i = mu_oo \( P_i \)$ for its probability.

The following comparison treats one obstacle while retaining any pins already imposed on it. This retention allows its plus and minus pins to be prescribed in successive batches.

#thm([Lemma 3.4.])[
  (Relative comparison for one obstacle).  #emph[Let $mu$ and $nu$ be finite pair laws with second-color equality constraints and first-color pins. Their domains contain the same filled isolating neighborhood $U$, and their constraints inside $U$ agree: these consist of retained $B$ pins $R$ and equality edges $E_0$ on one obstacle. Its surrounding collar and buffers in $U$ contain no constraints. Outside $U$ the two laws may have different constraints. If $A$ prescribes one sign $t$ on further sites of that obstacle, consistently with $R$, then 
$ c nu \( A \) lt.eq mu \( A \) lt.eq c^(- 1) nu \( A \) . $

 Here $c > 0$ depends only on the collar and its buffers, not on the retained pins, equality edges, remote constraints, or the probability of $A$. The same assertion holds with the colors interchanged.]
] <lem:relative-pin-comparison>

#proof[
  Fix sign $t$ on a deterministic double layer $Gamma$ in the collar. Let $q$ be the probability of $A$ in its interior law, retaining $R$ and the internal $E_0$ constraints. Exact cutting makes $q$ the same for $mu$ and $nu$. FKG in the order toward $t$ gives, for either law $lambda in { mu \, nu }$,
  #[#set math.equation(numbering: n => "(3.2)")
   $ lambda \( A \) lt.eq lambda \( A divides B = t upright(" on ") Gamma \) = q . $ <eq:rare-pin-upper>]
  In a thinner collar strictly inside $Gamma$, an exterior stopping search finds a double circuit of sign $t$ with probability at least $c_1 > 0$, by 7. Its constant is uniform over $R$ and all remote constraints: the search buffers contain none of these pins or $E_0$ edges. Conditional on the search, the inner law is the corresponding closer-cut law. In the deterministic-$Gamma$ law, conditioning on this closer sign-$t$ cut can only increase $A$, while preserving $R$. Its probability of $A$ is therefore at least $q$. Consequently
  #[#set math.equation(numbering: n => "(3.3)")
   $ c_1 q lt.eq lambda \( A \) lt.eq q \, #h(2em) lambda in { mu \, nu } . $ <eq:rare-pin-sandwich>]
  Comparison through this common $q$ proves the lemma. The retained pins may be extremely rare; their probability never enters the inequalities. The stopping exploration has not inspected the strict interior, which is essential for the lower bound. ◻
]

#thm([Proposition 3.5.])[
  (Products of separated pin probabilities).  #emph[For a separated family as above, there are constants $0 < c lt.eq C < oo$ such that 
#[#set math.equation(numbering: n => "(3.4)")
 $ c product_i p_i med lt.eq med mu_oo #scale(x: 180%, y: 180%)[\(] ⋂_i P_i #scale(x: 180%, y: 180%)[\)] med lt.eq med C product_i p_i . $ <eq:pin-product>]

 The constants depend on the collars, their buffers, the number of obstacles, and $sum_i m_i$. They do not depend on the mesh, the number or the values of the microscopic $B$ pins, or the probabilities $p_i$. The same estimates hold in all sufficiently large finite free volumes.]
] <prop:pin-product>

#proof[
  First handle the equality requirements for $W$. Temporarily ignore all $B$ pins. For a collection of $m$ connected paths, let $E$ denote constancy of $W$ along each path and let $L$ require all labels to be plus. Conditional on $B$, a consistent pattern of labels has the same probability as the all-plus pattern, and an inconsistent pattern has probability zero. Summing over the at most $2^m$ patterns gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ bb(P) \( L \) lt.eq bb(P) \( E \) lt.eq 2^m bb(P) \( L \) . $ <eq:constancy-label-comparison>]
  Apply 9 with the colors interchanged to the successive all-plus requirements on the obstacles. Each conditional factor is comparable to the corresponding one-obstacle factor: the conditioning concerns only other, separated obstacles. The all-plus probability thus factors up to constants. Equation (3.5), for the joint family and for its individual members, gives the same conclusion for their constancy events. Denote the resulting equality edges by $E_0$.
  Now condition on all these equalities and impose the $B$ requirements obstacle by obstacle. On each obstacle first impose its plus pins, then its minus pins. At either stage compare its conditional factor with the same stage in the one-obstacle equality problem using 9. At the minus stage the plus pins already imposed on that obstacle belong to $R$ and are retained in both cut laws. All previous pins on other obstacles and all other equality paths lie outside $U_i$, so the two laws have exactly the same retained constraints inside $U_i$. Multiplication compares the joint conditional $B$-pin probability with the product of the one-obstacle conditional probabilities.
  Finally restore all the required $W$-plus labels. Conditional on $B$ and $E_0$, their probability is between $2^(- sum_i m_i)$ and one; the same statement applies in each one-obstacle problem. These bounded factors, together with the preceding two comparisons, prove (3.4). The entire proof takes place in finite volumes with uniform constants. The plane assertion follows from 8 and positivity of each finite pin event. ◻
]

== 4 Smearing estimates and conditional moments <sec:moments>

The spectral and pin-motion arguments require bounds for smooth averages, including averages conditioned on events whose probabilities may vanish with the mesh. We first obtain these bounds in flat and bounded-boundary domains, then in the plane, and finally under separated pin obstacles. The same midpoint amplification is used at each stage, with the offset parities checked explicitly in the last application.

A lattice smearing of radius $a gt.eq 1$ is a statistic $Y = sum_x w_x H \( x \)$ whose weights are supported in a ball of radius $a$ and satisfy

#[#set math.equation(numbering: n => "(4.1)")
 $ sum_x lr(|w_x|) lt.eq A \, #h(2em) sup_x lr(|w_x|) lt.eq A a^(- 2) . $ <eq:normalized-weights>]

The constant $A$ is fixed in all uniform assertions. Signed weights are allowed. A #emph[zero-total] smearing also has $sum_x w_x = 0$, so it is independent of the choice of height anchor. Affine interpolation of a bounded test density of size $O \( a^(- 2) \)$ gives weights of this form, with the same total mass as the test. At mesh $delta$, a fixed physical radius is divided by $delta$ in these lattice-unit definitions.

=== 4.1 An amplification lemma for uniform arrays <an-amplification-lemma-for-uniform-arrays>

The rounded midpoint inequality originates in Klartag–Lehec #cite(label("KlartagLehec2019")) Theorem 1.4. We use its nonnegative-function formulation in Gozlan–Roberto–Samson–Tetali #cite(label("GRST2019")) Theorem 3. In one dimension it states that, if finitely supported nonnegative functions on $bb(Z)$ satisfy

$ f \( x \) g \( y \) lt.eq u #scale(x: 120%, y: 120%)[\(] floor.l \( x + y \) \/ 2 floor.r #scale(x: 120%, y: 120%)[\)] v #scale(x: 120%, y: 120%)[\(] ceil.l \( x + y \) \/ 2 ceil.r #scale(x: 120%, y: 120%)[\)] \, $

for all $x \, y in bb(Z)$, then $\( sum f \) \( sum g \) lt.eq \( sum u \) \( sum v \)$.

The nonnegative formulation, including functions with zeros, is essential because our applications use indicators. Here is a direct justification in the finite-support case from the entropy inequality in #cite(label("GRST2019")) Theorem 8, equation (9). Write $F_0 = sum f$, $F_1 = sum g$, $U_(-) = sum u$, and $U_(+) = sum v$. If either $F_i$ is zero the conclusion is immediate. Otherwise normalize $f \, g$ to probability laws $nu_0 \, nu_1$ and use their monotone coupling. Let $nu_(-) \, nu_(+)$ be the laws of its rounded-down and rounded-up midpoints, and put $cal(H) \( nu \) = sum_z nu \( z \) log nu \( z \)$. The cited entropy inequality says

$ cal(H) \( nu_(-) \) + cal(H) \( nu_(+) \) lt.eq cal(H) \( nu_0 \) + cal(H) \( nu_1 \) . $

Every pair with positive coupling mass has positive input values, so the pointwise midpoint hypothesis forces both corresponding output values to be positive. Logarithms may therefore be integrated on these finite supports, without modifying any zero value. The pointwise hypothesis and the finite log-sum inequality give

$ cal(H) \( nu_0 \) + cal(H) \( nu_1 \) + log \( F_0 F_1 \) & lt.eq sum_z nu_(-) \( z \) log u \( z \) + sum_z nu_(+) \( z \) log v \( z \)\
 & lt.eq cal(H) \( nu_(-) \) + cal(H) \( nu_(+) \) + log \( U_(-) U_(+) \) . $

Combining these two inequalities proves the scalar assertion. The same inequality holds for arrays on $bb(Z)^d$, with coordinatewise rounding. Indeed, for each fixed pair of last coordinates, apply the lower-dimensional assertion to the slices; then apply the scalar assertion to their sums. This also explains why output supports need not be the same as the input supports.

The next lemma turns a central probability bound into moments. It allows the parity classes needed for pinned heights, while requiring midpoint admissibility only within each class.

#thm([Lemma 4.1.])[
  (Midpoint tail amplification).  #emph[Let $cal(S)$ be a finite set of integer arrays with its uniform law, let $Y$ be a real linear statistic, and let $M > 0$. Partition $cal(S)$ into at most $m_(*)$ classes. Suppose that whenever $x \, y$ belong to the same class, both coordinatewise rounded midpoints belong to $cal(S)$, and that their $Y$ values differ from $\( Y \( x \) + Y \( y \) \) \/ 2$ by at most $M$. Suppose also that, for every class in use, 
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(P) { lr(||) Y lt.eq M \, med x upright(" belongs to that class") } gt.eq c > 0 . $ <eq:class-central-mass>]

 Then, for constants depending only on $c$ and $m_(*)$, 
$ bb(P) \( lr(||) Y > t M \) lt.eq C e^(- c' t) quad \( t gt.eq 1 \) \, #h(2em) ∥Y∥_(L^p) lt.eq C_p M quad \( p < oo \) . $

 The rounded outputs need not belong to the input class.]
] <lem:midpoint-tails>

#proof[
  Consider the enlarged positive dyadic intervals $I_k = \[ 2^k M - 4 M \, 2^(k + 1) M + 4 M \]$, and put $p_k = bb(P) \( Y in I_k \)$. Choose a class carrying at least $p_k \/ m_(*)$ of this mass. Pair its indicator on $I_k$ with its indicator on $\[ - M \, M \]$. Both rounded output statistics belong to $I_(k - 1)$: the half-width error is at most $2 M + M \/ 2 + M < 4 M$. Apply the product midpoint inequality with both output arrays equal to the indicator of $cal(S) ∩ { Y in I_(k - 1) }$. After division by $lr(|cal(S)|)^2$, it gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ p_(k - 1)^2 gt.eq c p_k \/ m_(*) . $ <eq:dyadic-tail-recursion>]
  The admissibility assumption is needed only where the two input indicators are nonzero; no output class restriction occurs.
  For $k gt.eq 4$ these enlarged intervals have bounded overlap. Hence, in an initial range of bounded length depending only on $c \, m_(*)$, some $p_(k_0)$ is at most $c \/ \( 2 m_(*) \)$. Write $b = m_(*) \/ c$. Iterating (4.3) gives $b p_(k_0 + j) lt.eq 2^(- 2^j)$. The bounded size of the initial range absorbs the earlier terms, so $p_k lt.eq C exp \( - c' 2^k \)$ for all $k$. Repeat with negative intervals and sum the resulting tail bounds. Integrating the tail proves the moment assertion. ◻
]

Integer Lipschitz arrays are stable under these two midpoint operations: an integral edge bound on the averaged coordinates is preserved by taking floors at both endpoints or ceilings at both endpoints. A fixed integral boundary or anchor is preserved as well. For a statistic with weights $w_x$, the rounding error is at most $1 / 2 sum_x lr(|w_x|)$. These observations verify the lemma’s admissibility hypotheses in the unpinned applications.

=== 4.2 Bounded-boundary height problems <bounded-boundary-height-problems>

#thm([Lemma 4.2.])[
  (Loop counts in a distance shell).  #emph[In a finite flat-boundary height problem, fix an interior site $x$. The number of level loops surrounding $x$ whose graph inradii lie between $d$ and $2 d$ has moments bounded at every order, uniformly in the domain and in $d gt.eq 1$. The same holds when the shell is defined by Euclidean closest approach to $x$. Both assertions also hold in a bounded face of a connected constant-height skeleton.]
] <lem:loop-shells>

#proof[
  Choose $eta > 0$ small enough that $rho \( 1 + eta \) < 1$, with slack for bounded lattice rounding at large distances. Divide $\[ d \, 2 d \]$ into a bounded number of intervals with ratio at most $1 + eta$. Expose surrounding loops from the exterior, and consider the first one whose graph inradius lies in one such interval $\[ d' \, \( 1 + eta \) d' \]$. If it exists, its interior has the empty-exterior loop law. If its graph inradius is $n$, then $n lt.eq \( 1 + eta \) d'$. Every further loop with graph inradius at least $d'$ surrounds $Lambda_(floor.l d' floor.r) \( x \)$. For sufficiently large $d'$,
  $ ceil.l rho n ceil.r < floor.l d' floor.r \, $
  because $rho \( 1 + eta \) < 1$. Thus two such loops imply the exact event in the imported upper estimate, in the same graph convention. Their conditional probability is at most $1 - c_0$. Reapply this argument after each successive pair of exposed loops. The count in the interval is dominated by one plus twice a geometric random variable with a fixed success parameter. A bounded number of such bounds handles $\[ d \, 2 d \]$.
  At bounded distances, disjoint loops approaching that close must use distinct vertices in a fixed finite ball, so their number is bounded deterministically. This handles the rounding exceptions. No imported upper bound was applied to the original polygon or skeleton face; every application followed exposure of a surrounding loop. The flat loop description in 2 therefore suffices for the stated domains.
  Finally, triangular graph distance and Euclidean distance are comparable by fixed constants, and a contour is within bounded distance of its incident face centers. A Euclidean closest-approach shell $\[ d \, 2 d \]$ is therefore covered by a fixed finite number of graph-inradius shells, with bounded small-radius exceptions. Summing the graph-shell moment bounds proves the Euclidean assertion. This metric comparison is made only after the strict graph-radius contraction has been proved. ◻
]

#thm([Proposition 4.3.])[
  (Interior smearing moments).  #emph[Consider a uniform height problem with boundary values bounded in absolute value by $K$. Let the center of a radius-$a$ smearing have distance $n$ from the boundary, with $1 lt.eq a lt.eq c_0 n$ for a sufficiently small fixed $c_0 > 0$. Then, for every finite $p$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ ∥sum_x w_x H \( x \)∥_(L^p) lt.eq C_p #scale(x: 120%, y: 120%)[\(] 1 + sqrt(log \( n \/ a \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:smearing-moments>]

 Here $C_p$ depends on $p \, A \, K$, but not on boundary regularity. The same statement holds for bounded data on the inner face chain of a dual cut, and in the bounded skeleton faces considered above.]
] <prop:smearing-moments>

#proof[
  First put zero on the boundary. Conditional on all loop geometry, independent centered jump signs give
  #[#set math.equation(numbering: n => "(4.5)")
   $ bb(E) \[ H \( x \) H \( y \) \] = bb(E) #scale(x: 120%, y: 120%)[\[] \# { upright("loops surrounding both ") x upright(" and ") y } #scale(x: 120%, y: 120%)[\]] . $ <eq:common-loop-covariance>]
  Let $s = max \( 1 \, "dist" \( x \, y \) \)$, for $x \, y$ in the smearing ball. Their boundary distances are comparable to $n$. A loop surrounding both points and approaching $x$ within distance $2 d lt.double s$ supplies a wall arm from scale $O \( d \)$ to scale of order $s$. The contour changes only one spin color along its entire length. A surrounding double circuit of that color blocks the arm: at a vertex of the double circuit all three adjacent spins have that color’s fixed value, so its wall cannot cross there.
  Flat height boundary conditions fix both colors on a connected boundary chain. For either color used as the first spin, constancy of the other color on this chain is an $E_0$ requirement; its single label does not change the first marginal. The buffers between scales $d$ and $s$ lie away from the boundary. Thus 7, for either possible wall color, bounds the arm probability by $C \( d \/ s \)^alpha$. Together with the second moment in 12, Cauchy–Schwarz bounds the expected common-loop count in this shell by $C \( d \/ s \)^(alpha \/ 2)$. Summing the small shells is finite. Each shell from scale $s$ up to scale $O \( n \)$ contributes at most a constant. There are no larger enclosing shells, since an enclosing loop cannot surround a fixed boundary site. Consequently
  #[#set math.equation(numbering: n => "(4.6)")
   $ 0 lt.eq bb(E) \[ H \( x \) H \( y \) \] lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + log \( n \/ s \) #scale(x: 120%, y: 120%)[\)] . $ <eq:point-covariance-upper>]
  Summing (4.6) against $lr(|w_x w_y|)$ yields
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(E) #scale(x: 180%, y: 180%)[\(] sum_x w_x H \( x \) #scale(x: 180%, y: 180%)[\)]^2 lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + log \( n \/ a \) #scale(x: 120%, y: 120%)[\)] . $ <eq:smearing-variance>]
  Indeed the part $log \( n \/ a \)$ is controlled by the total weight. For the remaining singularity, graph balls contain $O \( r^2 \)$ sites, so the bounds in (4.1) give a uniform average of $log \( a \/ max \( 1 \, "dist" \( x \, y \) \) \)$. The one-site contribution is bounded by $C a^(- 2) log a$. This calculation also covers signed weights.
  Chebyshev’s inequality gives a fixed central probability on the scale $M = C \( 1 + sqrt(log \( n \/ a \)) \)$, chosen also to dominate the rounding error. The height arrays with zero boundary have admissible rounded midpoints, so 11 with one class proves (4.4) in the flat case.
  For bounded boundary data, compare with the zero-boundary height shifted by $- ceil.l K ceil.r$ and $+ ceil.l K ceil.r$. A nonnegative smearing is stochastically trapped between the corresponding shifted smearings. Its two tails are therefore bounded by those of the zero-boundary problem, with an additional deterministic error at most $A ceil.l K ceil.r$. Split signed weights into positive and negative parts and use the triangle inequality in $L^p$. This proves the stated bound. The proof uses only the flat loop representation and the incident-star convention, and hence also applies to the asserted dual-cut and skeleton boundaries. ◻
]

In particular, a normalized average on a ball whose radius is a fixed small fraction of its distance to the boundary has moments bounded uniformly as that distance tends to zero, with mesh sent to zero first. This observation will be used at both ordinary boundary points and the two marks.

#thm([Proposition 4.4.])[
  (Plane zero-total moments).  #emph[For every zero-total smearing satisfying (4.1), 
#[#set math.equation(numbering: n => "(4.8)")
 $ ∥sum_x w_x H \( x \)∥_(L^p \( mu_oo \)) lt.eq C_p \, #h(2em) p < oo \, $ <eq:plane-zero-total-moments>]

 uniformly in its radius, location, and lattice rotation. The same bound holds in sufficiently larger finite free volumes, for a height anchored outside the construction.]
] <prop:plane-moments>

#proof[
  Search from the exterior for a double-$B$ circuit in an annulus between $K a$ and $2 K a$ about the support, where $K$ is a fixed sufficiently large constant. 7 gives probability at least $c > 0$, uniformly in $a$ and in a still larger free volume. The search does not inspect the interior. Its inner height trace lies in one pair of consecutive integers by 5. Subtract the lower integer of that pair. Conditional on the trace, the interior is a bounded-boundary height problem. Its boundary distance from the support is comparable to $a$, and $K$ may be chosen to meet the small-fraction requirement in 13. That proposition bounds the second moment of the shifted smearing by a constant. The shift does not alter the original smearing, since its total is zero. We have therefore obtained an unconditional central probability $bb(P) \( lr(||) Y lt.eq M \) gt.eq c' > 0$ for a constant $M$.
  The free pair increment law is the uniform anchored-height law, as noted after 8. Its arrays have admissible rounded midpoints and bounded rounding error. Apply 11 in this finite volume, with the anchor outside the searched circuit. This gives the bound for every $p$, uniformly in that volume and in $a$. For each fixed lattice smearing, let the volume expand and use 8; the bounds pass to the limit. The constants are uniform in $a$ and the listed symmetries, proving the assertion. ◻
]

=== 4.3 An isolated component switch <an-isolated-component-switch>

The following finite identity has two uses: it supplies the parity classes needed for conditional moments, and it prevents the limiting covariance coefficient from vanishing.

#thm([Lemma 4.5.])[
  (A fair switch between opposite cuts).  #emph[Suppose that two nested double-$B$ circuits have opposite signs, and that their intervening collar contains no $E_0$ edge or pinned $W$ site. There is a component of $B$-changing edges confined to this collar whose fair $W$ sign can be flipped so as to change every height inside the inner cut by $4$ in absolute value relative to every height outside the outer cut. The flip changes no spin pin outside the collar. It preserves any inner height prescription invariant under a common additive shift in $4 bb(Z)$, while leaving exterior heights fixed.]
  #emph[Conditional on $B$ and the other $W$ component labels, the two choices are equally likely. If a zero-total statistic has total weight $lambda$ inside the inner cut, no weight in the collar, and all its other weight outside the outer cut, its two values differ by $4 lr(|lambda|)$ and its conditional variance is at least $4 lambda^2$.]
] <lem:component-switch>

#proof[
  On every oriented edge the Gray increment gives the identity
  #[#set math.equation(numbering: n => "(4.9)")
   $ d \( H + B W \/ 2 \) = W thin d B . $ <eq:component-potential-identity>]
  Let $J$ be one connected component of $B$-changing edges, and put $omega_J = upright(bold(1))_J d B$, extended by zero to other edges. A triangle has either no $B$-changing edge or two incident ones in the same component. Thus $omega_J$ has zero curl and has a potential $psi_J$ on the simply connected ambient graph. On the vertices of $J$ this potential agrees with $B$ up to an additive constant. Every other vertex can be connected to $J$ by a path with no edge of $J$ before its endpoint, and so its potential continues one of the two values on $J$. The potential has exactly two values, differing by two.
  No component of $B$-changing edges can cross a double-$B$ cut. Between the two cuts, the sum of the potential changes of all such components, from the outer cut to the inner one, is the total change of $B$, namely $2$ or $- 2$. At least one component $J$ in the collar therefore has a nonzero change. Its potential is constant on the inner region and on the outer region, with a difference of two. Normalize it to zero outside the outer cut.
  The collar is free of $E_0$ and pinned $W$ sites. Consequently the $W$-equality component containing $J$ consists precisely of its vertices, and its common value $w$ is an independent fair sign by 3. Flip this sign and leave all other $W$ components unchanged. Formula (4.9) gives, at every vertex not in $J$,
  $ H' - H = - 2 w psi_J \, $
  when the height is anchored outside the outer cut. The correction from $B W \/ 2$ vanishes at these vertices. Thus the height change is zero outside and is $+ 4$ or $- 4$ throughout the inner region. The spin pins outside the collar are untouched. The two statistic values differ by $4 lr(|lambda|)$, so a fair choice between them has variance $\( 4 lambda \)^2 \/ 4 = 4 lambda^2$. ◻
]

For two fixed disjoint test disks, 7 can require these opposite cuts around one disk while avoiding the other, with a uniform positive probability. Applied to the difference of their unit-mass averages, 15 therefore gives a strictly positive, scale-uniform second-moment lower bound. This assertion is also uniform in a large finite-volume approximation to the plane.

=== 4.4 Moments conditional on pin obstacles <moments-conditional-on-pin-obstacles>

For the following moment statement, impose one extra condition on the separated obstacles of 10. We call a pin pattern #emph[interval-compatible] if, along a connected chain on obstacle $i$, its exact height description is

#[#set math.equation(numbering: n => "(4.10)")
 $ H \( v \) in I_(i \, v) + 4 t_i quad \( v upright(" on the chain") \) \, #h(2em) t_i in bb(Z) \, $ <eq:interval-pin-description>]

where the $I_(i \, v)$ are prescribed integer intervals and at least one is a singleton. The spin event must be exactly this requirement for some $t_i$, with no additional height restriction. The patterns used later have intervals of one or two consecutive integers. They are represented by $B$ pins and by $W = + 1$ on a bounded number of connected subpaths, as in 10. A singleton makes each $t_i$ unique after a common lift has been chosen. Reflections and translations preserve this definition.

#thm([Proposition 4.6.])[
  (Conditional obstacle moments).  #emph[Fix finitely many separated interval-compatible obstacles with filled isolating neighborhoods $U_i$ as in 10. Let a test disk lie in a pin-free simply connected neighborhood $U_0$, with room for a surrounding buffered cut whose filled interior lies in $U_0$. Require $overline(U)_0$ to be disjoint from every $overline(U)_i$. Let $Y$ be a zero-total smearing in the test disk, satisfying (4.1) at its scale. Conditional on all the pins, 
#[#set math.equation(numbering: n => "(4.11)")
 $ ∥∥ Y_(L^p) lt.eq C_p #h(2em) \( p < oo \) . $ <eq:obstacle-moment-bound>]

 The constants depend on the macroscopic arrangement, the weight bound, the number of obstacles, and the bound on W-subpath counts, but not on the mesh or the microscopic pin probabilities. No uniformity as obstacle separations vanish is asserted here.]
] <prop:obstacle-moments>

#proof[
  If the obstacle family is empty, use 14 directly. For a nonempty family, begin in a finite free volume and anchor the height at a singleton on obstacle 1 with its prescribed unshifted value, so $t_1 = 0$. The conditional pair law becomes uniform counting of admissible anchored height arrays satisfying (4.10). Partition them by the parities of $t_2 \, dots.h \, t_m$. In a pair of arrays in the same class, $\( t_i + t'_i \) \/ 2$ is an integer. Both rounded midpoint arrays therefore satisfy the same interval requirements with this new offset: the interval endpoints are integral. The edge bounds and the anchor are preserved. The rounding error of $Y$ is bounded by $A \/ 2$. We verify the remaining central-mass hypothesis of 11.
  First retain W-constancy as $E_0$ and temporarily drop its plus labels. Around the test find a double-$B$ cut by an exterior stopping search. Around each non-anchor obstacle find two nested double-$B$ cuts of opposite signs in its pin-free collar. Choose all these search buffers disjoint. 7 gives their joint event $cal(A)$ probability bounded below, conditional on the $B$ pins and $E_0$. Restoring the bounded number of W-plus labels loses at most the fixed factor explained after 5. Thus
  #[#set math.equation(numbering: n => "(4.12)")
   $ bb(P) \( cal(A) divides upright("all pins") \) gt.eq c_1 > 0 . $ <eq:obstacle-cut-probability>]
  The test search has not revealed its strict interior. Conditional on its trace, its height boundary lies in one consecutive pair, and there are no interior pin constraints. Subtract that pair’s lower value. The zero total removes the shift, and 13 supplies a uniform conditional second moment. If necessary cover the test support by a fixed number of smaller balls to meet that proposition’s small-radius condition. For a sufficiently large fixed $M$, Chebyshev gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ bb(P) \( cal(A) \, lr(||) Y lt.eq M divides upright("all pins") \) gt.eq c_2 > 0 . $ <eq:obstacle-central-event>]
  Here we conditioned on the searches and their exterior traces, not on all the $B$ values inside the test disk.
  Now expose all $B$ values and use 15 separately in each non-anchor obstacle collar. Choose a contributing component measurably from $B$. Its $W$ label is an independent fair bit, unaffected by the required plus labels because the collar has no pinned W sites or $E_0$ edges. Flipping it changes $t_i$ by an odd integer and changes no other offset. The anchor, every other obstacle, and the whole test neighborhood lie outside $U_i$, hence outside this collar’s outer cut. The flip consequently preserves $Y$, all other offsets, all pins, and $cal(A)$. Distinct collars give distinct independent bits.
  Conditional on $B$ and all remaining W-component labels, these switches act transitively on the $2^(m - 1)$ parity vectors, preserve probability, and preserve the event in (4.13). Each parity class thus receives at least $2^(- \( m - 1 \)) c_2$ of that central probability. This is (4.2), with a number of classes independent of the mesh. 11 proves every moment bound.
  Finally let the free volume expand at each fixed mesh. The finite pin event has positive plane probability by 8; cylinder convergence therefore passes to its conditional law. The uniform moment bounds pass as well, proving (4.11) in the plane. ◻
]

#thm([Corollary 4.7.])[
  (Equal-offset moments with varying separations).  #emph[For a nonempty obstacle family in the preceding setup, impose the additional event $cal(E) = { t_i = t_1 upright(" for every ") i }$. The obstacles may now vary or approach one another, while staying away from a fixed test disk. Fix an annular buffer around that disk, with positive clearance from the disk and with fixed inner and outer radii. Suppose the buffer and its filled interior contain no pins. Suppose that, under conditioning on the pins and $cal(E)$, an exterior search finds a surrounding double-$B$ cut in this buffer, with probability at least $c > 0$ uniformly in the varying arrangements. Suppose that $cal(E)$ can be checked in the exterior of the selected cut, so its strict interior remains free given the trace. Then the zero-total test in that disk has moments bounded uniformly in those arrangements.]
  #emph[A sufficient condition is that the cut probability conditional on the pins alone is at least $c_0 > 0$, that $bb(P) \( cal(E) divides upright("pins") \) arrow.r 1$ uniformly along the varying family, and that the same exterior measurability holds.]
] <cor:equal-offset-moments>

#proof[
  Anchor at obstacle 1. Equal offsets make all the offsets zero, so the admissible height arrays now satisfy fixed integer interval constraints. Their rounded midpoints are admissible without a parity partition. On the asserted cut event, the trace lies in a consecutive pair and the conditional interior is free of further constraints. The fixed buffer bounds its distance from the test above and below, uniformly in the arrangement. Covering the support by a fixed number of smaller balls if necessary, 13 therefore gives the uniform central probability in (4.13). Apply 11 with one class. This proof uses neither the separate obstacle collars nor bounds on moments outside the equal-offset event.
  For the sufficient condition, if $epsilon = bb(P) \( cal(E)^c divides upright("pins") \)$, then the conditional cut probability after adding $cal(E)$ is at least $\( c_0 - epsilon \) \/ \( 1 - epsilon \)$. This is bounded below for all sufficiently small $epsilon$. Exterior measurability ensures that the conditioning has not changed the free interior once the trace is fixed. Finite-volume approximation justifies the counting argument exactly as in 16. ◻
]

== 5 Reflection positivity and the plane covariance <sec:spectral>

All expectations in this section are for the free plane pair constructed in 8. Its height increments are denoted by $xi_u = H \( u \) - H \( 0 \)$, for $u in bb(T)$. For a compactly supported test of integral zero, $H_delta \( f \)$ means the integral of the affine interpolation on $delta bb(T)$ against $f$; its value is independent of the chosen additive constant. No Gaussian assumption is made in this section.

We identify the scaling covariance of these averages in two stages. First, reflection positivity and an angular inequality force every subsequential spectral limit to have an inverse-Laplacian density. A signed angular sum then shows that all these limits have the same coefficient. The covariance also implies that $H_delta \( Delta phi.alt \)$, for a compactly supported smooth $phi.alt$ supported strictly on one side of a lattice reflection line, has vanishing reflection norm. This is the input for the pin-motion argument in 7.

We use Euclidean coordinates in both spaces. Set

$ e_1 = \( 1 \, 0 \) \, #h(2em) e_2 = \( 1 \/ 2 \, sqrt(3) \/ 2 \) \, #h(2em) bb(T)^perp = { p in bb(R)^2 : p dot.op u in 2 pi bb(Z) upright(" for all ") u in bb(T) } \, #h(2em) hat(bb(T)) = bb(R)^2 \/ bb(T)^perp . $

The characters are $u mapsto e^(i p dot.op u)$. A neighborhood of zero in $hat(bb(T))$ will always be identified with its Euclidean representative. In particular, the disk of radius $1 \/ 2$ is unambiguous. Our continuum Fourier convention is

$ hat(f) \( zeta \) = integral_(bb(R)^2) e^(- i zeta dot.op x) f \( x \) thin d x . $

=== 5.1 A positive normal translation <a-positive-normal-translation>

The square-integral proof of reflection positivity below is a site-plane version of the classical mechanism developed by Fröhlich–Israel–Lieb–Simon #cite(label("FILS1978")). We give the finite-volume factorization and the exact row geometry because the later argument needs a positive normal transfer, including in the presence of auxiliary height phases. The distinction between site reflection and reflection between site rows matters: the positive-transfer construction in #cite(label("Usui2012")) Sections 3.3 and 4.1 makes the role of site reflection explicit. Our halfway line is itself a row of triangular-lattice sites.

#thm([Proposition 5.1.])[
  (Reflection positivity with auxiliary phases).  #emph[Let $ell$ be a line of lattice sites parallel to a nearest-neighbor direction. The plane law is reflection positive across $ell$. This remains true after adjoining any finite collection of phase fields 
#[#set math.equation(numbering: n => "(5.1)")
 $ Z_theta \( u \) = U_theta exp { i theta \( H \( u \) - H \( o \) \) } \, #h(2em) theta in bb(R) \, $ <eq:auxiliary-phases>]

 where the $U_theta$’s are independent uniform points of the unit circle, independent of the pair, and $o$ is any anchor.]
  #emph[More precisely, let $Theta_ell$ denote spatial reflection, and let $cal(A)_ell$ consist of cylinder functions supported in one closed half-plane, with increments evaluated along paths in that half-plane. Then 
$ chevron.l F \, G chevron.r_ell = bb(E) #scale(x: 120%, y: 120%)[\[] overline(Theta_ell F) thin G #scale(x: 120%, y: 120%)[\]] $

 is positive semidefinite. In its quotient completion, normal translation farther into the half-plane by $sqrt(3)$ is a positive self-adjoint contraction $S$. Tangential translation by one lattice unit is a commuting unitary operator. On mesh $delta$, the normal step is $sqrt(3) delta$.]
] <prop:reflection-positivity>

#proof[
  The phase law does not depend on its anchor: replacing $o$ by another site multiplies each $U_theta$ by a unit complex number determined by the increments, which preserves its conditional Haar law. The same observation under translations and reflections gives the phase law the spatial symmetries of the pair law. We may therefore put the phase anchor on $ell$.
  First take a finite reflection-symmetric free volume. Conditional on the spin values on its intersection with $ell$, the configurations on the two sides are independent and reflected-identical. Indeed, no nearest-neighbor edge jumps across a row of sites. A lift on the row is fixed by its spin values and one anchor value on the row. If phases are present, additionally condition on their values at that anchor. The phases on each side are then determined by the increments on that side and these row values, so conditional independence persists. Thus
  $ bb(E) #scale(x: 120%, y: 120%)[\[] overline(Theta_ell F) F #scale(x: 120%, y: 120%)[\]] = bb(E) #scale(x: 120%, y: 120%)[\[] \| bb(E) \[ F divides upright("row data") \] \|^2 #scale(x: 120%, y: 120%)[\]] gt.eq 0 . $
  The plane limit gives the assertion for cylinder functions. Functions in ordinary $L^2$ obtained by approximation are included because $\| chevron.l F \, G chevron.r_ell \| lt.eq parallel F parallel_(L^2) parallel G parallel_(L^2)$.
  For clarity, take $ell = { y = 0 }$, with the upper half-plane chosen. Write a site as $\( m + n \/ 2 \, n sqrt(3) \/ 2 \)$. Reflection about $y = 0$ sends its integer coordinates to $\( m + n \, - n \)$, and reflection about $y = sqrt(3) \/ 2$ sends them to $\( m + n - 1 \, 2 - n \)$. Both preserve $bb(T)$. Their composition is the pure normal translation $a = \( 0 \, sqrt(3) \)$; no tangential correction is required. Let $T$ be translation by $a$ on cylinder functions. Stationarity gives $chevron.l T F \, G chevron.r_ell = chevron.l F \, T G chevron.r_ell$. Moreover, $chevron.l F \, T F chevron.r_ell$ is the reflection form of $T F$ at the halfway row, since reflecting $T F$ in that row gives $Theta_ell F$. It is therefore nonnegative.
  To prove boundedness before taking the quotient, put $a_n = parallel T^n F parallel_ell$. Reflection Cauchy–Schwarz and the preceding symmetry imply $a_n^2 lt.eq a_(n - 1) a_(n + 1)$ for $n gt.eq 1$. Ordinary Cauchy–Schwarz and stationarity give $a_n lt.eq parallel F parallel_(L^2)$ for every $n$. A bounded nonnegative log-convex sequence cannot have $a_1 > a_0$; if $a_0 = 0$, the same inequality gives $a_1 = 0$. Consequently $parallel T F parallel_ell lt.eq parallel F parallel_ell$. It follows that $T$ descends to the quotient and extends to the stated positive self-adjoint contraction $S$. Tangential translation commutes with reflection, preserves the form, and has an inverse with the same properties. It is therefore unitary and commutes with $S$. Rotation gives the other lattice directions, and rescaling gives the mesh statement. ◻
]

=== 5.2 The increment spectral measure <the-increment-spectral-measure>

We first specify the elementary spectral construction for ordinary lattice translations. If $V$ is a unitary translation and $F$ a Hilbert-space vector, the positive Fourier polynomials

$ frac(1, N + 1) ∥sum_(j = 0)^N e^(- i j k) V^j F∥^2 frac(d k, 2 pi) $

have mass $parallel F parallel^2$ and Fourier coefficients converging to $chevron.l F \, V^n F chevron.r$. Compactness of finite measures on the circle gives the scalar spectral measure, uniquely specified by these coefficients. Rectangular Fourier sums give the same construction for commuting lattice translations. Polarization gives their cross measures and the bound on total variation by the product of the vector norms. A multiplier is defined first for trigonometric polynomials and then by completion; this is the meaning of $E \( d p \)$ below. The mass at zero is the projection onto invariant vectors, also obtained as the limit of rectangular Cesàro averages of translations.

#thm([Lemma 5.2.])[
  #emph[There is a nonnegative measure $C$, locally finite on $hat(bb(T)) \\ { 0 }$, such that 
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E) (sum_u a_u H \( u \))^2 = integral_(hat(bb(T)) \\ { 0 }) lr(|sum_u a_u e^(i p dot.op u)|)^2 C \( d p \) $ <eq:increment-spectral>]

 for every finitely supported real array with $sum_u a_u = 0$. The measure is invariant under the lattice reflections and rotations. There is no additional random linear tilt term in this identity.]
] <lem:increment-spectral>

#proof[
  Let $V_u$ be the ordinary unitary translation operators on the plane probability space, and let $E \( d p \)$ be their joint spectral resolution. The increment cocycle satisfies
  $ xi_(u + v) = xi_v + V_v xi_u \, #h(2em) \( V_v - I \) xi_u = \( V_u - I \) xi_v . $
  On a spectral neighborhood where $e^(i p dot.op v) - 1 eq.not 0$, this identity expresses every $E \( d p \) xi_u$ as $e^(i p dot.op u) - 1$ times the same spectral vector. Equivalently, on that neighborhood define
  $ C \( d p \) = frac(chevron.l xi_v \, E \( d p \) xi_v chevron.r_(L^2), \| e^(i p dot.op v) - 1 \|^2) . $
  The cocycle identity makes these definitions agree on overlaps. The two basis directions cover the punctured torus, so they define a locally finite measure there and give (5.2) for the nonzero spectral part.
  Let $P_0 = E \( { 0 } \)$. The invariant part of the cocycle is additive, hence $P_0 xi_u = A dot.op u$ for a random vector $A in L^2$. Take a smooth zero-integral function $f$ with nonzero first moment $m = integral x f \( x \) thin d x$, and smear the unit-mesh affine height against $L^(- 2) f \( x \/ L \)$. Affine interpolation reproduces linear functions exactly, so the invariant part of this statistic is $L A dot.op m$. Its $L^2$ norm is bounded uniformly in $L$ by 14, since orthogonal projection cannot increase that norm. Two choices of $f$ with independent first moments imply $A = 0$. This also rules out cancellation of a tilt by other spectral components: those components are orthogonal to the invariant subspace.
  The representation determines $C$ locally by any nonvanishing lattice difference. The symmetries of the increment law therefore give the asserted symmetries of $C$. ◻
]

#thm([Lemma 5.3.])[
  (Uniform annular mass).  #emph[For some finite constant $K$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ C { r lt.eq \| p \| lt.eq 2 r } lt.eq K \, #h(2em) 0 < r < 1 \/ 4 . $ <eq:annulus-mass>]

 In particular, for every $eta > 0$, $integral_(0 < \| p \| < 1 \/ 4) \| p \|^eta C \( d p \) < oo$.]
] <lem:annulus-mass>

#proof[
  Choose two real smooth zero-integral functions $f_1 \, f_2$ whose Fourier transforms have no common zero on $1 lt.eq \| zeta \| lt.eq 2$. For example, take the two first derivatives of a smooth bump whose transform does not vanish on that annulus. Let $a_u^(\( r \, i \))$ be the affine interpolation weights for $r^2 f_i \( r x \)$. Uniformly on the fixed annulus,
  $ sum_u a_u^(\( r \, i \)) e^(i r zeta dot.op u) arrow.r hat(f)_i \( - zeta \) . $
  This follows directly by interpolating the smooth plane wave; its error on a unit triangle is $O \( r^2 \)$, uniformly for $zeta$ in a compact set. Consequently the sum of the squared absolute values of these two transforms is bounded below on $r lt.eq \| p \| lt.eq 2 r$, for all sufficiently small $r$. Apply (5.2) and the uniform $L^2$ bound of 14. The remaining range of $r$ is covered by local finiteness of $C$. Summing over dyadic annuli proves the last assertion. ◻
]

=== 5.3 Cauchy kernels from positive transfer <cauchy-kernels-from-positive-transfer>

Transfer spectral representations for lattice two-point functions are developed in #cite(label("Usui2012")) and, for the six-vertex model, in #cite(label("DCKLM2026")) Theorems 4.12 and 4.15. We derive the particular periodized Cauchy mixture needed here, including its reciprocal-lattice aliases, from the normal step already established.

For the normal transfer we need the joint spectrum of a commuting unitary $U$ and positive contraction $S$. The preceding Fourier construction extends to a measure on the circle times $\[ 0 \, 1 \]$. For each $N$, the commuting Bernstein operators

$ B_(N \, j) = binom(N, j) S^j \( I - S \)^(N - j) \, #h(2em) 0 lt.eq j lt.eq N \, $

are positive and sum to the identity. For a Hilbert-space vector $F$, place at $j \/ N$ the positive Fourier measure whose $n$th coefficient is

$ chevron.l F \, U^n B_(N \, j) F chevron.r . $

The resulting measures have mass $parallel F parallel^2$. Their mixed moments converge to $chevron.l F \, U^n S^m F chevron.r$, because $sum_j \( j \/ N \)^m B_(N \, j) = S^m + O_m \( N^(- 1) \)$ in operator norm. Compact limits are unique: polynomials in the second coordinate and trigonometric polynomials in the first uniformly approximate continuous functions. Polarization again supplies cross measures. For $"Re" z > 0$, integrating $lambda^z$, with value zero at $lambda = 0$, against them gives the bounded complex transfer powers used in 7. These finite positive-measure constructions suffice; no reconstruction of a continuum field is used.

Put $P = 2 pi \/ sqrt(3)$. Restrict translations to the rectangular sublattice generated by $\( 1 \, 0 \)$ and $\( 0 \, sqrt(3) \)$, and let $C'$ be the projection of $C$ onto its reciprocal rectangle

$ cal(R) = \[ - pi \, pi \) times \[ - P \/ 2 \, P \/ 2 \) . $

The projection is a two-sheeted covering of reciprocal tori. Its second preimage of the rectangular origin is a nonzero point of $hat(bb(T))$. It will be called an alias of the origin. In every comparison below the measure near this nonzero point is finite; atoms there are allowed.

For $0 < s < oo$, let $Q_s$ be the probability measure on the vertical circle with density

#[#set math.equation(numbering: n => "(5.4)")
 $ q_s \( l \) = sum_(n in bb(Z)) frac(s, pi { s^2 + \( l + n P \)^2 }) \, #h(2em) - P \/ 2 lt.eq l < P \/ 2 . $ <eq:periodized-cauchy>]

Set $Q_0 = delta_0$ and let $Q_oo$ be uniform probability on that circle.

#thm([Proposition 5.4.])[
  (Positive Cauchy mixture).  #emph[There is a nonnegative measure $nu \( d k \, d s \)$ on $\( bb(R) \/ 2 pi bb(Z) \\ { 0 } \) times \[ 0 \, oo \]$, finite on sets whose horizontal projection stays away from zero, such that 
#[#set math.equation(numbering: n => "(5.5)")
 $ C' \( d k \, d l \) = integral_(\[ 0 \, oo \]) Q_s \( d l \) thin nu \( d k \, d s \) \, #h(2em) k eq.not 0 . $ <eq:cauchy-mixture>]

 Moreover, 
#[#set math.equation(numbering: n => "(5.6)")
 $ integral_(0 < \| k \| < kappa) \| k \| thin nu \( d k \, d s \) < oo $ <eq:weighted-nu>]

 for every sufficiently small fixed $kappa > 0$.]
] <prop:cauchy-mixture>

#proof[
  Let $F = H \( e_1 \) - H \( 0 \)$, supported on the reflection row. In the reflection Hilbert space, let $U$ be horizontal unit translation and $S$ the positive normal transfer from 18. For $j gt.eq 0$,
  $ bb(E) #scale(x: 120%, y: 120%)[\[] F thin V_(n e_1 + j \( 0 \, sqrt(3) \)) F #scale(x: 120%, y: 120%)[\]] = chevron.l F \, U^n S^j F chevron.r_ell . $
  The joint spectral resolution of the commuting operators $U \, S$ represents this as $integral e^(i n k) lambda^j thin gamma \( d k \, d lambda \)$, with $0 lt.eq lambda lt.eq 1$. Reflection in the row gives the same formula with $\| j \|$ for negative $j$. Write $lambda = e^(- sqrt(3) s)$, including $s = oo$ at $lambda = 0$. The vertical Fourier coefficients of $Q_s$ are $e^(- sqrt(3) s \| j \|)$. Uniqueness of Fourier coefficients of finite measures therefore identifies the ordinary increment spectral measure as the mixture of $Q_s$’s with mixing measure $gamma$. By 19, that increment measure is $\| e^(i k) - 1 \|^2 C' \( d k \, d l \)$. Division on $k eq.not 0$ proves (5.5) and the local finiteness assertion.
  Since $Q_s$ has total mass one, the left side of (5.6) equals $integral_(0 < \| k \| < kappa) \| k \| thin C' \( d k \, d l \)$. Near the physical origin this is finite by 20, because $\| k \| lt.eq \| p \|$. The rest consists of finite mass away from the physical origin, including the alias contribution. This proves the assertion without any horizontal-band estimate on $nu$. ◻
]

=== 5.4 An angular identity with a nonnegative defect <an-angular-identity-with-a-nonnegative-defect>

We seek an angular function whose sixfold rotational average is zero, but whose unperiodized vertical Poisson average is nonnegative and vanishes precisely when the normal scale equals the tangential frequency magnitude. The fourth harmonic has both properties. The estimates below control periodization, aliases, and the passage from horizontal bands to physical annuli; the dispersion relation is forced only in the scaling limit.

For $p = \( k \, l \) eq.not 0$, write

$ chi \( k \, l \) = cos \( 4 arg \( k + i l \) \) = 1 - frac(8 k^2 l^2, \( k^2 + l^2 \)^2) . $

On $cal(R)$, this means the displayed function of the centered representatives; we only integrate it over small horizontal bands.

#thm([Lemma 5.5.])[
  (Angular Poisson identity).  #emph[Uniformly for $s in \[ 0 \, oo \]$ and $0 < \| k \| < kappa$, 
#[#set math.equation(numbering: n => "(5.7)")
 $ integral chi \( k \, l \) Q_s \( d l \) = D \( k \, s \) + O \( \| k \| \) \, #h(2em) D \( k \, s \) = (frac(\| k \| - s, \| k \| + s))^2 \, $ <eq:angular-poisson>]

 where $D \( k \, oo \) = 1$.]
] <lem:angular-poisson>

#proof[
  Put $a = \| k \|$. The bounded analytic function
  $ z mapsto (frac(a + i z, a - i z))^2 $
  on the upper half-plane has boundary real part $chi \( a \, l \)$. The Poisson formula at $z = i s$ gives, for the unperiodized Cauchy density $p_s \( l \) = s \/ { pi \( s^2 + l^2 \) }$,
  $ integral_(bb(R)) chi \( a \, l \) p_s \( l \) thin d l = (frac(a - s, a + s))^2 . $
  To bound periodization uniformly, put $f_a \( l \) = 1 - chi \( a \, l \) = 8 a^2 l^2 \/ \( a^2 + l^2 \)^2$. Then $integral_(bb(R)) f_a \( l \) thin d l = 4 pi a$, and $f_a \( l \) lt.eq 8 a^2 \/ l^2$ away from zero. Also
  $ sup_(s > 0) sup_(\| l \| lt.eq P \/ 2) sum_(n eq.not 0) p_s \( l + n P \) < oo . $
  For this last bound, split the sum at $\| n \|$ comparable to $s \/ P$: the near terms are bounded by $1 \/ \( pi s \)$, and the remaining square tail is summable. Comparing the integrals of $f_a$ over the period and over the line now gives an $O \( a \)$ error; the unfolded tail contributes only $O \( a^2 \)$. The cases $s = 0$ and $s = oo$ follow directly from their definitions. ◻
]

#thm([Proposition 5.6.])[
  (Summable dispersion defect).  #emph[For some fixed $kappa > 0$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ integral_(0 < \| k \| < kappa) D \( k \, s \) thin nu \( d k \, d s \) < oo . $ <eq:dispersion-defect>]

 There is a finite constant $K_1$ such that 
#[#set math.equation(numbering: n => "(5.9)")
 $ nu { r lt.eq \| k \| lt.eq 2 r } lt.eq K_1 $ <eq:horizontal-band-mass>]

 for all sufficiently small $r > 0$.]
] <prop:dispersion-defect>

#proof[
  Integrate (5.7) over $epsilon < \| k \| < kappa$. The total error is bounded independently of $epsilon$ by (5.6). Replacing the projected measure by the physical measure in the disk $\| p \| < kappa$ incurs another bounded error: the omitted physical region and the aliases have finite mass. Thus it suffices to bound above
  $ integral_(epsilon < \| p \| < kappa \, med \| k \| > epsilon) chi \( k \, l \) thin C \( d p \) . $
  The integral over the full radial annulus vanishes. Indeed, the sum of the fourth angular harmonic over rotations by multiples of $pi \/ 3$ is zero, and $C$ is invariant under those rotations. Write $E_epsilon = { \| k \| lt.eq epsilon \, med epsilon < \| p \| < kappa }$ for the removed endcap. Then
  $ integral_(epsilon < \| p \| < kappa \, med \| k \| > epsilon) chi thin d C = - integral_(E_epsilon) chi thin d C lt.eq integral_(E_epsilon ∩ { chi < 0 }) \| chi \| thin d C . $
  Negativity requires $\| l \/ k \| < 1 + sqrt(2)$, so the last integral is confined to $epsilon < \| p \| lt.eq K_2 epsilon$. A fixed number of the annuli in (5.3) bounds it uniformly. This gives the required upper bound even if the positive part of the endcap integral is large. Since $D$ is nonnegative, monotone convergence gives (5.8).
  For (5.9), on $r lt.eq \| k \| lt.eq 2 r$ the part with $s in.not \[ r \/ 2 \, 4 r \]$ has $D gt.eq 1 \/ 9$, and hence bounded mass. For $s in \[ r \/ 2 \, 4 r \]$, a fixed positive fraction of $Q_s$ lies in $\| l \| lt.eq 2 r$. (5.5) bounds that part of $nu$ by a constant times $C' { r lt.eq \| k \| lt.eq 2 r \, med \| l \| lt.eq 2 r }$. This is bounded by 20 and the finite alias mass. ◻
]

#thm([Lemma 5.7.])[
  (Endcap estimate).  #emph[For a finite constant $K_3$, 
#[#set math.equation(numbering: n => "(5.10)")
 $ C { r < \| p \| < 2 r \, med \| k \| lt.eq epsilon } lt.eq K_3 epsilon / r \, #h(2em) 0 < epsilon < r \/ 10 \, quad 0 < r < 1 \/ 4 . $ <eq:endcap>]

 In particular the punctured small disk has no mass on the line $k = 0$.]
] <lem:endcap>

#proof[
  Rotate the region by a lattice rotation of angle $pi \/ 3$. In the resulting coordinates $\( k' \, l' \)$, both $\| k' \|$ and $\| l' \|$ are comparable to $r$. At fixed $k'$, the original condition $\| k \| lt.eq epsilon$ restricts $l'$ to an interval of length $O \( epsilon \)$. On this interval the density of every $Q_s$, $0 < s < oo$, is at most $K \/ r$: its central Cauchy term is bounded by $1 \/ \( 2 pi \| l' \| \)$, and the periodized tails are uniformly bounded. The $s = 0$ atom is outside this interval; the uniform law satisfies the same bound. The relevant horizontal band has bounded $nu$ mass by (5.9). Since projecting the original local measure only adds nonnegative alias mass, (5.5) proves the estimate for small $r$. The remaining compact range of radii is treated identically, using finiteness of $nu$ on horizontal bands away from zero. Finally let $epsilon arrow.b 0$. ◻
]

=== 5.5 Scaling limits of the spectral measure <scaling-limits-of-the-spectral-measure>

For small $delta > 0$, rescale the physical neighborhood of zero by $p mapsto p \/ delta$; denote the resulting measure by $C_delta$. Its restriction to any fixed compact subset of $bb(R)^2 \\ { 0 }$ is well defined once $delta$ is small. By 20, every sequence $delta arrow.b 0$ has a subsequence with a vague limit there.

#thm([Lemma 5.8.])[
  #emph[Every such vague limit has the form 
#[#set math.equation(numbering: n => "(5.11)")
 $ M \( d p \) = c thin frac(d p, \| p \|^2) $ <eq:spectral-subsequence>]

 for a finite $c gt.eq 0$, initially allowed to depend on the subsequence.]
] <lem:spectral-subsequences>

#proof[
  Fix a compact horizontal band $a lt.eq \| k \| \/ delta lt.eq b$, where $0 < a < b$. Rescale the mixing variables to $\( k \/ delta \, s \/ delta \)$. Their masses are uniformly bounded by (5.9). The integral of $D$ over the original band tends to zero by (5.8). On the rescaled band the function $D$ is bounded below away from zero outside any fixed neighborhood of $s \/ delta = \| k \| \/ delta$, including at $s \/ delta = oo$. Therefore every limiting mixing measure is supported on that graph.
  On compact vertical sets, the rescaled periodized Cauchy kernel converges to the ordinary Cauchy kernel; the folded density error after rescaling is $O \( delta \)$. Thus, for a nonnegative measure $eta$ in the horizontal coordinate, the limiting physical measure on $k eq.not 0$ has the form
  #[#set math.equation(numbering: n => "(5.12)")
   $ M \( d k \, d l \) = frac(\| k \|, pi \( k^2 + l^2 \)) thin eta \( d k \) thin d l . $ <eq:limiting-cauchy>]
  Here aliases introduce no extra term. Their preimages shrink to nonzero points of the triangular reciprocal torus but, because $\| k \| \/ delta gt.eq a$, exclude those points themselves. Finite measures give vanishing mass to such shrinking punctured neighborhoods, even when there is an atom at the alias.
  (5.12) says that $\| p \|^2 M \( d p \)$ is locally invariant under vertical translations on $k eq.not 0$; it does not assume that $eta$ has a density. Apply the same argument after the lattice rotations. At every nonzero point, at least two of the three tangential coordinates are nonzero, and the corresponding normal directions are nonparallel. Both constant directional derivatives of the distribution $\| p \|^2 M$ vanish in a neighborhood of that point. It is consequently a constant multiple of Lebesgue measure there. One can see this by convolving locally with a smooth approximate identity: the resulting smooth function has both independent derivatives zero. The constants agree on overlapping neighborhoods, and the punctured plane is connected. This proves (5.11), including on the axes. Finiteness and nonnegativity of $c$ follow from 20 and positivity. ◻
]

=== 5.6 The angular sum fixes the coefficient <the-angular-sum-fixes-the-coefficient>

Let $q$ be any even $C^oo$ function with

#[#set math.equation(numbering: n => "(5.13)")
 $ 0 lt.eq q lt.eq 1 \, #h(2em) q = 1 upright(" on ") \[ - 1 \/ 2 \, 1 \/ 2 \] \, #h(2em) q = 0 upright(" outside ") \( - 1 \, 1 \) . $ <eq:cutoff-properties>]

An explicit choice will be given in 6. Define

$ w_j \( k \) = q \( 2^j k \) - q \( 2^(j + 1) k \) \, #h(2em) I_j = integral q \( 4 \| p \| \) chi \( k \, l \) w_j \( k \) thin C \( d p \) \, #h(2em) j gt.eq 0 . $

Each integral is over a compact subset of the punctured torus. No monotonicity of $q$ is required.

#thm([Proposition 5.9.])[
  (Angular sum rule).  #emph[The series $sum_(j gt.eq 0) \| I_j \|$ converges. There is a single constant $c_(*) gt.eq 0$ such that every limit in 25 has coefficient $c_(*)$, and 
#[#set math.equation(numbering: n => "(5.14)")
 $ sum_(j gt.eq 0) I_j = - pi / 2 c_(*) . $ <eq:angular-sum>]

 The value is independent of the choice of $q$ satisfying (5.13).]
] <prop:angular-sum>

#proof[
  The supports of the $w_j$’s lie in $2^(- j - 2) < \| k \| < 2^(- j)$ and have bounded overlap. Replacing the physical cutoff integral $I_j$ by $integral w_j \( k \) chi \( k \, l \) thin C' \( d k \, d l \)$ has errors whose absolute values sum to a finite number. Indeed, near the physical origin the measures and cutoff agree, whereas the remaining physical and alias contributions have finite mass; use the bounded overlap. For all sufficiently large $j$, (5.7) then gives
  $ integral w_j chi thin d C' = integral w_j \( k \) D \( k \, s \) thin nu \( d k \, d s \) + e_j \, #h(2em) \| e_j \| lt.eq K integral \| w_j \( k \) \| thin \| k \| thin nu \( d k \, d s \) . $
  (5.8), (5.6) and bounded overlap prove absolute convergence. The finitely many remaining bands cause no difficulty.
  Put $epsilon_N = 2^(- N)$. Telescoping, and using $q \( k \) = 1$ on the support of $q \( 4 \| p \| \)$, gives
  $ sum_(j = 0)^(N - 1) I_j = integral q \( 4 \| p \| \) chi \( k \, l \) #scale(x: 120%, y: 120%)[\[] 1 - q \( k \/ epsilon_N \) #scale(x: 120%, y: 120%)[\]] C \( d p \) . $
  Subtract the identically zero radial integral with bracket $1 - q \( \| p \| \/ epsilon_N \)$. The result is
  #[#set math.equation(numbering: n => "(5.15)")
   $ sum_(j = 0)^(N - 1) I_j = integral q \( 4 \| p \| \) chi \( k \, l \) #scale(x: 120%, y: 120%)[\[] q \( \| p \| \/ epsilon_N \) - q \( k \/ epsilon_N \) #scale(x: 120%, y: 120%)[\]] C \( d p \) . $ <eq:cutoff-difference>]
  The same right side tends to $sum_j I_j$ for arbitrary $epsilon arrow.b 0$. To check this, choose a dyadic $epsilon_N$ comparable to $epsilon$. The difference of the two horizontal cutoffs is bounded and supported on a band $c epsilon < \| k \| < C epsilon$. The preceding Poisson comparison bounds its signed integral by the integrals of $D$ and $\| k \|$ over that band, plus finite outer and alias mass on a shrinking band excluding $k = 0$. All three tend to zero. This is also a useful reason for retaining the integrable defect, rather than only a subsequential limiting formula.
  Now take any sequence along which $C_epsilon$ has the limit $c thin d p \/ \| p \|^2$. After rescaling, the bracket in (5.15) vanishes on $\| p \| lt.eq 1 \/ 2$. Its tails are uniform: on a dyadic annulus $R < \| p \| < 2 R$, $R > 10$, it is supported on $\| k \| < 1$, whose rescaled mass is at most $K \/ R$ by 24. Summing gives an $O \( 1 \/ R \)$ tail bound. Vague convergence may therefore be used in the whole integral. Polar coordinates yield
  $ sum_(j gt.eq 0) I_j & = c integral_0^(2 pi) cos \( 4 u \) integral_0^oo #scale(x: 120%, y: 120%)[\[] q \( r \) - q \( r \| cos u \| \) #scale(x: 120%, y: 120%)[\]] frac(d r, r) thin d u\
 & = c integral_0^(2 pi) cos \( 4 u \) log \| cos u \| thin d u = - pi / 2 c . $
  For the middle equality, change variables in the second radial integral, first with finite cutoffs. The absolute radial integral is bounded by a constant times $1 + \| log \| cos u \| \|$, which is integrable in $u$. For the last equality, use the fourth Fourier coefficient of $log \| 1 + e^(2 i u) \|$, obtained by expanding from inside the unit circle; the constant $- log 2$ in $log \| cos u \|$ has zero pairing with $cos 4 u$. The left side is independent of the subsequence, so all coefficients agree. The final integral also proves independence of $q$. ◻
]

=== 5.7 Covariance convergence and a reflection null vector <covariance-convergence-and-a-reflection-null-vector>

#thm([Theorem 5.10.])[
  (Universal plane covariance).  #emph[The rescaled spectral measures converge vaguely on the punctured plane to $c_(*) thin d p \/ \| p \|^2$, with $0 < c_(*) < oo$. Put $v = \( 2 pi \)^2 c_(*)$. For real $f \, g in C_c^oo \( bb(R)^2 \)$ of integral zero, 
#[#set math.equation(numbering: n => "(5.16)")
 $ lim_(delta arrow.b 0) bb(E) \[ H_delta \( f \) H_delta \( g \) \] & = c_(*) integral_(bb(R)^2) frac(hat(f) \( zeta \) overline(hat(g) \( zeta \)), \| zeta \|^2) thin d zeta\
 & = frac(v, 2 pi) integral.double_(bb(R)^2 times bb(R)^2) f \( x \) log frac(1, \| x - y \|) thin g \( y \) thin d x thin d y . $ <eq:plane-covariance>]

 The same conclusion holds for tests converging in $C_c^oo$ with support in a common compact set.]
] <thm:plane-covariance>

#proof[
  Uniqueness of all vague subsequential limits was proved in 26; relative compactness then gives full vague convergence. To pass to tests, let $A_(delta \, f) \( p \) = sum_u a_(delta \, u) \( f \) e^(i p dot.op u)$ be the transform of the affine interpolation weights. Their exact total mass is zero. On compact sets of $zeta$, $A_(delta \, f) \( delta zeta \) arrow.r hat(f) \( - zeta \)$ uniformly. Moreover, for any fixed integer $N gt.eq 3$, in a fixed neighborhood of zero,
  #[#set math.equation(numbering: n => "(5.17)")
   $ \| A_(delta \, f) \( p \) \| lt.eq K_N min {frac(\| p \|, delta) \, \( 1 + \| p \| \/ delta \)^(- N)} . $ <eq:smearing-transform-bound>]
  The first bound follows from zero total mass and $sum_u \| a_(delta \, u) \| thin \| u \| = O \( delta^(- 1) \)$. For the second, view $a_(delta \, u)$ as the sample at $u$ of the smooth test convolved with the compact nodal hat. Each lattice difference gains a factor $delta$; $N$ summations by parts give the estimate. On the complement of the neighborhood the same argument gives $O \( delta^N \)$, since at least one basis difference $\| e^(i p dot.op e_i) - 1 \|$ is bounded below.
  Using 20, the squared-transform integral over $\| p \| < epsilon delta$ is $O \( epsilon^2 \)$, and that over $R delta < \| p \|$ within the neighborhood is $O \( R^(- 2 N) \)$. The remaining part tends to zero by local finiteness and the $O \( delta^N \)$ bound. On the intermediate annulus, vague convergence and the uniform transform limit apply. Polarization proves the first equality in (5.16). Its second equality is the Fourier representation of the planar inverse Laplacian on zero-integral tests, whose kernel is $\( 2 pi \)^(- 1) log \( 1 \/ \| x - y \| \)$. Height inversion symmetry makes all these zero-total plane statistics have mean zero. Uniform bounds in (5.17) prove the assertion for varying tests.
  It remains to prove strict positivity. Choose two nonnegative smooth tests of mass one supported on disjoint disks, and let $f$ be their difference. By 7, with probability bounded below uniformly in mesh, two nested opposite-sign $B$ double cuts surround one disk and avoid the other. The collar contains no pins. The component switch of 15 then supplies a fair $W$-component label which changes $H_delta \( f \)$ by exactly four when flipped. Conditional on all other labels its variance is four. Averaging yields a fixed positive lower bound for $bb(E) H_delta \( f \)^2$. The covariance limit just proved forces $c_(*) > 0$. Its finiteness follows already from the annular mass bound. ◻
]

#thm([Corollary 5.11.])[
  (Reflection null vector).  #emph[Let $phi.alt in C_c^oo \( bb(R)^2 \)$ be supported strictly on one side of a line parallel to a lattice reflection direction. Choose site rows $ell_delta$ converging to that line, still separated from the support by a positive margin. For 
#[#set math.equation(numbering: n => "(5.18)")
 $ X_delta = H_delta \( Delta phi.alt \) \, $ <eq:laplace-insertion>]

 its reflection norm at $ell_delta$ tends to zero. This holds in every finite phase augmentation of 18, and also for lattice translations and reflected placements converging to the stated configuration.]
] <cor:reflection-null>

#proof[
  The squared norm is $bb(E) \[ \( Theta_(ell_delta) X_delta \) X_delta \]$. By 27, it converges to the inverse-Laplacian pairing of $Delta phi.alt$ and its reflected copy, multiplied by $v$. That pairing is $integral nabla phi.alt dot.op nabla \( phi.alt compose theta \)$, and is zero because the supports are disjoint. Reflection positivity makes these squared norms nonnegative. Auxiliary phases do not change the expectation of a statistic which does not use them. Converging placements are covered by the varying-test assertion of 27. The conclusion concerns the reflection norm; the ordinary variance of $X_delta$ need not vanish. ◻
]

== 6 An absolutely convergent formula for the normalization <sec:normalization>

The spectral constant can be specified entirely by finite counting problems. This section fixes every ingredient of the formula and proves convergence of its indicated terms. The construction is independent of a domain and its marked boundary points.

Choose the even smooth cutoff

#[#set math.equation(numbering: n => "(6.1)")
 $ q \( s \) = cases(delim: "{", 1 \, & \| s \| lt.eq 1 \/ 2 \,, frac(e^(- 1 \/ \( 1 - \| s \| \)), e^(- 1 \/ \( 1 - \| s \| \)) + e^(- 1 \/ \( \| s \| - 1 \/ 2 \))) \, & 1 \/ 2 < \| s \| < 1 \,, 0 \, & \| s \| gt.eq 1 .) $ <eq:explicit-cutoff>]

For $j = 0 \, 1 \, 2 \, dots.h$, define a smooth function on the reciprocal torus by

#[#set math.equation(numbering: n => "(6.2)")
 $ F_j \( p \) = q \( 4 \| p \| \) cos \( 4 arg p \) #scale(x: 120%, y: 120%)[\[] q \( 2^j k \) - q \( 2^(j + 1) k \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) p = \( k \, l \) \, $ <eq:normalization-multiplier>]

using its expression in the disk $\| p \| < 1 \/ 4$, and zero outside that disk. Set $F_j \( 0 \) = 0$. Smoothness at the apparent angular singularity follows because the bracket vanishes whenever $\| k \| lt.eq 2^(- j - 2)$. Let $d_(j u)$, $u in bb(T)$, be its Fourier coefficients, with the convention

#[#set math.equation(numbering: n => "(6.3)")
 $ F_j \( p \) = sum_(u in bb(T)) d_(j u) e^(i p dot.op u) \, #h(2em) d_(j u) = frac(A_(bb(T)), \( 2 pi \)^2) integral_(hat(bb(T))) F_j \( p \) e^(- i p dot.op u) thin d p \, #h(2em) A_(bb(T)) = sqrt(3) / 2 . $ <eq:normalization-fourier>]

Here the integral uses Euclidean measure on any fundamental representative of the torus, whose area is $\( 2 pi \)^2 \/ A_(bb(T))$. The coefficients are real and satisfy $d_(j \, - u) = d_(j u)$, because $F_j$ is real and even.

For $j \, s gt.eq 0$, put

#[#set math.equation(numbering: n => "(6.4)")
 $ R_(j s) = 2^(\( j + s + 4 \)^2) \, #h(2em) cal(H)_R = { u in bb(T) : "dist"_(bb(T)) \( 0 \, u \) lt.eq R } . $ <eq:normalization-radii>]

Let $chevron.l dot.op chevron.r_R$ be uniform averaging over all pairs $B \, W in { - 1 \, + 1 }^(cal(H)_R)$ for which both colors do not change on the same nearest-neighbor edge. There are no boundary pins. For $\| u \| lt.eq sqrt(R)$, choose any lattice path $gamma_(0 u)$ in $cal(H)_R$, oriented from $0$ to $u$, and set

#[#set math.equation(numbering: n => "(6.5)")
 $ b_(j s) = sum_(u in bb(T)\
\| u \| lt.eq sqrt(R_(j s))) d_(j u) ⟨(sum_(x y in gamma_(0 u)) frac(W_x B_y - B_x W_y, 2))^2⟩_(R_(j s)) . $ <eq:finite-band-coefficient>]

The curl identity for the spin encoding makes this independent of the paths. The expression is a finite sum of prescribed Fourier coefficients and ratios of finite integer counts.

#thm([Proposition 6.1.])[
  (Finite-volume normalization series).  #emph[The series of the indicated terms is absolutely convergent: 
#[#set math.equation(numbering: n => "(6.6)")
 $ sum_(j gt.eq 0) \| b_(j 0) \| + sum_(j \, s gt.eq 0) \| b_(j \, s + 1) - b_(j s) \| < oo . $ <eq:normalization-absolute>]

 Its value satisfies 
#[#set math.equation(numbering: n => "(6.7)")
 $ c_(*) = 1 / pi sum_(j gt.eq 0) [b_(j 0) + sum_(s gt.eq 0) \( b_(j \, s + 1) - b_(j s) \)] > 0 \, #h(2em) sigma = 4 pi sqrt(c_(*)) . $ <eq:finite-normalization>]

 Thus the displayed formula specifies a strictly positive universal normalization using only (6.1), (6.2), (6.3), (6.4), (6.5).]
] <prop:normalization-series>

#proof[
  Write
  $ V \( u \) = bb(E) #scale(x: 120%, y: 120%)[\(] H \( u \) - H \( 0 \) #scale(x: 120%, y: 120%)[\)]^2 \, #h(2em) b_j = sum_(u in bb(T)) d_(j u) V \( u \) . $
  The height rule gives $V \( u \) lt.eq K \| u \|^2$ for $u eq.not 0$. For each fixed $j$, Fourier smoothness makes the series defining $b_j$ absolutely convergent. By (5.2),
  $ V \( u \) = 2 integral \( 1 - cos \( p dot.op u \) \) thin C \( d p \) . $
  Interchanging the sum and integral is legitimate even though $C$ has infinite mass near zero: the absolute integral is bounded by $sum_u \| d_(j u) \| V \( u \) < oo$. Since $sum_u d_(j u) = F_j \( 0 \) = 0$ and $sum_u d_(j u) cos \( p dot.op u \) = F_j \( p \)$, we obtain
  #[#set math.equation(numbering: n => "(6.8)")
   $ b_j = - 2 integral F_j \( p \) thin C \( d p \) = - 2 I_j . $ <eq:band-inversion>]
  It follows from 26 that
  #[#set math.equation(numbering: n => "(6.9)")
   $ sum_(j gt.eq 0) \| b_j \| < oo \, #h(2em) sum_(j gt.eq 0) b_j = pi c_(*) . $ <eq:infinite-band-sum>]
  We next bound the finite-volume error uniformly in both indices. Differentiating (6.2) a fixed number of times gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ \| d_(j u) \| lt.eq K thin 2^(A j) \( 1 + \| u \| \)^(- 8) $ <eq:band-fourier-decay>]
  for fixed finite constants $K \, A$. Indeed, on the support of the horizontal bracket we have $\| p \| gt.eq \| k \| gt.eq 2^(- j - 2)$; derivatives of the angular factor and of the rescaled cutoff therefore cost only a fixed power of $2^j$. Integration by parts in a basis of torus coordinates gives the displayed decay.
  Let $V_R \( u \)$ denote the finite-hexagon expectation in (6.5). Reduce the exponent in 8, if necessary, to $0 < alpha lt.eq 1$. For $0 < \| u \| lt.eq sqrt(R)$, evaluate the increment along a shortest path contained in a ball of radius $K \| u \|$. This is permitted by path independence. Both its finite and infinite versions have square at most $K \| u \|^2$. Coupling inside this ball gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ \| V_R \( u \) - V \( u \) \| lt.eq K \| u \|^2 (frac(\| u \|, R))^alpha . $ <eq:finite-variance-error>]
  The distance to the free outer boundary is comparable to $R$, uniformly in the stated range. Combining (6.10), (6.11), the error in the retained part of the coefficient is at most
  $ K 2^(A j) R^(- alpha) sum_(u in bb(T)) \( 1 + \| u \| \)^(- 8) \| u \|^(2 + alpha) lt.eq K' 2^(A j) R^(- alpha) . $
  The omitted tail is at most
  $ K 2^(A j) sum_(\| u \| > sqrt(R)) \( 1 + \| u \| \)^(- 8) \| u \|^2 lt.eq K' 2^(A j) R^(- 2) . $
  Consequently, for some fixed $beta > 0$,
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| b_(j s) - b_j \| lt.eq K 2^(A j) R_(j s)^(- beta) . $ <eq:finite-band-error>]
  All constants here are independent of $j \, s$.
  Put $e_(j s) = b_(j s) - b_j$. The particular radii in (6.4) make $sum_(j \, s) \| e_(j s) \| < oo$, since a negative quadratic exponent dominates $A j$. Moreover,
  $ \| b_(j \, s + 1) - b_(j s) \| lt.eq \| e_(j \, s + 1) \| + \| e_(j s) \| \, #h(2em) \| b_(j 0) \| lt.eq \| b_j \| + \| e_(j 0) \| . $
  Together with (6.9), this proves (6.6). For every $j$, telescoping gives $b_(j 0) + sum_s \( b_(j \, s + 1) - b_(j s) \) = b_j$, and then (6.9) gives the first identity in (6.7). Its positivity was proved in 27. Finally, the covariance coefficient for $H$ is $v = \( 2 pi \)^2 c_(*)$. The centered odd height is twice the centered integer height, so its covariance coefficient is $4 v$, whose positive square root is $4 pi sqrt(c_(*))$. ◻
]

#prodef([Remark 6.2.])[
  (The fundamental-cell convention).  There is no further triangular-cell factor in (6.7). If $lambda_u$ is the unit-mesh nodal hat, then $integral lambda_u = A_(bb(T))$. Thus the physical interpolation weight is
  $ a_(delta \, u) \( f \) = delta^2 integral_(bb(R)^2) lambda_0 \( y \) f \( delta u + delta y \) thin d y . $
  The hat mass $A_(bb(T)) delta^2$ cancels the site density $\( A_(bb(T)) delta^2 \)^(- 1)$ in the limit of the transform at $p = delta zeta$. Its limit is $hat(f) \( - zeta \)$, with no prefactor. The reciprocal-cell factor in (6.3) is already part of the Fourier coefficients used in (6.8). The only remaining comparison is between $c_(*) integral \| hat(f) \( zeta \) \|^2 \| zeta \|^(- 2) thin d zeta$ and the conventional inverse-Laplacian covariance $\( 2 pi \)^(- 2) integral \| hat(f) \( zeta \) \|^2 \| zeta \|^(- 2) thin d zeta$. This accounts for $v = \( 2 pi \)^2 c_(*)$.
] <rem:cell-area>

With the normalization fixed, we return to the reflection-null identity of 28. In 7 we transfer that identity to laws conditioned on the boundary pins.

== 7 Opening and moving boundary pins <sec:pins>

We transfer the plane reflection identity to two laws that bracket the boundary problem. Three separate operations are involved: opening small gaps makes the pin sets into separated arcs; analytic translation moves these arcs to one side of the insertion; and a local coupling closes the gaps. Throughout this section all geometric lengths are in physical coordinates. Every fixed arrangement is discretized before any of its gaps or windows are shrunk.

Write $g_delta = 0$ on $A_delta^(+)$ and $g_delta = - 1$ on $A_delta^(-)$. A #emph[local increment function in a disk $K$] is a measurable function of the increments on lattice edges in $K$, with a fixed arbitrarily small enlargement of $K$ allowed for interpolation. In particular, if $f in C_c^oo \( K \)$ and $integral f = 0$, then $H_delta \( f \)$ is such a function: its interpolation coefficients have sum zero, and paths joining their vertices can be chosen in the enlarged disk. We use

#[#set math.equation(numbering: n => "(7.1)")
 $ X_delta = H_delta \( Delta phi.alt \) \, #h(2em) F_delta = product_(j = 1)^q F_(j \, delta) \, #h(2em) "supp" phi.alt subset.double K_0 \, $ <eq:pins-insertion>]

where $phi.alt in C_c^oo \( K_0 \)$ is real and each $F_(j \, delta)$ is a local increment function in a disk $K_j$. We assume a uniform bound on $product_j parallel F_(j \, delta) parallel_oo$. The disks $K_1 \, dots.h \, K_q$ may overlap each other. They are disjoint, with positive clearance, from $K_0$. The case $q = 0$ means $F_delta = 1$.

=== 7.1 Windows and actual height brackets <windows-and-actual-height-brackets>

Fix a finite set $cal(L)$ of horizontal levels. Require that every level meeting $partial D$ is a regular value of the height coordinate on $partial D$, and that no level contains a marked point. Its intersections with $partial D$ are finite: transversality makes them isolated, and compactness then makes their number finite. Around every intersection choose a small open boundary arc, called a #emph[window]. The closures of the windows are disjoint and avoid the marks. Choose them small enough that the portions of boundary between successive windows contain nonempty exact-value arcs. We denote this finite window system by $cal(W)$.

The discrete windows are intervals in the boundary parametrization of $D_delta$. Uniform convergence of that parametrization specifies them for all sufficiently small $delta$; their endpoints are rounded to partitions between consecutive boundary vertices. Thus a vertex is assigned to exactly one portion of the boundary. Uniform convergence, rather than the number of discrete crossings of a line, is what determines these windows.

In the plane spin law impose the exact Gray-code pins of $g_delta$ off $cal(W)$. In an upper bracket impose only $B = +$ on every window, and in a lower bracket impose only $B = -$. These finite pin events have positive probability. For example, a double cut around the whole boundary reduces positivity to an admissible finite spin extension; the corresponding bounded height extension supplies one. Anchor the height at an exact-value vertex $v_(*)$ by $H \( v_(*) \) = g_delta \( v_(*) \)$. Let $mu_delta^(+ \, cal(W))$ and $mu_delta^(- \, cal(W))$ be the resulting laws inside $D_delta$.

#thm([Lemma 7.1.])[
  (Boundary brackets).  #emph[The boundary traces in these laws satisfy the following actual integer height constraints: 
#[#set math.equation(numbering: n => "(7.2)")
 $ & upright("off the windows") & upright("on a window")\
mu_delta^(+ \, cal(W)) & H = g_delta & H in { 0 \, 1 }\
mu_delta^(- \, cal(W)) & H = g_delta & H in { - 2 \, - 1 } . $ <eq:bracket-intervals>]

 Conditional on the trace, the interior has the uniform height Gibbs law with that trace. Consequently there is a coupling with the true height law $mu_delta^g$ such that 
#[#set math.equation(numbering: n => "(7.3)")
 $ H_delta^(-) lt.eq H_delta^g lt.eq H_delta^(+) quad upright("at every vertex, and hence after affine interpolation") . $ <eq:bracket-order>]

 The bracket means lie between $- 2$ and $1$. The bounded-boundary smearing estimates of 13 apply to both brackets, uniformly in the sizes and number of windows.]
] <lem:boundary-brackets>

#proof[
  The inverse images of $B = +$ in $bb(Z)$ are the disjoint adjacent pairs ${ 4 t \, 4 t + 1 }$; those of $B = -$ are ${ 4 t - 2 \, 4 t - 1 }$. Along a connected chain with constant $B$, the height cannot move from one such pair to another, since the distance between successive pairs is three. The nearest-neighbor height constraint therefore propagates one pair along the entire chain.
  For an upper window adjoining exact height $0$, this pair is ${ 0 \, 1 }$. If it adjoins exact height $- 1$, its first vertex must have height $0$, again selecting ${ 0 \, 1 }$. For a lower window, height $- 1$ directly selects ${ - 2 \, - 1 }$, and an adjoining exact height $0$ forces the first window vertex to be $- 1$. At a marked transition the exact residues $0$ and $- 1$ select the unique adjacent branches. Starting from $v_(*)$ and following the connected boundary therefore gives (7.2) everywhere, including every later exact-value arc. This proves an integer statement, independent of any choice of representatives modulo four.
  The spin-height bijection and the Gibbs property in 2 identify the conditional interior law. No edge from an interior vertex reaches past the pinned vertex boundary. The upper trace dominates $g_delta$, and the lower trace is dominated by it. Height comparison, applied to each trace and then averaged, gives the two stochastic orders and an ordered coupling. Comparison with constant boundary heights $- 2$ and $1$, whose centered laws are sign-symmetric, bounds the means. The same comparison and 13 give the asserted moment bounds. ◻
]

=== 7.2 Reflection estimates with rare pins <reflection-estimates-with-rare-pins>

Analytic translation across a separating line is also used to propagate correlation identities in the six-vertex argument of #cite(label("DCKLM2026")) Section 7.1, especially Lemma 7.4. Our factors include conditioning on rare obstacle events. The first task is therefore to bound the reflected norms after division by their probabilities; this bound is what permits the same analytic-continuation principle here.

We first record precisely the normalization used when moving pins. An obstacle event $P_i$ below consists of pins on a connected arc, with the following description in a height lift:

#[#set math.equation(numbering: n => "(7.4)")
 $ H \( v \) in I_i \( v \) + 4 t_i quad \( v upright(" on the arc") \) \, #h(2em) t_i in bb(Z) . $ <eq:obstacle-intervals>]

Here the $I_i \( v \)$ are fixed integer intervals, at least one of them is a singleton, and the spin description consists of $B$ pins and $W = +$ on a bounded number of connected subpaths. These are the obstacles of Proposition 3.5, Proposition 4.6. The filled obstacle neighborhoods are pairwise disjoint, as specified in 10. Every unbounded insertion has a pin-free filled test neighborhood, including its cut-search buffer, disjoint from all of them, as in 16. These are fixed positive-clearance conditions. Bounded spectator disks may overlap one another. Constants may depend on this fixed geometry.

The disconnected pin arcs carry separate offsets $4 t_i$. We impose their equality before closing gaps: 16 does not give uniform constants as gaps shrink, whereas common offsets give fixed integer interval constraints after anchoring. Balanced endpoint phases will Fourier-project the event that these offsets agree; see (7.16). To carry those phases through reflections and translations, we use the auxiliary fields of 18. For a real frequency $theta$, set

#[#set math.equation(numbering: n => "(7.5)")
 $ Z_theta \( v \) = U_theta exp { i theta \( H \( v \) - H \( o \) \) } \, $ <eq:haar-phase>]

where $U_theta$ is uniform on the unit circle, independent of the spins; use an independent $U$ for each field being added. The choice of $o$ is immaterial because of Haar invariance, and the original spin and increment law is unchanged. 18 gives stationarity, reflection positivity, and the positive normal transfer for the joint law. Phase values in a half-plane are recovered from its row phases and paths staying in that half-plane, so endpoint phases have the required local support. Frequencies may be arbitrary real numbers; no periodicity of a lifted height is assumed.

Let $theta.alt$ be reflection across a lattice row. On functions supported in its closed positive half-plane, write

#[#set math.equation(numbering: n => "(7.6)")
 $ chevron.l A \, B chevron.r_theta.alt = bb(E) \[ overline(theta.alt A) thin B \] \, #h(2em) parallel A parallel_theta.alt^2 = chevron.l A \, A chevron.r_theta.alt . $ <eq:pins-reflection-product>]

We use the quotient and completion for this positive semidefinite form. Pure normal translation through $tau_delta = sqrt(3) thin delta$ acts there as a positive self-adjoint contraction $S_delta$ by 18.

#thm([Lemma 7.2.])[
  (Normalized reflection bound).  #emph[Suppose the obstacle events $P_1 \, dots.h \, P_m$ and the support of $A$ are strictly on one side of a reflection row. The obstacles have pairwise disjoint filled isolating neighborhoods, and every unbounded insertion in $A$ has a pin-free filled test neighborhood disjoint from them. Choose these neighborhoods inside the same open half-plane. Let $p_i = bb(P) \( P_i \)$ and 
$ V = A product_(i = 1)^m upright(bold(1))_(P_i) / p_i . $

 Assume $A$ is either uniformly bounded or a uniformly bounded function times one smooth zero-total height insertion in such a disk. Bounded factors may include the phase fields (7.5). Then $parallel V parallel_theta.alt lt.eq C$, uniformly as $delta arrow.b 0$. The assertion is uniform when the macroscopic arrangements range over a compact family preserving all the stated positive separations.]
] <lem:normalized-reflection>

#proof[
  Let $P = ⋂_i P_i$ and $J = product_i p_i$. Directly from the definition,
  #[#set math.equation(numbering: n => "(7.7)")
   $ parallel V parallel_theta.alt^2 = frac(bb(E) \[ upright(bold(1))_(P ∩ theta.alt P) overline(theta.alt A) thin A \], J^2) . $ <eq:squared-pin-normalization>]
  There are $2 m$ obstacles in this expression. The strict separation from the row separates the original obstacles from their reflected copies; their individual probabilities are $p_1 \, dots.h \, p_m \, p_1 \, dots.h \, p_m$. Consequently 10 gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(P) \( P ∩ theta.alt P \) lt.eq C product_(i = 1)^m p_i^2 = C J^2 . $ <eq:reflected-pin-product>]
  For bounded $A$ this proves the claim. Otherwise write $A = B Y$, with $B$ bounded and $Y$ the zero-total insertion. 16, applied separately to $Y$ and $theta.alt Y$ in the full reflected obstacle arrangement, gives
  $ bb(E) \[ \| Y thin theta.alt Y \| divides P ∩ theta.alt P \] lt.eq bb(E) \[ \| Y \|^2 divides P ∩ theta.alt P \]^(1 \/ 2) bb(E) \[ \| theta.alt Y \|^2 divides P ∩ theta.alt P \]^(1 \/ 2) lt.eq C . $
  Combining this with (7.8) cancels the #emph[squared] denominator in (7.7). The estimates invoked have uniform constants on the indicated compact families. Unit-modulus phases do not alter them. ◻
]

#thm([Lemma 7.3.])[
  (Analytic translation).  #emph[Partition a finite arrangement of pin obstacles and local factors into two groups strictly separated by projection on a lattice reflection normal $n$. The factors have the form allowed in 32, with at most one unbounded zero-total insertion in the entire arrangement. Move the high group rigidly by $t n$, keeping the low group fixed, and normalize the plane expectation by the product of the individual obstacle probabilities. Denote this quantity, at lattice normal step translations, by $M_delta \( t \)$.]
  #emph[If $M_delta \( t_delta \) arrow.r 0$ for every $t$ in a nonempty open interval $I subset \( 0 \, oo \)$ and lattice-rounded $t_delta arrow.r t$, then $M_delta \( 0 \) arrow.r 0$. The same implication holds with the low group moved in direction $- n$. It also holds along sequences of other fixed placements converging with all the required positive clearances.]
] <lem:analytic-translation>

#proof[
  We prove the high-group version. Choose $eta > 0$ so small that moving this group by $- eta n$ still leaves a fixed positive projection gap. Put $eta_delta = N_delta tau_delta arrow.r eta$ with $N_delta in bb(N)$, and use the translated arrangement at $- eta_delta$ as the initial arrangement. Choose a lattice reflection row in its gap, tending to a row strictly in the limiting gap. Reflect and conjugate the normalized low-group factor to obtain a positive-side Hilbert vector $A_delta$; denote the normalized high-group factor at $- eta_delta$ by $B_delta$. Individual obstacle probabilities are invariant under these lattice translations and reflections. By 32,
  #[#set math.equation(numbering: n => "(7.9)")
   $ parallel A_delta parallel_theta.alt \, med parallel B_delta parallel_theta.alt lt.eq C . $ <eq:analytic-side-bound>]
  For $"Re" z > - eta_delta$ define
  #[#set math.equation(numbering: n => "(7.10)")
   $ f_delta \( z \) = chevron.l A_delta \, S_delta^(\( z + eta_delta \) \/ tau_delta) B_delta chevron.r_theta.alt . $ <eq:analytic-matrix-element>]
  If $S_delta = integral_(\[ 0 \, 1 \]) lambda thin d E_delta \( lambda \)$, the power in this formula means
  $ S_delta^w = integral_(\( 0 \, 1 \]) e^(w log lambda) thin d E_delta \( lambda \) \, #h(2em) "Re" w > 0 . $
  Its value on the zero spectral subspace is zero. It is holomorphic in this open half-plane and has operator norm at most one. Holomorphy follows, for example, by dominated differentiation on compact subsets, using boundedness of $lambda^a \| log lambda \|^k$ for $a > 0$. Thus (7.9) makes $f_delta$ uniformly bounded. For small $delta$ all these functions are defined on the common half-plane $"Re" z > - eta \/ 2$. This open half-plane contains zero in its interior.
  At every lattice parameter $t = m tau_delta gt.eq 0$ the exponent in (7.10) is the positive integer $m + N_delta$, so the transfer interpretation gives exactly $f_delta \( t \) = M_delta \( t \)$. There is no assertion here about the spectral power at the initial boundary point $- eta_delta$. Cauchy’s estimate on compact subsets gives a uniform derivative bound, so replacing a real parameter by its nearest lattice parameter changes $f_delta$ by $o \( 1 \)$.
  Along any subsequence, the normal-family theorem supplies a further subsequence converging locally uniformly to a holomorphic function $f$. The hypothesis makes $f$ zero on $I$. The identity theorem then makes it zero throughout the common half-plane, in particular at zero. Every subsequence has this property, proving the claim. Choose the filled neighborhoods strictly inside the two separated projection regions. Rigid motion preserves their within-group separations, while moving the groups apart preserves their projection gap. The initial negative backoff is smaller than that gap. Reflected copies likewise have disjoint filled neighborhoods by their positive row margin. These observations verify the geometric hypotheses of the side norm bounds throughout the motion. Convergent variations of the other placements preserve those bounds and the common half-plane. Replacing $n$ by $- n$ proves the low-group version. ◻
]

=== 7.3 Gaps and three directions of motion <gaps-and-three-directions-of-motion>

Choose two levels $ell_(-) < ell_(+)$ from $cal(L)$ such that $K_0$ lies strictly between them and neither line meets any $K_j$, $j gt.eq 1$. All these separations have positive margins. Inside each window based at an intersection with these two levels, remove a still smaller boundary subarc from the pin set. These are the #emph[gaps]. For now their sizes are fixed and positive. They are chosen to contain the boundary portions in a sufficiently thin strip about their level, so that all remaining pins stay a positive distance from the two lines. Transversality and uniform boundary convergence ensure this at small mesh, even if the approximating boundary has many crossings inside a window.

The remaining connected pin arcs are the obstacle events $P_1 \, dots.h \, P_m$. At these fixed positive gap sizes they approach finitely many disjoint compact simple arcs. Thin regular neighborhoods with endcaps give pairwise disjoint filled isolating neighborhoods, as in 10; they can avoid the fixed interior test disks. Each arc has its buffered collar inside its own neighborhood. Positive separation from the chosen levels also lets the neighborhoods stay on the same sides of those levels. Each arc contains an exact-value subarc. The branch argument in 31, now applied along an individual arc, shows that it has exactly the interval description (7.4), with

$ I_i \( v \) = { g_delta \( v \) } med upright("off windows") \, #h(2em) I_i \( v \) = { 0 \, 1 } med upright("or") med { - 2 \, - 1 } med upright("on windows") . $

Only the integer offset $t_i$ can differ between distinct arcs. Take an exact-value representative $v_i$ on each arc and put $g_i = g_delta \( v_i \)$.

The geometric separation used below is the following. Set

#[#set math.equation(numbering: n => "(7.11)")
 $ e = \( 0 \, 1 \) \, #h(2em) u = \( sqrt(3) \/ 2 \, 1 \/ 2 \) \, #h(2em) u' = \( - sqrt(3) \/ 2 \, 1 \/ 2 \) . $ <eq:three-normals>]

These are normals to the three lattice reflection directions. The obstacles and spectator disks lying in the middle band must split into two families $L \, R$, with a number $kappa > 0$ such that

#[#set math.equation(numbering: n => "(7.12)")
 $ sup_(x in L) x dot.op u < inf_(x in K_0) x dot.op u - kappa \, #h(2em) inf_(x in R) x dot.op u > sup_(x in K_0) x dot.op u + kappa . $ <eq:middle-projections>]

Here and below a supremum over a family means over the union of its supports. Empty families are omitted. All the remaining obstacles and spectator disks lie wholly above $ell_(+)$ (family $T$) or below $ell_(-)$ (family $B$). Overlapping spectator disks belong to the same family; their factors will always move together.

#thm([Proposition 7.4.])[
  (Identity with separated gaps).  #emph[Fix windows, gaps and tests satisfying the preceding conditions. Let $P = ⋂_(i = 1)^m P_i$ and $J_delta = product_(i = 1)^m bb(P) \( P_i \)$. For any product $Psi_delta$ of unit-modulus phase factors at the representatives $v_i$, 
#[#set math.equation(numbering: n => "(7.13)")
 $ frac(bb(E) \[ X_delta F_delta Psi_delta upright(bold(1))_P \], J_delta) arrow.r 0 . $ <eq:gapped-phase-identity>]

 The phases may have arbitrary fixed real frequencies and the independent Haar lifts of (7.5). The assertion is valid for every convergent sequence of lattice-rounded placements with these strict separations.]
  #emph[If $E$ is the event that all offsets in (7.4) agree, then also 
#[#set math.equation(numbering: n => "(7.14)")
 $ frac(bb(E) \[ X_delta F_delta upright(bold(1))_(P ∩ E) \], J_delta) arrow.r 0 . $ <eq:gapped-equal-offset-identity>]

]
] <prop:gapped-identity>

#proof[
  We first prove (7.13). Include each representative phase factor with its obstacle. Move all supports apart by the following sequence of one-sided translations. Each translation is across a strict projection gap and moves the entire selected side rigidly.
  First move $T$ by $a_(+) e$ and $B$ by $- a_(-) e$, successively. These are legitimate moves across the original horizontal gaps. Choose the positive distances sufficiently large that $T$ is above $K_0$ in $u$-projection and $B$ is below it in that projection. Together with (7.12), the two combined families
  $ Q_(+) = T union R \, #h(2em) Q_(-) = B union L $
  are now strictly above and below $K_0$ in $u$-projection.
  Next move $Q_(+)$ by $b u$ and $Q_(-)$ by $- c u$, successively. Choose $b$ large enough that all of $Q_(+)$ is strictly above $K_0$ in vertical coordinate, and strictly below $K_0$ in $u'$-projection. This is possible because $u dot.op e = 1 \/ 2$ and $u dot.op u' = - 1 \/ 2$. Then choose $c$ large enough that all of $Q_(-)$ lies strictly above $K_0 union Q_(+)$ in $u'$-projection. Each of these moves increases its separating $u$-gap. No separation within either combined family changes.
  Finally move $Q_(-)$ by $d u'$. Its $u'$-projection is already separated from every other support, so this is another legitimate one-sided move. Because $u' dot.op e = 1 \/ 2$, a sufficiently large $d$ puts all of $Q_(-)$ strictly above $K_0$ vertically. Thus every factor other than $X_delta$ is now strictly above $K_0$. All choices can be made in open ranges with positive margins; every finite choice leaves a fixed finite arrangement. The successive strict projection gaps also keep different moving families disjoint, while distances inside each moving family are preserved. In particular, all individual arc collars remain available. 1 illustrates the three directions.
  At the final placement put a horizontal reflection row between $K_0$ and all the other supports. Reflection Cauchy–Schwarz and 32 bound the normalized expectation by
  $ C parallel X_delta parallel_theta.alt . $
  The norm tends to zero by 28. That corollary remains valid in the phase-augmented Hilbert space, since $X_delta$ itself does not involve phases and its reflection inner product is unchanged by their addition.
  For every fixed admissible $a_(+) \, a_(-) \, b \, c$, this proves vanishing for $d$ in a sufficiently large open interval. Apply 33 to remove the last move. The same argument then applies for every sufficiently large $c$ with $a_(+) \, a_(-) \, b$ fixed, so it removes the $- c u$ move. Remove $b u$, $- a_(-) e$ and $a_(+) e$ in that order, each time using an open interval of allowed large values. This is successive one-variable analytic continuation; no simultaneous motion through surrounding pins is involved. It proves (7.13) at the original placement.
  To impose $E$, note that on $P$
  $ D_i = frac(H \( v_i \) - g_i - H \( v_1 \) + g_1, 4) = t_i - t_1 in bb(Z) quad \( 2 lt.eq i lt.eq m \) . $
  For $s = \( s_2 \, dots.h \, s_m \) in \[ 0 \, 2 pi \]^(m - 1)$,
  #[#set math.equation(numbering: n => "(7.15)")
   $ e^(i sum_(i = 2)^m s_i D_i) = product_(i = 2)^m e^(- i s_i \( g_i - g_1 \) \/ 4) Z_(s_i \/ 4)^(\( i \)) \( v_i \) overline(Z_(s_i \/ 4)^(\( i \)) \( v_1 \)) . $ <eq:balanced-offset-phases>]
  Use an independent phase field for each $i$ on the right. Every Haar factor cancels with its conjugate. Hence this is an identity of functions of the original increments, including for unbounded relative lifts. Fourier orthogonality gives exactly
  #[#set math.equation(numbering: n => "(7.16)")
   $ upright(bold(1))_E = \( 2 pi \)^(- \( m - 1 \)) integral_(\[ 0 \, 2 pi \]^(m - 1)) e^(i sum_(i = 2)^m s_i D_i) thin d s quad upright("on ") P . $ <eq:fourier-offset-equality>]
  For each fixed $s$, the normalized expectation tends to zero by (7.13). Its absolute value is bounded uniformly in $s$ and $delta$: indeed
  $ frac(bb(E) \[ \| X_delta F_delta \| upright(bold(1))_P \], J_delta) lt.eq frac(bb(P) \( P \), J_delta) thin parallel F_delta parallel_oo thin bb(E) \[ \| X_delta \| divides P \] lt.eq C $
  by Proposition 3.5, Proposition 4.6 at this fixed gap geometry. Dominated convergence in (7.16) proves (7.14). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.25, 0.55), (1.25, 0.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-1.25, -0.55), (1.25, -0.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0, 0), [#text(size: 9pt)[$X$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((-1, 0), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$L$]]])])
  content((1, 0), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$R$]]])])
  content((0, 0.95), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$T$]]])])
  content((0, -0.95), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B$]]])])
  line((0, 1.32), (0, 1.88), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((0, -1.32), (0, -1.88), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((0, -2.4), [#text(size: 9pt)[1. Vertical separation#linebreak()$+e$ and $-e$]])
  line((3.8, 1.22), (5.2, -1.22), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((4.5, 0), [#text(size: 9pt)[$X$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((5.42, 0.56), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$T,R$]]])])
  content((3.58, -0.56), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B,L$]]])])
  line((5.85, 0.82), (6.45, 1.17), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((6.45, 1.17), [#text(size: 9pt)[$u$]], anchor: "west", padding: 0.1176cm)
  line((3.15, -0.82), (2.55, -1.17), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((4.5, -2.4), [#text(size: 9pt)[2. Oblique separation#linebreak()$+u$ and $-u$]])
  content((10, 0), [#text(size: 9pt)[$X$]], frame: "circle", padding: 0.07056cm, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((11.04, 1.1), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$T,R$]]])])
  content((9.35, -0.7), [#box(width: 0.8cm, height: 0.6cm, inset: 0.3333em, radius: 3pt, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B,L$]]])])
  line((8.94, -0.35), (7.208, 0.65), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((7.208, 0.65), [#text(size: 9pt)[$u'$]], anchor: "south", padding: 0.1176cm)
  line((7.85, 0.48), (11.55, 0.48), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((10, -2.4), [#text(size: 9pt)[3. Raise the remaining group#linebreak()along $+u'$]])
})],
  caption: [Figure 1: The three normal directions used to move the obstacles. Each shaded group denotes all of its arc obstacles and local test factors. The insertion $X$ stays fixed. Vertical moves first separate $T$ and $B$; the $u$ moves separate $T union R$ and $B union L$; for a sufficiently large final displacement, the $u'$ move places the latter above $X$. The relation $u dot.op u' = - 1 \/ 2$ supplies the projection gap for the last move. Distances are chosen successively; the drawing is schematic. ],
) <fig:pin-moving>

=== 7.4 Equal offsets and filling the gaps <equal-offsets-and-filling-the-gaps>

Keep $cal(W)$ fixed. Around each selected intersection choose a small physical neighborhood contained in its single-color window, disjoint from all test disks and from all other such neighborhoods. In particular there are no $W$ pins in these neighborhoods. Let $r > 0$ be a sufficiently small fixed size for them. Shrink the gaps so that each lies within a ball of radius $a lt.double r$ about its intersection. This is possible by transversality. Constants in what follows can depend on $cal(W)$ and $r$, but not on $a$ or on sufficiently small $delta$. We write $o_delta \( 1 \)$ with $a$ fixed.

Let $mu_(delta \, a)$ be the plane law conditioned on the gapped pins. Let $mu_(delta \, a)^(=) = mu_(delta \, a) \( thin dot.op divides E \)$, whenever $E$ has positive probability. Finally let $mu_(delta \, 0)$ denote the filled bracket. All these notations refer to one chosen sign of the bracket.

#thm([Lemma 7.5.])[
  (Gap filling).  #emph[There are $beta > 0$ and a function $epsilon.alt \( a \) arrow.r 0$ as $a arrow.b 0$ such that 
#[#set math.equation(numbering: n => "(7.17)")
 $ limsup_(delta arrow.b 0) mu_(delta \, a) \( E^c \) lt.eq epsilon.alt \( a \) . $ <eq:offset-high-probability>]

 If $cal(I)_delta$ is the joint increment information in the fixed test disks, then 
#[#set math.equation(numbering: n => "(7.18)")
 $ limsup_(delta arrow.b 0) parallel mu_(delta \, a)^(=) \|_(cal(I)_delta) - mu_(delta \, 0) \|_(cal(I)_delta) parallel_(upright("TV")) lt.eq epsilon.alt \( a \) . $ <eq:gap-tv>]

 For every finite $p$, and for all sufficiently small $a$, the variables $X_delta$ have uniformly bounded $p$th moments under $mu_(delta \, a)^(=)$ and under $mu_(delta \, 0)$, in the sense of a bound on $limsup_(delta arrow.b 0)$ independent of $a$. No such uniform assertion is needed for the law conditioned on $E^c$.]
] <lem:gap-filling>

#proof[
  First replace each requirement $W = +$ by the requirement that $W$ be constant on that subpath, and call the resulting edge equalities $E_0$. If there are $M$ prescribed subpaths, then, conditional on $B$ and $E_0$, requiring all their component labels to be plus has probability between $2^(- M)$ and one. The number $M$ is fixed by the original windows and does not grow as gaps shrink.
  Consider one gap. In the annulus from scale $C a$ to scale $r$, the only pins are $B$ pins of the desired window sign. There are no $E_0$ edges there. The favorable-pin version of 7, used in a logarithmic collection of separated annular slots, therefore gives a double circuit of that sign surrounding the gap except with probability
  $ C \( a \/ r \)^beta + o_delta \( 1 \) . $
  This estimate holds before any offset equality has been imposed. The two adjoining pinned boundary arms leave the neighborhood, so a surrounding dual circuit crosses each of them. At a crossing both incident primal sites have the window sign. Consecutive edges of a double circuit also share a connected chain of sites of that sign. Thus the circuit joins the two pinned arms through a connected constant-$B$ chain. The adjacent-pair argument of 31 forces the same lifted pair on both arms. Their offsets are therefore equal.
  The gap adjacency graph of the remaining boundary arcs is a cycle, hence connected. Circuits around all the gaps force every $t_i$ to agree. A union bound over the fixed number of gaps, followed by restoration of the $W = +$ labels at cost at most $2^M$, proves (7.17), with for example a constant multiple of $\( a \/ r \)^beta$ as the error. In particular $mu_(delta \, a) \( E \)$ is bounded away from zero for small $a$ and then small $delta$.
  For the coupling assertion first work with $E_0$ and fill only one gap. All the new $B$ pins have the same sign. The $B$ marginals before and after adding them are ordered, by 3. Use the stopping coupling of 3, based on 5, exploring outwards from the gap and coupling the queried values in this order. In the more adverse law a double circuit of the added sign occurs before the search leaves the window neighborhood with failure probability at most $C \( a \/ r \)^beta + o_delta \( 1 \)$, by the same favorable-pin estimate. On success it is a common double circuit in the two laws. All changed constraints are on its gap side; no $E_0$ edge crosses it. The conditional law on its other side is therefore identical. Sample that side identically, including its $W$ components.
  Do this successively at the finitely many gaps. Searches stay in disjoint window neighborhoods. The resulting coupling matches the joint increments in every test disk and all the $W$ labels that must subsequently be checked, except with probability tending to zero with $a$. This last point uses that the label sites are outside the single-color window neighborhoods. If two laws can be coupled with error $epsilon$ on variables including an event $L$, and both give $L$ probability at least $c > 0$, their restrictions conditioned on $L$ differ in total variation by at most $2 epsilon \/ c$. Indeed, for any event $A$ the numerators $bb(P) \( A ∩ L \)$ differ by at most $epsilon$, as do the two denominators, and division gives the stated bound. Applying this with $c = 2^(- M)$ restores all the required plus labels. It proves the claimed approximation between the unconditioned-offset gapped law and the filled law. Conditioning the former additionally on $E$ changes any marginal by at most $mu_(delta \, a) \( E^c \)$. This proves (7.18), after enlarging $epsilon.alt \( a \)$.
  It remains to check the uniform moments under equal offsets. Fix an annular buffer around $K_0$, with fixed inner and outer radii and positive clearance from $K_0$. Choose its filled interior compactly contained in $D$ and disjoint from all gap neighborhoods, so the buffer and its interior contain no pins. Conditional just on the pins, a double $B$ cut in this buffer has probability at least a fixed $c_0 > 0$. This follows from the local cut estimate and the bounded cost of the plus labels. By (7.17), its probability under additional conditioning on $E$ is at least $c_0 \/ 2$ for all sufficiently small $a$ and then small mesh. Moreover $E$ is measurable outside this cut: relative heights between the representatives can be evaluated on paths in the connected exterior of a disk containing the buffer. Such paths avoid the unrevealed interior of the cut. The usual outside-in cut exploration therefore leaves a Gibbs interior with its bounded-range trace, even after $E$ is imposed.
  All offsets are now common. Anchoring one representative makes the interval restrictions fixed integer intervals, so rounded midpoints require no parity classes. Together with the fixed buffer, these observations verify the hypotheses of 17; it gives the asserted bounds uniformly as the gaps close. The filled law has bounded boundary data by 31, and 13 gives its bounds. This argument does not estimate the exceptional unequal-offset law. ◻
]

#thm([Proposition 7.6.])[
  (Bracket identity).  #emph[Fix a window system $cal(W)$ for a finite grid $cal(L)$, and either bracket from 31. Let $K_0 \, dots.h \, K_q subset.double D$ be disks, with $K_0$ at positive distance from every $K_j$, $j gt.eq 1$, and let $X_delta \, F_delta$ be as in (7.1). Suppose there are two levels $ell_(-) < ell_(+)$ in $cal(L)$ such that:]
  + #emph[$K_0$ is strictly between the two levels, and both levels avoid every spectator disk $K_j$ with positive margin;]
  + #emph[after opening sufficiently small gaps inside their corresponding windows, every pin arc and spectator disk in the middle band belongs to one of the two strictly separated $u$-projection families in (7.12).]
  #emph[Then 
#[#set math.equation(numbering: n => "(7.19)")
 $ lim_(delta arrow.b 0) bb(E)_(mu_delta^(plus.minus \, cal(W))) \[ H_delta \( Delta phi.alt \) F_delta \] = 0 . $ <eq:bracket-identity>]

 In particular it applies to products of bounded continuous functions of finitely many smooth zero-total tests in each $K_j$. There is no disjointness requirement between spectator disks. For this latter class the identity passes to any subsequential distributional limit of the bracket laws.]
  #emph[For any fixed bound $q$ on the number of spectator disks these geometric hypotheses can be arranged locally as follows. Fix $x in D$ and $rho > 0$ with $overline(B \( x \, rho \)) subset D$. Take $K_0$ sufficiently small about $x$, and take at most $q$ spectator disks of sufficiently small radii, all outside $B \( x \, rho \)$. From a sufficiently dense grid of regular levels one can choose the two levels within a fixed small fraction of $rho$ above and below $x$. The choices and smallness bounds depend on $q$ and $rho$, not on the number of terms in a later linear combination of such products.]
] <prop:bracket-identity>

#proof[
  At fixed gaps, 10 gives $bb(P) \( P \) \/ J_delta gt.eq c_a > 0$. By 35, for all sufficiently small fixed $a$, $bb(P) \( E divides P \) gt.eq 1 \/ 2$ at small mesh. Division of (7.14) by $bb(P) \( P ∩ E \) \/ J_delta$ therefore gives
  #[#set math.equation(numbering: n => "(7.20)")
   $ lim_(delta arrow.b 0) bb(E)_(mu_(delta \, a)^(=)) \[ X_delta F_delta \] = 0 . $ <eq:conditional-gapped-identity>]
  The positive number $c_a$ may tend to zero as $a arrow.b 0$; it is used only with $a$ fixed.
  Let $X^(\( T \)) = max \( - T \, min \( X \, T \) \)$ and put $M = sup_delta parallel F_delta parallel_oo$. The total variation bound in 35 applies to $X^(\( T \)) F_delta$, which is a bounded function of the joint test increments. The same lemma, at any $p > 1$, bounds the truncation errors under the equal-offset and filled laws by $C_p M T^(1 - p)$. Consequently
  $ limsup_(delta arrow.b 0) lr(|bb(E)_(mu_(delta \, 0)) \[ X_delta F_delta \]|) lt.eq 2 M T epsilon.alt \( a \) + C_p M T^(1 - p) . $
  First send $a arrow.b 0$ and then $T arrow.r oo$. This proves (7.19). For bounded continuous functions of smooth tests, distributional convergence and the same uniform integrability pass the expectation to a subsequential limit.
  For completeness, here is a quantitative choice of the local geometry in the last assertion. Translate $x$ to the origin. Take $K_0 subset B \( 0 \, rho \/ 1000 \)$ and seek levels in $\( rho \/ 40 \, rho \/ 20 \)$ and $\( - rho \/ 20 \, - rho \/ 40 \)$. Choose spectator radii so small that the total length of their vertical projections is less than half the length of either candidate interval; a bound $rho \/ \( 1000 \( q + 1 \) \)$ on each radius suffices. There is then a nonempty open subinterval of each candidate interval avoiding all spectator disks. Regular values are dense, so a sufficiently dense regular grid supplies both levels, with positive margins.
  Every boundary point in the resulting middle band is outside $B \( 0 \, rho \)$. The same is true of every middle spectator disk by assumption. Since $\| y \| < rho \/ 20$ there, each such point has $\| x \| > sqrt(1 - 1 \/ 400) thin rho$. Its $u$-projection $\( sqrt(3) \/ 2 \) x + y \/ 2$ consequently has magnitude greater than $rho \/ 2$, with the sign of $x$. A connected middle arc or disk cannot change that sign. Thus (7.12) holds with ample margin, whereas all projections of $K_0$ have magnitude at most $rho \/ 1000$. Small gaps and lattice approximation errors preserve the strict inequalities. This proves the geometric assertion. ◻
]

The order of limits is now explicit. The identity for a fixed filled window system is proved by first sending the mesh to zero at fixed positive gaps and then shrinking those gaps. In the boundary comparison below, one subsequently shrinks the windows for each fixed finite grid, and only then refines the grid. The bracket order alone does not identify its law with the true boundary law; the next section supplies the boundary information needed for that step.

== 8 A height arch at a constant boundary arc <sec:boundary>

We now recover the boundary information lost in the single-color windows. Near an arc with prescribed height $k$, we construct a path of height at least $k$ that joins the boundary on both sides of a small exceptional piece. Closing this path through the exterior separates that piece from the rest of the domain. The estimate uses the actual conditional Gibbs law and will also apply to the new boundary traces exposed during this separation. In 9, lower and upper versions identify both the boundary mean and its mixed moments with distant observations.

===== 8.1 Regions, fixed sites, and artificial exterior. <regions-fixed-sites-and-artificial-exterior.>

All graphs in this section are embedded in the triangular lattice of mesh $delta$. A #emph[skeleton] is a finite connected union of lattice edges. The free sites of a region lie in bounded faces of its skeleton. Every neighbor of a free site is either free or a fixed skeleton site; the latter sites are its #emph[usable boundary]. Conditional on the values $eta$ at the usable boundary, the height is uniform among the admissible integer Lipschitz extensions. We always assume that this set is nonempty. Only usable boundary values enter this specification.

Initially the skeleton $S_0$ is a polygon boundary. We also allow it to be the union of that boundary and finitely many simple lattice circuits meeting it. The additional circuits cut off small boundary patches; the chosen remaining free regions are on the other side. Vertices in the removed patches, and vertices exterior to the original polygon, will be declared open artificially. Usable boundary sites are never declared open artificially. Thus, at threshold $a$, the open sites are

#[#set math.equation(numbering: n => "(8.1)")
 $ { v upright(" free or usable") : H \( v \) gt.eq a } med union med { v upright(" outside the region and its usable boundary") } . $ <eq:boundary-open-sites>]

When an additional separator is exposed, its usable sites carry their actual exposed heights. In particular, this convention does not discard a new boundary condition.

Write $Q_r = p + \[ - r \, r \]^2$ in tangent and inward-normal coordinates at a smooth boundary point $p$. The interior is on the positive normal side. An open site circuit surrounding $Q_r$ is called an #emph[arch separator]: its part in the domain joins the clean boundary on the two sides, and its remaining part can run through the artificial exterior. It separates the free sites near $p$ from remote boundary data.

#thm([Theorem 8.1.])[
  (Constant-arc arch estimate).  #emph[There are constants $M > 1$, $c \, C > 0$, and a positive geometric tolerance with the following property. Fix a positive integer $N$ and scales 
#[#set math.equation(numbering: n => "(8.2)")
 $ 16 r < ell_1 < dots.h.c < ell_N < R \/ 10 \, #h(2em) ell_(i + 1) gt.eq M ell_i . $ <eq:arch-scales>]

 Suppose that, in $Q_R$, the limiting boundary is the single graph $y = f \( x \)$, with $f \( 0 \) = f' \( 0 \) = 0$ and $parallel f' parallel_oo$ smaller than the geometric tolerance, and that its inward side is above this graph. The original polygon boundary is a sufficiently fine uniform parametric approximation of this arc and has the same inside and outside away from its shrinking boundary neighborhood. Its approximation error, divided by $ell_1$, tends to zero. A smooth boundary has these properties after decreasing the fixed outer scale. Allow, in addition, a fixed finite number of boundary-attached patch replacements as above, whose diameters are sufficiently small relative to the selected scales. Suppose that the actual usable boundary data satisfy 
#[#set math.equation(numbering: n => "(8.3)")
 $ eta gt.eq k - 2 quad upright("everywhere") \, #h(2em) eta gt.eq k quad upright("on the usable boundary in ") Q_R \\ Q_r \, $ <eq:arch-boundary-data>]

 where $k in bb(Z)$. For sufficiently small mesh and sufficiently fine boundary and replacement approximations, 
#[#set math.equation(numbering: n => "(8.4)")
 $ bb(P)_eta #scale(x: 120%, y: 120%)[\(] upright("an arch at threshold ") k upright(" surrounds ") Q_r upright(" in ") Q_R #scale(x: 120%, y: 120%)[\)] gt.eq 1 - C e^(- c N) . $ <eq:arch-high-probability>]

 The constants do not depend on the boundary heights or on the number of vertices in a boundary or separator. They also do not depend on the fixed number of tiny replacements; the required approximation accuracy may do so. There is a reversed statement with $eta lt.eq k + 2$, clean data $eta lt.eq k$, and a separator at height at most $k$.]
] <thm:boundary-arches>

The order of quantifiers is part of the statement. One first chooses the number and the positive scales of the comparison boxes. The mesh and the parametric boundary error then tend to zero, and the diameters of the fixed finite family of replacements tend to zero relative to these boxes. Consequently, the error tends to zero as the number of available scales between a central exception and the end of a clean arc tends to infinity. There is no assertion uniform over unresolved geometry at the mesh scale. The lower estimate has no upper bound on $eta$ as a hypothesis. It therefore applies to bounded boundary data and also, conditionally, to the possibly larger random values revealed on a preliminary separator.

The proof first constructs many pairs of weaker separators, at height $k - 1$. Selecting the inner separator from its inner side and the outer separator from its outer side leaves an unexamined Gibbs region between them. These retained middle regions are conditionally independent. In each one we then build two attachments from the clean boundary at the required height $k$, and join them by bulk paths. A fixed positive chance of this upgrade in each retained region gives the exponential error in (8.4).

The attachment is the main step: a synthetic mean comparison first detects the high side of a boundary-entering level contour; two low lateral barriers then force the adjacent path at height $k$ to rise into the domain. Closed high islands alone would not give an attachment. All boxes in this construction have fixed positive relative margins. After they have been chosen, the mesh is small enough that rounding preserves their separation and intersection properties.

=== 8.1 An anchored two-interval comparison <an-anchored-two-interval-comparison>

For any $k$, one of the two Gray-code colors, denoted by $t$, and one of its signs $s$, describe the two adjacent residues in $\[ k - 1 \, k \]$. The opposite sign of the same color describes $\[ k - 3 \, k - 2 \]$. Denote the complementary color by $v$. The transition from the low interval to the high interval can only be the step

#[#set math.equation(numbering: n => "(8.5)")
 $ k - 2 arrow.l.r k - 1 . $ <eq:anchored-transition>]

The complementary color has the same value, say $c_k$, at both ends of this step, and this is the same value at every such transition.

Here is the comparison we shall repeatedly use. On a connected skeleton $S$, assign the sign $s$ to selected connected portions and $- s$ elsewhere. Require $v = c_k$ at each of a bounded number $b$ of transition edges, and anchor the lift by (8.5) at one of them. A constant-$t$ chain stays in one adjacent pair of integers: a nearest-neighbor step cannot move to the next pair with the same residue color. A transition with the prescribed complementary color fixes the next pair. Connectedness therefore gives the exact bounds

#[#set math.equation(numbering: n => "(8.6)")
 $ K in \[ k - 1 \, k \] upright(" on the high portions") \, #h(2em) K in \[ k - 3 \, k - 2 \] upright(" on the low portions") . $ <eq:synthetic-intervals>]

Extra lattice edges between pinned vertices only impose additional compatibility; they do not introduce new branches of the lift. In particular the prescription is nonempty: taking $v equiv c_k$ gives just the two values in (8.5).

Construct this synthetic height in a larger, finite, simply connected free lattice volume containing $S$ and all comparison boxes. Given $t$, the complementary color is constant on each component of $t$-changing edges and its component labels are independent fair signs. The transition requirements have conditional probability at least $2^(- b)$. The same lower bound holds if some transition sites belong to one component, since all requested labels are $c_k$.

Suppose the actual boundary is at least $k$ on the selected high portions and at least $k - 2$ elsewhere. Every possible synthetic usable trace is then bounded above by the actual trace. Conditional on its trace, the synthetic interior is a uniform height Gibbs law. Height comparison, which follows from the min/max lattice condition, gives

#[#set math.equation(numbering: n => "(8.7)")
 $ K \|_(upright("free sites")) prec.curly.eq H \|_(upright("free sites")) . $ <eq:synthetic-height-domination>]

This compares the interiors with their actual fixed traces; no observation of an unconditioned boundary is substituted for boundary pinning.

The prescriptions used below have at most four transitions on the base polygon. For tiny replacements, choose those transition points away from the attachment neighborhoods and give an entire replacement the local prescription of its base arc. Its branch is then anchored through that arc and it adds no transition. To justify this uniformly, fix the finitely many selected boxes and the finitely many replacements first. Uniform parametric convergence to a simple smooth arc implies that the attachment points of a replacement of vanishing diameter lie in one vanishing parameter interval. The transition points can be chosen in their prescribed positive-width buffers outside all these intervals. No bound on the length or the number of vertices of a replacement is needed.

=== 8.2 Preliminary separators and genuine stopping explorations <preliminary-separators-and-genuine-stopping-explorations>

#thm([Lemma 8.2.])[
  (Many preliminary pairs).  #emph[Under the hypotheses of 37, with probability at least $1 - C_0 e^(- c_0 N)$, at least $c_0 N$ of the selected scales have both an open site circuit at threshold $k - 1$ in 
#[#set math.equation(numbering: n => "(8.8)")
 $ Q_(ell_i) \\ Q_(ell_i \/ 2) quad upright("and one in") quad Q_(7 ell_i) \\ Q_(5 ell_i) \, $ <eq:preliminary-strips>]

 each surrounding its inner box. Artificially open sites are as in (8.1).]
] <lem:preliminary-circuits>

#proof[
  Apply the anchored comparison with the high interval on the two clean portions of the base arc running from just inside the innermost comparison strip to beyond the outermost strip. If a central exception is present, the two portions are separated by a low central portion. The other skeleton sites receive the low interval. The transition buffers are disjoint from all the strips and their surrounding buffers. The bounds in (8.3) give (8.7).
  Before imposing the complementary transition labels, every pin in a buffer used for a $t = s$ double circuit is favorable. By 7, there is a constant $a > 0$ such that, conditional on all first-color spins outside a block buffer, a pair of such double circuits in slightly narrower versions of (8.8) has probability at least $a$. Choose $M$ so that the block buffers are disjoint. Successive revelation of these buffers gives the same lower bound conditional on the preceding outcomes. Indeed, for $lambda > 0$ and the success indicators $I_i$,
  $ bb(E) exp #h(-0.16667em) (- lambda sum_(i = 1)^N I_i) lt.eq \( 1 - a + a e^(- lambda) \)^N . $
  It follows that $sum I_i gt.eq a N \/ 2$ except with probability $C e^(- c N)$. Requiring at most four complementary labels multiplies this failure bound by at most $2^4$.
  Each double circuit meets the high part of the skeleton: the original boundary has a segment from the inner box to the exterior of the outer box. The adjacent faces along the double circuit all have the same first color and, by continuation from that intersection, their lifts lie in the anchored pair $\[ k - 1 \, k \]$. The corresponding closed primal walk stays within a bounded number of lattice spacings of the dual circuit and has winding number one about the inner box. It contains a simple surrounding site circuit. This produces the preliminary circuits in the synthetic height. The event that at least a given number of pairs exist is increasing in the height, so (8.7) transfers its probability to the actual law. ◻
]

We now select the preliminary pairs by exploring the actual height law. The synthetic configuration used to bound their abundance plays no part in this selection.

#thm([Lemma 8.3.])[
  (Extremal-circuit stopping).  #emph[In a deterministic annular strip, good surrounding simple site circuits have inner and outer envelopes. The innermost such circuit can be selected by revealing the strip from its inner side; the outermost can be selected from its outer side. In each case the selection and the revealed values are measurable with respect to the sites on the circuit and on the tested side. No height on the untested side is conditioned by the selection.]
  #emph[In particular, in each successful block of 38, select an innermost circuit $C_i^(-)$ in the inner strip and an outermost circuit $C_i^(+)$ in the outer strip. Conditional on these selections and the full configuration outside the intervening free regions, those regions have independent Gibbs interiors with their revealed boundary values.]
] <lem:extremal-stopping>

#proof[
  If two surrounding simple cycles have at least two common vertices, their union is two-vertex-connected. After deleting any one vertex, the remaining part of each cycle is connected and the two parts still share a vertex. Its complementary face containing the inner box and its unbounded face therefore have simple cycle boundaries. These boundaries are the inner and outer envelopes. They use only good vertices of the original cycles and stay in the same strip. If there is only one common vertex, the two cycles cannot cross just once. Since both enclose the inner box, their interiors are nested. Disjoint surrounding cycles are nested as well. Iterating the envelope operation in the finite strip gives the extremal circuit, regarded without an orientation.
  For a specified good circuit $C$, whether it is the inner extremal circuit can be decided from its closed inner side in the strip. A competing circuit that improved it while partly leaving that side would have an inner envelope with $C$ that is itself a better good circuit entirely on that side. Thus the absence of a better circuit has no dependence on unseen heights outside $C$. The outer statement is identical with the directions reversed. Equivalently, these statements specify stopping sigma-fields: on the event that the selected circuit is $C$, the recorded heights and the selection event are measurable using the deterministic set consisting of $C$ and its tested side. One may reveal that entire set, including bounded pockets. Failure to find a circuit requires only the strip itself.
  For the selected pairs, let $V_i$ be the actual free sites between $C_i^(-)$ and $C_i^(+)$. Reveal the unsuccessful strips, the tested sides of successful strips, the selected circuits, and then every site outside $union.big_i V_i$. Call the resulting sigma-field $cal(G)$. On every realization of the selected sets, the preceding measurability statement says that the event specifying these sets places no condition on the heights in $union.big_i V_i$ beyond their recorded boundary values. The finite Gibbs specification therefore applies. Distinct $V_i$ have no interacting edge after their separators are fixed, giving conditional independence. Touches with the original boundary may divide $V_i$ into several bounded faces; the same argument applies to their union. ◻
]

The selected circuits have height at least $k - 1$ on their usable sites. Every usable boundary value of a retained middle problem is consequently at least $k - 2$. The full strip

#[#set math.equation(numbering: n => "(8.9)")
 $ Q_(5 ell_i) \\ Q_(ell_i) $ <eq:untouched-middle>]

between them was not searched. Its original usable boundary, including any tiny replacements, still has the clean lower bound $k$. Moreover, each selected circuit meets the base polygon boundary, so $S = S_0 union C_i^(-) union C_i^(+)$ is connected. These facts hold on every realization of $cal(G)$ and will be the only boundary information used to upgrade the block.

=== 8.3 An attachment from the prescribed boundary <an-attachment-from-the-prescribed-boundary>

#thm([Lemma 8.4.])[
  (Boundary attachment).  #emph[Consider a retained middle problem at scale $ell$. Near either of the locations $\( - 2 ell \, 0 \)$ and $\( 2 ell \, 0 \)$, there are fixed constants $0 < d \/ W_0 lt.double 1$ and $0 < W_0 \/ ell lt.double 1$ for which the following holds. If the local boundary and the tiny replacements are within a sufficiently small fraction of $d$ of the horizontal boundary line, then with probability at least $a_0 > 0$ a path of sites at height at least $k$ enters from the clean boundary band and reaches depth $d$ inside the box of half-width $W_0$. Its boundary end is connected through good fixed or artificial sites to the exterior below, within a slight enlargement of the box. The bound is uniform in the exposed boundary values of the middle problem.]
] <lem:boundary-attachment>

#proof[
  Translate the attachment location to the origin. Take $W_0$ to be a small fixed fraction of $ell$, and later take $d$ to be a smaller fixed fraction of $W_0$. The two preliminary circuits are outside this box. The unobstructed part above the boundary tolerance belongs to one bounded face of $S$; in particular, a site $x$ close to $\( 0 \, 3 d \)$ is free in that face.
  #emph[Synthetic boundary and its mean.] On $S$, prescribe the high interval $\[ k - 1 \, k \]$ on a base subarc near the origin, of half-width approximately $W_0 \/ 4$, and the low interval $\[ k - 3 \, k - 2 \]$ elsewhere. Choose its endpoints so that the high part covers horizontal width $W_0 \/ 8$, lies within horizontal half-width $W_0 \/ 3$, and avoids all tiny replacement attachments. A replacement attached within the high portion receives the high prescription throughout. There are only two transition labels. This construction is feasible for all sufficiently small replacement diameters and gives the synthetic lower comparison $K$ in (8.7).
  Let $A$ be the event that a primal path of heights at least $k$ joins this high patch to depth $d$ inside the attachment box. This is an increasing height event, so it is enough to give it positive probability in the synthetic law. We shall first use the mean at $x$ to detect which side of the boundary-entering contours contains $x$, and then show that the high side forces $A$.
  Between radii of order $d$ and a small fixed fraction of $W_0$, annular buffers centered on the projected boundary contain only favorable $t = s$ pins. The annular stack estimate gives, except with probability
  #[#set math.equation(numbering: n => "(8.10)")
   $ e \( d \/ W_0 \) arrow.r 0 \, $ <eq:attachment-cut-error>]
  a double $t = s$ circuit surrounding $x$ and meeting the high patch. The same bound, multiplied by a fixed factor, holds after the two complementary labels are required. Choose such a cut using only the first color. Its inner face chain belongs to the anchored pair $\[ k - 1 \, k \]$, and both transition labels lie outside it. No component of $t$-changing edges crosses the double cut. Thus the complementary labels in its interior, including its inner cut layer, are all free. Flipping these labels preserves their conditional law. It reverses every interior height increment and swaps the two values of the anchored cut pair, hence sends $K$ to $2 k - 1 - K$ there. The conditional mean at $x$ is therefore $k - 1 \/ 2$.
  We also need a bound on the mean on failure, uniform in the lattice size. The component potentials in the proof of 15 give this bound. On each component of $t$-changing edges, $d t$ extended by zero has a potential with two values differing by two. If $t = B$, the identity
  $ d \( K + B W \/ 2 \) = W thin d B $
  expresses the height difference from the transition anchor to $x$ as an endpoint term of absolute value at most one, plus the component labels times their potential differences. Each potential difference has absolute value at most two. If $t = W$, use $d \( K - B W \/ 2 \) = - B thin d W$ instead. The unprescribed labels have conditional mean zero, and at most two components have prescribed labels. Since the anchor has value $k - 2$ or $k - 1$, this proves
  #[#set math.equation(numbering: n => "(8.11)")
   $ \| bb(E) \[ K \( x \) divides t \, upright("transition labels") \] - k #scale(x: 120%, y: 120%)[\|] lt.eq C_1 $ <eq:attachment-failure-mean>]
  for every first-color configuration, with an absolute constant $C_1$. Combining the symmetry on success with this bound gives
  #[#set math.equation(numbering: n => "(8.12)")
   $ bb(E) K \( x \) = k - 1 / 2 + O \( e \( d \/ W_0 \) \) . $ <eq:attachment-synthetic-mean>]
  All these arguments take place in a finite free volume around the construction, so no infinite-volume height or absolute anchor is required.
  #emph[Low lateral barriers.] Around the boundary locations with horizontal offsets $plus.minus 2 W_0 \/ 3$, use annuli with inner radius several times $d$ and outer radius less than $W_0 \/ 8$. All local first-color pins are now favorable to $t = - s$. With failure probability again tending to zero with $d \/ W_0$, each side contains a double $t = - s$ circuit meeting the low skeleton. Its face paths have the anchored low values and include a path from the low skeleton to above depth $3 d$, inside the horizontal band of width $W_0 \/ 4$ about that side location. Write $L$ for the event that both such lateral barriers exist. They have height at most $k - 2$ in the synthetic problem. The estimates survive the same two complementary labels. We may increase the lower end of the annular range by a fixed factor when a little more vertical clearance is needed.
  For the planar separation below, continue each barrier along its local low skeleton arc and then through the exterior to a line below the boundary band. Uniform parametric approximation keeps this continuation in a slightly enlarged lateral strip; a tiny replacement attaches to the same local base arc. The skeleton portion is outside the high patch and is low throughout. The exterior portion is only a geometric continuation, which a contour lying in the face cannot cross. Thus the two barriers separate the high patch laterally all the way through the boundary band.
  #emph[The mean detects a side of the open contours.] Condition on the synthetic trace on the whole skeleton $S$. In its bounded face containing $x$, follow every dual level path at threshold $k - 1 \/ 2$ that enters through a skeleton edge. At each crossed edge, the adjacent heights are exactly $k - 1 \, k$. On entering a triangle, those two values force its third value to be one of $k - 1 \, k$, and hence determine the next crossed edge. The exploration only reveals the adjacent values of the paths being followed. Exhaust all boundary crossings in this way, including crossings on either side of a skeleton edge bordering a slit in the face.
  Conditional on these open paths and their lips, their occurrence imposes only the indicated fixed vertex values. Any admissible completion with those values has the same open paths, by the degree-two rule and exhaustion of the boundary crossings. Unseen closed contours remain unrestricted. The remaining free components therefore have their Gibbs laws.
  Cut the face along the exposed open paths. Their lips have known sides: the $k$ lip is high and the $k - 1$ lip is low. Together with the threshold signs of the skeleton trace, these sides label every resulting geometric cell high or low. Here is why these labels are consistent even when the skeleton boundary has slits. A closed threshold contour in this face cannot enclose a skeleton site, since the connected skeleton continues outside the contour and cannot cross it. It cannot enclose part of an exposed open path either: that path continues to the skeleton and contours do not intersect. In the full threshold-sign picture, one may therefore erase the closed contours, filling each outermost enclosed region with its exterior sign, without changing any recorded skeleton or lip sign. The remaining sign is constant in each cell cut out by the open paths. This proves consistency; it is a deterministic explanation, not an additional revelation or conditioning of the closed contours.
  The free primal Gibbs components left by the exploration lie in these geometric cells; removing the revealed lip vertices may divide a cell further. In a low cell every adjacent fixed value is at most $k - 1$. In a high cell every adjacent fixed value is at most $k$: the high skeleton values and the high lips are exactly $k$, and all other fixed values satisfy the same ceiling. Let $U$ be the event that $x$ belongs to a high cell, including the case that it lies on a revealed high lip. A revealed low lip belongs to the low case.
  Comparison with a constant ceiling, including the deterministic case when $x$ lies on a revealed lip, yields
  #[#set math.equation(numbering: n => "(8.13)")
   $ bb(E) K \( x \) lt.eq k - 1 + bb(P) \( U \) . $ <eq:attachment-cell-mean>]
  Together with (8.12), this gives $bb(P) \( U \) gt.eq 1 \/ 2 - O \( e \( d \/ W_0 \) \)$. A closed high island around $x$ does not suffice for $U$. Such islands remain inside their unrestricted Gibbs cells, and comparison controls the cell’s mean rather than each of its height values.
  #emph[The correct boundary lip reaches the box.] The high lip of every exposed open path is a connected primal chain at height $k$. Its endpoints are skeleton sites at height $k$, so they lie on the designated high patch, including any tiny replacements carrying that patch’s prescription. No endpoint lies on a preliminary circuit or on another low part of the skeleton.
  We claim that $U ∩ L subset.eq A$. Suppose instead that $L$ occurs but $A$ does not. Follow a high lip from either of its endpoints on the high patch. It cannot cross a low lateral barrier: these are primal paths of height at most $k - 2$, whereas the lip has height $k$. It cannot leave through the exterior side of the face. To pass above a barrier it would first have to reach depth $d$, already giving $A$. Consequently every exposed open path stays between the two barriers and below depth $d$. This statement concerns all the open paths, since every one of their high lips starts on the designated high patch.
  The site $x$ is at depth $3 d$. Staying above depth $2 d$, it can be joined to one lateral barrier without crossing any exposed open contour. Following that barrier down to its low skeleton endpoint also crosses none: all its sites have height at most $k - 2$. The resulting route puts $x$ in the cell with the low label inherited from that endpoint. This contradicts $U$. The boundary and the tiny replacements stay in a much shallower band and do not obstruct the deep portion of this route; the barrier itself supplies the continuation through that band. Fixed margins between depths $d$ and $3 d$ absorb lattice rounding.
  Since $bb(P) \( L^c \) = O \( e \( d \/ W_0 \) \)$, the inclusion proves
  $ bb(P) \( A \) gt.eq bb(P) \( U \) - bb(P) \( L^c \) gt.eq 1 / 2 - O \( e \( d \/ W_0 \) \) . $
  The mean calculation was not conditioned on the lateral barriers. Choose $d \/ W_0$ once so that this bound is at least, say, $1 \/ 4$. The event $A$ asks only for a superlevel path, even though the synthetic construction produced an exact-height-$k$ lip. It is therefore increasing, and (8.7) gives the same positive lower bound for the actual height.
  Finally, in the actual comparison every usable skeleton site in the local box is at least $k$; the other skeleton sites there are artificial. A tiny replacement is attached to the local base arc, and that arc, with its parametric slack at the box margins, is connected through open sites to the exterior below. For example a path from below stopped at its first encounter with the base boundary reaches such an open site. Thus the attachment has the exterior continuation claimed in the lemma. ◻
]

=== 8.4 Joining the attachments and amplifying across scales <joining-the-attachments-and-amplifying-across-scales>

#thm([Lemma 8.5.])[
  (Upgrade in a retained middle region).  #emph[For every successful preliminary block, conditional on $cal(G)$ from 39, the probability of an arch separator at threshold $k$ in its untouched middle is at least an absolute constant $a_1 > 0$.]
] <lem:arch-upgrade>

#proof[
  Fix the realized middle problem. Its actual boundary has the lower bounds recorded after (8.9). The two attachments of 40 have uniform positive probabilities, and their events are increasing in the actual height.
  We first record a bulk path estimate under this same conditional law. For a box with a fixed relative annular buffer inside the free middle, compare from below with constant height $k - 2$ on its bounding skeleton. The latter comparison may be realized by fixing both spins of that height on $S$. Connectedness of $S$ fixes a common flat lift on every relevant bounded face. Its height contours are closed loops: a contour cannot cross the flat skeleton or enclose just part of a connected skeleton. Given the unoriented loops, all their jump signs are independent fair signs. For use of the first-spin circuit estimates, first enforce constancy of the second spin along $S$. This is an $E_0$ constraint outside the bulk buffers. Since $S$ is connected, specifying its second-spin value costs one fair component label and does not change the first-spin marginal.
  Apply 7 in a fixed number of thinner concentric buffers, requesting alternating first-spin signs on five double circuits. All these buffers are inside the free region. Successive conditional estimates give a positive probability, uniform in mesh and exposed actual heights, for this event in the flat comparison. Between each successive pair there is a first-spin wall loop surrounding the inner box. Hence there are at least four nested height loops in the allocated annulus.
  Retain only the event that there are at least four enclosing unoriented loops in the allocated annulus, forgetting the first-spin event used to lower-bound its probability. This event and the choice of four consecutive enclosing loops depend only on the full unoriented geometry. Conditional on that geometry, the height just outside the first chosen loop is $k - 2$ plus a sum of other fair loop signs. It is therefore symmetric about $k - 2$ and independent of the four chosen signs. With probability at least $2^(- 5)$ it is at least $k - 2$ and all four signs are positive. The inner face path of the fourth loop is then at least $k$. Its closed primal walk has winding number one and contains a surrounding circuit, with only bounded mesh displacement. Thus a fixed bulk annulus has a uniformly positive probability of a circuit at height at least $k$. Height order transfers this to the actual middle law.
  These bulk circuits give paths along any fixed polygonal tube with positive width and clearance. To see the deterministic gluing, place small annuli along the tube so that consecutive inner disks overlap and each protrudes beyond the other annulus’s outer disk. Two surrounding circuits cannot then be disjoint or nested, so they intersect. A finite string supplies the desired connected crossing. Positive association for heights bounds the probability of the simultaneous increasing circuit events below by the product of their positive lower bounds.
  Use such a tube to cross each attachment box horizontally near depth $d \/ 2$, extending a little beyond its sides. Any rising attachment from the boundary band to depth $d$ intersects this crossbar. Join the left and right crossbars by tubes going upward near horizontal locations $plus.minus 2 ell$, across at depth $2 ell$, and downward on the right. Tube widths are much smaller than $d$, and all their bulk boxes have clearance from the skeleton. The whole construction lies between $Q_ell$ and $partial Q_(5 ell)$; see 2.
  Apply height positive association in the actual conditional Gibbs problem to the two attachment events and the finite collection of bulk circuit events. This gives a fixed lower bound $a_1 > 0$ for their intersection. The exterior continuations of the attachments can be joined below the boundary, around the bottom of $Q_ell$, through artificial sites and good local boundary sites. The resulting closed open walk follows a rectangle around $Q_ell$ and has winding number one, so it contains an open surrounding simple cycle. The tubes avoid the preliminary circuits; in particular, the construction has not declared any of their possibly sub-$k$ usable values artificial. Every artificial site used here was already outside the original region or in a removed boundary patch, which proves the upgrade. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  compound-path({rect((-2.94, -2.94), (2.94, 2.94), fill: rgb("#f0f0f0"), stroke: none); line((2.94, 2.94), (-2.1, -2.1)); rect((-2.1, -2.1), (2.1, 2.1), fill: rgb("#f0f0f0"), stroke: none)}, fill: rgb("#f0f0f0"), fill-rule: "even-odd", stroke: none)
  compound-path({rect((-0.42, -0.42), (0.42, 0.42), fill: rgb("#e1e1e1"), stroke: none); line((0.42, 0.42), (-0.21, -0.21)); rect((-0.21, -0.21), (0.21, 0.21), fill: rgb("#e1e1e1"), stroke: none)}, fill: rgb("#e1e1e1"), fill-rule: "even-odd", stroke: none)
  rect((-2.1, 0), (2.1, 2.1), fill: rgb("#f7f7ff"), stroke: none)
  compound-path({rect((-0.42, -0.42), (0.42, 0.42), fill: rgb("#e1e1e1"), stroke: none); line((0.42, 0.42), (-0.21, -0.21)); rect((-0.21, -0.21), (0.21, 0.21), fill: rgb("#e1e1e1"), stroke: none)}, fill: rgb("#e1e1e1"), fill-rule: "even-odd", stroke: none)
  rect((-2.94, -2.94), (2.94, 2.94), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  rect((-2.1, -2.1), (2.1, 2.1), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  rect((-0.42, -0.42), (0.42, 0.42), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  rect((-0.21, -0.21), (0.21, 0.21), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((-3.087, 2.94), [#text(size: 7pt)[$Q_(7 ell )$]], anchor: "east", padding: 0.1176cm)
  line((-3.045, 2.94), (-2.94, 2.94), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((-3.087, 2.1), [#text(size: 7pt)[$Q_(5 ell )$]], anchor: "east", padding: 0.1176cm)
  line((-3.045, 2.1), (-2.1, 2.1), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((0, 0.63), [#box(inset: 0.01764cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[$Q_ ell$]]])], anchor: "center")
  line((0, 0.462), (0, 0.42), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((0, -0.609), [#text(size: 7pt)[$Q_( ell"/"2)$]], anchor: "center", padding: 0.1176cm)
  line((0, -0.4704), (0, -0.21), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((-3.087, 0), (3.087, 0), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10))
  content((3.045, 0.063), [#text(size: 7pt)[clean boundary]], anchor: "south-east", padding: 0.1176cm)
  content((0, 1.68), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[free middle]]])
  content((0, -1.68), [#text(fill: rgb("#5a5a5a"))[#text(size: 9pt)[artificial exterior]]])
  content((0, 2.541), [#text(size: 7pt)[outer strip]])
  content((-1.134, -0.462), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[inner strip]]])], anchor: "east")
  line((-1.113, -0.462), (-0.42, -0.336), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((-0.84, 0.0336), (-0.84, 0.84), (0.84, 0.84), (0.84, 0.0336), stroke: (paint: rgb("#0000b2"), thickness: 1.3pt, miter-limit: 10))
  line((-0.987, 0.147), (-0.693, 0.147), stroke: (paint: rgb("#0000b2"), thickness: 1.3pt, miter-limit: 10))
  line((0.693, 0.147), (0.987, 0.147), stroke: (paint: rgb("#0000b2"), thickness: 1.3pt, miter-limit: 10))
  line((-0.84, 0.0084), (-0.84, -0.84), (0.84, -0.84), (0.84, 0.0084), stroke: (paint: rgb("#0000b2"), thickness: 1.1pt, miter-limit: 10, dash: "dashed"))
  line((-0.882, 0.0084), (-0.819, 0.273), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10))
  line((0.798, 0.0084), (0.861, 0.273), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10))
  rect((-1.05, -0.105), (-0.63, 0.357), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  rect((0.63, -0.105), (1.05, 0.357), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  circle((0, 0), radius: 0.0273, fill: black, stroke: none)
  content((0.0336, -0.0084), [#text(size: 7pt)[$p$]], anchor: "north-west", padding: 0.1176cm)
  content((-0.84, -0.126), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[$q_L$]]])], anchor: "north")
  content((0.84, -0.126), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 7pt)[$q_R$]]])], anchor: "north")
  content((0, 0.8904), [#text(size: 7pt)[bulk joining tube]], anchor: "south", padding: 0.1176cm)
  rect((3.5, -0.063), (6.58, 2.309), fill: rgb("#f7f7ff"), stroke: none)
  line((3.43, -0.063), (6.65, -0.063), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((4.62, -0.063), (5.46, -0.063), stroke: (paint: rgb("#cc6600"), thickness: 2.0pt, miter-limit: 10))
  content((5.04, -0.1475), [#text(size: 7pt)[anchored high patch]], anchor: "north", padding: 0.1176cm)
  line((4.06, -0.063), (4.018, 0.652), (4.144, 1.302), (4.088, 2.179), stroke: (paint: rgb("#b20000"), thickness: 1.1pt, miter-limit: 10))
  line((6.02, -0.063), (5.95, 0.717), (6.076, 1.367), (5.992, 2.179), stroke: (paint: rgb("#b20000"), thickness: 1.1pt, miter-limit: 10))
  content((3.878, 1.14), [#text(fill: rgb("#a60000"))[#text(size: 7pt)[low barrier]]], angle: 90deg)
  content((6.272, 1.14), [#text(fill: rgb("#a60000"))[#text(size: 7pt)[low barrier]]], angle: 90deg)
  bezier((4.9, -0.063), (5.208, 0.6845), (5.32, 0.132), (4.788, 0.457), stroke: (paint: rgb("#cc6600"), thickness: 1.3pt, miter-limit: 10))
  line((3.57, 0.587), (6.51, 0.587), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((6.566, 0.587), [#text(size: 7pt)[$d$]], anchor: "west", padding: 0.1176cm)
  circle((5.04, 1.887), radius: (0.049, 0.02275), fill: black, stroke: none)
  content((5.04, 1.757), [#text(size: 7pt)[$x$ at depth#linebreak()$3d$]], anchor: "north", padding: 0.1176cm)
  rect((3.584, -0.0955), (6.496, 2.277), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((5.04, 2.732), [#text(size: 7pt)[Synthetic attachment#linebreak()vertical scale magnified]])
})],
  caption: [Figure 2: A retained block in tangent coordinates. The four labeled squares determine the two searched strips; the attachment boxes and path widths are enlarged for legibility. The two shaded strips contain the preliminary separators. Their facing sides leave the middle Gibbs region unsearched. The blue route uses two boundary attachments, horizontal crossbars, and bulk paths at positive clearance in the actual height law. The right detail shows the synthetic low-barrier argument used to prove an attachment; its barriers are not imposed in the actual law. The dashed lower route uses the artificial exterior. All displayed paths are schematic corridors, not a prescribed realization of the random separator. ],
) <fig:boundary-arches>

#proof[
  Let $Z$ be the number of successful preliminary blocks. 38 gives $bb(P) \( Z < c_0 N \) lt.eq C_0 e^(- c_0 N)$. Use the actual-height stopping sigma-field $cal(G)$ of 39. Conditional on it, the retained middle regions have independent Gibbs laws, and 41 gives success probability at least $a_1$ in each. Consequently
  $ bb(P) \( upright("no upgraded block") \) lt.eq C_0 e^(- c_0 N) + \( 1 - a_1 \)^(c_0 N) lt.eq C e^(- c N) . $
  Every upgraded circuit surrounds $Q_r$ and lies in $Q_R$ by (8.2). This proves (8.4). Applying the argument to $- H$ proves the reversed assertion. ◻
]

#thm([Corollary 8.6.])[
  (Random traces and tiny boundary replacements).  #emph[The arch estimate remains valid conditional on an exterior sigma-field whenever, conditional on that field, the remaining free heights have a uniform Gibbs law and their actual usable boundary data obey (8.3). It also remains valid after a fixed finite number of boundary-attached patches have been removed by exposed simple circuits, provided the same data bounds hold on the new usable boundary.]
  #emph[For a prescribed error, first fix a finite collection of arch scales and their boxes. The replacement diameters, boundary approximation errors, and mesh may then be made sufficiently small for all comparisons. The success constants of the resulting blocks have no factor depending on the number of microscopic pins or on the fixed number of replacements.]
] <cor:boundary-robustness>

#proof[
  Every probabilistic lower bound in the proof is uniform in the specified trace; only its displayed one-sided bounds were used. It may therefore be applied to each conditional trace. A boundary-attached replacement keeps the skeleton connected and preserves the full-neighborhood condition for the retained free sites. For fixed scales, sufficiently small replacements stay in the shallow boundary tolerance and do not meet the bulk tubes. The transition points of the synthetic prescriptions can be chosen away from all attachment neighborhoods, as explained after (8.7). The number of complementary labels is consequently still at most four in the preliminary construction and at most two in each attachment construction. These are the only label costs in the proof. The geometric approximation threshold may depend on the finite family, but none of the block probability constants does. ◻
]

== 9 Limits, boundary traces, and absolute-height identities <sec:limits>

We continue to use the integer height $H_delta = \( h_delta - 1 \) \/ 2$, and write $H_delta \( f \) = integral H_delta \( x \) f \( x \) thin d x$. All tests in this section are supported in an eventual interior compact of $D$. Thus an arbitrary extension from $D_delta$ to $D$, for example extension by zero, has no effect on the limits under consideration. A bracket means one of the two filled-window comparison laws of 36. Its boundary trace, although random, takes values in $\[ - 2 \, 1 \]$.

#thm([Proposition 9.1.])[
  (Tightness and convergence of moments).  #emph[The true fields and all the bracket fields are tight in $H_(upright("loc"))^(- t) \( D \)$ for every $t > 1$. For $K subset.double D$, $p < oo$, and tests supported in $K$, 
#[#set math.equation(numbering: n => "(9.1)")
 $ sup_delta ∥H_delta \( f \)∥_(L^p) lt.eq C_(K \, p) ∥f∥_oo . $ <eq:local-test-moments>]

 The constants are uniform over these bracket laws. Along convergence in law, every finite joint test moment converges. These assertions hold also for any fixed finite collection of fields in a coupling.]
] <prop:tightness>

#proof[
  Cover $K$ by finitely many balls whose radii are a sufficiently small fixed fraction of their distance from $partial D$, and use a partition of unity. The smearing estimate of 13, applied to the positive and negative parts on each ball, gives (9.1). For brackets, condition first on the boundary trace. Its uniform bound gives the same constants before and after averaging over that trace.
  For completeness, place a cutoff $chi in C_c^oo \( D \)$ in a fixed square, regarded as a flat torus, and let $e_n$, $n in bb(Z)^2$, be its normalized Fourier basis. Since $∥chi e_n∥_oo$ is bounded independently of $n$, for $s > 1$ we have
  #[#set math.equation(numbering: n => "(9.2)")
   $ sup_delta bb(E) ∥chi H_delta∥_(H^(- s))^2 = sup_delta sum_(n in bb(Z)^2) \( 1 + \| n \|^2 \)^(- s) bb(E) \| H_delta \( chi overline(e_n) \) \|^2 < oo . $ <eq:sobolev-bound>]
  For any $p gt.eq 2$, Minkowski’s inequality applied to the sum defining the squared norm gives its $L^(p \/ 2)$ bound as well, using (9.1) at order $p$. If $1 < s < t$, the inclusion $H^(- s) arrow.r.hook H^(- t)$ on this torus is compact: its Fourier multiplier tends to zero, and truncating the Fourier series gives finite-rank approximations. Markov’s inequality and (9.2) therefore give tightness in $H^(- t)$. Use a nested countable family of cutoffs equal to one on an exhaustion of $D$. Choosing the compact-containment probabilities for its members with a summable error gives tightness in the corresponding local Sobolev space, and hence in distributions.
  If $f_1 \, dots.h \, f_j$ are fixed tests, Hölder’s inequality and (9.1) at order $j \( 1 + eta \)$ bound $product_i H_delta \( f_i \)$ in $L^(1 + eta)$, for any fixed $eta > 0$. It is uniformly integrable. Convergence in law of the test vector therefore implies convergence of its product expectation. The same argument applies to mixed products from a finite coupling. The moment inequalities themselves pass to every limit by truncation. ◻
]

Fix once and for all a nonnegative radial function $rho in C_c^oo \( B \( 0 \, 1 \) \)$ with integral one, and set

$ rho_(x \, r) \( z \) = r^(- 2) rho \( \( z - x \) \/ r \) \, #h(2em) d \( x \) = "dist" \( x \, partial D \) . $

Choose a sufficiently small fixed $kappa > 0$. The smearing estimate, first with mesh tending to zero at fixed $x$, also implies

#[#set math.equation(numbering: n => "(9.3)")
 $ sup_(x in D) ∥H \( rho_(x \, kappa d \( x \)) \)∥_(L^p) lt.eq C_p $ <eq:depth-moment-bound>]

for any subsequential true or bracket limit. Here and below a harmless change of the constant covers centers in a fixed compact part of $D$. In particular this bound is valid when the center approaches a marked point; it requires only bounded boundary data, not a constant arc.

=== 9.1 The ordered limits have the correct boundary mean <the-ordered-limits-have-the-correct-boundary-mean>

We specify the limits of brackets before using their identities. Choose increasing finite grids $cal(G)_n$ whose union is dense among the transverse regular horizontal levels of $partial D$ and which miss the two marks. Each such level has finitely many boundary intersections. For fixed $n$, choose disjoint windows at these intersections, avoiding the marks, and denote their maximum size by $eta$. At each mesh, height comparison gives a coupling

#[#set math.equation(numbering: n => "(9.4)")
 $ H_(delta \, n \, eta)^(-) lt.eq H_delta lt.eq H_(delta \, n \, eta)^(+) . $ <eq:ordered-brackets>]

For example, couple each ordered pair and disintegrate over the true field to join the couplings. Affine interpolation preserves the order.

Start with an arbitrary convergent subsequence of the true laws, with limit denoted by $H$. For each fixed $n \, eta$ take further joint subsequences in (9.4); then let $eta$ decrease to zero at fixed $n$; finally let $n$ increase. Tightness permits all these extractions. At every stage the true marginal is the originally chosen law of $H$. The order persists when tested against nonnegative smooth functions, because that is a closed condition under distributional convergence. The use of a countable determining family of nonnegative tests makes the order simultaneous almost surely. Write the final triple as $\( H^(-) \, H \, H^(+) \)$.

Identities from 36 pass through these limits. For bounded continuous functions of local increment tests this follows from convergence in law and the moment bound for the Laplace insertion. Every admissible finite selection of grid levels belongs to all sufficiently late grids. Taking the other insertion to be one shows that the distributional means $m^(-)$ and $m^(+)$ of the final brackets are harmonic locally throughout $D$. Indeed any interior point admits two regular levels on opposite sides of a sufficiently small testing disk. Distributional harmonic functions are smooth, so these means are ordinary harmonic functions. Comparison with constant-boundary laws, whose means equal the boundary constant by height reflection, gives

#[#set math.equation(numbering: n => "(9.5)")
 $ - 2 lt.eq m^(-) lt.eq m^(+) lt.eq 1 . $ <eq:bounded-bracket-means>]

#thm([Proposition 9.2.])[
  (Boundary trace and mixed boundary moments).  #emph[Both limiting bracket means are the harmonic extension $m$ of $g$. Consequently $H^(-) = H = H^(+)$ almost surely in the ordered coupling, and $bb(E) H = m$.]
  #emph[Let $p$ be on an open boundary arc on which $g = k$, where $k$ is $0$ or $- 1$, and let $x arrow.r p$ from within $D$. For the true limiting field put $Y_x = H \( rho_(x \, kappa d \( x \)) \)$. If $F$ is a product of a fixed finite number of height averages supported away from a neighborhood of $p$, then 
#[#set math.equation(numbering: n => "(9.6)")
 $ bb(E) \[ \( Y_x - k \) F \] arrow.r 0 . $ <eq:mixed-boundary-trace>]

 The same assertion holds when those averages approach finitely many other, distinct, nonmarked boundary points, with their radii a fixed small fraction of their depths. In that assertion the points and their finite number are fixed before the depths tend to zero.]
] <prop:boundary-trace>

#proof[
  We first identify the bracket means. Fix a point $p$ on an open arc of value $k$, a center $x$ near $p$, and its testing ball of radius $kappa d \( x \)$. Choose finitely many final arch scales surrounding this ball in a small clean neighborhood of the nearest boundary projection of $x$. Work initially at finite mesh with a fixed grid and windows sufficiently small for the construction below, and write $Y_(delta \, x)$ for the chosen bracket’s unit average in the ball. Two searches will isolate the ball from the exceptional window values and then from the remote boundary data.
  For each window choose a clean censor neighborhood on its constant arc, of value $k_i$. Choose these neighborhoods disjoint, away from the marks, small relative to the final arch scales, and small enough to miss the testing ball. Conditional on the original bracket trace, all its values are at least $k_i - 2$, and those in this censor neighborhood outside its window are at least $k_i$. Enclose the entire discrete window and its adjacent sites in the inner comparison box, with a positive margin before sending the mesh to zero. Theorem 37 supplies an arch at level $k_i$ surrounding this box. For a fixed grid there are only finitely many windows; shrinking them relative to their censor neighborhoods makes the total failure probability as small as desired.
  On success choose the innermost arch by exploring from the window side, as in 39. Discard the patch between the window and this arch, and retain the side away from the window. This retained side contains the testing ball and has not been examined by the search. Conditional on the revealed patches and separator traces, its free heights have their Gibbs law. No original exceptional vertex is adjacent to a retained free site. The new usable separator sites carry their actual heights, which are at least $k_i$; the global lower bounds are also preserved. Thus the first searches replace the windows by small boundary pieces with the required one-sided data. They do not condition on the preliminary revelations used only to prove the arch probability estimate.
  Apply 42 at the chosen final scales in the retained domain. The censor patches are small enough for its replacement hypothesis. In the chosen clean neighborhood every usable original or replacement boundary site has height at least $k$. With high probability there is an arch at level $k$ separating the testing ball from the remote boundary. Choose the outermost such arch by searching from the remote side. This time the unexamined region is the side containing the testing ball, between the final arch and the clean boundary arc. Its usable boundary consists of sites on the arch and any original or censor pieces it contains, all at height at least $k$. Height comparison with constant data therefore gives conditional mean at least $k$ for $Y_(delta \, x)$.
  Let $E_delta$ denote success of both stages, and expose only the discarded patches, the remote side of the final arch, and their usable traces. On $E_delta$ this information determines the event and leaves the testing region Gibbs. For any $q > 1$ the preceding conditional comparison gives
  #[#set math.equation(numbering: n => "(9.7)")
   $ bb(E) \( Y_(delta \, x) - k \) gt.eq - ∥Y_(delta \, x) - k∥_(L^q) bb(P) \( E_delta^c \)^(1 - 1 \/ q) . $ <eq:boundary-mean-error>]
  The norm is bounded by the unconditional comparable-depth smearing estimate, whose limit form is (9.3). No moment estimate after conditioning on censor success is needed.
  For the upper bound start afresh from the original bracket trace. Its global values are at most $k_i + 2$, and its clean values in the $i$th censor neighborhood are at most $k_i$. Use decreasing censor arches and then a decreasing final arch in the same two stopping directions. The testing region now has usable boundary at most $k$, giving the matching upper estimate, with the same Hölder bound on the failure contribution. This separate construction is necessary because the lower censor arches carry no upper bound on their revealed heights.
  We make explicit the uniformity that permits the grid limit. Given an error tolerance, first choose finitely many final arch blocks in a sufficiently straight part of the limiting smooth arc. They are available for every sufficiently shallow testing center. For each fixed grid, choose the outer censor sizes so small that the robust comparison applies in these blocks; the synthetic interval endpoints in that comparison avoid all the tiny replacements. By 42, the final block estimates do not incur a factor for the number of replacements. Next decrease the window sizes so that all censor searches succeed with the desired total error, and before that take the mesh and boundary approximation errors to zero. The resulting bound on the mean depends on the final blocks and the error tolerance, and not on the grid. It thus survives window limits followed by grid refinement. This is exactly the order of limits used to define $\( H^(-) \, H \, H^(+) \)$. Nearest projections and the uniform smooth-arc estimates allow tangential as well as normal approaches to $p$.
  Since each bracket mean is harmonic, radial averaging recovers its value at $x$. The two bounds just proved show that its boundary trace is $k$ on the open arc. Together with (9.5), bounded harmonic uniqueness gives $m^(-) = m^(+) = m$. The two marked points do not change this uniqueness: for a bounded harmonic function with zero trace elsewhere, compare its absolute value with its supremum times the harmonic measure of arbitrarily small boundary neighborhoods of the marks. At any fixed interior point these harmonic measures tend to zero, since a smooth domain has a Poisson kernel and single points have zero arclength.
  The order now identifies the fields, rather than merely their means. For every nonnegative test $f$, $H^(+) \( f \) - H^(-) \( f \) gt.eq 0$ and its expectation is zero. Thus it vanishes almost surely. Apply this to a countable dense family of nonnegative tests and use continuity of distributions. The ordered fields agree as distributions almost surely, proving the first assertion and transferring the bracket identities to $H$.
  For the mixed assertion no censoring is needed in the true law. Choose deterministic outer arch neighborhoods that do not meet the supports of the other observations. First suppose $F gt.eq 0$ is measurable outside those neighborhoods. On the lower good event $E_(-)$, choose the outermost lower arch from the exterior. The event, the selected trace, and $F$ are measurable in the revealed exterior; the Gibbs property gives
  $ bb(E) \[ \( Y_x - k \) F \; E_(-) \] gt.eq 0 . $
  The upper search separately gives an event $E_(+)$ on which the reverse inequality holds. These two searches need not share a sigma-field. For $q > 1$, their failure contributions satisfy
  #[#set math.equation(numbering: n => "(9.8)")
   $ - ∥\( Y_x - k \) F∥_(L^q) bb(P) \( E_(-)^c \)^(1 - 1 \/ q) lt.eq bb(E) \[ \( Y_x - k \) F \] lt.eq ∥\( Y_x - k \) F∥_(L^q) bb(P) \( E_(+)^c \)^(1 - 1 \/ q) . $ <eq:weighted-arch-bounds>]
  All norms here are bounded by Hölder and the smearing estimates. For signed $F$, apply the bounds to its positive and negative parts; they are exterior measurable and have the same moment control. One uses the actual exterior stopping search at this step, without retaining any of the preliminary revelations used to prove the arch probability estimate. The result follows first at finite mesh, then for limit moments by 43 and truncation.
  When other observations approach different boundary points, fix that finite set first and take the outer neighborhoods smaller than their mutual distances. The observations remain exterior measurable as their depths decrease. Estimate (9.3) bounds their moments uniformly, so the same proof gives (9.6) in this joint limiting regime. ◻
]

#thm([Lemma 9.3.])[
  (Deterministic boundary reference averages).  #emph[Fix a compact subarc of one open constant boundary arc, with value $k$. There exist finite averages of comparable-depth unit smearings near that subarc which converge to $k$ in every finite $L^p$ of the true limiting field. More precisely, choose $N$ distinct points $p_1 \, dots.h \, p_N$ in the subarc, let $x_i \( t \)$ approach $p_i$ normally at depth $t$, and put 
$ A_(N \, t) = 1 / N sum_(i = 1)^N H \( rho_(x_i \( t \) \, kappa d \( x_i \( t \) \)) \) . $

 For all sufficiently small $t$ the balls are disjoint, and 
#[#set math.equation(numbering: n => "(9.9)")
 $ limsup_(t arrow.b 0) bb(E) \| A_(N \, t) - k \|^2 lt.eq C / N \, #h(2em) sup_(N \, t) ∥A_(N \, t) - k∥_(L^q) lt.eq C_q . $ <eq:boundary-average-variance>]

 The second supremum is over admissible small depths. Consequently $lim_(N arrow.r oo) limsup_(t arrow.b 0) ∥A_(N \, t) - k∥_(L^p) = 0$ for every finite $p$.]
] <lem:boundary-references>

#proof[
  Write $Y_i \( t \)$ for the $i$th summand. Uniform comparable-depth moments give $bb(E) \| Y_i \( t \) - k \|^2 lt.eq C$. For $i eq.not l$, apply (9.6) with exterior factor $Y_l \( t \) - k$:
  $ bb(E) \[ \( Y_i \( t \) - k \) \( Y_l \( t \) - k \) \] arrow.r 0 . $
  Expanding the square, taking the depth limit at fixed $N$, and then using the diagonal bound proves the first estimate in (9.9). Minkowski’s inequality gives the second from (9.3), uniformly in $N$. For $p lt.eq 2$ use the $L^2$ bound; for $p > 2$ interpolate $L^2$ with an $L^q$ bound for any $q > p$. A diagonal choice of finite depths as $N$ increases gives the claimed reference sequence. In particular, we have not asserted that one comparable-depth average, or a fixed finite collection of them, becomes deterministic. ◻
]

=== 9.2 Absolute moments and the absence of diagonal terms <absolute-moments-and-the-absence-of-diagonal-terms>

Define the distributional moment $T_j$ by

#[#set math.equation(numbering: n => "(9.10)")
 $ chevron.l T_j \, f_1 ⊗ dots.h.c ⊗ f_j chevron.r = bb(E) product_(i = 1)^j H \( f_i \) \, #h(2em) T_0 = 1 . $ <eq:moment-distributions>]

These are well-defined distributions on $D^j$. For example, the local Sobolev moment bounds in the proof of 43 permit taking the expectation of the tensor power as a distribution; equivalently, the continuous multilinear form in (9.10) has a distributional kernel. Let

$ cal(C)_j = { \( x_1 \, dots.h \, x_j \) in D^j : x_i eq.not x_l upright(" for ") i eq.not l } $

be the configuration space without collisions.

#thm([Proposition 9.4.])[
  (Harmonicity of absolute-height moments).  #emph[On $cal(C)_j$, $T_j$ is a smooth function and is harmonic in each variable separately.]
] <prop:moment-harmonicity>

#proof[
  The identity already transferred to the true law says
  #[#set math.equation(numbering: n => "(9.11)")
   $ bb(E) \[ H \( Delta phi.alt \) F \] = 0 $ <eq:true-local-increment-identity>]
  for bounded products of localized increment functions satisfying the separation conditions of 36. In particular, each factor may be a bounded continuous function of $H \( q \)$, where $q$ has integral zero and is supported in a small disk. Moment bounds and truncation extend the identity to products of finitely many such $H \( q \)$’s whenever the same geometric conditions hold. The disks may overlap one another.
  Fix distinct points $x_0 \, x_2 \, dots.h \, x_j$. Take a small closed disk about $x_0$ with a larger concentric neighborhood compactly contained in $D$ and disjoint from the spectator points. Choose spectator neighborhoods and tests $f_i$ therein, and write $c_i = integral f_i$. All these neighborhoods can be made as small as needed below. We will approximate each absolute observation $H \( f_i \)$ by constants and local zero-total observations supported a fixed positive distance from the Laplace insertion.
  Choose a unit smooth average $rho_i$ near $x_i$, and a clean boundary subarc accessible without entering a fixed larger disk about $x_0$. Such access is always possible. A path in $D$ that meets the excluded small disk can be detoured through a concentric annulus compactly contained in $D$; thus removing this disk does not block a route to the boundary subarc. For finitely many reference endpoints in 45, join $rho_i$ to each endpoint by a finite chain of unit smooth averages
  $ rho_(i \, n \, 0) = rho_i \, med rho_(i \, n \, 1) \, dots.h \, rho_(i \, n \, L_(i \, n)) = rho_(x_n \( t \) \, kappa d \( x_n \( t \) \)) . $
  Consecutive supports lie in one disk of arbitrarily small prescribed maximum diameter. Construct this by a sufficiently fine subdivision of a path in its open tube, reducing the radii as necessary near the boundary. All chain disks avoid the fixed neighborhood of $x_0$; different chains need not avoid one another. There is the exact identity
  #[#set math.equation(numbering: n => "(9.12)")
   $ H \( f_i \) =  & c_i k + H \( f_i - c_i rho_i \) + c_i / N sum_(n = 1)^N sum_(l = 0)^(L_(i \, n) - 1) H \( rho_(i \, n \, l) - rho_(i \, n \, l + 1) \) + c_i \( A_(N \, t) - k \) . $ <eq:transport-identity>]
  Every nonconstant term before the last has total integral zero and is supported in one small disk. The final term tends to zero in every required $L^p$, with depth first and then $N$ increasing.
  We check the separation geometry uniformly in the number of chain links. Translate coordinates so that $x_0 = 0$, and suppose all chain disks are outside $B \( 0 \, R \)$. Choose $ell lt.double R$, and support $phi.alt$ in $B \( 0 \, ell \/ 10 \)$. Available lower and upper levels lie in $\( - 2 ell \, - ell \)$ and $\( ell \, 2 ell \)$, respectively. Cap the diameter of every chain disk, and of each initial spectator neighborhood, by $ell \/ \( 100 j \)$. Expand a product of the approximations on the right side of (9.12), omitting the last error term. Each expanded term contains at most $j - 1$ disks: it selects at most one local observation from each original spectator factor. Thus the total length of the forbidden vertical projections is less than $ell \/ 100$ in either available level interval, regardless of the number or length of the routes. Choose regular levels from the dense union of grids outside these projections and with positive clearance.
  Any selected disk in the resulting middle band is outside $B \( 0 \, R \)$ and has vertical coordinate of size at most $2 ell$. It consequently lies well to the left or right of the insertion, also in projection along $u = \( sqrt(3) \/ 2 \, 1 \/ 2 \)$, because $ell lt.double R$. The boundary pieces in the middle band have the same property by the interior clearance of $x_0$. These are exactly the geometric conditions of 36. Each finite expanded term therefore satisfies (9.11); the levels can depend on that term. There is no requirement that a single pair avoid every disk in all the routes at once.
  For each finite approximation the expanded sum is finite, so its expectation against $H \( Delta phi.alt \)$ is zero. The approximated spectator variable differs from $H \( f_i \)$ by $c_i \( A_(N \, t) - k \)$; in particular its higher moments stay bounded independently of the number of links. Hölder’s inequality now passes to the $L^p$ reference limit in the unexpanded product. We obtain
  $ bb(E) #scale(x: 120%, y: 120%)[\[] H \( Delta phi.alt \) product_(i = 2)^j H \( f_i \) #scale(x: 120%, y: 120%)[\]] = 0 . $
  This proves distributional harmonicity in the distinguished variable on a neighborhood of every collision-free configuration. Product tests suffice by density in the smooth tests on a product neighborhood. Repeating with each distinguished variable gives $Delta_(x_i) T_j = 0$ on $cal(C)_j$. Their sum is the ordinary elliptic Laplacian on $bb(R)^(2 j)$, so distributional harmonic regularity gives a smooth representative there. The separate identities then hold classically. ◻
]

#thm([Lemma 9.5.])[
  (No distributions supported on collision diagonals).  #emph[The smooth function $T_j$ on $cal(C)_j$ is locally integrable on $D^j$ and represents its full moment distribution. For $j gt.eq 2$, $K subset.double D$, and distinct $x_1 \, dots.h \, x_j in K$, with $d_(*) = min_(i < l) \| x_i - x_l \|$, it satisfies 
#[#set math.equation(numbering: n => "(9.13)")
 $ \| T_j \( x_1 \, dots.h \, x_j \) \| lt.eq C_(K \, j) #scale(x: 120%, y: 120%)[\(] 1 + log_(+) \( 1 \/ d_(*) \) #scale(x: 120%, y: 120%)[\)]^(j \/ 2) . $ <eq:offdiagonal-log-bound>]

 With distinct spectators $y_2 \, dots.h \, y_j$ fixed in the interior, $T_j \( x \, y_2 \, dots.h \, y_j \)$ is bounded as $x$ approaches any part of $partial D$, including the marked points. At a nonmarked point of an arc of value $k$ its trace is 
#[#set math.equation(numbering: n => "(9.14)")
 $ lim_(x arrow.r p) T_j \( x \, y_2 \, dots.h \, y_j \) = k thin T_(j - 1) \( y_2 \, dots.h \, y_j \) . $ <eq:moment-boundary-trace>]

]
] <lem:no-contact>

#proof[
  Radially mollify every variable at the common radius $r$ and denote the result by $T_j^(\( r \))$. For centers in $K$ and sufficiently small $r$, the smearing bounds and Hölder give
  #[#set math.equation(numbering: n => "(9.15)")
   $ \| T_j^(\( r \)) \( x_1 \, dots.h \, x_j \) \| = lr(|bb(E) product_(i = 1)^j H \( rho_(x_i \, r) \)|) lt.eq C_(K \, j) \( 1 + \| log r \| \)^(j \/ 2) \, $ <eq:common-mollifier-bound>]
  even if some centers coincide. When $d_(*) > 2 r$, the averaging balls are disjoint and separate harmonicity gives $T_j^(\( r \)) = T_j$ exactly by successive applications of the mean-value property. Taking $r$ to be a fixed small fraction of $d_(*)$, with a fixed upper cutoff depending on $K$, proves (9.13). Its right side is integrable on $K^j$: it is bounded by a constant times one plus the sum over pairs of powers of $\| log \| x_i - x_l \| \|$, and such powers are integrable in two dimensions.
  The collision neighborhood ${ d_(*) lt.eq 2 r } ∩ K^j$ has volume $O_(K \, j) \( r^2 \)$. By (9.15), the integral of $\| T_j^(\( r \)) \|$ over that neighborhood tends to zero. The integral there of the off-diagonal function tends to zero by its local integrability. Off that neighborhood the two functions agree. Thus $T_j^(\( r \))$ converges in $L^1$ on compact sets to the extended off-diagonal function. It also converges distributionally to the original $T_j$, by the approximate-identity property. The two are therefore the same distribution; no additional term supported on a diagonal remains.
  For the boundary claims, choose fixed, disjoint, small radial unit averages $rho_i$ at the spectator points. For $x$ sufficiently near the boundary, its comparable-depth averaging ball is disjoint from all of them. Separate mean value gives
  $ T_j \( x \, y_2 \, dots.h \, y_j \) = bb(E) [H \( rho_(x \, kappa d \( x \)) \) product_(i = 2)^j H \( rho_i \)] . $
  Hölder and (9.3) bound this uniformly in $x$, including approaches to the marks. At a clean point, (9.6) gives its limit as $k bb(E) product_(i = 2)^j H \( rho_i \)$, which equals the right side of (9.14) by mean value once more. ◻
]

== 10 Collision coefficients and Gaussian identification <sec:gaussian>

The preceding section applies to every subsequential true-field law. Fix one such limit $H$ and its uncentered moment functions $T_j$. The plane covariance coefficient is $v = \( 2 pi \)^2 c_(*) > 0$, as in 27. We now show that it determines all moments in $D$.

A related way to identify Gaussian pairings, by cancelling collision singularities, appears in Kenyon’s dimer-height proof #cite(label("Kenyon2001")) Lemma 3.1 and Proposition 3.2. The singularities there are computed from explicit determinant formulas. Duminil-Copin, Kozlowski, Lammers, and Manolescu use harmonicity and collision asymptotics to identify higher full-plane increment correlations from the GFF two-point function #cite(label("DCKLM2026")) Section 7.2. Here separate harmonicity determines the form of each singularity, while a stopped local coupling to the plane law determines its coefficient. The boundary traces proved in 9 then supply harmonic uniqueness in the bounded domain.

#thm([Lemma 10.1.])[
  (The only isolated singularity is logarithmic).  #emph[Fix a collision-free list $\( y \, upright(bold(z)) \)$ of interior points. In a neighborhood of $x = y$ containing none of the points of $upright(bold(z))$, 
#[#set math.equation(numbering: n => "(10.1)")
 $ T_j \( x \, y \, upright(bold(z)) \) = L \( y \, upright(bold(z)) \) log frac(1, \| x - y \|) + R \( x \; y \, upright(bold(z)) \) \, $ <eq:log-expansion>]

 where $R$ extends harmonically across $x = y$ in the first variable. The function $L$ is smooth on the parameter configuration space. On compact subsets of that space one can choose a uniform radius on which $R$, and each fixed order of its first-variable derivatives on a smaller disk, are uniformly bounded.]
] <lem:log-singularity>

#proof[
  By Proposition 9.4, Lemma 9.5, the function of $x$ is harmonic on a punctured disk and has at most polylogarithmic growth at its puncture. The polar Fourier expansion of a harmonic function there has constant angular part $a + b log r$ and, in angular mode $n gt.eq 1$, radial factors $r^n$ and $r^(- n)$. A coefficient of $r^(- n)$ would grow faster than every power of $log \( 1 \/ r \)$, so it vanishes. The remaining positive modes extend harmonically to the center. This proves (10.1). This argument can also be obtained by taking Fourier coefficients on each concentric circle and solving their radial differential equations; the growth bound kills the negative coefficients one at a time.
  There is a useful parameter formula that supplies the needed uniformity. Choose a fixed radius $a > 0$, small enough for all $\( y \, upright(bold(z)) \)$ in a parameter neighborhood. Outward differentiation in the first variable gives
  #[#set math.equation(numbering: n => "(10.2)")
   $ L \( y \, upright(bold(z)) \) = - frac(1, 2 pi) integral_(\| w - y \| = a) partial_(n_w) T_j \( w \, y \, upright(bold(z)) \) thin d s_w . $ <eq:circle-log-coefficient>]
  The integral of the derivative of the removable remainder is zero, and that of $log \( 1 \/ \| w - y \| \)$ is $- 2 pi$. Parametrize the circle by $w = y + a e^(i theta)$. The integrand is smooth in all parameters on this fixed collision-free compact set, so $L$ is smooth. Subtract the logarithmic term from the boundary values on this circle and use the Poisson formula on its disk. It gives the extension $R$ and bounds all its first-variable derivatives on every fixed smaller concentric disk, uniformly over compact parameter sets. This proves in particular the continuity of $L$ needed below, without inferring it from a nonuniform singular limit. ◻
]

#thm([Proposition 10.2.])[
  (Identification of the collision coefficient).  #emph[For $j gt.eq 2$ and distinct $\( y \, upright(bold(z)) \)$, 
#[#set math.equation(numbering: n => "(10.3)")
 $ L \( y \, upright(bold(z)) \) = frac(v, 2 pi) T_(j - 2) \( upright(bold(z)) \) . $ <eq:collision-coefficient>]

 The convention is $T_0 = 1$; no centering is made in this identity.]
] <prop:collision-coefficient>

#proof[
  #emph[A stopped comparison with the plane.] We first establish precisely the mixing statement used to examine the collision. Fix an interior center $y_0$, and fixed small spectator balls away from it. For two smooth zero-integral tests $alpha \, beta$ in disjoint bounded disks, put
  $ alpha_r \( x \) = r^(- 2) alpha \( \( x - y_0 \) \/ r \) \, #h(2em) beta_r \( x \) = r^(- 2) beta \( \( x - y_0 \) \/ r \) . $
  Their supports lie in $B \( y_0 \, C r \)$. If $F_delta$ is a product of height averages on the spectator balls, then, with a plane copy denoted by $H_delta^(upright("pl"))$,
  #[#set math.equation(numbering: n => "(10.4)")
   $ & limsup_(delta arrow.b 0) lr(|bb(E) \[ H_delta \( alpha_r \) H_delta \( beta_r \) F_delta \] - bb(E) \[ H_delta^(upright("pl")) \( alpha_r \) H_delta^(upright("pl")) \( beta_r \) \] thin bb(E) F_delta|) arrow.r 0 #h(2em) \( r arrow.b 0 \) . $ <eq:local-product-mixing>]
  The mesh limit is taken first at every fixed $r$.
  Here is the coupling argument, including the absolute exterior heights. Choose a fixed disk $B \( y_0 \, R_0 \) subset.double D$ disjoint from the spectators. In the spin representation of the true problem, $W$ is fixed on the one connected boundary path. Imposing constancy there and then its plus label leaves the $B$ marginal unchanged. The double-cut stack estimate used in 8 therefore applies in this pin-free interior disk. Search from the outside inward for a double $B$ circuit between radii of order $r^(1 \/ 2)$ and $R_0$. It fails with probability at most a positive power of $r$. On success the chosen circuit surrounds a disk of radius comparable to $r^(1 \/ 2)$, and the stopping exploration has not examined its interior.
  The absolute heights at all spectator sites can be read in this exterior. Choose the anchor on the prescribed boundary, with its known height, and join it to the spectator balls by paths avoiding $B \( y_0 \, R_0 \)$. Such paths exist after reducing $R_0$ if needed: paths in $D$ can be detoured around this interior disk. A finite family of positive-width tubes and the spectator balls supplies the same paths in sufficiently fine lattice approximations. The edge increment formula, summed from the fixed anchor, gives every height occurring in $F_delta$ using only exterior spins. Affine interpolation uses only the adjacent exterior sites. Thus revealing these observations adds no interior information.
  Conditional on the stopping circuit and all exterior spins, including $W$, its interior is the free-$W$ double-cut law. Indeed both $B$ values across every cut edge agree, so there is no constraint on $W$ across it; the stopping rule has imposed no further interior condition. The common worst-boundary coupling in the proof of 8, applied inside this circuit, now matches the spins in $B \( y_0 \, C r \)$ to those of a plane copy with failure probability at most a positive power of $r \/ r^(1 \/ 2)$. Its bound is uniform over the exposed exterior. The conditional coupling can be chosen with the plane law as its second marginal for every exterior value. That marginal is consequently independent of the exterior observations. On failure of the first search, choose the plane copy independently as well. Altogether the matching failure probability is at most $C r^gamma$ for some $gamma > 0$, in the limiting mesh regime.
  On the matching event the two zero-total height smearings agree with their plane versions. Equality of the local increments determines heights only up to one additive constant, and the zero integrals remove exactly that constant. The interpolation weights have the same zero sum. All comparison statements can first be implemented in finite free spin volumes and then passed to the plane law.
  Finally this coupling controls unbounded products. The true local smearings have $L^q$ norms at most $C_q \( 1 + \| log r \| \)^(1 \/ 2)$ by 13; the plane zero-total smearings have uniformly bounded $L^q$ norms by 14. The fixed spectator product has bounded moments of every finite order. Applying Hölder with exponent four to the two insertions, the spectator product, and the failure indicator bounds the expectation of the product discrepancy by
  #[#set math.equation(numbering: n => "(10.5)")
   $ C r^(gamma \/ 4) \( 1 + \| log r \| \) = o \( 1 \) . $ <eq:mixing-error-log>]
  For the plane term the same bound holds with no logarithmic loss. This proves (10.4). In particular we have not used an arbitrary conditional spin law after revealing absolute heights: those heights were first made measurable in the exterior of an actual stopping cut.
  #emph[Extracting the logarithmic coefficient.] Choose $alpha \, beta$ so that
  #[#set math.equation(numbering: n => "(10.6)")
   $ J = integral.double alpha \( u \) beta \( w \) log frac(1, \| u - w \|) thin d u thin d w eq.not 0 . $ <eq:nonzero-log-pairing>]
  Such tests exist even in disjoint disks. For example, take the first-coordinate derivatives of radial unit bumps about two points on a horizontal line, with sufficiently small disjoint supports. Integration by parts reduces their pairing to the corresponding mixed derivative of the log kernel averaged over the two bumps. That derivative is nonzero at their centers and keeps its sign when the supports are small. Each derivative test has integral zero.
  Use fixed disjoint radial unit mollifiers at the points of $upright(bold(z))$, and let $F$ be the product of the resulting height averages; when $j = 2$, take $F = 1$. Separate harmonicity gives $bb(E) F = T_(j - 2) \( upright(bold(z)) \)$. By 27, the mesh limit of the plane pairing in (10.4) equals $v J \/ \( 2 pi \)$. The log constant introduced by the rescaling vanishes since both tests have integral zero. Taking the mesh limit and then $r arrow.b 0$ in (10.4) therefore yields
  #[#set math.equation(numbering: n => "(10.7)")
   $ lim_(r arrow.b 0) bb(E) \[ H \( alpha_r \) H \( beta_r \) F \] = frac(v J, 2 pi) T_(j - 2) \( upright(bold(z)) \) . $ <eq:mixing-coefficient-limit>]
  We compute the same limit from 48. The two shrinking supports are disjoint and avoid the spectators. Averaging the spectator variables radially thus evaluates the moment function at $upright(bold(z))$ exactly. The expression on the left of (10.7) is
  $ integral.double alpha \( u \) beta \( w \) #scale(x: 240%, y: 240%)[\[] & L \( y_0 + r w \, upright(bold(z)) \) (log 1 / r + log frac(1, \| u - w \|))\
 & #h(17mm)  + R \( y_0 + r u \; y_0 + r w \, upright(bold(z)) \) #scale(x: 240%, y: 240%)[\]] thin d u thin d w . $
  The term containing $log \( 1 \/ r \)$ is exactly zero: for each fixed $w$ its coefficient is independent of $u$, and $integral alpha = 0$. This cancellation occurs before estimating the variation of $L$; no modulus of continuity multiplied by $log \( 1 \/ r \)$ is required. Continuity of $L$ and the disjoint supports give convergence of the remaining logarithmic term to $L \( y_0 \, upright(bold(z)) \) J$. For the remainder, subtract $R \( y_0 \; y_0 + r w \, upright(bold(z)) \)$ inside the $u$ integral. The subtracted quantity again integrates to zero, and the uniform first-variable derivative bound in 48 makes the remaining integral $O \( r \)$. The limit is therefore $L \( y_0 \, upright(bold(z)) \) J$. Comparison with (10.7) and $J eq.not 0$ proves (10.3). ◻
]

#thm([Theorem 10.3.])[
  (Gaussian moment recursion).  #emph[For distinct points $\( x \, y_1 \, dots.h \, y_(j - 1) \)$, 
#[#set math.equation(numbering: n => "(10.8)")
 $ T_j \( x \, upright(bold(y)) \) = m \( x \) T_(j - 1) \( upright(bold(y)) \) + v sum_(i = 1)^(j - 1) G_D \( x \, y_i \) T_(j - 2) \( upright(bold(y)) \\ y_i \) . $ <eq:gaussian-recursion>]

 For $j = 1$ the assertion is $T_1 = m$. These functions, as locally integrable distributions, are the moment distributions of $m + sqrt(v) thin Phi_D$, where $Phi_D$ is the zero-boundary GFF with covariance $G_D$. The limiting field $H$ has this law.]
] <thm:gaussian-moments>

#proof[
  Fix the distinct spectator points. Subtract the right side of (10.8) from its left side, and call the result $U \( x \)$. Away from the spectator points it is harmonic in $x$. The Green function convention is
  $ G_D \( x \, y \) = frac(1, 2 pi) log frac(1, \| x - y \|) + upright("a function harmonic near ") y . $
  By 49, the logarithmic coefficient at each $y_i$ cancels. Lemma 48 then shows that $U$ extends harmonically across every $y_i$. Thus it is harmonic on all of $D$.
  The boundary estimate in 47 bounds the moment function as $x$ approaches any boundary point, including a mark. The subtracted mean is bounded, and the Green terms tend to zero at the boundary. Together with removability at the finitely many interior singularities, this makes $U$ bounded in $D$. On each open boundary arc, (9.14) and the trace of $m$ give $U arrow.r 0$. Bounded harmonic uniqueness with the two exceptional points, proved in the boundary argument above, gives $U = 0$. More explicitly, compare $plus.minus U$ with $∥U∥_oo$ times a harmonic extension of a boundary function equal to one in a small neighborhood of each mark and zero outside a slightly larger neighborhood, and let those neighborhoods shrink. This proves the recursion.
  Starting from $T_0 = 1$, the recursion uniquely gives the usual partial pairing formula
  #[#set math.equation(numbering: n => "(10.9)")
   $ T_j \( x_1 \, dots.h \, x_j \) = sum_(cal(P)) product_({ a \, b } in cal(P)) v G_D \( x_a \, x_b \) product_(c in.not union.big cal(P)) m \( x_c \) \, $ <eq:partial-pairing-formula>]
  where $cal(P)$ ranges over collections of disjoint unordered pairs in ${ 1 \, dots.h \, j }$, including the empty collection. Indeed the distinguished index is either a singleton, producing the mean term, or is paired to exactly one other index, producing one term of the sum in (10.8). This is also the uncentered Gaussian moment formula. Each displayed product is locally integrable: the logarithmic Green singularities are locally integrable, and its pairs have disjoint sets of variables. By 47, agreement off diagonals is agreement of the full moment distributions. It follows that all joint smeared moments of $H$ equal those of $m + sqrt(v) thin Phi_D$.
  We include the determinacy step. For a real test $f$, let $Z = H \( f \) - integral m f$ and put $s^2 = v integral.double f \( x \) G_D \( x \, y \) f \( y \) thin d x thin d y$. The moment formula gives $bb(E) Z^(2 n) = \( 2 n - 1 \) ! ! thin s^(2 n)$ and all odd moments zero. If $s = 0$ then $Z = 0$ almost surely. Otherwise Cauchy–Schwarz gives
  $ bb(E) \| Z \|^n lt.eq \( bb(E) Z^(2 n) \)^(1 \/ 2) lt.eq s^n \( 2 n \)^(n \/ 2) . $
  Consequently $sum_n \| t \|^n bb(E) \| Z \|^n \/ n ! < oo$ for every real $t$. The exponential and characteristic-function series may be integrated term by term, and the latter is $exp \( - s^2 t^2 \/ 2 \)$. Thus $Z$ is Gaussian. Applying this argument to every real linear combination of a finite list of tests and using the Cramér–Wold criterion proves the required joint Gaussian law. Finally a countable dense collection of tests determines the Borel law in the local Sobolev space of 43. Hence the random distribution itself has the asserted law. ◻
]

#thm([Corollary 10.4.])[
  (Full convergence and the odd-height normalization).  #emph[For every $t > 1$, 
#[#set math.equation(numbering: n => "(10.10)")
 $ H_delta med arrow.r.double med m + sqrt(v) thin Phi_D \, #h(2em) H_delta - bb(E) H_delta med arrow.r.double med sqrt(v) thin Phi_D quad upright("in ") H_(upright("loc"))^(- t) \( D \) . $ <eq:integer-field-limit>]

 All finite joint test moments converge. In particular 
#[#set math.equation(numbering: n => "(10.11)")
 $ frac(h_delta - bb(E) h_delta, sigma) med arrow.r.double med Phi_D \, #h(2em) sigma = 2 sqrt(v) = 4 pi sqrt(c_(*)) > 0 . $ <eq:odd-field-limit>]

 The constant has the absolutely convergent finite-volume expression of 29; it is independent of $D \, a \, b$. The uncentered odd-height limit has mean $2 m + 1$, the harmonic extension of its prescribed values $+ 1 \, - 1$.]
] <cor:field-limit>

#proof[
  Every subsequence admits a further limit by 43, and 50 identifies every such limit with the same law. Tightness and uniqueness therefore give full convergence, with convergence of joint moments supplied by uniform integrability.
  In particular $bb(E) H_delta \( f \) arrow.r integral m f$ for each test $f$. There is also deterministic local Sobolev convergence of the means, which justifies subtracting the actual discrete expectation in the stated topology. With a cutoff and Fourier basis as in (9.2), each Fourier coefficient of $chi \( bb(E) H_delta - m \)$ tends to zero and is bounded uniformly in its index and in $delta$. For $t > 1$, the summable weights $\( 1 + \| n \|^2 \)^(- t)$ and dominated convergence show that the $H^(- t)$ norm tends to zero. Apply this to the local exhaustion and subtract this deterministic limit in the first convergence of (10.10). Finally affine interpolation preserves $h_delta = 2 H_delta + 1$ exactly. Centering removes its constant term and multiplies fluctuations by two, giving (10.11) with the stated normalization. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
